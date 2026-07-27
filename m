Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DA9C531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 07:37:44 +0000 (UTC)
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26289.1785137861010596553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 00:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=lyU6Bk4R;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Vx+iP6ev;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 242791D00216;
	Mon, 27 Jul 2026 03:37:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 27 Jul 2026 03:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785137859; x=1785224259; bh=TXsEHCSsUd
	eQsA/cKGub7Gk0Iqi17QoQjLHmMrkt8FE=; b=lyU6Bk4R5DrY9unPm2ob3qNBmE
	dujB5RqZpO+tzAq1eId8aeok9x3AQr3NIhEepIP5Fa1R2RiETjmIRyXtbovaAj3k
	ekfFeQqqiAOcSii9GMlUOkwYTr6n6f92acoSTzPv54A/UU2OmcK21qZ8hb3JQPWZ
	marskuSzYWhLRD7MTx5f4CqbCk/Imq8d69JGin2pMIwnHQU/jhstSkhsxbYeQNiw
	d3js68NbjjfdET2rMaTMfnGUJRAOkjVZf4R9akm0C8CQj2SwZwiQPDSwUa0xT+Vi
	khdI9ZQIn16dpZ/uQrQkXrDnpKUFgVd+KtP6hmsMPXb3a0KYxQoKvRRaHrQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785137859; x=1785224259; bh=TXsEHCSsUdeQsA/cKGub7Gk0Iqi17QoQjLH
	mMrkt8FE=; b=Vx+iP6ev/4AwXYfrzUsortTRM/MmdxlmuQwu7pzpv60DfxQnKpB
	BpzJEnWvBY+RCXBCBn1WB4NzdRktCEV9isS5TjZyZTVzRF0kIUiSvaDfPfe7epfp
	affGF5ZMfpQN/slBCTaV/RagVVYnuL+Jzb/YDtrGjx4hA6Pl/7PHpZUcinJsQESD
	KoxG3wyczTVQYP0qw1f4Q81NCWifWbsIRHQkozhy5ey1BtwuE5+dulU2KdN3VMgE
	NZXD2lRAsGYgE3V9R1E9YFY1QsHalI5f14EZLqvQIks1MNxONhwdSyT88rcrtDyj
	N0qpOOTw+VppZVFGUxKgyGxnlFEffDyEv8g==
X-ME-Sender: <xms:wwpnakdgYKwqMTjP5xTUuhwi-4MdNf4BE3rhqynPcrAoTr-OAuEuyg>
    <xme:wwpnatq_zgB_7zUMOJqsyC19k4x2E8IwlIrz2ubP5fEe12eC1nJVJRAgEquPLkJRo
    fpd6IqAaeK2mTL9Bz9Wj3ONEZ3sTysjJ7eyYQEvN9MMjak7OKcbA8w>
X-ME-Received: <xmr:wwpnai6U2zUKA79a4NohUanPifrg_4lObUd_CvvvsOCglbnPt6HVachcCRgyjgHZ1Tb_WJ78Xf9Xo2dYbsnfEfF_6iyRYcTl7BlCBh4>
X-ME-Proxy-Cause: dmFkZTExobdIXsK1ISAaMnLgZnoD9v9yZKFTHnPIJvqO14gVOsPI8cYbMot08thlm57nWh
    vaJ8HULj99GZSd5a2L+X+wp2D2KITYYJJn2ArYklcQoIRanlS9TJWy0aUCSxLrg+Ws2HMM
    eib6ZEhtzTwkSvyTBZIkgd0eAgWOqojdZDefKSEOmoeHYFfDyRy2FPhJ0DSX2x9bGvFCEk
    d8egkH4qdi06zQm8lsX1T/uEtRLo2Nzom+qcZvD/HQD01p7mBkCZNdL0TDaB0n4faEM6tz
    yEBG46EOKff5Xq2iGrvJmQYLDuTtJcslWctt/H+qP6fJx7PVBb+jwkSjR3aUNoq3ys4+mv
    qWeKSu6PRD87MiXwqIdeUuX0wugCwh4VYQablrt1bPJv8USULiVLLXGo2SwApgJU436sjU
    xz3GpUQg6gxNWLLkmV4AkgzZkUZcKcCjb+kpLuDESdV0V96oCwqV2UgpbSd5FQJg3V0S2W
    iYstPJ8GR+6WItuuxHPjFzs0fSG0i6Y8EnpIlgnUvUSH7sRXDf/M2HdrbsT2WGYyGuLpgk
    QHl15HiCCTJQldua61f84NZcP4b2iP4QXvRlFXzWsWHooVy9OSEhUqFNmQBuFBZ4010j/6
    Q1B29vu0kKPhgf0Sqd1uuD5Eujc8Egp343WUEXPuamRN7jCT/GwlXY4L0w6w
X-ME-Proxy: <xmx:wwpnajrv0ZwJbxmf1xPFH0RaqCCjIfPLEOPaUoWzI52VfprrrbqwRQ>
    <xmx:wwpnakhzKqJRTOdzhwItTa-KNWrcqaoUdA-0JIZ-P8ZyqLzFw4HbDg>
    <xmx:wwpnatJGl_B6ZFcrPRXVBNPUFpuiNb38XbpTk712GFKK4ygpZx0rEQ>
    <xmx:wwpnakDddC2ay_xViEndh3QmviL34f1752S9cmVM51sUEprKk3717A>
    <xmx:wwpnaqc4aIqqEmuf2Ei18WjcGyXoQVHxxk8ZpcNV96CljfbCqtKGREAB>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 03:37:39 -0400 (EDT)
Message-ID: <9640903b8f292ebd83b01c372382134d05bdd27b.camel@pbarker.dev>
Subject: Re: [OE-core][wrynose 13/27] curl: ignore CVE-2026-4873
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, 
 openembedded-core@lists.openembedded.org, Deepak Rathore
 <deeratho@cisco.com>
Date: Mon, 27 Jul 2026 08:37:33 +0100
In-Reply-To: <3f4ccfb2028c1be88a5c82ea9df557150dd9e542.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
	 <3f4ccfb2028c1be88a5c82ea9df557150dd9e542.1784740870.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Xtp0SghkfZ3mBhcWehBs"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 07:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242058


--=-Xtp0SghkfZ3mBhcWehBs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-07-22 at 19:23 +0200, Yoann Congal wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>=20
> - CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated w=
ith
>   clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
>   transfer.
> - In wrynose, these protocols are optional PACKAGECONFIG entries and are =
not
>   enabled by default in curl_8.19.0.bb, so record this CVE as configurati=
on-not-applicable
>   for the default recipe configuration.
>=20
> Reference:
> - https://curl.se/docs/CVE-2026-4873.html
> - https://nvd.nist.gov/vuln/detail/CVE-2026-4873
>=20
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/recipes-support/curl/curl_8.19.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
> index 3326f478b5c..1cda69401bc 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -28,6 +28,7 @@ SRC_URI[sha256sum] =3D "4eb41489790d19e190d7ac7e18e8285=
7cdd68af8f4e66b292ced562d33
>  # Curl has used many names over the years...
>  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
>  CVE_STATUS[CVE-2024-32928] =3D "ignored: CURLOPT_SSL_VERIFYPEER was disa=
bled on google cloud services causing a potential man in the middle attack"
> +CVE_STATUS[CVE-2026-4873] =3D "${@bb.utils.contains_any('PACKAGECONFIG',=
 'imap pop3 smtp', 'unpatched', 'not-applicable-config: clear-text imap/pop=
3/smtp support is not enabled in PACKAGECONFIG', d)}"
> =20
>  inherit autotools pkgconfig binconfig multilib_header ptest

Hi Yoann, Deepak,

Sorry for the late review, could we replace this with a backport of the
actual CVE fix? It looks relatively simple [1].

[1]: https://github.com/curl/curl/commit/507e7be573b0a76fca597b75

The same feedback applies for the scarthgap version of this patch.

Best regards,

--=20
Paul Barker


--=-Xtp0SghkfZ3mBhcWehBs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCamcKvREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsIPAQC4VexLdOF6h/RDoij/hr3JES8Sfuh5DQx4
DOb1vQBD+QEAz8ebs78QK9vwTGLcz+BNC39FU7q9IezaLB19t6Gxtgo=
=SNrm
-----END PGP SIGNATURE-----

--=-Xtp0SghkfZ3mBhcWehBs--

