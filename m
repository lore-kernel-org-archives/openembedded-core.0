Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 16B967EC56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 13:56:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7JDuZoi017596
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 06:56:35 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 19 Aug 2019 06:56:35 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Aug 2019 21:56:33 +0800
Message-ID: <1566222994-21907-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/2] ltp: Fix tgkill03 failure
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
X-List-Received-Date: Mon, 19 Aug 2019 13:56:38 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Backport a patch to fix the followig failure.
tgkill03.c:94: FAIL: Defunct tid should have failed with ESRCH: SUCCESS

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...kill03-wait-for-defunct-tid-to-get-detach.patch | 75 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb          |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch
new file mode 100644
index 0000000..6ea2615
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch
@@ -0,0 +1,75 @@
+From e747d0456adc080a1d31fb653bda9dc491795c80 Mon Sep 17 00:00:00 2001
+From: Jan Stancek <jstancek@redhat.com>
+Date: Sun, 16 Jun 2019 11:14:16 +0200
+Subject: [PATCH] syscalls/tgkill03: wait for defunct tid to get detached
+
+Case where defunct tid is used has been observed to sporadically fail:
+  tgkill03.c:96: FAIL: Defunct tid should have failed with ESRCH: SUCCESS
+
+glibc __pthread_timedjoin_ex() waits for CLONE_CHILD_CLEARTID to clear tid,
+and then resumes. Kernel clears it (glibc pd->tid) at:
+  do_exit
+    exit_mm
+      mm_release
+        put_user(0, tsk->clear_child_tid);
+
+but kernel tid is still valid, presumably until:
+  release_task
+    __exit_signal
+      __unhash_process
+        detach_pid
+
+To avoid race wait until /proc/<pid>/task/<tid> disappears.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+Reviewed-by: Li Wang <liwang@redhat.com>
+Acked-by: Sumit Garg <sumit.garg@linaro.org>
+
+Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/e747d0456adc080a1d31fb653bda9dc491795c80]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ testcases/kernel/syscalls/tgkill/tgkill03.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/tgkill/tgkill03.c b/testcases/kernel/syscalls/tgkill/tgkill03.c
+index f5bbdc5..593a217 100644
+--- a/testcases/kernel/syscalls/tgkill/tgkill03.c
++++ b/testcases/kernel/syscalls/tgkill/tgkill03.c
+@@ -7,6 +7,7 @@
+ 
+ #include <pthread.h>
+ #include <pwd.h>
++#include <stdio.h>
+ #include <sys/types.h>
+ 
+ #include "tst_safe_pthread.h"
+@@ -42,6 +43,7 @@ static void setup(void)
+ {
+ 	sigset_t sigusr1;
+ 	pthread_t defunct_thread;
++	char defunct_tid_path[PATH_MAX];
+ 
+ 	sigemptyset(&sigusr1);
+ 	sigaddset(&sigusr1, SIGUSR1);
+@@ -55,8 +57,9 @@ static void setup(void)
+ 	TST_CHECKPOINT_WAIT(0);
+ 
+ 	SAFE_PTHREAD_CREATE(&defunct_thread, NULL, defunct_thread_func, NULL);
+-
+ 	SAFE_PTHREAD_JOIN(defunct_thread, NULL);
++	sprintf(defunct_tid_path, "/proc/%d/task/%d", getpid(), defunct_tid);
++	TST_RETRY_FN_EXP_BACKOFF(access(defunct_tid_path, R_OK), -1, 15);
+ }
+ 
+ static void cleanup(void)
+@@ -108,4 +111,5 @@ static struct tst_test test = {
+ 	.setup = setup,
+ 	.cleanup = cleanup,
+ 	.test = run,
++	.timeout = 20,
+ };
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index c62f261..f6c7de6 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0012-getrlimit03-adjust-a-bit-of-code-to-compatiable-with.patch \
            file://0001-Add-configure-time-check-for-getdents-getdents64-API.patch \
            file://0002-check-for-RES_USE_INET6-during-configure.patch \
+           file://0001-syscalls-tgkill03-wait-for-defunct-tid-to-get-detach.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


