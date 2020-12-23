Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.10343.1608736768391429647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +dWj8GSCKTZ0p/67hcA16vQByrDHPno9r2ZoK6oZrA1GPH1NUSFEZFc9keCpjxGzBH6c3Dqabl
 RG+xj9Yc3E5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236156"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236156"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:40 -0800
IronPort-SDR: UXw4ZnNqgoGUmqCz3TnZ+QHyRlkNwsLRgMPkfenppyjMpTWmXUmLg81SXME4vKf+HC+tuB/Z5R
 Aul3KQka58Vw==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027752"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:39 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 34/35] valgrind: exclude bar_bad/bar_bad_xml from ptests
Date: Wed, 23 Dec 2020 23:18:44 +0800
Message-Id: <1fd1887eb8040cddcf0859db0b0d35aebea11107.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

The tests' output is non-deterministic and sometimes
doesn't match the sample output. This has been reported at
https://bugs.kde.org/show_bug.cgi?id=430321
(see also an earlier related bug https://bugs.kde.org/show_bug.cgi?id=358213)

Until upstream figures out how to fix this, let's not run the tests.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7f7d2fa18267090891754d976cbc3e628324d3dd)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../valgrind/valgrind/remove-for-aarch64               |  2 --
 meta/recipes-devtools/valgrind/valgrind/remove-for-all |  2 ++
 meta/recipes-devtools/valgrind/valgrind/run-ptest      | 10 ++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.16.1.bb      |  2 ++
 4 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-for-all

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
index a3a0c6e50f..93bfd45a4e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -31,8 +31,6 @@ drd/tests/annotate_static
 drd/tests/annotate_trace_memory
 drd/tests/annotate_trace_memory_xml
 drd/tests/atomic_var
-drd/tests/bar_bad
-drd/tests/bar_bad_xml
 drd/tests/bar_trivial
 drd/tests/bug-235681
 drd/tests/bug322621
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-all b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
new file mode 100644
index 0000000000..d6a85c4735
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-all
@@ -0,0 +1,2 @@
+drd/tests/bar_bad
+drd/tests/bar_bad_xml
diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index 97b0a85dbf..7217dfca5d 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -17,6 +17,12 @@ EXP_TOOLS="exp-bbv exp-dhat exp-sgcheck"
 GDB_BIN=@bindir@/gdb
 cd ${VALGRIND_LIB}/ptest && ./gdbserver_tests/make_local_links ${GDB_BIN}
 
+echo "Hide valgrind tests that are non-deterministic"
+echo "Reported at https://bugs.kde.org/show_bug.cgi?id=430321"
+for i in `cat remove-for-all`; do
+   mv $i.vgtest $i.IGNORE;
+done
+
 arch=`arch`
 if [ "$arch" = "aarch64" ]; then
    echo "Aarch64: Hide valgrind tests that result in defunct process and then out of memory"
@@ -44,6 +50,10 @@ if [ "$arch" = "aarch64" ]; then
    done
 fi
 
+echo "Restore valgrind tests that are non-deterministc"
+for i in `cat remove-for-all`; do
+   mv $i.IGNORE $i.vgtest;
+done
 
 passed=`grep PASS: ${LOG}|wc -l`
 failed=`grep FAIL: ${LOG}|wc -l`
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
index 5db181ac14..25fa58249c 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://run-ptest \
            file://remove-for-aarch64 \
+           file://remove-for-all \
            file://0004-Fix-out-of-tree-builds.patch \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
@@ -186,6 +187,7 @@ do_install_ptest() {
     # The scripts reference config.h so add it to the top ptest dir.
     cp ${B}/config.h ${D}${PTEST_PATH}
     install -D ${WORKDIR}/remove-for-aarch64 ${D}${PTEST_PATH}
+    install -D ${WORKDIR}/remove-for-all ${D}${PTEST_PATH}
 
     # Add an executable need by none/tests/bigcode
     mkdir ${D}${PTEST_PATH}/perf
-- 
2.29.2

