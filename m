Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87020C83F0A
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 14:40:44 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.20544.1751985636130456209
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 07:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zg9wTJ+e;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7d0976776dcso506098285a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 07:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751985635; x=1752590435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OcOJhJuUHeUlabjXqGZvFOlWe7xmP1AXFYeiCuBHmv0=;
        b=Zg9wTJ+eUV1m9CzMYjxM7IeDGKv3UXdW/YP/kPwzBNt3MEryccXv9tmQLcJqmO4N9d
         nkdy5GvfYPfY758Rv3PdISaEn4yDLPLCYp/04FLlBnHpEmA1fh50Iyr5A2HV0HP5khnW
         +52MewUZOzhO+xfxJNbqYQHI/zkqqqb4CGUD9fAnX2KNl6hnntqKnrH3rXf/9wvg9t+Y
         lLEtGn2OD6g3mwuXO9lcK/h64I5x298weNb3TwzPEv2uf+u3KXzvh97QYwQmE0s35mwb
         lD/bi9NtiosUIeekBDQb2tVix/B2WQ6iCbgDCidAcA6IRZwGRs22hiwxw+9n/3f71pqG
         pUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751985635; x=1752590435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcOJhJuUHeUlabjXqGZvFOlWe7xmP1AXFYeiCuBHmv0=;
        b=AaUkb5DHg2LwPp9jlcckDxgYUKZkhmlq86xI4XKYkkO9o0gVTRB2BDEMi9yKnlGfU7
         baf7YUEfLstxXEE9k+nec3jmcl9AFj2w9TLmhBH+NtT0yCUHU5x3Fzn+SYJRUePmOXAI
         uVmKqzUh3sP1blPKkh3a9VNT8nQxGOdzAFwZH9rGj2iUXmtW1YNkA/aJDcrTrh98xZ/L
         /4pnO6JCjtVNgFjihI/EOjwlJ2tazy7PPxMW6a2Q0BviO6wpnpLjizdQMTTGxCWEFxkd
         ZMC0bW93TOdz9fZhbSN1DLTdPCkTv6LraYTPCKsCnxAximrECtaU33LdHETp4eU5GOM+
         Jq6g==
X-Gm-Message-State: AOJu0Yx8itp+skyKcrEvQBMIiY0eeVTCCUeVcuuq7wKbCxQyGDeis4Z9
	mhtC8rH0RQOeo7pN8ad8shYsaSy6pd/t0Wp2dlY1zcu/3GYWjRPsHYncyunZXpAi
X-Gm-Gg: ASbGncugid5Ik4RgkbtgWQjYskF2aj0DDT2gAMixJcuW5dXoUlA9pKI12qI5fdqxwOg
	EpFSzPX9PqOOkT7meDTBNPzrw0IxLaOmn8Ytlc1TWAhyHRi8Ene6MCweMIgFRpIEWE6Maud5P60
	eqbwvKLHvhmWt5fkFbfe2edRfj+AtcIXcJz/m4ZLMxcbb49F2I8sgh8G09MShwDixFfqRHq72Jo
	h2OHNm8bAu77pjo+zwBJCH5RPyqGmvZH61bhlkAHLrOMacWf7lqYkPPf/rVpYTsmyaYDMOjILoK
	snTeNpVsDufE8OELObj9Q0ZPeHXtinYX33r29D44zBYYtKixoow1N1c4ke9mQE3LDULufy5A5MD
	ao2FSrqEAb57hbyjL6bTdVTjxctgy2AQP/9bkJhcLxsDVg8XOTX6w62HzgN1MzZw=
X-Google-Smtp-Source: AGHT+IFjCEqsCyBqqNtWwKJDl1jc6XKZj5TOj7FF4GG5JN5tfTedIgIaaXwiV1izfgqNLGS4yJkRhA==
X-Received: by 2002:a05:620a:1707:b0:7d0:a16a:4c7c with SMTP id af79cd13be357-7d5df169c92mr2740690385a.46.1751985634669;
        Tue, 08 Jul 2025 07:40:34 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbdbbbbbsm787718785a.39.2025.07.08.07.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 07:40:33 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/3] linux-yocto/6.6: update to v6.6.93
Date: Tue,  8 Jul 2025 10:40:30 -0400
Message-Id: <20250708144032.3095021-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 14:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220039

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    c2603c511feb4 Linux 6.6.93
    c78abb646ff82 ksmbd: use list_first_entry_or_null for opinfo_get_list()
    106451492d74c net: ethernet: ti: am65-cpsw: Lower random mac address error print to info
    513b27dbd126b platform/x86: thinkpad_acpi: Ignore battery threshold change event notification
    871e44494f5d5 platform/x86: fujitsu-laptop: Support Lifebook S2110 hotkeys
    af7243148f2eb NFS: Avoid flushing data while holding directory locks in nfs_rename()
    f83097445b7ec nvme-pci: add NVME_QUIRK_NO_DEEPEST_PS quirk for SOLIDIGM P44 Pro
    e99de95033051 spi: spi-sun4i: fix early activation
    b8435b76971dc phy: starfive: jh7110-usb: Fix USB 2.0 host occasional detection failure
    eae121397e278 drm/amd/display: fix link_set_dpms_off multi-display MST corner case
    4728d56dc56f0 um: let 'make clean' properly clean underlying SUBARCH as well
    af288d8e14058 platform/x86: thinkpad_acpi: Support also NEC Lavie X1475JAS
    764f8cd8aadcd nfs: don't share pNFS DS connections between net namespaces
    98f7c351a11a1 HID: quirks: Add ADATA XPG alpha wireless mouse support
    46a6ce4812555 dmaengine: idxd: cdev: Fix uninitialized use of sva in idxd_cdev_open
    cdb61a705f5f3 coredump: hand a pidfd to the usermode coredump helper
    1846a7b92b863 coredump: fix error handling for replace_fd()
    0ec1e98bf5366 perf/arm-cmn: Initialise cmn->cpu earlier
    10778e2f49a2c perf/arm-cmn: Fix REQ2/SNP2 mixup
    295f7c579b07b net_sched: hfsc: Address reentrant enqueue adding class to eltree twice
    ee1209b9f57ba arm64: dts: ti: k3-am68-sk: Fix regulator hierarchy
    cf27046208bd8 arm64: dts: qcom: sm8550: Add missing properties for cryptobam
    feadf31790331 arm64: dts: qcom: sm8450: Add missing properties for cryptobam
    5dd982ff67d1e arm64: dts: qcom: sm8350: Fix typo in pil_camera_mem node
    abf3ffaeef603 arm64: dts: qcom: ipq9574: Add missing properties for cryptobam
    ea61eda1f4b45 af_unix: Fix uninit-value in __unix_walk_scc()
    ed14f8ae9bcf7 af_unix: Fix garbage collection of embryos carrying OOB with SCM_RIGHTS
    c0c8d419dade9 af_unix: Add dead flag to struct scm_fp_list.
    a288920ff9dab af_unix: Don't access successor in unix_del_edges() during GC.
    3600729b7fc05 af_unix: Try not to hold unix_gc_lock during accept().
    7b1ffbd3b22e7 af_unix: Remove lock dance in unix_peek_fds().
    de7921631ff32 af_unix: Replace garbage collection algorithm.
    2c2d0c662d842 af_unix: Detect dead SCC.
    324005012f65e af_unix: Assign a unique index to SCC.
    d23802221f675 af_unix: Avoid Tarjan's algorithm if unnecessary.
    cdaa3499a8519 af_unix: Skip GC if no cycle exists.
    e0e23fc499920 af_unix: Save O(n) setup of Tarjan's algo.
    27a07364cefdf af_unix: Fix up unix_edge.successor for embryo socket.
    36f924e4bf4e7 af_unix: Save listener for embryo socket.
    3ee9b24bd6f70 af_unix: Detect Strongly Connected Components.
    856aacbe2c520 af_unix: Iterate all vertices by DFS.
    494accabb56e2 af_unix: Bulk update unix_tot_inflight/unix_inflight when queuing skb.
    d2d9f382e2db6 af_unix: Link struct unix_edge when queuing skb.
    4fc7df1c6da14 af_unix: Allocate struct unix_edge for each inflight AF_UNIX fd.
    9e98ba0c73529 af_unix: Allocate struct unix_vertex for each inflight AF_UNIX fd.
    8eb55b667a0e2 af_unix: Remove CONFIG_UNIX_SCM.
    c0d56c028d90f af_unix: Remove io_uring code for GC.
    36f1f6ac53889 af_unix: Replace BUG_ON() with WARN_ON_ONCE().
    acc97866c1eae af_unix: Try to run GC async.
    328840c93bd6a af_unix: Run GC on only one CPU.
    4be073d59068e af_unix: Return struct unix_sock from unix_get_socket().
    c7b1bd52a031a btrfs: check folio mapping after unlock in relocate_one_folio()
    63815bef47ec2 hrtimers: Force migrate away hrtimers queued after CPUHP_AP_HRTIMERS_DYING
    5a9c0d5cbd02d can: kvaser_pciefd: Force IRQ edge in case of nested IRQ
    f968f28cd14bb drm/gem: Internally test import_attach for imported objects
    10aecdc1c30c7 x86/mm/init: Handle the special case of device private pages in add_pages(), to not increase max_pfn and trigger dma_addressing_limited() bounce buffers bounce buffers
    367b8b91de2a0 i3c: master: svc: Fix implicit fallthrough in svc_i3c_master_ibi_work()
    1f9170737480d pinctrl: tegra: Fix off by one in tegra_pinctrl_get_group()
    4a5e6e798ec77 watchdog: aspeed: fix 64-bit division
    a9e4ee7f12886 serial: sh-sci: Save and restore more registers
    517f928cc0c13 pds_core: Prevent possible adminq overflow/stuck condition
    77192e9cfe1b3 highmem: add folio_test_partial_kmap()
    bc133e43cb565 x86/boot: Compile boot code with -std=gnu11 too
    5cdce62dd929a spi: spi-fsl-dspi: Reset SR flags before sending a new message
    7cf42e5f406a5 spi: spi-fsl-dspi: Halt the module after a new message transfer
    9df00bd4769a0 spi: spi-fsl-dspi: restrict register range for regmap access
    0e7efc9acbb56 ksmbd: fix stream write failure
    fa68d5c14a70d Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection"
    f391043332e38 mm/page_alloc.c: avoid infinite retries caused by cpuset race
    363fd868d7a71 memcg: always call cond_resched() after fn()
    f33001a7c1e8f Input: xpad - add more controllers
    ed7d24b0c375f Revert "drm/amd: Keep display off while going into S4"
    bee465c0c464b smb: client: Reset all search buffer pointers when releasing buffer
    17d096c485b89 arm64: dts: marvell: uDPU: define pinctrl state for alarm LEDs
    73cadde98f67f smb: client: Fix use-after-free in cifs_fill_dirent
    7227fc0692d53 drm/edid: fixed the bug that hdr metadata was not reset
    7093887a11fe4 thermal: intel: x86_pkg_temp_thermal: Fix bogus trip temperature
    f86465626917d platform/x86: dell-wmi-sysman: Avoid buffer overflow in current_password_store()
    dde5400dad7e7 can: kvaser_pciefd: Continue parsing DMA buf after dropped RX
    4cfe30f681a3d llc: fix data loss when reading from a socket in llc_ui_recvmsg()
    6764329675f94 ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP10
    74d90875f3d43 ALSA: pcm: Fix race of buffer access at PCM OSS layer
    b5bada85c181f ASoC: SOF: ipc4-pcm: Delay reporting is only supported for playback direction
    1beb8c26b1fb1 ASoc: SOF: topology: connect DAI to a single DAI link
    e8be784d30b44 ASoC: SOF: ipc4-control: Use SOF_CTRL_CMD_BINARY as numid for bytes_ext
    1f912f8484e9c can: bcm: add missing rcu read protection for procfs content
    76c84c3728178 can: bcm: add locking for bcm_op runtime updates
    e80f4f9c64b0f can: slcan: allow reception of short error messages
    584a729615fa9 padata: do not leak refcount in reorder_work
    134daaba93193 crypto: algif_hash - fix double free in hash_accept
    0c605de7edd68 clk: s2mps11: initialise clk_hw_onecell_data::num before accessing ::hws[] in probe()
    35016086ae593 octeontx2-af: Fix APR entry mapping based on APR_LMT_CFG
    cc797adde644d octeontx2-af: Set LMT_ENA bit for APR table entries
    b19fc1d0be3c3 net/tipc: fix slab-use-after-free Read in tipc_aead_encrypt_done
    a3d24e4a835cb octeontx2-pf: Add AF_XDP non-zero copy support
    93c276942e75d sch_hfsc: Fix qlen accounting bug when using peek in hfsc_enqueue()
    c844ace5b88d0 io_uring: fix overflow resched cqe reordering
    dbcd0909a1e2c net: lan743x: Restore SGMII CTRL register on resume
    0b4cde7284869 net: dwmac-sun8i: Use parsed internal PHY address instead of 1
    52b2e5579266f pinctrl: qcom: switch to devm_register_sys_off_handler()
    78b70388ca0ec pinctrl: qcom/msm: Convert to platform remove callback returning void
    df941e11772b3 ice: Fix LACP bonds without SRIOV environment
    c8a1a805e6d27 ice: fix vf->num_mac count with port representors
    fa942824b9f4a bridge: netfilter: Fix forwarding of fragmented packets
    feb6bde1a3241 Bluetooth: btusb: use skb_pull to avoid unsafe access in QCA dump handling
    c331a616a0b10 Bluetooth: L2CAP: Fix not checking l2cap_chan security level
    2b82d8e483bf0 dmaengine: fsl-edma: Fix return code for unhandled interrupts
    55f3c97fcba84 dmaengine: idxd: Fix ->poll() return value
    dcdc1aca6880d xfrm: Sanitize marks before insert
    a1fad2da94f00 clk: sunxi-ng: d1: Add missing divider for MMC mod clocks
    c2b52d947c3dd remoteproc: qcom_wcnss: Fix on platforms without fallback regulators
    5ff1a234fa4ee kernel/fork: only call untrack_pfn_clear() on VMAs duplicated for fork()
    1b388afe88163 dmaengine: idxd: Fix allowing write() from different address spaces
    05298c30b7d9f dmaengine: idxd: add wq driver name support for accel-config user tool
    b58a295d10065 espintcp: remove encap socket caching to avoid reference leak
    3cf3d4f11254e soundwire: bus: Fix race on the creation of the IRQ domain
    d8ece4ced3b05 __legitimize_mnt(): check for MNT_SYNC_UMOUNT should be under mount_lock
    e6d703b693b4c xenbus: Allow PVH dom0 a non-local xenstore
    85d12487d90ab wifi: iwlwifi: add support for Killer on MTL
    4e3401aa6e447 tools: ynl-gen: validate 0 len strings from kernel
    50d0de59f66cb btrfs: avoid NULL pointer dereference if no valid csum tree
    7a97f961a568a btrfs: correct the order of prelim_ref arguments in btrfs__prelim_ref
    225cc549ed23f cifs: Fix changing times and read-only attr over SMB1 smb_set_file_info() function
    fc460c12cd1e9 cifs: Fix and improve cifs_query_path_info() and cifs_query_file_info()
    b72952c8c3668 io_uring/fdinfo: annotate racy sq/cq head/tail reads
    3a982ada411b8 nvmet-tcp: don't restore null sk_state_change
    a7a2315d8d0dc nvme-pci: add quirks for WDC Blue SN550 15b7:5009
    0a3f5efd1c545 nvme-pci: add quirks for device 126f:1001
    1c0d7792cfc71 ALSA: hda/realtek: Add quirk for HP Spectre x360 15-df1xxx
    dbb47cbdbe2ad ASoC: Intel: bytcr_rt5640: Add DMI quirk for Acer Aspire SW3-013
    4c017ff3d73dd ASoC: cs42l43: Disable headphone clamps during type detection
    0ab50f622f202 pinctrl: meson: define the pull up/down resistor value as 60 kOhm
    534794c719231 book3s64/radix: Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
    442a247361f8b ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
    fe4a7145f048c drm: Add valid clones check
    1c58b332bc435 drm/panel-edp: Add Starry 116KHD024006
    e585f4f44a102 drm/atomic: clarify the rules around drm_atomic_state->allow_modeset
    5d4951bad74bf drm: bridge: adv7511: fill stream capabilities
    a7e7cf538939d wifi: ath12k: Fix end offset bit definition in monitor ring descriptor
    2dbcaddcf8eab wifi: ath9k: return by of_get_mac_address
    a21971b4be60f accel/qaic: Mask out SR-IOV PCI resources
    fbdf410d3bd2e wifi: ath12k: fix ath12k_hal_tx_cmd_ext_desc_setup() info1 override
    b658e144a0922 regulator: ad5398: Add device tree support
    df76df11fd8be spi: zynqmp-gqspi: Always acknowledge interrupts
    ccf4a818d8c31 wifi: rtw89: add wiphy_lock() to work that isn't held wiphy_lock() yet
    5e479af4999b0 wifi: rtw88: Don't use static local variable in rtw8822b_set_tx_power_index_by_rate
    ee71c34d4f415 wifi: rtl8xxxu: retry firmware download on error
    419988f4d0efb perf/amd/ibs: Fix ->config to sample period calculation for OP PMU
    0cb6a1292aaef perf/amd/ibs: Fix perf_ibs_op.cnt_mask for CurCnt
    9610a67963506 firmware: arm_scmi: Relax duplicate name constraint across protocol ids
    38d906f1c54b9 bpftool: Fix readlink usage in get_fd_type
    0e8eb91a4950f drm/ast: Find VBIOS mode from regular display size
    e190ed2c12e77 ASoC: rt722-sdca: Add some missing readable registers
    48c78cf634dba ASoC: codecs: pcm3168a: Allow for 24-bit in provider mode
    123ac614e5b34 arm64: zynqmp: add clock-output-names property in clock nodes
    23b0b86ad1db2 HID: usbkbd: Fix the bit shift number for LED_KANA
    c317b0694a6eb wifi: ath12k: Avoid napi_sync() before napi_enable()
    32bcf54138acf scsi: st: Restore some drive settings after reset
    1960bb56a9c83 scsi: lpfc: Free phba irq in lpfc_sli4_enable_msi() when pci_irq_vector() fails
    3dfeee957aaf3 scsi: lpfc: Handle duplicate D_IDs in ndlp search-by D_ID routine
    c34ab75adde53 net/mana: fix warning in the writer of client oob
    1d10624a42437 ice: count combined queues using Rx/Tx count
    948664b92e571 perf: Avoid the read if the count is already updated
    f47d605c5e2a6 rcu: fix header guard for rcu_all_qs()
    9abec90c85b22 rcu: handle unstable rdp in rcu_read_unlock_strict()
    4a36d93a01758 rcu: handle quiescent states for PREEMPT_RCU=n, PREEMPT_COUNT=y
    cae56998162cc ice: treat dyn_allowed only as suggestion
    9ed3c1b11d7ef bridge: mdb: Allow replace of a host-joined group
    961ee132104b0 r8169: don't scan PHY addresses > 0
    2cb57a887a435 ipv4: ip_gre: Fix set but not used warning in ipgre_err() if IPv4-only
    13cba3f837903 vxlan: Annotate FDB data races
    090c0ba179eaf net/mlx5e: Avoid WARN_ON when configuring MQPRIO with HTB offload enabled
    f312bd5cf2067 media: qcom: camss: csid: Only add TPG v4l2 ctrl if TPG hardware is available
    6fed5e23d2a92 f2fs: introduce f2fs_base_attr for global sysfs entries
    9af429febfedf hwmon: (xgene-hwmon) use appropriate type for the latency value
    70e7df6f69073 clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for some RCGs
    ba02bb3a01328 wifi: rtw88: Fix __rtw_download_firmware() for RTL8814AU
    0b660a7f296b5 wifi: rtw88: Fix download_firmware_validate() for RTL8814AU
    23fe8aa8cc1a8 ext4: remove writable userspace mappings before truncating page cache
    73e7c65b21274 ext4: don't write back data before punch hole in nojournal mode
    3648ddabcdc25 leds: trigger: netdev: Configure LED blink interval for HW offload
    7ef54a11c199d pstore: Change kmsg_bytes storage size to u32
    09c3a82664d8f r8152: add vendor/device ID pair for Dell Alienware AW1022z
    cc1d408e7c9e2 ip: fib_rules: Fetch net from fib_rule in fib[46]_rule_configure().
    22ee8dabec1a2 arch/powerpc/perf: Check the instruction type before creating sample with perf_mem_data_src
    fa5d374f6bacb powerpc/pseries/iommu: memory notifier incorrectly adds TCEs for pmemory
    6758d09763f62 net: fec: Refactor MAC reset to function
    2caf52c072059 wifi: mac80211: remove misplaced drv_mgd_complete_tx() call
    bb1f9d63127e8 wifi: mac80211: don't unconditionally call drv_mgd_complete_tx()
    9ef9ecabc6b55 drm/v3d: Add clock handling
    76016797e7f96 net/mlx5e: reduce the max log mpwrq sz for ECPF and reps
    dce57841d93de net/mlx5e: reduce rep rxq depth to 256 for ECPF
    9411c965e4e6a net/mlx5e: set the tx_queue_len for pfifo_fast
    c31e839649547 net/mlx5: Extend Ethtool loopback selftest to support non-linear SKB
    353cd6804ea85 scsi: target: spc: Fix loop traversal in spc_rsoc_get_descr()
    991970293ff8a drm/amd/display/dm: drop hw_support check in amdgpu_dm_i2c_xfer()
    26b6548dc7417 drm/amdgpu: enlarge the VBIOS binary size limit
    de67e80ab48f1 drm/amd/display: Increase block_sequence array size
    16c26a6404454 drm/amd/display: Initial psr_version with correct setting
    c59c96b850ea6 drm/amd/display: Update CR AUX RD interval interpretation
    af2d36316a193 drm/amdgpu: reset psp->cmd to NULL after releasing the buffer
    6881a3a58852f drm/amd/display: Don't try AUX transactions on disconnected link
    ab83ed96f7587 drm/amdgpu: Set snoop bit for SDMA for MI series
    929cda8e4b75d soundwire: amd: change the soundwire wake enable/disable sequence
    6a7b7e98fec0a phy: core: don't require set_mode() callback for phy_get_mode() to work
    3bf3eae909914 serial: sh-sci: Update the suspend/resume support
    e9bed533ec803 sched: Reduce the default slice to avoid tasks getting an extra tick
    5024d8e58a080 x86/traps: Cleanup and robustify decode_bug()
    cc50c7c1a9898 clk: qcom: clk-alpha-pll: Do not use random stack value for recalc rate
    fba6e5d44fb8d clk: qcom: ipq5018: allow it to be bulid on arm32
    d655dbd82b555 net/mlx4_core: Avoid impossible mlx4_db_alloc() order value
    f8a9f45f75ab3 media: v4l: Memset argument to 0 before calling get_mbus_config pad op
    0b9d2468c3d88 media: i2c: imx219: Correct the minimum vblanking value
    868c3d8cfcff6 kunit: tool: Use qboot on QEMU x86_64
    3d6d13540f776 smack: Revert "smackfs: Added check catlen"
    e30f31434e9c3 smack: recognize ipv4 CIPSO w/o categories
    de4332d7a5f6f pinctrl: devicetree: do not goto err when probing hogs in pinctrl_dt_to_map
    b3d2a8809ef07 ASoC: soc-dai: check return value at snd_soc_dai_set_tdm_slot()
    35160eda61e74 ASoC: tas2764: Power up/down amp on mute ops
    c1045e770256c ASoC: tas2764: Mark SW_RESET as volatile
    7ac84ee5eec85 ASoC: tas2764: Add reg defaults for TAS2764_INT_CLK_CFG
    9dcce3f40d54d ASoC: ops: Enforce platform maximum on initial value
    3da8088afd13a firmware: arm_ffa: Reject higher major version as incompatible
    3ec539f1e9195 net/mlx5: Apply rate-limiting to high temperature warning
    69f453ccb9e47 net/mlx5: Modify LSB bitmask in temperature event to include only the first bit
    a9b2bb8a4f25b media: test-drivers: vivid: don't call schedule in loop
    ddddd806ba7de vxlan: Join / leave MC group after remote changes
    d97c38275d12c ACPI: HED: Always initialize before evged
    0d398ed850df9 PCI: Fix old_size lower bound in calculate_iosize() too
    d8afc25580735 eth: mlx4: don't try to complete XDP frames in netpoll
    242272c953e3b bpf: don't do clean_live_states when state->loop_entry->branches > 0
    00e59d1495fba can: c_can: Use of_property_present() to test existence of DT property
    ef7ee9b815345 pmdomain: imx: gpcv2: use proper helper for property detection
    7c5e73608302a RDMA/core: Fix best page size finding when it can cross SG entries
    c504c11b94d6e serial: mctrl_gpio: split disable_ms into sync and no_sync APIs
    df8970a270add drm/amd/display: Add support for disconnected eDP streams
    671fea645a71b i3c: master: svc: Flush FIFO before sending Dynamic Address Assignment(DAA)
    398351dcdb631 EDAC/ie31200: work around false positive build warning
    c81c2ee1c3b05 net: pktgen: fix access outside of user given buffer in pktgen_thread_write()
    35434d1c93c73 wifi: rtw89: fw: propagate error code from rtw89_h2c_tx()
    5ce1f780a3bce wifi: rtw88: Fix rtw_desc_to_mcsrate() to handle MCS16-31
    1b1daafd2e974 wifi: rtw88: Fix rtw_init_ht_cap() for RTL8814AU
    a95813193ab78 wifi: rtw88: Fix rtw_init_vht_cap() for RTL8814AU
    f38a1b35c8f4e scsi: mpt3sas: Send a diag reset if target reset fails
    06abee685cc97 clocksource: mips-gic-timer: Enable counter when CPUs start
    2e1b3650f5691 MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
    ba41e4e627db5 genirq/msi: Store the IOMMU IOVA directly in msi_desc instead of iommu_cookie
    2ed497f369b2e MIPS: Use arch specific syscall name match function
    b2ea189a958a6 crypto: skcipher - Zap type in crypto_alloc_sync_skcipher
    3a0c8429ab1e4 crypto: ahash - Set default reqsize from ahash_alg
    b1d1b09698e99 x86/kaslr: Reduce KASLR entropy on most x86 systems
    b0556ba85a0f3 net/mlx5: Change POOL_NEXT_SIZE define value and make it global
    52aa28f7b1708 dm: fix unconditional IO throttle caused by REQ_PREFLUSH
    ecd205a5241df libbpf: Fix out-of-bound read
    e17a6ba07929b media: tc358746: improve calculation of the D-PHY timing registers
    ca9f3ab612c62 media: adv7180: Disable test-pattern control on adv7180
    3cd2aa93674ee cpuidle: menu: Avoid discarding useful information
    48fd80f7d7b48 vdpa/mlx5: Fix mlx5_vdpa_get_config() endianness on big-endian machines
    f5121d5ba7ce4 vhost-scsi: Return queue full for page alloc failures during copy
    de4469a90075b x86/nmi: Add an emergency handler in nmi_desc & use it in nmi_shootdown_cpus()
    01768d1564650 ASoC: mediatek: mt8188: Add reference for dmic clocks
    6dadc66f6cf3e ASoC: mediatek: mt8188: Treat DMIC_GAINx_CUR as non-volatile
    ec6f764ab7009 drm/amd/display: handle max_downscale_src_width fail check
    7472e0da47716 x86/build: Fix broken copy command in genimage.sh when making isoimage
    f32344bf957b4 Octeontx2-af: RPM: Register driver with PCI subsys IDs
    3314310b3f3e6 soc: ti: k3-socinfo: Do not use syscon helper to build regmap
    f4e35b2c5f5cc wifi: ath12k: Improve BSS discovery with hidden SSID in 6 GHz band
    fed3038a80bbc bonding: report duplicate MAC address in all situations
    7819a7dcf0412 net: xgene-v2: remove incorrect ACPI_PTR annotation
    7b8fe48cc86b6 net: ethernet: mtk_ppe_offload: Allow QinQ, double ETH_P_8021Q only
    ff01e0d0a61e4 leds: pwm-multicolor: Add check for fwnode_property_read_u32
    2059e6ea11c0d drm/amdkfd: KFD release_work possible circular locking
    0759d154654a8 selftests/net: have `gro.sh -t` return a correct exit code
    b3c8449484848 net/mlx5: Avoid report two health errors on same syndrome
    e2de76c34a8a9 firmware: arm_ffa: Set dma_mask for ffa devices
    a1a5e783d7cab PCI: brcmstb: Add a softdep to MIP MSI-X driver
    1f27e708e36ea PCI: brcmstb: Expand inbound window size up to 64GB
    f6dfaf5905ad6 wifi: ath12k: Report proper tx completion status to mac80211
    c7c729d7a85a9 soc: apple: rtkit: Implement OSLog buffers properly
    78b6b2fe17a2e soc: apple: rtkit: Use high prio work queue
    1ae981c91dc26 perf: arm_pmuv3: Call kvm_vcpu_pmu_resync_el0() before enabling counters
    372ed2171031d fpga: altera-cvp: Increase credit timeout
    7b851d6a02da0 drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
    d8e57904dc269 ARM: at91: pm: fix at91_suspend_finish for ZQ calibration
    a9dd5d748c87d hwmon: (gpio-fan) Add missing mutex locks
    7adb96687ce88 x86/bugs: Make spectre user default depend on MITIGATION_SPECTRE_V2
    ca16d144d1f0a clk: imx8mp: inform CCF of maximum frequency of clocks
    032f3bf6471cd media: uvcvideo: Handle uvc menu translation inside uvc_get_le_value
    faa24692f7041 media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
    9459abd770107 drm/rockchip: vop2: Add uv swap for cluster window
    9778a91827272 ipv4: fib: Move fib_valid_key_len() to rtm_to_fib_config().
    2be4a7d53261b ALSA: hda/realtek: Enable PC beep passthrough for HP EliteBook 855 G7
    30ae895966221 perf/hw_breakpoint: Return EOPNOTSUPP for unsupported breakpoint type
    2a9a7d2f19cca net: pktgen: fix mpls maximum labels list parsing
    cf81dae86bf6b net: ethernet: ti: cpsw_new: populate netdev of_node
    2cbe6d551b4a9 pinctrl: bcm281xx: Use "unsigned int" instead of bare "unsigned"
    5c9eca180a423 media: cx231xx: set device_caps for 417
    a7b8f0addf84f drm/amd/display: Skip checking FRL_MODE bit for PCON BW determination
    3af9db78423c5 drm/amdgpu: Do not program AGP BAR regs under SRIOV in gfxhub_v1_0.c
    fef1e1487dea8 remoteproc: qcom_wcnss: Handle platforms with only single power domain
    c5b23df98a925 net: phylink: use pl->link_interface in phylink_expects_phy()
    b27be76f35010 drm/gem: Test for imported GEM buffers with helper
    121f0335d91e4 orangefs: Do not truncate file size
    3986ef4a9b6a0 dm cache: prevent BUG_ON by blocking retries on failed device resumes
    d5f8c8ec1e783 media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
    74eea50b7afa1 ARM: tegra: Switch DSI-B clock parent to PLLD on Tegra114
    da74e11cedd1e ieee802154: ca8210: Use proper setters and getters for bitwise types
    c0acbeac2b287 rtc: ds1307: stop disabling alarms on probe
    fb69189023279 tcp: bring back NUMA dispersion in inet_ehash_locks_alloc()
    8c1a16d612ef7 ALSA: seq: Improve data consistency at polling
    7b1bb4d40dab8 powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
    d0e3e19564f03 arm64: tegra: Resize aperture for the IGX PCIe C5 slot
    988770bf312cf arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
    ab13c8a5f777b drm/amdkfd: Set per-process flags only once cik/vi
    0acdc4d6e679b crypto: lzo - Fix compression buffer overrun
    ab4545a2540b7 watchdog: aspeed: Update bootstatus handling
    ac64f0e893ff3 cpufreq: tegra186: Share policy per cluster
    3123b3d445d16 iommu/amd/pgtbl_v2: Improve error handling
    8c305588bab71 ASoC: qcom: sm8250: explicitly set format in sm8250_be_hw_params_fixup()
    5b518c452ff58 auxdisplay: charlcd: Partially revert "Move hwidth and bwidth to struct hd44780_common"
    769d1bccd1cac gfs2: Check for empty queue in run_queue
    2e37d331c00c0 drm/amd/display: Fix incorrect DPCD configs while Replay/PSR switch
    1da3dc73724bb drm/amd/display: calculate the remain segments for all pipes
    4c2a348875646 drm/amd/display: remove minimum Dispclk and apply oem panel timing.
    8ebf2709fe4dc ipv6: save dontfrag in cork
    2b790fe67ed48 wifi: iwlwifi: fix debug actions order
    386a1a0d558d7 printk: Check CON_SUSPEND when unblanking a console
    8a7f2e84f85ad hwmon: (dell-smm) Increment the number of fans
    def5f5bc83ee7 usb: xhci: Don't change the status of stalled TDs on failed Stop EP
    903c4a0c2aff4 mmc: sdhci: Disable SD card clock before changing parameters
    5ae75245939c6 mmc: dw_mmc: add exynos7870 DW MMC support
    110f701e60f98 arm64/mm: Check PUD_TYPE_TABLE in pud_bad()
    89947eea8ff91 netfilter: conntrack: Bound nf_conntrack sysctl writes
    da36c3ad7c177 timer_list: Don't use %pK through printk()
    6df3855868eb8 posix-timers: Add cond_resched() to posix_timer_add() search loop
    1bef1811651bc RDMA/uverbs: Propagate errors from rdma_lookup_get_uobject()
    ba841627308a3 ext4: do not convert the unwritten extents if data writeback fails
    d7f3c874ea707 ext4: reject the 'data_err=abort' option in nojournal mode
    baf667f23f609 ASoC: sun4i-codec: support hp-det-gpios property
    f8d946034765a drm/amdgpu: Update SRIOV video codec caps
    2e290e9cf6a17 mfd: tps65219: Remove TPS65219_REG_TI_DEV_ID check
    aa97ea576a3f2 pinctrl-tegra: Restore SFSEL bit when freeing pins
    0fb6c439d265f xen: Add support for XenServer 6.1 platform device
    3ecfb92c019f2 net/smc: use the correct ndev to find pnetid by pnetid table
    ba8354a613a57 dm: restrict dm device size to 2^63-512 bytes
    44a82d2495e36 crypto: octeontx2 - suppress auth failure screaming due to negative tests
    3edb08b6c21ef kbuild: fix argument parsing in scripts/config
    bc8023ef3b114 bpf: Allow pre-ordering for bpf cgroup progs
    aed5bd3a84e87 ASoC: mediatek: mt6359: Add stub for mt6359_accdet_enable_jack_detect
    bf9cfc7fbe742 thunderbolt: Do not add non-active NVM if NVM upgrade is disabled for retimer
    4beb1e55f6b08 objtool: Fix error handling inconsistencies in check()
    72d9ccdcfce24 rtc: rv3032: fix EERD location
    a7b7bc510e9ea tcp: reorganize tcp_in_ack_event() and tcp_count_delivered()
    ed88717950ba9 jbd2: do not try to recover wiped journal
    5741b9d7bb873 bpf: Return prog btf_id without capable check
    743bb753255d3 vfio/pci: Handle INTx IRQ_NOTCONNECTED
    9f51fa1971239 scsi: st: ERASE does not change tape location
    01195aa1d694b scsi: st: Tighten the page format heuristics with MODE SELECT
    3011cdc5cb46c hypfs_create_cpu_files(): add missing check for hypfs_mkdir() failure
    4eda8a85d4d01 ext4: reorder capability check last
    57a2882cd4f35 um: Update min_low_pfn to match changes in uml_reserved
    7638182277867 um: Store full CSGSFS and SS register from mcontext
    61225b3395c21 dlm: make tcp still work in multi-link env
    0541822045ae0 i3c: master: svc: Fix missing STOP for master request
    398c541ed0495 drm/amd/display: Guard against setting dispclk low for dcn31x
    3192d59fb7b78 btrfs: send: return -ENAMETOOLONG when attempting a path that is too long
    a7f1c5fb7dd90 btrfs: get zone unusable bytes while holding lock at btrfs_reclaim_bgs_work()
    4dc7dcb919f36 btrfs: fix non-empty delayed iputs list on unmount due to async workers
    de635f9bba32e btrfs: run btrfs_error_commit_super() early
    1a012fd4eb9d0 btrfs: avoid linker error in btrfs_find_create_tree_block()
    4e74f91a6f70a btrfs: make btrfs_discard_workfn() block_group ref explicit
    a4666a812792d i2c: pxa: fix call balance of i2c->clk handling routines
    4fc8e3fb8efa8 i2c: qup: Vote for interconnect bandwidth to DRAM
    bffd5f2815c52 x86/mm: Check return value from memblock_phys_alloc_range()
    7124a9b6824e1 x86/stackprotector/64: Only export __ref_stack_chk_guard on CONFIG_SMP
    1752ceaa72d37 wifi: mt76: mt7996: revise TXS size
    d9776ce1733c7 wifi: mt76: only mark tx-status-failed frames as ACKed on mt76x0/2
    17e3ab067dfb6 mmc: host: Wait for Vdd to settle on card power off
    ea3d95e05e97e libnvdimm/labels: Fix divide error in nd_label_data_init()
    f29eb4c63bf4e ext4: on a remount, only log the ro or r/w state when it has changed
    44acbc14ea28d PCI: vmd: Disable MSI remapping bypass under Xen
    aa59ccacf8f33 pNFS/flexfiles: Report ENETDOWN as a connection error
    ec59dfbc1ba2f tools/build: Don't pass test log files to linker
    e4510552c297c PCI: dwc: ep: Ensure proper iteration over outbound map windows
    a74286d17e751 objtool: Properly disable uaccess validation
    454a770aea9fd lockdep: Fix wait context check on softirq for PREEMPT_RT
    0c2aa72f4f352 dql: Fix dql->limit value when reset.
    3854f4e98ef22 thermal/drivers/qoriq: Power down TMU on system suspend
    4a120221661fc spi-rockchip: Fix register out of bounds access
    4a8ebc45f2021 SUNRPC: rpcbind should never reset the port to the value '0'
    3ef02a05c86b4 SUNRPC: rpc_clnt_set_transport() must not change the autobind setting
    6b8beb8104d73 NFSv4: Treat ENETUNREACH errors as fatal for state recovery
    ee68e068cf92f cifs: Fix establishing NetBIOS session for SMB2+ connection
    89bcd83f67d22 cifs: add validation check for the fields in smb_aces
    88bf6295f065a fbdev: core: tileblit: Implement missing margin clearing for tileblit
    1714afc14dbe6 fbcon: Use correct erase colour for clearing in fbcon
    7f370b7e6fa03 fbdev: fsl-diu-fb: add missing device_remove_file()
    bbf3bb6ddea47 riscv: Allow NOMMU kernels to access all of RAM
    09096ead92f39 mailbox: use error ret code of of_parse_phandle_with_args()
    5641f6b3a4cd5 mailbox: pcc: Use acpi_os_ioremap() instead of ioremap()
    7d5b227875fb7 ACPI: PNP: Add Intel OC Watchdog IDs to non-PNP device list
    c1ab9f008ed40 tracing: Mark binary printing functions with __printf() attribute
    50702e7b47ed7 arm64: Add support for HIP09 Spectre-BHB mitigation
    e0b05cd9ece6e SUNRPC: Don't allow waiting for exiting tasks
    c72826efbb5eb NFS: Don't allow waiting for exiting tasks
    a81dd69f859b6 NFSv4: Check for delegation validity in nfs_start_delegation_return_locked()
    2371143e41735 fuse: Return EPERM rather than ENOSYS from link()
    209a4da04a27d smb: client: Store original IO parameters and prevent zero IO sizes
    5194597b9cde7 cifs: Fix negotiate retry functionality
    d50f7ce2fc32a cifs: Fix querying and creating MF symlinks over SMB1
    18066188eb90c cifs: Add fallback for SMB2 CREATE without FILE_READ_ATTRIBUTES
    f08641cd2152d s390/vfio-ap: Fix no AP queue sharing allowed message written to kernel log
    a6f24a41ef527 kconfig: merge_config: use an empty file as initfile
    adbb39eca39d1 samples/bpf: Fix compilation failure for samples/bpf on LoongArch Fedora
    38aa3cf1545f3 bpf: fix possible endless loop in BPF map iteration
    f5f169cd90769 selftests/bpf: Mitigate sockmap_ktls disconnect_after_delete failure
    f7292fbb41840 drm/amdgpu: Allow P2P access through XGMI
    722a6972defd8 ima: process_measurement() needlessly takes inode_lock() on MAY_READ
    91ba964a752bb net: enetc: refactor bulk flipping of RX buffers to separate function
    c36f5f659ad9c scsi: mpi3mr: Add level check to control event logging
    ca85c2d0db5f8 vhost-scsi: protect vq->log_used with vq->mutex
    20fb292ab5d5d cgroup: Fix compilation issue due to cgroup_mutex not being exported
    c15dc980ffc5a dma-mapping: avoid potential unused data compilation warning
    2cab5ea2f5ab6 intel_th: avoid using deprecated page->mapping, index fields
    b49b5132e4c73 virtio_ring: Fix data race by tagging event_triggered as racy for KCSAN
    42d15918da268 scsi: ufs: Introduce quirk to extend PA_HIBERN8TIME for UFS devices
    fe8421e853ef2 scsi: target: iscsi: Fix timeout on deleted connection
    beb6382add07a nvmem: qfprom: switch to 4-byte aligned reads
    35d77c8d887e1 nvmem: core: update raw_len if the bit reading is required
    497f19cacb3f8 nvmem: core: verify cell's raw_len
    04c81ac33a607 nvmem: rockchip-otp: add rk3576 variant data
    266e5f4813808 nvmem: rockchip-otp: Move read-offset into variant-data
    b3145041e990a cpufreq: Add SM8650 to cpufreq-dt-platdev blocklist
    1efbe2c7a0f44 phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
    cf60d19721bc4 phy: renesas: rcar-gen3-usb2: Lock around hardware registers and driver data
    e992f2581b794 phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
    eb4fdee1d6303 phy: renesas: rcar-gen3-usb2: Add support to initialize the bus
    e668cbeb9590a i2c: designware: Fix an error handling path in i2c_dw_pci_probe()
    ad40588df1820 i2c: designware: Use temporary variable for struct device
    0ef9396a7da7a i2c: designware: Remove ->disable() callback
    33378973d843b i2c: designware: Uniform initialization flow for polling mode
    d1954e7aa1313 gpio: pca953x: fix IRQ storm on system wake up
    58e34598436f8 gpio: pca953x: Simplify code with cleanup helpers
    475d6ebc91a24 gpio: pca953x: Split pca953x_restore_context() and pca953x_save_context()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index d855ee3f8a..d9937c2f73 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1933814ca46d38977965bbfe58ee3a1f8aacfb36"
-SRCREV_meta ?= "8e66f449e449f9ae2809b6c395ed7089aa37d7a3"
+SRCREV_machine ?= "c39ccd8635d045d2fb41df620e389b14224822bd"
+SRCREV_meta ?= "2ad3db8c94fece927ad59267524d42ac6353b137"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.92"
+LINUX_VERSION ?= "6.6.93"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 382a74f648..3c9dea9fcc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.92"
+LINUX_VERSION ?= "6.6.93"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c72b190dc393b310be436153c864144694b184a6"
-SRCREV_meta ?= "8e66f449e449f9ae2809b6c395ed7089aa37d7a3"
+SRCREV_machine ?= "467bfb36ac1bc218abb76541fd702ad01cf2b08f"
+SRCREV_meta ?= "2ad3db8c94fece927ad59267524d42ac6353b137"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index c1bb736e04..2c9dfec885 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1d95b0a9486ae02a4eb38df55b94cb64485bd4c0"
-SRCREV_machine:qemuarm64 ?= "8cd580eb06e43c9a4e9c26e1dd954a334f656fbd"
-SRCREV_machine:qemuloongarch64 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
-SRCREV_machine:qemumips ?= "a3bbede9b1c6dbd0b51132b8447adbbde1f46f85"
-SRCREV_machine:qemuppc ?= "a5bba7e08dbb26c0dc7d7ec0624e903b7c6bac94"
-SRCREV_machine:qemuriscv64 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
-SRCREV_machine:qemuriscv32 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
-SRCREV_machine:qemux86 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
-SRCREV_machine:qemux86-64 ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
-SRCREV_machine:qemumips64 ?= "a1ed8408c3b0bc729270cc2bd2c9dd0056ab9271"
-SRCREV_machine ?= "6032c9c1ac18edd7c8eadd6f9f655556b5f5e77c"
-SRCREV_meta ?= "8e66f449e449f9ae2809b6c395ed7089aa37d7a3"
+SRCREV_machine:qemuarm ?= "28044337d9d2d6fd8ce6dea661ddc35284d69299"
+SRCREV_machine:qemuarm64 ?= "2765162684e8e1e08c832efb20e946b033ece5ae"
+SRCREV_machine:qemuloongarch64 ?= "dbc28205654b693ad9557f6ed0387b33eb9b1766"
+SRCREV_machine:qemumips ?= "3fd113a19fa0301bdde9411662c460be81bfd054"
+SRCREV_machine:qemuppc ?= "a687cdebe38217504d5077460e25c16684412f37"
+SRCREV_machine:qemuriscv64 ?= "dbc28205654b693ad9557f6ed0387b33eb9b1766"
+SRCREV_machine:qemuriscv32 ?= "dbc28205654b693ad9557f6ed0387b33eb9b1766"
+SRCREV_machine:qemux86 ?= "dbc28205654b693ad9557f6ed0387b33eb9b1766"
+SRCREV_machine:qemux86-64 ?= "dbc28205654b693ad9557f6ed0387b33eb9b1766"
+SRCREV_machine:qemumips64 ?= "7eaf772c836fa74ce0a5b0cc8135dd578715e6f4"
+SRCREV_machine ?= "dbc28205654b693ad9557f6ed0387b33eb9b1766"
+SRCREV_meta ?= "2ad3db8c94fece927ad59267524d42ac6353b137"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ffaf6178137b9cdcc9742d6677b70be164dfeb8c"
+SRCREV_machine:class-devupstream ?= "c2603c511feb427b2b09f74b57816a81272932a1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.92"
+LINUX_VERSION ?= "6.6.93"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


