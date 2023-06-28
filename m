Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BF7EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 15:00:58 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.18931.1687964450666027006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 08:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=A7ovOdpu;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9920a6a6cb0so275213966b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687964449; x=1690556449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MDASrGUs4f/xYIShmb+pZm6lVZPB2pfGQuKDXCT/KYs=;
        b=A7ovOdpufb8Xy6oIy9afY9AHJceCWZ7Ls5GFwLn2gr8/7v6q24HR8fcihvoPnVCfaE
         W+JP2JZfVP8kgl75l7NPdil9qlJaV3SMEXWa9iidspcAw4CFZ9cAbjMs9JMvWka8fHaJ
         JSliOH4OJ/dAkDFeEGO1fhCdr7N1cz4IzSa/k4+qtJ6frPbSxr+PvFw2HkFAHF/wZnxz
         eiHBWIaj1VA0JOpSM598wLvM4RFwj1ifbW6ZpXjgXG5VFYbVOBfFnkMkWy/TRv2Ui3lE
         e59vv/gb/Rpf7McEvVGszInu+eUkQ6DRvrfvEfw/Oj0n3fzzZyZFxvJUPDfGIthH+npG
         NxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687964449; x=1690556449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDASrGUs4f/xYIShmb+pZm6lVZPB2pfGQuKDXCT/KYs=;
        b=HF0dcOaie5mguXM56jDEc8PybpobaYlUBXc/c8FHxOvI0ln5mMJrT2Qt0O6vR2wXIU
         W+uLp2tNqtblGIfdCg4MPhUu/9yaB1piNb6Gti+oQLm+iofT8hKqDQ4Ef82lVogePGB8
         cWUW4W/qlSJYl+xmXM9FVWIX+diUD3OvWZwt7LjftCp86a+rGp0ADCQNampNiRD99dDs
         x/mQcCzyQnfUa5d2dxAbrCCN/Jun6uOGAZnV6b7PKUL2J5/8sD5vdmnKoom8lryyZ5sR
         B2oZhLne2fgZzYbmVoz6vXJRQW9AUl2B6VEdwNefAhT1RRpCpKESgqnXdjee+3AAhi1o
         r18w==
X-Gm-Message-State: AC+VfDwUqy9kGnPghWG6QPB/c5gmb0EWMnd5qPLVmjattLxDt8uLjH4h
	pkXNl5H9ihPcIcvybb3SpEvx9CppOW8XyA==
X-Google-Smtp-Source: ACHHUZ7jMqF4uVhWU2E6/Gk6r34VasF3RPPABAC4P3OFf18+fTEllQ0Zf/0gVLpI4m5ru4E49gfcyQ==
X-Received: by 2002:a17:907:2ce9:b0:98e:2423:708 with SMTP id hz9-20020a1709072ce900b0098e24230708mr7997253ejc.62.1687964448858;
        Wed, 28 Jun 2023 08:00:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a170906720300b009926928d486sm969433ejk.35.2023.06.28.08.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 08:00:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] gstreamer1.0-plugins-base: enable glx/opengl support
Date: Wed, 28 Jun 2023 17:00:40 +0200
Message-Id: <20230628150043.70814-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 15:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183588

This is required by latest webkit when built with x11 support.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gstreamer/gstreamer1.0-plugins-base_1.22.4.bb           | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
index 7b78c7d5c90..3c0cb7dc6cf 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.4.bb
@@ -21,7 +21,8 @@ inherit gobject-introspection
 
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to choose OpenGL APIs/platforms/window systems
-PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2 egl', '', d)}"
+PACKAGECONFIG_X11 = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl glx', '', d)}"
+PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2 egl ${PACKAGECONFIG_X11}', '', d)}"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
@@ -32,7 +33,7 @@ PACKAGECONFIG ??= " \
 "
 
 OPENGL_APIS = 'opengl gles2'
-OPENGL_PLATFORMS = 'egl'
+OPENGL_PLATFORMS = 'egl glx'
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxv"
 X11ENABLEOPTS = "-Dx11=enabled -Dxvideo=enabled -Dxshm=enabled"
@@ -61,6 +62,7 @@ PACKAGECONFIG[gles2]        = ",,virtual/libgles2"
 
 # OpenGL platform packageconfigs
 PACKAGECONFIG[egl]          = ",,virtual/egl"
+PACKAGECONFIG[glx]          = ",,virtual/libgl"
 
 # OpenGL window systems (except for X11)
 PACKAGECONFIG[gbm]          = ",,virtual/libgbm libgudev libdrm"
-- 
2.30.2


