Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1ShMJu-00008A-EZ
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 16:55:46 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5KEipgp024307;
	Wed, 20 Jun 2012 07:44:52 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 20 Jun 2012 10:54:54 -0400
Message-Id: <b6499cb8429671a360a1a1a0263f3f81c96ac5aa.1340202895.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1340202895.git.bruce.ashfield@windriver.com>
References: <cover.1340202895.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1340202895.git.bruce.ashfield@windriver.com>
References: <cover.1340202895.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-libc-headers: use kernel-arch to set ARCH
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
X-List-Received-Date: Wed, 20 Jun 2012 14:55:47 -0000

linux-libc-headers no longer needs its own ARCH mapping code,
since the mapping done in kernel-arch works and we can
consolidate all arch mapping code in a single place.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../linux-libc-headers/linux-libc-headers.inc      |   30 ++-----------------
 1 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 4137be1..962ca75 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -12,43 +12,21 @@ python __anonymous () {
 	d.setVar("HEADER_FETCH_VER", "2.6")
 }
 
+inherit kernel-arch
+
 SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar.bz2"
 
 S = "${WORKDIR}/linux-${PV}"
 
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
 do_configure() {
-	set_arch
-	oe_runmake allnoconfig ARCH=$ARCH
+	oe_runmake allnoconfig
 }
 
 do_compile () {
 }
 
 do_install() {
-	set_arch
-	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
+	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix}
 	# Kernel should not be exporting this header
 	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
 
-- 
1.7.0.4



