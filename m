Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB26CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 16:03:00 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.web11.1446.1759939373497453698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 09:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e09JFHjX;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-638d01a8719so44785d50.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759939372; x=1760544172; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qHZ3VfDj6wmwL0B8LSDn1phV1aJlRCLg4p0gO9h3Lc=;
        b=e09JFHjXWhsVfgiJYWZhYR5j9RfLSd69yrPtnxbSaNQLB66S8awad9TjNpWVk+0pM0
         aHoJ2PoB1teeediUNrMz65HRVjx1lrP5tAZfOaHxGCdXK1Hq/KgpnRuWJ9c4bWnQE7tJ
         ezg4RQCmTsU80taTEoHm6NwZeW9/EqMeBpj/ED8CfHmS7FK5fXZ714cqS63kpwAXGYZP
         34kRIlQuoAO++XsxFa5EcpJfCNrANDgKenIK14qmFVtEv7XNvSVBhBbC4j19ZCGFhdQo
         KodGUloL6trj5R/oJxqY01HaGAdYASo52sBTqngNID9CEiiRUxwaDUfGpr5LWuubOcH3
         X9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759939372; x=1760544172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qHZ3VfDj6wmwL0B8LSDn1phV1aJlRCLg4p0gO9h3Lc=;
        b=U8RiIo+76MEF5n4HYt3NkUY5OQ5LvGAxzYrn6F9NdErUtqo0hCq1ry7V5/d5kI0MJk
         lkeQvMCx7f9yIuMkk1JPy7C+fnf3coOtynBIsIg5ol46VsE3x/sjFKCf0LzXWCExrYNx
         M8v6HziB2zmqba3W8rx1Pr31P3hBir2opRYS28y+6VnffL8Qypora6BacGWvQucNMxcu
         t88GIMSeDvEw/dQTSfD40lcFLKrY0M9STzmc2C4GtjJ6g9lRbe31KfElVj1qLjbFfhBH
         qnAvh4wl6Rr/dRTtaUxxAJ1TY+6liohR5gL8HzCAbUKfuH1s0J4oAvH7SPbYS6WdUElq
         PruQ==
X-Gm-Message-State: AOJu0YyB0v67XdD1hlP5uhRNi+fDiRWZOQJf7BTftc2ArCld7piSeUYx
	bvIpuWNPKc3I2dtvOmxOrdLvHbAPZUN3yZjoXlnQnpnuPWgBCR4dNANptLm1QdWnlpnYVEVSjj5
	784+vHOuqkZxrOTy8G4vkLExCMlZczrJYwOS6
X-Gm-Gg: ASbGncvYkZo22kWuxqG10nJOCUfP9sF2MYavm2oEGf67Lt3Us2OCdJUmuPD0YM3ZEAx
	2wfESJ/IvJyW1Lz25A32Mm5QmLWl72Ezf4Mskg9RjTqVAin9plZpvAkzM8Dkv23tE7XFWsjbVv7
	bB8/PBQJebem0rlq6pGQOn4DtfELBiDxhpZQwABOZplyI17kEB+RCluQKLID7UEcTXxnmcSpUZW
	zlBtSP24S1JJeLQqOhiS0FW2m8c9XuMNeg7VkAaDWcmvjw4MiGRLYXEIX5O8+mVSpT3HypGDJ6Z
	/2YMeIpEb83UbZf+tTQssTTogUhZHw366zrK7xNadPw9VUlWoLs+nhNtDS7Axl/dQOmNnsiO8lU
	bdPJpplfRmJ5aFC98
X-Google-Smtp-Source: AGHT+IFTMyHh7wVzErKkieYHmH8ceBigJiuG6UEOHuuE56Lf6lgMhIHBZNqR6pkY294b5qyb30zLtegk6/ly1NknIZw=
X-Received: by 2002:a53:ea4b:0:b0:633:b381:5354 with SMTP id
 956f58d0204a3-63ccb905456mr3130681d50.30.1759939371374; Wed, 08 Oct 2025
 09:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251008142620.692102-1-ross.burton@arm.com>
In-Reply-To: <20251008142620.692102-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Oct 2025 09:02:23 -0700
X-Gm-Features: AS18NWDMUod3gTFK4gxS7EFab6K4I-83RiCeLHS2PVbEcc11enFueHU-Fscs1nc
Message-ID: <CAMKF1spkH-aBEiVhCFgSigWDM=WECAK=C2h=9GyN7SLoNcs7rA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] clang: consolidate LLVM_APPEND_VC_REV=OFF
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 16:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224584

LGTM

On Wed, Oct 8, 2025 at 7:26=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> Whilst the change to add TMPDIR to GIT_CEILING_DIRECTORIES should stop
> LLVM from embedding git information into the recipes, also disable this
> behaviour explicitly.
>
> We do this because it's not just the sha of the source tree but also
> the full URL of the repository, which would be an information leak if
> an internal git mirror was being used.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/clang/clang_git.bb     | 1 -
>  meta/recipes-devtools/clang/common-clang.inc | 4 ++++
>  meta/recipes-devtools/clang/openmp_git.bb    | 1 -
>  3 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
> index ca539635902..e10c327a2af 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -57,7 +57,6 @@ SOLIBSDEV:mingw32 =3D ".pyd"
>  #CMAKE_VERBOSE =3D "VERBOSE=3D1"
>
>  EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
> -                  -DLLVM_APPEND_VC_REV=3DOFF \
>                    -DLLVM_ENABLE_PIC=3DON \
>                    -DCLANG_DEFAULT_PIE_ON_LINUX=3DON \
>                    -DFFI_INCLUDE_DIR=3D$(pkg-config --variable=3Dincluded=
ir libffi) \
> diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-=
devtools/clang/common-clang.inc
> index f7b7a1cf9a0..2e9d3d73f92 100644
> --- a/meta/recipes-devtools/clang/common-clang.inc
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -48,4 +48,8 @@ def get_clang_target_arch(bb, d):
>  # install they cause non-deterministic binaries.
>  EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_WITH_INSTALL_RPATH=3DON"
>
> +# Don't embed found git information into the version string as this
> +# will include the git server URL.
> +EXTRA_OECMAKE +=3D "-DLLVM_APPEND_VC_REV=3DOFF"
> +
>  require common.inc
> diff --git a/meta/recipes-devtools/clang/openmp_git.bb b/meta/recipes-dev=
tools/clang/openmp_git.bb
> index 2d86718dee6..b6b1cc29785 100644
> --- a/meta/recipes-devtools/clang/openmp_git.bb
> +++ b/meta/recipes-devtools/clang/openmp_git.bb
> @@ -18,7 +18,6 @@ inherit cmake pkgconfig perlnative python3native python=
3targetconfig
>  DEPENDS +=3D "elfutils libffi clang"
>
>  EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
> -                  -DLLVM_APPEND_VC_REV=3DOFF \
>                    -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \
>                    -DOPENMP_LIBDIR_SUFFIX=3D${@d.getVar('baselib').replac=
e('lib', '')} \
>                    -DOPENMP_STANDALONE_BUILD=3DON \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224583): https://lists.openembedded.org/g/openembedde=
d-core/message/224583
> Mute This Topic: https://lists.openembedded.org/mt/115654687/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

