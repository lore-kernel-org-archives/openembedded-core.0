Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8479565E94
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 12:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7TC9MkE032167; Fri, 29 Aug 2014 13:09:50 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CM53kKvmfInu; Fri, 29 Aug 2014 13:09:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7TC9kun032187
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 29 Aug 2014 13:09:47 +0100
Message-ID: <1409314188.29296.167.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Aug 2014 13:09:48 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: "Bartosh, Eduard" <eduard.bartosh@intel.com>
Subject: [PATCH RFC] imagebuilder-collab: Add illustration of standalone image creation tool
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
X-List-Received-Date: Fri, 29 Aug 2014 12:10:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This adds a recipe which creates a tarball of a standalone image
creation tool. On the most part this is copying in our standard lib/bb
and lib/oe library functions. There is a modified base.bbclass and
bitbake.conf, ultimately we could refactor files to remove duplication
here should we find this kind of idea useful. bitbake itself is not
used, nor is the cooker, its a standalone script in the form of a
tinfoil wrapper tool. There are more details in the README that gets
placed in the resulting tarball.

Why is this interesting?

I talk to various people, some of them work on other projects and it
turns out that there are several groups of people out there who would
really like to have a really good robust capable image generator.

We do have code as part of OE that does this, I've said for a long time
that you could use it standalone, I decided to put that to the test and
this patch is the result. Right now there are a few assumptions in the
code but these can likely be resolved relatively easily.

I'm putting this out there now to show the idea and solicit feedback.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/meta/imagebuilder-collab/README b/meta/recipes-core/meta/imagebuilder-collab/README
new file mode 100644
index 0000000..45636da
--- /dev/null
+++ b/meta/recipes-core/meta/imagebuilder-collab/README
@@ -0,0 +1,51 @@
+To use the proof of concept, execute a command like:
+
+NATIVESYSROOT=/media/build1/poky/build1/tmp/sysroots/x86_64-linux/usr
+PATH=$NATIVESYSROOT/bin:$NATIVESYSROOT/sbin:$PATH \
+BBPATH=meta \
+PSEUDO_PREFIX=$NATIVESYSROOT \
+PSEUDO_LOCALSTATEDIR=`pwd`/tmp/work/-oe-linux/core-image-minimal/1.0-r0/pseudo/ \
+PSEUDO_PASSWD=`pwd`/tmp/work/-oe-linux/core-image-minimal/1.0-r0/rootfs \
+PSEUDO_NOSYMLINKEXP=1 \
+PSEUDO_BINDIR=$NATIVESYSROOT/bin \
+PSEUDO_LIBDIR=$NATIVESYSROOT/bin/../lib/pseudo/lib 
+pseudo \
+./bitbake/bin/build-rootfs
+
+Needs:
+
+"mkdir tmp/sysroots/\${MACHINE}/pkgdata -p" to avoid an error due to missing pkgdata
+
+Add $NATIVESYSROOT/bin/python-native to path if building rpm and using a Yocto native 
+sysroot. We need the python native version to match the smartpm python modules.
+
+Generated image ends up in tmp/deploy/images/
+
+The directory in PATH needs to contain the tools the system needs like opkg-utils-native, pseudo-native and
+so on that Yocto would usually build before running the rootfs generation code.
+
+As a proof of concept, it executes the do_rootfs task of the single 
+included image recipe, core-image-minimal.bb.
+
+Known issues:
+
+* The native sysroot is needed in PATH for tools
+* There are hardcoded paths in bitbake/bin/build-rootfs to find the directory of 
+  packages (DEPLOY_DIR_IMAGE), the postinst intecept scritps (found using COREBASE).
+* The list of package architectres is hardcoded in bitbake/bin/build-rootfs
+* To work properly, pseudo needs to be load in advance of the tool since 
+  the fakeroot/pseudo code in build-rootfs is disabled right now
+* The package type is set to ipk in base.bbclass at present
+
+Needs:
+
+"mkdir tmp/sysroots/\${MACHINE}/pkgdata -p" to avoid an error due to missing pkgdata
+
+Example set of rpms for core-image-minimal: http://www.rpsys.net/wp/rp/rpm.tar.bz2 to 
+extract in tmp/deploy/rpm
+
+If using a Yocto native sysroot for the build tools, the setup is (roughly):
+
+git clone git://git.yoctoproject.org/poky; cd poky; source oe-init-build-env; bitbake pseudo-native python-smartpm-native createrepo-native update-rc.d-native
+
+
diff --git a/meta/recipes-core/meta/imagebuilder-collab/base.bbclass b/meta/recipes-core/meta/imagebuilder-collab/base.bbclass
new file mode 100644
index 0000000..7b9cbd0
--- /dev/null
+++ b/meta/recipes-core/meta/imagebuilder-collab/base.bbclass
@@ -0,0 +1,35 @@
+
+inherit utils
+
+
+OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.packagegroup "
+OE_IMPORTS[type] = "list"
+
+def oe_import(d):
+    import sys
+
+    bbpath = d.getVar("BBPATH", True).split(":")
+    sys.path[0:0] = [os.path.join(dir, "lib") for dir in bbpath]
+
+    def inject(name, value):
+        """Make a python object accessible from the metadata"""
+        if hasattr(bb.utils, "_context"):
+            bb.utils._context[name] = value
+        else:
+            __builtins__[name] = value
+
+    import oe.data
+    for toimport in oe.data.typed_value("OE_IMPORTS", d):
+        imported = __import__(toimport)
+        inject(toimport.split(".", 1)[0], imported)
+
+    return ""
+
+# We need the oe module name space early (before INHERITs get added)
+OE_IMPORTED := "${@oe_import(d)}"
+
+OPKG_ARGS = "--force_postinstall --prefer-arch-to-version"
+OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS", True) == "1"]}"
+OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE', True) or "").split())][(d.getVar("PACKAGE_EXCLUDE", True) or "") != ""]}"
+IPKGCONF_TARGET = "${WORKDIR}/opkg.conf"
+IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
diff --git a/meta/recipes-core/meta/imagebuilder-collab/bitbake.conf b/meta/recipes-core/meta/imagebuilder-collab/bitbake.conf
new file mode 100644
index 0000000..bb22d79
--- /dev/null
+++ b/meta/recipes-core/meta/imagebuilder-collab/bitbake.conf
@@ -0,0 +1,379 @@
+##################################################################
+# Standard target filesystem paths.
+##################################################################
+#
+# If changing these values, beware that native/cross/nativesdk bbclass 
+# files may also need changes to keep in sync.
+#
+
+# Used by multilib code to change the library paths
+baselib = "${BASELIB}"
+baselib[vardepvalue] = "${baselib}"
+BASELIB = "lib"
+BASELIB_powerpc64 = "lib64"
+
+# Path prefixes
+export base_prefix = ""
+export prefix = "/usr"
+export exec_prefix = "/usr"
+
+# Base paths
+export base_bindir = "${base_prefix}/bin"
+export base_sbindir = "${base_prefix}/sbin"
+export base_libdir = "${base_prefix}/${baselib}"
+export nonarch_base_libdir = "${base_prefix}/lib"
+
+# Architecture independent paths
+export sysconfdir = "${base_prefix}/etc"
+export servicedir = "${base_prefix}/srv"
+export sharedstatedir = "${base_prefix}/com"
+export localstatedir = "${base_prefix}/var"
+export datadir = "${prefix}/share"
+export infodir = "${datadir}/info"
+export mandir = "${datadir}/man"
+export docdir = "${datadir}/doc"
+export systemd_unitdir = "/lib/systemd"
+
+# Architecture dependent paths
+export bindir = "${exec_prefix}/bin"
+export sbindir = "${exec_prefix}/sbin"
+export libdir = "${exec_prefix}/${baselib}"
+export libexecdir = "${libdir}/${BPN}"
+export includedir = "${exec_prefix}/include"
+export oldincludedir = "${exec_prefix}/include"
+localedir = "${libdir}/locale"
+
+# Linkage between native/cross/nativesdk layouts
+base_bindir_native = "/bin"
+base_sbindir_native = "/sbin"
+sysconfdir_native = "/etc"
+prefix_native = "/usr"
+bindir_native = "${prefix_native}/bin"
+sbindir_native = "${prefix_native}/sbin"
+includedir_native = "${prefix_native}/include"
+libdir_native = "${prefix_native}/lib"
+libexecdir_native = "${libdir_native}/${BPN}"
+base_libdir_native = "/lib"
+datadir_native = "${prefix_native}/share"
+bindir_cross = "/bin"
+bindir_crossscripts = "${bindir}/crossscripts"
+prefix_nativesdk = "/usr"
+bindir_nativesdk = "${prefix_nativesdk}/bin"
+includedir_nativesdk = "${prefix_nativesdk}/include"
+libdir_nativesdk = "${prefix_nativesdk}/lib"
+base_libdir_nativesdk = "/lib"
+localstatedir_nativesdk = "/var"
+
+##################################################################
+# Architecture-dependent build variables.
+##################################################################
+
+BUILD_ARCH = "${@os.uname()[4]}"
+BUILD_OS = "${@os.uname()[0].lower()}"
+BUILD_VENDOR = ""
+BUILD_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
+BUILD_PREFIX = ""
+BUILD_CC_ARCH = ""
+BUILD_LD_ARCH = ""
+BUILD_AS_ARCH = ""
+BUILD_EXEEXT = ""
+
+HOST_ARCH = "${TARGET_ARCH}"
+HOST_OS = "${TARGET_OS}"
+HOST_VENDOR = "${TARGET_VENDOR}"
+HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
+HOST_PREFIX = "${TARGET_PREFIX}"
+HOST_CC_ARCH = "${TARGET_CC_ARCH}"
+HOST_LD_ARCH = "${TARGET_LD_ARCH}"
+HOST_AS_ARCH = "${TARGET_AS_ARCH}"
+HOST_EXEEXT = ""
+
+TARGET_ARCH = "${TUNE_ARCH}"
+TARGET_OS = "linux${LIBCEXTENSION}${ABIEXTENSION}"
+TARGET_VENDOR = "-oe"
+TARGET_SYS = "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + d.getVar('TARGET_OS', True), ''][d.getVar('TARGET_OS', True) == ('' or 'custom')]}"
+TARGET_PREFIX = "${TARGET_SYS}-"
+TARGET_CC_ARCH = "${TUNE_CCARGS}"
+TARGET_LD_ARCH = "${TUNE_LDARGS}"
+TARGET_AS_ARCH = "${TUNE_ASARGS}"
+
+SDK_ARCH = "${BUILD_ARCH}"
+SDK_OS = "${BUILD_OS}"
+SDK_VENDOR = "-oesdk"
+SDK_SYS = "${SDK_ARCH}${SDK_VENDOR}${@['-' + d.getVar('SDK_OS', True), ''][d.getVar('SDK_OS', True) == ('' or 'custom')]}"
+SDK_PREFIX = "${SDK_SYS}-"
+SDK_CC_ARCH = "${BUILD_CC_ARCH}"
+SDKPKGSUFFIX = "nativesdk"
+SDK_PACKAGE_ARCHS = "all any noarch ${SDK_ARCH}-${SDKPKGSUFFIX}"
+SDK_LD_ARCH = "${BUILD_LD_ARCH}"
+SDK_AS_ARCH = "${BUILD_AS_ARCH}"
+
+TUNE_PKGARCH ??= ""
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+MACHINE_ARCH = "${@[d.getVar('TUNE_PKGARCH', True), d.getVar('MACHINE', True)][bool(d.getVar('MACHINE', True))].replace('-', '_')}"
+PACKAGE_EXTRA_ARCHS ??= "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"
+PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
+
+MULTIMACH_TARGET_SYS = "${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+MULTIMACH_HOST_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
+
+##################################################################
+# Date/time variables.
+##################################################################
+
+DATE := "${@time.strftime('%Y%m%d',time.gmtime())}"
+TIME := "${@time.strftime('%H%M%S',time.gmtime())}"
+DATETIME = "${DATE}${TIME}"
+
+##################################################################
+# Package default variables.
+##################################################################
+
+PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[0] or 'defaultpkgname'}"
+
+# Ensure that -dev packages recommend the corresponding -dev packages of their
+# deps, and the same for -dbg.
+DEPCHAIN_PRE  = ""
+DEPCHAIN_POST = "-dev -dbg"
+
+##################################################################
+# General work and output directories for the build system.
+##################################################################
+
+TMPDIR ?= "${TOPDIR}/tmp"
+CACHE = "${TMPDIR}/cache"
+# The persistent cache should be shared by all builds
+PERSISTENT_DIR = "${TOPDIR}/cache"
+LOG_DIR = "${TMPDIR}/log"
+
+STAMPS_DIR ?= "${TMPDIR}/stamps"
+STAMP = "${STAMPS_DIR}/${PN}"
+STAMPCLEAN = "${STAMPS_DIR}/${PN}-*"
+BASE_WORKDIR ?= "${TMPDIR}/work"
+WORKDIR = "${BASE_WORKDIR}/${PN}"
+T = "${WORKDIR}/temp"
+S = "${WORKDIR}/${PN}"
+B = "${S}"
+
+STAGING_DIR = "${TMPDIR}/sysroots"
+
+STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
+STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${bindir_native}"
+STAGING_BINDIR_CROSS = "${STAGING_BINDIR}/crossscripts"
+STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
+STAGING_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${libdir_native}"
+STAGING_LIBEXECDIR_NATIVE = "${STAGING_DIR_NATIVE}${libexecdir_native}"
+STAGING_BASE_LIBDIR_NATIVE = "${STAGING_DIR_NATIVE}${base_libdir_native}"
+STAGING_SBINDIR_NATIVE = "${STAGING_DIR_NATIVE}${sbindir_native}"
+STAGING_INCDIR_NATIVE = "${STAGING_DIR_NATIVE}${includedir_native}"
+STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"
+STAGING_DATADIR_NATIVE = "${STAGING_DIR_NATIVE}${datadir_native}"
+
+STAGING_DIR_HOST = "${STAGING_DIR}/${MACHINE}"
+STAGING_BINDIR = "${STAGING_DIR_HOST}${bindir}"
+STAGING_LIBDIR = "${STAGING_DIR_HOST}${libdir}"
+STAGING_LIBEXECDIR = "${STAGING_DIR_HOST}${libexecdir}"
+STAGING_BASELIBDIR = "${STAGING_DIR_HOST}${base_libdir}"
+STAGING_INCDIR = "${STAGING_DIR_HOST}${includedir}"
+STAGING_DATADIR = "${STAGING_DIR_HOST}${datadir}"
+STAGING_EXECPREFIXDIR = "${STAGING_DIR_HOST}${exec_prefix}"
+STAGING_LOADER_DIR = "${STAGING_DIR_HOST}/loader"
+STAGING_FIRMWARE_DIR = "${STAGING_DIR_HOST}/firmware"
+
+STAGING_DIR_TARGET = "${STAGING_DIR}/${MACHINE}"
+STAGING_DIR_TCBOOTSTRAP = "${STAGING_DIR_TARGET}-tcbootstrap"
+
+STAGING_KERNEL_DIR = "${STAGING_DIR_HOST}/usr/src/kernel"
+
+# Setting DEPLOY_DIR outside of TMPDIR is helpful, when you are using
+# packaged staging and/or multimachine.
+DEPLOY_DIR ?= "${TMPDIR}/deploy"
+DEPLOY_DIR_TAR = "${DEPLOY_DIR}/tar"
+DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
+DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
+DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
+DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
+DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
+
+PKGDATA_DIR = "${STAGING_DIR_HOST}/pkgdata"
+
+##################################################################
+# SDK variables.
+##################################################################
+
+SDK_NAME_PREFIX ?= "oecore"
+SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
+SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
+SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
+
+##################################################################
+# Specific image creation and rootfs population info.
+##################################################################
+
+IMAGE_ROOTFS = "${WORKDIR}/rootfs"
+IMAGE_BASENAME = "${PN}"
+IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
+IMAGE_NAME[vardepsexclude] += "DATETIME"
+IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
+
+# This option allows for a percentage overage of the actual image size rather than a
+# fixed extra space, this is space needed for initial startup and basic operations.
+IMAGE_OVERHEAD_FACTOR ?= "1.3"
+# This option allows for adding additional space in K above and beyond what the 
+# IMAGE_OVERHEAD_FACTOR might add. This space is for additional packages, user data, ...
+# To set a fixed size then overriding IMAGE_ROOTFS_SIZE with the max size one wants
+# should do the trick
+IMAGE_ROOTFS_EXTRA_SPACE ?= "0"
+
+EXTRA_IMAGEDEPENDS = ""
+
+##################################################################
+# Toolchain info.
+##################################################################
+
+PATH_prepend = "${COREBASE}/scripts:${STAGING_BINDIR_TOOLCHAIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:"
+export PATH
+
+##################################################################
+# Build utility info.
+##################################################################
+
+PYTHON = "${@sys.executable}"
+export LC_ALL = "C"
+
+# Use pseudo as the fakeroot implementation
+#PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
+#PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}"
+#export PSEUDO_DISABLED = "1"
+#export PSEUDO_PREFIX = "${STAGING_DIR_NATIVE}${prefix_native}"
+#export PSEUDO_BINDIR = "${STAGING_DIR_NATIVE}${bindir_native}"
+#export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
+#FAKEROOTBASEENV = "PSEUDO_BINDIR=${STAGING_BINDIR_NATIVE} PSEUDO_LIBDIR=${STAGING_BINDIR_NATIVE}/../lib/pseudo/lib PSEUDO_PREFIX=${STAGING_BINDIR_NATIVE}/../../ PSEUDO_DISABLED=1"
+#FAKEROOTCMD = "${STAGING_BINDIR_NATIVE}/pseudo"
+#FAKEROOTENV = "PSEUDO_PREFIX=${STAGING_DIR_NATIVE}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_DISABLED=0"
+#FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
+#FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
+
+##################################################################
+# Miscellaneous utilities.
+##################################################################
+
+MKTEMPDIRCMD = "mktemp -d -q ${TMPBASE}"
+MKTEMPCMD = "mktemp -q ${TMPBASE}"
+
+# GNU patch tries to be intellgent about checking out read-only files from
+# a RCS, which freaks out those special folks with active Perforce clients
+# the following makes patch ignore RCS:
+
+
+###
+### Config file processing
+###
+
+# An empty distro leads to :: entries in OVERRIDES and FILEOVERRIDES which 
+# is a bad idea. Setting a dummy value is better than a ton of anonymous python.
+DISTRO ??= "nodistro"
+
+# Overrides are processed left to right, so the ones that are named later take precedence.
+# You generally want them to go from least to most specific.
+# 
+# This means that an envionment variable named '<foo>_arm' overrides an
+# environment variable '<foo>' (when ${TARGET_ARCH} is arm).
+# An environment variable '<foo>_qemuarm' overrides '<foo>' and overrides
+# '<foo>_arm' when ${MACHINE} is 'qemuarm'. 
+# If you use combination ie '<foo>_qemuarm_arm', then '<foo>_qemuarm_arm' will override 
+# '<foo>_qemuarm' and then '<foo>' will be overriden with that value from '<foo>_qemuarm'.
+# And finally '<foo>_forcevariable' overrides any standard variable, with the highest priority.
+#
+# This works for  functions as well, they are really just environment variables.
+# Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
+OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${CLASSOVERRIDE}:forcevariable"
+CLASSOVERRIDE ?= "class-target"
+
+
+##################################################################
+# Weak variables (usually to retain backwards compatibility)
+##################################################################
+
+IMAGE_FSTYPES ?= "tar.gz"
+INITRAMFS_FSTYPES ?= "cpio.gz"
+DEFAULT_TASK_PROVIDER ?= "packagegroup-base"
+MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
+
+# The size in Kbytes for the generated image if it is larger than
+# the required size (du -ks IMAGE_ROOTFS * IMAGE_OVERHEAD_FACTOR),
+# and no effect if less than it.
+IMAGE_ROOTFS_SIZE ?= "65536"
+
+# Forcefully set CACHE now so future changes to things like 
+# MACHINE don't change the path to the cache
+CACHE := "${CACHE}"
+
+# Default to setting automatically based on cpu count
+BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
+
+# Default to setting automatically based on cpu count
+PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
+
+##################################################################
+# Magic Cookie for SANITY CHECK
+##################################################################
+OES_BITBAKE_CONF = "1"
+
+##################################################################
+# Machine properties and packagegroup-base stuff
+##################################################################
+
+MACHINE_FEATURES ?= ""
+DISTRO_FEATURES ?= ""
+
+DISTRO_EXTRA_RDEPENDS ?= ""
+DISTRO_EXTRA_RRECOMMENDS ?= ""
+MACHINE_EXTRA_RDEPENDS ?= ""
+MACHINE_EXTRA_RRECOMMENDS ?= ""
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= ""
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
+
+EXTRA_IMAGE_FEATURES ??= ""
+IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
+
+DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit"
+MACHINE_FEATURES_BACKFILL = "rtc"
+
+COMBINED_FEATURES = "\
+    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "alsa", d)} \
+    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "bluetooth", d)} \
+    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "ext2", d)} \
+    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "vfat", d)} \
+    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "irda", d)} \
+    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "pcmcia", d)} \
+    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "pci", d)} \
+    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbgadget", d)} \
+    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbhost", d)} \
+    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "wifi", d)}"
+COMBINED_FEATURES[vardeps] += "DISTRO_FEATURES MACHINE_FEATURES"
+
+SERIAL_CONSOLE ??= ""
+SERIAL_CONSOLES ??= "${@d.getVar('SERIAL_CONSOLE', True).replace(' ', ';')}"
+
+NO_RECOMMENDATIONS ?= ""
+BAD_RECOMMENDATIONS ?= ""
+
+# Make sure MACHINE isn't exported
+# (breaks binutils at least)
+MACHINE[unexport] = "1"
+
+# Make sure TARGET_ARCH isn't exported
+# (breaks Makefiles using implicit rules, e.g. quilt, as GNU make has this 
+# in them, undocumented)
+TARGET_ARCH[unexport] = "1"
+
+# Make sure DISTRO isn't exported
+# (breaks sysvinit at least)
+DISTRO[unexport] = "1"
+
+# Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
+TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH', True).replace("_", "-")}"
+
+MULTILIB_VARIANTS ??= ""
+
diff --git a/meta/recipes-core/meta/imagebuilder-collab/build-rootfs b/meta/recipes-core/meta/imagebuilder-collab/build-rootfs
new file mode 100755
index 0000000..8921fb9
--- /dev/null
+++ b/meta/recipes-core/meta/imagebuilder-collab/build-rootfs
@@ -0,0 +1,106 @@
+#!/usr/bin/env python
+
+import os
+import sys
+import warnings
+sys.path.insert(0, os.path.join(os.path.dirname(os.path.dirname(sys.argv[0])), 'lib'))
+from bb import fetch2
+import logging
+import bb
+import select
+import errno
+import signal
+
+import bb.tinfoil
+
+# Enable verbose/debugging for now
+bb.msg.init_msgconfig(True,3, [])
+
+tinfoil = bb.tinfoil.Tinfoil()
+tinfoil.prepare(config_only = True)
+
+logger = logging.getLogger("BitBake")
+
+try:
+    import cPickle as pickle
+except ImportError:
+    import pickle
+    bb.msg.note(1, bb.msg.domain.Cache, "Importing cPickle failed. Falling back to a very slow implementation.")
+
+def fork_off_task(data, workerdata, fn, taskname, appends, quieterrors=False):
+    # We need to setup the environment BEFORE the fork, since
+    # a fork() or exec*() activates PSEUDO...
+
+    fakeenv = {}
+    umask = None
+
+   # taskdep = workerdata["taskdeps"][fn]
+   # if 'umask' in taskdep and taskname in taskdep['umask']:
+   #     # umask might come in as a number or text string..
+   #     try:
+   #          umask = int(taskdep['umask'][taskname],8)
+   #     except TypeError:
+   #          umask = taskdep['umask'][taskname]
+
+    # We can't use the fakeroot environment in a dry run as it possibly hasn't been built
+  #  if 'fakeroot' in taskdep and taskname in taskdep['fakeroot']:
+  #      envvars = (workerdata["fakerootenv"][fn] or "").split()
+  #      for key, value in (var.split('=') for var in envvars):
+  #          envbackup[key] = os.#environ.get(key)
+  #          os.environ[key] = value
+  #          fakeenv[key] = value
+
+  #      fakedirs = (workerdata["fakerootdirs"][fn] or "").split()
+  #      for p in fakedirs:
+  #          bb.utils.mkdirhier(p)
+  #      logger.debug(2, 'Running %s:%s under fakeroot, fakedirs: %s' %
+  #                      (fn, taskname, ', '.join(fakedirs)))
+  #  else:
+  #      envvars = (workerdata["fakerootnoenv"][fn] or "").split()
+  #      for key, value in (var.split('=') for var in envvars):
+  #          envbackup[key] = os.environ.get(key)
+  #          os.environ[key] = value
+  #          fakeenv[key] = value
+
+    if umask:
+        os.umask(umask)
+
+    data.setVar("BB_WORKERCONTEXT", "1")
+    ret = 0
+    try:
+        the_data = bb.cache.Cache.loadDataFull(fn, appends, data)
+
+        # exported_vars() returns a generator which *cannot* be passed to os.environ.update() 
+        # successfully. We also need to unset anything from the environment which shouldn't be there 
+        exports = bb.data.exported_vars(the_data)
+        bb.utils.empty_environment()
+        for e, v in exports:
+            os.environ[e] = v
+        for e in fakeenv:
+            os.environ[e] = fakeenv[e]
+            the_data.setVar(e, fakeenv[e])
+            the_data.setVarFlag(e, 'export', "1")
+
+        if quieterrors:
+            the_data.setVarFlag(taskname, "quieterrors", "1")
+
+    except Exception as exc:
+        if not quieterrors:
+            logger.critical(str(exc))
+    try:
+        ret = bb.build.exec_task(fn, taskname, the_data, False)
+        sys.exit(ret)
+    except:
+        sys.exit(1)
+    return
+
+tinfoil.config_data.setVar("IMAGE_PKGTYPE", "rpm")
+tinfoil.config_data.setVar("DEPLOY_DIR_IPK", "/media/build1/poky/build1/tmp/deploy/ipk")
+tinfoil.config_data.setVar("DEPLOY_DIR_RPM", "/media/build1/poky/build1/tmp/deploy/rpm")
+tinfoil.config_data.setVar("PACKAGE_ARCHS", "all any noarch x86 i586 qemux86")
+tinfoil.config_data.setVar("ALL_MULTILIB_PACKAGE_ARCHS", "all any noarch x86 i586 qemux86")
+tinfoil.config_data.setVar("COREBASE", "/media/build1/poky/")
+tinfoil.config_data.setVar("BUILDNAME", "dummyname")
+
+fork_off_task(tinfoil.config_data, None, "/media/build1/poky/test-ic/meta/core-image-minimal.bb", "do_rootfs", None)
+
diff --git a/meta/recipes-core/meta/imagebuilder-collab_0.1.bb b/meta/recipes-core/meta/imagebuilder-collab_0.1.bb
new file mode 100644
index 0000000..876b1e2
--- /dev/null
+++ b/meta/recipes-core/meta/imagebuilder-collab_0.1.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "A standalone image construction tool"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
+                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "file://build-rootfs \
+           file://base.bbclass \
+           file://README \
+           file://bitbake.conf"
+
+do_install () {
+	cp -r ${COREBASE}/bitbake ${D}/
+	rm ${D}/bitbake/toaster*
+	rm -rf ${D}/bitbake/lib/toaster
+	cp ${WORKDIR}/build-rootfs ${D}/bitbake/bin
+	mkdir -p ${D}/meta/classes
+        for i in core-image image image_types image_types_uboot populate_sdk populate_sdk_base rootfs_ipk rootfs_deb rootfs_rpm utils; do
+		cp ${COREBASE}/meta/classes/$i.bbclass ${D}/meta/classes
+	done
+	cp ${WORKDIR}/base.bbclass ${D}/meta/classes
+	sed -i -e 's/runtime_mapping_rename/#runtime_mapping_rename/g' ${D}/meta/classes/image.bbclass
+	sed -i -e 's/IMAGE_CLASSES +=/IMAGE_CLASSES ?=/' ${D}/meta/classes/image.bbclass
+	for i in meta toolchain-scripts gzipnative siteinfo; do
+		touch ${D}/meta/classes/$i.bbclass
+	done
+	mkdir -p ${D}/meta/lib/oe
+	for i in __init__ data image maketype manifest packagegroup package_manager package path rootfs sdk types utils; do
+		cp ${COREBASE}/meta/lib/oe/$i.py ${D}/meta/lib/oe
+	done
+	mkdir -p ${D}/meta/conf
+	cp ${WORKDIR}/bitbake.conf ${D}/meta/conf
+	cp ${WORKDIR}/README ${D}
+	mkdir -p ${D}/meta/files
+	cp ${COREBASE}/meta/files/toolchain-shar-template* ${D}/meta/files
+	cp ${COREBASE}/meta/recipes-core/images/core-image-minimal.bb ${D}/meta
+	
+	cd ${D}
+	tar -czf ${DEPLOY_DIR}/imagebuilder-collab.tgz .
+}
+
+deltask package



