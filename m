Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04D0CAC5B5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 19:11:53 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.172.1758654711547749282
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 12:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AraqCFMs;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-796d68804a0so58004876d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 12:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758654710; x=1759259510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TiOfsnq2foEjLVVvTfO5X8ghrevFEJnAl1FZNOrAtPA=;
        b=AraqCFMs6YUed3I3r0I4iEE8uGmLymQSK/ngAkN3F4ERrXiLzXjZG73Ckos5ZPKeZh
         sj/rYCaIV50ZNya73i/kSijn6WiEEHk5iQOkZm/zjwPa3XjRAdZUjJuaXwV8pDCEyJr8
         Or51ji4liINrxLHqRJkG3yVUCM1IzcFOQsPfH+rEPFqA4b2e3jjlS75WDREMGjWX+95F
         1zXMVVXd14fzsxyaI3Q0RsglqF2O5Io2JOQbEhtwpww8oWNul3+EEhit2HxMd4wgYPte
         +WiYvyiftuEhi1MZGakOK6jXj05b53+Y9M7FUEkxxl9iJPcT2S/IBxURiDAFGTrYTiEp
         019w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654710; x=1759259510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TiOfsnq2foEjLVVvTfO5X8ghrevFEJnAl1FZNOrAtPA=;
        b=dOohSdRGjUX7ybsYxKLfPpP+UCPvyqYLUNfQcdQmtnL31wBS6+dSfD9RMar028ezFg
         rjAUsu+TU2zsPPvwW++je6rhP1o8guGgROipBf2v2edQFqpJB1PcqnYOpRpXAGOoLZ+g
         X9hydIpgpOq+wEMbGAIB6laUgNVV8x50q8QLKHYk1kSi5LYec0boGNl7trmmx0EgW+Ne
         h+JWu0QDsclTKoxPGBRsHnn81k2HG7uFRNcscxLJ9ztpr7VUuQlUGPYtvYl7HYXtb3ht
         vKQfLOxAEa/p644fFXdbAqGBHAc9kIi1j1kNatCXp8k1pNBdn2HgRX59yV9aa+0WmUIJ
         XkdA==
X-Gm-Message-State: AOJu0Yw5U5cZq0VrgIQDI72ohqWatOGLdXPXeq+VDTSz4VgwrwwZEzFi
	dhqM8Zl4pAf95QkPZamwMZCfHPK0Z8ZMELD2MzioGXAaMRo7ZhcDdDp/run4VhubsU8=
X-Gm-Gg: ASbGnctUAVbyROmTlcDYfHiPcYYWFmg4iV/Y/kA22OSPZ+NqCLIyobQij2MgBhffup1
	cLJHqBAaiDndlzg76hatDjfBrwjyUFtOqs/Q1CMgf/dhdtMrctPoEvdCGlruYzI7KwGAsztbZUY
	tjdw/YmJSVQX2IZf8qhTMM+ZK14TbI3h6ARNm47iaVZXru2iLvpcnxOHGGTTPtVH7CCNDEuaBfr
	wBJ8FWG289rpwiCkVZqTl9T54fjpb9sMHc0irryFO3ORmD3zvdPonIbvlfBD8LpviYNKtx0FwD1
	9BV5sFwXDX6GqJ1qLR6ea+z2ec1YoywYPiblT0sWlDefQp0PcvmMocxE2BakmdKvpG9K2bdTpae
	6ojcfWs787BJEfC+fTxozGOHF3+1BJcO8DYPxzx5vmmN6U5Mxdbf9F0CnNR/YTyRKqUxh1N7P5j
	Lopq69Z3ffqUqXEwxLW7k1hP8SwOpSduI0xsGkaXKy4PivvVAdHgLTDdU=
X-Google-Smtp-Source: AGHT+IFWqbdg2vjdNv/xGn2a+k/2TvAJNd8dW4GNNAwerb4S7vFU/ZxnrjLmN8jST4R1tH3ZQUHLCQ==
X-Received: by 2002:a05:6214:5010:b0:782:3e4c:9ea0 with SMTP id 6a1803df08f44-7e71b334994mr36626046d6.59.1758654710312;
        Tue, 23 Sep 2025 12:11:50 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793443cf48asm94109866d6.15.2025.09.23.12.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:11:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5 v2] linux-yocto/6.16: genericarm64 refactoring, extension and clean-up
Date: Tue, 23 Sep 2025 15:11:42 -0400
Message-Id: <06a57ee6588c7fccb79aac7be4c221dfe225ae00.1758654576.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1758654576.git.bruce.ashfield@gmail.com>
References: <cover.1758654576.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 19:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223924

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    58666126 genericarm64.scc: enable OP-TEE support
    90e118e5 features optee.cfg: enable RPMB support
    1d4363c2 genericarm64.cfg: add MTD support for Hyperbus
    a6091c0a genericarm64.cfg: improve pmdomain support
    fb4ff102 genericarm64.cfg: add MTD SPI NAND support
    ce35b9dd genericarm64.cfg: enable Altera and Broadcom PCIe drivers
    7701e479 genericarm64-arch.cfg: add new archs
    20574dcf genericarm64.cfg: improve SPI support
    6575e9c2 genericarm64.cfg: extend sound support via genericarm64-sound.cfg
    7af0fff7 genericarm64.cfg: add more thermal drivers
    5baf746c genericarm64.cfg: add more ADC support
    82b8b2f2 genericarm64.cfg: add more mailbox support
    6bcc928b genericarm64-arch.cfg: add Rockchip IO domain and DTPM support
    4bd654f3 genericarm64.cfg: enable more Arm extensions
    2e7a98fb genericarm64.cfg: add more PHY support
    93405670 genericarm64.cfg: add Freescale and Rockchip NAND support
    206f0249 genericarm64.cfg: enable more graphics DRM support
    e475a5ba genericarm64.cfg: enable more CRYPTO_DEV drivers
    65ca974e genericarm64.cfg: add Renesas STM memory controller drivers
    20592693 genericarm64.cfg: enable DEVFREQ governors and drivers
    c23b00f6 genericarm64.cfg: add CONFIG_ROCKCHIP_PM_DOMAINS=y
    900c4d7c genericarm64.scc: enable SRAM support
    952ea4f7 zynq: use sram.scc for SRAM support
    93fdb4a1 sram: add feature with .scc and .cfg
    d75a77bc genericarm64.cfg: enable Qualcomm RTC and DSP drivers
    34a37d36 genericarm64.scc: enable nvme support
    a50d70a8 intel-x86: use nvme.scc
    0e4311da intel amd-x86-64: use nvme.scc
    8df9e176 marvell-cn96xx.scc: use nvme.scc
    c975d9dc bcm-2xxx-rpi.cfg: use nvme.scc
    64047a98 nvme.scc: add feature for NVMe support
    8e0c5d1e genericarm64.cfg: enable Tegra firmware drivers
    1badd0c5 genericarm64.cfg: enable Qualcomm security firmware interfaces
    a4393b2a genericarm64.cfg: add Google and MediaTek firmware drivers
    93cf7834 genericarm64.cfg: enable CONFIG_MHI_BUS_PCI_GENERIC=m
    413c8ca8 genericarm64.scc: enable firmware driver support
    8d812d85 firmware.cfg: enable CONFIG_FW_LOADER_PAGED_BUF=y and CONFIG_FW_LOADER_SYSFS=y
    624046ca genericarm64.cfg: enable more PCI/PCIe support
    8fb9f378 genericarm64.scc: enable more Bluetooth HW drivers
    bedb9b8a bluetooth-hw.scc: add config for Bluetooth HW drivers
    35baf131 bluetooth-usb.cfg: enable more drivers
    47061600 genericarm64.scc: add bluetooth-usb support
    5b21b9d9 bluetooth.cfg: enable LED events
    9cc05195 genericarm64.cfg: enable Qualcomm IPC drivers
    52932f92 genericarm64.cfg: enable CONFIG_NET_SWITCHDEV=y
    2bc84172 genericarm64.scc: enable kubernetes support
    6b383a08 qemu-kvm-arm64.cfg: enable KSM with KVM
    b58e205f genericarm64.scc: enable KVM support
    715986a3 genericarm64.cfg: enable ACPI memory hotplug and error reporting
    f362ed14 features: add memory/failure.scc
    ec58a666 genericarm64.cfg: enable CONFIG_BLK_DEV_INTEGRITY=y
    85984f29 features: add block/integrity.scc
    3a49bdb6 genericarm64.cfg: enable CONFIG_JUMP_LABEL=y
    19800309 genericarm64-arch.cfg: extend Tegra support
    ffcf3235 genericarm64.cfg: enable CONFIG_CPU_FREQ_STAT=y
    c594a800 features: add power/cpu_freq_stat.scc
    000bfa8a genericarm64-arch.cfg: enable CONFIG_ARCH_AIROHA=y
    e64dea75 genericarm64.cfg: enable CONFIG_SCHED_AUTOGROUP=y
    270015f9 features: add sched/sched-desktop.scc
    e711e072 genericarm64.cfg: add CONFIG_SCHED_HW_PRESSURE=y

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index e3cc651f76..ddd97d02fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "d9ac79e651b849ad8b16bc3f96af4cc54c30148e"
-SRCREV_meta ?= "abd3e56cdb1c200bac4e2496005649e3261cb9c3"
+SRCREV_meta ?= "58666126fdb734568fed6166d39940208a35d53f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index a63d7a198b..e9e8019a63 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_meta ?= "abd3e56cdb1c200bac4e2496005649e3261cb9c3"
+SRCREV_meta ?= "58666126fdb734568fed6166d39940208a35d53f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 580df960ae..0d9306cd8f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
 SRCREV_machine:qemux86-64 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
 SRCREV_machine:qemumips64 ?= "e6f7e24a7b76c6d1b3eaa3716fa1c4185de94aa5"
 SRCREV_machine ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_meta ?= "abd3e56cdb1c200bac4e2496005649e3261cb9c3"
+SRCREV_meta ?= "58666126fdb734568fed6166d39940208a35d53f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


