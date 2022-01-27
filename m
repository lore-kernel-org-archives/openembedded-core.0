Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3B4C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 05:10:45 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.24368.1643260217446113039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 21:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=cooaxb+L;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643260239; x=1674796239;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dCTazkBvka+5dFEVoJ+dA7JY1KSt4sohaxj7/jcUVsI=;
  b=cooaxb+Lk9jUrOppSPGTIyQdASxu722bCl5daosXr3qRmdj5pHabYINd
   nNp3tO+sxkTLKbSd5O0VDhY8QCHxcXFbWNck66CYPZN9k/AnxM0/tFVTL
   lUzh/YzUHFjYS+7fHA5edZqZAIcN64pI19S8XNw+IcDMc07typoaIymEg
   8DyNbFd+RAJoj0w9YuyI2hQ/YRd39N6CltCJ4Qox7pY0DNp69L/yVg2x1
   HqSfGeJ9kbg+lCw7ej26IhcUhTGG3AWaWeN9FZx7o5Inw9E01/47pR89j
   ZU+W3u479EgolzsGP5kDW/Oc8W5u0jhHx8CqjgOABlwjChIkkx3EqBTuT
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245590372"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="245590372"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="618209063"
Received: from huiyinkx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.134.201])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:38 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/17] expat fix CVE-2022-22822 through
 CVE-2022-22827
Date: Thu, 27 Jan 2022 13:10:06 +0800
Message-Id: 
 <0d195a98703d690a348719f77e7be78653d14ad3.1643259953.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643259953.git.anuj.mittal@intel.com>
References: <cover.1643259953.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 05:10:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161016

From: Steve Sakoman <steve@sakoman.com>

xmlparse.c has multiple integer overflows. The involved functions are:

- addBinding (CVE-2022-22822)
- build_model (CVE-2022-22823)
- defineAttribute (CVE-2022-22824)
- lookup (CVE-2022-22825)
- nextScaffoldPart (CVE-2022-22826)
- storeAtts (CVE-2022-22827)

Backport patch from:
https://github.com/libexpat/libexpat/pull/539/commits/9f93e8036e842329863bf20395b8fb8f73834d9e

CVE: CVE-2022-22822 CVE-2022-22823 CVE-2022-22824 CVE-2022-22825 CVE-2022-22826 CVE-2022-22827
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 3b6c47c0ebae9fdb7a13480daf8f46a8dbb2c9bd)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../expat/expat/CVE-2022-22822-27.patch       | 257 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |   1 +
 2 files changed, 258 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-22822-27.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-22822-27.patch b/meta/recipes-core/expat/expat/CVE-2022-22822-27.patch
new file mode 100644
index 0000000000..e569fbc7ab
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-22822-27.patch
@@ -0,0 +1,257 @@
+From 9f93e8036e842329863bf20395b8fb8f73834d9e Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 30 Dec 2021 22:46:03 +0100
+Subject: [PATCH] lib: Prevent integer overflow at multiple places
+ (CVE-2022-22822 to CVE-2022-22827)
+
+The involved functions are:
+- addBinding (CVE-2022-22822)
+- build_model (CVE-2022-22823)
+- defineAttribute (CVE-2022-22824)
+- lookup (CVE-2022-22825)
+- nextScaffoldPart (CVE-2022-22826)
+- storeAtts (CVE-2022-22827)
+
+Upstream-Status: Backport:
+https://github.com/libexpat/libexpat/pull/539/commits/9f93e8036e842329863bf20395b8fb8f73834d9e
+
+CVE: CVE-2022-22822 CVE-2022-22823 CVE-2022-22824 CVE-2022-22825 CVE-2022-22826 CVE-2022-22827
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ expat/lib/xmlparse.c | 153 ++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 151 insertions(+), 2 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 8f243126..575e73ee 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3261,13 +3261,38 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+ 
+   /* get the attributes from the tokenizer */
+   n = XmlGetAttributes(enc, attStr, parser->m_attsSize, parser->m_atts);
++
++  /* Detect and prevent integer overflow */
++  if (n > INT_MAX - nDefaultAtts) {
++    return XML_ERROR_NO_MEMORY;
++  }
++
+   if (n + nDefaultAtts > parser->m_attsSize) {
+     int oldAttsSize = parser->m_attsSize;
+     ATTRIBUTE *temp;
+ #ifdef XML_ATTR_INFO
+     XML_AttrInfo *temp2;
+ #endif
++
++    /* Detect and prevent integer overflow */
++    if ((nDefaultAtts > INT_MAX - INIT_ATTS_SIZE)
++        || (n > INT_MAX - (nDefaultAtts + INIT_ATTS_SIZE))) {
++      return XML_ERROR_NO_MEMORY;
++    }
++
+     parser->m_attsSize = n + nDefaultAtts + INIT_ATTS_SIZE;
++
++    /* Detect and prevent integer overflow.
++     * The preprocessor guard addresses the "always false" warning
++     * from -Wtype-limits on platforms where
++     * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++    if ((unsigned)parser->m_attsSize > (size_t)(-1) / sizeof(ATTRIBUTE)) {
++      parser->m_attsSize = oldAttsSize;
++      return XML_ERROR_NO_MEMORY;
++    }
++#endif
++
+     temp = (ATTRIBUTE *)REALLOC(parser, (void *)parser->m_atts,
+                                 parser->m_attsSize * sizeof(ATTRIBUTE));
+     if (temp == NULL) {
+@@ -3276,6 +3301,17 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+     }
+     parser->m_atts = temp;
+ #ifdef XML_ATTR_INFO
++    /* Detect and prevent integer overflow.
++     * The preprocessor guard addresses the "always false" warning
++     * from -Wtype-limits on platforms where
++     * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#  if UINT_MAX >= SIZE_MAX
++    if ((unsigned)parser->m_attsSize > (size_t)(-1) / sizeof(XML_AttrInfo)) {
++      parser->m_attsSize = oldAttsSize;
++      return XML_ERROR_NO_MEMORY;
++    }
++#  endif
++
+     temp2 = (XML_AttrInfo *)REALLOC(parser, (void *)parser->m_attInfo,
+                                     parser->m_attsSize * sizeof(XML_AttrInfo));
+     if (temp2 == NULL) {
+@@ -3610,9 +3646,31 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+   tagNamePtr->prefixLen = prefixLen;
+   for (i = 0; localPart[i++];)
+     ; /* i includes null terminator */
++
++  /* Detect and prevent integer overflow */
++  if (binding->uriLen > INT_MAX - prefixLen
++      || i > INT_MAX - (binding->uriLen + prefixLen)) {
++    return XML_ERROR_NO_MEMORY;
++  }
++
+   n = i + binding->uriLen + prefixLen;
+   if (n > binding->uriAlloc) {
+     TAG *p;
++
++    /* Detect and prevent integer overflow */
++    if (n > INT_MAX - EXPAND_SPARE) {
++      return XML_ERROR_NO_MEMORY;
++    }
++    /* Detect and prevent integer overflow.
++     * The preprocessor guard addresses the "always false" warning
++     * from -Wtype-limits on platforms where
++     * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++    if ((unsigned)(n + EXPAND_SPARE) > (size_t)(-1) / sizeof(XML_Char)) {
++      return XML_ERROR_NO_MEMORY;
++    }
++#endif
++
+     uri = (XML_Char *)MALLOC(parser, (n + EXPAND_SPARE) * sizeof(XML_Char));
+     if (! uri)
+       return XML_ERROR_NO_MEMORY;
+@@ -3708,6 +3766,21 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+   if (parser->m_freeBindingList) {
+     b = parser->m_freeBindingList;
+     if (len > b->uriAlloc) {
++      /* Detect and prevent integer overflow */
++      if (len > INT_MAX - EXPAND_SPARE) {
++        return XML_ERROR_NO_MEMORY;
++      }
++
++      /* Detect and prevent integer overflow.
++       * The preprocessor guard addresses the "always false" warning
++       * from -Wtype-limits on platforms where
++       * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++      if ((unsigned)(len + EXPAND_SPARE) > (size_t)(-1) / sizeof(XML_Char)) {
++        return XML_ERROR_NO_MEMORY;
++      }
++#endif
++
+       XML_Char *temp = (XML_Char *)REALLOC(
+           parser, b->uri, sizeof(XML_Char) * (len + EXPAND_SPARE));
+       if (temp == NULL)
+@@ -3720,6 +3793,21 @@ addBinding(XML_Parser parser, PREFIX *prefix, const ATTRIBUTE_ID *attId,
+     b = (BINDING *)MALLOC(parser, sizeof(BINDING));
+     if (! b)
+       return XML_ERROR_NO_MEMORY;
++
++    /* Detect and prevent integer overflow */
++    if (len > INT_MAX - EXPAND_SPARE) {
++      return XML_ERROR_NO_MEMORY;
++    }
++    /* Detect and prevent integer overflow.
++     * The preprocessor guard addresses the "always false" warning
++     * from -Wtype-limits on platforms where
++     * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++    if ((unsigned)(len + EXPAND_SPARE) > (size_t)(-1) / sizeof(XML_Char)) {
++      return XML_ERROR_NO_MEMORY;
++    }
++#endif
++
+     b->uri
+         = (XML_Char *)MALLOC(parser, sizeof(XML_Char) * (len + EXPAND_SPARE));
+     if (! b->uri) {
+@@ -6141,7 +6229,24 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID *attId, XML_Bool isCdata,
+       }
+     } else {
+       DEFAULT_ATTRIBUTE *temp;
++
++      /* Detect and prevent integer overflow */
++      if (type->allocDefaultAtts > INT_MAX / 2) {
++        return 0;
++      }
++
+       int count = type->allocDefaultAtts * 2;
++
++      /* Detect and prevent integer overflow.
++       * The preprocessor guard addresses the "always false" warning
++       * from -Wtype-limits on platforms where
++       * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++      if ((unsigned)count > (size_t)(-1) / sizeof(DEFAULT_ATTRIBUTE)) {
++        return 0;
++      }
++#endif
++
+       temp = (DEFAULT_ATTRIBUTE *)REALLOC(parser, type->defaultAtts,
+                                           (count * sizeof(DEFAULT_ATTRIBUTE)));
+       if (temp == NULL)
+@@ -6792,8 +6897,20 @@ lookup(XML_Parser parser, HASH_TABLE *table, KEY name, size_t createSize) {
+     /* check for overflow (table is half full) */
+     if (table->used >> (table->power - 1)) {
+       unsigned char newPower = table->power + 1;
++
++      /* Detect and prevent invalid shift */
++      if (newPower >= sizeof(unsigned long) * 8 /* bits per byte */) {
++        return NULL;
++      }
++
+       size_t newSize = (size_t)1 << newPower;
+       unsigned long newMask = (unsigned long)newSize - 1;
++
++      /* Detect and prevent integer overflow */
++      if (newSize > (size_t)(-1) / sizeof(NAMED *)) {
++        return NULL;
++      }
++
+       size_t tsize = newSize * sizeof(NAMED *);
+       NAMED **newV = (NAMED **)table->mem->malloc_fcn(tsize);
+       if (! newV)
+@@ -7143,6 +7260,20 @@ nextScaffoldPart(XML_Parser parser) {
+   if (dtd->scaffCount >= dtd->scaffSize) {
+     CONTENT_SCAFFOLD *temp;
+     if (dtd->scaffold) {
++      /* Detect and prevent integer overflow */
++      if (dtd->scaffSize > UINT_MAX / 2u) {
++        return -1;
++      }
++      /* Detect and prevent integer overflow.
++       * The preprocessor guard addresses the "always false" warning
++       * from -Wtype-limits on platforms where
++       * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++      if (dtd->scaffSize > (size_t)(-1) / 2u / sizeof(CONTENT_SCAFFOLD)) {
++        return -1;
++      }
++#endif
++
+       temp = (CONTENT_SCAFFOLD *)REALLOC(
+           parser, dtd->scaffold, dtd->scaffSize * 2 * sizeof(CONTENT_SCAFFOLD));
+       if (temp == NULL)
+@@ -7212,8 +7343,26 @@ build_model(XML_Parser parser) {
+   XML_Content *ret;
+   XML_Content *cpos;
+   XML_Char *str;
+-  int allocsize = (dtd->scaffCount * sizeof(XML_Content)
+-                   + (dtd->contentStringLen * sizeof(XML_Char)));
++
++  /* Detect and prevent integer overflow.
++   * The preprocessor guard addresses the "always false" warning
++   * from -Wtype-limits on platforms where
++   * sizeof(unsigned int) < sizeof(size_t), e.g. on x86_64. */
++#if UINT_MAX >= SIZE_MAX
++  if (dtd->scaffCount > (size_t)(-1) / sizeof(XML_Content)) {
++    return NULL;
++  }
++  if (dtd->contentStringLen > (size_t)(-1) / sizeof(XML_Char)) {
++    return NULL;
++  }
++#endif
++  if (dtd->scaffCount * sizeof(XML_Content)
++      > (size_t)(-1) - dtd->contentStringLen * sizeof(XML_Char)) {
++    return NULL;
++  }
++
++  const size_t allocsize = (dtd->scaffCount * sizeof(XML_Content)
++                            + (dtd->contentStringLen * sizeof(XML_Char)));
+ 
+   ret = (XML_Content *)MALLOC(parser, allocsize);
+   if (! ret)
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
index 08e8ff1cea..5a123305c4 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
            file://libtool-tag.patch \
 	   file://run-ptest \
 	   file://0001-Add-output-of-tests-result.patch \
+           file://CVE-2022-22822-27.patch \
 	  "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.34.1


