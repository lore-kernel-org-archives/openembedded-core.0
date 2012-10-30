Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TT8Lr-0002rZ-HE
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 10:43:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9U9TdLp028880
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 02:29:39 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 30 Oct 2012 02:29:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2012 17:33:49 +0800
Message-ID: <1271da1edefc8e19ba4274a19d5b3cc8fb0342d1.1351496696.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1351496696.git.liezhi.yang@windriver.com>
References: <cover.1351496696.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 08/11] recipes-support: replace virtclass-native(sdk) with class-native(sdk)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 09:43:16 -0000
Content-Type: text/plain

The overrides virtclass-native and virtclass-nativesdk are deprecated,
which should be replaced by class-native and class-nativesdk.

NOTE:
There were 2 errors in libcap.inc, the BUILD_LDFLAGS_virtclass_native
should be BUILD_LDFLAGS_virtclass-native (the "_" should be "-"),
otherwise it doesn't work, and the value was: "-Wl,rpath=...", this is
incorrect, it shoudl be: "-Wl,-rpath=..." (lacked a - ), but we don't
need this line, since it is already in the default BUILD_LDFLAGS. Remove
it and we don't need to bump the PR since we just removed a unused line.

[YOCTO #3297]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/apr/apr-util_1.4.1.bb                 |  4 ++--
 meta/recipes-support/attr/ea-acl.inc                       |  4 ++--
 meta/recipes-support/boost/boost.inc                       | 12 ++++++------
 meta/recipes-support/createrepo/createrepo_0.4.11.bb       |  4 ++--
 meta/recipes-support/curl/curl_7.26.0.bb                   |  8 ++++----
 meta/recipes-support/icu/icu-3.6.inc                       |  4 ++--
 meta/recipes-support/libcap/libcap.inc                     |  8 +++-----
 meta/recipes-support/neon/neon_0.29.6.bb                   |  2 +-
 meta/recipes-support/shared-mime-info/shared-mime-info.inc |  4 ++--
 meta/recipes-support/sqlite/sqlite3.inc                    |  4 ++--
 10 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.4.1.bb b/meta/recipes-support/apr/apr-util_1.4.1.bb
index 238af97..7ee3de5 100644
--- a/meta/recipes-support/apr/apr-util_1.4.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.4.1.bb
@@ -37,10 +37,10 @@ do_configure_append() {
 		cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
 	fi
 }
-do_configure_prepend_virtclass-native() {
+do_configure_prepend_class-native() {
 	cp ${STAGING_DATADIR_NATIVE}/apr/apr_rules.mk ${S}/build/rules.mk
 }
-do_configure_append_virtclass-native() {
+do_configure_append_class-native() {
 	sed -i "s#LIBTOOL=\$(SHELL) \$(apr_builddir)#LIBTOOL=\$(SHELL) ${STAGING_BINDIR_NATIVE}#" ${S}/build/rules.mk
 	# sometimes there isn't SHELL
 	sed -i "s#LIBTOOL=\$(apr_builddir)#LIBTOOL=${STAGING_BINDIR_NATIVE}#" ${S}/build/rules.mk
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 0f506bc..bcc7acc 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -9,7 +9,7 @@ inherit autotools gettext
 # overwritten by autoheader
 export AUTOHEADER = "true"
 EXTRA_OECONF = "INSTALL_USER=root INSTALL_GROUP=root"
-EXTRA_OECONF_append_virtclass-native = " --enable-gettext=no"
+EXTRA_OECONF_append_class-native = " --enable-gettext=no"
 
 EXTRA_OEMAKE = "PKG_LIB_DIR=${base_libdir} PKG_DEVLIB_DIR=${libdir}"
 
@@ -55,4 +55,4 @@ fix_symlink () {
 		ln -sf ${libdir}/lib${BPN}.la ${base_libdir}/lib${BPN}.la
 	fi
 }
-SSTATEPOSTINSTFUNCS_virtclass-native += "fix_symlink"
+SSTATEPOSTINSTFUNCS_class-native += "fix_symlink"
diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index ec602a6..36a94e1 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -7,7 +7,7 @@ DESCRIPTION = "Free peer-reviewed portable C++ source libraries"
 HOMEPAGE = "http://www.boost.org/"
 SECTION = "libs"
 DEPENDS = "boost-native zlib"
-DEPENDS_virtclass-native = ""
+DEPENDS_class-native = ""
 LICENSE = "BSL-1.0 & MIT & Python-2.0"
 
 ARM_INSTRUCTION_SET = "arm"
@@ -73,7 +73,7 @@ FILES_${PN}-staticdev = "${libdir}/libboost_*.a"
 # "boost" is a metapackage which pulls in all boost librabries
 PACKAGES += "${PN}"
 RRECOMMENDS_${PN} += "${BOOST_PACKAGES}"
-RRECOMMENDS_${PN}_virtclass-native = ""
+RRECOMMENDS_${PN}_class-native = ""
 ALLOW_EMPTY_${PN} = "1"
 
 # to avoid GNU_HASH QA errors added LDFLAGS to ARCH; a little bit dirty but at least it works
@@ -176,15 +176,15 @@ do_install() {
 
 BBCLASSEXTEND = "native"
 
-do_configure_virtclass-native() {
+do_configure_class-native() {
 	:
 }
 
-do_boostconfig_virtclass-native() {
+do_boostconfig_class-native() {
 	:
 }
 
-do_compile_virtclass-native() {
+do_compile_class-native() {
 	set -ex
 	cd ${S}/tools/build/v2/engine
 	rm -rf bin.*
@@ -194,7 +194,7 @@ do_compile_virtclass-native() {
 # This is too terrible - the build script doesn't give any good
 # way I can see to find out where the binaries are placed, so
 # rely on only one bin.foo directory being created.
-do_install_virtclass-native () {
+do_install_class-native () {
 	set -ex
 	cd ${S}/tools/build/v2/engine
 	install -d ${D}${bindir}/
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index 344cc77..8d2dcdf 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://createrepo.baseurl.org/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
 
-RDEPENDS_${PN}_virtclass-native += "libxml2-native rpm-native"
+RDEPENDS_${PN}_class-native += "libxml2-native rpm-native"
 
 PR = "r7"
 
@@ -28,7 +28,7 @@ do_install () {
 # Wrap the python script since the native python is
 # ${bindir}/python-native/python, and the "#! /usr/bin/env python" can't
 # find it since it is not in PATH.
-do_install_append_virtclass-native () {
+do_install_append_class-native () {
 	# Not all the python scripts should be wrapped since some of
 	# them are modules (be imported).
 	for i in ${D}${datadir}/createrepo/genpkgmetadata.py \
diff --git a/meta/recipes-support/curl/curl_7.26.0.bb b/meta/recipes-support/curl/curl_7.26.0.bb
index dad5572..9a0e7ce 100644
--- a/meta/recipes-support/curl/curl_7.26.0.bb
+++ b/meta/recipes-support/curl/curl_7.26.0.bb
@@ -6,8 +6,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
 
 DEPENDS = "zlib gnutls"
-DEPENDS_virtclass-native = "zlib-native openssl-native"
-DEPENDS_virtclass-nativesdk = "nativesdk-zlib"
+DEPENDS_class-native = "zlib-native openssl-native"
+DEPENDS_class-nativesdk = "nativesdk-zlib"
 PR = "r1"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
@@ -29,8 +29,8 @@ EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
                 "
 
 CURLGNUTLS = " --with-gnutls=${STAGING_LIBDIR}/../ --without-ssl"
-CURLGNUTLS_virtclass-native = "--without-gnutls --with-ssl"
-CURLGNUTLS_virtclass-nativesdk = "--without-gnutls --without-ssl"
+CURLGNUTLS_class-native = "--without-gnutls --with-ssl"
+CURLGNUTLS_class-nativesdk = "--without-gnutls --without-ssl"
 
 do_configure_prepend() {
 	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g configure.ac
diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/icu/icu-3.6.inc
index d969caa..272f6d1 100644
--- a/meta/recipes-support/icu/icu-3.6.inc
+++ b/meta/recipes-support/icu/icu-3.6.inc
@@ -11,12 +11,12 @@ BASE_SRC_URI = "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-
 SRC_URI = "${BASE_SRC_URI} \
            file://noldlibpath.patch \
            "
-SRC_URI_virtclass-native = "${BASE_SRC_URI}"
+SRC_URI_class-native = "${BASE_SRC_URI}"
 
 LICENSE = "ICU"
 LIC_FILES_CHKSUM = "file://../license.html;md5=5c94767cedb5d6987c902ac850ded2c6"
 DEPENDS = "icu-native"
-DEPENDS_virtclass-native = ""
+DEPENDS_class-native = ""
 
 S = "${WORKDIR}/icu/source"
 
diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 27552ad..7f16a56 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
 DEPENDS = "attr perl-native-runtime"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-# attr and pam are disabled by EXTRA_OEMAKE_virtclass-native
-DEPENDS_virtclass-native = "perl-native-runtime"
+# attr and pam are disabled by EXTRA_OEMAKE_class-native
+DEPENDS_class-native = "perl-native-runtime"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/libc/libcap2/${BPN}2_${PV}.orig.tar.gz"
 
@@ -23,15 +23,13 @@ do_configure() {
 	sed -e 's,BUILD_CFLAGS ?=,BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
 }
 
-BUILD_LDFLAGS_virtclass_native += "-Wl,rpath=${base_libdir}"
-
 EXTRA_OEMAKE = " \
   LIBATTR=yes \
   PAM_CAP=${@base_contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} \
   INDENT= SYSTEM_HEADERS=${STAGING_INCDIR} RAISE_SETFCAP=no \
   lib=${@os.path.basename('${libdir}')} \
 "
-EXTRA_OEMAKE_virtclass-native = " \
+EXTRA_OEMAKE_class-native = " \
   LIBATTR=no \
   PAM_CAP=no \
   INDENT= \
diff --git a/meta/recipes-support/neon/neon_0.29.6.bb b/meta/recipes-support/neon/neon_0.29.6.bb
index 170a47c..42d5e52 100644
--- a/meta/recipes-support/neon/neon_0.29.6.bb
+++ b/meta/recipes-support/neon/neon_0.29.6.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a \
                     file://src/ne_utils.h;beginline=1;endline=20;md5=2caca609538eddaa6f6adf120a218037"
 DEPENDS = "zlib libxml2 expat time gnutls libproxy"
-DEPENDS_virtclass-native = "zlib-native libxml2-native expat-native gnutls-native"
+DEPENDS_class-native = "zlib-native libxml2-native expat-native gnutls-native"
 
 PR = "r2"
 
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index d7fa67c..93f6010 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 intltool-native glib-2.0 shared-mime-info-native"
-DEPENDS_virtclass-native = "libxml2-native intltool-native glib-2.0-native"
+DEPENDS_class-native = "libxml2-native intltool-native glib-2.0-native"
 
 SRC_URI = "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.xz"
 
@@ -29,7 +29,7 @@ do_install () {
 	update-mime-database ${D}${datadir}/mime
 }
 
-do_install_virtclass-native () {
+do_install_class-native () {
 	autotools_do_install
 }
 
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 70841f8..e94c6ef 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -2,13 +2,13 @@ DESCRIPTION = "An Embeddable SQL Database Engine"
 HOMEPAGE = "http://www.sqlite.org"
 SECTION = "libs"
 DEPENDS = "readline ncurses"
-DEPENDS_virtclass-native = ""
+DEPENDS_class-native = ""
 LICENSE = "PD"
 
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-tcl --enable-shared --enable-threadsafe"
-EXTRA_OECONF_virtclass-native = "--disable-tcl --enable-shared --enable-threadsafe --disable-readline --enable-tempstore"
+EXTRA_OECONF_class-native = "--disable-tcl --enable-shared --enable-threadsafe --disable-readline --enable-tempstore"
 export config_BUILD_CC = "${BUILD_CC}"
 export config_BUILD_CFLAGS = "${BUILD_CFLAGS}"
 export config_BUILD_LIBS = "${BUILD_LDFLAGS}"
-- 
1.7.11.2



