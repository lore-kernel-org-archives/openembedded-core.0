Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110B4C83F27
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:55:51 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.40452.1752720950538293045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bHwnW0Mw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23c703c471dso16835545ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720950; x=1753325750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Sm1uDDAcr07b4+ViJUuXwtPqjsd05chQk60xT0zY4w=;
        b=bHwnW0MwL9214FjDaVZFOgRTYtlwQbjmS6UONmMmeaxSJxf7M0BZdvV1+HI7FQVht9
         RDv7Vco+pTytRaxVK7SOs92JoyItS5sr1IDWdnSazV8HYWO6T+/nkPPf//oQ0S1A5C6h
         XdiRIbHYLolqrqA0aOZvIqQQ/dILPjUsNGLxnqju2qIDOYHmYliFkmk+ovRQIuB2UxyA
         0RKFXtYA6AAqXR0DseWwLQE1guqqg2jcBR3o+FUMbdhGQGe4Am5X+iajg0mFtgvIKMZo
         CCPfsKTcsc2GrYehug6v/972E2JVdnAcjCJUH0BG+SVUMlice1GF9EQ1tsiWSnuz1kVL
         M/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720950; x=1753325750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Sm1uDDAcr07b4+ViJUuXwtPqjsd05chQk60xT0zY4w=;
        b=h7lIVlQ2ROR/8Cs54lFIFSes68QkIyDMg1CIcOIB10JuZIYjMksX3lgS2ixM7Mwp6R
         jTmDY0IuLm/7ckp1uzzc8CeddzQdsG8tOK82uXqANow5yuNMsWTEbDv56UNK0l0bZPAK
         ylE0WQ8ww7DR4zql308bk8XL6CMX5zr5+csPT2b1v+3fvfoekwxM+OZl4lEZ3Qxs5hF4
         +6VDNb0xrvIJwyXbS89rtCHWiWIjgVzlt5e/M/IanWTuCsz1kY8YCdiHO0wOT7XnqktX
         Uo3JGtyIrKqRSJK5wMcGosWQHqYGl8YW0WLKIsh1F1uc3gVmSuEWnVHlPhY1QvumqMtM
         OSyQ==
X-Gm-Message-State: AOJu0YwkEcgKyNHhKvQNJ9fYKvfCqwUFXlH287LL/p0KszOCL2a3zRrn
	PLTzuku18RPQtLIw2tSLziWQJNr5I+FUoCD0JEPZNNXF+V0nk1slhuYAO2ETYxTF9lss3sheXVP
	L1EKh
X-Gm-Gg: ASbGnctPeeePc4Z5keavOgC/9+Sjxrb/2LESnA+ukRdcHt8mo4H3GaE51bG8sXMejzY
	+zYMLHU5q+xIc+SuAbTU6RSLKWsBzB5Goemv2CpS1nKy1hNVAo5iVdo/5C4vO1MFzayGPdpVDMU
	RAPfj6R3CD3w3VZIa7sS3GcKP8OKLIvQGF2b+q/RZhVCG7EvXuX12n8sIxT6F/yYNjrQCaQeI2P
	9FzbEK6qbKmvbI9ppUaI+DwuRLwwiWN5FpZ3Iy+T/xxAp9dKOQpymC9nIPmcjGgWTTQtqgbOkIc
	CHqAuDX+hRPAi/v9thFZLxJ0SML+Be0+7fPhOX8i4/AMK9q82W2kt3NYhZctiv0sHq2gH+Im2o6
	eG0p8cNQrXo2JBw==
X-Google-Smtp-Source: AGHT+IFWghNCPJbKi4xP8bOC1c29Fpq3eDhdtc5/9lIwJmwuJILq34qgUcnCRjh4glQqRWf2CCWK/A==
X-Received: by 2002:a17:903:1b48:b0:237:e753:1808 with SMTP id d9443c01a7336-23e2f4ba71amr24504425ad.20.1752720949583;
        Wed, 16 Jul 2025 19:55:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.55.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:55:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 05/13] libxml2: fix CVE-2025-6021
Date: Wed, 16 Jul 2025 19:55:28 -0700
Message-ID: <99a239d9146c5ecf158cd9db7823ec1aff45fd48.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752720827.git.steve@sakoman.com>
References: <cover.1752720827.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220491

From: Divya Chellam <divya.chellam@windriver.com>

A flaw was found in libxml2's xmlBuildQName function, where integer
overflows in buffer size calculations can lead to a stack-based buffer
overflow. This issue can result in memory corruption or a denial
of service when processing crafted input.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-6021

Upstream-patch:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/17d950ae33c23f87692aa179bacedb6743f3188a

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-6021.patch        | 59 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.13.8.bb    |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
new file mode 100644
index 0000000000..8461e0f715
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -0,0 +1,59 @@
+From 17d950ae33c23f87692aa179bacedb6743f3188a Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 27 May 2025 12:53:17 +0200
+Subject: [PATCH] [CVE-2025-6021] tree: Fix integer overflow in xmlBuildQName
+
+Fixes #926.
+
+CVE: CVE-2025-6021
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/17d950ae33c23f87692aa179bacedb6743f3188a]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ tree.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/tree.c b/tree.c
+index f097cf8..5bc95b8 100644
+--- a/tree.c
++++ b/tree.c
+@@ -47,6 +47,10 @@
+ #include "private/error.h"
+ #include "private/tree.h"
+ 
++#ifndef SIZE_MAX
++  #define SIZE_MAX ((size_t)-1)
++#endif
++
+ int __xmlRegisterCallbacks = 0;
+ 
+ /************************************************************************
+@@ -167,10 +171,10 @@ xmlGetParameterEntityFromDtd(const xmlDtd *dtd, const xmlChar *name) {
+ xmlChar *
+ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
+ 	      xmlChar *memory, int len) {
+-    int lenn, lenp;
++    size_t lenn, lenp;
+     xmlChar *ret;
+ 
+-    if (ncname == NULL) return(NULL);
++    if ((ncname == NULL) || (len < 0)) return(NULL);
+     if (prefix == NULL) return((xmlChar *) ncname);
+ 
+ #ifdef FUZZING_BUILD_MODE_UNSAFE_FOR_PRODUCTION
+@@ -181,8 +185,10 @@ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
+ 
+     lenn = strlen((char *) ncname);
+     lenp = strlen((char *) prefix);
++    if (lenn >= SIZE_MAX - lenp - 1)
++        return(NULL);
+ 
+-    if ((memory == NULL) || (len < lenn + lenp + 2)) {
++    if ((memory == NULL) || ((size_t) len < lenn + lenp + 2)) {
+ 	ret = (xmlChar *) xmlMallocAtomic(lenn + lenp + 2);
+ 	if (ret == NULL)
+ 	    return(NULL);
+-- 
+2.40.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.13.8.bb b/meta/recipes-core/libxml/libxml2_2.13.8.bb
index e82e0e8ec3..ea7aa9c41d 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.8.bb
@@ -17,6 +17,7 @@ inherit gnomebase
 SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
            file://run-ptest \
            file://install-tests.patch \
+           file://CVE-2025-6021.patch \
            "
 
 SRC_URI[archive.sha256sum] = "277294cb33119ab71b2bc81f2f445e9bc9435b893ad15bb2cd2b0e859a0ee84a"
-- 
2.43.0


