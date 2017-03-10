Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4CAA7776F9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:25:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988187"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:25:48 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:23:59 +0200
Message-Id: <aa8cb8aec0bfc08b9433dfd7b7a38b3322f692c7.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/44] nativesdk-packagegroup-sdk-host: replace smartpm with dnf
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
X-List-Received-Date: Fri, 10 Mar 2017 11:25:47 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb      | 2 +-
 meta/recipes-devtools/dnf/dnf_git.bb                                    | 1 -
 meta/recipes-devtools/libcomps/libcomps_git.bb                          | 2 +-
 meta/recipes-devtools/libdnf/libdnf_git.bb                              | 2 +-
 meta/recipes-devtools/librepo/librepo_git.bb                            | 2 +-
 .../recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb | 2 +-
 meta/recipes-devtools/python/python-iniparse_0.4.bb                     | 2 +-
 meta/recipes-devtools/python/python-pygpgme_0.3.bb                      | 2 +-
 meta/recipes-devtools/rpm/rpm_git.bb                                    | 2 +-
 meta/recipes-gnome/gtk-doc/gtk-doc_1.25.bb                              | 2 +-
 meta/recipes-support/gpgme/gpgme_1.8.0.bb                               | 2 +-
 meta/recipes-support/libassuan/libassuan_2.4.3.bb                       | 2 +-
 meta/recipes-support/libcheck/libcheck_0.10.0.bb                        | 1 +
 13 files changed, 12 insertions(+), 12 deletions(-)

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
index ff22d6f5f0d..018352a6c9b 100644
--- a/meta/recipes-devtools/dnf/dnf_git.bb
+++ b/meta/recipes-devtools/dnf/dnf_git.bb
@@ -28,7 +28,6 @@ DEPENDS += "python-backports-lzma"
 EXTRA_OECMAKE = " -DWITH_MAN=0 -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}"
 
 BBCLASSEXTEND = "native nativesdk"
-
 RDEPENDS_${PN}_class-target += "python-core python-codecs python-netclient python-email python-threading python-distutils librepo python-shell python-subprocess libcomps libdnf python-sqlite3 python-compression python-pygpgme python-backports-lzma python-rpm python-iniparse python-json python-importlib python-curses python-argparse"
 
 # Direct dnf-native to read rpm configuration from our sysroot, not the one it was compiled in
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
index 681c0029c5f..6e9cfcc8627 100644
--- a/meta/recipes-devtools/libdnf/libdnf_git.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_git.bb
@@ -36,5 +36,5 @@ EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DWITH_MAN=OFF
 EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
 EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
 
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
index 22a4e71a806..c71a41064c1 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -60,7 +60,7 @@ EXTRA_OECONF_append_libc-musl = " --disable-nls"
 # Also disable plugins, so that rpm doesn't attempt to inhibit shutdown via session dbus
 EXTRA_OECONF_append_class-native = " --sysconfdir=/etc --localstatedir=/var --disable-plugins"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 # Direct rpm-native to read configuration from our sysroot, not the one it was compiled in
 # libmagic also has sysroot path contamination, so override it
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
diff --git a/meta/recipes-support/gpgme/gpgme_1.8.0.bb b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
index 728e247a185..86922f6fd98 100644
--- a/meta/recipes-support/gpgme/gpgme_1.8.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
@@ -45,7 +45,7 @@ inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_INHERIT}
 
 export PKG_CONFIG='pkg-config'
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 PACKAGES =+ "${PN}-cpp"
 PACKAGES =. "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python2-gpg ', '', d)}"
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
index 9d34198a962..4db2d7528cc 100644
--- a/meta/recipes-support/libcheck/libcheck_0.10.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.10.0.bb
@@ -20,5 +20,6 @@ CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 RREPLACES_${PN} = "check (<= 0.9.5)"
 RDEPENDS_${PN} += "gawk"
 RDEPENDS_${PN}_class-native = ""
+RDEPENDS_${PN}_class-nativesdk = ""
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


