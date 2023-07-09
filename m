Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8BDEB64DC
	for <webhook@archiver.kernel.org>; Sun,  9 Jul 2023 03:47:01 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.11683.1688874420403001730
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 20:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jHBjS8et;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-668709767b1so1859633b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 20:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688874420; x=1691466420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MBBS3lxrh4tpjGRkehfryAczZsqquB371PUt0Yp5RXE=;
        b=jHBjS8etQYEae/Bszk//t/ULAIFGN8k/J2Tv+GbJvWk+Zdlp0BhbJ29BBicv4Dmod/
         s24tWetgVVJLiRWC71B/Vflg2MNWf/7P/jKynPEs1uVXmfZC9OXCf3+xZpb5LNGw+Wuh
         88sMapnmfoDrlRx10hMmeANDFUm7ngDDoCec4FNpM155O7TT+G2cspQeCYkDTrcA3Drv
         k6e2zHcKNaMKDH7Qwf8jf9+fAmVOnDarROHQ73yjzDHu6gNtU63GTD1FqArtAeGX7PcF
         AB1QxjIixwTEs7jAvshsFUHN5y/lB0LnuGJEvPz+vJDvFBUQzGjeiNJW1ZwlziXxBPpE
         ieWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688874420; x=1691466420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBBS3lxrh4tpjGRkehfryAczZsqquB371PUt0Yp5RXE=;
        b=ifrnyjcRGhFrzIrCbn0G1B2f33mPDIUU8Xagk6AZ0HD2lXwQCqnHx/bgZxHAtRztRA
         C4vDIwA7gsy0hxYl0BzAjjieZrRflUuXmsTGN8JJHS9DfCCBLYGPBzro/Aq0cWB2ugfH
         I7GJF67SnIgza+Pi0Kh672o/9lLlwLxp7ATZghYJLhGFOkdg85P6Pak/63Da7OtdzyC/
         VEaiLDcmO1WP2NRsd//PIwlKr121hUeFWAsGfZBPwoC3gxxIj7JP0YeY7TIVRn5kivTS
         4egY0/qVaMImZpiPMx4IhFTaSp14sDZngmDMCkkXbYe99lsXJP31WExvzjJWXghoOcnG
         PHXw==
X-Gm-Message-State: ABy/qLbvsO9LBGS88/B9V4ch9tBeyQ/81DIWO7k5ajEFAHV9xPEPpQLK
	Uh3l4JfZAMu0a8JGcDwYMDX+0XlwrHo=
X-Google-Smtp-Source: APBJJlGY+kvbDj0G5eJmkFrhxC7+6QroduzLtctIkpsWNc0r7htWiDmzD6mj6LWfVmbY0lQu1v/gow==
X-Received: by 2002:a05:6a20:841a:b0:131:3598:f4eb with SMTP id c26-20020a056a20841a00b001313598f4ebmr2657594pzd.28.1688874419494;
        Sat, 08 Jul 2023 20:46:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::a45c])
        by smtp.gmail.com with ESMTPSA id g184-20020a636bc1000000b0055bac197d70sm5027324pgc.53.2023.07.08.20.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 20:46:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Unbreak build on platforms using pvr graphics drivers
Date: Sat,  8 Jul 2023 20:46:48 -0700
Message-ID: <20230709034648.790722-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 03:47:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184038

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../check-GST_GL_HAVE_PLATFORM_GLX.patch      | 32 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.40.2.bb  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch b/meta/recipes-sato/webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch
new file mode 100644
index 00000000000..245fccdefec
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/check-GST_GL_HAVE_PLATFORM_GLX.patch
@@ -0,0 +1,32 @@
+Add additional check on GST_GL_HAVE_PLATFORM_GLX before using gst_gl_display_x11_new_with_display
+
+This ensures that there is a compile time check for glx support in gstreamer as
+runtime check is not enough because gst_gl_display_x11_new_with_display() API comes from
+gst/gl/x11/gstgldisplay_x11.h which is only included when GST_GL_HAVE_PLATFORM_GLX is defined
+therefore make this check consistent to fix build with some platforms which use pvr gl drivers
+where this problem appear at compile time.
+
+
+/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/webkitgtk/2.40.2-r0/webkitgtk-2.40.2/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp:68:31: error: use of undeclared identifier 'gst_gl_display_x11_new_with_display'; did you mean 'gst_gl_display_egl_new_with_egl_display'?
+   68 |         return GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast<PlatformDisplayX11>(sharedDisplay).native()));
+      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+      |                               gst_gl_display_egl_new_with_egl_display
+
+This issue is 2.40 specific since GLX support is removed [1] from trunk upstream, therefore
+this patch wont be needed when upgrading to 2.42+
+
+[1] https://github.com/WebKit/WebKit/commit/320560f9e53ddcd53954059bd005e0c75eb91abf
+
+Upstream-Status: Inappropriate [GLX support is gone in 2.41+]
+
+--- a/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp	2023-02-20 01:22:18.917743700 -0800
++++ b/Source/WebCore/platform/graphics/gstreamer/PlatformDisplayGStreamer.cpp	2023-07-08 08:45:09.739177065 -0700
+@@ -63,7 +63,7 @@
+     if (glPlatform == GST_GL_PLATFORM_EGL)
+         return GST_GL_DISPLAY(gst_gl_display_egl_new_with_egl_display(sharedDisplay.eglDisplay()));
+ #endif
+-#if USE(GLX)
++#if USE(GLX) && GST_GL_HAVE_PLATFORM_GLX
+     if (is<PlatformDisplayX11>(sharedDisplay) && glPlatform == GST_GL_PLATFORM_GLX)
+         return GST_GL_DISPLAY(gst_gl_display_x11_new_with_display(downcast<PlatformDisplayX11>(sharedDisplay).native()));
+ #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
index b0dd95b78fc..8bef0b16055 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch \
            file://0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch \
+           file://check-GST_GL_HAVE_PLATFORM_GLX.patch \
            "
 SRC_URI[sha256sum] = "96898870d994da406ee7a632816dcde9a3bb395ee5f344fcb3f3b8cc8a77e000"
 
-- 
2.41.0


