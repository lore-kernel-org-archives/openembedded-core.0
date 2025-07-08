Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561B3C8303C
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:36:54 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.20655.1751985404239890212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DdzdHh7L;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a752944794so48471121cf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751985403; x=1752590203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NLzYj+B7jaUZmCHWW3UIL47WHLbu7/XkJo9V2HoTV8=;
        b=DdzdHh7LrrXM1p0HEN3IJyR6aoJllrntFkFSiEc1wiLzMmuogSiivfGcMHfTS29fie
         TMEORrWo3dt+vRR1Y7wi8HYwF6D51YmUfp+mMSUQ9u8/aiKEn+m7JhvTTGHK0lqdgaOk
         PVqCIAyvLD45BFo7wJuvPSjEOwZLXhux/RKO2iDi6iGP+v3S7Wv3Lb7IpphqhR3aqJp1
         5CeUyzMlSRjVlSd995HuZ2f471PJLc+0ezKeVc2EHa46x8nqGpGIgP05/wAZ/zWczzOs
         hgyfvSSp8/JCd+lAuIU6zFH81cPGEOi+CC0heBJ7ESAFJphiLm8M4rAIZU3VWri4uXLc
         LpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985403; x=1752590203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NLzYj+B7jaUZmCHWW3UIL47WHLbu7/XkJo9V2HoTV8=;
        b=Aspq7v9hy32V2Pw8jeb2OW4EGdEGC2KQhFw1Yrw0DYtMlS0PapyFeCGlYsKmtX/GE+
         QcZwsdyDv64ks5TuJM8j/5u4nLc/lq9bwOj6sK4I0gDnOP3OtAqPNvbOETYIeOSCMUpY
         xM2D4AQgbQBpV5/SgYeYXeNX6J6yA7Dd0xQ8sSvdhJSaZyvUX5aKL6FhivZglmzxZxO7
         0i2hV4eG4x34tpZvNg1kSrjZAwuT+keovhK+jaIKHKAvGllGqi5z/JuyuW8hI6s5AfnM
         P3kcD04LvvfcS6yIrdt3h+fc1kzUuge61jrf6sCNymo4wdgKhMnWO3piZVRuaUDMz4UF
         59Vg==
X-Gm-Message-State: AOJu0YzU2oR5t6ODJOLDQ45mlKTZJd/2A/Ky6uehyqYZ34SzRIm+P4Wh
	VgoeWTN2bKZtSlwLsEVfvY91Ckg/KLtKJ1GJz5NhGptQ92f8cWcfbIzs
X-Gm-Gg: ASbGncsIV6AiM2C8/BrhibNhomyENk7YkV1vKB6np0BUB1r62r9yL68ZS2qcC1RZvmB
	MmPjB+G68bGwMc7HsVjCs7jh7t9pyAhn2O/zofsHCjdLGmgqBEut+STV+UNpEYqqkVN3sA+qEQl
	F21Oo9cuOf7lmLOt91O5nw3WnwA/KVzqyYD3v5UA2+/dCAM9AB8m0YvZ+iGqC+p8xVgFMTMSZzn
	agmg00ZeL+WAY0s/tPHZaOezb5TnPzxCDx+iH9w/Na288LEF+MtuS/KD9ZgUJORzgtAzPEnPCyZ
	Q6WNZXLcOpdFoOzS7haPp9n9RBGnhLEmgi9wPqkpJ07EXVY3qes2830OV/PEAj+TL+vvAW0sISN
	ujzQduNJvASpt6ij4YZTAOLrv+iBlHdpIBhY/2iSVFycccJzy2Jzc9UbcVjmBnoeKAOElHkg8mw
	==
X-Google-Smtp-Source: AGHT+IEBhU6sCtRnnXgcVuUiNCf1YJ54asZU3otyFrKb31uC5zuWkrDthKmEEQEqRqywssOhwnpd8A==
X-Received: by 2002:a05:622a:11c4:b0:4a6:fac6:fa1a with SMTP id d75a77b69052e-4a9ccc65062mr63263221cf.49.1751985402753;
        Tue, 08 Jul 2025 07:36:42 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e4c8esm80462671cf.4.2025.07.08.07.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:36:40 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/6.12: update to v6.12.33
Date: Tue,  8 Jul 2025 10:36:32 -0400
Message-Id: <0a451a9833ce367e8bfe438688f2d940bca3abc8.1751985223.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1751985223.git.bruce.ashfield@gmail.com>
References: <cover.1751985223.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 14:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220035

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    e03ced99c437 Linux 6.12.33
    80fe1ebc1fbc Revert "drm/amd/display: more liberal vmin/vmax update for freesync"
    d452b168da17 dt-bindings: phy: imx8mq-usb: fix fsl,phy-tx-vboost-level-microvolt property
    1ed84b17fa9b dt-bindings: usb: cypress,hx3: Add support for all variants
    eb2d5e794fb9 thunderbolt: Do not double dequeue a configuration request
    b4fac3f172f2 usb: usbtmc: Fix timeout value in get_stb
    985961dd2688 serial: jsm: fix NPE during jsm_uart_port_init
    e428b7e205ed Bluetooth: hci_qca: move the SoC type check to the right place
    4490c7951898 usb: typec: ucsi: fix Clang -Wsign-conversion warning
    1a51004aa046 USB: serial: pl2303: add new chip PL2303GC-Q20 and PL2303GT-2AB
    393ad978388e usb: storage: Ignore UAS driver for SanDisk 3.2 Gen2 storage device
    23179d009cf5 usb: quirks: Add NO_LPM quirk for SanDisk Extreme 55AE
    a347664312be Revert "cpufreq: tegra186: Share policy per cluster"
    0c60158ff14d block: fix adding folio to bio
    3c4fed940db2 PCI/ASPM: Disable L1 before disabling L1 PM Substates
    4685153b121e accel/ivpu: Update power island delays
    f4deea418499 accel/ivpu: Add initial Panther Lake support
    6b482b16f32e rtc: Fix offset calculation for .start_secs < 0
    a6a55fe660f8 rtc: Make rtc_time64_to_tm() support dates before 1970
    f28fae36bad3 Documentation: ACPI: Use all-string data node references
    32b7c46c4dae acpi-cpufreq: Fix nominal_freq units to KHz in get_max_boost_ratio()
    614456f1a0fe pinctrl: armada-37xx: set GPIO output value before setting direction
    f49c751d6000 pinctrl: armada-37xx: use correct OUTPUT_VAL register for GPIOs > 31
    bf49527089ec f2fs: fix to avoid accessing uninitialized curseg
    db758487f3dd tracing: Fix compilation warning on arm32

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index f6bc400c71..5f6a563ee5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7e0aff00ea569c858bf82407f501a0bf1f678f35"
-SRCREV_meta ?= "4e9bf48139a77d0a5ce2d4d23a0e2316fe2f5fa3"
+SRCREV_machine ?= "d7a7983928e6846c682771f9671d958e4789d691"
+SRCREV_meta ?= "bc26c6c6b91fa0e4de4920544cc4aeeb3dedd894"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.32"
+LINUX_VERSION ?= "6.12.33"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index db512ddde8..6152ebfaa7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.32"
+LINUX_VERSION ?= "6.12.33"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_meta ?= "4e9bf48139a77d0a5ce2d4d23a0e2316fe2f5fa3"
+SRCREV_machine ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_meta ?= "bc26c6c6b91fa0e4de4920544cc4aeeb3dedd894"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 083b7b1325..f07bf26d15 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "22fa09f54f9c345541d8e68ca73106489acec177"
-SRCREV_machine:qemuarm64 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemuloongarch64 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemumips ?= "bf70488668471d5d0f6128d02cc23529132a7ee4"
-SRCREV_machine:qemuppc ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemuriscv64 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemuriscv32 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemux86 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemux86-64 ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_machine:qemumips64 ?= "b35f07357970c0de8cce2f6496090f8008ffc0ab"
-SRCREV_machine ?= "1cf1ca9467d84882daea5acf7426b214dd0a7fee"
-SRCREV_meta ?= "4e9bf48139a77d0a5ce2d4d23a0e2316fe2f5fa3"
+SRCREV_machine:qemuarm ?= "588ee9ffcc393af78905cd2e44d54a359d0e500d"
+SRCREV_machine:qemuarm64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemuloongarch64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemumips ?= "3610d715bf098ed5d47c98ca9ea395627488ce23"
+SRCREV_machine:qemuppc ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemuriscv64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemuriscv32 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemux86 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemux86-64 ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_machine:qemumips64 ?= "2fd393fbc1b2f8e809b07f4ffb73a4611a569c3d"
+SRCREV_machine ?= "897cf66d25d8a7290eeb899e27456f60fbf203ec"
+SRCREV_meta ?= "bc26c6c6b91fa0e4de4920544cc4aeeb3dedd894"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ba9210b8c96355a16b78e1b890dce78f284d6f31"
+SRCREV_machine:class-devupstream ?= "e03ced99c437f4a7992b8fa3d97d598f55453fd0"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.32"
+LINUX_VERSION ?= "6.12.33"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


