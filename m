Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEB2C531CC
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:10 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5525.1784741045151581695
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BBp85EAW;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-495590dde14so38694385e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741043; x=1785345843; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxBTUh2KhkrjCmjWkcXYejhJpV30+ctBQaKzx44hKT0=;
        b=BBp85EAWeB8Px/qmkBA3S30vXJEN6MHtHnZCh498FgLJG+f4NHa1Zooc2UgFBvzgSv
         v7ALgQ4+aeRcSv9tVg8ExdlBSAM6persV8Qpb/rYFlcv2Yq5W/zEUeEQfoJqf4b+2lG/
         ZeBxzLzURdHPG1SirIv22FOJqopUKwPKtONdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741043; x=1785345843;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxBTUh2KhkrjCmjWkcXYejhJpV30+ctBQaKzx44hKT0=;
        b=cG25Tc9omt0CxWb1LS/2MMfdUKzMsy5dBt0Ia5zlSrpGEl6kjzj5ZKWzkz+XniyL9/
         3Re14WnggSwAgyEMzMdxqcaLlZLVIL1e1Zl34fvEnUcWAHzrrFHFyCYxe4yjCn9816KX
         e0jd5vT3cFqMJTFL3ClwNdWoxSOt2I4T+6jNDtp7/LIuNGB/WKyEoZAbgPxCbw6rc1+K
         9IUqUDz/u6YX7laCm/aZWtRM+X5EvSpsDAIhPYeYZxiwxaBEFsxhlbhhKsVa/+c2cN2m
         cRS3zvTzSWdwq/Za9a9QvAjlp33+DTaHRBcZX2Q3Jui4Pa+PMUErc9Z72BBHlIllqPCT
         EsTg==
X-Gm-Message-State: AOJu0YzGq+jwx8xgXW6GmIYxK2BWJEytH8NOfJJkSJjshsFg+iAiGU+o
	z8oG7l8kJc1ht2OP7n0hZSjEg/JxItLVobINlcPqHlLkH88qKo9QXdZBRz1CX2pjXTKoIXL/ftY
	EwtMj14Q=
X-Gm-Gg: AR+sD13dyitSxYK4qEfvGOlLa/utCghmGLOcRBudXIuRlK9xkBdPWDGJe4MwjCbwwP5
	dWsE9qUdBkLDYq3CcghWNtZJIvvwd2KSKN/p3+fb8Y3wSZJ/lTQnl93oMagvcgGrCLaYQ3jifsD
	qfQJRFaGD3IKDoQ9ujXv1n0rGD0qKKXEErkIX78q0nV70m+un2VqK4txao6U/XXPfMSKovRywta
	V3In5Nayh7fh1N4Y16rrQTDiTRmg07+vIKXs32RaY180ZhpdodV1xTXyzP/92W9SRDW8ZI5koXp
	oNzGBByqSUQRRGfYlFUnTuGiirTc5pc9i8Z4reeT8PkwYyNFVoDOS+uai7FQ5YZ1uIjlSoxL+nH
	+WRiKmp/LL+fHMohZMdbAFjyjX2nJElDFvOXHTwX/N/IFdh/yCimMsFJRX9DA2jBCNZUFpC8f7D
	7GhRhnngNchxzNUT2E2pWkq+QnawDMmi8lBxZ/gXjnLvO/PiOd23smCSz6iFu3eo5R4cfbXb2Wt
	7dZMYmAgw9u
X-Received: by 2002:a05:600c:4f4b:b0:495:7379:17b1 with SMTP id 5b1f17b1804b1-495737919eemr2315135e9.30.1784741043112;
        Wed, 22 Jul 2026 10:24:03 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/27] expat: fix CVE-2026-56132
Date: Wed, 22 Jul 2026 19:23:23 +0200
Message-ID: <2303076e946496149bc6424a5c7b65eb73292db4.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241720

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
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
index 00000000000..a413bf0acd0
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
index 00000000000..6fb8f6078ba
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
index 00000000000..5405224ec38
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
index 00000000000..0cef4df4527
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
index 00000000000..8655298b65f
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
index 9f519b482ec..890ee5b7d34 100644
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

