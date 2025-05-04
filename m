Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0673C3ABAC
	for <webhook@archiver.kernel.org>; Sun,  4 May 2025 13:06:58 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.28200.1746364017415901514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 May 2025 06:06:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=GBbLduS4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20250504130654018b8a70060015eed4-luh_98@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250504130654018b8a70060015eed4
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 May 2025 15:06:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=TZ4WNbZ8ZNrzpyM8Q/8BDk18xkr43EPXZqCpe6qpIW4=;
 b=GBbLduS43p2RmWM4poFpEFfWocmyiir7JrBaRGdAaOwAoXTu2VPmEnJsF9EMeaD8crq1Hy
 d4eXrL8xKvrpIlx48vrhc3X1AjXArDTSf4h+D28F1v+W+9I/RhTOBifTfd0Vuycc+I47Aj2U
 MusGDo+FMc4GLeBWQ7CRGyTASdujCieMT5ZTGOqWprc3Xh6mFbCozS2hzjiUJaPmMPV8iYQm
 ZHWtv32dHOyhxYi5ONfE220gXoe3MCtD6s2S7AwMgBJEGYq4P2MJ3/+sKEkKlauAKjBrDEB3
 tT+5qYIGB1WHe3J23ZoN1tL2b0LgkxLcRQ745hwzGrnxhwUEpqTaZtMQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: marex@denx.de,
	l.anderweit@phytec.de,
	richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	bruce.ashfield@gmail.com,
	rogerio.borin@toradex.com,
	sean.anderson@seco.com,
	m.felsch@pengutronix.de,
	ejo@pengutronix.de,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 02/20] oe-selftest: fitimage: test coverage for ext dtb
Date: Sun,  4 May 2025 15:04:49 +0200
Message-ID: <20250504130507.717954-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250504130507.717954-1-adrian.freihofer@siemens.com>
References: <20250504130507.717954-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 May 2025 13:06:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215949

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
 meta/lib/oeqa/selftest/cases/fitimage.py | 44 ++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index b39f2622dff..ba5adaa9b67 100644
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
@@ -635,7 +647,12 @@ class KernelFitImageTests(FitImageTestCase):
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
@@ -696,6 +713,27 @@ FIT_DESC = "A model description"
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


