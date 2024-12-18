Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3CDE7718F
	for <webhook@archiver.kernel.org>; Wed, 18 Dec 2024 22:02:48 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.117202.1734559362712455484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Dec 2024 14:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VrdEMKAH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-725abf74334so138629b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 14:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734559362; x=1735164162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVUb9QSUevX02QXQxKt/xLeUsIbLRsEcqL1xEwPuD1I=;
        b=VrdEMKAHpktctgCsnryx/hCeiHfU9vwyo0+2AgyFPs2Q9uegknzJNyuOnOtLVj9yBm
         S+3iJTRZYZajnEpR4nx0dlmD/PZ2JYy6G8CNM8aRXf9jl/qYlVqGI0OQMcRoiBiOYnhA
         RZMjaWEooSOX68Ip51Vto/CXtQQ+sGMgSI6/orZZlE4fbF30gfT0bqX/lPCna9yVmM94
         7izoBmN249I4QakMQyHVMPHPSgRJ3S3UrIWQhdHVcD018iphiEaOgF3LrybPELM4/Scu
         WbLtCRmpb5xsvtYYnon27h9sIsc21Uns/4x/K5wcrswDJFeK+elbOlC7N4CuJSM047k2
         QVbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734559362; x=1735164162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVUb9QSUevX02QXQxKt/xLeUsIbLRsEcqL1xEwPuD1I=;
        b=qBU9dn3HGBNxBhODRGb5IRF7lSmQwfuLa5ck2P+sSzmnuxgZULMkIAxtgfLBpSVDGO
         7vCiwJUf2b0mSADU0ICa4TFEgsnW5IdiZMM6eDFJz08Ij8kb72pQr1WGvkMkur9u/MAq
         Worw+Z5hdaNpcBcDnc40KInpAfbwvU2IDdOtcgNrqZOGjOZkBVVEPrarpHgoOBgLcsF+
         5usnve5um37kz3ZCH77XqNrIDB1ibKWtkktdmGlRloch+baJKRPjr3TqLAFaNjqxC8vZ
         sEGpdS2eL3TNTXXs6BJKhC23Ap8sxJzinvgc/UByDHhk0wL4vN+g0SShjjVuwGILibOP
         58ug==
X-Gm-Message-State: AOJu0YwX68u7lSVV+FrVmALaIUxfiB0wr7n/iirosNoP8tlUldnD0Bov
	YBH35R2ZyYWzw9aEVKypR5l3/eRi8SB+S4Q72QEyVoqStZA+f8QhpvXdCUwOGB2iZoupvT0YrLs
	h
X-Gm-Gg: ASbGnctBJarlT4Q2vvw8pbWwG+DA+2/udwaQuTaHJeP9g3V0Ql5Ntok0tkG4zl61GjH
	eht/+ssC1Rg/svJNu6yZHVbsLhH9GqvyYEQ4kFyec0tnZWAA0CM6lsEobkLd4VjbFLXKA8Xxghx
	b8XBLQRQTbwNiUEwIKo5x4xUEzTClDiwPLqawNppv6MQV7mRm+eJ10Cshhh3sgV4Jnvgd53Ic0U
	jqHkZhMMVpOk/zf2WVzfogVl3ItJJEoAsThf6zbGaKTMQ==
X-Google-Smtp-Source: AGHT+IGJZ37YMGgnW0pchfqlifg/JAgFwqlpoWlCS4rrJIOowfgBl83a6UuvTcxdPmyANgZG0qeBFg==
X-Received: by 2002:a05:6a20:c797:b0:1e1:aad7:d50d with SMTP id adf61e73a8af0-1e5b48c30c0mr9067451637.46.1734559361907;
        Wed, 18 Dec 2024 14:02:41 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5aa4b92sm7965116a12.13.2024.12.18.14.02.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 14:02:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/10] gcc: Fix c++: tweak for Wrange-loop-construct
Date: Wed, 18 Dec 2024 14:02:10 -0800
Message-Id: <614a8e3a06003dfcbf1f32dc2d6f4d18f74b71a4.1734553652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734553652.git.steve@sakoman.com>
References: <cover.1734553652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Dec 2024 22:02:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208886

From: Sunil Dora <sunilkumar.dora@windriver.com>

This commit updates the warning to use a check for "trivially constructible" instead of
"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
to types that can be copied trivially, whereas "trivially constructible" is the correct check
for types that can be trivially default-constructed.

This change ensures the warning is more accurate and aligns with the proper type traits.

LLVM accepted a similar fix:
https://github.com/llvm/llvm-project/issues/47355

PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]

Signed-off-by: Marek Polacek <polacek@redhat.com>
Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-13.3.inc        |   1 +
 ...ix-c-tweak-for-Wrange-loop-construct.patch | 113 ++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch

diff --git a/meta/recipes-devtools/gcc/gcc-13.3.inc b/meta/recipes-devtools/gcc/gcc-13.3.inc
index ffe90c7188..8b6c2a5938 100644
--- a/meta/recipes-devtools/gcc/gcc-13.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.3.inc
@@ -66,6 +66,7 @@ SRC_URI = "${BASEURI} \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0027-Fix-gcc-vect-module-testcases.patch \
+	   file://0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
            file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
 "
 SRC_URI[sha256sum] = "0845e9621c9543a13f484e94584a49ffc0129970e9914624235fc1d061a0c083"
diff --git a/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch b/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
new file mode 100644
index 0000000000..745b38f7f1
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0028-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch
@@ -0,0 +1,113 @@
+From 66aa69e2add2b8641a652768b0eac30f00427145 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Wed, 11 Dec 2024 09:48:16 -0800
+Subject: [PATCH] gcc: Fix c++: tweak for Wrange-loop-construct
+
+This commit updates the warning to use a check for "trivially constructible" instead of
+"trivially copyable." The original check was incorrect, as "trivially copyable" only applies
+to types that can be copied trivially, whereas "trivially constructible" is the correct check
+for types that can be trivially default-constructed.
+
+This change ensures the warning is more accurate and aligns with the proper type traits.
+
+LLVM accepted a similar fix:
+https://github.com/llvm/llvm-project/issues/47355
+
+PR c++/116731 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116731]
+
+Upstream-Status: Backport [https://gcc.gnu.org/g:179dc0f0fe01012675c1b430591b9891ce96c26e]
+
+Signed-off-by: Marek Polacek <polacek@redhat.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ gcc/cp/parser.cc                              |  7 ++-
+ .../g++.dg/warn/Wrange-loop-construct3.C      | 57 +++++++++++++++++++
+ 2 files changed, 61 insertions(+), 3 deletions(-)
+ create mode 100644 gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+
+diff --git a/gcc/cp/parser.cc b/gcc/cp/parser.cc
+index 4e67da6ff..5dd94357d 100644
+--- a/gcc/cp/parser.cc
++++ b/gcc/cp/parser.cc
+@@ -13854,11 +13854,12 @@ warn_for_range_copy (tree decl, tree expr)
+   else if (!CP_TYPE_CONST_P (type))
+     return;
+ 
+-  /* Since small trivially copyable types are cheap to copy, we suppress the
+-     warning for them.  64B is a common size of a cache line.  */
++  /* Since small trivially constructible types are cheap to construct, we
++     suppress the warning for them.  64B is a common size of a cache line.  */
++  tree list = build_tree_list (NULL_TREE, TREE_TYPE (expr));
+   if (TREE_CODE (TYPE_SIZE_UNIT (type)) != INTEGER_CST
+       || (tree_to_uhwi (TYPE_SIZE_UNIT (type)) <= 64
+-	  && trivially_copyable_p (type)))
++	  && is_trivially_xible (INIT_EXPR, type, list)))
+     return;
+ 
+   /* If we can initialize a reference directly, suggest that to avoid the
+diff --git a/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+new file mode 100644
+index 000000000..3d9d0c908
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/warn/Wrange-loop-construct3.C
+@@ -0,0 +1,57 @@
++// PR c++/116731
++// { dg-do compile { target c++11 } }
++// { dg-options "-Wrange-loop-construct" }
++
++void
++f0 ()
++{
++  struct S {
++    char a[64];
++    S& operator=(const S&) { return *this; };
++  };
++
++  S arr[8];
++  for (const auto r : arr)
++    (void) r;
++}
++
++void
++f1 ()
++{
++  struct S {
++    char a[65];
++    S& operator=(const S&) { return *this; };
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
++
++void
++f2 ()
++{
++  struct S {
++    char a[64];
++    S& operator=(const S&) { return *this; };
++    ~S() { }
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
++
++void
++f3 ()
++{
++  struct S {
++    char a[65];
++    S& operator=(const S&) { return *this; };
++    ~S() { }
++  };
++
++  S arr[8];
++  for (const auto r : arr) // { dg-warning "creates a copy" }
++    (void) r;
++}
+-- 
+2.43.0
+
-- 
2.34.1


