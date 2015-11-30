Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD9F60616
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 12:27:46 +0000 (UTC)
Received: by wmec201 with SMTP id c201so135776803wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 04:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=K3ZMN5qnXf9McWXF0nX9DJKGx/SfWPaj356eaHdqIyE=;
	b=ADtG46tGdB6DpGSSxa/XVSCKomcueGW/abI/xb/mG3LPxAkl0ug+ZPs6FyYWMANS0t
	195tck17dIM4cWdq9p87yc/pbnejKMWyTu9Bf7ZFNwuVVwerwoBCZHJpfZAtigEyGt6E
	+Bo52KDHCSGrgMPkhFPeJU+NBDMWCxLi4B0GmenK4wM9EiHIU9Lm2UlkKvZJ00nhLSqX
	dt98z9Q52Sn+cEeh+6ZXUVZHHzFYfcLrpszcKrDwpyNNK7gFU/Edua7369+MvdeQvL+b
	YeoeqRXHnDMHUT3DMzLhG3ZrqCV3PQ7LZFulNK6gVOsXlwKKsuEvj0f9qOHaY4myCs4b
	hpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=K3ZMN5qnXf9McWXF0nX9DJKGx/SfWPaj356eaHdqIyE=;
	b=QxpB/9i1jaNzsQjXsqOgSMn8MeWroMa4RrF+cQjXAwCbX+DCNLqcHIQENk37encuZq
	RfqPUI4+Tl6AP8j5At7xozgOOAUmA51/DfdPkLdjKorVNVTG/sQHZQphf/4qoYcuNTil
	CFrNAUTU9UjDngeKl17JHwdxNE8XZoAJUPcB9z77BG3k/fpVO5kuL+/RRXfMDrbaWf89
	6ApxbLprI56YADl+xdiVHJZVEi4kWMikP6nbsdpHkiLzcPAPOU6cvtAJT2w/a900cc0s
	6Zdu9WdgLcQUq/wMbWYk+pUkbTHI/Xf+SAdEzGv+ihO3oQdD4X0NLItz4XGTzoo22mTs
	lLag==
X-Gm-Message-State: ALoCoQnUhYvEOrsdkQw30+H6fuPkmg3rgfxDHUe76p5GiuyVP+A6ztrxazJixXKUdkdnWVWUkul2
X-Received: by 10.194.109.169 with SMTP id ht9mr48590011wjb.13.1448886466591; 
	Mon, 30 Nov 2015 04:27:46 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z66sm21305731wmz.7.2015.11.30.04.27.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Nov 2015 04:27:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Nov 2015 12:18:58 +0000
Message-Id: <1448885938-25946-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libsdl: expand PACKAGECONFIG and enable native builds
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
X-List-Received-Date: Mon, 30 Nov 2015 12:27:47 -0000

Use PACKAGECONFIG instead of using logic in DEPENDS and EXTRA_OECONF, adding new
options for PulseAudio, tslib, DirectFB, OpenGL and X11.

Disable tslib by default as the kernel event input subsystem is generally used.

SDL's OpenGL support requires X11 so check for both x11 and opengl, and merge
the dependencies.

Finally enable native builds.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 31 +++++++++++++--------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index c0d5c6a..d8a99ef 100644
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
@@ -42,17 +35,23 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
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
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)}"
-PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
+PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
+PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
+PACKAGECONFIG[tslib] = "--enable-input-tslib, --disable-input-tslib, tslib"
+PACKAGECONFIG[directb] = "--enable-video-directfb, --disable-video-directfb, directfb"
+PACKAGECONFIG[opengl] = "--enable-video-opengl, --disable-video-opengl, virtual/libgl libglu"
+PACKAGECONFIG[x11] = "--enable-video-x11, --disable-video-x11, virtual/libx11 libxext libxrandr libxrender"
 
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
 
@@ -65,4 +64,4 @@ do_configure_prepend() {
         export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
 }
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.1.4


