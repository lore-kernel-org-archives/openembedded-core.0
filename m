Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B42109024D
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 16:05:13 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14887.1773936305571711302
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 09:05:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=ewy0qvRQ;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Mu5iS/c5;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id E155AEC010C;
	Thu, 19 Mar 2026 12:05:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 19 Mar 2026 12:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773936304;
	 x=1774022704; bh=mWkrAAkKIBNarWc59V+OilYKwqxsoABHzJ4Jp8dUms0=; b=
	ewy0qvRQIRZuB8KZvCTnbJbaRpuwdEDMG9Pyslpc6RbiTGnGy9Uwxi4O1Nz9dGDH
	d5/KfgqU476ron3UCI5tLyot5E7biy7BMNMFL1jyKP1H6Aznw9qIHgt9oCtBSgqd
	vesPGh3TsNnlXt/4YT5ocWpexJ9yfQATFY+BjpnHVsggWEIW5WKlsVGWPTsP4/B3
	JaC9X0eDWmNAme8Ekk0cQoz0+Bb4kATHNsNAvx2Z0E7u5BACf5Dqc4kw2sr1w0Iv
	+X5cw8LAa1PQoVVAnBW4XalFvePPytkQf464C4skLU/iU9pSnanCx20EYxlG8GHJ
	fEmR6zw2UqvT26Hf80bc3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773936304; x=
	1774022704; bh=mWkrAAkKIBNarWc59V+OilYKwqxsoABHzJ4Jp8dUms0=; b=M
	u5iS/c5g2ZT0aKvPSaq4w6ek3gYNDnXClMC90wq5OxOIoIgji7ocikWW9dpE2eBJ
	adwt8ecR7AtBJ6AOb3ITKqFB43+lTVwRrmkWIeITYwBGRRDRsLvmTj9BRud86PtY
	M9ecQ80/6m6iUNK9bT59VEixxqqNDIvy1vnBw8k/adGyTcgsvVeHy/Btzs2uhZ/L
	kGnwQOag+6jkP9IK+2y7XMbwFBXEFmZuZ5wBW/W67JGPV9WWz3RyLh3IeVK+KhAm
	xCTwTMScHmEOhpqN9KSfGtxyLgFJXu1yFeB4tV5zwGtTrGRRbjsZ/Kb3cuCl/d9X
	3bP7dyy1yfDvBx6/8F5zQ==
X-ME-Sender: <xms:sB68aa-EI8_5E4LnNsX7ot6uz_PGnocZyvF1VGC7fsbqeXvq7H3TmA>
    <xme:sB68aQtYPAcIXIg9E2Hf8DSV48JkQIVrUkdE7vzxUTa9bzql-NEjtrQ2l0YYqjAAX
    sqPzV-MPrM8KNY79SLsdU1KQYnqy8pIoVEwu9XNO6FjyETU1ImMoIIV>
X-ME-Received: <xmr:sB68adpUODRaeJYoza0OlNSMOWNdu2bLtPJ6mBwJVyg8aN1QlGnX9PHoScVAQsPd8yN5K4TYORut0_E3iZwhWVbfxakWv6I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdejgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehophgvnhgvmhgsvggu
    uggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtph
    htthhopehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:sB68adlFCkU62vcZNsE6Nmu9nqnyMKAN_1OEPW8ElRNYgY_wClukwg>
    <xmx:sB68aRwx8xtueeKu1lTkDUuRGrwjrmm6i_H81cRY4NAyzD6uW6to9w>
    <xmx:sB68aVn8EpDkMZsGx_EEou-bkzfZ3Z4Zrfpom5XLbsuJJEjv4MZWoQ>
    <xmx:sB68aacabhI3nWSV4h3VpCiN5xuUqPPzENP3M1yyXmKgDVWuukKJeA>
    <xmx:sB68aWg3ZMWL1l3nAgsvCyKP9v9_Abrd9OF9hegfFVJgWZzo4LjP2cxt>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 12:05:04 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Thu, 19 Mar 2026 16:04:43 +0000
Subject: [PATCH v2 5/8] flac: Use arch independent search path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fix-checklayer-2-v2-5-38ffe8df4c28@pbarker.dev>
References: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
In-Reply-To: <20260319-fix-checklayer-2-v2-0-38ffe8df4c28@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=vTmnQPcwA/m0OTkn5T/0aBJqtGlpNDV6RGvKnnGC0bI=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTukVupuOrRbc5/fc/yfj9Y0mH54XqacUrujGtbJinLe
 x9Ypie+raOUhUGMi0FWTJFlc8/X+097HXkzQm4pwMxhZQIZwsDFKQATaQxg+J+hOGmBjoWXT8wS
 U+52HYef0zb0zNql4VYTvimVufAdmwFQxZItLJXljVvFD/jXnX8VK5jT5VC/4vaZvzXJJvGvNBo
 YAQ==
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 16:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233539

The value of STAGING_LIBDIR depends on baselib, which may be "lib" or
"lib64" depending on the target architecture. To avoid making
PACKAGECONFIG unnecessarily arch-dependent, we can use STAGING_DIR_HOST
as the search prefix for libogg instead.

The search prefix is necessary here, removing it completely results in
compilation errors.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-multimedia/flac/flac_1.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/flac/flac_1.5.0.bb b/meta/recipes-multimedia/flac/flac_1.5.0.bb
index e227133ad794..2f43b4e84b24 100644
--- a/meta/recipes-multimedia/flac/flac_1.5.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.5.0.bb
@@ -34,7 +34,7 @@ PACKAGECONFIG ??= " \
     ogg \
 "
 PACKAGECONFIG[avx] = "--enable-avx,--disable-avx"
-PACKAGECONFIG[ogg] = "--enable-ogg --with-ogg-libraries=${STAGING_LIBDIR} --with-ogg-includes=${STAGING_INCDIR},--disable-ogg,libogg"
+PACKAGECONFIG[ogg] = "--enable-ogg --with-ogg=${STAGING_DIR_HOST},--disable-ogg,libogg"
 
 PACKAGES += "libflac libflac++"
 FILES:${PN} = "${bindir}/*"

-- 
2.43.0


