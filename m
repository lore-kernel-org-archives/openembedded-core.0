Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9C4EB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 20:24:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.888.1687983873974324562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 13:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=S962Kcnc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fa99b57a38so3996255e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 13:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687983872; x=1690575872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3CDQLG8O6ZGhCB1XKjTBu5Pc4r+jclSs5wphlvzMWU=;
        b=S962KcncZVP3Rt3+0ZtC/5/xA5Hcd0LX1yHY4TMcMyilUG00mobXL5VuUb2ObygW0E
         E8NLbyeIZ+SMje1kF2jB24j+EIkrcTh/1x0SLvmHu4Kov4DsQnXoJnWzVOgMGuEcY0W9
         /NcgEVerM34A2kYw4M/88kSjs2sg5fDd92MYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687983872; x=1690575872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3CDQLG8O6ZGhCB1XKjTBu5Pc4r+jclSs5wphlvzMWU=;
        b=cTCTBOS4sDOazmW01YPzVCg5hFA+Hlj+YJl2oTK0Oe0RcIQGM+bu25SoIs3NFdjKUk
         q3HZ4ejjk6VmN3piVDDnRJ668OzBXJoGrGwHbX0pQk4zHrOIBzZbmz6olJLBhW8XbY9C
         zZjABK7kkTV2wemE0wiu2iv/iYSwdR4RzPuASttEObII0ruEdS01q3ejQHzyQwOVt8Ug
         O0Vh8OrBxie9tJaznWg0BKYwDvsjAlEH+OB9Ff6lKLgOk/FX+roTrx9lJD1+MtH8rh9I
         Gyi5Tiv2COpmo7yvGy5XJwJs9H0jiRpgRrHuMC1Ju9eDzSIW+vlFL9XqiqbUb4g+cnku
         19Iw==
X-Gm-Message-State: AC+VfDxZupS/OWSo6IKTdPwIL0W0gBcKRVWeWXK1pVMwmd4Hadq5O9Bi
	e7uEB07K1bXdGI5uggw2ATfOu2m0J0/kldQ83gA=
X-Google-Smtp-Source: ACHHUZ7SQycMHAZOiYEWGiLWg/ypFt3Lm8jFppou29zbapqile3EdJryNsY9SgdyEPMHwBVsta+7HQ==
X-Received: by 2002:a1c:7214:0:b0:3fa:8cd5:b64a with SMTP id n20-20020a1c7214000000b003fa8cd5b64amr7365483wmc.0.1687983871914;
        Wed, 28 Jun 2023 13:24:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717])
        by smtp.gmail.com with ESMTPSA id a20-20020a05600c225400b003fbb06af219sm2942159wmm.32.2023.06.28.13.24.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 13:24:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] strace: Update patches/tests with upstream fixes
Date: Wed, 28 Jun 2023 21:24:30 +0100
Message-Id: <20230628202430.2598534-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 20:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183599

Replace the sockopt disable patch with a fix from upstream. Also add a
patch to handle accept/accept4 differences when using glibc optimisations
for platforms where socketcall is used instead of an accept syscall such
as 32 bit x86.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

v2: Add missing patch to allow sockopt tests to pass

 ...e1392f5bd289239b755458dcdeeed69af1da.patch | 303 ++++++++++++++++++
 ...b541b258baec9eba674b5d8dc30007a61542.patch |  50 +++
 ...2f4494779e5c5f170ad10539bfc2dfafe967.patch |  50 +++
 .../strace/strace/skip-sockopt-test.patch     |  37 ---
 meta/recipes-devtools/strace/strace_6.3.bb    |   4 +-
 5 files changed, 406 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-devtools/strace/strace/00ace1392f5bd289239b755458dcdeeed69af1da.patch
 create mode 100644 meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch
 create mode 100644 meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/skip-sockopt-test.patch

diff --git a/meta/recipes-devtools/strace/strace/00ace1392f5bd289239b755458dcdeeed69af1da.patch b/meta/recipes-devtools/strace/strace/00ace1392f5bd289239b755458dcdeeed69af1da.patch
new file mode 100644
index 00000000000..bdf815e55e3
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/00ace1392f5bd289239b755458dcdeeed69af1da.patch
@@ -0,0 +1,303 @@
+From 00ace1392f5bd289239b755458dcdeeed69af1da Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@strace.io>
+Date: Mon, 26 Jun 2023 10:00:00 +0000
+Subject: [PATCH] tests: avoid accept() libc function when tracing accept()
+ syscall
+
+The libc function is allowed to implement accept() using accept4()
+syscall, so migrate to accept4() those tests that trace accept() syscall
+but do not test accept() specifically, and change the test of accept()
+syscall to invoke either __NR_accept or __NR_socketcall(SYS_ACCEPT)
+directly.
+
+* tests/accept_compat.h: Remove.
+* tests/Makefile.am (EXTRA_DIST): Remove accept_compat.h.
+* tests/accept.c [TEST_SYSCALL_NAME]: Do not invoke accept(),
+call __NR_accept or __NR_socketcall if available, or skip the test.
+* tests/net-y-unix.c: Do not include "accept_compat.h".
+(main): Invoke accept4() instead of accept().
+* tests/net-yy-inet.c: Likewise.
+* tests/net-yy-unix.c: Likewise.
+
+Resolves: https://github.com/strace/strace/issues/260
+
+Upstream-Status: Backport
+---
+ tests/Makefile.am     |  1 -
+ tests/accept.c        | 36 ++++++++++++++++++++----------------
+ tests/accept_compat.h | 32 --------------------------------
+ tests/net-y-unix.c    | 16 ++++++++--------
+ tests/net-yy-inet.c   | 12 ++++++------
+ tests/net-yy-unix.c   | 16 ++++++++--------
+ 6 files changed, 42 insertions(+), 71 deletions(-)
+ delete mode 100644 tests/accept_compat.h
+
+Index: strace-6.3/tests/Makefile.am
+===================================================================
+--- strace-6.3.orig/tests/Makefile.am
++++ strace-6.3/tests/Makefile.am
+@@ -776,7 +776,6 @@ check_DATA = \
+ 	# end of check_DATA
+ 
+ EXTRA_DIST = \
+-	accept_compat.h \
+ 	attach-p-cmd.h \
+ 	clock_adjtime-common.c \
+ 	clock_xettime-common.c \
+Index: strace-6.3/tests/accept.c
+===================================================================
+--- strace-6.3.orig/tests/accept.c
++++ strace-6.3/tests/accept.c
+@@ -9,38 +9,36 @@
+  */
+ 
+ #include "tests.h"
+-
++#include "scno.h"
+ #include <unistd.h>
+ 
+-#include "scno.h"
++#ifndef TEST_SYSCALL_NAME
+ 
+-#if defined __NR_accept
++# if defined __NR_accept || defined __NR_socketcall
+ 
+-# ifndef TEST_SYSCALL_NAME
+ #  define TEST_SYSCALL_NAME do_accept
+-
+-#  ifndef TEST_SYSCALL_STR
+-#   define TEST_SYSCALL_STR "accept"
+-#  endif
++#  define TEST_SYSCALL_STR "accept"
+ 
+ static int
+ do_accept(int sockfd, void *addr, void *addrlen)
+ {
++#  ifdef __NR_accept
+ 	return syscall(__NR_accept, sockfd, addr, addrlen);
++#  else /* __NR_socketcall */
++	const long args[] = { sockfd, (long) addr, (long) addrlen };
++	return syscall(__NR_socketcall, 5, args);
++#  endif
+ }
+-# endif /* !TEST_SYSCALL_NAME */
+ 
+-#else /* !__NR_accept */
++# endif /* __NR_accept || __NR_socketcall */
+ 
+-# ifndef TEST_SYSCALL_NAME
+-#  define TEST_SYSCALL_NAME accept
+-# endif
++#endif /* !TEST_SYSCALL_NAME */
+ 
+-#endif /* __NR_accept */
++#ifdef TEST_SYSCALL_NAME
+ 
+-#define TEST_SYSCALL_PREPARE connect_un()
++# define TEST_SYSCALL_PREPARE connect_un()
+ static void connect_un(void);
+-#include "sockname.c"
++# include "sockname.c"
+ 
+ static void
+ connect_un(void)
+@@ -90,3 +88,9 @@ main(void)
+ 	puts("+++ exited with 0 +++");
+ 	return 0;
+ }
++
++#else
++
++SKIP_MAIN_UNDEFINED("__NR_accept || __NR_socketcall")
++
++#endif
+Index: strace-6.3/tests/accept_compat.h
+===================================================================
+--- strace-6.3.orig/tests/accept_compat.h
++++ /dev/null
+@@ -1,32 +0,0 @@
+-/*
+- * Copyright (c) 2018-2019 The strace developers.
+- * All rights reserved.
+- *
+- * SPDX-License-Identifier: GPL-2.0-or-later
+- */
+-
+-#ifndef _STRACE_TESTS_ACCEPT_COMPAT_H_
+-# define _STRACE_TESTS_ACCEPT_COMPAT_H_
+-
+-# include <unistd.h>
+-# include <sys/socket.h>
+-# include "scno.h"
+-
+-# if defined __NR_socketcall && defined __sparc__
+-/*
+- * Work around the fact that
+- * - glibc >= 2.26 uses accept4 syscall to implement accept() call on sparc;
+- * - accept syscall had not been wired up on sparc until v4.4-rc8~4^2~1.
+- */
+-static inline int
+-do_accept(int sockfd, struct sockaddr *addr, socklen_t *addrlen)
+-{
+-	const long args[] = { sockfd, (long) addr, (long) addrlen };
+-
+-	return syscall(__NR_socketcall, 5, args);
+-}
+-# else
+-#  define do_accept accept
+-# endif
+-
+-#endif /* !_STRACE_TESTS_ACCEPT_COMPAT_H_ */
+Index: strace-6.3/tests/net-y-unix.c
+===================================================================
+--- strace-6.3.orig/tests/net-y-unix.c
++++ strace-6.3/tests/net-y-unix.c
+@@ -10,6 +10,7 @@
+ 
+ #include "tests.h"
+ #include <assert.h>
++#include <fcntl.h>
+ #include <stddef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -18,8 +19,6 @@
+ #include <sys/socket.h>
+ #include <sys/un.h>
+ 
+-#include "accept_compat.h"
+-
+ #define TEST_SOCKET "net-y-unix.socket"
+ 
+ int
+@@ -88,12 +87,12 @@ main(void)
+ 	struct sockaddr * const accept_sa = tail_alloc(sizeof(addr));
+ 	memset(accept_sa, 0, sizeof(addr));
+ 	*len = sizeof(addr);
+-	int accept_fd = do_accept(listen_fd, accept_sa, len);
++	int accept_fd = accept4(listen_fd, accept_sa, len, O_CLOEXEC);
+ 	if (accept_fd < 0)
+ 		perror_msg_and_fail("accept");
+ 	unsigned long accept_inode = inode_of_sockfd(accept_fd);
+-	printf("accept(%d<socket:[%lu]>, {sa_family=AF_UNIX}"
+-	       ", [%d => %d]) = %d<socket:[%lu]>\n",
++	printf("accept4(%d<socket:[%lu]>, {sa_family=AF_UNIX}"
++	       ", [%d => %d], SOCK_CLOEXEC) = %d<socket:[%lu]>\n",
+ 	       listen_fd, listen_inode,
+ 	       (int) sizeof(addr), (int) *len,
+ 	       accept_fd, accept_inode);
+@@ -160,14 +159,15 @@ main(void)
+ 
+ 	memset(accept_sa, 0, sizeof(addr));
+ 	*len = sizeof(addr);
+-	accept_fd = do_accept(listen_fd, accept_sa, len);
++	accept_fd = accept4(listen_fd, accept_sa, len, O_CLOEXEC);
+ 	if (accept_fd < 0)
+ 		perror_msg_and_fail("accept");
+ 	accept_inode = inode_of_sockfd(accept_fd);
+ 	const char * const sun_path1 =
+ 		((struct sockaddr_un *) accept_sa)->sun_path + 1;
+-	printf("accept(%d<socket:[%lu]>, {sa_family=AF_UNIX"
+-	       ", sun_path=@\"%s\"}, [%d => %d]) = %d<socket:[%lu]>\n",
++	printf("accept4(%d<socket:[%lu]>, {sa_family=AF_UNIX"
++	       ", sun_path=@\"%s\"}, [%d => %d], SOCK_CLOEXEC)"
++	       " = %d<socket:[%lu]>\n",
+ 	       listen_fd, listen_inode, sun_path1,
+ 	       (int) sizeof(addr), (int) *len,
+ 	       accept_fd, accept_inode);
+Index: strace-6.3/tests/net-yy-inet.c
+===================================================================
+--- strace-6.3.orig/tests/net-yy-inet.c
++++ strace-6.3/tests/net-yy-inet.c
+@@ -10,6 +10,7 @@
+ 
+ #include "tests.h"
+ #include <assert.h>
++#include <fcntl.h>
+ #include <stddef.h>
+ #include <stdio.h>
+ #include <string.h>
+@@ -19,8 +20,6 @@
+ #include <netinet/tcp.h>
+ #include <arpa/inet.h>
+ 
+-#include "accept_compat.h"
+-
+ #ifndef ADDR_FAMILY
+ # define ADDR_FAMILY_FIELD sin_family
+ # define ADDR_FAMILY AF_INET
+@@ -104,14 +103,15 @@ main(void)
+ 	struct sockaddr * const accept_sa = tail_alloc(sizeof(addr));
+ 	memset(accept_sa, 0, sizeof(addr));
+ 	*len = sizeof(addr);
+-	const int accept_fd = do_accept(listen_fd, accept_sa, len);
++	const int accept_fd = accept4(listen_fd, accept_sa, len, O_CLOEXEC);
+ 	if (accept_fd < 0)
+ 		perror_msg_and_fail("accept");
+ 	const unsigned int connect_port =
+ 		ntohs(((struct SOCKADDR_TYPE *) accept_sa)->INPORT);
+-	printf("accept(%d<" TCP_STR ":[" LOOPBACK ":%u]>, {sa_family=" AF_STR
+-	       ", " INPORT_STR "=htons(%u), " INADDR_STR SA_FIELDS "}"
+-	       ", [%u]) = %d<" TCP_STR ":[" LOOPBACK ":%u->" LOOPBACK ":%u]>\n",
++	printf("accept4(%d<" TCP_STR ":[" LOOPBACK ":%u]>, {sa_family=" AF_STR
++	       ", " INPORT_STR "=htons(%u), " INADDR_STR SA_FIELDS "}, [%u]"
++	       ", SOCK_CLOEXEC) = %d<" TCP_STR ":[" LOOPBACK ":%u->" LOOPBACK
++	       ":%u]>\n",
+ 	       listen_fd, listen_port, connect_port, (unsigned) *len,
+ 	       accept_fd, listen_port, connect_port);
+ 
+Index: strace-6.3/tests/net-yy-unix.c
+===================================================================
+--- strace-6.3.orig/tests/net-yy-unix.c
++++ strace-6.3/tests/net-yy-unix.c
+@@ -10,6 +10,7 @@
+ 
+ #include "tests.h"
+ #include <assert.h>
++#include <fcntl.h>
+ #include <stddef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -22,8 +23,6 @@
+ # include "xmalloc.h"
+ #endif
+ 
+-#include "accept_compat.h"
+-
+ #define TEST_SOCKET "net-yy-unix.socket"
+ 
+ int
+@@ -112,12 +111,12 @@ main(void)
+ 	struct sockaddr * const accept_sa = tail_alloc(sizeof(addr));
+ 	memset(accept_sa, 0, sizeof(addr));
+ 	*len = sizeof(addr);
+-	int accept_fd = do_accept(listen_fd, accept_sa, len);
++	int accept_fd = accept4(listen_fd, accept_sa, len, O_CLOEXEC);
+ 	if (accept_fd < 0)
+ 		perror_msg_and_fail("accept");
+ 	unsigned long accept_inode = inode_of_sockfd(accept_fd);
+-	printf("accept(%d<%s:[%lu,\"%s\"]>, {sa_family=AF_UNIX}"
+-	       ", [%d => %d]) = %d<%s:[%lu->%lu,\"%s\"]>\n",
++	printf("accept4(%d<%s:[%lu,\"%s\"]>, {sa_family=AF_UNIX}"
++	       ", [%d => %d], SOCK_CLOEXEC) = %d<%s:[%lu->%lu,\"%s\"]>\n",
+ 	       listen_fd, sock_proto_name, listen_inode, TEST_SOCKET,
+ 	       (int) sizeof(addr), (int) *len,
+ 	       accept_fd, sock_proto_name, accept_inode, connect_inode,
+@@ -191,14 +190,15 @@ main(void)
+ 
+ 	memset(accept_sa, 0, sizeof(addr));
+ 	*len = sizeof(addr);
+-	accept_fd = do_accept(listen_fd, accept_sa, len);
++	accept_fd = accept4(listen_fd, accept_sa, len, O_CLOEXEC);
+ 	if (accept_fd < 0)
+ 		perror_msg_and_fail("accept");
+ 	accept_inode = inode_of_sockfd(accept_fd);
+ 	const char * const sun_path1 =
+ 		((struct sockaddr_un *) accept_sa)->sun_path + 1;
+-	printf("accept(%d<%s:[%lu,\"%s\"]>, {sa_family=AF_UNIX"
+-	       ", sun_path=@\"%s\"}, [%d => %d]) = %d<%s:[%lu->%lu,\"%s\"]>\n",
++	printf("accept4(%d<%s:[%lu,\"%s\"]>, {sa_family=AF_UNIX"
++	       ", sun_path=@\"%s\"}, [%d => %d], SOCK_CLOEXEC)"
++	       " = %d<%s:[%lu->%lu,\"%s\"]>\n",
+ 	       listen_fd, sock_proto_name, listen_inode, TEST_SOCKET,
+ 	       sun_path1, (int) sizeof(addr), (int) *len,
+ 	       accept_fd, sock_proto_name, accept_inode, connect_inode,
diff --git a/meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch b/meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch
new file mode 100644
index 00000000000..b4c6ff99de6
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch
@@ -0,0 +1,50 @@
+From 3bbfb541b258baec9eba674b5d8dc30007a61542 Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@strace.io>
+Date: Wed, 21 Jun 2023 08:00:00 +0000
+Subject: [PATCH] net: enhance getsockopt decoding
+
+When getsockopt syscall fails the kernel sometimes updates the optlen
+argument, for example, NETLINK_LIST_MEMBERSHIPS updates it even if
+optval is not writable.
+
+* src/net.c (SYS_FUNC(getsockopt)): Try to fetch and print optlen
+argument on exiting syscall regardless of getsockopt exit status.
+
+Upstream-Status: Backport
+---
+ src/net.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/src/net.c b/src/net.c
+index f68ccb947..7244b5e57 100644
+--- a/src/net.c
++++ b/src/net.c
+@@ -1038,7 +1038,7 @@ SYS_FUNC(getsockopt)
+ 	} else {
+ 		ulen = get_tcb_priv_ulong(tcp);
+ 
+-		if (syserror(tcp) || umove(tcp, tcp->u_arg[4], &rlen) < 0) {
++		if (umove(tcp, tcp->u_arg[4], &rlen) < 0) {
+ 			/* optval */
+ 			printaddr(tcp->u_arg[3]);
+ 			tprint_arg_next();
+@@ -1047,6 +1047,19 @@ SYS_FUNC(getsockopt)
+ 			tprint_indirect_begin();
+ 			PRINT_VAL_D(ulen);
+ 			tprint_indirect_end();
++		} else if (syserror(tcp)) {
++			/* optval */
++			printaddr(tcp->u_arg[3]);
++			tprint_arg_next();
++
++			/* optlen */
++			tprint_indirect_begin();
++			if (ulen != rlen) {
++				PRINT_VAL_D(ulen);
++				tprint_value_changed();
++			}
++			PRINT_VAL_D(rlen);
++			tprint_indirect_end();
+ 		} else {
+ 			/* optval */
+ 			print_getsockopt(tcp, tcp->u_arg[1], tcp->u_arg[2],
diff --git a/meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch b/meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch
new file mode 100644
index 00000000000..a0843836c21
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch
@@ -0,0 +1,50 @@
+From f31c2f4494779e5c5f170ad10539bfc2dfafe967 Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@strace.io>
+Date: Sat, 24 Jun 2023 08:00:00 +0000
+Subject: [PATCH] tests: update sockopt-sol_netlink test
+
+Update sockopt-sol_netlink test that started to fail, likely
+due to recent linux kernel commit f4e4534850a9 ("net/netlink: fix
+NETLINK_LIST_MEMBERSHIPS length report").
+
+* tests/sockopt-sol_netlink.c (main): Always print changing optlen value
+on exiting syscall.
+
+Reported-by: Alexander Gordeev <agordeev@linux.ibm.com>
+---
+ tests/sockopt-sol_netlink.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+Upstream-Status: Backport
+
+diff --git a/tests/sockopt-sol_netlink.c b/tests/sockopt-sol_netlink.c
+index 82b98adc23..1c33219ac5 100644
+--- a/tests/sockopt-sol_netlink.c
++++ b/tests/sockopt-sol_netlink.c
+@@ -94,7 +94,10 @@ main(void)
+ 			printf("%p", val);
+ 		else
+ 			printf("[%d]", *val);
+-		printf(", [%d]) = %s\n", *len, errstr);
++		printf(", [%d", (int) sizeof(*val));
++		if ((int) sizeof(*val) != *len)
++			printf(" => %d", *len);
++		printf("]) = %s\n", errstr);
+ 
+ 		/* optlen larger than necessary - shortened */
+ 		*len = sizeof(*val) + 1;
+@@ -150,8 +153,12 @@ main(void)
+ 		/* optval EFAULT - print address */
+ 		*len = sizeof(*val);
+ 		get_sockopt(fd, names[i].val, efault, len);
+-		printf("getsockopt(%d, SOL_NETLINK, %s, %p, [%d]) = %s\n",
+-		       fd, names[i].str, efault, *len, errstr);
++		printf("getsockopt(%d, SOL_NETLINK, %s, %p",
++		       fd, names[i].str, efault);
++		printf(", [%d", (int) sizeof(*val));
++		if ((int) sizeof(*val) != *len)
++			printf(" => %d", *len);
++		printf("]) = %s\n", errstr);
+ 
+ 		/* optlen EFAULT - print address */
+ 		get_sockopt(fd, names[i].val, val, len + 1);
diff --git a/meta/recipes-devtools/strace/strace/skip-sockopt-test.patch b/meta/recipes-devtools/strace/strace/skip-sockopt-test.patch
deleted file mode 100644
index 5741bf8672c..00000000000
--- a/meta/recipes-devtools/strace/strace/skip-sockopt-test.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Inappropriate [avoid this test until fixed by upstream]
-
-Reported at https://github.com/strace/strace/issues/257
-
-root@qemux86-64:/usr/lib/strace/ptest/tests# make sockopt-sol_netlink.gen.log
-FAIL: sockopt-sol_netlink.gen.test
-
-#root@qemux86-64:/usr/lib/strace/ptest/tests# diff sockopt-sol_netlink.dir/exp sockopt-sol_netlink.dir/out
-#--- sockopt-sol_netlink.dir/exp
-#+++ sockopt-sol_netlink.dir/out
-#@@ -86,11 +86,11 @@
- setsockopt(3, SOL_NETLINK, NETLINK_LISTEN_ALL_NSID, 0x7fa18a802ffc, -1) = -1 EINVAL (Invalid argument)
- setsockopt(3, SOL_NETLINK, NETLINK_LISTEN_ALL_NSID, 0x7fa18a802ffc, 3) = 0
- setsockopt(3, SOL_NETLINK, NETLINK_LISTEN_ALL_NSID, 0x7fa18a803000, 4) = -1 EFAULT (Bad address)
--getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [0], [8]) = 0
-+getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [0], [4 => 8]) = 0
- getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [0], [5 => 8]) = 0
- getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, NULL, [0 => 8]) = 0
- getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [], [3 => 8]) = 0
--getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 0x7fa18a803000, [8]) = -1 EFAULT (Bad address)
-+getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 0x7fa18a803000, [4]) = -1 EFAULT (Bad address)
- getsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 0x7fa18a802ffc, 0x7fa18a7fd000) = -1 EFAULT (Bad address)
- setsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [233811181], 4) = -1 ENOPROTOOPT (Protocol not available)
- setsockopt(3, SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, [233811181], 5) = -1 ENOPROTOOPT (Protocol not available)
-
-
-
-Index: strace-6.3/tests/sockopt-sol_netlink.gen.test
-===================================================================
---- strace-6.3.orig/tests/sockopt-sol_netlink.gen.test
-+++ strace-6.3/tests/sockopt-sol_netlink.gen.test
-@@ -1,4 +1,5 @@
- #!/bin/sh -efu
- # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (sockopt-sol_netlink -e trace=getsockopt,setsockopt); do not edit.
- . "${srcdir=.}/init.sh"
-+skip_ "Test failing after system upgrades, wait for upstream fixes"
- run_strace_match_diff -e trace=getsockopt,setsockopt
diff --git a/meta/recipes-devtools/strace/strace_6.3.bb b/meta/recipes-devtools/strace/strace_6.3.bb
index 7ba9fcc4681..a47cc717246 100644
--- a/meta/recipes-devtools/strace/strace_6.3.bb
+++ b/meta/recipes-devtools/strace/strace_6.3.bb
@@ -14,7 +14,9 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
-           file://skip-sockopt-test.patch \
+           file://00ace1392f5bd289239b755458dcdeeed69af1da.patch \
+           file://f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch \
+           file://3bbfb541b258baec9eba674b5d8dc30007a61542.patch \
            "
 SRC_URI[sha256sum] = "e17878e301506c1cc301611118ad14efee7f8bcef63b27ace5d290acce7bb731"
 
-- 
2.39.2


