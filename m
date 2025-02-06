Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC6FC0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 22:57:28 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.56266.1738882642478513465
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 14:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HTqjB4B+;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso15738995e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738882640; x=1739487440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Es0zDfGRnvLnPMFjEgMuaNjRfqo97h19Wm6c1IVZ268=;
        b=HTqjB4B+g9cZDeKYPn3wC90DNpKd9eRXhLudmnjc94Ac3ptZwrrnSco31nosYgsweO
         gBjkMY/F9hmcNU0A3Nyici61d2xZO5mqHU3nqT2+gL9zJbQICMba5xuZa2/2rMJCflAC
         xlG7d8bEGG45LVZ489DU1wdvezIj8KmJP8V0R2U/qj3y5eFCvsyPg2/OHabzFnGJbicl
         EZOd8CRvzlwUPXU/e4xZ6a+W9XgDF5hOD7zlttJFSe8fdYAvO90ic2KQeNd+n5K6MbV6
         cVpuUweUag/z4Nbq3Ir2NBPXs8Hqpmo9n6GWSmQRdV6/o0l6PKQKFEpZmG8KSn9ppH/Z
         roEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882640; x=1739487440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Es0zDfGRnvLnPMFjEgMuaNjRfqo97h19Wm6c1IVZ268=;
        b=oH2KeCS4ENwcKmdUfc8Q4dOjg+MI4/6tYUbPyVkdX/jahxBhzzJbEGWrw+qLGIr3Rq
         iPhMPE9Chc8MaYDkObWi8OdpQBoMLLVAHMOmcsZvHWDnlRVbwkHT9S4jJnt8XtOQJKa/
         P2Ckd1cC34olqGxJNbTUk59YTCmYQYDWCJyAsQC3Vj17XIrtYGOnB/R8r66KXmeFE2UI
         ffDiJZIhSpwhDSbdCpgFzRX4MiqsDS2XFIDmvh3QC/Ua4H2pR99qNAOIIP7boNB/vbJ3
         Ov0pPOlSeaLyiHPhMT/9HEJVT/XKvBpVKvPFcFXahPyHpcpI6Ml+Xq++m0dZGhW/6bCq
         lvAQ==
X-Gm-Message-State: AOJu0YzeyHxkuT8sq7jvRnpUeHcyOIzmLBkwgFrcjFMf57WJ4OPtS2gB
	OtzvomA4aDlWRDXpqZSJdtnLCCsg9vg+0jpX3p444I3uZMEKOMCAJnPeRQ==
X-Gm-Gg: ASbGnct0wXcboNvxQtsDgJIfGlYH+P4V/kjpKaa/NOhe/R5C6V97MsVuXWrVyM0F6uN
	pva7rDc1UE6WYSR9FjksTy9dkqKMLjcxZ2vkE0wnMGofdyTslbKibiINGZiKdSojG9MDhHqPavr
	k4PrIlorBiP1k2kXbxhyH8J76tiGPULOwDh4/YST1R87Mz9QkhYcY0Xxee6ZxBcs1XZklwytw3/
	S6LY5iVWdwbf0uWcjWq/SV1PCAU+y8CuBozvK9UuJeiDkQ4Q5V531HtQwAM+rYIzFBldG2qDEii
	t5lDt+rylUDmvRtrWgLEB4T1v+xmO2a0k8tlIg==
X-Google-Smtp-Source: AGHT+IH9kDBg8OE07HjjwVSzNXzovW4173PqpJvXyJ/oZHLrxPtcWabi+I059DNEDE0T75eRTYWSfg==
X-Received: by 2002:a7b:c049:0:b0:434:ea1a:e30c with SMTP id 5b1f17b1804b1-43912d49923mr39801275e9.13.1738882640055;
        Thu, 06 Feb 2025 14:57:20 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d896d70sm68737535e9.0.2025.02.06.14.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 14:57:18 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/4] oe-selftest: fitimage split run_dumpimage function
Date: Thu,  6 Feb 2025 23:56:06 +0100
Message-ID: <20250206225654.1660760-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206225654.1660760-1-adrian.freihofer@siemens.com>
References: <20250206225654.1660760-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 22:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210965

Provide a re-usable function which calls the dumpimage utiliy.
This is a refactoring.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 44 +++++++++++++-----------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 0b5f4602fbc..a0ec406a0eb 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -12,17 +12,22 @@ import re
 class FitImageTests(OESelftestTestCase):
 
     def _setup_uboot_tools_native(self):
-        """build u-boot-tools-native and return RECIPE_SYSROOT_NATIVE"""
+        """build u-boot-tools-native and return ${RECIPE_SYSROOT_NATIVE}/${bindir}"""
         bitbake("u-boot-tools-native -c addto_recipe_sysroot")
-        return get_bb_var('RECIPE_SYSROOT_NATIVE', 'u-boot-tools-native')
+        vars = get_bb_vars(['RECIPE_SYSROOT_NATIVE', 'bindir'], 'u-boot-tools-native')
+        return os.path.join(vars['RECIPE_SYSROOT_NATIVE'], vars['bindir'])
 
-    def _verify_fit_image_signature(self, uboot_tools_sysroot_native, fitimage_path, dtb_path, conf_name=None):
+    def _run_dumpimage(self, fitimage_path, uboot_tools_bindir):
+        dumpimage_path = os.path.join(uboot_tools_bindir, 'dumpimage')
+        return runCmd('%s -l %s' % (dumpimage_path, fitimage_path))
+
+    def _verify_fit_image_signature(self, uboot_tools_bindir, fitimage_path, dtb_path, conf_name=None):
         """Verify the signature of a fit contfiguration
 
         The fit_check_sign utility from u-boot-tools-native is called.
         uboot-fit_check_sign -f fitImage -k $dtb_name -c conf-$dtb_name
         """
-        fit_check_sign_path = os.path.join(uboot_tools_sysroot_native, 'usr', 'bin', 'uboot-fit_check_sign')
+        fit_check_sign_path = os.path.join(uboot_tools_bindir, 'uboot-fit_check_sign')
         cmd = '%s -f %s -k %s' % (fit_check_sign_path, fitimage_path, dtb_path)
         if conf_name:
             cmd += ' -c %s' % conf_name
@@ -238,12 +243,11 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c '%s'"
                 self.assertEqual(value, reqvalue)
 
         # Dump the image to see if it really got signed
-        uboot_tools_sysroot_native = self._setup_uboot_tools_native()
-        dumpimage_path = os.path.join(uboot_tools_sysroot_native, 'usr', 'bin', 'dumpimage')
-        result = runCmd('%s -l %s' % (dumpimage_path, fitimage_path))
+        uboot_tools_bindir = self._setup_uboot_tools_native()
+        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
         in_signed = None
         signed_sections = {}
-        for line in result.output.splitlines():
+        for line in dumpimage_result.output.splitlines():
             if line.startswith((' Configuration', ' Image')):
                 in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match('^ *', line) in (' ', ''):
@@ -272,7 +276,7 @@ UBOOT_MKIMAGE_SIGN_ARGS = "-c '%s'"
 
         # Verify the signature for all configurations = DTBs
         for dtb in ['am335x-bone.dtb', 'am335x-boneblack.dtb', 'am335x-bonegreen.dtb']:
-            self._verify_fit_image_signature(uboot_tools_sysroot_native, fitimage_path,
+            self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path,
                                              os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], dtb), 'conf-' + dtb)
 
     def test_uboot_fit_image(self):
@@ -548,12 +552,11 @@ UBOOT_FIT_HASH_ALG = "sha256"
                 self.assertEqual(value, reqvalue)
 
         # Dump the image to see if it really got signed
-        uboot_tools_sysroot_native = self._setup_uboot_tools_native()
-        dumpimage_path = os.path.join(uboot_tools_sysroot_native, 'usr', 'bin', 'dumpimage')
-        result = runCmd('%s -l %s' % (dumpimage_path, fitimage_path))
+        uboot_tools_bindir = self._setup_uboot_tools_native()
+        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
         in_signed = None
         signed_sections = {}
-        for line in result.output.splitlines():
+        for line in dumpimage_result.output.splitlines():
             if line.startswith((' Image')):
                 in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match(' \w', line):
@@ -577,7 +580,7 @@ UBOOT_FIT_HASH_ALG = "sha256"
         self.assertEqual(found_comments, 2, "Expected 2 signed and commented section in the fitImage.")
 
         # Verify the signature
-        self._verify_fit_image_signature(uboot_tools_sysroot_native, fitimage_path,
+        self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path,
                                          os.path.join(deploy_dir_image, 'u-boot-spl.dtb'))
 
 
@@ -696,12 +699,11 @@ FIT_SIGN_INDIVIDUAL = "1"
                 self.assertEqual(value, reqvalue)
 
         # Dump the image to see if it really got signed
-        uboot_tools_sysroot_native = self._setup_uboot_tools_native()
-        dumpimage_path = os.path.join(uboot_tools_sysroot_native, 'usr', 'bin', 'dumpimage')
-        result = runCmd('%s -l %s' % (dumpimage_path, fitimage_path))
+        uboot_tools_bindir = self._setup_uboot_tools_native()
+        dumpimage_result = self._run_dumpimage(fitimage_path, uboot_tools_bindir)
         in_signed = None
         signed_sections = {}
-        for line in result.output.splitlines():
+        for line in dumpimage_result.output.splitlines():
             if line.startswith((' Image')):
                 in_signed = re.search(r'\((.*)\)', line).groups()[0]
             elif re.match(' \w', line):
@@ -725,7 +727,7 @@ FIT_SIGN_INDIVIDUAL = "1"
         self.assertEqual(found_comments, 2, "Expected 2 signed and commented section in the fitImage.")
 
         # Verify the signature
-        self._verify_fit_image_signature(uboot_tools_sysroot_native, fitimage_path,
+        self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path,
                                          os.path.join(deploy_dir_image, 'u-boot-spl.dtb'))
 
 
@@ -850,5 +852,5 @@ FIT_HASH_ALG = "sha256"
             self.assertEqual(len(list(filter(rx_sign_line.match, node))), 1, "kernel hash not signed")
 
         # Verify the signature
-        uboot_tools_sysroot_native = self._setup_uboot_tools_native()
-        self._verify_fit_image_signature(uboot_tools_sysroot_native, fitimage_path, os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], 'am335x-bone.dtb'))
+        uboot_tools_bindir = self._setup_uboot_tools_native()
+        self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path, os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], 'am335x-bone.dtb'))
-- 
2.47.1


