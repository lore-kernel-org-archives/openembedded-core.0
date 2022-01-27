Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E36C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 23:19:08 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.83.1643325546674067712
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 15:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jFtfdLEs;
 spf=pass (domain: mvista.com, ip: 209.85.214.179,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id k17so4298970plk.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 15:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sMwlrHgRKeJ8BnmSb0cXPxgECmc2KseC+X3umvotgn0=;
        b=jFtfdLEsZE2Xm82DXAaZd+FfGRbw5xwydk8LkdnKUu48i9/eFteXJbqa6aQA+2U5QR
         pGCxHbTKsTudrOp+ogU6xmnQB2w4mp7cOkJIpmObixDk5Cv2RlkBXlPqhYzEdKJoSVcx
         HFvr5dPHW1GEdmNhRGyDtMFGrL1I3fnn5Mnb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sMwlrHgRKeJ8BnmSb0cXPxgECmc2KseC+X3umvotgn0=;
        b=0jrbgi1pGE4PR/wdK064Fh1LTdmJIIOn+U8Eq/53KKYSf5A86EdWwrSARbTuVIQMBN
         x5vKz1VxSexooMhYoWj7cqEm3mrww1m6eA+Ak2jtI5D26fpjHbkJ1aYu3e5N+/2zpxfT
         OVwRP6rVDZTX0n8X21ceKpUzueG17uAMEvSnUXfrAgsNZXLV/GYKStQfCUD7Tt0ickml
         8uVqtxcmZwVnHnokiSHFJME84AhydX0k2pXUvl87zYgj+dODmCL59ZWt0rbYE9Jbc1m8
         GLKqiTVevdZ2rJFNOBMhwBknc5eDL/L8hz5hXzWaWFVOOQP+Smn/LGRLbnbQoHhPlbPT
         r34A==
X-Gm-Message-State: AOAM530+C7L5/BjToH9iQHsAeoyVZ8Lhj6wvJAFvd2ATNQjrBZMuSNn5
	xAbEDNvQyvd904S/1gkKW1JxIHTdg7lBFA==
X-Google-Smtp-Source: 
 ABdhPJxOkv5r0DRx/Zaepk30fe6Cga8+04WyWw8BrDAyBb6cnVsscf+NvxL1/H9cnRAUaSSNWFAUIQ==
X-Received: by 2002:a17:902:9a0a:: with SMTP id
 v10mr5478919plp.61.1643325545958;
        Thu, 27 Jan 2022 15:19:05 -0800 (PST)
Received: from black.maotig.mine.nu
 (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 w10sm6131819pfn.153.2022.01.27.15.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 15:19:05 -0800 (PST)
Received: by black.maotig.mine.nu (sSMTP sendmail emulation);
 Thu, 27 Jan 2022 18:19:03 -0500
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Pgowda <pgowda.cve@gmail.com>,
	"Jeremy A . Puhlman" <jpuhlman@mvista.com>
Subject: [dunfell][PATCH 2/2] glibc : Fix CVE-2022-23219
Date: Thu, 27 Jan 2022 18:18:47 -0500
Message-Id: <20220127231847.15062-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127231847.15062-1-jpuhlman@mvista.com>
References: <20220127231847.15062-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 23:19:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161061

From: Pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=226b46770c82899b555986583294b049c6ec9b40]
Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=ef972a4c50014a16132b5c75571cfb6b30bef136]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
(backported from Hardknot submission)
Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 .../glibc/glibc/0001-CVE-2022-23219.patch     | 59 ++++++++++++
 .../glibc/glibc/0002-CVE-2022-23219.patch     | 90 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |  4 +
 3 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch b/meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch
new file mode 100644
index 0000000000..8a18ce9d70
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-CVE-2022-23219.patch
@@ -0,0 +1,59 @@
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
+Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
+---
+ NEWS              |  4 +++-
+ sunrpc/clnt_gen.c | 10 +++++++---
+ 2 files changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 00e71785e8..258ab846a7 100644
+--- a/NEWS
++++ b/NEWS
+@@ -218,6 +218,10 @@ Security related changes:
+   CVE-2022-23218: Passing an overlong file name to the svcunix_create
+   legacy function could result in a stack-based buffer overflow.
+ 
++  CVE-2022-23219: Passing an overlong file name to the clnt_create
++  legacy function could result in a stack-based buffer overflow when
++  using the "unix" protocol.  Reported by Martin Sebor.
++
+ The following bugs are resolved with this release:
+ 
+   [12031] localedata: iconv -t ascii//translit with Greek characters
+diff --git a/sunrpc/clnt_gen.c b/sunrpc/clnt_gen.c
+index 13ced8994e..b44357cd88 100644
+--- a/sunrpc/clnt_gen.c
++++ b/sunrpc/clnt_gen.c
+@@ -57,9 +57,13 @@ clnt_create (const char *hostname, u_long prog, u_long vers,
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
+-- 
+2.26.2
+
diff --git a/meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch b/meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch
new file mode 100644
index 0000000000..fd53dead10
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0002-CVE-2022-23219.patch
@@ -0,0 +1,90 @@
+From 92ae814d0fbd127547636ee00db4b29bc1ac57ee Mon Sep 17 00:00:00 2001
+From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
+Date: Thu, 27 Jan 2022 22:05:32 +0000
+Subject: [PATCH] sunrpc: Test case for clnt_create "unix" buffer overflow (bug
+ 22542)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=ef972a4c50014a16132b5c75571cfb6b30bef136]
+CVE: CVE-2022-23219
+
+Reviewed-by: Siddhesh Poyarekar <siddhesh@sourceware.org>
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
+---
+ sunrpc/Makefile       |  4 +++-
+ sunrpc/tst-bug22542.c | 44 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 47 insertions(+), 1 deletion(-)
+ create mode 100644 sunrpc/tst-bug22542.c
+
+diff --git a/sunrpc/Makefile b/sunrpc/Makefile
+index 321024c74a..c5276368cd 100644
+--- a/sunrpc/Makefile
++++ b/sunrpc/Makefile
+@@ -95,7 +95,7 @@ others += rpcgen
+ endif
+ 
+ tests = tst-xdrmem tst-xdrmem2 test-rpcent tst-udp-error tst-udp-timeout \
+-  tst-udp-nonblocking tst-bug28768
++  tst-udp-nonblocking tst-bug22542 tst-bug28768
+ xtests := tst-getmyaddr
+ 
+ ifeq ($(have-thread-library),yes)
+@@ -246,3 +246,5 @@ $(objpfx)tst-udp-timeout: $(common-objpfx)linkobj/libc.so
+ $(objpfx)tst-udp-nonblocking: $(common-objpfx)linkobj/libc.so
+ $(objpfx)tst-udp-garbage: \
+   $(common-objpfx)linkobj/libc.so $(shared-thread-library)
++
++$(objpfx)tst-bug22542: $(common-objpfx)linkobj/libc.so
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
+-- 
+2.26.2
+
diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/glibc/glibc_2.31.bb
index 4a545cb97d..f35da7ae8c 100644
--- a/meta/recipes-core/glibc/glibc_2.31.bb
+++ b/meta/recipes-core/glibc/glibc_2.31.bb
@@ -78,6 +78,10 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0035-x86_64-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch \
            file://0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch \
            file://0037-Avoid-deadlock-between-pthread_create-and-ctors.patch \
+           file://0001-CVE-2022-23218.patch \
+           file://0002-CVE-2022-23218.patch \
+           file://0001-CVE-2022-23219.patch \
+           file://0002-CVE-2022-23219.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.20.1


