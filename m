Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F53C79FA0
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 18:51:37 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2755.1788807093447908706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 11:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=cOH+p5oT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1328017-20260907185129546d8f8297000207c1-eazsr5@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260907185129546d8f8297000207c1
        for <openembedded-core@lists.openembedded.org>;
        Mon, 07 Sep 2026 20:51:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=b9HrM8tB5Zp6WvxSMVqgowNghgNTp6CipYAWtmuVdLs=;
 b=cOH+p5oT6e8ilPvbv5dfCIIqH0SN0h7Y1hnGgn7s6x9kqgmlJUk1TNfDM3UR5s5wxeORAI
 OpsuWzbrl9tF4zP4PsPGRGf3NXm20t0oj3RKL9I5wAQHaShEuXva0eVWt8x0/1KOOIXbDZNf
 /JQzpq5Z5zwWlPYZ+iAKBDPNHr1qQ55WKXBhPwREVlXS6w5x7SFfkXUUmWaEXYqjGL5J3T0V
 WgL45fNIiJLyIsT0/JXK3F8mEX//USKJKrNQO9dnGsIHa55TVnCNQOKOOKE4pjq9josuTu5+
 mUqCi4eF0vAg0B9S24chi25iqKxKFiY+S/axFjmogOuD69NSXTPEg47g==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [scarthgap][PATCH v2] testimage: avoid symlinking missing qemu boot log
Date: Mon,  7 Sep 2026 20:51:27 +0200
Message-Id: <20260907185127.493115-1-peter.tatrai.ext@siemens.com>
In-Reply-To: <20260825125617.192989-1-peter.tatrai.ext@siemens.com>
References: <20260825125617.192989-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 18:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245304

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

When qemu test runs only produce suffixed bootlog variants, the base
bootlog path may not exist. Guard the symlink creation and log a note
instead of raising FileNotFoundError.

This is a partial backport of master commit
7a6596925cb0eb8dd48a0362a51875cdd60152bc, which also introduces
bootlog variant globbing not applicable to scarthgap. Only the
symlink guard, which fixes a standalone bug, is picked here.

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


