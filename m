Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FC4C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 23:05:12 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.2604.1676415910410212985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 15:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LYJ2CW7L;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id o18so17379471wrj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 15:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hl8FiFEY37AUXqieVULRlxZbm201Dl8cdfFyN5VRpRU=;
        b=LYJ2CW7Lcde2diaFZNZZ0ixRJ3qeevi6KWFyrdg0aM6isJlAjxQJQ5MV0X9lQUFl6a
         5UUw+rqoOX6j8jtcGD+UjcnOYpLtLZUOfCkyb+F6yI88kpgeeBo1hzWWpoPWEyJQ3hP4
         Q7BKIaZfShkOgZH2RHJFXKGyXzmepU8NJHfyqixwkg7u87O/2t3TH0xV+BU10gJBfM/r
         c8/0ozE9jf+R1idtzyQhXSlJwwoVxKnpOPHp9DkB1j/pkIgJ4jZPWy17RgTh4zUqRch+
         9Q2nDSIDWW5ne9f7+cigPNeIG2zpUipf9GlSPVlVHckx4ZCXvIG692eoct63grhvH5xT
         /M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hl8FiFEY37AUXqieVULRlxZbm201Dl8cdfFyN5VRpRU=;
        b=5C4XX2XPYm5BF75wbOQWZ9yFXaoHDgZdeiI0hfEboePY+X5+FgU9B3USiK5oh0ClVJ
         mkPH2dV36D6TT0vvh1stzl5uxnvXwujLvqjlwM0QODIETPuwU6+Ok+Or5f5yRtT48Red
         VVYFvGmlCOTUTEnVVKuL+l8niUlPALA2oZO0PuKfdVJW2IH69V9kHrtIKbTn2yrmnIQT
         21+5JagDWnACpDtWTTtSeW/3V5+SuEg+yX5bDDewWqFH7dhCt+rFDxNP/WHm5C99fF8x
         xiIcurTB3oGcL5Fqj3X0tixOydWm72/O+sdonOfz/ZYUq27MlIsFgQcvP8oVqRGc8Hep
         hcdg==
X-Gm-Message-State: AO0yUKXD88SfSEGVJZPAQ24/F7fVpuL4tZ/PJjm1RuiFci7vTQnx1JvQ
	36NgGk5UPEAhl4d6kqMonx5PbbHM5QE=
X-Google-Smtp-Source: AK7set+cqJ9sxCrUIva39clJP/BdwQoxXwVoGF9sYMuTouJHQA93u/ZGXEPYIc+Nu6GPIbc4au0ayA==
X-Received: by 2002:adf:e804:0:b0:2c5:5945:ae84 with SMTP id o4-20020adfe804000000b002c55945ae84mr3073708wrm.62.1676415908582;
        Tue, 14 Feb 2023 15:05:08 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j4-20020adff544000000b002c54fb024b2sm8996951wrp.61.2023.02.14.15.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 15:05:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] python3-numpy: upgrade to 1.24.2
Date: Wed, 15 Feb 2023 00:05:03 +0100
Message-Id: <20230214230503.555991-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 23:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177176

* remove patch applied upstream

* FWIW: this version still fails to build with DEBUG_BUILD AND gcc-13 as
  shown in:
  http://errors.yoctoproject.org/Errors/Details/689841/

In file included from TOPDIR/tmp-glibc/work/core2-64-oe-linux/python3-numpy/1.24.1-r0/recipe-sysroot-native/usr/lib/x86_64-oe-linux/gcc/x86_64-oe-linux/13.0.1/include/immintrin.h:57,
                 from TOPDIR/tmp-glibc/work/core2-64-oe-linux/python3-numpy/1.24.1-r0/numpy-1.24.1/numpy/distutils/checks/cpu_avx512_knl.c:14:
In function '_mm512_mask_prefetch_i64scatter_pd',
    inlined from 'main' at TOPDIR/tmp-glibc/work/core2-64-oe-linux/python3-numpy/1.24.1-r0/numpy-1.24.1/numpy/distutils/checks/cpu_avx512_knl.c:23:5:
TOPDIR/tmp-glibc/work/core2-64-oe-linux/python3-numpy/1.24.1-r0/recipe-sysroot-native/usr/lib/x86_64-oe-linux/gcc/x86_64-oe-linux/13.0.1/include/avx512pfintrin.h:180:3: error: 'base' may be used uninitialized [-Werror=maybe-uninitialized]
  180 |   __builtin_ia32_scatterpfqpd (__mask, (__v8di) __index, __addr, __scale,
      |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  181 |                                __hint);
      |                                ~~~~~~~
<built-in>: In function 'main':
<built-in>: note: by argument 3 of type 'const void *' to '__builtin_ia32_scatterpfqpd' declared here
TOPDIR/tmp-glibc/work/core2-64-oe-linux/python3-numpy/1.24.1-r0/numpy-1.24.1/numpy/distutils/checks/cpu_avx512_knl.c:18:9: note: 'base' declared here
   18 |     int base[128];
      |         ^~~~

In file included from TOPDIR/tmp-glibc/work/core2-64-oe-linux/python3-numpy/1.24.1-r0/recipe-sysroot-native/usr/lib/x86_64-oe-linux/gcc/x86_64-oe-linux/13.0.1/include/immintrin.h:53,
                 from numpy/core/src/umath/simd.inc.src:25:
TOPDIR/tmp-glibc/work/core2-64-oe-linux/python3-numpy/1.24.1-r0/recipe-sysroot-native/usr/lib/x86_64-oe-linux/gcc/x86_64-oe-linux/13.0.1/include/avx512fintrin.h: In function 'AVX512F_square_CFLOAT':
TOPDIR/tmp-glibc/work/core2-64-oe-linux/python3-numpy/1.24.1-r0/recipe-sysroot-native/usr/lib/x86_64-oe-linux/gcc/x86_64-oe-linux/13.0.1/include/avx512fintrin.h:314:1: error: inlining failed in call to 'always_inline' '_mm512_setzero_ps': target specific option mismatch
  314 | _mm512_setzero_ps (void)
      | ^~~~~~~~~~~~~~~~~
numpy/core/src/umath/simd.inc.src:977:20: note: called from here
  977 |     @vtype@ zeros = _mm512_setzero_@vsuffix@();
      |                    ^~~~~~~~~~~~~~~~~~~
numpy/core/src/umath/simd.inc.src:596:1: error: inlining failed in call to 'always_inline' 'avx512_get_full_load_mask_ps': target specific option mismatch
  596 | avx512_get_full_load_mask_ps(void)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

It will be probably resolved in next release from 1.25 as whole simd.inc.src was removed in:
https://github.com/numpy/numpy/commit/640e85017aa8eac3e9be68b475acf27d623b16b7
but this PR https://github.com/numpy/numpy/pull/21056 wasn't backported
to maintenance/1.24.x and probably isn't worth backporting now as
neither DEBUG_BUILD is enabled by default nor gcc-13 merged in oe-core,
and the changes don't backport cleanly.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ing-_Alignof-when-using-C11-or-newer.patch | 77 -------------------
 ...umpy_1.24.1.bb => python3-numpy_1.24.2.bb} |  3 +-
 2 files changed, 1 insertion(+), 79 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-numpy/0001-Define-_ALIGN-using-_Alignof-when-using-C11-or-newer.patch
 rename meta/recipes-devtools/python/{python3-numpy_1.24.1.bb => python3-numpy_1.24.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Define-_ALIGN-using-_Alignof-when-using-C11-or-newer.patch b/meta/recipes-devtools/python/python3-numpy/0001-Define-_ALIGN-using-_Alignof-when-using-C11-or-newer.patch
deleted file mode 100644
index 97391e2c12..0000000000
--- a/meta/recipes-devtools/python/python3-numpy/0001-Define-_ALIGN-using-_Alignof-when-using-C11-or-newer.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From f9ac08a0fea543d68b2dba540093bd079e50be47 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Jan 2023 15:49:09 -0800
-Subject: [PATCH] Define _ALIGN using _Alignof when using C11 or newer
-
-WG14 N2350 made very clear that it is an UB having type definitions
-within "offsetof" [1]. This patch enhances the implementation of macro
-_ALIGN to use builtin "_Alignof" to avoid undefined behavior on
-when using std=c11 or newer
-
-clang 16+ has started to flag this [2]
-
-Fixes build when using -std >= gnu11 and using clang16+
-
-Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
-may support C11, exclude those compilers too
-
-[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
-[2] https://reviews.llvm.org/D133574
-
-Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/23016]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- numpy/core/src/multiarray/arraytypes.c.src | 13 +++++++++++--
- numpy/core/src/multiarray/common.h         | 12 +++++++++++-
- 2 files changed, 22 insertions(+), 3 deletions(-)
-
-diff --git a/numpy/core/src/multiarray/arraytypes.c.src b/numpy/core/src/multiarray/arraytypes.c.src
-index c03d09784..683917220 100644
---- a/numpy/core/src/multiarray/arraytypes.c.src
-+++ b/numpy/core/src/multiarray/arraytypes.c.src
-@@ -224,8 +224,17 @@ MyPyLong_AsUnsigned@Type@(PyObject *obj)
-  **                         GETITEM AND SETITEM                             **
-  *****************************************************************************
-  */
--
--#define _ALIGN(type) offsetof(struct {char c; type v;}, v)
-+/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
-+   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
-+   clang versions < 8.0.0 have the same bug.  */
-+#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
-+     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
-+  && !defined __clang__) \
-+     || (defined __clang__ && __clang_major__ < 8))
-+# define _ALIGN(type) offsetof(struct {char c; type v;}, v)
-+#else
-+# define _ALIGN(type) _Alignof(type)
-+#endif
- /*
-  * Disable harmless compiler warning "4116: unnamed type definition in
-  * parentheses" which is caused by the _ALIGN macro.
-diff --git a/numpy/core/src/multiarray/common.h b/numpy/core/src/multiarray/common.h
-index 3de8c842d..d01074c45 100644
---- a/numpy/core/src/multiarray/common.h
-+++ b/numpy/core/src/multiarray/common.h
-@@ -178,7 +178,17 @@ check_and_adjust_axis(int *axis, int ndim)
- }
- 
- /* used for some alignment checks */
--#define _ALIGN(type) offsetof(struct {char c; type v;}, v)
-+/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
-+   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
-+   clang versions < 8.0.0 have the same bug.  */
-+#if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
-+     || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
-+  && !defined __clang__) \
-+     || (defined __clang__ && __clang_major__ < 8))
-+# define _ALIGN(type) offsetof(struct {char c; type v;}, v)
-+#else
-+# define _ALIGN(type) _Alignof(type)
-+#endif
- #define _UINT_ALIGN(type) npy_uint_alignment(sizeof(type))
- /*
-  * Disable harmless compiler warning "4116: unnamed type definition in
--- 
-2.39.0
-
diff --git a/meta/recipes-devtools/python/python3-numpy_1.24.1.bb b/meta/recipes-devtools/python/python3-numpy_1.24.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-numpy_1.24.1.bb
rename to meta/recipes-devtools/python/python3-numpy_1.24.2.bb
index adac08b3e1..78a857bf16 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.24.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.24.2.bb
@@ -10,10 +10,9 @@ SRCNAME = "numpy"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
-           file://0001-Define-_ALIGN-using-_Alignof-when-using-C11-or-newer.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "2386da9a471cc00a1f47845e27d916d5ec5346ae9696e01a8a34760858fe9dd2"
+SRC_URI[sha256sum] = "003a9f530e880cb2cd177cba1af7220b9aa42def9c4afc2a2fc3ee6be7eb2b22"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.39.1


