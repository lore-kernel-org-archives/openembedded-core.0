Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09D4C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 21:45:14 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.1203.1743111906427779413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 14:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Ze42A/yA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202503272145039214d07be503a27b70-wvkhhi@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202503272145039214d07be503a27b70
        for <openembedded-core@lists.openembedded.org>;
        Thu, 27 Mar 2025 22:45:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=xexL+P/8w0t0b6cpwtQMG69zDwN4EmUvlvVNNTQ+2+A=;
 b=Ze42A/yALvq1NnWatcA8KDWvABohAmGaAIokRmKkhR0Jo1IqYmquedCYXUlO1U3+oOyJEX
 wI1ZqqrRxjOYoEL8U/2RkT+B5mYOgkVsup78NkZ3Ow8vI7iYmuuj7b/ODrRZBP9I9tmGjy25
 Wvw2mkYZ+JEbRpgQijSSbGpHoVtp+74LJgMq75GO6QjL5vcjwEt3R9GcQPgKhOFruddbf6Hu
 dbz15mXn1ZIo6ORobAvdLO4/t4QPz/TkLB+qhOJnVfxmFTkHW4muSaE+LnCk4yxwZom56heu
 +COn6F3OWqLU6onRHLmF1ZpNIfEd31qsEsEjp0+mHX13zX/3UURM/zdw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH v2] expat: patch CVE-2024-8176
Date: Thu, 27 Mar 2025 22:44:09 +0100
Message-Id: <20250327214409.476225-1-peter.marko@siemens.com>
In-Reply-To: <20250317213335.1865158-1-peter.marko@siemens.com>
References: <20250317213335.1865158-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 21:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213791

From: Peter Marko <peter.marko@siemens.com>

Backport https://github.com/libexpat/libexpat/pull/973
Patch created by:
git diff 2fc36833334340ff7ddca374d86daa8744c1dfa3..99529768b4a722f46c69b04b874c1d45b3eb819c

Additional backport (containing changes in tests only) was needed to
apply it cleanly.

Additional backport https://github.com/libexpat/libexpat/pull/989
which has fixed regression of the first fix.
Patch created by:
git diff 91ca72e913af94ed44ef2a80a9dd542be3e5766c..308c31ed647f2c6aebe33ca3a4fa9e1436f461e2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: added patch for regression

 ...ests-Cover-indirect-entity-recursion.patch |  103 ++
 .../expat/expat/CVE-2024-8176-01.patch        | 1477 +++++++++++++++++
 .../expat/expat/CVE-2024-8176-02.patch        |  248 +++
 meta/recipes-core/expat/expat_2.6.4.bb        |    3 +
 4 files changed, 1831 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/0001-tests-Cover-indirect-entity-recursion.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-02.patch

diff --git a/meta/recipes-core/expat/expat/0001-tests-Cover-indirect-entity-recursion.patch b/meta/recipes-core/expat/expat/0001-tests-Cover-indirect-entity-recursion.patch
new file mode 100644
index 0000000000..802d762787
--- /dev/null
+++ b/meta/recipes-core/expat/expat/0001-tests-Cover-indirect-entity-recursion.patch
@@ -0,0 +1,103 @@
+From 3d5fdbb44e80ed789e4f6510542d77d6284fbd0e Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sat, 23 Nov 2024 14:20:21 +0100
+Subject: [PATCH] tests: Cover indirect entity recursion
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/3d5fdbb44e80ed789e4f6510542d77d6284fbd0e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ expat/tests/basic_tests.c | 74 +++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 74 insertions(+)
+
+diff --git a/expat/tests/basic_tests.c b/expat/tests/basic_tests.c
+index d38b8fd1..d2306772 100644
+--- a/expat/tests/basic_tests.c
++++ b/expat/tests/basic_tests.c
+@@ -1202,6 +1202,79 @@ START_TEST(test_wfc_no_recursive_entity_refs) {
+ }
+ END_TEST
+ 
++START_TEST(test_no_indirectly_recursive_entity_refs) {
++  struct TestCase {
++    const char *doc;
++    bool usesParameterEntities;
++  };
++
++  const struct TestCase cases[] = {
++      // general entity + character data
++      {"<!DOCTYPE a [\n"
++       "  <!ENTITY e1 '&e2;'>\n"
++       "  <!ENTITY e2 '&e1;'>\n"
++       "]><a>&e2;</a>\n",
++       false},
++
++      // general entity + attribute value
++      {"<!DOCTYPE a [\n"
++       "  <!ENTITY e1 '&e2;'>\n"
++       "  <!ENTITY e2 '&e1;'>\n"
++       "]><a k1='&e2;' />\n",
++       false},
++
++      // parameter entity
++      {"<!DOCTYPE doc [\n"
++       "  <!ENTITY % p1 '&#37;p2;'>\n"
++       "  <!ENTITY % p2 '&#37;p1;'>\n"
++       "  <!ENTITY % define_g \"<!ENTITY g '&#37;p2;'>\">\n"
++       "  %define_g;\n"
++       "]>\n"
++       "<doc/>\n",
++       true},
++  };
++  for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
++    const char *const doc = cases[i].doc;
++    const bool usesParameterEntities = cases[i].usesParameterEntities;
++
++    set_subtest("[%i] %s", (int)i, doc);
++
++#ifdef XML_DTD // both GE and DTD
++    const bool rejection_expected = true;
++#elif XML_GE == 1 // GE but not DTD
++    const bool rejection_expected = ! usesParameterEntities;
++#else             // neither DTD nor GE
++    const bool rejection_expected = false;
++#endif
++
++    XML_Parser parser = XML_ParserCreate(NULL);
++
++#ifdef XML_DTD
++    if (usesParameterEntities) {
++      assert_true(
++          XML_SetParamEntityParsing(parser, XML_PARAM_ENTITY_PARSING_ALWAYS)
++          == 1);
++    }
++#else
++    UNUSED_P(usesParameterEntities);
++#endif // XML_DTD
++
++    const enum XML_Status status
++        = _XML_Parse_SINGLE_BYTES(parser, doc, (int)strlen(doc),
++                                  /*isFinal*/ XML_TRUE);
++
++    if (rejection_expected) {
++      assert_true(status == XML_STATUS_ERROR);
++      assert_true(XML_GetErrorCode(parser) == XML_ERROR_RECURSIVE_ENTITY_REF);
++    } else {
++      assert_true(status == XML_STATUS_OK);
++    }
++
++    XML_ParserFree(parser);
++  }
++}
++END_TEST
++
+ START_TEST(test_recursive_external_parameter_entity_2) {
+   struct TestCase {
+     const char *doc;
+@@ -5969,6 +6042,7 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_not_standalone_handler_reject);
+   tcase_add_test(tc_basic, test_not_standalone_handler_accept);
+   tcase_add_test__if_xml_ge(tc_basic, test_wfc_no_recursive_entity_refs);
++  tcase_add_test(tc_basic, test_no_indirectly_recursive_entity_refs);
+   tcase_add_test__ifdef_xml_dtd(tc_basic, test_ext_entity_invalid_parse);
+   tcase_add_test__if_xml_ge(tc_basic, test_dtd_default_handling);
+   tcase_add_test(tc_basic, test_dtd_attr_handling);
diff --git a/meta/recipes-core/expat/expat/CVE-2024-8176-01.patch b/meta/recipes-core/expat/expat/CVE-2024-8176-01.patch
new file mode 100644
index 0000000000..dc8a520161
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-8176-01.patch
@@ -0,0 +1,1477 @@
+From 3f924a715cfa97e70df1c24334d2d728973d1020 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Mon, 17 Mar 2025 20:41:24 +0100
+Subject: [PATCH] [CVE-2024-8176] Resolve the recursion during entity
+ processing to prevent stack overflow (fixes #893)
+
+Fixes #893
+
+CVE: CVE-2024-8176
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/973]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ expat/Changes             |  29 +-
+ expat/lib/xmlparse.c      | 564 ++++++++++++++++++++++++++++----------
+ expat/tests/alloc_tests.c |  27 ++
+ expat/tests/basic_tests.c | 247 +++++++++++++++--
+ expat/tests/handlers.c    |  14 +
+ expat/tests/handlers.h    |   5 +
+ expat/tests/misc_tests.c  |  43 +++
+ 7 files changed, 751 insertions(+), 178 deletions(-)
+
+diff --git a/expat/Changes b/expat/Changes
+index aa19f70a..8c5db88c 100644
+--- a/expat/Changes
++++ b/expat/Changes
+@@ -11,7 +11,6 @@
+ !! The following topics need *additional skilled C developers* to progress   !!
+ !! in a timely manner or at all (loosely ordered by descending priority):    !!
+ !!                                                                           !!
+-!! - <blink>fixing a complex non-public security issue</blink>,              !!
+ !! - teaming up on researching and fixing future security reports and        !!
+ !!   ClusterFuzz findings with few-days-max response times in communication  !!
+ !!   in order to (1) have a sound fix ready before the end of a 90 days      !!
+@@ -30,6 +29,34 @@
+ !! THANK YOU!                        Sebastian Pipping -- Berlin, 2024-03-09 !!
+ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
+ 
++Patches:
++        Security fixes:
++       #893 #???  CVE-2024-8176 -- Fix crash from chaining a large number
++                    of entities caused by stack overflow by resolving use of
++                    recursion, for all three uses of entities:
++                    - general entities in character data ("<e>&g1;</e>")
++                    - general entities in attribute values ("<e k1='&g1;'/>")
++                    - parameter entities ("%p1;")
++                    Known impact is (reliable and easy) denial of service:
++                    CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H/E:H/RL:O/RC:C
++                    (Base Score: 7.5, Temporal Score: 7.2)
++                    Please note that a layer of compression around XML can
++                    significantly reduce the minimum attack payload size.
++
++         Special thanks to:
++            Alexander Gieringer
++            Berkay Eren Ürün
++            Jann Horn
++            Sebastian Andrzej Siewior
++            Snild Dolkow
++            Thomas Pröll
++            Tomas Korbar
++                 and
++            Google Project Zero
++            Linutronix
++            Red Hat
++            Siemens
++
+ Release 2.6.4 Wed November 6 2024
+         Security fixes:
+             #915  CVE-2024-50602 -- Fix crash within function XML_ResumeParser
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index a4e091e7..473c791d 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -39,7 +39,7 @@
+    Copyright (c) 2022      Sean McBride <sean@rogue-research.com>
+    Copyright (c) 2023      Owain Davies <owaind@bath.edu>
+    Copyright (c) 2023-2024 Sony Corporation / Snild Dolkow <snild@sony.com>
+-   Copyright (c) 2024      Berkay Eren Ürün <berkay.ueruen@siemens.com>
++   Copyright (c) 2024-2025 Berkay Eren Ürün <berkay.ueruen@siemens.com>
+    Copyright (c) 2024      Hanno Böck <hanno@gentoo.org>
+    Licensed under the MIT license:
+ 
+@@ -325,6 +325,10 @@ typedef struct {
+   const XML_Char *publicId;
+   const XML_Char *notation;
+   XML_Bool open;
++  XML_Bool hasMore; /* true if entity has not been completely processed */
++  /* An entity can be open while being already completely processed (hasMore ==
++    XML_FALSE). The reason is the delayed closing of entities until their inner
++    entities are processed and closed */
+   XML_Bool is_param;
+   XML_Bool is_internal; /* true if declared in internal subset outside PE */
+ } ENTITY;
+@@ -415,6 +419,12 @@ typedef struct {
+   int *scaffIndex;
+ } DTD;
+ 
++enum EntityType {
++  ENTITY_INTERNAL,
++  ENTITY_ATTRIBUTE,
++  ENTITY_VALUE,
++};
++
+ typedef struct open_internal_entity {
+   const char *internalEventPtr;
+   const char *internalEventEndPtr;
+@@ -422,6 +432,7 @@ typedef struct open_internal_entity {
+   ENTITY *entity;
+   int startTagLevel;
+   XML_Bool betweenDecl; /* WFC: PE Between Declarations */
++  enum EntityType type;
+ } OPEN_INTERNAL_ENTITY;
+ 
+ enum XML_Account {
+@@ -481,8 +492,8 @@ static enum XML_Error doProlog(XML_Parser parser, const ENCODING *enc,
+                                const char *next, const char **nextPtr,
+                                XML_Bool haveMore, XML_Bool allowClosingDoctype,
+                                enum XML_Account account);
+-static enum XML_Error processInternalEntity(XML_Parser parser, ENTITY *entity,
+-                                            XML_Bool betweenDecl);
++static enum XML_Error processEntity(XML_Parser parser, ENTITY *entity,
++                                    XML_Bool betweenDecl, enum EntityType type);
+ static enum XML_Error doContent(XML_Parser parser, int startTagLevel,
+                                 const ENCODING *enc, const char *start,
+                                 const char *end, const char **endPtr,
+@@ -513,18 +524,22 @@ static enum XML_Error storeAttributeValue(XML_Parser parser,
+                                           const char *ptr, const char *end,
+                                           STRING_POOL *pool,
+                                           enum XML_Account account);
+-static enum XML_Error appendAttributeValue(XML_Parser parser,
+-                                           const ENCODING *enc,
+-                                           XML_Bool isCdata, const char *ptr,
+-                                           const char *end, STRING_POOL *pool,
+-                                           enum XML_Account account);
++static enum XML_Error
++appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
++                     const char *ptr, const char *end, STRING_POOL *pool,
++                     enum XML_Account account, const char **nextPtr);
+ static ATTRIBUTE_ID *getAttributeId(XML_Parser parser, const ENCODING *enc,
+                                     const char *start, const char *end);
+ static int setElementTypePrefix(XML_Parser parser, ELEMENT_TYPE *elementType);
+ #if XML_GE == 1
+ static enum XML_Error storeEntityValue(XML_Parser parser, const ENCODING *enc,
+                                        const char *start, const char *end,
+-                                       enum XML_Account account);
++                                       enum XML_Account account,
++                                       const char **nextPtr);
++static enum XML_Error callStoreEntityValue(XML_Parser parser,
++                                           const ENCODING *enc,
++                                           const char *start, const char *end,
++                                           enum XML_Account account);
+ #else
+ static enum XML_Error storeSelfEntityValue(XML_Parser parser, ENTITY *entity);
+ #endif
+@@ -709,6 +724,10 @@ struct XML_ParserStruct {
+   const char *m_positionPtr;
+   OPEN_INTERNAL_ENTITY *m_openInternalEntities;
+   OPEN_INTERNAL_ENTITY *m_freeInternalEntities;
++  OPEN_INTERNAL_ENTITY *m_openAttributeEntities;
++  OPEN_INTERNAL_ENTITY *m_freeAttributeEntities;
++  OPEN_INTERNAL_ENTITY *m_openValueEntities;
++  OPEN_INTERNAL_ENTITY *m_freeValueEntities;
+   XML_Bool m_defaultExpandInternalEntities;
+   int m_tagLevel;
+   ENTITY *m_declEntity;
+@@ -756,6 +775,7 @@ struct XML_ParserStruct {
+   ACCOUNTING m_accounting;
+   ENTITY_STATS m_entity_stats;
+ #endif
++  XML_Bool m_reenter;
+ };
+ 
+ #define MALLOC(parser, s) (parser->m_mem.malloc_fcn((s)))
+@@ -1028,7 +1048,29 @@ callProcessor(XML_Parser parser, const char *start, const char *end,
+ #if defined(XML_TESTING)
+   g_bytesScanned += (unsigned)have_now;
+ #endif
+-  const enum XML_Error ret = parser->m_processor(parser, start, end, endPtr);
++  // Run in a loop to eliminate dangerous recursion depths
++  enum XML_Error ret;
++  *endPtr = start;
++  while (1) {
++    // Use endPtr as the new start in each iteration, since it will
++    // be set to the next start point by m_processor.
++    ret = parser->m_processor(parser, *endPtr, end, endPtr);
++
++    // Make parsing status (and in particular XML_SUSPENDED) take
++    // precedence over re-enter flag when they disagree
++    if (parser->m_parsingStatus.parsing != XML_PARSING) {
++      parser->m_reenter = XML_FALSE;
++    }
++
++    if (! parser->m_reenter) {
++      break;
++    }
++
++    parser->m_reenter = XML_FALSE;
++    if (ret != XML_ERROR_NONE)
++      return ret;
++  }
++
+   if (ret == XML_ERROR_NONE) {
+     // if we consumed nothing, remember what we had on this parse attempt.
+     if (*endPtr == start) {
+@@ -1139,6 +1181,8 @@ parserCreate(const XML_Char *encodingName,
+   parser->m_freeBindingList = NULL;
+   parser->m_freeTagList = NULL;
+   parser->m_freeInternalEntities = NULL;
++  parser->m_freeAttributeEntities = NULL;
++  parser->m_freeValueEntities = NULL;
+ 
+   parser->m_groupSize = 0;
+   parser->m_groupConnector = NULL;
+@@ -1241,6 +1285,8 @@ parserInit(XML_Parser parser, const XML_Char *encodingName) {
+   parser->m_eventEndPtr = NULL;
+   parser->m_positionPtr = NULL;
+   parser->m_openInternalEntities = NULL;
++  parser->m_openAttributeEntities = NULL;
++  parser->m_openValueEntities = NULL;
+   parser->m_defaultExpandInternalEntities = XML_TRUE;
+   parser->m_tagLevel = 0;
+   parser->m_tagStack = NULL;
+@@ -1251,6 +1297,8 @@ parserInit(XML_Parser parser, const XML_Char *encodingName) {
+   parser->m_unknownEncodingData = NULL;
+   parser->m_parentParser = NULL;
+   parser->m_parsingStatus.parsing = XML_INITIALIZED;
++  // Reentry can only be triggered inside m_processor calls
++  parser->m_reenter = XML_FALSE;
+ #ifdef XML_DTD
+   parser->m_isParamEntity = XML_FALSE;
+   parser->m_useForeignDTD = XML_FALSE;
+@@ -1310,6 +1358,24 @@ XML_ParserReset(XML_Parser parser, const XML_Char *encodingName) {
+     openEntity->next = parser->m_freeInternalEntities;
+     parser->m_freeInternalEntities = openEntity;
+   }
++  /* move m_openAttributeEntities to m_freeAttributeEntities (i.e. same task but
++   * for attributes) */
++  openEntityList = parser->m_openAttributeEntities;
++  while (openEntityList) {
++    OPEN_INTERNAL_ENTITY *openEntity = openEntityList;
++    openEntityList = openEntity->next;
++    openEntity->next = parser->m_freeAttributeEntities;
++    parser->m_freeAttributeEntities = openEntity;
++  }
++  /* move m_openValueEntities to m_freeValueEntities (i.e. same task but
++   * for value entities) */
++  openEntityList = parser->m_openValueEntities;
++  while (openEntityList) {
++    OPEN_INTERNAL_ENTITY *openEntity = openEntityList;
++    openEntityList = openEntity->next;
++    openEntity->next = parser->m_freeValueEntities;
++    parser->m_freeValueEntities = openEntity;
++  }
+   moveToFreeBindingList(parser, parser->m_inheritedBindings);
+   FREE(parser, parser->m_unknownEncodingMem);
+   if (parser->m_unknownEncodingRelease)
+@@ -1323,6 +1389,19 @@ XML_ParserReset(XML_Parser parser, const XML_Char *encodingName) {
+   return XML_TRUE;
+ }
+ 
++static XML_Bool
++parserBusy(XML_Parser parser) {
++  switch (parser->m_parsingStatus.parsing) {
++  case XML_PARSING:
++  case XML_SUSPENDED:
++    return XML_TRUE;
++  case XML_INITIALIZED:
++  case XML_FINISHED:
++  default:
++    return XML_FALSE;
++  }
++}
++
+ enum XML_Status XMLCALL
+ XML_SetEncoding(XML_Parser parser, const XML_Char *encodingName) {
+   if (parser == NULL)
+@@ -1331,8 +1410,7 @@ XML_SetEncoding(XML_Parser parser, const XML_Char *encodingName) {
+      XXX There's no way for the caller to determine which of the
+      XXX possible error cases caused the XML_STATUS_ERROR return.
+   */
+-  if (parser->m_parsingStatus.parsing == XML_PARSING
+-      || parser->m_parsingStatus.parsing == XML_SUSPENDED)
++  if (parserBusy(parser))
+     return XML_STATUS_ERROR;
+ 
+   /* Get rid of any previous encoding name */
+@@ -1569,7 +1647,34 @@ XML_ParserFree(XML_Parser parser) {
+     entityList = entityList->next;
+     FREE(parser, openEntity);
+   }
+-
++  /* free m_openAttributeEntities and m_freeAttributeEntities */
++  entityList = parser->m_openAttributeEntities;
++  for (;;) {
++    OPEN_INTERNAL_ENTITY *openEntity;
++    if (entityList == NULL) {
++      if (parser->m_freeAttributeEntities == NULL)
++        break;
++      entityList = parser->m_freeAttributeEntities;
++      parser->m_freeAttributeEntities = NULL;
++    }
++    openEntity = entityList;
++    entityList = entityList->next;
++    FREE(parser, openEntity);
++  }
++  /* free m_openValueEntities and m_freeValueEntities */
++  entityList = parser->m_openValueEntities;
++  for (;;) {
++    OPEN_INTERNAL_ENTITY *openEntity;
++    if (entityList == NULL) {
++      if (parser->m_freeValueEntities == NULL)
++        break;
++      entityList = parser->m_freeValueEntities;
++      parser->m_freeValueEntities = NULL;
++    }
++    openEntity = entityList;
++    entityList = entityList->next;
++    FREE(parser, openEntity);
++  }
+   destroyBindings(parser->m_freeBindingList, parser);
+   destroyBindings(parser->m_inheritedBindings, parser);
+   poolDestroy(&parser->m_tempPool);
+@@ -1611,8 +1716,7 @@ XML_UseForeignDTD(XML_Parser parser, XML_Bool useDTD) {
+     return XML_ERROR_INVALID_ARGUMENT;
+ #ifdef XML_DTD
+   /* block after XML_Parse()/XML_ParseBuffer() has been called */
+-  if (parser->m_parsingStatus.parsing == XML_PARSING
+-      || parser->m_parsingStatus.parsing == XML_SUSPENDED)
++  if (parserBusy(parser))
+     return XML_ERROR_CANT_CHANGE_FEATURE_ONCE_PARSING;
+   parser->m_useForeignDTD = useDTD;
+   return XML_ERROR_NONE;
+@@ -1627,8 +1731,7 @@ XML_SetReturnNSTriplet(XML_Parser parser, int do_nst) {
+   if (parser == NULL)
+     return;
+   /* block after XML_Parse()/XML_ParseBuffer() has been called */
+-  if (parser->m_parsingStatus.parsing == XML_PARSING
+-      || parser->m_parsingStatus.parsing == XML_SUSPENDED)
++  if (parserBusy(parser))
+     return;
+   parser->m_ns_triplets = do_nst ? XML_TRUE : XML_FALSE;
+ }
+@@ -1897,8 +2000,7 @@ XML_SetParamEntityParsing(XML_Parser parser,
+   if (parser == NULL)
+     return 0;
+   /* block after XML_Parse()/XML_ParseBuffer() has been called */
+-  if (parser->m_parsingStatus.parsing == XML_PARSING
+-      || parser->m_parsingStatus.parsing == XML_SUSPENDED)
++  if (parserBusy(parser))
+     return 0;
+ #ifdef XML_DTD
+   parser->m_paramEntityParsing = peParsing;
+@@ -1915,8 +2017,7 @@ XML_SetHashSalt(XML_Parser parser, unsigned long hash_salt) {
+   if (parser->m_parentParser)
+     return XML_SetHashSalt(parser->m_parentParser, hash_salt);
+   /* block after XML_Parse()/XML_ParseBuffer() has been called */
+-  if (parser->m_parsingStatus.parsing == XML_PARSING
+-      || parser->m_parsingStatus.parsing == XML_SUSPENDED)
++  if (parserBusy(parser))
+     return 0;
+   parser->m_hash_secret_salt = hash_salt;
+   return 1;
+@@ -2230,6 +2331,11 @@ XML_GetBuffer(XML_Parser parser, int len) {
+   return parser->m_bufferEnd;
+ }
+ 
++static void
++triggerReenter(XML_Parser parser) {
++  parser->m_reenter = XML_TRUE;
++}
++
+ enum XML_Status XMLCALL
+ XML_StopParser(XML_Parser parser, XML_Bool resumable) {
+   if (parser == NULL)
+@@ -2704,8 +2810,9 @@ static enum XML_Error PTRCALL
+ contentProcessor(XML_Parser parser, const char *start, const char *end,
+                  const char **endPtr) {
+   enum XML_Error result = doContent(
+-      parser, 0, parser->m_encoding, start, end, endPtr,
+-      (XML_Bool)! parser->m_parsingStatus.finalBuffer, XML_ACCOUNT_DIRECT);
++      parser, parser->m_parentParser ? 1 : 0, parser->m_encoding, start, end,
++      endPtr, (XML_Bool)! parser->m_parsingStatus.finalBuffer,
++      XML_ACCOUNT_DIRECT);
+   if (result == XML_ERROR_NONE) {
+     if (! storeRawNames(parser))
+       return XML_ERROR_NO_MEMORY;
+@@ -2793,6 +2900,11 @@ externalEntityInitProcessor3(XML_Parser parser, const char *start,
+       return XML_ERROR_NONE;
+     case XML_FINISHED:
+       return XML_ERROR_ABORTED;
++    case XML_PARSING:
++      if (parser->m_reenter) {
++        return XML_ERROR_UNEXPECTED_STATE; // LCOV_EXCL_LINE
++      }
++      /* Fall through */
+     default:
+       start = next;
+     }
+@@ -2966,7 +3078,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             reportDefault(parser, enc, s, next);
+           break;
+         }
+-        result = processInternalEntity(parser, entity, XML_FALSE);
++        result = processEntity(parser, entity, XML_FALSE, ENTITY_INTERNAL);
+         if (result != XML_ERROR_NONE)
+           return result;
+       } else if (parser->m_externalEntityRefHandler) {
+@@ -3092,7 +3204,9 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+     }
+       if ((parser->m_tagLevel == 0)
+           && (parser->m_parsingStatus.parsing != XML_FINISHED)) {
+-        if (parser->m_parsingStatus.parsing == XML_SUSPENDED)
++        if (parser->m_parsingStatus.parsing == XML_SUSPENDED
++            || (parser->m_parsingStatus.parsing == XML_PARSING
++                && parser->m_reenter))
+           parser->m_processor = epilogProcessor;
+         else
+           return epilogProcessor(parser, next, end, nextPtr);
+@@ -3153,7 +3267,9 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         }
+         if ((parser->m_tagLevel == 0)
+             && (parser->m_parsingStatus.parsing != XML_FINISHED)) {
+-          if (parser->m_parsingStatus.parsing == XML_SUSPENDED)
++          if (parser->m_parsingStatus.parsing == XML_SUSPENDED
++              || (parser->m_parsingStatus.parsing == XML_PARSING
++                  && parser->m_reenter))
+             parser->m_processor = epilogProcessor;
+           else
+             return epilogProcessor(parser, next, end, nextPtr);
+@@ -3293,6 +3409,12 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       return XML_ERROR_NONE;
+     case XML_FINISHED:
+       return XML_ERROR_ABORTED;
++    case XML_PARSING:
++      if (parser->m_reenter) {
++        *nextPtr = next;
++        return XML_ERROR_NONE;
++      }
++      /* Fall through */
+     default:;
+     }
+   }
+@@ -4217,6 +4339,11 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+       return XML_ERROR_NONE;
+     case XML_FINISHED:
+       return XML_ERROR_ABORTED;
++    case XML_PARSING:
++      if (parser->m_reenter) {
++        return XML_ERROR_UNEXPECTED_STATE; // LCOV_EXCL_LINE
++      }
++      /* Fall through */
+     default:;
+     }
+   }
+@@ -4549,7 +4676,7 @@ entityValueInitProcessor(XML_Parser parser, const char *s, const char *end,
+       }
+       /* found end of entity value - can store it now */
+       return storeEntityValue(parser, parser->m_encoding, s, end,
+-                              XML_ACCOUNT_DIRECT);
++                              XML_ACCOUNT_DIRECT, NULL);
+     } else if (tok == XML_TOK_XML_DECL) {
+       enum XML_Error result;
+       result = processXmlDecl(parser, 0, start, next);
+@@ -4676,7 +4803,7 @@ entityValueProcessor(XML_Parser parser, const char *s, const char *end,
+         break;
+       }
+       /* found end of entity value - can store it now */
+-      return storeEntityValue(parser, enc, s, end, XML_ACCOUNT_DIRECT);
++      return storeEntityValue(parser, enc, s, end, XML_ACCOUNT_DIRECT, NULL);
+     }
+     start = next;
+   }
+@@ -5119,9 +5246,9 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+ #if XML_GE == 1
+         // This will store the given replacement text in
+         // parser->m_declEntity->textPtr.
+-        enum XML_Error result
+-            = storeEntityValue(parser, enc, s + enc->minBytesPerChar,
+-                               next - enc->minBytesPerChar, XML_ACCOUNT_NONE);
++        enum XML_Error result = callStoreEntityValue(
++            parser, enc, s + enc->minBytesPerChar, next - enc->minBytesPerChar,
++            XML_ACCOUNT_NONE);
+         if (parser->m_declEntity) {
+           parser->m_declEntity->textPtr = poolStart(&dtd->entityValuePool);
+           parser->m_declEntity->textLen
+@@ -5546,7 +5673,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+           enum XML_Error result;
+           XML_Bool betweenDecl
+               = (role == XML_ROLE_PARAM_ENTITY_REF ? XML_TRUE : XML_FALSE);
+-          result = processInternalEntity(parser, entity, betweenDecl);
++          result = processEntity(parser, entity, betweenDecl, ENTITY_INTERNAL);
+           if (result != XML_ERROR_NONE)
+             return result;
+           handleDefault = XML_FALSE;
+@@ -5751,6 +5878,12 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       return XML_ERROR_NONE;
+     case XML_FINISHED:
+       return XML_ERROR_ABORTED;
++    case XML_PARSING:
++      if (parser->m_reenter) {
++        *nextPtr = next;
++        return XML_ERROR_NONE;
++      }
++    /* Fall through */
+     default:
+       s = next;
+       tok = XmlPrologTok(enc, s, end, &next);
+@@ -5825,21 +5958,49 @@ epilogProcessor(XML_Parser parser, const char *s, const char *end,
+       return XML_ERROR_NONE;
+     case XML_FINISHED:
+       return XML_ERROR_ABORTED;
++    case XML_PARSING:
++      if (parser->m_reenter) {
++        return XML_ERROR_UNEXPECTED_STATE; // LCOV_EXCL_LINE
++      }
++    /* Fall through */
+     default:;
+     }
+   }
+ }
+ 
+ static enum XML_Error
+-processInternalEntity(XML_Parser parser, ENTITY *entity, XML_Bool betweenDecl) {
+-  const char *textStart, *textEnd;
+-  const char *next;
+-  enum XML_Error result;
+-  OPEN_INTERNAL_ENTITY *openEntity;
++processEntity(XML_Parser parser, ENTITY *entity, XML_Bool betweenDecl,
++              enum EntityType type) {
++  OPEN_INTERNAL_ENTITY *openEntity, **openEntityList, **freeEntityList;
++  switch (type) {
++  case ENTITY_INTERNAL:
++    parser->m_processor = internalEntityProcessor;
++    openEntityList = &parser->m_openInternalEntities;
++    freeEntityList = &parser->m_freeInternalEntities;
++    break;
++  case ENTITY_ATTRIBUTE:
++    openEntityList = &parser->m_openAttributeEntities;
++    freeEntityList = &parser->m_freeAttributeEntities;
++    break;
++  case ENTITY_VALUE:
++    openEntityList = &parser->m_openValueEntities;
++    freeEntityList = &parser->m_freeValueEntities;
++    break;
++    /* default case serves merely as a safety net in case of a
++     * wrong entityType. Therefore we exclude the following lines
++     * from the test coverage.
++     *
++     * LCOV_EXCL_START
++     */
++  default:
++    // Should not reach here
++    assert(0);
++    /* LCOV_EXCL_STOP */
++  }
+ 
+-  if (parser->m_freeInternalEntities) {
+-    openEntity = parser->m_freeInternalEntities;
+-    parser->m_freeInternalEntities = openEntity->next;
++  if (*freeEntityList) {
++    openEntity = *freeEntityList;
++    *freeEntityList = openEntity->next;
+   } else {
+     openEntity
+         = (OPEN_INTERNAL_ENTITY *)MALLOC(parser, sizeof(OPEN_INTERNAL_ENTITY));
+@@ -5847,55 +6008,34 @@ processInternalEntity(XML_Parser parser, ENTITY *entity, XML_Bool betweenDecl) {
+       return XML_ERROR_NO_MEMORY;
+   }
+   entity->open = XML_TRUE;
++  entity->hasMore = XML_TRUE;
+ #if XML_GE == 1
+   entityTrackingOnOpen(parser, entity, __LINE__);
+ #endif
+   entity->processed = 0;
+-  openEntity->next = parser->m_openInternalEntities;
+-  parser->m_openInternalEntities = openEntity;
++  openEntity->next = *openEntityList;
++  *openEntityList = openEntity;
+   openEntity->entity = entity;
++  openEntity->type = type;
+   openEntity->startTagLevel = parser->m_tagLevel;
+   openEntity->betweenDecl = betweenDecl;
+   openEntity->internalEventPtr = NULL;
+   openEntity->internalEventEndPtr = NULL;
+-  textStart = (const char *)entity->textPtr;
+-  textEnd = (const char *)(entity->textPtr + entity->textLen);
+-  /* Set a safe default value in case 'next' does not get set */
+-  next = textStart;
+ 
+-  if (entity->is_param) {
+-    int tok
+-        = XmlPrologTok(parser->m_internalEncoding, textStart, textEnd, &next);
+-    result = doProlog(parser, parser->m_internalEncoding, textStart, textEnd,
+-                      tok, next, &next, XML_FALSE, XML_FALSE,
+-                      XML_ACCOUNT_ENTITY_EXPANSION);
+-  } else {
+-    result = doContent(parser, parser->m_tagLevel, parser->m_internalEncoding,
+-                       textStart, textEnd, &next, XML_FALSE,
+-                       XML_ACCOUNT_ENTITY_EXPANSION);
++  // Only internal entities make use of the reenter flag
++  // therefore no need to set it for other entity types
++  if (type == ENTITY_INTERNAL) {
++    triggerReenter(parser);
+   }
+-
+-  if (result == XML_ERROR_NONE) {
+-    if (textEnd != next && parser->m_parsingStatus.parsing == XML_SUSPENDED) {
+-      entity->processed = (int)(next - textStart);
+-      parser->m_processor = internalEntityProcessor;
+-    } else if (parser->m_openInternalEntities->entity == entity) {
+-#if XML_GE == 1
+-      entityTrackingOnClose(parser, entity, __LINE__);
+-#endif /* XML_GE == 1 */
+-      entity->open = XML_FALSE;
+-      parser->m_openInternalEntities = openEntity->next;
+-      /* put openEntity back in list of free instances */
+-      openEntity->next = parser->m_freeInternalEntities;
+-      parser->m_freeInternalEntities = openEntity;
+-    }
+-  }
+-  return result;
++  return XML_ERROR_NONE;
+ }
+ 
+ static enum XML_Error PTRCALL
+ internalEntityProcessor(XML_Parser parser, const char *s, const char *end,
+                         const char **nextPtr) {
++  UNUSED_P(s);
++  UNUSED_P(end);
++  UNUSED_P(nextPtr);
+   ENTITY *entity;
+   const char *textStart, *textEnd;
+   const char *next;
+@@ -5905,68 +6045,67 @@ internalEntityProcessor(XML_Parser parser, const char *s, const char *end,
+     return XML_ERROR_UNEXPECTED_STATE;
+ 
+   entity = openEntity->entity;
+-  textStart = ((const char *)entity->textPtr) + entity->processed;
+-  textEnd = (const char *)(entity->textPtr + entity->textLen);
+-  /* Set a safe default value in case 'next' does not get set */
+-  next = textStart;
+ 
+-  if (entity->is_param) {
+-    int tok
+-        = XmlPrologTok(parser->m_internalEncoding, textStart, textEnd, &next);
+-    result = doProlog(parser, parser->m_internalEncoding, textStart, textEnd,
+-                      tok, next, &next, XML_FALSE, XML_TRUE,
+-                      XML_ACCOUNT_ENTITY_EXPANSION);
+-  } else {
+-    result = doContent(parser, openEntity->startTagLevel,
+-                       parser->m_internalEncoding, textStart, textEnd, &next,
+-                       XML_FALSE, XML_ACCOUNT_ENTITY_EXPANSION);
+-  }
++  // This will return early
++  if (entity->hasMore) {
++    textStart = ((const char *)entity->textPtr) + entity->processed;
++    textEnd = (const char *)(entity->textPtr + entity->textLen);
++    /* Set a safe default value in case 'next' does not get set */
++    next = textStart;
+ 
+-  if (result != XML_ERROR_NONE)
+-    return result;
++    if (entity->is_param) {
++      int tok
++          = XmlPrologTok(parser->m_internalEncoding, textStart, textEnd, &next);
++      result = doProlog(parser, parser->m_internalEncoding, textStart, textEnd,
++                        tok, next, &next, XML_FALSE, XML_FALSE,
++                        XML_ACCOUNT_ENTITY_EXPANSION);
++    } else {
++      result = doContent(parser, openEntity->startTagLevel,
++                         parser->m_internalEncoding, textStart, textEnd, &next,
++                         XML_FALSE, XML_ACCOUNT_ENTITY_EXPANSION);
++    }
++
++    if (result != XML_ERROR_NONE)
++      return result;
++    // Check if entity is complete, if not, mark down how much of it is
++    // processed
++    if (textEnd != next
++        && (parser->m_parsingStatus.parsing == XML_SUSPENDED
++            || (parser->m_parsingStatus.parsing == XML_PARSING
++                && parser->m_reenter))) {
++      entity->processed = (int)(next - (const char *)entity->textPtr);
++      return result;
++    }
+ 
+-  if (textEnd != next && parser->m_parsingStatus.parsing == XML_SUSPENDED) {
+-    entity->processed = (int)(next - (const char *)entity->textPtr);
++    // Entity is complete. We cannot close it here since we need to first
++    // process its possible inner entities (which are added to the
++    // m_openInternalEntities during doProlog or doContent calls above)
++    entity->hasMore = XML_FALSE;
++    triggerReenter(parser);
+     return result;
+-  }
++  } // End of entity processing, "if" block will return here
+ 
++  // Remove fully processed openEntity from open entity list.
+ #if XML_GE == 1
+   entityTrackingOnClose(parser, entity, __LINE__);
+ #endif
++  // openEntity is m_openInternalEntities' head, as we set it at the start of
++  // this function and we skipped doProlog and doContent calls with hasMore set
++  // to false. This means we can directly remove the head of
++  // m_openInternalEntities
++  assert(parser->m_openInternalEntities == openEntity);
+   entity->open = XML_FALSE;
+-  parser->m_openInternalEntities = openEntity->next;
++  parser->m_openInternalEntities = parser->m_openInternalEntities->next;
++
+   /* put openEntity back in list of free instances */
+   openEntity->next = parser->m_freeInternalEntities;
+   parser->m_freeInternalEntities = openEntity;
+ 
+-  // If there are more open entities we want to stop right here and have the
+-  // upcoming call to XML_ResumeParser continue with entity content, or it would
+-  // be ignored altogether.
+-  if (parser->m_openInternalEntities != NULL
+-      && parser->m_parsingStatus.parsing == XML_SUSPENDED) {
+-    return XML_ERROR_NONE;
+-  }
+-
+-  if (entity->is_param) {
+-    int tok;
+-    parser->m_processor = prologProcessor;
+-    tok = XmlPrologTok(parser->m_encoding, s, end, &next);
+-    return doProlog(parser, parser->m_encoding, s, end, tok, next, nextPtr,
+-                    (XML_Bool)! parser->m_parsingStatus.finalBuffer, XML_TRUE,
+-                    XML_ACCOUNT_DIRECT);
+-  } else {
+-    parser->m_processor = contentProcessor;
+-    /* see externalEntityContentProcessor vs contentProcessor */
+-    result = doContent(parser, parser->m_parentParser ? 1 : 0,
+-                       parser->m_encoding, s, end, nextPtr,
+-                       (XML_Bool)! parser->m_parsingStatus.finalBuffer,
+-                       XML_ACCOUNT_DIRECT);
+-    if (result == XML_ERROR_NONE) {
+-      if (! storeRawNames(parser))
+-        return XML_ERROR_NO_MEMORY;
+-    }
+-    return result;
++  if (parser->m_openInternalEntities == NULL) {
++    parser->m_processor = entity->is_param ? prologProcessor : contentProcessor;
+   }
++  triggerReenter(parser);
++  return XML_ERROR_NONE;
+ }
+ 
+ static enum XML_Error PTRCALL
+@@ -5982,8 +6121,70 @@ static enum XML_Error
+ storeAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+                     const char *ptr, const char *end, STRING_POOL *pool,
+                     enum XML_Account account) {
+-  enum XML_Error result
+-      = appendAttributeValue(parser, enc, isCdata, ptr, end, pool, account);
++  const char *next = ptr;
++  enum XML_Error result = XML_ERROR_NONE;
++
++  while (1) {
++    if (! parser->m_openAttributeEntities) {
++      result = appendAttributeValue(parser, enc, isCdata, next, end, pool,
++                                    account, &next);
++    } else {
++      OPEN_INTERNAL_ENTITY *const openEntity = parser->m_openAttributeEntities;
++      if (! openEntity)
++        return XML_ERROR_UNEXPECTED_STATE;
++
++      ENTITY *const entity = openEntity->entity;
++      const char *const textStart
++          = ((const char *)entity->textPtr) + entity->processed;
++      const char *const textEnd
++          = (const char *)(entity->textPtr + entity->textLen);
++      /* Set a safe default value in case 'next' does not get set */
++      const char *nextInEntity = textStart;
++      if (entity->hasMore) {
++        result = appendAttributeValue(
++            parser, parser->m_internalEncoding, isCdata, textStart, textEnd,
++            pool, XML_ACCOUNT_ENTITY_EXPANSION, &nextInEntity);
++        if (result != XML_ERROR_NONE)
++          break;
++        // Check if entity is complete, if not, mark down how much of it is
++        // processed. A XML_SUSPENDED check here is not required as
++        // appendAttributeValue will never suspend the parser.
++        if (textEnd != nextInEntity) {
++          entity->processed
++              = (int)(nextInEntity - (const char *)entity->textPtr);
++          continue;
++        }
++
++        // Entity is complete. We cannot close it here since we need to first
++        // process its possible inner entities (which are added to the
++        // m_openAttributeEntities during appendAttributeValue)
++        entity->hasMore = XML_FALSE;
++        continue;
++      } // End of entity processing, "if" block skips the rest
++
++      // Remove fully processed openEntity from open entity list.
++#if XML_GE == 1
++      entityTrackingOnClose(parser, entity, __LINE__);
++#endif
++      // openEntity is m_openAttributeEntities' head, since we set it at the
++      // start of this function and because we skipped appendAttributeValue call
++      // with hasMore set to false. This means we can directly remove the head
++      // of m_openAttributeEntities
++      assert(parser->m_openAttributeEntities == openEntity);
++      entity->open = XML_FALSE;
++      parser->m_openAttributeEntities = parser->m_openAttributeEntities->next;
++
++      /* put openEntity back in list of free instances */
++      openEntity->next = parser->m_freeAttributeEntities;
++      parser->m_freeAttributeEntities = openEntity;
++    }
++
++    // Break if an error occurred or there is nothing left to process
++    if (result || (parser->m_openAttributeEntities == NULL && end == next)) {
++      break;
++    }
++  }
++
+   if (result)
+     return result;
+   if (! isCdata && poolLength(pool) && poolLastChar(pool) == 0x20)
+@@ -5996,7 +6197,7 @@ storeAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+ static enum XML_Error
+ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+                      const char *ptr, const char *end, STRING_POOL *pool,
+-                     enum XML_Account account) {
++                     enum XML_Account account, const char **nextPtr) {
+   DTD *const dtd = parser->m_dtd; /* save one level of indirection */
+ #ifndef XML_DTD
+   UNUSED_P(account);
+@@ -6014,6 +6215,9 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+ #endif
+     switch (tok) {
+     case XML_TOK_NONE:
++      if (nextPtr) {
++        *nextPtr = next;
++      }
+       return XML_ERROR_NONE;
+     case XML_TOK_INVALID:
+       if (enc == parser->m_encoding)
+@@ -6154,21 +6358,11 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+         return XML_ERROR_ATTRIBUTE_EXTERNAL_ENTITY_REF;
+       } else {
+         enum XML_Error result;
+-        const XML_Char *textEnd = entity->textPtr + entity->textLen;
+-        entity->open = XML_TRUE;
+-#if XML_GE == 1
+-        entityTrackingOnOpen(parser, entity, __LINE__);
+-#endif
+-        result = appendAttributeValue(parser, parser->m_internalEncoding,
+-                                      isCdata, (const char *)entity->textPtr,
+-                                      (const char *)textEnd, pool,
+-                                      XML_ACCOUNT_ENTITY_EXPANSION);
+-#if XML_GE == 1
+-        entityTrackingOnClose(parser, entity, __LINE__);
+-#endif
+-        entity->open = XML_FALSE;
+-        if (result)
+-          return result;
++        result = processEntity(parser, entity, XML_FALSE, ENTITY_ATTRIBUTE);
++        if ((result == XML_ERROR_NONE) && (nextPtr != NULL)) {
++          *nextPtr = next;
++        }
++        return result;
+       }
+     } break;
+     default:
+@@ -6197,7 +6391,7 @@ appendAttributeValue(XML_Parser parser, const ENCODING *enc, XML_Bool isCdata,
+ static enum XML_Error
+ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+                  const char *entityTextPtr, const char *entityTextEnd,
+-                 enum XML_Account account) {
++                 enum XML_Account account, const char **nextPtr) {
+   DTD *const dtd = parser->m_dtd; /* save one level of indirection */
+   STRING_POOL *pool = &(dtd->entityValuePool);
+   enum XML_Error result = XML_ERROR_NONE;
+@@ -6215,8 +6409,9 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+       return XML_ERROR_NO_MEMORY;
+   }
+ 
++  const char *next;
+   for (;;) {
+-    const char *next
++    next
+         = entityTextPtr; /* XmlEntityValueTok doesn't always set the last arg */
+     int tok = XmlEntityValueTok(enc, entityTextPtr, entityTextEnd, &next);
+ 
+@@ -6278,16 +6473,8 @@ storeEntityValue(XML_Parser parser, const ENCODING *enc,
+           } else
+             dtd->keepProcessing = dtd->standalone;
+         } else {
+-          entity->open = XML_TRUE;
+-          entityTrackingOnOpen(parser, entity, __LINE__);
+-          result = storeEntityValue(
+-              parser, parser->m_internalEncoding, (const char *)entity->textPtr,
+-              (const char *)(entity->textPtr + entity->textLen),
+-              XML_ACCOUNT_ENTITY_EXPANSION);
+-          entityTrackingOnClose(parser, entity, __LINE__);
+-          entity->open = XML_FALSE;
+-          if (result)
+-            goto endEntityValue;
++          result = processEntity(parser, entity, XML_FALSE, ENTITY_VALUE);
++          goto endEntityValue;
+         }
+         break;
+       }
+@@ -6375,6 +6562,81 @@ endEntityValue:
+ #  ifdef XML_DTD
+   parser->m_prologState.inEntityValue = oldInEntityValue;
+ #  endif /* XML_DTD */
++  // If 'nextPtr' is given, it should be updated during the processing
++  if (nextPtr != NULL) {
++    *nextPtr = next;
++  }
++  return result;
++}
++
++static enum XML_Error
++callStoreEntityValue(XML_Parser parser, const ENCODING *enc,
++                     const char *entityTextPtr, const char *entityTextEnd,
++                     enum XML_Account account) {
++  const char *next = entityTextPtr;
++  enum XML_Error result = XML_ERROR_NONE;
++  while (1) {
++    if (! parser->m_openValueEntities) {
++      result
++          = storeEntityValue(parser, enc, next, entityTextEnd, account, &next);
++    } else {
++      OPEN_INTERNAL_ENTITY *const openEntity = parser->m_openValueEntities;
++      if (! openEntity)
++        return XML_ERROR_UNEXPECTED_STATE;
++
++      ENTITY *const entity = openEntity->entity;
++      const char *const textStart
++          = ((const char *)entity->textPtr) + entity->processed;
++      const char *const textEnd
++          = (const char *)(entity->textPtr + entity->textLen);
++      /* Set a safe default value in case 'next' does not get set */
++      const char *nextInEntity = textStart;
++      if (entity->hasMore) {
++        result = storeEntityValue(parser, parser->m_internalEncoding, textStart,
++                                  textEnd, XML_ACCOUNT_ENTITY_EXPANSION,
++                                  &nextInEntity);
++        if (result != XML_ERROR_NONE)
++          break;
++        // Check if entity is complete, if not, mark down how much of it is
++        // processed. A XML_SUSPENDED check here is not required as
++        // appendAttributeValue will never suspend the parser.
++        if (textEnd != nextInEntity) {
++          entity->processed
++              = (int)(nextInEntity - (const char *)entity->textPtr);
++          continue;
++        }
++
++        // Entity is complete. We cannot close it here since we need to first
++        // process its possible inner entities (which are added to the
++        // m_openValueEntities during storeEntityValue)
++        entity->hasMore = XML_FALSE;
++        continue;
++      } // End of entity processing, "if" block skips the rest
++
++      // Remove fully processed openEntity from open entity list.
++#  if XML_GE == 1
++      entityTrackingOnClose(parser, entity, __LINE__);
++#  endif
++      // openEntity is m_openValueEntities' head, since we set it at the
++      // start of this function and because we skipped storeEntityValue call
++      // with hasMore set to false. This means we can directly remove the head
++      // of m_openValueEntities
++      assert(parser->m_openValueEntities == openEntity);
++      entity->open = XML_FALSE;
++      parser->m_openValueEntities = parser->m_openValueEntities->next;
++
++      /* put openEntity back in list of free instances */
++      openEntity->next = parser->m_freeValueEntities;
++      parser->m_freeValueEntities = openEntity;
++    }
++
++    // Break if an error occurred or there is nothing left to process
++    if (result
++        || (parser->m_openValueEntities == NULL && entityTextEnd == next)) {
++      break;
++    }
++  }
++
+   return result;
+ }
+ 
+diff --git a/expat/tests/alloc_tests.c b/expat/tests/alloc_tests.c
+index e5d46ebe..12ea3b2a 100644
+--- a/expat/tests/alloc_tests.c
++++ b/expat/tests/alloc_tests.c
+@@ -19,6 +19,7 @@
+    Copyright (c) 2020      Tim Gates <tim.gates@iress.com>
+    Copyright (c) 2021      Donghee Na <donghee.na@python.org>
+    Copyright (c) 2023      Sony Corporation / Snild Dolkow <snild@sony.com>
++   Copyright (c) 2025      Berkay Eren Ürün <berkay.ueruen@siemens.com>
+    Licensed under the MIT license:
+ 
+    Permission is  hereby granted,  free of charge,  to any  person obtaining
+@@ -450,6 +451,31 @@ START_TEST(test_alloc_internal_entity) {
+ }
+ END_TEST
+ 
++START_TEST(test_alloc_parameter_entity) {
++  const char *text = "<!DOCTYPE foo ["
++                     "<!ENTITY % param1 \"<!ENTITY internal 'some_text'>\">"
++                     "%param1;"
++                     "]> <foo>&internal;content</foo>";
++  int i;
++  const int alloc_test_max_repeats = 30;
++
++  for (i = 0; i < alloc_test_max_repeats; i++) {
++    g_allocation_count = i;
++    XML_SetParamEntityParsing(g_parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
++    if (_XML_Parse_SINGLE_BYTES(g_parser, text, (int)strlen(text), XML_TRUE)
++        != XML_STATUS_ERROR)
++      break;
++    alloc_teardown();
++    alloc_setup();
++  }
++  g_allocation_count = -1;
++  if (i == 0)
++    fail("Parameter entity processed despite duff allocator");
++  if (i == alloc_test_max_repeats)
++    fail("Parameter entity not processed at max allocation count");
++}
++END_TEST
++
+ /* Test the robustness against allocation failure of element handling
+  * Based on test_dtd_default_handling().
+  */
+@@ -2079,6 +2105,7 @@ make_alloc_test_case(Suite *s) {
+   tcase_add_test__ifdef_xml_dtd(tc_alloc, test_alloc_external_entity);
+   tcase_add_test__ifdef_xml_dtd(tc_alloc, test_alloc_ext_entity_set_encoding);
+   tcase_add_test__ifdef_xml_dtd(tc_alloc, test_alloc_internal_entity);
++  tcase_add_test__ifdef_xml_dtd(tc_alloc, test_alloc_parameter_entity);
+   tcase_add_test__ifdef_xml_dtd(tc_alloc, test_alloc_dtd_default_handling);
+   tcase_add_test(tc_alloc, test_alloc_explicit_encoding);
+   tcase_add_test(tc_alloc, test_alloc_set_base);
+diff --git a/expat/tests/basic_tests.c b/expat/tests/basic_tests.c
+index d2306772..29be32cf 100644
+--- a/expat/tests/basic_tests.c
++++ b/expat/tests/basic_tests.c
+@@ -10,7 +10,7 @@
+    Copyright (c) 2003      Greg Stein <gstein@users.sourceforge.net>
+    Copyright (c) 2005-2007 Steven Solie <steven@solie.ca>
+    Copyright (c) 2005-2012 Karl Waclawek <karl@waclawek.net>
+-   Copyright (c) 2016-2024 Sebastian Pipping <sebastian@pipping.org>
++   Copyright (c) 2016-2025 Sebastian Pipping <sebastian@pipping.org>
+    Copyright (c) 2017-2022 Rhodri James <rhodri@wildebeest.org.uk>
+    Copyright (c) 2017      Joe Orton <jorton@redhat.com>
+    Copyright (c) 2017      José Gutiérrez de la Concha <jose@zeroc.com>
+@@ -19,6 +19,7 @@
+    Copyright (c) 2020      Tim Gates <tim.gates@iress.com>
+    Copyright (c) 2021      Donghee Na <donghee.na@python.org>
+    Copyright (c) 2023-2024 Sony Corporation / Snild Dolkow <snild@sony.com>
++   Copyright (c) 2024-2025 Berkay Eren Ürün <berkay.ueruen@siemens.com>
+    Licensed under the MIT license:
+ 
+    Permission is  hereby granted,  free of charge,  to any  person obtaining
+@@ -1233,44 +1234,58 @@ START_TEST(test_no_indirectly_recursive_entity_refs) {
+        "<doc/>\n",
+        true},
+   };
++  const XML_Bool reset_or_not[] = {XML_TRUE, XML_FALSE};
++
+   for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); i++) {
+-    const char *const doc = cases[i].doc;
+-    const bool usesParameterEntities = cases[i].usesParameterEntities;
++    for (size_t j = 0; j < sizeof(reset_or_not) / sizeof(reset_or_not[0]);
++         j++) {
++      const XML_Bool reset_wanted = reset_or_not[j];
++      const char *const doc = cases[i].doc;
++      const bool usesParameterEntities = cases[i].usesParameterEntities;
+ 
+-    set_subtest("[%i] %s", (int)i, doc);
++      set_subtest("[%i,reset=%i] %s", (int)i, (int)j, doc);
+ 
+ #ifdef XML_DTD // both GE and DTD
+-    const bool rejection_expected = true;
++      const bool rejection_expected = true;
+ #elif XML_GE == 1 // GE but not DTD
+-    const bool rejection_expected = ! usesParameterEntities;
++      const bool rejection_expected = ! usesParameterEntities;
+ #else             // neither DTD nor GE
+-    const bool rejection_expected = false;
++      const bool rejection_expected = false;
+ #endif
+ 
+-    XML_Parser parser = XML_ParserCreate(NULL);
++      XML_Parser parser = XML_ParserCreate(NULL);
+ 
+ #ifdef XML_DTD
+-    if (usesParameterEntities) {
+-      assert_true(
+-          XML_SetParamEntityParsing(parser, XML_PARAM_ENTITY_PARSING_ALWAYS)
+-          == 1);
+-    }
++      if (usesParameterEntities) {
++        assert_true(
++            XML_SetParamEntityParsing(parser, XML_PARAM_ENTITY_PARSING_ALWAYS)
++            == 1);
++      }
+ #else
+-    UNUSED_P(usesParameterEntities);
++      UNUSED_P(usesParameterEntities);
+ #endif // XML_DTD
+ 
+-    const enum XML_Status status
+-        = _XML_Parse_SINGLE_BYTES(parser, doc, (int)strlen(doc),
+-                                  /*isFinal*/ XML_TRUE);
++      const enum XML_Status status
++          = _XML_Parse_SINGLE_BYTES(parser, doc, (int)strlen(doc),
++                                    /*isFinal*/ XML_TRUE);
+ 
+-    if (rejection_expected) {
+-      assert_true(status == XML_STATUS_ERROR);
+-      assert_true(XML_GetErrorCode(parser) == XML_ERROR_RECURSIVE_ENTITY_REF);
+-    } else {
+-      assert_true(status == XML_STATUS_OK);
++      if (rejection_expected) {
++        assert_true(status == XML_STATUS_ERROR);
++        assert_true(XML_GetErrorCode(parser) == XML_ERROR_RECURSIVE_ENTITY_REF);
++      } else {
++        assert_true(status == XML_STATUS_OK);
++      }
++
++      if (reset_wanted) {
++        // This covers free'ing of (eventually) all three open entity lists by
++        // XML_ParserReset.
++        XML_ParserReset(parser, NULL);
++      }
++
++      // This covers free'ing of (eventually) all three open entity lists by
++      // XML_ParserFree (unless XML_ParserReset has already done that above).
++      XML_ParserFree(parser);
+     }
+-
+-    XML_ParserFree(parser);
+   }
+ }
+ END_TEST
+@@ -4033,7 +4048,7 @@ START_TEST(test_skipped_null_loaded_ext_entity) {
+       = {"<!ENTITY % pe1 SYSTEM 'http://example.org/two.ent'>\n"
+          "<!ENTITY % pe2 '%pe1;'>\n"
+          "%pe2;\n",
+-         external_entity_null_loader};
++         external_entity_null_loader, NULL};
+ 
+   XML_SetUserData(g_parser, &test_data);
+   XML_SetParamEntityParsing(g_parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
+@@ -4051,7 +4066,7 @@ START_TEST(test_skipped_unloaded_ext_entity) {
+       = {"<!ENTITY % pe1 SYSTEM 'http://example.org/two.ent'>\n"
+          "<!ENTITY % pe2 '%pe1;'>\n"
+          "%pe2;\n",
+-         NULL};
++         NULL, NULL};
+ 
+   XML_SetUserData(g_parser, &test_data);
+   XML_SetParamEntityParsing(g_parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
+@@ -5351,6 +5366,151 @@ START_TEST(test_pool_integrity_with_unfinished_attr) {
+ }
+ END_TEST
+ 
++/* Test a possible early return location in internalEntityProcessor */
++START_TEST(test_entity_ref_no_elements) {
++  const char *const text = "<!DOCTYPE foo [\n"
++                           "<!ENTITY e1 \"test\">\n"
++                           "]> <foo>&e1;"; // intentionally missing newline
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++              == XML_STATUS_ERROR);
++  assert_true(XML_GetErrorCode(parser) == XML_ERROR_NO_ELEMENTS);
++  XML_ParserFree(parser);
++}
++END_TEST
++
++/* Tests if chained entity references lead to unbounded recursion */
++START_TEST(test_deep_nested_entity) {
++  const size_t N_LINES = 60000;
++  const size_t SIZE_PER_LINE = 50;
++
++  char *const text = (char *)malloc((N_LINES + 4) * SIZE_PER_LINE);
++  if (text == NULL) {
++    fail("malloc failed");
++  }
++
++  char *textPtr = text;
++
++  // Create the XML
++  textPtr += snprintf(textPtr, SIZE_PER_LINE,
++                      "<!DOCTYPE foo [\n"
++                      "	<!ENTITY s0 'deepText'>\n");
++
++  for (size_t i = 1; i < N_LINES; ++i) {
++    textPtr += snprintf(textPtr, SIZE_PER_LINE, "  <!ENTITY s%lu '&s%lu;'>\n",
++                        (long unsigned)i, (long unsigned)(i - 1));
++  }
++
++  snprintf(textPtr, SIZE_PER_LINE, "]> <foo>&s%lu;</foo>\n",
++           (long unsigned)(N_LINES - 1));
++
++  const XML_Char *const expected = XCS("deepText");
++
++  CharData storage;
++  CharData_Init(&storage);
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++
++  XML_SetCharacterDataHandler(parser, accumulate_characters);
++  XML_SetUserData(parser, &storage);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      == XML_STATUS_ERROR)
++    xml_failure(parser);
++
++  CharData_CheckXMLChars(&storage, expected);
++  XML_ParserFree(parser);
++  free(text);
++}
++END_TEST
++
++/* Tests if chained entity references in attributes
++lead to unbounded recursion */
++START_TEST(test_deep_nested_attribute_entity) {
++  const size_t N_LINES = 60000;
++  const size_t SIZE_PER_LINE = 100;
++
++  char *const text = (char *)malloc((N_LINES + 4) * SIZE_PER_LINE);
++  if (text == NULL) {
++    fail("malloc failed");
++  }
++
++  char *textPtr = text;
++
++  // Create the XML
++  textPtr += snprintf(textPtr, SIZE_PER_LINE,
++                      "<!DOCTYPE foo [\n"
++                      "	<!ENTITY s0 'deepText'>\n");
++
++  for (size_t i = 1; i < N_LINES; ++i) {
++    textPtr += snprintf(textPtr, SIZE_PER_LINE, "  <!ENTITY s%lu '&s%lu;'>\n",
++                        (long unsigned)i, (long unsigned)(i - 1));
++  }
++
++  snprintf(textPtr, SIZE_PER_LINE, "]> <foo name='&s%lu;'>mainText</foo>\n",
++           (long unsigned)(N_LINES - 1));
++
++  AttrInfo doc_info[] = {{XCS("name"), XCS("deepText")}, {NULL, NULL}};
++  ElementInfo info[] = {{XCS("foo"), 1, NULL, NULL}, {NULL, 0, NULL, NULL}};
++  info[0].attributes = doc_info;
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  ParserAndElementInfo parserPlusElemenInfo = {parser, info};
++
++  XML_SetStartElementHandler(parser, counting_start_element_handler);
++  XML_SetUserData(parser, &parserPlusElemenInfo);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      == XML_STATUS_ERROR)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++  free(text);
++}
++END_TEST
++
++START_TEST(test_deep_nested_entity_delayed_interpretation) {
++  const size_t N_LINES = 70000;
++  const size_t SIZE_PER_LINE = 100;
++
++  char *const text = (char *)malloc((N_LINES + 4) * SIZE_PER_LINE);
++  if (text == NULL) {
++    fail("malloc failed");
++  }
++
++  char *textPtr = text;
++
++  // Create the XML
++  textPtr += snprintf(textPtr, SIZE_PER_LINE,
++                      "<!DOCTYPE foo [\n"
++                      "	<!ENTITY %% s0 'deepText'>\n");
++
++  for (size_t i = 1; i < N_LINES; ++i) {
++    textPtr += snprintf(textPtr, SIZE_PER_LINE,
++                        "  <!ENTITY %% s%lu '&#37;s%lu;'>\n", (long unsigned)i,
++                        (long unsigned)(i - 1));
++  }
++
++  snprintf(textPtr, SIZE_PER_LINE,
++           "  <!ENTITY %% define_g \"<!ENTITY g '&#37;s%lu;'>\">\n"
++           "  %%define_g;\n"
++           "]>\n"
++           "<foo/>\n",
++           (long unsigned)(N_LINES - 1));
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++
++  XML_SetParamEntityParsing(parser, XML_PARAM_ENTITY_PARSING_ALWAYS);
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      == XML_STATUS_ERROR)
++    xml_failure(parser);
++
++  XML_ParserFree(parser);
++  free(text);
++}
++END_TEST
++
+ START_TEST(test_nested_entity_suspend) {
+   const char *const text = "<!DOCTYPE a [\n"
+                            "  <!ENTITY e1 '<!--e1-->'>\n"
+@@ -5381,6 +5541,35 @@ START_TEST(test_nested_entity_suspend) {
+ }
+ END_TEST
+ 
++START_TEST(test_nested_entity_suspend_2) {
++  const char *const text = "<!DOCTYPE doc [\n"
++                           "  <!ENTITY ge1 'head1Ztail1'>\n"
++                           "  <!ENTITY ge2 'head2&ge1;tail2'>\n"
++                           "  <!ENTITY ge3 'head3&ge2;tail3'>\n"
++                           "]>\n"
++                           "<doc>&ge3;</doc>";
++  const XML_Char *const expected = XCS("head3") XCS("head2") XCS("head1")
++      XCS("Z") XCS("tail1") XCS("tail2") XCS("tail3");
++  CharData storage;
++  CharData_Init(&storage);
++  XML_Parser parser = XML_ParserCreate(NULL);
++  ParserPlusStorage parserPlusStorage = {parser, &storage};
++
++  XML_SetCharacterDataHandler(parser, accumulate_char_data_and_suspend);
++  XML_SetUserData(parser, &parserPlusStorage);
++
++  enum XML_Status status = XML_Parse(parser, text, (int)strlen(text), XML_TRUE);
++  while (status == XML_STATUS_SUSPENDED) {
++    status = XML_ResumeParser(parser);
++  }
++  if (status != XML_STATUS_OK)
++    xml_failure(parser);
++
++  CharData_CheckXMLChars(&storage, expected);
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ /* Regression test for quadratic parsing on large tokens */
+ START_TEST(test_big_tokens_scale_linearly) {
+   const struct {
+@@ -6221,7 +6410,13 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic, test_empty_element_abort);
+   tcase_add_test__ifdef_xml_dtd(tc_basic,
+                                 test_pool_integrity_with_unfinished_attr);
++  tcase_add_test__if_xml_ge(tc_basic, test_entity_ref_no_elements);
++  tcase_add_test__if_xml_ge(tc_basic, test_deep_nested_entity);
++  tcase_add_test__if_xml_ge(tc_basic, test_deep_nested_attribute_entity);
++  tcase_add_test__if_xml_ge(tc_basic,
++                            test_deep_nested_entity_delayed_interpretation);
+   tcase_add_test__if_xml_ge(tc_basic, test_nested_entity_suspend);
++  tcase_add_test__if_xml_ge(tc_basic, test_nested_entity_suspend_2);
+   tcase_add_test(tc_basic, test_big_tokens_scale_linearly);
+   tcase_add_test(tc_basic, test_set_reparse_deferral);
+   tcase_add_test(tc_basic, test_reparse_deferral_is_inherited);
+diff --git a/expat/tests/handlers.c b/expat/tests/handlers.c
+index 0211985f..f15029e3 100644
+--- a/expat/tests/handlers.c
++++ b/expat/tests/handlers.c
+@@ -1882,6 +1882,20 @@ accumulate_entity_decl(void *userData, const XML_Char *entityName,
+   CharData_AppendXMLChars(storage, XCS("\n"), 1);
+ }
+ 
++void XMLCALL
++accumulate_char_data_and_suspend(void *userData, const XML_Char *s, int len) {
++  ParserPlusStorage *const parserPlusStorage = (ParserPlusStorage *)userData;
++
++  CharData_AppendXMLChars(parserPlusStorage->storage, s, len);
++
++  for (int i = 0; i < len; i++) {
++    if (s[i] == 'Z') {
++      XML_StopParser(parserPlusStorage->parser, /*resumable=*/XML_TRUE);
++      break;
++    }
++  }
++}
++
+ void XMLCALL
+ accumulate_start_element(void *userData, const XML_Char *name,
+                          const XML_Char **atts) {
+diff --git a/expat/tests/handlers.h b/expat/tests/handlers.h
+index 8850bb94..4d6a08d5 100644
+--- a/expat/tests/handlers.h
++++ b/expat/tests/handlers.h
+@@ -325,6 +325,7 @@ extern int XMLCALL external_entity_devaluer(XML_Parser parser,
+ typedef struct ext_hdlr_data {
+   const char *parse_text;
+   XML_ExternalEntityRefHandler handler;
++  CharData *storage;
+ } ExtHdlrData;
+ 
+ extern int XMLCALL external_entity_oneshot_loader(XML_Parser parser,
+@@ -569,6 +570,10 @@ extern void XMLCALL accumulate_entity_decl(
+     const XML_Char *systemId, const XML_Char *publicId,
+     const XML_Char *notationName);
+ 
++extern void XMLCALL accumulate_char_data_and_suspend(void *userData,
++                                                     const XML_Char *s,
++                                                     int len);
++
+ extern void XMLCALL accumulate_start_element(void *userData,
+                                              const XML_Char *name,
+                                              const XML_Char **atts);
+diff --git a/expat/tests/misc_tests.c b/expat/tests/misc_tests.c
+index 9afe0922..f9a78f66 100644
+--- a/expat/tests/misc_tests.c
++++ b/expat/tests/misc_tests.c
+@@ -59,6 +59,9 @@
+ #include "handlers.h"
+ #include "misc_tests.h"
+ 
++void XMLCALL accumulate_characters_ext_handler(void *userData,
++                                               const XML_Char *s, int len);
++
+ /* Test that a failure to allocate the parser structure fails gracefully */
+ START_TEST(test_misc_alloc_create_parser) {
+   XML_Memory_Handling_Suite memsuite = {duff_allocator, realloc, free};
+@@ -519,6 +522,45 @@ START_TEST(test_misc_stopparser_rejects_unstarted_parser) {
+ }
+ END_TEST
+ 
++/* Adaptation of accumulate_characters that takes ExtHdlrData input to work with
++ * test_renter_loop_finite_content below */
++void XMLCALL
++accumulate_characters_ext_handler(void *userData, const XML_Char *s, int len) {
++  ExtHdlrData *const test_data = (ExtHdlrData *)userData;
++  CharData_AppendXMLChars(test_data->storage, s, len);
++}
++
++/* Test that internalEntityProcessor does not re-enter forever;
++ * based on files tests/xmlconf/xmltest/valid/ext-sa/012.{xml,ent} */
++START_TEST(test_renter_loop_finite_content) {
++  CharData storage;
++  CharData_Init(&storage);
++  const char *const text = "<!DOCTYPE doc [\n"
++                           "<!ENTITY e1 '&e2;'>\n"
++                           "<!ENTITY e2 '&e3;'>\n"
++                           "<!ENTITY e3 SYSTEM '012.ent'>\n"
++                           "<!ENTITY e4 '&e5;'>\n"
++                           "<!ENTITY e5 '(e5)'>\n"
++                           "<!ELEMENT doc (#PCDATA)>\n"
++                           "]>\n"
++                           "<doc>&e1;</doc>\n";
++  ExtHdlrData test_data = {"&e4;\n", external_entity_null_loader, &storage};
++  const XML_Char *const expected = XCS("(e5)\n");
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++  XML_SetUserData(parser, &test_data);
++  XML_SetExternalEntityRefHandler(parser, external_entity_oneshot_loader);
++  XML_SetCharacterDataHandler(parser, accumulate_characters_ext_handler);
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      == XML_STATUS_ERROR)
++    xml_failure(parser);
++
++  CharData_CheckXMLChars(&storage, expected);
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ void
+ make_miscellaneous_test_case(Suite *s) {
+   TCase *tc_misc = tcase_create("miscellaneous tests");
+@@ -545,4 +587,5 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_char_handler_stop_without_leak);
+   tcase_add_test(tc_misc, test_misc_resumeparser_not_crashing);
+   tcase_add_test(tc_misc, test_misc_stopparser_rejects_unstarted_parser);
++  tcase_add_test__if_xml_ge(tc_misc, test_renter_loop_finite_content);
+ }
diff --git a/meta/recipes-core/expat/expat/CVE-2024-8176-02.patch b/meta/recipes-core/expat/expat/CVE-2024-8176-02.patch
new file mode 100644
index 0000000000..a22ace3be6
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-8176-02.patch
@@ -0,0 +1,248 @@
+From 5f7af592557495a99e7badaf5c03362a20650156 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Thu, 27 Mar 2025 20:28:26 +0100
+Subject: [PATCH] Stop updating event pointer on exit for reentry (fixes #980)
+ #989
+
+Fixes #980
+
+CVE: CVE-2024-8176
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/989]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ expat/Changes            | 15 ++++++++++++
+ expat/lib/xmlparse.c     | 12 ++++++---
+ expat/tests/common.c     | 25 +++++++++++++++++++
+ expat/tests/common.h     |  2 ++
+ expat/tests/misc_tests.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 112 insertions(+), 3 deletions(-)
+
+diff --git a/expat/Changes b/expat/Changes
+index 8c5db88c..7ba33497 100644
+--- a/expat/Changes
++++ b/expat/Changes
+@@ -30,6 +30,21 @@
+ !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
+ 
+ Patches:
++        Bug fixes:
++       #980 #989  Restore event pointer behavior from Expat 2.6.4
++                    (that the fix to CVE-2024-8176 changed in 2.7.0);
++                    affected API functions are:
++                    - XML_GetCurrentByteCount
++                    - XML_GetCurrentByteIndex
++                    - XML_GetCurrentColumnNumber
++                    - XML_GetCurrentLineNumber
++                    - XML_GetInputContext
++
++        Special thanks to:
++            Berkay Eren Ürün
++                 and
++            Perl XML::Parser
++
+         Security fixes:
+        #893 #???  CVE-2024-8176 -- Fix crash from chaining a large number
+                     of entities caused by stack overflow by resolving use of
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 473c791d..c6085d38 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -3402,12 +3402,13 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       break;
+       /* LCOV_EXCL_STOP */
+     }
+-    *eventPP = s = next;
+     switch (parser->m_parsingStatus.parsing) {
+     case XML_SUSPENDED:
++      *eventPP = next;
+       *nextPtr = next;
+       return XML_ERROR_NONE;
+     case XML_FINISHED:
++      *eventPP = next;
+       return XML_ERROR_ABORTED;
+     case XML_PARSING:
+       if (parser->m_reenter) {
+@@ -3416,6 +3417,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+       }
+       /* Fall through */
+     default:;
++      *eventPP = s = next;
+     }
+   }
+   /* not reached */
+@@ -4332,12 +4334,13 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+       /* LCOV_EXCL_STOP */
+     }
+ 
+-    *eventPP = s = next;
+     switch (parser->m_parsingStatus.parsing) {
+     case XML_SUSPENDED:
++      *eventPP = next;
+       *nextPtr = next;
+       return XML_ERROR_NONE;
+     case XML_FINISHED:
++      *eventPP = next;
+       return XML_ERROR_ABORTED;
+     case XML_PARSING:
+       if (parser->m_reenter) {
+@@ -4345,6 +4348,7 @@ doCdataSection(XML_Parser parser, const ENCODING *enc, const char **startPtr,
+       }
+       /* Fall through */
+     default:;
++      *eventPP = s = next;
+     }
+   }
+   /* not reached */
+@@ -5951,12 +5955,13 @@ epilogProcessor(XML_Parser parser, const char *s, const char *end,
+     default:
+       return XML_ERROR_JUNK_AFTER_DOC_ELEMENT;
+     }
+-    parser->m_eventPtr = s = next;
+     switch (parser->m_parsingStatus.parsing) {
+     case XML_SUSPENDED:
++      parser->m_eventPtr = next;
+       *nextPtr = next;
+       return XML_ERROR_NONE;
+     case XML_FINISHED:
++      parser->m_eventPtr = next;
+       return XML_ERROR_ABORTED;
+     case XML_PARSING:
+       if (parser->m_reenter) {
+@@ -5964,6 +5969,7 @@ epilogProcessor(XML_Parser parser, const char *s, const char *end,
+       }
+     /* Fall through */
+     default:;
++      parser->m_eventPtr = s = next;
+     }
+   }
+ }
+diff --git a/expat/tests/common.c b/expat/tests/common.c
+index 3aea8d74..b267dbb3 100644
+--- a/expat/tests/common.c
++++ b/expat/tests/common.c
+@@ -42,6 +42,8 @@
+ */
+ 
+ #include <assert.h>
++#include <errno.h>
++#include <stdint.h> // for SIZE_MAX
+ #include <stdio.h>
+ #include <string.h>
+ 
+@@ -294,3 +296,26 @@ duff_reallocator(void *ptr, size_t size) {
+     g_reallocation_count--;
+   return realloc(ptr, size);
+ }
++
++// Portable remake of strndup(3) for C99; does not care about space efficiency
++char *
++portable_strndup(const char *s, size_t n) {
++  if ((s == NULL) || (n == SIZE_MAX)) {
++    errno = EINVAL;
++    return NULL;
++  }
++
++  char *const buffer = (char *)malloc(n + 1);
++  if (buffer == NULL) {
++    errno = ENOMEM;
++    return NULL;
++  }
++
++  errno = 0;
++
++  memcpy(buffer, s, n);
++
++  buffer[n] = '\0';
++
++  return buffer;
++}
+diff --git a/expat/tests/common.h b/expat/tests/common.h
+index bc4c7da6..88711308 100644
+--- a/expat/tests/common.h
++++ b/expat/tests/common.h
+@@ -146,6 +146,8 @@ extern void *duff_allocator(size_t size);
+ 
+ extern void *duff_reallocator(void *ptr, size_t size);
+ 
++extern char *portable_strndup(const char *s, size_t n);
++
+ #endif /* XML_COMMON_H */
+ 
+ #ifdef __cplusplus
+diff --git a/expat/tests/misc_tests.c b/expat/tests/misc_tests.c
+index f9a78f66..2b9f793b 100644
+--- a/expat/tests/misc_tests.c
++++ b/expat/tests/misc_tests.c
+@@ -561,6 +561,66 @@ START_TEST(test_renter_loop_finite_content) {
+ }
+ END_TEST
+ 
++// Inspired by function XML_OriginalString of Perl's XML::Parser
++static char *
++dup_original_string(XML_Parser parser) {
++  const int byte_count = XML_GetCurrentByteCount(parser);
++
++  assert_true(byte_count >= 0);
++
++  int offset = -1;
++  int size = -1;
++
++  const char *const context = XML_GetInputContext(parser, &offset, &size);
++
++#if XML_CONTEXT_BYTES > 0
++  assert_true(context != NULL);
++  assert_true(offset >= 0);
++  assert_true(size >= 0);
++  return portable_strndup(context + offset, byte_count);
++#else
++  assert_true(context == NULL);
++  return NULL;
++#endif
++}
++
++static void
++on_characters_issue_980(void *userData, const XML_Char *s, int len) {
++  (void)s;
++  (void)len;
++  XML_Parser parser = (XML_Parser)userData;
++
++  char *const original_string = dup_original_string(parser);
++
++#if XML_CONTEXT_BYTES > 0
++  assert_true(original_string != NULL);
++  assert_true(strcmp(original_string, "&draft.day;") == 0);
++  free(original_string);
++#else
++  assert_true(original_string == NULL);
++#endif
++}
++
++START_TEST(test_misc_expected_event_ptr_issue_980) {
++  // NOTE: This is a tiny subset of sample "REC-xml-19980210.xml"
++  //       from Perl's XML::Parser
++  const char *const doc = "<!DOCTYPE day [\n"
++                          "  <!ENTITY draft.day '10'>\n"
++                          "]>\n"
++                          "<day>&draft.day;</day>\n";
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  XML_SetUserData(parser, parser);
++  XML_SetCharacterDataHandler(parser, on_characters_issue_980);
++
++  assert_true(_XML_Parse_SINGLE_BYTES(parser, doc, (int)strlen(doc),
++                                      /*isFinal=*/XML_TRUE)
++              == XML_STATUS_OK);
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ void
+ make_miscellaneous_test_case(Suite *s) {
+   TCase *tc_misc = tcase_create("miscellaneous tests");
+@@ -588,4 +648,5 @@ make_miscellaneous_test_case(Suite *s) {
+   tcase_add_test(tc_misc, test_misc_resumeparser_not_crashing);
+   tcase_add_test(tc_misc, test_misc_stopparser_rejects_unstarted_parser);
+   tcase_add_test__if_xml_ge(tc_misc, test_renter_loop_finite_content);
++  tcase_add_test(tc_misc, test_misc_expected_event_ptr_issue_980);
+ }
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index f383792793..ab0b1d54c1 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -10,6 +10,9 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://0001-tests-Cover-indirect-entity-recursion.patch;striplevel=2 \
+           file://CVE-2024-8176-01.patch;striplevel=2 \
+           file://CVE-2024-8176-02.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

