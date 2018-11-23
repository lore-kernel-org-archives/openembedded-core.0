Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E09666B07E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 06:58:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAN6wnov029691
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Nov 2018 22:58:51 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 22 Nov 2018 22:58:49 -0800
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Nov 2018 22:58:49 -0800
Message-ID: <20181123065849.68324-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] mdadm: improve the run-ptest
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
X-List-Received-Date: Fri, 23 Nov 2018 06:58:52 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

* There are 120+ cases under ${libdir}/mdadm/ptest/tests,
  but the test will break if one test fails as
  below logic in run-ptest.
  ./test &>./test.log

  That's to say, the tests after the failed test
  have no chance to run with the current logic.

  To guarantee all the tests can run even one
  of the tests fails, the option --keep-going
  should be added.

* Refactor the test report to make the report
  more detailed and more common

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-extended/mdadm/files/run-ptest | 25 ++++++++++++++-------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/mdadm/files/run-ptest b/meta/recipes-extended/mdadm/files/run-ptest
index 5b276090f5..234f97376a 100644
--- a/meta/recipes-extended/mdadm/files/run-ptest
+++ b/meta/recipes-extended/mdadm/files/run-ptest
@@ -1,10 +1,19 @@
 #!/bin/sh
 
-./test &>./test.log
-if [ $? -eq 0 ]
-then
-	echo "PASS: mdadm"
-	rm test.log
-else
-	echo "FAIL: mdadm"
-fi
+LOG="$(pwd)/test.log"
+# make the test continue to execute even one fail
+./test --keep-going 2>&1|tee ${LOG}
+# translate the test report
+# "tests/18imsm-r10_4d-takeover-r0_2d... succeeded" -> "PASS: tests/18imsm-r10_4d-takeover-r0_2d"
+# "tests/19raid6repair... FAILED - see //log for details" -> "FAIL: tests/19raid6repair"
+sed -i -e '/succeeded/ s/^/PASS: /' -e '/FAILED/ s/^/FAIL: /' ${LOG}
+sed -i -e 's/... FAILED//g' -e 's/... succeeded//g' ${LOG}
+passed=`grep PASS: ${LOG}|wc -l`
+failed=`grep FAIL: ${LOG}|wc -l`
+all=$((passed + failed))
+
+( echo "=== Test Summary ==="
+  echo "TOTAL: ${all}"
+  echo "PASSED: ${passed}"
+  echo "FAILED: ${failed}"
+) | tee -a /${LOG}
-- 
2.17.1


