Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F1C616093C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 23:31:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Oct 2017 16:30:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,486,1500966000"; d="scan'208";a="1179528070"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 06 Oct 2017 16:30:54 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 16:30:46 -0700
Message-Id: <1507332646-37100-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] e2fsprogs: modify ptest script
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
X-List-Received-Date: Fri, 06 Oct 2017 23:31:08 -0000

e2fsprog testsuite used to log results into its own log file into
/usr/lib/e2fsprogs/ptest/test.log. Therefore console output was not available and
redirecting ptest-runner output into a log file would not capture output of any
individual tests. So overall the whole e2fsprogs testsuite consisting of about
300 tests was evaluated as a single test.

This patch ensures the e2fsprogs test_script output is not automatically redirected
while executing during run-ptest. Any redirection is up to the user.
Additionally, the results of tests are prefixed by more canonical "PASS:" FAIL:"
based on the actual test results.

Aditionally, remove various files created by the testsuite.

[YOCTO #12146]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index e02fc7f..ef10b08 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -1,11 +1,10 @@
 #!/bin/sh
 
 cd ./test
-./test_script &>../test.log
-if [ $? -eq 0 ]
-then
-	echo "PASS: e2fsprogs"
-	rm ../test.log
-else
-	echo "FAIL: e2fsprogs"
-fi
+./test_script | sed -u -e '/:[[:space:]]ok/s/^/PASS: /' -e '/:[[:space:]]failed/s/^/FAIL: /' -e '/:[[:space:]]skipped/s/^/SKIP: /'
+rm -rf /var/volatile/tmp/*e2fsprogs*
+rm -f tmp-*
+rm -f *.tmp
+rm -f *.ok
+rm -f *.failed
+rm -f *.log
-- 
2.7.4


