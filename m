Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5969C3DA45
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:33 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.5044.1720077024292021717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nnvpKQw0;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4257a390a4eso1936255e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077022; x=1720681822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzq3d6kETZy30b4iI2tfq3hMg9IUQRnT5d1OuvD11hw=;
        b=nnvpKQw024Vx8k5JnWJjb48iut3F7ezgdZrpQSdnk9hHDPJiCLtXN3N7ZzFkf10P9s
         7g9xbjKO4v3fGjdcdfDZVGdCLq2bScr/sGFHDOOGP/PDswAH1+1ZIeECR6w/M6jZFIt+
         RFNOMM4woIXq/cRFjGEHkOa8jJzLV42HKgPZEkvCJPeUtN/kgLCyzowK6HYCmxN4Hj0t
         FJX7lGZ0uMh8wzBx3hlvcpsDSQcTDwLS5tG02lkBkiJodr/INarUOk6vv3QQqR7Z3cm/
         fEl6UVMa54zEQk7WG0QaWrlKv+1+Q/d3xhDt8DKh/5SFXdvYrqVRUB+C6tYq1uunoDM5
         bj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077022; x=1720681822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzq3d6kETZy30b4iI2tfq3hMg9IUQRnT5d1OuvD11hw=;
        b=oiD/yZYiilGVoG3uVSnMFwVOd/p/iXE2t90wJyluguSeLwLi1YCSbQ1SuUHZ1E1/hv
         i7P6Mc2crpzxidFvOMFXKwlNIQePiuQ2WCnNebQlzYnPQz6H8aS/RaJRWk9tb0mdjLNP
         Grf/66YLEvFkmAOHCknPk6eJeVDN0e7lv/bYZaI5Pqbc59R94FTg5gm3XWDv8SX5MCJ/
         qE4Sz+waFb/F6mpy4mPoaOWUv6bmE9bFcgKIHNWlr10pxiA19/a/iid9h4iPIRKzphF7
         aXXda72mIPi4vLK/lcNX9DMITI3rhwS8pPM7qlCJzkChY3aVIvwzly2PVo5zQWrnh0xg
         MfXw==
X-Gm-Message-State: AOJu0Yxgm7Kfj63JnTRGQXIVfJzI1V3PJ0KzWGTAYzoVQGhVxqUofjbH
	VF9jspFRO4/Xgz9C8eeAcZHYHv3PyjAGagPXpG3CxSmRJo736bS5tBvQ/Q==
X-Google-Smtp-Source: AGHT+IHUw0RAyqG5OW+P2hJ+xTGdPs7eU0OuIvJsDQsknWIqPWwXpJ03K04xO/VyPd4Z9+QmR2lKYw==
X-Received: by 2002:a05:600c:887:b0:425:7784:56e8 with SMTP id 5b1f17b1804b1-4264a4319f9mr4753305e9.28.1720077022292;
        Thu, 04 Jul 2024 00:10:22 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:21 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 04/14] oe-selftest: fitimage cleanup asserts
Date: Thu,  4 Jul 2024 09:09:40 +0200
Message-ID: <20240704071013.2982700-5-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201509

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Use more specific assert statements to make the code more readable and
the error messages more verbose.

Cleanup the asserts of the test case test_initramfs_bundle.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 76 +++++++-----------------
 1 file changed, 21 insertions(+), 55 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 4891ac8010b..ee688c79099 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -98,10 +98,8 @@ FIT_DESC = "A model description"
         fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
             "fitImage-%s-%s" % (bb_vars['INITRAMFS_IMAGE_NAME'], bb_vars['KERNEL_FIT_LINK_NAME']))
 
-        self.assertTrue(os.path.exists(fitimage_its_path),
-            "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertTrue(os.path.exists(fitimage_path),
-            "%s FIT image doesn't exist" % (fitimage_path))
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
 
         # Check that the type, load address, entrypoint address and default
         # values for kernel and ramdisk in Image Tree Source are as expected.
@@ -180,10 +178,8 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c '%s'"
         fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
             "fitImage-%s.bin" % (bb_vars['KERNEL_FIT_LINK_NAME']))
 
-        self.assertTrue(os.path.exists(fitimage_its_path),
-            "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertTrue(os.path.exists(fitimage_path),
-            "%s FIT image doesn't exist" % (fitimage_path))
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
 
         req_itspaths = [
             ['/', 'images', 'kernel-1'],
@@ -330,10 +326,8 @@ FIT_SIGN_INDIVIDUAL = "1"
         fitimage_path = os.path.join(deploy_dir_image,
             "u-boot-fitImage-%s" % (machine,))
 
-        self.assertTrue(os.path.exists(fitimage_its_path),
-            "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertTrue(os.path.exists(fitimage_path),
-            "%s FIT image doesn't exist" % (fitimage_path))
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
 
         # Check that the type, load address, entrypoint address and default
         # values for kernel and ramdisk in Image Tree Source are as expected.
@@ -414,10 +408,8 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot comment'"
         fitimage_path = os.path.join(deploy_dir_image,
             "u-boot-fitImage-%s" % (machine,))
 
-        self.assertTrue(os.path.exists(fitimage_its_path),
-            "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertTrue(os.path.exists(fitimage_path),
-            "%s FIT image doesn't exist" % (fitimage_path))
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
 
         # Check that the type, load address, entrypoint address and default
         # values for kernel and ramdisk in Image Tree Source are as expected.
@@ -506,10 +498,8 @@ UBOOT_FIT_HASH_ALG = "sha256"
         fitimage_path = os.path.join(deploy_dir_image,
             "u-boot-fitImage-%s" % (machine,))
 
-        self.assertTrue(os.path.exists(fitimage_its_path),
-            "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertTrue(os.path.exists(fitimage_path),
-            "%s FIT image doesn't exist" % (fitimage_path))
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
 
         req_itspaths = [
             ['/', 'images', 'uboot'],
@@ -656,10 +646,8 @@ FIT_SIGN_INDIVIDUAL = "1"
         fitimage_path = os.path.join(deploy_dir_image,
             "u-boot-fitImage-%s" % (machine,))
 
-        self.assertTrue(os.path.exists(fitimage_its_path),
-            "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertTrue(os.path.exists(fitimage_path),
-            "%s FIT image doesn't exist" % (fitimage_path))
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
 
         req_itspaths = [
             ['/', 'images', 'uboot'],
@@ -793,10 +781,8 @@ FIT_HASH_ALG = "sha256"
                     "fitImage-its-%s-%s-%s" % (image_type, machine, machine))
         fitimage_path = os.path.join(deploy_dir_image,"fitImage")
 
-        self.assertTrue(os.path.exists(fitimage_its_path),
-            "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertTrue(os.path.exists(fitimage_path),
-            "%s FIT image doesn't exist" % (fitimage_path))
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
 
         kernel_load = str(get_bb_var('UBOOT_LOADADDRESS'))
         kernel_entry = str(get_bb_var('UBOOT_ENTRYPOINT'))
@@ -827,17 +813,12 @@ FIT_HASH_ALG = "sha256"
 
         node_str = exp_node_lines[0]
 
-        test_passed = False
-
         print ("checking kernel node\n")
+        self.assertIn(node_str, its_lines)
 
-        if node_str in its_lines:
-            node_start_idx = its_lines.index(node_str)
-            node = its_lines[node_start_idx:(node_start_idx + len(exp_node_lines))]
-            if node == exp_node_lines:
-                print("kernel node verified")
-            else:
-                self.assertTrue(test_passed == True,"kernel node does not match expectation")
+        node_start_idx = its_lines.index(node_str)
+        node = its_lines[node_start_idx:(node_start_idx + len(exp_node_lines))]
+        self.assertEqual(node, exp_node_lines, "kernel node does not match expectation")
 
         rx_configs = re.compile("^conf-.*")
         its_configs = list(filter(rx_configs.match, its_lines))
@@ -854,27 +835,12 @@ FIT_HASH_ALG = "sha256"
             node = its_lines[cfg_start_idx:line_idx]
             print("checking configuration " + cfg_str.rstrip(" {"))
             rx_desc_line = re.compile("^description.*1 Linux kernel.*")
-            if len(list(filter(rx_desc_line.match, node))) != 1:
-                self.assertTrue(test_passed == True,"kernel keyword not found in the description line")
-                break
-            else:
-                print("kernel keyword found in the description line")
+            self.assertNotEqual(len(list(filter(rx_desc_line.match, node))), 1, "kernel keyword not found in the description line")
 
-            if 'kernel = "kernel-1";' not in node:
-                self.assertTrue(test_passed == True,"kernel line not found")
-                break
-            else:
-                print("kernel line found")
+            self.assertNotIn('kernel = "kernel-1";', node)
 
             rx_sign_line = re.compile("^sign-images.*kernel.*")
-            if len(list(filter(rx_sign_line.match, node))) != 1:
-                self.assertTrue(test_passed == True,"kernel hash not signed")
-                break
-            else:
-                print("kernel hash signed")
-
-            test_passed = True
-            self.assertTrue(test_passed == True,"Initramfs bundle test success")
+            self.assertNotEqual(len(list(filter(rx_sign_line.match, node))), 1, "kernel hash not signed")
 
         # Verify the signature
         uboot_tools_sysroot_native = self._setup_uboot_tools_native()
-- 
2.45.2


