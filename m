Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02858FC72B3
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:07:11 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28065.1774174023967436257
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DOvI+Kg8;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5556; q=dns/txt;
  s=iport01; t=1774174024; x=1775383624;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3XaUFypeF3oXdaWBIp2I9+BRsxHLiMyClGRhh0Ik87k=;
  b=DOvI+Kg89ji52brE8fGE0pg0q12Zn0rb4yBViklAO7ILl5KHacVJayAU
   926RqVnEN4iZYd3imPvM8KSf+MFnXRJdu5EBIJEa40dawE9sqhcKcUv13
   jTkSzxs2a7ygpF/1RBctxBHi8EOuhsa6cD3rCDyCYYo9R2u1atWZuU2hK
   w5KBeoEcGizKJ4mViiR9eGfsyOtwE6wtpBPqrIK2SNtzxd2am/7iSJhAs
   DGLoYI3G56NXi/IoqLjAJ4sRTuaYJunuBuB7PFSVk0Vu6FeHpOubUh4GN
   4V576QAuqDlm6LpMP2xFZdk5q8Bpj8bhpA0V/ck2BIDPinq7UkTKc0RgD
   g==;
X-CSE-ConnectionGUID: Tcx7IrzsThCcM2byinXfLA==
X-CSE-MsgGUID: AI+zPSavQ2KyJ7J5v9J8ZA==
X-IPAS-Result: =?us-ascii?q?A0B7CgA3vr9p/4r/Ja1aHgEBCxIMggULgkgPcV9CSQOUJ?=
 =?us-ascii?q?6A+gX8PAQEBD0QNBAEBhEGNawImNgcOAQIEAQEBAQMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgE4ARgBWQMBAlojIYMCAYJzAgERsGMaN4Isg?=
 =?us-ascii?q?QGDKAE/AkNP2yYBCxQBgTiFPIgbWxgBhHonGxuBcoEVg2iBBYFcAoEnhn0Eg?=
 =?us-ascii?q?iKBDoFhHpBUSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgwYPi?=
 =?us-ascii?q?G10bYEThCUDCxgNSBEsNxQbBD5uB40fO4ItB4EOLIIskzeSPaEOCiiDdIwel?=
 =?us-ascii?q?ToaM6prC5h7jgmWUIRogW8DMoFZcBWCbgEzCUkZD44tCwuDXoUTwkYjNQIJA?=
 =?us-ascii?q?zABBwIHDgKBc5AAgX0BAQ?=
IronPort-Data: A9a23:vj4x0KKMD1/PeH4kFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS02AGy
 DEYC2uPP/7YYGSgctgiPIW3/UlUsMTUnd5nHAAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnW0
 T/Oi5eHYgH9gGQuajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1SB1FpHJcK4dp3Kmprr
 /YJKTY9YDSq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Sojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjumwYIKKIYzSLSlTtm+55
 XD+xG3nO0s5Jf7A62ebo1D8tMaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:IC75UK1XkZHRoYF+twSkqAqjBKckLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vfK/mKIVybygabvp
 0QFpRDNA==
X-Talos-CUID: =?us-ascii?q?9a23=3AM0bNcGvXXtp4093ToNFsmVec6IsZeW2C7W3COHO?=
 =?us-ascii?q?4Im1MEreESFmg9odNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A9K/Qyg8F0zMCwL/hqAa+4+aQf+5JoLaWM0kTqM8?=
 =?us-ascii?q?lquvbF3FuahXNvh3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,135,1770595200"; 
   d="scan'208";a="695807380"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 22 Mar 2026 10:07:03 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id E933518000307
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 10:07:02 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 976B2CC12B5; Sun, 22 Mar 2026 03:07:02 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter][PATCH 2/3] expat: Fix CVE-2026-32777
Date: Sun, 22 Mar 2026 03:06:58 -0700
Message-Id: <20260322100658.666633-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 10:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233670

From: Deepak Rathore <deeratho@cisco.com>

Pick the patch [1] and [2] as mentioned in [3].

[1] https://github.com/libexpat/libexpat/commit/55cda8c7125986e17d7e1825cba413bd94a35d02
[2] https://github.com/libexpat/libexpat/commit/a7805c1a8a48d2ce83ef289cf55bdc8b45de76a8
[3] https://security-tracker.debian.org/tracker/CVE-2026-32777

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-core/expat/expat/CVE-2026-32777_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-32777_p1.patch
new file mode 100644
index 0000000000..4b30b406ed
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32777_p1.patch
@@ -0,0 +1,48 @@
+From db449df6a700b677cedf723d7be578457e0bc9c7 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 1 Mar 2026 20:16:13 +0100
+Subject: [PATCH] lib: Reject XML_TOK_INSTANCE_START infinite loop in
+ entityValueProcessor
+
+.. that OSS-Fuzz/ClusterFuzz uncovered
+
+CVE: CVE-2026-32777
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/55cda8c7125986e17d7e1825cba413bd94a35d02]
+
+(cherry picked from commit 55cda8c7125986e17d7e1825cba413bd94a35d02)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/xmlparse.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 10297c9a..c5bd7059 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5080,7 +5080,7 @@ entityValueInitProcessor(XML_Parser parser, const char *s, const char *end,
+     }
+     /* If we get this token, we have the start of what might be a
+        normal tag, but not a declaration (i.e. it doesn't begin with
+-       "<!").  In a DTD context, that isn't legal.
++       "<!" or "<?").  In a DTD context, that isn't legal.
+     */
+     else if (tok == XML_TOK_INSTANCE_START) {
+       *nextPtr = next;
+@@ -5169,6 +5169,15 @@ entityValueProcessor(XML_Parser parser, const char *s, const char *end,
+       /* found end of entity value - can store it now */
+       return storeEntityValue(parser, enc, s, end, XML_ACCOUNT_DIRECT, NULL);
+     }
++    /* If we get this token, we have the start of what might be a
++       normal tag, but not a declaration (i.e. it doesn't begin with
++       "<!" or "<?").  In a DTD context, that isn't legal.
++    */
++    else if (tok == XML_TOK_INSTANCE_START) {
++      *nextPtr = next;
++      return XML_ERROR_SYNTAX;
++    }
++
+     start = next;
+   }
+ }
+--
+2.51.0
diff --git a/meta/recipes-core/expat/expat/CVE-2026-32777_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-32777_p2.patch
new file mode 100644
index 0000000000..d6ba0fe10a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-32777_p2.patch
@@ -0,0 +1,65 @@
+From 14d31645bd58fceb6b3390b8ae6b0de68948bdc3 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 6 Mar 2026 18:31:34 +0100
+Subject: [PATCH] misc_tests.c: Cover XML_TOK_INSTANCE_START infinite loop
+ case
+
+.. that OSS-Fuzz/ClusterFuzz uncovered
+
+CVE: CVE-2026-32777
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/a7805c1a8a48d2ce83ef289cf55bdc8b45de76a8]
+
+(cherry picked from commit a7805c1a8a48d2ce83ef289cf55bdc8b45de76a8)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ tests/misc_tests.c | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+diff --git a/tests/misc_tests.c b/tests/misc_tests.c
+index 2a805454..bdec886d 100644
+--- a/tests/misc_tests.c
++++ b/tests/misc_tests.c
+@@ -771,6 +771,35 @@ START_TEST(test_misc_async_entity_rejected) {
+ }
+ END_TEST
+
++START_TEST(test_misc_no_infinite_loop_issue_1161) {
++  XML_Parser parser = XML_ParserCreate(NULL);
++
++  const char *text = "<!DOCTYPE d SYSTEM 'secondary.txt'>";
++
++  struct ExtOption options[] = {
++      {XCS("secondary.txt"),
++       "<!ENTITY % p SYSTEM 'tertiary.txt'><!ENTITY g '%p;'>"},
++      {XCS("tertiary.txt"), "<?xml version='1.0'?><a"},
++      {NULL, NULL},
++  };
++
++  XML_SetUserData(parser, options);
++  XML_SetParamEntityParsing(parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
++  XML_SetExternalEntityRefHandler(parser, external_entity_optioner);
++
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++              == XML_STATUS_ERROR);
++
++#if defined(XML_DTD)
++  assert_true(XML_GetErrorCode(parser) == XML_ERROR_EXTERNAL_ENTITY_HANDLING);
++#else
++  assert_true(XML_GetErrorCode(parser) == XML_ERROR_NO_ELEMENTS);
++#endif
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ void
+ make_miscellaneous_test_case(Suite *s) {
+   TCase *tc_misc = tcase_create("miscellaneous tests");
+@@ -801,4 +830,5 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_expected_event_ptr_issue_980);
+   tcase_add_test(tc_misc, test_misc_sync_entity_tolerated);
+   tcase_add_test(tc_misc, test_misc_async_entity_rejected);
++  tcase_add_test(tc_misc, test_misc_no_infinite_loop_issue_1161);
+ }
+--
+2.51.0
diff --git a/meta/recipes-core/expat/expat_2.7.4.bb b/meta/recipes-core/expat/expat_2.7.4.bb
index a1cbf77ae1..da6e4bb657 100644
--- a/meta/recipes-core/expat/expat_2.7.4.bb
+++ b/meta/recipes-core/expat/expat_2.7.4.bb
@@ -11,6 +11,8 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
            file://CVE-2026-32776.patch \
+           file://CVE-2026-32777_p1.patch \
+           file://CVE-2026-32777_p2.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


