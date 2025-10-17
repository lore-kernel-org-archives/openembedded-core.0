Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00918CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:40:04 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.3143.1760733603270000399
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=J8HEQj/t;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so2053321b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733602; x=1761338402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnKOWXS92cSL88Z7ns0qHi2sXAYXecGftMdxPkvVssM=;
        b=J8HEQj/tQ9yuTZDOhd0WucvqLBOV8zxow/q0+LKCvOndWOb10h+NCLMxGp7I5wL2ol
         5km8WUZCmLI586CIHV9W/M3nsDc0wAPV/blEMuegOAC6H2d+snPP0Xd8DCJ/Z1zhnw2w
         dWfZzfexIZaCy8se6K5ZtPA0KIZulwOaBLvnPk0mvHDkXoDQkVqEnQ+Uet+ke+9CPAIO
         wm+7Xw920sl6RFfM10ZPO6Hp2QrszWvov7Tk7zXPkTQ33n1TQjmoWpT6N7n0iJPcceQs
         HjR8nf/MgBxBDVPNNktwtWGUBXviEyLWA/fZTnCYfK787MVowxB+dOFXup5ZaM1pX8N9
         TzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733602; x=1761338402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnKOWXS92cSL88Z7ns0qHi2sXAYXecGftMdxPkvVssM=;
        b=mW6ZrRSulPw8EMc6zHTy2PzBQzvs6QFULjMOAnAYRlAQae0n05jwnOl9DYCm308Hot
         FgP7n14I5iPCq/B3lq2LvmuIUP6uusI3ReUOZyOrFj6KmX36XtfzijsvnkJvyrXWMENx
         hoYUAIH7ICSIdBnMJcKzSUvXmkJnquKRcBd/Z912rtmP6czNUsKjNGRxcde1onXeinRm
         1NEdaCnqyn79GAwUHkThugCYCARguZHAGCb4CG6MW5WF8ZgqjpMpnIhz4Ep6nZL90pyH
         GI7PxuveTpbinhyXzFaa1HmMdM1xQQ9RSPOmmwSAaXnYRr3bEkoWmPFD/c/ZxLDO/1SK
         BlIg==
X-Gm-Message-State: AOJu0Yx+OU51dk7oAogrhp/LXWQdwcDO4w8cr2M4fQJksHUUubAx3IZr
	eNsHfv5g35XNFwOq4ROVNBM5BslXcb1jKfXy6uIJFycWHldUNMShRws4qW11bakXoHaPycm7DyF
	lGICndXU=
X-Gm-Gg: ASbGncuG2fGMKSc8zfM6mPiPs0duLk5VeJxniDtpGLaZXjMu87aP2uvC1FuA1NGNPUV
	LBXQczBRYh51nVZ9aOLEA4L2nk8G/jY0EjP7naAzvBKu10hLdLSXJCZfy6pW1Xyi/rI/oXjacOZ
	QbLDd0DLPYFGm/uhsa54m0SOQw9PeahaMceykbPRHqM4HFR3kvkHJk9MpEcdv1Vd3r0efLJdO4F
	/FApXakJbNCxblJWcoV7Ol1IyYjyyTrnFOw6GVTwMjKvzwL5immeg79Zu9bNJnZpiDINng6cen6
	dwboB4u7XOYK5omO82+BR4LFkEoHZRqf+EFXcqJz+HxA9N16hchoN0kO2bgvIolhm/tDtp83CqZ
	7C8tpLWMhT5C8FYYVdS84oYSDB7KcC4GfeZJMLSj2AiIbYRsPKyLwPeLQH+mk+qwNJePRStDIok
	4Z
X-Google-Smtp-Source: AGHT+IHghI/rxnSLxlczDQgN+plbeoI+S3eNMb7LbWARoQib6Mp85V9ug2PwE/I/ehHoZfFMQtLjdA==
X-Received: by 2002:a05:6a20:1611:b0:334:98c0:9c3a with SMTP id adf61e73a8af0-334a8585723mr5908068637.24.1760733602305;
        Fri, 17 Oct 2025 13:40:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.40.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:40:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/26] linux-yocto/6.6: update to v6.6.108
Date: Fri, 17 Oct 2025 13:39:03 -0700
Message-ID: <0b5c6e21160e54b3b571343d932614b23231e273.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225054

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    147338df3487 Linux 6.6.108
    42a6aeb4b238 Revert "loop: Avoid updating block size under exclusive owner"
    06146c26f5cf minmax: add a few more MIN_T/MAX_T users
    af8b531ecfd4 minmax: simplify and clarify min_t()/max_t() implementation
    2d396aa8264d minmax: avoid overly complicated constant expressions in VM code
    532733ff82b9 mptcp: propagate shutdown to subflows when possible
    3ef938f6f0b3 rtc: pcf2127: fix SPI command byte for PCF2131 backport
    075abf0b1a95 iommu/amd/pgtbl: Fix possible race while increase page table level
    564f2312e2ff xhci: dbc: Fix full DbC transfer ring after several reconnects
    3c6dd29a460f xhci: dbc: decouple endpoint allocation from initialization
    27b04564f7a3 phy: ti: omap-usb2: fix device leak at unbind
    34a8d5a198bb phy: Use device_get_match_data()
    0ee0ef483aae selftests: mptcp: userspace pm: validate deny-join-id0 flag
    650150cc9a3e mptcp: pm: nl: announce deny-join-id0 flag
    a6157484bee3 vmxnet3: unregister xdp rxq info in the reset path
    e7b7a9387955 smb: client: fix smbdirect_recv_io leak in smbd_negotiate() error path
    2374c11189ef crypto: af_alg - Set merge to zero early in af_alg_sendmsg
    6a075f80f303 drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error path
    15a77e1ab0a9 drm: bridge: anx7625: Fix NULL pointer dereference with early IRQ
    e6b0616a360f ASoC: SOF: Intel: hda-stream: Fix incorrect variable used in error message
    7740da20a3a0 ASoC: wm8974: Correct PLL rate rounding
    b4e8741955dc ASoC: wm8940: Correct typo in control name
    b7e4884dd853 ASoC: wm8940: Correct PLL rate rounding
    abc9f859a9ea io_uring: include dying ring in task_work "should cancel" state
    c8e69b783bc4 io_uring: backport io_should_terminate_tw()
    115e7d4d5ee8 ALSA: hda/realtek: Fix mute led for HP Laptop 15-dw4xx
    0a3d5a4d4adc selftests: mptcp: avoid spurious errors on TCP disconnect
    9ef1af5d4040 selftests: mptcp: connect: catch IO errors on listen side
    666b49c848f1 rds: ib: Increment i_fastreg_wrs before bailing out
    689aee35ce67 net: rfkill: gpio: Fix crash due to dereferencering uninitialized pointer
    7e4c3cd7f0a1 KVM: SVM: Sync TPR from LAPIC into VMCB::V_TPR even if AVIC is active
    6584e7ecfa7d mmc: mvsdio: Fix dma_unmap_sg() nents value
    ac4e940dc7da ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
    411f7d4f7038 ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer dereference if source graph failed
    468bb23472b7 ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
    fc7bd02dadb8 btrfs: tree-checker: fix the incorrect inode ref size check
    090b61b87420 iommu/vt-d: Fix __domain_mapping()'s usage of switch_to_super_page()
    561eef41aaa3 LoongArch: Check the return value when creating kobj
    2ff7ef2f71b4 LoongArch: Align ACPI structures if ARCH_STRICT_ALIGN enabled
    fb6ee62d3082 LoongArch: Update help info of ARCH_STRICT_ALIGN
    90c0ffa1e0d9 power: supply: bq27xxx: restrict no-battery detection to bq27000
    84ac57c4bbfd power: supply: bq27xxx: fix error return in case of no bq27000 hdq battery
    7c4491b5644e crypto: af_alg - Disallow concurrent writes in af_alg_sendmsg
    ee74d69af170 nilfs2: fix CFI failure when accessing /sys/fs/nilfs2/features/*
    d3cb3f209d35 ksmbd: smbdirect: verify remaining_data_length respects max_fragmented_recv_size
    eb0378dde086 ksmbd: smbdirect: validate data_offset and data_length field of smb_direct_data_transfer
    d2cfefa14ce8 octeontx2-pf: Fix use-after-free bugs in otx2_sync_tstamp()
    8eeb2091e72d cnic: Fix use-after-free bugs in cnic_delete_task
    cd093e8bdcfe net: liquidio: fix overflow in octeon_init_instr_queue()
    13f57d484676 Revert "net/mlx5e: Update and set Xon/Xoff upon port speed set"
    4cefe5be7388 tls: make sure to abort the stream if headers are bogus
    dfd06131107e tcp: Clear tcp_sk(sk)->fastopen_rsk in tcp_disconnect().
    97d797c5fc6f bonding: don't set oif to bond dev when getting NS target destination
    2cb17c88edd3 net/mlx5e: Harden uplink netdev access against device unbind
    fd74bd40f1a4 net/mlx5e: Consider aggregated port speed during rate configuration
    a7f10a466d36 i40e: remove redundant memory barrier when cleaning Tx descs
    0255c5100470 net: natsemi: fix `rx_dropped` double accounting on `netif_rx()` failure
    af114ef225e5 selftests: mptcp: sockopt: fix error messages
    dedaa9bcf79c mptcp: tfo: record 'deny join id0' info
    36d9f72e5d66 mptcp: set remote_deny_join_id0 on SYN recv
    29a5fd482cd5 bonding: set random address only when slaves already exist
    ea53e6a47e14 qed: Don't collect too many protection override GRC elements
    2f4b68e7905e dpaa2-switch: fix buffer pool seeding for control traffic
    4f364023ddcf um: virtio_uml: Fix use-after-free after put_device in probe
    5d2c34ff78b8 btrfs: fix invalid extref key setup when replaying dentry
    4a1e3ec28e80 cgroup: split cgroup_destroy_wq into 3 workqueues
    9ba2b399dee2 pcmcia: omap_cf: Mark driver struct with __refdata to prevent section mismatch
    eae22a2573a0 wifi: mac80211: fix incorrect type for ret
    93e063f15e17 wifi: mac80211: increase scan_ies_len for S1G
    0ffb49ba247c ALSA: firewire-motu: drop EPOLLOUT from poll return values as write is not supported
    6085291a1a58 wifi: wilc1000: avoid buffer overflow in WID string configuration

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 8c9704052e..591d7cfc06 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "30885ee3c489e60b779cc24e2fc03a8e6779d935"
-SRCREV_meta ?= "053630c8c982aba6d423a87ddc5bc048d02e1371"
+SRCREV_machine ?= "d26df76e222469eab0636af87da4c3c34a2c0b88"
+SRCREV_meta ?= "a904e672202ae6aefec7b1600df13c15734148f8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.107"
+LINUX_VERSION ?= "6.6.108"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 851f55a779..b32ae704f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.107"
+LINUX_VERSION ?= "6.6.108"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "aaaee193fafab055dd88cf0d607aae621d2176c4"
-SRCREV_meta ?= "053630c8c982aba6d423a87ddc5bc048d02e1371"
+SRCREV_machine ?= "9b27fa4c1b3ed0ded5a407913711813a1fd829c5"
+SRCREV_meta ?= "a904e672202ae6aefec7b1600df13c15734148f8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 86b21fdcb1..438bb6d56d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "55ed661faf43ddeb46b59ce680ae34f801f0795b"
-SRCREV_machine:qemuarm64 ?= "33aeb3e8739ce6389b0cf5b4215a1b73d4d5a943"
-SRCREV_machine:qemuloongarch64 ?= "b730d8dc28f20af856a66b9fdfbdc9b00ccd9fb9"
-SRCREV_machine:qemumips ?= "b1a43ff872dddc15f24c1a0e949370f2425826a4"
-SRCREV_machine:qemuppc ?= "8d992b51ac4e4623d5a8dd71bae46fe7018cc552"
-SRCREV_machine:qemuriscv64 ?= "b730d8dc28f20af856a66b9fdfbdc9b00ccd9fb9"
-SRCREV_machine:qemuriscv32 ?= "b730d8dc28f20af856a66b9fdfbdc9b00ccd9fb9"
-SRCREV_machine:qemux86 ?= "b730d8dc28f20af856a66b9fdfbdc9b00ccd9fb9"
-SRCREV_machine:qemux86-64 ?= "b730d8dc28f20af856a66b9fdfbdc9b00ccd9fb9"
-SRCREV_machine:qemumips64 ?= "01e9998c89f60f5bf5e6ffbb7708cd2f39c495c3"
-SRCREV_machine ?= "b730d8dc28f20af856a66b9fdfbdc9b00ccd9fb9"
-SRCREV_meta ?= "053630c8c982aba6d423a87ddc5bc048d02e1371"
+SRCREV_machine:qemuarm ?= "5e91abaa4811127504cb00853c6af078c56d90ba"
+SRCREV_machine:qemuarm64 ?= "6feefe0cbcfe7ca19e79301278220825e80596c9"
+SRCREV_machine:qemuloongarch64 ?= "cc50e1696b84b0a12b9721d407ff5945f632fade"
+SRCREV_machine:qemumips ?= "dd5b5367adaee59e606630182f14b424bb33cabf"
+SRCREV_machine:qemuppc ?= "ed23e394ef890bca72748a35fad57aa96f73fb85"
+SRCREV_machine:qemuriscv64 ?= "cc50e1696b84b0a12b9721d407ff5945f632fade"
+SRCREV_machine:qemuriscv32 ?= "cc50e1696b84b0a12b9721d407ff5945f632fade"
+SRCREV_machine:qemux86 ?= "cc50e1696b84b0a12b9721d407ff5945f632fade"
+SRCREV_machine:qemux86-64 ?= "cc50e1696b84b0a12b9721d407ff5945f632fade"
+SRCREV_machine:qemumips64 ?= "1bf580ad5f980683abed6fcef876b01da50d81fa"
+SRCREV_machine ?= "cc50e1696b84b0a12b9721d407ff5945f632fade"
+SRCREV_meta ?= "a904e672202ae6aefec7b1600df13c15734148f8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "af1544b5d072514b219695b0a9fba0b1e0d5e289"
+SRCREV_machine:class-devupstream ?= "147338df34870c0248133d7a986b1fab025ec56a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.107"
+LINUX_VERSION ?= "6.6.108"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


