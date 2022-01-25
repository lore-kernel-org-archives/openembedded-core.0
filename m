Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D976C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:46:53 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.7230.1643118392810459867
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:46:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZmFfhEPq;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643118412; x=1674654412;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=k7C2mxiRvpO0A/V0J8ljQg/gloDGSFeG1DnwwkXCuwU=;
  b=ZmFfhEPqIt2ks3u+DAVdTRYwJMIYCziExbTtiR74dT+T6PvHEioGeYqV
   D3S0sRAPV3hxuzMQG2eInhPLRlB6eZH1PSpNbNaA7uDzGUmBub2NnHlZx
   wAaFeSYKE/2ER61Apw97Aim2Vz4B1FuCyUPtzrsIwLA6+DgVaHeaUZ+Z4
   qAnQLjwXLj6Q3TwSzstruC4sQHUFDpk7jFy+RcHdgikNbcvR7iP0VZCPU
   cKihjkyClXObku4UPH3coykc/a4MojZ0FSfsnarr9li+Vw+rflecJKm7W
   iyrCd7i+vCQbgY6xBNX29RKxl8zCiwQPOmv0f0ZHPSmrujgV4w9+cDOQI
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="307016532"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="307016532"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600";
   d="scan'208";a="479494388"
Received: from gleong3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.227.175])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 05:46:51 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 13/13] glibc : Fix CVE-2022-23219
Date: Tue, 25 Jan 2022 21:46:07 +0800
Message-Id: 
 <2d3c5b078feb34cb729902292d2805c9288ebc4c.1643113252.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643113252.git.anuj.mittal@intel.com>
References: <cover.1643113252.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 13:46:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160934

From: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=226b46770c82899b555986583294b049c6ec9b40]
Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=ef972a4c50014a16132b5c75571cfb6b30bef136]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6ad7240c732dd63e74ac32588b92241030c194ae)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../glibc/glibc/0001-CVE-2022-23219.patch     | 55 ++++++++++++
 .../glibc/glibc/0002-CVE-2022-23219.patch     | 89 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.34.bb         |  2 +
 3 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch
new file mode 100644
index 0000000000..261c2909db
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch
@@ -0,0 +1,55 @@
+From 226b46770c82899b555986583294b049c6ec9b40 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 17 Jan 2022 10:21:34 +0100
+Subject: [PATCH] CVE-2022-23219: Buffer overflow in sunrpc clnt_create for
+ "unix" (bug 22542)
+
+Processing an overlong pathname in the sunrpc clnt_create function
+results in a stack-based buffer overflow.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=226b46770c82899b555986583294b049c6ec9b40]
+CVE: CVE-2022-23219
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ NEWS              |  4 +++-
+ sunrpc/clnt_gen.c | 10 +++++++---
+ 2 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index ddd95a8329..38a9ddb2cf 100644
+--- a/NEWS
++++ b/NEWS
+@@ -206,6 +206,10 @@ Security related changes:
+   CVE-2022-23218: Passing an overlong file name to the svcunix_create
+   legacy function could result in a stack-based buffer overflow.
+ 
++  CVE-2022-23219: Passing an overlong file name to the clnt_create
++  legacy function could result in a stack-based buffer overflow when
++  using the "unix" protocol.  Reported by Martin Sebor.
++
+ The following bugs are resolved with this release:
+ 
+   [4737] libc: fork is not async-signal-safe
+diff --git a/sunrpc/clnt_gen.c b/sunrpc/clnt_gen.c
+index 13ced8994e..b44357cd88 100644
+--- a/sunrpc/clnt_gen.c
++++ b/sunrpc/clnt_gen.c
+@@ -57,9 +57,13 @@ clnt_create (const char *hostname, u_lon
+ 
+   if (strcmp (proto, "unix") == 0)
+     {
+-      memset ((char *)&sun, 0, sizeof (sun));
+-      sun.sun_family = AF_UNIX;
+-      strcpy (sun.sun_path, hostname);
++      if (__sockaddr_un_set (&sun, hostname) < 0)
++	{
++	  struct rpc_createerr *ce = &get_rpc_createerr ();
++	  ce->cf_stat = RPC_SYSTEMERROR;
++	  ce->cf_error.re_errno = errno;
++	  return NULL;
++	}
+       sock = RPC_ANYSOCK;
+       client = clntunix_create (&sun, prog, vers, &sock, 0, 0);
+       if (client == NULL)
diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch
new file mode 100644
index 0000000000..6779e9afdf
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch
@@ -0,0 +1,89 @@
+From ef972a4c50014a16132b5c75571cfb6b30bef136 Mon Sep 17 00:00:00 2001
+From: Martin Sebor <msebor@redhat.com>
+Date: Mon, 17 Jan 2022 10:21:34 +0100
+Subject: [PATCH] sunrpc: Test case for clnt_create "unix" buffer overflow (bug
+ 22542)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=ef972a4c50014a16132b5c75571cfb6b30bef136]
+CVE: CVE-2022-23219
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+---
+ sunrpc/Makefile       |  5 ++++-
+ sunrpc/tst-bug22542.c | 44 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 48 insertions(+), 1 deletion(-)
+ create mode 100644 sunrpc/tst-bug22542.c
+
+diff --git a/sunrpc/Makefile b/sunrpc/Makefile
+index 9a31fe48b9..183ef3dc55 100644
+--- a/sunrpc/Makefile
++++ b/sunrpc/Makefile
+@@ -65,7 +65,7 @@ shared-only-routines = $(routines)
+ endif
+ 
+ tests = tst-xdrmem tst-xdrmem2 test-rpcent tst-udp-error tst-udp-timeout \
+-  tst-udp-nonblocking tst-bug28768
++  tst-udp-nonblocking tst-bug22542 tst-bug28768
+ xtests := tst-getmyaddr
+ 
+ ifeq ($(have-thread-library),yes)
+@@ -110,6 +110,8 @@ $(objpfx)tst-udp-nonblocking: $(common-o
+ $(objpfx)tst-udp-garbage: \
+   $(common-objpfx)linkobj/libc.so $(shared-thread-library)
+ 
++$(objpfx)tst-bug22542: $(common-objpfx)linkobj/libc.so
++
+ else # !have-GLIBC_2.31
+ 
+ routines = $(routines-for-nss)
+diff --git a/sunrpc/tst-bug22542.c b/sunrpc/tst-bug22542.c
+new file mode 100644
+index 0000000000..d6cd79787b
+--- /dev/null
++++ b/sunrpc/tst-bug22542.c
+@@ -0,0 +1,44 @@
++/* Test to verify that overlong hostname is rejected by clnt_create
++   and doesn't cause a buffer overflow (bug  22542).
++
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
++#include <rpc/clnt.h>
++#include <string.h>
++#include <support/check.h>
++#include <sys/socket.h>
++#include <sys/un.h>
++
++static int
++do_test (void)
++{
++  /* Create an arbitrary hostname that's longer than fits in sun_path.  */
++  char name [sizeof ((struct sockaddr_un*)0)->sun_path * 2];
++  memset (name, 'x', sizeof name - 1);
++  name [sizeof name - 1] = '\0';
++
++  errno = 0;
++  CLIENT *clnt = clnt_create (name, 0, 0, "unix");
++
++  TEST_VERIFY (clnt == NULL);
++  TEST_COMPARE (errno, EINVAL);
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index 742ab61a2b..92787097aa 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -61,6 +61,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://CVE-2021-43396.patch \
            file://0001-CVE-2022-23218.patch \
            file://0002-CVE-2022-23218.patch \
+           file://0001-CVE-2022-23219.patch \
+           file://0002-CVE-2022-23219.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.34.1


