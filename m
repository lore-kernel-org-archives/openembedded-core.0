Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A37C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 10:53:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.30523.1635159193102836748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 03:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=bxDg6wqp;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0A157834B9;
	Mon, 25 Oct 2021 12:53:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1635159189;
	bh=eTAaWymXsAxrhQ3E8J7VucPKn+BTUehSsiJD8l3g8D0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bxDg6wqp8NnKgBHNKN/y0PTZ+zZ3AmuzCDoId6Sf7p4td3CnRl/VpvETMnzQlv6FE
	 Jqfn4P1WEWgu8drPgcwfAYqd4lKsw18kB7l1cV/5VyNMtkrRC4bul2glok6fxCpTCE
	 HrjRMGHDaFW6S2U57Wi0o4F+7BJUh9BARoY8cK47gkr8REvOI8ViaV0RLzdVe9Ops9
	 8F/aE8Euas7TI72xxImOXZnjJUuDNu3Bxa6ttkyyZzo6uxe1gxTkEb4m7cfV31VkCG
	 aifmFxj1/YacE9UVirNJdt+uz/eaqeOeLfnH5ecFIPzNEFhe/x/2o0IivGTiIvoYCn
	 zXdzHBXxCPUfA==
Date: Mon, 25 Oct 2021 12:53:07 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Florian Weimer <fweimer@redhat.com>
Cc: Szabolcs Nagy <Szabolcs.Nagy@arm.com>, =?UTF-8?B?RsSBbmctcnXDrCBTw7Ju?=
 =?UTF-8?B?Zw==?= <maskray@google.com>, "H.J. Lu" <hjl.tools@gmail.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>, Patches and
 discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Andreas Schwab
 <schwab@linux-m68k.org>, Joseph Myers <joseph@codesourcery.com>, Carlos
 O'Donell <carlos@redhat.com>
Subject: Re: [PATCH v2] dl: Use "adr" assembler command to get proper load
 address on ARM
Message-ID: <20211025125307.1fa34445@ktm>
In-Reply-To: <878ryhwgd7.fsf@oldenburg.str.redhat.com>
References: <20210907131616.23472-1-lukma@denx.de>
	<20211015075417.29931-1-lukma@denx.de>
	<20211015120915.GD1982710@arm.com>
	<CAMe9rOpPM7RmA65MzTNr2DtoC_wMFt87mnyJ4pgvmK5TAorCCQ@mail.gmail.com>
	<20211015145831.5d0fafcd@ktm>
	<CAFP8O3+DBOregW5SuaPErkHUt+5aqb=bL98wHGtXu-OwFwud+w@mail.gmail.com>
	<20211018110818.GE1982710@arm.com>
	<871r4iftvc.fsf@oldenburg.str.redhat.com>
	<20211025121819.16f63048@ktm>
	<878ryhwgd7.fsf@oldenburg.str.redhat.com>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/Egx3_PkkMq4zghNkfc/pwbe"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 10:53:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157336

--Sig_/Egx3_PkkMq4zghNkfc/pwbe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Florian,

> * Lukasz Majewski:
>=20
> > Do we have any idea on how to move forward with this issue? =20
>=20
> Either fix the prelink tool not to prelink shared objects that do not
> have a dependency on libc.so.6, or fix the dynamic loader to work if
> prelinked on AArch64.

Just for the correctness - both 64 and 32 bit ARMs are affected.

> I do not have a strong opinion.

Thanks for your opinion. Let's wait for other community members
opinions.

>=20
> Thanks,
> Florian
>=20



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/Egx3_PkkMq4zghNkfc/pwbe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmF2jJMACgkQAR8vZIA0
zr3ELwgAhrGX3/FR1XqytxntH1yQG4MKKU7rx35hMSD/gKrFJSxL9T9DZWv9TkhQ
9gN7nm3d8HbUJs/v0iAPZrUisezDE6/VcNJZVedMU05rTLJ9xTyyaREVGDOAPnOw
oslJ0S+D61hAUJoo5v7VrpfkNKjlxRVrOvkgo1TOMaACe363ExT2MB9bO2OOSl0C
vbwHhuEOt7BJcTP2fiCDx7vxP8IUhEFHeZAr7/neiVMMC+/BNg7rc/QjmbRqj8XY
SYVNYn5Q/IvUs63jioHgRH2XA+VbhCLrQR9YQx3gzY44M5/lV529GYM8a1vHpadN
5YKzloXriT9KNdivOzzIJfGVJjtOkw==
=kZPx
-----END PGP SIGNATURE-----

--Sig_/Egx3_PkkMq4zghNkfc/pwbe--

