Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4B7B160761
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 13:37:24 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP; 28 Nov 2016 05:37:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,564,1473145200"; d="scan'208";a="36412223"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Nov 2016 05:37:24 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2016 15:34:12 +0200
Message-Id: <c5f189e17c96e6413d3e96a29f39c3440a410af2.1480333940.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
References: <cover.1480333940.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/18] icu: update to 58.1
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
X-List-Received-Date: Mon, 28 Nov 2016 13:37:24 -0000

The copyright for the software has been transferred to Unicode Inc from IBM,
but the terms are same.

libiculx and libicule are no longer produced as they depend on an external
package icu-le-hb (previous versions had an option of using an internal
implementation which now has been dropped). I have verified that icu
dependencies in oe-core and meta-oe still build.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/icu/icu.inc                      | 12 +++++++++---
 meta/recipes-support/icu/{icu_57.1.bb => icu_58.1.bb} |  6 +++---
 2 files changed, 12 insertions(+), 6 deletions(-)
 rename meta/recipes-support/icu/{icu_57.1.bb => icu_58.1.bb} (77%)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index cc6f222..f3dc1e0 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -26,6 +26,14 @@ EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 EXTRA_OECONF_class-native = ""
 EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
 
+
+# strtod_l() is not supported by musl; also xlocale.h is missing
+# It is not possible to disable its use via configure switches or env vars
+# so monkey patching is needed.
+do_configure_prepend_libc-musl () {
+    sed -i -e 's,DU_HAVE_STRTOD_L=1,DU_HAVE_STRTOD_L=0,' ${S}/configure.ac
+}
+
 PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
 do_install_append_class-native() {
 	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
@@ -36,15 +44,13 @@ do_install_append_class-native() {
 	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
 }
 
-PACKAGES =+ "libicudata libicuuc libicui18n libicule libiculx libicutu libicuio"
+PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
 
 FILES_${PN}-dev += "${libdir}/${BPN}/"
 
 FILES_libicudata = "${libdir}/libicudata.so.*"
 FILES_libicuuc = "${libdir}/libicuuc.so.*"
 FILES_libicui18n = "${libdir}/libicui18n.so.*"
-FILES_libicule = "${libdir}/libicule.so.*"
-FILES_libiculx = "${libdir}/libiculx.so.*"
 FILES_libicutu = "${libdir}/libicutu.so.*"
 FILES_libicuio = "${libdir}/libicuio.so.*"
 
diff --git a/meta/recipes-support/icu/icu_57.1.bb b/meta/recipes-support/icu/icu_58.1.bb
similarity index 77%
rename from meta/recipes-support/icu/icu_57.1.bb
rename to meta/recipes-support/icu/icu_58.1.bb
index 90c2b82..cc7c947 100644
--- a/meta/recipes-support/icu/icu_57.1.bb
+++ b/meta/recipes-support/icu/icu_58.1.bb
@@ -1,6 +1,6 @@
 require icu.inc
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=787d3b37867445c1cdd6f6167bd0e347"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=1b3b75c1777cd49ad5c6a24cd338cfc9"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV', True).split('.')
@@ -21,8 +21,8 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "976734806026a4ef8bdd17937c8898b9"
-SRC_URI[sha256sum] = "ff8c67cb65949b1e7808f2359f2b80f722697048e90e7cfc382ec1fe229e9581"
+SRC_URI[md5sum] = "1901302aaff1c1633ef81862663d2917"
+SRC_URI[sha256sum] = "0eb46ba3746a9c2092c8ad347a29b1a1b4941144772d13a88667a7b11ea30309"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.10.2


