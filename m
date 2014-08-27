Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 10C9662252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 20:15:03 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 899F42369D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 22:15:04 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 22:14:53 +0200
Message-Id: <1409170493-18242-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] libsdl: add packageconfigs for x11, directfb, opengl
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
X-List-Received-Date: Wed, 27 Aug 2014 20:15:11 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index e544b60..b0ae299 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -12,10 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
 PROVIDES = "virtual/libsdl"
 
-DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl libglu', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
-           tslib"
+DEPENDS = "tslib"
 DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
 PR = "r3"
@@ -42,16 +39,19 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
                 --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
                 --disable-xbios --disable-gem --disable-video-dummy \
                 --enable-input-events --enable-input-tslib --enable-pthreads \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
                 --disable-video-svga \
                 --disable-video-picogui --disable-video-qtopia --enable-sdl-dlopen \
                 --disable-rpath \
                 --disable-pulseaudio"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
-PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
+PACKAGECONFIG[directfb] = "--enable-video-directfb,--disable-video-directfb,directfb"
+PACKAGECONFIG[opengl] = "--enable-video-opengl,--disable-video-opengl,virtual/libgl libglu"
+PACKAGECONFIG[x11] = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"
 
 PARALLEL_MAKE = ""
 
-- 
1.8.3.2


