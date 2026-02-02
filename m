Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509E9E7317C
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 13:54:38 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52590.1770040475499473517
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 05:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IamYfpwi;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8c69ffb226eso632078485a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 05:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770040474; x=1770645274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qe+TrByvlPxvDQ6C/P4JfHnk1OQVTLl7Y6uo9drlL/w=;
        b=IamYfpwiM7gDjyKE2u0S4ib89iRyEBCbjeX5cpxloMeU4kLpddAGVxAo000TEf1x9Y
         Wzt2LwFKZMl61oHgTMDfqG0w6/8orLpf2UHfWrhoEWi+W9jeAns3p6ev6FsKPvmW3dlK
         FWuAlZ2HRqjTOmOKqTVsdCv6B0oPpQ++2V1bX+yBqoIkoD7jvNcBN46sx4XAgRDn9IF6
         IkfX3EjAWviHUGuB25FzIiHCjRdXuDGBijlqqBc57KPgpbgHiyqzrXgUaEP9fsg6WkZR
         SYsFUIMhiiGurl2110UmFEzTY74OD7qOy52gHtxk/8O+3YkCjr/qyKoPOKwvugy7A3He
         lkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770040474; x=1770645274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qe+TrByvlPxvDQ6C/P4JfHnk1OQVTLl7Y6uo9drlL/w=;
        b=drOvnv1EZbNYaHuEQqA8FP92D6qOtHazlnceAfa8yNKCHTXu80Cxo6owNaFjiv6FTy
         yoeSsksW8CgLBUEBfuenUe42yDGcNQNW114Jome9CP+Qx58y/af2uoP8rqKeZSAzSjot
         r7mTkH3yKA2+3DQhHBJ+FUUAKXUyk11UEc18I7CB6KD7oNDeJcWmwmqU4Os0kEye4ClJ
         OQXvfs9vtwtigni/BvD1l67aS4AIkOK8jzTm5TUFyTzJk8sCwMAP86WKZvEOPw/edeaj
         EXpCJI7m2kHLiyhEwHyLwzYYxOe/N8+49eZSB2GWMXF/KRxU3JoPC4tGOuqy2fGAPxq0
         vIKA==
X-Gm-Message-State: AOJu0Yzk7NXoX3vgPEC3YuPwm7e2/GvWIITWy969woqZp+yPcGP6Fzoe
	YEaWKM8pg07cs7AUsR83wqQK29K7zJ75+Q9apVk5Mpnx4b52lUN+CA5uXCWlxfTm
X-Gm-Gg: AZuq6aLn4/pthgpHnXEQ4BfZGiGStRSYBCQtcQe9SQT7qlXkmsGRI5d4UI7c+xmsHSq
	Mxsff5qK/F4unIv/0v2U0QxgCzximusb9SPXXWYFYGCmXX7XIiMmvFfkyoD3qD1T/Azco0TyWpD
	mRBJPucdEU6Qmjm+2IfF5tncFI3YzbKoABBMD0cnOtDBWgV7Jgr8TgzKNxg3F7zFL3Ykpt7AWSz
	wRAnlJR8zwL34W/gbxN7tH3KsouW7Cy652yE7UfMMTSO12E1Up+mRYRYMOv6IJqfuxjNtCaJ8Be
	lqyLKnfSP5nDyKDcWgvw6lNVVwBxueYicM4EWwFRrekXdGZ3Pvqb4bXwoenr0CXLF4rcWNv4LB/
	zbccOnZLcRVqq53qxpEmsc1EBtsmk5TFQw1QOhsUQmRN/AFnrlJmqtGaujKp7o0Xhr3mqtzHbmu
	Ls8xYrgqanxiDFbxtKj7aovkHeQe1FNbR9wcA6deFK7/RQbYtw77nKHg==
X-Received: by 2002:a05:620a:7105:b0:8c6:b4c9:aa86 with SMTP id af79cd13be357-8c9eb24d39cmr1743052285a.36.1770040473500;
        Mon, 02 Feb 2026 05:54:33 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d2845fsm1248654585a.31.2026.02.02.05.54.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:54:32 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH 6/9] oe-selftest -r wic.ModifyTests -> PASS (except 1)
Date: Mon,  2 Feb 2026 08:54:11 -0500
Message-ID: <20260202135414.682558-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202135414.682558-1-twoerner@gmail.com>
References: <20260202135414.682558-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 13:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230358

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


