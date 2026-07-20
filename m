Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF2DC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:14:52 +0000 (UTC)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5373.1784574886933236466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=BnOAbgE7;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=QZwSphKO;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.146, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E30AFEC007B;
	Mon, 20 Jul 2026 15:14:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 20 Jul 2026 15:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784574885; x=1784661285; bh=lpVaQAldvN
	QbMzTC1ATEhAXbI82qlV9Bvq0J1Ai7PPM=; b=BnOAbgE7Mfe5TTO7i23muxe9DC
	lU3CrUJNP7bfhqv2sS2FrNpccGREoOkykZfuHlNM7+b0VkgNFFBHVj5gZHvw2Bco
	yqW7nr0y71KNwaz2JxKXmZezwOUdzyfhvc5X62sM5lBXOODcSMx4chdGTRzMfMM6
	y0LIqkzNMm/Vo67P3uPHt7diVjgR9HfZ7DGwERnIhKgyeqxp/lRp3y+HAeyZZRJK
	L/KBFFGrkOjUcw/BNRcyYu8+ajR/PuTvqoD0apqPoK+uhhFPgcT00Qhdc7cxQ+Pl
	6R/6jqhzwfZxpRum7gwARs17lCunrFnI7x4k3QHgzIIq9Q083YrASQq88vUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784574885; x=1784661285; bh=lpVaQAldvNQbMzTC1ATEhAXbI82qlV9Bvq0
	J1Ai7PPM=; b=QZwSphKOE9ybE8yDgibJerGkxNfOiHxKKGncZ19bwdnG9yZnhLs
	IPzXPF1Yl6Rnz6FQNJ1mcQpFdySMwuTf7722qrPiuYU+TJhQhwe0qB+ZiDJD/i2Z
	187Cn1corNybr0VslEytiXwXohYpyreURhw5RUQznA6zUrufwlb/vD3E5vz5KW2p
	dDRegkTSuJWhdptkd1j+qClu7tzl9ZOO7RVRQps5v46C60B0cEgmYjZq7jb8zd0X
	x7Ezurm16zfE19i0p7QeAcEr15VTc1wGAzY5EAa/anasdisYsb2TyhI+97tW05f4
	INsolN7RGwKuvWScrXjk2hHK1Ckgl/TAwqA==
X-ME-Sender: <xms:pXNeamz-jBsHSkJY2xTFmUKZR_Sgc2OKPSmTmpr7RZ8DJHn--hn7fA>
    <xme:pXNeaptT_0wEWScKbDw-otoMfhhvb5v0RI2ZPiW3INh6H8IYq8ELuNQK6Lq6n9TbP
    pLmrYkXKSZVFD1-7d9UwTWv0Zh5420daSDMw6f6UMJ8F4jnmNKpUMI>
X-ME-Received: <xmr:pXNealvjNd-Sw1eI73Nezj8OUCEcVnvorcEhRJDq2SOAtA0dpRjFk5pycybwn1fa_41P-TFWot6Y54LBR-IMpuerjQgvQdFNlvhlqfu63O5M>
X-ME-Proxy-Cause: dmFkZTEsTUhC92nMIihkmDRUH91can5aLYOLPgto0E3/tac49Knj5Fxn+zj2pZX26wxisl
    UWLujQ1xOjx+g4302QuvPi6BWGqR2yHZtB5SZzy3Aarr8wDkgl4OMZo5y8lndYSW4TJUeI
    52qjrXB/pqKjt9EIzB8+isaQNbKeQsKR4FLluUYK0et6EHtGUwqR2qMA8hPRRTgu+VA9iK
    ldE7kgDVZKD3URn9vgCnGyKeS6W9iafEQc7j2e6SMEcAr6qckF4MBwEcoDiqmbHl7ih/hG
    0N8WG5UfGug+G1uUt/98E1+RCQFMGaV83JkDvwARhR3mGv7DN9cbr2hnf9TS5kSkPc0II0
    Bb6HCyCNwep071wq/t2WoSdzVcXcpcHhc/G5n83UGrR7w+yJt41XzAS4IEUBAjoaX0EsAr
    SH27i7GnEDjwn1P3jJgvEnu/ygBW8Do70ZyAgDbndIqSEIv5mcKRBGVEf3npcx4wfOpGfU
    qzowtI1IMRsdgl9C4/EUj7vw/Vcx5ZBzAR4mHjvc8W6aLAXi34bTpF3ADOev64AGXgIQO3
    v1uiRtxJ3/hsApq91s05zsZkhtoje0YhtEyy/euDXZXzGYceq1Y9jmigsC0I7wteIAFaRz
    3PXiumI+G6wBbBMQEz7fbGRONkYEXqHXpRMwYPxRB+59IjyaPm4XP5/Y1Vyw
X-ME-Proxy: <xmx:pXNeamMT5N53HN2qT5DJqCmklqOSU8JZH7V-fD1PQTnBzpIvUPG_4A>
    <xmx:pXNear2uLPRZBxo8wqBNPd4myUJZSBi1C2AxtXHGEPQvgy__vNuRQg>
    <xmx:pXNeaqO10SLy939-5UKPstBnPKIl9E5BDUXlRDXsuGQuJbaDGEyHFA>
    <xmx:pXNeaj3SkXYiq_dIG16N6_fHaS2_uo5J2KDonsPpH5uf0wKDq3sYDg>
    <xmx:pXNeasNmH9tCuZFyLfsXnBJJ2x-5sq5_-XLqPIQP5jfQu6UjsCrur9i3>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jul 2026 15:14:44 -0400 (EDT)
Message-ID: <333e485ec6c7e75b8bdbbd18d85398afb8079828.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 12/33] bzip2: fix 'bzip2 --version >
 /tmp/aaa 2>&1' hang
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Cc: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Date: Mon, 20 Jul 2026 20:14:39 +0100
In-Reply-To: <4e5d0d595f713a4a5cff72f389aa9cac07fe5d14.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
	 <4e5d0d595f713a4a5cff72f389aa9cac07fe5d14.1784567958.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-J+oOwVDuBynxaVKuqZZ8"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 19:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241486


--=-J+oOwVDuBynxaVKuqZZ8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-07-20 at 19:22 +0200, Yoann Congal via
lists.openembedded.org wrote:
> From: Hongxu Jia <hongxu.jia@windriver.com>
>=20
> According to [1]
>=20
> As of the current version 1.0.8, bzip2 --version will print version
> info but it will also continue compressing stdin:
>=20
>   $ ./bzip2 --version
>   bzip2, a block-sorting file compressor.  Version 1.0.8, 13-Jul-2019.
>=20
>      Copyright (C) 1996-2019 by Julian Seward.
>=20
>      This program is free software; [...]
>=20
>   bzip2: I won't write compressed data to a terminal.
>   bzip2: For help, type: `bzip2 --help'.
>=20
> Debian (and its downstreams like Ubuntu) will patch this out [2],
> making the < /dev/null unnecessary, port a part of debian patch
> to fix the issue
>=20
> [1] https://stackoverflow.com/questions/59757176/why-using-dev-null-with-=
a-program-like-bzip2
> [2] https://sources.debian.org/src/bzip2/1.0.8-6/debian/patches/20-legacy=
.patch/
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit ae4fe4263ba9d372f9b9e80df4ec4697b51c1f9b)
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

Hi Jaipaul,

What's the motivation for backporting this now? Applying this to
scarthgap will change the behaviour of bzip2 on a stable branch, so we'd
need a strong reason to do that.

Best regards,

--=20
Paul Barker


--=-J+oOwVDuBynxaVKuqZZ8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCal5znxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0blGGAP9T8ThyW8joNrlYfPF1Jyyre4/j5nXHZxm0
Lnh4IvWEMQEA/2WkyOF7/MJ04MOJH2ofFgUadkWBNn6h2/tf6Cw3Xw0=
=bCHc
-----END PGP SIGNATURE-----

--=-J+oOwVDuBynxaVKuqZZ8--

