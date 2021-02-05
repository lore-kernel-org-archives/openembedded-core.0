Received: from mga01.intel.com (mga01.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.8328.1612533566225247300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 05:59:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: yCPZinLjL/TOolJzUlkiFCnFk6M7GHn1JtNbdSEkSO5v2OcYRhFo4sIBuhPun72V07ruJdnwG9
 /RescXhOckVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="200439029"
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; 
   d="scan'208";a="200439029"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2021 05:59:20 -0800
IronPort-SDR: vbe/vmxyUSAnhEBobvnIfW+KMp/fqRn0uDpXzoDZQHpn0jc2d264kBV5w4x1RkCXJhRWFg+Lns
 e3B7srvaLpOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,155,1610438400"; 
   d="scan'208";a="360374577"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga006.jf.intel.com with ESMTP; 05 Feb 2021 05:59:18 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 3/3] wic/selftest: test_permissions also test bitbake image
Date: Fri,  5 Feb 2021 21:59:16 +0800
Message-Id: <20210205135916.55589-3-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210205135916.55589-1-chee.yang.lee@intel.com>
References: <20210205135916.55589-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

existing test case test_permissions use Wic command as standalone
tools to create wic image and check that wic image for permissions.

add extra steps to the test case to also check against image build
using bitbake do_image_wic.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 551ce73a90757ba43501fe5cf9ac84a7b77de549)
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index d4c0db8bda..0435aa29c9 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -516,6 +516,9 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
     def test_permissions(self):
         """Test permissions are respected"""
 
+        # prepare wicenv and rootfs
+        bitbake('core-image-minimal core-image-minimal-mtdutils -c do_rootfs_wicenv')
+
         oldpath = os.environ['PATH']
         os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
 
@@ -549,6 +552,19 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
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

