Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B76CA9EDC
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23578.1791708089180511505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XLFkzY3A;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso526360f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708087; x=1792312887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5gG7Et9uPnCeX6lRaluTF0fSQ7mKVwIZFeuZCKBQaOM=;
        b=XLFkzY3A3xTOESK+8vQA/6b/dIuvV014mBfxGVjUxxhVpViayp1wQns02WLWQVzmCo
         K6PJR/wUbZPmPit3TIrDT8XOnUX8bacbp9W4uWwYwXXJxJ1/Cb+4IdCUYXcZpPNdk65l
         djqYhL6EmS2rfAkQHbftJ+/lPmK/OpQ47oZJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708087; x=1792312887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5gG7Et9uPnCeX6lRaluTF0fSQ7mKVwIZFeuZCKBQaOM=;
        b=cLWwfBEBURYipx/tMvT6AstkFriFJ5Ib++9BCCQrHkW8RKxL9srSdI0oEzfjcCd/IW
         x6PkDRoinPjV1REGzLx5XqKWg1HkFlSDegZ43xkNpoUXcpaDHxnRG5mALQrPrYbYb65y
         7sKdZx9Mr1eQag6HItxaOpN0hsFfdH98xjG4wvCXI5QjLbZJfe7K+Cqjfk6vs1k28aPb
         h5XdAmZ9WRTjkV8DUQxZlcOGT3aLjFUjYJYNawx9vfZLAw0z/oORs81hMIO18PxD+e87
         1fVmF8BTLRWI8PeGfadc1BWj0fHMwj8A8kAT1328bInoBvuv6upVPVbCiuEw4hmewK+d
         bwNQ==
X-Gm-Message-State: AFq9FYJEIq6brOGW1TrFrCrxp+OBJA9CO0zLdIsO4/0sEMksTsXUP1pD
	2CnCOTtlPWA6SpH9KLcKAOis78sX5IlERErCseEnaKREFV2kDC8DxzkI20qH925B096KrThRFS1
	+t6nA0Cw=
X-Gm-Gg: AYBFou2LnJ+Bed2T/sBbwh7cJvSCW1qix6hPvJTrDOMA+P0l1viHK3vmR+jEAVreRFT
	h26q2Th0dRyEKfZz06Dl4FIZ++VAgXnaTrlMueZ3GrGV5GDG5N29CnFLk/ObrNkRjSISgAYfHlb
	YIZ3YXY/cNw/FlSeALXpPAHksHd926W8N/PFS0dBrVfL4GNVJhO3/KqPwp1bkfNq3GNXjMos22f
	3oDh64y/ndaDmLYD7/NZSA2uF9wPzdjBQBNqlQBWTNFHY44ZI3PsbTA07RvNlydMaBWop/3y0dC
	+prYDNeMVR/BfIjbFF3Q8YFIk6N7FaADFG3W19flr/4RVlwudDr2k5a6tEBsNH2XrpM7JFHZo/4
	9Wkq1K2wgaRyGKxxsZ+JhXor+Z8UzFD+/A7LyctQz0D6ykcVOA4fy7zSGz/VPCxsOJJCa1yX1ke
	tB2KnPFuCC5X6OqtuMqAL5tzPIOqM8EJLh36PFq6hlwSHE5Qi+4+KbADnj0JuyeYJxrKGPckgSp
	6MDJW7l1r5k0MuFzzK8BYJNEZrGpv/gYjFhNYQkrgnODoa9PGiUE3k3O7XRrlasVaMFJtspjQ==
X-Received: by 2002:adf:e012:0:10b0:48c:4d32:ccfd with SMTP id ffacd0b85a97d-48dba7845d7mr8320510f8f.6.1791708087070;
        Sun, 11 Oct 2026 01:41:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 40/60] expat: patch CVE-2026-66046 and CVE-2026-76641
Date: Sun, 11 Oct 2026 10:40:13 +0200
Message-ID: <132d54c85a8ad4611539c83d2b32b9d0b5de40a6.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247549

From: Peter Marko <peter.marko@siemens.com>

Pick patches per [1] and [2].
(fix for CVE-2026-66046 introduces CVE-2026-76641)

[1] https://security-tracker.debian.org/tracker/CVE-2026-66046
[2] https://security-tracker.debian.org/tracker/CVE-2026-76641

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed CVE: tags in CVE-2026-66046-{01,02}.patch ]
---
 .../expat/expat/CVE-2026-66046-01.patch       | 107 ++++++++++++
 .../expat/expat/CVE-2026-66046-02.patch       |  90 ++++++++++
 .../expat/expat/CVE-2026-76641.patch          | 160 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.8.3.bb        |   3 +
 4 files changed, 360 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-66046-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-66046-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-76641.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-66046-01.patch b/meta/recipes-core/expat/expat/CVE-2026-66046-01.patch
new file mode 100644
index 00000000000..e7b3d467899
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-66046-01.patch
@@ -0,0 +1,107 @@
+From 98f5acc146af76859cd7c345c0906e9e9e8ea656 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 13 Aug 2026 15:47:24 +0200
+Subject: [PATCH] lib: Rename hash table `defaultAttsNames` to
+ `defaultAttForName`
+
+It was previously used as a "set". This prepares for the upcoming
+change to a true "dictionary".
+
+CVE: CVE-2026-66046
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/98f5acc146af76859cd7c345c0906e9e9e8ea656]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index e5242480..239dc6de 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -394,7 +394,7 @@ typedef struct {
+   size_t nDefaultAtts;
+   size_t allocDefaultAtts;
+   DEFAULT_ATTRIBUTE *defaultAtts;
+-  HASH_TABLE defaultAttsNames;
++  HASH_TABLE defaultAttForName;
+ } ELEMENT_TYPE;
+ 
+ typedef struct {
+@@ -3837,8 +3837,8 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+                                          sizeof(ELEMENT_TYPE));
+     if (! elementType)
+       return XML_ERROR_NO_MEMORY;
+-    if (! elementType->defaultAttsNames.parser)
+-      hashTableInit(&(elementType->defaultAttsNames), parser);
++    if (! elementType->defaultAttForName.parser)
++      hashTableInit(&(elementType->defaultAttForName), parser);
+     if (parser->m_ns && ! setElementTypePrefix(parser, elementType))
+       return XML_ERROR_NO_MEMORY;
+   }
+@@ -7239,7 +7239,7 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+     /* The handling of default attributes gets messed up if we have
+        a default which duplicates a non-default. */
+     NAMED *const nameFound
+-        = lookup(parser, &(type->defaultAttsNames), attId->name, 0);
++        = lookup(parser, &(type->defaultAttForName), attId->name, 0);
+     if (nameFound)
+       return 1;
+     if (isId && ! type->idAtt && ! attId->xmlns)
+@@ -7276,7 +7276,7 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+     attId->maybeTokenized = XML_TRUE;
+ 
+   NAMED *const nameAddedOrFound
+-      = lookup(parser, &(type->defaultAttsNames), attId->name, sizeof(NAMED));
++      = lookup(parser, &(type->defaultAttForName), attId->name, sizeof(NAMED));
+   if (! nameAddedOrFound)
+     return 0;
+ 
+@@ -7597,7 +7597,7 @@ dtdReset(DTD *p, XML_Parser parser) {
+     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
+     if (! e)
+       break;
+-    hashTableDestroy(&(e->defaultAttsNames));
++    hashTableDestroy(&(e->defaultAttForName));
+     FREE(parser, e->defaultAtts);
+   }
+   hashTableClear(&(p->generalEntities));
+@@ -7639,7 +7639,7 @@ dtdDestroy(DTD *p, XML_Bool isDocEntity, XML_Parser parser) {
+     ELEMENT_TYPE *e = (ELEMENT_TYPE *)hashTableIterNext(&iter);
+     if (! e)
+       break;
+-    hashTableDestroy(&(e->defaultAttsNames));
++    hashTableDestroy(&(e->defaultAttForName));
+     FREE(parser, e->defaultAtts);
+   }
+   hashTableDestroy(&(p->generalEntities));
+@@ -7732,8 +7732,8 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+     if (! newE)
+       return 0;
+ 
+-    if (! newE->defaultAttsNames.parser)
+-      hashTableInit(&(newE->defaultAttsNames), parser);
++    if (! newE->defaultAttForName.parser)
++      hashTableInit(&(newE->defaultAttForName), parser);
+ 
+     if (oldE->nDefaultAtts) {
+       /* Detect and prevent integer overflow. */
+@@ -7766,7 +7766,7 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+       } else
+         newE->defaultAtts[i].value = NULL;
+ 
+-      NAMED *const nameAddedOrFound = lookup(parser, &(newE->defaultAttsNames),
++      NAMED *const nameAddedOrFound = lookup(parser, &(newE->defaultAttForName),
+                                              attributeName, sizeof(NAMED));
+       if (! nameAddedOrFound) {
+         return 0;
+@@ -8535,8 +8535,8 @@ getElementType(XML_Parser parser, const ENCODING *enc, const char *ptr,
+                                sizeof(ELEMENT_TYPE));
+   if (! ret)
+     return NULL;
+-  if (! ret->defaultAttsNames.parser)
+-    hashTableInit(&(ret->defaultAttsNames), getRootParserOf(parser, NULL));
++  if (! ret->defaultAttForName.parser)
++    hashTableInit(&(ret->defaultAttForName), getRootParserOf(parser, NULL));
+   if (ret->name != name)
+     poolDiscard(&dtd->pool);
+   else {
diff --git a/meta/recipes-core/expat/expat/CVE-2026-66046-02.patch b/meta/recipes-core/expat/expat/CVE-2026-66046-02.patch
new file mode 100644
index 00000000000..90e10514b50
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-66046-02.patch
@@ -0,0 +1,90 @@
+From f8f7c4ffd883e3c2c58f0ebb49416a6c1d248738 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 13 Aug 2026 16:39:35 +0200
+Subject: [PATCH] lib: Migrate .isCdata lookup from a linear loop to a hash
+ table lookup
+
+.. to resolve quadratic runtime
+
+CVE: CVE-2026-66046
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/f8f7c4ffd883e3c2c58f0ebb49416a6c1d248738]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 40 insertions(+), 8 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 239dc6de..1cd20125 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -381,6 +381,22 @@ typedef struct {
+   const XML_Char *value;
+ } DEFAULT_ATTRIBUTE;
+ 
++// This structure allows mapping attribute names to instances of
++// `DEFAULT_ATTRIBUTE`.
++typedef struct {
++  // Member `name` goes first to make this structure compatible with structure
++  // `NAMED` (further up), which is needed to support use of structure
++  // `NAME_AND_DEFAULT_ATTRIBUTE` in a hash table as implemented by function
++  // `lookup` (further down).
++  const XML_Char *name;
++  // We would store a `DEFAULT_ATTRIBUTE *` here but the backing array
++  // can be reallocated which would invalidate the pointer. Using an index
++  // into the array instead, avoids that problem.
++  size_t attIndex;
++  // This is set to `false` by function `lookup`.
++  bool initialized;
++} NAME_AND_DEFAULT_ATTRIBUTE;
++
+ typedef struct {
+   unsigned long version;
+   unsigned long hash;
+@@ -3951,11 +3967,14 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+ 
+       /* figure out whether declared as other than CDATA */
+       if (attId->maybeTokenized) {
+-        for (size_t j = 0; j < nDefaultAtts; j++) {
+-          if (attId == elementType->defaultAtts[j].id) {
+-            isCdata = elementType->defaultAtts[j].isCdata;
+-            break;
+-          }
++        NAME_AND_DEFAULT_ATTRIBUTE *const nameAndDefaultAttribute
++            = (NAME_AND_DEFAULT_ATTRIBUTE *)lookup(
++                parser, &(elementType->defaultAttForName), attId->name, 0);
++        if (nameAndDefaultAttribute != NULL) {
++          assert(nameAndDefaultAttribute->attIndex < elementType->nDefaultAtts);
++          const DEFAULT_ATTRIBUTE *const att
++              = elementType->defaultAtts + nameAndDefaultAttribute->attIndex;
++          isCdata = att->isCdata;
+         }
+       }
+ 
+@@ -7275,11 +7294,24 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+   if (! isCdata)
+     attId->maybeTokenized = XML_TRUE;
+ 
+-  NAMED *const nameAddedOrFound
+-      = lookup(parser, &(type->defaultAttForName), attId->name, sizeof(NAMED));
+-  if (! nameAddedOrFound)
++  NAME_AND_DEFAULT_ATTRIBUTE *const nameAndDefaultAttribute
++      = (NAME_AND_DEFAULT_ATTRIBUTE *)lookup(
++          parser, &(type->defaultAttForName), attId->name,
++          sizeof(NAME_AND_DEFAULT_ATTRIBUTE));
++  if (! nameAndDefaultAttribute)
+     return 0;
+ 
++  assert(nameAndDefaultAttribute->name == attId->name);
++
++  // NOTE: The XML 1.0r4 spec says:
++  // "When more than one definition is provided for the same attribute of a
++  // given element type, the first declaration is binding and later
++  // declarations are ignored."
++  if (! nameAndDefaultAttribute->initialized) {
++    nameAndDefaultAttribute->attIndex = type->nDefaultAtts;
++    nameAndDefaultAttribute->initialized = true;
++  }
++
+   type->nDefaultAtts += 1;
+   return 1;
+ }
diff --git a/meta/recipes-core/expat/expat/CVE-2026-76641.patch b/meta/recipes-core/expat/expat/CVE-2026-76641.patch
new file mode 100644
index 00000000000..26fa5704a6e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-76641.patch
@@ -0,0 +1,160 @@
+From 98599f6dcc2b460410881fe420f5f55d6bec63bf Mon Sep 17 00:00:00 2001
+From: Zeyou Liu <zeyouliu@tencent.com>
+Date: Thu, 20 Aug 2026 20:29:56 +0800
+Subject: [PATCH] lib: Fix out-of-bounds read from hash table entries created
+ by dtdCopy
+
+Commit f8f7c4ff grew the entries of ELEMENT_TYPE member
+.defaultAttForName from structure NAMED to the larger structure
+NAME_AND_DEFAULT_ATTRIBUTE and adjusted function defineAttribute
+accordingly, but function dtdCopy kept creating entries of size
+sizeof(NAMED).  Because function lookup allocates exactly createSize
+bytes, function storeAtts reads member .attIndex past the end of those
+entries whenever attributes are parsed by a parser that was created by
+XML_ExternalEntityParserCreate.
+
+That out-of-bounds value is then used as an index into member
+.defaultAtts, so the effects range from silently not normalizing
+whitespace in attributes that are not of type CDATA, to dereferencing a
+wild pointer: a release build of master segfaults in function storeAtts
+on the document used by the new test.  A zero-filled heap happens to
+yield index 0, which is why the existing tests did not catch this.
+
+Member .attIndex is now stored the way function defineAttribute stores
+it, i.e. keeping the index of the first declaration, so that a copied
+DTD resolves attributes exactly like the DTD that it was copied from.
+
+This was found while backporting the fix for CVE-2026-66046 onto Expat
+2.6.4 for the OpenCloudOS Stream distribution.  Only master is affected,
+no released version of Expat contains commit f8f7c4ff.
+
+CVE: CVE-2026-76641
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/98599f6dcc2b460410881fe420f5f55d6bec63bf]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c      | 17 +++++++--
+ tests/basic_tests.c | 74 +++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 88 insertions(+), 3 deletions(-)
+
+diff --git a/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 10592ac3..e72c4570 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7800,11 +7800,22 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const DTD *oldDtd,
+       } else
+         newE->defaultAtts[i].value = NULL;
+ 
+-      NAMED *const nameAddedOrFound = lookup(parser, &(newE->defaultAttForName),
+-                                             attributeName, sizeof(NAMED));
+-      if (! nameAddedOrFound) {
++      NAME_AND_DEFAULT_ATTRIBUTE *const nameAndDefaultAttribute
++          = (NAME_AND_DEFAULT_ATTRIBUTE *)lookup(
++              parser, &(newE->defaultAttForName), attributeName,
++              sizeof(NAME_AND_DEFAULT_ATTRIBUTE));
++      if (! nameAndDefaultAttribute) {
+         return 0;
+       }
++
++      // NOTE: The XML 1.0r4 spec says:
++      // "When more than one definition is provided for the same attribute of a
++      // given element type, the first declaration is binding and later
++      // declarations are ignored."
++      if (! nameAndDefaultAttribute->initialized) {
++        nameAndDefaultAttribute->attIndex = i;
++        nameAndDefaultAttribute->initialized = true;
++      }
+     }
+   }
+ 
+diff --git a/tests/basic_tests.c b/expat/tests/basic_tests.c
+index 308adf6c..6c2d3280 100644
+--- a/tests/basic_tests.c
++++ b/tests/basic_tests.c
+@@ -2809,6 +2809,79 @@ START_TEST(test_duplicate_id_attribute_multiple_attlistdecl) {
+ }
+ END_TEST
+ 
++static void XMLCALL
++check_second_attr_normalization(void *userData, const XML_Char *name,
++                                const XML_Char **atts) {
++  int *const seen_second = userData;
++  UNUSED_P(name);
++
++  for (size_t i = 0; atts[i] != NULL; i += 2) {
++    const XML_Char *const key = atts[i];
++    const XML_Char *const value = atts[i + 1];
++    if (xcstrcmp(key, XCS("second")) != 0)
++      continue;
++    *seen_second = 1;
++    /* Attribute "second" is not of type CDATA, so leading, trailing and
++     * repeated whitespace is to be normalized away. */
++    if (xcstrcmp(value, XCS("a b")) != 0)
++      fail("Attribute of non-CDATA type was not whitespace-normalized");
++  }
++}
++
++static int XMLCALL
++external_entity_attr_checker(XML_Parser parser, const XML_Char *context,
++                             const XML_Char *base, const XML_Char *systemId,
++                             const XML_Char *publicId) {
++  const char *const text = "<tag second=' a  b '/>";
++  UNUSED_P(base);
++  UNUSED_P(systemId);
++  UNUSED_P(publicId);
++
++  XML_Parser ext_parser = XML_ExternalEntityParserCreate(parser, context, NULL);
++  if (ext_parser == NULL)
++    fail("Could not create external entity parser");
++
++  if (_XML_Parse_SINGLE_BYTES(ext_parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(ext_parser);
++
++  XML_ParserFree(ext_parser);
++  return XML_STATUS_OK;
++}
++
++START_TEST(test_default_attr_index_after_dtd_copy) {
++  /* Function storeAtts resolves member .attIndex of structure
++   * NAME_AND_DEFAULT_ATTRIBUTE to tell whether an attribute value needs
++   * whitespace normalization, so function dtdCopy needs to carry that index
++   * over to the copy.  Attribute "first" is declared before attribute
++   * "second" so that a mixed-up index resolves to the wrong declaration.
++   */
++  const char *text = "<!DOCTYPE doc [\n"
++                     "  <!ENTITY e SYSTEM 'entity.ent'>\n"
++                     "  <!ELEMENT doc ANY>\n"
++                     "  <!ELEMENT tag EMPTY>\n"
++                     "  <!ATTLIST tag first CDATA #IMPLIED>\n"
++                     "  <!ATTLIST tag second NMTOKENS #IMPLIED>\n"
++                     "]>\n"
++                     "<doc>&e;</doc>\n";
++  int seen_second = 0;
++
++  XML_Parser parser = XML_ParserCreate(NULL);
++  assert_true(parser != NULL);
++  XML_SetUserData(parser, &seen_second);
++  XML_SetExternalEntityRefHandler(parser, external_entity_attr_checker);
++  XML_SetStartElementHandler(parser, check_second_attr_normalization);
++
++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE)
++      != XML_STATUS_OK)
++    xml_failure(parser);
++  if (! seen_second)
++    fail("Attribute \"second\" has not been reported");
++
++  XML_ParserFree(parser);
++}
++END_TEST
++
+ /* Test reset works correctly in the middle of processing an internal
+  * entity.  Exercises some obscure code in XML_ParserReset().
+  */
+@@ -6737,6 +6810,7 @@ make_basic_test_case(Suite *s) {
+   tcase_add_test(tc_basic,
+                  test_duplicate_cdata_attribute_multiple_attlistdecl_3);
+   tcase_add_test(tc_basic, test_duplicate_id_attribute_multiple_attlistdecl);
++  tcase_add_test__if_xml_ge(tc_basic, test_default_attr_index_after_dtd_copy);
+   tcase_add_test__if_xml_ge(tc_basic, test_reset_in_entity);
+   tcase_add_test(tc_basic, test_resume_invalid_parse);
+   tcase_add_test(tc_basic, test_resume_resuspended);
diff --git a/meta/recipes-core/expat/expat_2.8.3.bb b/meta/recipes-core/expat/expat_2.8.3.bb
index 79e8c15227a..5d30a844fa0 100644
--- a/meta/recipes-core/expat/expat_2.8.3.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -10,6 +10,9 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://CVE-2026-66046-01.patch \
+           file://CVE-2026-66046-02.patch \
+           file://CVE-2026-76641.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

