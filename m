Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RJ8Gf-0000bQ-Ik
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 20:32:01 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9QIPtdq024379;
	Wed, 26 Oct 2011 11:25:57 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 26 Oct 2011 14:25:42 -0400
Message-Id: <0ec24ded3f71c54e544d953de65d142717f48022.1319652972.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1319652972.git.bruce.ashfield@windriver.com>
References: <cover.1319652972.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1319652972.git.bruce.ashfield@windriver.com>
References: <cover.1319652972.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-libc-headers: provide 3.0.x and 3.1 headers
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
X-List-Received-Date: Wed, 26 Oct 2011 18:32:02 -0000

This changes makes two different 3.x headers available to the
toolchain. The latest 3.0.x and 3.1 tarballs. Compatibility is
maintained with older 2.6 headers by creating a new variable
that changes the SRC_URI based on the major version number of
the kernel.

Tested with 2.6.37.2, 3.0.8 and 3.1 builds and boots.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |   15 +++++-
 .../linux-libc-headers/linux-libc-headers_3.0.8.bb |   53 ++++++++++++++++++++
 .../linux-libc-headers/linux-libc-headers_3.1.bb   |   53 ++++++++++++++++++++
 4 files changed, 120 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 2bf1beb..ed722be 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "4.6%"
 BINUVERSION ?= "2.21.1a"
 EGLIBCVERSION ?= "2.13"
 UCLIBCVERSION ?= "0.9.32"
-LINUXLIBCVERSION ?= "2.6.37.2"
+LINUXLIBCVERSION ?= "3.1"
 
 # Temporary preferred version overrides for PPC
 PREFERRED_VERSION_u-boot-mkimage-native_powerpc ?= "2009.08"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 014024f..4e874fe 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -1,9 +1,20 @@
-DESCRIPTION = "Sanitized set of 2.6 kernel headers for the C library's use."
+DESCRIPTION = "Sanitized set of kernel headers for the C library's use."
 SECTION = "devel"
 LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7" 
-SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2"
+
+python __anonymous () {
+    import bb, re, string
+
+    major = bb.data.getVar("PV",d,1).split('.')[0]
+    if major == "3":
+        bb.data.setVar("HEADER_FETCH_VER", "3.0", d)
+    else:
+        bb.data.setVar("HEADER_FETCH_VER", "2.6", d)
+}
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar.bz2"
 
 #DEPENDS = "cross-linkage"
 RDEPENDS_${PN}-dev = ""
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
new file mode 100644
index 0000000..3c845ef
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
@@ -0,0 +1,53 @@
+require linux-libc-headers.inc
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "unifdef-native"
+PR = "r1"
+
+SRC_URI += " file://connector-msg-size-fix.patch"
+
+S = "${WORKDIR}/linux-${PV}"
+
+set_arch() {
+	case ${TARGET_ARCH} in
+		alpha*)   ARCH=alpha ;;
+		arm*)     ARCH=arm ;;
+		cris*)    ARCH=cris ;;
+		hppa*)    ARCH=parisc ;;
+		i*86*)    ARCH=i386 ;;
+		ia64*)    ARCH=ia64 ;;
+		mips*)    ARCH=mips ;;
+		m68k*)    ARCH=m68k ;;
+		powerpc*) ARCH=powerpc ;;
+		s390*)    ARCH=s390 ;;
+		sh*)      ARCH=sh ;;
+		sparc64*) ARCH=sparc64 ;;
+		sparc*)   ARCH=sparc ;;
+		x86_64*)  ARCH=x86_64 ;;
+		avr32*)   ARCH=avr32 ;;
+		bfin*)    ARCH=blackfin ;;
+		microblaze*) ARCH=microblaze ;;
+	esac
+}
+
+do_configure() {
+	set_arch
+	oe_runmake allnoconfig ARCH=$ARCH
+}
+
+do_compile () {
+}
+
+do_install() {
+	set_arch
+	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
+	# Kernel should not be exporting this header
+	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
+
+	# The ..install.cmd conflicts between various configure runs
+	find ${D}${includedir} -name ..install.cmd | xargs rm -f
+}
+
+BBCLASSEXTEND = "nativesdk"
+SRC_URI[md5sum] = "eac4d398a0ecd98214487cd47a228998"
+SRC_URI[sha256sum] = "4ed16da319848f681f711dbda2ac2cf1b306a280ec22f90bae190cf23b533add"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb
new file mode 100644
index 0000000..5f9fe64
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb
@@ -0,0 +1,53 @@
+require linux-libc-headers.inc
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "unifdef-native"
+PR = "r1"
+
+SRC_URI += " file://connector-msg-size-fix.patch"
+
+S = "${WORKDIR}/linux-${PV}"
+
+set_arch() {
+	case ${TARGET_ARCH} in
+		alpha*)   ARCH=alpha ;;
+		arm*)     ARCH=arm ;;
+		cris*)    ARCH=cris ;;
+		hppa*)    ARCH=parisc ;;
+		i*86*)    ARCH=i386 ;;
+		ia64*)    ARCH=ia64 ;;
+		mips*)    ARCH=mips ;;
+		m68k*)    ARCH=m68k ;;
+		powerpc*) ARCH=powerpc ;;
+		s390*)    ARCH=s390 ;;
+		sh*)      ARCH=sh ;;
+		sparc64*) ARCH=sparc64 ;;
+		sparc*)   ARCH=sparc ;;
+		x86_64*)  ARCH=x86_64 ;;
+		avr32*)   ARCH=avr32 ;;
+		bfin*)    ARCH=blackfin ;;
+		microblaze*) ARCH=microblaze ;;
+	esac
+}
+
+do_configure() {
+	set_arch
+	oe_runmake allnoconfig ARCH=$ARCH
+}
+
+do_compile () {
+}
+
+do_install() {
+	set_arch
+	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
+	# Kernel should not be exporting this header
+	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
+
+	# The ..install.cmd conflicts between various configure runs
+	find ${D}${includedir} -name ..install.cmd | xargs rm -f
+}
+
+BBCLASSEXTEND = "nativesdk"
+SRC_URI[md5sum] = "8d43453f8159b2332ad410b19d86a931"
+SRC_URI[sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-- 
1.7.0.4



