Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 1A72F6FF9B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 03:08:04 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Thu, 3 Dec 2015
	04:08:02 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 2511028FA82;
	Thu,  3 Dec 2015 04:08:02 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Dec 2015 04:08:00 +0100
Message-ID: <1449112080-7482-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
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
X-List-Received-Date: Thu, 03 Dec 2015 03:08:05 -0000
Content-Type: text/plain

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta/recipes-core/util-linux/util-linux.inc        | 31 +++++++++++-
 .../util-linux/avoid_parallel_tests.patch          | 19 ++++++++
 .../util-linux/avoid_unsupported_grep_opts.patch   | 57 ++++++++++++++++++++++
 .../util-linux/avoid_unsupported_sleep_param.patch | 20 ++++++++
 .../util-linux/display_testname_for_subtest.patch  | 18 +++++++
 .../recipes-core/util-linux/util-linux/ptest.patch | 17 +++++++
 meta/recipes-core/util-linux/util-linux/run-ptest  | 25 ++++++++++
 meta/recipes-core/util-linux/util-linux_2.26.2.bb  |  6 +++
 8 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch
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
index 0000000..46d4d37
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
@@ -0,0 +1,19 @@
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
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch b/meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch
new file mode 100644
index 0000000..a0d5efa
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch
@@ -0,0 +1,57 @@
+Avoid unsupported grep options
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Upstream-Status: Pending
+
+diff -ruN a/ts/ipcs/headers b/ts/ipcs/headers
+--- a/tests/ts/ipcs/headers	2013-09-04 11:03:36.118613250 +0200
++++ b/teste/ts/ipcs/headers	2013-09-04 11:03:27.906958437 +0200
+@@ -22,35 +22,35 @@
+ ts_init "$*"
+ 
+ ts_log "test: shm headers"
+-$TS_CMD_IPCS -m -t | grep --after-context=1 "^---"  >> $TS_OUTPUT
+-$TS_CMD_IPCS -m -p | grep --after-context=1 "^---"  >> $TS_OUTPUT
+-$TS_CMD_IPCS -m -c | grep --after-context=1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -m -t | grep -A 1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -m -p | grep -A 1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -m -c | grep -A 1 "^---"  >> $TS_OUTPUT
+ $TS_CMD_IPCS -m -l | grep "^---"  >> $TS_OUTPUT
+ $TS_CMD_IPCS -m -u | grep "^---"  >> $TS_OUTPUT
+ echo >> $TS_OUTPUT
+ 
+ ts_log "test: mesg headers"
+-$TS_CMD_IPCS -q -t | grep --after-context=1 "^---"  >> $TS_OUTPUT
+-$TS_CMD_IPCS -q -p | grep --after-context=1 "^---"  >> $TS_OUTPUT
+-$TS_CMD_IPCS -q -c | grep --after-context=1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -q -t | grep -A 1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -q -p | grep -A 1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -q -c | grep -A 1 "^---"  >> $TS_OUTPUT
+ $TS_CMD_IPCS -q -l | grep  "^---"  >> $TS_OUTPUT
+ $TS_CMD_IPCS -q -u | grep  "^---"  >> $TS_OUTPUT
+ echo >> $TS_OUTPUT
+ 
+ ts_log "test: sem headers"
+-$TS_CMD_IPCS -s -t | grep --after-context=1 "^---"  >> $TS_OUTPUT
+-$TS_CMD_IPCS -s -p | grep --after-context=1 "^---"  >> $TS_OUTPUT
+-$TS_CMD_IPCS -s -c | grep --after-context=1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -s -t | grep -A 1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -s -p | grep -A 1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -s -c | grep -A 1 "^---"  >> $TS_OUTPUT
+ $TS_CMD_IPCS -s -l | grep  "^---"  >> $TS_OUTPUT
+ $TS_CMD_IPCS -s -u | grep  "^---"  >> $TS_OUTPUT
+ echo >> $TS_OUTPUT
+ 
+ ts_log "test: all headers"
+-$TS_CMD_IPCS -a | grep --after-context=1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -a | grep -A 1 "^---"  >> $TS_OUTPUT
+ 
+-$TS_CMD_IPCS -a -t | grep --after-context=1 "^---"  >> $TS_OUTPUT
+-$TS_CMD_IPCS -a -p | grep --after-context=1 "^---"  >> $TS_OUTPUT
+-$TS_CMD_IPCS -a -c | grep --after-context=1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -a -t | grep -A 1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -a -p | grep -A 1 "^---"  >> $TS_OUTPUT
++$TS_CMD_IPCS -a -c | grep -A 1 "^---"  >> $TS_OUTPUT
+ $TS_CMD_IPCS -a -l | grep "^---"  >> $TS_OUTPUT
+ $TS_CMD_IPCS -a -u | grep "^---"  >> $TS_OUTPUT
+ 
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
index 0000000..fbc2f9b
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+cd tests || exit 1                                                          
+
+comps=$(find ts/ -type f -perm -111 -regex ".*/[^\.~]*" |  sort)
+
+
+echo
+echo "-------------------- util-linux regression tests --------------------"
+echo
+echo "                    For development purpose only.                    "
+echo "                 Don't execute on production system!                 "
+echo
+
+res=0
+count=0
+for ts in $comps; 
+do 
+   $ts | sed '{        
+      s/^\(.*\):\(.*\) \.\.\. OK$/PASS: \1:\2/                              
+      s/^\(.*\):\(.*\) \.\.\. FAILED \(.*\)$/FAIL: \1:\2 \3/                
+      s/^\(.*\):\(.*\) \.\.\. SKIPPED \(.*\)$/SKIP: \1:\2 \3/               
+   }' 
+done
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.26.2.bb b/meta/recipes-core/util-linux/util-linux_2.26.2.bb
index e09fdfa..02e42c1 100644
--- a/meta/recipes-core/util-linux/util-linux_2.26.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.26.2.bb
@@ -16,6 +16,12 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://runuser.pamd \
             file://runuser-l.pamd \
             ${OLDHOST} \
+            file://ptest.patch \
+            file://run-ptest \
+            file://avoid_unsupported_sleep_param.patch \
+            file://avoid_unsupported_grep_opts.patch \
+            file://display_testname_for_subtest.patch \
+            file://avoid_parallel_tests.patch \
 "
 SRC_URI[md5sum] = "9bdf368c395f1b70325d0eb22c7f48fb"
 SRC_URI[sha256sum] = "0e29bda142528a48a0a953c39ff63093651a4809042e1790fbd6aa8663fd9666"
-- 
1.9.1


