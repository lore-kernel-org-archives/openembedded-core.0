Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF4ECD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 12:41:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.50112.1695040857558579956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 05:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TR3kS3yg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-404773f2501so39784085e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 05:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695040856; x=1695645656; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AygmbgcpRX7JADnvjCxLDrzqGTC1HLINGxQacqFv40g=;
        b=TR3kS3ygASYGe7ZIOJrqTDiYGpTsudM4TeA9HveaoyqpRj+Y5pUNnYcHIaOMZnVLn7
         QzMxyK8UjrnBPE+9TXEFKOfcd3DEZ4DIUdsFBcMjC9KjND/lWe+2pyvV5Dx4/1Cwi6zF
         aYvlP8i2LAkyHK7li0hG4rGdggj9xuCmszu/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695040856; x=1695645656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AygmbgcpRX7JADnvjCxLDrzqGTC1HLINGxQacqFv40g=;
        b=MlYRlAVsWFS7f1pf8IpeFVn+46PRq5CYL57z0NU6iQ2qjjAJxaOl7mpFciAsUnmL8h
         ndPm96/eERvOQT4/KXHp6zfLVBnAG0Dg76NqtHU8spQleuSQMrEKmw1c5v4na6M5yCtN
         5tLmjHdM9vk8Wa2VGWnBUK05msoHGEM8TYj2/uy+J3e6nKv0r0p7Z/pEOGjumlvF7sNr
         IGySfAKj9lEPIyHxXx7kW8+y+FCS4qfOI6n+FwZkdOrSXIFlo3WfHWdOmJyh06GHdyCO
         AtLjvp0cpirMOiFajwFGI1vPyEiwg2uSoVkgQ3TtTU3jiicY41oJMZkMLlTja8Exj+AG
         FC1A==
X-Gm-Message-State: AOJu0YwxD5lVZzgftn046S+xJRkmq8/sldMBaPpV6XiSamRLV09JwaLi
	9xmPgDutLJQuhmaimB7BHMEONuXbX+ilOIcDRcY=
X-Google-Smtp-Source: AGHT+IGEFRNSRmlxOlwxLjYlCwVRA/f178Q+lg1UPIf3qrPNOZ2GRhA6DBKtKdkyYU7uz7MuOcZifQ==
X-Received: by 2002:a05:600c:ac5:b0:401:a0b1:aef6 with SMTP id c5-20020a05600c0ac500b00401a0b1aef6mr8159052wmr.2.1695040855592;
        Mon, 18 Sep 2023 05:40:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c207:9dee:97a6:8348])
        by smtp.gmail.com with ESMTPSA id a4-20020a05600c068400b004042dbb8925sm12188023wmn.38.2023.09.18.05.40.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 05:40:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/wic: Improve assertTrue calls
Date: Mon, 18 Sep 2023 13:40:54 +0100
Message-Id: <20230918124054.697433-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 12:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187830

assertTrue is a problematic call use in test cases since when it fails,
you just get an unhelpful "False is not True" message.

Replace some uses with assertIn/assertNotIn which will give more helpful results
and for the rest, add msg entries which given more helpful debugging.

For example, this patch would help debugging of #15176.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 36 ++++++++++++++---------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index aa61349ed12..b4866bcb323 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -729,7 +729,7 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
         wicout = glob(os.path.join(self.resultdir, "wictestdisk-*.direct"))
         self.assertEqual(1, len(wicout))
         size = os.path.getsize(wicout[0])
-        self.assertTrue(size > extraspace)
+        self.assertTrue(size > extraspace, msg="Extra space not present (%s vs %s)" % (size, extraspace))
 
     def test_no_table(self):
         """Test --no-table wks option."""
@@ -773,7 +773,7 @@ class Wic2(WicTestCase):
         basename = bb_vars['IMAGE_BASENAME']
         self.assertEqual(basename, image)
         path = os.path.join(imgdatadir, basename) + '.env'
-        self.assertTrue(os.path.isfile(path))
+        self.assertTrue(os.path.isfile(path), msg="File %s wasn't generated as expected" % path)
 
         wicvars = set(bb_vars['WICVARS'].split())
         # filter out optional variables
@@ -786,7 +786,7 @@ class Wic2(WicTestCase):
             # test if variables used by wic present in the .env file
             for var in wicvars:
                 self.assertTrue(var in content, "%s is not in .env file" % var)
-                self.assertTrue(content[var])
+                self.assertTrue(content[var], "%s doesn't have a value (%s)" % (var, content[var]))
 
     def test_image_vars_dir_short(self):
         """Test image vars directory selection -v option"""
@@ -833,8 +833,8 @@ class Wic2(WicTestCase):
         # pointing to existing files
         for suffix in ('wic', 'manifest'):
             path = prefix + suffix
-            self.assertTrue(os.path.islink(path))
-            self.assertTrue(os.path.isfile(os.path.realpath(path)))
+            self.assertTrue(os.path.islink(path), msg="Link %s wasn't generated as expected" % path)
+            self.assertTrue(os.path.isfile(os.path.realpath(path)), msg="File linked to by %s wasn't generated as expected" % path)
 
     # TODO this should work on aarch64
     @skipIfNotArch(['i586', 'i686', 'x86_64'])
@@ -1104,7 +1104,7 @@ class Wic2(WicTestCase):
         self.remove_config(config)
         bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
         image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], '%s.wic' % bb_vars['IMAGE_LINK_NAME'])
-        self.assertTrue(os.path.exists(image_path))
+        self.assertTrue(os.path.exists(image_path), msg="Image file %s wasn't generated as expected" % image_path)
 
         sysroot = get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools')
 
@@ -1345,11 +1345,11 @@ class Wic2(WicTestCase):
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
@@ -1433,7 +1433,7 @@ class ModifyTests(WicTestCase):
             # check if file is there
             result = runCmd("wic ls %s:1/ -n %s" % (images[0], sysroot))
             self.assertEqual(7, len(result.output.split('\n')))
-            self.assertTrue(os.path.basename(testfile.name) in result.output)
+            self.assertIn(os.path.basename(testfile.name), result.output)
 
             # prepare directory
             testdir = os.path.join(self.resultdir, 'wic-test-cp-dir')
@@ -1447,13 +1447,13 @@ class ModifyTests(WicTestCase):
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
@@ -1497,7 +1497,7 @@ class ModifyTests(WicTestCase):
         # list directory content of the second ext4 partition
         result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
         self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(
-                            set(line.split()[-1] for line in result.output.split('\n') if line)))
+                            set(line.split()[-1] for line in result.output.split('\n') if line)), msg="Expected directories not present %s" % result.output)
 
     def test_wic_cp_ext(self):
         """Test copy files and directories to the ext partition."""
@@ -1512,7 +1512,7 @@ class ModifyTests(WicTestCase):
         # list directory content of the ext4 partition
         result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
         dirs = set(line.split()[-1] for line in result.output.split('\n') if line)
-        self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(dirs))
+        self.assertTrue(set(['bin', 'home', 'proc', 'usr', 'var', 'dev', 'lib', 'sbin']).issubset(dirs), msg="Expected directories not present %s" % dirs)
 
         with NamedTemporaryFile("w", suffix=".wic-cp") as testfile:
             testfile.write("test")
@@ -1527,12 +1527,12 @@ class ModifyTests(WicTestCase):
 
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
@@ -1547,18 +1547,18 @@ class ModifyTests(WicTestCase):
 
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
2.39.2


