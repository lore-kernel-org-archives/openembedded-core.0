Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.6657.1624355465315229946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 02:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: dkGtNc2p6+yyx0C1T5rVY7h+s+fxH6ZGOZSn2TqeMPGCPZUCxG9wo6xWlyCR+I7S2AjEccRuqw
 bLDNO9opPPcw==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204014092"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="204014092"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:07 -0700
IronPort-SDR: kTdfGb2NO/DoyDEyfFbMVvvN44h31YAijeeWltd51+e5Afw09dWS8jROO2Fzo6WL97OipNydce
 dGQC8GJd3GtQ==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="423260072"
Received: from leexiaoy-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.150.96])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:06 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/13] valgrind: Actually install list of non-deterministic ptests
Date: Tue, 22 Jun 2021 17:50:29 +0800
Message-Id: <f076edb7515ba2ecfc0adbfdf30ae5a9aa96e231.1624352878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624352878.git.anuj.mittal@intel.com>
References: <cover.1624352878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d23985d0d653844863ed513d75d93a36359992f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/valgrind/valgrind/run-ptest             | 4 ++--
 .../valgrind/valgrind/taskset_nondeterministic_tests          | 2 --
 meta/recipes-devtools/valgrind/valgrind_3.16.1.bb             | 2 ++
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index b563eb3567..a19944f285 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -33,7 +33,7 @@ fi
 
 echo "Run flaky tests using taskset to limit them to a single core."
 for i in `cat taskset_nondeterministic_tests`; do
-   taskset 0x00000001 perl tests/vg_regtest --valgrind=${VALGRIND_BIN} --valgrind-lib=${VALGRIND_LIBEXECDIR} --yocto-ptest $i 2>&1|tee ${LOG}
+   taskset 0x00000001 perl tests/vg_regtest --valgrind=${VALGRIND_BIN} --valgrind-lib=${VALGRIND_LIBEXECDIR} --yocto-ptest $i 2>&1|tee -a ${LOG}
    mv $i.vgtest $i.IGNORE
 done
 
@@ -43,7 +43,7 @@ cd ${VALGRIND_LIB}/ptest && ./tests/vg_regtest \
     --valgrind-lib=${VALGRIND_LIB} \
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
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
index 3493745828..b48d96f8a3 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://run-ptest \
            file://remove-for-aarch64 \
            file://remove-for-all \
+           file://taskset_nondeterministic_tests \
            file://0004-Fix-out-of-tree-builds.patch \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
@@ -189,6 +190,7 @@ do_install_ptest() {
     cp ${B}/config.h ${D}${PTEST_PATH}
     install -D ${WORKDIR}/remove-for-aarch64 ${D}${PTEST_PATH}
     install -D ${WORKDIR}/remove-for-all ${D}${PTEST_PATH}
+    install -D ${WORKDIR}/taskset_nondeterministic_tests ${D}${PTEST_PATH}
 
     # Add an executable need by none/tests/bigcode
     mkdir ${D}${PTEST_PATH}/perf
-- 
2.31.1

