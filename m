Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BC810775F3
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:14:57 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19753.1773854095763727123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=CkAkEI8J;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=YkZ1OjAX;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 18C2FEC0143;
	Wed, 18 Mar 2026 13:14:55 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 18 Mar 2026 13:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773854095;
	 x=1773940495; bh=mWkrAAkKIBNarWc59V+OilYKwqxsoABHzJ4Jp8dUms0=; b=
	CkAkEI8JN+R9eiHYZIYxvsHsBqwczZcN88VH/zSqlyBsrfF8qGxnXSs8Ljb1n52v
	cHOmrGljCG3Xcz7a5rcqVGZW/n2e2R0q46fMEeLOx6fwIpISFoi3bpvknMk+sXSA
	6Yy5amF1FkFgT+Idy2adapQoSTW8dT9W550Q/nXxn9mWuQfJfF3LxtOXNKltWvNh
	pqiSaSIeBYFWrHw4Mlp7+9bGXjlhKFonUmeC2pQh5T7hXUDWPvMCs7TpYBEwD9ER
	y9mId/Lv7AhT08jOmq43hLrtwFH9D5g9ue42+mbAVWAiso4x1pa6RWHpToK5bXDq
	JA8tbz8BHH3MnXrXFlztsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773854095; x=
	1773940495; bh=mWkrAAkKIBNarWc59V+OilYKwqxsoABHzJ4Jp8dUms0=; b=Y
	kZ1OjAX8Md9WpNWUBLUyrkFZDI4WV2XA+bxILb+u06ISIjjyztZaUg2oS9kCm5Fw
	nPd3moTd5yidNoy7eBlmgvnGnJM97R7nqYEQkXebq2zki7PID/Vy+db6DlctXccG
	uSdTwlalt0qPtjJLHIy2wmGULi0MMQa9UjHQLOPYBrllosGc25Fzx/VUrn7rkDOr
	Vb5NGFBngDfW3cVXlTx4W462oSanilH1L+m7Qi4Q464WKh+O9Dk7oHVcM8NFPm1r
	GHeG27Kuu81J855qR4M4/yOuoqz85TrKG0IolIsJNthl4uMq5HsQleZaQf9KaafK
	WdCttSLODBA+FkUT17ZFA==
X-ME-Sender: <xms:jt26abHoIHvWAT18ybAKhkPxpZsRhPiK2WHMLDcLgccThtUjKRnnbg>
    <xme:jt26aeW40dfyKWxAk6oxEDpXlJeMq2vFTx844NDWodagVovDASQ6jQBLP0QmlbJPH
    wljUwgN7qcQXerEb-L8PW_HXjHmYwbKrWhLsCdca_3NwH238Il6mjE>
X-ME-Received: <xmr:jt26aaxtzo0iLSSOjMT7TNiuS9nAl7YRP4ZarNgWbDU4pZEzWhjaA3BK9YQLyZxcAB-J_Km6IJS5gB_Tpg7vgn73nu03DAg>
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
X-ME-Proxy: <xmx:j926aUOD10HvdeVZWfjnXU_OXlPBzPXCATvkZxKZhfQOjyOHNHhikg>
    <xmx:j926aT6TO67jd9lFhoOD8J_wIUDN8CwNm6SXgIaVEf9Uf465oA1IEw>
    <xmx:j926adNQZ9QZ8WCnpz57PW1ioP5arQ__eMrYJO8MMghf-mwQGB3ySg>
    <xmx:j926aZmus5pN6Q6gJ8nS2OgrjFKv4EhRmGJRPkY_DScK8Oc7ai-5Gw>
    <xmx:j926aYpSAtHrhebfUNTXclUzriQVa4T7P7Ek2i7ZjqBbFiegoTm31uo1>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Mar 2026 13:14:54 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 18 Mar 2026 17:14:48 +0000
Subject: [PATCH 05/12] flac: Use arch independent search path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fix-checklayer-2-v1-5-388ba6ce47cd@pbarker.dev>
References: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
In-Reply-To: <20260318-fix-checklayer-2-v1-0-388ba6ce47cd@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=vTmnQPcwA/m0OTkn5T/0aBJqtGlpNDV6RGvKnnGC0bI=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWTuuttZdfL6a96X9vlqWgf2G2mU/avaOrfj5uQ07udWR
 7+9EtwU11HKwiDGxSArpsiyuefr/ae9jrwZIbcUYOawMoEMYeDiFICJ7F/H8D+/c3vrjHjuR/Pu
 d52LZvlSZ6R4ZIHrrwP7117fu+O5XUQNwz91xczGKF2tlUEf0qpETq49Hsi3bPLn8lZBMeYMN4F
 cNX4A
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233422

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


