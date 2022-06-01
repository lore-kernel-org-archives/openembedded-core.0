Return-Path: <rak3033@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8BAC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 11:54:15 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.6449.1654084448812089527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 04:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kx3upduz;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: rak3033@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 137so1687356pgb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 04:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=6NBNrpFjYaVopFmSu2dNIXndpM6wPSx9M8YPT/DQvRs=;
        b=Kx3upduz9Vm3gwpbobItc2tmM3Lr9qbP89QqsZRlny+QptHFaLKLVZ5BBihiiqv7p1
         OuGXUM4wQbUqeGTJax2xj28VPp7YO/pfwI8yOW8+ocUmMamLmEppLkVC7zv9RsOPRUsc
         DI3HZ8KljE6ymVyxlIMPuqqVotec3ZG2N05BFtxpr7vZ4UwnztI9rIMA3D881jXlQSqc
         D5mlLDHZH0qyhNfIJOtIK5Z00Ylw7YOU1bE0Ga0t4smQ4XiPI0FPfIuM95xmsoLzNr0O
         mdpH1zxp9ALV+oJO6/BC7IUYs3WEWhWnufdHmWnW1Mw50hbh1RWUhcJLJzuhkxC0YDEL
         GjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6NBNrpFjYaVopFmSu2dNIXndpM6wPSx9M8YPT/DQvRs=;
        b=kUdg6p6ApeG25iI+c6miplTn5p6qnd+I/LqsVsSuwMdwJD847V/kXno8tt/sLreXrA
         uHOduF2tgUe6RO5e2K/7ow7m+8/OKnQpmqfqWHhs/Aj0adEqjPb7R64YP9Osv0t+en/i
         QBFzbsAJOGQ7fNGqP/QPw+aCyd3+aLV07LoTL5Bx09yey15m6AWF9YdsHqxynr+JBCkX
         mEF4duqy9mgKo556FbK99rh671b+VPt+2wN9Co98KkjJwpB/7EzAxfSg/M81HtIMN1BE
         5suiSFKUn8/+F29pXs3hZvD+cT5LXB72OgakXngFmob7cyRiosqYIYHWLP98bCPxFlCx
         B8kQ==
X-Gm-Message-State: AOAM530Fg4YXGSbF6gqMDje/zDsnZOsu9IfsVsGaeCUuvlHv+B5SN3BI
	s7SdZw8gu5deakPfsGG20XQWQmEEgH+TslGg
X-Google-Smtp-Source: 
 ABdhPJxpxdbkJXGDVVJjvihB52Hlb5c7Scey+1jViSbGVmtss6dvDsbGeb+2ujEfn2K/iEwm7Fc4Ew==
X-Received: by 2002:a63:89c1:0:b0:3fc:5fd2:54e4 with SMTP id
 v184-20020a6389c1000000b003fc5fd254e4mr6711380pgd.344.1654084447867;
        Wed, 01 Jun 2022 04:54:07 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:32b4:389b:a813:a0a5:dfcd:a481])
        by smtp.gmail.com with ESMTPSA id
 f8-20020a056a001ac800b0051b516fd1dcsm1450372pfv.91.2022.06.01.04.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 04:54:07 -0700 (PDT)
From: Riyaz Ahmed Khan <rak3033@gmail.com>
To: openembedded-core@lists.openembedded.org,
	rak3033@gmail.com,
	Riyaz.Khan@kpit.com
Cc: Ranjitsinh.Rathod@kpit.com
Subject: [OE-core][dunfell][PATCH v1] libxml2: Fix CVE-2022-29824 for libxml2
Date: Wed,  1 Jun 2022 17:23:46 +0530
Message-Id: <20220601115346.23144-1-rak3033@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 11:54:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166376

From: Riyaz <Riyaz.Khan@kpit.com>

Add patch for CVE issue: CVE-2022-29824

CVE-2022-29824
Link: [https://gitlab.gnome.org/GNOME/libxml2/-/commit/2554a2408e09f13652049e5ffb0d26196b02ebab]
Dependent patch: [https://gitlab.gnome.org/GNOME/libxml2/-/commit/b07251215ef48c70c6e56f7351406c47cfca4d5b]

Signed-off-by: Riyaz <Riyaz.Khan@kpit.com>
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
2.17.1


