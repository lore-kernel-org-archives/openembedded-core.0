Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1801EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 03:18:08 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.10323.1686799077827156249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 20:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VnlnC5Lp;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3416b5df9b3so1686155ab.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 20:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686799077; x=1689391077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwUKuZNBHTLLkReEPAyZ/YI3HnzuxZUvsLpfn2gWqng=;
        b=VnlnC5Lp6FwJssE4g2hS3stjjZWAM379gz8lDHmtkTVL32xO2GsONZN/HGrX0me3Kh
         wDxC3DV8VfHmesuLCIJtdCc+KHnevUH4rjvNTgmnFvhmCb/+/n/wwQbqDPoXAuCzZNWN
         /Bt7+RyjtOlZwwGtIiXgnGAAZoWPOq3AJqvbpOf+SWMWf8N47Q/Mj27ysQ9GXtuhjkny
         WqWRp4w9lsB6BXmXOtvf7gOYkYYFbhk0U7BiI0782gwfwIiEzIvtFolE9YHVu+xadQWt
         6XsRoDFD0/SUabOy3M/QYRSZjVWcOI4Tj/hY+A2ONZIqtdMeQp5wdpREUC+i8eaOmMPW
         jQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686799077; x=1689391077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cwUKuZNBHTLLkReEPAyZ/YI3HnzuxZUvsLpfn2gWqng=;
        b=WaVGliGCzEp7Gsi25D/9iyW3CDUVIyW7SNnQdo49Xy6b1GBd4477I+SZzn6lC6fGm1
         0m46P8lKMdp7YmsWms6RwvrRAshcUnRY80AVRBAD698CdaJEBy71bfSgKEnRpx+SVYnr
         YfazbiQmx2zevJNYTludnks3hs9Yv1g5pRsVHYskar298j4Ed+U1+LyiAStRL2ZEn5P3
         H3nHpJKCJoxV1M3W53o0ejPfU1wNtDpS5G+cXYUubZjziGVxljC4hyk+GrA/wye9VnLz
         Amz0VziiqY79uGHg014F0+ylN7yHo5TiS7EFZUvgB7KWZlbJuA8GBv59D8MUYmdrC6Ke
         VB5w==
X-Gm-Message-State: AC+VfDwtsg245k3msfvF0j+Ga/qoRHx4jO/QVF2ilCNPkS8Z8QmurPFy
	h9dsVZN1WB7mTaCrXxfDzDMRxO3Sgs3s5RqsFKY=
X-Google-Smtp-Source: ACHHUZ7/kExrGxryVCrKMq9g1dBV+BtIM4EjsYQOKRDKAbawZD5gnPtkROgGtud7hbeFbnAPRCwp0WhfbI9QlHlz7NQ=
X-Received: by 2002:a92:d181:0:b0:340:a4b0:1a3d with SMTP id
 z1-20020a92d181000000b00340a4b01a3dmr3394495ilz.24.1686799076915; Wed, 14 Jun
 2023 20:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <1768B6BA80848FCF.29648@lists.openembedded.org>
In-Reply-To: <1768B6BA80848FCF.29648@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Jun 2023 23:17:52 -0400
Message-ID: <CADkTA4OVMoUfv6pC=uuow--osCFpsMT0NBfWrdf_0sSPh9+f7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto/6.1: fix intermittent x86 boot hangs
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 03:18:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182829

On Wed, Jun 14, 2023 at 11:16=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
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
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>
> Richard,
>
> As requested here is the revert of the x86 clock fix that is suspect.
>
> You'll need to restore the other dropped linux-yocto version bumps
> to apply this patch.

I've also queued this in the kernel-cache master branch, so if
upstream still hasn't
resolved the issue, it won't reappear in our upcoming 6.4 reference kernel.

Bruce

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
> Mute This Topic: https://lists.openembedded.org/mt/99542122/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

