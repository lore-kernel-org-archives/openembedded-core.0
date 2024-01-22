Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1336C47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 17:37:42 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web10.81221.1705945053699165902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 09:37:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=e8ItPqXu;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=fwXu0Itx;
 spf=pass (domain: stwcx.xyz, ip: 64.147.123.25, mailfrom: patrick@stwcx.xyz)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 8E8C63200A8F;
	Mon, 22 Jan 2024 12:37:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 22 Jan 2024 12:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1705945052; x=1706031452; bh=YyNbi0ufLk
	Pxs7kdbfUPxQGnyBs+3ck0XkQdvJH7wXM=; b=e8ItPqXueNKSvPd1V7UNy85ksx
	qKkGCavx6ZiuPCJqkam60YePxZ05uIhGoHzb9qqz7k2hl6ZyJO1fBY3sb03Ibx7B
	kcNr3PXlmxBdcno/S7Z9TbDFOG/ohljsehgKiZNFML9gNiyoSJE9mwQjKSOMZmc5
	RbYTra+N1rdHtc+Jzlg5e3a0nvTA+Py9lNcoudoj1Zn/k03BiINjMPDfhvNj6Lnq
	v85RC0NYJcAEOmRrgu1FR0ygacfkAwaOyQsMptqy6tvjNr6nP2chW/GnP6DbV2Yq
	0p7kl/XSp+iOiD5fMYpKygS5iY/G/3bBgsLKeF2hVncQEa6ZAyenGwv6nDTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705945052; x=1706031452; bh=YyNbi0ufLkPxs7kdbfUPxQGnyBs+
	3ck0XkQdvJH7wXM=; b=fwXu0ItxrVsrQTqBmTE3N3BoRJRmvUHca44yXCwwzGJ3
	h8IBeZmPtEz+uMg16+HgQfH+lgj4UEWodT0vyIGrIsbP0PDltjd8Tqe/p4FiiKk3
	69O09rkN50fHi3odtyE3FPXvCwnnLaE38VwLR5CK4PSLNyWod5dG/IITW0GqtPoo
	vE05AdY8Gv9dCKdIa4/ZAwTZHKidLDJ9dnBucZl1mEG/1xt5B/zW1jq/+/79+l2e
	0ggo8GSqrM6vRfhgbF+7NeWXivMCTA05EpceEL3ptLjpmlalll9FZy0Wdpn+phoH
	LzoK95JZvisiT3UionMFbxxX12o5jSY8LjN4xRJP7Q==
X-ME-Sender: <xms:26euZbrbhautAzPpOZQXh-fQTjNeDboCG8IlMR5YBBF7oDvgPAb7OQ>
    <xme:26euZVrG1W7nGPvmXtO5W9-kU_yk8asriGQ4hu_Zd673-aD1JP-7SV_VX9hOilxIS
    Y37LGuhZ8cbGfFfbAk>
X-ME-Received: <xmr:26euZYOokh9bOJDGxEUyi5S_tV9g8tgtO2hNXghmUDq1f5qKd54vKRftq5fMr1PaoE-5TomP4I0q-XW4Wrc1tX-l9tbI4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enfghrlhcuvffnffculddvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreer
    tddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepueeklefghfdthedtveegkedv
    gfegkeehtdeuieffveejvdffkeevgfeuhfekleeinecuffhomhgrihhnpeihohgtthhoph
    hrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:26euZe7dfmwTDreiQLyb02rsDvME4zMPZpf0YP2VvMzeVUV7IVFUNA>
    <xmx:26euZa4WFGX3XyR8RkqsFp0in4U9xVWvocZdl7n9Fa9JhZqy5MpRSw>
    <xmx:26euZWiYPGMpQEu8eKXceXYl08Z7CIZ-PhlpJsIuemLhvI3tf7XNvw>
    <xmx:3KeuZfgyzQhFypDqA36Q39bG06He4DNXQAq0P-PA2Q-NU8SqyQ7_Cw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jan 2024 12:37:31 -0500 (EST)
Date: Mon, 22 Jan 2024 11:37:30 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] classes/recipes: Switch to use inherit_defer
Message-ID: <Za6n2ngWvxDzE99O@heinlein.vulture-banana.ts.net>
References: <20240103145902.2124110-1-richard.purdie@linuxfoundation.org>
 <20240103145902.2124110-4-richard.purdie@linuxfoundation.org>
 <Za6TGMUsZp19KFrB@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qEjuwBmy5pLOIfHn"
Content-Disposition: inline
In-Reply-To: <Za6TGMUsZp19KFrB@heinlein.vulture-banana.ts.net>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 17:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194189


--qEjuwBmy5pLOIfHn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 10:08:56AM -0600, Patrick Williams wrote:
> On Wed, Jan 03, 2024 at 02:59:02PM +0000, Richard Purdie wrote:
> >  meta/recipes-core/libxml/libxml2_2.11.5.bb                   | 2 +-
>=20
> I'm seeing some issues after this commit with libxml and Python
> PATH, etc. variables.  I opened a bugzilla but maybe I should have
> reported it to this mailing list first.
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15361

I added some more data to the bugzilla but it seems like the expand
calls in bitbake's BBHandler.py inherit function are ending up with the
wrong class-target instead of class-native, even though this is being
compiled as `libxml2-native`, and we happen to have a `class-target`
override that removes python from the PACKAGECONFIG.

--=20
Patrick Williams

--qEjuwBmy5pLOIfHn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmWup9gACgkQqwNHzC0A
wRkPrA//QT6W8E93Go0sWLEETcjZHebpUl4pQRyLNncbYsUf25vkCEleGmEMX3Ov
F+rYLpxZfIyRSuxiCqhlC07HTZB1fTsLFq7nnHaiIOllHyHxDIzUsYdplPdPbAIG
hT3EEwNepWWKwsmbBqy8ZM3oY1ddi4bEqMU2q3kL9DDLveYH7myUuc0jpWO9NLua
D7x13t/V70WKc0RHEkpXgJrcjcVPm2K+fRRppXllJilRebc4D6OAoQdWiqfA2o0K
S1AHW0mWB8nyyz3bodP62mIMSWkqg/N0d8ypY79rP4e7V1bJY7vZjFItjCEqQ6l3
cZD7S4CT8Pv/51bD6YbyLTG7B7W1FVRUnN5UwgUC+sirEoUm6zQelDxNTsFGt8zD
BbTva7rus8zA5ijt/nCIiQgBFGI3NuZC1064SoWE5YjokNXiQ3s79O0+dGk9LILn
I8vJNCQBG4RnFaTJ+65VYBD9rnrheIgkV8tjs0jJ2YDgcO0lUqzn3b20Ubz9Si8s
iD+vRIgjQwGk7Mm+9d3UWSSV55uNsrl8aa1N3rEcjcgUbSRMbJSFYXpnaEV0i1wa
vilGGLcvrfHxSFVlRGimmxQmSH6Qyq8LqImTJpKPAMEfAfdugrOSfKUSEG41QLYA
vp8Zl9jMcYQog83G9kC6xFstKS/YH5lpRxoNAozTPRsrBTlsVpM=
=tTVA
-----END PGP SIGNATURE-----

--qEjuwBmy5pLOIfHn--

