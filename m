Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iW-0003rX-HO
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:49:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:34:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440704"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:34:08 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:25 +0200
Message-Id: <0a47d556f40e643094228fb54e666a3008024aa8.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 13/15] metacity: upgrade to 2.34.13
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
X-List-Received-Date: Mon, 24 Dec 2012 08:49:00 -0000

crosscompile.patch: removed
- schema_bindings binary not generated anymore

remove-yelp-help-rules-var.patch: added
- YELP_HELP_RULES var is not used

[Other changes]
- the 2.34.13 version requires the gsettings-desktop-schemas
(add it to DEPENDS)

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../gnome/metacity/crosscompile.patch              | 62 ----------------------
 .../metacity/remove-yelp-help-rules-var.patch      | 28 ++++++++++
 .../{metacity_2.30.3.bb => metacity_2.34.13.bb}    | 14 ++---
 3 files changed, 35 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/metacity/crosscompile.patch
 create mode 100644 meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch
 rename meta/recipes-gnome/gnome/{metacity_2.30.3.bb => metacity_2.34.13.bb} (56%)

diff --git a/meta/recipes-gnome/gnome/metacity/crosscompile.patch b/meta/recipes-gnome/gnome/metacity/crosscompile.patch
deleted file mode 100644
index 7a1942a..0000000
--- a/meta/recipes-gnome/gnome/metacity/crosscompile.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-This patch is revised version from openembed. It build host native binary
-rather than target binary in cross-compile environment.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: metacity-2.30.3/src/Makefile.am
-===================================================================
---- metacity-2.30.3.orig/src/Makefile.am	2010-09-05 00:09:52.000000000 +0800
-+++ metacity-2.30.3/src/Makefile.am	2010-12-31 11:15:31.000000000 +0800
-@@ -134,11 +134,9 @@
- metacity_theme_viewer_SOURCES=  \
- 	ui/theme-viewer.c
- 
--schema_bindings_SOURCES =       \
--        core/schema-bindings.c			\
--	metacity.schemas.in.in
-+schema_bindings:
-+	@CC_FOR_BUILD@ core/schema-bindings.c -I./include -I../ @CFLAGS_FOR_BUILD@ @LDFLAGS_FOR_BUILD@ -o schema_bindings
- 
--schema_bindings_LDADD = @METACITY_LIBS@
- metacity.schemas.in: schema_bindings ${srcdir}/metacity.schemas.in.in
- 	@echo Generating keybinding schemas... ${srcdir}/metacity.schemas.in.in
- 	${builddir}/schema_bindings ${srcdir}/metacity.schemas.in.in ${builddir}/metacity.schemas.in
-Index: metacity-2.30.3/configure.in
-===================================================================
---- metacity-2.30.3.orig/configure.in	2010-09-22 22:14:06.000000000 +0800
-+++ metacity-2.30.3/configure.in	2010-12-31 11:15:31.000000000 +0800
-@@ -31,6 +31,32 @@
- AC_LIBTOOL_WIN32_DLL
- AM_PROG_LIBTOOL
- 
-+if test x"$CC_FOR_BUILD" = x; then
-+	if test x"$cross_compiling" = xyes; then
-+	       AC_CHECK_PROGS(CC_FOR_BUILD, gcc cc)
-+	else
-+	       CC_FOR_BUILD="$CC"
-+	fi
-+fi
-+AC_SUBST([CC_FOR_BUILD])
-+if test x"$CFLAGS_FOR_BUILD" = x; then
-+	if test x"$cross_compiling" = xyes; then
-+	       echo boo!
-+	else
-+	       CFLAGS_FOR_BUILD="$CFLAGS"
-+	fi
-+fi
-+AC_SUBST([CFLAGS_FOR_BUILD])
-+if test x"$LDFLAGS_FOR_BUILD" = x; then
-+	if test x"$cross_compiling" = xyes; then
-+	       echo boo!
-+	else
-+	       LDFLAGS_FOR_BUILD="$LDFLAGS"
-+	fi
-+fi
-+AC_SUBST([LDFLAGS_FOR_BUILD])
-+
-+
- #### Integer sizes 
- 
- AC_CHECK_SIZEOF(char)
diff --git a/meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch b/meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch
new file mode 100644
index 0000000..1970e9a
--- /dev/null
+++ b/meta/recipes-gnome/gnome/metacity/remove-yelp-help-rules-var.patch
@@ -0,0 +1,28 @@
+Remove unused variable (YELP_HELP_RULES)
+
+Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: metacity-2.34.13/doc/creating_themes/Makefile.am
+===================================================================
+--- metacity-2.34.13.orig/doc/creating_themes/Makefile.am
++++ metacity-2.34.13/doc/creating_themes/Makefile.am
+@@ -1,6 +1,5 @@
+ ### This part of Makefile.am can be customized by you.
+ 
+-@YELP_HELP_RULES@
+ 
+ # The name of the directory in /usr/share/gnome/help/, 
+ # and the name of the main .xml file:
+Index: metacity-2.34.13/doc/creating_themes/Makefile.in
+===================================================================
+--- metacity-2.34.13.orig/doc/creating_themes/Makefile.in
++++ metacity-2.34.13/doc/creating_themes/Makefile.in
+@@ -455,7 +455,6 @@ uninstall-am:
+ 	mostlyclean-libtool pdf pdf-am ps ps-am uninstall uninstall-am
+ 
+ 
+-@YELP_HELP_RULES@
+ 
+ # Tell versions [3.59,3.63) of GNU make to not export all variables.
+ # Otherwise a system limit (for SysV at least) may be exceeded.
diff --git a/meta/recipes-gnome/gnome/metacity_2.30.3.bb b/meta/recipes-gnome/gnome/metacity_2.34.13.bb
similarity index 56%
rename from meta/recipes-gnome/gnome/metacity_2.30.3.bb
rename to meta/recipes-gnome/gnome/metacity_2.34.13.bb
index 5b996d2..3605201 100644
--- a/meta/recipes-gnome/gnome/metacity_2.30.3.bb
+++ b/meta/recipes-gnome/gnome/metacity_2.34.13.bb
@@ -4,14 +4,16 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/include/main.h;endline=24;md5=c2242df552c880280315989bab626b90"
 
-DEPENDS = "startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils"
-PR = "r5"
+DEPENDS = "gsettings-desktop-schemas startup-notification gtk+ gconf gdk-pixbuf-native libcanberra gnome-doc-utils"
+PR = "r0"
 
 inherit gnome update-alternatives
 
-SRC_URI += "file://crosscompile.patch"
-SRC_URI[archive.md5sum] = "553784f376d96b902e19ff437cd5b339"
-SRC_URI[archive.sha256sum] = "08f887018fa5e447cf184d03bae3fe2c05fdb7583bed6768e3b4d66392fc18dd"
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI += "file://remove-yelp-help-rules-var.patch"
+SRC_URI[archive.md5sum] = "6d89b71672d4fa49fc87f83d610d0ef6"
+SRC_URI[archive.sha256sum] = "8cf4dbf0da0a6f36357ce7db7f829ec685908a7792453c662fb8184572b91075"
 
 ALTERNATIVE_${PN} = "x-window-manager"
 ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/metacity"
@@ -23,8 +25,6 @@ EXTRA_OECONF += "--disable-verbose \
 do_configure_prepend() {
 	sed -i -e 's:$ZENITY:$NOZENITY:g' -e 's:-Werror::g' ${S}/configure.in
 }
-CFLAGS_FOR_BUILD += "-I${STAGING_LIBDIR_NATIVE}/glib-2.0/include -I${STAGING_INCDIR_NATIVE}/glib-2.0 -I${STAGING_INCDIR_NATIVE}/glib-2.0/include -I${STAGING_INCDIR_NATIVE}"
-LDFLAGS_FOR_BUILD += "-L${STAGING_LIBDIR_NATIVE} -lglib-2.0"
 
 FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
 
-- 
1.7.11.7



