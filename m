Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qh595-00034N-76
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 21:30:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Jul 2011 12:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,526,1304319600"; d="scan'208";a="25507390"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 12:26:52 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 05:59:33 -0700
Message-Id: <3eb60049ded541f640a15c6f4b8558baf0663541.1310561877.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <6220e9316f6033364724b5d7a86917848dadf6be.1310561877.git.nitin.a.kamble@intel.com>
References: <6220e9316f6033364724b5d7a86917848dadf6be.1310561877.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1310561877.git.nitin.a.kamble@intel.com>
References: <cover.1310561877.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/3] openssl: compilation fixes for x32
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
X-List-Received-Date: Wed, 13 Jul 2011 19:30:56 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../openssl/openssl-0.9.8r/x32_compile_fix.patch   |   74 ++++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl.inc      |    5 ++
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    5 +-
 3 files changed, 82 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-0.9.8r/x32_compile_fix.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8r/x32_compile_fix.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8r/x32_compile_fix.patch
new file mode 100644
index 0000000..24f2df5
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-0.9.8r/x32_compile_fix.patch
@@ -0,0 +1,74 @@
+UpstreamStatus: Pending
+
+Received from H J Liu @ Intel
+
+This patch fixes the compilation for x32 build
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/13
+
+Index: openssl-0.9.8r/Configure
+===================================================================
+--- openssl-0.9.8r.orig/Configure
++++ openssl-0.9.8r/Configure
+@@ -390,6 +390,7 @@ my %table=(
+ "linux-ia64-ecc","ecc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-ia64-icc","icc:-DL_ENDIAN -DTERMIO -O2 -Wall -no_cpprt::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK:${ia64_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ "linux-x86_64",	"gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
++"linux-x32",	"gcc:-mx32 -DL_ENDIAN -DTERMIO -Wall -DMD32_REG_T=int::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT RC4_CHUNK DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:-mx32:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
+ #### SPARC Linux setups
+ # Ray Miller <ray.miller@computing-services.oxford.ac.uk> has patiently
+ # assisted with debugging of following two configs.
+Index: openssl-0.9.8r/crypto/bn/asm/x86_64-gcc.c
+===================================================================
+--- openssl-0.9.8r.orig/crypto/bn/asm/x86_64-gcc.c
++++ openssl-0.9.8r/crypto/bn/asm/x86_64-gcc.c
+@@ -55,7 +55,11 @@
+  *    machine.
+  */
+ 
++#if defined _WIN64 || !defined __LP64__
++#define BN_ULONG unsigned long long
++#else
+ #define BN_ULONG unsigned long
++#endif
+ 
+ #undef mul
+ #undef mul_add
+@@ -188,9 +192,9 @@ BN_ULONG bn_add_words (BN_ULONG *rp, con
+ 	asm (
+ 	"	subq	%2,%2		\n"
+ 	".align 16			\n"
+-	"1:	movq	(%4,%2,8),%0	\n"
+-	"	adcq	(%5,%2,8),%0	\n"
+-	"	movq	%0,(%3,%2,8)	\n"
++	"1:	movq	(%q4,%2,8),%0	\n"
++	"	adcq	(%q5,%2,8),%0	\n"
++	"	movq	%0,(%q3,%2,8)	\n"
+ 	"	leaq	1(%2),%2	\n"
+ 	"	loop	1b		\n"
+ 	"	sbbq	%0,%0		\n"
+@@ -211,9 +215,9 @@ BN_ULONG bn_sub_words (BN_ULONG *rp, con
+ 	asm (
+ 	"	subq	%2,%2		\n"
+ 	".align 16			\n"
+-	"1:	movq	(%4,%2,8),%0	\n"
+-	"	sbbq	(%5,%2,8),%0	\n"
+-	"	movq	%0,(%3,%2,8)	\n"
++	"1:	movq	(%q4,%2,8),%0	\n"
++	"	sbbq	(%q5,%2,8),%0	\n"
++	"	movq	%0,(%q3,%2,8)	\n"
+ 	"	leaq	1(%2),%2	\n"
+ 	"	loop	1b		\n"
+ 	"	sbbq	%0,%0		\n"
+Index: openssl-0.9.8r/crypto/bn/bn_exp.c
+===================================================================
+--- openssl-0.9.8r.orig/crypto/bn/bn_exp.c
++++ openssl-0.9.8r/crypto/bn/bn_exp.c
+@@ -561,7 +561,7 @@ static int MOD_EXP_CTIME_COPY_FROM_PREBU
+ 
+ /* Given a pointer value, compute the next address that is a cache line multiple. */
+ #define MOD_EXP_CTIME_ALIGN(x_) \
+-	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((BN_ULONG)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
++	((unsigned char*)(x_) + (MOD_EXP_CTIME_MIN_CACHE_LINE_WIDTH - (((unsigned long)(x_)) & (MOD_EXP_CTIME_MIN_CACHE_LINE_MASK))))
+ 
+ /* This variant of BN_mod_exp_mont() uses fixed windows and the special
+  * precomputation memory layout to limit data-dependency to a minimum
diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index d42ae1c..f62b936 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -71,6 +71,11 @@ do_configure () {
 	linux-i686)
 		target=debian-i386-i686/cmov
 		;;
+	linux-x86_64)
+		if [ "x${TARGET_CC_ARCH}" = "x-mx32" ]; then
+			target=linux-x32
+		fi
+		;;
 	linux-mips)
 		target=debian-mips
 		;;
diff --git a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
index c95b1f1..a42bfcd 100644
--- a/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
+++ b/meta/recipes-connectivity/openssl/openssl_0.9.8r.bb
@@ -1,6 +1,6 @@
 require openssl.inc
 
-PR = "r2"
+PR = "r3"
 SRC_URI += "file://debian/ca.patch \
             file://debian/config-hurd.patch;apply=no \
             file://debian/debian-targets.patch \
@@ -25,6 +25,7 @@ SRC_URI[md5sum] = "0352932ea863bc02b056cda7c9ac5b79"
 SRC_URI[sha256sum] = "42b2368f786b05ed3be846838dce126b4e8e3dba8fb2e0ce83102df28c102fad"
 
 SRC_URI += "file://configure-targets.patch \
-            file://shared-libs.patch"
+            file://shared-libs.patch \
+            file://x32_compile_fix.patch"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.5.4



