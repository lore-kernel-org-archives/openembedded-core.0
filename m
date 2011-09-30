Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9Xaq-0005dc-Qj
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:33:13 +0200
Received: by bke11 with SMTP id 11so1506871bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Nx3TDKkhfapOXY4YPRnAjbaCn/g3NkwSqjWzpo68g3A=;
	b=s5K18K4U0nGZZzURRJANwI535yY67Xed2wy9Rnmf7OGHn5yAmmHFFVT3Y14GLDW/qm
	e/6nfv4AAqd4MoDh+es8B0LiWW6mTtHhQT6bHsLuBeRpqLdfdH8LSLgAEkN6veG3SBAC
	c9fXXh3dwhRp+t5OJ0+LGJxQu3wAbaBx5H00o=
Received: by 10.204.155.74 with SMTP id r10mr1202836bkw.244.1317367652814;
	Fri, 30 Sep 2011 00:27:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z7sm3933999bkt.5.2011.09.30.00.27.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:27:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 09:27:12 +0200
Message-Id: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <cover.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
Subject: [PATCH 01/13] xserver-xf86: upgrade to 1.11.0 and move shared definitions to .inc files
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
X-List-Received-Date: Fri, 30 Sep 2011 07:33:13 -0000

* also improve packaging a bit
* motivated by xserver-xorg from meta-oe (which is IMHO named better -
  closer to upstream)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xf86-1.11.0.inc           |    7 ++
 .../xorg-xserver/xserver-xf86-common.inc           |  114 +++++++++++++++++---
 .../xorg-xserver/xserver-xf86-dri-lite.inc         |   34 +-----
 .../xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb   |   20 ----
 .../xorg-xserver/xserver-xf86-dri-lite_1.11.0.bb   |    4 +
 .../xorg-xserver/xserver-xf86-dri-lite_git.bb      |    8 +--
 .../xorg-xserver/xserver-xf86-lite.inc             |   32 +-----
 .../xorg-xserver/xserver-xf86-lite_1.10.1.bb       |   12 --
 .../xorg-xserver/xserver-xf86-lite_1.11.0.bb       |    2 +
 9 files changed, 123 insertions(+), 110 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-1.11.0.inc
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.0.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-1.11.0.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-1.11.0.inc
new file mode 100644
index 0000000..e720316
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-1.11.0.inc
@@ -0,0 +1,7 @@
+SRC_URI += "file://crosscompile.patch"
+
+# Misc build failure for master HEAD
+SRC_URI += "file://fix_open_max_preprocessor_error.patch"
+
+SRC_URI[md5sum] = "948e665bddc31c34be79b59db67c986e"
+SRC_URI[sha256sum] = "9feb62c2972644fadaf94eda02c1d0009ec7089abd47086e5d9dcb4625338453"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
index 000aea3..c323095 100644
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
+EXTRA_OECONF = "--with-fop=no \
+                --disable-static \
+                --disable-acfb \
+                --disable-ccfb \
+                --disable-mcfb \
+                --disable-dga \
+                --disable-xinerama \
+                --disable-xf86misc \
+                --disable-xorgcfg \
+                --disable-record \
+                --disable-dmx \
+                --disable-xnest \
+                --disable-xvfb \
+                --enable-composite \
+                --sysconfdir=/etc/X11 \
+                --localstatedir=/var \
+                --with-fontdir=${datadir}/fonts/X11 \
+                --with-xkb-output=/var/lib/xkb \
+                ${CONFIG_MANAGER_OPTION} \
+                ac_cv_file__usr_share_sgml_X11_defs_ent=no \
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
index 3aca760..093e049 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
@@ -1,37 +1,15 @@
 require xserver-xf86-common.inc
 
-PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
+PROTO_DEPS += "xf86driproto dri2proto"
+LIB_DEPS += "virtual/libgl"
 
-LIB_DEPS = "pixman virtual/libgl libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
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
                  --enable-glx-tls \
-                 --sysconfdir=/etc/X11 \
-                 --localstatedir=/var \
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
deleted file mode 100644
index ea57140..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require xserver-xf86-dri-lite.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
-
-PROTO_DEPS += "xf86driproto dri2proto"
-
-DEPENDS += "font-util"
-
-PE = "1"
-PR = "r0"
-
-SRC_URI += "file://crosscompile.patch"
-
-# Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch"
-
-SRC_URI[md5sum] = "75f117c74f2ecaf9dd167f6a66ac98de"
-SRC_URI[sha256sum] = "143c7c3d7d4428352e1153dffa34fd64af391f72d30b2a03e911e54e36f00b5d"
-
-EXTRA_OECONF += "--enable-dri --enable-dri2"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.0.bb
new file mode 100644
index 0000000..54ff37a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.0.bb
@@ -0,0 +1,4 @@
+require xserver-xf86-dri-lite.inc
+require xserver-xf86-${PV}.inc
+
+PE = "1"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
index adefcdb..9af0911 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
@@ -7,12 +7,6 @@ PE = "1"
 PR = "r0"
 PV = "1.10+git${SRCPV}"
 
-PROTO_DEPS += "xf86driproto dri2proto"
-
-DEPENDS += "font-util"
-
-RDEPENDS_${PN} += "xkeyboard-config"
-
 SRC_URI = "git://anongit.freedesktop.org/git/xorg/xserver;protocol=git;branch=master \
            file://crosscompile.patch; \
            file://fix_macros1.patch;"
@@ -20,6 +14,6 @@ SRC_URI = "git://anongit.freedesktop.org/git/xorg/xserver;protocol=git;branch=ma
 # Misc build failure for master HEAD
 SRC_URI += "file://fix_open_max_preprocessor_error.patch;"
 
-EXTRA_OECONF += "--enable-dri --enable-dri2 --enable-dga"
+EXTRA_OECONF += "--enable-dga"
 
 S = "${WORKDIR}/git"
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
deleted file mode 100644
index f9b3a64..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xserver-xf86-lite.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
-
-PR = "r0"
-
-DEPENDS += "font-util"
-
-SRC_URI += "file://crosscompile.patch"
-
-# Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch;"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.0.bb
new file mode 100644
index 0000000..0c1b0fd
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.0.bb
@@ -0,0 +1,2 @@
+require xserver-xf86-lite.inc
+require xserver-xf86-${PV}.inc
-- 
1.7.6.1



