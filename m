Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0B2C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 07:16:18 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.34161.1653894971779801528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 00:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I3UkfoWi;
 spf=pass (domain: gmail.com, ip: 209.85.216.51,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id n10so10190156pjh.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 00:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=WRxt6qKupPKzmjopqMmxqGdGH1tihMslq4nL6+HIBy0=;
        b=I3UkfoWi9HEuooCrl2J1r+4JMFZ48pLs1CW7KNGBByYYpuDyULpqdb0y69laIHwH9F
         fZiLBSkOjNyYcmytM11Sw5QmFb0fu5LNhUHdtykaCum788kcM0prNRpPpjJcMCzfygxb
         sQ20bUAXn+ScBrqCzd6Y8SzrVsXS+4/LHGyG9Gl19tRyzGE53krZmMuTm7Ym9MATnD6Q
         14Th8dthKDyu5tsn/Fn+EQDonaFlBJ+Fkk9HNKo/PBHqcu/5oJSVTgtAQ/dnuzn1dUuP
         u49H3P5HJapoSZpzU57zWI6zvQhcTDWDB1MsdFD42OvJsofuElzNdDS9aK8cRIuZJNZO
         pJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WRxt6qKupPKzmjopqMmxqGdGH1tihMslq4nL6+HIBy0=;
        b=yHb328HnzIpN5EedcP8mofpbU/vF3DmLZUkCCVE55knPAi+OCJCv3QzhYYgL2NzpbT
         tI0aMzV6/H+5D9qQAb+i+NhhJkckJuqZqMlMrRw57VgELx2vlynXRn8gM5k4vlHswl4M
         NV3Zac8rTbg956+j0YXQ4iLZE4cGF9hZI2zV3BZAZtiiqOjC5x+pBkJMdZY69QRv1FOK
         be2NVCH3ky1RhkhKQVxqR6rd9wYx6KCdzBZevDsX77A7GCrRwoxDn25XN4lT5M93Lpif
         0E6V8Fe49+fkHY+Wb+pAw8vJqaAF4p2V3A2aaHhDS8IHsW/rAvKRViEdzY7S3t5bc2iv
         2X1Q==
X-Gm-Message-State: AOAM530iLfUSP5jJW8xPqtx8UGVsUpYlxIPfOmy5RFrMkYaTxoMI4zV+
	O5N2ElDNkOpsSV6g69WiDXU8wublqpk=
X-Google-Smtp-Source: 
 ABdhPJxfmMHnrbySR68IorFFkG15rpBB5baoJI9UfDjtV0Z0xifZyIHQ/3TTS0z2dAjGjjvvH5sC4g==
X-Received: by 2002:a17:902:cf4b:b0:163:bfed:8af1 with SMTP id
 e11-20020a170902cf4b00b00163bfed8af1mr7988917plg.68.1653894970708;
        Mon, 30 May 2022 00:16:10 -0700 (PDT)
Received: from localhost.localdomain ([103.238.105.13])
        by smtp.gmail.com with ESMTPSA id
 j4-20020a170902da8400b0015ed003552fsm8401650plx.293.2022.05.30.00.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 00:16:09 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [OE-Core][dunfell][PATCH] libsdl2: Add fix for CVE-2021-33657
Date: Mon, 30 May 2022 12:45:29 +0530
Message-Id: <20220530071529.7663-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 07:16:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166270

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix CVE-2021-33657 issue for libsdl2
Link: https://security-tracker.debian.org/tracker/CVE-2021-33657

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
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
2.17.1


