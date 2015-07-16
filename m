Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 424DB607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 23:01:27 +0000 (UTC)
Received: by wgxm20 with SMTP id m20so69476309wgx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 16:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ECEDs+QP61rt1A1U1hs6N8EaAE85O6TU11PkZugvy3Q=;
	b=ZGikXIQSYFYSYx/6lI8ymKkcHE31SIB/bCdRQi292RwBwewgzC7JtWTYiDmnjnd6y0
	9bY8lIxsifLD16OK6KT3Qc/RyLMEmUBGK50xVTh8mJul/SUbvNWA3exVYJqobSLs7Y15
	IPM8DPSAUXNN134Rw6YNy2zZmSQiTkCCH54KhkwtuaRhcjdmX17bpSgcj1eCtNwWZDez
	WvAzUjrXdad2dEIGiiG3W0ahwz8WzyUftTXKuHRmRWdvUq8jHNzqpTsRXrr1jdfZguTL
	bGyZqAOr/Cx/cW65OijK+9qBB2QBZmzmlz4CGSFvDF5A2GLijM/IFgREUQqBxNJKoRiF
	BIfQ==
X-Gm-Message-State: ALoCoQkyQaL2o4XbagiSmB5wQ67tDTZZiRUIOUF+mkMrLhvb2I7+R7fNJnSrwyxxl8lyvX+VkaKe
X-Received: by 10.194.5.103 with SMTP id r7mr22906986wjr.47.1437087687829;
	Thu, 16 Jul 2015 16:01:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	gb16sm5516417wic.5.2015.07.16.16.01.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jul 2015 16:01:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2015 23:55:46 +0100
Message-Id: <1437087346-26020-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gnome-icon-theme: clean up icon-naming search
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
X-List-Received-Date: Thu, 16 Jul 2015 23:01:31 -0000

Previous this recipe added an argument to specify where the icon-name-mapping
binary is installed, to override a failing pkg-config call (as target pkg-config
won't find native .pc files), and munged libexecdir as it likely contains PN.

This is all very complicated and we have a native pkg-config binary now, so just
use pkg-config-native for that section of configure.ac.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gnome/gnome-icon-theme/iconpath-option.patch   | 49 ----------------------
 .../gnome/gnome-icon-theme/pkgconfig-native.patch  | 28 +++++++++++++
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |  4 +-
 3 files changed, 29 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-icon-theme/iconpath-option.patch
 create mode 100644 meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme/iconpath-option.patch b/meta/recipes-gnome/gnome/gnome-icon-theme/iconpath-option.patch
deleted file mode 100644
index f840fca..0000000
--- a/meta/recipes-gnome/gnome/gnome-icon-theme/iconpath-option.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Version of the patch of the same name from sato-icon-theme JL - 20/10/10
-"
-pkg-config will only search the target sysroot and we want the native script. This 
-patch adds an option to allow the path to the tool to be specified.
-
-RP - 12/8/10"
-
-Upstream-Status: Pending
-
-Index: gnome-icon-theme-2.31.0/configure.ac
-===================================================================
---- gnome-icon-theme-2.31.0.orig/configure.ac	2010-12-01 11:00:22.000000000 +0800
-+++ gnome-icon-theme-2.31.0/configure.ac	2010-12-01 11:02:16.000000000 +0800
-@@ -38,18 +38,24 @@
- ICONMAP="true"
- if test "x$enable_mapping" != "xno"; then
-    UTILS_REQUIRED=0.8.7
-+   PKG_PROG_PKG_CONFIG()
- 
--   AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
--   PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED,
--                    have_utils=yes, have_utils=no)
--   if test "x$have_utils" = "xyes"; then
--      UTILS_PATH="`$PKG_CONFIG --variable=program_path icon-naming-utils`"
--      ICONMAP="$UTILS_PATH/icon-name-mapping"
--      AC_MSG_RESULT([yes])
--   else
--      AC_MSG_RESULT([no])
--      AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build
--                    and install gnome-icon-theme])
-+   AC_ARG_WITH(iconmap,
-+   	    AC_HELP_STRING([--with-iconmap=<dir>], [The location of the icon-name-mapping script to use]),
-+   	    ICONMAP=$withval, ICONMAP="")
-+   if test "x$ICONMAP" = "x"; then
-+      AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
-+      PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED,
-+      		    have_utils=yes, have_utils=no)
-+      if test "x$have_utils" = "xyes"; then
-+         UTILS_PATH="`$PKG_CONFIG --variable=program_path icon-naming-utils`"
-+         ICONMAP="$UTILS_PATH/icon-name-mapping"
-+
-+         AC_MSG_RESULT([yes])
-+      else
-+         AC_MSG_RESULT([no])
-+         AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build and install sato-icon-theme"])
-+      fi
-    fi
- else
-    ICONMAP="false"
diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch b/meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch
new file mode 100644
index 0000000..6139eab
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme/pkgconfig-native.patch
@@ -0,0 +1,28 @@
+icon-naming-utils is a native dependency so we need to use the native pkg-config
+to find it.  Simply perform the old switcheroonie on $PKG_CONFIG so
+pkg-config-native is used temporarily.
+
+Upstream-Status: Inappropriate (OE-specific)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 6074f2c..3d38e49 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -40,6 +40,8 @@ if test "x$enable_mapping" != "xno"; then
+    UTILS_REQUIRED=0.8.7
+ 
+    AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
++   save_PKG_CONFIG=$PKG_CONFIG
++   PKG_CONFIG=pkg-config-native
+    PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED,
+                     have_utils=yes, have_utils=no)
+    if test "x$have_utils" = "xyes"; then
+@@ -51,6 +53,7 @@ if test "x$enable_mapping" != "xno"; then
+       AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build
+                     and install gnome-icon-theme])
+    fi
++   PKG_CONFIG=save_PKG_CONFIG
+ else
+    ICONMAP="false"
+ fi
diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index df117ae..a6a3afa 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -13,12 +13,10 @@ DEPENDS = "icon-naming-utils-native intltool-native libxml-simple-perl-native"
 inherit allarch autotools perlnative gtk-icon-cache pkgconfig gettext
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
-           file://iconpath-option.patch"
+           file://pkgconfig-native.patch"
 
 SRC_URI[md5sum] = "8e727703343d4c18c73c79dd2009f8ed"
 SRC_URI[sha256sum] = "ea7e05b77ead159379392b3b275ca0c9cbacd7d936014e447cc7c5e27a767982"
 
-EXTRA_OECONF = "--with-iconmap=${@d.getVar('STAGING_LIBEXECDIR_NATIVE', True).replace('gnome-icon-theme', 'icon-naming-utils')}/icon-name-mapping"
-
 FILES_${PN} += "${datadir}/*"
 RRECOMMENDS_${PN} += "librsvg-gtk"
-- 
2.1.4


