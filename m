Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BFFCF6AB8
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 09:46:41 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3223.1767865598949329216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 01:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=ByS7ZMNV;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=A8UXNV8z;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 23D9F7A00FF;
	Thu,  8 Jan 2026 04:46:38 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 08 Jan 2026 04:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767865597; x=1767951997; bh=EZ1PDQr7yX
	WjKGibnpQGwulxal+g3TOb3L5b+XkgUNk=; b=ByS7ZMNVVmD24KYfv+zu651Okg
	YeYHtOK4d6zBinC+LDhkXCt/rqTwp39Md3aXZeEchtCXxflxkmbhr+vXYMGEWGsD
	JX+EpfjVALreKQlTzQ6oYDdUO7XkdxpXIQRSYJCYMkzG1CjlR27uFpLTBUBTaQ/4
	+Taiw+6Xfxf7/iDB2akBdwEcbBLTKfY+7SKZK9piWu5S6nVrDjWCgn70Uql5SVgg
	bZgUsKxUHZSn7A94RESqZexXtlVr41h4VFz5wub8oJ2EBnIxJmRb8Hp2R+ojJcPH
	RY3RzD3g+Pe6DJ/8uCVc42tZ0qElmGEFwWj8OKE8twwvDQBL4as4FhE9sAHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767865597; x=1767951997; bh=EZ1PDQr7yXWjKGibnpQGwulxal+g3TOb3L5
	b+XkgUNk=; b=A8UXNV8zzmNyCtqznAtzkIis+/gM+Fwoi935CpKfBckw9X+jMxp
	X0Zb9TTDrN3ulZ4aZZFt8oF8IcT/0US78QVUoculxMvLT4viK4Xr8gdugYvVv72R
	HrHZlsQ6nIArn3OaXpq9m9gYbikFqbac/ixcbNUyUrqqrXXRRlTfvVOs/iqFxli6
	lxiWY/gggciA1Cp8SL0dH3aiE/Jzi6DYKvCEUqThfaj7EakE++0DxLY+E/lnsLxv
	yoltimBU67uOq0Ra0CSqepkOOCQRfAbGGFiH3tWg0fqcoXpzhPJyHftXDumG5twa
	VxYPBbKWovhbJgOUG2wkQ7c/VJcrjNTCKeg==
X-ME-Sender: <xms:_XxfaeQ0WPRJdtWoAkCe2hzc-pHmes1Cn_A_lbIntkmlc8kVKTE5ig>
    <xme:_XxfaZz81puviJrLILhRSKg9UoiyEIGb7wttZPrL7kqaklkHab2QwGhsDoaLsmtTD
    aydN2d3WpegNDiW8Vw5heDr36Y1jvBB5Vuha_kDfyiq6EJDXLxD3w>
X-ME-Received: <xmr:_XxfaZeslt0Sb3LF2j8cyEQYihk7XjlvbfmNXl_fE05_Ah3RVPe9W6ZyWZ86d8iWPKL1dJuVWhoCRjbk1sDhy9xzdnb0fvbGQGy2yEaj1s8b>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdehieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepgeefhfdutefhffevheevkeejhfegffegieektd
    efkedttefhuddvffeuieeiteffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtoheplhhiuhihugdrfhhnshhtsehfuhhjihhtshhurdgtoh
    hmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhp
    vghnvghmsggvugguvggurdhorhhg
X-ME-Proxy: <xmx:_XxfaVJvRe3gEJ5quMisbdAG4mumBaG9daIwGw3zJMOU_bBDttu8-w>
    <xmx:_XxfaaGP8g0EnEnC58L9EeIyNL99lj0yS_Yl6suog9748C8K7lgeCQ>
    <xmx:_Xxfafq4VYFSNQfZzzDCWESYQjEEBg7DCadfStpLXbHfFv6ZNPEf_g>
    <xmx:_XxfaTQRvUPMqm9Ec54HDRNmTJalCxobYOaBRz13RBRNqGyrVoxVVg>
    <xmx:_XxfacYtWyjaIVeJD78rK3YG4afL1xUgVXbzwKF6gVM8wmOFWe83Pevp>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 04:46:37 -0500 (EST)
Message-ID: <63ef01a65fa6fb80985291625e7dba560faa53e7.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v2] python3-roman-numerals-py: upgrade 3.1.0 ->
 4.1.0
From: Paul Barker <paul@pbarker.dev>
To: liuyd.fnst@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Thu, 08 Jan 2026 09:46:31 +0000
In-Reply-To: <20260108014101.1974-1-liuyd.fnst@fujitsu.com>
References: <20260108014101.1974-1-liuyd.fnst@fujitsu.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-M7hjuNJmt22rWTQ3In0u"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 09:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229048


--=-M7hjuNJmt22rWTQ3In0u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-08 at 09:41 +0800, Yiding Liu (Fujitsu) via
lists.openembedded.org wrote:
> 1.Changelog:
>   Restore LICENCE.rst in the roman-numerals-py meta-package
>   Add some debug assertions for unsafe blocks
>=20
> 2.Add bbclass python_setuptools_build_meta to solve following error:
>   pyproject_hooks._impl.BackendUnavailable: Cannot import 'setuptools.bui=
ld_meta'
>   ERROR Backend 'setuptools.build_meta' is not available.

Thanks for adding the extra info.

However, this doesn't explain why we now need the setuptools.build_meta
backend, we should say what upstream change caused this. This caused me
to look at the upstream v4.0.0 release notes and I found:

  - Rename Python package to roman-numerals on PyPI.
  - Publish roman-numerals-py as a meta-package that depends on
    roman-numerals and installs no modules.

So I'm not sure we can take the new version as-is, the roman-numerals-py
package is now empty.

It looks like this recipe is here to support python3-sphinx, have you
tested that still works after this update?

As a side note, when we upgrade a recipe across multiple upstream
versions we should include the changelog entries in our commit message
for each version we skip across, especially if there's a major version
bump in there as it's often because of some backwards incompatibility.

Best regards,

--=20
Paul Barker


--=-M7hjuNJmt22rWTQ3In0u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV989xEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bp7YAQCI3iY4TYMV3wXEdVb0Y/tXxDDy8uM5vjoP
ZqBXyYieYgEAxTCYryJPpCneRL/wQXqylz4hs389r2q6gY7GSZCuqgo=
=Itrr
-----END PGP SIGNATURE-----

--=-M7hjuNJmt22rWTQ3In0u--

