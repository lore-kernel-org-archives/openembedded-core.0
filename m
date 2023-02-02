Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8A2C05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 14:14:06 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.15272.1675347243024488213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 06:14:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CvgzSrv7;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id f3so1414140pgc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 06:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rhtGsFsFt3ngGq4bNJJD0+BlTG9NBcEMX/w4pYy4TRU=;
        b=CvgzSrv7GJ4wHyPjv9EGX0TTZMC4AMx+S7lgAI7qdr/A28Cs4zpUyc7qlfVx2Z35pr
         M2KXfFHUydjP3ECF0DhrDiKi+Xd1xj2+k05EUxh5bbnwf5pcFSnGRpCr2LwogApngnVH
         qp77HcW67KxEvK3cT75Sncvbl40tSSZlMCi12S4pg8GCdsvE6GsKVk4R0DmKdlat36dh
         /Z/aHtfb2a4Jv9X4DOqm1PpTv0v0IbFqTk9v4fdIv5MgveCVNmKULzDYun3CPUrjIA7d
         1wtZg26zU9W89AdyzWcBpR4wKoZ5JcDN8UYaDXzZagSU5kbORwpDq8PB2FYPG1lrEU+M
         YWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhtGsFsFt3ngGq4bNJJD0+BlTG9NBcEMX/w4pYy4TRU=;
        b=0W9LOEeTXY6h/4S0U2soMy2RfLeULWus9jhrW41ctkcvfYLrr94UrYHd+dEvTI6Dv1
         hYCxbDOUlUIfBd5mfFNFabMhUaVBquWeN1KN96UL1TuTJqikodTVJiQ0b/fGK+VY4w2D
         pb6vfbTmUyIhP98ooGFo653q+pL1Kvpw3b5X6+ztsihjmWECCvf/25/A81vsyRz2MGge
         N0Af3PliELM/0vm/F5Fx95sMM5NhwyVwRfS80V5HnpU6nsOzGt2Z8TWhgmQ1JSibb8SZ
         Ud+t4a1tj/bwFYOBfPbQQbh7peJgrZrCCH4JLNI7TIq2gas5ki2hRdkELlu5ZXC7/SvF
         b/CA==
X-Gm-Message-State: AO0yUKU06U3Puhvybz1dbX0uu4DYXHeFQq3Rq9xvJsjPDFyrOGLO9q5x
	/dbLFFjznuRnhOb9hB3c8w7PSbDwEg4=
X-Google-Smtp-Source: AK7set8Xpa9bUd41S/VP7keo8K60Cm/N4Kyol8WizdwRsv8rCJMThUIUXOVIwpWkwoaNghPrKxAJeQ==
X-Received: by 2002:a05:6a00:99f:b0:58a:fddd:9b1d with SMTP id u31-20020a056a00099f00b0058afddd9b1dmr7867471pfg.10.1675347242222;
        Thu, 02 Feb 2023 06:14:02 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.235])
        by smtp.gmail.com with ESMTPSA id v66-20020a626145000000b005882b189a44sm13645135pfb.104.2023.02.02.06.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 06:14:01 -0800 (PST)
From: ranjitsinhrathod1991@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
	Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Subject: [OE-Core][dunfell][PATCH] libsdl2: Add fix for CVE-2022-4743
Date: Thu,  2 Feb 2023 19:43:27 +0530
Message-Id: <20230202141327.360962-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 14:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176701

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add a patch to fix CVE-2022-4743 security issue "A potential memory leak
issue was discovered in SDL2 in GLES_CreateTexture() function in
SDL_render_gles.c. The vulnerability allows an attacker to cause a
denial of service attack. The vulnerability affects SDL2 v2.0.4 and
above. SDL-1.x are not affected." as per NVD

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../libsdl2/libsdl2/CVE-2022-4743.patch       | 38 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2022-4743.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/CVE-2022-4743.patch b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2022-4743.patch
new file mode 100644
index 0000000000..b02a2169a6
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2022-4743.patch
@@ -0,0 +1,38 @@
+From 00b67f55727bc0944c3266e2b875440da132ce4b Mon Sep 17 00:00:00 2001
+From: zhailiangliang <zhailiangliang@loongson.cn>
+Date: Wed, 21 Sep 2022 10:30:38 +0800
+Subject: [PATCH] Fix potential memory leak in GLES_CreateTexture
+
+
+CVE: CVE-2022-4743
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL/commit/00b67f55727bc0944c3266e2b875440da132ce4b.patch]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/render/opengles/SDL_render_gles.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/render/opengles/SDL_render_gles.c b/src/render/opengles/SDL_render_gles.c
+index a5fbab309eda..ba08a46e2805 100644
+--- a/src/render/opengles/SDL_render_gles.c
++++ b/src/render/opengles/SDL_render_gles.c
+@@ -359,6 +359,9 @@ GLES_CreateTexture(SDL_Renderer * renderer, SDL_Texture * texture)
+     renderdata->glGenTextures(1, &data->texture);
+     result = renderdata->glGetError();
+     if (result != GL_NO_ERROR) {
++        if (texture->access == SDL_TEXTUREACCESS_STREAMING) {
++            SDL_free(data->pixels);
++        }
+         SDL_free(data);
+         return GLES_SetError("glGenTextures()", result);
+     }
+@@ -387,6 +390,9 @@ GLES_CreateTexture(SDL_Renderer * renderer, SDL_Texture * texture)
+ 
+     result = renderdata->glGetError();
+     if (result != GL_NO_ERROR) {
++        if (texture->access == SDL_TEXTUREACCESS_STREAMING) {
++            SDL_free(data->pixels);
++        }
+         SDL_free(data);
+         return GLES_SetError("glTexImage2D()", result);
+     }
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 44d36fca22..fa29bc99ac 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://directfb-renderfillrect-fix.patch \
            file://CVE-2020-14409-14410.patch \
            file://CVE-2021-33657.patch \
+           file://CVE-2022-4743.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.25.1


