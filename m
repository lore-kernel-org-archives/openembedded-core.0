Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB477EFD3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 18:52:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x86IqAHQ008390
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Sep 2019 11:52:20 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 6 Sep 2019 11:51:59 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Sep 2019 14:51:59 -0400
Message-ID: <20190906185159.4923-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v2] libevent: add granularity to ptest log
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
X-List-Received-Date: Fri, 06 Sep 2019 18:52:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

The libevent ptest used to report only a global pass or a fail result.
Count individual PASS, FAIL, SKIP results. The SKIP results now
include tests that are disabled in the libevent code.

libevent's ptest output did not comply with the automake-style output
"result: testname", and reported a FAIL status at the end of the test
run if any of the libevent tests failed. This patch makes the log
consistent with the automake style:

    PASS: http/cancel_by_host_no_ns
    PASS: http/cancel_inactive_server
    PASS: http/cancel_by_host_no_ns_inactive_server
    SKIPPED: http/cancel_by_host_server_timeout
    SKIPPED: http/cancel_server_timeout

and provides a summary as follows:

    === Test Summary ===
    TOTAL: 316
    PASSED: 300
    FAILED: 0
    SKIPPED: 16
    DURATION: 87
    END: /usr/lib/libevent/ptest

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../libevent/libevent/run-ptest               | 34 ++++++++++++-------
 .../libevent/libevent_2.1.11.bb               |  3 ++
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent/run-ptest b/meta/recipes-support/libevent/libevent/run-ptest
index 0241851c70..080806dea9 100644
--- a/meta/recipes-support/libevent/libevent/run-ptest
+++ b/meta/recipes-support/libevent/libevent/run-ptest
@@ -1,18 +1,28 @@
 #!/bin/sh
 
-fail=0
+# run-ptest - 'ptest' test infrastructure shell script that
+#   wraps the libevent test scripts 
+#
+# Trevor Gamblin <trevor.gamblin@windriver.com>
+###############################################################
+LIBEVENTLIB=@libdir@/libevent
+LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S).log"
+
+cd ${LIBEVENTLIB}/ptest 
+
 for test in ./test/*
 do
-	$test
-	if [ $? -ne 0 ]
-	then
-		fail=1
-	fi
+    $test 2>&1| sed -e '/OK/ s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ; /DISABLED/ s/^/SKIP: /' | cut -f1,2 -d ':' | tee -a ${LOG}
 done
 
-if [ $fail -eq 0 ]
-then
-	echo "PASS: libevent"
-else
-	echo "FAIL: libevent"
-fi
+passed=`grep PASS ${LOG}|wc -l`
+failed=`grep FAIL ${LOG}|wc -l`
+skipped=`grep -E SKIP ${LOG}|wc -l`
+all=$((passed + failed + skipped))
+
+(   echo "=== Test Summary ==="
+    echo "TOTAL: ${all}"
+    echo "PASSED: ${passed}"
+    echo "FAILED: ${failed}"
+    echo "SKIPPED: ${skipped}"
+) | tee -a ${LOG}
diff --git a/meta/recipes-support/libevent/libevent_2.1.11.bb b/meta/recipes-support/libevent/libevent_2.1.11.bb
index 1e18f0ab2c..f005ab8bda 100644
--- a/meta/recipes-support/libevent/libevent_2.1.11.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
@@ -43,4 +43,7 @@ do_install_ptest() {
 	do
 		install -m 0755 $file ${D}${PTEST_PATH}/test
 	done
+        
+        # handle multilib
+        sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
-- 
2.21.0


