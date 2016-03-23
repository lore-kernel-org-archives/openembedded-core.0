Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C9F46605BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 12:56:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 23 Mar 2016 05:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,382,1455004800"; d="scan'208";a="71787041"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 23 Mar 2016 05:56:17 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 14:52:05 +0200
Message-Id: <1458737525-32487-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458737525-32487-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1458737525-32487-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] bitbake.conf: rename 'gobject-introspection-data' machine feature to 'qemu-usermode'
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
X-List-Received-Date: Wed, 23 Mar 2016 12:56:19 -0000

The new value is more general and better reflects what having the feature really means.
Introspection data, then, is built only if 'gobject-introspection-data' is in
DISTRO_FEATURES and 'qemu-usermode' is in MACHINE_FEATURES.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/gobject-introspection-data.bbclass                  | 9 +++++++++
 meta/classes/gobject-introspection.bbclass                       | 8 ++++----
 meta/conf/bitbake.conf                                           | 2 +-
 meta/conf/machine/include/x86/arch-x86.inc                       | 2 +-
 .../gobject-introspection/gobject-introspection_1.46.0.bb        | 4 ++--
 meta/recipes-sato/webkit/webkitgtk_2.10.7.bb                     | 2 +-
 6 files changed, 18 insertions(+), 9 deletions(-)
 create mode 100644 meta/classes/gobject-introspection-data.bbclass

diff --git a/meta/classes/gobject-introspection-data.bbclass b/meta/classes/gobject-introspection-data.bbclass
new file mode 100644
index 0000000..b1bdd26
--- /dev/null
+++ b/meta/classes/gobject-introspection-data.bbclass
@@ -0,0 +1,9 @@
+# This variable is set to True if gobject-introspection-data is in
+# DISTRO_FEATURES and qemu-usermode is in MACHINE_FEATURES, and False otherwise.
+#
+# It should be used in recipes to determine whether introspection data should be built,
+# so that qemu use can be avoided when necessary.
+GI_DATA_ENABLED = "${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', \
+                      bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d), 'False', d)}"
+
+
diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index d8b8b3e..2d73e40 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -1,9 +1,9 @@
 # Inherit this class in recipes to enable building their introspection files
 
-# This allows disabling introspection support (and therefore avoiding the use
-# of qemu) in recipes if gobject-introspection-data is omitted from
-# DISTRO_FEATURES or MACHINE_FEATURES.
-EXTRA_OECONF_prepend = "${@bb.utils.contains('COMBINED_FEATURES', 'gobject-introspection-data', '--enable-introspection', '--disable-introspection', d)} "
+# This sets up autoconf-based recipes to build introspection data (or not),
+# depending on distro and machine features (see gobject-introspection-data class).
+inherit gobject-introspection-data
+EXTRA_OECONF_prepend = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
 
 UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7ed5ffb..752faa3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -762,7 +762,7 @@ EXTRA_IMAGE_FEATURES ??= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-introspection-data"
-MACHINE_FEATURES_BACKFILL = "rtc gobject-introspection-data"
+MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
 
 COMBINED_FEATURES = "${@oe.utils.set_intersect('DISTRO_FEATURES', 'MACHINE_FEATURES', d)}"
 COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
index ba7be8a..e51d595 100644
--- a/meta/conf/machine/include/x86/arch-x86.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -25,7 +25,7 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mx32', ' -mx32', '', d)}"
 TUNE_LDARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-m elf32_x86_64', '', d)}"
 TUNE_ASARGS += "${@bb.utils.contains('TUNE_FEATURES', 'mx32', '-x32', '', d)}"
 # user mode qemu doesn't support x32
-MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'gobject-introspection-data', '', d)}"
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'qemu-usermode', '', d)}"
 
 # ELF64 ABI
 TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
index b8b8823..9b16147 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/1.46/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "adb40a31c7c80b65b0f4c8fd71b493dc"
 SRC_URI[sha256sum] = "6658bd3c2b8813eb3e2511ee153238d09ace9d309e4574af27443d87423e4233"
 
-inherit autotools pkgconfig gtk-doc pythonnative qemu
+inherit autotools pkgconfig gtk-doc pythonnative qemu gobject-introspection-data
 BBCLASSEXTEND = "native"
 
 # necessary to let the call for python-config from configure.ac succeed
@@ -105,7 +105,7 @@ EOF
 EXTRA_OECONF_class-target += "--enable-host-gi \
                               --enable-gi-cross-wrapper=${B}/g-ir-scanner-qemuwrapper \
                               --enable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
-                              ${@bb.utils.contains('COMBINED_FEATURES', 'gobject-introspection-data', '--enable-introspection-data', '--disable-introspection-data', d)} \
+                              ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection-data', '--disable-introspection-data', d)} \
                              "
 
 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
index 849a33a..8eb6b9f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.10.7.bb
@@ -54,7 +54,7 @@ PACKAGECONFIG[libhyphen] = "-DUSE_LIBHYPHEN=ON,-DUSE_LIBHYPHEN=OFF,libhyphen"
 EXTRA_OECMAKE = " \
 		-DPORT=GTK \
 		-DCMAKE_BUILD_TYPE=Release \
-		${@bb.utils.contains('COMBINED_FEATURES', 'gobject-introspection-data', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
+		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
 		-DENABLE_GTKDOC=OFF \
 		-DENABLE_MINIBROWSER=ON \
 		"
-- 
2.7.0


