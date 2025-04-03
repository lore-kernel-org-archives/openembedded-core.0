Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9913BC3601E
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 07:33:59 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.7822.1743665630707341265
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 00:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fr05nRji;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso4915215e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 00:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743665629; x=1744270429; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JTArJDWtbBR/i6WmqulT2Sgh5iayW7hqFICoOAik8ww=;
        b=fr05nRjirN8EBiCsCYRUcYvKsa7AKtXU38XeSQpR/ieNZ1apmyab1vE/h1dV0G6upt
         fq7t1Z9BhSfBtVUh7cWiT7okIBkF9ZQQXW6+ho20t+oU3KK3aNpbrN5ukXwJ0NQiZgyd
         vPTb3TmTIoIwZEM9kGu0mf7jzOrUtc+WBtXsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665629; x=1744270429;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JTArJDWtbBR/i6WmqulT2Sgh5iayW7hqFICoOAik8ww=;
        b=L4oN9j2GhWm+X7sLj8CxWa2HJ+f5W6aBOEUsWyPAG8948r2aPVqUyEG/ySj9hPQbX2
         iJliKsqsXF/eDi3jG1cFYoU72Bg91uL+XmBG3ZFNP61J5NhGXtXM4MeYEvVxr1LdEEJl
         p5sD1merHLbVf4iqeJmEHMRqmBhnthXpxC/sqMeVcNJ+CKh7Iaq5k6ug55Gmf7VJYoDB
         VbmF1i1f2fwKnxOXTTPljtLap2wmuauUJm4pIAAihpLrK7h2S707i8Ud/XgLC+uiQ7ye
         l4ShWFaSGstXzp3Y6zkV+agHYwwq6Qf2wv42Hw2AGTpDtbGy++kUXKvln0N3DDpl3evn
         i4+A==
X-Forwarded-Encrypted: i=1; AJvYcCV8v7nDl6TT29HhDOaGkl9svNqJj2aWck4PAan7cYJvO/KhcFahDVESPyxBuerAAE6dsqumGxjv19x7GTeedBYnAg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzodPNVVA7FqAJmfdR8ti/xAZoOtyqYk3+a32EFTHzyesG3D0ZT
	wKhh7t0V/LM/c3zXYoGOI7KS5gd+5bfc7FdZ9AE4WmlQnUuqjF/f4g9bh7MlStI=
X-Gm-Gg: ASbGncv1Zh+AMq8BEQ8YFN8zvBS+1kjmzdDYFiZ2RcjBQfCOYEKgQQexnCDDtDoe5UF
	5u7VilrhZCjBWDwYZD3QFsb34qujtphJVg7ZTWyzn4orsxhXpld7ulIBY9ECORmJ/8RZN5UA0VO
	w+lHVfTtrSq52vQzpCZqYPedFjJGY6WexUBh78K6oMXqmRmrWT9OS8Y1CIXEFCOdUFrVlVrI+QV
	XItAuv1KUDfoMHxVJ+EuFAq1Q19tsECX/UAfaZL/0B4Pp9pFTGAOKTlG6l5Euo1k5sjVMVSItbG
	nwbgiSrvbfAtQsexy9hhw/Rj72ibePMRzFDhJapDV2DGE1kRvJ0boFpYoH6tEBHEpaUgNTAWZ26
	axsvN6kMuRcVZsd1z8/qMEw+PZRjMzIZ2ag==
X-Google-Smtp-Source: AGHT+IFU+3W0O3ZnZx4iF5Ylp0rba5sdHEfQGNLXF92Z0UQhnkRpIx1TPBaVIqOIzgJEeQw2gu4Ong==
X-Received: by 2002:a05:6000:1acb:b0:391:212:459a with SMTP id ffacd0b85a97d-39c2f8dd8bcmr1170486f8f.22.1743665628946;
        Thu, 03 Apr 2025 00:33:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270? ([2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226b17sm1003464f8f.92.2025.04.03.00.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:33:48 -0700 (PDT)
Message-ID: <0ab4c22501abdc4cb8d806c5179765e270f10176.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 00/11] mesa: upgrade to 25.0.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 =?ISO-8859-1?Q?Zolt=E1n_B=F6sz=F6rm=E9nyi?=
	 <zboszor@gmail.com>
Date: Thu, 03 Apr 2025 08:33:47 +0100
In-Reply-To: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
References: <20250402-mesa-25-v5-0-ab35f021a83b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 07:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214302

On Wed, 2025-04-02 at 18:18 +0300, Dmitry Baryshkov via lists.openembedded.=
org wrote:
> libclc is required in order to build Intel drivers in Mesa 24.1 and
> later. Thus OE-Core is currently locked to the 24.0.x branch, which is
> no longer maintained, having last release in June 2024.
>=20
> A clean solution is to package Clang, then use it to build libclc and
> SPIRV-LLVM-Translator (required for Mesa OpenCL support). However
> creating proper recipes for Clang is a long process (ongoing by Khem
> Raj).
>=20
> This patchset attempts to solve the issue in a simpler way: by building
> libclc and SPIRV-LLVM-Translator together with the LLVM. This way we
> don't have to create target Clang recipes, there is no extra toolchain
> to support, etc. Clang binaries are creted as a part of the build
> process (in order to support building target packages), however it only
> hits the LLVM sysroot-native and is only used by the LLVM target build.
>=20
> Future work by Khem (once Clang is properly supported in OE-Core) should
> allow us to create proper recipes for libclc and spirv-llvm-translator
> and drop them from the llvm / clang recipe.
>=20
> I think this approach provides a good balance between OE-Core being
> stuck with the outdated Mesa release and being able to upgrade it,
> bringing support for new hardware.
>=20
> Last two patches of the series bring in RustiCL support, a new OpenCL
> implementation within Mesa. They are optional for the sake of the
> upgrade and can be dropped if there is any issue with those. RustiCL
> support is mostly compile-tested at this point.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v5:
> - Extended runqemu script to also set GBM_BACKENDS_PATH
> - Fixed LDFLAGS leak from native llvm-config --ldflags (which caused
> =C2=A0 mesa-clc issues)
> - Disabled BLAKE3 SIMD optimizations on x32, fixing the crash
> - Disabled swarst Vulkan driver and llvmpipe Gallium driver on x32,
> =C2=A0 fixing the crash
> - Changed bindgen patch to pass -target to all bindgen invocations
> - Link to v4: https://lore.kernel.org/r/20250331-mesa-25-v4-0-e62fc54a6ef=
c@oss.qualcomm.com
>=20
> Changes in v4:
> - Fixed QA issues reported against lib32-mesa-megadriver (Richard)
> - Removed release notes link from the mesa's commit message (Alexander)
> - Added link to the rust.bindgen() issue to RustiCL-related
> =C2=A0 cross-compilation patch (Alexander)
> - Renamed 'spirv' PACKAGECONFIG option to 'spirv-llvm-translator' in
> =C2=A0 order to be more precise
> - Link to v3: https://lore.kernel.org/r/20250329-mesa-25-v3-0-f4d0328eb86=
7@oss.qualcomm.com
>=20
> Changes in v3:
> - Dropped llvm/fix-native-compilation.patch and
> =C2=A0 llvm/0001-cmake-modules-CrossCompile-pass-SPIR-V-headers-path-.pat=
ch
> =C2=A0 in favour of installing prepare_builtins into the sysroot, dropped
> =C2=A0 corresponding EXTRA_OECMAKE params
> - Dropepd -DCLANG_TABLEGEN from llvm's EXTRA_OECMAKE
> - Enabled llvm-config wrapper for nativesdk too, fixing QA errors for
> =C2=A0 nativesdk-mesa
> - Added --libdir handling to llvm-config, dropping the need for
> =C2=A0 mesa/0001-meson-use-target-path-for-Clang-libdir.patch
> - Dropped extra LIBCEXTENSION from BINDGEN_TARGET, it is already a part
> =C2=A0 of TARGET_OS
> - Expanded commit messages to explain the patches
> - Link to v2: https://lore.kernel.org/r/20250327221807.2551544-1-dmitry.b=
aryshkov@oss.qualcomm.com
>=20
> Changes in v2:
> - Dropped YOCTO_ALTERNATE_LIBDIR patch
> - Reworked mesa / LLVM integration to always use get_option('libdir')
> - Reenabled AMD Vulkan driver (got disabled because of c&p error)
> - Moved mesa-clc options to the libclc PACKAGECONFIG to fix several
> =C2=A0 build errors
> - Link to v1: https://lore.kernel.org/r/20250327135520.3920189-1-dmitry.b=
aryshkov@oss.qualcomm.com/
>=20
> ---
> Dmitry Baryshkov (10):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 runqemu: also set GBM_BACKENDS_PATH
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 llvm: move libLLVM.so.N.M to llvm-libllvm =
package
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 llvm: use OECMAKE_SOURCEPATH to specify cm=
ake dir
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 llvm: handle libdir in llvm-config
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 llvm: also use llvm-config wrapper for nat=
ivesdk recipes
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 llvm: remove LLVM_LDFLAGS from llvm-config=
 --ldflags output
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 llvm: support building libclc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 llvm: add SPIRV-LLVM-Translator support
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mesa: upgrade 24.0.7 -> 25.0.2
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bindgen-cli: a tool to generate Rust bindi=
ngs
>=20
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi (1):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mesa: add support for RustiCL under PACKAG=
ECONFIG "opencl"
>=20
> =C2=A0meta/conf/distro/include/maintainers.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0.../bindgen-cli/bindgen-cli-crates.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 186 +++++++++++++++++++++
> =C2=A0.../bindgen-cli/bindgen-cli_0.71.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 +++
> =C2=A0...g-remove-LLVM_LDFLAGS-from-ldflags-output.patch |=C2=A0 34 ++++
> =C2=A0meta/recipes-devtools/llvm/llvm/llvm-config=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0.../llvm/llvm/spirv-internal-build.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 30 ++++
> =C2=A0meta/recipes-devtools/llvm/llvm_20.1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 79 ++++++++-
> =C2=A0...evert-meson-do-not-pull-in-clc-for-clover.patch |=C2=A0 53 -----=
-
> =C2=A0...d-Include-missing-llvm-IR-header-Module.h.patch |=C2=A0 41 -----
> =C2=A0.../files/0001-drisw-fix-build-without-dri3.patch=C2=A0 |=C2=A0 58 =
-------
> =C2=A0...eno-don-t-encode-build-path-into-binaries.patch |=C2=A0 46 ++++-
> =C2=A0...able-SIMD-blake-optimisations-on-x32-host.patch |=C2=A0 28 ++++
> =C2=A0...vide-cross-compilation-arguments-to-LLVM-.patch |=C2=A0 67 +++++=
+++
> =C2=A0...ext-don-t-try-zink-if-not-enabled-in-mesa.patch |=C2=A0 42 -----
> =C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 110 +++++++-=
----
> =C2=A0scripts/runqemu=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 13 +-
> =C2=A016 files changed, 551 insertions(+), 259 deletions(-)

I ran through testing with this and it is definitely improving. The
most problematic issue seen was this:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1374

which I suspect is uninative being bypassed. I have memories of dealing
with something to do with __isoc23_strtol but I can't remember the
details unfortunately.

meta-clang also failed:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/18/builds/667

which may or may not be related to khem's libdir feedback.

Cheers,

Richard

