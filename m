Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25F97CD5854
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 11:48:45 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4014.1767786521365899543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 03:48:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=aX0qTSyr;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Ftr/SsmY;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id ACB797A0119;
	Wed,  7 Jan 2026 06:48:40 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 07 Jan 2026 06:48:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1767786520; x=1767872920; bh=HtGPye1bma
	4+tpp+y07t0PN/dS2R6rxwN2njbUKwOqY=; b=aX0qTSyrrvOwMQ7jIDUpz3zn9z
	Lfv4kj/GGjIKbrzjxYvlR0O4Jw1bjjiifIe8H/U6SK9DqR6ur0ejhhpmAR9mVAYt
	xLoZ7MCxe2czGpA3qf/bJpdh1vNT6wycuuofbrOPagLlOvpc096VVFInGwkTXFMX
	DQhnfjSlVgldKIC5Odt/Sh4rd01kRbmaPlXgmL3ku8D00hy+25H9oVLQv3/3XrdO
	jXl71kMNEJP0OB9R8wKhOLI8ubUqVHEGPQGFxazaW6Fm10S8s4hv9ORAXU7gPIDP
	f8F0G6gSls4+JD8Qnj75Gm3cFLudtJAKjgxVetDuSqzPyoGWoGwjaJtego+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1767786520; x=1767872920; bh=HtGPye1bma4+tpp+y07t0PN/dS2R6rxwN2n
	jbUKwOqY=; b=Ftr/SsmYaeCk8kAnU3QTGfAhmmdtS8GhQzf38v1K3UG/AfWt1vF
	V3hx2rUuTqgxHXlYnjKaGvZ5ZDQDyrG77mqhzR+mskAsweka7iYyEQGUe+rBt89q
	m0Lfd8UTO8naXasvyK08VrOeZ8AoWSMteqMDarU7aiwvi09D7jf0JTIxSaLj0Npe
	u+NfYn14CklG+kzb5tCw1LVftQgLCXfjFMJAZvXoOTAB1eqkIJvtiO/B0XL4jmwB
	RaDgtKtzch1NBuWA8VzjuV0R9O6JVxwZqcupw85hX4U4x9ZAKt4X7cvfpL4D1hYw
	jeTZu1FaiDkDE3Tw7fvGS9OLAFDy+2OTBGA==
X-ME-Sender: <xms:GEheaXdke_sMUAS7IET64QOOW55JD1lTkp-lTmKrxg1NOUxohZGeNQ>
    <xme:GEheaUqoUnGhRNcxDDxp7xyPNOz9x4GAXzuUtAgxwT3nPVtJQpY49n-mcCJpXtyJ_
    C4Wac_1DDbgPZWDEcgedMhLEd-rYOfNnb1S6IXGDaZZj0h9iMlx1Uvz>
X-ME-Received: <xmr:GEhead4rGghXCbxR5O4yGfXjoYQA0zLdRq-wvKjxZbCv3ZJFYdpKhIRqZoPe7C6fayWLfAUsmQuNRyTay3bDgM5nJe7-S1-nzzRmRZ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddvleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlqddutddmnecujfgurhepkffuhffvffgjfhgtfgggsehgtderredtreej
    necuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvg
    hvqeenucggtffrrghtthgvrhhnpefhjedvieeileeiheehgeehjeduteffhefhjefhjeej
    tdeutedulefgudfhuefgjeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorh
    hgpdhnihhsthdrghhovhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfe
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehs
    mhhilhgvrdhfrhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehpvghtvghrrdhm
    rghrkhhosehsihgvmhgvnhhsrdgtohhm
X-ME-Proxy: <xmx:GEheaSqlANQ6SHIBg-j1tcbyX6q4gjzsckAws6iKtKM1VFuGEBUM9A>
    <xmx:GEheaXiKw_HCyhdDuCl7fRZb-MOL26a11ehsMMEzvlklSh95ndCQ-g>
    <xmx:GEheaUJG218OAN-fofZ7DVsriDALY29sOgF09l2Y7cfyJq9J8ZIqXw>
    <xmx:GEheafA_J0D4CYm1TzvSuntgiBO3G3pPMmqK6ZpbFjwELWs6HOGXkQ>
    <xmx:GEheaWzSnctvdIOGsF3gAwDE0QNQDP5DBCQWkpgs0Ny4FgHMw9mJUE0n>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 06:48:39 -0500 (EST)
Message-ID: <c19daed92270797942ebbb4b51c6f6b03fec16b3.camel@pbarker.dev>
Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
 CVE-2025-66471
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org, Peter
 Marko <peter.marko@siemens.com>
Date: Wed, 07 Jan 2026 11:48:36 +0000
In-Reply-To: <34083b26ca1e5a52c627e41a1adbeaacf79dfa6d.1767772757.git.yoann.congal@smile.fr>
References: <cover.1767772757.git.yoann.congal@smile.fr>
	 <34083b26ca1e5a52c627e41a1adbeaacf79dfa6d.1767772757.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-5DZpNiz14dTgH430mDgg"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 11:48:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228993


--=-5DZpNiz14dTgH430mDgg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-01-07 at 09:08 +0100, Yoann Congal via
lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Pick patch per [1].
>=20
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-66471
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../python3-urllib3/CVE-2025-66471.patch      | 930 ++++++++++++++++++
>  .../python/python3-urllib3_2.5.0.bb           |   1 +
>  2 files changed, 931 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025=
-66471.patch

This seems like a very large patch for a CVE issue. The changelog entry
in the patch also says that the API of urllib3.response.ContentDecoder
is changed.

We should look for a narrower fix, and only take this if there is no
other option.

Thanks,

--=20
Paul Barker


--=-5DZpNiz14dTgH430mDgg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaV5IFBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0brxNAQDzmMCQ66suuX7CBTDzHNtddCfXN89ZWEpc
aA1jwzH+NQD/as2F2W2tnZVJVfGTfI1V2/H+0Pm75CaQheoxVt5vmAM=
=5Tef
-----END PGP SIGNATURE-----

--=-5DZpNiz14dTgH430mDgg--

