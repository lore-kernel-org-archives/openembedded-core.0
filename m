Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5956DC27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 21:59:20 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.4928.1718315950693336328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 14:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LwpA01WH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42198492353so12739895e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718315949; x=1718920749; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PJUWFpXJ1IxzEyle4nbWoswkAT2Cuihl3uuCLLwcMU=;
        b=LwpA01WHBbwiDOwNvO6CSqAouepme1T0MT9FWhIuReoNMADSFyNQ3Kv13SpYUqC7nc
         AdGF5j1Wlp/ZNcYwNhktlXtLzPzCMf39uLg0Ctr3zxGEYVqncMkr7yUc11nvfJg72Vfk
         V1hwOZYVpjqPtU76FUeUHQVTOsofXkH3MlejQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718315949; x=1718920749;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7PJUWFpXJ1IxzEyle4nbWoswkAT2Cuihl3uuCLLwcMU=;
        b=BhBTT+MYxv16Yqb8ahT+gauPL/2mXjTKyAg2D7K+Y4lkE1RHFM4snf4nacawzbRjL0
         Y3ce/F7SlvMPFsaQmMKJHxQ0M+gmwfv/ngKoXhyVDn0Xze8QGaI7LDReDz5pq9HT851i
         3glGQpM/BpYs80ExQfew52buUV7zbSShdIKw4qgrqtIhqXmm5QfGWC4N8z1crt6NOeV5
         K68Sup3qFNJKLNlP27Uf3JZAWkOL3JaZuRPc6u1dTAo43pYLcqck05/VAZcheYBQuNeS
         IqN/X0AEDEX3cXM/uDp1W65quijfMzaMZf9gUNyZGKrIlHOXHdQf7KyaV/iJ8A2Ifkps
         9LWg==
X-Forwarded-Encrypted: i=1; AJvYcCVlax8xe05b0UksPzhPk99MUYH6UHZ1Pu+qEma672tGD7rjuwcIc5fEeUR4uisEk0c1UVhvbgbPAwrRs+Cfpd6dB8at5pvzPhpq4/PBPp3kdyBiv+Zx03tW
X-Gm-Message-State: AOJu0YwtfX+m40ZbgqfGJ63DD3p13pNCn+K89DVQq30RT9y7GP75fdei
	rQ5nZ9stPlW5E3F+cvKx2pEaLkH0cuBIBCDZD8t3bZUyeWy/0Mx1CCGhkNvQwj2Lgy61Ms+rFxc
	H
X-Google-Smtp-Source: AGHT+IGmymlSRlgIYX2jLf0hwEj0b7Q56ZOupLxcjfn5gijRmDitAAZF8MGY3Uo1idyyWK9ViNLtyg==
X-Received: by 2002:a05:600c:350b:b0:421:83fd:9022 with SMTP id 5b1f17b1804b1-4230484eec3mr8646155e9.31.1718315949099;
        Thu, 13 Jun 2024 14:59:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6937:7920:d:ef6c? ([2001:8b0:aba:5f3c:6937:7920:d:ef6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360751037absm2674067f8f.91.2024.06.13.14.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 14:59:08 -0700 (PDT)
Message-ID: <3e7ddc454a23758546e99885c457a86580c04439.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] expect-native: fix build with gcc-14
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 "changqing.li@windriver.com"
	 <changqing.li@windriver.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jun 2024 22:59:08 +0100
In-Reply-To: <DB5PR02MB10213049ABBCCAF2DDE13F286EFC12@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240613061859.3777324-1-changqing.li@windriver.com>
	 <df18afb1f26ccd4f7abfa6299b334641b7fa7665.camel@linuxfoundation.org>
	 <DB5PR02MB10213049ABBCCAF2DDE13F286EFC12@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 21:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200641

On Thu, 2024-06-13 at 21:55 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From:
> > openembedded-core@lists.openembedded.org=C2=A0<openembedded-core@lists.=
openembedded.org
> > > On Behalf Of Richard Purdie
> > Sent: den 13 juni 2024 10:40
> > To: changqing.li@windriver.com;
> > openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH] expect-native: fix build with gcc-14
> >=20
> > On Thu, 2024-06-13 at 14:18 +0800, Changqing Li via
> > lists.openembedded.org wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > >=20
> > > * do_configure failed with gcc-14:
> > > error in build/config.log:
> > > conftest.c:56:3: error: return type defaults to 'int' [-
> > > Wimplicit-int]
> > > conftest.c:59:5: error: implicit declaration of function 'exit'
> > > [-Wimplicit-function-declaration]
> > >=20
> > > * this recipe set "BBCLASSEXTEND =3D "native nativesdk", causes
> > > "CFLAGS +=3D"
> > > setting not take effect, use append instead.
> > > snip of bitbake expect-native -e:
> > > =C2=A0=C2=A0 set /layers/oe-core/meta/conf/documentation.conf:110
> > > =C2=A0=C2=A0=C2=A0=C2=A0 [doc] "Flags passed to the C compiler for th=
e target system.
> > > This variable evaluates to the same as TARGET_CFLAGS."
> > > =C2=A0=C2=A0 append /layers/oe-core/meta/recipes-
> > > devtools/expect/expect_5.45.4.bb:87
> > > =C2=A0=C2=A0=C2=A0=C2=A0 "-Wno-error=3Dincompatible-pointer-types"
> > > =C2=A0=C2=A0 set /layers/oe-core/meta/classes-recipe/native.bbclass:4=
4
> > > =C2=A0=C2=A0=C2=A0=C2=A0 "${BUILD_CFLAGS}"
> > > =C2=A0=C2=A0 override[pn-gtk4]::append[toolchain-clang] /layers/meta-
> > > clang/conf/nonclangable.conf:336
> > > =C2=A0=C2=A0=C2=A0=C2=A0 " -Wno-error=3Dint-conversion"
> > > =C2=A0=C2=A0 override[pn-pidgin-sipe]::append[toolchain-clang]
> > > /layers/meta-clang/conf/nonclangable.conf:340
> > > =C2=A0=C2=A0=C2=A0=C2=A0 " -Wno-error=3Dcast-function-type-strict"
> > > =C2=A0pre-expansion value:
> > > =C2=A0=C2=A0 "${BUILD_CFLAGS}"
> > > export CFLAGS=3D"-isystem/build/tmp-glibc/work/x86_64-linux/expect-
> > > native/5.45.4/recipe-sysroot-native/usr/include -O2 -pipe"
> > >=20
> > > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > > ---
> > > =C2=A0meta/recipes-devtools/expect/expect_5.45.4.bb | 5 ++++-
> > > =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb
> > > b/meta/recipes-devtools/expect/expect_5.45.4.bb
> > > index 18904ebc10..5e7b352196 100644
> > > --- a/meta/recipes-devtools/expect/expect_5.45.4.bb
> > > +++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
> > > @@ -84,4 +84,7 @@ BBCLASSEXTEND =3D "native nativesdk"
> > >=20
> > > =C2=A0# http://errors.yoctoproject.org/Errors/Details/766950/
> > > =C2=A0# expect5.45.4/exp_chan.c:62:5: error: initialization of 'struc=
t
> > > Tcl_ChannelTypeVersion_ *' from incompatible pointer type 'int
> > > (*)(void *, int)' [-Wincompatible-pointer-types]
> > > -CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> > > +CFLAGS:append =3D " -Wno-error=3Dincompatible-pointer-types"
> > > +
> > > +# Fix expect-native configure tests are failing with gcc-14
> > > +CFLAGS:append:class-native =3D " -Wno-error=3Dimplicit-int -Wno-
> > > error=3Dimplicit-function-declaration"
> > >=20
> >=20
> > You have a valid problem here however I really don't like the "arms
> > race" of making everything an append as the base definitions are
> > problematic. It would be this recipe today but a quick search shows
> > many other recipes which will have similar problems.
> >=20
> > I think I'd prefer to see if we can drop the assignments in
> > native/nativesdk bbclass and improve things that way even if it is
> > a
> > bit more invasive.
> >=20
> > I'm testing a patch on master-next to test this and see how bad the
> > fallout is.
> >=20
> > Cheers,
> >=20
> > Richard
>=20
> Isn't the correct thing to add to CFLAGS (really TARGET_CFLAGS)
> and/or BUILD_CFLAGS as appropriate? If the same options are needed
> for both target and native, then you can use an intermediary
> variable. E.g., for  the above case you would get something like:
>=20
> COMMON_CFLAGS =3D "-Wno-error=3Dincompatible-pointer-types"
> CFLAGS +=3D "${COMMON_CFLAGS}"
> BUILD_CFLAGS +=3D " \
> =C2=A0=C2=A0=C2=A0 ${COMMON_CFLAGS} \
> =C2=A0=C2=A0=C2=A0 -Wno-error=3Dimplicit-int \
> =C2=A0=C2=A0=C2=A0 -Wno-error=3Dimplicit-function-declaration \
> "


We could require that but I don't think it is what people expect, or
how things were meant to work. I've sent the patch I was thinking off
now as it seems to work ok in testing so far. In most cases recipe
writers don't need/want separate flags for native/nativesdk/target.

Cheers,

Richard


