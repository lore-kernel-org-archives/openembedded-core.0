Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E321CD4F24
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 10:08:36 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4216.1778666912635123374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 03:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Ca1pqp17;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=B8Jc7Ok6;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 9732A1D000C3;
	Wed, 13 May 2026 06:08:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 13 May 2026 06:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778666911; x=1778753311; bh=2prGRk2BJD
	5GYWh7OOGzYloCTNPuvQZ/vZLoxq1VbOw=; b=Ca1pqp17dJtA07cUyk99XHrpWM
	bCQZNfut9930ts8u0aKiHnaTjOJpkAbA1zT1C+equRTwLtM/kroJngMjQICMVQpb
	QvJk8slrlIutsnMLQfqgXEDedOF9NsfMN+JPBNxzqtu9N68SoaioZy+MKa8KRHfe
	xtIg/cZ27Lq5Gt7IsOkcknuySC+PIpbPm/tbQsQwa9KGMbHWN/13Wp6yQLdF7Hp0
	cG7zvmHnXt6+Xh3p278WsBTMYvK04DxnBN8nDeKhRkc4lyO0Z8k/tUZZ02/TLtjt
	DfWdW9huyxgaCoovOXjADRSvPGr4wfW6pZD6bAEq4ofjqTMcf7Rx2UDAUxDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778666911; x=1778753311; bh=2prGRk2BJD5GYWh7OOGzYloCTNPuvQZ/vZL
	oxq1VbOw=; b=B8Jc7Ok6R2+ac8jMONkjwspwPcmndBrqH/SX+yLa+SkI50DkIMz
	s9l1Aw3WFcDoqDL457zw5LUsju0npU8KPd8Z2nT6lWMzcBLEQUIBbW3jK3mMNk1f
	bLkYCJxaIWNwL3vJloCF2+ihsie0O0iPZ0BxMLCGP+KDFgz/5iu1iqgrH/Pjmtc/
	TIGnR3hoq8T4UJcCEygXE8NoV4BNHYFGd8i/3f3BbdXPFgDFwJqwRFux4UZELmtU
	NwyYqz//0KM+FO94viSKDj1e5aHepXWHcXlUZsxeDSHWdgJ9K/EhW4i20eWjn5ZX
	0BFLbnHpgPjDrufYjLLeA+YNR9c0MzbL3zw==
X-ME-Sender: <xms:nk0EasIVPnPlwarM-dGAyDoiZ1ItKsLYMKyadYstb24bGDHE1opDuQ>
    <xme:nk0EanGuA7Mx5ll-Fl9Z6zva6Yd02GlyNAklxgcLbvFefA_FcfE_yva8NDE60i2y3
    dNTbnX_wugEPLFMQswZsNdy_kvH1nG9P1mtSIuvAo-QN9i8yJdop9k>
X-ME-Received: <xmr:nk0EartCf2MYmEBpJL32tzOVBeCsNiH-0bJJarWuuARYj5yo-UTYAs8bj1dG_ajrLs9vIKzo8gfE2WEfqXu7w43FXHMxyt0hOFKlPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduvdegfeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epjedufedvhfehvedtudelvdeljeeiheeiveffleehffeftdfguddvveejkeehfffhnecu
    ffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggv
    vhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephi
    hotghtoheslhhishhtshdrhihotghtohhprhhojhgvtghtrdhorhhgpdhrtghpthhtohep
    uggvsggrlhdrghhhohhshhesihhnthgvlhdrtghomhdprhgtphhtthhopehqrgdqsghuih
    hlugdqnhhothhifhhitggrthhiohhnsehlihhsthhsrdihohgtthhophhrohhjvggtthdr
    ohhrghdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrd
    hophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehpohhkhigsuhhilhguseih
    ohgtthhophhrohhjvggtthdrohhrghdprhgtphhtthhopeihohgrnhhnrdgtohhnghgrlh
    esshhmihhlvgdrfhhr
X-ME-Proxy: <xmx:nk0EautvVWDYxTcQv3L6RJGPCEcvayuUGNbwkB9nBryE0iZWMxZ35Q>
    <xmx:nk0EahCl1agTYFXb1_KziG_1hqnhq5sZCVFG6gJAVQK230BkBgBg_A>
    <xmx:nk0EagMWs25oIfQs_5qF6hvI6CTYJAL3ysI5R4IJXyvox9uwhACJSw>
    <xmx:nk0EaqzlfzRRS-ehC3I7lIo5iDD3UvGCb5ry8POz0E6yhkr8LWhj4A>
    <xmx:n00EajlCBRU20rgvBsEDwpCV1s-Sq_WcdGPYO239fRc6tIbXnwU-8pM9>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 May 2026 06:08:29 -0400 (EDT)
Message-ID: <7afc1fe725bd4debdfd3fe22849d0c68ef62a54d.camel@pbarker.dev>
Subject: Re: [yocto] [qa-build-notification] QA notification for completed
 autobuilder build (yocto-5.0.18.rc3)
From: Paul Barker <paul@pbarker.dev>
To: yocto@lists.yoctoproject.org, debal.ghosh@intel.com, 
 "qa-build-notification@lists.yoctoproject.org"
	 <qa-build-notification@lists.yoctoproject.org>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Pokybuild User
	 <pokybuild@yoctoproject.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Date: Wed, 13 May 2026 11:08:24 +0100
In-Reply-To: <MW4PR11MB7029B0C4949D4E98A6815170F4062@MW4PR11MB7029.namprd11.prod.outlook.com>
References: 
	<0101019e1f289234-2033e3f6-4878-4f43-bfa5-332e58f449f1-000000@us-west-2.amazonses.com>
	 <MW4PR11MB7029B0C4949D4E98A6815170F4062@MW4PR11MB7029.namprd11.prod.outlook.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-j4et4q+EPbMMUZkTD1F9"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 10:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236957


--=-j4et4q+EPbMMUZkTD1F9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-05-13 at 09:55 +0000, Ghosh, Debal via
lists.yoctoproject.org wrote:
> Hi all,
>=20
> Intel and WR YP QA is planning for QA execution for YP build yocto-5.0.18=
.rc3. We are planning to execute the following tests for this cycle:
>=20
>=20
> OEQA-manual tests for following module:
>=20
> OE-Core
> BSP-hw
>=20
> Runtime auto test for following platforms:
>=20
> AlderLake
> MeteorLake
> TwinLake
> AmstonLake
> RaptorLake
> PantherLake
> BartlettLakeS
> ArrowLakeH
> Beaglebone
>=20
> ETA for completion: 25/05/2026.

Hi Debal Ghosh,

This build had failures, please do not proceed with QA until
confirmation is given by Yoann or myself for stable releases.

Best regards,

--=20
Paul Barker


--=-j4et4q+EPbMMUZkTD1F9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCagRNmBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bngLAQCmns/4I7VmTn6gJTSnRYTMOLOArYixvVAI
Whw8x4jIwgD7B7to9Ts1ds2maKQDqO7/EwmwPTpw4iKFqg9m/vGEEAg=
=3S72
-----END PGP SIGNATURE-----

--=-j4et4q+EPbMMUZkTD1F9--

