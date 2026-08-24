Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38165C5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 15:50:31 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.807.1787586630572865687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 08:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b8chGelg;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso28661335e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 08:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787586628; x=1788191428; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xdMginP6QyObU/ZqgPri6cPS8fb8n7foTypvKPHoLkY=;
        b=b8chGelgi50q8A02DzL1/+Ap824oqYUBkhxzYudrNy/YShji+JwXyXhP0P+A/qCmLk
         /YRmzcmcLImfA63H4hIhaSsrFNyIjVnF1fj2ewjDWgu/t8D93UaQUuXIiYx7MlDAWWAz
         5mgmc9EViHkam1stcZsEN9QaGse+TBK2fViLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586628; x=1788191428;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdMginP6QyObU/ZqgPri6cPS8fb8n7foTypvKPHoLkY=;
        b=Qg9TaJzAmKNl0/oIfIAOKRC+f46cdkmqQpGAwc6dz3LSiz9K4+oFAawvOJ+a1WPKz5
         fcdREwxGr6FFvDEEPiRBIKfU/492lliqAN+lgtgpcUH4rVAF994HomvMgnWv5sG+zBW8
         LrNWHWBf/XIAQq9s+emo939lUOKXGRhnO+IthnKi2pzDtn5G9mGe3rAp7hlbsnhQr8F1
         kvKtbMsbm9j5J0uot6ln+9YUkyUbf1Id3/zF7ZPRzFDvhnDbYiZGfIUX5EXQR8N/7rjV
         QLbrr4+nNajN73poJuNRvKtjl/H3rFTfyrTFWPUw815XuxmmD62fJaF14eI+XyGEejLR
         gvnA==
X-Forwarded-Encrypted: i=1; AHgh+RpcrvIDkIOynK4XKWCsMttP1IeVL2xIppTdcOw1dhicGgyBUCszNGDCIhlI+CDezmuMCd5z5kHK4yvxkkRiO2ZJRg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mHga39dmdlhksWyScXKTZ0DFYip6iPuSmLJw9Vi8YVv9gnJEfk
	dP0sqTtB5MgoAqDm3o7CfQROvrKyyEkNxSZjvqq0YtM5hjlC6s+yzppf2SeSJOqE4Qk=
X-Gm-Gg: AR+sD11UP6+uamHzZ+S9cMbdYF2eruiJmYjqQaLpphBqkYFq6XS008RLo+CteVGWVVv
	mJCVHNPKXALp6ahht2Z+U172cis8QLgMBsOCU1YtjfiLNUjRqqlNf6R7mWPpD8HZJqDOXUOSeEi
	1gxRm3WJq8sToVMZnlithbAExkaWopk3MiC6vV0JXbaP3ghn3twvW0pFFJH0HAWAAp1bv/Zv+fR
	S0bow5VpnXCDLEYq6zhUcjHuwxmwFYagkaMyOjJfbuWnsex28It4lGQaSaE4mlHmn694znXy+Z4
	W9a5Vzw/a+ogj4c439KkVC6uj9/6W2GSeqcYwXadoyZe3JA84lKsMw//9ifa1RhF665gkRB+zK6
	CEU49B6syPPr72SHC7NYmjKgqi3nEZ9ZW4qejpfBaJp0QqGkZE8Ifia0qNS7U+FfNnVtUP1Qkyn
	sHHvHMLOV4wLecbBpCS1k8Zfi8VzWC5kqa7psXykvOnIJ87aXMdOqC7z/SUsrvuwGFiGpZeoJR0
	DNdRjNAc7pxue8L2UxZwbLkrALnPrXY/y13civykZ9/6vlm
X-Received: by 2002:a05:600c:6211:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499b8465f7dmr387280785e9.10.1787586628486;
        Mon, 24 Aug 2026 08:50:28 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d5cbd4f2sm1415175e9.0.2026.08.24.08.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:50:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 17:50:27 +0200
Message-Id: <DKXAKNXPFUD7.12UEBJYNWJU49@smile.fr>
To: <bruce.ashfield@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH][scarthgap] linux-yocto/6.6: fix tiny build
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260818193126.299021-1-bruce.ashfield@gmail.com>
In-Reply-To: <20260818193126.299021-1-bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 15:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244135

On Tue Aug 18, 2026 at 9:31 PM CEST, Bruce Ashfield via lists.openembedded.=
org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Integrating the following commit(s) to linux-yocto/6.6:
>
> 1/1 [
>     Author: Bruce Ashfield
>     Email: bruce.ashfield@gmail.com
>     Subject: pinctrl: core: include gpio/driver.h for struct gpio_chip
>     Date: Tue, 18 Aug 2026 14:34:22 -0400
>
>     Stable commit f53dd26462b8e ("pinctrl: remove pinctrl_gpio_direction_=
output()")
>     [ upstream 45d2055b0067 ] changed pinctrl_gpio_direction_input/output=
() to take
>     a struct gpio_chip * and dereference gc->base. Those functions are co=
mpiled
>     unconditionally, but in 6.6 core.c the struct gpio_chip definition is=
 only
>     pulled in via "../gpio/gpiolib.h" under #ifdef CONFIG_GPIOLIB. Config=
urations
>     with CONFIG_PINCTRL=3Dy and CONFIG_GPIOLIB=3Dn (e.g. linux-yocto-tiny=
 on x86, built
>     with --allnoconfig) therefore fail to build:
>
>       drivers/pinctrl/core.c: error: invalid use of undefined type 'struc=
t gpio_chip'
>
>     Include <linux/gpio/driver.h> directly so struct gpio_chip is always =
a complete
>     type, matching how mainline core.c has included it since commit ec963=
d04ca865
>     ("pinctrl: provide new GPIO-to-pinctrl glue helpers"), present in 6.1=
2/6.18 but
>     not 6.6.
>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ]
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_6.6.bb               |  4 ++--
>  .../linux/linux-yocto-tiny_6.6.bb             |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 24 +++++++++----------
>  3 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_6.6.bb
> index 39fa0a56c2..1d4f95e42c 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> @@ -14,8 +14,8 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to linux-yocto-rt to enable it")
>  }
> =20
> -SRCREV_machine ?=3D "c0f2d7109571c01223cbd3738db96b5ea20ddc68"
> -SRCREV_meta ?=3D "b768be4d32d53a825349353e988ca5930e83f99c"
> +SRCREV_machine ?=3D "eaa4bfd4f99ab0f3cf46ec5a207b73e22fb1c3f9"
> +SRCREV_meta ?=3D "dd201eb6ec53179f45836d41610ca68c725d28e2"

Hello Bruce,

If I'm not mistaken, this patch does not apply on top of your 6.6.150
upgrade[0] but on top of a 6.6.151 upgrade that you did not sent (unless
I missed it). We saw the 6.6.151 upgrade here:
https://git.yoctoproject.org/linux-yocto/log/?h=3Dv6.6/standard/base

Can you send a series with 6.6.150, 6.6.151 and the tiny fix on top?

Thanks!

[0]: https://patchwork.yoctoproject.org/project/oe-core/patch/2026080716403=
8.2624029-2-bruce.ashfield@gmail.com/

> =20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine;protocol=3Dhttps \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-tiny_6.6.bb
> index 7675e32542..f2d6e5eef5 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> @@ -17,8 +17,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
> =20
> -SRCREV_machine ?=3D "20c2ecb592178ed51039ae1a75a523c66c1eee5d"
> -SRCREV_meta ?=3D "b768be4d32d53a825349353e988ca5930e83f99c"
> +SRCREV_machine ?=3D "c51e01ecff210644b5d199a4edb30cb1a94a746f"
> +SRCREV_meta ?=3D "dd201eb6ec53179f45836d41610ca68c725d28e2"
> =20
>  PV =3D "${LINUX_VERSION}+git"
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.6.bb
> index 7a273f9cc6..c1ac8e0a08 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> @@ -18,18 +18,18 @@ KBRANCH:qemux86-64 ?=3D "v6.6/standard/base"
>  KBRANCH:qemuloongarch64  ?=3D "v6.6/standard/base"
>  KBRANCH:qemumips64 ?=3D "v6.6/standard/mti-malta64"
> =20
> -SRCREV_machine:qemuarm ?=3D "06b8a8a900edeb9770128b2e25e7814ff0638c72"
> -SRCREV_machine:qemuarm64 ?=3D "bcdc0007d72899e94de35713c4c18e0ad581f41b"
> -SRCREV_machine:qemuloongarch64 ?=3D "491a3d5683a61ca2a7911f748661cfad50b=
8d05c"
> -SRCREV_machine:qemumips ?=3D "9023f83c1acc4010d43c5891c641a671a12d264e"
> -SRCREV_machine:qemuppc ?=3D "a76593fcb6c3b2183877d531562237a9def7acc5"
> -SRCREV_machine:qemuriscv64 ?=3D "491a3d5683a61ca2a7911f748661cfad50b8d05=
c"
> -SRCREV_machine:qemuriscv32 ?=3D "491a3d5683a61ca2a7911f748661cfad50b8d05=
c"
> -SRCREV_machine:qemux86 ?=3D "491a3d5683a61ca2a7911f748661cfad50b8d05c"
> -SRCREV_machine:qemux86-64 ?=3D "491a3d5683a61ca2a7911f748661cfad50b8d05c=
"
> -SRCREV_machine:qemumips64 ?=3D "50376ca9492c97cc4d6d291d06e52db021aeb1f1=
"
> -SRCREV_machine ?=3D "491a3d5683a61ca2a7911f748661cfad50b8d05c"
> -SRCREV_meta ?=3D "b768be4d32d53a825349353e988ca5930e83f99c"
> +SRCREV_machine:qemuarm ?=3D "ed7cf749dcade8ded9fda05be53c235a446dcbff"
> +SRCREV_machine:qemuarm64 ?=3D "b96d2d770cab02b84c46606fa538ce027bee6b08"
> +SRCREV_machine:qemuloongarch64 ?=3D "5ae544e1312ed5b4ed130d22ff1f4433349=
4c4c3"
> +SRCREV_machine:qemumips ?=3D "fcfa6f13ad7894cedda5f59124e7a6f6f0100a67"
> +SRCREV_machine:qemuppc ?=3D "89811e5148d2a4c925940684ad9126bd08de9799"
> +SRCREV_machine:qemuriscv64 ?=3D "5ae544e1312ed5b4ed130d22ff1f44333494c4c=
3"
> +SRCREV_machine:qemuriscv32 ?=3D "5ae544e1312ed5b4ed130d22ff1f44333494c4c=
3"
> +SRCREV_machine:qemux86 ?=3D "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
> +SRCREV_machine:qemux86-64 ?=3D "5ae544e1312ed5b4ed130d22ff1f44333494c4c3=
"
> +SRCREV_machine:qemumips64 ?=3D "b6dc41bac21f990565fffb211d470fdc97533291=
"
> +SRCREV_machine ?=3D "5ae544e1312ed5b4ed130d22ff1f44333494c4c3"
> +SRCREV_meta ?=3D "dd201eb6ec53179f45836d41610ca68c725d28e2"
> =20
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the=
 same


--=20
Yoann Congal
Smile ECS


