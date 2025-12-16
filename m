Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B9AD5CCA0
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:47:54 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18636.1765878462623998581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:47:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=nPTsUyI7;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=OnWMrl2K;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id BBC44EC00D3
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 04:47:41 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-03.internal (MEProxy); Tue, 16 Dec 2025 04:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1765878461; x=1765964861; bh=FmTj6c55EY
	RTWxcr5kqy7z0lkjYkNzApNUz08kgg8NY=; b=nPTsUyI7w2Q3/7kI/Imn7Yd13P
	/mR1DVbpKJ7CKTyiBmbQrwZ8fS3ysBfUMIw6nRM/yk5w9IPDSvuBUfGQmqGRF77r
	udZbPxCkGqzunIOOe3zolczK2mrOZ0NJx46uP9KxcsBiZQUFQCEsP6Ajc2B7yDy7
	HAhRWXVJ/dF7oXDHHRi548IWEepjrNYiTUIs8LhEfWemUlN9TDF22D+HdxyX7lxU
	/US7LTa/ZtqEfyZ2ydmq0YB3Fll4ivYyDkPdKskez11DR26YFpxmPpVu9/YNzuPS
	YAwphXRkrBreb7qEgFHrpAzEyHoOZ9UAvJD9RorLScdLRCD/DDSCJUCd/X7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765878461; x=1765964861; bh=FmTj6c55EYRTWxcr5kqy7z0lkjYkNzApNUz
	08kgg8NY=; b=OnWMrl2KrQo17ifUfvoABmPeRpWrB0aU0t+u1ldJpBLroYG1R7X
	WMGwH+q2hZR/tGMGiKH7yLjTdJQvUGS1cfomuBHvThPLpbSQr9flaXatTLtdZtvG
	2ycmKymm37v+VWmjRwydxIo5YRekQXzpAlfC9gP5HrvIwDCujwPJG8hpe/6sVdH6
	+vhPp90HWNs2oMipTrfPWccUftekkz1L6/dKt/4J1IEtyHl4D+qCMI5E1mo9b43R
	kr2SReKX/TQhmt2/QwcxNpJmVMobLYvF2kqveonHR8PrIPhSMKO9ajb54KmIUVH6
	0sHYlguPhKbvYJW2nWF7dZrKn6KyhgatJpA==
X-ME-Sender: <xms:vSpBaSDRTI3W-EhM3LN8xrExAtg3GS9FjxPmDdofdOQ74JhzDfD9hw>
    <xme:vSpBaTfft12RwXGQKYnW19sAw2dUGEn9RaALX-0EG8jHvVDuSktdMTcs7s4sVe0vQ
    42aq4-PnVRGL6S21vRlhcCs5lcPveDsKrFWOoOhuNVd88qANnkD2b8>
X-ME-Received: <xmr:vSpBabPfqw6Z28-9IIXS8nKqprSrj1PtSjUFxxu5l8XXWbPzbS3yPO80juz-cM0N8CBnDDUqwoGxRmXVL-ciCBKTOoVnlyf_edQsJu3saig4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefleefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepkffuhffvffgjfhgtfgggsehgtderredtre
    ejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdgu
    vghvqeenucggtffrrghtthgvrhhnpedtueeuieetveetfeehudeiudefvdejhfehieekge
    etgeevffeftefhleduiedtffenucffohhmrghinhepohhpvghnvghmsggvugguvggurdho
    rhhgpdhirghnrgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohep
    uddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqd
    gtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:vSpBaV6SooXArjrQJq8eY2YqVAUpyxRkwrVSZmlayw5Q0hHx3h2SOA>
    <xmx:vSpBaXK7hQljYBHzpORtac0Qerv5YD8bjjkI-mdsNnPOFlBJldiv3w>
    <xmx:vSpBaXcoHJ_906ljsT7xwrTSi-kUiLhdDlKMWSBlZD7oCGpJYICOpw>
    <xmx:vSpBaScuC5pcK5nZaKdDkesSecFc8uJN4TaZjMWcw-LKzsPBOnjq6Q>
    <xmx:vSpBaVS_h8mO_icIURw6_I7n1wRs00ZrR8ubbav81-_eTNcQk9EogEY_>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Tue,
 16 Dec 2025 04:47:40 -0500 (EST)
Message-ID: <9c8370ba30fd2bc4699d4835a9e47f94b6115f9e.camel@pbarker.dev>
Subject: Re: [OE-core] [AUH] tzdata,tzcode-native: upgrading to 2025c,2025c
 FAILED
From: Paul Barker <paul@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Dec 2025 09:47:36 +0000
In-Reply-To: <0101019b262e5ddd-0f5cc002-d1e7-4a34-8ba2-902c989405ec-000000@us-west-2.amazonses.com>
References: 
	<0101019b262e5ddd-0f5cc002-d1e7-4a34-8ba2-902c989405ec-000000@us-west-2.amazonses.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-JVTLEjfz/E/b3ACcYM2o"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 09:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227933


--=-JVTLEjfz/E/b3ACcYM2o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2025-12-16 at 08:02 +0000, Auto Upgrade Helper via
lists.openembedded.org wrote:
> From a1a3cdbe7f870bf34376c1fba0c50526a52b094f Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Mon, 15 Dec 2025 21:19:03 +0000
> Subject: [PATCH] tzdata,tzcode-native: upgrade 2025b -> 2025c,2025b -> 20=
25c
>=20
> ---
>  meta/recipes-extended/timezone/timezone.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-e=
xtended/timezone/timezone.inc
> index 9a5105ffd7..786f7d57ab 100644
> --- a/meta/recipes-extended/timezone/timezone.inc
> +++ b/meta/recipes-extended/timezone/timezone.inc
> @@ -6,7 +6,7 @@ SECTION =3D "base"
>  LICENSE =3D "PD & BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc679c9d6b02bc2757b3eaf8f53c43=
fba"
> =20
> -PV =3D "2025b"
> +PV =3D "2025c"
> =20
>  SRC_URI =3D "http://www.iana.org/time-zones/repository/releases/tzcode${=
PV}.tar.gz;name=3Dtzcode;subdir=3Dtz \
>             http://www.iana.org/time-zones/repository/releases/tzdata${PV=
}.tar.gz;name=3Dtzdata;subdir=3Dtz \
> @@ -16,5 +16,5 @@ S =3D "${UNPACKDIR}/tz"
> =20
>  UPSTREAM_CHECK_URI =3D "http://www.iana.org/time-zones"
> =20
> -SRC_URI[tzcode.sha256sum] =3D "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe8=
7aa565c65cda9948ae135ec"
> +SRC_URI[tzcode.sha256sum] =3D "697ebe6625444aef5080f58e49d03424bbb52e08b=
f483d3ddb5acf10cbd15740"
>  SRC_URI[tzdata.sha256sum] =3D "11810413345fc7805017e27ea9fa4885fd74cd61b=
2911711ad038f5d28d71474"

I'll take this one. Looks like the AUH hasn't updated the second source
checksum.

Best regards,

--=20
Paul Barker


--=-JVTLEjfz/E/b3ACcYM2o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaUEquBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bv2gAP9e/yy6eOiYCaROCPcBNe0WJycKQwi35TEE
xSjiESeVRgD+IOY49bBRlN7KMrSxmKQ6buCVVnvBBS/DwaofJWd/jQs=
=1jMc
-----END PGP SIGNATURE-----

--=-JVTLEjfz/E/b3ACcYM2o--

