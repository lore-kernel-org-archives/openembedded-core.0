Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9E5CF536E
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:34:51 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.7901.1729686890897409275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=K4hMRc2p;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20ce5e3b116so53578435ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686890; x=1730291690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzYkGmovX7gqLByFdJbuF77SOsCwYyAtXmgVUTWrbks=;
        b=K4hMRc2pzGUGZF8rRidqz4+E2p34DcIrTqGP6apzikUx6urUEGiMpbN1u4osK9Fj6R
         z8dcs0Fio0+EKBeB4j01fhJ+0ehbLoW0IeIEz9nf2JobaPYlwf6HrpZpZgM0sDrD/TGj
         F2aPQT1YnIyreWl62QHwIwskaXfU0AgTe2ecVNVGAKUOdKqERuZLdS1i3ScqSv6p8BMO
         f99FLD0Ucs7HhNAhMWh7JoeMDcA5aaPOJWSjptxDqSs6UFUpTvmNuJN6rhGunvRq846p
         e9N9H3+aYca0Vx2G1jJieYEC0yob8lQJcxVZ8NWrIB6W0yhNL1tpGGLuhAeFVcp2ulyC
         1DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686890; x=1730291690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qzYkGmovX7gqLByFdJbuF77SOsCwYyAtXmgVUTWrbks=;
        b=FIJahVJ0qYvhZ1Uf/85TWbIiJSA4B6G7QGlmnPMBP3aN5GX7aGD8pzGYfqCEUyvcKv
         axtrPxoFMXYGO/3fbrQJbloPdTsDf53issTiTnqLORNa72lM3u41QJo2CO0nryAv9hTK
         TxVVwt10dcGnbG4ZtA6G4npwK0sC6VRUMqsASnN+BqrnirDNuvYHBFlQCwfC3oOr/00B
         gxPtdcNrOi0yRX54IPUIWoicDaK/CWf1E84CqKlpMkL6DpMzNxoYNQlc8ndz8PdBlkS5
         9miQV4zgqIEMYNdQD/ketoPK9x2YOxSa1gpH6K8zAMfhsOtsj/qDKIFhddy+GTGKVfA6
         2BKw==
X-Gm-Message-State: AOJu0Ywdg9MrGMdTPZTWhZ6D0Bw+blgXqnYJCPvOKIG/eWUKiCOS4oy4
	0CKWDBIUeqS06BOkSVSOqU1fEduFgoVi5SBJc800GeEzzZCYebpXWXTxhAg2xWTIz4HF2AKEQ0g
	5
X-Google-Smtp-Source: AGHT+IERXoiATr1CD/QWXQtSczYuUarNGptnpdDGPSK9t2y2XFSvMu93cmvgP7Axzb6PAU1fbmHdDQ==
X-Received: by 2002:a17:902:d550:b0:20c:af5d:2ed8 with SMTP id d9443c01a7336-20fa9e7dfdamr35073235ad.36.1729686889712;
        Wed, 23 Oct 2024 05:34:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.34.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:34:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 04/27] linux-yocto/6.6: update to v6.6.52
Date: Wed, 23 Oct 2024 05:34:12 -0700
Message-Id: <157438f70137e00941456df97c978106175f4440.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:34:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206215

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    561bbd55f91a Linux 6.6.52
    bd9c3c2d7e44 riscv: dts: starfive: add assigned-clock* to limit frquency
    e43364f578cd ASoC: meson: axg-card: fix 'use-after-free'
    2a01f3b7b19b pinctrl: meteorlake: Add Arrow Lake-H/U ACPI ID
    b9d510e08504 cifs: Fix signature miscalculation
    6ec7cbc7f578 ASoC: codecs: avoid possible garbage value in peb2466_reg_read()
    86238603c8f4 drm/i915/guc: prevent a possible int overflow in wq offsets
    f9e08c201705 spi: geni-qcom: Fix incorrect free_irq() sequence
    64cdc5d11442 spi: geni-qcom: Undo runtime PM changes at driver exit time
    ff65ae25d3cb drm/amd/amdgpu: apply command submission parser for JPEG v1
    54268468399e drm/amdgpu/atomfirmware: Silence UBSAN warning
    def80cdb2676 drm/nouveau/fb: restore init() for ramgp102
    eb7fc8b65cea dma-buf: heaps: Fix off-by-one in CMA heap fault handler
    8e1ffb257982 drm/syncobj: Fix syncobj leak in drm_syncobj_eventfd_ioctl
    28425a10a4fa soundwire: stream: Revert "soundwire: stream: fix programming slave ports for non-continous port maps"
    af9ca9ca3e44 spi: nxp-fspi: fix the KASAN report out-of-bounds bug
    a8632ef4fc13 tracing/osnoise: Fix build when timerlat is not enabled
    34fcac26216c net: dpaa: Pad packets to ETH_ZLEN
    fc8c0cec1b48 net: dsa: felix: ignore pending status of TAS module when it's disabled
    83e6fb59040e netfilter: nft_socket: fix sk refcount leaks
    033a71efabac selftests: net: csum: Fix checksums for packets with non-zero padding
    38859fb5bdb6 net: ftgmac100: Enable TX interrupt to avoid TX timeout
    5bfbf2c18cf5 octeontx2-af: Modify SMQ flush sequence to drop packets
    7ae890ee1947 fou: fix initialization of grc
    65feee671e37 net/mlx5: Fix bridge mode operations when there are no VFs
    4bb9745cc3d3 net/mlx5: Verify support for scheduling element and TSAR type
    9f806d095955 net/mlx5: Correct TASR typo into TSAR
    fa2e98068d25 net/mlx5: Add missing masks and QoS bit masks for scheduling elements
    f015f63cc9c4 net/mlx5: Explicitly set scheduling element and TSAR type
    f7e7dbdfc093 net/mlx5e: Add missing link mode to ptys2ext_ethtool_map
    4ce59074d53c IB/mlx5: Rename 400G_8X speed to comply to naming convention
    93fd5e028b29 net/mlx5e: Add missing link modes to ptys2ethtool_map
    02518dc443cd net/mlx5: Update the list of the PCI supported devices
    e8db32a90248 igb: Always call igb_xdp_ring_update_tail() under Tx lock
    cbaed60c69f0 ice: fix VSI lists confusion when adding VLANs
    01a786ada184 ice: fix accounting for filters shared by multiple VSIs
    d21559e2037e ice: Fix lldp packets dropping after changing the number of channels
    1bc085e9977f hwmon: (pmbus) Conditionally clear individual status bits for pmbus rev >= 1.2
    14f6a11ea21e selftests/bpf: Support SOCK_STREAM in unix_inet_redir_to_connected()
    8295194a50eb cxl/core: Fix incorrect vendor debug UUID define
    cb735cf79aa1 eeprom: digsy_mtc: Fix 93xx46 driver probe failure
    7853c146f8b4 drm/amd/display: Fix FEC_READY write on DP LT
    27bbf0b1cac9 drm/amd/display: Disable error correction if it's not supported
    d72432755b12 arm64: dts: rockchip: fix PMIC interrupt pin in pinctrl for ROCK Pi E
    b1e1daf0125e net: xilinx: axienet: Fix race in axienet_stop
    a95a24fcaee1 mm: avoid leaving partial pfn mappings around in error case
    2ae1beb3ab4f x86/hyperv: fix kexec crash due to VP assist page corruption
    9b27991f3fb7 dm-integrity: fix a race condition when accessing recalc_sector
    4ec0d8dbd702 net: tighten bad gso csum offset check in virtio_net_hdr
    1705209b3e2a minmax: reduce min/max macro expansion in atomisp driver
    3844bc360e16 arm64: dts: rockchip: override BIOS_DISABLE signal via GPIO hog on RK3399 Puma
    d52643ced186 arm64: dts: rockchip: fix eMMC/SPI corruption when audio has been used on RK3399 Puma
    7e2e638c5909 selftests: mptcp: join: restrict fullmesh endp on 1st sf
    6452b162549c mptcp: pm: Fix uaf in __timer_delete_sync
    c54fc405a060 platform/x86: panasonic-laptop: Allocate 1 entry extra in the sinf array
    6821a82616f6 platform/x86: panasonic-laptop: Fix SINF array out of bounds accesses
    d07216aa30e8 NFS: Avoid unnecessary rescanning of the per-server delegation list
    d8a7055ffd39 NFSv4: Fix clearing of layout segments in layoutreturn
    75e6572ccb78 smb/server: fix return value of smb2_open()
    91043a573ca7 Input: i8042 - add Fujitsu Lifebook E756 to i8042 quirk table
    57ac3b43fb1f drm/msm/adreno: Fix error return if missing firmware-name
    c5331c6342fd platform/surface: aggregator_registry: Add support for Surface Laptop Go 3
    64f8ed257cec platform/surface: aggregator_registry: Add Support for Surface Pro 10
    86a1aaee7f44 scripts: kconfig: merge_config: config files: add a trailing newline
    1d5c7d0a49ec HID: multitouch: Add support for GT7868Q
    11eb4a8228f6 Input: synaptics - enable SMBus for HP Elitebook 840 G2
    3acb2392df34 Input: ads7846 - ratelimit the spi_sync error message
    5ee7efa629bf btrfs: update target inode's ctime on unlink
    ab8f0c4986c7 net: hns3: use correct release function during uninitialization
    4bfee9346d8c wifi: mt76: mt7921: fix NULL pointer access in mt7921_ipv6_addr_change
    4a9a1edd9c49 powerpc/mm: Fix boot warning with hugepages and CONFIG_DEBUG_VIRTUAL
    af252750bf3b net: phy: vitesse: repair vsc73xx autonegotiation
    31b9fc3d0c10 drm: panel-orientation-quirks: Add quirk for Ayn Loki Max
    7d42d19973cb drm: panel-orientation-quirks: Add quirk for Ayn Loki Zero
    9569e1fd06fa net: ethernet: use ip_hdrlen() instead of bit shift
    28123a54f887 usbnet: ipheth: fix carrier detection in modes 1 and 4
    4d1cfa3afb86 usbnet: ipheth: do not stop RX on failing RX callback
    9c8c230e2e15 usbnet: ipheth: drop RX URBs with no payload
    c2fb33a7fed5 usbnet: ipheth: remove extraneous rx URB length check
    78bce66914db ksmbd: override fsids for smb2_query_info()
    5a199eedfdc8 ksmbd: override fsids for share path check
    2278629c3ebb nvmem: u-boot-env: error if NVMEM device is too small
    368fa77b7945 nvmem: u-boot-env: improve coding style
    2eea394c31cb nvmem: u-boot-env: use nvmem device helpers
    ae91c9c7b67d nvmem: u-boot-env: use nvmem_add_one_cell() nvmem subsystem helper
    820b1b981aeb nvmem: core: add nvmem_dev_size() helper
    f7dc14df1bde iio: adc: ad7124: fix DT configuration parsing
    fbed74005829 iio: adc: ad7124: Switch from of specific to fwnode based property handling
    bfc8dab8c73a device property: Introduce device_for_each_child_node_scoped()
    fce8373d3153 device property: Add cleanup.h based fwnode_handle_put() scope based cleanup.
    6d1dc55b5bab Linux 6.6.51
    611e4281117a Bluetooth: hci_sync: Fix UAF on hci_abort_conn_sync
    4d6cf010d876 Bluetooth: hci_sync: Fix UAF on create_le_conn_complete
    78155f30beeb Bluetooth: hci_sync: Fix UAF in hci_acl_create_conn_sync
    50b6744c12fa spi: spi-fsl-lpspi: Fix off-by-one in prescale max
    7b5595f33c3c btrfs: fix race between direct IO write and fsync when using same fd
    8eeda5fb5938 x86/mm: Fix PTI for i386 some more
    a2977c0ca3e9 membarrier: riscv: Add full memory barrier in switch_mm()
    136a29d8112d ublk_drv: fix NULL pointer dereference in ublk_ctrl_start_recovery()
    bd29d8452079 riscv: Do not restrict memory size because of linear mapping on nommu
    8289dc916e9e riscv: Fix toolchain vector detection
    b27ea9c96efd smb: client: fix double put of @cfile in smb2_rename_path()
    52b688c8087b gpio: modepin: Enable module autoloading
    9ceae54e65a3 gpio: rockchip: fix OF node leak in probe()
    60d54a45dbbb drm/i915/fence: Mark debug_fence_free() with __maybe_unused
    a65ebba87337 drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused
    7c391eaf2c63 clk: qcom: gcc-sm8550: Don't park the USB RCG at registration time
    a5e871d26ba1 clk: qcom: gcc-sm8550: Don't use parking clk_ops for QUPs
    b9bb9634368e ASoC: sunxi: sun4i-i2s: fix LRCLK polarity in i2s mode
    f39bde3f7825 ASoc: SOF: topology: Clear SOF link platform name upon unload
    05500a48d80d nvme-pci: allocate tagset on reset if necessary
    489f2913a63f nvmet-tcp: fix kernel crash if commands allocation fails
    585c598082e1 ASoC: tegra: Fix CBB error during probe()
    af4d5630d991 powerpc/vdso: Don't discard rela sections
    547acc20e567 powerpc/64e: Define mmu_pte_psize static
    8ea58996f539 powerpc/64e: split out nohash Book3E 64-bit code
    8ebe3bb3688a powerpc/64e: remove unused IBM HTW code
    eaccebe663b2 clk: qcom: ipq9574: Update the alpha PLL type for GPLLs
    37b65ea6c7ad crypto: starfive - Fix nent assignment in rsa dec
    02b3f8860963 crypto: starfive - Align rsa input data to 32-bit
    872f86e1757b ata: libata-scsi: Check ATA_QCFLAG_RTF_FILLED before using result_tf
    c8d4acb32530 ata: libata-scsi: Remove redundant sense_buffer memsets
    302ba299c31e drm/amdgpu: handle gfx12 in amdgpu_display_verify_sizes
    5f2a2bf25395 drm/amd: Add gfx12 swizzle mode defs
    5ea24ddc26a7 can: mcp251xfd: rx: add workaround for erratum DS80000789E 6 of mcp2518fd
    6cdc3fc4fb2f can: mcp251xfd: clarify the meaning of timestamp
    bf501ab4cbfe can: mcp251xfd: rx: prepare to workaround broken RX FIFO head index erratum
    2370061f0707 can: mcp251xfd: mcp251xfd_handle_rxif_ring_uinc(): factor out in separate function
    62ca6d3a905b arm64: acpi: Harden get_cpu_for_acpi_id() against missing CPU entry
    acf9ef8d1b1f arm64: acpi: Move get_cpu_for_acpi_id() to a header
    47c310fbaaf4 ACPI: processor: Fix memory leaks in error paths of processor_add()
    6bf77014db58 ACPI: processor: Return an error if acpi_processor_get_info() fails in processor_add()
    241bce1c757d workqueue: Improve scalability of workqueue watchdog touch
    5ff0a4414195 workqueue: wq_watchdog_touch is always called with valid CPU
    0eceaa9d0560 Revert "mm: skip CMA pages when they are not available"
    9a9974713de8 mm/vmscan: use folio_migratetype() instead of get_pageblock_migratetype()
    c4b69bee3f4e perf/aux: Fix AUX buffer serialization
    9faed52b98e1 uprobes: Use kzalloc to allocate xol area
    7eeb7189c4d4 clocksource/drivers/timer-of: Remove percpu irq related code
    444c3927a0c1 clocksource/drivers/imx-tpm: Fix next event not taking effect sometime
    c4f27b17d384 clocksource/drivers/imx-tpm: Fix return -ETIME when delta exceeds INT_MAX
    39e7e593418c VMCI: Fix use-after-free when removing resource in vmci_resource_remove()
    6ed45748c19b Drivers: hv: vmbus: Fix rescind handling in uio_hv_generic
    de6946be9c8b uio_hv_generic: Fix kernel NULL pointer dereference in hv_uio_rescind
    3d1baf322a3a nvmem: Fix return type of devm_nvmem_device_get() in kerneldoc
    1f33d9f1d9ac binder: fix UAF caused by offsets overwrite
    f77dc8a75859 misc: fastrpc: Fix double free of 'buf' in error path
    7d301dd2722f usb: dwc3: Avoid waking up gadget during startxfer
    f224f3729779 usb: cdns2: Fix controller reset issue
    6ef746b0b63f usb: dwc3: core: update LC timer as per USB Spec V3.2
    314125cbae48 iio: adc: ad7124: fix chip ID mismatch
    66d0d59afe55 iio: adc: ad7606: remove frstdata check for serial mode
    fb5d58f238c4 iio: adc: ad7124: fix config comparison
    ecc8e1bcac27 iio: fix scale application in iio_convert_raw_to_processed_unlocked
    cb0f3f0c102b iio: buffer-dmaengine: fix releasing dma channel on error
    dc12e49f970b staging: iio: frequency: ad9834: Validate frequency parameter value
    5c007a980450 intel: legacy: Partial revert of field get conversion
    4fe707a29789 tcp: process the 3rd ACK with sk_socket for TFO/MPTCP
    3b843046dbbe cpufreq: amd-pstate: fix the highest frequency issue which limits performance
    1ec40a175a48 cpufreq: amd-pstate: Enable amd-pstate preferred core support
    0b983c08ca81 ACPI: CPPC: Add helper to get the highest performance value
    e0316069fae7 riscv: Use accessors to page table entries instead of direct dereference
    59c9160a7ee3 riscv: mm: Only compile pgtable.c if MMU
    1a8b2391e06e mm: Introduce pudp/p4dp/pgdp_get() functions
    193b1fc1cbca riscv: Use WRITE_ONCE() when setting page table entries
    6c4a878e1cc8 NFSv4: Add missing rescheduling points in nfs_client_return_marked_delegations
    07f384c5be1f smb/server: fix potential null-ptr-deref of lease_ctx_info in smb2_open()
    b777131d03be ata: pata_macio: Use WARN instead of BUG
    ff62110ec522 spi: spi-fsl-lpspi: limit PRESCALE bit in TCR register
    32ee0520159f MIPS: cevt-r4k: Don't call get_c0_compare_int if timer irq is installed
    d942e855324a lib/generic-radix-tree.c: Fix rare race in __genradix_ptr_alloc()
    7ead730af11e of/irq: Prevent device address out-of-bounds read in interrupt map walk
    c3af7e460a52 Squashfs: sanity check symbolic link size
    6604d76253e7 usbnet: ipheth: race between ipheth_close and error handling
    a4858b00a1ec Input: uinput - reject requests with unreasonable number of slots
    60dc4ee0428d HID: amd_sfh: free driver_data after destroying hid device
    30e9ce7cd559 HID: cougar: fix slab-out-of-bounds Read in cougar_report_fixup
    fc9fabeee107 s390/vmlinux.lds.S: Move ro_after_init section behind rodata section
    f1eb69aa8562 btrfs: initialize location to fix -Wmaybe-uninitialized in btrfs_lookup_dentry()
    16ccaf581da4 spi: hisi-kunpeng: Add verification for the max_frequency provided by the firmware
    d43fde5ebfe7 kselftests: dmabuf-heaps: Ensure the driver name is null-terminated
    5a022269abb2 i3c: mipi-i3c-hci: Error out instead on BUG_ON() in IBI DMA setup
    1f489656d506 i3c: master: svc: resend target address when get NACK
    c03185f4a23e vfs: Fix potential circular locking through setxattr() and removexattr()
    e42ea96d6d36 regmap: maple: work around gcc-14.1 false-positive warning
    fd8e14122374 LoongArch: Use correct API to map cmdline in relocate_kernel()
    938acd8e3aa0 net: dpaa: avoid on-stack arrays of NR_CPUS elements
    013dae4735d2 Bluetooth: btnxpuart: Fix Null pointer dereference in btnxpuart_flush()
    9fd29738377c tcp: Don't drop SYN+ACK for simultaneous connect().
    78c6e39fef5c PCI: Add missing bridge lock to pci_bus_lock()
    ce2e63804abf riscv: set trap vector earlier
    124451bbc2d3 cxl/region: Verify target positions using the ordered target list
    41a0f85e268d btrfs: replace BUG_ON() with error handling at update_ref_for_cow()
    7d1df13bf078 btrfs: clean up our handling of refs == 0 in snapshot delete
    e7469c65b3c5 btrfs: replace BUG_ON with ASSERT in walk_down_proc()
    951b696db188 fs/ntfs3: Check more cases when directory is corrupted
    6b1b0a86d9c1 smp: Add missing destroy_work_on_stack() call in smp_call_on_cpu()
    6922ab293262 drm/amdgpu: reject gang submit on reserved VMIDs
    c2618dcb26c7 wifi: mwifiex: Do not return unused priv in mwifiex_get_priv_by_id()
    abc8b81b6fc7 dma-mapping: benchmark: Don't starve others when doing the test
    e16c4c245150 jbd2: avoid mount failed when commit block is partial submitted
    3236afd1a2fa ext4: fix possible tid_t sequence overflows
    077c7e5fee4b drm/amdgpu: Set no_hw_access when VF request full GPU fails
    030958c2d05e libbpf: Add NULL checks to bpf_object__{prev_map,next_map}
    4b83b207f006 ASoc: TAS2781: replace beXX_to_cpup with get_unaligned_beXX for potentially broken alignment
    8fecb75bff1b hwmon: (w83627ehf) Fix underflows seen when writing limit attributes
    2f695544084a hwmon: (nct6775-core) Fix underflows seen when writing limit attributes
    46e4fd338d5b hwmon: (lm95234) Fix underflows seen when writing limit attributes
    6891b11a0c62 hwmon: (adc128d818) Fix underflows seen when writing limit attributes
    3a986d134402 crypto: qat - fix unintentional re-enabling of error interrupts
    7b1d779647af scsi: pm80xx: Set phy->enable_completion only when we wait for it
    2f49e05d6b58 scsi: ufs: core: Remove SCSI host only if added
    c83d464b82a8 wifi: rtw88: usb: schedule rx work after everything is set up
    c5b30148ef3b virtio_ring: fix KMSAN error for premapped mode
    b82d4d5c736f pci/hotplug/pnv_php: Fix hotplug driver crash on Powernv
    72377cee3f46 devres: Initialize an uninitialized struct member
    ec5b47a37017 um: line: always fill *error_out in setup_one_line()
    84a6b76b2859 cgroup: Protect css->cgroup write under css_set_lock
    7cfa7abb240c iommu/vt-d: Handle volatile descriptor status read
    8b3267428333 dm init: Handle minors larger than 255
    67786b291e77 ASoC: topology: Properly initialize soc_enum values
    8bdbc44c6d26 phy: zynqmp: Take the phy mutex in xlate
    441e6f5829be firmware: cs_dsp: Don't allow writes to read-only controls
    e997b357b13a xen: privcmd: Fix possible access to a freed kirqfd instance
    2b110cce19c8 selftests: net: enable bind tests
    97d627461504 net: dsa: vsc73xx: fix possible subblocks range of CAPT block
    c6c535a44469 net: bridge: br_fdb_external_learn_add(): always set EXT_LEARN
    565eb51b3d80 r8152: fix the firmware doesn't work
    1df42be305fe fou: Fix null-ptr-deref in GRO.
    40531583c5cd bareudp: Fix device stats updates.
    f8d6acb19f4a bpf, net: Fix a potential race in do_sock_getsockopt()
    2174a3c36899 net/socket: Break down __sys_getsockopt
    e88c16a4f07e net/socket: Break down __sys_setsockopt
    09fba0162ba0 bpf: Add sockptr support for setsockopt
    4a746fb253fa bpf: Add sockptr support for getsockopt
    07200e313cb5 usbnet: modern method to get random MAC
    81e5622c052b ice: do not bring the VSI up, if it was down before the XDP setup
    2f057db2fb29 ice: protect XDP configuration with a mutex
    26928c8f00f6 net: phy: Fix missing of_node_put() for leds
    217539e994e5 hwmon: (hp-wmi-sensors) Check if WMI event data exists
    ed60aab60641 igc: Unlock on error in igc_io_resume()
    249c88e7fb45 Bluetooth: MGMT: Fix not generating command complete for MGMT_OP_DISCONNECT
    d56412ee7cf9 Bluetooth: hci_sync: Introduce hci_cmd_sync_run/hci_cmd_sync_run_once
    d948e1ffa1d4 Bluetooth: hci_sync: Attempt to dequeue connection attempt
    1499f79995c7 Bluetooth: hci_sync: Add helper functions to manipulate cmd_sync queue
    98f66ea456d5 Bluetooth: hci_conn: Fix UAF Write in __hci_acl_create_connection_sync
    e78bd85af297 Bluetooth: Remove pending ACL connection attempts
    c57edb548276 Bluetooth: hci_conn: Only do ACL connections sequentially
    9cd7289bcc24 Bluetooth: hci_event: Use HCI error defines instead of magic values
    a22cbf1e085b Bluetooth: qca: If memdump doesn't work, re-enable IBS
    503901d3c9e5 can: kvaser_pciefd: Use a single write when releasing RX buffers
    6587b387cd54 can: kvaser_pciefd: Move reset of DMA RX buffers to the end of the ISR
    00e4c69422c0 can: kvaser_pciefd: Rename board_irq to pci_irq
    42408507362d can: kvaser_pciefd: Remove unnecessary comment
    c1fb6226795d can: kvaser_pciefd: Skip redundant NULL pointer check in ISR
    c5e236744db6 regulator: core: Stub devm_regulator_bulk_get_const() if !CONFIG_REGULATOR
    dc2694e474b7 platform/x86: dell-smbios: Fix error path in dell_smbios_init()
    efe8effe1380 ice: Add netif_device_attach/detach into PF reset flow
    4dde04370503 igb: Fix not clearing TimeSync interrupts for 82580
    0a9423f99ded cifs: Fix FALLOC_FL_ZERO_RANGE to preflush buffered part of target region
    b4b2115d1f50 rust: kbuild: fix export of bss symbols
    4de4e53bbd13 rust: Use awk instead of recent xargs
    0e52907493fd can: mcp251xfd: fix ring configuration when switching from CAN-CC to CAN-FD mode
    db5aca78e260 can: m_can: Release irq on error in m_can_open
    4377b79323df can: bcm: Remove proc entry when dev is unregistered.
    9a41def4c48f drm/amdgpu: check for LINEAR_ALIGNED correctly in check_tiling_flags_gfx6
    dfafee0a7b51 drm/amd/display: Check denominator pbn_div before used
    dd48992a8a90 pcmcia: Use resource_size function on resource object
    b4987d0236d5 media: qcom: camss: Add check for v4l2_fwnode_endpoint_parse
    6970213c7e7d Input: ili210x - use kvmalloc() to allocate buffer for firmware update
    576d0fb6f8d4 PCI: keystone: Add workaround for Errata #i2037 (AM65x SR 1.0)
    7b645e687086 ice: Check all ice_vsi_rebuild() errors in function
    4ef01846c686 vfio/spapr: Always clear TCEs before unsetting the window
    4676bacc6eaf media: vivid: don't set HDMI TX controls if there are no HDMI outputs
    2521ba3cfa1d drm/amdgpu: clear RB_OVERFLOW bit when enabling interrupts
    8bc7b3ce33e6 drm/amdgpu: Fix smatch static checker warning
    1bd1fe1109fc drm/amd/display: Check HDCP returned status
    874e3bb302f9 drm/amd/display: Run DC_LOG_DC after checking link->link_enc
    b2a50ffdd1a0 usb: gadget: aspeed_udc: validate endpoint index for ast udc
    4292441b87b8 usb: uas: set host status byte on data completion error
    d22d72e2bf9c wifi: brcmsmac: advertise MFP_CAPABLE to enable WPA3
    56b7104b823b leds: spi-byte: Call of_node_put() on error path
    6ae2e315a388 media: vivid: fix wrong sizeimage value for mplane
    1741021fc120 riscv: kprobes: Use patch_text_nosync() for insn slots
    d670934d4fc9 fs/ntfs3: One more reason to mark inode bad
    a56330761950 udf: Avoid excessive partition lengths
    415f3634d53c wifi: iwlwifi: mvm: use IWL_FW_CHECK for link ID check
    54921e9a7a8e netfilter: nf_conncount: fix wrong variable type
    75758ca26cb5 iommu: sun50i: clear bypass register
    4ebd15ab4b85 x86/kmsan: Fix hook for unaligned accesses
    9c2450cf5d65 af_unix: Remove put_pid()/put_cred() in copy_peercred().
    29ac5a9b6e9c irqchip/armada-370-xp: Do not allow mapping IRQ 0 and 1
    9a173212a318 accel/habanalabs/gaudi2: unsecure edma max outstanding register
    53f17409abf6 ELF: fix kernel.randomize_va_space double read
    3c9e7909df15 bpf, verifier: Correct tail_call_reachable for bpf prog
    b181e96e8043 smack: unix sockets: fix accept()ed socket label
    838c2cfdb6be wifi: ath12k: fix firmware crash due to invalid peer nss
    b366b1e1dda7 wifi: ath12k: fix uninitialize symbol error on ath12k_peer_assoc_h_he()
    fd05943b054b ALSA: hda: Add input value sanity checks to HDMI channel map controls
    4a67c7c03830 ALSA: control: Apply sanity check of input values for user elements
    337266ada863 drm/i915: Do not attempt to load the GSC multiple times
    0a1a961bde43 nilfs2: fix state management in error path of log writing function
    8c6e43b3d5f1 nilfs2: protect references to superblock parameters exposed in sysfs
    9d8c3a585d56 nilfs2: fix missing cleanup on rollforward recovery error
    d4a9039a7b3d sched: sch_cake: fix bulk flow accounting logic for host fairness
    18a5a1694046 ila: call nf_unregister_net_hooks() sooner
    c8219a27fa43 tcp_bpf: fix return value of tcp_bpf_sendmsg()
    94479011f4f5 Revert "drm/amdgpu: align pp_power_profile_mode with kernel docs"
    73d20d08d39e x86/apic: Make x2apic_disable() work correctly
    55c834bc9f82 x86/fpu: Avoid writing LBR bit to IA32_XSS unless supported
    ec36815215d7 net: mctp-serial: Fix missing escapes on transmit
    9e0bff4900b5 net: mana: Fix error handling in mana_create_txq/rxq's NAPI cleanup
    05e08297c3c2 eventfs: Use list_del_rcu() for SRCU protected list variable
    e0d724932ad1 fscache: delete fscache_cookie_lru_timer when fscache exits to avoid UAF
    3c6b4bcf3784 userfaultfd: fix checks for huge PMDs
    4a594acc12d5 userfaultfd: don't BUG_ON() if khugepaged yanks our page table
    b4fdabffae14 tracing/timerlat: Add interface_lock around clearing of kthread in stop_kthread()
    993ecb4ec1f3 tracing: Avoid possible softlockup in tracing_iter_reset()
    8c72f0b2c45f tracing/timerlat: Only clear timer if a kthread exists
    7a5f01828edf tracing/osnoise: Use a cpumask to know what threads are kthreads
    d034bff62fae spi: rockchip: Resolve unbalanced runtime PM / system PM handling
    1b2770e27d6d mm: vmalloc: ensure vmap_block is initialised before adding to queue
    c318a4bb36f2 kexec_file: fix elfcorehdr digest exclusion when CONFIG_CRASH_HOTPLUG=y
    8fecde9c3f9a can: mcp251x: fix deadlock if an interrupt occurs during mcp251x_open
    f58f23328932 clk: qcom: clk-alpha-pll: Fix the trion pll postdiv set rate API
    229493828da0 clk: qcom: clk-alpha-pll: Fix the pll post div mask
    72f4fc5fb291 clk: starfive: jh7110-sys: Add notifier for PLL0 clock
    f36df5cc866f fuse: fix memory leak in fuse_create_open
    bfd55cd4295a fuse: use unsigned type for getxattr/listxattr size truncation
    ad6451ab31e1 fuse: update stats for pages in dropped aux writeback list
    a7fa220ebb41 mmc: cqhci: Fix checking of CQHCI_HALT state
    4c6520627bbe mmc: sdhci-of-aspeed: fix module autoloading
    5b4bf3948875 mmc: dw_mmc: Fix IDMAC operation with pages bigger than 4K
    115a755bb38d mmc: core: apply SD quirks earlier during probe
    84996e92a184 Bluetooth: MGMT: Ignore keys being loaded with invalid type
    c4252955e1fb Revert "Bluetooth: MGMT/SMP: Fix address type when using SMP over BREDR/LE"
    f9275893b07f rust: macros: provide correct provenance when constructing THIS_MODULE
    d6344cc86f31 rust: types: Make Opaque::get const
    77ee2eaee4d9 nvme-pci: Add sleep quirk for Samsung 990 Evo
    85f03ca98e07 rtmutex: Drop rt_mutex::wait_lock before scheduling
    0b46b4ac929f x86/kaslr: Expose and use the end of the physical memory address space
    2f4d7b702668 irqchip/gic-v2m: Fix refcount leak in gicv2m_of_init()
    0eaf812aa150 perf/x86/intel: Limit the period on Haswell
    ef00818c50cf x86/tdx: Fix data leak in mmio_read()
    c0fbc9593b18 ata: libata: Fix memory leak for error path in ata_host_alloc()
    f75881f54c05 ksmbd: Unlock on in ksmbd_tcp_set_interfaces()
    41bc256da7e4 ksmbd: unset the binding mark of a reused connection
    5a72d1edb084 smb: client: fix double put of @cfile in smb2_set_path_size()
    d84ab6661e8d powerpc/qspinlock: Fix deadlock in MCS queue
    c1f23443da3f ALSA: hda/realtek: Support mute LED on HP Laptop 14-dq2xxx
    421c2701a9fe ALSA: hda/realtek: add patch for internal mic in Lenovo V145
    638e61b00208 ALSA: hda/conexant: Add pincfg quirk to enable top speakers on Sirius devices
    6c7c519c4dc0 KVM: SVM: Don't advertise Bus Lock Detect to guest if SVM support is missing
    c98bb4f15e7f KVM: SVM: fix emulation of msr reads/writes of MSR_FS_BASE and MSR_GS_BASE
    939375737b5a KVM: x86: Acquire kvm->srcu when handling KVM_SET_VCPU_EVENTS
    5d13afd021eb ASoC: dapm: Fix UAF for snd_soc_pcm_runtime object
    b0804c286ccf net: microchip: vcap: Fix use-after-free error in kunit test
    dde33a9d0b80 sch/netem: fix use after free in netem_dequeue
    18abb2787b53 x86/syscall: Mark exit[_group] syscall handlers __noreturn
    2879d995e569 pnmtologo: sync with 6.6
    43ea1c5e6eb3 lib/build_OID_registry: take -stable reproducibility changes
    35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e503 bpftool: Query only cgroup-related attach types
    f71bb11887ba cpu/amd: inhibit SMP check for qemux86
    c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    7c76aad68f6d kselftest: Add a ksft_perror() helper
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b1a48c9a70d78082ecb23ba98fd833716077023)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 2c8725f27a..a425015dbc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f1958988835e4b36462e9a7762001b695989288c"
-SRCREV_meta ?= "c82d4e5d08201d0259c29a4d15ce1e72fc63c65f"
+SRCREV_machine ?= "a2252fce7715d414dc5877902ff4fe07630aa92c"
+SRCREV_meta ?= "5cefbe3e2770576771fe59b611d3b5fcf5860a1f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.50"
+LINUX_VERSION ?= "6.6.52"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index ce20fbc07d..5b76af5275 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.50"
+LINUX_VERSION ?= "6.6.52"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "10604010520101e717ca658ada47b394a46e1539"
-SRCREV_meta ?= "c82d4e5d08201d0259c29a4d15ce1e72fc63c65f"
+SRCREV_machine ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
+SRCREV_meta ?= "5cefbe3e2770576771fe59b611d3b5fcf5860a1f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index b871b30157..82bc70a82c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "36f604ad9d400626d19666688399af0d0ae93e53"
-SRCREV_machine:qemuarm64 ?= "10604010520101e717ca658ada47b394a46e1539"
-SRCREV_machine:qemuloongarch64 ?= "10604010520101e717ca658ada47b394a46e1539"
-SRCREV_machine:qemumips ?= "8ca27eda30aa6ceb72b61c784ebb057de07201ae"
-SRCREV_machine:qemuppc ?= "10604010520101e717ca658ada47b394a46e1539"
-SRCREV_machine:qemuriscv64 ?= "10604010520101e717ca658ada47b394a46e1539"
-SRCREV_machine:qemuriscv32 ?= "10604010520101e717ca658ada47b394a46e1539"
-SRCREV_machine:qemux86 ?= "10604010520101e717ca658ada47b394a46e1539"
-SRCREV_machine:qemux86-64 ?= "10604010520101e717ca658ada47b394a46e1539"
-SRCREV_machine:qemumips64 ?= "72b65c64c2fd2b4d252b4a93642acc268ca2f006"
-SRCREV_machine ?= "10604010520101e717ca658ada47b394a46e1539"
-SRCREV_meta ?= "c82d4e5d08201d0259c29a4d15ce1e72fc63c65f"
+SRCREV_machine:qemuarm ?= "f526214e00c4b81f94a7609ad5f7cd0a5cc85219"
+SRCREV_machine:qemuarm64 ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
+SRCREV_machine:qemuloongarch64 ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
+SRCREV_machine:qemumips ?= "34d1fef76d87c348c862115efb0b023c1e58673e"
+SRCREV_machine:qemuppc ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
+SRCREV_machine:qemuriscv64 ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
+SRCREV_machine:qemuriscv32 ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
+SRCREV_machine:qemux86 ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
+SRCREV_machine:qemux86-64 ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
+SRCREV_machine:qemumips64 ?= "0d173d25a1634af6bd55b4346237962f3c6a0b47"
+SRCREV_machine ?= "01b1f32be4b0eb108c00b16ec4eef29ce7fa9546"
+SRCREV_meta ?= "5cefbe3e2770576771fe59b611d3b5fcf5860a1f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ad07a29023cebd40848fce81e6732d671ede5fe6"
+SRCREV_machine:class-devupstream ?= "561bbd55f91a8e94576ca3fbf35a0c99ff70d4b2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.50"
+LINUX_VERSION ?= "6.6.52"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


