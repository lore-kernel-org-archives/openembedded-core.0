Return-Path: <brian.avery@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 315BF77AB1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489849602; x=1521385602;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=gx1jj4kibbIYU1JBZiCAStsy02hH5n12suq7qAsYxJg=;
	b=GPz9sPxkTMesnG87qexcE7TaCZG2hFfbJBU9uloGbUl4Tr72vocY9Seo
	wVceoK1oBMg1MqQ6572f9Pvl2c0vzA==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Mar 2017 08:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,183,1486454400"; d="scan'208";a="68622909"
Received: from bavery-ws-desk.jf.intel.com ([10.7.198.85])
	by orsmga004.jf.intel.com with ESMTP; 18 Mar 2017 08:06:41 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Mar 2017 08:08:47 -0700
Message-Id: <5f5b2171e84c1ea32c45315e9af80e2ee9642c62.1489849643.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1489849643.git.brian.avery@intel.com>
References: <cover.1489849643.git.brian.avery@intel.com>
Subject: [PATCH 1/2] meta/lib/oeqa: change sdk test from cvs to cpio
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
X-List-Received-Date: Sat, 18 Mar 2017 15:06:40 -0000

We currently fetch,configure,build, and install cvs as our test for the
sdk.  cvs unfortunately, requires a default editor in order to run.  The
change in 94790a8254d6 that checks to see if you have something like vi
installed is fragile since you may have a different default editor. This
patch switches from using cvs as a test to using cpio. cpio also uses
autotools so the functionality tested is equivalent.

Signed-off-by: brian avery <brian.avery@intel.com>
---
 meta/classes/testimage.bbclass                            | 6 +++---
 meta/lib/oeqa/runtime/cases/{buildcvs.py => buildcpio.py} | 8 ++++----
 meta/lib/oeqa/sdk/cases/{buildcvs.py => buildcpio.py}     | 8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/lib/oeqa/runtime/cases/{buildcvs.py => buildcpio.py} (83%)
 rename meta/lib/oeqa/sdk/cases/{buildcvs.py => buildcpio.py} (80%)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 173d974..bfe5714 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -49,10 +49,10 @@ DEFAULT_TEST_SUITES_pn-core-image-x11 = "${MINTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-lsb = "${NETTESTSUITE} pam parselogs ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-core-image-sato = "${NETTESTSUITE} connman xorg parselogs ${RPMTESTSUITE} \
     ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
-DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcvs buildiptables buildgalculator \
+DEFAULT_TEST_SUITES_pn-core-image-sato-sdk = "${NETTESTSUITE} buildcpio buildiptables buildgalculator \
     connman ${DEVTESTSUITE} logrotate perl parselogs python ${RPMTESTSUITE} xorg"
 DEFAULT_TEST_SUITES_pn-core-image-lsb-dev = "${NETTESTSUITE} pam perl python parselogs ${RPMTESTSUITE}"
-DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcvs buildiptables buildgalculator \
+DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk = "${NETTESTSUITE} buildcpio buildiptables buildgalculator \
     connman ${DEVTESTSUITE} logrotate pam parselogs perl python ${RPMTESTSUITE}"
 DEFAULT_TEST_SUITES_pn-meta-toolchain = "auto"
 
@@ -61,7 +61,7 @@ DEFAULT_TEST_SUITES_remove_aarch64 = "xorg"
 
 # qemumips is quite slow and has reached the timeout limit several times on the YP build cluster,
 # mitigate this by removing build tests for qemumips machines.
-MIPSREMOVE ??= "buildcvs buildiptables buildgalculator"
+MIPSREMOVE ??= "buildcpio buildiptables buildgalculator"
 DEFAULT_TEST_SUITES_remove_qemumips = "${MIPSREMOVE}"
 DEFAULT_TEST_SUITES_remove_qemumips64 = "${MIPSREMOVE}"
 
diff --git a/meta/lib/oeqa/runtime/cases/buildcvs.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
similarity index 83%
rename from meta/lib/oeqa/runtime/cases/buildcvs.py
rename to meta/lib/oeqa/runtime/cases/buildcpio.py
index c3f3acc..59edc9c 100644
--- a/meta/lib/oeqa/runtime/cases/buildcvs.py
+++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
@@ -5,12 +5,12 @@ from oeqa.core.decorator.data import skipIfNotFeature
 
 from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
 
-class BuildCvsTest(OERuntimeTestCase):
+class BuildCpioTest(OERuntimeTestCase):
 
     @classmethod
     def setUpClass(cls):
-        uri = 'http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13'
-        uri = '%s/cvs-1.12.13.tar.bz2' % uri
+        uri = 'https://ftp.gnu.org/gnu/cpio'
+        uri = '%s/cpio-2.12.tar.bz2' % uri
         cls.project = TargetBuildProject(cls.tc.target,
                                          uri,
                                          dl_dir = cls.tc.td['DL_DIR'])
@@ -24,7 +24,7 @@ class BuildCvsTest(OERuntimeTestCase):
     @skipIfNotFeature('tools-sdk',
                       'Test requires tools-sdk to be in IMAGE_FEATURES')
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    def test_cvs(self):
+    def test_cpio(self):
         self.project.run_configure()
         self.project.run_make()
         self.project.run_install()
diff --git a/meta/lib/oeqa/sdk/cases/buildcvs.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
similarity index 80%
rename from meta/lib/oeqa/sdk/cases/buildcvs.py
rename to meta/lib/oeqa/sdk/cases/buildcpio.py
index 8cbbca1..11d629a 100644
--- a/meta/lib/oeqa/sdk/cases/buildcvs.py
+++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
@@ -2,15 +2,15 @@ import unittest
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
-class BuildCvsTest(OESDKTestCase):
+class BuildCpioTest(OESDKTestCase):
     td_vars = ['DATETIME']
 
     @classmethod
     def setUpClass(self):
         dl_dir = self.td.get('DL_DIR', None)
 
-        self.project = SDKBuildProject(self.tc.sdk_dir + "/cvs/", self.tc.sdk_env,
-                        "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2",
+        self.project = SDKBuildProject(self.tc.sdk_dir + "/cpio/", self.tc.sdk_env,
+                        "https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.bz2",
                         self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
 
@@ -18,7 +18,7 @@ class BuildCvsTest(OESDKTestCase):
         if not self.tc.hasHostPackage("packagegroup-cross-canadian-%s" % machine):
             raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
 
-    def test_cvs(self):
+    def test_cpio(self):
         self.assertEqual(self.project.run_configure(), 0,
                         msg="Running configure failed")
 
-- 
1.9.1


