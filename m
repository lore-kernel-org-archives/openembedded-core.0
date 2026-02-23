Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AADFEC111E
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 18:29:23 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1501.1771871359853179145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 10:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=hAKqBnEp;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=GAdzzCB1;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 278D47A0130;
	Mon, 23 Feb 2026 13:29:19 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 23 Feb 2026 13:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771871358; x=1771957758; bh=2jniGiQ/4v
	cNKe4gUqFvMU1x2wGR0/tSAVopQO0XFcA=; b=hAKqBnEpICTpdaY2T8wRmHO+7A
	te91FY7PRS7EyIkniLC331/by8gsEthnr9bHbYCV3G/G+0tZbU5QN6GOCqNdJ2Bd
	MXtrEirc4sC0R9iqDsj4WbGWAWtWUDtmYELRMw2XjdTZsaVJJm/oYGDdsXNA2rsD
	CES0LGouQMKBiJJu2efwDMIgT7e4Qv4TFCpgj1ONTw2Xs4Uc3iG4CLey4avu5imx
	9X5ns5VdsG/Y1xSNrPqB3c/Hu+RdgCgviMTcCYEgiat9TKcWX880M3yVZauYoEvd
	pw/+fls8g+lEf1sncrlChy8xLXZ5RNAkOi1Ylc55ELnFOZsB4ZU8hrq/X/oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771871358; x=1771957758; bh=2jniGiQ/4vcNKe4gUqFvMU1x2wGR0/tSAVo
	pQO0XFcA=; b=GAdzzCB1YFK3bmQ+IZ0cFrg6itJxSRmn+LugKqeZbbSqAb5dOAE
	M7Z5X0KSLBoHdnN3xJqjvWWg7NaeFid93Ni2zRaLa/3TJ9o2Vz2KoQreHcjv2tds
	6UJtZDsagMYYjx8MsvshGyCt8GLNW+bI9i9N13EOZVeTZJSUGJfT15bvMKjUGROJ
	JgIap+V+bAv2KW0LbOjhkCitxFpOZoFboTnVRnaZbNmTzDUWCNhwM6Vg2ceam/sZ
	qrQqT27S7QRtDTa/kZmyTBb2t5c+0auTDZfad3dsadpSG5UNCRyUlyiP7Ny6GfdV
	gaDc5eayGqwEPVG7NM5I9Bd2IRYn9rVLElA==
X-ME-Sender: <xms:fpycaXhWZPRl-RzlLrUIOHPXhZzObwL8toj2kbYpN9VX7WkRz1gqMw>
    <xme:fpycaaBAnNMUAh-gzpHm-q_HdbDAeZ8J2YoE5KZscGAs3MOPcRDsBUputa6N74ANj
    JgOos74ihDQNlalGleVvmF31cYBZp-Ipxxg8MZjI9c41UhU9NnWaN8>
X-ME-Received: <xmr:fpycaUs6YANOngwFAHv8yX1oa2GZbv3XrXbgly4mtYxNXWfGgzTvX0BL7l0ceN9lgY10A9wYq0LmOV8bh2DR262yjqF-LIoiC1AtQESFhVQC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeejleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegr
    rhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpe
    efieelheduffdvleejvdfgteeiuefgteetkeeftdeggefgvedtuddtvdehgeefkeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesph
    gsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepjhhluhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepoh
    hpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggu
    rdhorhhg
X-ME-Proxy: <xmx:fpycafZ8VtOm_lCfWpG4xcdOOyLNNWWlHlIqGhIrbBG3qX7ZDm9igQ>
    <xmx:fpycaXW2piCBCGBOXjX2Igb5l1OgbHJkyxq_Ean4-mFvSZTWa_4rqA>
    <xmx:fpycaT65XPZSZJRNtK0n4trqxZow3NiL6ZQJl2pOSm0xY4Zgh_f1rw>
    <xmx:fpycaShGpZj7ap2UxZ7ciELKlrnI_qJ2tzMfp5WCy5UVkUOkDvMAog>
    <xmx:fpycafB58U6D9stHedS4DxnMfV0PFJorPOBb332CdWVKqh7RD5BP9I9H>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Feb 2026 13:29:17 -0500 (EST)
Message-ID: <871c180e00e0331a472604442f86d0eb51fc7364.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2] openssl: add support for config snippet
 includes
From: Paul Barker <paul@pbarker.dev>
To: Jan Luebbe <jlu@pengutronix.de>, openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2026 18:29:15 +0000
In-Reply-To: <20260216150201.2100724-1-jlu@pengutronix.de>
References: <20260216150201.2100724-1-jlu@pengutronix.de>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-d1CSeJuCBe4xRpt4toRK"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 18:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231689


--=-d1CSeJuCBe4xRpt4toRK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-16 at 16:02 +0100, Jan Luebbe wrote:
> This allows configuration (such as enabling providers) to be done by
> adding snippet files to /etc/ssl/openssl.cnf.d instead of modifying a
> copy of the full configuration file. As new snippets can be added from
> separate recipes, targeted changes can be done in multiple layers.
>=20
> For example, the pkcs11-provider can be enabled by adding a pkcs11.cnf
> containing something like:
>   [default_sect]
>   activate =3D 1
>=20
>   [provider_sect]
>   pkcs11 =3D pkcs11_sect
>=20
>   [pkcs11_sect]
>   pkcs11-module-path =3D /usr/lib/libckteec.so.0
>   pkcs11-module-quirks =3D no-operation-state no-deinit
>   pkcs11-module-encode-provider-uri-to-pem =3D true
>   activate =3D 1
>=20
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  meta/recipes-connectivity/openssl/openssl_3.5.5.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.5.5.bb
> index c0d02b617ba5..94fda03ea206 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> @@ -186,6 +186,13 @@ do_install () {
>  	fi
>  }
> =20
> +do_install:append:class-target () {
> +        # Add support for config snippet includes
> +        echo "" >> ${D}${sysconfdir}/ssl/openssl.cnf
> +        echo ".include ${sysconfdir}/ssl/openssl.cnf.d" >> ${D}${sysconf=
dir}/ssl/openssl.cnf
> +        install -d ${D}${sysconfdir}/ssl/openssl.cnf.d
> +}
> +

Has there been any discussion with upstream about adding this to
openssl.cnf by default?

I see that CentOS Stream 10 has a similar include directive in
openssl.cnf, but Debian does not. I wonder if upstream considers this to
be "safe".

Best regards,

--=20
Paul Barker


--=-d1CSeJuCBe4xRpt4toRK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZycexEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0blZ2APoDu7NGABB1si48MvGQ4CgVREVpfh2P2++e
0+OI9UzrNgEAj9YO1gnq9ZpWLueya6C8mFkNixRsrXOytEs3ZOl82gw=
=T4QH
-----END PGP SIGNATURE-----

--=-d1CSeJuCBe4xRpt4toRK--

