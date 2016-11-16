Return-Path: <francisco.j.pedraza.gonzalez@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9B0605BE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 00:50:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 15 Nov 2016 16:50:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,497,1473145200"; d="scan'208";a="1069011569"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2016 16:50:26 -0800
Received: from fjpedraz-MOBL3.zpn.intel.com (unknown [10.219.128.46])
	by linux.intel.com (Postfix) with ESMTP id 8DA0F6A4082;
	Tue, 15 Nov 2016 16:49:46 -0800 (PST)
From: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 18:50:23 -0600
Message-Id: <1479257423-4281-1-git-send-email-francisco.j.pedraza.gonzalez@intel.com>
X-Mailer: git-send-email 2.5.0
Cc: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
Subject: [PATCH] Test needed to verify postinst script order.
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
X-List-Received-Date: Wed, 16 Nov 2016 00:50:26 -0000

Will verify the following:
1. Compile a minimal image.
2. The compiled image will add the created layer with the
recipes postinstz postinsta postinstb postinstd postinstp postinstt
created previously at "meta-selftest/recipes-test"
2. Run qemu
3. Validate the task execution order.
V4

Signed-off-by: Francisco Pedraza <francisco.j.pedraza.gonzalez@intel.com>
---
 .../recipes-test/postinsta/postinsta_1.0.bb        | 20 +++++++++++
 .../recipes-test/postinstb/postinstb_1.0.bb        | 22 ++++++++++++
 .../recipes-test/postinstd/postinstd_1.0.bb        | 22 ++++++++++++
 .../recipes-test/postinstp/postinstp_1.0.bb        | 22 ++++++++++++
 .../recipes-test/postinstt/postinstt_1.0.bb        | 22 ++++++++++++
 .../recipes-test/postinstz/postinstz_1.0.bb        | 12 +++++++
 meta/lib/oeqa/selftest/runtime-test.py             | 40 ++++++++++++++++++++++
 7 files changed, 160 insertions(+)
 create mode 100644 meta-selftest/recipes-test/postinsta/postinsta_1.0.bb
 create mode 100644 meta-selftest/recipes-test/postinstb/postinstb_1.0.bb
 create mode 100644 meta-selftest/recipes-test/postinstd/postinstd_1.0.bb
 create mode 100644 meta-selftest/recipes-test/postinstp/postinstp_1.0.bb
 create mode 100644 meta-selftest/recipes-test/postinstt/postinstt_1.0.bb
 create mode 100644 meta-selftest/recipes-test/postinstz/postinstz_1.0.bb

diff --git a/meta-selftest/recipes-test/postinsta/postinsta_1.0.bb b/meta-selftest/recipes-test/postinsta/postinsta_1.0.bb
new file mode 100644
index 0000000..2e69a85
--- /dev/null
+++ b/meta-selftest/recipes-test/postinsta/postinsta_1.0.bb
@@ -0,0 +1,20 @@
+LICENSE = "MIT"
+
+RDEPENDS_${PN} = "postinstz"
+
+ALLOW_EMPTY_${PN} = "1"
+
+pkg_postinst_${PN} () {
+   if test "x$D" != "x"; then
+      # Need to run on first boot
+      exit 1
+   else
+      if test -e /etc/postinstz-test ; then
+          echo 'success' > /etc/postinsta-test
+      else
+          echo 'fail to install postinstz first!' >&2
+          exit 1
+      fi
+   fi
+}
+
diff --git a/meta-selftest/recipes-test/postinstb/postinstb_1.0.bb b/meta-selftest/recipes-test/postinstb/postinstb_1.0.bb
new file mode 100644
index 0000000..447d777
--- /dev/null
+++ b/meta-selftest/recipes-test/postinstb/postinstb_1.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Device formfactor information"
+SECTION = "base"
+LICENSE = "MIT"
+
+RDEPENDS_${PN} = "postinsta"
+
+ALLOW_EMPTY_${PN} = "1"
+
+pkg_postinst_${PN} () {
+   if test "x$D" != "x"; then
+      # Need to run on first boot
+      exit 1
+   else
+      if test -e /etc/postinsta-test ; then
+          echo 'success' > /etc/postinstb-test
+      else
+          echo 'fail to install postinsta first!' >&2
+          exit 1
+      fi
+   fi
+}
+
diff --git a/meta-selftest/recipes-test/postinstd/postinstd_1.0.bb b/meta-selftest/recipes-test/postinstd/postinstd_1.0.bb
new file mode 100644
index 0000000..939f60e
--- /dev/null
+++ b/meta-selftest/recipes-test/postinstd/postinstd_1.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Device formfactor information"
+SECTION = "base"
+LICENSE = "MIT"
+
+RDEPENDS_${PN} = "postinstb"
+
+ALLOW_EMPTY_${PN} = "1"
+
+pkg_postinst_${PN} () {
+   if test "x$D" != "x"; then
+      # Need to run on first boot
+      exit 1
+   else
+      if test -e /etc/postinstb-test ; then
+          echo 'success' > /etc/postinstd-test
+      else
+          echo 'fail to install postinstb first!' >&2
+          exit 1
+      fi
+   fi
+}
+
diff --git a/meta-selftest/recipes-test/postinstp/postinstp_1.0.bb b/meta-selftest/recipes-test/postinstp/postinstp_1.0.bb
new file mode 100644
index 0000000..a5210b1
--- /dev/null
+++ b/meta-selftest/recipes-test/postinstp/postinstp_1.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Device formfactor information"
+SECTION = "base"
+LICENSE = "MIT"
+
+RDEPENDS_${PN} = "postinstd"
+
+ALLOW_EMPTY_${PN} = "1"
+
+pkg_postinst_${PN} () {
+   if test "x$D" != "x"; then
+      # Need to run on first boot
+      exit 1
+   else
+      if test -e /etc/z-test ; then
+          echo 'success' > /etc/postinstp-test
+      else
+          echo 'fail to install postinstd first!' >&2
+          exit 1
+      fi
+   fi
+}
+
diff --git a/meta-selftest/recipes-test/postinstt/postinstt_1.0.bb b/meta-selftest/recipes-test/postinstt/postinstt_1.0.bb
new file mode 100644
index 0000000..25c279b
--- /dev/null
+++ b/meta-selftest/recipes-test/postinstt/postinstt_1.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Device formfactor information"
+SECTION = "base"
+LICENSE = "MIT"
+
+RDEPENDS_${PN} = "postinstp"
+
+ALLOW_EMPTY_${PN} = "1"
+
+pkg_postinst_${PN} () {
+   if test "x$D" != "x"; then
+      # Need to run on first boot
+      exit 1
+   else
+      if test -e /etc/postinstp-test ; then
+          echo 'success' > /etc/postinstt-test
+      else
+          echo 'fail to install postinstp first!' >&2
+          exit 1
+      fi
+   fi
+}
+
diff --git a/meta-selftest/recipes-test/postinstz/postinstz_1.0.bb b/meta-selftest/recipes-test/postinstz/postinstz_1.0.bb
new file mode 100644
index 0000000..79abd74
--- /dev/null
+++ b/meta-selftest/recipes-test/postinstz/postinstz_1.0.bb
@@ -0,0 +1,12 @@
+LICENSE = "MIT"
+
+ALLOW_EMPTY_${PN} = "1"
+pkg_postinst_${PN} (){
+    if test "x$D" != "x"' then
+        # Need to run on first boot
+        exit 1
+    else
+        echo "lets write postinst_z" > /etc/postinstz-test
+    fi
+}
+
diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index c2d5b45..888493b 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -2,6 +2,7 @@ from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.decorators import testcase
 import os
+import re
 
 class TestExport(oeSelfTest):
 
@@ -103,3 +104,42 @@ class TestImage(oeSelfTest):
         # Build core-image-sato and testimage
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
+
+class Postinst(oeSelfTest):
+    def test_verify_postinst(self):
+        """
+        Summary: The purpose of this test is to verify the execution order of postinst Bugzilla ID: [5319]
+        Expected 1. Compile a minimal image.
+        1. The compiled image will add the created layer with the recipes a b d p t z
+        2. Run qemux86
+        3. Validate the task execution order
+        """
+        features = 'INHERIT += "testimage"\n'
+        features += 'CORE_IMAGE_EXTRA_INSTALL += "postinstz postinsta postinstb postinstd postinstp postinstt"\n'
+        self.write_config(features)
+
+        bitbake('core-image-minimal -c cleansstate')
+        bitbake('core-image-minimal')
+
+        postinst_list = ['100-postinstz','101-postinsta','102-postinstb','103-postinstd','104-postinstp','105-postinstt']
+        path_workdir = get_bb_var('WORKDIR','core-image-minimal')
+        workspacedir = 'testimage/qemu_boot_log'
+        workspacedir = os.path.join(path_workdir, workspacedir)
+        rexp = re.compile("^Running postinst .*/(?P<postinst>.*)\.\.\.$")
+        with runqemu('core-image-minimal') as qemu:
+            with open(workspacedir) as f:
+                found = False
+                idx = 0 
+                for line in f.readlines():
+                    line = line.strip()
+                    line = line.replace("^M","")
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


