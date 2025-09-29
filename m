Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16FCACCA46F
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 18:59:44 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.6642.1759172375883641167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 11:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V12/wqEf;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-85d5cd6fe9fso374572785a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 11:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759172375; x=1759777175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KY8UWgZuF2w3u1m7SuMPVYjH8ggyj3ttBP2DG7oty/A=;
        b=V12/wqEfIFHri7NkmnADU9ecJeNQzF7TTl4D9mc+GlCRwpN2qQ2AmkCWUS5UpWS2L9
         7zEalTxSit3qvcq0CZ9uIR8FOQTXTiLAHQbckhXKh8uoqnZffIB1LCm9G7rWdTnzjnTm
         SXt8+AUoPYZhiVDtCgdb6/JS1Rvwz5X5xYpQL28ntrXUk7O9ayQaAqoGPkSf0GIE46Nh
         7zUj/TwRwC+U0rcNAuqSLUoUeF5dhhmSE3LSDRiuW6qDyktPRHYTeZYEUbkmUHqhqrk+
         rIcy9ZRWHSMigJl3TarzoCi5zgfTRreLpGJJmyJQ4gKm0fqjuA2Kl8pdh12VV5er4Rxl
         KbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759172375; x=1759777175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KY8UWgZuF2w3u1m7SuMPVYjH8ggyj3ttBP2DG7oty/A=;
        b=vYywzGKNRNZ5VRPvFiWIBVENZQEt0iFY8VtaqhZzwD04d5MURzr1Vxvz7xZaPuq+He
         bInccyx3hjwi+Zpzvli6EnGb9sXPg24EulEHAv/B2E3vb59FZxgOmlV1A64LG6UJb5uW
         RiCVT9hgh6SA/8Lpy54ibbb5jwGu5PIOvCRyx6ZMyR4w8pr0fqS0/qtkf4DNKtekny7w
         fgOPUnSrZAYc8UIs0KMmC4DP2D4FGP8xCF6UbAS9LkH/WaX51e0gPEz0Rx1UcxDGxt9W
         BYp0ZJUHtVmGb/zegn+cO0nlomYhh2gCJLtgN8jVD61AaVD0V7mhpp3Lw9XEKjK1NEKA
         CDGw==
X-Gm-Message-State: AOJu0YxUTiEJs92mj4KrDKhpB0nSPpi8Kz+KiZqpqiMGoic+yRs+/p2b
	mz6HQjG847GmNc9fzljgRNbBHothN049fX0WkJg98m5M9zlrAKt5/htgjQfsXjgkIqc=
X-Gm-Gg: ASbGncsvHQ3MV86CwZkGpPvciBwjteAoC6v0FOzg1sEgyc0cJpxLNChZ1eWWJbRE3rs
	z0cXi3kVxi5KDaws+WcI+2WZyYviaWLHObVuAq+XXB6ZzNm2Lg/76vgvOtH+LJxxusj0sWsCXrO
	UOfhcGn6MsQHQMMKK0nKC5HQ20O6vmK6wrgBRqqVP1CN43Ce94noc0baqQ4W9JB9Fg6kNArfKQH
	N97oFsylsgHVOGmSPPibdOATT5cQltTxFXQLYlh44NQi1CcY80RCtvXbb5pbKhFF2gepve2OkSS
	4T3u1/7M0leC9Bd39nqW/cepBIE2dWaTnIsYXn/x7InYAbX9bfeIrfIlFTNEl/u8g2ktMZ+FQyn
	UZCGHX3d/Vtira4967ggatQU0EUFg+rO5rOL+DlqV8O82fc05JTEevFYB7sUHAMKKoStATJ4wT2
	h5mfkMgoZVeDD6URApUWHBRu5oizCzAb62tJ9tDVnXF+RmzoHIVuFswUI=
X-Google-Smtp-Source: AGHT+IHBiOCGHcLZaQo6eKpgZt8AGRPdOswh6HXctT6mqgbnxmmiR45GnkJxo67GKhmM/ebAsY1phA==
X-Received: by 2002:a05:620a:1710:b0:865:4739:3dc3 with SMTP id af79cd13be357-8654757c353mr1013698885a.30.1759172374587;
        Mon, 29 Sep 2025 11:59:34 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c337a1e1csm873240285a.62.2025.09.29.11.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 11:59:34 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/6.12: update to v6.12.49
Date: Mon, 29 Sep 2025 14:59:29 -0400
Message-Id: <20250929185930.1689034-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250929185930.1689034-1-bruce.ashfield@gmail.com>
References: <20250929185930.1689034-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 18:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224168

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    da274362a7bd Linux 6.12.49
    6553fdf0f7d4 minmax.h: remove some #defines that are only expanded once
    cf5fe0b36f10 minmax.h: simplify the variants of clamp()
    5c2b06b31da6 minmax.h: move all the clamp() definitions after the min/max() ones
    5f6818002047 minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
    e94ce277b568 minmax.h: reduce the #define expansion of min(), max() and clamp()
    ab58f71b8fdf minmax.h: update some comments
    d9c5ccf6b69b minmax.h: add whitespace around operators and after commas
    63fd831aa5dc rtc: pcf2127: fix SPI command byte for PCF2131 backport
    207fa0d49522 xhci: dbc: Fix full DbC transfer ring after several reconnects
    490f1ca013b5 xhci: dbc: decouple endpoint allocation from initialization
    9b28ef1e4cc0 usb: xhci: remove option to change a default ring's TRB cycle bit
    e5051c055926 usb: xhci: introduce macro for ring segment list iteration
    c839be6df4da mptcp: pm: nl: announce deny-join-id0 flag
    34f351c0fa95 mm/gup: check ref_count instead of lru before migration
    096c5b1fde51 mm: add folio_expected_ref_count() for reference count calculation
    23da4e0bb2a3 vmxnet3: unregister xdp rxq info in the reset path
    ca8938704142 KVM: SVM: Set/clear SRSO's BP_SPEC_REDUCE on 0 <=> 1 VM count transitions
    e5a3331a2e98 x86/bugs: KVM: Add support for SRSO_MSR_FIX
    f9c6aec2a6dd x86/bugs: Add SRSO_USER_KERNEL_NO support
    0a3ac13d8686 platform/x86: asus-wmi: Re-add extra keys to ignore_key_wlan quirk
    7228ed156377 platform/x86: asus-wmi: Fix ROG button mapping, tablet mode on ASUS ROG Z13
    a89c34babc2e io_uring: fix incorrect io_kiocb reference in io_link_skb
    922338efaad6 smb: client: fix smbdirect_recv_io leak in smbd_negotiate() error path
    24c1106504c6 crypto: af_alg - Set merge to zero early in af_alg_sendmsg
    6ae90a2baf92 smb: client: let smbd_destroy() call disable_work_sync(&info->post_send_credits_work)
    b814660334bb smb: client: fix filename matching of deferred files
    ea5cbcecd54d drm/xe: Fix a NULL vs IS_ERR() in xe_vm_add_compute_exec_queue()
    f108c98c7005 drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error path
    0da73f782769 drm: bridge: anx7625: Fix NULL pointer dereference with early IRQ
    503de75db426 drm/xe/tile: Release kobject for the failure path
    22814abfd961 ASoC: Intel: catpt: Expose correct bit depth to userspace
    b51ded0f604e ASoC: SOF: Intel: hda-stream: Fix incorrect variable used in error message
    e5c10cec7a1b ASoC: wm8974: Correct PLL rate rounding
    987b1d5e39b9 ASoC: wm8940: Correct typo in control name
    ccba708502b6 ASoC: wm8940: Correct PLL rate rounding
    695673eb5711 io_uring/kbuf: drop WARN_ON_ONCE() from incremental length check
    93e9d0293d3b io_uring/msg_ring: kill alloc_cache for io_kiocb allocations
    e6b2b4a0ffd8 io_uring: include dying ring in task_work "should cancel" state
    d7a38ee4f0be io_uring: backport io_should_terminate_tw()
    9b71bfefc405 io_uring/cmd: let cmds to know about dying task
    9ffc5f132a35 ALSA: hda/realtek: Fix mute led for HP Laptop 15-dw4xx
    acab5c56a6fa selftests: mptcp: avoid spurious errors on TCP disconnect
    2b5b0674686f selftests: mptcp: connect: catch IO errors on listen side
    ca261278c6b7 mptcp: propagate shutdown to subflows when possible
    60b07b9f6093 rds: ib: Increment i_fastreg_wrs before bailing out
    21ba85d9d508 net: rfkill: gpio: Fix crash due to dereferencering uninitialized pointer
    232e74984061 drm/amd/display: Allow RX6xxx & RX7700 to invoke amdgpu_irq_get/put
    2ae6d79a769b KVM: SVM: Sync TPR from LAPIC into VMCB::V_TPR even if AVIC is active
    bd5524ec7155 mmc: mvsdio: Fix dma_unmap_sg() nents value
    6dbac7d814a7 ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
    9c534dbfd172 ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer dereference if source graph failed
    d1c96316e4c1 ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
    bf46ed89bf24 btrfs: tree-checker: fix the incorrect inode ref size check
    cd92c8ab336c iommu/amd/pgtbl: Fix possible race while increase page table level
    c023b4f4444f iommu/vt-d: Fix __domain_mapping()'s usage of switch_to_super_page()
    1e68a5f046e9 LoongArch: Check the return value when creating kobj
    05a76baf2700 LoongArch: Align ACPI structures if ARCH_STRICT_ALIGN enabled
    382f5ff57010 LoongArch: vDSO: Check kcalloc() result in init_vdso()
    040f278cc1a5 LoongArch: Fix unreliable stack for live patching
    b6f29fa5f603 objtool/LoongArch: Mark special atomic instruction as INSN_BUG type
    89d40cc647da objtool/LoongArch: Mark types based on break immediate code
    1766f14c8f97 LoongArch: Update help info of ARCH_STRICT_ALIGN
    cbb8cd66d0bc mm: revert "mm: vmscan.c: fix OOM on swap stress test"
    f6e161f3fa99 gup: optimize longterm pin_user_pages() for large folio
    f8f64254bca5 dm-stripe: fix a possible integer overflow
    cb58eaad2235 dm-raid: don't set io_min and io_opt for raid1
    7061e566ce5d power: supply: bq27xxx: restrict no-battery detection to bq27000
    f91359651678 power: supply: bq27xxx: fix error return in case of no bq27000 hdq battery
    9aee87da5572 crypto: af_alg - Disallow concurrent writes in af_alg_sendmsg
    1adc72411f3d nilfs2: fix CFI failure when accessing /sys/fs/nilfs2/features/*
    9644798294c7 ksmbd: smbdirect: verify remaining_data_length respects max_fragmented_recv_size
    8be498fcbd5b ksmbd: smbdirect: validate data_offset and data_length field of smb_direct_data_transfer
    e97c45c770f5 perf/x86/intel: Fix crash in icl_update_topdown_event()
    ff27e23b311f octeontx2-pf: Fix use-after-free bugs in otx2_sync_tstamp()
    6e33a7eed587 cnic: Fix use-after-free bugs in cnic_delete_task
    acf8d06b8b97 net: liquidio: fix overflow in octeon_init_instr_queue()
    f07c925bb70e Revert "net/mlx5e: Update and set Xon/Xoff upon port speed set"
    208640e6225c tls: make sure to abort the stream if headers are bogus
    fa4749c06564 tcp: Clear tcp_sk(sk)->fastopen_rsk in tcp_disconnect().
    0c691ea3852c octeon_ep: fix VF MAC address lifecycle handling
    4c0bfb2dc6ab bonding: don't set oif to bond dev when getting NS target destination
    d1f3db4e7a3b net/mlx5e: Harden uplink netdev access against device unbind
    bec504867acc igc: don't fail igc_probe() on LED setup error
    610332f7ac20 i40e: remove redundant memory barrier when cleaning Tx descs
    80555adb5c89 ice: fix Rx page leak on multi-buffer frames
    1644ee7696f3 ice: store max_frame and rx_buf_len only in ice_rx_ring
    3e3be7bbe4a5 net: natsemi: fix `rx_dropped` double accounting on `netif_rx()` failure
    13e7a6e96076 selftests: mptcp: sockopt: fix error messages
    10e54bf7cb6e mptcp: tfo: record 'deny join id0' info
    bb7a3f09e9d4 selftests: mptcp: userspace pm: validate deny-join-id0 flag
    7f5b09cc84e0 mptcp: set remote_deny_join_id0 on SYN recv
    9a958802080c bonding: set random address only when slaves already exist
    660b2a8f5a30 qed: Don't collect too many protection override GRC elements
    5f445eb25990 net/tcp: Fix a NULL pointer dereference when using TCP-AO with TCP_REPAIR
    79320035973f dpaa2-switch: fix buffer pool seeding for control traffic
    3112c70b2e01 um: Fix FD copy size in os_rcv_fd_msg()
    00e98b5a6903 um: virtio_uml: Fix use-after-free after put_device in probe
    9c416e76a57f btrfs: fix invalid extref key setup when replaying dentry
    ded4d207a320 cgroup: split cgroup_destroy_wq into 3 workqueues
    eed66faed623 pcmcia: omap_cf: Mark driver struct with __refdata to prevent section mismatch
    8df33f4d4a0b wifi: mac80211: fix incorrect type for ret
    32adb020b0c3 wifi: mac80211: increase scan_ies_len for S1G
    814952c1b1ff ALSA: firewire-motu: drop EPOLLOUT from poll return values as write is not supported
    b146e0434feb nvme: fix PI insert on write
    2203ef417044 wifi: wilc1000: avoid buffer overflow in WID string configuration

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 8ef8085adb..37233199f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ea24c2991c68b041981a182bd57d818f0dc683f8"
-SRCREV_meta ?= "b26293f57cc7090add0aead45f294e256287641b"
+SRCREV_machine ?= "b82952f1b1b128089e27cadf3b16c11a7be2644d"
+SRCREV_meta ?= "8eec73988615290c4a3370553c44d2d3bdbf4034"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.48"
+LINUX_VERSION ?= "6.12.49"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index fe6f9595fe..b934b925b4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.48"
+LINUX_VERSION ?= "6.12.49"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "17a823196be18a8b859307b2fd53de3895893ebd"
-SRCREV_meta ?= "b26293f57cc7090add0aead45f294e256287641b"
+SRCREV_machine ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
+SRCREV_meta ?= "8eec73988615290c4a3370553c44d2d3bdbf4034"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index a2c80b9402..b1b7f95bb5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,18 +18,18 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "febf5dbebc3c6d987c7e6529c9cc6175c04f6610"
-SRCREV_machine:qemuarm64 ?= "17a823196be18a8b859307b2fd53de3895893ebd"
-SRCREV_machine:qemuloongarch64 ?= "17a823196be18a8b859307b2fd53de3895893ebd"
-SRCREV_machine:qemumips ?= "95bd1155f0d490344743ddfffb7a8b9522ce481c"
-SRCREV_machine:qemuppc ?= "17a823196be18a8b859307b2fd53de3895893ebd"
-SRCREV_machine:qemuriscv64 ?= "17a823196be18a8b859307b2fd53de3895893ebd"
-SRCREV_machine:qemuriscv32 ?= "17a823196be18a8b859307b2fd53de3895893ebd"
-SRCREV_machine:qemux86 ?= "17a823196be18a8b859307b2fd53de3895893ebd"
-SRCREV_machine:qemux86-64 ?= "17a823196be18a8b859307b2fd53de3895893ebd"
-SRCREV_machine:qemumips64 ?= "3cdb66bba9057d03c019086417843daee40ef906"
-SRCREV_machine ?= "17a823196be18a8b859307b2fd53de3895893ebd"
-SRCREV_meta ?= "b26293f57cc7090add0aead45f294e256287641b"
+SRCREV_machine:qemuarm ?= "b522400a3cd8c649a7a040398eecd4adc5cbecd2"
+SRCREV_machine:qemuarm64 ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
+SRCREV_machine:qemuloongarch64 ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
+SRCREV_machine:qemumips ?= "e3476588db698ac8f2f47cc6b7594f0740b80a40"
+SRCREV_machine:qemuppc ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
+SRCREV_machine:qemuriscv64 ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
+SRCREV_machine:qemuriscv32 ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
+SRCREV_machine:qemux86 ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
+SRCREV_machine:qemux86-64 ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
+SRCREV_machine:qemumips64 ?= "fd00218b9063fff14c5815dfff6be2e0e5bb5861"
+SRCREV_machine ?= "6c5bd29f94e71fb7269a41f7402e1902867fac14"
+SRCREV_meta ?= "8eec73988615290c4a3370553c44d2d3bdbf4034"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.48"
+LINUX_VERSION ?= "6.12.49"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


