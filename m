Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E3F1A71AE4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:51:36 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 06 Dec 2016 13:51:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="39533349"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by orsmga005.jf.intel.com with ESMTP; 06 Dec 2016 13:51:38 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 15:44:16 -0600
Message-Id: <88b2980802ee6c4da7e2734d2586cc3cc758fb69.1481059445.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 31/32] oeqa/runtime: Fix TargetBuildProject instances
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
X-List-Received-Date: Tue, 06 Dec 2016 21:51:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

TargetBuildProject was refactored to avoid bitbake dependency so
the instance don't allow to pass data store anymore.

classes/testimage: Export proxies before run tests

The TargetBuildProject based tests download archives from network.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testimage.bbclass           | 4 ++++
 meta/lib/oeqa/runtime/buildcvs.py        | 9 +++++----
 meta/lib/oeqa/runtime/buildgalculator.py | 8 +++++---
 meta/lib/oeqa/runtime/buildiptables.py   | 8 +++++---
 4 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 6b6781d..89ed003 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -129,11 +129,15 @@ def testimage_main(d):
     from oeqa.oetest import ImageTestContext
     from oeqa.targetcontrol import get_target_controller
     from oeqa.utils.dump import get_host_dumper
+    from bb.utils import export_proxies
 
     pn = d.getVar("PN", True)
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR", True))
     test_create_extract_dirs(d)
 
+    # runtime use network for download projects for build
+    export_proxies(d)
+
     # we need the host dumper in test context
     host_dumper = get_host_dumper(d)
 
diff --git a/meta/lib/oeqa/runtime/buildcvs.py b/meta/lib/oeqa/runtime/buildcvs.py
index fe6cbfb..a5ca3a5 100644
--- a/meta/lib/oeqa/runtime/buildcvs.py
+++ b/meta/lib/oeqa/runtime/buildcvs.py
@@ -1,6 +1,6 @@
 from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
-from oeqa.utils.targetbuild import TargetBuildProject
+from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
 
 def setUpModule():
     if not oeRuntimeTest.hasFeature("tools-sdk"):
@@ -10,9 +10,10 @@ class BuildCvsTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        self.project = TargetBuildProject(oeRuntimeTest.tc.target, oeRuntimeTest.tc.d,
-                        "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2")
-        self.project.download_archive()
+        dl_dir = oeRuntimeTest.tc.d.getVar('DL_DIR', True)
+        self.project = TargetBuildProject(oeRuntimeTest.tc.target,
+                        "http://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2",
+                        dl_dir=dl_dir)
 
     @testcase(205)
     @skipUnlessPassed("test_ssh")
diff --git a/meta/lib/oeqa/runtime/buildgalculator.py b/meta/lib/oeqa/runtime/buildgalculator.py
index 220101d..20f0a79 100644
--- a/meta/lib/oeqa/runtime/buildgalculator.py
+++ b/meta/lib/oeqa/runtime/buildgalculator.py
@@ -1,6 +1,6 @@
 from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
-from oeqa.utils.targetbuild import TargetBuildProject
+from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
 
 def setUpModule():
     if not oeRuntimeTest.hasFeature("tools-sdk"):
@@ -10,9 +10,11 @@ class GalculatorTest(oeRuntimeTest):
     @testcase(1526)
     @skipUnlessPassed("test_ssh")
     def test_galculator(self):
+        dl_dir = oeRuntimeTest.tc.d.getVar('DL_DIR', True)
         try:
-            project = TargetBuildProject(oeRuntimeTest.tc.target, oeRuntimeTest.tc.d,
-                                      "http://galculator.mnim.org/downloads/galculator-2.1.4.tar.bz2")
+            project = TargetBuildProject(oeRuntimeTest.tc.target,
+                                      "http://galculator.mnim.org/downloads/galculator-2.1.4.tar.bz2",
+                                      dl_dir=dl_dir)
             project.download_archive()
 
             self.assertEqual(project.run_configure(), 0,
diff --git a/meta/lib/oeqa/runtime/buildiptables.py b/meta/lib/oeqa/runtime/buildiptables.py
index bc75d0a..a0e82f0 100644
--- a/meta/lib/oeqa/runtime/buildiptables.py
+++ b/meta/lib/oeqa/runtime/buildiptables.py
@@ -1,6 +1,6 @@
 from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
-from oeqa.utils.targetbuild import TargetBuildProject
+from oeqa.runtime.utils.targetbuildproject import TargetBuildProject
 
 def setUpModule():
     if not oeRuntimeTest.hasFeature("tools-sdk"):
@@ -10,8 +10,10 @@ class BuildIptablesTest(oeRuntimeTest):
 
     @classmethod
     def setUpClass(self):
-        self.project = TargetBuildProject(oeRuntimeTest.tc.target, oeRuntimeTest.tc.d,
-                        "http://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2")
+        dl_dir = oeRuntimeTest.tc.d.getVar('DL_DIR', True)
+        self.project = TargetBuildProject(oeRuntimeTest.tc.target,
+                        "http://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2",
+                        dl_dir=dl_dir)
         self.project.download_archive()
 
     @testcase(206)
-- 
2.1.4


