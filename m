Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C98CD8C92
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 14:07:39 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55507.1780927651894068099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 07:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Y1lx9043;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso29708785e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 07:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780927650; x=1781532450; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTmf7JS/mkFu1xoGJ2Xaqu6mazuHiDjsW096tg6ef1U=;
        b=Y1lx90433tELXdFRF0lkJ+ZVlOPW7O3vlvuGGgJ7AnjL38SSHVLpf6qJU6gCYkrmQR
         ARMj7D6M1W72PCM9/uwKtIcmnZsky2InL7xEbcNpLqmhMXao1AIjQjL+Fe+rs1Z6P3dy
         YhPAMF8Fh1m+44ghrZSJrZ9bCURhJXieKgT1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927650; x=1781532450;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TTmf7JS/mkFu1xoGJ2Xaqu6mazuHiDjsW096tg6ef1U=;
        b=LC/mrhYUmMAJsg/lSzfE9ZctX7H65hwTINulroDpDquVFDVzRJlvobwOGB7XoeFasG
         mKDl8PiRZ6qxKEcfTxMLXNGk7F24OSQ9ZK5uZ6VIrDERo3sIpzwaEJ/AT4B6ByASfthI
         NTjxdLAwvHMevTSkIT6WzCrwYSp6N/OoARUfw0WJAn/7AVlen1Uxg+12P4/8WrBnZ2Mr
         lm6ZoYA3+NxiuxAlJNU/w5Vsd4356l8k6YHJjNqNF3cZUXoVIgDxRMnRdgXQJHtW/qlW
         bkZZhGH922TsHButZMyqM+z7EUDKlKAa4CzPTApFc1hnwD01I4SjUYcTCU39RBEVVau/
         vzmw==
X-Forwarded-Encrypted: i=1; AFNElJ/E25Vs+b7bNBHZoDzegOAtieN565zoshYQtopEYpNLnDCcrJU76PYab746s/TAtlkMTzRJuigbgSHboM+1Km7T+w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YylTQwXz16EQuneiwYM+SeRKgP4cQGogIUIyII3JnAYyLGEuF+b
	EY4FPSiKLljnb2JPrrSZcA46UIzPqZAiXtM55NJ8URHgoCcOVI3Els+LZCD2o4P/NJpU2znzeV8
	FEYYIpA==
X-Gm-Gg: Acq92OHwpHYap91kpMgKrhVZZLDxbYVLt0w9rnyzTQkvKt9hlGmBoxehJZ1JNMq82lR
	GuAmKkCBwZuVUGYTbdLNUcedCCPLfzarJ55axSeDrc+LzFX3pAA0nDmy8STVVvWp9oeOP0UW5aD
	r3Es/vVnOhbvGIwNuD+PmOFlHr4u8x9v0IyBU/OGXo1sHBmQl2juCBAOrZPk5wkwpbHNo/yQRXq
	hSJVQ/u7FC7PFvAVTjcTT4+fJGcyZBJZl+Fdb6WdIkd8+QMeRH/nPZ0Vce5lC7ecZ8OqYof8E9h
	Ukzdntk8xNwbw3WK3zO6KYcaZ7TV0Dyp7+5Zfn6J/zDABGvdt8l0uwwnOvTXJdIb1mGoDGUo9Zt
	leg1afWc3/Dow+agDlyAn4KzfRacQPAhJeGDs2FN5liVgUixf8hBGIWke7iWJQpo/YijzDKT1r6
	OfO3u2JOisWS6+2LOz8ti5npSBWgwcCQMD
X-Received: by 2002:a05:600c:3b09:b0:490:b475:af32 with SMTP id 5b1f17b1804b1-490c25f17d4mr270485165e9.23.1780927649674;
        Mon, 08 Jun 2026 07:07:29 -0700 (PDT)
Received: from localhost ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm49330141f8f.8.2026.06.08.07.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:07:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 16:07:28 +0200
Message-Id: <DJ3Q5V7ZPES9.12KY12E2IQQ53@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] glibc: Fix CVEs
From: =?utf-8?q?J=C3=A9r=C3=A9my_Rosen?= <jeremy.rosen@smile.fr>
To: <jackson.james9803@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260529042811.2210385-1-jacksonj2@kpit.com>
In-Reply-To: <20260529042811.2210385-1-jacksonj2@kpit.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 14:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238245

Hello Jackson

from what I see all the CVE are not applied to the upper branches of
yocto

CVE-2026-5450 is applied to master but not wrynose
CVE-2026-5928 is not applied, neither to master nor wrynose.

The other three CVE seem to be backported correctly

please submit for master/wrynose and the resubmit for scarthgap

Thx a lot
Jeremy


On Fri May 29, 2026 at 6:28 AM CEST, Jackson James via lists.openembedded.o=
rg wrote:
> Fix the following CVEs-
> CVE-2026-4046 CVE-2026-4437 CVE-2026-4438 CVE-2026-5450,
> CVE-2026-5928
>
> Signed-off-by: Jackson James <jacksonj2@kpit.com>
> ---
>  ...ount-records-correctly-CVE-2026-4437.patch | 248 +++++++++++++
>  ...eck-hostname-for-validity-CVE-2026-4.patch | 328 +++++++++++++++++
>  ...x-buffer-overflow-in-scanf-mc-BZ-340.patch | 138 +++++++
>  ...x-ungetwc-operating-on-byte-stream-B.patch | 117 ++++++
>  ...e-pending-character-state-in-IBM1390.patch | 336 ++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.39.bb         |   5 +
>  6 files changed, 1172 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0024-CVE-2026-4437-Coun=
t-records-correctly-CVE-2026-4437.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2026-4438-Chec=
k-hostname-for-validity-CVE-2026-4.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0026-CVE-2026-5450-Fix-=
buffer-overflow-in-scanf-mc-BZ-340.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0027-CVE-2026-5928-Fix-=
ungetwc-operating-on-byte-stream-B.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0028-CVE-2026-4046-Use-=
pending-character-state-in-IBM1390.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0024-CVE-2026-4437-Count-recor=
ds-correctly-CVE-2026-4437.patch b/meta/recipes-core/glibc/glibc/0024-CVE-2=
026-4437-Count-records-correctly-CVE-2026-4437.patch
> new file mode 100644
> index 0000000000..3ad5f41935
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0024-CVE-2026-4437-Count-records-corr=
ectly-CVE-2026-4437.patch
> @@ -0,0 +1,248 @@
> +From 9f5f18aab40ec6b61fa49a007615e6077e9a979b Mon Sep 17 00:00:00 2001
> +From: Carlos O'Donell <carlos@redhat.com>
> +Date: Fri, 20 Mar 2026 16:43:33 -0400
> +Subject: resolv: Count records correctly (CVE-2026-4437)
> +
> +The answer section boundary was previously ignored, and the code in
> +getanswer_ptr would iterate past the last resource record, but not
> +beyond the end of the returned data.  This could lead to subsequent data
> +being interpreted as answer records, thus violating the DNS
> +specification.  Such resource records could be maliciously crafted and
> +hidden from other tooling, but processed by the glibc stub resolver and
> +acted upon by the application.  While we trust the data returned by the
> +configured recursive resolvers, we should not trust its format and
> +should validate it as required.  It is a security issue to incorrectly
> +process the DNS protocol.
> +
> +A regression test is added for response section crossing.
> +
> +No regressions on x86_64-linux-gnu.
> +
> +Reviewed-by: Collin Funk <collin.funk1@gmail.com>
> +
> +CVE: CVE-2026-4437
> +
> +Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=
=3D9f5f18aab40ec6b61fa49a007615e6077e9a979b]
> +Comment: Patch refreshed
> +
> +Signed-off-by: Jackson James <jacksonj2@kpit.com>
> +---
> + resolv/Makefile                 |   4 +
> + resolv/nss_dns/dns-host.c       |   2 +-
> + resolv/tst-resolv-dns-section.c | 162 ++++++++++++++++++++++++++++++++
> + 3 files changed, 167 insertions(+), 1 deletion(-)
> + create mode 100644 resolv/tst-resolv-dns-section.c
> +
> +diff --git a/resolv/Makefile b/resolv/Makefile
> +index abff7fc0..7d2aa9b5 100644
> +--- a/resolv/Makefile
> ++++ b/resolv/Makefile
> +@@ -98,6 +98,7 @@ tests +=3D \
> +   tst-resolv-basic \
> +   tst-resolv-binary \
> +   tst-resolv-byaddr \
> ++  tst-resolv-dns-section \
> +   tst-resolv-edns \
> +   tst-resolv-invalid-cname \
> +   tst-resolv-network \
> +@@ -109,6 +110,7 @@ tests +=3D \
> +   tst-resolv-semi-failure \
> +   tst-resolv-short-response \
> +   tst-resolv-trailing \
> ++  # tests
> +=20
> + # This test calls __res_context_send directly, which is not exported
> + # from libresolv.
> +@@ -286,6 +288,8 @@ $(objpfx)tst-resolv-aliases: $(objpfx)libresolv.so $=
(shared-thread-library)
> + $(objpfx)tst-resolv-basic: $(objpfx)libresolv.so $(shared-thread-librar=
y)
> + $(objpfx)tst-resolv-binary: $(objpfx)libresolv.so $(shared-thread-libra=
ry)
> + $(objpfx)tst-resolv-byaddr: $(objpfx)libresolv.so $(shared-thread-libra=
ry)
> ++$(objpfx)tst-resolv-dns-section: $(objpfx)libresolv.so \
> ++  $(shared-thread-library)
> + $(objpfx)tst-resolv-edns: $(objpfx)libresolv.so $(shared-thread-library=
)
> + $(objpfx)tst-resolv-network: $(objpfx)libresolv.so $(shared-thread-libr=
ary)
> + $(objpfx)tst-resolv-res_init: $(objpfx)libresolv.so
> +diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
> +index 95a7b3f0..74a7c08d 100644
> +--- a/resolv/nss_dns/dns-host.c
> ++++ b/resolv/nss_dns/dns-host.c
> +@@ -820,7 +820,7 @@ getanswer_ptr (unsigned char *packet, size_t packetl=
en,
> +   /* expected_name may be updated to point into this buffer.  */
> +   unsigned char name_buffer[NS_MAXCDNAME];
> +=20
> +-  while (ancount > 0)
> ++  for (; ancount > 0; --ancount)
> +     {
> +       struct ns_rr_wire rr;
> +       if (!__ns_rr_cursor_next (&c, &rr))
> +diff --git a/resolv/tst-resolv-dns-section.c b/resolv/tst-resolv-dns-sec=
tion.c
> +new file mode 100644
> +index 00000000..d233dc5f
> +--- /dev/null
> ++++ b/resolv/tst-resolv-dns-section.c
> +@@ -0,0 +1,162 @@
> ++/* Test handling of invalid section transitions (bug 34014).
> ++   Copyright (C) 2022-2026 Free Software Foundation, Inc.
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
> ++#include <array_length.h>
> ++#include <errno.h>
> ++#include <netdb.h>
> ++#include <resolv.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++#include <support/check.h>
> ++#include <support/format_nss.h>
> ++#include <support/resolv_test.h>
> ++#include <support/support.h>
> ++
> ++/* Name of test, and the second section type.  */
> ++struct item {
> ++  const char *test;
> ++  int ns_section;
> ++};
> ++
> ++static const struct item test_items[] =3D
> ++  {
> ++    { "Test crossing from ns_s_an to ns_s_ar.", ns_s_ar },
> ++    { "Test crossing from ns_s_an to ns_s_an.", ns_s_ns },
> ++
> ++    { NULL, 0 },
> ++  };
> ++
> ++/* The response is designed to contain the following:
> ++   - An Answer section with one T_PTR record that is skipped.
> ++   - A second section with a semantically invalid T_PTR record.
> ++   The original defect is that the response parsing would cross
> ++   section boundaries and handle the additional section T_PTR
> ++   as if it were an answer.  A conforming implementation would
> ++   stop as soon as it reaches the end of the section.  */
> ++static void
> ++response (const struct resolv_response_context *ctx,
> ++          struct resolv_response_builder *b,
> ++          const char *qname, uint16_t qclass, uint16_t qtype)
> ++{
> ++  TEST_COMPARE (qclass, C_IN);
> ++
> ++  /* We only test PTR.  */
> ++  TEST_COMPARE (qtype, T_PTR);
> ++
> ++  unsigned int count;
> ++  char *tail =3D NULL;
> ++
> ++  if (strstr (qname, "in-addr.arpa") !=3D NULL
> ++      && sscanf (qname, "%u.%ms", &count, &tail) =3D=3D 2)
> ++    TEST_COMPARE_STRING (tail, "0.168.192.in-addr.arpa");
> ++  else if (sscanf (qname, "%x.%ms", &count, &tail) =3D=3D 2)
> ++    {
> ++    TEST_COMPARE_STRING (tail, "\
> ++0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa"=
);
> ++    }
> ++  else
> ++    FAIL_EXIT1 ("invalid QNAME: %s\n", qname);
> ++  free (tail);
> ++
> ++  /* We have a bounded number of possible tests.  */
> ++  TEST_VERIFY (count >=3D 0);
> ++  TEST_VERIFY (count <=3D 15);
> ++
> ++  struct resolv_response_flags flags =3D {};
> ++  resolv_response_init (b, flags);
> ++  resolv_response_add_question (b, qname, qclass, qtype);
> ++  resolv_response_section (b, ns_s_an);
> ++
> ++  /* Actual answer record, but the wrong name (skipped).  */
> ++  resolv_response_open_record (b, "1.0.0.10.in-addr.arpa", qclass, qtyp=
e, 60);
> ++
> ++  /* Record the answer.  */
> ++  resolv_response_add_name (b, "test.ptr.example.net");
> ++  resolv_response_close_record (b);
> ++
> ++  /* Add a second section to test section boundary crossing.  */
> ++  resolv_response_section (b, test_items[count].ns_section);
> ++  /* Semantically incorrect, but hide a T_PTR entry.  */
> ++  resolv_response_open_record (b, qname, qclass, qtype, 60);
> ++  resolv_response_add_name (b, "wrong.ptr.example.net");
> ++  resolv_response_close_record (b);
> ++}
> ++
> ++
> ++/* Perform one check using a reverse lookup.  */
> ++static void
> ++check_reverse (int af, int count)
> ++{
> ++  TEST_VERIFY (af =3D=3D AF_INET || af =3D=3D AF_INET6);
> ++  TEST_VERIFY (count < array_length (test_items));
> ++
> ++  char addr[sizeof (struct in6_addr)] =3D { 0 };
> ++  socklen_t addrlen;
> ++  if (af =3D=3D AF_INET)
> ++    {
> ++      addr[0] =3D (char) 192;
> ++      addr[1] =3D (char) 168;
> ++      addr[2] =3D (char) 0;
> ++      addr[3] =3D (char) count;
> ++      addrlen =3D 4;
> ++    }
> ++  else
> ++    {
> ++      addr[0] =3D 0x20;
> ++      addr[1] =3D 0x01;
> ++      addr[2] =3D 0x0d;
> ++      addr[3] =3D 0xb8;
> ++      addr[4] =3D addr[5] =3D addr[6] =3D addr[7] =3D 0x0;
> ++      addr[8] =3D addr[9] =3D addr[10] =3D addr[11] =3D 0x0;
> ++      addr[12] =3D 0x0;
> ++      addr[13] =3D 0x0;
> ++      addr[14] =3D 0x0;
> ++      addr[15] =3D count;
> ++      addrlen =3D 16;
> ++    }
> ++
> ++  h_errno =3D 0;
> ++  struct hostent *answer =3D gethostbyaddr (addr, addrlen, af);
> ++  TEST_VERIFY (answer =3D=3D NULL);
> ++  TEST_VERIFY (h_errno =3D=3D NO_RECOVERY);
> ++  if (answer !=3D NULL)
> ++    printf ("error: unexpected success: %s\n",
> ++	    support_format_hostent (answer));
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
> ++  for (int i =3D 0; test_items[i].test !=3D NULL; i++)
> ++    {
> ++      check_reverse (AF_INET, i);
> ++      check_reverse (AF_INET6, i);
> ++    }
> ++
> ++  resolv_test_end (obj);
> ++
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2026-4438-Check-hostn=
ame-for-validity-CVE-2026-4.patch b/meta/recipes-core/glibc/glibc/0025-CVE-=
2026-4438-Check-hostname-for-validity-CVE-2026-4.patch
> new file mode 100644
> index 0000000000..b95cc99e06
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0025-CVE-2026-4438-Check-hostname-for=
-validity-CVE-2026-4.patch
> @@ -0,0 +1,328 @@
> +From e10977481f4db4b2a3ce34fa4c3a1e26651ae312 Mon Sep 17 00:00:00 2001
> +From: Carlos O'Donell <carlos@redhat.com>
> +Date: Fri, 20 Mar 2026 17:14:33 -0400
> +Subject: resolv: Check hostname for validity (CVE-2026-4438)
> +
> +The processed hostname in getanswer_ptr should be correctly checked to
> +avoid invalid characters from being allowed, including shell
> +metacharacters. It is a security issue to fail to check the returned
> +hostname for validity.
> +
> +A regression test is added for invalid metacharacters and other cases
> +of invalid or valid characters.
> +
> +No regressions on x86_64-linux-gnu.
> +
> +Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
> +
> +CVE: CVE-2026-4438
> +
> +Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=
=3De10977481f4db4b2a3ce34fa4c3a1e26651ae312]
> +Comment: Patch refreshed
> +
> +Signed-off-by: Jackson James <jacksonj2@kpit.com>
> +---
> + resolv/Makefile                 |   3 +
> + resolv/nss_dns/dns-host.c       |   2 +-
> + resolv/tst-resolv-invalid-ptr.c | 255 ++++++++++++++++++++++++++++++++
> + 3 files changed, 259 insertions(+), 1 deletion(-)
> + create mode 100644 resolv/tst-resolv-invalid-ptr.c
> +
> +diff --git a/resolv/Makefile b/resolv/Makefile
> +index 7d2aa9b5..20ffa9b5 100644
> +--- a/resolv/Makefile
> ++++ b/resolv/Makefile
> +@@ -101,6 +101,7 @@ tests +=3D \
> +   tst-resolv-dns-section \
> +   tst-resolv-edns \
> +   tst-resolv-invalid-cname \
> ++  tst-resolv-invalid-ptr \
> +   tst-resolv-network \
> +   tst-resolv-noaaaa \
> +   tst-resolv-noaaaa-vc \
> +@@ -299,6 +300,8 @@ $(objpfx)tst-resolv-res_init-thread: $(objpfx)libres=
olv.so \
> +   $(shared-thread-library)
> + $(objpfx)tst-resolv-invalid-cname: $(objpfx)libresolv.so \
> +   $(shared-thread-library)
> ++$(objpfx)tst-resolv-invalid-ptr: $(objpfx)libresolv.so \
> ++  $(shared-thread-library)
> + $(objpfx)tst-resolv-noaaaa: $(objpfx)libresolv.so $(shared-thread-libra=
ry)
> + $(objpfx)tst-resolv-noaaaa-vc: $(objpfx)libresolv.so $(shared-thread-li=
brary)
> + $(objpfx)tst-resolv-nondecimal: $(objpfx)libresolv.so $(shared-thread-l=
ibrary)
> +diff --git a/resolv/nss_dns/dns-host.c b/resolv/nss_dns/dns-host.c
> +index 74a7c08d..b8f5d61b 100644
> +--- a/resolv/nss_dns/dns-host.c
> ++++ b/resolv/nss_dns/dns-host.c
> +@@ -866,7 +866,7 @@ getanswer_ptr (unsigned char *packet, size_t packetl=
en,
> + 	  char hname[MAXHOSTNAMELEN + 1];
> + 	  if (__ns_name_unpack (c.begin, c.end, rr.rdata,
> + 				name_buffer, sizeof (name_buffer)) < 0
> +-	      || !__res_binary_hnok (expected_name)
> ++	      || !__res_binary_hnok (name_buffer)
> + 	      || __ns_name_ntop (name_buffer, hname, sizeof (hname)) < 0)
> + 	    {
> + 	      *h_errnop =3D NO_RECOVERY;
> +diff --git a/resolv/tst-resolv-invalid-ptr.c b/resolv/tst-resolv-invalid=
-ptr.c
> +new file mode 100644
> +index 00000000..9cdc4dce
> +--- /dev/null
> ++++ b/resolv/tst-resolv-invalid-ptr.c
> +@@ -0,0 +1,255 @@
> ++/* Test handling of invalid T_PTR results (bug 34015).
> ++   Copyright (C) 2022-2026 Free Software Foundation, Inc.
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
> ++#include <array_length.h>
> ++#include <errno.h>
> ++#include <netdb.h>
> ++#include <resolv.h>
> ++#include <stdlib.h>
> ++#include <string.h>
> ++#include <support/check.h>
> ++#include <support/format_nss.h>
> ++#include <support/resolv_test.h>
> ++#include <support/support.h>
> ++
> ++/* Name of test, the answer, the expected error return, and if we
> ++   expect the call to fail.  */
> ++struct item {
> ++  const char *test;
> ++  const char *answer;
> ++  int expected;
> ++  bool fail;
> ++};
> ++
> ++static const struct item test_items[] =3D
> ++  {
> ++    /* Test for invalid characters.  */
> ++    { "Invalid use of \"|\"",
> ++      "test.|.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"&\"",
> ++      "test.&.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \";\"",
> ++      "test.;.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"<\"",
> ++      "test.<.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \">\"",
> ++      "test.>.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"(\"",
> ++      "test.(.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \")\"",
> ++      "test.).ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"$\"",
> ++      "test.$.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"`\"",
> ++      "test.`.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"\\\"",
> ++      "test.\\.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"\'\"",
> ++      "test.'.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"\"\"",
> ++      "test.\".ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \" \"",
> ++      "test. .ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"\\t\"",
> ++      "test.\t.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"\\n\"",
> ++      "test.\n.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"\\r\"",
> ++      "test.\r.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"*\"",
> ++      "test.*.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"?\"",
> ++      "test.?.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"[\"",
> ++      "test.[.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"]\"",
> ++      "test.].ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \",\"",
> ++      "test.,.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"~\"",
> ++      "test.~.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \":\"",
> ++      "test.:.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"!\"",
> ++      "test.!.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"@\"",
> ++      "test.@.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"#\"",
> ++      "test.#.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"%\"",
> ++      "test.%%.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of \"^\"",
> ++      "test.^.ptr.example", NO_RECOVERY, true },
> ++
> ++    /* Test for invalid UTF-8 characters (2-byte, 4-byte, 6-byte).  */
> ++    { "Invalid use of UTF-8 (2-byte, U+00C0-U+00C2)",
> ++      "=C3=81=C3=82=C3=83.test.ptr.example", NO_RECOVERY, true },
> ++    { "Invalid use of UTF-8 (4-byte, U+0750-U+0752)",
> ++      "=DD=90=DD=91=DD=92.test.ptr.example", NO_RECOVERY, true },
> ++     { "Invalid use of UTF-8 (6-byte, U+0904-U+0906)",
> ++      "=E0=A4=84=E0=A4=85=E0=A4=86.test.ptr.example", NO_RECOVERY, true=
 },
> ++
> ++    /* Test for "-" which may be valid depending on position.  */
> ++    { "Invalid leading \"-\"",
> ++      "-test.ptr.example", NO_RECOVERY, true },
> ++    { "Valid trailing \"-\"",
> ++      "test-.ptr.example", 0, false },
> ++    { "Valid mid-label use of \"-\"",
> ++      "te-st.ptr.example", 0, false },
> ++
> ++    /* Test for "_" which is always valid in any position.  */
> ++    { "Valid leading use of \"_\"",
> ++      "_test.ptr.example", 0, false },
> ++    { "Valid mid-label use of \"_\"",
> ++      "te_st.ptr.example", 0, false },
> ++    { "Valid trailing use of \"_\"",
> ++      "test_.ptr.example", 0, false },
> ++
> ++    /* Sanity test the broader set [A-Za-z0-9_-] of valid characters.  =
*/
> ++    { "Valid \"[A-Z]\"",
> ++      "test.ABCDEFGHIJKLMNOPQRSTUVWXYZ.ptr.example", 0, false },
> ++    { "Valid \"[a-z]\"",
> ++      "test.abcdefghijklmnopqrstuvwxyz.ptr.example", 0, false },
> ++    { "Valid \"[0-9]\"",
> ++      "test.0123456789.ptr.example", 0, false },
> ++    { "Valid mixed use of \"[A-Za-z0-9_-]\"",
> ++      "test.012abcABZ_-.ptr.example", 0, false },
> ++  };
> ++
> ++static void
> ++response (const struct resolv_response_context *ctx,
> ++          struct resolv_response_builder *b,
> ++          const char *qname, uint16_t qclass, uint16_t qtype)
> ++{
> ++  TEST_COMPARE (qclass, C_IN);
> ++
> ++  /* We only test PTR.  */
> ++  TEST_COMPARE (qtype, T_PTR);
> ++
> ++  unsigned int count, count1;
> ++  char *tail =3D NULL;
> ++
> ++  /* The test implementation can handle up to 255 tests.  */
> ++  if (strstr (qname, "in-addr.arpa") !=3D NULL
> ++      && sscanf (qname, "%u.%ms", &count, &tail) =3D=3D 2)
> ++    TEST_COMPARE_STRING (tail, "0.168.192.in-addr.arpa");
> ++  else if (sscanf (qname, "%x.%x.%ms", &count, &count1, &tail) =3D=3D 3=
)
> ++    {
> ++      TEST_COMPARE_STRING (tail, "\
> ++0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa");
> ++      count |=3D count1 << 4;
> ++    }
> ++  else
> ++    FAIL_EXIT1 ("invalid QNAME: %s\n", qname);
> ++  free (tail);
> ++
> ++  /* Cross check. Count has a fixed bound (soft limit).  */
> ++  TEST_VERIFY (count >=3D 0 && count <=3D 255);
> ++
> ++  /* We have a fixed number of tests (hard limit).  */
> ++  TEST_VERIFY_EXIT (count < array_length (test_items));
> ++
> ++  struct resolv_response_flags flags =3D {};
> ++  resolv_response_init (b, flags);
> ++  resolv_response_add_question (b, qname, qclass, qtype);
> ++  resolv_response_section (b, ns_s_an);
> ++
> ++  /* Actual answer record.  */
> ++  resolv_response_open_record (b, qname, qclass, qtype, 60);
> ++
> ++  /* Record the answer.  */
> ++  resolv_response_add_name (b, test_items[count].answer);
> ++  resolv_response_close_record (b);
> ++}
> ++
> ++/* Perform one check using a reverse lookup.  */
> ++static void
> ++check_reverse (int af, int count)
> ++{
> ++  TEST_VERIFY (af =3D=3D AF_INET || af =3D=3D AF_INET6);
> ++  TEST_VERIFY_EXIT (count < array_length (test_items));
> ++
> ++  /* Generate an address to query for each test.  */
> ++  char addr[sizeof (struct in6_addr)] =3D { 0 };
> ++  socklen_t addrlen;
> ++  if (af =3D=3D AF_INET)
> ++    {
> ++      addr[0] =3D (char) 192;
> ++      addr[1] =3D (char) 168;
> ++      addr[2] =3D (char) 0;
> ++      addr[3] =3D (char) count;
> ++      addrlen =3D 4;
> ++    }
> ++  else
> ++    {
> ++      addr[0] =3D 0x20;
> ++      addr[1] =3D 0x01;
> ++      addr[2] =3D 0x0d;
> ++      addr[3] =3D 0xb8;
> ++      addr[4] =3D addr[5] =3D addr[6] =3D addr[7] =3D 0x0;
> ++      addr[8] =3D addr[9] =3D addr[10] =3D addr[11] =3D 0x0;
> ++      addr[12] =3D 0x0;
> ++      addr[13] =3D 0x0;
> ++      addr[14] =3D 0x0;
> ++      addr[15] =3D (char) count;
> ++      addrlen =3D 16;
> ++    }
> ++
> ++  h_errno =3D 0;
> ++  struct hostent *answer =3D gethostbyaddr (addr, addrlen, af);
> ++
> ++  /* Verify h_errno is as expected.  */
> ++  TEST_COMPARE (h_errno, test_items[count].expected);
> ++  if (h_errno !=3D test_items[count].expected)
> ++    /* And print more information if it's not.  */
> ++    printf ("INFO: %s\n", test_items[count].test);
> ++
> ++  if (test_items[count].fail)
> ++    {
> ++      /* We expected a failure so verify answer is NULL.  */
> ++      TEST_VERIFY (answer =3D=3D NULL);
> ++      /* If it's not NULL we should print out what we received.  */
> ++      if (answer !=3D NULL)
> ++        printf ("error: unexpected success: %s\n",
> ++		support_format_hostent (answer));
> ++    }
> ++  else
> ++    /* We don't expect a failure so answer must be valid.  */
> ++    TEST_COMPARE_STRING (answer->h_name, test_items[count].answer);
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
> ++  for (int i =3D 0; i < array_length (test_items); i++)
> ++    {
> ++      check_reverse (AF_INET, i);
> ++      check_reverse (AF_INET6, i);
> ++    }
> ++  resolv_test_end (obj);
> ++
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-core/glibc/glibc/0026-CVE-2026-5450-Fix-buffer-=
overflow-in-scanf-mc-BZ-340.patch b/meta/recipes-core/glibc/glibc/0026-CVE-=
2026-5450-Fix-buffer-overflow-in-scanf-mc-BZ-340.patch
> new file mode 100644
> index 0000000000..989ddcdae8
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0026-CVE-2026-5450-Fix-buffer-overflo=
w-in-scanf-mc-BZ-340.patch
> @@ -0,0 +1,138 @@
> +From 839898777226a3ed88c0859f25ffe712519b4ead Mon Sep 17 00:00:00 2001
> +From: Rocket Ma <marocketbd@gmail.com>
> +Date: Fri, 17 Apr 2026 23:48:41 -0700
> +Subject: stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
> +
> +* stdio-common/vfscanf-internal.c: When enlarging allocated buffer with
> +format %mc or %mC, glibc allocates one byte less, leading to
> +user-controlled one byte overflow. This commit fixes BZ #34008, or
> +CVE-2026-5450.
> +
> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> +Signed-off-by: Rocket Ma <marocketbd@gmail.com>
> +Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
> +
> +CVE: CVE-2026-5450
> +
> +Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=
=3D839898777226a3ed88c0859f25ffe712519b4ead]
> +Comment: Patch refreshed
> +
> +Signed-off-by: Jackson James <jacksonj2@kpit.com>
> +---
> + stdio-common/Makefile              |  4 +++
> + stdio-common/tst-vfscanf-bz34008.c | 48 ++++++++++++++++++++++++++++++
> + stdio-common/vfscanf-internal.c    |  7 +++---
> + 3 files changed, 56 insertions(+), 4 deletions(-)
> + create mode 100644 stdio-common/tst-vfscanf-bz34008.c
> +
> +diff --git a/stdio-common/Makefile b/stdio-common/Makefile
> +index c8224342..7d76f55a 100644
> +--- a/stdio-common/Makefile
> ++++ b/stdio-common/Makefile
> +@@ -266,6 +266,7 @@ tests :=3D \
> +   tst-vfprintf-width-i18n \
> +   tst-vfprintf-width-prec \
> +   tst-vfprintf-width-prec-alloc \
> ++  tst-vfscanf-bz34008 \
> +   tst-wc-printf \
> +   tstdiomisc \
> +   tstgetln \
> +@@ -401,6 +402,9 @@ tst-printf-bz18872-ENV =3D MALLOC_TRACE=3D$(objpfx)t=
st-printf-bz18872.mtrace \
> + tst-vfprintf-width-prec-ENV =3D \
> +   MALLOC_TRACE=3D$(objpfx)tst-vfprintf-width-prec.mtrace \
> +   LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
> ++tst-vfscanf-bz34008-ENV =3D \
> ++  MALLOC_CHECK_=3D3 \
> ++  LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
> + tst-printf-bz25691-ENV =3D \
> +   MALLOC_TRACE=3D$(objpfx)tst-printf-bz25691.mtrace \
> +   LD_PRELOAD=3D$(common-objpfx)/malloc/libc_malloc_debug.so
> +diff --git a/stdio-common/tst-vfscanf-bz34008.c b/stdio-common/tst-vfsca=
nf-bz34008.c
> +new file mode 100644
> +index 00000000..48371c8a
> +--- /dev/null
> ++++ b/stdio-common/tst-vfscanf-bz34008.c
> +@@ -0,0 +1,48 @@
> ++/* Regression test for vfscanf %Nmc out-of-bound write (BZ #34008)
> ++   Copyright (C) 2026 The GNU Toolchain Authors.
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
> ++#include "malloc/mcheck.h"
> ++#include <stddef.h>
> ++#include <stdio.h>
> ++#include <string.h>
> ++#include <wchar.h>
> ++#include <stdlib.h>
> ++#include <malloc.h>
> ++#include <support/check.h>
> ++
> ++#define WIDTH 0x410
> ++#define SCANFSTR "%1040mc"
> ++static int
> ++do_test (void)
> ++{
> ++  mcheck_pedantic (NULL);
> ++  char *input =3D malloc (WIDTH + 1);
> ++  TEST_VERIFY (input !=3D NULL);
> ++  memset (input, 'A', WIDTH);
> ++  input[WIDTH] =3D '\0';
> ++
> ++  char *buf =3D NULL;
> ++  TEST_VERIFY (sscanf (input, SCANFSTR, &buf) !=3D -1);
> ++  TEST_VERIFY (buf !=3D NULL);
> ++
> ++  free (buf);
> ++  free (input);
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +diff --git a/stdio-common/vfscanf-internal.c b/stdio-common/vfscanf-inte=
rnal.c
> +index 1b82deff..8a813e94 100644
> +--- a/stdio-common/vfscanf-internal.c
> ++++ b/stdio-common/vfscanf-internal.c
> +@@ -853,8 +853,7 @@ __vfscanf_internal (FILE *s, const char *format, va_=
list argptr,
> + 			{
> + 			  /* Enlarge the buffer.  */
> + 			  size_t newsize
> +-			    =3D strsize
> +-			      + (strsize >=3D width ? width - 1 : strsize);
> ++			    =3D strsize + (strsize >=3D width ? width : strsize);
> +=20
> + 			  str =3D (char *) realloc (*strptr, newsize);
> + 			  if (str =3D=3D NULL)
> +@@ -925,7 +925,7 @@ __vfscanf_internal (FILE *s, const char *format, va_=
list argptr,
> + 		      && wstr =3D=3D (wchar_t *) *strptr + strsize)
> + 		    {
> + 		      size_t newsize
> +-			=3D strsize + (strsize > width ? width - 1 : strsize);
> ++			=3D strsize + (strsize >=3D width ? width : strsize);
> + 		      /* Enlarge the buffer.  */
> + 		      wstr =3D (wchar_t *) realloc (*strptr,
> + 						  newsize * sizeof (wchar_t));
> +@@ -980,7 +980,7 @@ __vfscanf_internal (FILE *s, const char *format, va_=
list argptr,
> + 		    && wstr =3D=3D (wchar_t *) *strptr + strsize)
> + 		  {
> + 		    size_t newsize
> +-		      =3D strsize + (strsize > width ? width - 1 : strsize);
> ++		      =3D strsize + (strsize >=3D width ? width : strsize);
> + 		    /* Enlarge the buffer.  */
> + 		    wstr =3D (wchar_t *) realloc (*strptr,
> + 						newsize * sizeof (wchar_t));
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-core/glibc/glibc/0027-CVE-2026-5928-Fix-ungetwc=
-operating-on-byte-stream-B.patch b/meta/recipes-core/glibc/glibc/0027-CVE-=
2026-5928-Fix-ungetwc-operating-on-byte-stream-B.patch
> new file mode 100644
> index 0000000000..21228a44b7
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0027-CVE-2026-5928-Fix-ungetwc-operat=
ing-on-byte-stream-B.patch
> @@ -0,0 +1,117 @@
> +From ef3bfb5f910011f3780cb06aa47e730035f53285 Mon Sep 17 00:00:00 2001
> +From: Rocket Ma <marocketbd@gmail.com>
> +Date: Fri, 1 May 2026 20:39:07 -0700
> +Subject: libio: Fix ungetwc operating on byte stream [BZ #33998]
> +
> +* libio/wgenops.c: When _IO_wdefault_pbackfail attempts to push back one
> +character, it accidently compare the wchar to push back with the last
> +char from byte stream, instead of wide stream. Under specific coding,
> +attacker may exploit this to leak information. This commit fix bug
> +33998, or CVE-2026-5928.
> +
> +Signed-off-by: Rocket Ma <marocketbd@gmail.com>
> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> +
> +CVE: CVE-2026-5928
> +
> +Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=
=3Def3bfb5f910011f3780cb06aa47e730035f53285]
> +Comment: Patch refreshed
> +
> +Signed-off-by: Jackson James <jacksonj2@kpit.com>
> +---
> + libio/Makefile              |  1 +
> + libio/bug-wgenops-bz33998.c | 54 +++++++++++++++++++++++++++++++++++++
> + libio/wgenops.c             |  4 +--
> + 3 files changed, 57 insertions(+), 2 deletions(-)
> + create mode 100644 libio/bug-wgenops-bz33998.c
> +
> +diff --git a/libio/Makefile b/libio/Makefile
> +index b189455b..20e2b056 100644
> +--- a/libio/Makefile
> ++++ b/libio/Makefile
> +@@ -83,6 +83,7 @@ tests =3D \
> +   bug-ungetwc1 \
> +   bug-ungetwc2 \
> +   bug-wfflush \
> ++  bug-wgenops-bz33998 \
> +   bug-wmemstream1 \
> +   bug-wsetpos \
> +   test-fmemopen \
> +diff --git a/libio/bug-wgenops-bz33998.c b/libio/bug-wgenops-bz33998.c
> +new file mode 100644
> +index 00000000..cc4067da
> +--- /dev/null
> ++++ b/libio/bug-wgenops-bz33998.c
> +@@ -0,0 +1,54 @@
> ++/* Regression test for ungetwc operating on byte stream (BZ #33998)
> ++   Copyright (C) 2026 The GNU Toolchain Authors.
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
> ++#include "support/temp_file.h"
> ++#include "support/xstdio.h"
> ++#include "support/xunistd.h"
> ++#include <stdlib.h>
> ++#include <unistd.h>
> ++#include <sys/mman.h>
> ++#include <stdio.h>
> ++#include <wchar.h>
> ++#include <support/check.h>
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  char *filename;
> ++  int fd =3D create_temp_file ("tst-bz33998-", &filename);
> ++  TEST_VERIFY (fd !=3D -1);
> ++  xwrite (fd, "A", sizeof ("A")); // write "A\0" by design
> ++  xclose (fd);
> ++
> ++  FILE *fp =3D xfopen (filename, "r+");
> ++  TEST_COMPARE (getwc (fp), L'A');
> ++  /* If the bug is fixed, then ungetwc should not touch byte stream.
> ++     If the bug is not fixed, ungetwc firstly match last read char, L'A=
',
> ++     failed, then the pbackfail branch, matching last read char in byte
> ++     stream, that is, '\0' (initialized when setup wide stream). */
> ++  char *old_read_ptr =3D fp->_IO_read_ptr;
> ++  TEST_COMPARE (ungetwc (L'\0', fp), L'\0');
> ++  TEST_VERIFY (fp->_IO_read_ptr =3D=3D old_read_ptr);
> ++
> ++  xfclose (fp);
> ++  free (filename);
> ++
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +diff --git a/libio/wgenops.c b/libio/wgenops.c
> +index adfb9701..14ece4e7 100644
> +--- a/libio/wgenops.c
> ++++ b/libio/wgenops.c
> +@@ -108,8 +108,8 @@ _IO_wdefault_pbackfail (FILE *fp, wint_t c)
> + {
> +   if (fp->_wide_data->_IO_read_ptr > fp->_wide_data->_IO_read_base
> +       && !_IO_in_backup (fp)
> +-      && (wint_t) fp->_IO_read_ptr[-1] =3D=3D c)
> +-    --fp->_IO_read_ptr;
> ++      && (wint_t) fp->_wide_data->_IO_read_ptr[-1] =3D=3D c)
> ++    --fp->_wide_data->_IO_read_ptr;
> +   else
> +     {
> +       /* Need to handle a filebuf in write mode (switch to read mode). =
FIXME!*/
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-core/glibc/glibc/0028-CVE-2026-4046-Use-pending=
-character-state-in-IBM1390.patch b/meta/recipes-core/glibc/glibc/0028-CVE-=
2026-4046-Use-pending-character-state-in-IBM1390.patch
> new file mode 100644
> index 0000000000..3deccbc072
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0028-CVE-2026-4046-Use-pending-charac=
ter-state-in-IBM1390.patch
> @@ -0,0 +1,336 @@
> +From d6f08d1cf027f4eb2ba289a6cc66853722d4badc Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Thu, 16 Apr 2026 19:13:43 +0200
> +Subject: Use pending character state in IBM1390, IBM1399 character sets
> + (CVE-2026-4046)
> +
> +Follow the example in iso-2022-jp-3.c and use the __count state
> +variable to store the pending character.  This avoids restarting
> +the conversion if the output buffer ends between two 4-byte UCS-4
> +code points, so that the assert reported in the bug can no longer
> +happen.
> +
> +Even though the fix is applied to ibm1364.c, the change is only
> +effective for the two HAS_COMBINED codecs for IBM1390, IBM1399.
> +
> +The test case was mostly auto-generated using
> +claude-4.6-opus-high-thinking, and composer-2-fast shows up in the
> +log as well.  During review, gpt-5.4-xhigh flagged that the original
> +version of the test case was not exercising the new character
> +flush logic.
> +
> +This fixes bug 33980.
> +
> +Assisted-by: LLM
> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> +
> +CVE: CVE-2026-4046
> +
> +Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=
=3Dd6f08d1cf027f4eb2ba289a6cc66853722d4badc]
> +
> +Signed-off-by: Jackson James <jacksonj2@kpit.com>
> +---
> + iconvdata/Makefile       |   4 +-
> + iconvdata/ibm1364.c      |  70 ++++++++++++++----
> + iconvdata/tst-bug33980.c | 153 +++++++++++++++++++++++++++++++++++++++
> + 3 files changed, 211 insertions(+), 16 deletions(-)
> + create mode 100644 iconvdata/tst-bug33980.c
> +
> +diff --git a/iconvdata/Makefile b/iconvdata/Makefile
> +index 7196a874..090ba929 100644
> +--- a/iconvdata/Makefile
> ++++ b/iconvdata/Makefile
> +@@ -76,7 +76,7 @@ tests =3D bug-iconv1 bug-iconv2 tst-loading tst-e2big =
tst-iconv4 bug-iconv4 \
> + 	tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \
> + 	bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4 \
> + 	bug-iconv13 bug-iconv14 bug-iconv15 \
> +-	tst-iconv-iso-2022-cn-ext
> ++	tst-iconv-iso-2022-cn-ext tst-bug33980
> + ifeq ($(have-thread-library),yes)
> + tests +=3D bug-iconv3
> + endif
> +@@ -333,6 +333,8 @@ $(objpfx)bug-iconv15.out: $(addprefix $(objpfx), $(g=
conv-modules)) \
> + 			  $(addprefix $(objpfx),$(modules.so))
> + $(objpfx)tst-iconv-iso-2022-cn-ext.out: $(addprefix $(objpfx), $(gconv-=
modules)) \
> + 					$(addprefix $(objpfx),$(modules.so))
> ++$(objpfx)tst-bug33980.out: $(addprefix $(objpfx), $(gconv-modules)) \
> ++			   $(addprefix $(objpfx),$(modules.so))
> +=20
> + $(objpfx)iconv-test.out: run-iconv-test.sh \
> + 			 $(addprefix $(objpfx), $(gconv-modules)) \
> +diff --git a/iconvdata/ibm1364.c b/iconvdata/ibm1364.c
> +index 4c37f30e..fd255a46 100644
> +--- a/iconvdata/ibm1364.c
> ++++ b/iconvdata/ibm1364.c
> +@@ -67,12 +67,29 @@
> +=20
> + /* Since this is a stateful encoding we have to provide code which rese=
ts
> +    the output state to the initial state.  This has to be done during t=
he
> +-   flushing.  */
> ++   flushing.  For the to-internal direction (FROM_DIRECTION is true),
> ++   there may be a pending character that needs flushing.  */
> + #define EMIT_SHIFT_TO_INIT \
> +   if ((data->__statep->__count & ~7) !=3D sb)				      \
> +     {									      \
> +       if (FROM_DIRECTION)						      \
> +-	data->__statep->__count &=3D 7;					      \
> ++	{								      \
> ++	  uint32_t ch =3D data->__statep->__count >> 7;			      \
> ++	  if (__glibc_unlikely (ch !=3D 0))				      \
> ++	    {								      \
> ++	      if (__glibc_unlikely (outend - outbuf < 4))		      \
> ++		status =3D __GCONV_FULL_OUTPUT;				      \
> ++	      else							      \
> ++		{							      \
> ++		  put32 (outbuf, ch);					      \
> ++		  outbuf +=3D 4;						      \
> ++		  /* Clear character and db bit.  */			      \
> ++		  data->__statep->__count &=3D 7;				      \
> ++		}							      \
> ++	    }								      \
> ++	  else								      \
> ++	    data->__statep->__count &=3D 7;				      \
> ++	}								      \
> +       else								      \
> + 	{								      \
> + 	  /* We are not in the initial state.  To switch back we have	      \
> +@@ -99,11 +116,13 @@
> +     *curcsp =3D save_curcs
> +=20
> +=20
> +-/* Current codeset type.  */
> ++/* Current codeset type.  The bit is stored in the __count variable of
> ++   the conversion state.  If the db bit is set, bit 7 and above store
> ++   a pending UCS-4 code point if non-zero.  */
> + enum
> + {
> +-  sb =3D 0,
> +-  db =3D 64
> ++  sb =3D 0,			/* Single byte mode.  */
> ++  db =3D 64			/* Double byte mode.  */
> + };
> +=20
> +=20
> +@@ -119,21 +138,29 @@ enum
> +       }									      \
> +     else								      \
> +       {									      \
> +-	/* This is a combined character.  Make sure we have room.  */	      \
> +-	if (__glibc_unlikely (outptr + 8 > outend))			      \
> +-	  {								      \
> +-	    result =3D __GCONV_FULL_OUTPUT;				      \
> +-	    break;							      \
> +-	  }								      \
> +-									      \
> + 	const struct divide *cmbp					      \
> + 	  =3D &DB_TO_UCS4_COMB[ch - __TO_UCS4_COMBINED_MIN];		      \
> + 	assert (cmbp->res1 !=3D 0 && cmbp->res2 !=3D 0);			      \
> + 									      \
> + 	put32 (outptr, cmbp->res1);					      \
> + 	outptr +=3D 4;							      \
> +-	put32 (outptr, cmbp->res2);					      \
> +-	outptr +=3D 4;							      \
> ++									      \
> ++	/* See whether we have room for the second character.  */	      \
> ++	if (outend - outptr >=3D 4)					      \
> ++	  {								      \
> ++	    put32 (outptr, cmbp->res2);					      \
> ++	    outptr +=3D 4;						      \
> ++	  }								      \
> ++	else								      \
> ++	  {								      \
> ++	    /* Otherwise store only the first character now, and	      \
> ++	       put the second one into the queue.  */			      \
> ++	    curcs |=3D cmbp->res2 << 7;					      \
> ++	    inptr +=3D 2;							      \
> ++	    /* Tell the caller why we terminate the loop.  */		      \
> ++	    result =3D __GCONV_FULL_OUTPUT;				      \
> ++	    break;							      \
> ++	  }								      \
> +       }									      \
> +   }
> + #else
> +@@ -153,7 +180,20 @@ enum
> + #define LOOPFCT 		FROM_LOOP
> + #define BODY \
> +   {									      \
> +-    uint32_t ch =3D *inptr;						      \
> ++    uint32_t ch;							      \
> ++									      \
> ++    ch =3D curcs >> 7;							      \
> ++    if (__glibc_unlikely (ch !=3D 0))					      \
> ++      {									      \
> ++	put32 (outptr, ch);						      \
> ++	outptr +=3D 4;							      \
> ++	/* Remove the pending character, but preserve state bits.  */	      \
> ++	curcs &=3D (1 << 7) - 1;						      \
> ++	continue;							      \
> ++      }									      \
> ++									      \
> ++    /* Otherwise read the next input byte.  */				      \
> ++    ch =3D *inptr;							      \
> + 									      \
> +     if (__builtin_expect (ch, 0) =3D=3D SO)					      \
> +       {									      \
> +diff --git a/iconvdata/tst-bug33980.c b/iconvdata/tst-bug33980.c
> +new file mode 100644
> +index 00000000..c9693e0e
> +--- /dev/null
> ++++ b/iconvdata/tst-bug33980.c
> +@@ -0,0 +1,153 @@
> ++/* Test for bug 33980: combining characters in IBM1390/IBM1399.
> ++   Copyright (C) 2026 Free Software Foundation, Inc.
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
> ++#include <alloc_buffer.h>
> ++#include <errno.h>
> ++#include <iconv.h>
> ++#include <stdbool.h>
> ++#include <string.h>
> ++
> ++#include <support/check.h>
> ++#include <support/next_to_fault.h>
> ++#include <support/support.h>
> ++
> ++/* Run iconv in a loop with a small output buffer of OUTBUFSIZE bytes
> ++   starting at OUTBUF.  OUTBUF should be right before an unmapped page
> ++   so that writing past the end will fault.  Skip SHIFT bytes at the
> ++   start of the input and output, to exercise different buffer
> ++   alignment.  TRUNCATE indicates skipped bytes at the end of
> ++   input (0 and 1 a valid).  */
> ++static void
> ++test_one (const char *encoding, unsigned int shift, unsigned int trunca=
te,
> ++          char *outbuf, size_t outbufsize)
> ++{
> ++  /* In IBM1390 and IBM1399, the DBCS code 0xECB5 expands to two
> ++     Unicode code points when translated.  */
> ++  static char input[] =3D
> ++    {
> ++      /* 8 letters X.  */
> ++      0xe7, 0xe7, 0xe7, 0xe7, 0xe7, 0xe7, 0xe7, 0xe7,
> ++      /* SO, 0xECB5, SI: shift to DBCS, special character, shift back. =
 */
> ++      0x0e, 0xec, 0xb5, 0x0f
> ++    };
> ++
> ++  /* Expected output after UTF-8 conversion.  */
> ++  static char expected[] =3D
> ++    {
> ++      'X', 'X', 'X', 'X', 'X', 'X', 'X', 'X',
> ++      /* U+304B (HIRAGANA LETTER KA).  */
> ++      0xe3, 0x81, 0x8b,
> ++      /* U+309A (COMBINING KATAKANA-HIRAGANA SEMI-VOICED SOUND MARK).  =
*/
> ++      0xe3, 0x82, 0x9a
> ++    };
> ++
> ++  iconv_t cd =3D iconv_open ("UTF-8", encoding);
> ++  TEST_VERIFY_EXIT (cd !=3D (iconv_t) -1);
> ++
> ++  char result_storage[64];
> ++  struct alloc_buffer result_buf
> ++    =3D alloc_buffer_create (result_storage, sizeof (result_storage));
> ++
> ++  char *inptr =3D &input[shift];
> ++  size_t inleft =3D sizeof (input) - shift - truncate;
> ++
> ++  while (inleft > 0)
> ++    {
> ++      char *outptr =3D outbuf;
> ++      size_t outleft =3D outbufsize;
> ++      size_t inleft_before =3D inleft;
> ++
> ++      size_t ret =3D iconv (cd, &inptr, &inleft, &outptr, &outleft);
> ++      size_t produced =3D outptr - outbuf;
> ++      alloc_buffer_copy_bytes (&result_buf, outbuf, produced);
> ++
> ++      if (ret =3D=3D (size_t) -1 && errno =3D=3D E2BIG)
> ++        {
> ++          if (produced =3D=3D 0 && inleft =3D=3D inleft_before)
> ++            {
> ++              /* Output buffer too small to make progress.  This is
> ++                 expected for very small output buffer sizes.  */
> ++              TEST_VERIFY_EXIT (outbufsize < 3);
> ++              break;
> ++            }
> ++          continue;
> ++        }
> ++      if (ret =3D=3D (size_t) -1)
> ++        FAIL_EXIT1 ("%s (outbufsize %zu): iconv: %m", encoding, outbufs=
ize);
> ++      break;
> ++    }
> ++
> ++  /* Flush any pending state (e.g. a buffered combined character).
> ++     With outbufsize < 3, we could not store the first character, so
> ++     the second character did not become pending, and there is nothing
> ++     to flush.  */
> ++  {
> ++    char *outptr =3D outbuf;
> ++    size_t outleft =3D outbufsize;
> ++
> ++    size_t ret =3D iconv (cd, NULL, NULL, &outptr, &outleft);
> ++    TEST_VERIFY_EXIT (ret =3D=3D 0);
> ++    size_t produced =3D outptr - outbuf;
> ++    alloc_buffer_copy_bytes (&result_buf, outbuf, produced);
> ++
> ++    /* Second flush does not provide more data.  */
> ++    outptr =3D outbuf;
> ++    outleft =3D outbufsize;
> ++    ret =3D iconv (cd, NULL, NULL, &outptr, &outleft);
> ++    TEST_VERIFY_EXIT (ret =3D=3D 0);
> ++    TEST_VERIFY (outptr =3D=3D outbuf);
> ++  }
> ++
> ++  TEST_VERIFY_EXIT (!alloc_buffer_has_failed (&result_buf));
> ++  size_t result_used
> ++    =3D sizeof (result_storage) - alloc_buffer_size (&result_buf);
> ++
> ++  if (outbufsize >=3D 3)
> ++    {
> ++      TEST_COMPARE (inleft, 0);
> ++      TEST_COMPARE (result_used, sizeof (expected) - shift);
> ++      TEST_COMPARE_BLOB (result_storage, result_used,
> ++                         &expected[shift], sizeof (expected) - shift);
> ++    }
> ++  else
> ++    /* If the buffer is too small, only the leading X could be converte=
d.  */
> ++    TEST_COMPARE (result_used, 8 - shift);
> ++
> ++  TEST_VERIFY_EXIT (iconv_close (cd) =3D=3D 0);
> ++}
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  struct support_next_to_fault ntf
> ++    =3D support_next_to_fault_allocate (8);
> ++
> ++  for (int shift =3D 0; shift <=3D 8; ++shift)
> ++    for (int truncate =3D 0; truncate < 2; ++truncate)
> ++      for (size_t outbufsize =3D 1; outbufsize <=3D 8; outbufsize++)
> ++        {
> ++          char *outbuf =3D ntf.buffer + ntf.length - outbufsize;
> ++          test_one ("IBM1390", shift, truncate, outbuf, outbufsize);
> ++          test_one ("IBM1399", shift, truncate, outbuf, outbufsize);
> ++        }
> ++
> ++  support_next_to_fault_free (&ntf);
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
> index 7958d64eed..12a2e696ad 100644
> --- a/meta/recipes-core/glibc/glibc_2.39.bb
> +++ b/meta/recipes-core/glibc/glibc_2.39.bb
> @@ -55,6 +55,11 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};n=
ame=3Dglibc \
>             file://0022-Avoid-hardcoded-build-time-paths-in-the-output-bi=
nar.patch \
>             file://0023-qemu-stale-process.patch \
>             file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patc=
h \
> +           file://0024-CVE-2026-4437-Count-records-correctly-CVE-2026-44=
37.patch \
> +           file://0025-CVE-2026-4438-Check-hostname-for-validity-CVE-202=
6-4.patch \
> +           file://0026-CVE-2026-5450-Fix-buffer-overflow-in-scanf-mc-BZ-=
340.patch \
> +           file://0027-CVE-2026-5928-Fix-ungetwc-operating-on-byte-strea=
m-B.patch \
> +           file://0028-CVE-2026-4046-Use-pending-character-state-in-IBM1=
390.patch \
>  "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"


