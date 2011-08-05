Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1QpDR1-0002i4-Cx
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 07:59:03 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2011 22:53:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,321,1309762800"; d="scan'208";a="34741185"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by orsmga002.jf.intel.com with ESMTP; 04 Aug 2011 22:53:32 -0700
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 14:11:58 +0800
Message-Id: <c9f3ca9552ecf8d0c3bd1128ee7a915bfb7776f6.1312523858.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312523858.git.jiajun.xu@intel.com>
References: <cover.1312523858.git.jiajun.xu@intel.com>
Subject: [PATCH 1/1] libsdl: Add libSDL.so into Sato image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Aug 2011 05:59:03 -0000

[YOCTO #883]
Some graphics 3D game(urbanterror, openarena) tests need libSDL.so.
Change libsdl-nativesdk to libsdl and add it into Sato image.

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 ...libsdl-nativesdk_1.2.11.bb => libsdl_1.2.11.bb} |   24 ++++++++++++++-----
 meta/recipes-sato/tasks/task-core-x11-sato.bb      |    3 +-
 2 files changed, 19 insertions(+), 8 deletions(-)
 rename meta/recipes-graphics/libsdl/{libsdl-nativesdk_1.2.11.bb => libsdl_1.2.11.bb} (67%)

diff --git a/meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
similarity index 67%
rename from meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb
rename to meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
index e64a62e..244b0d8 100644
--- a/meta/recipes-graphics/libsdl/libsdl-nativesdk_1.2.11.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.11.bb
@@ -1,23 +1,31 @@
-DESCRIPTION = "Simple DirectMedia Layer - native Edition"
+SUMMARY = "Simple DirectMedia Layer"
+DESCRIPTION = "Simple DirectMedia Layer is a cross-platform multimedia \
+library designed to provide low level access to audio, keyboard, mouse, \
+joystick, 3D hardware via OpenGL, and 2D video framebuffer."
 HOMEPAGE = "http://www.libsdl.org"
+BUGTRACKER = "http://bugzilla.libsdl.org/"
+
 SECTION = "libs"
-LICENSE = "LGPLv2.1"
-DEPENDS = "libx11-nativesdk libxext-nativesdk libxrandr-nativesdk libxrender-nativesdk"
-RDEPENDS_${PN} = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
-PR = "r5"
 
+LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
+DEPENDS = "virtual/libx11 libxext libxrandr libxrender"
+RDEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
+
+PR = "r6"
+
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
 	   file://acinclude.m4 \
 	   file://configure_tweak.patch;patch=1 \
 	   file://kernel-asm-page.patch;patch=1 "
+
 S = "${WORKDIR}/SDL-${PV}"
 
 SRC_URI[md5sum] = "418b42956b7cd103bfab1b9077ccc149"
 SRC_URI[sha256sum] = "6985823287b224b57390b1c1b6cbc54cc9a7d7757fbf9934ed20754b4cd23730"
 
-inherit autotools binconfig pkgconfig nativesdk
+inherit autotools binconfig pkgconfig
 
 EXTRA_OECONF = "--disable-static --disable-debug --disable-cdrom --enable-threads --enable-timers --enable-endian \
                 --enable-file --disable-oss --disable-alsa --disable-esd --disable-arts \
@@ -25,7 +33,7 @@ EXTRA_OECONF = "--disable-static --disable-debug --disable-cdrom --enable-thread
                 --disable-mintaudio --disable-nasm --enable-video-x11 --disable-video-dga \
                 --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs \
                 --disable-video-xbios --disable-video-gem --disable-video-dummy \
-                --disable-video-opengl --enable-input-events --enable-pthreads \
+                --enable-input-events --enable-pthreads \
 		--disable-video-svga \
                 --disable-video-picogui --disable-video-qtopia --enable-dlopen"
 
@@ -34,3 +42,5 @@ PARALLEL_MAKE = ""
 do_configure_prepend() {
 	cp ${WORKDIR}/acinclude.m4 ${S}/acinclude.m4
 }
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-sato/tasks/task-core-x11-sato.bb b/meta/recipes-sato/tasks/task-core-x11-sato.bb
index cd71077..ed43075 100644
--- a/meta/recipes-sato/tasks/task-core-x11-sato.bb
+++ b/meta/recipes-sato/tasks/task-core-x11-sato.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "Sato Tasks for Poky"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r30"
+PR = "r31"
 
 PACKAGES = "\
     task-core-x11-sato \
@@ -33,4 +33,5 @@ RDEPENDS_task-core-x11-sato = "\
     gtk-sato-engine \
     gthumb \
     x11vnc \
+    libsdl \
     ${NETWORK_MANAGER}"
-- 
1.7.1



