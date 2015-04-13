Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7F45773D38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 16:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3DG3sBA014737 for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 17:03:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7bfYbLoAO9yf
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 17:03:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3DG3g1T014724
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 17:03:54 +0100
Message-ID: <1428941022.6976.77.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Apr 2015 17:03:42 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa: Add test for layer append and FILESPATH tracking
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
X-List-Received-Date: Mon, 13 Apr 2015 16:03:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This test actually tests a spectrum of bitbake functionality. Three
layers are created, one containing a recipe, one with a bbappend adding
a file to the recipe and another which overwrites the file in another
bbappend.

The correct outcomes in building the recipe are tested, with the file
in the final layer added, removed and then re-added.

This tests bitbake's cache handling as well as restoration from
sstate which happens in the final test phase.

Based on a test case from:
[YOCTO #7019]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/layerappend.py b/meta/lib/oeqa/selftest/layerappend.py
new file mode 100644
index 0000000..79b6137
--- /dev/null
+++ b/meta/lib/oeqa/selftest/layerappend.py
@@ -0,0 +1,95 @@
+import unittest
+import os
+import logging
+import re
+
+from oeqa.selftest.base import oeSelfTest
+from oeqa.selftest.buildhistory import BuildhistoryBase
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+import oeqa.utils.ftools as ftools
+from oeqa.utils.decorators import testcase
+
+class LayerAppendTests(oeSelfTest):
+    layerconf = """
+# We have a conf and classes directory, append to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have a recipes directory, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes*/*.bb ${LAYERDIR}/recipes*/*.bbappend"
+
+BBFILE_COLLECTIONS += "meta-layerINT"
+BBFILE_PATTERN_meta-layerINT := "^${LAYERDIR}/"
+BBFILE_PRIORITY_meta-layerINT = "6"
+"""
+    recipe = """
+LICENSE="CLOSED"
+INHIBIT_DEFAULT_DEPS = "1"
+
+python do_build() {
+    bb.plain('Building ...')
+}
+addtask build
+"""
+    append = """
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append = " file://appendtest.txt"
+
+sysroot_stage_all_append() {
+	install -m 644 ${WORKDIR}/appendtest.txt ${SYSROOT_DESTDIR}/
+}
+
+"""
+
+    append2 = """
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append += "file://appendtest.txt"
+"""
+    layerappend = "BBLAYERS += \"COREBASE/meta-layertest0 COREBASE/meta-layertest1 COREBASE/meta-layertest2\""
+
+    def tearDownLocal(self):
+        ftools.remove_from_file(self.builddir + "/conf/bblayers.conf", self.layerappend.replace("COREBASE", self.builddir + "/.."))
+
+    def test_layer_appends(self):
+        corebase = get_bb_var("COREBASE")
+        stagingdir = get_bb_var("STAGING_DIR_TARGET")
+        for l in ["0", "1", "2"]:
+            layer = os.path.join(corebase, "meta-layertest" + l)
+            self.assertFalse(os.path.exists(layer))
+            os.mkdir(layer)
+            os.mkdir(layer + "/conf")
+            with open(layer + "/conf/layer.conf", "w") as f:
+                f.write(self.layerconf.replace("INT", l))
+            os.mkdir(layer + "/recipes-test")
+            if l == "0":
+                with open(layer + "/recipes-test/layerappendtest.bb", "w") as f:
+                    f.write(self.recipe)
+            elif l == "1":
+                with open(layer + "/recipes-test/layerappendtest.bbappend", "w") as f:
+                    f.write(self.append)
+                os.mkdir(layer + "/recipes-test/layerappendtest")
+                with open(layer + "/recipes-test/layerappendtest/appendtest.txt", "w") as f:
+                    f.write("Layer 1 test")
+            elif l == "2":
+                with open(layer + "/recipes-test/layerappendtest.bbappend", "w") as f:
+                    f.write(self.append2)
+                os.mkdir(layer + "/recipes-test/layerappendtest")
+                with open(layer + "/recipes-test/layerappendtest/appendtest.txt", "w") as f:
+                    f.write("Layer 2 test")
+            self.track_for_cleanup(layer)
+        ftools.append_file(self.builddir + "/conf/bblayers.conf", self.layerappend.replace("COREBASE", self.builddir + "/.."))
+        bitbake("layerappendtest")
+        data = ftools.read_file(stagingdir + "/appendtest.txt")
+        self.assertEqual(data, "Layer 2 test")
+        os.remove(corebase + "/meta-layertest2/recipes-test/layerappendtest/appendtest.txt")
+        bitbake("layerappendtest")
+        data = ftools.read_file(stagingdir + "/appendtest.txt")
+        self.assertEqual(data, "Layer 1 test")
+        with open(corebase + "/meta-layertest2/recipes-test/layerappendtest/appendtest.txt", "w") as f:
+            f.write("Layer 2 test")
+        bitbake("layerappendtest")
+        data = ftools.read_file(stagingdir + "/appendtest.txt")
+        self.assertEqual(data, "Layer 2 test")
+
+



