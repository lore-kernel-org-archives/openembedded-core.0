Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57EF8C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 05:27:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5542.1788326820592137871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 22:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XNom0TPE;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49557167508so5864725e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 22:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788326819; x=1788931619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gyjFMAn+Nq8k41Ha6ptbIXqVfj9LNHKTkv3o0WcXtXU=;
        b=XNom0TPEfxzTPoD6eAwDhVlrYVUX9+bvFhveSBR6d9re1MNsSjfzouJCvKz3aYF8sN
         1wMymmIGXpMpVcvPP6A5fNEuY0ggZBlW26/WnD4dI6ZsQSFXTMSo6TBcUa2y5W+hcn+4
         SXwLm0f2rMKsOWgVtuqUS9JFJPm3EkdDn4m8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788326819; x=1788931619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gyjFMAn+Nq8k41Ha6ptbIXqVfj9LNHKTkv3o0WcXtXU=;
        b=LGBI/vMa1+xR/Od7G2D4nVI+V0n1yTpLx3I9YmLkQsUHEtnJl+NMUTCKMafuJQkGSf
         990xLrY00Cns0Ffmvv5F5lN7D+zS+xiN5nGiKN4jNJZOx3lGEy6Z3j+o/IONYe7a5Qea
         KGiYT5EvF+bnNIY+m74Y//IP19FI/gR6h6EynPQsOGlivGry0k3xFT7e1Mjwz8xANOdQ
         OY9M4nR9FPhqfbVklU0OcpTGWGeL5OEwlTwjvH1IB8CX2fIAym+gIPLOAX2CvxMBuGgk
         ZDU93idrJgf+hdJY3E6X700G4LeVQ1X4GVob4BJ7EXt5sIBl/BrqaRS8EYAD27kkR0pR
         nWAg==
X-Gm-Message-State: AFuF++mBb3t2Rs8Iz8JhWe+aI6ZrBbMIf/PufALSeQVbUhyjYnP2bGg4
	wuboL97VxtKWgy9DkxcQ+xPzrcaNLXgHq4SeAO4PbffFySuB71Eu4aQWPJGU5OuU7NVbssHUd0v
	lUgCOI/4=
X-Gm-Gg: AR+sD12vZbvsYt+nypG33cVPq3OYaIpcSx53Yfqk3McPyCxHGFl7ijZZGZVMPKV94aK
	d/dJTre7yfTryWlGYWJYZNMTjspJKUBgbmmy4NIJdBBx8N33N/RBEqhEFItUUTN4s7E7WXOdnUA
	gZQg8oBy7zs8MmTiFmezmDXklFJ5E+mbiYF72FkoVsBR1XDn1NbZFbUJotzVv6PcfPTCUWHoQRY
	6fSP09oe4YaT8Edkjm0GHuWWY2ne/9m/BpA+NjUyyj7q3l5hp/r6NZ0TncbPfHKinqaBbObvzqp
	2pVJGJh6+VjaYn6S8dj3D6wYrebYqge06wbeqKkF4WB7a+Vj6FAGVAuV+vKnOASHFctas5riEA5
	lSywdVUl9EjgBOGsRsWwGZFvN20aXSVhIDb+/053+ygEwYvpf/J/ePDAY+ecc9Xq6TzITw+xmQ9
	kWUo8rvGKJe9bU305a2QvoBHVYFs8y81O2DqpQly6LRzlJNCMNxQ+x2imaouajLnvf/oQeM9ZEy
	e1Yui0rHnDtBaHdiQ==
X-Received: by 2002:a05:600c:6388:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-49ce583e8a8mr37404355e9.11.1788326818730;
        Tue, 01 Sep 2026 22:26:58 -0700 (PDT)
Received: from FRSMI25-LASER.wifi-gare.sncf.com ([148.169.40.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce4780f0dsm37084695e9.12.2026.09.01.22.26.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 22:26:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/27] wget: Fix CVE-2026-58472
Date: Wed,  2 Sep 2026 07:25:33 +0200
Message-ID: <c359e2d4f41b352b26004f3f9590bef29815b3a1.1788326578.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788326578.git.yoann.congal@smile.fr>
References: <cover.1788326578.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 05:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244867

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
 .../wget/wget/CVE-2026-58472-regression.patch | 236 ++++++++++++++++++
 .../wget/wget/CVE-2026-58472.patch            |  77 ++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |   2 +
 3 files changed, 315 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58472.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch b/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
new file mode 100644
index 00000000000..c82d2f2b060
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58472-regression.patch
@@ -0,0 +1,236 @@
+From 6ab6b6d2fc2ed5e4cbb4908b9ad282110f30a688 Mon Sep 17 00:00:00 2001
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
+index 51636340..4dae497c 100644
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
+@@ -1177,13 +1180,13 @@ html_quote_string (const char *s)
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
+@@ -1242,6 +1245,143 @@ html_quote_string (const char *s)
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
+index 085a0321..f92d72b4 100644
+--- a/tests/unit-tests.c
++++ b/tests/unit-tests.c
+@@ -66,6 +66,10 @@ all_tests(void)
+   mu_run_test (test_hsts_read_database);
+ #endif
+   mu_run_test (test_parse_netrc);
++  mu_run_test (test_construct_relative);
++  mu_run_test (test_match_except_index);
++  mu_run_test (test_find_fragment);
++  mu_run_test (test_html_quote_string);
+ 
+   return NULL;
+ }
+diff --git a/tests/unit-tests.h b/tests/unit-tests.h
+index 16573b1c..7542660b 100644
+--- a/tests/unit-tests.h
++++ b/tests/unit-tests.h
+@@ -62,6 +62,10 @@ const char *test_hsts_url_rewrite_superdomain(void);
+ const char *test_hsts_url_rewrite_congruent(void);
+ const char *test_hsts_read_database(void);
+ const char *test_parse_netrc(void);
++const char *test_construct_relative(void);
++const char *test_match_except_index(void);
++const char *test_find_fragment(void);
++const char *test_html_quote_string(void);
+ 
+ #endif /* TEST_H */
+ 
+-- 
+2.35.6
+
diff --git a/meta/recipes-extended/wget/wget/CVE-2026-58472.patch b/meta/recipes-extended/wget/wget/CVE-2026-58472.patch
new file mode 100644
index 00000000000..29f6f23d07a
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-58472.patch
@@ -0,0 +1,77 @@
+From 7d0400b63382fbf336df9b63c787571d2df8a772 Mon Sep 17 00:00:00 2001
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
+index b934d49b..51636340 100644
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
+@@ -1169,21 +1170,37 @@ html_quote_string (const char *s)
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
+-- 
+2.35.6
+
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
index 9c7d42bd3f0..8ae0bcf1f05 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -6,6 +6,8 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58469-regression_p1.patch \
            file://CVE-2026-58469-regression_p2.patch \
            file://CVE-2026-58471.patch \
+           file://CVE-2026-58472.patch \
+           file://CVE-2026-58472-regression.patch \
           "
 
 SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"

