Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3C67833F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 03:04:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9J34Q2Q010383
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 20:04:26 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 18 Oct 2017 20:04:24 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Oct 2017 23:04:22 -0400
Message-ID: <fa5df1e778ba445c439d4dddcccd73f450b29553.1508381865.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1508381865.git.dengke.du@windriver.com>
References: <cover.1508381865.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ltp: upgrade to 20170929
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
X-List-Received-Date: Thu, 19 Oct 2017 03:04:25 -0000
Content-Type: text/plain

delete two patches, because upstream already contain those:

    0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
    0038-commands-gdb01-replace-stdin-with-dev-null.patch

add one patch, fix build when set the DISTRO to poky-lsb:

    0037-ltp-fix-format-security-error.patch

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...E_SIZE-redefinition-and-O_CREAT-undeclear.patch | 113 ---------------------
 .../ltp/0037-ltp-fix-format-security-error.patch   |  36 +++++++
 ...ommands-gdb01-replace-stdin-with-dev-null.patch |  34 -------
 .../ltp/{ltp_20170516.bb => ltp_20170929.bb}       |   5 +-
 4 files changed, 38 insertions(+), 150 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0037-ltp-fix-format-security-error.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
 rename meta/recipes-extended/ltp/{ltp_20170516.bb => ltp_20170929.bb} (96%)

diff --git a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch b/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
deleted file mode 100644
index c8738ae..0000000
--- a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From a9d5595d2fa2ab252f1cabf63f4b65c3efbafeb9 Mon Sep 17 00:00:00 2001
-From: Dengke Du <dengke.du@windriver.com>
-Date: Thu, 10 Aug 2017 15:27:03 +0800
-Subject: [PATCH] ltp: fix PAGE_SIZE redefinition and O_CREAT undeclear when
- build with musl
-
-error 1:
-
-|stack_clash.c:50:22: error: expected identifier or '(' before numeric constant
-| static unsigned long PAGE_SIZE;
-
-This is because the musl libc already contain PAGE_SIZE definition in limits.c,
-we can check it here:
-
-    https://git.musl-libc.org/cgit/musl/tree/include/limits.h#n43
-
-error 2:
-
-|ck01.c:157:22: error: 'O_CREAT' undeclared (first use in this function); did you mean 'S_IREAD'?
-|   fd = open(filename, O_CREAT | O_TRUNC | O_RDWR, 0644);
-|                       ^~~~~~~
-|                       S_IREAD
-
-This is because the musl libc put those in fcntl.h, so we should include that
-file.
-
-Upstream-Status: Submitted [ https://github.com/linux-test-project/ltp/pull/194 ]
-
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- testcases/cve/stack_clash.c               | 12 ++++++------
- testcases/kernel/syscalls/flock/flock01.c |  1 +
- testcases/kernel/syscalls/flock/flock02.c |  1 +
- 3 files changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/testcases/cve/stack_clash.c b/testcases/cve/stack_clash.c
-index 2ef1a82..7c45991 100644
---- a/testcases/cve/stack_clash.c
-+++ b/testcases/cve/stack_clash.c
-@@ -47,7 +47,7 @@
- #include "tst_test.h"
- #include "tst_safe_stdio.h"
- 
--static unsigned long PAGE_SIZE;
-+static unsigned long PAGE_SIZE_tst;
- static unsigned long PAGE_MASK;
- static unsigned long GAP_PAGES = 256;
- static unsigned long THRESHOLD;
-@@ -66,7 +66,7 @@ void exhaust_stack_into_sigsegv(void)
- 	exhaust_stack_into_sigsegv();
- }
- 
--#define MAPPED_LEN PAGE_SIZE
-+#define MAPPED_LEN PAGE_SIZE_tst
- static unsigned long mapped_addr;
- 
- void segv_handler(int sig, siginfo_t *info, void *data LTP_ATTRIBUTE_UNUSED)
-@@ -150,7 +150,7 @@ void do_child(void)
- 	stack_t signal_stack;
- 	struct sigaction segv_sig = {.sa_sigaction = segv_handler, .sa_flags = SA_ONSTACK|SA_SIGINFO};
- 	void *map;
--	unsigned long gap = GAP_PAGES * PAGE_SIZE;
-+	unsigned long gap = GAP_PAGES * PAGE_SIZE_tst;
- 	struct rlimit rlimit;
- 
- 	rlimit.rlim_cur = rlimit.rlim_max = RLIM_INFINITY;
-@@ -200,8 +200,8 @@ void setup(void)
- {
- 	char buf[4096], *p;
- 
--	PAGE_SIZE = sysconf(_SC_PAGESIZE);
--	PAGE_MASK = ~(PAGE_SIZE - 1);
-+	PAGE_SIZE_tst = sysconf(_SC_PAGESIZE);
-+	PAGE_MASK = ~(PAGE_SIZE_tst - 1);
- 
- 	buf[4095] = '\0';
- 	SAFE_FILE_SCANF("/proc/cmdline", "%4095[^\n]", buf);
-@@ -214,7 +214,7 @@ void setup(void)
- 		tst_res(TINFO, "stack_guard_gap = %ld", GAP_PAGES);
- 	}
- 
--	THRESHOLD = (GAP_PAGES - 1) * PAGE_SIZE;
-+	THRESHOLD = (GAP_PAGES - 1) * PAGE_SIZE_tst;
- 
- 	{
- 		volatile int *a = alloca(128);
-diff --git a/testcases/kernel/syscalls/flock/flock01.c b/testcases/kernel/syscalls/flock/flock01.c
-index 3e17be4..06d89e3 100644
---- a/testcases/kernel/syscalls/flock/flock01.c
-+++ b/testcases/kernel/syscalls/flock/flock01.c
-@@ -69,6 +69,7 @@
- #include <stdio.h>
- #include <sys/wait.h>
- #include <sys/file.h>
-+#include <fcntl.h>
- #include "test.h"
- 
- void setup(void);
-diff --git a/testcases/kernel/syscalls/flock/flock02.c b/testcases/kernel/syscalls/flock/flock02.c
-index 414df68..9ddf729 100644
---- a/testcases/kernel/syscalls/flock/flock02.c
-+++ b/testcases/kernel/syscalls/flock/flock02.c
-@@ -75,6 +75,7 @@
- #include <sys/types.h>
- #include <sys/file.h>
- #include <sys/wait.h>
-+#include <fcntl.h>
- #include <errno.h>
- #include <stdio.h>
- #include "test.h"
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp/0037-ltp-fix-format-security-error.patch b/meta/recipes-extended/ltp/ltp/0037-ltp-fix-format-security-error.patch
new file mode 100644
index 0000000..44d6990
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0037-ltp-fix-format-security-error.patch
@@ -0,0 +1,36 @@
+From 8eb3e111ae1b89e5afb249cf984d657f94da2385 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Tue, 17 Oct 2017 05:42:47 -0400
+Subject: [PATCH] ltp: fix format security error
+
+When enable option: -Werror=format-security, the error like:
+
+    | fcntl36.c: In function 'test_fn':
+    | fcntl36.c:303:2: error: format not a string literal and no format arguments [-Werror=format-security]
+    |   tst_res(TINFO, msg);
+    |   ^~~~~~~
+    | cc1: some warnings being treated as errors
+
+Upstream-Status: Pending
+
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ testcases/kernel/syscalls/fcntl/fcntl36.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/syscalls/fcntl/fcntl36.c b/testcases/kernel/syscalls/fcntl/fcntl36.c
+index 6f2eb6b..3246d13 100644
+--- a/testcases/kernel/syscalls/fcntl/fcntl36.c
++++ b/testcases/kernel/syscalls/fcntl/fcntl36.c
+@@ -300,7 +300,7 @@ static void test_fn(void *f0(void *), void *f1(void *),
+ 	struct param p2[thread_cnt];
+ 	unsigned char buf[write_size];
+ 
+-	tst_res(TINFO, msg);
++	tst_res(TINFO, "%s", msg);
+ 
+ 	if (tst_fill_file(fname, 1, write_size, thread_cnt + 1))
+ 		tst_brk(TBROK, "Failed to create tst file");
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch b/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
deleted file mode 100644
index f7c0a4b..0000000
--- a/meta/recipes-extended/ltp/ltp/0038-commands-gdb01-replace-stdin-with-dev-null.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 2f6ab8f694b26b7f2566624f6d1f23788d6ab8a0 Mon Sep 17 00:00:00 2001
-From: Jan Stancek <jstancek@redhat.com>
-Date: Mon, 11 Sep 2017 12:57:58 +0200
-Subject: [PATCH] commands/gdb01: replace stdin with /dev/null
-
-If this testcase runs as background process, gdb can receive
-SIGTTOU and then testcase gets stuck.
-
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-
-Upstream-Status: Backport
-[https://github.com/linux-test-project/ltp/commit/2f6ab8f694b26b7f2566624f6d1f23788d6ab8a0]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- testcases/commands/gdb/gdb01.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/commands/gdb/gdb01.sh b/testcases/commands/gdb/gdb01.sh
-index 07ae36f..e3a5b51 100755
---- a/testcases/commands/gdb/gdb01.sh
-+++ b/testcases/commands/gdb/gdb01.sh
-@@ -29,7 +29,7 @@ TST_NEEDS_CMDS="gdb /bin/cat"
- 
- simple_test()
- {
--	gdb /bin/cat -ex "run /etc/passwd" -ex quit
-+	gdb /bin/cat -ex "run /etc/passwd" -ex quit < /dev/null
- 	RC=$?
- 	if [ $RC -eq 0 ] ; then
- 		tst_res TPASS "gdb attached to process and completed run"
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170929.bb
similarity index 96%
rename from meta/recipes-extended/ltp/ltp_20170516.bb
rename to meta/recipes-extended/ltp/ltp_20170929.bb
index 653cbfd..93a59b3 100644
--- a/meta/recipes-extended/ltp/ltp_20170516.bb
+++ b/meta/recipes-extended/ltp/ltp_20170929.bb
@@ -21,7 +21,7 @@ DEPENDS_append_libc-musl = " fts "
 EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "18916a2e6d8c997b7b29dcfa9550d5a15b22ed22"
+SRCREV = "bac930f71b1e6786ebb8a894463503d07681ef6a"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0001-add-_GNU_SOURCE-to-pec_listener.c.patch \
@@ -48,8 +48,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0034-periodic_output.patch \
            file://0035-fix-test_proc_kill-hang.patch \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
-           file://0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch \
-           file://0038-commands-gdb01-replace-stdin-with-dev-null.patch \
+           file://0037-ltp-fix-format-security-error.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.8.1


