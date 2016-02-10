Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC1C731CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 00:04:20 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q0Lt75RpRz3hjFG;
	Wed, 10 Feb 2016 01:04:15 +0100 (CET)
X-Auth-Info: wdFfy6djryBc5KN6s6dI5mVE4qgVj8kDsw4VESGFyc0=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3q0Lt73XQTzvhTk;
	Wed, 10 Feb 2016 01:04:15 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 01:04:04 +0100
Message-Id: <1455062646-12311-5-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455062646-12311-1-git-send-email-marex@denx.de>
References: <1455062646-12311-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 5/7] nspr: Add nios2 support
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
X-List-Received-Date: Wed, 10 Feb 2016 00:04:21 -0000

Add small patch to support nios2 in NSPR.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 .../nspr/nspr/0002-Add-nios2-support.patch         | 105 +++++++++++++++++++++
 meta/recipes-support/nspr/nspr_4.11.bb             |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch

diff --git a/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch b/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
new file mode 100644
index 0000000..2322806
--- /dev/null
+++ b/meta/recipes-support/nspr/nspr/0002-Add-nios2-support.patch
@@ -0,0 +1,105 @@
+From 95bda64fb4cf1825fea745e918cfe8202843f0ba Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Sat, 30 Jan 2016 07:18:02 +0100
+Subject: [PATCH] Add nios2 support
+
+Add support for the nios2 CPU.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=1244421 ]
+---
+ nspr/pr/include/md/_linux.cfg | 45 +++++++++++++++++++++++++++++++++++++++++++
+ nspr/pr/include/md/_linux.h   | 14 ++++++++++++++
+ 2 files changed, 59 insertions(+)
+
+diff --git a/pr/include/md/_linux.cfg b/nspr/pr/include/md/_linux.cfg
+index 8cbf0cb..150676b 100644
+--- a/pr/include/md/_linux.cfg
++++ b/pr/include/md/_linux.cfg
+@@ -972,6 +972,51 @@
+ #define PR_BYTES_PER_WORD_LOG2   2
+ #define PR_BYTES_PER_DWORD_LOG2  3
+ 
++#elif defined(__nios2__)
++
++#define IS_LITTLE_ENDIAN    1
++#undef  IS_BIG_ENDIAN
++
++#define PR_BYTES_PER_BYTE   1
++#define PR_BYTES_PER_SHORT  2
++#define PR_BYTES_PER_INT    4
++#define PR_BYTES_PER_INT64  8
++#define PR_BYTES_PER_LONG   4
++#define PR_BYTES_PER_FLOAT  4
++#define PR_BYTES_PER_DOUBLE 8
++#define PR_BYTES_PER_WORD   4
++#define PR_BYTES_PER_DWORD  8
++
++#define PR_BITS_PER_BYTE    8
++#define PR_BITS_PER_SHORT   16
++#define PR_BITS_PER_INT     32
++#define PR_BITS_PER_INT64   64
++#define PR_BITS_PER_LONG    32
++#define PR_BITS_PER_FLOAT   32
++#define PR_BITS_PER_DOUBLE  64
++#define PR_BITS_PER_WORD    32
++
++#define PR_BITS_PER_BYTE_LOG2   3
++#define PR_BITS_PER_SHORT_LOG2  4
++#define PR_BITS_PER_INT_LOG2    5
++#define PR_BITS_PER_INT64_LOG2  6
++#define PR_BITS_PER_LONG_LOG2   5
++#define PR_BITS_PER_FLOAT_LOG2  5
++#define PR_BITS_PER_DOUBLE_LOG2 6
++#define PR_BITS_PER_WORD_LOG2   5
++
++#define PR_ALIGN_OF_SHORT   2
++#define PR_ALIGN_OF_INT     4
++#define PR_ALIGN_OF_LONG    4
++#define PR_ALIGN_OF_INT64   4
++#define PR_ALIGN_OF_FLOAT   4
++#define PR_ALIGN_OF_DOUBLE  4
++#define PR_ALIGN_OF_POINTER 4
++#define PR_ALIGN_OF_WORD    4
++
++#define PR_BYTES_PER_WORD_LOG2   2
++#define PR_BYTES_PER_DWORD_LOG2  3
++
+ #elif defined(__or1k__)
+ 
+ #undef  IS_LITTLE_ENDIAN
+diff --git a/pr/include/md/_linux.h b/nspr/pr/include/md/_linux.h
+index d378db5..18260be 100644
+--- a/pr/include/md/_linux.h
++++ b/pr/include/md/_linux.h
+@@ -55,6 +55,8 @@
+ #define _PR_SI_ARCHITECTURE "avr32"
+ #elif defined(__m32r__)
+ #define _PR_SI_ARCHITECTURE "m32r"
++#elif defined(__nios2__)
++#define _PR_SI_ARCHITECTURE "nios2"
+ #elif defined(__or1k__)
+ #define _PR_SI_ARCHITECTURE "or1k"
+ #else
+@@ -125,6 +127,18 @@ extern PRInt32 _PR_x86_64_AtomicSet(PRInt32 *val, PRInt32 newval);
+ #define _MD_ATOMIC_SET                _PR_x86_64_AtomicSet
+ #endif
+ 
++#if defined(__nios2__)
++#if defined(__GNUC__)
++/* Use GCC built-in functions */
++#define _PR_HAVE_ATOMIC_OPS
++#define _MD_INIT_ATOMIC()
++#define _MD_ATOMIC_INCREMENT(ptr) __sync_add_and_fetch(ptr, 1)
++#define _MD_ATOMIC_DECREMENT(ptr) __sync_sub_and_fetch(ptr, 1)
++#define _MD_ATOMIC_ADD(ptr, i) __sync_add_and_fetch(ptr, i)
++#define _MD_ATOMIC_SET(ptr, nv) __sync_lock_test_and_set(ptr, nv)
++#endif
++#endif
++
+ #if defined(__or1k__)
+ #if defined(__GNUC__)
+ /* Use GCC built-in functions */
+-- 
+2.7.0.rc3
+
diff --git a/meta/recipes-support/nspr/nspr_4.11.bb b/meta/recipes-support/nspr/nspr_4.11.bb
index 3dabcb6..a38e20c 100644
--- a/meta/recipes-support/nspr/nspr_4.11.bb
+++ b/meta/recipes-support/nspr/nspr_4.11.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://remove-rpath-from-tests.patch \
            file://fix-build-on-x86_64.patch \
            file://remove-srcdir-from-configure-in.patch \
+	   file://0002-Add-nios2-support.patch \
           "
 
 SRC_URI += "file://nspr.pc.in"
-- 
2.1.4


