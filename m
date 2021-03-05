Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.7549.1614916470389222983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 19:54:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l+XLEpAN;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id z128so722044qkc.12
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 19:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/5qk5K2lRujxCQWwNYGpApgXHEYfO6CGIYDNN8KcNH8=;
        b=l+XLEpANMuYma8lTyZh+PbQgyRfjZsJ+Stk3pGJBWcyWT3pQ/FS8LsrX8iVZ0n8yzr
         kl6vhTJTvY8IBMJmX9X4FFxGB+7Hyh9fARHpQxGLa5kfjv2BFZJdRQLg8ezVSzTZ0RA+
         NSK8QwOmEheio+mMA5pI/iu8X+ITdQ66BlKY430hF3Y0Ecb9rbs5mR0IdUrFrXKJAeF6
         KVGyJdz1Brb2aNoqIiMI0zdtba9n8mdmoG1qo7kY3AUIcghu3yEUCdyrg/WJQ9U2HzA6
         Bg7oJv/hEV1lXFtHiKfmfzqu+Ac94wzyPMFFgx1O/dunuNK6p5rJ+/j0gGO1FcuHwQAU
         /G8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/5qk5K2lRujxCQWwNYGpApgXHEYfO6CGIYDNN8KcNH8=;
        b=ripPNgXcNMTuejMS4uBFBI7DXiRL+V0idowDdFaiqWwuhbRR89wOxkpUZR4Q6LH8Zl
         moEdfS9gmrVn/Xw5ghAqWzDUYmNffofq/6nctxfwcKQnBZOCstmRU32V5azo8WFO7O7q
         YQaubL+u4lHm2Y+2CoOUSpGvEMFmTfHW8Xxo0ShuJu6vaFruEqWsJvqdeYHiNnFEwU7Z
         /TBylcGVq5T/1TRndtn5zmj63dWTH0fjK1vd4SGf5BxVuk6GJaZxU4ps9iVZJ0NSQROd
         XXY/OqVbtMBTWkx++WByah+wvrMDcVJURN04SDBYhjhE1zS3n198MNojIM/8nYQssTNP
         Gdfw==
X-Gm-Message-State: AOAM530vYGjx1ph5virEmbkp/Ig/1E0n2uo9uSyjYc8FkoJ7ofGY88it
	1ba99Xpq613/X4jarCo6L4cDVJHE2gjZQ83/
X-Google-Smtp-Source: ABdhPJxtZwoeLD0QJt0VTVCpivRoW6ZxdQgqEjWXTPZPRdzK9sryKXRaU0ITV6N+KlBrJ4htBm27PQ==
X-Received: by 2002:a37:9d93:: with SMTP id g141mr7281582qke.270.1614916469408;
        Thu, 04 Mar 2021 19:54:29 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 66sm997383qkk.18.2021.03.04.19.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 19:54:29 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/5.10: fix x86 32bit boot warnings
Date: Thu,  4 Mar 2021 22:54:21 -0500
Message-Id: <57db7329becf6c6d811cc63389b652f72f556f73.1614916283.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1614916283.git.bruce.ashfield@gmail.com>
References: <cover.1614916283.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    34523d7c8476 qemux86: add configuration symbol to select values

In recent 5.10 kernels, the following traces have started appearing
on boot;

    [    1.010513] EIP: free_msi_irqs+0x49/0x180
    [    1.012036] Code: 74 11 8b 47 08 85 c0 0f 85 f4 00 00 00 8b 3f 39 df
    75 ef 8b 45 ec 8b 80 c8 01 00 00 85 c0 74 0a f6 40 14 01 0f 85 1c 01 00
    00 <0f> 0b 8b 45 ec 8b b8 d0 01 00 00 8b 17 39 fb 75 08 eb 40 8d 74 26
    [    1.016723] EAX: 00000000 EBX: c12199d0 ECX: c12199d0 EDX: 00000000
    [    1.021648] ESI: ffffffed EDI: c12199d0 EBP: c112bc78 ESP: c112bc64
    [    1.023517] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010246
    [    1.025449] CR0: 80050033 CR2: 00000000 CR3: 06cea000 CR4: 000006d0
    [    1.027293] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
    [    1.029115] DR6: fffe0ff0 DR7: 00000400
    [    1.030718] Call Trace:
    [    1.031986]  msix_capability_init+0x228/0x400
    [    1.033542]  pci_alloc_irq_vectors_affinity+0x18c/0x210
    [    1.035216]  vp_find_vqs_msix+0xca/0x460
    [    1.036693]  vp_find_vqs+0x29/0x190
    [    1.038097]  ? setup_vq+0x240/0x240
    [    1.039519]  vp_modern_find_vqs+0x21/0x80
    [    1.041014]  ? setup_vq+0x240/0x240
    [    1.042444]  init_vq+0x164/0x280
    [    1.043813]  ? ncpus_cmp_func+0x10/0x10
    [    1.045264]  virtblk_probe+0x104/0x770
    [    1.046860]  virtio_dev_probe+0x1c0/0x2a0
    [    1.048357]  really_probe+0xd5/0x3b0
    [    1.053029]  driver_probe_device+0x49/0xa0
    [    1.054539]  device_driver_attach+0x99/0xa0
    [    1.056077]  __driver_attach+0x60/0xe0
    [    1.057533]  ? device_driver_attach+0xa0/0xa0
    [    1.059136]  bus_for_each_dev+0x5b/0xa0
    [    1.060600]  driver_attach+0x19/0x20
    [    1.062033]  ? device_driver_attach+0xa0/0xa0
    [    1.063903]  bus_add_driver+0xed/0x1b0
    [    1.065358]  driver_register+0x79/0xd0
    [    1.066791]  ? loop_init+0x135/0x135
    [    1.068209]  register_virtio_driver+0x1b/0x30
    [    1.069742]  init+0x49/0x6f
    [    1.071040]  do_one_initcall+0x49/0x1e0
    [    1.072514]  kernel_init_freeable+0x16b/0x1b5
    [    1.074060]  ? rest_init+0xad/0xad
    [    1.075477]  kernel_init+0xd/0xf3
    [    1.076844]  ret_from_fork+0x1c/0x28
    [    1.078267] ---[ end trace 4deef4a5c447cb13 ]---

These are due to several changes in the way that MSI interrupts are
assigned and their fallbacks if they fail. Our 32bit qemu boot for
x86 does not have the right support by default, hence we get the
warnings (but boot continues).

If we define PCI_MSI_ARCH_FALLBACKS only for the qemux86 platform we
can supress the warnings and run without issues.

[YOCTO: #14219]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 54996a8aee..db17ffa5c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "142456428adbf16db56572889232220afb201974"
-SRCREV_meta ?= "8f72218572b1d4a5f053ced2bbf0558d0557072d"
+SRCREV_machine ?= "8dffd4d97d49439dae98e38b915729bca285f0cc"
+SRCREV_meta ?= "72ecf520873bd0e1a1d52db0a36d74ad88fd9824"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 8ecd10716a..1bdacd86c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "be720c1ce6d1cba2bb3815ad04773355339380ab"
-SRCREV_machine ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
-SRCREV_meta ?= "8f72218572b1d4a5f053ced2bbf0558d0557072d"
+SRCREV_machine_qemuarm ?= "55ff861a7f7be737c26b6c61f9cd170580dd3ccd"
+SRCREV_machine ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
+SRCREV_meta ?= "72ecf520873bd0e1a1d52db0a36d74ad88fd9824"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 38b56c17bf..c8ec0ae6b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "57a6fbd33df5c7f057f301387b03a70cdc582282"
-SRCREV_machine_qemuarm64 ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
-SRCREV_machine_qemumips ?= "79bd439bff3c9f95cac6fb81c76b559a404a32dc"
-SRCREV_machine_qemuppc ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
-SRCREV_machine_qemuriscv64 ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
-SRCREV_machine_qemux86 ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
-SRCREV_machine_qemux86-64 ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
-SRCREV_machine_qemumips64 ?= "07bda345fe202b1d2ce233ffc20b7570f78c9c7f"
-SRCREV_machine ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
-SRCREV_meta ?= "8f72218572b1d4a5f053ced2bbf0558d0557072d"
+SRCREV_machine_qemuarm ?= "b6e61f33c5ac14fde7fc4fd479fb6dba7c04797b"
+SRCREV_machine_qemuarm64 ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
+SRCREV_machine_qemumips ?= "4adb195168d3830786d82f29ccbb78664fd20cf9"
+SRCREV_machine_qemuppc ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
+SRCREV_machine_qemuriscv64 ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
+SRCREV_machine_qemux86 ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
+SRCREV_machine_qemux86-64 ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
+SRCREV_machine_qemumips64 ?= "36e98aa424aa3ceff3d446ee2cb3f44ddcae8c31"
+SRCREV_machine ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
+SRCREV_meta ?= "72ecf520873bd0e1a1d52db0a36d74ad88fd9824"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

