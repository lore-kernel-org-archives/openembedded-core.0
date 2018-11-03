Return-Path: <robert.joslyn@redrectangle.org>
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
	[217.70.183.199])
	by mail.openembedded.org (Postfix) with ESMTP id CD53879DDE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Nov 2018 16:44:57 +0000 (UTC)
X-Originating-IP: 50.37.87.235
Received: from xps13.localdomain (50-37-87-235.mscw.id.frontiernet.net
	[50.37.87.235])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id ECC8CFF802;
	Sat,  3 Nov 2018 16:44:56 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Nov 2018 09:44:09 -0700
Message-Id: <20181103164427.16125-8-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
References: <20181103164427.16125-1-robert.joslyn@redrectangle.org>
Subject: [rocko][PATCH 07/25] openssl_1.0: minor recipe formatting tweaks etc
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
X-List-Received-Date: Sat, 03 Nov 2018 16:44:58 -0000

From: Andre McCurdy <armccurdy@gmail.com>

Drop redundant setting of S to its default value, fix inconsistent
indent and re-order variables to align more closely to the OE
style-guide.

(From OE-Core rev: c36637a0304551bf2736bb15796947d9aaf00076)

(From OE-Core rev: 67cde33115798b298f7840cad34d8ef91b3b7fa2)

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl/openssl_1.0.2o.bb                 | 115 +++++++++---------
 1 file changed, 58 insertions(+), 57 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 39c4d12225..5692e97b62 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -46,7 +46,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
            "
 
-SRC_URI_append_class-target = "\
+SRC_URI_append_class-target = " \
            file://reproducible-cflags.patch \
            file://reproducible-mkbuildinf.patch \
            "
@@ -58,75 +58,55 @@ SRC_URI_append_class-nativesdk = " \
 SRC_URI[md5sum] = "44279b8557c3247cbe324e2322ecd114"
 SRC_URI[sha256sum] = "ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8089e4d"
 
-S = "${WORKDIR}/openssl-${PV}"
 UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
 
+inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
+
 PACKAGECONFIG ?= "cryptodev-linux"
 PACKAGECONFIG[perl] = ",,,"
 PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
 
-TERMIO_libc-musl = "-DTERMIOS"
-TERMIO ?= "-DTERMIO"
-# Avoid binaries being marked as requiring an executable stack since it 
-# doesn't(which causes and this causes issues with SELinux
-CFLAG = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
-	 ${TERMIO} ${CFLAGS} -Wall -Wa,--noexecstack"
-
-# For target side versions of openssl enable support for OCF Linux driver
-# if they are available.
-
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
-CFLAG_append_class-native = " -fPIC"
+# Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
+# vulnerability
+EXTRA_OECONF = "-no-ssl3"
 
 export DIRS = "crypto ssl apps engines"
-export EX_LIBS = "-lgcc -ldl"
 export AS = "${CC} -c"
-
+export EX_LIBS = "-lgcc -ldl"
 export OE_LDFLAGS = "${LDFLAGS}"
 
 # openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
 CCACHE = ""
 
-inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
+TERMIO ?= "-DTERMIO"
+TERMIO_libc-musl = "-DTERMIOS"
 
-PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
-FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
-FILES_libssl = "${libdir}/libssl${SOLIBS}"
-FILES_${PN} =+ " ${libdir}/ssl/*"
-FILES_${PN}-misc = "${libdir}/ssl/misc"
-RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
+CFLAG = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
+         ${TERMIO} ${CFLAGS} -Wall"
 
-# Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
-# package RRECOMMENDS on this package.  This will enable the configuration
-# file to be installed for both the base openssl package and the libcrypto
-# package since the base openssl package depends on the libcrypto package.
-FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
-CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
-RRECOMMENDS_libcrypto += "openssl-conf"
-RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
+# Avoid binaries being marked as requiring an executable stack since they don't
+# (and it causes issues with SELinux)
+CFLAG += "-Wa,--noexecstack"
 
-PACKAGES =+ "${PN}-engines"
-FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
+# For target side versions of openssl enable support for OCF Linux driver
+# if they are available.
+CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-# Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
-# vulnerability
-EXTRA_OECONF = " -no-ssl3"
+CFLAG_append_class-native = " -fPIC"
 
 do_configure_prepend_darwin () {
 	sed -i -e '/version-script=openssl\.ld/d' Configure
 }
 
-# The crypto_use_bigint patch means that perl's bignum module needs to be
-# installed, but some distributions (for example Fedora 23) don't ship it by
-# default.  As the resulting error is very misleading check for bignum before
-# building.
-do_configure_prepend() {
+do_configure () {
+	# The crypto_use_bigint patch means that perl's bignum module needs to be
+	# installed, but some distributions (for example Fedora 23) don't ship it by
+	# default.  As the resulting error is very misleading check for bignum before
+	# building.
 	if ! perl -Mbigint -e true; then
 		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
 	fi
-}
 
-do_configure () {
 	cd util
 	perl perlpath.pl ${STAGING_BINDIR_NATIVE}
 	cd ..
@@ -141,7 +121,7 @@ do_configure () {
 	linux-musl )
 		os=linux
 		;;
-		*)
+	*)
 		;;
 	esac
 	target="$os-${HOST_ARCH}"
@@ -213,19 +193,21 @@ do_configure () {
 		target=darwin-i386-cc
 		;;
 	esac
+
 	# inject machine-specific flags
 	sed -i -e "s|^\(\"$target\",\s*\"[^:]\+\):\([^:]\+\)|\1:${CFLAG}|g" Configure
-        useprefix=${prefix}
-        if [ "x$useprefix" = "x" ]; then
-                useprefix=/
-        fi        
+
+	useprefix=${prefix}
+	if [ "x$useprefix" = "x" ]; then
+		useprefix=/
+	fi
 	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
 	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=${libdirleaf} $target
 }
 
 do_compile_prepend_class-target () {
-    sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
-    oe_runmake depend
+	sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
+	oe_runmake depend
 	cc_sanitized=`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`
 	oe_runmake CC_INFO="${cc_sanitized}"
 }
@@ -290,8 +272,8 @@ do_install () {
 do_install_ptest () {
 	cp -r -L Makefile.org Makefile test ${D}${PTEST_PATH}
 
-        # Replace the path to native perl with the path to target perl
-        sed -i 's,^PERL=.*,PERL=${bindir}/perl,' ${D}${PTEST_PATH}/Makefile
+	# Replace the path to native perl with the path to target perl
+	sed -i 's,^PERL=.*,PERL=${bindir}/perl,' ${D}${PTEST_PATH}/Makefile
 
 	cp Configure config e_os.h ${D}${PTEST_PATH}
 	cp -r -L include ${D}${PTEST_PATH}
@@ -330,9 +312,9 @@ do_install_ptest () {
 
 	# Remove build host references
 	sed -i \
-       -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-       -e 's|${DEBUG_PREFIX_MAP}||g' \
-       ${D}${PTEST_PATH}/Makefile ${D}${PTEST_PATH}/Configure
+	-e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+	-e 's|${DEBUG_PREFIX_MAP}||g' \
+	${D}${PTEST_PATH}/Makefile ${D}${PTEST_PATH}/Configure
 }
 
 do_install_append_class-native() {
@@ -344,10 +326,29 @@ do_install_append_class-native() {
 }
 
 do_install_append_class-nativesdk() {
-    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-    install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
+# Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
+# package RRECOMMENDS on this package.  This will enable the configuration
+# file to be installed for both the base openssl package and the libcrypto
+# package since the base openssl package depends on the libcrypto package.
+
+PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
+
+FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
+FILES_libssl = "${libdir}/libssl${SOLIBS}"
+FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
+FILES_${PN}-misc = "${libdir}/ssl/misc"
+FILES_${PN} =+ "${libdir}/ssl/*"
 FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
+CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+
+RRECOMMENDS_libcrypto += "openssl-conf"
+RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
+RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.18.1


