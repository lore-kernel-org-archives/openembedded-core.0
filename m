Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id B4B0971C85
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 21:48:11 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id C3D68B88D59; Thu,  8 Dec 2016 22:47:59 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 22:47:41 +0100
Message-Id: <1481233677-27298-18-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
References: <1481233677-27298-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH v2 17/33] apt: group variables (license, configuration, packaging)
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
X-List-Received-Date: Thu, 08 Dec 2016 21:48:12 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt_1.2.12.bb | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.12.bb
index 3463a23..a350b36 100644
--- a/meta/recipes-devtools/apt/apt_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt_1.2.12.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Advanced front-end for dpkg"
 SECTION = "base"
 LICENSE = "GPLv2.0+"
+LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 DEPENDS = "curl db zlib"
-RDEPENDS_${PN} = "dpkg bash debianutils"
 
 SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
            file://use-host.patch \
@@ -21,7 +21,6 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/
            "
 SRC_URI[md5sum] = "80f6f0ef110a45a7e5af8a9d233fb0e7"
 SRC_URI[sha256sum] = "e820d27cba73476df4abcff27dadd1b5847474bfe85f7e9202a9a07526973ea6"
-LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
 # so we check the latest upstream from a directory that does get updated
@@ -31,6 +30,13 @@ inherit autotools gettext useradd
 
 EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
 
+PACKAGECONFIG ??= "lzma"
+PACKAGECONFIG[lzma] = "ac_cv_lib_lzma_lzma_easy_encoder=yes,ac_cv_lib_lzma_lzma_easy_encoder=no,xz"
+PACKAGECONFIG[bz2] = "ac_cv_lib_bz2_BZ2_bzopen=yes,ac_cv_lib_bz2_BZ2_bzopen=no,bzip2"
+PACKAGECONFIG[lz4] = "ac_cv_lib_lz4_LZ4F_createCompressionContext=yes,ac_cv_lib_lz4_LZ4F_createCompressionContext=no,lz4"
+
+USE_NLS_class-native = "yes"
+
 do_configure_prepend() {
     rm -rf ${S}/buildlib/config.sub
     rm -rf ${S}/buildlib/config.guess
@@ -39,14 +45,6 @@ do_configure_prepend() {
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system --no-create-home --home-dir /nonexistent --shell /bin/false --user-group _apt"
 
-USE_NLS_class-native = "yes"
-
-PACKAGES =+ "${PN}-utils"
-FILES_${PN} += "${libdir}/dpkg"
-FILES_${PN}-utils = "${bindir}/apt-extracttemplates \
-                     ${bindir}/apt-ftparchive \
-                     ${bindir}/apt-sortpkgs"
-
 PROGRAMS = " \
     apt apt-cache apt-cdrom apt-config apt-extracttemplates \
     apt-ftparchive apt-get apt-key apt-mark apt-sortpkgs \
@@ -94,11 +92,6 @@ do_install () {
 	install -d ${D}${localstatedir}/log/apt
 }
 
-PACKAGECONFIG ??= "lzma"
-PACKAGECONFIG[lzma] = "ac_cv_lib_lzma_lzma_easy_encoder=yes,ac_cv_lib_lzma_lzma_easy_encoder=no,xz"
-PACKAGECONFIG[bz2] = "ac_cv_lib_bz2_BZ2_bzopen=yes,ac_cv_lib_bz2_BZ2_bzopen=no,bzip2"
-PACKAGECONFIG[lz4] = "ac_cv_lib_lz4_LZ4F_createCompressionContext=yes,ac_cv_lib_lz4_LZ4F_createCompressionContext=no,lz4"
-
 do_install_append_class-native() {
     sed -e "s,@STAGING_DIR_NATIVE@,${STAGING_DIR_NATIVE},g" \
         -e "s,@STAGING_BINDIR_NATIVE@,${STAGING_BINDIR_NATIVE},g" \
@@ -111,4 +104,13 @@ do_install_append_class-target() {
     echo 'APT::Architecture "${DPKG_ARCH}";' > ${D}${sysconfdir}/apt/apt.conf
 }
 
+PACKAGES =+ "${PN}-utils"
+
+RDEPENDS_${PN} = "dpkg bash debianutils"
+
+FILES_${PN} += "${libdir}/dpkg"
+FILES_${PN}-utils = "${bindir}/apt-extracttemplates \
+                     ${bindir}/apt-ftparchive \
+                     ${bindir}/apt-sortpkgs"
+
 BBCLASSEXTEND = "native"
-- 
2.7.4


