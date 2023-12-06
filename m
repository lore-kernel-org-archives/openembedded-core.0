Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C8CC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 09:13:46 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.27370.1701854022645791588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 01:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dk9uzqiv;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a1b75f59a12so73676466b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 01:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701854021; x=1702458821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1hTVwJwIlTqV2hswGVNkh1l62gRrzqWA8UbGyPCMvQ=;
        b=dk9uzqivfBCRi/wqOCoDboyztIHWialDhXMml7pRPvWkwWmm3vww5qyT5kQAI3nR6Z
         PzuQ1ZylxcHh1Dxq01sGsPVcseqgSVww+1+vWf3Y1jutitcx0cAmwgV8AB0nCVwfzxFY
         4U0G/lqbD5MnTXgYU+S92E3lOhY2IVeWv/Y+bVGmL1F+T1e150qOwDxUPOjQB6w5KzKI
         zhjO5gDmNUDiBwIrstQ+dbV3yEkjInWqGbQBuoOgN/pFW4xHGGVC2C2knK5E6LWo8IB4
         n5GVFugwjfmZ7Nxr/hRHjnftacKo7LrYUFNg13PAKXtntVWwPsjmJRxpXktUr0lA7rFj
         Wb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701854021; x=1702458821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1hTVwJwIlTqV2hswGVNkh1l62gRrzqWA8UbGyPCMvQ=;
        b=K3MyubyEs+Kcj8F6N4M8PiZH8UQVK5er+cDNSVACUrwkzzB0t/cJa+m3hU4E/WFU/U
         /p4cesRHKD6dlcgPDMxarA2wmtYQXQnYJe20v0o69LiGWGbnB2/zyoGnrcryKGCg7HA1
         WCriXljoyNSuEe7AmuOl+ifskwG+mUv28Z5sazEsTOmQjHIabNv3Dgjo2XmJd0Hsquli
         Vx/IxNJrvoXQ/2kOenALP0iMKr/FqhtmhClbo4THDNDazC5hKJbmatrlO7bxj46e3foT
         e/PeyRHo+ogOiedOAVMOqDVBGPWWxXtnNAtPUWltwCkP9YuP0cWY63xsHA7a6xr8RcfJ
         n7qQ==
X-Gm-Message-State: AOJu0YwKdma2sbjnuKfKh+cWjHy3RpTrVrr434NkxKKpvgsqtooZ1r4D
	/8mLMR01zf3R+afSVFI2eNfo5QpizdcySQ==
X-Google-Smtp-Source: AGHT+IG/y7QJBbsxYSls/WmW4bSx8jCJ4H2+IsJwzWIypWa/JxYcdO2ts2pz2xHfXgMNBB9QaBiXxw==
X-Received: by 2002:a17:906:2b0e:b0:a1c:f0d8:d50e with SMTP id a14-20020a1709062b0e00b00a1cf0d8d50emr202780ejg.69.1701854020425;
        Wed, 06 Dec 2023 01:13:40 -0800 (PST)
Received: from localhost.localdomain ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id oy26-20020a170907105a00b00a1d0b15f634sm1402747ejb.76.2023.12.06.01.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 01:13:39 -0800 (PST)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [kirkstone][PATCH] gstreamer1.0-plugins-base: enable glx/opengl support
Date: Wed,  6 Dec 2023 10:12:49 +0100
Message-ID: <20231206091249.1357218-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 09:13:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191876

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is required by latest webkit when built with x11 support.

(From OE-Core rev: 024edebf6f722ae4d05411be348730d9eeb3bd7c)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-base_1.20.7.bb           | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
index 8822c6a905..8dfa70aea3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
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
2.41.0


