Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C03A79E37
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 07:32:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA87WccT026108
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Nov 2018 23:32:49 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 7 Nov 2018 23:32:28 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Nov 2018 02:31:13 -0500
Message-ID: <1541662273-22871-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] ltp: kernel/syscall/setrlimit05.c: use a legal bad address for mips
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
X-List-Received-Date: Thu, 08 Nov 2018 07:32:58 -0000
Content-Type: text/plain

This testcase fails on mips32. The process is killed by SIGBUS which
is not as expect.

This is because:
((void *)-1) is not a legal bad address which causes the process
killed by SIGBUG on mips.

'tst_get_bad_addr()' returns an address that should works on mips
and other arches.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ...t05-Use-another-method-to-get-bad-address.patch | 61 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180515.bb          |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch b/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
new file mode 100644
index 0000000..dd688e4
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
@@ -0,0 +1,61 @@
+From ff1678f02fdf08e8b7cfca4d0d5aa7815b30957c Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Thu, 8 Nov 2018 01:30:53 -0500
+Subject: [PATCH] setrlimit05: Use another method to get bad address
+
+This testcase fails on mips32. The process is killed by SIGBUS which
+is not as expect.
+
+This is because:
+((void *)-1) is not a legal bad address which causes the process
+killed by SIGBUG on mips.
+
+'tst_get_bad_addr()' returns an address that should works on mips
+and other arches.
+
+Upstream-Status: Accepted [80bed467bc6ab48a6cd88a8ab74ca15d08830cb0]
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ testcases/kernel/syscalls/setrlimit/setrlimit05.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/setrlimit/setrlimit05.c b/testcases/kernel/syscalls/setrlimit/setrlimit05.c
+index 7ea7d62..61ac7c6 100644
+--- a/testcases/kernel/syscalls/setrlimit/setrlimit05.c
++++ b/testcases/kernel/syscalls/setrlimit/setrlimit05.c
+@@ -26,6 +26,8 @@
+ 
+ #include "tst_test.h"
+ 
++static void *bad_addr;
++
+ static void verify_setrlimit(void)
+ {
+ 	int status;
+@@ -33,7 +35,7 @@ static void verify_setrlimit(void)
+ 
+ 	pid = SAFE_FORK();
+ 	if (!pid) {
+-		TEST(setrlimit(RLIMIT_NOFILE, (void *) -1));
++		TEST(setrlimit(RLIMIT_NOFILE, bad_addr));
+ 		if (TEST_RETURN != -1) {
+ 			tst_res(TFAIL, "setrlimit()  succeeded unexpectedly");
+ 			exit(0);
+@@ -67,7 +69,13 @@ static void verify_setrlimit(void)
+ 	tst_res(TBROK, "child %s", tst_strstatus(status));
+ }
+ 
++static void setup(void)
++{
++	bad_addr = tst_get_bad_addr(NULL);
++}
++
+ static struct tst_test test = {
+ 	.test_all = verify_setrlimit,
+ 	.forks_child = 1,
++	.setup = setup,
+ };
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
index ff85be7..240222e 100644
--- a/meta/recipes-extended/ltp/ltp_20180515.bb
+++ b/meta/recipes-extended/ltp/ltp_20180515.bb
@@ -56,6 +56,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-sigwaitinfo01-recent-glibc-calls-syscall-directly.patch \
            file://0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch \
            file://0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
+		   file://0001-setrlimit05-Use-another-method-to-get-bad-address.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.8.1


