Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EF7C87FCB
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 19:18:39 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.2393.1754248709730557429
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Aug 2025 12:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=CVkxxRAU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250803191825201d40b3811aaa4631-kv3zav@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250803191825201d40b3811aaa4631
        for <openembedded-core@lists.openembedded.org>;
        Sun, 03 Aug 2025 21:18:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AglhTZN1WczJfPI9CHduALafmbFT3tBC6lRqWbjXEvk=;
 b=CVkxxRAUqbBD1cpPY3u3+4cXIdi65iTZPhKIrnXr+0nj+yNNx6o/9kvY3AVwSxL3WhDUIg
 iOUDFLCGFXZh66BTwQweKaz40fKKDDwZJ+BrBCbR5uwZJMT1fgHmraCfpXMEIqqgDwVhuesm
 blwoONgNDEh+jfxCpXkpA3kFxjwZvjbBmsisr5tPBeKbbfsd6gupk1GuRdGE8noM6iFmvE6h
 BSgEJVtZQvrVzZL+VDClzJWM2KICp6t2dq2ahkXxvt3lpEv5F5RkdTQ/uYQUseLjrey3xC75
 T5vgw+7ccclv0w2kql35bu2dh0W4pjBkBwiY+PNZW+gAXNBij5+3JEYw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] sqlite3: ignore CVE-2025-3277
Date: Sun,  3 Aug 2025 21:17:38 +0200
Message-Id: <20250803191738.11765-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 19:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221412

From: Peter Marko <peter.marko@siemens.com>

The vulnerable code was introduced in 3.44.0 via [1].
(See fix commit [2])
Also Debian says "not vulnerabele yet for 3.40.1 in [3]

[1] https://github.com/sqlite/sqlite/commit/e1e67abc5cf67f931aab1e471eda23d73f51d456
[2] https://sqlite.org/src/info/498e3f1cf57f164f
[3] https://security-tracker.debian.org/tracker/CVE-2025-3277

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index f47a9871e2..6b1e122bd8 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -18,3 +18,5 @@ CVE_CHECK_IGNORE += "CVE-2019-19242"
 CVE_CHECK_IGNORE += "CVE-2015-3717"
 # Issue in an experimental extension we don't have/use. Fixed by https://sqlite.org/src/info/b1e0c22ec981cf5f
 CVE_CHECK_IGNORE += "CVE-2021-36690"
+# Issue was introduced in 3.44.0
+CVE_CHECK_IGNORE += "CVE-2025-3277"

