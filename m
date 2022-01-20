Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811E7C433EF
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 12:43:12 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.11094.1642682591672330955
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 04:43:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gkRWiAEe;
 spf=pass (domain: gmail.com, ip: 209.85.216.43,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id q63so1021696pja.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 04:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i1sEF7EvcjWOKEUliDnrUv+TELJfhhm0i5P08BNHecE=;
        b=gkRWiAEeyqr702ob//TLVPtMZQVtcfQOadeRJNgy9iDYPRlhBfux+vECv5F/jIU0Lg
         vuR/v5IECIoHiTAe/xpAXrTVTAqr8Sl6U90dgI6LptosTDzIt489OO+RpL59hX5XSu5a
         dda/2yPt8NkXtmr/5oXAgfYIvhZrS9yFxAFGHh0dnHetqd8bMinkroC1x55z9T3aadVx
         lXcywu+b8m3EAwuJseBrqCnQSmjxibNTh/F7NpWxVlJOWg6ZdPbR07+7kxwBVo2uBXs8
         nPZIOryBJtPcsvLHd1KGIx6L1FKVYVFHpSV55bRAzszjAUs6Pjzh4esM/0P9oM0pabxc
         MjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i1sEF7EvcjWOKEUliDnrUv+TELJfhhm0i5P08BNHecE=;
        b=N/53NsFeV95ki8hhQ9LOTle3rMh+pYMlqyeKRCq3UfFThH21R5DePWBT5P98lEPaDJ
         nNFyt2x1gAvQTohI/pLGdtYIY7DOO0NFzKcSuDCtAcirpVIzTZOvKv1E895+QEpdVyn3
         qldjq4JE6PTxubXXY8R7sdtw7LJi6EIS56hTX/iw42YOQER6oZHeD+8Iz6VJW20f5Kln
         UjhLwnC0mbEk3wbDH14B3L02n3USpMvtnUIg2KUf/4DNIbm1s/4JFXtcWC+C+Q+ONwdz
         OmnOEFwLrz0oYhCmoMj51opY6M+x11LEAWBCg3jw9YJYyBB4cbzsFaLm4Vn4CfY9mJTi
         kbUg==
X-Gm-Message-State: AOAM531JM1CEYMgWa0EYEvXj2W6dO7UxH4FGrPB9fAn7LJLBg68RbsyQ
	ONe7vWaX+53UYwF6RxZH1+oUXXChrT6UKw==
X-Google-Smtp-Source: 
 ABdhPJy5CAcOZZMnzfcbaqS3HMO4Kss6vut7BV3HQ9FtGhWGRPwy2z9/G2/WgSv0mYsqQInmxJm9Kg==
X-Received: by 2002:a17:902:8ec7:b0:149:8d21:3e49 with SMTP id
 x7-20020a1709028ec700b001498d213e49mr37788489plo.111.1642682591000;
        Thu, 20 Jan 2022 04:43:11 -0800 (PST)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 h10sm3364577pfh.49.2022.01.20.04.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 04:43:10 -0800 (PST)
From: pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [hardknott][PATCH 2/2] glibc : Fix CVE-2022-23219
Date: Thu, 20 Jan 2022 04:43:03 -0800
Message-Id: <20220120124303.190522-2-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220120124303.190522-1-pgowda.cve@gmail.com>
References: <20220120124303.190522-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 12:43:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160757

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=226b46770c82899b555986583294b049c6ec9b40]
Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=ef972a4c50014a16132b5c75571cfb6b30bef136]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../glibc/glibc/0001-CVE-2022-23219.patch     | 55 ++++++++++++
 .../glibc/glibc/0002-CVE-2022-23219.patch     | 89 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |  2 +
 3 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch
new file mode 100644
index 0000000000..dbed6e919c
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
+@@ -151,6 +151,10 @@ Security related changes:
+   CVE-2022-23218: Passing an overlong file name to the svcunix_create
+   legacy function could result in a stack-based buffer overflow.
+ 
++  CVE-2022-23219: Passing an overlong file name to the clnt_create
++  legacy function could result in a stack-based buffer overflow when
++  using the "unix" protocol.  Reported by Martin Sebor.
++
+ The following bugs are resolved with this release:
+ 
+   [10635] libc: realpath portability patches
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
index 0000000000..64e283e26a
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
+@@ -111,6 +111,8 @@ $(objpfx)tst-udp-nonblocking: $(common-o
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
diff --git a/meta/recipes-core/glibc/glibc_2.33.bb b/meta/recipes-core/glibc/glibc_2.33.bb
index a6902e87a8..9c42f11cb3 100644
--- a/meta/recipes-core/glibc/glibc_2.33.bb
+++ b/meta/recipes-core/glibc/glibc_2.33.bb
@@ -59,6 +59,8 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0031-CVE-2021-43396.patch \
            file://0001-CVE-2022-23218.patch \
            file://0002-CVE-2022-23218.patch \
+           file://0001-CVE-2022-23219.patch \
+           file://0002-CVE-2022-23219.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.31.1


