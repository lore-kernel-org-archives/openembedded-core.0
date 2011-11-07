Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RNQ8o-0000Rq-7O
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 15:25:38 +0100
Received: by faat2 with SMTP id t2so2512213faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 06:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=uRqe0wvjOPXMFGf+dbTBI/SkwIWvS+ETEVifCxSv35Y=;
	b=nD2YjZ/95Zph9rm2nQYJndeGYn3gw6t4SPZcxvs6cMgHjbrulVtJh3jY8MIoWtcltZ
	RuWwFHr3uxZkD//Y4NRbtu9PbOkHvgS5XYbsT8ud3wIcfyPuzIBAkysO0fv4dLQRJ/wC
	u0R3Ncl9T7YvUad0awJgrXmVMxc4Rl9OWID30=
Received: by 10.152.106.163 with SMTP id gv3mr6596430lab.32.1320675564944;
	Mon, 07 Nov 2011 06:19:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id pw12sm8611517lab.13.2011.11.07.06.19.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 06:19:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 15:19:16 +0100
Message-Id: <66b436c4cba411e56445c32a98e0f5e160ab13a8.1320675529.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.2
In-Reply-To: <cover.1320675529.git.Martin.Jansa@gmail.com>
References: <cover.1320675529.git.Martin.Jansa@gmail.com>
Subject: [oe-core 1/6] libsdl: enable cdrom, alsa and tslib, disable rpath and add few fixes from meta-oe
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
X-List-Received-Date: Mon, 07 Nov 2011 14:25:38 -0000

* virtual/libsdl is used in sdl.bbclass but nothing was providing it
* rpath disabled because otherwise libtool and ld try to link against
  ${libdir}/libdl.so.2 on the host
  (see OE-classic commit af1a2e0e7626e372f22afbcabf08d9ae6b0d7b01)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.14.bb |   18 ++++++++++++------
 1 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
index 6b23344..17a3103 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.14.bb
@@ -10,10 +10,12 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=27818cd7fd83877a8e3ef82b82798ef4"
 
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender"
+PROVIDES = "virtual/libsdl"
+
+DEPENDS = "${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} virtual/libx11 libxext libxrandr libxrender alsa-lib tslib"
 DEPENDS_virtclass-nativesdk = "libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nativesdk"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
 	   file://configure_tweak.patch \
@@ -26,25 +28,29 @@ SRC_URI[sha256sum] = "5d927e287034cb6bb0ebccfa382cb1d185cb113c8ab5115a0759798642
 
 inherit autotools binconfig pkgconfig
 
-EXTRA_OECONF = "--disable-static --disable-debug --disable-cdrom --enable-threads --enable-timers --enable-endian \
-                --enable-file --disable-oss --disable-alsa --disable-esd --disable-arts \
+EXTRA_OECONF = "--disable-static --disable-debug --enable-cdrom --enable-threads --enable-timers --enable-endian \
+                --enable-file --disable-oss --enable-alsa --disable-esd --disable-arts \
                 --disable-diskaudio --disable-nas --disable-esd-shared --disable-esdtest \
                 --disable-mintaudio --disable-nasm --enable-video-x11 --disable-video-dga \
                 --disable-video-fbcon --disable-video-directfb --disable-video-ps2gs --disable-video-ps3 \
                 --disable-video-xbios --disable-video-gem --disable-video-dummy \
-                --enable-input-events --enable-pthreads \
+                --enable-input-events --enable-input-tslib --enable-pthreads \
 		${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl', '--disable-video-opengl', d)} \
 		--disable-video-svga \
-                --disable-video-picogui --disable-video-qtopia --enable-dlopen"
+                --disable-video-picogui --disable-video-qtopia --enable-dlopen \
+                --disable-rpath"
 
 PARALLEL_MAKE = ""
 
+EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
+
 do_configure_prepend() {
         # Remove old libtool macros.
         MACROS="libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4"
         for i in ${MACROS}; do
                rm -f acinclude/$i
         done
+        export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
 }
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.7.7.2



