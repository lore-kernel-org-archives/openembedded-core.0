Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R8YC2-0006Rc-1j
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 15:59:30 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Sep 2011 06:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,449,1312182000"; d="scan'208";a="67904500"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2011 06:53:45 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Sep 2011 21:49:26 +0800
Message-Id: <31e536090650075683c2a9e9e9cac0563aa0968e.1317131040.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317131040.git.edwin.zhai@intel.com>
References: <cover.1317131040.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1317131040.git.edwin.zhai@intel.com>
References: <cover.1317131040.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] gnome-vfs: remove this obsolete recipe completely in favor of GIO/GVFS
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
X-List-Received-Date: Tue, 27 Sep 2011 13:59:30 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Remove oprofileui/libgsf's dependence on gnome-vfs, delete table that is out of
maintenance in clutter.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../recipes-gnome/libgsf/libgsf_1.14.5.bb          |    8 ++-
 meta-demoapps/recipes-graphics/clutter/table.inc   |   13 -----
 .../recipes-graphics/clutter/table/fixes.patch     |   16 ------
 .../recipes-graphics/clutter/table_git.bb          |   15 ------
 .../conf/distro/include/distro_tracking_fields.inc |   11 ----
 meta/conf/multilib.conf                            |    1 -
 .../gnome/gnome-vfs-2.24.4/gconftool-lossage.patch |   13 -----
 .../gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch   |   53 --------------------
 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb       |   50 ------------------
 meta/recipes-kernel/oprofile/oprofileui.inc        |    2 +-
 10 files changed, 7 insertions(+), 175 deletions(-)
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/table.inc
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/table/fixes.patch
 delete mode 100644 meta-demoapps/recipes-graphics/clutter/table_git.bb
 delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb

diff --git a/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb b/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb
index 3ac7d6e..bf1b1ad 100644
--- a/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb
+++ b/meta-demoapps/recipes-gnome/libgsf/libgsf_1.14.5.bb
@@ -1,10 +1,14 @@
 DESCRIPTION = "GNOME Structured File Library"
 LICENSE = "GPL"
 SECTION = "libs"
-PR = "r1"
+PR = "r2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
+                    file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63 \
+                    file://gsf/gsf.h;endline=25;md5=15cf6d31ad023167779ab5f0bbb76f49"
 
 DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
-RDEPENDS_${PN} = "gconf gnome-vfs"
+RDEPENDS_${PN} = "gconf"
 
 
 PACKAGES =+ "${PN}-gnome ${PN}-gnome-dev "
diff --git a/meta-demoapps/recipes-graphics/clutter/table.inc b/meta-demoapps/recipes-graphics/clutter/table.inc
deleted file mode 100644
index 937ad56..0000000
--- a/meta-demoapps/recipes-graphics/clutter/table.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Table Clutter Demo"
-HOMEPAGE = "http://www.clutter-project.org/"
-LICENSE = "LGPLv2.1 & GPLv2"
-
-DEPENDS = "clutter-gst-1.4 gnome-vfs"
-
-inherit autotools pkgconfig
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ${S}/table ${D}${bindir}/table
-}
-
diff --git a/meta-demoapps/recipes-graphics/clutter/table/fixes.patch b/meta-demoapps/recipes-graphics/clutter/table/fixes.patch
deleted file mode 100644
index 323bf13..0000000
--- a/meta-demoapps/recipes-graphics/clutter/table/fixes.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-Index: table/Makefile
-===================================================================
---- table.orig/Makefile	2007-07-10 13:24:18.000000000 +0100
-+++ table/Makefile	2007-07-10 13:28:10.000000000 +0100
-@@ -8,7 +8,7 @@ all: table
- 
- 
- table: table.o clutter-dominatrix.o clutter-video-player.o
--	$(CC) -g -Wall $(CFLAGS) -o $@ table.o clutter-dominatrix.o clutter-video-player.o $(LIBS)
-+	$(CC) -g -Wall $(CFLAGS) $(LDFLAGS) -o $@ table.o clutter-dominatrix.o clutter-video-player.o $(LIBS)
- 
- clean:
- 	rm -fr *.o table
-\ No newline at end of file
diff --git a/meta-demoapps/recipes-graphics/clutter/table_git.bb b/meta-demoapps/recipes-graphics/clutter/table_git.bb
deleted file mode 100644
index d0ae184..0000000
--- a/meta-demoapps/recipes-graphics/clutter/table_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require table.inc
-
-LIC_FILES_CHKSUM = "file://fluttr/COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://script-viewer/COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-SRCREV = "4b267533ce16656cba4104fc39dc12709c1bdddf"
-PV = "0.3.0+git${SRCPV}"
-PR = "r1"
-
-SRC_URI = "git://git.clutter-project.org/toys.git;protocol=git \
-           file://fixes.patch;patch=1"
-
-S = "${WORKDIR}/git/table"
-
-
diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index c1f15e1..c08a1c8 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -4609,17 +4609,6 @@ RECIPE_COMMENTS_pn-libx11-trim = ""
 RECIPE_LAST_UPDATE_pn-libx11-trim = "Jul 9, 2010"
 RECIPE_MAINTAINER_pn-libx11-trim = "Dexuan Cui <dexuan.cui@intel.com>"
 
-RECIPE_STATUS_pn-gnome-vfs = "green"
-RECIPE_DEPENDENCY_CHECK_pn-gnome-vfs = "not done"
-RECIPE_LATEST_VERSION_pn-gnome-vfs = "2.24.4"
-RECIPE_NO_OF_PATCHES_pn-gnome-vfs = "2"
-RECIPE_INTEL_SECTION_pn-gnome-vfs = "gnome/lib"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gnome-vfs = "6 months"
-RECIPE_LATEST_RELEASE_DATE_pn-gnome-vfs = "Sep 28, 2010"
-RECIPE_COMMENTS_pn-gnome-vfs = ""
-RECIPE_LAST_UPDATE_pn-gnome-vfs = "Nov 24, 2010"
-RECIPE_MAINTAINER_pn-gnome-vfs = "Dexuan Cui <dexuan.cui@intel.com>"
-
 RECIPE_STATUS_pn-xcb-util = "green"
 RECIPE_DEPENDENCY_CHECK_pn-xcb-util = "not done"
 RECIPE_LATEST_VERSION_pn-xcb-util = "0.3.8"
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 3133bf1..db2f6f5 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -118,7 +118,6 @@ BBCLASSEXTEND_append_pn-gnome-doc-utils = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gnome-keyring = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gnome-mime-data = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gnome-mime-data = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-gnome-vfs = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gnutls = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-grep = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-groff = " ${MULTILIBS}"
diff --git a/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch b/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch
deleted file mode 100644
index 0f52136..0000000
--- a/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gconftool-lossage.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
---- gnome-vfs-2.6.0/configure.in~	2004-03-22 12:36:23.000000000 +0000
-+++ gnome-vfs-2.6.0/configure.in	2004-06-07 16:04:34.000000000 +0100
-@@ -154,7 +154,7 @@
- AC_PATH_PROG(GCONFTOOL, gconftool-2, no)
- 
- if test x"$GCONFTOOL" = xno; then
--  AC_MSG_ERROR([gconftool-2 executable not found in your path - should be installed with GConf])
-+  AC_MSG_WARN([gconftool-2 executable not found in your path - should be installed with GConf])
- fi
- 
- AM_GCONF_SOURCE_2
diff --git a/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch b/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
deleted file mode 100644
index dabec32..0000000
--- a/meta/recipes-gnome/gnome/gnome-vfs-2.24.4/gnome-vfs-no-kerberos.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-removes kerberos completely to avoid conflicts with installed kerberos
---- configure.in.orig	2007-01-05 19:42:26.418541610 +0200
-+++ configure.in	2007-01-05 19:42:56.604261797 +0200
-@@ -436,47 +436,6 @@
- ])
- AM_CONDITIONAL(HAVE_CDDA, test $have_cdda = yes)
- AC_SUBST(CDDA_LIBS)
--
--dnl GSSAPI
--dnl Check for Kerberos installation
--have_gssapi=no
--AC_PATH_PROG([KRB5_CONFIG], krb5-config, none, $PATH:/usr/kerberos/bin)
--					   
--if test "x$KRB5_CONFIG" != "xnone"; then
--   GSSAPI_LIBS="`${KRB5_CONFIG} --libs gssapi`"
--   GSSAPI_CFLAGS="`${KRB5_CONFIG} --cflags gssapi`"
--   
--   saved_CPPFLAGS="$CPPFLAGS"
--   saved_LIBS="$LIBS"
--   LIBS="$LIBS $GSSAPI_LIBS"
--   CPPFLAGS="$CPPFLAGS $GSSAPI_CFLAGS"
--   # MIT and Heimdal put gssapi.h in different places
--   AC_CHECK_HEADERS(gssapi/gssapi.h gssapi.h, [
--       AC_CHECK_FUNCS(gss_init_sec_context, [
--           AC_MSG_NOTICE([GSSAPI authentication support enabled])
--           AC_DEFINE(HAVE_GSSAPI, 1, [Define if GSSAPI support is enabled])
--           AC_CHECK_HEADERS(gssapi/gssapi_generic.h)
--		 have_gssapi=yes
--	 
--       # MIT Kerberos lacks GSS_C_NT_HOSTBASED_SERVICE
--       AC_CHECK_DECL([GSS_C_NT_HOSTBASED_SERVICE],,
--          [AC_DEFINE([GSS_C_NT_HOSTBASED_SERVICE], gss_nt_service_name, 
--             [Define if GSS_C_NT_HOSTBASED_SERVICE is not defined otherwise])
--		], [
--		    #ifdef HAVE_GSSAPI_GSSAPI_H
--		    #include <gssapi/gssapi.h>
--		    #else	   
--		    #include <gssapi.h>
--		    #endif
--		])
--	  ])
--     break
--   ])
--   LIBS="$saved_LIBS" 
--   CPPFLAGS="$saved_CPPFLAGS" 
--fi   
--AC_SUBST(GSSAPI_LIBS)
--AC_SUBST(GSSAPI_CFLAGS)
- 	   
- dnl ******************************
- dnl http-method (neon checks)
diff --git a/meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb b/meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb
deleted file mode 100644
index c09c8be..0000000
--- a/meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-DESCRIPTION = "a userspace virtual filesystem"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://libgnomevfs/gnome-vfs.h;endline=25;md5=17071e69707a8f42887d88413f2623cb \
-                    file://programs/gnomevfs-ls.c;endline=23;md5=678a2e8bedaef5818ccabe633840196b \
-                    file://daemon/vfs-daemon.c;endline=21;md5=5f2c61553fb16abb07fc9498ca03fe1f \
-                    file://modules/cdda-cddb.h;endline=22;md5=20ed324ca64907c366ecd7f22b8e0c54"
-
-DEPENDS = "libxml2 gconf dbus bzip2 gnome-mime-data zlib"
-RRECOMMENDS_${PN} = "gnome-vfs-plugin-file shared-mime-info"
-# Some legacy packages will require gnome-mime-data to be installed, but use of
-# it is deprecated.
-PR = "r0"
-
-inherit gnome
-
-# This is to provide compatibility with the gnome-vfs DBus fork
-RPROVIDES = "gnome-vfs-plugin-dbus"
-
-SRC_URI += "file://gconftool-lossage.patch \
-	    file://gnome-vfs-no-kerberos.patch;striplevel=0"
-
-SRC_URI[archive.md5sum] = "a05fab03eeef10a47dd156b758982f2e"
-SRC_URI[archive.sha256sum] = "62de64b5b804eb04104ff98fcd6a8b7276d510a49fbd9c0feb568f8996444faa"
-
-EXTRA_OECONF = " --disable-hal \
-                 --disable-openssl \
-                 --disable-samba \
-                 ac_cv_lib_acl_acl_get_file=no \
-                 ac_cv_lib_sec_acl=no \
-                 gvfs_cv_HAVE_SOLARIS_ACLS=no \
-                 gvfs_cv_HAVE_POSIX_ACLS=no \
-		 "
-
-FILES_${PN} += " ${libdir}/vfs ${datadir}/dbus-1/services"
-FILES_${PN}-dbg += " ${libdir}/gnome-vfs-2.0/modules/.debug"
-FILES_${PN}-dev += " ${libdir}/gnome-vfs-2.0/include"
-FILES_${PN}-doc += " ${datadir}/gtk-doc"
-
-PACKAGES_DYNAMIC = "gnome-vfs-plugin-*"
-
-python populate_packages_prepend () {
-	print bb.data.getVar('FILES_gnome-vfs', d, 1)
-
-	plugindir = bb.data.expand('${libdir}/gnome-vfs-2.0/modules/', d)
-	do_split_packages(d, plugindir, '^lib(.*)\.so$', 'gnome-vfs-plugin-%s', 'GNOME VFS plugin for %s')
-}
diff --git a/meta/recipes-kernel/oprofile/oprofileui.inc b/meta/recipes-kernel/oprofile/oprofileui.inc
index 5170357..ab14c38 100644
--- a/meta/recipes-kernel/oprofile/oprofileui.inc
+++ b/meta/recipes-kernel/oprofile/oprofileui.inc
@@ -8,7 +8,7 @@ SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "glib-2.0 gtk+ libglade gnome-vfs libxml2 avahi-ui gconf"
+DEPENDS = "glib-2.0 gtk+ libglade libxml2 avahi-ui gconf"
 
 inherit autotools pkgconfig gtk-icon-cache
 
-- 
1.7.1



