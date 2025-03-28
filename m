Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264D9C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 04:33:54 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.4365.1743136433261279973
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 21:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mXk2gACu;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3feaedb39e9so465447b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 21:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743136432; x=1743741232; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TijRzL6IzQc/GH5SOm8leWC48HhI/fPSXPRYJ60z0dQ=;
        b=mXk2gACu0ceP1WuQymQs3NnrrzqujMqjGOLoRggeFnwSL8APzGBA4Lq8Ujb7pPYAYF
         HUma8qWZvX0koJOpPyPxLfpJC6wRV0j4KgYV1iOQOYsrhUVtB0as59jaSt2G0YsNYVyv
         ySq4Ryz1viPol4Qf+0U9k1VC3BoZDVfaSypnRL3HMDjs0rDlHBXYtUn2FLycEZQyVahi
         0C9bOpWBWGZxv3eLPf4CTLaiElHFRT3jov70I3wXdLEwonhpb7FVhf+/Uv0F9IEPDnMX
         KFr/GUMYPWbUViOF8keVGbDdyIaPLMJFuscq0Kos0W5wK493RGwyqrMCUVxzOH3mANC8
         GG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743136432; x=1743741232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TijRzL6IzQc/GH5SOm8leWC48HhI/fPSXPRYJ60z0dQ=;
        b=bQI/PTByZ4PEPS+5uIRkh+2zS3WcLZkQMAIRonvNcmdtHrWMS43vKcJYbARofimwON
         8En0Zd17V3GcZ5RJuaTSj0aQhWXE3o9TmzAfktzzReLiLu4YXidK9IpzgI4POc6ZlCAh
         AwaEV3nHKsQm+6C/6CqYwJX46wwDUTslkEvXIbQKaAuA1Uf6HZ0Vv6eMc6R/aR6QbFvl
         ZUJlAZPvbTxt7kQGDLk/wcBVuC8W89Vjhw0nHHpATLZKl0XZ+OXqhwvpZ8NN3OfporVj
         VCLflhUqTiWdPPuN/EGv30i++HymIxW0Vv9xAw3nMJHdpXHjLLu6bdtMvL8mGf51Qtuc
         w3dA==
X-Gm-Message-State: AOJu0Yz6NdxtVa7E59soX0vin4IJIKCkg3uDVjKX/dtH/IN5ogTwqU7v
	Sa3LMItdoL9BybySFXFQZeUJuivubGE09SDB9UfvZkL04jc0WZledkJJziovmBusNLgrYDPBOct
	25WBzZRM0eZ3SsOMyOkUuVlYtz7g=
X-Gm-Gg: ASbGncu86GT70/f0a4jc2oNGKJfg4VwSEB9bnqY/HkxCXEG0pB2Ww2BqBP9/1AVU+dT
	wDa1JkVOGTRMPw5mcO7jn2lFmc/yVkIghWoxqwhA5EPxJiqoCt/H7vd80Z95lwAmrvrYWw15WbN
	OwWZ40kMh2X/qaSXj96uJQiBdxclTslHIjO8g=
X-Google-Smtp-Source: AGHT+IHoeOC8IudrHweEINdbXKqLhdjSzLp7a0h1BeMbXpYkFdIXVl01kpwE11GB7/VBdSZjJCQpvSJ9/kfBSaz1/fo=
X-Received: by 2002:a05:6808:3986:b0:3fc:1f7b:c3c7 with SMTP id
 5614622812f47-3fefa552377mr4179903b6e.15.1743136432013; Thu, 27 Mar 2025
 21:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250327221807.2551544-1-dmitry.baryshkov@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Mar 2025 21:33:26 -0700
X-Gm-Features: AQ5f1JqZcGf7IQ1-wl1XftOxrV8Qz_jyL1OgKPWXBV1VZL8zBZusV36YfOUlgII
Message-ID: <CAMKF1sqc5pj33tDH0XMSSSM33H+8FxsWZ+rGvpNxM7N4PN=QyA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] mesa: upgrade to 25.0.2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 04:33:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213808

On Thu, Mar 27, 2025 at 3:18=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> libclc is required in order to build Intel drivers in Mesa 24.1 and
> later. Thus OE-Core is currently locked to the 24.0.x branch, which is
> no longer maintained, having last release in June 2024.
>
> A clean solution is to package Clang, then use it to build libclc and
> SPIRV-LLVM-Translator (required for Mesa OpenCL support). However
> creating proper recipes for Clang is a long process (ongoing by Khem
> Raj).
>
> This patchset attempts to solve the issue in a simpler way: by building
> libclc and SPIRV-LLVM-Translator together with the LLVM. This way we
> don't have to create target Clang recipes, there is no extra toolchain
> to support, etc. Clang binaries are creted as a part of the build
> process (in order to support building target packages), however it only
> hits the LLVM sysroot-native and is only used by the LLVM target build.
>
> Future work by Khem (once Clang is properly supported in OE-Core) should
> allow us to create proper recipes for libclc and spirv-llvm-translator
> and drop them from the llvm / clang recipe.
>
> I think this approach provides a good balance between OE-Core being
> stuck with the outdated Mesa release and being able to upgrade it,
> bringing support for new hardware.
>
> Last two patches of the series bring in RustiCL support, a new OpenCL
> implementation within Mesa. They are optional for the sake of the
> upgrade and can be dropped if there is any issue with those. RustiCL
> support is mostly compile-tested at this point.

I took a look at the patchset, I don't have any particular objection to it.
Since this is too late for walnascar release I think this will be considere=
d
for next release only atm. In that case, Since clang is also deferred until
next release I wonder if we should do it along with clang merge into core
but then I don't see big conflicts in there, it could even make mesa stable
and a good litmus test for clang merge if that happens after it.

>
> Changes since v1:
> - Dropped YOCTO_ALTERNATE_LIBDIR patch
> - Reworked mesa / LLVM integration to always use get_option('libdir')
> - Reenabled AMD Vulkan driver (got disabled because of c&p error)
> - Moved mesa-clc options to the libclc PACKAGECONFIG to fix several
>   build errors
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Dmitry Baryshkov (6):
>   llvm: move libLLVM.so.N.M to llvm-libllvm package
>   llvm: use OECMAKE_SOURCEPATH to specify cmake dir
>   llvm: support building libclc
>   llvm: add SPIRV-LLVM-Translator support
>   mesa: upgrade 24.0.7 -> 25.0.2
>   bindgen-cli: a tool to generate Rust bindings
>
> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi (1):
>   mesa: add support for RustiCL under PACKAGECONFIG "opencl"
>
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  .../bindgen-cli/bindgen-cli-crates.inc        | 186 ++++++++++++++++++
>  .../bindgen-cli/bindgen-cli_0.71.1.bb         |  19 ++
>  ...ossCompile-pass-SPIR-V-headers-path-.patch |  40 ++++
>  .../llvm/llvm/fix-native-compilation.patch    |  67 +++++++
>  .../llvm/llvm/spirv-internal-build.patch      |  27 +++
>  meta/recipes-devtools/llvm/llvm_20.1.0.bb     |  76 ++++++-
>  ...-meson-do-not-pull-in-clc-for-clover.patch |  53 -----
>  ...lude-missing-llvm-IR-header-Module.h.patch |  41 ----
>  .../0001-drisw-fix-build-without-dri3.patch   |  58 ------
>  ...on-t-encode-build-path-into-binaries.patch |  46 ++++-
>  ...son-use-target-path-for-Clang-libdir.patch |  57 ++++++
>  ...cross-compilation-arguments-to-LLVM-.patch |  64 ++++++
>  ...on-t-try-zink-if-not-enabled-in-mesa.patch |  42 ----
>  meta/recipes-graphics/mesa/mesa.inc           | 102 +++++-----
>  15 files changed, 625 insertions(+), 254 deletions(-)
>  create mode 100644 meta/recipes-devtools/bindgen-cli/bindgen-cli-crates.=
inc
>  create mode 100644 meta/recipes-devtools/bindgen-cli/bindgen-cli_0.71.1.=
bb
>  create mode 100644 meta/recipes-devtools/llvm/llvm/0001-cmake-modules-Cr=
ossCompile-pass-SPIR-V-headers-path-.patch
>  create mode 100644 meta/recipes-devtools/llvm/llvm/fix-native-compilatio=
n.patch
>  create mode 100644 meta/recipes-devtools/llvm/llvm/spirv-internal-build.=
patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-Revert-meson-do=
-not-pull-in-clc-for-clover.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Include-mis=
sing-llvm-IR-header-Module.h.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-drisw-fix-build=
-without-dri3.patch
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-meson-use-targe=
t-path-for-Clang-libdir.patch
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-rusticl-provide=
-cross-compilation-arguments-to-LLVM-.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0002-glxext-don-t-tr=
y-zink-if-not-enabled-in-mesa.patch
>
> --
> 2.39.5
>

