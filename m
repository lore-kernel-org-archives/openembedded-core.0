Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A62CD5BD0
	for <webhook@archiver.kernel.org>; Tue, 26 May 2026 09:41:17 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33480.1779788469540591509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 02:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ibf8+geI;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so6424627f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 02:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779788468; x=1780393268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjOlcMcga9jvgId80aE6IC72kXXiM9Yag7igPaddJ54=;
        b=ibf8+geIjF5soKYT6JlB2yowrfD0FIcTy68CiiIYOX+KbZGZH9dPY9cyV6clYZjxaw
         JpiR3ezP+Io6iH8COqaUTLSBIpe+xEeRHr6WrrQNAnfEsfQEMmghuu0XPQWhMWMKyHnq
         sl48s7onjER5y/7XINMVP238DQlAcC5VsaLQ4spnwBU3yZ9VpIokaeBPsjVtmOWcf+Ax
         PN4fHwzDfMtviyVsw7HbLGJ5BNmYF1U/QEi7MYGxMyUWfwrR4rXlSyaFF/Ox/76eN9iI
         FIGV1GH7Ilk/bY9PZAUNAkmPRrHsMjM+L+vazGBtkarSThTLg9P3I8Zw3riLXEyoKB/W
         uWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788468; x=1780393268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kjOlcMcga9jvgId80aE6IC72kXXiM9Yag7igPaddJ54=;
        b=T9SOaE2zomv+aSZET2pZ0E5ZZGzlxaxQBpJ+ILyxbEzQ3Ug11tODm4luQcOb67u6QJ
         EWjW1Ne4EVj/bjWHnqF30eDEO3ndqiuJyJqWU5sJzqG2AWjrwelpigAYE0Clnl6dm+EU
         AcSmLDIN+O3Uzmk3c2zlxbLhxh53JdvDXbWVCqhYdNHM8cX8fmvHcYR4cJIHi+RGpT03
         255haS2lhYycIqkRCciIzrlzw8l9yFN/tn6o9tffdmSMZJZEtehF84zk4Wt7vgBeTeg+
         WU05sRHtevc1abdwuRuH8AhNGG0LaIJgk9dsyscnSLDvYF/OxNKXFOOsPC+EDj2nE5oa
         L91w==
X-Gm-Message-State: AOJu0Yx5qKklrCZ/aHJjabRELpygycd2A0PQPgNRojSs2EdrH/OBYiZG
	iV396nefpENYrF6ySkCGc0tZ78EmwD9eXb4gOQxjjgSuWbCeJwNl93oiM2KJkA==
X-Gm-Gg: Acq92OFh+C4stWl6wB2WMb1ZSuV6LEc2tQ6caYj5CH0ZcMatg/Rz9e/wtdWC41Or1gS
	/zoyn3TT+xN7ZCnklkmih7gHqTmT+NxJKT2MHpAlPeAhrM4tAoPn+3TJB0WeBh1iH3BFDUjeHGS
	TLM3BdHnlCBa02iXy320ueQS7r5xbo1ZkFZ8gD6EPR5zCuEkyW/BvokfQwxEKtXmxyyM1KySjVJ
	vET9uO6aGfwz5GEquNVN/kPmeaWF10i1SMs2evp5BukqC/arA/qdT6MMlpD6pIqrrRCaiSWhcmW
	ksw4+DCm0I2ZmkBUP+frBX+psS7L8/XWibiUYP421stW4Qv6Z0xEKfvJq+PIdFppHeG+fvf+EG/
	Xcv5yD211DdmM9U4DoeXqQd2lyUTJYLR7XCU61sRtZVgfwvZR9MwPL9L9aZ4flljfUwgwB6oNwg
	0EOzv5Dm8Y0DpXaj/8jti+bjjYmw82x44/zTPNwcZfEud5FqPriLMw+iT48N4Vn7vl0yRjZnv8o
	cYiODlV5+wpCUEsd4dHLkCiZCDB9Rbjl1Lpkw==
X-Received: by 2002:a05:6000:480e:b0:45e:739b:3e3c with SMTP id ffacd0b85a97d-45eb36418d3mr27077038f8f.0.1779788467628;
        Tue, 26 May 2026 02:41:07 -0700 (PDT)
Received: from localhost.localdomain (88-174-158-187.subs.proxad.net. [88.174.158.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d70c51sm36508800f8f.36.2026.05.26.02.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 02:41:06 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@ygreky.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>
Subject: [PATCH v2 2/2] oe-selftest: fitimage: support new schema for uboot configuration signing
Date: Tue, 26 May 2026 11:40:42 +0200
Message-ID: <20260526094042.54135-2-marta.rybczynska@ygreky.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526094042.54135-1-marta.rybczynska@ygreky.com>
References: <20260526094042.54135-1-marta.rybczynska@ygreky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 09:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237593

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
2.47.3


