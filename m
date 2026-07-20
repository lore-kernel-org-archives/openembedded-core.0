Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B05BC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 12:20:39 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7645.1784550030698636359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 05:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lF5NDQuo;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=17083; q=dns/txt;
  s=iport01; t=1784550030; x=1785759630;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=v5srVOOoiTAWNtk9wpsvPilcPsrWPBtm527Zdl7e2sY=;
  b=lF5NDQuo1IBf1gPU4wGzOrdegXuHn7vSS1arGxPOM/5oyE22oNstLhfn
   WCHFAPBt05DKpBGwo2lfVhRTu3WrggtiNpo25fAMRAggE7TLlqW6txPje
   X35oF7zO7m9lp6OP/IqUfFNcrLFw2kTT2JzokO7kLArd9d0xr3bdLddzk
   CgSlzQp94KBRe8JCEfBqgFmFg1vmIMiaGSYgzASyVG+kvpZyQ0w6YRb97
   eJlj0+48JJTx1i9zTfjQuGD/I1ps5CgxQ/kd0PvPvfa2uo1oYGo/pJo0w
   WMf0++ZWLsf1Jx+Gxaj0UCfdjimdglZaJpHBBsCDzIH6/2ScdVjGs2tfB
   A==;
X-CSE-ConnectionGUID: uTaKpGFxRK+0e8aTiA6gsA==
X-CSE-MsgGUID: Epw3vRDkQFaI5Xy/i3NUyA==
X-IPAS-Result: =?us-ascii?q?A0BNAgCWEV5q/5P/Ja1aHgEBCxIMggULgld0X0IrHoRXg?=
 =?us-ascii?q?XCNYoIhA4tkkjeBfg8BAQEPRA0EAQGEP0YCjVMCJjQJDgECBAMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECAQMjBAsBGAEbIhwDAQIDAiYCA?=
 =?us-ascii?q?iALIwgQAQiDAgGCOgM3AwgJvEMaN3p/M4EBgygBPwJDUNhJDYJYAQsUAYEKL?=
 =?us-ascii?q?oU/gn0gAYUCXBgBhHwnGxuBcoEVg2mBBYEaQgEBhTuCagSCDRWBDIFaHoNeg?=
 =?us-ascii?q?0mIR0iBAhwDWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XNFgbBwWBHYE6gQKEd?=
 =?us-ascii?q?CMfAzl/gS91SnctahIXgSaCEgKBOwIHAwsYDUgRLDcUGQQ9AW4HjTwjgh8OC?=
 =?us-ascii?q?wYBAX4PAQcDCRcBgUM6AT0/kmcKkjSgIXEKKIN1jCGPPoV8GjOFW6URC5h9j?=
 =?us-ascii?q?gqECYNTjgwxN4RpgWg8gSgfCwdwFYJuATMJShkPjjiDa4F/gxTDMjw1AgkyA?=
 =?us-ascii?q?QEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:Ebzspqx+NKsSQ05yjLh6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUBm
 2YZXz/VOfjbYTT2c4slOd+y9x8A6sLWydBqHQRl+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraDpMtspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJFwKNK4A1chnO0INr
 fFIIQwMR06MnMvjldpXSsE07igiBNPgMIVavjRryivUSK9+B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cPHWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwaYOEI4LVHJk9ckCwi
 3rZpHrDLhIjGtW+lAqUtXP3oNLetHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPAXi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:l1uF7aiYXW2JPW0uZhYSJroo3XBQXvgji2hC6mlwRA09TyX+rb
 HIoB17726RtN9/Yh8dcLy7VZVoBEmslqKdgrNhWItKIjOGhILAFugLhuHfKn/bak/DH4Vmup
 uIHZITNDSJNzhHpPe/xhWkGNA9x9TC2qWpieDCi0pJd2hRGsddB8MTMHfiLqWwLzM2fKYEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3ArFI4DmoEJm9s8gKUXIF3HNnmUd0Ze17F41nAGWz?=
 =?us-ascii?q?7UWs5QYGUYAGf44oxxg=3D=3D?=
X-Talos-MUID: 9a23:XVYDkQhCn+TXlkz6s4OPNMMpGd93uLqUJEM0v5wn5vmVci0rHQqMpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="511916714"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 12:20:29 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 28998180008B5
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:29 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 3E713CBEFAA; Mon, 20 Jul 2026 17:50:27 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH v2 10/10] expat: fix CVE-2026-56132
Date: Mon, 20 Jul 2026 17:46:15 +0530
Message-Id: <20260720121615.2520859-11-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720121615.2520859-1-deeratho@cisco.com>
References: <20260710130809.2817559-1-deeratho@cisco.com>
 <20260720121615.2520859-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 12:20:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241387

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
- Changes from v1 to v2: Refresh the patch on top of
latest wrynose branch merged commits.
 .../expat/expat/CVE-2026-56132_p1.patch       | 90 +++++++++++++++++++
 .../expat/expat/CVE-2026-56132_p2.patch       | 63 +++++++++++++
 .../expat/expat/CVE-2026-56132_p3.patch       | 77 ++++++++++++++++
 .../expat/expat/CVE-2026-56132_p4.patch       | 63 +++++++++++++
 .../expat/expat/CVE-2026-56132_p5.patch       | 58 ++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  5 ++
 6 files changed, 356 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
new file mode 100644
index 0000000000..a413bf0acd
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
@@ -0,0 +1,90 @@
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
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
new file mode 100644
index 0000000000..6fb8f6078b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
@@ -0,0 +1,63 @@
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
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch b/meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
new file mode 100644
index 0000000000..5405224ec3
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
@@ -0,0 +1,77 @@
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
+
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
index 9f519b482e..890ee5b7d3 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -31,6 +31,11 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
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


