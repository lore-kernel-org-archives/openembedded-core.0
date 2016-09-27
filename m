Return-Path: <Nathan_Lynch@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 4C1FE6093B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2016 19:04:46 +0000 (UTC)
Received: from svr-orw-fem-04.mgc.mentorg.com ([147.34.97.41])
	by relay1.mentorg.com with esmtp 
	id 1boxgO-0004jO-I3 from Nathan_Lynch@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2016 12:04:48 -0700
Received: from localhost (147.34.91.1) by SVR-ORW-FEM-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Tue, 27 Sep 2016 12:04:48 -0700
From: Nathan Lynch <nathan_lynch@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Sep 2016 14:04:46 -0500
Message-ID: <1475003086-23270-1-git-send-email-nathan_lynch@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2] lttng-tools: fix ptest
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
X-List-Received-Date: Tue, 27 Sep 2016 19:04:48 -0000
Content-Type: text/plain

Since the upgrade to 2.8, lttng-tools' test harness silently succeeds
but doesn't actually run the tests.  This is because upstream made
some changes in their test harness:

https://github.com/lttng/lttng-tools/commit/83666813cad3142ceccb929ca9b44d0e9cf53bc8

Updates to address this include:
- drop now-irrelevant patch
- change the ptest-run make target
- remove indiscriminate search/replace commands from do_install_ptest
- copy entire build directory into PTEST_PATH and then remove unneeded files
- use lttng binaries installed on the system for the tests
- add lttng-tools-ptest runtime dependencies
  - lttng-tools itself
  - babeltrace, used by the test harness to process traces
  - perl modules required by babelstats.pl test script
  - procps (for pgrep, pidof)
  - gawk
- remove unnecessary chmod and munging of utils.sh script library
- remove checkpatch from ptest installation tree
- avoid path-munging of libtool artifacts altogether
- use more efficient find+sed patterns to munge Makefiles
- reduce test harness output to conform to ptest rules

On qemux86-64 and qemuarm I get relatively stable results, with
PASS/FAIL varying by +-1 on successive runs.

TOTAL: 2345
PASS:  1735
SKIP:  311
XFAIL: 0
FAIL:  292
XPASS: 0
ERROR: 7

There are some ERRORs worth looking into further but this should be a
useful basis for future work.

Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
---

Changes since v1:
- Drop inappropriate rdepends on perl-module-{overload,overloading}.

 meta/recipes-kernel/lttng/lttng-tools/run-ptest    |  7 +-
 .../lttng/lttng-tools/runtest-2.4.0.patch          | 27 --------
 meta/recipes-kernel/lttng/lttng-tools_git.bb       | 76 ++++++++++++++++------
 3 files changed, 59 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/runtest-2.4.0.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
index e758815c77d4..6230063442d6 100755
--- a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
+++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
@@ -1,4 +1,5 @@
 #!/bin/sh
-
-make -C tests installcheck
-
+# Without --ignore-exit, the tap harness causes any FAILs within a
+# test plan to raise ERRORs; this is just noise.
+makeargs="LOG_DRIVER_FLAGS=--ignore-exit"
+make -t all >/dev/null 2>&1 && exec make -s $makeargs check 2>/dev/null
diff --git a/meta/recipes-kernel/lttng/lttng-tools/runtest-2.4.0.patch b/meta/recipes-kernel/lttng/lttng-tools/runtest-2.4.0.patch
deleted file mode 100644
index 958bce48e0b0..000000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/runtest-2.4.0.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-diff --git a/Makefile.am b/Makefile.am
-index 584f59b..c2bcabd 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -12,3 +12,9 @@ dist_doc_DATA = LICENSE \
- dist_noinst_DATA = CodingStyle
- 
- EXTRA_DIST = extras/lttng-bash_completion gpl-2.0.txt lgpl-2.1.txt
-+
-+install-ptest:
-+	cp -r $(srcdir)/tests $(DESTDIR)
-+	for m in $$(find $(DESTDIR)/tests -name Makefile); do \
-+          sed -i -e 's|^Makefile:|_Makefile:|' $$m; \
-+        done
-diff --git a/tests/run.sh b/tests/run.sh
-index c6c50fd..6455359 100755
---- a/tests/run.sh
-+++ b/tests/run.sh
-@@ -19,4 +19,7 @@
- 
- [ -z "$1" ] && echo "Error: No testlist. Please specify a testlist to run." && exit 1
- 
--prove --merge --exec '' - < $1
-+prove --merge -v --exec '' - < $1 | sed \
-+  -e 's|^ok \(.*\)|PASS: \1|' \
-+  -e 's|^not ok \(.*\)|FAIL: \1|' \
-+  | egrep -h 'PASS|FAIL'
diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index ab75a3743b10..bfc657b3ac07 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
 
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
-RDEPENDS_${PN}-ptest += "make perl bash"
+RDEPENDS_${PN}-ptest += "make perl bash gawk ${PN} babeltrace procps"
+# babelstats.pl wants getopt-long
+RDEPENDS_${PN}-ptest += "perl-module-getopt-long"
 
 SRCREV = "d11e0dba0df9024b8613c51e167a379b91e8b20b"
 PV = "2.8.1+git${SRCPV}"
@@ -29,7 +31,6 @@ PACKAGECONFIG_remove_libc-musl = "lttng-ust"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.8 \
            file://0001-Fix-error.h-common-error.h.patch \
-           file://runtest-2.4.0.patch \
            file://run-ptest"
 
 S = "${WORKDIR}/git"
@@ -56,27 +57,60 @@ do_configure_prepend () {
 }
 
 do_install_ptest () {
-	chmod +x ${D}${PTEST_PATH}/tests/utils/utils.sh
-	for i in `find ${D}${PTEST_PATH} -perm /u+x -type f`; do
-		sed -e "s:\$TESTDIR.*/src/bin/lttng/\$LTTNG_BIN:\$LTTNG_BIN:g" \
-		  -e "s:\$TESTDIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:g" \
-		  -e "s:\$DIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:g" \
-		  -e "s:\$TESTDIR/../src/bin/lttng-consumerd/:${libdir}/lttng/libexec/:g" \
-		  -e "s:\$DIR/../src/bin/lttng-consumerd/:${libdir}/lttng/libexec/:g" \
-		  -e "s:\$TESTDIR/../src/bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:g" \
-		  -e "s:\$DIR/../src/bin/lttng-sessiond/lttng-sessiond:\$SESSIOND_BIN:g" \
-		  -e "s:\$DIR/../src/bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:g" \
-		  -e "s:\$DIR/../bin/lttng-relayd/\$RELAYD_BIN:\$RELAYD_BIN:g" \
-		  -i $i
+	mkdir -p ${D}${PTEST_PATH}
+
+	cp -a -T ${B} ${D}${PTEST_PATH}
+
+	# Prevent attempts to update Makefiles during test runs, and
+	# silence "Making check in $SUBDIR" messages.
+	find ${D}${PTEST_PATH} -name Makefile -type f -exec \
+		sed -i -e 's!^Makefile:!_Makefile:!' \
+		-e '/echo "Making $$target in $$subdir"; \\/d' {} +
+
+	# Prevent attempts to update version.h during test runs.
+	sed -i -e '/^\.PHONY: version\.h$/d' ${D}${PTEST_PATH}/include/Makefile
+
+	# Silence "Making check in $SUBDIR" messages.
+	find ${D}${PTEST_PATH} -name Makefile -type f -exec \
+		sed -i -e '/echo "Making $$target in $$subdir"; \\/d' {} +
+
+	# Substitute links to installed binaries.
+	for prog in lttng lttng-relayd lttng-sessiond lttng-consumerd ; do
+		orig="${D}${PTEST_PATH}/src/bin/${prog}/${prog}"
+		rm "$orig"
+		case "$prog" in
+			lttng-consumerd)
+				ln -s "${libdir}/lttng/libexec/$prog" "$orig"
+				;;
+			*)
+				ln -s "${bindir}/$prog" "$orig"
+				;;
+		esac
 	done
 
-	# Update libdir references in copied .la files
-	for i in `find ${D}${PTEST_PATH} -type f -name *.la`; do
-		sed -i -e 's#${S}/tests/#${STAGING_DIR}${PTEST_PATH}#g' $i
+	# Remove libtool artifacts.
+	find ${D}${PTEST_PATH} \( -name '*.l[ao]' -o -name '*.lai' \) -delete
+
+	# Remove object files and archives.
+	find ${D}${PTEST_PATH} -name '*.[oa]' -type f -delete
+
+	# Remove Makefile.am and Makefile.in.
+	find ${D}${PTEST_PATH} -name 'Makefile.*' -type f -delete
+
+	# Remove autom4te.cache.
+	rm -rf ${D}${PTEST_PATH}/autom4te.cache
+
+	# Replace libtool wrapper scripts (which won't work on the
+	# target) with their corresponding binaries.
+	for prog in unit/ini_config/ini_config \
+		regression/tools/live/live_test \
+		regression/tools/health/health_check ; do
+		basename=${prog##*/}
+		ldir=${D}${PTEST_PATH}/tests/${prog%/*}
+		mv -f ${ldir}/.libs/${basename} ${ldir}
 	done
 
-	sed -e "s:src/bin:bin:g" -e "s:lt-::g" \
-	-i ${D}${PTEST_PATH}/tests/utils/utils.sh
-	sed -e "s:ini_config:\.libs\/ini_config:" \
-	-i ${D}${PTEST_PATH}/tests/unit/ini_config/test_ini_config
+	# checkpatch.pl is unneeded on target and causes file-rdeps QA
+	# warnings.
+	rm -f ${D}${PTEST_PATH}/extras/checkpatch.pl
 }
-- 
2.7.4


