Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074ABC3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 18:53:23 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.109891.1747248795566885635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 11:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=U6jaU0AR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20250514185312137207b5cd9eb22787-ol_0y1@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250514185312137207b5cd9eb22787
        for <openembedded-core@lists.openembedded.org>;
        Wed, 14 May 2025 20:53:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=AcvuOY2g3YF2/NGw1sTjLx/jnbsuEvLASeaPQT2Jegc=;
 b=U6jaU0ARtjqS5Tq+77T4tQ26+Qbly5FZRo8f9ejEa1qVQ1mZ+XDsCoDNJNHyJAFr5lsqFH
 QqpmP0kplQVIMeH7jEYteSEM5OUdPPbhYxzkZ06SgoUQametHviv0QmyazHoZO+AWphd8kGz
 2xqYISAdircmYkyeTh6eHnRbrpU55LjNkTrjvs5WkKHQ/Qo53/OwtH05QlOdGdSuWHPRVjSj
 Dh8z8qXvNmFowkl90rMrcH7KCzEg5wB/IIsauNf6Yn+1n6R27U1tVo6xUnuS4RGVfsgrVmjF
 vf+oAg9AfZHVPp+r9F2KOK5DPaig8vVhZGfPLJjz778MZs3OtYlk36Bg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 01/22] oe-selftest: fitimage: test coverage for ext dtb
Date: Wed, 14 May 2025 20:50:45 +0200
Message-ID: <20250514185225.162998-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250514185225.162998-1-adrian.freihofer@siemens.com>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 18:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216525

From: Adrian Freihofer <adrian.freihofer@siemens.com>

There are several ways to insert external devicetrees and devicetree
overlays into the kernel and thus at least to some extent into the FIT
image.
So far there is no test coverage. Let's improve this as much as possible
without fully understanding all use cases.

This first test adds a devicetree overlay to a build configuration
without signing, since signing is apparently not yet meaningful when
PREFERRED_PROVIDER_virtual/dtb = “bborg-relay-00a2” is used. It is also
not entirely clear how these external devicetree overlays are used by
the configuration nodes of the FIT image. Currently, one configuration
is created per dtb dtbo node, which is not really useful for dtbo nodes.
Before this test can be extended to test devicetree overlays and
signing, the code that creates the configuration nodes in its file
probably needs some improvements in terms of more flexibility in
defining the references from configuration nodes to image nodes.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/selftest/cases/fitimage.py | 58 +++++++++++++++++++++---
 1 file changed, 51 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index b39f2622dff..c3554d4499a 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -161,10 +161,21 @@ class FitImageTestCase(OESelftestTestCase):
 
     @staticmethod
     def _get_dtb_files(bb_vars):
+        """Return a list of devicetree names
+
+        The list should be used to check the dtb and conf nodes in the FIT image or its file.
+        In addition to the entries from KERNEL_DEVICETREE, the external devicetree overlay
+        added by the test recipe bborg-relay-00a2.bb is also handled.
+        """
         kernel_devicetree = bb_vars.get('KERNEL_DEVICETREE')
+        all_dtbs = []
         if kernel_devicetree:
-            return [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
-        return []
+            all_dtbs += [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
+        # Support only the test recipe which provides 1 devicetree overlay
+        pref_prov_dtb = bb_vars.get('PREFERRED_PROVIDER_virtual/dtb')
+        if pref_prov_dtb == "bborg-relay-00a2":
+            all_dtbs.append("BBORG_RELAY-00A2.dtbo")
+        return all_dtbs
 
     def _is_req_dict_in_dict(self, found_dict, req_dict):
         """
@@ -379,6 +390,7 @@ class KernelFitImageTests(FitImageTestCase):
             'KERNEL_DEVICETREE',
             'KERNEL_FIT_LINK_NAME',
             'MACHINE',
+            'PREFERRED_PROVIDER_virtual/dtb',
             'UBOOT_ARCH',
             'UBOOT_ENTRYPOINT',
             'UBOOT_LOADADDRESS',
@@ -585,10 +597,16 @@ class KernelFitImageTests(FitImageTestCase):
         # Create a configuration section for each DTB
         if dtb_files:
             for dtb in dtb_files:
-                req_sections['conf-' + dtb] = {
-                    "Kernel": "kernel-1",
-                    "FDT": 'fdt-' + dtb,
-                }
+                # dtb overlays do not refer to a kernel (yet?)
+                if dtb.endswith('.dtbo'):
+                    req_sections['conf-' + dtb] = {
+                        "FDT": 'fdt-' + dtb,
+                    }
+                else:
+                    req_sections['conf-' + dtb] = {
+                        "Kernel": "kernel-1",
+                        "FDT": 'fdt-' + dtb,
+                    }
                 if initramfs_image and initramfs_image_bundle != "1":
                     req_sections['conf-' + dtb]['Init Ramdisk'] = "ramdisk-1"
         else:
@@ -635,7 +653,12 @@ class KernelFitImageTests(FitImageTestCase):
                 self.assertEqual(sign_algo, req_sign_algo, 'Signature algorithm for %s not expected value' % section)
                 sign_value = values.get('Sign value', None)
                 self.assertEqual(len(sign_value), fit_sign_alg_len, 'Signature value for section %s not expected length' % section)
-                dtb_path = os.path.join(deploy_dir_image, section.replace('conf-', ''))
+                dtb_file_name = section.replace('conf-', '')
+                dtb_path = os.path.join(deploy_dir_image, dtb_file_name)
+                # External devicetrees created by devicetree.bbclass are in a subfolder and have priority
+                dtb_path_ext = os.path.join(deploy_dir_image, "devicetree", dtb_file_name)
+                if os.path.exists(dtb_path_ext):
+                    dtb_path = dtb_path_ext
                 self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path, dtb_path, section)
             else:
                 # Image nodes always need a hash which gets indirectly signed by the config signature
@@ -696,6 +719,27 @@ FIT_DESC = "A model description"
         self._test_fitimage(bb_vars)
 
 
+    def test_fit_image_ext_dtbo(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are created correctly.
+        Expected:    1) its and FIT image are built successfully
+                     2) The its file contains also the external devicetree overlay
+                     3) Dumping the FIT image indicates the devicetree overlay
+        """
+        config = """
+# Enable creation of fitImage
+MACHINE = "beaglebone-yocto"
+KERNEL_IMAGETYPES += " fitImage "
+KERNEL_CLASSES = " kernel-fitimage "
+# Add a devicetree overlay which does not need kernel sources
+PREFERRED_PROVIDER_virtual/dtb = "bborg-relay-00a2"
+"""
+        config = self._config_add_uboot_env(config)
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
+
+
     def test_sign_fit_image_configurations(self):
         """
         Summary:     Check if FIT image and Image Tree Source (its) are created
-- 
2.49.0


