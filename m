Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72DEDC433F5
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 21:24:11 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.2699.1642713850564923806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UVSn9/4L;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id f8so6395346pgf.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bXI9y1zEftMuLEQ1uFp1o09kXt/SDhqxLsWf3X1gjRo=;
        b=UVSn9/4L1kqkiXGNdIJINQ05yEXvsREx44v1D6wI6ASlnE0xEm5JWacCQmZcs7aNF2
         Z5kxcVyE3KaCULnEr43Iz9+/beGIxp1J1NOK9qthuZNcbYBJhOaiKtxCjmlrdZ2xk6RG
         sACi3OfEZn/F+iWftx6c8M9ZtcQnHh3TsVhhhjcoO6RTpk+ZmZH6erOqiopL+EhfZLQF
         7kzc/xEOxZw4LDBuEPYz1u6LkvT/SS3Rh1y71bZplgngPJA+/mYqBB2yV4Fj6EUKVphq
         RXuUjYBo1SyM8RZCEWh9E4fQO+UQgyNkrl/M9zYS/PvXML20GXdusvihWO0mLxQrBzTx
         rmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bXI9y1zEftMuLEQ1uFp1o09kXt/SDhqxLsWf3X1gjRo=;
        b=Nusqt6XKXlWklqvrnPE0HM7JfwJSMo3/eIqh+MlDg5HNt8pktiRnf8jCmcQYqW2RLF
         0a2cHkfbtmzF14YknT6vVT/dASM/EXlxtrLqp9Pqfwt9BI2dp7r47qvL1VuJTzqpGFwm
         el21qB7351ZLqIj3j+jlPTCKKQD5ivexDUS/kOBZuVsBmDulIFB5xA/tUKswnbo2HmaY
         1Fc3lJFwPy+n7xXzkMuGT4fp6y/HxTYxz4xHD7DByfDHLyGe+j7QSjSYfKrIStSXxSUl
         zwTiyqDvBFHSYN5lKg2kxHA3qZehNz5uXhbXakC3QAOWxgz8tTyW5JmCKzajmDKBlP9y
         n4lg==
X-Gm-Message-State: AOAM532tykkqAUxQmXdF/ugjg0542nm1ycwhjOqfZnTxjjjyOeAwfWM7
	3BZK6xo0BBlPrIoqKbO41TWzqII2YIxBg2Tbt6c=
X-Google-Smtp-Source: 
 ABdhPJymukYeNiCVQODsz05w1uRAwHApgrJEzPSiueV4hAPN5pLI7TME1f6iOsQn3tLqpwWWqXkvWw==
X-Received: by 2002:a63:214f:: with SMTP id s15mr537564pgm.256.1642713849361;
        Thu, 20 Jan 2022 13:24:09 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 o5sm4029115pfk.172.2022.01.20.13.24.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 13:24:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/11] expat fix CVE-2022-22822 through
 CVE-2022-22827
Date: Thu, 20 Jan 2022 11:23:40 -1000
Message-Id: 
 <3b6c47c0ebae9fdb7a13480daf8f46a8dbb2c9bd.1642693490.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642693490.git.steve@sakoman.com>
References: <cover.1642693490.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 21:24:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160791

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
---
 .../expat/expat/CVE-2022-22822-27.patch       | 257 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |   1 +
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
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index 4b63ec89db..7740d95db5 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
 
 SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://CVE-2013-0340.patch \
+           file://CVE-2022-22822-27.patch \
            file://libtool-tag.patch \
          "
 
-- 
2.25.1


