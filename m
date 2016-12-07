Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E511471B66
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 20:30:37 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2016 12:30:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="40172616"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2016 12:30:39 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 14:32:31 -0600
Message-Id: <14ffde8bf3b591b32a1d9a3db41277f2fdca9a5f.1481142664.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 26/32] classes/testsdk: Remove the need of TEST_LOG_DIR variable
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
X-List-Received-Date: Wed, 07 Dec 2016 20:30:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The TEST_LOG_DIR was used for store sdk_target_log this log
contains the output of the run of build commands now that information
could be found also on log.do_testsdk under WORKDIR.

The log will continue to store into SDK_DIR instead of TEST_LOG_DIR.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testsdk.bbclass               | 6 ------
 meta/lib/oeqa/sdk/cases/buildcvs.py        | 4 ++--
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 4 ++--
 meta/lib/oeqa/sdk/cases/buildiptables.py   | 4 ++--
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 959fb38..4c4df10 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -14,7 +14,6 @@
 #
 # where "<image-name>" is an image like core-image-sato.
 
-TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 TESTSDKLOCK = "${TMPDIR}/testsdk.lock"
 
 def run_test_context(CTestContext, d, testdir, tcname, pn, *args):
@@ -64,17 +63,12 @@ def testsdk_main(d):
     # sdk use network for download projects for build
     export_proxies(d)
 
-    test_log_dir = d.getVar("TEST_LOG_DIR", True)
-
-    bb.utils.mkdirhier(test_log_dir)
-
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
     if not os.path.exists(tcname):
         bb.fatal("The toolchain %s is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' ." % tcname)
 
     tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.testdata.json")
     test_data = json.load(open(tdname, "r"))
-    test_data['TEST_LOG_DIR'] = test_log_dir
 
     target_pkg_manifest = OESDKTestContextExecutor._load_manifest(
         d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"))
diff --git a/meta/lib/oeqa/sdk/cases/buildcvs.py b/meta/lib/oeqa/sdk/cases/buildcvs.py
index ee7fb73..6222a8e 100644
--- a/meta/lib/oeqa/sdk/cases/buildcvs.py
+++ b/meta/lib/oeqa/sdk/cases/buildcvs.py
@@ -2,7 +2,7 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
 class BuildCvsTest(OESDKTestCase):
-    td_vars = ['TEST_LOG_DIR', 'DATETIME']
+    td_vars = ['DATETIME']
 
     @classmethod
     def setUpClass(self):
@@ -10,7 +10,7 @@ class BuildCvsTest(OESDKTestCase):
 
         self.project = SDKBuildProject(self.tc.sdk_dir + "/cvs/", self.tc.sdk_env,
                         "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2",
-                        self.td['TEST_LOG_DIR'], self.td['DATETIME'], dl_dir=dl_dir)
+                        self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
 
     def test_cvs(self):
diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index d2c1189..bdc8b6a 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -4,7 +4,7 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
 class GalculatorTest(OESDKTestCase):
-    td_vars = ['TEST_LOG_DIR', 'DATETIME']
+    td_vars = ['DATETIME']
 
     @classmethod
     def setUpClass(self):
@@ -19,7 +19,7 @@ class GalculatorTest(OESDKTestCase):
             project = SDKBuildProject(self.tc.sdk_dir + "/galculator/",
                                       self.tc.sdk_env,
                                       "http://galculator.mnim.org/downloads/galculator-2.1.4.tar.bz2",
-                                      self.td['TEST_LOG_DIR'], self.td['DATETIME'], dl_dir=dl_dir)
+                                      self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
 
             project.download_archive()
 
diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py b/meta/lib/oeqa/sdk/cases/buildiptables.py
index a50fb5d..532b5de 100644
--- a/meta/lib/oeqa/sdk/cases/buildiptables.py
+++ b/meta/lib/oeqa/sdk/cases/buildiptables.py
@@ -2,7 +2,7 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
 class BuildIptablesTest(OESDKTestCase):
-    td_vars = ['TEST_LOG_DIR', 'DATETIME']
+    td_vars = ['DATETIME']
 
     @classmethod
     def setUpClass(self):
@@ -10,7 +10,7 @@ class BuildIptablesTest(OESDKTestCase):
 
         self.project = SDKBuildProject(self.tc.sdk_dir + "/iptables/", self.tc.sdk_env, 
                         "http://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2",
-                        self.td['TEST_LOG_DIR'], self.td['DATETIME'], dl_dir=dl_dir)
+                        self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
 
     def test_iptables(self):
-- 
2.1.4


