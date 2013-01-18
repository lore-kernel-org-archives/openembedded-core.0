Received: from afflict.kos.to ([92.243.29.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <riku.voipio@linaro.org>) id 1TwD4Y-0007YS-5L
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 15:37:50 +0100
Received: from aimless.elisa-laajakaista.fi
	(a91-156-58-157.elisa-laajakaista.fi [91.156.58.157])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id A04EC264BE;
	Fri, 18 Jan 2013 15:13:27 +0100 (CET)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jan 2013 16:13:21 +0200
Message-Id: <1358518403-11155-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] nspr: add aarch64 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 14:37:54 -0000

Add needed defines for Aarch64 support.

Upstream-Status: Submitted https://bugzilla.mozilla.org/show_bug.cgi?id=827271

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 .../nspr/files/fix-build-on-aarch64.patch          |  101 ++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.9.4.bb            |    1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-support/nspr/files/fix-build-on-aarch64.patch

diff --git a/meta/recipes-support/nspr/files/fix-build-on-aarch64.patch b/meta/recipes-support/nspr/files/fix-build-on-aarch64.patch
new file mode 100644
index 0000000..ccad0a1
--- /dev/null
+++ b/meta/recipes-support/nspr/files/fix-build-on-aarch64.patch
@@ -0,0 +1,101 @@
+Add Aarch64 support 
+
+Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+
+Upstream-Status: Submitted https://bugzilla.mozilla.org/show_bug.cgi?id=827271
+---
+ configure.in |   12 ++++++------
+ 1 files changed, 6 insertions(+), 6 deletions(-)
+--- a/pr/include/md/_linux.cfg
++++ b/pr/include/md/_linux.cfg
+@@ -861,6 +861,59 @@
+ #define PR_BYTES_PER_WORD_LOG2   2
+ #define PR_BYTES_PER_DWORD_LOG2  3
+ 
++#elif defined(__aarch64__)
++
++#ifdef __AARCH64EB__
++#undef  IS_LITTLE_ENDIAN
++#define IS_BIG_ENDIAN 1
++#elif defined(__AARCH64EL__)
++#define IS_LITTLE_ENDIAN 1
++#undef  IS_BIG_ENDIAN
++#else
++#error "Unknown Aarch64 endianness."
++#endif
++#define IS_64
++
++#define PR_BYTES_PER_BYTE   1
++#define PR_BYTES_PER_SHORT  2
++#define PR_BYTES_PER_INT    4
++#define PR_BYTES_PER_INT64  8
++#define PR_BYTES_PER_LONG   8
++#define PR_BYTES_PER_FLOAT  4
++#define PR_BYTES_PER_DOUBLE 8
++#define PR_BYTES_PER_WORD   8
++#define PR_BYTES_PER_DWORD  8
++
++#define PR_BITS_PER_BYTE    8
++#define PR_BITS_PER_SHORT   16
++#define PR_BITS_PER_INT     32
++#define PR_BITS_PER_INT64   64
++#define PR_BITS_PER_LONG    64
++#define PR_BITS_PER_FLOAT   32
++#define PR_BITS_PER_DOUBLE  64
++#define PR_BITS_PER_WORD    64
++
++#define PR_BITS_PER_BYTE_LOG2   3
++#define PR_BITS_PER_SHORT_LOG2  4
++#define PR_BITS_PER_INT_LOG2    5
++#define PR_BITS_PER_INT64_LOG2  6
++#define PR_BITS_PER_LONG_LOG2   6
++#define PR_BITS_PER_FLOAT_LOG2  5
++#define PR_BITS_PER_DOUBLE_LOG2 6
++#define PR_BITS_PER_WORD_LOG2   6
++
++#define PR_ALIGN_OF_SHORT   2
++#define PR_ALIGN_OF_INT     4
++#define PR_ALIGN_OF_LONG    8
++#define PR_ALIGN_OF_INT64   8
++#define PR_ALIGN_OF_FLOAT   4
++#define PR_ALIGN_OF_DOUBLE  8
++#define PR_ALIGN_OF_POINTER 8
++#define PR_ALIGN_OF_WORD    8
++
++#define PR_BYTES_PER_WORD_LOG2  3
++#define PR_BYTES_PER_DWORD_LOG2 3
++
+ #else
+ 
+ #error "Unknown CPU architecture"
+--- a/pr/include/md/_linux.h
++++ b/pr/include/md/_linux.h
+@@ -53,6 +53,8 @@
+ #define _PR_SI_ARCHITECTURE "avr32"
+ #elif defined(__m32r__)
+ #define _PR_SI_ARCHITECTURE "m32r"
++#elif defined(__aarch64__)
++#define _PR_SI_ARCHITECTURE "aarch64"
+ #else
+ #error "Unknown CPU architecture"
+ #endif
+@@ -186,7 +188,7 @@
+ })
+ #endif
+ 
+-#if defined(__arm__)
++#if defined(__arm__) || defined(__aarch64__)
+ #if defined(__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4)
+ /* Use GCC built-in functions */
+ #define _PR_HAVE_ATOMIC_OPS
+@@ -242,6 +244,10 @@
+ #endif
+ #endif /* __arm__ */
+ 
++#if defined(__aarch64__)
++#define _MD_MINIMUM_STACK_SIZE 0x20000
++#endif
++
+ #define USE_SETJMP
+ #if (defined(__GLIBC__) && __GLIBC__ >= 2) || defined(ANDROID)
+ #define _PR_POLL_AVAILABLE
diff --git a/meta/recipes-support/nspr/nspr_4.9.4.bb b/meta/recipes-support/nspr/nspr_4.9.4.bb
index 36f93e0..accfda7 100644
--- a/meta/recipes-support/nspr/nspr_4.9.4.bb
+++ b/meta/recipes-support/nspr/nspr_4.9.4.bb
@@ -11,6 +11,7 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v${PV}/src/nspr-$
            file://remove-rpath-from-tests.patch \
            file://fix-build-on-x86_64.patch \
            file://trickly-fix-build-on-x86_64.patch \
+           file://fix-build-on-aarch64.patch \
           "
 
 SRC_URI += "file://nspr.pc.in"
-- 
1.7.10.4



