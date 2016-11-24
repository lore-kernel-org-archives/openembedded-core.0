Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD0471B66
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 20:52:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 24 Nov 2016 12:52:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="1063828223"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2016 12:52:55 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 14:58:12 -0600
Message-Id: <9435412aeba509b6474dcbff0dcace9dbb245e4b.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 12/13] selftest: wic: skip tests for poky-tiny distro policy
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
X-List-Received-Date: Thu, 24 Nov 2016 20:52:54 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Poky-tiny just supports cpio.gz as filesystem type so wic tests must
be skipped.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index faac11e..b5e5840 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -190,6 +190,8 @@ class Wic(oeSelfTest):
     @testcase(1346)
     def test_iso_image(self):
         """Test creation of hybrid iso image with legacy and EFI boot"""
+        if self.distro == 'poky-tiny':
+            self.skipTest('wic image (mkhybridiso) not supported for poky-tiny distro')
         self.assertEqual(0, runCmd("wic create mkhybridiso "
                                    "--image-name core-image-minimal").status)
         self.assertEqual(1, len(glob(self.resultdir + "HYBRID_ISO_IMG-*.direct")))
@@ -246,6 +248,9 @@ class Wic(oeSelfTest):
     def test_mkgummidisk(self):
         """Test creation of mkgummidisk image"""
         image = "mkgummidisk"
+        if self.distro == 'poky-tiny':
+            self.skipTest('wic image name (%s) not supported for poky-tiny distro' % image)
+
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
@@ -254,6 +259,8 @@ class Wic(oeSelfTest):
     def test_mkefidisk(self):
         """Test creation of mkefidisk image"""
         image = "mkefidisk"
+        if self.distro == 'poky-tiny':
+            self.skipTest('wic image (%s) not supported for poky-tiny distro' % image)
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
@@ -288,6 +295,8 @@ class Wic(oeSelfTest):
     def test_systemd_bootdisk(self):
         """Test creation of systemd-bootdisk image"""
         image = "systemd-bootdisk"
+        if self.distro == 'poky-tiny':
+            self.skipTest('wic image (%s) not supported for poky-tiny distro' % image)
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
-- 
2.1.4


