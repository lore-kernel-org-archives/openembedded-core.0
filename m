Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DAAC2BA1B
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:37:06 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.33761.1741599424588086674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ja6MGedn;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3913cf69784so1794610f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 02:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741599423; x=1742204223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOaOaUweWnBG+7Umg8SVMHdJnNFr5xPtcL5KxPK3Gw8=;
        b=ja6MGednT642LGL7u9/A0cOOUFeUVZ10bAjTgqWlC632YnBTw11jzEebuM4kxU23PB
         3e8Ud1Cra2Vc02AjrSz9cmqNPuwVEi125urF3zkDAZLUP1KEN30VoD+pNWRqcXvP0RX3
         6DWgZMfHCiRBuv6B9Jh43y8UjUNtGcD0rg2d++tM4D3+mNZDkZ+T3CEO8IhEzb1+ZaYW
         mhUrZJ2xO8nCSEl0WV+quO+NZFepZaWU3X0NnxTvurfeCL2mIv5NuMpugBHAQ9a4mnHm
         /vajClajWuUeyg6RFlQ2xBWdtnF1WhaMyGe9UyNnAyU86/ZuD/2+AyaZ3MoeZl20O/bz
         MTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741599423; x=1742204223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOaOaUweWnBG+7Umg8SVMHdJnNFr5xPtcL5KxPK3Gw8=;
        b=lBsv8cvzCIh1QyGNyxICaDjIkqzzdbfC2WWJKN9GoszbWt1dxblPD9lrcJNMLFFC4c
         AgVioAFMF5ji8DCpFGyQvHa0z94AqIjlu+zyYTdqoD+vGWNlq9XJOOHSnkgwtcVvW0Fl
         eASObgn7eD29nRcAU1hjg2AX591wsqNzhIWEFRQRyK6wq2LF71+rXeQIkF0sVIZB9wbm
         JIl4iABuKf/bIDRwB/WO+kxCzJRww0I1LOjTQLNRAiO8u+miuPTspOUcxYHpYHqDeuan
         L0JWQjQfGKkj1J/wvVTzi50Yxy65yn0dx0kxDx6bb09BrcQwrB9mzdNd+7AzZYqzP8Jz
         D4+Q==
X-Gm-Message-State: AOJu0Yx2jFd6Vk2V+GK9JQca+Oqbyy3o1l8ZU3G5PaiG4ucRfox6/J/q
	Sz/2wHh4BNnhNeoVgEoYlgtXoJrEh6SaXAUT24hny9tN8VcRjg9gqtiWNw==
X-Gm-Gg: ASbGnctRR3yJXKqOQkgQeY4yvSpi4B0OHQMs4t1BfHVM3OXb6mld07iwkAP1hb4tuac
	jIL9u72Qs5lHmUzoROx0KLKkooboXjH+jtohC86P54tlow/HNBem4wLjBkDtx1ZWvNlqsjzT6qm
	bVZsbtBep+Pax4FtxBq+AqnAmT3sC9PNp7N5CoOiiRRYDubC0dfFpvJZvJbn7ZrXLrNEsfKrUPk
	yoeAG/gsJYICMif7yLnCAL1hEODtxjr7fXVjxwNeZTdZJOxlAbkRaAZ5QHZ2TLSZTusHpRq39OL
	sudrJkRVQGXtL+sjezoHk+HsyVAgDS8gedBiIim/vur9wr1mPME/JAiKjWq35TYhwXw=
X-Google-Smtp-Source: AGHT+IFf1XU369Sui6Q0CbJB6dU1SV21WOLHEfFQKdfuZghTB+9eJfxu5/Fobmq0tNwhyHUq0qxgmg==
X-Received: by 2002:a5d:47cc:0:b0:391:3124:f287 with SMTP id ffacd0b85a97d-39132d20b5emr11049488f8f.16.1741599422490;
        Mon, 10 Mar 2025 02:37:02 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79fbsm14554454f8f.13.2025.03.10.02.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:37:02 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 5/7] oe-selftest: fitimage sort tests
Date: Mon, 10 Mar 2025 10:35:47 +0100
Message-ID: <20250310093641.1983560-6-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
References: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212501

This is a trivial refactoring.
The goal is to have all tests for kernel-fitimage.bbclass and all tests
for uboot-sign.bbclass together. This refactoring greatly simplifies
the diff of the next commit.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 262 +++++++++++------------
 1 file changed, 129 insertions(+), 133 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index dd177e0b048..00769443e80 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -168,7 +168,6 @@ FIT_DESC = "A model description"
         dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
         self._verify_fitimage_uboot_env(dumpimage_result)
 
-
     def test_sign_fit_image(self):
         """
         Summary:     Check if FIT image and Image Tree Source (its) are created
@@ -314,6 +313,135 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c '%s'"
             self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path,
                                              os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], dtb), 'conf-' + dtb)
 
+    def test_initramfs_bundle(self):
+        """
+        Summary:     Verifies the content of the initramfs bundle node in the FIT Image Tree Source (its)
+                     The FIT settings are set by the test case.
+                     The machine used is beaglebone-yocto.
+        Expected:    1. The ITS is generated with initramfs bundle support
+                     2. All the fields in the kernel node are as expected (matching the
+                        conf settings)
+                     3. The kernel is included in all the available configurations and
+                        its hash is included in the configuration signature
+
+        Product:     oe-core
+        Author:      Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+        """
+
+        config = """
+DISTRO="poky"
+MACHINE = "beaglebone-yocto"
+INITRAMFS_IMAGE_BUNDLE = "1"
+INITRAMFS_IMAGE = "core-image-minimal-initramfs"
+INITRAMFS_SCRIPTS = ""
+UBOOT_MACHINE = "am335x_evm_defconfig"
+KERNEL_CLASSES = " kernel-fitimage "
+KERNEL_IMAGETYPES = "fitImage"
+UBOOT_SIGN_ENABLE = "1"
+UBOOT_SIGN_KEYNAME = "beaglebonekey"
+UBOOT_SIGN_KEYDIR ?= "${DEPLOY_DIR_IMAGE}"
+UBOOT_DTB_BINARY = "u-boot.dtb"
+UBOOT_ENTRYPOINT  = "0x80000000"
+UBOOT_LOADADDRESS = "0x80000000"
+UBOOT_DTB_LOADADDRESS = "0x82000000"
+UBOOT_ARCH = "arm"
+UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+UBOOT_MKIMAGE_KERNEL_TYPE = "kernel"
+UBOOT_EXTLINUX = "0"
+FIT_GENERATE_KEYS = "1"
+KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
+FIT_KERNEL_COMP_ALG = "none"
+FIT_HASH_ALG = "sha256"
+"""
+        config = self._config_add_uboot_env(config)
+        self.write_config(config)
+
+        # fitImage is created as part of linux recipe
+        bitbake("virtual/kernel")
+
+        bb_vars = get_bb_vars([
+            'DEPLOY_DIR_IMAGE',
+            'FIT_HASH_ALG',
+            'FIT_KERNEL_COMP_ALG',
+            'INITRAMFS_IMAGE',
+            'MACHINE',
+            'UBOOT_ARCH',
+            'UBOOT_ENTRYPOINT',
+            'UBOOT_LOADADDRESS',
+            'UBOOT_MKIMAGE_KERNEL_TYPE'
+            ],
+            'virtual/kernel')
+        fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
+                    "fitImage-its-%s-%s-%s" % (bb_vars['INITRAMFS_IMAGE'], bb_vars['MACHINE'], bb_vars['MACHINE']))
+        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],"fitImage")
+
+        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
+        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
+
+        its_file = open(fitimage_its_path)
+
+        its_lines = [line.strip() for line in its_file.readlines()]
+
+        exp_node_lines = [
+            'kernel-1 {',
+            'description = "Linux kernel";',
+            'data = /incbin/("linux.bin");',
+            'type = "' + str(bb_vars['UBOOT_MKIMAGE_KERNEL_TYPE']) + '";',
+            'arch = "' + str(bb_vars['UBOOT_ARCH']) + '";',
+            'os = "linux";',
+            'compression = "' + str(bb_vars['FIT_KERNEL_COMP_ALG']) + '";',
+            'load = <' + str(bb_vars['UBOOT_LOADADDRESS']) + '>;',
+            'entry = <' + str(bb_vars['UBOOT_ENTRYPOINT']) + '>;',
+            'hash-1 {',
+            'algo = "' + str(bb_vars['FIT_HASH_ALG']) +'";',
+            '};',
+            '};'
+        ]
+
+        node_str = exp_node_lines[0]
+
+        print ("checking kernel node\n")
+        self.assertIn(node_str, its_lines)
+
+        node_start_idx = its_lines.index(node_str)
+        node = its_lines[node_start_idx:(node_start_idx + len(exp_node_lines))]
+
+        # Remove the absolute path. This refers to WORKDIR which is not always predictable.
+        re_data = re.compile(r'^data = /incbin/\(.*/linux\.bin"\);$')
+        node = [re.sub(re_data, 'data = /incbin/("linux.bin");', cfg_str) for cfg_str in node]
+
+        self.assertEqual(node, exp_node_lines, "kernel node does not match expectation")
+
+        rx_configs = re.compile("^conf-.*")
+        its_configs = list(filter(rx_configs.match, its_lines))
+
+        for cfg_str in its_configs:
+            cfg_start_idx = its_lines.index(cfg_str)
+            line_idx = cfg_start_idx + 2
+            node_end = False
+            while node_end == False:
+                if its_lines[line_idx] == "};" and its_lines[line_idx-1] == "};" :
+                    node_end = True
+                line_idx = line_idx + 1
+
+            node = its_lines[cfg_start_idx:line_idx]
+            print("checking configuration " + cfg_str.rstrip(" {"))
+            rx_desc_line = re.compile(r'^description = ".*Linux kernel.*')
+            self.assertEqual(len(list(filter(rx_desc_line.match, node))), 1, "kernel keyword not found in the description line")
+
+            self.assertIn('kernel = "kernel-1";', node)
+
+            rx_sign_line = re.compile(r'^sign-images = .*kernel.*')
+            self.assertEqual(len(list(filter(rx_sign_line.match, node))), 1, "kernel hash not signed")
+
+        # Verify the signature
+        uboot_tools_bindir = self._setup_uboot_tools_native()
+        self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path, os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], 'am335x-bone.dtb'))
+
+        # Check if the u-boot boot.scr script is in the fitImage
+        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
+        self._verify_fitimage_uboot_env(dumpimage_result)
+
     def test_uboot_fit_image(self):
         """
         Summary:     Check if Uboot FIT image and Image Tree Source
@@ -522,7 +650,6 @@ UBOOT_FIT_HASH_ALG = "sha256"
         self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path,
                                          os.path.join(deploy_dir_image, 'u-boot-spl.dtb'))
 
-
     def test_sign_cascaded_uboot_fit_image(self):
         """
         Summary:     Check if U-Boot FIT image and Image Tree Source (its) are
@@ -667,137 +794,6 @@ FIT_SIGN_INDIVIDUAL = "1"
         self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path,
                                          os.path.join(deploy_dir_image, 'u-boot-spl.dtb'))
 
-
-    def test_initramfs_bundle(self):
-        """
-        Summary:     Verifies the content of the initramfs bundle node in the FIT Image Tree Source (its)
-                     The FIT settings are set by the test case.
-                     The machine used is beaglebone-yocto.
-        Expected:    1. The ITS is generated with initramfs bundle support
-                     2. All the fields in the kernel node are as expected (matching the
-                        conf settings)
-                     3. The kernel is included in all the available configurations and
-                        its hash is included in the configuration signature
-
-        Product:     oe-core
-        Author:      Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-        """
-
-        config = """
-DISTRO="poky"
-MACHINE = "beaglebone-yocto"
-INITRAMFS_IMAGE_BUNDLE = "1"
-INITRAMFS_IMAGE = "core-image-minimal-initramfs"
-INITRAMFS_SCRIPTS = ""
-UBOOT_MACHINE = "am335x_evm_defconfig"
-KERNEL_CLASSES = " kernel-fitimage "
-KERNEL_IMAGETYPES = "fitImage"
-UBOOT_SIGN_ENABLE = "1"
-UBOOT_SIGN_KEYNAME = "beaglebonekey"
-UBOOT_SIGN_KEYDIR ?= "${DEPLOY_DIR_IMAGE}"
-UBOOT_DTB_BINARY = "u-boot.dtb"
-UBOOT_ENTRYPOINT  = "0x80000000"
-UBOOT_LOADADDRESS = "0x80000000"
-UBOOT_DTB_LOADADDRESS = "0x82000000"
-UBOOT_ARCH = "arm"
-UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
-UBOOT_MKIMAGE_KERNEL_TYPE = "kernel"
-UBOOT_EXTLINUX = "0"
-FIT_GENERATE_KEYS = "1"
-KERNEL_IMAGETYPE_REPLACEMENT = "zImage"
-FIT_KERNEL_COMP_ALG = "none"
-FIT_HASH_ALG = "sha256"
-"""
-        config = self._config_add_uboot_env(config)
-        self.write_config(config)
-
-        # fitImage is created as part of linux recipe
-        bitbake("virtual/kernel")
-
-        bb_vars = get_bb_vars([
-            'DEPLOY_DIR_IMAGE',
-            'FIT_HASH_ALG',
-            'FIT_KERNEL_COMP_ALG',
-            'INITRAMFS_IMAGE',
-            'MACHINE',
-            'UBOOT_ARCH',
-            'UBOOT_ENTRYPOINT',
-            'UBOOT_LOADADDRESS',
-            'UBOOT_MKIMAGE_KERNEL_TYPE'
-            ],
-            'virtual/kernel')
-        fitimage_its_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],
-                    "fitImage-its-%s-%s-%s" % (bb_vars['INITRAMFS_IMAGE'], bb_vars['MACHINE'], bb_vars['MACHINE']))
-        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'],"fitImage")
-
-        self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
-        self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
-
-        its_file = open(fitimage_its_path)
-
-        its_lines = [line.strip() for line in its_file.readlines()]
-
-        exp_node_lines = [
-            'kernel-1 {',
-            'description = "Linux kernel";',
-            'data = /incbin/("linux.bin");',
-            'type = "' + str(bb_vars['UBOOT_MKIMAGE_KERNEL_TYPE']) + '";',
-            'arch = "' + str(bb_vars['UBOOT_ARCH']) + '";',
-            'os = "linux";',
-            'compression = "' + str(bb_vars['FIT_KERNEL_COMP_ALG']) + '";',
-            'load = <' + str(bb_vars['UBOOT_LOADADDRESS']) + '>;',
-            'entry = <' + str(bb_vars['UBOOT_ENTRYPOINT']) + '>;',
-            'hash-1 {',
-            'algo = "' + str(bb_vars['FIT_HASH_ALG']) +'";',
-            '};',
-            '};'
-        ]
-
-        node_str = exp_node_lines[0]
-
-        print ("checking kernel node\n")
-        self.assertIn(node_str, its_lines)
-
-        node_start_idx = its_lines.index(node_str)
-        node = its_lines[node_start_idx:(node_start_idx + len(exp_node_lines))]
-
-        # Remove the absolute path. This refers to WORKDIR which is not always predictable.
-        re_data = re.compile(r'^data = /incbin/\(.*/linux\.bin"\);$')
-        node = [re.sub(re_data, 'data = /incbin/("linux.bin");', cfg_str) for cfg_str in node]
-
-        self.assertEqual(node, exp_node_lines, "kernel node does not match expectation")
-
-        rx_configs = re.compile("^conf-.*")
-        its_configs = list(filter(rx_configs.match, its_lines))
-
-        for cfg_str in its_configs:
-            cfg_start_idx = its_lines.index(cfg_str)
-            line_idx = cfg_start_idx + 2
-            node_end = False
-            while node_end == False:
-                if its_lines[line_idx] == "};" and its_lines[line_idx-1] == "};" :
-                    node_end = True
-                line_idx = line_idx + 1
-
-            node = its_lines[cfg_start_idx:line_idx]
-            print("checking configuration " + cfg_str.rstrip(" {"))
-            rx_desc_line = re.compile(r'^description = ".*Linux kernel.*')
-            self.assertEqual(len(list(filter(rx_desc_line.match, node))), 1, "kernel keyword not found in the description line")
-
-            self.assertIn('kernel = "kernel-1";', node)
-
-            rx_sign_line = re.compile(r'^sign-images = .*kernel.*')
-            self.assertEqual(len(list(filter(rx_sign_line.match, node))), 1, "kernel hash not signed")
-
-        # Verify the signature
-        uboot_tools_bindir = self._setup_uboot_tools_native()
-        self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path, os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], 'am335x-bone.dtb'))
-
-        # Check if the u-boot boot.scr script is in the fitImage
-        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
-        self._verify_fitimage_uboot_env(dumpimage_result)
-
-
     def test_uboot_atf_tee_fit_image(self):
         """
         Summary:     Check if U-boot FIT image and Image Tree Source
-- 
2.47.1


