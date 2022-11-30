Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9879BC433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 12:10:03 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.9263.1669810193402661724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 04:09:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=My238RgC;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D625A830EE;
	Wed, 30 Nov 2022 13:09:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1669810191;
	bh=0VpDTtocoiYx6AWm/oSPrMG2P75gJSndIWGo59mIeI8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=My238RgCq8V3k9YCUZjDoxYh+IaMUPxl7e5pg6rkVEDKoHetY5OwA45m2+yrqR4mX
	 DQA3mewTIAbMXCDr0+bMqY1BZSK2+D+UIWlowS6WK5IFjHvxqSeI13YjybGaxqXvUl
	 MaHJ5I5rDb07R6nM1CGFZzxZjLooEd6TcOCtufgUR5VGu4l/Ut5BuD6fBc/eBUPFm8
	 N2+hvQF87r3wXlJBPMqMrI6DYvPRNaa6UjnA7zyTi5VBnfMhdK45Aj7WTMyPDaSqkG
	 DQDb1iemtNnH2JDcplIjvJ7AWLmhIG5r6EKNoyp5oAoFHY7Ukb75bSrh1lymQHPJFJ
	 3Z/Vp4IM2+pWA==
Date: Wed, 30 Nov 2022 13:09:43 +0100
From: Lukasz Majewski <lukma@denx.de>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 alexandre.belloni@bootlin.com, openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, OE-core
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [yocto] Y2038 proposal
Message-ID: <20221130130943.5e2caeb5@wsk>
In-Reply-To: <CANNYZj-12v8gvNv77zOSJqnV7b22bx2xQcqjjWR4W-5r3wNksA@mail.gmail.com>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
	<CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
	<Y4c4UBryAjx5t2gl@mail.local>
	<17e9291975095d514ca0a06f09c1c5d30909113e.camel@linuxfoundation.org>
	<CANNYZj-12v8gvNv77zOSJqnV7b22bx2xQcqjjWR4W-5r3wNksA@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wcDBeJbhS8A9WDkFgJVOzim";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 12:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174004

--Sig_/wcDBeJbhS8A9WDkFgJVOzim
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Nov 2022 13:07:27 +0100
"Alexander Kanavin" <alex.kanavin@gmail.com> wrote:

> On Wed, 30 Nov 2022 at 12:40, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > To be clear, we don't run ptests on 32 bit targets, only on
> > qemux86-64 and qemuarm64 where we have KVM available. We do run
> > image, sdk and eSDK tests on our supported qemu targets, 32 and 64
> > bit. =20
>=20
> I think kvm does allow 32 bit guest on a 64 bit host.=20

+1

IIRC the MACH=3Dqemux86 was working correctly...

> But I can
> imagine making full ptests work on 32 bit guests

Maybe only subset of ptests - i.e. those related to Y2038 could be run?

> would be a struggle
> for reasons unrelated to 2038, specifically lack of users outside of
> embedded world.
>=20
> Alex




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/wcDBeJbhS8A9WDkFgJVOzim
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmOHSAcACgkQAR8vZIA0
zr2BTQgA0IgVBIt1T53Ou9v/7ifRdrRx1y92UYRhW0hmrjyVBxMNhTJisiu6tFyC
wWYEyOXB4xp2x8CS10YVZVWoYLfPJhq27Si0p+mfphwRlZDop+EXNZmmvqWrb0qc
IYYxHKF2szKAQKCVblVTPvswWTOnCuBS8EJ5jeify/i7k/ZmIMEB5xTEEiB92hLD
gvzIQoi/Owp/XowEKCSZmHGIba6MWxfOqsYaoNCEMrcXhwM5yVRTJcdaUZ0mdwC7
CqU5x2r1G2vLYX45NjbyzK11vVaq0XChaXms3HrYismPUUmZgSB5fmmp8eAA71J+
ztNogSljBRsNlOd0tAhFRHH+D3JGKw==
=BQh5
-----END PGP SIGNATURE-----

--Sig_/wcDBeJbhS8A9WDkFgJVOzim--

