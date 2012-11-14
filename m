Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYd7d-0002VG-BX
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 14:35:17 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2012 05:21:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,250,1352102400"; d="scan'208";a="219485914"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2012 05:21:22 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 15:21:06 +0200
Message-Id: <a7f0c78da3a41c3d7a57966ba15b3013f3da1744.1352898505.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352898505.git.laurentiu.palcu@intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352898505.git.laurentiu.palcu@intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
Subject: [PATCH v3 08/12] xserver-xorg: upgrade to 1.13.0
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
X-List-Received-Date: Wed, 14 Nov 2012 13:35:17 -0000

The patch contains several aditional changes:
 * removed one backported patch (included in the new release);
 * changed mips64-compiler.patch to apply properly;
 * licence checksum for COPYING file changed: some copyright years have
   been changed

The following external modules are now built-in:
 * DBE
 * DRI2
 * DRI
 * RECORD

The extmod module was completely removed.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/conf/machine/include/ia32-base.inc            |    5 +-
 .../xserver-xorg-1.11.4/pkgconfig-deps.patch       |   70 --------------------
 .../crosscompile.patch                             |    0
 .../fix_open_max_preprocessor_error.patch          |    0
 .../macro_tweak.patch                              |    0
 .../mips64-compiler.patch                          |   28 ++++----
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   32 +++++----
 ...erver-xorg_1.11.4.bb => xserver-xorg_1.13.0.bb} |    5 +-
 8 files changed, 37 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 => xserver-xorg-1.13.0}/crosscompile.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 => xserver-xorg-1.13.0}/fix_open_max_preprocessor_error.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 => xserver-xorg-1.13.0}/macro_tweak.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 => xserver-xorg-1.13.0}/mips64-compiler.patch (42%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.11.4.bb => xserver-xorg_1.13.0.bb} (56%)

diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
index 4b10183..c2d267a 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -33,11 +33,8 @@ XSERVER_IA32_BASE = "xserver-xorg \
            xf86-input-synaptics \
            "
 
-XSERVER_IA32_EXT = "xserver-xorg-extension-dri \
-           xserver-xorg-extension-dri2 \
+XSERVER_IA32_EXT = "
            xserver-xorg-extension-glx \
-           xserver-xorg-extension-extmod \
-           xserver-xorg-extension-dbe \
            xserver-xorg-module-libint10 \
            "
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
deleted file mode 100644
index fee8d76..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-deps.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-commit 41d903918a5721e53ed694880eab44170f9717cc
-Author: Jeremy Huddleston <jeremyhu@apple.com>
-Date:   Wed Sep 14 13:45:18 2011 -0500
-
-    xorg-server.pc.in: Remove libpciaccess and pixman-1 from Requires
-    
-    Every module building against xorg-server does not *Require* pixman nor
-    libpciaccess.  If such modules need pixman or pciaccess, they should be
-    depending on them directly rather than inheriting a dependency from
-    xorg-server.  To do this, they should use PKG_CHECK_MODULES in configure.ac
-    to check for pixman-1 or pciaccess and include the apporpriate _LIBS variable
-    to the appropriate _LDFLAGS variable in Makefile.am
-    
-    This also moves pixman-1 to Requires.private, so CPPFLAGS is set right to
-    to satisfy include dependencies but avoid linking needlessly.
-    
-    Signed-off-by: Jeremy Huddleston <jeremyhu@apple.com>
-    Reviewed-by: Gaetan Nadon <memsize@videotron.ca>
-
-diff --git a/configure.ac b/configure.ac
-index 50beb01..4bfa82c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -780,11 +780,6 @@ VIDMODEPROTO="xf86vidmodeproto >= 2.2.99.1"
- WINDOWSWMPROTO="windowswmproto"
- APPLEWMPROTO="applewmproto >= 1.4"
- 
--dnl Core modules for most extensions, et al.
--SDK_REQUIRED_MODULES="[xproto >= 7.0.22] [randrproto >= 1.2.99.3] [renderproto >= 0.11] [xextproto >= 7.1.99] [inputproto >= 1.9.99.902] [kbproto >= 1.0.3] fontsproto"
--# Make SDK_REQUIRED_MODULES available for inclusion in xorg-server.pc
--AC_SUBST(SDK_REQUIRED_MODULES)
--
- dnl List of libraries that require a specific version
- LIBAPPLEWM="applewm >= 1.4"
- LIBDMX="dmx >= 1.0.99.1"
-@@ -806,6 +801,11 @@ dnl specific modules against it
- PKG_CHECK_MODULES(PIXMAN, $LIBPIXMAN)
- REQUIRED_LIBS="$REQUIRED_LIBS $LIBPIXMAN $LIBXFONT xau"
- 
-+dnl Core modules for most extensions, et al.
-+SDK_REQUIRED_MODULES="[xproto >= 7.0.22] [randrproto >= 1.2.99.3] [renderproto >= 0.11] [xextproto >= 7.1.99] [inputproto >= 1.99.99.902] [kbproto >= 1.0.3] fontsproto $LIBPIXMAN"
-+# Make SDK_REQUIRED_MODULES available for inclusion in xorg-server.pc
-+AC_SUBST(SDK_REQUIRED_MODULES)
-+
- REQUIRED_MODULES="[fixesproto >= 5.0] [damageproto >= 1.1] [xcmiscproto >= 1.2.0] [xtrans >= 1.2.2] [bigreqsproto >= 1.1.0] $SDK_REQUIRED_MODULES"
- 
- if test "x$CONFIG_UDEV" = xyes &&
-@@ -1583,6 +1583,7 @@ if test "x$XORG" = xyes; then
- 	if test "x$PCI" = xyes; then
- 
- 	PKG_CHECK_MODULES([PCIACCESS], $LIBPCIACCESS)
-+	SDK_REQUIRED_MODULES="$SDK_REQUIRED_MODULES $LIBPCIACCESS"
-	SAVE_LIBS=$LIBS
-	SAVE_CFLAGS=$CFLAGS
-	CFLAGS=$PCIACCESS_CFLAGS
-diff --git a/xorg-server.pc.in b/xorg-server.pc.in
-index fb238b5..a98eca8 100644
---- a/xorg-server.pc.in
-+++ b/xorg-server.pc.in
-@@ -15,7 +15,6 @@ abi_extension=@abi_extension@
- Name: xorg-server
- Description: Modular X.Org X Server
- Version: @PACKAGE_VERSION@
--Requires: pixman-1 pciaccess
- Requires.private: @SDK_REQUIRED_MODULES@
- Cflags: -I${sdkdir} @symbol_visibility@
- Libs: -L${libdir}
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/crosscompile.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crosscompile.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/crosscompile.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/fix_open_max_preprocessor_error.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_open_max_preprocessor_error.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/fix_open_max_preprocessor_error.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro_tweak.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_tweak.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro_tweak.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compiler.patch
similarity index 42%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compiler.patch
index e6bc95b..168368e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compiler.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compiler.patch
@@ -6,24 +6,24 @@ This patch choses the right values for mips64
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Pending
-Index: xorg-server-1.11.2/hw/xfree86/common/compiler.h
+Index: xorg-server-1.13.0/hw/xfree86/common/compiler.h
 ===================================================================
---- xorg-server-1.11.2.orig/hw/xfree86/common/compiler.h	2012-05-10 12:19:59.485599046 -0700
-+++ xorg-server-1.11.2/hw/xfree86/common/compiler.h	2012-05-10 12:20:53.109602488 -0700
-@@ -104,6 +104,7 @@
- 
- #  if !defined(__arm__)
- #   if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
+--- xorg-server-1.13.0-orig/hw/xfree86/common/compiler.h	2012-06-14 23:04:29.000000000 +0300
++++ xorg-server-1.13.0/hw/xfree86/common/compiler.h	2012-11-08 10:06:50.865831783 +0200
+@@ -101,6 +101,7 @@
+ #if defined(NO_INLINE) || defined(DO_PROTOTYPES)
+ #if !defined(__arm__)
+ #if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
 +      && !defined(__mips64) \
        && !(defined(__alpha__) && defined(linux)) \
        && !(defined(__ia64__) && defined(linux)) \
  
-@@ -708,7 +709,7 @@
+@@ -721,7 +722,7 @@
  }
  
- #   elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
--#    ifdef __arm32__
-+#    if defined (__arm32__) || defined (__mips64)
- #     define PORT_SIZE long
- #    else
- #     define PORT_SIZE short
+ #elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
+-#ifdef __arm32__
++#if defined (__arm32__) || defined (__mips64)
+ #define PORT_SIZE long
+ #else
+ #define PORT_SIZE short
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 33564eb..4135a8b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
-LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bc098b9774ed096943f6c37b5beeef13"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
@@ -13,7 +13,7 @@ PROVIDES = "virtual/xserver-xf86"
 PROVIDES += "virtual/xserver"
 
 PE = "2"
-INC_PR = "r3"
+INC_PR = "r5"
 
 XORG_PN = "xorg-server"
 SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
@@ -48,12 +48,7 @@ PACKAGES =+ "${PN}-security-policy \
              ${PN}-utils \
              ${PN}-xephyr \
              ${PN}-multimedia-modules \
-             ${PN}-extension-dri \
-             ${PN}-extension-dri2 \
              ${PN}-extension-glx \
-             ${PN}-extension-record \
-             ${PN}-extension-extmod \
-             ${PN}-extension-dbe \
              ${PN}-module-libint10 \
              ${PN}-module-libafb \
              ${PN}-module-libwfb  \
@@ -67,6 +62,24 @@ PACKAGES =+ "${PN}-security-policy \
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
 RDEPENDS_${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
+RREPLACES_${PN} =  "${PN}-extension-dri \
+                    ${PN}-extension-dri2 \
+                    ${PN}-extension-record \
+                    ${PN}-extension-extmod \
+                    ${PN}-extension-dbe \
+                   "
+RPROVIDES_${PN} =  "${PN}-extension-dri \
+                    ${PN}-extension-dri2 \
+                    ${PN}-extension-record \
+                    ${PN}-extension-extmod \
+                    ${PN}-extension-dbe \
+                   "
+RCONFLICTS_${PN} = "${PN}-extension-dri \
+                    ${PN}-extension-dri2 \
+                    ${PN}-extension-record \
+                    ${PN}-extension-extmod \
+                    ${PN}-extension-dbe \
+                   "
 
 FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
 FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
@@ -82,12 +95,7 @@ FILES_${PN}-xvfb = "${bindir}/Xvfb"
 FILES_${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf ${bindir}/getconfig ${bindir}/getconfig.pl"
 FILES_${PN}-xephyr = "${bindir}/Xephyr"
 FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
-FILES_${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
-FILES_${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
 FILES_${PN}-extension-glx = "${libdir}/xorg/modules/extensions/libglx.so"
-FILES_${PN}-extension-record = "${libdir}/xorg/modules/extensions/librecord.so"
-FILES_${PN}-extension-extmod = "${libdir}/xorg/modules/extensions/libextmod.so"
-FILES_${PN}-extension-dbe = "${libdir}/xorg/modules/extensions/libdbe.so"
 FILES_${PN}-module-libint10 = "${libdir}/xorg/modules/libint10.so"
 FILES_${PN}-module-libafb = "${libdir}/xorg/modules/libafb.so"
 FILES_${PN}-module-libwfb = "${libdir}/xorg/modules/libwfb.so"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
similarity index 56%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
index 4739ee2..8ad87b8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
@@ -4,10 +4,9 @@ require xserver-xorg.inc
 SRC_URI += "file://crosscompile.patch \
             file://fix_open_max_preprocessor_error.patch \
             file://mips64-compiler.patch \
-            file://pkgconfig-deps.patch \
            "
 
-SRC_URI[md5sum] = "256325e9b17dff479d92bed97f6b0adb"
-SRC_URI[sha256sum] = "3e2935bc400612df58d5b5e6840829e2c63af02c2e7d2893092500358a4366fc"
+SRC_URI[md5sum] = "bde3d178b756597d2ec2a19ef60d2e1f"
+SRC_URI[sha256sum] = "548b91cb01087ad4f892428e7ac4955251cf12393e86c70420436b33848ef28a"
 
 PR = "${INC_PR}.0"
-- 
1.7.9.5



