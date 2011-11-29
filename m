Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVNDR-00026n-Kb
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 13:55:17 +0100
Received: by mail-fx0-f47.google.com with SMTP id r15so682091faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 04:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ljzNX20K9xeK5nrb/hfzs/PETFkfXAptg1o6RT1lXKA=;
	b=CKGNwzprvSFqIp/sOc8GsYYzWYJC60coKkC++0jYqvMo2lmyd/lqnO/EBCYXL7i4rt
	3uquZknC+sLBpa/GqDpEvBJmoi1GmlaTKuqa41w9y+6tuIXfzlhIXJuPD5RxPuU/uROr
	tZznijmH8OvggjKus2BaDdlJJwyD8XbFXK5qQ=
Received: by 10.205.139.2 with SMTP id iu2mr1923416bkc.128.1322570920702;
	Tue, 29 Nov 2011 04:48:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e18sm36789550bkr.15.2011.11.29.04.48.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 04:48:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 13:48:12 +0100
Message-Id: <4527a3ddc02fd789806eab30479d80d6c6f58ae9.1322570605.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <9550d0f84844e9a22bcb999f9d706db50fa66058.1322570605.git.Martin.Jansa@gmail.com>
References: <9550d0f84844e9a22bcb999f9d706db50fa66058.1322570605.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322570605.git.Martin.Jansa@gmail.com>
References: <cover.1322570605.git.Martin.Jansa@gmail.com>
Subject: [oe-core 3/5] libsdl: enable cdrom, alsa and tslib, disable rpath and add few fixes from meta-oe
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
X-List-Received-Date: Tue, 29 Nov 2011 12:55:17 -0000

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
1.7.8.rc4



