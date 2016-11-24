Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 126B1607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 21:54:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 24 Nov 2016 13:54:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="1063841261"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2016 13:54:48 -0800
Received: from fjpedraz-MOBL3.zpn.intel.com (fjpedraz-mobl3.zpn.intel.com
	[10.219.5.153])
	by linux.intel.com (Postfix) with ESMTP id B0BE36A4080;
	Thu, 24 Nov 2016 13:54:06 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 15:54:53 -0600
Message-Id: <1480024493-14009-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 2.5.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH v2] selftest: Test needed to verify postinst order
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
X-List-Received-Date: Thu, 24 Nov 2016 21:54:49 -0000

It verifies the following:

1. Compile a minimal image.
2. The compiled image will add the layer with the recipe postinst,
previously created at:
"meta-selftest/recipes-test"
3. Run QEMU.
4. Validate the task execution order.
[YOCTO #5319]

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 .../recipes-test/postinst/postinst_1.0.bb          | 124 +++++++++++++++++++++
 meta/lib/oeqa/selftest/runtime-test.py             |  52 +++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 meta-selftest/recipes-test/postinst/postinst_1.0.bb

diff --git a/meta-selftest/recipes-test/postinst/postinst_1.0.bb b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
new file mode 100644
index 0000000..97a1987
--- /dev/null
+++ b/meta-selftest/recipes-test/postinst/postinst_1.0.bb
@@ -0,0 +1,124 @@
+LICENSE = "MIT"
+ALLOW_EMPTY_${PN}-at-rootfs = "1"
+ALLOW_EMPTY_${PN}-delayed-a = "1"
+ALLOW_EMPTY_${PN}-delayed-b = "1"
+ALLOW_EMPTY_${PN}-delayed-d = "1"
+ALLOW_EMPTY_${PN}-delayed-p = "1"
+ALLOW_EMPTY_${PN}-delayed-t = "1"
+
+PACKAGES += "${PN}-at-rootfs ${PN}-delayed-a ${PN}-delayed-b ${PN}-delayed-d ${PN}-delayed-p ${PN}-delayed-t"
+PROVIDES += "${PN}-at-rootfs ${PN}-delayed-a ${PN}-delayed-b ${PN}-delayed-d ${PN}-delayed-p ${PN}-delayed-t"
+FILES_${PN}-delayed-a = ""
+FILES_${PN}-delayed-b = ""
+FILES_${PN}-delayed-d = ""
+FILES_${PN}-delayed-p = ""
+FILES_${PN}-delayed-t = ""
+
+# Runtime dependencies
+RDEPENDS_${PN}-delayed-a = "${PN}-at-rootfs"
+RDEPENDS_${PN}-delayed-b = "${PN}-delayed-a"
+RDEPENDS_${PN}-delayed-d = "${PN}-delayed-b"
+RDEPENDS_${PN}-delayed-p = "${PN}-delayed-d"
+RDEPENDS_${PN}-delayed-t = "${PN}-delayed-p"
+
+# Main recipe post-install
+pkg_postinst_${PN}-at-rootfs () {
+    tfile="/etc/postinsta-test"
+    if test "x$D" != "x" then
+        # Need to run on first boot
+        exit 1
+    else
+        echo "lets write postinst" > $tfile
+    fi
+}
+
+# Dependency recipes post-installs
+pkg_postinst_${PN}-delayed-a () {
+    efile="/etc/postinst-test"
+    tfile="/etc/postinsta-test"
+    rdeps="postinst"
+
+    if test "x$D" != "x"; then
+      # Need to run on first boot
+      exit 1
+    else
+      if test -e $efile ; then
+        echo 'success' > $tfile
+      else
+        echo 'fail to install $rdeps first!' >&2
+        exit 1
+      fi
+   fi
+}
+
+pkg_postinst_${PN}-delayed-b () {
+    efile="/etc/postinsta-test"
+    tfile="/etc/postinstb-test"
+    rdeps="postinsta"
+
+    if test "x$D" != "x"; then
+      # Need to run on first boot
+      exit 1
+    else
+      if test -e $efile ; then
+        echo 'success' > $tfile
+      else
+        echo 'fail to install $rdeps first!' >&2
+        exit 1
+      fi
+   fi
+}
+
+pkg_postinst_${PN}-delayed-d () {
+    efile="/etc/postinstb-test"
+    tfile="/etc/postinstd-test"
+    rdeps="postinstb"
+
+    if test "x$D" != "x"; then
+      # Need to run on first boot
+      exit 1
+    else
+      if test -e $efile ; then
+        echo 'success' > $tfile
+      else
+        echo 'fail to install $rdeps first!' >&2
+        exit 1
+      fi
+   fi
+}
+
+pkg_postinst_${PN}-delayed-p () {
+    efile="/etc/postinstd-test"
+    tfile="/etc/postinstp-test"
+    rdeps="postinstd"
+
+    if test "x$D" != "x"; then
+      # Need to run on first boot
+      exit 1
+    else
+      if test -e $efile ; then
+        echo 'success' > $tfile
+      else
+        echo 'fail to install $rdeps first!' >&2
+        exit 1
+      fi
+   fi
+}
+
+pkg_postinst_${PN}-delayed-t () {
+    efile="/etc/postinstp-test"
+    tfile="/etc/postinstt-test"
+    rdeps="postinstp"
+
+    if test "x$D" != "x"; then
+      # Need to run on first boot
+      exit 1
+    else
+      if test -e $efile ; then
+          echo 'success' > $tfile
+      else
+          echo 'fail to install $rdeps first!' >&2
+          exit 1
+      fi
+   fi
+}
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index c2d5b45..1dbfae1 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -2,6 +2,7 @@ from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.decorators import testcase
 import os
+import re
 
 class TestExport(oeSelfTest):
 
@@ -103,3 +104,54 @@ class TestImage(oeSelfTest):
         # Build core-image-sato and testimage
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
+
+class Postinst(oeSelfTest):
+    @testcase(1540)
+    def test_verify_postinst(self):
+        """
+        Summary: The purpose of this test is to verify the execution order of postinst Bugzilla ID: [5319]
+        Expected :
+        1. Compile a minimal image.
+        2. The compiled image will add the created layer with the recipes postinst[ abdpt]
+        3. Run qemux86
+        4. Validate the task execution order
+        Author: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
+        """
+        features = 'INHERIT += "testimage"\n'
+        features += 'CORE_IMAGE_EXTRA_INSTALL += "postinst-at-rootfs \
+postinst-delayed-a \
+postinst-delayed-b \
+postinst-delayed-d \
+postinst-delayed-p \
+postinst-delayed-t \
+"\n'
+        self.write_config(features)
+
+        bitbake('core-image-minimal -f ')
+
+        postinst_list = ['100-postinst-at-rootfs',
+                         '101-postinst-delayed-a',
+                         '102-postinst-delayed-b',
+                         '103-postinst-delayed-d',
+                         '104-postinst-delayed-p',
+                         '105-postinst-delayed-t']
+        path_workdir = get_bb_var('WORKDIR','core-image-minimal')
+        workspacedir = 'testimage/qemu_boot_log'
+        workspacedir = os.path.join(path_workdir, workspacedir)
+        rexp = re.compile("^Running postinst .*/(?P<postinst>.*)\.\.\.$")
+        with runqemu('core-image-minimal') as qemu:
+            with open(workspacedir) as f:
+                found = False
+                idx = 0
+                for line in f.readlines():
+                    line = line.strip().replace("^M","")
+                    if not line: # To avoid empty lines
+                        continue
+                    m = rexp.search(line)
+                    if m:
+                        self.assertEqual(postinst_list[idx], m.group('postinst'), "Fail")
+                        idx = idx+1
+                        found = True
+                    elif found:
+                        self.assertEqual(idx, len(postinst_list), "Not found all postinsts")
+                        break
-- 
2.5.0


