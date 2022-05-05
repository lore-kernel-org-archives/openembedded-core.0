Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C18C43217
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:03 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.7370.1651727153656394381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jy2Y9ADi;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id i27so6531171ejd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JQANc3hnqssr093Q+CT1mjWXfmJPkHaHGXPxqPmnHg4=;
        b=Jy2Y9ADiIKnmIvNypLcYxgoP5n3UKIyKCnJdTFqBR4HfZb8Bwa/4wRpJOwUVsEy++k
         Ai+QDqhLBsffLESUr66iUm9mRbCUJ8b9971nyE34QoVETny6n45VInXBXOK+r6SdzNxE
         YXG91A6/2/ScdQDRZiOjeqOfqp8atn5aIdNKI4RG7F8VLPRu+T/+/x7WCFESJmuP6nbL
         Xv3B6D4H5slD21+vKCG5XU9q6WfotYqD9ANje7nPUSw3eW8f/PkVyOMUF170SVWFyiq5
         VZBihLRkXEGsoztCkuGQuYYDgF1aBW5OFdmRLZ/rJOEqVLMVlY9FaSge+UVetSeTt2/Z
         byLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JQANc3hnqssr093Q+CT1mjWXfmJPkHaHGXPxqPmnHg4=;
        b=IHM+WsVqCu6Z1lP6ZeUHxBeAPF9LYFNWQ25R6zhW8jegln2Ru2W1CXzvWx+c5ZVNS6
         N4KkRkiYgRpyl2bdMFuepgj8yhCmLNZ13sCuKqE2y0vRDEX8p8JvazoaWZHs1m7PnqPM
         w4+1nJerU6RpJc+W4/W05cpBeAs1vDC9L/352VyzdlJiAY8Ldnz9NPaBH0W3jKWJgWMO
         Rx+d8FqhM/eDjrii2YfH32jtwbehkZYmwDXZOeY4Pqvv12rxNbnM8rLa/iAcxLxxU7Li
         hatH3gcybJzV3WCXva7k7jloIFH3JQ91aEi8QuMUNkOHmuzDY6/tu5tyjxkalSILNy9f
         WEgA==
X-Gm-Message-State: AOAM530QyPggB/Mpgu1kBrZNCyLudVIqjAXNNKj8n0Xtx9GE9fOMzAoo
	huHJr0iiXTonwAcULeBJ+py7aqNhkPM=
X-Google-Smtp-Source: 
 ABdhPJyGk05wag7N6dU2BfsqaItMMPy2Jbw5kbwButAJorvq63WzceXRHNWDldo/qQg6SqWP2BL61Q==
X-Received: by 2002:a17:907:7810:b0:6e7:ef73:8326 with SMTP id
 la16-20020a170907781000b006e7ef738326mr24183120ejc.429.1651727152193;
        Wed, 04 May 2022 22:05:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/61] libsdl2: upgrade 2.0.20 -> 2.0.22
Date: Thu,  5 May 2022 07:04:50 +0200
Message-Id: <20220505050544.651895-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165236

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...d-in-native-OE-builds-by-not-looking.patch | 10 ++--
 ...pass-cflags-to-the-appropriate-cmake.patch | 46 -------------------
 ...ability-to-disable-fb-accel-via-hint.patch | 36 +++++++++++++++
 .../libsdl2/optional-libunwind-generic.patch  | 18 --------
 .../{libsdl2_2.0.20.bb => libsdl2_2.0.22.bb}  |  5 +-
 5 files changed, 42 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-video-restore-ability-to-disable-fb-accel-via-hint.patch
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.20.bb => libsdl2_2.0.22.bb} (94%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
index 214664f621..57bc522393 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch
@@ -1,4 +1,4 @@
-From 50c691e83f81b235bb96ef996dd4568ffaae256f Mon Sep 17 00:00:00 2001
+From 0234c546d86174fafe9ab280cf5f44de50b73676 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Fri, 18 Mar 2022 12:06:23 +0100
 Subject: [PATCH] Disable libunwind in native OE builds by not looking for
@@ -16,15 +16,16 @@ By not looking for the libunwind header, the rest of the libunwind
 specific bits in the CMake build script are disabled.
 
 Upstream-Status: Inappropriate [OE specific]
+
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 64f9fbf..12a4d8f 100644
+index 644715a..bbf2e28 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -862,7 +862,7 @@ if(SDL_LIBC)
+@@ -869,7 +869,7 @@ if(SDL_LIBC)
      check_include_file(sys/types.h HAVE_SYS_TYPES_H)
      foreach(_HEADER
              stdio.h stdlib.h stddef.h stdarg.h malloc.h memory.h string.h limits.h float.h
@@ -33,6 +34,3 @@ index 64f9fbf..12a4d8f 100644
        string(TOUPPER "HAVE_${_HEADER}" _UPPER)
        string(REPLACE "." "_" _HAVE_H ${_UPPER})
        check_include_file("${_HEADER}" ${_HAVE_H})
--- 
-2.32.0
-
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch
deleted file mode 100644
index e5d6cda0eb..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From dbf0a3f6ea77a1d5f5e3c4dec7a22fcc09a49537 Mon Sep 17 00:00:00 2001
-From: Max Krummenacher <max.krummenacher@toradex.com>
-Date: Mon, 10 Jan 2022 21:52:02 +0000
-Subject: [PATCH] cmake: sdlchecks.cmake: pass cflags to the appropriate cmake
- variable
-
-If egl.pc sets at least two macros as the i.MX Vivante driver does, e.g.:
-| Cflags: -I${includedir} -DLINUX -DWL_EGL_PLATFORM
-
-then we get the following error during configuration:
-
-| -- Performing Test HAVE_OPENGL_EGL
-| CMake Error: Parse error in command line argument: WL_EGL_PLATFORM
-|  Should be: VAR:type=value
-
-If one changes to add a value to the macro, e.g.
-| Cflags: -I${includedir} -DLINUX=1 -DWL_EGL_PLATFORM=1
-then cmake does not error out but the macro is not passed to the
-C compiler.
-
-CMAKE_REQUIRED_FLAGS is the wrong variable to pass the CFLAGS in,
-CMAKE_REQUIRED_DEFINITIONS should be used.
-
-Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/5209]
-Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
----
- cmake/sdlchecks.cmake | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/cmake/sdlchecks.cmake b/cmake/sdlchecks.cmake
-index 32be19c..f61b8df 100644
---- a/cmake/sdlchecks.cmake
-+++ b/cmake/sdlchecks.cmake
-@@ -808,8 +808,7 @@ endmacro()
- macro(CheckEGL)
-   if (SDL_OPENGL OR SDL_OPENGLES)
-     pkg_check_modules(EGL egl)
--    string(REPLACE "-D_THREAD_SAFE;" "-D_THREAD_SAFE=1;" EGL_CFLAGS "${EGL_CFLAGS}")
--    set(CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS} ${EGL_CFLAGS}")
-+    set(CMAKE_REQUIRED_DEFINITIONS "${CMAKE_REQUIRED_DEFINITIONS} ${EGL_CFLAGS}")
-     check_c_source_compiles("
-         #define EGL_API_FB
-         #define MESA_EGL_NO_X11_HEADERS
--- 
-2.20.1
-
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-video-restore-ability-to-disable-fb-accel-via-hint.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-video-restore-ability-to-disable-fb-accel-via-hint.patch
new file mode 100644
index 0000000000..fc74d30556
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-video-restore-ability-to-disable-fb-accel-via-hint.patch
@@ -0,0 +1,36 @@
+From 14ad91658fd296e34bb9e833281e72c871bfb189 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 3 May 2022 12:31:50 +0200
+Subject: [PATCH] video: restore ability to disable fb accel via hint
+
+Somewhere in code refactoring between .20 and .22 this check
+was lost, and so the hint had no effect anymore.
+
+Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/5611]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/video/SDL_video.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/video/SDL_video.c b/src/video/SDL_video.c
+index 93c803e..cbe7616 100644
+--- a/src/video/SDL_video.c
++++ b/src/video/SDL_video.c
+@@ -2503,6 +2503,14 @@ SDL_CreateWindowFramebuffer(SDL_Window * window)
+     if (!_this->checked_texture_framebuffer) {
+         SDL_bool attempt_texture_framebuffer = SDL_TRUE;
+ 
++        /* See if the user or application wants to specifically disable the framebuffer */
++        const char *hint = SDL_GetHint(SDL_HINT_FRAMEBUFFER_ACCELERATION);
++        if (hint) {
++            if (*hint == '0' || SDL_strcasecmp(hint, "false") == 0) {
++                attempt_texture_framebuffer = SDL_FALSE;
++            }
++        }
++
+         if (_this->is_dummy) {  /* dummy driver never has GPU support, of course. */
+             attempt_texture_framebuffer = SDL_FALSE;
+         }
+-- 
+2.30.2
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch
deleted file mode 100644
index 757b99a5f6..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Do not error when libunwind-generic is not found, Not all
-implementations of libunwind will provide this library therefore
-do not make it hard error if its not found.
-
-Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/5194]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1358,7 +1358,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROI
-       if(HAVE_LIBUNWIND_H)
-         # We've already found the header, so REQUIRE the lib to be present
-         pkg_search_module(UNWIND REQUIRED libunwind)
--        pkg_search_module(UNWIND_GENERIC REQUIRED libunwind-generic)
-+        pkg_search_module(UNWIND_GENERIC libunwind-generic)
-         list(APPEND EXTRA_LIBS ${UNWIND_LIBRARIES} ${UNWIND_GENERIC_LIBRARIES})
-       endif()
-     endif()
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
similarity index 94%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
index c1c827af79..7678319770 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.20.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.22.bb
@@ -22,14 +22,13 @@ LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'f
 PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
-           file://optional-libunwind-generic.patch \
-           file://0001-sdlchecks.cmake-pass-cflags-to-the-appropriate-cmake.patch \
+           file://0001-video-restore-ability-to-disable-fb-accel-via-hint.patch \
            "
 SRC_URI:append:class-native = " file://0001-Disable-libunwind-in-native-OE-builds-by-not-looking.patch"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "c56aba1d7b5b0e7e999e4a7698c70b63a3394ff9704b5f6e1c57e0c16f04dd06"
+SRC_URI[sha256sum] = "fe7cbf3127882e3fc7259a75a0cb585620272c51745d3852ab9dd87960697f2e"
 
 inherit cmake lib_package binconfig-disabled pkgconfig
 
-- 
2.30.2


