Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80CB9C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:04:51 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.32582.1635170689560842766
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=mZ5Y9b3c;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id CE794834F4;
	Mon, 25 Oct 2021 16:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1635170686;
	bh=Yq1EJN9zOcjyVg4zpUvnE+ctzz1IzvRfgtjLFaf0R4Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mZ5Y9b3cjt6bcd0mfc2J8QqQhtPmlS7u+5c/iufIU/lpyLF5XD0BEo2fb+1FS9+fW
	 l75MaBTH4CMJ8kGTGiDsA6Zgb5EEjv7m81xNlIWw+AQQnXERWAOXTVikErAcqSvwSZ
	 0q3TfFKV0l8vmkQnWYYgDvMBt9g5FhvwBvEwv4l6zEojuzDnFo12MCoOJgP8+vivY1
	 TncOXXdJJ4bOhg9yqoHJWeHYOydNX6LdWvGZGVSmr0TOaQWxFwWzB0L7/gh8trYK7f
	 Scs9CEb3ySwfCLAyoERLQTkpRsiZFnmfTblx0tVYILTdkg4BCVXtCR/WW/UBuDlZKN
	 y5R6wAR67EjTg==
Date: Mon, 25 Oct 2021 16:04:44 +0200
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
Message-ID: <20211025160444.09f0c5e0@ktm>
In-Reply-To: <20211025133425.GN1982710@arm.com>
References: <20211015075417.29931-1-lukma@denx.de>
	<20211015120915.GD1982710@arm.com>
	<CAMe9rOpPM7RmA65MzTNr2DtoC_wMFt87mnyJ4pgvmK5TAorCCQ@mail.gmail.com>
	<20211015145831.5d0fafcd@ktm>
	<CAFP8O3+DBOregW5SuaPErkHUt+5aqb=bL98wHGtXu-OwFwud+w@mail.gmail.com>
	<20211018110818.GE1982710@arm.com>
	<871r4iftvc.fsf@oldenburg.str.redhat.com>
	<20211025121819.16f63048@ktm>
	<878ryhwgd7.fsf@oldenburg.str.redhat.com>
	<20211025125307.1fa34445@ktm>
	<20211025133425.GN1982710@arm.com>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/388ry8fh3Bwhc2cI8ITdw.M"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 14:04:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157339

--Sig_/388ry8fh3Bwhc2cI8ITdw.M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Szabolcs,

> The 10/25/2021 12:53, Lukasz Majewski wrote:
> > Hi Florian,
> >  =20
> > > * Lukasz Majewski:
> > >  =20
> > > > Do we have any idea on how to move forward with this issue?   =20
> > >=20
> > > Either fix the prelink tool not to prelink shared objects that do
> > > not have a dependency on libc.so.6, or fix the dynamic loader to
> > > work if prelinked on AArch64. =20
> >=20
> > Just for the correctness - both 64 and 32 bit ARMs are affected. =20
>=20
> last time i looked, prelinking did not support tlsdesc
> correctly so it is unusable for aarch64.
>=20
> does yocto/oe use prelinking on aarch64?

I think yes - the=20
USER_CLASSES ?=3D "buildstats image-prelink"

is added by default to local.conf

>=20
> >  =20
> > > I do not have a strong opinion. =20
> >=20
> > Thanks for your opinion. Let's wait for other community members
> > opinions. =20
>=20
> i think fixing the arm load address computation makes
> sense (small extra cost of a relative reloc). i think
> the c code proposal i made in the thread is nicer than
> the old asm.
>=20
> (i'm happy to make the same change on aarch64 too if
> prelinking is used there, but i think that's broken.)

+1

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/388ry8fh3Bwhc2cI8ITdw.M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmF2uXwACgkQAR8vZIA0
zr3pxAgAxpAthLo3v7MaQcOE7OEDNt+/1NwOsATJRDdTO8/RuFdCpVaNh99GxyN+
mPZ0He7ajt7k1pajMVpJ/V/jf9AF5BB7qMdHHnpAsaV/SEarY6Zbay42921WmVM/
Keq5Bx8oEmc2jrM4M6Rftq/TH0cld+O8mmmfZFV2XGtYZH17ymYaFM5hIZ9VJM+d
nSy8yEQ7f3LkvotpHubGe6KByUgVSHzCyBOO+Fop1Kshu3v/9OFRMXhZtniM6GeR
kN5CcpJ0xZ1yk5qu2PG/okX/AGsNdgT02lvY8+Ucet0TT7nGL2lTItDsECopwaDL
ybuGZbDwiuYGxwSO5EqJ6CJSgkWbPQ==
=XsZj
-----END PGP SIGNATURE-----

--Sig_/388ry8fh3Bwhc2cI8ITdw.M--

