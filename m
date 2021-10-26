Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF0EC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 13:52:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.12427.1635256358573788442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 06:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=pPeI7aft;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 02DDC80F1A;
	Tue, 26 Oct 2021 15:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1635256355;
	bh=f0Y4SQtYlJS5W+rhBVIstqzy5GCt99q8/eV5OuTUBSc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pPeI7aft1a5u/whFI4Uyv2ECmsibAGHQcD2yAAZiqkz8pYjQdtVY1D0J7DZEh2HQS
	 dkX13Mgy6HtO+Bo1a+wYkZRdfE4nl38e7Ix4+oXV2nG73m2cmjhgIPrlJsTjdIO5zS
	 q4+1Wb4x3c8iwoYJYYOksoSmS0AL+HoftMgpYNJgfNxMAxZx8c3GFGxT0gjD3TPCP/
	 Tqf9CPpHiTZOkqWzXGNWGKIEXV396mJ8FvJof6K4r9finYJU0e5n63X+1m4yBGYBD8
	 CjpvlEtv0FrOjj3fEKdGQOqc+XDikF9gCn9ElrSx0rcvDL2dSA2nkNrH29R7NuHWM1
	 0mhy7v2+SyOXw==
Date: Tue, 26 Oct 2021 15:52:27 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Joseph Myers <joseph@codesourcery.com>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>
Cc: Florian Weimer <fweimer@redhat.com>, "libc-alpha@sourceware.org"
 <libc-alpha@sourceware.org>, Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>, Andreas Schwab
 <schwab@linux-m68k.org>
Subject: Re: [PATCH v2] dl: Use "adr" assembler command to get proper load
 address on ARM
Message-ID: <20211026155227.302d53b3@ktm>
In-Reply-To: 
 <alpine.DEB.2.22.394.2110251718420.1572984@digraph.polyomino.org.uk>
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
	<alpine.DEB.2.22.394.2110251718420.1572984@digraph.polyomino.org.uk>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/OKRpRjSuhwGhP8Vkx1O5S5P"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 13:52:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157394

--Sig_/OKRpRjSuhwGhP8Vkx1O5S5P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joseph, Szabolcs=20

> On Mon, 25 Oct 2021, Szabolcs Nagy via Libc-alpha wrote:
>=20
> > ok, i think we need the patches upstream for that like
> > https://sourceware.org/pipermail/libc-alpha/2015-November/066153.html
> > =20
>=20
> The AArch64 prelink support isn't in the upstream Yocto
> cross-prelink, and the version written by Samsung in 2015 and on the
> cross_prelink_aarch64 branch has various problems resulting in test
> failures, in my experience.

Ok.

>=20
> I sent patches (on top of a merge of the upstream cross_prelink and=20
> cross_prelink_aarch64 branches) to the maintainer in May 2020 (the
> Yocto project mailing list doesn't accept email from non-subscribers,
> so won't have seen those patches), which made it work well enough to
> get clean prelink test results, but so far they haven't been
> committed to the upstream cross_prelink branch (or any other upstream
> branch).  I've now made those available at
> https://github.com/jsm28/prelink (cross_prelink_aarch64_fixes branch).
>=20

So this branch shall be pulled by yocto's cross-prelink maintainer.
Without it the cross-prelink doesn't support aarch64?

> Note however that, like the original patches from Samsung, this
> version does indeed depend on a hack in _dl_tlsdesc_undefweak to work
> with TLS descriptors.
>=20

To properly solve this issue we shall:

1. For arm
- Fix the cross-prelink (no patches available)

or

- Fix glibc (as proposed by Szabolcs)

2. For aarch64

- Try to upstream patches from Joseph to OE/Yocto's cross-prelink

or

- Fix glibc (if required)

or

- Do nothing (aarch64 will not be prelinked in OE/Yocto, which means
  that it will work correctly)


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/OKRpRjSuhwGhP8Vkx1O5S5P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmF4CBsACgkQAR8vZIA0
zr107wf/bA7wg2o8ACjRP7shmfgGHpJgTmYGw6NZwXrtrs7o4u6eKVkfRsVx64X/
Cm6k7cZxVhtXzF2Jn6CRkR4yu1aRPrbP0433Vm8S0hojp33T2bVwFbzPguWAfc9b
gsjPOPvX8nFyK3PMOZWlJDZtJKo2PmdSuYGuEJiV86ZHwbaO/RSa7CWiA77DtAHl
Rj8BEOn2l94imnNFJJl+cvVDUZhncv8hriuIK9YgVibeqSkyyCtEh6YVZ9lL7sfb
xc2Tsyy//PSDL48ZqJ5XGc4Vo2qUdLO6nFca4j8y7Q5EiB0peZPUEbkuCUWuh4qu
l6rk3MdZMjYqbOJT0CYxxPtfptKyYA==
=R0di
-----END PGP SIGNATURE-----

--Sig_/OKRpRjSuhwGhP8Vkx1O5S5P--

