Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 93B8560248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:11:57 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP; 12 Dec 2016 02:11:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="41344591"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 12 Dec 2016 02:11:58 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 598A26A4006;
	Mon, 12 Dec 2016 02:11:11 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:39 +0200
Message-Id: <82de5fe56a0f83e41ec5e2072b4cf6b237ad540e.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481536730.git.jussi.kukkonen@intel.com>
References: <cover.1481536730.git.jussi.kukkonen@intel.com>
Subject: [PATCH 02/12] xserver-xorg: Upgrade 1.18.4 -> 1.19.0
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
X-List-Received-Date: Mon, 12 Dec 2016 10:11:57 -0000

* xserver depends on xfont2 now.
* xwayland support requires wayland-scanner: Add patch to find
  wayland-scanner and protocol files while cross-compiling.
* patch MONOTONIC_CLOCK check so it works when cross-compiling
  (otherwise we always end with no monotonic clock and xwayland
  compile fails)

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  5 +-
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 61 ++++++++++++++++++++++
 ...c-Fix-wayland-scanner-and-protocols-locat.patch | 38 ++++++++++++++
 ...erver-xorg_1.18.4.bb => xserver-xorg_1.19.0.bb} |  9 ++--
 4 files changed, 108 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.18.4.bb => xserver-xorg_1.19.0.bb} (70%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 269fa63..400502f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -27,7 +27,7 @@ inherit distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
 PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86vidmodeproto compositeproto recordproto resourceproto videoproto scrnsaverproto  xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto presentproto"
-LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess"
+LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess"
 DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
 
 # Split out some modules and extensions from the main package
@@ -117,6 +117,7 @@ EXTRA_OECONF += "--with-fop=no \
                  --sysconfdir=/etc/X11 \
                  --localstatedir=/var \
                  --with-xkb-output=/var/lib/xkb \
+                 WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE} \
 "
 
 PACKAGECONFIG ??= "dri2 udev ${XORG_CRYPTO} \
@@ -138,7 +139,7 @@ PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-
 PACKAGECONFIG[systemd-logind] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,"
 PACKAGECONFIG[systemd] = "--with-systemd-daemon,--without-systemd-daemon,systemd"
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,xineramaproto"
-PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,wayland libepoxy"
+PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,wayland wayland-native wayland-protocols libepoxy"
 
 # Xorg requires a SHA1 implementation, pick one
 XORG_CRYPTO ??= "openssl"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
new file mode 100644
index 0000000..16ec3ed
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
@@ -0,0 +1,61 @@
+Discover monotonic clock using compile-time check
+
+monotonic clock check does not work when cross-compiling.
+
+Upstream-Status: Denied [Does not work on OpenBSD]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+
+
+Original patch follows:
+
+When xorg-xserver is being cross-compiled, there is currently no way
+for us to detect whether the monotonic clock is available on the
+target system, because we aren't able to run a test program on the host
+system. Currently, in this situation, we default to not use the
+monotonic clock. One problem with this situation is that the user will
+be treated as idle when the date is updated.
+
+To fix this situation, we now use a compile-time check to detect whether the
+monotonic clock is available. This check can run just fine when we are
+cross-compiling.
+
+Signed-off-by: David James <davidjames at google.com>
+---
+ configure.ac | 17 +++++++----------
+ 1 file changed, 7 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f7ab48c..26e85cd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1048,19 +1048,16 @@ if ! test "x$have_clock_gettime" = xno; then
+         CPPFLAGS="$CPPFLAGS -D_POSIX_C_SOURCE=200112L"
+     fi
+ 
+-    AC_RUN_IFELSE([AC_LANG_SOURCE([
++    AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
+ #include <time.h>
+-
+-int main(int argc, char *argv[[]]) {
+-    struct timespec tp;
+-
+-    if (clock_gettime(CLOCK_MONOTONIC, &tp) == 0)
++#include <unistd.h>
++int main() {
++#if !(defined(_POSIX_MONOTONIC_CLOCK) && _POSIX_MONOTONIC_CLOCK >= 0 && defined(CLOCK_MONOTONIC))
++        #error No monotonic clock
++#endif
+         return 0;
+-    else
+-        return 1;
+ }
+-    ])], [MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no],
+-       [MONOTONIC_CLOCK="cross compiling"])
++]])],[MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no])
+ 
+     LIBS="$LIBS_SAVE"
+     CPPFLAGS="$CPPFLAGS_SAVE"
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch
new file mode 100644
index 0000000..eafd07a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch
@@ -0,0 +1,38 @@
+From 963428f914c42270d3312d4f0c0840565521534e Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 16 Nov 2016 00:41:51 +0200
+Subject: [PATCH 2/2] configure.ac: Fix wayland-scanner and protocols locations
+
+We want to use the wayland-scanner in path (native sysroot)
+instead of using pkg-config which gives us target paths.
+
+The protocols paths on the other hand need to be prefixed with the
+(allarch) sysroot because, again, pkg-config gives us target paths.
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 58f1567..383a7df 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2525,11 +2525,9 @@ if test "x$XWAYLAND" = xyes; then
+ 		AC_MSG_ERROR([Xwayland requires CLOCK_MONOTONIC support.])
+ 	fi
+ 
+-	WAYLAND_PREFIX=`$PKG_CONFIG --variable=prefix wayland-client`
+-	AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner],,
+-		     [${WAYLAND_PREFIX}/bin$PATH_SEPARATOR$PATH])
++	AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner])
+ 
+-	AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
++	AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, ${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
+ fi
+ 
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.0.bb
similarity index 70%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.4.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.0.bb
index 6700565..8725382 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.0.bb
@@ -1,8 +1,11 @@
 require xserver-xorg.inc
 
-SRC_URI += "file://musl-arm-inb-outb.patch"
-SRC_URI[md5sum] = "d4842dfe3bd9a9d062f2fa1df9104a46"
-SRC_URI[sha256sum] = "278459b2c31d61a15655d95a72fb79930c480a6bb8cf9226e48a07df8b1d31c8"
+SRC_URI += "file://musl-arm-inb-outb.patch \
+            file://0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch \
+            file://0002-configure.ac-Fix-wayland-scanner-and-protocols-locat.patch \
+            "
+SRC_URI[md5sum] = "6a4d01e4e5047ab8f556960424ba1fa9"
+SRC_URI[sha256sum] = "149a708b50befc2d5a40b98d45ddd2ebe0beec018e6d0c663c43bad6210e4da3"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.1.4


