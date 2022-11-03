Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9539C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 16:48:24 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web12.888.1667494095862646662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 09:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@stwcx.xyz header.s=fm3 header.b=KxOdQ1ST;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.19, mailfrom: patrick@stwcx.xyz)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 07D533200917;
	Thu,  3 Nov 2022 12:48:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 03 Nov 2022 12:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667494094; x=1667580494; bh=B0/3mINa7Y
	b6HMuB7vSx2eQy7DCPy6nWD8BrhWizR8s=; b=KxOdQ1STy8OneV11q5rJvhx4nj
	3MIN4paFvmh07riwjDQ/DmjkcyxNp5TTVqlMynYXRzLGMSqvCvzr0EuHUUmtNYRQ
	GMtmYoVALvUc2XfF1rvp91cJJBXhS12Ydcelzxco8SudKRZ81gaeJz1ankio7m6F
	ZH6ZFZI+AH5/z2Bca++F5RbjiAaNDRA1B+FhsW92uAZA/lVgkX2hdYerw1G1acMC
	WFg7a+xraId4KRUjioZixuu8JD9hdotd/1uTUL2xcKgyxoCIv+KkBNJH18QGTN7n
	QT6hL5yzzUmzBGZ0RKJudjnXBHR6eb6xqbtishoX/efpfz7LF2kF+rVgRVSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667494094; x=1667580494; bh=B0/3mINa7Yb6HMuB7vSx2eQy7DCP
	y6nWD8BrhWizR8s=; b=OpStApdeMCR+Qf/iNQrff8HD4pwtV9QCqKSjZSNIdcNQ
	SrGnWrzj0QF+q0sIys0lrDA5cPpFLletvqnDbKa9OdbZmXmIMiVRxqQg08mHktzR
	HYa44rjtoUUP++P3klyC58VA4nToW8ydeGUuh4vSBoQc9Zvck4mn+v9vTO5lpq2n
	HV9G9CiVhVh2RAEkKqnNaBCBRMPloMAmkHBOVDaqPUnndvjLBwKnGNqeDLGQWvqr
	UW8ibyz+/u419ivcZss/iXw2tRZae8LLdEpg+dXsUv39e7sPL9hF0h1SfycvAefg
	31w+BuH9e0CP4JZTE/emM5RFHZ1HKcBbVRmzMH8AeA==
X-ME-Sender: <xms:zvBjY5LapAnH-koABlG1QwdoKE9AGQ3LVfPg8XqkJAqB95-7bRMprA>
    <xme:zvBjY1JYHpo_-LzrY4qYcB5t-vG1tV4f3tc-lE_hgY6CUd3JvMNs7TZYIoinzBHwy
    OvfSF-KB_Xmc6fx9os>
X-ME-Received: <xmr:zvBjYxufPWFxcX4-2nX0VcKlDGRBk3j0WKvgVpdxpcQ4zgkrlSKAl-9t5U6GP21Y-GvlHsnvNWHLHb-VZeNW1kS8E3lcl6PDLho>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudelgdekkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgfelfffhhfeileeltdfhfeelffef
    iedvvdffhfffteefheeuleehudehfffhgefhnecuffhomhgrihhnpehophgvnhgvmhgsvg
    guuggvugdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:zvBjY6Zs9h-VqcHZrtuyGSTXJjLJOkqKlCx5YDXxwYPCp4q5PJsdrw>
    <xmx:zvBjYwYr1Vokjz0degB-V6LwtOauPxB07TSagr7fW0SSW6G7_1nVDg>
    <xmx:zvBjY-BR2Y_8OETbsHrznZ0nCPudoGs7SkZwOGtGLS2ponjqFe8xuw>
    <xmx:zvBjY5Bk97r75dXs8BO2Nhdit288KFfO1w0YVES0pANCB8XWlEro_g>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Nov 2022 12:48:13 -0400 (EDT)
Date: Thu, 3 Nov 2022 11:48:12 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][langdale 01/20] openssl: CVE-2022-3358 Using a Custom
 Cipher with NID_undef may lead to NULL encryption
Message-ID: <Y2PwzAYE9uTZgZHA@heinlein.taila677.ts.net>
References: <cover.1667356805.git.steve@sakoman.com>
 <c28dc71f17133f6e4470fc0c1a552c743869b3ad.1667356805.git.steve@sakoman.com>
 <Y2PkQjspCvfitDqj@heinlein.taila677.ts.net>
 <CAOSpxdb0PxRcf7Xgq5sP3JHVe9doF7XH71xW=yK4wYQwpRnegQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jpu1Om2pSGEcAXxg"
Content-Disposition: inline
In-Reply-To: <CAOSpxdb0PxRcf7Xgq5sP3JHVe9doF7XH71xW=yK4wYQwpRnegQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 16:48:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172644


--jpu1Om2pSGEcAXxg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 03, 2022 at 06:28:04AM -1000, Steve Sakoman wrote:
> On Thu, Nov 3, 2022 at 5:54 AM Patrick Williams <patrick@stwcx.xyz> wrote:
> > Instead of picking up this patch, wouldn't it make a lot more sense to
> > go to 3.0.7 like we did with [1]?  Since 3.0.7 contains a HIGH severity
> > CVE fix as well as the one mentioned here, it seems like we should get
> > that backported to both Langdale and Kirkstone quickly.
>=20
> This patchset was tested and sent out for review prior to the 3.0.7
> upgrade hitting master.

Understood.

> Note that I have the 3.0.7 upgrade in the patches currently under test
> for both langdale and kirkstone:
>=20
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/la=
ngdale-nut
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/ki=
rkstone-nut
>=20
> If the langdale test succeeds I will include the 3.0.7 upgrade patch
> in the pull request for the above series (hopefully later today)

Great.  Thank you.

--=20
Patrick Williams

--jpu1Om2pSGEcAXxg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmNj8MoACgkQqwNHzC0A
wRkvtQ/7BPHCxFe7NzVbuBR0vwICo8ol056FTKocF2R3kkX9LM/Fevq6ECxxwiTG
QxLAusq8lBwOicFZ6OrAKfhBsLUFBR4iQgEcn+AqW+mRwXlmSFvAa5MC3p3TGTbO
jk/bJo9A457d+zyrICSB6gBSEXxCsb/kWG38WzUCCRQXGAwrN5RPg3VfnDQHItWO
1GT93G3UjrwNWHKNirzlDU/3OQyeqfhkdsDjlMMY6JRXT9vxXJnEYZi+hLJjt7Fz
p3RaXefufVpeqq/O1f30LKoIkkecUDXf2wyhDnTkfqJWGXvJA88ZjwOCvdrDzDTp
2GNxpTB3x1LKhKHU3Xzv1OnJQuaY4f2cu9zekgCzpLkw9MuYrMU52YaAdI+NL8XN
+c1DwkxzgrUorFhprYT7+KmOBZrK8sUz+bW0TTsqHfAeg1O5vxzjSPk4jh02QoML
NqRbkkbQJrUVd+eoOVTmWm+L1aM3ZX+0D/3r4TpWS/hp1+dJxNGN37CynAw/o3ZN
dBm16R3glWgQh7qCq53JFDmZq6LmScvV5wGqqGWw+8Q1/KsBS/xZZjKUMG+FcH1U
VOF9iyAVwVojMlmHreo+z3DthEVuYuGfpkxdhD4FTycg0UAx2YXvEPqW1sf7pa8r
oTJikKl+7ZOVynCqOpE9MBSwZD/1PnvzI/Hm6O3R17/374xiaWI=
=gBG9
-----END PGP SIGNATURE-----

--jpu1Om2pSGEcAXxg--

