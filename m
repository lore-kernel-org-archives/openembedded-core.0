Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80958C5AD49
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:39:19 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.1347.1748626759059485259
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 10:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bgB5MOiG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74068f95d9fso1751335b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748626758; x=1749231558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ADds/FBfpbvbTD7wHw4ugRXnuM7amk9cJ3LksHOpwM=;
        b=bgB5MOiGC8bGBYv86Hpph+/zxWYJMfJFuQuUUR2gJrEr3Igxmg7cwF86c6WIjK1VvN
         rNnPL71VLAeTpEhzKIqButIpyJ0v++k/u6ldSshIOQv48eeY4RXMcBcYLSggcVTnubdt
         f1lyGPclYbB4krjkgDkf4Q2Ui/Q/Y7+uQzjdzcQb6srtfxjd9caXSPKn+7Y04TznbXnw
         N/qaeCoKG0Y7ayWqS9gTkH49qrhb5/TKlLMc6Dnp4/G3LDkSBuiqoOnrfZqNXAN+lvnF
         QrK7RfJjFmAhpl+flVfzBZ/rsHcgQh+4JzZtVA/HVMzXqpTBMj7esMAgP5oyOej9OJJk
         VMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626758; x=1749231558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ADds/FBfpbvbTD7wHw4ugRXnuM7amk9cJ3LksHOpwM=;
        b=KPaoYIyYgTI+9Tw6tj6UQcvPYMiozfDgt8yp7HZhxtvk1h9lR7Sv0Ej+kPG7ejIVve
         XzzNjRnhNcnKnmMZIhkOoyq9AH8J5uirBzzEsMZ4tj4UVYrar14as4gIM1pPTynYW19R
         iiQ24bwxfzGWghi3aaLkaV/dZTkK7Df0eOdFliKISHl5/cwNy85qB//bxiB6grlG1tV5
         qmhI+Mwr3c9h0zsn0qSgRPHq2SphjAJXWsgUCnNGoPLMKqs6JRBTWhSWFgSnXqWjytww
         zawPX6zVXDKZRcziKHRqb4pJcBpiYfPNQA7P48KxDMnnPhrlyr9GhEOP5c9+818oc3RU
         WnHQ==
X-Gm-Message-State: AOJu0Yxvp19m5g/A0CrsgBoOwZgCptTsVnxvJVycayV7CW1l0EHDtk9D
	QDqTxaeQt2lrzA/9tEnEN+AMeZyvTe4ENEf9s4rJ4wAge2TTiTli1a7uQart16BDIkWQrUzmY84
	twn9i
X-Gm-Gg: ASbGncsPKS2I4UhBbfVXjrK1bFK6o6KDTKUrEBk1Nzzz7Cg2eu7lES1qqxv+vif2dZQ
	/oT7c7lK8GnDmjnQHwhtVP4a4XTAnTq8aVzxDz5oErEayPhap+tMcjfDewwB/as8RQHz0bmgHHV
	BhNVPMep2bTFN99nE6Iqilricah/fte2lLITjAnXj66UY1HFXYqlUInxGwOvddQSGuElBJoDs7U
	440jFRFTa0Dlhztugzt0MtXyd7b8RI2NYrqqyGDDMRwc0jF1OMVIGDHawKkAGKpRcyGMSsZNFb+
	+JbZ0S6lCUBMHEflEPHZ1iHFncdceNfou5EqPh8F8LM=
X-Google-Smtp-Source: AGHT+IH3+70H2S8BHHAI81pRNwPCAtjXCy5ytgHXoDg2BLcD216nN/NRY/Fr6WtXj8XbwzHTP94kfQ==
X-Received: by 2002:a05:6a20:7344:b0:1f5:7ba7:69d8 with SMTP id adf61e73a8af0-21adff7dac3mr4858608637.15.1748626757985;
        Fri, 30 May 2025 10:39:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb5f40sm1554314a12.67.2025.05.30.10.39.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:39:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/12] linux-yocto/6.12: update to v6.12.28
Date: Fri, 30 May 2025 10:38:54 -0700
Message-ID: <e9ea7e773fd1f5f7defb8d14eed1ac681d212494.1748626640.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748626640.git.steve@sakoman.com>
References: <cover.1748626640.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 17:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217530

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    f08cdc6cc92e Linux 6.12.28
    db6280919765 dm: fix copying after src array boundaries
    dd329f04dda3 drm/amd/display: Fix slab-use-after-free in hdcp
    75096780a4de drm/amd/display: Add scoped mutexes for amdgpu_dm_dhcp
    e1eea6985828 drivers: base: handle module_kobject creation
    69113bf740b2 kernel: globalize lookup_or_create_module_kobject()
    3b41b5efaec0 kernel: param: rename locate_module_kobject
    7509810606b0 Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"
    e993398cbd75 arm64: dts: st: Use 128kB size for aliased GIC400 register access on stm32mp25 SoCs
    aa4ea5355458 arm64: dts: st: Adjust interrupt-controller for stm32mp25 SoCs
    7ac0df4f35d4 ARM: dts: opos6ul: add ksz8081 phy properties
    a3ab5c9443d4 arm64: dts: imx95: Correct the range of PCIe app-reg region
    cc67657f636a firmware: arm_ffa: Skip Rx buffer ownership release if not acquired
    969d8beaa2e3 firmware: arm_scmi: Balance device refcount when destroying devices
    752600f1ac7e drm/xe: Ensure fixed_slice_mode gets set after ccs_mode change
    0e6325c183ab sch_ets: make est_qlen_notify() idempotent
    15fa905db22c sch_qfq: make qfq_qlen_notify() idempotent
    d06476714d28 sch_hfsc: make hfsc_qlen_notify() idempotent
    353add4cad93 sch_drr: make drr_qlen_notify() idempotent
    0a188c0e1973 sch_htb: make htb_qlen_notify() idempotent
    bccc7df3cea0 accel/ivpu: Add handling of VPU_JSM_STATUS_MVNCI_CONTEXT_VIOLATION_HW
    079d2622f8c9 accel/ivpu: Fix locking order in ivpu_job_submit
    3e3062be7d24 accel/ivpu: Abort all jobs after command queue unregister
    a39b5b6a6ea8 accel/ivpu: Update VPU FW API headers
    1ebbfee88951 accel/ivpu: Fix a typo
    a735c9205dc9 accel/ivpu: Use xa_alloc_cyclic() instead of custom function
    aaba59961d43 accel/ivpu: Make DB_ID and JOB_ID allocations incremental
    f4ae68eae950 net: Fix the devmem sock opts and msgs for parisc
    6b6cd389104c bcachefs: Remove incorrect __counted_by annotation
    dab2a13059a4 mm, slab: clean up slab->obj_exts always
    e10ec6e32b00 blk-mq: create correct map for fallback case
    1e15804c0472 net: vertexcom: mse102x: Fix RX error handling
    2e5b8eb6b42e net: vertexcom: mse102x: Add range check for CMD_RTS
    98abf8367260 net: vertexcom: mse102x: Fix LEN_MASK
    6abbffa73647 net: vertexcom: mse102x: Fix possible stuck of SPI interrupt
    7f9c3e2213ad net: hns3: defer calling ptp_clock_register()
    6a6d547a7f7c net: hns3: fixed debugfs tm_qset size
    ee2642bbae84 net: hns3: fix an interrupt residual problem
    d4cd7667311b net: hns3: store rx VLAN tag offload state for VF
    c8d788f800f8 octeon_ep: Fix host hang issue during device reboot
    bcb9d6a2229f net: fec: ERR007885 Workaround for conventional TX
    189b05f189ca net: lan743x: Fix memleak issue when GSO enabled
    8a543d825e78 ptp: ocp: Fix NULL dereference in Adva board SMA sysfs operations
    c0dba059b118 net: use sock_gen_put() when sk_state is TCP_TIME_WAIT
    a90146b73c7d bnxt_en: fix module unload sequence
    b41a49d5435e ASoC: simple-card-utils: Fix pointer check in graph_util_parse_link_direction
    9b552c84cde1 nvmet-tcp: select CONFIG_TLS from CONFIG_NVME_TARGET_TCP_TLS
    15ea0b616426 nvme-tcp: select CONFIG_TLS from CONFIG_NVME_TCP_TLS
    60331309e738 nvme-tcp: fix premature queue removal and I/O failover
    2da8fe5a1092 bnxt_en: Fix ethtool -d byte order for 32-bit values
    44807af79efd bnxt_en: Fix out-of-bound memcpy() during ethtool -w
    454a4450b026 bnxt_en: Fix coredump logic to free allocated buffer
    626af9b8e834 bnxt_en: call pci_alloc_irq_vectors() after bnxt_reserve_rings()
    aa15f389fc50 bnxt_en: Add missing skb_mark_for_recycle() in bnxt_rx_vlan()
    808a7304b5f4 bnxt_en: Fix ethtool selftest output in one of the failure cases
    e039b00ddbfe bnxt_en: Fix error handling path in bnxt_init_chip()
    9bc347854dfd ALSA: hda/realtek: Fix built-mic regression on other ASUS models
    6effe1c0fa82 net: ipv6: fix UDPv6 GSO segmentation with NAT
    dcb5a2b96113 net: dsa: felix: fix broken taprio gate states after clock jump
    317013d1ad13 net: ethernet: mtk_eth_soc: fix SER panic with 4GB+ RAM
    56b958a5b559 igc: fix lock order in igc_ptp_reset
    df1ff481fa0e idpf: protect shutdown from reset
    bf0ec3aac109 idpf: fix potential memory leak on kcalloc() failure
    d206ea768142 net: mdio: mux-meson-gxl: set reversed bit when using internal phy
    e9b65c95610a net: dlink: Correct endianness handling of led_mode
    7fc2c784dd95 drm/mipi-dbi: Fix blanking for non-16 bit formats
    d0d7c93b4b67 drm/tests: shmem: Fix memleak
    5ad0b1b55428 nvme-pci: fix queue unquiesce check on slot_reset
    226beac5605a ALSA: ump: Fix buffer overflow at UMP SysEx message conversion
    6b1355860da3 scsi: ufs: core: Remove redundant query_complete trace
    d14f88bd0f75 idpf: fix offloads support for encapsulated packets
    073791e9cfe6 ice: Check VF VSI Pointer Value in ice_vc_add_fdir_fltr()
    53bc0b55178b net_sched: qfq: Fix double list add in class with netem as child qdisc
    1f01e9f96160 net_sched: ets: Fix double list add in class with netem as child qdisc
    2e7093c7a8ab net_sched: hfsc: Fix a UAF vulnerability in class with netem as child qdisc
    26e75716b94d net_sched: drr: Fix double list add in class with netem as child qdisc
    c649b9653ed0 pds_core: remove write-after-free of client_id
    f41e27b74624 pds_core: specify auxiliary_device to be created
    1d69ab85030b pds_core: make pdsc_auxbus_dev_del() void
    aea3ca60fafb net: ethernet: mtk_eth_soc: sync mtk_clks_source_name array
    5257a0f1ec5e net: ethernet: mtk-star-emac: rearm interrupts in rx_poll only when advised
    8d40bf73fa7f net: ethernet: mtk-star-emac: fix spinlock recursion issues on rx/tx poll
    950832771e59 rtase: Modify the condition used to detect overflow in rtase_calc_time_mitigation
    4911412efda5 bnxt_en: improve TX timestamping FIFO configuration
    ddc1e64c290a octeon_ep_vf: Resolve netdevice usage count issue
    6e6325d4878c net: mscc: ocelot: delete PVID VLAN when readding it as non-PVID
    432572d53602 Bluetooth: L2CAP: copy RX timestamp to new fragments
    cfe006c8a61e Bluetooth: btintel_pcie: Add additional to checks to clear TX/RX paths
    b70b41591ec4 Bluetooth: btusb: avoid NULL pointer dereference in skb_dequeue()
    c7bd5c9ba13d Bluetooth: btintel_pcie: Avoid redundant buffer allocation
    620810ac1f7f Bluetooth: hci_conn: Fix not setting timeout for BIG Create Sync
    eb8b860e87b2 Bluetooth: hci_conn: Fix not setting conn_timeout for Broadcast Receiver
    fe81c26d2dac Bluetooth: hci_conn: Remove alloc from critical section
    3104b7d559ff ASoC: amd: acp: Fix NULL pointer deref in acp_i2s_set_tdm_slot
    92d812df3b21 accel/ivpu: Correct DCT interrupt handling
    174161d6f030 net/mlx5: E-switch, Fix error handling for enabling roce
    488ab6d41fd9 net/mlx5e: Fix lock order in mlx5e_tx_reporter_ptpsq_unhealthy_recover
    c022830c2aca net/mlx5e: TC, Continue the attr process even if encap entry is invalid
    51599d07c7de net/mlx5: E-Switch, Initialize MAC Address for Default GID
    b67fee583794 net/mlx5e: Use custom tunnel header for vxlan gbp
    65d3c570614b xsk: Fix race condition in AF_XDP generic RX path
    5cb9e07f84e5 vxlan: vnifilter: Fix unlocked deletion of default FDB entry
    ec1643d1bad1 powerpc/boot: Fix dash warning
    791a2d9e87c4 wifi: plfxlc: Remove erroneous assert in plfxlc_mac_release
    50d1982dba7b wifi: iwlwifi: fix the check for the SCRATCH register upon resume
    33bf99208825 wifi: iwlwifi: don't warn if the NIC is gone in resume
    bb0d60289965 drm/i915/pxp: fix undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'
    f7dc50604cdf ALSA: hda/realtek - Enable speaker for HP platform
    7867992c3e25 ASoC: Intel: sof_sdw: Add NULL check in asoc_sdw_rt_dmic_rtd_init()
    ae462ead8983 powerpc/boot: Check for ld-option support
    fcf36f6ed429 pinctrl: imx: Return NULL if no group is matched and found
    7f5476d80f2c book3s64/radix : Align section vmemmap start address to PAGE_SIZE
    29a4a29112c1 ASoC: soc-pcm: Fix hw_params() and DAPM widget sequence
    2029a38b6c50 ASoC: cs-amp-lib-test: Don't select SND_SOC_CS_AMP_LIB
    220395054c24 ASoC: soc-core: Stop using of_property_read_bool() for non-boolean properties
    b93e1cad05a0 drm/amd/display: Default IPS to RCG_IN_ACTIVE_IPS2_IN_OFF
    1f27a3e93b8d tracing: Fix oob write in trace_seq_to_buffer()
    962d88304c3c cpufreq: Fix setting policy limits when frequency tables are used
    573b04722907 cpufreq: Avoid using inconsistent policy->min and policy->max
    553d723e1acb smb: client: fix zero length for mkdir POSIX create context
    d5ec1d79509b ksmbd: fix use-after-free in session logoff
    e18c61671801 ksmbd: fix use-after-free in kerberos authentication
    8fb3b6c85b7e ksmbd: fix use-after-free in ksmbd_session_rpc_open
    d21175791886 platform/x86/intel-uncore-freq: Fix missing uncore sysfs during CPU hotplug
    2fcb183768e7 platform/x86/amd: pmc: Require at least 2.5 seconds between HW sleep cycles
    2e303d010722 iommu: Fix two issues in iommu_copy_struct_from_user()
    677714d779ed iommu/vt-d: Apply quirk_iommu_igfx for 8086:0044 (QM57/QS57)
    ccc50fcba362 iommu/arm-smmu-v3: Fix pgsize_bit for sva domains
    98e634aa4b5d iommu/arm-smmu-v3: Fix iommu_device_probe bug due to duplicated stream ids
    10d901a95f8e iommu/amd: Fix potential buffer overflow in parse_ivrs_acpihid
    43eb647e847d drm: Select DRM_KMS_HELPER from DRM_DEBUG_DP_MST_TOPOLOGY_REFS
    989f9c6a619b drm/amdgpu: Fix offset for HDP remap in nbio v7.11
    510aea4ef0f8 dm: always update the array size in realloc_argv on success
    af2a88817f76 dm-integrity: fix a warning on invalid table line
    f45108257280 dm-bufio: don't schedule in atomic context
    efebca597086 x86/boot/sev: Support memory acceptance in the EFI stub under SVSM
    bdb435ef9815 wifi: brcm80211: fmac: Add error handling for brcmf_usb_dl_writeimage()
    0988dd0263ad tracing: Do not take trace_event_sem in print_event_fields()
    da77a7594fe5 spi: tegra114: Don't fail set_cs_timing when delays are zero
    20a28e0ece5a mmc: renesas_sdhi: Fix error handling in renesas_sdhi_probe
    9c4ddea4973f mm/memblock: repeat setting reserved region nid if array is doubled
    eb9b72e4fe51 mm/memblock: pass size instead of end to memblock_set_node()
    f10234236095 irqchip/qcom-mpm: Prevent crash when trying to handle non-wake GPIOs
    6569501c7092 amd-xgbe: Fix to ensure dependent features are toggled with RX checksum offload
    44ee0afc9d1e perf/x86/intel: KVM: Mask PEBS_ENABLE loaded for guest with vCPU's value.
    6dcf83f50418 perf/x86/intel: Only check the group flag for X86 leader
    cf21e890f56b parisc: Fix double SIGFPE crash
    090c8714efe1 arm64: errata: Add missing sentinels to Spectre-BHB MIDR arrays
    4f4388a55019 i2c: imx-lpi2c: Fix clock count when probe defers
    833ef30f0196 EDAC/altera: Set DDR and SDMMC interrupt mask before registration
    349dac405240 EDAC/altera: Test the correct error reg offset
    b771b2017260 drm/nouveau: Fix WARN_ON in nouveau_fence_context_kill()
    f1dfc945847c drm/fdinfo: Protect against driver unbind
    d31806f14cc1 cpufreq: intel_pstate: Unchecked MSR aceess in legacy mode
    f46fd2f0249f btrfs: fix COW handling in run_delalloc_nocow()
    b80db09b614c btrfs: adjust subpage bit start based on sectorsize
    38d9ca740503 binder: fix offset calculation in debug log
    fdf0ae5e9e1e ALSA: usb-audio: Add second USB ID for Jabra Evolve 65 headset
    0aaae77be5bd ALSA: usb-audio: Add retry on -EPROTO from usb_set_interface()
    222b6685efe0 Revert "rndis_host: Flag RNDIS modems as WWAN devices"
    351378ae7bd7 Bluetooth: btusb: Add 13 USB device IDs for Qualcomm WCN785x
    78945de256ac Bluetooth: btusb: Add new VID/PID for WCN785x
    5ab19c342f80 Bluetooth: btusb: Add ID 0x2c7c:0x0130 for Qualcomm WCN785x
    c6e1913e76fb Bluetooth: btusb: Add one more ID 0x13d3:0x3623 for Qualcomm WCN785x
    8ee592df659a Bluetooth: btusb: Add one more ID 0x0489:0xe0f3 for Qualcomm WCN785x
    a9bfc823d057 Bluetooth: btusb: add Foxconn 0xe0fc for Qualcomm WCN785x
    2ee7ebed771b mips: Add '-std=gnu11' to vdso CFLAGS
    b2c792d89ac5 yaffs2: switch from readlink_copy() to vfs_readlink()
    807165b1ec1c tools/power/x86/intel-speed-select: Prefix header search path with sysroot
    e97df805b938 drm/tilcdc: Set preferred depth
    7160a4379dcc arch/arm64/configs: remove CONFIG_SM_DISPCC_8650
    6d8ac5ebe6e8 aufs6: core
    587abc1b64c4 aufs6: standalone
    1af41d30ef42 aufs6: mmap
    6ee2464d2e9d aufs6: base
    103b676505f7 aufs6: kbuild
    67281562943f qemux86: add configuration symbol to select values
    73f315ca0823 sched/isolation: really align nohz_full with rcu_nocbs
    1e4e7f8ab622 clear_warn_once: add a clear_warn_once= boot parameter
    918e7a825e8b clear_warn_once: bind a timer to written reset value
    f533f87c3758 clear_warn_once: expand debugfs to include read support
    f149ca27cba9 tools: Remove some options from CLANG_CROSS_FLAGS
    e633abe9c44e libbpf: Fix build warning on ref_ctr_off
    ec0916a4cfc1 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    03721ceb5626 perf: x86-32: explicitly include <errno.h>
    4c36c5295bb0 perf: mips64: Convert __u64 to unsigned long long
    b0200449610d perf: fix bench numa compilation
    aff0940b2212 perf: add SLANG_INC for slang.h
    ef912018d28c perf: add sgidefs.h to for mips builds
    d8860f858b87 perf: change --root to --prefix for python install
    dc38a0eee6e5 perf: add 'libperl not found' warning
    6ed51f8786da perf: force include of <stdbool.h>
    c538d4c4ac65 fat: Replace prandom_u32() with get_random_u32()
    63d94846f0c5 fat: don't use obsolete random32 call in namei_vfat
    7816667451ef FAT: Added FAT_NO_83NAME
    f81dbd60f0d5 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    771cdefba44b FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    a24784fd8f88 yaffs2: update to v6.12 folio changes
    d0a48fd46db8 yaffs2: adapt to v6.10 i_time changes
    d097e4d4115a yaffs: fix mtime/itime field access
    4411e0d49fe3 yaffs2: update VFS ctime operations to 6.6+
    1b6619086e8b yaffs2: v6.5 fixups
    25b261ee3c54 yaffs2: Fix miscalculation of devname buffer length
    5c07936a5d1c yaffs2: convert user_namespace to mnt_idmap
    55986a1284b3 yaffs2: replace bdevname call with sprintf
    6f5508f8db8f yaffs2: convert read_page -> readfolio
    fd179a5df5d5 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    c9a620dacdd1 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    78588208ed17 yaffs2: v5.12+ build fixups (not runtime tested)
    8d2dddba272c yaffs: include blkdev.h
    8c1ca9ef9712 yaffs: Fix build failure by handling inode i_version with proper atomic API
    27005cbac2ed yaffs2: v5.6 build fixups
    668211c9f9b7 yaffs2: fix memory leak when /proc/yaffs is read
    285f911dcc1c yaffs: add strict check when call yaffs_internal_read_super
    ffc2ed489ccf yaffs: repair yaffs_get_mtd_device
    6dce4b70a5e3 yaffs: Fix build failure by handling inode i_version with proper atomic API
    19f283abc5d1 yaffs2: fix memory leak in mount/umount
    04e84672b571 yaffs: Avoid setting any ACL releated xattr
    4f221d6a32e2 Yaffs:check oob size before auto selecting Yaffs1
    81f36004e56b fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    26d7a3dd0054 yaffs2: adjust to proper location of MS_RDONLY
    a7016eac4540 yaffs2: import git revision b4ce1bb (jan, 2020)
    feb240bbb91e initramfs: allow an optional wrapper script around initramfs generation
    874746eaa341 drivers: gpu: drm: msm: registers: improve reproducibility
    1d42508faee8 tools: use basename to identify file in gen-mach-types
    4b055eca593d iwlwifi: select MAC80211_LEDS conditionally
    97e20e275ac0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    6dec58319165 defconfigs: drop obselete options
    a416ccb5b6c9 linux-yocto: Handle /bin/awk issues
    7efe8a1e5158 uvesafb: provide option to specify timeout for task completion
    78d10ae07eca uvesafb: print error message when task timeout occurs
    80473b7eb8ca compiler.h: Undef before redefining __attribute_const__
    ddeff2f1a9a7 vmware: include jiffies.h
    3dcdda8912b4 Resolve jiffies wrapping about arp
    3b1507db6735 nfs: Allow default io size to be configured.
    c2fedad05f77 check console device file on fs when booting
    208d6fbada3f mount_root: clarify error messages for when no rootfs found
    dbe9454c8ea0 mconf: fix output of cflags and libraries
    7c7b224f5cce menuconfig,mconf-cfg: Allow specification of ncurses location
    b6c189c81397 modpost: mask trivial warnings
    a5cc21325ba9 kbuild: exclude meta directory from distclean processing
    361ec143c23f powerpc: serialize image targets
    605e6ccb304c arm: serialize build targets
    e94b04fcb7d2 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    44cc7f69a0a0 cpu/amd: inhibit SMP check for qemux86
    a08cb65331e6 x86_64_defconfig: Fix warnings
    8ad332ef777b mips: make current_cpu_data preempt safe
    754f05ddce3f mips: vdso: fix 'jalr $t9' crash in vdso code
    325ff78ff44d mips: Kconfig: add QEMUMIPS64 option
    99ae0eadcf11 4kc cache tlb hazard: tlbp cache coherency
    c6894c66a534 malta uhci quirks: make allowance for slow 4k(e)c
    8b52c01f3294 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    16c7629f035e drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    6b60c874cbb0 arm64: defconfig: cleanup config options
    8e44673ecd89 vexpress: Pass LOADADDR to Makefile
    f34e6805aad5 arm: ARM EABI socketcall
    94dec9b88de4 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e66e71abc373a36561522c451dd0a4222f2a7a93)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 6560175461..3daeea905c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "28fcf1f308c59515410f6a0d0bc3278d5296a3c1"
-SRCREV_meta ?= "a50ff542f8d79235030741f9e850d34768907d2d"
+SRCREV_machine ?= "25c4a5115a23de065dd0a75ad7a95cd9efe4101c"
+SRCREV_meta ?= "dbf27c65983541ec12f26dc63efa0289ff16e1e3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.27"
+LINUX_VERSION ?= "6.12.28"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index cf6014efad..755aa35da5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.27"
+LINUX_VERSION ?= "6.12.28"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_meta ?= "a50ff542f8d79235030741f9e850d34768907d2d"
+SRCREV_machine ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
+SRCREV_meta ?= "dbf27c65983541ec12f26dc63efa0289ff16e1e3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index fefed8c9c5..96272d1d3d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e1aec462165a127bd7a549f77e8e955c6d38ba79"
-SRCREV_machine:qemuarm64 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_machine:qemuloongarch64 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_machine:qemumips ?= "c8eb4283f60d76e0f0e3db984bb09e1309550604"
-SRCREV_machine:qemuppc ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_machine:qemuriscv64 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_machine:qemuriscv32 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_machine:qemux86 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_machine:qemux86-64 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_machine:qemumips64 ?= "8e88d1714f7f56efc4650cf84b86845d44c01eb1"
-SRCREV_machine ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_meta ?= "a50ff542f8d79235030741f9e850d34768907d2d"
+SRCREV_machine:qemuarm ?= "f9767e83fd62a9807a62c2f6d2733fe2f5f792fd"
+SRCREV_machine:qemuarm64 ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
+SRCREV_machine:qemuloongarch64 ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
+SRCREV_machine:qemumips ?= "53f5fd2e711999de5fef3b4c336482a900a292d7"
+SRCREV_machine:qemuppc ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
+SRCREV_machine:qemuriscv64 ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
+SRCREV_machine:qemuriscv32 ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
+SRCREV_machine:qemux86 ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
+SRCREV_machine:qemux86-64 ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
+SRCREV_machine:qemumips64 ?= "b5d3ac10319c3de37ef49e685b1379f831d355b1"
+SRCREV_machine ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
+SRCREV_meta ?= "dbf27c65983541ec12f26dc63efa0289ff16e1e3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "b801eaa96a5a2f2a8fe0b5982ffe4a1fba3c1e93"
+SRCREV_machine:class-devupstream ?= "f08cdc6cc92e3d23a05745f0f12f8caa348a27b4"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.27"
+LINUX_VERSION ?= "6.12.28"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


