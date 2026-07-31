Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F70C55171
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:57:13 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.708.1785477425151479112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aER7e+fr;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16881; q=dns/txt;
  s=iport01; t=1785477429; x=1786687029;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=FYktZjFIanIrJJ0toifTC4PQmh8930vqtTi5ajLGczc=;
  b=aER7e+frxgMpXk0pMZInv4u5YPJ1X8ZhmU6Nc51woF8P6CwNkjzcYRLZ
   itADxnaHpjlwaDwxgaRTwblcRRmSMG1i5ZSmFNmClMkQcbYc2QUEbqFYH
   ooqVbXPl4Gr6QC6TaQUOdMptPY6fi4aJeqIDJpWxRNQd3b8wgIf7obYVK
   EJxVfbzjGBaD+/UL1uZy9mmzHBALsmPabsyHOFyoiu9+witl7g3idnGsv
   08LILVNMIJqeVpAeLdorUmHsP15vSrJ7E47YcbMJrNO03qzt9+whskymm
   ftop8hGa0Xop03s6aNDkYiUObdZA05HdrTp+0ebwGUbYhCI9dLCs1zE+1
   g==;
X-CSE-ConnectionGUID: ttVE7ZtrQQiaGY3RG2kY0g==
X-CSE-MsgGUID: /izqE3HNSJikp2cCKzdZ0g==
X-IPAS-Result: =?us-ascii?q?A0BNAgC2OGxq/4//Ja1aHgEBCxIMggULgld0X0IrHoRXg?=
 =?us-ascii?q?XCNYoIhA4tkkjeBfg8BAQEPRA0EAQGEP0YCjWYCJjQJDgECBAMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMjBAsBGAEbIhwDAQIDAiYCA?=
 =?us-ascii?q?iALIwgQAQiDAgGCOgM3AwgJujQaN3p/M4EBgygBPwJDUNhJDYJYAQsUAYEKL?=
 =?us-ascii?q?oU/gn0gAYUCXBgBhHwnGxuBcoEVg2mBBYEaQgEBhTuCagSCDRWBDIFaHoMTg?=
 =?us-ascii?q?RiCM4lfSIECHANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPhc1WBsHBYEdgSsvh?=
 =?us-ascii?q?FMjGTZ8gS91SnUtahIXgRqDMQKCXwMLGA1IESw3FBkEPQFuB41pIIIfDgsGA?=
 =?us-ascii?q?QE8Qg8BBwMJFwGBQzoBBjc/kmcKkjSgIXEKKIN1jCGPPoV8GjOFW6URC5h9j?=
 =?us-ascii?q?gqECYNTjgwbFjeEaYFoPIEoHwsHcBWCbgEzCUoZD444g2uBf4MUyS88NQIJM?=
 =?us-ascii?q?gEBBwIHDgMLgWiQACyBUgEB?=
IronPort-Data: A9a23:e4IdSq5xLcZFJodLGKw1GAxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 jccDW2Ha/rZZ2Kkfd53OYzjoBgGv57UzN9kHQpq/n8zZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1Ps/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eIZEm17lFHXt3z
 P0RBwFWVD/ZhNPuz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGc6FSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEUUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeMJ4PQHp8PwC50o
 EqB/nbgL0o6Eue9yDmdqHmHpf3Dr3v0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBaCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:HGe8rqigceN0NF9/KPmTKWTFJ3BQXvgji2hC6mlwRA09TyX+rb
 HIoB17726RtN9/Yh8dcLy7VZVoBEmslqKdgrNhWItKIjOGhILAFugLhuHfKn/bak/DH4Vmup
 uIHZITNDSJNzhHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: 9a23:HqTN+WAqc6hFEaP6EzV7ymNLKNw/S0TcxVjheHWXU2VYELLAHA==
X-Talos-MUID: 9a23:CKp1uQUlA+SNCYLq/HjtlihPb+dO2IavC1hXmr4lqcW2bSMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,195,1779148800"; 
   d="scan'208";a="515723226"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 05:57:08 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id DC63A1800024F
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:57:07 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id F27B5CC8C84; Fri, 31 Jul 2026 11:27:05 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 10/10] expat: fix CVE-2026-56132
Date: Fri, 31 Jul 2026 11:26:25 +0530
Message-Id: <20260731055625.4187716-11-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260731055625.4187716-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
 <20260731055625.4187716-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242407

From: Deepak Rathore <deeratho@cisco.com>

These patches apply the upstream fix shown in [2], its prerequisite
[1], the regression test in [3], and the follow-up cleanups in [4] and
[5], as referenced by [6].

[1] https://github.com/libexpat/libexpat/commit/3a4eaf47af8fd7abda38ea2c08308c91152061f3
[2] https://github.com/libexpat/libexpat/commit/58400483d7c97be316d7a77739c0a6af5d55932e
[3] https://github.com/libexpat/libexpat/commit/353919b3b9f2174073a557ac7d517a5f3cd0cbbf
[4] https://github.com/libexpat/libexpat/commit/bca93b4ba9e15fd84425568d772b69baebf790e4
[5] https://github.com/libexpat/libexpat/commit/08baa7ef9d168b99094249998fd78f8d190526e5
[6] https://nvd.nist.gov/vuln/detail/CVE-2026-56132

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
Changes in v2:
- Rebased the recipe SRC_URI context on current Scarthgap after upstream
  added Expat CVE-2026-41080-* and CVE-2026-45186-* patch entries.
- No change to the embedded upstream source patches.

 .../expat/expat/CVE-2026-56132_p1.patch       | 80 +++++++++++++++++++
 .../expat/expat/CVE-2026-56132_p2.patch       | 60 ++++++++++++++
 .../expat/expat/CVE-2026-56132_p3.patch       | 74 +++++++++++++++++
 .../expat/expat/CVE-2026-56132_p4.patch       | 60 ++++++++++++++
 .../expat/expat/CVE-2026-56132_p5.patch       | 56 +++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  5 ++
 6 files changed, 335 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
new file mode 100644
index 0000000000..fc5b577878
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
@@ -0,0 +1,80 @@
+From 9d1c131840a501e6664c5770046153235467f574 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 4 Jun 2026 17:01:02 -0700
+Subject: [PATCH 13/17] lib: Remove reuse of `m_groupSize` to count
+ `m_scaffIndex` allocation
+
+The sizes of the two arrays `m_groupConnector` and `scaffIndex` need to
+vary independently. This change is a step towards allowing this.
+
+Anthropic: ANT-2026-00037
+Anthropic: ANT-2026-03621
+Anthropic: ANT-2026-03867
+Co-authored-by: Alessandro Gario <alessandro.gario@trailofbits.com>
+
+CVE: CVE-2026-56132
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/3a4eaf47af8fd7abda38ea2c08308c91152061f3]
+
+Backport Changes:
+- Adapt scaffIndex sizing to Scarthgap 2.6.4, where m_groupSize is
+  not temporarily doubled before reallocation.
+  Keep the branch's equivalent size_t overflow check.
+
+(cherry picked from commit 3a4eaf47af8fd7abda38ea2c08308c91152061f3)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+ 
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 8439dc0e..e9ad78df 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -423,6 +423,7 @@ typedef struct {
+   unsigned scaffCount;
+   int scaffLevel;
+   int *scaffIndex;
++  size_t scaffIndexSize;
+ } DTD;
+ 
+ enum EntityType {
+@@ -5975,6 +5976,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             if (new_scaff_index == NULL)
+               return XML_ERROR_NO_MEMORY;
+             dtd->scaffIndex = new_scaff_index;
++            dtd->scaffIndexSize = parser->m_groupSize;
+           }
+         } else {
+           parser->m_groupConnector = MALLOC(parser, parser->m_groupSize = 32);
+@@ -7575,6 +7577,7 @@ dtdCreate(XML_Parser parser) {
+ 
+   p->in_eldecl = XML_FALSE;
+   p->scaffIndex = NULL;
++  p->scaffIndexSize = 0;
+   p->scaffold = NULL;
+   p->scaffLevel = 0;
+   p->scaffSize = 0;
+@@ -7615,6 +7618,7 @@ dtdReset(DTD *p, XML_Parser parser) {
+ 
+   FREE(parser, p->scaffIndex);
+   p->scaffIndex = NULL;
++  p->scaffIndexSize = 0;
+   FREE(parser, p->scaffold);
+   p->scaffold = NULL;
+ 
+@@ -7790,6 +7794,7 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+   newDtd->scaffSize = oldDtd->scaffSize;
+   newDtd->scaffLevel = oldDtd->scaffLevel;
+   newDtd->scaffIndex = oldDtd->scaffIndex;
++  newDtd->scaffIndexSize = oldDtd->scaffIndexSize;
+ 
+   return 1;
+ } /* End dtdCopy */
+@@ -8310,6 +8315,7 @@ nextScaffoldPart(XML_Parser parser) {
+     dtd->scaffIndex = MALLOC(parser, parser->m_groupSize * sizeof(int));
+     if (! dtd->scaffIndex)
+       return -1;
++    dtd->scaffIndexSize = parser->m_groupSize;
+     dtd->scaffIndex[0] = 0;
+   }
+ 
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
new file mode 100644
index 0000000000..c8a4971e83
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
@@ -0,0 +1,60 @@
+From a4c1b874dffcc80ee63ca3b4d6a1537c56da8dc1 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 4 Jun 2026 17:01:02 -0700
+Subject: [PATCH 14/17] lib: doProlog: Fix out-of-bound scaffolding index store
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The scaffold backing array is reallocated using the caller parser’s
+per-parser `m_groupSize`, but the DTD struct (which carries
+`scaffIndex`) is shared between a parent parser and any external
+parameter-entity sub-parser created via
+`XML_ExternalEntityParserCreate(parent, NULL, …)`. A sub-parser whose
+group nesting is shallower than the parent’s can `REALLOC` the shared
+`scaffIndex` down to its own size; when the parent resumes and parses a
+deeper element content model, its bounds check passes (its private
+`m_groupSize` is still large enough), the doubling-grow path is skipped,
+and the next write lands past the shrunken buffer.
+
+Anthropic: ANT-2026-00037
+Anthropic: ANT-2026-03621
+Anthropic: ANT-2026-03867
+Co-authored-by: Alessandro Gario <alessandro.gario@trailofbits.com>
+Reported-by: Trail of Bits, in collaboration with Anthropic
+
+CVE: CVE-2026-56132
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/58400483d7c97be316d7a77739c0a6af5d55932e]
+
+(cherry picked from commit 58400483d7c97be316d7a77739c0a6af5d55932e)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index e9ad78df..c46c17bc 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -5992,6 +5992,21 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+         if (myindex < 0)
+           return XML_ERROR_NO_MEMORY;
+         assert(dtd->scaffIndex != NULL);
++        if ((size_t)dtd->scaffLevel >= dtd->scaffIndexSize) {
++          /* Detect and prevent integer overflow */
++          if (dtd->scaffIndexSize > SIZE_MAX / 2 / sizeof(int)) {
++            return XML_ERROR_NO_MEMORY;
++          }
++          assert(dtd->scaffIndexSize > 0);
++          const size_t new_size = dtd->scaffIndexSize * 2;
++          int *const new_scaff_index
++              = REALLOC(parser, dtd->scaffIndex, new_size * sizeof(int));
++          if (new_scaff_index == NULL) {
++            return XML_ERROR_NO_MEMORY;
++          }
++          dtd->scaffIndex = new_scaff_index;
++          dtd->scaffIndexSize = new_size;
++        }
+         dtd->scaffIndex[dtd->scaffLevel] = myindex;
+         dtd->scaffLevel++;
+         dtd->scaffold[myindex].type = XML_CTYPE_SEQ;
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
new file mode 100644
index 0000000000..1376e1d4c0
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
@@ -0,0 +1,74 @@
+From 5d4d0dab46e077b327f70a7c02a307287e8d1fe5 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 4 Jun 2026 17:01:02 -0700
+Subject: [PATCH 15/17] tests: Add a test case for scaffolding array limits in
+ shared DTDs
+
+This test case provokes the bug fixed in the previous commit.
+
+Anthropic: ANT-2026-00037
+Anthropic: ANT-2026-03621
+Anthropic: ANT-2026-03867
+Co-authored-by: Alessandro Gario <alessandro.gario@trailofbits.com>
+Reported-by: Trail of Bits, in collaboration with Anthropic
+
+CVE: CVE-2026-56132
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/353919b3b9f2174073a557ac7d517a5f3cd0cbbf]
+
+(cherry picked from commit 353919b3b9f2174073a557ac7d517a5f3cd0cbbf)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/tests/basic_tests.c | 33 +++++++++++++++++++++++++++++++++
+ 1 file changed, 33 insertions(+)
+
+diff --git a/expat/tests/basic_tests.c b/expat/tests/basic_tests.c
+index 023d9ce4..d52dcf1c 100644
+--- a/expat/tests/basic_tests.c
++++ b/expat/tests/basic_tests.c
+@@ -4044,6 +4044,37 @@ START_TEST(test_skipped_external_entity) {
+ }
+ END_TEST
+ 
++START_TEST(test_scaff_index_shared_across_external_entity_parser) {
++  const char text[]
++      = "<!DOCTYPE doc [\n"
++        "<!ELEMENT a "
++        "((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((b))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))>\n"
++        "<!ENTITY % e SYSTEM 'ext'>\n"
++        "%e;\n"
++        "<!ELEMENT c "
++        "(((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((d)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))>\n"
++        "]>\n"
++        "<doc/>";
++  ExtOption options[]
++      = {{XCS("ext"),
++          "<!ELEMENT x "
++          "((((((((((((((((((((((((((((((((y))))))))))))))))))))))))))))))))>"},
++         {NULL, NULL}};
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  XML_SetParamEntityParsing(parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
++  XML_SetUserData(parser, options);
++  XML_SetExternalEntityRefHandler(parser, external_entity_optioner);
++  XML_SetElementDeclHandler(parser, dummy_element_decl_handler);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      == XML_STATUS_ERROR)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ /* Test a different form of unknown external entity */
+ START_TEST(test_skipped_null_loaded_ext_entity) {
+   const char *text = "<!DOCTYPE doc SYSTEM 'http://example.org/one.ent'>\n"
+@@ -6399,6 +6430,8 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_trailing_cr_in_att_value);
+   tcase_add_test(tc_basic, test_standalone_internal_entity);
+   tcase_add_test(tc_basic, test_skipped_external_entity);
++  tcase_add_test__ifdef_xml_dtd(
++      tc_basic, test_scaff_index_shared_across_external_entity_parser);
+   tcase_add_test(tc_basic, test_skipped_null_loaded_ext_entity);
+   tcase_add_test(tc_basic, test_skipped_unloaded_ext_entity);
+   tcase_add_test__ifdef_xml_dtd(tc_basic, test_param_entity_with_trailing_cr);
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
new file mode 100644
index 0000000000..74d0e33a9d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
@@ -0,0 +1,60 @@
+From a7d7ed5d6dbcc7231529357d64eb19ede3114868 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 4 Jun 2026 17:01:02 -0700
+Subject: [PATCH 16/17] lib: Remove unnecessary `scaffIndex` expansion
+
+Following the previous changes, all locations that append entries to
+`scaffIndex` handle expanding the array if it is not already large
+enough. So this extra expansion code is no longer necessary. In some
+cases such as processing siblings with alternating scaffolding counts,
+this logic would actually _shrink_ the array only to then later
+re-expand it.
+
+Anthropic: ANT-2026-00037
+Anthropic: ANT-2026-03621
+Anthropic: ANT-2026-03867
+Co-authored-by: Alessandro Gario <alessandro.gario@trailofbits.com>
+
+CVE: CVE-2026-56132
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/bca93b4ba9e15fd84425568d772b69baebf790e4]
+
+Backport Changes:
+- Remove the Scarthgap 2.6.4 scaffIndex resize block because later
+  append paths already expand the array when required.
+
+(cherry picked from commit bca93b4ba9e15fd84425568d772b69baebf790e4)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 19 -------------------
+ 1 file changed, 19 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index c46c17bc..3afe2884 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -5959,25 +5959,6 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             }
+             parser->m_groupConnector = new_connector;
+           }
+-
+-          if (dtd->scaffIndex) {
+-            /* Detect and prevent integer overflow.
+-             * The preprocessor guard addresses the "always false" warning
+-             * from -Wtype-limits on platforms where
+-             * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
+-#if UINT_MAX >= SIZE_MAX
+-            if (parser->m_groupSize > (size_t)(-1) / sizeof(int)) {
+-              return XML_ERROR_NO_MEMORY;
+-            }
+-#endif
+-
+-            int *const new_scaff_index = REALLOC(
+-                parser, dtd->scaffIndex, parser->m_groupSize * sizeof(int));
+-            if (new_scaff_index == NULL)
+-              return XML_ERROR_NO_MEMORY;
+-            dtd->scaffIndex = new_scaff_index;
+-            dtd->scaffIndexSize = parser->m_groupSize;
+-          }
+         } else {
+           parser->m_groupConnector = MALLOC(parser, parser->m_groupSize = 32);
+           if (! parser->m_groupConnector) {
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
new file mode 100644
index 0000000000..59229f331c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
@@ -0,0 +1,56 @@
+From 778ba31c47f9930fe339194f4d97081e43893362 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 4 Jun 2026 17:01:02 -0700
+Subject: [PATCH 17/17] lib: Remove indented scoping of `new_connector` local
+
+Following the previous change, the lifetime of `new_connector` as
+constrained by this introduced scope was identical to the parent scope.
+
+CVE: CVE-2026-56132
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/08baa7ef9d168b99094249998fd78f8d190526e5]
+
+Backport Changes:
+- Retain the Scarthgap 2.6.4 unsigned integer overflow guard while
+  removing only the redundant new_connector scope.
+
+(cherry picked from commit 08baa7ef9d168b99094249998fd78f8d190526e5)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 22 ++++++++++------------
+ 1 file changed, 10 insertions(+), 12 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 3afe2884..df8331d5 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -5945,20 +5945,18 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+     case XML_ROLE_GROUP_OPEN:
+       if (parser->m_prologState.level >= parser->m_groupSize) {
+         if (parser->m_groupSize) {
+-          {
+-            /* Detect and prevent integer overflow */
+-            if (parser->m_groupSize > (unsigned int)(-1) / 2u) {
+-              return XML_ERROR_NO_MEMORY;
+-            }
++          /* Detect and prevent integer overflow */
++          if (parser->m_groupSize > (unsigned int)(-1) / 2u) {
++            return XML_ERROR_NO_MEMORY;
++          }
+ 
+-            char *const new_connector = REALLOC(
+-                parser, parser->m_groupConnector, parser->m_groupSize *= 2);
+-            if (new_connector == NULL) {
+-              parser->m_groupSize /= 2;
+-              return XML_ERROR_NO_MEMORY;
+-            }
+-            parser->m_groupConnector = new_connector;
++          char *const new_connector = REALLOC(parser, parser->m_groupConnector,
++                                              parser->m_groupSize *= 2);
++          if (new_connector == NULL) {
++            parser->m_groupSize /= 2;
++            return XML_ERROR_NO_MEMORY;
+           }
++          parser->m_groupConnector = new_connector;
+         } else {
+           parser->m_groupConnector = MALLOC(parser, parser->m_groupSize = 32);
+           if (! parser->m_groupConnector) {
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 2851c75297..3387a7d7c1 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -73,6 +73,11 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56409.patch;striplevel=2 \
            file://CVE-2026-56411.patch;striplevel=2 \
            file://CVE-2026-56407.patch;striplevel=2 \
+           file://CVE-2026-56132_p1.patch;striplevel=2 \
+           file://CVE-2026-56132_p2.patch;striplevel=2 \
+           file://CVE-2026-56132_p3.patch;striplevel=2 \
+           file://CVE-2026-56132_p4.patch;striplevel=2 \
+           file://CVE-2026-56132_p5.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.35.6


