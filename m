Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id C1B7D6011A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 16:48:50 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n129so17370183wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 09:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FOH+6aWOSpm/lZOc/INReOSevshcLprbS4IcVvBB8eY=;
	b=hRuOM/7DN5gqxIY+uyCg6+f3Ds5Gx/JvU6qw+aoIJWI6SQS+ZEDfWt/YoWNjQM5y/q
	VSIrF50/SPjxDVMaRjHCdUUezURtuOldYwE0i9dSWrRvSv9O0gd/cTOC+Q8a1FOKih+6
	OyCuQ3sC73sQfQfdIQnrwe6uvB/MC9P80Xv21lzt/7Z1wVAV3pv8mn273gVsf1Bs4639
	uMI1fr1gJ7dWxmFdVp0a1qPIt2KxgbEHRlHYNwICtd0SdeRb1UZEqlD6uOGZElOgS5cF
	94G8F9JzN/thuVANClbmH3Qeo2c32qpGKTpDZpdOspNjVaMn3W4WwwVVFLscGTi80974
	4kwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FOH+6aWOSpm/lZOc/INReOSevshcLprbS4IcVvBB8eY=;
	b=gLKuwBc1JRjdZCnr/NOrMfdeSv5Dy8iBe0Qefw0px6bb2NxcRoNGPZr9tH7c2MnUOP
	HPT2YVoLfB9RYNoaHYSTMUX4iqx+WC5Y7osM34kxO2e0UuUCHvGdEPtCpyzaxnlr5ZiW
	KIhkk7h5G7xTtRat6CV14VZazHv5dSt3rLKighEW70QJQYV+l6nS72Hk79w9VeWks5PU
	HEcHeXbhwdbzZG0pnvybiT4PeqyjHK/LkMF3TlPa5IyfJMEPGzdp3uTlOuWv3+T6Fkt9
	S0y+CC5iIKD1Q+OptRixlkfPO73eNd2IrOK7RM2EUg617eX3EmhDXUYU86z3RseN/Nsj
	DZcA==
X-Gm-Message-State: ALyK8tLhwqM3/NU8CO+aGJkLFohteXhdqOWdTKPmqWrL+lsjLBWxCtvuKWVFMs7R/dvQWQ==
X-Received: by 10.194.10.69 with SMTP id g5mr4892141wjb.7.1464194930403;
	Wed, 25 May 2016 09:48:50 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id c7sm9735561wji.38.2016.05.25.09.48.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 May 2016 09:48:48 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2016 09:49:02 -0700
Message-Id: <1464194942-28189-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [RFC PATCH] Switch most global exports to task level
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
X-List-Received-Date: Wed, 25 May 2016 16:48:52 -0000

From: Christopher Larson <chris_larson@mentor.com>

The majority of our global exports are only needed for the build tasks, so
switch them to those tasks (configure/compile/install, but not
populate_sysroot or package).

Kept global exports: PATH, PSEUDO_DISABLED, LC_ALL, CCACHE_DIR, CCACHE_DISABLE

The variables which are exported by default are listed in logically grouped
variables, to make it easy to add or remove them from task exports:

- PKG_CONFIG_EXPORTS: PKG_CONFIG_DIR, etc
- BUILD_EXPORTS: BUILD_CC, etc
- TARGET_EXPORTS: TARGET_CC, etc
- TARGET_PATH_EXPORTS: prefix, bindir, etc

Intermediate variables are added as well, to ease usage and avoid the need to
mess with the flags directly for the common cases:

- CONFIGURE_EXPORTS
- COMPILE_EXPORTS
- INSTALL_EXPORTS
- POPULATE_SYSROOT_EXPORTS
- PACKAGE_EXPORTS

Future patches will pare down the exports from here. Specifically removing the
default export of BUILD_EXPORTS, TARGET_EXPORTS, and TARGET_PATH_EXPORTS, none
of which are consistently used by the buildsystems we're calling into.

This is placed into conf/task-exports.conf, to avoid cluttering up
bitbake.conf any further.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/bitbake.conf      | 143 ++++++++++++++++++++++----------------------
 meta/conf/task-exports.conf |  54 +++++++++++++++++
 2 files changed, 126 insertions(+), 71 deletions(-)
 create mode 100644 meta/conf/task-exports.conf

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index acef30b..f093cbf 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -13,37 +13,37 @@ BASELIB = "lib"
 BASELIB_powerpc64 = "lib64"
 
 # Path prefixes
-export base_prefix = ""
-export prefix = "/usr"
-export exec_prefix = "/usr"
+base_prefix = ""
+prefix = "/usr"
+exec_prefix = "/usr"
 
 # Base paths
-export base_bindir = "${base_prefix}/bin"
-export base_sbindir = "${base_prefix}/sbin"
-export base_libdir = "${base_prefix}/${baselib}"
-export nonarch_base_libdir = "${base_prefix}/lib"
+base_bindir = "${base_prefix}/bin"
+base_sbindir = "${base_prefix}/sbin"
+base_libdir = "${base_prefix}/${baselib}"
+nonarch_base_libdir = "${base_prefix}/lib"
 
 # Architecture independent paths
-export sysconfdir = "${base_prefix}/etc"
-export servicedir = "${base_prefix}/srv"
-export sharedstatedir = "${base_prefix}/com"
-export localstatedir = "${base_prefix}/var"
-export datadir = "${prefix}/share"
-export infodir = "${datadir}/info"
-export mandir = "${datadir}/man"
-export docdir = "${datadir}/doc"
-export systemd_unitdir = "${nonarch_base_libdir}/systemd"
-export systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"
-export nonarch_libdir = "${exec_prefix}/lib"
-export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
+sysconfdir = "${base_prefix}/etc"
+servicedir = "${base_prefix}/srv"
+sharedstatedir = "${base_prefix}/com"
+localstatedir = "${base_prefix}/var"
+datadir = "${prefix}/share"
+infodir = "${datadir}/info"
+mandir = "${datadir}/man"
+docdir = "${datadir}/doc"
+systemd_unitdir = "${nonarch_base_libdir}/systemd"
+systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"
+nonarch_libdir = "${exec_prefix}/lib"
+systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
 
 # Architecture dependent paths
-export bindir = "${exec_prefix}/bin"
-export sbindir = "${exec_prefix}/sbin"
-export libdir = "${exec_prefix}/${baselib}"
-export libexecdir = "${exec_prefix}/libexec"
-export includedir = "${exec_prefix}/include"
-export oldincludedir = "${exec_prefix}/include"
+bindir = "${exec_prefix}/bin"
+sbindir = "${exec_prefix}/sbin"
+libdir = "${exec_prefix}/${baselib}"
+libexecdir = "${exec_prefix}/libexec"
+includedir = "${exec_prefix}/include"
+oldincludedir = "${exec_prefix}/include"
 localedir = "${libdir}/locale"
 
 # Linkage between native/cross/nativesdk layouts
@@ -457,35 +457,35 @@ export CCACHE_DIR ??= "${@os.getenv('HOME')}"
 
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
-export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export FC = "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
-export CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
-export LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
-export CCLD = "${CC}"
-export AR = "${HOST_PREFIX}ar"
-export AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
-export RANLIB = "${HOST_PREFIX}ranlib"
-export STRIP = "${HOST_PREFIX}strip"
-export OBJCOPY = "${HOST_PREFIX}objcopy"
-export OBJDUMP = "${HOST_PREFIX}objdump"
-export STRINGS = "${HOST_PREFIX}strings"
-export NM = "${HOST_PREFIX}nm"
+CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+CXX = "${CCACHE}${HOST_PREFIX}g++ ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+FC = "${CCACHE}${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+CPP = "${HOST_PREFIX}gcc -E${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
+LD = "${HOST_PREFIX}ld${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}"
+CCLD = "${CC}"
+AR = "${HOST_PREFIX}ar"
+AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
+RANLIB = "${HOST_PREFIX}ranlib"
+STRIP = "${HOST_PREFIX}strip"
+OBJCOPY = "${HOST_PREFIX}objcopy"
+OBJDUMP = "${HOST_PREFIX}objdump"
+STRINGS = "${HOST_PREFIX}strings"
+NM = "${HOST_PREFIX}nm"
 PYTHON = "${@sys.executable}"
 
-export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
-export BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
-export BUILD_FC = "${CCACHE}${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
-export BUILD_CPP = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH} -E"
-export BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
-export BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
-export BUILD_AR = "${BUILD_PREFIX}ar"
-export BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
-export BUILD_RANLIB = "${BUILD_PREFIX}ranlib"
-export BUILD_STRIP = "${BUILD_PREFIX}strip"
-export BUILD_NM = "${BUILD_PREFIX}nm"
-
-export MAKE = "make"
+BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
+BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++ ${BUILD_CC_ARCH}"
+BUILD_FC = "${CCACHE}${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH}"
+BUILD_CPP = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH} -E"
+BUILD_LD = "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
+BUILD_CCLD = "${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
+BUILD_AR = "${BUILD_PREFIX}ar"
+BUILD_AS = "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
+BUILD_RANLIB = "${BUILD_PREFIX}ranlib"
+BUILD_STRIP = "${BUILD_PREFIX}strip"
+BUILD_NM = "${BUILD_PREFIX}nm"
+
+MAKE = "make"
 EXTRA_OEMAKE = ""
 EXTRA_OECONF = ""
 export LC_ALL = "en_US.UTF-8"
@@ -500,21 +500,21 @@ PATCHRESOLVE = "noop"
 # Build flags and options.
 ##################################################################
 
-export BUILD_CPPFLAGS = "-isystem${STAGING_INCDIR_NATIVE}"
+BUILD_CPPFLAGS = "-isystem${STAGING_INCDIR_NATIVE}"
 BUILDSDK_CPPFLAGS = ""
-export CPPFLAGS = "${TARGET_CPPFLAGS}"
-export TARGET_CPPFLAGS = ""
+CPPFLAGS = "${TARGET_CPPFLAGS}"
+TARGET_CPPFLAGS = ""
 
-export BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
+BUILD_CFLAGS = "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
 BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION}"
-export CFLAGS = "${TARGET_CFLAGS}"
-export TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
+CFLAGS = "${TARGET_CFLAGS}"
+TARGET_CFLAGS = "${TARGET_CPPFLAGS} ${SELECTED_OPTIMIZATION}"
 
-export BUILD_CXXFLAGS = "${BUILD_CFLAGS}"
-export CXXFLAGS = "${TARGET_CXXFLAGS}"
-export TARGET_CXXFLAGS = "${TARGET_CFLAGS}"
+BUILD_CXXFLAGS = "${BUILD_CFLAGS}"
+CXXFLAGS = "${TARGET_CXXFLAGS}"
+TARGET_CXXFLAGS = "${TARGET_CFLAGS}"
 
-export BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
+BUILD_LDFLAGS = "-L${STAGING_LIBDIR_NATIVE} \
                         -L${STAGING_BASE_LIBDIR_NATIVE} \
                         -Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} \
                         -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} \
@@ -539,8 +539,8 @@ LINKER_HASH_STYLE_mips64n32 = "sysv"
 LINKER_HASH_STYLE_mips64eln32 = "sysv"
 TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_STYLE', True) != 'gnu']}"
 
-export LDFLAGS = "${TARGET_LDFLAGS}"
-export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
+LDFLAGS = "${TARGET_LDFLAGS}"
+TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
 #export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} \
 #                         -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} \
 #                         -Wl,-O1"
@@ -655,13 +655,13 @@ BUILDCFG_NEEDEDVARS[type] = "list"
 
 # Other
 
-export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${libdir}/pkgconfig"
-export PKG_CONFIG_PATH = "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"
-export PKG_CONFIG_LIBDIR = "${PKG_CONFIG_DIR}"
-export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
-export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
-export PKG_CONFIG_SYSTEM_LIBRARY_PATH = "${base_libdir}:${libdir}"
-export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
+PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${libdir}/pkgconfig"
+PKG_CONFIG_PATH = "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig"
+PKG_CONFIG_LIBDIR = "${PKG_CONFIG_DIR}"
+PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
+PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
+PKG_CONFIG_SYSTEM_LIBRARY_PATH = "${base_libdir}:${libdir}"
+PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 
 ###
 ### Config file processing
@@ -698,6 +698,7 @@ FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDE
 ##################################################################
 
 require conf/abi_version.conf
+require conf/task-exports.conf
 include conf/site.conf
 include conf/auto.conf
 include conf/local.conf
diff --git a/meta/conf/task-exports.conf b/meta/conf/task-exports.conf
new file mode 100644
index 0000000..fd7faf7
--- /dev/null
+++ b/meta/conf/task-exports.conf
@@ -0,0 +1,54 @@
+# Default variables to export at the task level for our builds
+
+BASE_TASK_EXPORTS = "\
+    AR AS CC CCLD CFLAGS CPP CPPFLAGS CXX CXXFLAGS FC LD LDFLAGS \
+    MAKE NM OBJCOPY OBJDUMP RANLIB STRINGS STRIP \
+    \
+    ${PKG_CONFIG_EXPORTS} \
+    \
+    ${BUILD_EXPORTS} \
+    ${TARGET_EXPORTS} \
+    ${TARGET_PATH_EXPORTS} \
+"
+PKG_CONFIG_EXPORTS = "\
+    PKG_CONFIG_DIR \
+    PKG_CONFIG_DISABLE_UNINSTALLED \
+    PKG_CONFIG_LIBDIR \
+    PKG_CONFIG_PATH \
+    PKG_CONFIG_SYSROOT_DIR \
+    PKG_CONFIG_SYSTEM_INCLUDE_PATH \
+    PKG_CONFIG_SYSTEM_LIBRARY_PATH \
+"
+BUILD_EXPORTS = "\
+    BUILD_AR BUILD_AS BUILD_CC BUILD_CCLD BUILD_CFLAGS BUILD_CPP \
+    BUILD_CPPFLAGS BUILD_CXX BUILD_CXXFLAGS BUILD_FC BUILD_LD BUILD_LDFLAGS \
+    BUILD_NM BUILD_RANLIB BUILD_STRIP \
+"
+TARGET_EXPORTS = "TARGET_CFLAGS TARGET_CPPFLAGS TARGET_CXXFLAGS TARGET_LDFLAGS"
+TARGET_PATH_EXPORTS = "\
+    base_bindir base_libdir base_prefix base_sbindir bindir datadir \
+    docdir exec_prefix includedir infodir libdir libexecdir localstatedir \
+    mandir nonarch_base_libdir nonarch_libdir oldincludedir prefix \
+    sbindir servicedir sharedstatedir sysconfdir systemd_system_unitdir \
+    systemd_unitdir systemd_user_unitdir \
+"
+
+# do_siteconfig_gencache runs ./configure
+POPULATE_SYSROOT_EXPORTS .= "${@' ${CONFIGURE_EXPORTS}' if bb.data.inherits_class('siteconfig', d) and os.path.isdir('${FILE_DIRNAME}/site_config') else ''}"
+
+# add_xorg_abi_depends needs to run pkg-config
+PACKAGE_EXPORTS .= "${@'${PKG_CONFIG_EXPORTS}' if 'add_xorg_abi_depends' in '${PACKAGEFUNCS}'.split() else ''}"
+
+CONFIGURE_EXPORTS = "${BASE_TASK_EXPORTS}"
+COMPILE_EXPORTS = "${BASE_TASK_EXPORTS}"
+INSTALL_EXPORTS = "${BASE_TASK_EXPORTS}"
+POPULATE_SYSROOT_EXPORTS = ""
+PACKAGE_EXPORTS = ""
+
+do_configure[exports] += "${CONFIGURE_EXPORTS}"
+do_compile[exports] += "${COMPILE_EXPORTS}"
+do_compile_ptest_base[exports] += "${COMPILE_EXPORTS}"
+do_install[exports] += "${INSTALL_EXPORTS}"
+do_install_ptest_base[exports] += "${INSTALL_EXPORTS}"
+do_populate_sysroot[exports] += "${POPULATE_SYSROOT_EXPORTS}"
+do_package[exports] += "${PACKAGE_EXPORTS}"
-- 
2.8.0


