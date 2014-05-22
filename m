Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AE5BA65EDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:59:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4M9xhZT025947 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:59:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cxbZpzuqsmW4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:59:43 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4M9xe2T025934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:59:42 +0100
Message-ID: <1400752773.17834.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 10:59:33 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [RFC/RFT PATCH] binconfig-disabled: Add class and use
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
X-List-Received-Date: Thu, 22 May 2014 09:59:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This adds a binconfig-disabled class which can be used by recipes where
a -config file is installed but we wish to disable it and just rely on
the .pc files instead.

Rather than simply deleting it, we make the script "exit 1" so that it
can be found in PATH and raise a build error rather than something
silently falling back to the build system for example.

Rather than randomly finding -config files, this adds in the
specification of a list of binconfig scripts which is more deterministic
and maintainable moving forward.

This patch converts various users in OE-Core to use this, a world build
of OE-Core tests out ok with this change. There will likely be issues in
other layers however, hence this being a RFT.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/binconfig-disabled.bbclass b/meta/classes/binconfig-disabled.bbclass
new file mode 100644
index 0000000..1308358
--- /dev/null
+++ b/meta/classes/binconfig-disabled.bbclass
@@ -0,0 +1,12 @@
+#
+# Class to disable binconfig files instead of installing them
+#
+
+FILES_${PN}-dev += "${bindir}/*-config"
+
+do_install_append () {
+	for x in ${BINCONFIG}; do
+		echo "#!/bin/sh" > ${D}$x
+		echo "exit 1" >> ${D}$x
+	done
+}
diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 177b70f..8a9fa9e 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -19,7 +19,9 @@ INC_PR = "r5"
 
 SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
 
-inherit autotools binconfig
+BINCONFIG = "${bindir}/pcap-config"
+
+inherit autotools binconfig-disabled
 
 EXTRA_OECONF = "--with-pcap=linux"
 
diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 60bb6b8..eebf990 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -21,7 +21,9 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml2-CVE-2014-0191-fix.patch \
           "
 
-inherit autotools pkgconfig binconfig pythonnative ptest
+BINCONFIG = "${bindir}/xml2-config"
+
+inherit autotools pkgconfig binconfig-disabled pythonnative ptest
 
 RDEPENDS_${PN}-ptest_append_libc-glibc += "eglibc-gconv-ebcdic-us eglibc-gconv-ibm1141"
 
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index f0a4044..521d0e4 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -8,7 +8,9 @@ DEPENDS = "ncurses-native"
 DEPENDS_class-native = ""
 INC_PR = "r15"
 
-inherit autotools binconfig multilib_header
+BINCONFIG = "${bindir}/ncurses-config"
+
+inherit autotools binconfig-disabled multilib_header
 
 # Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
 SRC_URI = "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz"
diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index f2518e9..51dc09b 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -19,7 +19,9 @@ S = "${WORKDIR}/DirectFB-${PV}"
 
 LDFLAGS_append =" -lts -lm"
 
-inherit autotools binconfig pkgconfig
+BINCONFIG = "${bindir}/directfb-config"
+
+inherit autotools binconfig-disabled pkgconfig
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[jpeg2000] = "--enable-jpeg2000,--disable-jpeg2000,jasper"
diff --git a/meta/recipes-graphics/freetype/freetype_2.5.3.bb b/meta/recipes-graphics/freetype/freetype_2.5.3.bb
index 5d239e8..0944d83 100644
--- a/meta/recipes-graphics/freetype/freetype_2.5.3.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.5.3.bb
@@ -17,7 +17,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2"
 SRC_URI[md5sum] = "d6b60f06bfc046e43ab2a6cbfd171d65"
 SRC_URI[sha256sum] = "c0848b29d52ef3ca27ad92e08351f023c5e24ce8cea7d8fe69fc96358e65f75e"
 
-inherit autotools-brokensep pkgconfig binconfig multilib_header
+BINCONFIG = "${bindir}/freetype-config"
+
+inherit autotools-brokensep pkgconfig binconfig-disabled multilib_header
 
 LIBTOOL = "${S}/builds/unix/${HOST_SYS}-libtool"
 EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index 4a77121..f81d862 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -30,7 +30,9 @@ S = "${WORKDIR}/SDL-${PV}"
 SRC_URI[md5sum] = "9d96df8417572a2afb781a7c4c811a85"
 SRC_URI[sha256sum] = "d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00"
 
-inherit autotools lib_package binconfig pkgconfig
+BINCONFIG = "${bindir}/sdl-config"
+
+inherit autotools lib_package binconfig-disabled pkgconfig
 
 EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers \
                 --enable-file --disable-oss --disable-esd --disable-arts \
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.10.bb b/meta/recipes-multimedia/libpng/libpng_1.6.10.bb
index 0f514f8..babf87e 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.10.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.10.bb
@@ -15,7 +15,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/${PV}/libpng-${PV}
 SRC_URI[md5sum] = "5f414b20f683b1d96b163c89e3eff768"
 SRC_URI[sha256sum] = "4003f0fd0e36110a2b742fc5b9e1ab93ed7a7ab57ae8dc65f0e8101458775a56"
 
-inherit autotools binconfig pkgconfig
+BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
+
+inherit autotools binconfig-disabled pkgconfig
 
 # Work around missing symbols
 EXTRA_OECONF_append_arm = " ${@bb.utils.contains("TUNE_FEATURES", "neon", "--enable-arm-neon=on", "--enable-arm-neon=off" ,d)}"
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.3.bb b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
index 9d21ade..d21d6e5 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.4.3.bb
@@ -19,7 +19,9 @@ DEPENDS = "libgpg-error libassuan"
 
 EXTRA_OECONF = "--with-gpg=${bindir}/gpg --without-gpgsm"
 
-inherit autotools texinfo binconfig
+BINCONFIG = "${bindir}/gpgme-config"
+
+inherit autotools texinfo binconfig-disabled
 
 PACKAGES =+ "${PN}-pthread"
 FILES_${PN}-pthread = "${libdir}/libgpgme-pthread.so.*"
diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index c592f85..deb1ad4 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -12,7 +12,9 @@ STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 PARALLEL_MAKE = ""
 CPPFLAGS_append_libc-uclibc = " -DU_TIMEZONE=0"
 
-inherit autotools pkgconfig binconfig
+BINCONFIG = "${bindir}/icu-config"
+
+inherit autotools pkgconfig binconfig-disabled
 
 # ICU needs the native build directory as an argument to its --with-cross-build option when
 # cross-compiling. Taken the situation that different builds may share a common sstate-cache
diff --git a/meta/recipes-support/libassuan/libassuan_2.1.1.bb b/meta/recipes-support/libassuan/libassuan_2.1.1.bb
index 6f7d674..d660233 100644
--- a/meta/recipes-support/libassuan/libassuan_2.1.1.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.1.1.bb
@@ -16,7 +16,9 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "757243cc4a71b30ed8d8dbe784035d36"
 SRC_URI[sha256sum] = "23e2d67779b88e90d29fe1df6b157109f1c2a647d0f1b2a0f4295bb3c0b2039d"
 
-inherit autotools texinfo binconfig pkgconfig
+BINCONFIG = "${bindir}/libassuan-config"
+
+inherit autotools texinfo binconfig-disabled pkgconfig
 
 do_configure_prepend () {
 	# Else these could be used in prefernce to those in aclocal-copy
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 8afa945..7d8de56 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -14,7 +14,9 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://add-pkgconfig-support.patch \
            file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch"
 
-inherit autotools-brokensep texinfo binconfig pkgconfig
+BINCONFIG = "${bindir}/libgcrypt-config"
+
+inherit autotools-brokensep texinfo binconfig-disabled pkgconfig
 
 EXTRA_OECONF = "--disable-asm --with-capabilities"
 
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb
index a47e31d..af9574d 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.12.bb
@@ -17,7 +17,9 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "8f0eb41a344d19ac2aa9bd101dfb9ce6"
 SRC_URI[sha256sum] = "cafc9ed6a87c53a35175d5a1220a96ca386696eef2fa059cc0306211f246e55f"
 
-inherit autotools binconfig pkgconfig gettext
+BINCONFIG = "${bindir}/gpg-error-config"
+
+inherit autotools binconfig-disabled pkgconfig gettext
 
 FILES_${PN}-dev += "${bindir}/gpg-error"
 
diff --git a/meta/recipes-support/libksba/libksba_1.3.0.bb b/meta/recipes-support/libksba/libksba_1.3.0.bb
index 71404a0..d08fe2b 100644
--- a/meta/recipes-support/libksba/libksba_1.3.0.bb
+++ b/meta/recipes-support/libksba/libksba_1.3.0.bb
@@ -10,7 +10,9 @@ PR = "r1"
 
 DEPENDS = "libgpg-error"
 
-inherit autotools binconfig pkgconfig texinfo
+BINCONFIG = "${bindir}/ksba-config"
+
+inherit autotools binconfig-disabled pkgconfig texinfo
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://ksba-add-pkgconfig-support.patch"
diff --git a/meta/recipes-support/libpcre/libpcre_8.35.bb b/meta/recipes-support/libpcre/libpcre_8.35.bb
index a99b34c..92098c8 100644
--- a/meta/recipes-support/libpcre/libpcre_8.35.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.35.bb
@@ -24,7 +24,9 @@ DEPENDS += "bzip2 zlib"
 
 PACKAGECONFIG[pcretest-readline] = "--enable-pcretest-libreadline,--disable-pcretest-libreadline,readline,"
 
-inherit autotools binconfig ptest
+BINCONFIG = "${bindir}/pcre-config"
+
+inherit autotools binconfig-disabled ptest
 
 PARALLEL_MAKE = ""
 
diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.5.bb b/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
index b482adc..9ee9313 100644
--- a/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
+++ b/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
@@ -24,7 +24,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2"
 SRC_URI[md5sum] = "2780b6a758a1e2c2943bdbf7faf740e4"
 SRC_URI[sha256sum] = "404ef4b6b324be79ac1bfb3d839eac860fbc929e6acb1ef88793a6ea328bc55a"
 
-inherit autotools pkgconfig binconfig lib_package
+BINCONFIG = "${bindir}/libusb-config"
+
+inherit autotools pkgconfig binconfig-disabled lib_package
 
 EXTRA_OECONF = "--libdir=${base_libdir}"
 
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
index 5401f3c..0b2526d 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
@@ -16,7 +16,9 @@ SRC_URI[md5sum] = "9667bf6f9310b957254fdcf6596600b7"
 SRC_URI[sha256sum] = "5fc7151a57b89c03d7b825df5a0fae0a8d5f05674c0e7cf2937ecec4d54a028c"
 S = "${WORKDIR}/libxslt-${PV}"
 
-inherit autotools pkgconfig binconfig lib_package
+BINCONFIG = "${bindir}/xslt-config"
+
+inherit autotools pkgconfig binconfig-disabled lib_package
 
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
 do_configure_prepend () {
diff --git a/meta/recipes-support/neon/neon_0.30.0.bb b/meta/recipes-support/neon/neon_0.30.0.bb
index f6c5a6f..61bd7d9 100644
--- a/meta/recipes-support/neon/neon_0.30.0.bb
+++ b/meta/recipes-support/neon/neon_0.30.0.bb
@@ -14,7 +14,9 @@ SRC_URI = "http://www.webdav.org/${BPN}/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "fb60b3a124eeec441937a812c456fd94"
 SRC_URI[sha256sum] = "2962cfcb5d30f3272e3d2fa0e473434419770a3801afe3d46e5d1650787990c2"
 
-inherit autotools binconfig lib_package pkgconfig
+BINCONFIG = "${bindir}/neon-config"
+
+inherit autotools binconfig-disabled lib_package pkgconfig
 
 EXTRA_OECONF = "--with-ssl=gnutls --with-libxml2 --with-expat --enable-shared"
 EXTRA_OECONF += "--without-gssapi"
diff --git a/meta/recipes-support/npth/npth_0.91.bb b/meta/recipes-support/npth/npth_0.91.bb
index 56a9d9b..7105b94 100644
--- a/meta/recipes-support/npth/npth_0.91.bb
+++ b/meta/recipes-support/npth/npth_0.91.bb
@@ -11,7 +11,9 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/npth/npth-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "87712f0cee656c390b49773923e26e7f"
 SRC_URI[sha256sum] = "caef86ced4a331e162897818a5b924860c8d6003e52da5bdf76da00e8e0dfae1"
 
-inherit autotools binconfig
+BINCONFIG = "${bindir}/npth-config"
+
+inherit autotools binconfig-disabled
 
 FILES_${PN} = "${libdir}/libnpth.so.*"
 FILES_${PN}-dev += "${bindir}/npth-config"
diff --git a/meta/recipes-support/pth/pth_2.0.7.bb b/meta/recipes-support/pth/pth_2.0.7.bb
index 4a85332..416e788 100644
--- a/meta/recipes-support/pth/pth_2.0.7.bb
+++ b/meta/recipes-support/pth/pth_2.0.7.bb
@@ -20,7 +20,9 @@ SRC_URI[sha256sum] = "72353660c5a2caafd601b20e12e75d865fd88f6cf1a088b306a3963f0b
 
 PARALLEL_MAKE=""
 
-inherit autotools binconfig pkgconfig
+BINCONFIG = "${bindir}/pth-config"
+
+inherit autotools binconfig-disabled pkgconfig
 
 do_configure() {
 	( cd ${S}; gnu-configize )
diff --git a/meta/recipes-support/taglib/taglib_1.9.1.bb b/meta/recipes-support/taglib/taglib_1.9.1.bb
index 0421f61..55e345f 100644
--- a/meta/recipes-support/taglib/taglib_1.9.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.9.1.bb
@@ -14,7 +14,9 @@ SRC_URI[sha256sum] = "72d371cd1419a87ae200447a53bff2be219283071e80fd12337928cc96
 
 S = "${WORKDIR}/${BP}"
 
-inherit cmake pkgconfig binconfig
+BINCONFIG = "${bindir}/taglib-config"
+
+inherit cmake pkgconfig binconfig-disabled
 
 PACKAGES =+ "${PN}-c"
 FILES_${PN}-c = "${libdir}/libtag_c.so.*"



