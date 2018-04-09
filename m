Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 85BCD74901
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:29:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 04:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="218899913"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 09 Apr 2018 04:29:15 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 7B7625803B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 04:29:14 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 14:29:36 +0300
Message-Id: <1523273377-15643-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1523273377-15643-1-git-send-email-maxin.john@intel.com>
References: <1523273377-15643-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/2] at-spi2-core: upgrade to version 2.28.0
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
X-List-Received-Date: Mon, 09 Apr 2018 11:29:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

1. Convert to meson build
2. Remove the following patch made obsolete by moving to meson:
        0001-build-Add-with-systemduserunitdir.patch
3.  Provide meson flags for introspection and documentation

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0001-build-Add-with-systemduserunitdir.patch   | 52 ----------------------
 meta/recipes-support/atk/at-spi2-core_2.26.2.bb    | 29 ------------
 meta/recipes-support/atk/at-spi2-core_2.28.0.bb    | 39 ++++++++++++++++
 3 files changed, 39 insertions(+), 81 deletions(-)
 delete mode 100644 meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
 delete mode 100644 meta/recipes-support/atk/at-spi2-core_2.26.2.bb
 create mode 100644 meta/recipes-support/atk/at-spi2-core_2.28.0.bb

diff --git a/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch b/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
deleted file mode 100644
index 1f8c9f3..0000000
--- a/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From fa376762b92404b9e3c430054b8c3341ca0fdd8b Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 21 Jun 2016 16:00:02 +0300
-Subject: [PATCH] build: Add --with-systemduserunitdir
-
-Default to "pkg-config --variable=systemduserunitdir systemd" but
-allow overriding the value.
-
-Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=767911]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
----
- bus/Makefile.am | 2 +-
- configure.ac    | 9 +++++++++
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/bus/Makefile.am b/bus/Makefile.am
-index 688f82a..10cde62 100644
---- a/bus/Makefile.am
-+++ b/bus/Makefile.am
-@@ -29,7 +29,7 @@ org.a11y.Bus.service: org.a11y.Bus.service.in
- EXTRA_DIST += org.a11y.Bus.service.in
- CLEANFILES += org.a11y.Bus.service
- 
--systemd_userdir = $(prefix)/lib/systemd/user
-+systemd_userdir = $(systemduserunitdir)
- systemd_user_DATA = at-spi-dbus-bus.service
- at-spi-dbus-bus.service: at-spi-dbus-bus.service.in Makefile
- 	$(AM_V_GEN) $(SED) -e $(substitutions) $< > $@.tmp && mv $@.tmp $@
-diff --git a/configure.ac b/configure.ac
-index 8c4fca2..1415cca 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -146,6 +146,15 @@ else
- fi
- AC_SUBST(DBUS_SERVICES_DIR)
- 
-+AC_ARG_WITH([systemduserunitdir],
-+            AS_HELP_STRING([--with-systemduserunitdir=DIR],
-+                           [Directory for systemd service files]),
-+            [],
-+            [with_systemduserunitdir=$($PKG_CONFIG --variable=systemduserunitdir systemd)])
-+AC_SUBST([systemduserunitdir], [$with_systemduserunitdir])
-+
-+AC_PATH_PROG(GLIB_MKENUMS, glib-mkenums)
-+
- GOBJECT_INTROSPECTION_CHECK([1.32.0])
- 
- AC_SUBST(LIBTOOL_EXPORT_OPTIONS)
--- 
-2.14.1
-
diff --git a/meta/recipes-support/atk/at-spi2-core_2.26.2.bb b/meta/recipes-support/atk/at-spi2-core_2.26.2.bb
deleted file mode 100644
index 521ee3b..0000000
--- a/meta/recipes-support/atk/at-spi2-core_2.26.2.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "Assistive Technology Service Provider Interface (dbus core)"
-HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
-
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-           file://0001-build-Add-with-systemduserunitdir.patch \
-           "
-
-SRC_URI[md5sum] = "4a042e4c801fdb793788b749eab21485"
-SRC_URI[sha256sum] = "c80e0cdf5e3d713400315b63c7deffa561032a6c37289211d8afcfaa267c2615"
-
-DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst"
-
-inherit autotools gtk-doc gettext systemd pkgconfig distro_features_check upstream-version-is-even gobject-introspection
-# depends on virtual/libx11
-REQUIRED_DISTRO_FEATURES = "x11"
-
-EXTRA_OECONF = " \
-                --with-systemduserunitdir=${systemd_user_unitdir} \
-                --with-dbus-daemondir=${bindir}"
-
-FILES_${PN} += "${datadir}/dbus-1/services/*.service \
-                ${datadir}/dbus-1/accessibility-services/*.service \
-                ${datadir}/defaults/at-spi2 \
-                ${systemd_user_unitdir}/at-spi-dbus-bus.service \
-                "
diff --git a/meta/recipes-support/atk/at-spi2-core_2.28.0.bb b/meta/recipes-support/atk/at-spi2-core_2.28.0.bb
new file mode 100644
index 0000000..7975f58
--- /dev/null
+++ b/meta/recipes-support/atk/at-spi2-core_2.28.0.bb
@@ -0,0 +1,39 @@
+SUMMARY = "Assistive Technology Service Provider Interface (dbus core)"
+HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
+
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
+           "
+
+SRC_URI[md5sum] = "9c42f79636ed1c0e908b7483d789b32e"
+SRC_URI[sha256sum] = "42a2487ab11ce43c288e73b2668ef8b1ab40a0e2b4f94e80fca04ad27b6f1c87"
+
+DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst"
+
+inherit meson gtk-doc gettext systemd pkgconfig distro_features_check upstream-version-is-even gobject-introspection
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
+                  -Ddbus_daemon=${bindir}"
+
+GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
+GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
+
+GI_ENABLE_FLAG = "-Denable-introspection=yes"
+GI_DISABLE_FLAG = "-Denable-introspection=no"
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
+                                                                                       '${GI_DISABLE_FLAG}', d)} "
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
+                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
+
+FILES_${PN} += "${datadir}/dbus-1/services/*.service \
+                ${datadir}/dbus-1/accessibility-services/*.service \
+                ${datadir}/defaults/at-spi2 \
+                ${systemd_user_unitdir}/at-spi-dbus-bus.service \
+                "
-- 
2.4.0


