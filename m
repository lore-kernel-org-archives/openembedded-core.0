Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id D51F278495
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 13:54:44 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id t139so6123320ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 06:54:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MLrECYhH7lakvEfQcMwcY/J1yG6NPL2SjNO22QBc3sI=;
	b=S+RusJs3jGpNfStJYHto6NKZF4Q/UH1i7aDoXRn0+Rim8NuSoC4a2kg6EsOkFJNVjo
	C962yVCck4keTPBQXv2RS+YvFIEW3+QoqjZHvvzBdm/Cvhxasb9bJL2Ge37WWFdvVlEw
	JOkSt7+/ukMOCPoWYi0I7+7lMKPDGI6kq8BMhyJh6j+6xKrpH2BgN8LT2BG6GBD0QcIM
	oWyj5T9pcwwMDI4QGMcRcSvCtcuKnxZ9M4WIzvy4S7vCVtYXea3gC7ZTBgA457V0G0/B
	+BusG6uJG096KVsllisDDS5sFTK7zGtI+wzs6KqTLbUYxZuQqjRX26Z4Ai/+V5KLD8jU
	fQ5Q==
X-Gm-Message-State: AIVw112kXVowHlwlVK8iBGd2rq+xXhjFJdoNs9+wxUomkvEvZdOQX+Ak
	ZCZwx/U4/zvqT43I
X-Received: by 10.129.82.215 with SMTP id g206mr7269771ywb.440.1501250085520; 
	Fri, 28 Jul 2017 06:54:45 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-0-58.ec.res.rr.com.
	[174.106.0.58]) by smtp.gmail.com with ESMTPSA id
	p127sm7984263ywf.46.2017.07.28.06.54.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Jul 2017 06:54:44 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 09:55:58 -0400
Message-Id: <1501250158-32429-5-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501250158-32429-1-git-send-email-trini@konsulko.com>
References: <1501250158-32429-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv3 5/5] imagefeatures: Add a test for various hypervisor formats
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jul 2017 13:54:45 -0000

We add a new test that will create core-image-minimal for wic.vmdk,
wic.vdi and wic.qcow2.  We then confirm via qemu-img that the resulting
file is of the expected type.

Cc: Ed Bartosh <ed.bartosh@linux.intel.com>
Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2: New patch
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 2c59ef6490b3..bb2e0dba4c23 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -3,6 +3,7 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.utils.sshcontrol import SSHControl
 import os
+import json
 
 class ImageFeatures(OESelftestTestCase):
 
@@ -130,6 +131,40 @@ class ImageFeatures(OESelftestTestCase):
         # check if the resulting gzip is valid
         self.assertTrue(runCmd('gzip -t %s' % gzip_path))
 
+    def test_hypervisor_fmts(self):
+        """
+        Summary:     Check various hypervisor formats
+        Expected:    1. core-image-minimal can be built with vmdk, vdi and
+                        qcow2 support.
+                     2. qemu-img says each image has the expected format
+        Product:     oe-core
+        Author:      Tom Rini <trini@konsulko.com>
+        """
+
+        img_types = [ 'vmdk', 'vdi', 'qcow2' ]
+        features = ""
+        for itype in img_types:
+            features += 'IMAGE_FSTYPES += "wic.%s"\n' % itype
+        self.write_config(features)
+
+        image_name = 'core-image-minimal'
+        bitbake(image_name)
+
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
+        for itype in img_types:
+            image_path = os.path.join(deploy_dir_image, "%s.wic.%s" %
+                                      (link_name, itype))
+
+            # check if result image file is in deploy directory
+            self.assertTrue(os.path.exists(image_path))
+
+            # check if result image is vmdk
+            sysroot = get_bb_var('STAGING_DIR_NATIVE', 'core-image-minimal')
+            result = runCmd('qemu-img info --output json %s' % image_path,
+                            native_sysroot=sysroot)
+            self.assertTrue(json.loads(result.output).get('format') == itype)
+
     def test_long_chain_conversion(self):
         """
         Summary:     Check for chaining many CONVERSION_CMDs together
-- 
1.9.1


