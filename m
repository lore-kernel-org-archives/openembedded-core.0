Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9E6C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 15:57:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.15740.1737734229385348608
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 07:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=05/8ChnZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so3402621a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 07:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737734229; x=1738339029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdxntduq6/3Jqfdtmvd8z8J8Y+YGb1aWMmBwR3nfwwk=;
        b=05/8ChnZENAg7jE+unLrtTlRTlrPGd4rfXaYoM+e+EHC4Lr+bp6uzqhY5yVE+K5eCF
         vxJX2ewMCkrqE9UH/T2E6l05KMvtSzVHB+EZDURj2JG44O7tSrpOeh/yGt96YAH3/S5G
         Oo4im5Ret3n9GjCINO0OTV3TzCvZjWb1XoYG4QSoS/lSSqgGLrWMqveFiOZGqD8OXAeh
         lgwpL7FO8DXMV2EdH+dQS1Yh1YqMpxp3At2uI1RT+6/3bJOVYXcYiq7zPIEzjqb1z5NA
         WNjwL8UD6MhK3R/etL6+ksYLKA+KtJMBX1suBw6qr4/1TyhTE98lKs8IAMYkVaAIG7nY
         t4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737734229; x=1738339029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdxntduq6/3Jqfdtmvd8z8J8Y+YGb1aWMmBwR3nfwwk=;
        b=gIQPAcMs2Ya/M2K4hxdFDECoXrQp4b7DSk+ru9OlsDnu42fJkuC5xoCDP6jqj19ZXL
         7N2p5QJgOVa7U0Cnvw8DqxJvKeEmKB5TIUuD1E6la/yT0kTmUXIwL2u3gx8pM83Ahb9M
         v9EFvxSHMZCl/y/cZAgTVI+8Ih3pnq4ur+8mxftryu2LSVnB0ILRxIcEqEd9xwcsVq+u
         Qtg+vuBm1QZlK6RaveQLmVgTEun7OWbamGuXxbcZSTMmTyF9sFV6rl/jHb2dw3d17j9+
         Clgy40goQHLpriw/z8YuV1eE/0pxtxk07lBYDAgmv9piq3Ai0yEuE1Cw7ZZcIZG/86+B
         PhNA==
X-Gm-Message-State: AOJu0YxkDmZ9dNsbdJBRQGbcSx4N655fPDuvYwZmTM6J7BuGlt3OmOsH
	MVrTC4uRiOYE3ebF0IH2k9P5SPZOUxvPCTp2CTra98XVi3357tphTZv9rfY4Z1EOrXa+Sxyy4mv
	ZwOM=
X-Gm-Gg: ASbGncub714XksO2BJbBWtU5bqszSdMo9jBi5eXfRurfOFZv7bcHWb8K/hU8ejFUL8j
	yO1qdYavtB4PRnpo23SnkRPwSLK/woM2lfjNj557YHiWVphkAL0goYQ4cgpssIL4QjuSLTMxHX8
	kz5p2yPrH7HplPXPMYuV9vwgnnhZR5IFp0FfGlErTS/YjDWm1zSMeMvrD8CzApERB+o9qWYdPEe
	zjthhUeqqn935QOGrWH8hCn5j0vO1qd/bXNJNkpJof5tv5aucHwCUPBT7TkOgmy7Oz5cg==
X-Google-Smtp-Source: AGHT+IGFkoSLY/GBmSt53ftYtcaxCPmwWEvmn7m3/G1AlU0U5e/f5gKGrW+pXmGTMKH942OAtj3WGQ==
X-Received: by 2002:a17:90b:5208:b0:2ee:863e:9ff6 with SMTP id 98e67ed59e1d1-2f782c99682mr47924777a91.16.1737734228667;
        Fri, 24 Jan 2025 07:57:08 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffaf9e98sm1879168a91.38.2025.01.24.07.57.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 07:57:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 3/6] classes/qemu: use tune to select QEMU_EXTRAOPTIONS, not package architecture
Date: Fri, 24 Jan 2025 07:56:51 -0800
Message-ID: <6db23345fd653aa0b4e483d2635376dfe7bed3cd.1737734087.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737734087.git.steve@sakoman.com>
References: <cover.1737734087.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 15:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210230

From: Ross Burton <ross.burton@arm.com>

Using the package architecture to select the right qemu options to pass
to qemu-user is incorrect, and fails for recipes that set PACKAGE_ARCH
to MACHINE_ARCH (as the qemuppc workarounds suggest) because there are
not typically any options set for the machine name.

Solve this by using TUNE_PKGARCH instead: for the majority of recipes
this is the same value, but for machine-specific recipes it remains the
same instead of changing to the machine name.

This means we can remove the qemuppc workarounds, as they're obsolete.

Also update the gcc-testsuite recipe which uses the same pattern to use
TUNE_PKGARCH, and generalise the else codepath to avoid needing to
update the list of architectures.

[ YOCTO #15647 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 414b754a6cbb9cc354b1180efd5c3329568a2537)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/qemu.bbclass            | 8 ++------
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 4 ++--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/qemu.bbclass b/meta/classes-recipe/qemu.bbclass
index dbb5ee0b66..8d7c82668b 100644
--- a/meta/classes-recipe/qemu.bbclass
+++ b/meta/classes-recipe/qemu.bbclass
@@ -60,8 +60,8 @@ def qemu_run_binary(data, rootfs_path, binary):
 # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
 # qemu-arm default CPU supports all required architecture levels.
 
-QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
-QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
+QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('TUNE_PKGARCH')) or ""}"
+QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${TUNE_PKGARCH}"
 
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
 QEMU_EXTRAOPTIONS_ppce500mc = " -cpu e500mc"
@@ -71,7 +71,3 @@ QEMU_EXTRAOPTIONS_ppce6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc64e6500 = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppc7400 = " -cpu 7400"
 QEMU_EXTRAOPTIONS_powerpc64le = " -cpu POWER9"
-# Some packages e.g. fwupd sets PACKAGE_ARCH = MACHINE_ARCH and uses meson which
-# needs right options to usermode qemu
-QEMU_EXTRAOPTIONS_qemuppc = " -cpu 7400"
-QEMU_EXTRAOPTIONS_qemuppc64 = " -cpu POWER9"
diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index 0a950b6c9e..af6c7ad5a9 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -53,8 +53,8 @@ python check_prepare() {
         #   - valid for x86*, powerpc, arm, arm64
         if qemu_binary.endswith(("x86_64", "i386", "arm", "aarch64")):
             args += ["-cpu", "max"]
-        elif qemu_binary.endswith(("ppc", "mips", "mips64")):
-            extra = d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH'))
+        else:
+            extra = d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('TUNE_PKGARCH'))
             if extra:
                 args += extra.split()
         # For mips64 we could set a maximal CPU (e.g. Loongson-3A4000) however they either have MSA
-- 
2.43.0


