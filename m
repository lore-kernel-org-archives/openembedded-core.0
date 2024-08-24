Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68477C5472C
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 14:58:36 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.14282.1724511507830312377
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Aug 2024 07:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XKoClYux;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20240824145824c9cecd7b021e338158-_llff6@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20240824145824c9cecd7b021e338158
        for <openembedded-core@lists.openembedded.org>;
        Sat, 24 Aug 2024 16:58:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=wQ1trf2KT4Jr3fNvYQbYxOGx3MxXsoPEK3ENLiSdAaE=;
 b=XKoClYuxJlAHFTlwqUUDqLYS9CSVtclxj9JqjnVaNZlhQ/LXtRxpuyWcvjRskxOdmMQl4y
 r6UY0Qjz7x3jmeW9USFPNr0drGhoxd3KNDDBm2ROSs4uHt7NIsKbHDuQ7nDWNwWHaf8dOsam
 Lj1FhWLkdONiVJapucwLLqtPE1TdYgMcYHdra2ThrNusXrZQaaUyuDMbwJgbC4YYue4SL/AX
 5ZuQe74HQIjXOC0ZsWWMZTGwNzSlt8YUMTJokzHPrP47sbeT/lRJybcaZcc4q8/h6vSmpGI3
 MH2p8LwLVvliPPOvya/KP8mK+F1eAP/2debHNAE1ig3bIIvSxlHu6FEA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] curl: Patch CVE-2024-7264
Date: Sat, 24 Aug 2024 16:57:36 +0200
Message-Id: <20240824145736.2473963-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Aug 2024 14:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203713

From: Peter Marko <peter.marko@siemens.com>

Pick commits per https://curl.se/docs/CVE-2024-7264.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
2.30.2


