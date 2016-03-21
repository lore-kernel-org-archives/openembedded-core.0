Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4C0A860745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 18:29:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 21 Mar 2016 11:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,373,1455004800"; d="scan'208";a="942006410"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2016 11:29:36 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 20:29:33 +0200
Message-Id: <7fc053339242682df1f66a07c0f481acb3313daf.1458582024.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <98344b2eaa67b64a8397652dcb3c51d5dbe39a61.1458582024.git.jussi.kukkonen@intel.com>
References: <98344b2eaa67b64a8397652dcb3c51d5dbe39a61.1458582024.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1458582024.git.jussi.kukkonen@intel.com>
References: <cover.1458582024.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] gio-module-cache: Add class for Gio modules
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
X-List-Received-Date: Mon, 21 Mar 2016 18:29:36 -0000

The new class uses gio-querymodules tool on postinst and postrm:
this regenerates the module cache which is useful to avoid loading
modules that are not neededi at runtime. If a Gio module is not
listed in the cache file it will always get loaded.

* Add a postinst-intercept 'gio-module-cache': it runs
  gio-querymodules using qemuwrapper. This is required because the tool
  actually loads the modules to generate the cache.
* Add a gio-module-cache class that adds postinstall and postrm
  scripts. In the sysroot population case use the new intercept.
* Inherit the new class in glib-2.0, glib-networking and gconf.

Fixes [YOCTO #9241].

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/gio-module-cache.bbclass              | 36 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc                |  2 +-
 .../glib-networking/glib-networking_2.46.1.bb      |  2 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |  2 +-
 .../postinst-intercepts/update_gio_module_cache    |  7 +++++
 5 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 meta/classes/gio-module-cache.bbclass
 create mode 100644 scripts/postinst-intercepts/update_gio_module_cache

diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-module-cache.bbclass
new file mode 100644
index 0000000..4d59f5c
--- /dev/null
+++ b/meta/classes/gio-module-cache.bbclass
@@ -0,0 +1,36 @@
+DEPENDS += "qemu-native"
+inherit qemu
+
+GIO_MODULE_PACKAGES ??= "${PN}"
+
+gio_module_cache_common() {
+if [ "x$D" != "x" ]; then
+	$INTERCEPT_DIR/postinst_intercept update_gio_module_cache ${PKG} \
+		mlprefix=${MLPREFIX} \
+		libdir=${libdir} \
+                base_libdir=${base_libdir} \
+                bindir=${bindir}
+else
+        gio-querymodules ${libdir}/gio/modules/
+fi
+}
+
+python populate_packages_append () {
+    packages = d.getVar('GIO_MODULE_PACKAGES', True).split()
+
+    for pkg in packages:
+        bb.note("adding gio-module-cache postinst and postrm scripts to %s" % pkg)
+
+        postinst = d.getVar('pkg_postinst_%s' % pkg, True)
+        if not postinst:
+            postinst = '#!/bin/sh\n'
+        postinst += d.getVar('gio_module_cache_common', True)
+        d.setVar('pkg_postinst_%s' % pkg, postinst)
+
+        postrm = d.getVar('pkg_postrm_%s' % pkg, True)
+        if not postrm:
+            postrm = '#!/bin/sh\n'
+        postrm += d.getVar('gio_module_cache_common', True)
+        d.setVar('pkg_postrm_%s' % pkg, postrm)
+}
+
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c0f9e0d..baba7e5 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -27,7 +27,7 @@ PACKAGES += "${PN}-utils ${PN}-codegen"
 LEAD_SONAME = "libglib-2.0.*"
 FILES_${PN}-utils = "${bindir}/* ${datadir}/glib-2.0/gettext"
 
-inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion
+inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache
 
 S = "${WORKDIR}/glib-${PV}"
 
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
index 70be87c..749ac98 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.46.1.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG[pkcs11] = "--with-pkcs11,--without-pkcs11,p11-kit"
 
 EXTRA_OECONF = "--without-gnome-proxy"
 
-inherit gnomebase gettext upstream-version-is-even
+inherit gnomebase gettext upstream-version-is-even gio-module-cache
 
 FILES_${PN} += "${libdir}/gio/modules/libgio*.so ${datadir}/dbus-1/services/"
 FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index feaf080..e3af3d0 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
 DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native"
 
-inherit gnomebase gtk-doc gettext gobject-introspection
+inherit gnomebase gtk-doc gettext gobject-introspection gio-module-cache
 
 SRC_URI = "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.tar.xz;name=archive \
            file://remove_plus_from_invalid_characters_list.patch \
diff --git a/scripts/postinst-intercepts/update_gio_module_cache b/scripts/postinst-intercepts/update_gio_module_cache
new file mode 100644
index 0000000..c1b6d66
--- /dev/null
+++ b/scripts/postinst-intercepts/update_gio_module_cache
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+set -e
+
+PSEUDO_UNLOAD=1 qemuwrapper -L $D -E LD_LIBRARY_PATH=$D/${libdir}:$D/${base_libdir} \
+        $D${bindir}/gio-querymodules $D${libdir}/gio/modules/
+
-- 
2.1.4


