Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D258C61DA4
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 21:48:53 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.16692.1675547331600055380
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 13:48:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=hrmaHB9/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so8024606pjb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 13:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZDzAU9VSkpxfmNc7mGyDonBgdosjQsc98wSyB/OLD8=;
        b=hrmaHB9/vSybm2f7/xiHUELZehintDDgx940lYXgNSaDlsl6+LEkRr7o7rwqFPIyDD
         3+NsQdajJ2CsfDFcNP6ykXt4cE8NPXqhxx5B9tYc1ylK6mha1zdnkP3EiqglIZa0FRA1
         fd0s109AbXNGVSvpRutuOw0oVc9j9xcfIi03FSgCkpEe0Dvl2QzAcwBZZSQIDzYhguv5
         uMx4zQ+PCAl4sK9Xm07rOaR471PS073yWAl9uO+s012E2Gm50Ua+Ot9sweBE4xQOplvN
         Ng8tD8AN9mYD/x37jYVMqJUWkmj4ZBHDvV0Rq++uxKSF2/FqSSyF6FmC8BPPsey+ku/s
         r8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZDzAU9VSkpxfmNc7mGyDonBgdosjQsc98wSyB/OLD8=;
        b=M3G5suRtV7EW9Pxx4hEQ24+f3f4v7xz74IkglO6iU15pLfIHlCRtsLsSgtxLCckcNA
         owfTKv4HwqqSq4XU/mjupRbojJQaTkYYvR4YQTPTWTBhGLdc5QUC4CJ6Fo0G1bU9su3Y
         82JhmC2MsM4KjYApH+fCrF9wzzKQg1oYEf/IAnqq0Pr/YJ2Vjw6hNhlJ1Wuslbxh0+5v
         ZPO/cXvjrMQ7rKrmiF6cn7gr4HLvn+Pvj4sfrJa6Ln0ajlAJZ4L8gSTHO8PTQaAT1t2F
         V8FiCihdgrlU2OTQ4OII6VkiXxaoO+3U+kZXJprRhC+8RadifgypTQ68FZ4W0nbZBuzD
         MM5Q==
X-Gm-Message-State: AO0yUKXFdCnn5XMBXOrlnRH//ovZnxXtDzuZSsrx8gIf07so1AUvj2l/
	7AjYvmocTCasR5cnADWrkEx1/eOVy3fTsSKb/sg=
X-Google-Smtp-Source: AK7set9p3MgA9bBYGlVZWlCtOZiOTQ/mNRtE2wz+CXrrY8TEIfdCNhhUyQagmXc6nompK/eB4/C64A==
X-Received: by 2002:a05:6a20:7a92:b0:bc:e7c0:7d99 with SMTP id u18-20020a056a207a9200b000bce7c07d99mr14250256pzh.10.1675547330661;
        Sat, 04 Feb 2023 13:48:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a001a4400b00590774b9ea1sm4150960pfv.107.2023.02.04.13.48.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 13:48:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/12] libsdl2: Add fix for CVE-2022-4743
Date: Sat,  4 Feb 2023 11:48:28 -1000
Message-Id: <f40ad856e814366c2d3588001dea1e0df7a3fed6.1675547139.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675547139.git.steve@sakoman.com>
References: <cover.1675547139.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 21:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176770

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add a patch to fix CVE-2022-4743 security issue "A potential memory leak
issue was discovered in SDL2 in GLES_CreateTexture() function in
SDL_render_gles.c. The vulnerability allows an attacker to cause a
denial of service attack. The vulnerability affects SDL2 v2.0.4 and
above. SDL-1.x are not affected." as per NVD

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


