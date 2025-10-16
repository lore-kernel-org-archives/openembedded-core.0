Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3277CCD193
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:14:44 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.4729.1760584475636075108
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=img7uA7U;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8599c274188so39455485a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584474; x=1761189274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCWAgrm6LRfGhkjjVDL2l2vKWcNCvzEKfcWnLOOPy/0=;
        b=img7uA7Uu6ZyGIjS4awg/CT1HezoXob/igdsQ6A8zkbL//9RFizXXso/MFOpSHmEsp
         1e7fzxjo7J8KhXL7Wy5EJutdkHdgiHj+pGYQPGZD28UtqR34SnqmyL2+Xy2M7aijme4D
         SgdcTD8jwTJ9OhNTN2MrG6a9qHsPvy8cgddhEdSOwZApETuE1pWBwVSxf9rgY6Iccc1m
         +pwbDar3J9br14mA5T/Thq5np6+rY8uzU7Q5TlChxa5Wek0Z3YGQtzusBkwpO/42AKLu
         yF76rAZ3fix5YEJY4WA4L0wrQP3q+asRlAMc9CcWllRx4M7rEnocK5eEGih1nHKNWlpA
         xL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584474; x=1761189274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCWAgrm6LRfGhkjjVDL2l2vKWcNCvzEKfcWnLOOPy/0=;
        b=ejPb3eh+d8jXSunxVSQXcRUeYK2yq4igukd5YOmd/mPhMdAqXbMR2SNs8yxkuyvdJs
         Wr8+e1YvQhXffewqWMgq3GnrmNwAxr7/l3mz5LTGdjUa0KMlYZ2xnn7gmNyyIdkRsb7n
         +mrS3T0JfBkWiTYhQtCuA03IB9IAkwfDi6AvDKP2V/2YEAKhS943i8d4fsEnKxrn53Hd
         WhSZpdfTrDS94IMBH0k90FIYZJHDQV9oOiSrKesL2ZwTCKqZp/wWMkZTAqHhEGEq6Vcq
         cqYTbjTeLRMmvI4VfKNyEOAV4nR2SnczvySFCq/Mb5pw7kcZWVAAkWXB1tIwxJ/KmQNs
         qBWg==
X-Gm-Message-State: AOJu0YxOH6hCvE93FJkXhn8WnZI2hB8NTwD7BzjDfnFQyTQo8OmuUGOt
	uXPVbv/+70IB5zBpYSxHHR81YFf5BcHBIaUk084XXr0nazcLqtTGLNihMoB1m3RJGoQ=
X-Gm-Gg: ASbGncsjTBmK7ZEtMFmzWZ+4zmu7/5mTe7rr9LtutmFT5tzQ/Ifx6bRaIdcmc8AXtVD
	zjWV3EztBqHMzqAnJGF+5VI1z4nIs5LuA/0z1RrxGDjqOOxfM7UqTqt6IcKV1v8NgZ7z44tGv/m
	UWXRgG1tw+Hv70E0BWcefHZ2wymnxAo3/lNHQNZomvN+aowY5dukqUk2mxJFB8RtcAKlGxGsHHp
	gPEGH2el/FOGEVAqmwqbGA38UgjYtm7YVvPmTsthiVDBwjBZgJfw7BLqKGLF+deizzYjYXGzVD4
	yQM55gVYAf+tz3FzjLXrzLxiEIqUUoUGI/79eDAg5XFEWv6gz3d+HVvSrO8riAUGpWB95ohJ5Fs
	BJafuDppyDHiEE7p/KiV8tco8+U5V2g47LD5PNPCanLMKcbUBBbEqZMHCwJag8dM57qkWprqZzH
	AZhleFwVQ7rQvpGX5y9Y2KAM/44RVwtOnl4xF02rQGgFvIoK+mGDOJcug9kPQ45DdXC472m29MU
	Tc7
X-Google-Smtp-Source: AGHT+IHvlyoSNStRPpncbRoFVCp0mp9VRuXLBDxi3jtGtMU8U9THr+Mu3s27r5a5bNi9QdrjAw2HQw==
X-Received: by 2002:a05:620a:3710:b0:815:dab2:1ea8 with SMTP id af79cd13be357-88355097920mr3576509085a.79.1760584474149;
        Wed, 15 Oct 2025 20:14:34 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-88f37f45149sm109327085a.32.2025.10.15.20.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:14:32 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [OE-core][scarthgap 09/12] linux-yocto/6.6: update to v6.6.108
Date: Wed, 15 Oct 2025 23:14:18 -0400
Message-Id: <20251016031421.3207596-9-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20251016031421.3207596-1-bruce.ashfield@gmail.com>
References: <20251016031421.3207596-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224935

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
2.39.2


