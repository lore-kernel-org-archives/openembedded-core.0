Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1126C25B5C
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 13:35:06 +0000 (UTC)
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.web11.13688.1714656901425704802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 06:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=o/6Hd/Jg;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Kl/mAmZS;
 spf=pass (domain: stwcx.xyz, ip: 103.168.172.151, mailfrom: patrick@stwcx.xyz)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id AB133138113D;
	Thu,  2 May 2024 09:35:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 02 May 2024 09:35:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714656900; x=1714743300; bh=EyFywIyT1T
	XARv1b5dFT3XAcSjd/e15AmGdez5+WhFw=; b=o/6Hd/JgbgTSKiILFg0nDOyC3+
	eGMQKrULdJk4hS/C47DdIWIbkK6xa2ebnFma7b2s/P5NQtRsj0Vt9XpVwMGPOh28
	41Hs4NWAQE/W1vZExBZyV0Yk2UqOUBbDVT8E+EZ2X9qukN5YyJQPQwC8aRlbNNPQ
	dJwK32FeRv45uKYjXu3TqkUzAmTh5TT6/4WP5DNzGhA/j8LZTSwgKfNmCEmIctsw
	yT0+1f+Y0k7YIsb65nD/qphnsfuQnTTfcIGei7JR6Yl9HQl/tGIHyqYoxApJBfKx
	0iPyOjRKNctNW6g0ZWCj7hVgO/E8Eai0bkK7R9Y95lu51lG7tYAjLZCB9kDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714656900; x=1714743300; bh=EyFywIyT1TXARv1b5dFT3XAcSjd/
	e15AmGdez5+WhFw=; b=Kl/mAmZStycbsMRjJPmaLZlcsrJpFgvR9lcxXPM9FRlp
	LENeeEgcGepnby6P9dIJwx5d6RkxRcCuawtqtPfE7yil/83ixB2fLZmSxLBbKaxH
	1aGwfYnCHURIO4YPaJ3NBaVLQZ81Bxl9GK/p2OvZreubd1mz74Neo8BNdvpJYDJT
	sqKLngpQQTLbFJY1TJvABeVEOGoMG6Ef+vbA6UDM/7Mjtp3qTtdPGIlr0nuz71Tz
	0nJZL+FeevFvuntfmU0VZmvQoQNog8mY40AbfhCzstOXB0bUCchB6VZu71MvIIuG
	1tBNumQEiQUgRqWkkPIyQcapitDmwxew7eUITvautg==
X-ME-Sender: <xms:hJYzZv5j3Ho_HPT6Jn9XpLpJ9s1nsT_qHVu7_Ozp_YabnTmniGWmyw>
    <xme:hJYzZk7jygvW8mbODqKaGHf-MNgAj1XlhbLACQQupU5h9y7kdMicgi7uZGz8mZF2R
    3CSN5KuTUm4IDWP5xM>
X-ME-Received: <xmr:hJYzZmc043QtoqiMbyyYNbSs7s2jANBHrbfrb8lfQoZAnjNRUn1NQf4fpJdY_C4U9UtKVQ0N83q-9_fnUUJ__Qtu5G7zMxgMjl4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddukedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffeh
    ledukeduleelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:hJYzZgJGqcvxUoRvkro4Cj05JdgliYibdtHdYWkmrjkAOS_L70sO8A>
    <xmx:hJYzZjJfFE7UhzjvDvHDMlT_DogTWvqSwPOUCYFElwnwUEG9ywqlTA>
    <xmx:hJYzZpwQMiukEAkkhoUK_uYx1n8nrcQR3hEkYJed5cTJc3zSUoKH_Q>
    <xmx:hJYzZvLLqmkh73kt1sgUWJY6hqBlF9tpRt0PrM5WhQVfHJMSrsx6gA>
    <xmx:hJYzZr_EQiV6fb8FGnDeJCjECuhDtj6CWLFTTlMAZNH8rwTrJjzU7Ne_>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 May 2024 09:34:59 -0400 (EDT)
Date: Thu, 2 May 2024 08:34:58 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Lean Sheng Tan <sheng.tan@9elements.com>,
	Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"Hansen, Alexander" <alexander.hansen@9elements.com>,
	John Chung <John.Chung@arm.com>
Subject: Re: [OE-core] btrfs-tools-native build python error
Message-ID: <ZjOWghBOF5n6HAv8@heinlein.vulture-banana.ts.net>
References: <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
 <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
 <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com>
 <17C993B983870D20.19690@lists.openembedded.org>
 <CAMWxwJ3ok_d17XnVEgSm3H3qeKK+7U3AQ4OuwNFXTo-jWjtHoQ@mail.gmail.com>
 <ZjKzwmSpKmznOedr@heinlein.vulture-banana.ts.net>
 <CANNYZj8eFxRVx6PE9RuOPS2L0Km+4O=19XC6gDctZ4v3dVH-jw@mail.gmail.com>
 <ZjOMcNhYVh50R0lt@heinlein.vulture-banana.ts.net>
 <CANNYZj8M-XvZQK8w9czayXczA_3-8LPB-+pbqXSpzd224y5jRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dbGJ3BJC3jpRgo3/"
Content-Disposition: inline
In-Reply-To: <CANNYZj8M-XvZQK8w9czayXczA_3-8LPB-+pbqXSpzd224y5jRQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 13:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198922


--dbGJ3BJC3jpRgo3/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2024 at 02:57:30PM +0200, Alexander Kanavin wrote:
> On Thu, 2 May 2024 at 14:52, Patrick Williams <patrick@stwcx.xyz> wrote:
>=20
> > I'm not convinced this is true.  As I wrote, the final result of
> > PACKAGECONFIG is exactly what I expect; it includes `python` for the
> > btrfs-tools-native and doesn't for the plain btrfs-tools:
>=20
> Run experiments with plain poky and changes in local.conf, and that
> will convince you.
>=20

Done.  This is with the latest poky and crops/poky docker container.

1. PACKAGECONFIG:remove:pn-btrfs-tools =3D "python"

bitbake -ne btrfs-tools-native results:
    PACKAGECONFIG=3D"     programs     convert     python     crypto-builti=
n "

bitbake -ne btrfs-tools results:
    PACKAGECONFIG=3D"     programs     convert          crypto-builtin  "

2. PACKAGECONFIG:remove:pn-btrfs-tools-native =3D "python"

bitbake -ne btrfs-tools-native results:
    PACKAGECONFIG=3D"     programs     convert          crypto-builtin "

bitbake -ne btrfs-tools results:
    PACKAGECONFIG=3D"     programs     convert     python     crypto-builti=
n  "

These are the exact same results I am seeing with our openbmc tree and
exactly what is expected to me.  Still, `inherit_defer` gets the
incorrect evaluation results.

--=20
Patrick Williams

--dbGJ3BJC3jpRgo3/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmYzln4ACgkQqwNHzC0A
wRkiOQ/+OES31fb+6YL/FsVdVwK/JMzx8jB6GfRt2yqMVZNSmDpCCm1VoWa4Aumn
RGNkvPXyzSjQETZHs5uUbwTWONQ4sk8IOZdSGk/QYbkEy0Kj+UsmB6apExPnpEEb
7a+l/sFQHInqk82cLJuhQAXv1DFfLS0wPpJIsouckn95WGIYRoEB4i8+ffad9e2G
568f8CEhMDud0kGc+W4lzKh2U3xiaBLZjbGTGVxuZaBz6Pl2jXpjq/OovS5RajXt
UfOt9JWfcPCnS3LORvUJKJqTbbAakhyNFq7P5T+AukWX87XeiUi5mXJ8ld4xY7zK
t00FVww/34aRfk7A5XLyJ7uC2dHe2SPQNR+CDFG/Ew2Mm3I2EfkgGTPO2IwtcgQA
cIwKnVKrCNATzXViRlfTjxDdaowAMTsrMx7cKtqJK2tMdQn9sJc8mED83t6+nyzS
3Ow9hLY4qPFT6wovsfkW6RqAnaZcQqIIqszmOBb5yxCVbEYUDY8WptglCdGUwAoN
Dce0XShFN8f7k3LYgjJvvDZI8lyYwN10yOXmwKu5L78m1NRHsxtFJzXpImYK2lUa
3y7LGj2xC1Ev7FtR/L+vmAToC8mLRSwbT/Mu2nyQy1SGjFb9H3/NjkMqS3L0gzWd
xId6XEt4+ZPUcPZdGrjnxp9/63+I1bXD7LKJATtY0Nh8FK8SsyI=
=nWdk
-----END PGP SIGNATURE-----

--dbGJ3BJC3jpRgo3/--

