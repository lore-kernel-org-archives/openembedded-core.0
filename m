Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A77C352A1
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 13:36:24 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.11155.1669815373782928931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 05:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=WzZp/GCF;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 55174851CB;
	Wed, 30 Nov 2022 14:36:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1669815371;
	bh=87MUHMJdCjr6lNwURLUMtYxvkmOQXo4RmCOPPr7bcxs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WzZp/GCFATWsfN2UAhj9vRIjCvmdLqf0eqTR6MDx/7Y+m+qL3fGlL/0q2aSfuW+Q3
	 RCRBKvGYuKByPBRzy+FyCWENski4grKZYDWlResDcUJ4fiH01/EReQp7ufBtgPMKvL
	 zqtff1/iAssHHSEMcis+DoLfcow9REIL6InWLLNDzcLTx3ZWPw5ooPw1XAryiCBcwz
	 szypLsxkihQtpBOQLvfSnclrmDz9Vu/hTBixlvbss0zZLVi0N3zvOIsFzXPN2CKa/T
	 zBsQczGUWYuA6uH+CLruZyZK/PDgQWJ+vEz7FTXCM407Kb648Cci73MFdpS512w+Cc
	 f2AslveQb0rrw==
Date: Wed, 30 Nov 2022 14:36:04 +0100
From: Lukasz Majewski <lukma@denx.de>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-architecture 
 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, OE-core 
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [Openembedded-architecture] Y2038 proposal
Message-ID: <20221130143604.5a6659dc@wsk>
In-Reply-To: <bda7b996024942763ae9d03ea0b958c3a38b04c8.camel@linuxfoundation.org>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
	<CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
	<bda7b996024942763ae9d03ea0b958c3a38b04c8.camel@linuxfoundation.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5uLdDqz8XK.ZgJ80UD.TmrP";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 13:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174007

--Sig_/5uLdDqz8XK.ZgJ80UD.TmrP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> On Wed, 2022-11-30 at 09:07 +0100, Alexander Kanavin wrote:
> > On Tue, 29 Nov 2022 at 16:45, Stephen Jolley
> > <sjolley.yp.pm@gmail.com> wrote: =20
> > > We=E2=80=99d welcome a proposal/series on how to move forward with the
> > > Y2038 work for 32 bit platforms. =20
> >=20
> > I have the following proposal:
> >=20
> > 1. A branch is made where:
> > a. "-D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64" is enabled globally.
> > b. qemu is always started with "-rtc base=3D2040-01-01", simulating
> > Y2038 actually occurring.
> > c. an additional runtime test verifies that both RTC clock and
> > system clock report 2040.
> >=20
> > 2. This branch is run through a-full on the autobuilder. Any
> > uncovered issues are filed as bugs.
> >=20
> > 3. Once *all* of the bugs are addressed, repeat point 2.
> >=20
> > 4. Once there are no more open bugs, 1a is merged into master.
> >=20
> > Any fatal flaws in the plan? =20
>=20
> Others have made some good comments. My thoughts:
>=20
> * We need to add some runtime tests to oeqa for this (in addition to
> the ptests)
>=20
> * We need to have a 32 bit ptest run on the autobuilder (qemux86
> should work, not sure we can make qemuarm fast). Whether this is
> manually triggered, not sure. We could have a smaller set of ptests
> to run for it?

Y2038 ptests maybe?

Here is the list of integrated tests to ptests:
https://github.com/lmajewski/y2038-tests

>=20
> * Could we optionally disable some of the glibc 32 bit function calls
> to ensure they're not being used?=20

Could you be more specific here? Would you like to disable some
syscalls?

> We don't really want to diverge from
> upstream glibc much though.

Could you be more specific here? The glibc now supports the whole set
of syscalls as of 2.34 version?

To enable them one needs to pass -D_TIME_BITS=3D64 flag when compiling
programs.

This is now the official glibc ABI.

>=20
> * We need to work out how to communicate this change happened and have
> people "buy in" to it.

Ok.

> The reason for that is that if someone has
> existing binaries, there could be problems using them after the
> change.

The binary shall work without issues on glibc 2.34+ and 5.10+ kernel
without issues.

The only problem happens when new binaries with 64 bit time support are
run on glibc or kernel not supporting 64 bit time.=20

> We therefore need to be sure they are aware of it.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/5uLdDqz8XK.ZgJ80UD.TmrP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmOHXEQACgkQAR8vZIA0
zr0EeAf+LIxSEVihJW+djndVH+6K6hXwnp7X7/aASTQXQjdp0z5nFoJs5yFnx7YT
7ogbQosDAiVcTrhpZBMnee9yE6IigYMhUZzQTAlVQE4Mhf9MXqttintGNZ4QpGor
kswQ2pSGVM201cJ5NASTjnG9JLGTvi6P7jjPUTKIP0w1OCsVPiyG7WcdFes/oPEz
MMMEIvdJm7PMFClVgKq2RCTEMPX4moKUqQy2B7Mh4hqKPzRX1FtkTjL+4VMPryja
x29ejOa9xYBygbeTF8K3MsFSQHWOZQlmnjebq4UKY2hfdr8VB1bbf0aEW//hvoyr
lByaatE8rTNGHV7GX0shR1QZWEpqJg==
=577q
-----END PGP SIGNATURE-----

--Sig_/5uLdDqz8XK.ZgJ80UD.TmrP--

