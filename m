Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EF0C4332F
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:24:37 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.1160.1652811873487121132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=42kuAEcG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id c2so351145plh.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3eexIvgFKImzEWmFv9GiJGMZRASQ1IWytLAzQyz9WAg=;
        b=42kuAEcGN5jsDj2YfwCjRaWM+ZaQ31uQYvmR7tYVf4SxG1g4gh3DqXeZ26QGma/cdx
         /6hAzAVolpbjHQ4igIq+jdq3UGS8mGSawii78bl/XtSBSJ/JNBeaPh6c/QtfJcGnSk33
         uIkJbvayo1uz3PnNOPN8RK8uYGbtgf34HkEGQjOZUY4MYiCfvCPMTKyzKsjk87jcOTPf
         Mk9yIjBO9fHG9wGf4Ll/GH/hFYLiFIE/WTXzhajGEjgIP3BwqHmz+G6HIe8PeyoPQcU8
         fMPj5SZQdchIYcGAgU+EehYKvMYilVOC/xm55FUCbtmAK+DMHInzfc7vDfpyjq8mtqU+
         TNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3eexIvgFKImzEWmFv9GiJGMZRASQ1IWytLAzQyz9WAg=;
        b=2aovTY6PN+UKBa7zaEwbS/r96/tHUm0zvGA2gdD4rBl2F1Lmt4qgZhx0veKwbfILV8
         UrXfHHxUXJwQI7vTKaipZBFBJAIyKdPbV1nwRxw1IIYPpkMzZmvmRTloVcxcgnoC3RYJ
         Zm4GPTFR2at2llNmYErcs6vG45NlW9yVmG87615SvTKzM/Jwm7en2UP0txY2wWt2U9uY
         kfvveAmdomQv9+ZmbsBABkFriVfDzhF2p9N1+KmSDFVVJhCU60a8rxuKMKLNU1PNKoxS
         yY+jgJwUV1bkxqhfTCOawgvwf93t5eagP72CxeUVNlOAyVj+nbVvucBabE9sX9F0SzSb
         9RoQ==
X-Gm-Message-State: AOAM530Gsj4xVVGHnuTtSqwBC8fv1Qek/XE4dwsWPZ4Q9VI9kc5yhQyn
	mDcRX3fvHgidhB97ORV4pWhdzYXHQ+y/U+0o
X-Google-Smtp-Source: 
 ABdhPJzamiSz7ZHNtnqbq8/lvrF3HYL8d2Fn/w1wK0kAwfmO2cUXsnomPl5R/GUTwGx34i6OSf+MZQ==
X-Received: by 2002:a17:902:d485:b0:161:b4bd:a43 with SMTP id
 c5-20020a170902d48500b00161b4bd0a43mr2542696plg.77.1652811872230;
        Tue, 17 May 2022 11:24:32 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.24.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:24:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/31] freetype: backport patch for
 CVE-2022-27404
Date: Tue, 17 May 2022 08:23:47 -1000
Message-Id: 
 <af45711f0ab36a1b63fa338755f9a51b227393d1.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:24:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165746

From: Davide Gardenal <davidegarde2000@gmail.com>

CVE: CVE-2022-27404

Upstream issue:
https://gitlab.freedesktop.org/freetype/freetype/-/issues/1138

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../freetype/freetype/CVE-2022-27404.patch    | 48 +++++++++++++++++++
 .../freetype/freetype_2.11.1.bb               |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch b/meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch
new file mode 100644
index 0000000000..3335fbda06
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch
@@ -0,0 +1,48 @@
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
+Upstream-Status: Backport
+https://gitlab.freedesktop.org/freetype/freetype/-/commit/53dfdcd8198d2b3201a23c4bad9190519ba918db
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+ src/sfnt/sfobjs.c  | 2 +-
+ src/sfnt/sfwoff2.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
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
+diff --git a/src/sfnt/sfwoff2.c b/src/sfnt/sfwoff2.c
+index cb1e0664a..165b875e5 100644
+--- a/src/sfnt/sfwoff2.c
++++ b/src/sfnt/sfwoff2.c
+@@ -2085,7 +2085,7 @@
+     /* Validate requested face index. */
+     *num_faces = woff2.num_fonts;
+     /* value -(N+1) requests information on index N */
+-    if ( *face_instance_index < 0 )
++    if ( *face_instance_index < 0 && face_index > 0 )
+       face_index--;
+ 
+     if ( face_index >= woff2.num_fonts )
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
index 5055ff185c..257c5c6d9a 100644
--- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
                     file://docs/FTL.TXT;md5=9f37b4e6afa3fef9dba8932b16bd3f97 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \ 
+           file://CVE-2022-27404.patch \
+           "
 SRC_URI[sha256sum] = "3333ae7cfda88429c97a7ae63b7d01ab398076c3b67182e960e5684050f2c5c8"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
-- 
2.25.1


