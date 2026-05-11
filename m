Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66F0CD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:35:19 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46949.1778495716940861382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 03:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=mFh7U66P;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=FR5rZdRn;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1739A7A00BF;
	Mon, 11 May 2026 06:35:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 11 May 2026 06:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778495715; x=1778582115; bh=9yn2BhhHc+
	cLtskWT8x+5rl4eEgxy+9NoPwOJ0ge9DI=; b=mFh7U66PQnof84th6mvNRQDHqR
	i17fYLZdZ4rtGTYDb3oPc6m2S8L5hV0sDyxorlxLc14SnFhI45LMk1ZoeaGkjCjx
	VQmDQLrDwbUldAEOF6m/dVM6HpYPPT57ejQCt9c7bPAtzDdqAxpCQhNJySG+Ngw6
	dx2qCwof4Yi2tRR40VX6tYiLjKKhpjWqPfK7UgDJIbALN2jswQuP6mUKOEdnuGZJ
	+LWwbe8GP00sPvzYybtuy6Saa50dOmKauDLCdpHqGurAhEgQppq+NHABlQq9NnCE
	KeOmHQY60+SrjcoM/k3be4JT1aodahrhtLBAXVqETfQvpnQEetXE3iEqUQaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778495715; x=1778582115; bh=9yn2BhhHc+cLtskWT8x+5rl4eEgxy+9NoPw
	OJ0ge9DI=; b=FR5rZdRnipVug0j/+Ow2pD2Tk6SE1cVWGwVPF0KtTpfz/dfk3P0
	pZc2sQSmh8rRu41nwJVzVN+zGoIWwb40ZdmpCYs0DS1bLPmQpIVg4OFSiv29pVFi
	0f2mqg/fmA9ehnoRr3MuQj1uc7EL61F3lN0UtjRLZrTpZ2Cg+CttnpMWMOaE6P0c
	I6RnO9eqbGM5HcerFQN6XdnZKhmnlWjjdwMKdzWVgHpxDbMqTKAXG7YnMPNZfUI7
	paR9o0oTxTkm+Rgpn5Lz11jBxs7VPZlKi6OINo1UONUtuczjuARYmgUa27+IyXsP
	A8ZwOVeBDw2/7k0K674MbwW/vVYbP3ir+vA==
X-ME-Sender: <xms:47ABataxT3WaG_rySS9RpYBfMclEx_416Fm2ySW0-f-ypxuDGgJAcw>
    <xme:47ABal4mnpe8XO6pD_B2j0pPmcAA2j29aEIDb0G6ioPvlrvyTX1yhaXRDoF0t15n1
    2ShFSPXkgD5Xt3KEXPBKk5IeMPYdtTHZ9NGU3yUtvwVMnNhEZBaSvzb>
X-ME-Received: <xmr:47ABagCHjLx1NV59eFYURpg9QyEga4A4cJrEx4hN1cBUSF30QIJX98wv9-_2VU-AEK4v3kuuYZ5HwfUqQgj9joLf9Lt_mnO3PZF12-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudekjedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeffvdefgeevkeduhfetueehhfeikedvieeufeevieffueektdeluddtgfegveehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlse
    hpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehjvghrvghmhidrrhhoshgvnhesshhmihhlvgdrfhhrpdhrtghpth
    htoheprghlvgigrdhkrghnrghvihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhi
    nhgtvgesuhhnuggvrhhvihgvfidrthgvtghhpdhrtghpthhtohepohhpvghnvghmsggvug
    guvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghp
    thhtohepohhpvghnvghmsggvugguvgguqdgrrhgthhhithgvtghtuhhrvgeslhhishhtsh
    drohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:47ABarfUGwHZD5dV8QhVFAfn95Arhg6XmGZprk1SrZQQGCN04NHLjQ>
    <xmx:47ABavJD45oIH1iv6hMP08qb4TvcjI1_lV2JyJOmheOyJx0SEj9_EQ>
    <xmx:47ABam2bWJgvrxScWdo6KqPnR6kEb4ncVFdchGrpNzowJuvag7mkvQ>
    <xmx:47ABahh2nZA8LmWqLx07wegTIW5eDGoix2yLq7Jezq-h_rC4WpE-bg>
    <xmx:47ABaibJT7yzbyNUbJFVD7rgh-3_buf_8cXgcic85r-NdrDH_mMYOUNP>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 May 2026 06:35:14 -0400 (EDT)
Message-ID: <fbcfa1f857c748933980240845b24df104ce8c31.camel@pbarker.dev>
Subject: Re: [DLP-CV-Audit] Re: [OE-core] [Openembedded-architecture] What
 to do with vim in openembedded-core?
From: Paul Barker <paul@pbarker.dev>
To: =?ISO-8859-1?Q?J=E9r=E9my?= Rosen <jeremy.rosen@smile.fr>, 
	alex.kanavin@gmail.com, vince@underview.tech
Cc: openembedded-core@lists.openembedded.org, 
	openembedded-architecture@lists.openembedded.org
Date: Mon, 11 May 2026 11:35:10 +0100
In-Reply-To: <DIFQ129WWK14.2573UHH9YBRUK@smile.fr>
References: <5622df201a632dfc83c5193f029745b3ebd97e44.camel@pbarker.dev>
	 <CANx9H-AbMu_n-0ww2UsV117jT20wjWP_i-HiMq4DHAh4NdYN9Q@mail.gmail.com>
	 <CAPQx_gNgsrsQJuxvnRi2LrM2K2hitm5Epnv55X1=PVLerZJozg@mail.gmail.com>
	 <CANNYZj_raMY7tQ-L5Jk=Ct_PAZw6KagDQGbR1zF3jzF=4-h9Bw@mail.gmail.com>
	 <DIFQ129WWK14.2573UHH9YBRUK@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-jMkTl37uW7YpmwkrV9iF"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 10:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236804


--=-jMkTl37uW7YpmwkrV9iF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-05-11 at 10:57 +0200, J=C3=A9r=C3=A9my Rosen wrote:
> Maybe package an alternative to vim that provides vim and is more
> friendly wrt version-releasing ?
>=20
> I have heard good things of nvim, though I don't use it myself...

I use neovim as my main editor, I've also briefly looked at writing a
recipe for it. Unfortunately it has a bunch more dependencies, some of
which were non-trivial to write a good recipe for. So I don't think
neovim is a good option for an editor in OE-core right now.

Best regards,

--=20
Paul Barker


--=-jMkTl37uW7YpmwkrV9iF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagGw3hEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0blDeAP0QJEqCnlNk+s+jT0xrpKBYI7HAwcIT7XMB
O5rr4vf7EwD/RbL0pHIgy1WBaZ7JihUp7iVv4phV0hGjlHBXR5+zWwc=
=e4X0
-----END PGP SIGNATURE-----

--=-jMkTl37uW7YpmwkrV9iF--

