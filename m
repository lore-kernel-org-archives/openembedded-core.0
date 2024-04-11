Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E56C4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 19:47:48 +0000 (UTC)
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
 by mx.groups.io with SMTP id smtpd.web10.28056.1712864860353344556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 12:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm1 header.b=Y2Kn/enJ;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=T3ygtigg;
 spf=pass (domain: cold-front.org, ip: 64.147.123.147, mailfrom: jsbronder@cold-front.org)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id B0E3C1C000C8;
	Thu, 11 Apr 2024 15:47:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 11 Apr 2024 15:47:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1712864859; x=
	1712951259; bh=UFbLvNGWQUPKlP68cpIrBpdKc1wMx5uJ01w585Bu8tk=; b=Y
	2Kn/enJLvYF4DkghcNFBz87XsFpikGyxTXTd9vrRHxVmsTBdIAoAItuGtwInUOog
	4yuUrQpwyH8NJxIyYchu1lW9jWYwUQrOiM1SJXxT3I4Hqoi15ZFACtgXXUl4SIJQ
	RuvPGZDoLmx1D3vrFM6ePn52ZDwIc0bkoslqd32sPwiEDHf3MzhwtweCpAL09bss
	GdCCbg4+uj/5c9geO8TTM7D/Vq2jk7C5lHL2lfrBkfh3mbSVW6DbRV/IS/D1PjMY
	Q2DGF//bsHwxCL8VJ+ALzAHonzSB/daGPXL+O1gDy4trlLYpBYvqqTHZUhWFGueZ
	YeOWfnbeJobobNUU1iwUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1712864859; x=
	1712951259; bh=UFbLvNGWQUPKlP68cpIrBpdKc1wMx5uJ01w585Bu8tk=; b=T
	3ygtiggRw4n0Bk4is+BiYeDh7Z3KoQOzj8/jFkiOt2px4fI4AOCMMuu4IXEaG252
	T7103O5Mj4ejMgr1wsDqrZn+bk1+ANx26eycEn07x0Q5Gjp1Iu1xwewK68/wwPat
	5Y8AvCPgswCdjHGb2/4Ud28MUdjavsiO5mi6+yonxfNpPvGL5dFX36lmqJQ6FNVB
	IDpM/8Rqn7YEhcwwpmxR4Kz44zbuvMtACcSb9HyhkCSdHCHLFGPbXD31RVTUm1y8
	lBVcgfD77adlCtsaX97U1S+xF1H+EF7YVbK6Gvo2qkeJQ+T8sXz2BdDEsyv9i8Sd
	8EKcfUj8O/tlkmLfNc65A==
X-ME-Sender: <xms:Wz4YZlCT30qYMWakAES6ftdAuV8dQjAbhyRgohLceW_NVfavlEbrDw>
    <xme:Wz4YZji1QTWoeA8nGO8GGw9WChIL4HN4NlJ7MOnt_1OUr_dQ6HvFir22GuCoyB9Rl
    NLliuMapkfcu3TzHw>
X-ME-Received: <xmr:Wz4YZgnRykxT60Rr5zDoOmbuPAvbZo-j7Ci7CTTqmJJR0f3JWE0_vqqaUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehkedgudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhn
    uggvrhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeevfffhve
    fhteeluddtheduteetieefueeigfetfeffveeluddtjefhkefftedtveenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrse
    gtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:Wz4YZvyCWLGB8huimcPybVsUQBFD6g_TySJlvPnhWI7WInt5HQypXA>
    <xmx:Wz4YZqTx8YwGLvHrWpU0m58frGMbPEt4VDdX8PT3OyaJpQEADGkw9g>
    <xmx:Wz4YZibXM96S0E8XX0z2MPDPeQT44gud-95yvQvi2m47_dli3CdA6Q>
    <xmx:Wz4YZrRQBO2va3uAr8J8BKt7oY75xB1SqRaUx9Hc0hQnfGL0NAz6gg>
    <xmx:Wz4YZlcPxPWaUe4_D-_gdTIWF2laxPxx5xRhsGD8qcAJuZpAFYmwfQIl>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Apr 2024 15:47:38 -0400 (EDT)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [PATCH 2/2] python3-referencing: drop ${PYTHON_PN}
Date: Thu, 11 Apr 2024 15:46:37 -0400
Message-ID: <20240411194727.26317-3-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411194727.26317-1-jsbronder@cold-front.org>
References: <20240411194727.26317-1-jsbronder@cold-front.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 19:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198145

python 2 is gone and we don't need the abstraction now, drop the
remaining usage of this variable.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 meta/recipes-devtools/python/python3-referencing_0.33.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-referencing_0.33.0.bb b/meta/recipes-devtools/python/python3-referencing_0.33.0.bb
index 5b50932264..f675bbc67d 100644
--- a/meta/recipes-devtools/python/python3-referencing_0.33.0.bb
+++ b/meta/recipes-devtools/python/python3-referencing_0.33.0.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "c775fedf74bc0f9189c2a3be1c12fd03e8c23f4d371dce795df44e06c5
 
 inherit pypi python_hatchling
 
-DEPENDS += "${PYTHON_PN}-hatch-vcs-native"
+DEPENDS += "python3-hatch-vcs-native"
 
 RDEPENDS:${PN} += "python3-rpds-py"
 
-- 
2.44.0


