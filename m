Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B124D74EC2
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 12:53:58 +0000 (UTC)
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66805.1769172833114960847
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 04:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=OibKO60X;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=RCgkLgWd;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7DB277A0155;
	Fri, 23 Jan 2026 07:53:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 23 Jan 2026 07:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1769172832; x=1769259232; bh=4Kz+uKqB7+
	qTvlB1wBpwkNc6dyLUwn/6p+npKsr9AyM=; b=OibKO60XsW09kQSlZ05gTmbrsa
	JsFc9NxbYaWgAeznG/1K03vbPosP4R5WvVTfMn9R2hxRfbfudPNl8FqXI6go1rFm
	i2ue2hVjvBdoCxtn4ckiPyXo57w4QtJJMfVNFLxnrI1lZ1rIkbWfyCXbo9UnTlmt
	Uxak/9oslkIxGU8Mh+pmGj7mQvo9TC0cq7N7yImelAZgUIUag8UCJFB8Ax7gO1Px
	zB+EEJteACmj5Oh1M3ioQ7TipoL8zZ4WjKsFSsTCFdArHhonm+yMoowZB4tE32/7
	fyijLe+3eQToN0nkvrlojJ94BrlvM3VbzuGozvvrQp56vKhnKJQo92bwsdTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1769172832; x=1769259232; bh=4Kz+uKqB7+qTvlB1wBpwkNc6dyLUwn/6p+n
	pKsr9AyM=; b=RCgkLgWdwRbwTU60fcxPyjKWIjgLYkQXpsBxm6JFSS9GCTypWCo
	kxNjkqWfbU4E97FMk0GOjY6HWvBUXyYlWCeWbNMJ+9jqgnbXc8JvSlHSGCglbpjg
	ectn/+Z5/WJBTnyeXzTrnzMKhF70A5RrRHnlg80g67YbhxG393U7ZPxl6XPKBNLQ
	/JOxEzakAipazZpuLrO3+eEtrgSZsq9A0fMEXMmgVy1lmNfxxYG6U4BJ0P0qbJup
	7Uzz2McvNiQMzNRI1A8jMfYP3/S3zm0DWz7++53G+kZo8CULBNSMKD8KOIlhu9Cp
	L1F2J2S4GQBZrlbfn+su0BTeRz/7P3X8cpw==
X-ME-Sender: <xms:YG9zabpbrNGenQ-bSZsJQnNJDkxEiq3f5jySo2IYWV-pxZ2l7h5IWw>
    <xme:YG9zaTlzHiQvKJG_fX8YTOeod6u-AQX3Y_Xp-w_gtsOWrKLaVAfiBwn2BjmuKnzd-
    pEQQmTDbUBrwBufJ84uDpAA6Gse83KxWgl8FB-RrGMH5tuhym5_oUs>
X-ME-Received: <xmr:YG9zafzCzkxKHH5ekUCejgxIcVYe2pho3bI45687JvH6VGvC_x8zvMXZmSFxTAs_Xz9RoZPjaUWBeRSlIFqR4YkD9pzD59lPkxjkBRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeltdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepgeefhfdutefhffevheevkeejhfegffegieektd
    efkedttefhuddvffeuieeiteffnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepughmihhtrhihrdgsrghrhihshhhkohhvsehoshhsrd
    hquhgrlhgtohhmmhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtgho
    rhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:YG9zablYH10G1AWMVTwsYXMC1al0M7vclpALZFnrZ7VLAjQgcPs-DA>
    <xmx:YG9zaYevL-QbmoB1NHYsFAsQxILgEZ3SxGlDNfuOcLN4HpfWsB7fKQ>
    <xmx:YG9zaRr-RpQHkUl7gDEkmv7ilucBfURyh18iPjxEPE_iIWpxvmyh7w>
    <xmx:YG9zaW6V--qJcRrNuxsASPtYBXPf9h8hWWrF48P9JnNSyZDd3CJcgg>
    <xmx:YG9zaZvTT1EATgaHX0sZ_I_tMmgM4nvDNF4qjdKMrA1nJ0hadDIvCWdA>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jan 2026 07:53:51 -0500 (EST)
Message-ID: <b83b668e61d0189cc1df1569eb39982bf0565a7a.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2] uki.bbclass: fix building of UKI images
 with multiple initramfs fstypes
From: Paul Barker <paul@pbarker.dev>
To: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Jan 2026 12:53:48 +0000
In-Reply-To: <20260120024313.3467088-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20260120024313.3467088-1-dmitry.baryshkov@oss.qualcomm.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-ZmLdZTuefWvvaZx3CVb9"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 12:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229886


--=-ZmLdZTuefWvvaZx3CVb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-01-20 at 04:43 +0200, Dmitry Baryshkov via
lists.openembedded.org wrote:
> If INITRAMFS_FSTYPES contains more than one entry, ukify build command
> will fail as INITRD_ARCHIVE will contain extra strings. Use only the
> first initramfs type, letting the user to specify other fstypes in
> INITRAMFS_FSTYPES.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Hi Dmitry,

The implementation now looks good. The commit message needs a little
rewording, we need to note that INITRD_ARCHIVE is now gone so that it's
easier to notice this change when we're compiling release notes.

Best regards,

--=20
Paul Barker



--=-ZmLdZTuefWvvaZx3CVb9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaXNvXBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhC5APwLtFmMsGJvb37CpEqK7xer1A7YfZmQ2+OF
fDv0aLeifQEA6EjpoORyd5gG3dRdahuuaOk+GWZp06Bn/z2dsX69MQ4=
=jkSr
-----END PGP SIGNATURE-----

--=-ZmLdZTuefWvvaZx3CVb9--

