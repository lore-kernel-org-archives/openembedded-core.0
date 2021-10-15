Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF6EC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 13:00:04 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.8934.1634302801989981397
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 06:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=muPCftqs;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6BAD08364E;
	Fri, 15 Oct 2021 14:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1634302799;
	bh=jGEmmX5IDsUTFVZ2J9FAwiaB1R8OgApx7G4j7mtl9Os=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=muPCftqsVvPSHiGkNGKG/ksnw4uYrV6v844b1/N5CWyJRFDQOOnSnKWCQjtNL3s2f
	 hRZk7ZGDaYWGuo76MoFkJemxrCkGUuC0kTVaLQ6ywFxfNEvjQCfQ6w+E4pSokWipLq
	 1icUQ622BG18NnwdUOzxg18h99XK8xSKJOXN/6maUhyxzgh2ZGSWtssAxjclKfLEND
	 eMuuf2MmqescUJvTx8jqZG21lEOHJcRbcs1VpqlizykQJ/n8bAxUbHj71XKO5Zn/h6
	 D7ZSnYr0Eyl/V4S8zZgxMevjA1nJstv90izlhe9Zni6W7JY2pm4GYldnX/8gOk54xw
	 9N3JhkLq8HTdw==
Date: Fri, 15 Oct 2021 14:59:48 +0200
From: Lukasz Majewski <lukma@denx.de>
To: "H.J. Lu" <hjl.tools@gmail.com>
Cc: Szabolcs Nagy <szabolcs.nagy@arm.com>, Florian Weimer
 <fweimer@redhat.com>, libc-alpha <libc-alpha@sourceware.org>, Andreas
 Schwab <schwab@linux-m68k.org>, Joseph Myers <joseph@codesourcery.com>,
 Patches and  discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH v2] dl: Use "adr" assembler command to get proper load
 address on ARM
Message-ID: <20211015145831.5d0fafcd@ktm>
In-Reply-To: 
 <CAMe9rOpPM7RmA65MzTNr2DtoC_wMFt87mnyJ4pgvmK5TAorCCQ@mail.gmail.com>
References: <20210907131616.23472-1-lukma@denx.de>
	<20211015075417.29931-1-lukma@denx.de>
	<20211015120915.GD1982710@arm.com>
	<CAMe9rOpPM7RmA65MzTNr2DtoC_wMFt87mnyJ4pgvmK5TAorCCQ@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/.nAwhXOAwEHeMy8FjI+hqck"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 13:00:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156993

--Sig_/.nAwhXOAwEHeMy8FjI+hqck
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Oct 2021 05:21:23 -0700
"H.J. Lu" <hjl.tools@gmail.com> wrote:

> On Fri, Oct 15, 2021 at 5:09 AM Szabolcs Nagy via Libc-alpha
> <libc-alpha@sourceware.org> wrote:
> >
> > The 10/15/2021 09:54, Lukasz Majewski wrote: =20
> > > This change is a partial revert of commit
> > > bca0f5cbc9257c13322b99e55235c4f21ba0bd82
> > > "arm: Simplify elf_machine_{load_address,dynamic}" which imposed
> > > usage of __ehdr_start linker variable to get the address of
> > > loaded program.
> > >
> > > The elf_machine_load_address() function is declared in the
> > > sysdeps/arm/dl-machine.h header. It is called from (very early)
> > > _dl_start() entry point for the program. It shall return the load
> > > address of the dynamic linker program.
> > >
> > > With this revert the 'adr' assembler instruction is used instead
> > > of a place holder:
> > >
> > > arm-poky-linux-gnueabi-objdump -t ld-linux-armhf.so.3 | grep ehdr
> > > 00000000 l       .note.gnu.build-id     00000000      __ehdr_start
> > >
> > > which is pre-set by binutils.
> > >
> > > The problem starts when one runs 'prelink' on the rootfs created
> > > with for example OE/Yocto.
> > > Then the _ehdr_start stays as 0x0, but the ELF header's sections
> > > have different addresses - for example 0x41000000 instead of the
> > > originally set 0x0.
> > >
> > > This is crucial when /sbin/init is executed. Value set in
> > > __ehdr_start symbol is not updated. This causes the program to
> > > crash very early when ld-linux-armhf.so.3's _dl_start is
> > > executed, as calculated offset for loader relocation is going to
> > > hit the kernel space (0xf7xxyyyy).
> > >
> > > It looks like the correct way to obtain the _dl_start offset on
> > > ARM is to use assembler instruction 'adr' at execution time (so
> > > the prelink assigned offset is taken into consideration) instead
> > > of __ehdr_start.
> > >
> > > With this patch we only modify the elf_machine_load_address()
> > > function, as it is called very early, before the
> > > ld-linux-armhf.so.3 is performing relocation (also its own one). =20
> >
> > i'd use an explanation like:
> >
> > __ehdr_start is a linker created symbol that points to the elf
> > header. The elf header is at the beginning of the elf file and
> > normally its virtual address is 0 in a shared library.  This means
> > the runtime address of __ehdr_start is the load address of the
> > module.  However if prelinking is applied to ld.so then all virtual
> > addresses are moved by an offset so the runtime address of the elf
> > header becomes the load address + prelink offset.  The kernel does
> > not treat prelinked ld.so specially so the load address is not 0,
> > it still has to be computed, but simply using __ehdr_start no
> > longer gives a correct value for that.
> >
> > This issue affects all targets with prelinking support, but so far
> > we only got reports from OE/Yocto builds for arm that has prelinked
> > ld.so.
> >
> > but i think a better fix is possible than revert: =20
>=20
> I think either prelink should be fixed not to prelink ld.so or Yocto
> should be fixed not to prelink ld.so.
>=20

Could you explain why?

Was the relocation of ld.so (I guess that ld.so =3D ld-linux-arm.so) a
bug from the very beginning and it was apparent just now?

=46rom my point of view - the original change to use __ehdr_start broke
working setups, so it is a regression and shall be fixed in glibc.

Anyway, it would be beneficial to have input from other glibc
developers how to proceed with this issue.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/.nAwhXOAwEHeMy8FjI+hqck
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmFpe0QACgkQAR8vZIA0
zr2Rgwf/aNqa6ZKKaQFpT25hwUlAxzVAsOeuOkT8Ia3y5UVVx90OlCDn0Jk0VMV0
d0ajHEbVAihM+M7EjG/MBUnsSWD6XQbcBL1fFbBWycVC1ZKW5bjt/z+UQdhn5bBr
ejcvLDipwPXjfy7sJ+F4QVDTkD+y8pvzkhaVaSdx3Ex7Dy9UzcCPXm39kg2+aYYH
EAyYa266CdxT/bZCQY8GpDXbBHv2mKK6PP7WGPAUAWJpVsiVknXvWJwgjYlKhF6v
ZsF27ryOZ1iMeoUDjv4yQ7FQPqsuANd3Kw9/O1YRt/qxYDT0p4S6widvXNMtv2XJ
8JitC9mO0rY63mqFsSoaZfc6Zy7oLg==
=NenM
-----END PGP SIGNATURE-----

--Sig_/.nAwhXOAwEHeMy8FjI+hqck--

