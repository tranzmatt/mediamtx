BASE_IMAGE = golang:1.26-alpine3.24
GOLANGCI_LINT_IMAGE = golangci/golangci-lint:v2.13.2
NODE_IMAGE = node:24-alpine3.24
ALPINE_IMAGE = alpine:3.20
DEBIAN_IMAGE = debian:bookworm
RPI32_IMAGE = balenalib/raspberry-pi:bullseye-run-20240508
RPI64_IMAGE = balenalib/raspberrypi3-64:bullseye-run-20240429
JETSON_IMAGE = nvcr.io/nvidia/l4t-jetpack:r36.4.0

.PHONY: $(shell ls)

help:
	@echo "usage: make [action]"
	@echo ""
	@echo "available actions:"
	@echo ""
	@echo "  format           format code"
	@echo "  test             run tests"
	@echo "  test-32          run tests on a 32-bit system"
	@echo "  test-e2e         run end-to-end tests"
	@echo "  lint             run linters"
	@echo "  run              run app"
	@echo "  apidocs          generate api docs HTML"
	@echo "  binaries         build binaries for all platforms"
	@echo "  dockerimg        build local Docker image"
	@echo "                   Current: PLATFORM=$(PLATFORM), USE_FFMPEG=$(USE_FFMPEG)"
	@echo "                   Valid PLATFORM options: amd64, rpi32, rpi64, jetson"
	@echo "                   Valid USE_FFMPEG options: true, false, 1, 0"
	@echo "  dockerhub        build and push images to Docker Hub"
	@echo "  apidocs          generate API documentation"
	@echo ""

blank :=
define NL

$(blank)
endef

include scripts/*.mk
