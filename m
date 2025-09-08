Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A12ACAC582
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 21:07:09 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.6071.1757365623119362808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 14:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HjQIKSUN;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77287fb79d3so3949934b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 14:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757365622; x=1757970422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkOWJA48aarUO5caKwStLqTI0ZQbdGjMg07KZOLrFgI=;
        b=HjQIKSUNinvguJqe4MWnLoAt5xRoXLkkyBIF4xcIot2Bn/RujcNc8stNBm2AzrQM0o
         rJFWO4G9vWQbBznfJElNxVLLd7SBmT/In6Y58xiyVBMP1nfhy0mA0OTjHd0sYF4Rfxum
         hOAs+JogSvsQWG0SQyviLIgIqtF4+OFrO9wSjHgVKlqGID7lmK6B8QkmD9mFP0sYti9F
         7x6dtNeYuiLffILm94SR+GgZF1V7gMvHetsMy4yXuaOFEKTuCugyVHmETVxOzUG+q7WY
         A4NPrwUzUT/XQTX4a8ogbasVObBCPIQ3e4rfdjI4f3bfxiopGakv4G6S/dtwOu5rfSxf
         jtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757365622; x=1757970422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkOWJA48aarUO5caKwStLqTI0ZQbdGjMg07KZOLrFgI=;
        b=VVGcqWqjgA8yEwh5I88YVaPNDxuNAZJt4rc+uFYf3II5aGcH7lduA9PiBXGz0oaLqK
         /RIaVASXaKXkhfNZuArSL3BNg76YeXDdyQJlwPfUlsGFJO/5U4Xj9DZ/iJiP0he/pj7B
         dc5r4BtzGww6XB8xMU3IZgta9Bn3uGIVLrJf3i6Dq7u9UJW9cxRXU7qQBmNeQf35NR9V
         VlTehQe01+LVmt13Uk0k03Bna1UEb0X+0RDaI9xQW353LEI8TszzKrVr3McTMl+sbjiW
         ypuMnA7R7/LpopIy5x4JlM8wenffawDO4ZYyhBc29CESHkubR0hJRlrAzm4ho0eTr6kZ
         TkQQ==
X-Gm-Message-State: AOJu0Yx7x/7d5x92rXFKl8mZ3nXiPNqfjnOxOGi00WMJL1KSVcTIfw6g
	cf3gBcDBjmSU/tUmNWZb5skadjfnh78juH2s1YZN1HfQqPUwN2Jy10+ZeqRT5RiD
X-Gm-Gg: ASbGncvtDqGLAVT2PWR/H4+7flLvebHn675zye9UzO5UGys2/B2BFG4dX5UGJN/fv44
	+dmctqxYyvGTtjcdHQW6AJqiofeqeQpkK23nBHI5dPcKhrUPiziIy24pIJ6or6UXenJNp1CPwzP
	9kO90Fmv8PORdob8LoMrAf9EN0DxHbisuy0JY0vS0A8tXVrjtcKIq0U1nVxcFUmnicOZnhyLOX6
	ZCzfvlFCHGxuNsEEzfbq2J4cyXUUmfgPN9Luh3SAWMnVul6mE+AgDlMlo7yO/DVOc3NXdW/NbLt
	lxJfAaqsgv92HyiuW3EPPFVLm7//c4Jpb4n0tAV60lIfyslclYHdWYybDbJdT/k4mjGuD2gp9n3
	TTN9F2r3LZ8MfJIqscKKLSOs9hB2Ujb1HOsTh0CP+YwsjxIsjSTTjAf73SlIUgU358dCpOf+Z+r
	prTDCHZcpUCoMW7GT6P+84Vx6a9TVMLXrV3U1unDqnOQvRw1BJeFY=
X-Google-Smtp-Source: AGHT+IGHaQYrLypJqRRoU42r2ij3hlREQbjsTboMC9+vCi+43jlldwt/4VjdEZS88/K8JhYiEk11rQ==
X-Received: by 2002:a05:6a20:72a3:b0:243:c36f:6a71 with SMTP id adf61e73a8af0-2533d226078mr13862223637.21.1757365622040;
        Mon, 08 Sep 2025 14:07:02 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fe29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32bdbef7f2csm9982888a91.27.2025.09.08.14.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 14:07:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 3/3] kexec-tools: Fix build with LLD linker
Date: Mon,  8 Sep 2025 14:06:57 -0700
Message-ID: <20250908210657.2959408-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908210657.2959408-1-raj.khem@gmail.com>
References: <20250908210657.2959408-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 21:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223082

With hardcoded -Ttext,0x10000 and newer toolchains emitting
.note.gnu.property before .text, the link can fail with an overlap.

Provide a minimal linker script that:
  - sets the image base to 0x10000,
  - places .text first at exactly 0x10000,
  - moves .note.gnu.property after .text,
  - optionally fixes .bss at 0x12000.

Works with both ld.bfd and LLD 21+.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Update the Patch-Status to Submitted
v3: No change
v4: No change

 ...nt-base-match-pinned-section-address.patch | 62 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.31.bb               |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch
new file mode 100644
index 00000000000..6babf16e6ed
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch
@@ -0,0 +1,62 @@
+From 0d8a9e12b6509cb2a79818f5f4062a0bee33edfc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Sep 2025 13:28:32 -0700
+Subject: [PATCH] Make the segment base match pinned section address
+
+ET_EXEC uses image base of 0x400000, but the build forces
+section VMAs like .text = 0x10000. LLD now errors when any
+section address is below the image base unless you explicitly
+set the base. (Older LLD tolerated it.)
+
+To fix this, set the image base to match forced section addresses
+
+Fixes
+| x86_64-yoe-linux-ld.lld: error: section '.text' address (0x10000) is smaller than image base (0x400000); specify --image-base
+| x86_64-yoe-linux-ld.lld: error: section '.bss' address (0x12000) is smaller than image base (0x400000); specify --image-base
+
+Upstream-Status: Submitted [https://lists.infradead.org/pipermail/kexec/2025-September/033493.html]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kexec_test/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/kexec_test/Makefile
++++ b/kexec_test/Makefile
+@@ -5,7 +5,7 @@ RELOC:=0x10000
+ KEXEC_TEST_SRCS:= kexec_test/kexec_test16.S kexec_test/kexec_test.S
+ 
+ dist += kexec_test/Makefile $(KEXEC_TEST_SRCS)				\
+-	kexec_test/x86-setup-legacy-pic.S
++	kexec_test/x86-setup-legacy-pic.S kexec_test/kexec_test.ld
+ 
+ BUILD_KEXEC_TEST = no
+ ifeq ($(ARCH),i386)
+@@ -31,7 +31,7 @@ $(KEXEC_TEST): CPPFLAGS+=-DRELOC=$(RELOC
+ $(KEXEC_TEST): ASFLAGS+=-m32
+ #$(KEXEC_TEST): LDFLAGS=-m32 -Wl,-e -Wl,_start -Wl,-Ttext -Wl,$(RELOC) \
+ #		       -nostartfiles
+-$(KEXEC_TEST): LDFLAGS=-melf_i386 -e _start -Ttext $(RELOC)
++$(KEXEC_TEST): LDFLAGS=-melf_i386 -e _start -T $(srcdir)/kexec_test/kexec_test.ld
+ 
+ $(KEXEC_TEST): $(KEXEC_TEST_OBJS)
+ 	mkdir -p $(@D)
+--- /dev/null
++++ b/kexec_test/kexec_test.ld
+@@ -0,0 +1,16 @@
++ENTRY(_start)
++SECTIONS
++{
++  . = 0x10000;
++  .text : { *(.text .text.*) }
++
++  /* Place the note after .text to avoid overlap */
++  . = ALIGN(16);
++  .note.gnu.property : { *(.note.gnu.property) }
++
++  .rodata : { *(.rodata .rodata.*) }
++
++  /* If you need bss fixed: */
++  . = 0x12000;
++  .bss : { *(.bss .bss.* COMMON) }
++}
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
index 7333aa73c17..b12f76a0bf4 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
@@ -19,6 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
            file://0001-ppc-fs2dt-Match-function-signatures.patch \
+           file://0001-Make-the-segment-base-match-pinned-section-address.patch \
            "
 
 SRC_URI[sha256sum] = "ddaaa65b02b4f8aa9222586b1f26565b93a4baeffd35bcbd523f15fae7aa4897"

