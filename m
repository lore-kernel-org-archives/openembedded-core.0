Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 10AAB6059F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 11:50:03 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 67468B8B27B; Tue,  6 Dec 2016 12:49:53 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:49:33 +0100
Message-Id: <1481024991-5882-16-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 15/33] apt: merge with apt-native
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
X-List-Received-Date: Tue, 06 Dec 2016 11:50:03 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/apt/apt-native_1.2.12.bb | 50 --------------------------
 meta/recipes-devtools/apt/apt.inc              |  3 ++
 meta/recipes-devtools/apt/apt_1.2.12.bb        | 11 ++++++
 3 files changed, 14 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt-native_1.2.12.bb

diff --git a/meta/recipes-devtools/apt/apt-native_1.2.12.bb b/meta/recipes-devtools/apt/apt-native_1.2.12.bb
deleted file mode 100644
index 8d32ef9..0000000
--- a/meta/recipes-devtools/apt/apt-native_1.2.12.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-require apt.inc
-inherit native
-
-DEPENDS += "dpkg-native gettext-native db-native curl-native xz-native"
-PACKAGES = ""
-USE_NLS = "yes"
-
-SRC_URI += "file://0001-remove-Wsuggest-attribute-from-CFLAGS.patch \
-            file://0001-fix-the-gcc-version-check.patch \
-            file://apt.conf.in \
-"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 bin/apt-cdrom ${D}${bindir}/
-	install -m 0755 bin/apt-get ${D}${bindir}/
-	install -m 0755 bin/apt-config ${D}${bindir}/
-	install -m 0755 bin/apt-cache ${D}${bindir}/
-	install -m 0755 bin/apt-sortpkgs ${D}${bindir}/
-	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
-	install -m 0755 bin/apt-ftparchive ${D}${bindir}/
-
-	oe_libinstall -so -C bin libapt-private ${D}${libdir}/
-
-	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-	oe_libinstall -so -C bin libapt-inst$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-
-	install -d ${D}${libdir}/apt/methods
-	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
-
-	install -d ${D}${libdir}/dpkg/methods/apt
-	install -m 0644 ${S}/dselect/desc.apt ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0644 ${S}/dselect/names ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0755 ${S}/dselect/install ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0755 ${S}/dselect/setup ${D}${libdir}/dpkg/methods/apt/ 
-	install -m 0755 ${S}/dselect/update ${D}${libdir}/dpkg/methods/apt/ 
-
-	install -d ${D}${sysconfdir}/apt
-	install -d ${D}${sysconfdir}/apt/apt.conf.d
-	install -d ${D}${sysconfdir}/apt/preferences.d
-	install -d ${D}${localstatedir}/lib/apt/lists/partial
-	install -d ${D}${localstatedir}/cache/apt/archives/partial
-
-	install -d ${D}${localstatedir}/log/apt/
-
-	sed -e "s,@STAGING_DIR_NATIVE@,${STAGING_DIR_NATIVE},g" \
-	    -e "s,@STAGING_BINDIR_NATIVE@,${STAGING_BINDIR_NATIVE},g" \
-	    -e "s,@STAGING_LIBDIR@,${STAGING_LIBDIR},g" \
-	    < ${WORKDIR}/apt.conf.in > ${D}${sysconfdir}/apt/apt.conf.sample
-}
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 3026370..1488664 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -13,6 +13,9 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/
            file://disable-test.patch \
            file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
            file://0001-apt-1.2.12-Fix-musl-build.patch \
+           file://0001-remove-Wsuggest-attribute-from-CFLAGS.patch \
+           file://0001-fix-the-gcc-version-check.patch \
+           file://apt.conf.in \
            "
 SRC_URI[md5sum] = "80f6f0ef110a45a7e5af8a9d233fb0e7"
 SRC_URI[sha256sum] = "e820d27cba73476df4abcff27dadd1b5847474bfe85f7e9202a9a07526973ea6"
diff --git a/meta/recipes-devtools/apt/apt_1.2.12.bb b/meta/recipes-devtools/apt/apt_1.2.12.bb
index 20c7cb4..f09dfc8 100644
--- a/meta/recipes-devtools/apt/apt_1.2.12.bb
+++ b/meta/recipes-devtools/apt/apt_1.2.12.bb
@@ -2,6 +2,8 @@ DEPENDS = "curl db zlib"
 RDEPENDS_${PN} = "dpkg bash debianutils"
 require apt.inc
 
+USE_NLS_class-native = "yes"
+
 PACKAGES =+ "${PN}-utils"
 FILES_${PN} += "${libdir}/dpkg"
 FILES_${PN}-utils = "${bindir}/apt-extracttemplates \
@@ -60,7 +62,16 @@ PACKAGECONFIG[lzma] = "ac_cv_lib_lzma_lzma_easy_encoder=yes,ac_cv_lib_lzma_lzma_
 PACKAGECONFIG[bz2] = "ac_cv_lib_bz2_BZ2_bzopen=yes,ac_cv_lib_bz2_BZ2_bzopen=no,bzip2"
 PACKAGECONFIG[lz4] = "ac_cv_lib_lz4_LZ4F_createCompressionContext=yes,ac_cv_lib_lz4_LZ4F_createCompressionContext=no,lz4"
 
+do_install_append_class-native() {
+    sed -e "s,@STAGING_DIR_NATIVE@,${STAGING_DIR_NATIVE},g" \
+        -e "s,@STAGING_BINDIR_NATIVE@,${STAGING_BINDIR_NATIVE},g" \
+        -e "s,@STAGING_LIBDIR@,${STAGING_LIBDIR},g" \
+        < ${WORKDIR}/apt.conf.in > ${D}${sysconfdir}/apt/apt.conf.sample
+}
+
 do_install_append_class-target() {
     #Write the correct apt-architecture to apt.conf
     echo 'APT::Architecture "${DPKG_ARCH}";' > ${D}${sysconfdir}/apt/apt.conf
 }
+
+BBCLASSEXTEND = "native"
-- 
2.7.4


