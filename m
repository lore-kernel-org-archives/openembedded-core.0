Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RJAcE-0000Hv-NN
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 23:02:27 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9QKuGgb016825;
	Wed, 26 Oct 2011 13:56:17 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 26 Oct 2011 16:56:01 -0400
Message-Id: <7f8ab565db30b6a78dd26362b13a75412c3f73b6.1319662382.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1319662382.git.bruce.ashfield@windriver.com>
References: <cover.1319662382.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1319662382.git.bruce.ashfield@windriver.com>
References: <cover.1319662382.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/2] linux-libc-headers: factor common code into linux-libc-headers.inc
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
X-List-Received-Date: Wed, 26 Oct 2011 21:02:28 -0000

Each time a new linux-libc-headers is created the same code is
cloned. Placing the common functionality in the .inc file simplies
each recipe and make maintenance easier.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../linux-libc-headers/linux-libc-headers.inc      |   44 ++++++++++++++++++
 .../linux-libc-headers_2.6.37.2.bb                 |   46 +-------------------
 .../linux-libc-headers_2.6.39.bb                   |   47 +-------------------
 3 files changed, 46 insertions(+), 91 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 014024f..e83a92b 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -5,6 +5,50 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7" 
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2"
 
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
+
 #DEPENDS = "cross-linkage"
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
index 55d7527..e2def96 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
@@ -2,52 +2,8 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r2"
+PR = "r3"
 
 SRC_URI += " file://connector-msg-size-fix.patch"
-
-S = "${WORKDIR}/linux-${PV}"
-
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-		avr32*)   ARCH=avr32 ;;
-		bfin*)    ARCH=blackfin ;;
-		microblaze*) ARCH=microblaze ;;
-	esac
-}
-
-do_configure() {
-	set_arch
-	oe_runmake allnoconfig ARCH=$ARCH
-}
-
-do_compile () {
-}
-
-do_install() {
-	set_arch
-	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
-	# Kernel should not be exporting this header
-	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
-
-	# The ..install.cmd conflicts between various configure runs
-	find ${D}${includedir} -name ..install.cmd | xargs rm -f
-}
-
-BBCLASSEXTEND = "nativesdk"
 SRC_URI[md5sum] = "89f681bc7c917a84aa7470da6eed5101"
 SRC_URI[sha256sum] = "2920c4cd3e87fe40ebee96d28779091548867e1c36f71c1fc3d07e6d5802161f"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
index 14f5e8a..a1821e2 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
@@ -2,53 +2,8 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
+PR = "r3"
 
 SRC_URI += " file://connector-msg-size-fix.patch"
 SRC_URI[md5sum] = "1aab7a741abe08d42e8eccf20de61e05"
 SRC_URI[sha256sum] = "584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d45c61f6"
-
-S = "${WORKDIR}/linux-${PV}"
-
-PR = "r2"
-
-set_arch() {
-	case ${TARGET_ARCH} in
-		alpha*)   ARCH=alpha ;;
-		arm*)     ARCH=arm ;;
-		cris*)    ARCH=cris ;;
-		hppa*)    ARCH=parisc ;;
-		i*86*)    ARCH=i386 ;;
-		ia64*)    ARCH=ia64 ;;
-		mips*)    ARCH=mips ;;
-		m68k*)    ARCH=m68k ;;
-		powerpc*) ARCH=powerpc ;;
-		s390*)    ARCH=s390 ;;
-		sh*)      ARCH=sh ;;
-		sparc64*) ARCH=sparc64 ;;
-		sparc*)   ARCH=sparc ;;
-		x86_64*)  ARCH=x86_64 ;;
-		avr32*)   ARCH=avr32 ;;
-		bfin*)    ARCH=blackfin ;;
-		microblaze*) ARCH=microblaze ;;
-	esac
-}
-
-do_configure() {
-	set_arch
-	oe_runmake allnoconfig ARCH=$ARCH
-}
-
-do_compile () {
-}
-
-do_install() {
-	set_arch
-	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
-	# Kernel should not be exporting this header
-	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
-
-        # The ..install.cmd conflicts between various configure runs
-        find ${D}${includedir} -name ..install.cmd | xargs rm -f
-}
-
-BBCLASSEXTEND = "nativesdk"
-- 
1.7.0.4



