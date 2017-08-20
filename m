Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C61BE7198F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Aug 2017 13:22:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7KDM8JU016942
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Aug 2017 06:22:08 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 20 Aug 2017 06:22:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 20 Aug 2017 21:21:28 +0800
Message-ID: <20170820132128.5076-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] valgrind: improvements for run-ptest
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
X-List-Received-Date: Sun, 20 Aug 2017 13:22:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Add statistic summary for run-ptest
* Ensure the script can be run anywhere

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/valgrind/valgrind/run-ptest | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index f9a72ec4a9..447d33c8cb 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -2,11 +2,24 @@
 
 # run-ptest - 'ptest' test infrastructure shell script that
 #   wraps the valgrind regression script vg_regtest. 
-#   Must be run in the /usr/lib/valgrind/ptest directory. 
 #
 # Dave Lerner <dave.lerner@windriver.com>
 ###############################################################
 VALGRINDLIB=@libdir@/valgrind
-tests/vg_regtest --all \
+LOG="${VALGRINDLIB}/ptest/valgrind_ptest_$(date +%Y%m%d-%H%M%S).log"
+
+cd ${VALGRINDLIB}/ptest && ./tests/vg_regtest --all \
     --valgrind=/usr/bin/valgrind --valgrind-lib=$VALGRINDLIB \
-	--yocto-ptest
+    --yocto-ptest 2>&1|tee ${LOG}
+
+passed=`grep PASS: ${LOG}|wc -l`
+failed=`grep FAIL: ${LOG}|wc -l`
+skipped=`grep SKIP: ${LOG}|wc -l`
+all=$((passed + failed + skipped))
+
+( echo "=== Test Summary ==="
+  echo "TOTAL: ${all}"
+  echo "PASSED: ${passed}"
+  echo "FAILED: ${failed}"
+  echo "SKIPPED: ${skipped}"
+) | tee -a /${LOG}
-- 
2.11.0


