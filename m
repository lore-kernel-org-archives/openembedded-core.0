Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id EAD936B6F5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 16:55:16 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so264568096wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Dec 2015 08:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=gpXZs68/nFZO2VwxAbI5Y7thh1L8opSGPVD2uT5THvU=;
	b=e0ZfXV139cAN5Ybmfasu/LVr/aylU4VhWPGGjmMvKufEJ9y6DISZoaA5CptZCjbGHF
	KBnzKkOsG+tjv4gXNSW47jDSnLicKSKAPfuX6O45ADBfUA+u0fMdELkYuUXC4xIBTM9j
	0oEu+ce3ZrXbMpdHF7xgxbVWpbNfNSXgVMp8kVPdvnEMRUUUontT3Isw8hTuaTh3q1Zh
	XjainSFLDW6nUkd3gCVkp+0/eD1dfRtU5z6DPnQl1gk+jT2LAM22RxjcBJJXl4jXyx0d
	z89bCJMqt4LbRAIQxOGpr8nVvqREVpUMEkVMAx9y0o2AVrE/AGzP3eLPGueu/Vh4Vjn4
	e6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=gpXZs68/nFZO2VwxAbI5Y7thh1L8opSGPVD2uT5THvU=;
	b=EhMUQC2jruEWAqGLg357cV5/SFnqBbVxuo1OS406Ebwuzh10OmjHxEyeW/G8Jqnp29
	DbxqaMoRe9usQlSyKWEtG/FzPdq90CbeFEUuBYeqmXGIHNhbAUJSd1CFK9otJhfn2k6D
	AM1D6B9w7MfNX0BtB+prgM6msds2vWkOaK3OSkuATUlZW8b+hn4hIMMZuz6M5u3PENYC
	QNjXUv1Mkq00oyLsF8Wn8UTY+wsJvQSOV8NWeVUTTUfDYUKozb5lhNfL1KU2PAJ8bkMF
	rj733PFSJ15vRE5IBo6UK2PPeGXFvs894a+PuPZAY66/C0enyVqvu90y0IK7bFdT2HCV
	7fWg==
X-Gm-Message-State: ALoCoQlF2lTO7kzBgfOduihCtjBBR7p19ip87jZmS+XCXbZ8CJTAsZVHgm5dEk3sP4YHivgs62KT
X-Received: by 10.28.9.18 with SMTP id 18mr43120439wmj.99.1449075317089;
	Wed, 02 Dec 2015 08:55:17 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n127sm31540389wmf.12.2015.12.02.08.55.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 02 Dec 2015 08:55:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 16:55:10 +0000
Message-Id: <58ec5aaf4b7988eb0feda9961ab4b6f7bd8361c9.1449075091.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449075091.git.ross.burton@intel.com>
References: <cover.1449075091.git.ross.burton@intel.com>
In-Reply-To: <cover.1449075091.git.ross.burton@intel.com>
References: <cover.1449075091.git.ross.burton@intel.com>
Subject: [PATCH 2/2] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Wed, 02 Dec 2015 16:55:19 -0000

Use PACKAGECONFIG instead of using logic in DEPENDS and EXTRA_OECONF, adding new
options for PulseAudio, tslib, DirectFB, OpenGL and X11.  Pass
--disable-x11-shared so that it links to the X libraries instead of using
dlopen().

Disable tslib by default as the kernel event input subsystem is generally used.

SDL's OpenGL support requires X11 so check for both x11 and opengl, and merge
the dependencies.

Finally enable native builds, with a minimal PACKAGECONFIG that will build from
oe-core for native and nativesdk.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 35 ++++++++++++++-------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index b50859a..278d68a 100644
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
@@ -37,21 +30,29 @@ inherit autotools lib_package binconfig-disabled pkgconfig
 
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
+PACKAGECONFIG_class-nativesdk = "x11"
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
-PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
+PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
+PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
+PACKAGECONFIG[tslib] = "--enable-input-tslib, --disable-input-tslib, tslib"
+PACKAGECONFIG[directb] = "--enable-video-directfb, --disable-video-directfb, directfb"
+PACKAGECONFIG[opengl] = "--enable-video-opengl, --disable-video-opengl, virtual/libgl libglu"
+PACKAGECONFIG[x11] = "--enable-video-x11 --disable-x11-shared, --disable-video-x11, virtual/libx11 libxext libxrandr libxrender"
 
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
 
@@ -64,4 +65,4 @@ do_configure_prepend() {
         export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
 }
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


