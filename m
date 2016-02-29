Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id B36E37570D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 19:41:50 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id b67so124327523qgb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 11:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=GRUi6JVcAoWSd7dDzsACf4mohYfhc6tx7l0G/zOpElU=;
	b=R+nohvGK0mlZTe/uXaTKG8sypRzxl16R04kXbLeNkU+bR42GhxwtM6ZQYkWyGhH8U+
	7drd38bpHcYPHTxX3pJc4E3Rh9dVDIy9GD7WcvRfyKROo4mRpFQQKkk5cbhwOOXtLMh7
	XZbShixa1vezg15G1ANLWMVHA+o6PS6eYl7SM06BvyId+PyXthFfsqkkqP749dF9SQKH
	w4pwhYfV6Yqdj8Agqk/SOeYqmM6s6xKpf26XwGETtBp9ag73URfOCicbjN0gHBAySUEz
	b5TblzAgNlaf0NVhHR1sw5X6303Xp5pXAqEMXoadW0Pe4cjgYhorYIAcORIm0b+akuH3
	eojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=GRUi6JVcAoWSd7dDzsACf4mohYfhc6tx7l0G/zOpElU=;
	b=LakiAisBy/FwC7F0f7FKIGpH18LaqtXdSYaZ1GxImml1Eel7Sf9HHW1iXJq0SRfYv3
	NIEtEK3ctvYTcZpEwDuOmZu19jKrczZHx1zroSTPNJbrMZuJFlZbP2/gyUjWjagD7o+n
	W19XktVc4jJpvrUGBQYieI+ceh376Xh9959Aymj2naIqhC1Qsc8wL7xCUbTB8PXJ6JAZ
	1E1LDcVZCwvt0yVNB6i+m6kVIxZH8piG2SWs609eNFnI+jQoULNebrxUBevge6D4Sv13
	i0s2rRWAXe/szKKsEWtmikQ6PCjmFCspxt5Zpw/VCNYa6KTTWM3143MiAy0ajHzNpahb
	jr7g==
X-Gm-Message-State: AD7BkJIBuRDTaN/2niI+ws/paOZqDiKiNmuhg+gmVgrnBBot1autHxSz8oHc8I9bSwWM5Q==
X-Received: by 10.140.41.82 with SMTP id y76mr12570227qgy.3.1456774910942;
	Mon, 29 Feb 2016 11:41:50 -0800 (PST)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	w70sm11542795qge.13.2016.02.29.11.41.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Feb 2016 11:41:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 19:41:43 +0000
Message-Id: <85301d6b13eca892dbf102f5d571792c2297fa69.1456774338.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456774338.git.raj.khem@gmail.com>
References: <cover.1456774338.git.raj.khem@gmail.com>
In-Reply-To: <cover.1456774338.git.raj.khem@gmail.com>
References: <cover.1456774338.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] strace: Backport fixes for compiling with clang
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
X-List-Received-Date: Mon, 29 Feb 2016 19:41:51 -0000

Backport fixes needed to avoid use of VLAs which is not available
on clang/llvm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-Move-gcc-compat-macros-to-gcc_compat.h.patch | 176 ++++++++++++
 ...1-scm_rights-fd.test-rewrite-without-fork.patch | 198 +++++++++++++
 .../strace/0001-tests-introduce-libtests.patch     | 306 +++++++++++++++++++++
 .../0001-tests-scm_rights.c-use-libtests.patch     |  54 ++++
 meta/recipes-devtools/strace/strace_4.11.bb        |   4 +
 5 files changed, 738 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Move-gcc-compat-macros-to-gcc_compat.h.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-scm_rights-fd.test-rewrite-without-fork.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-introduce-libtests.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-scm_rights.c-use-libtests.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-Move-gcc-compat-macros-to-gcc_compat.h.patch b/meta/recipes-devtools/strace/strace/0001-Move-gcc-compat-macros-to-gcc_compat.h.patch
new file mode 100644
index 0000000..aa61e15
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-Move-gcc-compat-macros-to-gcc_compat.h.patch
@@ -0,0 +1,176 @@
+From f32126ba790dd4e61d43a2140b24f02426297bb6 Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Thu, 31 Dec 2015 14:19:41 +0000
+Subject: [PATCH] Move gcc compat macros to gcc_compat.h
+
+* defs.h: Include "gcc_compat.h".
+(GNUC_PREREQ, ATTRIBUTE_NORETURN, ATTRIBUTE_FORMAT,
+ATTRIBUTE_ALIGNED, ATTRIBUTE_PACKED, ATTRIBUTE_MALLOC,
+ATTRIBUTE_NOINLINE, ATTRIBUTE_ALLOC_SIZE): Move ...
+* gcc_compat.h: ... here.
+* Makefile.am (strace_SOURCES): Add gcc_compat.h.
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+ Makefile.am  |  1 +
+ defs.h       | 43 +----------------------------------
+ gcc_compat.h | 73 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 75 insertions(+), 42 deletions(-)
+ create mode 100644 gcc_compat.h
+
+diff --git a/Makefile.am b/Makefile.am
+index ab52778..d43608d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -97,6 +97,7 @@ strace_SOURCES =	\
+ 	flock.c		\
+ 	flock.h		\
+ 	futex.c		\
++	gcc_compat.h	\
+ 	get_robust_list.c \
+ 	getcpu.c	\
+ 	getcwd.c	\
+diff --git a/defs.h b/defs.h
+index 283ab1f..bae212c 100644
+--- a/defs.h
++++ b/defs.h
+@@ -55,6 +55,7 @@
+ #include <sys/syscall.h>
+ 
+ #include "mpers_type.h"
++#include "gcc_compat.h"
+ 
+ #ifndef HAVE_STRERROR
+ const char *strerror(int);
+@@ -68,48 +69,6 @@ const char *strerror(int);
+ extern char *stpcpy(char *dst, const char *src);
+ #endif
+ 
+-#if defined __GNUC__ && defined __GNUC_MINOR__
+-# define GNUC_PREREQ(maj, min)	\
+-	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
+-#else
+-# define __attribute__(x)	/* empty */
+-# define GNUC_PREREQ(maj, min)	0
+-#endif
+-
+-#if GNUC_PREREQ(2, 5)
+-# define ATTRIBUTE_NORETURN	__attribute__((__noreturn__))
+-#else
+-# define ATTRIBUTE_NORETURN	/* empty */
+-#endif
+-
+-#if GNUC_PREREQ(2, 7)
+-# define ATTRIBUTE_FORMAT(args)	__attribute__((__format__ args))
+-# define ATTRIBUTE_ALIGNED(arg)	__attribute__((__aligned__(arg)))
+-# define ATTRIBUTE_PACKED	__attribute__((__packed__))
+-#else
+-# define ATTRIBUTE_FORMAT(args)	/* empty */
+-# define ATTRIBUTE_ALIGNED(arg)	/* empty */
+-# define ATTRIBUTE_PACKED	/* empty */
+-#endif
+-
+-#if GNUC_PREREQ(3, 0)
+-# define ATTRIBUTE_MALLOC	__attribute__((__malloc__))
+-#else
+-# define ATTRIBUTE_MALLOC	/* empty */
+-#endif
+-
+-#if GNUC_PREREQ(3, 1)
+-# define ATTRIBUTE_NOINLINE	__attribute__((__noinline__))
+-#else
+-# define ATTRIBUTE_NOINLINE	/* empty */
+-#endif
+-
+-#if GNUC_PREREQ(4, 3)
+-# define ATTRIBUTE_ALLOC_SIZE(args)	__attribute__((__alloc_size__ args))
+-#else
+-# define ATTRIBUTE_ALLOC_SIZE(args)	/* empty */
+-#endif
+-
+ #ifndef offsetof
+ # define offsetof(type, member)	\
+ 	(((char *) &(((type *) NULL)->member)) - ((char *) (type *) NULL))
+diff --git a/gcc_compat.h b/gcc_compat.h
+new file mode 100644
+index 0000000..1f2c835
+--- /dev/null
++++ b/gcc_compat.h
+@@ -0,0 +1,73 @@
++/*
++ * Copyright (c) 2015 Dmitry V. Levin <ldv@altlinux.org>
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. The name of the author may not be used to endorse or promote products
++ *    derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#ifndef GCC_COMPAT_H_
++#define GCC_COMPAT_H_
++
++#if defined __GNUC__ && defined __GNUC_MINOR__
++# define GNUC_PREREQ(maj, min)	\
++	((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
++#else
++# define __attribute__(x)	/* empty */
++# define GNUC_PREREQ(maj, min)	0
++#endif
++
++#if GNUC_PREREQ(2, 5)
++# define ATTRIBUTE_NORETURN	__attribute__((__noreturn__))
++#else
++# define ATTRIBUTE_NORETURN	/* empty */
++#endif
++
++#if GNUC_PREREQ(2, 7)
++# define ATTRIBUTE_FORMAT(args)	__attribute__((__format__ args))
++# define ATTRIBUTE_ALIGNED(arg)	__attribute__((__aligned__(arg)))
++# define ATTRIBUTE_PACKED	__attribute__((__packed__))
++#else
++# define ATTRIBUTE_FORMAT(args)	/* empty */
++# define ATTRIBUTE_ALIGNED(arg)	/* empty */
++# define ATTRIBUTE_PACKED	/* empty */
++#endif
++
++#if GNUC_PREREQ(3, 0)
++# define ATTRIBUTE_MALLOC	__attribute__((__malloc__))
++#else
++# define ATTRIBUTE_MALLOC	/* empty */
++#endif
++
++#if GNUC_PREREQ(3, 1)
++# define ATTRIBUTE_NOINLINE	__attribute__((__noinline__))
++#else
++# define ATTRIBUTE_NOINLINE	/* empty */
++#endif
++
++#if GNUC_PREREQ(4, 3)
++# define ATTRIBUTE_ALLOC_SIZE(args)	__attribute__((__alloc_size__ args))
++#else
++# define ATTRIBUTE_ALLOC_SIZE(args)	/* empty */
++#endif
++
++#endif
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace/0001-scm_rights-fd.test-rewrite-without-fork.patch b/meta/recipes-devtools/strace/strace/0001-scm_rights-fd.test-rewrite-without-fork.patch
new file mode 100644
index 0000000..c4e645b
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-scm_rights-fd.test-rewrite-without-fork.patch
@@ -0,0 +1,198 @@
+From 3fdcdd47c6a67585123a0a0c8fffabcc9f79a3a2 Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Tue, 12 Jan 2016 14:47:12 +0000
+Subject: [PATCH] scm_rights-fd.test: rewrite without fork
+
+* tests/scm_rights.c (main): Rewrite without fork.
+Place all objects passed to sendmsg and recvmsg at the end
+of memory pages followed by inaccessible pages.
+* tests/scm_rights-fd.test: Update.
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+ tests/scm_rights-fd.test |  12 ++---
+ tests/scm_rights.c       | 122 ++++++++++++++++++++++-------------------------
+ 2 files changed, 63 insertions(+), 71 deletions(-)
+
+diff --git a/tests/scm_rights-fd.test b/tests/scm_rights-fd.test
+index a32ef36..48c5028 100755
+--- a/tests/scm_rights-fd.test
++++ b/tests/scm_rights-fd.test
+@@ -49,18 +49,18 @@ touch -- "$file" ||
+ 	framework_skip_ 'failed to create a file'
+ 
+ run_prog ./scm_rights /dev/zero
+-run_strace_merge -y -x -enetwork $args "$file"
++run_strace -y -x -enetwork $args "$file"
+ 
++sample='\\xf1\\xf2\\xf3\\xf4\\xf5\\xf6\\xf7\\xf8\\xf9\\xfa\\xfb\\xfc\\xfd\\xfe\\xff'
+ n='[1-9][0-9]*'
+-msg='\{msg_name\(0\)=NULL, msg_iov\(1\)=\[\{"\\x00\\x00\\x00\\x00[^"]*", '"$n"'\}\], msg_controllen='"$n"
+-rights='\{cmsg_len='"$n"', cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, \[3</dev/null>, 4</dev/zero>, 5</[^}>]*/(A\\n){127}Z>\]\}'
++msg='\{msg_name\(0\)=NULL, msg_iov\(1\)=\[\{"'"$sample"'", 15\}\], msg_controllen='"$n"
++rights='\{cmsg_len='"$n"', cmsg_level=SOL_SOCKET, cmsg_type=SCM_RIGHTS, \[4</dev/null>, 5</dev/zero>, 6</[^}>]*/(A\\n){127}Z>\]\}'
+ creds='\{cmsg_len='"$n"', cmsg_level=SOL_SOCKET, cmsg_type=SCM_CREDENTIALS, \{pid='"$n"', uid=[0-9]+, gid=[0-9]+\}\}'
+-prefix='[1-9][0-9]* +[0-9]+:[0-9]+:[0-9]+\.[0-9]+ +'
+ EXPECTED="$LOG.expected"
+ 
+ cat > "$EXPECTED" << __EOF__
+-${prefix}sendmsg\\(1<socket:\\[[0-9]+\\]>, $msg, \\[$rights\\], msg_flags=0\\}, 0\\) += $n
+-${prefix}recvmsg\\(0<socket:\\[[0-9]+\\]>, $msg, \\[$creds, $rights\\], msg_flags=0\\}, 0\\) += $n
++sendmsg\\(3<socket:\\[[0-9]+\\]>, $msg, \\[$rights\\], msg_flags=0\\}, 0\\) = 15
++recvmsg\\(0<socket:\\[[0-9]+\\]>, $msg, \\[$creds, $rights\\], msg_flags=0\\}, 0\\) = 15
+ __EOF__
+ 
+ match_grep "$LOG" "$EXPECTED"
+diff --git a/tests/scm_rights.c b/tests/scm_rights.c
+index 1e5e850..00af4d5 100644
+--- a/tests/scm_rights.c
++++ b/tests/scm_rights.c
+@@ -27,26 +27,39 @@
+ 
+ #include "tests.h"
+ #include <assert.h>
+-#include <string.h>
+-#include <stdlib.h>
+-#include <unistd.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <stdlib.h>
++#include <string.h>
++#include <unistd.h>
+ #include <sys/socket.h>
+-#include <sys/wait.h>
+ 
+ int main(int ac, const char **av)
+ {
+-	int i;
+-	int data = 0;
+-	struct iovec iov = {
+-		.iov_base = &data,
+-		.iov_len = sizeof(iov)
+-	};
++	assert(ac > 0);
++	int fds[ac];
++
++	static const char sample[] =
++		"\xf1\xf2\xf3\xf4\xf5\xf6\xf7\xf8\xf9\xfa\xfb\xfc\xfd\xfe\xff";
++	const unsigned int data_size = sizeof(sample) - 1;
++	void *data = tail_alloc(data_size);
++	memcpy(data, sample, data_size);
++
++	struct iovec *iov = tail_alloc(sizeof(struct iovec));
++	iov->iov_base = data;
++	iov->iov_len = data_size;
+ 
+-	while ((i = open("/dev/null", O_RDWR)) < 3)
++	struct msghdr *mh = tail_alloc(sizeof(struct msghdr));
++	memset(mh, 0, sizeof(*mh));
++	mh->msg_iov = iov;
++	mh->msg_iovlen = 1;
++
++	int i;
++	while ((i = open("/dev/null", O_RDWR)) <= ac + 2)
+ 		assert(i >= 0);
+-	(void) close(3);
++	while (i > 2)
++		assert(close(i--) == 0);
++	assert(close(0) == 0);
+ 
+ 	int sv[2];
+ 	if (socketpair(AF_UNIX, SOCK_STREAM, 0, sv))
+@@ -55,60 +68,39 @@ int main(int ac, const char **av)
+ 	if (setsockopt(sv[0], SOL_SOCKET, SO_PASSCRED, &one, sizeof(one)))
+ 		perror_msg_and_skip("setsockopt");
+ 
+-	pid_t pid = fork();
+-	if (pid < 0)
+-		perror_msg_and_fail("fork");
+-
+-	if (pid) {
+-		assert(close(sv[0]) == 0);
+-		assert(dup2(sv[1], 1) == 1);
+-		assert(close(sv[1]) == 0);
+-
+-		int fds[ac];
+-		assert((fds[0] = open("/dev/null", O_RDWR)) == 3);
+-		for (i = 1; i < ac; ++i)
+-			assert((fds[i] = open(av[i], O_RDONLY)) == i + 3);
+-
+-		union {
+-			struct cmsghdr cmsg;
+-			char buf[CMSG_LEN(sizeof(fds))];
+-		} control;
+-
+-		control.cmsg.cmsg_level = SOL_SOCKET;
+-		control.cmsg.cmsg_type = SCM_RIGHTS;
+-		control.cmsg.cmsg_len = CMSG_LEN(sizeof(fds));
+-		memcpy(CMSG_DATA(&control.cmsg), fds, sizeof(fds));
+-
+-		struct msghdr mh = {
+-			.msg_iov = &iov,
+-			.msg_iovlen = 1,
+-			.msg_control = &control,
+-			.msg_controllen = sizeof(control)
+-		};
+-
+-		assert(sendmsg(1, &mh, 0) == sizeof(iov));
+-		assert(close(1) == 0);
+-
+-                int status;
+-		assert(waitpid(pid, &status, 0) == pid);
+-		assert(status == 0);
+-	} else {
+-		assert(close(sv[1]) == 0);
+-		assert(dup2(sv[0], 0) == 0);
+-		assert(close(sv[0]) == 0);
+-
+-		struct cmsghdr control[4 + ac * sizeof(int) / sizeof(struct cmsghdr)];
+-
+-		struct msghdr mh = {
+-			.msg_iov = &iov,
+-			.msg_iovlen = 1,
+-			.msg_control = control,
+-			.msg_controllen = sizeof(control)
+-		};
+-
+-		assert(recvmsg(0, &mh, 0) == sizeof(iov));
+-		assert(close(0) == 0);
++	assert((fds[0] = open("/dev/null", O_RDWR)) == 4);
++	for (i = 1; i < ac; ++i)
++		assert((fds[i] = open(av[i], O_RDONLY)) == i + 4);
++
++	unsigned int cmsg_size = CMSG_SPACE(sizeof(fds));
++	struct cmsghdr *cmsg = tail_alloc(cmsg_size);
++	memset(cmsg, 0, cmsg_size);
++	cmsg->cmsg_level = SOL_SOCKET;
++	cmsg->cmsg_type = SCM_RIGHTS;
++	cmsg->cmsg_len = CMSG_LEN(sizeof(fds));
++	memcpy(CMSG_DATA(cmsg), fds, sizeof(fds));
++
++	mh->msg_control = cmsg;
++	mh->msg_controllen = cmsg_size;
++
++	assert(sendmsg(sv[1], mh, 0) == (int) data_size);
++
++	assert(close(sv[1]) == 0);
++	assert(open("/dev/null", O_RDWR) == sv[1]);
++
++	for (i = 0; i < ac; ++i) {
++		assert(close(fds[i]) == 0);
++		fds[i] = 0;
+ 	}
+ 
++	cmsg_size += CMSG_SPACE(sizeof(struct ucred));
++	cmsg = tail_alloc(cmsg_size);
++	memset(cmsg, 0, cmsg_size);
++	mh->msg_control = cmsg;
++	mh->msg_controllen = cmsg_size;
++
++	assert(recvmsg(0, mh, 0) == (int) data_size);
++	assert(close(0) == 0);
++
+ 	return 0;
+ }
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-introduce-libtests.patch b/meta/recipes-devtools/strace/strace/0001-tests-introduce-libtests.patch
new file mode 100644
index 0000000..1575ecd
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-tests-introduce-libtests.patch
@@ -0,0 +1,306 @@
+From 87e6b230fff800eb768b68b2e5173ebbe83fd3ef Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Sat, 2 Jan 2016 12:05:14 +0000
+Subject: [PATCH] tests: introduce libtests
+
+Introduce tests/libtests.a with common functions for use in tests.
+
+* tests/tests.h: New file.
+* tests/error_msg.c: Likewise.
+* tests/tail_alloc.c: Likewise.
+* tests/get_page_size.c: Likewise.
+* tests/Makefile.am (libtests_a_SOURCES, libtests_a_CPPFLAGS,
+check_LIBRARIES, LDADD): New variables.
+(clock_xettime_LDADD, filter_unavailable_LDADD, mq_LDADD,
+pc_LDADD, times_LDADD): Add $(LDADD).
+* tests/.gitignore: Add libtests.a.
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+ tests/.gitignore      |  1 +
+ tests/Makefile.am     | 20 ++++++++++----
+ tests/error_msg.c     | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ tests/get_page_size.c | 13 +++++++++
+ tests/tail_alloc.c    | 52 ++++++++++++++++++++++++++++++++++++
+ tests/tests.h         | 62 ++++++++++++++++++++++++++++++++++++++++++
+ 6 files changed, 217 insertions(+), 5 deletions(-)
+ create mode 100644 tests/error_msg.c
+ create mode 100644 tests/get_page_size.c
+ create mode 100644 tests/tail_alloc.c
+ create mode 100644 tests/tests.h
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 386a2c2..62d0e56 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -40,6 +40,16 @@ AM_CPPFLAGS = $(ARCH_MFLAGS) \
+ 	      -I$(top_srcdir)
+ AM_LDFLAGS = $(ARCH_MFLAGS)
+ 
++libtests_a_SOURCES = \
++	get_page_size.c \
++	error_msg.c \
++	tail_alloc.c \
++	tests.h \
++	# end of libtests_a_SOURCES
++libtests_a_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
++check_LIBRARIES = libtests.a
++LDADD = libtests.a
++
+ check_PROGRAMS = \
+ 	_newselect \
+ 	adjtimex \
+@@ -146,19 +156,19 @@ check_PROGRAMS = \
+ 	xettimeofday \
+ 	# end of check_PROGRAMS
+ 
+-clock_xettime_LDADD = -lrt
+-filter_unavailable_LDADD = -lpthread
++clock_xettime_LDADD = -lrt $(LDADD)
++filter_unavailable_LDADD = -lpthread $(LDADD)
+ fstat64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
+ fstatat64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
+ ftruncate64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
+ lstat64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
+ mmap64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
+-mq_LDADD = -lrt
++mq_LDADD = -lrt $(LDADD)
+ newfstatat_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
+-pc_LDADD = $(dl_LIBS)
++pc_LDADD = $(dl_LIBS) $(LDADD)
+ stat64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
+ statfs_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
+-times_LDADD = -lrt
++times_LDADD = -lrt $(LDADD)
+ truncate64_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
+ uio_CPPFLAGS = $(AM_CPPFLAGS) -D_FILE_OFFSET_BITS=64
+ stack_fcall_SOURCES = stack-fcall.c \
+diff --git a/tests/error_msg.c b/tests/error_msg.c
+new file mode 100644
+index 0000000..3fd3411
+--- /dev/null
++++ b/tests/error_msg.c
+@@ -0,0 +1,74 @@
++/*
++ * Copyright (c) 2016 Dmitry V. Levin <ldv@altlinux.org>
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. The name of the author may not be used to endorse or promote products
++ *    derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include "tests.h"
++#include <errno.h>
++#include <stdarg.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++void
++perror_msg_and_fail(const char *fmt, ...)
++{
++	int err_no = errno;
++	va_list p;
++
++	va_start(p, fmt);
++	vfprintf(stderr, fmt, p);
++	if (err_no)
++		fprintf(stderr, ": %s\n", strerror(err_no));
++	else
++		putc('\n', stderr);
++	exit(1);
++}
++
++void
++error_msg_and_skip(const char *fmt, ...)
++{
++	va_list p;
++
++	va_start(p, fmt);
++	vfprintf(stderr, fmt, p);
++	putc('\n', stderr);
++	exit(77);
++}
++
++void
++perror_msg_and_skip(const char *fmt, ...)
++{
++	int err_no = errno;
++	va_list p;
++
++	va_start(p, fmt);
++	vfprintf(stderr, fmt, p);
++	if (err_no)
++		fprintf(stderr, ": %s\n", strerror(err_no));
++	else
++		putc('\n', stderr);
++	exit(77);
++}
+diff --git a/tests/get_page_size.c b/tests/get_page_size.c
+new file mode 100644
+index 0000000..aeea861
+--- /dev/null
++++ b/tests/get_page_size.c
+@@ -0,0 +1,13 @@
++#include "tests.h"
++#include <unistd.h>
++
++size_t
++get_page_size(void)
++{
++	static size_t page_size;
++
++	if (!page_size)
++		page_size = sysconf(_SC_PAGESIZE);
++
++	return page_size;
++}
+diff --git a/tests/tail_alloc.c b/tests/tail_alloc.c
+new file mode 100644
+index 0000000..2b8b14e
+--- /dev/null
++++ b/tests/tail_alloc.c
+@@ -0,0 +1,52 @@
++/*
++ * Copyright (c) 2015-2016 Dmitry V. Levin <ldv@altlinux.org>
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. The name of the author may not be used to endorse or promote products
++ *    derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#include "tests.h"
++#include <string.h>
++#include <sys/mman.h>
++
++void *
++tail_alloc(const size_t size)
++{
++	const size_t page_size = get_page_size();
++	const size_t len = (size + page_size - 1) & -page_size;
++	const size_t alloc_size = len + 2 * page_size;
++
++	void *p = mmap(NULL, alloc_size, PROT_READ | PROT_WRITE,
++		       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
++	if (MAP_FAILED == p)
++		perror_msg_and_fail("mmap(%zu)", alloc_size);
++
++	void *start_work = p + page_size;
++	void *tail_guard = start_work + len;
++
++	if (munmap(p, page_size) || munmap(tail_guard, page_size))
++		perror_msg_and_fail("munmap");
++
++	memset(start_work, 0xff, len);
++	return tail_guard - size;
++}
+diff --git a/tests/tests.h b/tests/tests.h
+new file mode 100644
+index 0000000..91fa24e
+--- /dev/null
++++ b/tests/tests.h
+@@ -0,0 +1,62 @@
++/*
++ * Copyright (c) 2016 Dmitry V. Levin <ldv@altlinux.org>
++ * All rights reserved.
++ *
++ * Redistribution and use in source and binary forms, with or without
++ * modification, are permitted provided that the following conditions
++ * are met:
++ * 1. Redistributions of source code must retain the above copyright
++ *    notice, this list of conditions and the following disclaimer.
++ * 2. Redistributions in binary form must reproduce the above copyright
++ *    notice, this list of conditions and the following disclaimer in the
++ *    documentation and/or other materials provided with the distribution.
++ * 3. The name of the author may not be used to endorse or promote products
++ *    derived from this software without specific prior written permission.
++ *
++ * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
++ * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
++ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
++ * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
++ * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
++ * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
++ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
++ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
++ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
++ * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++
++#ifndef TESTS_H_
++# define TESTS_H_
++
++# ifdef HAVE_CONFIG_H
++#  include "config.h"
++# endif
++
++# include <sys/types.h>
++# include "gcc_compat.h"
++
++/* Cached sysconf(_SC_PAGESIZE). */
++size_t get_page_size(void);
++
++/* Print message and strerror(errno) to stderr, then exit(1). */
++void perror_msg_and_fail(const char *, ...)
++	ATTRIBUTE_FORMAT((printf, 1, 2)) ATTRIBUTE_NORETURN;
++/* Print message to stderr, then exit(77). */
++void error_msg_and_skip(const char *, ...)
++	ATTRIBUTE_FORMAT((printf, 1, 2)) ATTRIBUTE_NORETURN;
++/* Print message and strerror(errno) to stderr, then exit(77). */
++void perror_msg_and_skip(const char *, ...)
++	ATTRIBUTE_FORMAT((printf, 1, 2)) ATTRIBUTE_NORETURN;
++
++/*
++ * Allocate memory that ends on the page boundary.
++ * Pages allocated by this call are preceeded by an unmapped page
++ * and followed also by an unmapped page.
++ */
++void *tail_alloc(const size_t)
++	ATTRIBUTE_MALLOC ATTRIBUTE_ALLOC_SIZE((1));
++
++# define SKIP_MAIN_UNDEFINED(arg) \
++	int main(void) { error_msg_and_skip("undefined: %s", arg); }
++
++#endif
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-scm_rights.c-use-libtests.patch b/meta/recipes-devtools/strace/strace/0001-tests-scm_rights.c-use-libtests.patch
new file mode 100644
index 0000000..3fbab8b
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-tests-scm_rights.c-use-libtests.patch
@@ -0,0 +1,54 @@
+From 339a15b619b479c63cafba21d5fc359e613d9ee8 Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Mon, 4 Jan 2016 23:53:31 +0000
+Subject: [PATCH] tests/scm_rights.c: use libtests
+
+* tests/scm_rights.c (main): Use perror_msg_and_fail and perror_msg_and_skip.
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+ tests/scm_rights.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/tests/scm_rights.c b/tests/scm_rights.c
+index c41444f..1e5e850 100644
+--- a/tests/scm_rights.c
++++ b/tests/scm_rights.c
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2014-2015 Dmitry V. Levin <ldv@altlinux.org>
++ * Copyright (c) 2014-2016 Dmitry V. Levin <ldv@altlinux.org>
+  * All rights reserved.
+  *
+  * Redistribution and use in source and binary forms, with or without
+@@ -25,6 +25,7 @@
+  * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
++#include "tests.h"
+ #include <assert.h>
+ #include <string.h>
+ #include <stdlib.h>
+@@ -48,12 +49,15 @@ int main(int ac, const char **av)
+ 	(void) close(3);
+ 
+ 	int sv[2];
+-	assert(socketpair(AF_UNIX, SOCK_STREAM, 0, sv) == 0);
++	if (socketpair(AF_UNIX, SOCK_STREAM, 0, sv))
++		perror_msg_and_skip("socketpair");
+ 	int one = 1;
+-	assert(setsockopt(sv[0], SOL_SOCKET, SO_PASSCRED, &one, sizeof(one)) == 0);
++	if (setsockopt(sv[0], SOL_SOCKET, SO_PASSCRED, &one, sizeof(one)))
++		perror_msg_and_skip("setsockopt");
+ 
+ 	pid_t pid = fork();
+-	assert(pid >= 0);
++	if (pid < 0)
++		perror_msg_and_fail("fork");
+ 
+ 	if (pid) {
+ 		assert(close(sv[0]) == 0);
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/strace/strace_4.11.bb b/meta/recipes-devtools/strace/strace_4.11.bb
index 51ec5b5..7391388 100644
--- a/meta/recipes-devtools/strace/strace_4.11.bb
+++ b/meta/recipes-devtools/strace/strace_4.11.bb
@@ -11,6 +11,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://use-asm-sgidefs.h.patch \
            file://0001-arc-metag-nios2-or1k-tile-fix-build.patch \
            file://Makefile-ptest.patch \
+           file://0001-tests-scm_rights.c-use-libtests.patch \
+           file://0001-scm_rights-fd.test-rewrite-without-fork.patch \
+           file://0001-Move-gcc-compat-macros-to-gcc_compat.h.patch \
+           file://0001-tests-introduce-libtests.patch \
            file://run-ptest \
           "
 
-- 
1.9.1


