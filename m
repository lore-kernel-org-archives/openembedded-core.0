Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sujd3-0004NI-Pg for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:26:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RCFILG005950
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:15:18 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05276-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:15:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6RCF7Qe005941
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 13:15:11 +0100
Message-ID: <1343391306.9574.130.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 13:15:06 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] gconf: Clean up introspection disabling by using gobject-introspection-stub
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
X-List-Received-Date: Fri, 27 Jul 2012 12:26:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch b/meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch
deleted file mode 100644
index 29181e3..0000000
--- a/meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch
+++ b/dev/null
@@ -1,59 +0,0 @@
-This is a hacky way to prevent GConf from trying to build the introspection related pieces.
-Clearly not appropriate for upstream.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Joshua Lock <josh@linux.intel.com>
-
-Index: GConf-3.2.2/gconf/Makefile.am
-===================================================================
---- GConf-3.2.2.orig/gconf/Makefile.am
-+++ GConf-3.2.2/gconf/Makefile.am
-@@ -145,34 +145,6 @@ libgconf_2_la_LDFLAGS = -version-info $(
- 
- libgconf_2_la_LIBADD = $(INTLLIBS) $(DEPENDENT_LIBS) $(DEPENDENT_DBUS_LIBS) $(DEPENDENT_ORBIT_LIBS)
- 
---include $(INTROSPECTION_MAKEFILE)
--INTROSPECTION_GIRS =
--INTROSPECTION_SCANNER_ARGS = --warn-all --add-include-path=$(srcdir)
--INTROSPECTION_COMPILER_ARGS= --includedir=$(srcdir)
--
--if HAVE_INTROSPECTION
--introspection_files =				\
--	$(gconfinclude_HEADERS)			\
--	$(filter-out $(CORBA_SOURCECODE), $(filter %.c,$(libgconf_2_la_SOURCES)))
--GConf-2.0.gir: libgconf-2.la Makefile
--GConf_2_0_gir_INCLUDES = GObject-2.0
--GConf_2_0_gir_CFLAGS = \
--	$(INCLUDES)
--GConf_2_0_gir_LIBS = libgconf-2.la
--GConf_2_0_gir_FILES = $(addprefix $(srcdir)/, $(introspection_files))
--GConf_2_0_gir_SCANNERFLAGS = --identifier-prefix=GConf --symbol-prefix=gconf --c-include "gconf/gconf.h"
--GConf_2_0_gir_EXPORT_PACKAGES = gconf-2.0
--INTROSPECTION_GIRS += GConf-2.0.gir
--
--girdir = $(datadir)/gir-1.0/
--gir_DATA = $(INTROSPECTION_GIRS)
--
--typelibsdir = $(libdir)/girepository-1.0/
--typelibs_DATA = $(INTROSPECTION_GIRS:.gir=.typelib)
--
--CLEANFILES += $(gir_DATA) $(typelibs_DATA)
--endif
--
- EXTRA_DIST=GConfX.idl default.path.in org.gnome.GConf.service.in gconfmarshal.list regenerate-enum-header.sh regenerate-enum-footer.sh
- 
- default.path: $(srcdir)/default.path.in
-Index: GConf-3.2.2/configure.in
-===================================================================
---- GConf-3.2.2.orig/configure.in
-+++ GConf-3.2.2/configure.in
-@@ -354,8 +354,6 @@ AM_GLIB_GNU_GETTEXT
- 
- AC_CHECK_FUNCS(bind_textdomain_codeset)
- 
--GOBJECT_INTROSPECTION_CHECK([0.9.5])
--
- AC_SUBST(CFLAGS)
- AC_SUBST(CPPFLAGS)
- AC_SUBST(LDFLAGS)
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index 60c2be2..8388684 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -6,15 +6,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 POLKIT = "polkit"
 POLKIT_libc-uclibc = ""
 
-DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native ${POLKIT}"
-DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native"
+DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native ${POLKIT} gobject-introspection-stub"
+DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native gobject-introspection-stub-native"
 
 PR = "r11"
 
 inherit gnomebase gtk-doc
 
 SRC_URI = "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.tar.bz2;name=archive \
-	   file://nointro.patch \
 	   file://backenddir.patch"
 
 SRC_URI[archive.md5sum] = "f80329173cd9d134ad07e36002dd2a15"




