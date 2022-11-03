Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E73CC433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 15:54:54 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web11.241.1667490886283084300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 08:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@stwcx.xyz header.s=fm3 header.b=hBmGLnp+;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.19, mailfrom: patrick@stwcx.xyz)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 578AF32009A0;
	Thu,  3 Nov 2022 11:54:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 03 Nov 2022 11:54:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667490884; x=1667577284; bh=JPTm5Tr8hh
	6DYBzVGTLpG3cqujQX5eonOd3lPGS6UGA=; b=hBmGLnp+VVlwGemH0iIS3ptMxM
	9ylHRKfcTaJ1zmf30Fk4efP1Sv5x3tbGvKyILr0uey2PkGb7bm3v+RuwO0s9gp4S
	0tFSbBRrEMskkvXeTD3Y3QZvwmz6O2Z1ebxMpKJJxqM9P6BdjNeMskgQ3FizKh5J
	ZBUovzw1N+jstCQ+bq+yQrT3YNH113AT3B9e9FhxKQhyAVCqiK3B5vmeC7HwkToD
	GHTdy0DPBbrx8Oi5BXis+outA1EYPFpqy/Cs8qZs/56mJQTgY3GYLZhpzbHZaHoM
	j4LdT2v/YuSDxeN2Dt/OOhqheLQkEbqrYBBVxm49hyALRo7zXRWnCov+zSNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667490884; x=1667577284; bh=JPTm5Tr8hh6DYBzVGTLpG3cqujQX
	5eonOd3lPGS6UGA=; b=lNfa1eTRhT4EwLqQHoWazce2IJIL+lBEmBI5OFBjPjoG
	0CQJ47DKgV1x81jEPgKvCfqqirDEMO605l7Hfao/xDCu5+loAhxhTM5NxwISetwj
	4XMwmMZEo5GF/Eh5xuepfsq1zGv9b0P6in0AEyCOn125x9i3mnj6i9rAW4n5U2h6
	RGl9AQXUpFwOP94KiBb3Ok1+kkGK6dH6CcznrEP0UElQIewsfnXVqKvftQcQBFPP
	V8Ikwok4Osz8GSmNFCD4r/Gyw2AHMm6BVsK15qtyxmGrfjQP+5ss4skvRFgQKEMh
	A200CKUo4wmx60imkDZLqHCN6qZu5qmoSyhj2Dt6XA==
X-ME-Sender: <xms:RORjY9xuONDiWBpjrX3yRsIKqG22bDartLbZSqtyX-N6kTgTYGW5iA>
    <xme:RORjY9T3Zp5vWZSYjQX6VG4Os72ZlT6Suv-bax0dWsStUfrHBVB6q54AwunHWAOVG
    s8mYE3roehReHaRhK4>
X-ME-Received: <xmr:RORjY3VVUDvXJLpmpg9FMcaOmvGwq_UM4LLaShH_ZznuDxUIuK39W9Ww_G8A5kYYe_SBWUKP6jRJ3dyxM9vTkP52AeZ2pXKmGgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudelgdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddujedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhephfduudfflefgveevheetudevudev
    hfelhfdvjeegleelueduteeftefhhfekvdehnecuffhomhgrihhnpehophgvnhhsshhlrd
    horhhgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:RORjY_jsuvBa4F4ZhlFsMDxU932DO5B3AvGGZsDXOgALsfEfXSffdA>
    <xmx:RORjY_B5YTHwvszRcnF_1Xp9PkBsie5-hv6mP86yHp9PGqkGO2Cx5A>
    <xmx:RORjY4InNaSsEqWeCcGQO_Vu92oapnWLlxBJAgpVkN_boR2l91RRfg>
    <xmx:RORjYyrMpLdT-jwqMSxk_vGT00T3psRSY94rwaUkt2BYnmPPaSe_Og>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Nov 2022 11:54:44 -0400 (EDT)
Date: Thu, 3 Nov 2022 10:54:42 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][langdale 01/20] openssl: CVE-2022-3358 Using a Custom
 Cipher with NID_undef may lead to NULL encryption
Message-ID: <Y2PkQjspCvfitDqj@heinlein.taila677.ts.net>
References: <cover.1667356805.git.steve@sakoman.com>
 <c28dc71f17133f6e4470fc0c1a552c743869b3ad.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BTTURQGjzWlULENj"
Content-Disposition: inline
In-Reply-To: <c28dc71f17133f6e4470fc0c1a552c743869b3ad.1667356805.git.steve@sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 15:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172639


--BTTURQGjzWlULENj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 01, 2022 at 04:41:51PM -1000, Steve Sakoman wrote:
> From: Hitendra Prajapati <hprajapati@mvista.com>
>=20
> Upstream-Status: Backport from https://git.openssl.org/gitweb/?p=3Dopenss=
l.git;a=3Dcommitdiff;h=3D5485c56679d7c49b96e8fc8ca708b0b7e7c03c4b]
> Description:
> 	CVE-2022-3358 openssl: Using a Custom Cipher with NID_undef may lead to =
NULL encryption.
> Affects "openssl < 3.0.6"
>=20
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> (cherry picked from commit f98b2273c6f03f8f6029a7a409600ce290817e27)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>

Instead of picking up this patch, wouldn't it make a lot more sense to
go to 3.0.7 like we did with [1]?  Since 3.0.7 contains a HIGH severity
CVE fix as well as the one mentioned here, it seems like we should get
that backported to both Langdale and Kirkstone quickly.


1. https://lore.kernel.org/openembedded-core/20221101170310.2740317-1-edtan=
ous@google.com/

--=20
Patrick Williams

--BTTURQGjzWlULENj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNj5EAACgkQqwNHzC0A
wRlfCg/7BU0l++JOG0xiq5PwEAv5IykAhHmVAbjg+pDGGumw8jjoziCIB64rNFwh
1H1+hl1INLNng3Ovy5U7uq0jhCHNI1/SiYVEu5q+X+XdgoDq4jB3LG+1XeTHoqJT
1UsBRn8jABZr4IcIEsDO+fWG+nhm5vZ5YB1US4tvi43yygLuguaPcya0ywsQZwHd
0+ltRwE55lrwcJBYJeWVPAKgk+g5BPQ8Xq7bpqZtzgLeu01LLGIPhSTJ3/ysvgc2
w4DJQjxN5QBTEVf/cNFWoJpZpfJrwCWDoA/2qGYA+Ma8o2BgM8tfXujyat20LGlF
hIjZS7PU5U+aSexYSUdLQF3osMNw9/3/sf3hTxhtjNUOpWB1FQeEeZFelYJ6M1iA
5mm1CUstoY2yriZg0CD97d3ANjriIhcDGurn5pfVmUCMoDXOPOpn/U3GVsQ2Dcfj
jZCTxTATnkEZGl1pNWXkNLUCfYsb2kyElylJQ5Y2LI5IXTz2SAAxL1AV4bNM1Q5M
4ZbHHc540XAAHziiyeY2mW2gdeElb5PCRHW/eXi3tbTuG3UHI+uWCJl1LzZ/4Hmv
b8yBJNYS1F9sz+4olqZvkC+oXOtRyfdsUVRxMj4p18VuIltonjG2ppqKZw2t+FOk
PZxqoaTfvCq/3vfHK74prH40Ie+Zh06B2fnE4TQeCbc9zKrNAFg=
=PcEW
-----END PGP SIGNATURE-----

--BTTURQGjzWlULENj--

