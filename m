Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 447FFC88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 17:06:58 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2708.1789405610885250013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 10:06:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=OXQs1Hrq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1328017-202609141706473a924508ae0002076a-taxodz@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202609141706473a924508ae0002076a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 14 Sep 2026 19:06:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Jp1q7UhmwUsXRHCHTgX/mPH09CsnUOm64lfaa16mYO0=;
 b=OXQs1Hrqdcn5M0eTt1rGpcchXVFxk5BOwd8eaNNogav1vGsIpFPe89KkRn73YhVxoXOTdv
 aGTbV6WUgQyFhTiXAlp3k5IjxZG4MO6i6dKs3/WIsAXS5qiExKdie7/KisAQiMe6BgOS+5YJ
 qWjGdvGW3wYuA8+3fZzkkYGy4GBpisTXB/iwdO4s4ekS4sSYO5HuJFqKq1WbmkvhjzRV7fwL
 Qc15u7F4Xg81dJ12C4au4ghN2T4xzzJoRqzviaNqOLSI5n4SqGR0bIL77QnQeEvxO5++/mVL
 A1Uh6cIfJOtzMNYp3I3lI2r6qcAI6avlV6A20Bq6zMUXrHHQUXOzmJ+w==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [scarthgap][PATCH v3] testimage: avoid symlinking missing qemu boot log
Date: Mon, 14 Sep 2026 19:06:45 +0200
Message-Id: <20260914170645.339063-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 17:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245789

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

When qemu test runs only produce suffixed bootlog variants, the base
bootlog path may not exist. os.symlink() creates a dangling symlink
in the oeqa result log directory.

Avoid advertising a boot log in the collected test results when that
path does not exist. Guard the symlink creation and log a note instead.

This is a partial backport of master commit
7a6596925cb0eb8dd48a0362a51875cdd60152bc. Only the symlink guard is
picked here; the bootlog variant globbing from master is not applicable
to scarthgap.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/classes-recipe/testimage.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 33b1c13f9d..744de5d7de 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -395,7 +395,10 @@ def testimage_main(d):
     # Copy additional logs to tmp/log/oeqa so it's easier to find them
     targetdir = os.path.join(get_json_result_dir(d), d.getVar("PN"))
     os.makedirs(targetdir, exist_ok=True)
-    os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog)))
+    if os.path.exists(bootlog):
+        os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog)))
+    else:
+        bb.note("testimage: boot log not found at %s" % bootlog)
     os.symlink(d.getVar("BB_LOGFILE"), os.path.join(targetdir, os.path.basename(d.getVar("BB_LOGFILE") + "." + d.getVar('DATETIME'))))
 
     if not results or not complete:
-- 
2.39.5


