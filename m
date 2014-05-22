Return-Path: <ticotimo@gmail.com>
Received: from mail-pa0-f44.google.com (unknown [209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id A5C8D6B7A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 16:00:12 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id ld10so2664047pab.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mFE5X0RQ4o/qgAJoDMU2UzCo3vtjRPCAckGhGTyVOP8=;
	b=tlVF4s+Jhx4WTo20jleu+uEEZUJhLRC2ouVdzOMJQcgknDDW66M2z5qWgDiujw58RL
	9KakqJbZ512MbbxuYrsEyRNDvyRlvUj5lJN+sYTNJJDDuF5d6BdCI3QVd2tIErEOvYAb
	g0FtcUnCp2wWVaArSxegLpWnMxCVBKRDLcgIDASb5DTw3aw/7QasFRMqdmZT/7uJajpD
	9fQ6yvDDfALMQdO4iOqe/r8jfIMfXBhA2GY4AFXH09XX33ao9ao7AsHK9QXjovfxgTbq
	MjhVGSKdRgGhFS66Zq/SWTcFqe8q35d+zKy+4GuU0wZg1zkNs9iXmI18NieFzXxU8c8b
	MZ9Q==
X-Received: by 10.68.215.68 with SMTP id og4mr68396629pbc.112.1400774413232;
	Thu, 22 May 2014 09:00:13 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id xz7sm978867pac.3.2014.05.22.09.00.12
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Thu, 22 May 2014 09:00:12 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 May 2014 09:02:20 -0700
Message-Id: <1400774540-4405-3-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1400774540-4405-1-git-send-email-ticotimo@gmail.com>
References: <1400774540-4405-1-git-send-email-ticotimo@gmail.com>
Subject: [RFC/RFT 2/2] weston: upgrade to 1.5.0
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
X-List-Received-Date: Thu, 22 May 2014 16:00:13 -0000

From: Tim Orling <TicoTimo@gmail.com>

* replace 0001-remove-dependence-on-wayland-scanner-flags.patch with
  disable-wayland-scanner-pkg-check.patch
* add make-lcms-configureable.patch (WIP... needs work)
  = fix for JaMa test-dependencies

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 ...emove-dependence-on-wayland-scanner-flags.patch | 30 ----------------------
 .../weston/disable-wayland-scanner-pkg-check.patch | 13 ++++++++++
 .../wayland/weston/make-lcms-configurable.patch    | 22 ++++++++++++++++
 .../wayland/{weston_1.4.0.bb => weston_1.5.0.bb}   | 13 ++++++----
 4 files changed, 43 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch
 rename meta/recipes-graphics/wayland/{weston_1.4.0.bb => weston_1.5.0.bb} (88%)

diff --git a/meta/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch b/meta/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch
deleted file mode 100644
index 14606c8..0000000
--- a/meta/recipes-graphics/wayland/weston/0001-remove-dependence-on-wayland-scanner-flags.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a0335393ddde2228c84eda1081b5d7b175f78a94 Mon Sep 17 00:00:00 2001
-From: Valentin Popa <valentin.popa@intel.com>
-Date: Fri, 7 Feb 2014 16:59:58 +0200
-Subject: [PATCH] remove dependence on wayland-scanner flags
-
-weston doesn't make use of wayland-scanner flags,
-it only uses the -native- wayland-scanner for protocol.
-
-Upstream-Status: Pending
-Signed-off-by: Valentin Popa <valentin.popa@intel.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index cce1850..8775eb9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -482,7 +482,7 @@ if test x$wayland_scanner = x; then
- 	AC_MSG_ERROR([wayland-scanner is needed to compile weston])
- fi
- 
--PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
-+#PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
- AC_PATH_PROG(XMLLINT, xmllint)
- AC_ARG_WITH([dtddir],
- 	    AS_HELP_STRING([--with-dtddir],
--- 
-1.8.3.2
-
diff --git a/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch b/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
new file mode 100644
index 0000000..062da5c
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
@@ -0,0 +1,13 @@
+Index: weston-1.5.0/configure.ac
+===================================================================
+--- weston-1.5.0.orig/configure.ac
++++ weston-1.5.0/configure.ac
+@@ -503,7 +503,7 @@ if test x$wayland_scanner = x; then
+ 	AC_MSG_ERROR([wayland-scanner is needed to compile weston])
+ fi
+ 
+-PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
++#PKG_CHECK_MODULES(WAYLAND_SCANNER, wayland-scanner)
+ 
+ AC_CONFIG_FILES([Makefile src/version.h src/weston.pc])
+ 
diff --git a/meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch b/meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch
new file mode 100644
index 0000000..817ac70
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/make-lcms-configurable.patch
@@ -0,0 +1,22 @@
+Index: weston-1.5.0/configure.ac
+===================================================================
+--- weston-1.5.0.orig/configure.ac
++++ weston-1.5.0/configure.ac
+@@ -491,8 +491,16 @@ AC_ARG_ENABLE(demo-clients-install,
+ 			     enable_demo_clients_install=no)
+ AM_CONDITIONAL(INSTALL_DEMO_CLIENTS, [test "x$enable_demo_clients_install" = "xyes"])
+ 
++AC_ARG_ENABLE(lcms,
++              AS_HELP_STRING([--disable-lcms],
++                             [disable lcms support]),,
++              enable_lcms=yes)
++
++AS_IF([test "x$enable_lcms" != "no"], [
+ PKG_CHECK_MODULES(LCMS, lcms2,
+-                  [have_lcms=yes], [have_lcms=no])
++                  [have_lcms=yes], [have_lcms=no])],
++                  [have_lcms=no])
++
+ if test "x$have_lcms" = xyes; then
+        AC_DEFINE(HAVE_LCMS, 1, [Have lcms support])
+ fi
diff --git a/meta/recipes-graphics/wayland/weston_1.4.0.bb b/meta/recipes-graphics/wayland/weston_1.5.0.bb
similarity index 88%
rename from meta/recipes-graphics/wayland/weston_1.4.0.bb
rename to meta/recipes-graphics/wayland/weston_1.5.0.bb
index afdc49c..f6ae8c4 100644
--- a/meta/recipes-graphics/wayland/weston_1.4.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.5.0.bb
@@ -8,10 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
-           file://0001-remove-dependence-on-wayland-scanner-flags.patch"
-SRC_URI[md5sum] = "4438d2b1f3c9ba9a4a2b10d89fac6fd0"
-SRC_URI[sha256sum] = "74a2319d98e9cdb1acf24659699719aa89ac268cf549759271e326edc5f9ed64"
-
+           file://disable-wayland-scanner-pkg-check.patch \
+           file://make-lcms-configurable.patch"
+SRC_URI[md5sum] = "8eb40d230efc2411f083c20656534780"
+SRC_URI[sha256sum] = "06388ba04ac79aa72d685cc1a8e646ddb2b8cfe11fcc742294f9addac48b7684"
 
 inherit autotools pkgconfig useradd
 
@@ -25,7 +25,8 @@ EXTRA_OECONF = "--enable-setuid-install \
                 --enable-demo-clients-install \
                 --disable-libunwind \
                 --disable-rpi-compositor \
-                --disable-rdp-compositor"
+                --disable-rdp-compositor \
+                --disable-lcms"
 
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
@@ -53,6 +54,8 @@ PACKAGECONFIG[vaapi] = "--enable-vaapi-recorder,--disable-vaapi-recorder,libva"
 PACKAGECONFIG[egl] = "--enable-egl --enable-simple-egl-clients,--disable-egl --disable-simple-egl-clients,virtual/egl"
 # Weston with cairo glesv2 support
 PACKAGECONFIG[cairo-glesv2] = "--with-cairo-glesv2,--with-cairo=image,cairo"
+# Weston with lcms support
+PACKAGECONFIG[lcms] = "--enable-lcms,--disable-lcms,lcms"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-- 
1.8.3.2


