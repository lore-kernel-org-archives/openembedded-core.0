Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16148CCA468
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 18:59:44 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.6640.1759172374068193321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 11:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gi8cc9pd;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4df81016e59so23202721cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 11:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759172373; x=1759777173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ff4YNkLxPeN09/CJXvt7OrMFww7yYU0w88ztjMIsxOU=;
        b=gi8cc9pde8vCKE5J/ZsxnxUjN9uyed5fiXzWpzctEVrQlyvHAhh/6I5ht+EiIaAWSd
         mz2Z/MEqK/ZoWysaPL1FH6DM1ZRbOnXadQXR+ewFYgfqp2ckSNeF23PLKVOrKUBLAQOx
         M/kdSA95CVPxHvSyN5MZk3l2A5FehwYzvkS4iOmzc/PFxOSPwGXZm6Wb10Ak94hwaLwS
         6/X8TgtoPYjhfcw+rXf9VOTNGihSL3ppXbqGQ1Hr/LGkFyY0HKG97D5l/++byo8kR16+
         qj96ofYSU3BAqx2/VsRQ/KxSGkFG2utGUnLQqHa10fuXYpTuYbhsVUtmXP57gd+LnK70
         X7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759172373; x=1759777173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ff4YNkLxPeN09/CJXvt7OrMFww7yYU0w88ztjMIsxOU=;
        b=i7h31jfi3bUCQMNfSKm7uCcniOA5v+EQHcSONRmM2fHzySL3oCSAXJ4DmD7nQS7G3p
         PDIPPwtgMRbreCX2170XHBuuZCRMrrjLUtdhMjNQZSOcEemwj96ka8cCKf5IVYvSzQ/d
         G0xklYKDkjV/XoMQk+FewkF7k0F7QqfeKUnO0se+ni83FYnusvXJ6qYBkEQQk4vLXNmu
         hgiAMqZdZ82gZHrelE5J3Ezz6fh3IXd5TALRvyONocsdiYWhkUkTe+Vt80Fj3vKV4Va4
         Da230rq5Da75ZdFgdNcAdIDQSlnwEhDJhuUsobD075p5rfUbR0dot2XRIeuKLR2/NRep
         OHPw==
X-Gm-Message-State: AOJu0Yy5wwUGpw/T9WYOO8deTtLcY2RHpFjcDh5qW0lp2HpDIP/CDijv
	fXpd2UF/GhYVg1wXQ1ZaSHlMy4Ar8MMyF8MaD8bHzKJv10S48UmJA0s1BQh7Fw5Nl2M=
X-Gm-Gg: ASbGncuVDzVgnVatmQPjbnKsgc3Io3ZGh/GKrGgJAfHwsQnujjgIEv+lslS2SvYlWfh
	POq/581R2KnFkTaNf5fO+MPzGHzlJBrN5zE+T/RFdKuJJeViMxuSCOhe8wMgyAprGp8SmeWVjbb
	oQjnMTdJSURXea9UpXTqwBv1l7AjYpXYGClmfV1QMwhl/63BiJNKcSmJ0rrcJYLnsw3gQton9p+
	KtFFkXQ+gNpTkfQIpMbv5s6watNByX/W/2IwUwR9ai0QWUqnOX8TFziUw6EM8KpCgdEsXuM1Rg6
	5ZNesfTh3tbOvupRbDYFJQ+cWO1bcFg+saFPHI5OCkdoTUhg2X6BgFv02etOMBzS9ccsczroTIu
	pEJ+te8V3AjdkhFADrs5iOAYDYswEDlQP0pZTWYuRjxyksiQAxEphEHWyJU108qDF+i1su42QJH
	i+Qou8Xf9oqtYdHZPxBEdthOzTW4+0+IRPCAHuS+0n9BSDHp1ekHBNGB0=
X-Google-Smtp-Source: AGHT+IHClBc0oDIp/7VZVTgwq2fgoW1tdPEJ5U7AHVS2EWqrTzpMFHusIALVUQ7RVgNi3ddzjgvDTg==
X-Received: by 2002:ac8:5f53:0:b0:4b7:7d98:d3d8 with SMTP id d75a77b69052e-4da4dcc6b08mr192634441cf.75.1759172372632;
        Mon, 29 Sep 2025 11:59:32 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c337a1e1csm873240285a.62.2025.09.29.11.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 11:59:32 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/6.16: update to v6.16.9
Date: Mon, 29 Sep 2025 14:59:27 -0400
Message-Id: <20250929185930.1689034-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 18:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224166

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.16 to the latest korg -stable release that comprises
the following commits:

    b0d8acc71198 Linux 6.16.9
    f9fc28d1451b samples/damon/prcl: avoid starting DAMON before initialization
    40108f69c372 clk: sunxi-ng: mp: Fix dual-divider clock rate readback
    f9fa006e3527 samples/damon/mtier: avoid starting DAMON before initialization
    8f7dd196be59 samples/damon: change enable parameters to enabled
    1338fb5d576a samples/damon/prcl: fix boot time enable crash
    941452199941 dt-bindings: serial: 8250: move a constraint
    95c9489abfc4 dt-bindings: serial: 8250: spacemit: set clocks property as required
    ceee5585720a dt-bindings: serial: 8250: allow clock 'uartclk' and 'reg' for nxp,lpc1850-uart
    fb0b1ef7055b mptcp: pm: nl: announce deny-join-id0 flag
    46d6ff0da889 platform/x86: asus-wmi: Re-add extra keys to ignore_key_wlan quirk
    1aa91f3d4f16 platform/x86: asus-wmi: Fix ROG button mapping, tablet mode on ASUS ROG Z13
    50a98ce1ea69 io_uring: fix incorrect io_kiocb reference in io_link_skb
    0991418bf98f smb: client: fix smbdirect_recv_io leak in smbd_negotiate() error path
    9617c3ede9ff smb: client: fix file open check in __cifs_unlink()
    5ba113d0b049 io_uring/msg_ring: kill alloc_cache for io_kiocb allocations
    045ee26aa392 crypto: af_alg - Set merge to zero early in af_alg_sendmsg
    3fabb1236f2e smb: client: let smbd_destroy() call disable_work_sync(&info->post_send_credits_work)
    ac6fbc3d0030 smb: client: use disable[_delayed]_work_sync in smbdirect.c
    a39e32f03183 smb: client: fix filename matching of deferred files
    581fb78e0388 smb: client: let recv_done verify data_offset, data_length and remaining_data_length
    cbda551b90a7 smb: client: make use of struct smbdirect_recv_io
    089ea68aae42 smb: smbdirect: introduce struct smbdirect_recv_io
    86b4bddb8292 smb: client: make use of smbdirect_socket->recv_io.expected
    f2ffba55b686 smb: smbdirect: introduce smbdirect_socket.recv_io.expected
    dd1a415dcfd5 drm/xe/guc: Set RCS/CCS yield policy
    97207a4fed53 drm/xe/guc: Enable extended CAT error reporting
    56f34936bf8c drm/xe: Fix error handling if PXP fails to start
    09b473a80c1c ALSA: usb: qcom: Fix false-positive address space check
    b45cabfa717d drm/xe: Fix a NULL vs IS_ERR() in xe_vm_add_compute_exec_queue()
    e3fe0101463a drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error path
    1a7ea294d57f drm: bridge: anx7625: Fix NULL pointer dereference with early IRQ
    e6a1df8cf275 drm/xe/pf: Drop rounddown_pow_of_two fair LMEM limitation
    f32a0226e848 drm/xe/tile: Release kobject for the failure path
    65c5cfbd6d93 ASoC: amd: acp: Fix incorrect retrival of acp_chip_info
    f7229775e41d iommu/amd: Fix alias device DTE setting
    34f3a9e04e73 ASoC: Intel: catpt: Expose correct bit depth to userspace
    f6433733326b ASoC: SDCA: Fix return value in sdca_regmap_mbq_size()
    9ff967d7e8d9 ASoC: SOF: Intel: hda-stream: Fix incorrect variable used in error message
    cd59ca8f75db ASoC: codec: sma1307: Fix memory corruption in sma1307_setting_loaded()
    7c28b31b2209 ASoC: wm8974: Correct PLL rate rounding
    badf6143198e ASoC: wm8940: Correct typo in control name
    7a372ac1e890 ASoC: wm8940: Correct PLL rate rounding
    519b95c74f40 ALSA: hda/realtek: Fix mute led for HP Laptop 15-dw4xx
    ee8d393af37e selftests: mptcp: avoid spurious errors on TCP disconnect
    47f8d4403995 selftests: mptcp: connect: catch IO errors on listen side
    80d38ea27a1e mptcp: propagate shutdown to subflows when possible
    c62000bf27db rds: ib: Increment i_fastreg_wrs before bailing out
    bc509293c9d4 crypto: ccp - Always pass in an error pointer to __sev_platform_shutdown_locked()
    27d94a2a52cb gpiolib: acpi: initialize acpi_gpio_info struct
    21a39b958b4b net: rfkill: gpio: Fix crash due to dereferencering uninitialized pointer
    6db60106a07f io_uring: include dying ring in task_work "should cancel" state
    f757ab3db457 io_uring/io-wq: fix `max_workers` breakage and `nr_workers` underflow
    898aaf78480b drm/amd: Only restore cached manual clock settings in restore if OD enabled
    20f87640ebe7 drm/amd/display: Allow RX6xxx & RX7700 to invoke amdgpu_irq_get/put
    1ff89f5627ef drm/amdgpu: suspend KFD and KGD user queues for S0ix
    b477c5668ec6 drm/amdkfd: add proper handling for S0ix
    0e2db61cc589 KVM: SVM: Sync TPR from LAPIC into VMCB::V_TPR even if AVIC is active
    c0603b80436d x86/sev: Guard sev_evict_cache() with CONFIG_AMD_MEM_ENCRYPT
    79a9ba8da904 mmc: sdhci-uhs2: Fix calling incorrect sdhci_set_clock() function
    7650c994ced2 mmc: sdhci-pci-gli: GL9767: Fix initializing the UHS-II interface during a power-on
    7186d8e8bd96 mmc: sdhci: Move the code related to setting the clock from sdhci_set_ios_common() into sdhci_set_ios()
    d0b7ff384b7a mmc: mvsdio: Fix dma_unmap_sg() nents value
    66e6d1c92806 ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
    cc336b242ea7 ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer dereference if source graph failed
    59c4accddfeb ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
    8276c97dccee ASoC: SDCA: Add quirk for incorrect function types for 3 systems
    417ed00d48e7 btrfs: tree-checker: fix the incorrect inode ref size check
    359613f2fa00 iommu/s390: Make attach succeed when the device was surprise removed
    17a58caf3863 iommu/s390: Fix memory corruption when using identity domain
    7d462bdecb7d iommu/amd/pgtbl: Fix possible race while increase page table level
    b0c0e231060a iommu/amd: Fix ivrs_base memleak in early_amd_iommu_init()
    7ff7d16649b2 iommu/vt-d: Fix __domain_mapping()'s usage of switch_to_super_page()
    1c731284374a LoongArch: KVM: Fix VM migration failure with PTW enabled
    960eedb14caf LoongArch: KVM: Avoid copy_*_user() with lock hold in kvm_pch_pic_regs_access()
    55ba91b4e04d LoongArch: KVM: Avoid copy_*_user() with lock hold in kvm_eiointc_sw_status_access()
    105605ca76e9 LoongArch: KVM: Avoid copy_*_user() with lock hold in kvm_eiointc_regs_access()
    291d4b01d3b1 LoongArch: KVM: Avoid copy_*_user() with lock hold in kvm_eiointc_ctrl_access()
    401363c839cb LoongArch: Handle jump tables options for RUST
    1967642780cf LoongArch: Make LTO case independent in Makefile
    db65fea5f0aa LoongArch: Check the return value when creating kobj
    5f2b63a398ed LoongArch: Align ACPI structures if ARCH_STRICT_ALIGN enabled
    a417571950f9 LoongArch: vDSO: Check kcalloc() result in init_vdso()
    2feeecd7c685 LoongArch: Fix unreliable stack for live patching
    5dbbc7b04c14 objtool/LoongArch: Mark special atomic instruction as INSN_BUG type
    e0aefa8f4612 objtool/LoongArch: Mark types based on break immediate code
    953138ff0ff6 LoongArch: Update help info of ARCH_STRICT_ALIGN
    1eda9ab8da6b mm: folio_may_be_lru_cached() unless folio_test_large()
    fb4e6d587a27 mm: revert "mm: vmscan.c: fix OOM on swap stress test"
    d0c8ba94cb70 mm/gup: local lru_add_drain() to avoid lru_add_drain_all()
    163843e8c8f3 gup: optimize longterm pin_user_pages() for large folio
    3958f9ec7251 mm: revert "mm/gup: clear the LRU flag of a page before adding to LRU batch"
    fdac0a3f58c0 mm/gup: check ref_count instead of lru before migration
    ee27658c239b dm-stripe: fix a possible integer overflow
    ba3a78db47ec dm-raid: don't set io_min and io_opt for raid1
    e8f496001e0c btrfs: initialize inode::file_extent_tree after i_mode has been set
    8ae09726773a Revert "sched_ext: Skip per-CPU tasks in scx_bpf_reenqueue_local()"
    a4ee54e68282 power: supply: bq27xxx: restrict no-battery detection to bq27000
    d18d7035ecb8 power: supply: bq27xxx: fix error return in case of no bq27000 hdq battery
    45bcf60fe49b crypto: af_alg - Disallow concurrent writes in af_alg_sendmsg
    7b7361da9e7f nilfs2: fix CFI failure when accessing /sys/fs/nilfs2/features/*
    ff750e9f2c4d zram: fix slot write race condition
    c64b915bb3d9 ksmbd: smbdirect: verify remaining_data_length respects max_fragmented_recv_size
    529b121b00a6 ksmbd: smbdirect: validate data_offset and data_length field of smb_direct_data_transfer
    5ca20bb7b4bd octeontx2-pf: Fix use-after-free bugs in otx2_sync_tstamp()
    0627e1481676 cnic: Fix use-after-free bugs in cnic_delete_task
    45f71f4ac4aa net: liquidio: fix overflow in octeon_init_instr_queue()
    6e1675c8b612 net: clear sk->sk_ino in sk_set_socket(sk, NULL)
    53222fc8ebbc Revert "net/mlx5e: Update and set Xon/Xoff upon port speed set"
    61ca2da5fb8f tls: make sure to abort the stream if headers are bogus
    ae313d14b45e tcp: Clear tcp_sk(sk)->fastopen_rsk in tcp_disconnect().
    0357a37b4a8b octeon_ep: fix VF MAC address lifecycle handling
    e2019c7d3a3e bonding: don't set oif to bond dev when getting NS target destination
    948381b58298 net/mlx5e: Add a miss level for ipsec crypto offload
    8df354eb2dd6 net/mlx5e: Harden uplink netdev access against device unbind
    805c7df4faca doc/netlink: Fix typos in operation attributes
    f05e82d85532 igc: don't fail igc_probe() on LED setup error
    3ce36b3b9c69 ixgbe: destroy aci.lock later within ixgbe_remove path
    a4a4b796dcf6 ixgbe: initialize aci.lock before it's used
    5ac700c61648 i40e: remove redundant memory barrier when cleaning Tx descs
    fcb5718ebfe7 ice: fix Rx page leak on multi-buffer frames
    4f21a0b3c8c2 net: natsemi: fix `rx_dropped` double accounting on `netif_rx()` failure
    5735f1fb81a8 selftests: mptcp: sockopt: fix error messages
    7f501faddb3c mptcp: tfo: record 'deny join id0' info
    fa9a7f272b01 selftests: mptcp: userspace pm: validate deny-join-id0 flag
    f679e3dc6c01 mptcp: set remote_deny_join_id0 on SYN recv
    f3439ed58636 bonding: set random address only when slaves already exist
    8b1dc0217f96 net: dst_metadata: fix IP_DF bit not extracted from tunnel headers
    70affe82e38f qed: Don't collect too many protection override GRC elements
    1c24b132c119 octeon_ep: Validate the VF ID
    71571e187106 rxrpc: Fix untrusted unsigned subtract
    8ac99c57029e rxrpc: Fix unhandled errors in rxgk_verify_packet_integrity()
    64e76fcb5311 dpll: fix clock quality level reporting
    993b734d31ab net/tcp: Fix a NULL pointer dereference when using TCP-AO with TCP_REPAIR
    d0c3f85a041a dpaa2-switch: fix buffer pool seeding for control traffic
    e1fa8f786c8d net/mlx5: Not returning mlx5_link_info table when speed is unknown
    4c2c59cc838c um: Fix FD copy size in os_rcv_fd_msg()
    c2ff91255e01 um: virtio_uml: Fix use-after-free after put_device in probe
    856e039ded02 smb: server: let smb_direct_writev() respect SMB_DIRECT_MAX_SEND_SGES
    09ea55d02c89 pcmcia: omap_cf: Mark driver struct with __refdata to prevent section mismatch
    0835c4592344 wifi: mac80211: fix incorrect type for ret
    0dbad5f5549e wifi: mac80211: increase scan_ies_len for S1G
    745418fc8229 wifi: mt76: do not add non-sta wcid entries to the poll list
    778a062c131e ALSA: firewire-motu: drop EPOLLOUT from poll return values as write is not supported
    0cdf320eb46c nvme: fix PI insert on write
    ae50f8562306 wifi: wilc1000: avoid buffer overflow in WID string configuration
    d06a83038bd6 perf maps: Ensure kmap is set up for all inserts
    314a92e5950f btrfs: zoned: fix incorrect ASSERT in btrfs_zoned_reserve_data_reloc_bg()
    eff2bb3b300b btrfs: fix invalid extref key setup when replaying dentry
    05e0b03447cf cgroup: split cgroup_destroy_wq into 3 workqueues

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.16.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.16.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index 55df04e188..0d6ea9b392 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d9ac79e651b849ad8b16bc3f96af4cc54c30148e"
-SRCREV_meta ?= "cc3c965edfdad3a665bc69430e58ea726e02063f"
+SRCREV_machine ?= "4f8446899dbe7700c1e7394bcc8afd497809ebc0"
+SRCREV_meta ?= "1ac1d0ff730fe1dd1371823d562db8126750a98c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.16.8"
+LINUX_VERSION ?= "6.16.9"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index d1af7c89bd..4ab4d22486 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
-LINUX_VERSION ?= "6.16.8"
+LINUX_VERSION ?= "6.16.9"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_meta ?= "cc3c965edfdad3a665bc69430e58ea726e02063f"
+SRCREV_machine ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
+SRCREV_meta ?= "1ac1d0ff730fe1dd1371823d562db8126750a98c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index fd180db380..1a633bad9b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.16/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.16/standard/base"
 KBRANCH:qemumips64 ?= "v6.16/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5fa52c596c9c560c6969fbcf0927c2d546e5d9a9"
-SRCREV_machine:qemuarm64 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_machine:qemuloongarch64 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_machine:qemumips ?= "f421b1fee99c72d86eb152bb4828fdc078a268a8"
-SRCREV_machine:qemuppc ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_machine:qemuriscv64 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_machine:qemuriscv32 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_machine:qemux86 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_machine:qemux86-64 ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_machine:qemumips64 ?= "e6f7e24a7b76c6d1b3eaa3716fa1c4185de94aa5"
-SRCREV_machine ?= "ff2318af3a2513c944b2598ab3df356dd7f15f34"
-SRCREV_meta ?= "cc3c965edfdad3a665bc69430e58ea726e02063f"
+SRCREV_machine:qemuarm ?= "945e9592c57f30b248f1973ca70678556fd8b441"
+SRCREV_machine:qemuarm64 ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
+SRCREV_machine:qemuloongarch64 ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
+SRCREV_machine:qemumips ?= "a924b211fade75edc1e28362ad8d321c08d428c8"
+SRCREV_machine:qemuppc ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
+SRCREV_machine:qemuriscv64 ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
+SRCREV_machine:qemuriscv32 ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
+SRCREV_machine:qemux86 ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
+SRCREV_machine:qemux86-64 ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
+SRCREV_machine:qemumips64 ?= "ccb566d859459b4dfef541f7c2af8d5eb6e47988"
+SRCREV_machine ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
+SRCREV_meta ?= "1ac1d0ff730fe1dd1371823d562db8126750a98c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "62dae019823123ce3baa50e680219e2beb9a63a5"
+SRCREV_machine:class-devupstream ?= "b0d8acc711981d712a59ee20b073cbc52a4109c5"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.16/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.16.8"
+LINUX_VERSION ?= "6.16.9"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


