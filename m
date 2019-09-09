Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7B2AA7F343
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2019 15:16:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x89FGLkp009052
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Sep 2019 08:16:21 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 9 Sep 2019 08:16:21 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2019 11:16:20 -0400
Message-ID: <20190909151620.36435-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] libevent: don't treat test stats line as pass/fail in ptest
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
X-List-Received-Date: Mon, 09 Sep 2019 15:16:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

The libevent "regress" test outputs its own pass/fail results,
e.g. "2/300 TESTS FAILED. (31 skipped)", which will be
miscounted as an extra test fail in the ptest log. Fixed this
to ignore the libevent results line when counting actual
pass/fail results.

Also removed the for loop in run-ptest and targeted only the
libevent "regress" test, as the other tests being run were
related to performance and did not provide a relevant pass/fail
output.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-support/libevent/libevent/run-ptest | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent/run-ptest b/meta/recipes-support/libevent/libevent/run-ptest
index 080806dea9..259fe56fe5 100644
--- a/meta/recipes-support/libevent/libevent/run-ptest
+++ b/meta/recipes-support/libevent/libevent/run-ptest
@@ -10,10 +10,7 @@ LOG="${LIBEVENTLIB}/ptest/libevent_ptest_$(date +%Y%m%d-%H%M%S).log"
 
 cd ${LIBEVENTLIB}/ptest 
 
-for test in ./test/*
-do
-    $test 2>&1| sed -e '/OK/ s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ; /DISABLED/ s/^/SKIP: /' | cut -f1,2 -d ':' | tee -a ${LOG}
-done
+./test/regress 2>&1| sed -e '/TESTS/d' -e '/tests/d' -e '/OK/ s/^/PASS: / ; /FAILED/ s/^/FAIL: / ; /SKIPPED/ s/^/SKIP: / ; /DISABLED/ s/^/SKIP: /' | cut -f1,2 -d ':' | tee -a ${LOG}
 
 passed=`grep PASS ${LOG}|wc -l`
 failed=`grep FAIL ${LOG}|wc -l`
-- 
2.21.0


