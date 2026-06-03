Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB4ECD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 10:55:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17421.1780484106485148281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 03:55:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gzbv2/Tf;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b7866869so6570925e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 03:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780484105; x=1781088905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjmGdJa6R3LGbOpi53zcaiqrqu6M3ZT06NIoC/HjPRA=;
        b=gzbv2/TfV2j7ZdCcRizMn1noVl2JswoPsr8pZS0kPUgqbydVVtQK/iHLcqhkJjVNfc
         cykh9B06ab98AAA9KgrdPEOtEaOOLrn+jhkHYZLMIXDqxU8vwmuv5m2ag8GH8duPK7hV
         ABuQLOvf8eY+aBMpRhlXyks0WQFLFSgxN5PyHTif7MXcEORCyjNUaLLFxQXSVmtReQZS
         V0wkPMb6ffvdZYu6N8PODo3nEusZCu6gxq7+6nUxLmV0V60DnEzKTQRvbwDyndaJui88
         JBtWoD0vb87tjtNC6UNlFSMw5sYHSVi6QOCrGAzuOEkn076E4NYVvQqA7PZcbqvYDgH/
         I5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780484105; x=1781088905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RjmGdJa6R3LGbOpi53zcaiqrqu6M3ZT06NIoC/HjPRA=;
        b=IO/sa+qZZPPOxnKy3gj99tK378qO5Iv3B22y6Ca7SsRsLUo8NNPY3rAsOImzfVbArT
         lD3LEgGukaoF3O3sdEUoENeYv6Oe7Xf615yekSsILU1n6Dz7+Jo5fIlAl2jn35+eZ0yE
         ewqNY8Tded3ICWzPoBFcOApkOjAYnUZC82mYIEJKZnPg4ZgHbwf/wHRzAmNjmB/A0Cz9
         BESzpbDj0VGjuuY2N8FfvzSjw+Vx5NFhWBI7406cMWYpY9GqaKoznOKCPRcyvt+vwzm+
         Fd+BQPlB0Et3/JMSYcAuXGxQZVa8PKyYF+WminsGW3TaMM5dLGiunt86icrXyWDspvMM
         86Kw==
X-Gm-Message-State: AOJu0YyYMNwmUEtcS2JZs2wl8wcxysLOdeUX24UCoiLoG7d0ri3lF0/W
	1osFIy1COKUt7v6vpNOJrgUogAx2fTo9/rGlsV8wi2Yy4NsCI+634+z32BO9+Q==
X-Gm-Gg: Acq92OFAFvTD7eabrz+fKhyMEXCzjPbqXk0UF6O0daYtulJZfQQ1XDtHhrwGRxkPwvZ
	fCY2aQUUFxhfXayhxWlfUeWV412RyzrgS1mU0orKtMw884b0VO2gdYdLMJ6cDidxqLjCNDdpbG4
	boAACbX79gPjS3mLolTHne1jpiS1J16YCIwvrzW9e2MPhimlcplxBqxMxrhsrM3knr1L7fNlaBe
	X3hT5D/OrSDBvrAr/R6HLBXZ6y4G3uA0nBxHCdAzQgqED2BDKkkRQeFFzliEHGtIl1FeRX02fOv
	vY3BWoskmjUcYSIy5sXq2mDqiLdEYo7jd/0AeXP1GbmSH932MWtAt3Yb21yPZoayh85kgSrj6Qu
	acF7QNxkbo4yEupoXw1mJjJEnM07dqxNCrXPohN54midyEwNb5xLBQZJ4roIMBqF+I7bjulGFXr
	2RrURma82HGsDni1pXnvww+3oWCdpbFADK7QC83UJk0dsmQ45ap6BMGgyrC2bDIAqbBNzSLD+AP
	vc6M/etjEd0+089G32SB4ucZZ0Y8gYKbjU=
X-Received: by 2002:a05:600c:c111:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-490b8c0d5b2mr28721835e9.19.1780484104811;
        Wed, 03 Jun 2026 03:55:04 -0700 (PDT)
Received: from host2.home (88-170-249-143.subs.proxad.net. [88.170.249.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b7a52dabsm13174295e9.1.2026.06.03.03.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:55:04 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>
Subject: [PATCH v3 2/2] oe-selftest: fitimage: support new schema for uboot configuration signing
Date: Wed,  3 Jun 2026 12:54:53 +0200
Message-ID: <20260603105453.25881-2-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603105453.25881-1-marta.rybczynska@ygreky.com>
References: <20260603105453.25881-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 10:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238092

From: Marta Rybczynska <rybczynska@gmail.com>

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
index 3541c07520..ad523e93c1 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -365,7 +365,7 @@ class FitImageTestCase(OESelftestTestCase):
         self._is_req_dict_in_dict(sections, req_sections)
 
         # Call the signing related checks if the function is provided by a inherited class
-        self._check_signing(bb_vars, sections, num_signatures, uboot_tools_bindir, fitimage_path)
+        self._check_signing(bb_vars, sections, req_sections, num_signatures, uboot_tools_bindir, fitimage_path)
 
     def _get_req_its_paths(self, bb_vars):
         self.logger.error("This function needs to be implemented")
@@ -387,7 +387,7 @@ class FitImageTestCase(OESelftestTestCase):
         self.logger.error("This function needs to be implemented")
         return ({}, 0)
 
-    def _check_signing(self, bb_vars, sections, num_signatures, uboot_tools_bindir, fitimage_path):
+    def _check_signing(self, bb_vars, sections, req_sections, num_signatures, uboot_tools_bindir, fitimage_path):
         """Verify the signatures in the FIT image."""
         self.fail("Function needs to be implemented by inheriting classes")
 
@@ -789,7 +789,7 @@ class KernelFitImageBase(FitImageTestCase):
                     num_signatures += 1
         return (req_sections, num_signatures)
 
-    def _check_signing(self, bb_vars, sections, num_signatures, uboot_tools_bindir, fitimage_path):
+    def _check_signing(self, bb_vars, sections, req_sections, num_signatures, uboot_tools_bindir, fitimage_path):
         """Verify the signature nodes in the FIT image"""
         if bb_vars['UBOOT_SIGN_ENABLE'] == "1":
             self.logger.debug("Verifying signatures in the FIT image")
@@ -809,6 +809,8 @@ class KernelFitImageBase(FitImageTestCase):
         for section, values in sections.items():
             # Configuration nodes are always signed with UBOOT_SIGN_KEYNAME (if UBOOT_SIGN_ENABLE = "1")
             if section.startswith(bb_vars['FIT_CONF_PREFIX']):
+                if 'Sign algo' not in req_values[section]:
+                    continue
                 sign_algo = values.get('Sign algo', None)
                 req_sign_algo = "%s,%s:%s" % (fit_hash_alg, fit_sign_alg, uboot_sign_keyname)
                 self.assertEqual(sign_algo, req_sign_algo, 'Signature algorithm for %s not expected value' % section)
@@ -1329,6 +1331,8 @@ class UBootFitImageTests(FitImageTestCase):
             'SPL_MKIMAGE_SIGN_ARGS',
             'SPL_SIGN_ENABLE',
             'SPL_SIGN_KEYNAME',
+            'SPL_SIGN_INDIVIDUAL',
+            'SPL_SIGN_CONF',
             'UBOOT_ARCH',
             'UBOOT_DTB_BINARY',
             'UBOOT_DTB_IMAGE',
@@ -1382,10 +1386,14 @@ class UBootFitImageTests(FitImageTestCase):
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
@@ -1493,16 +1501,26 @@ class UBootFitImageTests(FitImageTestCase):
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
@@ -1515,16 +1533,13 @@ class UBootFitImageTests(FitImageTestCase):
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


