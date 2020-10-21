Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.8868.1603270534939102727
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 01:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: 2nCvckLa1EW62UXQWfif88EP6lwSW0+cOwUNNpHzTY6hMNrMDjY3bDkFn0v3xwIkFhuKn9tZAV
 tAcKIrlwuQog==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="166559818"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; 
   d="scan'208";a="166559818"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 01:55:30 -0700
IronPort-SDR: PA/USzLFuJeJnrln3iF1X7XpUXhIIY+8c46DM53PkpTasthCThutXf/buM8OhB4gbZA+pu9YRb
 3gYGjXphZNjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; 
   d="scan'208";a="320948993"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga006.jf.intel.com with ESMTP; 21 Oct 2020 01:55:29 -0700
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: khairul.rohaizzat.jamaluddin@intel.com
Subject: [PATCH] imagefeatures: New test case, test_empty_image, added
Date: Wed, 21 Oct 2020 16:55:28 +0800
Message-Id: <1603270528-89286-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

An empty image build file exists under the meta-selftest folder, test-empty-image.bb,
which builds an image with no additional packages. However, there were no further
selftest created to verify its emptiness

This change consists of the selftest related to the said image to verify its
emptiness and the 'import glob' moved as global import instead of local import.

The expected outcome of the test should be TRUE or 1 if the .manifest file content
is empty.

[YOCTO #8455]

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index f7a2533..415e031 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -5,6 +5,7 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.sshcontrol import SSHControl
+import glob
 import os
 import json
 
@@ -347,7 +348,7 @@ UBOOT_ENTRYPOINT = "0x80080000"
         Author:      Humberto Ibarra <humberto.ibarra.lopez@intel.com>
                      Yeoh Ee Peng <ee.peng.yeoh@intel.com>
         """
-        import glob
+      
         image_name = 'core-image-minimal'
         features = 'IMAGE_GEN_DEBUGFS = "1"\n'
         features += 'IMAGE_FSTYPES_DEBUGFS = "tar.bz2"\n'
@@ -368,3 +369,12 @@ UBOOT_ENTRYPOINT = "0x80080000"
         for t in dbg_symbols_targets:
             result = runCmd('objdump --syms %s | grep debug' % t)
             self.assertTrue("debug" in result.output, msg='Failed to find debug symbol: %s' % result.output)
+
+    def test_empty_image(self):
+        """Test creation of image with no packages"""
+        bitbake('test-empty-image')
+        res_dir = get_bb_var('DEPLOY_DIR_IMAGE')
+        images = os.path.join(res_dir, "test-empty-image-*.manifest")
+        result = glob.glob(images)
+        with open(result[1],"r") as f:
+                self.assertEqual(len(f.read().strip()),0)
-- 
2.7.4

