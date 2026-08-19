Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A507C5DF8C
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10407.1787155066030289076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=obTlDLv/;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954df200ddso9664085e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155064; x=1787759864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W2hZe/lWTcUUSYydLVyYADD2RkSUQAu7YUJeK8l0RcI=;
        b=obTlDLv/DXNlFhI1coNjYcF5wjFZ/VLhp7ziwiZ07UulSUyaoNbtmzLHKoLDkFxbgP
         SCgzEEFLYhyGTDZmQO/nyPOipoxQGvuiFrB6iD+GmllZGXAZ3S8Ir7fJzCGv0hs2FbO9
         /eYdPlrnQInhL/yynokUFvWR7IMtDF7TcWFKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155064; x=1787759864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=W2hZe/lWTcUUSYydLVyYADD2RkSUQAu7YUJeK8l0RcI=;
        b=CClUXmzh5+iDpPMr5YhX3WIRPUiKtqMsjAfR3KzaZrLsKhRb2hC0opAPsCCNks3QDJ
         QN4Gy5cpmMPXGR2s/G8io/fp6aCyghrYoKPKHHFzXQDn6WmGvImVMRJsMnTQQpDadUoa
         Q9Chao4jL6+doZcJ9g74HqDp9TaFfpRS5zvhdFN6W94uM7yvHsw0L1vLyJKUHGIHb2MI
         65rJ/aWGiSVBi7te9KmrggsJeYnYKNMpAdxuRBLQJO7bhMKrD5MBth5gCLaYRAjVRgws
         QDcy+x7LYdwnqKVnBx9+ytM0Pg68tFm6eFvM/oa2MtjV1OXDk0iIlRD/swqimf3LOURh
         zoWA==
X-Gm-Message-State: AOJu0YxXXz1bq7bVK96NqdhLsEqgaL4c5F40ZIfz11JjDpNqxynse6pi
	5uj16/H9zTIE85TYTQbIUT03f1mTYKoJ/AJcwLrlAlJnE0kdLvPJYUJdNvqCXt+k39DZn4EUET3
	oU8Mk4eg=
X-Gm-Gg: AR+sD11zJDmkRzA2Ud1anYi02obaMKLKRq6byksNyhXY98N2EzgiyIhJhOpiBW+3G2s
	PxPGhr9tbr1vx6DAKYgX0e/leynGySOEWJP6DLNmvEs2yGAw1X1l/X3x8wdr2Ucf1xO0Moc89mS
	oaEU4zwh3Rbi6zuCUgnKe805GswMSVi1gjH1A7ugbhVR8lewAu8Dqemx7Ny2R5JUWCj55emRRTf
	qoOf6CuDMO+0fJnGRuICZuO2G1oRX6vq1NYnxZmmfiPxa6ZEMApmg7S8ONN1iMrxlIfDKjKE77P
	omRaLAfytcZ7H5LjoZJoRZwI7/QuaoCQ5yCKz0I0f08ry6RbEyAJKrBC7OFB/NvxnflrTpNzHfh
	xAOXkdF9U85eg4CN00aTQpakEzv8IlQtveKjFybug/WNV7oisSD+Ez/om/MAtE+tZPPdsKztJBS
	oprg3vd+rut4XkqkTpcphFsC1CmRXD8/gwlgR1DPI4Xit2RT8unKgVlKk2RcgbJkhu0n9PPgYjV
	neYX6VKy9lendLpsgw3d4Xvp1yy2p9Y2Bmj4/JPgyiN9422wdraJJVwswIO4SD1xo1Yi8hwKeB2
	zx6OtW9v4OXAYFpxfGw3mnxUylicPTci/3m02tdo5zFHNfQIKOg=
X-Received: by 2002:a05:600c:3f18:b0:498:1595:be7b with SMTP id 5b1f17b1804b1-499aa194df0mr118087535e9.4.1787155064245;
        Wed, 19 Aug 2026 08:57:44 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:43 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/37] expat: fix CVE-2026-56406
Date: Wed, 19 Aug 2026 17:56:43 +0200
Message-ID: <6c5b6659d16f0109fea8c1d6b31a8c3ea63bfa08.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243748

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [3].
The prerequisite in [2] provides XML_INDEX_MAX for the Scarthgap Expat
2.6.4 backport.

[1] https://github.com/libexpat/libexpat/commit/99d8454fdf900a6d00c2a52748e6c0eeb507574d
[2] https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56406

(From OE-Core rev: 6cbc3b17313df01c48e738a87f8d12bc8834fd59)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../expat/CVE-2026-56406-dependent.patch      | 59 +++++++++++++++++++
 .../expat/expat/CVE-2026-56406.patch          | 34 +++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
 3 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch b/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
new file mode 100644
index 00000000000..d749ef06089
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
@@ -0,0 +1,59 @@
+From 9aafa47798332618f08af046c3471de1f3a9e031 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Wed, 27 May 2026 17:01:44 -0700
+Subject: [PATCH 08/17] lib: Make `XML_Index` overflow check more intuitive
+
+In fixing a bug, 7e5b71b748491b6e459e5c9a1d090820f94544d8 introduced a magic number `2` in this code that made it difficult to understand the rationale for this overflow check without reading the commit log. This change introduces some more readable constants to use in these situations.
+
+CVE: CVE-2026-56406
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd]
+
+Backport Changes:
+- Adapt include context for Scarthgap 2.6.4 and expose SIZE_MAX in
+  the existing stdint.h comment.
+
+(cherry picked from commit 252ff1a307b1490ce0f430632791e7e52d7e43fd)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 80ad0811..5bf706b0 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -97,10 +97,10 @@
+ #include <stddef.h>
+ #include <string.h> /* memset(), memcpy() */
+ #include <assert.h>
+-#include <limits.h> /* UINT_MAX */
++#include <limits.h> /* INT_MAX, LLONG_MAX, LONG_MAX, UINT_MAX */
+ #include <stdio.h>  /* fprintf */
+ #include <stdlib.h> /* getenv, rand_s */
+-#include <stdint.h> /* uintptr_t */
++#include <stdint.h> /* SIZE_MAX, uintptr_t */
+ #include <math.h>   /* isnan */
+ 
+ #ifdef _WIN32
+@@ -211,6 +211,12 @@ typedef char ICHAR;
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
+@@ -2360,7 +2366,7 @@ XML_Parse(XML_Parser parser, const char *s, int len, int isFinal) {
+     int nLeftOver;
+     enum XML_Status result;
+     /* Detect overflow (a+b > MAX <==> b > MAX-a) */
+-    if ((XML_Size)len > ((XML_Size)-1) / 2 - parser->m_parseEndByteIndex) {
++    if (len > XML_INDEX_MAX - parser->m_parseEndByteIndex) {
+       parser->m_errorCode = XML_ERROR_NO_MEMORY;
+       parser->m_eventPtr = parser->m_eventEndPtr = NULL;
+       parser->m_processor = errorProcessor;
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56406.patch b/meta/recipes-core/expat/expat/CVE-2026-56406.patch
new file mode 100644
index 00000000000..56de9e41249
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56406.patch
@@ -0,0 +1,34 @@
+From 5db699faa6af1c66e96abec5dbd1908efd64ef70 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Sun, 31 May 2026 15:18:58 +0200
+Subject: [PATCH 09/17] lib: Copy overflow check from `XML_Parse` to
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
+index 5bf706b0..9f07b860 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -2483,6 +2483,14 @@ XML_ParseBuffer(XML_Parser parser, int len, int isFinal) {
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
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 39e40befc44..aa2a4f89669 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -68,6 +68,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56405.patch;striplevel=2 \
            file://CVE-2026-56410_p1.patch;striplevel=2 \
            file://CVE-2026-56410_p2.patch;striplevel=2 \
+           file://CVE-2026-56406-dependent.patch;striplevel=2 \
+           file://CVE-2026-56406.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

