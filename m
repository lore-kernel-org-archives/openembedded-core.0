Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D37C433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 10:05:44 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.9787.1633514743017061808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 03:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=U4UglQLs;
 spf=pass (domain: burtonini.com, ip: 209.85.221.51,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f51.google.com with SMTP id k7so7016059wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1qOpojViiqh5dfhCI2gA13WXZq96+KdbfOzsJHSPYHI=;
        b=U4UglQLshf7pOIWAoFWsj0uVWCr6enep9UBmDpnIByIpLFI4uveZrJSvJ4iWKlclM7
         183HJ2V+pUr0oOQ77+tCXPR1BFJpA1N0PxzVBNdfrYX0SldhmuRWnIm/bhCkd3ea2E+s
         hu6JgmgREA2uypsYyUemfsqeOFgdanqwShtGmhprQCb/ck/msmC7PGRgHWGUQAEn0zzw
         DQNOPE0+gLXq7OkuLOIsmGw57EIqPPlPs4i0IMCZhL3WrI+p39YRZAStkGFyMRRj8iwe
         8ZRwXSx09JKmzYkzIf3zvkS+yXXcEXlYFHofO0EP9k7j+jZjX0wVCrRZNVaWFj9emP42
         0JaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1qOpojViiqh5dfhCI2gA13WXZq96+KdbfOzsJHSPYHI=;
        b=Oqr4ZLA5mG6q8QMXBMeyyNrpnjIYdXftDttQDvh/JJk4z0AsI+YP+185GqlSppXbUn
         8tetMXd4ClVP9nXCZF6XnvQnbv5lNVkTimqbssmDhAxQnadJ3gG9g6znmkB9saGuvMan
         zfnkJuqC+P6+kmLuuxXLc3XS4qgGx96+qsviioGSrQfF8wMJ8uz5T9R5Xk9uo0SfzCr5
         GiOukZSIVLBmeEE/4nkwgdmaDKzUBWvRRxOJicfx5h3Dm3SggOYndwROfIcTo1zdMNy4
         ogBOsBud2ak+QqJoM1MXm0dq9ky7Ac3A8aOOZ6W+qcLi+J62DUQW/o1c0x4asA6tqCgR
         M5iA==
X-Gm-Message-State: AOAM5305/FlpTf0zih5gn7OpR+cFKLma4u5YxEFagu4p7Zwn61M6aJy8
	6A42en+Fxr21lEKzDRMMSV2wWAXmzgqc4W8yNUsa8g==
X-Google-Smtp-Source: 
 ABdhPJzduglAgA4a1ho1v4VzdT9mEnGvI8z+UWA5DtvXTMh6jvurw9YsrURiz+gBAHTfLvuQoGwmQ+ZD0RBJ1236I74=
X-Received: by 2002:a05:600c:3506:: with SMTP id
 h6mr8684832wmq.62.1633514740844;
 Wed, 06 Oct 2021 03:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633478971.git.bruce.ashfield@gmail.com>
 <9666edbab2d32cc53726d177bb23af9976ef90c9.1633478971.git.bruce.ashfield@gmail.com>
In-Reply-To: 
 <9666edbab2d32cc53726d177bb23af9976ef90c9.1633478971.git.bruce.ashfield@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 6 Oct 2021 11:05:29 +0100
Message-ID: 
 <CAAnfSTs=_KTfkrRNn0bAwjEsG1kDX2MT1O9-Oo9swMh4+_L7fA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] linux-yocto/5.14: scripts/gcc-plugins:
 consistently use HOSTCC
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 10:05:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156684

Can you drop this.  Turns out in fixing it, I broke it more!

Ross

On Wed, 6 Oct 2021 at 01:12, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Integrating the following commit(s) to linux-yocto/5.14:
>
>     724df5812165 scripts/gcc-plugins: consistently use HOSTCC
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.14.bb              |  4 ++--
>  .../linux/linux-yocto-tiny_5.14.bb            |  6 ++---
>  meta/recipes-kernel/linux/linux-yocto_5.14.bb | 22 +++++++++----------
>  3 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
> index a147e632e4..06064706e0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
> @@ -11,8 +11,8 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?= "7630ebb9fd510cf7aa31b6f1dd472f3b0442afb3"
> -SRCREV_meta ?= "42d2cf670ed06f4dddd2a035611a519ea68e2d26"
> +SRCREV_machine ?= "87e920626b63515458e304527509289993be2796"
> +SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
> index 20ff40d267..699c8c7da0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
> @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine:qemuarm ?= "ee2ccc84e65ade5ba0f8e1a700fba29a755746a1"
> -SRCREV_machine ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> -SRCREV_meta ?= "42d2cf670ed06f4dddd2a035611a519ea68e2d26"
> +SRCREV_machine:qemuarm ?= "f956536237159b85f94d70bb9e74b5894e6bf07d"
> +SRCREV_machine ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> +SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
> index 0c6fbff75e..809b6fa066 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
> @@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
>  KBRANCH:qemux86-64 ?= "v5.14/standard/base"
>  KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
>
> -SRCREV_machine:qemuarm ?= "8226a3a65df2dbae0fe71e9ff54cba70a9ba85e5"
> -SRCREV_machine:qemuarm64 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> -SRCREV_machine:qemumips ?= "b5389debd85300e24b877f25c2e90381f1df7678"
> -SRCREV_machine:qemuppc ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> -SRCREV_machine:qemuriscv64 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> -SRCREV_machine:qemuriscv32 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> -SRCREV_machine:qemux86 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> -SRCREV_machine:qemux86-64 ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> -SRCREV_machine:qemumips64 ?= "56cc67b699194944809832f4c8f58b9828f02bf9"
> -SRCREV_machine ?= "7ae156be3bdbf033839f7f3ec2e9a0ffffb18818"
> -SRCREV_meta ?= "42d2cf670ed06f4dddd2a035611a519ea68e2d26"
> +SRCREV_machine:qemuarm ?= "139cd4a6ac01e83002011680d9fbb14048c1bc3a"
> +SRCREV_machine:qemuarm64 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> +SRCREV_machine:qemumips ?= "f5a73ebec6f028075220c690bbb121284313ebd3"
> +SRCREV_machine:qemuppc ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> +SRCREV_machine:qemuriscv64 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> +SRCREV_machine:qemuriscv32 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> +SRCREV_machine:qemux86 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> +SRCREV_machine:qemux86-64 ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> +SRCREV_machine:qemumips64 ?= "912fc3d0cf57239e6fe5030b82165b2d6f0632e3"
> +SRCREV_machine ?= "724df5812165b61d20e93866be8f3e7e1e5e6b5c"
> +SRCREV_meta ?= "a1e3f40a0f4c5d05d1a6110a42d53eb3c3947ec8"
>
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the same
> --
> 2.19.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156661): https://lists.openembedded.org/g/openembedded-core/message/156661
> Mute This Topic: https://lists.openembedded.org/mt/86108488/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

