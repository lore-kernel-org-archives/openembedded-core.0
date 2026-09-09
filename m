Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409D8C79FAA
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:01 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6431.1788938997446498474
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=R0OsdtKQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso46080655e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788938996; x=1789543796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KxYbtkq4AnTA3YBcl5OKTYJ83o4iiNy9+ZHhyTPPmZ4=;
        b=R0OsdtKQE4o0zW1GDTvTs/34TjtAAcHb4dTk9QmD6bejVbmawd1k70fb3yElsTjQPT
         /jEgbl6Mk01VbHT+FfFqhF4RQlRJTqCS09CqpMfSpMJT78GdnK4SfmB7Ehl7niTz3yjE
         KTnCKRNh5aep0xApgZt/h70kI/lxnX1t/7vhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938996; x=1789543796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KxYbtkq4AnTA3YBcl5OKTYJ83o4iiNy9+ZHhyTPPmZ4=;
        b=oDovkTNSlb3IN0OnCK98X6izHAwHJa/6ChTnS+8z2mKtmIOp+mYH8ReYyu7AJwhtB1
         g0oLK27ar3Pvc6XoBFc53sIiPQAWR3Sz+RAv5GdQB54XZzt1kEd17hqZG1tEN/xZkjC6
         NnH+72mSCsdzDwVpFXxtmpS7oLdjkFGR+X4QfErI/Enj1yTe8eBbuzRgRR3XX9C1clQp
         gCKbdY/Mkg1vRS+GilUTryyus2zu+G5GIQXWGab4cDcpP1MvlHJ/hgJz0uHzp1bd134b
         KFyHWLRWzEf2CRAHkH3c1iRAP8TS6BjdyXFGtySTcZjxJ1XdPYmSodjonfBSb/Zc/f26
         mExg==
X-Gm-Message-State: AFuF++lWIDzxs5UPfKe41JTXk+momqEqQVmEUQqjA1UYsIfwORmSEwBY
	Nkk1meqK/etu1qQikgjVzVrDQycGuwV9/OvPgDFmDYwkcKj40MOAkRVCcfaYZOhxcnJNU4L2a5J
	uS3jMR0s=
X-Gm-Gg: AYBFou2KFoX2QZWzKFLXUQ0hUg0JPuTu9Qo1vRORvmAUanjK9c1erS1mdx5XuSHmNJ9
	5neg034fIByRDLLPuTWCudzdLPAEDcgNPptqpIJM7ITXONWuZse9LkylydxsgAjuqUIB9/TLkz4
	FIYOm5d7E1Alah1Qflp8A3Ln0zunjl9yGxXAUiPkNleFA/DjX5Z/jmdGrK6nFeAlCtbFMgHqkrp
	RcggNDQujNGJitwxHFoWFhy/3SR9hM6x/g0y0659+TxQXmP6KdZaL5L+TDW1XLHRv9JeEgt3xPq
	m3aGn1Uu73Hh50Umg04bXvH4Iu9RxWE/D2o48ME7V/KXXMOv9Hg1HZW7OVh1BpMsg+PQNAeEFAt
	s7gph8H1HaJrCTqWzr4JlvD1tiFasDziIy6ppbLlf25eI7ohYR8adkNqubiUhs5f7XZTanzivQh
	QcBTwif1nFGBurMZ4Y9kbpFwj45t4Izk9oIeJFkwuSsd9s3ngjVBTseePlQ7FKd9zB7bLsw/YhF
	ZPD3hD8mHMJoN7FU1pqspp5KfbyVBaL7atyEjjDMD2RlaT4nj6nrADvXTTXfp7zXMbDMg5tAice
	TJ3wJwzQbw==
X-Received: by 2002:a05:600c:138d:b0:49d:243a:e4f9 with SMTP id 5b1f17b1804b1-49d243ae71fmr8930405e9.10.1788938995504;
        Wed, 09 Sep 2026 00:29:55 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.29.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:29:55 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/38] testimage: handle bootlog variants on failed qemu tests
Date: Wed,  9 Sep 2026 09:29:04 +0200
Message-ID: <e9cdd45e1c8769650b70965f99780670e219cae9.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245413

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/testimage.bbclass | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 9902b8a5682..0f34d551e99 100644
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

