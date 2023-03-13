Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651B2C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 12:16:04 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.18085.1678709763724408824
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 05:16:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k7R8G0L0;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id y4so18379978edo.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 05:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678709762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxF2tG8wEUCxlxQ7IJA6KmC+x3V1m3dWrrlezVh6IRw=;
        b=k7R8G0L05ZgbXhPEhkXmpmuXAjOrUiD5f3eLnT2nGm7HKfgRaMqAlNrLJaW6VhOZnG
         55jRXn9EbMhKqB9UKs6PvSSaWFeEk5sLXqA3pNF50qa9byeqeP9kIzcy/70L6j7TM0Ps
         /htuNefZbPXVn8DZRTCMoOqPShC5CTwKM3wasjUCJ1XKFi/LMiALUR08TtabmJNDysMH
         fuTF19/izrQ4aJOCNIhovbfRs1Zisyb71PbPFrmg98gZCAyPW6A7nsZN3u+bO40WBLdI
         4PGxUeWG6Nzo9kGMKGUNCpStk4yttqEMMq01KeZNSLP9CvmAMou6kLFIH/7JjOk5bCYq
         R8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678709762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxF2tG8wEUCxlxQ7IJA6KmC+x3V1m3dWrrlezVh6IRw=;
        b=n58aZVBrq+zKe8GxVPQHO2pFudX/EhrXXOjE1UmiUigz5PjvaUYZeVUeITr4uoFKoN
         GyJZYNPk5+GPLTWBzVWx3gXGsr92cj1sk2tVyXJI8786JyTpO/td04+16cIbdS46Eskh
         g2aAKxPBPrdKn2fRoaOpYShCmRJhB9bbrh7i/6jjBk+RHM+aSyRBZumxneJ4Lka1wDc8
         jc23ieyZXasVNn9RmQCSqVvRSm+4Fl/fxpT0t7+Z7gozSuhphamayoXUZdLzCt3GhzKs
         v4pwKtSy545WVQvpq/1qwlAXhtvMS0pq7z3nuiXrVdJCm6rh8Zp8dvQtpqyDVOOK2miO
         AAhA==
X-Gm-Message-State: AO0yUKXOBbsTzncbKWCu0Gl6KJO+HbRI+/EZfRWZWVyub0QwpCWnVYBn
	sdsPaCPCrM7U9OdCDbbuw5BTnVsdR4I=
X-Google-Smtp-Source: AK7set8YfZryoStKwsTnLr/Jqz/tscNfGMGO0qq8gsA3msGJEyUxebLDFD6eUTeWarMcvyHIEvjV0Q==
X-Received: by 2002:a17:906:2c18:b0:926:fce:c080 with SMTP id e24-20020a1709062c1800b009260fcec080mr4324307ejh.17.1678709762140;
        Mon, 13 Mar 2023 05:16:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id bn19-20020a170906c0d300b008e57b5e0ce9sm3372054ejb.108.2023.03.13.05.16.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 05:16:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/14] selftest: imagefeatures.py: respect IMAGE_LINK_NAME for debugfs and manifest as well
Date: Mon, 13 Mar 2023 13:15:41 +0100
Message-Id: <47de38963f1a5b4d03d3fd9afed7edc662ac85d9.1678709427.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678709427.git.Martin.Jansa@gmail.com>
References: <cover.1678709427.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 12:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178446

* these cases were correctly respecting IMAGE_LINK_NAME in most tests

* the only exception was relatively wide glob for manifest:
  "test-empty-image-*.manifest"
* and even wider glob for -dbg:
  "*-dbg.rootfs.tar.bz2"

* replace them with the exact filename we expect for given image

* be aware that gzip won't accept the symlink in IMAGE_LINK_NAME causing:
  2023-03-13 08:58:23,845 - oe-selftest - INFO -  ... FAIL
  2023-03-13 08:58:23,845 - oe-selftest - INFO - Traceback (most recent call last):
    File "/OE/build/poky/meta/lib/oeqa/selftest/cases/imagefeatures.py", line 124, in test_bmap
      self.assertTrue(runCmd('gzip -t %s' % gzip_path))
                      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/OE/build/poky/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
      raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
  AssertionError: Command 'gzip -t /OE/build/poky/build/build-st-2023-03-12-todo-patch2/imagefeatures.ImageFeatures.test_bmap/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.ext4.bmap.gz' returned non-zero exit status 1:
  gzip: skipping: /OE/build/poky/build/build-st-2023-03-12-todo-patch2/imagefeatures.ImageFeatures.test_bmap/build-st/tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.ext4.bmap.gz is a symbolic link

* and "*-dbg.rootfs.tar.bz2" doesn't work if IMAGE_NAME_SUFFIX
  is changed to anything else than ".rootfs" or moved into
  IMAGE_LINK_NAME (like I plan in future changes where this will
  need to be updated again).

  Luckily we can use the symlink which currently doesn't have
  IMAGE_NAME_SUFFIX nor the DATETIME, so we don't need to search
  for it with glob, e.g. currently:

  core-image-minimal-qemux86-64-dbg-20230313112546-dbg.rootfs.tar.bz2
  core-image-minimal-qemux86-64-dbg.tar.bz2 -> core-image-minimal-qemux86-64-dbg-20230313112546-dbg.rootfs.tar.bz2

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 82 +++++++++----------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index bdd4d3200e..3dc750594c 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -6,7 +6,7 @@
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator import OETestTag
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars, runqemu
 from oeqa.utils.sshcontrol import SSHControl
 import glob
 import os
@@ -102,12 +102,11 @@ class ImageFeatures(OESelftestTestCase):
         features = 'IMAGE_FSTYPES += " ext4 ext4.bmap ext4.bmap.gz"'
         self.write_config(features)
 
-        image_name = 'core-image-minimal'
-        bitbake(image_name)
+        image = 'core-image-minimal'
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
 
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
-        image_path = os.path.join(deploy_dir_image, "%s.ext4" % link_name)
+        image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.ext4" % bb_vars['IMAGE_LINK_NAME'])
         bmap_path = "%s.bmap" % image_path
         gzip_path = "%s.gz" % bmap_path
 
@@ -120,8 +119,8 @@ class ImageFeatures(OESelftestTestCase):
         image_stat = os.stat(image_path)
         self.assertGreater(image_stat.st_size, image_stat.st_blocks * 512)
 
-        # check if the resulting gzip is valid
-        self.assertTrue(runCmd('gzip -t %s' % gzip_path))
+        # check if the resulting gzip is valid, --force is needed in case gzip_path is a symlink
+        self.assertTrue(runCmd('gzip --test --force %s' % gzip_path))
 
     def test_hypervisor_fmts(self):
         """
@@ -139,14 +138,13 @@ class ImageFeatures(OESelftestTestCase):
             features += 'IMAGE_FSTYPES += "ext4.%s"\n' % itype
         self.write_config(features)
 
-        image_name = 'core-image-minimal'
-        bitbake(image_name)
+        image = 'core-image-minimal'
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
 
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
         for itype in img_types:
-            image_path = os.path.join(deploy_dir_image, "%s.ext4.%s" %
-                                      (link_name, itype))
+            image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.ext4.%s" %
+                                      (bb_vars['IMAGE_LINK_NAME'], itype))
 
             # check if result image file is in deploy directory
             self.assertTrue(os.path.exists(image_path))
@@ -177,13 +175,11 @@ class ImageFeatures(OESelftestTestCase):
         features = 'IMAGE_FSTYPES += "%s %s.sha256sum"' % (conv, conv)
         self.write_config(features)
 
-        image_name = 'core-image-minimal'
-        bitbake(image_name)
-
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
-        image_path = os.path.join(deploy_dir_image, "%s.%s" %
-                                  (link_name, conv))
+        image = 'core-image-minimal'
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
+        image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.%s" %
+                                  (bb_vars['IMAGE_LINK_NAME'], conv))
 
         # check if resulting image is in the deploy directory
         self.assertTrue(os.path.exists(image_path))
@@ -191,7 +187,7 @@ class ImageFeatures(OESelftestTestCase):
 
         # check if the resulting sha256sum agrees
         self.assertTrue(runCmd('cd %s;sha256sum -c %s.%s.sha256sum' %
-                               (deploy_dir_image, link_name, conv)))
+                               (bb_vars['DEPLOY_DIR_IMAGE'], bb_vars['IMAGE_LINK_NAME'], conv)))
 
     def test_image_fstypes(self):
         """
@@ -200,9 +196,9 @@ class ImageFeatures(OESelftestTestCase):
         Product:     oe-core
         Author:      Ed Bartosh <ed.bartosh@linux.intel.com>
         """
-        image_name = 'core-image-minimal'
+        image = 'core-image-minimal'
 
-        all_image_types = set(get_bb_var("IMAGE_TYPES", image_name).split())
+        all_image_types = set(get_bb_var("IMAGE_TYPES", image).split())
         skip_image_types = set(('container', 'elf', 'f2fs', 'multiubi', 'tar.zst', 'wic.zst', 'squashfs-lzo'))
         img_types = all_image_types - skip_image_types
 
@@ -214,12 +210,11 @@ UBINIZE_ARGS ?= "-m 2048 -p 128KiB -s 512"
 """ % ' '.join(img_types)
         self.write_config(config)
 
-        bitbake(image_name)
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
 
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
         for itype in img_types:
-            image_path = os.path.join(deploy_dir_image, "%s.%s" % (link_name, itype))
+            image_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.%s" % (bb_vars['IMAGE_LINK_NAME'], itype))
             # check if result image is in deploy directory
             self.assertTrue(os.path.exists(image_path),
                             "%s image %s doesn't exist" % (itype, image_path))
@@ -271,19 +266,20 @@ SKIP_RECIPE[busybox] = "Don't build this"
                      Yeoh Ee Peng <ee.peng.yeoh@intel.com>
         """
       
-        image_name = 'core-image-minimal'
+        image = 'core-image-minimal'
+        image_fstypes_debugfs = 'tar.bz2'
         features = 'IMAGE_GEN_DEBUGFS = "1"\n'
-        features += 'IMAGE_FSTYPES_DEBUGFS = "tar.bz2"\n'
+        features += 'IMAGE_FSTYPES_DEBUGFS = "%s"\n' % image_fstypes_debugfs
         self.write_config(features)
 
-        bitbake(image_name)
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        dbg_tar_file = os.path.join(deploy_dir_image, "*-dbg.rootfs.tar.bz2")
-        debug_files = glob.glob(dbg_tar_file)
-        self.assertNotEqual(len(debug_files), 0, 'debug filesystem not generated at %s' % dbg_tar_file)
-        result = runCmd('cd %s; tar xvf %s' % (deploy_dir_image, dbg_tar_file))
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
+
+        dbg_tar_file = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s-dbg.%s" % (bb_vars['IMAGE_LINK_NAME'], image_fstypes_debugfs))
+        self.assertTrue(os.path.exists(dbg_tar_file), 'debug filesystem not generated at %s' % dbg_tar_file)
+        result = runCmd('cd %s; tar xvf %s' % (bb_vars['DEPLOY_DIR_IMAGE'], dbg_tar_file))
         self.assertEqual(result.status, 0, msg='Failed to extract %s: %s' % (dbg_tar_file, result.output))
-        result = runCmd('find %s -name %s' % (deploy_dir_image, "udevadm"))
+        result = runCmd('find %s -name %s' % (bb_vars['DEPLOY_DIR_IMAGE'], "udevadm"))
         self.assertTrue("udevadm" in result.output, msg='Failed to find udevadm: %s' % result.output)
         dbg_symbols_targets = result.output.splitlines()
         self.assertTrue(dbg_symbols_targets, msg='Failed to split udevadm: %s' % dbg_symbols_targets)
@@ -293,11 +289,13 @@ SKIP_RECIPE[busybox] = "Don't build this"
 
     def test_empty_image(self):
         """Test creation of image with no packages"""
-        bitbake('test-empty-image')
-        res_dir = get_bb_var('DEPLOY_DIR_IMAGE')
-        images = os.path.join(res_dir, "test-empty-image-*.manifest")
-        result = glob.glob(images)
-        with open(result[1],"r") as f:
+        image = 'test-empty-image'
+        bitbake(image)
+        bb_vars = get_bb_vars(['DEPLOY_DIR_IMAGE', 'IMAGE_LINK_NAME'], image)
+        manifest = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "%s.manifest" % bb_vars['IMAGE_LINK_NAME'])
+        self.assertTrue(os.path.exists(manifest))
+
+        with open(manifest, "r") as f:
                 self.assertEqual(len(f.read().strip()),0)
 
     def test_mandb(self):
-- 
2.39.2


