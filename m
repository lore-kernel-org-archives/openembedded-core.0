Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C59E7F135
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 21:43:39 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.3547.1695764611758541313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 14:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Cz0yly41;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c47309a8ccso80244935ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695764611; x=1696369411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TG6t+yzSYTX0rgDh55kGkJg//IriddcQWsSQ2g3B5vg=;
        b=Cz0yly41un8RqZffLSoH93UkliIuJSqpwlXatq67LVf6bOAm3j5QCHEWKXiX8ltLFC
         9XXsdg5VLlqoPgvtBIg0srXJPUTapqzBWFsh4skpgvcu5qZr6hgSwrCfn2UiCrKoseV8
         AMgS6w597zcYsrz1GSUb9yAe/dJ+YsZe1JnvrvDhSXQI5mMHrM9P9ucUrZQpySrARorT
         Z3qvVEIQcpGxez4y/LL35QwlUCDAjjaFrf1i01mzcKkd770+ubCWd8tbvP69yn1boMBR
         a0ZYZtz1oy7p++jPm6IBsXNBKsBzFgxejmMNmf29cgXzDg39I359PzGSWvV+Uxbm3aOq
         wNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695764611; x=1696369411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TG6t+yzSYTX0rgDh55kGkJg//IriddcQWsSQ2g3B5vg=;
        b=NWC0rS8DVt3HqpF+o1iZBr2O+hZGpMW3E6AunwCgQ1X8yxBA/D2vrB6niZJ1Ek/0Oz
         BAyeA758xJkynnA5cio5zrnyCSkpefJXFarbNvXKxogzv0Nm5x/GvwsSId6H0e2o9o6G
         ZcKMTaoODsFIr/Ix4SpAcH0ozpSvg3lM8cXp9oSbdSDgOrOZgEWkwQKOCuDiF1dem+e0
         zWH5D2wVisizpVVQbSsZyZQdiPrOHXfurgaHQF6L0y6SsgX7AMsorYkFF9I3fBRMN1h2
         DimarnpRV1nY789DP8vUmDkryLwKXE9dhfi2TTYbbYsWOxv/OFspg1A5Tk0RAUlxwy6V
         WdRw==
X-Gm-Message-State: AOJu0Yyw7YF6ZFgVsH3oqDnjNvh9bvNwXZ9euDvUdnZRk+wNwav5tn7m
	m7wThZEkDHptoYn9YDasRPHw4a3+l7Id2Kaa2lg=
X-Google-Smtp-Source: AGHT+IF+wLMJyiCzSCqhZaC7/ws/UzUeBkLyG0eqVchHKFmZuW1lDcCIMm8rRzmv5agT6jKE5J5pyg==
X-Received: by 2002:a17:903:22c5:b0:1c5:e207:836e with SMTP id y5-20020a17090322c500b001c5e207836emr5718514plg.26.1695764610769;
        Tue, 26 Sep 2023 14:43:30 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b5247cac3dsm11487713pli.110.2023.09.26.14.43.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 14:43:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/10] glibc: fix CVE-2023-4527
Date: Tue, 26 Sep 2023 11:43:12 -1000
Message-Id: <04926dc555a0a75cd2c59729b351a997b018cdbc.1695764457.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695764457.git.steve@sakoman.com>
References: <cover.1695764457.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 21:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188271

From: Yash Shinde <Yash.Shinde@windriver.com>

Upstream-Status: Backport[https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0023-CVE-2023-4527.patch      | 219 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.37.bb         |   1 +
 2 files changed, 220 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch

diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch b/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch
new file mode 100644
index 0000000000..211249211a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch
@@ -0,0 +1,219 @@
+From 4ea972b7edd7e36610e8cde18bf7a8149d7bac4f Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Wed, 13 Sep 2023 14:10:56 +0200
+Subject: [PATCH] CVE-2023-4527: Stack read overflow with large TCP responses
+ in no-aaaa mode
+
+Without passing alt_dns_packet_buffer, __res_context_search can only
+store 2048 bytes (what fits into dns_packet_buffer).  However,
+the function returns the total packet size, and the subsequent
+DNS parsing code in _nss_dns_gethostbyname4_r reads beyond the end
+of the stack-allocated buffer.
+
+Fixes commit f282cdbe7f436c75864e5640a4 ("resolv: Implement no-aaaa
+stub resolver option") and bug 30842.
+
+(cherry picked from commit bd77dd7e73e3530203be1c52c8a29d08270cb25d)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]
+CVE: CVE-2023-4527
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+---
+ NEWS                          |   7 ++
+ resolv/Makefile               |   2 +
+ resolv/nss_dns/dns-host.c     |   2 +-
+ resolv/tst-resolv-noaaaa-vc.c | 129 ++++++++++++++++++++++++++++++++++
+ 4 files changed, 139 insertions(+), 1 deletion(-)
+ create mode 100644 resolv/tst-resolv-noaaaa-vc.c
+
+diff --git a/NEWS b/NEWS
+--- a/NEWS
++++ b/NEWS
+@@ -25,6 +25,7 @@
+   [30101] gmon: fix memory corruption issues
+   [30125] dynamic-link: [regression, bisected] glibc-2.37 creates new
+     symlink for libraries without soname
++  [30842] Stack read overflow in getaddrinfo in no-aaaa mode (CVE-2023-4527)
+   [30151] gshadow: Matching sgetsgent, sgetsgent_r ERANGE handling
+   [30163] posix: Fix system blocks SIGCHLD erroneously
+   [30305] x86_64: Fix asm constraints in feraiseexcept
+@@ -54,6 +55,12 @@
+   heap and prints it to the target log file, potentially revealing a
+   portion of the contents of the heap.
+
++  CVE-2023-4527: If the system is configured in no-aaaa mode via
++  /etc/resolv.conf, getaddrinfo is called for the AF_UNSPEC address
++  family, and a DNS response is received over TCP that is larger than
++  2048 bytes, getaddrinfo may potentially disclose stack contents via
++  the returned address data, or crash.
++
+ The following bugs are resolved with this release:
+
+   [12154] network: Cannot resolve hosts which have wildcard aliases
+diff --git a/resolv/Makefile b/resolv/Makefile
+--- a/resolv/Makefile
++++ b/resolv/Makefile
+@@ -101,6 +101,7 @@
+   tst-resolv-invalid-cname \
+   tst-resolv-network \
+   tst-resolv-noaaaa \
++  tst-resolv-noaaaa-vc \
+   tst-resolv-nondecimal \
+   tst-resolv-res_init-multi \
+   tst-resolv-search \
+@@ -292,6 +293,7 @@
+ $(objpfx)tst-resolv-invalid-cname: $(objpfx)libresolv.so \
+   $(shared-thread-library)
+ $(objpfx)tst-resolv-noaaaa: $(objpfx)libresolv.so $(shared-thread-library)
++$(objpfx)tst-resolv-noaaaa-vc: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-nondecimal: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-qtypes: $(objpfx)libresolv.so $(shared-thread-library)
+ $(objpfx)tst-resolv-rotate: $(objpfx)libresolv.so $(shared-thread-library)
+diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
+--- a/resolv/nss_dns/dns-host.c
++++ b/resolv/nss_dns/dns-host.c
+@@ -427,7 +427,7 @@
+     {
+       n = __res_context_search (ctx, name, C_IN, T_A,
+				dns_packet_buffer, sizeof (dns_packet_buffer),
+-				NULL, NULL, NULL, NULL, NULL);
++				&alt_dns_packet_buffer, NULL, NULL, NULL, NULL);
+       if (n >= 0)
+	status = gaih_getanswer_noaaaa (alt_dns_packet_buffer, n,
+					&abuf, pat, errnop, herrnop, ttlp);
+diff --git a/resolv/tst-resolv-noaaaa-vc.c b/resolv/tst-resolv-noaaaa-vc.c
+new file mode 100644
+--- /dev/null
++++ b/resolv/tst-resolv-noaaaa-vc.c
+@@ -0,0 +1,129 @@
++/* Test the RES_NOAAAA resolver option with a large response.
++   Copyright (C) 2022-2023 Free Software Foundation, Inc.
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
++#include <netdb.h>
++#include <resolv.h>
++#include <stdbool.h>
++#include <stdlib.h>
++#include <support/check.h>
++#include <support/check_nss.h>
++#include <support/resolv_test.h>
++#include <support/support.h>
++#include <support/xmemstream.h>
++
++/* Used to keep track of the number of queries.  */
++static volatile unsigned int queries;
++
++/* If true, add a large TXT record at the start of the answer section.  */
++static volatile bool stuff_txt;
++
++static void
++response (const struct resolv_response_context *ctx,
++          struct resolv_response_builder *b,
++          const char *qname, uint16_t qclass, uint16_t qtype)
++{
++  /* If not using TCP, just force its use.  */
++  if (!ctx->tcp)
++    {
++      struct resolv_response_flags flags = {.tc = true};
++      resolv_response_init (b, flags);
++      resolv_response_add_question (b, qname, qclass, qtype);
++      return;
++    }
++
++  /* The test needs to send four queries, the first three are used to
++     grow the NSS buffer via the ERANGE handshake.  */
++  ++queries;
++  TEST_VERIFY (queries <= 4);
++
++  /* AAAA queries are supposed to be disabled.  */
++  TEST_COMPARE (qtype, T_A);
++  TEST_COMPARE (qclass, C_IN);
++  TEST_COMPARE_STRING (qname, "example.com");
++
++  struct resolv_response_flags flags = {};
++  resolv_response_init (b, flags);
++  resolv_response_add_question (b, qname, qclass, qtype);
++
++  resolv_response_section (b, ns_s_an);
++
++  if (stuff_txt)
++    {
++      resolv_response_open_record (b, qname, qclass, T_TXT, 60);
++      int zero = 0;
++      for (int i = 0; i <= 15000; ++i)
++        resolv_response_add_data (b, &zero, sizeof (zero));
++      resolv_response_close_record (b);
++    }
++
++  for (int i = 0; i < 200; ++i)
++    {
++      resolv_response_open_record (b, qname, qclass, qtype, 60);
++      char ipv4[4] = {192, 0, 2, i + 1};
++      resolv_response_add_data (b, &ipv4, sizeof (ipv4));
++      resolv_response_close_record (b);
++    }
++}
++
++static int
++do_test (void)
++{
++  struct resolv_test *obj = resolv_test_start
++    ((struct resolv_redirect_config)
++     {
++       .response_callback = response
++     });
++
++  _res.options |= RES_NOAAAA;
++
++  for (int do_stuff_txt = 0; do_stuff_txt < 2; ++do_stuff_txt)
++    {
++      queries = 0;
++      stuff_txt = do_stuff_txt;
++
++      struct addrinfo *ai = NULL;
++      int ret;
++      ret = getaddrinfo ("example.com", "80",
++                         &(struct addrinfo)
++                         {
++                           .ai_family = AF_UNSPEC,
++                           .ai_socktype = SOCK_STREAM,
++                         }, &ai);
++
++      char *expected_result;
++      {
++        struct xmemstream mem;
++        xopen_memstream (&mem);
++        for (int i = 0; i < 200; ++i)
++          fprintf (mem.out, "address: STREAM/TCP 192.0.2.%d 80\n", i + 1);
++        xfclose_memstream (&mem);
++        expected_result = mem.buffer;
++      }
++
++      check_addrinfo ("example.com", ai, ret, expected_result);
++
++      free (expected_result);
++      freeaddrinfo (ai);
++    }
++
++  resolv_test_end (obj);
++  return 0;
++}
++
++#include <support/test-driver.c>
diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.37.bb
index 3387441cad..caf454f368 100644
--- a/meta/recipes-core/glibc/glibc_2.37.bb
+++ b/meta/recipes-core/glibc/glibc_2.37.bb
@@ -49,6 +49,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
+           file://0023-CVE-2023-4527.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.34.1


