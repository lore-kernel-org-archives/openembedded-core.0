Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.6128.1588321844381139375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 01:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: K68pDfZd5554+Ie09B4JbkN73VJIRDUpKpaObIdgm3MiqkSQBM9m3d4kHHfFzyAwt9HZu5slBT
 wcakV+WhV+dA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2020 01:30:43 -0700
IronPort-SDR: X3uc4g5Bsmmysd/7yf1dq1bhosrw/f8CgbZSnJgruO8rineZNY3jUXZRThNPdcUqvhrvgixkSv
 oj0nmn5Xz2kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; 
   d="scan'208";a="249977793"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 01 May 2020 01:30:42 -0700
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Subject: [PATCH v02] selftest/imagefeatures: Enable sanity test for IMAGE_GEN_DEBUGFS
Date: Fri,  1 May 2020 16:30:39 +0800
Message-Id: <1588321839-30067-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4

Add new testcase to check IMAGE_GEN_DEBUGFS. Test makes
sure that debug filesystem is created accordingly. Test also check
for debug symbols for some packages as suggested by Ross Burton.

[YOCTO #10906]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 5c519ac..2b9c499 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -262,3 +262,35 @@ PNBLACKLIST[busybox] = "Don't build this"
         self.write_config(config)
 
         bitbake("--graphviz core-image-sato")
+
+    def test_image_gen_debugfs(self):
+        """
+        Summary:     Check debugfs generation
+        Expected:    1. core-image-minimal can be build with IMAGE_GEN_DEBUGFS variable set
+                     2. debug filesystem is created when variable set
+                     3. debug symbols available
+        Product:     oe-core
+        Author:      Humberto Ibarra <humberto.ibarra.lopez@intel.com>
+                     Yeoh Ee Peng <ee.peng.yeoh@intel.com>
+        """
+        import glob
+        image_name = 'core-image-minimal'
+        features = 'IMAGE_GEN_DEBUGFS = "1"\n'
+        features += 'IMAGE_FSTYPES_DEBUGFS = "tar.bz2"\n'
+        features += 'MACHINE = "genericx86-64"\n'
+        self.write_config(features)
+
+        bitbake(image_name)
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+        dbg_tar_file = os.path.join(deploy_dir_image, "*-dbg.rootfs.tar.bz2")
+        debug_files = glob.glob(dbg_tar_file)
+        self.assertNotEqual(len(debug_files), 0, 'debug filesystem not generated at %s' % dbg_tar_file)
+        result = runCmd('cd %s; tar xvf %s' % (deploy_dir_image, dbg_tar_file))
+        self.assertEqual(result.status, 0, msg='Failed to extract %s: %s' % (dbg_tar_file, result.output))
+        result = runCmd('find %s -name %s' % (deploy_dir_image, "udevadm"))
+        self.assertTrue("udevadm" in result.output, msg='Failed to find udevadm: %s' % result.output)
+        dbg_symbols_targets = result.output.splitlines()
+        self.assertTrue(dbg_symbols_targets, msg='Failed to split udevadm: %s' % dbg_symbols_targets)
+        for t in dbg_symbols_targets:
+            result = runCmd('objdump --syms %s | grep debug' % t)
+            self.assertTrue("debug" in result.output, msg='Failed to find debug symbol: %s' % result.output)
-- 
2.7.4

