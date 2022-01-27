Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
Subject: [dunfell][PATCH 1/2] glibc : Fix CVE-2022-23218
Date: Thu, 27 Jan 2022 18:18:46 -0500
Message-Id: <20220127231847.15062-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Pgowda <pgowda.cve@gmail.com>, "Jeremy A . Puhlman" <jpuhlman@mvista.com>

From: Pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=e368b12f6c16b6888dda99ba641e999b9c9643c8]
Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=f545ad4928fa1f27a3075265182b38a4f939a5f7]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
(Backported from oe-core hardknot submission)
Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 .../glibc/glibc/0001-CVE-2022-23218.patch     | 169 ++++++++++++++++++
 .../glibc/glibc/0002-CVE-2022-23218.patch     |  80 +++++++++
 2 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch
new file mode 100644
index 0000000000..3f9726a95f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch
@@ -0,0 +1,169 @@
+From a978f48ad05c01987671f6d4a752b96a5a4ea7f1 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Jan 2022 10:21:34 +0100
+Subject: [PATCH 1/2] socket: Add the __sockaddr_un_set function
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=e368b12f6c16b6888dda99ba641e999b9c9643c8]
+CVE: CVE-2022-23218
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
+---
+ include/sys/un.h             | 12 +++++++
+ socket/Makefile              |  2 +-
+ socket/sockaddr_un_set.c     | 41 ++++++++++++++++++++++++
+ socket/tst-sockaddr_un_set.c | 62 ++++++++++++++++++++++++++++++++++++
+ 4 files changed, 116 insertions(+), 1 deletion(-)
+ create mode 100644 socket/sockaddr_un_set.c
+ create mode 100644 socket/tst-sockaddr_un_set.c
+
+diff --git a/include/sys/un.h b/include/sys/un.h
+index bdbee99980..152afd9fc7 100644
+--- a/include/sys/un.h
++++ b/include/sys/un.h
+@@ -1 +1,13 @@
+ #include <socket/sys/un.h>
++
++#ifndef _ISOMAC
++
++/* Set ADDR->sun_family to AF_UNIX and ADDR->sun_path to PATHNAME.
++   Return 0 on success or -1 on failure (due to overlong PATHNAME).
++   The caller should always use sizeof (struct sockaddr_un) as the
++   socket address length, disregaring the length of PATHNAME.
++   Only concrete (non-abstract) pathnames are supported.  */
++int __sockaddr_un_set (struct sockaddr_un *addr, const char *pathname)
++  attribute_hidden;
++
++#endif /* _ISOMAC */
+diff --git a/socket/Makefile b/socket/Makefile
+index 125c042cab..035b5290d1 100644
+--- a/socket/Makefile
++++ b/socket/Makefile
+@@ -29,7 +29,7 @@ headers	:= sys/socket.h sys/un.h bits/sockaddr.h bits/socket.h \
+ routines := accept bind connect getpeername getsockname getsockopt	\
+ 	    listen recv recvfrom recvmsg send sendmsg sendto		\
+ 	    setsockopt shutdown socket socketpair isfdtype opensock	\
+-	    sockatmark accept4 recvmmsg sendmmsg
++	    sockatmark accept4 recvmmsg sendmmsg sockaddr_un_set
+ 
+ tests := tst-accept4
+ 
+diff --git a/socket/sockaddr_un_set.c b/socket/sockaddr_un_set.c
+new file mode 100644
+index 0000000000..0bd40dc34e
+--- /dev/null
++++ b/socket/sockaddr_un_set.c
+@@ -0,0 +1,41 @@
++/* Set the sun_path member of struct sockaddr_un.
++   Copyright (C) 2022 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <errno.h>
++#include <string.h>
++#include <sys/socket.h>
++#include <sys/un.h>
++
++int
++__sockaddr_un_set (struct sockaddr_un *addr, const char *pathname)
++{
++  size_t name_length = strlen (pathname);
++
++  /* The kernel supports names of exactly sizeof (addr->sun_path)
++     bytes, without a null terminator, but userspace does not; see the
++     SUN_LEN macro.  */
++  if (name_length >= sizeof (addr->sun_path))
++    {
++      __set_errno (EINVAL);     /* Error code used by the kernel.  */
++      return -1;
++    }
++
++  addr->sun_family = AF_UNIX;
++  memcpy (addr->sun_path, pathname, name_length + 1);
++  return 0;
++}
+diff --git a/socket/tst-sockaddr_un_set.c b/socket/tst-sockaddr_un_set.c
+new file mode 100644
+index 0000000000..29c2a81afd
+--- /dev/null
++++ b/socket/tst-sockaddr_un_set.c
+@@ -0,0 +1,62 @@
++/* Test the __sockaddr_un_set function.
++   Copyright (C) 2022 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++/* Re-compile the function because the version in libc is not
++   exported.  */
++#include "sockaddr_un_set.c"
++
++#include <support/check.h>
++
++static int
++do_test (void)
++{
++  struct sockaddr_un sun;
++
++  memset (&sun, 0xcc, sizeof (sun));
++  __sockaddr_un_set (&sun, "");
++  TEST_COMPARE (sun.sun_family, AF_UNIX);
++  TEST_COMPARE (__sockaddr_un_set (&sun, ""), 0);
++
++  memset (&sun, 0xcc, sizeof (sun));
++  TEST_COMPARE (__sockaddr_un_set (&sun, "/example"), 0);
++  TEST_COMPARE_STRING (sun.sun_path, "/example");
++
++  {
++    char pathname[108];         /* Length of sun_path (ABI constant).  */
++    memset (pathname, 'x', sizeof (pathname));
++    pathname[sizeof (pathname) - 1] = '\0';
++    memset (&sun, 0xcc, sizeof (sun));
++    TEST_COMPARE (__sockaddr_un_set (&sun, pathname), 0);
++    TEST_COMPARE (sun.sun_family, AF_UNIX);
++    TEST_COMPARE_STRING (sun.sun_path, pathname);
++  }
++
++  {
++    char pathname[109];
++    memset (pathname, 'x', sizeof (pathname));
++    pathname[sizeof (pathname) - 1] = '\0';
++    memset (&sun, 0xcc, sizeof (sun));
++    errno = 0;
++    TEST_COMPARE (__sockaddr_un_set (&sun, pathname), -1);
++    TEST_COMPARE (errno, EINVAL);
++  }
++
++  return 0;
++}
++
++#include <support/test-driver.c>
+-- 
+2.26.2
+
diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch
new file mode 100644
index 0000000000..754da32462
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch
@@ -0,0 +1,80 @@
+From 29b431a7bb45ce7d2fcb869f4d04b87c641534ea Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Jan 2022 10:21:34 +0100
+Subject: [PATCH 2/2] CVE-2022-23218: Buffer overflow in sunrpc svcunix_create
+ (bug 28768)
+
+The sunrpc function svcunix_create suffers from a stack-based buffer
+overflow with overlong pathname arguments.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=f545ad4928fa1f27a3075265182b38a4f939a5f7]
+CVE: CVE-2022-23218
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
+---
+ NEWS              |  3 +++
+ sunrpc/Makefile   |  2 +-
+ sunrpc/svc_unix.c | 11 ++++-------
+ 3 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 296b5406f2..00e71785e8 100644
+--- a/NEWS
++++ b/NEWS
+@@ -215,6 +215,9 @@ Security related changes:
+   addresses for loaded libraries and thus bypass ASLR for a setuid
+   program.  Reported by Marcin Kościelnicki.
+ 
++  CVE-2022-23218: Passing an overlong file name to the svcunix_create
++  legacy function could result in a stack-based buffer overflow.
++
+ The following bugs are resolved with this release:
+ 
+   [12031] localedata: iconv -t ascii//translit with Greek characters
+diff --git a/sunrpc/Makefile b/sunrpc/Makefile
+index d5840d0770..321024c74a 100644
+--- a/sunrpc/Makefile
++++ b/sunrpc/Makefile
+@@ -95,7 +95,7 @@ others += rpcgen
+ endif
+ 
+ tests = tst-xdrmem tst-xdrmem2 test-rpcent tst-udp-error tst-udp-timeout \
+-  tst-udp-nonblocking
++  tst-udp-nonblocking tst-bug28768
+ xtests := tst-getmyaddr
+ 
+ ifeq ($(have-thread-library),yes)
+diff --git a/sunrpc/svc_unix.c b/sunrpc/svc_unix.c
+index e01afeabe6..b065d6063a 100644
+--- a/sunrpc/svc_unix.c
++++ b/sunrpc/svc_unix.c
+@@ -154,7 +154,10 @@ svcunix_create (int sock, u_int sendsize, u_int recvsize, char *path)
+   SVCXPRT *xprt;
+   struct unix_rendezvous *r;
+   struct sockaddr_un addr;
+-  socklen_t len = sizeof (struct sockaddr_in);
++  socklen_t len = sizeof (addr);
++
++  if (__sockaddr_un_set (&addr, path) < 0)
++    return NULL;
+ 
+   if (sock == RPC_ANYSOCK)
+     {
+@@ -165,12 +168,6 @@ svcunix_create (int sock, u_int sendsize, u_int recvsize, char *path)
+ 	}
+       madesock = TRUE;
+     }
+-  memset (&addr, '\0', sizeof (addr));
+-  addr.sun_family = AF_UNIX;
+-  len = strlen (path) + 1;
+-  memcpy (addr.sun_path, path, len);
+-  len += sizeof (addr.sun_family);
+-
+   __bind (sock, (struct sockaddr *) &addr, len);
+ 
+   if (__getsockname (sock, (struct sockaddr *) &addr, &len) != 0
+-- 
+2.26.2
+
-- 
2.20.1

