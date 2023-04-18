Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747CBC6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 16:55:04 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web11.15052.1681836902633903226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 09:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=QPczdm+f;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6a5e7482961so401976a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 09:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681836902; x=1684428902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrxFHTVgl3f31gFelB/yfYUSRY8D4jSIvIXY9/6EeNQ=;
        b=QPczdm+fdUpBRuTzu9phTQfM/r36r7kXcadmK5D5Bn6FUUZ1GImqF2NQvyzm57PipN
         wtHaVWFhAbynST00jrlkYRPlWtDuzoj7LZ8h7j4Me5rq8RluJZeitllMTVcsRVc/Tc0e
         UCXBlqij43Dncl80MV8Yyjf7hDzVAFOABEc24gbxifaZpHBWFH2oK6OWKadGGSfGDsrs
         jDv0MxfhR3QtnM2giOVAfuCl3O7V7j55Dbkd115N4WYsGiQHZ59rrvLCF99rOS6Z2PWl
         lkf4GlYb8YuI1rOeI0CLERVhHLfJ2kyc7tFEIc457Mp1dg1eQ5OQh3CufS4Rq1CCgBeO
         BqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681836902; x=1684428902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrxFHTVgl3f31gFelB/yfYUSRY8D4jSIvIXY9/6EeNQ=;
        b=lfDPqkDNvOFGdDdd+j2J3R4aZu3xMw4IioBc2OPxHxV0wXr3HuQQgXad5W3DbnNVwX
         BAGCOL8hw4dYh3F7F0nBTokYzEOcTXxElVWoyqWrdkoCIzJTvjJE3Vp8injhHRVV4fim
         7Puu8ij01MOERxonyHhcaxl+s17MN5vm0OUeBSGubMbyFbb0q2NJpAhOZyA+KvYrQ7VB
         1m6GnOK74dfCSgsN/9OI5+CTStEqCR1iWSHYENYfSfCnr2SVZ9HsFodkmIvsD1XH2MjU
         fZ57IxTt09GjRa5xlKmuVXS6c/TCgwZa/oHJsaEtH6Wetzk0Ks2GjHQ/TT1OZCcbZo1E
         JBVQ==
X-Gm-Message-State: AAQBX9fd7WYM3Kw/znIcregHSZ1Zz7Dg/CcP8nWqzfKCBobAop1lr6LW
	DYfk6kRkvwH/bKtYHZJv506iDfKXPxOVw75PQjE=
X-Google-Smtp-Source: AKy350ajkBPBAPAZXMlrrAuwznCgkd8YY8WYXFMCo1D9ua5P4XGj5wEa3w5XdqyRdghiZdcGxrjgWvyuUeNj6psGJ0w=
X-Received: by 2002:a05:6870:b620:b0:184:1a2c:83df with SMTP id
 cm32-20020a056870b62000b001841a2c83dfmr1368827oab.4.1681836901694; Tue, 18
 Apr 2023 09:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230418164100.4035328-1-ross.burton@arm.com>
In-Reply-To: <20230418164100.4035328-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Apr 2023 09:54:35 -0700
Message-ID: <CAMKF1soH2QOZq6cBEp_+ktybne=t3iy=hxcxeTPGCPT8wNXi0A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] machine/qemuarm*: don't explicitly set vmalloc
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 16:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180199

On Tue, Apr 18, 2023 at 9:41=E2=80=AFAM Ross Burton <ross.burton@arm.com> w=
rote:
>
> In 5c6064 the qemuarm* machines gained vmalloc=3D256, because in testing
> Bruce was seeing problems when the vmalloc area was too big for the
> memory size of the machine (eg 256MB).
>

default seems to be 128M for 32bit systems with memory < 1G and 256M
for memory < 2G
but I think using defaults might be preferred it works with original proble=
m too

> The intention was for the area to be very small, but 256 bytes is too
> small and the kernel sets a minimal vmalloc area of 16MiB:
>
> [    0.000000] vmalloc area is too small, limiting to 16MiB
>
> However, a 16MiB area is too small and results in pages of messages when
> you try and use the system:
>
> [  242.822481] vmap allocation for size 4100096 failed: use vmalloc=3D<si=
ze> to increase size
>
> There have been a number of changes since this commit, remove the
> explicit vmalloc argument and use the default.  I've tested that the
> system still boots locally.
>
> [1] early_vmalloc(), https://elixir.bootlin.com/linux/latest/source/arch/=
arm/mm/mmu.c#L1170
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/machine/qemuarm.conf   | 2 --
>  meta/conf/machine/qemuarmv5.conf | 1 -
>  2 files changed, 3 deletions(-)
>
> diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.c=
onf
> index c5234231e2e..aa9ce882035 100644
> --- a/meta/conf/machine/qemuarm.conf
> +++ b/meta/conf/machine/qemuarm.conf
> @@ -17,8 +17,6 @@ QB_SYSTEM_NAME =3D "qemu-system-arm"
>  QB_MACHINE =3D "-machine virt,highmem=3Doff"
>  QB_CPU =3D "-cpu cortex-a15"
>  QB_SMP ?=3D "-smp 4"
> -# Standard Serial console
> -QB_KERNEL_CMDLINE_APPEND =3D "vmalloc=3D256"
>  # For graphics to work we need to define the VGA device as well as the n=
ecessary USB devices
>  QB_GRAPHICS =3D "-device virtio-gpu-pci"
>  QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd"
> diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarm=
v5.conf
> index 6e59e42c3ab..ef1b4ece230 100644
> --- a/meta/conf/machine/qemuarmv5.conf
> +++ b/meta/conf/machine/qemuarmv5.conf
> @@ -12,7 +12,6 @@ SERIAL_CONSOLES ?=3D "115200;ttyAMA0 115200;ttyAMA1"
>  # For runqemu
>  QB_SYSTEM_NAME =3D "qemu-system-arm"
>  QB_MACHINE =3D "-machine versatilepb"
> -QB_KERNEL_CMDLINE_APPEND =3D "vmalloc=3D256"
>  QB_GRAPHICS =3D "-device virtio-gpu-pci"
>  QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd"
>  QB_DTB =3D "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-y=
octo', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180198): https://lists.openembedded.org/g/openembedde=
d-core/message/180198
> Mute This Topic: https://lists.openembedded.org/mt/98348317/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

