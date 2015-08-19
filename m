Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9F676A45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:40:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 19 Aug 2015 06:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,710,1432623600"; d="scan'208";a="771742411"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2015 06:40:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 16:41:01 +0300
Message-Id: <a41b916a4a0e489c31905d026376cf54465a9107.1439991562.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/22] epiphany: add a recipe from meta-gnome
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
X-List-Received-Date: Wed, 19 Aug 2015 13:40:05 -0000

Epiphany is replacing midori as the browser in oe-core recipe set
and poky distribution.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.16.3.bb     | 24 ++++++++++++++++
 .../0001-yelp.m4-drop-the-check-for-itstool.patch  | 33 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
 create mode 100644 meta/recipes-gnome/epiphany/files/0001-yelp.m4-drop-the-check-for-itstool.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb b/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
new file mode 100644
index 0000000..2681ab5
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/epiphany_3.16.3.bb
@@ -0,0 +1,24 @@
+SUMMARY = "WebKit based web browser for GNOME"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr libwnck3 \
+	   gsettings-desktop-schemas gnome-desktop3"
+
+inherit gnomebase gsettings
+SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
+SRC_URI[archive.md5sum] = "3296af4532b8019775f4b40d21a341ae"
+SRC_URI[archive.sha256sum] = "d527f1770779ec22d955aeb13b148a846a26144e433ff0480c981af80e2390b1"
+
+EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO}"
+
+do_configure_prepend() {
+    touch ${S}/gnome-doc-utils.make
+    sed -i -e s:help::g ${S}/Makefile.am
+}
+
+FILES_${PN} += "${datadir}/appdata ${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers"
+FILES_${PN}-dbg += "${libdir}/epiphany/*/web-extensions/.debug/libephywebextension.so"
+RDEPENDS_${PN} = "iso-codes"
+RRECOMMENDS_${PN} = "ca-certificates"
+
diff --git a/meta/recipes-gnome/epiphany/files/0001-yelp.m4-drop-the-check-for-itstool.patch b/meta/recipes-gnome/epiphany/files/0001-yelp.m4-drop-the-check-for-itstool.patch
new file mode 100644
index 0000000..2585d7f
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/0001-yelp.m4-drop-the-check-for-itstool.patch
@@ -0,0 +1,33 @@
+From 30f03a256efe375a4d5c3a24bf4168ebf380e3ab Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 30 Jul 2015 15:13:23 +0300
+Subject: [PATCH] yelp.m4: drop the check for itstool
+
+It isn't used for anything during build, so there's no need to provide
+it as a recipe.
+
+Upstream-Status: Inappropriate [tarball-specific issue]
+---
+ m4/yelp.m4 | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/m4/yelp.m4 b/m4/yelp.m4
+index 5db847f..1b6ede4 100644
+--- a/m4/yelp.m4
++++ b/m4/yelp.m4
+@@ -27,12 +27,6 @@ AC_ARG_WITH([help-dir],
+ HELP_DIR="$with_help_dir"
+ AC_SUBST(HELP_DIR)
+ 
+-AC_ARG_VAR([ITSTOOL], [Path to the `itstool` command])
+-AC_CHECK_PROG([ITSTOOL], [itstool], [itstool])
+-if test x"$ITSTOOL" = x; then
+-  AC_MSG_ERROR([itstool not found])
+-fi
+-
+ AC_ARG_VAR([XMLLINT], [Path to the `xmllint` command])
+ AC_CHECK_PROG([XMLLINT], [xmllint], [xmllint])
+ if test x"$XMLLINT" = x; then
+-- 
+2.1.4
+
-- 
2.1.4


