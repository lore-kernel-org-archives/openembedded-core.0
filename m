Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id E1D86602D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 23:41:47 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 24 Nov 2015 00:41:45 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 787E528FA83;
	Tue, 24 Nov 2015 00:41:45 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Nov 2015 00:41:37 +0100
Message-ID: <1448322097-33026-2-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448322097-33026-1-git-send-email-tudor.florea@enea.com>
References: <1448322097-33026-1-git-send-email-tudor.florea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/1] util-linux: Add ptest
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
X-List-Received-Date: Mon, 23 Nov 2015 23:41:52 -0000
Content-Type: text/plain

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta/recipes-core/util-linux/util-linux.inc        |  31 ++++-
 .../util-linux/avoid_parallel_tests.patch          | 145 +++++++++++++++++++++
 .../util-linux/avoid_unsupported_sleep_param.patch |  20 +++
 .../util-linux/display_testname_for_subtest.patch  |  18 +++
 .../recipes-core/util-linux/util-linux/ptest.patch |  17 +++
 meta/recipes-core/util-linux/util-linux/run-ptest  |  10 ++
 meta/recipes-core/util-linux/util-linux_2.26.2.bb  |   5 +
 7 files changed, 245 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/ptest.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/run-ptest

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 594108f..95a7297 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c
                     file://libmount/COPYING;md5=fb93f01d4361069c5616327705373b16 \
                     file://libblkid/COPYING;md5=fb93f01d4361069c5616327705373b16"
 
-inherit autotools gettext pkgconfig systemd update-alternatives python-dir
+inherit autotools gettext pkgconfig systemd update-alternatives python-dir ptest
 DEPENDS = "zlib ncurses"
 DEPENDS_append_class-native = " lzo-native"
 DEPENDS_append_class-nativesdk = " lzo-native"
@@ -272,3 +272,32 @@ python populate_packages_prepend() {
                       description='util-linux lib%s',
                       extra_depends='', prepend=True, allow_links=True)
 }
+
+RDEPENDS_${PN}-ptest = "bash"
+
+do_compile_ptest() {
+    oe_runmake buildtest-TESTS
+}
+
+do_install_ptest() {
+    mkdir -p ${D}${PTEST_PATH}/tests/ts
+    find . -maxdepth 1 -type f -perm -111 -exec cp {} ${D}${PTEST_PATH} \;
+    cp ${S}/tests/functions.sh ${D}${PTEST_PATH}/tests/
+    cp ${S}/tests/commands.sh ${D}${PTEST_PATH}/tests/
+    cp ${S}/tests/run.sh ${D}${PTEST_PATH}/tests/
+    cp -pR ${S}/tests/expected ${D}${PTEST_PATH}/tests/expected
+
+    list="bitops build-sys cal col colrm column dmesg fsck hexdump hwclock ipcs isosize login look md5 misc more namei paths schedutils script swapon tailf"
+    # The following tests are not installed  yet:
+    # blkid scsi_debug module dependent
+    # cramfs gcc dependent
+    # eject gcc dependent
+    # fdisk scsi_debug module and gcc dependent
+    # lscpu gcc dependant
+    # libmount uuidgen dependent
+    # mount gcc dependant
+    # partx blkid dependant
+    for d in $list; do
+        cp -pR ${S}/tests/ts/$d ${D}${PTEST_PATH}/tests/ts/
+    done
+}
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
new file mode 100644
index 0000000..ece260c
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -0,0 +1,145 @@
+Ptest needs buildtest-TESTS and runtest-TESTS targets.
+serial-tests is required to generate those targets.
+Revert run.sh script accordingly to serialize running tests 
+
+Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
+Upstream-Status: Inappropriate 
+
+diff -ruN a/configure.ac b/configure.ac
+--- a/configure.ac	2014-05-27 12:37:42.119772658 +0200
++++ b/configure.ac	2014-05-27 12:41:46.225573272 +0200
+@@ -10,7 +10,7 @@
+ dnl AC_USE_SYSTEM_EXTENSIONS must be called before any macros that run
+ dnl the compiler (like AC_PROG_LIBTOOL) to avoid autoconf errors.
+ AC_USE_SYSTEM_EXTENSIONS
+-AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax dist-bzip2 no-dist-gzip dist-xz -Wno-portability subdir-objects])
++AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax dist-bzip2 no-dist-gzip dist-xz -Wno-portability subdir-objects serial-tests])
+
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])],
+ 			    [AC_SUBST([AM_DEFAULT_VERBOSITY], [1])])
+--- a/tests/run.sh	2015-11-18 15:09:05.517018566 +0100
++++ b/tests/run.sh	2015-11-18 20:02:15.492749213 +0100
+@@ -16,22 +16,12 @@
+ # GNU General Public License for more details.
+ #
+ 
+-TS_TOPDIR=$(cd ${0%/*} && pwd)
++TS_TOPDIR=$(cd $(dirname $0) && pwd)
+ SUBTESTS=
+ OPTS=
+ 
+ top_srcdir=
+ top_builddir=
+-paraller_jobs=1
+-
+-function num_cpus()
+-{
+-	if lscpu -p &>/dev/null; then
+-		lscpu -p | grep -cv '^#'
+-	else
+-		echo 1
+-	fi
+-}
+ 
+ while [ -n "$1" ]; do
+ 	case "$1" in
+@@ -47,9 +37,6 @@
+ 	--verbose)
+ 		OPTS="$OPTS --verbose"
+ 		;;
+-	--skip-loopdevs)
+-		OPTS="$OPTS --skip-loopdevs"
+-		;;
+ 	--nonroot)
+ 		if [ $(id -ru) -eq 0 ]; then
+ 			echo "Ignore util-linux test suite [non-root UID expected]."
+@@ -62,14 +49,6 @@
+ 	--builddir=*)
+ 		top_builddir="${1##--builddir=}"
+ 		;;
+-	--parallel=*)
+-		paraller_jobs="${1##--parallel=}"
+-		OPTS="$OPTS --parallel"
+-		;;
+-	--parallel)
+-		paraller_jobs=$(num_cpus)
+-		OPTS="$OPTS --parallel"
+-		;;
+ 	--*)
+ 		echo "Unknown option $1"
+ 		echo "Usage: "
+@@ -82,7 +61,6 @@
+ 		echo "  --nonroot         ignore test suite if user is root"
+ 		echo "  --srcdir=<path>   autotools top source directory"
+ 		echo "  --builddir=<path> autotools top build directory"
+-		echo "  --parallel=<num>  number of parallel test jobs, default: num cpus"
+ 		echo
+ 		exit 1
+ 		;;
+@@ -109,24 +87,24 @@
+ 
+ OPTS="$OPTS --srcdir=$top_srcdir --builddir=$top_builddir"
+ 
+-declare -a comps
+ if [ -n "$SUBTESTS" ]; then
+ 	# selected tests only
+ 	for s in $SUBTESTS; do
+ 		if [ -d "$top_srcdir/tests/ts/$s" ]; then
+-			comps+=( $(find $top_srcdir/tests/ts/$s -type f -perm /a+x -regex ".*/[^\.~]*") )
++			co=$(find $top_srcdir/tests/ts/$s -type f -perm -111 -regex ".*/[^\.~]*" |  sort)
++			comps="$comps $co"
+ 		else
+ 			echo "Unknown test component '$s'"
+ 			exit 1
+ 		fi
+ 	done
+ else
+-	if [ ! -f "$top_builddir/test_ttyutils" ]; then
++	if [ ! -f "$top_builddir/test_ttyutils" ];  then
+ 		echo "Tests not compiled! Run 'make check' to fix the problem."
+ 		exit 1
+ 	fi
+ 
+-	comps=( $(find $top_srcdir/tests/ts/ -type f -perm /a+x -regex ".*/[^\.~]*") )
++	comps=$(find $top_srcdir/tests/ts/ -type f -perm -111 -regex ".*/[^\.~]*" |  sort)
+ fi
+ 
+ 
+@@ -141,27 +119,21 @@
+ echo "                 Don't execute on production system!                 "
+ echo
+ 
+-if [ $paraller_jobs -gt 1 ]; then
+-	echo "              Executing the tests in parallel ($paraller_jobs jobs)    "
+-	echo
+-fi
+-
++res=0
+ count=0
+->| $top_builddir/tests/failures
+-printf "%s\n" ${comps[*]} |
+-	sort |
+-	xargs -I '{}' -P $paraller_jobs -n 1 bash -c "'{}' \"$OPTS\" ||
+-		echo 1 >> $top_builddir/tests/failures"
+-declare -a fail_file
+-fail_file=( $( < $top_builddir/tests/failures ) ) || exit 1
+-rm -f $top_builddir/tests/failures
++for ts in $comps; do
++	$ts "$OPTS"
++	res=$(( $res + $? ))
++	count=$(( $count + 1 ))
++done
++
+ echo
+ echo "---------------------------------------------------------------------"
+-if [ ${#fail_file[@]} -eq 0 ]; then
+-	echo "  All ${#comps[@]} tests PASSED"
++if [ $res -eq 0 ]; then
++	echo "  All $count tests PASSED"
+ 	res=0
+ else
+-	echo "  ${#fail_file[@]} tests of ${#comps[@]} FAILED"
++	echo "  $res tests of $count FAILED"
+ 	res=1
+ fi
+ echo "---------------------------------------------------------------------"
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch b/meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch
new file mode 100644
index 0000000..7a63a4e
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch
@@ -0,0 +1,20 @@
+Avoid unsupported sleep parameter
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Upstream-Status: Pending
+
+diff -ruN a/simple b/simple
+--- a/tests/ts/tailf/simple	2015-11-12 11:34:49.971817130 +0200
++++ b/tests/ts/tailf/simple	2013-11-12 11:34:37.876325128 +0200
+@@ -27,9 +27,9 @@
+ 
+ $TS_CMD_TAILF $INPUT > $TS_OUTPUT 2>&1 &
+ 
+-sleep 0.5
++sleep 1
+ echo {0..9} >> $INPUT
+-sleep 0.5
++sleep 1
+ 
+ rm -f $INPUT
+ 
diff --git a/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
new file mode 100644
index 0000000..0eb8810
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
@@ -0,0 +1,18 @@
+Display testname for subtest
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Upstream-Status: Pending
+
+diff -ruN a/functions.sh b/functions.sh
+--- a/tests/functions.sh	2015-11-12 21:32:02.434542124 +0100
++++ b/tests/functions.sh	2015-11-12 21:40:37.095317280 +0100
+@@ -297,7 +297,7 @@
+ 	if [ "$TS_PARALLEL" == "yes" ]; then
+ 		TS_TITLE=$(printf "%13s: %-30s ...\n%16s: %-27s ..." "$TS_COMPONENT" "$TS_DESC" "" "$TS_SUBNAME")
+ 	else
+-		TS_TITLE=$(printf "%16s: %-27s ..." "" "$TS_SUBNAME")
++               TS_TITLE=$(printf "%13s: %-30s ..." "$TS_COMPONENT" "$TS_SUBNAME")
+ 		echo -n "$TS_TITLE"
+ 	fi
+ }
+
diff --git a/meta/recipes-core/util-linux/util-linux/ptest.patch b/meta/recipes-core/util-linux/util-linux/ptest.patch
new file mode 100644
index 0000000..837f189
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/ptest.patch
@@ -0,0 +1,17 @@
+Define TESTS variable
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Upstream-Status: Pending
+
+diff -ruN a/Makefile.am b/Makefile.am
+--- a/Makefile.am	2015-11-12 20:29:46.778396936 +0100
++++ b/Makefile.am	2015-11-12 20:32:24.342450279 +0100
+@@ -48,7 +48,7 @@
+ dist_bashcompletion_DATA =
+ check_PROGRAMS =
+ dist_check_SCRIPTS =
+-TESTS =
++TESTS = $(check_PROGRAMS)
+ 
+ PATHFILES =
+
diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
new file mode 100644
index 0000000..e155ec6
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+
+cd tests || exit 1
+sh ./run.sh 2>&1 | {
+   sed '{
+      s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/
+      s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/
+      s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/
+   }'
+}
diff --git a/meta/recipes-core/util-linux/util-linux_2.26.2.bb b/meta/recipes-core/util-linux/util-linux_2.26.2.bb
index e09fdfa..bba7dc8 100644
--- a/meta/recipes-core/util-linux/util-linux_2.26.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.26.2.bb
@@ -16,6 +16,11 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://runuser.pamd \
             file://runuser-l.pamd \
             ${OLDHOST} \
+            file://ptest.patch \
+            file://run-ptest \
+            file://avoid_unsupported_sleep_param.patch \
+            file://display_testname_for_subtest.patch \
+            file://avoid_parallel_tests.patch \
 "
 SRC_URI[md5sum] = "9bdf368c395f1b70325d0eb22c7f48fb"
 SRC_URI[sha256sum] = "0e29bda142528a48a0a953c39ff63093651a4809042e1790fbd6aa8663fd9666"
-- 
1.9.1


