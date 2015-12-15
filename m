Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9089D73194
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFFePTc001263 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:40:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id atp4po9-kHks
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:40:25 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFFeNC2001250
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:40:25 GMT
Message-ID: <1450194023.13505.60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Dec 2015 15:40:23 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] various: Drop now pointless manual -dbg packaging
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
X-List-Received-Date: Tue, 15 Dec 2015 15:40:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

With the autodebug package generation logic, specifically setting FILES_${PN}-dbg
isn't needed in most cases, we can remove them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index a3d08f4..55ac052 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -38,15 +38,3 @@ PERLLIBDIRS = "${libdir}/perl"
 PERLLIBDIRS_class-native = "${libdir}/perl-native"
 PERLVERSION := "${@get_perl_version(d)}"
 PERLVERSION[vardepvalue] = ""
-
-FILES_${PN}-dbg += "${PERLLIBDIRS}/auto/*/.debug \
-                    ${PERLLIBDIRS}/auto/*/*/.debug \
-                    ${PERLLIBDIRS}/auto/*/*/*/.debug \
-                    ${PERLLIBDIRS}/auto/*/*/*/*/.debug \
-                    ${PERLLIBDIRS}/auto/*/*/*/*/*/.debug \
-                    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/.debug \
-                    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/.debug \
-                    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/*/.debug \
-                    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/*/*/.debug \
-                    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/*/*/*/.debug \
-                    "
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index ea17f09..7b26ed6 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -143,9 +143,6 @@ libdir = "${exec_prefix}/lib/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 libexecdir = "${exec_prefix}/libexec/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
 FILES_${PN} = "${prefix}"
-FILES_${PN}-dbg += "${prefix}/.debug \
-                    ${prefix}/bin/.debug \
-                   "
 
 export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${layout_libdir}/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index 427275b..11722b8 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -17,8 +17,3 @@ FILES_${PN}-dev += "\
   ${libdir}/pkgconfig \
   ${PYTHON_SITEPACKAGES_DIR}/*.la \
 "
-FILES_${PN}-dbg += "\
-  ${PYTHON_SITEPACKAGES_DIR}/.debug \
-  ${PYTHON_SITEPACKAGES_DIR}/*/.debug \
-  ${PYTHON_SITEPACKAGES_DIR}/*/*/.debug \
-"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3491b12..cec4110 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -300,13 +300,7 @@ FILES_${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a ${libdir}/${BPN}/*.a"
 SECTION_${PN}-staticdev = "devel"
 RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
 
-DOTDEBUG-dbg = "${bindir}/.debug ${sbindir}/.debug ${libexecdir}/.debug ${libdir}/.debug \
-            ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug ${libdir}/${BPN}/.debug \
-            ${libdir}/matchbox-panel/.debug ${libexecdir}/${BPN}/.debug /usr/src/debug"
-
-DEBUGFILEDIRECTORY-dbg = "/usr/lib/debug /usr/src/debug"
-
-FILES_${PN}-dbg = "${@d.getVar(['DOTDEBUG-dbg', 'DEBUGFILEDIRECTORY-dbg'][d.getVar('PACKAGE_DEBUG_SPLIT_STYLE', True) == 'debug-file-directory'], True)}"
+FILES_${PN}-dbg = "/usr/lib/debug /usr/src/debug"
 
 SECTION_${PN}-dbg = "devel"
 ALLOW_EMPTY_${PN}-dbg = "1"
diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 7b44eab..ecc6c9a 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -55,9 +55,6 @@ do_deploy_class-native() {
 
 addtask deploy after do_install before do_build
 
-FILES_${PN}-dbg += "${libdir}/grub/${GRUB_TARGET}-efi/.debug \
-                   /boot/efi/EFI/BOOT/${GRUB_TARGET}-efi/.debug \
-                    "
 FILES_${PN} += "${libdir}/grub/${GRUB_TARGET}-efi \
                 ${datadir}/grub \
                 "
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index 88a709e..c1be133 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -3,9 +3,6 @@ require grub2.inc
 RDEPENDS_${PN} = "diffutils freetype"
 PR = "r1"
 
-FILES_${PN}-dbg += "${libdir}/${BPN}/i386-pc/.debug"
-
-
 EXTRA_OECONF = "--with-platform=pc --disable-grub-mkfont --program-prefix="" \
                --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index c2760c9..6a0e3ee 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -44,7 +44,6 @@ do_install_append () {
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
 RDEPENDS_${PN} = "diffutils freetype"
-FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
 
 INSANE_SKIP_${PN} = "arch"
 INSANE_SKIP_${PN}-dbg = "arch"
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 529d5a6..62bd143 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -94,14 +94,6 @@ def get_noinst_tools_paths (d, bb, tools):
 
 FILES_${PN}-noinst-tools = "${@get_noinst_tools_paths(d, bb, d.getVar('NOINST_TOOLS', True))}"
 
-FILES_${PN}-dbg += "\
-  ${libexecdir}/bluetooth/.debug \
-  ${libdir}/bluetooth/plugins/.debug \
-  ${libdir}/*/.debug \
-  */udev/.debug \
-  */*/udev/.debug \
-  "
-
 RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
 
 SYSTEMD_SERVICE_${PN} = "bluetooth.service"
diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index abd0132..1c47873 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -36,8 +36,5 @@ FILES_${PN}-dev += "${bindir}/dbus-binding-tool"
 
 RDEPENDS_${PN}-tests += "dbus-x11"
 FILES_${PN}-tests = "${datadir}/${BPN}/tests"
-FILES_${PN}-tests-dbg = "${datadir}/${BPN}/tests/.debug/* \
-                         ${datadir}/${BPN}/tests/core/.debug/* \
-                         ${datadir}/${BPN}/tests/interfaces/.debug/*"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 6e3cf56..86f7e0e 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -49,9 +49,7 @@ FILES_${PN} = "${libdir}/lib*${SOLIBS} ${libdir}/gio ${datadir}/glib-2.0/schemas
 FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${libdir}/gio/modules/lib*${SOLIBSDEV} \
                     ${libdir}/gio/modules/*.la"
-FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb \
-                    ${libdir}/gio/modules/.debug \
-                    ${libdir}/glib-2.0/installed-tests/glib/.debug"
+FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb"
 FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py"
 FILES_${PN}-bash-completion = "${sysconfdir}/bash_completion.d \
                                ${datadir}/bash-completion"
diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
index df6d073..ad1fc5c 100644
--- a/meta/recipes-core/glibc/glibc-locale.inc
+++ b/meta/recipes-core/glibc/glibc-locale.inc
@@ -64,7 +64,6 @@ DESCRIPTION_localedef = "glibc: compile locale definition files"
 # FILES_glibc-gconv will not be automatically extended in multilib.
 # Explicitly add ${MLPREFIX} for FILES_glibc-gconv.
 FILES_${MLPREFIX}glibc-gconv = "${libdir}/gconv/*"
-FILES_${PN}-dbg += "${libdir}/gconv/.debug/*"
 FILES_localedef = "${bindir}/localedef"
 
 LOCALETREESRC = "${STAGING_INCDIR}/glibc-locale-internal-${MULTIMACH_TARGET_SYS}"
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 36c5350..bad6424 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -54,7 +54,6 @@ FILES_nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_unitdir}/syst
 FILES_${PN}-mtrace = "${bindir}/mtrace"
 FILES_tzcode = "${bindir}/tzselect ${sbindir}/zic ${sbindir}/zdump"
 FILES_${PN}-utils = "${bindir}/* ${sbindir}/*"
-FILES_${PN}-dbg += "${libexecdir}/*/.debug ${libdir}/audit/.debug"
 FILES_catchsegv = "${bindir}/catchsegv"
 RDEPENDS_catchsegv = "libsegfault"
 FILES_${PN}-pcprofile = "${base_libdir}/libpcprofile.so"
diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 428158a..72bf678 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -244,8 +244,6 @@ RDEPENDS_${PN}-initramfs = "${PN}"
 RDEPENDS_${PN}-ptest += "perl python bash"
 FILES_${PN}-ptest += "${libdir}/udev/rules.d"
 
-FILES_${PN}-dbg += "${libdir}/systemd/ptest/.debug"
-
 FILES_${PN}-gui = "${bindir}/systemadm"
 
 FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
@@ -322,7 +320,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${nonarch_base_libdir}/udev/rules.d/99-systemd.rules \
                "
 
-FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
 RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
@@ -337,9 +334,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty systemd-vconsole-setup \
 
 INSANE_SKIP_${PN}-doc += " libdir"
 
-PACKAGES =+ "udev-dbg udev udev-hwdb"
-
-FILES_udev-dbg += "${nonarch_base_libdir}/udev/.debug"
+PACKAGES =+ "udev udev-hwdb"
 
 RPROVIDES_udev = "hotplug"
 
diff --git a/meta/recipes-core/systemd/systemd_git.bb b/meta/recipes-core/systemd/systemd_git.bb
new file mode 100644
index 0000000..c3c78df
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd_git.bb
@@ -0,0 +1,342 @@
+SUMMARY = "System and service manager for Linux, replacing SysVinit"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/systemd"
+
+LICENSE = "GPLv2 & LGPLv2.1 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
+                    file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c \
+                    file://LICENSE.MIT;md5=544799d0b492f119fa04641d1b8868ed"
+
+PROVIDES = "udev"
+
+PE = "1"
+
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+
+SECTION = "base/shell"
+
+inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest
+
+SRC_URI = "git://anongit.freedesktop.org/systemd/systemd \
+           file://binfmt-install.patch \
+           file://touchscreen.rules \
+           ${UCLIBCPATCHES} \
+           file://00-create-volatile.conf \
+           file://init \
+           file://run-ptest \
+          "
+SRC_URI[md5sum] = "df64550d92afbffb4f67a434193ee165"
+SRC_URI[sha256sum] = "aa64fa864466fd5727005c55d61c092828b94b4f857272c0b503695022146390"
+
+UCLIBCPATCHES = ""
+UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
+                             file://systemd-pam-fix-execvpe.patch \
+                             file://systemd-pam-fix-fallocate.patch \
+                             file://systemd-pam-fix-getty-unit.patch \
+                             file://systemd-pam-fix-mkostemp.patch \
+                             file://systemd-pam-fix-msformat.patch \
+                             file://optional_secure_getenv.patch \
+                             file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
+                            "
+LDFLAGS_libc-uclibc_append = " -lrt"
+
+GTKDOC_DOCDIR = "${S}/docs/"
+
+S = "${WORKDIR}/git"
+SRCREV = "ecd2f2c5947d9e2f4d6792c2a3a90b8ced6a5b3e"
+PV = "208+git${SRCPV}"
+
+PACKAGECONFIG ??= "xz tcp-wrappers"
+# Sign the journal for anti-tampering
+PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
+# regardless of PACKAGECONFIG, libgcrypt is always required to expand
+# the AM_PATH_LIBGCRYPT autoconf macro
+DEPENDS += "libgcrypt"
+# Compress the journal
+PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
+PACKAGECONFIG[tcp-wrappers] = "--enable-tcpwrap,--disable-tcpwrap,tcp-wrappers"
+PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
+
+CACHED_CONFIGUREVARS = "ac_cv_path_KILL=${base_bindir}/kill"
+
+# Helper variables to clarify locations.  This mirrors the logic in systemd's
+# build system.
+rootprefix ?= "${base_prefix}"
+rootlibdir ?= "${base_libdir}"
+rootlibexecdir = "${rootprefix}/lib"
+
+# The gtk+ tools should get built as a separate recipe e.g. systemd-tools
+EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
+                 --with-rootlibdir=${rootlibdir} \
+                 ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
+                 --enable-xz \
+                 --enable-compat-libs \
+                 --disable-manpages \
+                 --disable-coredump \
+                 --disable-introspection \
+                 --disable-tcpwrap \
+                 --enable-split-usr \
+                 --disable-microhttpd \
+                 --without-python \
+                 --with-sysvrcnd-path=${sysconfdir} \
+                 --with-firmware-path=/lib/firmware \
+                 ac_cv_path_KILL=${base_bindir}/kill \
+               "
+# uclibc does not have NSS
+EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
+
+do_configure_prepend() {
+	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
+	export KMOD="${base_bindir}/kmod"
+	sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
+}
+
+do_install() {
+	autotools_do_install
+	install -d ${D}/${base_sbindir}
+	# Provided by a separate recipe
+	rm ${D}${systemd_unitdir}/system/serial-getty* -f
+
+	# Provide support for initramfs
+	ln -s ${rootlibexecdir}/systemd/systemd ${D}/init
+	ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
+
+	# Create machine-id
+	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
+	touch ${D}${sysconfdir}/machine-id
+
+	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
+
+	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+
+	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+		install -d ${D}${sysconfdir}/init.d
+		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
+		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
+	fi
+
+        # Delete journal README, as log can be symlinked inside volatile.
+        rm -f ${D}/${localstatedir}/log/README
+}
+
+do_install_ptest () {
+     #  install -d ${D}${PTEST_PATH}/test
+     #  install ${S}/test/* ${D}${PTEST_PATH}/test
+     #  install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
+     #  install -d ${D}${PTEST_PATH}/build-aux
+     #  cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
+     #  cp -rf ${B}/rules ${D}${PTEST_PATH}/
+     #  # This directory needs to be there for udev-test.pl to work.
+     #  install -d ${D}${libdir}/udev/rules.d
+     #  cp ${B}/Makefile ${D}${PTEST_PATH}/
+     #  cp ${S}/test/sys.tar.xz ${D}${PTEST_PATH}/test
+     #  sed -i 's/"tree"/"ls"/' ${D}${PTEST_PATH}/test/udev-test.pl
+     #  sed -i 's#${S}#${PTEST_PATH}#g' ${D}${PTEST_PATH}/Makefile
+     #  sed -i 's#${B}#${PTEST_PATH}#g' ${D}${PTEST_PATH}/Makefile
+     :
+}
+
+python populate_packages_prepend (){
+    systemdlibdir = d.getVar("rootlibdir", True)
+    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+    libdir = d.getVar("libdir", True)
+    do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+}
+PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
+
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install \
+             ${PN}-rpm-macros ${PN}-binfmt ${PN}-pam ${PN}-zsh"
+
+SYSTEMD_PACKAGES = "${PN}-binfmt"
+SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+
+FILES_${PN}-analyze = "${bindir}/systemd-analyze"
+
+FILES_${PN}-initramfs = "/init"
+RDEPENDS_${PN}-initramfs = "${PN}"
+
+# The test cases need perl and bash to run correctly.
+RDEPENDS_${PN}-ptest += "perl bash"
+FILES_${PN}-ptest += "${libdir}/udev/rules.d"
+
+FILES_${PN}-gui = "${bindir}/systemadm"
+
+FILES_${PN}-vconsole-setup = "${rootlibexecdir}/systemd/systemd-vconsole-setup \
+                              ${systemd_unitdir}/system/systemd-vconsole-setup.service \
+                              ${systemd_unitdir}/system/sysinit.target.wants/systemd-vconsole-setup.service"
+
+FILES_${PN}-kernel-install = "${bindir}/kernel-install \
+                              ${sysconfdir}/kernel/ \
+                              ${exec_prefix}/lib/kernel \
+                             "
+FILES_${PN}-rpm-macros = "${exec_prefix}/lib/rpm \
+                         "
+
+FILES_${PN}-zsh = "${datadir}/zsh/site-functions"
+
+FILES_${PN}-binfmt = "${sysconfdir}/binfmt.d/ \
+                      ${exec_prefix}/lib/binfmt.d \
+                      ${rootlibexecdir}/systemd/systemd-binfmt \
+                      ${systemd_unitdir}/system/proc-sys-fs-binfmt_misc.* \
+                      ${systemd_unitdir}/system/systemd-binfmt.service"
+RRECOMMENDS_${PN}-binfmt = "kernel-module-binfmt-misc"
+
+RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
+
+CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
+                ${sysconfdir}/systemd/logind.conf \
+                ${sysconfdir}/systemd/system.conf \
+                ${sysconfdir}/systemd/user.conf"
+
+FILES_${PN} = " ${base_bindir}/* \
+                ${bindir}/* \
+                ${datadir}/bash-completion \
+                ${datadir}/dbus-1/services \
+                ${datadir}/dbus-1/system-services \
+                ${datadir}/polkit-1 \
+                ${datadir}/${BPN} \
+                ${sysconfdir}/bash_completion.d/ \
+                ${sysconfdir}/dbus-1/ \
+                ${sysconfdir}/machine-id \
+                ${sysconfdir}/modules-load.d/ \
+                ${sysconfdir}/sysctl.d/ \
+                ${sysconfdir}/systemd/ \
+                ${sysconfdir}/tmpfiles.d/ \
+                ${sysconfdir}/xdg/ \
+                ${sysconfdir}/init.d/README \
+                ${rootlibexecdir}/systemd/* \
+                ${systemd_unitdir}/* \
+                ${base_libdir}/security/*.so \
+                ${libdir}/libnss_myhostname.so.2 \
+                /cgroup \
+                ${bindir}/systemd* \
+                ${bindir}/localectl \
+                ${bindir}/hostnamectl \
+                ${bindir}/timedatectl \
+                ${bindir}/bootctl \
+                ${bindir}/kernel-install \
+                ${exec_prefix}/lib/tmpfiles.d/*.conf \
+                ${exec_prefix}/lib/systemd \
+                ${exec_prefix}/lib/modules-load.d \
+                ${exec_prefix}/lib/sysctl.d \
+                ${localstatedir} \
+                /lib/udev/rules.d/70-uaccess.rules \
+                /lib/udev/rules.d/71-seat.rules \
+                /lib/udev/rules.d/73-seat-late.rules \
+                /lib/udev/rules.d/99-systemd.rules \
+                ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${sysconfdir}/pam.d', '', d)} \
+               "
+
+FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
+
+RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
+
+RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
+                      util-linux-agetty \
+                      util-linux-fsck e2fsprogs-e2fsck \
+                      kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
+"
+
+PACKAGES =+ "udev udev-utils udev-hwdb"
+
+RDEPENDS_udev += "udev-utils"
+RPROVIDES_udev = "hotplug"
+RRECOMMENDS_udev += "udev-hwdb"
+
+RDEPENDS_udev-hwdb += "udev-utils"
+
+FILES_udev += "${base_sbindir}/udevd \
+               ${rootlibexecdir}/systemd/systemd-udevd \
+               ${rootlibexecdir}/udev/accelerometer \
+               ${rootlibexecdir}/udev/ata_id \
+               ${rootlibexecdir}/udev/cdrom_id \
+               ${rootlibexecdir}/udev/collect \
+               ${rootlibexecdir}/udev/findkeyboards \
+               ${rootlibexecdir}/udev/keyboard-force-release.sh \
+               ${rootlibexecdir}/udev/keymap \
+               ${rootlibexecdir}/udev/mtd_probe \
+               ${rootlibexecdir}/udev/scsi_id \
+               ${rootlibexecdir}/udev/v4l_id \
+               ${rootlibexecdir}/udev/keymaps \
+               ${rootlibexecdir}/udev/rules.d/4*.rules \
+               ${rootlibexecdir}/udev/rules.d/5*.rules \
+               ${rootlibexecdir}/udev/rules.d/6*.rules \
+               ${rootlibexecdir}/udev/rules.d/70-power-switch.rules \
+               ${rootlibexecdir}/udev/rules.d/75*.rules \
+               ${rootlibexecdir}/udev/rules.d/78*.rules \
+               ${rootlibexecdir}/udev/rules.d/8*.rules \
+               ${rootlibexecdir}/udev/rules.d/95*.rules \
+               ${sysconfdir}/udev \
+               ${sysconfdir}/init.d/systemd-udevd \
+               ${systemd_unitdir}/system/*udev* \
+               ${systemd_unitdir}/system/*.wants/*udev* \
+              "
+
+FILES_udev-utils = "${base_bindir}/udevadm ${datadir}/bash-completion/completions/udevadm"
+
+FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d"
+
+INITSCRIPT_PACKAGES = "udev"
+INITSCRIPT_NAME_udev = "systemd-udevd"
+INITSCRIPT_PARAMS_udev = "start 03 S ."
+
+python __anonymous() {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
+
+# TODO:
+# u-a for runlevel and telinit
+
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
+
+ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
+ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
+ALTERNATIVE_PRIORITY[init] ?= "300"
+
+ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
+ALTERNATIVE_PRIORITY[halt] ?= "300"
+
+ALTERNATIVE_TARGET[reboot] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
+ALTERNATIVE_PRIORITY[reboot] ?= "300"
+
+ALTERNATIVE_TARGET[shutdown] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[shutdown] = "${base_sbindir}/shutdown"
+ALTERNATIVE_PRIORITY[shutdown] ?= "300"
+
+ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
+ALTERNATIVE_PRIORITY[poweroff] ?= "300"
+
+ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
+ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
+ALTERNATIVE_PRIORITY[runlevel] ?= "300"
+
+pkg_postinst_udev-hwdb () {
+	if test -n "$D"; then
+		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
+			--root $D
+	else
+		udevadm hwdb --update
+	fi
+}
+
+pkg_prerm_udev-hwdb () {
+	if test -n "$D"; then
+		exit 1
+	fi
+
+	rm -f ${sysconfdir}/udev/hwdb.bin
+}
+
+# As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
+# that we don't build both udev and systemd in world builds.
+python () {
+    if not bb.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
+        raise bb.parse.SkipPackage("'systemd' not in DISTRO_FEATURES")
+}
diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index c378ae3..c00ed34 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -68,10 +68,6 @@ RRECOMMENDS_${PN} += "udev-cache"
 RCONFLICTS_${PN} += "udev-utils"
 RREPLACES_${PN} += "udev-utils"
 
-FILES_${PN}-dbg += "${libexecdir}/.debug"
-FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
-FILES_${PN}-dbg += "${base_libdir}/udev/.debug/*"
-FILES_${PN}-dbg += "${nonarch_base_libdir}/udev/.debug/*"
 FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
                    ${includedir}/libudev.h ${libdir}/libudev.so ${libdir}/libudev.la \
                    ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc \
diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
index 43f16e4..b4dfe15 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -51,9 +51,6 @@ EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
                 "
 EXTRA_OEMAKE_install = " 'SCRIPTS=' "
 
-FILES_${PN}-dbg += "${libdir}/${BPN}${PV}/.debug \
-                    ${libdir}/.debug \
-                   "
 FILES_${PN}-dev = "${libdir_native}/expect${PV}/libexpect*.so \
                    ${includedir}/expect.h \
                    ${includedir}/expect_tcl.h \
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 54e4881..e1cad10 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -84,11 +84,6 @@ FILES_${PN} = "\
 "
 INSANE_SKIP_${PN} += "dev-so"
 
-FILES_${PN}-dbg += " \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/.debug \
-"
-
 FILES_${PN}-doc = "\
     ${infodir} \
     ${mandir} \
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index d62c15a..b8dabe5 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -44,10 +44,6 @@ FILES_${PN} = "\
 "
 INSANE_SKIP_${PN} += "dev-so"
 
-FILES_${PN}-dbg += "\
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/.debug/ \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/plugin/.debug/ \
-"
 FILES_${PN}-dev = "\
     ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 4da4a27..d9770e6 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -75,7 +75,6 @@ do_install_append_class-nativesdk() {
 }
 
 FILES_${PN} += "${datadir}/git-core ${libexecdir}/git-core/"
-FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
 
 PERLTOOLS = " \
     ${libexecdir}/git-core/git-add--interactive \
diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index 9df8d04..29dd12d 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -304,13 +304,6 @@ FILES_${PN}-pod = "${libdir}/perl/${PV}/pod \
                    ${libdir}/perl/${PV}/*/*.pod \
                    ${libdir}/perl/${PV}/*/*/*.pod "
 FILES_perl-misc = "${bindir}/*"
-FILES_${PN}-dbg += "${libdir}/perl/${PV}/auto/*/.debug \
-                    ${libdir}/perl/${PV}/auto/*/*/.debug \
-                    ${libdir}/perl/${PV}/auto/*/*/*/.debug \
-                    ${libdir}/perl/${PV}/CORE/.debug \
-                    ${libdir}/perl/${PV}/*/.debug \
-                    ${libdir}/perl/${PV}/*/*/.debug \
-                    ${libdir}/perl/${PV}/*/*/*/.debug "
 FILES_${PN}-doc = "${libdir}/perl/${PV}/*/*.txt \
                    ${libdir}/perl/${PV}/*/*/*.txt \
                    ${libdir}/perl/${PV}/auto/XS/Typemap \
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index fe12258..0de7b36 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -10,7 +10,6 @@ LICENSE = "LGPL2.1"
 DEPENDS = "sqlite3 attr"
 
 FILES_${PN} = "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${localstatedir}/pseudo ${prefix}/var/pseudo"
-FILES_${PN}-dbg += "${prefix}/lib/pseudo/lib*/.debug"
 INSANE_SKIP_${PN} += "libdir"
 INSANE_SKIP_${PN}-dbg += "libdir"
 
diff --git a/meta/recipes-devtools/rpm/rpm_4.11.2.bb b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
index f4a2110..a48852f 100644
--- a/meta/recipes-devtools/rpm/rpm_4.11.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
@@ -125,11 +125,6 @@ FILES_${PN} +=  "${libdir}/rpm \
 RDEPENDS_${PN} = "base-files run-postinsts"
 RDEPENDS_${PN}_class-native = ""
 
-FILES_${PN}-dbg += "${libdir}/rpm/.debug/* \
-                    ${libdir}/rpm-plugins/.debug/* \
-                    ${libdir}/python2.7/site-packages/rpm/.debug/* \
-                   "
-
 FILES_${PN}-dev += "${libdir}/python2.7/site-packages/rpm/*.la"
 
 FILES_python-${PN} = "${libdir}/python2.7/site-packages/rpm/*"
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 0d14728..0b38c3a 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -259,10 +259,6 @@ FILES_${PN} =  "${bindir}/rpm \
 		${bindir}/rpm2cpio.real \
 		"
 
-FILES_${PN}-dbg += "${libdir}/rpm/.debug \
-		${libdir}/rpm/bin/.debug \
-		"
-
 FILES_${PN}-common = "${bindir}/rpm2cpio \
 		${bindir}/gendiff \
 		${sysconfdir}/rpm \
@@ -354,7 +350,6 @@ RDEPENDS_${PN}-build = "file bash perl"
 
 RDEPENDS_python-rpm = "${PN}"
 
-FILES_python-rpm-dbg = "${libdir}/python*/site-packages/rpm/.debug/_*"
 FILES_python-rpm-dev = "${libdir}/python*/site-packages/rpm/*.la"
 FILES_python-rpm-staticdev = "${libdir}/python*/site-packages/rpm/*.a"
 FILES_python-rpm = "${libdir}/python*/site-packages/rpm"
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index 97651d2..f338fd6 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -255,11 +255,6 @@ FILES_${PN} =  "${bindir}/rpm \
 		${bindir}/rpm2cpio.real \
 		"
 
-FILES_${PN}-dbg += "${libdir}/rpm/.debug \
-		${libdir}/rpm/bin/.debug \
-		${libdir}/python*/site-packages/rpm/.debug/_* \
-		"
-
 FILES_${PN}-common = "${bindir}/rpm2cpio \
 		${bindir}/gendiff \
 		${sysconfdir}/rpm \
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 13234fc..5aa365d 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -109,14 +109,6 @@ FILES_${PN}-lib = "${libdir}/libcups.so.*"
 
 FILES_${PN}-libimage = "${libdir}/libcupsimage.so.*"
 
-FILES_${PN}-dbg += "${libdir}/cups/backend/.debug \
-                    ${libdir}/cups/cgi-bin/.debug \
-                    ${libdir}/cups/filter/.debug \
-                    ${libdir}/cups/monitor/.debug \
-                    ${libdir}/cups/notifier/.debug \
-                    ${libdir}/cups/daemon/.debug \
-                   "
-
 #package the html for the webgui inside the main packages (~1MB uncompressed)
 
 FILES_${PN} += "${datadir}/doc/cups/images \
diff --git a/meta/recipes-extended/ltp/ltp_20150420.bb b/meta/recipes-extended/ltp/ltp_20150420.bb
index ed46b5e..1117c11 100644
--- a/meta/recipes-extended/ltp/ltp_20150420.bb
+++ b/meta/recipes-extended/ltp/ltp_20150420.bb
@@ -65,16 +65,6 @@ do_install(){
 
 RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect"
 
-FILES_${PN}-dbg += "\
-    /opt/ltp/runtest/.debug \
-    /opt/ltp/testcases/*/.debug \
-    /opt/ltp/testcases/*/*/.debug \
-    /opt/ltp/testcases/*/*/*/.debug \
-    /opt/ltp/scenario_groups/.debug \
-    /opt/ltp/testscripts/.debug \
-    /opt/ltp/testscripts/open_posix_testsuite/.debug \
-"
-
 FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a"
 
 FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*"
diff --git a/meta/recipes-extended/pam/libpam_1.2.1.bb b/meta/recipes-extended/pam/libpam_1.2.1.bb
index 7e81e72..3e69f11 100644
--- a/meta/recipes-extended/pam/libpam_1.2.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.2.1.bb
@@ -57,10 +57,6 @@ PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit,"
 
 PACKAGES += "${PN}-runtime ${PN}-xtests"
 FILES_${PN} = "${base_libdir}/lib*${SOLIBS}"
-FILES_${PN}-dbg += "${base_libdir}/security/.debug \
-                    ${base_libdir}/security/pam_filter/.debug \
-                    ${datadir}/Linux-PAM/xtests/.debug"
-
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${base_libdir}/*.la ${base_libdir}/lib*${SOLIBSDEV}"
 FILES_${PN}-runtime = "${sysconfdir}"
 FILES_${PN}-xtests = "${datadir}/Linux-PAM/xtests"
diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index 0f41306..936870b 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -49,13 +49,6 @@ FILES_${PN}-dev += " \
 	${libdir}/gtk-2.0/${LIBV}/engines/*.la \
 	${bindir}/gtk-builder-convert"
 
-FILES_${PN}-dbg += " \
-	${libdir}/gtk-2.0/modules/.debug/* \
-        ${libdir}/gtk-2.0/${LIBV}/loaders/.debug/* \
-	${libdir}/gtk-2.0/${LIBV}/immodules/.debug/* \
-	${libdir}/gtk-2.0/${LIBV}/engines/.debug/* \
-	${libdir}/gtk-2.0/${LIBV}/printbackends/.debug/*"
-
 FILES_gtk-demo = " \
  ${datadir}/gtk-2.0/demo/* \
  ${bindir}/gtk-demo \
diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 984e305..36f7b0c 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -84,13 +84,6 @@ FILES_${PN}-dev += " \
                     ${bindir}/gtk-builder-tool \
                     "
 
-FILES_${PN}-dbg += " \
-                    ${libdir}/gtk-3.0/${LIBV}/loaders/.debug \
-                    ${libdir}/gtk-3.0/${LIBV}/immodules/.debug \
-                    ${libdir}/gtk-3.0/${LIBV}/engines/.debug \
-                    ${libdir}/gtk-3.0/${LIBV}/printbackends/.debug \
-                    ${libdir}/gtk-3.0/modules/.debug"
-
 RRECOMMENDS_${PN} = "adwaita-icon-theme-symbolic"
 
 PACKAGES_DYNAMIC += "^gtk3-immodule-.* ^gtk3-printbackend-.*"
diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index 7b115aa..0ace1ce 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -39,11 +39,8 @@ PACKAGECONFIG ??= "egl \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'glx x11', '', d)}"
 
-FILES_${PN}-dbg += "${libdir}/clutter/examples/.debug"
 FILES_${PN}-examples = "${libdir}/clutter/examples"
 
-FILES_${PN}-dbg += "${libexecdir}/installed-tests/.debug"
-
 do_configure_prepend() {
 	# see https://bugzilla.gnome.org/show_bug.cgi?id=661128 for this
 	touch -t 200001010000 ${S}/po/clutter-1.0.pot
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index 5aeeac6..307afe0 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -16,5 +16,4 @@ EXTRA_OECONF += "--disable-introspection"
 
 FILES_${PN}          += "${libdir}/gstreamer-1.0/lib*.so"
 FILES_${PN}-dev      += "${libdir}/gstreamer-1.0/*.la"
-FILES_${PN}-dbg      += "${libdir}/gstreamer-1.0/.debug/lib*.so"
 FILES_${PN}-examples  = "${bindir}/video-player ${bindir}/video-sink"
diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index cbd4014..b905ab0 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -59,13 +59,6 @@ TARGET_CFLAGS_remove_x86 = "-fno-omit-frame-pointer"
 
 # NOTE: monolithic packaging for now, should improve that eventually
 
-
-
-FILES_${PN}-dbg += "\
-  ${libdir}/directfb-${RV}/*/*/.debug/*.so \
-  ${libdir}/directfb-${RV}/*/.debug/*.so \
-"
-
 FILES_${PN}-dev += "\
   ${bindir}/directfb-config \
   ${libdir}/directfb-${RV}/systems/*.la \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 424e8b7..cd01870 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -153,7 +153,6 @@ PACKAGESPLITFUNCS_prepend = "mesa_populate_packages "
 
 PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
-FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 FILES_${PN} += "${sysconfdir}/drirc"
 FILES_mesa-megadriver = "${libdir}/dri/*"
 FILES_libegl-mesa = "${libdir}/libEGL.so.*"
@@ -181,5 +180,3 @@ FILES_libxvmcsoftpipe-dev = "${libdir}/libXvMCsoftpipe.so ${libdir}/libXvMCsoftp
 FILES_libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
                           ${libdir}/pkgconfig/xatracker.pc"
-
-FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/* ${libdir}/gbm/.debug/* ${libdir}/gallium-pipe/.debug"
diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index cd9f07d..3e9c068 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -40,7 +40,6 @@ do_compile_prepend () {
 }
 
 FILES_${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
-FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
 
 RDEPENDS_${PN}-ptest += "liberation-fonts"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index f512189..6648cd3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -80,10 +80,6 @@ RDEPENDS_${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
 FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
 FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
 FILES_${PN}-doc += "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/README.compiled ${localstatedir}/lib/xkb/README.compiled"
-FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
-                    ${libdir}/xorg/modules/*/.debug \
-                    ${libdir}/xorg/modules/*/*/.debug \
-                    "
 FILES_${PN}-sdl = "${bindir}/Xsdl"
 FILES_${PN}-fbdev = "${bindir}/Xfbdev"
 FILES_${PN}-xvfb = "${bindir}/Xvfb"
diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index 82a0840..4c42251 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -40,8 +40,6 @@ GROUPADD_PARAM_${PN} = "tracing"
 
 FILES_${PN} += "${libdir}/lttng/libexec/* ${datadir}/xml/lttng \
                 ${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
-FILES_${PN}-dbg += "${libdir}/lttng/libexec/.debug \
-                    ${libdir}/python2.7/site-packages/.debug"
 FILES_${PN}-staticdev += "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a"
 FILES_${PN}-dev += "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la"
 
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
index 730f427..8eaeff4 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
@@ -32,7 +32,6 @@ EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
 
 PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc"
 FILES_${PN} += "${libdir}/${BPN}/smixer/*.so"
-FILES_${PN}-dbg += "${libdir}/${BPN}/smixer/.debug"
 FILES_${PN}-dev += "${libdir}/${BPN}/smixer/*.la"
 FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
index 95bfbc5..d7c42ce 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
@@ -87,8 +87,6 @@ INSANE_SKIP_${MLPREFIX}libasound-module-rate-lavcrate = "dev-so"
 INSANE_SKIP_${MLPREFIX}libasound-module-rate-samplerate = "dev-so"
 INSANE_SKIP_${MLPREFIX}libasound-module-rate-speexrate = "dev-so"
 
-FILES_${PN}-dbg += "${libdir}/alsa-lib/.debug"
-
 # 50-pulseaudio.conf defines a device named "pulse" that applications can use
 # if they explicitly want to use the PulseAudio plugin.
 # 99-pulseaudio-default.conf configures the "default" device to use the
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index cb1be06..6441b35 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -53,6 +53,5 @@ RDEPENDS_${PN}-apps += "perl"
 RRECOMMENDS_${PN} += "${PN}-meta"
 
 FILES_${PN} = ""
-FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
 FILES_${PN}-glib = "${datadir}/glib-2.0"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
index 664c5d6..3948b40 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav.inc
@@ -26,7 +26,6 @@ LIBAV_EXTRA_CONFIGURE_COMMON = \
 EXTRA_OECONF = "${LIBAV_EXTRA_CONFIGURE_COMMON}"
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
index 26c1336..6806455 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
@@ -35,7 +35,6 @@ set_omx_core_name() {
 do_install[postfuncs] += " set_omx_core_name "
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index 0864566..c10f66f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -26,7 +26,6 @@ CACHED_CONFIGUREVARS += "ac_cv_header_valgrind_valgrind_h=no"
 
 FILES_${PN} += " ${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dev += " ${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
-FILES_${PN}-dbg += " ${libdir}/gstreamer-1.0/.debug/ ${libexecdir}/gstreamer-1.0/.debug/ ${datadir}/bash-completion/helpers/.debug/"
 FILES_${PN}-bash-completion += " ${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
 
 PACKAGES += " ${PN}-bash-completion"
diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index a7da107..05b7e87 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -97,7 +97,7 @@ do_install_append() {
     fi
 }
 
-PACKAGES += "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
+PACKAGES += "${PN}-vhook ffmpeg-x264-presets"
 PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
 
 RSUGGESTS_${PN} = "mplayer"
@@ -105,7 +105,6 @@ FILES_${PN} = "${bindir}"
 FILES_${PN}-dev = "${includedir}/${PN}"
 
 FILES_${PN}-vhook = "${libdir}/vhook"
-FILES_${PN}-vhook-dbg += "${libdir}/vhook/.debug"
 
 FILES_ffmpeg-x264-presets = "${datadir}/*.avpreset"
 
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index 40d6df8..d83eb45 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -35,5 +35,3 @@ FILES_${PN}-staticdev += "${libdir}/bellagio/*.a \
 FILES_${PN}-dev += "${libdir}/bellagio/*.la \
                     ${libdir}/omxloaders/*.la \
                     ${libdir}/omxloaders/*${SOLIBSDEV}"
-FILES_${PN}-dbg += "${libdir}/bellagio/.debug/ \
-                    ${libdir}/omxloaders/.debug/"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 5b806d7..27197bd 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -110,8 +110,6 @@ FILES_libpulse = "${libdir}/libpulse.so.* ${sysconfdir}/pulse/client.conf"
 FILES_libpulse-simple = "${libdir}/libpulse-simple.so.*"
 FILES_libpulse-mainloop-glib = "${libdir}/libpulse-mainloop-glib.so.*"
 
-FILES_${PN}-dbg += "${libexecdir}/pulse/.debug \
-                    ${libdir}/pulse-${PV}/modules/.debug"
 FILES_${PN}-dev += "${libdir}/pulse-${PV}/modules/*.la ${datadir}/vala ${libdir}/cmake"   
 FILES_${PN}-conf = "${sysconfdir}"
 FILES_${PN}-bin += "${sysconfdir}/default/volatiles/volatiles.04_pulse"
diff --git a/meta/recipes-qt/qt-apps/qmmp_0.8.6.bb b/meta/recipes-qt/qt-apps/qmmp_0.8.6.bb
index e68ad0f..6c1e212 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.8.6.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.8.6.bb
@@ -69,8 +69,4 @@ FILES_${PN} = "\
                 ${datadir}/applications/* \
                 "
 
-FILES_${PN}-dbg += "\
-                ${libdir}/qmmp/*/.debug/* \
-               "
-
 RDEPENDS_${PN} += "taglib alsa-lib libmad curl libicui18n"
diff --git a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
index fa6b2b2..93538ed 100644
--- a/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
+++ b/meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
@@ -14,7 +14,6 @@ ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 PACKAGES += "gtk-theme-sato"
 FILES_${PN} = "${libdir}/gtk-2.0/*/engines/*.so "
 FILES_${PN}-dev = "${libdir}/gtk-2.0/*/engines/*.la"
-FILES_${PN}-dbg += " ${libdir}/gtk-2.0/*/engines/.debug"
 FILES_gtk-theme-sato = "${datadir}/icons ${datadir}/themes"
 
 inherit autotools-brokensep pkgconfig
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 0d321d3..acfd2bb 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -35,8 +35,6 @@ FILES_${PN} = "${bindir}/ \
 	       ${datadir}/pixmaps \
 	       ${datadir}/matchbox-keyboard"
 
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/immodules/.debug"
-
 FILES_${PN}-im = "${libdir}/gtk-2.0/*/immodules/*.so"
 
 FILES_${PN}-applet = "${libdir}/matchbox-panel/*.so"
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 4ed7368..61d9e30 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -33,7 +33,6 @@ S = "${WORKDIR}/git"
 FILES_${PN} += "${libdir}/matchbox-panel/*.so \
                 ${datadir}/matchbox-panel/brightness/*.png \
                 ${datadir}/matchbox-panel/startup/*.png "
-FILES_${PN}-dbg += "${libdir}/matchbox-panel/.debug"
 FILES_${PN}-dev += "${libdir}/matchbox-panel/*.la"
 
 inherit autotools pkgconfig distro_features_check
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_git.bb b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
index 9876fe0..dfa68a6 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
@@ -60,7 +60,6 @@ PACKAGES += "${PN}-extra"
 RDEPENDS_${PN}-extra += "oh-puzzles"
 
 FILES_${PN} = "/usr/share/pixmaps /usr/share/oh-puzzles/"
-FILES_${PN}-dbg += "/usr/games/.debug/*"
 FILES_${PN}-extra = "/usr/games/ /usr/share/applications /etc/gconf/schemas"
 
 python __anonymous () {
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 95826c1..56fae88 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -26,7 +26,6 @@ do_configure_prepend () {
 }
 
 FILES_${PN} = "${prefix}/bin/* ${datadir}/applications/*"
-FILES_${PN}-dbg += "${prefix}/bin/.debug"
 
 do_install () {
     rm -rf ${D}/*
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
index 8794032..1b2b65d 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
@@ -19,7 +19,6 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig distro_features_check
 
 FILES_${PN} += "${libdir}/matchbox-panel/*.so"
-FILES_${PN}-dbg += "${libdir}/matchbox-panel/.debug"
 
 do_install_append () {
 	rm ${D}${libdir}/matchbox-panel/*.la
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
index 221ba17..aa5e6c9 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.8.5.bb
@@ -68,8 +68,6 @@ EXTRA_OECMAKE_append_mips = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_mips64 = " -DENABLE_JIT=OFF "
 
 FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
-FILES_${PN}-dbg += "${libdir}/webkit2gtk-4.0/injected-bundle/.debug/libwebkit2gtkinjectedbundle.so"
-FILES_${PN}-dbg += "${libdir}/webkitgtk/webkit2gtk-4.0/.debug/*"
 
 # http://errors.yoctoproject.org/Errors/Details/20370/
 ARM_INSTRUCTION_SET = "arm"
diff --git a/meta/recipes-support/apr/apr-util_1.5.4.bb b/meta/recipes-support/apr/apr-util_1.5.4.bb
index 37b4c83..6856db9 100644
--- a/meta/recipes-support/apr/apr-util_1.5.4.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.4.bb
@@ -68,7 +68,6 @@ do_install_append_class-target() {
 
 FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
 FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/apr_dbm_gdbm.so* ${libdir}/apr-util-1/apr_dbm_gdbm.la"
-FILES_${PN}-dbg += "${libdir}/apr-util-1/.debug/*"
 FILES_${PN}-staticdev += "${libdir}/apr-util-1/apr_dbm_gdbm.a"
 
 inherit ptest
diff --git a/meta/recipes-support/atk/at-spi2-atk_2.18.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.18.1.bb
index f348d37..b8a93f3 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.18.1.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.18.1.bb
@@ -19,4 +19,3 @@ PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
 
 FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
 FILES_${PN}-gtk2 = "${libdir}/gtk-2.0/modules/libatk-bridge.*"
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug"
diff --git a/meta/recipes-support/consolekit/consolekit_0.4.6.bb b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
index 66a892a..2974e36 100644
--- a/meta/recipes-support/consolekit/consolekit_0.4.6.bb
+++ b/meta/recipes-support/consolekit/consolekit_0.4.6.bb
@@ -33,7 +33,6 @@ PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/
 FILES_${PN} += "${localstatedir}/log/ConsoleKit ${exec_prefix}/lib/ConsoleKit \
                 ${libdir}/ConsoleKit  ${systemd_unitdir} ${base_libdir} \
                 ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
-FILES_${PN}-dbg += "${base_libdir}/security/.debug"
 
 PACKAGES =+ "pam-plugin-ck-connector"
 FILES_pam-plugin-ck-connector += "${base_libdir}/security/*.so"
diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index 6999f81..b4ccbfe 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -98,7 +98,6 @@ FILES_gpgv = "${bindir}/gpgv"
 
 # Exclude debug files from the main packages
 FILES_${PN} = "${bindir}/* ${datadir}/${BPN} ${libexecdir}/${BPN}/*"
-FILES_${PN}-dbg += "${libexecdir}/${BPN}/.debug"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[curl] = "--with-libcurl=${STAGING_LIBDIR},--without-libcurl,curl"
diff --git a/meta/recipes-support/libcap/libcap_2.24.bb b/meta/recipes-support/libcap/libcap_2.24.bb
index 36b94ee..e2b93a4 100644
--- a/meta/recipes-support/libcap/libcap_2.24.bb
+++ b/meta/recipes-support/libcap/libcap_2.24.bb
@@ -72,6 +72,5 @@ FILES_${PN}-dev += "${base_libdir}/*.so"
 
 # pam files
 FILES_${PN} += "${base_libdir}/security/*.so"
-FILES_${PN}-dbg += "${base_libdir}/security/.debug/*.so"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libfm/libfm_1.2.3.bb b/meta/recipes-support/libfm/libfm_1.2.3.bb
index e9ff656..cf2f0f9 100644
--- a/meta/recipes-support/libfm/libfm_1.2.3.bb
+++ b/meta/recipes-support/libfm/libfm_1.2.3.bb
@@ -25,7 +25,6 @@ do_configure[dirs] =+ "${S}/m4"
 
 PACKAGES += "${PN}-mime"
 FILES_${PN}-mime = "${datadir}/mime/"
-FILES_${PN}-dbg += "${libdir}/libfm/modules/.debug"
 
 do_install_append () {
     # remove files which are part of libfm-extra
diff --git a/meta/recipes-support/libnl/libnl_3.2.25.bb b/meta/recipes-support/libnl/libnl_3.2.25.bb
index 97814fb..2d0b2e8 100644
--- a/meta/recipes-support/libnl/libnl_3.2.25.bb
+++ b/meta/recipes-support/libnl/libnl_3.2.25.bb
@@ -25,7 +25,6 @@ FILES_${PN} = "${libdir}/libnl-3.so.* \
                ${sysconfdir}"
 RREPLACES_${PN} = "libnl2"
 RCONFLICTS_${PN} = "libnl2"
-FILES_${PN}-dbg += "${libdir}/libnl/cli/*/.debug"
 FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.so \
                     ${libdir}/libnl/cli/*/*.la"
 FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.11.bb b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
index 06d0b9b..9db5231 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
@@ -21,7 +21,6 @@ EXTRA_OECMAKE = "-DWITH_WEBKIT=no -DWITH_GNOME=yes -DWITH_KDE4=no \
 
 FILES_${PN} += "${libdir}/${BPN}/${PV}/modules"
 FILES_${PN}-dev += "${datadir}/cmake"
-FILES_${PN}-dbg += "${libdir}/${BPN}/${PV}/plugins/.debug/ ${libdir}/${BPN}/${PV}/modules/.debug/"
 
 do_configure_prepend() {
 	export HOST_SYS=${HOST_SYS}
diff --git a/meta/recipes-support/nspr/nspr_4.11.bb b/meta/recipes-support/nspr/nspr_4.11.bb
index e579d0b..3048641 100644
--- a/meta/recipes-support/nspr/nspr_4.11.bb
+++ b/meta/recipes-support/nspr/nspr_4.11.bb
@@ -172,6 +172,5 @@ do_install_append() {
 FILES_${PN} = "${libdir}/lib*.so"
 FILES_${PN}-dev = "${bindir}/* ${libdir}/nspr/tests/* ${libdir}/pkgconfig \
                 ${includedir}/* ${datadir}/aclocal/* "
-FILES_${PN}-dbg += "${libdir}/nspr/tests/.debug/*"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/vte/vte.inc b/meta/recipes-support/vte/vte.inc
index 94f9587..68499d6 100644
--- a/meta/recipes-support/vte/vte.inc
+++ b/meta/recipes-support/vte/vte.inc
@@ -11,7 +11,5 @@ EXTRA_OECONF = "--disable-python --disable-introspection"
 
 PACKAGES =+ "libvte vte-termcap"
 FILES_libvte = "${libdir}/*.so.* ${libexecdir}/gnome-pty-helper"
-FILES_${PN}-dbg =+ "${libexecdir}/.debug ${prefix}/src ${bindir}/.debug \
-               ${libdir}/.debug"
 FILES_vte-termcap = "${datadir}/vte/termcap-0.0"
 



