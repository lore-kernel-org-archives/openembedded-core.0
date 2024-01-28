Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF361C47DA9
	for <webhook@archiver.kernel.org>; Sun, 28 Jan 2024 16:55:00 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.40825.1706460893348287644
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jan 2024 08:54:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=JwaEHLpI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20240128165450c238f9cedb55623027-gdqy2l@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20240128165450c238f9cedb55623027
        for <openembedded-core@lists.openembedded.org>;
        Sun, 28 Jan 2024 17:54:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zU4FK/CxSePNhqI7uolXZaMmIjo7FmCi7MSLAkYqZoc=;
 b=JwaEHLpI0FaTucP/bCznVIdEwdPrkrzttEcyGspVakFLIEECMh8taSfca00Mf+uHBJ9KDe
 ENrJVez9sOECpILmebGd8GBs+kK30mQSR/AcjJOak7TKM5XdFRhu9HlELYOywrpM+zu56pNs
 8RWTNevZgFPJ0nGcw67bgd+55mk/Q=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][dunfell][PATCH] sqlite3: ignore CVE-2024-0232
Date: Sun, 28 Jan 2024 17:53:58 +0100
Message-Id: <20240128165358.657852-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Jan 2024 16:55:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194444

From: Peter Marko <peter.marko@siemens.com>

This CVE reports bug which was fixed in 3.43.2 by [1].
Code analysis shows that it is fixing caching issue
and this cache was introduced by [2].
This landed only in 3.43.0 so 3.85.5 is not affected.

[1] https://sqlite.org/src/info/5b09212ac05615fc
[2] https://sqlite.org/src/info/2dbb22c75e86f2e3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
index ef12ef0db2..b2d8f9f1dd 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.31.1.bb
@@ -25,3 +25,5 @@ SRC_URI[sha256sum] = "62284efebc05a76f909c580ffa5c008a7d22a1287285d68b7825a2b6b5
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
 # This is believed to be iOS specific (https://groups.google.com/g/sqlite-dev/c/U7OjAbZO6LA)
 CVE_CHECK_WHITELIST += "CVE-2015-3717"
+# This was introduced in 3.43.0, 3.31.1 is not yet affected
+CVE_CHECK_WHITELIST += "CVE-2024-0232"
-- 
2.30.2


