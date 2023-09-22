Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F29ACD4843
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 16:17:49 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.1792.1695399459811637126
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 09:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G2rX9iPq;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99bf3f59905so289960066b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 09:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695399458; x=1696004258; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHNSbZPnUQ8P/LcOAC1Sm6mwgs2E2ZU3TEKanBUPF9s=;
        b=G2rX9iPqIdi3/4aFbwthPilAnsQO+kk2dCiflB6MW+8xY42NkbAw4ZG4+/+V9YtQ63
         xEmENbDfiVw9TU3YqhVu56pRm7FEIm494b/7moD0cpOS2pwfuO5xJChzmYEtTn8QNTj+
         LYaFxfTsgXhwjijvMCtZYZuGHV7YexnOLGthw2kvsTc9W6HsvgTdnvuQZ8dq1BP/DzeQ
         YdH0autJAziLwO5og3zpI2n5ApR9WmeBRLedF0YRXvk4TCboEuZ53hT5/WvA4qA9Td+l
         7JtDeMjCM3NLVKBWTeqlrhuEvwbXqYraZP+4zaJEtrUyPrzE8YmpGGNVhBV79TKC448s
         2qMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695399458; x=1696004258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHNSbZPnUQ8P/LcOAC1Sm6mwgs2E2ZU3TEKanBUPF9s=;
        b=XgbACxSmkzK5KX4DPkhlBtxMWbi/EFLpxPwKECk4KPDjOVYIpWt/J6fuKr33Efmsq0
         Jumh4O4sC+S5IcY75dfRZq+TAAi+i8glfOe1RFDyxnFklNfglQ+ZQn9Oamrc0snfFpad
         C+J1tKXBXwzXGpAmU4HBpaTkrmL3gp3hALVQA0rF6kT/kOiVxdLVR7MjjACGirl4y8Er
         i9bNFRxvtQ1Pk4ub3t0oDECng+hiEG2IihWiL7KGtpQl/R/fTTzKzR9enwuCgPOiaUtp
         MrkhY5V6+RPS0B7IolLkyM3sp4u1w39nX3lzJpI6Q/DUu3gXm+uvZWQWp5Y1emdIjfMr
         Sdzg==
X-Gm-Message-State: AOJu0Yw5avCFDlqEiHqSMfTQG6S+eKfqj5Vrky+S1rLX9RJ2QYhv4sYL
	LTsijtjl7fU7uF4ZpJJlfIxsoWMCzYMHtpqAlUt8Vw==
X-Google-Smtp-Source: AGHT+IFEMxHU0p2e9D/9wWUAO+DShMD9tolcVUE+H1aAvrojT1V2CyOB8xlvy7JQc80mqWNjCD2qqgeMtT3LC9XETEE=
X-Received: by 2002:a17:907:780c:b0:9ae:56ad:65ab with SMTP id
 la12-20020a170907780c00b009ae56ad65abmr5893385ejc.45.1695399457821; Fri, 22
 Sep 2023 09:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230922130940.4142845-1-Yash.Shinde@windriver.com>
In-Reply-To: <20230922130940.4142845-1-Yash.Shinde@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 22 Sep 2023 06:17:26 -1000
Message-ID: <CAOSpxdbcjcmftZcYPhyWGF3++f4zR5p7Y6a=JszupaJ4S5gCAg@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] glibc: fix CVE-2023-4527
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 16:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188127

On Fri, Sep 22, 2023 at 3:10=E2=80=AFAM Shinde, Yash via
lists.openembedded.org
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> Upstream-Status: Backport[https://sourceware.org/git/?p=3Dglibc.git;a=3Dc=
ommitdiff;h=3D4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  .../glibc/glibc/0023-CVE-2023-4527.patch      | 217 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.37.bb         |   1 +
>  2 files changed, 218 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patc=
h
>
> diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch b/met=
a/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch
> new file mode 100644
> index 0000000000..3f549c9542
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0023-CVE-2023-4527.patch
> @@ -0,0 +1,217 @@
> +From 4ea972b7edd7e36610e8cde18bf7a8149d7bac4f Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Wed, 13 Sep 2023 14:10:56 +0200
> +Subject: [PATCH] CVE-2023-4527: Stack read overflow with large TCP respo=
nses
> + in no-aaaa mode
> +
> +Without passing alt_dns_packet_buffer, __res_context_search can only
> +store 2048 bytes (what fits into dns_packet_buffer).  However,
> +the function returns the total packet size, and the subsequent
> +DNS parsing code in _nss_dns_gethostbyname4_r reads beyond the end
> +of the stack-allocated buffer.
> +
> +Fixes commit f282cdbe7f436c75864e5640a4 ("resolv: Implement no-aaaa
> +stub resolver option") and bug 30842.
> +
> +(cherry picked from commit bd77dd7e73e3530203be1c52c8a29d08270cb25d)
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dglibc.git;a=
=3Dcommitdiff;h=3D4ea972b7edd7e36610e8cde18bf7a8149d7bac4f]
> +CVE: CVE-2023-4527

Missing Signed-off-by, please submit a v2

Steve

> +
> +---
> + NEWS                          |   7 ++
> + resolv/Makefile               |   2 +
> + resolv/nss_dns/dns-host.c     |   2 +-
> + resolv/tst-resolv-noaaaa-vc.c | 129 ++++++++++++++++++++++++++++++++++
> + 4 files changed, 139 insertions(+), 1 deletion(-)
> + create mode 100644 resolv/tst-resolv-noaaaa-vc.c
> +
> +diff --git a/NEWS b/NEWS
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -25,6 +25,7 @@
> +   [30101] gmon: fix memory corruption issues
> +   [30125] dynamic-link: [regression, bisected] glibc-2.37 creates new
> +     symlink for libraries without soname
> ++  [30842] Stack read overflow in getaddrinfo in no-aaaa mode (CVE-2023-=
4527)
> +   [30151] gshadow: Matching sgetsgent, sgetsgent_r ERANGE handling
> +   [30163] posix: Fix system blocks SIGCHLD erroneously
> +   [30305] x86_64: Fix asm constraints in feraiseexcept
> +@@ -54,6 +55,12 @@
> +   heap and prints it to the target log file, potentially revealing a
> +   portion of the contents of the heap.
> +
> ++  CVE-2023-4527: If the system is configured in no-aaaa mode via
> ++  /etc/resolv.conf, getaddrinfo is called for the AF_UNSPEC address
> ++  family, and a DNS response is received over TCP that is larger than
> ++  2048 bytes, getaddrinfo may potentially disclose stack contents via
> ++  the returned address data, or crash.
> ++
> + The following bugs are resolved with this release:
> +
> +   [12154] network: Cannot resolve hosts which have wildcard aliases
> +diff --git a/resolv/Makefile b/resolv/Makefile
> +--- a/resolv/Makefile
> ++++ b/resolv/Makefile
> +@@ -101,6 +101,7 @@
> +   tst-resolv-invalid-cname \
> +   tst-resolv-network \
> +   tst-resolv-noaaaa \
> ++  tst-resolv-noaaaa-vc \
> +   tst-resolv-nondecimal \
> +   tst-resolv-res_init-multi \
> +   tst-resolv-search \
> +@@ -292,6 +293,7 @@
> + $(objpfx)tst-resolv-invalid-cname: $(objpfx)libresolv.so \
> +   $(shared-thread-library)
> + $(objpfx)tst-resolv-noaaaa: $(objpfx)libresolv.so $(shared-thread-libra=
ry)
> ++$(objpfx)tst-resolv-noaaaa-vc: $(objpfx)libresolv.so $(shared-thread-li=
brary)
> + $(objpfx)tst-resolv-nondecimal: $(objpfx)libresolv.so $(shared-thread-l=
ibrary)
> + $(objpfx)tst-resolv-qtypes: $(objpfx)libresolv.so $(shared-thread-libra=
ry)
> + $(objpfx)tst-resolv-rotate: $(objpfx)libresolv.so $(shared-thread-libra=
ry)
> +diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
> +--- a/resolv/nss_dns/dns-host.c
> ++++ b/resolv/nss_dns/dns-host.c
> +@@ -427,7 +427,7 @@
> +     {
> +       n =3D __res_context_search (ctx, name, C_IN, T_A,
> +                               dns_packet_buffer, sizeof (dns_packet_buf=
fer),
> +-                              NULL, NULL, NULL, NULL, NULL);
> ++                              &alt_dns_packet_buffer, NULL, NULL, NULL,=
 NULL);
> +       if (n >=3D 0)
> +       status =3D gaih_getanswer_noaaaa (alt_dns_packet_buffer, n,
> +                                       &abuf, pat, errnop, herrnop, ttlp=
);
> +diff --git a/resolv/tst-resolv-noaaaa-vc.c b/resolv/tst-resolv-noaaaa-vc=
.c
> +new file mode 100644
> +--- /dev/null
> ++++ b/resolv/tst-resolv-noaaaa-vc.c
> +@@ -0,0 +1,129 @@
> ++/* Test the RES_NOAAAA resolver option with a large response.
> ++   Copyright (C) 2022-2023 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <https://www.gnu.org/licenses/>.  */
> ++
> ++#include <errno.h>
> ++#include <netdb.h>
> ++#include <resolv.h>
> ++#include <stdbool.h>
> ++#include <stdlib.h>
> ++#include <support/check.h>
> ++#include <support/check_nss.h>
> ++#include <support/resolv_test.h>
> ++#include <support/support.h>
> ++#include <support/xmemstream.h>
> ++
> ++/* Used to keep track of the number of queries.  */
> ++static volatile unsigned int queries;
> ++
> ++/* If true, add a large TXT record at the start of the answer section. =
 */
> ++static volatile bool stuff_txt;
> ++
> ++static void
> ++response (const struct resolv_response_context *ctx,
> ++          struct resolv_response_builder *b,
> ++          const char *qname, uint16_t qclass, uint16_t qtype)
> ++{
> ++  /* If not using TCP, just force its use.  */
> ++  if (!ctx->tcp)
> ++    {
> ++      struct resolv_response_flags flags =3D {.tc =3D true};
> ++      resolv_response_init (b, flags);
> ++      resolv_response_add_question (b, qname, qclass, qtype);
> ++      return;
> ++    }
> ++
> ++  /* The test needs to send four queries, the first three are used to
> ++     grow the NSS buffer via the ERANGE handshake.  */
> ++  ++queries;
> ++  TEST_VERIFY (queries <=3D 4);
> ++
> ++  /* AAAA queries are supposed to be disabled.  */
> ++  TEST_COMPARE (qtype, T_A);
> ++  TEST_COMPARE (qclass, C_IN);
> ++  TEST_COMPARE_STRING (qname, "example.com");
> ++
> ++  struct resolv_response_flags flags =3D {};
> ++  resolv_response_init (b, flags);
> ++  resolv_response_add_question (b, qname, qclass, qtype);
> ++
> ++  resolv_response_section (b, ns_s_an);
> ++
> ++  if (stuff_txt)
> ++    {
> ++      resolv_response_open_record (b, qname, qclass, T_TXT, 60);
> ++      int zero =3D 0;
> ++      for (int i =3D 0; i <=3D 15000; ++i)
> ++        resolv_response_add_data (b, &zero, sizeof (zero));
> ++      resolv_response_close_record (b);
> ++    }
> ++
> ++  for (int i =3D 0; i < 200; ++i)
> ++    {
> ++      resolv_response_open_record (b, qname, qclass, qtype, 60);
> ++      char ipv4[4] =3D {192, 0, 2, i + 1};
> ++      resolv_response_add_data (b, &ipv4, sizeof (ipv4));
> ++      resolv_response_close_record (b);
> ++    }
> ++}
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  struct resolv_test *obj =3D resolv_test_start
> ++    ((struct resolv_redirect_config)
> ++     {
> ++       .response_callback =3D response
> ++     });
> ++
> ++  _res.options |=3D RES_NOAAAA;
> ++
> ++  for (int do_stuff_txt =3D 0; do_stuff_txt < 2; ++do_stuff_txt)
> ++    {
> ++      queries =3D 0;
> ++      stuff_txt =3D do_stuff_txt;
> ++
> ++      struct addrinfo *ai =3D NULL;
> ++      int ret;
> ++      ret =3D getaddrinfo ("example.com", "80",
> ++                         &(struct addrinfo)
> ++                         {
> ++                           .ai_family =3D AF_UNSPEC,
> ++                           .ai_socktype =3D SOCK_STREAM,
> ++                         }, &ai);
> ++
> ++      char *expected_result;
> ++      {
> ++        struct xmemstream mem;
> ++        xopen_memstream (&mem);
> ++        for (int i =3D 0; i < 200; ++i)
> ++          fprintf (mem.out, "address: STREAM/TCP 192.0.2.%d 80\n", i + =
1);
> ++        xfclose_memstream (&mem);
> ++        expected_result =3D mem.buffer;
> ++      }
> ++
> ++      check_addrinfo ("example.com", ai, ret, expected_result);
> ++
> ++      free (expected_result);
> ++      freeaddrinfo (ai);
> ++    }
> ++
> ++  resolv_test_end (obj);
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/gl=
ibc/glibc_2.37.bb
> index 3387441cad..caf454f368 100644
> --- a/meta/recipes-core/glibc/glibc_2.37.bb
> +++ b/meta/recipes-core/glibc/glibc_2.37.bb
> @@ -49,6 +49,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
>             file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter=
.patch \
>             file://0021-fix-create-thread-failed-in-unprivileged-process-=
BZ-.patch \
>             file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bi=
nar.patch \
> +           file://0023-CVE-2023-4527.patch \
>  "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.39.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188101): https://lists.openembedded.org/g/openembedde=
d-core/message/188101
> Mute This Topic: https://lists.openembedded.org/mt/101520576/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

