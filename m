Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNZNH-0003DL-A6
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 01:17:11 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72146543"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.75])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 16:10:44 -0800
Message-Id: <6ddd2c045b25857b3d2a1540b3773ed9b2389f88.1320709417.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
Subject: [PATCH 07/12] gconf: add upstream GNOME gconf 3.2.3 and drop gconf-dbus
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
X-List-Received-Date: Tue, 08 Nov 2011 00:17:11 -0000

The D-Bus backend has been integrated into upstream GConf so we can
switch to upstream and drop gconf-dbus.

This patch adds a release in the 3.2 series as we disable Gtk+, and
therefore are not impacted by the gtk+3 requirement, and the D-Bus backend
was reportedly unstable before this release.

Furthermore I've aligned some of the metadata with the meta-oe gconf
recipe to hopefully enable them to use a bbappended version of the
core's recipe.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/conf/distro/include/default-providers.inc     |    2 -
 meta/conf/multilib.conf                            |    2 +-
 meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch |   59 ++++++++++++++++++++
 meta/recipes-gnome/gnome/gconf-dbus_705.bb         |   43 --------------
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |   43 ++++++++++++++
 5 files changed, 103 insertions(+), 46 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch
 delete mode 100644 meta/recipes-gnome/gnome/gconf-dbus_705.bb
 create mode 100644 meta/recipes-gnome/gnome/gconf_3.2.3.bb

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index be23d36..afea5e7 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -21,8 +21,6 @@ VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
 #
 PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
 PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
-PREFERRED_PROVIDER_gconf ?= "gconf-dbus"
-PREFERRED_PROVIDER_gconf-native ?= "gconf-dbus-native"
 PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
 PREFERRED_PROVIDER_libgcc ?= "libgcc"
 PREFERRED_PROVIDER_libgcc-nativesdk ?= "libgcc-nativesdk"
diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 5e4b435..de53540 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -103,7 +103,7 @@ BBCLASSEXTEND_append_pn-gcc-cross-initial = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gcc-cross-intermediate = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gcc-cross = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gcc-runtime = " ${MULTILIBS}"
-BBCLASSEXTEND_append_pn-gconf-dbus = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-gconf = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gdbm = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gdb = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-gdk-pixbuf = " ${MULTILIBS}"
diff --git a/meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch b/meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch
new file mode 100644
index 0000000..29181e3
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch
@@ -0,0 +1,59 @@
+This is a hacky way to prevent GConf from trying to build the introspection related pieces.
+Clearly not appropriate for upstream.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Joshua Lock <josh@linux.intel.com>
+
+Index: GConf-3.2.2/gconf/Makefile.am
+===================================================================
+--- GConf-3.2.2.orig/gconf/Makefile.am
++++ GConf-3.2.2/gconf/Makefile.am
+@@ -145,34 +145,6 @@ libgconf_2_la_LDFLAGS = -version-info $(
+ 
+ libgconf_2_la_LIBADD = $(INTLLIBS) $(DEPENDENT_LIBS) $(DEPENDENT_DBUS_LIBS) $(DEPENDENT_ORBIT_LIBS)
+ 
+--include $(INTROSPECTION_MAKEFILE)
+-INTROSPECTION_GIRS =
+-INTROSPECTION_SCANNER_ARGS = --warn-all --add-include-path=$(srcdir)
+-INTROSPECTION_COMPILER_ARGS= --includedir=$(srcdir)
+-
+-if HAVE_INTROSPECTION
+-introspection_files =				\
+-	$(gconfinclude_HEADERS)			\
+-	$(filter-out $(CORBA_SOURCECODE), $(filter %.c,$(libgconf_2_la_SOURCES)))
+-GConf-2.0.gir: libgconf-2.la Makefile
+-GConf_2_0_gir_INCLUDES = GObject-2.0
+-GConf_2_0_gir_CFLAGS = \
+-	$(INCLUDES)
+-GConf_2_0_gir_LIBS = libgconf-2.la
+-GConf_2_0_gir_FILES = $(addprefix $(srcdir)/, $(introspection_files))
+-GConf_2_0_gir_SCANNERFLAGS = --identifier-prefix=GConf --symbol-prefix=gconf --c-include "gconf/gconf.h"
+-GConf_2_0_gir_EXPORT_PACKAGES = gconf-2.0
+-INTROSPECTION_GIRS += GConf-2.0.gir
+-
+-girdir = $(datadir)/gir-1.0/
+-gir_DATA = $(INTROSPECTION_GIRS)
+-
+-typelibsdir = $(libdir)/girepository-1.0/
+-typelibs_DATA = $(INTROSPECTION_GIRS:.gir=.typelib)
+-
+-CLEANFILES += $(gir_DATA) $(typelibs_DATA)
+-endif
+-
+ EXTRA_DIST=GConfX.idl default.path.in org.gnome.GConf.service.in gconfmarshal.list regenerate-enum-header.sh regenerate-enum-footer.sh
+ 
+ default.path: $(srcdir)/default.path.in
+Index: GConf-3.2.2/configure.in
+===================================================================
+--- GConf-3.2.2.orig/configure.in
++++ GConf-3.2.2/configure.in
+@@ -354,8 +354,6 @@ AM_GLIB_GNU_GETTEXT
+ 
+ AC_CHECK_FUNCS(bind_textdomain_codeset)
+ 
+-GOBJECT_INTROSPECTION_CHECK([0.9.5])
+-
+ AC_SUBST(CFLAGS)
+ AC_SUBST(CPPFLAGS)
+ AC_SUBST(LDFLAGS)
diff --git a/meta/recipes-gnome/gnome/gconf-dbus_705.bb b/meta/recipes-gnome/gnome/gconf-dbus_705.bb
deleted file mode 100644
index 52e8a08..0000000
--- a/meta/recipes-gnome/gnome/gconf-dbus_705.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-DESCRIPTION = "Settings daemon using DBUS for communication."
-SECTION = "x11/utils"
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
-
-DEPENDS = "intltool-native virtual/libintl glib-2.0 dbus dbus-glib libxml2 popt gtk-doc-native"
-PROVIDES = "gconf"
-RPROVIDES_${PN} = "gconf"
-RPROVIDES_${PN}-dev = "gconf-dev"
-
-#SRCREV = "705"
-#PV = "2.16.0+svnr${SRCPV}"
-PR = "r2"
-
-# This SVN repo is no longer available use a tarball mirror site until
-# we move to proper gconf recipe.
-#SRC_URI = "svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http"
-SRC_URI = "http://autobuilder.pokylinux.org/sources/trunk_developer.imendio.com_.svn.gconf-dbus_705_.tar.gz"
-
-SRC_URI[md5sum] = "dba8d534b0c6262d24817c842b36369d"
-SRC_URI[sha256sum] = "5552b1884d42d4072a199c93e35a28dc1799f9166baefbf9243394966039e416"
-
-S = "${WORKDIR}/trunk"
-
-inherit pkgconfig autotools
-
-PARALLEL_MAKE = ""
-
-
-EXTRA_OECONF = "--disable-gtk-doc --disable-gtk --enable-shared --disable-static --enable-debug=yes"
-
-
-do_configure_prepend() {
-        touch gtk-doc.make
-}
-
-FILES_${PN} = "${libdir}/GConf-dbus/2/*.so ${libdir}/dbus-1.0 ${sysconfdir} ${datadir}/dbus* ${libdir}/*.so.* ${bindir}/* ${libexecdir}/*"
-FILES_${PN}-dbg += " ${libdir}/GConf-dbus/2/.debug"
-FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd \
-		    ${libdir}/GConf-dbus/2/*.la"
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
new file mode 100644
index 0000000..0e06cb5
--- /dev/null
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "GNOME configuration system"
+SECTION = "x11/gnome"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
+
+DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native polkit"
+
+inherit gnomebase
+
+SRC_URI = "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.tar.bz2;name=archive \
+	   file://nointro.patch"
+
+SRC_URI[archive.md5sum] = "f80329173cd9d134ad07e36002dd2a15"
+SRC_URI[archive.sha256sum] = "52008a82a847527877d9e1e549a351c86cc53cada4733b8a70a1123925d6aff4"
+
+S = "${WORKDIR}/GConf-${PV}"
+
+EXTRA_OECONF = "--disable-gtk-doc --disable-gtk --enable-shared --disable-static --enable-debug=yes --disable-introspection --disable-orbit --with-openldap=no"
+
+do_configure_prepend () {
+	touch gtk-doc.make
+}
+
+do_install_append() {
+	# this directory need to be created to avoid an Error 256 at gdm launch
+	install -d ${D}${sysconfdir}/gconf/gconf.xml.system
+
+	# this stuff is unusable
+	rm ${D}${libdir}/GConf/*/*.*a
+	rm ${D}${libdir}/gio/*/*.*a
+}
+
+RDEPENDS_${PN} += "dbus-x11"
+FILES_${PN} += "${libdir}/GConf/* \
+	        ${libdir}/gio/*/*.so \
+		${datadir}/polkit* \
+	       	${datadir}/dbus-1/services/*.service \
+	       	${datadir}/dbus-1/system-services/*.service \
+	        "
+FILES_${PN}-dbg += "${libdir}/*/*/.debug"
+FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd"
+
+BBCLASSEXTEND = "native"
-- 
1.7.7



