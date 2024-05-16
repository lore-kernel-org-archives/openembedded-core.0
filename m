Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F831C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:27:07 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.11211.1715858817430987966
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jqMCbx6/;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52388d9ca98so1214797e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858815; x=1716463615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NhBhQfXXChwHW9PIkKb918YPd7F2/Y3zMPCR1thn/8=;
        b=jqMCbx6/7Ky3mspPFiP1ulwNulf28ZCprFR/SIXWTait6CsOB53nw8hmASQZZEBxZC
         qmKFw8Yx3H+gmYgoAjDb1Si+eFFxqWpHMLJ4a6cAaTeHbjNNC51eQyRWY4V0j8uKLWX9
         1PBoDkfVMEe2N+W/yVOBvTOdkYZ5bL3jRRxivDrOHMb8axi31N4Av5ac1NhcSP/vPqq7
         LkJw27hQBtFXomulg3tzo6BomAAIDWQzcpn3aQV4wl8c64aqVTwr6pOPmulg3IBIDAuD
         d1/Aq1TEQTRAVCMTh91vwA5M1fMngfNEonhB4AUUF268yxFcGZ7o+OhhivdleYEPIw2d
         oRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858815; x=1716463615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NhBhQfXXChwHW9PIkKb918YPd7F2/Y3zMPCR1thn/8=;
        b=cSGLwVqIXIjsPgUrNJAMkpu+WUasRkgralFi3i6yWI6xyCbETT+MHtxeeO9I4yOaiH
         O9v2RQRotNawMJDDuV6ZeG9XrJd6N7pGN9470hVkX4NRfwYmdmTDvccbIq+jrrNKcRIm
         cNelRSPVHH7GFsa4bIRYXhOLybYalsMWWIm9QFmAgfI9mO2jXwEiuOF1mWadJhZ4kAcY
         ZTlfTIydoiwCicR8PIIAblGbfiNqnRrplDss16feB3W7nbCGYXShPpbgfZ3v3/y6krRt
         jh0X0lu31SV3FOCCuBxBONObHCarHXOcx2LjXAoQ9FuX/ynuGrthFmX5FbpVzMdKsnzi
         VkEg==
X-Gm-Message-State: AOJu0YzBgjECXmevyyUVo4rLFHLjXTCdl6A6S5N9HK3c1+byffPTkMhb
	fA6KAinIIb8ssUxfeDtk02TcniaDrH9xMCVzVw4hv9szckK48N5FIAmSlg==
X-Google-Smtp-Source: AGHT+IHBpTKSr5Y7VNkFudPOtiIcMYdXeCBh+Sz/N1/oOVf5obcfUB64LGVnS7E42Ydslmgf9/AzKw==
X-Received: by 2002:a05:6512:3d24:b0:51d:5f0a:8839 with SMTP id 2adb3069b0e04-5220fc7c529mr21530256e87.5.1715858815555;
        Thu, 16 May 2024 04:26:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:26:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/13] grub: remove unneeded 0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
Date: Thu, 16 May 2024 13:26:33 +0200
Message-Id: <20240516112640.2145789-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112640.2145789-1-alex.kanavin@gmail.com>
References: <20240516112640.2145789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199473

From: Alexander Kanavin <alex@linutronix.de>

Verified on qemux86 and qemux86-64 with grub and grub-efi.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ath-sse-as-well-when-SSE-is-disabled.patch | 44 -------------------
 meta/recipes-bsp/grub/grub2.inc               |  1 -
 2 files changed, 45 deletions(-)
 delete mode 100644 meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch

diff --git a/meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch b/meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
deleted file mode 100644
index 05a4697a734..00000000000
--- a/meta/recipes-bsp/grub/files/0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 006799e9c4babe8a8340a24501b253e759614a2d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 13 Jan 2016 19:17:31 +0000
-Subject: [PATCH] Disable -mfpmath=sse as well when SSE is disabled
-
-Fixes
-
-configure:20574: i586-poky-linux-gcc  -m32    -march=core2 -msse3
--mtune=generic -mfpmath=sse
---sysroot=/usr/local/dev/yocto/grubtest2/build/tmp/sysroots/emenlow -o
-conftest -O2 -pipe -g -feliminate-unused-debug-types -Wall -W -Wshadow
--Wpointer-arith -Wmissing-prototypes -Wundef -Wstrict-prototypes -g
--falign-jumps=1 -falign-loops=1 -falign-functions=1 -mno-mmx -mno-sse
--mno-sse2 -mno-3dnow -fno-dwarf2-cfi-asm -m32 -fno-stack-protector
--mno-stack-arg-probe -Werror -nostdlib -Wl,--defsym,___main=0x8100
--Wall -W -I$(top_srcdir)/include -I$(top_builddir)/include
--DGRUB_MACHINE_PCBIOS=1 -DGRUB_MACHINE=I386_PC -Wl,-O1
--Wl,--hash-style=gnu -Wl,--as-needed conftest.c  >&5
-conftest.c:1:0: error: SSE instruction set disabled, using 387
-arithmetics [-Werror]
-cc1: all warnings being treated as errors
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index cd667a2..8263876 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -846,7 +846,7 @@ fi
- if ( test "x$target_cpu" = xi386 || test "x$target_cpu" = xx86_64 ) && test "x$platform" != xemu; then
-   # Some toolchains enable these features by default, but they need
-   # registers that aren't set up properly in GRUB.
--  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-sse3 -mno-3dnow"
-+  TARGET_CFLAGS="$TARGET_CFLAGS -mno-mmx -mno-sse -mno-sse2 -mno-sse3 -mno-3dnow -mfpmath=387"
- fi
- 
- if ( test "x$target_cpu" = xi386 || test "x$target_cpu" = xx86_64 ); then
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index bb9aacb478a..e2a2a842773 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 CVE_PRODUCT = "grub2"
 
 SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
-           file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://autogen.sh-exclude-pc.patch \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
-- 
2.39.2


