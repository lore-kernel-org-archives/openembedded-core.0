Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA40C47258
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 16:55:50 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.40853.1706460945933235638
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jan 2024 08:55:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dL6yPcuw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2024012816554345abfdc213be540bae-5df3wk@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024012816554345abfdc213be540bae
        for <openembedded-core@lists.openembedded.org>;
        Sun, 28 Jan 2024 17:55:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WWkSNiLGDxorZZKw8KTX4dOIu6uo8KjIW5jQUCtulRU=;
 b=dL6yPcuwyoAJoQQKcu4mheB2IbKhRKIGobKvzenb2+JZ0eN9R2wn+ne30puA2oMP+6fhx2
 SYoLvwCGkBr9VFQs7gTTnfHKykVM+iiGVJqyYVNywUM9p76CON7cbjNStWDL8iaLCNMAYQQJ
 V30zGpuMQcXbJWQBaQI3/5K2Waxgs=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] sqlite3: ignore CVE-2024-0232
Date: Sun, 28 Jan 2024 17:54:55 +0100
Message-Id: <20240128165455.658066-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 16:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194445

From: Peter Marko <peter.marko@siemens.com>

This CVE reports bug which was fixed in 3.43.2 by [1].
Code analysis shows that it is fixing caching issue
and this cache was introduced by [2].
This landed only in 3.43.0 so 3.85.5 is not affected.

[1] https://sqlite.org/src/info/5b09212ac05615fc
[2] https://sqlite.org/src/info/2dbb22c75e86f2e3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index cece207eae..f061b0aa48 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -17,3 +17,5 @@ CVE_CHECK_IGNORE += "CVE-2019-19242"
 CVE_CHECK_IGNORE += "CVE-2015-3717"
 # Issue in an experimental extension we don't have/use. Fixed by https://sqlite.org/src/info/b1e0c22ec981cf5f
 CVE_CHECK_IGNORE += "CVE-2021-36690"
+# This was introduced in 3.43.0, 3.38.5 is not yet affected
+CVE_CHECK_IGNORE += "CVE-2024-0232"
-- 
2.30.2


