Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QbiMl-0005YY-KH
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 02:10:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2011 17:07:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,440,1304319600"; d="scan'208";a="21691028"
Received: from swold-mobl.jf.intel.com ([10.24.0.56])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2011 17:07:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2011 17:07:06 -0700
Message-Id: <8ef199fe606464ce6bdfef2329607c037ecdbc61.1309305731.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309305731.git.sgw@linux.intel.com>
References: <cover.1309305731.git.sgw@linux.intel.com>
Subject: [PATCH 1/2] multiple recipes converted to -staticdev packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jun 2011 00:10:53 -0000

This commit adds a new base package ${PN}-staticdev to
bitbake.conf which pulls in the static *.a libraries as
a seperate package, it filters out the nonshared.a
libraries where appropriate.

Additional this commit adds a new libdev.bbclass which provides
a set of macros and variables to convert ${PN} to lib${PN},
which a number of recipes where then converted to use.

PR bumps all around

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/lib_package.bbclass                   |   10 ++++-
 meta/classes/libdev.bbclass                        |   44 ++++++++++++++++++++
 meta/conf/bitbake.conf                             |    8 +++-
 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    7 ++-
 .../wireless-tools/wireless-tools_29.bb            |    9 +++-
 meta/recipes-core/eglibc/eglibc-common.inc         |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    9 +++-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |   16 ++++----
 meta/recipes-core/glibc/glibc-package.inc          |    9 +++-
 .../meta/external-csl-toolchain_2008q3-72.bb       |    8 ++-
 meta/recipes-core/uclibc/uclibc.inc                |    9 +++-
 meta/recipes-core/udev/udev-new.inc                |   14 ++++--
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |   11 ++++-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 .../binutils/binutils-cross-canadian_2.21.bb       |    2 +-
 meta/recipes-devtools/binutils/binutils-cross.inc  |    2 +
 .../binutils/binutils-cross_csl-arm-2008q1.bb      |    2 +-
 .../binutils/binutils-crosssdk_2.21.bb             |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    9 +---
 meta/recipes-devtools/binutils/binutils_2.21.bb    |    2 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |   25 ++++++++---
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 +-
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    8 ++-
 meta/recipes-devtools/opkg/opkg_svn.bb             |    8 ++-
 meta/recipes-devtools/python/python_2.6.6.bb       |    4 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |   18 ++++----
 meta/recipes-extended/augeas/augeas.inc            |    7 +--
 meta/recipes-extended/augeas/augeas_0.8.1.bb       |    2 +-
 meta/recipes-extended/gamin/gamin_0.1.10.bb        |   13 +-----
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    9 +++-
 meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    9 ++--
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    7 +--
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    4 +-
 meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
 meta/recipes-support/attr/ea-acl.inc               |   16 +-------
 meta/recipes-support/curl/curl_7.21.6.bb           |   17 +++-----
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |    5 +-
 meta/recipes-support/sqlite/sqlite3.inc            |   10 +----
 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb     |    2 +-
 41 files changed, 203 insertions(+), 146 deletions(-)
 create mode 100644 meta/classes/libdev.bbclass

diff --git a/meta/classes/lib_package.bbclass b/meta/classes/lib_package.bbclass
index 5ce8727..e8cbc25 100644
--- a/meta/classes/lib_package.bbclass
+++ b/meta/classes/lib_package.bbclass
@@ -5,6 +5,12 @@ FILES_${PN} = "${libexecdir} ${libdir}/lib*${SOLIBS} \
 	    ${base_libdir}/*${SOLIBS} \
 	    ${datadir}/${PN} ${libdir}/${PN}"
 FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-		${libdir}/*.o ${libdir}/pkgconfig /lib/*.o \
-		${datadir}/aclocal ${bindir}/*-config"
+            ${libdir}/*.o ${libdir}/pkgconfig /lib/*.o \
+            ${datadir}/aclocal ${bindir}/*-config \
+            ${libdir}/*_nonshared.a"
 FILES_${PN}-bin = "${bindir}/* ${sbindir}/* /bin/* /sbin/*"
+
+staticdev_libs = "${libdir}/*.a ${base_libdir}/*.a"
+FILES_${PN}-staticdev = "${@oe_filter_out('lib.*_nonshared.a', '${staticdev_libs}', d)}"
+
+
diff --git a/meta/classes/libdev.bbclass b/meta/classes/libdev.bbclass
new file mode 100644
index 0000000..d0aac2f
--- /dev/null
+++ b/meta/classes/libdev.bbclass
@@ -0,0 +1,44 @@
+#
+# This bbclass it a common case for lib${PN}*.a static libraries
+#
+
+SUMMARY_lib${PN}-dbg ?= "${SUMMARY} - Debugging files"
+DESCRIPTION_lib${PN}-dbg ?= "${DESCRIPTION}  \
+This package contains ELF symbols and related sources for debugging purposes."
+
+SUMMARY_lib${PN}-dev ?= "${SUMMARY} - Development files"
+DESCRIPTION_lib${PN}-dev ?= "${DESCRIPTION}  \
+This package contains symbolic links, header files, and \
+related items necessary for software development."
+
+SUMMARY_lib${PN}-doc ?= "${SUMMARY} - Documentation files"
+DESCRIPTION_lib${PN}-doc ?= "${DESCRIPTION} This package contains documentation."
+
+SUMMARY_lib${PN}-staticdev ?= "${SUMMARY} - Development files (Static Libraries)"
+DESCRIPTION_lib${PN}-staticdev?= "${DESCRIPTION}  \
+This package contains static libraries for software development."
+
+PACKAGES =+ "lib${PN} lib${PN}-dev lib${PN}-doc lib${PN}-staticdev"
+
+FILES_lib${PN} = "${base_libdir}/lib*.so.* ${libdir}/lib*.so.*"
+RDEPENDS_lib${PN} = "${PN}"
+
+FILES_lib${PN}-dev = "${includedir} \
+                      ${libdir}/lib*.so \
+                      ${libdir}/lib*_nonshared.a \
+                      ${libdir}/lib*.la \
+                      ${libdir}/pkgconfig \
+                      ${base_libdir}/lib*.so \
+                      ${base_libdir}/lib*_nonshared.a \
+                      ${base_libdir}/lib*.la"
+
+
+FILES_lib${PN}-doc = "${mandir}/man2 \
+                      ${mandir}/man3"
+
+lib_staticdev_libs = "${libdir}/*.a ${base_libdir}/*.a"
+FILES_lib${PN}-staticdev = "${@oe_filter_out('lib.*_nonshared.a', '${lib_staticdev_libs}', d)}"
+
+
+SECTION_lib${PN}-staticdev = "devel"
+RDEPENDS_lib${PN}-staticdev = "lib${PN}-dev (= ${EXTENDPKGV})"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ff2a912..53106c8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -252,12 +252,16 @@ SECTION_${PN}-doc = "doc"
 
 FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
                 ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig \
-                ${datadir}/aclocal ${base_libdir}/*.o"
+                ${datadir}/aclocal ${base_libdir}/*.o \
+                ${libdir}/lib*_nonshared.a ${base_libdir}/lib*_nonshared.a"
+		
 SECTION_${PN}-dev = "devel"
 ALLOW_EMPTY_${PN}-dev = "1"
 RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
 
-FILES_${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a"
+staticdev_libs = "${libdir}/*.a ${base_libdir}/*.a"
+FILES_${PN}-staticdev = "${@oe_filter_out('lib.*_nonshared.a', '${staticdev_libs}', d)}"
+
 SECTION_${PN}-staticdev = "devel"
 RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
 
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
index 4e6d4e1..439719a 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.1.7.bb
@@ -9,7 +9,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "zlib"
 RDEPENDS_${PN} = "${PN}-ids"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
            file://configure.patch \
@@ -49,9 +49,12 @@ do_install () {
 	ln -s ../sbin/lspci ${D}${bindir}/lspci
 }
 
-PACKAGES =+ "pciutils-ids libpci libpci-dev libpci-dbg"
+PACKAGES =+ "pciutils-ids libpci libpci-dev libpci-dbg libpci-staticdev"
 FILES_pciutils-ids = "${datadir}/pci.ids*"
 FILES_libpci = "${libdir}/libpci.so.*"
 FILES_libpci-dbg = "${libdir}/.debug"
 FILES_libpci-dev = "${libdir}/libpci.a ${libdir}/libpci.la ${libdir}/libpci.so \
                     ${includedir}/pci ${libdir}/pkgconfig"
+FILES_libpci-staticdev = "${libdir}/libpci.a"
+RDEPENDS_libpci-staticdev = "libpci-dev (= ${EXTENDPKGV})"
+
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
index 3f9f8f0..26ec667 100644
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
+++ b/meta/recipes-connectivity/wireless-tools/wireless-tools_29.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "base"
 PRIORITY = "optional"
 PE = "1"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux/wireless_tools.29.tar.gz \
            file://man.patch;apply=yes \
@@ -42,14 +42,17 @@ do_install() {
 }
 
 PACKAGES = "libiw-dbg ifrename-dbg ${PN}-dbg \
-libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} ${PN}-doc"
+libiw libiw-dev libiw-doc libiw-staticdev ifrename-doc ifrename ${PN} ${PN}-doc"
 
 FILES_libiw-dbg = "${libdir}/.debug/*.so.*"
 FILES_ifrename-dbg = "${sbindir}/.debug/ifrename"
 FILES_libiw = "${libdir}/*.so.*"
-FILES_libiw-dev = "${libdir}/*.a ${libdir}/*.so ${includedir}"
+FILES_libiw-dev = "${libdir}/*.so ${includedir}"
 FILES_libiw-doc = "${mandir}/man7"
+FILES_libiw-staticdev = "${libdir}/*.a"
+RDEPENDS_libiw-staticdev = "libiw-dev (= ${EXTENDPKGV})"
 FILES_ifrename = "${sbindir}/ifrename"
 FILES_ifrename-doc = "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab.5"
 FILES_${PN} = "${bindir} ${sbindir}/iw* ${base_sbindir} ${base_bindir} ${sysconfdir}/network"
 FILES_${PN}-doc = "${mandir}"
+
diff --git a/meta/recipes-core/eglibc/eglibc-common.inc b/meta/recipes-core/eglibc/eglibc-common.inc
index a36011a..d71c5ed 100644
--- a/meta/recipes-core/eglibc/eglibc-common.inc
+++ b/meta/recipes-core/eglibc/eglibc-common.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 PRIORITY = "required"
 LICENSE = "LGPL"
-INC_PR = "r11"
+INC_PR = "r12"
 LIC_FILES_CHKSUM ?= "file://LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 8228484..c57b455 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -20,7 +20,7 @@ USE_LDCONFIG ?= "1"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils ${PN}-pic ${PN}-dev eglibc-doc libcidn libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile libsotruss${PKGSUFFIX}"
+PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils ${PN}-pic ${PN}-dev ${PN}-staticdev eglibc-doc libcidn libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile libsotruss${PKGSUFFIX}"
 
 # Create a eglibc-binaries
 ALLOW_EMPTY_${PN}-binaries = "1"
@@ -50,6 +50,7 @@ RPROVIDES_eglibc-doc = "glibc-doc"
 RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
 RPROVIDES_eglibc-thread-db = "glibc-thread-db"
 RPROVIDES_eglibc-pcprofile = "glibc-pcprofile"
+RPROVIDES_eglibc-staticdev = "glibc-staticdev"
 RPROVIDES_eglibc-dbg = "glibc-dbg"
 libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 
@@ -62,8 +63,10 @@ FILES_eglibc-extra-nss = "${base_libdir}/libnss*"
 FILES_sln = "/sbin/sln"
 FILES_eglibc-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/"
 FILES_libsotruss${PKGSUFFIX} = "${libdir}/audit/sotruss-lib.so"
-FILES_eglibc-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
-	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
+FILES_eglibc-dev_append = "${bindir}/rpcgen ${base_libdir}/*.o ${datadir}/aclocal ${libdir}/lib*_nonshared.a"
+libc_staticdev_libs = "${libdir}/*.a ${base_libdir}/*.a"
+FILES_eglibc-staticdev_append = "${@oe_filter_out('lib.*_nonshared.a', '${libc_staticdev_libs}', d)}"
+RDEPENDS_eglibc-staticdev = "eglibc-dev (= ${EXTENDPKGV})"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
 FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
 FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index b64fbdb..9acf4c6 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r0"
+PR = "r1"
 DEPENDS = "gettext-native virtual/libiconv ncurses expat git-native"
 DEPENDS_virtclass-native = "git-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -50,7 +50,7 @@ acpaths = '-I ${S}/gettext-runtime/m4 \
 # 1300    KiB /ep93xx/uclibc-dev_0.9.29-r8_ep93xx.ipk
 # 140     KiB /armv4t/gettext-dev_0.14.1-r6_armv4t.ipk
 # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
-PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
+PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-staticdev gettext-runtime-doc"
 
 FILES_gettext-runtime = "${bindir}/gettext \
                          ${bindir}/ngettext \
@@ -62,12 +62,12 @@ FILES_gettext-runtime = "${bindir}/gettext \
 FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl.so* \
                                              ${libdir}/charset.alias \
                                            "
-FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
-                      ${includedir}/autosprintf.h \
-                     "
-FILES_gettext-runtime-dev_append_libc-uclibc = " ${libdir}/libintl.a \
-                                                 ${includedir}/libintl.h \
-                                               "
+FILES_gettext-runtime-dev += "${includedir}/autosprintf.h"
+FILES_gettext-runtime-staticdev = "${libdir}/libasprintf.a"
+FILES_gettext-runtime-dev_append_libc-uclibc = " ${includedir}/libintl.h"
+FILES_gettext-runtime-staticdev_append_libc-uclibc = " ${libdir}/libintl.a"
+RDEPENDS_gettext-runtime-staticdev = "gettext-runtime-dev (= ${EXTENDPKGV})"
+
 FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
                              ${mandir}/man1/ngettext.* \
                              ${mandir}/man1/envsubst.* \
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 5373d56..d2bd199 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -20,7 +20,7 @@ PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} \
 	ldd${PKGSUFFIX} ${PN}-utils ${PN}-dev ${PN}-doc \
 	libsegfault${PKGSUFFIX} ${PN}-extra-nss ${PN}-thread-db \
-	${PN}-pcprofile"
+	${PN}-pcprofile ${PN}-staticdev"
 
 libc_baselibs = "${base_libdir}/libc* ${base_libdir}/libm* ${base_libdir}/ld* \
 	${base_libdir}/libpthread* ${base_libdir}/libresolv* ${base_libdir}/librt* \
@@ -37,8 +37,9 @@ glibcdbgfiles = "${bindir}/.debug ${sbindir}/.debug ${libdir}/.debug \
                   ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug \
                   ${libdir}/gconv/.debug ${libexecdir}/*/.debug"
 glibcdevfiles = "${bindir}/rpcgen ${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
-                ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
+                ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.o ${datadir}/aclocal"
+
+glibcstaticdev = "${libdir}/*.a ${base_libdir}/*.a"
 
 FILES_glibc = "${glibcfiles}"
 FILES_${PN} = "${glibcfiles}"
@@ -48,6 +49,8 @@ FILES_glibc-extra-nss = "${base_libdir}/libnss*"
 FILES_sln = "${base_sbindir}/sln"
 FILES_glibc-dev = "${glibcdevfiles}"
 FILES_${PN}-dev = "${glibcdevfiles}"
+FILES_glibc-staticdev = "${glibcstaticdev}"
+FILES_${PN}-staticdev = "${glibcstaticdev}"
 FILES_glibc-dbg = "${glibcdbgfiles}"
 FILES_${PN}-dbg = "${glibcdbgfiles}"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd* ${sysconfdir}/nscd* ${sysconfdir}/init.d/nscd*"
diff --git a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
index a874c8b..b7d6096 100644
--- a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
@@ -18,7 +18,7 @@ PROVIDES = "\
 	virtual/linux-libc-headers "
 RPROVIDES = "glibc-utils libsegfault glibc-thread-db"
 PACKAGES_DYNAMIC = "glibc-gconv-*"
-PR = "r1"
+PR = "r2"
 
 #SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/arm-none-linux-gnueabi/arm-${PV}-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2"
 
@@ -43,16 +43,18 @@ GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
 inherit libc-common
 inherit libc-package
 
-PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers"
+PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux-libc-headers"
 FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
 FILES_libgcc-dev = "${base_libdir}/libgcc_s.so"
 FILES_libstdc++ = "${libdir}/libstdc++.so.*"
 FILES_libstdc++-dev = "${includedir}/c++/${PV} \
 	${libdir}/libstdc++.so \
 	${libdir}/libstdc++.la \
+	${libdir}/libsupc++.la"
+FILES_libstdc++-staticdev = " \
 	${libdir}/libstdc++.a \
-	${libdir}/libsupc++.la \
 	${libdir}/libsupc++.a"
+RDEPENDS_libstdc++-staticdev = "libstdc++-dev ( = ${EXTENDPKGV})"
 FILES_linux-libc-headers = "${includedir}/asm* \
 	${includedir}/linux \
 	${includedir}/mtd \
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 06c0f5d..055d10d 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -14,7 +14,7 @@ PRIORITY = "required"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
 file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
-INC_PR = "r2"
+INC_PR = "r4"
 
 require uclibc-config.inc
 STAGINGCC = "gcc-cross-intermediate"
@@ -72,12 +72,15 @@ FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
 FILES_ldd = "${bindir}/ldd"
 FILES_uclibc-dev_append = "\
         ${libdir}/lib*.so \
-        ${libdir}/*_nonshared.a \
+        ${libdir}/lib*_nonshared.a \
         ${libdir}/[S]*crt[1in].o \
         ${libdir}/crtreloc*.o \
-        ${libdir}/lib*.a \
         ${includedir}/*.h ${includedir}/*/*.h \
        "
+
+uclibc-staticdev_libs = "${libdir}/lib*.a"
+FILES_uclibc-staticdev_append = "${@oe_filter_out('lib.*_nonshared.a', '${uclibc_staticdev_libs}', d)}"
+
 FILES_uclibc-utils = "${bindir} ${sbindir}"
 FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
 FILES_uclibc-gconv = "${libdir}/gconv"
diff --git a/meta/recipes-core/udev/udev-new.inc b/meta/recipes-core/udev/udev-new.inc
index 1b94f1b..7492bc4 100644
--- a/meta/recipes-core/udev/udev-new.inc
+++ b/meta/recipes-core/udev/udev-new.inc
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://libudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://extras/gudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
+INC_PR = "r3"
+
 DEPENDS = "acl glib-2.0 libusb usbutils pciutils linux-libc-headers gperf-native libxslt-native"
 RPROVIDES_${PN} = "hotplug"
 RRECOMMENDS_${PN} += "udev-extraconf udev-cache usbutils-ids pciutils-ids"
@@ -35,8 +37,8 @@ libexecdir = "${base_libdir}/udev"
 EXTRA_OECONF = "--disable-introspection --with-rootlibdir=${base_libdir} \
                 --with-pci-ids-path=${datadir}/pci.ids"
 
-PACKAGES =+ "udev-cache libudev libudev-dev libudev-dbg"
-PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
+PACKAGES =+ "udev-cache libudev libudev-dev libudev-dbg libudev-staticdev"
+PACKAGES =+ "libgudev libgudev-dev libgudev-dbg libgudev-staticdev"
 
 INITSCRIPT_PACKAGES = "udev udev-cache"
 INITSCRIPT_NAME_udev = "udev"
@@ -50,11 +52,15 @@ FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
 FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_libudev-dbg = "${base_libdir}/.debug/libudev.so.*"
 FILES_libudev-dev = "${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
-                     ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
+                     ${libdir}/pkgconfig/libudev.pc"
+FILES_libudev-staticdev = "${libdir}/libudev.a"
+RDEPENDS_libudev-staticdev = "libudev-dev (= ${EXTENDPKGV})"
 FILES_libgudev = "${libdir}/libgudev*.so.*"
 FILES_libgudev-dbg = "${libdir}/.debug/libgudev*.so.*"
 FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libgudev*.la \
-                     ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
+                     ${libdir}/pkgconfig/gudev*.pc"
+FILES_libgudev-staticdev = "${libdir}/libgudev.a"
+RDEPENDS_libgudev-staticdev = "libgudev-dev (= ${EXTENDPKGV})"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache"
 
 do_install_append () {
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 76fd907..bee0bad 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev-new.inc
 
-PR = "r2"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "fddac2d54761ea34865af9467377ca9f"
 SRC_URI[sha256sum] = "c12e66280b5e1465f6587a8cfa47d7405c4caa7e52ce5dd13478d04f6ec05e5c"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index b77266a..c882573 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=9c920d811858a74b67a36ba23cbaa95f
                     file://licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
                     file://getopt/COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
+INC_PR = "r3"
+
 inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
 DEPENDS_virtclass-native = " lzo-native"
@@ -28,7 +30,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR_VERSION}/util-
 PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-libblkid \
-             util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
+             util-linux-libblkid-dev util-linux-libblkid-staticdev \
+             util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid-staticdev \
              util-linux-uuidgen util-linux-lscpu"
 
 EXTRA_OECONF = "--disable-use-tty-group --disable-makeinstall-chown --enable-elvtune --enable-init --enable-kill --enable-last \
@@ -50,8 +53,12 @@ FILES_util-linux-uuidgen = "${bindir}/uuidgen"
 
 FILES_util-linux-libblkid = "${libdir}/libblkid.so.*"
 FILES_util-linux-libblkid-dev = "${libdir}/libblkid.so ${libdir}/libblkid.a ${libdir}/libblkid.la ${includedir}/blkid"
+FILES_util-linux-libblkid-staticdev = "${libdir}/libblkid.a"
+RDEPENDS_util-linux-libblkid-staticdev = "util-linux-libblkid-dev (= ${EXTENDPKGV})"
 FILES_util-linux-libuuid = "${libdir}/libuuid.so.*"
-FILES_util-linux-libuuid-dev = "${libdir}/libuuid.so ${libdir}/libuuid.a ${libdir}/libuuid.la ${includedir}/uuid"
+FILES_util-linux-libuuid-staticdev = "${libdir}/libuuid.so ${libdir}/libuuid.a ${libdir}/libuuid.la ${includedir}/uuid"
+FILES_util-linux-libuuid-staticdev = "${libdir}/libuuid.a"
+RDEPENDS_util-linux-libuuid-staticdev = "util-linux-libuuid-dev (= ${EXTENDPKGV})"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
 RRECOMMENDS_${PN} = "util-linux-fdisk util-linux-cfdisk util-linux-sfdisk util-linux-mount util-linux-readprofile "
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 132f28b..3c5747c 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r1"
+PR = "${INC_PR}.0"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.bb
index 7dad2a6..0a91dfb 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-canadian.inc
-PR = "r0"
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index 4b90972..46234ff 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -1,6 +1,8 @@
 inherit cross
 PROVIDES = "virtual/${TARGET_PREFIX}binutils"
 
+INC_PR = "r2"
+
 EXTRA_OECONF = "--with-sysroot=${STAGING_DIR_TARGET} \
                 --program-prefix=${TARGET_PREFIX} \
                 --disable-install-libbfd \
diff --git a/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb b/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
index 8ab1e7f..f7a2c48 100644
--- a/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross_csl-arm-2008q1.bb
@@ -1,3 +1,3 @@
 require binutils_csl-arm-2008q1.bb
 require binutils-cross.inc
-PR = "r1"
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.bb
index 0d6efff..3886d85 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.bb
@@ -4,7 +4,7 @@ inherit crosssdk
 
 PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 do_configure_prepend () {
 	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#' ${S}/ld/configure.tgt
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 08c14b2..8085a21 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -11,6 +11,8 @@ BUGTRACKER = "http://sourceware.org/bugzilla/"
 SECTION = "devel"
 LICENSE = "GPLv3"
 
+INC_PR = "r2"
+
 DEPENDS = "flex-native bison-native zlib-native"
 
 inherit autotools gettext
@@ -22,13 +24,6 @@ FILES_${PN} = " \
 	${libdir}/lib*-*.so \
 	${prefix}/${TARGET_SYS}/bin/*"
 
-FILES_${PN}-dev = " \
-	${includedir} \
-	${libdir}/*.a \
-	${libdir}/*.la \
-	${libdir}/libbfd.so \
-	${libdir}/libopcodes.so"
-
 FILES_${PN}-symlinks = " \
 	${bindir}/addr2line \
 	${bindir}/as \
diff --git a/meta/recipes-devtools/binutils/binutils_2.21.bb b/meta/recipes-devtools/binutils/binutils_2.21.bb
index 2211931..ebb0da6 100644
--- a/meta/recipes-devtools/binutils/binutils_2.21.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.21.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r1"
+PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
index 51483f9..18ceb73 100644
--- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
@@ -3,14 +3,19 @@ PACKAGES = "\
   libstdc++ \
   libstdc++-precompile-dev \
   libstdc++-dev \
+  libstdc++-staticdev \
   libg2c \
   libg2c-dev \
+  libg2c-staticdev \
   libssp \
   libssp-dev \
+  libssp-staticdev \
   libgfortran \
   libgfortran-dev \
+  libgfortran-staticdev \
   libmudflap \
   libmudflap-dev \
+  libmudflap-staticdev \
 "
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
@@ -23,36 +28,42 @@ FILES_${PN}-dbg += "\
 FILES_libg2c = "${target_libdir}/libg2c.so.*"
 FILES_libg2c-dev = "\
   ${libdir}/libg2c.so \
+FILES_libg2c-staticdev = "\
   ${libdir}/libg2c.a \
   ${libdir}/libfrtbegin.a"
-
+RDEPENDS_libg2c-staticdev = "libg2c-dev (= ${EXTENDPKGV})"
 FILES_libstdc++ = "${libdir}/libstdc++.so.*"
 FILES_libstdc++-dev = "\
   ${includedir}/c++/ \
   ${libdir}/libstdc++.so \
   ${libdir}/libstdc++.la \
-  ${libdir}/libstdc++.a \
   ${libdir}/libsupc++.la \
+FILES_libstdc++-staticdev = " \
+  ${libdir}/libstdc++.a \
   ${libdir}/libsupc++.a"
+RDEPENDS_libstdc++-staticdev = "libstdc++-dev (= ${EXTENDPKGV})"
 
 FILES_libstdc++-precompile-dev = "${includedir}/c++/${TARGET_SYS}/bits/*.gch"
 
 FILES_libssp = "${libdir}/libssp.so.*"
 FILES_libssp-dev = " \
   ${libdir}/libssp*.so \
-  ${libdir}/libssp*.a \
   ${libdir}/libssp*.la \
+  ${libdir}/libssp_nonshared.a \
   ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/ssp"
+FILES_libssp-staticdev = "${libdir}/libssp.a"
+RDEPENDS_libssp-staticdev = "libssp-dev (= ${EXTENDPKGV})"
 
 FILES_libgfortran = "${libdir}/libgfortran.so.*"
-FILES_libgfortran-dev = " \
+FILES_libgfortran-dev = "${libdir}/libgfortran.so"
+FILES_libgfortran-staticdev = " \
   ${libdir}/libgfortran.a \
-  ${libdir}/libgfortran.so \
   ${libdir}/libgfortranbegin.a"
+RDEPENDS_libfortran-staticdev = "libfortran-dev (= ${EXTENDPKGV})"
 
 FILES_libmudflap = "${libdir}/libmudflap*.so.*"
 FILES_libmudflap-dev = "\
   ${libdir}/libmudflap*.so \
-  ${libdir}/libmudflap*.a \
   ${libdir}/libmudflap*.la"
-
+FILES_libmudflap-staticdev = "${libdir}/libmudflap*.a"
+RDEPENDS_libmudflap-staticdev = "libmudflap-dev (= ${EXTENDPKGV})"
diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index b0523c7..71130bf 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -1,6 +1,6 @@
 require gcc-${PV}.inc
 
-PR = "r0"
+PR = "r1"
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
diff --git a/meta/recipes-devtools/opkg/opkg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
index 18cf042..710a61f 100644
--- a/meta/recipes-devtools/opkg/opkg_0.1.8.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
@@ -13,13 +13,15 @@ SRC_URI = "http://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
            file://headerfix.patch \
 "
 
-PR = "r4"
+PR = "r5"
 
-PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
+PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}-staticdev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
 FILES_update-alternatives-cworth${PKGSUFFIX} = "${bindir}/update-alternatives"
-FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
 FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
+FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.la ${libdir}/*.so"
+FILES_libopkg${PKGSUFFIX}-staticdev = "${libdir}/*.a"
+RDEPENDS_libopkg${PKGSUFFIX}-staticdev = "libopkg${PKGSUFFIX}-dev (= ${EXTENDPKGV})"
 
 # We need to create the lock directory
 do_install_append() {
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 5f07c17..d475c1a 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -17,12 +17,14 @@ S = "${WORKDIR}/trunk"
 
 SRCREV = "609"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
-PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
+PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}-staticdev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
 FILES_update-alternatives-cworth${PKGSUFFIX} = "${bindir}/update-alternatives"
-FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so"
+FILES_libopkg${PKGSUFFIX}-dev = "${libdir}/*.la ${libdir}/*.so"
+FILES_libopkg${PKGSUFFIX}-staticdev = "${libdir}/*.a"
+RDEPENDS_libopkg${PKGSUFFIX}-staticdev = "libopkg${PKGSUFFIX}-dev (= ${EXTENDPKGV})"
 FILES_libopkg${PKGSUFFIX} = "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
 
 # We need to create the lock directory
diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index e3c2355..d2e361e 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
@@ -121,10 +121,8 @@ FILES_${PN}-dev = "\
   ${includedir} \
   ${libdir}/lib*${SOLIBSDEV} \
   ${libdir}/*.la \
-  ${libdir}/*.a \
   ${libdir}/*.o \
   ${libdir}/pkgconfig \
-  ${base_libdir}/*.a \
   ${base_libdir}/*.o \
   ${datadir}/aclocal \
   ${datadir}/pkgconfig \
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 91089d2..5e6d0a4 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = ""
-PR = "r17"
+PR = "r18"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -166,7 +166,7 @@ EXTRA_OECONF = "--verbose \
 
 CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-common ${PN}-build python-rpm-dbg python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
 
 SOLIBS = "5.4.so"
 
@@ -301,26 +301,28 @@ FILES_perl-module-rpm-dev = "${prefix}/share/man/man3/RPM* \
 		"
 
 FILE_${PN}-dev = "${includedir}/rpm \
-		${libdir}/librpm.a \
 		${libdir}/librpm.la \
 		${libdir}/librpm.so \
-		${libdir}/librpmconstant.a \
 		${libdir}/librpmconstant.la \
 		${libdir}/librpmconstant.so \
-		${libdir}/librpmdb.a \
 		${libdir}/librpmdb.la \
 		${libdir}/librpmdb.so \
-		${libdir}/librpmio.a \
 		${libdir}/librpmio.la \
 		${libdir}/librpmio.so \
-		${libdir}/librpmmisc.a \
 		${libdir}/librpmmisc.la \
 		${libdir}/librpmmisc.so \
-		${libdir}/librpmbuild.a \
 		${libdir}/librpmbuild.la \
 		${libdir}/librpmbuild.so \
 		${libdir}/pkgconfig/rpm.pc \
 		"
+FILE_${PN}-staticdev = " \
+		${libdir}/librpm.a \
+		${libdir}/librpmconstant.a \
+		${libdir}/librpmdb.a \
+		${libdir}/librpmio.a \
+		${libdir}/librpmmisc.a \
+		${libdir}/librpmbuild.a \
+                "
 
 ###%{_rpmhome}/lib/libxar.a
 ###%{_rpmhome}/lib/libxar.la
diff --git a/meta/recipes-extended/augeas/augeas.inc b/meta/recipes-extended/augeas/augeas.inc
index 619cd20..b92fc55 100644
--- a/meta/recipes-extended/augeas/augeas.inc
+++ b/meta/recipes-extended/augeas/augeas.inc
@@ -9,14 +9,11 @@ SRC_URI = "http://augeas.net/download/${BP}.tar.gz"
 
 DEPENDS = "readline"
 
-inherit autotools
+inherit autotools libdev
 
-PACKAGES =+ "${PN}-lenses lib${PN} lib${PN}-dev lib${PN}-dbg"
+PACKAGES =+ "${PN}-lenses"
 
 FILES_${PN}-lenses = "${datadir}/augeas/lenses"
-FILES_lib${PN} = "${libdir}/*.so.*"
-FILES_lib${PN}-dev = "${libdir}/*.so ${libdir}/*.a ${libdir}/*.la ${includedir} ${libdir}/pkgconfig"
-FILES_lib${PN}-dbg = "${libdir}/.debug"
 
 RDEPENDS_lib${PN} += "${PN}-lenses"
 RRECOMMENDS_lib${PN} += "${PN}"
diff --git a/meta/recipes-extended/augeas/augeas_0.8.1.bb b/meta/recipes-extended/augeas/augeas_0.8.1.bb
index 51eeb33..ee45098 100644
--- a/meta/recipes-extended/augeas/augeas_0.8.1.bb
+++ b/meta/recipes-extended/augeas/augeas_0.8.1.bb
@@ -1,6 +1,6 @@
 require augeas.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "62d47bdc60e175f93aed3b81cb8e2785"
 SRC_URI[sha256sum] = "916fef67e8eed6d1abe02433830301bd01dfc8228e9cfffb490347545155c4d7"
diff --git a/meta/recipes-extended/gamin/gamin_0.1.10.bb b/meta/recipes-extended/gamin/gamin_0.1.10.bb
index 81b27c0..4280632 100644
--- a/meta/recipes-extended/gamin/gamin_0.1.10.bb
+++ b/meta/recipes-extended/gamin/gamin_0.1.10.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=412a9be54757a155d0b997b52b519f62"
 
 DEPENDS = "glib-2.0"
 PROVIDES = "fam"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "http://www.gnome.org/~veillard/gamin/sources/gamin-${PV}.tar.gz \
            file://no-abstract-sockets.patch"
@@ -16,18 +16,9 @@ SRC_URI = "http://www.gnome.org/~veillard/gamin/sources/gamin-${PV}.tar.gz \
 SRC_URI[md5sum] = "b4ec549e57da470c04edd5ec2876a028"
 SRC_URI[sha256sum] = "28085f0ae8be10eab582ff186af4fb0be92cc6c62b5cc19cd09b295c7c2899a1"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig libdev
 
 EXTRA_OECONF = "--without-python"
 
-PACKAGES += "lib${PN} lib${PN}-dev"
-FILES_${PN} = "${libexecdir}"
-FILES_${PN}-dbg += "${libexecdir}/.debug"
-FILES_lib${PN} = "${libdir}/lib*.so.*"
-FILES_lib${PN}-dev = "${includedir} ${libdir}/pkgconfig ${libdir}/lib*.la \
-                      ${libdir}/lib*.a ${libdir}/lib*.so"
-
-RDEPENDS_lib${PN} = "${PN}"
-
 LEAD_SONAME = "libgamin-1.so"
 
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index d5e334e..f3b8576 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -6,13 +6,16 @@ SECTION = "console/network"
 
 LICENSE = "tcp-wrappers"
 LIC_FILES_CHKSUM = "file://DISCLAIMER;md5=071bd69cb78b18888ea5e3da5c3127fa"
-PR ="r0"
+PR ="r1"
 
 
-PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev tcp-wrappers tcp-wrappers-doc"
+PACKAGES = "${PN}-dbg libwrap libwrap-doc libwrap-dev libwrap-staticdev \
+            tcp-wrappers tcp-wrappers-doc"
 FILES_libwrap = "${base_libdir}/lib*.so.*"
 FILES_libwrap-doc = "${mandir}/man3 ${mandir}/man5"
-FILES_libwrap-dev = "${libdir}/lib*.so ${libdir}/lib*.a ${includedir}"
+FILES_libwrap-dev = "${libdir}/lib*.so ${includedir}"
+FILES_libwrap-staticdev = "${libdir}/lib*.a"
+RDEPENDS_libwrap-staticdev = "libwrap-dev (= ${EXTENDPKGV})"
 FILES_tcp-wrappers = "${bindir}"
 FILES_tcp-wrappers-doc = "${mandir}/man8"
 
diff --git a/meta/recipes-graphics/cairo/cairo_1.10.2.bb b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
index 572e1f6..57db913 100644
--- a/meta/recipes-graphics/cairo/cairo_1.10.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.10.2.bb
@@ -2,7 +2,7 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz"
 
@@ -19,7 +19,7 @@ ALLOW_EMPTY = "1"
 # debian_package_name_hook. To keep backword compatibility,
 # it is necessary to explicitly name the package as libcairo2 here
 #
-PACKAGES =+ "libcairo2 libcairo2-dev libcairo2-dbg \
+PACKAGES =+ "libcairo2 libcairo2-dev libcairo2-dbg libcairo2-staticdev \
 		     libcairo-gobject2 \
 			 libcairo-script-interpreter2 \
 		     cairo-perf-utils \
@@ -45,9 +45,10 @@ to replay rendering."
 DESCRIPTION_cairo-perf-utils = "The Cairo library performance utilities"
 
 FILES_libcairo2 = "${libdir}/libcairo.so*"
-FILES_libcairo2-dev = "${includedir} ${libdir}/*.la ${libdir}/*.a \
-					   ${libdir}/*.o ${libdir}/pkgconfig"
+FILES_libcairo2-dev = "${includedir} ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig"
 FILES_libcairo2-dbg = "${libdir}/.debug ${libdir}/cairo/.debug"
+FILES_libcairo2-staticdev = "${libdir}/*.a"
+RDEPENDS_libcairo2-staticdev = "libcairo2-dev (= ${EXTENDPKGV})"
 FILES_libcairo-gobject2 = "${libdir}/libcairo-gobject.so*"
 FILES_libcairo-script-interpreter2 = "${libdir}/libcairo-script-interpreter.so*"
 FILES_cairo-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/libcairo-trace.*"
diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
index 1a56702..997db3e 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=90b90b60eb30f65fc9c2673d7cf59e24"
 DEPENDS += "libxrender freetype fontconfig"
 PROVIDES = "xft"
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXft"
@@ -28,10 +28,7 @@ python () {
             bb.data.setVar('PKG_${PN}', 'libxft2', d)
 }
 
-FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la \
-		${libdir}/*.a ${libdir}/pkgconfig \
-		${datadir}/aclocal ${bindir} ${sbindir}"
+FILES_${PN}-dev += "${bindir} ${sbindir}"
 
 SRC_URI[md5sum] = "cce3c327258116493b753f157e0360c7"
 SRC_URI[sha256sum] = "c8685ae56da0c1dcc2bc1e34607e7d76ae98b86a1a71baba3a6b76dbcf5ff9b2"
diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
index 47a9409..45bdf12 100644
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 			file://include/a52.h;beginline=1;endline=12;md5=81152ceb3562bf20a60d1b6018175dd1"
 SECTION = "libs"
 PRIORITY = "optional"
-PR = "r3"
+PR = "r4"
 
 inherit autotools
 
@@ -20,7 +20,5 @@ EXTRA_OECONF = " --enable-shared "
 
 PACKAGES =+ "a52dec a52dec-doc"
 
-FILES_${PN} = " ${libdir}/liba52.so.0 ${libdir}/liba52.so.0.0.0 " 
-FILES_${PN}-dev = " ${includedir}/a52dec/*.h ${libdir}/liba52.so ${libdir}/liba52.la ${libdir}/liba52.a "
 FILES_a52dec = " ${bindir}/* "
 FILES_a52dec-doc = " ${mandir}/man1/* "
diff --git a/meta/recipes-support/attr/acl_2.2.51.bb b/meta/recipes-support/attr/acl_2.2.51.bb
index 301d44a..40ba5f1 100644
--- a/meta/recipes-support/attr/acl_2.2.51.bb
+++ b/meta/recipes-support/attr/acl_2.2.51.bb
@@ -1,6 +1,6 @@
 require acl.inc
 
-PR = "r0"
+PR = "r2"
 
 SRC_URI[md5sum] = "3fc0ce99dc5253bdcce4c9cd437bc267"
 SRC_URI[sha256sum] = "06854521cf5d396801af7e54b9636680edf8064355e51c07657ec7442a185225"
diff --git a/meta/recipes-support/attr/attr_2.4.46.bb b/meta/recipes-support/attr/attr_2.4.46.bb
index 9fef41b..85c35d0 100644
--- a/meta/recipes-support/attr/attr_2.4.46.bb
+++ b/meta/recipes-support/attr/attr_2.4.46.bb
@@ -1,6 +1,6 @@
 require attr.inc
 
-PR = "r0"
+PR = "r2"
 
 SRC_URI[md5sum] = "db557c17fdfa4f785333ecda08654010"
 SRC_URI[sha256sum] = "dcd69bdca7ff166bc45141eddbcf21967999a6b66b0544be12a1cc2fd6340e1f"
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index afe2f1c..6ce20c0 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -3,7 +3,7 @@
 SRC_URI += "file://relative-libdir.patch;striplevel=0 \
            "
 
-inherit autotools gettext
+inherit autotools gettext libdev
 
 # the package comes with a custom config.h.in, it cannot be
 # overwritten by autoheader
@@ -16,19 +16,5 @@ do_install () {
 	oe_runmake install install-lib install-dev DIST_ROOT="${D}"
 }
 
-PACKAGES =+ "lib${PN} lib${PN}-dev lib${PN}-doc"
-
-FILES_lib${PN} = "${base_libdir}/lib*.so.*"
-
-FILES_lib${PN}-dev = "${includedir} \
-                      ${libdir}/lib*.so \
-                      ${libdir}/lib*.a \
-                      ${libdir}/lib*.la \
-                      ${base_libdir}/lib*.so \
-                      ${base_libdir}/lib*.a \
-                      ${base_libdir}/lib*.la"
-
-FILES_lib${PN}-doc = "${mandir}/man2 \
-                      ${mandir}/man3"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/curl/curl_7.21.6.bb b/meta/recipes-support/curl/curl_7.21.6.bb
index 51e14f9..aefc252 100644
--- a/meta/recipes-support/curl/curl_7.21.6.bb
+++ b/meta/recipes-support/curl/curl_7.21.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e66
 DEPENDS = "zlib gnutls"
 DEPENDS_virtclass-native = "zlib-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
-PR = "r0"
+PR = "r2"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
@@ -17,7 +17,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "6611989a81ebd7b03a35adc3001ddee0"
 SRC_URI[sha256sum] = "d9a3d3593796147ad9ca994c9e6834a42b49756420a10e996dbf849495d3d955"
 
-inherit autotools pkgconfig binconfig
+inherit autotools pkgconfig binconfig libdev
 
 EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
                 --without-ssl \
@@ -36,7 +36,7 @@ do_configure_prepend() {
 	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g configure.ac
 }
 
-PACKAGES += "${PN}-certs libcurl libcurl-dev libcurl-doc"
+PACKAGES += "${PN}-certs"
 
 FILES_${PN} = "${bindir}/curl"
 
@@ -45,17 +45,12 @@ PACKAGE_ARCH_${PN}-certs = "all"
 
 FILES_${PN}-doc = "${mandir}/man1/curl.1"
 
-FILES_lib${PN} = "${libdir}/lib*.so.*"
 RRECOMMENDS_lib${PN} += "${PN}-certs"
-FILES_lib${PN}-dev = "${includedir} \
-                      ${libdir}/lib*.so \
-                      ${libdir}/lib*.a \
-                      ${libdir}/lib*.la \
-                      ${libdir}/pkgconfig \
+FILES_lib${PN}-dev =+ "${libdir}/pkgconfig \
                       ${datadir}/aclocal \
                       ${bindir}/*-config"
 
-FILES_lib${PN}-doc = "${mandir}/man3 \
-                      ${mandir}/man1/curl-config.1"
+
+FILES_lib${PN}-doc =+ "${mandir}/man1/curl-config.1"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
index a4423ab..7c13a0d 100644
--- a/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
+++ b/meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 # the package is licensed under either of the following
 LICENSE = "MPL-1 | GPLv2+ | LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://jsapi.c;beginline=4;endline=39;md5=347c6bbf4fb4547de1fa5ad830030063"
-PR = "r2"
+PR = "r4"
 
 SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/js/js-1.8.0-rc1.tar.gz \
            file://link_with_gcc.patch \
@@ -46,6 +46,5 @@ do_install() {
 	install -m 0644 ${S}/jsproto.tbl ${D}${includedir}/js
 }
 
-FILES_${PN} = "${libdir}/lib*.so"
-FILES_${PN}-dev = "${includedir} ${libdir}/lib*.a"
+FILE_${PN} = "${libdir}/lib*.so"
 
diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 939df14..f3f474b 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -6,7 +6,7 @@ DEPENDS = "readline ncurses"
 DEPENDS_virtclass-native = ""
 LICENSE = "PD"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig libdev
 
 EXTRA_OECONF = "--disable-tcl --enable-shared --enable-threadsafe"
 EXTRA_OECONF_virtclass-native = "--disable-tcl --enable-shared --enable-threadsafe --disable-readline --enable-tempstore"
@@ -18,12 +18,6 @@ export config_TARGET_LINK = "${CCLD}"
 export config_TARGET_CFLAGS = "${CFLAGS}"
 export config_TARGET_LFLAGS = "${LDFLAGS}"
 
-PACKAGES = "lib${PN} lib${PN}-dev lib${PN}-doc ${PN} ${PN}-dbg"
-FILES_${PN} = "${bindir}/*"
-FILES_lib${PN} = "${libdir}/*.so.*"
-FILES_lib${PN}-dev = "${libdir}/*.a ${libdir}/*.la ${libdir}/*.so \
-		       ${libdir}/pkgconfig ${includedir}"
-FILES_lib${PN}-doc = "${docdir} ${mandir} ${infodir}"
-AUTO_LIBNAME_PKGS = "lib${PN}"
+FILES_lib${PN}-doc += "${docdir} ${mandir} ${infodir}"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb b/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb
index 34d1653..e1c765e 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b357
 
 SRC_URI = "http://www.sqlite.org/sqlite-autoconf-3070602.tar.gz"
 S = "${WORKDIR}/sqlite-autoconf-3070602"
-PR = "r0"
+PR = "r2"
 
 SRC_URI[md5sum] = "f16c08617968b4087b3d591fd575f59f"
 SRC_URI[sha256sum] = "53aa66f30d8ff87230d4173b7979814432b8084da77fba05992223f76593fc81"
-- 
1.7.3.4



