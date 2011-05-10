Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QJnX6-0005qq-Ku
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:03:29 +0200
Received: by rex (Postfix, from userid 1000)
	id 81A3820C5F; Tue, 10 May 2011 15:00:40 +0100 (BST)
Message-Id: <0a007e99bacaaf9afaf3641635724fdb78974770.1305035617.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
Old-Date: Tue, 10 May 2011 14:04:57 +0100
Date: Tue, 10 May 2011 15:00:40 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/6] distro: Add defaultsetup.conf, a set of default configuration providing sane overrridable default for commonly used options
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
X-List-Received-Date: Tue, 10 May 2011 14:03:29 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The intent is to allow distros to share common core config but still allow
customisations. The core should work with no distro set but users
can still customise in any ways needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf                             |    4 +-
 meta/conf/distro/defaultsetup.conf                 |   23 ++++++++++
 .../include/{poky-eglibc.inc => tclibc-eglibc.inc} |    6 ++-
 .../include/{poky-glibc.inc => tclibc-glibc.inc}   |    6 ++-
 .../include/{poky-uclibc.inc => tclibc-uclibc.inc} |    4 ++
 .../{poky-default.inc => tcmode-default.inc}       |   13 +++---
 meta/conf/distro/poky.conf                         |   46 +++++--------------
 7 files changed, 54 insertions(+), 48 deletions(-)
 create mode 100644 meta/conf/distro/defaultsetup.conf
 rename meta/conf/distro/include/{poky-eglibc.inc => tclibc-eglibc.inc} (92%)
 rename meta/conf/distro/include/{poky-glibc.inc => tclibc-glibc.inc} (91%)
 rename meta/conf/distro/include/{poky-uclibc.inc => tclibc-uclibc.inc} (86%)
 rename meta/conf/distro/include/{poky-default.inc => tcmode-default.inc} (85%)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d843e70..ce74a9b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -627,9 +627,7 @@ include conf/build/${BUILD_SYS}.conf
 include conf/target/${TARGET_SYS}.conf
 include conf/machine/${MACHINE}.conf
 include conf/machine-sdk/${SDKMACHINE}.conf
-include conf/distro/include/default-providers.inc
-include conf/distro/include/default-versions.inc
-include conf/distro/include/world-broken.inc
+include conf/distro/defaultsetup.conf
 include conf/distro/${DISTRO}.conf
 include conf/documentation.conf
 require conf/sanity.conf
diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
new file mode 100644
index 0000000..af5ef7b
--- /dev/null
+++ b/meta/conf/distro/defaultsetup.conf
@@ -0,0 +1,23 @@
+include conf/distro/include/default-providers.inc
+include conf/distro/include/default-versions.inc
+include conf/distro/include/world-broken.inc
+
+TARGET_VENDOR ?= "-oecore"
+
+TARGET_FPU_arm ?= "soft"
+TARGET_FPU_armeb ?= "soft"
+
+TCMODE ?= "default"
+require conf/distro/include/tcmode-${TCMODE}.inc
+
+TCLIBC ?= "eglibc"
+require conf/distro/include/tclibc-${TCLIBC}.inc
+
+CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}${@['', '/' + str(bb.data.getVar('SDKMACHINE', d, 1))][bool(bb.data.getVar('SDKMACHINE', d, 1))]}"
+
+USER_CLASSES ?= ""
+PACKAGE_CLASSES ?= "package_ipk"
+INHERIT_INSANE ?= "insane"
+INHERIT_DISTRO ?= "debian devshell sstate license"
+INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_INSANE} ${INHERIT_DISTRO}"
+
diff --git a/meta/conf/distro/include/poky-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
similarity index 92%
rename from meta/conf/distro/include/poky-eglibc.inc
rename to meta/conf/distro/include/tclibc-eglibc.inc
index 3d2c362..16625e3 100644
--- a/meta/conf/distro/include/poky-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -2,6 +2,10 @@
 # eglibc specific configuration
 #
 
+TARGET_OS = "linux"
+TARGET_OS_arm = "linux-gnueabi"
+TARGET_OS_armeb = "linux-gnueabi"
+
 # Add glibc overrides to the overrides for eglibc.
 OVERRIDES .= ":libc-glibc"
 
@@ -17,8 +21,6 @@ PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?= "eglibc-nativesdk"
 PREFERRED_PROVIDER_virtual/libc-nativesdk ?= "eglibc-nativesdk"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-initial-nativesdk ?= "eglibc-initial-nativesdk"
 
-TARGET_OS = "${GLIBCTARGETOS}"
-
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
 LIBC_DEPENDENCIES = "libsegfault \
diff --git a/meta/conf/distro/include/poky-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
similarity index 91%
rename from meta/conf/distro/include/poky-glibc.inc
rename to meta/conf/distro/include/tclibc-glibc.inc
index 4be7122..79da986 100644
--- a/meta/conf/distro/include/poky-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -2,6 +2,10 @@
 # glibc specific configuration
 #
 
+TARGET_OS = "linux"
+TARGET_OS_arm = "linux-gnueabi"
+TARGET_OS_armeb = "linux-gnueabi"
+
 # Add glibc to the overrides.
 OVERRIDES =. "libc-glibc:"
 
@@ -16,8 +20,6 @@ PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?= "glibc-nativesdk"
 PREFERRED_PROVIDER_virtual/libc-nativesdk ?= "glibc-nativesdk"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-initial-nativesdk ?= "glibc-initial-nativesdk"
 
-TARGET_OS = "${GLIBCTARGETOS}"
-
 CXXFLAGS += "-fvisibility-inlines-hidden"
 
 LIBC_DEPENDENCIES = "\
diff --git a/meta/conf/distro/include/poky-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
similarity index 86%
rename from meta/conf/distro/include/poky-uclibc.inc
rename to meta/conf/distro/include/tclibc-uclibc.inc
index def9dfe..18748fa 100644
--- a/meta/conf/distro/include/poky-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -2,6 +2,10 @@
 # uclibc specific configuration
 #
 
+TARGET_OS = "linux-uclibc"
+TARGET_OS_arm = "linux-uclibceabi"
+TARGET_OS_armeb = "linux-uclibceabi"
+
 # Add uclibc overrides to the overrides.
 OVERRIDES =. "libc-uclibc:"
 
diff --git a/meta/conf/distro/include/poky-default.inc b/meta/conf/distro/include/tcmode-default.inc
similarity index 85%
rename from meta/conf/distro/include/poky-default.inc
rename to meta/conf/distro/include/tcmode-default.inc
index 91985b3..909d802 100644
--- a/meta/conf/distro/include/poky-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -1,18 +1,16 @@
 #
-# Poky's default configuration
+# Default toolchain configuration
 #
 
-TARGET_VENDOR = "-poky"
-
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "${POKYLIBC}"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "${TCLIBC}"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "binutils-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "gcc-cross-initial"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate = "gcc-cross-intermediate"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "gcc-cross"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs = "gcc-runtime"
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${POKYLIBC}-initial"
-PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-for-gcc-nativesdk ?= "${POKYLIBC}-nativesdk"
+PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
+PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-for-gcc-nativesdk ?= "${TCLIBC}-nativesdk"
 
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
@@ -50,6 +48,7 @@ PREFERRED_VERSION_elfutils ?= "0.148"
 # some packages using an archive format incompatible with earlier gzip
 PREFERRED_VERSION_gzip-native ?= "1.4"
 
+# Setup suitable toolchain flags
 require conf/distro/include/as-needed.inc
-
+TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH', d, True) in ['mips', 'mipsel', 'mips64', 'mips64el']]}"
 
diff --git a/meta/conf/distro/poky.conf b/meta/conf/distro/poky.conf
index 2e9d327..f13a67f 100644
--- a/meta/conf/distro/poky.conf
+++ b/meta/conf/distro/poky.conf
@@ -1,56 +1,29 @@
-
 DISTRO = "poky"
-DISTRO_NAME = "Yocto (Built by Poky 4.0)"
-DISTRO_VERSION = "0.9+snapshot-${DATE}"
+DISTRO_NAME = "Yocto (Built by Poky 5.0)"
+DISTRO_VERSION = "1.0+snapshot-${DATE}"
+SDK_VENDOR = "-pokysdk"
 SDK_VERSION := "${@'${DISTRO_VERSION}'.replace('snapshot-${DATE}','snapshot')}"
 
 MAINTAINER = "Poky <poky@yoctoproject.org>"
 
-USER_CLASSES ?= ""
-
-PACKAGE_CLASSES ?= "package_ipk"
-INHERIT_INSANE ?= "insane"
-INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} debian devshell ${INHERIT_INSANE} sstate license"
-# For some reason, this doesn't work
-# TARGET_OS ?= "linux"
-# TARGET_VENDOR ?= "-poky"
-# Set by POKYMODE instead
-TARGET_OS = "linux"
-TARGET_FPU_arm ?= "soft"
-TARGET_FPU_armeb ?= "soft"
-TARGET_FPU_nokia800 = "hard"
-
-TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH', d, True) in ['mips', 'mipsel', 'mips64', 'mips64el']]}"
+TARGET_VENDOR = "-poky"
 
 QA_LOGFILE = "${TMPDIR}/qa.log"
 
 IMAGE_ROOTFS_SIZE_ext2 ?= "131072"
 
+LOCALCONF_VERSION = "1"
+
 OEINCLUDELOGS = "yes"
 KERNEL_CONSOLE = "ttyS0"
 
-# Default to TARGETOS values for EABI on arm
-GLIBCTARGETOS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb']]}"
-UCLIBCTARGETOS = "linux${@['-uclibc','-uclibceabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb']]}"
-
-POKYMODE ?= "default"
-require conf/distro/include/poky-${POKYMODE}.inc
-
-POKYLIBC ?= "eglibc"
-require conf/distro/include/poky-${POKYLIBC}.inc
-
-SDK_NAME = "${DISTRO}-${POKYLIBC}-${SDK_ARCH}-${TARGET_ARCH}"
+SDK_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${TARGET_ARCH}"
 SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"
 
-CACHE = "${TMPDIR}/cache/${POKYMODE}-${POKYLIBC}${@['', '/' + str(bb.data.getVar('MACHINE', d, 1))][bool(bb.data.getVar('MACHINE', d, 1))]}${@['', '/' + str(bb.data.getVar('SDKMACHINE', d, 1))][bool(bb.data.getVar('SDKMACHINE', d, 1))]}"
-
-
 require conf/distro/include/preferred-xorg-versions.inc
 
 PCMCIA_MANAGER ?= "pcmciautils"
 
-#IMAGE_LINGUAS ?= "en-gb en-us"
-#LIMIT_BUILT_LOCALES ?= "en_GB en_US"
 IMAGE_LINGUAS ?= "en-us en-gb"
 LIMIT_BUILT_LOCALES ?= "POSIX en_US en_GB"
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
@@ -62,6 +35,8 @@ POKY_EXTRA_RDEPENDS = "task-core-boot"
 POKY_EXTRA_RDEPENDS_qemuarm = "qemu-config"
 POKY_EXTRA_RDEPENDS_qemuarmv6 = "qemu-config"
 POKY_EXTRA_RDEPENDS_qemuarmv7 = "qemu-config"
+POKY_EXTRA_RDEPENDS_qemumips = "qemu-config"
+POKY_EXTRA_RDEPENDS_qemuppc = "qemu-config"
 POKY_EXTRA_RDEPENDS_qemux86 = "qemu-config"
 POKY_EXTRA_RDEPENDS_qemux86-64 = "qemu-config"
 
@@ -93,6 +68,9 @@ COMMON_LICENSE_DIR ??= "${COREBASE}/meta/files/common-licenses"
 
 BB_GENERATE_MIRROR_TARBALLS ??= "0"
 
+QEMU_TARGETS ?= "arm i386 mips mipsel ppc x86_64"
+# Other QEMU_TARGETS "mips64 mips64el sh4"
+
 PREMIRRORS ?= "\
 bzr://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
 cvs://.*/.*   http://autobuilder.yoctoproject.org/sources/ \n \
-- 
1.7.4.1



