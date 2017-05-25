Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id A456777FD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 03:13:47 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym01.jp.fujitsu.com with smtp
	id 73df_0286_24c58c2a_d72a_487b_94d2_bdf6ac10ee9d;
	Thu, 25 May 2017 12:13:42 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6331BAC0183
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 12:13:41 +0900 (JST)
Received: from G01JPEXCHYT16.g01.fujitsu.local
	(G01JPEXCHYT16.g01.fujitsu.local [10.128.194.55])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	63C7E584317 for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 12:13:40 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT16.g01.fujitsu.local (10.128.194.55) with Microsoft SMTP
	Server id 14.3.266.1; Thu, 25 May 2017 12:13:39 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 May 2017 12:14:55 +0900
Message-ID: <1495682095-8382-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] nss: Upgrade 3.29.1 to 3.30.2
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
X-List-Received-Date: Thu, 25 May 2017 03:13:49 -0000
Content-Type: text/plain

Network Security Services (NSS) 3.30.2 is a patch release for NSS 3.30.

The bug fixes in NSS 3.30.2 are as follows:

    Bug 1350859 - March 2017 batch of root CA changes
    Bug 1349705 - Implemented domain name constraints for CA

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-support/nss/nss_3.29.1.bb | 246 ---------------------------------
 meta/recipes-support/nss/nss_3.30.2.bb | 246 +++++++++++++++++++++++++++++++++
 2 files changed, 246 insertions(+), 246 deletions(-)
 delete mode 100644 meta/recipes-support/nss/nss_3.29.1.bb
 create mode 100644 meta/recipes-support/nss/nss_3.30.2.bb

diff --git a/meta/recipes-support/nss/nss_3.29.1.bb b/meta/recipes-support/nss/nss_3.29.1.bb
deleted file mode 100644
index 48db031..0000000
--- a/meta/recipes-support/nss/nss_3.29.1.bb
+++ /dev/null
@@ -1,246 +0,0 @@
-SUMMARY = "Mozilla's SSL and TLS implementation"
-DESCRIPTION = "Network Security Services (NSS) is a set of libraries \
-designed to support cross-platform development of \
-security-enabled client and server applications. \
-Applications built with NSS can support SSL v2 and v3, \
-TLS, PKCS 5, PKCS 7, PKCS 11, PKCS 12, S/MIME, X.509 \
-v3 certificates, and other security standards."
-HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
-SECTION = "libs"
-
-LICENSE = "MPL-2.0 | (MPL-2.0 & GPL-2.0+) | (MPL-2.0 & LGPL-2.1+)"
-
-LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
-                    file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
-                    file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
-
-SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_29_1_RTM/src/${BP}.tar.gz \
-           file://nss.pc.in \
-           file://signlibs.sh \
-           file://0001-nss-fix-support-cross-compiling.patch \
-           file://nss-no-rpath-for-cross-compiling.patch \
-           file://nss-fix-incorrect-shebang-of-perl.patch \
-           file://nss-fix-nsinstall-build.patch \
-           file://disable-Wvarargs-with-clang.patch \
-           file://pqg.c-ULL_addend.patch \
-           file://Fix-compilation-for-X32.patch \
-           file://0001-Fix-warnings-found-with-gcc7.patch \
-           "
-SRC_URI[md5sum] = "0525d1a45931892daa0f368d379d4aa4"
-SRC_URI[sha256sum] = "47259bc5c4439d8228d7c577ea652ed140588f27eae8ebb39cc91057aea37366"
-
-UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
-UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-
-inherit siteinfo
-
-DEPENDS = "sqlite3 nspr zlib nss-native"
-DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
-RDEPENDS_${PN}-smime = "perl"
-
-TD = "${S}/tentative-dist"
-TDS = "${S}/tentative-dist-staging"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_configure_prepend_libc-musl () {
-    sed -i -e '/-DHAVE_SYS_CDEFS_H/d' ${S}/nss/lib/dbm/config/config.mk
-}
-
-do_compile_prepend_class-native() {
-    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}
-    export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
-    export NSS_ENABLE_WERROR=0
-}
-
-do_compile_prepend_class-nativesdk() {
-    export LDFLAGS=""
-}
-
-do_compile_prepend_class-native() {
-    # Need to set RPATH so that chrpath will do its job correctly
-    RPATH="-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}"
-}
-
-do_compile() {
-    export CROSS_COMPILE=1
-    export NATIVE_CC="gcc"
-    export NATIVE_FLAGS="${HOST_CFLAGS}"
-    export BUILD_OPT=1
-
-    export FREEBL_NO_DEPEND=1
-    export FREEBL_LOWHASH=1
-
-    export LIBDIR=${libdir}
-    export MOZILLA_CLIENT=1
-    export NS_USE_GCC=1
-    export NSS_USE_SYSTEM_SQLITE=1
-    export NSS_ENABLE_ECC=1
-
-    export OS_RELEASE=3.4
-    export OS_TARGET=Linux
-    export OS_ARCH=Linux
-
-    if [ "${TARGET_ARCH}" = "powerpc" ]; then
-        OS_TEST=ppc
-    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
-        OS_TEST=ppc64
-    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
-        OS_TEST=mips
-    else
-        OS_TEST="${TARGET_ARCH}"
-    fi
-
-    if [ "${SITEINFO_BITS}" = "64" ]; then
-        export USE_64=1
-    elif [ "${TARGET_ARCH}" = "x86_64" -a "${SITEINFO_BITS}" = "32" ]; then
-        export USE_X32=1
-    fi
-
-    export NSS_DISABLE_GTESTS=1
-
-    # We can modify CC in the environment, but if we set it via an
-    # argument to make, nsinstall, a host program, will also build with it!
-    #
-    export CC="${CC} -g"
-    make -C ./nss CCC="${CXX} -g" \
-        OS_TEST=${OS_TEST} \
-        RPATH="${RPATH}"
-}
-do_compile[vardepsexclude] += "SITEINFO_BITS"
-
-
-do_install_prepend_class-nativesdk() {
-    export LDFLAGS=""
-}
-
-do_install() {
-    export CROSS_COMPILE=1
-    export NATIVE_CC="gcc"
-    export BUILD_OPT=1
-
-    export FREEBL_NO_DEPEND=1
-
-    export LIBDIR=${libdir}
-    export MOZILLA_CLIENT=1
-    export NS_USE_GCC=1
-    export NSS_USE_SYSTEM_SQLITE=1
-    export NSS_ENABLE_ECC=1
-
-    export OS_RELEASE=3.4
-    export OS_TARGET=Linux
-    export OS_ARCH=Linux
-
-    if [ "${TARGET_ARCH}" = "powerpc" ]; then
-        OS_TEST=ppc
-    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
-        OS_TEST=ppc64
-    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
-        OS_TEST=mips
-    else
-        OS_TEST="${TARGET_ARCH}"
-    fi
-    if [ "${SITEINFO_BITS}" = "64" ]; then
-        export USE_64=1
-    elif [ "${TARGET_ARCH}" = "x86_64" -a "${SITEINFO_BITS}" = "32" ]; then
-        export USE_X32=1
-    fi
-
-    export NSS_DISABLE_GTESTS=1
-
-    make -C ./nss \
-        CCC="${CXX}" \
-        OS_TEST=${OS_TEST} \
-        SOURCE_LIB_DIR="${TD}/${libdir}" \
-        SOURCE_BIN_DIR="${TD}/${bindir}" \
-        install
-
-    install -d ${D}/${libdir}/
-    for file in ${S}/dist/*.OBJ/lib/*.so; do
-        echo "Installing `basename $file`..."
-        cp $file  ${D}/${libdir}/
-    done
-
-    for shared_lib in ${TD}/${libdir}/*.so.*; do
-        if [ -f $shared_lib ]; then
-            cp $shared_lib ${D}/${libdir}
-            ln -sf $(basename $shared_lib) ${D}/${libdir}/$(basename $shared_lib .1oe)
-        fi
-    done
-    for shared_lib in ${TD}/${libdir}/*.so; do
-        if [ -f $shared_lib -a ! -e ${D}/${libdir}/$shared_lib ]; then
-            cp $shared_lib ${D}/${libdir}
-        fi
-    done
-
-    install -d ${D}/${includedir}/nss3
-    install -m 644 -t ${D}/${includedir}/nss3 dist/public/nss/*
-
-    install -d ${D}/${bindir}
-    for binary in ${TD}/${bindir}/*; do
-        install -m 755 -t ${D}/${bindir} $binary
-    done
-}
-do_install[vardepsexclude] += "SITEINFO_BITS"
-
-do_install_append() {
-    # Create empty .chk files for the NSS libraries at build time. They could
-    # be regenerated at target's boot time.
-    for file in libsoftokn3.chk libfreebl3.chk libnssdbm3.chk; do
-        touch ${D}/${libdir}/$file
-        chmod 755 ${D}/${libdir}/$file
-    done
-    install -D -m 755 ${WORKDIR}/signlibs.sh ${D}/${bindir}/signlibs.sh
-
-    install -d ${D}${libdir}/pkgconfig/
-    sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed 's/%NSPR_VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc
-    sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nss.pc
-    sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nss.pc
-    sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nss.pc
-    sed -i s:OEINCDIR:${includedir}/nss3:g ${D}${libdir}/pkgconfig/nss.pc
-}
-
-do_install_append_class-target() {
-    # Create a blank certificate
-    mkdir -p ${D}${sysconfdir}/pki/nssdb/
-    touch ./empty_password
-    certutil -N -d ${D}${sysconfdir}/pki/nssdb/ -f ./empty_password
-    chmod 644 ${D}${sysconfdir}/pki/nssdb/*.db
-    rm ./empty_password
-}
-
-PACKAGE_WRITE_DEPS += "nss-native"
-pkg_postinst_${PN} () {
-    if [ -n "$D" ]; then
-        for I in $D${libdir}/lib*.chk; do
-            DN=`dirname $I`
-            BN=`basename $I .chk`
-            FN=$DN/$BN.so
-            shlibsign -i $FN
-            if [ $? -ne 0 ]; then
-                exit 1
-            fi
-        done
-    else
-        signlibs.sh
-    fi
-}
-
-PACKAGES =+ "${PN}-smime"
-FILES_${PN}-smime = "\
-    ${bindir}/smime \
-"
-FILES_${PN} = "\
-    ${sysconfdir} \
-    ${bindir} \
-    ${libdir}/lib*.chk \
-    ${libdir}/lib*.so \
-    "
-FILES_${PN}-dev = "\
-    ${libdir}/nss \
-    ${libdir}/pkgconfig/* \
-    ${includedir}/* \
-    "
-
-BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta/recipes-support/nss/nss_3.30.2.bb b/meta/recipes-support/nss/nss_3.30.2.bb
new file mode 100644
index 0000000..6683e5c
--- /dev/null
+++ b/meta/recipes-support/nss/nss_3.30.2.bb
@@ -0,0 +1,246 @@
+SUMMARY = "Mozilla's SSL and TLS implementation"
+DESCRIPTION = "Network Security Services (NSS) is a set of libraries \
+designed to support cross-platform development of \
+security-enabled client and server applications. \
+Applications built with NSS can support SSL v2 and v3, \
+TLS, PKCS 5, PKCS 7, PKCS 11, PKCS 12, S/MIME, X.509 \
+v3 certificates, and other security standards."
+HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
+SECTION = "libs"
+
+LICENSE = "MPL-2.0 | (MPL-2.0 & GPL-2.0+) | (MPL-2.0 & LGPL-2.1+)"
+
+LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
+                    file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
+                    file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
+
+SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_30_2_RTM/src/${BP}.tar.gz \
+           file://nss.pc.in \
+           file://signlibs.sh \
+           file://0001-nss-fix-support-cross-compiling.patch \
+           file://nss-no-rpath-for-cross-compiling.patch \
+           file://nss-fix-incorrect-shebang-of-perl.patch \
+           file://nss-fix-nsinstall-build.patch \
+           file://disable-Wvarargs-with-clang.patch \
+           file://pqg.c-ULL_addend.patch \
+           file://Fix-compilation-for-X32.patch \
+           file://0001-Fix-warnings-found-with-gcc7.patch \
+           "
+SRC_URI[md5sum] = "42c22dd8ec6254f846259f1d8dd2eb76"
+SRC_URI[sha256sum] = "0d4a77ff26bcee79fa8afe0125e0df6ae9e798b6b36782fa29e28febf7cfce24"
+
+UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
+UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
+
+inherit siteinfo
+
+DEPENDS = "sqlite3 nspr zlib nss-native"
+DEPENDS_class-native = "sqlite3-native nspr-native zlib-native"
+RDEPENDS_${PN}-smime = "perl"
+
+TD = "${S}/tentative-dist"
+TDS = "${S}/tentative-dist-staging"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_configure_prepend_libc-musl () {
+    sed -i -e '/-DHAVE_SYS_CDEFS_H/d' ${S}/nss/lib/dbm/config/config.mk
+}
+
+do_compile_prepend_class-native() {
+    export NSPR_INCLUDE_DIR=${STAGING_INCDIR_NATIVE}
+    export NSPR_LIB_DIR=${STAGING_LIBDIR_NATIVE}
+    export NSS_ENABLE_WERROR=0
+}
+
+do_compile_prepend_class-nativesdk() {
+    export LDFLAGS=""
+}
+
+do_compile_prepend_class-native() {
+    # Need to set RPATH so that chrpath will do its job correctly
+    RPATH="-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}"
+}
+
+do_compile() {
+    export CROSS_COMPILE=1
+    export NATIVE_CC="gcc"
+    export NATIVE_FLAGS="${HOST_CFLAGS}"
+    export BUILD_OPT=1
+
+    export FREEBL_NO_DEPEND=1
+    export FREEBL_LOWHASH=1
+
+    export LIBDIR=${libdir}
+    export MOZILLA_CLIENT=1
+    export NS_USE_GCC=1
+    export NSS_USE_SYSTEM_SQLITE=1
+    export NSS_ENABLE_ECC=1
+
+    export OS_RELEASE=3.4
+    export OS_TARGET=Linux
+    export OS_ARCH=Linux
+
+    if [ "${TARGET_ARCH}" = "powerpc" ]; then
+        OS_TEST=ppc
+    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
+        OS_TEST=ppc64
+    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
+        OS_TEST=mips
+    else
+        OS_TEST="${TARGET_ARCH}"
+    fi
+
+    if [ "${SITEINFO_BITS}" = "64" ]; then
+        export USE_64=1
+    elif [ "${TARGET_ARCH}" = "x86_64" -a "${SITEINFO_BITS}" = "32" ]; then
+        export USE_X32=1
+    fi
+
+    export NSS_DISABLE_GTESTS=1
+
+    # We can modify CC in the environment, but if we set it via an
+    # argument to make, nsinstall, a host program, will also build with it!
+    #
+    export CC="${CC} -g"
+    make -C ./nss CCC="${CXX} -g" \
+        OS_TEST=${OS_TEST} \
+        RPATH="${RPATH}"
+}
+do_compile[vardepsexclude] += "SITEINFO_BITS"
+
+
+do_install_prepend_class-nativesdk() {
+    export LDFLAGS=""
+}
+
+do_install() {
+    export CROSS_COMPILE=1
+    export NATIVE_CC="gcc"
+    export BUILD_OPT=1
+
+    export FREEBL_NO_DEPEND=1
+
+    export LIBDIR=${libdir}
+    export MOZILLA_CLIENT=1
+    export NS_USE_GCC=1
+    export NSS_USE_SYSTEM_SQLITE=1
+    export NSS_ENABLE_ECC=1
+
+    export OS_RELEASE=3.4
+    export OS_TARGET=Linux
+    export OS_ARCH=Linux
+
+    if [ "${TARGET_ARCH}" = "powerpc" ]; then
+        OS_TEST=ppc
+    elif [ "${TARGET_ARCH}" = "powerpc64" ]; then
+        OS_TEST=ppc64
+    elif [ "${TARGET_ARCH}" = "mips" -o "${TARGET_ARCH}" = "mipsel" -o "${TARGET_ARCH}" = "mips64" -o "${TARGET_ARCH}" = "mips64el" ]; then
+        OS_TEST=mips
+    else
+        OS_TEST="${TARGET_ARCH}"
+    fi
+    if [ "${SITEINFO_BITS}" = "64" ]; then
+        export USE_64=1
+    elif [ "${TARGET_ARCH}" = "x86_64" -a "${SITEINFO_BITS}" = "32" ]; then
+        export USE_X32=1
+    fi
+
+    export NSS_DISABLE_GTESTS=1
+
+    make -C ./nss \
+        CCC="${CXX}" \
+        OS_TEST=${OS_TEST} \
+        SOURCE_LIB_DIR="${TD}/${libdir}" \
+        SOURCE_BIN_DIR="${TD}/${bindir}" \
+        install
+
+    install -d ${D}/${libdir}/
+    for file in ${S}/dist/*.OBJ/lib/*.so; do
+        echo "Installing `basename $file`..."
+        cp $file  ${D}/${libdir}/
+    done
+
+    for shared_lib in ${TD}/${libdir}/*.so.*; do
+        if [ -f $shared_lib ]; then
+            cp $shared_lib ${D}/${libdir}
+            ln -sf $(basename $shared_lib) ${D}/${libdir}/$(basename $shared_lib .1oe)
+        fi
+    done
+    for shared_lib in ${TD}/${libdir}/*.so; do
+        if [ -f $shared_lib -a ! -e ${D}/${libdir}/$shared_lib ]; then
+            cp $shared_lib ${D}/${libdir}
+        fi
+    done
+
+    install -d ${D}/${includedir}/nss3
+    install -m 644 -t ${D}/${includedir}/nss3 dist/public/nss/*
+
+    install -d ${D}/${bindir}
+    for binary in ${TD}/${bindir}/*; do
+        install -m 755 -t ${D}/${bindir} $binary
+    done
+}
+do_install[vardepsexclude] += "SITEINFO_BITS"
+
+do_install_append() {
+    # Create empty .chk files for the NSS libraries at build time. They could
+    # be regenerated at target's boot time.
+    for file in libsoftokn3.chk libfreebl3.chk libnssdbm3.chk; do
+        touch ${D}/${libdir}/$file
+        chmod 755 ${D}/${libdir}/$file
+    done
+    install -D -m 755 ${WORKDIR}/signlibs.sh ${D}/${bindir}/signlibs.sh
+
+    install -d ${D}${libdir}/pkgconfig/
+    sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed 's/%NSPR_VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OEPREFIX:${prefix}:g ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OEEXECPREFIX:${exec_prefix}:g ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OELIBDIR:${libdir}:g ${D}${libdir}/pkgconfig/nss.pc
+    sed -i s:OEINCDIR:${includedir}/nss3:g ${D}${libdir}/pkgconfig/nss.pc
+}
+
+do_install_append_class-target() {
+    # Create a blank certificate
+    mkdir -p ${D}${sysconfdir}/pki/nssdb/
+    touch ./empty_password
+    certutil -N -d ${D}${sysconfdir}/pki/nssdb/ -f ./empty_password
+    chmod 644 ${D}${sysconfdir}/pki/nssdb/*.db
+    rm ./empty_password
+}
+
+PACKAGE_WRITE_DEPS += "nss-native"
+pkg_postinst_${PN} () {
+    if [ -n "$D" ]; then
+        for I in $D${libdir}/lib*.chk; do
+            DN=`dirname $I`
+            BN=`basename $I .chk`
+            FN=$DN/$BN.so
+            shlibsign -i $FN
+            if [ $? -ne 0 ]; then
+                exit 1
+            fi
+        done
+    else
+        signlibs.sh
+    fi
+}
+
+PACKAGES =+ "${PN}-smime"
+FILES_${PN}-smime = "\
+    ${bindir}/smime \
+"
+FILES_${PN} = "\
+    ${sysconfdir} \
+    ${bindir} \
+    ${libdir}/lib*.chk \
+    ${libdir}/lib*.so \
+    "
+FILES_${PN}-dev = "\
+    ${libdir}/nss \
+    ${libdir}/pkgconfig/* \
+    ${includedir}/* \
+    "
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
1.9.1


