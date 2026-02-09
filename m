Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00514E7E0C5
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 10:50:07 +0000 (UTC)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45144.1770634201964687273
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 02:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=e2LQ6jrN;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=WWNYmuEN;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 37A317A00D4;
	Mon,  9 Feb 2026 05:50:01 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 09 Feb 2026 05:50:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1770634200; x=1770720600; bh=dI7903qMe7
	fVWx2qOQm9Z4T+JK4KTCL0N/X3FzEw/0M=; b=e2LQ6jrNcXhaSseTpa9+0vAde1
	XAZSfEP26Hh/UBfpk7Vo4dGrt4X7MpHHbhKunGhwJG6OT+Fz26uE36yzNcWVmsxX
	fzH/1j8aXuH0X1QNeok6LjjlQu6OuJGRQ+ZVP6oLuJpeRljn+s1Uu04yeAgOHk2w
	u/197IoYiF4Glq9aQQ7TTG12LtN8vvhC0MGip3Y++4GR7V+I2WdLe6Rf2TaB71AK
	MkCqTElyWdJbh06qOiD5aIdioEVDHkOkUoMwDMUd0/AhGmFPMKEBs6ghdWG6WL2K
	AG/fOGOyViTBmxGBMArsgT5KZRWWjEh0O2R3kP8UjHB2RleFQyDm3jWFra+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770634200; x=1770720600; bh=dI7903qMe7fVWx2qOQm9Z4T+JK4KTCL0N/X
	3FzEw/0M=; b=WWNYmuEN+foc8+skWc65DAe8JE7MCssCScfqkpUVGJB9xk9WZ7D
	wixpkbzlwJOt/xru4xD+rBA0mHBS5bVOVTa8cwpAwNrnu3Lutj27tLKnkkPp9TaF
	A/mWSJxrlLsq5nEDzL8lgwZNfHJTaKfuju+k8g1gnRWq57OKaO6z5iDU+izYNENc
	2A1UE8AmBRYjOglLc0NpEMtKb/dOT4BMGi0iZPpJFbE5oko5zZ6bgqlG4UCG7FUi
	bCEn4zthxiWBiprhCzHjLKN8ucwLAcNQ2OKRK0imT33IZ4i+1i6rBoPwEcFluu63
	XN1/gekYwvL5puZcXv2oCXhJVeHHK0U6yMw==
X-ME-Sender: <xms:2LuJaZxDl63Qnpfa08z_m-nhtX_kAUfFKY0P0FRezqjqp2voVLCgYg>
    <xme:2LuJafSQiUTzwmVPawUnAJ2eUPidNG-XzUE4OBzT_ReUx0CZaq9hd_xL0uSygpBMR
    AtYoeQD3nmKNUdEMHBjMhpoNPxaIYhq3Hz9Q6VDoanT-d6DM_93ZQ>
X-ME-Received: <xmr:2LuJaQ_mBjTkQDs-FV2tLcg7g44LdVLDU2APlx68JlCIDj4jtS9eShFAEbGCVkIn84EsaHT6nkeQrAE-HKLitWFQ3ZJae_6PYmcXKFakB6Qb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleeiieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepgeefhfdutefhffevheevkeejhfegffegieektd
    efkedttefhuddvffeuieeiteffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrh
    dprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgv
    nhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:2LuJaWq3T5kVxK30fD4DVHfzESv3HsVbp_jZIfUYYtojAVwMv3Ia1Q>
    <xmx:2LuJadnRONFIG7vxw3nPGQ57ZncHeuYNBl8ZiDe1r1EWTNBsrBx1uA>
    <xmx:2LuJadI6XmFSG0pHLla6-cIw26t8_4cb2THv5hsod5KK9rVQtSI3jQ>
    <xmx:2LuJaSxqJE_paXqBqbWSDHXw2Mk-vcm1KZ2CxW2RxOl3m1D5Uhju4Q>
    <xmx:2LuJaWVZY0HMR-1-7rU-rBuLuhe7njX_60C_0P9T1IIPuIlksoJ1yZjT>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Feb 2026 05:50:00 -0500 (EST)
Message-ID: <296efb168208e46298830f4af5f37b7cfb3ecfa3.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 16/25] zlib: ignore CVE-2026-22184
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Mon, 09 Feb 2026 10:49:53 +0000
In-Reply-To: <52cbace519c5d490a83550d7baa1c0fa200eafcb.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
	 <52cbace519c5d490a83550d7baa1c0fa200eafcb.1770626074.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-j2lOwBTBBL37XLJo65D4"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 10:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230780


--=-j2lOwBTBBL37XLJo65D4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-09 at 10:28 +0100, Yoann Congal via
lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> This is CVE for example tool contrib/untgz.
> This is not compiled in Yocto zlib recipe.
>=20
> This CVE has controversial CVSS3 score of 9.8.
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/recipes-core/zlib/zlib_1.3.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zli=
b/zlib_1.3.1.bb
> index e6a81ef7898..8ebc6befc2b 100644
> --- a/meta/recipes-core/zlib/zlib_1.3.1.bb
> +++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
> @@ -48,3 +48,4 @@ BBCLASSEXTEND =3D "native nativesdk"
> =20
>  CVE_STATUS[CVE-2023-45853] =3D "not-applicable-config: we don't build mi=
nizip"
>  CVE_STATUS[CVE-2023-6992] =3D "cpe-incorrect: this CVE is for cloudflare=
 zlib"
> +CVE_STATUS[CVE-2026-22184] =3D "not-applicable-config: vulnerable file i=
s not compiled"

I think we should consider backporting 119b775b36df ("zlib: Add
CVE_PRODUCT to exclude false positives") and the relevant bits of
73ee9789183a ("recipes: cleanup CVE_STATUS which are resolved now"),
then we can cherry-pick b0592c51b6ad from master.

Best regards,

--=20
Paul Barker


--=-j2lOwBTBBL37XLJo65D4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaYm70REccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgjuAP94LPHqGWEIjX+eD/ElGbTflL3KJkwJ2gLX
dk7F0e71rAD+MZOIxYVFYVa3Gt7AUTJm0SwtoVbyGOvGfKJkC/ZNywg=
=2cFH
-----END PGP SIGNATURE-----

--=-j2lOwBTBBL37XLJo65D4--

