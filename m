Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 72A36731BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 15:11:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 07:11:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,441,1444719600"; d="scan'208";a="875739897"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 17 Dec 2015 07:11:26 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:08:44 +0200
Message-Id: <aa200477804ad69984e04a0b202b9cbbf7d7c755.1450364672.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/17] liburcu: update to 0.9.1
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
X-List-Received-Date: Thu, 17 Dec 2015 15:11:26 -0000

Remove all patches: one of them is fixing a problem with gcc 4.8
that is no longer in use, and the other two are backports.

LICENSE checksum has changed, but visually the text has stayed the same.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...cify-complete-types-for-atomic-function-c.patch | 158 ---------------------
 ...evert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch |  47 ------
 meta/recipes-support/liburcu/liburcu/aarch64.patch |  19 ---
 .../liburcu/{liburcu_0.8.7.bb => liburcu_0.9.1.bb} |   9 +-
 4 files changed, 3 insertions(+), 230 deletions(-)
 delete mode 100644 meta/recipes-support/liburcu/liburcu/0001-uatomic-Specify-complete-types-for-atomic-function-c.patch
 delete mode 100644 meta/recipes-support/liburcu/liburcu/Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch
 delete mode 100644 meta/recipes-support/liburcu/liburcu/aarch64.patch
 rename meta/recipes-support/liburcu/{liburcu_0.8.7.bb => liburcu_0.9.1.bb} (61%)

diff --git a/meta/recipes-support/liburcu/liburcu/0001-uatomic-Specify-complete-types-for-atomic-function-c.patch b/meta/recipes-support/liburcu/liburcu/0001-uatomic-Specify-complete-types-for-atomic-function-c.patch
deleted file mode 100644
index 5ad0bbd..0000000
--- a/meta/recipes-support/liburcu/liburcu/0001-uatomic-Specify-complete-types-for-atomic-function-c.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-From 6af790818d074c103c4797f1ce764896f183e028 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Aug 2015 21:35:03 -0700
-Subject: [PATCH] uatomic: Specify complete types for atomic function calls
-
-This was unearthed by clang compiler where it complained about parameter
-mismatch, gcc doesnt notice this
-
-urcu/uatomic/generic.h:190:10: error: address argument to atomic builtin
-must be a pointer to integer or pointer ('void *' invalid)
-                return __sync_add_and_fetch_4(addr, val);
-
-Fixed all instances thusly
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- urcu/uatomic/generic.h | 40 ++++++++++++++++++++--------------------
- 1 file changed, 20 insertions(+), 20 deletions(-)
-
-diff --git a/urcu/uatomic/generic.h b/urcu/uatomic/generic.h
-index 37f59cc..0046ffd 100644
---- a/urcu/uatomic/generic.h
-+++ b/urcu/uatomic/generic.h
-@@ -65,17 +65,17 @@ unsigned long _uatomic_cmpxchg(void *addr, unsigned long old,
- 	switch (len) {
- #ifdef UATOMIC_HAS_ATOMIC_BYTE
- 	case 1:
--		return __sync_val_compare_and_swap_1(addr, old, _new);
-+		return __sync_val_compare_and_swap_1((unsigned char *)addr, old, _new);
- #endif
- #ifdef UATOMIC_HAS_ATOMIC_SHORT
- 	case 2:
--		return __sync_val_compare_and_swap_2(addr, old, _new);
-+		return __sync_val_compare_and_swap_2((unsigned short int *)addr, old, _new);
- #endif
- 	case 4:
--		return __sync_val_compare_and_swap_4(addr, old, _new);
-+		return __sync_val_compare_and_swap_4((unsigned int *)addr, old, _new);
- #if (CAA_BITS_PER_LONG == 64)
- 	case 8:
--		return __sync_val_compare_and_swap_8(addr, old, _new);
-+		return __sync_val_compare_and_swap_8((unsigned long *)addr, old, _new);
- #endif
- 	}
- 	_uatomic_link_error();
-@@ -100,20 +100,20 @@ void _uatomic_and(void *addr, unsigned long val,
- 	switch (len) {
- #ifdef UATOMIC_HAS_ATOMIC_BYTE
- 	case 1:
--		__sync_and_and_fetch_1(addr, val);
-+		__sync_and_and_fetch_1((unsigned char *)addr, val);
- 		return;
- #endif
- #ifdef UATOMIC_HAS_ATOMIC_SHORT
- 	case 2:
--		__sync_and_and_fetch_2(addr, val);
-+		__sync_and_and_fetch_2((unsigned short int *)addr, val);
- 		return;
- #endif
- 	case 4:
--		__sync_and_and_fetch_4(addr, val);
-+		__sync_and_and_fetch_4((unsigned int *)addr, val);
- 		return;
- #if (CAA_BITS_PER_LONG == 64)
- 	case 8:
--		__sync_and_and_fetch_8(addr, val);
-+		__sync_and_and_fetch_8((unsigned long *)addr, val);
- 		return;
- #endif
- 	}
-@@ -139,20 +139,20 @@ void _uatomic_or(void *addr, unsigned long val,
- 	switch (len) {
- #ifdef UATOMIC_HAS_ATOMIC_BYTE
- 	case 1:
--		__sync_or_and_fetch_1(addr, val);
-+		__sync_or_and_fetch_1((unsigned char *)addr, val);
- 		return;
- #endif
- #ifdef UATOMIC_HAS_ATOMIC_SHORT
- 	case 2:
--		__sync_or_and_fetch_2(addr, val);
-+		__sync_or_and_fetch_2((unsigned short int *)addr, val);
- 		return;
- #endif
- 	case 4:
--		__sync_or_and_fetch_4(addr, val);
-+		__sync_or_and_fetch_4((unsigned int *)addr, val);
- 		return;
- #if (CAA_BITS_PER_LONG == 64)
- 	case 8:
--		__sync_or_and_fetch_8(addr, val);
-+		__sync_or_and_fetch_8((unsigned long *)addr, val);
- 		return;
- #endif
- 	}
-@@ -180,17 +180,17 @@ unsigned long _uatomic_add_return(void *addr, unsigned long val,
- 	switch (len) {
- #ifdef UATOMIC_HAS_ATOMIC_BYTE
- 	case 1:
--		return __sync_add_and_fetch_1(addr, val);
-+		return __sync_add_and_fetch_1((unsigned char *)addr, val);
- #endif
- #ifdef UATOMIC_HAS_ATOMIC_SHORT
- 	case 2:
--		return __sync_add_and_fetch_2(addr, val);
-+		return __sync_add_and_fetch_2((unsigned short int *)addr, val);
- #endif
- 	case 4:
--		return __sync_add_and_fetch_4(addr, val);
-+		return __sync_add_and_fetch_4((unsigned int *)addr, val);
- #if (CAA_BITS_PER_LONG == 64)
- 	case 8:
--		return __sync_add_and_fetch_8(addr, val);
-+		return __sync_add_and_fetch_8((unsigned long *)addr, val);
- #endif
- 	}
- 	_uatomic_link_error();
-@@ -218,7 +218,7 @@ unsigned long _uatomic_exchange(void *addr, unsigned long val, int len)
- 
- 		do {
- 			old = uatomic_read((unsigned char *)addr);
--		} while (!__sync_bool_compare_and_swap_1(addr, old, val));
-+		} while (!__sync_bool_compare_and_swap_1((unsigned char *)addr, old, val));
- 
- 		return old;
- 	}
-@@ -230,7 +230,7 @@ unsigned long _uatomic_exchange(void *addr, unsigned long val, int len)
- 
- 		do {
- 			old = uatomic_read((unsigned short *)addr);
--		} while (!__sync_bool_compare_and_swap_2(addr, old, val));
-+		} while (!__sync_bool_compare_and_swap_2((unsigned short int *)addr, old, val));
- 
- 		return old;
- 	}
-@@ -241,7 +241,7 @@ unsigned long _uatomic_exchange(void *addr, unsigned long val, int len)
- 
- 		do {
- 			old = uatomic_read((unsigned int *)addr);
--		} while (!__sync_bool_compare_and_swap_4(addr, old, val));
-+		} while (!__sync_bool_compare_and_swap_4((unsigned int *)addr, old, val));
- 
- 		return old;
- 	}
-@@ -252,7 +252,7 @@ unsigned long _uatomic_exchange(void *addr, unsigned long val, int len)
- 
- 		do {
- 			old = uatomic_read((unsigned long *)addr);
--		} while (!__sync_bool_compare_and_swap_8(addr, old, val));
-+		} while (!__sync_bool_compare_and_swap_8((unsigned long *)addr, old, val));
- 
- 		return old;
- 	}
--- 
-2.1.4
-
diff --git a/meta/recipes-support/liburcu/liburcu/Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch b/meta/recipes-support/liburcu/liburcu/Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch
deleted file mode 100644
index 535a738..0000000
--- a/meta/recipes-support/liburcu/liburcu/Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 7b3df100346128d780f218b881d563d1fd12e310 Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Mon, 20 Oct 2014 13:46:10 +1100
-Subject: [PATCH] Revert "Blacklist ARM gcc 4.8.0, 4.8.1, 4.8.2"
-
-This reverts commit 4b79310aa3d408ba30fee02cc497a68072d38a99.
-OE-Core is using a patched GCC 4.8.2 which is able to compile liburcu
-properly.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- urcu/compiler.h | 19 -------------------
- 1 file changed, 19 deletions(-)
-
-diff --git a/urcu/compiler.h b/urcu/compiler.h
-index 1e30903..19534f0 100644
---- a/urcu/compiler.h
-+++ b/urcu/compiler.h
-@@ -108,23 +108,4 @@
- 
- #define CAA_ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
- 
--/*
-- * Don't allow compiling with buggy compiler.
-- */
--
--#ifdef __GNUC__
--# define URCU_GCC_VERSION	(__GNUC__ * 10000 \
--				+ __GNUC_MINOR__ * 100 \
--				+ __GNUC_PATCHLEVEL__)
--
--/*
-- * http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854
-- */
--# ifdef __ARMEL__
--#  if URCU_GCC_VERSION >= 40800 && URCU_GCC_VERSION <= 40802
--#   error Your gcc version produces clobbered frame accesses
--#  endif
--# endif
--#endif
--
- #endif /* _URCU_COMPILER_H */
--- 
-2.1.2
-
diff --git a/meta/recipes-support/liburcu/liburcu/aarch64.patch b/meta/recipes-support/liburcu/liburcu/aarch64.patch
deleted file mode 100644
index c6cc8c2..0000000
--- a/meta/recipes-support/liburcu/liburcu/aarch64.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-libucru: recognize aarch64
-
-Make the same as "arm" internally.
-
-Upstream-Status: Pending
-
-Signed-off-by: joe.slater@windriver.com
-
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -77,6 +77,7 @@ AS_CASE([$host_cpu],
- 	[alpha*], [ARCHTYPE="alpha"],
- 	[ia64], [ARCHTYPE="gcc"],
- 	[arm*], [ARCHTYPE="arm"],
-+	[aarch64], [ARCHTYPE="arm"],
- 	[mips*], [ARCHTYPE="mips"],
- 	[tile*], [ARCHTYPE="gcc"],
- 	[ARCHTYPE="unknown"]
diff --git a/meta/recipes-support/liburcu/liburcu_0.8.7.bb b/meta/recipes-support/liburcu/liburcu_0.9.1.bb
similarity index 61%
rename from meta/recipes-support/liburcu/liburcu_0.8.7.bb
rename to meta/recipes-support/liburcu/liburcu_0.9.1.bb
index a7f4f51..39348d7 100644
--- a/meta/recipes-support/liburcu/liburcu_0.8.7.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.9.1.bb
@@ -5,16 +5,13 @@ BUGTRACKER = "http://lttng.org/project/issues"
 LICENSE = "LGPLv2.1+ & MIT-style"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
                     file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
-                    file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=220552f72c55b102f2ee35929734ef42"
+                    file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=58e50bbd8a2f073bb5500e6554af0d0b"
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
-           file://Revert-Blacklist-ARM-gcc-4.8.0-4.8.1-4.8.2.patch \
-           file://aarch64.patch \
-           file://0001-uatomic-Specify-complete-types-for-atomic-function-c.patch \
           "
 
-SRC_URI[md5sum] = "7a6ee17871d31226db3f618e28351d22"
-SRC_URI[sha256sum] = "b523f22c4726ca6bb77a77d258e76d8c33c89724433bd65313024b98e55c4295"
+SRC_URI[md5sum] = "124eaeea06863271c0bdf2a0cc1d8e4b"
+SRC_URI[sha256sum] = "f8d278e9d95bec97c9ba954fc4c3fb584936bc0010713a8fe358b916bafd8715"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.6.2


