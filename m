Return-Path: <maxin.john@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 164BF74B5A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 15:33:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 08:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,406,1517904000"; d="scan'208";a="217602102"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 04 Apr 2018 08:33:40 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 0DBDE5801C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 08:33:39 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 18:32:18 +0300
Message-Id: <1522855946-8702-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
References: <1522855946-8702-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 02/10] at-spi2-core: upgrade to version 2.28.0
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
X-List-Received-Date: Wed, 04 Apr 2018 15:33:40 -0000

1. convert to meson build
2. Remove the following patch made obsolete by moving to meson:
        0001-build-Add-with-systemduserunitdir.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0001-build-Add-with-systemduserunitdir.patch   | 52 ----------------------
 ...-spi2-core_2.26.2.bb => at-spi2-core_2.28.0.bb} | 12 +++--
 2 files changed, 5 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
 rename meta/recipes-support/atk/{at-spi2-core_2.26.2.bb => at-spi2-core_2.28.0.bb} (61%)

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
diff --git a/meta/recipes-support/atk/at-spi2-core_2.26.2.bb b/meta/recipes-support/atk/at-spi2-core_2.28.0.bb
similarity index 61%
rename from meta/recipes-support/atk/at-spi2-core_2.26.2.bb
rename to meta/recipes-support/atk/at-spi2-core_2.28.0.bb
index 521ee3b..604b97f 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.26.2.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.28.0.bb
@@ -6,21 +6,19 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-           file://0001-build-Add-with-systemduserunitdir.patch \
            "
 
-SRC_URI[md5sum] = "4a042e4c801fdb793788b749eab21485"
-SRC_URI[sha256sum] = "c80e0cdf5e3d713400315b63c7deffa561032a6c37289211d8afcfaa267c2615"
+SRC_URI[md5sum] = "9c42f79636ed1c0e908b7483d789b32e"
+SRC_URI[sha256sum] = "42a2487ab11ce43c288e73b2668ef8b1ab40a0e2b4f94e80fca04ad27b6f1c87"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst"
 
-inherit autotools gtk-doc gettext systemd pkgconfig distro_features_check upstream-version-is-even gobject-introspection
+inherit meson gtk-doc gettext systemd pkgconfig distro_features_check upstream-version-is-even gobject-introspection
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-EXTRA_OECONF = " \
-                --with-systemduserunitdir=${systemd_user_unitdir} \
-                --with-dbus-daemondir=${bindir}"
+EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
+                  -Ddbus_daemon=${bindir}"
 
 FILES_${PN} += "${datadir}/dbus-1/services/*.service \
                 ${datadir}/dbus-1/accessibility-services/*.service \
-- 
2.4.0


