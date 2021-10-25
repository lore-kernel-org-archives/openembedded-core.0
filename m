Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0BDC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 18:25:49 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.921.1635186348114485891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 11:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=k3TelBY0;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6F43F80607;
	Mon, 25 Oct 2021 20:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1635186344;
	bh=AT+CPkAU9D9gIqAB97hGSh4DcTqEL/sSwzHjGnhkecg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=k3TelBY0h24QFvJ+n3sWjQIuXlYTiPhgfESOnHgSFD7NaXqaXZMGPpYIxAtIU9r/U
	 kXz2ppSqfVFOAoYF0nxMiuQKwocZR3FwH4pyNznmkdqqmnQ0lavDU2PBZqCRUZ15ZT
	 A6mp8eJ3j1NXxIPOiJGgVDMT0Cp+qftHjVneELzR/gufhMOzYL59dP+tlfd0HVU+A4
	 hZf5Ts1I4/D6BAqg+Agobxxz8NGkhZjobpvslFAtmV900kCEQPj3qWZmdhmGv1Dr9U
	 e4EVCJ+pKiCXX7VVe6qLC8JGC2LDhNer3LbdilgzGDrhNbl5Ji6iH0iumeYu52CVdM
	 OIAoMV72VGGzw==
Date: Mon, 25 Oct 2021 20:25:42 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: Florian Weimer <fweimer@redhat.com>, =?UTF-8?B?RsSBbmctcnXDrCBTw7Ju?=
 =?UTF-8?B?Zw==?= <maskray@google.com>, "H.J. Lu" <hjl.tools@gmail.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, Patches and
 discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Andreas Schwab
 <schwab@linux-m68k.org>, Joseph Myers <joseph@codesourcery.com>, Carlos
 O'Donell <carlos@redhat.com>
Subject: Re: [PATCH v2] dl: Use "adr" assembler command to get proper load
 address on ARM
Message-ID: <20211025202542.38a79fc9@ktm>
In-Reply-To: <20211025150904.GO1982710@arm.com>
References: 
 <CAMe9rOpPM7RmA65MzTNr2DtoC_wMFt87mnyJ4pgvmK5TAorCCQ@mail.gmail.com>
	<20211015145831.5d0fafcd@ktm>
	<CAFP8O3+DBOregW5SuaPErkHUt+5aqb=bL98wHGtXu-OwFwud+w@mail.gmail.com>
	<20211018110818.GE1982710@arm.com>
	<871r4iftvc.fsf@oldenburg.str.redhat.com>
	<20211025121819.16f63048@ktm>
	<878ryhwgd7.fsf@oldenburg.str.redhat.com>
	<20211025125307.1fa34445@ktm>
	<20211025133425.GN1982710@arm.com>
	<20211025160444.09f0c5e0@ktm>
	<20211025150904.GO1982710@arm.com>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/4aN61=gbbTXF0Loina0Z+BD"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 18:25:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157356

--Sig_/4aN61=gbbTXF0Loina0Z+BD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Szabolcs,

> The 10/25/2021 16:04, Lukasz Majewski wrote:
> > > > > Either fix the prelink tool not to prelink shared objects
> > > > > that do not have a dependency on libc.so.6, or fix the
> > > > > dynamic loader to work if prelinked on AArch64.   =20
> > > >=20
> > > > Just for the correctness - both 64 and 32 bit ARMs are
> > > > affected.   =20
> > >=20
> > > last time i looked, prelinking did not support tlsdesc
> > > correctly so it is unusable for aarch64.
> > >=20
> > > does yocto/oe use prelinking on aarch64? =20
> >=20
> > I think yes - the=20
> > USER_CLASSES ?=3D "buildstats image-prelink"
> >=20
> > is added by default to local.conf =20
>=20
> ok, i think we need the patches upstream for that like
> https://sourceware.org/pipermail/libc-alpha/2015-November/066153.html
>=20

Oh... I see.

> > > > > I do not have a strong opinion.   =20
> > > >=20
> > > > Thanks for your opinion. Let's wait for other community members
> > > > opinions.   =20
> > >=20
> > > i think fixing the arm load address computation makes
> > > sense (small extra cost of a relative reloc). i think
> > > the c code proposal i made in the thread is nicer than
> > > the old asm.
> > >=20
> > > (i'm happy to make the same change on aarch64 too if
> > > prelinking is used there, but i think that's broken.) =20
> >=20
> > +1 =20
>=20
> since you have a prelink setup, can you prepare the
> arm and aarch64 patches?
>=20

I can prepare the patch - no problem.

Beforehand, I would like to hear from the community if we do have a
consensus about this solution...

> (i suspect x86 would need the same fix, but probably
> prelink is not used there anymore..?)

I do assume that in yocto at least it would use prelink by default as
well.

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/4aN61=gbbTXF0Loina0Z+BD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmF29qYACgkQAR8vZIA0
zr10jAgA0hTDDzgDT4HSY+YEnh7OIHWfTPvLMuowvFsm8XM3R67jytbfky0ELjdM
95JKRXOi8TmfT6j1CSruqG682KLZdlFoYZI7q1x1MvBbDfHmROb5u3991Z0Gf637
4GRsVogOlm4F8yzqM17aUDeaZKi5BmrWKiQfR19ghwR2bpfIsTavDdUHAy0xczlb
k2Rgah0Qnt5U9sgCVXYv7y1WL8YUhKbp1OekNi/rMLvkmiFt9IvsdgBjr6O9kKkt
WEjkrEAYfUdBlvVP8U8OmQLEU3JIw66fZNYFKLpSIoZdGhvizprQyOUjxtX2Vy0F
K35u1WumQbJIkVb+LbH/s93ApZLTVw==
=Z2P6
-----END PGP SIGNATURE-----

--Sig_/4aN61=gbbTXF0Loina0Z+BD--

