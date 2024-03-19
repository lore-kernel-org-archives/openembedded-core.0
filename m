Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA29C54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 11:33:39 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.13024.1710848011313719244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 04:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VALmNnYb;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-568d323e7fbso3003655a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 04:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710848009; x=1711452809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+PRbg/i4KSKHc6xaHXgWZRTHWGAoyohkCuKOk6XKVjE=;
        b=VALmNnYbN7+JQILsV6Qi74dysP7i36q581D3ERSRlpqpr44LMOVqAyaOPlRgHamvcc
         aXmJLKRp6cjg30b1HuYvv0J9YcCVbOFchHiHO9eUz8xD2CXMpxJQhMjjVdzoFjulSrrM
         NKzavn51ej61v5+/uIRE6PB0DHnNMaLoDAY26L11S54SZ8VOqwGrcSXqF+TKjMFxnvlw
         9dbF6a+dKt5KFLPwRLD7mQ6R3vhNZChzauO0nKsAL9nZUn++cgtkE+6JIYq5yuJ+CnTU
         X31BquKUtdKRtqfP3oe9a2ATljUmrRt4w3kHgUkzNwR3PtO9JYKhcja/zu/8rFinrjfG
         4z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710848009; x=1711452809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PRbg/i4KSKHc6xaHXgWZRTHWGAoyohkCuKOk6XKVjE=;
        b=rgSQijs5euO/EEn7yLd0N13VmQO58148B2zB5U+B3LpHpcRgysTMHdePcGAHWoBM6J
         A2QU/mjhmLXOjczqpboEV8XfCOBCgAufPFvVZTGAQrryG7DVDr8lOX6mrHRF5sRI9CnK
         4G7YNbRzQ4MXU6zER+Kna1ig18yNDjYCU5PIirzF2UiVuOgyv/hSoSgf81r5Lv/pOtZq
         22TNM58FC9mmZbtcWNvQK2F+N4enrxt2YAKDRljDybQW0esJaVyh3lGWwMPmQJOFUccx
         yraIy2fRcFB60YIc42f1cqZA06E0Hv9IYrOsL56ZE9nW7HCebEy5MlLuZjX9qoLe8OO5
         x+aw==
X-Gm-Message-State: AOJu0YzuuYXgRxHhc1NFM9xImzSBvfShIBAF99IR/M6O6PEnU7MNPwZR
	/8/WQ7DxPohXSYuZdUtENnUk2tI0xsvZ9K9ZAdm+83cZnLgGRmZDwmOdmMl/
X-Google-Smtp-Source: AGHT+IESmz2ycfaRPyTZfhUoQtkZ5xJGueqtnsuuaXDlgEuXUdMT0V2wWO5mTECoA4PuMZnj8ZxpFQ==
X-Received: by 2002:a05:6402:3908:b0:566:ac89:b7d5 with SMTP id fe8-20020a056402390800b00566ac89b7d5mr10473446edb.28.1710848008970;
        Tue, 19 Mar 2024 04:33:28 -0700 (PDT)
Received: from localhost.localdomain ([87.62.83.1])
        by smtp.gmail.com with ESMTPSA id n18-20020a05640205d200b00568b6d731e1sm4336992edx.4.2024.03.19.04.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 04:33:28 -0700 (PDT)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Claus Stovgaard <claus.stovgaard@gmail.com>
Subject: [kirkstone][PATCH] gcc: Backport sanitizer fix for 32-bit ALSR
Date: Tue, 19 Mar 2024 12:33:17 +0100
Message-ID: <20240319113317.9368-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 11:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197320

When using the gcc-sanitizers as part of the SDK on a Linux with a newer
kernel, the ASAN fails randomly. This was seen on Ubuntu 22.04.

This is also described at
https://stackoverflow.com/questions/77894856/possible-bug-in-gcc-sanitizers

Backport the fix from LLVM project, as gcc has not yet backported
anything for the 11 series.

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-11.4.inc        |  1 +
 .../gcc/gcc/0031-gcc-sanitizers-fix.patch     | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0031-gcc-sanitizers-fix.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.4.inc b/meta/recipes-devtools/gcc/gcc-11.4.inc
index 88310e6b79..fd6a3e92e3 100644
--- a/meta/recipes-devtools/gcc/gcc-11.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.4.inc
@@ -59,6 +59,7 @@ SRC_URI = "\
            file://0028-debug-101473-apply-debug-prefix-maps-before-checksum.patch \
            file://0029-Fix-install-path-of-linux64.h.patch \
            file://0030-rust-recursion-limit.patch \
+           file://0031-gcc-sanitizers-fix.patch \
            file://0001-CVE-2021-42574.patch \
            file://0002-CVE-2021-42574.patch \
            file://0003-CVE-2021-42574.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0031-gcc-sanitizers-fix.patch b/meta/recipes-devtools/gcc/gcc/0031-gcc-sanitizers-fix.patch
new file mode 100644
index 0000000000..d63618132a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0031-gcc-sanitizers-fix.patch
@@ -0,0 +1,63 @@
+From fb77ca05ffb4f8e666878f2f6718a9fb4d686839 Mon Sep 17 00:00:00 2001
+From: Thurston Dang <thurston@google.com>
+Date: Thu, 13 Apr 2023 23:55:01 +0000
+Subject: [PATCH] Re-land 'ASan: move allocator base to avoid conflict with
+ high-entropy ASLR for x86-64 Linux'
+
+D147984 was reverted because it broke lit tests on Mac. This revision is based on D147984
+but maintains the old behavior for Apple.
+
+Note that, per the follow-up discussion with MaskRay in D147984, this patch excludes Apple
+but includes other platforms (e.g., aarch64, MIPS64) and OSes (e.g., FreeBSD, S390X), not just
+x86-64 Linux.
+
+Original commit message from D147984:
+
+Users have discovered [*] that when CONFIG_ARCH_MMAP_RND_BITS == 32,
+it will frequently conflict with ASan's allocator on x86-64 Linux, because the
+PIE program segment base address of 0x555555555554 plus an ASLR shift of up to
+((2**32) * 4K == 0x100000000000) will sometimes exceed ASan's hardcoded
+base address of 0x600000000000. We fix this by simply moving the allocator base
+to 0x500000000000, which is below the PIE program segment base address. This is
+cleaner than trying to move it to another location that is sandwiched between
+the PIE program and library segments, because if either of those grow too large,
+it will collide with the allocator region.
+
+Note that we will never need to change this base address again (unless we want to increase
+the size of the allocator), because ASLR cannot be set above 32-bits for x86-64 Linux (the
+PIE program segment and library segments would collide with each other; see also
+ARCH_MMAP_RND_BITS_MAX in https://github.com/torvalds/linux/blob/master/arch/x86/Kconfig).
+
+[*] see https://b.corp.google.com/issues/276925478
+and https://groups.google.com/a/google.com/g/chrome-os-gardeners/c/BbfzCP3dEeo/m/h3C_vVUxCQAJ
+
+Differential Revision: https://reviews.llvm.org/D148280
+
+Upstream-Status: Backport from llvm-project: https://github.com/llvm/llvm-project/commit/fb77ca05ffb4f8e666878f2f6718a9fb4d686839
+Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
+---
+ libsanitizer/asan/asan_allocator.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/libsanitizer/asan/asan_allocator.h b/libsanitizer/asan/asan_allocator.h
+index 0b4dbf03bb9d53..6a12a6c6025283 100644
+--- a/libsanitizer/asan/asan_allocator.h
++++ b/libsanitizer/asan/asan_allocator.h
+@@ -143,11 +143,15 @@ typedef DefaultSizeClassMap SizeClassMap;
+ const uptr kAllocatorSpace = ~(uptr)0;
+ const uptr kAllocatorSize  =  0x8000000000ULL;  // 500G
+ typedef DefaultSizeClassMap SizeClassMap;
+-# else
++#  elif SANITIZER_APPLE
+ const uptr kAllocatorSpace = 0x600000000000ULL;
+ const uptr kAllocatorSize  =  0x40000000000ULL;  // 4T.
+ typedef DefaultSizeClassMap SizeClassMap;
+-# endif
++#  else
++const uptr kAllocatorSpace = 0x500000000000ULL;
++const uptr kAllocatorSize = 0x40000000000ULL;  // 4T.
++typedef DefaultSizeClassMap SizeClassMap;
++#  endif
+ template <typename AddressSpaceViewTy>
+ struct AP64 {  // Allocator64 parameters. Deliberately using a short name.
+   static const uptr kSpaceBeg = kAllocatorSpace;
-- 
2.43.2


