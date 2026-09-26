Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906F1C98332
	for <webhook@archiver.kernel.org>; Sat, 26 Sep 2026 13:32:19 +0000 (UTC)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19455.1790429538549425593
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2026 06:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=PintzCTf;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=gSb+5tHq;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 862FA7A00B8;
	Sat, 26 Sep 2026 09:32:17 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 26 Sep 2026 09:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790429537;
	 x=1790515937; bh=tAHSTPhQ92RUrc/v/pi3A44qoPLxWehVWMW2wHC5cNA=; b=
	PintzCTfPk8gU4in6j1jKa38P41p0zhSIfZnWEffDXTtVZrkV9w957gIbsUCAk+Y
	pMBq9RC8i4+gyGHv0EZjcFCBa/8gfzIEj8of3nNlqrk7MPMlj/Hy8HNNBzo9yWOd
	XZLaMjwUYBkEnAdDUA/z6HV/kPG92u4N+KBXWM0fBVgybWjiz/ylxxAz/RtQVhl4
	cTLuzPtoJwbnved4hT7R34+GgKK9MgirsT6tcj8x6UCAIQmFoCE/TConDN32tbLs
	HGLzNaDHkPceUXezJJPAqVkc0sCs4FdnwkZa5XXTNu0FZbPY8RJ5eP4UrhTKyTav
	La0JhA57EXpzqb1sWJszzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790429537; x=1790515937; bh=t
	AHSTPhQ92RUrc/v/pi3A44qoPLxWehVWMW2wHC5cNA=; b=gSb+5tHqHoyW4UZPb
	ICAPw4kUg1m2a2R0pKF3g8xditp9QSRxYQkeXn0KJDMyWZOIvjhJRBV0XQYUtFf/
	ZAF99E8c3Q8k3ohRf+6ec4Ei9j3AO5lcZFZzUQ5SiYKFyNY8w4DOSss1dmCNVMM6
	eVgQSVz/O+a5Zw0qLA43ILdwlOVeR3SmdK/pTZxmigtd9ea/Om0bVJQrdOeLGA8o
	5b9DcO43/Yhu9QKNbqN+2cBlOySas9s+/B8xNFweNw5dgGBe7AIhI9g5b+kDusFZ
	SzS+OteeJ6bjcGXw4hpQydNdfvWxJuoaf8W/Oxby8we5jxFDH7CYn7G1WqbnwGTa
	eD2Yg==
X-ME-Sender: <xms:Ycm3alupCzDWMXp-QGfymqOm011b4StsJhnVzptAtJssufoZAKeQww>
    <xme:Ycm3akd9ltGck1wGQIiNeKbGzY9zE2XnC0PnzSGwKCfA0dv4GpbnI4WLc-Vshom4A
    M0HXig_UNUaTP3sJBR8d-wS4hrxiBuijdLQDASSiZslmMALIPxQw8_u>
X-ME-Received: <xmr:Ycm3amYXXrUA7dqsCBcrmRg9wsc_O6ucscbORiwjjNaobKGoMnxm_6JjKj8BMfuHviqeUfPLit2qJugIccWloFvaLAdmAstt56K1rd0>
X-ME-Proxy-Cause: dmFkZTGJSHR/W0AlksrbGZfgIdiMBG7K4o/1RetDIc5GcKGCkB+ycPFQ4SavH+SyimIHgE
    I+xHOgeaILZ4pfQYGIZveM5tGu42menQzTgOrDaVM+2WLCotD58AIMLH6fJkvEqUBKP62e
    4SQwqlE6hwG+9NBI4f4w9uYG540zZM/GKrMiU++/8XAxbB2kjOb11ZeO8BEPTN+pJ9fYNc
    oGvHC/xdKlQhhl2nCBo2hne8Q5cVuoVo+8SsVpuhAuDX/2/3ps3czaj3pZo6CF7JA/2mfR
    J+Nw6ti1rQBSOmqfHqsaDTFGKivAuNhbTe06hoKy4UNXLL5LM32AdTQmvQLEH+qR7olkHF
    SDcFon+pt/z3af+dH8frDJK0r+QFEbUbPAw+1+oREgKwhBSZHacaTfDNjDLfX9StwxLli4
    Cg6ilIJOXjQLSBXiPn8XCRZZO+TcziizoXV7mPRktuNw2nS4dn4NuBOE5BMsydS+bX6EUj
    b5if5A8enX0BoGmPggN7vT1yQX1eRyNjIkfgQX0Dv8zmeFUaoNpnKEUqQ9q8E68BM3Kc98
    0d/WlsdLh3R9CLlkIiDKjURp9ib2L/cnaNktecTl2BUU3bZwL48qd9tG17FN8p6OdKrmte
    RsvekgBL2pTTMA5dH1/OBl8qpnsymM4IPv1hYTLf14Puzy8ZaO3n0j+ep0Ow
X-ME-Proxy: <xmx:Ycm3anXj9-8q4yAOegXlWYrMoqAk6i3RV3FqwwOPrMAlYNPNuOtSOA>
    <xmx:Ycm3aoh0ifKp2nf-zzWWOC2NfVE9Q1eG9JzzjzJgApOA9kheE7Hm6w>
    <xmx:Ycm3alW5ML6kCFGSLC0fzNxBdY5yvIF7V2MFNUCFDzV-R-jgUijT8w>
    <xmx:Ycm3avP5MS2GmWy49qkIZA7EbA8GpFtx-bcEglfGCxYGv3GkQW07Xw>
    <xmx:Ycm3arODH9MuxlWisG7hqOk9knHxlXigaZMi2zVipz1dRRXJe445_bwo>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Sep 2026 09:32:16 -0400 (EDT)
Message-ID: <361c6ebcea7d245860adc042073ff99c397262a0.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] libpcre2-ptest: add testoutput3C for locale
 variant
From: Paul Barker <paul@pbarker.dev>
To: Bhavikkumar Girishbhai Ronvelia
	 <BhavikkumarGirishbhai.Ronvelia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 26 Sep 2026 14:32:15 +0100
In-Reply-To: <20260926100814.2640444-1-BhavikkumarGirishbhai.Ronvelia@windriver.com>
References: 
	<20260926100814.2640444-1-BhavikkumarGirishbhai.Ronvelia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Sep 2026 13:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246635

On Sat, 2026-09-26 at 10:07 +0000, Bhavikkumar Girishbhai Ronvelia
wrote:
> Test 3 (locale-specific features) fails because testoutput3C is missing.

Where is this missing from? The upstream release tarball? If so, is
there an upstream issue and/or will this be fixed in future releases?

Also, where does the contents of testoutput3C come from? We should
document that.

> The fr_FR locale on current glibc does not classify extended Latin-1
> bytes as alphabetic, producing different output from testoutput3/3A/3B.
> Add testoutput3C matching actual glibc behavior.

Best regards,

--=20
Paul Barker


