Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B736C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 07:36:09 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.7814.1743665765765968171
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 00:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d+dGsPn/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso5595145e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 00:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743665764; x=1744270564; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fIZ2rYQ9gFh6Uu3hN1b8OZR+HITLPQ/9d+bXylLLTGA=;
        b=d+dGsPn/WqSzHGd/m4fLoxz3BxwyZFv12H60pgJP/IB49+eTLuPfnZOCBHUzW9mau/
         n+YwRtcqgh9BEva5775wtv319Fjp8q0zKsUoa9bVGVF4Z4LwgIk3vcKL3+tRNa+w8R2g
         wyzw3GidHkHxA7qKnVE0mNdJunYMTNp0H7d0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743665764; x=1744270564;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fIZ2rYQ9gFh6Uu3hN1b8OZR+HITLPQ/9d+bXylLLTGA=;
        b=mJEHgkIsy90DS4Ail+1/AZN9uSbPhPlm88s5seubfr5ulOmaDaGNktCkJ9STN9FN8f
         2qNKpDA/37JJjwwrDYZN7mVxqc1aUDtbxtUezLH5WOnGHozGYxZlhJ1plMkI8Fczu3kN
         ypEf2IARuyd3Kd0yhugUzFQv2PxYTfBHXdjgJelDyGleLu1oOQdSZ+181JmdrYS6eDak
         fNr/9K4Dis8gYHvgSOiXBuwtCzzBAwVSTwiZoCXdV8jC6WW0ALy8PEb01Swb8jSW+G+U
         +QvUWx8Hfk5Qb9byozd9jmfPiGyAw+DIAHnl5gxv4yR82CWKIoi0clldsFO1kKkNCkUY
         tgWQ==
X-Gm-Message-State: AOJu0YyuVYBbuZpooEQgIlinaGa7nFi8leIqIaPqMd63/Fyot2PhFFQ3
	SbKDKDkC3uG/TDYio91UERtQUGJCKRidpi0zLSEu+OyOsw+6/6xM64MTAFMyPADCdSImr9eFD1x
	t
X-Gm-Gg: ASbGncu6G2DwZk0yRR2P8oR/1g1aI3CY5tcE+557YOyZ4Cn2nfaNXg85kF1mmbWVITG
	nV/5S9LsEtUhWmFvPbCw4a8obv8Di99B9BArQTavBMbjWHvlnYBKzuV1iSHT7PLHI4D74V53gry
	Clzo7AyNjFSCHPdSZ6XdsVhzS9biDaxRKbckmYbT+ofEukw4TVpUmZTu3UmRW6AanLiUC4PpfGO
	vVFzlvhJA7p1clBoMQp4mV0D5bVW/tDsCx8mc766Qf3e+gt5bwsRlhkhq17oyoxvFiHb1KWqoRX
	J3i179ULVXlRZfWhfXwhHlZKa2/lJSvE++E3D6fixz21BonU+KEpeT3MkQVHuJ2vOJMn9W8oHkl
	/INOH7IVtfypIsw6vd2RfO3nBBGCyou9yQQ==
X-Google-Smtp-Source: AGHT+IHmT7XqzH5GYnftXAysYzzCYXqTfnEwUiLQiYGtN5IZ3b/RadUfS6fxSXkgE22oaSNcIPyJDg==
X-Received: by 2002:a05:600c:818c:b0:43b:c0fa:f9cd with SMTP id 5b1f17b1804b1-43eb5c1813emr49358065e9.7.1743665763901;
        Thu, 03 Apr 2025 00:36:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270? ([2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba3c4sm1028621f8f.59.2025.04.03.00.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:36:03 -0700 (PDT)
Message-ID: <cdcd72e3c0d2490030eb1b00bef5a11b49ebbfcb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH OE-Core 0/5] connman: Update for all
 PACKAGECONFIG options, clean up legacy
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, Scott Murray
	 <scott.murray@konsulko.com>, Jan-Simon =?ISO-8859-1?Q?M=F6ller?=
	 <jsmoeller@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 03 Apr 2025 08:36:02 +0100
In-Reply-To: <CAO5Uq5TWH00ALXtatz8y8Vf9fy4DLpC949ut_UeZhSx3BJKeSA@mail.gmail.com>
References: <20250402-connman-v1-0-2e4fbbb7caf9@gmail.com>
	 <633bbc8576502d873a8e2a3938a6ae64bc508eb2.camel@linuxfoundation.org>
	 <CAO5Uq5TWH00ALXtatz8y8Vf9fy4DLpC949ut_UeZhSx3BJKeSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 07:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214303

On Thu, 2025-04-03 at 07:42 +0100, Alex Kiernan wrote:
> On Wed, Apr 2, 2025 at 8:33=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2025-04-02 at 16:02 +0000, Alex Kiernan via lists.openembedded.=
org wrote:
> > > connman has a legacy style, this patch set adds in all the PACKAGECON=
FIG
> > > options which the upstream pacakge supports, removes patches which ar=
e no
> > > longer required, explicitly supports operation alongside systemd-reso=
lved and
> > > reworks the packaging so that PACKAGECONFIG and explicit package sele=
ction for
> > > every VPN is no longer required.
> > >=20
> > > Everything up to the final patch should be backward compatible cleanu=
p of the
> > > existing recipe, with only the final patch reworking the packaging.
> > >=20
> > > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > > ---
> > > Alex Kiernan (5):
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Merge .inc into .bb
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Delete patches for gold and M=
IPS binutils fix
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Move ppp from DEPENDS to PACK=
AGECONFIG
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Add all build options as PACK=
AGECONFIG
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 connman: Rework to avoid splitting int=
o many single binary packages
> > >=20
> > > =C2=A0meta/recipes-connectivity/connman/connman.inc=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 221 ---------------------
> > > =C2=A0...vice-stop-systemd-resolved-when-we-use-co.patch |=C2=A0 26 -=
--
> > > =C2=A0...ange-visibility-to-default-for-debug-symb.patch |=C2=A0 31 -=
--
> > > =C2=A0.../connman/connman/no-version-scripts.patch=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 47 -----
> > > =C2=A0meta/recipes-connectivity/connman/connman_1.44.bb=C2=A0 | 154 +=
++++++++++++-
> > > =C2=A05 files changed, 147 insertions(+), 332 deletions(-)
> >=20
> > This failed in testing on the first try. I've added:
> >=20
> > diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b=
/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > index 03f02d14ae8..c5ddea79005 100644
> > --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> > @@ -6,7 +6,7 @@ LICENSE =3D "MIT"
> > =C2=A0LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3=
da9cfbcb788c80a0384361b4de20420"
> >=20
> > =C2=A0IMAGE_INSTALL =3D "packagegroup-core-boot packagegroup-core-ssh-o=
penssh packagegroup-self-hosted \
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-dev kernel-devsrc connman connman-plugin=
-ethernet dhcpcd \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel-dev kernel-devsrc connman dhcpcd \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tzdata python3-pip perl-misc"
> >=20
> > =C2=A0IMAGE_FEATURES +=3D "x11-base package-management splash"
>=20
> Is keeping all those RPROVIDES (plus doubtless more at this point)
> actually useful? I can see it in the traditional distribution world,
> but for OE-Core it feels mostly redundant to me.

Short term, it will help fix people's builds and give some level of
runtime compatibility. Long term, it would be deadweight we carry. I'm
therefore torn.

I did note that meta-agl ran into a similar issue:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/1250

With the above tweak and the tweaked nftables, the rest of the build
was ok through.

Cheers,

Richard


