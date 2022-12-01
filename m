Return-Path: <lukma@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689DBC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 08:28:50 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.37873.1669883322777682134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 00:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=U6O0/I4q;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: lukma@denx.de)
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AA8888527F;
	Thu,  1 Dec 2022 09:28:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1669883321;
	bh=zockMoqGOy4sPzsA95Sx2MC2QlbuTU7kD6MSHd70atA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U6O0/I4qEArUiOimQubPb7BmDtieq5xjkmnJMVKte9fm7OzzGsgTpslPzxvzVB68+
	 /AbfWXsBJX+3fxUiimSUfAdbZuQ8UBK0kXJ34qRWwVLXlH5Gc3eZnvrmGJ9xjwR8/i
	 PZAIxtxtBSsuuUAdVQTx+l2G+fqFfjziV+JxmqrVrC/l1bPwZAYkqGjtNk11SiMGyI
	 lOgJhj2x9HXd1EpSRy9BepjUjPDnbCFFWDEJwWdQ3rqKfaeuXRyYwtE1pUPHVvk/Wy
	 8dVDHG27+QJo0dlF6lyvaElsLbn8pxFqOr8bWrx5pVxtf7ZomUPdDzTydWtHu9uHjE
	 EP9hG8eW2eLiA==
Date: Thu, 1 Dec 2022 09:28:39 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, OE-core
 <openembedded-core@lists.openembedded.org>, Stephen Jolley
 <sjolley.yp.pm@gmail.com>, Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [yocto] Y2038 proposal
Message-ID: <20221201092839.7c41ec93@wsk>
In-Reply-To: <CANNYZj_uy0xpvB2-eSzsZYwPR6gew=RpTZJXiGAVGYhqRn8xkQ@mail.gmail.com>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
	<CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
	<20221130092832.62067104@wsk>
	<CANNYZj_uy0xpvB2-eSzsZYwPR6gew=RpTZJXiGAVGYhqRn8xkQ@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1vp1UqfAiwltagrLrPTW/Ji";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 08:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174044

--Sig_/1vp1UqfAiwltagrLrPTW/Ji
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

> On Wed, 30 Nov 2022 at 09:28, Lukasz Majewski <lukma@denx.de> wrote:
> > 2. There are ptest available [2] to validate if the Y2038 problem
> > works correctly.
> >
> > 3. Support for running ptests mentioned in point 2. is already
> > available in the poky repository [3]. =20
>=20
> I just ran these tests in (32 bit) qemux86 on top of poky master (e.g.
> no magic glibc flags), and they all passed. Do they need to be ran
> after setting the date to the 'post-2038 future' to reveal the issues
> and produce failures?

Yes. You need to run them with adjusted date:

date +'%Y-%m-%d %T' -s "2038-01-19 03:14:07"
ptest-runner glibc-tests


More info:
https://github.com/lmajewski/meta-y2038/blob/master/README#L201

>=20
> Alex




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/1vp1UqfAiwltagrLrPTW/Ji
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmOIZbcACgkQAR8vZIA0
zr0flwf/coaTVkunVpbuAovGSsGrhvNHIuaReDlHWv+dWsRXEL0guTOPWYm4Sbuu
EYHL7sywSPOPO6GTnAS3fzrNey7KcOQU8oU/fVqhCdiETEmsPcM4R8eK11UwCmZl
p0i3M0u0l4PvR2YiedYMuJZjbajGT//BtZWKEVCbOJholuKVULNkM2F6O/nUqGk1
PAA2DYXKRvRaG+XXXmlOGWy2kD/ydUsm/qtZG29wMDDv9attWM4Ql/5tQ6BO5abw
jSFYg/NFhA6pbhRagk/YvpnSEVxhs2ojpR0bBruVv+k+4Y3PBRj3cXuCJydxMF8r
MlW27FqpkDCbIZZERtpADkWbo17pYA==
=Z4u9
-----END PGP SIGNATURE-----

--Sig_/1vp1UqfAiwltagrLrPTW/Ji--

