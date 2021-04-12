Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: R9pwQYCkNMNXTqN9ghVrqIiGgpb75n8WP6+Cwzq9D8nEH7iZNbgKGM7RD+z10SYSoG8p/ruwKs
 HEa5Uk5ww26w==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467926"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467926"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:50 -0700
IronPort-SDR: Kg8S1cVgNd0f5UpBBQaDFiqL1P2qf/e/iPsrokFS/n+D5cUpN/zQY/aTfgdd5J/WjJPJe1Ocfb
 sgQiLFbq/Buw==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809110"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:49 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/18] selftest/wic: Fix dependency issue in rawcopy test
Date: Mon, 12 Apr 2021 17:08:19 +0800
Message-Id: <e444836c5a5c07647ee860e0eea281144bd0595f.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The current test code contains a subtle race. It is building an ext4,
then trying to reuse that image in a wic build for the same recipe.
Whilst this happened to work, the code is within its rights to clean
up the output before the wic code runs.

Avoid this by using separate image targets instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 590398080e81fb5e2f81e12b8900858837dfe25f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index df2d2d225e..39c6828f59 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -979,14 +979,18 @@ class Wic2(WicTestCase):
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_rawcopy_plugin_qemu(self):
         """Test rawcopy plugin in qemu"""
-        # build ext4 and wic images
-        for fstype in ("ext4", "wic"):
-            config = 'IMAGE_FSTYPES = "%s"\nWKS_FILE = "test_rawcopy_plugin.wks.in"\n' % fstype
-            self.append_config(config)
-            self.assertEqual(0, bitbake('core-image-minimal').status)
-            self.remove_config(config)
+        # build ext4 and then use it for a wic image
+        config = 'IMAGE_FSTYPES = "ext4"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal').status)
+        self.remove_config(config)
 
-        with runqemu('core-image-minimal', ssh=False, image_fstype='wic') as qemu:
+        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_rawcopy_plugin.wks.in"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal-mtdutils').status)
+        self.remove_config(config)
+
+        with runqemu('core-image-minimal-mtdutils', ssh=False, image_fstype='wic') as qemu:
             cmd = "grep sda. /proc/partitions  |wc -l"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-- 
2.30.2

