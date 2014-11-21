Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 95BDE6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 17:20:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Nov 2014 09:20:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,432,1413270000"; d="scan'208";a="626293801"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.72])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2014 09:20:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2014 09:20:14 -0800
Message-Id: <4cfb722b75d813b1e3ef66e137055baa9b413b9e.1416590209.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1416590209.git.sgw@linux.intel.com>
References: <cover.1416590209.git.sgw@linux.intel.com>
In-Reply-To: <cover.1416590209.git.sgw@linux.intel.com>
References: <cover.1416590209.git.sgw@linux.intel.com>
Subject: [PATCH 4/7] boost: Upgrade to 1.57
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
X-List-Received-Date: Fri, 21 Nov 2014 17:20:24 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...bjam-native_1.56.0.bb => bjam-native_1.57.0.bb} |   0
 .../boost/{boost-1.56.0.inc => boost-1.57.0.inc}   |   4 +-
 ...rt-for-extending-operations-to-GCC-atomic.patch | 412 ---------------------
 .../boost/{boost_1.56.0.bb => boost_1.57.0.bb}     |   1 -
 4 files changed, 2 insertions(+), 415 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.56.0.bb => bjam-native_1.57.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.56.0.inc => boost-1.57.0.inc} (83%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-Added-support-for-extending-operations-to-GCC-atomic.patch
 rename meta/recipes-support/boost/{boost_1.56.0.bb => boost_1.57.0.bb} (50%)

diff --git a/meta/recipes-support/boost/bjam-native_1.56.0.bb b/meta/recipes-support/boost/bjam-native_1.57.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.56.0.bb
rename to meta/recipes-support/boost/bjam-native_1.57.0.bb
diff --git a/meta/recipes-support/boost/boost-1.56.0.inc b/meta/recipes-support/boost/boost-1.57.0.inc
similarity index 83%
rename from meta/recipes-support/boost/boost-1.56.0.inc
rename to meta/recipes-support/boost/boost-1.57.0.inc
index 24c32b4..809419d 100644
--- a/meta/recipes-support/boost/boost-1.56.0.inc
+++ b/meta/recipes-support/boost/boost-1.57.0.inc
@@ -13,7 +13,7 @@ BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2"
 
-SRC_URI[md5sum] = "a744cf167b05d72335f27c88115f211d"
-SRC_URI[sha256sum] = "134732acaf3a6e7eba85988118d943f0fa6b7f0850f65131fff89823ad30ff1d"
+SRC_URI[md5sum] = "1be49befbdd9a5ce9def2983ba3e7b76"
+SRC_URI[sha256sum] = "910c8c022a33ccec7f088bd65d4f14b466588dda94ba2124e78b8c57db264967"
 
 S = "${WORKDIR}/${BOOST_P}"
diff --git a/meta/recipes-support/boost/boost/0001-Added-support-for-extending-operations-to-GCC-atomic.patch b/meta/recipes-support/boost/boost/0001-Added-support-for-extending-operations-to-GCC-atomic.patch
deleted file mode 100644
index feece81..0000000
--- a/meta/recipes-support/boost/boost/0001-Added-support-for-extending-operations-to-GCC-atomic.patch
+++ /dev/null
@@ -1,412 +0,0 @@
-From 415db7054723291042e4ff1ffa8fdd5bc8b07163 Mon Sep 17 00:00:00 2001
-From: Andrey Semashev <andrey.semashev@gmail.com>
-Date: Sat, 27 Sep 2014 20:40:09 +0400
-Subject: [PATCH] Added support for extending operations to GCC atomic backend.
-
-Fix for #10446. Some platforms (e.g. Raspberry Pi) only support atomic ops of some particular size but not less. Use extending arithmetic operations for these platforms. Also, make sure bools are always treated as 8-bit values, even if the actual type is larger. This makes its use in atomic<>, atomic_flag and lock pool more consistent.
-
-Upstream-Status: Backport [https://svn.boost.org/trac/boost/ticket/10446]
-Signed-off-by: Peter A. Bigot <pab@pabigot.com>
-
----
- include/boost/atomic/capabilities.hpp           |   1 +
- include/boost/atomic/detail/atomic_template.hpp |   2 +-
- include/boost/atomic/detail/caps_gcc_atomic.hpp |  82 +++++------
- include/boost/atomic/detail/ops_gcc_atomic.hpp  | 184 +++++++++++++++++++++---
- 4 files changed, 206 insertions(+), 63 deletions(-)
-
-diff --git a/include/boost/atomic/capabilities.hpp b/include/boost/atomic/capabilities.hpp
-index 658dd22..05bbb0f 100644
---- a/include/boost/atomic/capabilities.hpp
-+++ b/include/boost/atomic/capabilities.hpp
-@@ -142,6 +142,7 @@
- #define BOOST_ATOMIC_ADDRESS_LOCK_FREE BOOST_ATOMIC_POINTER_LOCK_FREE
- 
- #ifndef BOOST_ATOMIC_BOOL_LOCK_FREE
-+// We store bools in 1-byte storage in all backends
- #define BOOST_ATOMIC_BOOL_LOCK_FREE BOOST_ATOMIC_INT8_LOCK_FREE
- #endif
- 
-diff --git a/include/boost/atomic/detail/atomic_template.hpp b/include/boost/atomic/detail/atomic_template.hpp
-index 4fd6d79..bc3922a 100644
---- a/include/boost/atomic/detail/atomic_template.hpp
-+++ b/include/boost/atomic/detail/atomic_template.hpp
-@@ -234,7 +234,7 @@ class base_atomic< bool, int >
- {
- private:
-     typedef bool value_type;
--    typedef atomics::detail::operations< storage_size_of< value_type >::value, false > operations;
-+    typedef atomics::detail::operations< 1u, false > operations;
- 
- protected:
-     typedef value_type value_arg_type;
-diff --git a/include/boost/atomic/detail/caps_gcc_atomic.hpp b/include/boost/atomic/detail/caps_gcc_atomic.hpp
-index 8299ad0..f4e7a70 100644
---- a/include/boost/atomic/detail/caps_gcc_atomic.hpp
-+++ b/include/boost/atomic/detail/caps_gcc_atomic.hpp
-@@ -29,66 +29,48 @@
- #define BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B 1
- #endif
- 
--#if __GCC_ATOMIC_BOOL_LOCK_FREE == 2
--#define BOOST_ATOMIC_FLAG_LOCK_FREE 2
--#else
--#define BOOST_ATOMIC_FLAG_LOCK_FREE 0
--#endif
--#if __GCC_ATOMIC_CHAR_LOCK_FREE == 2
--#define BOOST_ATOMIC_CHAR_LOCK_FREE 2
--#else
--#define BOOST_ATOMIC_CHAR_LOCK_FREE 0
--#endif
--#if __GCC_ATOMIC_CHAR16_T_LOCK_FREE == 2
--#define BOOST_ATOMIC_CHAR16_T_LOCK_FREE 2
--#else
--#define BOOST_ATOMIC_CHAR16_T_LOCK_FREE 0
--#endif
--#if __GCC_ATOMIC_CHAR32_T_LOCK_FREE == 2
--#define BOOST_ATOMIC_CHAR32_T_LOCK_FREE 2
-+#if defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B) && (defined(BOOST_HAS_INT128) || !defined(BOOST_NO_ALIGNMENT))
-+#define BOOST_ATOMIC_INT128_LOCK_FREE 2
- #else
--#define BOOST_ATOMIC_CHAR32_T_LOCK_FREE 0
-+#define BOOST_ATOMIC_INT128_LOCK_FREE 0
- #endif
--#if __GCC_ATOMIC_WCHAR_T_LOCK_FREE == 2
--#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE 2
-+
-+#if __GCC_ATOMIC_LLONG_LOCK_FREE == 2
-+#define BOOST_ATOMIC_LLONG_LOCK_FREE 2
- #else
--#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE 0
-+#define BOOST_ATOMIC_LLONG_LOCK_FREE BOOST_ATOMIC_INT128_LOCK_FREE
- #endif
--#if __GCC_ATOMIC_SHORT_LOCK_FREE == 2
--#define BOOST_ATOMIC_SHORT_LOCK_FREE 2
-+
-+#if __GCC_ATOMIC_LONG_LOCK_FREE == 2
-+#define BOOST_ATOMIC_LONG_LOCK_FREE 2
- #else
--#define BOOST_ATOMIC_SHORT_LOCK_FREE 0
-+#define BOOST_ATOMIC_LONG_LOCK_FREE BOOST_ATOMIC_LLONG_LOCK_FREE
- #endif
-+
- #if __GCC_ATOMIC_INT_LOCK_FREE == 2
- #define BOOST_ATOMIC_INT_LOCK_FREE 2
- #else
--#define BOOST_ATOMIC_INT_LOCK_FREE 0
--#endif
--#if __GCC_ATOMIC_LONG_LOCK_FREE == 2
--#define BOOST_ATOMIC_LONG_LOCK_FREE 2
--#else
--#define BOOST_ATOMIC_LONG_LOCK_FREE 0
-+#define BOOST_ATOMIC_INT_LOCK_FREE BOOST_ATOMIC_LONG_LOCK_FREE
- #endif
--#if __GCC_ATOMIC_LLONG_LOCK_FREE == 2
--#define BOOST_ATOMIC_LLONG_LOCK_FREE 2
-+
-+#if __GCC_ATOMIC_SHORT_LOCK_FREE == 2
-+#define BOOST_ATOMIC_SHORT_LOCK_FREE 2
- #else
--#define BOOST_ATOMIC_LLONG_LOCK_FREE 0
-+#define BOOST_ATOMIC_SHORT_LOCK_FREE BOOST_ATOMIC_INT_LOCK_FREE
- #endif
--#if defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B) && (defined(BOOST_HAS_INT128) || !defined(BOOST_NO_ALIGNMENT))
--#define BOOST_ATOMIC_INT128_LOCK_FREE 2
-+
-+#if __GCC_ATOMIC_CHAR_LOCK_FREE == 2
-+#define BOOST_ATOMIC_CHAR_LOCK_FREE 2
- #else
--#define BOOST_ATOMIC_INT128_LOCK_FREE 0
-+#define BOOST_ATOMIC_CHAR_LOCK_FREE BOOST_ATOMIC_SHORT_LOCK_FREE
- #endif
-+
- #if __GCC_ATOMIC_POINTER_LOCK_FREE == 2
- #define BOOST_ATOMIC_POINTER_LOCK_FREE 2
- #else
- #define BOOST_ATOMIC_POINTER_LOCK_FREE 0
- #endif
--#if __GCC_ATOMIC_BOOL_LOCK_FREE == 2
--#define BOOST_ATOMIC_BOOL_LOCK_FREE 2
--#else
--#define BOOST_ATOMIC_BOOL_LOCK_FREE 0
--#endif
-+
- 
- #define BOOST_ATOMIC_INT8_LOCK_FREE BOOST_ATOMIC_CHAR_LOCK_FREE
- 
-@@ -128,6 +110,24 @@
- #define BOOST_ATOMIC_INT64_LOCK_FREE 0
- #endif
- 
-+
-+#if __GCC_ATOMIC_WCHAR_T_LOCK_FREE == 2
-+#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE 2
-+#elif BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 8
-+#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE BOOST_ATOMIC_INT64_LOCK_FREE
-+#elif BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 4
-+#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE BOOST_ATOMIC_INT32_LOCK_FREE
-+#elif BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 2
-+#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE BOOST_ATOMIC_INT16_LOCK_FREE
-+#elif BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 1
-+#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE BOOST_ATOMIC_INT8_LOCK_FREE
-+#else
-+#define BOOST_ATOMIC_WCHAR_T_LOCK_FREE 0
-+#endif
-+
-+#define BOOST_ATOMIC_CHAR32_T_LOCK_FREE BOOST_ATOMIC_INT32_LOCK_FREE
-+#define BOOST_ATOMIC_CHAR16_T_LOCK_FREE BOOST_ATOMIC_INT16_LOCK_FREE
-+
- #define BOOST_ATOMIC_THREAD_FENCE 2
- #define BOOST_ATOMIC_SIGNAL_FENCE 2
- 
-diff --git a/include/boost/atomic/detail/ops_gcc_atomic.hpp b/include/boost/atomic/detail/ops_gcc_atomic.hpp
-index 2297791..2e4c37b 100644
---- a/include/boost/atomic/detail/ops_gcc_atomic.hpp
-+++ b/include/boost/atomic/detail/ops_gcc_atomic.hpp
-@@ -24,6 +24,15 @@
- #include <boost/atomic/detail/ops_cas_based.hpp>
- #endif
- 
-+#if __GCC_ATOMIC_LLONG_LOCK_FREE != BOOST_ATOMIC_LLONG_LOCK_FREE || __GCC_ATOMIC_LONG_LOCK_FREE != BOOST_ATOMIC_LONG_LOCK_FREE ||\
-+    __GCC_ATOMIC_INT_LOCK_FREE != BOOST_ATOMIC_INT_LOCK_FREE || __GCC_ATOMIC_SHORT_LOCK_FREE != BOOST_ATOMIC_SHORT_LOCK_FREE ||\
-+    __GCC_ATOMIC_CHAR_LOCK_FREE != BOOST_ATOMIC_CHAR_LOCK_FREE || __GCC_ATOMIC_BOOL_LOCK_FREE != BOOST_ATOMIC_BOOL_LOCK_FREE ||\
-+    __GCC_ATOMIC_WCHAR_T_LOCK_FREE != BOOST_ATOMIC_WCHAR_T_LOCK_FREE
-+// There are platforms where we need to use larger storage types
-+#include <boost/atomic/detail/int_sizes.hpp>
-+#include <boost/atomic/detail/ops_extending_cas_based.hpp>
-+#endif
-+
- #ifdef BOOST_HAS_PRAGMA_ONCE
- #pragma once
- #endif
-@@ -154,73 +163,206 @@ struct gcc_atomic_operations
-     }
- };
- 
--#if BOOST_ATOMIC_INT8_LOCK_FREE > 0
-+#if BOOST_ATOMIC_INT128_LOCK_FREE > 0
-+#if defined(__clang__) && defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B)
-+
-+// Workaround for clang bug: http://llvm.org/bugs/show_bug.cgi?id=19149
-+// Clang 3.4 does not implement 128-bit __atomic* intrinsics even though it defines __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16
- template< bool Signed >
--struct operations< 1u, Signed > :
--    public gcc_atomic_operations< typename make_storage_type< 1u, Signed >::type >
-+struct operations< 16u, Signed > :
-+    public cas_based_operations< gcc_dcas_x86_64< Signed > >
- {
- };
-+
-+#else
-+
-+template< bool Signed >
-+struct operations< 16u, Signed > :
-+    public gcc_atomic_operations< typename make_storage_type< 16u, Signed >::type >
-+{
-+};
-+
-+#endif
- #endif
- 
--#if BOOST_ATOMIC_INT16_LOCK_FREE > 0
-+
-+#if BOOST_ATOMIC_INT64_LOCK_FREE > 0
-+#if defined(__clang__) && defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG8B)
-+
-+// Workaround for clang bug http://llvm.org/bugs/show_bug.cgi?id=19355
- template< bool Signed >
--struct operations< 2u, Signed > :
--    public gcc_atomic_operations< typename make_storage_type< 2u, Signed >::type >
-+struct operations< 8u, Signed > :
-+    public cas_based_operations< gcc_dcas_x86< Signed > >
-+{
-+};
-+
-+#elif (BOOST_ATOMIC_DETAIL_SIZEOF_LLONG == 8 && __GCC_ATOMIC_LLONG_LOCK_FREE != BOOST_ATOMIC_LLONG_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_LONG == 8 && __GCC_ATOMIC_LONG_LOCK_FREE != BOOST_ATOMIC_LONG_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_INT == 8 && __GCC_ATOMIC_INT_LOCK_FREE != BOOST_ATOMIC_INT_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_SHORT == 8 && __GCC_ATOMIC_SHORT_LOCK_FREE != BOOST_ATOMIC_SHORT_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 8 && __GCC_ATOMIC_WCHAR_T_LOCK_FREE != BOOST_ATOMIC_WCHAR_T_LOCK_FREE)
-+
-+#define BOOST_ATOMIC_DETAIL_INT64_EXTENDED
-+
-+template< bool Signed >
-+struct operations< 8u, Signed > :
-+    public extending_cas_based_operations< gcc_atomic_operations< typename make_storage_type< 16u, Signed >::type >, 8u, Signed >
- {
- };
-+
-+#else
-+
-+template< bool Signed >
-+struct operations< 8u, Signed > :
-+    public gcc_atomic_operations< typename make_storage_type< 8u, Signed >::type >
-+{
-+};
-+
-+#endif
- #endif
- 
- #if BOOST_ATOMIC_INT32_LOCK_FREE > 0
-+#if (BOOST_ATOMIC_DETAIL_SIZEOF_LLONG == 4 && __GCC_ATOMIC_LLONG_LOCK_FREE != BOOST_ATOMIC_LLONG_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_LONG == 4 && __GCC_ATOMIC_LONG_LOCK_FREE != BOOST_ATOMIC_LONG_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_INT == 4 && __GCC_ATOMIC_INT_LOCK_FREE != BOOST_ATOMIC_INT_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_SHORT == 4 && __GCC_ATOMIC_SHORT_LOCK_FREE != BOOST_ATOMIC_SHORT_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 4 && __GCC_ATOMIC_WCHAR_T_LOCK_FREE != BOOST_ATOMIC_WCHAR_T_LOCK_FREE)
-+
-+#define BOOST_ATOMIC_DETAIL_INT32_EXTENDED
-+
-+#if !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)
-+
-+template< bool Signed >
-+struct operations< 4u, Signed > :
-+    public extending_cas_based_operations< gcc_atomic_operations< typename make_storage_type< 8u, Signed >::type >, 4u, Signed >
-+{
-+};
-+
-+#else // !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)
-+
-+template< bool Signed >
-+struct operations< 4u, Signed > :
-+    public extending_cas_based_operations< gcc_atomic_operations< typename make_storage_type< 16u, Signed >::type >, 4u, Signed >
-+{
-+};
-+
-+#endif // !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)
-+
-+#else
-+
- template< bool Signed >
- struct operations< 4u, Signed > :
-     public gcc_atomic_operations< typename make_storage_type< 4u, Signed >::type >
- {
- };
-+
-+#endif
- #endif
- 
--#if BOOST_ATOMIC_INT64_LOCK_FREE > 0
--#if defined(__clang__) && defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG8B)
-+#if BOOST_ATOMIC_INT16_LOCK_FREE > 0
-+#if (BOOST_ATOMIC_DETAIL_SIZEOF_LLONG == 2 && __GCC_ATOMIC_LLONG_LOCK_FREE != BOOST_ATOMIC_LLONG_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_LONG == 2 && __GCC_ATOMIC_LONG_LOCK_FREE != BOOST_ATOMIC_LONG_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_INT == 2 && __GCC_ATOMIC_INT_LOCK_FREE != BOOST_ATOMIC_INT_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_SHORT == 2 && __GCC_ATOMIC_SHORT_LOCK_FREE != BOOST_ATOMIC_SHORT_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 2 && __GCC_ATOMIC_WCHAR_T_LOCK_FREE != BOOST_ATOMIC_WCHAR_T_LOCK_FREE)
-+
-+#define BOOST_ATOMIC_DETAIL_INT16_EXTENDED
-+
-+#if !defined(BOOST_ATOMIC_DETAIL_INT32_EXTENDED)
- 
--// Workaround for clang bug http://llvm.org/bugs/show_bug.cgi?id=19355
- template< bool Signed >
--struct operations< 8u, Signed > :
--    public cas_based_operations< gcc_dcas_x86< Signed > >
-+struct operations< 2u, Signed > :
-+    public extending_cas_based_operations< gcc_atomic_operations< typename make_storage_type< 4u, Signed >::type >, 2u, Signed >
-+{
-+};
-+
-+#elif !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)
-+
-+template< bool Signed >
-+struct operations< 2u, Signed > :
-+    public extending_cas_based_operations< gcc_atomic_operations< typename make_storage_type< 8u, Signed >::type >, 2u, Signed >
- {
- };
- 
- #else
- 
- template< bool Signed >
--struct operations< 8u, Signed > :
--    public gcc_atomic_operations< typename make_storage_type< 8u, Signed >::type >
-+struct operations< 2u, Signed > :
-+    public extending_cas_based_operations< gcc_atomic_operations< typename make_storage_type< 16u, Signed >::type >, 2u, Signed >
-+{
-+};
-+
-+#endif
-+
-+#else
-+
-+template< bool Signed >
-+struct operations< 2u, Signed > :
-+    public gcc_atomic_operations< typename make_storage_type< 2u, Signed >::type >
- {
- };
- 
- #endif
- #endif
- 
--#if BOOST_ATOMIC_INT128_LOCK_FREE > 0
--#if defined(__clang__) && defined(BOOST_ATOMIC_DETAIL_X86_HAS_CMPXCHG16B)
-+#if BOOST_ATOMIC_INT8_LOCK_FREE > 0
-+#if (BOOST_ATOMIC_DETAIL_SIZEOF_LLONG == 1 && __GCC_ATOMIC_LLONG_LOCK_FREE != BOOST_ATOMIC_LLONG_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_LONG == 1 && __GCC_ATOMIC_LONG_LOCK_FREE != BOOST_ATOMIC_LONG_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_INT == 1 && __GCC_ATOMIC_INT_LOCK_FREE != BOOST_ATOMIC_INT_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_SHORT == 1 && __GCC_ATOMIC_SHORT_LOCK_FREE != BOOST_ATOMIC_SHORT_LOCK_FREE) ||\
-+    (BOOST_ATOMIC_DETAIL_SIZEOF_WCHAR_T == 1 && __GCC_ATOMIC_WCHAR_T_LOCK_FREE != BOOST_ATOMIC_WCHAR_T_LOCK_FREE) ||\
-+    (__GCC_ATOMIC_CHAR_LOCK_FREE != BOOST_ATOMIC_CHAR_LOCK_FREE) ||\
-+    (__GCC_ATOMIC_BOOL_LOCK_FREE != BOOST_ATOMIC_BOOL_LOCK_FREE)
-+
-+#if !defined(BOOST_ATOMIC_DETAIL_INT16_EXTENDED)
- 
--// Workaround for clang bug: http://llvm.org/bugs/show_bug.cgi?id=19149
--// Clang 3.4 does not implement 128-bit __atomic* intrinsics even though it defines __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16
- template< bool Signed >
--struct operations< 16u, Signed > :
--    public cas_based_operations< gcc_dcas_x86_64< Signed > >
-+struct operations< 1u, Signed > :
-+    public extending_cas_based_operations< gcc_atomic_operations< typename make_storage_type< 2u, Signed >::type >, 1u, Signed >
-+{
-+};
-+
-+#elif !defined(BOOST_ATOMIC_DETAIL_INT32_EXTENDED)
-+
-+template< bool Signed >
-+struct operations< 1u, Signed > :
-+    public extending_cas_based_operations< gcc_atomic_operations< typename make_storage_type< 4u, Signed >::type >, 1u, Signed >
-+{
-+};
-+
-+#elif !defined(BOOST_ATOMIC_DETAIL_INT64_EXTENDED)
-+
-+template< bool Signed >
-+struct operations< 1u, Signed > :
-+    public extending_cas_based_operations< gcc_atomic_operations< typename make_storage_type< 8u, Signed >::type >, 1u, Signed >
- {
- };
- 
- #else
- 
- template< bool Signed >
--struct operations< 16u, Signed > :
--    public gcc_atomic_operations< typename make_storage_type< 16u, Signed >::type >
-+struct operations< 1u, Signed > :
-+    public extending_cas_based_operations< gcc_atomic_operations< typename make_storage_type< 16u, Signed >::type >, 1u, Signed >
-+{
-+};
-+
-+#endif
-+
-+#else
-+
-+template< bool Signed >
-+struct operations< 1u, Signed > :
-+    public gcc_atomic_operations< typename make_storage_type< 1u, Signed >::type >
- {
- };
- 
- #endif
- #endif
- 
-+#undef BOOST_ATOMIC_DETAIL_INT16_EXTENDED
-+#undef BOOST_ATOMIC_DETAIL_INT32_EXTENDED
-+#undef BOOST_ATOMIC_DETAIL_INT64_EXTENDED
-+
- BOOST_FORCEINLINE void thread_fence(memory_order order) BOOST_NOEXCEPT
- {
-     __atomic_thread_fence(atomics::detail::convert_memory_order_to_gcc(order));
--- 
-1.8.5.5
-
diff --git a/meta/recipes-support/boost/boost_1.56.0.bb b/meta/recipes-support/boost/boost_1.57.0.bb
similarity index 50%
rename from meta/recipes-support/boost/boost_1.56.0.bb
rename to meta/recipes-support/boost/boost_1.57.0.bb
index dcc77bb..c09d5f4 100644
--- a/meta/recipes-support/boost/boost_1.56.0.bb
+++ b/meta/recipes-support/boost/boost_1.57.0.bb
@@ -3,5 +3,4 @@ include boost.inc
 
 SRC_URI += "\
     file://arm-intrinsics.patch \
-    file://0001-Added-support-for-extending-operations-to-GCC-atomic.patch;striplevel=2 \
 "
-- 
1.8.3.1


