Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A73C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 16:52:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.553.1743699167999417990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 09:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RDeRCxzo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso11439985e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 09:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743699166; x=1744303966; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2uIluiL5ME+32ZVHH1AQxRcXV28XLiJ/Eu63G5T4M2Y=;
        b=RDeRCxzoo3YBKAsjQGnB2K7JeYHLaBo8wJd4DSitlgm7s7rKvXcjaFpSr1LkQusvAA
         w7EJKSsYF+eK/Cc4LzXD/X3IOsgFBbmrZr6+104JQmLjzDCZWag5kDe9uojyOme6nL77
         8NNU+3bYr7Rdj9Yd/r47HW0QcgHxj8RSDNME0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699166; x=1744303966;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2uIluiL5ME+32ZVHH1AQxRcXV28XLiJ/Eu63G5T4M2Y=;
        b=ldg6JLW5BLqsaGNB5nE5Uhqb7Nl8q6/4gW4v6kb6fItDJUX2iuZOM7Mtyo4ZIUpDG6
         NYKSTkkrud6ZgJryOJKbbpRI34oA3dl/O06+qhMpToZov0Q1XzPtRLj1/QkihwEcKimt
         2Me/3QJeP6nQzYYkmEofkthcxN/nPTSSsjMom2wDYhi0J5TN1lOXJpbIitGmzbR6swAS
         +ekmy53rTsa2bMAsIuUjfonMbsZlPPfhf2qgMSnWuwYv7sZevWOCF97fTuIOXDidEo8z
         bM0n4eour8Pa8AknOea/+efPWeKsalu+pf7cuSG56NY7i9Tw/h2FRpI7zDcsAFUYYbhf
         cmxA==
X-Forwarded-Encrypted: i=1; AJvYcCVzW6dVt23HNE8Y+sBMBnFZkLpDQhajX3ct3hVCBqvE5axntakp+rtSMCKMq2H+WiGpqGjHtIGOkI2BVWSQsKApLg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx5cjaj295Tj1gWaa/dlvGRqEu2ibyDfuGX6xkhhU6W8hS03u/p
	oocSS8owyCKlJaKX99Dx6hijW5c/iKHgfeEu5nh0waLMgBCvhru4nu3ACwVG4iE=
X-Gm-Gg: ASbGncs3XKdsaMRHmVv6nVuiB2xXoScf6Ejb+h7F20/fe/NY2plhJvx4a1A4ugVHuUR
	pLcev1fiS/8znp86XYxlGpx9oqC1X2MPlHRVWS/IK32P37xRfESCnvnm90SaH6aNbM/MZI8JLKV
	hMhOk0kB6P4vD3lK5A7uPOZyxPrN7RrPlR6WH2CVQtzbOUxRT1MWE7jK0c9F+iw7vEXwIwLGx9c
	IFlvGIyQXZkHDMLtNgtJ7sLjSpfKXMGaF6ea9VRW7uceq8BrqLbM10akyoN2eL+KAWaF5a5F00l
	CyjSd6SOS8bGL9/+9bEOjTkcHBIXg+QWAFslhXbf2C1oVJGgHuiPrXfmTGbRwPUKoOsObakQsz8
	4dhMNqerqUNTBT7pREZB1wyAPRh+gedyHew==
X-Google-Smtp-Source: AGHT+IGGB3JYPCf6rjZDzZ8sVEsMuqVL+JShb3RbTdF/axQIQ7lFWNstC0FHvFw+s8dC/69d9VokpQ==
X-Received: by 2002:a05:600c:198f:b0:43c:fdbe:4398 with SMTP id 5b1f17b1804b1-43db61dc6f4mr184931985e9.6.1743699166153;
        Thu, 03 Apr 2025 09:52:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270? ([2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec366a699sm22877965e9.38.2025.04.03.09.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:52:45 -0700 (PDT)
Message-ID: <352101e120074ee9e08455be1c162f2bc36c4ce7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH OE-Core 0/5] connman: Update for all
 PACKAGECONFIG options, clean up legacy
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Murray <scott.murray@konsulko.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, Jan-Simon
 =?ISO-8859-1?Q?M=F6ller?= <jsmoeller@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>
Date: Thu, 03 Apr 2025 17:52:44 +0100
In-Reply-To: <e5fe985a-9022-00d6-cd92-dd64061fa6d6@konsulko.com>
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
	 <633bbc8576502d873a8e2a3938a6ae64bc508eb2.camel@linuxfoundation.org>
	 <CAO5Uq5TWH00ALXtatz8y8Vf9fy4DLpC949ut_UeZhSx3BJKeSA@mail.gmail.com>
	 <cdcd72e3c0d2490030eb1b00bef5a11b49ebbfcb.camel@linuxfoundation.org>
	 <e5fe985a-9022-00d6-cd92-dd64061fa6d6@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 16:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214329

On Thu, 2025-04-03 at 12:46 -0400, Scott Murray wrote:
> On Thu, 3 Apr 2025, Richard Purdie wrote:
>=20
> > On Thu, 2025-04-03 at 07:42 +0100, Alex Kiernan wrote:
> > > On Wed, Apr 2, 2025 at 8:33=E2=80=AFPM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > On Wed, 2025-04-02 at 16:02 +0000, Alex Kiernan via lists.openembed=
ded.org wrote:
> > > > > connman has a legacy style, this patch set adds in all the PACKAG=
ECONFIG
> > > > > options which the upstream pacakge supports, removes patches whic=
h are no
> > > > > longer required, explicitly supports operation alongside systemd-=
resolved and
> > > > > reworks the packaging so that PACKAGECONFIG and explicit package =
selection for
> > > > > every VPN is no longer required.
> > > > >=20
> > > > > Everything up to the final patch should be backward compatible cl=
eanup of the
> > > > > existing recipe, with only the final patch reworking the packagin=
g.
> > > > >=20
> > > > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > > > ---
> > > > > Alex Kiernan (5):
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Merge .inc into .bb
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Delete patches for gold a=
nd MIPS binutils fix
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Move ppp from DEPENDS to =
PACKAGECONFIG
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Add all build options as =
PACKAGECONFIG
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Rework to avoid splitting=
 into many single binary packages
> > > > >=20
> > > > > =C2=A0meta/recipes-connectivity/connman/connman.inc=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 221 ---------------------
> > > > > =C2=A0...vice-stop-systemd-resolved-when-we-use-co.patch |=C2=A0 =
26 ---
> > > > > =C2=A0...ange-visibility-to-default-for-debug-symb.patch |=C2=A0 =
31 ---
> > > > > =C2=A0.../connman/connman/no-version-scripts.patch=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 47 -----
> > > > > =C2=A0meta/recipes-connectivity/connman/connman_1.44.bb=C2=A0 | 1=
54 +++++++++++++-
> > > > > =C2=A05 files changed, 147 insertions(+), 332 deletions(-)
> > > >=20
> > > > This failed in testing on the first try. I've added:
> > > >=20
> > > > diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.=
bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > > > index 03f02d14ae8..c5ddea79005 100644
> > > > --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > > > +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > > > @@ -6,7 +6,7 @@ LICENSE =3D "MIT"
> > > > =C2=A0LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=
=3D3da9cfbcb788c80a0384361b4de20420"
> > > >=20
> > > > =C2=A0IMAGE_INSTALL =3D "packagegroup-core-boot packagegroup-core-s=
sh-openssh packagegroup-self-hosted \
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-dev kernel-devsrc connman connman-plu=
gin-ethernet dhcpcd \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-dev kernel-devsrc connman dhcpcd \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tzdata python3-pip perl-misc"
> > > >=20
> > > > =C2=A0IMAGE_FEATURES +=3D "x11-base package-management splash"
> > >=20
> > > Is keeping all those RPROVIDES (plus doubtless more at this point)
> > > actually useful? I can see it in the traditional distribution world,
> > > but for OE-Core it feels mostly redundant to me.
> >=20
> > Short term, it will help fix people's builds and give some level of
> > runtime compatibility. Long term, it would be deadweight we carry. I'm
> > therefore torn.
> >=20
> > I did note that meta-agl ran into a similar issue:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/1250
> >=20
> > With the above tweak and the tweaked nftables, the rest of the build
> > was ok through.
>=20
> If you're leaning towards taking it, we can adapt in AGL, though I can't
> guarantee there won't be a brief instance of AB breakage before I push
> a change.=C2=A0 Overall, I'm a bit ambivalent about removing the split ou=
t
> packages.=C2=A0 I understand the desire for simplifying it, but I also se=
e
> some benefits to still mirroring what most other distributions do with
> networkmanager packaging since there still seems to be some interest in
> attempting to do binary packagefeeds...

To be honest, I'm torn, I could be persuaded either way.=C2=A0

I copied more people to collect viewpoionts as well as make them aware
of the potential breakage.

Cheers,

Richard

