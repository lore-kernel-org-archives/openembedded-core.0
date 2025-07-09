Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD1DC83F10
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:51:41 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.5563.1752029492111917424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:51:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V1Qtvg/b;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235ef62066eso81350635ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752029491; x=1752634291; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tLVss/Z32A/JcLanDABM5+HBuk6BU2D0dYvlJjfvmE=;
        b=V1Qtvg/bLhO87jGlaxK5zZyk8CWuu1pvqiRPMzBvTnpJeRqIgL26S+hFZT9mxTABQO
         u8caPIwnj245/J2ISI3ckGQzSK0aLW62BANzpjJZvJUdWQs6zgU2O5loNgF6Yok5gV/A
         Ltu/4vJ2xiLzt/1cqU5JIhcUgbS9dLuIzDMFSvJ/0um957CxsiLvTvsIydggzIijoDit
         8C68FZ8iBoM+8XdBBqCgYoPL67rSVNhBhpJiLOSgH2aL6fn8qZPjHjJrGSn50boca2PM
         prJI+beVJQhYmdSEYBKTXFX+B/hn0JnM/PRVOlY0UMt9CITqXnPwIDTA1KPnTBh854Fd
         RVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752029491; x=1752634291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8tLVss/Z32A/JcLanDABM5+HBuk6BU2D0dYvlJjfvmE=;
        b=uqEclJ9xrx3owjGGzbDbDXnmBaOMuItfBGcWZO4RleiXHiw29P7i88WVgb6TAS8dCt
         1jZj5Oon7mwrUbNVDOTWDhDEfdDwi6cxYTA08W62ouZ3KuCz6RRMNoHK92lmH4davl+F
         vfnWqeILuQi7kcwCYbxClwNGCxREiuXCIPelR3tOHW3aX+sZ15Im1zakZ8UG/w3bvFCE
         ElVwZZmO6Y3d3EpexaQib+9WBlETq2lLW6OEF//xdh778q7VgQXY5funiWGUD7gLdlNp
         yll0j6J/2tN4FLnWNb+M0IfljH6K9wfV6Dw3EODH6pYZtJpegKwngKISSzu3fEEyyCLc
         fdJQ==
X-Gm-Message-State: AOJu0Yzk0mKaGiKmmmX7nFEcUqOCIOa/lAahPGuLAKhplCbyqWu15KfW
	/1p1tt1HUWlTC8RGWX8axOfkNtORf3WE7CrN+s5qsdhK7bFwR4mxoL1dWLx1HlZaLyxqwPiAHNA
	K/6e/
X-Gm-Gg: ASbGncugdBbFcvJK5+hYDuZ8JcPKmdjC4Z6xpjZdyTwsVLqiOdi0feg5FT5VEAFXKVL
	bHk7Zn3gdBA6UJW4ktLlV4eHA3t5icAfW6HX0G+L+mqcbWdSmM0S60NCzu2+iWzBr9A1XuzOyR0
	rUgM27bDdtUYR1RmjB3RSDopOwM61CAbwuG9Yqx68s+UlJcAh8GwmaoTF9w0fubV7P826o1X4YD
	KB1n86j5rjiN2KJC0z2MxRC/xb7V47VMUtOPl95yMXKVl7tGNnDFx6+7YhvquMZBuoJ2nqP/Z5p
	L2Nj/moFoc1buq6CIOcImBOcsYMuRhGNzyc3MnqlBeafqsFPCylb1w==
X-Google-Smtp-Source: AGHT+IHc6VX1Meeo6roVM8ShNPU16Sxc53huJc5wn+av5J8oTl679r/VmNvUrrCWy4iHIMzsjnrgXQ==
X-Received: by 2002:a17:902:e890:b0:235:f1e4:3383 with SMTP id d9443c01a7336-23ddb199307mr10953255ad.7.1752029491349;
        Tue, 08 Jul 2025 19:51:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm121979075ad.199.2025.07.08.19.51.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 19:51:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/12] libxml2: fix CVE-2025-6021
Date: Tue,  8 Jul 2025 19:51:12 -0700
Message-ID: <8777f1b344c7f66a7ef4291bb59af2a5fb466b6a.1752029282.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752029282.git.steve@sakoman.com>
References: <cover.1752029282.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220058

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-6021.patch        | 56 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
new file mode 100644
index 0000000000..e28a9edb74
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -0,0 +1,56 @@
+From acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 27 May 2025 12:53:17 +0200
+Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
+
+This issue affects memory safety.
+
+Fixes #926. 
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0]
+CVE: CVE-2025-6021
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tree.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/tree.c b/tree.c
+index dc3ac4f..f89e3cd 100644
+--- a/tree.c
++++ b/tree.c
+@@ -47,6 +47,10 @@
+ #include "private/error.h"
+ #include "private/tree.h"
+ 
++#ifndef SIZE_MAX
++#define SIZE_MAX ((size_t) -1)
++#endif
++
+ int __xmlRegisterCallbacks = 0;
+ 
+ /************************************************************************
+@@ -216,16 +220,18 @@ xmlGetParameterEntityFromDtd(const xmlDtd *dtd, const xmlChar *name) {
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
+     lenn = strlen((char *) ncname);
+     lenp = strlen((char *) prefix);
++    if (lenn >= SIZE_MAX - lenp - 1)
++        return(NULL);
+ 
+-    if ((memory == NULL) || (len < lenn + lenp + 2)) {
++    if ((memory == NULL) || ((size_t) len < lenn + lenp + 2)) {
+ 	ret = (xmlChar *) xmlMallocAtomic(lenn + lenp + 2);
+ 	if (ret == NULL) {
+ 	    xmlTreeErrMemory("building QName");
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 2eea65732b..1ecac70b4c 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -20,6 +20,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            file://CVE-2025-32414.patch \
            file://CVE-2025-32415.patch \
+           file://CVE-2025-6021.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.43.0


