Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6899E6007A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 20:54:38 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 24 Oct 2017 13:54:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,429,1503385200"; d="scan'208";a="141810964"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga004.jf.intel.com with ESMTP; 24 Oct 2017 13:54:40 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Oct 2017 13:54:38 -0700
Message-Id: <1508878478-9637-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2] gmp-6.1.2: add ptest support
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
X-List-Received-Date: Tue, 24 Oct 2017 20:54:39 -0000

GMP library contains code highly optimized for the host processor.
The test suite for GMP is considered critical.
GMP is heavily used in cryptography, internet security applications,
GCC..., etc. Therefore it is only prudent to have a test suite available.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../gmp/gmp-6.1.2/avoid-parallel-tests.patch       | 28 ++++++++++++++++++++++
 meta/recipes-support/gmp/gmp-6.1.2/run-ptest       | 22 +++++++++++++++++
 meta/recipes-support/gmp/gmp_6.1.2.bb              | 21 ++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp-6.1.2/avoid-parallel-tests.patch
 create mode 100644 meta/recipes-support/gmp/gmp-6.1.2/run-ptest

diff --git a/meta/recipes-support/gmp/gmp-6.1.2/avoid-parallel-tests.patch b/meta/recipes-support/gmp/gmp-6.1.2/avoid-parallel-tests.patch
new file mode 100644
index 0000000..abc33ef
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-6.1.2/avoid-parallel-tests.patch
@@ -0,0 +1,28 @@
+
+The target buildtest-TESTS is only supported via serial-tests.
+We also need to add buildest-TESTS to AM_EXTRA_RECURSIVE_TARGETS,
+otherwise most tests will be not built.
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+
+--- a/configure.ac	2017-10-24 09:19:31.439004000 -0700
++++ b/configure.ac	2017-10-24 10:33:08.850059434 -0700
+@@ -77,7 +77,7 @@
+ dnl  Note that there's a copy of these options in the top-level Makefile.am,
+ dnl  so update there too if changing anything.
+ dnl
+-AM_INIT_AUTOMAKE([1.8 gnu no-dependencies])
++AM_INIT_AUTOMAKE([1.8 gnu no-dependencies serial-tests])
+ AC_CONFIG_HEADERS(config.h:config.in)
+ AM_MAINTAINER_MODE
+ 
+@@ -3936,3 +3936,6 @@
+      ;;
+    esac
+ fi
++
++AM_EXTRA_RECURSIVE_TARGETS([buildtest-TESTS])
++
diff --git a/meta/recipes-support/gmp/gmp-6.1.2/run-ptest b/meta/recipes-support/gmp/gmp-6.1.2/run-ptest
new file mode 100644
index 0000000..ef4f76f
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-6.1.2/run-ptest
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+passed=0
+failed=0
+
+output() {
+  if [ $? -eq 0 ]
+    then 
+        echo "PASS: $i"
+        passed=$((passed + 1))
+    else 
+        echo "FAIL: $i"
+        failed=$((failed + 1))
+  fi
+}
+
+cd tests
+for i in `ls *`; do ./$i ; output; done
+
+echo "=== Test Summary ==="
+echo "PASSED: ${passed}"
+echo "FAILED: ${failed}"
diff --git a/meta/recipes-support/gmp/gmp_6.1.2.bb b/meta/recipes-support/gmp/gmp_6.1.2.bb
index b008710..fa60dc7 100644
--- a/meta/recipes-support/gmp/gmp_6.1.2.bb
+++ b/meta/recipes-support/gmp/gmp_6.1.2.bb
@@ -14,6 +14,12 @@ SRC_URI = "https://gmplib.org/download/${BPN}/${BP}${REVISION}.tar.bz2 \
            file://0001-Append-the-user-provided-flags-to-the-auto-detected-.patch \
            file://0001-confiure.ac-Believe-the-cflags-from-environment.patch \
            "
+           
+SRC_URI_append_class-target =" \
+           file://run-ptest \
+           file://avoid-parallel-tests.patch \
+           "
+           
 SRC_URI[md5sum] = "8ddbb26dc3bd4e2302984debba1406a5"
 SRC_URI[sha256sum] = "5275bb04f4863a13516b2f39392ac5e272f5e1bb8057b18aec1c9b79d73d8fb2"
 
@@ -34,6 +40,21 @@ do_install_prepend_class-target() {
 
 SSTATE_SCAN_FILES += "gmp.h"
 
+inherit ptest
+
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests buildtest-TESTS
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    for i in `find ./tests -name '.libs' -d`; do
+        find $i -type f -perm -111 -exec cp {} ${D}${PTEST_PATH}/tests \;
+    done
+}
+
+RDEPENDS_${PN}-ptest += "bash"
+
 # Doesn't compile in MIPS16e mode due to use of hand-written
 # assembly
 MIPS_INSTRUCTION_SET = "mips"
-- 
2.7.4


