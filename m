Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E17C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 17:10:01 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.22349.1704820194096594643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 09:09:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout12.t-online.de (Postfix) with SMTP id 79D8D2DAE
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Jan 2024 18:09:51 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.27]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rNFbp-17Z66z0; Tue, 9 Jan 2024 18:09:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][oe-core][PATCHv2] webp: switch recipe to cmake buildsystem
Date: Tue,  9 Jan 2024 18:09:41 +0100
Message-ID: <20240109170941.3422308-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1704820189-769C39CF-708D0900/0/0 CLEAN NORMAL
X-TOI-MSGID: c271001c-0233-44a6-a249-703ee9b8e864
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 17:10:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193471

Besides the improvements that cmake offers compared to autotools,
the advantage would be that cmake config files get created.
This is useful so that other projects can find webp using cmake.

Remove EXTRA_OECONF settings because all of them are set like this
by default.

CMakeLists.txt doesn't provide an option for selecting neon but from
what I have tested it gets selected properly.

Add a patch that hides more dependencies behind options to avoid
floating dependencies.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../webp/libwebp/0001-cmake-add-options.patch | 120 ++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.3.2.bb |  40 ++----
 2 files changed, 133 insertions(+), 27 deletions(-)
 create mode 100644 meta/recipes-multimedia/webp/libwebp/0001-cmake-add-o=
ptions.patch

diff --git a/meta/recipes-multimedia/webp/libwebp/0001-cmake-add-options.=
patch b/meta/recipes-multimedia/webp/libwebp/0001-cmake-add-options.patch
new file mode 100644
index 0000000000..0a3e781097
--- /dev/null
+++ b/meta/recipes-multimedia/webp/libwebp/0001-cmake-add-options.patch
@@ -0,0 +1,120 @@
+From d126cdbe38cda7a4ab512738b2755942da33e43c Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 9 Jan 2024 16:31:08 +0100
+Subject: [PATCH] cmake: add more options
+
+By doing this gif,jpeg,png,tiff,opengl and sdl can be disabled to avoid =
floating dependencies.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ CMakeLists.txt   | 28 ++++++++++++++++++----------
+ cmake/deps.cmake | 24 +++++++++++++++---------
+ 2 files changed, 33 insertions(+), 19 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index ad5e14c3..c3b24f99 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -35,6 +35,12 @@ endif()
+ option(WEBP_ENABLE_SIMD "Enable any SIMD optimization."
+        ${WEBP_ENABLE_SIMD_DEFAULT})
+ option(WEBP_BUILD_ANIM_UTILS "Build animation utilities." ON)
++option(WEBP_BUILD_GIF "Build gif support." OFF)
++option(WEBP_BUILD_TIFF "Build tiff support." OFF)
++option(WEBP_BUILD_PNG "Build png support." OFF)
++option(WEBP_BUILD_JPEG "Build jpeg support." OFF)
++option(WEBP_BUILD_OPENGL "Build opengl support." OFF)
++option(WEBP_BUILD_SDL "Build sdl support." OFF)
+ option(WEBP_BUILD_CWEBP "Build the cwebp command line tool." ON)
+ option(WEBP_BUILD_DWEBP "Build the dwebp command line tool." ON)
+ option(WEBP_BUILD_GIF2WEBP "Build the gif2webp conversion tool." ON)
+@@ -562,7 +568,7 @@ if(WEBP_BUILD_IMG2WEBP)
+   install(TARGETS img2webp RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
+ endif()
+=20
+-if(WEBP_BUILD_VWEBP)
++if(WEBP_BUILD_VWEBP AND WEBP_BUILD_OPENGL)
+   # vwebp
+   find_package(GLUT)
+   if(GLUT_FOUND)
+@@ -638,15 +644,17 @@ if(WEBP_BUILD_EXTRAS)
+                                                   ${CMAKE_CURRENT_BINAR=
Y_DIR})
+=20
+   # vwebp_sdl
+-  find_package(SDL)
+-  if(WEBP_BUILD_VWEBP AND SDL_FOUND)
+-    add_executable(vwebp_sdl ${VWEBP_SDL_SRCS})
+-    target_link_libraries(vwebp_sdl ${SDL_LIBRARY} imageioutil webp)
+-    target_include_directories(
+-      vwebp_sdl PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_BIN=
ARY_DIR}
+-                        ${CMAKE_CURRENT_BINARY_DIR}/src ${SDL_INCLUDE_D=
IR})
+-    set(WEBP_HAVE_SDL 1)
+-    target_compile_definitions(vwebp_sdl PUBLIC WEBP_HAVE_SDL)
++  if(WEBP_BUILD_SDL)
++    find_package(SDL)
++    if(WEBP_BUILD_VWEBP AND SDL_FOUND)
++      add_executable(vwebp_sdl ${VWEBP_SDL_SRCS})
++      target_link_libraries(vwebp_sdl ${SDL_LIBRARY} imageioutil webp)
++      target_include_directories(
++        vwebp_sdl PRIVATE ${CMAKE_CURRENT_SOURCE_DIR} ${CMAKE_CURRENT_B=
INARY_DIR}
++                          ${CMAKE_CURRENT_BINARY_DIR}/src ${SDL_INCLUDE=
_DIR})
++      set(WEBP_HAVE_SDL 1)
++      target_compile_definitions(vwebp_sdl PUBLIC WEBP_HAVE_SDL)
++    endif()
+   endif()
+ endif()
+=20
+diff --git a/cmake/deps.cmake b/cmake/deps.cmake
+index 0760ba92..cc978256 100644
+--- a/cmake/deps.cmake
++++ b/cmake/deps.cmake
+@@ -52,8 +52,10 @@ endif()
+ set(LT_OBJDIR ".libs/")
+=20
+ # Only useful for vwebp, so useless for now.
+-find_package(OpenGL)
+-set(WEBP_HAVE_GL ${OPENGL_FOUND})
++if(WEBP_BUILD_OPENGL)
++  find_package(OpenGL)
++  set(WEBP_HAVE_GL ${OPENGL_FOUND})
++endif()
+=20
+ # Check if we need to link to the C math library. We do not look for it=
 as it is
+ # not found when cross-compiling, while it is here.
+@@ -81,8 +83,10 @@ if(WEBP_FIND_IMG_LIBS)
+       message(STATUS "TIFF is disabled when statically linking.")
+       continue()
+     endif()
+-    find_package(${I_LIB})
+-    set(WEBP_HAVE_${I_LIB} ${${I_LIB}_FOUND})
++    if(WEBP_BUILD_${I_LIB})
++      find_package(${I_LIB})
++      set(WEBP_HAVE_${I_LIB} ${${I_LIB}_FOUND})
++    endif()
+     if(${I_LIB}_FOUND)
+       list(APPEND WEBP_DEP_IMG_LIBRARIES ${${I_LIB}_LIBRARIES})
+       list(APPEND WEBP_DEP_IMG_INCLUDE_DIRS ${${I_LIB}_INCLUDE_DIR}
+@@ -94,11 +98,13 @@ if(WEBP_FIND_IMG_LIBS)
+   endif()
+=20
+   # GIF detection, gifdec isn't part of the imageio lib.
+-  include(CMakePushCheckState)
+-  set(WEBP_DEP_GIF_LIBRARIES)
+-  set(WEBP_DEP_GIF_INCLUDE_DIRS)
+-  find_package(GIF)
+-  set(WEBP_HAVE_GIF ${GIF_FOUND})
++  if(WEBP_BUILD_GIF)
++    include(CMakePushCheckState)
++    set(WEBP_DEP_GIF_LIBRARIES)
++    set(WEBP_DEP_GIF_INCLUDE_DIRS)
++    find_package(GIF)
++    set(WEBP_HAVE_GIF ${GIF_FOUND})
++  endif()
+   if(GIF_FOUND)
+     # GIF find_package only locates the header and library, it doesn't =
fail
+     # compile tests when detecting the version, but falls back to 3 (as=
 of at
+--=20
+2.43.0
+
diff --git a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb b/meta/recipes=
-multimedia/webp/libwebp_1.3.2.bb
index 63b0fd9a6c..13fe337660 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.3.2.bb
@@ -13,45 +13,31 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6e8dee932c26f2dab503abf70c96d=
8bb \
                     file://PATENTS;md5=3Dc6926d0cb07d296f886ab6e0cc5a85b=
7"
=20
-SRC_URI =3D "http://downloads.webmproject.org/releases/webp/${BP}.tar.gz=
"
+SRC_URI =3D " \
+	http://downloads.webmproject.org/releases/webp/${BP}.tar.gz \
+	file://0001-cmake-add-options.patch \
+"
 SRC_URI[sha256sum] =3D "2a499607df669e40258e53d0ade8035ba4ec0175244869d1=
025d460562aa09b4"
=20
 UPSTREAM_CHECK_URI =3D "http://downloads.webmproject.org/releases/webp/i=
ndex.html"
=20
-EXTRA_OECONF =3D " \
-    --disable-wic \
-    --enable-libwebpmux \
-    --enable-libwebpdemux \
-    --enable-threading \
-"
-
-# Do not trust configure to determine if neon is available.
-#
-EXTRA_OECONF_ARM =3D " \
-    ${@bb.utils.contains("TUNE_FEATURES","neon","--enable-neon","--disab=
le-neon",d)} \
-"
-EXTRA_OECONF:append:arm =3D " ${EXTRA_OECONF_ARM}"
-EXTRA_OECONF:append:armeb =3D " ${EXTRA_OECONF_ARM}"
+EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON"
=20
-inherit autotools lib_package
-
-PACKAGECONFIG ??=3D ""
-
-# libwebpdecoder is a subset of libwebp, don't build it unless requested
-PACKAGECONFIG[decoder] =3D "--enable-libwebpdecoder,--disable-libwebpdec=
oder"
+inherit cmake lib_package
=20
+PACKAGECONFIG ?=3D ""
 # Apply for examples programs: cwebp and dwebp
-PACKAGECONFIG[gif] =3D "--enable-gif,--disable-gif,giflib"
-PACKAGECONFIG[jpeg] =3D "--enable-jpeg,--disable-jpeg,jpeg"
-PACKAGECONFIG[png] =3D "--enable-png,--disable-png,,libpng"
-PACKAGECONFIG[tiff] =3D "--enable-tiff,--disable-tiff,tiff"
-
+PACKAGECONFIG[gif] =3D "-DWEBP_BUILD_GIF=3DON,-DWEBP_BUILD_GIF=3DOFF,gif=
lib"
+PACKAGECONFIG[jpeg] =3D "-DWEBP_BUILD_JPEG=3DON,-DWEBP_BUILD_JPEG=3DOFF,=
jpeg"
+PACKAGECONFIG[png] =3D "-DWEBP_BUILD_PNG=3DON,-DWEBP_BUILD_PNG=3DOFF,lib=
png"
+PACKAGECONFIG[tiff] =3D "-DWEBP_BUILD_TIFF=3DON,-DWEBP_BUILD_TIFF=3DOFF,=
tiff"
 # Apply only for example program vwebp
-PACKAGECONFIG[gl] =3D "--enable-gl,--disable-gl,mesa-glut"
+PACKAGECONFIG[opengl] =3D "-DWEBP_BUILD_OPENGL=3DON,-DWEBP_BUILD_OPENGL=3D=
OFF,mesa-glut"
=20
 PACKAGES =3D+ "${PN}-gif2webp"
=20
 DESCRIPTION:${PN}-gif2webp =3D "Simple tool to convert animated GIFs to =
WebP"
 FILES:${PN}-gif2webp =3D "${bindir}/gif2webp"
=20
+FILES:${PN} +=3D "${datadir}"
 BBCLASSEXTEND +=3D "native nativesdk"
--=20
2.43.0


