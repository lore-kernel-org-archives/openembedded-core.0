Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82512C44525
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 12:50:31 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11048.1768999825974779708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 04:50:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=CN7vNnST;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=JIZQiEkv;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 1F1B4EC00DE;
	Wed, 21 Jan 2026 07:50:25 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 21 Jan 2026 07:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1768999825; x=1769086225; bh=fXHkF6N1q3
	E6G/nJ78OzQ6FBcyD0lUtF7WwcQZlAXgM=; b=CN7vNnSTaf6M8vlwVf9+i/riW2
	Xnm8HuP4g5/SCx9EyWIs5uXiaSP9UoHmyFOJNYQtntoGydEqWCxM6+haJjx2ECIf
	x2dtrCyUtQ2iV83Ct1AuC+2oetTX7fXffno7gLuSfLJstA5AT3XR+gW8i8UgEBfc
	7IW+OWuGZY4zmtHLoTLrUNVvbXI5A/4slfzIIpZX3lmbztkznTPZfRLOv75bfEYb
	2pvl3nsw/+rBrsUcOWCiEpCUZYXXKuy3Z9XWIHNegXJ/VAZhWTluD6Vru8mWvrj1
	ENTQ3BRGWxIywEZrgrkNzzlDfeV4g5F3ms6PzFxOrtUL2RepvB3XrAfGAPmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1768999825; x=1769086225; bh=fXHkF6N1q3E6G/nJ78OzQ6FBcyD0lUtF7Ww
	cQZlAXgM=; b=JIZQiEkvnEjay/44HGQ65+jNizwGZmbpDmeaj2lyAkszL0Fb/PP
	zWyDams18CChn5t0P556gCtFPY1n7RKdUpTIQm7wtKvzVJQNtdF38DMxGIP7kZRV
	hklgo0Q+bNE+4JqDz+BGhw5/wxY4HK++YwwhypZKQfhGGyXWZiah7LHmHgGyXBqo
	0cPojQ/oNHM0HYtE2vbB4UVoDjVELSj4FaVSbpYrBr099s6BPRuHjoPm5aQskxD8
	Jx42si7fwbwie8/416M8Z8S3Iwj39lnzzAgLG9LawwbPXzpwJNIBn9ojsyIaznoo
	Yymj3qitNQi1+eP+mekct3L5wg2pbCrRIrQ==
X-ME-Sender: <xms:kMtwaT_SIVe8Oup_tfwRknIr5uBIzzK62d4Da9rLRyFdy3wI4IAivg>
    <xme:kMtwaXIWMaIyYjV5FcJcpMVPJxxYSpdqhyXbruJzfG5za7_pgDyqpvh5PuFCVY7RI
    YPIzlS4S1XsDR627XKazaJrPimBO5Oq4CpMfgO1h5H68a785x6u2Jc>
X-ME-Received: <xmr:kMtwaeYCp-oIMaQxwYwktkxW0GJX2KomAVsDVqEKCopMmL49YT0w29mV-SeFJ9kz6rPB5idMexyCROIY4cBEa-6kedBeQDVHDTcn1Gs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeffeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepgeefhfdutefhffevheevkeejhfegffegieektd
    efkedttefhuddvffeuieeiteffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepphgvthgvrhdrmhgrrhhkohesshhivghmvghnshdrtg
    homhdprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlhesshhmihhlvgdrfhhrpdhrtghp
    thhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsg
    gvugguvggurdhorhhg
X-ME-Proxy: <xmx:kMtwaZJjif7RyFImqPjd20HhOgoKXs2NIYoHiteYEWo1x71bazrh0A>
    <xmx:kMtwacAM7qDXEeVDcY04gFia3zUvNXeyLctgbMzlqj2WBhUgUKY2Wg>
    <xmx:kMtwaepuYbAvcNpHVTCzZzHD-el1TwCA_1GiYUGZNjeyGzZzcpIAMg>
    <xmx:kMtwaXh_rTxhFtitYyvm1HxIGuaJ54_I_6H_sXlMuHBSotZ5k1tRYw>
    <xmx:kctwaZTciMGKnuw3KNVGfWOF9hcufhAy5VjUtc8pCWIxzkq_XPHpefW2>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 07:50:23 -0500 (EST)
Message-ID: <9e514222713728ce4350e091191b449ac28860ba.camel@pbarker.dev>
Subject: Re: [OE-core][whinlatter 03/15] libpng: upgrade 1.6.52 -> 1.6.53
From: Paul Barker <paul@pbarker.dev>
To: peter.marko@siemens.com, "yoann.congal@smile.fr"
 <yoann.congal@smile.fr>,  "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Jan 2026 12:50:20 +0000
In-Reply-To: <AS1PR10MB5697AAF15115E5E64EA41EC6FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1768906687.git.yoann.congal@smile.fr>
	 <c689e7db6f4a01e0c81765e112371f64c4bf8221.1768906687.git.yoann.congal@smile.fr>
	 <4cb6999862b53c7d0d3e1ab28b9770abe7156b5e.camel@pbarker.dev>
	 <AS1PR10MB5697AAF15115E5E64EA41EC6FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fLuV8mclgOq7FuCptDTG"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 12:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229811


--=-fLuV8mclgOq7FuCptDTG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-01-21 at 12:43 +0000, Peter Marko via
lists.openembedded.org wrote:
>=20
> > -----Original Message-----
> > From: Paul Barker <paul@pbarker.dev>
> > Sent: Wednesday, January 21, 2026 13:38
> > To: yoann.congal@smile.fr; openembedded-core@lists.openembedded.org
> > Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: Re: [OE-core][whinlatter 03/15] libpng: upgrade 1.6.52 -> 1.6.=
53
> >=20
> > On Tue, 2026-01-20 at 12:23 +0100, Yoann Congal via
> > lists.openembedded.org wrote:
> > > From: Alexander Kanavin <alex@linutronix.de>
> > >=20
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.c=
om>
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> >=20
> > Is this is a cherry-pick of fa33deb30783 from master?
> >=20
> > If so, the commit message should point at the cherry-picked commit.
> > `git cherry-pick -xs` usually does the right thing.
>=20
> Yes, it's a cherry-pick of that commit.
> I am very spoiled by cherry-picking in poky which had the reference alrea=
dy prepared.
> With poky gone it's very easy to forget to add the ref "manually".
>=20
> Will you add the reference or should I submit a v2?

Hi Peter,

We're all still adapting to the new way of doing things!

I think the reference can easily be added by Yoann or myself before this
set of patches gets merged to whinlatter.

Best regards,

--=20
Paul Barker


--=-fLuV8mclgOq7FuCptDTG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaXDLjBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bvp2AP9XFglU8wNbqvtDNX2dolp5Ck03n2wB9Mxi
VZLRk2LZcAD8CCjRFkpxao0iQKcISkTkBlcRMqNtq6r+vSZw5jXxawk=
=5s1b
-----END PGP SIGNATURE-----

--=-fLuV8mclgOq7FuCptDTG--

