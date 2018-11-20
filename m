Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C16A6C335
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 09:43:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAK9h20q006284
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 01:43:12 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 20 Nov 2018 01:42:52 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Nov 2018 01:42:51 -0800
Message-ID: <20181120094251.8461-2-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181120094251.8461-1-hongzhi.song@windriver.com>
References: <20181120094251.8461-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [V2 PATCH 1/1] ltp: Use a legal bad address for mips in setrlimit05.c
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
X-List-Received-Date: Tue, 20 Nov 2018 09:43:22 -0000
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
 meta/recipes-extended/ltp/ltp_20180926.bb          |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch b/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
new file mode 100644
index 0000000000..4bfe2767d8
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-setrlimit05-Use-another-method-to-get-bad-address.patch
@@ -0,0 +1,61 @@
+From c4d02b23d12b7136b5739b3075e817fc037e41d4 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Mon, 19 Nov 2018 23:07:01 -0800
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
+index e7167229b4..004a149a65 100644
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
+ 		if (TST_RET != -1) {
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
+2.11.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20180926.bb b/meta/recipes-extended/ltp/ltp_20180926.bb
index 622c1f42f7..00e2c05cb6 100644
--- a/meta/recipes-extended/ltp/ltp_20180926.bb
+++ b/meta/recipes-extended/ltp/ltp_20180926.bb
@@ -52,6 +52,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-netns_helper.sh-use-ping-6-when-ping6-is-not-avaliab.patch \
            file://0001-open_posix_testsuite-mmap24-2-Relax-condition-a-bit.patch \
            file://0001-statx-fix-compile-errors.patch \
+		   file://0001-setrlimit05-Use-another-method-to-get-bad-address.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.11.0


