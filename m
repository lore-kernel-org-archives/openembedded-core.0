Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45338C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 22:03:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.275.1741298580250904419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 14:03:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hl1cRcTt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bcb1a9890so16063775e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 14:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741298578; x=1741903378; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4UMAAGc2j5hj4DnzeKQJZ/oziHzN22ch8Kcd5qs/EGc=;
        b=hl1cRcTtZWLMUc/mFIUFICnDE6LGaC20I5XW1VSCS2P3r9cJnWLtxmzVZ5ueb+kekC
         /Ua3P+cS+iJxLqgo1b7Et7bzrEhtmwNIKl8nvQCrFO+5ZeMxjM+gnI+4BlZTdlgZMpHo
         KACOATBocPeattADUWGwRPdx4rOVgKzbR59/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741298578; x=1741903378;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4UMAAGc2j5hj4DnzeKQJZ/oziHzN22ch8Kcd5qs/EGc=;
        b=sSv7FhX2uxJuCLjhDuLBMHob+BAx3ANgtoyJE2XvY12uzoh4VzmaFdP4FYpMcKiar2
         DZp50hILoKUj1dGHLKKJ3XkQo0vjmjFCPxl//nSxL8g3E8DSRTMSEz7U6EoZNd14y2CJ
         x8MQxFem5/MnRi/tXzXBSJ+mqF48aIWmK0SWrC0xvul3jdz2jqp+HPB4HzIxvEHLQbsD
         8jvN5U4fpoJ9mBH+R9DVLbri+gwP44T0qDP8eU4m0y27R1NkhEVsfYn+IfklkjzEAoeK
         FFaoheDZ3c37srwoy8vw9i/nSHpGSj1Uy8cfXnuRemuRiYwT1vyB6OBpP3x9MnaimZkU
         rzyw==
X-Forwarded-Encrypted: i=1; AJvYcCWCmBG1c9q+ofSFEQLSKvhCV6O836V0w2oMMVF31IX9ybP4zKdXIZjZ/3Um7ilY+RRGARqc/qOLBT0pLYjLo5c6vw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzUJsQEytOu2P2oysoTngFTH1ucr7PL+Wo6uv+tAJlTLF4fhhE3
	yoljvByoiZTlRH1nbuurjJMo9SCT3sL8qMJ1JrfggvlbLbqKSpnwuwRG9VVMO9Y=
X-Gm-Gg: ASbGnctVbrBzsnu6zL0pB2RSj+wuWFkUK3bGAoU9LjMEcyPTGzJNPFgikxBrjrwP8xI
	Jb4L4+R54812Ogi9Z1AsTnQtkck3HUEg1rUBH97squTllO5UOssQbXxRZJDfSydAyfNMft2tyiC
	aeexQwcP1KDXE+Oxwfj7Vct/QJNaGGaD49mKq67h+H3yxmDEPRUGbJjwz63lLCz6qibx+xtJt00
	ZqfjbKVL0Lek263f8OBS8/wOIQYETdCIydEkIR9DKDltumk8MYP5Au38+vBbXwmx+58ag8h3+Vr
	lTC0M8Ouvnda4W0qA7kwNsN2cfwcGsX7UUfHjuYcGCY27/ELIWPaKIns+Ow5vTp1Koa0smuerNC
	s8EnpR49pBns1Y5QcOlsYTk5JiYyT
X-Google-Smtp-Source: AGHT+IFYfRq8P9+DHJo6/85hPyF9MICH+nwL1tzCNK/DHO/ICJ9qT7+GBay2WymEzo5D8gWTHD2gRg==
X-Received: by 2002:a7b:cb94:0:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43bdb38f1fdmr42698595e9.9.1741298578554;
        Thu, 06 Mar 2025 14:02:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2d49:705a:d4c1:b0? ([2001:8b0:aba:5f3c:2d49:705a:d4c1:b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4352eccsm61051745e9.27.2025.03.06.14.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 14:02:57 -0800 (PST)
Message-ID: <e6e54559c99cf639e8c082196af5a2853b2bcfd4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-arch: use file-prefix-map in KERNEL_CC
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: S.Mueller-Klieser@phytec.de, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 06 Mar 2025 22:02:57 +0000
In-Reply-To: <20250306-fix_tmpdir-v1-1-3575a7ec43af@phytec.de>
References: <20250306-fix_tmpdir-v1-1-3575a7ec43af@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 22:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212405

On Thu, 2025-03-06 at 17:46 +0100, Stefan Mueller-Klieser via lists.openemb=
edded.org wrote:
> When building external modules, macros can include absolute names of
> kernel headers. The macro-prefix-map for the STAGING_KERNEL_DIR is
> currently missing. Add it by switching to the file-prefix-map which
> includes both.
>=20
> This fixes reproducible builds and following build error:
> ERROR: cryptodev-module-1.14-r0 do_package_qa: QA Issue: File <..>
> cryptodev.ko <..> contains reference to TMPDIR [buildpaths]
>=20
> Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
> ---
> I don't know if this is the preferred solution. The macro-prefix-map
> could also go into the modules-base.bbclass. But then we have yet
> another place where KERNEL_CC gets modified and ordering matters. With
> this patch it is done similiarly to the default cc settings in
> bitbake.conf except by switching to the file-prefix-map.
> ---
> =C2=A0meta/classes-recipe/kernel-arch.bbclass | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recip=
e/kernel-arch.bbclass
> index b32f6137a2fe02f7a56a746cc3f4e76f1528e5a0..145ce24a48f52eb44be08c03f=
1110a228e899747 100644
> --- a/meta/classes-recipe/kernel-arch.bbclass
> +++ b/meta/classes-recipe/kernel-arch.bbclass
> @@ -71,7 +71,11 @@ HOST_AR_KERNEL_ARCH ?=3D "${TARGET_AR_KERNEL_ARCH}"
> =C2=A0TARGET_OBJCOPY_KERNEL_ARCH ?=3D ""
> =C2=A0HOST_OBJCOPY_KERNEL_ARCH ?=3D "${TARGET_OBJCOPY_KERNEL_ARCH}"
> =C2=A0
> -KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-l=
d=3Dbfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=3D${STAGING_KERNEL_DIR}=3D${=
KERNEL_SRC_PATH} -fdebug-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL=
_SRC_PATH}"
> +KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
> + -fuse-ld=3Dbfd ${DEBUG_PREFIX_MAP} \
> + -ffile-prefix-map=3D${STAGING_KERNEL_DIR}=3D${KERNEL_SRC_PATH} \
> + -fdebug-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL_SRC_PATH} \
> +"
> =C2=A0KERNEL_LD =3D "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
> =C2=A0KERNEL_AR =3D "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> =C2=A0KERNEL_OBJCOPY =3D "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARC=
H}"

At first glance, file-prefix-map sounds great. The challenge, at least
last time I checked, is that some tools don't process it and only
process macro-prefix-map (perhaps the C preprocessor?). This meant we
had build failures last time I tried to simply the entry in
bitbake.conf.

I'm ok with changing it in this file but we may want to copy what
bitbake.conf is doing and set both?

Cheers,

Richard



