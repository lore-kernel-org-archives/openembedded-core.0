Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1ACFC43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 12:54:02 +0000 (UTC)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9057.1784033632784467400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 05:53:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=njAau4EN;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=MfZz6q1M;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B1EC1140012A;
	Tue, 14 Jul 2026 08:53:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 14 Jul 2026 08:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1784033631; x=1784120031; bh=4MMNCpZ7Ms
	nLgwq02g00dvDarAWB2ev00vJaYGSkJKA=; b=njAau4ENWRox+eklFAkNCQ1/u4
	P4tF9/RNv4QrJvXgegsyhkuqBbzwNtqw5Se7ywpLdmbSeDd68NTexeNV5vqHOyOp
	xu+9xk7OywqHNKwucNuWhtvvhHDP3VTwL48Ob6BJ4aUSGzgrpvPHVYzT9cwZg0lI
	2A2/q9FH9AxU1MkalSqpbSvLkGpIOtJ9brEK/vuFUtxoGqIxEpeZ37LpRE4xGzer
	as0qENuoe4KMvJXfoNqLNV/6Xxba+Y3b9gQYpEssLw5qU2un2ruUxFFvrSKxvz+s
	JTInvrjoePlnbYIoA3hSrir+X/FM+1sMou3RWfxppLNROuE9kpb4fx96ae4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784033631; x=1784120031; bh=4MMNCpZ7MsnLgwq02g00dvDarAWB2ev00vJ
	aYGSkJKA=; b=MfZz6q1MCY0RGDWHX5apJ99QMy7w+MBYyXWiBU43xgEunY711Tl
	eBihs/jNuAMMS4hF11QAkf6QZ67pq9BxeDUKxOdFwat81RXqzLzCTrVa5zQi9HgR
	0m8QllLyCaEsVNlxdsZu9H3jaJzfXIj1nepJ0+i+b5rhflZq7t2wgUDCUUf8TInG
	2SWgf8q65brM2WSfJNVjp72ymPUJgGQTN7rFWdOf2Tg6cAPnpuvI/zGYvNUodW6M
	KTJSuHBmp5t4PS9MEzq23sQOTTtIRduWhozppJuhTc7j7jvNw3PHy+oP6aqo2t1o
	ifV3K/i3+FovHTkUwTrgdzD+MQS6nEWvifA==
X-ME-Sender: <xms:XzFWalXQuOXOP74L6kJb0g67_CByYCfz8kaTiE-nA4JnZJxL8aLHLA>
    <xme:XzFWatAJC1H9Ma7QbQLNq_MoqFKIBqN-YNZumDWxkMOSjnnya5ThBkzkWtlMpPos1
    VYguiaYN_utY9HhM5gDoj5GFPNWvH7vrx1SAELvaSUr3rp5kpFjIg>
X-ME-Received: <xmr:XzFWauwVwgwdaY5R8jPoiaHDj70TCIkY9SRXjCguGJzyutFSPF522HGNBDq9OyRUJ6LtTf4Noi83jzAKtYsMXqllbRYnYoWuhEf7Kac>
X-ME-Proxy-Cause: dmFkZTFuCYgJR2AFKaOdB8OMj/uUCt5qsIlmWUtEh9VUODCAa3rVVc9iDY5H4RKFR8aM5F
    1xAqiS8uK2M8FT9j5AEJw2YAewV7eFKLDvqrl2CNndH2/9XNIazAVJmtlOIelmt+fe11XE
    oD93tyBWmYEIcPwLv5zGG1hw0n4A/kagGj8lL2Off6NAiAKRzd4eWRyt2VLlJphPQvopTg
    GbnzCsfyA3DAYG8knuvuz3tg8pA+RRLnd/O4miMAG2OOQMkDlBsOSQXjyfDoxMiwPzXYHE
    SQeVjGOZUP1hnQjrzkafoyukSs+NrWa7OtsqRYoTH+H3jBWzGz5TPquMl8l3BZiesLR1SY
    SgUMz1dCjLsUjLoa+tMC2o0wG8Xb22GtSgSHPJvuQLtx+TwhuNp3lNxQmfs+YclLJI6Bb9
    ZOJxifltHjTEiy4/ZC2aB3kYBQQcMM1mSlvUDuuPA0YzuiExd/FAKO7BlHPePAujl6/g26
    xrA5/2mv2+V/nNtReEYFiK55LqiQCCb5wFc0F1xQacluzeorznr0X8znFxNh+zY9DyEOuv
    NIPEX+Wvf8wVsldb7Vzelbm07KWTvDeyta0SahgADAhu+D0jbfBlt/IeAU37P6L8kRjaUK
    5sjUBatbBD+FehbfTgFe6tVMUfffxYh8hMGchncbkJ4f8CtFoYCrXIMSVYhA
X-ME-Proxy: <xmx:XzFWaiDhr5So8likqrYzRjK7tgCd6jsJmHstTADaq1kaRU0jT__WMA>
    <xmx:XzFWajYWBwfsZd7IL8knJYncS0yrLE2KLvtor8lIMyIqXxUXFcCyUQ>
    <xmx:XzFWaih6UrTH5MiBT033i7axFStxsVv-hu6h3Q5f0KP8rGMpXJ7l9Q>
    <xmx:XzFWat78kJu8Tj-vCixPapRFQLDJumbp6QnKW4OJtjHsRrRnjzrvYQ>
    <xmx:XzFWahxcYYPTAl5EVdUTHd3iyesPyOeq9P9x5RRfW8S2G5ZK5t_FITTF>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 08:53:50 -0400 (EDT)
Message-ID: <d9b4dfb530a0898fd230ad6da09ee7bf90dd063a.camel@pbarker.dev>
Subject: Re: [scarthgap][PATCH] binutils: Add CVE-2025-69646 to "CVE:" tag
From: Paul Barker <paul@pbarker.dev>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Tue, 14 Jul 2026 13:53:45 +0100
In-Reply-To: <20260706090659.2543025-1-Harish.Sadineni@windriver.com>
References: <20260706090659.2543025-1-Harish.Sadineni@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fiSuCCZJ0hQ87a1Nt5Ei"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:54:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240884


--=-fiSuCCZJ0hQ87a1Nt5Ei
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-07-06 at 02:06 -0700, Harish.Sadineni@windriver.com wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> CVE-2025-69648 was marked as a duplicate of CVE-2025-69646. The
> existing patch already fixes the issue associated with both CVEs.

Hi Harish,

Where was this marked as a duplicate? We need a link to some evidence of
this, or at least a more thorough explanation.

Best regards,

--=20
Paul Barker


--=-fiSuCCZJ0hQ87a1Nt5Ei
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCalYxWREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsNrAQDM6H5GAcjgqL9KivvSKpiC1rU/YZ/58Umd
A0l1PoNUAQEA4YE/qsfTxSNSfQO0w3waN+8S1sdE4NwgVJOEBC0WAwE=
=O7i9
-----END PGP SIGNATURE-----

--=-fiSuCCZJ0hQ87a1Nt5Ei--

