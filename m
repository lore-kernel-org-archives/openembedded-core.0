Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2975C78269
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 07:38:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7B7d1h3007841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 00:39:01 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 11 Aug 2017 00:39:00 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Aug 2017 03:38:57 -0400
Message-ID: <47a3dacfb97042a9a06500247ce8de1e8dbc4883.1502436943.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1502436943.git.dengke.du@windriver.com>
References: <cover.1502436943.git.dengke.du@windriver.com>
Subject: [PATCH V3 1/1] ltp: upgrade to upstream latest commit on 20170804
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
X-List-Received-Date: Fri, 11 Aug 2017 07:39:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

1. Drop 4 patches because the upstream already contains them:

    0001-dirtyc0w-Include-stdint.h.patch
    0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
    0037-faccessat-and-fchmodat-Fix-build-warnings.patch
    0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch

2. Drop the do_compile_prepend function, because the upstream already fix
   the parallel make race, we can check it here:

    https://github.com/linux-test-project/ltp/commit/3f385652efe811fe7491474f8513baf44cf0a12d

3. Fix PAGE_SIZE redefinition and O_CREAT undeclear build failures when using musl

4. Fix runtime failed case file01

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch   |  34 ------
 ...TH_MAX-undeclared-when-building-with-musl.patch |  31 -----
 ...faccessat-and-fchmodat-Fix-build-warnings.patch |  68 -----------
 ...E_SIZE-redefinition-and-O_CREAT-undeclear.patch | 113 +++++++++++++++++
 ...d_key02-update-to-test-fix-for-nonempty-N.patch | 136 ---------------------
 meta/recipes-extended/ltp/ltp_20170516.bb          |  18 +--
 6 files changed, 115 insertions(+), 285 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch b/meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
deleted file mode 100644
index 5c73be4..0000000
--- a/meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 1b30d8dac1a37dc0abbb3b545db2824d6489e23f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 9 Jun 2017 09:32:13 -0700
-Subject: [PATCH] dirtyc0w: Include stdint.h
-
-uintptr_t is defined in stdint.h
-
-Fixes
-| dirtyc0w_child.c:76:15: error: 'uintptr_t' undeclared (first use in this function); did you mean 'intptr_t'?
-|    lseek(mfd, (uintptr_t) map, SEEK_SET);
-|                ^~~~~~~~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- testcases/kernel/security/dirtyc0w/dirtyc0w_child.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c b/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
-index 5328a9bc4..49abdd6ba 100644
---- a/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
-+++ b/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
-@@ -23,6 +23,7 @@
- #include <sys/stat.h>
- #include <string.h>
- #include <stdlib.h>
-+#include <stdint.h>
- #include <pwd.h>
- 
- #include "tst_safe_pthread.h"
--- 
-2.13.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch b/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
deleted file mode 100644
index 020ddfe..0000000
--- a/meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b906ec2fe4711a727e198cd9259287c042eef8e2 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Thu, 9 Feb 2017 16:41:12 +0800
-Subject: [PATCH] fix PATH_MAX undeclared when building with musl
-
-fix PATH_MAX undeclared when building with musl.
-
-Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/176]
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- include/tst_test.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/include/tst_test.h b/include/tst_test.h
-index 335c82684..4dfa1511b 100644
---- a/include/tst_test.h
-+++ b/include/tst_test.h
-@@ -23,6 +23,9 @@
- #endif /* __TEST_H__ */
- 
- #include <unistd.h>
-+#ifndef __GLIBC__
-+#include <limits.h>
-+#endif
- 
- #include "tst_common.h"
- #include "tst_res_flags.h"
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch b/meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch
deleted file mode 100644
index 99497d6..0000000
--- a/meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 4141bdb441f7576a2e73abeb2a0fb1c7b8bd8647 Mon Sep 17 00:00:00 2001
-From: Naresh Kamboju <naresh.kamboju@linaro.org>
-Date: Mon, 19 Jun 2017 19:01:21 +0530
-Subject: [PATCH 1/7] faccessat and fchmodat: Fix build warnings
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixing below build warnings.
-
-ltp-full-20170516/testcases/kernel/syscalls/faccessat$ make
-In file included from ../../../../include/old/test.h:51:0,
-                 from faccessat01.c:44:
-faccessat01.c: In function ‘setup’:
-../../../../include/old/old_safe_file_ops.h:55:27:
-warning: format not a string literal and no format arguments [-Wformat-security]
-                   (path), (fmt), ## __VA_ARGS__)
-                           ^
-faccessat01.c:132:2: note: in expansion of macro ‘SAFE_FILE_PRINTF’
-  SAFE_FILE_PRINTF(cleanup, testfile, testfile);
-  ^
-../../../../include/old/old_safe_file_ops.h:55:27:
-warning: format not a string literal and no format arguments [-Wformat-security]
-                   (path), (fmt), ## __VA_ARGS__)
-                           ^
-faccessat01.c:133:2: note: in expansion of macro ‘SAFE_FILE_PRINTF’
-  SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
-
-Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>
-Upstream-Status: Accepted [https://github.com/linux-test-project/ltp/commit/4141bdb441f7576a2e73abeb2a0fb1c7b8bd8647]
----
- testcases/kernel/syscalls/faccessat/faccessat01.c | 4 ++--
- testcases/kernel/syscalls/fchmodat/fchmodat01.c   | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/faccessat/faccessat01.c b/testcases/kernel/syscalls/faccessat/faccessat01.c
-index 622dfd3b0..def7fa755 100644
---- a/testcases/kernel/syscalls/faccessat/faccessat01.c
-+++ b/testcases/kernel/syscalls/faccessat/faccessat01.c
-@@ -129,8 +129,8 @@ void setup(void)
- 	fds[0] = SAFE_OPEN(cleanup, pathname, O_DIRECTORY);
- 	fds[1] = fds[4] = fds[0];
- 
--	SAFE_FILE_PRINTF(cleanup, testfile, testfile);
--	SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
-+	SAFE_FILE_PRINTF(cleanup, testfile, "%s", testfile);
-+	SAFE_FILE_PRINTF(cleanup, testfile2, "%s", testfile2);
- 
- 	fds[2] = SAFE_OPEN(cleanup, testfile3, O_CREAT | O_RDWR, 0600);
- 
-diff --git a/testcases/kernel/syscalls/fchmodat/fchmodat01.c b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
-index 6bf66d8b8..7856ed3fa 100644
---- a/testcases/kernel/syscalls/fchmodat/fchmodat01.c
-+++ b/testcases/kernel/syscalls/fchmodat/fchmodat01.c
-@@ -127,8 +127,8 @@ void setup(void)
- 	fds[0] = SAFE_OPEN(cleanup, pathname, O_DIRECTORY);
- 	fds[1] = fds[4] = fds[0];
- 
--	SAFE_FILE_PRINTF(cleanup, testfile, testfile);
--	SAFE_FILE_PRINTF(cleanup, testfile2, testfile2);
-+	SAFE_FILE_PRINTF(cleanup, testfile, "%s", testfile);
-+	SAFE_FILE_PRINTF(cleanup, testfile2, "%s", testfile2);
- 
- 	fds[2] = SAFE_OPEN(cleanup, testfile3, O_CREAT | O_RDWR, 0600);
- 	fds[3] = 100;
--- 
-2.13.0
-
diff --git a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch b/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
new file mode 100644
index 0000000..c8738ae
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
@@ -0,0 +1,113 @@
+From a9d5595d2fa2ab252f1cabf63f4b65c3efbafeb9 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Thu, 10 Aug 2017 15:27:03 +0800
+Subject: [PATCH] ltp: fix PAGE_SIZE redefinition and O_CREAT undeclear when
+ build with musl
+
+error 1:
+
+|stack_clash.c:50:22: error: expected identifier or '(' before numeric constant
+| static unsigned long PAGE_SIZE;
+
+This is because the musl libc already contain PAGE_SIZE definition in limits.c,
+we can check it here:
+
+    https://git.musl-libc.org/cgit/musl/tree/include/limits.h#n43
+
+error 2:
+
+|ck01.c:157:22: error: 'O_CREAT' undeclared (first use in this function); did you mean 'S_IREAD'?
+|   fd = open(filename, O_CREAT | O_TRUNC | O_RDWR, 0644);
+|                       ^~~~~~~
+|                       S_IREAD
+
+This is because the musl libc put those in fcntl.h, so we should include that
+file.
+
+Upstream-Status: Submitted [ https://github.com/linux-test-project/ltp/pull/194 ]
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ testcases/cve/stack_clash.c               | 12 ++++++------
+ testcases/kernel/syscalls/flock/flock01.c |  1 +
+ testcases/kernel/syscalls/flock/flock02.c |  1 +
+ 3 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/testcases/cve/stack_clash.c b/testcases/cve/stack_clash.c
+index 2ef1a82..7c45991 100644
+--- a/testcases/cve/stack_clash.c
++++ b/testcases/cve/stack_clash.c
+@@ -47,7 +47,7 @@
+ #include "tst_test.h"
+ #include "tst_safe_stdio.h"
+ 
+-static unsigned long PAGE_SIZE;
++static unsigned long PAGE_SIZE_tst;
+ static unsigned long PAGE_MASK;
+ static unsigned long GAP_PAGES = 256;
+ static unsigned long THRESHOLD;
+@@ -66,7 +66,7 @@ void exhaust_stack_into_sigsegv(void)
+ 	exhaust_stack_into_sigsegv();
+ }
+ 
+-#define MAPPED_LEN PAGE_SIZE
++#define MAPPED_LEN PAGE_SIZE_tst
+ static unsigned long mapped_addr;
+ 
+ void segv_handler(int sig, siginfo_t *info, void *data LTP_ATTRIBUTE_UNUSED)
+@@ -150,7 +150,7 @@ void do_child(void)
+ 	stack_t signal_stack;
+ 	struct sigaction segv_sig = {.sa_sigaction = segv_handler, .sa_flags = SA_ONSTACK|SA_SIGINFO};
+ 	void *map;
+-	unsigned long gap = GAP_PAGES * PAGE_SIZE;
++	unsigned long gap = GAP_PAGES * PAGE_SIZE_tst;
+ 	struct rlimit rlimit;
+ 
+ 	rlimit.rlim_cur = rlimit.rlim_max = RLIM_INFINITY;
+@@ -200,8 +200,8 @@ void setup(void)
+ {
+ 	char buf[4096], *p;
+ 
+-	PAGE_SIZE = sysconf(_SC_PAGESIZE);
+-	PAGE_MASK = ~(PAGE_SIZE - 1);
++	PAGE_SIZE_tst = sysconf(_SC_PAGESIZE);
++	PAGE_MASK = ~(PAGE_SIZE_tst - 1);
+ 
+ 	buf[4095] = '\0';
+ 	SAFE_FILE_SCANF("/proc/cmdline", "%4095[^\n]", buf);
+@@ -214,7 +214,7 @@ void setup(void)
+ 		tst_res(TINFO, "stack_guard_gap = %ld", GAP_PAGES);
+ 	}
+ 
+-	THRESHOLD = (GAP_PAGES - 1) * PAGE_SIZE;
++	THRESHOLD = (GAP_PAGES - 1) * PAGE_SIZE_tst;
+ 
+ 	{
+ 		volatile int *a = alloca(128);
+diff --git a/testcases/kernel/syscalls/flock/flock01.c b/testcases/kernel/syscalls/flock/flock01.c
+index 3e17be4..06d89e3 100644
+--- a/testcases/kernel/syscalls/flock/flock01.c
++++ b/testcases/kernel/syscalls/flock/flock01.c
+@@ -69,6 +69,7 @@
+ #include <stdio.h>
+ #include <sys/wait.h>
+ #include <sys/file.h>
++#include <fcntl.h>
+ #include "test.h"
+ 
+ void setup(void);
+diff --git a/testcases/kernel/syscalls/flock/flock02.c b/testcases/kernel/syscalls/flock/flock02.c
+index 414df68..9ddf729 100644
+--- a/testcases/kernel/syscalls/flock/flock02.c
++++ b/testcases/kernel/syscalls/flock/flock02.c
+@@ -75,6 +75,7 @@
+ #include <sys/types.h>
+ #include <sys/file.h>
+ #include <sys/wait.h>
++#include <fcntl.h>
+ #include <errno.h>
+ #include <stdio.h>
+ #include "test.h"
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch b/meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
deleted file mode 100644
index 3759e1f..0000000
--- a/meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-From 25045624e941ee76a13febd36187e23c6c435507 Mon Sep 17 00:00:00 2001
-From: Eric Biggers <ebiggers@google.com>
-Date: Mon, 12 Jun 2017 11:55:21 -0700
-Subject: [PATCH 01/39] syscalls/add_key02: update to test fix for nonempty
- NULL payload
-
-add_key02 was supposed to be a "Basic test for the add_key() syscall",
-but it actually happened to test the obscure case of passing a NULL
-payload with nonzero length.  This case was mishandled by the kernel,
-which either returned EINVAL or crashed with a NULL pointer dereference,
-depending on the key type.  (The former applied to the test, as it used
-the "user" key type.)  The expected behavior in this case is that the
-syscall fail with EFAULT.
-
-Update the test to expect the fixed behavior from v4.12-rc5, and make
-the test more thorough by testing additional key types, including ones
-that caused a NULL pointer dereference in unfixed kernels.
-
-Signed-off-by: Eric Biggers <ebiggers@google.com>
-Upstream-Status: Accepted [https://github.com/linux-test-project/ltp/commit/25045624e941ee76a13febd36187e23c6c435507]
----
- testcases/kernel/syscalls/add_key/add_key02.c | 69 ++++++++++++++++++++-------
- 1 file changed, 51 insertions(+), 18 deletions(-)
-
-diff --git a/testcases/kernel/syscalls/add_key/add_key02.c b/testcases/kernel/syscalls/add_key/add_key02.c
-index 866800d6f..2e3308dcd 100644
---- a/testcases/kernel/syscalls/add_key/add_key02.c
-+++ b/testcases/kernel/syscalls/add_key/add_key02.c
-@@ -1,5 +1,6 @@
- /******************************************************************************
-  * Copyright (c) Crackerjack Project., 2007				      *
-+ * Copyright (c) 2017 Google, Inc.                                            *
-  *									      *
-  * This program is free software;  you can redistribute it and/or modify      *
-  * it under the terms of the GNU General Public License as published by       *
-@@ -18,10 +19,17 @@
-  ******************************************************************************/
- 
- /*
-- * Basic test for the add_key() syscall.
-+ * Test that the add_key() syscall correctly handles a NULL payload with nonzero
-+ * length.  Specifically, it should fail with EFAULT rather than oopsing the
-+ * kernel with a NULL pointer dereference or failing with EINVAL, as it did
-+ * before (depending on the key type).  This is a regression test for commit
-+ * 5649645d725c ("KEYS: fix dereferencing NULL payload with nonzero length").
-  *
-- * History:   Porting from Crackerjack to LTP is done by
-- *	      Manas Kumar Nayak maknayak@in.ibm.com>
-+ * Note that none of the key types that exhibited the NULL pointer dereference
-+ * are guaranteed to be built into the kernel, so we just test as many as we
-+ * can, in the hope of catching one.  We also test with the "user" key type for
-+ * good measure, although it was one of the types that failed with EINVAL rather
-+ * than dereferencing NULL.
-  */
- 
- #include "config.h"
-@@ -33,36 +41,61 @@
- 
- #ifdef HAVE_LINUX_KEYCTL_H
- struct tcase {
--	char *type;
--	char *desc;
--	void *payload;
--	int plen;
--	int exp_errno;
-+	const char *type;
-+	size_t plen;
- } tcases[] = {
--	{"user", "firstkey", NULL, 1, EINVAL}
-+	/*
-+	 * The payload length we test for each key type needs to pass initial
-+	 * validation but is otherwise arbitrary.  Note: the "rxrpc_s" key type
-+	 * requires a payload of exactly 8 bytes.
-+	 */
-+	{ "asymmetric",		64 },
-+	{ "cifs.idmap",		64 },
-+	{ "cifs.spnego",	64 },
-+	{ "pkcs7_test",		64 },
-+	{ "rxrpc",		64 },
-+	{ "rxrpc_s",		 8 },
-+	{ "user",		64 },
- };
- #endif /* HAVE_LINUX_KEYCTL_H */
- 
- static void verify_add_key(unsigned int i)
- {
- #ifdef HAVE_LINUX_KEYCTL_H
--	TEST(tst_syscall(__NR_add_key, tcases[i].type, tcases[i].desc,
--	                 tcases[i].payload, tcases[i].plen,
--	                 KEY_SPEC_USER_KEYRING));
-+	TEST(tst_syscall(__NR_add_key, tcases[i].type, "abc:def",
-+			 NULL, tcases[i].plen, KEY_SPEC_PROCESS_KEYRING));
- 
- 	if (TEST_RETURN != -1) {
--		tst_res(TFAIL, "add_key() passed unexpectedly");
-+		tst_res(TFAIL,
-+			"add_key() with key type '%s' unexpectedly succeeded",
-+			tcases[i].type);
- 		return;
- 	}
- 
--	if (TEST_ERRNO == tcases[i].exp_errno) {
--		tst_res(TPASS | TTERRNO, "add_key() failed expectedly");
-+	if (TEST_ERRNO == EFAULT) {
-+		tst_res(TPASS, "received expected EFAULT with key type '%s'",
-+			tcases[i].type);
- 		return;
- 	}
- 
--	tst_res(TFAIL | TTERRNO,
--	        "add_key() failed unexpectedly, expected %s",
--	        tst_strerrno(tcases[i].exp_errno));
-+	if (TEST_ERRNO == ENODEV) {
-+		tst_res(TCONF, "kernel doesn't support key type '%s'",
-+			tcases[i].type);
-+		return;
-+	}
-+
-+	/*
-+	 * It's possible for the "asymmetric" key type to be supported, but with
-+	 * no asymmetric key parsers registered.  In that case, attempting to
-+	 * add a key of type asymmetric will fail with EBADMSG.
-+	 */
-+	if (TEST_ERRNO == EBADMSG && !strcmp(tcases[i].type, "asymmetric")) {
-+		tst_res(TCONF, "no asymmetric key parsers are registered");
-+		return;
-+	}
-+
-+	tst_res(TFAIL | TTERRNO, "unexpected error with key type '%s'",
-+		tcases[i].type);
- #else
- 	tst_brk(TCONF, "linux/keyctl.h was missing upon compilation.");
- #endif /* HAVE_LINUX_KEYCTL_H */
--- 
-2.13.0
-
diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
index 86b8012..665e08f 100644
--- a/meta/recipes-extended/ltp/ltp_20170516.bb
+++ b/meta/recipes-extended/ltp/ltp_20170516.bb
@@ -21,7 +21,7 @@ DEPENDS_append_libc-musl = " fts "
 EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "6c6c6ca40afb3611e52486f670085762ff451e91"
+SRCREV = "18916a2e6d8c997b7b29dcfa9550d5a15b22ed22"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
@@ -29,7 +29,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0003-Add-knob-to-control-tirpc-support.patch \
            file://0004-build-Add-option-to-select-libc-implementation.patch \
            file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
-           file://0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch \
            file://0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch \
            file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
            file://0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch \
@@ -49,9 +48,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0034-periodic_output.patch \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
-           file://0001-dirtyc0w-Include-stdint.h.patch \
-           file://0037-faccessat-and-fchmodat-Fix-build-warnings.patch \
-           file://0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch \
+           file://0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -69,14 +66,6 @@ EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite "
 # ltp network/rpc test cases ftbfs when libtirpc is found
 EXTRA_OECONF += " --without-tirpc "
 
-# The makefiles make excessive use of make -C and several include testcases.mk
-# which triggers a build of the syscall header. To reproduce, build ltp,
-# then delete the header, then "make -j XX" and watch regen.sh run multiple
-# times. Its easier to generate this once here instead.
-do_compile_prepend () {
-	( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
-}
-
 do_install(){
     install -d ${D}/opt/ltp/
     oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
@@ -89,9 +78,6 @@ do_install(){
     # OSDL's Scaleable Test Platform, but now http://khack.osdl.org unaccessible
     rm -rf ${D}/opt/ltp/bin/STPfailure_report.pl
 
-    # In oe-core, we doesn't support ksh and csh now, so remove in.csh and in.ksh.
-    rm ${D}/opt/ltp/testcases/data/file01/in.csh
-    rm ${D}/opt/ltp/testcases/data/file01/in.ksh
     # Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
     cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
 }
-- 
2.8.1


