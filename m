Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A31397F33E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 20:45:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8AKij3P023864
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 13:45:01 -0700
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 10 Sep 2019 13:44:45 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Sep 2019 16:44:42 -0400
Message-ID: <20190910204445.21958-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/4] valgrind: enable ~500 more ptests
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
X-List-Received-Date: Tue, 10 Sep 2019 20:45:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add valgrind's top level config.h to the ptest package since
it is used by several scripts to determine which tests to run.

Drop the removal of:
   none/tests/shell,
the content was already moved to:
   none/tests/scripts/shell
so the filter useless and the files no longer cause a problem.

Add a few more test directories that had been omitted.
Add perf/bigcode for test: none/tests/bigcode

Leave .c, .h, .S files in the ptest image since several of them are
needed to run the tests. The overhead is ~13 MB which is high but
keeping all test code is easier than figuring out which source files
are needed and the entire valgrind-ptest package is ~115 MB so in
this context it's an acceptable trade-off.

Add bash dependency for ptest for none/tests/scripts/shell

With core-image-minimal on qemux86-64/kvm:
Recipe         | Passed      | Failed   | Skipped   | Time(s)
before         | 149         | 1        | 9         | 663
after          | 648         | 12       | 60        | 1541

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../valgrind/valgrind_3.15.0.bb               | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 4e89c604d6..7bb6001d90 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -109,7 +109,7 @@ RDEPENDS_${PN} += "perl"
 # redirect functions like strlen.
 RRECOMMENDS_${PN} += "${TCLIBC}-dbg"
 
-RDEPENDS_${PN}-ptest += " file perl perl-module-file-glob sed ${PN}-dbg"
+RDEPENDS_${PN}-ptest += " bash file perl perl-module-file-glob procps sed ${PN}-dbg"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 
 # One of the tests contains a bogus interpreter path on purpose.
@@ -134,40 +134,45 @@ do_install_ptest() {
     for parent_dir in ${S} ${B} ; do
         cd $parent_dir
 
-        # exclude shell or the package won't install
-        rm -rf none/tests/shell* 2>/dev/null
-
         subdirs=" \
 	   cachegrind/tests \
 	   callgrind/tests \
+	   dhat/tests \
 	   drd/tests \
+	   exp-bbv/tests \
+	   exp-dhat/tests \
 	   gdbserver_tests \
 	   helgrind/tests \
+	   lackey/tests \
 	   massif/tests \
 	   memcheck/tests \
 	   none/tests \
 	   tests \
 	"
-
         # Get the vg test scripts, filters, and expected files
         for dir in $subdirs ; do
             find $dir | cpio -pvdu ${D}${PTEST_PATH}
         done
         cd $saved_dir
     done
+    cp ${B}/config.h ${D}${PTEST_PATH}
+    mkdir ${D}${PTEST_PATH}/perf
+    cp ${B}/perf/bigcode ${D}${PTEST_PATH}/perf
 
     # Hide then restore a.c that is used by ann[12].vgtest in call/cachegrind
     mv ${D}${PTEST_PATH}/cachegrind/tests/a.c ${D}${PTEST_PATH}/cachegrind/tests/a_c
-    # clean out build artifacts before building the rpm
+    # clean out build artifacts before building the package. Keep config.h for ptests.
+    mv ${D}${PTEST_PATH}/config.h ${D}${PTEST_PATH}/config_h
+
     find ${D}${PTEST_PATH} \
-         \( -name "Makefile*" \
+        \( \
+	   -name "Makefile*" \
         -o -name "*.o" \
-        -o -name "*.c" \
-        -o -name "*.S" \
-        -o -name "*.h" \) \
+	\) \
         -exec rm {} \;
     mv ${D}${PTEST_PATH}/cachegrind/tests/a_c ${D}${PTEST_PATH}/cachegrind/tests/a.c
     touch ${D}${PTEST_PATH}/cachegrind/tests/a.c -r ${D}${PTEST_PATH}/cachegrind/tests/cgout-test
+    mv ${D}${PTEST_PATH}/config_h ${D}${PTEST_PATH}/config.h
 
     # find *_annotate in ${bindir} for yocto build
     sed -i s:\.\./\.\./cachegrind/cg_annotate:${bindir}/cg_annotate: ${D}${PTEST_PATH}/cachegrind/tests/ann1.vgtest
-- 
2.22.0


