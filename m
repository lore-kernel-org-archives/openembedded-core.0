Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDxg-0005mx-8x
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:11:52 +0200
Received: by ggnq1 with SMTP id q1so3017549ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pvtNHH75dCSQNKz3W9nmFjiRIdsm02255C1aj+NsOD0=;
	b=Budh/qWK3NPz6QuWTwidFjC3yE7Z9qsofAjNgMFhedC+GF5N+i2zqOcThYoFeJYswh
	1fD+F6crnfWhdB4GNV4sT6TCKcPQJpBaxO3eYJAvwR+TfAIiUO9zJrFVZnNhLML4FYSP
	mh9v/VCysn7yM9BOdt95Z7eC0dRlFOLZaK1ds=
Received: by 10.223.65.68 with SMTP id h4mr11327618fai.24.1318007174435;
	Fri, 07 Oct 2011 10:06:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a7sm13585568fam.22.2011.10.07.10.06.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:06:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:01 +0200
Message-Id: <9dcdeaa9b866ffc37a431f0621b505ba669e64d9.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 06/31] xserver-xorg-common: Split out some bigger modules and extensions from the main package
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
X-List-Received-Date: Fri, 07 Oct 2011 17:11:52 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-common.inc           |   60 +++++++++++++++++++-
 1 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 67edbcf..c0fcf8b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -20,11 +20,44 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
-PACKAGES =+ "${PN}-utils"
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
 
 RDEPENDS_${PN} += "xserver-xf86-config xkeyboard-config"
 
-FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
 FILES_${PN} = "${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/xserver/SecurityPolicy ${libdir}/xorg/modules/*.so ${libdir}/xorg/modules/*/*.so ${libdir}/xorg/modules/*/*/*.so /etc/X11 "
 FILES_${PN}-doc += "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/README.compiled"
 
@@ -33,6 +66,29 @@ FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
 		    ${libdir}/xorg/modules/*/*/.debug \
 		    "
 
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
+
 EXTRA_OECONF = "--with-fop=no"
 
 PACKAGECONFIG ??= "udev"
-- 
1.7.7



