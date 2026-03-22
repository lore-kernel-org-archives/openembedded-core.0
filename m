Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF129FC72B4
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:07:30 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28070.1774174042461099107
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XxrJ79Bq;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6917; q=dns/txt;
  s=iport01; t=1774174042; x=1775383642;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T23Ogaw6u0OvFQQIN02F/Ws7gYukowXj1mgxicg6GQc=;
  b=XxrJ79Bq0eTYnBIgb3vaExyhlJKp9bCi+IrL4SqGdYiHQ5LLhuI67ELR
   XflMIahPcKlqiAAKJ3McG3RnvPOmQdMzRQB5PYZ6f2L+1UXsGoOsZ1NW0
   RMblGm+lMcMfHGaqD9A3fWR8ni751xOE4yyuqsWpbmzXprGF7RakU6TDY
   jY20X2bFwjNFYvNGbT0HtwOTcy7zcarziMjqs72FR5TSZvWXZO67RKEf4
   lQTHVM+lShuLsOSUserEx7gkYVKBM3ObdLh9ppQE4u+OiaL94bI+pEJAL
   WwuttdGiY6VG2u0Tn0k8jkuTx2+EZ6pSfArHOS0bP2OOaLIS3eHO1tKma
   A==;
X-CSE-ConnectionGUID: 1T5sYoUbQ+uY7SMQ6GTKyw==
X-CSE-MsgGUID: AhNX2dkdQfWkCuTu9VOezQ==
X-IPAS-Result: =?us-ascii?q?A0CNAADtvb9p/4r/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?kcPcV9CSQOEVIgchzeCIZ4dgX8PAQEBD0QNBAEBhEFGjSUCJjQJDgECBAEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBKQQLARgBWQMBA?=
 =?us-ascii?q?gMCJgItIyGDAgGCcwIBEbBeGjd6fzOBAYMoAT8CQ0/bJgELFAGBCi4BhTuCf?=
 =?us-ascii?q?RwBc4QOWxgBhHonGxuBcoEUAYNogQWBXAKCBoM1gmkEgiKBDoFhHpBUSIECH?=
 =?us-ascii?q?ANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPhc0WBsHBYMGD4htdG2BE4QlAwsYD?=
 =?us-ascii?q?UgRLDcUGwQ9AW4HjR87gjQxUwosfxmBFB4cknSQJYIhgTWfWQoog3SMHpU6G?=
 =?us-ascii?q?jOqawuYe44JlWBwhGiBaDyBWXAVgm4BMwlJGQ+OLQsLg16FE8JCIzUCCQMwA?=
 =?us-ascii?q?QcCBw4CgXORfQEB?=
IronPort-Data: A9a23:PCJn4qDgijqFxRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApD4kg2AEn
 2YbCzrQP/jcYGf8eI8ibt7g9EtSvpWDnYMyOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jWGthh
 fuo+5eBYAT/gWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEmskzF3AxAIchuftGXlprz
 KI3FBMccUXW7w626OrTpuhEnM8vKozveYgYoHwllWifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE/BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FIgjua1bYqLIbRmQ+18nmCo/
 G7F8133PRIxKeCCmASi/2CV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KNpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:jQ6RIq9gsNSA/whmHotuk+DTI+orL9Y04lQ7vn2ZLiYlF/Bw9v
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJ8U7ndQtsp
 uJtMNFebnNMWQ=
X-Talos-CUID: 9a23:HMQgdG6e9cxfsDudCNssrXJJAfEiT3fkj2rhfHSdMDhGdJ6EVgrF
X-Talos-MUID: 9a23:7Pd3SwVGyZwO3e7q/BbsogE4OMRk2qqRC2sQrYhXhe6JJxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,135,1770595200"; 
   d="scan'208";a="696605863"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Mar 2026 10:07:21 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 8035E180002B1
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 10:07:21 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 2FE5BCC12B5; Sun, 22 Mar 2026 03:07:21 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH 3/3] expat: Fix CVE-2026-32778
Date: Sun, 22 Mar 2026 03:07:14 -0700
Message-Id: <20260322100714.667175-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 10:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233671

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] and [2] as mentioned in [3].

[1] https://github.com/libexpat/libexpat/commit/576b61e42feeea704253cb7c7bedb2eeb3754387
[2] https://github.com/libexpat/libexpat/commit/d5fa769b7a7290a7e2c4a0b2287106dec9b3c030
[3] https://security-tracker.debian.org/tracker/CVE-2026-32778

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-core/expat/expat/CVE-2026-32778_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-32778_p1.patch
new file mode 100644
index 0000000000..35a7c62865
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
index 0000000000..0cbf2dd347
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
index da6e4bb657..f1eff49688 100644
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
-- 
2.35.6


