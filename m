Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA88AC77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 11:33:13 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.47698.1685359989978681913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 04:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dpeXipNC;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-64d2467d640so3794856b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 04:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685359989; x=1687951989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlF7mzllyV5N1chce3lFeNbbVC5Ae3O9NG1HQFE5beI=;
        b=dpeXipNCXkSlGPYhmqq2lhHFO5MTkoxy14IQByRYxss/0BsN1NUCIpSLXnJQSXM6aY
         TpgZDOPh3lsA0YxV28xdzv/lk50ntKO2StlFT4powfUOibB5C0HC7ivpbgtscWaiokRF
         mZVDd+aVoKFSTmKgBN60GeXhdDOtAQweH9n5eVHBukQE2LD8Ytm8XETrHY0ub/dy7Mpn
         hOJv1IhYHN3xqhDIL1cwRgRsXVpvFZo7qN+07mNwjXCCM/6AZdbhFPoj7zHFdeuklMOM
         d4NrP/2ouM08ZI0GSKXzXzOZH0QeaOvR7U7r3svbAlM+gkZ3mPkV9MBhM3SwAfFBeIKB
         lKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685359989; x=1687951989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlF7mzllyV5N1chce3lFeNbbVC5Ae3O9NG1HQFE5beI=;
        b=gKgqfwoXlg5FplTEtA//sXIpo/1xAR9N8y0uPF/v6CX+8pKujhVchFAXq4cooqBXbS
         Wcxuv9pvzfOviPgqtIuVqOYMd+bCq+p4V5svRuLfzHwjNWqRUu5d2F8gA860bkIjT8aw
         sLAQnJoDUp23MXlJ8LFZe0HPZ7ldkz5QFmmcCBwEZEJyeJqrEe+Jp+ViY7MeAraH5jul
         0QJqdWwkTtPuuLHdy443qER/GUiS12xdq0IqEf8KrNd1GQEOFRK9GxHoyliMFvNLyj/M
         YmdWe35RLVdk8IGDy4o02I0dLiLyKga+pRkd9Od6fRGh3xQhfpGzT/IeiuFLTOED2RjJ
         /RyQ==
X-Gm-Message-State: AC+VfDzLDDft5UNozKi2PdFNp6yhmYsdUP1SxqZx+1AIgF5cSuixaN1e
	+PFOgu3GFlJ0b3ld4X7WL/vlxoUdMVk=
X-Google-Smtp-Source: ACHHUZ7M7f2SkPqDMCVgDZTUFIc5vn1a8aC2FITlWKVk/VZr0h9muohCehjXKnhwN07Vu98w8uKBaQ==
X-Received: by 2002:a05:6a00:2e26:b0:643:4d69:efb8 with SMTP id fc38-20020a056a002e2600b006434d69efb8mr15668963pfb.6.1685359989048;
        Mon, 29 May 2023 04:33:09 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f26:2235:3507:cad8:e3af:bc2])
        by smtp.gmail.com with ESMTPSA id a15-20020aa780cf000000b00640defda6d2sm6524228pfn.207.2023.05.29.04.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 04:33:08 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH 3/4] curl: Fix CVE-2023-28321
Date: Mon, 29 May 2023 17:02:45 +0530
Message-Id: <20230529113246.1353022-3-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529113246.1353022-1-bindudaniel1996@gmail.com>
References: <20230529113246.1353022-1-bindudaniel1996@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 11:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181867

From: Bhabu Bindu <bhabu.bindu@kpit.com>

Add patch to fix CVE-2023-28321

IDN wildcard match

curl supports matching of wildcard patterns when listed as
"Subject Alternative Name" in TLS server certificates. curl can be
built to use its own name matching function for TLS rather than one
provided by a TLS library. This private wildcard matching function
would match IDN (International Domain Name)hosts incorrectly and
could as a result accept patterns that otherwise should mismatch.

IDN hostnames are converted to puny code before used for certificate
checks. Puny coded names always start with `xn--` and should not be
allowed to pattern match, but the wildcard check in curl could still
check for `x*`,which would match even though the IDN name most likely
contained nothing even resembling an `x`.

Link: https://curl.se/docs/CVE-2023-28321.html

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../curl/curl/CVE-2023-28321.patch            | 302 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 303 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28321.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-28321.patch b/meta/recipes-support/curl/curl/CVE-2023-28321.patch
new file mode 100644
index 0000000000..bcd8b112db
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-28321.patch
@@ -0,0 +1,302 @@
+From 199f2d440d8659b42670c1b796220792b01a97bf Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 24 Apr 2023 21:07:02 +0200
+Subject: [PATCH] hostcheck: fix host name wildcard checking
+
+The leftmost "label" of the host name can now only match against single
+'*'. Like the browsers have worked for a long time.
+
+- extended unit test 1397 for this
+- move some SOURCE variables from unit/Makefile.am to unit/Makefile.inc
+
+Reported-by: Hiroki Kurosawa
+Closes #11018
+
+CVE: CVE-2023-28321
+Upstream-Status: Backport [https://github.com/curl/curl/commit/199f2d440d8659b42]
+Comments: Hunks removed as changes already exist
+Removed hunks from files: 
+tests/unit/Makefile.am 
+tests/unit/Makefile.inc
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ lib/vtls/hostcheck.c    |  50 +++++++--------
+ tests/data/test1397     |  10 ++-
+ tests/unit/Makefile.am  |  94 ----------------------------
+ tests/unit/Makefile.inc |  94 ++++++++++++++++++++++++++++
+ tests/unit/unit1397.c   | 134 ++++++++++++++++++++++++----------------
+ 5 files changed, 202 insertions(+), 180 deletions(-)
+
+diff --git a/lib/vtls/hostcheck.c b/lib/vtls/hostcheck.c
+index e827dc58f378c..d061c6356f97f 100644
+--- a/lib/vtls/hostcheck.c
++++ b/lib/vtls/hostcheck.c
+@@ -71,7 +71,12 @@ static bool pmatch(const char *hostname, size_t hostlen,
+  * apparent distinction between a name and an IP. We need to detect the use of
+  * an IP address and not wildcard match on such names.
+  *
++ * Only match on "*" being used for the leftmost label, not "a*", "a*b" nor
++ * "*b".
++ *
+  * Return TRUE on a match. FALSE if not.
++ *
++ * @unittest: 1397
+  */
+ 
+ static bool hostmatch(const char *hostname,
+@@ -79,53 +84,42 @@ static bool hostmatch(const char *hostname,
+                       const char *pattern,
+                       size_t patternlen)
+ {
+-  const char *pattern_label_end, *wildcard, *hostname_label_end;
+-  size_t prefixlen, suffixlen;
++  const char *pattern_label_end;
+ 
+-  /* normalize pattern and hostname by stripping off trailing dots */
++  DEBUGASSERT(pattern);
+   DEBUGASSERT(patternlen);
++  DEBUGASSERT(hostname);
++  DEBUGASSERT(hostlen);
++
++  /* normalize pattern and hostname by stripping off trailing dots */
+   if(hostname[hostlen-1]=='.')
+     hostlen--;
+   if(pattern[patternlen-1]=='.')
+     patternlen--;
+ 
+-  wildcard = memchr(pattern, '*', patternlen);
+-  if(!wildcard)
++  if(strncmp(pattern, "*.", 2))
+     return pmatch(hostname, hostlen, pattern, patternlen);
+ 
+   /* detect IP address as hostname and fail the match if so */
+-  if(Curl_host_is_ipnum(hostname))
++  else if(Curl_host_is_ipnum(hostname))
+     return FALSE;
+ 
+   /* We require at least 2 dots in the pattern to avoid too wide wildcard
+      match. */
+   pattern_label_end = memchr(pattern, '.', patternlen);
+   if(!pattern_label_end ||
+-     (memrchr(pattern, '.', patternlen) == pattern_label_end) ||
+-     strncasecompare(pattern, "xn--", 4))
++     (memrchr(pattern, '.', patternlen) == pattern_label_end))
+     return pmatch(hostname, hostlen, pattern, patternlen);
+-
+-  hostname_label_end = memchr(hostname, '.', hostlen);
+-  if(!hostname_label_end)
+-    return FALSE;
+   else {
+-    size_t skiphost = hostname_label_end - hostname;
+-    size_t skiplen = pattern_label_end - pattern;
+-    if(!pmatch(hostname_label_end, hostlen - skiphost,
+-               pattern_label_end, patternlen - skiplen))
+-      return FALSE;
++    const char *hostname_label_end = memchr(hostname, '.', hostlen);
++    if(hostname_label_end) {
++      size_t skiphost = hostname_label_end - hostname;
++      size_t skiplen = pattern_label_end - pattern;
++      return pmatch(hostname_label_end, hostlen - skiphost,
++                    pattern_label_end, patternlen - skiplen);
++    }
+   }
+-  /* The wildcard must match at least one character, so the left-most
+-     label of the hostname is at least as large as the left-most label
+-     of the pattern. */
+-  if(hostname_label_end - hostname < pattern_label_end - pattern)
+-    return FALSE;
+-
+-  prefixlen = wildcard - pattern;
+-  suffixlen = pattern_label_end - (wildcard + 1);
+-  return strncasecompare(pattern, hostname, prefixlen) &&
+-    strncasecompare(wildcard + 1, hostname_label_end - suffixlen,
+-                    suffixlen) ? TRUE : FALSE;
++  return FALSE;
+ }
+ 
+ /*
+diff --git a/tests/data/test1397 b/tests/data/test1397
+index 84f962abebee3..f31b2c2a3f330 100644
+--- a/tests/data/test1397
++++ b/tests/data/test1397
+@@ -2,8 +2,7 @@
+ <info>
+ <keywords>
+ unittest
+-ssl
+-wildcard
++Curl_cert_hostcheck
+ </keywords>
+ </info>
+ 
+@@ -16,9 +15,8 @@ none
+ <features>
+ unittest
+ </features>
+- <name>
+-Check wildcard certificate matching function Curl_cert_hostcheck
+- </name>
++<name>
++Curl_cert_hostcheck unit tests
++</name>
+ </client>
+-
+ </testcase>
+diff --git a/tests/unit/unit1397.c b/tests/unit/unit1397.c
+index 2f3d3aa4d09e1..3ae75618d5d10 100644
+--- a/tests/unit/unit1397.c
++++ b/tests/unit/unit1397.c
+@@ -23,7 +23,6 @@
+  ***************************************************************************/
+ #include "curlcheck.h"
+ 
+-#include "vtls/hostcheck.h" /* from the lib dir */
+ 
+ static CURLcode unit_setup(void)
+ {
+@@ -32,63 +31,94 @@ static CURLcode unit_setup(void)
+ 
+ static void unit_stop(void)
+ {
+-  /* done before shutting down and exiting */
+ }
+ 
+-UNITTEST_START
+-
+ /* only these backends define the tested functions */
+-#if defined(USE_OPENSSL) || defined(USE_GSKIT)
+-
+-  /* here you start doing things and checking that the results are good */
++#if defined(USE_OPENSSL) || defined(USE_GSKIT) || defined(USE_SCHANNEL)
++#include "vtls/hostcheck.h"
++struct testcase {
++  const char *host;
++  const char *pattern;
++  bool match;
++};
+ 
+-fail_unless(Curl_cert_hostcheck(STRCONST("www.example.com"),
+-                                STRCONST("www.example.com")), "good 1");
+-fail_unless(Curl_cert_hostcheck(STRCONST("*.example.com"),
+-                                STRCONST("www.example.com")),
+-            "good 2");
+-fail_unless(Curl_cert_hostcheck(STRCONST("xxx*.example.com"),
+-                                STRCONST("xxxwww.example.com")), "good 3");
+-fail_unless(Curl_cert_hostcheck(STRCONST("f*.example.com"),
+-                                STRCONST("foo.example.com")), "good 4");
+-fail_unless(Curl_cert_hostcheck(STRCONST("192.168.0.0"),
+-                                STRCONST("192.168.0.0")), "good 5");
++static struct testcase tests[] = {
++  {"", "", FALSE},
++  {"a", "", FALSE},
++  {"", "b", FALSE},
++  {"a", "b", FALSE},
++  {"aa", "bb", FALSE},
++  {"\xff", "\xff", TRUE},
++  {"aa.aa.aa", "aa.aa.bb", FALSE},
++  {"aa.aa.aa", "aa.aa.aa", TRUE},
++  {"aa.aa.aa", "*.aa.bb", FALSE},
++  {"aa.aa.aa", "*.aa.aa", TRUE},
++  {"192.168.0.1", "192.168.0.1", TRUE},
++  {"192.168.0.1", "*.168.0.1", FALSE},
++  {"192.168.0.1", "*.0.1", FALSE},
++  {"h.ello", "*.ello", FALSE},
++  {"h.ello.", "*.ello", FALSE},
++  {"h.ello", "*.ello.", FALSE},
++  {"h.e.llo", "*.e.llo", TRUE},
++  {"h.e.llo", " *.e.llo", FALSE},
++  {" h.e.llo", "*.e.llo", TRUE},
++  {"h.e.llo.", "*.e.llo", TRUE},
++  {"*.e.llo.", "*.e.llo", TRUE},
++  {"************.e.llo.", "*.e.llo", TRUE},
++  {"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
++   "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"
++   "CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC"
++   "DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD"
++   "EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE"
++   ".e.llo.", "*.e.llo", TRUE},
++  {"\xfe\xfe.e.llo.", "*.e.llo", TRUE},
++  {"h.e.llo.", "*.e.llo.", TRUE},
++  {"h.e.llo", "*.e.llo.", TRUE},
++  {".h.e.llo", "*.e.llo.", FALSE},
++  {"h.e.llo", "*.*.llo.", FALSE},
++  {"h.e.llo", "h.*.llo", FALSE},
++  {"h.e.llo", "h.e.*", FALSE},
++  {"hello", "*.ello", FALSE},
++  {"hello", "**llo", FALSE},
++  {"bar.foo.example.com", "*.example.com", FALSE},
++  {"foo.example.com", "*.example.com", TRUE},
++  {"baz.example.net", "b*z.example.net", FALSE},
++  {"foobaz.example.net", "*baz.example.net", FALSE},
++  {"xn--l8j.example.local", "x*.example.local", FALSE},
++  {"xn--l8j.example.net", "*.example.net", TRUE},
++  {"xn--l8j.example.net", "*j.example.net", FALSE},
++  {"xn--l8j.example.net", "xn--l8j.example.net", TRUE},
++  {"xn--l8j.example.net", "xn--l8j.*.net", FALSE},
++  {"xl8j.example.net", "*.example.net", TRUE},
++  {"fe80::3285:a9ff:fe46:b619", "*::3285:a9ff:fe46:b619", FALSE},
++  {"fe80::3285:a9ff:fe46:b619", "fe80::3285:a9ff:fe46:b619", TRUE},
++  {NULL, NULL, FALSE}
++};
+ 
+-fail_if(Curl_cert_hostcheck(STRCONST("xxx.example.com"),
+-                            STRCONST("www.example.com")), "bad 1");
+-fail_if(Curl_cert_hostcheck(STRCONST("*"),
+-                            STRCONST("www.example.com")),"bad 2");
+-fail_if(Curl_cert_hostcheck(STRCONST("*.*.com"),
+-                            STRCONST("www.example.com")), "bad 3");
+-fail_if(Curl_cert_hostcheck(STRCONST("*.example.com"),
+-                            STRCONST("baa.foo.example.com")), "bad 4");
+-fail_if(Curl_cert_hostcheck(STRCONST("f*.example.com"),
+-                            STRCONST("baa.example.com")), "bad 5");
+-fail_if(Curl_cert_hostcheck(STRCONST("*.com"),
+-                            STRCONST("example.com")), "bad 6");
+-fail_if(Curl_cert_hostcheck(STRCONST("*fail.com"),
+-                            STRCONST("example.com")), "bad 7");
+-fail_if(Curl_cert_hostcheck(STRCONST("*.example."),
+-                            STRCONST("www.example.")), "bad 8");
+-fail_if(Curl_cert_hostcheck(STRCONST("*.example."),
+-                            STRCONST("www.example")), "bad 9");
+-fail_if(Curl_cert_hostcheck(STRCONST(""), STRCONST("www")), "bad 10");
+-fail_if(Curl_cert_hostcheck(STRCONST("*"), STRCONST("www")), "bad 11");
+-fail_if(Curl_cert_hostcheck(STRCONST("*.168.0.0"),
+-                            STRCONST("192.168.0.0")), "bad 12");
+-fail_if(Curl_cert_hostcheck(STRCONST("www.example.com"),
+-                            STRCONST("192.168.0.0")), "bad 13");
+-
+-#ifdef ENABLE_IPV6
+-fail_if(Curl_cert_hostcheck(STRCONST("*::3285:a9ff:fe46:b619"),
+-                            STRCONST("fe80::3285:a9ff:fe46:b619")), "bad 14");
+-fail_unless(Curl_cert_hostcheck(STRCONST("fe80::3285:a9ff:fe46:b619"),
+-                                STRCONST("fe80::3285:a9ff:fe46:b619")),
+-            "good 6");
+-#endif
++UNITTEST_START
++{
++  int i;
++  for(i = 0; tests[i].host; i++) {
++    if(tests[i].match != Curl_cert_hostcheck(tests[i].pattern,
++                                             strlen(tests[i].pattern),
++                                             tests[i].host,
++                                             strlen(tests[i].host))) {
++      fprintf(stderr,
++              "HOST: %s\n"
++              "PTRN: %s\n"
++              "did %sMATCH\n",
++              tests[i].host,
++              tests[i].pattern,
++              tests[i].match ? "NOT ": "");
++      unitfail++;
++    }
++  }
++}
+ 
+-#endif
++UNITTEST_STOP
++#else
+ 
+-  /* you end the test code like this: */
++UNITTEST_START
+ 
+ UNITTEST_STOP
++#endif
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 422c2bec0f..3241867d7e 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -47,6 +47,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-27536.patch \
            file://CVE-2023-28319.patch \
            file://CVE-2023-28320.patch \
+           file://CVE-2023-28321.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


