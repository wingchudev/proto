PROTOC = protoc
PLUGINS = --plugin=protoc-gen-go=./protoc-gen-go --plugin=protoc-gen-micro=./protoc-gen-micro

PROTO_MICRO_BUILD = $(PROTOC) $(PLUGINS) --go_out=paths=source_relative:. --micro_out=paths=source_relative:.
PROTO_GRPC_BUILD = $(PROTOC) $(PLUGINS) -I. --go_out=paths=source_relative,plugins=grpc:.

target ?= proto

ALL:
	$(PROTO_GRPC_BUILD) action/*.proto

micro-proto:
	$(PROTO_MICRO_BUILD) $(target)/*.proto

grpc-proto:
	$(PROTO_GRPC_BUILD) $(target)/*.proto


