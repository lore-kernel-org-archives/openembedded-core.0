Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B9D2475A2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 09:54:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 23 Jun 2015 02:53:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,665,1427785200"; d="scan'208";a="732871097"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jun 2015 02:53:53 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 9B4F06A4083;
	Tue, 23 Jun 2015 02:53:14 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 12:53:02 +0300
Message-Id: <1435053182-8028-7-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435053182-8028-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 6/6] wic: oe-selftest: Test image compressing
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
X-List-Received-Date: Tue, 23 Jun 2015 09:54:12 -0000

Added 4 new testcases for 'wic --compress-with <compressor>' functionality.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 47b70fd..5385562 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -103,3 +103,33 @@ class Wic(oeSelfTest):
     def test11_help_kickstart(self):
         """Test wic help kickstart"""
         self.assertEqual(0, runCmd('wic help kickstart').status)
+
+    def test12_compress_gzip(self):
+        """Test compressing an image with gzip"""
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name core-image-minimal "
+                                   "-c gzip").status)
+        self.assertEqual(1, len(glob(self.resultdir + \
+                                         "directdisk-*.direct.gz")))
+
+    def test13_compress_gzip(self):
+        """Test compressing an image with bzip2"""
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name core-image-minimal "
+                                   "-c bzip2").status)
+        self.assertEqual(1, len(glob(self.resultdir + \
+                                         "directdisk-*.direct.bz2")))
+
+    def test14_compress_gzip(self):
+        """Test compressing an image with xz"""
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name core-image-minimal "
+                                   "-c xz").status)
+        self.assertEqual(1, len(glob(self.resultdir + \
+                                         "directdisk-*.direct.xz")))
+
+    def test15_wrong_compressor(self):
+        """Test how wic breaks if wrong compressor is provided"""
+        self.assertEqual(2, runCmd("wic create directdisk "
+                                   "--image-name core-image-minimal "
+                                   "-c wrong", ignore_status=True).status)
-- 
2.1.4


