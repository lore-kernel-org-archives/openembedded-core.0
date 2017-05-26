Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D5A857835E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:39:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:39:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887922"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:39:07 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:57 -0500
Message-Id: <d540f3ff1469a5e98a8654f322be11766face277.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 31/36] scripts/oe-selftest: Move {add, remove}_include files to case
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
X-List-Received-Date: Fri, 26 May 2017 20:39:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The oe-selftest creates include files to store custom configuration to
make specific tests, every class executes a different test and may be
uses custom configuration.

So move to case class in order to simplify oe-selftest script and later
implement later a build folder per class.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/case.py | 76 ++++++++++++++++++++++++++++++++++++------
 scripts/oe-selftest            | 54 ------------------------------
 2 files changed, 66 insertions(+), 64 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index 95a8769..ca95b7e 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -14,17 +14,17 @@ from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
 from oeqa.core.case import OETestCase
 
 class OESelftestTestCase(OETestCase):
+    builddir = os.environ.get("BUILDDIR") or ""
+    localconf_path = os.path.join(builddir, "conf/local.conf")
+    localconf_backup = os.path.join(builddir, "conf/local.bk")
+    testinc_path = os.path.join(builddir, "conf/selftest.inc")
+    local_bblayers_path = os.path.join(builddir, "conf/bblayers.conf")
+    local_bblayers_backup = os.path.join(builddir, "conf/bblayers.bk")
+    testinc_bblayers_path = os.path.join(builddir, "conf/bblayers.inc")
+    machineinc_path = os.path.join(builddir, "conf/machine.inc")
+    testlayer_path = get_test_layer()
+
     def __init__(self, methodName="runTest"):
-        self.builddir = os.environ.get("BUILDDIR")
-        self.localconf_path = os.path.join(self.builddir, "conf/local.conf")
-        self.localconf_backup = os.path.join(self.builddir, "conf/local.bk")
-        self.testinc_path = os.path.join(self.builddir, "conf/selftest.inc")
-        self.local_bblayers_path = os.path.join(self.builddir, "conf/bblayers.conf")
-        self.local_bblayers_backup = os.path.join(self.builddir,
-                                                  "conf/bblayers.bk")
-        self.testinc_bblayers_path = os.path.join(self.builddir, "conf/bblayers.inc")
-        self.machineinc_path = os.path.join(self.builddir, "conf/machine.inc")
-        self.testlayer_path = get_test_layer()
         self._extra_tear_down_commands = []
         self._track_for_cleanup = [
             self.testinc_path, self.testinc_bblayers_path,
@@ -33,6 +33,62 @@ class OESelftestTestCase(OETestCase):
 
         super(OESelftestTestCase, self).__init__(methodName)
 
+    @classmethod
+    def setUpClass(cls):
+        super(OESelftestTestCase, cls).setUpClass()
+        cls.add_include()
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.remove_include()
+        cls.remove_inc_files()
+        super(OESelftestTestCase, cls).tearDownClass()
+
+    @classmethod
+    def add_include(cls):
+        if "#include added by oe-selftest" \
+            not in ftools.read_file(os.path.join(cls.builddir, "conf/local.conf")):
+                cls.logger.info("Adding: \"include selftest.inc\" in %s" % os.path.join(cls.builddir, "conf/local.conf"))
+                ftools.append_file(os.path.join(cls.builddir, "conf/local.conf"), \
+                        "\n#include added by oe-selftest\ninclude machine.inc\ninclude selftest.inc")
+
+        if "#include added by oe-selftest" \
+            not in ftools.read_file(os.path.join(cls.builddir, "conf/bblayers.conf")):
+                cls.logger.info("Adding: \"include bblayers.inc\" in bblayers.conf")
+                ftools.append_file(os.path.join(cls.builddir, "conf/bblayers.conf"), \
+                        "\n#include added by oe-selftest\ninclude bblayers.inc")
+
+    @classmethod
+    def remove_include(cls):
+        if "#include added by oe-selftest.py" \
+            in ftools.read_file(os.path.join(cls.builddir, "conf/local.conf")):
+                cls.logger.info("Removing the include from local.conf")
+                ftools.remove_from_file(os.path.join(cls.builddir, "conf/local.conf"), \
+                        "\n#include added by oe-selftest.py\ninclude machine.inc\ninclude selftest.inc")
+
+        if "#include added by oe-selftest.py" \
+            in ftools.read_file(os.path.join(cls.builddir, "conf/bblayers.conf")):
+                cls.logger.info("Removing the include from bblayers.conf")
+                ftools.remove_from_file(os.path.join(cls.builddir, "conf/bblayers.conf"), \
+                        "\n#include added by oe-selftest.py\ninclude bblayers.inc")
+
+    @classmethod
+    def remove_inc_files(cls):
+        try:
+            os.remove(os.path.join(cls.builddir, "conf/selftest.inc"))
+            for root, _, files in os.walk(get_test_layer()):
+                for f in files:
+                    if f == 'test_recipe.inc':
+                        os.remove(os.path.join(root, f))
+        except OSError as e:
+            pass
+
+        for incl_file in ['conf/bblayers.inc', 'conf/machine.inc']:
+            try:
+                os.remove(os.path.join(cls.builddir, incl_file))
+            except:
+                pass
+
     def setUp(self):
         super(OESelftestTestCase, self).setUp()
         os.chdir(self.builddir)
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 52366b1..4909157 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -159,56 +159,6 @@ def preflight_check():
 
     return True
 
-def add_include():
-    global builddir
-    if "#include added by oe-selftest.py" \
-        not in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
-            log.info("Adding: \"include selftest.inc\" in local.conf")
-            ftools.append_file(os.path.join(builddir, "conf/local.conf"), \
-                    "\n#include added by oe-selftest.py\ninclude machine.inc\ninclude selftest.inc")
-
-    if "#include added by oe-selftest.py" \
-        not in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf")):
-            log.info("Adding: \"include bblayers.inc\" in bblayers.conf")
-            ftools.append_file(os.path.join(builddir, "conf/bblayers.conf"), \
-                    "\n#include added by oe-selftest.py\ninclude bblayers.inc")
-
-def remove_include():
-    global builddir
-    if builddir is None:
-        return
-    if "#include added by oe-selftest.py" \
-        in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
-            log.info("Removing the include from local.conf")
-            ftools.remove_from_file(os.path.join(builddir, "conf/local.conf"), \
-                    "\n#include added by oe-selftest.py\ninclude machine.inc\ninclude selftest.inc")
-
-    if "#include added by oe-selftest.py" \
-        in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf")):
-            log.info("Removing the include from bblayers.conf")
-            ftools.remove_from_file(os.path.join(builddir, "conf/bblayers.conf"), \
-                    "\n#include added by oe-selftest.py\ninclude bblayers.inc")
-
-def remove_inc_files():
-    global builddir
-    if builddir is None:
-        return
-    try:
-        os.remove(os.path.join(builddir, "conf/selftest.inc"))
-        for root, _, files in os.walk(get_test_layer()):
-            for f in files:
-                if f == 'test_recipe.inc':
-                    os.remove(os.path.join(root, f))
-    except OSError as e:
-        pass
-
-    for incl_file in ['conf/bblayers.inc', 'conf/machine.inc']:
-        try:
-            os.remove(os.path.join(builddir, incl_file))
-        except:
-            pass
-
-
 def get_tests_modules(include_hidden=False):
     modules_list = list()
     for modules_path in oeqa.selftest.__path__:
@@ -583,7 +533,6 @@ def main():
                 log.error("Failed to import %s" % test)
                 log.error(e)
                 return 1
-        add_include()
 
         if args.machine:
             # Custom machine sets only weak default values (??=) for MACHINE in machine.inc
@@ -808,7 +757,4 @@ if __name__ == "__main__":
         ret = 1
         import traceback
         traceback.print_exc()
-    finally:
-        remove_include()
-        remove_inc_files()
     sys.exit(ret)
-- 
2.1.4


