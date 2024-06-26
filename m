Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2F5C27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 13:20:10 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.26515.1719408005032718711
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 06:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bt8F+uGF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.169, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ec408c6d94so75729081fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 06:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719408003; x=1720012803; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zruEmGlrjeQKqrFrSgdskDeXG+DhHlXxLCNgeSPAkE=;
        b=bt8F+uGFh6llmwaZGiatb5uvR2vJ7dZnZYEcJyvGw4/m6RUj4Hj3YejiZ0YZgF2Mbx
         etDNeXsFy7ynyQHuN+mYKWtwH7pfw7i049df5bdT0yM2IXSH0LEGgw6Z9Qu5BqB1hGvR
         9wddqAF5SZeVYMYMCf2dAuxwtPDz5NvY0sKPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719408003; x=1720012803;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3zruEmGlrjeQKqrFrSgdskDeXG+DhHlXxLCNgeSPAkE=;
        b=C2jkk21dVUGIJ4UYWksxqKSkzRRRg6/udue8mP18PCEAI2xSOU4rfEAc8P1BfVlF/J
         eY01tVY8KuPltOSrz37kdg+fazQMc0KoVdIDuP3d7pPksULAFiWibQ4v0PqmAjDwYZB0
         EaJgx+2lBdWC4BOT9BzzOuySVAD14EE6wBfdBU/auW5tHMr1FwTpK2fimxDuUjSaQx8Z
         tgFrcHs5Pg8Za3upWKATUVYwALbjGpsl4NeNIacOyg8fvVqiUNBoxZcLiF8zSbasGxsX
         6C+DDzYwQzNkaqQ45WnzYJpJV2DobraHV1KtqOkfl9F9UweyanpXkSxcFDZtB0gy55S9
         J9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMG+wHU3+FCGFlVbicVfR6g5VFhokCWicf8K1KwVpfo9tbjYi4ZKDg0X93HiV0e3cIyw+DT4Sty0zRWgbURCW+Abfn7bWYinz5e3w3TMdehBpxNQszy69u
X-Gm-Message-State: AOJu0YzTVrNxS5ZBdGOMFeI2a4Ahet6NJERbt1Er87172WZDIadhOHrI
	2JKa6c+YsFa8ZEGK1xY/3DRrarEDaYOVQn2kJ1Wxbm/7hZI49W/BrJrD8n3fDvo=
X-Google-Smtp-Source: AGHT+IFKisDZkm0QnVGWv3Mj7/ngoVAc5rxeAD+eUBxMS47rH8uPmosm8JOiLzObb4xfRpuIu+eA/w==
X-Received: by 2002:a2e:8012:0:b0:2ec:557b:f89c with SMTP id 38308e7fff4ca-2ec59329c93mr80585801fa.31.1719408003110;
        Wed, 26 Jun 2024 06:20:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e301:b0b7:be9:7182? ([2001:8b0:aba:5f3c:e301:b0b7:be9:7182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c837f1cesm25194075e9.37.2024.06.26.06.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:20:02 -0700 (PDT)
Message-ID: <88f54166e39db5b6035f21bfad5f08f7a1008007.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] u-boot.inc: WORKDIR -> UNPACKDIR transition
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: leon.anavi@konsulko.com, openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2024 14:20:00 +0100
In-Reply-To: <20240623213254.3215897-1-leon.anavi@konsulko.com>
References: <20240623213254.3215897-1-leon.anavi@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 13:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201161

On Mon, 2024-06-24 at 00:32 +0300, Leon Anavi via lists.openembedded.org wr=
ote:
> Replace references of WORKDIR with UNPACKDIR for U-Boot script
> and variable UBOOT_ENV_BINARY, for example for boot.scr.
>=20
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
> =C2=A0meta/recipes-bsp/u-boot/u-boot.inc | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
> index 45d700fbdd..9a91a0e3d8 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -92,7 +92,7 @@ do_compile () {
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT_ENV_SUFFI=
X}" =3D "scr" ]
> =C2=A0=C2=A0=C2=A0=C2=A0 then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_MKIMAGE} -C none -A $=
{UBOOT_ARCH} -T script -d ${WORKDIR}/${UBOOT_ENV_SRC} ${WORKDIR}/${UBOOT_EN=
V_BINARY}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_MKIMAGE} -C none -A $=
{UBOOT_ARCH} -T script -d ${UNPACKDIR}/${UBOOT_ENV_SRC} ${UNPACKDIR}/${UBOO=
T_ENV_BINARY}
> =C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0}


If that command is writing a file, the written file should remain in
WORKDIR, not UNPACKDIR. I suspect the SRC should probably therefore be
changed but not the BINARY?

> =C2=A0
> @@ -188,7 +188,7 @@ do_install () {
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "${UBOOT_ENV}" ]
> =C2=A0=C2=A0=C2=A0=C2=A0 then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 644 ${WORKDIR}/${U=
BOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAGE}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 644 ${UNPACKDIR}/$=
{UBOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAGE}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -sf ${UBOOT_ENV_IMAGE=
} ${D}/boot/${UBOOT_ENV_BINARY}
> =C2=A0=C2=A0=C2=A0=C2=A0 fi
> =C2=A0
> @@ -324,7 +324,7 @@ do_deploy () {
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "${UBOOT_ENV}" ]
> =C2=A0=C2=A0=C2=A0=C2=A0 then
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 644 ${WORKDIR}/${U=
BOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_IMAGE}
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 644 ${UNPACKDIR}/$=
{UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_IMAGE}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -sf ${UBOOT_ENV_IMAGE=
} ${DEPLOYDIR}/${UBOOT_ENV_BINARY}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ln -sf ${UBOOT_ENV_IMAGE=
} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
> =C2=A0=C2=A0=C2=A0=C2=A0 fi

Which would then make these unneeded?

Cheers,

Richard

