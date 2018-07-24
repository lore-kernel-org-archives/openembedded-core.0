Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 846CA6FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:39:01 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id z7-v6so1046259plo.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=llLqHnOCCqrUfTv0fI16JebOoP/Qefr4XxN5h9vZwcQ=;
	b=rbRfPEhfPL7dJVNHjJJfzLxON94Zbp41X4Q7jQmlaD2odzFe663xyPbdy0IfGUuaxW
	B65Yb5HurcMYUubFZ4WWVGgYFCsSXHmNKoSS1vYSAYKkQhohq1Sb9mHvzWnLcCnhVMNs
	egU1lva5C0jWJ3HPhM9cIojbsIkOZgAc2PjSGoSwSOKlkGyg6iljYCgUXLUKRXcfTbCK
	rCwZ+ckUB6sFPbDdRqKw5gY8Si6utAf5fqQv96XgLiYXzkmrzO0GZlf6fXmA4oBZLQzF
	OBJA6EOZBoiUWISdZOqehFMrf6dnL6RerMdJ49tRg0aKvkJhW/S0DHLo1HiV5AN/5XT5
	JbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=llLqHnOCCqrUfTv0fI16JebOoP/Qefr4XxN5h9vZwcQ=;
	b=rKjZGjrlKbA4tuS0+fst4M6XIyvi8btYBgdSsbopVKDyR5+d17uGBm5SwBWdlyeRLu
	vMtsHVGZSiAtcxYBvSZHh0SIZgrMGOAJM3qcX4/ZKF8BWUyhr7Cd54lUr9WlUQ4mLe5T
	lSQfiUgKGzoLOdatQwE7jxD6L44nwskEI20GYTzyMxTLc0yJhQ83gqIAohJxwfnfKdWi
	hR3bPBjfuxk1pHbTr2qKmRQCSrCt6vFXZgldi6lTTJafZK3TIzWikWrJUqCEmOG0esbO
	pAFovZZRVhLQG+CAf90wKhr347Kb5tLrsP2LAIFWSiEX+/w/nq12iQTHTY4OI2GmgmYZ
	uxOw==
X-Gm-Message-State: AOUpUlFHLz+kWnISv7VNfqqbeZCJJzs1eBDTXtInqc6sY2Ma3VbbhyP2
	/XRcweS3t2I06/5bcKvIPWpBQ6av
X-Google-Smtp-Source: AAOMgpeJW1QOLTOVBngctqMkoO4URPK/8plzAF0zqBZIEqHU9xIkB6YaL9vr66jvsc+DIv6zdmqKdg==
X-Received: by 2002:a17:902:bc41:: with SMTP id
	t1-v6mr15394452plz.26.1532399942231; 
	Mon, 23 Jul 2018 19:39:02 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y132-v6sm14746314pfb.91.2018.07.23.19.39.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jul 2018 19:39:01 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 19:38:47 -0700
Message-Id: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/9] openssl_1.0: merge openssl10.inc into the openssl_1.0.2o.bb recipe
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
X-List-Received-Date: Tue, 24 Jul 2018 02:39:01 -0000

The openssl10.inc include file only has one user, so we can improve
maintainability by merging the include file into the recipe which
uses it.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl10.inc    | 296 --------------------
 .../recipes-connectivity/openssl/openssl_1.0.2o.bb | 310 ++++++++++++++++++++-
 2 files changed, 300 insertions(+), 306 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl10.inc

diff --git a/meta/recipes-connectivity/openssl/openssl10.inc b/meta/recipes-connectivity/openssl/openssl10.inc
deleted file mode 100644
index 1f8834f..0000000
--- a/meta/recipes-connectivity/openssl/openssl10.inc
+++ /dev/null
@@ -1,296 +0,0 @@
-SUMMARY = "Secure Socket Layer"
-DESCRIPTION = "Secure Socket Layer (SSL) binary and related cryptographic tools."
-HOMEPAGE = "http://www.openssl.org/"
-BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
-SECTION = "libs/network"
-
-# "openssl | SSLeay" dual license
-LICENSE = "openssl"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
-
-DEPENDS = "makedepend-native hostperl-runtime-native"
-DEPENDS_append_class-target = " openssl-native"
-
-PROVIDES += "openssl10"
-
-SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
-          "
-S = "${WORKDIR}/openssl-${PV}"
-UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
-
-PACKAGECONFIG ?= "cryptodev-linux"
-PACKAGECONFIG[perl] = ",,,"
-PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
-
-TERMIO_libc-musl = "-DTERMIOS"
-TERMIO ?= "-DTERMIO"
-# Avoid binaries being marked as requiring an executable stack since it 
-# doesn't(which causes and this causes issues with SELinux
-CFLAG = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
-	 ${TERMIO} ${CFLAGS} -Wall -Wa,--noexecstack"
-
-export DIRS = "crypto ssl apps"
-export EX_LIBS = "-lgcc -ldl"
-export AS = "${CC} -c"
-
-# openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
-CCACHE = ""
-
-inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
-
-PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
-FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
-FILES_libssl = "${libdir}/libssl${SOLIBS}"
-FILES_${PN} =+ " ${libdir}/ssl/*"
-FILES_${PN}-misc = "${libdir}/ssl/misc"
-RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
-
-# Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
-# package RRECOMMENDS on this package.  This will enable the configuration
-# file to be installed for both the base openssl package and the libcrypto
-# package since the base openssl package depends on the libcrypto package.
-FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
-CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
-RRECOMMENDS_libcrypto += "openssl-conf"
-RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
-
-# Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
-# vulnerability
-EXTRA_OECONF = " -no-ssl3"
-
-do_configure_prepend_darwin () {
-	sed -i -e '/version-script=openssl\.ld/d' Configure
-}
-
-do_configure () {
-	cd util
-	perl perlpath.pl ${STAGING_BINDIR_NATIVE}
-	cd ..
-	ln -sf apps/openssl.pod crypto/crypto.pod ssl/ssl.pod doc/
-
-	os=${HOST_OS}
-	case $os in
-	linux-gnueabi |\
-	linux-gnuspe |\
-	linux-musleabi |\
-	linux-muslspe |\
-	linux-musl )
-		os=linux
-		;;
-		*)
-		;;
-	esac
-	target="$os-${HOST_ARCH}"
-	case $target in
-	linux-arm)
-		target=linux-armv4
-		;;
-	linux-armeb)
-		target=linux-elf-armeb
-		;;
-	linux-aarch64*)
-		target=linux-aarch64
-		;;
-	linux-sh3)
-		target=debian-sh3
-		;;
-	linux-sh4)
-		target=debian-sh4
-		;;
-	linux-i486)
-		target=debian-i386-i486
-		;;
-	linux-i586 | linux-viac3)
-		target=debian-i386-i586
-		;;
-	linux-i686)
-		target=debian-i386-i686/cmov
-		;;
-	linux-gnux32-x86_64 | linux-muslx32-x86_64 )
-		target=linux-x32
-		;;
-	linux-gnu64-x86_64)
-		target=linux-x86_64
-		;;
-	linux-gnun32-mips*el)
-		target=debian-mipsn32el
-		;;
-	linux-gnun32-mips*)
-		target=debian-mipsn32
-		;;
-	linux-mips*64*el)
-		target=debian-mips64el
-		;;
-	linux-mips*64*)
-		target=debian-mips64
-		;;
-	linux-mips*el)
-		target=debian-mipsel
-		;;
-	linux-mips*)
-		target=debian-mips
-		;;
-	linux-microblaze*|linux-nios2*|linux-gnu*ilp32**)
-		target=linux-generic32
-		;;
-	linux-powerpc)
-		target=linux-ppc
-		;;
-	linux-powerpc64)
-		target=linux-ppc64
-		;;
-	linux-riscv64)
-		target=linux-generic64
-		;;
-	linux-riscv32)
-		target=linux-generic32
-		;;
-	linux-supersparc)
-		target=linux-sparcv8
-		;;
-	linux-sparc)
-		target=linux-sparcv8
-		;;
-	darwin-i386)
-		target=darwin-i386-cc
-		;;
-	esac
-	# inject machine-specific flags
-	sed -i -e "s|^\(\"$target\",\s*\"[^:]\+\):\([^:]\+\)|\1:${CFLAG}|g" Configure
-        useprefix=${prefix}
-        if [ "x$useprefix" = "x" ]; then
-                useprefix=/
-        fi        
-	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
-	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=${libdirleaf} $target
-}
-
-do_compile_prepend_class-target () {
-    sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
-    oe_runmake depend
-	cc_sanitized=`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`
-	oe_runmake CC_INFO="${cc_sanitized}"
-}
-
-do_compile () {
-	oe_runmake depend
-	oe_runmake
-}
-
-do_compile_ptest () {
-	# build dependencies for test directory too
-	export DIRS="$DIRS test"
-	oe_runmake depend
-	oe_runmake buildtest
-}
-
-do_install () {
-	# Create ${D}/${prefix} to fix parallel issues
-	mkdir -p ${D}/${prefix}/
-
-	oe_runmake INSTALL_PREFIX="${D}" MANDIR="${mandir}" install
-
-	oe_libinstall -so libcrypto ${D}${libdir}
-	oe_libinstall -so libssl ${D}${libdir}
-
-	install -d ${D}${includedir}
-	cp --dereference -R include/openssl ${D}${includedir}
-
-	install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
-	sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
-
-	oe_multilib_header openssl/opensslconf.h
-	if [ "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}" ]; then
-		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
-		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/tsget
-	else
-		rm -f ${D}${libdir}/ssl/misc/CA.pl ${D}${libdir}/ssl/misc/tsget
-	fi
-
-	# Create SSL structure
-	install -d ${D}${sysconfdir}/ssl/
-	mv ${D}${libdir}/ssl/openssl.cnf \
-	   ${D}${libdir}/ssl/certs \
-	   ${D}${libdir}/ssl/private \
-	   \
-	   ${D}${sysconfdir}/ssl/
-	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
-	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
-	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl/openssl.cnf
-
-	# Rename man pages to prefix openssl10-*
-	for f in `find ${D}${mandir} -type f`; do
-	    mv $f $(dirname $f)/openssl10-$(basename $f)
-	done
-	for f in `find ${D}${mandir} -type l`; do
-	    ln_f=`readlink $f`
-	    rm -f $f
-	    ln -s openssl10-$ln_f $(dirname $f)/openssl10-$(basename $f)
-	done
-}
-
-do_install_ptest () {
-	cp -r -L Makefile.org Makefile test ${D}${PTEST_PATH}
-
-        # Replace the path to native perl with the path to target perl
-        sed -i 's,^PERL=.*,PERL=${bindir}/perl,' ${D}${PTEST_PATH}/Makefile
-
-	cp Configure config e_os.h ${D}${PTEST_PATH}
-	cp -r -L include ${D}${PTEST_PATH}
-	ln -sf ${libdir}/libcrypto.a ${D}${PTEST_PATH}
-	ln -sf ${libdir}/libssl.a ${D}${PTEST_PATH}
-	mkdir -p ${D}${PTEST_PATH}/crypto
-	cp crypto/constant_time_locl.h ${D}${PTEST_PATH}/crypto
-	cp -r certs ${D}${PTEST_PATH}
-	mkdir -p ${D}${PTEST_PATH}/apps
-	ln -sf ${libdir}/ssl/misc/CA.sh  ${D}${PTEST_PATH}/apps
-	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${PTEST_PATH}/apps
-	ln -sf ${bindir}/openssl         ${D}${PTEST_PATH}/apps
-	cp apps/server.pem              ${D}${PTEST_PATH}/apps
-	cp apps/server2.pem             ${D}${PTEST_PATH}/apps
-	mkdir -p ${D}${PTEST_PATH}/util
-	install util/opensslwrap.sh    ${D}${PTEST_PATH}/util
-	install util/shlib_wrap.sh     ${D}${PTEST_PATH}/util
-	# Time stamps are relevant for "make alltests", otherwise
-	# make may try to recompile binaries. Not only must the
-	# binary files be newer than the sources, they also must
-	# be more recent than the header files in /usr/include.
-	#
-	# Using "cp -a" is not sufficient, because do_install
-	# does not preserve the original time stamps.
-	#
-	# So instead of using the original file stamps, we set
-	# the current time for all files. Binaries will get
-	# modified again later when stripping them, but that's okay.
-	touch ${D}${PTEST_PATH}
-	find ${D}${PTEST_PATH} -type f -print0 | xargs --verbose -0 touch -r ${D}${PTEST_PATH}
-
-	# exclude binary files or the package won't install
-	for d in ssltest_old v3ext x509aux; do
-		rm -rf ${D}${libdir}/${BPN}/ptest/test/$d
-	done
-
-	# Remove build host references
-	sed -i \
-       -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-       -e 's|${DEBUG_PREFIX_MAP}||g' \
-       ${D}${PTEST_PATH}/Makefile ${D}${PTEST_PATH}/Configure
-}
-
-do_install_append_class-native() {
-	create_wrapper ${D}${bindir}/openssl \
-	    OPENSSL_CONF=${libdir}/ssl/openssl.cnf \
-	    SSL_CERT_DIR=${libdir}/ssl/certs \
-	    SSL_CERT_FILE=${libdir}/ssl/cert.pem \
-	    OPENSSL_ENGINES=${libdir}/ssl/engines
-}
-
-do_install_append_class-nativesdk() {
-    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-    install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
-}
-
-FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
-
-BBCLASSEXTEND = "native nativesdk"
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index 7cae553..619f3d8 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -1,17 +1,20 @@
-require openssl10.inc
-
-# For target side versions of openssl enable support for OCF Linux driver
-# if they are available.
-
-CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
-CFLAG_append_class-native = " -fPIC"
+SUMMARY = "Secure Socket Layer"
+DESCRIPTION = "Secure Socket Layer (SSL) binary and related cryptographic tools."
+HOMEPAGE = "http://www.openssl.org/"
+BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
+SECTION = "libs/network"
 
+# "openssl | SSLeay" dual license
+LICENSE = "openssl"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f475368924827d06d4b416111c8bdb77"
 
-export DIRS = "crypto ssl apps engines"
-export OE_LDFLAGS="${LDFLAGS}"
+DEPENDS = "makedepend-native hostperl-runtime-native"
+DEPENDS_append_class-target = " openssl-native"
+
+PROVIDES += "openssl10"
 
-SRC_URI += "file://find.pl;subdir=openssl-${PV}/util/ \
+SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
+           file://find.pl;subdir=openssl-${PV}/util/ \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://configure-targets.patch \
@@ -55,9 +58,64 @@ SRC_URI_append_class-nativesdk = " \
 SRC_URI[md5sum] = "44279b8557c3247cbe324e2322ecd114"
 SRC_URI[sha256sum] = "ec3f5c9714ba0fd45cb4e087301eb1336c317e0d20b575a125050470e8089e4d"
 
+S = "${WORKDIR}/openssl-${PV}"
+UPSTREAM_CHECK_REGEX = "openssl-(?P<pver>1\.0.+)\.tar"
+
+PACKAGECONFIG ?= "cryptodev-linux"
+PACKAGECONFIG[perl] = ",,,"
+PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryptodev-linux"
+
+TERMIO_libc-musl = "-DTERMIOS"
+TERMIO ?= "-DTERMIO"
+# Avoid binaries being marked as requiring an executable stack since it 
+# doesn't(which causes and this causes issues with SELinux
+CFLAG = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
+	 ${TERMIO} ${CFLAGS} -Wall -Wa,--noexecstack"
+
+# For target side versions of openssl enable support for OCF Linux driver
+# if they are available.
+
+CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
+CFLAG_append_class-native = " -fPIC"
+
+export DIRS = "crypto ssl apps engines"
+export EX_LIBS = "-lgcc -ldl"
+export AS = "${CC} -c"
+
+export OE_LDFLAGS = "${LDFLAGS}"
+
+# openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
+CCACHE = ""
+
+inherit pkgconfig siteinfo multilib_header ptest relative_symlinks
+
+PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
+FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
+FILES_libssl = "${libdir}/libssl${SOLIBS}"
+FILES_${PN} =+ " ${libdir}/ssl/*"
+FILES_${PN}-misc = "${libdir}/ssl/misc"
+RDEPENDS_${PN}-misc = "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}"
+
+# Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
+# package RRECOMMENDS on this package.  This will enable the configuration
+# file to be installed for both the base openssl package and the libcrypto
+# package since the base openssl package depends on the libcrypto package.
+FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+RRECOMMENDS_libcrypto += "openssl-conf"
+RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
+
 PACKAGES =+ "${PN}-engines"
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
 
+# Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
+# vulnerability
+EXTRA_OECONF = " -no-ssl3"
+
+do_configure_prepend_darwin () {
+	sed -i -e '/version-script=openssl\.ld/d' Configure
+}
+
 # The crypto_use_bigint patch means that perl's bignum module needs to be
 # installed, but some distributions (for example Fedora 23) don't ship it by
 # default.  As the resulting error is very misleading check for bignum before
@@ -67,3 +125,235 @@ do_configure_prepend() {
 		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
 	fi
 }
+
+do_configure () {
+	cd util
+	perl perlpath.pl ${STAGING_BINDIR_NATIVE}
+	cd ..
+	ln -sf apps/openssl.pod crypto/crypto.pod ssl/ssl.pod doc/
+
+	os=${HOST_OS}
+	case $os in
+	linux-gnueabi |\
+	linux-gnuspe |\
+	linux-musleabi |\
+	linux-muslspe |\
+	linux-musl )
+		os=linux
+		;;
+		*)
+		;;
+	esac
+	target="$os-${HOST_ARCH}"
+	case $target in
+	linux-arm)
+		target=linux-armv4
+		;;
+	linux-armeb)
+		target=linux-elf-armeb
+		;;
+	linux-aarch64*)
+		target=linux-aarch64
+		;;
+	linux-sh3)
+		target=debian-sh3
+		;;
+	linux-sh4)
+		target=debian-sh4
+		;;
+	linux-i486)
+		target=debian-i386-i486
+		;;
+	linux-i586 | linux-viac3)
+		target=debian-i386-i586
+		;;
+	linux-i686)
+		target=debian-i386-i686/cmov
+		;;
+	linux-gnux32-x86_64 | linux-muslx32-x86_64 )
+		target=linux-x32
+		;;
+	linux-gnu64-x86_64)
+		target=linux-x86_64
+		;;
+	linux-gnun32-mips*el)
+		target=debian-mipsn32el
+		;;
+	linux-gnun32-mips*)
+		target=debian-mipsn32
+		;;
+	linux-mips*64*el)
+		target=debian-mips64el
+		;;
+	linux-mips*64*)
+		target=debian-mips64
+		;;
+	linux-mips*el)
+		target=debian-mipsel
+		;;
+	linux-mips*)
+		target=debian-mips
+		;;
+	linux-microblaze*|linux-nios2*|linux-gnu*ilp32**)
+		target=linux-generic32
+		;;
+	linux-powerpc)
+		target=linux-ppc
+		;;
+	linux-powerpc64)
+		target=linux-ppc64
+		;;
+	linux-riscv64)
+		target=linux-generic64
+		;;
+	linux-riscv32)
+		target=linux-generic32
+		;;
+	linux-supersparc)
+		target=linux-sparcv8
+		;;
+	linux-sparc)
+		target=linux-sparcv8
+		;;
+	darwin-i386)
+		target=darwin-i386-cc
+		;;
+	esac
+	# inject machine-specific flags
+	sed -i -e "s|^\(\"$target\",\s*\"[^:]\+\):\([^:]\+\)|\1:${CFLAG}|g" Configure
+        useprefix=${prefix}
+        if [ "x$useprefix" = "x" ]; then
+                useprefix=/
+        fi        
+	libdirleaf="$(echo ${libdir} | sed s:$useprefix::)"
+	perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --openssldir=${libdir}/ssl --libdir=${libdirleaf} $target
+}
+
+do_compile_prepend_class-target () {
+    sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
+    oe_runmake depend
+	cc_sanitized=`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`
+	oe_runmake CC_INFO="${cc_sanitized}"
+}
+
+do_compile () {
+	oe_runmake depend
+	oe_runmake
+}
+
+do_compile_ptest () {
+	# build dependencies for test directory too
+	export DIRS="$DIRS test"
+	oe_runmake depend
+	oe_runmake buildtest
+}
+
+do_install () {
+	# Create ${D}/${prefix} to fix parallel issues
+	mkdir -p ${D}/${prefix}/
+
+	oe_runmake INSTALL_PREFIX="${D}" MANDIR="${mandir}" install
+
+	oe_libinstall -so libcrypto ${D}${libdir}
+	oe_libinstall -so libssl ${D}${libdir}
+
+	install -d ${D}${includedir}
+	cp --dereference -R include/openssl ${D}${includedir}
+
+	install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
+	sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
+
+	oe_multilib_header openssl/opensslconf.h
+	if [ "${@bb.utils.filter('PACKAGECONFIG', 'perl', d)}" ]; then
+		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/CA.pl
+		sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/ssl/misc/tsget
+	else
+		rm -f ${D}${libdir}/ssl/misc/CA.pl ${D}${libdir}/ssl/misc/tsget
+	fi
+
+	# Create SSL structure
+	install -d ${D}${sysconfdir}/ssl/
+	mv ${D}${libdir}/ssl/openssl.cnf \
+	   ${D}${libdir}/ssl/certs \
+	   ${D}${libdir}/ssl/private \
+	   \
+	   ${D}${sysconfdir}/ssl/
+	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
+	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
+	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl/openssl.cnf
+
+	# Rename man pages to prefix openssl10-*
+	for f in `find ${D}${mandir} -type f`; do
+	    mv $f $(dirname $f)/openssl10-$(basename $f)
+	done
+	for f in `find ${D}${mandir} -type l`; do
+	    ln_f=`readlink $f`
+	    rm -f $f
+	    ln -s openssl10-$ln_f $(dirname $f)/openssl10-$(basename $f)
+	done
+}
+
+do_install_ptest () {
+	cp -r -L Makefile.org Makefile test ${D}${PTEST_PATH}
+
+        # Replace the path to native perl with the path to target perl
+        sed -i 's,^PERL=.*,PERL=${bindir}/perl,' ${D}${PTEST_PATH}/Makefile
+
+	cp Configure config e_os.h ${D}${PTEST_PATH}
+	cp -r -L include ${D}${PTEST_PATH}
+	ln -sf ${libdir}/libcrypto.a ${D}${PTEST_PATH}
+	ln -sf ${libdir}/libssl.a ${D}${PTEST_PATH}
+	mkdir -p ${D}${PTEST_PATH}/crypto
+	cp crypto/constant_time_locl.h ${D}${PTEST_PATH}/crypto
+	cp -r certs ${D}${PTEST_PATH}
+	mkdir -p ${D}${PTEST_PATH}/apps
+	ln -sf ${libdir}/ssl/misc/CA.sh  ${D}${PTEST_PATH}/apps
+	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${PTEST_PATH}/apps
+	ln -sf ${bindir}/openssl         ${D}${PTEST_PATH}/apps
+	cp apps/server.pem              ${D}${PTEST_PATH}/apps
+	cp apps/server2.pem             ${D}${PTEST_PATH}/apps
+	mkdir -p ${D}${PTEST_PATH}/util
+	install util/opensslwrap.sh    ${D}${PTEST_PATH}/util
+	install util/shlib_wrap.sh     ${D}${PTEST_PATH}/util
+	# Time stamps are relevant for "make alltests", otherwise
+	# make may try to recompile binaries. Not only must the
+	# binary files be newer than the sources, they also must
+	# be more recent than the header files in /usr/include.
+	#
+	# Using "cp -a" is not sufficient, because do_install
+	# does not preserve the original time stamps.
+	#
+	# So instead of using the original file stamps, we set
+	# the current time for all files. Binaries will get
+	# modified again later when stripping them, but that's okay.
+	touch ${D}${PTEST_PATH}
+	find ${D}${PTEST_PATH} -type f -print0 | xargs --verbose -0 touch -r ${D}${PTEST_PATH}
+
+	# exclude binary files or the package won't install
+	for d in ssltest_old v3ext x509aux; do
+		rm -rf ${D}${libdir}/${BPN}/ptest/test/$d
+	done
+
+	# Remove build host references
+	sed -i \
+       -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+       -e 's|${DEBUG_PREFIX_MAP}||g' \
+       ${D}${PTEST_PATH}/Makefile ${D}${PTEST_PATH}/Configure
+}
+
+do_install_append_class-native() {
+	create_wrapper ${D}${bindir}/openssl \
+	    OPENSSL_CONF=${libdir}/ssl/openssl.cnf \
+	    SSL_CERT_DIR=${libdir}/ssl/certs \
+	    SSL_CERT_FILE=${libdir}/ssl/cert.pem \
+	    OPENSSL_ENGINES=${libdir}/ssl/engines
+}
+
+do_install_append_class-nativesdk() {
+    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+    install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+}
+
+FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


