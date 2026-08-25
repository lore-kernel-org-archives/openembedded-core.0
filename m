Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707BDC61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 12:55:05 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20789.1787662502155370273
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 05:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.tatrai.ext@siemens.com header.s=fm2 header.b=P35/lu5f;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1328017-20260825125457e99157d999000207a3-3zegxa@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260825125457e99157d999000207a3
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Aug 2026 14:54:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.tatrai.ext@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=F43gi/wlGtADVMNXq5uJrCNyC1nG2yrhfjmDzcvUIdY=;
 b=P35/lu5ftBzxbTui4Ij8uEpSACNSYV3y6S3KzyXmJQy7QyCxlSHjGMRv3NfWx5vw40OSAM
 UN2C/o3aA0UOKMuz5gwHow9rwB5t/SpKJ9lTEgiyfIsZtDuK4RxObsAXG39RjZ1QsLhZOMoh
 SxfpyoiT1JsOAJo5q7enyLqYG5/gVk2uFUY0ZlrokmtoHjrwyltTJYYbpGBKWAGdrvkOSD/X
 bPsEmpSsTZIoTuuQHHmKPhHhbbdpAblO1/MMbx00pBb0UVurSvBuKJUKzIlhZ0mHuDEk3hZc
 IJI02skxDC5C4SjaD5YeX+lf5FLh1BWkTRhQCepDGLdriejIf6QXS1iw==;
From: "P. Tatrai" <peter.tatrai.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Tatrai <peter.tatrai.ext@siemens.com>
Subject: [wrynose][PATCH] testimage: handle bootlog variants on failed qemu tests
Date: Tue, 25 Aug 2026 14:54:55 +0200
Message-Id: <20260825125455.192432-1-peter.tatrai.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1328017:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 12:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244234

From: Peter Tatrai <peter.tatrai.ext@siemens.com>

The failure summary path assumed the unsuffixed bootlog file always
exists and unconditionally opened it.

This is not guaranteed when SERIAL_CONSOLES has fewer than two
entries (including empty), where qemurunner can produce only
bootlog suffix variants (for example .2 or .stdout).

On test failures, collect snippets from all existing files matching
bootlog and bootlog.* and prefix each snippet with its filename.
Also skip creating a symlink for a missing bootlog path.

This prevents FileNotFoundError from masking the original test
failure and improves diagnostics across qemu serial configurations.

(From OE-Core rev: 7a6596925cb0eb8dd48a0362a51875cdd60152bc)

Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
---
 meta/classes-recipe/testimage.bbclass | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 9902b8a568..0f34d551e9 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -186,6 +186,7 @@ def get_testimage_boot_patterns(d):
 
 def testimage_main(d):
     import os
+    import glob
     import json
     import signal
     import logging
@@ -409,15 +410,33 @@ def testimage_main(d):
     # Copy additional logs to tmp/log/oeqa so it's easier to find them
     targetdir = os.path.join(get_json_result_dir(d), d.getVar("PN"))
     os.makedirs(targetdir, exist_ok=True)
-    os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog)))
+    if os.path.exists(bootlog):
+        os.symlink(bootlog, os.path.join(targetdir, os.path.basename(bootlog)))
+    else:
+        bb.note("testimage: boot log not found at %s" % bootlog)
+
     os.symlink(d.getVar("BB_LOGFILE"), os.path.join(targetdir, os.path.basename(d.getVar("BB_LOGFILE") + "." + d.getVar('DATETIME'))))
 
     if not results or not complete:
         bb.error('%s - FAILED - tests were interrupted during execution, check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
     if results and not results.wasSuccessful():
-        with open(bootlog, 'r') as bootlogfile:
-            bootlines = "".join(bootlogfile.readlines()[-20:])
-        bb.plain('%s - FAILED - Last lines of QEMU boot log:\n%s' % (pn, bootlines))
+        bootlog_files = []
+        for candidate in [bootlog] + sorted(glob.glob(bootlog + ".*")):
+            if os.path.exists(candidate) and candidate not in bootlog_files:
+                bootlog_files.append(candidate)
+
+        if bootlog_files:
+            snippets = []
+            for bootlog_file in bootlog_files:
+                try:
+                    with open(bootlog_file, 'r') as bootlogfile:
+                        bootlines = "".join(bootlogfile.readlines()[-20:])
+                except OSError as err:
+                    bootlines = "<failed to read %s: %s>\n" % (bootlog_file, err)
+                snippets.append("--- %s ---\n%s" % (os.path.basename(bootlog_file), bootlines))
+            bb.plain('%s - FAILED - Last lines of QEMU boot logs:\n%s' % (pn, "\n".join(snippets)))
+        else:
+            bb.plain('%s - FAILED - QEMU boot logs not available at %s or %s.*' % (pn, bootlog, bootlog))
         bb.error('%s - FAILED - also check the logs in %s' % (pn, d.getVar("LOG_DIR")), forcelog=True)
 
 def get_runtime_paths(d):
-- 
2.39.5


