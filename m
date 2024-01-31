Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6361CC47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 22:54:37 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.2156.1706741672458113862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 14:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ezgKWOBd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202401312254302e5beeebc688f2f503-vbwymm@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202401312254302e5beeebc688f2f503
        for <openembedded-core@lists.openembedded.org>;
        Wed, 31 Jan 2024 23:54:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=d2r30t6bu5+QDs149C8Q+itQIUViaPZaTqj1fVCHs88=;
 b=ezgKWOBdEiJoPNdYoGGSvzhWi71kkKF4HszUA964wIK0wpOYfKa1ccKpXRHyvAk2tq9opV
 /R/I/jRW6xpLDZi10J2ITIFMfOdxv/VvJxYMKf2UdBJt+DTJVIU0exGIfgr+Fy6jtQSwtXIK
 Q2zFr+FgEmzS7j3wHmvZdHVD3rVew=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][dunfell][PATCH v2] sqlite3: ignore CVE-2024-0232
Date: Wed, 31 Jan 2024 23:53:41 +0100
Message-Id: <20240131225341.55648-1-peter.marko@siemens.com>
In-Reply-To: <20240128165358.657852-1-peter.marko@siemens.com>
References: <20240128165358.657852-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 22:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194535

From: Peter Marko <peter.marko@siemens.com>

This CVE reports bug which was fixed in 3.43.2 by [1].
Code analysis shows that it is fixing caching issue
and this cache was introduced by [2].
This landed only in 3.43.0 so 3.31.1 is not affected.

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


