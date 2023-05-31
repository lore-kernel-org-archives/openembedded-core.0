Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD1AC7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 02:34:39 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.4584.1685500475575411049
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 19:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=gKK1sm4E;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.177, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-3f83114e0c6so20867961cf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685500474; x=1688092474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBYURpgMfV4aiCr+i6lEKE8/usH2E4XvB2vm8QwCiwE=;
        b=gKK1sm4EWARVoaOPKWqdyMJdSk9oE/kPLnBxMjmYAFdfjQ4N5KCJ8wUzF2U+mNnlW3
         NjspSdKhjSdzJWkTW0m1onrgM3ygaJ0h3nZzEplHl5uQPA7dejQyUnaBTZ63N2Ayl8Zb
         RpPp22QEvcidcbVPBWryUpVFvVho2vSWP33Z//oCB4MN0ydhNOvDTJX6vR3wOqZNFjmc
         Gmrao/rODLlAqCIoHXjyXw1lqYQ9harOGZpHMfPurN/rAs7GRVUWKgupAx/T23Hqdtm5
         tb55AtOEpj/KoiL72Qn1GhSWTPtJoYFZJgoCpe+L/8xEn9AP7CqW9MkTOwdzsZBWG+zJ
         tAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500474; x=1688092474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBYURpgMfV4aiCr+i6lEKE8/usH2E4XvB2vm8QwCiwE=;
        b=FKan41KpWQlzYlqUIgDkgPv/xp2/M+98FgSdbkKohMXpbAjV4y8py+aYwZb1Q7bV1E
         v2bnPiFf8omupFf93PVC1++qgGdXJAEgWHUXhQZpLil9RdolT/gS6ITvnwtKqoxvdtxt
         K8ydtZyqMC1s24adhWHKfJx6tnapOPYzwyTq1/fPO/T4QTRhrqkRyMRbyJeJxeIj+sHj
         YMfCgalmOo0V8EMsKdExuX0oPKB80WPah8xAO+5UqeCTpWIEXljqVxbxmGW8l6QTmcRi
         fgL1HIyeUPTnSfSQ+xhVBNqvD66X370QHbnbDKNS/QZRcV7mhbSIAVggH20nL/vQhT8y
         JbAw==
X-Gm-Message-State: AC+VfDw63OK5SYvAn+8IfEVbr0kMndBZ89yAyVLpTNDy5LO+aWjIbmC4
	z1gs9B+CDa7XCGqVEj/0nixlF0pUKpiNfOAta5c=
X-Google-Smtp-Source: ACHHUZ7qJo3wmGKXl6kWB+I++VL1WAFVTmk9ZkN1qF8koHZQIYsjCruijv0d1ookxqsBeMBOIn5gvA==
X-Received: by 2002:ac8:5c96:0:b0:3f6:b12f:fae0 with SMTP id r22-20020ac85c96000000b003f6b12ffae0mr5005723qta.62.1685500474001;
        Tue, 30 May 2023 19:34:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k91-20020a17090a3ee400b0023a9564763bsm92877pjc.29.2023.05.30.19.34.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/13] curl: Fix CVE-2023-28321
Date: Tue, 30 May 2023 16:34:10 -1000
Message-Id: <75d8593ab3b090266fd2cde27ddc56ad88de7ac7.1685500244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685500244.git.steve@sakoman.com>
References: <cover.1685500244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181972

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


