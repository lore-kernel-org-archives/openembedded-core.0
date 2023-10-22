Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A81EC25B41
	for <webhook@archiver.kernel.org>; Sun, 22 Oct 2023 17:49:05 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.103870.1697996935285741517
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 22 Oct 2023 10:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=H/gGDV6d;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43EB7E0005;
	Sun, 22 Oct 2023 17:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697996933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0w8jGuwDSZmm1L1l8TrSM3cxHpdmo2eGQ7iyyRCjt0Q=;
	b=H/gGDV6dmPpKs3uHy77Yoo6asc9Cz3RwFDY7Sni6ZN8OHMD1m4bdSiDiOSQC0Zxf+dkh3T
	BhKOVGRxYN7+mmb3/6g979p1lpgGN4uNCD5tMBrgUWrpcLr2D9rkoidIGrkAc8cRKAzr9M
	TXBC5Pg2DyJTzNJvZB/YWllsfRms4+hlw60GEVelbtViBUopuofGMiUU/CO0eNmJZL21Rp
	KoChRHMfHg30A2pTKFUskYP2RaRNA2F7BzMovJyLwL7dxWSKuVOONq2ClTUvcr4+Gx4ugb
	oqdAq3EJf7XjGuXLkr/CIUtOZIceYDSadjNo6SDFTgX1MpJJdo9PvG0Ts7FKLg==
From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH v2 2/4] scripts/resulttool: rearrange regressions report order
Date: Sun, 22 Oct 2023 19:49:36 +0200
Message-ID: <20231022174938.7012-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231022174938.7012-1-alexis.lothore@bootlin.com>
References: <20231022174938.7012-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Oct 2023 17:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189609

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Regressions reports currently reports matching pairs and improved pairs
first, then regressions.

Change order to print regressions first, which is the most valuable info in
the report, and then print improvements and matches at the bottom.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/lib/resulttool/regression.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index d98504f4ced8..560d102e172c 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -80,6 +80,9 @@ STATUS_STRINGS = {
 
 REGRESSIONS_DISPLAY_LIMIT=50
 
+MISSING_TESTS_BANNER =   "-------------------------- Missing tests --------------------------"
+ADDITIONAL_DATA_BANNER = "--------------------- Matches and improvements --------------------"
+
 def test_has_at_least_one_matching_tag(test, tag_list):
     return "oetags" in test and any(oetag in tag_list for oetag in test["oetags"])
 
@@ -312,10 +315,11 @@ def regression_common(args, logger, base_results, target_results):
                         regressions.append(resstr)
         else:
             notfound.append("%s not found in target" % a)
-    print("\n".join(sorted(matches)))
-    print("\n")
     print("\n".join(sorted(regressions)))
+    print("\n" + MISSING_TESTS_BANNER + "\n")
     print("\n".join(sorted(notfound)))
+    print("\n" + ADDITIONAL_DATA_BANNER + "\n")
+    print("\n".join(sorted(matches)))
     return 0
 
 def regression_git(args, logger):
-- 
2.42.0


