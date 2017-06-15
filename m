Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6C2C37839A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:30:04 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5FEU308015216
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 15 Jun 2017 15:30:04 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dLVmd-00054W-2x; Thu, 15 Jun 2017 15:30:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 15:30:01 +0100
Message-Id: <1497537001-19456-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 15 Jun 2017 15:30:04 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] meta: Drop remnants of uclibc support
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
X-List-Received-Date: Thu, 15 Jun 2017 14:30:06 -0000

uclibc support was removed a while ago and musl works much better. Start to
remove the various overrides and patches related to uclibc which are no longer
needed.

uclibc support in a layer would still be possible. I have strong reasons to
believe nobody is still using uclibc since patches are missing and I doubt
the metadata even parses anymore.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/security_flags.inc        |   4 -
 meta/conf/distro/include/tcmode-default.inc        |   3 -
 meta/conf/local.conf.sample.extended               |   5 +-
 meta/recipes-connectivity/avahi/avahi.inc          |   5 -
 meta/recipes-connectivity/ofono/ofono_1.20.bb      |   2 -
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb |   6 -
 meta/recipes-core/busybox/busybox.inc              |   2 +-
 meta/recipes-core/gettext/gettext_0.19.8.1.bb      |   8 -
 meta/recipes-core/glib-2.0/glib.inc                |   1 -
 meta/recipes-core/glibc/glibc-collateral.inc       |   1 -
 meta/recipes-core/glibc/glibc-package.inc          |  16 --
 meta/recipes-core/glibc/glibc_2.25.bb              |   1 -
 .../packagegroups/packagegroup-core-sdk.bb         |   1 -
 .../packagegroup-core-tools-profile.bb             |  13 +-
 meta/recipes-core/systemd/systemd.inc              |   2 -
 meta/recipes-core/systemd/systemd_232.bb           |   3 -
 meta/recipes-devtools/elfutils/elfutils_0.168.bb   |   6 -
 meta/recipes-devtools/gdb/gdb-common.inc           |   1 -
 .../gnu-config/config-guess-uclibc.patch           | 170 ---------------
 .../gnu-config/gnu-config/uclibc.patch             |  23 --
 .../gnu-config/gnu-config_20120814.bb              |   1 -
 meta/recipes-devtools/m4/m4.inc                    |   1 -
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |   2 -
 meta/recipes-extended/diffutils/diffutils.inc      |   7 -
 meta/recipes-extended/findutils/findutils.inc      |   7 -
 meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb   |   3 -
 .../net-tools/net-tools_1.60-26.bb                 |   2 -
 meta/recipes-extended/pam/libpam/use-utmpx.patch   | 233 ---------------------
 meta/recipes-extended/pam/libpam_1.3.0.bb          |   2 -
 meta/recipes-extended/parted/parted_3.2.bb         |   1 -
 meta/recipes-extended/shadow/shadow.inc            |   1 -
 meta/recipes-extended/sysstat/sysstat.inc          |   1 -
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |   1 -
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |   3 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.1.4.1.bb   |   2 -
 meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb   |   6 -
 .../packagegroups/packagegroup-core-x11-sato.bb    |   1 -
 meta/recipes-support/attr/ea-acl.inc               |   3 -
 meta/recipes-support/gnutls/gnutls.inc             |   1 -
 meta/recipes-support/icu/icu.inc                   |   2 -
 meta/recipes-support/liburcu/liburcu_0.9.3.bb      |   1 -
 .../rng-tools/uclibc-libuargp-configure.patch      |  63 ------
 meta/recipes-support/rng-tools/rng-tools_5.bb      |   3 -
 43 files changed, 5 insertions(+), 615 deletions(-)
 delete mode 100644 meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
 delete mode 100644 meta/recipes-devtools/gnu-config/gnu-config/uclibc.patch
 delete mode 100644 meta/recipes-extended/pam/libpam/use-utmpx.patch
 delete mode 100644 meta/recipes-support/rng-tools/rng-tools/uclibc-libuargp-configure.patch

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index e162abe..38164d0 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -84,8 +84,6 @@ SECURITY_CFLAGS_pn-slang = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-source-highlight = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tcl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-tiff = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-uclibc = ""
-SECURITY_CFLAGS_pn-uclibc-initial = ""
 SECURITY_CFLAGS_pn-valgrind = ""
 SECURITY_CFLAGS_pn-zlib = "${SECURITY_NO_PIE_CFLAGS}"
 
@@ -100,8 +98,6 @@ TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
 SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
 SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-strong"
-SECURITY_LDFLAGS_remove_pn-uclibc = "-fstack-protector-strong"
-SECURITY_LDFLAGS_remove_pn-uclibc-initial = "-fstack-protector-strong"
 SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d5ba38d..424b888 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,6 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.28%"
 GDBVERSION ?= "8.0%"
 GLIBCVERSION ?= "2.25"
-UCLIBCVERSION ?= "1.0%"
 LINUXLIBCVERSION ?= "4.10%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
@@ -64,8 +63,6 @@ PREFERRED_VERSION_nativesdk-glibc          ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-initial            ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc-initial  ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_uclibc                   ?= "${UCLIBCVERSION}"
-PREFERRED_VERSION_uclibc-initial           ?= "${UCLIBCVERSION}"
 # don't use version earlier than 1.4 for gzip-native, as it's necessary for
 # some packages using an archive format incompatible with earlier gzip
 PREFERRED_VERSION_gzip-native ?= "1.8"
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index f7cabf0..5d6c37d 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -94,10 +94,7 @@
 # PACKAGE_DEBUG_SPLIT_STYLE = 'debug-file-directory'
 
 # Uncomment these to build a package such that you can use gprof to profile it.
-# NOTE: This will only work with 'linux' targets, not
-# 'linux-uclibc', as uClibc doesn't provide the necessary
-# object files.  Also, don't build glibc itself with these
-# flags, or it'll fail to build.
+# NOTE: Don't build glibc itself with these flags, or it'll fail to build.
 #
 # PROFILE_OPTIMIZATION = "-pg"
 # SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index faa8741..7814464 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -63,10 +63,6 @@ EXTRA_OECONF = "--with-avahi-priv-access-group=adm \
 EXTRA_OECONF_SYSVINIT = "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','--with-distro=debian','--with-distro=none',d)}"
 EXTRA_OECONF_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES','systemd','--with-systemdsystemunitdir=${systemd_unitdir}/system/','--without-systemdsystemunitdir',d)}"
 
-
-LDFLAGS_append_libc-uclibc = " -lintl"
-LDFLAGS_append_uclinux-uclibc = " -lintl"
-
 do_configure_prepend() {
     sed 's:AM_CHECK_PYMOD:echo "no pymod" #AM_CHECK_PYMOD:g' -i ${S}/configure.ac
 
@@ -111,7 +107,6 @@ FILES_avahi-utils = "${bindir}/avahi-*"
 
 RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (= ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
 
-# uclibc has no nss
 RRECOMMENDS_avahi-daemon_append_libc-glibc = " libnss-mdns"
 RRECOMMENDS_${PN}_append_libc-glibc = " libnss-mdns"
 
diff --git a/meta/recipes-connectivity/ofono/ofono_1.20.bb b/meta/recipes-connectivity/ofono/ofono_1.20.bb
index 356a996..18f983e 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.20.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.20.bb
@@ -6,5 +6,3 @@ SRC_URI  = "\
 "
 SRC_URI[md5sum] = "fad0630fce6a9aecdb7db37bc1f1db7d"
 SRC_URI[sha256sum] = "5d7ba8f481a7715d013a79f8d6477eb89d8aaae399395d5d008a1317c34a31d5"
-
-CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
index 5b96745..7bd313b 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
@@ -69,12 +69,6 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PATH_PASSWD_PROG=${bindir}/passwd"
 # We don't want to depend on libblockfile
 CACHED_CONFIGUREVARS += "ac_cv_header_maillock_h=no"
 
-# This is a workaround for uclibc because including stdio.h
-# pulls in pthreads.h and causes conflicts in function prototypes.
-# This results in compilation failure, so unless this is fixed,
-# disable pam for uclibc.
-EXTRA_OECONF_append_libc-uclibc=" --without-pam"
-
 do_configure_prepend () {
 	export LD="${CC}"
 	install -m 0644 ${WORKDIR}/sshd_config ${B}/
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 0816df6..b8edd39 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -71,7 +71,7 @@ def features_to_busybox_settings(d):
 	busybox_cfg(bb.utils.contains('DISTRO_FEATURES', 'bluetooth', True, False, d), 'CONFIG_RFKILL', cnf, rem)
 	return "\n".join(cnf), "\n".join(rem)
 
-# X, Y = ${@features_to_uclibc_settings(d)}
+# X, Y = ${@features_to_busybox_settings(d)}
 # unfortunately doesn't seem to work with bitbake, workaround:
 def features_to_busybox_conf(d):
 	cnf, rem = features_to_busybox_settings(d)
diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 83edffe..97e7986 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -24,8 +24,6 @@ SRC_URI[sha256sum] = "ff942af0e438ced4a8b0ea4b0b6e0d6d657157c5e2364de57baa279c1c
 
 PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
 
-LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
-
 inherit autotools texinfo
 
 EXTRA_OECONF += "--without-lispdir \
@@ -86,15 +84,9 @@ FILES_gettext-runtime = "${bindir}/gettext \
                          ${libdir}/libasprintf.so* \
                          ${libdir}/GNU.Gettext.dll \
                         "
-FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl.so.* \
-                                             ${libdir}/charset.alias \
-                                           "
 FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
                       ${includedir}/autosprintf.h \
                      "
-FILES_gettext-runtime-dev_append_libc-uclibc = " ${libdir}/libintl.so \
-                                                 ${includedir}/libintl.h \
-                                               "
 FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
                              ${mandir}/man1/ngettext.* \
                              ${mandir}/man1/envsubst.* \
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2caa341..4a145ae 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -43,7 +43,6 @@ PRINTF_darwin = "--enable-included-printf=yes"
 PRINTF_mingw32 = "--enable-included-printf=yes"
 EXTRA_OECONF = "${PRINTF} ${CORECONF}"
 EXTRA_OECONF_class-native = "${CORECONF} --disable-selinux"
-EXTRA_OECONF_append_libc-uclibc = " --with-libiconv=gnu"
 
 # Tell configure that we'll have dbus-daemon on the target for the tests
 EXTRA_OECONF_class-target_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' ac_cv_prog_DBUS_DAEMON=dbus-daemon', '', d)}"
diff --git a/meta/recipes-core/glibc/glibc-collateral.inc b/meta/recipes-core/glibc/glibc-collateral.inc
index 37f27ca..de859d5 100644
--- a/meta/recipes-core/glibc/glibc-collateral.inc
+++ b/meta/recipes-core/glibc/glibc-collateral.inc
@@ -18,5 +18,4 @@ do_compile[noexec] = "1"
 do_install[depends] += "virtual/${MLPREFIX}libc:do_stash_locale"
 
 COMPATIBLE_HOST_libc-musl_class-target = "null"
-COMPATIBLE_HOST_libc-uclibc_class-target = "null"
 
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 9f7fa62..645be69 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -1,19 +1,3 @@
-#
-# For now, we will skip building of a gcc package if it is a uclibc one
-# and our build is not a uclibc one, and we skip a glibc one if our build
-# is a uclibc build.
-#
-# See the note in gcc/gcc_3.4.0.oe
-#
-
-python __anonymous () {
-    import bb, re
-    uc_os = (re.match('.*uclibc*', d.getVar('TARGET_OS')) != None)
-    if uc_os:
-        raise bb.parse.SkipPackage("incompatible with target %s" %
-                                   d.getVar('TARGET_OS'))
-}
-
 INHIBIT_SYSROOT_STRIP = "1"
 
 PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
diff --git a/meta/recipes-core/glibc/glibc_2.25.bb b/meta/recipes-core/glibc/glibc_2.25.bb
index 83a1249..c37438a 100644
--- a/meta/recipes-core/glibc/glibc_2.25.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.bb
@@ -67,7 +67,6 @@ GLIBC_BROKEN_LOCALES = ""
 # this helps in easing out parsing for non-glibc system libraries
 #
 COMPATIBLE_HOST_libc-musl_class-target = "null"
-COMPATIBLE_HOST_libc-uclibc_class-target = "null"
 
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 7d6d414..af0ce20 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -33,7 +33,6 @@ SANITIZERS_nios2 = ""
 SANITIZERS_powerpc64 = ""
 SANITIZERS_sparc = ""
 SANITIZERS_libc-musl = ""
-SANITIZERS_libc-uclibc = ""
 
 RRECOMMENDS_packagegroup-core-sdk = "\
     libgomp \
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 946c947..51335e2 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -31,23 +31,15 @@ PROFILETOOLS = "\
 PERF = "perf"
 PERF_libc-musl = ""
 
-# systemtap needs elfutils which is not fully buildable on uclibc
-# hence we exclude it from uclibc based builds
+# systemtap needs elfutils which is not fully buildable on some arches/libcs
 SYSTEMTAP = "systemtap"
-SYSTEMTAP_libc-uclibc = ""
 SYSTEMTAP_libc-musl = ""
 SYSTEMTAP_mipsarch = ""
 SYSTEMTAP_nios2 = ""
 SYSTEMTAP_aarch64 = ""
 
-# lttng-ust uses sched_getcpu() which is not there on uclibc
-# for some of the architectures it can be patched to call the
-# syscall directly but for x86_64 __NR_getcpu is a vsyscall
-# which means we can not use syscall() to call it. So we ignore
-# it for x86_64/uclibc
-
+# lttng-ust uses sched_getcpu() which is not there on for some platforms.
 LTTNGUST = "lttng-ust"
-LTTNGUST_libc-uclibc = ""
 LTTNGUST_libc-musl = ""
 
 LTTNGTOOLS = "lttng-tools"
@@ -60,7 +52,6 @@ BABELTRACE = "babeltrace"
 # valgrind does not work on the following configurations/architectures
 
 VALGRIND = "valgrind"
-VALGRIND_libc-uclibc = ""
 VALGRIND_libc-musl = ""
 VALGRIND_mipsarch = ""
 VALGRIND_nios2 = ""
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 29e0be6..a4def99 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -19,5 +19,3 @@ SRCREV = "a1e2ef7ec912902d8142e7cb5830cbfb47dba86c"
 SRC_URI = "git://github.com/systemd/systemd.git;protocol=git"
 
 S = "${WORKDIR}/git"
-
-LDFLAGS_append_libc-uclibc = " -lrt -lssp_nonshared -lssp "
diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index 6aeccbd..a6e6401 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -35,9 +35,6 @@ SRC_URI += " \
            file://0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch \
            file://0021-build-sys-check-for-lz4-in-the-old-and-new-numbering.patch \
 "
-SRC_URI_append_libc-uclibc = "\
-           file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
-"
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
 PACKAGECONFIG ??= "xz \
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.168.bb b/meta/recipes-devtools/elfutils/elfutils_0.168.bb
index 3b8f2a3..c0a4f23 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.168.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.168.bb
@@ -48,7 +48,6 @@ inherit autotools gettext
 
 EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
 EXTRA_OECONF_append_class-native = " --without-bzlib"
-EXTRA_OECONF_append_libc-uclibc = " --enable-uclibc"
 
 do_install_append() {
 	if [ "${TARGET_ARCH}" != "x86_64" ] && [ -z `echo "${TARGET_ARCH}"|grep 'i.86'` ];then
@@ -56,11 +55,6 @@ do_install_append() {
 	fi
 }
 
-# we can not build complete elfutils when using uclibc
-# but some recipes e.g. gcc 4.5 depends on libelf so we
-# build only libelf for uclibc case
-
-EXTRA_OEMAKE_libc-uclibc = "-C libelf"
 EXTRA_OEMAKE_class-native = ""
 EXTRA_OEMAKE_class-nativesdk = ""
 
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 239b375..9164a2b 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -5,7 +5,6 @@ DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST}"
 
 LTTNGUST = "lttng-ust"
 LTTNGUST_aarch64 = ""
-LTTNGUST_libc-uclibc = ""
 LTTNGUST_mipsarch = ""
 LTTNGUST_sh4 = ""
 LTTNGUST_libc-musl = ""
diff --git a/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch b/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
deleted file mode 100644
index 2094116..0000000
--- a/meta/recipes-devtools/gnu-config/gnu-config/config-guess-uclibc.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-Upstream-Status: Pending
-
-Patch courtesy gentoo-portage/sys-devel/gnuconfig/files/automake-1.8.5-config-guess-uclibc.patch.
-
-updated to 20050516 by Marcin 'Hrw' Juszkiewicz (by hand)
-updated to 20080123 by Nitin A Kamble (by hand)
-updated to 20111001 by Saul Wold (by hand)
-updated to 20120818 by Marcin 'Hrw' Juszkiewicz (by hand)
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
----
- config.guess |   67 +++++++++++++++++++++++++++++++++++------------------------
- 1 file changed, 40 insertions(+), 27 deletions(-)
-
---- git.orig/config.guess
-+++ git/config.guess
-@@ -138,6 +138,19 @@ UNAME_RELEASE=`(uname -r) 2>/dev/null` |
- UNAME_SYSTEM=`(uname -s) 2>/dev/null`  || UNAME_SYSTEM=unknown
- UNAME_VERSION=`(uname -v) 2>/dev/null` || UNAME_VERSION=unknown
- 
-+# Detect uclibc systems.
-+
-+LIBC="gnu"
-+if [ -f /usr/include/bits/uClibc_config.h ]
-+then
-+	LIBC=uclibc
-+	if [ -n `grep "#define __UCLIBC_CONFIG_VERSION__" /usr/include/bits/uClibc_config.h` ]
-+	then
-+		UCLIBC_SUBVER=`sed -n "/#define __UCLIBC_CONFIG_VERSION__ /s///p" /usr/include/bits/uClibc_config.h`
-+		LIBC=$LIBC$UCLIBC_SUBVER
-+	fi
-+fi
-+
- # Note: order is significant - the case branches are not exclusive.
- 
- case "${UNAME_MACHINE}:${UNAME_SYSTEM}:${UNAME_RELEASE}:${UNAME_VERSION}" in
-@@ -886,15 +899,15 @@ EOF
- 	  EV68*) UNAME_MACHINE=alphaev68 ;;
- 	esac
- 	objdump --private-headers /bin/sh | grep -q ld.so.1
--	if test "$?" = 0 ; then LIBC="libc1" ; else LIBC="" ; fi
--	echo ${UNAME_MACHINE}-unknown-linux-gnu${LIBC}
-+	if test "$?" = 0 ; then LIBC="gnulibc1" ; else LIBC="" ; fi
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     arm*:Linux:*:*)
- 	eval $set_cc_for_build
- 	if echo __ARM_EABI__ | $CC_FOR_BUILD -E - 2>/dev/null \
- 	    | grep -q __ARM_EABI__
- 	then
--	    echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	    echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	else
- 	    if echo __ARM_PCS_VFP | $CC_FOR_BUILD -E - 2>/dev/null \
- 		| grep -q __ARM_PCS_VFP
-@@ -906,19 +919,19 @@ EOF
- 	fi
- 	exit ;;
-     avr32*:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     cris:Linux:*:*)
--	echo ${UNAME_MACHINE}-axis-linux-gnu
-+	echo ${UNAME_MACHINE}-axis-linux-${LIBC}
- 	exit ;;
-     crisv32:Linux:*:*)
--	echo ${UNAME_MACHINE}-axis-linux-gnu
-+	echo ${UNAME_MACHINE}-axis-linux-${LIBC}
- 	exit ;;
-     frv:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     hexagon:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     i*86:Linux:*:*)
- 	LIBC=gnu
-@@ -932,13 +945,13 @@ EOF
- 	echo "${UNAME_MACHINE}-pc-linux-${LIBC}"
- 	exit ;;
-     ia64:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     m32r*:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     m68*:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     mips:Linux:*:* | mips64:Linux:*:*)
- 	eval $set_cc_for_build
-@@ -957,54 +970,54 @@ EOF
- 	#endif
- EOF
- 	eval `$CC_FOR_BUILD -E $dummy.c 2>/dev/null | grep '^CPU'`
--	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-gnu"; exit; }
-+	test x"${CPU}" != x && { echo "${CPU}-unknown-linux-${LIBC}"; exit; }
- 	;;
-     or32:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     padre:Linux:*:*)
--	echo sparc-unknown-linux-gnu
-+	echo sparc-unknown-linux-${LIBC}
- 	exit ;;
-     parisc64:Linux:*:* | hppa64:Linux:*:*)
--	echo hppa64-unknown-linux-gnu
-+	echo hppa64-unknown-linux-${LIBC}
- 	exit ;;
-     parisc:Linux:*:* | hppa:Linux:*:*)
- 	# Look for CPU level
- 	case `grep '^cpu[^a-z]*:' /proc/cpuinfo 2>/dev/null | cut -d' ' -f2` in
--	  PA7*) echo hppa1.1-unknown-linux-gnu ;;
--	  PA8*) echo hppa2.0-unknown-linux-gnu ;;
--	  *)    echo hppa-unknown-linux-gnu ;;
-+	  PA7*) echo hppa1.1-unknown-linux-${LIBC} ;;
-+	  PA8*) echo hppa2.0-unknown-linux-${LIBC} ;;
-+	  *)    echo hppa-unknown-linux-${LIBC} ;;
- 	esac
- 	exit ;;
-     ppc64:Linux:*:*)
--	echo powerpc64-unknown-linux-gnu
-+	echo powerpc64-unknown-linux-${LIBC}
- 	exit ;;
-     ppc:Linux:*:*)
--	echo powerpc-unknown-linux-gnu
-+	echo powerpc-unknown-linux-${LIBC}
- 	exit ;;
-     s390:Linux:*:* | s390x:Linux:*:*)
- 	echo ${UNAME_MACHINE}-ibm-linux
- 	exit ;;
-     sh64*:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     sh*:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     sparc:Linux:*:* | sparc64:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     tile*:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     vax:Linux:*:*)
--	echo ${UNAME_MACHINE}-dec-linux-gnu
-+	echo ${UNAME_MACHINE}-dec-linux-${LIBC}
- 	exit ;;
-     x86_64:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     xtensa*:Linux:*:*)
--	echo ${UNAME_MACHINE}-unknown-linux-gnu
-+	echo ${UNAME_MACHINE}-unknown-linux-${LIBC}
- 	exit ;;
-     i*86:DYNIX/ptx:4*:*)
- 	# ptx 4.0 does uname -s correctly, with DYNIX/ptx in there.
diff --git a/meta/recipes-devtools/gnu-config/gnu-config/uclibc.patch b/meta/recipes-devtools/gnu-config/gnu-config/uclibc.patch
deleted file mode 100644
index 75fe100..0000000
--- a/meta/recipes-devtools/gnu-config/gnu-config/uclibc.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Pending
-
---- config.sub.orig	2004-05-14 19:38:36.000000000 -0500
-+++ config.sub	2004-05-14 19:39:17.000000000 -0500
-@@ -118,7 +118,7 @@
- # Here we must recognize all the valid KERNEL-OS combinations.
- maybe_os=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\2/'`
- case $maybe_os in
--  nto-qnx* | linux-gnu* | kfreebsd*-gnu* | netbsd*-gnu* | storm-chaos* | os2-emx* | rtmk-nova*)
-+  nto-qnx* | linux-gnu* | linux-uclibc* | freebsd*-gnu* | netbsd*-gnu* | storm-chaos* | os2-emx* | rtmk-nova*)
-     os=-$maybe_os
-     basic_machine=`echo $1 | sed 's/^\(.*\)-\([^-]*-[^-]*\)$/\1/'`
-     ;;
-@@ -1135,7 +1135,8 @@
- 	      | -udi* | -eabi* | -lites* | -ieee* | -go32* | -aux* \
- 	      | -chorusos* | -chorusrdb* \
- 	      | -cygwin* | -pe* | -psos* | -moss* | -proelf* | -rtems* \
--	      | -mingw32* | -linux-gnu* | -uxpv* | -beos* | -mpeix* | -udk* \
-+	      | -mingw32* | -linux-gnu* | -linux-uclibc* \
-+	      | -uxpv* | -beos* | -mpeix* | -udk* \
- 	      | -interix* | -uwin* | -mks* | -rhapsody* | -darwin* | -opened* \
- 	      | -openstep* | -oskit* | -conix* | -pw32* | -nonstopux* \
- 	      | -storm-chaos* | -tops10* | -tenex* | -tops20* | -its* \
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
index 0d05e79..3d428b9 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
@@ -10,7 +10,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-${PV}.tar.bz2 \
-	   file://config-guess-uclibc.patch \
 	   file://musl-support.patch \
            file://gnu-configize.in"
 
diff --git a/meta/recipes-devtools/m4/m4.inc b/meta/recipes-devtools/m4/m4.inc
index 4a83929..75d8bbe 100644
--- a/meta/recipes-devtools/m4/m4.inc
+++ b/meta/recipes-devtools/m4/m4.inc
@@ -6,5 +6,4 @@ GNU M4 also has built-in functions for including files, running shell commands,
 inherit autotools texinfo
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
-LDFLAGS_prepend_libc-uclibc = " -lrt "
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
index 5d84001..dcd32ed 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
@@ -39,8 +39,6 @@ inherit autotools texinfo
 
 EXTRA_OECONF = "--without-x"
 
-LDFLAGS_append_libc-uclibc = " -liconv "
-
 BBCLASSEXTEND = "native nativesdk"
 
 PACKAGECONFIG ??= ""
diff --git a/meta/recipes-extended/diffutils/diffutils.inc b/meta/recipes-extended/diffutils/diffutils.inc
index 243341a..c81348b 100644
--- a/meta/recipes-extended/diffutils/diffutils.inc
+++ b/meta/recipes-extended/diffutils/diffutils.inc
@@ -6,13 +6,6 @@ SECTION = "base"
 
 inherit autotools texinfo update-alternatives gettext
 
-# diffutils assumes non-glibc compilation with uclibc and
-# this causes it to generate its own implementations of
-# standard functionality.  regex.c actually breaks compilation
-# because it uses __mempcpy, there are other things (TBD:
-# see diffutils.mk in buildroot)
-EXTRA_OECONF_libc-uclibc = "--without-included-regex"
-
 ALTERNATIVE_${PN} = "diff cmp"
 ALTERNATIVE_PRIORITY = "100"
 
diff --git a/meta/recipes-extended/findutils/findutils.inc b/meta/recipes-extended/findutils/findutils.inc
index bfedf87..ad36429 100644
--- a/meta/recipes-extended/findutils/findutils.inc
+++ b/meta/recipes-extended/findutils/findutils.inc
@@ -13,11 +13,4 @@ inherit autotools gettext texinfo update-alternatives upstream-version-is-even
 ALTERNATIVE_${PN} = "find xargs"
 ALTERNATIVE_PRIORITY = "100"
 
-# diffutils assumes non-glibc compilation with uclibc and
-# this causes it to generate its own implementations of
-# standard functionality.  regex.c actually breaks compilation
-# because it uses __mempcpy, there are other things (TBD:
-# see diffutils.mk in buildroot)
-EXTRA_OECONF_libc-uclibc = "--without-included-regex"
-
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
index f41d2f3..7be8e10 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.0.1.bb
@@ -19,9 +19,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2;name=libtirpc \
            file://0001-Fix-for-CVE-2017-8779.patch \
            "
 
-SRC_URI_append_libc-uclibc = " file://remove-des-functionality.patch \
-                             "
-
 SRC_URI_append_libc-musl = " \
                              file://Use-netbsd-queue.h.patch \
                            "
diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
index 45d7bf4..c23d533 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-26.bb
@@ -39,8 +39,6 @@ inherit gettext
 
 do_patch[depends] = "quilt-native:do_populate_sysroot"
 
-LDFLAGS_append_libc-uclibc = " -lintl "
-
 # The Makefile is lame, no parallel build
 PARALLEL_MAKE = ""
 
diff --git a/meta/recipes-extended/pam/libpam/use-utmpx.patch b/meta/recipes-extended/pam/libpam/use-utmpx.patch
deleted file mode 100644
index dd04bbb..0000000
--- a/meta/recipes-extended/pam/libpam/use-utmpx.patch
+++ /dev/null
@@ -1,233 +0,0 @@
-utmp() may not be configured in and use posix compliant utmpx always
-UTMP is SVID legacy, UTMPX is mandated by POSIX
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: Linux-PAM-1.2.1/libpam/pam_modutil_getlogin.c
-===================================================================
---- Linux-PAM-1.2.1.orig/libpam/pam_modutil_getlogin.c
-+++ Linux-PAM-1.2.1/libpam/pam_modutil_getlogin.c
-@@ -10,8 +10,7 @@
- 
- #include <stdlib.h>
- #include <unistd.h>
--#include <utmp.h>
--
-+#include <utmpx.h>
- #define _PAMMODUTIL_GETLOGIN "_pammodutil_getlogin"
- 
- const char *
-@@ -22,7 +21,7 @@ pam_modutil_getlogin(pam_handle_t *pamh)
-     const void *void_curr_tty;
-     const char *curr_tty;
-     char *curr_user;
--    struct utmp *ut, line;
-+    struct utmpx *ut, line;
- 
-     status = pam_get_data(pamh, _PAMMODUTIL_GETLOGIN, &logname);
-     if (status == PAM_SUCCESS) {
-@@ -48,10 +47,10 @@ pam_modutil_getlogin(pam_handle_t *pamh)
-     }
-     logname = NULL;
- 
--    setutent();
-+    setutxent();
-     strncpy(line.ut_line, curr_tty, sizeof(line.ut_line));
- 
--    if ((ut = getutline(&line)) == NULL) {
-+    if ((ut = getutxline(&line)) == NULL) {
- 	goto clean_up_and_go_home;
-     }
- 
-@@ -74,7 +73,7 @@ pam_modutil_getlogin(pam_handle_t *pamh)
- 
- clean_up_and_go_home:
- 
--    endutent();
-+    endutxent();
- 
-     return logname;
- }
-Index: Linux-PAM-1.2.1/modules/pam_issue/pam_issue.c
-===================================================================
---- Linux-PAM-1.2.1.orig/modules/pam_issue/pam_issue.c
-+++ Linux-PAM-1.2.1/modules/pam_issue/pam_issue.c
-@@ -25,7 +25,7 @@
- #include <string.h>
- #include <unistd.h>
- #include <sys/utsname.h>
--#include <utmp.h>
-+#include <utmpx.h>
- #include <time.h>
- #include <syslog.h>
- 
-@@ -246,13 +246,13 @@ read_issue_quoted(pam_handle_t *pamh, FI
- 	      case 'U':
- 		{
- 		    unsigned int users = 0;
--		    struct utmp *ut;
--		    setutent();
--		    while ((ut = getutent())) {
-+		    struct utmpx *ut;
-+		    setutxent();
-+		    while ((ut = getutxent())) {
- 			if (ut->ut_type == USER_PROCESS)
- 			    ++users;
- 		    }
--		    endutent();
-+		    endutxent();
- 		    if (c == 'U')
- 			snprintf (buf, sizeof buf, "%u %s", users,
- 			          (users == 1) ? "user" : "users");
-Index: Linux-PAM-1.2.1/modules/pam_lastlog/pam_lastlog.c
-===================================================================
---- Linux-PAM-1.2.1.orig/modules/pam_lastlog/pam_lastlog.c
-+++ Linux-PAM-1.2.1/modules/pam_lastlog/pam_lastlog.c
-@@ -15,8 +15,9 @@
- #include <errno.h>
- #ifdef HAVE_UTMP_H
- # include <utmp.h>
--#else
--# include <lastlog.h>
-+#endif
-+#ifdef HAVE_UTMPX_H
-+# include <utmpx.h>
- #endif
- #include <pwd.h>
- #include <stdlib.h>
-@@ -27,6 +28,12 @@
- #include <syslog.h>
- #include <unistd.h>
- 
-+#ifndef HAVE_UTMP_H
-+#define UT_LINESIZE 32
-+#define UT_HOSTSIZE 32
-+#define UT_NAMESIZE 256
-+#endif
-+
- #if defined(hpux) || defined(sunos) || defined(solaris)
- # ifndef _PATH_LASTLOG
- #  define _PATH_LASTLOG "/usr/adm/lastlog"
-@@ -38,7 +45,7 @@
- #  define UT_LINESIZE 12
- # endif /* UT_LINESIZE */
- #endif
--#if defined(hpux)
-+#if defined(hpux) || !defined HAVE_UTMP_H
- struct lastlog {
-     time_t  ll_time;
-     char    ll_line[UT_LINESIZE];
-@@ -447,8 +454,8 @@ last_login_failed(pam_handle_t *pamh, in
- {
-     int retval;
-     int fd;
--    struct utmp ut;
--    struct utmp utuser;
-+    struct utmpx ut;
-+    struct utmpx utuser;
-     int failed = 0;
-     char the_time[256];
-     char *date = NULL;
-Index: Linux-PAM-1.2.1/modules/pam_limits/pam_limits.c
-===================================================================
---- Linux-PAM-1.2.1.orig/modules/pam_limits/pam_limits.c
-+++ Linux-PAM-1.2.1/modules/pam_limits/pam_limits.c
-@@ -33,7 +33,7 @@
- #include <sys/resource.h>
- #include <limits.h>
- #include <glob.h>
--#include <utmp.h>
-+#include <utmpx.h>
- #ifndef UT_USER  /* some systems have ut_name instead of ut_user */
- #define UT_USER ut_user
- #endif
-@@ -227,7 +227,7 @@ static int
- check_logins (pam_handle_t *pamh, const char *name, int limit, int ctrl,
-               struct pam_limit_s *pl)
- {
--    struct utmp *ut;
-+    struct utmpx *ut;
-     int count;
- 
-     if (ctrl & PAM_DEBUG_ARG) {
-@@ -242,7 +242,7 @@ check_logins (pam_handle_t *pamh, const
-         return LOGIN_ERR;
-     }
- 
--    setutent();
-+    setutxent();
- 
-     /* Because there is no definition about when an application
-        actually adds a utmp entry, some applications bizarrely do the
-@@ -260,7 +260,7 @@ check_logins (pam_handle_t *pamh, const
- 	count = 1;
-     }
- 
--    while((ut = getutent())) {
-+    while((ut = getutxent())) {
- #ifdef USER_PROCESS
-         if (ut->ut_type != USER_PROCESS) {
-             continue;
-@@ -296,7 +296,7 @@ check_logins (pam_handle_t *pamh, const
- 	    break;
- 	}
-     }
--    endutent();
-+    endutxent();
-     if (count > limit) {
- 	if (name) {
- 	    pam_syslog(pamh, LOG_WARNING,
-Index: Linux-PAM-1.2.1/modules/pam_timestamp/pam_timestamp.c
-===================================================================
---- Linux-PAM-1.2.1.orig/modules/pam_timestamp/pam_timestamp.c
-+++ Linux-PAM-1.2.1/modules/pam_timestamp/pam_timestamp.c
-@@ -56,7 +56,7 @@
- #include <time.h>
- #include <sys/time.h>
- #include <unistd.h>
--#include <utmp.h>
-+#include <utmpx.h>
- #include <syslog.h>
- #include <paths.h>
- #include "hmacsha1.h"
-@@ -197,15 +197,15 @@ timestamp_good(time_t then, time_t now,
- static int
- check_login_time(const char *ruser, time_t timestamp)
- {
--	struct utmp utbuf, *ut;
-+	struct utmpx utbuf, *ut;
- 	time_t oldest_login = 0;
- 
--	setutent();
-+	setutxent();
- 	while(
- #ifdef HAVE_GETUTENT_R
--	      !getutent_r(&utbuf, &ut)
-+	      !getutxent_r(&utbuf, &ut)
- #else
--	      (ut = getutent()) != NULL
-+	      (ut = getutxent()) != NULL
- #endif
- 	      ) {
- 		if (ut->ut_type != USER_PROCESS) {
-@@ -218,7 +218,7 @@ check_login_time(const char *ruser, time
- 			oldest_login = ut->ut_tv.tv_sec;
- 		}
- 	}
--	endutent();
-+	endutxent();
- 	if(oldest_login == 0 || timestamp < oldest_login) {
- 		return PAM_AUTH_ERR;
- 	}
-Index: Linux-PAM-1.2.1/modules/pam_unix/support.c
-===================================================================
---- Linux-PAM-1.2.1.orig/modules/pam_unix/support.c
-+++ Linux-PAM-1.2.1/modules/pam_unix/support.c
-@@ -13,7 +13,6 @@
- #include <pwd.h>
- #include <shadow.h>
- #include <limits.h>
--#include <utmp.h>
- #include <errno.h>
- #include <signal.h>
- #include <ctype.h>
diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index df56d27..8f7753d 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -28,8 +28,6 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "da4b2289b7cfb19583d54e9eaaef1c3a"
 SRC_URI[sha256sum] = "241aed1ef522f66ed672719ecf2205ec513fd0075ed80cda8e086a5b1a01d1bb"
 
-SRC_URI_append_libc-uclibc = " file://use-utmpx.patch"
-
 SRC_URI_append_libc-musl = " file://0001-Add-support-for-defining-missing-funcitonality.patch \
                              file://include_paths_header.patch \
                            "
diff --git a/meta/recipes-extended/parted/parted_3.2.bb b/meta/recipes-extended/parted/parted_3.2.bb
index 73548b7..2bfdfb5 100644
--- a/meta/recipes-extended/parted/parted_3.2.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -24,7 +24,6 @@ SRC_URI[md5sum] = "0247b6a7b314f8edeb618159fa95f9cb"
 SRC_URI[sha256sum] = "858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4"
 
 EXTRA_OECONF = "--disable-device-mapper"
-LDFLAGS_append_libc-uclibc = " -liconv "
 
 inherit autotools pkgconfig gettext texinfo ptest
 
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 70ff68e..5e6b0bd 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -59,7 +59,6 @@ EXTRA_OECONF += "--without-audit \
 NSCDOPT = ""
 NSCDOPT_class-native = "--without-nscd"
 NSCDOPT_class-nativesdk = "--without-nscd"
-NSCDOPT_libc-uclibc = " --without-nscd"
 NSCDOPT_libc-glibc = "${@bb.utils.contains('DISTRO_FEATURES', 'libc-spawn', '--with-nscd', '--without-nscd', d)}"
           
 PAM_PLUGINS = "libpam-runtime \
diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index bb5629d..18b0861 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -55,4 +55,3 @@ pkg_postinst_${PN} () {
 FILES_${PN} += "${libdir}/sa"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
-LDFLAGS_append_libc-uclibc = " -lintl"
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index 5fdbbce..54587dc 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -73,7 +73,6 @@ EXTRA_OEMAKE = "'CC=${CC}' \
                 'EXTRA_CFLAGS=${CFLAGS} -DSYS_ERRLIST_DEFINED -DHAVE_STRERROR -DHAVE_WEAKSYMS -D_REENTRANT -DINET6=1 -Dss_family=__ss_family -Dss_len=__ss_len'"
 
 EXTRA_OEMAKE_NETGROUP = "-DNETGROUP -DUSE_GETDOMAIN"
-EXTRA_OEMAKE_NETGROUP_libc-uclibc = "-DUSE_GETDOMAIN"
 EXTRA_OEMAKE_NETGROUP_libc-musl = "-DUSE_GETDOMAIN"
 
 EXTRA_OEMAKE_append_libc-musl = " 'LIBS='"
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index 9e9f714..f4405fe 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -22,9 +22,8 @@ EXTRA_OECONF = "--enable-shared --disable-static \
 
 # Disable PolicyKit by default
 PACKAGECONFIG ??= ""
-# We really don't want PolicyKit for native or uclibc
+# We really don't want PolicyKit for native
 PACKAGECONFIG_class-native = ""
-PACKAGECONFIG_libc-uclibc = ""
 
 PACKAGECONFIG[policykit] = "--enable-defaults-service,--disable-defaults-service,polkit"
 PACKAGECONFIG[debug] = "--enable-debug=yes, --enable-debug=minimum"
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.4.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.4.1.bb
index 947f7d6..acdeae1 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.4.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.4.1.bb
@@ -22,8 +22,6 @@ EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)} "
 
 EXTRA_OECONF += "--disable-python"
 
-EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
-
 PACKAGES =+ "alsa-server libasound alsa-conf alsa-doc"
 FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
index c749f32..54be50e 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.1.4.bb
@@ -32,12 +32,6 @@ SRC_URI[sha256sum] = "a7831044de92c5bf33bf3365a3f36e49397f4191e934df460ae1ca1513
 # Avoid this by disabling expicitly
 EXTRA_OECONF = "--disable-rst2man"
 
-# lazy hack. needs proper fixing in gettext.m4, see
-# http://bugs.openembedded.org/show_bug.cgi?id=2348
-# please close bug and remove this comment when properly fixed
-#
-EXTRA_OECONF_append_libc-uclibc = " --disable-nls"
-
 inherit autotools gettext pkgconfig manpages
 
 # This are all packages that we need to make. Also, the now empty alsa-utils
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 6fb1b67..97cced7 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -19,7 +19,6 @@ RDEPENDS_${PN} = "\
     "
 
 NETWORK_MANAGER ?= "connman-gnome"
-NETWORK_MANAGER_libc-uclibc = ""
 
 SUMMARY_${PN}-base = "Sato desktop - base packages"
 RDEPENDS_${PN}-base = "\
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index c587b3c..e6f4c72 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -47,6 +47,3 @@ PACKAGES =+ "lib${BPN}"
 FILES_lib${BPN} = "${base_libdir}/lib*${SOLIBS}"
 
 BBCLASSEXTEND = "native"
-# Only append ldflags for target recipe and if USE_NLS is enabled
-LDFLAGS_append_libc-uclibc_class-target = "${@['', ' -lintl '][(d.getVar('USE_NLS') == 'yes')]}"
-EXTRA_OECONF_append_libc-uclibc_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS') == 'no')]}"
diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index e75d3a6..29b5dd6 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -46,7 +46,6 @@ EXTRA_OECONF = " \
 "
 
 LDFLAGS_append_libc-musl = " -largp"
-LDFLAGS_append_libc-uclibc = " -luargp -pthread"
 
 do_configure_prepend() {
 	for dir in . lib; do
diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index f3dc1e0..5286274 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -13,8 +13,6 @@ S = "${WORKDIR}/icu/source"
 SPDX_S = "${WORKDIR}/icu"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
-CPPFLAGS_append_libc-uclibc = " -DU_TIMEZONE=0"
-
 BINCONFIG = "${bindir}/icu-config"
 
 inherit autotools pkgconfig binconfig
diff --git a/meta/recipes-support/liburcu/liburcu_0.9.3.bb b/meta/recipes-support/liburcu/liburcu_0.9.3.bb
index 4486e0a..926ba02 100644
--- a/meta/recipes-support/liburcu/liburcu_0.9.3.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.9.3.bb
@@ -15,5 +15,4 @@ SRC_URI[md5sum] = "920970e35a1a2066c8353eabfeab8730"
 SRC_URI[sha256sum] = "1bce32e6a6c967fef6d37adaadf33df19878d69673f9ef9d3f2470e0c6ed4006"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
-CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
 inherit autotools
diff --git a/meta/recipes-support/rng-tools/rng-tools/uclibc-libuargp-configure.patch b/meta/recipes-support/rng-tools/rng-tools/uclibc-libuargp-configure.patch
deleted file mode 100644
index e691315..0000000
--- a/meta/recipes-support/rng-tools/rng-tools/uclibc-libuargp-configure.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-In case of uclibc, use libuargp
-
-If we use uclibc for system libraries, select libuargp
-
-Upstream-Status: Pending
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-diff -Naur rng-tools-5-orig/configure.ac rng-tools-5/configure.ac
---- rng-tools-5-orig/configure.ac	2016-02-24 18:11:24.023690235 +0200
-+++ rng-tools-5/configure.ac	2016-02-24 18:14:49.763118138 +0200
-@@ -39,6 +39,13 @@
- 	[with_libargp=check]
- )
- 
-+AC_ARG_ENABLE([uclibc],
-+    AS_HELP_STRING([--enable-uclibc], [Use uclibc for system libraries]),
-+        use_uclibc=yes, use_uclibc=no)
-+AM_CONDITIONAL(USE_UCLIBC, test "x$use_uclibc" = "xyes")
-+AS_IF([test "x$use_uclibc" = "xyes"], [AC_DEFINE(USE_UCLIBC)])
-+AH_TEMPLATE([USE_UCLIBC], [Defined if uclibc libraries are used.])
-+
- dnl Make sure anyone changing configure.ac/Makefile.am has a clue
- AM_MAINTAINER_MODE
- 
-@@ -101,7 +108,7 @@
- 			[need_libargp=no],
- 			[need_libargp=yes
- 			 if test "x$with_libargp" = "xno"; then
--				AC_MSG_FAILURE([libargp disabled and libc does not have argp])
-+				AC_MSG_WARN([libargp disabled and libc does not have argp])
- 			 fi]
- 		)
- 	],
-@@ -110,7 +117,7 @@
- 
- dnl Check for libargp
- AS_IF(
--	[test "x$need_libargp" = "xyes"],
-+	[test "x$need_libargp" = "xyes" -a "x$use_uclibc" = "xno"],
- 	[
- 		AC_CHECK_LIB(
- 			[argp],
-@@ -120,6 +127,19 @@
- 		)
- 	]
- )
-+
-+dnl Check for libuargp
-+AS_IF(
-+	[test "x$use_uclibc" = "xyes"],
-+	[
-+		AC_CHECK_LIB(
-+			[uargp],
-+			[argp_parse],
-+			[LIBS="$LIBS -luargp"],
-+			[AC_MSG_FAILURE([libuargp not found])]
-+		)
-+	]
-+)
- 
- dnl -----------------
- dnl Configure options
diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
index e2acaba..de6e5f9 100644
--- a/meta/recipes-support/rng-tools/rng-tools_5.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
@@ -6,7 +6,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gkernel/${BP}.tar.gz \
            file://0001-If-the-libc-is-lacking-argp-use-libargp.patch \
            file://0002-Add-argument-to-control-the-libargp-dependency.patch \
            file://underquote.patch \
-           file://uclibc-libuargp-configure.patch \
            file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
            file://init \
            file://default"
@@ -25,9 +24,7 @@ inherit autotools update-rc.d
 
 PACKAGECONFIG = "libgcrypt"
 PACKAGECONFIG_libc-musl = "libargp"
-PACKAGECONFIG_libc-uclibc = "libuargp"
 PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
-PACKAGECONFIG[libuargp] = "--enable-uclibc,,,"
 PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
 
 do_install_append() {
-- 
2.7.4


