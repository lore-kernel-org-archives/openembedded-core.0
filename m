Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673E2C3ABC9
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 22:05:51 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.19599.1746914747855525982
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 15:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R/enXVKl;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22e76850b80so23718625ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 15:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746914747; x=1747519547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygkwyQ8SgGkBE7HOnSw99PvbmIfs+iLfFGu4QwtExSU=;
        b=R/enXVKlkHQPuC8f921Ewfi345vA3tpkfkSMIUwrvQ6p3t0Zg8rQxCjiRAC87THrEf
         THND1vnYuCenU61SMhOTw26oe3Y3LKw0aaYYrtEB5jdtG/I1Uv6Imgy1jXSjFJWXFdr1
         o+6rYMzKL/kHJ88xxbD2bMsJgC+XQ7sBHNZ5/ifBl8ouyKPflv1rPLz6ZGTv+0Hdoswk
         y3gCJ965LGCOtqJORvvfPv8siluj7kI47EWMsxZ5aNby5JftN/Zcli8yYhEC3fJ2OQkE
         9UJjxSp11loi1+1lDFkKaRIkZbHUxhEazptq7KGH/OPhDtU+ljXVZUmMT+NdD1+SnQdx
         g72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746914747; x=1747519547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygkwyQ8SgGkBE7HOnSw99PvbmIfs+iLfFGu4QwtExSU=;
        b=XfHHa47Bsj+QxC/pK+m60NrVQGM/dsENIDJsiS0hf0N3+zS7xmfR/5OWg9xsZRikSU
         CKgtd/Hqw/do/2p4Df7+j8w3VRBHI4KNX43Br47KvkRU2bnwHilBJKRFlSyHy6lp1MCl
         lgwJHPf+J9ZdtzA05QY1TKgQIPUZ1pua2LpYjcBYHZ3+yp6FgcxovlVHvtTmnQQ103mL
         BCmI/36w+ca/Bd/0bQyKrHFEIM8h0Iw8993OHrgU2USRK4avwlFmO+ixI/bsfPA8937E
         1JWpKP+Cn4cWO5TDu2g1GMtg6snJ329SyWFhAiBgErG1hIy8VCvOlBozdekJf2Yc+4Te
         +ytg==
X-Gm-Message-State: AOJu0YzXWxK5rLOwiFjAjR0u98ujaeGqcLAsYpBYzpgBncYFWd7+uk2F
	EsnIj+vc/rl6jh2zXwqFX+rns+5qutKWNCpB0NsDr4TkM4eiwhSxzzrfBf7u
X-Gm-Gg: ASbGncsNMj3eu47Bqw1rSsNLK8tGfBLy8N3UbO2y7OaDaQ1fLNlt+u4lTR28VAMc8SQ
	ESXyAmoDOWld/eCIbeepDAfN2DGOR8B5CICZc1SXV92R34nhmwdnlZc2oQeDGmpdh/GpboIy2dW
	CPkgTYjEaFP4tTnH45MZxArmZs2oDP5a2jRijy7E+fW9Qc1cAcqhcK38CXd7PTHAL1/ydloOI5E
	42/q8daugR6PsazFCPI52tMurF5c2NQjBQUcaz5359dr2fvPoirdNbl3txn+yJmeRYjnSb2cdLL
	eD5VcFGQ4dQxRyN/09rcG/khEZ65oz/tBuGb7ef4/3Q=
X-Google-Smtp-Source: AGHT+IF9Ie1tIzXsQorIeqrlFkzn1y/mmoBcK/uVjYkh2uukR/1skWffnvZn+CjcxY23HcUPLjAwKg==
X-Received: by 2002:a17:902:e751:b0:22e:4a2e:8ae7 with SMTP id d9443c01a7336-22fc8b60280mr128406685ad.22.1746914746943;
        Sat, 10 May 2025 15:05:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::efc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82a0e52sm37515965ad.216.2025.05.10.15.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 15:05:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] compiler-rt: Exclude sync builtins from build when arm < v6
Date: Sat, 10 May 2025 15:05:43 -0700
Message-ID: <20250510220543.884520-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250510220543.884520-1-raj.khem@gmail.com>
References: <20250510220543.884520-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 22:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216279

arm architecture < v6 does not have the dmb support, therefore do
not add the sync primitives to compiler-rt builtins build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ude-sync_fetch_and_-for-any-pre-ARMv.patch | 61 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0038-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch

diff --git a/meta/recipes-devtools/clang/clang/0038-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch b/meta/recipes-devtools/clang/clang/0038-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
new file mode 100644
index 00000000000..4639a73fe6b
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0038-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch
@@ -0,0 +1,61 @@
+From 5a0daa2dcc2bb39d87c4fcae7036cd8ab7ee6f6d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 10 May 2025 14:03:12 -0700
+Subject: [PATCH] compiler-rt: Exclude sync_fetch_and_* for any pre-ARMv6 targets
+
+Sometimes builds may happen where ABI is not indidated by host_triple
+e.g. on Yocto the compiler used is called arm-poky-linux-gnueabi-clang
+for all arm32 cross compilers, it passed the ABI flags on cmdline in
+addition. e.g.
+
+-march=armv5te -mfloat-abi=soft
+or
+-march=armv7-a -mfloat-abi=hard
+
+compiler-rt's makery tries to add arm to COMPILER_RT_SUPPORTED_ARCH
+deducing it from triple name.
+
+which ends up choosing `arm` as one of compiler-rt arch to build for.
+This arch is however using armv7+ defaults and then tried to build sync
+builtins using
+
+arm-poky-linux-gnueabi-clang -march=armv5te -mfloat-abi=soft ...
+
+Which does not compile correctly, in such cases it should simply
+remove the sync builtins from list of things to build similar to what
+is done when we use armv4t or armv5t
+
+set(armv4t_SOURCES ${arm_min_SOURCES})
+set(armv5te_SOURCES ${arm_min_SOURCES})
+
+This lets compiler-rt build for arm architectures without depending
+upong compiler triple, but instead of poking the compiler for what
+it is building for
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/139411]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/lib/builtins/CMakeLists.txt | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+--- a/compiler-rt/lib/builtins/CMakeLists.txt
++++ b/compiler-rt/lib/builtins/CMakeLists.txt
+@@ -864,6 +864,18 @@ else ()
+       list(JOIN BUILTIN_CFLAGS " " CMAKE_REQUIRED_FLAGS)
+       set(CMAKE_REQUIRED_FLAGS "${TARGET_${arch}_CFLAGS} ${BUILTIN_CFLAGS_${arch}}")
+       message(STATUS "Performing additional configure checks with target flags: ${CMAKE_REQUIRED_FLAGS}")
++      # For ARM archs, exclude any sync builtins if dmb or mcr p15, #0, r0, c7, c10, #5
++      # is not supported
++      if (${arch} MATCHES "^(arm|armhf)$")
++        try_compile_only(COMPILER_RT_HAS_${arch}_SYNC
++                         SOURCE  "#if __ARM_ARCH < 6
++                                  #error DMB is only supported on ARMv6+ !
++                                  #endif
++                                  int main(void) { return 0; }")
++        if(NOT COMPILER_RT_HAS_${arch}_SYNC)
++          list(REMOVE_ITEM ${arch}_SOURCES ${arm_sync_SOURCES})
++        endif()
++      endif()
+       # For ARM archs, exclude any VFP builtins if VFP is not supported
+       if (${arch} MATCHES "^(arm|armhf|armv7|armv7s|armv7k|armv7m|armv7em|armv8m.main|armv8.1m.main)$")
+         string(REPLACE ";" " " _TARGET_${arch}_CFLAGS "${TARGET_${arch}_CFLAGS}")
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 07315f17e46..f661a6283e5 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -57,6 +57,7 @@ SRC_URI = "\
     file://0034-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
     file://0035-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
     file://0036-openmp-Do-not-emit-date-and-time-into-generate-files.patch \
+    file://0038-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""

