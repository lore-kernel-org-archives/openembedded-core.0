Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE81CD3439
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:58:52 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1048.1778000331586615544
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m9zuyKRS;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48909558b3aso60058815e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000330; x=1778605130; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NS1v5HGa4iyu1KmJ5rEKcRlmJa+UAZuNGT92ecVz4pk=;
        b=m9zuyKRSpg7+Bdnx/lVaJwCjOVvsCNiIINyK3yasrErkgas8On8LeYjs3plUhzHh0x
         47DEVvM/0hw6SYq71Hk2a85p3bXjMqDNXs19qZ065MRxeoaZSBV9hsxn352RhZS1HpI0
         2jwEeKXPKKPJOm1AU1myhg3DpbsAhCJGd/3l8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000330; x=1778605130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NS1v5HGa4iyu1KmJ5rEKcRlmJa+UAZuNGT92ecVz4pk=;
        b=W4cTzvheyy9ZDpQnNbD2V94BtqtVZTHS5AUQrF8wMpQKd5GgfLNj14Uic3QrYlJMPU
         /6yJ4rUO++BnqsqOCAMIrxr4q9L4aO3XA8zz3mMLe10Lew0ucD6wgT3oEmVi0bGBxjTM
         A08sSD2owa1S39MlEwpaKpV0kN1DIR03tj1RJnvC9YOjPlh3njU6AqMazobnLFGqM1KH
         VJhTV22t+aOO75+o0dQx1vQiNrru0L5wT5zlAyQD4zGv5CIk8ZAVJHEUiNCmHVgqbo21
         l1DQ+gJxAlx+HtyttzRhA0EIGNM9yGHRMLngObl4GHFeVXQmRP9JD7HvcOzEZslEPzDu
         aamw==
X-Gm-Message-State: AOJu0YzSFCosieT9PX8H5/xS5rFMpNEqPwcP5RwBGlk1oBwZr4y+FbF6
	Lzy1wzdax0wslG2qsiLWL9UrQ5a8KJ1iJ3cjcUleuUv1RV0/paC52AyEal0wXTf6L77UUccP1Je
	7CoduEac=
X-Gm-Gg: AeBDievV/9xyTukWJUtzkvHHf1I2KG55qKlcikH5JzPUOmTMj17UU6sm2HlSdMIZY6K
	0C4iAac8GRQZDhDUpr33Uzekdyt1LhSYD5zixo5uQHQPrQl2RvHIDvYxpm9a8hDww/sev9R8f61
	o/6TykrMtxaKtvo2nQp+aZ4HgiVS+eWKJko1RPD3QPR0NMIN7EVF/XSacKd3+D7J6tMs4RDC8eA
	InkHRPtYnjfmmmXN7kvyD/A54FouwAH2yfINvLG4MlilIul4Tlo3fIs692uY2GZqETlwYyBjZLj
	Vk+UYHbYdqX006bQ/Q+IkPbiAy03ddWHxezRt81iLjuBJYE3GIpRamhxmF3m39udY1f17S13FnU
	/X0y50wCdOFoYAW7Buhh64o0ZjqRQksl/s8uI0tT37/4Ozv6WJf6DxY4ZzsTNpb3AMTwVGojgUl
	8NCEsgL4qQq8ft7kVnmgMn6A8oIZBciOQDio3AEh7PfnyJB8RfX3rXlYVzuoNuRQRoX2tsG8rS3
	Lt+jJtdKnOf6RGEIfvF3eDYEQ==
X-Received: by 2002:a05:600c:8b65:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-48e51f4e5fdmr616425e9.28.1778000329491;
        Tue, 05 May 2026 09:58:49 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.58.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:58:48 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/23] expat: patch CVE-2026-32778
Date: Tue,  5 May 2026 18:57:24 +0200
Message-ID: <ea404c36732a4e3882a74707189b10a4a196df07.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236498

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

Pick patches from [1] also mentioned in [2].

[1] https://github.com/libexpat/libexpat/pull/1163
[2] https://security-tracker.debian.org/tracker/CVE-2026-32778

Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../expat/expat/CVE-2026-32778-01.patch       | 91 +++++++++++++++++++
 .../expat/expat/CVE-2026-32778-02.patch       | 61 +++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
 3 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778-02.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-32778-01.patch b/meta/recipes-core/expat/expat/CVE-2026-32778-01.patch
new file mode 100644
index 0000000000..0105fe7417
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32778-01.patch
@@ -0,0 +1,91 @@
+From b878628b560a2ba1e11b3a12ff8df0dab7d6b8bb Mon Sep 17 00:00:00 2001
+From: laserbear <10689391+Laserbear@users.noreply.github.com>
+Date: Sun, 8 Mar 2026 17:28:06 -0700
+Subject: [PATCH 1/2] copy prefix name to pool before lookup
+
+.. so that we cannot end up with a zombie PREFIX in the pool
+that has NULL for a name.
+
+CVE: CVE-2026-32778
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/576b61e42feeea704253cb7c7bedb2eeb3754387]
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+(cherry picked from commit 576b61e42feeea704253cb7c7bedb2eeb3754387)
+Signed-off-by: Hugo SIMELIERE <simeliere.hugo@non.se.com>
+---
+ lib/xmlparse.c | 43 +++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 35 insertions(+), 8 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index bfb8ac58..9bc67f38 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -590,6 +590,8 @@ static XML_Char *poolStoreString(STRING_POOL *pool, const ENCODING *enc,
+ static XML_Bool FASTCALL poolGrow(STRING_POOL *pool);
+ static const XML_Char *FASTCALL poolCopyString(STRING_POOL *pool,
+                                                const XML_Char *s);
++static const XML_Char *FASTCALL poolCopyStringNoFinish(STRING_POOL *pool,
++                                                       const XML_Char *s);
+ static const XML_Char *poolCopyStringN(STRING_POOL *pool, const XML_Char *s,
+                                        int n);
+ static const XML_Char *FASTCALL poolAppendString(STRING_POOL *pool,
+@@ -7443,16 +7445,24 @@ setContext(XML_Parser parser, const XML_Char *context) {
+       else {
+         if (! poolAppendChar(&parser->m_tempPool, XML_T('\0')))
+           return XML_FALSE;
+-        prefix
+-            = (PREFIX *)lookup(parser, &dtd->prefixes,
+-                               poolStart(&parser->m_tempPool), sizeof(PREFIX));
+-        if (! prefix)
++        const XML_Char *const prefixName = poolCopyStringNoFinish(
++            &dtd->pool, poolStart(&parser->m_tempPool));
++        if (! prefixName) {
+           return XML_FALSE;
+-        if (prefix->name == poolStart(&parser->m_tempPool)) {
+-          prefix->name = poolCopyString(&dtd->pool, prefix->name);
+-          if (! prefix->name)
+-            return XML_FALSE;
+         }
++
++        prefix = (PREFIX *)lookup(parser, &dtd->prefixes, prefixName,
++                                  sizeof(PREFIX));
++
++        const bool prefixNameUsed = prefix && prefix->name == prefixName;
++        if (prefixNameUsed)
++          poolFinish(&dtd->pool);
++        else
++          poolDiscard(&dtd->pool);
++
++        if (! prefix)
++          return XML_FALSE;
++
+         poolDiscard(&parser->m_tempPool);
+       }
+       for (context = s + 1; *context != CONTEXT_SEP && *context != XML_T('\0');
+@@ -8041,6 +8051,23 @@ poolCopyString(STRING_POOL *pool, const XML_Char *s) {
+   return s;
+ }
+ 
++// A version of `poolCopyString` that does not call `poolFinish`
++// and reverts any partial advancement upon failure.
++static const XML_Char *FASTCALL
++poolCopyStringNoFinish(STRING_POOL *pool, const XML_Char *s) {
++  const XML_Char *const original = s;
++  do {
++    if (! poolAppendChar(pool, *s)) {
++      // Revert any previously successful advancement
++      const ptrdiff_t advancedBy = s - original;
++      if (advancedBy > 0)
++        pool->ptr -= advancedBy;
++      return NULL;
++    }
++  } while (*s++);
++  return pool->start;
++}
++
+ static const XML_Char *
+ poolCopyStringN(STRING_POOL *pool, const XML_Char *s, int n) {
+   if (! pool->ptr && ! poolGrow(pool)) {
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-32778-02.patch b/meta/recipes-core/expat/expat/CVE-2026-32778-02.patch
new file mode 100644
index 0000000000..2cfda33dc8
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32778-02.patch
@@ -0,0 +1,61 @@
+From c26728576de3850258c7762c036dd0eb7783ea15 Mon Sep 17 00:00:00 2001
+From: laserbear <10689391+Laserbear@users.noreply.github.com>
+Date: Sun, 8 Mar 2026 17:28:06 -0700
+Subject: [PATCH 2/2] test that we do not end up with a zombie PREFIX in the
+ pool
+
+CVE: CVE-2026-32778
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/d5fa769b7a7290a7e2c4a0b2287106dec9b3c030]
+
+(cherry picked from commit d5fa769b7a7290a7e2c4a0b2287106dec9b3c030)
+Signed-off-by: Hugo SIMELIERE <simeliere.hugo@non.se.com>
+---
+ tests/nsalloc_tests.c | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/tests/nsalloc_tests.c b/tests/nsalloc_tests.c
+index a8f5718d..d284a58a 100644
+--- a/tests/nsalloc_tests.c
++++ b/tests/nsalloc_tests.c
+@@ -1505,6 +1505,32 @@ START_TEST(test_nsalloc_prefixed_element) {
+ }
+ END_TEST
+ 
++/* Verify that retry after OOM in setContext() does not crash.
++ */
++START_TEST(test_nsalloc_setContext_zombie) {
++  const char *text = "<doc>Hello</doc>";
++  unsigned int i;
++  const unsigned int max_alloc_count = 30;
++
++  for (i = 0; i < max_alloc_count; i++) {
++    g_allocation_count = (int)i;
++    if (XML_Parse(g_parser, text, (int)strlen(text), XML_TRUE)
++        != XML_STATUS_ERROR)
++      break;
++    /* Retry on the same parser — must not crash */
++    g_allocation_count = ALLOC_ALWAYS_SUCCEED;
++    XML_Parse(g_parser, text, (int)strlen(text), XML_TRUE);
++
++    nsalloc_teardown();
++    nsalloc_setup();
++  }
++  if (i == 0)
++    fail("Parsing worked despite failing allocations");
++  else if (i == max_alloc_count)
++    fail("Parsing failed even at maximum allocation count");
++}
++END_TEST
++
+ void
+ make_nsalloc_test_case(Suite *s) {
+   TCase *tc_nsalloc = tcase_create("namespace allocation tests");
+@@ -1539,4 +1565,5 @@ make_nsalloc_test_case(Suite *s) {
+   tcase_add_test__if_xml_ge(tc_nsalloc, test_nsalloc_long_default_in_ext);
+   tcase_add_test(tc_nsalloc, test_nsalloc_long_systemid_in_ext);
+   tcase_add_test(tc_nsalloc, test_nsalloc_prefixed_element);
++  tcase_add_test(tc_nsalloc, test_nsalloc_setContext_zombie);
+ }
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index f78d9a8a60..151720a9e3 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -49,6 +49,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-32776.patch \
            file://CVE-2026-32777-01.patch \
            file://CVE-2026-32777-02.patch \
+           file://CVE-2026-32778-01.patch \
+           file://CVE-2026-32778-02.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

