Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.663.1585719474688906838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 22:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: ee.peng.yeoh@intel.com)
IronPort-SDR: tW6FyuVL7dwUS8EQfbNPuCKvIvh7QcMNqSjP2ZK7tYA5K+tgxA9QhKZvPf7qGZVjB7SHJBSNqD
 ww2qCcWnsNxw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 22:37:54 -0700
IronPort-SDR: l+Pwak1WQd76EN5ul5blIiiOiV2dKyWtpVqnNYkbO9IDwwe5q91ZcDrENP+NHmBaySRFLbYim1
 gwv5/Zaq7aww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,330,1580803200"; 
   d="scan'208";a="395831654"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga004.jf.intel.com with ESMTP; 31 Mar 2020 22:37:53 -0700
From: "Yeoh Ee Peng" <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Subject: [PATCH] selftest/imagefeatures: Enable sanity test for IMAGE_GEN_DEBUGFS
Date: Wed,  1 Apr 2020 13:37:50 +0800
Message-Id: <1585719470-55818-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4

Add new testcase to check IMAGE_GEN_DEBUGFS. Test makes
sure that debug filesystem is created accordingly. Test also check
for debug symbols for some packages as suggested by Ross Burton.

[YOCTO #10906]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 5c519ac..9ad5c17 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -262,3 +262,36 @@ PNBLACKLIST[busybox] = "Don't build this"
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
+        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
+
+        features = 'IMAGE_GEN_DEBUGFS = "1"\n'
+        features += 'IMAGE_FSTYPES_DEBUGFS = "tar.bz2"\n'
+        features += 'MACHINE = "genericx86-64"\n'
+        self.write_config(features)
+
+        bitbake(image_name)
+        dbg_tar_file = os.path.join(deploy_dir_image, "*-dbg.rootfs.tar.bz2")
+        debug_files = glob.glob(dbg_tar_file)
+        self.assertNotEqual(len(debug_files), 0, 'debug filesystem not generated')
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

