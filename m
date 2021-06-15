Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.10448.1623768805189401161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 07:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ttasciog@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 15FErNL7014417
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 07:53:23 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 15FErMe0012723
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 07:53:23 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 15 Jun 2021 07:53:22 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Tue, 15 Jun 2021 07:53:22 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21862)
	id 071CB2016B; Tue, 15 Jun 2021 10:53:22 -0400 (EDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>,
        Tony Tascioglu
	<tony.tascioglu@windriver.com>
Subject: [PATCH] valgrind: Actually install list of non-deterministic ptests
Date: Tue, 15 Jun 2021 10:53:12 -0400
Message-ID: <20210615145312.31866-1-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Install list of non-deterministic threaded ptests to be run using taskset
to force them to a single core. This commit works with b318944d7, which
updated the testing script to run the non-deterministic tests separately
but didn't install the list of tests, so these tests were being run
without taskset.

The taskset_nondeterministic_tests file is the list of tests that will
be run separately with taskset, and ignored during the other tests. This
is installed to /usr/lib/valgrind/ptest similar to the 2 existing lists
for tests to skip on ARM and all architectures.

Removed bar_bad and bar_bad_xml to be included separately as they cause
issues on non-kvm QEMU instances.

See:
   b318944dd7 valgrind: Improve non-deterministic ptest reliability
for more info.

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/run-ptest             | 4 ++--
 .../valgrind/valgrind/taskset_nondeterministic_tests          | 2 --
 meta/recipes-devtools/valgrind/valgrind_3.17.0.bb             | 2 ++
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index 11050a8312..caeae84d4f 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -34,7 +34,7 @@ fi
 
 echo "Run flaky tests using taskset to limit them to a single core."
 for i in `cat taskset_nondeterministic_tests`; do
-   taskset 0x00000001 perl tests/vg_regtest --valgrind=${VALGRIND_BIN} --valgrind-lib=${VALGRIND_LIBEXECDIR} --yocto-ptest $i 2>&1|tee ${LOG}
+   taskset 0x00000001 perl tests/vg_regtest --valgrind=${VALGRIND_BIN} --valgrind-lib=${VALGRIND_LIBEXECDIR} --yocto-ptest $i 2>&1|tee -a ${LOG}
    mv $i.vgtest $i.IGNORE
 done
 
@@ -44,7 +44,7 @@ cd ${VALGRIND_LIB}/ptest && ./tests/vg_regtest \
     --valgrind-lib=${VALGRIND_LIBEXECDIR} \
     --yocto-ptest \
     gdbserver_tests ${TOOLS} ${EXP_TOOLS} \
-    2>&1|tee ${LOG}  
+    2>&1|tee -a ${LOG}  
 
 cd ${VALGRIND_LIB}/ptest && \
     ./tests/post_regtest_checks $(pwd) \
diff --git a/meta/recipes-devtools/valgrind/valgrind/taskset_nondeterministic_tests b/meta/recipes-devtools/valgrind/valgrind/taskset_nondeterministic_tests
index cf073fa927..e15100ade7 100644
--- a/meta/recipes-devtools/valgrind/valgrind/taskset_nondeterministic_tests
+++ b/meta/recipes-devtools/valgrind/valgrind/taskset_nondeterministic_tests
@@ -1,4 +1,2 @@
 helgrind/tests/hg05_race2
 helgrind/tests/tc09_bad_unlock
-drd/tests/bar_bad
-drd/tests/bar_bad_xml
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index 7fcb086789..60b248681e 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://run-ptest \
            file://remove-for-aarch64 \
            file://remove-for-all \
+           file://taskset_nondeterministic_tests \
            file://0004-Fix-out-of-tree-builds.patch \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
@@ -187,6 +188,7 @@ do_install_ptest() {
     cp ${B}/config.h ${D}${PTEST_PATH}
     install -D ${WORKDIR}/remove-for-aarch64 ${D}${PTEST_PATH}
     install -D ${WORKDIR}/remove-for-all ${D}${PTEST_PATH}
+    install -D ${WORKDIR}/taskset_nondeterministic_tests ${D}${PTEST_PATH}
 
     # Add an executable need by none/tests/bigcode
     mkdir ${D}${PTEST_PATH}/perf
-- 
2.29.2

