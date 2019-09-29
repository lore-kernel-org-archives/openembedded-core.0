Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E50A97D419
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 12:33:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x8TCXjT9019826
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 05:33:45 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 29 Sep 2019 05:33:27 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 29 Sep 2019 20:33:25 +0800
Message-ID: <1569760405-324262-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ltp: Fix hang of cve test cases
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
X-List-Received-Date: Sun, 29 Sep 2019 12:33:45 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Backport a patch to the fix possible hang caused by the case of cve-2017-17052.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...-2017-17052-Avoid-unsafe-exits-in-threads.patch | 62 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20190517.bb          |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch b/meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch
new file mode 100644
index 0000000..1b66238
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch
@@ -0,0 +1,62 @@
+From e3a8502d0a4f8a44ddd02ca4b2efc097133fb9f7 Mon Sep 17 00:00:00 2001
+From: Mathias Fiedler <mathias.fiedler@aox-tech.de>
+Date: Fri, 23 Aug 2019 12:46:48 +0200
+Subject: [PATCH] cve-2017-17052: Avoid unsafe exits in threads
+
+According to manpage exit(3) calling exit is not thread-safe.
+And with glibc 2.28 (and probably also with glibc >=2.27) sometimes
+child processes created in fork_thread can get stuck on process exit in
+glibc's __run_exit_handlers trying to acquire some lock which was in
+locked state while the fork was created. This can happen when exit is
+called in mmap_thread concurrently to the fork.
+While the main process will still return with PASSED some of its
+children are left behind.
+
+Comparing the source code with the original program as described in the
+commit 2b7e8665b4ff51c034c55df3cff76518d1a9ee3a of linux kernel >=4.13
+the exits in mmap_thread and fork_thread should not be necessary to
+trigger the original bug.
+
+Therefore those exit calls are removed. The mmap_thread and fork_thread
+should still exit when their corresponding main thread in do_test_fork
+calls exit_group. The remaining exit in do_test_fork will be called in
+the main thread without any concurrent thread in the same process.
+
+Signed-off-by: Mathias Fiedler <mathias.fiedler@aox-tech.de>
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
+Acked-by: Jan Stancek <jstancek@redhat.com>
+
+Upstream-Status: Backport
+[https://github.com/linux-test-project/ltp/commit/9f0b452c1af4bcb54da35711eb3fa77334a350b4]
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ testcases/cve/cve-2017-17052.c | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/testcases/cve/cve-2017-17052.c b/testcases/cve/cve-2017-17052.c
+index d7da7e919..18cd2a6d7 100644
+--- a/testcases/cve/cve-2017-17052.c
++++ b/testcases/cve/cve-2017-17052.c
+@@ -58,8 +58,6 @@ static void *mmap_thread(void *arg)
+ 	for (;;) {
+ 		SAFE_MMAP(NULL, 0x1000000, PROT_READ,
+ 				MAP_POPULATE|MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+-		if (*do_exit)
+-			exit(0);
+ 	}
+ 
+ 	return arg;
+@@ -67,9 +65,6 @@ static void *mmap_thread(void *arg)
+ 
+ static void *fork_thread(void *arg)
+ {
+-	if (*do_exit)
+-		exit(0);
+-
+ 	usleep(rand() % 10000);
+ 	SAFE_FORK();
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20190517.bb b/meta/recipes-extended/ltp/ltp_20190517.bb
index e9a588f..4650715 100644
--- a/meta/recipes-extended/ltp/ltp_20190517.bb
+++ b/meta/recipes-extended/ltp/ltp_20190517.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-cve-meltdown.c-Fix-kernel-symbol-finding.patch \
            file://0001-testcases-use-python3-everywhere-to-run-python-scrip.patch \
            file://0001-syscall-rt_sigtimedwait01-Fix-wrong-sigset-length-fo.patch \
+           file://0001-cve-2017-17052-Avoid-unsafe-exits-in-threads.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


