Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC97C44523
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 12:38:21 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10544.1768999091817952952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 04:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=p2DJIEA+;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=dFM9st5u;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id B626BEC00AB;
	Wed, 21 Jan 2026 07:38:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 21 Jan 2026 07:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768999090; x=1769085490; bh=ueFppaxhJb
	MVtSANYZfSLEpxGCtjYjdBfc+Ep5f4vk4=; b=p2DJIEA+guTfAZlbZfmPjDvrMB
	sY//TQUygGt0IckUmmfcqSMCPXmuudvIhsPF2maSv+2xI0S+yg7Fvk57Xc0++Wun
	5N3XERCOTcL7Atow4ZN7MEPwJccQPhhQGZy9R6PtMKRBmyA+IJ35DeYnccW99ocj
	EFdB796udQ75qOgTHoc2mq/DiVtuJ7ujipM58P9kL7cV9fvpjKZqUCRUuTr1TKW4
	bKlaa7FgbhdMTOUUqiBEeWY8zyeMke6wmhy5yPIlc/g72unLWY6UCWzgex51Wxyv
	MCwuqF2hb/cmYye3qSmLwOYWIJ6Fhe94CHY2i7nODWTIPytwpg/UA54fYOTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768999090; x=1769085490; bh=ueFppaxhJbMVtSANYZfSLEpxGCtjYjdBfc+
	Ep5f4vk4=; b=dFM9st5uJm4dey3Xkp6sh2Szu7JDpu5Abq4LEBDU3o/HKQBfn++
	OXyEfv5DCmE1LKsdwiFYwXF4MPsmVzCHVmKkh/JS2Th1nNdlOfR4fjDXKBZry3Ck
	dNW70QBzN43QVahhByX/HbgQu8miEzWSp8L3nroCUMu/yFjD7uVU6EV1A5lnMiHg
	3Q77TzpyO/1RYnE1E1yXTmqLjqngg3B0HsfXAqYIQ6FEoy3mf86ouvRSj5PD6m+h
	ihBrLLNeUZHZegbqSxKRLdB52yTA1/znM22oyK/9a4qraHZMI+Utx7p5blmeoXUH
	HhtZwc1HHBQ6tcabtUT1zY9V6M5Tv7VTF8Q==
X-ME-Sender: <xms:schwaYBkX4aBd2Bo_cWR0K238KGx1BPhQ9RvwRZZKzflOzDDuKzDEg>
    <xme:schwaR_CukJyGlxuhc316BN_NwKCsPbnYotEBPWu-vOGdu36nT5cKd5gqRla09XVb
    2bNoy0oKfjGAFeCjJWTiT4admIEwUXEYsyq6QAaSkF0TTwakuO6Yw>
X-ME-Received: <xmr:schwaY-J_j7jqE2YLD-hbHcNVmaZZ7shWaKzvhzznf-kCJv6AqmMe1BkCHgW_J6mU5M0ngMg6aDKFf1iyEonLaOTkgGPY7gZiSIGAIc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeffedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    ephfekhfeugfelfeeludellefhkeetvdffiedttdeuueekhfeiudeivdefueehuddtnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggv
    vhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephi
    horghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehophgvnhgvmhgs
    vgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprh
    gtphhtthhopehpvghtvghrrdhmrghrkhhosehsihgvmhgvnhhsrdgtohhm
X-ME-Proxy: <xmx:schwaYePlTz7rQO-kVLarEpzXbMhSmnZLcf-45j-4l_rEmevaVthCw>
    <xmx:schwaRHidvebLaVLLXBqqRNJ-mdndM6rutTFg5VHQ2lLjri1iCX8Eg>
    <xmx:schwaWcI91y0RiUs90ZzQNNMoSJRq67CWH_8mFXFkP0C4vCELP6s5g>
    <xmx:schwabEnggXJ755ZYBMABA8xHw5Tla2q2cyHHidNj7wte7_tKZEOLA>
    <xmx:sshwacFXKcQSCPXu0eRbZQgF-8iETeFzg8kmWe1IaFmyZm7KkOAh89rk>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 07:38:08 -0500 (EST)
Message-ID: <4cb6999862b53c7d0d3e1ab28b9770abe7156b5e.camel@pbarker.dev>
Subject: Re: [OE-core][whinlatter 03/15] libpng: upgrade 1.6.52 -> 1.6.53
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Date: Wed, 21 Jan 2026 12:38:00 +0000
In-Reply-To: <c689e7db6f4a01e0c81765e112371f64c4bf8221.1768906687.git.yoann.congal@smile.fr>
References: <cover.1768906687.git.yoann.congal@smile.fr>
	 <c689e7db6f4a01e0c81765e112371f64c4bf8221.1768906687.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7PpnkDnCJNFY2l4/6P8T"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 12:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229808


--=-7PpnkDnCJNFY2l4/6P8T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-01-20 at 12:23 +0100, Yoann Congal via
lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

Is this is a cherry-pick of fa33deb30783 from master?

If so, the commit message should point at the cherry-picked commit.
`git cherry-pick -xs` usually does the right thing.

Best regards,

--=20
Paul Barker



--=-7PpnkDnCJNFY2l4/6P8T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaXDIqBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgAtAQCxkrOCkywPZVPs9UL89NVXG0A76+VUXRsL
tEjqvdzITgD+J8IR+enIOFgRjK978BuoyqqEAfrWe3vVqvMA5AbCyws=
=7u4C
-----END PGP SIGNATURE-----

--=-7PpnkDnCJNFY2l4/6P8T--

