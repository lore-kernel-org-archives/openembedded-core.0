Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D521CF537D
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:21 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.7918.1729686912044595933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LvnREZQN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c6f492d2dso77887255ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686911; x=1730291711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Og48+mQo+b/oBcC+Pwpd/ohwqUsdDqnqQ0bNOmeQyzM=;
        b=LvnREZQN7+8QxtwpbFMiod77vPhazJeX6iqwh/gmC0uK7qTNCnm3Xn8Wk2pjh/vWvM
         6ZMKltB8xJS8t5BJv9Be/PYCmIo/0caIYXhlxztszCN5mWnxehUlefZxVqoqnfJZ3bYE
         4KdFqZDPfX6zMw03YKp3jjcsR6+gnvoN9ds8Ea+KatsgNg6py6PwAnym70sXGwtPRRNL
         +oXwID30MPrCsTuvT+HC6mBoh6mPRl49Dvgy5Gf499QG04Wy8Bsw0VlbmT9gv7XfZxaZ
         lqUEk7In0Oifl9oi3Xvepj5AldihudsMqNzG8IBiklTEhnItGmRtOfYZuBarmL2ICwjM
         7G2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686911; x=1730291711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Og48+mQo+b/oBcC+Pwpd/ohwqUsdDqnqQ0bNOmeQyzM=;
        b=WK1SfifYCbrEqpLUYlDbtuLHF8MZZeGdYOKUY8VWARbo9uWaJn0cSEizffdcqnwKl2
         lDQXK1GgRl0vsjd5OOEZWa6YW0XspyJvEHHcQygNERa2SbJMWpxerKbw//2oNLhxnLPx
         F2Uc8E72+zHcpoTuXFyMHFkhd4DHt3KPN5cLWoouG+dMYApTu7zy1LV6RgzBBzGP7UMh
         xd458w1t54BF8nJpwWkDBQGhobhKZ1eHVHCJaVTa+N/SfB5oXZ4CSfxXJVD+8Qsv1oTm
         B4m/SnmslBaEK0onv5vHZ0JZuEQsNKOZkwaRvy2AkZUEwC2McgkjRIEL3yTicSsole5M
         lD1A==
X-Gm-Message-State: AOJu0YxlUmJseEFP6Ta/MgYIeUw2QRPt6nPFsdoXG94/Cl3xW733MR4+
	yLTBVMbuVRPnSzhHWoqXGO2+I5+hW772k8gf2D6SKOGrESkJhlAnxAwTP5z8oYYtEnmdwTsUSrt
	w
X-Google-Smtp-Source: AGHT+IGkkMC9Gw4gxDz0h9zpLISKHONPBLkZCrIWyG40PZDWMyoj7XprI4zcOzKORNFaH7+K8ut5Ag==
X-Received: by 2002:a17:902:f682:b0:20b:59be:77b with SMTP id d9443c01a7336-20fa9deacb9mr28292605ad.6.1729686911156;
        Wed, 23 Oct 2024 05:35:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 17/27] qemu: Fix build on musl/riscv64
Date: Wed, 23 Oct 2024 05:34:25 -0700
Message-Id: <36b05346e63f9885da45a3c3a06ad5f6a5cd905c.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206228

From: Khem Raj <raj.khem@gmail.com>

musl does not provide strerrorname_np() so do not use it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d7678118af5aa4bfbf6fb72b34f90a1e37b917c3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/fix-strerrorname_np.patch       | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f37b32985b..2786eedd42 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -21,6 +21,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
            file://run-ptest \
+           file://fix-strerrorname_np.patch \
            file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
            file://0002-apic-fixup-fallthrough-to-PIC.patch \
            file://0003-configure-Add-pkg-config-handling-for-libgcrypt.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
new file mode 100644
index 0000000000..5098e8a4e5
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -0,0 +1,27 @@
+target/riscv/kvm: do not use non-portable strerrorname_np()
+
+strerrorname_np is non-portable and breaks building with musl libc.
+
+Use strerror(errno) instead, like we do other places.
+
+Upstream-Status: Submitted [https://mail.gnu.org/archive/html/qemu-stable/2023-12/msg00069.html]
+
+Cc: qemu-stable@nongnu.org
+Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg' error 
+msg)
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2041
+Buglink: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15541
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+
+--- a/target/riscv/kvm/kvm-cpu.c
++++ b/target/riscv/kvm/kvm-cpu.c
+@@ -1731,8 +1731,7 @@ static bool kvm_cpu_realize(CPUState *cs
+     if (riscv_has_ext(&cpu->env, RVV)) {
+         ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
+         if (ret) {
+-            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, code: %s",
+-                       strerrorname_np(errno));
++            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, error %d", errno);
+             return false;
+         }
+     }
-- 
2.34.1


