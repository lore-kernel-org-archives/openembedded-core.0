Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C04C77B6C
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 14:27:05 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.9585.1680877619583323165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Apr 2023 07:26:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=qFzmicO0;
 spf=pass (domain: baylibre.com, ip: 209.85.221.67, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f67.google.com with SMTP id g5so2504083wrb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 07:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680877618; x=1683469618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3YD0QfpGw5FRZjGbwlQNneZYAsfNpsNBWlbyxgnhWU=;
        b=qFzmicO0iHVrCIITu/8gPci+G+nL4xwkTusbOMWH5SwLYtAUM5IqGkb4DAuwAWQOh7
         6ALYY9OT7CvnIvSCYsL9xuRiX6XJZKMWQiAl0Apsp0EmgYancum0ik+21mgdliym8d7M
         JFD7NT+GQMHL1pwd/DO6LB2Oq2yey8PFinfNBWUrZHIx6fI8TwEZKWGqNfn29xNMIi1S
         38W5gt63YNOzhZ+pXqEbvU3U0E7EZ69QHsKE1EFY8tMfDfx3E2Ua1w8Q0wtMNfMMcoQX
         hiJg8uQ7JuPWg03VPrpJxeRHjGnqGsWPIhGGCzaCATGIPlv7swpxHnP9NnMITYXISNrZ
         o+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680877618; x=1683469618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3YD0QfpGw5FRZjGbwlQNneZYAsfNpsNBWlbyxgnhWU=;
        b=roRPmjUfWOjua3j33CnM1+qQtpydTm71Lp6WfoS8OnMgvjhUnBZTFHyWYOGkvY91fp
         XtFLAfE49CnHhj+/5G6hTfLda3llm+WeXfVZiUdVB+511lmv049U4IQx13lAtvDfT5W8
         EBjU4NV4TE5nNIoghj/lX2Wp3FEwG7jDbWN63uj+hcTRR+nag2FI4OCCZovSpvvzc4L/
         q0l9Vk8pg1j3r9flIL6PiBdklJEtwi8TYrMR7KMfjP55u5JAY1aXbwGg9O+bo3CrLsPS
         xmnMWPHmeDuMeb4cbB5P+cjR+QXJIRSoeMAmmuGkKV2vLglXANu7eahg7YJbe444iexI
         jBOA==
X-Gm-Message-State: AAQBX9cBLjLq1H+BjWdeeNMnBfFo11bc7FJDojG4JPlLLcMqoHQHFAeh
	7YoxevRjBYy6isMzBs1cZSNWBcAXiKTwyCO7kJU8BgMY
X-Google-Smtp-Source: AKy350Zf10osDF2yL0EH4S/uo7s0Wh63Mu5MqNDZOW4w2EVIADCUgrGo9I7z9gTQWTDbN/7UmEMJpw==
X-Received: by 2002:a5d:62cb:0:b0:2cf:e700:ca62 with SMTP id o11-20020a5d62cb000000b002cfe700ca62mr1469341wrv.9.1680877618128;
        Fri, 07 Apr 2023 07:26:58 -0700 (PDT)
Received: from midgar.. ([193.33.56.84])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d668d000000b002e61e002943sm4601403wru.116.2023.04.07.07.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 07:26:57 -0700 (PDT)
From: Louis Rannou <lrannou@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: khilman@baylibre.com,
	Louis Rannou <lrannou@baylibre.com>
Subject: [PATCH v3 2/2] oeqa/selftest: change deprecated usage of run_serial
Date: Fri,  7 Apr 2023 16:26:22 +0200
Message-Id: <20230407142622.632035-3-lrannou@baylibre.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230407142622.632035-1-lrannou@baylibre.com>
References: <20230407142622.632035-1-lrannou@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Apr 2023 14:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179825

Prefer the new function run_serial_socket. Change calls where the modification
is easy.

Signed-off-by: Louis Rannou <lrannou@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/debuginfod.py |  3 +-
 meta/lib/oeqa/selftest/cases/gdbserver.py  |  7 ++--
 meta/lib/oeqa/selftest/cases/locales.py    |  8 ++---
 meta/lib/oeqa/selftest/cases/overlayfs.py  | 42 ++++++++++++++--------
 meta/lib/oeqa/selftest/cases/package.py    |  7 ++--
 meta/lib/oeqa/selftest/cases/runqemu.py    |  2 +-
 6 files changed, 43 insertions(+), 26 deletions(-)

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
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index b4f0663828..753821490b 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -183,20 +183,24 @@ EOT
 
         with runqemu('core-image-minimal') as qemu:
             # Check that application service started
-            status, output = qemu.run_serial("systemctl status my-application")
+            status, output = qemu.run_serial_socket("systemctl status my-application")
+            self.assertEqual(0, status)
             self.assertTrue("active (exited)" in output, msg=output)
 
             # Check that overlay mounts are dependencies of our application unit
-            status, output = qemu.run_serial("systemctl list-dependencies my-application")
+            status, output = qemu.run_serial_socket("systemctl list-dependencies my-application")
+            self.assertEqual(0, status)
             self.assertTrue("overlayfs-user-overlays.service" in output, msg=output)
 
-            status, output = qemu.run_serial("systemctl list-dependencies overlayfs-user-overlays")
+            status, output = qemu.run_serial_socket("systemctl list-dependencies overlayfs-user-overlays")
+            self.assertEqual(0, status)
             self.assertTrue("usr-share-another\\x2doverlay\\x2dmount.mount" in output, msg=output)
             self.assertTrue("usr-share-my\\x2dapplication.mount" in output, msg=output)
 
             # Check that we have /mnt/overlay fs mounted as tmpfs and
             # /usr/share/my-application as an overlay (see overlayfs-user recipe)
-            status, output = qemu.run_serial("/bin/mount -t tmpfs,overlay")
+            status, output = qemu.run_serial_socket("/bin/mount -t tmpfs,overlay")
+            self.assertEqual(0, status)
 
             line = getline_qemu(output, "on /mnt/overlay")
             self.assertTrue(line and line.startswith("tmpfs"), msg=output)
@@ -360,7 +364,8 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
         bitbake('core-image-minimal')
 
         with runqemu('core-image-minimal', image_fstype='wic') as qemu:
-            status, output = qemu.run_serial("/bin/mount")
+            status, output = qemu.run_serial_socket("/bin/mount")
+            self.assertEqual(0, status)
 
             line = getline_qemu(output, "upperdir=/data/overlay-etc/upper")
             self.assertFalse(line, msg=output)
@@ -393,7 +398,8 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
         testFile = "/etc/my-test-data"
 
         with runqemu('core-image-minimal', image_fstype='wic', discard_writes=False) as qemu:
-            status, output = qemu.run_serial("/bin/mount")
+            status, output = qemu.run_serial_socket("/bin/mount")
+            self.assertEqual(0, status)
 
             line = getline_qemu(output, "/dev/sda3")
             self.assertTrue("/data" in output, msg=output)
@@ -402,19 +408,24 @@ OVERLAYFS_ETC_DEVICE = "/dev/sda3"
             self.assertTrue(line and line.startswith("/data/overlay-etc/upper on /etc type overlay"), msg=output)
 
             # check that lower layer is not available
-            status, output = qemu.run_serial("ls -1 /data/overlay-etc/lower")
+            status, output = qemu.run_serial_socket("ls -1 /data/overlay-etc/lower")
+            self.assertEqual(0, status)
             line = getline_qemu(output, "No such file or directory")
             self.assertTrue(line, msg=output)
 
-            status, output = qemu.run_serial("touch " + testFile)
-            status, output = qemu.run_serial("sync")
-            status, output = qemu.run_serial("ls -1 " + testFile)
+            status, output = qemu.run_serial_socket("touch " + testFile)
+            self.assertEqual(0, status)
+            status, output = qemu.run_serial_socket("sync")
+            self.assertEqual(0, status)
+            status, output = qemu.run_serial_socket("ls -1 " + testFile)
+            self.assertEqual(0, status)
             line = getline_qemu(output, testFile)
             self.assertTrue(line and line.startswith(testFile), msg=output)
 
         # Check that file exists in /etc after reboot
         with runqemu('core-image-minimal', image_fstype='wic') as qemu:
-            status, output = qemu.run_serial("ls -1 " + testFile)
+            status, output = qemu.run_serial_socket("ls -1 " + testFile)
+            self.assertEqual(0, status)
             line = getline_qemu(output, testFile)
             self.assertTrue(line and line.startswith(testFile), msg=output)
 
@@ -446,14 +457,17 @@ IMAGE_INSTALL:append = " overlayfs-user"
         bitbake('core-image-minimal')
 
         with runqemu('core-image-minimal', image_fstype='wic') as qemu:
-            status, output = qemu.run_serial("echo \"Modified in upper\" > /etc/" + testFile)
-            status, output = qemu.run_serial("diff /etc/" + testFile + " /data/overlay-etc/lower/" + testFile)
+            status, output = qemu.run_serial_socket("echo \"Modified in upper\" > /etc/" + testFile)
+            self.assertEqual(0, status)
+            status, output = qemu.run_serial_socket("diff /etc/" + testFile + " /data/overlay-etc/lower/" + testFile)
+            self.assertEqual(0, status)
             line = getline_qemu(output, "Modified in upper")
             self.assertTrue(line, msg=output)
             line = getline_qemu(output, "Original file")
             self.assertTrue(line, msg=output)
 
-            status, output = qemu.run_serial("touch /data/overlay-etc/lower/ro-test.txt")
+            status, output = qemu.run_serial_socket("touch /data/overlay-etc/lower/ro-test.txt")
+            self.assertEqual(0, status)
             line = getline_qemu(output, "Read-only file system")
             self.assertTrue(line, msg=output)
 
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


