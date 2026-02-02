Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3327E7DF15
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 17:08:19 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57909.1770052095216939618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 09:08:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C/PfKwr0;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8c7199e7f79so736642285a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 09:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770052093; x=1770656893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qe+TrByvlPxvDQ6C/P4JfHnk1OQVTLl7Y6uo9drlL/w=;
        b=C/PfKwr0IPZPlCVaw5aPXckWhf8Oi6Rg00rMgoZ406PlpeIsE+zAhxfgmBDWtHoPXP
         MpN811nnNhrlnUlG+uhFlh9favH1crSM2sDXooGs0BraqhM6OfPtV8swAnq6nLhRigHs
         8cODUtGfaK/CJnRtq8fkJvgObDTNeRKvBZk3NfQ+KTbwzcDS0MkgQEzQR98TxxrE9Uhv
         VzmcMbX2nAzOo/Oz1pZ4jk6ahteBZn9G+YWVH46GUzIwrdtzbSNji4qXFePhIDvdmaQw
         HnieJ09PBBKHzd9oV1x3o33vX0ETRUilgupJG0PrcY3MAU/AUB+Xx2diSaXatUl09Uu2
         6cVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770052093; x=1770656893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qe+TrByvlPxvDQ6C/P4JfHnk1OQVTLl7Y6uo9drlL/w=;
        b=Pdnj+84eakSZktudwTaqW0YLtMUZc7jaXXRB0tqUygNxGEF2HJz4Lm7JoV38NUypB/
         sSaLkI+QD0lj2ZyIpAJTmYzTqwWiiV0IqVbEfSU5osfHKPWgTqnE8mmMloIxC9fBOw94
         3LkYr9Pc2zvL7Bxi4L8I1s2QiwydVOgB3CapA5h5pZDGsKXRcu8OcXU+Szlh5AcpwyDX
         5ymO4cfHprDZeXvNRaatgn5uXylAZoqf8FHv+uXbKCRhRwFI95azxvRW4AE0UpHLjBzW
         tNd73WpFBmrShc6uJyP/fbLMYuSl+qnjzR6JNFtIN67Qd/7k5UcoKli4ZANCTwvq1K4L
         SubQ==
X-Gm-Message-State: AOJu0Yzed3ecA5r2sQDM/XlSh+RUdTYlFCCzMMcosXfUV3tf02hJW250
	OiJl2TvOFVkj3nIQSPyDOGkauDbgBEIP3f/unxM92QdqnyKBVoeQnfVGuGQomlb4
X-Gm-Gg: AZuq6aJKUUdHnrnQdU0qcHvTy7sP7Z5o3qiPHJGqFbrnbCp7/77lfp/JifyRU4CrQ4K
	DEwgIVuUVbknqPjUAA1qTrBhEOrPC7TkCkZSimBVcXeIp3py6K05KYxzdAUFt0/K8eHa1bqgoV/
	supHfrKzAjL0DSgdQwafulkSo30sCTTxLfxC3jIsbJSkQfaiiW9jbjZqZINL5SKi4Vl4TI+F1P8
	xAdtLJnVL2loWdmE1FbfsWKrsNNMn41JQN9ZiOrUk3UNmd/WDiBF2x6aewtEX4+oTYPRYtV2vAu
	uBzFgZrS6eq8OGURUKpzOaQZ9IbtVU3Nh/ahahEmIAgk7xP63gZcZNUhQBxcTDoW6P8jkS7/Dzh
	AR+DpuwMulxnRy9NlzO3V4c0xMzqUHFgvM1S3qdBgToxXBmcnHgsmKc3+nYDAoJMcLLqdCOSIF3
	dEVXyfRDZ9XqkcT5Paz3Z+osmtXtVghu8BG8h+KeS23hwdXKWnUqdP9A==
X-Received: by 2002:a05:620a:298d:b0:8c6:afa6:2700 with SMTP id af79cd13be357-8c9eb2fad44mr1620905585a.47.1770052093002;
        Mon, 02 Feb 2026 09:08:13 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca02f07efasm502815585a.51.2026.02.02.09.08.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:08:11 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH v2 6/9] oe-selftest -r wic.ModifyTests -> PASS (except 1)
Date: Mon,  2 Feb 2026 12:07:57 -0500
Message-ID: <20260202170800.4172778-7-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202170800.4172778-1-twoerner@gmail.com>
References: <20260202170800.4172778-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 17:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230385

Changes for the wic.ModifyTests oe-selftests to pass now that wic is a
stand-alone app and no longer part of oe-core.

NOTE: wic.ModifyTests.test_wic_cp_ext fails

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 82 ++++++++++++++---------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index d8f89e79e7f2..0dc17dcd5614 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1958,44 +1958,44 @@ INITRAMFS_IMAGE = "core-image-initramfs-boot"
 class ModifyTests(WicTestCase):
     def test_wic_ls(self):
         """Test listing image content using 'wic ls'"""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         images = glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))
         self.assertEqual(1, len(images))
 
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
 
         # list partitions
-        result = runCmd("wic ls %s -n %s" % (images[0], sysroot))
+        result = runCmd("wic ls %s -n %s --vars %s" % (images[0], sysroot, self.envfile))
         self.assertEqual(3, len(result.output.split('\n')))
 
         # list directory content of the first partition
-        result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
+        result = runCmd("wic ls %s:1/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
         self.assertEqual(6, len(result.output.split('\n')))
 
     def test_wic_cp(self):
         """Test copy files and directories to the the wic image."""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         images = glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))
         self.assertEqual(1, len(images))
 
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
 
         # list directory content of the first partition
-        result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
+        result = runCmd("wic ls %s:1/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
         self.assertEqual(6, len(result.output.split('\n')))
 
         with NamedTemporaryFile("w", suffix=".wic-cp") as testfile:
             testfile.write("test")
 
             # copy file to the partition
-            runCmd("wic cp %s %s:1/ -n %s" % (testfile.name, images[0], sysroot))
+            runCmd("wic cp %s %s:1/ -n %s --vars %s" % (testfile.name, images[0], sysroot, self.envfile))
 
             # check if file is there
-            result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
+            result = runCmd("wic ls %s:1/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
             self.assertEqual(7, len(result.output.split('\n')))
             self.assertIn(os.path.basename(testfile.name), result.output)
 
@@ -2006,25 +2006,25 @@ class ModifyTests(WicTestCase):
             copy(testfile.name, testdir)
 
             # copy directory to the partition
-            runCmd("wic cp %s %s:1/ -n %s" % (testdir, images[0], sysroot))
+            runCmd("wic cp %s %s:1/ -n %s --vars %s" % (testdir, images[0], sysroot, self.envfile))
 
             # check if directory is there
-            result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
+            result = runCmd("wic ls %s:1/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
             self.assertEqual(8, len(result.output.split('\n')))
             self.assertIn(os.path.basename(testdir), result.output)
 
             # copy the file from the partition and check if it success
             dest = '%s-cp' % testfile.name
-            runCmd("wic cp %s:1/%s %s -n %s" % (images[0],
-                    os.path.basename(testfile.name), dest, sysroot))
+            runCmd("wic cp %s:1/%s %s -n %s --vars %s" % (images[0],
+                    os.path.basename(testfile.name), dest, sysroot, self.envfile))
             self.assertTrue(os.path.exists(dest), msg="File %s wasn't generated as expected" % dest)
 
 
     def test_wic_rm(self):
         """Test removing files and directories from the the wic image."""
-        runCmd("wic create mkefidisk "
+        runCmd("wic create mkefidisk --vars %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         images = glob(os.path.join(self.resultdir, "mkefidisk-*.direct"))
         self.assertEqual(1, len(images))
 
@@ -2033,48 +2033,48 @@ class ModifyTests(WicTestCase):
         kerneltype = get_bb_var('KERNEL_IMAGETYPE', 'virtual/kernel')
 
         # list directory content of the first partition
-        result = runCmd("wic ls %s:1 -n %s" % (images[0], sysroot))
+        result = runCmd("wic ls %s:1 -n %s --vars %s" % (images[0], sysroot, self.envfile))
         self.assertIn('\n%s ' % kerneltype.upper(), result.output)
         self.assertIn('\nEFI          <DIR>     ', result.output)
 
         # remove file. EFI partitions are case-insensitive so exercise that too
-        runCmd("wic rm %s:1/%s -n %s" % (images[0], kerneltype.lower(), sysroot))
+        runCmd("wic rm %s:1/%s -n %s --vars %s" % (images[0], kerneltype.lower(), sysroot, self.envfile))
 
         # remove directory
-        runCmd("wic rm %s:1/efi -n %s" % (images[0], sysroot))
+        runCmd("wic rm %s:1/efi -n %s --vars %s" % (images[0], sysroot, self.envfile))
 
         # check if they're removed
-        result = runCmd("wic ls %s:1 -n %s" % (images[0], sysroot))
+        result = runCmd("wic ls %s:1 -n %s --vars %s" % (images[0], sysroot, self.envfile))
         self.assertNotIn('\n%s        ' % kerneltype.upper(), result.output)
         self.assertNotIn('\nEFI          <DIR>     ', result.output)
 
     def test_wic_ls_ext(self):
         """Test listing content of the ext partition using 'wic ls'"""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         images = glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))
         self.assertEqual(1, len(images))
 
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
 
         # list directory content of the second ext4 partition
-        result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
+        result = runCmd("wic ls %s:2/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
         self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(
                             set(line.split()[-1] for line in result.output.split('\n') if line)), msg="Expected directories not present %s" % result.output)
 
     def test_wic_cp_ext(self):
         """Test copy files and directories to the ext partition."""
-        runCmd("wic create wictestdisk "
+        runCmd("wic create wictestdisk --vars %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         images = glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))
         self.assertEqual(1, len(images))
 
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
 
         # list directory content of the ext4 partition
-        result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
+        result = runCmd("wic ls %s:2/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
         dirs = set(line.split()[-1] for line in result.output.split('\n') if line)
         self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(dirs), msg="Expected directories not present %s" % dirs)
 
@@ -2082,20 +2082,20 @@ class ModifyTests(WicTestCase):
             testfile.write("test")
 
             # copy file to the partition
-            runCmd("wic cp %s %s:2/ -n %s" % (testfile.name, images[0], sysroot))
+            runCmd("wic cp %s %s:2/ -n %s --vars %s" % (testfile.name, images[0], sysroot, self.envfile))
 
             # check if file is there
-            result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
+            result = runCmd("wic ls %s:2/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
             newdirs = set(line.split()[-1] for line in result.output.split('\n') if line)
             self.assertEqual(newdirs.difference(dirs), set([os.path.basename(testfile.name)]))
 
             # check if the file to copy is in the partition
-            result = runCmd("wic ls %s:2/etc/ -n %s" % (images[0], sysroot))
+            result = runCmd("wic ls %s:2/etc/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
             self.assertIn('fstab', [line.split()[-1] for line in result.output.split('\n') if line])
 
             # copy file from the partition, replace the temporary file content with it and
             # check for the file size to validate the copy
-            runCmd("wic cp %s:2/etc/fstab %s -n %s" % (images[0], testfile.name, sysroot))
+            runCmd("wic cp %s:2/etc/fstab %s -n %s --vars %s" % (images[0], testfile.name, sysroot, self.envfile))
             self.assertTrue(os.stat(testfile.name).st_size > 0, msg="Filesize not as expected %s" % os.stat(testfile.name).st_size)
 
             # prepare directory structure
@@ -2114,16 +2114,16 @@ class ModifyTests(WicTestCase):
                 f.write("sub-level\n")
 
             # copy directory to the partition root
-            runCmd("wic cp %s %s:2/ -n %s" % (testdir, images[0], sysroot))
+            runCmd("wic cp %s %s:2/ -n %s --vars %s" % (testdir, images[0], sysroot, self.envfile))
             basedir = os.path.basename(testdir)
 
             # check if directory is there at partition root
-            result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
+            result = runCmd("wic ls %s:2/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
             root_entries = set(line.split()[-1] for line in result.output.split('\n') if line)
             self.assertIn(basedir, root_entries, msg="Expected directory not present at root: %s" % root_entries)
 
             # list INSIDE the copied directory
-            result = runCmd("wic ls %s:2/%s/ -n %s" % (images[0], basedir, sysroot))
+            result = runCmd("wic ls %s:2/%s/ -n %s --vars %s" % (images[0], basedir, sysroot, self.envfile))
             self.assertEqual(0, result.status,
                              msg="wic ls inside copied directory failed. Output:\n%s" % result.output)
             self.assertNotIn("Ext2 inode is not a directory", result.output,
@@ -2134,7 +2134,7 @@ class ModifyTests(WicTestCase):
                             msg="Expected entries missing inside dir: %s" % inside_entries)
 
             # list inside the subdir
-            result = runCmd("wic ls %s:2/%s/subdir/ -n %s" % (images[0], basedir, sysroot))
+            result = runCmd("wic ls %s:2/%s/subdir/ -n %s --vars %s" % (images[0], basedir, sysroot, self.envfile))
             self.assertEqual(0, result.status,
                              msg="wic ls inside copied subdir failed. Output:\n%s" % result.output)
             self.assertNotIn("Ext2 inode is not a directory", result.output,
@@ -2146,7 +2146,7 @@ class ModifyTests(WicTestCase):
             # copy directory from the partition and compare with original
             outparent = os.path.join(self.resultdir, "wic-test-cp-ext-out")
             os.makedirs(outparent)
-            runCmd("wic cp %s:2/%s %s -n %s" % (images[0], basedir, outparent, sysroot))
+            runCmd("wic cp %s:2/%s %s -n %s --vars %s" % (images[0], basedir, outparent, sysroot, self.envfile))
 
             copied_dir = os.path.join(outparent, basedir)
             self.assertTrue(os.path.isdir(copied_dir), msg="Copied-back directory not created: %s" % copied_dir)
@@ -2165,28 +2165,28 @@ class ModifyTests(WicTestCase):
 
     def test_wic_rm_ext(self):
         """Test removing files from the ext partition."""
-        runCmd("wic create mkefidisk "
+        runCmd("wic create mkefidisk --vars %s "
                                    "--image-name=core-image-minimal "
-                                   "-D -o %s" % self.resultdir)
+                                   "-D -o %s" % (self.envfile, self.resultdir))
         images = glob(os.path.join(self.resultdir, "mkefidisk-*.direct"))
         self.assertEqual(1, len(images))
 
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
 
         # list directory content of the /etc directory on ext4 partition
-        result = runCmd("wic ls %s:2/etc/ -n %s" % (images[0], sysroot))
+        result = runCmd("wic ls %s:2/etc/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
         self.assertIn('fstab', [line.split()[-1] for line in result.output.split('\n') if line])
 
         # remove file
-        runCmd("wic rm %s:2/etc/fstab -n %s" % (images[0], sysroot))
+        runCmd("wic rm %s:2/etc/fstab -n %s --vars %s" % (images[0], sysroot, self.envfile))
 
         # check if it's removed
-        result = runCmd("wic ls %s:2/etc/ -n %s" % (images[0], sysroot))
+        result = runCmd("wic ls %s:2/etc/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
         self.assertNotIn('fstab', [line.split()[-1] for line in result.output.split('\n') if line])
 
         # remove non-empty directory
-        runCmd("wic rm -r %s:2/etc/ -n %s" % (images[0], sysroot))
+        runCmd("wic rm -r %s:2/etc/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
 
         # check if it's removed
-        result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
+        result = runCmd("wic ls %s:2/ -n %s --vars %s" % (images[0], sysroot, self.envfile))
         self.assertNotIn('etc', [line.split()[-1] for line in result.output.split('\n') if line])
-- 
2.51.0


