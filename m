Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7589E81BAB
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 12:16:38 +0000 (UTC)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46063.1770639393539676501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 04:16:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Bhyd9+ta;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=pBK+RuE9;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 9594CEC051F;
	Mon,  9 Feb 2026 07:16:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 09 Feb 2026 07:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1770639392; x=1770725792; bh=83f5KJ0kRE
	pTMukNfmq1wvkNP/ErACjEuh67UFBnxgA=; b=Bhyd9+taK6WWb92cykngf7CcKI
	R2+3mvlchJ7g56ajfaYyB/sKDhfWBzlj+OAVP3nXhsfRaDB+rkk7Ex9X6Cv1T+eR
	gulEgCLmZE0Z0qmwqMdUIVJlB5ry+hV1dOvuHHxDcc1zsYv1CztJjLDhMzAgBz+e
	A0zAIBrr7GSS3P9qXy9OmNQQL7jlwlN5aUPh58ganCQXGKWBlb5xOpJmYLfdYwpo
	6sKD2FmZWAZbMgiFBrGsJ5BgCdu/yojsHDqYlo/FtP//1WpJNe9/NfnRgAFp2REa
	Kqhps+FqAON65gxYsK7LeDNu9pbSIwox7C+lMF9cN63PZQPh9eBqb9XMnOFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770639392; x=1770725792; bh=83f5KJ0kREpTMukNfmq1wvkNP/ErACjEuh6
	7UFBnxgA=; b=pBK+RuE9yrFYEmTd50HZ8Hw0m14mEVi5NXo9TmeoAfhAYuu0Zpp
	Nw9ARLoUVZVr4c2RfpL6L5/ho0eTrW5ObCT+u8/q+X87/XD0IuP44/9HqDRU/VVX
	L2i64NtK8AmpQExM/8iE4B5SC7fLeL+q9jvFd6+t06MrVdvmpjvXCoKivuCf7/21
	UAr9lCMaWhLpPNfBNqW6yH17AQcEN1qWUH/rnMv0ENBQhR2VbThSQw9/+sg8Wcs/
	xEaU4UbWtDJRUW4VPX4QkQfSfPfbQbwHR/+LSELaaC6haAInKIDmSPs36urrM2cx
	YcQNYb05ClWQKJU8MMs24p+8hpF1aMN1h7w==
X-ME-Sender: <xms:INCJaUQC4GDJb0ulgWFSxv8mQJOn8jLQaBqNUWZg0GmwCWhowbRVKA>
    <xme:INCJaZMG7EERaljloKhVSBvID51UCyZmBIOCrZfvlB__aAqJXqd-PGvdSKo4plN86
    ULczQomJe8JXr558AGb02EjUm-Q4iTVY4egotsm7qLIIiZF9hn7DnNB>
X-ME-Received: <xmr:INCJafPmaN2Kr_K0bLawGaCSdPnkcaUZaDav6gzF7b5D8qHxRs0dMLBePO12vyjGkTl-XxTb3DWxs8ZN3Qmk6ctTRCsoEgHF5tTYVVFHRx6u>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleeijeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epfeffvdefgeevkeduhfetueehhfeikedvieeufeevieffueektdeluddtgfegveehnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlse
    hpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehprhgrthhikhdrfhgrrhhkrghsvgesvghsthdrthgvtghhpdhrtg
    hpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghm
    sggvugguvggurdhorhhgpdhrtghpthhtohepphhrrghtihhkrdhfrghrkhgrshgvsegvrh
    hitghsshhonhdrtghomh
X-ME-Proxy: <xmx:INCJaRsr9w-cXxCbFy-jqypO4Mbqyq8dBPPyeRob0K2hkA8YHPEu_g>
    <xmx:INCJaRUYPW6ZOiLjhIbGEjt32C36MOOActjFeN5sbxxR6s7_e8p18Q>
    <xmx:INCJaRugk0dIogZ8Mr8izNYvSCEnxAjDGKk3k4vKvOvBlhRh_2AuIw>
    <xmx:INCJaVV3aozKo909tA9gZ0kixz-rI2EBS80Ey-_5cBBZqt-35EuOxg>
    <xmx:INCJaX3lZLWvXxSwe5fkbZ8YCGHH-0dWjkDruRaMkCVOOsXyQ4qgTeU9>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Feb 2026 07:16:31 -0500 (EST)
Message-ID: <6511a89ca1a6c70717125a3e4a0a1861228bd401.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v1] libevent: merge duplicate inherit statements
From: Paul Barker <paul@pbarker.dev>
To: Pratik Farkase <pratik.farkase@est.tech>, 
	openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Date: Mon, 09 Feb 2026 12:16:26 +0000
In-Reply-To: <20260209120848.34882-1-pratik.farkase@est.tech>
References: <20260209120848.34882-1-pratik.farkase@est.tech>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-e3/BwrmeimYMY6SoGm7d"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 12:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230784


--=-e3/BwrmeimYMY6SoGm7d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-09 at 13:08 +0100, Pratik Farkase wrote:
> Merge the separate inherit statements into a single one for
> improved readability and consistency with OE style.
>=20
> No functional change intended.
>=20
> Change-Id: I12615c2ba986d5802eac02d768fcfa5dfa1ace5d
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>

Hi Pratik,

Thanks for your patch. Please drop internal Change-Id headers before
submitting patches upstream in future.

Other than that, this looks good to me.

Best regards,

--=20
Paul Barker


--=-e3/BwrmeimYMY6SoGm7d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIYEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaYnQGhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0buuuAQD25u1lhWuwnakm6jyF7IyToSjcD/VBMKCe
6m6aa1e+XQD40QohNb+LY/McUsnPuksYnFgZbx+PQXw2DPpAMAnOAw==
=fNRx
-----END PGP SIGNATURE-----

--=-e3/BwrmeimYMY6SoGm7d--

