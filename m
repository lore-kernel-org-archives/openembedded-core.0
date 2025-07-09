Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67293C83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:45 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.18579.1752074380358010240
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 08:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BrOPRAGv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3141b84bf65so96094a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752074379; x=1752679179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wcfa2nGwbbtaI7wnik1JWU/+VekY/HOwIe18lzPDGo8=;
        b=BrOPRAGvIIYX2It5CH1P4xe/eNul55dEgAma941IkiLpsNtQsfUz4xH2jres422WTE
         gNQaxXI22ywtlAvIviAePyFg5yV2s9hZEfjwxkc2OW/+a5BkJSvW05+0IzjyGiPYLW8R
         8GZbb+vIQNbzzMaqxZHJG5yaTMDIitTbQqevIgqQOz5vEn3xUcOyK4v2hJz8Qxup74Y7
         mMNbi02gI2VRUU696abrny1DQFvr+xIQEIWHvSwgnToPU9kFwbQbBCGLPMfNv3wklkbm
         tAXFJgl7kY3gDbg3ObKi4PX4Jg1y4bTBAC+0wqFLL1sf1yHrFpA95Ht0JU0JUoE0Wcnx
         wzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074379; x=1752679179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wcfa2nGwbbtaI7wnik1JWU/+VekY/HOwIe18lzPDGo8=;
        b=enVDwt8wIVD2QoFYG4GIynEpYrEXEBTRkrrQcBnXNdvUqZ4AB26q3DlQbytwuBrwRy
         yS0WiP+Hx9TmHVZFuBK8bF6Xy7YsCSu/mmd10mA+EyuyrCDwnd1uAIE8oIeh/Ti4JfEM
         HXtGgEvVIctMuxr95gdnTxSdvy0kV+vNPvDeX6IZztAZ2Ajd+0BRxTsD6TSSidw4+byt
         TQOX6Yrj2HJpBD+mHMEnRLKseSQd9QoXprSBik9QG14t9CoSjKdrTXj5b42w5AlTJlg+
         7FF+p6oP78A5gSNzS16jvbZd7Mnj3owzM2bfuOK9sD6afsihZlFoDtG+zx5yIbZtjw33
         UN+A==
X-Gm-Message-State: AOJu0YyT8BynLVRk6HR6H0PIBcay0Lt5yc2pQYVKGUarH+YGa+qvJV59
	v4OHopFqgkZASX/Qlq+zVyOQMmwsrnp7MjQ8zqrJ8Mc+5pZuKuRGn7QHUgPFQuBO4WBnmzh0Rs4
	MYMCp
X-Gm-Gg: ASbGncuPCgHzQDHMcgwk9LH/dOZJDkmZ/f1s8u+0AAP9jB58G4/6pxSpynxxm7QFFzi
	jNInYYmeYhEfJBpnYZO0k2zgl4swI3nRm/fnnKW3gZ6NunxD3IAznNxyLJgEuS7A3pBurKIPzn7
	CQHG5sKXnAvFbDwaPtbcx9YOiBQlJx/kNmrhCNxi/btd4//8C46BGkH97SdmkdDpXXNizK/Ttuy
	/hy6387QsEa/XqvMC4rBqihJNdrOwd9FTCT5kf1WnDvLArVuiEvvefsc82yomNfcpR1LQmZwU4q
	B1ajFZ0MrzMcQVGtXlYZEmjPCOJW8BpK0Anw8Q8bKZ1P6DFoX98nSw==
X-Google-Smtp-Source: AGHT+IFl6bLjc6SUcKrFbbKRoMHWLXcSH4w8u+6z+uJ4q1oMJcxA+ONZde9TSmNiMRBq+3MXQWyyIQ==
X-Received: by 2002:a17:90b:510a:b0:313:f883:5d36 with SMTP id 98e67ed59e1d1-31c2fcc389amr4239760a91.1.1752074378513;
        Wed, 09 Jul 2025 08:19:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3019e934sm2340536a91.33.2025.07.09.08.19.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:19:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/11] linux-yocto/5.15: update to v5.15.186
Date: Wed,  9 Jul 2025 08:19:14 -0700
Message-ID: <a7cea8a5c91d26ba7c3f72448f0897f5c2f81fd1.1752073806.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752073806.git.steve@sakoman.com>
References: <cover.1752073806.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 15:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220102

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    3dea0e7f549e Linux 5.15.186
    e3ff9f86cdb7 scsi: qedf: Use designated initializer for struct qed_fcoe_cb_ops
    8e31c6cc3cba scsi: elx: efct: Fix memory leak in efct_hw_parse_filter()
    92750bfe7b0d arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth()
    a9f6aab7910a perf: Fix sample vs do_exit()
    4be8065eace7 s390/pci: Fix __pcilg_mio_inuser() inline assembly
    6d7fcd8a7a42 bpf: Fix L4 csum update on IPv6 in CHECKSUM_COMPLETE
    f02c9c448e50 net: Fix checksum update for ILA adj-transport
    ecbea1a5fec5 ext4: avoid remount errors with 'abort' mount option
    1578f57a3fc3 ext4: make 'abort' mount option handling standard
    ef5706bed97e mm/huge_memory: fix dereferencing invalid pmd migration entry
    956b5aebb349 net_sched: sch_sfq: reject invalid perturb period
    6c589aa31802 net_sched: sch_sfq: move the limit validation
    6b96d7a9e8e7 net_sched: sch_sfq: use a temporary work area for validating configuration
    1b562b7f9231 net_sched: sch_sfq: don't allow 1 packet limit
    548cf048b426 net_sched: sch_sfq: handle bigger packets
    8a1eca898580 net_sched: sch_sfq: annotate data-races around q->perturb_period
    98236b25d03f arm64: proton-pack: Add new CPUs 'k' values for branch mitigation
    df53d4187092 arm64: bpf: Only mitigate cBPF programs loaded by unprivileged users
    993f63239c21 arm64: bpf: Add BHB mitigation to the epilogue for cBPF programs
    d759395f25ca arm64: spectre: increase parameters that can be used to turn off bhb mitigation individually
    fc061c32e327 arm64: proton-pack: Expose whether the branchy loop k value
    005f3b7bd378 arm64: proton-pack: Expose whether the platform is mitigated by firmware
    3af65d4123fe arm64: insn: Add support for encoding DSB
    803228bb5ad9 arm64: insn: add encoders for atomic operations
    0fc6db6d17bb arm64: move AARCH64_BREAK_FAULT into insn-def.h
    cebd765ba328 Revert "cpufreq: tegra186: Share policy per cluster"
    9051e4373dd1 serial: sh-sci: Increment the runtime usage counter for the earlycon device
    ee195051be2d ARM: dts: am335x-bone-common: Increase MDIO reset deassert delay to 50ms
    1a233520de8c ARM: dts: am335x-bone-common: Increase MDIO reset deassert time
    57a00096a11b ARM: dts: am335x-bone-common: Add GPIO PHY reset on revision C3 board
    ca3829c18c8d net: atm: fix /proc/net/atm/lec handling
    17e156a94e94 net: atm: add lec_mutex
    dc724bd34d56 calipso: Fix null-ptr-deref in calipso_req_{set,del}attr().
    8595350615f9 tipc: fix null-ptr-deref when acquiring remote ip of ethernet bearer
    d54e0c077b7c tcp: fix tcp_packet_delayed() for tcp_is_non_sack_preventing_reopen() behavior
    1b0ad1870491 atm: atmtcp: Free invalid length skb in atmtcp_c_send().
    d8cd847fb862 mpls: Use rcu_dereference_rtnl() in mpls_route_input_rcu().
    527fad1ae32f wifi: carl9170: do not ping device which has failed to load firmware
    5adc79cfdd21 ptp: fix breakage after ptp_vclock_in_use() rework
    b52215848977 net: ice: Perform accurate aRFS flow match
    ef0b5bbbed7f aoe: clean device rq_list in aoedev_downdev()
    f90220fc4a5f pldmfw: Select CRC32 when PLDMFW is selected
    ef3f3face5d0 hwmon: (occ) fix unaligned accesses
    a5537ce4a98a hwmon: (occ) Rework attribute registration for stack usage
    6e757e3c5728 hwmon: (occ) Add soft minimum power cap attribute
    f4999111956a drm/nouveau/bl: increase buffer size to avoid truncate warning
    3fc1401476cb drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
    760e9efae70f erofs: remove unused trace event erofs_destroy_inode
    a3d864c901a3 mm/hugetlb: fix huge_pmd_unshare() vs GUP-fast race
    8410996eb6fe mm: hugetlb: independent PMD page table shared count
    366298f2b04d mm/hugetlb: unshare page tables during VMA split, not before
    37d49f91e523 iio: accel: fxls8962af: Fix temperature calculation
    8f5fcf574eed ALSA: hda/realtek: enable headset mic on Latitude 5420 Rugged
    639b31e38853 ALSA: hda/intel: Add Thinkpad E15 to PM deny list
    a8aec0d35e93 ALSA: usb-audio: Rename ALSA kcontrol PCM and PCM1 for the KTMicro sound card
    a4a4abc818de Input: sparcspkr - avoid unannotated fall-through
    add2a8e193f3 block: default BLOCK_LEGACY_AUTOLOAD to y
    1df80d748f98 HID: usbhid: Eliminate recurrent out-of-bounds bug in usbhid_parse()
    287b4f085d2c atm: Revert atm_account_tx() if copy_from_iter_full() fails.
    6500f360a435 selinux: fix selinux_xfrm_alloc_user() to set correct ctx_len
    06780dbaa929 selftests/x86: Add a test to detect infinite SIGTRAP handler loop
    9d83ca27a634 udmabuf: use sgtable-based scatterlist wrappers
    3f6e9a24abeb scsi: s390: zfcp: Ensure synchronous unit_add
    f65f2291e795 scsi: storvsc: Increase the timeouts to storvsc_timeout
    f41c62532877 jffs2: check jffs2_prealloc_raw_node_refs() result in few other places
    4adee34098a6 jffs2: check that raw node were preallocated before writing summary
    58f664614f8c drivers/rapidio/rio_cm.c: prevent possible heap overwrite
    a41f447cb27a Revert "x86/bugs: Make spectre user default depend on MITIGATION_SPECTRE_V2" on v6.6 and older
    96baba48722b powerpc/eeh: Fix missing PE bridge reconfiguration during VFIO EEH recovery
    25375f0d0b6c platform/x86: dell_rbu: Stop overwriting data buffer
    07d7b8e7ef7d platform/x86: dell_rbu: Fix list usage
    b90dd5b12152 Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first"
    dd89a7e18c9c tee: Prevent size calculation wraparound on 32-bit kernels
    a5cc6ccac4d9 ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY
    73f3d6261ac4 bus: fsl-mc: increase MC_CMD_COMPLETION_TIMEOUT_MS value
    04584bba3249 watchdog: da9052_wdt: respect TWDMIN
    5e615cecf32e octeontx2-pf: Add error log forcn10k_map_unmap_rq_policer()
    5badeca146b2 bpf, sockmap: Fix data lost during EAGAIN retries
    fecb2fc3fc10 i40e: fix MMIO write access to an invalid page in i40e_clear_hw
    cafc3c567e4e sock: Correct error checking condition for (assign|release)_proto_idx()
    d34f2384d6df scsi: lpfc: Use memcpy() for BIOS version
    eb295874a43c pinctrl: mcp23s08: Reset all pins to input at probe
    56ce76e8d406 software node: Correct a OOB check in software_node_get_reference_args()
    9d9513b44446 vxlan: Do not treat dst cache initialization errors as fatal
    410a033bfa8c net: bridge: mcast: re-implement br_multicast_{enable, disable}_port functions
    c9bfb30b75c3 iommu/amd: Ensure GA log notifier callbacks finish running before module unload
    7cf3c7bd83ee scsi: lpfc: Fix lpfc_check_sli_ndlp() handling for GEN_REQUEST64 commands
    2fc2e9e865cc libbpf: Add identical pointer detection to btf_dedup_is_equiv()
    59bbff4eedff clk: rockchip: rk3036: mark ddrphy as critical
    d7ef254e7207 wifi: mac80211: do not offer a mesh path if forwarding is disabled
    0d4a81c341eb net: mlx4: add SOF_TIMESTAMPING_TX_SOFTWARE flag when getting ts info
    4bcc11448b16 pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get()
    c871d2b85c57 pinctrl: armada-37xx: propagate error from armada_37xx_pmx_gpio_set_direction()
    0245c91f4fdc pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get_direction()
    017035aaff2b pinctrl: armada-37xx: propagate error from armada_37xx_pmx_set_by_name()
    fbab07112a9e net: atlantic: generate software timestamp just before the doorbell
    c1ee5f16757a ipv4/route: Use this_cpu_inc() for stats on PREEMPT_RT
    97033659fc83 tcp: fix initial tp->rcvq_space.space value for passive TS enabled flows
    a7d4705f60b6 tcp: always seek for minimal rtt in tcp_rcv_rtt_update()
    8ce9d65726d5 net: dlink: add synchronization for stats update
    ef1b88325c74 i2c: npcm: Add clock toggle recovery
    b08e4cebc034 cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs
    c0952a626fd9 sctp: Do not wake readers in __sctp_write_space()
    70da1f7eb88a wifi: mt76: mt76x2: Add support for LiteOn WN4516R,WN4519R
    add1804ea2e0 emulex/benet: correct command version selection in be_cmd_get_stats()
    b0e79c9cc207 i2c: designware: Invoke runtime suspend on quick slave re-registration
    d99e45521ebb tipc: use kfree_sensitive() for aead cleanup
    722e716966c2 net: macb: Check return value of dma_set_mask_and_coherent()
    1cf0a6f43399 cpufreq: Force sync policy boost with global boost on sysfs update
    ca41c10be569 thermal/drivers/qcom/tsens: Update conditions to strictly evaluate for IP v2+
    9a317e436265 pmdomain: ti: Fix STANDBY handling of PER power domain
    794b0efb20a8 nios2: force update_mmu_cache on spurious tlb-permission--related pagefaults
    febbe1ce4c77 media: i2c: imx334: update mode_3840x2160_regs array
    bb97dfab7615 media: platform: exynos4-is: Add hardware sync wait to fimc_is_hw_change_mode()
    7a209e4b6b2a media: tc358743: ignore video while HPD is low
    ba5026e805cb drm/amdkfd: Set SDMA_RLCx_IB_CNTL/SWITCH_INSIDE_IB
    0a51b85b9960 drm/msm/dpu: don't select single flush for active CTL blocks
    4a8cb9908b51 jfs: Fix null-ptr-deref in jfs_ioc_trim
    258c755b28f6 drm/amdgpu/gfx9: fix CSIB handling
    7715a25c8930 drm/amdgpu/gfx8: fix CSIB handling
    603c8dd458da ext4: prevent stale extent cache entries caused by concurrent get es_cache
    05aba2d316db sunrpc: fix race in cache cleanup causing stale nextcheck time
    979408dbd76f media: rkvdec: Initialize the m2m context before the controls
    f29503cd7a1e media: ti: cal: Fix wrong goto on error path
    44618bee303b jfs: fix array-index-out-of-bounds read in add_missing_indices
    e3bb0c5a3071 ext4: ext4: unify EXT4_EX_NOCACHE|NOFAIL flags in ext4_ext_remove_space()
    5179d4cf092e drm/amdgpu/gfx7: fix CSIB handling
    9cb5da9c83a8 media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
    dc2aa8079d78 media: ccs-pll: Better validate VT PLL branch
    b6fa8b7b8a64 drm/amdgpu/gfx10: fix CSIB handling
    1db83a0b4f1f media: i2c: imx334: Fix runtime PM handling in remove function
    498e95513b5b drm/msm/a6xx: Increase HFI response timeout
    6a4d3708dec4 drm/amd/display: Add NULL pointer checks in dm_force_atomic_commit()
    bc487c490b75 media: uapi: v4l: Fix V4L2_TYPE_IS_OUTPUT condition
    b905b9926ee1 drm/msm/hdmi: add runtime PM calls to DDC transfer function
    fce2d5e2b3ce media: i2c: imx334: Enable runtime PM before sub-device registration
    bcc8724b34c5 drm/bridge: anx7625: change the gpiod_set_value API
    66e84439ec2a exfat: fix double free in delayed_free
    3742e777735a drm/bridge: analogix_dp: Add irq flag IRQF_NO_AUTOEN instead of calling disable_irq()
    fbee3fe40ca2 sunrpc: update nextcheck time when adding new cache entries
    767e4d5300ea drm/amdgpu/gfx6: fix CSIB handling
    767af6fc3787 ACPI: battery: negate current when discharging
    abd7d5fb3394 PM: runtime: fix denying of auto suspend in pm_suspend_timer_fn()
    82608027b6e7 ASoC: tegra210_ahub: Add check to of_device_get_match_data()
    64cc1a4a4440 ACPICA: utilities: Fix overflow check in vsnprintf()
    6336d96ae88f power: supply: bq27xxx: Retrieve again when busy
    960236150cd3 ACPICA: fix acpi parse and parseext cache leaks
    49047b184f2b ACPI: bus: Bail out if acpi_kobj registration fails
    15fa571eedf1 ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
    6448774d5889 ACPICA: Avoid sequence overread in call to strncmp()
    106a648780bf clocksource: Fix the CPUs' choice in the watchdog per CPU verification
    5a68893b594e ACPICA: fix acpi operand cache leak in dswstate.c
    bf68c0f4c75f iio: adc: ad7606_spi: fix reg write value mask
    4b2fac04ed6f iio: imu: inv_icm42600: Fix temperature calculation
    e401d55901a8 iio: accel: fxls8962af: Fix temperature scan element sign
    fe551adf4bd3 PCI: dw-rockchip: Fix PHY function call sequence in rockchip_pcie_phy_deinit()
    ff1283be679c PCI: Fix lock symmetry in pci_slot_unlock()
    a040e7effbb6 PCI: Add ACS quirk for Loongson PCIe
    2fd7537ffd9c PCI: cadence-ep: Correct PBA offset in .set_msix() callback
    8ec133fb054a uio_hv_generic: Use correct size for interrupt and monitor pages
    3562c09feeb8 remoteproc: core: Release rproc->clean_table after rproc_attach() fails
    c56d6ef2711e remoteproc: core: Cleanup acquired resources when rproc_handle_resources() fails in rproc_attach()
    fbf3da023bd2 regulator: max14577: Add error check for max14577_read_reg()
    5155f04287e5 mips: Add -std= flag specified in KBUILD_CFLAGS to vdso CFLAGS
    2ec9fda98d1a staging: iio: ad5933: Correct settling cycles encoding per datasheet
    9da3e442714f net: ch9200: fix uninitialised access during mii_nway_restart
    6805582abb72 ftrace: Fix UAF when lookup kallsym after ftrace disabled
    445e7055a68d dm-mirror: fix a tiny race condition
    ee3639385312 mtd: nand: sunxi: Add randomizer configuration before randomizer enable
    45413b242513 mtd: rawnand: sunxi: Add randomizer configuration in sunxi_nfc_hw_ecc_write_chunk
    6fe586c14d8f mm: fix ratelimit_pages update error in dirty_ratio_handler()
    3b4a50d733ac RDMA/iwcm: Fix use-after-free of work objects after cm_id destruction
    74bc813d11c3 ipc: fix to protect IPCS lookups using RCU
    b0dba0c78323 clk: meson-g12a: add missing fclk_div2 to spicc
    1fd94aa3fff0 parisc: fix building with gcc-15
    bf9c07864765 vgacon: Add check for vc_origin address range in vgacon_scroll()
    1a10d91766eb fbdev: Fix fb_set_var to prevent null-ptr-deref in fb_videomode_to_var
    1ee9bab20949 EDAC/altera: Use correct write width with the INTTEST register
    ac6992f72bd8 NFC: nci: uart: Set tty->disc_data only in success path
    38ef48a8afef f2fs: fix to do sanity check on sit_bitmap_size
    fbfe8446cd32 f2fs: prevent kernel warning due to negative i_nlink from corrupted image
    e5a2481dc2a0 Input: ims-pcu - check record size in ims_pcu_flash_firmware()
    a597a609bfd4 ext4: ensure i_size is smaller than maxbytes
    9004a1cc5cfc ext4: factor out ext4_get_maxbytes()
    c6187eb191a2 ext4: fix calculation of credits for extent tree modification
    9d1d1c5bf4fc ext4: inline: fix len overflow in ext4_prepare_inline_data
    01cf92dfced5 bus: fsl-mc: fix GET/SET_TAILDROP command ids
    0997566153bd bus: fsl-mc: do not add a device-link for the UAPI used DPMCP device
    7fc89c218fc9 ata: pata_via: Force PIO for ATAPI devices on VT6415/VT6330
    312c121beb9c can: tcan4x5x: fix power regulator retrieval during probe
    516fdd430171 bus: mhi: host: Fix conflict between power_up and SYSERR
    0e8878685902 ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4
    22441bf144ad ARM: 9447/1: arm/memremap: fix arch_memremap_can_ram_remap()
    b592691f650c media: uvcvideo: Fix deferred probing error
    739359516f96 media: uvcvideo: Send control events for partial succeeds
    e1019ff183fb media: uvcvideo: Return the number of processed controls
    89b5ab822bf6 media: vivid: Change the siize of the composing
    7e62be1f3b24 media: vidtv: Terminating the subsequent process of initialization failure
    230c37b5948d media: videobuf2: use sgtable-based scatterlist wrappers
    42f3fdd39fbd media: venus: Fix probe error handling
    8b451a9a46f2 media: v4l2-dev: fix error handling in __video_register_device()
    a4c47df59539 media: gspca: Add error handling for stv06xx_read_sensor()
    41807a5f6742 media: cxusb: no longer judge rbuf when the write fails
    6f79b25ddfe9 media: ccs-pll: Check for too high VT PLL multiplier in dual PLL case
    0220fe256b44 media: ccs-pll: Correct the upper limit of maximum op_pre_pll_clk_div
    64f7f8c362ab media: ccs-pll: Start OP pre-PLL multiplier search from correct value
    fe52765d1c90 media: ccs-pll: Start VT pre-PLL multiplier search from correct value
    7fce1722991d media: ov8856: suppress probe deferral errors
    55fed78e52fe wifi: rtlwifi: disable ASPM for RTL8723BE with subsystem ID 11ad:1723
    43d5e3bb5f1d jbd2: fix data-race and null-ptr-deref in jbd2_journal_dirty_metadata()
    0fccf5f01ed2 nfsd: Initialize ssc before laundromat_work to prevent NULL dereference
    425efc6b3292 nfsd: nfsd4_spo_must_allow() must check this is a v4 compound request
    1f7f8168abe8 wifi: p54: prevent buffer-overflow in p54_rx_eeprom_readback()
    8d5510e94dab net/mlx5: Add error handling in mlx5_query_nic_vport_node_guid()
    ea4b1cb6561e net/mlx5_core: Add error handling inmlx5_query_nic_vport_qkey_viol_cntr()
    b0e86598e073 powerpc/pseries/msi: Avoid reading PCI device registers in reduced power states
    2023dea8dd9b ASoC: meson: meson-card-utils: use of_property_present() for DT parsing
    190dcc1e3f6b ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params()
    5a16ebe0050e gfs2: move msleep to sleepable context
    e4da95e1246f crypto: marvell/cesa - Do not chain submitted requests
    8cb51a55b26e configfs: Do not override creating attribute file failure in populate_attrs()
    4ad892bdacb6 xfs: allow inode inactivation during a ro mount log recovery
    7eac413a3ea3 kbuild: hdrcheck: fix cross build with clang
    1b8763684529 kbuild: userprogs: fix bitsize and target detection on clang
    117ea3f4e59c drm/meson: Use 1000ULL when operating with mode->clock
    56e5419b5f5c net: usb: aqc111: debug info before sanitation
    3f77ba79a36d calipso: unlock rcu before returning -EAFNOSUPPORT
    2dace5e016c9 x86/iopl: Cure TIF_IO_BITMAP inconsistencies
    2a04a591170f xen/arm: call uaccess_ttbr0_enable for dm_op hypercall
    e67c0dac405a usb: typec: tcpm/tcpci_maxim: Fix bounds check in process_rx()
    8bc30532b978 usb: Flush altsetting 0 endpoints before reinitializating them after reset.
    f78b3fdd2c7f usb: cdnsp: Fix issue with detecting USB 3.2 speed
    8c65ca53c2e6 usb: cdnsp: Fix issue with detecting command completion event
    b4209e4b778e VMCI: fix race between vmci_host_setup_notify and vmci_ctx_unset_notify
    6d929bef6bda usb: usbtmc: Fix read_stb function and get_stb ioctl
    4751118c3ed8 drm/amd/display: Do not add '-mhard-float' to dcn2{1,0}_resource.o for clang
    510ce6a1393c kbuild: Add KBUILD_CPPFLAGS to as-option invocation
    0690824cc325 kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS
    f85d6a08cc9f kbuild: Add CLANG_FLAGS to as-instr
    d36719f29376 mips: Include KBUILD_CPPFLAGS in CHECKFLAGS invocation
    d08146795689 drm/amd/display: Do not add '-mhard-float' to dml_ccflags for clang
    cefb372db498 kbuild: Update assembler calls to use proper flags and language target
    3b68784d1439 MIPS: Prefer cc-option for additions to cflags
    3ef47d2b7a41 MIPS: Move '-Wa,-msoft-float' check from as-option to cc-option
    aaf384815bc1 x86/boot/compressed: prefer cc-option for CFLAGS additions
    2f3daa04a932 posix-cpu-timers: fix race between handle_posix_cpu_timers() and posix_cpu_timer_del()
    c8c4f0c2684a ALSA: usb-audio: Add implicit feedback quirk for RODE AI-1
    4a07125cc40d perf: Ensure bpf_perf_link path is properly serialized
    929d62e86f0c nvmet-fcloop: access fcpreq only when holding reqlock
    64007aab1cf6 fs/filesystems: Fix potential unsigned integer underflow in fs_name()
    0b479d0aa488 net_sched: ets: fix a race in ets_qdisc_change()
    52247723c300 sch_ets: make est_qlen_notify() idempotent
    852d27f773a7 net_sched: tbf: fix a race in tbf_change()
    110a47efcf23 net_sched: red: fix a race in __red_change()
    20f68e6a9e41 net_sched: prio: fix a race in prio_tune()
    dc84c55f121d net/mlx5: Fix return value when searching for existing flow group
    7ec31c2003f9 net/mlx5: Ensure fw pages are always allocated on same NUMA
    014ad9210373 net/mdiobus: Fix potential out-of-bounds read/write access
    694456462ed6 net: mdio: C22 is now optional, EOPNOTSUPP if not provided
    268625b73e4c macsec: MACsec SCI assignment for ES = 0
    6fa68d7eab34 net: Fix TOCTOU issue in sk_is_readable()
    15e46043bc46 i40e: retry VFLR handling if there is ongoing VF reset
    5008c550c634 i40e: return false from i40e_reset_vf if reset is in progress
    597b481ca1ce drm/meson: fix more rounding issues with 59.94Hz modes
    bd27ff504e4d drm/meson: use vclk_freq instead of pixel_freq in debug print
    f5d21eae4d7c drm/meson: fix debug log statement when setting the HDMI clocks
    363e63997798 drm/meson: use unsigned long long / Hz for frequency types
    7298df96179b powerpc/vas: Return -EINVAL if the offset is non-zero in mmap()
    81260c41b518 powerpc/powernv/memtrace: Fix out of bounds issue in memtrace mmap
    5814a7fc3abb net_sched: sch_sfq: fix a potential crash on gso_skb handling
    75ad1ca646ee scsi: iscsi: Fix incorrect error path labels for flashnode operations
    5c89dc8c3461 ath10k: snoc: fix unbalanced IRQ enable in crash recovery
    5d217e7031a5 ptp: remove ptp->n_vclocks check logic in ptp_vclock_in_use()
    f592eb12b43f scsi: core: ufs: Fix a hang in the error handler
    5f30a81fc188 serial: sh-sci: Clean sci_ports[0] after at earlycon exit
    b7f05abd60f0 serial: sh-sci: Move runtime PM enable to sci_probe_single()
    7857505af578 serial: sh-sci: Check if TX data was written to device in .tx_empty()
    e82d6c45db4f arm64: dts: ti: k3-am65-main: Add missing taps to sdhci0
    c3b4bc986af5 arm64: dts: ti: k3-am65-main: Fix sdhci node properties
    29f0cd61d6b5 arm64: dts: ti: k3-am65-main: Drop deprecated ti,otap-del-sel property
    f3c2b179b413 Input: synaptics-rmi - fix crash with unsupported versions of F34
    17e5ca8ef81c Input: synaptics-rmi4 - convert to use sysfs_emit() APIs
    ef0c767a559b pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id()
    432a171d6005 do_change_type(): refuse to operate on unmounted/not ours mounts
    eb34dc108e3e fix propagation graph breakage by MOVE_MOUNT_SET_GROUP move_mount(2)
    668923c47460 seg6: Fix validation of nexthop addresses
    18e65229a328 wireguard: device: enable threaded NAPI
    b5ad58285f92 netfilter: nf_set_pipapo_avx2: fix initial map fill
    ae98a1787fdc gve: add missing NULL check for gve_alloc_pending_packet() in TX DQO
    277006dd681e PM: sleep: Fix power.is_suspended cleanup for direct-complete devices
    61f418cd4ea5 vmxnet3: correctly report gso type for UDP tunnels
    6ef8dfb1b68f net: dsa: tag_brcm: legacy: fix pskb_may_pull length
    d94c6f53b0a7 ice: create new Tx scheduler nodes for new queues only
    96bc5ce57b16 Bluetooth: L2CAP: Fix not responding with L2CAP_CR_LE_ENCRYPTION
    02f56169e6eb spi: bcm63xx-hsspi: fix shared reset
    bb9c9e989a80 spi: bcm63xx-spi: fix shared reset
    417e17c44f3d net/mlx4_en: Prevent potential integer overflow calculating Hz
    605f09ae583e driver: net: ethernet: mtk_star_emac: fix suspend/resume issue
    e0b11227c4e8 net: tipc: fix refcount warning in tipc_aead_encrypt
    54e7ce239d69 gve: Fix RX_BUFFERS_POSTED stat to report per-queue fill_cnt
    28dd08343cc5 net: stmmac: platform: guarantee uniqueness of bus_id
    dae5b8818593 vt: remove VT_RESIZE and VT_RESIZEX from vt_compat_ioctl()
    38c5712df50d MIPS: Loongson64: Add missing '#interrupt-cells' for loongson64c_ls7a
    2659abc74cb3 iio: adc: ad7124: Fix 3dB filter frequency reading
    19fd9f5a6936 serial: Fix potential null-ptr-deref in mlb_usio_probe()
    0a1e16a6cbf4 usb: renesas_usbhs: Reorder clock handling and power management in probe
    6c1344a5bb1c PCI/DPC: Initialize aer_err_info before using it
    9f133e04c622 dmaengine: ti: Add NULL check in udma_probe()
    3e7061f62bd7 PCI: cadence: Fix runtime atomic count underflow
    19f0d83e1450 rtc: sh: assign correct interrupts with DT
    92270f14a8c1 nfs: ignore SB_RDONLY when remounting nfs
    3293cc462518 nfs: clear SB_RDONLY before getting superblock
    477c4882e53e perf record: Fix incorrect --user-regs comments
    00b96ed79bce perf tests switch-tracking: Fix timestamp comparison
    f93ea1e5e185 mfd: stmpe-spi: Correct the name used in MODULE_DEVICE_TABLE
    f79f8d8dda3a mfd: exynos-lpass: Avoid calling exynos_lpass_disable() twice in exynos_lpass_remove()
    e009779acc04 rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()
    e8461ec67a36 remoteproc: qcom_wcnss_iris: Add missing put_device() on error in probe
    8d39a6fd9843 perf scripts python: exported-sql-viewer.py: Fix pattern matching with Python 3
    9d06ac32c202 backlight: pm8941: Add NULL check in wled_configure()
    07a4014cc66b perf ui browser hists: Set actions->thread before calling do_zoom_thread()
    c6dbaf7e31cb perf build: Warn when libdebuginfod devel files are not available
    2d63433e8eaa fbdev: core: fbcvt: avoid division by 0 in fb_cvt_hperiod()
    1fd889c14572 soc: aspeed: Add NULL check in aspeed_lpc_enable_snoop()
    0fab016dc4aa soc: aspeed: lpc: Fix impossible judgment condition
    3a2249e91547 arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma with Haikou
    26e868438691 ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
    7002b954c4a8 bus: fsl-mc: fix double-free on mc_dev
    1ce784ddfb31 nilfs2: do not propagate ENOENT error from nilfs_btree_propagate()
    c155d46ff02c nilfs2: add pointer check for nilfs_direct_propagate()
    1a955db41131 ocfs2: fix possible memory leak in ocfs2_finish_quota_recovery
    5c51aa862cbe Squashfs: check return result of sb_min_blocksize
    ca87e905ff3c arm64: dts: imx8mn-beacon: Fix RTC capacitive load
    485f23661881 arm64: dts: imx8mm-beacon: Fix RTC capacitive load
    d274c1372926 ARM: dts: at91: at91sam9263: fix NAND chip selects
    dac5dfede03f ARM: dts: at91: usb_a9263: fix GPIO for Dataflash chip select
    8636cafb2c67 f2fs: fix to correct check conditions in f2fs_cross_rename
    e61079985c54 f2fs: use d_inode(dentry) cleanup dentry->d_inode
    92dd2d870e7b net: phy: mscc: Stop clearing the the UDPv4 checksum for L2 frames
    ad17eb86d042 net: openvswitch: Fix the dead loop of MPLS parse
    26ce90f1ce60 calipso: Don't call calipso functions for AF_INET sk.
    7d589b470f39 net: lan743x: rename lan743x_reset_phy to lan743x_hw_reset_phy
    e7fb4ebee6e9 bpf: Avoid __bpf_prog_ret0_warn when jit fails
    f398d2dfe450 net: usb: aqc111: fix error handling of usbnet read calls
    42a44e25eee4 netfilter: nft_tunnel: fix geneve_opt dump
    4edb40b05cb6 bpf, sockmap: Avoid using sk_socket after free when sending
    d796723b1481 vfio/type1: Fix error unwind in migration dirty bitmap allocation
    83c1ed5c83ca netfilter: nf_tables: nft_fib_ipv6: fix VRF ipv4/ipv6 result discrepancy
    7ee3fb6258da wifi: ath9k_htc: Abort software beacon handling if disabled
    1ee8ea6937d1 wifi: rtw88: fix the 'para' buffer size to avoid reading out of bounds
    7f9efa13f2af s390/bpf: Store backchain even for leaf progs
    2b901bf2fa23 clk: qcom: gcc-msm8939: Fix mclk0 & mclk1 for 24 MHz
    ee90be48edb3 bpf: Fix WARN() in get_bpf_raw_tp_regs
    2ecafe59668d pinctrl: at91: Fix possible out-of-boundary access
    12cda7fcc4cf libbpf: Use proper errno value in nlattr
    2fef0e86682f ktls, sockmap: Fix missing uncharge operation
    54ce9bcdaee5 clk: bcm: rpi: Add NULL check in raspberrypi_clk_register()
    c22099a64880 clk: qcom: gcc-sm6350: Add *_wait_val values for GDSCs
    9c5268e5d633 bpf: Fix uninitialized values in BPF_{CORE,PROBE}_READ
    f9784da76ad7 RDMA/mlx5: Fix error flow upon firmware failure for RQ destruction
    e9022196bdbe netfilter: nft_quota: match correctly when the quota just depleted
    ba18b0b9272f netfilter: bridge: Move specific fragmented packet to slow_path instead of dropping it
    c6c7e7ab962b libbpf: Use proper errno value in linker
    a6412e93cf4a f2fs: fix to detect gcing page in f2fs_is_cp_guaranteed()
    ce6849b76dad f2fs: clean up w/ fscrypt_is_bounce_page()
    65b935d4e5c4 iommu: Protect against overflow in iommu_pgsize()
    5c3e52ab7887 RDMA/hns: Include hnae3.h in hns_roce_hw_v2.h
    f1ba4e35fb3f wifi: rtw88: do not ignore hardware read error during DPK
    6dfe62db59f3 libbpf: Fix buffer overflow in bpf_object__init_prog
    f4b0ce074bd6 net: ncsi: Fix GCPS 64-bit member variables
    6a324d77f7ea f2fs: fix to do sanity check on sbi->total_valid_block_count
    d6181bd1dfa1 bpf, sockmap: fix duplicated data transmission
    2160dcc38acf IB/cm: use rwlock for MAD agent lock
    f9507cf2dd0e wifi: ath11k: fix node corruption in ar->arvifs list
    e74b9a7269aa firmware: SDEI: Allow sdei initialization without ACPI_APEI_GHES
    809b522315a0 drm/tegra: rgb: Fix the unbound reference count
    afc9153b1e57 drm/vkms: Adjust vkms_state->active_planes allocation type
    58d0e3088812 drm: rcar-du: Fix memory leak in rcar_du_vsps_init()
    39044a10d912 selftests/seccomp: fix syscall_restart test for arm compat
    7287af1ec4d3 firmware: psci: Fix refcount leak in psci_dt_init
    1b6780143d59 m68k: mac: Fix macintosh_config for Mac II
    5390b3d4c6d4 fs/ntfs3: handle hdr_first_de() return value
    892a242ca5b1 media: rkvdec: Fix frame size enumeration
    85cdcb834fb4 drm/amd/pp: Fix potential NULL pointer dereference in atomctrl_initialize_mc_reg_table
    259b74c2b329 spi: sh-msiof: Fix maximum DMA transfer size
    cfc61c34077e ACPI: OSI: Stop advertising support for "3.0 _SCP Extensions"
    92322500c1aa x86/mtrr: Check if fixed-range MTRRs exist in mtrr_save_fixed_ranges()
    3319b48d1ba2 PM: wakeup: Delete space in the end of string shown by pm_show_wakelocks()
    b227c27359a0 power: reset: at91-reset: Optimize at91_reset()
    bf6a8502a5f4 EDAC/skx_common: Fix general protection fault
    03657814c828 crypto: sun8i-ce - move fallback ahash_request to the end of the struct
    02b661940874 crypto: xts - Only add ecb if it is not already there
    200b752c0066 crypto: lrw - Only add ecb if it is not already there
    9bacddcf6886 crypto: marvell/cesa - Avoid empty transfer descriptor
    e1cc69da6195 crypto: marvell/cesa - Handle zero-length skcipher requests
    c798023fa973 x86/cpu: Sanitize CPUID(0x80000000) output
    ada335e8475d crypto: sun8i-ss - do not use sg_dma_len before calling DMA functions
    fb2671376bbf perf/core: Fix broken throttling when max_samples_per_tick=1
    333f2d85b615 gfs2: gfs2_create_inode error handling fix
    2f62eda4d974 thunderbolt: Do not double dequeue a configuration request
    2e74fd21b845 usb: usbtmc: Fix timeout value in get_stb
    547f3e678922 USB: serial: pl2303: add new chip PL2303GC-Q20 and PL2303GT-2AB
    3f1aac91fc36 usb: storage: Ignore UAS driver for SanDisk 3.2 Gen2 storage device
    cfd327ad2e00 usb: quirks: Add NO_LPM quirk for SanDisk Extreme 55AE
    0188c74bf3ac rtc: Fix offset calculation for .start_secs < 0
    c360f8ff1bef rtc: Make rtc_time64_to_tm() support dates before 1970
    6df0e243e757 acpi-cpufreq: Fix nominal_freq units to KHz in get_max_boost_ratio()
    e0a83d422a18 pinctrl: armada-37xx: set GPIO output value before setting direction
    bb9578e9f35f pinctrl: armada-37xx: use correct OUTPUT_VAL register for GPIOs > 31
    ebf6f96c7993 tracing: Fix compilation warning on arm32
    1c700860e8bc Linux 5.15.185
    dcbee1061a46 perf/arm-cmn: Initialise cmn->cpu earlier
    dcb08fd2c6cb platform/x86: thinkpad_acpi: Ignore battery threshold change event notification
    dbc155cf4e70 platform/x86: fujitsu-laptop: Support Lifebook S2110 hotkeys
    961caaf8ad35 tpm: tis: Double the timeout B to 4s
    1706ef825254 nvme-pci: add NVME_QUIRK_NO_DEEPEST_PS quirk for SOLIDIGM P44 Pro
    128b5f020651 spi: spi-sun4i: fix early activation
    4916624695c0 um: let 'make clean' properly clean underlying SUBARCH as well
    13108bf19da5 platform/x86: thinkpad_acpi: Support also NEC Lavie X1475JAS
    49c13288c919 nfs: don't share pNFS DS connections between net namespaces
    5c46ec760d3b HID: quirks: Add ADATA XPG alpha wireless mouse support
    1686594d7285 coredump: hand a pidfd to the usermode coredump helper
    5ff7313a1f45 fork: use pidfd_prepare()
    7f8c3fd203fd pid: add pidfd_prepare()
    b06450fb3e73 coredump: fix error handling for replace_fd()
    2c928b3a0b04 net_sched: hfsc: Address reentrant enqueue adding class to eltree twice
    cc6790f4b085 arm64: dts: qcom: sm8350: Fix typo in pil_camera_mem node
    9fdb86f0bf65 smb: client: Reset all search buffer pointers when releasing buffer
    1b197931fbc8 smb: client: Fix use-after-free in cifs_fill_dirent
    5492aaea844e x86/its: Fix undefined reference to cpu_wants_rethunk_at()
    8f8637b9d26d drm/i915/gvt: fix unterminated-string-initialization warning
    3c2729dfcf30 xen/swiotlb: relax alignment requirements
    34901631e6e3 i3c: master: svc: Fix implicit fallthrough in svc_i3c_master_ibi_work()
    9d678b2976ec kbuild: Disable -Wdefault-const-init-unsafe
    0e0cf836cfe4 spi: spi-fsl-dspi: Reset SR flags before sending a new message
    a3a147ef6d02 spi: spi-fsl-dspi: Halt the module after a new message transfer
    0e989441cfbc spi: spi-fsl-dspi: restrict register range for regmap access
    6fd4a4cb3ca1 Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection"
    c6da28bc4e1f mm/page_alloc.c: avoid infinite retries caused by cpuset race
    5dcdbb69aa3a memcg: always call cond_resched() after fn()
    ff887e77b777 Revert "drm/amd: Keep display off while going into S4"
    26d20ea0f233 drm/edid: fixed the bug that hdr metadata was not reset
    fb7cde625872 platform/x86: dell-wmi-sysman: Avoid buffer overflow in current_password_store()
    0f5d93ee3f8b llc: fix data loss when reading from a socket in llc_ui_recvmsg()
    10217da9644a ALSA: pcm: Fix race of buffer access at PCM OSS layer
    0622846db728 can: bcm: add missing rcu read protection for procfs content
    fbd8fdc2b218 can: bcm: add locking for bcm_op runtime updates
    1a426abdf1c8 padata: do not leak refcount in reorder_work
    c3059d58f79f crypto: algif_hash - fix double free in hash_accept
    24f942d9820b octeontx2-af: Set LMT_ENA bit for APR table entries
    f5c2c4eaaa5a net/tipc: fix slab-use-after-free Read in tipc_aead_encrypt_done
    89c301e929a0 sch_hfsc: Fix qlen accounting bug when using peek in hfsc_enqueue()
    207dabae49b2 net: dwmac-sun8i: Use parsed internal PHY address instead of 1
    ec180b032459 bridge: netfilter: Fix forwarding of fragmented packets
    069cbc318de5 Bluetooth: L2CAP: Fix not checking l2cap_chan security level
    0995986ffd5e xfrm: Sanitize marks before insert
    6a39058059f6 remoteproc: qcom_wcnss: Fix on platforms without fallback regulators
    f6d45fd92f62 __legitimize_mnt(): check for MNT_SYNC_UMOUNT should be under mount_lock
    769dd92ef97e xenbus: Allow PVH dom0 a non-local xenstore
    a876703894a6 btrfs: correct the order of prelim_ref arguments in btrfs__prelim_ref
    fc01b547c3f8 nvmet-tcp: don't restore null sk_state_change
    7bd0049e9699 ALSA: hda/realtek: Add quirk for HP Spectre x360 15-df1xxx
    e3bf273d9ad7 ASoC: Intel: bytcr_rt5640: Add DMI quirk for Acer Aspire SW3-013
    2568cf939a64 pinctrl: meson: define the pull up/down resistor value as 60 kOhm
    64ca70dee2cc ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
    39db9b5a1673 drm: Add valid clones check
    85a8dfc77227 drm/atomic: clarify the rules around drm_atomic_state->allow_modeset
    a0d2f4905b16 wifi: ath9k: return by of_get_mac_address
    8d278ad829c2 regulator: ad5398: Add device tree support
    8ed3d1784774 spi: zynqmp-gqspi: Always acknowledge interrupts
    d2c65c8be7a1 wifi: rtw88: Don't use static local variable in rtw8822b_set_tx_power_index_by_rate
    3b61fb788954 perf/amd/ibs: Fix perf_ibs_op.cnt_mask for CurCnt
    15c799f7f8e1 bpftool: Fix readlink usage in get_fd_type
    164beeabcb1b drm/ast: Find VBIOS mode from regular display size
    d6fd1eee0767 HID: usbkbd: Fix the bit shift number for LED_KANA
    2c6387f545be scsi: st: Restore some drive settings after reset
    7e25573e1ac5 scsi: lpfc: Handle duplicate D_IDs in ndlp search-by D_ID routine
    1f66789ad7de net/mana: fix warning in the writer of client oob
    39ea4ca9d39a rcu: fix header guard for rcu_all_qs()
    b4d9a18fc87f rcu: handle quiescent states for PREEMPT_RCU=n, PREEMPT_COUNT=y
    41097ac64d0d r8169: don't scan PHY addresses > 0
    e033da39fc6a vxlan: Annotate FDB data races
    4d20b4a861af media: qcom: camss: csid: Only add TPG v4l2 ctrl if TPG hardware is available
    eae500bc8dcc hwmon: (xgene-hwmon) use appropriate type for the latency value
    7b99233dda9b clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for some RCGs
    3373abfa5d29 wifi: rtw88: Fix download_firmware_validate() for RTL8814AU
    c47f92ee6cfb r8152: add vendor/device ID pair for Dell Alienware AW1022z
    14298c88e2dd ip: fib_rules: Fetch net from fib_rule in fib[46]_rule_configure().
    4d87acf13f28 arch/powerpc/perf: Check the instruction type before creating sample with perf_mem_data_src
    711734c77fe4 wifi: mac80211: remove misplaced drv_mgd_complete_tx() call
    11ab6d6ee7d8 wifi: mac80211: don't unconditionally call drv_mgd_complete_tx()
    e42329d27770 net/mlx5e: reduce rep rxq depth to 256 for ECPF
    a411de3091f6 net/mlx5e: set the tx_queue_len for pfifo_fast
    c74b91453b8c net/mlx5: Extend Ethtool loopback selftest to support non-linear SKB
    99b713f4b7df drm/amd/display: Initial psr_version with correct setting
    cc958022666c drm/amdgpu: reset psp->cmd to NULL after releasing the buffer
    c48f7855988f phy: core: don't require set_mode() callback for phy_get_mode() to work
    c8128c04193b net/mlx4_core: Avoid impossible mlx4_db_alloc() order value
    485dc9ef39f7 media: v4l: Memset argument to 0 before calling get_mbus_config pad op
    b4e81a758035 smack: recognize ipv4 CIPSO w/o categories
    8de1d394e31e pinctrl: devicetree: do not goto err when probing hogs in pinctrl_dt_to_map
    b45a50fc1f4e ASoC: soc-dai: check return value at snd_soc_dai_set_tdm_slot()
    d95e6cf0df39 ASoC: tas2764: Power up/down amp on mute ops
    c1f0a98342d4 ASoC: ops: Enforce platform maximum on initial value
    d5db6ffb03fa net/mlx5: Apply rate-limiting to high temperature warning
    937b9c41cc71 net/mlx5: Modify LSB bitmask in temperature event to include only the first bit
    5611b5f79836 ACPI: HED: Always initialize before evged
    94afbd920a51 PCI: Fix old_size lower bound in calculate_iosize() too
    af8431851b8e eth: mlx4: don't try to complete XDP frames in netpoll
    30064eee8fe7 can: c_can: Use of_property_present() to test existence of DT property
    fc173cada345 RDMA/core: Fix best page size finding when it can cross SG entries
    288813ddcc21 EDAC/ie31200: work around false positive build warning
    128cdb617a87 net: pktgen: fix access outside of user given buffer in pktgen_thread_write()
    b2334244a421 wifi: rtw88: Fix rtw_desc_to_mcsrate() to handle MCS16-31
    211539ee8d46 wifi: rtw88: Fix rtw_init_ht_cap() for RTL8814AU
    94ba815f5110 wifi: rtw88: Fix rtw_init_vht_cap() for RTL8814AU
    f0b5f65aebcc scsi: mpt3sas: Send a diag reset if target reset fails
    85cd3f245c15 clocksource: mips-gic-timer: Enable counter when CPUs start
    51d70446278a MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
    6fd978a7117e MIPS: Use arch specific syscall name match function
    9a3f2d08291b x86/kaslr: Reduce KASLR entropy on most x86 systems
    17cf6821b758 libbpf: Fix out-of-bound read
    14790abc8779 cpuidle: menu: Avoid discarding useful information
    2579ca741b84 x86/nmi: Add an emergency handler in nmi_desc & use it in nmi_shootdown_cpus()
    5eb9da3b7d2e drm/amd/display: handle max_downscale_src_width fail check
    eee2fb58449f x86/build: Fix broken copy command in genimage.sh when making isoimage
    db5833217f13 soc: ti: k3-socinfo: Do not use syscon helper to build regmap
    32de1542f467 bonding: report duplicate MAC address in all situations
    5fe40d499f50 net: xgene-v2: remove incorrect ACPI_PTR annotation
    cfc5a07f9330 drm/amdkfd: KFD release_work possible circular locking
    2e04e067d4d6 selftests/net: have `gro.sh -t` return a correct exit code
    2c48a122fa0a net/mlx5: Avoid report two health errors on same syndrome
    97bab02f0b64 firmware: arm_ffa: Set dma_mask for ffa devices
    f5b5945c0bf2 PCI: brcmstb: Add a softdep to MIP MSI-X driver
    ee8274d80151 PCI: brcmstb: Expand inbound window size up to 64GB
    0a9022295477 fpga: altera-cvp: Increase credit timeout
    55883a34d309 drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
    b5c0bd07a48f ARM: at91: pm: fix at91_suspend_finish for ZQ calibration
    e62a64a000ba hwmon: (gpio-fan) Add missing mutex locks
    4fc2d289b3cc x86/bugs: Make spectre user default depend on MITIGATION_SPECTRE_V2
    c953cea9035c clk: imx8mp: inform CCF of maximum frequency of clocks
    1bd5406866d0 media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
    e88247716dd7 ipv4: fib: Move fib_valid_key_len() to rtm_to_fib_config().
    674b969287f4 net: pktgen: fix mpls maximum labels list parsing
    c3a1354b631d net: ethernet: ti: cpsw_new: populate netdev of_node
    b91a5652610b pinctrl: bcm281xx: Use "unsigned int" instead of bare "unsigned"
    c91447e35b9b media: cx231xx: set device_caps for 417
    fb26963bd247 drm/amdgpu: Do not program AGP BAR regs under SRIOV in gfxhub_v1_0.c
    654c295f9079 remoteproc: qcom_wcnss: Handle platforms with only single power domain
    5111227d7f1f orangefs: Do not truncate file size
    025c8f477625 dm cache: prevent BUG_ON by blocking retries on failed device resumes
    246346230486 media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
    5753a20bf23c ARM: tegra: Switch DSI-B clock parent to PLLD on Tegra114
    8f12fab5a765 ieee802154: ca8210: Use proper setters and getters for bitwise types
    cc29d05861d0 rtc: ds1307: stop disabling alarms on probe
    f7dd2a729049 tcp: bring back NUMA dispersion in inet_ehash_locks_alloc()
    5cb296e94210 powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
    d3bb3258d105 arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
    4b173bb2c466 crypto: lzo - Fix compression buffer overrun
    2592aeda794c cpufreq: tegra186: Share policy per cluster
    f6535bc6556d ASoC: qcom: sm8250: explicitly set format in sm8250_be_hw_params_fixup()
    bc23966b90d9 auxdisplay: charlcd: Partially revert "Move hwidth and bwidth to struct hd44780_common"
    2b572c409811 ipv6: save dontfrag in cork
    1acb22d09f5c mmc: sdhci: Disable SD card clock before changing parameters
    8d52676f791d arm64/mm: Check PUD_TYPE_TABLE in pud_bad()
    066675bb11ab netfilter: conntrack: Bound nf_conntrack sysctl writes
    3695ade72a9b timer_list: Don't use %pK through printk()
    1351995ba665 posix-timers: Add cond_resched() to posix_timer_add() search loop
    1a8df82d201e RDMA/uverbs: Propagate errors from rdma_lookup_get_uobject()
    7258b92ceff3 xen: Add support for XenServer 6.1 platform device
    8dbcb21f0926 dm: restrict dm device size to 2^63-512 bytes
    91628988aca3 crypto: octeontx2 - suppress auth failure screaming due to negative tests
    49a99ccec1c8 kbuild: fix argument parsing in scripts/config
    ac8fbc318cec ASoC: mediatek: mt6359: Add stub for mt6359_accdet_enable_jack_detect
    317615342d2a rtc: rv3032: fix EERD location
    fe5a5b9d1441 tcp: reorganize tcp_in_ack_event() and tcp_count_delivered()
    fa7183cc13dd vfio/pci: Handle INTx IRQ_NOTCONNECTED
    8f070ca005e4 scsi: st: ERASE does not change tape location
    84e7b679f8d6 scsi: st: Tighten the page format heuristics with MODE SELECT
    db03d5b2db5c ext4: reorder capability check last
    1ad3d069cf4d um: Update min_low_pfn to match changes in uml_reserved
    3eac35c34a98 um: Store full CSGSFS and SS register from mcontext
    fdcd142d310c dlm: make tcp still work in multi-link env
    30748ce7e156 i3c: master: svc: Fix missing STOP for master request
    ce8d1993b122 btrfs: send: return -ENAMETOOLONG when attempting a path that is too long
    0175d448b2f8 btrfs: get zone unusable bytes while holding lock at btrfs_reclaim_bgs_work()
    23a2379b0dd9 btrfs: avoid linker error in btrfs_find_create_tree_block()
    e98cb12ba84d btrfs: make btrfs_discard_workfn() block_group ref explicit
    74314f8937ea i2c: pxa: fix call balance of i2c->clk handling routines
    d18963f219b3 i2c: qup: Vote for interconnect bandwidth to DRAM
    7887df0fe9ec wifi: mt76: only mark tx-status-failed frames as ACKed on mt76x0/2
    4b62412e985c mmc: host: Wait for Vdd to settle on card power off
    f49c337037df libnvdimm/labels: Fix divide error in nd_label_data_init()
    c7af649198dc PCI: vmd: Disable MSI remapping bypass under Xen
    18282d8518bf pNFS/flexfiles: Report ENETDOWN as a connection error
    0ea65822090b tools/build: Don't pass test log files to linker
    11c24ad1ffde PCI: dwc: ep: Ensure proper iteration over outbound map windows
    ed30141557d1 lockdep: Fix wait context check on softirq for PREEMPT_RT
    0a474eaf3574 dql: Fix dql->limit value when reset.
    897a205ffc43 thermal/drivers/qoriq: Power down TMU on system suspend
    2328a3bf513c SUNRPC: rpcbind should never reset the port to the value '0'
    8a72549eaf12 SUNRPC: rpc_clnt_set_transport() must not change the autobind setting
    01d50dfae8e9 NFSv4: Treat ENETUNREACH errors as fatal for state recovery
    552baa350a2f fbdev: core: tileblit: Implement missing margin clearing for tileblit
    442192330096 fbcon: Use correct erase colour for clearing in fbcon
    5caaec485f37 fbdev: fsl-diu-fb: add missing device_remove_file()
    84a2fccac8c8 mailbox: use error ret code of of_parse_phandle_with_args()
    236bad68c007 tracing: Mark binary printing functions with __printf() attribute
    2272e75d7a80 NFSv4: Check for delegation validity in nfs_start_delegation_return_locked()
    f41f9ce3c709 kconfig: merge_config: use an empty file as initfile
    bc9f8527198a samples/bpf: Fix compilation failure for samples/bpf on LoongArch Fedora
    af8a8fce197b bpf: fix possible endless loop in BPF map iteration
    2391dc87e84a net: enetc: refactor bulk flipping of RX buffers to separate function
    0b18c3a17bc7 cgroup: Fix compilation issue due to cgroup_mutex not being exported
    41c810a06470 dma-mapping: avoid potential unused data compilation warning
    02d2d6caee3a virtio_ring: Fix data race by tagging event_triggered as racy for KCSAN
    019ca2804f3f scsi: target: iscsi: Fix timeout on deleted connection

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 2f6af169f4..73c3264016 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "90d8b830089647dcc97fd836c4f1fde65f24f6d6"
-SRCREV_meta ?= "9c4fc176eca557a5763bda2831fa5ea2985fadeb"
+SRCREV_machine ?= "76da2cf32fe004e10f581744496e71547d0a4361"
+SRCREV_meta ?= "5932fcfa6982f5b86a13849b84ef3d80a557a030"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.184"
+LINUX_VERSION ?= "5.15.186"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 0abc849545..0aa51c512c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.184"
+LINUX_VERSION ?= "5.15.186"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "660c504885ff7bd0edf06980c19539373e6bba05"
-SRCREV_meta ?= "9c4fc176eca557a5763bda2831fa5ea2985fadeb"
+SRCREV_machine ?= "4175c60a7b8e282d802be846bae75eeba398969e"
+SRCREV_meta ?= "5932fcfa6982f5b86a13849b84ef3d80a557a030"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 5bc6082e4d..43d77045bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "27eaa24a0448c2ec0a7402e76fd208b6e2998eda"
-SRCREV_machine:qemuarm64 ?= "f97f77899cbaf0bd844d15f9eeceac0ead4c8a76"
-SRCREV_machine:qemumips ?= "a76e6f5b3fe8e298e66874f5e7e03acc3a0097ca"
-SRCREV_machine:qemuppc ?= "1fc08762bbe900514d2a810a1b48d70e8c3f045e"
-SRCREV_machine:qemuriscv64 ?= "9a9d15d3fcaa246682b1283a37af48a9c71b6b13"
-SRCREV_machine:qemuriscv32 ?= "9a9d15d3fcaa246682b1283a37af48a9c71b6b13"
-SRCREV_machine:qemux86 ?= "9a9d15d3fcaa246682b1283a37af48a9c71b6b13"
-SRCREV_machine:qemux86-64 ?= "9a9d15d3fcaa246682b1283a37af48a9c71b6b13"
-SRCREV_machine:qemumips64 ?= "19e099ff3a9f78fe5f88c4dc44ab4f28b2981c25"
-SRCREV_machine ?= "9a9d15d3fcaa246682b1283a37af48a9c71b6b13"
-SRCREV_meta ?= "9c4fc176eca557a5763bda2831fa5ea2985fadeb"
+SRCREV_machine:qemuarm ?= "d93c7fcf604b572bf93497e00017f9cf34fa34c7"
+SRCREV_machine:qemuarm64 ?= "9e9701d7239420165b342f3c363961ee3040a91e"
+SRCREV_machine:qemumips ?= "be5800a6d9002fd12668c0f8ada68ad7cab4398c"
+SRCREV_machine:qemuppc ?= "6fa52ff2eb31c6855f51a0d4f96339c50437d139"
+SRCREV_machine:qemuriscv64 ?= "48702d462c58d69b4b382bb34984f2f0881d0bb1"
+SRCREV_machine:qemuriscv32 ?= "48702d462c58d69b4b382bb34984f2f0881d0bb1"
+SRCREV_machine:qemux86 ?= "48702d462c58d69b4b382bb34984f2f0881d0bb1"
+SRCREV_machine:qemux86-64 ?= "48702d462c58d69b4b382bb34984f2f0881d0bb1"
+SRCREV_machine:qemumips64 ?= "bb909213f7e13fd17e39d95e5d1b646a7b0bacf2"
+SRCREV_machine ?= "48702d462c58d69b4b382bb34984f2f0881d0bb1"
+SRCREV_meta ?= "5932fcfa6982f5b86a13849b84ef3d80a557a030"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "98f47d0e9b8c557d3063d3ea661cbea1489af330"
+SRCREV_machine:class-devupstream ?= "1c700860e8bc079c5c71d73c55e51865d273943c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.184"
+LINUX_VERSION ?= "5.15.186"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


