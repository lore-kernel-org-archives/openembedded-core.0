Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A271CE7AB8
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 06:55:33 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.29544.1725605729276137599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 23:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AOtP3XHJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-277e6be2ef6so928730fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 23:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725605728; x=1726210528; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPHzhgBN1/+fNEbm/tj5NZc6gTy69TFGoRP+maMFLHY=;
        b=AOtP3XHJat+lNjK9Qc3XN3tB1+Xp3CbmhUUsekgV3t9IE5K8x6o46BfXrqJGYqoZGT
         uj3jvt0kM/CFjfRaPOo3KYCr2xLu3GwxM86r9K3rjdK3b7Ynq+HuwCVrEgeWUjLwF/lz
         CfdwXr4eOq/cr5pJv1oCHOkyL/oeli2zv1fvAUibL0tiaeVGI301ciRcD9dJcetvIZQd
         haPCxMN6kR5ekCANARJWU1GXO2wq78v8uJbKPeCyJSdYe7LxVIXWJQQe82aktTlObbMI
         h1xcSA637wUpYzMLNeakUZ8oBZcAJiH1BjLDrqzf0il1TG2LRLvnWrkEbckLweQRTChM
         Jjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725605728; x=1726210528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPHzhgBN1/+fNEbm/tj5NZc6gTy69TFGoRP+maMFLHY=;
        b=FGN3CS7k5D2YtaQZ1cIE/RQ9g+NpWKT5bradxz+hDCLx9eRWj9FdsjJLYRwSGJwuhc
         f3UR0rAYURpmprXtygyymuki9x2Xp2UcZLHPieN8mB05omvSJ2WvhcXy/DjuWq054Oad
         wZZ1eHOXIui6jFdtoRsfKvOaF3TwuxO0BOpjgZ80+z9/lQiSM1b+zRRM8RuetD02e2bh
         ghTP4eQq8gc2dOt4hvF982H+rqp7h7+OleIvXCLXK3KUVOwZl6dj8n85H2r2LvVeK5TA
         ysthJjagP+XDNer2LTJFBKPDOexvTBdj2OYgpBqPDT4vljNCFpA9j3A8Cbdx8pQnxJ/g
         tWhw==
X-Gm-Message-State: AOJu0YzKovx1WTclrP3fklTKDIUdZAfOTueZHD6x5gm+cCgItmQTEJNa
	WTKtqGztcjxv3G42ZI9D5lXLFSacPE13OwMjs6dsa/OgG48eC0RTv6VdNLUF00kDzetpQj9Q0y/
	hViyXbyFd9xnBb1BlsLE+4GYkV/9yQAXV
X-Google-Smtp-Source: AGHT+IE45EPmy6CYcPcaRcpbyKEfediwQR+DtgddVm1+TqQPCM1UgDMJ86KqEsgy5vo00xxRTWm60lyUH/P0d1mCP+I=
X-Received: by 2002:a05:6871:3a06:b0:277:ecd2:7b7 with SMTP id
 586e51a60fabf-27b82da1a88mr2074890fac.7.1725605728305; Thu, 05 Sep 2024
 23:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240904052544.2082232-1-raj.khem@gmail.com>
In-Reply-To: <20240904052544.2082232-1-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Sep 2024 23:55:02 -0700
Message-ID: <CAMKF1sqN3U0uSv7E+5ZMOS_F+fWcax9Xm1xy+wOf1N-H9OT_MQ@mail.gmail.com>
Subject: Re: [PATCH] gcc: Fix spurious '/' in GLIBC_DYNAMIC_LINKER on microblaze
To: openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Cc: Mark Hatle <mark.hatle@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 06:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204247

This needs backporting to kirkstone and scarthgap as well.

On Tue, Sep 3, 2024 at 10:25=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Mark Hatle <mark.hatle@amd.com>
> ---
>  ...fine-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINK=
ER-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0007-Defi=
ne-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> index 6ff16e38e19..4ed55015519 100644
> --- a/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0007-Define-GLIBC_DYNAMIC_LINKER-and-=
UCLIBC_DYNAMIC_LINKE.patch
> @@ -1,4 +1,4 @@
> -From b597a2bc85ffdcf780731a44de02799ebc3d8f61 Mon Sep 17 00:00:00 2001
> +From 4067ae345f0ff1fbf37c0348f2af09257513b817 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:24:50 +0400
>  Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> @@ -184,7 +184,7 @@ index e5d84e180e3..98cb49c189f 100644
>   #undef GNU_USER_TARGET_LINK_SPEC
>   #define GNU_USER_TARGET_LINK_SPEC \
>  diff --git a/gcc/config/microblaze/linux.h b/gcc/config/microblaze/linux=
.h
> -index 5ed8ee518be..5553e7cac21 100644
> +index 5ed8ee518be..299d1a62c81 100644
>  --- a/gcc/config/microblaze/linux.h
>  +++ b/gcc/config/microblaze/linux.h
>  @@ -28,7 +28,7 @@
> @@ -192,7 +192,7 @@ index 5ed8ee518be..5553e7cac21 100644
>   #define TLS_NEEDS_GOT 1
>
>  -#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
> -+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "/ld.so.1"
> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
>   #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
>
>   #if TARGET_BIG_ENDIAN_DEFAULT =3D=3D 0 /* LE */

