Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81572C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 13:47:08 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.6415.1642600027865944631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 05:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VZm40W1U;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 s61-20020a17090a69c300b001b4d0427ea2so6158822pjj.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 05:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HtA+LNTYocFeHm37Ozq6j81ASTK9sx8RqWWXNc5v+To=;
        b=VZm40W1UhIC1wOIRmEQvbNHWdyqSRT1p3sej7ezQFVhXW1pW9i4lhaqws7bxc1m/KV
         MD9vQMjGuLdts0ZDCl6U85jk82iWp7qhSe6kgjfksa03ClkcjotBee6Bls5XdPRgdM01
         Xzf7GWpGpQ/cKmw3DDDhpVHak+EwfnP6kPluqTcD6g3jXs30FakK6D9TzfYt1jOhwAJp
         L6CB9UtcWlb4gUK5P7Va1XTG/kVg4fPZqkZrxmXev3XbS+pqP7KBEYuu6ELphQcETU0b
         M/nHfVr1n+tpS1VwKBSr2Er04CnGHdJlMTT+tXMMRowyX72M1xAOPrMu44xJMJQLIMon
         FTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HtA+LNTYocFeHm37Ozq6j81ASTK9sx8RqWWXNc5v+To=;
        b=QaprmS0BIdrvn6RzC80vXbZ+Ej3Ye2VBc/fSsnJluZBa3KwLzTDJrvUg1Ot/IXks8P
         Lhq6qigVztuALY7yZQ7aQQJT+r0UBRd2eXqYZjsXN5hW3eJ1ye4auNzkfBrOo+BS1lgn
         VtrTjHyeBZ3WuQ9NVgixM5ENRMl4AG90NHwFH4xW2uTBF9D5MAXfqko6OsoM9Laq3W/C
         kWNaE009BWGNCEF08XSwjhtlI54v8YrllA5hOJmxkj9XNbqlDbmHX2oyhQwMYW2kPYGz
         wToiD6o+oAVx5uWIGSJ3SvCPcySqNdQ+uEkTX6e/kswGOiJvXYqbt+zYLDLYoIAo2S8i
         wa9g==
X-Gm-Message-State: AOAM533RDM93Z56KTW4k0nP9DbiEHDJBFLFX8liDzz6T6X/UB/KW697/
	2+gsBU8EDZlTYX5JpXchwMORgoAbQEDiNuaG
X-Google-Smtp-Source: 
 ABdhPJzO98mCaVcz3TsrhMB8pXleIfKKyQgnahI8eEqGmqU5+k3qNzmhuKd+HplwxGOBizSHUp12wQ==
X-Received: by 2002:a17:90b:1a89:: with SMTP id
 ng9mr4385931pjb.190.1642600026524;
        Wed, 19 Jan 2022 05:47:06 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 r4sm15287855pgp.54.2022.01.19.05.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 05:47:05 -0800 (PST)
From: pgowda <sundeep.kokkonda@gmail.com>
X-Google-Original-From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH 1/2] glibc : Fix CVE-2022-23218
Date: Wed, 19 Jan 2022 19:16:57 +0530
Message-Id: <20220119134658.916789-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 13:47:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160736

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=e368b12f6c16b6888dda99ba641e999b9c9643c8]
Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=f545ad4928fa1f27a3075265182b38a4f939a5f7]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../glibc/glibc/0001-CVE-2022-23218.patch     | 178 ++++++++++++++++++
 .../glibc/glibc/0002-CVE-2022-23218.patch     | 126 +++++++++++++
 meta/recipes-core/glibc/glibc_2.34.bb         |   2 +
 3 files changed, 306 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch
new file mode 100644
index 0000000000..4eb1fb7fbe
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-CVE-2022-23218.patch
@@ -0,0 +1,178 @@
+From e368b12f6c16b6888dda99ba641e999b9c9643c8 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Jan 2022 10:21:34 +0100
+Subject: [PATCH] socket: Add the __sockaddr_un_set function
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=e368b12f6c16b6888dda99ba641e999b9c9643c8]
+CVE: CVE-2022-23219
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ include/sys/un.h             | 12 +++++++
+ socket/Makefile              |  6 +++-
+ socket/sockaddr_un_set.c     | 41 ++++++++++++++++++++++++
+ socket/tst-sockaddr_un_set.c | 62 ++++++++++++++++++++++++++++++++++++
+ 4 files changed, 120 insertions(+), 1 deletion(-)
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
+index 39333e10ca..156eec6c85 100644
+--- a/socket/Makefile
++++ b/socket/Makefile
+@@ -29,13 +29,17 @@ headers	:= sys/socket.h sys/un.h bits/sockaddr.h bits/socket.h \
+ routines := accept bind connect getpeername getsockname getsockopt	\
+ 	    listen recv recvfrom recvmsg send sendmsg sendto		\
+ 	    setsockopt shutdown socket socketpair isfdtype opensock	\
+-	    sockatmark accept4 recvmmsg sendmmsg
++	    sockatmark accept4 recvmmsg sendmmsg sockaddr_un_set
+ 
+ tests := \
+   tst-accept4 \
+   tst-sockopt \
+   # tests
+ 
++tests-internal := \
++  tst-sockaddr_un_set \
++  # tests-internal
++
+ tests-time64 := \
+   tst-sockopt-time64 \
+   # tests
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
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch
new file mode 100644
index 0000000000..00fb3266c6
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0002-CVE-2022-23218.patch
@@ -0,0 +1,126 @@
+From f545ad4928fa1f27a3075265182b38a4f939a5f7 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Jan 2022 10:21:34 +0100
+Subject: [PATCH] CVE-2022-23218: Buffer overflow in sunrpc svcunix_create (bug
+ 28768)
+
+The sunrpc function svcunix_create suffers from a stack-based buffer
+overflow with overlong pathname arguments.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=f545ad4928fa1f27a3075265182b38a4f939a5f7]
+CVE: CVE-2022-23218
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ NEWS                  |  3 +++
+ sunrpc/Makefile       |  2 +-
+ sunrpc/svc_unix.c     | 11 ++++-------
+ sunrpc/tst-bug28768.c | 42 ++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 50 insertions(+), 8 deletions(-)
+ create mode 100644 sunrpc/tst-bug28768.c
+
+diff --git a/NEWS b/NEWS
+index 38a9ddb2cf..38802f0673 100644
+--- a/NEWS
++++ b/NEWS
+@@ -203,6 +203,9 @@ Security related changes:
+   parameter number when processing the expansion resulting in a crash.
+   Reported by Philippe Antoine.
+ 
++  CVE-2022-23218: Passing an overlong file name to the svcunix_create
++  legacy function could result in a stack-based buffer overflow.
++
+ The following bugs are resolved with this release:
+ 
+   [4737] libc: fork is not async-signal-safe
+diff --git a/sunrpc/Makefile b/sunrpc/Makefile
+index 183ef3dc55..a79a7195fc 100644
+--- a/sunrpc/Makefile
++++ b/sunrpc/Makefile
+@@ -65,7 +65,7 @@ shared-only-routines = $(routines)
+ endif
+ 
+ tests = tst-xdrmem tst-xdrmem2 test-rpcent tst-udp-error tst-udp-timeout \
+-  tst-udp-nonblocking
++  tst-udp-nonblocking tst-bug28768
+ xtests := tst-getmyaddr
+ 
+ ifeq ($(have-thread-library),yes)
+diff --git a/sunrpc/svc_unix.c b/sunrpc/svc_unix.c
+index f2280b4c49..67177a2e78 100644
+--- a/sunrpc/svc_unix.c
++++ b/sunrpc/svc_unix.c
+@@ -154,7 +154,10 @@ svcunix_create (int sock, u_int sendsize
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
+@@ -165,12 +168,6 @@ svcunix_create (int sock, u_int sendsize
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
+diff --git a/sunrpc/tst-bug28768.c b/sunrpc/tst-bug28768.c
+new file mode 100644
+index 0000000000..35a4b7b0b3
+--- /dev/null
++++ b/sunrpc/tst-bug28768.c
+@@ -0,0 +1,42 @@
++/* Test to verify that long path is rejected by svcunix_create (bug 28768).
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
++   <http://www.gnu.org/licenses/>.  */
++
++#include <errno.h>
++#include <rpc/svc.h>
++#include <shlib-compat.h>
++#include <string.h>
++#include <support/check.h>
++
++/* svcunix_create does not have a default version in linkobj/libc.so.  */
++compat_symbol_reference (libc, svcunix_create, svcunix_create, GLIBC_2_1);
++
++static int
++do_test (void)
++{
++  char pathname[109];
++  memset (pathname, 'x', sizeof (pathname));
++  pathname[sizeof (pathname) - 1] = '\0';
++
++  errno = 0;
++  TEST_VERIFY (svcunix_create (RPC_ANYSOCK, 4096, 4096, pathname) == NULL);
++  TEST_COMPARE (errno, EINVAL);
++
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 27a5d5fa2b..f40464c43a 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -53,6 +53,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://CVE-2021-43396.patch \
            file://0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch \
+           file://0001-CVE-2022-23218.patch \
+           file://0002-CVE-2022-23218.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.25.1


