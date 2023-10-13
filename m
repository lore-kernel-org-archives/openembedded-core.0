Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0040AC46CA1
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:54:13 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.51192.1697234045902729438
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OWOVO6R9;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.50, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-57b9231e91dso1424127eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697234045; x=1697838845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bMIU1tGiPzWI68vui9IuulIpBhdqmef9uTzPXGiGWCE=;
        b=OWOVO6R9wlIV2RccXOacBLt7y1crURhf+OV+wO4SiMEC8CMET7q+vSSHe64X8JJ0Wz
         SnjP8yKzRKA+t5iiF0gAOjRLoxOsO1o7lx5HxsggsKsiab6UrQYthE6huH/xd4czVeA/
         6V67Y3+7l06SBr8H91Sthwuj4VNKFp+41LgiWndDHdVDbpaFkoLT5nJZxldE18deVPn+
         zVnCDG38bQtdvc7Fu7VNiPgI3g98onO8U0Ea3VGJetyR/Y1z3L5hVKpp92tUqhfgagaJ
         qvjJTUzx+A6eiDJDL+fBB2I7rr/1OtfmDBzBA6uKlesflmRLwpf+kBu8C/TBvSDiaKiX
         goOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697234045; x=1697838845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMIU1tGiPzWI68vui9IuulIpBhdqmef9uTzPXGiGWCE=;
        b=DHrYmhOFrcM7zhQH/mNdh3py9eD9jAqvaDCJOpwdAcwnIbBfmskzkXb0Tw17gTzyDA
         GAKbyefpX7PMojm0gHNInyi7wa5ZU4J37P/ZBFJVYSHYz3Fw05c6L7Hj3t2KeNxM2+lg
         17gxU6e+pSgxTt5Pv9eMWunViXPRQBjk1bcPfDq/aWC8Efx9lY5XRWYIs3yU3D5TcBwo
         Yk26Nxw51qCESk1ZATshrUnoJmLBoQSBkKLhtO5HBEyPcn1Edl1g5DTHSFxCr3+iKYmL
         7y6zB/L4FPYoAr9LcBXkbBTovWTJUeQDK777jsE5W4huz/liJwjjVJyWfODCXMPZ8zo0
         hmGg==
X-Gm-Message-State: AOJu0YxmnejkThnEbQ9GcmsImri5SUqG4yMpoDQsWUYvK7H+Oo7DPgvO
	JYeNN+Ll2YTrtNJmkYmUAHA/FxdX7IFfv4C3hM4=
X-Google-Smtp-Source: AGHT+IEqudJkZgm5isQ7AZU18wGBezig8EW3vJtTGaAeoR7yRqxhJdCmrzHJ/8nJwSQtoENYqk701g==
X-Received: by 2002:a05:6358:98a8:b0:140:f00a:ee2c with SMTP id q40-20020a05635898a800b00140f00aee2cmr35824216rwa.11.1697234044755;
        Fri, 13 Oct 2023 14:54:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.54.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:54:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 26/27] oeqa/selftest/wic: Improve assertTrue calls
Date: Fri, 13 Oct 2023 11:52:50 -1000
Message-Id: <52a2455ba7d91d404fc2c4568c805cf1fbe2b2ad.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189103

From: Richard Purdie <richard.purdie@linuxfoundation.org>

assertTrue is a problematic call use in test cases since when it fails,
you just get an unhelpful "False is not True" message.

Replace some uses with assertIn/assertNotIn which will give more helpful results
and for the rest, add msg entries which given more helpful debugging.

For example, this patch would help debugging of #15176.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35d4c39e0df1a304f557471151a03d1e4b0f30c7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 36 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b26b649c3a..760b1c67ce 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -729,7 +729,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
         wicout = glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))
         self.assertEqual(1, len(wicout))
         size = os.path.getsize(wicout[0])
-        self.assertTrue(size > extraspace)
+        self.assertTrue(size > extraspace, msg="Extra space not present (%s vs %s)" % (size, extraspace))
 
 class Wic2(WicTestCase):
 
@@ -756,7 +756,7 @@ class Wic2(WicTestCase):
         basename = bb_vars['IMAGE_BASENAME']
         self.assertEqual(basename, image)
         path = os.path.join(imgdatadir, basename) + '.env'
-        self.assertTrue(os.path.isfile(path))
+        self.assertTrue(os.path.isfile(path), msg="File %s wasn't generated as expected" % path)
 
         wicvars = set(bb_vars['WICVARS'].split())
         # filter out optional variables
@@ -769,7 +769,7 @@ class Wic2(WicTestCase):
             # test if variables used by wic present in the .env file
             for var in wicvars:
                 self.assertTrue(var in content, "%s is not in .env file" % var)
-                self.assertTrue(content[var])
+                self.assertTrue(content[var], "%s doesn't have a value (%s)" % (var, content[var]))
 
     def test_image_vars_dir_short(self):
         """Test image vars directory selection -v option"""
@@ -816,8 +816,8 @@ class Wic2(WicTestCase):
         # pointing to existing files
         for suffix in ('wic', 'manifest'):
             path = prefix + suffix
-            self.assertTrue(os.path.islink(path))
-            self.assertTrue(os.path.isfile(os.path.realpath(path)))
+            self.assertTrue(os.path.islink(path), msg="Link %s wasn't generated as expected" % path)
+            self.assertTrue(os.path.isfile(os.path.realpath(path)), msg="File linked to by %s wasn't generated as expected" % path)
 
     # TODO this should work on aarch64
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
@@ -1087,7 +1087,7 @@ class Wic2(WicTestCase):
         self.remove_config(config)
         bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
         image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], '%s.wic' % bb_vars['IMAGE_LINK_NAME'])
-        self.assertTrue(os.path.exists(image_path))
+        self.assertTrue(os.path.exists(image_path), msg="Image file %s wasn't generated as expected" % image_path)
 
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
 
@@ -1328,11 +1328,11 @@ class Wic2(WicTestCase):
             orig_sizes = [int(line.split()[3]) for line in orig.output.split('\n')[1:]]
             exp_sizes = [int(line.split()[3]) for line in exp.output.split('\n')[1:]]
             self.assertEqual(orig_sizes[0], exp_sizes[0]) # first partition is not resized
-            self.assertTrue(orig_sizes[1] < exp_sizes[1])
+            self.assertTrue(orig_sizes[1] < exp_sizes[1], msg="Parition size wasn't enlarged (%s vs %s)" % (orig_sizes[1], exp_sizes[1]))
 
             # Check if all free space is partitioned
             result = runCmd("%s/usr/sbin/sfdisk -F %s" % (sysroot, new_image_path))
-            self.assertTrue("0 B, 0 bytes, 0 sectors" in result.output)
+            self.assertIn("0 B, 0 bytes, 0 sectors", result.output)
 
             os.rename(image_path, image_path + '.bak')
             os.rename(new_image_path, image_path)
@@ -1390,7 +1390,7 @@ class ModifyTests(WicTestCase):
             # check if file is there
             result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
             self.assertEqual(7, len(result.output.split('\n')))
-            self.assertTrue(os.path.basename(testfile.name) in result.output)
+            self.assertIn(os.path.basename(testfile.name), result.output)
 
             # prepare directory
             testdir = os.path.join(self.resultdir, 'wic-test-cp-dir')
@@ -1404,13 +1404,13 @@ class ModifyTests(WicTestCase):
             # check if directory is there
             result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
             self.assertEqual(8, len(result.output.split('\n')))
-            self.assertTrue(os.path.basename(testdir) in result.output)
+            self.assertIn(os.path.basename(testdir), result.output)
 
             # copy the file from the partition and check if it success
             dest = '%s-cp' % testfile.name
             runCmd("wic cp %s:1/%s %s -n %s" % (images[0],
                     os.path.basename(testfile.name), dest, sysroot))
-            self.assertTrue(os.path.exists(dest))
+            self.assertTrue(os.path.exists(dest), msg="File %s wasn't generated as expected" % dest)
 
 
     def test_wic_rm(self):
@@ -1454,7 +1454,7 @@ class ModifyTests(WicTestCase):
         # list directory content of the second ext4 partition
         result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
         self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(
-                            set(line.split()[-1] for line in result.output.split('\n') if line)))
+                            set(line.split()[-1] for line in result.output.split('\n') if line)), msg="Expected directories not present %s" % result.output)
 
     def test_wic_cp_ext(self):
         """Test copy files and directories to the ext partition."""
@@ -1469,7 +1469,7 @@ class ModifyTests(WicTestCase):
         # list directory content of the ext4 partition
         result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
         dirs = set(line.split()[-1] for line in result.output.split('\n') if line)
-        self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(dirs))
+        self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(dirs), msg="Expected directories not present %s" % dirs)
 
         with NamedTemporaryFile("w", suffix=".wic-cp") as testfile:
             testfile.write("test")
@@ -1484,12 +1484,12 @@ class ModifyTests(WicTestCase):
 
             # check if the file to copy is in the partition
             result = runCmd("wic ls %s:2/etc/ -n %s" % (images[0], sysroot))
-            self.assertTrue('fstab' in [line.split()[-1] for line in result.output.split('\n') if line])
+            self.assertIn('fstab', [line.split()[-1] for line in result.output.split('\n') if line])
 
             # copy file from the partition, replace the temporary file content with it and
             # check for the file size to validate the copy
             runCmd("wic cp %s:2/etc/fstab %s -n %s" % (images[0], testfile.name, sysroot))
-            self.assertTrue(os.stat(testfile.name).st_size > 0)
+            self.assertTrue(os.stat(testfile.name).st_size > 0, msg="Filesize not as expected %s" % os.stat(testfile.name).st_size)
 
 
     def test_wic_rm_ext(self):
@@ -1504,18 +1504,18 @@ class ModifyTests(WicTestCase):
 
         # list directory content of the /etc directory on ext4 partition
         result = runCmd("wic ls %s:2/etc/ -n %s" % (images[0], sysroot))
-        self.assertTrue('fstab' in [line.split()[-1] for line in result.output.split('\n') if line])
+        self.assertIn('fstab', [line.split()[-1] for line in result.output.split('\n') if line])
 
         # remove file
         runCmd("wic rm %s:2/etc/fstab -n %s" % (images[0], sysroot))
 
         # check if it's removed
         result = runCmd("wic ls %s:2/etc/ -n %s" % (images[0], sysroot))
-        self.assertTrue('fstab' not in [line.split()[-1] for line in result.output.split('\n') if line])
+        self.assertNotIn('fstab', [line.split()[-1] for line in result.output.split('\n') if line])
 
         # remove non-empty directory
         runCmd("wic rm -r %s:2/etc/ -n %s" % (images[0], sysroot))
 
         # check if it's removed
         result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
-        self.assertTrue('etc' not in [line.split()[-1] for line in result.output.split('\n') if line])
+        self.assertNotIn('etc', [line.split()[-1] for line in result.output.split('\n') if line])
-- 
2.34.1


