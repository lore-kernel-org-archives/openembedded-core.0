Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 955247865C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 00:54:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAE0sE7s025442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 16:54:14 -0800
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 16:54:12 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 01:58:49 +0800
Message-ID: <81de47dba312253524e3ec744898e360b9606bef.1510595883.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510595883.git.liezhi.yang@windriver.com>
References: <cover.1510595883.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] libsdl2: 2.0.5 -> 2.0.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 00:54:12 -0000
Content-Type: text/plain

* Drop linkage.patch, this version already links .lo object.
* Remove backported patch fix-build-failure-on-ppc.patch
* Update LIC_FILES_CHKSUM since the year is changed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libsdl2/libsdl2/fix-build-failure-on-ppc.patch | 50 ----------------------
 .../recipes-graphics/libsdl2/libsdl2/linkage.patch | 46 --------------------
 .../libsdl2/{libsdl2_2.0.5.bb => libsdl2_2.0.7.bb} |  8 ++--
 3 files changed, 3 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/fix-build-failure-on-ppc.patch
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/linkage.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.5.bb => libsdl2_2.0.7.bb} (89%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/fix-build-failure-on-ppc.patch b/meta/recipes-graphics/libsdl2/libsdl2/fix-build-failure-on-ppc.patch
deleted file mode 100644
index 1520bcf..0000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/fix-build-failure-on-ppc.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Upstream-Status: Backport [https://hg.libsdl.org/SDL/rev/5184186d4366]
-
-Backport patch from upstream to fix build failures on ppc and ppc64.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-# HG changeset patch
-# User Sam Lantinga <slouken@libsdl.org>
-# Date 1477159315 25200
-# Node ID 5184186d4366169617b434f5b71c618a7035cde4
-# Parent  71d4148e32de5088c4bc2f04c1e5ded647a2bf82
-Fixed bug 3466 - Can't build 2.0.5 on ppc64
-
-/home/fedora/SDL2-2.0.5/src/video/SDL_blit_N.c: In function 'calc_swizzle32':
-/home/fedora/SDL2-2.0.5/src/video/SDL_blit_N.c:127:5: error: ISO C90 forbids mixed declarations and code [-Werror=declaration-after-statement]
-     const vector unsigned char plus = VECUINT8_LITERAL(0x00, 0x00, 0x00, 0x00,
-     ^
-
-diff -r 71d4148e32de -r 5184186d4366 src/video/SDL_blit_N.c
---- a/src/video/SDL_blit_N.c	Wed Oct 19 21:22:42 2016 -0700
-+++ b/src/video/SDL_blit_N.c	Sat Oct 22 11:01:55 2016 -0700
-@@ -118,12 +118,6 @@
-         16, 8, 0, 24,
-         0, NULL
-     };
--    if (!srcfmt) {
--        srcfmt = &default_pixel_format;
--    }
--    if (!dstfmt) {
--        dstfmt = &default_pixel_format;
--    }
-     const vector unsigned char plus = VECUINT8_LITERAL(0x00, 0x00, 0x00, 0x00,
-                                                        0x04, 0x04, 0x04, 0x04,
-                                                        0x08, 0x08, 0x08, 0x08,
-@@ -136,6 +130,14 @@
-     Uint32 gmask = RESHIFT(srcfmt->Gshift) << (dstfmt->Gshift);
-     Uint32 bmask = RESHIFT(srcfmt->Bshift) << (dstfmt->Bshift);
-     Uint32 amask;
-+
-+    if (!srcfmt) {
-+        srcfmt = &default_pixel_format;
-+    }
-+    if (!dstfmt) {
-+        dstfmt = &default_pixel_format;
-+    }
-+
-     /* Use zero for alpha if either surface doesn't have alpha */
-     if (dstfmt->Amask) {
-         amask =
-
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/linkage.patch b/meta/recipes-graphics/libsdl2/libsdl2/linkage.patch
deleted file mode 100644
index 60185b1..0000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/linkage.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-When building use the libtool intermediate .lo files instead of explicitly using
-the .o files. Under libtool foo.lo is the libtool intermediate wrapper, foo.o is
-a static build, and .libs/foo.o is a shared build.
-
-If static libraries have been disabled globally then libtool won't generate them
-and explicit references to foo.o won't be satisfied.
-
-Upstream-Status: Pending
-RP
-2016/1/16
-
-
-Index: SDL2-2.0.4/configure.in
-===================================================================
---- SDL2-2.0.4.orig/configure.in
-+++ SDL2-2.0.4/configure.in
-@@ -3464,23 +3464,23 @@ done
- 
- VERSION_OBJECTS=`echo $VERSION_SOURCES`
- VERSION_DEPENDS=`echo $VERSION_SOURCES`
--VERSION_OBJECTS=`echo "$VERSION_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.rc,$(objects)/\1.o,g'`
-+VERSION_OBJECTS=`echo "$VERSION_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.rc,$(objects)/\1.lo,g'`
- VERSION_DEPENDS=`echo "$VERSION_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.rc,\\\\
--\\$(objects)/\\2.o: \\1/\\2.rc\\\\
-+\\$(objects)/\\2.lo: \\1/\\2.rc\\\\
- 	\\$(WINDRES) \\$< \\$@,g"`
- 
- SDLMAIN_OBJECTS=`echo $SDLMAIN_SOURCES`
- SDLMAIN_DEPENDS=`echo $SDLMAIN_SOURCES`
--SDLMAIN_OBJECTS=`echo "$SDLMAIN_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.c,$(objects)/\1.o,g'`
-+SDLMAIN_OBJECTS=`echo "$SDLMAIN_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.c,$(objects)/\1.lo,g'`
- SDLMAIN_DEPENDS=`echo "$SDLMAIN_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.c,\\\\
--\\$(objects)/\\2.o: \\1/\\2.c\\\\
-+\\$(objects)/\\2.lo: \\1/\\2.c\\\\
- 	\\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=CC --mode=compile \\$(CC) \\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g"`
- 
- SDLTEST_OBJECTS=`echo $SDLTEST_SOURCES`
- SDLTEST_DEPENDS=`echo $SDLTEST_SOURCES`
--SDLTEST_OBJECTS=`echo "$SDLTEST_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.c,$(objects)/\1.o,g'`
-+SDLTEST_OBJECTS=`echo "$SDLTEST_OBJECTS" | sed 's,[[^ ]]*/\([[^ ]]*\)\.c,$(objects)/\1.lo,g'`
- SDLTEST_DEPENDS=`echo "$SDLTEST_DEPENDS" | sed "s,\\([[^ ]]*\\)/\\([[^ ]]*\\)\\.c,\\\\
--\\$(objects)/\\2.o: \\1/\\2.c\\\\
-+\\$(objects)/\\2.lo: \\1/\\2.c\\\\
- 	\\$(RUN_CMD_CC)\\$(LIBTOOL) --tag=CC --mode=compile \\$(CC) \\$(CFLAGS) \\$(EXTRA_CFLAGS) $DEPENDENCY_TRACKING_OPTIONS -c \\$< -o \\$@,g"`
- 
- # Set runtime shared library paths as needed
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.7.bb
similarity index 89%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.7.bb
index 032f45b..fcbfa73 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.7.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "http://bugzilla.libsdl.org/"
 SECTION = "libs"
 
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b2304ad7e91711027590d3f102a754b7"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e4688d3bd5bf02dadaa3e5182fd9eda9"
 
 PROVIDES = "virtual/libsdl2"
 
@@ -16,14 +16,12 @@ DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtu
 
 SRC_URI = " \
     http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
-    file://linkage.patch \
-    file://fix-build-failure-on-ppc.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[md5sum] = "d4055424d556b4a908aa76fad63abd3c"
-SRC_URI[sha256sum] = "442038cf55965969f2ff06d976031813de643af9c9edc9e331bd761c242e8785"
+SRC_URI[md5sum] = "cdb071009d250e1782371049f0d5ca42"
+SRC_URI[sha256sum] = "ee35c74c4313e2eda104b14b1b86f7db84a04eeab9430d56e001cea268bf4d5e"
 
 inherit autotools lib_package binconfig pkgconfig
 
-- 
2.7.4


