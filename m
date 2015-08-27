Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 803AC76DA9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 13:04:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2015 06:04:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="756484361"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 27 Aug 2015 06:04:17 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 16:06:01 +0300
Message-Id: <00ce510e20ccdd4e244ebc98d6ff3db2b38a338b.1440680489.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1440680489.git.jussi.kukkonen@intel.com>
References: <cover.1440680489.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/6] nettle: Add ptests
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
X-List-Received-Date: Thu, 27 Aug 2015 13:04:35 -0000

Use the nettle testsuite as ptests. Skip "sha1-huge-test" because
it can take 20 minutes to finish.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...d-target-to-only-build-tests-not-run-them.patch | 43 ++++++++++++++++++++++
 meta/recipes-support/nettle/files/run-ptest        | 36 ++++++++++++++++++
 meta/recipes-support/nettle/nettle.inc             | 21 ++++++++++-
 3 files changed, 98 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch
 create mode 100644 meta/recipes-support/nettle/files/run-ptest

diff --git a/meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch
new file mode 100644
index 0000000..9495d02
--- /dev/null
+++ b/meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch
@@ -0,0 +1,43 @@
+From 46edf01cc98db9f9feec984897836dfdd26bdc8d Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 12 Aug 2015 23:27:27 +0300
+Subject: [PATCH] Add target to only build tests (not run them)
+
+Upstream-Status: ?
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ Makefile.in           | 3 +++
+ testsuite/Makefile.in | 2 ++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/Makefile.in b/Makefile.in
+index 08efb7d..7909342 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -55,6 +55,9 @@ clean distclean mostlyclean maintainer-clean tags:
+ 	  echo "Making $@ in $$d" ; (cd $$d && $(MAKE) $@); done
+ 	$(MAKE) $@-here
+ 
++buildtest:
++	echo "Making $@ in testsuite" ; (cd testsuite && $(MAKE) $@)
++
+ check-here:
+ 	true
+ 
+diff --git a/testsuite/Makefile.in b/testsuite/Makefile.in
+index 6bc1907..bb65bf0 100644
+--- a/testsuite/Makefile.in
++++ b/testsuite/Makefile.in
+@@ -116,6 +116,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT) ../nettle-internal.$(OBJEXT) \
+ # data.
+ VALGRIND = valgrind --error-exitcode=1 --leak-check=full --show-reachable=yes @IF_ASM@ --partial-loads-ok=yes
+ 
++buildtest: $(TS_ALL)
++
+ # The PATH update is for locating dlls on w*ndows.
+ check: $(TS_ALL)
+ 	LD_LIBRARY_PATH=../.lib PATH="../.lib:$$PATH" srcdir="$(srcdir)" \
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/nettle/files/run-ptest b/meta/recipes-support/nettle/files/run-ptest
new file mode 100644
index 0000000..b90bed6
--- /dev/null
+++ b/meta/recipes-support/nettle/files/run-ptest
@@ -0,0 +1,36 @@
+#! /bin/sh
+
+cd testsuite
+
+failed=0
+all=0
+
+for f in *-test; do
+    if [ "$f" = "sha1-huge-test" ] ; then
+        echo "SKIP: $f (skipped for ludicrous run time)"
+        continue
+    fi
+
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
diff --git a/meta/recipes-support/nettle/nettle.inc b/meta/recipes-support/nettle/nettle.inc
index 0579b6c..fafff6d 100644
--- a/meta/recipes-support/nettle/nettle.inc
+++ b/meta/recipes-support/nettle/nettle.inc
@@ -8,19 +8,36 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 DEPENDS += "gmp"
 
-SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
+SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz \
+           file://Add-target-to-only-build-tests-not-run-them.patch \
+           file://run-ptest \
+           "
 
 SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
 SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
 
 EXTRA_OECONF = "--disable-openssl"
 
+inherit autotools ptest
+
 do_configure_prepend() {
        if [ ! -e ${S}/acinclude.m4 -a -e ${S}/aclocal.m4 ]; then
                cp ${S}/aclocal.m4 ${S}/acinclude.m4
        fi
 }
 
-inherit autotools
+do_compile_ptest() {
+        oe_runmake buildtest
+}
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}/testsuite/
+        install ${S}/testsuite/gold-bug.txt ${D}${PTEST_PATH}/testsuite/
+        install ${S}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
+        # tools can be found in PATH, not in ../tools/
+        sed -i -e 's|../tools/||' ${D}${PTEST_PATH}/testsuite/*-test
+        install ${B}/testsuite/*-test ${D}${PTEST_PATH}/testsuite/
+}
+
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


