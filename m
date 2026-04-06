Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD5DEF4EA4
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 08:28:12 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50865.1775464088398335175
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 01:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=pxQRL+Lk;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Anh/MyC+;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 994981D000BF;
	Mon,  6 Apr 2026 04:28:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Mon, 06 Apr 2026 04:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775464087; x=1775550487; bh=tBf185i32W
	3n0FK9jsBhjGK2vRkNWpz1qicgVvV9q3Y=; b=pxQRL+Lkz9jHvzln+Zf3aMncJ6
	09NXcsTDU1uRQYmznwjtjirUJogACHSNMlsZKDTO7axR/ZGq0pFteHCUDfg/od0/
	iu03jYX4siE8NMcDVQ7tul3dbeLAdj27wx+jUQ4mcdOrP/ll8Av135EaomwhvG2B
	MRH3SbeXoE3Z0Q+CwDHlVAXz4jMp4pIr9XxwQOpNk71gPkKaarNXDnktgKUZz23F
	sMJcgX0g6+VzGeZZdFrwvbxJIgK/LgjHH3aq3I5kygIdbHb9wyULBPTRRwrneIvX
	0j+leV5qBTnsM+3FTrCH1UezBoYICr8oUkntDi+wiwuA6lRT04742I/l+F2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775464087; x=1775550487; bh=tBf185i32W3n0FK9jsBhjGK2vRkNWpz1qic
	gVvV9q3Y=; b=Anh/MyC++8UkoYJXTv71m8BQPZsep6uP992k9ZeSoSqgu0tGFS3
	gqROo0dPLqcx7+rpqUu1nTuhADCEBmQ8qcEfIxWUsKL2SriDBFQTGsLuylm2DO8u
	GSOEYrE5HqLIBTWJcB+qKhjwVegMsyIc0F8F+/hDxMslcBjAJMuwRvB6z4fg4I2u
	Wfo9+VDtl88f7luv7QoBvRz6foxdGcIxw5r2lzoGhNdRP8cZnO31xzixtL6JqQM+
	jXx5AWvYK1XR5nvGXpRPzRc4aPflN/XyUe+PvjtAD9xhdl7zZKa1bduAYV3FXI9p
	nQzXp2qCEm9irbv+29QWdQCOE1TBswNVSBA==
X-ME-Sender: <xms:lm7TacDIWdtQ13ARnobLXQxLRqYI9jV_ypoqeH6yKRQYZnMxQK8Nwg>
    <xme:lm7TaV_xaFKynDzem82oYmnbGeO7Cbzfo1DPexDrhH3YXvpdNWquWgK4Vi9zsWQdZ
    gG145gKYEqpMGJFclSg26H9QUcpMYN5xNpoCYKvRuSzixZgQ7zDBw>
X-ME-Received: <xmr:lm7Tac8nnHmpCg78RIdgSNRwZ-EzHP9zq1SSPrqRJXLY-M9kqxCIOACDYejze_2GwsO6rTG0wnqSQF2n25rmWiHMcG5xSV_ugJ_FDTmLWRs7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddujedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecufghrlhcuvffnffculddquddtmdenucfjughrpefkuffhvf
    evffgjfhgtfgggsehgtderredtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceo
    phgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtthgvrhhnpeefhfffffeutd
    evteekteekveegiefhieejleehuedvtddtfefhjeetgeetieffueenucffohhmrghinhep
    ohhpvghnvghmsggvugguvggurdhorhhgpdhnihhsthdrghhovhdpgeeirdgsvghsthenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhes
    phgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohephhgrrhhishhhrdhsrgguihhnvghnihesfihinhgurhhivhgvrhdr
    tghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrd
    hophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehsuhhnuggvvghprdhkohhk
    khhonhgurgesfihinhgurhhivhgvrhdrtghomh
X-ME-Proxy: <xmx:lm7Tacdw3zB-qtRkNV7N5P9fR7p1QUooPzd3b6l5n8qCKqvuAHGWSQ>
    <xmx:lm7TaVFKS4Lf5YagEyVFY9KBV6o9-fTTpEyOBHrleE7s40z_YIWggQ>
    <xmx:lm7TaafrEOrd1JwzflnZrrHILuosxCG9bwtngBNhG7rDbn9O1zhCgw>
    <xmx:lm7TafFps1omGFTrZawbn1CkLWLphRJ0HsZHtZCLQ4HgdDECNVLC9g>
    <xmx:l27TaQvq4c83OQogGd2FBvlPdMfioDVPpnHOAwYnt9fvhYBKz-UBMZWd>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 04:28:06 -0400 (EDT)
Message-ID: <aff85443515795d097949cedbf07bd2ed40d7372.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] binutils: Set status for CVE-2025-69646 &
 CVE-2025-69649
From: Paul Barker <paul@pbarker.dev>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Mon, 06 Apr 2026 09:28:00 +0100
In-Reply-To: <20260406070506.3779367-1-Harish.Sadineni@windriver.com>
References: <20260406070506.3779367-1-Harish.Sadineni@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-3fm3+T6DuUg08NHQ/WQI"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 08:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234670


--=-3fm3+T6DuUg08NHQ/WQI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-04-06 at 00:05 -0700, Sadineni, Harish via
lists.openembedded.org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> Set CVE_STATUS for CVE-2025-69646 and CVE-2025-69649, as both CVES are al=
ready resolved
> in the latest binutils 2.46 version upgrade.
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.46.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/reci=
pes-devtools/binutils/binutils-2.46.inc
> index ff10050dd9..dc8b6be03e 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.46.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
> @@ -34,3 +34,6 @@ SRC_URI =3D "\
>       file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.pa=
tch \
>       file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.pa=
tch \
>  "
> +
> +CVE_STATUS[CVE-2025-69646] =3D "fixed-version: Fixed from version 2.46"

Hi Harish,

According to https://nvd.nist.gov/vuln/detail/CVE-2025-69646, the CPE
for CVE-2025-69646 is "cpe:2.3:a:gnu:binutils:2.44:*:*:*:*:*:*:*", so it
should already be seen as fixed in 2.46. Which tool is reporting this as
an unresolved CVE?

> +CVE_STATUS[CVE-2025-69649] =3D "fixed-version: Fixed from version 2.46"

According to https://nvd.nist.gov/vuln/detail/CVE-2025-69649, the CPE
for this one is "cpe:2.3:a:gnu:binutils:*:*:*:*:*:*:*:*". Please include
some info/links in the commit message to confirm that this was fixed for
v2.46.

Best regards,

--=20
Paul Barker


--=-3fm3+T6DuUg08NHQ/WQI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCadNukBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkAbAP9jv4/65nn/LG9xJImWbAWrGNCLGVI9sXFl
tehCy2b3NQEAgYoVXwavxR1hk7imYl/hIib+rmmH0eBAc4n8L8tsBQ8=
=/pVr
-----END PGP SIGNATURE-----

--=-3fm3+T6DuUg08NHQ/WQI--

