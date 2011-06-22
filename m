Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QZJ9l-0002ZG-BU
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 10:51:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2011 01:47:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,405,1304319600"; d="scan'208";a="16691237"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by azsmga001.ch.intel.com with ESMTP; 22 Jun 2011 01:47:53 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2011 17:01:09 +0800
Message-Id: <d7c256ba838d05c85c6e7c2569f0a6c7b276ab17.1308732995.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308732995.git.dongxiao.xu@intel.com>
References: <cover.1308732995.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1308732995.git.dongxiao.xu@intel.com>
References: <cover.1308732995.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Wed, 22 Jun 2011 08:51:30 -0000

*libc's do_package will cost a lot of time due to the locale handing,
which may delay the other recipe's do_package task and affect the build
performance.

This commit moves locale handling into a separate recipe *libc-locale.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/libc-common.bbclass                   |   23 ++++++++
 meta/classes/libc-package.bbclass                  |   24 --------
 meta/conf/distro/include/tclibc-eglibc.inc         |    2 +-
 meta/conf/distro/include/tclibc-glibc.inc          |    2 +-
 meta/recipes-core/eglibc/eglibc-initial_2.13.bb    |    4 ++
 meta/recipes-core/eglibc/eglibc-locale_2.13.bb     |   58 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc-package.inc        |   32 +----------
 meta/recipes-core/eglibc/eglibc.inc                |    4 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |   12 ++++
 meta/recipes-core/glibc/glibc-initial_2.10.1.bb    |    4 ++
 meta/recipes-core/glibc/glibc-locale_2.10.1.bb     |   50 +++++++++++++++++
 meta/recipes-core/glibc/glibc-package.inc          |   29 ++---------
 meta/recipes-core/glibc/glibc.inc                  |    2 +-
 meta/recipes-core/glibc/glibc_2.10.1.bb            |   12 ++++
 .../meta/external-csl-toolchain_2008q3-72.bb       |    1 +
 15 files changed, 176 insertions(+), 83 deletions(-)
 create mode 100644 meta/classes/libc-common.bbclass
 create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.13.bb
 create mode 100644 meta/recipes-core/glibc/glibc-locale_2.10.1.bb

diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
new file mode 100644
index 0000000..bae0ace
--- /dev/null
+++ b/meta/classes/libc-common.bbclass
@@ -0,0 +1,23 @@
+do_install() {
+	oe_runmake install_root=${D} install
+	for r in ${rpcsvc}; do
+		h=`echo $r|sed -e's,\.x$,.h,'`
+		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${D}/${includedir}/rpcsvc/
+	done
+	install -m 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/
+	install -d ${D}${libdir}/locale
+	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
+	# get rid of some broken files...
+	for i in ${GLIBC_BROKEN_LOCALES}; do
+		grep -v $i ${WORKDIR}/SUPPORTED > ${WORKDIR}/SUPPORTED.tmp
+		mv ${WORKDIR}/SUPPORTED.tmp ${WORKDIR}/SUPPORTED
+	done
+	rm -f ${D}{sysconfdir}/rpc
+	rm -rf ${D}${datadir}/zoneinfo
+	rm -rf ${D}${libexecdir}/getconf
+}
+
+def get_libc_fpu_setting(bb, d):
+    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+        return "--without-fp"
+    return ""
diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 55e3d48..5737af4 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -37,11 +37,6 @@ python __anonymous () {
                 break
 }
 
-def get_libc_fpu_setting(bb, d):
-    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
-        return "--without-fp"
-    return ""
-
 OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 
 do_configure_prepend() {
@@ -84,25 +79,6 @@ rm -rf ${TMP_LOCALE}
 }
 
 
-do_install() {
-	oe_runmake install_root=${D} install
-	for r in ${rpcsvc}; do
-		h=`echo $r|sed -e's,\.x$,.h,'`
-		install -m 0644 ${S}/sunrpc/rpcsvc/$h ${D}/${includedir}/rpcsvc/
-	done
-	install -m 0644 ${WORKDIR}/etc/ld.so.conf ${D}/${sysconfdir}/
-	install -d ${D}${libdir}/locale
-	make -f ${WORKDIR}/generate-supported.mk IN="${S}/localedata/SUPPORTED" OUT="${WORKDIR}/SUPPORTED"
-	# get rid of some broken files...
-	for i in ${GLIBC_BROKEN_LOCALES}; do
-		grep -v $i ${WORKDIR}/SUPPORTED > ${WORKDIR}/SUPPORTED.tmp
-		mv ${WORKDIR}/SUPPORTED.tmp ${WORKDIR}/SUPPORTED
-	done
-	rm -f ${D}${sysconfdir}/rpc
-	rm -rf ${D}${datadir}/zoneinfo
-	rm -rf ${D}${libexecdir}/getconf
-}
-
 TMP_LOCALE="/tmp/locale${libdir}/locale"
 
 do_prep_locale_tree() {
diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index a4c648e..90de04f 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -10,7 +10,7 @@ TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d
 # Add glibc overrides to the overrides for eglibc.
 OVERRIDES .= ":libc-glibc"
 
-PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
+PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc-locale"
 PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?= "eglibc-nativesdk"
 PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
 PREFERRED_PROVIDER_virtual/libc ?= "eglibc"
diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index e5843b0..748c23f 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -10,7 +10,7 @@ TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d
 # Add glibc to the overrides.
 OVERRIDES =. "libc-glibc:"
 
-PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
+PREFERRED_PROVIDER_virtual/libiconv ?= "glibc-locale"
 PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?= "glibc-nativesdk"
 PREFERRED_PROVIDER_virtual/libintl ?= "glibc"
 PREFERRED_PROVIDER_virtual/libc ?= "glibc"
diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.13.bb b/meta/recipes-core/eglibc/eglibc-initial_2.13.bb
index 787c762..b934f5b 100644
--- a/meta/recipes-core/eglibc/eglibc-initial_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc-initial_2.13.bb
@@ -1,6 +1,10 @@
 require eglibc_${PV}.bb
 require eglibc-initial.inc
 
+do_install_locale() {
+	:
+}
+
 do_configure_prepend () {
         unset CFLAGS
 }
diff --git a/meta/recipes-core/eglibc/eglibc-locale_2.13.bb b/meta/recipes-core/eglibc/eglibc-locale_2.13.bb
new file mode 100644
index 0000000..5faa509
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-locale_2.13.bb
@@ -0,0 +1,58 @@
+INHIBIT_DEFAULT_DEPS = "1"
+LICENSE = "LGPL"
+
+BPN = "eglibc"
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+# Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
+# is set. The idea is to avoid running localedef on the target (at first boot)
+# to decrease initial boot time and avoid localedef being killed by the OOM
+# killer which used to effectively break i18n on machines with < 128MB RAM.
+
+# default to disabled 
+ENABLE_BINARY_LOCALE_GENERATION ?= "0"
+ENABLE_BINARY_LOCALE_GENERATION_pn-eglibc-locale-nativesdk = "0"
+
+#enable locale generation on these arches
+# BINARY_LOCALE_ARCHES is a space separated list of regular expressions
+BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
+
+# set "1" to use cross-localedef for locale generation
+# set "0" for qemu emulation of native localedef for locale generation
+LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
+
+PR = "r0"
+
+PKGSUFFIX = ""
+PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+
+PACKAGES = "eglibc-locale localedef${PKGSUFFIX}"
+
+PACKAGES_DYNAMIC = "locale-base-* \
+                    eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* \
+                    glibc-gconv-*${PKGSUFFIX}  glibc-charmap-*  glibc-localedata-*  glibc-binary-localedata-*"
+
+PROVIDES = "virtual/libiconv"
+
+RPROVIDES_eglibc-locale = "glibc-locale"
+
+FILES_eglibc-gconv = "${libdir}/gconv/*"
+FILES_localedef${PKGSUFFIX} = "${bindir}/localedef"
+
+do_install () {
+	cp -fpPR ${STAGING_INCDIR}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}/* ${D}
+	cp -fpPR ${D}/SUPPORTED ${WORKDIR}
+}
+
+DESCRIPTION_localedef = "eglibc: compile locale definition files"
+
+inherit libc-package
+
+do_install[depends] += "virtual/libc${PKGSUFFIX}:do_populate_sysroot"
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index 76ebdc3..63a1de9 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -14,35 +14,13 @@ python __anonymous () {
                                    bb.data.getVar('TARGET_OS', d, 1))
 }
 
-# Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
-# is set. The idea is to avoid running localedef on the target (at first boot)
-# to decrease initial boot time and avoid localedef being killed by the OOM
-# killer which used to effectively break i18n on machines with < 128MB RAM.
-
-# default to disabled 
-ENABLE_BINARY_LOCALE_GENERATION ?= "0"
-ENABLE_BINARY_LOCALE_GENERATION_pn-eglibc-nativesdk = "0"
-
-#enable locale generation on these arches
-# BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
-
-# set "1" to use cross-localedef for locale generation
-# set "0" for qemu emulation of native localedef for locale generation
-LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
-
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
 
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} localedef${PKGSUFFIX} libcidn ${PN}-utils ${PN}-pic ${PN}-dev eglibc-doc eglibc-locale libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile"
-
-PACKAGES_DYNAMIC = " \
-		    glibc-gconv-*${PKGSUFFIX} glibc-charmap-* glibc-localedata-* glibc-binary-localedata-* \
-		    eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* eglibc-binary-localedata-* \
-		    locale-base-*${PKGSUFFIX}"
+PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-utils ${PN}-pic ${PN}-dev eglibc-doc libcidn libmemusage libsegfault${PKGSUFFIX} eglibc-extra-nss eglibc-thread-db${PKGSUFFIX} eglibc-pcprofile"
 
 # Create a eglibc-binaries
 ALLOW_EMPTY_${PN}-binaries = "1"
@@ -69,7 +47,6 @@ RPROVIDES_eglibc-utils = "glibc-utils"
 RPROVIDES_eglibc-pic = "glibc-pic"
 RPROVIDES_eglibc-dev = "glibc-dev"
 RPROVIDES_eglibc-doc = "glibc-doc"
-RPROVIDES_eglibc-locale = "glibc-locale"
 RPROVIDES_eglibc-extra-nss = "glibc-extra-nss"
 RPROVIDES_eglibc-thread-db = "glibc-thread-db"
 RPROVIDES_eglibc-pcprofile = "glibc-pcprofile"
@@ -88,13 +65,11 @@ FILES_eglibc-dev_append += "${bindir}/rpcgen ${libdir}/*.a \
 	${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal"
 FILES_nscd${PKGSUFFIX} = "${sbindir}/nscd*"
 FILES_eglibc-utils = "${bindir}/* ${sbindir}/*"
-FILES_eglibc-gconv = "${libdir}/gconv/*"
-FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/gconv/.debug"
+FILES_${PN}-dbg += "${libexecdir}/*/.debug"
 FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
 RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
 FILES_eglibc-pcprofile = "${base_libdir}/libpcprofile.so"
 FILES_eglibc-thread-db${PKGSUFFIX} = "${base_libdir}/libthread_db*"
-FILES_localedef${PKGSUFFIX} = "${bindir}/localedef"
 RPROVIDES_eglibc-dev += "libc-dev"
 
 SUMMARY_sln = "The static ln."
@@ -105,9 +80,8 @@ SUMMARY_eglibc-extra-nss = "hesiod, NIS and NIS+ nss libraries"
 DESCRIPTION_eglibc-extra-nss = "eglibc: nis, nisplus and hesiod search services."
 SUMMARY_ldd = "print shared library dependencies"
 DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each program or shared library specified on the command line."
-DESCRIPTION_localedef = "eglibc: compile locale definition files"
 SUMMARY_eglibc-utils = "Miscellaneous utilities provided by eglibc"
 DESCRIPTION_eglibc-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
 
-inherit libc-package
+inherit libc-common
 
diff --git a/meta/recipes-core/eglibc/eglibc.inc b/meta/recipes-core/eglibc/eglibc.inc
index 616f1af..d00392a 100644
--- a/meta/recipes-core/eglibc/eglibc.inc
+++ b/meta/recipes-core/eglibc/eglibc.inc
@@ -26,7 +26,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc-intermediate linux-libc-headers"
 # nptl needs libgcc but dlopens it, so our shlibs code doesn't detect this
 #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
-PROVIDES += "virtual/libintl virtual/libiconv"
+PROVIDES += "virtual/libintl"
 inherit autotools
 require eglibc-options.inc
 
@@ -43,7 +43,7 @@ EGLIBCPARALLELISM := "PARALLELMFLAGS="${PARALLEL_MAKE}""
 EXTRA_OEMAKE += ${EGLIBCPARALLELISM}
 PARALLEL_MAKE = ""
 
-PACKAGES = "glibc catchsegv sln nscd ldd localedef glibc-utils glibc-dev glibc-doc glibc-locale libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
+PACKAGES = "glibc catchsegv sln nscd ldd glibc-utils glibc-dev glibc-doc libsegfault glibc-extra-nss glibc-thread-db glibc-pcprofile"
 
 OE_FEATURES = "${@features_to_eglibc_settings(d)}"
 do_configure_prepend() {
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 3490d2d..603d9cd 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -110,6 +110,18 @@ do_compile () {
 	)
 }
 
+do_install_locale () {
+	dest=${D}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
+	install -d ${dest} ${dest}${bindir}
+	cp -fpPR ${D}${base_libdir} ${dest}${base_prefix}
+	cp -fpPR ${D}${libdir} ${dest}${exec_prefix}
+	cp -fpPR ${D}${datadir} ${dest}${exec_prefix}
+	cp -fpPR ${D}${bindir}/localedef ${dest}${bindir}
+	cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
+}
+
+addtask do_install_locale after do_install before do_populate_sysroot
+
 require eglibc-package.inc
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-core/glibc/glibc-initial_2.10.1.bb b/meta/recipes-core/glibc/glibc-initial_2.10.1.bb
index d662970..bc3d7e4 100644
--- a/meta/recipes-core/glibc/glibc-initial_2.10.1.bb
+++ b/meta/recipes-core/glibc/glibc-initial_2.10.1.bb
@@ -1,6 +1,10 @@
 require glibc_${PV}.bb
 require glibc-initial.inc
 
+do_install_locale() {
+	:
+}
+
 do_configure_prepend () {
 	unset CFLAGS
 }
diff --git a/meta/recipes-core/glibc/glibc-locale_2.10.1.bb b/meta/recipes-core/glibc/glibc-locale_2.10.1.bb
new file mode 100644
index 0000000..10751bf
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc-locale_2.10.1.bb
@@ -0,0 +1,50 @@
+#INHIBIT_DEFAULT_DEPS = "1"
+LICENSE = "LGPL"
+
+BPN = "glibc"
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+# Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
+# is set. The idea is to avoid running localedef on the target (at first boot)
+# to decrease initial boot time and avoid localedef being killed by the OOM
+# killer which used to effectively break i18n on machines with < 128MB RAM.
+
+# default to disabled 
+ENABLE_BINARY_LOCALE_GENERATION ?= "0"
+ENABLE_BINARY_LOCALE_GENERATION_pn-glibc-locale-nativesdk = "0"
+
+#enable locale generation on these arches
+# BINARY_LOCALE_ARCHES is a space separated list of regular expressions
+BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
+
+# set "1" to use cross-localedef for locale generation
+# set "0" for qemu emulation of native localedef for locale generation
+LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
+
+PR = "r0"
+
+PKGSUFFIX = ""
+PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+
+PACKAGES = "glibc-locale localedef${PKGSUFFIX}"
+
+PACKAGES_DYNAMIC = "locale-base-* \
+                    glibc-gconv-*${PKGSUFFIX}  glibc-charmap-*  glibc-localedata-*  glibc-binary-localedata-*"
+
+
+PROVIDES = "virtual/libiconv"
+
+FILES_localedef${PKGSUFFIX} = "${bindir}/localedef"
+
+do_install () {
+	cp -fpPR ${STAGING_INCDIR}/glibc-locale-internal-${MULTIMACH_TARGET_SYS}/* ${D}
+	cp -fpPR ${D}/SUPPORTED ${WORKDIR}
+}
+
+do_install[depends] += "virtual/libc:do_populate_sysroot"
+do_install_virtclass-nativesdk[depends] += "virtual/libc-nativesdk:do_populate_sysroot"
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 27dc427..5373d56 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -14,34 +14,14 @@ python __anonymous () {
                                    bb.data.getVar('TARGET_OS', d, 1))
 }
 
-
-# Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
-# is set. The idea is to avoid running localedef on the target (at first boot)
-# to decrease initial boot time and avoid localedef being killed by the OOM
-# killer which used to effectively break i18n on machines with < 128MB RAM.
-
-# default to disabled until qemu works for everyone
-ENABLE_BINARY_LOCALE_GENERATION ?= "0"
-ENABLE_BINARY_LOCALE_GENERATION_pn-glibc-nativesdk = "0"
-
-# BINARY_LOCALE_ARCHES is a space separated list of regular expressions
-BINARY_LOCALE_ARCHES ?= "arm.* i[3-6]86 x86_64 powerpc mips"
-
-# set "1" to use cross-localedef for locale generation
-# set "0" for qemu emulation of native localedef for locale generation
-LOCALE_GENERATION_WITH_CROSS-LOCALEDEF = "1"
-
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
 PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} \
-	ldd${PKGSUFFIX} localedef${PKGSUFFIX} ${PN}-utils ${PN}-dev ${PN}-doc \
-	${PN}-locale libsegfault${PKGSUFFIX} ${PN}-extra-nss ${PN}-thread-db \
+	ldd${PKGSUFFIX} ${PN}-utils ${PN}-dev ${PN}-doc \
+	libsegfault${PKGSUFFIX} ${PN}-extra-nss ${PN}-thread-db \
 	${PN}-pcprofile"
 
-PACKAGES_DYNAMIC = "glibc-gconv-*${PKGSUFFIX} glibc-charmap-* glibc-localedata-* locale-base-* \
-	glibc-binary-localedata-*"
-
 libc_baselibs = "${base_libdir}/libc* ${base_libdir}/libm* ${base_libdir}/ld* \
 	${base_libdir}/libpthread* ${base_libdir}/libresolv* ${base_libdir}/librt* \
 	${base_libdir}/libutil* ${base_libdir}/libnsl* ${base_libdir}/libnss_files* \
@@ -77,7 +57,6 @@ FILES_catchsegv${PKGSUFFIX} = "${bindir}/catchsegv"
 RDEPENDS_catchsegv${PKGSUFFIX} = "libsegfault"
 FILES_glibc-pcprofile = "${base_libdir}/libpcprofile.so"
 FILES_glibc-thread-db = "${base_libdir}/libthread_db*"
-FILES_localedef${PKGSUFFIX} = "${bindir}/localedef"
 RPROVIDES_glibc-dev += "libc-dev"
 
 SUMMARY_sln = "The static ln."
@@ -88,10 +67,10 @@ SUMMARY_glibc-extra-nss = "hesiod, NIS and NIS+ nss libraries"
 DESCRIPTION_glibc-extra-nss = "glibc: nis, nisplus and hesiod search services.
 SUMMARY_ldd = "print shared library dependencies"
 DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each program or shared library specified on the command line."
-DESCRIPTION_localedef = "glibc: compile locale definition files"
 SUMMARY_glibc-utils = "Miscellaneous utilities provided by glibc"
 DESCRIPTION_glibc-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
 
 EXTRA_OEMAKE += "rootsbindir=${base_sbindir}"
 
-inherit libc-package
+inherit libc-common
+
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 127ae23..a051161 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -15,7 +15,7 @@ RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
 #RDEPENDS_ldd += " bash"
 #RDEPENDS_${PN} += "${@['','libgcc']['nptl' in '${GLIBC_ADDONS}']}"
 PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
-PROVIDES += "virtual/libintl virtual/libiconv"
+PROVIDES += "virtual/libintl"
 
 STAGINGCC = "gcc-cross-intermediate"
 STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
diff --git a/meta/recipes-core/glibc/glibc_2.10.1.bb b/meta/recipes-core/glibc/glibc_2.10.1.bb
index 33ebe24..a2e7b83 100644
--- a/meta/recipes-core/glibc/glibc_2.10.1.bb
+++ b/meta/recipes-core/glibc/glibc_2.10.1.bb
@@ -154,6 +154,18 @@ do_compile () {
 	)
 }
 
+do_install_locale () {
+	dest=${D}/${includedir}/glibc-locale-internal-${MULTIMACH_TARGET_SYS}
+	install -d ${dest} ${dest}${bindir}
+	cp -fpPR ${D}${base_libdir} ${dest}${base_prefix}
+	cp -fpPR ${D}${libdir} ${dest}${exec_prefix}
+	cp -fpPR ${D}${datadir} ${dest}${exec_prefix}
+	cp -fpPR ${D}${bindir}/localedef ${dest}${bindir}
+	cp -fpPR ${WORKDIR}/SUPPORTED ${dest}
+}
+
+addtask do_install_locale after do_install before do_populate_sysroot
+
 require glibc-stage.inc
 
 require glibc-package.inc
diff --git a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
index f714928..a874c8b 100644
--- a/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain_2008q3-72.bb
@@ -40,6 +40,7 @@ do_install() {
 
 GLIBC_INTERNAL_USE_BINARY_LOCALE ?= "compile"
 
+inherit libc-common
 inherit libc-package
 
 PACKAGES += "libgcc libgcc-dev libstdc++ libstdc++-dev linux-libc-headers"
-- 
1.7.1



