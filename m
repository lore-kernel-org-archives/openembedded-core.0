Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036CBC3DA44
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:34 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.4918.1720077025445406406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YS75Q1Hk;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52e743307a2so273532e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077023; x=1720681823; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+tdgO0iRy9+73cRvwyNQZU1tmbv+wtij6PZ2MsoZvc=;
        b=YS75Q1HkGitKcbVXEenfBUVqQAxYsuVh4ixskeT2vKd0UQvT/gievulwpSo4JKxTY8
         K8ZtW3y7a98ivmvu4wN8Ep/2/02oOold3VcU2tCXfXQWyMEA0Rch3GeAhzlso5vd13mK
         HWHEu8gSKKNTkV3WjvAOTU4n5k1WT/SQHEpJ+xif/Jtp4hsQcinGfevmnHNY16Q0LSMw
         LfGWrTyJN6WcixyvZ47GXzhJlwimnjikU+xZovlZ28Avja87qXG9gpdLS9aDp11mbZ0m
         D2YWc2Vq6lkdRNqamYn1gH9Xqm/yBl4hZ29DzcJi3HdV2cnkVPQhurxqXA5nZMBfm3Ai
         vrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077023; x=1720681823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+tdgO0iRy9+73cRvwyNQZU1tmbv+wtij6PZ2MsoZvc=;
        b=OvJ+VXqFsWu42m6YxRufVUhDW5IRa0xsNNXcqtptOrErQjYLn0vek+8llXtakeEQtN
         oIK/cgh1QnU+PRoC3RiOnuncM6tqXh3Co6FUTicQZ4CpmaLgU6fVfSEFUPDDXuDh0zQE
         YYrk0cvh7OTLDdeBy7/Yqj4QXc+Zu5mFni1UMbYHf4ICJJitpUGKWmK+rmlQYyxTjHSx
         /GheYguCP7RDmf7C92SzI3rNXT+uGgYAvqcEW5kr1it0cIfc51V8R1ljIT3MKFwnlwDK
         vHG7p0/VD5MEeU43oMILfIeU+TFHDLitVGS48C6RjHli0HL6W1znRN46Wa3/zpoXd5d0
         fXBw==
X-Gm-Message-State: AOJu0Yy+iR6FFRp5CuL1Fmz5OwjwnsoXfREu8+btwLUNRk1zxj3Jz4uE
	RJHyWqN3pH7Zutuxy0uevo1T8Y2Iz2erX+DFL9G4WovKPR57sKCRha8Tyw==
X-Google-Smtp-Source: AGHT+IFPWtonO5YZibL9zfggYfnPBJqhFixqeXMbUeGpW4JUWsRilj0qIPscxomP3FO0C20ALUVekw==
X-Received: by 2002:a19:7702:0:b0:52c:dba6:b4c8 with SMTP id 2adb3069b0e04-52ea0619e3cmr536867e87.13.1720077022965;
        Thu, 04 Jul 2024 00:10:22 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:22 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 05/14] oe-selftest: fitimage fix test_initramfs_bundle
Date: Thu,  4 Jul 2024 09:09:41 +0200
Message-ID: <20240704071013.2982700-6-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201510

From: Adrian Freihofer <adrian.freihofer@siemens.com>

It looks like most of the assertions of this tests were by-passed
because of combinations of invalid regexes and inverted assert
statement. Try to fix.

Use the variables from the kernel recipe instead of potentially invalid
values from get_bb_vars with undefined recipe. Use one get_bb_vars
statement instead of many seaparate calls mainly to improve the duration
of this test case.

Make the test working for an its file with an absolute path to the
kernel binary. This will be needed with one of the following commits and
does not harm in general.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 57 +++++++++++++-----------
 1 file changed, 32 insertions(+), 25 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index ee688c79099..0b5f4602fbc 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -774,23 +774,25 @@ FIT_HASH_ALG = "sha256"
         # fitImage is created as part of linux recipe
         bitbake("virtual/kernel")
 
-        image_type = get_bb_var('INITRAMFS_IMAGE')
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        machine = get_bb_var('MACHINE')
-        fitimage_its_path = os.path.join(deploy_dir_image,
-                    "fitImage-its-%s-%s-%s" % (image_type, machine, machine))
-        fitimage_path = os.path.join(deploy_dir_image,"fitImage")
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
 
         self.assertExists(fitimage_its_path, "%s image tree source doesn't exist" % (fitimage_its_path))
         self.assertExists(fitimage_path, "%s FIT image doesn't exist" % (fitimage_path))
 
-        kernel_load = str(get_bb_var('UBOOT_LOADADDRESS'))
-        kernel_entry = str(get_bb_var('UBOOT_ENTRYPOINT'))
-        kernel_type = str(get_bb_var('UBOOT_MKIMAGE_KERNEL_TYPE'))
-        kernel_compression = str(get_bb_var('FIT_KERNEL_COMP_ALG'))
-        uboot_arch = str(get_bb_var('UBOOT_ARCH'))
-        fit_hash_alg = str(get_bb_var('FIT_HASH_ALG'))
-
         its_file = open(fitimage_its_path)
 
         its_lines = [line.strip() for line in its_file.readlines()]
@@ -799,14 +801,14 @@ FIT_HASH_ALG = "sha256"
             'kernel-1 {',
             'description = "Linux kernel";',
             'data = /incbin/("linux.bin");',
-            'type = "' + kernel_type + '";',
-            'arch = "' + uboot_arch + '";',
+            'type = "' + str(bb_vars['UBOOT_MKIMAGE_KERNEL_TYPE']) + '";',
+            'arch = "' + str(bb_vars['UBOOT_ARCH']) + '";',
             'os = "linux";',
-            'compression = "' + kernel_compression + '";',
-            'load = <' + kernel_load + '>;',
-            'entry = <' + kernel_entry + '>;',
+            'compression = "' + str(bb_vars['FIT_KERNEL_COMP_ALG']) + '";',
+            'load = <' + str(bb_vars['UBOOT_LOADADDRESS']) + '>;',
+            'entry = <' + str(bb_vars['UBOOT_ENTRYPOINT']) + '>;',
             'hash-1 {',
-            'algo = "' + fit_hash_alg +'";',
+            'algo = "' + str(bb_vars['FIT_HASH_ALG']) +'";',
             '};',
             '};'
         ]
@@ -818,6 +820,11 @@ FIT_HASH_ALG = "sha256"
 
         node_start_idx = its_lines.index(node_str)
         node = its_lines[node_start_idx:(node_start_idx + len(exp_node_lines))]
+
+        # Remove the absolute path. This refers to WORKDIR which is not always predictable.
+        re_data = re.compile(r'^data = /incbin/\(.*/linux\.bin"\);$')
+        node = [re.sub(re_data, 'data = /incbin/("linux.bin");', cfg_str) for cfg_str in node]
+
         self.assertEqual(node, exp_node_lines, "kernel node does not match expectation")
 
         rx_configs = re.compile("^conf-.*")
@@ -834,14 +841,14 @@ FIT_HASH_ALG = "sha256"
 
             node = its_lines[cfg_start_idx:line_idx]
             print("checking configuration " + cfg_str.rstrip(" {"))
-            rx_desc_line = re.compile("^description.*1 Linux kernel.*")
-            self.assertNotEqual(len(list(filter(rx_desc_line.match, node))), 1, "kernel keyword not found in the description line")
+            rx_desc_line = re.compile(r'^description = ".*Linux kernel.*')
+            self.assertEqual(len(list(filter(rx_desc_line.match, node))), 1, "kernel keyword not found in the description line")
 
-            self.assertNotIn('kernel = "kernel-1";', node)
+            self.assertIn('kernel = "kernel-1";', node)
 
-            rx_sign_line = re.compile("^sign-images.*kernel.*")
-            self.assertNotEqual(len(list(filter(rx_sign_line.match, node))), 1, "kernel hash not signed")
+            rx_sign_line = re.compile(r'^sign-images = .*kernel.*')
+            self.assertEqual(len(list(filter(rx_sign_line.match, node))), 1, "kernel hash not signed")
 
         # Verify the signature
         uboot_tools_sysroot_native = self._setup_uboot_tools_native()
-        self._verify_fit_image_signature(uboot_tools_sysroot_native, fitimage_path, os.path.join(deploy_dir_image, 'am335x-bone.dtb'))
+        self._verify_fit_image_signature(uboot_tools_sysroot_native, fitimage_path, os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], 'am335x-bone.dtb'))
-- 
2.45.2


