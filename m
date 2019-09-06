Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 924257F3D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 14:04:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x86E4i5a018145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Sep 2019 07:04:44 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 6 Sep 2019 07:04:44 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Sep 2019 10:04:43 -0400
Message-ID: <20190906140443.30110-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] libevent: add granularity to ptest
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
X-List-Received-Date: Fri, 06 Sep 2019 14:04:43 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

The libevent ptest used to report only a global pass or a fail result.
Count individual PASS, FAIL, SKIP results. The SKIP results now
include tests that are disabled in the libevent code.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../libevent/libevent/run-ptest               | 34 ++++++++++++-------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent/run-ptest b/meta/recipes-support/libevent/libevent/run-ptest
index 0241851c70..b7d945246f 100644
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
+LIBEVENTLIB=/usr/lib/libevent
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
+    $test 2>&1|tee -a ${LOG}
 done
 
-if [ $fail -eq 0 ]
-then
-	echo "PASS: libevent"
-else
-	echo "FAIL: libevent"
-fi
+passed=`grep OK ${LOG}|wc -l`
+failed=`grep FAILED ${LOG}|wc -l`
+skipped=`grep -E 'DISABLED|SKIPPED' ${LOG}|wc -l`
+all=$((passed + failed + skipped))
+
+(   echo "=== Test Summary ==="
+    echo "TOTAL: ${all}"
+    echo "PASSED: ${passed}"
+    echo "FAILED: ${failed}"
+    echo "SKIPPED: ${skipped}"
+) | tee -a ${LOG}
-- 
2.21.0


