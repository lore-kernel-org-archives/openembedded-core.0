Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0334EE20A5
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 13:46:42 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11887.1770385601860270532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 05:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=cTXWJaxd;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=dAUNdxS0;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id F2BE4EC0080;
	Fri,  6 Feb 2026 08:46:40 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 06 Feb 2026 08:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1770385600; x=1770472000; bh=O6WbRPmld9
	bjwyNpagxrYGbMdf6eKZyUrg3Dp3/bZWg=; b=cTXWJaxdWdK2jlmt5lx+nJrQ+r
	RfQSzYZgPeQ0XcOfT6CQRXOES9M4DW4fEtQ9JUNVCVY9jR3/LIuKQAskt/9a7tja
	CiOae88h3fsq3VpNuAn9dpwOC+EZZ4hddAL3iFwymp7fD2+KUwvjRhRA/Oh6M4LT
	cxgWyDmuMO9yiMr4AWJQhlliJhr0r9ww4aInLx+SoRANxmIjuGV/1cvLLc5D4s+L
	Yerv+phhQwz2ggZ+x1YqZpV7bj+q8K2tLIEm7uzUi5Va2w4ot1fNRb9ZcL1jCaLy
	HwsyFqx0Qs5cZhtLy75MgzoDjQ6AIfryGzpE9bvfK99zpYNKCos8Y5PsyPeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770385600; x=1770472000; bh=O6WbRPmld9bjwyNpagxrYGbMdf6eKZyUrg3
	Dp3/bZWg=; b=dAUNdxS0UkGYnbpEtAcQtCQ5eh9qWwJn8PcWI/Et8JOupIT5iwA
	JseW4Efj+asbSV5thaSL4z6pyjo8tkhwqnsLzBnxCNCrB2y/LX5yCWjtLQLPnwwx
	LplOgkR8FkgXS/g/KlViB9q4zZpqQJG3bwmoVajvkDzx1Cix3fpWdOhvvW4Euhfe
	HKsss+NVjnX4ec60OXA4fKgXNB8/n++dKS7bX+fXQwiTMFa2RnGguqBqayQI746b
	6b5Xns+VkNyTnl1gGB1pruK4m2J2VvoFMOAjEhztcMSUrfFoaF/0r1rka1ZsZ9le
	62ZCwaEmCrRMHhmiNTrwTT5/wVkExst9DLA==
X-ME-Sender: <xms:wPCFaUW8vI--Kv8CUGi9bRXkHPjH_IEAcgT_-u2EauwKiu-VeARZ9g>
    <xme:wPCFaQAf8Ntaj7l0GdziBHWCkjAhGgoh6EgJilcwN-pS2al7_N-3c2AGPtDnZkxc5
    blNgwKMRw0f7dcPnMucgO2a5sF4_iLIYhkjJs3YvmH7BslunU28Rg>
X-ME-Received: <xmr:wPCFaVw7lSmPJniguwfAmfdcwzoffhld2thrdZMM2m3c4way-Tpajun5gLzYaKdjYkgc1GkTCuGdZBM2ScxEjXWJk6mi4TwlTTW5Mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukeekfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epteetjeeiheevkeeiveellefgveehhfegieetjefhtdejgfevfffhffevieffteeknecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdphihotghtohhprhhojhgvtg
    htrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeefpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdr
    tghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrd
    hophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrlhgvgieslhhinhhuthhr
    ohhnihigrdguvg
X-ME-Proxy: <xmx:wPCFadBxeTHzTh5ZChcMLlN_91T5S8cfqgO8eHTkJlDbn3KKsGjShw>
    <xmx:wPCFaSbRF-N5CrKuf0EajODo9K7uXd4C-_xYlZ3JWA9Ew312sV_Fyg>
    <xmx:wPCFaViypeTM4xYqJFvzpWZUi0tQeOFt9dJhOkm7SByyqUVWnC2Rdg>
    <xmx:wPCFaU4Ju18LasDdYjAOGfPx6p2Pa3f7AK5jXR6MCYaqGbRopFMfgw>
    <xmx:wPCFaUCJ2nCtuMvdeWbHwP_9CndigJ4_sv-i5JuF679zX1THIohkq46->
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Feb 2026 08:46:39 -0500 (EST)
Message-ID: <61610acc7cc5dc3742ea4dec5f1280d226d2494d.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] hosttools: force a --no-rosegment option if
 host ld supports it
From: Paul Barker <paul@pbarker.dev>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Fri, 06 Feb 2026 13:46:33 +0000
In-Reply-To: <20260206132811.100628-1-alex.kanavin@gmail.com>
References: <20260206132811.100628-1-alex.kanavin@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-j3E3ut3Fvcql5OSUJlAy"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 13:46:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230621


--=-j3E3ut3Fvcql5OSUJlAy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-02-06 at 14:28 +0100, Alexander Kanavin via
lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> Please see https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16087
> for the tricky, unpleasant details. This is addressing an issue with
> recent Fedora distributions where they can contaminate sstate with
> native executables that don't work when transferred onto alma/rocky 8/9.
>=20
> [YOCTO #16087]

Hi Alex,

Thanks for working on this, we really appreciate the time is has taken
to investigate!

I think we need a little more detail in the commit message so that it is
understandable if the bugzilla data is ever not accessible. Perhaps just
something along the lines of:

  From Fedora 42 onwards, the --rosegment argument is passed to the
  linker by default when building native binaries. This triggers
  re-arrangement of sections by patchelf, resulting in binaries which
  are loaded incorrectly by older kernel versions. These "contaminated"
  native binaries end up in sstate and cause build failures when they
  are used on older distros such as AlmaLinux 8 & 9 or Rocky Linux 8 &
  9.

Best regards,

--=20
Paul Barker


--=-j3E3ut3Fvcql5OSUJlAy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaYXwuREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bhOfAQCj45kA4FEFCyuopoD7l7/SW+QWvxFNcWRG
OaebDcBscQEAhXgZrJRExCMIjLalTC3LaKRqPGpkKjEkrJREcIvByQI=
=fxW0
-----END PGP SIGNATURE-----

--=-j3E3ut3Fvcql5OSUJlAy--

