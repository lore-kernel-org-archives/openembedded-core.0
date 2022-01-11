Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792ABC433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 12:58:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.6587.1641905882256410882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 04:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DX1kMqMA;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: max.oss.09@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so1389806wmk.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 04:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DnEgEGZ8roxzvJTxtL8kcmbA4ZDjudxsAb/Amgg4tyE=;
        b=DX1kMqMAgj75g7gyUHIaQPR3Z3ZPBaVd2V7XvTR0Ed1R4/knKbsl04nymYNt5si8Ls
         yGWOrqFbhnJWUBYzseShf4tm9vXcsIebsPrVfNZjpdNtTH+K/SqHO53iOoK82IoGkIWT
         0ogVOHL0w6anM2myCnc8Rq0ZM+q/VcEZd9+ZcpHA6oy5l+ywEiPcBa5Gri6PFmE/9SmM
         UPBsPeE6bSoczn2ZEgnXj9c2BnjVe0gXs1ttSsZghxNyCAsfSVsovukbvXikRUxFZnjb
         hjfTNo6uD4IUJbRJMLwr+XBtx3L/IrqQy9FhwGRoUjfo5YBXrPQxIMLuJ/46dreJlFSr
         IXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DnEgEGZ8roxzvJTxtL8kcmbA4ZDjudxsAb/Amgg4tyE=;
        b=koIvI/Is6Jhts+eSE6YKfxofxTbXkxB0ogyzgshxE4IAIbl9y2F13Y9RfqRY0p+1TM
         x9uMPmBrgDMfX9q+n+fEUX7skH138sHYqmoqFPrsrpkPuQDFejVMK6HxU3LjsGs1Wryw
         oXeJSNgLCVl/NLENfgGNuinKmhNC4f1CqtBpBUwtOBxBPRXvQo3fGdledlTlow5sR2rB
         WABSGotqW4+l4f0EfgmZw50agq3VO1SdSu8o33x0wxGsNtIom0uKEkQexdGpe5UlIECz
         2Ywup4imAMDcvodcnjhAg68adS4NZPHQmh5oLBDt0ch94QirkgxqE4h7EBbwqaONmQb0
         L6Yg==
X-Gm-Message-State: AOAM533ukcqNaXBlkshsOpMup9P8B70SzTCCyJKgCMPh4+Zg2lbCxuRy
	2Q/o2bUYkPPf198JbBTC3ETIhyU3uDA=
X-Google-Smtp-Source: 
 ABdhPJzhHxzQhnB1kJ49r1uXgUC2bkH/OLQ/w/DZYhVmlvUWGFi1J1tRNWFt1w6yDeR61hCZtHZQFg==
X-Received: by 2002:a05:600c:21c6:: with SMTP id
 x6mr2382823wmj.135.1641905880452;
        Tue, 11 Jan 2022 04:58:00 -0800 (PST)
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch.
 [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id
 g18sm1890619wmq.5.2022.01.11.04.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 04:58:00 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [oe][OE-core][Patch 1/1] libsdl2: fix build if egl.pc sets macros in
 cflags
Date: Tue, 11 Jan 2022 13:57:27 +0100
Message-Id: <20220111125727.1148-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 12:58:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160399

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 ...pass-cflags-to-the-appropriate-cmake.patch | 46 +++++++++++++++++++
 .../libsdl2/libsdl2_2.0.18.bb                 |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch
new file mode 100644
index 0000000000..e5d6cda0eb
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch
@@ -0,0 +1,46 @@
+From dbf0a3f6ea77a1d5f5e3c4dec7a22fcc09a49537 Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Mon, 10 Jan 2022 21:52:02 +0000
+Subject: [PATCH] cmake: sdlchecks.cmake: pass cflags to the appropriate cmake
+ variable
+
+If egl.pc sets at least two macros as the i.MX Vivante driver does, e.g.:
+| Cflags: -I${includedir} -DLINUX -DWL_EGL_PLATFORM
+
+then we get the following error during configuration:
+
+| -- Performing Test HAVE_OPENGL_EGL
+| CMake Error: Parse error in command line argument: WL_EGL_PLATFORM
+|  Should be: VAR:type=value
+
+If one changes to add a value to the macro, e.g.
+| Cflags: -I${includedir} -DLINUX=1 -DWL_EGL_PLATFORM=1
+then cmake does not error out but the macro is not passed to the
+C compiler.
+
+CMAKE_REQUIRED_FLAGS is the wrong variable to pass the CFLAGS in,
+CMAKE_REQUIRED_DEFINITIONS should be used.
+
+Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/5209]
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ cmake/sdlchecks.cmake | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/cmake/sdlchecks.cmake b/cmake/sdlchecks.cmake
+index 32be19c..f61b8df 100644
+--- a/cmake/sdlchecks.cmake
++++ b/cmake/sdlchecks.cmake
+@@ -808,8 +808,7 @@ endmacro()
+ macro(CheckEGL)
+   if (SDL_OPENGL OR SDL_OPENGLES)
+     pkg_check_modules(EGL egl)
+-    string(REPLACE "-D_THREAD_SAFE;" "-D_THREAD_SAFE=1;" EGL_CFLAGS "${EGL_CFLAGS}")
+-    set(CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS} ${EGL_CFLAGS}")
++    set(CMAKE_REQUIRED_DEFINITIONS "${CMAKE_REQUIRED_DEFINITIONS} ${EGL_CFLAGS}")
+     check_c_source_compiles("
+         #define EGL_API_FB
+         #define MESA_EGL_NO_X11_HEADERS
+-- 
+2.20.1
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
index 1559d5e942..6c949d9604 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
@@ -19,6 +19,7 @@ PROVIDES = "virtual/libsdl2"
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://0001-Fix-build-against-wayland-1.20.patch \
            file://optional-libunwind-generic.patch \
+           file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.20.1


