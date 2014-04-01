Return-Path: <armccurdy@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id B5D946E747
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 07:11:20 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id jt11so9443552pbb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 00:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pJI2FSmOF12FPeOXqxhZiJmGd5DAl2OENtviokmukKo=;
	b=h2mTqTfwm4uu15Dzg1hGAvh7yw4uBJH/js7NMhW5hfE9XCw04POIGA+2cLEstyC97r
	I1NEaReFqc1n1pUPEC2foffYcHdx1VqdJ61y4aqnPinVf+Ip5X8tzcnpmbxds0eGCTlw
	5tDT22jFjzdU/0LrcflANkP2lR0yWnTpIkJwS9Dx4gbFYUVf8v80vbJuNASkFpU3Z1wT
	/GrYr3u7CS2jg3hZM3E8C1aJ5sLGOgWbD7Z8xOx/EFka20IznMmc2OS5CkWjEteGwEeR
	QcUQtDnfFwgEfLPXm77Wl8Lhj37FckaBMfg/Rl/uOAUuMPOEv4SqnVqyKr+pPl0GUFe/
	mgRQ==
X-Received: by 10.66.122.36 with SMTP id lp4mr29611604pab.82.1396336280905;
	Tue, 01 Apr 2014 00:11:20 -0700 (PDT)
Received: from t420s.entropic-communications.com ([12.199.200.26])
	by mx.google.com with ESMTPSA id
	el14sm51684801pac.31.2014.04.01.00.11.19 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Apr 2014 00:11:20 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Apr 2014 00:10:40 -0700
Message-Id: <1396336240-9708-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] libsdl: PACKAGECONFIG conversion
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
X-List-Received-Date: Tue, 01 Apr 2014 07:11:20 -0000

General cleanup + make it easier for distros / machines which
support OpenGL ES only to prevent attempts to build against libgl.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 30 ++++++++++++++++++---------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index e19c388..f72f74f 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -12,10 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
 PROVIDES = "virtual/libsdl"
 
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl libglu', '', d)} \
-           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
-           tslib"
 DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
 PR = "r3"
@@ -38,17 +34,31 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
                 --disable-mintaudio --disable-nasm --disable-video-dga \
                 --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
                 --disable-xbios --disable-gem --disable-video-dummy \
-                --enable-input-events --enable-input-tslib --enable-pthreads \
-                ${@base_contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
-                ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
-                ${@base_contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
-                --disable-video-svga \
+                --enable-input-events --enable-pthreads --disable-video-svga \
                 --disable-video-picogui --disable-video-qtopia --enable-sdl-dlopen \
                 --disable-rpath \
                 --disable-pulseaudio"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG_ALSA ?= "${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
+PACKAGECONFIG_DIRECTFB ?= "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
+# Warning: "opengl" in DISTRO_FEATURES implies GL and/or GLES but libsdl supports GL only.
+PACKAGECONFIG_OPENGL ?= "${@base_contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)}"
+PACKAGECONFIG_TSLIB ?= "tslib"
+PACKAGECONFIG_X11 ?= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
+PACKAGECONFIG ?= " \
+    ${PACKAGECONFIG_ALSA} \
+    ${PACKAGECONFIG_DIRECTFB} \
+    ${PACKAGECONFIG_OPENGL} \
+    ${PACKAGECONFIG_TSLIB} \
+    ${PACKAGECONFIG_X11} \
+    "
+
 PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
+PACKAGECONFIG[directfb] = "--enable-video-directfb,--disable-video-directfb,directfb"
+PACKAGECONFIG[opengl] = "--enable-video-opengl,--disable-video-opengl,virtual/libgl libglu"
+PACKAGECONFIG[tslib] = "--enable-input-tslib,--disable-input-tslib,tslib"
+PACKAGECONFIG[x11] = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"
 
 PARALLEL_MAKE = ""
 
-- 
1.8.1.2


