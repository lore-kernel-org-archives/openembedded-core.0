Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.36215.1597633292538819651
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 20:01:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 07H30xU1025549
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 20:01:20 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sun, 16 Aug 2020 20:01:08 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] libffi: fix multilib header conflict
Date: Mon, 17 Aug 2020 10:56:15 +0800
Message-ID: <20200817025615.831951-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <162B0F0EED7FC765.20848@lists.openembedded.org>
References: <162B0F0EED7FC765.20848@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix error:
file /usr/include/ffitarget.h conflicts between attempted installs of lib32-libffi-dev-3.3-r0.armv7vet2hf_vfp and libffi-dev-3.3-r0.cortexa57

part of diff of ffitarget-32.h and ffitarget-64.h

< #ifdef __ILP32__
< #define FFI_SIZEOF_ARG 8
< #define FFI_SIZEOF_JAVA_RAW  4
< typedef unsigned long long ffi_arg;
< typedef signed long long ffi_sarg;
< #elif defined(_M_ARM64)
< #define FFI_SIZEOF_ARG 8
< typedef unsigned long long ffi_arg;
< typedef signed long long ffi_sarg;
---
> typedef unsigned long          ffi_arg;
> typedef signed long            ffi_sarg;
>
> typedef enum ffi_abi {
>   FFI_FIRST_ABI = 0,
>   FFI_SYSV,
>   FFI_VFP,
>   FFI_LAST_ABI,
> #if defined(__ARM_PCS_VFP) || defined(_M_ARM)
>   FFI_DEFAULT_ABI = FFI_VFP,
40,41c49,51
< typedef unsigned long ffi_arg;
< typedef signed long ffi_sarg;
---
>   FFI_DEFAULT_ABI = FFI_SYSV,
> #endif
> } ffi_abi;
44,50c54,61
< typedef enum ffi_abi
<   {
<     FFI_FIRST_ABI = 0,
<     FFI_SYSV,
<     FFI_LAST_ABI,
<     FFI_DEFAULT_ABI = FFI_SYSV
<   } ffi_abi;
---
> #define FFI_EXTRA_CIF_FIELDS			\
>   int vfp_used;					\
>   unsigned short vfp_reg_free, vfp_nargs;	\
>   signed char vfp_args[16]			\
>
> #define FFI_TARGET_SPECIFIC_VARIADIC
> #ifndef _M_ARM
> #define FFI_TARGET_HAS_COMPLEX_TYPE
55a67
> #define FFI_GO_CLOSURES 1
61,62c73,74
< #define FFI_TRAMPOLINE_SIZE 16
< #define FFI_TRAMPOLINE_CLOSURE_OFFSET 16
---
> #define FFI_TRAMPOLINE_SIZE 12
> #define FFI_TRAMPOLINE_CLOSURE_OFFSET 8

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
2.26.2

