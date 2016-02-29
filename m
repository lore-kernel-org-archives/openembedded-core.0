Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id D35F877225
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 16:02:32 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p65so75185005wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 08:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=yzfq9YvsayLPSmvky9jh57aIvtrnlj9BZqiVUfWqjjQ=;
	b=jARYK+9DCCY4AvAOHhfdpTgcwUaCb1DYRK1nOKVBP15OJoKr6gonqgMfQ8X67eol9n
	XqYUfFHFlkDklYgW7eCTRzd5NlBQDmNPWbq3rNZ1HGRfRSQFS3Htg5sfeVlfcFC6g+D0
	ADij5vUE7lkg3HXSVtqSP9OVtiSKcwhFNXKMXReOPrbqAr1hNSX26hBzV18oymL4G9It
	jNUV1xL8mh2r2to/XUkbhbYv4D62MWoneuB2FwlytV5nIeqG8ilWhY85TSAZdgeis8i1
	51XUn+6bGITQCZJolhea/a1VPv3fkozeMVulV2i+0xHkPii+SSAwMSPZX0GLtQ5JUR64
	SIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yzfq9YvsayLPSmvky9jh57aIvtrnlj9BZqiVUfWqjjQ=;
	b=Qj/7xUbOPbqBfHvZDNuQqgmftlpZNJl6Ywp4ueZr6P9TjRNCkvwa2PMWTmuw/4hw+D
	7FACxaIqkgkXbB3+VbTtZgzQiBxdrzHtjELTkSYY3ZKHwRYZKcmJQymqrhNtj79zcetn
	ubJyd44j1OmvFu71TDG6qzWLypNdLUK5odVMhXEQ3PGeGub1rLHZrPEGEWdd64vYmxhC
	aduV5FtCt5aK7rcH+jftZYIj7MOI8gStDTpkx+jCKg/orJh49Xgpfar+lwvcj2N16Zs/
	HQYJAldJp4pbgD2+iam/oaoI2TZc4VuIqImqkiJL/FhkxwKnGF8ei0BVgGITZPZOKTbz
	jRFw==
X-Gm-Message-State: AD7BkJI7dLTOOGu8Y1Q10QRYmvznRjdfKLWHm3FwEc9phUO38xn6GQgaBRGwNCMLVpUd3GdZ
X-Received: by 10.194.205.103 with SMTP id lf7mr15148976wjc.147.1456761752687; 
	Mon, 29 Feb 2016 08:02:32 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i1sm26454322wjs.45.2016.02.29.08.02.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 Feb 2016 08:02:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 16:02:25 +0000
Message-Id: <1456761746-419-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][jethro][RFC 1/2] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Mon, 29 Feb 2016 16:02:33 -0000

Use PACKAGECONFIG instead of using logic in DEPENDS and EXTRA_OECONF, adding new
options for PulseAudio, tslib, DirectFB, OpenGL and X11.  Pass
--disable-x11-shared so that it links to the X libraries instead of using
dlopen().

Disable tslib by default as the kernel event input subsystem is generally used.

SDL's OpenGL support requires X11 so check for both x11 and opengl, and merge
the dependencies.

Finally enable native builds, with a minimal PACKAGECONFIG that will build from
oe-core for native and nativesdk.

(From OE-Core rev: 3d6c31c3a4ff34376e17005a981bb55fc6f7a38f)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 35 ++++++++++++++-------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index c0d5c6a..1cf3c39 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -12,13 +12,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
 PROVIDES = "virtual/libsdl"
 
-DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 libxext libxrandr libxrender', '', d)} \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'libglu', '', d)} \
-           tslib"
-DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
-
 PR = "r3"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
@@ -38,21 +31,29 @@ inherit autotools lib_package binconfig-disabled pkgconfig
 
 EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers \
                 --enable-file --disable-oss --disable-esd --disable-arts \
-                --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
+                --disable-diskaudio --disable-nas \
                 --disable-mintaudio --disable-nasm --disable-video-dga \
                 --disable-video-fbcon --disable-video-ps2gs --disable-video-ps3 \
                 --disable-xbios --disable-gem --disable-video-dummy \
-                --enable-input-events --enable-input-tslib --enable-pthreads \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', '--enable-video-directfb', '--disable-video-directfb', d)} \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
-                ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '--enable-video-x11', '--disable-video-x11', d)} \
+                --enable-input-events --enable-pthreads \
                 --disable-video-svga \
                 --disable-video-picogui --disable-video-qtopia --enable-sdl-dlopen \
-                --disable-rpath \
-                --disable-pulseaudio"
+                --disable-rpath"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG_class-native = "x11"
+PACKAGECONFIG_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
-PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
+PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
+PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
+PACKAGECONFIG[tslib] = "--enable-input-tslib, --disable-input-tslib, tslib"
+PACKAGECONFIG[directfb] = "--enable-video-directfb, --disable-video-directfb, directfb"
+PACKAGECONFIG[opengl] = "--enable-video-opengl, --disable-video-opengl, virtual/libgl libglu"
+PACKAGECONFIG[x11] = "--enable-video-x11 --disable-x11-shared, --disable-video-x11, virtual/libx11 libxext libxrandr libxrender"
 
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
 
@@ -65,4 +66,4 @@ do_configure_prepend() {
         export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
 }
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.0


