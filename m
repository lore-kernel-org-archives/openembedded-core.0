Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192F5C83F03
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:13:01 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.15033.1751425973365604938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tE7UeCWd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747e41d5469so4435090b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425972; x=1752030772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tdYxCSHIJSsfSjBP3ZwuNAX8e8lsQ8O3H6EB3NRPXbM=;
        b=tE7UeCWdpUIvWTpTqcN8gBd9h6+KtuVk3lc/X0UlNqPIw0ts47J7oiZZGLlWPo3GkH
         8RBpxQOaAMYoUnvx4GCq3rHHtgYvyNknl389l45qUSVzWtFlEifqlWi7E8c80YD4qlFp
         Y0Ow1is9W8PVJoGUOMqhXSjCGcwwpdEg4oOiwjC6d0gOg5HYNXJjl3feVLmSLX+vg3ke
         cg62Q9iUZNkX7R/vt7ppFftTb5PoZvEOE/hwRYZVDwRqWxXGkx3fZG4QpkjH1+cE96Dt
         rixpuQx0rUJxrIuZROKedc67fshZ0TDafCfhaWI0cGmYXBkHNeu5MJP2FCM6+bSSubPI
         F7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425972; x=1752030772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdYxCSHIJSsfSjBP3ZwuNAX8e8lsQ8O3H6EB3NRPXbM=;
        b=HYnvPQk6a50PZSQPZ3D1KFDem2zwL9pQI8IglSH6InQ1bFg9oGuMjSF4WgYxrhzeD9
         x77qj5qRgcVoGOk/YBi1mQCyVm/QLdLRFAP8n2wWz4wrSnf7iARnDEfbz14Agj71QPPy
         WfoAp3W6Kbk0FOzmqy4dN8/LJSz9nUONHuvgB5Uk78uXYHexYXLBFnragUd61EfFUs/n
         BkulyEiASzTczww4uGYRbuDsSE+kvy+DZQomcvwPzpzk3mKF8zMWOQAqzSUNE/Lda1vj
         k0mqIAxJxLgzbzQb4+tk0k1hMQS6Yo8/WtxDMqYL1w5DHjXsniupSt66EJgbSbUsmMac
         JYdA==
X-Gm-Message-State: AOJu0Ywgn1dg4Rn69oypWsk2YCYAVdtvJQ9l1G4tDlcqTFAf6VQVW8hE
	lzTAYaFP5zhqREeBywkZMVqtgVmlqr0Klw6d+xN7hGV4JINj28rZjpewAyLo9/iyceAo2NWlCUJ
	2NEkW
X-Gm-Gg: ASbGnctQ8Bx/52dZbwLrxRQ/N3Ure0ZQBHS9Dj9qgLHAeZ12mgTpa3pWht/+N8RCtqd
	KIFRq839JutJyBsVxRqaq9kqGXVBxVIb9pfAlJfsEWondalCuJHwd3RajUAqesCljlbZwmxe3FC
	5Ykr+UxkXtosuqY3YTNG9EvGoe9DW4MxBCKBx7zkOEymPsPeG0ZkR7O7JzIDQR7dV3wPvFjw+9L
	zYDXwZrk582cRxPhvwLQlEU4pePrAl9YQkxF2m55Zfz9iT2OZbWHI7bh+3HZNIpAI3P7XWsCnfx
	idYrV2Q3rZDzDYSukaIeTeH9JKU4r6unGtjar9lTEES71Lg/89TtYg==
X-Google-Smtp-Source: AGHT+IF2T3f9O9qjtqclgyS58v6QCU3GLIqz0gSoYo9VdSAYe3A0RZdRHYmeVfMMysrD0E+fiIWJEA==
X-Received: by 2002:a05:6a00:189a:b0:74a:d1ac:dd48 with SMTP id d2e1a72fcca58-74b515134f0mr1652129b3a.23.1751425971789;
        Tue, 01 Jul 2025 20:12:51 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 17/19] linux-yocto/6.12: update to v6.12.31
Date: Tue,  1 Jul 2025 20:12:02 -0700
Message-ID: <d4f31913b88272d45f09e382c092ddc88ba439dd.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219771

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    df3f6d10f353d Linux 6.12.31
    85fb1edd059bf drm/gem: Internally test import_attach for imported objects
    ee2a06bbbb8a0 x86/mm/init: Handle the special case of device private pages in add_pages(), to not increase max_pfn and trigger dma_addressing_limited() bounce buffers bounce buffers
    ae0d63ec39053 i3c: master: svc: Fix implicit fallthrough in svc_i3c_master_ibi_work()
    73c4707510f27 pinctrl: tegra: Fix off by one in tegra_pinctrl_get_group()
    ecb9d3123bef7 watchdog: aspeed: fix 64-bit division
    c3e1091eb054c drm/amdkfd: Correct F8_MODE for gfx950
    a8a34fbf915dd serial: sh-sci: Save and restore more registers
    80eb73778deba bpf: abort verification if env->cur_state->loop_entry != NULL
    fdee1dc816b4c drm/amd/display: Exit idle optimizations before accessing PHY
    dd8a734155ae2 kbuild: Properly disable -Wunterminated-string-initialization for clang
    3f856d5d84467 Fix mis-uses of 'cc-option' for warning disablement
    d66cf772bebd7 gcc-15: disable '-Wunterminated-string-initialization' entirely for now
    9f58537e9b8f0 gcc-15: make 'unterminated string initialization' just a warning
    d28b0305f711e err.h: move IOMEM_ERR_PTR() to err.h
    96537d8c67e5e spi: spi-fsl-dspi: Reset SR flags before sending a new message
    b1781bd47e6d4 spi: spi-fsl-dspi: Halt the module after a new message transfer
    b9fbbcf61e7c7 spi: spi-fsl-dspi: restrict register range for regmap access
    1d45e0170cf00 spi: use container_of_cont() for to_spi_device()
    92f077ff52f28 platform/x86: think-lmi: Fix attribute name usage for non-compliant items
    5c54a557bde18 ksmbd: fix stream write failure
    544ff7fb19727 Revert "arm64: dts: allwinner: h6: Use RSB for AXP805 PMIC connection"
    111a892a235d5 Bluetooth: btmtksdio: Do close if SDIO card removed without close
    3e0dc2b4f678c Bluetooth: btmtksdio: Check function enabled before doing close
    fedd2a1443600 nilfs2: fix deadlock warnings caused by lock dependency in init_nilfs()
    483ac74183e1e mm: vmalloc: only zero-init on vrealloc shrink
    94efb0d656902 mm: vmalloc: actually use the in-place vrealloc region
    9f9517f156866 mm: mmap: map MAP_STACK to VM_NOHUGEPAGE only if THP is enabled
    9da33ce1142b5 mm/page_alloc.c: avoid infinite retries caused by cpuset race
    314bf771cb87c memcg: always call cond_resched() after fn()
    9b8263cae64a6 highmem: add folio_test_partial_kmap()
    cb9a1019a63fe Input: xpad - add more controllers
    7c220f89add8e Revert "drm/amd: Keep display off while going into S4"
    b4f801e8cfcc1 smb: client: Reset all search buffer pointers when releasing buffer
    56b06539b6782 arm64: dts: marvell: uDPU: define pinctrl state for alarm LEDs
    9bea368648ac4 smb: client: Fix use-after-free in cifs_fill_dirent
    dc9bdfb9b0286 drm/edid: fixed the bug that hdr metadata was not reset
    56081f5d14c67 thermal: intel: x86_pkg_temp_thermal: Fix bogus trip temperature
    8594a123cfa23 platform/x86: dell-wmi-sysman: Avoid buffer overflow in current_password_store()
    e78908caf17cb pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id()
    0ae82a7abff8f pmdomain: renesas: rcar: Remove obsolete nullify checks
    a6ddbf9ae7884 vmxnet3: update MTU after device quiesce
    ba689e089369d net: dsa: microchip: linearize skb for tail-tagging switches
    352fbde14177d can: kvaser_pciefd: Fix echo_skb race
    8654c8a0528d0 can: kvaser_pciefd: Continue parsing DMA buf after dropped RX
    80702f002b136 llc: fix data loss when reading from a socket in llc_ui_recvmsg()
    4e22325b98245 ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14ASP10
    bf85e49aaf3a3 ALSA: pcm: Fix race of buffer access at PCM OSS layer
    799d48c95f9b6 ASoC: SOF: ipc4-pcm: Delay reporting is only supported for playback direction
    20e3fa3b7df9d ASoc: SOF: topology: connect DAI to a single DAI link
    6a62b917fb55b ASoC: SOF: Intel: hda-bus: Use PIO mode on ACE2+ platforms
    964d355832700 ASoC: SOF: ipc4-control: Use SOF_CTRL_CMD_BINARY as numid for bytes_ext
    63567ecd99a24 can: bcm: add missing rcu read protection for procfs content
    cc55dd28c20a6 can: bcm: add locking for bcm_op runtime updates
    adb05149a9055 can: slcan: allow reception of short error messages
    5300e487487d7 padata: do not leak refcount in reorder_work
    2f45a8d64fb4e crypto: algif_hash - fix double free in hash_accept
    bcb1c946c761d clk: s2mps11: initialise clk_hw_onecell_data::num before accessing ::hws[] in probe()
    4a7261089d1aa octeontx2-af: Fix APR entry mapping based on APR_LMT_CFG
    92b04bac366f0 octeontx2-af: Set LMT_ENA bit for APR table entries
    689a205cd968a net/tipc: fix slab-use-after-free Read in tipc_aead_encrypt_done
    41678d7222850 octeontx2-pf: Add AF_XDP non-zero copy support
    49b21795b8e56 sch_hfsc: Fix qlen accounting bug when using peek in hfsc_enqueue()
    0a2422f97651c idpf: fix idpf_vport_splitq_napi_poll()
    873ebaf3c1113 io_uring: fix overflow resched cqe reordering
    845ef0462ac70 net: lan743x: Restore SGMII CTRL register on resume
    8e4fd8e76dd7e net: dwmac-sun8i: Use parsed internal PHY address instead of 1
    3e79182c82a11 pinctrl: qcom: switch to devm_register_sys_off_handler()
    cd7f022296972 loop: don't require ->write_iter for writable files in loop_configure
    f6f5e9c8cb680 idpf: fix null-ptr-deref in idpf_features_check
    8c3b8ace9ce4a ice: Fix LACP bonds without SRIOV environment
    7191b69eae0f5 ice: fix vf->num_mac count with port representors
    233a227a317b0 bridge: netfilter: Fix forwarding of fragmented packets
    0b7d3e782027a ptp: ocp: Limit signal/freq counts in summary output functions
    6a1f9a709a616 Bluetooth: btusb: use skb_pull to avoid unsafe access in QCA dump handling
    1e8b7e96f71fe Bluetooth: L2CAP: Fix not checking l2cap_chan security level
    ca51db2316676 perf/x86/intel: Fix segfault with PEBS-via-PT with sample_freq
    1c1fb885e5885 irqchip/riscv-imsic: Start local sync timer on correct CPU
    2b49e68360eb6 ASoC: SOF: Intel: hda: Fix UAF when reloading module
    4a39fbffad5cd devres: Introduce devm_kmemdup_array()
    7207effe4743f driver core: Split devres APIs to device/devres.h
    ae344b9f842d9 dmaengine: fsl-edma: Fix return code for unhandled interrupts
    d31daa83efbab dmaengine: idxd: Fix ->poll() return value
    252f78a9317ac xfrm: Sanitize marks before insert
    ae5e975a46e26 clk: sunxi-ng: d1: Add missing divider for MMC mod clocks
    090aa8d51ec6c remoteproc: qcom_wcnss: Fix on platforms without fallback regulators
    447c8f0c06190 kernel/fork: only call untrack_pfn_clear() on VMAs duplicated for fork()
    7f5dc43b46205 x86/sev: Fix operator precedence in GHCB_MSR_VMPL_REQ_LEVEL macro
    d91576a2321d7 dmaengine: idxd: Fix allowing write() from different address spaces
    b1a687eb15bcf xfrm: Fix UDP GRO handling for some corner cases
    9cbca30102028 espintcp: remove encap socket caching to avoid reference leak
    28756f22de48d espintcp: fix skb leaks
    153bc79b5d02c soundwire: bus: Fix race on the creation of the IRQ domain
    8cafd7266fa02 __legitimize_mnt(): check for MNT_SYNC_UMOUNT should be under mount_lock
    a0c50c9f9c912 drm/amd/display: Call FP Protect Before Mode Programming/Mode Support
    211f589206459 xenbus: Allow PVH dom0 a non-local xenstore
    5a8d073d87da4 x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST or Rust >= 1.88
    b8581b4e4d96e wifi: iwlwifi: add support for Killer on MTL
    1645fc1849ef0 block: only update request sector if needed
    511ea82e344e0 tools: ynl-gen: validate 0 len strings from kernel
    6e9770de02496 btrfs: avoid NULL pointer dereference if no valid csum tree
    230c94ca3527d btrfs: handle empty eb->folios in num_extent_folios()
    7f7c8c03feba5 btrfs: correct the order of prelim_ref arguments in btrfs__prelim_ref
    92dff981dddff btrfs: compression: adjust cb->compressed_folios allocation type
    5926bc887da2f ASoC: intel/sdw_utils: Add volume limit to cs42l43 speakers
    6b1a9a7647097 cifs: Fix changing times and read-only attr over SMB1 smb_set_file_info() function
    0a9920e1ff67d cifs: Fix and improve cifs_query_path_info() and cifs_query_file_info()
    ad3e83a6c8033 io_uring/fdinfo: annotate racy sq/cq head/tail reads
    ec462449f4cf6 nvmet-tcp: don't restore null sk_state_change
    6a09b6bad09a6 ALSA: usb-audio: Fix duplicated name in MIDI substream names
    6d196cae4b0b2 nvme-pci: add quirks for WDC Blue SN550 15b7:5009
    ff214b079d55e nvme-pci: add quirks for device 126f:1001
    35ec11b38588c ALSA: hda/realtek: Add quirk for HP Spectre x360 15-df1xxx
    8f76431c00b2d ASoC: Intel: bytcr_rt5640: Add DMI quirk for Acer Aspire SW3-013
    63affdae7ff49 ASoC: cs42l43: Disable headphone clamps during type detection
    4c7a0425fb620 platform/x86: ideapad-laptop: add support for some new buttons
    2418bf5d383fa platform/x86: asus-wmi: Disable OOBE state after resume from hibernation
    00fe4c0e46959 platform/x86/intel: hid: Add Pantherlake support
    aa000a4ee9897 smb: server: smb2pdu: check return value of xa_store()
    c134c62b9e97b pinctrl: meson: define the pull up/down resistor value as 60 kOhm
    5863bd44ed2fa book3s64/radix: Fix compile errors when CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP=n
    b5aa85b9b0c4c ASoC: imx-card: Adjust over allocation of memory in imx_card_parse_of()
    9fddd1f15465f drm: Add valid clones check
    08150a6c83a9a drm/panel-edp: Add Starry 116KHD024006
    aa52c70ae1322 drm/buddy: fix issue that force_merge cannot free all roots
    135105287781e drm/atomic: clarify the rules around drm_atomic_state->allow_modeset
    6ceef704e2bce drm/xe: Reject BO eviction if BO is bound to current VM
    650c1769cfe9d drm/xe/sa: Always call drm_suballoc_manager_fini()
    1cc37163730aa wifi: rtw89: coex: Separated Wi-Fi connecting event from Wi-Fi scan event
    c9db43696ed0e drm/xe: Do not attempt to bootstrap VF in execlists mode
    274ae1044bd2c drm/xe: Move suballocator init to after display init
    115360031be90 wifi: ath11k: Use dma_alloc_noncoherent for rx_tid buffer allocation
    e1fffcd1d75db drm/nouveau: fix the broken marco GSP_MSG_MAX_SIZE
    878ccaf79c95f drm: bridge: adv7511: fill stream capabilities
    fb0d82562c078 wifi: ath12k: Fix end offset bit definition in monitor ring descriptor
    bb2d55681ee70 wifi: ath12k: Fetch regdb.bin file from board-2.bin
    a3f6e4682f3d4 wifi: ath9k: return by of_get_mac_address
    331c0af96c034 drm/xe/pf: Reset GuC VF config when unprovisioning critical resource
    63780d7352f0f accel/qaic: Mask out SR-IOV PCI resources
    a1e3f2ea66c0d wifi: ath12k: fix ath12k_hal_tx_cmd_ext_desc_setup() info1 override
    ff56fbf50eff9 regulator: ad5398: Add device tree support
    697a6f8a91063 spi: zynqmp-gqspi: Always acknowledge interrupts
    c533839e0a48d wifi: rtw89: add wiphy_lock() to work that isn't held wiphy_lock() yet
    9e9e974915908 wifi: rtw88: Don't use static local variable in rtw8822b_set_tx_power_index_by_rate
    0b63d246248f5 wifi: rtl8xxxu: retry firmware download on error
    ff5c6e3d251ea clk: renesas: rzg2l-cpg: Refactor Runtime PM clock validation
    3a95341c65e4e perf/amd/ibs: Fix ->config to sample period calculation for OP PMU
    e225dbb03af65 perf/amd/ibs: Fix perf_ibs_op.cnt_mask for CurCnt
    46f1c2b508e33 firmware: arm_scmi: Relax duplicate name constraint across protocol ids
    ff84436446a02 bpftool: Fix readlink usage in get_fd_type
    c80b2d159c31f bpf: Use kallsyms to find the function name of a struct_ops's stub function
    c3fd672e6644a drm/ast: Find VBIOS mode from regular display size
    538a82168e52b dm vdo: use a short static string for thread name prefix
    f8b4edbcf3531 dm vdo indexer: prevent unterminated string warning
    0cc2aa7472085 irqchip/riscv-aplic: Add support for hart indexes
    a3300021d4875 ASoC: rt722-sdca: Add some missing readable registers
    67f7080cb30e5 ASoC: codecs: pcm3168a: Allow for 24-bit in provider mode
    b99c2faf40215 arm64: zynqmp: add clock-output-names property in clock nodes
    9e3eaf7f750e1 HID: usbkbd: Fix the bit shift number for LED_KANA
    b5a1ef646ce13 wifi: ath12k: Avoid napi_sync() before napi_enable()
    dbb6efb3d8f34 scsi: st: Restore some drive settings after reset
    1be28b37a6a7b scsi: lpfc: Free phba irq in lpfc_sli4_enable_msi() when pci_irq_vector() fails
    609bc6e9c1869 scsi: lpfc: Ignore ndlp rport mismatch in dev_loss_tmo callbk
    c670902775c20 scsi: lpfc: Handle duplicate D_IDs in ndlp search-by D_ID routine
    f5ce5628576dd net/mana: fix warning in the writer of client oob
    7cc781374e20e drm/xe/relay: Don't use GFP_KERNEL for new transactions
    e2017f44c6d4a ice: count combined queues using Rx/Tx count
    887e39ac4704e perf: Avoid the read if the count is already updated
    d402437cde36c rcu: fix header guard for rcu_all_qs()
    fcabb696743a4 rcu: handle unstable rdp in rcu_read_unlock_strict()
    5cdaa970d73a4 rcu: handle quiescent states for PREEMPT_RCU=n, PREEMPT_COUNT=y
    65daba41f935e ice: treat dyn_allowed only as suggestion
    3c8b4657a6d75 ice: init flow director before RDMA
    58cdd1ee650b3 bridge: mdb: Allow replace of a host-joined group
    76e56dbe508b3 net: flush_backlog() small changes
    ba59747562c49 r8169: don't scan PHY addresses > 0
    ded26f9e4cdbe ipv4: ip_gre: Fix set but not used warning in ipgre_err() if IPv4-only
    a6644aeb8ddf1 vxlan: Annotate FDB data races
    61e931ee145ee cpufreq: amd-pstate: Remove unnecessary driver_lock in set_boost
    b82e496531c57 net/mlx5e: Avoid WARN_ON when configuring MQPRIO with HTB offload enabled
    91526279362d3 tools: ynl-gen: don't output external constants
    37c07516ac6a5 eth: fbnic: set IFF_UNICAST_FLT to avoid enabling promiscuous mode when adding unicast addrs
    d2b58a10228a9 drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI0
    91c53b8cd81ce media: qcom: camss: Add default case in vfe_src_pad_code
    85e0e03303390 media: qcom: camss: csid: Only add TPG v4l2 ctrl if TPG hardware is available
    1d15319323d84 f2fs: introduce f2fs_base_attr for global sysfs entries
    77818483460b5 hwmon: (xgene-hwmon) use appropriate type for the latency value
    c4092cb06398f tools/power turbostat: Clustered Uncore MHz counters should honor show/hide options
    247b420fea798 net: page_pool: avoid false positive warning if NAPI was never added
    b063f36a929a3 clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for some RCGs
    2368794c0cf41 wifi: rtw89: call power_on ahead before selecting firmware
    01edf9255f33d wifi: rtw89: fw: validate multi-firmware header before accessing
    f4c99c7b710b1 wifi: rtw89: fw: validate multi-firmware header before getting its size
    2eb2cfca35801 wifi: rtw89: coex: Assign value over than 0 to avoid firmware timer hang
    50f78100b9393 wifi: rtw88: Fix __rtw_download_firmware() for RTL8814AU
    1c564864438b2 wifi: rtw88: Fix download_firmware_validate() for RTL8814AU
    2a25d61107c6e ext4: remove writable userspace mappings before truncating page cache
    73733c2fdb378 ext4: don't write back data before punch hole in nojournal mode
    39255ab2edfb0 leds: trigger: netdev: Configure LED blink interval for HW offload
    16ddd67bb5579 pstore: Change kmsg_bytes storage size to u32
    556f53a8ec374 iio: adc: ad7944: don't use storagebits for sizing
    7fea5a914001a r8152: add vendor/device ID pair for Dell Alienware AW1022z
    9f2911868a733 ip: fib_rules: Fetch net from fib_rule in fib[46]_rule_configure().
    f9ab6efdee1ff arch/powerpc/perf: Check the instruction type before creating sample with perf_mem_data_src
    c2e02e2b21591 powerpc/pseries/iommu: create DDW for devices with DMA mask less than 64-bits
    9aeaf1956e75a powerpc/pseries/iommu: memory notifier incorrectly adds TCEs for pmemory
    701118e6f621f net: fec: Refactor MAC reset to function
    641ad8d64a08c wifi: mac80211: set ieee80211_prep_tx_info::link_id upon Auth Rx
    8315b79220d2d wifi: mac80211: remove misplaced drv_mgd_complete_tx() call
    26e384fafda89 wifi: mac80211: don't unconditionally call drv_mgd_complete_tx()
    8e1800f1db7eb wifi: iwlwifi: don't warn during reprobe
    15d8ceef9289f wifi: iwlwifi: use correct IMR dump variable
    4d8fd111e0f55 mptcp: pm: userspace: flags: clearer msg if no remote addr
    6a0997d78ffa3 wifi: ath12k: fix the ampdu id fetch in the HAL_RX_MPDU_START TLV
    06daedb4439bb xfrm: prevent high SEQ input in non-ESN mode
    bbd6dc1fb6c56 drm/v3d: Add clock handling
    e5a69d1696323 net/mlx5e: reduce the max log mpwrq sz for ECPF and reps
    74d153d8ec150 net/mlx5e: reduce rep rxq depth to 256 for ECPF
    af94d4f46c09a net/mlx5e: set the tx_queue_len for pfifo_fast
    a3a845ebc8f98 net/mlx5: Extend Ethtool loopback selftest to support non-linear SKB
    4a94ccac4930d net/mlx5: XDP, Enable TX side XDP multi-buffer support
    d4df87dae1444 scsi: target: spc: Fix loop traversal in spc_rsoc_get_descr()
    9acae6e987058 drm/amd/display/dm: drop hw_support check in amdgpu_dm_i2c_xfer()
    f5e9d0d206cbd drm/amdgpu: enlarge the VBIOS binary size limit
    7ef18e2ffdc12 drm/amdgpu: Use active umc info from discovery
    1bb46b5433a8a drm/amd/display: Populate register address for dentist for dcn401
    af3d57ea9ec74 drm/amd/display: Use Nominal vBlank If Provided Instead Of Capping It
    e55c5704b12ee drm/amd/display: Increase block_sequence array size
    17e40a52a1492 drm/amd/display: Initial psr_version with correct setting
    563adeeeb0ffa drm/amd/display: Update CR AUX RD interval interpretation
    47bfc7a02704f Revert "drm/amd/display: Exit idle optimizations before attempt to access PHY"
    45068cc170ebf drm/amd/display: Support multiple options during psr entry.
    4f4cb81def433 drm/amd/pm: Skip P2S load for SMU v13.0.12
    a25d045ebfbce drm/amdgpu: reset psp->cmd to NULL after releasing the buffer
    ed2039d840a12 drm/amd/display: Don't try AUX transactions on disconnected link
    a8726bee7046d drm/amd/display: pass calculated dram_speed_mts to dml2
    452807a863018 drm/amdgpu: Set snoop bit for SDMA for MI series
    5ca70518bc23d drm/amdkfd: fix missing L2 cache info in topology
    365d302ac763d drm/amdgpu/mes11: fix set_hw_resources_1 calculation
    11c7fa11fa076 net: stmmac: dwmac-loongson: Set correct {tx,rx}_fifo_size
    97dba4472e484 soundwire: cadence_master: set frame shape and divider based on actual clk freq
    c043867b654ec soundwire: amd: change the soundwire wake enable/disable sequence
    164c9f5edf2ae phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
    ef31dc41cf67b phy: core: don't require set_mode() callback for phy_get_mode() to work
    afb512502f2d7 phy: phy-rockchip-samsung-hdptx: Swap the definitions of LCPLL_REF and ROPLL_REF
    a507a213e82ca pinctrl: renesas: rzg2l: Add suspend/resume support for pull up/down
    5de11f82cbfd1 serial: sh-sci: Update the suspend/resume support
    e6e31b0182de5 sched: Reduce the default slice to avoid tasks getting an extra tick
    9c5f85b72fa6d x86/traps: Cleanup and robustify decode_bug()
    eb6fd16b4fc4f x86/ibt: Handle FineIBT in handle_cfi_failure()
    b870651021223 drm/xe/debugfs: Add missing xe_pm_runtime_put in wedge_mode_set
    cf126a14584e5 drm/xe/debugfs: fixed the return value of wedged_mode_set
    6469a2b1140d0 clk: qcom: clk-alpha-pll: Do not use random stack value for recalc rate
    328a2ec198e70 clk: qcom: ipq5018: allow it to be bulid on arm32
    01d28e67f567b drm/xe: Fix xe_tile_init_noalloc() error propagation
    884d64e8e4dc6 drm/xe: Stop ignoring errors from xe_ttm_stolen_mgr_init()
    50c5bbb45c7df net/mlx4_core: Avoid impossible mlx4_db_alloc() order value
    69689d1138c85 media: v4l: Memset argument to 0 before calling get_mbus_config pad op
    9a981079097be media: i2c: imx219: Correct the minimum vblanking value
    12aeff4944dc6 kunit: tool: Use qboot on QEMU x86_64
    8f5ce688c8318 smack: Revert "smackfs: Added check catlen"
    316f2911fb11a smack: recognize ipv4 CIPSO w/o categories
    5b1b4cb46d951 pinctrl: devicetree: do not goto err when probing hogs in pinctrl_dt_to_map
    c4260bf83b429 ASoC: soc-dai: check return value at snd_soc_dai_set_tdm_slot()
    2ea042779621d ASoC: tas2764: Power up/down amp on mute ops
    409c12ce79b33 ASoC: tas2764: Mark SW_RESET as volatile
    8d8083881ecbb ASoC: tas2764: Add reg defaults for TAS2764_INT_CLK_CFG
    000dd6e3441fc ASoC: ops: Enforce platform maximum on initial value
    83ea947238953 firmware: xilinx: Dont send linux address to get fpga config get status
    e1c4bb3774421 firmware: arm_ffa: Handle the presence of host partition in the partition info
    3a3fab1be5a0c firmware: arm_ffa: Reject higher major version as incompatible
    587386c56fb88 net/mlx5: Apply rate-limiting to high temperature warning
    c4e1ce22b9ab9 net/mlx5: Modify LSB bitmask in temperature event to include only the first bit
    3770acff3110f media: test-drivers: vivid: don't call schedule in loop
    2fe6284364423 irqchip/riscv-imsic: Set irq_set_affinity() for IMSIC base
    dc5f5c9d2bbc6 hrtimers: Replace hrtimer_clock_to_base_table with switch-case
    7f131fda2654e vxlan: Join / leave MC group after remote changes
    1fb8106316a21 ACPI: HED: Always initialize before evged
    82b54455b6b7f PCI: Fix old_size lower bound in calculate_iosize() too
    161cc125043a2 eth: mlx4: don't try to complete XDP frames in netpoll
    46ba5757a7a47 bpf: copy_verifier_state() should copy 'loop_entry' field
    2b129e89b8c6e bpf: don't do clean_live_states when state->loop_entry->branches > 0
    eaeb67bd851ce can: c_can: Use of_property_present() to test existence of DT property
    a89326d35bf6f pmdomain: imx: gpcv2: use proper helper for property detection
    3ccfdd5b33742 RDMA/core: Fix best page size finding when it can cross SG entries
    e6a46719a2369 serial: mctrl_gpio: split disable_ms into sync and no_sync APIs
    b14e726d57f61 drm/amd/display: Don't treat wb connector as physical in create_validate_stream_for_sink
    cee5d56fa783f Revert "drm/amd/display: Request HW cursor on DCN3.2 with SubVP"
    775f3afa6ade1 drm/amd/display: Read LTTPR ALPM caps during link cap retrieval
    1e826acee1165 drm/amd/display: Fix BT2020 YCbCr limited/full range input
    2bba67f03071a drm/amd/display: Guard against setting dispclk low when active
    b02b561bf7692 drm/amd/display: Add support for disconnected eDP streams
    94e6687ceda91 drm/amd/pm: Fetch current power limit from PMFW
    098788e118d1e irqchip/riscv-imsic: Separate next and previous pointers in IMSIC vector
    d85004266a32c eeprom: ee1004: Check chip before probing
    011a62d2d79ac mfd: axp20x: AXP717: Add AXP717_TS_PIN_CFG to writeable regs
    a82c0c3996771 i3c: master: svc: Flush FIFO before sending Dynamic Address Assignment(DAA)
    7d0c92af8d355 EDAC/ie31200: work around false positive build warning
    4593aaf48fc16 power: supply: axp20x_battery: Update temp sensor for AXP717 from device tree
    6b1d3e9db82d0 net: pktgen: fix access outside of user given buffer in pktgen_thread_write()
    d37783f25a3c8 wifi: rtw89: 8922a: fix incorrect STA-ID in EHT MU PPDU
    7dafba4e854cd wifi: rtw89: fw: add blacklist to avoid obsolete secure firmware
    6ffcf25e63226 wifi: rtw89: fw: get sb_sel_ver via get_unaligned_le32()
    1cbef396c5f3b wifi: rtw89: fw: propagate error code from rtw89_h2c_tx()
    a4523765fa3a9 wifi: rtw88: Fix rtw_desc_to_mcsrate() to handle MCS16-31
    adcc65afaa979 wifi: rtw88: Fix rtw_init_ht_cap() for RTL8814AU
    9a3f80a727aac wifi: rtw88: Fix rtw_init_vht_cap() for RTL8814AU
    1653c72dabfd6 scsi: mpt3sas: Send a diag reset if target reset fails
    b5038d313a3b7 PCI: epf-mhi: Update device ID for SA8775P
    0b21e99cf638b clocksource: mips-gic-timer: Enable counter when CPUs start
    1a3529f36f26e MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
    53f42776e435f genirq/msi: Store the IOMMU IOVA directly in msi_desc instead of iommu_cookie
    5111c2e0cf2b6 x86/locking: Use ALT_OUTPUT_SP() for percpu_{,try_}cmpxchg{64,128}_op()
    95b8f2b7d9312 drm/amdgpu: remove all KFD fences from the BO on release
    af706d0e279fc MIPS: Use arch specific syscall name match function
    9058b48578aea drm/xe/oa: Ensure that polled read returns latest data
    4d9fa2ebc01c4 net: ipv6: Init tunnel link-netns before registering dev
    897c98fb32801 crypto: skcipher - Zap type in crypto_alloc_sync_skcipher
    9f27b38771b05 crypto: ahash - Set default reqsize from ahash_alg
    562e512f6bf99 x86/kaslr: Reduce KASLR entropy on most x86 systems
    0bdaab17a2a17 net/mlx5: Change POOL_NEXT_SIZE define value and make it global
    d2d76fc02543a scsi: scsi_debug: First fixes for tapes
    b55a97d1bd408 dm: fix unconditional IO throttle caused by REQ_PREFLUSH
    2c600cbe33f20 libbpf: Fix out-of-bound read
    20a53c3689a20 loop: check in LO_FLAGS_DIRECT_IO in loop_default_blocksize
    5b62f941eae80 scsi: mpi3mr: Update timestamp only for supervisor IOCs
    a68686c08b70b net/mlx5e: Add correct match to check IPSec syndromes for switchdev mode
    c2aa6567a6a48 media: tc358746: improve calculation of the D-PHY timing registers
    bb8fb041cba26 media: adv7180: Disable test-pattern control on adv7180
    083383aba01f2 cpuidle: menu: Avoid discarding useful information
    0d508cefcd24a vdpa/mlx5: Fix mlx5_vdpa_get_config() endianness on big-endian machines
    6398dd09d50b4 vhost-scsi: Return queue full for page alloc failures during copy
    7eb29d704d276 x86/nmi: Add an emergency handler in nmi_desc & use it in nmi_shootdown_cpus()
    7bbfaa24c02f4 ASoC: mediatek: mt8188: Add reference for dmic clocks
    4a21b57d83c55 ASoC: mediatek: mt8188: Treat DMIC_GAINx_CUR as non-volatile
    6e5935b755b4a drm/amd/display: Fix mismatch type comparison
    990e4fb37bcd4 drm/amd/display: fix dcn4x init failed
    54dd746ed8a30 drm/amd/display: handle max_downscale_src_width fail check
    5cab1de0cea28 x86/build: Fix broken copy command in genimage.sh when making isoimage
    de48b82dcf583 Octeontx2-af: RPM: Register driver with PCI subsys IDs
    673dde8d3c3ec bpf: Search and add kfuncs in struct_ops prologue and epilogue
    06100e642f4b8 soc: ti: k3-socinfo: Do not use syscon helper to build regmap
    54ef1a89e287e wifi: ath12k: Improve BSS discovery with hidden SSID in 6 GHz band
    e39fd41117bd9 bonding: report duplicate MAC address in all situations
    f872f7aaa4cac net: xgene-v2: remove incorrect ACPI_PTR annotation
    459b3f7cf0dcf net: ethernet: mtk_ppe_offload: Allow QinQ, double ETH_P_8021Q only
    562b4f70bf88a leds: pwm-multicolor: Add check for fwnode_property_read_u32
    b8fcb1cdbfc0c drm/xe: xe_gen_wa_oob: replace program_invocation_short_name
    0d8562e358176 drm/amdkfd: KFD release_work possible circular locking
    1dd943dfb56f8 pinctrl: sophgo: avoid to modify untouched bit when setting cv1800 pinconf
    baaf3084c2cb9 selftests/net: have `gro.sh -t` return a correct exit code
    11e721443c564 net/mlx5: Avoid report two health errors on same syndrome
    1f512005f497d drm/xe/pf: Create a link between PF and VF devices
    df888ad55f8f8 drm/xe/vf: Retry sending MMIO request to GUC on timeout error
    3a3efeef64364 firmware: arm_ffa: Set dma_mask for ffa devices
    12153e3948c59 PCI: brcmstb: Add a softdep to MIP MSI-X driver
    3ffaa2e999380 PCI: brcmstb: Expand inbound window size up to 64GB
    7add9c10ca284 wifi: ath12k: Report proper tx completion status to mac80211
    1c2c538bbd602 soc: apple: rtkit: Implement OSLog buffers properly
    92c6687ba951f soc: apple: rtkit: Use high prio work queue
    e359d62886cb1 perf: arm_pmuv3: Call kvm_vcpu_pmu_resync_el0() before enabling counters
    b38fbf98645be fpga: altera-cvp: Increase credit timeout
    7857d8977e986 drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
    89800836bf32f ARM: at91: pm: fix at91_suspend_finish for ZQ calibration
    cd62e9d42fe76 hwmon: (gpio-fan) Add missing mutex locks
    e7e30a4a37d1e x86/bugs: Make spectre user default depend on MITIGATION_SPECTRE_V2
    0d232fa3b0769 clk: imx8mp: inform CCF of maximum frequency of clocks
    2d6231d5ce9b6 media: uvcvideo: Handle uvc menu translation inside uvc_get_le_value
    b98aad5e5ebf9 media: uvcvideo: Add sanity check to uvc_ioctl_xu_ctrl_map
    82209faa87f4a ublk: complete command synchronously on error
    564f03a7970c2 block: mark bounce buffering as incompatible with integrity
    f7226dedac039 drm/rockchip: vop2: Add uv swap for cluster window
    f33b310eac36a ipv4: fib: Move fib_valid_key_len() to rtm_to_fib_config().
    3de322a98b365 scsi: logging: Fix scsi_logging_level bounds
    500d22dbd9662 ALSA: hda/realtek: Enable PC beep passthrough for HP EliteBook 855 G7
    592ba27580364 perf/hw_breakpoint: Return EOPNOTSUPP for unsupported breakpoint type
    f9d15ef2e069d net: pktgen: fix mpls maximum labels list parsing
    8d7e13c31c526 media: imx335: Set vblank immediately
    4176d6f2a67b8 iommufd: Disallow allocating nested parent domain with fault ID
    af73c8fd7388d ublk: enforce ublks_max only for unprivileged devices
    c4f025a58eef1 dpll: Add an assertion to check freq_supported_num
    ebaed867bfd1e net: phy: nxp-c45-tja11xx: add match_phy_device to TJA1103/TJA1104
    94df9fd015ace net: ethernet: ti: cpsw_new: populate netdev of_node
    1a4a834f2af5b rcu: Fix get_state_synchronize_rcu_full() GP-start detection
    5aba8ac434d8b pinctrl: bcm281xx: Use "unsigned int" instead of bare "unsigned"
    4731d5328f507 media: cx231xx: set device_caps for 417
    f29c876d72d71 perf/core: Clean up perf_try_init_event()
    cc714c89ef5a9 drm/amd/display: Request HW cursor on DCN3.2 with SubVP
    1f2b3ea00717f drm/amd/display: Fix p-state type when p-state is unsupported
    e015cef8b78f6 drm/amd/display: Fix DMUB reset sequence for DCN401
    682c4226f317e drm/amd/display: Skip checking FRL_MODE bit for PCON BW determination
    5bf0fd2bd5efb drm/amd/display: Ensure DMCUB idle before reset on DCN31/DCN35
    a23f3910123b5 drm/amdgpu: Do not program AGP BAR regs under SRIOV in gfxhub_v1_0.c
    69bb5b3ae3480 remoteproc: qcom_wcnss: Handle platforms with only single power domain
    95080412e9304 blk-throttle: don't take carryover for prioritized processing of metadata
    c4525b513de39 net: phylink: use pl->link_interface in phylink_expects_phy()
    93f581d7634ff drm/gem: Test for imported GEM buffers with helper
    cd918ec24168f orangefs: Do not truncate file size
    6ad0673ab24f0 soc: mediatek: mtk-mutex: Add DPI1 SOF/EOF to MT8188 mutex tables
    cc80a5cc52093 dm cache: prevent BUG_ON by blocking retries on failed device resumes
    1c171908807cb usb: xhci: set page size to the xHCI-supported size
    5520fed18df86 media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
    25056d1fe57eb ARM: tegra: Switch DSI-B clock parent to PLLD on Tegra114
    8fc16414c3ef7 soc: samsung: include linux/array_size.h where needed
    4943c0bae1248 drm/xe: Retry BO allocation
    623669ae7a820 drm/xe: Nuke VM's mapping upon close
    a3642d2d73a97 ieee802154: ca8210: Use proper setters and getters for bitwise types
    3afa1610e5a4e rtc: ds1307: stop disabling alarms on probe
    73d01bcbf2aad tcp: bring back NUMA dispersion in inet_ehash_locks_alloc()
    a06861298554b ALSA: seq: Improve data consistency at polling
    515a21a5e19ab powerpc/prom_init: Fixup missing #size-cells on PowerBook6,7
    09193145d1180 arm64: tegra: Resize aperture for the IGX PCIe C5 slot
    2f0044e20fab1 arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
    ecaa856227ae4 drm/amdgpu: Fix missing drain retry fault the last entry
    c700730d816d6 drm/amdkfd: Set per-process flags only once cik/vi
    e1901e8e6bbc4 drm/amdkfd: Set per-process flags only once for gfx9/10/11/12
    6a1706dfe0569 crypto: mxs-dcp - Only set OTP_KEY bit for OTP key
    7caad075acb63 crypto: lzo - Fix compression buffer overrun
    f615e8d2dec67 misc: pci_endpoint_test: Give disabled BARs a distinct error code
    fe2329eff5bee PCI: endpoint: pci-epf-test: Fix double free that causes kernel to oops
    1e0398a349e85 watchdog: aspeed: Update bootstatus handling
    d95fdee2253e6 cpufreq: tegra186: Share policy per cluster
    11be3d3f956ba iommu/amd/pgtbl_v2: Improve error handling
    9032252905664 coresight-etb10: change etb_drvdata spinlock's type to raw_spinlock_t
    75ae2a3553611 badblocks: Fix a nonsense WARN_ON() which checks whether a u64 variable < 0
    7bd6061b0a44b ASoC: qcom: sm8250: explicitly set format in sm8250_be_hw_params_fixup()
    84c069dc5fc89 auxdisplay: charlcd: Partially revert "Move hwidth and bwidth to struct hd44780_common"
    53ce754286180 gfs2: Check for empty queue in run_queue
    ff11cd673e477 drm/amd/display: Fix incorrect DPCD configs while Replay/PSR switch
    ed7eda66b20cb drm/amd/display: not abort link train when bw is low
    83e4f1de0802b drm/amd/display: calculate the remain segments for all pipes
    65e51bc2803bb drm/amd/display: remove minimum Dispclk and apply oem panel timing.
    c1502fc84d1c6 ipv6: save dontfrag in cork
    faba68a86ab79 wifi: cfg80211: allow IR in 20 MHz configurations
    22d8cc7f5d5a9 wifi: mac80211_hwsim: Fix MLD address translation
    07709d31829fd wifi: mac80211: fix warning on disconnect during failed ML reconf
    a791a6bf02c49 wifi: iwlwifi: fix the ECKV UEFI variable name
    7ce37a3ca0907 wifi: iwlwifi: mark Br device not integrated
    181e8b56b74ad wifi: iwlwifi: fix debug actions order
    1c55feb63827f wifi: iwlwifi: w/a FW SMPS mode selection
    0446d34a853d9 wifi: iwlwifi: don't warn when if there is a FW error
    101a3b9920a79 printk: Check CON_SUSPEND when unblanking a console
    063ad8885c7c6 iommu: Keep dev->iommu state consistent
    a21f1607d0b3c hwmon: (dell-smm) Increment the number of fans
    aef1b639ae2a8 wifi: iwlwifi: mvm: fix setting the TK when associated
    3a75fe58a164a usb: xhci: Don't change the status of stalled TDs on failed Stop EP
    28306c58daf81 mmc: sdhci: Disable SD card clock before changing parameters
    38828e0dc771c mmc: dw_mmc: add exynos7870 DW MMC support
    8ad58a7eba6db arm64/mm: Check PUD_TYPE_TABLE in pud_bad()
    6215143ad372d arm64/mm: Check pmd_table() in pmd_trans_huge()
    4f89f257f32da phy: rockchip: usbdp: Only verify link rates/lanes/voltage when the corresponding set flags are set
    236a87e9d2110 PNP: Expand length of fixup id string
    21153e0974fcc netfilter: conntrack: Bound nf_conntrack sysctl writes
    4210174827586 wifi: rtw89: set force HE TB mode when connecting to 11ax AP
    3fb9ee05ec15f timer_list: Don't use %pK through printk()
    6e816a97fa840 net: hsr: Fix PRP duplicate detection
    f933879c5b6a6 net: stmmac: dwmac-rk: Validate GRF and peripheral GRF during probe
    ae22452d15c89 posix-timers: Ensure that timer initialization is fully visible
    d0dc233fe2241 posix-timers: Add cond_resched() to posix_timer_add() search loop
    135dde13b96d5 RDMA/uverbs: Propagate errors from rdma_lookup_get_uobject()
    785ac69911332 ext4: do not convert the unwritten extents if data writeback fails
    2f5f326214321 ext4: reject the 'data_err=abort' option in nojournal mode
    3039f0c9c7554 clk: qcom: lpassaudiocc-sc7280: Add support for LPASS resets for QCM6490
    3673382803c51 ASoC: sun4i-codec: support hp-det-gpios property
    de3c09de746f7 drm/amdgpu: Update SRIOV video codec caps
    858425dc2df3e drm/amdgpu/gfx11: don't read registers in mqd init
    73d437ae63ce6 drm/amdgpu/gfx12: don't read registers in mqd init
    580750a317d7b mfd: tps65219: Remove TPS65219_REG_TI_DEV_ID check
    27b19f29c9a06 pinctrl-tegra: Restore SFSEL bit when freeing pins
    f5363ffdabc2a xen: Add support for XenServer 6.1 platform device
    8ef935698f3fd net/smc: use the correct ndev to find pnetid by pnetid table
    174dedce648aa dm: restrict dm device size to 2^63-512 bytes
    ee87fc3a1271f crypto: octeontx2 - suppress auth failure screaming due to negative tests
    572ed3fb99c4e kconfig: do not clear SYMBOL_VALID when reading include/config/auto.conf
    61d7c8a753445 kbuild: fix argument parsing in scripts/config
    555c0b713ca83 bpf: Allow pre-ordering for bpf cgroup progs
    6c303960b1443 ASoC: mediatek: mt6359: Add stub for mt6359_accdet_enable_jack_detect
    e8358aa00ea7b ASoC: pcm6240: Drop bogus code handling IRQ as GPIO
    0076b0423b2cd spi: spi-mux: Fix coverity issue, unchecked return value
    b35ccfdc8573e erofs: initialize decompression early
    c8c643809f4a1 thunderbolt: Do not add non-active NVM if NVM upgrade is disabled for retimer
    2585e6cbd96eb objtool: Fix error handling inconsistencies in check()
    a0d34b9be2bee rtc: rv3032: fix EERD location
    dab35f4921f85 tcp: reorganize tcp_in_ack_event() and tcp_count_delivered()
    50452704ecbad jbd2: do not try to recover wiped journal
    e2520cc19b758 PCI: dwc: Use resource start as ioremap() input in dw_pcie_pme_turn_off()
    e658f2d94a74c bpf: Return prog btf_id without capable check
    66e8f1d64b1b0 vfio/pci: Handle INTx IRQ_NOTCONNECTED
    0268f485aa69f scsi: st: ERASE does not change tape location
    c6d366f8d24ff scsi: st: Tighten the page format heuristics with MODE SELECT
    853a4e7439ef1 hypfs_create_cpu_files(): add missing check for hypfs_mkdir() failure
    94c3cbc69abbb ext4: reorder capability check last
    a55ebe30f17a0 riscv: Call secondary mmu notifier when flushing the tlb
    5cdd304662d54 bnxt_en: Query FW parameters when the CAPS_CHANGE bit is set
    34253084291cb wifi: mwifiex: Fix HT40 bandwidth issue.
    728945c962695 um: Update min_low_pfn to match changes in uml_reserved
    d6d2f664cbf3b um: Store full CSGSFS and SS register from mcontext
    7790a9449cf43 clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug
    39ff1903246aa dlm: make tcp still work in multi-link env
    f3ea633a111e0 s390/tlb: Use mm_has_pgste() instead of mm_alloc_pgste()
    1ea4653cff35c i3c: master: svc: Fix missing STOP for master request
    94206e0d72f7a drm/amdgpu: adjust drm_firmware_drivers_only() handling
    85bda883a634c drm/amd/display: Guard against setting dispclk low for dcn31x
    ca8fcb8bcef33 drm/amdgpu: release xcp_mgr on exit
    a5a507fa5f223 blk-cgroup: improve policy registration error handling
    c60f8684a8118 btrfs: send: return -ENAMETOOLONG when attempting a path that is too long
    c4845a09a1edd btrfs: get zone unusable bytes while holding lock at btrfs_reclaim_bgs_work()
    0058c61d47ee1 btrfs: fix non-empty delayed iputs list on unmount due to async workers
    8629f9d9a92e8 btrfs: run btrfs_error_commit_super() early
    a4840945f514c btrfs: avoid linker error in btrfs_find_create_tree_block()
    1144874b41dcd btrfs: make btrfs_discard_workfn() block_group ref explicit
    477a412a2f6cc i2c: pxa: fix call balance of i2c->clk handling routines
    3b9cf1c0fafa2 i2c: qup: Vote for interconnect bandwidth to DRAM
    c6f2694c580c2 x86/mm: Check return value from memblock_phys_alloc_range()
    d0f9875257440 x86/microcode: Update the Intel processor flag scan check
    8973fb71c9269 x86/smpboot: Fix INIT delay assignment for extended Intel Families
    44e041675383b x86/stackprotector/64: Only export __ref_stack_chk_guard on CONFIG_SMP
    63b7dade892b6 x86/headers: Replace __ASSEMBLY__ with __ASSEMBLER__ in UAPI headers
    ac3af695c4b00 wifi: mt76: mt7925: fix fails to enter low power mode in suspend state
    8b526e4d944ae wifi: mt76: mt7925: load the appropriate CLC data based on hardware type
    c9c64da88e38d wifi: mt76: mt7996: revise TXS size
    1d58321192052 wifi: mt76: mt7996: fix SER reset trigger on WED reset
    fa6c05122fb82 wifi: mt76: only mark tx-status-failed frames as ACKed on mt76x0/2
    8f82cf305efd6 cgroup/rstat: avoid disabling irqs for O(num_cpu)
    dca76ee1f02ae drm/amdgpu: Skip pcie_replay_count sysfs creation for VF
    67bb2175095eb mmc: host: Wait for Vdd to settle on card power off
    4005036642a27 staging: vchiq_arm: Create keep-alive thread during probe
    123bcd8f42b7e pidfs: improve multi-threaded exec and premature thread-group leader exit polling
    1d1e1efad1cf0 libnvdimm/labels: Fix divide error in nd_label_data_init()
    37ac2434aae16 ext4: on a remount, only log the ro or r/w state when it has changed
    3e10592b477ec xen/pci: Do not register devices with segments >= 0x10000
    2a8bedeb963f0 PCI: vmd: Disable MSI remapping bypass under Xen
    8b80fd3f76f2a drm/amdkfd: set precise mem ops caps to disabled for gfx 11 and 12
    98e38fe7d3557 drm/amdgpu/discovery: check ip_discovery fw file available
    1630224189cc4 pNFS/flexfiles: Report ENETDOWN as a connection error
    a1596965a7c82 tools/build: Don't pass test log files to linker
    2780aa8394415 r8169: disable RTL8126 ZRX-DC timeout
    e63b634806a1d PCI: dwc: ep: Ensure proper iteration over outbound map windows
    c0c59a1f77665 objtool: Properly disable uaccess validation
    ac30595154da0 lockdep: Fix wait context check on softirq for PREEMPT_RT
    44b79041c44ae dql: Fix dql->limit value when reset.
    f48ee562c095e Bluetooth: Disable SCO support if READ_VOICE_SETTING is unsupported/broken
    7ec409ee15ac1 Bluetooth: btmtksdio: Prevent enabling interrupts after IRQ handler removal
    7cfde2a482800 thermal/drivers/qoriq: Power down TMU on system suspend
    c347928320080 thermal/drivers/mediatek/lvts: Start sensor interrupts disabled
    7b32d4e62c871 net: tn40xx: create swnode for mdio and aqr105 phy and add to mdiobus
    b07ba838aded8 net: tn40xx: add pci-id of the aqr105-based Tehuti TN4010 cards
    9e542640c2e59 mctp: Fix incorrect tx flow invalidation condition in mctp-i2c
    c0d63ee0dd063 ASoC: codecs: wsa883x: Correct VI sense channel mask
    780699001b8e2 ASoC: codecs: wsa884x: Correct VI sense channel mask
    ace57bd1fb49d spi-rockchip: Fix register out of bounds access
    dac9e6af5328f SUNRPC: rpcbind should never reset the port to the value '0'
    984d8a392f6b3 SUNRPC: rpc_clnt_set_transport() must not change the autobind setting
    71e07bb1556c7 NFSv4: Treat ENETUNREACH errors as fatal for state recovery
    1e317f5781160 cifs: Fix establishing NetBIOS session for SMB2+ connection
    51d44dba94e79 cifs: add validation check for the fields in smb_aces
    15c961d7a9e5f cifs: Set default Netbios RFC1001 server name to hostname in UNC
    ff968e486e420 fbdev: core: tileblit: Implement missing margin clearing for tileblit
    8c912c0a6860c fbcon: Use correct erase colour for clearing in fbcon
    230abe5d3f68b fbdev: fsl-diu-fb: add missing device_remove_file()
    6427b5c0f0aae riscv: Allow NOMMU kernels to access all of RAM
    15787ab82a461 mailbox: use error ret code of of_parse_phandle_with_args()
    2c80f975e94d5 mailbox: pcc: Use acpi_os_ioremap() instead of ioremap()
    2d21895e77c64 tpm: Convert warn to dbg in tpm2_start_auth_session()
    2eb8f4701961b ACPI: PNP: Add Intel OC Watchdog IDs to non-PNP device list
    4f427ca9edf89 tracing: Mark binary printing functions with __printf() attribute
    b4c11dd41c40c iommufd: Extend IOMMU_GET_HW_INFO to report PASID capability
    e506751b7dd98 arm64: Add support for HIP09 Spectre-BHB mitigation
    1a9b696a003ae SUNRPC: Don't allow waiting for exiting tasks
    ac83bf58f6876 NFS: Don't allow waiting for exiting tasks
    46a47dc10fa78 NFSv4: Check for delegation validity in nfs_start_delegation_return_locked()
    01677e7ee12f2 io_uring/msg: initialise msg request opcode
    bab0bd138910e exfat: call bh_read in get_block only when necessary
    d40ca27602eab fuse: Return EPERM rather than ENOSYS from link()
    c9a508b6bbd2f smb: client: Store original IO parameters and prevent zero IO sizes
    150f38eddefc4 cifs: Fix negotiate retry functionality
    0705b6d5bc328 cifs: Fix querying and creating MF symlinks over SMB1
    6ebb9d54eccc8 cifs: Add fallback for SMB2 CREATE without FILE_READ_ATTRIBUTES
    100b452e0eeda s390/vfio-ap: Fix no AP queue sharing allowed message written to kernel log
    c42f740a07eea x86/fred: Fix system hang during S4 resume with FRED enabled
    192b02f8c7ba8 kconfig: merge_config: use an empty file as initfile
    dac9d6ad5eaf7 samples/bpf: Fix compilation failure for samples/bpf on LoongArch Fedora
    8014d3e56ec0c bpf: fix possible endless loop in BPF map iteration
    218c838d0356a io_uring: don't duplicate flushing in io_req_post_cqe
    64f505b08e0cf block: fix race between set_blocksize and read paths
    e9f646f089bc3 selftests/bpf: Mitigate sockmap_ktls disconnect_after_delete failure
    cd39fae34f094 drm/amdgpu: Allow P2P access through XGMI
    36cb568f559ad drm/amd/display: Enable urgent latency adjustment on DCN35
    9ece099e951a5 fs/ext4: use sleeping version of sb_find_get_block()
    f1c5aa614b5c2 fs/jbd2: use sleeping version of __find_get_block()
    aafc270531431 fs/ocfs2: use sleeping version of __find_get_block()
    a49a4a87cea36 fs/buffer: use sleeping version of __find_get_block()
    e138fc2316c32 fs/buffer: introduce sleeping flavors for pagecache lookups
    4f5553a08fb74 fs/buffer: split locking for pagecache lookups
    836917e7a65cd ima: process_measurement() needlessly takes inode_lock() on MAY_READ
    e22034cbee52b dma-mapping: Fix warning reported for missing prototype
    7f7f70c316976 net: enetc: refactor bulk flipping of RX buffers to separate function
    523c08f630a3d scsi: mpi3mr: Add level check to control event logging
    bd8c9404e44ad vhost-scsi: protect vq->log_used with vq->mutex
    f93675793bdcd vhost_task: fix vhost_task_create() documentation
    97edaa0ec64c5 cgroup: Fix compilation issue due to cgroup_mutex not being exported
    3eec42a17ad4d dma-mapping: avoid potential unused data compilation warning
    a8dd6b7b391d9 mei: vsc: Use struct vsc_tp_packet as vsc-tp tx_buf and rx_buf type
    de8c0b93a63cf intel_th: avoid using deprecated page->mapping, index fields
    299881317756d dma/mapping.c: dev_dbg support for dma_addressing_limited
    b730cb109633c virtio_ring: Fix data race by tagging event_triggered as racy for KCSAN
    7aea1517fb6c9 scsi: ufs: Introduce quirk to extend PA_HIBERN8TIME for UFS devices
    87389bff743c5 scsi: target: iscsi: Fix timeout on deleted connection
    1603a34b80ffb nvmem: qfprom: switch to 4-byte aligned reads
    410f8b72e02c6 nvmem: core: update raw_len if the bit reading is required
    4327479e559c0 nvmem: core: verify cell's raw_len
    a4f865ecdbdd2 nvmem: core: fix bit offsets of more than one byte
    d6abe0f6ade98 nvmem: rockchip-otp: add rk3576 variant data
    49b4e88b559cd nvmem: rockchip-otp: Move read-offset into variant-data
    3fc60952271b6 cpufreq: Add SM8650 to cpufreq-dt-platdev blocklist
    c000fc26c431e phy: renesas: rcar-gen3-usb2: Assert PLL reset on PHY power off
    918d43686271e phy: renesas: rcar-gen3-usb2: Lock around hardware registers and driver data
    64cf5b896fd39 phy: renesas: rcar-gen3-usb2: Move IRQ request in probe
    0abae7dc42f21 i2c: designware: Fix an error handling path in i2c_dw_pci_probe()
    0d1002c60cd47 i2c: designware: Use temporary variable for struct device
    4fa55c5230f4c drm/amd/display: Defer BW-optimization-blocked DRR adjustments
    5f05863810cfd drm/amd/display: Correct timing_adjust_pending flag setting.
    839b2350b861f drm/amd/display: Do not enable replay when vtotal update is pending.
    892f054b3fa2a drm/amd/display: Configure DTBCLK_P with OPTC only for dcn401

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fdb0a51598156f99aa91f7495d7eada92a459e97)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 2088717489..1f61008bd6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3d3d56a846c993611859096016322dccea1317cd"
-SRCREV_meta ?= "3a5fec1707626251d69b7548f024856d838cc7db"
+SRCREV_machine ?= "4127c6137af28c2c91ec79acee60fe4d4d70db9b"
+SRCREV_meta ?= "f2f3b6cbd91743920e2cb55998c53326855b2e9c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.30"
+LINUX_VERSION ?= "6.12.31"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 90a00f7cd5..d92862a426 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.30"
+LINUX_VERSION ?= "6.12.31"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_meta ?= "3a5fec1707626251d69b7548f024856d838cc7db"
+SRCREV_machine ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
+SRCREV_meta ?= "f2f3b6cbd91743920e2cb55998c53326855b2e9c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 52ffb9882f..4ecb8276ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5c1cc01b780f83de6f9c0bacf45ffa2de68be95c"
-SRCREV_machine:qemuarm64 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_machine:qemuloongarch64 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_machine:qemumips ?= "87d7d289ec3d56a1bd1d7a7c7cb46af8cf6c0f27"
-SRCREV_machine:qemuppc ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_machine:qemuriscv64 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_machine:qemuriscv32 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_machine:qemux86 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_machine:qemux86-64 ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_machine:qemumips64 ?= "98a85ed93bd5eaefe30c4aa3f7c15549be2bd032"
-SRCREV_machine ?= "0898369ce44f92eba60ae9bf0013bc4338ce840e"
-SRCREV_meta ?= "3a5fec1707626251d69b7548f024856d838cc7db"
+SRCREV_machine:qemuarm ?= "4260a7bd706072e6bec438cdc29f44845d380b21"
+SRCREV_machine:qemuarm64 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
+SRCREV_machine:qemuloongarch64 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
+SRCREV_machine:qemumips ?= "681fad27d382f2e0eb53d1b46f9d35aa2332248f"
+SRCREV_machine:qemuppc ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
+SRCREV_machine:qemuriscv64 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
+SRCREV_machine:qemuriscv32 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
+SRCREV_machine:qemux86 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
+SRCREV_machine:qemux86-64 ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
+SRCREV_machine:qemumips64 ?= "c32033ad8eac09b074c44a42e7d34d398df9d172"
+SRCREV_machine ?= "fee8195f8412ff8f1bfc50ba86cdb8f20de22750"
+SRCREV_meta ?= "f2f3b6cbd91743920e2cb55998c53326855b2e9c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e0e2f78243385e7188a57fcfceb6a19f723f1dff"
+SRCREV_machine:class-devupstream ?= "df3f6d10f353de274cc7c87f52dba5d26f185393"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.30"
+LINUX_VERSION ?= "6.12.31"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


