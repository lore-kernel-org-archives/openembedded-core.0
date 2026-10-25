Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27594.1792952682142977798
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:24:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=Sz4qWWmG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-1329275-20261025182439bc35fe0ca3000207c8-ukktnn@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261025182439bc35fe0ca3000207c8
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:24:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=DaGQDg75imm3H+HGbJ06QdvLnyeI0svdx2macBzQBXo=;
 b=Sz4qWWmGNrLlLJdOrysd4o5ddIEFx40KnUIrR5JLGV5Tycz3cu9H/jN8v91r3UvJ8T8aVR
 wdz/KfxrcmhQTZ4QNOJjiKWnrI6PV8dMf4NlMasY+x/XHdSzhDSsNgtxjsjrEGxW/CzkANqj
 6ZErenGZEb+UcN33B04UHtygq/l9xMcOp93Tk2n5wTGHVgyh69sKRPbVnostkqH6AR1jDz4y
 EfFyn1yjuTeRBZ6bvaaxBcFs9BPuVvekB0F++itFUKwAwU/fT2uE2eyDDUJ/bIbtwu3FUNJb
 g7QZVFQFGJlrifEqm7YdBFxM1bw/g4yhjZyepErWBkRdqTU7IkfY+erQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 2/6] oe-selftest: fitimage: support new schema for uboot configuration signing
Date: Sun, 25 Oct 2026 19:23:55 +0100
Message-ID: <20261025182436.788918-3-adrian.freihofer@siemens.com>
In-Reply-To: <20261025182436.788918-1-adrian.freihofer@siemens.com>
References: <20261025182436.788918-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248624
Content-Type: text/plain; charset="utf-8"

From: Marta Rybczynska <rybczynska@gmail.com>

Modify testcases after adding signing of a configuration of uboot instead
of various sections separately.

This change includes an additional parameter to _check_signing that allows
more flexible configuration and avoids assumptions on what section has,
and which section does not have a signature - now they are defined
in a data structure.

[Adrian: dropped the check of the undefined req_values variable in
 KernelFitImageBase._check_signing which caused a NameError]

Signed-off-by: Marta Rybczynska <rybczynska@gmail.com>
Reviewed-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 51 +++++++++++++++---------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 5d77e6da09..50ac3f94ea 100644
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
@@ -1688,6 +1688,8 @@ class UBootFitImageTests(FitImageTestCase):
             'SPL_MKIMAGE_SIGN_ARGS',
             'SPL_SIGN_ENABLE',
             'SPL_SIGN_KEYNAME',
+            'SPL_SIGN_INDIVIDUAL',
+            'SPL_SIGN_CONF',
             'TOPDIR',
             'UBOOT_ARCH',
             'UBOOT_DTB_BINARY',
@@ -1763,10 +1765,14 @@ class UBootFitImageTests(FitImageTestCase):
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
@@ -1874,16 +1880,26 @@ class UBootFitImageTests(FitImageTestCase):
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
@@ -1896,16 +1912,13 @@ class UBootFitImageTests(FitImageTestCase):
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
2.56.0

