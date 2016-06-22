Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5E5731B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 11:52:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Jun 2016 04:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="1002968759"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 22 Jun 2016 04:52:35 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 14:52:22 +0300
Message-Id: <4d649bb96ead08d7da8f89dc3f0c11de3d2e72af.1466595928.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
References: <d54f69d5faec48cd7dda7efbbc1b7fdd0bb0bd65.1466595928.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1466595928.git.jussi.kukkonen@intel.com>
References: <cover.1466595928.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] at-spi2-core: Upgrade 2.18.3 -> 2.20.2
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
X-List-Received-Date: Wed, 22 Jun 2016 11:52:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add systemd unit, patch in a configure flag to set the correct dir.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-build-Add-with-systemduserunitdir.patch   | 49 ++++++++++++++++++++++
 ...-spi2-core_2.18.3.bb => at-spi2-core_2.20.2.bb} | 18 +++++---
 2 files changed, 61 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
 rename meta/recipes-support/atk/{at-spi2-core_2.18.3.bb => at-spi2-core_2.20.2.bb} (49%)

diff --git a/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch b/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
new file mode 100644
index 0000000..4103eaa
--- /dev/null
+++ b/meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
@@ -0,0 +1,49 @@
+From 2f47c975ebe52b6916a45ade023ae3bac21bb0e0 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Tue, 21 Jun 2016 16:00:02 +0300
+Subject: [PATCH] build: Add --with-systemduserunitdir
+
+Default to "pkg-config --variable=systemduserunitdir systemd" but
+allow overriding the value.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=767911]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ bus/Makefile.am | 2 +-
+ configure.ac    | 7 +++++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/bus/Makefile.am b/bus/Makefile.am
+index b189e02..52fbb0b 100644
+--- a/bus/Makefile.am
++++ b/bus/Makefile.am
+@@ -26,7 +26,7 @@ dbusservice_DATA = org.a11y.Bus.service
+ org.a11y.Bus.service: org.a11y.Bus.service.in
+ 	sed -e $(substitutions) $< > $@.tmp && mv $@.tmp $@
+ 
+-systemd_userdir = $(prefix)/lib/systemd/user
++systemd_userdir = $(systemduserunitdir)
+ systemd_user_DATA = at-spi-dbus-bus.service
+ at-spi-dbus-bus.service: at-spi-dbus-bus.service.in Makefile
+ 	sed -e $(substitutions) $< > $@.tmp && mv $@.tmp $@
+diff --git a/configure.ac b/configure.ac
+index f9061c2..2b8eeed 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -183,6 +183,13 @@ else
+ fi
+ AC_SUBST(DBUS_SERVICES_DIR)
+ 
++AC_ARG_WITH([systemduserunitdir],
++            AS_HELP_STRING([--with-systemduserunitdir=DIR],
++                           [Directory for systemd service files]),
++            [],
++            [with_systemduserunitdir=$($PKG_CONFIG --variable=systemduserunitdir systemd)])
++AC_SUBST([systemduserunitdir], [$with_systemduserunitdir])
++
+ AC_PATH_PROG(GLIB_MKENUMS, glib-mkenums)
+ 
+ GOBJECT_INTROSPECTION_CHECK([0.9.6])
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/atk/at-spi2-core_2.18.3.bb b/meta/recipes-support/atk/at-spi2-core_2.20.2.bb
similarity index 49%
rename from meta/recipes-support/atk/at-spi2-core_2.18.3.bb
rename to meta/recipes-support/atk/at-spi2-core_2.20.2.bb
index eced597..199243a 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.18.3.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.20.2.bb
@@ -6,18 +6,24 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
+           file://0001-build-Add-with-systemduserunitdir.patch \
           "
 
-SRC_URI[md5sum] = "fc18801e56f6ce6914126f837d42f556"
-SRC_URI[sha256sum] = "ada26add94155f97d0f601a20cb7a0e3fd3ba1588c3520b7288316494027d629"
+SRC_URI[md5sum] = "f6f6303da2e72317f881703f40bf0c62"
+SRC_URI[sha256sum] = "88a4de9d43139f13cca531b47b901bc1b56e0ab06ba899126644abd4ac16a143"
 
-DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native gettext-native"
+DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
-inherit autotools gtk-doc pkgconfig distro_features_check upstream-version-is-even gobject-introspection
+inherit autotools gtk-doc gettext systemd pkgconfig distro_features_check upstream-version-is-even gobject-introspection
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-EXTRA_OECONF = "--disable-xevie --with-dbus-daemondir=${bindir}"
+EXTRA_OECONF = "--disable-xevie \
+                --with-systemduserunitdir=${systemd_user_unitdir} \
+                --with-dbus-daemondir=${bindir}"
 
 FILES_${PN} += "${datadir}/dbus-1/services/*.service \
-                ${datadir}/dbus-1/accessibility-services/*.service"
+                ${datadir}/dbus-1/accessibility-services/*.service \
+                ${datadir}/defaults/at-spi2 \
+                ${systemd_user_unitdir}/at-spi-dbus-bus.service \
+                "
-- 
2.1.4


