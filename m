Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78E8E67498
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:36 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68780.1766353051436260658
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n1R04/7Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7baf61be569so3661447b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353051; x=1766957851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MylxioxUDXHQAAJXDGipEGwALwIoYc2ELAsdbeKqKeI=;
        b=n1R04/7QBzgWeqJXFq3yLZgbEBDL6N7efxAv4rUu33bAc2eth1jG+xifE04IQHZHqO
         e+SeUUkAwf+trsRQl5jBeN4p3JgVsYb5kPrkuOxdtlGaYvNGTNLrfksV335iyk+uXHGG
         ihz3lfj+pnm0HIiGhjplcoj1pjdxps6JyNRCI0I7rDzdg+l635k6ocHkuioSUakufdCS
         K7s0Q0H1erjtYpGq+FRqE5518iqJM2gcje8+RcPIsf0hASgnDLE4E1P0NNkRpnH3kzxG
         wrfks//gJ8MCEnuvW368TS1nLhOsQScC0PTMxx2XRl+/ns8Eh5x6G7YDDD7TSTN85JBt
         MwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353051; x=1766957851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MylxioxUDXHQAAJXDGipEGwALwIoYc2ELAsdbeKqKeI=;
        b=urHdkqLd0MAtnzeE1AyvuIaXFt39psOgHGu7JkXe0jJRe56MnRsB+rrfS/d60pcTnT
         v5oZgDDULZkjMoURXvzS6Z7sHmkSM9G7kuYtSktYnw3Xk1kXFK8c/z5jR4EP9ZkspAoj
         2/rlM9++w5N4u5yIC5C2IcQfzP2vsYMnIJt3/GXa9my7rk2xdv78pIi/2suI1kbp0ZY1
         fEDyc0/9zjCCZ5ag3CNykOpNL7sruaI6MaH2t0ckmTbCDUaJm/Q7yR3cVYQpj2MNY2Pr
         H1yn+MjSNioJ1uBv4Xqk3DKjljsHClen5jGEhuzP0J4VQB6anAp/1acM8fz7OH3KWaDN
         GC+A==
X-Gm-Message-State: AOJu0Yx/OKsdoCevCBKK931dnLVFXBsYnHw7f29Szw4sWchjnqvsJyKe
	cNyX1cVeXL/Hi5ZY8x1fdaxNht3mrolFyu6sgya2GBJHrvaRJUJRgJtiTA5HAHuGSSPb04If6Vm
	LE+WOK4w=
X-Gm-Gg: AY/fxX6xZnX2hqDI6iomvo3MiEaMwbyLdWXZbiD3eeO5H64M/uoa+v/LnObVPr7kw8i
	IrF5NmVS6HDs7C+QvEbZGsC2koRMlpYS+GaBAbYpB/qh2XeYv9zbuyEKK9fkjcp6hEuF5rAV5uY
	178gBsyQbXexgH6nXn/obzeKWwj1CEV6G6qInIWCzB7qeBk1ycAh3NDqcf2Hqzsqf6/oX6chMNI
	uMN8ogBe6jIIs/tF4zCFSZ8QZnklr2fXmO4pcK7q80SaKmsVKcBQUngS/QO0Vpnj6F3Qqj/vFWp
	17LL5iUP/9iHHxFx84blkO3gbcnNMC7NnfIulcy7E4/Zp149XEDTNLKKkf+RTd5caftU4I43LrZ
	23C5kSGs0NfLWcaliHtIJrDNpONRH3y/7i0I2Y9GVRGCfWVDZSYapZeaeAXIsWylI5wnA5uDvs3
	P/
X-Google-Smtp-Source: AGHT+IEuegZ6CmPp5rr0Yy8SOahdNZlrFyb42LYtHBeKYKeUH6dlUU6TBLI7gC0Rc2iMAdZ/5DUUgA==
X-Received: by 2002:a05:6a00:8087:b0:7f7:394e:b3 with SMTP id d2e1a72fcca58-7ff6795a243mr6875040b3a.46.1766353050437;
        Sun, 21 Dec 2025 13:37:30 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 06/18] linux-yocto/6.12: update to v6.12.59
Date: Sun, 21 Dec 2025 13:36:59 -0800
Message-ID: <6407bc91afac64b14fe55009b06749e6184649fc.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228264

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    d5dc97879a97 Linux 6.12.59
    5c19daa93d9a Bluetooth: MGMT: fix crash in set_mesh_sync and set_mesh_complete
    01c7a6e25b9d proc: proc_maps_open allow proc_mem_open to return NULL
    2dbb5e9d489c net: netpoll: ensure skb_pool list is always initialized
    c45a1db3bec6 net: phy: micrel: Fix lan8814_config_init
    6dce43433e06 isdn: mISDN: hfcsusb: fix memory leak in hfcsusb_probe()
    90253acae248 mm/huge_memory: preserve PG_has_hwpoisoned if a folio is split to >0 order
    6393d21c6af6 mm/huge_memory: do not change split_huge_page*() target order silently
    52f2d5cf33de mm/secretmem: fix use-after-free race in fault handler
    a6226fa652ae mm/truncate: unmap large folio on split failure
    c4476fac0c6c mm/memory: do not populate page table entries beyond i_size
    df92165dd0f5 uio_hv_generic: Set event for all channels on the device
    5a127a4553c4 rust: kbuild: workaround `rustdoc` doctests modifier bug
    3b987ebe6c4b rust: kbuild: treat `build_error` and `rustdoc` as kernel objects
    61f5665d84ee io_uring/napi: fix io_napi_entry RCU accesses
    218a8504e62f ALSA: hda: Fix missing pointer check in hda_component_manager_init function
    3010739f5343 KVM: VMX: Fix check for valid GVA on an EPT violation
    6db2b0eb3251 KVM: VMX: Split out guts of EPT violation to common/exposed function
    c79a6d9da292 net: netpoll: fix incorrect refcount handling causing incorrect cleanup
    f3c824361452 net: netpoll: flush skb pool during cleanup
    1652fbe44802 net: netpoll: Individualize the skb pool
    a8ac2bd0f98e KVM: guest_memfd: Remove bindings on memslot deletion when gmem is dying
    08adc31ec7ad KVM: guest_memfd: Remove RCU-protected attribute from slot->gmem.file
    4559d96554dc KVM: guest_memfd: Pass index, not gfn, to __kvm_gmem_get_pfn()
    34c93e96c3a3 mm, percpu: do not consider sleepable allocations atomic
    c0a9c2c1b7b9 wifi: mac80211: use wiphy_hrtimer_work for csa.switch_work
    d4caee32a9f8 wifi: cfg80211: add an hrtimer based delayed work item
    0206a9341e65 mptcp: fix MSG_PEEK stream corruption
    ab9d10109ad0 selftests: mptcp: join: properly kill background tasks
    6d44dd3a0ae4 selftests: mptcp: join: userspace: longer transfer
    da4f2e33d320 selftests: mptcp: connect: trunc: read all recv data
    ce01b8f0055e selftests: mptcp: join: endpoints: longer transfer
    c584a9ecae9b selftests: mptcp: join: rm: set backup flag
    37f92c400e5a selftests: mptcp: connect: fix fallback note due to OoO
    3e473aeca3c2 pmdomain: samsung: plug potential memleak during probe
    47d412d48b76 pmdomain: imx: Fix reference count leak in imx_gpc_remove
    921b090841ae pmdomain: arm: scmi: Fix genpd leak on provider registration failure
    d9db9abf6667 drm/amdgpu: disable peer-to-peer access for DCC-enabled GC12 VRAM surfaces
    325aa0716539 drm/amdkfd: relax checks for over allocation of save area
    12726095e209 btrfs: release root after error in data_reloc_print_warning_inode()
    1ab78aabdc45 btrfs: do not update last_log_commit when logging inode due to a new name
    ee492508f736 btrfs: scrub: put bio after errors in scrub_raid56_parity_stripe()
    92f06abe64bd btrfs: zoned: fix conventional zone capacity calculation
    862b0e639367 PM: hibernate: Use atomic64_t for compressed_size variable
    8dd351c412d0 PM: hibernate: Emit an error when image writing fails
    df0f4b13dfbf EDAC/altera: Use INTTEST register for Ethernet and USB SBE injection
    0f64b37f194b EDAC/altera: Handle OCRAM ECC enable after warm reset
    8e5aa33ef580 LoongArch: Use physical addresses for CSR_MERRENTRY/CSR_TLBRENTRY
    ad8360d5f783 ftrace: Fix BPF fexit with livepatch
    a7907979a7a7 selftests/user_events: fix type cast for write_index packed member in perf_test
    850c7f0537cc x86/microcode/AMD: Add Zen5 model 0x44, stepping 0x1 minrev
    80db91cbb730 spi: Try to get ACPI GPIO IRQ earlier
    21b7af43f19a smb: client: fix cifs_pick_channel when channel needs reconnect
    16e33851c30e crypto: hisilicon/qm - Fix device reference leak in qm_get_qos_value
    f89c5e7077f6 crash: fix crashkernel resource shrink
    fc6acd4cddf7 codetag: debug: handle existing CODETAG_EMPTY in mark_objexts_empty for slabobj_ext
    48c17341577e cifs: client: fix memory leak in smb3_fs_context_parse_param
    98e9d5e33bda ALSA: usb-audio: Fix potential overflow of PCM transfer buffer
    8662995aaaf7 mmc: dw_mmc-rockchip: Fix wrong internal phase calculate
    793245afc695 mmc: sdhci-of-dwcmshc: Change DLL_STRBIN_TAPNUM_DEFAULT to 0x4
    dd853cf1da2e mm/shmem: fix THP allocation and fallback loop
    361e53efad83 mm/mm_init: fix hash table order logging in alloc_large_system_hash()
    623bb26127fb fs/proc: fix uaf in proc_readdir_de()
    6455948c8aab wifi: mac80211: reject address change while connecting
    6a9657ec69a1 selftests/tracing: Run sample events to clear page cache events
    36049e81dc7f nilfs2: avoid having an active sc_timer before freeing sci
    b84f083f50ec ipv4: route: Prevent rt_bind_exception() from rebinding stale fnhe
    0c5579294cc7 LoongArch: Let {pte,pmd}_modify() record the status of _PAGE_DIRTY
    5476ceb41c2e LoongArch: Use correct accessor to read FWPC/MWPC
    35ca3d544579 dma-mapping: benchmark: Restore padding to ensure uABI remained consistent
    381a60545b99 strparser: Fix signed/unsigned mismatch bug
    74f78421c925 ksm: use range-walk function to jump over holes in scan_get_next_rmap_item
    4587a7826be1 ksmbd: close accepted socket when per-IP limit rejects connection
    592b3b203a3e gcov: add support for GCC 15
    d7be15a634aa NFSD: free copynotify stateid in nfs4_free_ol_stateid()
    3bc33097d4e3 nfsd: add missing FATTR4_WORD2_CLONE_BLKSIZE from supported attributes
    b6bc86ce3944 nfsd: fix refcount leak in nfsd_set_fh_dentry()
    08c8d23e2ed1 KVM: SVM: Mark VMCB_LBR dirty when MSR_IA32_DEBUGCTLMSR is updated
    4d9b0ea62972 LoongArch: KVM: Add delay until timer interrupt injected
    70c130b1cfa5 LoongArch: KVM: Restore guest PMU if it is enabled
    031e00249e9e net: dsa: sja1105: fix kasan out-of-bounds warning in sja1105_table_delete_entry()
    27f853e7ac30 HID: uclogic: Fix potential memory leak in error path
    4fe3b912f500 HID: playstation: Fix memory leak in dualshock4_get_calibration_data()
    81c79853828e ARM: dts: BCM53573: Fix address of Luxul XAP-1440's Ethernet PHY
    68859a92f9a3 HID: hid-ntrig: Prevent memory leak in ntrig_report_version()
    77711ee769cb ARM: dts: imx51-zii-rdu1: Fix audmux node names
    20b72f3f4dc5 arm64: dts: rockchip: Make RK3588 GPU OPP table naming less generic
    e8d944bc7e97 arm64: dts: rockchip: Set correct pinctrl for I2S1 8ch TX on odroid-m1
    cf23d531a9d4 netfilter: nf_tables: reject duplicate device on updates
    49344aac0355 Revert "netfilter: nf_tables: Reintroduce shortened deletion notifications"
    13d1c96d3a9f sched_ext: Fix unsafe locking in the scx_dump_state()
    ba306daa7fa8 fs/namespace: correctly handle errors returned by grab_requested_mnt_ns
    cf327202d98f virtio-fs: fix incorrect check for fsvq->kobj
    f0bb381b0774 mtd: onenand: Pass correct pointer to IRQ handler
    6700c8918b66 hostfs: Fix only passing host root in boot stage with new mount
    0e75a098b0a3 f2fs: fix to avoid overflow while left shift operation
    d71b98f253b0 Bluetooth: MGMT: Fix possible UAFs
    098927a13fd9 ext4: fix out-of-bound read in ext4_xattr_inode_dec_ref_all()
    54f8f38a8e9f lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
    04b1fd794553 ext4: introduce ITAIL helper
    883902e4a87a proc: fix the issue of proc_mem_open returning NULL
    80dc5a2ce5b7 wifi: ath11k: Clear affinity hint before calling ath11k_pcic_free_irq() in error path
    484829bc04b9 irqchip/riscv-intc: Add missing free() callback in riscv_intc_domain_ops
    9944c7938cd5 bpf: account for current allocated stack depth in widen_imprecise_scalars()
    6392e5f4b1a3 bpf: Add bpf_prog_run_data_pointers()
    0b4f78e27c48 acpi/hmat: Fix lockdep warning for hmem_register_resource()
    cbdbfc756f29 ALSA: usb-audio: Fix NULL pointer dereference in snd_usb_mixer_controls_badd
    b2e4cda71ed0 NFS: Fix LTP test failures when timestamps are delegated
    35517f62a084 NFSv4: Fix an incorrect parameter when calling nfs4_call_sync()
    b058e49fd69c NFS: sysfs: fix leak when nfs_client kobject add fails
    bd4064f18d4f NFSv2/v3: Fix error handling in nfs_atomic_open_v23()
    7da2c13e733c simplify nfs_atomic_open_v23()
    8961b12d5aa2 pnfs: Set transport security policy to RPC_XPRTSEC_NONE unless using TLS
    b8031e779ae3 pnfs: Fix TLS logic in _nfs4_pnfs_v4_ds_connect()
    f2fcc305b4dc ASoC: tas2781: fix getting the wrong device number
    5aea2cde03d4 drm/vmwgfx: Validate command header size against SVGA_CMD_MAX_DATASIZE
    16608e53c17b ASoC: codecs: va-macro: fix resource leak in probe error path
    1fd2470b7661 ASoC: cs4271: Fix regulator leak on probe failure
    2c27dd5b1ae5 regulator: fixed: fix GPIO descriptor leak on register failure
    35638c69efd5 acpi,srat: Fix incorrect device handle check for Generic Initiator
    540471df3d13 Bluetooth: L2CAP: export l2cap_chan_hold for modules
    527739d51b4a ACPI: CPPC: Limit perf ctrs in PCC check only to online CPUs
    49a1b7d2f0ca ACPI: CPPC: Perform fast check switch only for online CPUs
    944b13dade4b ACPI: CPPC: Check _CPC validity for only the online CPUs
    b8026a5028bb ACPI: CPPC: Detect preferred core availability on online CPUs
    57622b6b1a6b hsr: Fix supervision frame sending on HSRv0
    6e48bc7c26c1 virtio-net: fix incorrect flags recording in big mode
    4d8b5fe1a401 net_sched: limit try_bulk_dequeue_skb() batches
    2250a4b79fdf net/mlx5e: Fix potentially misleading debug message
    ef70624bde33 net/mlx5e: Fix wraparound in rate limiting for values above 255 Gbps
    e099bde2683f net/mlx5e: Fix maxrate wraparound in threshold between units
    d1dbbbe83964 net: sched: act_ife: initialize struct tc_ife to fix KMSAN kernel-infoleak
    51cb05d4fd63 net: sched: act_connmark: initialize struct tc_ife to fix kernel leak
    878c855efa37 net_sched: act_connmark: use RCU in tcf_connmark_dump()
    db81ad20fd8a af_unix: Initialise scc_index in unix_add_edge().
    acd24d509227 wifi: mac80211: skip rate verification for not captured PSDUs
    3c5451eef231 net: mdio: fix resource leak in mdiobus_register_device()
    f0104977fed2 tipc: Fix use-after-free in tipc_mon_reinit_self().
    b9f8712eb8b8 net: ethernet: ti: am65-cpsw-qos: fix IET verify retry mechanism
    49742edce0e3 net: ethernet: ti: am65-cpsw-qos: fix IET verify/response timeout
    9d9bafbf99da net/handshake: Fix memory leak in tls_handshake_accept()
    35a306bb5327 net/smc: fix mismatch between CLC header and proposal
    1cfa4eac275c sctp: prevent possible shift-out-of-bounds in sctp_transport_update_rto
    f9b96218f2ca Bluetooth: 6lowpan: Don't hold spin lock over sleeping functions
    13ca43480f38 Bluetooth: 6lowpan: fix BDADDR_LE vs ADDR_LE_DEV address type confusion
    11cd7e068381 Bluetooth: 6lowpan: reset link-local header on ipv6 recv path
    95b9b98c93b1 Bluetooth: btusb: reorder cleanup in btusb_disconnect to avoid UAF
    7b6b6c077cad Bluetooth: MGMT: cancel mesh send timer when hdev removed
    a5728422b8c9 NFSD: Skip close replay processing if XDR encoding fails
    22511faf140a rust: Add -fno-isolate-erroneous-paths-dereference to bindgen_skip_c_flags
    347bf638d39f net: phy: micrel: lan8814 fix reset of the QSGMII interface
    d14c094447f7 net: phy: micrel: Replace hardcoded pages with defines
    50ce635ec8c6 net: phy: micrel: Introduce lanphy_modify_page_reg
    45e2bc24b593 net: fec: correct rx_bytes statistic for the case SHIFT16 is set
    a9619d259f59 selftests: net: local_termination: Wait for interfaces to come up
    4d0e0bb1908a erofs: avoid infinite loop due to incomplete zstd-compressed data
    53cf801b8555 wifi: ath11k: zero init info->status in wmi_process_mgmt_tx_comp()
    c18a066071c7 ASoC: max98090/91: fixed max98091 ALSA widget powering up/down
    c381dd20b0b2 HID: logitech-hidpp: Add HIDPP_QUIRK_RESET_HI_RES_SCROLL
    dcc51dfe6ff2 smb/server: fix possible refcount leak in smb2_sess_setup()
    f13055877318 smb/server: fix possible memory leak in smb2_read()
    6c627bcc1896 exfat: fix improper check of dentry.stream.valid_size
    fe19b58b3540 HID: quirks: Add ALWAYS_POLL quirk for VRS R295 steering wheel
    25fbc3c27f65 NFS: check if suid/sgid was cleared after a write as needed
    b219d400f4a2 HID: nintendo: Wait longer for initial probe
    251d0e6256ac HID: quirks: avoid Cooler Master MM712 dongle wakeup bug
    dfd7e631a708 NFS4: Apply delay_retrans to async operations
    ba6fdd9b4da0 NFS4: Fix state renewals missing after boot
    43aa61c18a3a drm/amdgpu: Fix NULL pointer dereference in VRAM logic for APU devices
    39a1c8c860e3 drm/amdgpu: hide VRAM sysfs attributes on GPUs without VRAM
    d033e8cf4e8f drm/amd/pm: Disable MCLK switching on SI at high pixel clocks
    eaf12bffd7f7 drm/amdgpu: remove two invalid BUG_ON()s
    d2d95c0ea62d riscv: acpi: avoid errors caused by probing DT devices when ACPI is used
    3537f1a373f3 RISC-V: clear hot-unplugged cores from all task mm_cpumasks to avoid rfence errors
    b38ec49edfcb riscv: Build loader.bin exclusively for Canaan K210
    39ddffc6c023 compiler_types: Move unused static inline functions warning to W=2
    df512b40e360 arm64: kprobes: check the return value of set_memory_rox()
    008d3b0f09ac drm/xe: Do clean shutdown also when using flr
    006a41c9351b drm/xe: Move declarations under conditional branch
    35959ab7d16b drm/xe/guc: Synchronize Dead CT worker with unbind
    8c364a3a768f drm/amd: Fix suspend failure with secure display TA
    df21a2be8a47 iommufd: Make vfio_compat's unmap succeed if the range is already empty
    fbb9ccd5748b smb: client: fix refcount leak in smb2_set_path_attr
    d453865e6e1a drm/i915: Fix conversion between clock ticks and nanoseconds
    4e73066e3323 drm/i915: Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD
    2de67c9e6209 drm/mediatek: Add pm_runtime support for GCE power control

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 39ca7f3a6908fd474b558efd8bec549257a45fee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index f5eb0a3180..e225ee0679 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "33873de18361d5ae1da9d8673270f490e177da19"
-SRCREV_meta ?= "7a8d96185b9be165feb974fe6297b518f83b3b9c"
+SRCREV_machine ?= "ef33526a988ac2426ddcae4ebb216917bbe1f6b2"
+SRCREV_meta ?= "92390f2029a3ea4caa05ba35d94a4cceaa9c63bc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.58"
+LINUX_VERSION ?= "6.12.59"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 4bcf13c826..da82fc3794 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.58"
+LINUX_VERSION ?= "6.12.59"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "081aa259b8f0252bfc7999b289b79bf129893498"
-SRCREV_meta ?= "7a8d96185b9be165feb974fe6297b518f83b3b9c"
+SRCREV_machine ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
+SRCREV_meta ?= "92390f2029a3ea4caa05ba35d94a4cceaa9c63bc"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index c59046b090..4e567ae5a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "3f9921848760dfc9fd6c0a4d148e5b9d0bec64ea"
-SRCREV_machine:qemuarm64 ?= "081aa259b8f0252bfc7999b289b79bf129893498"
-SRCREV_machine:qemuloongarch64 ?= "081aa259b8f0252bfc7999b289b79bf129893498"
-SRCREV_machine:qemumips ?= "c09059f5ac654152a9cd92016df30d0c2e9eb58b"
-SRCREV_machine:qemuppc ?= "081aa259b8f0252bfc7999b289b79bf129893498"
-SRCREV_machine:qemuriscv64 ?= "081aa259b8f0252bfc7999b289b79bf129893498"
-SRCREV_machine:qemuriscv32 ?= "081aa259b8f0252bfc7999b289b79bf129893498"
-SRCREV_machine:qemux86 ?= "081aa259b8f0252bfc7999b289b79bf129893498"
-SRCREV_machine:qemux86-64 ?= "081aa259b8f0252bfc7999b289b79bf129893498"
-SRCREV_machine:qemumips64 ?= "1c91b074e875fab932bde7698d0103c5840f2e8f"
-SRCREV_machine ?= "081aa259b8f0252bfc7999b289b79bf129893498"
-SRCREV_meta ?= "7a8d96185b9be165feb974fe6297b518f83b3b9c"
+SRCREV_machine:qemuarm ?= "c2ab1a0f5d463f20b29128d22944625f68223cb9"
+SRCREV_machine:qemuarm64 ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
+SRCREV_machine:qemuloongarch64 ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
+SRCREV_machine:qemumips ?= "df0fdc232411ea220c1abcc74e6373d4b900772c"
+SRCREV_machine:qemuppc ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
+SRCREV_machine:qemuriscv64 ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
+SRCREV_machine:qemuriscv32 ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
+SRCREV_machine:qemux86 ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
+SRCREV_machine:qemux86-64 ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
+SRCREV_machine:qemumips64 ?= "c509db83e2524daf994eeb5f0dd8f6c844241d58"
+SRCREV_machine ?= "c8ff35e93d5339f8cd8db44b51119568379d0030"
+SRCREV_meta ?= "92390f2029a3ea4caa05ba35d94a4cceaa9c63bc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7475d784169c7df48b0c55525fb862e06674d63c"
+SRCREV_machine:class-devupstream ?= "d5dc97879a97b328a89ec092271faa3db9f2bff3"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.58"
+LINUX_VERSION ?= "6.12.59"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


