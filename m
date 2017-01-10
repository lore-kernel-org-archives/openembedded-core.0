Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E592F719F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 23:07:23 +0000 (UTC)
Received: from svr-orw-mbx-02.mgc.mentorg.com ([147.34.90.202])
	by relay1.mentorg.com with esmtp 
	id 1cR5Vk-0002uL-Q9 from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2017 15:07:24 -0800
Received: from localhost (147.34.91.1) by svr-orw-mbx-02.mgc.mentorg.com
	(147.34.90.202) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 10 Jan 2017 15:07:22 -0800
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2017 17:06:59 -0600
Message-ID: <1484089620-19725-5-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484089620-19725-1-git-send-email-nathan_lynch@mentor.com>
References: <1484089620-19725-1-git-send-email-nathan_lynch@mentor.com>
MIME-Version: 1.0
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
	svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Subject: [PATCH 4/5] lttng-tools: upgrade to 2.9.3
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
X-List-Received-Date: Tue, 10 Jan 2017 23:07:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Notable recipe changes:

* switch to using release tarball
* brokensep no longer required
* drop upstreamed error.h patch
* change do_install_ptest to selectively copy build artifacts to
  install tree.
* use backported patch to address file-rdeps warning

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---
 .../0001-Fix-error.h-common-error.h.patch          |  33 -----
 meta/recipes-kernel/lttng/lttng-tools/run-ptest    |   5 +-
 .../utils-remove-bogus-interpreter.patch           |  35 +++++
 .../{lttng-tools_git.bb => lttng-tools_2.9.3.bb}   | 142 +++++++++++----------
 4 files changed, 112 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-common-error.h.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/utils-remove-bogus-interpreter.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_git.bb => lttng-tools_2.9.3.bb} (39%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-common-error.h.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-common-error.h.patch
deleted file mode 100644
index 6c8a9b211a08..000000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-error.h-common-error.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 6712db617fe9155ea236f6840c2bd18dbec4c871 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 15 Jun 2016 17:18:03 -0400
-Subject: [PATCH] Fix: error.h -> common/error.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Backport
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
-Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
----
- src/bin/lttng-sessiond/agent.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/bin/lttng-sessiond/agent.c b/src/bin/lttng-sessiond/agent.c
-index 7cbbbde..310a7e8 100644
---- a/src/bin/lttng-sessiond/agent.c
-+++ b/src/bin/lttng-sessiond/agent.c
-@@ -29,7 +29,7 @@
- #include "agent.h"
- #include "ust-app.h"
- #include "utils.h"
--#include "error.h"
-+#include "common/error.h"
- 
- #define AGENT_RET_CODE_INDEX(code) (code - AGENT_RET_CODE_SUCCESS)
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
index 6230063442d6..705030ee53b8 100755
--- a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
+++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
@@ -1,5 +1,6 @@
 #!/bin/sh
 # Without --ignore-exit, the tap harness causes any FAILs within a
 # test plan to raise ERRORs; this is just noise.
-makeargs="LOG_DRIVER_FLAGS=--ignore-exit"
-make -t all >/dev/null 2>&1 && exec make -s $makeargs check 2>/dev/null
+makeargs="LOG_DRIVER_FLAGS=--ignore-exit top_srcdir=$PWD top_builddir=$PWD"
+make -k -t all >/dev/null 2>&1
+exec make -s $makeargs check 2>/dev/null
diff --git a/meta/recipes-kernel/lttng/lttng-tools/utils-remove-bogus-interpreter.patch b/meta/recipes-kernel/lttng/lttng-tools/utils-remove-bogus-interpreter.patch
new file mode 100644
index 000000000000..f08198208d4f
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/utils-remove-bogus-interpreter.patch
@@ -0,0 +1,35 @@
+From 4545eae3bccb0f5a97509d1405a28000029a8d7d Mon Sep 17 00:00:00 2001
+From: Nathan Lynch <nathan_lynch@mentor.com>
+Date: Mon, 9 Jan 2017 16:14:28 -0600
+Subject: [PATCH] lttng-tools: remove bogus interpreter line from utils shell
+ library
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+tests/utils/utils.sh is always sourced, never executed, and
+/src/bin/bash is not a typical path for a shell interpreter.  Just
+delete it.
+
+Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
+Signed-off-by: Jérémie Galarneau <jeremie.galarneau@efficios.com>
+---
+
+Upstream-Status: Backport
+
+ tests/utils/utils.sh | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
+index 05d88650e9f3..9db0640b70f3 100644
+--- a/tests/utils/utils.sh
++++ b/tests/utils/utils.sh
+@@ -1,5 +1,3 @@
+-#!/src/bin/bash
+-#
+ # Copyright (C) - 2012 David Goulet <dgoulet@efficios.com>
+ #
+ # This library is free software; you can redistribute it and/or modify it under
+-- 
+2.7.4
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
similarity index 39%
rename from meta/recipes-kernel/lttng/lttng-tools_git.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
index 29fd75b21705..0506feb0136c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.9.3.bb
@@ -15,9 +15,6 @@ RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps"
 # babelstats.pl wants getopt-long
 RDEPENDS_${PN}-ptest += "perl-module-getopt-long"
 
-SRCREV = "d11e0dba0df9024b8613c51e167a379b91e8b20b"
-PV = "2.8.1+git${SRCPV}"
-
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
                  PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
@@ -29,14 +26,15 @@ PACKAGECONFIG[kmod] = "--enable-kmod, --disable-kmod, kmod"
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 
-SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.8 \
-           file://0001-Fix-error.h-common-error.h.patch \
+SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://x32.patch \
+           file://utils-remove-bogus-interpreter.patch \
            file://run-ptest"
 
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "19fdcc5e9c307ef66581a2743a08a541"
+SRC_URI[sha256sum] = "a6e6baaaa977dcbc9bce6b675881eec664599b86f0d905a7b0b508539407b24e"
 
-inherit autotools-brokensep ptest pkgconfig useradd python3-dir manpages
+inherit autotools ptest pkgconfig useradd python3-dir manpages
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "tracing"
@@ -53,68 +51,76 @@ INSANE_SKIP_${PN} = "libexec dev-so"
 INSANE_SKIP_${PN}-dbg = "libexec"
 
 do_configure_prepend () {
-	# Delete a shipped m4 file that overrides our patched one
-	rm -f ${S}/m4/libxml.m4
+    # Delete a shipped m4 file that overrides our patched one
+    rm -f ${S}/m4/libxml.m4
 }
 
 do_install_ptest () {
-	mkdir -p ${D}${PTEST_PATH}
-
-	cp -a -T ${B} ${D}${PTEST_PATH}
-
-	# Prevent attempts to update Makefiles during test runs, and
-	# silence "Making check in $SUBDIR" messages.
-	find ${D}${PTEST_PATH} -name Makefile -type f -exec \
-		sed -i -e 's!^Makefile:!_Makefile:!' \
-		-e '/echo "Making $$target in $$subdir"; \\/d' {} +
-
-	# Prevent attempts to update version.h during test runs.
-	sed -i -e '/^\.PHONY: version\.h$/d' ${D}${PTEST_PATH}/include/Makefile
-
-	# Silence "Making check in $SUBDIR" messages.
-	find ${D}${PTEST_PATH} -name Makefile -type f -exec \
-		sed -i -e '/echo "Making $$target in $$subdir"; \\/d' {} +
-
-	# Substitute links to installed binaries.
-	for prog in lttng lttng-relayd lttng-sessiond lttng-consumerd ; do
-		orig="${D}${PTEST_PATH}/src/bin/${prog}/${prog}"
-		rm "$orig"
-		case "$prog" in
-			lttng-consumerd)
-				ln -s "${libdir}/lttng/libexec/$prog" "$orig"
-				;;
-			*)
-				ln -s "${bindir}/$prog" "$orig"
-				;;
-		esac
-	done
-
-	# Remove libtool artifacts.
-	find ${D}${PTEST_PATH} \( -name '*.l[ao]' -o -name '*.lai' \) -delete
-
-	# Remove object files and archives.
-	find ${D}${PTEST_PATH} -name '*.[oa]' -type f -delete
-
-	# Remove Makefile.am and Makefile.in.
-	find ${D}${PTEST_PATH} -name 'Makefile.*' -type f -delete
-
-	# Remove autom4te.cache.
-	rm -rf ${D}${PTEST_PATH}/autom4te.cache
-
-	# Replace libtool wrapper scripts (which won't work on the
-	# target) with their corresponding binaries.
-	for prog in unit/ini_config/ini_config \
-		regression/tools/live/live_test \
-		regression/tools/health/health_check ; do
-		basename=${prog##*/}
-		ldir=${D}${PTEST_PATH}/tests/${prog%/*}
-		mv -f ${ldir}/.libs/${basename} ${ldir}
-	done
-
-	# checkpatch.pl is unneeded on target and causes file-rdeps QA
-	# warnings.
-	rm -f ${D}${PTEST_PATH}/extras/checkpatch.pl
-
-        # Remove built libraries as they confuse the packages' runtime dependency resolution
-        rm -rf ${D}${PTEST_PATH}/src/lib/lttng-ctl/.libs/
+    for f in Makefile tests/Makefile tests/utils/utils.sh ; do
+        install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
+    done
+
+    for f in config/tap-driver.sh config/test-driver ; do
+        install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
+    done
+
+    # Prevent 'make check' from recursing into non-test subdirectories.
+    sed -i -e 's!^SUBDIRS = .*!SUBDIRS = tests!' "${D}${PTEST_PATH}/Makefile"
+
+    # We don't need these
+    sed -i -e '/dist_noinst_SCRIPTS = /,/^$/d' "${D}${PTEST_PATH}/tests/Makefile"
+
+    # We shouldn't need to build anything in tests/utils
+    sed -i -e 's!am__append_1 = . utils!am__append_1 = . !' \
+        "${D}${PTEST_PATH}/tests/Makefile"
+
+    # Copy the tests directory tree and the executables and
+    # Makefiles found within.
+    for d in $(find "${B}/tests" -type d -not -name .libs -printf '%P ') ; do
+        find "${B}/tests/$d" -maxdepth 1 -executable -type f \
+            -exec install -D -t "${D}${PTEST_PATH}/tests/$d" {} +
+        test -r "${B}/tests/$d/Makefile" && \
+            install -D -t "${D}${PTEST_PATH}/tests/$d" "${B}/tests/$d/Makefile"
+    done
+
+    # We shouldn't need to build anything in tests/regression/tools
+    sed -i -e 's!^SUBDIRS = tools !SUBDIRS = !' \
+        "${D}${PTEST_PATH}/tests/regression/Makefile"
+
+    # Prevent attempts to update Makefiles during test runs, and
+    # silence "Making check in $SUBDIR" messages.
+    find "${D}${PTEST_PATH}" -name Makefile -type f -exec \
+        sed -i -e '/Makefile:/,/^$/d' -e '/%: %.in/,/^$/d' \
+        -e '/echo "Making $$target in $$subdir"; \\/d' \
+        -e 's/^srcdir = \(.*\)/srcdir = ./' \
+        -e 's/^builddir = \(.*\)/builddir = ./' \
+        -e 's/^all-am:.*/all-am:/' \
+        {} +
+
+    # These objects trigger [rpaths] QA checks; the test harness
+    # skips the associated tests if they're missing, so delete
+    # them.
+    objs=""
+    objs="$objs regression/ust/ust-dl/libbar.so"
+    objs="$objs regression/ust/ust-dl/libfoo.so"
+    for obj in $objs ; do
+        rm -f "${D}${PTEST_PATH}/tests/${obj}"
+    done
+
+    find "${D}${PTEST_PATH}" -name Makefile -type f -exec \
+        touch -r "${B}/Makefile" {} +
+
+    # Substitute links to installed binaries.
+    for prog in lttng lttng-relayd lttng-sessiond lttng-consumerd ; do
+        exedir="${D}${PTEST_PATH}/src/bin/${prog}"
+        install -d "$exedir"
+        case "$prog" in
+            lttng-consumerd)
+                ln -s "${libdir}/lttng/libexec/$prog" "$exedir"
+                ;;
+            *)
+                ln -s "${bindir}/$prog" "$exedir"
+                ;;
+        esac
+    done
 }
-- 
2.7.4


