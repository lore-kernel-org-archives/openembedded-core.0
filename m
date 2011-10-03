Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAigJ-0005Ww-J2
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:43 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vftLlRPKT0Jt9nSucRxQigwYCaA0xnZROMTDzSw9lzo=;
	b=r9Z/ZD3vjB2hDIbnYdMix+wqW1PRRhsWsG7Ib4fqlmKmJSQfUkxzKBJUuTIlmvcb9L
	E3iF/FWNo8BzoQ1ddCR8KmJEjkkQIECyfb3dgNkduUHkD9xNMDAZNL8GNhUZOXkTKB9Y
	ltaqjLnN5CFeQ3mpVGp2uwypEKZpDLYEi7//w=
Received: by 10.204.128.194 with SMTP id l2mr8330842bks.398.1317648613521;
	Mon, 03 Oct 2011 06:30:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm13242745bka.0.2011.10.03.06.30.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:30:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:40 +0200
Message-Id: <9dc6b834afa73b70111c586f7f7c9ac092344233.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 09/30] xserver-xf86: improve packaging and move shared definitions to .inc files
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
X-List-Received-Date: Mon, 03 Oct 2011 13:35:43 -0000

* introduce DISTRO_XORG_CONFIG_MANAGER for distribution to select
  hal/udev/files

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xf86-common.inc           |  114 +++++++++++++++++---
 .../xorg-xserver/xserver-xf86-dri-lite.inc         |   35 ++-----
 .../xorg-xserver/xserver-xf86-lite.inc             |   32 +-----
 3 files changed, 110 insertions(+), 71 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
index 000aea3..81abfc9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
@@ -2,8 +2,7 @@ DESCRIPTION = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3dd2bbe3563837f80ed8926b06c1c353"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
@@ -12,26 +11,115 @@ PROVIDES = "virtual/xserver-xf86"
 # Other packages tend to just care that there is *an* X server:
 PROVIDES += "virtual/xserver"
 
+# Config manager for xserver, options are: hal, udev, empty (for configuration in xorg.conf)
+DISTRO_XORG_CONFIG_MANAGER ?= "udev"
+
+# default none, enabled by DISTRO_XORG_CONFIG_MANAGER setting
+CONFIG_MANAGER_OPTION += "${@['--disable-config-hal','--enable-config-hal',''][bb.data.getVar('DISTRO_XORG_CONFIG_MANAGER',d) in ['hal']]}"
+CONFIG_MANAGER_OPTION += "${@['--disable-config-udev','--enable-config-udev',''][bb.data.getVar('DISTRO_XORG_CONFIG_MANAGER',d) in ['udev']]}"
+
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI += "file://macro_tweak.patch"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
-PACKAGES =+ "${PN}-utils"
+PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
 
-RDEPENDS_${PN} += "xserver-xf86-config xkeyboard-config"
+LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
 
-FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
-FILES_${PN} = "${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/xserver/SecurityPolicy ${libdir}/xorg/modules/*.so ${libdir}/xorg/modules/*/*.so ${libdir}/xorg/modules/*/*/*.so /etc/X11 "
-FILES_${PN}-doc += "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/README.compiled"
+DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
 
-FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
-                    ${libdir}/xorg/modules/*/.debug \
-		    ${libdir}/xorg/modules/*/*/.debug \
-		    "
+EXTRA_OECONF += "--with-fop=no \
+                 --disable-static \
+                 --disable-acfb \
+                 --disable-ccfb \
+                 --disable-mcfb \
+                 --disable-dga \
+                 --disable-xinerama \
+                 --disable-xf86misc \
+                 --disable-xorgcfg \
+                 --disable-record \
+                 --disable-dmx \
+                 --disable-xnest \
+                 --disable-xvfb \
+                 --enable-composite \
+                 --sysconfdir=/etc/X11 \
+                 --localstatedir=/var \
+                 --with-fontdir=${datadir}/fonts/X11 \
+                 --with-xkb-output=/var/lib/xkb \
+                 ${CONFIG_MANAGER_OPTION} \
+                 ac_cv_file__usr_share_sgml_X11_defs_ent=no \
+"
 
-SRC_URI += "file://macro_tweak.patch"
+# Split out some modules and extensions from the main package
+# These aren't needed for basic operations and only take up space:
+#  32.0k   libdri.so
+#  336.0k  libglx.so
+#  1360k   libint10.so
+#  180.0k  libwfb.so
+#  320.0k  libxaa.so
+#  124.0k  libxf1bpp.so
+#  84.0k   libxf4bpp.so
+#          librecord.so
+#          libextmod.so
+#          libdbe.so
+
+PACKAGES =+ "${PN}-security-policy \
+             ${PN}-sdl \
+             ${PN}-fbdev \
+             ${PN}-xprint \
+             ${PN}-xvfb \
+             ${PN}-utils \
+             ${PN}-xephyr \
+             ${PN}-multimedia-modules \
+             ${PN}-extension-dri \
+             ${PN}-extension-dri2 \
+             ${PN}-extension-glx \
+             ${PN}-extension-record \
+             ${PN}-extension-extmod \
+             ${PN}-extension-dbe \
+             ${PN}-module-libint10 \
+             ${PN}-module-libafb \
+             ${PN}-module-libwfb  \
+             ${PN}-module-libmfb \
+             ${PN}-module-libcfb \
+             ${PN}-module-xaa \
+             ${PN}-module-libxf1bpp \
+             ${PN}-module-libxf4bpp"
+
+RDEPENDS_${PN} += "xorg-minimal-fonts"
+RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
+RDEPENDS_${PN}-xvfb += "xkeyboard-config"
 
-EXTRA_OECONF = "--with-fop=no"
+FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
+FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
+FILES_${PN}-doc += "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/README.compiled ${localstatedir}/lib/xkb/README.compiled"
+FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
+                    ${libdir}/xorg/modules/*/.debug \
+                    ${libdir}/xorg/modules/*/*/.debug \
+                    "
+FILES_${PN}-security-policy += "${libdir}/xserver/SecurityPolicy"
+FILES_${PN}-sdl = "${bindir}/Xsdl"
+FILES_${PN}-fbdev = "${bindir}/Xfbdev"
+FILES_${PN}-xprint = "${libdir}/X11/xserver/*/print"
+FILES_${PN}-xvfb = "${bindir}/Xvfb"
+FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
+FILES_${PN}-xephyr = "${bindir}/Xephyr"
+FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
+FILES_${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
+FILES_${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
+FILES_${PN}-extension-glx = "${libdir}/xorg/modules/extensions/libglx.so"
+FILES_${PN}-extension-record = "${libdir}/xorg/modules/extensions/librecord.so"
+FILES_${PN}-extension-extmod = "${libdir}/xorg/modules/extensions/libextmod.so"
+FILES_${PN}-extension-dbe = "${libdir}/xorg/modules/extensions/libdbe.so"
+FILES_${PN}-module-libint10 = "${libdir}/xorg/modules/libint10.so"
+FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
+FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
+FILES_${PN}-module-libmfb = "${libdir}/xorg/modules/libmfb.so"
+FILES_${PN}-module-libcfb = "${libdir}/xorg/modules/libcfb.so"
+FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
+FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
+FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
index 3aca760..740c59d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
@@ -1,37 +1,16 @@
 require xserver-xf86-common.inc
 
-PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
+PROTO_DEPS += "xf86driproto dri2proto"
+LIB_DEPS += "virtual/libgl"
 
-LIB_DEPS = "pixman virtual/libgl libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
+inherit glx-use-tls
 
-DEPENDS = "${PROTO_DEPS} ${LIB_DEPS}"
-
-RDEPENDS_${PN} += "hal xorg-minimal-fonts"
-
-FILES_${PN} += "${bindir}/Xorg "
-
-EXTRA_OECONF += "--disable-static \
-                 --disable-acfb \
-                 --disable-ccfb \
-                 --disable-mcfb \
-                 --disable-dga \
-                 --disable-xinerama \
-                 --disable-xf86misc \
-                 --disable-xorgcfg \
-                 --disable-record \
-                 --disable-dmx \
-                 --disable-xnest \
-                 --disable-xvfb \
-                 --enable-composite \
-                 --enable-glx-tls \
-                 --sysconfdir=/etc/X11 \
-                 --localstatedir=/var \
+EXTRA_OECONF += "\
+		 --enable-dri \
+		 --enable-dri2 \
                  --with-pic \
                  --with-int10=x86emu \
-                 --with-fontdir=${datadir}/fonts/X11 \
-                 --with-xkb-output=/var/lib/xkb \
-                 ac_cv_file__usr_share_sgml_X11_defs_ent=no"
+"
 
 # Due to mesa-dri
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
index 5447058..a785e64 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
@@ -1,34 +1,6 @@
 require xserver-xf86-common.inc
 
-PROVIDES += "xserver-xf86-lite"
-
-PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
-
-LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
-
-DEPENDS = "${PROTO_DEPS} ${LIB_DEPS}"
-
-RDEPENDS_${PN} += "hal xorg-minimal-fonts"
-
-FILES_${PN} += "${bindir}/Xorg "
-
-EXTRA_OECONF += "--disable-static \
-                 --disable-acfb \
-                 --disable-ccfb \
-                 --disable-mcfb \
-                 --disable-dga \
-                 --disable-xinerama \
-                 --disable-xf86misc \
-                 --disable-xorgcfg \
-                 --disable-record \
-                 --disable-dmx \
-                 --disable-xnest \
-                 --disable-xvfb \
-                 --enable-composite \
+EXTRA_OECONF += "\
                  --disable-dri \
                  --disable-glx \
-                 --sysconfdir=/etc/X11 \
-                 --localstatedir=/var \
-                 --with-fontdir=${datadir}/fonts/X11 \
-                 --with-xkb-output=/var/lib/xkb \
-                 ac_cv_file__usr_share_sgml_X11_defs_ent=no"
+"
-- 
1.7.7



