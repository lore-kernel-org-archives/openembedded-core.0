Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E7A10775F1
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:14:57 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19682.1773854094300536180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=BAmsJTj/;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=q1Q0+me/;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id A7E0FEC0143;
	Wed, 18 Mar 2026 13:14:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 18 Mar 2026 13:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854093;
	 x=1773940493; bh=8UtHRRtSss4MeThBKtlynCBJ5MeDdHs/ajUeLWYbZgY=; b=
	BAmsJTj/GG8wfxzgq87QQx9T5yi7ZkdYg3QfAR6KPBW3+PiSgMF8oq+gBBzsPlQD
	ImFkE4JvK4nsNPWhev46y5/2HrNqx11SWfk27hVynb5ZXK/GDcZCcyBdnTgjZrvr
	QS1fDq+XKoOYqDTp9w+hgtywJ4KK/Cb7TrXiCy0YcjBN8fFWPnuWEgKSlqYPzTZI
	lvV/KPD3COeJUWS0h73bFgl1uOpbzqewdj+ehrFHUkIDo0uG8Yl1rd/nz079fdZ5
	NwTwMKCKKiDry7M3/emdOUDB3qEjK/Hm8Y+JE1yw8UHtuqCTSl55EcYROptstPc3
	GertTIWYckqsvuKGuJAU2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854093; x=
	1773940493; bh=8UtHRRtSss4MeThBKtlynCBJ5MeDdHs/ajUeLWYbZgY=; b=q
	1Q0+me/XLJp4GayrtJLCmZ/t4EJD/LUeSuBvJFZCiB9vZuNrvvsrFvAfLw1UjVMO
	RBXSjVRvOc7JeO9qVckTaqIlan2LgrzBJr00ZY0EdpFefhi8hqpHhhl2mTpBC3xO
	aR9pqa7uSdlo/4b+jdSmJVdQJ2a8OPNaYq2/3tKkdr2AwbKty93hLJbAm09xAvdI
	v1zacy7AHe4X+/tbrWneBtyi2gOfcmSSQE522S8LqoHrhQM76dU4rwHKHkmwiyV+
	N07M2EhHfOEakkMGgPXIoKLyrabCVsiqyS4Y/rrDu/P7YCcGsScRlluUis+nmjdN
	Xw8hgjHlKKLWQ/G7soF8w==
X-ME-Sender: <xms:jd26acsLktJnc42J_TwnqTLgzk9xWa_SDrCBCTCwxyJ04-8FyH1GhQ>
    <xme:jd26afcGf6BDMvWy-BUFz15T5Y4l7pgVJh8Iq4SM2RljlZoKrsQEIfwznRqUe8sDk
    E0yRmIDg_OXReN3oSFkohn3AAKLfb-5F31BerHZp5tFpx87eRFZ2Pg>
X-ME-Received: <xmr:jd26aVbXVEirmoeiihFL9MtMLcpB7wgrkG61LqwFhBUVoJi-EtEk2lAsH08_pSwmWhxNIZX_efetn2L-KhoqeYdwI_t8tj4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegjedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejre
    dtredtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgv
    rhdruggvvheqnecuggftrfgrthhtvghrnheptdffvdffjeevhfelieegudfgieefleefue
    efffelvdehfeeviedtieeukefhleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtph
    htthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghr
    khgvrhdruggvvhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlih
    hsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:jd26aaU8uUS4AtaaRlAyniZlNw0Tsi3u45Q4n8vbyggeKAoXnOtgXQ>
    <xmx:jd26afiNPZeyEkBDVlPkTnJSFmwd_BpdiGlkYtYr3zMSNQHKPUpROw>
    <xmx:jd26aQUu-kDSYBfS4QNfgiGauGgbaDFfY70GwJ8spubRjWEmrPl9kg>
    <xmx:jd26aePIDg4pms3F3oeYmHXNVWnrGWzyok6NEvcSenYhRYh_wOa2UA>
    <xmx:jd26aUQyykQM7qCwN6lM71Qvv9BRl0x4bYwRlhTS4Bm9YRJL-pQM6Gqr>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:53 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 18 Mar 2026 17:14:46 +0000
Subject: [PATCH 03/12] ghostscript: Drop arch dependent search paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fix-checklayer-2-v1-3-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
In-Reply-To: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=JrFe1SEDCx078xu48Eaxtbyc5jYJkgRswOA6cZDQbFo=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTuutvZqJP//sUva7fpbkuXp1zeIlrZPD9C8+iE8v1Lz
 qqyMZ2c2lHKwiDGxSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJ3LzByHB71kXPrZ/dmi80
 +105kTHnrE/UI2V3t7u/jNq6/BdvPr6TkaHdxTzznMyxkpMbmKI/2d6Qf3VW5fNCR448J3Pp1b1
 7KlkB
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233420

The value of STAGING_LIBDIR depends on baselib, which may be "lib" or
"lib64" depending on the target architecture. To avoid making
PACKAGECONFIG unnecessarily arch-dependent, we can use drop the search
prefix for x11 libraries as the configure script is capable of finding
them without this information.

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
index 4cea89843283..b0951d79f5f4 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.06.0.bb
@@ -33,8 +33,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
 PACKAGECONFIG[libidn] = "--with-libidn,--without-libidn,libidn"
 PACKAGECONFIG[libpaper] = "--with-libpaper,--without-libpaper,libpaper"
-PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}, \
-                      --without-x, virtual/libx11 libxext libxt"
+PACKAGECONFIG[x11] = "--with-x, --without-x, virtual/libx11 libxext libxt"
 
 EXTRA_OECONF = "--with-jbig2dec \
                 --with-fontpath=${datadir}/fonts \

-- 
2.43.0


