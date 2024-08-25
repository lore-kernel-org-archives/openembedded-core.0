Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359BFC5472F
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 18:50:05 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.37008.1724611800892310434
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 11:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=i0TDZsG3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d3c08541cdso2811968a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 11:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724611800; x=1725216600; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+E5QeQduXXY946XAZ8LTGkiijvaj4ejsgfwzCZdCFs=;
        b=i0TDZsG3emt2TCUKuek0dzphMts/Wukip1321zk6o4Ce8U84jgamOndz9KTYHH3PKs
         22uS5LuClEmL5udStffiNVMPXKR3wElsjyBHpVg2qWaGuPK9BPpQxCpxNhNhkQpUwRJ5
         7SvhlZStiD8fYLFDgAoQYit02EZmV0tcqfgbWDGZbB/H5FpxSzkZdBFcDZg7NSwgTwJj
         2jS4dG3re2+l7qJSi/ILwGW0o0cN6E9N1Wzc5jBxuNQuvRyegJD8kd8UNREdjxdu+Dz1
         AbANyqNLZ0LhC03cPGp5wtLav789TRnr8JWHuj1pJPFD82UYJQX1fwAbUOS3rQahECea
         4m6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724611800; x=1725216600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+E5QeQduXXY946XAZ8LTGkiijvaj4ejsgfwzCZdCFs=;
        b=QVUE7HxYr7fjDGH97FNh2ZCy+5aS+hk4UulJjQRc5MIkDR0Kk+DgSvu8nsUx019oQD
         ZhvcygaUPQlDeyRUhUcSWOF+a4WF2eSjoRC6Ee/eKLK93VujMKsUEl7l/GgzEVv5tDa/
         jbV8C8l4kEkZJ/PPC3AB4BTDRjp1BX7J+GmE7eA7Qte+qjkFaS5F07i8oJRyeJ2TMb1L
         mOOJeBx9QuJ+S/5jQ9n5Q3+4dLBFfb7/TpiRRek+fw2ogbJhCLU26MFW63SfSo0qaiNc
         xH4SbmlGDbGxrT3eUyU6qTD9186uaODfzmmFqu16Lf2d/l9xPaDGeQ/30cABXXg9VLIW
         suJQ==
X-Gm-Message-State: AOJu0YwuxczCCVT2Q9Y2ASs/W6Zm9tjm3nMk37cPiQ3c+1WEkUficH8P
	8NwwRhGTBaShPuY6oi/ebAHQ5yISFAX+myjwM3VGVc/VV+hIL0/3e5o/rS9cDT72mtHEiHh62GO
	+JmuokQ==
X-Google-Smtp-Source: AGHT+IEQ1wkrpbbt0nGBvdcyVaMfKVPE+3+lNkCDxMqhAryL60E7ZkU1Xeh92lRhJvavKnhI4X7W7Q==
X-Received: by 2002:a17:90b:4c12:b0:2d3:cc16:826f with SMTP id 98e67ed59e1d1-2d64672be1emr8865210a91.0.1724611799922;
        Sun, 25 Aug 2024 11:49:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d61391fe09sm8294216a91.19.2024.08.25.11.49.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 11:49:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/6] curl: Security fix for CVE-2024-7264
Date: Sun, 25 Aug 2024 11:49:48 -0700
Message-Id: <cf0b1ed6c4cd9f61e39befb9c9785b1433777988.1724611692.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724611692.git.steve@sakoman.com>
References: <cover.1724611692.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 18:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203728

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/curl/curl/commit/27959ecce75cdb2809c0bdb3286e60e08fadb519]

CVE's Fixed:
============
CVE-2024-7264 libcurl: ASN.1 date parser overread

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2024-7264_1.patch           |  66 ++++
 .../curl/curl/CVE-2024-7264_2.patch           | 320 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   2 +
 3 files changed, 388 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-7264_1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-7264_2.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-7264_1.patch b/meta/recipes-support/curl/curl/CVE-2024-7264_1.patch
new file mode 100644
index 0000000000..2e1d8eeaaa
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-7264_1.patch
@@ -0,0 +1,66 @@
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
+Note: This patch is needed by the main patch to be backported.
+
+Upstream-Status: Backport from [https://github.com/curl/curl/commit/3c914bc680155b32178f1f15ca8d47c7f4640afe]
+CVE: CVE-2024-7264
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ lib/vtls/x509asn1.c | 23 ++++++++++++++---------
+ 1 file changed, 14 insertions(+), 9 deletions(-)
+
+diff --git a/lib/vtls/x509asn1.c b/lib/vtls/x509asn1.c
+index f64acb8..b538bd9 100644
+--- a/lib/vtls/x509asn1.c
++++ b/lib/vtls/x509asn1.c
+@@ -539,7 +539,7 @@ static const char *GTime2str(const char *beg, const char *end)
+   /* Convert an ASN.1 Generalized time to a printable string.
+      Return the dynamically allocated string, or NULL if an error occurs. */
+ 
+-  for(fracp = beg; fracp < end && *fracp >= '0' && *fracp <= '9'; fracp++)
++  for(fracp = beg; fracp < end && ISDIGIT(*fracp); fracp++)
+     ;
+ 
+   /* Get seconds digits. */
+@@ -558,17 +558,22 @@ static const char *GTime2str(const char *beg, const char *end)
+     return NULL;
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
+-- 
+2.35.7
+
diff --git a/meta/recipes-support/curl/curl/CVE-2024-7264_2.patch b/meta/recipes-support/curl/curl/CVE-2024-7264_2.patch
new file mode 100644
index 0000000000..e8853c1e0c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-7264_2.patch
@@ -0,0 +1,320 @@
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
+Upstream-Status: Backport from [https://github.com/curl/curl/commit/27959ecce75cdb2809c0bdb3286e60e08fadb519]
+CVE: CVE-2024-7264
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
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
+index b538bd9..a25a6e6 100644
+--- a/lib/vtls/x509asn1.c
++++ b/lib/vtls/x509asn1.c
+@@ -563,12 +563,13 @@ static const char *GTime2str(const char *beg, const char *end)
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
+@@ -577,18 +578,24 @@ static const char *GTime2str(const char *beg, const char *end)
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
+   return curl_maprintf("%.4s-%.2s-%.2s %.2s:%.2s:%c%c%s%.*s%s%.*s",
+                        beg, beg + 4, beg + 6,
+                        beg + 8, beg + 10, sec1, sec2,
+@@ -596,6 +603,15 @@ static const char *GTime2str(const char *beg, const char *end)
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
+  *  Convert an ASN.1 UTC time to a printable string.
+  * Return the dynamically allocated string, or NULL if an error occurs.
+diff --git a/lib/vtls/x509asn1.h b/lib/vtls/x509asn1.h
+index db7df0e..515cb7e 100644
+--- a/lib/vtls/x509asn1.h
++++ b/lib/vtls/x509asn1.h
+@@ -73,6 +73,17 @@ CURLcode Curl_extract_certinfo(struct Curl_easy *data, int certnum,
+                                const char *beg, const char *end);
+ CURLcode Curl_verifyhost(struct Curl_easy *data, struct connectdata *conn,
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
+ #endif /* USE_GSKIT or USE_NSS or USE_GNUTLS or USE_WOLFSSL or USE_SCHANNEL
+         * or USE_SECTRANSP */
+ #endif /* HEADER_CURL_X509ASN1_H */
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 47117b6..5415f37 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -208,7 +208,7 @@ test1620 test1621 \
+ \
+ test1630 test1631 test1632 test1633 test1634 \
+ \
+-test1650 test1651 test1652 test1653 test1654 test1655 \
++test1650 test1651 test1652 test1653 test1654 test1655 test1656 \
+ test1660 test1661 \
+ \
+ test1700 test1701 test1702 test1703 \
+diff --git a/tests/data/test1656 b/tests/data/test1656
+new file mode 100644
+index 0000000..2fab21b
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
+index 7e7844e..b5650b2 100644
+--- a/tests/unit/Makefile.inc
++++ b/tests/unit/Makefile.inc
+@@ -34,7 +34,7 @@ UNITPROGS = unit1300 unit1301 unit1302 unit1303 unit1304 unit1305 unit1307 \
+  unit1600 unit1601 unit1602 unit1603 unit1604 unit1605 unit1606 unit1607 \
+  unit1608 unit1609 unit1610 unit1611 unit1612 \
+  unit1620 unit1621 \
+- unit1650 unit1651 unit1652 unit1653 unit1654 unit1655 \
++ unit1650 unit1651 unit1652 unit1653 unit1654 unit1655 unit1656 \
+  unit1660 unit1661
+ 
+ unit1300_SOURCES = unit1300.c $(UNITFILES)
+@@ -155,6 +155,8 @@ unit1654_CPPFLAGS = $(AM_CPPFLAGS)
+ unit1655_SOURCES = unit1655.c $(UNITFILES)
+ unit1655_CPPFLAGS = $(AM_CPPFLAGS)
+ 
++unit1656_SOURCES = unit1656.c $(UNITFILES)
++
+ unit1660_SOURCES = unit1660.c $(UNITFILES)
+ unit1660_CPPFLAGS = $(AM_CPPFLAGS)
+ 
+diff --git a/tests/unit/unit1656.c b/tests/unit/unit1656.c
+new file mode 100644
+index 0000000..644e72f
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
+-- 
+2.35.7
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 72d8544e08..81a653b583 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -58,6 +58,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-46219-0002.patch \
            file://CVE-2023-46219-0003.patch \
            file://CVE-2024-2398.patch \
+           file://CVE-2024-7264_1.patch \
+           file://CVE-2024-7264_2.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


