Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387E9E94635
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 03:14:41 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12166.1770693274265334562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 19:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KHDAfZf4;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8ca3807494eso29443385a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 19:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770693273; x=1771298073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SafG1jtXcbQIgm64uENArlmLhNgURvOIdH+9ql461MU=;
        b=KHDAfZf4PFDWnmZ7TW/SG2oSglEaC6ecIpaKWHB1fUuOhEEpmcuGamyRwLUjE1E4qC
         QsbmshWyAAItlyLJZI+j2r6usQmaCx9A4qjy+6xlp+2AcATGrBbR4E9Ysd4KnGci/Izg
         yL+1K218UrzMl9Fk+66/z7VTcE3ypF/8BkrC1iVQ5ym5KEyyoX8TJzeJbbg1zIosW6RB
         OwJKc0tdtWxhNH8xuNFW4DzB02EZTbwShuRKGfQnptjOumqrvkfLCjTuKRLMf+mMStFM
         CsiUnHT/Do4oyuknA0ZvMe2NnAT4v6As6ChtapT/O+G/6/dpvQGclFYsAJ97bBXLKeAk
         DCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770693273; x=1771298073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SafG1jtXcbQIgm64uENArlmLhNgURvOIdH+9ql461MU=;
        b=Ryt1ZTO2tsQ1TgorDEOPD5Hp9Y+Mxa+eSuViZz/pGf7UMHKs17tAGnGDmi4rAJz4aU
         eTJPUCpUhctGvRKSAyPZTdY+Lgw7N9ttPxRepiuKBf9h11n9faUQxRm2xeOS0QZa9zka
         PFWMojlIvy6//S067YaoJ5RIooBSmgqa9s6OOc5DjsYF+2IhcUpHar5OWAcyTmcbQR2m
         NYIHcqq1UPwOHNbDr25hvg2HRlf0V/HaZpHrpKnO3cyGOAPKQ+RQfcUiNCxZYFZuX2AH
         V7vOgKzA4uqwiEtgGuBMyMd5ip2R0uZLMiBlxWmWuvqfzHbUYCo3FnQ/DvChwIfYOTUW
         4yag==
X-Gm-Message-State: AOJu0Yz+0Dyd9UIfx2i1b8/ujTqpSxawgikUKGToGwUC0mTu1Y2w//FF
	yc5AqYqRkUy1iZ83VIwQe77aXlUCUOMBPAao4RaMr3T9CZDyYruCsqzkhTaHDJDy
X-Gm-Gg: AZuq6aKIj4HHtv8Yyq7H25sgjoNFKyOhSAR+v3eMhrge1iwuutMPCVWDbdYVvaHCzVm
	cwse+aNlXLXCgT/pHZW36rcftHdVx1SHq0pVsCSUk6DmFGxqkojtEB1k+3Ee5tRQPtaGvHaQsI0
	44CyWS3RD+LtDJhYPubnjgpu2ASX2955dJjPguancJNKWUNPVF9dvKpoCyWNH1BO0Kn2IUwLWEg
	/kIqTGMG3TmE2gUNmp+43CKDV75IN2YCWsXXCCLaBPNxCnwbKQx9zkLby2GvdOU43inL/+1CGKM
	MzcUepbyhFA5n6NohlrLLdpnMy/+/N/hEvfwrWi8zypxjTzu6vBm13tCOgqs8xaX809ZERa3eXb
	2niuZIaQtEPrQa2H/rAxORSnW8aQtHFLRhyVPU6EpJb5mhi1fbhAY8r0xx8I0jnuJKcraBAIUrR
	bvdo1QPPODF8uJGAAEKDCSHbbb5k01PrMd4qCqSIAe/ScgGxIMCxZ4mj2pJQ7e7dxH+ntGChqHx
	oMoekZpiSoOnQbKyiEwbrAG12B/aqfzda/8e4xytIXJfCiquQ0HBXH6KZA=
X-Received: by 2002:a05:620a:46a1:b0:890:2e24:a543 with SMTP id af79cd13be357-8caef409d35mr1658642485a.34.1770693271872;
        Mon, 09 Feb 2026 19:14:31 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9a157f8sm955632785a.30.2026.02.09.19.14.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:14:30 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 04/07] linux-yocto/6.6: update to v6.6.118
Date: Mon,  9 Feb 2026 22:14:21 -0500
Message-ID: <20260210031424.1346685-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210031424.1346685-1-bruce.ashfield@gmail.com>
References: <20260210031424.1346685-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 03:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230838

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    4791134e4aeb Linux 6.6.118
    c602cc344b4b mptcp: fix a race in mptcp_pm_del_add_timer()
    19de79aaea33 mm/mempool: fix poisoning order>0 pages with HIGHMEM
    0d40c4ef4b4b mm/mempool: replace kmap_atomic() with kmap_local_page()
    f38b91f7aded HID: amd_sfh: Stop sensor before starting
    4948db9c9ca8 selftests: mptcp: join: endpoints: longer transfer
    378e6136b8c0 pmdomain: imx: Fix reference count leak in imx_gpc_remove
    a5958b1bcf4a pmdomain: imx-gpc: Convert to platform remove callback returning void
    ad120c08b89a pmdomain: arm: scmi: Fix genpd leak on provider registration failure
    7ea2ea68df08 ftrace: Fix BPF fexit with livepatch
    f01f9c348d76 crash: fix crashkernel resource shrink
    b3d24038eb77 wifi: cfg80211: Add missing lock in cfg80211_check_and_end_cac()
    29150018bf19 maple_tree: fix tracepoint string pointers
    bf07df375d20 uio_hv_generic: Set event for all channels on the device
    fc3139d9f4c1 KVM: arm64: Check the untrusted offset in FF-A memory share
    64332afa9f76 smb: client: fix incomplete backport in cfids_invalidation_worker()
    6917e894f86f tracing/tools: Fix incorrcet short option in usage text for --threads
    952637c5b9be net: ethernet: ti: netcp: Standardize knav_dma_open_channel to return NULL on error
    1ee10e90e160 ALSA: usb-audio: fix uac2 clock source at terminal parser
    5d604d40cd32 f2fs: compress: fix UAF of f2fs_inode_info in f2fs_free_dic
    e822e902f8e6 s390/mm: Fix __ptep_rdp() inline assembly
    4e9efe0d56e7 f2fs: compress: change the first parameter of page_array_{alloc,free} to sbi
    d0141cf6ab1f kconfig/nconf: Initialize the default locale at startup
    be46fa4de9da kconfig/mconf: Initialize the default locale at startup
    6ae0613ea6f5 net: tls: Cancel RX async resync request on rcd_delta overflow
    1bc765f0f75a selftests: net: use BASH for bareudp testing
    3ab328a0258f x86/microcode/AMD: Limit Entrysign signature checking to known generations
    5d778778b40b scsi: core: Fix a regression triggered by scsi_host_busy()
    1f8e4d6c1d20 cifs: fix typo in enable_gcm_256 module parameter
    d89ae707cfe6 bcma: don't register devices disabled in OF
    5998da5a8208 vsock: Ignore signal/timeout on connect() if already established
    7627864dc312 cifs: fix memory leak in smb3_fs_context_parse_param error path
    496d1383e441 LoongArch: Use UAPI types in ptrace UAPI header
    69e043bce09c net/mlx5: Clean up only new IRQ glue on request_irq() failure
    715d9cda646a devlink: rate: Unset parent pointer in devl_rate_nodes_destroy
    6d9f0036d21e pinctrl: s32cc: initialize gpio_pin_config::list after kmalloc()
    3b90bd8aaeb2 pinctrl: s32cc: fix uninitialized memory in s32_pinctrl_desc
    f0923011c126 net: qlogic/qede: fix potential out-of-bounds read in qede_tpa_cont() and qede_tpa_end()
    57752d523a3f kernel.h: Move ARRAY_SIZE() to a separate header
    9bbb4afff974 platform/x86/intel/speed_select_if: Convert PCIBIOS_* return codes to errnos
    3b177b2ded56 s390/ctcm: Fix double-kfree
    e2a897ad5f53 nvme-multipath: fix lockdep WARN due to partition scan work
    0b903f33c31c net: openvswitch: remove never-working support for setting nsh fields
    f8c496e20b7a net: mlxsw: linecards: fix missing error check in mlxsw_linecard_devlink_info_get()
    385fd7ec3214 net: dsa: hellcreek: fix missing error handling in LED registration
    2e78580e6e7d drm/tegra: Add call to put_pid()
    ddb483ce2136 mlxsw: spectrum: Fix memory leak in mlxsw_sp_flower_stats()
    9026f31a520d pinctrl: cirrus: Fix fwnode leak in cs42l43_pin_probe()
    a620b091c4df xfrm: Prevent locally generated packets from direct output in tunnel mode
    a2b61573e6a3 xfrm: Determine inner GSO type from packet inner protocol
    b3b27876f3be drm/amd/display: Move sleep into each retry for retrieve_link_cap()
    e688c20f088e drm/amd/display: Increase DPCD read retries
    06a79f1bffe7 drm/amdgpu: Skip emit de meta data on gfx11 with rs64 enabled
    8b57f8127086 drm/tegra: dc: Fix reference leak in tegra_dc_couple()
    642561238c98 mptcp: do not fallback when OoO is present
    8a5d1ceef950 mptcp: decouple mptcp fastclose from tcp close
    28e4d5fd731e mptcp: avoid unneeded subflow-level drops
    d019cbb455ee mptcp: fix premature close in case of fallback
    3d513efe18a9 mptcp: fix ack generation for fallback msk
    8f9ba1a99a89 mptcp: fix race condition in mptcp_schedule_work()
    fe694895d3b7 LoongArch: Don't panic if no valid cache info for PCI
    6aa22377ef27 dt-bindings: pinctrl: toshiba,visconti: Fix number of items in groups
    5ea58bb47c50 MIPS: Malta: Fix !EVA SOC-it PCI MMIO
    a6ef60898dda scsi: target: tcm_loop: Fix segfault in tcm_loop_tpg_address_show()
    b343cee5df7e scsi: sg: Do not sleep in atomic context
    33f64600a120 nvme: nvme-fc: Ensure ->ioerr_work is cancelled in nvme_fc_delete_ctrl()
    5fe335a80548 nvme: nvme-fc: move tagset removal to nvme_fc_delete_ctrl()
    7d1977b4ae5c nouveau/firmware: Add missing kfree() of nvkm_falcon_fw::boot
    d344ea1baf19 Input: pegasus-notetaker - fix potential out-of-bounds access
    ca9a08de9b29 Input: imx_sc_key - fix memory corruption on unload
    8a2d2a536c76 Input: goodix - add support for ACPI ID GDIX1003
    9cf59f4724a9 Input: cros_ec_keyb - fix an invalid memory access
    7419d8064dab Revert "drm/tegra: dsi: Clear enable register if powered by bootloader"
    00c56d55332c net: dsa: microchip: lan937x: Fix RGMII delay tuning
    ce0a3699244a be2net: pass wrb_params in case of OS2BMC
    5968bcf785c6 ata: libata-scsi: Add missing scsi_device_put() in ata_scsi_dev_rescan()
    2a494b9e6364 smb: client: introduce close_cached_dir_locked()
    b8113c1ca469 ata: libata-scsi: Fix system suspend for a security locked drive
    037cc5058964 mptcp: Fix proto fallback detection with BPF
    2ecd37dae7a6 mptcp: Disallow MPTCP subflows from sockmap
    e65f1a2807c5 exfat: check return value of sb_min_blocksize in exfat_read_boot_sector
    583990e7dcea shmem: fix tmpfs reconfiguration (remount) when noswap is set
    457376c6fbf0 mtdchar: fix integer overflow in read/write ioctls
    b146e0b085d9 mtd: rawnand: cadence: fix DMA device NULL pointer dereference
    49365455a63c HID: quirks: work around VID/PID conflict for 0x4c4a/0x4155
    6665fbd7730b timers: Fix NULL function pointer race in timer_shutdown_sync()
    1e89a1be4fe9 Linux 6.6.117
    0fdb596476c0 memcg: fix data-race KCSAN bug in rstats
    541e85e1c9c9 ACPI: HMAT: Remove register of memory node for generic target
    41ea28dc3c0c mm: memcg: optimize parent iteration in memcg_rstat_updated()
    6b97ad92d932 mm/memory-tier: fix abstract distance calculation overflow
    206a8665f9cc memory tiers: use default_dram_perf_ref_source in log message
    e2f7c76758be cachestat: do not flush stats in recency check
    1f45e5c84684 net: netpoll: ensure skb_pool list is always initialized
    03695541b334 isdn: mISDN: hfcsusb: fix memory leak in hfcsusb_probe()
    42d486d35a41 mm/secretmem: fix use-after-free race in fault handler
    46185cdfc9ed mm/truncate: unmap large folio on split failure
    7e239675ae51 mm/memory: do not populate page table entries beyond i_size
    fe601b70eac6 filemap: cap PTE range to be created to allowed zero fill in folio_map_range()
    e5dffca89b4a mm: memcg: restore subtree stats flushing
    68849411ce9e mm: workingset: move the stats flush into workingset_test_recent()
    1b201161f34b mm: memcg: make stats flushing threshold per-memcg
    b68fc4f792bb mm: memcg: move vmstats structs definition above flushing code
    68e727bdb68b mm: memcg: change flush_next_time to flush_last_time
    b283ba3ddc9f mm: memcg: add per-memcg zswap writeback stat
    2c3568736912 mm: memcg: add THP swap out info for anonymous reclaim
    57692c303132 scsi: ufs: ufs-pci: Set UFSHCD_QUIRK_PERFORM_LINK_STARTUP_ONCE for Intel ADL
    aca6f63e803e scsi: ufs: core: Add a quirk to suppress link_startup_again
    753ca4b5beff scsi: ufs: core: Add a quirk for handling broken LSDBS field in controller capabilities register
    d1f293ee8dc3 scsi: ufs: core: Add UFSHCD_QUIRK_KEYS_IN_PRDT
    aba8384b2311 scsi: ufs: core: Add fill_crypto_prdt variant op
    f108b6a34856 scsi: ufs: core: Add UFSHCD_QUIRK_BROKEN_CRYPTO_ENABLE
    bd77a15c3a8d scsi: ufs: core: fold ufshcd_clear_keyslot() into its caller
    7e3bfaaf0208 scsi: ufs: core: Add UFSHCD_QUIRK_CUSTOM_CRYPTO_PROFILE
    960dab23f6d4 net: stmmac: Fix accessing freed irq affinity_hint
    ef49378864bb f2fs: fix to avoid overflow while left shift operation
    c645693180a9 net: netpoll: fix incorrect refcount handling causing incorrect cleanup
    a3a476cb65a4 net: netpoll: flush skb pool during cleanup
    dc67d67a995e net: netpoll: Individualize the skb pool
    e9ab9dec36bb netpoll: remove netpoll_srcu
    94b01ef5186c mm, percpu: do not consider sleepable allocations atomic
    4c8a4f1d34ec iommufd: Don't overflow during division for dirty tracking
    066ee13f05fb btrfs: ensure no dirty metadata is written back for an fs with errors
    df1ad5de2197 drm/mediatek: Disable AFBC support on Mediatek DRM driver
    a299478ac16f Revert "perf dso: Add missed dso__put to dso__load_kcore"
    ee59d88353e8 selftests: mptcp: connect: trunc: read all recv data
    8b644440d16a selftests: mptcp: join: rm: set backup flag
    b78aae82ea75 selftests: mptcp: connect: fix fallback note due to OoO
    4e833774cdc2 pmdomain: samsung: plug potential memleak during probe
    22330f5f0052 btrfs: do not update last_log_commit when logging inode due to a new name
    4020f18436ea btrfs: scrub: put bio after errors in scrub_raid56_parity_stripe()
    4a351adbbd72 EDAC/altera: Use INTTEST register for Ethernet and USB SBE injection
    d58afbd05627 EDAC/altera: Handle OCRAM ECC enable after warm reset
    ca9f11fe0926 LoongArch: Use physical addresses for CSR_MERRENTRY/CSR_TLBRENTRY
    2612f0e0b8dc selftests/user_events: fix type cast for write_index packed member in perf_test
    21bedc6eeb51 x86/microcode/AMD: Add Zen5 model 0x44, stepping 0x1 minrev
    70f73dde0ad7 spi: Try to get ACPI GPIO IRQ earlier
    ca2bd7a717d5 smb: client: fix cifs_pick_channel when channel needs reconnect
    bfdcd67e0fcb crypto: hisilicon/qm - Fix device reference leak in qm_get_qos_value
    868fc62811d3 cifs: client: fix memory leak in smb3_fs_context_parse_param
    ece3b981bb66 ALSA: usb-audio: Fix potential overflow of PCM transfer buffer
    082b6b511432 mmc: sdhci-of-dwcmshc: Change DLL_STRBIN_TAPNUM_DEFAULT to 0x4
    159244b55095 mm/mm_init: fix hash table order logging in alloc_large_system_hash()
    67272c11f379 fs/proc: fix uaf in proc_readdir_de()
    ad4a84daf6f8 wifi: mac80211: reject address change while connecting
    c3cbf016a697 selftests/tracing: Run sample events to clear page cache events
    041ab9ca6e80 ipv4: route: Prevent rt_bind_exception() from rebinding stale fnhe
    c6201eb32371 LoongArch: Let {pte,pmd}_modify() record the status of _PAGE_DIRTY
    f4b4146c1cf0 LoongArch: Use correct accessor to read FWPC/MWPC
    4c49fe089661 dma-mapping: benchmark: Restore padding to ensure uABI remained consistent
    b30421bc31c0 strparser: Fix signed/unsigned mismatch bug
    5746b2a0f5eb ksmbd: close accepted socket when per-IP limit rejects connection
    142b2990e64f gcov: add support for GCC 15
    29fbb3ad4018 NFSD: free copynotify stateid in nfs4_free_ol_stateid()
    e18c368d8611 KVM: SVM: Mark VMCB_LBR dirty when MSR_IA32_DEBUGCTLMSR is updated
    79f851a65c47 HID: uclogic: Fix potential memory leak in error path
    9e8863f3fe34 ARM: dts: BCM53573: Fix address of Luxul XAP-1440's Ethernet PHY
    57473eec8080 HID: hid-ntrig: Prevent memory leak in ntrig_report_version()
    6546dd0c6ad2 ARM: dts: imx51-zii-rdu1: Fix audmux node names
    adee209bb898 arm64: dts: rockchip: Set correct pinctrl for I2S1 8ch TX on odroid-m1
    3f358a66a045 netfilter: nf_tables: reject duplicate device on updates
    dd3a38574f93 mtd: onenand: Pass correct pointer to IRQ handler
    7ce9bb0b95fc Bluetooth: hci_sync: fix double free in 'hci_discovery_filter_clear()'
    c157fa22c400 lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
    d8d79cf8c2b7 espintcp: fix skb leaks
    2e93bf719462 net: dsa: improve shutdown sequence
    ed8a77fee461 net: allow small head cache usage with large MAX_SKB_FRAGS values
    52b44d8c6534 net: fix NULL pointer dereference in l3mdev_l3_rcv
    e91ecc2e30b4 irqchip/riscv-intc: Add missing free() callback in riscv_intc_domain_ops
    64b12dca2b0a bpf: account for current allocated stack depth in widen_imprecise_scalars()
    baa61dcaa50b bpf: Add bpf_prog_run_data_pointers()
    872c04306b02 acpi/hmat: Fix lockdep warning for hmem_register_resource()
    6015ad3b210e base/node / ACPI: Enumerate node access class for 'struct access_coordinate'
    356d4d79dc18 acpi: numa: Add setting of generic port system locality attributes
    e507071185fb acpi: Break out nesting for hmat_parse_locality()
    1fec7730896f acpi: numa: Add genport target allocation to the HMAT parsing
    d0e2cbe79e5d acpi: numa: Create enum for memory_target access coordinates indexing
    994c51070c95 base/node / acpi: Change 'node_hmem_attrs' to 'access_coordinates'
    519af3fa0263 acpi, hmat: calculate abstract distance with HMAT
    7e9fa5cdcc4f acpi, hmat: refactor hmat_register_target_initiators()
    9c8ffc4f91a8 memory tiering: add abstract distance calculation algorithms management
    57f607c11296 ALSA: usb-audio: Fix NULL pointer dereference in snd_usb_mixer_controls_badd
    c2d65ce1d035 NFSv4: Fix an incorrect parameter when calling nfs4_call_sync()
    0ad6db4438ef NFS: sysfs: fix leak when nfs_client kobject add fails
    b6137b4906f4 pnfs: Set transport security policy to RPC_XPRTSEC_NONE unless using TLS
    45ea5a60adbc NFS: enable nconnect for RDMA
    275369632f6a pnfs: Fix TLS logic in _nfs4_pnfs_v4_ds_connect()
    b5de1eb5bc20 ASoC: tas2781: fix getting the wrong device number
    b5df9e06eed3 drm/vmwgfx: Validate command header size against SVGA_CMD_MAX_DATASIZE
    aaaa8531896f ASoC: codecs: va-macro: fix resource leak in probe error path
    7fd65a5f9701 ASoC: cs4271: Fix regulator leak on probe failure
    34294379ea4e regulator: fixed: fix GPIO descriptor leak on register failure
    83475ce43fa7 acpi,srat: Fix incorrect device handle check for Generic Initiator
    25d6e7663932 cifs: Fix uncached read into ITER_KVEC iterator
    581c65fd0b0e cifs: stop writeback extension when change of size is detected
    ad141380d768 Bluetooth: L2CAP: export l2cap_chan_hold for modules
    335266ea359e ACPI: CPPC: Limit perf ctrs in PCC check only to online CPUs
    4470b8bb9a8e ACPI: CPPC: Perform fast check switch only for online CPUs
    a851ebcdc2e2 ACPI: CPPC: Check _CPC validity for only the online CPUs
    f6a7808cadde hsr: Fix supervision frame sending on HSRv0
    873f985f3bdf virtio-net: fix incorrect flags recording in big mode
    14aba9bd583e net_sched: limit try_bulk_dequeue_skb() batches
    aa9f57c077f2 net/mlx5e: Fix potentially misleading debug message
    df953d41a579 net/mlx5e: Fix wraparound in rate limiting for values above 255 Gbps
    29f62b3d4466 net/mlx5e: Fix maxrate wraparound in threshold between units
    a676a296af65 net: sched: act_ife: initialize struct tc_ife to fix KMSAN kernel-infoleak
    31e4aa93e2e5 net: sched: act_connmark: initialize struct tc_ife to fix kernel leak
    a6d1bb631af9 net_sched: act_connmark: use RCU in tcf_connmark_dump()
    4cd8d755c7d4 af_unix: Initialise scc_index in unix_add_edge().
    f01f007c9cc9 wifi: mac80211: skip rate verification for not captured PSDUs
    2a5c3396f6d9 net: mdio: fix resource leak in mdiobus_register_device()
    c92dbf85627b tipc: Fix use-after-free in tipc_mon_reinit_self().
    e9800b8b77f2 net/handshake: Fix memory leak in tls_handshake_accept()
    e5afb55625ac net/smc: fix mismatch between CLC header and proposal
    ed71f801249d sctp: prevent possible shift-out-of-bounds in sctp_transport_update_rto
    a5059df18988 Bluetooth: 6lowpan: Don't hold spin lock over sleeping functions
    2a9ff4086c26 Bluetooth: 6lowpan: fix BDADDR_LE vs ADDR_LE_DEV address type confusion
    c24ac6cfe4f9 Bluetooth: 6lowpan: reset link-local header on ipv6 recv path
    1c28c1e1522c Bluetooth: btusb: reorder cleanup in btusb_disconnect to avoid UAF
    2927ff643607 Bluetooth: MGMT: cancel mesh send timer when hdev removed
    65c74343da8e net: fec: correct rx_bytes statistic for the case SHIFT16 is set
    d6f93bba3d7d selftests: net: local_termination: Wait for interfaces to come up
    8085b6cdb0e0 wifi: ath11k: zero init info->status in wmi_process_mgmt_tx_comp()
    4fbfef04d957 ASoC: max98090/91: fixed max98091 ALSA widget powering up/down
    e671f9bb9780 smb/server: fix possible refcount leak in smb2_sess_setup()
    63d8706a2c09 smb/server: fix possible memory leak in smb2_read()
    113de3341728 HID: quirks: Add ALWAYS_POLL quirk for VRS R295 steering wheel
    a74a8be2652b NFS: check if suid/sgid was cleared after a write as needed
    dad9857bbe64 HID: quirks: avoid Cooler Master MM712 dongle wakeup bug
    df712250acdd NFS4: Fix state renewals missing after boot
    1243e396148a drm/amdgpu: Fix NULL pointer dereference in VRAM logic for APU devices
    21dbe5fa22df drm/amd/pm: Disable MCLK switching on SI at high pixel clocks
    fdf2ea31ce40 riscv: acpi: avoid errors caused by probing DT devices when ACPI is used
    7a635df5ef26 RISC-V: clear hot-unplugged cores from all task mm_cpumasks to avoid rfence errors
    ea5b1db5569c compiler_types: Move unused static inline functions warning to W=2
    36bc0502c2de drm/amd: Fix suspend failure with secure display TA
    e5a4b227bc6e iommufd: Make vfio_compat's unmap succeed if the range is already empty
    d6ab7ef52aaf smb: client: fix refcount leak in smb2_set_path_attr
    c63dc33e3794 drm/i915: Fix conversion between clock ticks and nanoseconds
    3dec22bde207 drm/i915: Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD
    c6fc325d8434 selftests: netdevsim: set test timeout to 10 minutes
    885827bc1518 riscv: stacktrace: fix backtracing through exceptions
    8fa7f51d3725 drm/amd/display: Fix black screen with HDMI outputs
    f10a6f51984b drm/amdgpu: Fix function header names in amdgpu_connectors.c
    d96aa80f5f2e extcon: adc-jack: Cleanup wakeup source only if it was enabled
    3335f9054365 scsi: ufs: ufs-pci: Fix S0ix/S3 for Intel controllers
    62b013354dcf lib/crypto: curve25519-hacl64: Fix older clang KASAN workaround for GCC
    946dec89c417 virtio-net: fix received length check in big packets
    cb52d9c86d70 smb: client: fix potential UAF in smb2_close_cached_fid()
    018179e955a8 smb: client: validate change notify buffer before copy
    24bef9ca5830 x86/microcode/AMD: Add more known models to entry sign checking
    193b2c5e5443 rtc: rx8025: fix incorrect register reference
    5f7350ff2b17 Bluetooth: MGMT: Fix OOB access in parse_adv_monitor_pattern()
    70150b9443dd drm/sched: Fix deadlock in drm_sched_entity_kill_jobs_cb
    8bcadabc3c12 drm/amd/display: Enable mst when it's detected but yet to be initialized
    e70d2e1f876a tracing: Fix memory leaks in create_field_var()
    1b29b6898ed8 net: bridge: fix MST static key usage
    3b60ce334c1c net: bridge: fix use-after-free due to MST port state bypass
    5a5d2f772775 lan966x: Fix sleeping in atomic context
    8cb474cd65bf net: dsa: microchip: Fix reserved multicast address table programming
    8bf679ebbecd net/mlx5e: SHAMPO, Fix skb size check for 64K pages
    96d20e36c6df net/mlx5e: Fix return value in case of module EEPROM read error
    9b37f576d2c0 net/mlx5e: Use extack in get module eeprom by page callback
    c729f0049561 wifi: mac80211_hwsim: Limit destroy_on_close radio removal to netgroup
    7ee2eb85755d bnxt_en: Fix a possible memory leak in bnxt_ptp_init
    dd03780c29f8 net: usb: qmi_wwan: initialize MAC header offset in qmimux_rx_fixup
    2ad229bc61ba sctp: Hold sock lock while iterating over address list
    c9119f243d9c sctp: Prevent TOCTOU out-of-bounds write
    48d161b3c815 sctp: Hold RCU read lock while iterating over address list
    1ac40030b4e9 net: dsa: b53: stop reading ARL entries if search is done
    32e43d361bac net: dsa: b53: fix enabling ip multicast
    c95c731efee0 net: dsa: b53: fix resetting speed and pause on forced link
    ddf9fc39548e net: vlan: sync VLAN features with lower device
    d8a729fd4427 selftests: netdevsim: Fix ethtool-coalesce.sh fail by installing ethtool-common.sh
    f680e2eb8c21 netdevsim: add Makefile for selftests
    efad140b6284 selftests/net: use destination options instead of hop-by-hop
    28f2d15e27af selftests/net: fix GRO coalesce test and add ext header coalesce tests
    deff55caa564 selftests/net: fix out-of-order delivery of FIN in gro:tcp test
    cb5a4c715521 net: dsa: tag_brcm: legacy: fix untagged rx on unbridged ports for bcm63xx
    f44b8bbb1b7e Bluetooth: btrtl: Fix memory leak in rtlbt_parse_firmware_v2()
    779f83a91d4f Bluetooth: hci_event: validate skb length for unknown CC opcode
    59b9ed956c7d riscv: ptdump: use seq_puts() in pt_dump_seq_puts() macro
    f34ba22989da riscv: stacktrace: Disable KASAN checks for non-current tasks
    19682d62547c riscv: Improve exception and system call latency
    d4187ec26410 net: libwx: fix device bus LAN ID
    6d7567cc0bc0 Revert "wifi: ath10k: avoid unnecessary wait for service ready message"
    994ec06b7ba1 media: uvcvideo: Use heuristic to find stream entity
    85866cbd5edb ALSA: hda/realtek: Audio disappears on HP 15-fc000 after warm boot again
    ad71f31b62a4 ceph: refactor wake_up_bit() pattern of calling
    34353a0cd39b ceph: add checking of wait_for_completion_killable() return value
    068e002bc0b6 ASoC: meson: aiu-encoder-i2s: fix bit clock polarity
    32df8c333071 kbuild: uapi: Strip comments before size type check
    05a378912231 rtc: pcf2127: fix watchdog interrupt mask on pcf2131
    86df8ade88d2 fbdev: Add bounds checking in bit_putcs to fix vmalloc-out-of-bounds
    81e829f699ee tools: lib: thermal: use pkg-config to locate libnl3
    fe6d58972d3d tools: lib: thermal: don't preserve owner in install
    fa7d0c8b2350 tools bitmap: Add missing asm-generic/bitsperlong.h include
    a1a09685874e ACPI: property: Return present device nodes only on fwnode interface
    6a1e5fa2d1fd scsi: ufs: core: Include UTP error in INT_FATAL_ERRORS
    ece711f11c0d 9p: sysfs_init: don't hardcode error to ENOMEM
    4f3926f060d7 cpufreq: tegra186: Initialize all cores to max frequencies
    cdd2b67dec44 9p: fix /sys/fs/9p/caches overwriting itself
    0ab9ef66a89e NTB: epf: Allow arbitrary BAR mapping
    751734d4cc7f clk: ti: am33xx: keep WKUP_DEBUGSS_CLKCTRL enabled
    824b92e6d24a clk: at91: clk-sam9x60-pll: force write to PLL_UPDT register
    7235f9969d9e clk: at91: clk-master: Add check for divide by 3
    544f8254c1fb ARM: at91: pm: save and restore ACR during PLL disable/enable
    9f9110995873 rtc: pcf2127: clear minute/second interrupt
    30e5bbcb98a9 clk: sunxi-ng: sun6i-rtc: Add A523 specifics
    3c5e016d2328 um: Fix help message for ssl-non-raw
    c34d6dd9ab35 fs/hpfs: Fix error code for new_inode() failure in mkdir/create/mknod/symlink
    da98803bccaf btrfs: mark dirty extent range for out of bound prealloc extents
    352056b6b669 RDMA/hns: Fix wrong WQE data when QP wraps around
    d4837e720ff0 RDMA/hns: Fix the modification of max_send_sge
    bc8c9b8f6387 RDMA/irdma: Set irdma_cq cq_num field during CQ create
    d559ddd687ed RDMA/irdma: Remove unused struct irdma_cq fields
    cd7e3bb8e200 RDMA/irdma: Fix SD index calculation
    57d352e198de ACPICA: Update dsmethod.c to get rid of unused variable warning
    f1d84a3d6521 char: misc: restrict the dynamic range to exclude reserved minors
    d2993a7e98eb ima: don't clear IMA_DIGSIG flag when setting or removing non-IMA xattr
    c3e4a6de0d1f smb: client: transport: avoid reconnects triggered by pending task work
    a024cf4d9f84 ksmbd: use sock_create_kern interface to create kernel socket
    e81e6d6d99b1 ftrace: Fix softlockup in ftrace_module_enable
    e09a096104fc orangefs: fix xattr related buffer overflow...
    df7517553995 page_pool: Clamp pool size to max 16K pages
    2648c810a25f 6pack: drop redundant locking and refcounting
    e1806387c7f9 exfat: limit log print for IO error
    3a18f8ae062e ALSA: usb-audio: add mono main switch to Presonus S1824c
    799cd62cbcc3 Bluetooth: bcsp: receive data only if registered
    03371c021818 Bluetooth: SCO: Fix UAF on sco_conn_free
    c9d6e46c2fe8 Bluetooth: btusb: Check for unexpected bytes when defragmenting HCI frames
    7eab99ffe36e net: macb: avoid dealing with endianness in macb_set_hwaddr()
    deb3d014d98c net/mlx5e: Don't query FEC statistics when FEC is disabled
    2bccb8072b28 ASoC: tlv320aic3x: Fix class-D initialization for tlv320aic3007
    91a5cec5b9d6 ASoC: stm32: sai: manage context in set_sysclk callback
    93f8d67ef8b5 amd/amdkfd: resolve a race in amdgpu_amdkfd_device_fini_sw
    d932fb292f83 ext4: increase IO priority of fastcommit
    199ab7b43c5e fs: ext4: change GFP_KERNEL to GFP_NOFS to avoid deadlock
    7ec8ac9f73d4 accel/habanalabs: support mapping cb with vmalloc-backed coherent memory
    f6108a8164c4 accel/habanalabs/gaudi2: read preboot status after recovering from dirty state
    a7d72a80e24a accel/habanalabs: return ENOMEM if less than requested pages were pinned
    193e269df045 scsi: mpt3sas: Add support for 22.5 Gbps SAS link rate
    88d6a9ea0688 accel/habanalabs/gaudi2: fix BMON disable configuration
    e30995ccd9b8 scsi: libfc: Fix potential buffer overflow in fc_ct_ms_fill()
    31116de5ee11 net: bridge: Install FDB for bridge MAC on VLAN 0
    eacfd08b26a0 nfs4_setup_readdir(): insufficient locking for ->d_parent->d_inode dereferencing
    e30618333212 NFSv4.1: fix mount hang after CREATE_SESSION failure
    4e2f5f7e07f9 NFSv4: handle ERR_GRACE on delegation recalls
    1b65fb8723ed drm/amd/display: Add AVI infoframe copy in copy_stream_update_to_stream
    7f097986b342 wifi: ath12k: Increase DP_REO_CMD_RING_SIZE to 256
    a5cb7c982210 remoteproc: qcom: q6v5: Avoid handling handover twice
    221952c07b58 PCI/PM: Skip resuming to D0 if device is disconnected
    b679c74e5598 vfio: return -ENOTTY for unsupported device feature
    5561974e62e0 sparc64: fix prototypes of reads[bwl]()
    d170582b4bd4 sparc/module: Add R_SPARC_UA64 relocation handling
    1810b2fd7375 PCI: cadence: Check for the existence of cdns_pcie::ops before using it
    0b02dc2b4e78 r8169: set EEE speed down ratio to 1
    4e21e047a25c net: intel: fm10k: Fix parameter idx set but not used
    c9e7bb702b80 wifi: ath10k: Fix connection after GTK rekeying
    df0a0f229f73 iommu/vt-d: Replace snprintf with scnprintf in dmar_latency_snapshot()
    4cacebe3dca9 net: ethernet: microchip: sparx5: make it selectable for ARCH_LAN969X
    855cd3a0c4d5 net: phy: clear link parameters on admin link down
    c5fa9fed6272 ASoC: qcom: sc8280xp: explicitly set S16LE format in sc8280xp_be_hw_params_fixup()
    2a9575a37218 jfs: fix uninitialized waitqueue in transaction manager
    ce054a366c54 jfs: Verify inode mode when loading from disk
    ec2b3f83b4c8 ipv6: np->rxpmtu race annotation
    765f8816d395 f2fs: fix infinite loop in __insert_extent_tree()
    97e01c389402 usb: xhci: plat: Facilitate using autosuspend for xhci plat devices
    8b21ba5da050 usb: mon: Increase BUFF_MAX to 64 MiB to support multi-MB URBs
    2611313d3bf4 allow finish_no_open(file, ERR_PTR(-E...))
    3c0725aceb14 scsi: lpfc: Define size of debugfs entry for xri rebalancing
    1169f4f03fb1 scsi: lpfc: Remove ndlp kref decrement clause for F_Port_Ctrl in lpfc_cleanup
    a0eb7e8f8266 scsi: lpfc: Check return status of lpfc_reset_flush_io_context during TGT_RESET
    88ac95b17a03 scsi: ufs: core: Disable timestamp functionality if not supported
    58b8f44a64ed selftests/Makefile: include $(INSTALL_DEP_TARGETS) in clean target to clean net/lib dependency
    0df3da8888fa drm/amdgpu: reject gang submissions under SRIOV
    a7efc2b0359c HID: i2c-hid: Resolve touchpad issues on Dell systems during S4
    0d0be8117eda ethernet: Extend device_get_mac_address() to use NVMEM
    7613c06ffa89 page_pool: always add GFP_NOWARN for ATOMIC allocations
    fe3f8b671618 drm/amd/display: Disable VRR on DCE 6
    ced20843717e drm/amd/display: Fix DVI-D/HDMI adapters
    eeb8ea76c912 drm/amd: Avoid evicting resources at S5
    19618f480cda drm/amdgpu: Use memdup_array_user in amdgpu_cs_wait_fences_ioctl
    a8a9f053e1d4 ALSA: serial-generic: remove shared static buffer
    59efb432c318 wifi: mt76: mt7996: Temporarily disable EPCS
    bf0b265fcb95 wifi: mt76: mt7921: Add 160MHz beamformee capability for mt7922 device
    81f9b19af302 net/cls_cgroup: Fix task_get_classid() during qdisc run
    160b03e57e62 crypto: caam - double the entropy delay interval for retry
    01be9fad74e4 PCI: dwc: Verify the single eDMA IRQ in dw_pcie_edma_irq_verify()
    27598de36043 crypto: sun8i-ce - remove channel timeout field
    a3d9de6ac510 watchdog: s3c2410_wdt: Fix max_timeout being calculated larger
    705c5a2f5517 HID: asus: add Z13 folio to generic group for multitouch to work
    c018a87942bf udp_tunnel: use netdev_warn() instead of netdev_WARN()
    ee957d6c0886 selftests: Replace sleep with slowwait
    518319c98097 eth: 8139too: Make 8139TOO_PIO depend on !NO_IOPORT_MAP
    c85be890e057 selftests: Disable dad for ipv6 in fcnal-test.sh
    2ddd6bf6b671 x86/kvm: Prefer native qspinlock for dedicated vCPUs irrespective of PV_UNHALT
    1a6ffaeddf76 netfilter: nf_reject: don't reply to icmp error messages
    b94b57fd7eb9 selftests: traceroute: Use require_command()
    5df7e8bc4d23 media: redrat3: use int type to store negative error codes
    d15b3e4107b4 selftests: net: replace sleeps in fcnal-test with waits
    f5781438ba04 net: sh_eth: Disable WoL if system can not suspend
    cedcc490241b phy: rockchip: phy-rockchip-inno-csidphy: allow writes to grf register 0
    f0cc4b6c443a phy: renesas: r8a779f0-ether-serdes: add new step added to latest datasheet
    cf6781d97c69 phy: cadence: cdns-dphy: Enable lower resolutions in dphy
    9406ec01a077 wifi: mac80211: Fix HE capabilities element check
    17249b2a6527 ntfs3: pretend $Extend records as regular files
    b96d08ce3f72 scsi: ufs: host: mediatek: Disable auto-hibern8 during power mode changes
    30220dda83f8 net: phy: marvell: Fix 88e1510 downshift counter errata
    5122665ca5f3 scsi: ufs: host: mediatek: Enhance recovery on hibernation exit failure
    8fefca6a12e6 scsi: ufs: host: mediatek: Enhance recovery on resume failure
    5bde774bbfbf media: i2c: og01a1b: Specify monochrome media bus format instead of Bayer
    f32fe18efc95 media: ov08x40: Fix the horizontal flip control
    81015dd217a4 char: Use list_del_init() in misc_deregister() to reinitialize list pointer
    d89343fce39a drm/msm: make sure to not queue up recovery more than once
    ea37884097a0 usb: cdns3: gadget: Use-after-free during failed initialization and exit of cdnsp gadget
    38c179c52d22 usb: gadget: f_hid: Fix zero length packet transfer
    3c66bc0acc08 drm/amdgpu: add support for cyan skillfish gpu_info
    65240044398e drm/amdgpu: don't enable SMU on cyan skillfish
    b17fe7f5a2de drm/amd: add more cyan skillfish PCI ids
    aa98b4c1f84c iommu/apple-dart: Clear stream error indicator bits for T8110 DARTs
    44a764aec64b iommu/amd: Skip enabling command/event buffers for kdump
    a5c425011c31 smsc911x: add second read of EEPROM mac when possible corruption seen
    170bd191fa6c net: call cond_resched() less often in __release_sock()
    194a056bdc6f ALSA: usb-audio: apply quirk for MOONDROP Quark2
    56384ec84c15 media: verisilicon: Explicitly disable selection api ioctls for decoders
    98dfcb4c287b media: adv7180: Only validate format in querystd
    20e3fe278b2f media: adv7180: Do not write format to device in set_fmt
    f195ac1e3542 media: adv7180: Add missing lock in suspend callback
    7ad7e582de8e net: nfc: nci: Increase NCI_DATA_TIMEOUT to 3000 ms
    7816b60922c8 ipv6: Add sanity checks on ipv6_devconf.rpl_seg_enabled
    2412c6aa42fc drm/amdgpu: Allow kfd CRIU with no buffer objects
    0d629175a7ee drm/msm/dsi/phy_7nm: Fix missing initial VCO rate
    b093c81df23f drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
    196a75590f40 dmaengine: dw-edma: Set status for callback_result
    269d69a50f21 dmaengine: mv_xor: match alloc_wc and free_wc
    bb434f67b46b dmaengine: sh: setup_xref error handling
    a3eebe03da5f ptp: Limit time setting of PTP clocks
    ffdcbb30d3cd scsi: pm8001: Use int instead of u32 to store error codes
    c1751c5fdddf crypto: qat - use kcalloc() in qat_uclo_map_objs_from_mof()
    49d9ac3af3a1 mips: lantiq: danube: rename stp node on EASY50712 reference board
    e20d0efe03ea mips: lantiq: xway: sysctrl: rename stp clock
    98654c8434c6 mips: lantiq: danube: add missing device_type in pci node
    ae51686278ce mips: lantiq: danube: add model to EASY50712 dts
    6c7de5a8957f mips: lantiq: danube: add missing properties to cpu node
    f589021c3347 drm/amdgpu: Respect max pixel clock for HDMI and DVI-D (v2)
    1a91de0fdbdf media: fix uninitialized symbol warnings
    3e283f38792e drm/amdkfd: Tie UNMAP_LATENCY to queue_preemption
    1de2e48b1f33 drm/amdkfd: fix vram allocation failure for a special case
    a7953bf98522 fuse: zero initialize inode private data
    bb9b505f02e2 net: phy: fixed_phy: let fixed_phy_unregister free the phy_device
    4aa5acd88fb4 remoteproc: wkup_m3: Use devm_pm_runtime_enable() helper
    742f354124aa extcon: adc-jack: Fix wakeup source leaks on device unbind
    22c24c7c5e81 scsi: pm80xx: Fix race condition caused by static variables
    bbfe60eba369 scsi: mpi3mr: Fix controller init failure on fault during queue creation
    df64a4d69d3d rds: Fix endianness annotation for RDS_MPATH_HASH
    dcaec33d8deb ALSA: usb-audio: Add validation of UAC2/UAC3 effect units
    31014c39d6d7 PCI/P2PDMA: Fix incorrect pointer usage in devm_kfree() call
    9b8dfaea5cea net: Call trace_sock_exceed_buf_limit() for memcg failure with SK_MEM_RECV.
    63fbe0e64132 net: stmmac: Correctly handle Rx checksum offload errors
    c1d2b289b9fc net: When removing nexthops, don't call synchronize_net if it is not necessary
    7d4ad49ba0c1 char: misc: Does not request module for miscdevice with dynamic minor
    4a61f3eb8913 char: misc: Make misc_register() reentry for miscdevice who wants dynamic minor
    9001552e105f usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
    9e2c2d3e7209 iio: adc: imx93_adc: load calibrated values even calibration failed
    8bbda8e00cde iio: adc: spear_adc: mask SPEAR_ADC_STATUS channel and avg sample before setting register
    fdd587be5936 drm/amdkfd: Handle lack of READ permissions in SVM mapping
    2b5128caee83 drm/bridge: display-connector: don't set OP_DETECT for DisplayPorts
    8231e8011846 media: imon: make send_packet() more robust
    f28dde240160 net: ipv6: fix field-spanning memcpy warning in AH output
    b34fc4fe9a85 scsi: ufs: host: mediatek: Fix invalid access in vccqx handling
    2d5551640dde scsi: ufs: host: mediatek: Change reset sequence for improved stability
    83a26fa18d47 scsi: ufs: host: mediatek: Assign power mode userdata before FASTAUTO mode change
    137dea7d7d00 scsi: ufs: host: mediatek: Fix auto-hibern8 timer configuration
    68245d8fe2fa bridge: Redirect to backup port when port is administratively down
    86e4faf48539 s390/pci: Use pci_uevent_ers() in PCI recovery
    8a54de9609d8 powerpc/eeh: Use result of error_detected() in uevent
    74e9ec803b6d thunderbolt: Use is_pciehp instead of is_hotplug_bridge
    7d87c41061e8 ice: Don't use %pK through printk or tracepoints
    bbfcf5db8c08 net: stmmac: Check stmmac_hw_setup() in stmmac_resume()
    7a500e923127 x86/vsyscall: Do not require X86_PF_INSTR to emulate vsyscall
    79a27f405d02 media: i2c: Kconfig: Ensure a dependency on HAVE_CLK for VIDEO_CAMERA_SENSOR
    07f3f65682a9 drm/tidss: Set crtc modesetting parameters with adjusted mode
    1f950a449a4d drm/bridge: cdns-dsi: Don't fail on MIPI_DSI_MODE_VIDEO_BURST
    be9fc98a4198 drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
    105ed683b400 drm/tidss: Use the crtc_* timings when programming the HW
    3f964091abb0 media: amphion: Delete v4l2_fh synchronously in .release()
    48bb7f8ab984 media: pci: ivtv: Don't create fake v4l2_fh
    b567d1c40c70 drm/amdkfd: return -ENOTTY for unsupported IOCTLs
    153353da60d0 wifi: rtw88: sdio: use indirect IO for device registers before power-on
    da9d28d79342 selftests/net: Ensure assert() triggers in psock_tpacket.c
    517abdc57cfb selftests/net: Replace non-standard __WORDSIZE with sizeof(long) * 8
    d7f4354d3de9 PCI: Disable MSI on RDC PCI to PCIe bridges
    ce054c331334 drm/nouveau: replace snprintf() with scnprintf() in nvkm_snprintbf()
    cb02acebd3d0 drm/amdgpu/jpeg: Hold pg_lock before jpeg poweroff
    a0a44b1e0873 drm/amd/pm: Use cached metrics data on arcturus
    d4b2c3a3bc01 drm/amd/pm: Use cached metrics data on aldebaran
    f17f0100f702 drm/amd/display: update dpp/disp clock from smu clock table
    8c05069ce157 drm/amd/display: add more cyan skillfish devices
    2728e38ac27e drm/amd/display: Increase AUX Intra-Hop Done Max Wait Duration
    acb3c23080ca drm/amd/display: ensure committing streams is seamless
    f6bea0255090 mfd: da9063: Split chip variant reading in two bus transactions
    830c39871f16 mfd: madera: Work around false-positive -Wininitialized warning
    d9e793728021 mfd: stmpe-i2c: Add missing MODULE_LICENSE
    784f62e68a6c mfd: stmpe: Remove IRQ domain upon removal
    5ebb9bc9a662 tools/power x86_energy_perf_policy: Prefer driver HWP limits
    941ac2bcb1ac tools/power x86_energy_perf_policy: Enhance HWP enable
    91d267901aab tools/power x86_energy_perf_policy: Fix incorrect fopen mode usage
    5b69364cbef1 tools/cpupower: Fix incorrect size in cpuidle_state_disable()
    efa623350136 hwmon: (dell-smm) Add support for Dell OptiPlex 7040
    52d4d91db6f8 hwmon: (asus-ec-sensors) increase timeout for locking ACPI mutex
    1721c2938d00 uprobe: Do not emulate/sstep original instruction when ip is changed
    1a8ca4b9b3e3 nvme: Use non zero KATO for persistent discovery connections
    9c55db583707 bpf: Clear pfmemalloc flag when freeing all fragments
    d8d03481351e riscv: bpf: Fix uninitialized symbol 'retval_off'
    e1729523759c blk-cgroup: fix possible deadlock while configuring policy
    8613bed1f283 clocksource/drivers/vf-pit: Replace raw_readl/writel to readl/writel
    f3c6ae35a7e8 spi: rpc-if: Add resume support for RZ/G3E
    4aced32596ea futex: Don't leak robust_list pointer on exec race
    b8961542d2ae cpuidle: Fail cpuidle device registration if there is one already
    4b78d57b7dd3 bpftool: Fix -Wuninitialized-const-pointer warnings with clang >= 21
    c77fcb6cc6f0 power: supply: qcom_battmgr: handle charging state change notifications
    877d4689e546 pmdomain: apple: Add "apple,t8103-pmgr-pwrstate"
    5aeb8550e8c3 tools/cpupower: fix error return value in cpupower_write_sysfs()
    7d0e0563256f video: backlight: lp855x_bl: Set correct EPROM start for LP8556
    edf3b828871d bpf: Do not limit bpf_cgroup_from_id to current's namespace
    25f4bf1f7979 nvme-fc: use lock accessing port_state and rport state
    601ed47b2363 nvmet-fc: avoid scheduling association deletion twice
    5ca9367da5be tee: allow a driver to allocate a tee_device without a pool
    12296895e962 ACPICA: dispatcher: Use acpi_ds_clear_operands() in acpi_ds_call_control_method()
    8c1c0ac31949 mmc: sdhci-msm: Enable tuning for SDR50 mode for SD card
    46fc8ad19ce9 ARM: tegra: transformer-20: fix audio-codec interrupt
    0c9a3917a61e ARM: tegra: transformer-20: add missing magnetometer interrupt
    ca7c230fff41 soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups
    c7117d25e3db arm64: zynqmp: Revert usb node drive strength and slew rate for zcu106
    e60b141dfc93 irqchip/loongson-pch-lpc: Use legacy domain for PCH-LPC IRQ controller
    552659030ab8 hwmon: sy7636a: add alias
    8161d9b78915 power: supply: sbs-charger: Support multiple devices
    0babd39ceb5d pinctrl: keembay: release allocated memory in detach path
    4f8d061ac497 hwmon: (sbtsi_temp) AMD CPU extended temperature range support
    5617c8165cf5 hwmon: (k10temp) Add device ID for Strix Halo
    44729682b694 hwmon: (k10temp) Add thermal support for AMD Family 1Ah-based models
    3c4c5184631a power: supply: qcom_battmgr: add OOI chemistry
    dcba7b98dcb7 ACPI: scan: Add Intel CVS ACPI HIDs to acpi_ignore_dep_ids[]
    338f490a04c6 ACPI: PRM: Skip handlers with NULL handler_address or NULL VA
    3e121479021d irqchip/gic-v2m: Handle Multiple MSI base IRQ Alignment
    fea338c7e46f selftests/bpf: Upon failures, exit with code 1 in test_xsk.sh
    233317cc29dd arc: Fix __fls() const-foldability via __builtin_clzl()
    8d6791c480f2 cpufreq/longhaul: handle NULL policy in longhaul_exit
    854241f8e4ff selftests/bpf: Fix bpf_prog_detach2 usage in test_lirc_mode2
    d45325fc6a73 irqchip/sifive-plic: Respect mask state when setting affinity
    0f7149ac7691 memstick: Add timeout to prevent indefinite waiting
    4cfc3b63ea09 mmc: host: renesas_sdhi: Fix the actual clock
    fa7c118e0b83 pinctrl: single: fix bias pull up/down handling in pin_config_set
    667789d3e29f bpf: Don't use %pK through printk
    8c8f8f7f84e8 spi: loopback-test: Don't use %pK through printk
    3f274df8526e soc: qcom: smem: Fix endian-unaware access of num_entries
    2a0db48dd8c2 soc: aspeed: socinfo: Add AST27xx silicon IDs
    fc1141a530df usb: gadget: f_fs: Fix epfile null pointer access after ep enable.
    b63c061be622 s390/pci: Avoid deadlock between PCI error recovery and mlx5 crdump
    b61ed8005bd3 drm/sysfb: Do not dereference NULL pointer in plane reset
    b5493968ac7a drm/sched: Fix race in drm_sched_entity_select_rq()
    7088465f1081 s390: Disable ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
    a2ae01c674e1 sched/fair: Use all little CPUs for CPU-bound workloads
    4ced68c43a15 sched/pelt: Avoid underestimation of task utilization
    fe04654ecb65 net: phy: dp83867: Disable EEE support as not implemented
    a60be7339353 cpuidle: governors: menu: Select polling state in some more cases
    58c347aa881d cpuidle: governors: menu: Rearrange main loop in menu_select()
    6e43d5f0e593 s390/pci: Restore IRQ unconditionally for the zPCI device
    49888b3b457b mptcp: fix MSG_PEEK stream corruption
    a5a896f8315d drm/mediatek: Fix device use-after-free on unbind
    2664bfd8969d regmap: slimbus: fix bus_context pointer in regmap init calls
    482b568e8680 block: make REQ_OP_ZONE_OPEN a write operation
    37089e2258d6 block: fix op_is_zone_mgmt() to handle REQ_OP_ZONE_RESET_ALL
    02a16148f842 drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Iceland
    e69d5d11ed0c drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Fiji
    224932faac5c drm/amd/pm: fix smu table id bound check issue in smu_cmn_update_table()
    ca5dc7ef4c1a sfc: fix potential memory leak in efx_mae_process_mport()
    25191342d576 net: hns3: return error code when function fails
    1cd109318d69 drm/etnaviv: fix flush sequence logic
    83312609ff32 Bluetooth: hci_core: Fix tracking of periodic advertisement
    e3ba2b1f7d1a Bluetooth: ISO: Fix another instance of dst_type handling
    48d31ac5af5f Bluetooth: HCI: Fix tracking of advertisement set/instance 0x00
    504554dbcbb4 Bluetooth: btmtksdio: Add pmctrl handling for BT closed state during reset
    932c0a4f77ac Bluetooth: hci_sync: fix race in hci_cmd_sync_dequeue_once
    9a579d6a3951 usbnet: Prevents free active kevent
    5d8f28a8b50e libbpf: Fix powerpc's stack register definition in bpf_tracing.h
    2e97da83839f ASoC: fsl_sai: fix bit order for DSD format
    06d711b4d620 ASoC: Intel: avs: Unprepare a stream when XRUN occurs
    0dd6474ced33 crypto: aspeed - fix double free caused by devm
    8e8bcd7b2925 crypto: aspeed-acry - Convert to platform remove callback returning void
    42f848f8e5ea bpf: Do not audit capability check in do_jit()
    5b81a79bada2 scsi: ufs: core: Initialize value of an attribute returned by uic cmd
    645114110354 bpf: Sync pending IRQ work before freeing ring buffer
    c898547ed64e ALSA: usb-audio: fix control pipe direction
    431da7f85430 drm/msm/a6xx: Fix GMU firmware parser
    ad5852941409 wifi: ath12k: free skb during idr cleanup callback
    0ec88db40ce0 wifi: ath11k: Add missing platform IDs for quirk table
    b8850b4370fa wifi: ath10k: Fix memory leak on unsupported WMI command
    1811c610653c x86/fpu: Ensure XFD state on signal delivery
    939c4e33005e smb: client: fix potential cfid UAF in smb2_query_info_compound
    6dbd3d9573e1 ASoC: qdsp6: q6asm: do not sleep while atomic
    aa826b05c68f mptcp: restore window probe
    f7e5fc50791b mptcp: drop bogus optimization in __mptcp_check_push()
    4a28d1898392 fbdev: valkyriefb: Fix reference count leak in valkyriefb_init
    e097cdbac72e fbdev: pvr2fb: Fix leftover reference to ONCHIP_NR_DMA_CHANNELS
    64e3175d1c8a wifi: brcmfmac: fix crash while sending Action Frames in standalone AP Mode
    e059b0560040 Bluetooth: rfcomm: fix modem control handling
    9ba1a7802ca9 fbdev: bitblit: bound-check glyph index in bit_putcs*
    e992faffa846 ACPI: button: Call input_free_device() on failing input device registration
    4e85246ec0d0 ACPI: video: Fix use-after-free in acpi_video_switch_brightness()
    3fe5494db5fe fbdev: atyfb: Check if pll_ops->init_pll failed
    468f78276a37 fbcon: Set fb_display[i]->mode to NULL when the mode is released
    814a55f44d8a net: usb: asix_devices: Check return value of usbnet_get_endpoints
    03524ccff698 NFSD: Fix crash in nfsd4_read_release()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 55ab56e288..728248ddd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a40e6c13f556fd1b07f6a9e21137b47964d897af"
-SRCREV_meta ?= "9f0c7a1604548bd736f348d3fae281f2d726d6a8"
+SRCREV_machine ?= "7996419eca2192a1b3bc01cb208f6dcb865b7a9f"
+SRCREV_meta ?= "3adceb388e86d1b704d8153af1d734877529085d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.116"
+LINUX_VERSION ?= "6.6.118"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 1456d96411..597514b6de 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.116"
+LINUX_VERSION ?= "6.6.118"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "daacc64fc40b3e47e2d4164ceb1b51a05af73844"
-SRCREV_meta ?= "9f0c7a1604548bd736f348d3fae281f2d726d6a8"
+SRCREV_machine ?= "67f8fd8eb1517d2e7bf208eaaac4c9ef154e033b"
+SRCREV_meta ?= "3adceb388e86d1b704d8153af1d734877529085d"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index be92663eb1..164d7a2900 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ca0cf34ac378d033a31bd92282d92d3e6f1f6c5a"
-SRCREV_machine:qemuarm64 ?= "698c863fb39998ee9f2f590ff9626ca34cf3a9d1"
-SRCREV_machine:qemuloongarch64 ?= "f9b3617edd37432584510131383ee97a6eb889b5"
-SRCREV_machine:qemumips ?= "fbdfcd56de6c092d0c62e0529231bb41663a7e02"
-SRCREV_machine:qemuppc ?= "7560c9897677e1722452733c7b34e651bcaee399"
-SRCREV_machine:qemuriscv64 ?= "f9b3617edd37432584510131383ee97a6eb889b5"
-SRCREV_machine:qemuriscv32 ?= "f9b3617edd37432584510131383ee97a6eb889b5"
-SRCREV_machine:qemux86 ?= "f9b3617edd37432584510131383ee97a6eb889b5"
-SRCREV_machine:qemux86-64 ?= "f9b3617edd37432584510131383ee97a6eb889b5"
-SRCREV_machine:qemumips64 ?= "5f40729e5eb8c999e2d6f7dc592c2869a36f0169"
-SRCREV_machine ?= "f9b3617edd37432584510131383ee97a6eb889b5"
-SRCREV_meta ?= "9f0c7a1604548bd736f348d3fae281f2d726d6a8"
+SRCREV_machine:qemuarm ?= "87089959e10eff2029fb1599fb91e139f7795aa6"
+SRCREV_machine:qemuarm64 ?= "a0c244da87b0489c12507623d182990045ba9e5b"
+SRCREV_machine:qemuloongarch64 ?= "5e24848d4268396bf9c200a52e13dbb22a23ca5f"
+SRCREV_machine:qemumips ?= "72eca83031d5c13e691b19473f82c74d127bcec5"
+SRCREV_machine:qemuppc ?= "326405ca4807b73ae60685781b5595ca8bc73a2d"
+SRCREV_machine:qemuriscv64 ?= "5e24848d4268396bf9c200a52e13dbb22a23ca5f"
+SRCREV_machine:qemuriscv32 ?= "5e24848d4268396bf9c200a52e13dbb22a23ca5f"
+SRCREV_machine:qemux86 ?= "5e24848d4268396bf9c200a52e13dbb22a23ca5f"
+SRCREV_machine:qemux86-64 ?= "5e24848d4268396bf9c200a52e13dbb22a23ca5f"
+SRCREV_machine:qemumips64 ?= "d23ab2b90ba9b7f29a117c054998fb967fe001ad"
+SRCREV_machine ?= "5e24848d4268396bf9c200a52e13dbb22a23ca5f"
+SRCREV_meta ?= "3adceb388e86d1b704d8153af1d734877529085d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0a805b6ea8cda0caa268b396a2e5117f3772d849"
+SRCREV_machine:class-devupstream ?= "4791134e4aebe300af2b409dc550610ef69fae3e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.116"
+LINUX_VERSION ?= "6.6.118"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


