Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9DD7980A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 03:58:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8G3wcIl027791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 20:58:38 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 15 Sep 2018 20:58:25 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 15 Sep 2018 23:57:25 -0400
Message-ID: <1537070245-115968-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] ltp: add a patch for source code to fix issue about fcntl
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
X-List-Received-Date: Sun, 16 Sep 2018 03:58:37 -0000
Content-Type: text/plain

The testcases of fcntl fail on 32-bit arch

To cope with glibc commit:
  06ab719d30b0 ("Fix Linux fcntl OFD locks for non-LFS architectures
  (BZ#20251)")
Make OFD command use fcntl64() syscall on 32-bit.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ...ntl-make-OFD-command-use-fcntl64-syscall-.patch | 184 +++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20180515.bb          |   1 +
 2 files changed, 185 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch
new file mode 100644
index 0000000..2755596
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch
@@ -0,0 +1,184 @@
+From 8de03ea1200480b922d5ba05b69dc94db60496f5 Mon Sep 17 00:00:00 2001
+From: "Hongzhi.Song" <hongzhi.song@windriver.com>
+Date: Sat, 15 Sep 2018 22:39:32 -0400
+Subject: [PATCH] syscalls/fcntl: make OFD command use fcntl64() syscall on
+ 32-bit
+
+To cope with glibc commit:
+  06ab719d30b0 ("Fix Linux fcntl OFD locks for non-LFS architectures
+(BZ#20251)")
+
+WIP: Still need to test this with new glibc.
+     Test with old glibc look OK so far.
+
+Signed-off-by: Jan Stancek <jstancek@redhat.com>
+
+Upstream-Status: Backport
+    Backported from upstream maillist
+    https://lists.linux.it/pipermail/ltp/2018-September/009370.html
+
+Signed-off-by: Hongzhi Song <hongzhi.song@windriver.com>
+---
+ testcases/kernel/syscalls/fcntl/fcntl34.c      | 12 +++++++---
+ testcases/kernel/syscalls/fcntl/fcntl36.c      | 23 +++++++++++++-----
+ testcases/kernel/syscalls/fcntl/fcntl_common.h | 32 ++++++++++++++++++++++++++
+ 3 files changed, 58 insertions(+), 9 deletions(-)
+ create mode 100644 testcases/kernel/syscalls/fcntl/fcntl_common.h
+
+diff --git a/testcases/kernel/syscalls/fcntl/fcntl34.c b/testcases/kernel/syscalls/fcntl/fcntl34.c
+index aa29cf9..109f834 100644
+--- a/testcases/kernel/syscalls/fcntl/fcntl34.c
++++ b/testcases/kernel/syscalls/fcntl/fcntl34.c
+@@ -28,6 +28,7 @@
+ #include "lapi/fcntl.h"
+ #include "tst_safe_pthread.h"
+ #include "tst_test.h"
++#include "fcntl_common.h"
+ 
+ static int thread_cnt;
+ static const int max_thread_cnt = 32;
+@@ -68,7 +69,12 @@ void *thread_fn_01(void *arg)
+ 
+ 	memset(buf, (intptr_t)arg, write_size);
+ 
+-	struct flock64 lck = {
++    /* see explanation in fcntl_common.h */
++    #ifdef USE_STRUCT_FLOCK
++        struct flock lck = {
++    #else
++        struct flock64 lck = {
++    #endif
+ 		.l_whence = SEEK_SET,
+ 		.l_start  = 0,
+ 		.l_len    = 1,
+@@ -76,13 +82,13 @@ void *thread_fn_01(void *arg)
+ 
+ 	for (i = 0; i < writes_num; ++i) {
+ 		lck.l_type = F_WRLCK;
+-		SAFE_FCNTL(fd, F_OFD_SETLKW, &lck);
++        my_fcntl(fd, F_OFD_SETLKW, &lck);
+ 
+ 		SAFE_LSEEK(fd, 0, SEEK_END);
+ 		SAFE_WRITE(1, fd, buf, write_size);
+ 
+ 		lck.l_type = F_UNLCK;
+-		SAFE_FCNTL(fd, F_OFD_SETLKW, &lck);
++        my_fcntl(fd, F_OFD_SETLKW, &lck);
+ 
+ 		sched_yield();
+ 	}
+diff --git a/testcases/kernel/syscalls/fcntl/fcntl36.c b/testcases/kernel/syscalls/fcntl/fcntl36.c
+index 3246d13..f263b6b 100644
+--- a/testcases/kernel/syscalls/fcntl/fcntl36.c
++++ b/testcases/kernel/syscalls/fcntl/fcntl36.c
+@@ -57,6 +57,7 @@
+ #include "lapi/fcntl.h"
+ #include "tst_safe_pthread.h"
+ #include "tst_test.h"
++#include "fcntl_common.h"
+ 
+ static int thread_cnt;
+ static int fail_flag = 0;
+@@ -87,7 +88,12 @@ static void *fn_ofd_w(void *arg)
+ 	int fd = SAFE_OPEN(fname, O_RDWR);
+ 	long wt = pa->cnt;
+ 
+-	struct flock64 lck = {
++    /* see explanation in fcntl_common.h */
++    #ifdef USE_STRUCT_FLOCK
++        struct flock lck = {
++    #else
++        struct flock64 lck = {
++    #endif
+ 		.l_whence = SEEK_SET,
+ 		.l_start  = pa->offset,
+ 		.l_len    = pa->length,
+@@ -99,13 +105,13 @@ static void *fn_ofd_w(void *arg)
+ 		memset(buf, wt, pa->length);
+ 
+ 		lck.l_type = F_WRLCK;
+-		SAFE_FCNTL(fd, F_OFD_SETLKW, &lck);
++        my_fcntl(fd, F_OFD_SETLKW, &lck);
+ 
+ 		SAFE_LSEEK(fd, pa->offset, SEEK_SET);
+ 		SAFE_WRITE(1, fd, buf, pa->length);
+ 
+ 		lck.l_type = F_UNLCK;
+-		SAFE_FCNTL(fd, F_OFD_SETLKW, &lck);
++        my_fcntl(fd, F_OFD_SETLKW, &lck);
+ 
+ 		wt++;
+ 		if (wt >= 255)
+@@ -166,7 +172,12 @@ static void *fn_ofd_r(void *arg)
+ 	int i;
+ 	int fd = SAFE_OPEN(fname, O_RDWR);
+ 
+-	struct flock64 lck = {
++    /* see explanation in fcntl_common.h */
++    #ifdef USE_STRUCT_FLOCK
++        struct flock lck = {
++    #else
++        struct flock64 lck = {
++    #endif
+ 		.l_whence = SEEK_SET,
+ 		.l_start  = pa->offset,
+ 		.l_len    = pa->length,
+@@ -178,7 +189,7 @@ static void *fn_ofd_r(void *arg)
+ 		memset(buf, 0, pa->length);
+ 
+ 		lck.l_type = F_RDLCK;
+-		SAFE_FCNTL(fd, F_OFD_SETLKW, &lck);
++        my_fcntl(fd, F_OFD_SETLKW, &lck);
+ 
+ 		/* rlock acquired */
+ 		SAFE_LSEEK(fd, pa->offset, SEEK_SET);
+@@ -209,7 +220,7 @@ static void *fn_ofd_r(void *arg)
+ 		}
+ 
+ 		lck.l_type = F_UNLCK;
+-		SAFE_FCNTL(fd, F_OFD_SETLK, &lck);
++        my_fcntl(fd, F_OFD_SETLK, &lck);
+ 
+ 		sched_yield();
+ 	}
+diff --git a/testcases/kernel/syscalls/fcntl/fcntl_common.h b/testcases/kernel/syscalls/fcntl/fcntl_common.h
+new file mode 100644
+index 0000000..3fe399b
+--- /dev/null
++++ b/testcases/kernel/syscalls/fcntl/fcntl_common.h
+@@ -0,0 +1,32 @@
++#include "lapi/syscalls.h"
++
++/*
++ * glibc commit:
++ *   06ab719d30b0 ("Fix Linux fcntl OFD locks for non-LFS architectures (BZ#20251)")
++ * changed behavior of arg parameter for OFD commands. It is no
++ * longer passing arg directly to syscall, but expects it to be
++ * 'struct flock'.
++ *
++ * On 64-bit or _FILE_OFFSET_BITS == 64 we can use fcntl() and
++ * struct flock with any glibc version. struct flock and flock64
++ * should be identical.
++ *
++ * On 32-bit, older glibc would pass arg directly, recent one treats
++ * it as 'struct flock' and converts it to 'struct flock64'.
++ * So, for 32-bit we use fcntl64 syscall directly with struct flock64.
++ */
++#if __WORDSIZE == 64 || _FILE_OFFSET_BITS == 64
++#define USE_STRUCT_FLOCK
++static int my_fcntl(int fd, int cmd, void *lck)
++{
++        return SAFE_FCNTL(fd, cmd, lck);
++}
++#else
++static int my_fcntl(int fd, int cmd, void *lck)
++{
++        int ret = tst_syscall(__NR_fcntl64, fd, cmd, lck);
++        if (ret == -1)
++                tst_brk(TBROK|TERRNO, "fcntl64");
++        return ret;
++}
++#endif
+-- 
+2.8.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20180515.bb b/meta/recipes-extended/ltp/ltp_20180515.bb
index 7c364a6..9124307 100644
--- a/meta/recipes-extended/ltp/ltp_20180515.bb
+++ b/meta/recipes-extended/ltp/ltp_20180515.bb
@@ -51,6 +51,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0041-cve-2017-5669-shmat-for-0-or-PAGESIZE-with-RND-flag-.patch \
            file://0042-fs-ftest-ftest06.c-Fix-too-small-name-string-and-rel.patch \
            file://0043-open-creat-skip-S_ISGID-check-on-files-created-by-no.patch \
+           file://0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.8.1


