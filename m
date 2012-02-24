Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0l0U-0002B3-Qv
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 03:35:38 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 03:27:15 +0100
Message-Id: <1330050435-28527-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] libsdl: make x11 conditional, add directfb support
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
X-List-Received-Date: Fri, 24 Feb 2012 02:35:38 -0000

* Use conditional dependencies for X11 and DirectFB, like
  it's already done for OpenGL.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
NOTE: I think that nativesdk may already be broken, because tslib gets
enabled without being in DEPENDS. With 'opengl' or 'directfb' set, the
nativesdk build probably won't succeed either, unless --enable-foo
means "autodetect foo".

 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |   15 ++++++++++-----
 1 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
index 5b87f39..94df358 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
@@ -12,10 +12,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
 PROVIDES = "virtual/libsdl"
 
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender tslib"
-DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
+           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
+           tslib"
+DEPENDS_virtclass-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk', '', d)}"
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
            file://configure_tweak.patch \
@@ -32,11 +35,13 @@ inherit autotools lib_package binconfig pkgconfig
 EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads --enable-timers --enable-endian \
                 --enable-file --disable-oss --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
-                --disable-mintaudio --disable-nasm --enable-video-x11 --disable-video-dga \
-                --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
+                --disable-mintaudio --disable-nasm --disable-video-dga \
+                --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
                 --disable-video-xbios --disable-video-gem --disable-video-dummy \
                 --enable-input-events --enable-input-tslib --enable-pthreads \
+                ${@base_contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
                 ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
+                ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
                 --disable-video-svga \
                 --disable-video-picogui --disable-video-qtopia --enable-dlopen \
                 --disable-rpath \
-- 
1.7.5.4



