Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Subject: [PATCH v2] libsdl2: Move to CMake build
Date: Tue,  4 Jan 2022 16:11:32 +0100
Message-Id: <20220104151132.908591-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
v1->v2:
    * Fix '==' typo - Thanks Jacob!
    * remove autotools patch

 .../libsdl2/libsdl2/more-gen-depends.patch    | 60 -------------------
 .../libsdl2/libsdl2_2.0.18.bb                 | 51 ++++++----------
 2 files changed, 19 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch b/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch
deleted file mode 100644
index 8ca52ebde7..0000000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/more-gen-depends.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From e0f4b6d18ce6f025c78773e909b9c395ad833c7a Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 29 Jul 2019 08:38:32 +0800
-Subject: [PATCH] configure: fix dependencies
-
-Many source files include e.g. wayland-protocols.h which should be found in the
-sysroot but SDL wants to build its own headers from the XML definitions.
-
-However the rules to generate those headers are only dependencies of the
-top-level libSDL2.la object so can be built in parallel with the rest of the
-objects, which can lead to interesting errors if the header is parsed by the
-compiler whilst it's being written by another process:
-
-| gen/wayland-client-protocol.h:3: error: unterminated #ifndef
-|  #ifndef WAYLAND_CLIENT_PROTOCOL_H
-
-Solve this by adding more dependencies so the generated files are built before
-the primary objects.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-[Moved to configure.ac]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9e782c6..997915a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -4061,7 +4061,7 @@ DEPENDS=`echo $SOURCES | tr ' ' '\n'`
- for EXT in asm cc m c S; do
-     OBJECTS=`echo "$OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.'$EXT',$(objects)/\1.lo,g'`
-     DEPENDS=`echo "$DEPENDS" | sed "s,^\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.$EXT\\$,\\\\
--\\$(objects)/\\2.lo: \\1/\\2.$EXT \\$(objects)/.created\\\\
-+\\$(objects)/\\2.lo: \\1/\\2.$EXT \\$(objects)/.created \\$(GEN_OBJECTS)\\\\
- 	\\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=CC --mode=compile \\$(CC) \\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g"`
- done
- 
-@@ -4078,14 +4078,14 @@ SDLMAIN_OBJECTS=`echo $SDLMAIN_SOURCES`
- SDLMAIN_DEPENDS=`echo $SDLMAIN_SOURCES`
- SDLMAIN_OBJECTS=`echo "$SDLMAIN_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.c,$(objects)/\1.lo,g'`
- SDLMAIN_DEPENDS=`echo "$SDLMAIN_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.c,\\\\
--\\$(objects)/\\2.lo: \\1/\\2.c \\$(objects)/.created\\\\
-+\\$(objects)/\\2.lo: \\1/\\2.c \\$(objects)/.created \\$(GEN_OBJECTS)\\\\
- 	\\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=CC --mode=compile \\$(CC) \\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g"`
- 
- SDLTEST_OBJECTS=`echo $SDLTEST_SOURCES`
- SDLTEST_DEPENDS=`echo $SDLTEST_SOURCES`
- SDLTEST_OBJECTS=`echo "$SDLTEST_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.c,$(objects)/\1.lo,g'`
- SDLTEST_DEPENDS=`echo "$SDLTEST_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.c,\\\\
--\\$(objects)/\\2.lo: \\1/\\2.c \\$(objects)/.created\\\\
-+\\$(objects)/\\2.lo: \\1/\\2.c \\$(objects)/.created \\$(GEN_OBJECTS)\\\\
- 	\\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=CC --mode=compile \\$(CC) \\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g"`
- 
- # Set runtime shared library paths as needed
--- 
-2.7.4
-
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
index 5e645b443c..1e22a0593f 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
@@ -16,28 +16,25 @@ LIC_FILES_CHKSUM:append = " ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'f
 
 PROVIDES = "virtual/libsdl2"
 
-SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
-           file://more-gen-depends.patch \
-"
+SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
 SRC_URI[sha256sum] = "94d40cd73dbfa10bb6eadfbc28f355992bb2d6ef6761ad9d4074eff95ee5711c"
 
-inherit autotools lib_package binconfig-disabled pkgconfig
+inherit cmake lib_package binconfig-disabled pkgconfig
 
 BINCONFIG = "${bindir}/sdl2-config"
 
 CVE_PRODUCT = "simple_directmedia_layer sdl"
 
-EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
-                --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
-                --disable-video-dummy \
-                --disable-video-rpi \
-                --enable-pthreads \
-                --disable-rpath \
-                --disable-sndio \
-                --disable-fcitx --disable-ibus \
+EXTRA_OECMAKE = "-DSDL_OSS=OFF -DSDL_ESD=OFF -DSDL_ARTS=OFF \
+                 -DSDL_DISKAUDIO=OFF -DSDL_NAS=OFF -DSDL_ESD_SHARED=OFF \
+                 -DSDL_DUMMYVIDEO=OFF \
+                 -DSDL_RPI=OFF \
+                 -DSDL_PTHREADS=ON \
+                 -DSDL_RPATH=OFF \
+                 -DSDL_SNDIO=OFF \
                 "
 
 # opengl packageconfig factored out to make it easy for distros
@@ -52,27 +49,17 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', '', d)} \
     ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
 "
-PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
-PACKAGECONFIG[arm-neon]   = "--enable-arm-neon,--disable-arm-neon"
-PACKAGECONFIG[directfb]   = "--enable-video-directfb,--disable-video-directfb,directfb,directfb"
-PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
-PACKAGECONFIG[jack]       = "--enable-jack,--disable-jack,jack"
-PACKAGECONFIG[kmsdrm]     = "--enable-video-kmsdrm,--disable-video-kmsdrm,libdrm virtual/libgbm"
-PACKAGECONFIG[opengl]     = "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
-PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
-PACKAGECONFIG[wayland]    = "--enable-video-wayland,--disable-video-wayland,wayland-native wayland wayland-protocols libxkbcommon"
-PACKAGECONFIG[x11]        = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"
+PACKAGECONFIG[alsa]       = "-DSDL_ALSA=ON,-DSDL_ALSA=OFF,alsa-lib,"
+PACKAGECONFIG[arm-neon]   = "-DSDL_ARMNEON=ON,-DSDL_ARMNEON=OFF"
+PACKAGECONFIG[directfb]   = "-DSDL_DIRECTFB=ON,-DSDL_DIRECTFB=OFF,directfb,directfb"
+PACKAGECONFIG[gles2]      = "-DSDL_OPENGLES=ON,-DSDL_OPENGLES=OFF,virtual/libgles2"
+PACKAGECONFIG[jack]       = "-DSDL_JACK=ON,-DSDL_JACK=OFF,jack"
+PACKAGECONFIG[kmsdrm]     = "-DSDL_KMSDRM=ON,-DSDL_KMSDRM=OFF,libdrm virtual/libgbm"
+PACKAGECONFIG[opengl]     = "-DSDL_OPENGL=ON,-DSDL_OPENGL=OFF,virtual/libgl"
+PACKAGECONFIG[pulseaudio] = "-DSDL_PULSEAUDIO=ON,-DSDL_PULSEAUDIO=OFF,pulseaudio"
+PACKAGECONFIG[wayland]    = "-DSDL_WAYLAND=ON,-DSDL_WAYLAND=OFF,wayland-native wayland wayland-protocols libxkbcommon"
+PACKAGECONFIG[x11]        = "-DSDL_X11=ON,-DSDL_X11=OFF,virtual/libx11 libxext libxrandr libxrender"
 
-EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
 CFLAGS:append:class-native = " -DNO_SHARED_MEMORY"
 
-do_configure:prepend() {
-        # Remove old libtool macros.
-        MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
-        for i in ${MACROS}; do
-               rm -f ${S}/acinclude/$i
-        done
-        export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
-}
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1

