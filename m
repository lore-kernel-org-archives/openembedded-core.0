Return-Path: <alexis.lothore@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35ED6C41513
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:16:49 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.16423.1690985804034007422
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 07:16:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fCVY1xM8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexis.lothore@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 575BFE0003;
	Wed,  2 Aug 2023 14:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690985802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZAUPqb+5fS+bGaVBqqCzG/WuzBQq3uNfYOkvxpPRtwM=;
	b=fCVY1xM8QGAvMdIw/On/xQeEuRCZQepRJXNqede/GG3I5KIQagD/dejTWAlQ5YaxshtJZ/
	iIw7i8SeA2SxZ7nyJ2/SQAE4fWqUG9G3downdNOLM7Vp7q7LDr7mxkCS5tcrDx67ea+gA3
	9iwQYwUkxrbQp7UCnNJ6ZhgkZ0DWXulBAPca8GFhDIKfxbJK5BodgBwdavTwYuYsGmt/ll
	75FWYFyDq0Ga+0hlAANYDu1zGtFCmNyUKiuuwvyrs2AIbMybkE11NZhAN3Q6CQkm3ZoY0U
	43zU55MMGZIQIFgNSUbbotkdgz6dV8tDj3iul18rjFBdYlDTor0e8974Zaw9fg==
From: alexis.lothore@bootlin.com
To: <Openembedded-core@lists.openembedded.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-Core][PATCH 2/2] scripts/resulttool: define custom string for "not found" test results
Date: Wed,  2 Aug 2023 16:17:18 +0200
Message-ID: <20230802141718.3326905-3-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802141718.3326905-1-alexis.lothore@bootlin.com>
References: <20230802141718.3326905-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexis.lothore@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 14:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185401

From: Alexis Lothoré <alexis.lothore@bootlin.com>

Whenever a test result is present in base test result but absent from
target test results, we have an entry in regression report looking like the
following one:

    ptestresult.apr.testfile: PASSED -> None

The "None" status may be a bit confusing, so replace it with a custom
string which really states what "None" means in this context:

    ptestresult.apr.testfile: PASSED -> No matching test result

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 scripts/lib/resulttool/regression.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/resulttool/regression.py b/scripts/lib/resulttool/regression.py
index 3a23d7fc0a0e..3d64b8f4af7c 100644
--- a/scripts/lib/resulttool/regression.py
+++ b/scripts/lib/resulttool/regression.py
@@ -75,6 +75,7 @@ OESELFTEST_METADATA_GUESS_TABLE={
 }
 
 STATUS_STRINGS = {
+    "None": "No matching test result"
 }
 
 def test_has_at_least_one_matching_tag(test, tag_list):
-- 
2.41.0


