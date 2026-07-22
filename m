Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3409CC531D0
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:11 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5511.1784741039893629804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rsCKdJ8g;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954d383e64so31688725e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741038; x=1785345838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c0PsVqqa5OCF92Yg8rcmiRnrQCytNTQvBWB/iI2jDns=;
        b=rsCKdJ8gDhy9o5yvD5E1/ILiGx+x6m/Ahuxp8BisV3cTXBVKt617PBbVi4lkgc1M5F
         SPSTMOPelo2B4O/PT0DWd7WhExkrKiKlcjA3QagnUGI3pUrGort9Xm93hq74132t6tUW
         Smy5WYTJVe0GpZBo2c0wg04/U/NvsUj2PGM1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741038; x=1785345838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c0PsVqqa5OCF92Yg8rcmiRnrQCytNTQvBWB/iI2jDns=;
        b=MATmMSh/FsHqVBEriBCChtSSEr1TTVBnTRug9AwsmiXGDRPYFRa0JYt2P7cqiZWnsG
         msWIPr/xEEAZMwCU4VmJSU/GJn5WIvMehhV6FFILPSpu93hK2pMWAxx0UMJvv7PA53pC
         OCOicbe6P43YPwsTUjeK5VydOgpUuWEc4N9xajhbkR12k1KVwe+Q7vk3PQV8UeB0I64n
         X02C3r1aBuYHR6vZsUq5HAG3n2BSURJAaWdE6qLlamfJFVHo6kLQqzxglgECAhq0GPtd
         Kno8zymPil9pJ4bZMyLnV2VoGLcKQatYng1Xl15g1UIhBWLxSWejZa4N/cq1mrOI3vEX
         5F6A==
X-Gm-Message-State: AOJu0YxqdW9wV2xXpJwWi37s9UtV+zeegGvmkr/dn3vkIlJWcnx3CCPw
	iau5YCGWPR1y0cZhNnRerUmR+1WWzFGxnrUbdxGQKY2iWRTv2BVhvnYIaK13JaUVx9pj72FQfKI
	XJ04htL0=
X-Gm-Gg: AR+sD11Tvf1428mOwF2JJ/z+avJ4/UdxDwWV5g1nU/8KPvagL9YRyiQuXnXvRH5Eyhl
	xL5jrKwy4VCwZ+nosvIoCTgYvthwIA9gQ+fUAymK6m5DxYbUAQznGulCd6cSxrTCRjMapEweU7S
	gQQM1244lS/z/0iuVcNeJ5+/bX5iNSykjPPW/xNwXl8Uy7cr9kPLvLFZ8CmuSSoFkm+WSiya90d
	NK6pCCPNZZiR50cvghhdsGJFADSwWVgbnO4q1mbjThA0hLble/ZXjcyvF0MrsV5fZysdkd9xRWD
	XGMduIedmwa8BsgQGgeblSDyjKOV9pKzhUawzq07Ckbw6+1FiuTf88SYf9CDjmVg8EwKYFsiUmS
	/6xAK+6uNb1YEv1bu3xfrvqkUfW7BQkJ9aUyo/sT5u0rujjU6FseHEvReKkskIZjQGl7FScZ4Tc
	+iRNgP1be2uzcNKkn+h7YQZsi7JNT2ifs+ehIDGPRNpj2eZDDmu0hq+Y+FwoYwncJPr6W9t54K0
	AnwOnik1w8s
X-Received: by 2002:a05:600c:35d5:b0:493:d0f7:69c3 with SMTP id 5b1f17b1804b1-4954a749117mr277451985e9.33.1784741038071;
        Wed, 22 Jul 2026 10:23:58 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.23.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:23:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 01/27] expat: fix CVE-2026-56403
Date: Wed, 22 Jul 2026 19:23:14 +0200
Message-ID: <f45b2418e5bb58489bee3caa63c37843712dd4de.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241711

From: Deepak Rathore <deeratho@cisco.com>

These patches apply the upstream fixes shown in [1] and [2], as
referenced by [3].

[1] https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648
[2] https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56403

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-56403_p1.patch       | 83 +++++++++++++++++++
 .../expat/expat/CVE-2026-56403_p2.patch       | 40 +++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  2 +
 3 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
new file mode 100644
index 00000000000..4cf5c3bd54d
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
@@ -0,0 +1,83 @@
+From 4a264be1794368a1acc08476058b6cf087686d11 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 20 May 2026 12:12:10 +0200
+Subject: [PATCH] lib: Protect function `storeAtts` from signed integer
+ overflow
+
+CVE: CVE-2026-56403
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648]
+
+Backport Changes:
+- Retain the Expat 2.7.5 binding URI reallocation and active tag pointer
+  updates while using the overflow-safe localPartLen calculation.
+
+(cherry picked from commit 12dc6d8d3d65f79471a94d8565f6bf1cf245f648)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/lib/xmlparse.c | 30 ++++++++++++++++++++----------
+ 1 file changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 0248b665..e441ff7f 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -4235,26 +4235,32 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+     return XML_ERROR_NONE;
+   prefixLen = 0;
+   if (parser->m_ns_triplets && binding->prefix->name) {
+-    while (binding->prefix->name[prefixLen++])
+-      ; /* prefixLen includes null terminator */
++    size_t candidateLen = 0;
++    while (binding->prefix->name[candidateLen++])
++      ; /* candidateLen includes null terminator */
++    /* Detect and prevent integer overflow */
++    if (candidateLen > INT_MAX)
++      return XML_ERROR_NO_MEMORY;
++    prefixLen = (int)candidateLen;
+   }
+   tagNamePtr->localPart = localPart;
+   tagNamePtr->uriLen = binding->uriLen;
+   tagNamePtr->prefix = binding->prefix->name;
+   tagNamePtr->prefixLen = prefixLen;
+-  for (i = 0; localPart[i++];)
+-    ; /* i includes null terminator */
++
++  size_t localPartLen = 0;
++  for (; localPart[localPartLen++];)
++    ; /* localPartLen includes null terminator */
+ 
+   /* Detect and prevent integer overflow */
+-  if (binding->uriLen > INT_MAX - prefixLen
+-      || i > INT_MAX - (binding->uriLen + prefixLen)) {
++  if (localPartLen > INT_MAX || binding->uriLen > INT_MAX - prefixLen
++      || localPartLen > (size_t)INT_MAX - (binding->uriLen + prefixLen)) {
+     return XML_ERROR_NO_MEMORY;
+   }
+ 
+-  n = i + binding->uriLen + prefixLen;
++  n = (int)localPartLen + binding->uriLen + prefixLen;
+   if (n > binding->uriAlloc) {
+     TAG *p;
+-
+     /* Detect and prevent integer overflow */
+     if (n > INT_MAX - EXPAND_SPARE) {
+       return XML_ERROR_NO_MEMORY;
+@@ -4282,10 +4288,14 @@ storeAtts(XML_Parser parser, const ENCODING *enc, const char *attStr,
+   }
+   /* if m_namespaceSeparator != '\0' then uri includes it already */
+   uri = binding->uri + binding->uriLen;
+-  memcpy(uri, localPart, i * sizeof(XML_Char));
++  /* Detect and prevent integer overflow */
++  if (localPartLen > SIZE_MAX / sizeof(XML_Char)) {
++    return XML_ERROR_NO_MEMORY;
++  }
++  memcpy(uri, localPart, localPartLen * sizeof(XML_Char));
+   /* we always have a namespace separator between localPart and prefix */
+   if (prefixLen) {
+-    uri += i - 1;
++    uri += localPartLen - 1;
+     *uri = parser->m_namespaceSeparator; /* replace null terminator */
+     memcpy(uri + 1, binding->prefix->name, prefixLen * sizeof(XML_Char));
+   }
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
new file mode 100644
index 00000000000..62fdff79e3c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
@@ -0,0 +1,40 @@
+From e8100827a4f68c70d8cadf446bb82bec7cbebbac Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Fri, 22 May 2026 00:43:52 +0200
+Subject: [PATCH] xmlwf: Protect function `xcsdup` from signed integer overflow
+
+CVE: CVE-2026-56403
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15]
+
+(cherry picked from commit 147c8f36d6277d5c6011c098370a8362aed47b15)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index 2d0c4f8e..934473ce 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -305,13 +305,18 @@ processingInstruction(void *userData, const XML_Char *target,
+ static XML_Char *
+ xcsdup(const XML_Char *s) {
+   XML_Char *result;
+-  int count = 0;
++  size_t count = 0;
+   size_t numBytes;
+ 
+   /* Get the length of the string, including terminator */
+   while (s[count++] != 0) {
+     /* Do nothing */
+   }
++
++  // Detect and prevent integer overflow
++  if (count > SIZE_MAX / sizeof(XML_Char))
++    return NULL;
++
+   numBytes = count * sizeof(XML_Char);
+   result = malloc(numBytes);
+   if (result == NULL)
+-- 
+2.43.7
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index ae90ec04e36..423219c726f 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-45186-07.patch \
            file://CVE-2026-41080-1.patch \
            file://CVE-2026-41080-2.patch \
+           file://CVE-2026-56403_p1.patch;striplevel=2 \
+           file://CVE-2026-56403_p2.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

