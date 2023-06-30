Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32D3EB64D9
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.3833.1688092163668367540
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Iy4PvvwC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-666fb8b1bc8so1231480b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092163; x=1690684163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfV6j8AGWUC5ZmSaPKqNNDB086DckTqN39VZyE3blGE=;
        b=Iy4PvvwCrAWTj0eXiw1teecfBdMlSvRUTklOmtENj4RcqfyXjT9L9+HC8KRqMuqYlF
         RDjrzf2KcWBKg4bhooavLNwhPXuWqiLnChAohLMLFZwIFZYD5hgxQzbgli8/RlDZjUHT
         FPHMOKBLPGYwZrM+ANOfyj2q5OEG7A228v1Vk8iF4tHkLA3+zup2afgdacYgmi3LHNcX
         8P9nsVU8J5vsS7UYb7XNDB6jytENeSIzf7J7/7TRum+hJUuBD5vPbdoOjWbOSgd7ZoVp
         CUq+yvMnJR/2QEFkTzOxAH6ZClhH7NcWsDejxwtURQRC6CbetaOTdpmeSJbSI4Wphvh8
         QQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092163; x=1690684163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfV6j8AGWUC5ZmSaPKqNNDB086DckTqN39VZyE3blGE=;
        b=TxD9xmKmhvpR7D3Vnvp4hWFWBN3LEjNv7NV0eHFBluyRnVT2kg+NuO2r3pwKV/cGpW
         LxkV01b6lJ3OTGKARXyWrDixl02hX502AbMjWNLVQScyYA5RLZUh1PqL+gDgd6btqk/W
         P/n6N3WkZuuPomR69I99gIogS6cU/vnhfDsLx+6zXHuvaJumXMk+Tt952yubovzZ3/XF
         Zx2Pm3dwu4HOq1i0MyDVSm8Iqoi+49KvFOJC9jpeCAAKfeUNl83LMsiumSdN1VsVeOCw
         2TAPH2rTehP9muU9UhCCxGp56L/lTnjFMsypAau45e5xC8Pm4fwPN5NPk23XISjYUFrk
         +bDQ==
X-Gm-Message-State: ABy/qLZvkFP97InW2oTGHD51pZCyoEfMQCu4iXPRoSTc5UR0VVdf4bkX
	wa4xc/+06e0JPfNe86MJa1yrtwuNZOJrSHSq7RVK0g==
X-Google-Smtp-Source: APBJJlEgmDXuy+wJNxAnfQ/d+iQXvGsqFRE/FI10UyU8d6gqsnWWwMYp4LeRJskPQEnaU265HoXqVQ==
X-Received: by 2002:a05:6a00:24d3:b0:63a:ea82:b7b7 with SMTP id d19-20020a056a0024d300b0063aea82b7b7mr2052408pfv.28.1688092162563;
        Thu, 29 Jun 2023 19:29:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/30] python3-numpy: remove NPY_INLINE, use inline instead
Date: Thu, 29 Jun 2023 16:28:42 -1000
Message-Id: <77a64a8686b6c9ef3bc6adbce6cdc442096decfd.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183646

From: Mingli Yu <mingli.yu@windriver.com>

The build fails when DEBUG_BUILD is enabled with GCC-13 as [1] and [2].

Fixes:
   | numpy/core/src/umath/simd.inc.src:977:20: note: called from here
   | 977 |     @vtype@ zeros = _mm512_setzero_@vsuffix@();
      |                    ^~~~~~~~~~~~~~~~~~~
   | numpy/core/src/umath/simd.inc.src:596:1: error: inlining failed in call to ‘always_inline’ ‘avx512_get_full_load_mask_ps’: target specific option mismatch
  596 | avx512_get_full_load_mask_ps(void)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   | numpy/core/src/umath/simd.inc.src:976:27: note: called from here
  976 |     @mask@ load_mask = avx512_get_full_load_mask_@vsuffix@();
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   | /usr/lib/gcc/x86_64-redhat-linux/13/include/avx512fintrin.h:6499:1: error: inlining failed in call to ‘always_inline’ ‘_mm512_loadu_si512’: target specific option mismatch

Reference: https://github.com/numpy/numpy/pull/22674/commits/3947b1a023a07a55522de65b4d302339bac2bad7

[1] https://git.openembedded.org/openembedded-core/commit/?id=8596678667797971559aed962b1c204266032186
[2] http://errors.yoctoproject.org/Errors/Details/689841/

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ....inc.src-Change-NPY_INLINE-to-inline.patch | 135 ++++++++++++++++++
 .../python/python3-numpy_1.24.2.bb            |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch b/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch
new file mode 100644
index 0000000000..d733dda333
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch
@@ -0,0 +1,135 @@
+From f2a722aa30a29709bb9b5f60fc6d20a10fe6b4f5 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 28 Jun 2023 17:58:52 +0800
+Subject: [PATCH] simd.inc.src: Change NPY_INLINE to inline
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+  | numpy/core/src/umath/simd.inc.src:977:20: note: called from here
+  | 977 |     @vtype@ zeros = _mm512_setzero_@vsuffix@();
+      |                    ^~~~~~~~~~~~~~~~~~~
+  | numpy/core/src/umath/simd.inc.src:596:1: error: inlining failed in call to ‘always_inline’ ‘avx512_get_full_load_mask_ps’: target specific option mismatch
+  596 | avx512_get_full_load_mask_ps(void)
+      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  | numpy/core/src/umath/simd.inc.src:976:27: note: called from here
+  976 |     @mask@ load_mask = avx512_get_full_load_mask_@vsuffix@();
+      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  | /usr/lib/gcc/x86_64-redhat-linux/13/include/avx512fintrin.h:6499:1: error: inlining failed in call to ‘always_inline’ ‘_mm512_loadu_si512’: target specific option mismatch
+
+Upstream-Status: Inappropriate [The file simd.inc.src have been removed in new version as
+                                https://github.com/numpy/numpy/commit/640e85017aa8eac3e9be68b475acf27d623b16b7]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ numpy/core/src/umath/simd.inc.src | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/numpy/core/src/umath/simd.inc.src b/numpy/core/src/umath/simd.inc.src
+index d6c9a7e..39aec9a 100644
+--- a/numpy/core/src/umath/simd.inc.src
++++ b/numpy/core/src/umath/simd.inc.src
+@@ -61,11 +61,11 @@
+  */
+ 
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined NPY_HAVE_SSE2_INTRINSICS
+-static NPY_INLINE NPY_GCC_TARGET_AVX512F void
++static inline NPY_GCC_TARGET_AVX512F void
+ AVX512F_@func@_@TYPE@(@type@*, @type@*, const npy_intp n, const npy_intp stride);
+ #endif
+ 
+-static NPY_INLINE int
++static inline int
+ run_unary_avx512f_@func@_@TYPE@(char **args, const npy_intp *dimensions, const npy_intp *steps)
+ {
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined NPY_HAVE_SSE2_INTRINSICS
+@@ -99,11 +99,11 @@ run_unary_avx512f_@func@_@TYPE@(char **args, const npy_intp *dimensions, const n
+  */
+ 
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512_SKX_WITH_INTRINSICS && defined NPY_HAVE_SSE2_INTRINSICS && @EXISTS@
+-static NPY_INLINE NPY_GCC_TARGET_AVX512_SKX void
++static inline NPY_GCC_TARGET_AVX512_SKX void
+ AVX512_SKX_@func@_@TYPE@(npy_bool*, @type@*, const npy_intp n, const npy_intp stride);
+ #endif
+ 
+-static NPY_INLINE int
++static inline int
+ run_@func@_avx512_skx_@TYPE@(char **args, npy_intp const *dimensions, npy_intp const *steps)
+ {
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512_SKX_WITH_INTRINSICS && defined NPY_HAVE_SSE2_INTRINSICS && @EXISTS@
+@@ -144,7 +144,7 @@ sse2_@func@_@TYPE@(@type@ *, @type@ *, const npy_intp n);
+ 
+ #endif
+ 
+-static NPY_INLINE int
++static inline int
+ run_@name@_simd_@func@_@TYPE@(char **args, npy_intp const *dimensions, npy_intp const *steps)
+ {
+ #if @vector@ && defined NPY_HAVE_SSE2_INTRINSICS
+@@ -169,7 +169,7 @@ sse2_@kind@_@TYPE@(npy_bool * op, @type@ * ip1, npy_intp n);
+ 
+ #endif
+ 
+-static NPY_INLINE int
++static inline int
+ run_@kind@_simd_@TYPE@(char **args, npy_intp const *dimensions, npy_intp const *steps)
+ {
+ #if @vector@ && defined NPY_HAVE_SSE2_INTRINSICS
+@@ -205,7 +205,7 @@ static void
+ sse2_reduce_@kind@_BOOL(npy_bool * op, npy_bool * ip, npy_intp n);
+ #endif
+ 
+-static NPY_INLINE int
++static inline int
+ run_binary_simd_@kind@_BOOL(char **args, npy_intp const *dimensions, npy_intp const *steps)
+ {
+ #if defined NPY_HAVE_SSE2_INTRINSICS
+@@ -220,7 +220,7 @@ run_binary_simd_@kind@_BOOL(char **args, npy_intp const *dimensions, npy_intp co
+ }
+ 
+ 
+-static NPY_INLINE int
++static inline int
+ run_reduce_simd_@kind@_BOOL(char **args, npy_intp const *dimensions, npy_intp const *steps)
+ {
+ #if defined NPY_HAVE_SSE2_INTRINSICS
+@@ -245,7 +245,7 @@ static void
+ sse2_@kind@_BOOL(npy_bool *, npy_bool *, const npy_intp n);
+ #endif
+ 
+-static NPY_INLINE int
++static inline int
+ run_unary_simd_@kind@_BOOL(char **args, npy_intp const *dimensions, npy_intp const *steps)
+ {
+ #if defined NPY_HAVE_SSE2_INTRINSICS
+@@ -875,7 +875,7 @@ NPY_FINLINE NPY_GCC_OPT_3 NPY_GCC_TARGET_@ISA@ @vtype@d
+  */
+ 
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512_SKX_WITH_INTRINSICS && defined NPY_HAVE_SSE2_INTRINSICS
+-static NPY_INLINE NPY_GCC_TARGET_AVX512_SKX void
++static inline NPY_GCC_TARGET_AVX512_SKX void
+ AVX512_SKX_@func@_@TYPE@(npy_bool* op, @type@* ip, const npy_intp array_size, const npy_intp steps)
+ {
+     const npy_intp stride_ip = steps/(npy_intp)sizeof(@type@);
+@@ -954,7 +954,7 @@ AVX512_SKX_@func@_@TYPE@(npy_bool* op, @type@* ip, const npy_intp array_size, co
+  */
+ 
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined NPY_HAVE_SSE2_INTRINSICS
+-static NPY_GCC_OPT_3 NPY_INLINE NPY_GCC_TARGET_AVX512F void
++static NPY_GCC_OPT_3 inline NPY_GCC_TARGET_AVX512F void
+ AVX512F_@func@_@TYPE@(@type@ * op,
+                       @type@ * ip,
+                       const npy_intp array_size,
+@@ -1001,7 +1001,7 @@ AVX512F_@func@_@TYPE@(@type@ * op,
+ /**end repeat1**/
+ 
+ #if defined HAVE_ATTRIBUTE_TARGET_AVX512F_WITH_INTRINSICS && defined NPY_HAVE_SSE2_INTRINSICS
+-static NPY_GCC_OPT_3 NPY_INLINE NPY_GCC_TARGET_AVX512F void
++static NPY_GCC_OPT_3 inline NPY_GCC_TARGET_AVX512F void
+ AVX512F_absolute_@TYPE@(@type@ * op,
+                         @type@ * ip,
+                         const npy_intp array_size,
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3-numpy_1.24.2.bb b/meta/recipes-devtools/python/python3-numpy_1.24.2.bb
index bfcfc52729..5f88948de2 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.24.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.24.2.bb
@@ -10,6 +10,7 @@ SRCNAME = "numpy"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
+           file://0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "003a9f530e880cb2cd177cba1af7220b9aa42def9c4afc2a2fc3ee6be7eb2b22"
-- 
2.34.1


