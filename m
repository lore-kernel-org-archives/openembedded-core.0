Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2790B76809
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 15:03:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 01 Apr 2016 08:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,427,1455004800"; d="scan'208";a="949671688"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2016 08:01:58 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Apr 2016 17:57:35 +0300
Message-Id: <1459522655-9037-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH v2] bluez5: add ptest support
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
X-List-Received-Date: Fri, 01 Apr 2016 15:03:02 -0000

[YOCTO #5134]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        | 13 ++++++++-
 ...-target-for-building-tests-without-runnin.patch | 28 +++++++++++++++++++
 meta/recipes-connectivity/bluez5/bluez5/run-ptest  | 31 ++++++++++++++++++++++
 3 files changed, 71 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/run-ptest

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index f38eaa5..5232523 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -19,11 +19,13 @@ PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
     file://init \
+    file://run-ptest \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
+    file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
-inherit autotools-brokensep pkgconfig systemd update-rc.d distro_features_check
+inherit autotools-brokensep pkgconfig systemd update-rc.d distro_features_check ptest
 
 EXTRA_OECONF = "\
   --enable-tools \
@@ -101,3 +103,12 @@ INITSCRIPT_PACKAGES = "${PN}"
 INITSCRIPT_NAME_${PN} = "bluetooth"
 
 EXCLUDE_FROM_WORLD = "1"
+
+do_compile_ptest() {
+        oe_runmake buildtests
+}
+
+do_install_ptest() {
+        cp -r ${B}/unit/ ${D}${PTEST_PATH}
+        rm ${D}${PTEST_PATH}/unit/*.c ${D}${PTEST_PATH}/unit/*.o
+}
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
new file mode 100644
index 0000000..24ddae6
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tests-add-a-target-for-building-tests-without-runnin.patch
@@ -0,0 +1,28 @@
+From 4bdf0f96dcaa945fd29f26d56e5b36d8c23e4c8b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 1 Apr 2016 17:07:34 +0300
+Subject: [PATCH] tests: add a target for building tests without running them
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 1a48a71..ba3b92f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -425,6 +425,9 @@ endif
+ TESTS = $(unit_tests)
+ AM_TESTS_ENVIRONMENT = MALLOC_CHECK_=3 MALLOC_PERTURB_=69
+ 
++# This allows building tests without running them
++buildtests: $(TESTS)
++
+ if DBUS_RUN_SESSION
+ AM_TESTS_ENVIRONMENT += dbus-run-session --
+ endif
+-- 
+2.8.0.rc3
+
diff --git a/meta/recipes-connectivity/bluez5/bluez5/run-ptest b/meta/recipes-connectivity/bluez5/bluez5/run-ptest
new file mode 100644
index 0000000..21df00c
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/run-ptest
@@ -0,0 +1,31 @@
+#! /bin/sh
+
+cd unit
+
+failed=0
+all=0
+
+for f in test-*; do
+    "./$f"
+    case "$?" in
+        0)
+            echo "PASS: $f"
+            all=$((all + 1))
+            ;;
+        77)
+            echo "SKIP: $f"
+            ;;
+        *)
+            echo "FAIL: $f"
+            failed=$((failed + 1))
+            all=$((all + 1))
+            ;;
+    esac
+done
+
+if [ "$failed" -eq 0 ] ; then
+  echo "All $all tests passed"
+else
+  echo "$failed of $all tests failed"
+fi
+
-- 
2.8.0.rc3


