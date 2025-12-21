Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B35E66886
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68776.1766353041033488974
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aLb0O117;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7ade456b6abso2747283b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353040; x=1766957840; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9U/YMpKB4kXr3SpUarurPZdJCh5rIYIYBOB+4o0MXg=;
        b=aLb0O117yq0LIRjbMPyKP8wo+e9bOj4ZSZxgMPzKGytqH25KK0wgavnUrLDS9ec31Y
         IwO7Wf9lYTBooYvQw/lTfy+C0df4Gtb8gBigFgdu2c1nfw0ZtN2o0mNQSashvus3FGUS
         3vHkLRYfh0kxto+vxwGjXq6iHi1mbFoebEA7LXD6NJ5fgdptxZggbE/0Zo6RSDs+slpu
         vmkilCbAwTonOHnUk1dY2w9cwK0cxqyuZ31GlXdl2Go3BTMA6ikbYj/rbOGFWG5aPZJL
         LCeyShTqfu0UeXds0zusQr2zGM2nS8BQQKQ8y+7RCEUTAYTbkBgahLhRVb6sxmohx7y3
         cDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353040; x=1766957840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m9U/YMpKB4kXr3SpUarurPZdJCh5rIYIYBOB+4o0MXg=;
        b=NYNlxA6AFpZxZ6sUbwkW/jAY2j/xAbiiquPD0VuL0DpIWZlnadlLa8Jg94iuzQ+ZsO
         bMmeSgSvVyA/DAeTAWXJM+yvcKuqi6ODh33NVyaD3xa4tBwUkuVsQjkF7WxxKTJePwHs
         THe3l4K/L1fYWFk44uyaW7V75KaBjCculswVukhzI2hLg4s+2Z/eSxkvtT9PAO4Ri1iA
         R4p2m1su/Xj/EAf9pPT1oKnL9tcIzL58sakQW4OBAzd3gf5VIQ9GPuS3lrCenOmjv1Og
         skslFifFgP82J1bUY03sVOOBR6BUjM/grcw1qvedD0oiNeXDRsFm3R8u73Cy2nsG5WTG
         NenQ==
X-Gm-Message-State: AOJu0Yy868d5S8PiinCufUZ5mne1NteTOmEiXXlUm7zqYtYnvHQetF//
	iTY5wxc8n9WUMSaBqg08Gx+veH0eLDv758mlZjCkZjE83vOAl5UnxaX3/IPqAF/2Txw94sIMGXP
	zeuom8vk=
X-Gm-Gg: AY/fxX5VJ+YDdAWF2+yOmNtOP1v0QrlL+mQqeQQXOF88wOG+e2T1xrNFohksuW6O1PO
	KXwh4nO9IFzb5gLEaaer3fetmXO9HPDTpG1RaW8gpevNx2usPDBWmRwviOr8ZcSKUM+d/RhSxfD
	CyvnNwUrVlpSXNmNjk2bB2PclYQ1DDx/hawTVZtlHUIFuzozRdIdSEPGqZBWlNhurTNe3IW+Qwh
	iwicNFSaJwdhVRTL3VQ+ZQ5QbyoTaRWq9dz9kK1vYYqAKbhUFEk4I39msNpc4XjnKpjUJiaF5Fl
	EVDWz300IVmK2cTUh+yT2pEOs8Rg36DYU77IRj/nKJ8aquE9Ir0WGk5YJYUwYsM5Y3K9xbBNK3y
	1yQO3WTSrPShpte8bG6IVIfig/AwBalF0DXhkejuO2T9pn6mlHBnJdWijCAbaRI1spAPPle8J5u
	vM
X-Google-Smtp-Source: AGHT+IHN2snQUpcqL/bxqco0pzK/k5VfYRXLMzejELcTonMsYxxvCsrSSxuqBi9rwKpKIF8UnTFJcg==
X-Received: by 2002:a05:6a20:3ca8:b0:35e:e604:f787 with SMTP id adf61e73a8af0-376a9acf017mr8058113637.39.1766353039958;
        Sun, 21 Dec 2025 13:37:19 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 02/18] linux-yocto/6.12: update to v6.12.57
Date: Sun, 21 Dec 2025 13:36:55 -0800
Message-ID: <05496a5cfe3574fee5c7eef74bb640d03788fd73.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228260

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    8a243ecde1f64 Linux 6.12.57
    800101f6ab9d3 btrfs: tree-checker: fix bounds check in check_inode_extref()
    f21623b844673 sfc: fix NULL dereferences in ef100_process_design_param()
    29b65a3171a49 udmabuf: fix a buf size overflow issue during udmabuf creation
    57100b87c7781 wifi: ath12k: fix read pointer after free in ath12k_mac_assign_vif_to_vdev()
    68ec78beb4a3f iommu/vt-d: Avoid use of NULL after WARN_ON_ONCE
    1e9ad8e56693d gpio: idio-16: Define fixed direction of the GPIO lines
    0537e524feca9 gpio: regmap: add the .fixed_direction_output configuration parameter
    512c19320c42e gpio: regmap: Allow to allocate regmap-irq device
    41e98f2789b33 bits: introduce fixed-type GENMASK_U*()
    17143f5b09671 bits: add comments and newlines to #if, #else and #endif directives
    6f3af8055ee7a bonding: check xdp prog when set bond mode
    da82ac2a03eeb bonding: return detailed error when loading native XDP fails
    4a63523d3541e wifi: cfg80211: Add missing lock in cfg80211_check_and_end_cac()
    2dda0930fb79b f2fs: fix to avoid panic once fallocation fails for pinfile
    bdb0e04154145 mptcp: pm: in-kernel: C-flag: handle late ADD_ADDR
    dbd0aa9456b15 selftests: mptcp: join: mark 'delete re-add signal' as skipped if not supported
    e762ddf34f062 selftests: mptcp: disable add_addr retrans in endpoint_tests
    0e0bdcea10540 docs: kdoc: handle the obsolescensce of docutils.ErrorString()
    cc89ac0ca5230 arch: Add the macro COMPILE_OFFSETS to all the asm-offsets.c
    8297de569e56e sched_ext: Make qmap dump operation non-destructive
    4270dc1e8d338 btrfs: use smp_mb__after_atomic() when forcing COW in create_pending_snapshot()
    7db72c34ef54d btrfs: tree-checker: add inode extref checks
    32054a9216beb btrfs: abort transaction if we fail to update inode in log replay dir fixup
    90542dc854a28 btrfs: use level argument in log tree walk callback replay_one_buffer()
    403eb8a1ba869 btrfs: always drop log root tree reference in btrfs_replay_log()
    500784abb5468 btrfs: scrub: replace max_t()/min_t() with clamp() in scrub_throttle_dev_io()
    cfc90c12a91af btrfs: zoned: refine extent allocator hint selection
    69a9df08eb208 btrfs: zoned: return error from btrfs_zone_finish_endio()
    630378d35b74d btrfs: abort transaction in the process_one_buffer() log tree walk callback
    3b0bcce1a2d3f btrfs: abort transaction on specific error places when walking log tree
    cf9459ce31c3d cpuset: Use new excpus for nocpu error check when enabling root partition
    e72270986a9c8 EDAC/mc_sysfs: Increase legacy channel support to 16
    537427cb38a28 x86/bugs: Fix reporting of LFENCE retpoline
    65dc4615edda8 x86/bugs: Report correct retbleed mitigation status
    1c0462f28bb77 seccomp: passthrough uprobe systemcall without filtering
    d6c55b581ca72 perf: Skip user unwind if the task is a kernel thread
    8d33b133b89c4 perf: Have get_perf_callchain() return NULL if crosstask and user are set
    8d79f96e477c4 perf: Use current->flags & PF_KTHREAD|PF_USER_WORKER instead of current->mm == NULL
    2aef7015d0138 perf/x86/intel: Add ICL_FIXED_0_ADAPTIVE bit into INTEL_FIXED_BITS_MASK
    9bdd94885320b audit: record fanotify event regardless of presence of rules
    6ff8e74c8f8a6 net/sched: sch_qfq: Fix null-deref in agg_dequeue
    4408a3d67ea73 Linux 6.12.56
    898d527ed94c1 ksmbd: transport_ipc: validate payload size before reading handle
    1dae549ef5dd6 xfs: always warn about deprecated mount options
    5ff5765a1fc52 arm64: mte: Do not warn if the page is already tagged in copy_highpage()
    1a1b13ef21cb1 devcoredump: Fix circular locking dependency with devcd->mutex.
    5036d26337412 serial: sc16is7xx: remove useless enable of enhanced features
    7cbf5ed24a26d serial: 8250_mtk: Enable baud clock and manage in runtime PM
    0bd9be06de6e7 serial: 8250_exar: add support for Advantech 2 port card with Device ID 0x0018
    d50a92393c6f1 serial: 8250_dw: handle reset control deassert error
    34669730146dc dt-bindings: usb: dwc3-imx8mp: dma-range is required only for imx8mp
    e6210ff79396f tcpm: switch check for role_sw device with fw_node
    7d851f746067b most: usb: hdm_probe: Fix calling put_device() before device initialization
    f93a84ffb884d most: usb: Fix use-after-free in hdm_disconnect
    e17b13387827a misc: fastrpc: Fix dma_buf object leak in fastrpc_map_lookup
    fe408f5759cd6 objtool/rust: add one more `noreturn` Rust function
    396cb58007ad4 mei: me: add wildcat lake P DID
    a4bb5d1bc2f23 comedi: fix divide-by-zero in comedi_buf_munge()
    352745fe3b2b7 binder: remove "invalid inc weak" check
    e1e9175a3c6c5 x86/microcode: Fix Entrysign revision check for Zen1/Naples
    533b917e065fb xhci: dbc: fix bogus 1024 byte prefix if ttyDBC read races with stall event
    248468f4ea9c9 xhci: dbc: enable back DbC in resume if it was enabled before suspend
    a8d81c9599f6e usb: raw-gadget: do not limit transfer length
    d1446a98ca5f7 usb/core/quirks: Add Huawei ME906S to wakeup quirk
    f805ddd2e09ea USB: serial: option: add Telit FN920C04 ECM compositions
    cad1c70d84c8e USB: serial: option: add Quectel RG255C
    50ee25061c47c USB: serial: option: add UNISOC UIS7720
    782977c0d8ba4 platform/x86/amd/hsmp: Ensure sock->metric_tbl_addr is non-NULL
    ca44ae51b99c0 Bluetooth: btintel: Add DSBR support for BlazarIW, BlazarU and GaP
    c0325d68926b0 io_uring/sqpoll: be smarter on when to update the stime usage
    f8a1a583ebf1f io_uring/sqpoll: switch away from getrusage() for CPU accounting
    ea285d5700a21 sched: Remove never used code in mm_cid_get()
    5a7b5d85d0dd0 io_uring: correct __must_hold annotation in io_install_fixed_file
    f999680473c98 gpio: ljca: Fix duplicated IRQ mapping
    07f5d021d764e drm/panic: Fix qr_code, ensure vmargin is positive
    9630c168a9dc3 drm/panic: Fix drawing the logo on a small narrow screen
    924335412db89 nbd: override creds to kernel when calling sock_{send,recv}msg()
    ea3cca61b7533 hwmon: (sht3x) Fix error handling
    3c5b3dc301ee7 riscv: hwprobe: avoid uninitialized variable use in hwprobe_arch_id()
    17cb88c82e450 RISC-V: Don't print details of CPUs disabled in DT
    0e0e4f32207c2 RISC-V: Define pgprot_dmacoherent() for non-coherent devices
    efe6dced35120 drm/panthor: Fix kernel panic on partial unmap of a GPU VA region
    4e9a2d592d91b spi: airoha: fix reading/writing of flashes with more than one plane per lun
    8063828625359 spi: airoha: switch back to non-dma mode in the case of error
    ad00df9ee321e spi: airoha: do not keep {tx,rx} dma buffer always mapped
    182221d35c142 spi: airoha: add support of dual/quad wires spi modes to exec_op() handler
    f5dc5baa5b04c spi: airoha: return an error for continuous mode dirmap creation cases
    74f0c573d3d41 firmware: arm_scmi: Fix premature SCMI_XFER_FLAG_IS_RAW clearing in raw mode
    e088efcd97cb7 firmware: arm_scmi: Account for failed debug initialization
    dac7eba5f69f7 arm64: dts: broadcom: bcm2712: Define VGIC interrupt
    1a45d3083d7c8 arm64: dts: broadcom: bcm2712: Add default GIC address cells
    5d06d159227be spi: spi-nxp-fspi: add extra delay after dll locked
    f28092be4e12b drm/amd/display: increase max link count and fix link->enc NULL pointer access
    6fc0a7c99e973 mm: prevent poison consumption when splitting THP
    136b10ed3ee30 selftests: mptcp: join: mark implicit tests as skipped if not supported
    cb1dd8f65bec9 selftests: mptcp: join: mark 'flush re-add' as skipped if not supported
    629ea2fef2f73 net: ravb: Ensure memory write completes before ringing TX doorbell
    ec2153de08145 net: ravb: Enforce descriptor type ordering
    5537ed78a51c2 net: usb: rtl8150: Fix frame padding
    427f24b9f6779 net: stmmac: dwmac-rk: Fix disabling set_clock_selection
    251caee792a21 vsock: fix lock inversion in vsock_assign_transport()
    bb69928ed578f ocfs2: clear extent cache after moving/defragmenting extents
    42f3df4960d93 MIPS: Malta: Fix keyboard resource preventing i8042 driver from registering
    c199595db5dba cifs: Fix TCP_Server_Info::credits to be signed
    86bc2c660b0ac can: netlink: can_changelink(): allow disabling of automatic restart
    5932988d8a9eb ACPICA: Work around bogus -Wstringop-overread warning since GCC 11
    f3886f075c1fe slab: Fix obj_ext mistakenly considered NULL due to race condition
    c7af5300d7846 slab: Avoid race on slab->obj_exts in alloc_slab_obj_exts
    19f4e86b2cd37 Revert "cpuidle: menu: Avoid discarding useful information"
    26a0fa0d5eceb xfs: fix locking in xchk_nlinks_collect_dir
    06eb8738a3e25 gpio: 104-idio-16: Define maximum valid register address offset
    4c71f1c293cfb gpio: pci-idio-16: Define maximum valid register address offset
    b1c2b4e6ffd30 btrfs: directly free partially initialized fs_info in btrfs_check_leaked_roots()
    4537930312448 arch_topology: Fix incorrect error check in topology_parse_cpu_capacity()
    85d65fb07160b dma-debug: don't report false positives with DMA_BOUNCE_UNALIGNED_KMALLOC
    3ce82b19a6ef1 net: bonding: fix possible peer notify event loss or dup issue
    3f307a9f7a7a2 fs/notify: call exportfs_encode_fid with s_umount
    7e212cebc863c net/mlx5: Fix IPsec cleanup over MPV device
    da1ef8e9eb5d4 net: phy: micrel: always set shared->phydev for LAN8814
    7a832b0f99be1 sctp: avoid NULL dereference when chunk data buffer is missing
    d72f6e2672185 ptp: ocp: Fix typo using index 1 instead of i in SMA initialization loop
    cb974263ba15b arm64, mm: avoid always making PTE dirty in pte_mkwrite()
    e61fb4b6254b1 net: ethernet: ti: am65-cpts: fix timestamp loss due to race conditions
    5b6fc95c4a161 net/smc: fix general protection fault in __smc_diag_dump
    cb9edd583e239 net/mlx5e: RX, Fix generating skb from non-linear xdp_buff for striding RQ
    0049fd6388150 net/mlx5e: RX, Fix generating skb from non-linear xdp_buff for legacy RQ
    ae71c16c96a6e net/mlx5e: Reuse per-RQ XDP buffer to avoid stack zeroing overhead
    4688adccd4cfb selftests: net: fix server bind failure in sctp_vrf.sh
    1a6ede2017b6f can: rockchip-canfd: rkcanfd_start_xmit(): use can_dev_dropped_skb() instead of can_dropped_invalid_skb()
    ab1b49d023408 can: esd: acc_start_xmit(): use can_dev_dropped_skb() instead of can_dropped_invalid_skb()
    1ffccf3592a8e can: bxcan: bxcan_start_xmit(): use can_dev_dropped_skb() instead of can_dropped_invalid_skb()
    781a20d54b5d1 dpaa2-eth: fix the pointer passed to PTR_ALIGN on Tx path
    9039fae7f45fc net: enetc: correct the value of ENETC_RXB_TRUESIZE
    1f92f5bd057a4 net: enetc: fix the deadlock of enetc_mdio_lock
    ada21254a9db9 rtnetlink: Allow deleting FDB entries in user namespace
    1f28de3df0ecf net/mlx5e: Return 1 instead of 0 in invalid case in mlx5e_mpwrq_umr_entry_size()
    5dacb83302ce8 PM: EM: Fix late boot with holes in CPU topology
    4051c28c78ed7 PM: EM: Move CPU capacity check to em_adjust_new_capacity()
    f6c85e8097127 PM: EM: Slightly reduce em_check_capacity_update() overhead
    deeede236b48c PM: EM: Drop unused parameter from em_adjust_new_capacity()
    73a722a4f181a Unbreak 'make tools/*' for user-space targets
    a135fc271df53 smb: server: let smb_direct_flush_send_list() invalidate a remote key first
    2770e2079995c s390/mm: Use __GFP_ACCOUNT for user page table allocations
    b625a08356543 drivers/perf: hisi: Relax the event ID check in the framework
    9bc631f9520e8 powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup failure
    27cfc3bbcbdba m68k: bitops: Fix find_*_bit() signatures
    279bde3bbb0ac gfs2: Fix unlikely race in gdlm_put_lock
    ec2830217b1ab arm64: sysreg: Correct sign definitions for EIESB and DoubleLock
    52cd925d5da07 lkdtm: fortify: Fix potential NULL dereference on kmalloc failure
    3b529ec89bd94 PCI: Test for bit underflow in pcie_set_readrq()
    0254a0d73667d hfsplus: return EIO when type of hidden directory mismatch in hfsplus_fill_super()
    3b447fd401824 hfs: fix KMSAN uninit-value issue in hfs_find_set_zero_bits()
    e23c071acb638 dlm: check for defined force value in dlm_lockspace_release
    295527bfdefd5 hfsplus: fix KMSAN uninit-value issue in hfsplus_delete_cat()
    17ed51cfce6c6 hfs: validate record offset in hfsplus_bmap_alloc
    99202d94909d3 hfsplus: fix KMSAN uninit-value issue in __hfsplus_ext_cache_extent()
    46e13d36ee699 hfs: make proper initalization of struct hfs_find_data
    2d5eb500edf43 hfs: clear offset and space out of valid records in b-tree node
    90f5f715550e0 nios2: ensure that memblock.current_limit is set when setting pfn limits
    6b0a292577935 exec: Fix incorrect type for ret

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dd9e7d064555e1daf6d06aba82b1722e9cebc80f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index cccd9b28e9..b778a7aac5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "014bc4e5637527525b6f97f58a09f2207c140293"
-SRCREV_meta ?= "3f0dcb29edf14029f130bc493a939b67ea27852e"
+SRCREV_machine ?= "af2d3ab81402c14f81072715d771097a0dfcb427"
+SRCREV_meta ?= "2987fc4250f2ad7f6e2df663bba0742638fbae51"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.55"
+LINUX_VERSION ?= "6.12.57"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index d3be33cf38..a1636f536d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.55"
+LINUX_VERSION ?= "6.12.57"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
-SRCREV_meta ?= "3f0dcb29edf14029f130bc493a939b67ea27852e"
+SRCREV_machine ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
+SRCREV_meta ?= "2987fc4250f2ad7f6e2df663bba0742638fbae51"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index fa6a0ba936..fa761a3ee1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e646fbdc560660a283cb67b585c37ae73610c31b"
-SRCREV_machine:qemuarm64 ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
-SRCREV_machine:qemuloongarch64 ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
-SRCREV_machine:qemumips ?= "b1b7883585a3e1adce260c566b8986b5c8d5a12e"
-SRCREV_machine:qemuppc ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
-SRCREV_machine:qemuriscv64 ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
-SRCREV_machine:qemuriscv32 ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
-SRCREV_machine:qemux86 ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
-SRCREV_machine:qemux86-64 ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
-SRCREV_machine:qemumips64 ?= "74368748436dddfe2b5cef23fe9f4c149709cc97"
-SRCREV_machine ?= "c77f4d163458157a4c88d9cd9e175543a5d20140"
-SRCREV_meta ?= "3f0dcb29edf14029f130bc493a939b67ea27852e"
+SRCREV_machine:qemuarm ?= "8d546b19fe6f217785674b80de068bdbe0bf32fc"
+SRCREV_machine:qemuarm64 ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
+SRCREV_machine:qemuloongarch64 ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
+SRCREV_machine:qemumips ?= "fc2ecbb2ff9ad036cbe11762e51c458150f56aea"
+SRCREV_machine:qemuppc ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
+SRCREV_machine:qemuriscv64 ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
+SRCREV_machine:qemuriscv32 ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
+SRCREV_machine:qemux86 ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
+SRCREV_machine:qemux86-64 ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
+SRCREV_machine:qemumips64 ?= "bde855d69b528925fb0f6b44c87105def1c69ea4"
+SRCREV_machine ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
+SRCREV_meta ?= "2987fc4250f2ad7f6e2df663bba0742638fbae51"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "fcd03f7736b1fa2b2181a7306d14008aa36b66ed"
+SRCREV_machine:class-devupstream ?= "4fc43debf5047d2469bdef3b25c02121afa7ef3d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.55"
+LINUX_VERSION ?= "6.12.57"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


