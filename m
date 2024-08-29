Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C43C83F22
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 13:32:54 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.15176.1724938367680206606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 06:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Nke9Om2U;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-201fba05363so5659555ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 06:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724938367; x=1725543167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lfmxD882OY3mQj9qlVAJX1CJNmLNLWcUoXio0TiQuiA=;
        b=Nke9Om2UiPQSkE26a2Mrlv9h9Z5JBlYk8YPo5KKxzLLcP1OxyRE9QoeR2MgsxQk1zb
         r0sYwk6tWjwucFTMdXGkxXjkPC8NJocIE3FFu2MZSd/gGza7VrOzikowIrgSiRI+Aaas
         3O0vXLd6kq5rL1L3GXKFm0gfBtV33er5FL0sZ3cIu5EEyNz0PjD4uIUurx6/xk8EYrVP
         NLcblWePENKBBsxadQd/Oik4Y6npIBc8I6v+ACYk3G6FNCU3P70Kk1J0ZC+R/nSkg5hS
         GaKoLw+fn62EbPi1cEXlAoOkU6vEULVEtueJ16nUjibj9VHXu4Cy3ydw2RvA6+bpzedY
         XvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938367; x=1725543167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfmxD882OY3mQj9qlVAJX1CJNmLNLWcUoXio0TiQuiA=;
        b=fABMbeHm5vZpDt6lMqMVZkjy+KK4nUZCkeRO/D1u/xTsV4IbEb0Z2viIQI6Iansi8U
         wvNCDliUVWV/OC0oYTYTUpM/rVYt6wot0n6+ei2lIhZwYrKy/nv4G2sVrz7jlQKTClbR
         O4IZDBl7sFpfTPDavMjmt81QuxxnrCFxA8htO3Girl8GZvTnZ7dFnRW3gqeVxmcxX4FB
         SiowXY6draFi8ioDZgkbdI/kfduheNsCb+fWbnGKCc3l1cR1gT6eacALZ0mhoXKi18f3
         0EuSnwd1rvwoIMJIIe9kcuF0tV8ZqCTNW2r4wLgsdVzV/x9H2uqiQlWYHzgP9cqDvtFf
         gKdA==
X-Gm-Message-State: AOJu0Yy3QePjB5hK6sNya5UwiFDL2ySF6eeWv20UwUqd0szCHflc05o3
	3zyM7ssr8NvVeVlD7mZD+47+YjZZPK6h4jTqFz0fcqRvkt3ODpAJWxWjGhBoOD8jxpbdQZRLEcG
	TEOI=
X-Google-Smtp-Source: AGHT+IGPlKOZ7+yQX00rWljsFUEGybfFNuiylpZYNwuyA/+mloRAKe4OWU21QqIIlglk+VyXq2osKg==
X-Received: by 2002:a17:902:d4cb:b0:202:32cf:5dbe with SMTP id d9443c01a7336-2050c4a1977mr28807235ad.58.1724938366734;
        Thu, 29 Aug 2024 06:32:46 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1446sm11241235ad.58.2024.08.29.06.32.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:32:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/12] curl: Patch CVE-2024-7264
Date: Thu, 29 Aug 2024 06:32:26 -0700
Message-Id: <0f1c4b8ae80dc90ee4ed89c4b99da2dca75dd247.1724938187.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724938187.git.steve@sakoman.com>
References: <cover.1724938187.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 13:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203923

From: Peter Marko <peter.marko@siemens.com>

Pick commits per https://curl.se/docs/CVE-2024-7264.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2024-7264-1.patch           |  61 ++++
 .../curl/curl/CVE-2024-7264-2.patch           | 316 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
 3 files changed, 379 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-7264-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-7264-2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-7264-1.patch b/meta/recipes-support/curl/curl/CVE-2024-7264-1.patch
new file mode 100644
index 0000000000..7101fcfe35
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-7264-1.patch
@@ -0,0 +1,61 @@
+From 3c914bc680155b32178f1f15ca8d47c7f4640afe Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 30 Jul 2024 10:05:17 +0200
+Subject: [PATCH] x509asn1: clean up GTime2str
+
+Co-authored-by: Stefan Eissing
+Reported-by: Dov Murik
+
+Closes #14307
+
+CVE: CVE-2024-7264
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3c914bc680155b32178f1f15ca8d47c7f4640afe.patch]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vtls/x509asn1.c | 23 ++++++++++++++---------
+ 1 file changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/lib/vtls/x509asn1.c b/lib/vtls/x509asn1.c
+index 1bc4243ddae343..e3a9fe4232a4ea 100644
+--- a/lib/vtls/x509asn1.c
++++ b/lib/vtls/x509asn1.c
+@@ -488,7 +488,7 @@ static CURLcode GTime2str(struct dynbuf *store,
+   /* Convert an ASN.1 Generalized time to a printable string.
+      Return the dynamically allocated string, or NULL if an error occurs. */
+ 
+-  for(fracp = beg; fracp < end && *fracp >= '0' && *fracp <= '9'; fracp++)
++  for(fracp = beg; fracp < end && ISDIGIT(*fracp); fracp++)
+     ;
+ 
+   /* Get seconds digits. */
+@@ -507,17 +507,22 @@ static CURLcode GTime2str(struct dynbuf *store,
+     return CURLE_BAD_FUNCTION_ARGUMENT;
+   }
+ 
+-  /* Scan for timezone, measure fractional seconds. */
++  /* timezone follows optional fractional seconds. */
+   tzp = fracp;
+-  fracl = 0;
++  fracl = 0; /* no fractional seconds detected so far */
+   if(fracp < end && (*fracp == '.' || *fracp == ',')) {
+-    fracp++;
+-    do
++    /* Have fractional seconds, e.g. "[.,]\d+". How many? */
++    tzp = fracp++; /* should be a digit char or BAD ARGUMENT */
++    while(tzp < end && ISDIGIT(*tzp))
+       tzp++;
+-    while(tzp < end && *tzp >= '0' && *tzp <= '9');
+-    /* Strip leading zeroes in fractional seconds. */
+-    for(fracl = tzp - fracp - 1; fracl && fracp[fracl - 1] == '0'; fracl--)
+-      ;
++    if(tzp == fracp) /* never looped, no digit after [.,] */
++      return CURLE_BAD_FUNCTION_ARGUMENT;
++    fracl = tzp - fracp - 1; /* number of fractional sec digits */
++    DEBUGASSERT(fracl > 0);
++    /* Strip trailing zeroes in fractional seconds.
++     * May reduce fracl to 0 if only '0's are present. */
++    while(fracl && fracp[fracl - 1] == '0')
++      fracl--;
+   }
+ 
+   /* Process timezone. */
diff --git a/meta/recipes-support/curl/curl/CVE-2024-7264-2.patch b/meta/recipes-support/curl/curl/CVE-2024-7264-2.patch
new file mode 100644
index 0000000000..ab24911712
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-7264-2.patch
@@ -0,0 +1,316 @@
+From 27959ecce75cdb2809c0bdb3286e60e08fadb519 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Tue, 30 Jul 2024 16:40:48 +0200
+Subject: [PATCH] x509asn1: unittests and fixes for gtime2str
+
+Fix issues in GTime2str() and add unit test cases to verify correct
+behaviour.
+
+Follow-up to 3c914bc6801
+
+Closes #14316
+
+CVE: CVE-2024-7264
+Upstream-Status: Backport [https://github.com/curl/curl/commit/27959ecce75cdb2809c0bdb3286e60e08fadb519.patch]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vtls/x509asn1.c     |  32 +++++++---
+ lib/vtls/x509asn1.h     |  11 ++++
+ tests/data/Makefile.inc |   2 +-
+ tests/data/test1656     |  22 +++++++
+ tests/unit/Makefile.inc |   4 +-
+ tests/unit/unit1656.c   | 133 ++++++++++++++++++++++++++++++++++++++++
+ 6 files changed, 194 insertions(+), 10 deletions(-)
+ create mode 100644 tests/data/test1656
+ create mode 100644 tests/unit/unit1656.c
+
+diff --git a/lib/vtls/x509asn1.c b/lib/vtls/x509asn1.c
+index e3a9fe4232a4ea..7f04af3b9778c5 100644
+--- a/lib/vtls/x509asn1.c
++++ b/lib/vtls/x509asn1.c
+@@ -512,12 +512,13 @@ static CURLcode GTime2str(struct dynbuf *store,
+   fracl = 0; /* no fractional seconds detected so far */
+   if(fracp < end && (*fracp == '.' || *fracp == ',')) {
+     /* Have fractional seconds, e.g. "[.,]\d+". How many? */
+-    tzp = fracp++; /* should be a digit char or BAD ARGUMENT */
++    fracp++; /* should be a digit char or BAD ARGUMENT */
++    tzp = fracp;
+     while(tzp < end && ISDIGIT(*tzp))
+       tzp++;
+     if(tzp == fracp) /* never looped, no digit after [.,] */
+       return CURLE_BAD_FUNCTION_ARGUMENT;
+-    fracl = tzp - fracp - 1; /* number of fractional sec digits */
++    fracl = tzp - fracp; /* number of fractional sec digits */
+     DEBUGASSERT(fracl > 0);
+     /* Strip trailing zeroes in fractional seconds.
+      * May reduce fracl to 0 if only '0's are present. */
+@@ -526,18 +527,24 @@ static CURLcode GTime2str(struct dynbuf *store,
+   }
+ 
+   /* Process timezone. */
+-  if(tzp >= end)
+-    ;           /* Nothing to do. */
++  if(tzp >= end) {
++    tzp = "";
++    tzl = 0;
++  }
+   else if(*tzp == 'Z') {
+-    tzp = " GMT";
+-    end = tzp + 4;
++    sep = " ";
++    tzp = "GMT";
++    tzl = 3;
++  }
++  else if((*tzp == '+') || (*tzp == '-')) {
++    sep = " UTC";
++    tzl = end - tzp;
+   }
+   else {
+     sep = " ";
+-    tzp++;
++    tzl = end - tzp;
+   }
+ 
+-  tzl = end - tzp;
+   return Curl_dyn_addf(store,
+                        "%.4s-%.2s-%.2s %.2s:%.2s:%c%c%s%.*s%s%.*s",
+                        beg, beg + 4, beg + 6,
+@@ -546,6 +553,15 @@ static CURLcode GTime2str(struct dynbuf *store,
+                        sep, (int)tzl, tzp);
+ }
+ 
++#ifdef UNITTESTS
++/* used by unit1656.c */
++CURLcode Curl_x509_GTime2str(struct dynbuf *store,
++                             const char *beg, const char *end)
++{
++  return GTime2str(store, beg, end);
++}
++#endif
++
+ /*
+  * Convert an ASN.1 UTC time to a printable string.
+  *
+diff --git a/lib/vtls/x509asn1.h b/lib/vtls/x509asn1.h
+index 5844460467ccef..5b48596c75910a 100644
+--- a/lib/vtls/x509asn1.h
++++ b/lib/vtls/x509asn1.h
+@@ -76,5 +76,16 @@ CURLcode Curl_extract_certinfo(struct Curl_easy *data, int certnum,
+                                const char *beg, const char *end);
+ CURLcode Curl_verifyhost(struct Curl_cfilter *cf, struct Curl_easy *data,
+                          const char *beg, const char *end);
++
++#ifdef UNITTESTS
++#if defined(USE_GNUTLS) || defined(USE_SCHANNEL) || defined(USE_SECTRANSP) || \
++  defined(USE_MBEDTLS)
++
++/* used by unit1656.c */
++CURLcode Curl_x509_GTime2str(struct dynbuf *store,
++                             const char *beg, const char *end);
++#endif
++#endif
++
+ #endif /* USE_GNUTLS or USE_WOLFSSL or USE_SCHANNEL or USE_SECTRANSP */
+ #endif /* HEADER_CURL_X509ASN1_H */
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index d0e20df4b900c8..792cb16eef20ad 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -210,7 +210,7 @@ test1620 test1621 \
+ \
+ test1630 test1631 test1632 test1633 test1634 test1635 \
+ \
+-test1650 test1651 test1652 test1653 test1654 test1655 \
++test1650 test1651 test1652 test1653 test1654 test1655 test1656 \
+ test1660 test1661 test1662 \
+ \
+ test1670 test1671 \
+diff --git a/tests/data/test1656 b/tests/data/test1656
+new file mode 100644
+index 00000000000000..2fab21be63d7e3
+--- /dev/null
++++ b/tests/data/test1656
+@@ -0,0 +1,22 @@
++<testcase>
++<info>
++<keywords>
++unittest
++Curl_x509_GTime2str
++</keywords>
++</info>
++
++#
++# Client-side
++<client>
++<server>
++none
++</server>
++<features>
++unittest
++</features>
++<name>
++Curl_x509_GTime2str unit tests
++</name>
++</client>
++</testcase>
+diff --git a/tests/unit/Makefile.inc b/tests/unit/Makefile.inc
+index c402f803509c8a..5b23c2559280f0 100644
+--- a/tests/unit/Makefile.inc
++++ b/tests/unit/Makefile.inc
+@@ -36,7 +36,7 @@ UNITPROGS = unit1300          unit1302 unit1303 unit1304 unit1305 unit1307 \
+  unit1600 unit1601 unit1602 unit1603 unit1604 unit1605 unit1606 unit1607 \
+  unit1608 unit1609 unit1610 unit1611 unit1612 unit1614 unit1615 \
+  unit1620 unit1621 \
+- unit1650 unit1651 unit1652 unit1653 unit1654 unit1655 \
++ unit1650 unit1651 unit1652 unit1653 unit1654 unit1655 unit1656 \
+  unit1660 unit1661 \
+  unit2600 unit2601 unit2602 unit2603 \
+  unit3200
+@@ -119,6 +119,8 @@ unit1654_SOURCES = unit1654.c $(UNITFILES)
+ 
+ unit1655_SOURCES = unit1655.c $(UNITFILES)
+ 
++unit1656_SOURCES = unit1656.c $(UNITFILES)
++
+ unit1660_SOURCES = unit1660.c $(UNITFILES)
+ 
+ unit1661_SOURCES = unit1661.c $(UNITFILES)
+diff --git a/tests/unit/unit1656.c b/tests/unit/unit1656.c
+new file mode 100644
+index 00000000000000..644e72fc7d6577
+--- /dev/null
++++ b/tests/unit/unit1656.c
+@@ -0,0 +1,133 @@
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
++ * KIND, either express or implied.
++ *
++ * SPDX-License-Identifier: curl
++ *
++ ***************************************************************************/
++#include "curlcheck.h"
++
++#include "vtls/x509asn1.h"
++
++static CURLcode unit_setup(void)
++{
++  return CURLE_OK;
++}
++
++static void unit_stop(void)
++{
++
++}
++
++#if defined(USE_GNUTLS) || defined(USE_SCHANNEL) || defined(USE_SECTRANSP) || \
++  defined(USE_MBEDTLS)
++
++#ifndef ARRAYSIZE
++#define ARRAYSIZE(A) (sizeof(A)/sizeof((A)[0]))
++#endif
++
++struct test_spec {
++  const char *input;
++  const char *exp_output;
++  CURLcode exp_result;
++};
++
++static struct test_spec test_specs[] = {
++  { "190321134340", "1903-21-13 43:40:00", CURLE_OK },
++  { "", NULL, CURLE_BAD_FUNCTION_ARGUMENT },
++  { "WTF", NULL, CURLE_BAD_FUNCTION_ARGUMENT },
++  { "0WTF", NULL, CURLE_BAD_FUNCTION_ARGUMENT },
++  { "19032113434", NULL, CURLE_BAD_FUNCTION_ARGUMENT },
++  { "19032113434WTF", NULL, CURLE_BAD_FUNCTION_ARGUMENT },
++  { "190321134340.", NULL, CURLE_BAD_FUNCTION_ARGUMENT },
++  { "190321134340.1", "1903-21-13 43:40:00.1", CURLE_OK },
++  { "19032113434017.0", "1903-21-13 43:40:17", CURLE_OK },
++  { "19032113434017.01", "1903-21-13 43:40:17.01", CURLE_OK },
++  { "19032113434003.001", "1903-21-13 43:40:03.001", CURLE_OK },
++  { "19032113434003.090", "1903-21-13 43:40:03.09", CURLE_OK },
++  { "190321134340Z", "1903-21-13 43:40:00 GMT", CURLE_OK },
++  { "19032113434017.0Z", "1903-21-13 43:40:17 GMT", CURLE_OK },
++  { "19032113434017.01Z", "1903-21-13 43:40:17.01 GMT", CURLE_OK },
++  { "19032113434003.001Z", "1903-21-13 43:40:03.001 GMT", CURLE_OK },
++  { "19032113434003.090Z", "1903-21-13 43:40:03.09 GMT", CURLE_OK },
++  { "190321134340CET", "1903-21-13 43:40:00 CET", CURLE_OK },
++  { "19032113434017.0CET", "1903-21-13 43:40:17 CET", CURLE_OK },
++  { "19032113434017.01CET", "1903-21-13 43:40:17.01 CET", CURLE_OK },
++  { "190321134340+02:30", "1903-21-13 43:40:00 UTC+02:30", CURLE_OK },
++  { "19032113434017.0+02:30", "1903-21-13 43:40:17 UTC+02:30", CURLE_OK },
++  { "19032113434017.01+02:30", "1903-21-13 43:40:17.01 UTC+02:30", CURLE_OK },
++  { "190321134340-3", "1903-21-13 43:40:00 UTC-3", CURLE_OK },
++  { "19032113434017.0-04", "1903-21-13 43:40:17 UTC-04", CURLE_OK },
++  { "19032113434017.01-01:10", "1903-21-13 43:40:17.01 UTC-01:10", CURLE_OK },
++};
++
++static bool do_test(struct test_spec *spec, size_t i, struct dynbuf *dbuf)
++{
++  CURLcode result;
++  const char *in = spec->input;
++
++  Curl_dyn_reset(dbuf);
++  result = Curl_x509_GTime2str(dbuf, in, in + strlen(in));
++  if(result != spec->exp_result) {
++    fprintf(stderr, "test %zu: expect result %d, got %d\n",
++            i, spec->exp_result, result);
++    return FALSE;
++  }
++  else if(!result && strcmp(spec->exp_output, Curl_dyn_ptr(dbuf))) {
++    fprintf(stderr, "test %zu: input '%s', expected output '%s', got '%s'\n",
++            i, in, spec->exp_output, Curl_dyn_ptr(dbuf));
++    return FALSE;
++  }
++
++  return TRUE;
++}
++
++UNITTEST_START
++{
++  size_t i;
++  struct dynbuf dbuf;
++  bool all_ok = TRUE;
++
++  Curl_dyn_init(&dbuf, 32*1024);
++
++  if(curl_global_init(CURL_GLOBAL_ALL) != CURLE_OK) {
++    fprintf(stderr, "curl_global_init() failed\n");
++    return TEST_ERR_MAJOR_BAD;
++  }
++
++  for(i = 0; i < ARRAYSIZE(test_specs); ++i) {
++    if(!do_test(&test_specs[i], i, &dbuf))
++      all_ok = FALSE;
++  }
++  fail_unless(all_ok, "some tests of Curl_x509_GTime2str() fails");
++
++  Curl_dyn_free(&dbuf);
++  curl_global_cleanup();
++}
++UNITTEST_STOP
++
++#else
++
++UNITTEST_START
++{
++  puts("not tested since Curl_x509_GTime2str() is not built-in");
++}
++UNITTEST_STOP
++
++#endif
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6d2886f70c..a2cee8ba23 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -16,6 +16,8 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
     file://CVE-2024-6197.patch \
+    file://CVE-2024-7264-1.patch \
+    file://CVE-2024-7264-2.patch \
 "
 SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd"
 
-- 
2.34.1


