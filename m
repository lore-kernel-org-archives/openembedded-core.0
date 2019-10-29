Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42BFA7F8B0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:03:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9T93WqI011362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:03:32 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Tue, 29 Oct 2019 02:03:31 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Oct 2019 17:03:30 +0800
Message-ID: <1572339810-113394-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ltp: Fix overcommit_memory failure
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
X-List-Received-Date: Tue, 29 Oct 2019 09:03:31 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Backport a patch from upstream to fix the following runtime failure.

mem.c:814: INFO: set overcommit_memory to 0
overcommit_memory.c:213: FAIL: alloc passed, expected to fail

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...memory-update-for-mm-fix-false-positive-O.patch | 57 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb          |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch b/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch
new file mode 100644
index 0000000..bed8471
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch
@@ -0,0 +1,57 @@
+From d656a447893dccc310c975a239f482278550c3e0 Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Tue, 21 May 2019 10:10:44 +0200
+Subject: [PATCH] overcommit_memory: update for "mm: fix false-positive
+ OVERCOMMIT_GUESS failures"
+
+commit 8c7829b04c52 ("mm: fix false-positive OVERCOMMIT_GUESS failures")
+changes logic of __vm_enough_memory(), simplifying it to:
+    When in GUESS mode, catch wild allocations by comparing their request
+    size to total amount of ram and swap in the system.
+
+Testcase currently allocates mem_total + swap_total, which doesn't trigger
+new condition. Make it more extreme, but assuming free_total / 2 will PASS,
+and 2*sum_total will FAIL.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
+
+Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/d656a447893dccc310c975a239f482278550c3e0]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ testcases/kernel/mem/tunable/overcommit_memory.c | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/testcases/kernel/mem/tunable/overcommit_memory.c b/testcases/kernel/mem/tunable/overcommit_memory.c
+index 555298f..345764d 100644
+--- a/testcases/kernel/mem/tunable/overcommit_memory.c
++++ b/testcases/kernel/mem/tunable/overcommit_memory.c
+@@ -36,11 +36,10 @@
+  *
+  * The program is designed to test the two tunables:
+  *
+- * When overcommit_memory = 0, allocatable memory can't overextends
+- * the amount of free memory. I choose the three cases:
++ * When overcommit_memory = 0, allocatable memory can't overextend
++ * the amount of total memory:
+  * a. less than free_total:    free_total / 2, alloc should pass.
+- * b. greater than free_total: free_total * 2, alloc should fail.
+- * c. equal to sum_total:      sum_tatal,      alloc should fail
++ * b. greater than sum_total:   sum_total * 2, alloc should fail.
+  *
+  * When overcommit_memory = 1, it can alloc enough much memory, I
+  * choose the three cases:
+@@ -164,9 +163,7 @@ static void overcommit_memory_test(void)
+ 
+ 	update_mem();
+ 	alloc_and_check(free_total / 2, EXPECT_PASS);
+-	update_mem();
+-	alloc_and_check(free_total * 2, EXPECT_FAIL);
+-	alloc_and_check(sum_total, EXPECT_FAIL);
++	alloc_and_check(sum_total * 2, EXPECT_FAIL);
+ 
+ 	/* start to test overcommit_memory=1 */
+ 	set_sys_tune("overcommit_memory", 1, 1);
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index 4650715..5915b1c 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-testcases-use-python3-everywhere-to-run-python-scrip.patch \
            file://0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch \
            file://0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch \
+           file://0001-overcommit_memory-update-for-mm-fix-false-positive-O.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


