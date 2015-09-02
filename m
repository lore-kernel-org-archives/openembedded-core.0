Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3831C77026
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 02 Sep 2015 04:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="553762242"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2015 04:00:19 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 5ED276A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:27 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:03 +0300
Message-Id: <30dda8e4a5681c37cc2f14a0f696954d4ea5ddac.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 03/17] oe-selftest: wic: configure a build
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:19 -0000

Added MACHINE_FEATURES and IMAGE_FSTYPES variables to the build config
to ensure that bootimg and efi artifacts are built. This is needed to
build canned wic images that are using those artifacts.

Introduced class variable Wic.image_is_ready to avoid building image
more than once. It would be better to build image in setUpClass, which
is called only once, but add_config method can't be called in class method,
so we have to use this trick with class variable in setUp method.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 6bc4b60..817a820 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -39,12 +39,21 @@ class Wic(oeSelfTest):
 
     @classmethod
     def setUpClass(cls):
-        """Build wic runtime dependencies and images used in the tests."""
+        """Build wic runtime dependencies."""
         bitbake('syslinux syslinux-native parted-native gptfdisk-native '
-                'dosfstools-native mtools-native core-image-minimal')
+                'dosfstools-native mtools-native')
+        Wic.image_is_ready = False
 
     def setUp(self):
         """This code is executed before each test method."""
+        if not Wic.image_is_ready:
+            # build core-image-minimal with required features
+            features = 'IMAGE_FSTYPES += " hddimg"\nMACHINE_FEATURES_append = " efi"\n'
+            self.append_config(features)
+            bitbake('core-image-minimal')
+            # set this class variable to avoid buiding image many times
+            Wic.image_is_ready = True
+
         rmtree(self.resultdir, ignore_errors=True)
 
     def test01_help(self):
-- 
2.1.4


