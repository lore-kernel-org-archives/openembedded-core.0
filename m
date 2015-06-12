Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id C2C2375932
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 20:50:55 +0000 (UTC)
Received: by wifx6 with SMTP id x6so26618582wif.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 13:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=WYQa5vZ+pdzY7arl7NI0M15+NGi3DyFYmC9HigBofB4=;
	b=Cjw1k4ZKQInsvkKS1L7WnDJYG+WYYE57Cf1+Tz0cPgB32eNpCXRaX0/sKupLFt/P/0
	MCTvWGsLob5AgNPY4TigAZev6X4eigLn50EjzWg9kBnV4ot9Eedu3+QJTN6BopO1I86r
	jwxUE2pWZ0mkVg4WpVs8ss7N0PLpXuxaH90PP0HMSK92FviS+Mgl9xY86u+t6skiEOLQ
	K4wLANDYERNmu3uoPcf4D1W3LoKGkIs0/ILQWaYckXjYw2gfUSItksRJK5g/4XmnAU/t
	DyGXXIV+TkPd2hN6R4E4eJNDloNimOcuq+IH82pSvTnGCBHkGvYyDS4PacBSMSaLIHrO
	EBrA==
X-Received: by 10.194.78.175 with SMTP id c15mr1108245wjx.136.1434142255010;
	Fri, 12 Jun 2015 13:50:55 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2E88.dip0.t-ipconnect.de.
	[91.10.46.136])
	by mx.google.com with ESMTPSA id ib8sm4470456wjb.12.2015.06.12.13.50.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jun 2015 13:50:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jun 2015 22:50:43 +0200
Message-Id: <1434142243-2093-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH] libsdl2: PACKAGECONFIGize
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
X-List-Received-Date: Fri, 12 Jun 2015 20:50:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* DEPENDS + EXTRA_OECONF -> PACKAGECONFIG for directfb / opengl / x11
* added PACKAGECONFIG for gles2 / pulseaudio / tslib / wayland

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb | 39 ++++++++++++++++----------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
index 197f962..97f64f3 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
@@ -12,14 +12,9 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=67dcb7fae16952557bc5f96e9eb5d188"
 
 PROVIDES = "virtual/libsdl2"
 
-DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
-           tslib"
 DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
-SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
-       "
+SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
@@ -31,16 +26,30 @@ inherit autotools lib_package binconfig pkgconfig
 EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
                 --disable-video-dummy \
-                --enable-input-tslib --enable-pthreads \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
+                --enable-pthreads \
                 --enable-sdl-dlopen \
-                --disable-rpath \
-                --disable-pulseaudio"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
-PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
+                --disable-rpath"
+
+# opengl packageconfig factored out to make it easy for distros
+# and BSP layers to pick either (desktop) opengl, gles2, or no GL
+PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl', '', d)}"
+
+PACKAGECONFIG ??= " \
+    ${PACKAGECONFIG_GL} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+"
+PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
+PACKAGECONFIG[directfb]   = "--enable-video-directfb --disable-video-directfb,directfb"
+PACKAGECONFIG[gles2]      = "--enable-video-opengles,--disable-video-opengles,virtual/libgles2"
+PACKAGECONFIG[opengl]     = "--enable-video-opengl,--disable-video-opengl,virtual/libgl"
+PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
+PACKAGECONFIG[tslib]      = "--enable-input-tslib,--disable-input-tslib,tslib"
+PACKAGECONFIG[wayland]    = "--enable-video-wayland,--disable-video-wayland,wayland"
+PACKAGECONFIG[x11]        = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"
 
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
 
-- 
1.9.3


