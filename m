Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CAFCA9EC7
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:28 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23576.1791708087852152830
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xeumlKDz;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a0213948d3so5922865e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708086; x=1792312886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MGV9SwW0n+TV2tCg77WAWatGSVfuRSXCp7XUN50HmTk=;
        b=xeumlKDzp9KIBrbmn0Eid48FHX+xHE8q9JCH14ec0cmRA8YfEtlmjg/D5ht6dt1WdK
         p2Ft2bmgHHZxvd/5GJfYuU5zVCPQGfwLOe0bTdqCHaa2+Vu4k1dXecTWaF9wD1dPcUXl
         8EgccGU7feKFCru8GIKtbwDypTyZfj/LNdj88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708086; x=1792312886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MGV9SwW0n+TV2tCg77WAWatGSVfuRSXCp7XUN50HmTk=;
        b=IZj9zi9x1Sh+hUbrbC1y4yp8qmHYcQrzDSsahcRhcCTqycoT4YHfkciN/DJ4Djl1IJ
         AxWmTxH/3XaKsbMN+rJmBZj9owXr4+VayW45u+j5OJnVBd5dzdPiNOGEPirJahZhm6Sr
         Admp9hKbSqXV4NtqKYaz8yAB3DIZPSyrht2EKPVPkTSv2lKgOzbZn+E1j5PjLi930fTS
         03FTb4LJL9+8NrrPKUUzVVjhgOjg162jZFbEnzblBfIs+QDhmnGRlWwLMFjXai49CD4+
         DxgxcpPqnIwtqTPuugrYbaRPFHPdRqO3PJvIW92a2bpZVKnAdJ2e5XGA5wiHsp2IIuYj
         aX8A==
X-Gm-Message-State: AFq9FYIdLjCmfmwFrJqF0Rag60sjCiH2brMVLeOXqhkISfXNojvxVRRJ
	amY2ux8Sbs717l7P/uSuX1prO3ooOn2Y5fZJLDJMKlCIEe2NAMem/ZNv75M/hciSUai+DczdKE2
	39JV4MT4=
X-Gm-Gg: AYBFou2fBrYMd34DxLYvKrVO6T5l+wVi2Bue/gU197RavfcVU34S4SLxHda/hvz1M06
	tfopahNpUfuOgSdkPUX/q/DBFlMafEytHzwtt5A0CPwCaP87NAyjHSwNl41fi/kh84OkbOk+p3u
	A/4lIl08cfQc3V+JW41ODE1xiBn85NvhF+I6stpKIKHj3p6XcjM5YCXToSqMAxS2aHfvB9CKvgo
	oG6kXw8SMX6Wg9IFZtNU0iJxPf2hBT+dQgPuydW/XhFT4IdUiiegfszshvfSfOwpukpNumVyCef
	682eO/CDPygLOc2RmD51pV2gFk2j3NteA4s4n2c3+dnJhQEaqvwf2wd9WoZAs4ehk6OudrctBog
	HrzZcHoZzAweCxBIUmWlykA7eOW2aaAwgAJuBHOWxJNv+O82nT99WIGiyzYmqOah2qLWYBnmrVK
	0YYUqlGt+M64HqamMfZSNFDClsUnNGYvCaos+tX2udCxJjiiLNXRjGIdnH7otUpvb3p0+scrNEf
	j74tELaPH4TSMKWiw7ZB/j4uHyfc5ThBfaS503JeJO48q8gO1gSzlxqaCGY1R3LyUoVmwsHRw==
X-Received: by 2002:a05:600c:64c7:b0:49f:ff32:803c with SMTP id 5b1f17b1804b1-4a18e49c536mr117069305e9.16.1791708086068;
        Sun, 11 Oct 2026 01:41:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 38/60] qemuriscv.inc: default to fw_dynamic.elf as QEMU BIOS
Date: Sun, 11 Oct 2026 10:40:11 +0200
Message-ID: <cfb8875e37a46b88b9ad1f3756a348d005394420.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247547

From: Harish Sadineni <Harish.Sadineni@windriver.com>

QEMU RISC-V can hang at boot when using fw_jump.elf as the BIOS if
the kernel Image is large enough to overlap the memory region where
the FDT (device tree blob) is loaded. This was observed with
KERNEL_DEBUG-enabled 6.18 kernel builds, which inflate the Image
size (e.g. ~27M -> ~33M on qemuriscv64), but the underlying issue is
not specific to KERNEL_DEBUG or to any one kernel version, it is a
property of fw_jump.elf's fixed compile-time boot address layout
which does not adapt to a larger next-stage image.

This was confirmed by dumping guest memory from the QEMU monitor at
the kernel load address and finding the FDT magic number
(0xd00dfeed, see scripts/dtc/libfdt/fdt.h) sitting where kernel code
should be, i.e. the DTB and Image had started to overlap [1].

fw_dynamic.elf instead receives next-stage boot information at
runtime from the prior boot stage rather than assuming a fixed
address, avoiding this overlap.

[1] https://lists.openembedded.org/g/openembedded-core/message/246090

[YOCTO #16409]

Suggested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 51b72fb2e8917a8627023f419b27a1d83132a361)
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index bac376ce5a8..d8522fd552e 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -29,7 +29,10 @@ QB_SMP ?= "-smp 4"
 QB_KERNEL_CMDLINE_APPEND = "earlycon=sbi"
 QB_CPU:riscv64 ?= "-cpu rva23s64,pmp=true"
 QB_MACHINE = "-machine virt"
-QB_DEFAULT_BIOS = "fw_jump.elf"
+# fw_jump.elf's memory layout can be overrun by a sufficiently large kernel Image,
+# causing it to overlap the FDT load address and hang QEMU at boot (see [YOCTO #16409]),
+# so use fw_dynamic.elf in that case instead, which avoids the overlap.
+QB_DEFAULT_BIOS = "fw_dynamic.elf"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 QB_NETWORK_DEVICE = "-device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"

