Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.10038.1608032875540749137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 03:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: InIo+zI13HZCc2i7glCtLzEAZ8gkrBJ1saxVwqrz9araw0FWGtuxlPrQ5dB7KrBQsL9rEwP3QN
 WcM4WYlFuBNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="171354383"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="171354383"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2020 03:47:54 -0800
IronPort-SDR: qcJNYHr47/SPqpOc6o1mFFmjQOoSXVbK54c9D4UY7sAP7II+HjsXM2ZSr7nENGuuoK5tY3FSt0
 LvMpZFd+8wnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; 
   d="scan'208";a="336681099"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga003.jf.intel.com with ESMTP; 15 Dec 2020 03:47:52 -0800
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: Update 1.1.1h -> 1.1.1i
Date: Tue, 15 Dec 2020 19:47:51 +0800
Message-Id: <1608032871-33027-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

update version to 1.1.1i

openssl 1.1.1i Fixed NULL pointer deref in GENERAL_NAME_cmp (CVE-2020-1971)

updates include fix for CVE:
CVE-2020-1971

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 .../recipes-connectivity/openssl/openssl_1.1.1h.bb | 216 ---------------------
 .../recipes-connectivity/openssl/openssl_1.1.1i.bb | 216 +++++++++++++++++++++
 2 files changed, 216 insertions(+), 216 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
 create mode 100644 meta/recipes-connectivity/openssl/openssl_1.1.1i.bb

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
deleted file mode 100644
index 1827167..0000000
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb
+++ /dev/null
@@ -1,216 +0,0 @@
-SUMMARY = "Secure Socket Layer"
-DESCRIPTION = "Secure Socket Layer (SSL) binary and related cryptographic tools."
-HOMEPAGE = "http://www.openssl.org/"
-BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
-SECTION = "libs/network"
-
-# "openssl" here actually means both OpenSSL and SSLeay licenses apply
-# (see meta/files/common-licenses/OpenSSL to which "openssl" is SPDXLICENSEMAPped)
-LICENSE = "openssl"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
-
-DEPENDS = "hostperl-runtime-native"
-
-SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
-           file://run-ptest \
-           file://0001-skip-test_symbol_presence.patch \
-           file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
-           file://afalg.patch \
-           file://reproducible.patch \
-           "
-
-SRC_URI_append_class-nativesdk = " \
-           file://environment.d-openssl.sh \
-           "
-
-SRC_URI[sha256sum] = "5c9ca8774bd7b03e5784f26ae9e9e6d749c9da2438545077e6b3d755a06595d9"
-
-inherit lib_package multilib_header multilib_script ptest
-MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG_class-native = ""
-PACKAGECONFIG_class-nativesdk = ""
-
-PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
-
-B = "${WORKDIR}/build"
-do_configure[cleandirs] = "${B}"
-
-#| ./libcrypto.so: undefined reference to `getcontext'
-#| ./libcrypto.so: undefined reference to `setcontext'
-#| ./libcrypto.so: undefined reference to `makecontext'
-EXTRA_OECONF_append_libc-musl = " no-async"
-EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
-
-# adding devrandom prevents openssl from using getrandom() which is not available on older glibc versions
-# (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
-EXTRA_OECONF_class-native = "--with-rand-seed=os,devrandom"
-EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
-
-# Relying on hardcoded built-in paths causes openssl-native to not be relocateable from sstate.
-CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
-CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
-
-do_configure () {
-	os=${HOST_OS}
-	case $os in
-	linux-gnueabi |\
-	linux-gnuspe |\
-	linux-musleabi |\
-	linux-muslspe |\
-	linux-musl )
-		os=linux
-		;;
-	*)
-		;;
-	esac
-	target="$os-${HOST_ARCH}"
-	case $target in
-	linux-arm*)
-		target=linux-armv4
-		;;
-	linux-aarch64*)
-		target=linux-aarch64
-		;;
-	linux-i?86 | linux-viac3)
-		target=linux-x86
-		;;
-	linux-gnux32-x86_64 | linux-muslx32-x86_64 )
-		target=linux-x32
-		;;
-	linux-gnu64-x86_64)
-		target=linux-x86_64
-		;;
-	linux-mips | linux-mipsel)
-		# specifying TARGET_CC_ARCH prevents openssl from (incorrectly) adding target architecture flags
-		target="linux-mips32 ${TARGET_CC_ARCH}"
-		;;
-	linux-gnun32-mips*)
-		target=linux-mips64
-		;;
-	linux-*-mips64 | linux-mips64 | linux-*-mips64el | linux-mips64el)
-		target=linux64-mips64
-		;;
-	linux-microblaze* | linux-nios2* | linux-sh3 | linux-sh4 | linux-arc*)
-		target=linux-generic32
-		;;
-	linux-powerpc)
-		target=linux-ppc
-		;;
-	linux-powerpc64)
-		target=linux-ppc64
-		;;
-	linux-powerpc64le)
-		target=linux-ppc64le
-		;;
-	linux-riscv32)
-		target=linux-generic32
-		;;
-	linux-riscv64)
-		target=linux-generic64
-		;;
-	linux-sparc | linux-supersparc)
-		target=linux-sparcv9
-		;;
-	esac
-
-	useprefix=${prefix}
-	if [ "x$useprefix" = "x" ]; then
-		useprefix=/
-	fi
-	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
-	# environment variables set by bitbake. Adjust the environment variables instead.
-	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
-	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
-	perl ${B}/configdata.pm --dump
-}
-
-do_install () {
-	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
-
-	oe_multilib_header openssl/opensslconf.h
-
-	# Create SSL structure for packages such as ca-certificates which
-	# contain hard-coded paths to /etc/ssl. Debian does the same.
-	install -d ${D}${sysconfdir}/ssl
-	mv ${D}${libdir}/ssl-1.1/certs \
-	   ${D}${libdir}/ssl-1.1/private \
-	   ${D}${libdir}/ssl-1.1/openssl.cnf \
-	   ${D}${sysconfdir}/ssl/
-
-	# Although absolute symlinks would be OK for the target, they become
-	# invalid if native or nativesdk are relocated from sstate.
-	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-1.1/certs
-	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-1.1/private
-	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-1.1/openssl.cnf
-}
-
-do_install_append_class-native () {
-	create_wrapper ${D}${bindir}/openssl \
-	    OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
-	    SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
-	    SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
-	    OPENSSL_ENGINES=${libdir}/engines-1.1
-}
-
-do_install_append_class-nativesdk () {
-	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
-	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
-	sed 's|/usr/lib/ssl/|/usr/lib/ssl-1.1/|g' -i ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
-}
-
-PTEST_BUILD_HOST_FILES += "configdata.pm"
-PTEST_BUILD_HOST_PATTERN = "perl_version ="
-do_install_ptest () {
-	# Prune the build tree
-	rm -f ${B}/fuzz/*.* ${B}/test/*.*
-
-	cp ${S}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
-	cp -r ${S}/external ${B}/test ${S}/test ${B}/fuzz ${S}/util ${B}/util ${D}${PTEST_PATH}
-
-	# For test_shlibload
-	ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/
-	ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/
-
-	install -d ${D}${PTEST_PATH}/apps
-	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
-	install -m644 ${S}/apps/*.pem ${S}/apps/*.srl ${S}/apps/openssl.cnf ${D}${PTEST_PATH}/apps
-	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
-
-	install -d ${D}${PTEST_PATH}/engines
-	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
-}
-
-# Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
-# package RRECOMMENDS on this package. This will enable the configuration
-# file to be installed for both the openssl-bin package and the libcrypto
-# package since the openssl-bin package depends on the libcrypto package.
-
-PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
-
-FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
-FILES_libssl = "${libdir}/libssl${SOLIBS}"
-FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf \
-                      ${libdir}/ssl-1.1/openssl.cnf* \
-                      "
-FILES_${PN}-engines = "${libdir}/engines-1.1"
-FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
-FILES_${PN} =+ "${libdir}/ssl-1.1/*"
-FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
-
-CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
-
-RRECOMMENDS_libcrypto += "openssl-conf"
-RDEPENDS_${PN}-misc = "perl"
-RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
-
-RDEPENDS_${PN}-bin += "openssl-conf"
-
-BBCLASSEXTEND = "native nativesdk"
-
-CVE_PRODUCT = "openssl:openssl"
-
-# Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
-# Apache in meta-webserver is already recent enough
-CVE_CHECK_WHITELIST += "CVE-2019-0190"
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
new file mode 100644
index 0000000..52dbdf5
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1i.bb
@@ -0,0 +1,216 @@
+SUMMARY = "Secure Socket Layer"
+DESCRIPTION = "Secure Socket Layer (SSL) binary and related cryptographic tools."
+HOMEPAGE = "http://www.openssl.org/"
+BUGTRACKER = "http://www.openssl.org/news/vulnerabilities.html"
+SECTION = "libs/network"
+
+# "openssl" here actually means both OpenSSL and SSLeay licenses apply
+# (see meta/files/common-licenses/OpenSSL to which "openssl" is SPDXLICENSEMAPped)
+LICENSE = "openssl"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d343e62fc9c833710bbbed25f27364c8"
+
+DEPENDS = "hostperl-runtime-native"
+
+SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
+           file://run-ptest \
+           file://0001-skip-test_symbol_presence.patch \
+           file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
+           file://afalg.patch \
+           file://reproducible.patch \
+           "
+
+SRC_URI_append_class-nativesdk = " \
+           file://environment.d-openssl.sh \
+           "
+
+SRC_URI[sha256sum] = "e8be6a35fe41d10603c3cc635e93289ed00bf34b79671a3a4de64fcee00d5242"
+
+inherit lib_package multilib_header multilib_script ptest
+MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
+
+PACKAGECONFIG ?= ""
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
+
+PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
+
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
+#| ./libcrypto.so: undefined reference to `getcontext'
+#| ./libcrypto.so: undefined reference to `setcontext'
+#| ./libcrypto.so: undefined reference to `makecontext'
+EXTRA_OECONF_append_libc-musl = " no-async"
+EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
+
+# adding devrandom prevents openssl from using getrandom() which is not available on older glibc versions
+# (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
+EXTRA_OECONF_class-native = "--with-rand-seed=os,devrandom"
+EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
+
+# Relying on hardcoded built-in paths causes openssl-native to not be relocateable from sstate.
+CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
+CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
+
+do_configure () {
+	os=${HOST_OS}
+	case $os in
+	linux-gnueabi |\
+	linux-gnuspe |\
+	linux-musleabi |\
+	linux-muslspe |\
+	linux-musl )
+		os=linux
+		;;
+	*)
+		;;
+	esac
+	target="$os-${HOST_ARCH}"
+	case $target in
+	linux-arm*)
+		target=linux-armv4
+		;;
+	linux-aarch64*)
+		target=linux-aarch64
+		;;
+	linux-i?86 | linux-viac3)
+		target=linux-x86
+		;;
+	linux-gnux32-x86_64 | linux-muslx32-x86_64 )
+		target=linux-x32
+		;;
+	linux-gnu64-x86_64)
+		target=linux-x86_64
+		;;
+	linux-mips | linux-mipsel)
+		# specifying TARGET_CC_ARCH prevents openssl from (incorrectly) adding target architecture flags
+		target="linux-mips32 ${TARGET_CC_ARCH}"
+		;;
+	linux-gnun32-mips*)
+		target=linux-mips64
+		;;
+	linux-*-mips64 | linux-mips64 | linux-*-mips64el | linux-mips64el)
+		target=linux64-mips64
+		;;
+	linux-microblaze* | linux-nios2* | linux-sh3 | linux-sh4 | linux-arc*)
+		target=linux-generic32
+		;;
+	linux-powerpc)
+		target=linux-ppc
+		;;
+	linux-powerpc64)
+		target=linux-ppc64
+		;;
+	linux-powerpc64le)
+		target=linux-ppc64le
+		;;
+	linux-riscv32)
+		target=linux-generic32
+		;;
+	linux-riscv64)
+		target=linux-generic64
+		;;
+	linux-sparc | linux-supersparc)
+		target=linux-sparcv9
+		;;
+	esac
+
+	useprefix=${prefix}
+	if [ "x$useprefix" = "x" ]; then
+		useprefix=/
+	fi
+	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
+	# environment variables set by bitbake. Adjust the environment variables instead.
+	HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
+	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
+	perl ${B}/configdata.pm --dump
+}
+
+do_install () {
+	oe_runmake DESTDIR="${D}" MANDIR="${mandir}" MANSUFFIX=ssl install
+
+	oe_multilib_header openssl/opensslconf.h
+
+	# Create SSL structure for packages such as ca-certificates which
+	# contain hard-coded paths to /etc/ssl. Debian does the same.
+	install -d ${D}${sysconfdir}/ssl
+	mv ${D}${libdir}/ssl-1.1/certs \
+	   ${D}${libdir}/ssl-1.1/private \
+	   ${D}${libdir}/ssl-1.1/openssl.cnf \
+	   ${D}${sysconfdir}/ssl/
+
+	# Although absolute symlinks would be OK for the target, they become
+	# invalid if native or nativesdk are relocated from sstate.
+	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/certs')} ${D}${libdir}/ssl-1.1/certs
+	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/private')} ${D}${libdir}/ssl-1.1/private
+	ln -sf ${@oe.path.relative('${libdir}/ssl-1.1', '${sysconfdir}/ssl/openssl.cnf')} ${D}${libdir}/ssl-1.1/openssl.cnf
+}
+
+do_install_append_class-native () {
+	create_wrapper ${D}${bindir}/openssl \
+	    OPENSSL_CONF=${libdir}/ssl-1.1/openssl.cnf \
+	    SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
+	    SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
+	    OPENSSL_ENGINES=${libdir}/engines-1.1
+}
+
+do_install_append_class-nativesdk () {
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+	sed 's|/usr/lib/ssl/|/usr/lib/ssl-1.1/|g' -i ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+}
+
+PTEST_BUILD_HOST_FILES += "configdata.pm"
+PTEST_BUILD_HOST_PATTERN = "perl_version ="
+do_install_ptest () {
+	# Prune the build tree
+	rm -f ${B}/fuzz/*.* ${B}/test/*.*
+
+	cp ${S}/Configure ${B}/configdata.pm ${D}${PTEST_PATH}
+	cp -r ${S}/external ${B}/test ${S}/test ${B}/fuzz ${S}/util ${B}/util ${D}${PTEST_PATH}
+
+	# For test_shlibload
+	ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/
+	ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/
+
+	install -d ${D}${PTEST_PATH}/apps
+	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
+	install -m644 ${S}/apps/*.pem ${S}/apps/*.srl ${S}/apps/openssl.cnf ${D}${PTEST_PATH}/apps
+	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
+
+	install -d ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
+}
+
+# Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
+# package RRECOMMENDS on this package. This will enable the configuration
+# file to be installed for both the openssl-bin package and the libcrypto
+# package since the openssl-bin package depends on the libcrypto package.
+
+PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
+
+FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
+FILES_libssl = "${libdir}/libssl${SOLIBS}"
+FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf \
+                      ${libdir}/ssl-1.1/openssl.cnf* \
+                      "
+FILES_${PN}-engines = "${libdir}/engines-1.1"
+FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
+FILES_${PN} =+ "${libdir}/ssl-1.1/*"
+FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
+
+CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+
+RRECOMMENDS_libcrypto += "openssl-conf"
+RDEPENDS_${PN}-misc = "perl"
+RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
+
+RDEPENDS_${PN}-bin += "openssl-conf"
+
+BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "openssl:openssl"
+
+# Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
+# Apache in meta-webserver is already recent enough
+CVE_CHECK_WHITELIST += "CVE-2019-0190"
-- 
2.7.4

