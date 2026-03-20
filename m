Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFF41093190
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:52 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8152.1773996276810275284
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 01:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=0iWZkeOw;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=f3rpphcR;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 00086EC0103;
	Fri, 20 Mar 2026 04:44:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 20 Mar 2026 04:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1773996275; x=1774082675; bh=p8Jp3yQZh7
	4poOUXMG22FrKxhjhLdjTW/FZSrAPugTg=; b=0iWZkeOwahYtAnjfV3dRvfJgr2
	I3LSCt3C0XmhOWFFsZl3DTGcZFi5Yox8EZwO+T1PFWBkpfv5y4kL/h/fv5AHAOkY
	Qz0XsF/ovX61vcKp0EAp7tlhZGxjDpxHRB6vHGyFCKPJQUyFoaJKeop8fLe+2lGX
	aoKrfa5tvioLDs0mvxkruLRmkH8tKtjIKwdoBYV+/9qAKc5Y5FyhI53tuZVk7bU7
	5L8MruKZ6/n56LW5JsHTE5OOvSNxdFyJgShixh0+eCqCovCw5lgC/4SAJw4goJfG
	xpp7eVX9xIzeo0dVutGE9FhLcoHB3fSXpJ4W40spf3rvLVeQm/Vibw3l9Xnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1773996275; x=1774082675; bh=p8Jp3yQZh74poOUXMG22FrKxhjhLdjTW/FZ
	SrAPugTg=; b=f3rpphcRQFTft7mV4AaeQ6U6TWjE/2aL1FIaMHdUFn0/LGzhE4v
	OURGfn5hk9i0t/yyiZoR4VEcfUIG67UONgleZgnViPGcKBahOlLCgmRdXSQyPGjp
	QS9EBzLVeMExhkgIH7+IAJXKrzpiYVBuBJ2LlT2wXSUecPGKHN9o1s0LBKPG1Xrh
	cWgjZ0UycwzCVnujTjj7zK1mJA7005gN5S8YA8qVfz0JNdmoLUHLWEtbjSClzyoa
	QxYCUY6vx/DNnxVO6zIStpxOV8N12s6vlEjtBYlP3zR85vdIkGDfusXtkKmPa7Fy
	Db+uYyKDJ0o78pFc1o+7+EcAbz5MW/e0NUA==
X-ME-Sender: <xms:8wi9adinDWoZATKuy01tszoBtk8xv3ayPmNoKZUsJziSA09caK_6FA>
    <xme:8wi9aYAmUFAF3iYtLKmLrbeHpaztsKAU_vnW3ebf1MJUJW-kAjaE4IeNLSL3oYbQ3
    AGi9UUBQRu3G-0hb18i8r28asUnPUeI41zMLJ4uMY6ZrlVmuj99AvI>
X-ME-Received: <xmr:8wi9aataAOdrsX_apA9AU_SnYVtins9JFEknyhbRHJmYeBOdD_WcJ66YhsF09TJevLbc3LtFB3ws0mTqE_R_ceJ_4pjrE_LjVj4pWdhCXIWD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdelgeegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:8wi9adaFGrSia9IaHu_03hcFIJdOYUAIRdgNElmX8mQXvsSK9j2lvQ>
    <xmx:8wi9adW9l2Jfg2og9uwJHPJafP9uWyFJUzElnXDB7ZiZbNVgmyxZ1Q>
    <xmx:8wi9aR4dHaMAZcgFZsKvdN8QslRtofgrV1ZyVOM-8lkowIGPZIEXnA>
    <xmx:8wi9aYgMy1Lc7_EjsTNXhqDm-ivjcuiwMzdNzQQeg8m7BUjDw2SaqQ>
    <xmx:8wi9aY4vzNVOntHIhNkOC1CaGKg21gtBTLDmX9xwNERUswbxSZzNjUTD>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Mar 2026 04:44:35 -0400 (EDT)
Message-ID: <e21ff2f9013d561713ae3d17c75f3e5a41ae4b30.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 01/15] inetutils: patch CVE-2026-28372
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2026 08:44:32 +0000
In-Reply-To: <ed976c159eab45e6ca1f8e1ba73c5872818e80d2.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
	 <ed976c159eab45e6ca1f8e1ba73c5872818e80d2.1773966414.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-zphBxXuVU93mxjFh5pa1"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 08:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233588


--=-zphBxXuVU93mxjFh5pa1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-03-20 at 01:28 +0100, Yoann Congal via
lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Pick patch according to [1] (equivalent to patch from [2]).
>=20
> This CVE is needed if util-linux >=3D 2.40 is used which is not the case
> in Yocto kirkstone, however it's always possible that users update
> packages in their layers.

s/kirkstone/scarthgap/

Otherwise, LGTM.

Best regards,

--=20
Paul Barker


--=-zphBxXuVU93mxjFh5pa1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCab0I8BEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0birXAP9GxX9wRFMz9mi+uEIA6AthxucH3zFmC8YR
Ojr3B8kFfwEAkVIa52WGcCLoP9VwN+wqcRDXlzc5GusCQhEXHkdFGQc=
=tvzP
-----END PGP SIGNATURE-----

--=-zphBxXuVU93mxjFh5pa1--

