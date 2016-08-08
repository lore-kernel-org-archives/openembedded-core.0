Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3076E771BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316023"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:22:57 -0700
Message-Id: <be21a90f8ea87877868745f3ff3392e93432f502.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 09/20] oeqa.selftest.layerappend: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:21 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/conf/layerappend.conf | 40 +++++++++++++
 meta/lib/oeqa/selftest/layerappend.py        | 88 +++++++++++++---------------
 2 files changed, 80 insertions(+), 48 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/layerappend.conf

diff --git a/meta/lib/oeqa/selftest/conf/layerappend.conf b/meta/lib/oeqa/selftest/conf/layerappend.conf
new file mode 100644
index 0000000..11d4520
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/layerappend.conf
@@ -0,0 +1,40 @@
+[LayerAppendTests]
+layerconf = """
+            # We have a conf and classes directory, append to BBPATH
+            BBPATH .= ":${LAYERDIR}"
+
+            # We have a recipes directory, add to BBFILES
+            BBFILES += "${LAYERDIR}/recipes*/*.bb ${LAYERDIR}/recipes*/*.bbappend"
+
+            BBFILE_COLLECTIONS += "meta-layerINT"
+            BBFILE_PATTERN_meta-layerINT := "^${LAYERDIR}/"
+            BBFILE_PRIORITY_meta-layerINT = "6"
+            """
+recipe = """
+            LICENSE="CLOSED"
+            INHIBIT_DEFAULT_DEPS = "1"
+
+            python do_build() {
+                bb.plain('Building ...')
+            }
+            addtask build
+            """
+append = """
+            FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+            SRC_URI_append = " file://appendtest.txt"
+
+            sysroot_stage_all_append() {
+                    install -m 644 ${WORKDIR}/appendtest.txt ${SYSROOT_DESTDIR}/
+            }
+
+        """
+append2 = """
+            FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+            SRC_URI_append += "file://appendtest.txt"
+            """
+layerappend = ''
+
+layer_appends_layername = layertest
+layer_appends_dirname = recipes-test
diff --git a/meta/lib/oeqa/selftest/layerappend.py b/meta/lib/oeqa/selftest/layerappend.py
index 4de5034..e005952 100644
--- a/meta/lib/oeqa/selftest/layerappend.py
+++ b/meta/lib/oeqa/selftest/layerappend.py
@@ -8,44 +8,22 @@ from oeqa.selftest.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 import oeqa.utils.ftools as ftools
 from oeqa.utils.decorators import testcase
+from oeqa.utils.readconfig import conffile
 
-class LayerAppendTests(oeSelfTest):
-    layerconf = """
-# We have a conf and classes directory, append to BBPATH
-BBPATH .= ":${LAYERDIR}"
-
-# We have a recipes directory, add to BBFILES
-BBFILES += "${LAYERDIR}/recipes*/*.bb ${LAYERDIR}/recipes*/*.bbappend"
-
-BBFILE_COLLECTIONS += "meta-layerINT"
-BBFILE_PATTERN_meta-layerINT := "^${LAYERDIR}/"
-BBFILE_PRIORITY_meta-layerINT = "6"
-"""
-    recipe = """
-LICENSE="CLOSED"
-INHIBIT_DEFAULT_DEPS = "1"
-
-python do_build() {
-    bb.plain('Building ...')
-}
-addtask build
-"""
-    append = """
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI_append = " file://appendtest.txt"
 
-sysroot_stage_all_append() {
-	install -m 644 ${WORKDIR}/appendtest.txt ${SYSROOT_DESTDIR}/
-}
-
-"""
+class LayerAppendTests(oeSelfTest):
 
-    append2 = """
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+        cls.layerconf = eval(cls.config.get('LayerAppendTests', 'layerconf'))
+        cls.recipe = eval(cls.config.get('LayerAppendTests', 'recipe'))
+        cls.append = eval(cls.config.get('LayerAppendTests', 'append'))
+        cls.append2 = eval(cls.config.get('LayerAppendTests', 'append2'))
+        cls.layerappend = eval(cls.config.get(
+                                        'LayerAppendTests', 'layerappend'))
 
-SRC_URI_append += "file://appendtest.txt"
-"""
     layerappend = ''
 
     def tearDownLocal(self):
@@ -54,46 +32,60 @@ SRC_URI_append += "file://appendtest.txt"
 
     @testcase(1196)
     def test_layer_appends(self):
+        layername = self.config.get(
+                  'LayerAppendTests', 'layer_appends_layername')
+        dirname = self.config.get(
+                'LayerAppendTests', 'layer_appends_dirname')
         corebase = get_bb_var("COREBASE")
         stagingdir = get_bb_var("STAGING_DIR_TARGET")
         for l in ["0", "1", "2"]:
-            layer = os.path.join(corebase, "meta-layertest" + l)
+            layer = os.path.join(corebase, "meta-%s" % layername + l)
             self.assertFalse(os.path.exists(layer))
             os.mkdir(layer)
             os.mkdir(layer + "/conf")
             with open(layer + "/conf/layer.conf", "w") as f:
                 f.write(self.layerconf.replace("INT", l))
-            os.mkdir(layer + "/recipes-test")
+            os.mkdir(layer + "/%s" % dirname)
             if l == "0":
-                with open(layer + "/recipes-test/layerappendtest.bb", "w") as f:
+                with open(layer +
+                          "/%s/layerappendtest.bb" % dirname, "w") as f:
                     f.write(self.recipe)
             elif l == "1":
-                with open(layer + "/recipes-test/layerappendtest.bbappend", "w") as f:
+                with open(layer +
+                          "/%s/layerappendtest.bbappend" % dirname, "w") as f:
                     f.write(self.append)
-                os.mkdir(layer + "/recipes-test/layerappendtest")
-                with open(layer + "/recipes-test/layerappendtest/appendtest.txt", "w") as f:
+                os.mkdir(layer + "/%s/layerappendtest" % dirname)
+                with open(layer +
+                          "/%s/layerappendtest/appendtest.txt" % dirname,
+                          "w") as f:
                     f.write("Layer 1 test")
             elif l == "2":
-                with open(layer + "/recipes-test/layerappendtest.bbappend", "w") as f:
+                with open(layer + "/%s/layerappendtest.bbappend" % dirname,
+                          "w") as f:
                     f.write(self.append2)
-                os.mkdir(layer + "/recipes-test/layerappendtest")
-                with open(layer + "/recipes-test/layerappendtest/appendtest.txt", "w") as f:
+                os.mkdir(layer + "/%s/layerappendtest" % dirname)
+                with open(layer +
+                          "/%s/layerappendtest/appendtest.txt" % dirname,
+                          "w") as f:
                     f.write("Layer 2 test")
             self.track_for_cleanup(layer)
 
-        self.layerappend = "BBLAYERS += \"{0}/meta-layertest0 {0}/meta-layertest1 {0}/meta-layertest2\"".format(corebase)
+        self.layerappend = "BBLAYERS += \"{0}/meta-%s0 {0}/meta-%s1 {0}/meta-\
+%s2\"".format(corebase) % (layername, layername, layername)
         ftools.append_file(self.builddir + "/conf/bblayers.conf", self.layerappend)
         bitbake("layerappendtest")
         data = ftools.read_file(stagingdir + "/appendtest.txt")
         self.assertEqual(data, "Layer 2 test")
-        os.remove(corebase + "/meta-layertest2/recipes-test/layerappendtest/appendtest.txt")
+        os.remove(corebase +
+                  "/meta-%s2/%s/layerappendtest/appendtest.txt"
+                  % (layername, dirname))
         bitbake("layerappendtest")
         data = ftools.read_file(stagingdir + "/appendtest.txt")
         self.assertEqual(data, "Layer 1 test")
-        with open(corebase + "/meta-layertest2/recipes-test/layerappendtest/appendtest.txt", "w") as f:
+        with open(corebase +
+                  "/meta-%s2/%s/layerappendtest/appendtest.txt"
+                  % (layername, dirname), "w") as f:
             f.write("Layer 2 test")
         bitbake("layerappendtest")
         data = ftools.read_file(stagingdir + "/appendtest.txt")
         self.assertEqual(data, "Layer 2 test")
-
-
-- 
1.8.3.1


