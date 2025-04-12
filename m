Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCC5C369AB
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 18:46:59 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.16309.1744483615632181126
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Apr 2025 11:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eujvg2EH;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30db1bd3bddso29285781fa.3
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 11:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744483614; x=1745088414; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfBGm7cM14sq9t2cbWyCP/WNyXST1oP39wo+tF9wckQ=;
        b=eujvg2EHqTi3K8DDVQ7hZQ/EbCTtG0hQASsxtAWhDDTXsQd6fzBYs1tA51RgpOqzF8
         u8xWrY0Mzn1TeTyUODbfKknGNxTxH42MU6llE3JEgOCb6/XVJrZsulrq453eptuYwkqP
         bAeNrwZXpB1m4nsbU/GJsDGxSW3XQrSnOpi/Gnn2N6652WSPyTEK2I4gL7fUBR17f2BD
         tb+uOt76CFsY4uQ7e0dCszdf1ZXNGU0tZV11V8vfQ4xXAGaRv2A167y1EHYV7VNGArkQ
         7hh8giYDY7iOSaATOCBavRUvyg6ZlWqjP9UjyawkypOCr+s/26sj8DeSR9ocS4uNid7Z
         8sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744483614; x=1745088414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfBGm7cM14sq9t2cbWyCP/WNyXST1oP39wo+tF9wckQ=;
        b=nC4TGOcQ0ikJgp/KpAK53jZhwYxy5sXwKXcNN3EBDJKU0W1Ot80RhVnmckUC2bs4jC
         UI0Hfx9mzQAeChxMvDH/KA2nqCl3TNbI640FE6cHih7ZXcjJ7wiEqpA381X6klfXj7UZ
         QwdMxKjqGgiLikXKu5DTUv2g9cDOlpGmGg0cVFnXmQM9G+Dpgh2DgK0fjCUgX5k7zOR+
         tP6D/FDkzaHtu9FHLFnskUDk4ciwFt8MnM8gJ+shoEV2nH89pIlD/zoySibZTId+PzHX
         7VpiDN5oiAqzj5fW58eyJ5TLddMKRo8ByCtapB/2nlOjNwa7ysuepunqGzMrEfdbDjCu
         GEZg==
X-Forwarded-Encrypted: i=1; AJvYcCXOvuHftTSdpl0yQ7OLgvOP20mFbhWgQLaUptU9NLCUS7FfGGlCWXjeIM0nep9kgHgd52cdxCyi57oeRAjSB5oAjA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxrybIaLX+HzlxjgYqqe7e1HyKZAgLU8SFQh9u9mJMkk1CPvjL6
	fa2BiljfA1uErmYqcQYzyOgpxY3ezFW4zKB2r1eUW8hrSBcS1lsQ4U6JmeW25f8Zs5IqhQyDBZk
	DQ4YBqtuJxb6NmhfCONZ4MFWprNc=
X-Gm-Gg: ASbGncumwVeTdjgGSLGWUP3OAmRcsMr2g/y87YwdDMjin5pn5NPgWiLuT+HIn/yw4fN
	DBv61OMQK0W2Zarn1DfD2vZT0tzq7gGYBaRfPmvzDmZuErcZ+Ei24AtGnxCR2PF6OXTI8ClNa5l
	066mYZQiG7oi3Wn95nemT7f3dH
X-Google-Smtp-Source: AGHT+IH2B5pUMpfQ6pMGjVSAiY/neqcgySTCLRzfYqNayGf/lBTUnAfXN+x/iFec9EkPtKon8AuDL7a5xIun7rjnCE4=
X-Received: by 2002:a2e:ab0c:0:b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-31049509fd6mr23161561fa.0.1744483613203; Sat, 12 Apr 2025
 11:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
 <20250412-mesa-25-fixes-v1-1-791840391271@oss.qualcomm.com>
 <CA+chaQdOxFvAzdia+o8ocaF8zpf_hYsvLG0tW+7ygwpeY8cYaQ@mail.gmail.com>
 <0214a9e5-0242-448b-b078-9ba202685943@oss.qualcomm.com> <CAMKF1sqC5s1Wd+Cc9pTjqUuK687iNcyT0GefJ6JBgm=S8WjgRw@mail.gmail.com>
In-Reply-To: <CAMKF1sqC5s1Wd+Cc9pTjqUuK687iNcyT0GefJ6JBgm=S8WjgRw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 12 Apr 2025 20:46:41 +0200
X-Gm-Features: ATxdqUH53a144cCtu0bD8cauiFI_wLjaUC6WDvMCiUt1GCU28BBlAXkoa7-CwrA
Message-ID: <CA+chaQfGcEOsznLojbsfj_Rxz4OGBeG8jsvgNR7a+nP9ViyAGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] mesa: drop kmsro PACKAGECONFIG
To: Khem Raj <raj.khem@gmail.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 18:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214780

On Sat, Apr 12, 2025 at 7:26=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> I am still seeing an error with all updates applied
>
> https://errors.yoctoproject.org/Errors/Details/852167/

I'm seeing this one for target qemux86-64 builds as well, mesa-native
seems to be fixed after meta-clang update.

>
> On Sat, Apr 12, 2025 at 6:52=E2=80=AFAM Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >
> > On 12/04/2025 13:27, Martin Jansa wrote:
> > > Thanks, I've sent PR for meta-raspberryip:
> > > https://github.com/agherzan/meta-raspberrypi/pull/1456
> > >
> > > There is one more separate issue which mesa_clc in mesa-native builds=
,
> > > possibly only in combination with using meta-clang, is it what you've
> > > fixed with last 3 meta-clang commits from you?
> >
> > Yes, this is the LDFLAGS issue if I remember correctly. It should be
> > fixed by the meta-clang PR that Khem has merged. Please ping me if it
> > still can be reproduced.
> >
> > >
> > > In some builds I've noticed failure like:
> > > FAILED: src/intel/shaders/intel_gfx80_shaders.spv
> > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/=
clc/mesa_clc
> > > ../mesa-25.0.2/src/intel/shaders/libintel_shaders.h
> > > ../mesa-25.0.2/src/intel/shaders/generate.cl
> > > ../mesa-25.0.2/src/intel/shaders/generate_draws.cl
> > > ../mesa-25.0.2/src/intel/shaders/generate_draws_iris.cl
> > > ../mesa-25.0.2/src/intel/shaders/query_copy.cl
> > > ../mesa-25.0.2/src/intel/shaders/util.cl -o
> > > src/intel/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1
> > > -DGFX_VERx10=3D80
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/i=
ntel/shaders/.
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/c=
ompiler/libcl
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/i=
ntel
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/intel
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/i=
ntel/genxml
> > > /bin/sh: line 1:
> > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/=
clc/mesa_clc:
> > > No such file or directory
> > >
> > > I haven't reproduced it locally yet, seen it couple times from jenkin=
s
> > > builds, I guess it might be related to rm_work and mesa_clc using -L
> > > pointing to clang-native's libdir/WORKDIR which might be already
> > > cleaned by rm_work:
> > >
> > > # grep mesa_clc log.do_compile
> > > [8/2437] gcc -Isrc/compiler/clc/mesa_clc.p -Isrc/compiler/clc
> > > -I../mesa-25.0.2/src/compiler/clc -Iinclude -I../mesa-25.0.2/include
> > > -Isrc -I../mesa-25.0.2/src
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib/pkgconfig/../../../usr/include
> > > -fdiagnostics-color=3Dalways -DNDEBUG -D_FILE_OFFSET_BITS=3D64 -Wall
> > > -Winvalid-pch -std=3Dc11 -mtls-dialect=3Dgnu2
> > > -Werror=3Dimplicit-function-declaration -Werror=3Dmissing-prototypes
> > > -Werror=3Dreturn-type -Werror=3Dempty-body
> > > -Werror=3Dincompatible-pointer-types -Werror=3Dint-conversion
> > > -Wimplicit-fallthrough -Wmisleading-indentation
> > > -Wno-missing-field-initializers -Wno-format-truncation
> > > -Wno-nonnull-compare -fno-math-errno -fno-trapping-math -fno-common
> > > -Wno-unknown-pragmas -Wno-unused-function -Werror=3Dformat
> > > -Wformat-security -ffunction-sections -fdata-sections -O2 -pipe
> > > -pthread -isystemTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/re=
cipe-sysroot-native/usr/include
> > > -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
> > > '-DPACKAGE_VERSION=3D"25.0.2"'
> > > '-DPACKAGE_BUGREPORT=3D"https://gitlab.freedesktop.org/mesa/mesa/-/is=
sues"'
> > > -DHAVE_OPENGL=3D1 -DHAVE_OPENGL_ES_1=3D1 -DHAVE_OPENGL_ES_2=3D1
> > > -DHAVE_SOFTPIPE -DHAVE_I915 -DHAVE_CROCUS -DHAVE_R300 -DHAVE_NOUVEAU
> > > -DHAVE_LLVMPIPE -DHAVE_IRIS -DHAVE_RADEONSI -DHAVE_SVGA -DHAVE_R600
> > > -DHAVE_VIRGL -DHAVE_SWRAST -DVIDEO_CODEC_VC1DEC=3D0
> > > -DVIDEO_CODEC_H264DEC=3D0 -DVIDEO_CODEC_H264ENC=3D0
> > > -DVIDEO_CODEC_H265DEC=3D0 -DVIDEO_CODEC_H265ENC=3D0 -DVIDEO_CODEC_AV1=
DEC=3D1
> > > -DVIDEO_CODEC_AV1ENC=3D1 -DVIDEO_CODEC_VP9DEC=3D1 -DHAVE_WAYLAND_PLAT=
FORM
> > > -DHAVE_X11_PLATFORM -DHAVE_SURFACELESS_PLATFORM -DHAVE_DRM_PLATFORM
> > > -DHAVE_XCB_PLATFORM -DUSE_LIBGLVND=3D0 -DGLX_INDIRECT_RENDERING
> > > -DGLX_DIRECT_RENDERING -DGLX_USE_DRM
> > > -DGLAPI_EXPORT_PROTO_ENTRY_POINTS=3D0 -DALLOW_KCMP -DMESA_DEBUG=3D0
> > > -DENABLE_SHADER_CACHE -DHAVE___BUILTIN_BSWAP32
> > > -DHAVE___BUILTIN_BSWAP64 -DHAVE___BUILTIN_CLZ -DHAVE___BUILTIN_CLZLL
> > > -DHAVE___BUILTIN_CTZ -DHAVE___BUILTIN_EXPECT -DHAVE___BUILTIN_FFS
> > > -DHAVE___BUILTIN_FFSLL -DHAVE___BUILTIN_POPCOUNT
> > > -DHAVE___BUILTIN_POPCOUNTLL -DHAVE___BUILTIN_UNREACHABLE
> > > -DHAVE___BUILTIN_TYPES_COMPATIBLE_P -DHAVE_FUNC_ATTRIBUTE_CONST
> > > -DHAVE_FUNC_ATTRIBUTE_FLATTEN -DHAVE_FUNC_ATTRIBUTE_MALLOC
> > > -DHAVE_FUNC_ATTRIBUTE_PURE -DHAVE_FUNC_ATTRIBUTE_UNUSED
> > > -DHAVE_FUNC_ATTRIBUTE_WARN_UNUSED_RESULT -DHAVE_FUNC_ATTRIBUTE_WEAK
> > > -DHAVE_FUNC_ATTRIBUTE_FORMAT -DHAVE_FUNC_ATTRIBUTE_PACKED
> > > -DHAVE_FUNC_ATTRIBUTE_RETURNS_NONNULL -DHAVE_FUNC_ATTRIBUTE_ALIAS
> > > -DHAVE_FUNC_ATTRIBUTE_NORETURN -DHAVE_FUNC_ATTRIBUTE_OPTIMIZE
> > > -DHAVE_FUNC_ATTRIBUTE_VISIBILITY -DHAVE_UINT128 -DHAVE_REALLOCARRAY
> > > -DHAVE_FMEMOPEN -D_GNU_SOURCE -DUSE_SSE41
> > > -DHAVE___BUILTIN_IA32_CLFLUSHOPT -DUSE_GCC_ATOMIC_BUILTINS
> > > -DUSE_X86_64_ASM -DMAJOR_IN_SYSMACROS -DHAS_SCHED_H
> > > -DHAS_SCHED_GETAFFINITY -DHAVE_LINUX_FUTEX_H -DHAVE_ENDIAN_H
> > > -DHAVE_DLFCN_H -DHAVE_SYS_SHM_H -DHAVE_CET_H -DHAVE_SYS_INOTIFY_H
> > > -DHAVE_LINUX_UDMABUF_H -DHAVE_STRTOF -DHAVE_MKOSTEMP
> > > -DHAVE_MEMFD_CREATE -DHAVE_RANDOM_R -DHAVE_FLOCK -DHAVE_STRTOK_R
> > > -DHAVE_GETRANDOM -DHAVE_POSIX_FALLOCATE -DHAVE_SECURE_GETENV
> > > -DHAVE_GNU_QSORT_R -DHAVE_STRUCT_TIMESPEC
> > > -DHAVE_PROGRAM_INVOCATION_NAME -DHAVE_ISSIGNALING
> > > -DHAVE_POSIX_MEMALIGN -DHAVE_DIRENT_D_TYPE -DHAVE_STRTOD_L
> > > -DHAVE_DLADDR -DHAVE_DL_ITERATE_PHDR -DSUPPORT_INTEL_INTEGRATED_GPUS
> > > -DHAVE_ZLIB -DHAVE_ZSTD -DHAVE_COMPRESSION -DHAVE_PTHREAD
> > > -DHAVE_PTHREAD_SETAFFINITY -DHAVE_LIBDRM
> > > '-DMESA_LLVM_VERSION_STRING=3D"20.1.2"' -DLLVM_IS_SHARED=3D1
> > > -DLLVM_AVAILABLE=3D1 -DDRAW_LLVM_AVAILABLE=3D1 -DAMD_LLVM_AVAILABLE=
=3D1
> > > -DGALLIVM_USE_ORCJIT=3D0 -DHAVE_SPIRV_TOOLS -DUSE_LIBELF
> > > -DTHREAD_SANITIZER=3D0 -DWL_HIDE_DEPRECATED
> > > -DHAVE_WL_CREATE_QUEUE_WITH_NAME -DHAVE_OPENMP -DHAVE_X11_DRM
> > > -DHAVE_DRI -DHAVE_DRI2 -DHAVE_DRI3_EXPLICIT_SYNC -DHAVE_DRISW_KMS
> > > -Wno-override-init -MD -MQ src/compiler/clc/mesa_clc.p/mesa_clc.c.o
> > > -MF src/compiler/clc/mesa_clc.p/mesa_clc.c.o.d -o
> > > src/compiler/clc/mesa_clc.p/mesa_clc.c.o -c
> > > ../mesa-25.0.2/src/compiler/clc/mesa_clc.c
> > > ../mesa-25.0.2/src/compiler/clc/mesa_clc.c: In function =E2=80=98main=
=E2=80=99:
> > > ../mesa-25.0.2/src/compiler/clc/mesa_clc.c:152:7: warning: ignoring
> > > return value of =E2=80=98fread=E2=80=99 declared with attribute =E2=
=80=98warn_unused_result=E2=80=99
> > > [-Wunused-result]
> > > [920/2437] g++  -o src/compiler/clc/mesa_clc
> > > src/compiler/clc/mesa_clc.p/mesa_clc.c.o
> > > -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib
> > > -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/lib
> > > -Wl,--as-needed -Wl,--no-undefined -Wl,--enable-new-dtags
> > > -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/rec=
ipe-sysroot-native/usr/lib
> > > -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/rec=
ipe-sysroot-native/lib
> > > -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-s=
ysroot-native/usr/lib
> > > -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-s=
ysroot-native/lib
> > > -Wl,-O1 -Wl,--allow-shlib-undefined
> > > -Wl,--dynamic-linker=3DTOPDIR/BUILD/sysroots-uninative/x86_64-linux/l=
ib/ld-linux-x86-64.so.2
> > > -pthread -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2=
/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/lib
> > > -Wl,--start-group src/compiler/clc/liblibmesaclc.a
> > > src/compiler/nir/libnir.a src/compiler/libcompiler.a
> > > src/util/libmesa_util.a src/util/libmesa_util_sse41.a
> > > src/util/blake3/libblake3.a src/c11/impl/libmesa_util_c11.a
> > > src/compiler/spirv/libvtn.a -Wl,--build-id=3Dsha1 -fPIC -O2 -pipe
> > > -fvisibility-inlines-hidden -Wl,--enable-new-dtags
> > > -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/re=
cipe-sysroot-native/usr/lib
> > > -Wl,-rpath-link,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/re=
cipe-sysroot-native/lib
> > > -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-=
sysroot-native/usr/lib
> > > -Wl,-rpath,TOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-=
sysroot-native/lib
> > > -Wl,-O1 -Wl,--allow-shlib-undefined
> > > -Wl,--dynamic-linker=3DTOPDIR/BUILD/sysroots-uninative/x86_64-linux/l=
ib/ld-linux-x86-64.so.2
> > > -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib
> > > -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot-n=
ative/usr/lib
> > > -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot-n=
ative/lib
> > > -lLLVM-20 TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sy=
sroot-native/usr/lib/pkgconfig/../../../usr/lib/libSPIRV-Tools-opt.so
> > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/lib/libSPIRV-Tools.so
> > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/lib/libSPIRV-Tools-link.so
> > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-nati=
ve/usr/lib/pkgconfig/../../../usr/lib/libz.so
> > > -lm TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-=
native/usr/lib/pkgconfig/../../../usr/lib/libzstd.so
> > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-nati=
ve/usr/lib/libclang-cpp.so
> > > -isystemTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sys=
root-native/usr/include
> > > -O2 -fvisibility-inlines-hidden -Wl,--enable-new-dtags -Wl,-O1
> > > -Wl,--allow-shlib-undefined
> > > -LTOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sysroot-na=
tive/usr/lib
> > > -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot-n=
ative/usr/lib
> > > -LTOPDIR/BUILD/work/x86_64-linux/clang-native/20.1.2/recipe-sysroot-n=
ative/lib
> > > -lLLVM-20 TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/recipe-sy=
sroot-native/usr/lib/pkgconfig/../../../usr/lib/libLLVMSPIRVLib.a
> > > -Wl,--end-group
> > > [921/2437] TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/sr=
c/compiler/clc/mesa_clc
> > > ../mesa-25.0.2/src/intel/shaders/libintel_shaders.h
> > > ../mesa-25.0.2/src/intel/shaders/generate.cl
> > > ../mesa-25.0.2/src/intel/shaders/generate_draws.cl
> > > ../mesa-25.0.2/src/intel/shaders/generate_draws_iris.cl
> > > ../mesa-25.0.2/src/intel/shaders/query_copy.cl
> > > ../mesa-25.0.2/src/intel/shaders/util.cl -o
> > > src/intel/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1
> > > -DGFX_VERx10=3D80
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/i=
ntel/shaders/.
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/c=
ompiler/libcl
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/i=
ntel
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/intel
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/i=
ntel/genxml
> > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/=
clc/mesa_clc
> > > ../mesa-25.0.2/src/intel/shaders/libintel_shaders.h
> > > ../mesa-25.0.2/src/intel/shaders/generate.cl
> > > ../mesa-25.0.2/src/intel/shaders/generate_draws.cl
> > > ../mesa-25.0.2/src/intel/shaders/generate_draws_iris.cl
> > > ../mesa-25.0.2/src/intel/shaders/query_copy.cl
> > > ../mesa-25.0.2/src/intel/shaders/util.cl -o
> > > src/intel/shaders/intel_gfx80_shaders.spv -- -DNDEBUG=3D1
> > > -DGFX_VERx10=3D80
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/i=
ntel/shaders/.
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/c=
ompiler/libcl
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/i=
ntel
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/intel
> > > -ITOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/mesa-25.0.2/src/i=
ntel/genxml
> > > /bin/sh: line 1:
> > > TOPDIR/BUILD/work/x86_64-linux/mesa-native/25.0.2/build/src/compiler/=
clc/mesa_clc:
> > > No such file or directory
> > >
> > >
> > > On Sat, Apr 12, 2025 at 12:09=E2=80=AFAM Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >>
> > >> Mesa has dropped support for separate kmsro option to gallium-driver=
s.
> > >> Drop it from the recipe and drop the now-unused PACKAGECONFIG too.
> > >>
> > >> Reported-by: Martin Jansa <martin.jansa@gmail.com>
> > >> Closes: https://lore.kernel.org/r/CA+chaQeWA01kB3q6=3Do4xcZwA1TMggHx=
YTZ0AZETY7he_yU3E1A@mail.gmail.com/
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > >> ---
> > >>   meta/recipes-graphics/mesa/mesa.inc | 2 --
> > >>   1 file changed, 2 deletions(-)
> > >>
> > >> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-grap=
hics/mesa/mesa.inc
> > >> index aca34983e97ca684d662987d3a1d0b61ba44029a..a88cc8660e26bae43c71=
3b2bfdbf396e804f6c09 100644
> > >> --- a/meta/recipes-graphics/mesa/mesa.inc
> > >> +++ b/meta/recipes-graphics/mesa/mesa.inc
> > >> @@ -162,7 +162,6 @@ PACKAGECONFIG[opencl] =3D " \
> > >>   PACKAGECONFIG[broadcom] =3D ""
> > >>   PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
> > >>   PACKAGECONFIG[freedreno] =3D ""
> > >> -PACKAGECONFIG[kmsro] =3D ""
> > >>   PACKAGECONFIG[vc4] =3D ""
> > >>   PACKAGECONFIG[v3d] =3D ""
> > >>   PACKAGECONFIG[zink] =3D ""
> > >> @@ -177,7 +176,6 @@ GALLIUMDRIVERS:append:i686 =3D ",i915,crocus"
> > >>
> > >>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', '=
etnaviv', ',etnaviv', '', d)}"
> > >>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', '=
freedreno', ',freedreno', '', d)}"
> > >> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'k=
msro', ',kmsro', '', d)}"
> > >>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', '=
vc4', ',vc4', '', d)}"
> > >>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', '=
v3d', ',v3d', '', d)}"
> > >>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG', '=
zink', ',zink', '', d)}"
> > >>
> > >> --
> > >> 2.39.5
> > >>
> >
> >
> > --
> > With best wishes
> > Dmitry
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#214775): https://lists.openembedded.org/g/openembed=
ded-core/message/214775
> > Mute This Topic: https://lists.openembedded.org/mt/112219028/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

