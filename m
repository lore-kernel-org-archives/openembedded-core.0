Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A60CC6B05
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9232.1775107338576553958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ush3AMKC;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so3484555e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107337; x=1775712137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5KSQC9EOOcOX5Zcwlo9YCFnkiwV+APWGbCx0iIoPwU=;
        b=Ush3AMKCSq7ggZ0FPAq9ZYtZgsesMSIKkgHlIzltjKeDaiMf95G/mXIGaIY/t1kBeI
         KXww6r53SShB3m4uHc6wkdjMh7u6vjtZa9LjiwwWmecHen1JTwXalW9JYMeWds9/9jmM
         cVQxDTpr1qcojg0zJ0lE3CizxBoSdMOW8Aq2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107337; x=1775712137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L5KSQC9EOOcOX5Zcwlo9YCFnkiwV+APWGbCx0iIoPwU=;
        b=ktpcWN8mclGmPPEMTPq1zXmGiwubedpuVB9eyDFiqVz1DgoiL0IiGDPfUYcWs6SSPH
         etgUgUYwpNCap62ahJ0l38CTzPa1Va8vt675DUL5DUQb0rRMfuN7aSg12vMnmf0Nde70
         IdAJYTDnHhQC6/iHZS3UgJVJ5Klq+XeNQ6qRlIGXIBuM+KUZ/DaI9HeNNxlxDaHctHDr
         Hfso+kyDduFuBNYsDwml0G0RN1QtgkTu+BlQDL67f7edi00ePWO5j+eCvSybpI1BNYfc
         3WjRhjx53UozyYRiUra4mfwt6lPlSzzazQ8sC9LGr5qt6O+KouDGWy4rPHPIOxzCNIvY
         im9w==
X-Gm-Message-State: AOJu0YzMDksqB79Lsa+p3LjqFQFwUGDlv5+Cn8HAPrECYH8nGTxCOShn
	RevjGHHTdvVdepVo+eImJpaiHZyJRO1I9ZSIPRFW88HnI0KNNpvEWgFdN3URQX/BnFxg7Vg0DKW
	KGKEvz4Q=
X-Gm-Gg: ATEYQzzJjWAbV2NbMf/4C0/3LwdGe91YwSsF4ppZitoSrqoqUfZ2/t/V6NnruheF216
	1f5wYjFOSnocPhsxJ8mrhznu29lGtWXfxloz65zZsBu3bJFZB99fR8EPXiPhJektOtH/TnkKCkk
	6R/5wjUaCZxP570/sOAvPMJt1XpkI5L1QqOScGylnmdTaA8bdBZfNwwUG7CAIa81a4SmxCOeCZ6
	In+M26F3DIv6d+O429N8AZo10tplJLFoLr1KnwQxqyS/K8Q7iMGaCqNwsC/vo0zzTRAmMwVqMyR
	424d96EtZOOk+iXhtnBBYYrAiSCvQWqPkKWZ4nwIlgyG/6OWTvIPzwubfdt1ExywpGBTjCRQKhO
	hxwUtKan0gaMyNIUmll1uTCYzuLg4YBNjMeyyAfXOTUkNuwMggiViQpSmNHMH12EHYLQ3RJ+crt
	eNQTebrltvvxGriwfXQvKEIhf8Ah5lZ7eoYpVqgnQ1InWG6iZRF+BCVzTZzbVd89QoUqzP0uN63
	TaOnq8woTy/+ubG8dRbAlrJIi3skT78Y6ZfHg==
X-Received: by 2002:a05:600c:b99:b0:485:3f1c:d8a4 with SMTP id 5b1f17b1804b1-4888b70fbdemr30414815e9.9.1775107336603;
        Wed, 01 Apr 2026 22:22:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 11/15] expat: Fix CVE-2026-32778
Date: Thu,  2 Apr 2026 07:21:28 +0200
Message-ID: <99a802ea686b2eb05a78dfc31c99dc3ffdaab26e.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775106968.git.yoann.congal@smile.fr>
References: <cover.1775106968.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234483

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] and [2] as mentioned in [3].

[1] https://github.com/libexpat/libexpat/commit/576b61e42feeea704253cb7c7bedb2eeb3754387
[2] https://github.com/libexpat/libexpat/commit/d5fa769b7a7290a7e2c4a0b2287106dec9b3c030
[3] https://security-tracker.debian.org/tracker/CVE-2026-32778

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-32778_p1.patch       | 90 +++++++++++++++++++
 .../expat/expat/CVE-2026-32778_p2.patch       | 59 ++++++++++++
 meta/recipes-core/expat/expat_2.7.4.bb        |  2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-32778_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-32778_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-32778_p1.patch
new file mode 100644
index 00000000000..35a7c628651
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32778_p1.patch
@@ -0,0 +1,90 @@
+From fa84dfe9d7c817315e3d77ae632aeecf6fe2cd84 Mon Sep 17 00:00:00 2001
+From: laserbear <10689391+Laserbear@users.noreply.github.com>
+Date: Sun, 8 Mar 2026 17:28:06 -0700
+Subject: [PATCH] copy prefix name to pool before lookup
+
+.. so that we cannot end up with a zombie PREFIX in the pool
+that has NULL for a name.
+
+CVE: CVE-2026-32778
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/576b61e42feeea704253cb7c7bedb2eeb3754387]
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+(cherry picked from commit 576b61e42feeea704253cb7c7bedb2eeb3754387)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/xmlparse.c | 43 +++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 35 insertions(+), 8 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index c5bd7059..eee283a4 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -591,6 +591,8 @@ static XML_Char *poolStoreString(STRING_POOL *pool, const ENCODING *enc,
+ static XML_Bool FASTCALL poolGrow(STRING_POOL *pool);
+ static const XML_Char *FASTCALL poolCopyString(STRING_POOL *pool,
+                                                const XML_Char *s);
++static const XML_Char *FASTCALL poolCopyStringNoFinish(STRING_POOL *pool,
++                                                       const XML_Char *s);
+ static const XML_Char *poolCopyStringN(STRING_POOL *pool, const XML_Char *s,
+                                        int n);
+ static const XML_Char *FASTCALL poolAppendString(STRING_POOL *pool,
+@@ -7446,16 +7448,24 @@ setContext(XML_Parser parser, const XML_Char *context) {
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
+@@ -8044,6 +8054,23 @@ poolCopyString(STRING_POOL *pool, const XML_Char *s) {
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
+2.51.0
diff --git a/meta/recipes-core/expat/expat/CVE-2026-32778_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-32778_p2.patch
new file mode 100644
index 00000000000..0cbf2dd347c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32778_p2.patch
@@ -0,0 +1,59 @@
+From 0b3d3b977ccaf18684ce951b818c56a7e704fb29 Mon Sep 17 00:00:00 2001
+From: laserbear <10689391+Laserbear@users.noreply.github.com>
+Date: Sun, 8 Mar 2026 17:28:06 -0700
+Subject: [PATCH] test that we do not end up with a zombie PREFIX in the pool
+
+CVE: CVE-2026-32778
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/d5fa769b7a7290a7e2c4a0b2287106dec9b3c030]
+
+(cherry picked from commit d5fa769b7a7290a7e2c4a0b2287106dec9b3c030)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ tests/nsalloc_tests.c | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/tests/nsalloc_tests.c b/tests/nsalloc_tests.c
+index 60fa87f8..9e26d4ee 100644
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
+2.51.0
diff --git a/meta/recipes-core/expat/expat_2.7.4.bb b/meta/recipes-core/expat/expat_2.7.4.bb
index da6e4bb657c..f1eff496881 100644
--- a/meta/recipes-core/expat/expat_2.7.4.bb
+++ b/meta/recipes-core/expat/expat_2.7.4.bb
@@ -13,6 +13,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-32776.patch \
            file://CVE-2026-32777_p1.patch \
            file://CVE-2026-32777_p2.patch \
+           file://CVE-2026-32778_p1.patch \
+           file://CVE-2026-32778_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

