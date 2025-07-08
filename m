Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADAFC83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:52:34 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.21035.1751986352235900035
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SQTXR9Rh;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fada2dd785so66608256d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751986351; x=1752591151; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ox2Kc6ib7YlmF/JxwEFCvWJQiyiin5DCKcYmM37U/3Q=;
        b=SQTXR9Rh3nQAOaDh+ObuKN3rfdskgg4nTRQRgLOi1V0/aqXvBd1Je+2E5IUJ6HV4sX
         P6bB64fxG8/6Bd63ofZUkhNKMAPf0DzB7HzGUn/YOFinpjxGABQRRtVmmkKX85+Oo5TD
         e4QFpsCd15NNplPCADFA49osWZYOMGe+MGOQeKrO/8nlASGbdtsTBrRn8HB27/8Q+EtW
         RcFMh8ElRwwkm1Dx9kY9mnzcOKBL0FKJ1IOFqIC9rqvr8WuBHDrWiBye+eULeXJ9rn8g
         /vbaJhnhJ2cOpBDH4w06C0OMN+wuJmUlNZJhHg6lk8+cTwbRYh/itszH98bn2THr3JbY
         qx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751986351; x=1752591151;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ox2Kc6ib7YlmF/JxwEFCvWJQiyiin5DCKcYmM37U/3Q=;
        b=C++Q9Ic889MPLniwVJoLA5zlB3TFYBK4z4fTsVtNHWdaVYBcE+nP1hMMJwZkiNc85T
         Wu7YxhAKSG5aCaMZSVGl4ZsoDEkCByvM4fOVfhgkdTjofortJQPMH0KQOfJnIgyoGCU0
         8LJCXHTsQTmuIjGJKk0v8RkwkAWG0bBDXN07VRpHkgM6eUNWS6c6YaSkMlLsGE9+kW/z
         A6grD//AljSm8h55FlRtKgCbWZ7ZkTYzAS4V1qeu17MDThOdM8XFPrbNLHyDQcmwQrhV
         DM3vtrISmHdWxV/jIA2WE34IIXfO/DII5d/S9yW/S8p64JBKISQsuvPKTRgs26FmB+F8
         SNdA==
X-Gm-Message-State: AOJu0Yw/P7jFHkZDz6sJxA6YL6gF197ebNYn5zvAdK9ug6tceJ6OPfeS
	bHh0i54IrRoDeS5L4mNBjPy6t7Dvo0zFB5QHXDiwOYmOLSYaZD02vOgw3P1G8pM6EY8bPmLVlv9
	Rm7/RICaFcYo08+mSwwexBw40eleGDzFLM8pP/pk=
X-Gm-Gg: ASbGncviApoA/4rj44YzO/Sod7hJeE3ySpLfe+bure5poxnJVwTqUpoO7EH6Tx4lAZD
	+OG2r+lmHaFIdhDXePBOkA9yan0T1oCRnyq0vbVaEQAAwuzC7j00AbYGqxGBAMymIkxKxX6jIPQ
	CqXl6cbM0QzyKlT1iXqM+ynJ+qw750JRf/Qqlgk2GLHJmT
X-Google-Smtp-Source: AGHT+IGgAh1RfQOzLbkx1u5FkhPGFTKlLQAamOuQKtcuwL1lBHxjucOQTQHxF4Jl1hcBPacM4AlfHb++M/8Ki8xI0V4=
X-Received: by 2002:a05:6214:c4b:b0:6fa:ab49:4482 with SMTP id
 6a1803df08f44-702c6d7af45mr254142286d6.35.1751986351025; Tue, 08 Jul 2025
 07:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250707071049.3286224-1-guocai.he.cn@windriver.com>
In-Reply-To: <20250707071049.3286224-1-guocai.he.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Jul 2025 16:52:23 +0200
X-Gm-Features: Ac12FXzCcFc_xo9F83Owu0aOX5TH9Kx3KPOAtvxis8VyMKPzjeFljcepsjDpGSU
Message-ID: <CANNYZj8V-z=UHTP+25Au6esPkAriLTsTE5OSGGY1_oz-+W2-Gg@mail.gmail.com>
Subject: Re: [oe-core][master][PATCH V2] wayland: correct the SRC_URIs
To: guocai.he.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 14:52:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220045

Not true. All three have .xz tarballs available at the usual locations:

https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/
https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/
https://gitlab.freedesktop.org/wayland/wayland/-/releases/

What is the problem you are observing?

Alex

On Mon, 7 Jul 2025 at 09:11, guocai he via lists.openembedded.org
<guocai.he.cn=windriver.com@lists.openembedded.org> wrote:
>
> From: Guocai He <guocai.he.cn@windriver.com>
>
> For wayland, wayland-utils and wayland-protocals, not only
> the SRC_URIs are updated, but also the tar.xz are no longer
> available. We have replaced them with the tar.bz2 barballs.
>
> Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
> ---
> V2:
> Add the info of Signed-off-by
> ---
>  meta/recipes-graphics/wayland/wayland-protocols_1.45.bb | 4 ++--
>  meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb    | 4 ++--
>  meta/recipes-graphics/wayland/wayland_1.23.1.bb         | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
> index d98ccf964f..31b7de3a1f 100644
> --- a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
> +++ b/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
> @@ -9,8 +9,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
>                      file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
>
> -SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e4aff19a0c8d856d17cd41ef0"
> +SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/${PV}/wayland-protocols-${PV}.tar.bz2"
> +SRC_URI[sha256sum] = "b73315c26d6c3374c19c2dff7e491f019d8597dc4dcd4473d9181f676f15f48f"
>
>  UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
>  UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
> diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
> index 59d414a0a6..8e4b92969c 100644
> --- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
> +++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
> @@ -9,8 +9,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
>                     "
>
> -SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
> +SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/archive/${PV}/${BPN}-${PV}.tar.bz2"
> +SRC_URI[sha256sum] = "f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb04759678b7bb2da7d16335d18"
>
>  UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/tags"
>  UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
> diff --git a/meta/recipes-graphics/wayland/wayland_1.23.1.bb b/meta/recipes-graphics/wayland/wayland_1.23.1.bb
> index 3a5d91be04..1b29f7762e 100644
> --- a/meta/recipes-graphics/wayland/wayland_1.23.1.bb
> +++ b/meta/recipes-graphics/wayland/wayland_1.23.1.bb
> @@ -12,11 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
>
>  DEPENDS = "expat libffi wayland-native"
>
> -SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
> +SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/archive/${PV}/${BPN}-${PV}.tar.bz2 \
>             file://run-ptest \
>             file://0001-build-Fix-strndup-detection-on-MinGW.patch \
>             "
> -SRC_URI[sha256sum] = "864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81f441929a81e5ed"
> +SRC_URI[sha256sum] = "4afcf2942a39d8276d06dcefc89dfaf029222994778fd4c49aa68a702ebf698f"
>
>  UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
>  UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219978): https://lists.openembedded.org/g/openembedded-core/message/219978
> Mute This Topic: https://lists.openembedded.org/mt/114024117/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

