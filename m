Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697F1C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 13:47:13 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.6304.1642600032272445309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 05:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IvVfq4Ex;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id g2so2652196pgo.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 05:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PuypTEWXXECnGxzhmaHHJJcc6wivWr14TB+ZklfPeng=;
        b=IvVfq4ExRYe4lL9egbCyZhU71UwBTzgFKgoe8du+sFu3KTk4b3nVOGNIoqf3IlEZhg
         v8pwWMt8PpOOq6+xPpmAhuFLBYX7huodsm9ZixEKjGvgiiexxzGDZbR9+OVljNq0RBuy
         XrngMV2HfApF5wVvdTI6xyaGwASdUj7Y5qUd/QMxuWg0XLFMe4uaV08PfX67C6dj2J4y
         bXUUAdKKusn5aeH6NLmiyPIUXIj9mAFOOP8BDwBaqiPRrJWLREhou7zj8Pz8EcSqIWpC
         ak2ZgOYWSwONOKU4xz8nstlo0vlBLVrLZwcE/MuN1M9YhDVNJmNs00Ipt8wjcz3+nnff
         HtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PuypTEWXXECnGxzhmaHHJJcc6wivWr14TB+ZklfPeng=;
        b=R7zOrantlETsilvnfpDPUwi3QRVR+tTw6sQblPQ/yBqOk7Iim3Y8aDcrqmZvm7LN+G
         D4sUj65CjTCLRD6RPfswYYa6Kfdy3e9LK7jHBoX7eUCgdpmfnvtbctIJeSpOh4S+fEtC
         +hUPDelr/dj2OabwLnXr0Ki3EoX99dkALpcLP0meVdsqoSEB15EwfEIsS03AQ72qMgAe
         LM5tooyx+7nAccgF3u1WuB3A2eSWajIYniHnXcuvo+1FNIc5ImlBGGUEG1Uv0ot8y6em
         77ryqG++fZ3YsbOuJzWT4EDAPmgYsN/4Dvk4APznG8EwStDyHXtOOZB0hnQhQfc4Wr4r
         3ZlQ==
X-Gm-Message-State: AOAM530Sw2XEmaVC1Je6YGspm7eIYFWKLiZps8B0Ls+1waKve2uTM64U
	Qxz7yyqjXH0XDT5E6QjNyIIcqkS5JfjUOOVt
X-Google-Smtp-Source: 
 ABdhPJz9h3RZRfN9NVKgCYFiwJ5ZB8hGgigYjZnTaTeSm/uVw/Rayq4gpsB/lojVKgadIm8foFsM7g==
X-Received: by 2002:a63:b204:: with SMTP id x4mr27768522pge.224.1642600031336;
        Wed, 19 Jan 2022 05:47:11 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id
 r4sm15287855pgp.54.2022.01.19.05.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 05:47:10 -0800 (PST)
From: pgowda <sundeep.kokkonda@gmail.com>
X-Google-Original-From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH 2/2] glibc : Fix CVE-2022-23219
Date: Wed, 19 Jan 2022 19:16:58 +0530
Message-Id: <20220119134658.916789-2-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119134658.916789-1-pgowda.cve@gmail.com>
References: <20220119134658.916789-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 13:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160737

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=226b46770c82899b555986583294b049c6ec9b40]
Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=ef972a4c50014a16132b5c75571cfb6b30bef136]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
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
index f40464c43a..235fc37243 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -55,6 +55,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0001-Make-shell-interpreter-overridable-in-tzselect.ksh.patch \
            file://0001-CVE-2022-23218.patch \
            file://0002-CVE-2022-23218.patch \
+           file://0001-CVE-2022-23219.patch \
+           file://0002-CVE-2022-23219.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.25.1


