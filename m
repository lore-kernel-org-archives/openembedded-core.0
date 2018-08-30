Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2B625792B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 00:06:10 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id h69-v6so3015770pfd.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 17:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZqcKqs+1Aa9xhhut5yN77xaP63J0Wi1zUCFW6Cqe5VI=;
	b=mb6TURZkz/8R2SBAzveItwEeMWWJLHAZDMorjF5MZAeIldUl6WVoI6TCJfdD1so5Yn
	bZRDmNHGyzrAJ8e3sn+zOGylseR9ZyhARYr7k4Jeo0/kT+WVDXxI4Zq0gXntggZ9+QNJ
	DNYw6lVYHpdFscLHYGgRebzRfBHWDCX4K4/yTHARa6iybkpVUumTRL7yQrR0ILyqpGxB
	avGN86jjK/D5rdtaJZpwSgD4Y995ydVyfu1vQs7vKwLR1P/0YFlKfM/OVS6+iqq9J1o+
	lP+fLCIKLhDtpSaCMb2ISJ6gnPJNHMExyhQrHbo+fgs11MlCCRkLjvlC46DW7CFNZSg6
	Z+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZqcKqs+1Aa9xhhut5yN77xaP63J0Wi1zUCFW6Cqe5VI=;
	b=Pm5mpj/YONOfqfNUtetkvWc5ePSunCWl/tEEYph1WF1OzUNL8shxlce6xoehFh9EhC
	o1aDv66Vcd0Jy25EWRmmGehaVSzb0vvuS+F52iDsy6HnANW/u/O7hJ8Sj+Wsov9tYf5C
	OOO2g1CVqL+67tKVGenZwx91CYCDIj61zZWyFxgcQ4CUHbgSkDgwHkG9NftX+KUzTul5
	ETvAFOjLJAAFkxwgUZ6oUmjSHT1SvPW36mp3gjfHMAhiUBquPpOKPiUOfMM6Wd+1gpQo
	BpBI/Yb+K5Fo5gvIRLI0TX003FjVjGgYZ56pOBKGeut8CO2+y+kzFexVtce0/J1uHCyP
	qBBw==
X-Gm-Message-State: APzg51CfRnosntb6oIBwFZ45j7Vpl+3KNZHz2YJxdkQmtCMrvUs9j88+
	E8qMpp2FhLH0CeOYw6drf0ItjfmG
X-Google-Smtp-Source: ANB0VdaAjZ0NWSzjM13VvpeygTAUAKNu4JWv9XHc7BxxF1pPp0dbUtvNnzdnmtOR6+wd2dznyJIX9w==
X-Received: by 2002:a63:c608:: with SMTP id w8-v6mr7565430pgg.16.1535587570833;
	Wed, 29 Aug 2018 17:06:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	x65-v6sm8295727pfk.140.2018.08.29.17.06.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 17:06:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 17:05:59 -0700
Message-Id: <7af643301d5c3961595ec7ec4f18e94454eabacd.1535587162.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535587162.git.raj.khem@gmail.com>
References: <cover.1535587162.git.raj.khem@gmail.com>
Subject: [PATCH 1/4] boost: Fix invalid const in atomic builtins
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
X-List-Received-Date: Thu, 30 Aug 2018 00:06:10 -0000

Fixes build with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ecific-branch-for-x86-DCAS-based-loa.patch | 76 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.67.0.bb    | 15 ++--
 2 files changed, 84 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-support/boost/boost/0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch

diff --git a/meta/recipes-support/boost/boost/0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch b/meta/recipes-support/boost/boost/0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch
new file mode 100644
index 0000000000..182693079a
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch
@@ -0,0 +1,76 @@
+From 39b027171e0a619d49b9dd2e8471d10b6c41bc25 Mon Sep 17 00:00:00 2001
+From: Andrey Semashev <andrey.semashev@gmail.com>
+Date: Tue, 17 Jul 2018 12:37:29 +0300
+Subject: [PATCH] Removed clang-specific branch for x86 DCAS-based loads.
+
+The storage to load from is const-qualified and DCAS via compiler intrinsics
+require an unqualified pointer. Use asm implementation instead, which should be
+as efficient as intrinsics, if not better, in this case.
+
+Fixes https://github.com/boostorg/atomic/issues/15.
+
+Upstream-Status: Backport [https://github.com/boostorg/atomic/commit/6e14ca24dab50ad4c1fa8c27c7dd6f1cb791b534]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ boost/atomic/detail/ops_gcc_x86_dcas.hpp | 23 ++++++++++++-----------
+ 1 file changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/boost/atomic/detail/ops_gcc_x86_dcas.hpp b/boost/atomic/detail/ops_gcc_x86_dcas.hpp
+index 4dacc66f..b43ef23a 100644
+--- a/boost/atomic/detail/ops_gcc_x86_dcas.hpp
++++ b/boost/atomic/detail/ops_gcc_x86_dcas.hpp
+@@ -158,11 +158,13 @@ struct gcc_dcas_x86
+         }
+         else
+         {
+-#if defined(__clang__)
+-            // Clang cannot allocate eax:edx register pairs but it has sync intrinsics
+-            value = __sync_val_compare_and_swap(&storage, (storage_type)0, (storage_type)0);
+-#elif defined(BOOST_ATOMIC_DETAIL_X86_NO_ASM_AX_DX_PAIRS)
++            // Note that despite const qualification cmpxchg8b below may issue a store to the storage. The storage value
++            // will not change, but this prevents the storage to reside in read-only memory.
++
++#if defined(BOOST_ATOMIC_DETAIL_X86_NO_ASM_AX_DX_PAIRS)
++
+             uint32_t value_bits[2];
++
+             // We don't care for comparison result here; the previous value will be stored into value anyway.
+             // Also we don't care for ebx and ecx values, they just have to be equal to eax and edx before cmpxchg8b.
+             __asm__ __volatile__
+@@ -175,7 +177,9 @@ struct gcc_dcas_x86
+                 : BOOST_ATOMIC_DETAIL_ASM_CLOBBER_CC_COMMA "memory"
+             );
+             BOOST_ATOMIC_DETAIL_MEMCPY(&value, value_bits, sizeof(value));
++
+ #else // defined(BOOST_ATOMIC_DETAIL_X86_NO_ASM_AX_DX_PAIRS)
++
+             // We don't care for comparison result here; the previous value will be stored into value anyway.
+             // Also we don't care for ebx and ecx values, they just have to be equal to eax and edx before cmpxchg8b.
+             __asm__ __volatile__
+@@ -187,6 +191,7 @@ struct gcc_dcas_x86
+                 : [storage] "m" (storage)
+                 : BOOST_ATOMIC_DETAIL_ASM_CLOBBER_CC_COMMA "memory"
+             );
++
+ #endif // defined(BOOST_ATOMIC_DETAIL_X86_NO_ASM_AX_DX_PAIRS)
+         }
+ 
+@@ -401,15 +406,11 @@ struct gcc_dcas_x86_64
+ 
+     static BOOST_FORCEINLINE storage_type load(storage_type const volatile& storage, memory_order) BOOST_NOEXCEPT
+     {
+-#if defined(__clang__)
++        // Note that despite const qualification cmpxchg16b below may issue a store to the storage. The storage value
++        // will not change, but this prevents the storage to reside in read-only memory.
+ 
+-        // Clang cannot allocate rax:rdx register pairs but it has sync intrinsics
+-        storage_type value = storage_type();
+-        return __sync_val_compare_and_swap(&storage, value, value);
+-
+-#elif defined(BOOST_ATOMIC_DETAIL_X86_NO_ASM_AX_DX_PAIRS)
++#if defined(BOOST_ATOMIC_DETAIL_X86_NO_ASM_AX_DX_PAIRS)
+ 
+-        // Some compilers can't allocate rax:rdx register pair either and also don't support 128-bit __sync_val_compare_and_swap
+         uint64_t value_bits[2];
+ 
+         // We don't care for comparison result here; the previous value will be stored into value anyway.
diff --git a/meta/recipes-support/boost/boost_1.67.0.bb b/meta/recipes-support/boost/boost_1.67.0.bb
index 7bb451166c..ef178edc0c 100644
--- a/meta/recipes-support/boost/boost_1.67.0.bb
+++ b/meta/recipes-support/boost/boost_1.67.0.bb
@@ -2,10 +2,11 @@ require boost-${PV}.inc
 require boost.inc
 
 SRC_URI += "\
-    file://arm-intrinsics.patch \
-    file://boost-CVE-2012-2677.patch \
-    file://boost-math-disable-pch-for-gcc.patch \
-    file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
-    file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
-    file://0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch \
-"
+           file://arm-intrinsics.patch \
+           file://boost-CVE-2012-2677.patch \
+           file://boost-math-disable-pch-for-gcc.patch \
+           file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
+           file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
+           file://0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch \
+           file://0001-Removed-clang-specific-branch-for-x86-DCAS-based-loa.patch \
+           "
-- 
2.18.0


