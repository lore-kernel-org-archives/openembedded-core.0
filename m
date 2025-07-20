Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D1DC83F3D
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 20:05:27 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.24667.1753041918508807751
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 13:05:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SJfBbjqA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23c8a5053c2so33621955ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 13:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753041918; x=1753646718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pskwkQ91P3hbxtGcfpvZoIa+/7btWIZh54qMabXdJKk=;
        b=SJfBbjqAIpIYVwNT0ZjJ7FocFIMXhes/9wOfiWVgYwMfJSJCkVhupJnKEePTmR033G
         Wmv4jf9+QXF0p/iZlkmSNI5UerrVh5KJYK/5ARrHdHHKXYyL2Rl79ktxIT6ghOdc110R
         wXKGIHxp8iyUtJZkL3+N57JGGUMuLVSXAFEPttUV/aEpkSQeK13Lkyolqplvoxpgv5fd
         JMNexiozSBDbDHLx2gmkX74fxhfpmB/obrmW7T3Nm3+Fpf4Xb2sYtTW0H2iBvgj5B+pD
         IJP7Fin14tLFG/0zepvkP5Kqxp4Ha193AYhh0vJWPxCpE70l7pRtWJn0pnU05hztk8qy
         uLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041918; x=1753646718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pskwkQ91P3hbxtGcfpvZoIa+/7btWIZh54qMabXdJKk=;
        b=jZbx4GCjWcwVkoQtT34dAmIOsx//CiTMCWvwHwepMcUpAlaZTCrjZHx9ohVZZ0i03G
         DTzeMwSDBijDEPEKiwn1aIT2oCtr2vfFX8jIuJRbujOZ41Y54B9kpzZfCQojI4Uo8LTP
         qsBZXVxyrRJPjfgUTC7D9+6UGe/L1Lko8CSwyNjknSd0U5zSTUkiT78IJBsDz/RCamwr
         CVjt1KvsqNby4vXisvM+f3pRhu3dc3H4QJg1PmzXqx7Ie0HUYdKrthEbP1Vdqi8pQDrF
         7Vo7g8AVl7XpQz49e7+FcB7yh5OypNoxXoZ7i3jhMGrOhLeDmZN7+BKZAueaAf/aPWYX
         n2sQ==
X-Gm-Message-State: AOJu0Yw4ulxmE10uegv9BnmUlBKSVq6xWRUvAWc2yxly2GQ7KUOcfYjH
	e0vAHSRxmbnxJPV/jDumt9PPKDtnh0YSa6D0RJIafYQJFlpUhfKOjIOLJhZOaFDVdJSvQhZyn1k
	OFfCf3dU=
X-Gm-Gg: ASbGnct8QW/O/VRspHO26HOnOv+simUAQJtWhBXmKoFcwRtssrYd9XjL3HKs1OV9jKc
	hluVEAJo/FyqVMItTYs68Hu1OikAvSxm6eWI8cFZe0vLnxVaSP54RVnddV3W4WggvrtFTkr7MFQ
	V4akGIbyNO8qa7O/m3xHxXPx1p1yck2jkQ844BKDQsbM5Gw4dQIaBu75W8gAPF+PpIg08yNbz0A
	LwG3rNWQB6EUhbHQELQcNamAmxh1l7hDTu2wOx69DchN4dTlfUtiju5iV6okpkt7WwwY4fAfI8q
	wJMiMGaYYFkGKVLg7UYrsyFDNDloNJdjSasF6m8QgHD1EW8FkTDxfzKCFNH6b6mwP8h1pBg2XeW
	R2VJk8lwnfqAL6A==
X-Google-Smtp-Source: AGHT+IGSwNLbYe+Z/+esZDIjNC+QYx7s/34gAkxLQXv90ZqHUZnAPdRADbQ1yI2TFZFwauy4pGcbnA==
X-Received: by 2002:a17:902:f686:b0:235:ea0d:ae23 with SMTP id d9443c01a7336-23e24f366a9mr218707685ad.6.1753041917762;
        Sun, 20 Jul 2025 13:05:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:31c9:438f:a923:8d3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f096sm44894035ad.78.2025.07.20.13.05.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 13:05:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/12] linux-yocto/6.12: riscv: Enable TUNE_FEATURES based KERNEL_FEATURES
Date: Sun, 20 Jul 2025 13:04:47 -0700
Message-ID: <850949594410a9a228e164977c9e8a08f4a52876.1753041740.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753041740.git.steve@sakoman.com>
References: <cover.1753041740.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 20:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220635

From: Mark Hatle <mark.hatle@amd.com>

Allow the risc-v TUNE_FEATURES to select specific ISA (kconfig) selections
in the kernel config via config fragments selected by KERNEL_FEATURES.

This allows the following items to be selected dynamically:

    CONFIG_ARCH_RV32I
    CONFIG_ARCH_RV64I
    CONFIG_FPU
    CONFIG_RISCV_ISA_C
    CONFIG_RISCV_ISA_V
    CONFIG_RISCV_ISA_ZBB
    CONFIG_RISCV_ISA_ZICBOM
    CONFIG_RISCV_ISA_ZICBOZ
    CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI

Note: Some ISA options, such as CONFIG_RISCV_ISA_C may be reenabled by other
options such as CONFIG_EFI.  This is properly reported by the configuration
tooling.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45a1b5aa6abc9007d0d87efc2d740b5564a209dd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 389329030d..4d0a726bb6 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -37,6 +37,22 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
 KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
 
+KERNEL_FEATURES_RISCV = "\
+    arch/riscv/tunes/riscv-isa-clear.scc \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a', 'arch/riscv/tunes/riscv-isa-rv32i.scc',  '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a', 'arch/riscv/tunes/riscv-isa-rv64i.scc',  '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',         'arch/riscv/tunes/riscv-isa-fpu.scc',    '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',           'arch/riscv/tunes/riscv-isa-c.scc',      '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',           'arch/riscv/tunes/riscv-isa-v.scc',      '', d)} \
+    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',       'arch/riscv/tunes/riscv-isa-zba.scc',    '', d)} \
+    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',       'arch/riscv/tunes/riscv-isa-zbb.scc',    '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',         'arch/riscv/tunes/riscv-isa-zbc.scc',    '', d)} \
+    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',      'arch/riscv/tunes/riscv-isa-zicbom.scc', '', d)} \
+    "
+
+KERNEL_FEATURES:append:riscv32 = " ${KERNEL_FEATURES_RISCV}"
+KERNEL_FEATURES:append:riscv64 = " ${KERNEL_FEATURES_RISCV}"
+
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
 # and it can be specific to the machine or shared
-- 
2.43.0


