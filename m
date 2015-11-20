Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AF459607AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:11:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2015 06:11:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,323,1444719600"; d="scan'208";a="855904302"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2015 06:11:24 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 16:08:52 +0200
Message-Id: <b0ea6d13749f5594e4669f477e2b5dc24d1e9b14.1448028339.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
References: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 7/9] package_regex.inc: split entries which blacklist specific versions to their recipes
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
X-List-Received-Date: Fri, 20 Nov 2015 14:11:23 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/package_regex.inc         | 35 ----------------------
 .../docbook-sgml-dtd-3.1-native_3.1.bb             |  3 ++
 .../docbook-sgml-dtd-4.1-native_4.1.bb             |  3 ++
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  2 ++
 meta/recipes-devtools/python/python.inc            |  4 +++
 .../python/python3-native_3.4.3.bb                 |  3 ++
 meta/recipes-devtools/python/python3_3.4.3.bb      |  3 ++
 meta/recipes-extended/unzip/unzip_6.0.bb           |  4 +++
 meta/recipes-extended/zip/zip_3.0.bb               |  3 ++
 meta/recipes-multimedia/libtiff/tiff_4.0.4.bb      |  3 ++
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |  3 ++
 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |  3 ++
 meta/recipes-qt/qt4/qt4-native.inc                 |  4 +++
 meta/recipes-support/db/db_6.0.30.bb               |  4 +++
 14 files changed, 42 insertions(+), 35 deletions(-)

diff --git a/meta/conf/distro/include/package_regex.inc b/meta/conf/distro/include/package_regex.inc
index 7db8d57..beed994 100644
--- a/meta/conf/distro/include/package_regex.inc
+++ b/meta/conf/distro/include/package_regex.inc
@@ -46,25 +46,9 @@ REGEX_pn-cmake = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 REGEX_pn-libsdl = "SDL-(?P<pver>\d+(\.\d+)+)\.tar"
 REGEX_pn-libxslt = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-# Exclude NC versions which lack AES encryption
-REGEX_pn-db = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
-
 REGEX_URI_pn-autogen = "http://ftp.gnu.org/gnu/autogen/"
 REGEX_pn-autogen = "rel(?P<pver>\d+(\.\d+)+)/"
 
-# python recipe is actually python 2.x
-# also, exclude pre-releases for both python 2.x and 3.x
-REGEX_pn-python = "[Pp]ython-(?P<pver>2(\.\d+)+).tar"
-REGEX_pn-python3 = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-
-# exclude betas
-REGEX_pn-tiff = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-
-# exclude version 5.5.2 which triggers a false positive
-REGEX_pn-unzip = "unzip(?P<pver>(?!552).+)\.tgz"
-# similar for zip
-REGEX_pn-zip = "^zip(?P<pver>(?!232).+)\.tgz"
-
 # Isn't possible to download with the default URI web server returns
 # (403, 404, 550)
 REGEX_URI_pn-dosfstools = "https://github.com/dosfstools/dosfstools/releases"
@@ -104,22 +88,3 @@ REGEX_URI_pn-libnfsidmap = "http://www.citi.umich.edu/projects/nfsv4/linux/libnf
 REGEX_URI_pn-mpfr = "http://www.mpfr.org/mpfr-current/"
 REGEX_URI_pn-nss = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 REGEX_pn-nss = "NSS_(?P<pver>.+)_release_notes"
-
-REGEX_URI_pn-docbook-sgml-dtd-3.1 = "http://www.docbook.org/sgml/"
-REGEX_pn-docbook-sgml-dtd-3.1 = "(?P<pver>3\..+)/"
-REGEX_URI_pn-docbook-sgml-dtd-4.1 = "http://www.docbook.org/sgml/"
-REGEX_pn-docbook-sgml-dtd-4.1 = "(?P<pver>4\.1(\.\d+)*)/"
-
-# Qt recipes should be kept at 4.x
-REGEX_URI_pn-qt4-embedded = "http://download.qt.io/official_releases/qt/4.8/"
-REGEX_pn-qt4-embedded = "(?P<pver>\d+(\.\d+)+)/"
-REGEX_URI_pn-qt4-x11-free = "http://download.qt.io/official_releases/qt/4.8/"
-REGEX_pn-qt4-x11-free = "(?P<pver>\d+(\.\d+)+)/"
-REGEX_URI_pn-nativesdk-qt4-tools = "http://download.qt.io/official_releases/qt/4.8/"
-REGEX_pn-nativesdk-qt4-tools = "(?P<pver>\d+(\.\d+)+)/"
-REGEX_URI_pn-qt4-native = "http://download.qt.io/official_releases/qt/4.8/"
-REGEX_pn-qt4-native = "(?P<pver>\d+(\.\d+)+)/"
-
-# Keep old gcc versions at their major versions
-REGEX_pn-gcc-source-4.9.3 = "gcc-(?P<pver>4\.9\.\d+).tar"
-REGEX_pn-gcc-source-4.8.4 = "gcc-(?P<pver>4\.8\.\d+).tar"
diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
index a7df4f9..83d60a0 100644
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
+++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-3.1-native_3.1.bb
@@ -16,6 +16,9 @@ SRC_URI = "http://www.docbook.org/sgml/3.1/docbk31.zip \
 SRC_URI[md5sum] = "432749c0c806dbae81c8bcb70da3b5d3"
 SRC_URI[sha256sum] = "20261d2771b9a052abfa3d8fab1aa62be05791a010281c566f9073bf0e644538"
 
+REGEX_URI = "http://www.docbook.org/sgml/"
+REGEX = "(?P<pver>3\..+)/"
+
 do_compile() {
 	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/sgml-dtd-3.html
 	# for details.
diff --git a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
index 88c9396..77938e1 100644
--- a/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
+++ b/meta/recipes-devtools/docbook-sgml-dtd/docbook-sgml-dtd-4.1-native_4.1.bb
@@ -16,6 +16,9 @@ SRC_URI = "http://docbook.org/sgml/4.1/docbk41.zip \
 SRC_URI[md5sum] = "489f6ff2a2173eb1e14216c10533ede2"
 SRC_URI[sha256sum] = "deaafcf0a3677692e7ad4412c0e41c1db3e9da6cdcdb3dd32b2cc1f9c97d6311"
 
+REGEX_URI = "http://www.docbook.org/sgml/"
+REGEX = "(?P<pver>4\.1(\.\d+)*)/"
+
 do_compile() {
 	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/sgml-dtd.html
 	# for details.
diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 95b553c..0a35d49 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -85,6 +85,8 @@ SRC_URI = "\
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
 
+REGEX = "gcc-(?P<pver>4\.9\.\d+).tar"
+
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 4d428f3..eafedb6 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -12,6 +12,10 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz"
 SRC_URI[md5sum] = "38d530f7efc373d64a8fb1637e3baaa7"
 SRC_URI[sha256sum] = "90d27e14ea7e03570026850e2e50ba71ad20b7eb31035aada1cf3def8f8d4916"
 
+# python recipe is actually python 2.x
+# also, exclude pre-releases for both python 2.x and 3.x
+REGEX = "[Pp]ython-(?P<pver>2(\.\d+)+).tar"
+
 PYTHON_MAJMIN = "2.7"
 
 inherit autotools
diff --git a/meta/recipes-devtools/python/python3-native_3.4.3.bb b/meta/recipes-devtools/python/python3-native_3.4.3.bb
index 464ff05..5f2ff77 100644
--- a/meta/recipes-devtools/python/python3-native_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.4.3.bb
@@ -32,6 +32,9 @@ SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043e
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
 
+# exclude pre-releases for both python 2.x and 3.x
+REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
+
 S = "${WORKDIR}/Python-${PV}"
 
 EXTRANATIVEPATH += "bzip2-native"
diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index a33f10f..cae2f13 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -41,6 +41,9 @@ SRC_URI += "\
 SRC_URI[md5sum] = "7d092d1bba6e17f0d9bd21b49e441dd5"
 SRC_URI[sha256sum] = "b5b3963533768d5fc325a4d7a6bd6f666726002d696f1d399ec06b043ea996b8"
 
+# exclude pre-releases for both python 2.x and 3.x
+REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
+
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dd98d01d471fac8d8dbdd975229dba03"
 
 S = "${WORKDIR}/Python-${PV}"
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index b386323..cb9636d 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -20,6 +20,10 @@ SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
 
 SRC_URI[md5sum] = "62b490407489521db863b523a7f86375"
 SRC_URI[sha256sum] = "036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37"
+
+# exclude version 5.5.2 which triggers a false positive
+REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
+
 S = "${WORKDIR}/unzip60"
 
 # Makefile uses CF_NOOPT instead of CFLAGS.  We lifted the values from
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 1e96110..21f6eaa 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -8,6 +8,9 @@ S = "${WORKDIR}/zip30"
 SRC_URI[md5sum] = "7b74551e63f8ee6aab6fbc86676c0d37"
 SRC_URI[sha256sum] = "f0e8bb1f9b7eb0b01285495a2699df3a4b766784c1765a8f1aeedf63c0806369"
 
+# exclude version 2.3.2 which triggers a false positive
+REGEX = "^zip(?P<pver>(?!232).+)\.tgz"
+
 # zip.inc sets CFLAGS, but what Makefile actually uses is
 # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
 # whatever we set.
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
index cf3a5f0..94352e0 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.4.bb
@@ -10,6 +10,9 @@ SRC_URI = "ftp://ftp.remotesensing.org/pub/libtiff/tiff-${PV}.tar.gz \
 SRC_URI[md5sum] = "9aee7107408a128c0c7b24286c0db900"
 SRC_URI[sha256sum] = "8cb1d90c96f61cdfc0bcf036acc251c9dbe6320334da941c7a83cfe1576ef890"
 
+# exclude betas
+REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
+
 inherit autotools
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
diff --git a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
index 077008b..3eb4c52 100644
--- a/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
+++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools.inc
@@ -18,6 +18,9 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://g++.conf \
            file://linux.conf"
 
+REGEX_URI = "http://download.qt.io/official_releases/qt/4.8/"
+REGEX = "(?P<pver>\d+(\.\d+)+)/"
+
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
diff --git a/meta/recipes-qt/qt4/qt4-4.8.7.inc b/meta/recipes-qt/qt4/qt4-4.8.7.inc
index d165514..8b26456 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.7.inc
+++ b/meta/recipes-qt/qt4/qt4-4.8.7.inc
@@ -34,6 +34,9 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
 SRC_URI[md5sum] = "d990ee66bf7ab0c785589776f35ba6ad"
 SRC_URI[sha256sum] = "e2882295097e47fe089f8ac741a95fef47e0a73a3f3cdf21b56990638f626ea0"
 
+REGEX_URI = "http://download.qt.io/official_releases/qt/4.8/"
+REGEX = "(?P<pver>\d+(\.\d+)+)/"
+
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
 # disable webkit for mips64 n32 temporarily that fails to compile,
diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 2a41f8a..37fb6e3 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -19,6 +19,10 @@ SRC_URI = "http://download.qt-project.org/official_releases/qt/4.8/${PV}/qt-ever
            file://g++.conf \
            file://linux.conf \
 	"
+
+REGEX_URI = "http://download.qt.io/official_releases/qt/4.8/"
+REGEX = "(?P<pver>\d+(\.\d+)+)/"
+
 S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
 
 EXTRA_OECONF = "-prefix ${prefix} \
diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index d49df62..cde590a 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -26,6 +26,10 @@ SRC_URI += "file://arm-thumb-mutex_db5.patch;patchdir=.. \
 SRC_URI[md5sum] = "ad28eb86ad3203b5422844db179c585b"
 SRC_URI[sha256sum] = "608e4b1cf390e9bf54c0ef00c5bd9ca76d36e2261b9f4d33d54516f3f6a20fd2"
 
+# Exclude NC versions which lack AES encryption
+REGEX = "db-(?P<pver>\d+\.\d+(\.\d+)?).tar"
+REGEX_URI = "http://www.oracle.com/technetwork/products/berkeleydb/downloads/index-082944.html"
+
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=1ec8b0b17cc31513fe35ab10716f8490"
 
 inherit autotools
-- 
2.6.2


