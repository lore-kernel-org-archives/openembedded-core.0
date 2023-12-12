Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0EFAC4167B
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 22:40:46 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.9987.1702420837419327286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 14:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DwNSO1dm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6d9d0d0e083so4957334a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702420836; x=1703025636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grF2cvE7YYp2oRWRLciESNqd9x5VgFrkjD5u5pUZu2g=;
        b=DwNSO1dm84bkra7/oOooXI6lXJo7WjaxyKsTA1+aF8fyb5wUphf3EzocKk7Zp8CneO
         yQhtwmHCcj3K8VSXG26ED4hVy+WSFOYEvWFb8AfHsmmpvWKKP9dPZhW+OcXmVkVr4/tW
         LGYNOxhcbWVfgU0nSkOvTlniXty0juP3JE7yRWAcDBT/wFbQD6FR9CWNKLzqjTkjfIbR
         DNfP4nf/v+wbmq3oeV2HtYV9/+/VNDTlaPwUQdSELihr/dMgeA2U4SmpbpKROp2Ok1pt
         yO0gxd0hPozm+uhJwDAcE0RySPywfOO6soue1x25b/j62WQm1OcKaVHQ8LFHtQnG0iQv
         1Mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702420836; x=1703025636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grF2cvE7YYp2oRWRLciESNqd9x5VgFrkjD5u5pUZu2g=;
        b=N78h2HUVN7NGN+yuwl6UtCwgpjeBsGi3E2zlnHCuIUoe+cPRl4Sg1IH5yhAZGAwcjM
         2Hru3dGcn0e9iGWdZcvxlVZ85thZ4EYc39v0u8yGvO5hWWdvJSSv7bgGpZPB4rYuv47j
         mKE9xMX3i8ZK9QlzUCR7Q2kB+ZpXl1acBcGqWpTBZ59wrJiuwwIijAruA7LYUPpJGfZs
         Yp0RiAZbTvwMeo7jETI/7eDwsmcizdhwH2SRZEuEnyfyf/d8wEhTLxpNKZfAuW/2G+qd
         b6bdQCiz7eEaeDnkqKnT6my/J0qqOYq5HzEDXrkfW2Vh7Mc72TCY6FM4R9dLtBmOZlVm
         Y8Hg==
X-Gm-Message-State: AOJu0YyFL3myNlbm60VLYDtmIcj9vvYDH1yiOnF5TJrjaoklq8rdLSqr
	tdEtqVHyN6fPzyRwB7fBAefPqsU2kzcZCbXAxr4=
X-Google-Smtp-Source: AGHT+IENgf+Xb8AZcuOlb7AXUcSl0xv6YupJWtXAfa1o0hcxZSCxuZH/8ezKwBZvf/Uwf7g8qp5PAQ==
X-Received: by 2002:a05:6808:14d5:b0:3b9:e3d7:1271 with SMTP id f21-20020a05680814d500b003b9e3d71271mr9395930oiw.9.1702420836473;
        Tue, 12 Dec 2023 14:40:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006d0951e74cbsm3847974pfo.178.2023.12.12.14.40.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 14:40:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/5] gstreamer1.0-plugins-base: enable glx/opengl support
Date: Tue, 12 Dec 2023 12:40:19 -1000
Message-Id: <eb9eccb08f00e413959ebbe115f79b36fef7c484.1702420654.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702420654.git.steve@sakoman.com>
References: <cover.1702420654.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 22:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192250

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is required by latest webkit when built with x11 support.

(From OE-Core rev: 024edebf6f722ae4d05411be348730d9eeb3bd7c)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


