Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 08DE76B115
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 18:04:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2013 11:04:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,943,1367996400"; d="scan'208";a="392339209"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2013 11:04:37 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id EFEF02C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:04:34 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 21:04:20 +0300
Message-Id: <50303033228134ee1bb9e40f65f634180a7862eb.1377280794.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1377280794.git.stefanx.stanacar@intel.com>
References: <cover.1377280794.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 10/19] lib/oeqa/runtime: rpm: add install and erase tests
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
X-List-Received-Date: Fri, 23 Aug 2013 18:04:36 -0000

Copies to target rpm-doc file from deploy_dir
and tries to install and then remove that package.
rpm-doc was chosen because it's small, it only adds
a few files to target, and it's almost always found in
deploy_dir for images with package-management/rpm.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/rpm.py | 30 +++++++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index 57101b0..154cad5 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -1,6 +1,8 @@
 import unittest
+import os
 from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
+import oe.packagedata
 
 def setUpModule():
     if not oeRuntimeTest.hasFeature("package-management"):
@@ -9,17 +11,39 @@ def setUpModule():
             skipModule("rpm module skipped: target doesn't have rpm as primary package manager")
 
 
-class RpmHelpTest(oeRuntimeTest):
+class RpmBasicTest(oeRuntimeTest):
 
     @skipUnlessPassed('test_ssh')
     def test_rpm_help(self):
         (status, output) = self.target.run('rpm --help')
         self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
 
-class RpmQueryTest(oeRuntimeTest):
-
     @skipUnlessPassed('test_rpm_help')
     def test_rpm_query(self):
         (status, output) = self.target.run('rpm -q rpm')
         self.assertEqual(status, 0, msg="status and output: %s and %s" % (status,output))
 
+class RpmInstallRemoveTest(oeRuntimeTest):
+
+    @classmethod
+    def setUpClass(self):
+        deploydir = os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), "rpm", oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True))
+        pkgdata = oe.packagedata.read_subpkgdata("rpm-doc", oeRuntimeTest.tc.d)
+        # pick rpm-doc as a test file to get installed, because it's small and it will always be built for standard targets
+        testrpmfile = "rpm-doc-%s-%s.%s.rpm" % (pkgdata["PKGV"], pkgdata["PKGR"], oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True))
+        oeRuntimeTest.tc.target.copy_to(os.path.join(deploydir,testrpmfile), "/tmp/rpm-doc.rpm")
+
+    @skipUnlessPassed('test_rpm_help')
+    def test_rpm_install(self):
+        (status, output) = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
+        self.assertEqual(status, 0, msg="Failed to install rpm-doc package: %s" % output)
+
+    @skipUnlessPassed('test_rpm_install')
+    def test_rpm_remove(self):
+        (status,output) = self.target.run('rpm -e rpm-doc')
+        self.assertEqual(status, 0, msg="Failed to remove rpm-doc package: %s" % output)
+
+    @classmethod
+    def tearDownClass(self):
+        oeRuntimeTest.tc.target.run('rm -f /tmp/rpm-doc.rpm')
+
-- 
1.8.3.1


