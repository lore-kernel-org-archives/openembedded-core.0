Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9D7C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 12:34:22 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.14695.1737462860653083674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 04:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=at1hEU3L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso38060435e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 04:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737462859; x=1738067659; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T/HbRdjX6gQ4tTKywNWjvH4/q9vLIWn8ZRcalOhLjE0=;
        b=at1hEU3L5rumxWmeQZDf2d0QQq/Wb1EoaAg8CFnpJoPon1EdyX0X+oVSlHrFm616EP
         403F+djK6kHADp2DF9lVtSYCWD5o/D1XYa9dMT1sJDs72pWd1ftY43opkllDLoEoWnRG
         Nhepkj63v0jkvCnDv1CJRV5SgQZ3UhAZMSk4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737462859; x=1738067659;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/HbRdjX6gQ4tTKywNWjvH4/q9vLIWn8ZRcalOhLjE0=;
        b=ik193YWxKyVb61Q350uBK3flFT6+95RQr07f0kXz63ujRfgCnVHsTIXLN5kiXkYBy9
         GmmqQ7jlyDGS6dPAjJOQvj2+I8mR3LG9gA4m2RkjGHFbcaoaWq4NM5b2mYGxRMHsLZY2
         RKcR1bVeumy0TeyDbmlBMABP9Va8LgXtcOgGUAb6hEtSIhO9oR1sjv/j2RMNt9zUX7J9
         gLslc53F5YTDWr9nLEKkiHv3xLC/JqigPm3kZZ8LIKxEx5Ze7Evo+9/ZJUWsCB/JR1rv
         IwlfdjAO07cG251SkWucgY4maPcJOOPwS64C6np32vh9pJzrrdBzXMe2inzBSmZYHcP0
         YWWA==
X-Forwarded-Encrypted: i=1; AJvYcCVjLYVpjQ/JSb13f9WEOmNRqj9rg3whAHncw0+7ueR4LGmZ9W4MM67F4KL2jSS7oiy4C/Kb93iX4JizHnKkPx/yIA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRDOoNpEJMwhxuZTh+AdCjghFnRNk/T7sGH2v4nr2azGj13N2W
	lhxH1HoVG+vWQYDqO+v8WjWKOU92nkxX+LPPt6vU9S5NTFtjcWJZAIL2ydRIiYs=
X-Gm-Gg: ASbGncstIW+OHR6TCOs48s4sW/kO4OF82ghf3E7/b5eJQR1do3z32aR6L6UJeX+pjwv
	NE4TwKmQgMfJTJg6k/lgUwKnunMlKnHsC753Pl32OPo2kqP/HNTJBrkLeJNqBG0E7wDkXm/Xj8K
	cTfiv6qW+EfK/sv2lh1j/UabLc9gi6901glBC+wjF6PH+W1lOR6M1Tc6ADD8KI3TBaa9um2HZ2D
	u1s75ZVn2lQDWUGWFnUhDEuodxfjwqMiCSD27WpbvAJ4nqolYoSa48lxgQwieSv+DFL/ypLROfC
	trsiP6KngXUI8bHlOJr8KmS3+y2uhkYOBGCmMrplEiyo3U1VXTWFE43MbHo=
X-Google-Smtp-Source: AGHT+IF/QVNyxcACfVFVmLHgcT1N06csGW2yAE+uHUXPrrtpUY2OR7fEm1cUOmON9kamj0BowC2kZA==
X-Received: by 2002:a05:600c:1e0b:b0:434:ea21:e14f with SMTP id 5b1f17b1804b1-438913ed04amr153697875e9.13.1737462858975;
        Tue, 21 Jan 2025 04:34:18 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fff5:d00b:f6db:4bc7? ([2001:8b0:aba:5f3c:fff5:d00b:f6db:4bc7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c0f03984sm180057475e9.0.2025.01.21.04.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 04:34:18 -0800 (PST)
Message-ID: <8c83d1715bb0c8e523f4b947b0f215700f4c8c51.camel@linuxfoundation.org>
Subject: Re: [PATCH v5] u-boot: kernel-fitimage: Fix dependency loop if
 UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Sean Anderson <sean.anderson@seco.com>
Date: Tue, 21 Jan 2025 12:34:17 +0000
In-Reply-To: <20250119180926.41739-1-marex@denx.de>
References: <20250119180926.41739-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 12:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210092

On Sun, 2025-01-19 at 19:08 +0100, Marek Vasut wrote:
> In case both UBOOT_SIGN_ENABLE and UBOOT_ENV are enabled and
> kernel-fitimage.bbclass is in use to generate signed kernel
> fitImage, there is a circular dependency between uboot-sign
> and kernel-fitimage bbclasses . The loop looks like this:
>=20
> kernel-fitimage.bbclass:
> - do_populate_sysroot depends on do_assemble_fitimage
> =C2=A0 - do_assemble_fitimage depends on virtual/bootloader:do_populate_s=
ysroot
> =C2=A0=C2=A0=C2=A0 - virtual/bootloader:do_populate_sysroot depends on vi=
rtual/bootloader:do_install
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D> The virtual/bootloader:do_install ins=
talls and the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtual/bootloader:do_po=
pulate_sysroot places into
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sysroot an U-Boot enviro=
nment script embedded into
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel fitImage during d=
o_assemble_fitimage run .
>=20
> uboot-sign.bbclass:
> - DEPENDS on KERNEL_PN, which is really virtual/kernel. More accurately
> =C2=A0 - do_deploy depends on do_uboot_assemble_fitimage
> =C2=A0 - do_install depends on do_uboot_assemble_fitimage
> =C2=A0 - do_uboot_assemble_fitimage depends on virtual/kernel:do_populate=
_sysroot
> =C2=A0=C2=A0=C2=A0 =3D> do_install depends on virtual/kernel:do_populate_=
sysroot
>=20
> =3D> virtual/bootloader:do_install depends on virtual/kernel:do_populate_=
sysroot
> =C2=A0=C2=A0 virtual/kernel:do_populate_sysroot depends on virtual/bootlo=
ader:do_install
>=20
> Attempt to resolve the loop. Pull fitimage configuration options into sep=
arate
> new bbclass kernel-fitimage-config.bbclass so these configuration options=
 can
> be shared by both uboot-sign.bbclass and kernel-fitimage.bbclass, and mak=
e use
> of mkimage -f auto-conf / mkimage -f auto option to insert /signature nod=
e key-*
> subnode into U-Boot control DT without depending on the layout of kernel =
fitImage
> itself. This is perfectly valid to do, because the U-Boot /signature node=
 key-*
> subnodes 'required' property can contain either of two values, 'conf' or =
'image'
> to authenticate either selected configuration or all of images when booti=
ng the
> fitImage.
>=20
> For details of the U-Boot fitImage signing process, see:
> https://docs.u-boot.org/en/latest/usage/fit/signature.html
> For details of mkimage -f auto-conf and -f auto, see:
> https://manpages.debian.org/experimental/u-boot-tools/mkimage.1.en.html#E=
XAMPLES
>=20
> Fixes: 5e12dc911d0c ("u-boot: Rework signing to remove interdependencies"=
)
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Sean Anderson <sean.anderson@seco.com>
> ---
> V2: Take a different approach, split the kernel-fitimage.bbclass and
> =C2=A0=C2=A0=C2=A0 use it to generate dummy fitImage on demand
> V3: Use mkimage -f auto-conf and mkimage -f auto to break the loop,
> =C2=A0=C2=A0=C2=A0 the fitImage .its source is not even needed because th=
e 'required'
> =C2=A0=C2=A0=C2=A0 property can only have two values, 'conf' or 'image' .
> V4: Restore CC list
> V5: - Add missing trailing backslash after unused.itb
> =C2=A0=C2=A0=C2=A0 - Replace ${UBOOT_MKIMAGE_MODE} with $UBOOT_MKIMAGE_MO=
DE
> =C2=A0=C2=A0=C2=A0 - Move -d /dev/null to the end of mkimage invocation
> ---
> =C2=A0.../kernel-fitimage-config.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 50 +++++++++++++++++
> =C2=A0meta/classes-recipe/kernel-fitimage.bbclass=C2=A0=C2=A0 | 54 +-----=
-------------
> =C2=A0meta/classes-recipe/uboot-sign.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 27 +++++-----
> =C2=A03 files changed, 65 insertions(+), 66 deletions(-)
> =C2=A0create mode 100644 meta/classes-recipe/kernel-fitimage-config.bbcla=
ss

This looks great and I'm nearly ready to merge it but I do have one
further request. Instead of creating kernel-fitimage-config.bbclass,
could you create something like meta/conf/image-fitimage.conf?

There is already precedent for this with image-uefi.conf and you can
include with require ../conf/image-fitimage.conf. I'd like to see
config variables being in conf files rather than class files.

Adding some comments at the top of the new file explaining which config
settings are there and what it is for would also be good.

Thanks,

Richard


