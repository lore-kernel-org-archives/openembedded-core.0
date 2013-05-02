Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UXvi3-00064O-Hr
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:46:19 +0200
Received: by mail-vc0-f171.google.com with SMTP id m16so588996vca.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 08:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=FlDnpVfJi52RiRlqK3ow+m8/dDVdBz9vlZaZ8jmWkEY=;
	b=YxNeGtn2CrHpD9VcyDWYnNLaM7MGy9MFVVeRu0nbJoNJ49qTcr+AIxE+MY8vFRCrea
	kpwlRtTd8Uf4tyHuIFVUrd+PmcNIGhUHzmUXZEyk6z/wbnc1PcSsLpeivMOzfHbQW7LI
	U2twMCMl7/yfL7fE1sLKhRAQC02YhTJexGLSoeAcesxto82NUMeGbhCiOZ2tqQUwiC69
	z6DhzCUhQfxju1fnxXNvflOT6C65XQFb2Ux6hUiOOHa86DRlzwZhz6g1yJfCx/dmctzK
	92W0wgAWTFERsgt19LAabiVSEwz8FGfQCN2qIB+aMmQYWz/FwVVKKSq6qxmOISbzOb1X
	oOOw==
X-Received: by 10.220.52.201 with SMTP id j9mr2341197vcg.33.1367508501378;
	Thu, 02 May 2013 08:28:21 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.151.247])
	by mx.google.com with ESMTPSA id u20sm3829507vdt.10.2013.05.02.08.28.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 May 2013 08:28:20 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu,  2 May 2013 12:28:04 -0300
Message-Id: <1367508484-19933-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa-demos: Use PACKAGECONFIG to enable/disable features
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 15:46:24 -0000

This allow selection of following features:

 drm, egl, freetype2, gbm, gles1, gles2, glut, osmesa, vg, wayland, x11

The x11 features is enabled depending on distro features but the
wayland has not been enabled as it does not work with Wayland
1.0. Rest were enabled for a sane default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
index 055f73d..3ac81ef 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT & PD"
 LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
                     file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
 
-DEPENDS = "virtual/libx11 virtual/libgl glew"
+DEPENDS = "virtual/libgl glew"
 
 SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
         file://glut.patch \
@@ -21,4 +21,20 @@ SRC_URI[sha256sum] = "9703fa0646b32a1e68d2abf5628f936f77bf97c69ffcaac90de380820a
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--without-glut"
+PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 \
+                  ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
+# The Wayland code doesn't work with Wayland 1.0, so disable it for now
+#${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
+
+PACKAGECONFIG[drm] = "--enable-libdrm,--disable-libdrm,libdrm"
+PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
+PACKAGECONFIG[freetype2] = "--enable-freetype2,--disable-freetype2,freetype"
+PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm,virtual/libgl"
+PACKAGECONFIG[gles1] = "--enable-gles1,--disable-gles1,virtual/libgles1"
+PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,virtual/libgles2"
+PACKAGECONFIG[glut] = "--with-glut,--without-glut,"
+PACKAGECONFIG[osmesa] = "--enable-libosmesa,--disable-libosmesa,"
+PACKAGECONFIG[vg] = "--enable-vg,--disable-vg,virtual/libvg"
+PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayland"
+PACKAGECONFIG[x11] = "--enable-libx11,--disable-libx11,virtual/libx11"
-- 
1.8.1



