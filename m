Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD43C001B0
	for <webhook@archiver.kernel.org>; Sun, 16 Jul 2023 19:36:05 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.4633.1689536159679667142
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 12:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=eWvCIMnl;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-991ef0b464cso1058585066b.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 12:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689536158; x=1692128158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmnxJP5YnPteIGqO1eZFbqxX9oZXGgwXoFG2cY+9+Xo=;
        b=eWvCIMnl8/ESeZBuNKa1aVjbIU3/l96Nkwks+Av6aPyl10kOeAteqIurwwKdRLIq9W
         QnX8Bedd/kL1wGyYpEql1XujX+VMsoakP4ekFogeTvzxMTzLabFaJjVT/SklHM4JFy8g
         qhdlIiBeaKD8LjHDCbZcrjOPIqxps83o16WZ8NL/VFoarEqGqWEui8EvcVTiDpPHer4w
         zRI8BY7qzU7YYwN4mQHu07/gDMT4Enig+wcli4B0TwKK4V27Xa0TrQJt3b/Hbpj6CTQC
         hD2dgtxGqqo5ZE63UPXvfu062oaly977eBEN21xTxqc0WwVJ3vfm0xLx9Ywps6xcUSHo
         WW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689536158; x=1692128158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmnxJP5YnPteIGqO1eZFbqxX9oZXGgwXoFG2cY+9+Xo=;
        b=Jw5ZYz7KxjLme9688wCqRILTB+YqUY1OQ/lilhNXeBZMrc6Moo5ekzHY7o3lV+AWQz
         TL8UBgehIT9wFAWxiEJ0YFgprpPQooKA763F2cOgWmpfad+O0tTm6bv0bMDTNKhUe6Ap
         h/D+U1/MkkEEdJIf3kEJsWSNmOHVLyshiFHQsabsbSvN1n5v+gBMh0Oz6INEOBcT1DY0
         vj7Nl+qI5FUz/9N4qOJhQ1399ZIlTiAv072FIoOAe7bBLO/24Rd5cYgLQk999StBLnPP
         t2/w3viNJ0uNXVOidnJHA2Pz4KrkKh1GFTNn8t3wxh7ERMYaeTU9r7Wz+14XfSCHGgtO
         VJag==
X-Gm-Message-State: ABy/qLYwblIs+1J4Q1anc/8tG4mm0BTaO8PfO+xGVWe6V7eh7KE1Xx2H
	hYuVwnMm24u+qqfdKu9VWCgt8AfmguC/ClQcMImsdg==
X-Google-Smtp-Source: APBJJlFI5Ehv0LD/FkEWP3p6IGsfiYNzmIE4UFd+9GvfxzsRTM7pGZSTmLlwE68YWR95xLaXploEFGdVHwdUx0G76Ag=
X-Received: by 2002:a17:906:109e:b0:98e:1a0c:12c0 with SMTP id
 u30-20020a170906109e00b0098e1a0c12c0mr9179309eju.7.1689536157847; Sun, 16 Jul
 2023 12:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230615031608.29371-1-bruce.ashfield@gmail.com>
In-Reply-To: <20230615031608.29371-1-bruce.ashfield@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 16 Jul 2023 09:35:47 -1000
Message-ID: <CAOSpxdYsbGaLo8Hy1=HXDw1GjJe_Gzb8GUSBumKxqeuxYg1MQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto/6.1: fix intermittent x86 boot hangs
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 19:36:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184420

On Wed, Jun 14, 2023 at 5:16=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> The commit in question appeared as -stable backport in 6.1.28, which is
> where we started to see intermittent boot hangs on x86.
>
> Richard noted that others are seeing this is well, as can be seen in
> this thread:
>
>     https://lkml.org/lkml/2023/6/13/1460
>
> We bump our SRCREVs to pick up the revert:
>
>     947f660bde07 Revert "tick/common: Align tick period with the HZ tick.=
"
>

Unfortunately I am seeing something quite similar on Kirkstone with 5.15.11=
8:

[    0.222916] Freeing SMP alternatives memory: 48K
[274824.332965] smpboot: CPU0: Intel Xeon E3-12xx v2 (Ivy Bridge)
(family: 0x6, model: 0x3a, stepping: 0x9)

Full log:

https://errors.yoctoproject.org/Errors/Details/716736/

So I suspect we will need the same fix there too :-(

Steve

>
> As requested here is the revert of the x86 clock fix that is suspect.
>
> You'll need to restore the other dropped linux-yocto version bumps
> to apply this patch.
>
> Bruce
>
>  .../linux/linux-yocto-rt_6.1.bb               |  4 ++--
>  .../linux/linux-yocto-tiny_6.1.bb             |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 24 +++++++++----------
>  3 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_6.1.bb
> index 4a2a3ca4ab..1033d307f4 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
> @@ -14,8 +14,8 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?=3D "6871194107bd40397162bfca0a9ef06661057c50"
> -SRCREV_meta ?=3D "1dd270d3231f82d94d2123b95e4eb576019440a3"
> +SRCREV_machine ?=3D "2993cbe41f0f859331c81d6ec8001b094f53cb9e"
> +SRCREV_meta ?=3D "db25e51e2006721528f5e7bcd8f4501592bd74fe"
>
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine;protocol=3Dhttps \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.1;destsuffix=3D${KMETA};protocol=3Dhttps"
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-tiny_6.1.bb
> index bfc1c7652c..2be9eb9c36 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
> @@ -17,8 +17,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>
> -SRCREV_machine ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f16"
> -SRCREV_meta ?=3D "1dd270d3231f82d94d2123b95e4eb576019440a3"
> +SRCREV_machine ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d38"
> +SRCREV_meta ?=3D "db25e51e2006721528f5e7bcd8f4501592bd74fe"
>
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.1.bb
> index 53a583e0a3..f5554e26db 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
> @@ -20,18 +20,18 @@ KBRANCH:qemux86-64 ?=3D "v6.1/standard/base"
>  KBRANCH:qemuloongarch64  ?=3D "v6.1/standard/base"
>  KBRANCH:qemumips64 ?=3D "v6.1/standard/mti-malta64"
>
> -SRCREV_machine:qemuarm ?=3D "cff918ff5ee0001dec6493620535d8804f02cd8b"
> -SRCREV_machine:qemuarm64 ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f16"
> -SRCREV_machine:qemuloongarch64 ?=3D "6034b10d39687bbd6769e4adb2a792524e6=
b4f16"
> -SRCREV_machine:qemumips ?=3D "7a59adc4cd39bea852101be2873855cfc835ef45"
> -SRCREV_machine:qemuppc ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f16"
> -SRCREV_machine:qemuriscv64 ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f1=
6"
> -SRCREV_machine:qemuriscv32 ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f1=
6"
> -SRCREV_machine:qemux86 ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f16"
> -SRCREV_machine:qemux86-64 ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f16=
"
> -SRCREV_machine:qemumips64 ?=3D "273e099163a72247262a495cb73889d2e0ed6d2c=
"
> -SRCREV_machine ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f16"
> -SRCREV_meta ?=3D "1dd270d3231f82d94d2123b95e4eb576019440a3"
> +SRCREV_machine:qemuarm ?=3D "93797f49c15b6ce9656a607626437e76a3b6c6da"
> +SRCREV_machine:qemuarm64 ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d38"
> +SRCREV_machine:qemuloongarch64 ?=3D "947f660bde07ee4111bc96d08b142a6ce37=
53d38"
> +SRCREV_machine:qemumips ?=3D "1279631d08d52a5b20044404da4b01205ba4b725"
> +SRCREV_machine:qemuppc ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d38"
> +SRCREV_machine:qemuriscv64 ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d3=
8"
> +SRCREV_machine:qemuriscv32 ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d3=
8"
> +SRCREV_machine:qemux86 ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d38"
> +SRCREV_machine:qemux86-64 ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d38=
"
> +SRCREV_machine:qemumips64 ?=3D "3b25f845f704021fbe223ef48ab22ff5fa3886b9=
"
> +SRCREV_machine ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d38"
> +SRCREV_meta ?=3D "db25e51e2006721528f5e7bcd8f4501592bd74fe"
>
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the=
 same
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182828): https://lists.openembedded.org/g/openembedde=
d-core/message/182828
> Mute This Topic: https://lists.openembedded.org/mt/99542122/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

