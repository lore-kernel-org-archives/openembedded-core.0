Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 10564731D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:05:59 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:05:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546704"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:05:59 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:51 +0200
Message-Id: <ecb48c87aa2da229675825336f62cd21fe97b811.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/36] nativesdk-packagegroup-sdk-host: replace smartpm with dnf
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
X-List-Received-Date: Mon, 13 Feb 2017 15:05:59 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb     | 2 +-
 meta/recipes-devtools/dnf/dnf_git.bb                                   | 1 -
 meta/recipes-devtools/libcomps/libcomps_git.bb                         | 2 +-
 meta/recipes-devtools/libdnf/libdnf_git.bb                             | 2 +-
 meta/recipes-devtools/librepo/librepo_git.bb                           | 2 +-
 .../python-backports-lzma/python-backports-lzma_git.bb                 | 2 +-
 meta/recipes-devtools/python/python-iniparse_0.4.bb                    | 2 +-
 meta/recipes-devtools/python/python-pygpgme_0.3.bb                     | 2 +-
 meta/recipes-devtools/rpm/rpm_git.bb                                   | 2 +-
 meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb                             | 2 +-
 meta/recipes-support/gpgme/gpgme_1.6.0.bb                              | 2 +-
 meta/recipes-support/libassuan/libassuan_2.4.3.bb                      | 2 +-
 meta/recipes-support/libcheck/libcheck_0.10.0.bb                       | 3 ++-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 2c2abed33cd..3283e7370e8 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -22,7 +22,7 @@ RDEPENDS_${PN} = "\
     nativesdk-automake \
     nativesdk-shadow \
     nativesdk-makedevs \
-    nativesdk-smartpm \
+    nativesdk-dnf \
     nativesdk-postinst-intercept \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'nativesdk-wayland', '', d)} \
     "
diff --git a/meta/recipes-devtools/dnf/dnf_git.bb b/meta/recipes-devtools/dnf/dnf_git.bb
index 0273ff8e432..cf9e0e0cfd1 100644
--- a/meta/recipes-devtools/dnf/dnf_git.bb
+++ b/meta/recipes-devtools/dnf/dnf_git.bb
@@ -28,5 +28,4 @@ DEPENDS += "python-backports-lzma"
 EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
 
 BBCLASSEXTEND = "native nativesdk"
-
 RDEPENDS_${PN}_class-target += "python-core python-codecs python-netclient python-email python-threading python-distutils librepo python-shell python-subprocess libcomps libdnf python-sqlite3 python-compression python-pygpgme python-backports-lzma python-rpm python-iniparse python-json python-importlib python-curses python-argparse"
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index 448ea62f67c..8ff13b26b62 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -19,5 +19,5 @@ DEPENDS = "libxml2 expat libcheck"
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
 OECMAKE_SOURCEPATH = "${S}/libcomps"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/libdnf/libdnf_git.bb b/meta/recipes-devtools/libdnf/libdnf_git.bb
index e056b2bd32f..02ac43c346b 100644
--- a/meta/recipes-devtools/libdnf/libdnf_git.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_git.bb
@@ -21,5 +21,5 @@ inherit gtk-doc gobject-introspection cmake distutils-base pkgconfig
 
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DWITH_MAN=OFF"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/librepo/librepo_git.bb b/meta/recipes-devtools/librepo/librepo_git.bb
index 70e88c47b9e..3f3c5fbcf51 100644
--- a/meta/recipes-devtools/librepo/librepo_git.bb
+++ b/meta/recipes-devtools/librepo/librepo_git.bb
@@ -20,5 +20,5 @@ inherit cmake distutils-base pkgconfig
 
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
diff --git a/meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb b/meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb
index 6d3b8d569de..93c6684be6c 100644
--- a/meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb
+++ b/meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb
@@ -18,4 +18,4 @@ DEPENDS_append = " xz"
 RDEPENDS_${PN} += "python-core python-io python-pkgutil"
 RDEPENDS_${PN}_class-native += "python-core"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python-iniparse_0.4.bb b/meta/recipes-devtools/python/python-iniparse_0.4.bb
index f2515759b13..c6d98c2fdfc 100644
--- a/meta/recipes-devtools/python/python-iniparse_0.4.bb
+++ b/meta/recipes-devtools/python/python-iniparse_0.4.bb
@@ -12,6 +12,6 @@ inherit distutils
 
 RDEPENDS_${PN} += "python-core"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 S = "${WORKDIR}/iniparse-${PV}"
diff --git a/meta/recipes-devtools/python/python-pygpgme_0.3.bb b/meta/recipes-devtools/python/python-pygpgme_0.3.bb
index f7dd835eee9..ac8bc9d62e7 100644
--- a/meta/recipes-devtools/python/python-pygpgme_0.3.bb
+++ b/meta/recipes-devtools/python/python-pygpgme_0.3.bb
@@ -15,4 +15,4 @@ DEPENDS = "gpgme python"
 
 RDEPENDS_${PN} += "python-core"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index ceb4151945e..9addac2706b 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -55,7 +55,7 @@ EXTRA_OECONF_append = " --without-lua --enable-python"
 # Also disable plugins, so that rpm doesn't attempt to inhibit shutdown via session dbus
 EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 # Rpm's make install creates var/tmp which clashes with base-files packaging
 do_install_append_class-target() {
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
index 6af996e3593..7de36ae9e52 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb
@@ -29,7 +29,7 @@ SRC_URI_append_class-native = " file://pkg-config-native.patch"
 SRC_URI[archive.md5sum] = "0dc6570953112a464a409fb99258ccbc"
 SRC_URI[archive.sha256sum] = "1ea46ed400e6501f975acaafea31479cea8f32f911dca4dff036f59e6464fd42"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 # Do not check for XML catalogs when building because that
 # information is not used for anything during build. Recipe
diff --git a/meta/recipes-support/gpgme/gpgme_1.6.0.bb b/meta/recipes-support/gpgme/gpgme_1.6.0.bb
index 493a14ad947..be6f03eb6df 100644
--- a/meta/recipes-support/gpgme/gpgme_1.6.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.6.0.bb
@@ -24,7 +24,7 @@ BINCONFIG = "${bindir}/gpgme-config"
 
 inherit autotools texinfo binconfig-disabled pkgconfig
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES =+ "${PN}-pthread"
 FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
diff --git a/meta/recipes-support/libassuan/libassuan_2.4.3.bb b/meta/recipes-support/libassuan/libassuan_2.4.3.bb
index 1b3916d7343..926c279f90b 100644
--- a/meta/recipes-support/libassuan/libassuan_2.4.3.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.4.3.bb
@@ -28,4 +28,4 @@ do_configure_prepend () {
 	rm -f ${S}/m4/*.m4
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libcheck/libcheck_0.10.0.bb b/meta/recipes-support/libcheck/libcheck_0.10.0.bb
index c0b459f6618..4db2d7528cc 100644
--- a/meta/recipes-support/libcheck/libcheck_0.10.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.10.0.bb
@@ -20,5 +20,6 @@ CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 RREPLACES_${PN} = "check (<= 0.9.5)"
 RDEPENDS_${PN} += "gawk"
 RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-nativesdk = ""
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


