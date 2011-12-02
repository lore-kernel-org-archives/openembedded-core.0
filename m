Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RWZhA-0002KN-EZ
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:26:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43396283"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 12:20:11 -0800
From: nitin.a.kamble@intel.com
To: hjl.tools@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:20:01 -0800
Message-Id: <d34dc8aff5aafa1aceb9cceb8d06b5b4eff1a675.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
References: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
Subject: [PATCH 03/11] openssl-1.0.0e: fix to wotk with x32 toolchain
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
X-List-Received-Date: Fri, 02 Dec 2011 20:26:57 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Add BN_ADDR for address type instead of using BN_ULONG or unsigned long:
   1. For W64, address type is unsigned long long, not unsigned long.
   2. For x32, address type is unsigned long , not BN_ULONG.

Added a new targetlinux-x32 in the config file

The do_install() code to move lib/* to lib64 is not needed now with the
enhanced multilib support.

Make the x86-64 assembly syntax compatible with x32 compiler.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
---
 .../openssl-1.0.0e/openssl_fix_for_x32.patch       |   90 ++++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl.inc      |   15 ++--
 .../recipes-connectivity/openssl/openssl_1.0.0e.bb |    3 +-
 3 files changed, 98 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch
new file mode 100644
index 0000000..10de986
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch
@@ -0,0 +1,90 @@
+UpstreamStatus: Pending
+
+Received from H J Liu @ Intel
+Make the assembly syntax compatible with x32 gcc. Othewise x32 gcc throws errors.
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
+
+ported the patch to the 1.0.0e version
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/01
+Index: openssl-1.0.0e/Configure
+===================================================================
+--- openssl-1.0.0e.orig/Configure
++++ openssl-1.0.0e/Configure
+@@ -393,6 +393,7 @@ my %table=(
+ "linux-ia64-ecc","ecc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-ia64-icc","icc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_INT:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-x86_64",	"gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
++"linux-x32",	"gcc:-DL_ENDIAN 	-DTERMIO -O2 -pipe -g -feliminate-unused-debug-types -Wall -DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:elf:dlfcn:linux-shared:-fPIC:-mx32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-s390x",	"gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_INT DES_UNROLL:${s390x_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR):::64",
+ #### SPARC Linux setups
+ # Ray Miller <ray.miller@computing-services.oxford.ac.uk> has patiently
+Index: openssl-1.0.0e/crypto/bn/asm/x86_64-gcc.c
+===================================================================
+--- openssl-1.0.0e.orig/crypto/bn/asm/x86_64-gcc.c
++++ openssl-1.0.0e/crypto/bn/asm/x86_64-gcc.c
+@@ -55,7 +55,7 @@
+  *    machine.
+  */
+ 
+-#ifdef _WIN64
++#if defined _WIN64 || !defined __LP64__
+ #define BN_ULONG unsigned long long
+ #else
+ #define BN_ULONG unsigned long
+@@ -192,9 +192,9 @@ BN_ULONG bn_add_words (BN_ULONG *rp, con
+ 	asm (
+ 	"	subq	%2,%2		\n"
+ 	".p2align 4			\n"
+-	"1:	movq	(%4,%2,8),%0	\n"
+-	"	adcq	(%5,%2,8),%0	\n"
+-	"	movq	%0,(%3,%2,8)	\n"
++	"1:	movq	(%q4,%2,8),%0	\n"
++	"	adcq	(%q5,%2,8),%0	\n"
++	"	movq	%0,(%q3,%2,8)	\n"
+ 	"	leaq	1(%2),%2	\n"
+ 	"	loop	1b		\n"
+ 	"	sbbq	%0,%0		\n"
+@@ -215,9 +215,9 @@ BN_ULONG bn_sub_words (BN_ULONG *rp, con
+ 	asm (
+ 	"	subq	%2,%2		\n"
+ 	".p2align 4			\n"
+-	"1:	movq	(%4,%2,8),%0	\n"
+-	"	sbbq	(%5,%2,8),%0	\n"
+-	"	movq	%0,(%3,%2,8)	\n"
++	"1:	movq	(%q4,%2,8),%0	\n"
++	"	sbbq	(%q5,%2,8),%0	\n"
++	"	movq	%0,(%q3,%2,8)	\n"
+ 	"	leaq	1(%2),%2	\n"
+ 	"	loop	1b		\n"
+ 	"	sbbq	%0,%0		\n"
+Index: openssl-1.0.0e/crypto/bn/bn.h
+===================================================================
+--- openssl-1.0.0e.orig/crypto/bn/bn.h
++++ openssl-1.0.0e/crypto/bn/bn.h
+@@ -172,6 +172,13 @@ extern "C" {
+ # endif
+ #endif
+ 
++/* Address type.  */
++#ifdef _WIN64
++#define BN_ADDR unsigned long long
++#else
++#define BN_ADDR unsigned long
++#endif
++
+ /* assuming long is 64bit - this is the DEC Alpha
+  * unsigned long long is only 64 bits :-(, don't define
+  * BN_LLONG for the DEC Alpha */
+Index: openssl-1.0.0e/crypto/bn/bn_exp.c
+===================================================================
+--- openssl-1.0.0e.orig/crypto/bn/bn_exp.c
++++ openssl-1.0.0e/crypto/bn/bn_exp.c
+@@ -561,7 +561,7 @@ static int MOD_EXP_CTIME_COPY_FROM_PREBU
+ 
+ /* Given a pointer value, compute the next address that is a cache line multiple. */
+ #define MOD_EXP_CTIME_ALIGN(x_) \
+-	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((BN_ULONG)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
++	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((BN_ADDR)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
+ 
+ /* This variant of BN_mod_exp_mont() uses fixed windows and the special
+  * precomputation memory layout to limit data-dependency to a minimum
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index c717fee..771f146 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -82,6 +82,12 @@ do_configure () {
 	linux-i686)
 		target=debian-i386-i686/cmov
 		;;
+	linux-gnux32-x86_64)
+		target=linux-x32
+		;;
+	linux-gnu64-x86_64)
+		target=linux-x86_64
+		;;
 	linux-mips)
 		target=debian-mips
 		;;
@@ -123,15 +129,6 @@ do_compile () {
 do_install () {
 	oe_runmake INSTALL_PREFIX="${D}" MANDIR="${mandir}" install
 
-	# On x86_64, move lib/* to lib64
-	if [ "${libdir}" != "${prefix}/lib" ]
-	then
-		install -m 0755 ${D}${libdir} ${D}${libdir}/pkgconfig
-		mv ${D}${prefix}/lib/lib* ${D}${libdir}
-		mv ${D}${prefix}/lib/pkgconfig/*.pc ${D}${libdir}/pkgconfig
-		chmod 644 ${D}${libdir}/pkgconfig/openssl.pc
-	fi
-
 	oe_libinstall -so libcrypto ${D}${libdir}
 	oe_libinstall -so libssl ${D}${libdir}
 
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.0e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.0e.bb
index 38f38e3..e29740b 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.0e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.0e.bb
@@ -6,7 +6,7 @@ DEPENDS += "ocf-linux"
 
 CFLAG += "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.2"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f9a8f968107345e0b75aa8c2ecaa7ec8"
 
@@ -29,6 +29,7 @@ SRC_URI += "file://configure-targets.patch \
             file://debian/pkg-config.patch \
             file://debian/no-symbolic.patch \
             file://debian/debian-targets.patch \
+            file://openssl_fix_for_x32.patch \
            "
 
 SRC_URI[md5sum] = "7040b89c4c58c7a1016c0dfa6e821c86"
-- 
1.7.6.4



