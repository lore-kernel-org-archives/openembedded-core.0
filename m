Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34309CD4F39
	for <webhook@archiver.kernel.org>; Thu, 14 May 2026 11:43:56 +0000 (UTC)
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8834.1778759029058151812
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2026 04:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=mp9JEQbm;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=gSExRNfp;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 54BD17A00CF;
	Thu, 14 May 2026 07:43:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 14 May 2026 07:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778759027; x=1778845427; bh=5RK5ytPbxS
	dZ5QEhgx9/NrmtFxaI6tAZyhthGzHyvjQ=; b=mp9JEQbmKfyrXQNmqd6KibX2yW
	Jc2y9hjQZuJYDlI1ALhi7APcZLhzQrUiMq+ZlDSU8apcdj8zwwqfiIysNwP1rdjw
	JRYmYiqM7XUcOS38Auda7N0XmLryOY2xYepFMpaZxTTARCqwoce5XvKPDm+7DbiQ
	bU3jjKKZJXKuWkm9fEmcon2HHbTL77ZKH93g4L0s1P+Gj9hTLZD48QWxgVam0tEh
	vFxyw5tL5o8I7jn0AjEAa0LVC+fAw0gYzv3aJqiI2EhwgXnE/wPkXgNAzsnCxH1/
	pzyG81C4VT1ukZ2DWu7uhuCIvgPpV2rYYHf/D68Noee6Gd6FFq3stcgcVcig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778759027; x=1778845427; bh=5RK5ytPbxSdZ5QEhgx9/NrmtFxaI6tAZyht
	hGzHyvjQ=; b=gSExRNfpRzVFi3Mkh3ytrxp1dTOCS7lEY7ukkSRumeOzuk0IvDq
	eMWEzX/9oLEe98Axxbrikcq1K4YUOqdZR8iHpWSaAQL2kIy/IPWQLLwn2I2GhgD1
	8uIGam23kclGDhiEiNkfZm5wknZHb3Jf0yKAUNxuYieTT7Xvedp2z3Gsq7eoTXMu
	b97wcuMwPFaeA5fqK0j9BJNMuhv6Da0Ib4+0/A0Hw+Pjor0rHvyZtQp79qzcd5ch
	qaZMQIpQNLMaPTj7zJg+z6JI3jduyfz3UCRDALGyQ5L0IjTXsafc+922e4zCbilj
	sWy+00SUXSavtZ0A9JKzFu2VQrBdifW5aAw==
X-ME-Sender: <xms:c7UFarKjCwGQ8aF7Zx_5vgNoYgt4Gs5kSwJgnTSdbiFiCqBQKkVCjQ>
    <xme:c7UFammW8NxdI4YKLQIYS9oiUN06RvFcFx1-3IL2usEk7SK9w2DR7DKC_nlukdY6H
    2919XIQY-TXxomluN6IEK17EdNLvS7PsOzXN0sageKy9toBn_F_GMA>
X-ME-Received: <xmr:c7UFahFp3CRWHurLzZ-E2_rKC17t0S40TBoc2pwXcsK_y2ogJd7NnEetU6_tOvpWUfWDrySbAaIYTUqwsaZbxbP7ob8t5wqe_ATeug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdejgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegouf
    hushhpvggtthffohhmrghinhculdegledmnecujfgurhepkffuhffvveffjghftggfgges
    ghdtreertderjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrg
    hrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnheptdekgeehtedvieeljeeludfgfeel
    geejhefguddtkeekfeevffduvdffvddvjedtnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhdpsggstghlrghsshdrnhgvfidpghhithhhuhgsrdhiohenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdrug
    gvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    fhhlohhsshesjhgvthhmrdhmvgdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtg
    horhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopeho
    lhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:c7UFauGFtDqyuV70GIgMEBCsq5Bav0hcVrLM11peSqXTH5EfAErShg>
    <xmx:c7UFamOi8iJpn5eHYSjYruUrGzF3P1LawLz4de7KAjPl4w2Pj61Igg>
    <xmx:c7UFalGXCXfmPkecdI8sr98uij9_UbkEezq1_Drasn_nuYQYwlD3xw>
    <xmx:c7UFalM9h3cx4_sKqgESe9_glJT5-npLHNlGn2Okfv2O8M0Kdn_0bw>
    <xmx:c7UFatKyF55sbdibjmqwjD5q_txbQ4_oZ-94yFdoQtCbcIUGmtBWgFiS>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 May 2026 07:43:46 -0400 (EDT)
Message-ID: <ec97074d05b92478b07987230e835ea57012b2b1.camel@pbarker.dev>
Subject: Re: [PATCH] spdx30: default SPDX_PACKAGE_SUPPLIER to OpenEmbedded
From: Paul Barker <paul@pbarker.dev>
To: Javier Tia <floss@jetm.me>, openembedded-core@lists.openembedded.org
Cc: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Thu, 14 May 2026 12:43:43 +0100
In-Reply-To: <20260511-spdx30-package-supplier-default-v1-1-12e0d086ccf4@jetm.me>
References: 
	<20260511-spdx30-package-supplier-default-v1-1-12e0d086ccf4@jetm.me>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-IkHLy6CV39kHd8d6ipPF"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 May 2026 11:43:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237027


--=-IkHLy6CV39kHd8d6ipPF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-05-11 at 17:55 -0600, Javier Tia wrote:
> spdx_package.suppliedBy is only set when SPDX_PACKAGE_SUPPLIER is
> explicitly configured. Default builds leave the property empty on every
> software_Package Element, so SBOM consumers that require it (BSI
> TR-03183-2 v2.1.0 validators among them, surfaced by shipcheck at
> https://github.com/jetm/shipcheck/issues/3) treat the SBOM as missing a
> normative field.
>=20
> Default SPDX_PACKAGE_SUPPLIER_ref to the SPDX_AUTHORS_openembedded
> agent already defined in this file. new_agent() resolves the _ref
> redirect (meta/lib/oe/sbom30.py), so the existing OpenEmbedded
> Organization Element gets attached as suppliedBy on every Package
> without creating a duplicate Agent. Builds that already configure
> SPDX_PACKAGE_SUPPLIER via _name/_type/_import/_ref keep their
> behavior; the ??=3D only kicks in when nothing is set. The default
> resolves to a fixed in-tree string, so SPDX output stays reproducible.
>=20
> This follows the additive pattern used by commit c8e6953a0b
> ("spdx30: Provide software_packageUrl field in SPDX 3.0 SBOM"): give
> the field a sensible default value, leave overrides untouched.
>=20
> Signed-off-by: Javier Tia <floss@jetm.me>
> ---
> COVER-LETTER-BODY-FOLLOWS
> shipcheck v0.0.6 (https://github.com/jetm/shipcheck) added an SPDX 3.0
> validator that scores SBOMs against the BSI TR-03183-2 v2.1.0 minimum
> content set. A stock poky core-image-minimal with
> INHERIT +=3D "create-spdx-3.0" scores 0/30 on the per-package field
> check because suppliedBy is empty by default. Patch context and a
> public issue are at https://github.com/jetm/shipcheck/issues/3.
>=20
> This series gives SPDX_PACKAGE_SUPPLIER a sensible default by
> reusing the SPDX_AUTHORS_openembedded agent already defined in
> create-spdx-3.0.bbclass. new_agent() (meta/lib/oe/sbom30.py) already
> supports _ref redirection, so the change is one line and no Python
> is touched. Builds that already configure SPDX_PACKAGE_SUPPLIER via
> _name/_type/_import/_ref keep their behavior.
>=20
> Two adjacent BSI gaps were considered for this series and intentionally
> left out:
>=20
> - software_declaredLicense as a field on software_Package. The
>   SPDX 3.0.1 spec
>   (https://spdx.github.io/spdx-spec/v3.0.1/model/Software/Classes/Package=
/)
>   does not define such a property; license is modeled exclusively via
>   Relationship Elements. The hasDeclaredLicense Relationship is
>   already emitted per package in meta/lib/oe/spdx30_tasks.py
>   (61ba0ef140 switched it from hasConcludedLicense). The shipcheck
>   validator needs the relationship-traversal path, not a new field.
>=20
> - Per-package verifiedUsing aggregated from contained software_File
>   Hash Elements. This is a real spec property (cardinality 0..*) but
>   the multi-hop aggregation is invasive enough to warrant a separate
>   discussion. Tracked on the shipcheck issue above.
>=20
> Cc: Olivier Benjamin <olivier.benjamin@bootlin.com>
> ---
>  meta/classes/create-spdx-3.0.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index 56fd01fd53..1fc15ecc7d 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -123,6 +123,7 @@ SPDX_ON_BEHALF_OF[doc] =3D "The base variable name to=
 describe the Agent on who's
> =20
>  SPDX_PACKAGE_SUPPLIER[doc] =3D "The base variable name to describe the A=
gent who \
>      is supplying artifacts produced by the build"
> +SPDX_PACKAGE_SUPPLIER_ref ??=3D "SPDX_AUTHORS_openembedded"

This variable sets the suppliedBy property, which according to the SPDX
3.0.1 spec [1] identifies "the actual distribution source for the
artifact". This should be the person/organisation building and
distributing the packages, not the author of the recipes. So this is not
correct as a default.

[1]: https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Properties/supplied=
By/

Thanks,

--=20
Paul Barker


--=-IkHLy6CV39kHd8d6ipPF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagW1bxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bmxoAQDIQeiiZb8d6/01pk6jJKByKGk6hl9YHJvI
THsg8VZHEQEAjuemjeuNkEM21gfJBvfcM8EWtlUBHUv8/+dptWmboQ0=
=qOLv
-----END PGP SIGNATURE-----

--=-IkHLy6CV39kHd8d6ipPF--

