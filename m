Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D982E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 03:36:38 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.10853.1736307390752159663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 19:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mTDPEg0R;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2163b0c09afso238825875ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 19:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736307390; x=1736912190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h84R5QrJ3Y90L0btQAMU4v+VC+KyvyFAph5/Tp/q4Go=;
        b=mTDPEg0RTIj/Cr1Ba6x6gwMyzd7OW3NHZlHQARHo8ulLGypBnCEOc/4sLFy7Jv8d42
         g0ZB7xx94J0sod67KNYH3my53ORw1V04UuSZk9AWTBru5M9e8lFeshrwhhuq36ST99Yb
         5lrDCGm2yy0n5p5cspexRVr7x1dvLGFIwu3cZHTBDwsCL9LdhsYXbj4NrPUjQbq5iH04
         Nwx8INXNkh7izysxYwKXF/Du7tNky3Ap05Iq+JULwD6nmrypjEx3fFvCOqECZCLMV8zB
         gYnxzwqrl12qgb+Uhzk2Kmq+R5W0/gmsx4rREURXGHY36uLEs8S+xlNi+cd5Dy/f8SZV
         ZTOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736307390; x=1736912190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h84R5QrJ3Y90L0btQAMU4v+VC+KyvyFAph5/Tp/q4Go=;
        b=oCg7I/wTZcaQi5zfeT8AlgvSAu+tRQdV89KRpaUbcxb4XJOFbfpGTbct8pOIQ03D4m
         aXtKdmo9qJK3i/UcV7b4iYYmR+GLd/jiKDTwq6n26RaTc3TDbTGXs/WdGVuBRKozE7dq
         8AiWnFbA4ZIk+PcZA+S0yiuDk3Pw/8wjWu/AiGnKUBD7uej1IsZUZKqKESQ9DYgaPT7y
         nxGnjlJ9ZbQquoVz/E4/d/MX+u+lo7iFpxcXFrGLV+j1B95FJSZ0J8eLKrgq/iMus7Av
         FonrywPYejHP1THFrkqjoZQIjeChwPnMRoM8/9R73EH3EsZn6ynHOvtSUQslH7AdM+7m
         yDLw==
X-Gm-Message-State: AOJu0YwndW3zcZktl0UqzyjEoXqTVdApkoH0s2jNjf9qGd9bW+Q1kANj
	HpRR6ToVnCpAkxUcSJM+DXmwhs6resCGdPMCPI5y8+7Kr43b6InJ28QPtQ==
X-Gm-Gg: ASbGncvWpHLaF3ZJ3UyOOkESoeVpSNWa+2VO3DZWWW7lP6UMNJa1kuhZWzB4ZX8xRFn
	0ZO8vxzs+uAUpAPUg7qiRZgArqGypiZEj8bhwPJMAAAP6GnsgEC2iAekTNDrnd+3k4AIkobnpyM
	jVI2qGfHvbRFCEKyVekhDv0eAGj9Ud3QcyTH+2B3auy6fLY0rnH+vbrU4p6+aCVUjw902U0Jk2M
	kWXI5/U1WLr2KHyULOmzKVhSFKWv2wQn+uBLmG0kQKvrEm7
X-Google-Smtp-Source: AGHT+IEa8CqboXQPLV9Renw/smtScz7quxUweogIX/IrXYaasNoVS5iRQzDv3NZ8l+LzLpcWI0jJGw==
X-Received: by 2002:a05:6a20:4393:b0:1e1:aa24:2e5c with SMTP id adf61e73a8af0-1e88d2fc6a8mr2854851637.38.1736307389776;
        Tue, 07 Jan 2025 19:36:29 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::5bc2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba7325csm31792116a12.7.2025.01.07.19.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:36:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Revert clang float128 patch
Date: Tue,  7 Jan 2025 19:36:25 -0800
Message-ID: <20250108033627.2889555-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 03:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209508

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-__HAVE_FLOAT128-for-Clang-and-use-.patch | 87 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.41.bb         |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_FLOAT128-for-Clang-and-use-.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_FLOAT128-for-Clang-and-use-.patch b/meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_FLOAT128-for-Clang-and-use-.patch
new file mode 100644
index 00000000000..88823cb95bc
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Revert-x86-Define-__HAVE_FLOAT128-for-Clang-and-use-.patch
@@ -0,0 +1,87 @@
+From b662179d7c679e423b8595e0509253688544a4fd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Dec 2024 18:59:26 -0800
+Subject: [PATCH] Revert "x86: Define __HAVE_FLOAT128 for Clang and use
+ __builtin_*f128 code path"
+
+This reverts commit d773aff467840f5ed305e40c180466e90bd88183.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/x86/bits/floatn.h | 24 ++++++++----------------
+ 1 file changed, 8 insertions(+), 16 deletions(-)
+
+diff --git a/sysdeps/x86/bits/floatn.h b/sysdeps/x86/bits/floatn.h
+index ba030d270a..e661abaea4 100644
+--- a/sysdeps/x86/bits/floatn.h
++++ b/sysdeps/x86/bits/floatn.h
+@@ -28,8 +28,7 @@
+    support, for x86_64 and x86.  */
+ #if (defined __x86_64__							\
+      ? __GNUC_PREREQ (4, 3)						\
+-     : (defined __GNU__ ? __GNUC_PREREQ (4, 5) : __GNUC_PREREQ (4, 4))) \
+-    || __glibc_clang_prereq (3, 4)
++     : (defined __GNU__ ? __GNUC_PREREQ (4, 5) : __GNUC_PREREQ (4, 4)))
+ # define __HAVE_FLOAT128 1
+ #else
+ # define __HAVE_FLOAT128 0
+@@ -59,9 +58,7 @@
+ /* Defined to concatenate the literal suffix to be used with _Float128
+    types, if __HAVE_FLOAT128 is 1. */
+ # if __HAVE_FLOAT128
+-#  if !__GNUC_PREREQ (7, 0) \
+-      || (defined __cplusplus && !__GNUC_PREREQ (13, 0)) \
+-      || defined __clang__
++#  if !__GNUC_PREREQ (7, 0) || (defined __cplusplus && !__GNUC_PREREQ (13, 0))
+ /* The literal suffix f128 exists only since GCC 7.0.  */
+ #   define __f128(x) x##q
+ #  else
+@@ -71,9 +68,7 @@
+ 
+ /* Defined to a complex binary128 type if __HAVE_FLOAT128 is 1.  */
+ # if __HAVE_FLOAT128
+-#  if !__GNUC_PREREQ (7, 0) \
+-      || (defined __cplusplus && !__GNUC_PREREQ (13, 0)) \
+-      || defined __clang__
++#  if !__GNUC_PREREQ (7, 0) || (defined __cplusplus && !__GNUC_PREREQ (13, 0))
+ /* Add a typedef for older GCC compilers which don't natively support
+    _Complex _Float128.  */
+ typedef _Complex float __cfloat128 __attribute__ ((__mode__ (__TC__)));
+@@ -87,14 +82,12 @@ typedef _Complex float __cfloat128 __attribute__ ((__mode__ (__TC__)));
+ # if __HAVE_FLOAT128
+ 
+ /* The type _Float128 exists only since GCC 7.0.  */
+-#  if !__GNUC_PREREQ (7, 0) \
+-      || (defined __cplusplus && !__GNUC_PREREQ (13, 0)) \
+-      || __glibc_clang_prereq (3, 4)
++#  if !__GNUC_PREREQ (7, 0) || (defined __cplusplus && !__GNUC_PREREQ (13, 0))
+ typedef __float128 _Float128;
+ #  endif
+ 
+-/* __builtin_huge_valf128 doesn't exist before GCC 7.0 nor Clang 7.0.  */
+-#  if !__GNUC_PREREQ (7, 0) && !__glibc_clang_prereq (7, 0)
++/* __builtin_huge_valf128 doesn't exist before GCC 7.0.  */
++#  if !__GNUC_PREREQ (7, 0)
+ #   define __builtin_huge_valf128() ((_Float128) __builtin_huge_val ())
+ #  endif
+ 
+@@ -103,7 +96,7 @@ typedef __float128 _Float128;
+    Converting a narrower sNaN to _Float128 produces a quiet NaN, so
+    attempts to use _Float128 sNaNs will not work properly with older
+    compilers.  */
+-#  if !__GNUC_PREREQ (7, 0) && !defined __clang__
++#  if !__GNUC_PREREQ (7, 0)
+ #   define __builtin_copysignf128 __builtin_copysignq
+ #   define __builtin_fabsf128 __builtin_fabsq
+ #   define __builtin_inff128() ((_Float128) __builtin_inf ())
+@@ -114,8 +107,7 @@ typedef __float128 _Float128;
+ /* In math/math.h, __MATH_TG will expand signbit to __builtin_signbit*,
+    e.g.: __builtin_signbitf128, before GCC 6.  However, there has never
+    been a __builtin_signbitf128 in GCC and the type-generic builtin is
+-   only available since GCC 6.  signbit is expanded to __builtin_signbit
+-   after Clang 3.3.  */
++   only available since GCC 6.  */
+ #  if !__GNUC_PREREQ (6, 0)
+ #   define __builtin_signbitf128 __signbitf128
+ #  endif
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index 7f2576692d6..70afc78a55c 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -54,6 +54,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0024-features.h-Bump-__GLIBC_MINOR__-to-next-release-on-m.patch \
+           file://0001-Revert-x86-Define-__HAVE_FLOAT128-for-Clang-and-use-.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"

