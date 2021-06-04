Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.8882.1622815679254456436
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 07:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 154E7veZ006108
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Jun 2021 07:07:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 4 Jun 2021 07:07:57 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Fri, 4 Jun 2021 07:07:57 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21862)
	id ECF5520063; Fri,  4 Jun 2021 10:07:56 -0400 (EDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>,
        Tony Tascioglu
	<tony.tascioglu@windriver.com>
Subject: [PATCH] valgrind: Improve non-deterministic ptest reliability
Date: Fri, 4 Jun 2021 10:07:56 -0400
Message-ID: <20210604140756.32078-1-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Several of the valgrind tests (particulaly helgrind) are unreliable and
can fail with a different output.

Particularly, there is a higher chance of failure on QEMU instances with
SMP enabled and on systems with more interrupts such as laptops on powersave.

The tests have been reported upstream as being unreliable dating back
over 5 years, due in part to the ordering of threads during
an "unwinding" process in helgrind.
https://bugs.kde.org/show_bug.cgi?id=345121
https://bugs.kde.org/show_bug.cgi?id=430321

A workaround to improve the reliability of such tests is to force them
to run on a single CPU core using taskset. This greatly reduces the
chance of a failure.

From my testing, I have found it can help reduce the rate of failures
on both a laptop and QEMU by over 5x. Stress-testing in QEMU for several
hours did not result in a failure while running the test normally did.

The flaky or undeterministic thread-based tests are defined in the
taskset_nondeterministic_tests file. These test cases will be run with
taskset 0x00000001 to run on a single CPU core rather then the regular
test.

The edited run-ptest executes the flaky tests first, then ignores them
to not duplicate the results from the main tests. Everything modified is
restored when testing is complete.

The drawback is that this isn't a foolproof solution. It helps the tests
fail much less frequently, and considering how this issue has been documented
for a long time, a workaround such as this is needed.

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/run-ptest    | 12 ++++++++++++
 .../valgrind/valgrind/taskset_nondeterministic_tests |  4 ++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/taskset_nondeterministic_tests

diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index 60d243276b..11050a8312 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -32,6 +32,13 @@ if [ "$arch" = "aarch64" ]; then
    done
 fi
 
+echo "Run flaky tests using taskset to limit them to a single core."
+for i in `cat taskset_nondeterministic_tests`; do
+   taskset 0x00000001 perl tests/vg_regtest --valgrind=${VALGRIND_BIN} --valgrind-lib=${VALGRIND_LIBEXECDIR} --yocto-ptest $i 2>&1|tee ${LOG}
+   mv $i.vgtest $i.IGNORE
+done
+
+
 cd ${VALGRIND_LIB}/ptest && ./tests/vg_regtest \
     --valgrind=${VALGRIND_BIN} \
     --valgrind-lib=${VALGRIND_LIBEXECDIR} \
@@ -56,6 +63,11 @@ for i in `cat remove-for-all`; do
    mv $i.IGNORE $i.vgtest;
 done
 
+echo "Restore flaky and other non-deterministic tests"
+for i in `cat taskset_nondeterministic_tests`; do
+   mv $i.IGNORE $i.vgtest;
+done
+
 echo "Failed test details..."
 failed_tests=`grep FAIL: ${LOG} | awk '{print $2}'`
 for test in $failed_tests; do
diff --git a/meta/recipes-devtools/valgrind/valgrind/taskset_nondeterministic_tests b/meta/recipes-devtools/valgrind/valgrind/taskset_nondeterministic_tests
new file mode 100644
index 0000000000..cf073fa927
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/taskset_nondeterministic_tests
@@ -0,0 +1,4 @@
+helgrind/tests/hg05_race2
+helgrind/tests/tc09_bad_unlock
+drd/tests/bar_bad
+drd/tests/bar_bad_xml
-- 
2.29.2

