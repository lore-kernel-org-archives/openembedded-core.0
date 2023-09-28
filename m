Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E478DE80ABF
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 01:38:17 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.5122.1695865095319012541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 18:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mzox5XtR;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c4194f769fso92477325ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 18:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695865094; x=1696469894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yGxKW7VZcOaG+l2Deu3LJ5LY/mZI6Inmn4MbVS2iJCk=;
        b=mzox5XtRrAuybsA5VcQfvjMAL77B1qSvMlRfYsogjJRnrnWBhaN9Fjt1fZ8wpWTmk+
         ntDPYk4wic0ceNxTz7yvQdi+hDofd4oDWIDtkbmpYNkxTcsVKYQNe1p8oTOKLj1MT0MO
         o+NbdjW+wTHRgIyoBl1GSN8k0C3ieU1SJUUVMdl/Bg9FI8UxQET1CxMEkhEIZMaqJcHt
         v5AM0DtnckIuWp0sZ2pflxRZK3C3yVh0IxygT2sEBKLwXgCYssoGRA1DhPGhDZVlnQh6
         jwRRdT8bIKWogZm6OpUwD7rxNofuGNEnHvCiUGVpiG04AtND70iLzbEjJ6Uqwz6mhuXl
         wk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695865094; x=1696469894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGxKW7VZcOaG+l2Deu3LJ5LY/mZI6Inmn4MbVS2iJCk=;
        b=qBe+eB5WdAMj+DNTf3eLYkCIuFOdh8lhYoZyd0uT1OBRLczlfQdMx9ta2QVklkF5If
         rOw7K6RITuYJFqubIR9hUh+sdNEPzql8jkKu/1xKx+XyfyAkYvTk7cmPsiETywZa7hdI
         dRbc5+VFMnR96l8UXHOlJJlYCWx0jOOmuUlfQnG/hTttUawIAs7kRpJt0dBV8dTtY0o3
         rkFHPT4nKHanK/pB2rjFFllU1HA7y1M6OXA9jbPvi2e4xV+avs7n1e5/kqVa6gOKS4jT
         Wtr6i+1Qr0DDWneFMhVgjxQcYrnM7nUxovIA2jhk0dF4gCqnEz3nCKiL9CSJZeaMqTon
         oN3A==
X-Gm-Message-State: AOJu0YxxCVYaHX6UaJlN/RZKok7E5Kn2oGLaJ294rLxHIPrrUD/xNCWy
	EPDu1AxLco+9PYuoD8d5uu06iwhuygGRDA==
X-Google-Smtp-Source: AGHT+IG7KtRu8gIl0sLhxdlP7TQxhYhMRZnrz7BEZ1j5w7YHxGTkjlSSczM5M1Nmr69qT9isd/eR/w==
X-Received: by 2002:a17:903:41d2:b0:1bc:6861:d746 with SMTP id u18-20020a17090341d200b001bc6861d746mr3758595ple.58.1695865094359;
        Wed, 27 Sep 2023 18:38:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id jw1-20020a170903278100b001c452f827casm13902431plb.257.2023.09.27.18.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 18:38:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] Revert "glibc: fix CVE-2023-4527"
Date: Wed, 27 Sep 2023 18:38:11 -0700
Message-ID: <20230928013811.3074352-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 01:38:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188348

This reverts commit 82dfa7b8ac5661134da21307d07d9ea2ed3ac6ea.

Its already included in the glibc minor update patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glibc/glibc/0024-CVE-2023-4527.patch      | 219 ------------------
 meta/recipes-core/glibc/glibc_2.38.bb         |   1 -
 2 files changed, 220 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch
deleted file mode 100644
index 7d9adf6a667..00000000000
--- a/meta/recipes-core/glibc/glibc/0024-CVE-2023-4527.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-From 4ea972b7edd7e36610e8cde18bf7a8149d7bac4f Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Wed, 13 Sep 2023 14:10:56 +0200
-Subject: [PATCH] CVE-2023-4527: Stack read overflow with large TCP responses
- in no-aaaa mode
-
-Without passing alt_dns_packet_buffer, __res_context_search can only
-store 2048 bytes (what fits into dns_packet_buffer).  However,
-the function returns the total packet size, and the subsequent
-DNS parsing code in _nss_dns_gethostbyname4_r reads beyond the end
-of the stack-allocated buffer.
-
-Fixes commit f282cdbe7f436c75864e5640a4 ("resolv: Implement no-aaaa
-stub resolver option") and bug 30842.
-
-(cherry picked from commit bd77dd7e73e3530203be1c52c8a29d08270cb25d)
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]
-CVE: CVE-2023-4527
-
-Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
-
----
- NEWS                          |   7 ++
- resolv/Makefile               |   2 +
- resolv/nss_dns/dns-host.c     |   2 +-
- resolv/tst-resolv-noaaaa-vc.c | 129 ++++++++++++++++++++++++++++++++++
- 4 files changed, 139 insertions(+), 1 deletion(-)
- create mode 100644 resolv/tst-resolv-noaaaa-vc.c
-
-diff --git a/NEWS b/NEWS
---- a/NEWS
-+++ b/NEWS
-@@ -126,6 +126,7 @@
-   [30477] libc: [RISCV]: time64 does not work on riscv32
-   [30515] dynamic-link: _dl_find_object incorrectly returns 1 during
-     early startup
-+  [30842] Stack read overflow in getaddrinfo in no-aaaa mode (CVE-2023-4527)
-   [30527] network: resolv_conf lock not unlocked on allocation failure
-   [30550] math: powerpc64le: GCC-specific code for isinf() is being used
-     on clang
-@@ -157,6 +158,12 @@
-   heap and prints it to the target log file, potentially revealing a
-   portion of the contents of the heap.
-
-+  CVE-2023-4527: If the system is configured in no-aaaa mode via
-+  /etc/resolv.conf, getaddrinfo is called for the AF_UNSPEC address
-+  family, and a DNS response is received over TCP that is larger than
-+  2048 bytes, getaddrinfo may potentially disclose stack contents via
-+  the returned address data, or crash.
-+
- The following bugs are resolved with this release:
-
-   [12154] network: Cannot resolve hosts which have wildcard aliases
-diff --git a/resolv/Makefile b/resolv/Makefile
---- a/resolv/Makefile
-+++ b/resolv/Makefile
-@@ -102,6 +102,7 @@
-   tst-resolv-invalid-cname \
-   tst-resolv-network \
-   tst-resolv-noaaaa \
-+  tst-resolv-noaaaa-vc \
-   tst-resolv-nondecimal \
-   tst-resolv-res_init-multi \
-   tst-resolv-search \
-@@ -293,6 +294,7 @@
- $(objpfx)tst-resolv-invalid-cname: $(objpfx)libresolv.so \
-   $(shared-thread-library)
- $(objpfx)tst-resolv-noaaaa: $(objpfx)libresolv.so $(shared-thread-library)
-+$(objpfx)tst-resolv-noaaaa-vc: $(objpfx)libresolv.so $(shared-thread-library)
- $(objpfx)tst-resolv-nondecimal: $(objpfx)libresolv.so $(shared-thread-library)
- $(objpfx)tst-resolv-qtypes: $(objpfx)libresolv.so $(shared-thread-library)
- $(objpfx)tst-resolv-rotate: $(objpfx)libresolv.so $(shared-thread-library)
-diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
---- a/resolv/nss_dns/dns-host.c
-+++ b/resolv/nss_dns/dns-host.c
-@@ -427,7 +427,7 @@ _nss_dns_gethostbyname4_r (const char *name, struct gaih_addrtuple **pat,
-     {
-       n = __res_context_search (ctx, name, C_IN, T_A,
-				dns_packet_buffer, sizeof (dns_packet_buffer),
--				NULL, NULL, NULL, NULL, NULL);
-+				&alt_dns_packet_buffer, NULL, NULL, NULL, NULL);
-       if (n >= 0)
-	status = gaih_getanswer_noaaaa (alt_dns_packet_buffer, n,
-					&abuf, pat, errnop, herrnop, ttlp);
-diff --git a/resolv/tst-resolv-noaaaa-vc.c b/resolv/tst-resolv-noaaaa-vc.c
-new file mode 100644
---- /dev/null
-+++ b/resolv/tst-resolv-noaaaa-vc.c
-@@ -0,0 +1,129 @@
-+/* Test the RES_NOAAAA resolver option with a large response.
-+   Copyright (C) 2022-2023 Free Software Foundation, Inc.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include <errno.h>
-+#include <netdb.h>
-+#include <resolv.h>
-+#include <stdbool.h>
-+#include <stdlib.h>
-+#include <support/check.h>
-+#include <support/check_nss.h>
-+#include <support/resolv_test.h>
-+#include <support/support.h>
-+#include <support/xmemstream.h>
-+
-+/* Used to keep track of the number of queries.  */
-+static volatile unsigned int queries;
-+
-+/* If true, add a large TXT record at the start of the answer section.  */
-+static volatile bool stuff_txt;
-+
-+static void
-+response (const struct resolv_response_context *ctx,
-+          struct resolv_response_builder *b,
-+          const char *qname, uint16_t qclass, uint16_t qtype)
-+{
-+  /* If not using TCP, just force its use.  */
-+  if (!ctx->tcp)
-+    {
-+      struct resolv_response_flags flags = {.tc = true};
-+      resolv_response_init (b, flags);
-+      resolv_response_add_question (b, qname, qclass, qtype);
-+      return;
-+    }
-+
-+  /* The test needs to send four queries, the first three are used to
-+     grow the NSS buffer via the ERANGE handshake.  */
-+  ++queries;
-+  TEST_VERIFY (queries <= 4);
-+
-+  /* AAAA queries are supposed to be disabled.  */
-+  TEST_COMPARE (qtype, T_A);
-+  TEST_COMPARE (qclass, C_IN);
-+  TEST_COMPARE_STRING (qname, "example.com");
-+
-+  struct resolv_response_flags flags = {};
-+  resolv_response_init (b, flags);
-+  resolv_response_add_question (b, qname, qclass, qtype);
-+
-+  resolv_response_section (b, ns_s_an);
-+
-+  if (stuff_txt)
-+    {
-+      resolv_response_open_record (b, qname, qclass, T_TXT, 60);
-+      int zero = 0;
-+      for (int i = 0; i <= 15000; ++i)
-+        resolv_response_add_data (b, &zero, sizeof (zero));
-+      resolv_response_close_record (b);
-+    }
-+
-+  for (int i = 0; i < 200; ++i)
-+    {
-+      resolv_response_open_record (b, qname, qclass, qtype, 60);
-+      char ipv4[4] = {192, 0, 2, i + 1};
-+      resolv_response_add_data (b, &ipv4, sizeof (ipv4));
-+      resolv_response_close_record (b);
-+    }
-+}
-+
-+static int
-+do_test (void)
-+{
-+  struct resolv_test *obj = resolv_test_start
-+    ((struct resolv_redirect_config)
-+     {
-+       .response_callback = response
-+     });
-+
-+  _res.options |= RES_NOAAAA;
-+
-+  for (int do_stuff_txt = 0; do_stuff_txt < 2; ++do_stuff_txt)
-+    {
-+      queries = 0;
-+      stuff_txt = do_stuff_txt;
-+
-+      struct addrinfo *ai = NULL;
-+      int ret;
-+      ret = getaddrinfo ("example.com", "80",
-+                         &(struct addrinfo)
-+                         {
-+                           .ai_family = AF_UNSPEC,
-+                           .ai_socktype = SOCK_STREAM,
-+                         }, &ai);
-+
-+      char *expected_result;
-+      {
-+        struct xmemstream mem;
-+        xopen_memstream (&mem);
-+        for (int i = 0; i < 200; ++i)
-+          fprintf (mem.out, "address: STREAM/TCP 192.0.2.%d 80\n", i + 1);
-+        xfclose_memstream (&mem);
-+        expected_result = mem.buffer;
-+      }
-+
-+      check_addrinfo ("example.com", ai, ret, expected_result);
-+
-+      free (expected_result);
-+      freeaddrinfo (ai);
-+    }
-+
-+  resolv_test_end (obj);
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.38.bb b/meta/recipes-core/glibc/glibc_2.38.bb
index 237458d066b..32ccb888f0f 100644
--- a/meta/recipes-core/glibc/glibc_2.38.bb
+++ b/meta/recipes-core/glibc/glibc_2.38.bb
@@ -51,7 +51,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch \
-           file://0024-CVE-2023-4527.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.42.0


