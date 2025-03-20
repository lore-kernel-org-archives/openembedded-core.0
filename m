Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD6EC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 11:57:28 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.5639.1742471843244897015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 04:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jKEQkylP;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-225b5448519so9780285ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 04:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1742471842; x=1743076642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BmGyHWMXgaOeUYcTigxMzWT/v2wcd3yBjcjFN44+I+0=;
        b=jKEQkylPRue5K/gsJVLOiseJJIIw9P3eek/p8EyxJlWEtNSoS2Uyp6LyKsON2sGtvu
         CzGcnS714Chxd4SF/azWTvBzWvHDzfjGcg2MiD+E+Hh9qlX93jRhZn6P+LitZ7bQ6kkT
         RdaFOFg9I2kcpcbJ5/twu89zJBaXWqCY7s1hc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471842; x=1743076642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BmGyHWMXgaOeUYcTigxMzWT/v2wcd3yBjcjFN44+I+0=;
        b=QqNAq6dHultNVXaV0IjQDcKlT2rs8nc51GhKxdlrNnQc1Jh4mgxtYHBBSfTDWd5fuj
         yJOQ0F2I+mievNPSXv8W2FlEOriHy3ReWG5zePtGGS/n6N2C8q/iljLuGdlzsVsV3ap1
         NceLyIBOBgUP+LKfv66U0J7optjvjoR9CNgm6kjtlgInU0YjrkJW0pV2KDA+oeDJOsuu
         onzrHqVPUuoz7y5kjI4WcnQz10PasPBdgPnXo5DLxJf5nzIkctnN5FvturY24aPxfPYf
         hH68VGrZPlRK4pPIgnSDnTgXyaql4hZhS5fSH92AZuwL2ZvGG5jL73mjUYIW5kW5mEeH
         Pcgg==
X-Gm-Message-State: AOJu0YywSXNyPh9yjd6dXEZQxoJPJDotonJh5cohieEcWbmsB5CmIWRv
	GSVgA+ijfyKQZCY/GaxNJYpqmhgC3DgqADVKub5qa9mb0Ww3Cb9fqGefswGDqG0K0jAT1BV0aKc
	cCMM=
X-Gm-Gg: ASbGncuPj8FQEupvKA4YOW5xCEMeyj8UG7Q/EAqzNbx4LkvJbI2uzfaZaiPvapCSZ5e
	+WumtPl1RAHF8Z8HAHKFU1B51xolSOrsC/ajht1r6WH9Cp1pk7jnvFwI/S2tkV4jMaL0Mj2Geia
	ox29YyNFPFPny1FS25eRIhasjb/QvcjO69cPet9D8JnmEkrNv4mv34fkdIXDoD2GTwAbGYSaNtx
	gaDBrZcRjSiSn9rnON5m+GYX3rpSwriHT4oWbiFm3jNlwahGC/ydS/XUHyANKdRWcyAvdONoV38
	hMtmYtNEdaI5uoM/YTilzGO7TLFoGSxTPBt76LRf++NQTKk1z1gLLn8=
X-Google-Smtp-Source: AGHT+IHWFr5Csi0rTVTBlVLeqRknrkkBSrDC/o66iSPhoCH/Kbx579Snm363ZOl5IomybnOVslEAsQ==
X-Received: by 2002:a05:6a00:3a08:b0:736:57cb:f2b6 with SMTP id d2e1a72fcca58-7376d62aac5mr9432667b3a.12.1742471842050;
        Thu, 20 Mar 2025 04:57:22 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.195.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739031c5ac5sm50508b3a.174.2025.03.20.04.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:57:21 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/2] libxslt: Fix for CVE-2024-55549
Date: Thu, 20 Mar 2025 17:27:05 +0530
Message-Id: <20250320115706.179605-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 11:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213383

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Commit: https://gitlab.gnome.org/GNOME/libxslt/-/commit/46041b65f2fbddf5c284ee1a1332fa2c515c0515

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libxslt/libxslt/CVE-2024-55549.patch      | 49 +++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.35.bb |  4 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2024-55549.patch

diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2024-55549.patch b/meta/recipes-support/libxslt/libxslt/CVE-2024-55549.patch
new file mode 100644
index 0000000000..88a17a4d0c
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2024-55549.patch
@@ -0,0 +1,49 @@
+From 46041b65f2fbddf5c284ee1a1332fa2c515c0515 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 5 Dec 2024 12:43:19 +0100
+Subject: [PATCH] [CVE-2024-55549] Fix UAF related to excluded namespaces
+
+Definitions of excluded namespaces could be deleted in
+xsltParseTemplateContent. Store excluded namespace URIs in the
+stylesheet's dictionary instead of referencing the namespace definition.
+
+Thanks to Ivan Fratric for the report!
+
+Fixes #127.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/-/commit/46041b65f2fbddf5c284ee1a1332fa2c515c0515]
+CVE: CVE-2024-55549
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libxslt/xslt.c | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/libxslt/xslt.c b/libxslt/xslt.c
+index 69116f2..02c2e3a 100644
+--- a/libxslt/xslt.c
++++ b/libxslt/xslt.c
+@@ -153,10 +153,20 @@ xsltParseContentError(xsltStylesheetPtr style,
+  * in case of error
+  */
+ static int
+-exclPrefixPush(xsltStylesheetPtr style, xmlChar * value)
++exclPrefixPush(xsltStylesheetPtr style, xmlChar * orig)
+ {
++    xmlChar *value;
+     int i;
+ 
++    /*
++     * orig can come from a namespace definition on a node which
++     * could be deleted later, for example in xsltParseTemplateContent.
++     * Store the string in stylesheet's dict to avoid use after free.
++     */
++    value = (xmlChar *) xmlDictLookup(style->dict, orig, -1);
++    if (value == NULL)
++	return(-1);
++
+     if (style->exclPrefixMax == 0) {
+         style->exclPrefixMax = 4;
+         style->exclPrefixTab =
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.35.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
index 2fd777766c..1f0d845421 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.35.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
+SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz \
+           file://CVE-2024-55549.patch \
+          "
 
 SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79"
 
-- 
2.25.1


