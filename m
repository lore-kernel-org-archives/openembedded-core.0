Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0356FC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 16:41:58 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49695.1782924109478063844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 09:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=SHqoK+ny;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout04.t-online.de (Postfix) with SMTP id 75AC55D1
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 18:41:23 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.163.76]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wey02-0fgYgC0; Wed, 1 Jul 2026 18:41:22 +0200
Date: Wed, 01 Jul 2026 18:41:17 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][Patch] mesa.inc: add a workaround for rusticl
 build
To: openembedded-core@lists.openembedded.org
Message-Id: <T09IHT.SSMJ9G3A1UEP3@t-online.de>
In-Reply-To: <18BE37D920ABBAFB.114350@lists.openembedded.org>
References: <18BE37D920ABBAFB.114350@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-IIwLN4ZbqS6BOO0oyC26"
X-TOI-EXPURGATEID: 150726::1782924082-DBFFC84E-0A1D714B/0/0 CLEAN NORMAL
X-TOI-MSGID: 526503c4-17c9-4fc2-9b86-21e321dc159e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782924083; i=f_l_k@t-online.de;
	bh=SLKAE3jeP02JWEwiCHNQRNCykVzF7Jbw8fn5BDBXMbE=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=SHqoK+nyvCKz+kdI7MJ472TqacYtTQdhI94OKWfi7EVSr40ztomvA/CmReqMb4e05
	 cjDkjpeBcfcsWsUY4Ms3Tus/tZkksTlaxuMiNqof14jp/ZYXW7tKYiD3FGLNTCaIen
	 Pi9UCuuTiW0XOydh6UIemqCMk/LC2/wMLaF3SeFwN1ZwDAsePkn83Zh7bNHii4/BD+
	 PsMnQ3xhMLl2p7bjjqI3aOa3qJST4TDvBqOyXjOpQkP0FfTNjtNlZqYPgMv4C8WyJe
	 7BAxMX2YeJj6zG3k/srJR5vGFAuRrMM/fS7jkBE/NW552sbb2ar1p2DZphC4tdklR/
	 fi3Dh51dRNQ7Q==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 16:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240001

--=-IIwLN4ZbqS6BOO0oyC26
Content-Type: text/plain; charset=us-ascii; format=flowed

RFC because this is quite hacky

Am Mi, 1. Jul 2026 um 18:38:14 +02:00:00 schrieb Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org>:
> Build checks if ${STAGING_BINDIR}/clang-22 is available and runnable
> 
> | FAILED: [code=101] 
> src/gallium/frontends/rusticl/rusticl_mesa_bindings.rs 
> src/gallium/frontends/rusticl/rusticl_mesa_bindings.c
> | 
> /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/recipe-sysroot-native/usr/bin/bindgen 
> ../sources/mesa-26.1.2/src/gallium/frontends/rusticl/rusticl_mesa_bindings.h 
> --output 
> /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/gallium/frontends/rusticl/rusticl_mesa_bindings.rs 
> --wrap-unsafe-ops --raw-line '#![allow(clippy::all)]' --raw-line 
> '#![allow(improper_ctypes)]' --raw-line '#![allow(unused_unsafe)]' 
> --raw-line '#![allow(non_camel_case_types)]' --raw-line 
> '#![allow(non_snake_case)]' --raw-line 
> '#![allow(non_upper_case_globals)]' --raw-line 
> '#![allow(unsafe_op_in_unsafe_fn)]' --raw-line 
> '#![allow(unnecessary_transmutes)]' --raw-line '#![allow(warnings)]' 
> --no-convert-floats --default-enum-style rust --with-derive-partialeq 
> --with-derive-eq --with-derive-partialord --with-derive-ord 
> --with-derive-hash --with-derive-default --anon-fields-prefix anon_ 
> --use-array-pointers-in-arguments --allowlist-function 'blob_.*' 
> --allowlist-function 'disk_cache_.*' --allowlist-type float_controls 
> --allowlist-function 'mesa_.*' --allowlist-var 'OS_.*' 
> --allowlist-function 'rz?alloc_.*' --allowlist-var 'BLAKE3_.*' 
> --allowlist-function '_mesa_blake3_.*' --allowlist-function 'u_.*' 
> --allowlist-function 'util_format_.*' --allowlist-function 
> 'util_queue_.*' --allowlist-function 'util_vma_.*' 
> --allowlist-function util_get_cpu_caps --no-copy util_vma_heap 
> --no-copy util_queue --no-copy util_queue_fence --allowlist-type 
> 'cl_sampler_.*_mode' --constified-enum-module 'cl_sampler_.*_mode' 
> --allowlist-function 'clc_.*' --allowlist-type 
> clc_kernel_arg_access_qualifier --bitfield-enum 
> clc_kernel_arg_access_qualifier --allowlist-type 
> clc_kernel_arg_type_qualifier --bitfield-enum 
> clc_kernel_arg_type_qualifier --allowlist-type gl_access_qualifier 
> --bitfield-enum gl_access_qualifier --allowlist-function 'glsl_.*' 
> --allowlist-function 'nir_.*' --allowlist-var nir_debug 
> --allowlist-var 'NIR_DEBUG_.*' --bitfield-enum 
> nir_lower_int64_options --bitfield-enum nir_opt_if_options 
> --bitfield-enum nir_variable_mode --allowlist-function 
> 'should_.*_nir' --allowlist-function 'spirv_.*' --allowlist-function 
> 'pipe_.*' --allowlist-var 'PIPE_.*' --allowlist-type pipe_endian 
> --bitfield-enum pipe_map_flags --allowlist-type pipe_query_type 
> --constified-enum-module pipe_query_type --allowlist-type 
> pipe_resource_usage --bitfield-enum pipe_resource_usage 
> --allowlist-type pipe_tex_filter --constified-enum-module 
> pipe_tex_filter --allowlist-type pipe_tex_wrap 
> --constified-enum-module pipe_tex_wrap --allowlist-type pipe_swizzle 
> --constified-enum-module pipe_swizzle --allowlist-function 
> 'rusticl_.*' --allowlist-function 'std(err|out)_ptr' 
> --allowlist-function mmap --allowlist-function munmap --allowlist-var 
> 'MAP_.*' --allowlist-var 'PROT_.*' --allowlist-var 
> 'WINSYS_HANDLE_TYPE_.*' --experimental --wrap-static-fns 
> --wrap-static-fns-path 
> /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/gallium/frontends/rusticl/rusticl_mesa_bindings.c 
> --rust-target 1.96.0 --rust-edition 2021 -- -fno-builtin-malloc 
> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS 
> '-DPACKAGE_VERSION="26.1.2"' 
> '-DPACKAGE_BUGREPORT="<https://gitlab.freedesktop.org/mesa/mesa/-/issues>"' 
> -DHAVE_OPENGL=1 -DHAVE_OPENGL_ES_1=1 -DHAVE_OPENGL_ES_2=1 
> -DHAVE_CROCUS -DHAVE_I915 -DHAVE_IRIS -DHAVE_LLVMPIPE -DHAVE_NOUVEAU 
> -DHAVE_R300 -DHAVE_R600 -DHAVE_RADEONSI -DHAVE_SOFTPIPE -DHAVE_SVGA 
> -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DMESA_SYSTEM_HAS_KMS_DRM=1 
> -DVK_ENABLE_BETA_EXTENSIONS -DVIDEO_CODEC_VC1DEC=1 
> -DVIDEO_CODEC_H264DEC=1 -DVIDEO_CODEC_H264ENC=1 
> -DVIDEO_CODEC_H265DEC=1 -DVIDEO_CODEC_H265ENC=1 
> -DVIDEO_CODEC_AV1DEC=1 -DVIDEO_CODEC_AV1ENC=1 -DVIDEO_CODEC_VP9DEC=1 
> -DVIDEO_CODEC_MPEG12DEC=1 -DVIDEO_CODEC_JPEGDEC=1 -DHAVE_LIBGBM 
> -DHAVE_WAYLAND_PLATFORM -DHAVE_X11_PLATFORM 
> -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM -DHAVE_XCB_PLATFORM 
> -DUSE_LIBGLVND=0 -DHAVE_VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS 
> -DHAVE_GFX_COMPUTE -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING 
> -DGLX_USE_DRM -DGLAPI_EXPORT_PROTO_ENTRY_POINTS=0 -DALLOW_KCMP 
> -DMESA_DEBUG=0 -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32 
> -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL 
> -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS 
> -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT 
> -DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE 
> -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE___BUILTIN_ADD_OVERFLOW 
> -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BUILTIN_SUB_OVERFLOW_P 
> -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN 
> -DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE 
> -DHAVE_FUNC_ATTRIBUTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT 
> -DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FUNC_ATTRIBUTE_FORMAT 
> -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL 
> -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN 
> -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD 
> -DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY 
> -DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41 
> -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS 
> -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY 
> -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H 
> -DHAVE_CET_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H 
> -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEMP 
> -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R 
> -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV 
> -DHAVE_SYSCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC 
> -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING 
> -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L 
> -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPUS 
> -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD 
> -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM -DHAVE_LIBUDEV 
> '-DMESA_LLVM_VERSION_STRING="22.1.8"' -DLLVM_IS_SHARED=1 
> -DDRAW_LLVM_AVAILABLE=1 -DAMD_LLVM_AVAILABLE=1 -DGALLIVM_USE_ORCJIT=0 
> -DHAVE_SPIRV_TOOLS -DUSE_LIBELF -DTHREAD_SANITIZER=0 
> -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_TIMEOUT 
> -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM 
> -DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS 
> -DHAVE_LIBSENSORS=1 -DHAVE_RENDERDOC_INTEGRATION=1 -m64 
> -march=nehalem -mtune=generic -mfpmath=sse -msse4.2 
> -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat 
> -Wformat-security -Werror=format-security 
> --sysroot=/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/recipe-sysroot 
> --target=x86_64-oe-linux -D_FILE_OFFSET_BITS=64 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.2/src/gallium/include 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/gallium/include 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.2/src/gallium/auxiliary 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/gallium/auxiliary 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.2/include/. 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/include/. 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.2/src/. 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/. 
> -DNDEBUG 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.2/src/compiler/nir/. 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/compiler/nir/. 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.2/src/compiler/. 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/compiler/. 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.2/src/. 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/. 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.2/include/. 
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/include/. 
> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS 
> '-DPACKAGE_VERSION="26.1.2"' 
> '-DPACKAGE_BUGREPORT="<https://gitlab.freedesktop.org/mesa/mesa/-/issues>"' 
> -DHAVE_OPENGL=1 -DHAVE_OPENGL_ES_1=1 -DHAVE_OPENGL_ES_2=1 
> -DHAVE_CROCUS -DHAVE_I915 -DHAVE_IRIS -DHAVE_LLVMPIPE -DHAVE_NOUVEAU 
> -DHAVE_R300 -DHAVE_R600 -DHAVE_RADEONSI -DHAVE_SOFTPIPE -DHAVE_SVGA 
> -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DMESA_SYSTEM_HAS_KMS_DRM=1 
> -DVK_ENABLE_BETA_EXTENSIONS -DVIDEO_CODEC_VC1DEC=1 
> -DVIDEO_CODEC_H264DEC=1 -DVIDEO_CODEC_H264ENC=1 
> -DVIDEO_CODEC_H265DEC=1 -DVIDEO_CODEC_H265ENC=1 
> -DVIDEO_CODEC_AV1DEC=1 -DVIDEO_CODEC_AV1ENC=1 -DVIDEO_CODEC_VP9DEC=1 
> -DVIDEO_CODEC_MPEG12DEC=1 -DVIDEO_CODEC_JPEGDEC=1 -DHAVE_LIBGBM 
> -DHAVE_WAYLAND_PLATFORM -DHAVE_X11_PLATFORM 
> -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM -DHAVE_XCB_PLATFORM 
> -DUSE_LIBGLVND=0 -DHAVE_VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS 
> -DHAVE_GFX_COMPUTE -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING 
> -DGLX_USE_DRM -DGLAPI_EXPORT_PROTO_ENTRY_POINTS=0 -DALLOW_KCMP 
> -DMESA_DEBUG=0 -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32 
> -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL 
> -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS 
> -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT 
> -DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE 
> -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE___BUILTIN_ADD_OVERFLOW 
> -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BUILTIN_SUB_OVERFLOW_P 
> -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN 
> -DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE 
> -DHAVE_FUNC_ATTRIBUTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT 
> -DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FUNC_ATTRIBUTE_FORMAT 
> -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL 
> -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN 
> -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD 
> -DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY 
> -DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41 
> -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS 
> -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY 
> -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H 
> -DHAVE_CET_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H 
> -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEMP 
> -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R 
> -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV 
> -DHAVE_SYSCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC 
> -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING 
> -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L 
> -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPUS 
> -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD 
> -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM -DHAVE_LIBUDEV 
> '-DMESA_LLVM_VERSION_STRING="22.1.8"' -DLLVM_IS_SHARED=1 
> -DDRAW_LLVM_AVAILABLE=1 -DAMD_LLVM_AVAILABLE=1 -DGALLIVM_USE_ORCJIT=0 
> -DHAVE_SPIRV_TOOLS -DUSE_LIBELF -DTHREAD_SANITIZER=0 
> -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_TIMEOUT 
> -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM 
> -DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS 
> -DHAVE_LIBSENSORS=1 -DHAVE_RENDERDOC_INTEGRATION=1 -std=c11 -MD -MQ 
> ../sources/mesa-26.1.2/src/gallium/frontends/rusticl/rusticl_mesa_bindings.h 
> -MF src/gallium/frontends/rusticl/rusticl_mesa_bindings.h.d
> | panicked at 
> /usr/src/debug/bindgen-cli-native/0.72.1/sources/cargo_home/bitbake/clang-sys-1.8.1/src/support.rs:189:45:
> | called `Result::unwrap()` on an `Err` value: "could not run 
> executable 
> `/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/recipe-sysroot/usr/bin/clang-22`: 
> No such file or directory (os error 2)"
> 
> Link ${STAGING_BINDIR_NATIVE}/clang-22 to ${STAGING_BINDIR}/clang-22 
> to achieve this.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc 
> b/meta/recipes-graphics/mesa/mesa.inc
> index f8e294076a..ed95a29446 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -63,6 +63,7 @@ replace_llvm_config_path() {
> 
>  do_configure:prepend:class-target() {
>      replace_llvm_config_path
> +    ln -sf ${STAGING_BINDIR_NATIVE}/clang-22 
> ${STAGING_BINDIR}/clang-22
>  }
> 
>  do_configure:prepend:class-nativesdk() {
> --
> 2.54.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240000): 
> <https://lists.openembedded.org/g/openembedded-core/message/240000>
> Mute This Topic: <https://lists.openembedded.org/mt/120068848/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-IIwLN4ZbqS6BOO0oyC26
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>RFC because this is quite hacky</d=
iv></div><div id=3D"geary-quote" dir=3D"auto"><br>Am Mi, 1. Jul 2026 um 18:=
38:14 +02:00:00 schrieb Markus Volk via lists.openembedded.org &lt;f_l_k=3D=
t-online.de@lists.openembedded.org&gt;:<br><blockquote type=3D"cite"><div c=
lass=3D"plaintext" style=3D"white-space: break-spaces;">Build checks if ${S=
TAGING_BINDIR}/clang-22 is available and runnable

| FAILED: [code=3D101] src/gallium/frontends/rusticl/rusticl_mesa_bindings.=
rs src/gallium/frontends/rusticl/rusticl_mesa_bindings.c
| /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mes=
a/26.1.2/recipe-sysroot-native/usr/bin/bindgen ../sources/mesa-26.1.2/src/g=
allium/frontends/rusticl/rusticl_mesa_bindings.h --output /home/flk/bitbake=
/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/=
gallium/frontends/rusticl/rusticl_mesa_bindings.rs --wrap-unsafe-ops --raw-=
line '#![allow(clippy::all)]' --raw-line '#![allow(improper_ctypes)]' --raw=
-line '#![allow(unused_unsafe)]' --raw-line '#![allow(non_camel_case_types)=
]' --raw-line '#![allow(non_snake_case)]' --raw-line '#![allow(non_upper_ca=
se_globals)]' --raw-line '#![allow(unsafe_op_in_unsafe_fn)]' --raw-line '#!=
[allow(unnecessary_transmutes)]' --raw-line '#![allow(warnings)]' --no-conv=
ert-floats --default-enum-style rust --with-derive-partialeq --with-derive-=
eq --with-derive-partialord --with-derive-ord --with-derive-hash --with-der=
ive-default --anon-fields-prefix anon_ --use-array-pointers-in-arguments --=
allowlist-function 'blob_.*' --allowlist-function 'disk_cache_.*' --allowli=
st-type float_controls --allowlist-function 'mesa_.*' --allowlist-var 'OS_.=
*' --allowlist-function 'rz?alloc_.*' --allowlist-var 'BLAKE3_.*' --allowli=
st-function '_mesa_blake3_.*' --allowlist-function 'u_.*' --allowlist-funct=
ion 'util_format_.*' --allowlist-function 'util_queue_.*' --allowlist-funct=
ion 'util_vma_.*' --allowlist-function util_get_cpu_caps --no-copy util_vma=
_heap --no-copy util_queue --no-copy util_queue_fence --allowlist-type 'cl_=
sampler_.*_mode' --constified-enum-module 'cl_sampler_.*_mode' --allowlist-=
function 'clc_.*' --allowlist-type clc_kernel_arg_access_qualifier --bitfie=
ld-enum clc_kernel_arg_access_qualifier --allowlist-type clc_kernel_arg_typ=
e_qualifier --bitfield-enum clc_kernel_arg_type_qualifier --allowlist-type =
gl_access_qualifier --bitfield-enum gl_access_qualifier --allowlist-functio=
n 'glsl_.*' --allowlist-function 'nir_.*' --allowlist-var nir_debug --allow=
list-var 'NIR_DEBUG_.*' --bitfield-enum nir_lower_int64_options --bitfield-=
enum nir_opt_if_options --bitfield-enum nir_variable_mode --allowlist-funct=
ion 'should_.*_nir' --allowlist-function 'spirv_.*' --allowlist-function 'p=
ipe_.*' --allowlist-var 'PIPE_.*' --allowlist-type pipe_endian --bitfield-e=
num pipe_map_flags --allowlist-type pipe_query_type --constified-enum-modul=
e pipe_query_type --allowlist-type pipe_resource_usage --bitfield-enum pipe=
_resource_usage --allowlist-type pipe_tex_filter --constified-enum-module p=
ipe_tex_filter --allowlist-type pipe_tex_wrap --constified-enum-module pipe=
_tex_wrap --allowlist-type pipe_swizzle --constified-enum-module pipe_swizz=
le --allowlist-function 'rusticl_.*' --allowlist-function 'std(err|out)_ptr=
' --allowlist-function mmap --allowlist-function munmap --allowlist-var 'MA=
P_.*' --allowlist-var 'PROT_.*' --allowlist-var 'WINSYS_HANDLE_TYPE_.*' --e=
xperimental --wrap-static-fns --wrap-static-fns-path /home/flk/bitbake/bitb=
ake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/galli=
um/frontends/rusticl/rusticl_mesa_bindings.c --rust-target 1.96.0 --rust-ed=
ition 2021 -- -fno-builtin-malloc -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_=
MACROS -D__STDC_LIMIT_MACROS '-DPACKAGE_VERSION=3D"26.1.2"' '-DPACKAGE_BUGR=
EPORT=3D"<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues">http=
s://gitlab.freedesktop.org/mesa/mesa/-/issues</a>"' -DHAVE_OPENGL=3D1 -DHAV=
E_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_CROCUS -DHAVE_I915 -DHAVE_I=
RIS -DHAVE_LLVMPIPE -DHAVE_NOUVEAU -DHAVE_R300 -DHAVE_R600 -DHAVE_RADEONSI =
-DHAVE_SOFTPIPE -DHAVE_SVGA -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DMESA_S=
YSTEM_HAS_KMS_DRM=3D1 -DVK_ENABLE_BETA_EXTENSIONS -DVIDEO_CODEC_VC1DEC=3D1 =
-DVIDEO_CODEC_H264DEC=3D1 -DVIDEO_CODEC_H264ENC=3D1 -DVIDEO_CODEC_H265DEC=
=3D1 -DVIDEO_CODEC_H265ENC=3D1 -DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1EN=
C=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO_CODEC_MPEG12DEC=3D1 -DVIDEO_CODEC_JP=
EGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND_PLATFORM -DHAVE_X11_PLATFORM -DHAVE_=
SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=
=3D0 -DHAVE_VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS -DHAVE_GFX_COMPUTE -DGLX=
_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EXPORT_PRO=
TO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_CACHE -DH=
AVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE_=
__BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILT=
IN_FFS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_PO=
PCOUNTLL -DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -=
DHAVE___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BUILT=
IN_SUB_OVERFLOW_P -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN=
 -DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIB=
UTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_W=
EAK -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_A=
TTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_=
NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_F=
UNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN=
 -D_GNU_SOURCE -DUSE_SSE41 -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMI=
C_BUILTINS -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY -DHAV=
E_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_CET_=
H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -=
DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRT=
OK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -DHAVE_SY=
SCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATION_N=
AME -DHAVE_ISSIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_ST=
RTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPUS=
 -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_S=
ETAFFINITY -DHAVE_LIBDRM -DHAVE_LIBUDEV '-DMESA_LLVM_VERSION_STRING=3D"22.1=
.8"' -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D=
1 -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF -DTHREAD_SANITIZ=
ER=3D0 -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_TIMEOUT -DHAVE_WL_CREA=
TE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM -DHAVE_DRI -DHAVE_DRI2 -DHA=
VE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_LIBSENSORS=3D1 -DHAVE_RENDERD=
OC_INTEGRATION=3D1 -m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Dsse -m=
sse4.2 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat=
-security -Werror=3Dformat-security --sysroot=3D/home/flk/bitbake/bitbake-b=
uilds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/recipe-sysroot --tar=
get=3Dx86_64-oe-linux -D_FILE_OFFSET_BITS=3D64 -I/home/flk/bitbake/bitbake-=
builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.2=
/src/gallium/include -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/c=
orei7-64-oe-linux/mesa/26.1.2/build/src/gallium/include -I/home/flk/bitbake=
/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/me=
sa-26.1.2/src/gallium/auxiliary -I/home/flk/bitbake/bitbake-builds/oe/build=
/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/gallium/auxiliary -I/hom=
e/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1=
.2/sources/mesa-26.1.2/include/. -I/home/flk/bitbake/bitbake-builds/oe/buil=
d/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/include/. -I/home/flk/bitba=
ke/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/=
mesa-26.1.2/src/. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/core=
i7-64-oe-linux/mesa/26.1.2/build/src/. -DNDEBUG -I/home/flk/bitbake/bitbake=
-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.=
2/src/compiler/nir/. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/c=
orei7-64-oe-linux/mesa/26.1.2/build/src/compiler/nir/. -I/home/flk/bitbake/=
bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mes=
a-26.1.2/src/compiler/. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/wor=
k/corei7-64-oe-linux/mesa/26.1.2/build/src/compiler/. -I/home/flk/bitbake/b=
itbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa=
-26.1.2/src/. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-6=
4-oe-linux/mesa/26.1.2/build/src/. -I/home/flk/bitbake/bitbake-builds/oe/bu=
ild/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.2/include/. -=
I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa=
/26.1.2/build/include/. -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D_=
_STDC_LIMIT_MACROS '-DPACKAGE_VERSION=3D"26.1.2"' '-DPACKAGE_BUGREPORT=3D"<=
a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issues">https://gitlab=
.freedesktop.org/mesa/mesa/-/issues</a>"' -DHAVE_OPENGL=3D1 -DHAVE_OPENGL_E=
S_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_CROCUS -DHAVE_I915 -DHAVE_IRIS -DHAVE=
_LLVMPIPE -DHAVE_NOUVEAU -DHAVE_R300 -DHAVE_R600 -DHAVE_RADEONSI -DHAVE_SOF=
TPIPE -DHAVE_SVGA -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DMESA_SYSTEM_HAS_=
KMS_DRM=3D1 -DVK_ENABLE_BETA_EXTENSIONS -DVIDEO_CODEC_VC1DEC=3D1 -DVIDEO_CO=
DEC_H264DEC=3D1 -DVIDEO_CODEC_H264ENC=3D1 -DVIDEO_CODEC_H265DEC=3D1 -DVIDEO=
_CODEC_H265ENC=3D1 -DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D1 -DVIDE=
O_CODEC_VP9DEC=3D1 -DVIDEO_CODEC_MPEG12DEC=3D1 -DVIDEO_CODEC_JPEGDEC=3D1 -D=
HAVE_LIBGBM -DHAVE_WAYLAND_PLATFORM -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_=
PLATFORM -DHAVE_DRM_PLATFORM -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DHAVE_=
VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS -DHAVE_GFX_COMPUTE -DGLX_INDIRECT_RE=
NDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EXPORT_PROTO_ENTRY_POI=
NTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_CACHE -DHAVE___BUILTI=
N_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CL=
ZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS -DHAV=
E___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL -DH=
AVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE___BUIL=
TIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BUILTIN_SUB_OVERF=
LOW_P -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC=
_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED -=
DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_F=
UNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RET=
URNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN -DH=
AVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_FUNC_ATTRIBUT=
E_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_SOUR=
CE -DUSE_SSE41 -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS -=
DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTE=
X_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_CET_H -DHAVE_POL=
L_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTE=
MP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R -DHAVE_=
GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -DHAVE_SYSCONF -DHAVE=
_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_I=
SSIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L -DHAV=
E_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPUS -DHAVE_ZLIB=
 -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY -=
DHAVE_LIBDRM -DHAVE_LIBUDEV '-DMESA_LLVM_VERSION_STRING=3D"22.1.8"' -DLLVM_=
IS_SHARED=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1 -DGALLIVM_=
USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF -DTHREAD_SANITIZER=3D0 -DWL_=
HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_TIMEOUT -DHAVE_WL_CREATE_QUEUE_WIT=
H_NAME -DHAVE_OPENMP -DHAVE_X11_DRM -DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPL=
ICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_LIBSENSORS=3D1 -DHAVE_RENDERDOC_INTEGRATI=
ON=3D1 -std=3Dc11 -MD -MQ ../sources/mesa-26.1.2/src/gallium/frontends/rust=
icl/rusticl_mesa_bindings.h -MF src/gallium/frontends/rusticl/rusticl_mesa_=
bindings.h.d
| panicked at /usr/src/debug/bindgen-cli-native/0.72.1/sources/cargo_home/b=
itbake/clang-sys-1.8.1/src/support.rs:189:45:
| called `Result::unwrap()` on an `Err` value: "could not run executable `/=
home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/2=
6.1.2/recipe-sysroot/usr/bin/clang-22`: No such file or directory (os error=
 2)"

Link ${STAGING_BINDIR_NATIVE}/clang-22 to ${STAGING_BINDIR}/clang-22 to ach=
ieve this.

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 meta/recipes-graphics/mesa/mesa.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc
index f8e294076a..ed95a29446 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -63,6 +63,7 @@ replace_llvm_config_path() {
=20
 do_configure:prepend:class-target() {
     replace_llvm_config_path
+    ln -sf ${STAGING_BINDIR_NATIVE}/clang-22 ${STAGING_BINDIR}/clang-22
 }
=20
 do_configure:prepend:class-nativesdk() {
<div>--=20
</div>2.54.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#240000): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240000">https://lists.openembedded.org/g/openembedd=
ed-core/message/240000</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120068848/361=
8223">https://lists.openembedded.org/mt/120068848/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-IIwLN4ZbqS6BOO0oyC26--


