Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1TdmW0-0000MK-7L
	for Openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 19:37:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2012 10:21:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,180,1355126400"; d="scan'208";a="225937979"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 28 Nov 2012 10:22:22 -0800
From: nitin.a.kamble@intel.com
To: meta-intel@yoctoproject.org, Openembedded-core@lists.openembedded.org,
	tom.zanussi@intel.com, darren.hart@intel.com, ross.burton@intel.com
Date: Wed, 28 Nov 2012 10:21:32 -0800
Message-Id: <80889d89c4670fffecda4e06e85c68f73aa67ce0.1354126748.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1354126748.git.nitin.a.kamble@intel.com>
References: <cover.1354126748.git.nitin.a.kamble@intel.com>
Subject: [meta-intel patch 1/3] xserver-xorg-1.9.3: fix packaging issues
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
X-List-Received-Date: Wed, 28 Nov 2012 18:37:51 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This was affecting crownbay BSP. And it may also be affecting
fri2, sys940x BSPs. And this commit will fix the issues for all
these EMGD based BSPs.

Because of the xserver recipe upgrade in the oecore layer, the
xserver packaging defined in the .inc file is changed. And this
change breaks the packaging of this older xserver recipe.
  This commit fixes the issue by using meta-intel layer specific
version of xserver-xorg.inc file

This fixes bug:
[Yocto #3502]

All these warnings are also fixed with this commit:

WARNING: QA Issue: xserver-psb: Files/directories were installed but not shipped
  /usr/lib/xorg/modules/extensions/libextmod.so
  /usr/lib/xorg/modules/extensions/libdbe.so
  /usr/lib/xorg/modules/extensions/libdri.so
  /usr/lib/xorg/modules/extensions/libdri2.so
  /usr/lib/xorg/modules/linux/libfbdevhw.so

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../xorg-xserver/xserver-xorg-1.9.3.inc            |    2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  160 ++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.9.3.bb             |    2 +-
 conf/machine/include/meta-intel.inc                |   10 +-
 4 files changed, 171 insertions(+), 3 deletions(-)
 create mode 100644 common/recipes-graphics/xorg-xserver/xserver-xorg.inc

diff --git a/common/recipes-graphics/xorg-xserver/xserver-xorg-1.9.3.inc b/common/recipes-graphics/xorg-xserver/xserver-xorg-1.9.3.inc
index 1c71d7b..39c9c92 100644
--- a/common/recipes-graphics/xorg-xserver/xserver-xorg-1.9.3.inc
+++ b/common/recipes-graphics/xorg-xserver/xserver-xorg-1.9.3.inc
@@ -17,4 +17,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3dd2bbe3563837f80ed8926b06c1c353"
 SRC_URI[md5sum] = "5bef6839a76d029204ab31aa2fcb5201"
 SRC_URI[sha256sum] = "864831f51e841ff37f2445d1c85b86b559c8860a435fb496aead4f256a2b141d"
 
-PR = "r2"
+PR = "r3"
diff --git a/common/recipes-graphics/xorg-xserver/xserver-xorg.inc b/common/recipes-graphics/xorg-xserver/xserver-xorg.inc
new file mode 100644
index 0000000..49b9b46
--- /dev/null
+++ b/common/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -0,0 +1,160 @@
+DESCRIPTION = "The X.Org X server"
+HOMEPAGE = "http://www.x.org"
+SECTION = "x11/base"
+LICENSE = "MIT-X"
+
+# xf86-*-* packages depend on an X server built with the xfree86 DDX
+# so we have a virtual to represent that:
+# deprecated, we should use virtual/xserver instead
+PROVIDES = "virtual/xserver-xf86"
+
+# Other packages tend to just care that there is *an* X server:
+PROVIDES += "virtual/xserver"
+
+PE = "2"
+INC_PR = "r3"
+
+XORG_PN = "xorg-server"
+SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI += "file://macro_tweak.patch"
+
+S = "${WORKDIR}/${XORG_PN}-${PV}"
+
+inherit autotools pkgconfig
+
+PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
+LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
+DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
+
+# Split out some modules and extensions from the main package
+# These aren't needed for basic operations and only take up space:
+#  32.0k   libdri.so
+#  91.0k   libexa.so
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
+             ${PN}-extension-fbdevhw \
+             ${PN}-module-libint10 \
+             ${PN}-module-libafb \
+             ${PN}-module-libwfb  \
+             ${PN}-module-libmfb \
+             ${PN}-module-libcfb \
+             ${PN}-module-exa \
+             ${PN}-module-xaa \
+             ${PN}-module-libxf1bpp \
+             ${PN}-module-libxf4bpp"
+
+RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
+RDEPENDS_${PN}-xvfb += "xkeyboard-config"
+RDEPENDS_${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
+
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
+FILES_${PN}-extension-fbdevhw = "${libdir}/xorg/modules/linux/libfbdevhw.so"
+FILES_${PN}-module-libint10 = "${libdir}/xorg/modules/libint10.so"
+FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
+FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
+FILES_${PN}-module-libmfb = "${libdir}/xorg/modules/libmfb.so"
+FILES_${PN}-module-libcfb = "${libdir}/xorg/modules/libcfb.so"
+FILES_${PN}-module-exa = "${libdir}/xorg/modules/libexa.so"
+FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
+FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
+FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
+
+EXTRA_OECONF += "--with-fop=no \
+                 --without-xmlto \
+                 --with-pic \
+                 --disable-static \
+                 --disable-acfb \
+                 --disable-ccfb \
+                 --disable-mcfb \
+                 --disable-xinerama \
+                 --disable-xf86misc \
+                 --disable-xorgcfg \
+                 --disable-record \
+                 --disable-dmx \
+                 --disable-xnest \
+                 --disable-xvfb \
+                 --enable-composite \
+                 --without-dtrace \
+                 --with-int10=x86emu \
+                 --sysconfdir=/etc/X11 \
+                 --localstatedir=/var \
+                 --with-fontdir=${datadir}/fonts/X11 \
+                 --with-xkb-output=/var/lib/xkb \
+                 ac_cv_file__usr_share_sgml_X11_defs_ent=no \
+"
+
+PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'glx', '', d)}"
+PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
+PACKAGECONFIG[glx] = "--enable-dri --enable-dri2 --enable-glx --enable-glx-tls,\
+                      --disable-dri --disable-glx,\
+                      xf86driproto dri2proto mesa-dri"
+
+do_install_append () {
+	# Its assumed base-files creates this for us
+	rmdir ${D}${localstatedir}/log/
+}
+
+# Add runtime provides for the ABI versions of the video and input subsystems,
+# so that drivers can depend on the relevant version.
+python populate_packages_prepend() {
+    import subprocess
+
+    # Set PKG_CONFIG_PATH so pkg-config looks at the .pc files that are going
+    # into the new package, not the staged ones.
+    newenv = dict(os.environ)
+    newenv["PKG_CONFIG_PATH"] = d.expand("${PKGD}${libdir}/pkgconfig/")
+
+    def get_abi(name):
+        abis = {
+          "video": "abi_videodrv",
+          "input": "abi_xinput"
+        }
+        p = subprocess.Popen(args="pkg-config --variable=%s xorg-server" % abis[name],
+                             shell=True, env=newenv, stdout=subprocess.PIPE)
+        output = p.communicate()[0]
+        return "xorg-abi-%s-%s" % (name, output.split(".")[0])
+
+    pn = d.getVar("PN", True)
+    d.appendVar("RPROVIDES_" + pn, " " + get_abi("input"))
+    d.appendVar("RPROVIDES_" + pn, " " + get_abi("video"))
+}
diff --git a/common/recipes-graphics/xorg-xserver/xserver-xorg_1.9.3.bb b/common/recipes-graphics/xorg-xserver/xserver-xorg_1.9.3.bb
index f62cad2..8e97888 100644
--- a/common/recipes-graphics/xorg-xserver/xserver-xorg_1.9.3.bb
+++ b/common/recipes-graphics/xorg-xserver/xserver-xorg_1.9.3.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-xserver/xserver-xorg.inc
+require xserver-xorg.inc
 require xserver-xorg-${PV}.inc
 
 PE = "1"
diff --git a/conf/machine/include/meta-intel.inc b/conf/machine/include/meta-intel.inc
index f0e538d..ed3a423 100644
--- a/conf/machine/include/meta-intel.inc
+++ b/conf/machine/include/meta-intel.inc
@@ -7,10 +7,18 @@
 #
 # XSERVER subcomponents, used to build the XSERVER variable
 #
+
+# for Xserver older than 1.13.0
+OLD_XSERVER_IA32_EXT = "xserver-xorg-extension-dri \
+           xserver-xorg-extension-dri2 \
+           xserver-xorg-extension-extmod \
+           xserver-xorg-extension-dbe \
+           "
+
 XSERVER_IA32_EMGD = "emgd-driver-bin \
+           ${OLD_XSERVER_IA32_EXT} \
            "
 
 XSERVER_IA32_MATROX_MGA = "xserver-xorg-module-xaa \
            xf86-video-mga \
            "
-
-- 
1.7.3.4



