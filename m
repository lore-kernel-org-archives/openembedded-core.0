Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 468DCC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 07:04:31 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.14475.1682579061597734892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 00:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hKABS8OV;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-38e3228d120so4884724b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 00:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682579061; x=1685171061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phfzHrNWKSK6W0hiEx8ZEEDyYvRIcxIG/1cCAmJBg0g=;
        b=hKABS8OVSYQ5WVfu/B3xqkAy3OPIEsftd3aRgZ6qssQY6kDDuA8PO6iYpP1aBgeFO2
         mattM99u0S+QFFWI38lVYBV+B/S5BcQ9qsto0gCSbSwf6ipSGDbc41LvJXCfh0ZiHQdB
         NgdHo5NrI0coUWoVXIZAcKEMMgvIXGZ2cxDrsui/pVLwBG1bUa2EgmmRmzev1YRYsqDI
         0fHYcSxvB2b/pE+lmmFOw+RfAd0Ck0rjDqFoXptdeC6aiv57nwm1Mo5/r0oBZOrTk3sJ
         fNJE65bRa2MaSdw60DZt1aBGFNbjPIOAEuFzcGSlRweppE83U07PB8BAlDpZBxpTFiOL
         QwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682579061; x=1685171061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phfzHrNWKSK6W0hiEx8ZEEDyYvRIcxIG/1cCAmJBg0g=;
        b=PMQS50z8UuQw73lq6jGd/83NbyK/VyUWvb0rJC4R9bVuWuff1IDMzRzWFBB+zjtrNc
         0xNqCluk0ATS3KvHsrJAJUMEifreTA6b+5WRKwPVC45lue2OxGwyYIRuIoiNceC91p8E
         d5M6EilTnavl4dxKurChZ5wvOjFdD+uXTnIb9LWJwvCoTwBvbStuCsBJOkUVCRbAlgf6
         C0aRahFDc4AyW7X3+hba4IHWkMiI3MOfkalQMEDOP4xqgIjO1Dsa5fnFv6I6J8nzW9ik
         /aJy5hHQJolZGPrmhMv5zZdDmkykTIW3Sn2Xorz/1MnvzdVYvGt9/l8ub3GfLrblirXe
         rT3A==
X-Gm-Message-State: AC+VfDz4GzjKGeDeNs+Ode/O/uvTKR5qHWPmB38o0hWam/6+wFNhYIrb
	jK85pDRJHIcYpgwgJq1hb5qXphkf60ER+F30tdw=
X-Google-Smtp-Source: ACHHUZ7ILe/7BxzgJkobspeDXHeHZeSveRnsfbT95MPS7+qQPnqKd9UbzJRmXflnGziTCV26sc2hTKdxkT6cBcklVBQ=
X-Received: by 2002:a05:6808:b39:b0:38e:4a8e:d7e0 with SMTP id
 t25-20020a0568080b3900b0038e4a8ed7e0mr259923oij.21.1682579060635; Thu, 27 Apr
 2023 00:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-5-alex@linutronix.de>
In-Reply-To: <20230426095036.2632847-5-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Apr 2023 00:03:54 -0700
Message-ID: <CAMKF1sqsu_F4JS6f+=TfzJmv_Eq7VKpTFDd5OeBXjzRez76P8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/11] bitbake.conf: set minimum required kernel
 to 5.15
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 07:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180470

On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> In particular this enables a number of useful features in glibc, such
> as actually using 64 bit time_t versions of kernel syscalls:
>
> https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/unix/sysv/=
linux/kernel-features.h;h=3D07b440f4eea364b05fa49bf71ceebf78f80efe13;hb=3DH=
EAD#l164
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/bitbake.conf | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index afd9e2f5527..2db84a46eed 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -469,12 +469,7 @@ SDKPATHINSTALL =3D "/usr/local/${SDK_NAME_PREFIX}-${=
SDK_ARCH}"
>  # Kernel info.
>  ##################################################################
>
> -OLDEST_KERNEL =3D "3.2.0"
> -OLDEST_KERNEL:aarch64 =3D "3.14"
> -OLDEST_KERNEL:nios2 =3D "3.19"
> -OLDEST_KERNEL:powerpc64le =3D "3.10.0"
> -OLDEST_KERNEL:riscv32 =3D "5.4"
> -OLDEST_KERNEL:riscv64 =3D "4.15"
> +OLDEST_KERNEL =3D "5.15"
>

While this might be good, does this fix anything specific for enabling
64bit time_t.
This change means we are implying that yocto wont work with kernels
older than 5.15  and maybe SDK would also need
5.15 on SDK hosts and similar need for build hosts might be imposed
too. Perhaps it would be good to do some due diligence before
applying this.

>  # SDK_OLDEST_KERNEL can't be set using overrides since there are
>  # none for the SDK architecture. Best to set it from a machine-sdk
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180423): https://lists.openembedded.org/g/openembedde=
d-core/message/180423
> Mute This Topic: https://lists.openembedded.org/mt/98511406/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

