Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37173CA6002
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 06:10:07 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9710.1791439797155008046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2026 23:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aohKPwcf;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a061a13884so22168015e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 23:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439795; x=1792044595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lHzf74VzW4UNJzDJcezB2eztP4Cx36s6onVelBTZecw=;
        b=aohKPwcfa82ZkYoRmRQ/kyq2h2N6rOou0kmMXZTEudlJiH/bwWftZKVDExgwHoMO0l
         kqJCr15/sp0UOqpQ46ll+CvRlBv6Td3VjeH5lvwC4KzP321H/cCFDt+mqQTi5rL2KvwN
         fd5jycryo0o9FmdlzAux6iDRVf2nh3iofRebnrXKiPfabjhFMiQni5+6HwGi3z2X9N66
         tqR0AwcQzAOB8SrFtynSMHb5iOUVkQ0SUQW0ebmRaoZzyoyEJzZ2CvEtqb0n3C8eov+y
         l+fzKJ2swaFjAggvVMeijeMdLEJAthV5k1CE20/FUFsKYn7gofxjICqCVdse2dQSF2B+
         Hw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439795; x=1792044595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lHzf74VzW4UNJzDJcezB2eztP4Cx36s6onVelBTZecw=;
        b=ABV3HWCqhOSYn6zNXp83t9E2jYaHTPGvQ3gP4nXxAxMVxD3fiPtYPOhZ7xgBooAkKz
         ECqTR63psLudxvUyoOFxfkQ0KU/ET9G6CRzWRwugfn58s1ZM+dQXB6LRWHFFlQIe6w08
         RkgdrcnrBSf/8ICAwMGizf8cVEBiL1hxsKbsvFiZcUnt1kQcQ0RgW6ESSTbUIokw333u
         3yFSrM4gZdg+WArDh/kPwYizGrpAI3JznsxqFkWRx2SElasKW0W/II0FdsgXz6LSAFDB
         wRPcej9BX0Vu+CoUWdB39+IxX1AeeMmwYZmOtdZWyOF8eZwneCOwjQ1MQfWdv39J64r+
         CgWA==
X-Gm-Message-State: AFuF++lcJHIr9e6Rayw+lBOEfq7oijkQKaKdxc1ch+3mJLzjV4S6tegY
	QWM1f9IQD5Lxg6EN/I85Jr0NsrLb0sfEk6KJjrN6orvUuxLoDeRZgOnBSfyjRbyX
X-Gm-Gg: AYBFou0hbz2MqnC4AtIVM6Pbc3RDgrgJnygx72FT6LZOcMitaIcTSUAARkfvJbYh4Bi
	fZbER70aqAR6f3ssb8DC4cJ3EGrs19YtD6HXdnea+RyQ74rMyFiLdQFRcXOrqtL91EWAjcQ4dRP
	khcr09WW2f5Vg56y3PBmEhTn2mD3w4yp0fmxD4zoooxlCtup0zO4y460Wgn7GIoINN4hnFCI2Ch
	7JI3NM36MJ77MnFZ4o10VxyjiiKPdFJzJ7joEsg7fNAEVF+07V7u5qQ2QQWXnQJQmPslBvKCD+O
	9LiaFvmgZ1m0rFDpPBCU/h5ndb7YUs4wOJZFTN6OqVAf4ZLa6O0z0qX4J0jdONYrmABF+yGF+At
	NGYJD2g72+wQhm8CUIkENJV9vm6XWnaJsEHwXHPAdRD8ZmmfxvtflRCRBWb6ue3NqMHGGDyh8mR
	zdIPpSzykVunCZLZlWcuVQxxUIMSR7rI2UgFgFg7XsmTHyxe5vPb42E3oE6yehnvRYv6Jk0KNX+
	CRVioU1Ew31O12DK2QNcR/T07w=
X-Received: by 2002:a05:600c:4708:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4a1800d5941mr77927805e9.1.1791439795225;
        Wed, 07 Oct 2026 23:09:55 -0700 (PDT)
Received: from penguin.lxd ([81.0.251.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3d3eesm10630219f8f.53.2026.10.07.23.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:09:53 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: a.fatoum@pengutronix.de,
	adrian.freihofer@siemens.com,
	Marta Rybczynska <rybczynska@gmail.com>
Subject: [PATCH v4 2/3] oe-selftest: fitimage: support new schema for uboot configuration signing
Date: Thu,  8 Oct 2026 08:09:34 +0200
Message-Id: <20261008060935.4225-2-rybczynska@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261008060935.4225-1-rybczynska@gmail.com>
References: <20261008060935.4225-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 06:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247414

Modify testcases after adding signing of a configuration of uboot instead
of various sections separately.

This change includes an additional parameter to _check_signing that allows
more flexible configuration and avoids assumptions on what section has,
and which section does not have a signature - now they are defined
in a data structure.

Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 53 +++++++++++++++---------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 5d77e6da09..b95e6c158c 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -614,7 +614,7 @@ class FitImageTestCase(OESelftestTestCase):
         self._is_req_dict_in_dict(sections, req_sections)
 
         # Call the signing related checks if the function is provided by a inherited class
-        self._check_signing(bb_vars, sections, num_signatures, uboot_tools_bindir, fitimage_path)
+        self._check_signing(bb_vars, sections, req_sections, num_signatures, uboot_tools_bindir, fitimage_path)
 
     def _get_req_its_paths(self, bb_vars):
         self.logger.error("This function needs to be implemented")
@@ -636,7 +636,7 @@ class FitImageTestCase(OESelftestTestCase):
         self.logger.error("This function needs to be implemented")
         return ({}, 0)
 
-    def _check_signing(self, bb_vars, sections, num_signatures, uboot_tools_bindir, fitimage_path):
+    def _check_signing(self, bb_vars, sections, req_sections, num_signatures, uboot_tools_bindir, fitimage_path):
         """Verify the signatures in the FIT image."""
         self.fail("Function needs to be implemented by inheriting classes")
 
@@ -1076,7 +1076,7 @@ class KernelFitImageBase(FitImageTestCase):
                     req_sections[section]['Hash algo'] = fit_hash_alg
         return (req_sections, num_signatures)
 
-    def _check_signing(self, bb_vars, sections, num_signatures, uboot_tools_bindir, fitimage_path):
+    def _check_signing(self, bb_vars, sections, req_sections, num_signatures, uboot_tools_bindir, fitimage_path):
         """Verify the signature nodes in the FIT image"""
         if bb_vars['UBOOT_SIGN_ENABLE'] == "1":
             self.logger.debug("Verifying signatures in the FIT image")
@@ -1105,6 +1105,8 @@ class KernelFitImageBase(FitImageTestCase):
         for section, values in sections.items():
             # Configuration nodes are always signed with UBOOT_SIGN_KEYNAME (if UBOOT_SIGN_ENABLE = "1")
             if section.startswith(bb_vars['FIT_CONF_PREFIX']):
+                if 'Sign algo' not in req_values[section]:
+                    continue
                 sign_algo = values.get('Sign algo', None)
                 req_sign_algo = "%s,%s:%s" % (fit_hash_alg, fit_sign_alg, uboot_sign_keyname)
                 self.assertEqual(sign_algo, req_sign_algo, 'Signature algorithm for %s not expected value' % section)
@@ -1688,6 +1690,8 @@ class UBootFitImageTests(FitImageTestCase):
             'SPL_MKIMAGE_SIGN_ARGS',
             'SPL_SIGN_ENABLE',
             'SPL_SIGN_KEYNAME',
+            'SPL_SIGN_INDIVIDUAL',
+            'SPL_SIGN_CONF',
             'TOPDIR',
             'UBOOT_ARCH',
             'UBOOT_DTB_BINARY',
@@ -1763,10 +1767,14 @@ class UBootFitImageTests(FitImageTestCase):
         req_its_paths = []
         for image in images:
             req_its_paths.append(['/', 'images', image])
-            if bb_vars['SPL_SIGN_ENABLE'] == "1":
+            if bb_vars['SPL_SIGN_ENABLE'] == "1" and bb_vars['SPL_SIGN_INDIVIDUAL'] == "1":
                 req_its_paths.append(['/', 'images', image, 'signature'])
+            elif bb_vars['SPL_SIGN_ENABLE'] == "1" and bb_vars['SPL_SIGN_CONF'] == "1":
+                req_its_paths.append(['/', 'images', image, 'hash-1'])
         for configuration in configurations:
             req_its_paths.append(['/', 'configurations', configuration])
+            if bb_vars['SPL_SIGN_ENABLE'] == "1" and bb_vars['SPL_SIGN_CONF'] == "1":
+                req_its_paths.append(['/', 'configurations', 'conf', 'signature'])
         return (req_its_paths, [])
 
     def _get_req_its_fields(self, bb_vars):
@@ -1874,16 +1882,26 @@ class UBootFitImageTests(FitImageTestCase):
         uboot_fit_sign_alg = bb_vars['UBOOT_FIT_SIGN_ALG']
         spl_sign_enable = bb_vars['SPL_SIGN_ENABLE']
         spl_sign_keyname = bb_vars['SPL_SIGN_KEYNAME']
+        spl_sign_conf = bb_vars['SPL_SIGN_CONF']
+        spl_sign_individual = bb_vars['SPL_SIGN_INDIVIDUAL']
         num_signatures = 0
         if spl_sign_enable == "1":
             for section in req_sections:
-                if not section.startswith('conf'):
-                    req_sections[section]['Sign algo'] = "%s,%s:%s" % \
-                        (uboot_fit_hash_alg, uboot_fit_sign_alg, spl_sign_keyname)
-                    num_signatures += 1
+                if section.startswith('conf'):
+                    if spl_sign_conf == "1":
+                        req_sections[section]['Sign algo'] = "%s,%s:%s" % \
+                            (uboot_fit_hash_alg, uboot_fit_sign_alg, spl_sign_keyname)
+                        num_signatures += 1
+                else:
+                    if spl_sign_conf == "1":
+                        req_sections[section]['Hash algo'] = uboot_fit_hash_alg
+                    elif spl_sign_individual == "1":
+                        req_sections[section]['Sign algo'] = "%s,%s:%s" % \
+                            (uboot_fit_hash_alg, uboot_fit_sign_alg, spl_sign_keyname)
+                        num_signatures += 1
         return (req_sections, num_signatures)
 
-    def  _check_signing(self, bb_vars, sections, num_signatures, uboot_tools_bindir, fitimage_path):
+    def  _check_signing(self, bb_vars, sections, req_sections, num_signatures, uboot_tools_bindir, fitimage_path):
         if bb_vars['UBOOT_FITIMAGE_ENABLE'] == '1' and bb_vars['SPL_SIGN_ENABLE'] == "1":
             self.logger.debug("Verifying signatures in the FIT image")
         else:
@@ -1896,16 +1914,13 @@ class UBootFitImageTests(FitImageTestCase):
         fit_sign_alg_len = FitImageTestCase.MKIMAGE_SIGNATURE_LENGTHS[uboot_fit_sign_alg]
         for section, values in sections.items():
             # Configuration nodes are always signed with UBOOT_SIGN_KEYNAME (if UBOOT_SIGN_ENABLE = "1")
-            if section.startswith("conf"):
-                # uboot-sign does not sign configuration nodes
-                pass
-            else:
-                # uboot-sign does not add hash nodes, only image signatures
-                sign_algo = values.get('Sign algo', None)
-                req_sign_algo = "%s,%s:%s" % (uboot_fit_hash_alg, uboot_fit_sign_alg, spl_sign_keyname)
-                self.assertEqual(sign_algo, req_sign_algo, 'Signature algorithm for %s not expected value' % section)
-                sign_value = values.get('Sign value', None)
-                self.assertEqual(len(sign_value), fit_sign_alg_len, 'Signature value for section %s not expected length' % section)
+            if 'Sign algo' not in req_sections[section]:
+               continue
+            sign_algo = values.get('Sign algo', None)
+            req_sign_algo = "%s,%s:%s" % (uboot_fit_hash_alg, uboot_fit_sign_alg, spl_sign_keyname)
+            self.assertEqual(sign_algo, req_sign_algo, 'Signature algorithm for %s not expected value' % section)
+            sign_value = values.get('Sign value', None)
+            self.assertEqual(len(sign_value), fit_sign_alg_len, 'Signature value for section %s not expected length' % section)
 
         # Search for the string passed to mkimage in each signed section of the FIT image.
         # Looks like mkimage supports to add a comment but does not support to read it back.
-- 
2.43.0


