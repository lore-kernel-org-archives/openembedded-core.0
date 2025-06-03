Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA6DC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 08:24:35 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.6267.1748939069779333413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 01:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=AKXAiEXS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-202506030824270659fe063b3f218c42-akvcur@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202506030824270659fe063b3f218c42
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Jun 2025 10:24:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=FwYPLh2/Vfhxj8SVsKjpaNDozZDzFZDwy8ZJHJZFqGs=;
 b=AKXAiEXSE8UPIu0V9wbCCN6CS2no/WWUapAnkh4fzlQDx3JWoSffejW+zDkQvarsWygekK
 uBYp80Ky0Dldg53tEa53tFoSAXGvQMN5YB1u2v8NOMrZwSCglJ5Utawq4xu4m7jnr6vgG4ST
 cuX197Te5dObIp35wnO+PHH5t5PqCK12lTIcMKEX3irxp1BZ/l1kBLv2iM9m786R8o8ILIZz
 BYar3dZNgArwkYhoiSXvt+CAnscER0ejp080gOYh+zI9oIAKdrwypmuqOIYBFExnkAXljZFd
 34hRfElYQ+532Vj4PcP0wlTfUTF0y1ANsuqUmZmayp4bdIatzi+ORdFg==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v7 03/20] oe-selftest: fitimage: test external dtb
Date: Tue,  3 Jun 2025 10:23:14 +0200
Message-ID: <20250603082419.409564-4-adrian.freihofer@siemens.com>
In-Reply-To: <20250603082419.409564-1-adrian.freihofer@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 08:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217766

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
 meta/lib/oeqa/selftest/cases/fitimage.py | 73 ++++++++++++++++++++----
 1 file changed, 61 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index b39f2622dff..31116979ef7 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -161,10 +161,23 @@ class FitImageTestCase(OESelftestTestCase):
 
     @staticmethod
     def _get_dtb_files(bb_vars):
+        """Return a list of devicetree names
+
+        The list should be used to check the dtb and conf nodes in the FIT image or its file.
+        In addition to the entries from KERNEL_DEVICETREE, the external devicetree and the
+        external devicetree overlay added by the test recipe bbb-dtbs-as-ext are handled as well.
+        """
         kernel_devicetree = bb_vars.get('KERNEL_DEVICETREE')
+        all_dtbs = []
+        dtb_symlinks = []
         if kernel_devicetree:
-            return [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
-        return []
+            all_dtbs += [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
+        # Support only the test recipe which provides 1 devicetree and 1 devicetree overlay
+        pref_prov_dtb = bb_vars.get('PREFERRED_PROVIDER_virtual/dtb')
+        if pref_prov_dtb == "bbb-dtbs-as-ext":
+            all_dtbs += ["am335x-bonegreen-ext.dtb", "BBORG_RELAY-00A2.dtbo"]
+            dtb_symlinks.append("am335x-bonegreen-ext-alias.dtb")
+        return (all_dtbs, dtb_symlinks)
 
     def _is_req_dict_in_dict(self, found_dict, req_dict):
         """
@@ -379,6 +392,7 @@ class KernelFitImageTests(FitImageTestCase):
             'KERNEL_DEVICETREE',
             'KERNEL_FIT_LINK_NAME',
             'MACHINE',
+            'PREFERRED_PROVIDER_virtual/dtb',
             'UBOOT_ARCH',
             'UBOOT_ENTRYPOINT',
             'UBOOT_LOADADDRESS',
@@ -452,7 +466,7 @@ class KernelFitImageTests(FitImageTestCase):
                 ['/', 'images', 'kernel-1', 'signature-1'],
             ]
         """
-        dtb_files = FitImageTestCase._get_dtb_files(bb_vars)
+        dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
         fit_sign_individual = bb_vars['FIT_SIGN_INDIVIDUAL']
         fit_uboot_env = bb_vars['FIT_UBOOT_ENV']
         initramfs_image = bb_vars['INITRAMFS_IMAGE']
@@ -470,9 +484,9 @@ class KernelFitImageTests(FitImageTestCase):
         if initramfs_image and initramfs_image_bundle != "1":
             images.append('ramdisk-1')
 
-        # configuration nodes
+        # configuration nodes (one per DTB and also one per symlink)
         if dtb_files:
-            configurations = [ 'conf-' + conf for conf in dtb_files ]
+            configurations = [ 'conf-' + conf for conf in dtb_files + dtb_symlinks]
         else:
             configurations = [ 'conf-1' ]
 
@@ -548,7 +562,7 @@ class KernelFitImageTests(FitImageTestCase):
 
     def _get_req_sections(self, bb_vars):
         """Generate a dictionary of expected sections in the output of dumpimage"""
-        dtb_files = FitImageTestCase._get_dtb_files(bb_vars)
+        dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
         fit_hash_alg = bb_vars['FIT_HASH_ALG']
         fit_sign_alg = bb_vars['FIT_SIGN_ALG']
         fit_sign_individual = bb_vars['FIT_SIGN_INDIVIDUAL']
@@ -584,11 +598,20 @@ class KernelFitImageTests(FitImageTestCase):
             }
         # Create a configuration section for each DTB
         if dtb_files:
-            for dtb in dtb_files:
-                req_sections['conf-' + dtb] = {
-                    "Kernel": "kernel-1",
-                    "FDT": 'fdt-' + dtb,
-                }
+            for dtb in dtb_files + dtb_symlinks:
+                # Assume that DTBs with an "-alias" in its name are symlink DTBs created e.g. by the
+                # bbb-dtbs-as-ext test recipe. Make the configuration node pointing to the real DTB.
+                real_dtb = dtb.replace("-alias", "")
+                # dtb overlays do not refer to a kernel (yet?)
+                if dtb.endswith('.dtbo'):
+                    req_sections['conf-' + dtb] = {
+                        "FDT": 'fdt-' + real_dtb,
+                    }
+                else:
+                    req_sections['conf-' + dtb] = {
+                        "Kernel": "kernel-1",
+                        "FDT": 'fdt-' + real_dtb,
+                    }
                 if initramfs_image and initramfs_image_bundle != "1":
                     req_sections['conf-' + dtb]['Init Ramdisk'] = "ramdisk-1"
         else:
@@ -635,7 +658,12 @@ class KernelFitImageTests(FitImageTestCase):
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
@@ -696,6 +724,27 @@ FIT_DESC = "A model description"
         self._test_fitimage(bb_vars)
 
 
+    def test_fit_image_ext_dtb_dtbo(self):
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
+PREFERRED_PROVIDER_virtual/dtb = "bbb-dtbs-as-ext"
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


