Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E8D5A6FF93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 12:06:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 22 Jun 2016 05:06:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="992846211"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 22 Jun 2016 05:06:46 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 15:06:35 +0300
Message-Id: <1466597195-1142-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1466597195-1142-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1466597195-1142-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] pythonnative.bbclass, python3native.bbclass: export STAGING_INCDIR, STAGING_LIBDIR, PYTHON variables
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
X-List-Received-Date: Wed, 22 Jun 2016 12:06:46 -0000

We patch Python's distutils modules to access STAGING_INCDIR/LIBDIR, so when
they are not set, scripts that utilize distutils (e.g. python-config) fail.
Several recipes need to export those manually to prevent such failures,
so let's do that in the class instead.

PYTHON variable is exported because otherwise autotools' python.m4
macro will pick up its own internal default, which may not be the version
that we want.

glib recipe in particular was previously using Python 2.x during build due to python.m4
defaulting to it - now it's using Python 3.x, and so needs a small fix in
deletion of *.pyc files.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gobject-introspection.bbclass                        | 5 -----
 meta/classes/python3native.bbclass                                | 8 ++++++++
 meta/classes/pythonnative.bbclass                                 | 8 ++++++++
 meta/recipes-core/glib-2.0/glib.inc                               | 1 +
 meta/recipes-core/libxml/libxml2_2.9.4.bb                         | 4 ----
 meta/recipes-devtools/python/python3-dbus_1.2.4.bb                | 4 ----
 meta/recipes-extended/libuser/libuser_0.62.bb                     | 2 --
 meta/recipes-extended/newt/libnewt_0.52.19.bb                     | 2 --
 .../gobject-introspection/gobject-introspection_1.48.0.bb         | 7 -------
 meta/recipes-kernel/perf/perf.bb                                  | 2 --
 meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb                 | 3 ---
 11 files changed, 17 insertions(+), 29 deletions(-)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 8cd7b7e..37389cb 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -24,11 +24,6 @@ DEPENDS_append_class-target = " gobject-introspection gobject-introspection-nati
 DEPENDS_append_class-native = " gobject-introspection-native"
 DEPENDS_append_class-nativesdk = " gobject-introspection-native"
 
-# This is necessary for python scripts to succeed - distutils fails if these
-# are not set
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
 # This is used by introspection tools to find .gir includes
 export XDG_DATA_DIRS = "${STAGING_DATADIR}"
 
diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index 1899863..d7b2d35 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -3,3 +3,11 @@ inherit python3-dir
 PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
 EXTRANATIVEPATH += "${PYTHON_PN}-native"
 DEPENDS += " ${PYTHON_PN}-native "
+
+# python-config and other scripts are using distutils modules
+# which we patch to access these variables
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+# autoconf macros will use their internal default preference otherwise
+export PYTHON
diff --git a/meta/classes/pythonnative.bbclass b/meta/classes/pythonnative.bbclass
index 97029dc..bd239fa 100644
--- a/meta/classes/pythonnative.bbclass
+++ b/meta/classes/pythonnative.bbclass
@@ -6,3 +6,11 @@ PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
 PYTHON_EXECUTABLE="${PYTHON}"
 EXTRANATIVEPATH += "${PYTHON_PN}-native"
 DEPENDS += " ${PYTHON_PN}-native "
+
+# python-config and other scripts are using distutils modules
+# which we patch to access these variables
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+# autoconf macros will use their internal default preference otherwise
+export PYTHON
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c6b8e57..c2cceda 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -77,6 +77,7 @@ do_install_append () {
 	fi
 
 	# Remove some unpackaged files
+	rm -rf ${D}${datadir}/glib-2.0/codegen/__pycache__
 	rm -f ${D}${datadir}/glib-2.0/codegen/*.pyc
 	rm -f ${D}${datadir}/glib-2.0/codegen/*.pyo
 
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 5ff508a..e2febf0 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -47,10 +47,6 @@ EXTRA_OECONF_class-native = "--without-legacy --without-docbook --with-c14n --wi
 EXTRA_OECONF_class-nativesdk = "--without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
 EXTRA_OECONF_linuxstdbase = "--with-debug --with-legacy --with-docbook --with-c14n --without-lzma --with-zlib"
 
-# required for python binding
-export STAGING_LIBDIR
-export STAGING_INCDIR
-
 python populate_packages_prepend () {
     # autonamer would call this libxml2-2, but we don't want that
     if d.getVar('DEBIAN_NAMES', True):
diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.4.bb b/meta/recipes-devtools/python/python3-dbus_1.2.4.bb
index 759512c..de5a01c 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.4.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.4.bb
@@ -18,10 +18,6 @@ PACKAGECONFIG ?= ""
 PACKAGECONFIG[docs] = "--enable-html-docs,--disable-html-docs,python3-docutils-native"
 PACKAGECONFIG[api-docs] = "--enable-api-docs,--disable-api-docs,python3-docutils-native python3-epydoc-native"
 
-do_configure_prepend() {
-    export PYTHON=${PYTHON}
-}
-
 RDEPENDS_${PN} = "python3-io python3-logging python3-stringold python3-threading python3-xml"
 
 FILES_${PN}-dev += "${libdir}/pkgconfig"
diff --git a/meta/recipes-extended/libuser/libuser_0.62.bb b/meta/recipes-extended/libuser/libuser_0.62.bb
index 8590563..960f789 100644
--- a/meta/recipes-extended/libuser/libuser_0.62.bb
+++ b/meta/recipes-extended/libuser/libuser_0.62.bb
@@ -24,8 +24,6 @@ DEPENDS = "popt libpam glib-2.0 docbook-utils-native linuxdoc-tools-native pytho
 
 inherit autotools gettext python3native python3-dir pkgconfig
 
-export PYTHON
-
 EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
 
 PACKAGES += "${PN}-python "
diff --git a/meta/recipes-extended/newt/libnewt_0.52.19.bb b/meta/recipes-extended/newt/libnewt_0.52.19.bb
index b45461c..22bdaf5 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.19.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.19.bb
@@ -35,8 +35,6 @@ inherit autotools-brokensep
 
 CLEANBROKEN = "1"
 
-export STAGING_INCDIR
-export STAGING_LIBDIR
 export CPPFLAGS
 
 PACKAGES_prepend = "whiptail "
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
index 8adede6..6948aff 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb
@@ -21,13 +21,6 @@ SRC_URI[sha256sum] = "fa275aaccdbfc91ec0bc9a6fd0562051acdba731e7d584b64a277fec60
 inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data
 BBCLASSEXTEND = "native"
 
-# necessary to let the call for python-config from configure.ac succeed
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-# autoconf macros otherwise will default to Python 2
-export PYTHON
-
 # needed for writing out the qemu wrapper script
 export STAGING_DIR_HOST
 export B
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index d668300..171d23f 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -40,8 +40,6 @@ inherit linux-kernel-base kernel-arch pythonnative
 
 # needed for building the tools/perf Python bindings
 inherit python-dir
-export STAGING_INCDIR
-export STAGING_LIBDIR
 export PYTHON_SITEPACKAGES_DIR
 
 #kernel 3.1+ supports WERROR to disable warnings as errors
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
index 5608f49..a38a818 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb
@@ -17,9 +17,6 @@ SRC_URI[sha256sum] = "615549ce39b333f6b78baee0c0b4ef18bc726c6bf1cca123dfd89dd963
 
 DEPENDS += "swig-native python3"
 
-export PYTHON
-export STAGING_INCDIR
-export STAGING_LIBDIR
 EXTRA_OECONF += "--with-python --with-python3"
 EXTRA_OEMAKE += "PYLIBVER='python${PYTHON_BASEVERSION}${PYTHON_ABI}' PYINC='${STAGING_INCDIR}/${PYLIBVER}'"
 
-- 
2.8.1


