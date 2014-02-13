Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B46306EB24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 13:45:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 13 Feb 2014 05:45:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,838,1384329600"; d="scan'208";a="480885827"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.47])
	by fmsmga002.fm.intel.com with ESMTP; 13 Feb 2014 05:45:20 -0800
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 15:45:20 +0200
Message-Id: <8585fa5505c917e2c9741c70c41437cf5aaa9ff3.1392298949.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392298949.git.valentin.popa@intel.com>
References: <cover.1392298949.git.valentin.popa@intel.com>
In-Reply-To: <cover.1392298949.git.valentin.popa@intel.com>
References: <cover.1392298949.git.valentin.popa@intel.com>
Subject: [PATCH 2/2] weston: upgrade to 1.4.0
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
X-List-Received-Date: Thu, 13 Feb 2014 13:45:20 -0000

(*) added fbdev backend in case the user will
    want to use weston even if drm fails.
(*) removed tablet-shell flag because in 1.4
    tablet-shell has been removed from src.
(*) tested on qemux86 and genericx86 with
    core-image-weston and core-image-sato.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 ...emove-dependence-on-wayland-scanner-flags.patch | 30 ++++++++++++++++++++++
 .../wayland/{weston_1.3.1.bb => weston_1.4.0.bb}   | 12 ++++-----
 2 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch
 rename meta/recipes-graphics/wayland/{weston_1.3.1.bb => weston_1.4.0.bb} (89%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch b/meta/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch
new file mode 100644
index 0000000..14606c8
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch
@@ -0,0 +1,30 @@
+From a0335393ddde2228c84eda1081b5d7b175f78a94 Mon Sep 17 00:00:00 2001
+From: Valentin Popa <valentin.popa@intel.com>
+Date: Fri, 7 Feb 2014 16:59:58 +0200
+Subject: [PATCH] remove dependence on wayland-scanner flags
+
+weston doesn't make use of wayland-scanner flags,
+it only uses the -native- wayland-scanner for protocol.
+
+Upstream-Status: Pending
+Signed-off-by: Valentin Popa <valentin.popa@intel.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index cce1850..8775eb9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -482,7 +482,7 @@ if test x$wayland_scanner = x; then
+ 	AC_MSG_ERROR([wayland-scanner is needed to compile weston])
+ fi
+ 
+-PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
++#PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
+ AC_PATH_PROG(XMLLINT, xmllint)
+ AC_ARG_WITH([dtddir],
+ 	    AS_HELP_STRING([--with-dtddir],
+-- 
+1.8.3.2
+
diff --git a/meta/recipes-graphics/wayland/weston_1.3.1.bb b/meta/recipes-graphics/wayland/weston_1.4.0.bb
similarity index 89%
rename from meta/recipes-graphics/wayland/weston_1.3.1.bb
rename to meta/recipes-graphics/wayland/weston_1.4.0.bb
index 585de66..5c389a0 100644
--- a/meta/recipes-graphics/wayland/weston_1.3.1.bb
+++ b/meta/recipes-graphics/wayland/weston_1.4.0.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
-           file://weston.desktop"
-SRC_URI[md5sum] = "ffe7c3bc0e7eb39a305cbbea8c7766f3"
-SRC_URI[sha256sum] = "f7141334b141ae1a6435bd03bfdb01b7fb628f39259164f201e7e71c8d815bc7"
+           file://weston.desktop \
+           file://0001-remove-dependence-on-wayland-scanner-flags.patch"
+SRC_URI[md5sum] = "4438d2b1f3c9ba9a4a2b10d89fac6fd0"
+SRC_URI[sha256sum] = "74a2319d98e9cdb1acf24659699719aa89ac268cf549759271e326edc5f9ed64"
 
 
 inherit autotools pkgconfig useradd
@@ -18,18 +19,17 @@ DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland virtual/egl pango"
 
 EXTRA_OECONF = "--enable-setuid-install \
-                --disable-tablet-shell \
                 --disable-xwayland \
                 --enable-simple-clients \
                 --enable-clients \
-                --enable-demo-clients \
+                --enable-demo-clients-install \
                 --disable-simple-egl-clients \
                 --disable-libunwind \
                 --disable-rpi-compositor \
                 --disable-rdp-compositor"
 
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                   "
-- 
1.8.3.2


