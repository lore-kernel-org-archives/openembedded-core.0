Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA3FC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 22:11:45 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.2485.1738188695253633053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 14:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O8nB85bP;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so575525e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 14:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738188693; x=1738793493; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wU1hU10Yz5SbU+SNJun652sCHJfSOLtgR30U8+4sL1c=;
        b=O8nB85bPjkkRFTCTP5gW/To0pLpryNlWyJa/wxWtN60CPiU78c6AjmwWijfcmSVy5h
         9ruJXh/NHb/rID5g8Mj5297myDINEgI/yEH9F5H+imEOWvnkxplO3Up4a+0VOLdBVDdI
         M8jq2kghCFfmzemRjFBmEnbh1FVSZ4sl1k10WW7T72156l6c4HZM4odOv5B/ILs/6t2Q
         xRjNpEc0UMPCNHDZ8JLbOfD/EvKr2Iox21RpsV7Cy/RVRl1HnEs8+I7BqDIEe4RE5yJU
         jSCpK2H/4nk8jDRQatLQGiEUyBdDcJvz3qH5Fr21p0rBD/8SkaEQZeb9THS0NVnSZrDM
         J1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738188693; x=1738793493;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wU1hU10Yz5SbU+SNJun652sCHJfSOLtgR30U8+4sL1c=;
        b=w5ZsL6gcJs295pCF1nOSjIGzJV137N9EA+B1l4Bb6elosI/nHTIwRawgAx5Vw0+Vjf
         53dLlLZRWuVlDGvpxQ9lkHAS22gjXIFxRGfn3J3YPrBtUhKE56CiiHADe5kLWw2Bv+UE
         3NwaVgCReoN9QQt3+9sKq5gRyikJaQAAH7G+CK+8ynrC+PT5gwO8Jmx6LlyDV6kxfb9b
         dxV+9NSIjpo5b+ZAo3er9RRajyTWDQW46hJbWPXC/2O6Gtw6ZoM0UG7HTvIAIYaVyTJq
         EbQFd+v80TS/kjiQDtvHwizD9bJF/ZWyvsJYgrckuaOQuLOkgYWg180U/XkHCXaABTyp
         wW8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWC6Z0MlGQm+fN/gDhtWNicO/y9eWwMzhmQ5MFN8/oDdgX9wYMaPNa3PXLntGVdWt1TAQDHNfIzYE7dNYLeBbOJRg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXizzbPK/WiY3JokYOCCjtBJ5VBVRv0lmogtq7b3tMwYp7XZdZ
	WXcrh4s3is9febSBAnBJHTZyVyMGrAqH6qx7Aet3nLOEi3aZXRYr
X-Gm-Gg: ASbGncuB12IN4h8ZlLOIRauWB4FAoKkT6CwtTP9ffd/4W9Nvpcxg7u9WouqGwY74BqK
	IJ8asxXuHUsoamOHhscvruhJqL12Q9pB8JNMa4PpemC4443BUQcfQnVb8weRgUknDA/KxkhRe1g
	kyt7pLE7B35gZbuammyaRI479nZGl+wjMCDcPRXvHU5cBrEfy02WDxUvZhe7ghh84WMCbCYCzzx
	5FrEWhkgUBsJ1EVszHItZrNq2OljU7RucPOQkE93iy6Sh1Mhi121MfNK+VSk0x8LLpAE+8qKkjQ
	2McCK2XuSSOlvTqm+pzIbys+ywastVCB2dwbigi5OWd1Jvp8WqZvCamuMu9M5Vl3
X-Google-Smtp-Source: AGHT+IHcM0Shzm25Jln8K6y9fWxHNlBGvnJApJxg3Ctg8KZdJq2ECuUCeilbPm7bbfLGwCeeypYSCg==
X-Received: by 2002:a5d:5f51:0:b0:385:efc7:9348 with SMTP id ffacd0b85a97d-38c519321aamr4076670f8f.1.1738188693156;
        Wed, 29 Jan 2025 14:11:33 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm59955f8f.1.2025.01.29.14.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 14:11:31 -0800 (PST)
Message-ID: <93d70055fbc62dd0dc765f2d2bd471b73f35df9d.camel@gmail.com>
Subject: Re: [OE-core][PATCH] u-boot: Convert ${UBOOT_ENV}.cmd into
 ${UBOOT_ENV}.env
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
Date: Wed, 29 Jan 2025 23:11:30 +0100
In-Reply-To: <20250128145736.2258098-1-thomas.perrot@bootlin.com>
References: <20250128145736.2258098-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 22:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210418

Hi Thomas

On Tue, 2025-01-28 at 15:57 +0100, Thomas Perrot via
lists.openembedded.org wrote:
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>=20
> It is U-Boot environment files that contain environment variables
> in a binary format, that enables compact data storage and allows
> for faster loading and processing by U-Boot.

I'm honestly not able to understand the intent of this change from this
commit message (I'm not a native speaker). But the u-boot and fitImage
related code is already quite complicated because there are so many use
cases that might be supported somehow. So it would be very helpful if
changes were submitted with a clear description of the use case.

>=20
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
> =C2=A0meta/classes-recipe/uboot-config.bbclass |=C2=A0 8 +++++++-
> =C2=A0meta/recipes-bsp/u-boot/u-boot.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 11 +++++++++--
> =C2=A02 files changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-
> recipe/uboot-config.bbclass
> index bf21961977cc..50e16efe50aa 100644
> --- a/meta/classes-recipe/uboot-config.bbclass
> +++ b/meta/classes-recipe/uboot-config.bbclass
> @@ -75,6 +75,12 @@ UBOOT_EXTLINUX_SYMLINK ?=3D
> "${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}-${PR}"
> =C2=A0UBOOT_MKIMAGE_DTCOPTS ??=3D ""
> =C2=A0SPL_MKIMAGE_DTCOPTS ??=3D ""
> =C2=A0
> +# Options for the binary format, such as enabling a redundant
> environment.
> +UBOOT_MKENVIMAGE_BIN_ARGS ??=3D ""
> +
> +#mkenvimage command
> +UBOOT_MKENVIMAGE ?=3D "uboot-mkenvimage"
> +
> =C2=A0# mkimage command
> =C2=A0UBOOT_MKIMAGE ?=3D "uboot-mkimage"
> =C2=A0UBOOT_MKIMAGE_SIGN ?=3D "${UBOOT_MKIMAGE}"
> @@ -119,7 +125,7 @@ python () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for config in ubootconfi=
g:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
found =3D False
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
for f, v in ubootconfigflags.items():
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if config =3D=3D f:=20
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if config =3D=3D f:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 found =3D True
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items =3D v.split(',')
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if items[0] and len(items)=
 > 3:
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-
> boot/u-boot.inc
> index 3270c22e8d42..f1308d65609f 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -4,6 +4,7 @@ PROVIDES =3D "virtual/bootloader"
> =C2=A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> =C2=A0
> =C2=A0DEPENDS +=3D "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-bo=
ot-
> mkimage-native', '', d)}"
> +DEPENDS +=3D "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'env', 'u-boot-
> mkenvimage-native', '', d)}"
> =C2=A0
> =C2=A0inherit uboot-config uboot-extlinux-config uboot-sign deploy
> python3native kernel-arch
> =C2=A0
> @@ -68,9 +69,15 @@ do_compile () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uboot_compile
> =C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0
> -=C2=A0=C2=A0=C2=A0 if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFIX}" =
=3D "scr" ]
> +=C2=A0=C2=A0=C2=A0 if [ -n "${UBOOT_ENV}" ]
> =C2=A0=C2=A0=C2=A0=C2=A0 then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_MKIMAGE} -C none -A $=
{UBOOT_ARCH} -T script -d
> ${UNPACKDIR}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_BINARY}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "${UBOOT_ENV_SUFFIX}" =
=3D "scr" ]
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBO=
OT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d
> ${UNPACKDIR}/${UBOOT_ENV_SRC} ${B}/${UBOOT_ENV_BINARY}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif [ "${UBOOT_ENV_SUFFIX}" =
=3D "env" ]
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBO=
OT_MKENVIMAGE} ${UBOOT_MKENVIMAGE_BIN_ARGS} -s
> ${UBOOT_ENV_SIZE} ${UNPACKDIR}/${UBOOT_ENV_SRC} -o
> ${B}/${UBOOT_ENV_BINARY}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0=C2=A0=C2=A0=C2=A0 fi

Later on in do_install there is:
  install -m 644 ${B}/${UBOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAGE}

Does it make sense to install this file into /boot? Or is this file
type suitable for do_deploy only?


In kernel-fitimage.bbclass there is:

  # Step 3: Prepare a u-boot script section
  if [ -n "${UBOOT_ENV}" ] && [ -d "${STAGING_DIR_HOST}/boot" ]; then
    if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
      cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
      bootscr_id=3D"${UBOOT_ENV_BINARY}"
      fitimage_emit_section_boot_script $1 "$bootscr_id"=C2=A0
        ${UBOOT_ENV_BINARY}
    else
     bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
    fi
  fi

If I remember correctly, ${UBOOT_ENV_BINARY} gets staged and probably
also included into the fitImage. Does that make sense for this file
type?

So it would be helpful to get a bit of context from the commit message.

Thank you,
Adrian

> =C2=A0}
> =C2=A0
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210326):
> https://lists.openembedded.org/g/openembedded-core/message/210326
> Mute This Topic: https://lists.openembedded.org/mt/110859777/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


