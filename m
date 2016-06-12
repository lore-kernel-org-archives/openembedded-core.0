Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 958986FF56
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:25:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C8POPp010065
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:25:24 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:25:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:25:13 -0700
Message-ID: <711e9de07af2c32ad3143f414e8365aa885dc9f0.1465719878.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465719878.git.liezhi.yang@windriver.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/11] strace: 4.11 -> 4.12
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
X-List-Received-Date: Sun, 12 Jun 2016 08:25:23 -0000
Content-Type: text/plain

* Remove backported patches:
0001-Move-gcc-compat-macros-to-gcc_compat.h.patch
0001-arc-metag-nios2-or1k-tile-fix-build.patch
0001-scm_rights-fd.test-rewrite-without-fork.patch
0001-tests-introduce-libtests.patch
0001-tests-scm_rights.c-use-libtests.patch

* Update update-gawk-paths.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...01-Move-gcc-compat-macros-to-gcc_compat.h.patch | 176 ------------
 .../0001-arc-metag-nios2-or1k-tile-fix-build.patch | 117 --------
 ...1-scm_rights-fd.test-rewrite-without-fork.patch | 198 -------------
 .../strace/0001-tests-introduce-libtests.patch     | 306 ---------------------
 .../0001-tests-scm_rights.c-use-libtests.patch     |  54 ----
 .../strace/strace/update-gawk-paths.patch          | 114 ++++----
 .../strace/{strace_4.11.bb => strace_4.12.bb}      |   9 +-
 7 files changed, 63 insertions(+), 911 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-Move-gcc-compat-macros-to-gcc_compat.h.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-scm_rights-fd.test-rewrite-without-fork.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-introduce-libtests.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-scm_rights.c-use-libtests.patch
 rename meta/recipes-devtools/strace/{strace_4.11.bb => strace_4.12.bb} (75%)

diff --git a/meta/recipes-devtools/strace/strace/0001-Move-gcc-compat-macros-to-gcc_compat.h.patch b/meta/recipes-devtools/strace/strace/0001-Move-gcc-compat-macros-to-gcc_compat.h.patch
deleted file mode 100644
index aa61e15..0000000
--- a/meta/recipes-devtools/strace/strace/0001-Move-gcc-compat-macros-to-gcc_compat.h.patch
+++ /dev/null
@@ -1,176 +0,0 @@
-From f32126ba790dd4e61d43a2140b24f02426297bb6 Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@altlinux.org>
-Date: Thu, 31 Dec 2015 14:19:41 +0000
-Subject: [PATCH] Move gcc compat macros to gcc_compat.h
-
-* defs.h: Include "gcc_compat.h".
-(GNUC_PREREQ, ATTRIBUTE_NORETURN, ATTRIBUTE_FORMAT,
-ATTRIBUTE_ALIGNED, ATTRIBUTE_PACKED, ATTRIBUTE_MALLOC,
-ATTRIBUTE_NOINLINE, ATTRIBUTE_ALLOC_SIZE): Move ...
-* gcc_compat.h: ... here.
-* Makefile.am (strace_SOURCES): Add gcc_compat.h.
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
- Makefile.am  |  1 +
- defs.h       | 43 +----------------------------------
- gcc_compat.h | 73 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 3 files changed, 75 insertions(+), 42 deletions(-)
- create mode 100644 gcc_compat.h
-
-diff --git a/Makefile.am b/Makefile.am
-index ab52778..d43608d 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -97,6 +97,7 @@ strace_SOURCES =	\
- 	flock.c		\
- 	flock.h		\
- 	futex.c		\
-+	gcc_compat.h	\
- 	get_robust_list.c \
- 	getcpu.c	\
- 	getcwd.c	\
-diff --git a/defs.h b/defs.h
-index 283ab1f..bae212c 100644
---- a/defs.h
-+++ b/defs.h
-@@ -55,6 +55,7 @@
- #include <sys/syscall.h>
- 
- #include "mpers_type.h"
-+#include "gcc_compat.h"
- 
- #ifndef HAVE_STRERROR
- const char *strerror(int);
-@@ -68,48 +69,6 @@ const char *strerror(int);
- extern char *stpcpy(char *dst, const char *src);
- #endif
- 
--#if defined __GNUC__ && defined __GNUC_MINOR__
--# define GNUC_PREREQ(maj, min)	\
--	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
--#else
--# define __attribute__(x)	/* empty */
--# define GNUC_PREREQ(maj, min)	0
--#endif
--
--#if GNUC_PREREQ(2, 5)
--# define ATTRIBUTE_NORETURN	__attribute__((__noreturn__))
--#else
--# define ATTRIBUTE_NORETURN	/* empty */
--#endif
--
--#if GNUC_PREREQ(2, 7)
--# define ATTRIBUTE_FORMAT(args)	__attribute__((__format__ args))
--# define ATTRIBUTE_ALIGNED(arg)	__attribute__((__aligned__(arg)))
--# define ATTRIBUTE_PACKED	__attribute__((__packed__))
--#else
--# define ATTRIBUTE_FORMAT(args)	/* empty */
--# define ATTRIBUTE_ALIGNED(arg)	/* empty */
--# define ATTRIBUTE_PACKED	/* empty */
--#endif
--
--#if GNUC_PREREQ(3, 0)
--# define ATTRIBUTE_MALLOC	__attribute__((__malloc__))
--#else
--# define ATTRIBUTE_MALLOC	/* empty */
--#endif
--
--#if GNUC_PREREQ(3, 1)
--# define ATTRIBUTE_NOINLINE	__attribute__((__noinline__))
--#else
--# define ATTRIBUTE_NOINLINE	/* empty */
--#endif
--
--#if GNUC_PREREQ(4, 3)
--# define ATTRIBUTE_ALLOC_SIZE(args)	__attribute__((__alloc_size__ args))
--#else
--# define ATTRIBUTE_ALLOC_SIZE(args)	/* empty */
--#endif
--
- #ifndef offsetof
- # define offsetof(type, member)	\
- 	(((char *) &(((type *) NULL)->member)) - ((char *) (type *) NULL))
-diff --git a/gcc_compat.h b/gcc_compat.h
-new file mode 100644
-index 0000000..1f2c835
---- /dev/null
-+++ b/gcc_compat.h
-@@ -0,0 +1,73 @@
-+/*
-+ * Copyright (c) 2015 Dmitry V. Levin <ldv@altlinux.org>
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in the
-+ *    documentation and/or other materials provided with the distribution.
-+ * 3. The name of the author may not be used to endorse or promote products
-+ *    derived from this software without specific prior written permission.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
-+ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
-+ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
-+ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-+ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-+ */
-+
-+#ifndef GCC_COMPAT_H_
-+#define GCC_COMPAT_H_
-+
-+#if defined __GNUC__ && defined __GNUC_MINOR__
-+# define GNUC_PREREQ(maj, min)	\
-+	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
-+#else
-+# define __attribute__(x)	/* empty */
-+# define GNUC_PREREQ(maj, min)	0
-+#endif
-+
-+#if GNUC_PREREQ(2, 5)
-+# define ATTRIBUTE_NORETURN	__attribute__((__noreturn__))
-+#else
-+# define ATTRIBUTE_NORETURN	/* empty */
-+#endif
-+
-+#if GNUC_PREREQ(2, 7)
-+# define ATTRIBUTE_FORMAT(args)	__attribute__((__format__ args))
-+# define ATTRIBUTE_ALIGNED(arg)	__attribute__((__aligned__(arg)))
-+# define ATTRIBUTE_PACKED	__attribute__((__packed__))
-+#else
-+# define ATTRIBUTE_FORMAT(args)	/* empty */
-+# define ATTRIBUTE_ALIGNED(arg)	/* empty */
-+# define ATTRIBUTE_PACKED	/* empty */
-+#endif
-+
-+#if GNUC_PREREQ(3, 0)
-+# define ATTRIBUTE_MALLOC	__attribute__((__malloc__))
-+#else
-+# define ATTRIBUTE_MALLOC	/* empty */
-+#endif
-+
-+#if GNUC_PREREQ(3, 1)
-+# define ATTRIBUTE_NOINLINE	__attribute__((__noinline__))
-+#else
-+# define ATTRIBUTE_NOINLINE	/* empty */
-+#endif
-+
-+#if GNUC_PREREQ(4, 3)
-+# define ATTRIBUTE_ALLOC_SIZE(args)	__attribute__((__alloc_size__ args))
-+#else
-+# define ATTRIBUTE_ALLOC_SIZE(args)	/* empty */
-+#endif
-+
-+#endif
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch b/meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch
deleted file mode 100644
index a9d3203..0000000
--- a/meta/recipes-devtools/strace/strace/0001-arc-metag-nios2-or1k-tile-fix-build.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From dd1a80c8d213eed95fe55b7ebcb07ee165dd8e4b Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@altlinux.org>
-Date: Thu, 24 Dec 2015 15:40:55 +0000
-Subject: [PATCH] arc, metag, nios2, or1k, tile: fix build
-
-Fix build regression introduced by commit
-34683e3926d8c2daa368afb805da422ee7043396.
-
-* linux/32/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap.
-* linux/arc/syscallent.h: Add sys_ prefix to ARCH_mmap and mmap_pgoff.
-* linux/nios2/syscallent.h: Likewise.
-* linux/or1k/syscallent.h: Likewise.
-* linux/tile/syscallent1.h: Add sys_ prefix to ARCH_mmap and sys_mmap_4koff.
-* pathtrace.c (pathtrace_match): Handle SEN_ARCH_mmap.
-* NEWS: Mention this build fix.
-
-Reported-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
-Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Backport
----
- NEWS                     | 3 +++
- linux/32/syscallent.h    | 6 +++---
- linux/arc/syscallent.h   | 2 +-
- linux/nios2/syscallent.h | 2 +-
- linux/or1k/syscallent.h  | 2 +-
- linux/tile/syscallent1.h | 2 +-
- pathtrace.c              | 1 +
- 7 files changed, 11 insertions(+), 7 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index fe40ca4..09263eb 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,3 +1,9 @@
-+Noteworthy changes in release ?.?? (????-??-??)
-+===============================================
-+
-+* Bug fixes
-+  * Fixed build on arc, metag, nios2, or1k, and tile architectures.
-+
- Noteworthy changes in release 4.11 (2015-12-21)
- ===============================================
- 
-diff --git a/linux/32/syscallent.h b/linux/32/syscallent.h
-index 5f997e7..e6f895c 100644
---- a/linux/32/syscallent.h
-+++ b/linux/32/syscallent.h
-@@ -1,5 +1,5 @@
--#ifndef ARCH_mmap
--# define ARCH_mmap mmap
-+#ifndef sys_ARCH_mmap
-+# define sys_ARCH_mmap sys_mmap
- #endif
- [  0] = { 2,	0,		SEN(io_setup),			"io_setup"		},
- [  1] = { 1,	0,		SEN(io_destroy),		"io_destroy"		},
-@@ -276,5 +276,5 @@
- [283] = { 2,	0,		SEN(membarrier),		"membarrier",		},
- [284] = { 3,	TM,		SEN(mlock2),			"mlock2"		},
- 
--#undef ARCH_mmap
-+#undef sys_ARCH_mmap
- #undef ARCH_WANT_SYNC_FILE_RANGE2
-diff --git a/linux/arc/syscallent.h b/linux/arc/syscallent.h
-index 5847dc4..1100008 100644
---- a/linux/arc/syscallent.h
-+++ b/linux/arc/syscallent.h
-@@ -1,4 +1,4 @@
--#define ARCH_mmap mmap_pgoff
-+#define sys_ARCH_mmap sys_mmap_pgoff
- #include "32/syscallent.h"
- [244] = { 3,	0,	SEN(printargs),	"arc_cacheflush"},
- [245] = { 1,	0,	SEN(printargs),	"arc_settls"	},
-diff --git a/linux/nios2/syscallent.h b/linux/nios2/syscallent.h
-index 8a4b70e..01efe3a 100644
---- a/linux/nios2/syscallent.h
-+++ b/linux/nios2/syscallent.h
-@@ -1,4 +1,4 @@
--#define ARCH_mmap mmap_pgoff
-+#define sys_ARCH_mmap sys_mmap_pgoff
- #include "32/syscallent.h"
- [244] = {4,    0,	SEN(cacheflush), "cacheflush"},
- [245 ... 259] = { },
-diff --git a/linux/or1k/syscallent.h b/linux/or1k/syscallent.h
-index ed84b3b..351fe25 100644
---- a/linux/or1k/syscallent.h
-+++ b/linux/or1k/syscallent.h
-@@ -1,4 +1,4 @@
--#define ARCH_mmap mmap_pgoff
-+#define sys_ARCH_mmap sys_mmap_pgoff
- #include "32/syscallent.h"
- [244] = { 3,	NF,	SEN(or1k_atomic),	"or1k_atomic"	},
- [245 ... 259] = { },
-diff --git a/linux/tile/syscallent1.h b/linux/tile/syscallent1.h
-index c86f059..28dbab4 100644
---- a/linux/tile/syscallent1.h
-+++ b/linux/tile/syscallent1.h
-@@ -1,4 +1,4 @@
--#define ARCH_mmap mmap_4koff
-+#define sys_ARCH_mmap sys_mmap_4koff
- #define ARCH_WANT_SYNC_FILE_RANGE2 1
- #include "32/syscallent.h"
- [244] = { 1,	0,	SEN(printargs),	"cmpxchg_badaddr"	},
-diff --git a/pathtrace.c b/pathtrace.c
-index d530ec2..e72cdf7 100644
---- a/pathtrace.c
-+++ b/pathtrace.c
-@@ -216,6 +216,7 @@ pathtrace_match(struct tcb *tcp)
- 	case SEN_mmap:
- 	case SEN_mmap_4koff:
- 	case SEN_mmap_pgoff:
-+	case SEN_ARCH_mmap:
- 		/* x, x, x, x, fd */
- 		return fdmatch(tcp, tcp->u_arg[4]);
- 
--- 
-2.6.4
-
diff --git a/meta/recipes-devtools/strace/strace/0001-scm_rights-fd.test-rewrite-without-fork.patch b/meta/recipes-devtools/strace/strace/0001-scm_rights-fd.test-rewrite-without-fork.patch
deleted file mode 100644
index c4e645b..0000000
--- a/meta/recipes-devtools/strace/strace/0001-scm_rights-fd.test-rewrite-without-fork.patch
+++ /dev/null
@@ -1,198 +0,0 @@
-From 3fdcdd47c6a67585123a0a0c8fffabcc9f79a3a2 Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@altlinux.org>
-Date: Tue, 12 Jan 2016 14:47:12 +0000
-Subject: [PATCH] scm_rights-fd.test: rewrite without fork
-
-* tests/scm_rights.c (main): Rewrite without fork.
-Place all objects passed to sendmsg and recvmsg at the end
-of memory pages followed by inaccessible pages.
-* tests/scm_rights-fd.test: Update.
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
- tests/scm_rights-fd.test |  12 ++---
- tests/scm_rights.c       | 122 ++++++++++++++++++++++-------------------------
- 2 files changed, 63 insertions(+), 71 deletions(-)
-
-diff --git a/tests/scm_rights-fd.test b/tests/scm_rights-fd.test
-index a32ef36..48c5028 100755
---- a/tests/scm_rights-fd.test
-+++ b/tests/scm_rights-fd.test
-@@ -49,18 +49,18 @@ touch -- "$file" ||
- 	framework_skip_ 'failed to create a file'
- 
- run_prog ./scm_rights /dev/zero
--run_strace_merge -y -x -enetwork $args "$file"
-+run_strace -y -x -enetwork $args "$file"
- 
-+sample='\\xf1\\xf2\\xf3\\xf4\\xf5\\xf6\\xf7\\xf8\\xf9\\xfa\\xfb\\xfc\\xfd\\xfe\\xff'
- n='[1-9][0-9]*'
--msg='\{msg_name\(0\)=NULL, msg_iov\(1\)=\[\{"\\x00\\x00\\x00\\x00[^"]*", '"$n"'\}\], msg_controllen='"$n"
--rights='\{cmsg_len='"$n"', cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, \[3</dev/null>, 4</dev/zero>, 5</[^}>]*/(A\\n){127}Z>\]\}'
-+msg='\{msg_name\(0\)=NULL, msg_iov\(1\)=\[\{"'"$sample"'", 15\}\], msg_controllen='"$n"
-+rights='\{cmsg_len='"$n"', cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, \[4</dev/null>, 5</dev/zero>, 6</[^}>]*/(A\\n){127}Z>\]\}'
- creds='\{cmsg_len='"$n"', cmsg_level=SOL_SOCKET, cmsg_type=SCM_CREDENTIALS, \{pid='"$n"', uid=[0-9]+, gid=[0-9]+\}\}'
--prefix='[1-9][0-9]* +[0-9]+:[0-9]+:[0-9]+\.[0-9]+ +'
- EXPECTED="$LOG.expected"
- 
- cat > "$EXPECTED" << __EOF__
--${prefix}sendmsg\\(1<socket:\\[[0-9]+\\]>, $msg, \\[$rights\\], msg_flags=0\\}, 0\\) += $n
--${prefix}recvmsg\\(0<socket:\\[[0-9]+\\]>, $msg, \\[$creds, $rights\\], msg_flags=0\\}, 0\\) += $n
-+sendmsg\\(3<socket:\\[[0-9]+\\]>, $msg, \\[$rights\\], msg_flags=0\\}, 0\\) = 15
-+recvmsg\\(0<socket:\\[[0-9]+\\]>, $msg, \\[$creds, $rights\\], msg_flags=0\\}, 0\\) = 15
- __EOF__
- 
- match_grep "$LOG" "$EXPECTED"
-diff --git a/tests/scm_rights.c b/tests/scm_rights.c
-index 1e5e850..00af4d5 100644
---- a/tests/scm_rights.c
-+++ b/tests/scm_rights.c
-@@ -27,26 +27,39 @@
- 
- #include "tests.h"
- #include <assert.h>
--#include <string.h>
--#include <stdlib.h>
--#include <unistd.h>
- #include <errno.h>
- #include <fcntl.h>
-+#include <stdlib.h>
-+#include <string.h>
-+#include <unistd.h>
- #include <sys/socket.h>
--#include <sys/wait.h>
- 
- int main(int ac, const char **av)
- {
--	int i;
--	int data = 0;
--	struct iovec iov = {
--		.iov_base = &data,
--		.iov_len = sizeof(iov)
--	};
-+	assert(ac > 0);
-+	int fds[ac];
-+
-+	static const char sample[] =
-+		"\xf1\xf2\xf3\xf4\xf5\xf6\xf7\xf8\xf9\xfa\xfb\xfc\xfd\xfe\xff";
-+	const unsigned int data_size = sizeof(sample) - 1;
-+	void *data = tail_alloc(data_size);
-+	memcpy(data, sample, data_size);
-+
-+	struct iovec *iov = tail_alloc(sizeof(struct iovec));
-+	iov->iov_base = data;
-+	iov->iov_len = data_size;
- 
--	while ((i = open("/dev/null", O_RDWR)) < 3)
-+	struct msghdr *mh = tail_alloc(sizeof(struct msghdr));
-+	memset(mh, 0, sizeof(*mh));
-+	mh->msg_iov = iov;
-+	mh->msg_iovlen = 1;
-+
-+	int i;
-+	while ((i = open("/dev/null", O_RDWR)) <= ac + 2)
- 		assert(i >= 0);
--	(void) close(3);
-+	while (i > 2)
-+		assert(close(i--) == 0);
-+	assert(close(0) == 0);
- 
- 	int sv[2];
- 	if (socketpair(AF_UNIX, SOCK_STREAM, 0, sv))
-@@ -55,60 +68,39 @@ int main(int ac, const char **av)
- 	if (setsockopt(sv[0], SOL_SOCKET, SO_PASSCRED, &one, sizeof(one)))
- 		perror_msg_and_skip("setsockopt");
- 
--	pid_t pid = fork();
--	if (pid < 0)
--		perror_msg_and_fail("fork");
--
--	if (pid) {
--		assert(close(sv[0]) == 0);
--		assert(dup2(sv[1], 1) == 1);
--		assert(close(sv[1]) == 0);
--
--		int fds[ac];
--		assert((fds[0] = open("/dev/null", O_RDWR)) == 3);
--		for (i = 1; i < ac; ++i)
--			assert((fds[i] = open(av[i], O_RDONLY)) == i + 3);
--
--		union {
--			struct cmsghdr cmsg;
--			char buf[CMSG_LEN(sizeof(fds))];
--		} control;
--
--		control.cmsg.cmsg_level = SOL_SOCKET;
--		control.cmsg.cmsg_type = SCM_RIGHTS;
--		control.cmsg.cmsg_len = CMSG_LEN(sizeof(fds));
--		memcpy(CMSG_DATA(&control.cmsg), fds, sizeof(fds));
--
--		struct msghdr mh = {
--			.msg_iov = &iov,
--			.msg_iovlen = 1,
--			.msg_control = &control,
--			.msg_controllen = sizeof(control)
--		};
--
--		assert(sendmsg(1, &mh, 0) == sizeof(iov));
--		assert(close(1) == 0);
--
--                int status;
--		assert(waitpid(pid, &status, 0) == pid);
--		assert(status == 0);
--	} else {
--		assert(close(sv[1]) == 0);
--		assert(dup2(sv[0], 0) == 0);
--		assert(close(sv[0]) == 0);
--
--		struct cmsghdr control[4 + ac * sizeof(int) / sizeof(struct cmsghdr)];
--
--		struct msghdr mh = {
--			.msg_iov = &iov,
--			.msg_iovlen = 1,
--			.msg_control = control,
--			.msg_controllen = sizeof(control)
--		};
--
--		assert(recvmsg(0, &mh, 0) == sizeof(iov));
--		assert(close(0) == 0);
-+	assert((fds[0] = open("/dev/null", O_RDWR)) == 4);
-+	for (i = 1; i < ac; ++i)
-+		assert((fds[i] = open(av[i], O_RDONLY)) == i + 4);
-+
-+	unsigned int cmsg_size = CMSG_SPACE(sizeof(fds));
-+	struct cmsghdr *cmsg = tail_alloc(cmsg_size);
-+	memset(cmsg, 0, cmsg_size);
-+	cmsg->cmsg_level = SOL_SOCKET;
-+	cmsg->cmsg_type = SCM_RIGHTS;
-+	cmsg->cmsg_len = CMSG_LEN(sizeof(fds));
-+	memcpy(CMSG_DATA(cmsg), fds, sizeof(fds));
-+
-+	mh->msg_control = cmsg;
-+	mh->msg_controllen = cmsg_size;
-+
-+	assert(sendmsg(sv[1], mh, 0) == (int) data_size);
-+
-+	assert(close(sv[1]) == 0);
-+	assert(open("/dev/null", O_RDWR) == sv[1]);
-+
-+	for (i = 0; i < ac; ++i) {
-+		assert(close(fds[i]) == 0);
-+		fds[i] = 0;
- 	}
- 
-+	cmsg_size += CMSG_SPACE(sizeof(struct ucred));
-+	cmsg = tail_alloc(cmsg_size);
-+	memset(cmsg, 0, cmsg_size);
-+	mh->msg_control = cmsg;
-+	mh->msg_controllen = cmsg_size;
-+
-+	assert(recvmsg(0, mh, 0) == (int) data_size);
-+	assert(close(0) == 0);
-+
- 	return 0;
- }
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-introduce-libtests.patch b/meta/recipes-devtools/strace/strace/0001-tests-introduce-libtests.patch
deleted file mode 100644
index 1575ecd..0000000
--- a/meta/recipes-devtools/strace/strace/0001-tests-introduce-libtests.patch
+++ /dev/null
@@ -1,306 +0,0 @@
-From 87e6b230fff800eb768b68b2e5173ebbe83fd3ef Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@altlinux.org>
-Date: Sat, 2 Jan 2016 12:05:14 +0000
-Subject: [PATCH] tests: introduce libtests
-
-Introduce tests/libtests.a with common functions for use in tests.
-
-* tests/tests.h: New file.
-* tests/error_msg.c: Likewise.
-* tests/tail_alloc.c: Likewise.
-* tests/get_page_size.c: Likewise.
-* tests/Makefile.am (libtests_a_SOURCES, libtests_a_CPPFLAGS,
-check_LIBRARIES, LDADD): New variables.
-(clock_xettime_LDADD, filter_unavailable_LDADD, mq_LDADD,
-pc_LDADD, times_LDADD): Add $(LDADD).
-* tests/.gitignore: Add libtests.a.
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
- tests/.gitignore      |  1 +
- tests/Makefile.am     | 20 ++++++++++----
- tests/error_msg.c     | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
- tests/get_page_size.c | 13 +++++++++
- tests/tail_alloc.c    | 52 ++++++++++++++++++++++++++++++++++++
- tests/tests.h         | 62 ++++++++++++++++++++++++++++++++++++++++++
- 6 files changed, 217 insertions(+), 5 deletions(-)
- create mode 100644 tests/error_msg.c
- create mode 100644 tests/get_page_size.c
- create mode 100644 tests/tail_alloc.c
- create mode 100644 tests/tests.h
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 386a2c2..62d0e56 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -40,6 +40,16 @@ AM_CPPFLAGS = $(ARCH_MFLAGS) \
- 	      -I$(top_srcdir)
- AM_LDFLAGS = $(ARCH_MFLAGS)
- 
-+libtests_a_SOURCES = \
-+	get_page_size.c \
-+	error_msg.c \
-+	tail_alloc.c \
-+	tests.h \
-+	# end of libtests_a_SOURCES
-+libtests_a_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
-+check_LIBRARIES = libtests.a
-+LDADD = libtests.a
-+
- check_PROGRAMS = \
- 	_newselect \
- 	adjtimex \
-@@ -146,19 +156,19 @@ check_PROGRAMS = \
- 	xettimeofday \
- 	# end of check_PROGRAMS
- 
--clock_xettime_LDADD = -lrt
--filter_unavailable_LDADD = -lpthread
-+clock_xettime_LDADD = -lrt $(LDADD)
-+filter_unavailable_LDADD = -lpthread $(LDADD)
- fstat64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
- fstatat64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
- ftruncate64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
- lstat64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
- mmap64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
--mq_LDADD = -lrt
-+mq_LDADD = -lrt $(LDADD)
- newfstatat_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
--pc_LDADD = $(dl_LIBS)
-+pc_LDADD = $(dl_LIBS) $(LDADD)
- stat64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
- statfs_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
--times_LDADD = -lrt
-+times_LDADD = -lrt $(LDADD)
- truncate64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
- uio_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
- stack_fcall_SOURCES = stack-fcall.c \
-diff --git a/tests/error_msg.c b/tests/error_msg.c
-new file mode 100644
-index 0000000..3fd3411
---- /dev/null
-+++ b/tests/error_msg.c
-@@ -0,0 +1,74 @@
-+/*
-+ * Copyright (c) 2016 Dmitry V. Levin <ldv@altlinux.org>
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in the
-+ *    documentation and/or other materials provided with the distribution.
-+ * 3. The name of the author may not be used to endorse or promote products
-+ *    derived from this software without specific prior written permission.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
-+ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
-+ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
-+ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-+ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-+ */
-+
-+#include "tests.h"
-+#include <errno.h>
-+#include <stdarg.h>
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <string.h>
-+
-+void
-+perror_msg_and_fail(const char *fmt, ...)
-+{
-+	int err_no = errno;
-+	va_list p;
-+
-+	va_start(p, fmt);
-+	vfprintf(stderr, fmt, p);
-+	if (err_no)
-+		fprintf(stderr, ": %s\n", strerror(err_no));
-+	else
-+		putc('\n', stderr);
-+	exit(1);
-+}
-+
-+void
-+error_msg_and_skip(const char *fmt, ...)
-+{
-+	va_list p;
-+
-+	va_start(p, fmt);
-+	vfprintf(stderr, fmt, p);
-+	putc('\n', stderr);
-+	exit(77);
-+}
-+
-+void
-+perror_msg_and_skip(const char *fmt, ...)
-+{
-+	int err_no = errno;
-+	va_list p;
-+
-+	va_start(p, fmt);
-+	vfprintf(stderr, fmt, p);
-+	if (err_no)
-+		fprintf(stderr, ": %s\n", strerror(err_no));
-+	else
-+		putc('\n', stderr);
-+	exit(77);
-+}
-diff --git a/tests/get_page_size.c b/tests/get_page_size.c
-new file mode 100644
-index 0000000..aeea861
---- /dev/null
-+++ b/tests/get_page_size.c
-@@ -0,0 +1,13 @@
-+#include "tests.h"
-+#include <unistd.h>
-+
-+size_t
-+get_page_size(void)
-+{
-+	static size_t page_size;
-+
-+	if (!page_size)
-+		page_size = sysconf(_SC_PAGESIZE);
-+
-+	return page_size;
-+}
-diff --git a/tests/tail_alloc.c b/tests/tail_alloc.c
-new file mode 100644
-index 0000000..2b8b14e
---- /dev/null
-+++ b/tests/tail_alloc.c
-@@ -0,0 +1,52 @@
-+/*
-+ * Copyright (c) 2015-2016 Dmitry V. Levin <ldv@altlinux.org>
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in the
-+ *    documentation and/or other materials provided with the distribution.
-+ * 3. The name of the author may not be used to endorse or promote products
-+ *    derived from this software without specific prior written permission.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
-+ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
-+ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
-+ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-+ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-+ */
-+
-+#include "tests.h"
-+#include <string.h>
-+#include <sys/mman.h>
-+
-+void *
-+tail_alloc(const size_t size)
-+{
-+	const size_t page_size = get_page_size();
-+	const size_t len = (size + page_size - 1) & -page_size;
-+	const size_t alloc_size = len + 2 * page_size;
-+
-+	void *p = mmap(NULL, alloc_size, PROT_READ | PROT_WRITE,
-+		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
-+	if (MAP_FAILED == p)
-+		perror_msg_and_fail("mmap(%zu)", alloc_size);
-+
-+	void *start_work = p + page_size;
-+	void *tail_guard = start_work + len;
-+
-+	if (munmap(p, page_size) || munmap(tail_guard, page_size))
-+		perror_msg_and_fail("munmap");
-+
-+	memset(start_work, 0xff, len);
-+	return tail_guard - size;
-+}
-diff --git a/tests/tests.h b/tests/tests.h
-new file mode 100644
-index 0000000..91fa24e
---- /dev/null
-+++ b/tests/tests.h
-@@ -0,0 +1,62 @@
-+/*
-+ * Copyright (c) 2016 Dmitry V. Levin <ldv@altlinux.org>
-+ * All rights reserved.
-+ *
-+ * Redistribution and use in source and binary forms, with or without
-+ * modification, are permitted provided that the following conditions
-+ * are met:
-+ * 1. Redistributions of source code must retain the above copyright
-+ *    notice, this list of conditions and the following disclaimer.
-+ * 2. Redistributions in binary form must reproduce the above copyright
-+ *    notice, this list of conditions and the following disclaimer in the
-+ *    documentation and/or other materials provided with the distribution.
-+ * 3. The name of the author may not be used to endorse or promote products
-+ *    derived from this software without specific prior written permission.
-+ *
-+ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
-+ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
-+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
-+ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
-+ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
-+ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
-+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
-+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-+ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-+ */
-+
-+#ifndef TESTS_H_
-+# define TESTS_H_
-+
-+# ifdef HAVE_CONFIG_H
-+#  include "config.h"
-+# endif
-+
-+# include <sys/types.h>
-+# include "gcc_compat.h"
-+
-+/* Cached sysconf(_SC_PAGESIZE). */
-+size_t get_page_size(void);
-+
-+/* Print message and strerror(errno) to stderr, then exit(1). */
-+void perror_msg_and_fail(const char *, ...)
-+	ATTRIBUTE_FORMAT((printf, 1, 2)) ATTRIBUTE_NORETURN;
-+/* Print message to stderr, then exit(77). */
-+void error_msg_and_skip(const char *, ...)
-+	ATTRIBUTE_FORMAT((printf, 1, 2)) ATTRIBUTE_NORETURN;
-+/* Print message and strerror(errno) to stderr, then exit(77). */
-+void perror_msg_and_skip(const char *, ...)
-+	ATTRIBUTE_FORMAT((printf, 1, 2)) ATTRIBUTE_NORETURN;
-+
-+/*
-+ * Allocate memory that ends on the page boundary.
-+ * Pages allocated by this call are preceeded by an unmapped page
-+ * and followed also by an unmapped page.
-+ */
-+void *tail_alloc(const size_t)
-+	ATTRIBUTE_MALLOC ATTRIBUTE_ALLOC_SIZE((1));
-+
-+# define SKIP_MAIN_UNDEFINED(arg) \
-+	int main(void) { error_msg_and_skip("undefined: %s", arg); }
-+
-+#endif
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-scm_rights.c-use-libtests.patch b/meta/recipes-devtools/strace/strace/0001-tests-scm_rights.c-use-libtests.patch
deleted file mode 100644
index 3fbab8b..0000000
--- a/meta/recipes-devtools/strace/strace/0001-tests-scm_rights.c-use-libtests.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 339a15b619b479c63cafba21d5fc359e613d9ee8 Mon Sep 17 00:00:00 2001
-From: "Dmitry V. Levin" <ldv@altlinux.org>
-Date: Mon, 4 Jan 2016 23:53:31 +0000
-Subject: [PATCH] tests/scm_rights.c: use libtests
-
-* tests/scm_rights.c (main): Use perror_msg_and_fail and perror_msg_and_skip.
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
- tests/scm_rights.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/tests/scm_rights.c b/tests/scm_rights.c
-index c41444f..1e5e850 100644
---- a/tests/scm_rights.c
-+++ b/tests/scm_rights.c
-@@ -1,5 +1,5 @@
- /*
-- * Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
-+ * Copyright (c) 2014-2016 Dmitry V. Levin <ldv@altlinux.org>
-  * All rights reserved.
-  *
-  * Redistribution and use in source and binary forms, with or without
-@@ -25,6 +25,7 @@
-  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-  */
- 
-+#include "tests.h"
- #include <assert.h>
- #include <string.h>
- #include <stdlib.h>
-@@ -48,12 +49,15 @@ int main(int ac, const char **av)
- 	(void) close(3);
- 
- 	int sv[2];
--	assert(socketpair(AF_UNIX, SOCK_STREAM, 0, sv) == 0);
-+	if (socketpair(AF_UNIX, SOCK_STREAM, 0, sv))
-+		perror_msg_and_skip("socketpair");
- 	int one = 1;
--	assert(setsockopt(sv[0], SOL_SOCKET, SO_PASSCRED, &one, sizeof(one)) == 0);
-+	if (setsockopt(sv[0], SOL_SOCKET, SO_PASSCRED, &one, sizeof(one)))
-+		perror_msg_and_skip("setsockopt");
- 
- 	pid_t pid = fork();
--	assert(pid >= 0);
-+	if (pid < 0)
-+		perror_msg_and_fail("fork");
- 
- 	if (pid) {
- 		assert(close(sv[0]) == 0);
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
index bfc7f34..94ee53c 100644
--- a/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
+++ b/meta/recipes-devtools/strace/strace/update-gawk-paths.patch
@@ -12,19 +12,20 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
- mpers.awk                 | 2 +-
- tests/caps.awk            | 2 +-
- tests/match.awk           | 2 +-
- tests/net-yy-accept.awk   | 2 +-
- tests/net-yy-connect.awk  | 2 +-
- tests/sigaction.awk       | 2 +-
- tests/uid.awk             | 2 +-
- tests/unix-yy-accept.awk  | 2 +-
- tests/unix-yy-connect.awk | 2 +-
- 9 files changed, 9 insertions(+), 9 deletions(-)
+ mpers.awk                | 2 +-
+ tests-m32/caps.awk       | 2 +-
+ tests-m32/match.awk      | 2 +-
+ tests-m32/sigaction.awk  | 2 +-
+ tests-mx32/caps.awk      | 2 +-
+ tests-mx32/match.awk     | 2 +-
+ tests-mx32/sigaction.awk | 2 +-
+ tests/caps.awk           | 2 +-
+ tests/match.awk          | 2 +-
+ tests/sigaction.awk      | 2 +-
+ 10 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/mpers.awk b/mpers.awk
-index 73bf0b0..50e6c16 100644
+index 99248c5..ff10520 100644
 --- a/mpers.awk
 +++ b/mpers.awk
 @@ -1,4 +1,4 @@
@@ -32,87 +33,94 @@ index 73bf0b0..50e6c16 100644
 +#!/usr/bin/gawk
  #
  # Copyright (c) 2015 Elvira Khabirova <lineprinter0@gmail.com>
- # Copyright (c) 2015 Dmitry V. Levin <ldv@altlinux.org>
-diff --git a/tests/caps.awk b/tests/caps.awk
-index bad8b0f..845f37c 100644
---- a/tests/caps.awk
-+++ b/tests/caps.awk
+ # Copyright (c) 2015-2016 Dmitry V. Levin <ldv@altlinux.org>
+diff --git a/tests-m32/caps.awk b/tests-m32/caps.awk
+index 67003ac..a66f1f0 100644
+--- a/tests-m32/caps.awk
++++ b/tests-m32/caps.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
- # All rights reserved.
-diff --git a/tests/match.awk b/tests/match.awk
+ # This file is part of caps strace test.
+ #
+diff --git a/tests-m32/match.awk b/tests-m32/match.awk
 index abfbae9..f2740bf 100644
---- a/tests/match.awk
-+++ b/tests/match.awk
+--- a/tests-m32/match.awk
++++ b/tests-m32/match.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
  # All rights reserved.
-diff --git a/tests/net-yy-accept.awk b/tests/net-yy-accept.awk
-index fed3e30..e916ab0 100644
---- a/tests/net-yy-accept.awk
-+++ b/tests/net-yy-accept.awk
+diff --git a/tests-m32/sigaction.awk b/tests-m32/sigaction.awk
+index 5c6b6d0..3e14464 100644
+--- a/tests-m32/sigaction.awk
++++ b/tests-m32/sigaction.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014 Masatake YAMATO <yamato@redhat.com>
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
-diff --git a/tests/net-yy-connect.awk b/tests/net-yy-connect.awk
-index f4dcf91..b3cec8c 100644
---- a/tests/net-yy-connect.awk
-+++ b/tests/net-yy-connect.awk
+ # All rights reserved.
+diff --git a/tests-mx32/caps.awk b/tests-mx32/caps.awk
+index 67003ac..a66f1f0 100644
+--- a/tests-mx32/caps.awk
++++ b/tests-mx32/caps.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014 Masatake YAMATO <yamato@redhat.com>
- # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
-diff --git a/tests/sigaction.awk b/tests/sigaction.awk
-index 5c6b6d0..3e14464 100644
---- a/tests/sigaction.awk
-+++ b/tests/sigaction.awk
+ # This file is part of caps strace test.
+ #
+diff --git a/tests-mx32/match.awk b/tests-mx32/match.awk
+index abfbae9..f2740bf 100644
+--- a/tests-mx32/match.awk
++++ b/tests-mx32/match.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
  # All rights reserved.
-diff --git a/tests/uid.awk b/tests/uid.awk
-index a56c5be..67b0749 100644
---- a/tests/uid.awk
-+++ b/tests/uid.awk
+diff --git a/tests-mx32/sigaction.awk b/tests-mx32/sigaction.awk
+index 5c6b6d0..3e14464 100644
+--- a/tests-mx32/sigaction.awk
++++ b/tests-mx32/sigaction.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
  # All rights reserved.
-diff --git a/tests/unix-yy-accept.awk b/tests/unix-yy-accept.awk
-index 4ed60e4..2a9d9c0 100644
---- a/tests/unix-yy-accept.awk
-+++ b/tests/unix-yy-accept.awk
+diff --git a/tests/caps.awk b/tests/caps.awk
+index 67003ac..a66f1f0 100644
+--- a/tests/caps.awk
++++ b/tests/caps.awk
+@@ -1,4 +1,4 @@
+-#!/bin/gawk
++#!/usr/bin/gawk
+ #
+ # This file is part of caps strace test.
+ #
+diff --git a/tests/match.awk b/tests/match.awk
+index abfbae9..f2740bf 100644
+--- a/tests/match.awk
++++ b/tests/match.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014 Masatake YAMATO <yamato@redhat.com>
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
-diff --git a/tests/unix-yy-connect.awk b/tests/unix-yy-connect.awk
-index 262bf2e..c809dfa 100644
---- a/tests/unix-yy-connect.awk
-+++ b/tests/unix-yy-connect.awk
+ # All rights reserved.
+diff --git a/tests/sigaction.awk b/tests/sigaction.awk
+index 5c6b6d0..3e14464 100644
+--- a/tests/sigaction.awk
++++ b/tests/sigaction.awk
 @@ -1,4 +1,4 @@
 -#!/bin/gawk
 +#!/usr/bin/gawk
  #
- # Copyright (c) 2014 Masatake YAMATO <yamato@redhat.com>
  # Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
--- 
-1.9.1
-
+ # All rights reserved.
diff --git a/meta/recipes-devtools/strace/strace_4.11.bb b/meta/recipes-devtools/strace/strace_4.12.bb
similarity index 75%
rename from meta/recipes-devtools/strace/strace_4.11.bb
rename to meta/recipes-devtools/strace/strace_4.12.bb
index 56b64bb..70d7402 100644
--- a/meta/recipes-devtools/strace/strace_4.11.bb
+++ b/meta/recipes-devtools/strace/strace_4.12.bb
@@ -9,18 +9,13 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://more-robust-test-for-m32-mx32-compile-support.patch \
            file://update-gawk-paths.patch \
            file://use-asm-sgidefs.h.patch \
-           file://0001-arc-metag-nios2-or1k-tile-fix-build.patch \
            file://Makefile-ptest.patch \
-           file://0001-tests-scm_rights.c-use-libtests.patch \
-           file://0001-scm_rights-fd.test-rewrite-without-fork.patch \
-           file://0001-Move-gcc-compat-macros-to-gcc_compat.h.patch \
-           file://0001-tests-introduce-libtests.patch \
            file://run-ptest \
            file://0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch \
            "
 
-SRC_URI[md5sum] = "a15d2555a7febb56d00c6e1a51c655dc"
-SRC_URI[sha256sum] = "e86a5f6cd8f941f67f3e4b28f4e60f3d9185c951cf266404533210a2e5cd8152"
+SRC_URI[md5sum] = "efb8611fc332e71ec419c53f59faa93e"
+SRC_URI[sha256sum] = "51144b78cb9ba22211b95a5aafe0af3694c0d575b25975d80ca9dd4dfd7c1e59"
 
 inherit autotools ptest bluetooth
 
-- 
2.8.0


