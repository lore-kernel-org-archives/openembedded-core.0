Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D2BC43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 02:31:27 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web12.2084.1654137083156180706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=s8CbTv9c;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id c2so3375930plh.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+ZzGOie3/MYDveRH4mArPYXg8uZmtxUisFn1lawZztI=;
        b=s8CbTv9c1D5PQQjYz7eOzMhQ6fAfXh2ebZBbeLDF2+pE/tCNlIsJADvcvoHkbyQK5s
         /zG8TODUCwgaTKs9lrk/HDo0ti81tKwezogOtz0iIEcuEU1RzoND7YYtYpdnGTu4zyY4
         NxN+l+Te3I78dl2E89AzpAcYrE5dA7QTcrsLnHc2falhsOjX2RwL5+Ovq0Y2290zoVEb
         GiYnJnz0Sxd2RBQ1ZBvsCqmlBdOqc3hv6vYgQom1oGW5SypFipWYmyJ0erFDe5WEkRXi
         GegmY2JytpGjkhm9Gb46cCt+EYIEq3KNvF5i6/benfN5do7tIbmjG2W8qrl9Xm+iwknD
         WlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+ZzGOie3/MYDveRH4mArPYXg8uZmtxUisFn1lawZztI=;
        b=Mhr5vtvtNHGkACM8UPGsgPzz9r3LrHeTrPUuVYHTCBrX7J/DdEOx4VQsXGLbHFMUsw
         6LGwK/KtHVx+lTpm8rr1p7L9LCYUoeH6qqyT81vhnIT3OH51GR7rHnNrqjfVXNM92n15
         ++ocRdq0fFa0SQeEI9rnnJepKEg9oqs5Lji0QRKBoLXSyLaMkWilhZpGqMaok1V5NKuG
         +0JyOF9npqGwxYFOzcezteO7jJJhbTEY3+HNJ7pDBUvp8wAmF3BET/1ak1SgL2A5KCuz
         UffIqcVKyw4VbxZ5rRyO3rbgZIbThG5BBQ1Fwd9pINbYPzcs54+yZARyLUYiXZV9pZ2M
         KYug==
X-Gm-Message-State: AOAM532o6httLM8cAwTdLwuvG3ayJUDi8SvAbzPD1jEv9L7yNK0nvD51
	NS19DXl/l0TDx72+DdzaxCg6qKHFaDh03oSW
X-Google-Smtp-Source: 
 ABdhPJz0qg3fQDUkY7mVbwdtZCGOCPAYlnuosZku827fhcJqIHDPTYhOSeRLLOZA/p0kmfYJv1ujDw==
X-Received: by 2002:a17:902:bf45:b0:15c:df47:3d6 with SMTP id
 u5-20020a170902bf4500b0015cdf4703d6mr2463083pls.58.1654137081919;
        Wed, 01 Jun 2022 19:31:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j23-20020a63ec17000000b003fc37053c82sm1990447pgh.12.2022.06.01.19.31.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 19:31:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/11] libsdl2: Add fix for CVE-2021-33657
Date: Wed,  1 Jun 2022 16:30:43 -1000
Message-Id: 
 <1cc84e4c51c9afaa5dcb5011e6511496e00d2c8a.1654136888.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654136888.git.steve@sakoman.com>
References: <cover.1654136888.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 02:31:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166451

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix CVE-2021-33657 issue for libsdl2
Link: https://security-tracker.debian.org/tracker/CVE-2021-33657

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsdl2/libsdl2/CVE-2021-33657.patch      | 38 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.12.bb                 |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/CVE-2021-33657.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/CVE-2021-33657.patch b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2021-33657.patch
new file mode 100644
index 0000000000..a4ed7ab8e6
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/CVE-2021-33657.patch
@@ -0,0 +1,38 @@
+From 8c91cf7dba5193f5ce12d06db1336515851c9ee9 Mon Sep 17 00:00:00 2001
+From: Sam Lantinga <slouken@libsdl.org>
+Date: Tue, 30 Nov 2021 12:36:46 -0800
+Subject: [PATCH] Always create a full 256-entry map in case color values are
+ out of range
+
+Fixes https://github.com/libsdl-org/SDL/issues/5042
+
+CVE: CVE-2021-33657
+Upstream-Status: Backport [https://github.com/libsdl-org/SDL/commit/8c91cf7dba5193f5ce12d06db1336515851c9ee9.patch]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ src/video/SDL_pixels.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/video/SDL_pixels.c b/src/video/SDL_pixels.c
+index ac04533c5d5..9bb02f771d0 100644
+--- a/src/video/SDL_pixels.c
++++ b/src/video/SDL_pixels.c
+@@ -947,7 +947,7 @@ Map1to1(SDL_Palette * src, SDL_Palette * dst, int *identical)
+         }
+         *identical = 0;
+     }
+-    map = (Uint8 *) SDL_malloc(src->ncolors);
++    map = (Uint8 *) SDL_calloc(256, sizeof(Uint8));
+     if (map == NULL) {
+         SDL_OutOfMemory();
+         return (NULL);
+@@ -971,7 +971,7 @@ Map1toN(SDL_PixelFormat * src, Uint8 Rmod, Uint8 Gmod, Uint8 Bmod, Uint8 Amod,
+     SDL_Palette *pal = src->palette;
+ 
+     bpp = ((dst->BytesPerPixel == 3) ? 4 : dst->BytesPerPixel);
+-    map = (Uint8 *) SDL_malloc(pal->ncolors * bpp);
++    map = (Uint8 *) SDL_calloc(256, bpp);
+     if (map == NULL) {
+         SDL_OutOfMemory();
+         return (NULL);
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
index 8e77c18f2d..44d36fca22 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://directfb-spurious-curly-brace-missing-e.patch \
            file://directfb-renderfillrect-fix.patch \
            file://CVE-2020-14409-14410.patch \
+           file://CVE-2021-33657.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.25.1


