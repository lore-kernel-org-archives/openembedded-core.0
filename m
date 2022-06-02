Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664BACCA477
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 02:31:37 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.2178.1654137090596647185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8AjYUoXY;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id q18so3337741pln.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6L0ffaRErn2iKon+CoBsSSxUIP41T0phCvHCTEyfVOM=;
        b=8AjYUoXYZoKPBdqk+Y67NBbImzWA3ZdP90RXSR4nSO1J6DvbGNg+u7apQvVCWIHbYl
         CnFoGniNwjhA+JZvZCmziAZ+g8Dl83IikbwzV7IipPkSnHX4vLu+TyAdKAaRo3XbrZO/
         vo2VfdizrIi2u2b0GA1Aw78uzMEk3lZQvhfk5sTzRSN1O6zP5xjkRYfMofpsMTMm5AtR
         0RxTvqExskoXkwHmxy9xBOb7vs5aF1bghEbLy5+W87IG1t4rslKUB436rnl37LjfHjDW
         /1h3dZmhv5ln1VfSNL5Xv2rW6DH/2TuUEdbmwPPLiEYLpPMB/FVuv53bO6KNriEVYUSZ
         Q+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6L0ffaRErn2iKon+CoBsSSxUIP41T0phCvHCTEyfVOM=;
        b=prLlUx2K6k3Z8+DCWrODt8Eec3c9ytP0XWmDLhbZeCe8vMZmTyhfbrC8ethKCsEmea
         ppTGD66mQtj/FDYlfUmiUXNuwuNCq+c8rxYEWbnmWeK055kfL3MEumLb4s/LVpVklfye
         Tzl3eQtv1dGA6MuwginM6i0ZlrX/S0y7x8bJqGzRWuv+2F/jLYUJGBvSnSQwfk3e+1g7
         Rm+HD1tisyVy62P8DAnktoaXtI+D4tK/Azho8n9Mr8118zzGwXx2yxTwhOEuIILWVdaq
         +Sa70XLhNt1ACqzm0iRtcTfXlc/EoMSgTj0RmTMRDGvV2hwHe1aLya2AiGVegSft8jy8
         tZng==
X-Gm-Message-State: AOAM531V2oAS7NVOO32FEKcw1cloi+v+4nX24Od32fNWv/1F7P0FB8wb
	uv2v3teBZ8MfpXn4fShe1nrmzB2tfsj47Hih
X-Google-Smtp-Source: 
 ABdhPJx1PLtP8Q2xrpCBqzJUHhc8DS9UOuCLjLUfao/SbOT8TFWmcDJoradUIxhbinMb2DIj+DdpSg==
X-Received: by 2002:a17:90b:1646:b0:1e3:15ef:2871 with SMTP id
 il6-20020a17090b164600b001e315ef2871mr17348902pjb.105.1654137089329;
        Wed, 01 Jun 2022 19:31:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j23-20020a63ec17000000b003fc37053c82sm1990447pgh.12.2022.06.01.19.31.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 19:31:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/11] libxml2: Fix CVE-2022-29824 for libxml2
Date: Wed,  1 Jun 2022 16:30:46 -1000
Message-Id: 
 <096ca5fa8cc4672e5e9b25dffe81b176b252d570.1654136888.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654136888.git.steve@sakoman.com>
References: <cover.1654136888.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 02:31:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166454

From: Riyaz <Riyaz.Khan@kpit.com>

Add patch for CVE issue: CVE-2022-29824

CVE-2022-29824
Link: [https://gitlab.gnome.org/GNOME/libxml2/-/commit/2554a2408e09f13652049e5ffb0d26196b02ebab]
Dependent patch: [https://gitlab.gnome.org/GNOME/libxml2/-/commit/b07251215ef48c70c6e56f7351406c47cfca4d5b]

Signed-off-by: Riyaz <Riyaz.Khan@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml2/CVE-2022-29824-dependent.patch    |  53 +++
 .../libxml/libxml2/CVE-2022-29824.patch       | 348 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   2 +
 3 files changed, 403 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-29824-dependent.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-29824.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-29824-dependent.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-29824-dependent.patch
new file mode 100644
index 0000000000..63d613cc21
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-29824-dependent.patch
@@ -0,0 +1,53 @@
+From b07251215ef48c70c6e56f7351406c47cfca4d5b Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 10 Jan 2020 15:55:07 +0100
+Subject: [PATCH] Fix integer overflow in xmlBufferResize
+
+Found by OSS-Fuzz.
+
+CVE: CVE-2022-29824
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/b07251215ef48c70c6e56f7351406c47cfca4d5b]
+
+Signed-off-by: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
+
+---
+ tree.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/tree.c b/tree.c
+index 0d7fc98c..f43f6de1 100644
+--- a/tree.c
++++ b/tree.c
+@@ -7424,12 +7424,17 @@ xmlBufferResize(xmlBufferPtr buf, unsigned int size)
+     if (size < buf->size)
+         return 1;
+ 
++    if (size > UINT_MAX - 10) {
++        xmlTreeErrMemory("growing buffer");
++        return 0;
++    }
++
+     /* figure out new size */
+     switch (buf->alloc){
+ 	case XML_BUFFER_ALLOC_IO:
+ 	case XML_BUFFER_ALLOC_DOUBLEIT:
+ 	    /*take care of empty case*/
+-	    newSize = (buf->size ? buf->size*2 : size + 10);
++	    newSize = (buf->size ? buf->size : size + 10);
+ 	    while (size > newSize) {
+ 	        if (newSize > UINT_MAX / 2) {
+ 	            xmlTreeErrMemory("growing buffer");
+@@ -7445,7 +7450,7 @@ xmlBufferResize(xmlBufferPtr buf, unsigned int size)
+             if (buf->use < BASE_BUFFER_SIZE)
+                 newSize = size;
+             else {
+-                newSize = buf->size * 2;
++                newSize = buf->size;
+                 while (size > newSize) {
+                     if (newSize > UINT_MAX / 2) {
+                         xmlTreeErrMemory("growing buffer");
+-- 
+GitLab
+
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-29824.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-29824.patch
new file mode 100644
index 0000000000..ad7b87dbc6
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-29824.patch
@@ -0,0 +1,348 @@
+From 2554a2408e09f13652049e5ffb0d26196b02ebab Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 8 Mar 2022 20:10:02 +0100
+Subject: [PATCH] [CVE-2022-29824] Fix integer overflows in xmlBuf and
+ xmlBuffer
+
+In several places, the code handling string buffers didn't check for
+integer overflow or used wrong types for buffer sizes. This could
+result in out-of-bounds writes or other memory errors when working on
+large, multi-gigabyte buffers.
+
+Thanks to Felix Wilhelm for the report.
+
+CVE: CVE-2022-29824
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/2554a2408e09f13652049e5ffb0d26196b02ebab]
+
+Signed-off-by: Riyaz Ahmed Khan <Riyaz.Khan@kpit.com>
+
+---
+ buf.c  | 86 +++++++++++++++++++++++-----------------------------------
+ tree.c | 72 ++++++++++++++++++------------------------------
+ 2 files changed, 61 insertions(+), 97 deletions(-)
+
+diff --git a/buf.c b/buf.c
+index 24368d37..40a5ee06 100644
+--- a/buf.c
++++ b/buf.c
+@@ -30,6 +30,10 @@
+ #include <libxml/parserInternals.h> /* for XML_MAX_TEXT_LENGTH */
+ #include "buf.h"
+ 
++#ifndef SIZE_MAX
++#define SIZE_MAX ((size_t) -1)
++#endif
++
+ #define WITH_BUFFER_COMPAT
+ 
+ /**
+@@ -156,6 +160,8 @@ xmlBufPtr
+ xmlBufCreateSize(size_t size) {
+     xmlBufPtr ret;
+ 
++    if (size == SIZE_MAX)
++        return(NULL);
+     ret = (xmlBufPtr) xmlMalloc(sizeof(xmlBuf));
+     if (ret == NULL) {
+ 	xmlBufMemoryError(NULL, "creating buffer");
+@@ -166,8 +172,8 @@ xmlBufCreateSize(size_t size) {
+     ret->error = 0;
+     ret->buffer = NULL;
+     ret->alloc = xmlBufferAllocScheme;
+-    ret->size = (size ? size+2 : 0);         /* +1 for ending null */
+-    ret->compat_size = (int) ret->size;
++    ret->size = (size ? size + 1 : 0);         /* +1 for ending null */
++    ret->compat_size = (ret->size > INT_MAX ? INT_MAX : ret->size);
+     if (ret->size){
+         ret->content = (xmlChar *) xmlMallocAtomic(ret->size * sizeof(xmlChar));
+         if (ret->content == NULL) {
+@@ -442,23 +448,17 @@ xmlBufGrowInternal(xmlBufPtr buf, size_t len) {
+     CHECK_COMPAT(buf)
+ 
+     if (buf->alloc == XML_BUFFER_ALLOC_IMMUTABLE) return(0);
+-    if (buf->use + len < buf->size)
++    if (len < buf->size - buf->use)
+         return(buf->size - buf->use);
++    if (len > SIZE_MAX - buf->use)
++        return(0);
+ 
+-    /*
+-     * Windows has a BIG problem on realloc timing, so we try to double
+-     * the buffer size (if that's enough) (bug 146697)
+-     * Apparently BSD too, and it's probably best for linux too
+-     * On an embedded system this may be something to change
+-     */
+-#if 1
+-    if (buf->size > (size_t) len)
+-        size = buf->size * 2;
+-    else
+-        size = buf->use + len + 100;
+-#else
+-    size = buf->use + len + 100;
+-#endif
++    if (buf->size > (size_t) len) {
++        size = buf->size > SIZE_MAX / 2 ? SIZE_MAX : buf->size * 2;
++    } else {
++        size = buf->use + len;
++        size = size > SIZE_MAX - 100 ? SIZE_MAX : size + 100;
++    }
+ 
+     if (buf->alloc == XML_BUFFER_ALLOC_BOUNDED) {
+         /*
+@@ -744,7 +744,7 @@ xmlBufIsEmpty(const xmlBufPtr buf)
+ int
+ xmlBufResize(xmlBufPtr buf, size_t size)
+ {
+-    unsigned int newSize;
++    size_t newSize;
+     xmlChar* rebuf = NULL;
+     size_t start_buf;
+ 
+@@ -772,9 +772,13 @@ xmlBufResize(xmlBufPtr buf, size_t size)
+ 	case XML_BUFFER_ALLOC_IO:
+ 	case XML_BUFFER_ALLOC_DOUBLEIT:
+ 	    /*take care of empty case*/
+-	    newSize = (buf->size ? buf->size*2 : size + 10);
++            if (buf->size == 0) {
++                newSize = (size > SIZE_MAX - 10 ? SIZE_MAX : size + 10);
++            } else {
++                newSize = buf->size;
++            }
+ 	    while (size > newSize) {
+-	        if (newSize > UINT_MAX / 2) {
++	        if (newSize > SIZE_MAX / 2) {
+ 	            xmlBufMemoryError(buf, "growing buffer");
+ 	            return 0;
+ 	        }
+@@ -782,15 +786,15 @@ xmlBufResize(xmlBufPtr buf, size_t size)
+ 	    }
+ 	    break;
+ 	case XML_BUFFER_ALLOC_EXACT:
+-	    newSize = size+10;
++            newSize = (size > SIZE_MAX - 10 ? SIZE_MAX : size + 10);
+ 	    break;
+         case XML_BUFFER_ALLOC_HYBRID:
+             if (buf->use < BASE_BUFFER_SIZE)
+                 newSize = size;
+             else {
+-                newSize = buf->size * 2;
++                newSize = buf->size;
+                 while (size > newSize) {
+-                    if (newSize > UINT_MAX / 2) {
++                    if (newSize > SIZE_MAX / 2) {
+                         xmlBufMemoryError(buf, "growing buffer");
+                         return 0;
+                     }
+@@ -800,7 +804,7 @@ xmlBufResize(xmlBufPtr buf, size_t size)
+             break;
+ 
+ 	default:
+-	    newSize = size+10;
++            newSize = (size > SIZE_MAX - 10 ? SIZE_MAX : size + 10);
+ 	    break;
+     }
+ 
+@@ -866,7 +870,7 @@ xmlBufResize(xmlBufPtr buf, size_t size)
+  */
+ int
+ xmlBufAdd(xmlBufPtr buf, const xmlChar *str, int len) {
+-    unsigned int needSize;
++    size_t needSize;
+ 
+     if ((str == NULL) || (buf == NULL) || (buf->error))
+ 	return -1;
+@@ -888,8 +892,10 @@ xmlBufAdd(xmlBufPtr buf, const xmlChar *str, int len) {
+     if (len < 0) return -1;
+     if (len == 0) return 0;
+ 
+-    needSize = buf->use + len + 2;
+-    if (needSize > buf->size){
++    if ((size_t) len >= buf->size - buf->use) {
++        if ((size_t) len >= SIZE_MAX - buf->use)
++            return(-1);
++        needSize = buf->use + len + 1;
+ 	if (buf->alloc == XML_BUFFER_ALLOC_BOUNDED) {
+ 	    /*
+ 	     * Used to provide parsing limits
+@@ -1025,31 +1031,7 @@ xmlBufCat(xmlBufPtr buf, const xmlChar *str) {
+  */
+ int
+ xmlBufCCat(xmlBufPtr buf, const char *str) {
+-    const char *cur;
+-
+-    if ((buf == NULL) || (buf->error))
+-        return(-1);
+-    CHECK_COMPAT(buf)
+-    if (buf->alloc == XML_BUFFER_ALLOC_IMMUTABLE) return -1;
+-    if (str == NULL) {
+-#ifdef DEBUG_BUFFER
+-        xmlGenericError(xmlGenericErrorContext,
+-		"xmlBufCCat: str == NULL\n");
+-#endif
+-	return -1;
+-    }
+-    for (cur = str;*cur != 0;cur++) {
+-        if (buf->use  + 10 >= buf->size) {
+-            if (!xmlBufResize(buf, buf->use+10)){
+-		xmlBufMemoryError(buf, "growing buffer");
+-                return XML_ERR_NO_MEMORY;
+-            }
+-        }
+-        buf->content[buf->use++] = *cur;
+-    }
+-    buf->content[buf->use] = 0;
+-    UPDATE_COMPAT(buf)
+-    return 0;
++    return xmlBufCat(buf, (const xmlChar *) str);
+ }
+ 
+ /**
+diff --git a/tree.c b/tree.c
+index 9d94aa42..86afb7d6 100644
+--- a/tree.c
++++ b/tree.c
+@@ -7104,6 +7104,8 @@ xmlBufferPtr
+ xmlBufferCreateSize(size_t size) {
+     xmlBufferPtr ret;
+ 
++    if (size >= UINT_MAX)
++        return(NULL);
+     ret = (xmlBufferPtr) xmlMalloc(sizeof(xmlBuffer));
+     if (ret == NULL) {
+ 	xmlTreeErrMemory("creating buffer");
+@@ -7111,7 +7113,7 @@ xmlBufferCreateSize(size_t size) {
+     }
+     ret->use = 0;
+     ret->alloc = xmlBufferAllocScheme;
+-    ret->size = (size ? size+2 : 0);         /* +1 for ending null */
++    ret->size = (size ? size + 1 : 0);         /* +1 for ending null */
+     if (ret->size){
+         ret->content = (xmlChar *) xmlMallocAtomic(ret->size * sizeof(xmlChar));
+         if (ret->content == NULL) {
+@@ -7171,6 +7173,8 @@ xmlBufferCreateStatic(void *mem, size_t size) {
+ 
+     if ((mem == NULL) || (size == 0))
+         return(NULL);
++    if (size > UINT_MAX)
++        return(NULL);
+ 
+     ret = (xmlBufferPtr) xmlMalloc(sizeof(xmlBuffer));
+     if (ret == NULL) {
+@@ -7318,28 +7322,23 @@ xmlBufferShrink(xmlBufferPtr buf, unsigned int len) {
+  */
+ int
+ xmlBufferGrow(xmlBufferPtr buf, unsigned int len) {
+-    int size;
++    unsigned int size;
+     xmlChar *newbuf;
+ 
+     if (buf == NULL) return(-1);
+ 
+     if (buf->alloc == XML_BUFFER_ALLOC_IMMUTABLE) return(0);
+-    if (len + buf->use < buf->size) return(0);
++    if (len < buf->size - buf->use)
++        return(0);
++    if (len > UINT_MAX - buf->use)
++        return(-1);
+ 
+-    /*
+-     * Windows has a BIG problem on realloc timing, so we try to double
+-     * the buffer size (if that's enough) (bug 146697)
+-     * Apparently BSD too, and it's probably best for linux too
+-     * On an embedded system this may be something to change
+-     */
+-#if 1
+-    if (buf->size > len)
+-        size = buf->size * 2;
+-    else
+-        size = buf->use + len + 100;
+-#else
+-    size = buf->use + len + 100;
+-#endif
++    if (buf->size > (size_t) len) {
++        size = buf->size > UINT_MAX / 2 ? UINT_MAX : buf->size * 2;
++    } else {
++        size = buf->use + len;
++        size = size > UINT_MAX - 100 ? UINT_MAX : size + 100;
++    }
+ 
+     if ((buf->alloc == XML_BUFFER_ALLOC_IO) && (buf->contentIO != NULL)) {
+         size_t start_buf = buf->content - buf->contentIO;
+@@ -7466,7 +7465,10 @@ xmlBufferResize(xmlBufferPtr buf, unsigned int size)
+ 	case XML_BUFFER_ALLOC_IO:
+ 	case XML_BUFFER_ALLOC_DOUBLEIT:
+ 	    /*take care of empty case*/
+-	    newSize = (buf->size ? buf->size : size + 10);
++            if (buf->size == 0)
++                newSize = (size > UINT_MAX - 10 ? UINT_MAX : size + 10);
++            else
++                newSize = buf->size;
+ 	    while (size > newSize) {
+ 	        if (newSize > UINT_MAX / 2) {
+ 	            xmlTreeErrMemory("growing buffer");
+@@ -7476,7 +7478,7 @@ xmlBufferResize(xmlBufferPtr buf, unsigned int size)
+ 	    }
+ 	    break;
+ 	case XML_BUFFER_ALLOC_EXACT:
+-	    newSize = size+10;
++	    newSize = (size > UINT_MAX - 10 ? UINT_MAX : size + 10);;
+ 	    break;
+         case XML_BUFFER_ALLOC_HYBRID:
+             if (buf->use < BASE_BUFFER_SIZE)
+@@ -7494,7 +7496,7 @@ xmlBufferResize(xmlBufferPtr buf, unsigned int size)
+             break;
+ 
+ 	default:
+-	    newSize = size+10;
++	    newSize = (size > UINT_MAX - 10 ? UINT_MAX : size + 10);;
+ 	    break;
+     }
+ 
+@@ -7580,8 +7582,10 @@ xmlBufferAdd(xmlBufferPtr buf, const xmlChar *str, int len) {
+     if (len < 0) return -1;
+     if (len == 0) return 0;
+ 
+-    needSize = buf->use + len + 2;
+-    if (needSize > buf->size){
++    if ((unsigned) len >= buf->size - buf->use) {
++        if ((unsigned) len >= UINT_MAX - buf->use)
++            return XML_ERR_NO_MEMORY;
++        needSize = buf->use + len + 1;
+         if (!xmlBufferResize(buf, needSize)){
+ 	    xmlTreeErrMemory("growing buffer");
+             return XML_ERR_NO_MEMORY;
+@@ -7694,29 +7698,7 @@ xmlBufferCat(xmlBufferPtr buf, const xmlChar *str) {
+  */
+ int
+ xmlBufferCCat(xmlBufferPtr buf, const char *str) {
+-    const char *cur;
+-
+-    if (buf == NULL)
+-        return(-1);
+-    if (buf->alloc == XML_BUFFER_ALLOC_IMMUTABLE) return -1;
+-    if (str == NULL) {
+-#ifdef DEBUG_BUFFER
+-        xmlGenericError(xmlGenericErrorContext,
+-		"xmlBufferCCat: str == NULL\n");
+-#endif
+-	return -1;
+-    }
+-    for (cur = str;*cur != 0;cur++) {
+-        if (buf->use  + 10 >= buf->size) {
+-            if (!xmlBufferResize(buf, buf->use+10)){
+-		xmlTreeErrMemory("growing buffer");
+-                return XML_ERR_NO_MEMORY;
+-            }
+-        }
+-        buf->content[buf->use++] = *cur;
+-    }
+-    buf->content[buf->use] = 0;
+-    return 0;
++    return xmlBufferCat(buf, (const xmlChar *) str);
+ }
+ 
+ /**
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index c4bb8f29e0..b3ebf15751 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -30,6 +30,8 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://CVE-2021-3541.patch \
            file://CVE-2022-23308.patch \
            file://CVE-2022-23308-fix-regression.patch \
+           file://CVE-2022-29824-dependent.patch \
+           file://CVE-2022-29824.patch \
            "
 
 SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
-- 
2.25.1


