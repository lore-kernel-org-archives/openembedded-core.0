Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 655E87E467
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 21:42:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8ALfoEZ025614
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 14:42:00 -0700
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 10 Sep 2019 14:41:39 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Sep 2019 17:41:35 -0400
Message-ID: <20190910214136.22971-3-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910214136.22971-1-Randy.MacLeod@windriver.com>
References: <20190910214136.22971-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [v2 3/4] valgrind: ptest improvements to run-ptest and more
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
X-List-Received-Date: Tue, 10 Sep 2019 21:42:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Make some changes to the run-ptest script:
  - after main tests run integrity check like the pkg Makefile.
  - aesthetic and ordering changes

Add the .in_place directory and its contents which allows valgrind
to be run in-place thereby enabling the gdbserver_tests to
complete rather than hang. Unfortunately directory paths embedded
in binaries still cause many of these test to fail.

Add the exp-sgcheck tests.

With core-image-minimal on qemux86-64/kvm:
Recipe         | Passed      | Failed   | Skipped   | Time(s)
before         | 648         | 12       | 60        | 1541
after          | 662         | 20       | 38        | 1429
ppc-no-gdbserv | 415         | 196      | 34        | 10689

Since fewer tests timeout, the overall time has decreased.
With core-image-sato on qemux86-64/kvm the results are now
the same as core-image-minimal.

qemuppc/arm64 runs result in the oom-killer eventually running since
some processes do not terminate properly and accumulate as defunct
processes in memory. Without the gdbserver_tests, the tests
complete without defunct process or the oom-killer running for
ppc but not for arm64.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../valgrind/valgrind/run-ptest               | 27 ++++++++++---
 .../valgrind/valgrind_3.15.0.bb               | 38 ++++++++++++-------
 2 files changed, 47 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index 447d33c8cb..5b3ad2a2ed 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -4,13 +4,30 @@
 #   wraps the valgrind regression script vg_regtest. 
 #
 # Dave Lerner <dave.lerner@windriver.com>
+# Randy MacLeod <Randy.MacLeod@windriver.com>
 ###############################################################
-VALGRINDLIB=@libdir@/valgrind
-LOG="${VALGRINDLIB}/ptest/valgrind_ptest_$(date +%Y%m%d-%H%M%S).log"
+VALGRIND_LIB=@libdir@/valgrind
+VALGRIND_BIN=@bindir@/valgrind
 
-cd ${VALGRINDLIB}/ptest && ./tests/vg_regtest --all \
-    --valgrind=/usr/bin/valgrind --valgrind-lib=$VALGRINDLIB \
-    --yocto-ptest 2>&1|tee ${LOG}
+LOG="${VALGRIND_LIB}/ptest/valgrind_ptest_$(date +%Y%m%d-%H%M%S).log"
+
+TOOLS="memcheck cachegrind callgrind helgrind drd massif dhat lackey none"
+EXP_TOOLS="exp-bbv exp-dhat exp-sgcheck"
+
+GDB_BIN=@bindir@/gdb
+cd ${VALGRIND_LIB}/ptest && ./gdbserver_tests/make_local_links ${GDB_BIN}
+
+cd ${VALGRIND_LIB}/ptest && ./tests/vg_regtest \
+    --valgrind=${VALGRIND_BIN} \
+    --valgrind-lib=${VALGRIND_LIB} \
+    --yocto-ptest \
+    gdbserver_tests ${TOOLS} ${EXP_TOOLS} \
+    2>&1|tee ${LOG}  
+
+cd ${VALGRIND_LIB}/ptest && \
+    ./tests/post_regtest_checks $(pwd) \
+    gdbserver_tests ${TOOLS} ${EXP_TOOLS} \
+    2>&1|tee -a ${LOG}
 
 passed=`grep PASS: ${LOG}|wc -l`
 failed=`grep FAIL: ${LOG}|wc -l`
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index bf0ca57c93..6d47b6d01d 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -110,7 +110,11 @@ RDEPENDS_${PN} += "perl"
 # redirect functions like strlen.
 RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 
-RDEPENDS_${PN}-ptest += " bash file libgomp perl perl-module-file-glob procps sed ${PN}-dbg"
+RDEPENDS_${PN}-ptest += " bash coreutils file \
+   gdb libgomp \
+   perl \
+   perl-module-getopt-long perl-module-file-basename perl-module-file-glob \
+   procps sed ${PN}-dbg"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 
 # One of the tests contains a bogus interpreter path on purpose.
@@ -136,12 +140,11 @@ do_install_ptest() {
         cd $parent_dir
 
         subdirs=" \
+	   .in_place \
 	   cachegrind/tests \
 	   callgrind/tests \
 	   dhat/tests \
 	   drd/tests \
-	   exp-bbv/tests \
-	   exp-dhat/tests \
 	   gdbserver_tests \
 	   helgrind/tests \
 	   lackey/tests \
@@ -149,6 +152,9 @@ do_install_ptest() {
 	   memcheck/tests \
 	   none/tests \
 	   tests \
+	   exp-bbv/tests \
+	   exp-dhat/tests \
+	   exp-sgcheck/tests \
 	"
         # Get the vg test scripts, filters, and expected files
         for dir in $subdirs ; do
@@ -156,16 +162,24 @@ do_install_ptest() {
         done
         cd $saved_dir
     done
+
+    # The scripts reference config.h so add it to the top ptest dir.
     cp ${B}/config.h ${D}${PTEST_PATH}
+
+    # Add an executable need by none/tests/bigcode
     mkdir ${D}${PTEST_PATH}/perf
     cp ${B}/perf/bigcode ${D}${PTEST_PATH}/perf
-    # needed by memcheck/tests/vcpu_bz2
+
+    # Add an executable needed by memcheck/tests/vcpu_bz2
     cp ${B}/perf/bz2 ${D}${PTEST_PATH}/perf
 
-    # Hide then restore a.c that is used by ann[12].vgtest in call/cachegrind
-    mv ${D}${PTEST_PATH}/cachegrind/tests/a.c ${D}${PTEST_PATH}/cachegrind/tests/a_c
-    # clean out build artifacts before building the package. Keep config.h for ptests.
-    mv ${D}${PTEST_PATH}/config.h ${D}${PTEST_PATH}/config_h
+    # Make the ptest dir look like the top level valgrind src dir
+    # This is checked by the gdbserver_tests/make_local_links script
+    mkdir ${D}${PTEST_PATH}/coregrind
+    cp ${B}/coregrind/vgdb ${D}${PTEST_PATH}/coregrind
+
+    # Add an executable needed by massif tests
+    cp ${B}/massif/ms_print ${D}${PTEST_PATH}/massif/ms_print
 
     find ${D}${PTEST_PATH} \
         \( \
@@ -173,9 +187,9 @@ do_install_ptest() {
         -o -name "*.o" \
 	\) \
         -exec rm {} \;
-    mv ${D}${PTEST_PATH}/cachegrind/tests/a_c ${D}${PTEST_PATH}/cachegrind/tests/a.c
+
+    # These files need to be newer so touch them.
     touch ${D}${PTEST_PATH}/cachegrind/tests/a.c -r ${D}${PTEST_PATH}/cachegrind/tests/cgout-test
-    mv ${D}${PTEST_PATH}/config_h ${D}${PTEST_PATH}/config.h
 
     # find *_annotate in ${bindir} for yocto build
     sed -i s:\.\./\.\./cachegrind/cg_annotate:${bindir}/cg_annotate: ${D}${PTEST_PATH}/cachegrind/tests/ann1.vgtest
@@ -184,9 +198,7 @@ do_install_ptest() {
     sed -i s:\.\./\.\./callgrind/callgrind_annotate:${bindir}/callgrind_annotate: ${D}${PTEST_PATH}/callgrind/tests/ann1.vgtest
     sed -i s:\.\./\.\./callgrind/callgrind_annotate:${bindir}/callgrind_annotate: ${D}${PTEST_PATH}/callgrind/tests/ann2.vgtest
 
-    # needed by massif tests
-    cp ${B}/massif/ms_print ${D}${PTEST_PATH}/massif/ms_print
-
     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
+    sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest
 }
-- 
2.22.0


