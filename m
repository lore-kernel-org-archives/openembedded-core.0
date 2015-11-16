Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA7D6E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 17:52:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Nov 2015 09:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,303,1444719600"; d="scan'208";a="821442116"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 16 Nov 2015 09:52:56 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Nov 2015 19:56:13 +0200
Message-Id: <1447696573-9149-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <80cc3d9db9fee48837ea71f4f4efaa5f95842782.1447405312.git.jussi.kukkonen@intel.com>
References: <80cc3d9db9fee48837ea71f4f4efaa5f95842782.1447405312.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 12/19] xserver-xorg: Upgrade 1.17.2 -> 1.18.0
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
X-List-Received-Date: Mon, 16 Nov 2015 17:52:59 -0000

* Remove glibc-guard patch: xserver no longer uses termio.h on linux
  in any case.
* Remove "--enable-glx-tls": this hasn't done anything since glapi
  was separated from glx
* Note that xserver no longer installs evdev configuration
  (evdev and/or libinput should do it instead)
* Add patch to check for libsystemd correctly
* Add PACKAGECONFIG for libsystemd

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Changes since v1:
* Add patch to check for libsystemd correctly
  (compile failed with systemd)
* Add PACKAGECONFIG for libsystemd

I've force-pushed the jku/x11-gtk-upgrades branch with this change.



 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  4 +-
 ...e-__GLIBC__-guard-for-glibc-specific-code.patch | 31 --------------
 ....ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch | 50 ++++++++++++++++++++++
 ...erver-xorg_1.17.2.bb => xserver-xorg_1.18.0.bb} |  7 ++-
 4 files changed, 56 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.17.2.bb => xserver-xorg_1.18.0.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 9881c94..32c4491 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -126,6 +126,7 @@ EXTRA_OECONF += "--with-fop=no \
 
 PACKAGECONFIG ??= "dri2 udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri glx', '', d)} \
                    ${@bb.utils.contains("DISTRO_FEATURES", "wayland", "xwayland", "", d)} \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)} \
 "
 
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
@@ -133,11 +134,12 @@ PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86dripro
 PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
 # DRI3 requires xshmfence to also be enabled
 PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto"
-PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtual/libgl virtual/libx11"
+PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,glproto virtual/libgl virtual/libx11"
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[systemd-logind] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,"
+PACKAGECONFIG[systemd] = "--with-systemd-daemon,--without-systemd-daemon,systemd"
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,xineramaproto"
 PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,wayland libepoxy"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
deleted file mode 100644
index 21e4ed4..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From f242740f6488a25e6ca84968b0e2319a9a3975b4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 6 Apr 2015 20:52:50 -0700
-Subject: [PATCH] use __GLIBC__ guard for glibc specific code
-
-Using __linux__ is a tad bit wrong assumption since
-linux != glibc
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- hw/xfree86/os-support/xf86_OSlib.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/xfree86/os-support/xf86_OSlib.h b/hw/xfree86/os-support/xf86_OSlib.h
-index eb0a338..c366ffc 100644
---- a/hw/xfree86/os-support/xf86_OSlib.h
-+++ b/hw/xfree86/os-support/xf86_OSlib.h
-@@ -178,7 +178,7 @@
- #include <sys/types.h>
- #include <assert.h>
- 
--#ifdef __linux__
-+#ifdef __GLIBC__
- #include <termio.h>
- #else                           /* __GLIBC__ */
- #include <termios.h>
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
new file mode 100644
index 0000000..3ac6c5b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
@@ -0,0 +1,50 @@
+From 0c2153d468229f56e6fef71d2f002e0cae14aa55 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 16 Nov 2015 16:18:40 +0200
+Subject: [PATCH] configure.ac: Use libsystemd in REQUIRED_LIBS check
+
+REQUIRED_LIBS needs to be set to the correct systemd library,
+otherwise the later check will either fail or use the wrong
+pc file.
+
+Upstream-status: Submitted [xorg-devel@lists.x.org]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 96c0242..f63eca1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -837,9 +837,16 @@ AC_ARG_WITH([systemd-daemon],
+ 		[support systemd socket activation (default: auto)]),
+ 	[WITH_SYSTEMD_DAEMON=$withval], [WITH_SYSTEMD_DAEMON=auto])
+ PKG_CHECK_MODULES([SYSTEMD_DAEMON], [libsystemd-daemon],
+-                  [HAVE_SYSTEMD_DAEMON=yes],
++                  [REQUIRED_SYSTEMD_DAEMON=libsystemd-daemon],
+                   [PKG_CHECK_MODULES([SYSTEMD_DAEMON], [libsystemd],
+-                                     [HAVE_SYSTEMD_DAEMON=yes], [HAVE_SYSTEMD_DAEMON=no])])
++                                     [REQUIRED_SYSTEMD_DAEMON=libsystemd],
++                                     [REQUIRED_SYSTEMD_DAEMON=])])
++if test "x$REQUIRED_SYSTEMD_DAEMON" = x; then
++        HAVE_SYSTEMD_DAEMON=no
++else
++        HAVE_SYSTEMD_DAEMON=yes
++fi
++
+ if test "x$WITH_SYSTEMD_DAEMON" = xauto; then
+ 	WITH_SYSTEMD_DAEMON="$HAVE_SYSTEMD_DAEMON"
+ fi
+@@ -848,7 +855,7 @@ if test "x$WITH_SYSTEMD_DAEMON" = xyes; then
+ 		AC_MSG_ERROR([systemd support requested but no library has been found])
+ 	fi
+ 	AC_DEFINE(HAVE_SYSTEMD_DAEMON, 1, [Define to 1 if libsystemd-daemon is available])
+-	REQUIRED_LIBS="$REQUIRED_LIBS libsystemd-daemon"
++	REQUIRED_LIBS="$REQUIRED_LIBS $REQUIRED_SYSTEMD_DAEMON"
+ fi
+ AM_CONDITIONAL([HAVE_SYSTEMD_DAEMON], [test "x$HAVE_SYSTEMD_DAEMON" = "xyes"])
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
index 3039d30..60973c5 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.17.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
@@ -1,9 +1,8 @@
 require xserver-xorg.inc
 
-SRC_URI += "file://0001-use-__GLIBC__-guard-for-glibc-specific-code.patch \
-           "
-SRC_URI[md5sum] = "397e405566651150490ff493e463f1ad"
-SRC_URI[sha256sum] = "f61120612728f2c5034671d0ca3e2273438c60aba93b3dda4a8aa40e6a257993"
+SRC_URI += "file://configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch"
+SRC_URI[md5sum] = "3c1c1057d3ad27380d8dd87ffcc182cd"
+SRC_URI[sha256sum] = "195670819695d9cedd8dde95fbe069be0d0f488a77797a2d409f9f702daf312e"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.1.4


