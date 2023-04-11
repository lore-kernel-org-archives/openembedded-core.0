Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7988EC77B70
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 15:05:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.16462.1681225531069058579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Apr 2023 08:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=obYp0tjV;
 spf=pass (domain: baylibre.com, ip: 209.85.128.47, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f47.google.com with SMTP id gw13so4740947wmb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681225529; x=1683817529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCnUr4ui4xN693a4wAninz4qk5FmRXymzblDdnLveis=;
        b=obYp0tjVH6eCjvueXsDICKAEblxb89SgA3E2BQSQe6HX8arM6cQkcGYwZEsEofULZD
         mggPfABSYqNqkSOJXzTA/Ray8SAj3litR41hSkMEnpzZ9W84oyc0EJWvfcluYTeMtpJS
         JVq8FkhMgDmw02ZN9W938HgBInpp+pvApdJTEmf9fygQ1a5eQVMyDlAn3KCV1M/5AyjM
         Q2JADwOceUWIwp+nrnX6mFWOn2e6he3SuujzXoEzeGRhciaU2cjdZ5pbXZJdhNaCop5x
         DJnR2VdhqVSitB0aXjxQIo/aWvEf3xJ+hjnDi61fATzC08hizh/oHdzuKubm5ZsMPGci
         FGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681225529; x=1683817529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCnUr4ui4xN693a4wAninz4qk5FmRXymzblDdnLveis=;
        b=A5RSeFXgeFwhHnZMAoaW1kJq4+a1Lp1rGPug/EPi1W2TFxK7uK4fFVCu6TR63o6u0F
         zUgLJ59DEYBQAh6G4vcgVMQlig0pmSqvE+4SqSMsVjITfM+xSnN5UocSkCmm0QY+v669
         Jw6Oq0mA24ou4l7ks1ly1C5p5DIu26YYNLrs7TJWaThPFOMDIpnKXkCZCV6rx3ZxFdJ3
         eB0O2yrPOCbg6h9WLyReII8i4ZkFSBUAQ4Psq83K44K87EXTVHDyoc6FlUQkohZflZi0
         D/ftKGAPpKUf6OpfRZDsMoOyjWnjdKe8d+ANnd3lE/+Muh0uYu2PeXpWE6xHWHlleFjN
         oRrw==
X-Gm-Message-State: AAQBX9cGpKHQSlUuSywfKkrn3AcBrQdbOvhvPEpsYIc5cuwTRpU97xDn
	pjK0+5s1ZxXNXuoWc7Qr+ZfyNMdJfeMCObWDCG0=
X-Google-Smtp-Source: AKy350bmTWG+97M56wMrfGxJmv/CADaqj6zEpwZPKq25lHAEZTkkAnSHxQ30pSJtnf6LtucnAtsh/w==
X-Received: by 2002:a1c:7409:0:b0:3dc:5b88:e6dd with SMTP id p9-20020a1c7409000000b003dc5b88e6ddmr10069010wmc.10.1681225529352;
        Tue, 11 Apr 2023 08:05:29 -0700 (PDT)
Received: from midgar.. ([2001:912:1480:1c0::1])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bc5c6000000b003f072b22dbbsm16324161wmk.16.2023.04.11.08.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 08:05:29 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com,
	Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH v4 2/2] oeqa/selftest: change deprecated usage of run_serial
Date: Tue, 11 Apr 2023 17:05:03 +0200
Message-Id: <20230411150503.2105880-3-lrannou@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411150503.2105880-1-lrannou@baylibre.com>
References: <20230411150503.2105880-1-lrannou@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Apr 2023 15:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179929

Prefer the new function run_serial_socket. Change calls where the modification
is easy.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/debuginfod.py | 3 ++-
 meta/lib/oeqa/selftest/cases/gdbserver.py  | 7 ++++---
 meta/lib/oeqa/selftest/cases/locales.py    | 8 ++++----
 meta/lib/oeqa/selftest/cases/package.py    | 7 ++++---
 meta/lib/oeqa/selftest/cases/runqemu.py    | 2 +-
 5 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/debuginfod.py b/meta/lib/oeqa/selftest/cases/debuginfod.py
index 37f51760fb..2571ce6989 100644
--- a/meta/lib/oeqa/selftest/cases/debuginfod.py
+++ b/meta/lib/oeqa/selftest/cases/debuginfod.py
@@ -99,7 +99,8 @@ CORE_IMAGE_EXTRA_INSTALL += "elfutils"
                     % (qemu.server_ip, port)
                 )
                 self.logger.info(f"Starting client {cmd}")
-                status, output = qemu.run_serial(cmd)
+                status, output = qemu.run_serial_socket(cmd)
+                self.assertEqual(0, status)
                 # This should be more comprehensive
                 self.assertIn("/.cache/debuginfod_client/", output)
         finally:
diff --git a/meta/lib/oeqa/selftest/cases/gdbserver.py b/meta/lib/oeqa/selftest/cases/gdbserver.py
index 9da97ae780..4f8c7d620f 100644
--- a/meta/lib/oeqa/selftest/cases/gdbserver.py
+++ b/meta/lib/oeqa/selftest/cases/gdbserver.py
@@ -43,7 +43,8 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
             shutil.unpack_archive(filename, debugfs)
 
             with runqemu("core-image-minimal", runqemuparams="nographic") as qemu:
-                status, output = qemu.run_serial("kmod --help")
+                status, output = qemu.run_serial_socket("kmod --help")
+                self.assertEqual(status, 0)
                 self.assertIn("modprobe", output)
 
                 with concurrent.futures.ThreadPoolExecutor(max_workers=1) as executor:
@@ -61,7 +62,7 @@ CORE_IMAGE_EXTRA_INSTALL = "gdbserver"
                             self.fail("Timed out connecting to gdb")
                     future = executor.submit(run_gdb)
 
-                    status, output = qemu.run_serial("gdbserver --once :9999 kmod --help")
-                    self.assertEqual(status, 1)
+                    status, output = qemu.run_serial_socket("gdbserver --once :9999 kmod --help")
+                    self.assertEqual(status, 0)
                     # The future either returns None, or raises an exception
                     future.result()
diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
index 4ca8ffb7aa..98026d2c80 100644
--- a/meta/lib/oeqa/selftest/cases/locales.py
+++ b/meta/lib/oeqa/selftest/cases/locales.py
@@ -27,15 +27,15 @@ class LocalesTest(OESelftestTestCase):
 
         with runqemu("core-image-minimal", ssh=False, runqemuparams='nographic') as qemu:
             cmd = "locale -a"
-            status, output = qemu.run_serial(cmd)
+            status, output = qemu.run_serial_socket(cmd)
             # output must includes fr_FR or fr_FR.UTF-8
-            self.assertEqual(status, 1, msg='locale test command failed: output: %s' % output)
+            self.assertEqual(status, 0, msg='locale test command failed: output: %s' % output)
             self.assertIn("fr_FR", output, msg='locale -a test failed: output: %s' % output)
 
             cmd = "localedef --list-archive -v"
-            status, output = qemu.run_serial(cmd)
+            status, output = qemu.run_serial_socket(cmd)
             # output must includes fr_FR.utf8
-            self.assertEqual(status, 1, msg='localedef test command failed: output: %s' % output)
+            self.assertEqual(status, 0, msg='localedef test command failed: output: %s' % output)
             self.assertIn("fr_FR.utf8", output, msg='localedef test failed: output: %s' % output)
 
     def test_locales_on(self):
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 1aa6c03f8a..78e8a4c26b 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -135,7 +135,8 @@ class PackageTests(OESelftestTestCase):
             Check that gdb ``binary`` to read symbols from separated debug file
             """
             self.logger.info("gdbtest %s" % binary)
-            status, output = qemu.run_serial('/usr/bin/gdb.sh %s' % binary, timeout=60)
+            status, output = qemu.run_serial_socket('/usr/bin/gdb.sh %s' % binary, timeout=60)
+            self.assertEqual(0, status)
             for l in output.split('\n'):
                 # Check debugging symbols exists
                 if '(no debugging symbols found)' in l:
@@ -166,8 +167,8 @@ class PackageTests(OESelftestTestCase):
 
         def check_ownership(qemu, expected_gid, expected_uid, path):
             self.logger.info("Check ownership of %s", path)
-            status, output = qemu.run_serial('stat -c "%U %G" ' + path)
-            self.assertEqual(status, 1, "stat failed: " + output)
+            status, output = qemu.run_serial_socket('stat -c "%U %G" ' + path)
+            self.assertEqual(status, 0, "stat failed: " + output)
             try:
                 uid, gid = output.split()
                 self.assertEqual(uid, expected_uid)
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index f01e1eec66..be1481a82e 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -183,7 +183,7 @@ class QemuTest(OESelftestTestCase):
         # (such as the exception "Console connection closed unexpectedly")
         # as qemu will disappear when we shut it down
         qemu.runner.allowexit()
-        qemu.run_serial("shutdown -h now")
+        qemu.run_serial_socket("shutdown -h now")
         time_track = 0
         try:
             while True:
-- 
2.40.0


