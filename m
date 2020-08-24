Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.197063.1598282145230257997
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rMhfWF2J;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id j13so4380662pjd.4
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=eFNdKJTzo8qFYQukjXCupOu1+cGKCTj+Cz1oZ8Ez5pI=;
        b=rMhfWF2JHKh03OO2qNcGNMJYTHLsM/a7ZzxReQRZH2bRO/Xjc/eYC4HGefeXdKtZN3
         Dl+tV0Zuf3rgFErtindE5esmMNjN9Nmrnccu/8vw+rCPt2YhccS6NkbchVhhAfHTyomO
         2c3NeRHR07p/VFfpV0WCjRbO/D1kiOY3YoyldywEnCx/SBSPKNdocn84Q4p9PjgpXQkc
         A09Srs/LDSaV1kxnTRTbeSPZStbs3vrbYq+PzgkfoUwfaPkI5IhbTy/CYEBckssvU7jg
         sEfgXDFVlYr09NFXhahslGgAgkiNzGuP6fMwhTuhvuJqJnesZThyI7SZx95BaPE76ISP
         q7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=eFNdKJTzo8qFYQukjXCupOu1+cGKCTj+Cz1oZ8Ez5pI=;
        b=jBvn2PU3cwgnBcGGmIvE8ewjdOsVuPX1bReWcE7bxyKu0XCw9A61N5RiTGNTOqPqsT
         6FJxbNfeN2opijSlxUaF4IJKeHS8hIwkHHz/ofnoz9MMvrFlVzRuvVfwkFgLtJno/BHK
         9RhZzhy7Ldji+dXvcZghdigZJs8aiL9Yi5qZMwBTZ7yh5XQ1emc3pg5kLcE6YlqMDKXf
         9aX3If6OsjN0HTOpr3IlPP6tn14JG5AreOYYLVId/cqUIfyTwJ64UMiSDWNeFdJD5lRV
         9TxDzeQ5ANm3/1Cv29J1EPGCBvAVPglOnMySy9Pl4kxXz3RjO0WQe4kMviqDnGBPVmFR
         OFtg==
X-Gm-Message-State: AOAM5306qAu3+DJBJ/YnZQRMrIH+uBJv0cfv82OD4xytto9dohFSLSEG
	/9QjSj/mB7HzhPavj/J1wQioPjCZSH8olTH8YPM=
X-Google-Smtp-Source: ABdhPJwpFzgpux6wiEpq7htgLRuZfLiavevQaH8mpeE329JBTMmV3gVQ8+ynGVb0XW93uTH8bMaj0g==
X-Received: by 2002:a17:902:b497:: with SMTP id y23mr3906525plr.251.1598282144311;
        Mon, 24 Aug 2020 08:15:44 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a13sm11530382pfo.49.2020.08.24.08.15.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:15:43 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/12] libffi: fix multilib header conflict
Date: Mon, 24 Aug 2020 05:14:58 -1000
Message-Id: <6392d99de30e74c41b289c43fd98601e6cbc34ab.1598281931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598281931.git.steve@sakoman.com>
References: <cover.1598281931.git.steve@sakoman.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit efe8d76810973e7032e729beee106b8acc39b8ed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

