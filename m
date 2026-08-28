Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EFCC61DDE
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2976.1787945890452467676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XX9XOeOg;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso16510365e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945889; x=1788550689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RiJ9GwcloaDRUKcgrD0wvgCDVzShCZZLEV7CTRpWAy0=;
        b=XX9XOeOgDUGYlwxj/ihcmO+efmp0f/K7SyVhG49gFlSqwdPljDdgZckIPAfZmm3EzN
         gOhx+ZhE8EINv+6mcW9g+JUyAVAOBUhPaGaHDrB229KP/fTdVsEvtrrB+4BPrCmPvHRE
         /k+dWstV6LKfldgccbOYOFvMyKTm9a9eKoFHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945889; x=1788550689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RiJ9GwcloaDRUKcgrD0wvgCDVzShCZZLEV7CTRpWAy0=;
        b=onk9v03prxg1AxU4i3Y5QHseKUUvoYliUkAAo7ZMT5zmNWWpBf3CrbEW9Bhre7VWqm
         NTnxFIWqmr1Z38O1Rah53CFR7XPnexg3GxQaUtjiOIxzbpF02HMH9khH4wjXOaWItprL
         y0lLnhbv+ozpyMQzdzI9c8R4ycRdY6NfXEZzB9979pKjfW6hB2w2RkWpjWyOM/brdY/j
         SiOY6chUrlcHZ1q08Gfc92C4uPge8YkaTTWMk5JIcPQp7knlax4xwDaFZZ9jBjyMvfkZ
         HPUO9c5KLC/5oKfv6AVtqGb5564ENREuYm95OU2NupbhUh0p+s0jZrxxrY79yXVToTxS
         C0jg==
X-Gm-Message-State: AFuF++lDEMtdBjLKYNGzMXv+sNHyJzaqi0zjYXISKAqjMKl7t3Sd7imw
	6hIe1Z7OkcIXYc47ulgzafpf7GeWsAPp31+MNAOFh3s/CeDkFMsQm1BQolffUEQxatdo0iEn795
	yKtPpIrg=
X-Gm-Gg: AR+sD13q191bzZiAxOpUJ+Mv/qq9IClDbXwu3h6nf5T1rZ+KNy5S/9wS0r4PgmKeSa6
	fhx0GnFJK3vGZWC5rUZRTYQaagpTL9SVmcZdJFQl2oJ1QtH1YZBGev9gXDf240/xV0yThagcMCa
	UMV+uPX1YiUeHYlflT9j/KvR33L30RsqzxixBZBEpM0wuHHESso2plRKzlA2gpY/LKhb1Awm/C1
	1Bl+1OVGAS9/5Msrnctr2Agk9HHt0YcAmsrvo6xDDAYLNlWBDBNpo6jqw4w4PZF2UN522sUqb8b
	qJPYpWp+qunu+GkeQ+iUygZ5ut1iOdyUS2B2ZyNa+ztVUvXzquk2WbvhsXY+QCFMhr1jaiBb66p
	jY6Bifkgxz/iytk0OeNc8NzoRy1TsKEdk/4VGRjUF1BhWiWvM4SJsxHZMsApTKlYPrOkT7Cwyf6
	dU1BAjGxKJLR7mUXRJclR8fFX9qxUV0ahHxCe61R70pJwmzcMnUEbCKxce07qca9/ddeeLKabxX
	12Kb6RfowVeJJXGDJtzHqJae8KrlsGnsaOAV6Bfu4liOwUZ8GjF0l+SaoiZMGZt
X-Received: by 2002:a05:600c:4fcb:b0:499:db27:7b1 with SMTP id 5b1f17b1804b1-49b91c62d9bmr137171765e9.15.1787945888440;
        Fri, 28 Aug 2026 12:38:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/56] wget: Fix CVE-2026-58472
Date: Fri, 28 Aug 2026 21:35:18 +0200
Message-ID: <77e2e7d1928ecb352c5c9a96ba901c676bcb9ff7.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244569

From: Hetvi Thakar <hthakar@cisco.com>

Apply the upstream fix referenced in [2] using the commit
listed in [1].
Also include the upstream follow-up commit [3], which fixes
encoded entity length handling and adds regression tests.

[1] https://gitlab.com/gnuwget/wget/-/commit/dd692d9cea5335b181d877ae917fe6e75587a812
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58472
[3] https://gitlab.com/gnuwget/wget/-/commit/f76978a51ba9365e7ecaed96c1cfb73197a38ca2

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../wget/wget/CVE-2026-58472-regression.patch | 233 ++++++++++++++++++
 .../wget/wget/CVE-2026-58472.patch            |  74 ++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |   2 +
 3 files changed, 309 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch b/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
new file mode 100644
index 00000000000..47dfe2b82c8
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
@@ -0,0 +1,233 @@
+From f6202f6bf630796891e0f69a583dbab05f3cfd41 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Thu, 2 Jul 2026 13:13:07 +0200
+Subject: [PATCH] Regression: Fix buffer overflow in html_quote_string()
+
+The regression has been introduced in commit dd692d9 and
+is not part of any release.
+
+The tests allow the address sanitizer to find the issue.
+
+* src/convert.c: Fix string size calculation.
+* tests/unit-tests.c: Added tests including tests for html_quote_string().
+* tests/unit-tests.h: Add definitions for the test functions.
+
+Reported-by: Trung Nguyen <trungnh@cystack.net>
+
+CVE: CVE-2026-58472
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/f76978a51ba9365e7ecaed96c1cfb73197a38ca2]
+
+(cherry picked from commit f76978a51ba9365e7ecaed96c1cfb73197a38ca2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/convert.c      | 148 +++++++++++++++++++++++++++++++++++++++++++--
+ tests/unit-tests.c |   4 ++
+ tests/unit-tests.h |   4 ++
+ 3 files changed, 152 insertions(+), 4 deletions(-)
+
+diff --git a/src/convert.c b/src/convert.c
+index d1cbab88..386bded4 100644
+--- a/src/convert.c
++++ b/src/convert.c
+@@ -48,6 +48,9 @@ as that of the covered work.  */
+ #include "css-url.h"
+ #include "iri.h"
+ #include "xstrndup.h"
++#ifdef TESTING
++#include "../tests/unit-tests.h"
++#endif
+ 
+ static struct hash_table *dl_file_url_map;
+ struct hash_table *dl_url_file_map;
+@@ -1186,13 +1189,13 @@ html_quote_string (const char *s)
+   for (i = 0; *s; s++)
+     {
+       if (*s == '&')
+-        ok = INT_ADD_OK (i, 4, &i);     /* `amp;' */
++        ok = INT_ADD_OK (i, 4 + 1, &i);     /* `amp;' */
+       else if (*s == '<' || *s == '>')
+-        ok = INT_ADD_OK (i, 3, &i);     /* `lt;' and `gt;' */
++        ok = INT_ADD_OK (i, 3 + 1, &i);     /* `lt;' and `gt;' */
+       else if (*s == '\"')
+-        ok = INT_ADD_OK (i, 5, &i);     /* `quot;' */
++        ok = INT_ADD_OK (i, 5 + 1, &i);     /* `quot;' */
+       else if (*s == ' ')
+-        ok = INT_ADD_OK (i, 4, &i);     /* #32; */
++        ok = INT_ADD_OK (i, 4 + 1, &i);     /* #32; */
+       else
+         ok = INT_ADD_OK (i, 1, &i);
+ 
+@@ -1251,6 +1254,143 @@ html_quote_string (const char *s)
+   return res;
+ }
+ 
++#ifdef TESTING
++
++const char *
++test_construct_relative (void)
++{
++  static const struct {
++    const char *basefile;
++    const char *linkfile;
++    const char *expected;
++  } test_array[] = {
++    { "foo", "bar", "bar" },
++    { "A/foo", "A/bar", "bar" },
++    { "A/foo", "A/B/bar", "B/bar" },
++    { "A/X/foo", "A/Y/bar", "../Y/bar" },
++    { "X/", "Y/bar", "../Y/bar" },
++    { "/foo", "/bar", "bar" },
++    { "/a/b/c", "/a/b/d", "d" },
++    { "/a/b/c", "/a/b/c/d", "c/d" },
++    { "/a/b/c", "/a/b/c/d/e", "c/d/e" },
++    { "/a/b/c", "/x/y/z", "../../x/y/z" },
++    { "a/b", "c/d", "../c/d" },
++    { "./foo", "./bar", "bar" },
++  };
++
++  for (unsigned i = 0; i < countof (test_array); ++i)
++    {
++      char *result = construct_relative (test_array[i].basefile,
++                                         test_array[i].linkfile);
++      mu_assert ("test_construct_relative: wrong result",
++                 strcmp (result, test_array[i].expected) == 0);
++      xfree (result);
++    }
++
++  return NULL;
++}
++
++const char *
++test_match_except_index (void)
++{
++  static const struct {
++    const char *s1;
++    const char *s2;
++    bool expected;
++  } test_array[] = {
++    { "foo/index.html", "foo/", true },
++    { "foo/", "foo/index.html", true },
++    { "foo", "foo/index.html", true },
++    { "foo", "foo/", true },
++    { "foo", "foo", true },
++    { "/foo/index.html", "/foo/", true },
++    { "/foo/", "/foo/index.html", true },
++    { "/foo", "/foo/index.html", true },
++    { "/foo", "/foo/", true },
++    { "foo/bar", "foo/qux", false },
++    { "foo/bar", "bar/foo", false },
++  };
++
++  for (unsigned i = 0; i < countof (test_array); ++i)
++    {
++      bool result = match_except_index (test_array[i].s1, test_array[i].s2);
++      mu_assert ("test_match_except_index: wrong result",
++                 result == test_array[i].expected);
++    }
++
++  return NULL;
++}
++
++const char *
++test_find_fragment (void)
++{
++  static const struct {
++    const char *input;
++    int size;
++    bool has_fragment;
++    const char *fragment;
++  } test_array[] = {
++    { "http://example.com#section", 26, true, "#section" },
++    { "http://example.com", 18, false, NULL },
++    { "http://example.com?a=1#frag", 24, true, "#frag" },
++    { "http://example.com?a=1%26#frag", 28, true, "#frag" },
++    { "http://example.com?a=1&b=2#frag", 30, true, "#frag" },
++    { "a#b", 3, true, "#b" },
++    { "a", 1, false, NULL },
++  };
++  const char *bp, *ep;
++
++  for (unsigned i = 0; i < countof (test_array); ++i)
++    {
++      bool result = find_fragment (test_array[i].input,
++                                   test_array[i].size, &bp, &ep);
++      mu_assert ("test_find_fragment: wrong result",
++                 result == test_array[i].has_fragment);
++      if (test_array[i].has_fragment)
++        {
++          mu_assert ("test_find_fragment: wrong fragment", bp != NULL);
++          mu_assert ("test_find_fragment: fragment mismatch",
++                     strncmp (bp, test_array[i].fragment,
++                              strlen (test_array[i].fragment)) == 0 &&
++                     ep == test_array[i].input + test_array[i].size);
++        }
++    }
++
++  return NULL;
++}
++
++const char *
++test_html_quote_string (void)
++{
++  static const struct {
++    const char *input;
++    const char *expected;
++  } test_array[] = {
++    { "hello", "hello" },
++    { "a&b", "a&amp;b" },
++    { "<tag>", "&lt;tag&gt;" },
++    { "\"quote\"", "&quot;quote&quot;" },
++    { "space here", "space&#32;here" },
++    { "&<>\" ", "&amp;&lt;&gt;&quot;&#32;" },
++    { "no special", "no&#32;special" },
++    { "&&&&", "&amp;&amp;&amp;&amp;" },
++    { "<<>>", "&lt;&lt;&gt;&gt;" },
++    { "" , "" },
++  };
++
++  for (unsigned i = 0; i < countof (test_array); ++i)
++    {
++      char *result = html_quote_string (test_array[i].input);
++      mu_assert ("test_html_quote_string: wrong result",
++                 strcmp (result, test_array[i].expected) == 0);
++      xfree (result);
++    }
++
++  return NULL;
++}
++
++#endif /* TESTING */
++
+ /*
+  * vim: et ts=2 sw=2
+  */
+diff --git a/tests/unit-tests.c b/tests/unit-tests.c
+index 28b9328a..63b83bac 100644
+--- a/tests/unit-tests.c
++++ b/tests/unit-tests.c
+@@ -68,6 +68,10 @@ all_tests(void)
+ #endif
+   mu_run_test (test_parse_netrc);
+   mu_run_test (test_retr_rate);
++  mu_run_test (test_construct_relative);
++  mu_run_test (test_match_except_index);
++  mu_run_test (test_find_fragment);
++  mu_run_test (test_html_quote_string);
+ 
+   return NULL;
+ }
+diff --git a/tests/unit-tests.h b/tests/unit-tests.h
+index 44635f0c..8cd93097 100644
+--- a/tests/unit-tests.h
++++ b/tests/unit-tests.h
+@@ -64,6 +64,10 @@ const char *test_hsts_url_rewrite_congruent(void);
+ const char *test_hsts_read_database(void);
+ const char *test_parse_netrc(void);
+ const char *test_retr_rate(void);
++const char *test_construct_relative(void);
++const char *test_match_except_index(void);
++const char *test_find_fragment(void);
++const char *test_html_quote_string(void);
+ 
+ #endif /* TEST_H */
+ 
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58472.patch b/meta/recipes-extended/wget/wget/CVE-2026-58472.patch
new file mode 100644
index 00000000000..fa014389949
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58472.patch
@@ -0,0 +1,74 @@
+From 5a43952fc39f46bf1973608e014db8cc067de216 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Mon, 29 Jun 2026 19:13:15 +0200
+Subject: [PATCH] * src/convert.c (html_quote_string): Fix integer+buffer
+ overflow
+
+Reported-by: TristanInSec@gmail.com
+
+CVE: CVE-2026-58472
+Upstream-Status: Backport [https://gitlab.com/gnuwget/wget/-/commit/dd692d9cea5335b181d877ae917fe6e75587a812]
+
+(cherry picked from commit dd692d9cea5335b181d877ae917fe6e75587a812)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/convert.c | 31 ++++++++++++++++++++++++-------
+ 1 file changed, 24 insertions(+), 7 deletions(-)
+
+diff --git a/src/convert.c b/src/convert.c
+index 2e5bc22b..d1cbab88 100644
+--- a/src/convert.c
++++ b/src/convert.c
+@@ -36,6 +36,7 @@ as that of the covered work.  */
+ #include <unistd.h>
+ #include <errno.h>
+ #include <assert.h>
++#include <intprops.h>
+ #include "convert.h"
+ #include "url.h"
+ #include "recur.h"
+@@ -1178,21 +1179,37 @@ html_quote_string (const char *s)
+ {
+   const char *b = s;
+   char *p, *res;
+-  int i;
++  size_t i;
++  int ok;
+ 
+   /* Pass through the string, and count the new size.  */
+-  for (i = 0; *s; s++, i++)
++  for (i = 0; *s; s++)
+     {
+       if (*s == '&')
+-        i += 4;                 /* `amp;' */
++        ok = INT_ADD_OK (i, 4, &i);     /* `amp;' */
+       else if (*s == '<' || *s == '>')
+-        i += 3;                 /* `lt;' and `gt;' */
++        ok = INT_ADD_OK (i, 3, &i);     /* `lt;' and `gt;' */
+       else if (*s == '\"')
+-        i += 5;                 /* `quot;' */
++        ok = INT_ADD_OK (i, 5, &i);     /* `quot;' */
+       else if (*s == ' ')
+-        i += 4;                 /* #32; */
++        ok = INT_ADD_OK (i, 4, &i);     /* #32; */
++      else
++        ok = INT_ADD_OK (i, 1, &i);
++
++      if (!ok)
++        {
++          DEBUGP (("Overflow detected in html_quote_string().\n"));
++          abort();
++        }
+     }
+-  res = xmalloc (i + 1);
++
++  if (!INT_ADD_OK (i, 1, &i))
++    {
++      DEBUGP (("Overflow detected in html_quote_string().\n"));
++      abort();
++    }
++
++  res = xmalloc (i);
+   s = b;
+   for (p = res; *s; s++)
+     {
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index 25eea0f801b..dc4903429be 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469-regression_p1.patch \
            file://CVE-2026-58469-regression_p2.patch \
            file://CVE-2026-58471.patch \
+           file://CVE-2026-58472.patch \
+           file://CVE-2026-58472-regression.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"

