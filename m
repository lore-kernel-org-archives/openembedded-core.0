Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8F5C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 14:43:02 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.94683.1783089772988438890
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 07:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nTEj5uUo;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66628618509so874073d50.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 07:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783089772; cv=none;
        d=google.com; s=arc-20260327;
        b=ZTd+jLLailCxFtiKw9dpu77V7KdKmsCeQve3z7+y+IVR6TNo2CyamWQHIZ/t64QqxH
         ugbIKmeYDWPKdeavB/1SI4eZWf0Rfa9WbQtjRZfyl6R9fyhZ5Ly9isaKjSW50aeKIvrF
         KiCbMsF7jufBuST4V4o9GyHi93Edb+iL7sp4/IR6rrTYmg6dYv+PGn9oulQ4pVLxacr1
         RaZ7Z7zPn08TkrbswSYVY29l0n18tFlZBGetJ/3tkRaEswRphh2xQ0JGpW56SMh7sSKl
         WQ7GtqSGB2UZzlwZT+xdanSaQ6TAKzU8iJcDZWoA7uIiaPPEzctuyDbdPcy9lyoxntB6
         PgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Teg5qSc1eiH2WhL2jGUqr2M7GgNTtbnft2VNfYnTGYQ=;
        fh=Govd6OS4/lm7lwED272RsA/Y+c28ZzZgreMfeGIImBM=;
        b=MrBJuDdOtBx1S3Zghp0jeAA9hUGKyeejUfqu+s16poRiW5JycXa19MQ2uv9Zin3UW4
         ah7t9PNdUvD6wFQvkg0pCcDi+cA/ekg1fQdJl+vKEH+9xEBPz7cLruf6gTwmm9lKuwn5
         6va6HpwvbHzS1pLlXe3rmgdjMcV3W/CF+oBs9MOcCR8E8AaSFCdlNbjayvlK+XoUy9IP
         UowgeMXnN3Ha4rJAZkQTdE3TotS5ArzFtt1jRQN6vmyqVZyB/dxOpYW3waXgHayJ1He1
         3au8hqKGQyhQgNFmae1oHB4Ju34JgfKPq89fL3bXqhJJ3IqC6QgA8q7QQtbQlerwZuLJ
         8Jdw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783089772; x=1783694572; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Teg5qSc1eiH2WhL2jGUqr2M7GgNTtbnft2VNfYnTGYQ=;
        b=nTEj5uUoLPswBJUNcTWuNJyGsErpNHHpu20ej2Obbi3GWIheaVjJGiSP+rrzZ/3VMM
         zBbr9w6ql3zWE5aiI6jiFgN+70D9eqsRVO9VSJ/+ru2VM+D2B9DNumb9qwjJCw3wkuWE
         25GEmNtGDShM5fPlouU5ym9mnC1eCdQ357iL27gfLu6aopWbf9tG2TKKJhOLrpOo3yOL
         bAWVUrI6NdGdj6sGguqqaxbOQMGbLBqD5ORfuj+s87LxvWT6zy8vr77iak9MydAQ9AGM
         BJbofZZU0vMFIkhKJajAFDJ37uzcmUixgGXEYyQ3KfWYYFksQIoiHbizJf8IKHNBZ0fc
         9hKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783089772; x=1783694572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Teg5qSc1eiH2WhL2jGUqr2M7GgNTtbnft2VNfYnTGYQ=;
        b=O0vbxrI1Cf256lqVltM047d/6EQwwzGs5JDItnofeLxCjwP3Y+muCYH26tMecUdaxW
         ZMfbuhghMLVTGqgxL2/FBP4J6sRXCkI0yJRbe67n7juwq9W+wuHuqbRVHpOBWyWEXACq
         qVOJcVk7g/izOpmNGOOC6Ze2I1hFFPpmPoMXG4tgGPiD4mZEXwTVMBWiJu3mKo/ZJxlG
         m0If3+rz5hNyZB/OCIy6jhzu2XweXTrrjIaPAUItV/VjKwvADy9WOjpCLJOTfPsUmJ89
         hrsJdwkrwRA8yPm6fidqd2oK/OlrOUNKMDQ3uxvlm4jcUeN6ebGxbL3lwXZH4qes4IrP
         gT9w==
X-Gm-Message-State: AOJu0Yyt2wtjxs7vVtGWtEHWieFsWLwt/xufIJrGZqsokVHa+Qa8XRwI
	0sRYjwjKXc+YSnbSSGF6yG4fFaaA1SZMxyzfbu6tGCEFKAjuX3aREsldA3W0ZKLCgW2vGObOLnS
	CFPuw0+DuPVojCS5nfHYi3AtHqESyGeA=
X-Gm-Gg: AfdE7cm0w+P/A4N2S9ZeaN/uVuLPYh2cYlaz/SpAsLMKz14UwY6Q72aQ/AcxoCSidtx
	JLDj02n71t7Ns3kPTRrjAWqqXVVZvwT5I0SqjUzkviw+Uy4/P5r+vQUiWUEBTlaiCODVlT1jnri
	Hlufx/vLSlGqfb7hbG2esQqCwEbjXfzKF+7p2iEL8Z/oPVUr8qIGaZuL6BOxpQTqJYrWOGg8cU4
	RlLyTkboHbbfA7suPitalXlLGMl216SVxfJWPUd8SSV9G9qS9bSbWhVxwUVkXVJY5ivF15dp/UX
	gDPejylpSeewJU9qMouZ/LhR/lfv4NpZVpYtp+WovhN8ah9xGugUik3PCTS10F5rcXRXG52bRkk
	r2rKI8bdUpDQzSyMvz14LZNksaXf9NzxcWZgdu827G2iIqEzfq7BXDLdAnalKXS+2LRlgVKKuck
	+/KwBN
X-Received: by 2002:a05:690e:286:b0:664:6d12:1f3b with SMTP id
 956f58d0204a3-66650cabdbamr134665d50.3.1783089771793; Fri, 03 Jul 2026
 07:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260701163814.1290027-1-f_l_k@t-online.de>
In-Reply-To: <20260701163814.1290027-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Jul 2026 07:42:39 -0700
X-Gm-Features: AVVi8CeJD0TykQ9Cb2EbpKw-vKL25F1MbCDGR0-h6FUqbt0OrncTP0d5_JNGIMc
Message-ID: <CAMKF1sprX0AD4zJwbC1uBNLzdcBsC+oRDZM15ZmdP3iwtnx5qA@mail.gmail.com>
Subject: Re: [RFC][oe-core][Patch] mesa.inc: add a workaround for rusticl build
To: Markus Volk <f_l_k@t-online.de>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007350010655b5f0c6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 14:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240118

--0000000000007350010655b5f0c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

Hardcoding the LLVM version like this is fragile. We should look for a more
robust way to handle the clang dependency that doesn't rely on a specific
version number in the path.

Best regards,

Khem Raj


On Wed, Jul 1, 2026, 9:38=E2=80=AFAM Markus Volk via lists.openembedded.org=
 <f_l_k=3D
t-online.de@lists.openembedded.org> wrote:

> Build checks if ${STAGING_BINDIR}/clang-22 is available and runnable
>
> | FAILED: [code=3D101]
> src/gallium/frontends/rusticl/rusticl_mesa_bindings.rs
> src/gallium/frontends/rusticl/rusticl_mesa_bindings.c
> |
> /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mes=
a/26.1.2/recipe-sysroot-native/usr/bin/bindgen
> ../sources/mesa-26.1.2/src/gallium/frontends/rusticl/rusticl_mesa_binding=
s.h
> --output
> /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mes=
a/26.1.2/build/src/gallium/frontends/rusticl/rusticl_mesa_bindings.rs
> --wrap-unsafe-ops --raw-line '#![allow(clippy::all)]' --raw-line
> '#![allow(improper_ctypes)]' --raw-line '#![allow(unused_unsafe)]'
> --raw-line '#![allow(non_camel_case_types)]' --raw-line
> '#![allow(non_snake_case)]' --raw-line '#![allow(non_upper_case_globals)]=
'
> --raw-line '#![allow(unsafe_op_in_unsafe_fn)]' --raw-line
> '#![allow(unnecessary_transmutes)]' --raw-line '#![allow(warnings)]'
> --no-convert-floats --default-enum-style rust --with-derive-partialeq
> --with-derive-eq --with-derive-partialord --with-derive-ord
> --with-derive-hash --with-derive-default --anon-fields-prefix anon_
> --use-array-pointers-in-arguments --allowlist-function 'blob_.*'
> --allowlist-function 'disk_cache_.*' --allowlist-type float_controls
> --allowlist-function 'mesa_.*' --allowlist-var 'OS_.*' --allowlist-functi=
on
> 'rz?alloc_.*' --allowlist-var 'BLAKE3_.*' --allowlist-function
> '_mesa_blake3_.*' --allowlist-function 'u_.*' --allowlist-function
> 'util_format_.*' --allowlist-function 'util_queue_.*' --allowlist-functio=
n
> 'util_vma_.*' --allowlist-function util_get_cpu_caps --no-copy
> util_vma_heap --no-copy util_queue --no-copy util_queue_fence
> --allowlist-type 'cl_sampler_.*_mode' --constified-enum-module
> 'cl_sampler_.*_mode' --allowlist-function 'clc_.*' --allowlist-type
> clc_kernel_arg_access_qualifier --bitfield-enum
> clc_kernel_arg_access_qualifier --allowlist-type
> clc_kernel_arg_type_qualifier --bitfield-enum clc_kernel_arg_type_qualifi=
er
> --allowlist-type gl_access_qualifier --bitfield-enum gl_access_qualifier
> --allowlist-function 'glsl_.*' --allowlist-function 'nir_.*'
> --allowlist-var nir_debug --allowlist-var 'NIR_DEBUG_.*' --bitfield-enum
> nir_lower_int64_options --bitfield-enum nir_opt_if_options --bitfield-enu=
m
> nir_variable_mode --allowlist-function 'should_.*_nir' --allowlist-functi=
on
> 'spirv_.*' --allowlist-function 'pipe_.*' --allowlist-var 'PIPE_.*'
> --allowlist-type pipe_endian --bitfield-enum pipe_map_flags
> --allowlist-type pipe_query_type --constified-enum-module pipe_query_type
> --allowlist-type pipe_resource_usage --bitfield-enum pipe_resource_usage
> --allowlist-type pipe_tex_filter --constified-enum-module pipe_tex_filter
> --allowlist-type pipe_tex_wrap --constified-enum-module pipe_tex_wrap
> --allowlist-type pipe_swizzle --constified-enum-module pipe_swizzle
> --allowlist-function 'rusticl_.*' --allowlist-function 'std(err|out)_ptr'
> --allowlist-function mmap --allowlist-function munmap --allowlist-var
> 'MAP_.*' --allowlist-var 'PROT_.*' --allowlist-var 'WINSYS_HANDLE_TYPE_.*=
'
> --experimental --wrap-static-fns --wrap-static-fns-path
> /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mes=
a/26.1.2/build/src/gallium/frontends/rusticl/rusticl_mesa_bindings.c
> --rust-target 1.96.0 --rust-edition 2021 -- -fno-builtin-malloc
> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
> '-DPACKAGE_VERSION=3D"26.1.2"' '-DPACKAGE_BUGREPORT=3D"
> https://gitlab.freedesktop.org/mesa/mesa/-/issues"' -DHAVE_OPENGL=3D1
> -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_CROCUS -DHAVE_I915
> -DHAVE_IRIS -DHAVE_LLVMPIPE -DHAVE_NOUVEAU -DHAVE_R300 -DHAVE_R600
> -DHAVE_RADEONSI -DHAVE_SOFTPIPE -DHAVE_SVGA -DHAVE_VIRGL -DHAVE_ZINK
> -DHAVE_SWRAST -DMESA_SYSTEM_HAS_KMS_DRM=3D1 -DVK_ENABLE_BETA_EXTENSIONS
> -DVIDEO_CODEC_VC1DEC=3D1 -DVIDEO_CODEC_H264DEC=3D1 -DVIDEO_CODEC_H264ENC=
=3D1
> -DVIDEO_CODEC_H265DEC=3D1 -DVIDEO_CODEC_H265ENC=3D1 -DVIDEO_CODEC_AV1DEC=
=3D1
> -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO_CODEC_MPEG12DEC=
=3D1
> -DVIDEO_CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND_PLATFORM
> -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM
> -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0
> -DHAVE_VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS -DHAVE_GFX_COMPUTE
> -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM
> -DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0
> -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64
> -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ
> -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL
> -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL
> -DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P
> -DHAVE___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P
> -DHAVE___BUILTIN_SUB_OVERFLOW_P -DHAVE_FUNC_ATTRIBUTE_CONST
> -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC
> -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED
> -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK
> -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED
> -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS
> -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE
> -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT12=
8
> -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41
> -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS
> -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY
> -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H
> -DHAVE_CET_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H
> -DHAVE_STRTOF -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R
> -DHAVE_FLOCK -DHAVE_STRTOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE
> -DHAVE_SECURE_GETENV -DHAVE_SYSCONF -DHAVE_GNU_QSORT_R
> -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING
> -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L -DHAVE_DLADDR
> -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPUS -DHAVE_ZLIB
> -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY
> -DHAVE_LIBDRM -DHAVE_LIBUDEV '-DMESA_LLVM_VERSION_STRING=3D"22.1.8"'
> -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1
> -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF -DTHREAD_SANITIZ=
ER=3D0
> -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_TIMEOUT
> -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM -DHAVE_DRI
> -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_LIBSENSORS=
=3D1
> -DHAVE_RENDERDOC_INTEGRATION=3D1 -m64 -march=3Dnehalem -mtune=3Dgeneric
> -mfpmath=3Dsse -msse4.2 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D=
2
> -Wformat -Wformat-security -Werror=3Dformat-security
> --sysroot=3D/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-=
oe-linux/mesa/26.1.2/recipe-sysroot
> --target=3Dx86_64-oe-linux -D_FILE_OFFSET_BITS=3D64
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/sources/mesa-26.1.2/src/gallium/include
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/build/src/gallium/include
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/sources/mesa-26.1.2/src/gallium/auxiliary
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/build/src/gallium/auxiliary
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/sources/mesa-26.1.2/include/.
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/build/include/.
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/sources/mesa-26.1.2/src/.
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/build/src/.
> -DNDEBUG
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/sources/mesa-26.1.2/src/compiler/nir/.
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/build/src/compiler/nir/.
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/sources/mesa-26.1.2/src/compiler/.
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/build/src/compiler/.
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/sources/mesa-26.1.2/src/.
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/build/src/.
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/sources/mesa-26.1.2/include/.
> -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/build/include/.
> -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
> '-DPACKAGE_VERSION=3D"26.1.2"' '-DPACKAGE_BUGREPORT=3D"
> https://gitlab.freedesktop.org/mesa/mesa/-/issues"' -DHAVE_OPENGL=3D1
> -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_CROCUS -DHAVE_I915
> -DHAVE_IRIS -DHAVE_LLVMPIPE -DHAVE_NOUVEAU -DHAVE_R300 -DHAVE_R600
> -DHAVE_RADEONSI -DHAVE_SOFTPIPE -DHAVE_SVGA -DHAVE_VIRGL -DHAVE_ZINK
> -DHAVE_SWRAST -DMESA_SYSTEM_HAS_KMS_DRM=3D1 -DVK_ENABLE_BETA_EXTENSIONS
> -DVIDEO_CODEC_VC1DEC=3D1 -DVIDEO_CODEC_H264DEC=3D1 -DVIDEO_CODEC_H264ENC=
=3D1
> -DVIDEO_CODEC_H265DEC=3D1 -DVIDEO_CODEC_H265ENC=3D1 -DVIDEO_CODEC_AV1DEC=
=3D1
> -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO_CODEC_MPEG12DEC=
=3D1
> -DVIDEO_CODEC_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND_PLATFORM
> -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM
> -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0
> -DHAVE_VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS -DHAVE_GFX_COMPUTE
> -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM
> -DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0
> -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64
> -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ
> -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS -DHAVE___BUILTIN_FFSLL
> -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL
> -DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P
> -DHAVE___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P
> -DHAVE___BUILTIN_SUB_OVERFLOW_P -DHAVE_FUNC_ATTRIBUTE_CONST
> -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC
> -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED
> -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK
> -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED
> -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS
> -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE
> -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT12=
8
> -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41
> -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS
> -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY
> -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H
> -DHAVE_CET_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H
> -DHAVE_STRTOF -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R
> -DHAVE_FLOCK -DHAVE_STRTOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE
> -DHAVE_SECURE_GETENV -DHAVE_SYSCONF -DHAVE_GNU_QSORT_R
> -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING
> -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L -DHAVE_DLADDR
> -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPUS -DHAVE_ZLIB
> -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY
> -DHAVE_LIBDRM -DHAVE_LIBUDEV '-DMESA_LLVM_VERSION_STRING=3D"22.1.8"'
> -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=3D1
> -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF -DTHREAD_SANITIZ=
ER=3D0
> -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_TIMEOUT
> -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM -DHAVE_DRI
> -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_LIBSENSORS=
=3D1
> -DHAVE_RENDERDOC_INTEGRATION=3D1 -std=3Dc11 -MD -MQ
> ../sources/mesa-26.1.2/src/gallium/frontends/rusticl/rusticl_mesa_binding=
s.h
> -MF src/gallium/frontends/rusticl/rusticl_mesa_bindings.h.d
> | panicked at
> /usr/src/debug/bindgen-cli-native/0.72.1/sources/cargo_home/bitbake/clang=
-sys-1.8.1/src/support.rs:189:45:
> | called `Result::unwrap()` on an `Err` value: "could not run executable
> `/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/me=
sa/26.1.2/recipe-sysroot/usr/bin/clang-22`:
> No such file or directory (os error 2)"
>
> Link ${STAGING_BINDIR_NATIVE}/clang-22 to ${STAGING_BINDIR}/clang-22 to
> achieve this.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
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
> +    ln -sf ${STAGING_BINDIR_NATIVE}/clang-22 ${STAGING_BINDIR}/clang-22
>  }
>
>  do_configure:prepend:class-nativesdk() {
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240000):
> https://lists.openembedded.org/g/openembedded-core/message/240000
> Mute This Topic: https://lists.openembedded.org/mt/120068848/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007350010655b5f0c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Markus,<br><br>Hardcoding the LLVM version like this i=
s fragile. We should look for a more robust way to handle the clang depende=
ncy that doesn&#39;t rely on a specific version number in the path.<br><br>=
Best regards,<br><br>Khem Raj<div><br></div></div><br><div class=3D"gmail_q=
uote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, J=
ul 1, 2026, 9:38=E2=80=AFAM Markus Volk via <a href=3D"http://lists.openemb=
edded.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-onlin=
e.de@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Build checks=
 if ${STAGING_BINDIR}/clang-22 is available and runnable<br>
<br>
| FAILED: [code=3D101] src/gallium/frontends/rusticl/rusticl_mesa_bindings.=
rs src/gallium/frontends/rusticl/rusticl_mesa_bindings.c<br>
| /home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mes=
a/26.1.2/recipe-sysroot-native/usr/bin/bindgen ../sources/mesa-26.1.2/src/g=
allium/frontends/rusticl/rusticl_mesa_bindings.h --output /home/flk/bitbake=
/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/=
gallium/frontends/rusticl/rusticl_mesa_bindings.rs --wrap-unsafe-ops --raw-=
line &#39;#![allow(clippy::all)]&#39; --raw-line &#39;#![allow(improper_cty=
pes)]&#39; --raw-line &#39;#![allow(unused_unsafe)]&#39; --raw-line &#39;#!=
[allow(non_camel_case_types)]&#39; --raw-line &#39;#![allow(non_snake_case)=
]&#39; --raw-line &#39;#![allow(non_upper_case_globals)]&#39; --raw-line &#=
39;#![allow(unsafe_op_in_unsafe_fn)]&#39; --raw-line &#39;#![allow(unnecess=
ary_transmutes)]&#39; --raw-line &#39;#![allow(warnings)]&#39; --no-convert=
-floats --default-enum-style rust --with-derive-partialeq --with-derive-eq =
--with-derive-partialord --with-derive-ord --with-derive-hash --with-derive=
-default --anon-fields-prefix anon_ --use-array-pointers-in-arguments --all=
owlist-function &#39;blob_.*&#39; --allowlist-function &#39;disk_cache_.*&#=
39; --allowlist-type float_controls --allowlist-function &#39;mesa_.*&#39; =
--allowlist-var &#39;OS_.*&#39; --allowlist-function &#39;rz?alloc_.*&#39; =
--allowlist-var &#39;BLAKE3_.*&#39; --allowlist-function &#39;_mesa_blake3_=
.*&#39; --allowlist-function &#39;u_.*&#39; --allowlist-function &#39;util_=
format_.*&#39; --allowlist-function &#39;util_queue_.*&#39; --allowlist-fun=
ction &#39;util_vma_.*&#39; --allowlist-function util_get_cpu_caps --no-cop=
y util_vma_heap --no-copy util_queue --no-copy util_queue_fence --allowlist=
-type &#39;cl_sampler_.*_mode&#39; --constified-enum-module &#39;cl_sampler=
_.*_mode&#39; --allowlist-function &#39;clc_.*&#39; --allowlist-type clc_ke=
rnel_arg_access_qualifier --bitfield-enum clc_kernel_arg_access_qualifier -=
-allowlist-type clc_kernel_arg_type_qualifier --bitfield-enum clc_kernel_ar=
g_type_qualifier --allowlist-type gl_access_qualifier --bitfield-enum gl_ac=
cess_qualifier --allowlist-function &#39;glsl_.*&#39; --allowlist-function =
&#39;nir_.*&#39; --allowlist-var nir_debug --allowlist-var &#39;NIR_DEBUG_.=
*&#39; --bitfield-enum nir_lower_int64_options --bitfield-enum nir_opt_if_o=
ptions --bitfield-enum nir_variable_mode --allowlist-function &#39;should_.=
*_nir&#39; --allowlist-function &#39;spirv_.*&#39; --allowlist-function &#3=
9;pipe_.*&#39; --allowlist-var &#39;PIPE_.*&#39; --allowlist-type pipe_endi=
an --bitfield-enum pipe_map_flags --allowlist-type pipe_query_type --consti=
fied-enum-module pipe_query_type --allowlist-type pipe_resource_usage --bit=
field-enum pipe_resource_usage --allowlist-type pipe_tex_filter --constifie=
d-enum-module pipe_tex_filter --allowlist-type pipe_tex_wrap --constified-e=
num-module pipe_tex_wrap --allowlist-type pipe_swizzle --constified-enum-mo=
dule pipe_swizzle --allowlist-function &#39;rusticl_.*&#39; --allowlist-fun=
ction &#39;std(err|out)_ptr&#39; --allowlist-function mmap --allowlist-func=
tion munmap --allowlist-var &#39;MAP_.*&#39; --allowlist-var &#39;PROT_.*&#=
39; --allowlist-var &#39;WINSYS_HANDLE_TYPE_.*&#39; --experimental --wrap-s=
tatic-fns --wrap-static-fns-path /home/flk/bitbake/bitbake-builds/oe/build/=
tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/gallium/frontends/rusticl=
/rusticl_mesa_bindings.c --rust-target 1.96.0 --rust-edition 2021 -- -fno-b=
uiltin-malloc -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMI=
T_MACROS &#39;-DPACKAGE_VERSION=3D&quot;26.1.2&quot;&#39; &#39;-DPACKAGE_BU=
GREPORT=3D&quot;<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/issue=
s" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/mesa/mesa/-/issues</a>&quot;&#39; -DHAVE_OPENGL=3D1 -DHAVE_OPENGL_ES=
_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_CROCUS -DHAVE_I915 -DHAVE_IRIS -DHAVE_=
LLVMPIPE -DHAVE_NOUVEAU -DHAVE_R300 -DHAVE_R600 -DHAVE_RADEONSI -DHAVE_SOFT=
PIPE -DHAVE_SVGA -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DMESA_SYSTEM_HAS_K=
MS_DRM=3D1 -DVK_ENABLE_BETA_EXTENSIONS -DVIDEO_CODEC_VC1DEC=3D1 -DVIDEO_COD=
EC_H264DEC=3D1 -DVIDEO_CODEC_H264ENC=3D1 -DVIDEO_CODEC_H265DEC=3D1 -DVIDEO_=
CODEC_H265ENC=3D1 -DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO=
_CODEC_VP9DEC=3D1 -DVIDEO_CODEC_MPEG12DEC=3D1 -DVIDEO_CODEC_JPEGDEC=3D1 -DH=
AVE_LIBGBM -DHAVE_WAYLAND_PLATFORM -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_P=
LATFORM -DHAVE_DRM_PLATFORM -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DHAVE_V=
A_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS -DHAVE_GFX_COMPUTE -DGLX_INDIRECT_REN=
DERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EXPORT_PROTO_ENTRY_POIN=
TS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_CACHE -DHAVE___BUILTIN=
_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZ=
LL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS -DHAVE=
___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN_POPCOUNTLL -DHA=
VE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE___BUILT=
IN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BUILTIN_SUB_OVERFL=
OW_P -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_=
ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED -D=
HAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK -DHAVE_FU=
NC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUNC_ATTRIBUTE_RETU=
RNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHA=
VE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD -DHAVE_FUNC_ATTRIBUTE=
_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_FMEMOPEN -D_GNU_SOURC=
E -DUSE_SSE41 -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS -D=
MAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX=
_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_CET_H -DHAVE_POLL=
_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEM=
P -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R -DHAVE_G=
ETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -DHAVE_SYSCONF -DHAVE_=
GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_IS=
SIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L -DHAVE=
_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPUS -DHAVE_ZLIB =
-DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREAD_SETAFFINITY -D=
HAVE_LIBDRM -DHAVE_LIBUDEV &#39;-DMESA_LLVM_VERSION_STRING=3D&quot;22.1.8&q=
uot;&#39; -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILAB=
LE=3D1 -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF -DTHREAD_SA=
NITIZER=3D0 -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_TIMEOUT -DHAVE_WL=
_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM -DHAVE_DRI -DHAVE_DRI2=
 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_LIBSENSORS=3D1 -DHAVE_RE=
NDERDOC_INTEGRATION=3D1 -m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Ds=
se -msse4.2 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wf=
ormat-security -Werror=3Dformat-security --sysroot=3D/home/flk/bitbake/bitb=
ake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/recipe-sysroot =
--target=3Dx86_64-oe-linux -D_FILE_OFFSET_BITS=3D64 -I/home/flk/bitbake/bit=
bake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-2=
6.1.2/src/gallium/include -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/w=
ork/corei7-64-oe-linux/mesa/26.1.2/build/src/gallium/include -I/home/flk/bi=
tbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sourc=
es/mesa-26.1.2/src/gallium/auxiliary -I/home/flk/bitbake/bitbake-builds/oe/=
build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/src/gallium/auxiliary -=
I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa=
/26.1.2/sources/mesa-26.1.2/include/. -I/home/flk/bitbake/bitbake-builds/oe=
/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/build/include/. -I/home/flk/=
bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sou=
rces/mesa-26.1.2/src/. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work=
/corei7-64-oe-linux/mesa/26.1.2/build/src/. -DNDEBUG -I/home/flk/bitbake/bi=
tbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-=
26.1.2/src/compiler/nir/. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/w=
ork/corei7-64-oe-linux/mesa/26.1.2/build/src/compiler/nir/. -I/home/flk/bit=
bake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/source=
s/mesa-26.1.2/src/compiler/. -I/home/flk/bitbake/bitbake-builds/oe/build/tm=
p/work/corei7-64-oe-linux/mesa/26.1.2/build/src/compiler/. -I/home/flk/bitb=
ake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources=
/mesa-26.1.2/src/. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/cor=
ei7-64-oe-linux/mesa/26.1.2/build/src/. -I/home/flk/bitbake/bitbake-builds/=
oe/build/tmp/work/corei7-64-oe-linux/mesa/26.1.2/sources/mesa-26.1.2/includ=
e/. -I/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux=
/mesa/26.1.2/build/include/. -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACRO=
S -D__STDC_LIMIT_MACROS &#39;-DPACKAGE_VERSION=3D&quot;26.1.2&quot;&#39; &#=
39;-DPACKAGE_BUGREPORT=3D&quot;<a href=3D"https://gitlab.freedesktop.org/me=
sa/mesa/-/issues" rel=3D"noreferrer noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/mesa/mesa/-/issues</a>&quot;&#39; -DHAVE_OPENGL=3D1 -=
DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1 -DHAVE_CROCUS -DHAVE_I915 -DHA=
VE_IRIS -DHAVE_LLVMPIPE -DHAVE_NOUVEAU -DHAVE_R300 -DHAVE_R600 -DHAVE_RADEO=
NSI -DHAVE_SOFTPIPE -DHAVE_SVGA -DHAVE_VIRGL -DHAVE_ZINK -DHAVE_SWRAST -DME=
SA_SYSTEM_HAS_KMS_DRM=3D1 -DVK_ENABLE_BETA_EXTENSIONS -DVIDEO_CODEC_VC1DEC=
=3D1 -DVIDEO_CODEC_H264DEC=3D1 -DVIDEO_CODEC_H264ENC=3D1 -DVIDEO_CODEC_H265=
DEC=3D1 -DVIDEO_CODEC_H265ENC=3D1 -DVIDEO_CODEC_AV1DEC=3D1 -DVIDEO_CODEC_AV=
1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DVIDEO_CODEC_MPEG12DEC=3D1 -DVIDEO_CODEC=
_JPEGDEC=3D1 -DHAVE_LIBGBM -DHAVE_WAYLAND_PLATFORM -DHAVE_X11_PLATFORM -DHA=
VE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM -DHAVE_XCB_PLATFORM -DUSE_LIBGL=
VND=3D0 -DHAVE_VA_SURFACE_ATTRIB_DRM_FORMAT_MODIFIERS -DHAVE_GFX_COMPUTE -D=
GLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_DRM -DGLAPI_EXPORT_=
PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0 -DENABLE_SHADER_CACHE =
-DHAVE___BUILTIN_BSWAP32 -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHA=
VE___BUILTIN_CLZLL -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BU=
ILTIN_FFS -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT -DHAVE___BUILTIN=
_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE -DHAVE___BUILTIN_TYPES_COMPATIBLE_=
P -DHAVE___BUILTIN_ADD_OVERFLOW -DHAVE___BUILTIN_ADD_OVERFLOW_P -DHAVE___BU=
ILTIN_SUB_OVERFLOW_P -DHAVE_FUNC_ATTRIBUTE_CONST -DHAVE_FUNC_ATTRIBUTE_FLAT=
TEN -DHAVE_FUNC_ATTRIBUTE_MALLOC -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATT=
RIBUTE_UNUSED -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUT=
E_WEAK -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED -DHAVE_FUN=
C_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS -DHAVE_FUNC_ATTRIBU=
TE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE -DHAVE_FUNC_ATTRIBUTE_COLD -DHAV=
E_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY -DHAVE_FMEMO=
PEN -D_GNU_SOURCE -DUSE_SSE41 -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_AT=
OMIC_BUILTINS -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H -DHAS_SCHED_GETAFFINITY -D=
HAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_C=
ET_H -DHAVE_POLL_H -DHAVE_SYS_INOTIFY_H -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTO=
F -DHAVE_MKOSTEMP -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_S=
TRTOK_R -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV -DHAVE=
_SYSCONF -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC -DHAVE_PROGRAM_INVOCATIO=
N_NAME -DHAVE_ISSIGNALING -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE=
_STRTOD_L -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_G=
PUS -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD -DHAVE_PTHREA=
D_SETAFFINITY -DHAVE_LIBDRM -DHAVE_LIBUDEV &#39;-DMESA_LLVM_VERSION_STRING=
=3D&quot;22.1.8&quot;&#39; -DLLVM_IS_SHARED=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -=
DAMD_LLVM_AVAILABLE=3D1 -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_L=
IBELF -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED -DHAVE_WL_DISPATCH_QUEUE_=
TIMEOUT -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM -DHAV=
E_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS -DHAVE_LIBSENS=
ORS=3D1 -DHAVE_RENDERDOC_INTEGRATION=3D1 -std=3Dc11 -MD -MQ ../sources/mesa=
-26.1.2/src/gallium/frontends/rusticl/rusticl_mesa_bindings.h -MF src/galli=
um/frontends/rusticl/rusticl_mesa_bindings.h.d<br>
| panicked at /usr/src/debug/bindgen-cli-native/0.72.1/sources/cargo_home/b=
itbake/clang-sys-1.8.1/src/support.rs:189:45:<br>
| called `Result::unwrap()` on an `Err` value: &quot;could not run executab=
le `/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/m=
esa/26.1.2/recipe-sysroot/usr/bin/clang-22`: No such file or directory (os =
error 2)&quot;<br>
<br>
Link ${STAGING_BINDIR_NATIVE}/clang-22 to ${STAGING_BINDIR}/clang-22 to ach=
ieve this.<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank" rel=3D"noreferrer">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index f8e294076a..ed95a29446 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -63,6 +63,7 @@ replace_llvm_config_path() {<br>
<br>
=C2=A0do_configure:prepend:class-target() {<br>
=C2=A0 =C2=A0 =C2=A0replace_llvm_config_path<br>
+=C2=A0 =C2=A0 ln -sf ${STAGING_BINDIR_NATIVE}/clang-22 ${STAGING_BINDIR}/c=
lang-22<br>
=C2=A0}<br>
<br>
=C2=A0do_configure:prepend:class-nativesdk() {<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#240000): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/240000" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/240000</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120068848/199=
7914" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/120068848/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007350010655b5f0c6--

