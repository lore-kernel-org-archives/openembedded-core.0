Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27808.1792952682142185802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2026 11:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=b9ltNjSh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-1329275-2026102518243994b8c7ffb50002070f-zlyfjx@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026102518243994b8c7ffb50002070f
        for <openembedded-core@lists.openembedded.org>;
        Sun, 25 Oct 2026 19:24:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=RJRLZHHqqGvWSg/436fj7Oj6nr9z2myF2Xo21r1MRB4=;
 b=b9ltNjShl9E8jTJa3Vk8M9SNrvRez/DJXM6cyb5QIaCge7sv6rWDsf4Yy/UJsb63m0XX9u
 TdcNz0+dLaH1jup13ThNMnHYvX5evqsyqTXWXk+cu4ns4MGRQ3hDyIsZmo23my9wY/WDnPks
 nBOWuU8w5WlYwTjY/Jdj4aWJ5bFu9WZ/jA/fXavCIX1d51EDFQF5dLCc6Me9El1IbU+kLwOB
 AT2zliUfpp3wXGtmFLfpmEmCvqhTpNYSCUfFYyhDXK5mp7zB0VoiCmcUails88HZ497t/d3y
 4/htPZeY+s9mBAvRMClR9otBfmy0bFJk+zcvkpGltX3kYhmXUFrekskw==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v5 3/6] oe-selftest: fitimage: check image vs. configuration signing
Date: Sun, 25 Oct 2026 19:23:56 +0100
Message-ID: <20261025182436.788918-4-adrian.freihofer@siemens.com>
In-Reply-To: <20261025182436.788918-1-adrian.freihofer@siemens.com>
References: <20261025182436.788918-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 18:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248622
Content-Type: text/plain; charset="utf-8"

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Extend the UBootFitImageTests checks to tell individual image signing
(SPL_SIGN_INDIVIDUAL) and configuration signing (SPL_SIGN_CONF) apart:

- The its file must not contain the image signature, image hash or
  configuration signature nodes of the mode which is not enabled.
- The configuration signature node is looked up per configuration
  instead of a hardcoded "conf" node.
- The configuration signature must list the signed images in
  sign-images.
- The public key in the deployed SPL DTB must be required for "conf"
  respectively "image".

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 45 ++++++++++++++++++++----
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 50ac3f94ea..c5c446dabf 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1685,6 +1685,8 @@ class UBootFitImageTests(FitImageTestCase):
             'FIT_SIGN_INDIVIDUAL',
             'FIT_SIGN_NUMBITS',
             'MACHINE',
+            'SPL_DTB_BINARY',
+            'SPL_DTB_IMAGE',
             'SPL_MKIMAGE_SIGN_ARGS',
             'SPL_SIGN_ENABLE',
             'SPL_SIGN_KEYNAME',
@@ -1699,6 +1701,7 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS',
             'UBOOT_FIT_ARM_TRUSTED_FIRMWARE',
             'UBOOT_FIT_CONF_DESC',
+            'UBOOT_FIT_CONF_FIRMWARE',
             'UBOOT_FIT_CONF_USER_LOADABLES',
             'UBOOT_FIT_DESC',
             'UBOOT_FIT_HASH_ALG',
@@ -1761,19 +1764,30 @@ class UBootFitImageTests(FitImageTestCase):
         # configuration nodes
         configurations = [ 'conf']
 
+        spl_sign_enable = bb_vars['SPL_SIGN_ENABLE'] == "1"
+        spl_sign_individual = spl_sign_enable and bb_vars['SPL_SIGN_INDIVIDUAL'] == "1"
+        spl_sign_conf = spl_sign_enable and bb_vars['SPL_SIGN_CONF'] == "1"
+
         # Create a list of paths for all image and configuration nodes
         req_its_paths = []
+        not_req_its_paths = []
         for image in images:
             req_its_paths.append(['/', 'images', image])
-            if bb_vars['SPL_SIGN_ENABLE'] == "1" and bb_vars['SPL_SIGN_INDIVIDUAL'] == "1":
+            if spl_sign_individual:
                 req_its_paths.append(['/', 'images', image, 'signature'])
-            elif bb_vars['SPL_SIGN_ENABLE'] == "1" and bb_vars['SPL_SIGN_CONF'] == "1":
+            else:
+                not_req_its_paths.append(['/', 'images', image, 'signature'])
+            if spl_sign_conf:
                 req_its_paths.append(['/', 'images', image, 'hash-1'])
+            else:
+                not_req_its_paths.append(['/', 'images', image, 'hash-1'])
         for configuration in configurations:
             req_its_paths.append(['/', 'configurations', configuration])
-            if bb_vars['SPL_SIGN_ENABLE'] == "1" and bb_vars['SPL_SIGN_CONF'] == "1":
-                req_its_paths.append(['/', 'configurations', 'conf', 'signature'])
-        return (req_its_paths, [])
+            if spl_sign_conf:
+                req_its_paths.append(['/', 'configurations', configuration, 'signature'])
+            else:
+                not_req_its_paths.append(['/', 'configurations', configuration, 'signature'])
+        return (req_its_paths, not_req_its_paths)
 
     def _get_req_its_fields(self, bb_vars):
         loadables = ["uboot"]
@@ -1823,10 +1837,17 @@ class UBootFitImageTests(FitImageTestCase):
             'loadables = "%s";' % '", "'.join(loadables),
             'fdt = "fdt";',
         ]
+        if bb_vars['SPL_SIGN_ENABLE'] == "1" and bb_vars['SPL_SIGN_CONF'] == "1":
+            sign_images = []
+            if bb_vars.get('UBOOT_FIT_CONF_FIRMWARE'):
+                sign_images.append("firmware")
+            sign_images += ["loadables", "fdt"]
+            its_field_check.append('sign-images = "%s";' % '", "'.join(sign_images))
         return its_field_check
 
     def _get_req_sigvalues_config(self, bb_vars):
-        # COnfigurations are not signed by uboot-sign
+        # The "conf" node does not match FIT_CONF_PREFIX, so a configuration
+        # signature (SPL_SIGN_CONF) is checked against _get_req_sigvalues_image
         return {}
 
     def _get_req_sigvalues_image(self, bb_vars):
@@ -1920,6 +1941,18 @@ class UBootFitImageTests(FitImageTestCase):
             sign_value = values.get('Sign value', None)
             self.assertEqual(len(sign_value), fit_sign_alg_len, 'Signature value for section %s not expected length' % section)
 
+        # The public key added to the SPL DTB tells SPL what has to be signed:
+        # "conf" for configuration signatures, "image" for individual image signatures.
+        if bb_vars['SPL_DTB_BINARY']:
+            dtc_bindir = FitImageTestCase._setup_native('dtc-native')
+            spl_dtb_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], bb_vars['SPL_DTB_IMAGE'])
+            key_dtb_path = "/signature/key-" + spl_sign_keyname
+            req_required = "conf" if bb_vars['SPL_SIGN_CONF'] == "1" else "image"
+            self._verify_dtb_property(dtc_bindir, spl_dtb_path, key_dtb_path, "required", req_required)
+            self._verify_dtb_property(dtc_bindir, spl_dtb_path, key_dtb_path, "algo",
+                                      "%s,%s" % (uboot_fit_hash_alg, uboot_fit_sign_alg))
+            self._verify_dtb_property(dtc_bindir, spl_dtb_path, key_dtb_path, "key-name-hint", spl_sign_keyname)
+
         # Search for the string passed to mkimage in each signed section of the FIT image.
         # Looks like mkimage supports to add a comment but does not support to read it back.
         a_comment = FitImageTestCase._get_uboot_mkimage_sign_args(bb_vars['SPL_MKIMAGE_SIGN_ARGS'])
-- 
2.56.0

