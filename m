Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B07BC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 10:18:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.30220.1635157109847384462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 03:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=sIix3XBL;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D5385833B1;
	Mon, 25 Oct 2021 12:18:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1635157106;
	bh=Qw6LXOFeusg3JrI3m5IMscB4vUdIAjWW9ZYcMZzWwts=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sIix3XBLBZgmG22EV83A9JVqqLUEaek0pK0pP3W2JMBjSFlTaxVF0Trf/v1Upe5Wt
	 9I1Vis9byspuexBeF6daGgWq4yNkc0/5hP8geDi4EPUNvhGy2e94IvQ7xcpwus6jtT
	 pVURhgyW+91S7JdqW6cwDCbdeoCTdrciBZMq3hlixd+S2G978V91UiWC4Br6k/mTDS
	 TGPYFUC5DhQk+YMKAec3lOLMMs2GIoaXPa3Ln8WrNJHUT5YR7dFUkvQR6pHOlgwvw+
	 XjV9zsPrH4qnBhIXO2iKiSHtixzfqwF8vg8iUwgBq6nZjo6tlmFHyl0cn98pdRCfEm
	 mlGcmTXIq2kiA==
Date: Mon, 25 Oct 2021 12:18:19 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Florian Weimer <fweimer@redhat.com>, Szabolcs Nagy
 <Szabolcs.Nagy@arm.com>
Cc: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>, "H.J. Lu"
 <hjl.tools@gmail.com>, libc-alpha <libc-alpha@sourceware.org>, Patches and
 discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Andreas Schwab
 <schwab@linux-m68k.org>, Joseph Myers <joseph@codesourcery.com>, Carlos
 O'Donell <carlos@redhat.com>
Subject: Re: [PATCH v2] dl: Use "adr" assembler command to get proper load
 address on ARM
Message-ID: <20211025121819.16f63048@ktm>
In-Reply-To: <871r4iftvc.fsf@oldenburg.str.redhat.com>
References: <20210907131616.23472-1-lukma@denx.de>
	<20211015075417.29931-1-lukma@denx.de>
	<20211015120915.GD1982710@arm.com>
	<CAMe9rOpPM7RmA65MzTNr2DtoC_wMFt87mnyJ4pgvmK5TAorCCQ@mail.gmail.com>
	<20211015145831.5d0fafcd@ktm>
	<CAFP8O3+DBOregW5SuaPErkHUt+5aqb=bL98wHGtXu-OwFwud+w@mail.gmail.com>
	<20211018110818.GE1982710@arm.com>
	<871r4iftvc.fsf@oldenburg.str.redhat.com>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/yEgUu8Xez=Nx1.9RZGKTl5X"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 10:18:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157335

--Sig_/yEgUu8Xez=Nx1.9RZGKTl5X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Community,

> * Szabolcs Nagy:
>=20
> > i don't know much about pelinking, but i'd expect that ld.so
> > has to be prelinked for it to work:
> >
> > if the kernel can load ld.so anywhere it will conflict with
> > other libraries that prelinking allocated to a fixed location. =20
>=20
> I think ld.so can back out prelinking if it detects any conflicts.
> (ld.so doesn't use MAP_FIXED for the initial ET_DYN mapping even when
> prelinking.)
>=20
> > instead ld.so has to be prelinked to an offset that comes after
> > all other prelinked libraries in the system, then the kernel
> > will place it after all other libraries at runtime.
> >
> > i don't have a prelinked system to check if this is the case. =20
>=20
> I tried on glibc 2.12-based system with prelink enabled and got this:
>=20
> # ldd /bin/bash
> 	linux-vdso.so.1 =3D>  (0x00007ffc7e798000)
> 	libtinfo.so.5 =3D> /lib64/libtinfo.so.5 (0x0000003da9800000)
> 	libdl.so.2 =3D> /lib64/libdl.so.2 (0x0000003da7400000)
> 	libc.so.6 =3D> /lib64/libc.so.6 (0x0000003da7800000)
> 	/lib64/ld-linux-x86-64.so.2 (0x00007f8dc919c000)
> # ldd /bin/bash
> 	linux-vdso.so.1 =3D>  (0x00007ffef3bf4000)
> 	libtinfo.so.5 =3D> /lib64/libtinfo.so.5 (0x0000003da9800000)
> 	libdl.so.2 =3D> /lib64/libdl.so.2 (0x0000003da7400000)
> 	libc.so.6 =3D> /lib64/libc.so.6 (0x0000003da7800000)
> 	/lib64/ld-linux-x86-64.so.2 (0x00007ff9e66a6000)
> # eu-readelf -d /lib64/ld-linux-x86-64.so.2
>=20
> Dynamic segment contains 25 entries:
>  Addr: 0x0000003da7220df0  Offset: 0x020df0  Link to section: [ 5]
> '.dynstr' Type              Value
>   SONAME            Library soname: [ld-linux-x86-64.so.2]
>   HASH              0x0000003da70001f0
>   GNU_HASH          0x0000003da70002a8
>   STRTAB            0x0000003da7000608
>   SYMTAB            0x0000003da7000380
>   STRSZ             380 (bytes)
>   SYMENT            24 (bytes)
>   PLTGOT            0x0000003da7220f80
>   PLTRELSZ          144 (bytes)
>   PLTREL            RELA
>   JMPREL            0x0000003da7000a30
>   RELA              0x0000003da7000868
>   RELASZ            456 (bytes)
>   RELAENT           24 (bytes)
>   VERDEF            0x0000003da70007c0
>   VERDEFNUM         5
>   BIND_NOW         =20
>   FLAGS_1           NOW
>   VERSYM            0x0000003da7000784
>   RELACOUNT         16
>   CHECKSUM          0x00000000e90e92bc
>   GNU_PRELINKED     0x00000000616d5a26
>   NULL             =20
>   NULL             =20
>   NULL
> #=20
>=20
> As expected based on the previous discussion here, the kernel maps
> ld.so at random addresses even though it has been prelinked.
>=20
> This looks like another place where ASLR layout as to be tweaked
> carefully to avoid obscure failure modes.
>=20

Do we have any idea on how to move forward with this issue?

> Thanks,
> Florian
>=20

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/yEgUu8Xez=Nx1.9RZGKTl5X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmF2hGsACgkQAR8vZIA0
zr3k5wgAqbuSMdJ6ZS/xaYCjqHuIQajpE82D9yXz7uqcs2ABN8oJpjKJDNTRop0m
0qsR3oZOqUVnjXRsddnaktW6ov8FKX6bX/o32hVszKcmoNcFYzXvGX4eFbdHb8sS
BQDBV83M2ZzbhKsZfxRmzapnxCZiLqWmNzWqAfbClbK3mEulOsRmDWfuAqHsX/Lu
Nq0EIYrO+6TrJMWJKPXQqHXhcl3Gn/XLxUKkinTd/gfou6q6O5eXT5ttB1PaFiZy
6bKEMMO2WonzYiGjvNFAmyE+NE1AFwUdkgbzE1ZFTsJYhoM8e0PQ38hoK0D5tdz0
XKpllvUkn3jjB/ymYRErPRoz6+CglA==
=9cu+
-----END PGP SIGNATURE-----

--Sig_/yEgUu8Xez=Nx1.9RZGKTl5X--

