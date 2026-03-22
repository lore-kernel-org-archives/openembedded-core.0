Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AD5FC72B2
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:07:01 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28059.1774174011957424109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:06:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Sz3bmiWn;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4626; q=dns/txt;
  s=iport01; t=1774174012; x=1775383612;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X0Q1H90G5OlABFLTn9LPrqUG839cqjJahgzoRuRujvs=;
  b=Sz3bmiWniTh0tdSO28h3O0JVqOvW3KfuBkg5Blz5d7JnJRxpAlKYdER+
   Su5Qgn9Y00RQBkeDVaFxUp2x4CUtpb1+45CjBKl0a8C9Z0PBOmknuIVno
   1FmsnG507fah098fBhYH1hkbc9GMXl6y4uHxenZtD27uDf7psmdxbwAPT
   YpJzQqiizz3pTEuNK4eqReIqZ1MglyINfew0Mvi5m8l8mFM0GMNYuM1Sb
   vye2UwzxI2LTWf8d7WR7n3OlirJRqPG4R15GEdORuzfaG3bEbfVzGaZzl
   KdZc8E67Zcg+b9Qr59PQO1KAG6DtgLEKp7vdBcIrMaAS0KGa5snIcYh6h
   g==;
X-CSE-ConnectionGUID: dR/dBc8pT0ygQD+eNgYGgg==
X-CSE-MsgGUID: K01TlEeDROOddlulPwDDXw==
X-IPAS-Result: =?us-ascii?q?A0DKCQDtvb9p/5T/Ja1aHgEBCxIMggULgkgPcV9CSQOUJ?=
 =?us-ascii?q?4Ihnh2Bfw8BAQEPRA0EAQGEQY1rAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaATgBGAFZAwECWiMhgwIBgnMCARGwXho3g?=
 =?us-ascii?q?iyBAYMoAT8CQ0/bJgELFAGBOIU8iBtbGAGEeicbG4FygRWDaIEFgVwCgSeGf?=
 =?us-ascii?q?QSCIoEOgWEekFRIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWDB?=
 =?us-ascii?q?g+IbXRtgROEJQMLGA1IESw3FBsEPm4HjR87gjSBDgErgWhEIpMTkj+hDgoog?=
 =?us-ascii?q?3SMHpU6GjOqawuYe44JllCEaIFqAjiBWXAVgm4BMwlJGQ+OKgMLC4NehRPCQ?=
 =?us-ascii?q?iM1AgkDMAEHAgcOAoFzkACBfQEB?=
IronPort-Data: A9a23:GSY1t6uA7QwoR7Fxlg1+mrIOB+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKW+COf+MNmPwLtxwad7ioUsE6sXWz981SVRtpS8yHy4XgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs/nZ8ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw9twwDUtFp
 eQkcCECVzzAisS58Z20Rbw57igjBJGD0II3oHpsy3TdSP0hW52GGvyM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtHYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoLbG5sNwxjE9
 woq+UzaWkgmMPGS5QCi1X6ggvLLpTzXdLINQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:VesMrqH2BO4YAEb0pLqE/ceALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhfo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL2LKeDZslnd8+qUzJ856Z
 td
X-Talos-CUID: =?us-ascii?q?9a23=3AotJw12mHjTEyyd4AdK9Y8g9ez9HXOXHni3v6KB+?=
 =?us-ascii?q?gNT54R4S5ClK295JLnMU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ACj9cqg/qWmyCj7ofar/HCamQf+QwupiqJU0hq7I?=
 =?us-ascii?q?ht8WAKChIJBuxvCviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,135,1770595200"; 
   d="scan'208";a="696605649"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Mar 2026 10:06:51 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id DD05318000252
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 10:06:50 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 81C53CC12B5; Sun, 22 Mar 2026 03:06:50 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH 1/3] expat: Fix CVE-2026-32776
Date: Sun, 22 Mar 2026 03:06:37 -0700
Message-Id: <20260322100637.665990-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 10:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233669

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] as mentioned in [2].

[1] https://github.com/libexpat/libexpat/commit/5be25657583ea91b09025c858b4785834c20f59c
[2] https://security-tracker.debian.org/tracker/CVE-2026-32776

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-core/expat/expat/CVE-2026-32776.patch b/meta/recipes-core/expat/expat/CVE-2026-32776.patch
new file mode 100644
index 0000000000..357c41a763
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32776.patch
@@ -0,0 +1,90 @@
+From dfc050e8c22c40a709a824573efd8691194c1469 Mon Sep 17 00:00:00 2001
+From: Francesco Bertolaccini <francesco.bertolaccini@trailofbits.com>
+Date: Tue, 3 Mar 2026 16:41:43 +0100
+Subject: [PATCH] Fix NULL function-pointer dereference for empty external
+ parameter entities
+
+When an external parameter entity with empty text is referenced inside
+an entity declaration value, the sub-parser created to handle it receives
+0 bytes of input.  Processing enters entityValueInitProcessor which calls
+storeEntityValue() with the parser's encoding; since no bytes were ever
+processed, encoding detection has not yet occurred and the encoding is
+still the initial probing encoding set up by XmlInitEncoding().  That
+encoding only populates scanners[] (for prolog and content), not
+literalScanners[].  XmlEntityValueTok() calls through
+literalScanners[XML_ENTITY_VALUE_LITERAL] which is NULL, causing a
+SEGV.
+
+Skip the tokenization loop entirely when entityTextPtr >= entityTextEnd,
+and initialize the `next` pointer before the early exit so that callers
+(callStoreEntityValue) receive a valid value through nextPtr.
+
+CVE: CVE-2026-32776
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5be25657583ea91b09025c858b4785834c20f59c]
+
+(cherry picked from commit 5be25657583ea91b09025c858b4785834c20f59c)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/xmlparse.c      |  9 ++++++++-
+ tests/basic_tests.c | 19 +++++++++++++++++++
+ 2 files changed, 27 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index a187a3a1..10297c9a 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -6780,7 +6780,14 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+       return XML_ERROR_NO_MEMORY;
+   }
+
+-  const char *next;
++  const char *next = entityTextPtr;
++
++  /* Nothing to tokenize. */
++  if (entityTextPtr >= entityTextEnd) {
++    result = XML_ERROR_NONE;
++    goto endEntityValue;
++  }
++
+   for (;;) {
+     next
+         = entityTextPtr; /* XmlEntityValueTok doesn't always set the last arg */
+diff --git a/tests/basic_tests.c b/tests/basic_tests.c
+index 0231e094..8be3492d 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -6213,6 +6213,24 @@ START_TEST(test_varying_buffer_fills) {
+ }
+ END_TEST
+
++START_TEST(test_empty_ext_param_entity_in_value) {
++  const char *text = "<!DOCTYPE r SYSTEM \"ext.dtd\"><r/>";
++  ExtOption options[] = {
++      {XCS("ext.dtd"), "<!ENTITY % pe SYSTEM \"empty\">"
++                       "<!ENTITY ge \"%pe;\">"},
++      {XCS("empty"), ""},
++      {NULL, NULL},
++  };
++
++  XML_SetParamEntityParsing(g_parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
++  XML_SetExternalEntityRefHandler(g_parser, external_entity_optioner);
++  XML_SetUserData(g_parser, options);
++  if (_XML_Parse_SINGLE_BYTES(g_parser, text, (int)strlen(text), XML_TRUE)
++      == XML_STATUS_ERROR)
++    xml_failure(g_parser);
++}
++END_TEST
++
+ void
+ make_basic_test_case(Suite *s) {
+   TCase *tc_basic = tcase_create("basic tests");
+@@ -6458,6 +6476,7 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_empty_element_abort);
+   tcase_add_test__ifdef_xml_dtd(tc_basic,
+                                 test_pool_integrity_with_unfinished_attr);
++  tcase_add_test__ifdef_xml_dtd(tc_basic, test_empty_ext_param_entity_in_value);
+   tcase_add_test__if_xml_ge(tc_basic, test_entity_ref_no_elements);
+   tcase_add_test__if_xml_ge(tc_basic, test_deep_nested_entity);
+   tcase_add_test__if_xml_ge(tc_basic, test_deep_nested_attribute_entity);
+--
+2.51.0
diff --git a/meta/recipes-core/expat/expat_2.7.4.bb b/meta/recipes-core/expat/expat_2.7.4.bb
index 95a1ed52c4..a1cbf77ae1 100644
--- a/meta/recipes-core/expat/expat_2.7.4.bb
+++ b/meta/recipes-core/expat/expat_2.7.4.bb
@@ -10,6 +10,7 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://CVE-2026-32776.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


