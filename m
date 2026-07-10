Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22151C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 13:11:30 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12341.1783689085435381743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 06:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=R4U+sasi;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=16203; q=dns/txt;
  s=iport01; t=1783689085; x=1784898685;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=suYy9eq3ozY/R2GPawzt4OM11jD/pJKugm/fnt5zo8E=;
  b=R4U+sasiJnGNDrPEJY+k1Z5HjJZgnFac53NaOVZFs+5FL3CcfEIHvFfI
   5KMcAVHAf7miMk6dVQRDpOo9dFutp/mBL3vT4asLe1UohOt6ViZWkdN3z
   k3A5OB0FKpiDirEJ4K55ZHNU6Jgbv7Gs0jgugZ1hRlqjEJopXtF/nKwqi
   DIGID7gtezY5UaCaGr0CBnvLuYBpyq4Oi+LAB4pZydaU2pgY7hjVSvFuX
   IrVtEm2GwcC5jpdosoBaP+YFY/ljr3IvtFGfFET5f7oLfj6tIgmg5eqjh
   rCwAx15yn3budrp+lUamQPVbBY1qCaC10o0TvBY0AJ1ySpxPaTDwGCFxI
   g==;
X-CSE-ConnectionGUID: OUTkyJGQTAG+gE2O8G4qqg==
X-CSE-MsgGUID: J5nGJ7WkSiCPIqY277IBsA==
X-IPAS-Result: =?us-ascii?q?A0BJAgDT7lBq/47/Ja1aglmCV3RfQisehFeBcI1igiGLZ?=
 =?us-ascii?q?5I3gX4PAQEBD0QNBAEBhD+OFQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaASkECwEYARs+AwECAwImAiILIxgJgwIBgjoDNgIBC?=
 =?us-ascii?q?Am5SBo3en8zgQGDKAE/AkNQ2EkNglgBCxQBgQouhT+CfCABhQJbGAGEfCcbG?=
 =?us-ascii?q?4FygRWDaYEFgRpCAQGFO4JqBIINFYEMgVoeg2+BGII6iDFIgQIcA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+FzRYGwcFgR2BWYEChHkjHwM5f4EwdUp5LXMSH?=
 =?us-ascii?q?gqBUoIWVAMLGA1IESw3FBsEPQFuB40+Fw+CHg4LBgEBfg8IAwkXAYFDOgE9P?=
 =?us-ascii?q?5JnCpI3oB5xCiiDdYwhjz6FfBozhVulEQuYfY4KhAmDU44MMTeEaYFoPIEoH?=
 =?us-ascii?q?wsHcBWCbgEzCUoZD444g2uBf4MUyUckNQIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:iQebM6+3tMRAEDxgS3+3DrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DNKWm2HPf6MNmb1ftl1atjipx4OsMCAzYcxGwdppSlEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsbTpEs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kRALEb68RYOF1n2
 r8XBWoqPj/fnvu5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+HNbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0cn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FbIuEJobQH5sI9qqej
 kCb+UvbXS4ZD9208Rucwyjz2c7lhgquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjVCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:eyWQIa+LRaKeKVxln8duk+DuI+orL9Y04lQ7vn2ZLiYlF/Bw9v
 re/sjzuiWbtN98YhwdcLO7Scq9qBHnlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: 9a23:K1bMO2OEB91L1u5DfxRb9182NfkZW1Kew1qKBB+XVX9wR+jA
X-Talos-MUID: 9a23:7Qz+9At0lu/gI4e1Ts2npmxkG+U33KeVCWs1sIw34ZbbFAZrEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="499422265"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 13:11:24 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 2E0D21800022A
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:11:24 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id D0803CC2EC3; Fri, 10 Jul 2026 06:11:23 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 10/10] expat: fix CVE-2026-56132
Date: Fri, 10 Jul 2026 06:11:11 -0700
Message-ID: <20260710131117.2824700-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 13:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240650

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

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
new file mode 100644
index 0000000000..de4c2ea482
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
@@ -0,0 +1,89 @@
+From 2e5920edcbc77bf29ce8575bd38ed2886408f4af Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 4 Jun 2026 17:01:02 -0700
+Subject: [PATCH] lib: Remove reuse of `m_groupSize` to count `m_scaffIndex`
+ allocation
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
+(cherry picked from commit 3a4eaf47af8fd7abda38ea2c08308c91152061f3)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 8e90fea8..d4864af8 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -424,6 +424,7 @@ typedef struct {
+   unsigned scaffCount;
+   int scaffLevel;
+   int *scaffIndex;
++  size_t scaffIndexSize;
+ } DTD;
+ 
+ enum EntityType {
+@@ -5995,7 +5996,6 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+              * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
+ #if UINT_MAX >= SIZE_MAX
+             if (parser->m_groupSize > SIZE_MAX / sizeof(int)) {
+-              parser->m_groupSize /= 2;
+               return XML_ERROR_NO_MEMORY;
+             }
+ #endif
+@@ -6003,10 +6003,10 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+             int *const new_scaff_index = REALLOC(
+                 parser, dtd->scaffIndex, parser->m_groupSize * sizeof(int));
+             if (new_scaff_index == NULL) {
+-              parser->m_groupSize /= 2;
+               return XML_ERROR_NO_MEMORY;
+             }
+             dtd->scaffIndex = new_scaff_index;
++            dtd->scaffIndexSize = parser->m_groupSize;
+           }
+         } else {
+           parser->m_groupConnector = MALLOC(parser, parser->m_groupSize = 32);
+@@ -7587,6 +7587,7 @@ dtdCreate(XML_Parser parser) {
+ 
+   p->in_eldecl = XML_FALSE;
+   p->scaffIndex = NULL;
++  p->scaffIndexSize = 0;
+   p->scaffold = NULL;
+   p->scaffLevel = 0;
+   p->scaffSize = 0;
+@@ -7627,6 +7628,7 @@ dtdReset(DTD *p, XML_Parser parser) {
+ 
+   FREE(parser, p->scaffIndex);
+   p->scaffIndex = NULL;
++  p->scaffIndexSize = 0;
+   FREE(parser, p->scaffold);
+   p->scaffold = NULL;
+ 
+@@ -7801,6 +7803,7 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+   newDtd->scaffSize = oldDtd->scaffSize;
+   newDtd->scaffLevel = oldDtd->scaffLevel;
+   newDtd->scaffIndex = oldDtd->scaffIndex;
++  newDtd->scaffIndexSize = oldDtd->scaffIndexSize;
+ 
+   return 1;
+ } /* End dtdCopy */
+@@ -8331,6 +8334,7 @@ nextScaffoldPart(XML_Parser parser) {
+     dtd->scaffIndex = MALLOC(parser, parser->m_groupSize * sizeof(int));
+     if (! dtd->scaffIndex)
+       return -1;
++    dtd->scaffIndexSize = parser->m_groupSize;
+     dtd->scaffIndex[0] = 0;
+   }
+ 
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
new file mode 100644
index 0000000000..8d99d35e9b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
@@ -0,0 +1,62 @@
+From 2b6ebe08e4b6b3dd4d0f4f197dac18eecef16e6e Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 4 Jun 2026 17:01:02 -0700
+Subject: [PATCH] lib: doProlog: Fix out-of-bound scaffolding index store
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
+index d4864af8..b528c9bc 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -6022,6 +6022,21 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
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
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
new file mode 100644
index 0000000000..9c690c2a4f
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
@@ -0,0 +1,76 @@
+From 22805ecc87ba8f66b693220442408a6f7c7e741d Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 4 Jun 2026 17:01:02 -0700
+Subject: [PATCH] tests: Add a test case for scaffolding array limits in shared
+ DTDs
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
+index 02d1d5fd..53b920da 100644
+--- a/expat/tests/basic_tests.c
++++ b/expat/tests/basic_tests.c
+@@ -4091,6 +4091,37 @@ START_TEST(test_skipped_external_entity) {
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
+@@ -6448,6 +6479,8 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_trailing_cr_in_att_value);
+   tcase_add_test(tc_basic, test_standalone_internal_entity);
+   tcase_add_test(tc_basic, test_skipped_external_entity);
++  tcase_add_test__ifdef_xml_dtd(
++      tc_basic, test_scaff_index_shared_across_external_entity_parser);
+   tcase_add_test(tc_basic, test_skipped_null_loaded_ext_entity);
+   tcase_add_test(tc_basic, test_skipped_unloaded_ext_entity);
+   tcase_add_test__ifdef_xml_dtd(tc_basic, test_param_entity_with_trailing_cr);
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
new file mode 100644
index 0000000000..0cef4df452
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
@@ -0,0 +1,63 @@
+From 36df125531dab7e0dc640b341d07b4b1f5ede37b Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 4 Jun 2026 17:01:02 -0700
+Subject: [PATCH] lib: Remove unnecessary `scaffIndex` expansion
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
+- Remove the expanded Expat 2.7.5 scaffIndex resize block, including its
+  branch-specific integer overflow guard.
+
+(cherry picked from commit bca93b4ba9e15fd84425568d772b69baebf790e4)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 20 --------------------
+ 1 file changed, 20 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index b528c9bc..e59ad556 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -5988,26 +5988,6 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
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
+-            if (parser->m_groupSize > SIZE_MAX / sizeof(int)) {
+-              return XML_ERROR_NO_MEMORY;
+-            }
+-#endif
+-
+-            int *const new_scaff_index = REALLOC(
+-                parser, dtd->scaffIndex, parser->m_groupSize * sizeof(int));
+-            if (new_scaff_index == NULL) {
+-              return XML_ERROR_NO_MEMORY;
+-            }
+-            dtd->scaffIndex = new_scaff_index;
+-            dtd->scaffIndexSize = parser->m_groupSize;
+-          }
+         } else {
+           parser->m_groupConnector = MALLOC(parser, parser->m_groupSize = 32);
+           if (! parser->m_groupConnector) {
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
new file mode 100644
index 0000000000..8655298b65
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
@@ -0,0 +1,58 @@
+From c6256eca63fe36d4ef26fd59cbcaab7b72e1d6f2 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 4 Jun 2026 17:01:02 -0700
+Subject: [PATCH] lib: Remove indented scoping of `new_connector` local
+
+Following the previous change, the lifetime of `new_connector` as
+constrained by this introduced scope was identical to the parent scope.
+
+CVE: CVE-2026-56132
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/08baa7ef9d168b99094249998fd78f8d190526e5]
+
+Backport Changes:
+- Keep the Expat 2.7.5 unsigned-int overflow guard while removing the
+  redundant new_connector scope.
+
+(cherry picked from commit 08baa7ef9d168b99094249998fd78f8d190526e5)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 22 ++++++++++------------
+ 1 file changed, 10 insertions(+), 12 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index e59ad556..e8d6fc3a 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -5974,20 +5974,18 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
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
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index ef5c415a2d..7036260ea1 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -22,6 +22,11 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
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


