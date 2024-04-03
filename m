Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DB1CD129B
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:47:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.3151.1712116042163959508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rLy3rqgn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6eaf9565e6bso2301552b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712116041; x=1712720841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dxl0WwG5/0omQ/ag/WxdsxDBXZKXBrZYgQ+YPQk85Xg=;
        b=rLy3rqgnRpo4XEl22GqJ9tdAIcyMW+HsPDiH0JUjRBx7GOvnHs8HQAgSGqIEgc/CEt
         2QsI2X5cpAm4QhriBJFesxH/oHPVG0LEJG76HjMIINAy5SzSeDTksY+OVHb4wrwtbVst
         W1+92LS8gkY/q/BkxqbA8vy3zF0mHNORQFClTVyUnVRiRAvgmpmz7t/xGGD3yr2xsSnv
         vf0WMAvw7AM9elELrhWfxbl6iCIKCLa2TinUH+1bTyCU7GzI7gSyI5tO1LCF/X1QVabD
         YoErU8DiQ5KsY22itqi2lM3btNbYnDqYcgsdRjbL226VaINyVDcyeFbG91/Yi7fd8G+O
         hfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712116041; x=1712720841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxl0WwG5/0omQ/ag/WxdsxDBXZKXBrZYgQ+YPQk85Xg=;
        b=URQlJo9tFN0OLk31KlL/JBJmAy2ZZ2DrzJ9BbqJoZ5fsmRStVYEIClAUx54v6HPkKk
         Kvd/lVLo2W0l7+ozTqrD6pE06W5tOS93unU1cbLkPAdxS5D9fnmUZiP3JpV1KYh0M+/T
         OH+mCRGfPgLS9TninOXHwieGkAc/96C73aaFow29GtIOru+7eUcbop90R1Hvk1+B5DA1
         d38bKzBdVyDUgrwCCgmTBjEo88YWPN9VLP+dTpTxUvBS+EeZUR8h/isklgP6+YKxziBu
         Ttlgy+Zps7RcfuJyX9ohsLcX8Ib+8LVBcWgjcg53/kQrjiDhNnItw/cuCGuX8Uqdd2pb
         yzyg==
X-Gm-Message-State: AOJu0Yx9UDuKa8Ne3IFW/R01E2lzCqaHA0VZxJ/1IZfL5Il8+RSu1kM6
	znv/6UYlgJ77Tlx9B3Bba7ulHX5SWGx9+GpD5ao9UFZ+rctEMhZXAnVti7OatAEPXCjFy3E2+m/
	Bx+s=
X-Google-Smtp-Source: AGHT+IEW2OVzxKLAVy2O/Asw/VfN8V1vzB5kB0kGd9jEdidIVbUca7LQ+PDJFSxlnrRsbGopGglg8A==
X-Received: by 2002:a05:6a20:1591:b0:1a3:c43b:2c2c with SMTP id h17-20020a056a20159100b001a3c43b2c2cmr14433600pzj.47.1712116041526;
        Tue, 02 Apr 2024 20:47:21 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902c44b00b001e278fb17c5sm2326128plm.150.2024.04.02.20.47.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:47:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] gcc: Backport sanitizer fix for 32-bit ALSR
Date: Tue,  2 Apr 2024 17:47:01 -1000
Message-Id: <7af8e24d6c60a01e398b10a57939947fb156feec.1712115855.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712115855.git.steve@sakoman.com>
References: <cover.1712115855.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197901

From: Claus Stovgaard <claus.stovgaard@gmail.com>

When using the gcc-sanitizers as part of the SDK on a Linux with a newer
kernel, the ASAN fails randomly. This was seen on Ubuntu 22.04.

This is also described at
https://stackoverflow.com/questions/77894856/possible-bug-in-gcc-sanitizers

Backport the fix from LLVM project, as gcc has not yet backported
anything for the 11 series.

Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


