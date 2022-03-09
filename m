Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C14C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 17:07:56 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.457.1646845675625496633
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:07:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K+3LSC/Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id 9so2508964pll.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j9QeZgCRHVBSiR3Cs5QsSCmH7x69cuMyTwuP0yTgNG4=;
        b=K+3LSC/Yb+EcEhVE50VSIP0EMijFV2zPs6DMGtIVX9udni09KDaZGarv5f0u4+e02h
         LOFY74b+4k198Rctz7sLazMc9Iz8NLvlxjNjtKdqfmBoSlwOYnC5/zak3R9V4VwvSIDr
         BG5m89jiReg4smP4LByJ19qSZ/MpcXpKSsUy9aGh1q4apMtSEgBXz6VS2l3bP1mnbFt5
         zUG5oiVyeoQiNC7/Mh76eIKdkvplEu0WOkyDkhxcEFRRnqKRIjXL9gnyNwdonGzF6+J6
         UIZ3vk8Mqa5OpqgaduoNGkocGlYVRtqUbgdxfO3Tqs9LId26YqX4HdDbaYejfOVMJep5
         hfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j9QeZgCRHVBSiR3Cs5QsSCmH7x69cuMyTwuP0yTgNG4=;
        b=2m1iyjfm4UjPCKiRQD6MC1uM2hMAC/xzPRQJW0/obMmWvZGT2Zmisilzh51guUyDO4
         9prNBShdufJ2qJUv5YDSy+VXNdIuSiDUFeebaSyXL8eB94mtrCxEekg47rZnDBAs0yu3
         LcpzppIypmYnD9f5JGiVh5+d4+lCXac3kf+yD//mqUXPT/1pp6dY6J4ALGWEU4x2mnz1
         8qYuGlXHFggzMonoH2nu0n/kcjZ3MsYZsGj4AgCvdOhV399H4nKWYpXq7/l+mDWIUfoB
         W02ATxemDEMZy1uum1DYLuOCyy/4yDpKTyNzkUPVCRrgLZB/ETAGv9HAC4D29p3P9kfU
         Izvw==
X-Gm-Message-State: AOAM533xTg4xdmcEkOJ8rch1wTMxdQGW/1p2yv7q83oj8/bR+VSuubAe
	QHZNgCnb0pVga6PGiHQnjcA5kRoqK0d4aw==
X-Google-Smtp-Source: 
 ABdhPJx5GlAtHLN6fnZ/xTEi6bWTYESTyrOMu7RN1X5Bg39aPMdLf8iqE9h8FxvCj6c9pobgNDWe2w==
X-Received: by 2002:a17:902:d511:b0:151:fa36:f1a1 with SMTP id
 b17-20020a170902d51100b00151fa36f1a1mr521921plg.17.1646845674870;
        Wed, 09 Mar 2022 09:07:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 s1-20020a056a00178100b004f731a1a952sm3940277pfg.168.2022.03.09.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 09:07:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] qemu: Fix build when x11 is not in distro features
Date: Wed,  9 Mar 2022 09:07:51 -0800
Message-Id: <20220309170752.2892032-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 17:07:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162979

There is use of MESA_EGL_NO_X11_HEADERS which is now renamed in newer headers to
EGL_NO_X11 from mesa/khronos headers, however this define is
relatively new and 3D stacks do not have this adopted but apps
like qemu and bunch of others depend on it, I guess they assume mesa.
One can argue that its better to fix the 3D stacks to behave
like mesa but this means every BSP using these stacks will need to
carry such a fix.

https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/include/EGL/eglplatform.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_6.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
index 062ed32b015..c7eef0a9d5e 100644
--- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
@@ -6,6 +6,8 @@ DEPENDS = "glib-2.0 zlib pixman bison-native ninja-native meson-native"
 
 DEPENDS:append:libc-musl = " libucontext"
 
+CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
+
 RDEPENDS:${PN}:class-target += "bash"
 
 EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
-- 
2.35.1


