Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id E67F079367
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:55:45 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a4-v6so3225122plm.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 20:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZqcKqs+1Aa9xhhut5yN77xaP63J0Wi1zUCFW6Cqe5VI=;
	b=uZL6iYVg+8E3q+8rCTo8hIcVaY5tJTUroS8THPZmsRyltINHAXUctmYJh6sKHJZH3n
	0lCDsB5POtrAaI71EirnkSZjbflNQ+LxTvusKrysevsH7pAJv/kAu7S4yAxTOzBOl2iP
	t2sGHW4sMwKr6GYDDLRcv8NTDGK2x/sKk8ctanaOS9ViYMcVQswIA1scljn0SirN+LFS
	I2/YTIzP3XkZcyBZfPDC9Ox2iU73WTahMgMNMH6rPtoiqaNoCdURlYIiYazagmPpLFal
	NE3Iae6WOxM/3mK5LU1vTgTjpaLumeO3Ci7N9vt2f0nf79RheIcYlqSa9H0t4T5n2JA9
	ByWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZqcKqs+1Aa9xhhut5yN77xaP63J0Wi1zUCFW6Cqe5VI=;
	b=dZ33ghyZkv7AixeiUVUzdTQ1V3deNPBi1/U3cJlnVqEb/Pi4kbQTI+K0f4toFHGvvQ
	41R+iZIbFoc/Y2oSrRdAY/EqldR5ypVTum1g+k5gGiJVN6HDUTyqBYNsvyXt6Oj8Uyuj
	3aXDgHb2tG3UgtVCYsnOBwjub49hsyA9D0TvYFOjdQzUEza4fO6EDohHHyvi6J3/2f+G
	oJa0Oax1J2+DkJaL+vDTVxPq6y4ikflOEdA1YI5x5potVF1zmHxkcT0PHX5duDoVSkwP
	1jeTRYUuN9DNcT2ZIQw8y1mxEL5HyBr1izZV4jtK/1aBLcKVDZphkhTqQiGSFRoINbZ1
	lCFw==
X-Gm-Message-State: APzg51CVzePcHnBDP8cBG31VUpgrhGdWQ8i/9QbQdYqwbI4LShkKMM87
	NZOZi4i5n841h1YKMpNLCCZRbAxW
X-Google-Smtp-Source: ANB0VdYnWZHAwIRH4le4z5kva5gCeCEyYmvfFcyWJyohDTbglTMvxZ8jTqDDRpthpIT4Rrp59seZNg==
X-Received: by 2002:a17:902:bb0c:: with SMTP id
	l12-v6mr8521272pls.5.1535601346731; 
	Wed, 29 Aug 2018 20:55:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f180])
	by smtp.gmail.com with ESMTPSA id
	77-v6sm8056381pga.40.2018.08.29.20.55.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Aug 2018 20:55:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2018 20:55:33 -0700
Message-Id: <7af643301d5c3961595ec7ec4f18e94454eabacd.1535601148.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535601148.git.raj.khem@gmail.com>
References: <cover.1535601148.git.raj.khem@gmail.com>
Subject: [PATCH 1/7] boost: Fix invalid const in atomic builtins
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
X-List-Received-Date: Thu, 30 Aug 2018 03:55:46 -0000

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


