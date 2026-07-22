Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC29C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:08:48 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44378.1784714925361412992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KvChVgQb;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11244; q=dns/txt;
  s=iport01; t=1784714925; x=1785924525;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HdB3NMLqkyKunz1W6RUj38yN2rLdKC8qrwF+z98jWIw=;
  b=KvChVgQbQd0/IEtIX2zLlE4eZHaQTSaaaOD7FhNNJ89Gzji8hg/bDwdQ
   wg5Y8kof3yKiUAKoGIa6PeNnsMdbRUOrFx31xnibbPSLyw7fI42Y4NRcy
   quGKhJvUBQlgj6VxG+OuMOFkHuC5Wqwz6oHrWDT0ubwLYYdSDtfzNcd4J
   0Thp4B6vPzPmlpym7Psd598sBJh95YztNeXWRloH9C+QeS/50H/verL5e
   lixmsgUtQB5Gm4etW8HC0SA1vwesCF1d7CqjTmghp3PvMGbiKwETQw23x
   bXpfcBPS+q9kEApyoAtH7p1PngcOkC8+efBfQ10ZAlDtCKPBKgORB4TYe
   A==;
X-CSE-ConnectionGUID: FRZBAteYSjO9eUwTSrzOog==
X-CSE-MsgGUID: FBOnTSOfSgu7gO+Nq/nasg==
X-IPAS-Result: =?us-ascii?q?A0BIAgBAlWBq/5X/Ja1aglmCV3ReQ0mWSgOLZJI3gX4PA?=
 =?us-ascii?q?QEBD0QNBAEBKoRbAo1XAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDMgEYAS0QHAMBAi8gCyMIGYMCAYI6AzcDEcBmgiyBA?=
 =?us-ascii?q?YMoAT8CQ1DYSQ2CWAELFAEFgTOFP4J9hSNcGAGEfCcbG4FygRWDaYEFgRpCA?=
 =?us-ascii?q?QMYiAsEgiKBDIFaGAaQIkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?BsHBYEdgS6BAoRuIx8DOX+BL3VKdy1pARIXgSaCFIE6AoEDAwsYDUgRLDcUG?=
 =?us-ascii?q?QQ+bgeNaSOBTnJTOwEHIgEBIIEAQIEXpSugHnEKKIN1jCGPPoV8GjOFW6URC?=
 =?us-ascii?q?5h9izeCU4QJgmWOcnCEaYFoPIFHCwdwFYMiCUoZD44tCwuDYIF/zAYnMgIJM?=
 =?us-ascii?q?gEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:PJdf+qIyEgMa4LV1FE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS3mRVy
 zcdWm/Vaf/fajP8KIwgbt+/908Au5LXyYc1TwMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQuajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1ANnMcFJEVy911JjBDy
 OMkEyofSReM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAV7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEWojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsieOzYIWPJoziqcN9sGy/o
 F792GrCDQxFO/vc7yPC9Hu3ibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:c4WhTK+rAevESNk2Q7puk+AAI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 5ISdkZNDSJNykYse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAY0++8YTzraXGfg2J9dOIEKK
 Y=
X-Talos-CUID: 9a23:cc9K8m8oOC1W9lRirWyVv2AuKOoMbnDs93X3ckKFFlpSUq+yTlDFrQ==
X-Talos-MUID: 9a23:TgK6BwrQ6UXG0IYSnnsezx9IE8FU2IOgM08Qzpoh+O+dcip5IDjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,178,1779148800"; 
   d="scan'208";a="513687248"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Jul 2026 10:08:44 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 5652618000301;
	Wed, 22 Jul 2026 10:08:44 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 0504DCD144D; Wed, 22 Jul 2026 03:08:44 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH 4/4] wget: Fix CVE-2026-58472
Date: Wed, 22 Jul 2026 03:07:54 -0700
Message-Id: <20260722100754.1568842-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260722100754.1568842-1-hthakar@cisco.com>
References: <20260722100754.1568842-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241648

From: Hetvi Thakar <hthakar@cisco.com>

Apply the upstream fix referenced in [2] using the commit
listed in [1].
Also include the upstream follow-up commit [3], which fixes
encoded entity length handling and adds regression tests.

[1] https://gitlab.com/gnuwget/wget/-/commit/dd692d9cea5335b181d877ae917fe6e75587a812
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58472
[3] https://gitlab.com/gnuwget/wget/-/commit/f76978a51ba9365e7ecaed96c1cfb73197a38ca2

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2
Include the upstream follow-up fix for the buffer overflow
regression introduced by the initial CVE-2026-58472 fix.
---
 .../wget/wget/CVE-2026-58472-regression.patch | 233 ++++++++++++++++++
 .../wget/wget/CVE-2026-58472.patch            |  74 ++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |   2 +
 3 files changed, 309 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch b/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
new file mode 100644
index 0000000000..47dfe2b82c
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
index 0000000000..fa01438994
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
index 98fe71e220..071caac735 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -20,6 +20,8 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469-regression_p2.patch \
            file://CVE-2026-58470.patch \
            file://CVE-2026-58471.patch \
+           file://CVE-2026-58472.patch \
+           file://CVE-2026-58472-regression.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
-- 
2.35.6


