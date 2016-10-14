Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E053871ACA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 16:36:34 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 14 Oct 2016 09:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,493,1473145200"; d="scan'208";a="19705491"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.48])
	by orsmga005.jf.intel.com with ESMTP; 14 Oct 2016 09:36:36 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 11:40:34 -0500
Message-Id: <537786131095aea9f7fb25338d6b4f776c04a37d.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 9/9] selftest: skip wic test methods for poky-tiny distro
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
X-List-Received-Date: Fri, 14 Oct 2016 16:36:35 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The poky-tiny distro does not supported the intended images to be created with
wic, so skp these tests.

[YOCTO #8525]

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


