Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.427.1612398592470010227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 16:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: if8tA7Dsk8maD2hzkOK0tlEb4hVcpVqINUqit07OSMUrHtz4m1+yS0g+sNsEev+zL7usz0/DS+
 D1OrUGJ5crsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="160308489"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; 
   d="scan'208";a="160308489"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2021 16:29:47 -0800
IronPort-SDR: WaOIODKCp8hjg//S2ZwHbIxpG365nhTdF8wWAMU/PoaUtKvJ8xoR1eJuLEu5aellG1ajqO1/Gy
 xPdsmAKQhZrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; 
   d="scan'208";a="576087493"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga005.jf.intel.com with ESMTP; 03 Feb 2021 16:29:45 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic/selftest: test_permissions also test bitbake image
Date: Thu,  4 Feb 2021 08:29:44 +0800
Message-Id: <20210204002944.35596-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

existing test case test_permissions use Wic command as standalone
tools to create wic image and check that wic image for permissions.

add extra steps to the test case to also check against image build
using bitbake do_image_wic.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 091f0ab47c6..03a3ac565cb 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -588,6 +588,9 @@ part / --source rootfs  --fstype=ext4 --include-path %s --include-path core-imag
     def test_permissions(self):
         """Test permissions are respected"""
 
+        # prepare wicenv and rootfs
+        bitbake('core-image-minimal core-image-minimal-mtdutils -c do_rootfs_wicenv')
+
         oldpath = os.environ['PATH']
         os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
 
@@ -621,6 +624,19 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                     res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part))
                     self.assertEqual(True, files_own_by_root(res.output))
 
+                config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "%s"\n' % wks_file
+                self.append_config(config)
+                bitbake('core-image-minimal')
+                tmpdir = os.path.join(get_bb_var('WORKDIR', 'core-image-minimal'),'build-wic')
+
+                # check each partition for permission
+                for part in glob(os.path.join(tmpdir, 'temp-*.direct.p*')):
+                    res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part))
+                    self.assertTrue(files_own_by_root(res.output)
+                        ,msg='Files permission incorrect using wks set "%s"' % test)
+
+                # clean config and result directory for next cases
+                self.remove_config(config)
                 rmtree(self.resultdir, ignore_errors=True)
 
         finally:
-- 
2.17.1

