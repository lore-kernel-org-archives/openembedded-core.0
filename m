Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F33AC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 14:09:11 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.27617.1719410949233873823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 07:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CSWnWocw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a72510ebc3fso533985466b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 07:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719410948; x=1720015748; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTk+Yyl3aX+QExaogybfumBUuq4c9pR0Fm2tiBrBw54=;
        b=CSWnWocwkpCG/AulU9k6+dzcu9QNgFJ1+RZPpxsB2ETgsaWRfHn1Op2phblR1FeWwS
         vD2yqEBv3N92lP1SgbOZZl5mN5++SFiJkR3iQdnybcpPNriPKStnEdiq+G/mRX3GyGW9
         EDpgqu3cwTBmto2J2to2PYC2t8Auih0d1fZR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410948; x=1720015748;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fTk+Yyl3aX+QExaogybfumBUuq4c9pR0Fm2tiBrBw54=;
        b=xNYw6nTX4YHenshrBY1VovDTi2zjG4dy+N5nuGejP05ptYf6FS//Pw4ZTsUWHJyqcS
         9Y+UloAsYnn+94TbiAbRsKx+hkd7aqrnPkopTSzo+BUAnh0PrPEhGOLA/KhM4duF4jrV
         hN+BSNlyhXNiVIXCBZjSpgxAuTIbvRqh0Qqs47M3Ut0ez2Z38xBcR0zXd2V7kJVc+l4H
         gCNLbvX0UNhKlXzhDQKkFXW0fCRefqLwe/YIyQfgStWL2XTD9NPLAeEGMQMowOGb1JHk
         5/ZJR/KtfYiGURccGgRuMdka7Jxcdnjd1OXSjlqKZtpEO0dSTZKKE0ATBbD6YNn1Prvv
         30MA==
X-Forwarded-Encrypted: i=1; AJvYcCXvLoJgTtXOlA5zTPfNkjUFg7diGTodkVg9D1KbXh/pjwtY3+h/ZwnkFxdWqexFhZByZnOLkz2sP2n4ki/L8MDujf2WbgdezX0EKDC8EUaCU4RLFctzFvg7
X-Gm-Message-State: AOJu0YxrTCjLWtLOAxabLc94hbvvZfDalMLbcSGWyP2ptFnG8hNC++2T
	BQmJCHSevf8qKHpVc/J1TPrhH3AW/h82MvxNvZZrt5dfL+wyNoyY6UNwHw3NS94=
X-Google-Smtp-Source: AGHT+IG1974HL5oKeXESZEdLyL+pzqhn/yUlPAd3R6KMykcDhBrg8x2do7dK0L/t6nd5zC1lciMi2A==
X-Received: by 2002:a17:907:104b:b0:a72:554d:82af with SMTP id a640c23a62f3a-a72554d8570mr693018066b.20.1719410947564;
        Wed, 26 Jun 2024 07:09:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1693:fa63:dd08:d447? ([2001:8b0:aba:5f3c:1693:fa63:dd08:d447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724ccb4ddesm370469366b.64.2024.06.26.07.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 07:09:07 -0700 (PDT)
Message-ID: <925ec48934b53e9f53d6998fe730078c6e5de365.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] u-boot.inc: WORKDIR -> UNPACKDIR transition
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@cherry.de>, leon.anavi@konsulko.com, 
	openembedded-core@lists.openembedded.org
Date: Wed, 26 Jun 2024 15:09:06 +0100
In-Reply-To: <c38d4947-f02b-4e4a-982a-131a27ed0941@cherry.de>
References: <20240623213254.3215897-1-leon.anavi@konsulko.com>
	 <88f54166e39db5b6035f21bfad5f08f7a1008007.camel@linuxfoundation.org>
	 <c38d4947-f02b-4e4a-982a-131a27ed0941@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 14:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201167

On Wed, 2024-06-26 at 15:34 +0200, Quentin Schulz wrote:
> Hi Richard,
>=20
> On 6/26/24 3:20 PM, Richard Purdie via lists.openembedded.org wrote:
> > On Mon, 2024-06-24 at 00:32 +0300, Leon Anavi via lists.openembedded.or=
g wrote:
> > > Replace references of WORKDIR with UNPACKDIR for U-Boot script
> > > and variable UBOOT_ENV_BINARY, for example for boot.scr.
> > >=20
> > > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > > ---
> > > =C2=A0=C2=A0meta/recipes-bsp/u-boot/u-boot.inc | 6 +++---
> > > =C2=A0=C2=A01 file changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-=
boot/u-boot.inc
> > > index 45d700fbdd..9a91a0e3d8 100644
> > > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > > @@ -92,7 +92,7 @@ do_compile () {
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "${UBOOT_ENV}" ] && [ "${UBOOT=
_ENV_SUFFIX}" =3D "scr" ]
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 then
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_MKIMAGE} -C none =
-A ${UBOOT_ARCH} -T script -d ${WORKDIR}/${UBOOT_ENV_SRC} ${WORKDIR}/${UBOO=
T_ENV_BINARY}
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${UBOOT_MKIMAGE} -C none =
-A ${UBOOT_ARCH} -T script -d ${UNPACKDIR}/${UBOOT_ENV_SRC} ${UNPACKDIR}/${=
UBOOT_ENV_BINARY}
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> > > =C2=A0=C2=A0}
> >=20
> >=20
> > If that command is writing a file, the written file should remain in
> > WORKDIR, not UNPACKDIR. I suspect the SRC should probably therefore be
> > changed but not the BINARY?
>=20
> WORKDIR still isn't cleaned between builds of a recipe I assume? While=
=20
> migrating to UNPACKDIR gets rid of patches that were once in SRC_URI but=
=20
> aren't anymore (or other files for that matter), using WORKDIR as a=20
> temporary directory between tasks is going to be an issue depending on=
=20
> how the other tasks are going to behave. If the logic using the file is=
=20
> the same as the logic for creating the file then it shouldn't be an=20
> issue. But if the logic using the file is just checking whether the file=
=20
> exists, then using WORKDIR is an issue since it won't be cleaned between=
=20
> builds of the same recipe.

Correct.

> Maybe we should go for ${B} instead?

${B} would probably be an improvement, yes.

Cheers,

Richard



