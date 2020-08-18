Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.63207.1597745059007340511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 03:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 07IA4IAT003612
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 03:04:18 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 18 Aug 2020 03:03:59 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V5] libffi: fix multilib header conflict
Date: Tue, 18 Aug 2020 17:59:01 +0800
Message-ID: <20200818095902.1768116-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error:
file /usr/include/ffitarget.h conflicts between attempted installs of lib32-libffi-dev-3.3-r0.armv7vet2hf_vfp and libffi-dev-3.3-r0.cortexa57

part of diff
 
#ifndef LIBFFI_ASM
-typedef unsigned long          ffi_arg;
-typedef signed long            ffi_sarg;
-
-typedef enum ffi_abi {
-  FFI_FIRST_ABI = 0,
-  FFI_SYSV,
-  FFI_VFP,
-  FFI_LAST_ABI,
-#if defined(__ARM_PCS_VFP) || defined(_M_ARM)
-  FFI_DEFAULT_ABI = FFI_VFP,
+#ifdef __ILP32__
+#define FFI_SIZEOF_ARG 8
+#define FFI_SIZEOF_JAVA_RAW  4
+typedef unsigned long long ffi_arg;
+typedef signed long long ffi_sarg;
+#elif defined(_M_ARM64)
+#define FFI_SIZEOF_ARG 8
+typedef unsigned long long ffi_arg;
+typedef signed long long ffi_sarg;
 #else
-  FFI_DEFAULT_ABI = FFI_SYSV,
-#endif
-} ffi_abi;
+typedef unsigned long ffi_arg;
+typedef signed long ffi_sarg;
 #endif

-#define FFI_EXTRA_CIF_FIELDS			\
-  int vfp_used;					\
-  unsigned short vfp_reg_free, vfp_nargs;	\
-  signed char vfp_args[16]			\
-
-#define FFI_TARGET_SPECIFIC_VARIADIC
-#ifndef _M_ARM
-#define FFI_TARGET_HAS_COMPLEX_TYPE
+typedef enum ffi_abi
+  {
+    FFI_FIRST_ABI = 0,
+    FFI_SYSV,
+    FFI_LAST_ABI,
+    FFI_DEFAULT_ABI = FFI_SYSV
+  } ffi_abi;
 #endif

 /* ---- Definitions for closures ----------------------------------------- */

 #define FFI_CLOSURES 1
-#define FFI_GO_CLOSURES 1
 #define FFI_NATIVE_RAW_API 0

 #if defined (FFI_EXEC_TRAMPOLINE_TABLE) && FFI_EXEC_TRAMPOLINE_TABLE

 #ifdef __MACH__
-#define FFI_TRAMPOLINE_SIZE 12
-#define FFI_TRAMPOLINE_CLOSURE_OFFSET 8
+#define FFI_TRAMPOLINE_SIZE 16
+#define FFI_TRAMPOLINE_CLOSURE_OFFSET 16
 #else
 #error "No trampoline table implementation"
 #endif

 #else
-#ifdef _MSC_VER
-#define FFI_TRAMPOLINE_SIZE 16
-#define FFI_TRAMPOLINE_CLOSURE_FUNCTION 12
-#else
-#define FFI_TRAMPOLINE_SIZE 12
-#endif
+#define FFI_TRAMPOLINE_SIZE 24
 #define FFI_TRAMPOLINE_CLOSURE_OFFSET FFI_TRAMPOLINE_SIZE
 #endif

+#ifdef _M_ARM64
+#define FFI_EXTRA_CIF_FIELDS unsigned is_variadic
+#endif
+

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/libffi/libffi_3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libffi/libffi_3.3.bb b/meta/recipes-support/libffi/libffi_3.3.bb
index e5beb985c6..9dfdb9e39b 100644
--- a/meta/recipes-support/libffi/libffi_3.3.bb
+++ b/meta/recipes-support/libffi/libffi_3.3.bb
@@ -28,7 +28,7 @@ EXTRA_OEMAKE_class-target = "LIBTOOLFLAGS='--tag=CC'"
 inherit autotools texinfo multilib_header
 
 do_install_append() {
-	oe_multilib_header ffi.h
+	oe_multilib_header ffi.h ffitarget.h
 }
 
 FILES_${PN}-dev += "${libdir}/libffi-${PV}"
-- 
2.17.1

