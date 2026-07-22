Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560B8C531D3
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5518.1784741042713235332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SZOySTre;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49571fea44eso1857065e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741041; x=1785345841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FedGw9YlU6DyYMn2pv6DWCbgb46YqK2SwX4O+hms/kg=;
        b=SZOySTreL9PcDWnmAHMZ/Pfh8UEM1tEy+2gVwc3+eLIe/sbf0zpPsolE6gvDCmXDIw
         w0NMNsZlQL/SvBQRGCL1KoVchfZYRu0WLYMOkKWrZiuI3UTffFdMIWUm0lbZZ5I6Iqwr
         O72RB9CWVWQTBTz0fSrUtBahP4iytDacQq8IY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741041; x=1785345841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FedGw9YlU6DyYMn2pv6DWCbgb46YqK2SwX4O+hms/kg=;
        b=fZ1B+VcX0xFO6n0xxJffoi7zvSaskMt64sxv61M8zWLZoFr3drY7xSFEDxhyF2Tt2E
         by5Hj5gsgaNHSgX14cEMH9uWDVOR49ccVED2XEbv6FQ3ayB93V/Sbt+IMhbD+NqLKiTS
         RrqV+sxwuNWQmBn6J9JermrPM5XNKuShYylnz9RENUxmysD0COactS8h8Bkj3zIL4SOJ
         dDEfrsNVQfKSzfZp7stHF+rkCDIA1ONWMypklQiyL/hZc06zJ3EF9sHIdAUpdKrK4SC2
         va5a6uPeJRokJGfghU9veNI0rm9vFWXZRt4YZxz18aod+MUIpthDZNwiu8VmQ3g3j+Ha
         XTew==
X-Gm-Message-State: AOJu0YzNnwdbzWt95rmSWDnc/IegevddHCLwLksyL1F6rAwdgtvTFGI/
	2ROH9DLXHwShoTQ8PxiVkbwfrBaCbdmQ/1q2vQQFOekUIkmlGJawQVd1FhugHznigUf7jRqHYxc
	b7rMzw48=
X-Gm-Gg: AR+sD113k5oM58PaeFpX4yVZejqRfzm18ZDtgfZnueqbDbvVZz3x7U9VAjy9JFP6RNv
	OkncWvK+eebShbAhOImf4fKenaUPn/jLEku4TeuLSpXzrz0sDT+M1Agpz5B5ILTxbePh9tT5SZ2
	0hQGRTI+uVXLSVeAZW1sCD4rC5zpJIDcuNDYt5lXhVcNNdOOPhEof+0+IcagxHTod7+89/FTnzy
	9bcrZQRNCk9c1/I2eIjezsGVHjfQ2df3P5HebAiOJy6kic0+d8otdQe9lQPMLXnNNUUQuB9c4pi
	amUePTs9hdrj8yCe+SSS1JHnCqqGP+XZwZuo6FrFCG0BmbJTYxvncPMXfgrm/2JihuYWeJxKNz1
	BtJE6W5rnqm7G4ZPBIU28ToPAPlGL6rixRECRe9LLytgMUpPGJVl3Jyf45bgmwD4CCtLGRsCs1C
	o/+s0hthfCO4AIYRdCW2ZOtw/j0Sg8aiZDUfeeqIkOS8yA5nmkRynCQY9vrlsJFP6I++khlCuYf
	kQzUSphKRrK
X-Received: by 2002:a05:600c:c117:b0:495:4b1d:915f with SMTP id 5b1f17b1804b1-4954b1d91ffmr268741815e9.23.1784741040867;
        Wed, 22 Jul 2026 10:24:00 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 06/27] expat: fix CVE-2026-56406
Date: Wed, 22 Jul 2026 19:23:19 +0200
Message-ID: <68c3ae8af4408e98952879c98b7233ca1d2293bb.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241716

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [3].
The prerequisite in [2] provides XML_INDEX_MAX for the Expat 2.7.5
backport.

[1] https://github.com/libexpat/libexpat/commit/99d8454fdf900a6d00c2a52748e6c0eeb507574d
[2] https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56406

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/CVE-2026-56406-dependent.patch      | 58 +++++++++++++++++++
 .../expat/expat/CVE-2026-56406.patch          | 37 ++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  2 +
 3 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch b/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
new file mode 100644
index 00000000000..6ef7c42298c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
@@ -0,0 +1,58 @@
+From 4f828b7ee9d6efef618e8a99a0392acbb95e84f2 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Wed, 27 May 2026 17:01:44 -0700
+Subject: [PATCH] lib: Make `XML_Index` overflow check more intuitive
+
+In fixing a bug, 7e5b71b748491b6e459e5c9a1d090820f94544d8 introduced a
+magic number `2` in this code that made it difficult to understand the
+rationale for this overflow check without reading the commit log. This
+change introduces some more readable constants to use in these
+situations.
+
+CVE: CVE-2026-56406
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd]
+
+(cherry picked from commit 252ff1a307b1490ce0f430632791e7e52d7e43fd)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 96127bf8..5ecea7a8 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -101,7 +101,7 @@
+ #include <stddef.h>
+ #include <string.h> /* memset(), memcpy() */
+ #include <assert.h>
+-#include <limits.h> /* INT_MAX, UINT_MAX */
++#include <limits.h> /* INT_MAX, LLONG_MAX, LONG_MAX, UINT_MAX */
+ #include <stdio.h>  /* fprintf */
+ #include <stdlib.h> /* getenv, rand_s */
+ #include <stdint.h> /* SIZE_MAX, uintptr_t */
+@@ -209,6 +209,12 @@ typedef char ICHAR;
+ 
+ #endif
+ 
++#ifdef XML_LARGE_SIZE
++#  define XML_INDEX_MAX LLONG_MAX
++#else
++#  define XML_INDEX_MAX LONG_MAX
++#endif
++
+ /* Round up n to be a multiple of sz, where sz is a power of 2. */
+ #define ROUND_UP(n, sz) (((n) + ((sz) - 1)) & ~((sz) - 1))
+ 
+@@ -2395,7 +2401,7 @@ XML_Parse(XML_Parser parser, const char *s, int len, int isFinal) {
+     int nLeftOver;
+     enum XML_Status result;
+     /* Detect overflow (a+b > MAX <==> b > MAX-a) */
+-    if ((XML_Size)len > ((XML_Size)-1) / 2 - parser->m_parseEndByteIndex) {
++    if (len > XML_INDEX_MAX - parser->m_parseEndByteIndex) {
+       parser->m_errorCode = XML_ERROR_NO_MEMORY;
+       parser->m_eventPtr = parser->m_eventEndPtr = NULL;
+       parser->m_processor = errorProcessor;
+-- 
+2.43.7
+
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406.patch b/meta/recipes-core/expat/expat/CVE-2026-56406.patch
new file mode 100644
index 00000000000..4077b9946a9
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56406.patch
@@ -0,0 +1,37 @@
+From 6e52f18aded0a76cf89f191d7810bc04287f5337 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 31 May 2026 15:18:58 +0200
+Subject: [PATCH] lib: Copy overflow check from `XML_Parse` to
+ `XML_ParseBuffer`
+
+CVE: CVE-2026-56406
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/99d8454fdf900a6d00c2a52748e6c0eeb507574d]
+
+(cherry picked from commit 99d8454fdf900a6d00c2a52748e6c0eeb507574d)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 5ecea7a8..71fe2c79 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -2518,6 +2518,14 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
+     parser->m_parsingStatus.parsing = XML_PARSING;
+   }
+ 
++  // Detect and avoid integer overflow
++  if (len > XML_INDEX_MAX - parser->m_parseEndByteIndex) {
++    parser->m_errorCode = XML_ERROR_NO_MEMORY;
++    parser->m_eventPtr = parser->m_eventEndPtr = NULL;
++    parser->m_processor = errorProcessor;
++    return XML_STATUS_ERROR;
++  }
++
+   start = parser->m_bufferPtr;
+   parser->m_positionPtr = start;
+   parser->m_bufferEnd += len;
+-- 
+2.43.7
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index 5c93b15484e..f14e39c00b3 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -26,6 +26,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56405.patch;striplevel=2 \
            file://CVE-2026-56410_p1.patch;striplevel=2 \
            file://CVE-2026-56410_p2.patch;striplevel=2 \
+           file://CVE-2026-56406-dependent.patch;striplevel=2 \
+           file://CVE-2026-56406.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

