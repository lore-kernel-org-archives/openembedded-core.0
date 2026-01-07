Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8A5CFD64D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 15:01:46 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7764.1767798099682420720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 07:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=EqW6qM9m;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Ct3HpfzL;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id D19DCEC02A9;
	Wed,  7 Jan 2026 10:01:38 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 07 Jan 2026 10:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767798098; x=1767884498; bh=EOdwb3Yz/o
	1co90/65i6WNrnwzmwaSI3X99zelnePZE=; b=EqW6qM9mdAHksefpWQJ5QIlwGT
	P1PDF7eMHP2b9E9cfZHgBSUeno4MEmNU1fevaT+uW57WCnEx6ckWoPjuVtKDaO/u
	ndr/1o/K6HuskPgWNgRAKG1jeqX60S5A/py07uZO1egfQAv8L2QpmrAYB/jx2VGA
	UUrHJIQ7rcM6c3pkgDxysT5ASavnznfKAKGhWmy/RmLVNv6uATAjhT1DgLR5GVcX
	rnQQp091I+wNwd0hSMQpZbgQW52IwSnZkywXgd/G9ZnRj6x830Jt7QMAJBgCcvpJ
	K5NgSvd2FZaWXovh1SAORMNSp2vpsqLzyE0HsCsrH9zl/ZpYcuBF/hxz6uUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767798098; x=1767884498; bh=EOdwb3Yz/o1co90/65i6WNrnwzmwaSI3X99
	zelnePZE=; b=Ct3HpfzLdIbs2STJjiQSsLe3yo1AVvSnzFmwAQgujF7Lp9mW7M4
	r23rAxYFa/E5mV5g8yWkLOvXdNY+OU8kazwGLJuo6eJUe7m1ShCzQfs3q/xcv5FP
	utKVNd+UE+ZbgZf+2NZN5L4FepRnWmH2TLofDq+WP6rOwZ7UD9MPJEQushdpI5m9
	lSXV7kLgMAWyYsjS6RqzfT/y66/cnZNStwjUP/eGLJ5NKbRMoKi00liUam/GMaXf
	6FSfDnzJ3GReXy26BTxRjAzxMdeYyO1yyqxGmWV8qyNzrE3t1Bi1PqwnPBjVqf9e
	k3fMz8RNB08WOH8SXQ9DlbZFiDBrcghnPBQ==
X-ME-Sender: <xms:UnVeaZ7FPht-2HJYkTiP3qzYdkVrAP_TvVPeBMYuuJU2JFS_lrqS9A>
    <xme:UnVeac63gQnr8VqHmC8Mi15sk8iE6SRxtRNIv_a85aN3EHg6jPLXzFKrquaokrK3K
    SKF9-C_fFh97zYX2457XN5DPqvxy5JGKejPhD4zdorq2aSCaPRh1Sv2>
X-ME-Received: <xmr:UnVeaeFMj-H_KQyErSaPFJ1BsCL1wEFQw7yEcABvK4pu11jecJAm8Qt7vyUbI5dtRJVXY5edc1sG9rRwDwLFs6CcbfrO3pWfTJHnrfs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeffeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepudegteehueffvddthfelgfeuffejgeehgedtue
    etkeetveetvddtgfekuefhjeetnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphht
    thhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhuhigurdhfnhhsth
    esfhhujhhithhsuhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtgho
    rhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:UnVeadQqXO7V1BoLVuZYZ5LNitgY8wE0CcPiU0ZaSckqaiXiBYiIPg>
    <xmx:UnVeafsx74hovBW2ciidsl7sVSp91gLAtxvG01_NJwz_3Yvf_rJ0Mw>
    <xmx:UnVeaUy1u4_7A8UfQTejGkF6ckPJPkM_7f_oHTqmkrIDb9aIE2dEvg>
    <xmx:UnVeaR4sc73hwcUDcIth3Nad4cEfj_z4ozlP-BzAxjbgbkKBqRCmlA>
    <xmx:UnVeaRC7q11_rcTY-mrziZ_uo-ZINGK7OdnyWshcH57JWDhhgxJNgFGj>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 10:01:38 -0500 (EST)
Message-ID: <8958519242a19bf272801cf61c6c3981854902a2.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] python3-roman-numerals-py: upgrade 3.1.0 ->
 4.1.0
From: Paul Barker <paul@pbarker.dev>
To: liuyd.fnst@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Wed, 07 Jan 2026 15:01:34 +0000
In-Reply-To: <20260107082233.803-1-liuyd.fnst@fujitsu.com>
References: <20260107082233.803-1-liuyd.fnst@fujitsu.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-n8c7RrCQtGVZmYEtRpCW"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 15:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229002


--=-n8c7RrCQtGVZmYEtRpCW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-01-07 at 16:22 +0800, Yiding Liu (Fujitsu) via
lists.openembedded.org wrote:
> Changelog:
>   Restore LICENCE.rst in the roman-numerals-py meta-package
>   Add some debug assertions for unsafe blocks
>=20
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  ...umerals-py_3.1.0.bb =3D> python3-roman-numerals-py_4.1.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-roman-numerals-py_3.1.0.bb =
=3D> python3-roman-numerals-py_4.1.0.bb} (68%)
>=20
> diff --git a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0=
.bb b/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb
> similarity index 68%
> rename from meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.=
bb
> rename to meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb
> index 9a76df0de2..8689a6315f 100644
> --- a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
> +++ b/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb
> @@ -3,10 +3,10 @@ HOMEPAGE =3D "https://github.com/AA-Turner/roman-numera=
ls/"
>  LICENSE =3D "0BSD & CC0-1.0"
>  LIC_FILES_CHKSUM =3D "file://LICENCE.rst;md5=3Dbfcc8b16e42929aafeb9d4143=
60bc2fd"
> =20
> -SRC_URI[sha256sum] =3D "be4bf804f083a4ce001b5eb7e3c0862479d10f94c936f6c4=
e5f250aa5ff5bd2d"
> +SRC_URI[sha256sum] =3D "f5d7b2b4ca52dd855ef7ab8eb3590f428c0b1ea480736ce3=
2b01fef2a5f8daf9"
>  PYPI_PACKAGE =3D "roman_numerals_py"
>  UPSTREAM_CHECK_PYPI_PACKAGE =3D "roman_numerals_py"
> =20
> -inherit pypi python_flit_core
> +inherit pypi python_flit_core python_setuptools_build_meta

Thanks for your patch!

The commit message should say why the extra bbclass is needed with this
upgrade.

Best regards,

--=20
Paul Barker


--=-n8c7RrCQtGVZmYEtRpCW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV51ThEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0biihAP0d9pfKUIhSVtwtCvZ1dbqMraZo+9qR37eN
wb31zs2IOQEA5RHMegyLb/R/wDXMNGY+6vgT9mYLPG/tXDnUY9l+TQE=
=2IML
-----END PGP SIGNATURE-----

--=-n8c7RrCQtGVZmYEtRpCW--

