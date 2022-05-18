Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE29C433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 02:31:13 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.334.1652841064249997119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=G5MwLpg5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id gg20so656751pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=J9DG6lv00rGeGy9Ql1R5sqWNEQEl3hg3Rs40dWhuCIs=;
        b=G5MwLpg5xgf/28FCELTC8g+kJvn6TMWAKvfHdJz5F/HoH12Io6oyuOXWa00I/NdbmB
         bT8Jq8oJb+sc2Lqazppn+VVauqR031S+3zqNN6mEJhPV+qmjnMo1KWEQ1RI3TOa5GILk
         PbxPixA9TErQVQFWFpP4oASVcQg6hQaFVbuK0s+13AsLkzyhLdEHTaUe6XYL86f0nngV
         owa7RTNzzbJf7f9gobmZauZ3y2wYmGXFuYtOonLVzPC3X6fvPxbF/ciOtHGkVbStJtu6
         wGW/1NXkgzlp/zLt6KNjBPno5CthIVfRE6IwCw/icAJkgilWadGu5RITZ13vY0spRXrB
         glhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J9DG6lv00rGeGy9Ql1R5sqWNEQEl3hg3Rs40dWhuCIs=;
        b=UnPzt0+J1Xp66OfANSfx3ULWMjWsUhGdGDXA/VY0LIRrV5eI1a9aaSlfvfUtZGn8h9
         14k/iXfL9e0R8wEMEaQtIz3hx7+O1CADwJK8aM2rox5BMPDRXplzqYPqbZEJLdJJbCaS
         xtB+EbrsgQi/E17Sm55sZqK7hmS74K9pRiHf/2FcnAdeCg39aEep2iqX5kTH/MqAXieJ
         iZ5D4YTWlh4ILJFjwq/q9hCzf5mNEVFuX4TJOLowz5ZwQOoFmixg9/ayLg7PwipjDMWZ
         Y70vLW+dLPuxh9ZzKgU63hNFNmaFY8c5pwS3LHSh4YIgsOuvWBMCjjnoHD2GcDWpF6G8
         81Dg==
X-Gm-Message-State: AOAM530j/bvlxDRQ5rweuNtQwDtMw1Fiuv+GbpymkFoV/+EUvQoA8WMm
	TpVr9NwK5RMo1MVxpaR7SkxHkFflejc/ZtkP
X-Google-Smtp-Source: 
 ABdhPJyD5ljjT13/jJRiOyreno0ki6xYwF/JZcvdZrAZZMXI8mD/V1h27iXV62X16INb9OrqGBm8hw==
X-Received: by 2002:a17:90a:6284:b0:1df:4595:57af with SMTP id
 d4-20020a17090a628400b001df459557afmr15487430pjj.188.1652841063162;
        Tue, 17 May 2022 19:31:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p25-20020a62b819000000b00512ead539casm438926pfe.113.2022.05.17.19.31.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 19:31:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/9] freetype: Fix CVEs for freetype
Date: Tue, 17 May 2022 16:30:32 -1000
Message-Id: 
 <51a92860bdbab28a2b487be3b054f103a54b86ac.1652840866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652840866.git.steve@sakoman.com>
References: <cover.1652840866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 02:31:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165786

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Apply below patches to fix the CVEs for freetype:

CVE-2022-27404.patch
Link: https://gitlab.freedesktop.org/freetype/freetype/-/commit/53dfdcd8198d2b3201a23c4bad9190519ba918db.patch

CVE-2022-27405.patch
Link: https://gitlab.freedesktop.org/freetype/freetype/-/commit/22a0cccb4d9d002f33c1ba7a4b36812c7d4f46b5.patch

CVE-2022-27406.patch
Link: https://gitlab.freedesktop.org/freetype/freetype/-/commit/0c2bdb01a2e1d24a3e592377a6d0822856e10df2.patch

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../freetype/freetype/CVE-2022-27404.patch    | 33 ++++++++++++++++
 .../freetype/freetype/CVE-2022-27405.patch    | 38 +++++++++++++++++++
 .../freetype/freetype/CVE-2022-27406.patch    | 31 +++++++++++++++
 .../freetype/freetype_2.10.1.bb               |  3 ++
 4 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch b/meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch
new file mode 100644
index 0000000000..e66400ddb1
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch
@@ -0,0 +1,33 @@
+From 53dfdcd8198d2b3201a23c4bad9190519ba918db Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Thu, 17 Mar 2022 19:24:16 +0100
+Subject: [PATCH] [sfnt] Avoid invalid face index.
+
+Fixes #1138.
+
+* src/sfnt/sfobjs.c (sfnt_init_face), src/sfnt/sfwoff2.c (woff2_open_font):
+Check `face_index` before decrementing.
+
+CVE: CVE-2022-27404
+Upstream-Status: Backport [https://gitlab.freedesktop.org/freetype/freetype/-/commit/53dfdcd8198d2b3201a23c4bad9190519ba918db.patch]
+Comment: Removed second hunk as sfwoff2.c file is not part of current v2.10.1 code
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+---
+ src/sfnt/sfobjs.c  | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/sfnt/sfobjs.c b/src/sfnt/sfobjs.c
+index f9d4d3858..9771c35df 100644
+--- a/src/sfnt/sfobjs.c
++++ b/src/sfnt/sfobjs.c
+@@ -566,7 +566,7 @@
+     face_index = FT_ABS( face_instance_index ) & 0xFFFF;
+
+     /* value -(N+1) requests information on index N */
+-    if ( face_instance_index < 0 )
++    if ( face_instance_index < 0 && face_index > 0 )
+       face_index--;
+
+     if ( face_index >= face->ttc_header.count )
+-- 
+GitLab
diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch b/meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch
new file mode 100644
index 0000000000..08fccd5a3b
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch
@@ -0,0 +1,38 @@
+From 22a0cccb4d9d002f33c1ba7a4b36812c7d4f46b5 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 19 Mar 2022 06:40:17 +0100
+Subject: [PATCH] * src/base/ftobjs.c (ft_open_face_internal): Properly guard
+ `face_index`.
+We must ensure that the cast to `FT_Int` doesn't change the sign.
+Fixes #1139.
+
+CVE: CVE-2022-27405
+Upstream-Status: Backport [https://gitlab.freedesktop.org/freetype/freetype/-/commit/22a0cccb4d9d002f33c1ba7a4b36812c7d4f46b5]
+Comment: No Change in any hunk
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+---
+ src/base/ftobjs.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/base/ftobjs.c b/src/base/ftobjs.c
+index 2c0f0e6c9..10952a6c6 100644
+--- a/src/base/ftobjs.c
++++ b/src/base/ftobjs.c
+@@ -2527,6 +2527,15 @@
+ #endif
+ 
+ 
++    /* only use lower 31 bits together with sign bit */
++    if ( face_index > 0 )
++      face_index &= 0x7FFFFFFFL;
++    else
++    {
++      face_index &= 0x7FFFFFFFL;
++      face_index  = -face_index;
++    }
++
+ #ifdef FT_DEBUG_LEVEL_TRACE
+     FT_TRACE3(( "FT_Open_Face: " ));
+     if ( face_index < 0 )
+-- 
+GitLab
diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch b/meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch
new file mode 100644
index 0000000000..4b5e629f30
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch
@@ -0,0 +1,31 @@
+From 0c2bdb01a2e1d24a3e592377a6d0822856e10df2 Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Sat, 19 Mar 2022 09:37:28 +0100
+Subject: [PATCH] * src/base/ftobjs.c (FT_Request_Size): Guard `face->size`.
+
+Fixes #1140.
+
+CVE: CVE-2022-27406
+Upstream-Status: Backport [https://gitlab.freedesktop.org/freetype/freetype/-/commit/0c2bdb01a2e1d24a3e592377a6d0822856e10df2]
+Comment: No Change in any hunk
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+---
+ src/base/ftobjs.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/base/ftobjs.c b/src/base/ftobjs.c
+index 6492a1517..282c9121a 100644
+--- a/src/base/ftobjs.c
++++ b/src/base/ftobjs.c
+@@ -3409,6 +3409,9 @@
+     if ( !face )
+       return FT_THROW( Invalid_Face_Handle );
+ 
++    if ( !face->size )
++      return FT_THROW( Invalid_Size_Handle );
++
+     if ( !req || req->width < 0 || req->height < 0 ||
+          req->type >= FT_SIZE_REQUEST_TYPE_MAX )
+       return FT_THROW( Invalid_Argument );
+-- 
+GitLab
diff --git a/meta/recipes-graphics/freetype/freetype_2.10.1.bb b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
index 2d444bbf19..72001c529a 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.1.bb
@@ -15,6 +15,9 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
            file://0001-sfnt-Fix-heap-buffer-overflow-59308.patch \
+           file://CVE-2022-27404.patch \
+           file://CVE-2022-27405.patch \
+           file://CVE-2022-27406.patch \
           "
 SRC_URI[md5sum] = "bd42e75127f8431923679480efb5ba8f"
 SRC_URI[sha256sum] = "16dbfa488a21fe827dc27eaf708f42f7aa3bb997d745d31a19781628c36ba26f"
-- 
2.25.1


