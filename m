Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D0C53719FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 16:36:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 14 Oct 2016 09:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,493,1473145200"; d="scan'208";a="19705484"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.48])
	by orsmga005.jf.intel.com with ESMTP; 14 Oct 2016 09:36:33 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 11:40:29 -0500
Message-Id: <5458be631bd0e452a6b05b09e9b86d6fbf567eeb.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 4/9] selftest: skip some devtool tests when distro is poky-tiny due to missing libx11
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
X-List-Received-Date: Fri, 14 Oct 2016 16:36:31 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

When distro is poky-tiny, there is no recipe providing libx11, thus skip relevant
tests.

[YOCTO #8525]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index e992dcf..aac5087 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -337,7 +337,8 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1161)
     def test_devtool_add_fetch_git(self):
-        # Fetch source
+        if self.distro == 'poky-tiny':
+            self.skipTest('libmatchbox2 is not buildable with poky-tiny because it requires a libx11 provider')
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         url = 'git://git.yoctoproject.org/libmatchbox'
@@ -577,6 +578,8 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1378)
     def test_devtool_modify_virtual(self):
+        if self.distro == 'poky-tiny':
+            self.skipTest('Test not possible with poky-tiny because it requires a libx11 provider')
         # Try modifying a virtual recipe
         virtrecipe = 'virtual/libx11'
         realrecipe = 'libx11'
@@ -941,6 +944,8 @@ class DevtoolTests(DevtoolBase):
 
     @testcase(1379)
     def test_devtool_extract_virtual(self):
+        if self.distro == 'poky-tiny':
+            self.skipTest('Test not possible with poky-tiny because it requires a libx11 provider')
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
         self.track_for_cleanup(tempdir)
-- 
2.1.4


