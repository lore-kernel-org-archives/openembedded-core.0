Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D48C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 13:39:56 +0000 (UTC)
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.web11.13791.1714657191754390241
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 06:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=BzJZNyix;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=HNtIU0PL;
 spf=pass (domain: stwcx.xyz, ip: 103.168.172.155, mailfrom: patrick@stwcx.xyz)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 1C7D511400FF;
	Thu,  2 May 2024 09:39:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 02 May 2024 09:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714657191; x=1714743591; bh=/HLRT9X4hK
	2KTEPMafpS4sSqop9NOI3GVfUj/4Yo6OY=; b=BzJZNyixt6bDsfDX7vx2+XaKWT
	ByokzbljiabQh0aBdh1f/xeRtYuuBp9E0A2NybtGeiGeQMNNFU6m06gY4n7uKbCx
	6bq6pTKDwWz8iPbjDroP8Ycl1zgVezdOd4pOvccbEfgKjMJdPz1gu6EDLsLwBSbY
	f/93fCrCEJO9+KrJAuH6IXJrEEQGnZMW3XnNr4I5ARBu/Fcc1SS2SGK0qnEjGVNQ
	0wx/ImLPD9ERuRgGFA4rCYHvnwVIgybcAwO0R5RejloiqXZ7R3sbq24g6rOVUvx5
	WF1f9KO/v8bRGU1YjuQxOWEpP4N38TtRx10CmzKatXR/nlGKdiNJT4quUlfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714657191; x=1714743591; bh=/HLRT9X4hK2KTEPMafpS4sSqop9N
	OI3GVfUj/4Yo6OY=; b=HNtIU0PLYqK8A7hJr3uxwmfCiPKB9I51BmMX4BuVZ3hy
	4or+QJbz6P1VIM+rfp+bS4km0Px4SS07uQ4cD0lP8H4C+sS3RYXwVD0hSSMGSfSj
	86jtT1dkwcTgxFA6rmjWRGvWz/CYqyPX5odO9TLnxfc2nlKja0IHyZ5at5QROtDb
	j+vi6aUwjjGH+OMf3f7msAp9Bdxyo+6+LZCxm/ZVyOix9ZdjYtfR5X//rdX/fo7Q
	X6N2dz9s0epyeQm9RsGulZGdXCooLm+frJ+rzWV3BTgrY33YhqxelMmuSrNKcdiX
	qTVia4uMoExbvT4mbW+/O0DP//w5WbQqoPOa5hLnUQ==
X-ME-Sender: <xms:ppczZuwCC_DMDT5K4pwOk-quRw9SmGrlqpNkbAIllwuzpn9_HmF4BA>
    <xme:ppczZqRi1rrhHXdcM2N98-VXbjkKydUXcpbqj7NN4NmFdvddJv1QnujqVN8GodVu0
    GC15H3pfcIh2RKuI9c>
X-ME-Received: <xmr:ppczZgWwd0ic5lP2PWAVFaHEskjQ5bBVYPDeMGyqmJO8iHsYgyV21yHQOjunx3iyTR7iLt1SQNEeFVZtxVxxTa7XoznGTePeLsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddukedgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeejiedvgfeghedttdffuedvvdfg
    veehteetfedtkeehheegtdfggefhheeiheffudenucffohhmrghinhepsggstghlrghssh
    drhhhofienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:ppczZkjcmUJuD8jbPGm5xAtzqvWx3FYu1kuAlew28gE_dWmO-fTgMw>
    <xmx:ppczZgA_D1ZdMVZHEqBX5KUu4EIWY_2cHMYTfXe3k6237kUzeC_hiQ>
    <xmx:ppczZlJv_utmt55YcHJIqDWt5Ds0vH_O_ZY0LDcrL4maqvTCKdF_Fg>
    <xmx:ppczZnCjjkHiW2ASB9l8b-C2dzmtVQcUMHW36-I41pKJ3t-2LpKSxg>
    <xmx:p5czZuDd7UGf_MLAiFGrJSnCBMsf-aD2amyIlR92ku7FdMWJjeyDihBH>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 May 2024 09:39:50 -0400 (EDT)
Date: Thu, 2 May 2024 08:39:49 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Lean Sheng Tan <sheng.tan@9elements.com>,
	Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"Hansen, Alexander" <alexander.hansen@9elements.com>,
	John Chung <John.Chung@arm.com>
Subject: Re: [OE-core] btrfs-tools-native build python error
Message-ID: <ZjOXpREhYRo2vfzX@heinlein.vulture-banana.ts.net>
References: <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
 <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com>
 <17C993B983870D20.19690@lists.openembedded.org>
 <CAMWxwJ3ok_d17XnVEgSm3H3qeKK+7U3AQ4OuwNFXTo-jWjtHoQ@mail.gmail.com>
 <ZjKzwmSpKmznOedr@heinlein.vulture-banana.ts.net>
 <CANNYZj8eFxRVx6PE9RuOPS2L0Km+4O=19XC6gDctZ4v3dVH-jw@mail.gmail.com>
 <ZjOMcNhYVh50R0lt@heinlein.vulture-banana.ts.net>
 <CANNYZj8M-XvZQK8w9czayXczA_3-8LPB-+pbqXSpzd224y5jRQ@mail.gmail.com>
 <ZjOPwKHrUfzjbvWL@heinlein.vulture-banana.ts.net>
 <CANNYZj8JxAWmFXu5ckS4_RA8LrFBWzV=kZh=RV8UkGCCb3whCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LwKI/gvWY+dJMzW+"
Content-Disposition: inline
In-Reply-To: <CANNYZj8JxAWmFXu5ckS4_RA8LrFBWzV=kZh=RV8UkGCCb3whCg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 13:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198923


--LwKI/gvWY+dJMzW+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2024 at 03:34:43PM +0200, Alexander Kanavin wrote:
> On Thu, 2 May 2024 at 15:06, Patrick Williams <patrick@stwcx.xyz> wrote:
>=20
> > This is almost never correct and there is not a single example of it in
> > poky.  There _are_ examples of exactly what I wrote.
> >
> > If you do `PACKAGECONFIG:class-target:remove` and there is not already
> > an explicit `PACKAGECONFIG:class-target` defined, this in effect creates
> > a _new_ _empty_ variable `PACKAGECONFIG:class-target`.  This is nearly
> > never what you want.  You typically want to take the base contents of
> > `PACAKGECONFIG` and remove something from it explicitly for the
> > `class-target` class.  What I wrote is exactly how to do that and what
> > there are multiple examples of in poky (see tclibc-barmetal.inc,
> > no-gplv3.inc, meta-openembedded uim_1.8.8.bb).
>=20
> Right, I just reproduced this. To me this looks like conditions in
> inherit_defer operate on PACKAGECONFIG value that is assembled without
> considering class overrides, and that might be a bug.

Worse is that it seems to always operate on the `class-target`
overrides.  It is as if, at the point that `inherit_defer` evaluates, it
is not known if it is a native or target class and so the default
`CLASSOVERRIDE` from base.bbclass takes precedence over what comes from
native.bbclass.

>=20
> How to see the issue:
> PACKAGECONFIG:remove:class-target:pn-btrfs-tools =3D "python"
>=20
> bitbake btrfs-tools-native
>=20
> You might be able to work around this by avoiding :remove and setting
> PACKAGECONFIG directly.
>=20
> Alex

--=20
Patrick Williams

--LwKI/gvWY+dJMzW+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmYzl6UACgkQqwNHzC0A
wRn1kg/+PNb8kThl1txE4fgAF8iujnonCKC/xRDBsxxxCoE+3BhYv9HBjxMLYn9m
cQy8xEe/qSjq/2S0FMIo5+INRPOhrS6G/0lHxiVUb3lga2XeBhZjfTkREJDA4Qi9
+yCktrdS0Wruz9NGhezcmbFub9kDDoaYDK9FpTzw/iLU7hADWP924aMv0qv1Wi6+
nL4fIF0Fh41SnWMHvUSGwpRhdMyp3ShbNuRzauzCf8MUe8xo9G7dOhqQG/81sQbS
bcWLMe18Ew9Btk1rGMbiGvsPmpmaacZCTz4DizI7bhRVQjiTTv9EdXsoR4i3Uj+Q
B4+TEETJR42AvX8zPWtHVYNED/pq1yFtHTfJeRfpR6d5AM0n6MoIyQRkaB2Q4y5O
rlOuIJeePHsr31CyM792fNE3fiVD02H8EkDExPQMqWsYyhwoJsiYYBsznsKssLVt
kj6MfZ1xQ6Kccovra1tyBgA0rOHP7QuXng7G2LJklcortEbsykrqcfBIHlVI/9N8
UnBNFj7nOXC8Mv1iBbi+wqWwPgwg+3VNg0B7HNYq5ctlzq4Y7z2UVHNGjIcmpW2y
MD7KH0LRqLXHYaWj6PDVJFBB48Ft3oFcrJswY9H2o1owr9HO8+Tpr0Bc7ZhQbJPb
ivnPpOOTU12+eCXi78pQcB1y2q0ZV9MjCLwLuxoxpu+ZuLnzQi8=
=nHaL
-----END PGP SIGNATURE-----

--LwKI/gvWY+dJMzW+--

