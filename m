Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0E52471C28
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:20:08 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 08 Dec 2016 08:19:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="40496579"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2016 08:19:02 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 10:20:57 -0600
Message-Id: <e851c1a36be018c7c9ad5e3d2e4099438e7a07ea.1481213961.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481213961.git.anibal.limon@linux.intel.com>
References: <cover.1481213961.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 29/30] oeqa/runtime: Fix TargetBuildProject instances
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
X-List-Received-Date: Thu, 08 Dec 2016 16:20:09 -0000
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


