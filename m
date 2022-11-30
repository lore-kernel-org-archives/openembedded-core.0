Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA84AC4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 09:40:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.7173.1669801222765202649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 01:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=NKudHF6Q;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6872F85059;
	Wed, 30 Nov 2022 10:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1669801220;
	bh=VqaJ68EFQcrOTynztnV56STaXdhMWbPCVDfyQH7cj4o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NKudHF6Q6s0LXM66F+X5BvpLqDR9UCzTiTL1dAH8t4mYiBn0pX7EqiXVYJahBYijX
	 lfV++rUXwByqtW7N20TUetJ0sntmHNJDkjNT/kRZnOxinUNWciBLRMl/LmC9Ogxyvv
	 /Dtb1Veqqi2KWvna57WSw3cLNCtvUa6CLMu3zEEr/LzIj9nPn7r5Zhbsl2/TeDHGxc
	 kdh94ovQhmHT0xVIuysSuYyKh5DiKk7rAWhQLlRjA4StSiJz+ftunV+wATX2Son8oq
	 Cq9enAShckTT9UDKtuBaFXaYQHMm7yedszX3auD30s+KEaIH2fI2mtVwV2RFqRQ0Dj
	 CIR1HMdbKt0iw==
Date: Wed, 30 Nov 2022 10:40:06 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, OE-core
 <openembedded-core@lists.openembedded.org>, Stephen Jolley
 <sjolley.yp.pm@gmail.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [yocto] Y2038 proposal
Message-ID: <20221130104006.526c0c71@wsk>
In-Reply-To: <CANNYZj-31p1n_f_oh3+Le4O4vYrRLquvYxzdAk4uY+EOeS_V0A@mail.gmail.com>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
	<CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
	<20221130092832.62067104@wsk>
	<CANNYZj-31p1n_f_oh3+Le4O4vYrRLquvYxzdAk4uY+EOeS_V0A@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pPJ+sc2HKEDfu1IDdcCwNpW";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 09:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173998

--Sig_/pPJ+sc2HKEDfu1IDdcCwNpW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

> On Wed, 30 Nov 2022 at 09:28, Lukasz Majewski <lukma@denx.de> wrote:
> > Please find a few comments:
> >
> > 1. There is already provided meta-y2038 [1] to test if 32 bit
> > systems correctly support Y2038 problem. It uses qemu machines from
> > OE/Yocto
> >
> > 2. There are ptest available [2] to validate if the Y2038 problem
> > works correctly.
> >
> > 3. Support for running ptests mentioned in point 2. is already
> > available in the poky repository [3]. =20
>=20
> Thanks! So there should be a
>=20
> d. 'glibc-tests-ptest' is executed across all architectures - probably
> as a machine-specific selftest, and as well with qemu time set into
> the future.

+1

>=20
> > It looks like the meta-y2038 can be used out of the box (after
> > checking if it still works with newest poky) when added to the
> > Yocto Project build/test infrastructure. =20
>=20
> Unfortunately I do not think that layer can be easily added into the
> test matrix. It has its own distro and images. No, we need to maintain
> a poky branch where the same tweaks and fixes happen. Besides, those
> fixes would need to be merged into oe-core proper eventually anyway.
>=20

It would be even better if the meta-y2038 could be dropped and _all_
its functionality could be merged to poky.

That would be _awesome_.

Please just be aware that this meta layer has some fixes for some
packages (for Y2038 ready glibc).

> Alex




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/pPJ+sc2HKEDfu1IDdcCwNpW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmOHJPYACgkQAR8vZIA0
zr2BMwgArJEpjNkhKgovydHreoW2NKftle+BKlftOJawRYNX3a182MF4nHWGzdqT
AgRiqJk5tW6vinjz/40Pokw5j6TvWkwDTq+8BMAjYnwglTtu6bqe/Wz/p15bk7Vy
/Rs0E20XoPTaBmPJDI11F9cSuLZ6FH/+GPGG2zCW/X10bWUFRMa6AmqCX26kaDCr
oI5bgjIDtjBPLJE3vv5XYGMeBw4K0vKCG1lcMI3QzSS03YiS48z7DLicJqvNU8n0
1u1GEx+LPAz3GDxkq25HveaKVBF7it39VSgMT3EBTrT+/aXCcF6uq13JNYiR/e4p
YpqwnHUCiRRyS83FQl/xgF8A1nu1jQ==
=MuUg
-----END PGP SIGNATURE-----

--Sig_/pPJ+sc2HKEDfu1IDdcCwNpW--

