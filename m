Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TG2Eg-0002md-1G
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 08:33:42 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TG22K-0004F3-OW
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 08:20:56 +0200
Message-ID: <1348467519.4444.249.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Sep 2012 07:18:39 +0100
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: [PATCH v2] eglibc: Move perl- and bash-using scripts to separate recipes
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
X-List-Received-Date: Mon, 24 Sep 2012 06:33:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This removes the dependency of eglibc.bb itself on perl and bash
which, in turn, eliminates the need to build those two recipes if the
scripts which need them are not going to be installed.

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
v2: reinstate eglibc-utils, accidentally deleted in previous version

 meta/recipes-core/eglibc/eglibc-collateral.inc  |   11 ++++++++
 meta/recipes-core/eglibc/eglibc-locale.inc      |   11 +--------
 meta/recipes-core/eglibc/eglibc-mtrace.inc      |   12 +++++++++
 meta/recipes-core/eglibc/eglibc-mtrace_2.16.bb  |    1 +
 meta/recipes-core/eglibc/eglibc-package.inc     |   29 +++++++++++++++++-----
 meta/recipes-core/eglibc/eglibc-scripts.inc     |   17 +++++++++++++
 meta/recipes-core/eglibc/eglibc-scripts_2.16.bb |    1 +
 meta/recipes-core/eglibc/eglibc_2.16.bb         |    2 +-
 8 files changed, 66 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-collateral.inc
 create mode 100644 meta/recipes-core/eglibc/eglibc-mtrace.inc
 create mode 100644 meta/recipes-core/eglibc/eglibc-mtrace_2.16.bb
 create mode 100644 meta/recipes-core/eglibc/eglibc-scripts.inc
 create mode 100644 meta/recipes-core/eglibc/eglibc-scripts_2.16.bb

diff --git a/meta/recipes-core/eglibc/eglibc-collateral.inc b/meta/recipes-core/eglibc/eglibc-collateral.inc
new file mode 100644
index 0000000..b770bb0
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-collateral.inc
@@ -0,0 +1,11 @@
+INHIBIT_DEFAULT_DEPS = "1"
+LICENSE = "GPLv2 & LGPLv2.1"
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install[depends] += "virtual/${MLPREFIX}libc:do_populate_sysroot"
+
diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-core/eglibc/eglibc-locale.inc
index 296afde..729e9e6 100644
--- a/meta/recipes-core/eglibc/eglibc-locale.inc
+++ b/meta/recipes-core/eglibc/eglibc-locale.inc
@@ -1,15 +1,8 @@
-INHIBIT_DEFAULT_DEPS = "1"
-LICENSE = "GPLv2 & LGPLv2.1"
+include eglibc-collateral.inc
 
 BPN = "eglibc"
 LOCALEBASEPN = "eglibc"
 
-do_fetch[noexec] = "1"
-do_unpack[noexec] = "1"
-do_patch[noexec] = "1"
-do_configure[noexec] = "1"
-do_compile[noexec] = "1"
-
 # Binary locales are generated at build time if ENABLE_BINARY_LOCALE_GENERATION
 # is set. The idea is to avoid running localedef on the target (at first boot)
 # to decrease initial boot time and avoid localedef being killed by the OOM
@@ -90,6 +83,4 @@ do_install () {
 
 inherit libc-package
 
-do_install[depends] += "virtual/${MLPREFIX}libc:do_populate_sysroot"
-
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-core/eglibc/eglibc-mtrace.inc b/meta/recipes-core/eglibc/eglibc-mtrace.inc
new file mode 100644
index 0000000..321de7b
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-mtrace.inc
@@ -0,0 +1,12 @@
+include eglibc-collateral.inc
+
+SUMMARY = "mtrace utility provided by eglibc"
+DESCRIPTION = "mtrace utility provided by eglibc"
+RDEPENDS_${PN} = "perl"
+
+SRC = "${STAGING_INCDIR}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}"
+
+do_install() {
+	install -d -m 0755 ${D}${bindir}
+	install -m 0755 ${SRC}/mtrace ${D}${bindir}/
+}
diff --git a/meta/recipes-core/eglibc/eglibc-mtrace_2.16.bb b/meta/recipes-core/eglibc/eglibc-mtrace_2.16.bb
new file mode 100644
index 0000000..6fa2be9
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-mtrace_2.16.bb
@@ -0,0 +1 @@
+require eglibc-mtrace.inc
diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index ab7540a..45bef10 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -17,7 +17,7 @@ python __anonymous () {
 # Set this to zero if you don't want ldconfig in the output package
 USE_LDCONFIG ?= "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-mtrace ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
+PACKAGES = "${PN}-dbg catchsegv sln nscd ldd ${PN}-utils eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} eglibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
 
 # The ld.so in this eglibc supports the GNU_HASH
 RPROVIDES_${PN} = "glibc rtld(GNU_HASH)"
@@ -51,8 +51,6 @@ FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
 FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
 FILES_catchsegv = "${bindir}/catchsegv"
 RDEPENDS_catchsegv = "libsegfault"
-RDEPENDS_${PN}-utils += "bash"
-RDEPENDS_${PN}-mtrace += "perl"
 FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
 FILES_eglibc-thread-db = "${base_libdir}/libthread_db.so.* ${base_libdir}/libthread_db-*.so"
 RPROVIDES_${PN}-dev += "libc-dev"
@@ -65,11 +63,9 @@ DESCRIPTION_nscd = "nscd, name service cache daemon, caches name service lookups
 SUMMARY_eglibc-extra-nss = "hesiod, NIS and NIS+ nss libraries"
 DESCRIPTION_eglibc-extra-nss = "eglibc: nis, nisplus and hesiod search services."
 SUMMARY_ldd = "print shared library dependencies"
-DESCRIPTION_ldd = "/usr/bin/ldd prints shared library dependencies for each program or shared library specified on the command line."
+DESCRIPTION_ldd = "${bindir}/ldd prints shared library dependencies for each program or shared library specified on the command line."
 SUMMARY_${PN}-utils = "Miscellaneous utilities provided by eglibc"
 DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, tzselect, zic, rpcinfo, ..."
-SUMMARY_${PN}-mtrace = "mtrace utility provided by eglibc"
-DESCRIPTION_${PN}-mtrace = "mtrace utility provided by eglibc"
 DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
 
 inherit libc-common multilib_header
@@ -109,10 +105,29 @@ do_install_locale () {
 
 addtask do_install_locale after do_install before do_populate_sysroot do_package
 
+bashscripts = "mtrace sotruss xtrace"
+
+do_evacuate_scripts () {
+	target=${D}${includedir}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}
+	mkdir -p $target
+	for i in ${bashscripts}; do
+		cp ${D}${bindir}/$i $target/
+	done
+}
+
+do_evacuate_scripts_pn-eglibc-initial () {
+	:
+}
+
+addtask evacuate_scripts after do_install before do_populate_sysroot do_package
+
 PACKAGE_PREPROCESS_FUNCS += "eglibc_package_preprocess"
 
 eglibc_package_preprocess () {
 	rm -rf ${PKGD}/${includedir}/eglibc-locale-internal-${MULTIMACH_TARGET_SYS}
+	rm -rf ${PKGD}/${includedir}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}
 	rm -rf ${PKGD}/${libdir}/locale
+	for i in ${bashscripts}; do
+	    rm -f ${PKGD}${bindir}/$i
+	done
 }
-
diff --git a/meta/recipes-core/eglibc/eglibc-scripts.inc b/meta/recipes-core/eglibc/eglibc-scripts.inc
new file mode 100644
index 0000000..a020961
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-scripts.inc
@@ -0,0 +1,17 @@
+include eglibc-collateral.inc
+
+SUMMARY = "utility scripts provided by eglibc"
+DESCRIPTION = "utility scripts provided by eglibc"
+RDEPENDS_${PN} = "bash"
+RDEPENDS_ldd = "bash"
+
+SRC = "${STAGING_INCDIR}/eglibc-scripts-internal-${MULTIMACH_TARGET_SYS}"
+
+bashscripts = "mtrace sotruss xtrace"
+
+do_install() {
+	install -d -m 0755 ${D}${bindir}
+	for i in ${bashscripts}; do
+		install -m 0755 ${SRC}/$i ${D}${bindir}/
+	done
+}
diff --git a/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb b/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb
new file mode 100644
index 0000000..3113362
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-scripts_2.16.bb
@@ -0,0 +1 @@
+require eglibc-scripts.inc
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index 72d134a..3a7ae50 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "20393"
 
 DEPENDS += "gperf-native kconfig-frontends-native"
-PR = "r10"
+PR = "r11"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
-- 
1.7.9





