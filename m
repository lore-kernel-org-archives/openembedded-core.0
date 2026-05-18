Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D73CD4F49
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 14:22:52 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9488.1779114161553179599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 07:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm1 header.b=crwRfXwj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1328017-20260518142237361c8064f500020700-uzypmc@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260518142237361c8064f500020700
        for <openembedded-core@lists.openembedded.org>;
        Mon, 18 May 2026 16:22:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=QHWAkrDWbstWkt1y51o6MdqjPNMrvaJZOuniIQXju6k=;
 b=crwRfXwjJ+gC1bzJibndIc29H7JHj1KU1ZEmpCaDTPHkuUzfMhITv/rW51GL15GWOjyEjh
 HIxJpqTYWU+uWRZ3kYdDnjT0IWcYMttCyFfsEMpkF/Yb3I4dsQSJJaEGYAZvT3k6sYOFwSDh
 BwZWv9IkHuUkKbB9Mv09lM2kTBStukkedvZhtUtKbM/Fnwjmp5Q+xTajRbJvjQ5nkXIq4xq1
 pK9FTlhI0B2BPeGMKuxmXPALnD27OLIEZ8t59tfxuLmW0AUYe86upBu6uZhQdgqfyotnkuMy
 4KslN7B2+Nty9yNhSTK6cNgL4ztzdpzA6ijwX8fD7XeW2iv9C2sWiKjQ==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [PATCH] testimage: handle missing boot log file gracefully
Date: Mon, 18 May 2026 16:22:35 +0200
Message-Id: <20260518142235.2077-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 14:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237248

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

QemuRunner writes boot console output to logfile + '.2' (the primary
serial port). The primary logfile path (without extension) is used for
the secondary serial port and may not exist if QEMU does not open it.

testimage_main crashed with FileNotFoundError at open(bootlog) when
results.wasSuccessful() returned False, because the file was absent.

Fall back to the '.2' variant when the primary file does not exist.
Wrap open() in a try/except OSError so a missing log emits a warning
instead of aborting the task.

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/classes-recipe/testimage.bbclass | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 9902b8a568..1af060342f 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -415,9 +415,14 @@ def testimage_main(d):
     if not results or not complete:
         bb.error('%s - FAILED - tests were interrupted during execution, check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
     if results and not results.wasSuccessful():
-        with open(bootlog, 'r') as bootlogfile:
-            bootlines = "".join(bootlogfile.readlines()[-20:])
-        bb.plain('%s - FAILED - Last lines of QEMU boot log:\n%s' % (pn, bootlines))
+        # QemuRunner writes boot output to bootlog + ".2"; the primary file may not exist
+        bootlog_actual = bootlog if os.path.exists(bootlog) else bootlog + ".2"
+        try:
+            with open(bootlog_actual, 'r') as bootlogfile:
+                bootlines = "".join(bootlogfile.readlines()[-20:])
+            bb.plain('%s - FAILED - Last lines of QEMU boot log:\n%s' % (pn, bootlines))
+        except OSError as e:
+            bb.warn('%s - could not read boot log: %s' % (pn, e))
         bb.error('%s - FAILED - also check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
 
 def get_runtime_paths(d):
-- 
2.39.5


