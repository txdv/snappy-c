const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const static_library = b.addStaticLibrary(.{
        .name = "static_library",
        .target = target,
        .optimize = optimize,
    });

    static_library.installHeader("snappy.h", ".");

    static_library.addCSourceFiles(.{
        .files = &.{
            "map.c",
            "snappy.c",
            "util.c",
        },
    });
    b.installArtifact(static_library);
}
