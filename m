Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0FE516E82D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 16:13:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jan 2014 08:13:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,736,1384329600"; d="scan'208";a="472089080"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2014 08:13:14 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id 7E1156A4092;
	Tue, 28 Jan 2014 08:13:08 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2014 18:14:18 +0200
Message-Id: <1390925658-13014-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] oeqa/runtime: rpm: fix finding the test rpm file
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
X-List-Received-Date: Tue, 28 Jan 2014 16:13:15 -0000

Translate TUNE_PKGARCH to find the right file (this
used to work because tune for qemux86-64 used to be
x86_64 now it's core2-64)
Also, while using packagedata was nice, it's harder to make
the test exportable and runnable outside of the
build system. (where oe.packagedata isn't available)

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/rpm.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index 154cad5..084d22f 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -1,8 +1,8 @@
 import unittest
 import os
+import fnmatch
 from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
-import oe.packagedata
 
 def setUpModule():
     if not oeRuntimeTest.hasFeature("package-management"):
@@ -27,11 +27,12 @@ class RpmInstallRemoveTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        deploydir = os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), "rpm", oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True))
-        pkgdata = oe.packagedata.read_subpkgdata("rpm-doc", oeRuntimeTest.tc.d)
+        pkgarch = oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True).replace("-", "_")
+        rpmdir = os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), "rpm", pkgarch)
         # pick rpm-doc as a test file to get installed, because it's small and it will always be built for standard targets
-        testrpmfile = "rpm-doc-%s-%s.%s.rpm" % (pkgdata["PKGV"], pkgdata["PKGR"], oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True))
-        oeRuntimeTest.tc.target.copy_to(os.path.join(deploydir,testrpmfile), "/tmp/rpm-doc.rpm")
+        for f in fnmatch.filter(os.listdir(rpmdir), "rpm-doc-*.%s.rpm" % pkgarch):
+            testrpmfile = f
+        oeRuntimeTest.tc.target.copy_to(os.path.join(rpmdir,testrpmfile), "/tmp/rpm-doc.rpm")
 
     @skipUnlessPassed('test_rpm_help')
     def test_rpm_install(self):
-- 
1.8.5.3


