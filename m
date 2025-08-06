Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489EAC87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 09:29:31 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.21376.1754472569013542836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 02:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eaX+VRpN;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-70749d4c5b5so56901126d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 02:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754472568; x=1755077368; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S9wrWJ83OzdJCUZLHzoMgq0YcLOpakKJWTD/4LpsRSA=;
        b=eaX+VRpNzvKNdDfvkn0CdKTGj69nJWIpKSvz7HHNdf/dk2qa0HDAh8F5/mj6TRhYou
         Vc5Jn3/DZY7YfshsOLFGadxM3ig5061mTLg/BWY/BHmYDnO4GMf/xEXi9/0XWJ1LMcDT
         g2fK/9WVaLAudhOjdqAR8GM7I/Oit11mlAdJOo6JiXzezcREHUwRGx4ThpRgESeC9zer
         uPQ+zlWjNr8NVbSyKIU/hAnYOoR8GCAKDCkRZ3iDJCBhoZ+B4ROrXdnoYY2XGmMhzGMs
         nCoHAM1cjj8G3YMjr6Sf05bNNFff74nhqbwXysYOj2c4qZdouEz5yeX5jDn3gkp19zfn
         8aFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472568; x=1755077368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9wrWJ83OzdJCUZLHzoMgq0YcLOpakKJWTD/4LpsRSA=;
        b=Tdu2CQAzb3N1+ijwgkVMPeC7FeZ5Z6OyMe4bzfHUjfKbWpQyvclYWo7oV46/e1aWvk
         s5TYOaQmg4TmkeXstW5T6q4Raz5ZT0D1gx+mIwOIif7mB/YPeRSgIECBnCQNtoOrDo2h
         Pfs/Gik5ZMRhPgH6B/PW9S/CgtvGFhd0G5K4B0B7SQTqKZNyRjxwptweWcRc9yN5seyW
         l+0uRJyLKQKqMldkGhGEVKrs6QL0msPupWuuLuvA7w9HT56u8zjTbwd30d5Rfw33R2VS
         8zhOcFFovaHzw21R5ewz4XpzhIWPGxiO5bFv+JxBuzOFAFzqGY6fPIcS6dHWGWjn5kUd
         Srng==
X-Gm-Message-State: AOJu0YzolnJLnNYhPnpfUnC3WzDo5L+sHpXbJmEnG/ynZJT+BR9mmDq4
	VSdXu1yvstF9QJYC6mwuxIxFQOJnWvim6LitGlItZds7z3Z6kXUbWp+IiacXyNsdcbpcR43MUD8
	DO6sFFTFRoIlz3auxTAhxSgDyhj8I8U0bTg==
X-Gm-Gg: ASbGncs8V4YHvsJGZtpjG2k1B5yG4xe7HJPuAPlBZ+5sf3634fR4SlM3adCwhwUH09a
	sD6cm8iYfoUNPIvwbFCKsbZweUabpilL9LViAaNoudysGX0VqAQG11hBKv3r1ytpZJCMVonoTok
	cY2JdYAG+gzcNgzr4yJaOp+mU+qyWs4lFvMUNgoSOs057j1XnkdMmF5SacnEIlu/BequORbFJ3p
	ld35vmfBGiUnAVFd/p+pmEuWXtSF0Nqq+ic4iga0A==
X-Google-Smtp-Source: AGHT+IHkVSsp1NcsL4SbPtuT6/2v6A9x3WAwerUBsNNz6EeP5jYnEK29YLwwdY1uDObv/Kx5Hl/XkpgJwOkJmywT1XQ=
X-Received: by 2002:a05:6214:600d:b0:709:82d8:6c68 with SMTP id
 6a1803df08f44-70982d86cfdmr2825186d6.34.1754472567856; Wed, 06 Aug 2025
 02:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250806091849.785-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20250806091849.785-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Aug 2025 11:29:15 +0200
X-Gm-Features: Ac12FXyOktKuX3w6j1hpm6soLRO3dEsue-3E8emhaX9tIiWOMaFMAJfXpIyKAcg
Message-ID: <CANNYZj9LZEaH6-mkZDDnp17Z=33miODCDLYbQu2t3WS0NpmmoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] vulkan-{headers,loader,tools,utility-libraries,validation-layers,volk},
 spirv-{tools,headers}, glslang: upgrade 1.4.313 -> 1.4.321
To: Liu Yiding <liuyd.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221518

Thanks, this looks good.

Alex

On Wed, 6 Aug 2025 at 11:19, Liu Yiding <liuyd.fnst@fujitsu.com> wrote:
>
> vulkan-headers Changelog:
> https://github.com/KhronosGroup/Vulkan-Headers/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0
>
> vulkan-loader Changelog:
> https://github.com/KhronosGroup/Vulkan-Loader/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0
>
> vulkan-tools Changelog:
> https://github.com/KhronosGroup/Vulkan-Tools/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0
>
> vulkan-utility-libraries Changelog:
> https://github.com/KhronosGroup/Vulkan-Utility-Libraries/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0
>
> vulkan-validation-layers Changelog:
> https://github.com/KhronosGroup/Vulkan-ValidationLayers/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0
>
> vulkan-volk Changelog:
> https://github.com/zeux/volk/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0
>
> spirv-tools Changelog:
> https://github.com/KhronosGroup/SPIRV-Tools/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0
>
> spirv-headers:
> License-Update: add CC-BY-4.0
> Changelog:
> https://github.com/KhronosGroup/SPIRV-Headers/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0
>
> glslang Changelog:
> https://github.com/KhronosGroup/Glslang/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  .../glslang/{glslang_1.4.313.0.bb => glslang_1.4.321.0.bb}  | 4 ++--
>  ...pirv-headers_1.4.313.0.bb => spirv-headers_1.4.321.0.bb} | 6 +++---
>  .../{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb}  | 2 +-
>  ...kan-headers_1.4.313.0.bb => vulkan-headers_1.4.321.0.bb} | 2 +-
>  ...ulkan-loader_1.4.313.0.bb => vulkan-loader_1.4.321.0.bb} | 4 ++--
>  ...{vulkan-tools_1.4.313.0.bb => vulkan-tools_1.4.321.0.bb} | 4 ++--
>  ...s_1.4.313.0.bb => vulkan-utility-libraries_1.4.321.0.bb} | 4 ++--
>  ...s_1.4.313.0.bb => vulkan-validation-layers_1.4.321.0.bb} | 4 ++--
>  .../{vulkan-volk_1.4.313.0.bb => vulkan-volk_1.4.321.0.bb}  | 2 +-
>  9 files changed, 16 insertions(+), 16 deletions(-)
>  rename meta/recipes-graphics/glslang/{glslang_1.4.313.0.bb => glslang_1.4.321.0.bb} (93%)
>  rename meta/recipes-graphics/spir/{spirv-headers_1.4.313.0.bb => spirv-headers_1.4.321.0.bb} (80%)
>  rename meta/recipes-graphics/spir/{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb} (97%)
>  rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.313.0.bb => vulkan-headers_1.4.321.0.bb} (95%)
>  rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.313.0.bb => vulkan-loader_1.4.321.0.bb} (95%)
>  rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.313.0.bb => vulkan-tools_1.4.321.0.bb} (94%)
>  rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.313.0.bb => vulkan-utility-libraries_1.4.321.0.bb} (91%)
>  rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.313.0.bb => vulkan-validation-layers_1.4.321.0.bb} (95%)
>  rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.313.0.bb => vulkan-volk_1.4.321.0.bb} (95%)
>
> diff --git a/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
> similarity index 93%
> rename from meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
> rename to meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
> index cb754c6ac8..2d6f098ad9 100644
> --- a/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
> +++ b/meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
> @@ -8,8 +8,8 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
>  LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
>
> -SRCREV = "fc9889c889561c5882e83819dcaffef5ed45529b"
> -SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.313;tag=vulkan-sdk-${PV} \
> +SRCREV = "8a85691a0740d390761a1008b4696f57facd02c4"
> +SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.321;tag=vulkan-sdk-${PV} \
>             file://0001-generate-glslang-pkg-config.patch \
>             "
>  PE = "1"
> diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> similarity index 80%
> rename from meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
> rename to meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> index a551814689..5365d64a99 100644
> --- a/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
> +++ b/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb
> @@ -1,10 +1,10 @@
>  SUMMARY = "Machine-readable files for the SPIR-V Registry"
>  SECTION = "graphics"
>  HOMEPAGE = "https://www.khronos.org/registry/spir-v"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
> +LICENSE = "MIT & CC-BY-4.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
>
> -SRCREV = "aa6cef192b8e693916eb713e7a9ccadf06062ceb"
> +SRCREV = "2a611a970fdbc41ac2e3e328802aed9985352dca"
>  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
>  PE = "1"
>  # These recipes need to be updated in lockstep with each other:
> diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> similarity index 97%
> rename from meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
> rename to meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> index 4594a1a942..319b25b7f4 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
> @@ -7,7 +7,7 @@ SECTION = "graphics"
>  LICENSE  = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRCREV = "a62abcb402009b9ca5975e6167c09f237f630e0e"
> +SRCREV = "33e02568181e3312f49a3cf33df470bf96ef293a"
>  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
>             "
>  PE = "1"
> diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
> similarity index 95%
> rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
> index 1136e4795a..b3413b0e6b 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb
> @@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
>  SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
>
> -SRCREV = "409c16be502e39fe70dd6fe2d9ad4842ef2c9a53"
> +SRCREV = "2cd90f9d20df57eac214c148f3aed885372ddcfe"
>
>  inherit cmake
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
> similarity index 95%
> rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
> index c739ba15dc..772705dff7 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
> @@ -9,8 +9,8 @@ SECTION = "libs"
>
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
> -SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.313;protocol=https"
> -SRCREV = "fb78607414e154c7a5c01b23177ba719c8a44909"
> +SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.321;protocol=https"
> +SRCREV = "da8d2caad9341ca8c5a7c3deba217d7da50a7c24"
>
>  REQUIRED_DISTRO_FEATURES = "vulkan"
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
> similarity index 94%
> rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
> index c73e5caa13..26c196336e 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
> @@ -6,8 +6,8 @@ SECTION = "libs"
>
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.313;protocol=https"
> -SRCREV = "ad2f0170f9466fadd96e3fdd65fad02cd3a3739b"
> +SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.321;protocol=https"
> +SRCREV = "06ae73a3dc3a03466817d8370355203dac7b79b1"
>
>  inherit cmake features_check pkgconfig
>  ANY_OF_DISTRO_FEATURES = "x11 wayland"
> diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
> similarity index 91%
> rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
> index 1b38b6ec3a..54e8af6dcf 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
> @@ -9,8 +9,8 @@ SECTION = "libs"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
>
> -SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.313;protocol=https"
> -SRCREV = "4e246c56ec5afb5ad66b9b04374d39ac04675c8e"
> +SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.321;protocol=https"
> +SRCREV = "ec329e2721921f79743b90307ee047d08e057788"
>
>  REQUIRED_DISTRO_FEATURES = "vulkan"
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
> similarity index 95%
> rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
> index 63a3aa4ae6..fa7873b62d 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
> @@ -8,8 +8,8 @@ SECTION = "libs"
>  LICENSE = "Apache-2.0 & MIT & BSL-1.0 "
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
>
> -SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.313;protocol=https"
> -SRCREV = "50b87dd4be883b63c10e3c4f7b9c5aac0c82efd3"
> +SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.321;protocol=https"
> +SRCREV = "fee7b2b4a926355e48668e29570be129eb82cb36"
>
>  REQUIRED_DISTRO_FEATURES = "vulkan"
>
> diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
> similarity index 95%
> rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
> rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
> index cde1be1671..17a290ed1d 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.321.0.bb
> @@ -10,7 +10,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
>
>  SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
> -SRCREV = "43c29e655cb8117fd9cfb65ad9cefe2d40965102"
> +SRCREV = "a8da8ef3368482b0ee9b0ec0c6079a16a89c6924"
>
>  REQUIRED_DISTRO_FEATURES = "vulkan"
>
> --
> 2.43.0
>

