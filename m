Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F2F5960FD3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 11:26:02 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Dec 2013 03:26:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,877,1378882800"; d="scan'208";a="423513798"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.252])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2013 03:26:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2013 11:25:53 +0000
Message-Id: <9c7ab89a1f2d3e7d20d7ba51d573482a7adf686c.1386847526.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386847526.git.paul.eggleton@linux.intel.com>
References: <cover.1386847526.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386847526.git.paul.eggleton@linux.intel.com>
References: <cover.1386847526.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] external-sourcery-toolchain: remove
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
X-List-Received-Date: Thu, 12 Dec 2013 11:26:03 -0000

As per discussion on the mailing list [1], remove this largely
unmaintained external toolchain support in favour of the maintained
version in meta-sourcery [2].

[1] http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087133.html
[2] https://github.com/MentorEmbedded/meta-sourcery/

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/distro/include/csl-versions.inc          | 107 ---------
 meta/conf/distro/include/tcmode-external-csl.inc   |   2 -
 .../distro/include/tcmode-external-sourcery.inc    | 128 ----------
 .../meta/external-sourcery-toolchain.bb            | 149 ------------
 .../meta/external-sourcery-toolchain/SUPPORTED     | 257 ---------------------
 5 files changed, 643 deletions(-)
 delete mode 100644 meta/conf/distro/include/csl-versions.inc
 delete mode 100644 meta/conf/distro/include/tcmode-external-csl.inc
 delete mode 100644 meta/conf/distro/include/tcmode-external-sourcery.inc
 delete mode 100644 meta/recipes-core/meta/external-sourcery-toolchain.bb
 delete mode 100644 meta/recipes-core/meta/external-sourcery-toolchain/SUPPORTED

diff --git a/meta/conf/distro/include/csl-versions.inc b/meta/conf/distro/include/csl-versions.inc
deleted file mode 100644
index 3938bf7..0000000
--- a/meta/conf/distro/include/csl-versions.inc
+++ /dev/null
@@ -1,107 +0,0 @@
-def csl_run(d, cmd, *args):
-	import bb.process
-	import subprocess
-
-	topdir = d.getVar('TOPDIR', True)
-	toolchain_path = d.getVar('EXTERNAL_TOOLCHAIN', True)
-	if not toolchain_path:
-		return 'UNKNOWN', 'UNKNOWN'
-
-	target_prefix = d.getVar('TARGET_PREFIX', True)
-	path = os.path.join(toolchain_path, 'bin', target_prefix + cmd)
-	args = [path] + list(args)
-
-	return bb.process.run(args, cwd=topdir, stderr=subprocess.PIPE)
-
-def csl_get_version(d):
-        try:
-		stdout, stderr = csl_run(d, 'gcc', '-v')
-	except bb.process.CmdError as exc:
-		bb.error('Failed to obtain CodeSourcery toolchain version: %s' % exc)
-		bb.error('Make sure that MACHINE is set correctly in your local.conf and the toolchain supports %s.' % d.getVar("TARGET_ARCH", True))
-		return 'UNKNOWN'
-	else:
-		last_line = stderr.splitlines()[-1]
-		return last_line
-
-def csl_get_main_version(d):
-	version = csl_get_version(d)
-	if version != 'UNKNOWN':
-		return version.split()[-1].rstrip(')')
-	else:
-		return version
-
-def csl_get_gcc_version(d):
-	version = csl_get_version(d)
-	if version != 'UNKNOWN':
-		return version.split()[2]
-	else:
-		return version
-
-def csl_get_libc_version(d):
-	syspath = d.expand('${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}')
-	if not syspath:
-	        return 'UNKNOWN'
-
-	libpath = syspath + '/libc/lib/'
-	if not os.path.exists(libpath):
-		libpath = syspath + '/libc/sgxx-glibc/lib/'
-
-	if os.path.exists(libpath):
-		for file in os.listdir(libpath):
-			if file.find('libc-') == 0:
-				return file[5:-3]
-	return 'UNKNOWN'
-
-def csl_get_kernel_version(d):
-	syspath = d.expand('${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}')
-	if not syspath:
-	        return 'UNKNOWN'
-
-	vf = syspath + '/libc/usr/include/linux/version.h'
-	if not os.path.exists(vf):
-		vf = syspath + '/libc/sgxx-glibc/usr/include/linux/version.h'
-
-	try:
-		f = open(vf, 'r')
-	except (OSError, IOError):
-		return 'UNKNOWN'
-
-	l = f.readlines();
-	f.close();
-	for s in l:
-		if s.find('LINUX_VERSION_CODE') > 0:
-			ver = int(s.split()[2])
-			maj = ver / 65536
-			ver = ver % 65536
-			min = ver / 256
-			ver = ver % 256
-			return str(maj)+'.'+str(min)+'.'+str(ver)
-	return 'UNKNOWN'
-
-def csl_get_gdb_version(d):
-	try:
-		stdout, stderr = csl_run(d, 'gdb', '-v')
-	except bb.process.CmdError:
-		return 'UNKNOWN'
-	else:
-		first_line = stdout.splitlines()[0]
-		return first_line.split()[-1]
-
-python csl_version_handler () {
-    d = e.data
-    ld = d.createCopy()
-    ld.finalize()
-
-    d.setVar('CSL_VER_MAIN', csl_get_main_version(ld))
-    d.setVar('CSL_VER_GCC', csl_get_gcc_version(ld))
-    d.setVar('CSL_VER_LIBC', csl_get_libc_version(ld))
-    d.setVar('CSL_VER_KERNEL', csl_get_kernel_version(ld))
-    d.setVar('CSL_VER_GDB', csl_get_gdb_version(ld))
-}
-addhandler csl_version_handler
-csl_version_handler[eventmask] = "bb.event.ConfigParsed"
-
-# Ensure that any variable which includes the --sysroot (CC, CXX, etc) also
-# depends on the toolchain version
-TOOLCHAIN_OPTIONS[vardeps] += "CSL_VER_MAIN CSL_VER_GCC"
diff --git a/meta/conf/distro/include/tcmode-external-csl.inc b/meta/conf/distro/include/tcmode-external-csl.inc
deleted file mode 100644
index 9e530ab..0000000
--- a/meta/conf/distro/include/tcmode-external-csl.inc
+++ /dev/null
@@ -1,2 +0,0 @@
-TCMODE = "external-sourcery"
-require conf/distro/include/tcmode-${TCMODE}.inc
diff --git a/meta/conf/distro/include/tcmode-external-sourcery.inc b/meta/conf/distro/include/tcmode-external-sourcery.inc
deleted file mode 100644
index 5590f7a..0000000
--- a/meta/conf/distro/include/tcmode-external-sourcery.inc
+++ /dev/null
@@ -1,128 +0,0 @@
-#
-# Configuration to use external Sourcery G++ toolchain
-#
-
-EXTERNAL_TOOLCHAIN ?= "/usr/local/csl/${TARGET_ARCH}"
-
-TOOLCHAIN_PATH_ADD = "${EXTERNAL_TOOLCHAIN}/bin:"
-PATH =. "${TOOLCHAIN_PATH_ADD}"
-
-CSL_TARGET_SYS_powerpc ?= "powerpc-linux-gnu"
-CSL_TARGET_SYS_powerpc64 ?= "powerpc-linux-gnu"
-CSL_TARGET_SYS_arm ?= "arm-none-linux-gnueabi"
-CSL_TARGET_SYS_mips ?= "mips-linux-gnu"
-CSL_TARGET_SYS_mipsel ?= "mips-linux-gnu"
-CSL_TARGET_SYS_mips64 ?= "mips-linux-gnu"
-CSL_TARGET_SYS_i686 ?= "i686-pc-linux-gnu"
-CSL_TARGET_SYS_i586 ?= "i686-pc-linux-gnu"
-CSL_TARGET_SYS = "${TARGET_SYS}"
-
-TARGET_PREFIX = "${CSL_TARGET_SYS}-"
-
-PREFERRED_PROVIDER_linux-libc-headers = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_linux-libc-headers-dev = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_libgcc = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_eglibc = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/libc = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/libintl = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/libiconv = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_glibc-thread-db = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/linux-libc-headers = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_virtual/linux-libc-headers-dev = "external-sourcery-toolchain"
-PREFERRED_PROVIDER_gdbserver ??= "external-sourcery-toolchain"
-
-# No need to re-compile the locale files
-GLIBC_INTERNAL_USE_BINARY_LOCALE = "precompiled"
-ENABLE_BINARY_LOCALE_GENERATION = ""
-
-TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
-
-# Point to the appropriate multilib sysroot from the external toolchain, whose
-# files will be extracted into the OE sysroot
-def exttc_run(d, cmd):
-    try:
-        return bb.process.run(cmd, shell=True, env={'PATH': d.getVar('PATH', True)})[0].rstrip()
-    except (OSError, bb.process.CmdError):
-        return ''
-
-EXTERNAL_TOOLCHAIN_SYSROOT_CMD = "${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} -print-sysroot"
-EXTERNAL_TOOLCHAIN_SYSROOT ??= "${@exttc_run(d, EXTERNAL_TOOLCHAIN_SYSROOT_CMD)}"
-
-# These bits are here temporarily to sidestep the need to use a separate set
-# of tune files to pass the appropriate multilib selection arguments to the
-# sourcery toolchain, as is needed to extract the sysroot content.
-TUNE_CCARGS_append_x86 = " -msgxx-glibc"
-
-CSL_MULTILIB_ARGS[ppce500] ?= "-te500v1"
-CSL_MULTILIB_ARGS[ppce500mc] ?= "-te500mc"
-CSL_MULTILIB_ARGS[ppce500v2] ?= "-te500v2"
-CSL_MULTILIB_ARGS[ppce600] ?= "-te600"
-
-def csl_multilib_arg(d):
-    argument = d.getVarFlag('CSL_MULTILIB_ARGS', d.getVar('DEFAULTTUNE', True) or '')
-    if argument:
-        return argument
-    else:
-        return ''
-
-EXTERNAL_TOOLCHAIN_SYSROOT_CMD += "${@csl_multilib_arg(d)}"
-
-
-# Unfortunately, the CSL ia32 toolchain has non-prefixed binaries in its
-# bindir (e.g. gcc, ld). To avoid this messing up our build, we avoid adding
-# this bindir to our PATH, and instead add symlinks to the prefixed binaries
-# to our staging toolchain bindir.
-
-python toolchain_metadata_setup () {
-    d = e.data
-
-    l = d.createCopy()
-    l.finalize()
-    if os.path.exists(bb.data.expand('${EXTERNAL_TOOLCHAIN}/bin/gcc', l)):
-        d.setVar('TOOLCHAIN_PATH_ADD', '')
-}
-addhandler toolchain_metadata_setup
-toolchain_metadata_setup[eventmask] = "bb.event.ConfigParsed"
-
-python toolchain_setup () {
-    d = e.data
-
-    if not d.getVar('TOOLCHAIN_PATH_ADD', True):
-        populate_toolchain_links(d)
-}
-addhandler toolchain_setup
-toolchain_setup[eventmask] = "bb.event.BuildStarted"
-
-def populate_toolchain_links(d):
-    import errno
-    from glob import glob
-
-    d = d.createCopy()
-    d.finalize()
-
-    pattern = d.expand('${EXTERNAL_TOOLCHAIN}/bin/${TARGET_PREFIX}*')
-    files = glob(pattern)
-    if not files:
-        bb.fatal("Unable to populate toolchain binary symlinks in %s" % pattern)
-
-    bindir = d.getVar('STAGING_BINDIR_TOOLCHAIN', True)
-    bb.utils.mkdirhier(bindir)
-    for f in files:
-        base = os.path.basename(f)
-        newpath = os.path.join(bindir, base)
-        try:
-            os.symlink(f, newpath)
-        except OSError as exc:
-            if exc.errno == errno.EEXIST:
-                break
-            bb.fatal("Unable to populate toolchain binary symlink for %s: %s" % (newpath, exc))
-
-require conf/distro/include/csl-versions.inc
diff --git a/meta/recipes-core/meta/external-sourcery-toolchain.bb b/meta/recipes-core/meta/external-sourcery-toolchain.bb
deleted file mode 100644
index 41d86d6..0000000
--- a/meta/recipes-core/meta/external-sourcery-toolchain.bb
+++ /dev/null
@@ -1,149 +0,0 @@
-require recipes-core/eglibc/eglibc-package.inc
-
-INHIBIT_DEFAULT_DEPS = "1"
-
-# License applies to this recipe code, not the toolchain itself
-SUMMARY = "External Sourcery G++ toolchain"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-PROVIDES += "\
-	linux-libc-headers \
-	virtual/${TARGET_PREFIX}gcc \
-	virtual/${TARGET_PREFIX}g++ \
-	virtual/${TARGET_PREFIX}gcc-initial \
-	virtual/${TARGET_PREFIX}gcc-intermediate \
-	virtual/${TARGET_PREFIX}binutils \
-	virtual/${TARGET_PREFIX}libc-for-gcc \
-	virtual/${TARGET_PREFIX}libc-initial \
-	virtual/${TARGET_PREFIX}compilerlibs \
-	virtual/libc \
-	virtual/libintl \
-	virtual/libiconv \
-	glibc-thread-db \
-	libgcc \
-	eglibc \
-	virtual/linux-libc-headers \
-"
-PV = "${CSL_VER_MAIN}"
-PR = "r7"
-
-#SRC_URI = "http://www.codesourcery.com/public/gnu_toolchain/${CSL_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
-
-SRC_URI = "file://SUPPORTED"
-
-do_install() {
-	# Use optimized files if available
-	sysroot="${EXTERNAL_TOOLCHAIN_SYSROOT}"
-
-	cp -a $sysroot${base_libdir}/. ${D}${base_libdir}
-	cp -a $sysroot/etc/. ${D}${sysconfdir}
-	cp -a $sysroot/sbin/. ${D}${base_sbindir}
-
-	install -d ${D}/usr
-	for usr_element in bin libexec sbin share ${base_libdir}; do
-		usr_path=$sysroot/usr/$usr_element
-		cp -a $usr_path ${D}/usr/
-	done
-	for datadir_element in man info; do
-		datadir_path=$sysroot/usr/$datadir_element
-		if [ -e $datadir_path ]; then
-			cp -a $datadir_path ${D}${datadir}/
-		fi
-	done
-
-	# Some toolchains have headers under the core specific area
-	if [ -e $sysroot/usr/include ]; then
-		cp -a $sysroot/usr/include/. ${D}${includedir}
-	else
-		cp -a $sysroot/../usr/include/. ${D}${includedir}
-	fi
-
-	rm ${D}${sysconfdir}/rpc
-	rm -r ${D}${datadir}/zoneinfo
-
-	mv ${D}${libdir}/bin/* ${D}${bindir}/
-	if [ -e ${D}${libdir}/bin/.debug ]; then
-		mv ${D}${libdir}/bin/.debug/* ${D}${bindir}/.debug/
-	fi
-	ln -s ../../bin/gdbserver ${D}${libdir}/bin/sysroot-gdbserver
-
-	sed -i -e 's/__packed/__attribute__ ((packed))/' ${D}${includedir}/mtd/ubi-user.h
-        sed -i -e "s# ${base_libdir}# ../..${base_libdir}#g" -e "s# ${libdir}# .#g" ${D}${libdir}/libc.so
-        sed -i -e "s# ${base_libdir}# ../..${base_libdir}#g" -e "s# ${libdir}# .#g" ${D}${libdir}/libpthread.so
-}
-
-SYSROOT_PREPROCESS_FUNCS += "external_toolchain_sysroot_adjust"
-external_toolchain_sysroot_adjust() {
-	dest_sysroot="$(${CC} -print-sysroot | sed -e's,^${STAGING_DIR_HOST},,; s,/$,,')"
-	if [ -n "$dest_sysroot" ]; then
-		rm -f ${SYSROOT_DESTDIR}/$dest_sysroot
-		ln -s . ${SYSROOT_DESTDIR}/$dest_sysroot
-	fi
-
-	# If the usr/lib directory doesn't exist, the toolchain fails to even
-	# try to find crti.o in a completely different directory (usr/lib64)
-	install -d ${SYSROOT_DESTDIR}/usr/lib
-}
-
-PACKAGES =+ "libgcc libgcc-dev libstdc++ libstdc++-dev libstdc++-staticdev linux-libc-headers linux-libc-headers-dev gdbserver gdbserver-dbg"
-
-# This test should be fixed to ignore .a files in .debug dirs
-INSANE_SKIP_${PN}-dbg = "staticdev"
-
-# We don't care about GNU_HASH in prebuilt binaries
-INSANE_SKIP_${PN}-utils += "ldflags"
-INSANE_SKIP_libstdc++ += "ldflags"
-INSANE_SKIP_libgcc += "ldflags"
-INSANE_SKIP_gdbserver += "ldflags"
-
-PKG_${PN} = "eglibc"
-PKG_${PN}-dev = "eglibc-dev"
-PKG_${PN}-staticdev = "eglibc-staticdev"
-PKG_${PN}-doc = "eglibc-doc"
-PKG_${PN}-dbg = "eglibc-dbg"
-PKG_${PN}-pic = "eglibc-pic"
-PKG_${PN}-utils = "eglibc-utils"
-PKG_${PN}-gconv = "eglibc-gconv"
-PKG_${PN}-extra-nss = "eglibc-extra-nss"
-PKG_${PN}-thread-db = "eglibc-thread-db"
-PKG_${PN}-pcprofile = "eglibc-pcprofile"
-
-PKGV = "${CSL_VER_LIBC}"
-PKGV_libgcc = "${CSL_VER_GCC}"
-PKGV_libgcc-dev = "${CSL_VER_GCC}"
-PKGV_libstdc++ = "${CSL_VER_GCC}"
-PKGV_libstdc++-dev = "${CSL_VER_GCC}"
-PKGV_libstdc++-staticdev = "${CSL_VER_GCC}"
-PKGV_linux-libc-headers = "${CSL_VER_KERNEL}"
-PKGV_linux-libc-headers-dev = "${CSL_VER_KERNEL}"
-PKGV_gdbserver = "${CSL_VER_GDB}"
-PKGV_gdbserver-dbg = "${CSL_VER_GDB}"
-
-FILES_libgcc = "${base_libdir}/libgcc_s.so.1"
-FILES_libgcc-dev = "${base_libdir}/libgcc_s.so"
-FILES_libstdc++ = "${libdir}/libstdc++.so.*"
-FILES_libstdc++-dev = "${includedir}/c++/${PV} \
-	${libdir}/libstdc++.so \
-	${libdir}/libstdc++.la \
-	${libdir}/libsupc++.la"
-FILES_libstdc++-staticdev = "${libdir}/libstdc++.a ${libdir}/libsupc++.a"
-FILES_linux-libc-headers = "${includedir}/asm* \
-	${includedir}/linux \
-	${includedir}/mtd \
-	${includedir}/rdma \
-	${includedir}/scsi \
-	${includedir}/sound \
-	${includedir}/video \
-"
-FILES_gdbserver = "${bindir}/gdbserver ${libdir}/bin/sysroot-gdbserver"
-FILES_gdbserver-dbg = "${bindir}/.debug/gdbserver"
-
-CSL_VER_MAIN ??= ""
-
-python () {
-    if not d.getVar("CSL_VER_MAIN"):
-        raise bb.parse.SkipPackage("External CSL toolchain not configured (CSL_VER_MAIN not set).")
-}
-
diff --git a/meta/recipes-core/meta/external-sourcery-toolchain/SUPPORTED b/meta/recipes-core/meta/external-sourcery-toolchain/SUPPORTED
deleted file mode 100644
index 3f74688..0000000
--- a/meta/recipes-core/meta/external-sourcery-toolchain/SUPPORTED
+++ /dev/null
@@ -1,257 +0,0 @@
-aa_DJ ISO-8859-1
-aa_ER UTF-8
-aa_ER@saaho UTF-8
-aa_ET UTF-8
-af_ZA ISO-8859-1
-am_ET UTF-8
-an_ES ISO-8859-15
-ar_AE ISO-8859-6
-ar_BH ISO-8859-6
-ar_DZ ISO-8859-6
-ar_EG ISO-8859-6
-ar_IN UTF-8
-ar_IQ ISO-8859-6
-ar_JO ISO-8859-6
-ar_KW ISO-8859-6
-ar_LB ISO-8859-6
-ar_LY ISO-8859-6
-ar_MA ISO-8859-6
-ar_OM ISO-8859-6
-ar_QA ISO-8859-6
-ar_SA ISO-8859-6
-ar_SD ISO-8859-6
-ar_SY ISO-8859-6
-ar_TN ISO-8859-6
-ar_YE ISO-8859-6
-ast_ES ISO-8859-15
-be_BY CP1251
-be_BY@latin UTF-8
-ber_DZ UTF-8
-ber_MA UTF-8
-bg_BG CP1251
-bn_BD UTF-8
-bn_IN UTF-8
-bo_CN UTF-8
-bo_IN UTF-8
-br_FR ISO-8859-1
-br_FR@euro ISO-8859-15
-bs_BA ISO-8859-2
-byn_ER UTF-8
-ca_AD ISO-8859-15
-ca_ES ISO-8859-1
-ca_ES@euro ISO-8859-15
-ca_FR ISO-8859-15
-ca_IT ISO-8859-15
-crh_UA UTF-8
-cs_CZ ISO-8859-2
-csb_PL UTF-8
-cy_GB ISO-8859-14
-da_DK ISO-8859-1
-de_AT ISO-8859-1
-de_AT@euro ISO-8859-15
-de_BE ISO-8859-1
-de_BE@euro ISO-8859-15
-de_CH ISO-8859-1
-de_DE ISO-8859-1
-de_DE@euro ISO-8859-15
-de_LU ISO-8859-1
-de_LU@euro ISO-8859-15
-dv_MV UTF-8
-dz_BT UTF-8
-el_GR ISO-8859-7
-el_CY ISO-8859-7
-en_AG UTF-8
-en_AU ISO-8859-1
-en_BW ISO-8859-1
-en_CA ISO-8859-1
-en_DK ISO-8859-1
-en_GB ISO-8859-1
-en_HK ISO-8859-1
-en_IE ISO-8859-1
-en_IE@euro ISO-8859-15
-en_IN UTF-8
-en_NG UTF-8
-en_NZ ISO-8859-1
-en_PH ISO-8859-1
-en_SG ISO-8859-1
-en_US ISO-8859-1
-en_ZA ISO-8859-1
-en_ZW ISO-8859-1
-es_AR ISO-8859-1
-es_BO ISO-8859-1
-es_CL ISO-8859-1
-es_CO ISO-8859-1
-es_DO ISO-8859-1
-es_EC ISO-8859-1
-es_ES ISO-8859-1
-es_ES@euro ISO-8859-15
-es_GT ISO-8859-1
-es_HN ISO-8859-1
-es_MX ISO-8859-1
-es_NI ISO-8859-1
-es_PA ISO-8859-1
-es_PE ISO-8859-1
-es_PR ISO-8859-1
-es_PY ISO-8859-1
-es_SV ISO-8859-1
-es_US ISO-8859-1
-es_UY ISO-8859-1
-es_VE ISO-8859-1
-et_EE ISO-8859-1
-eu_ES ISO-8859-1
-eu_ES@euro ISO-8859-15
-fa_IR UTF-8
-fi_FI ISO-8859-1
-fi_FI@euro ISO-8859-15
-fil_PH UTF-8
-fo_FO ISO-8859-1
-fr_BE ISO-8859-1
-fr_BE@euro ISO-8859-15
-fr_CA ISO-8859-1
-fr_CH ISO-8859-1
-fr_FR ISO-8859-1
-fr_FR@euro ISO-8859-15
-fr_LU ISO-8859-1
-fr_LU@euro ISO-8859-15
-fur_IT UTF-8
-fy_NL UTF-8
-fy_DE UTF-8
-ga_IE ISO-8859-1
-ga_IE@euro ISO-8859-15
-gd_GB ISO-8859-15
-gez_ER UTF-8
-gez_ER@abegede UTF-8
-gez_ET UTF-8
-gez_ET@abegede UTF-8
-gl_ES ISO-8859-1
-gl_ES@euro ISO-8859-15
-gu_IN UTF-8
-gv_GB ISO-8859-1
-ha_NG UTF-8
-he_IL ISO-8859-8
-hi_IN UTF-8
-hne_IN UTF-8
-hr_HR ISO-8859-2
-hsb_DE ISO-8859-2
-ht_HT UTF-8
-hu_HU ISO-8859-2
-hy_AM UTF-8
-id_ID ISO-8859-1
-ig_NG UTF-8
-ik_CA UTF-8
-is_IS ISO-8859-1
-it_CH ISO-8859-1
-it_IT ISO-8859-1
-it_IT@euro ISO-8859-15
-iu_CA UTF-8
-iw_IL ISO-8859-8
-ka_GE GEORGIAN-PS
-kk_KZ PT154
-kk_KZ RK1048
-kl_GL ISO-8859-1
-km_KH UTF-8
-kn_IN UTF-8
-ks_IN UTF-8
-ks_IN@devanagari UTF-8
-ku_TR ISO-8859-9
-kw_GB ISO-8859-1
-ky_KG UTF-8
-lg_UG ISO-8859-10
-li_BE UTF-8
-li_NL UTF-8
-lo_LA UTF-8
-lt_LT ISO-8859-13
-lv_LV ISO-8859-13
-mai_IN UTF-8
-mg_MG ISO-8859-15
-mi_NZ ISO-8859-13
-mk_MK ISO-8859-5
-ml_IN UTF-8
-mn_MN UTF-8
-mr_IN UTF-8
-ms_MY ISO-8859-1
-mt_MT ISO-8859-3
-my_MM UTF-8
-nan_TW@latin UTF-8
-nb_NO ISO-8859-1
-nds_DE UTF-8
-nds_NL UTF-8
-ne_NP UTF-8
-nl_AW UTF-8
-nl_BE ISO-8859-1
-nl_BE@euro ISO-8859-15
-nl_NL ISO-8859-1
-nl_NL@euro ISO-8859-15
-nn_NO ISO-8859-1
-nr_ZA UTF-8
-nso_ZA UTF-8
-oc_FR ISO-8859-1
-om_ET UTF-8
-om_KE ISO-8859-1
-or_IN UTF-8
-pa_IN UTF-8
-pa_PK UTF-8
-pap_AN UTF-8
-pl_PL ISO-8859-2
-ps_AF UTF-8
-pt_BR ISO-8859-1
-pt_PT ISO-8859-1
-pt_PT@euro ISO-8859-15
-ro_RO ISO-8859-2
-ru_RU ISO-8859-5
-ru_UA KOI8-U
-rw_RW UTF-8
-sa_IN UTF-8
-sc_IT UTF-8
-sd_IN UTF-8
-sd_IN@devanagari UTF-8
-se_NO UTF-8
-shs_CA UTF-8
-si_LK UTF-8
-sid_ET UTF-8
-sk_SK ISO-8859-2
-sl_SI ISO-8859-2
-so_DJ ISO-8859-1
-so_ET UTF-8
-so_KE ISO-8859-1
-so_SO ISO-8859-1
-sq_AL ISO-8859-1
-sr_ME UTF-8
-sr_RS UTF-8
-sr_RS@latin UTF-8
-ss_ZA UTF-8
-st_ZA ISO-8859-1
-sv_FI ISO-8859-1
-sv_FI@euro ISO-8859-15
-sv_SE ISO-8859-1
-ta_IN UTF-8
-te_IN UTF-8
-tg_TJ KOI8-T
-th_TH TIS-620
-ti_ER UTF-8
-ti_ET UTF-8
-tig_ER UTF-8
-tk_TM UTF-8
-tl_PH ISO-8859-1
-tn_ZA UTF-8
-tr_CY ISO-8859-9
-tr_TR ISO-8859-9
-ts_ZA UTF-8
-ug_CN UTF-8
-uk_UA KOI8-U
-ur_PK UTF-8
-uz_UZ ISO-8859-1
-uz_UZ@cyrillic UTF-8
-ve_ZA UTF-8
-vi_VN UTF-8
-wa_BE ISO-8859-1
-wa_BE@euro ISO-8859-15
-wo_SN UTF-8
-xh_ZA ISO-8859-1
-yi_US CP1255
-yo_NG UTF-8
-zh_CN GB2312
-zh_HK BIG5-HKSCS
-zh_SG GB2312
-zh_TW BIG5
-zu_ZA ISO-8859-1
-- 
1.8.1.2


