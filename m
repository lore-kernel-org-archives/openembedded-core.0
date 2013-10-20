Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE656D1C4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2013 17:15:12 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 20 Oct 2013 10:15:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,534,1378882800"; d="scan'208";a="310274189"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 20 Oct 2013 10:15:13 -0700
Received: from localhost.localdomain (unknown [10.237.112.121])
	by linux.intel.com (Postfix) with ESMTP id 1B61E6A4007;
	Sun, 20 Oct 2013 10:15:09 -0700 (PDT)
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Oct 2013 20:17:16 +0300
Message-Id: <1382289436-5818-1-git-send-email-alexandrux.palalau@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Cc: Alexandru Palalau <alexandrux.palalau@intel.com>
Subject: [PATCH] lib/oeqa/runtime: added rpm dependency test
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
X-List-Received-Date: Sun, 20 Oct 2013 17:15:12 -0000

From: Alexandru Palalau <alexandrux.palalau@intel.com>

Signed-off-by: Alexandru Palalau <alexandrux.palalau@intel.com>
---
 meta/lib/oeqa/runtime/rpm.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime/rpm.py
index 154cad5..7b48e4c 100644
--- a/meta/lib/oeqa/runtime/rpm.py
+++ b/meta/lib/oeqa/runtime/rpm.py
@@ -29,15 +29,25 @@ class RpmInstallRemoveTest(oeRuntimeTest):
     def setUpClass(self):
         deploydir = os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), "rpm", oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True))
         pkgdata = oe.packagedata.read_subpkgdata("rpm-doc", oeRuntimeTest.tc.d)
+        pkgdata2 = oe.packagedata.read_subpkgdata("psplash-default", oeRuntimeTest.tc.d)
         # pick rpm-doc as a test file to get installed, because it's small and it will always be built for standard targets
         testrpmfile = "rpm-doc-%s-%s.%s.rpm" % (pkgdata["PKGV"], pkgdata["PKGR"], oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True))
+        testpsplashfile = "psplash-default-%s-%s.%s.rpm" % (pkgdata2["PKGV"], pkgdata2["PKGR"], oeRuntimeTest.tc.d.getVar('TUNE_PKGARCH', True))
         oeRuntimeTest.tc.target.copy_to(os.path.join(deploydir,testrpmfile), "/tmp/rpm-doc.rpm")
+        oeRuntimeTest.tc.target.copy_to(os.path.join(deploydir,testpsplashfile), "/tmp/psplash-default.rpm")
 
     @skipUnlessPassed('test_rpm_help')
     def test_rpm_install(self):
         (status, output) = self.target.run('rpm -ivh /tmp/rpm-doc.rpm')
         self.assertEqual(status, 0, msg="Failed to install rpm-doc package: %s" % output)
 
+    @skipUnlessPassed('test_rpm_help')
+    def test_rpm_install_dependency(self):
+        (status, output) = self.target.run('rpm -e psplash psplash-default')
+        self.assertEqual(status, 0, msg="Failed to remove psplash and psplash-default packages. Output: %s" % output)
+        (status, output) = self.target.run('rpm -ivh /tmp/psplash-default.rpm')
+        self.assertEqual(status, 1, msg="Fail in using rpm install dependency command. Output: %s" % output)
+
     @skipUnlessPassed('test_rpm_install')
     def test_rpm_remove(self):
         (status,output) = self.target.run('rpm -e rpm-doc')
-- 
1.8.1.4


