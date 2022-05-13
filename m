Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1537BC433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 09:57:30 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.6397.1652435847423014855
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 02:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d/gC4m4e;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id d6so9351112ede.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 02:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z51phJK2W/xc2359nzKJN78xoPEOtvYBYl78y4D2J30=;
        b=d/gC4m4eXGF178KafIHr1NPkRuvMvaE7lr91Zo0WeJ7pkdTEleqXssnle6vR1Vf5n5
         ++1raX7L/eDcjOLLThBydfC7MK22vnxYx4soz1dgVITb1+utoZEWVGoQCMeM68EhGoS9
         OABmCrw+qndoeI2TpLsAkaP21swTubVYeW8J7ZNPam5x0RS/eA4WoStICBQejKv8x2eR
         tz7VP5I61rfOxl9WoTke0jGI6KQhkc0N1zsPbLlh0502MOtT3e4fgDgP/ZFFBj02Q3po
         SC3fUKe5JvGtc7FBbWKOLV2/qx2m3PlJ8JgfvS6UXZg36lkermJRC7NWI6Q6SauvWC2l
         Xvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z51phJK2W/xc2359nzKJN78xoPEOtvYBYl78y4D2J30=;
        b=VS4pcjdvBJYZmufSj1FupB2BMpHi+LWR4Hcpq3fY3OJSBIoehmgVupP2k4NN1Q/MFL
         l4fNbPpwAHD6DovVQXkUFnlwjA3hNRa4Jd+IgqgOCn7SaBUCoPxwQBMfRt9sC0sTuvpU
         OHffm8ye5Y9SjqnoakZtjqrLmBBiN8BzLBhVoR6Mp0BNWgXHMoEP0x03jpzZc3uaERhi
         DY8TCgy6Hn9gLZKGZPl3YlNz2qgLsT9+yW3kLpn2epPDgN1y2kVztgjJlGezJrPHejrs
         NUaPN8Z7H/oiHpwCKxT9wGFxylgc/Ai6/LpgRTPaNi/Vqb+unCshEtx85vIP6SnpEL/b
         O3+Q==
X-Gm-Message-State: AOAM531QuzMCMmLcVhQrtSnB65Kccs1j2tjW8doK6gGqbI/sx7CZiqIG
	0BjFrM5+F5AltG00SMBE3/dXSBti4rk=
X-Google-Smtp-Source: 
 ABdhPJxzBy01GYj+fJIMB0m9MEPKNo+SA+nJJkv1JtOtDaj9Ab/6RKHr9zatRkTS26GQp4gyWfM5yA==
X-Received: by 2002:a05:6402:3552:b0:427:e36a:e839 with SMTP id
 f18-20020a056402355200b00427e36ae839mr38804930edd.351.1652435845423;
        Fri, 13 May 2022 02:57:25 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-80.retail.telecomitalia.it. [87.5.19.80])
        by smtp.gmail.com with ESMTPSA id
 em7-20020a170907288700b006f3ef214e37sm595565ejc.157.2022.05.13.02.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 02:57:24 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [kirkstone][PATCH 1/3] freetype: backport patch for CVE-2022-27404
Date: Fri, 13 May 2022 11:57:11 +0200
Message-Id: <20220513095711.635742-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 09:57:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165552

CVE: CVE-2022-27404

Upstream issue:
https://gitlab.freedesktop.org/freetype/freetype/-/issues/1138

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
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
2.32.0


