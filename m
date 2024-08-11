Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C53BC52D7C
	for <webhook@archiver.kernel.org>; Sun, 11 Aug 2024 18:04:38 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.29119.1723399472374652304
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 11:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NUi3Aadn;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6b7b349a98aso27536806d6.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 11:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723399471; x=1724004271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBFwwGQU3sLcrLaqHKPLrQIMuFhUdWwbkBdMT+jUMmE=;
        b=NUi3AadnTSEXIb2P31rHYZtR9j/CQHKIjpkxMiCFMcaarL7vbJSnvY8SJxUXQ86t26
         WBPLWnQHAG/Ovw+Y1ryJ2CKz0CIUPyXcLJcaWOjyovewHQtnTyTtj87WKwGq9pJ+HMi1
         v3qkMAi2VBMmL/iPidy9Ta6MHJ0RubIbXXISKbg/ily3S/klRK0P528Zj1y1BjP3ptN3
         z2j6Jjahac/cFRopoSHZczCVtpmg0eR/RyyZUPbenVxfprI+l7S3e8KdkGt9+8l4GDpz
         cUqeuJMImXQ4umKWevnqXtTwX0fzdRmYoeyunwwtNbX6L6k24XZWBPeZMVaXgPU8rmDO
         Ywvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723399471; x=1724004271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBFwwGQU3sLcrLaqHKPLrQIMuFhUdWwbkBdMT+jUMmE=;
        b=PmOQrv5GOtUKRcXJuhL2nAnwPSvaqZo0zgKlZfgOd1etZyvU0T0vQy1ynQ+GKRTcya
         OJLtEbXZvCTe6wd9tg7LUy7VduoCPgAE9HUxPFvO93AMa15y9hEO8oNXZ3UUXE0WIgpD
         u9ez2O8F/5B5BzeQxGYj2VW49j7iaFM+9/7dTpWcRfMSlb8LSInixdsoJ1lgGx5Z/OaD
         48pJ3U6c0tA7YzQ8SWlxKgGy4Oc4/VGwKaLaVWUPX8rx5NOCRoN/RaHagTFRXYVZ5I4h
         g2GW8i2eIzDunEB2Rb8e/Kng4SPGsDw1QB33pPlz02HEWXDJ1ms2vuxLfdq/Fvdyy/jO
         D6YQ==
X-Gm-Message-State: AOJu0YxJDtyr8naaOsLTNx3kPfhrgL37LY2WGetBTrQLL28pNsIL7dNQ
	jwWdAfNYpQ1GQE0ui0P06m0F86cUG7IniUL9jF5sWUaeGGhFmU9ROwgzJtPn
X-Google-Smtp-Source: AGHT+IGb0M/DIrw1IQc5AsTfi5x5sF3NcfgdNWXcbAuEesyPYoRVQNZUbq/ndGM2ojKXMK4ErrgOgg==
X-Received: by 2002:a05:6214:2c03:b0:6b7:980b:e0b6 with SMTP id 6a1803df08f44-6bd78d82008mr67955666d6.26.1723399470681;
        Sun, 11 Aug 2024 11:04:30 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf42f4276esm1383996d6.66.2024.08.11.11.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:04:29 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/6.6: update to v6.6.44
Date: Sun, 11 Aug 2024 14:04:22 -0400
Message-Id: <fc287f53f8a9316bef5a3df5eaccb626efea1a7d.1723399246.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1723399246.git.bruce.ashfield@gmail.com>
References: <cover.1723399246.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 18:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203191

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    43ea1c5e6eb3c lib/build_OID_registry: take -stable reproducibility changes
    7213910600667 Linux 6.6.44
    acbd66c10d7bc fs: don't allow non-init s_user_ns for filesystems without FS_USERNS_MOUNT
    77848b379e9f8 nvme-pci: add missing condition check for existence of mapped data
    766b0e807e1d5 io_uring: fix io_match_task must_hold
    b62841e49a2b7 iommu: sprd: Avoid NULL deref in sprd_iommu_hw_en
    97dfb89415fd7 s390/cpum_cf: Fix endless loop in CF_DIAG event stop
    b4d781ddaee39 s390/pci: Allow allocation of more than 1 MSI interrupt
    3eab85f45ff12 s390/pci: Refactor arch_setup_msi_irqs()
    da0a3ebf9a96f ceph: fix incorrect kmalloc size of pagevec mempool
    6d98741dbd130 ASoC: TAS2781: Fix tasdev_load_calibrated_data()
    be6d86df474df ASoC: Intel: use soc_intel_is_byt_cr() only when IOSF_MBI is reachable
    af1125de16725 spi: spidev: add correct compatible for Rohm BH2228FV
    6443a4028539c ASoC: sof: amd: fix for firmware reload failure in Vangogh platform
    8772be96705a9 nvme-pci: Fix the instructions for disabling power management
    3feda3677e8bb spi: microchip-core: ensure TX and RX FIFOs are empty at start of a transfer
    783f42b77d33d spi: microchip-core: fix init function not setting the master and motorola modes
    0b0b75928852d spi: microchip-core: switch to use modern name
    c41d2178d61b9 spi: microchip-core: only disable SPI controller when register value change requires it
    1dc6d9fd4828f spi: microchip-core: defer asserting chip select until just before write to TX FIFO
    11e0f3c888b2e spi: microchip-core: fix the issues in the isr
    0e51f66977e33 ASoC: SOF: imx8m: Fix DSP control regmap retrieval
    64dc362dee403 auxdisplay: ht16k33: Drop reference after LED registration
    f4c6ebb053cc9 lirc: rc_dev_get_from_fd(): fix file leak
    4f79a18af9d6e powerpc: fix a file leak in kvm_vcpu_ioctl_enable_cap()
    6c920754f62ce apparmor: Fix null pointer deref when receiving skb during sock creation
    ddc79556641ee mISDN: Fix a use after free in hfcmulti_tx()
    c3496314c53e7 bpf: Fix a segment issue when downgrading gso_size
    7704460acd7f5 net: nexthop: Initialize all fields in dumped nexthops
    4384135d22174 net: stmmac: Correct byte order of perfect_match
    76ddf84a52f0d tipc: Return non-zero value from tipc_udp_addr2str() on error
    5c82010cef30c netfilter: nft_set_pipapo_avx2: disable softinterrupts
    b6426eabb4f71 ice: Fix recipe read procedure
    d9f01090912b4 net: bonding: correctly annotate RCU in bond_should_notify_peers()
    42f493bd6cb8f ipv4: Fix incorrect source address in Record Route option
    1f07fab9e0864 MIPS: SMP-CPS: Fix address for GCR_ACCESS register for CM3 and later
    9c79502ab7eb1 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    ba709e7807f78 bpf, events: Use prog to emit ksymbol event for main program
    1fe97f68fce1b dma: fix call order in dmam_free_coherent
    772f9c31bfde0 af_unix: Disable MSG_OOB handling for sockets in sockmap/sockhash
    297a14fde2d3d libbpf: Fix no-args func prototype BTF dumping syntax
    390c17cab13b5 selftests/bpf: fexit_sleep: Fix stack allocation for arm64
    019167c74117d kbuild: avoid build error when single DTB is turned into composite DTB
    fbcd51e0d977a f2fs: fix to update user block counts in block_operations()
    8aeab1af9d9bf watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
    fb45265610cc7 watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
    abde880b7920b f2fs: fix start segno of large section
    0aa0284818d2c um: time-travel: fix signal blocking race/hang
    f66d436204e9f um: time-travel: fix time-travel-start option
    7eaa06967b0fe phy: zynqmp: Enable reference clock correctly
    1cffbf30f865a phy: cadence-torrent: Check return value on register read
    0d820e1ca8efe dmaengine: ti: k3-udma: Fix BCHAN count with UHC and HC channels
    ff14eadc27866 jfs: Fix array-index-out-of-bounds in diFree
    9e58df60f6ceb kdb: Use the passed prompt in kdb_position_cursor()
    7b01bf24f391c kdb: address -Wformat-security warnings
    f44a25a8bfe0c f2fs: fix to truncate preallocated blocks in f2fs_file_open()
    73a9260b7366d s390/mm: Fix VM_FAULT_HWPOISON handling in do_exception()
    2cc8973bdc4d6 PCI/DPC: Fix use-after-free on concurrent DPC and hot-removal
    9b6742dcdc597 PCI: Introduce cleanup helpers for device reference counts and locks
    86e7bdc50bc6a wifi: mac80211: track capability/opmode NSS separately
    4211d065ef5cd mm/mglru: fix ineffective protection calculation
    be56dfc9be060 nilfs2: handle inconsistent state in nilfs_btnode_create_block()
    6c0cf6022aeec minmax: scsi: fix mis-use of 'clamp()' in sr.c
    34e4dfe838f7a Bluetooth: btusb: Add Realtek RTL8852BE support ID 0x13d3:0x3591
    499ca9ddd4e4f Bluetooth: btusb: Add RTL8852BE device 0489:e125 to device tables
    3f83f52ae0822 video: logo: Drop full path of the input filename in generated file
    32c3c30a97f93 lib/build_OID_registry: don't mention the full path of the script in output
    7ca762dcf1fca rbd: don't assume RBD_LOCK_STATE_LOCKED for exclusive mappings
    36913dedee7d0 rbd: rename RBD_LOCK_STATE_RELEASING and releasing_wait
    1901f1cf7c2c3 drm/panfrost: Mark simple_ondemand governor as softdep
    92d3ca3f465c8 drm/etnaviv: don't block scheduler when GPU is still active
    cf9b29f2d42cc MIPS: Loongson64: Test register availability before use
    6c695c3ce76ae MIPS: Loongson64: reset: Prioritise firmware service
    690d62d1ebb92 MIPS: Loongson64: Remove memory node for builtin-dtb
    f7097b5fda08d MIPS: Loongson64: env: Hook up Loongsson-2K
    27479037e8c44 MIPS: dts: loongson: Fix GMAC phy node
    97f099862aa4c MIPS: ip30: ip30-console: Add missing include
    f29119b301d59 MIPS: dts: loongson: Add ISA node
    2de4d41862944 remoteproc: imx_rproc: Fix refcount mistake in imx_rproc_addr_init
    6c9ea3547fad2 remoteproc: imx_rproc: Skip over memory region when node value is NULL
    83ada7dfaf400 remoteproc: stm32_rproc: Fix mailbox interrupts queuing
    9a2acb02c1eca rbd: don't assume rbd_is_lock_owner() for exclusive mappings
    dcb5620d2dedf dm-verity: fix dm_is_verity_target() when dm-verity is builtin
    47e85f7121255 selftests/sigaltstack: Fix ppc64 GCC build
    ff5bbbdee0828 RDMA/iwcm: Fix a use-after-free related to destroying CM IDs
    aa9ccec6e215b platform: mips: cpu_hwmon: Disable driver on unsupported hardware
    bbaeff660657c watchdog/perf: properly initialize the turbo mode timestamp and rearm counter
    0cff6d4953091 rtc: abx80x: Fix return value of nvmem callback on read
    625fd91308467 rtc: isl1208: Fix return value of nvmem callbacks
    12880cc086dee drm/i915/dp: Don't switch the LTTPR mode on an active link
    a90e900f71da2 drm/i915/dp: Reset intel_dp->link_trained before retraining the link
    e150f0171c0c0 drm/amd/amdgpu: Fix uninitialized variable warnings
    3237905352379 drm/amdgpu: reset vm state machine after gpu reset(vram lost)
    e290feb8b749a drm/dp_mst: Fix all mstb marked as not probed after suspend/resume
    b29c910cfa242 drm/udl: Remove DRM_CONNECTOR_POLL_HPD
    9d74e50098492 drm/amdgpu/sdma5.2: Update wptr registers as well as doorbell
    05c0fb20ca3e0 drm/i915/gt: Do not consider preemption during execlists_dequeue for gen8
    899857dd71e34 perf/x86/intel/pt: Fix a topa_entry base address calculation
    8f5f3db3fa484 perf/x86/intel/pt: Fix topa_entry base length
    344bb09f4f991 perf/x86/intel/ds: Fix non 0 retire latency on Raptorlake
    76d4ab96bb235 perf/x86/intel/uncore: Fix the bits of the CHA extended umask for SPR
    7d049cd1345c0 perf stat: Fix the hard-coded metrics calculation on the hybrid
    104e258a00403 perf: Fix event leak upon exec and file release
    05d3fd599594a perf: Fix event leak upon exit
    f6be298cc1042 scsi: qla2xxx: validate nvme_local_port correctly
    314efe3f87949 scsi: qla2xxx: Complete command early within lock
    bf192b8be12ca scsi: qla2xxx: Fix flash read failure
    3f43a7da1ef05 scsi: qla2xxx: Reduce fabric scan duplicate code
    56c0f66f86232 scsi: qla2xxx: Use QP lock to search for bsg
    571d7f2a08836 scsi: qla2xxx: Fix for possible memory corruption
    bc78c3f944dc1 scsi: qla2xxx: Unable to act on RSCN for port online
    87c25fcb95aaf scsi: qla2xxx: During vport delete send async logout explicitly
    45230f31f5529 scsi: lpfc: Allow DEVICE_RECOVERY mode after RSCN receipt if in PRLI_ISSUE state
    13749b8d498e7 rtc: cmos: Fix return value of nvmem callbacks
    ab14e199b91ca mm/numa_balancing: teach mpol_to_str about the balancing mode
    21bd3f9e7f924 irqchip/imx-irqsteer: Handle runtime power management correctly
    8b0e8b33dc2ff irqdomain: Fixed unbalanced fwnode get and put
    b67552d7c61f5 devres: Fix memory leakage caused by driver API devm_free_percpu()
    7a76022d53553 devres: Fix devm_krealloc() wasting memory
    d62389073a5b9 ice: Add a per-VF limit on number of FDIR filters
    d77250329dbb7 gve: Fix an edge case for TSO skb validity check
    57fe01d3d0427 kobject_uevent: Fix OOB access within zap_modalias_env()
    f7150b2d5ec34 ASoC: amd: yc: Support mic on Lenovo Thinkpad E16 Gen 2
    414f5028f149a ASoC: SOF: ipc4-topology: Preserve the DMA Link ID for ChainDMA on unprepare
    70a9f00de77f3 kbuild: Fix '-S -c' in x86 stack protector scripts
    75243c9b18f3a decompress_bunzip2: fix rare decompression failure
    460016444ab25 mm: fix old/young bit handling in the faulting path
    5a5625a83eac9 block: fix deadlock between sd_remove & sd_release
    3aba1db19b380 ubi: eba: properly rollback inside self_check_eba
    17c312eb11597 clk: davinci: da8xx-cfgchip: Initialize clk_init_data before use
    b82d43000b8f3 f2fs: use meta inode for GC of COW file
    271fda62e8601 f2fs: use meta inode for GC of atomic file
    077f0e24b27c4 f2fs: fix return value of f2fs_convert_inline_inode()
    e62ff092a42f4 f2fs: fix to don't dirty inode for readonly filesystem
    1789db628bc50 f2fs: fix to force buffered IO on inline_data inode
    b4205dfcfe961 ASoC: fsl: fsl_qmc_audio: Check devm_kasprintf() returned value
    5a33c922b2ad4 scsi: qla2xxx: Return ENOBUFS if sg_cnt is more than one for ELS cmds
    2cac0df3324b5 fs/ntfs3: Update log->page_{mask,bits} if log->page_size changed
    f17cbe5545852 efi/libstub: Zero initialize heap allocated struct screen_info
    ea4f77946226d hostfs: fix dev_t handling
    b579ea3516c37 dev/parport: fix the array out-of-bounds risk
    a1d85fc6bd250 binder: fix hang of unregistered readers
    e22b88f234a1f PCI: loongson: Enable MSI in LS7A Root Complex
    a5b1cce14a49f PCI: rockchip: Use GPIOD_OUT_LOW flag while requesting ep_gpio
    a30211c670489 PCI: dw-rockchip: Fix initial PERST# GPIO value
    09b15029a393d PCI: hv: Return zero, not garbage, when reading PCI_INTERRUPT_PIN
    23837335c3c11 parisc: Fix warning at drivers/pci/msi/msi.h:121
    e91173e375f75 hwrng: amd - Convert PCIBIOS_* return codes to errnos
    8d70d6114610a tools/memory-model: Fix bug in lock.cat
    fe3a28bfeb54b ALSA: usb-audio: Add a quirk for Sonix HD USB Camera
    3e81a7a91307f ALSA: usb-audio: Move HD Webcam quirk to the right place
    923d326f3c515 ALSA: usb-audio: Fix microphone sound on HD webcam.
    689e0780b2290 ALSA: ump: Force 1 Group for MIDI1 FBs
    ad4ab148a50f3 ALSA: ump: Don't update FB name for static blocks
    647cbf2ac6ef0 KVM: nVMX: Request immediate exit iff pending nested event needs injection
    e06f46fdf039c KVM: VMX: Split out the non-virtualization part of vmx_interrupt_blocked()
    5d104a5e99642 media: ivsc: csi: don't count privacy on as error
    b57b5c89d88ed media: uvcvideo: Fix integer overflow calculating timestamp
    82b85a747abe0 jbd2: avoid infinite transaction commit loop
    b81c3758c1df0 jbd2: precompute number of transaction descriptor blocks
    7a8532b537ca0 jbd2: make jbd2_journal_get_max_txn_bufs() internal
    358bc85269d6a media: imx-pxp: Fix ERR_PTR dereference in pxp_probe()
    787b7348ad349 media: ivsc: csi: add separate lock for v4l2 control handler
    04a4668b087a5 leds: mt6360: Fix memory leak in mt6360_init_isnk_properties()
    655cc01889fa9 md/md-bitmap: fix writing non bitmap pages
    f67774b763de8 leds: ss4200: Convert PCIBIOS_* return codes to errnos
    e44eb9d83dcd7 drivers: soc: xilinx: check return status of get_api_version()
    4b060d11633d5 wifi: rtw88: usb: Fix disconnection after beacon loss
    c755c01b3f12f wifi: mwifiex: Fix interface type change
    27be7ff9ffb4a selftests/landlock: Add cred_transfer test
    6a74f52aabb11 trace/pid_list: Change gfp flags in pid_list_fill_irq()
    f1fd860bb2086 io_uring: tighten task exit cancellations
    c3893d9de8ee1 ext4: make sure the first directory block is not a hole
    9d241b7a39af1 ext4: check dot and dotdot of dx_root before making dir indexed
    8d04ddba51f9e m68k: amiga: Turn off Warp1260 interrupts during boot
    57053b3bcf340 udf: Avoid using corrupted block bitmap buffer
    d3ea49fb4a661 task_work: Introduce task_work_cancel() again
    0475bba01abcf task_work: s/task_work_cancel()/task_work_cancel_func()/
    f2d6c5b8ef116 cifs: mount with "unix" mount option for SMB1 incorrectly handled
    31553d20b4220 cifs: fix reconnect with SMB1 UNIX Extensions
    160235efb4f9b cifs: fix potential null pointer use in destroy_workqueue in init_cifs error path
    691aada75653d apparmor: use kvfree_sensitive to free data->data
    4ccd37085976e drm/amd/display: Check for NULL pointer
    bf0ac89faf642 scsi: qla2xxx: Fix optrom version displayed in FDMI
    46d2ef2729578 drm/gma500: fix null pointer dereference in psb_intel_lvds_get_modes
    2d209b2f862f6 drm/gma500: fix null pointer dereference in cdv_intel_lvds_get_modes
    8d01e63faac11 io_uring/io-wq: limit retrying worker initialisation
    8a31e8ff48096 ext2: Verify bitmap and itable block numbers before using them
    9c4e40b9b7312 hfs: fix to initialize fields of hfs_inode_info after hfs_alloc_inode()
    2c59cc6147808 ata: libata-scsi: Honor the D_SENSE bit for CK_COND=1 and no error
    ce477199c53e3 ata: libata-scsi: Do not overwrite valid sense data when CK_COND=1
    66fa52edd32cd media: venus: fix use after free in vdec_close
    2b1aec0e6c1b9 char: tpm: Fix possible memory leak in tpm_bios_measurements_open()
    5a7c16a8b393b ata: libata-scsi: Fix offsets for the fixed format sense data
    fcebdc0d49d27 fuse: verify {g,u}id mount options correctly
    7ca529748b2df sched/fair: set_load_weight() must also call reweight_task() for SCHED_IDLE tasks
    b047898a9f4b6 NFSD: Support write delegations in LAYOUTGET
    46cb65e5b19ab ipv6: take care of scope when choosing the src addr
    0aa47c27f8a2a ipv4: fix source address selection with route leak
    5c07084001e15 kernel: rerun task_work while freezing in get_signal()
    c205565e0f2f4 btrfs: fix extent map use-after-free when adding pages to compressed bio
    5a041d25b6704 af_packet: Handle outgoing VLAN packets without hardware offloading
    9e541c2d60baa net: netconsole: Disable target before netpoll cleanup
    3a58c590f6bd1 tick/broadcast: Make takeover of broadcast hrtimer reliable
    a0495607c1f6f dt-bindings: thermal: correct thermal zone node name limit
    a7ac198f8dba7 exfat: fix potential deadlock on __exfat_get_dentry_set
    d849da88f7dad x86/efistub: Revert to heap allocated boot_params for PE entrypoint
    c12db5aa54152 x86/efistub: Avoid returning EFI_SUCCESS on error
    3e1e4763618d7 mm/mglru: fix overshooting shrinker memory
    0038abf9ddec9 mm: mmap_lock: replace get_memcg_path_buf() with on-stack buffer
    d6510f234c7d1 mm/mglru: fix div-by-zero in vmpressure_calc_level()
    99a49b670ede4 mm/hugetlb: fix possible recursive locking detected warning
    c311d65129ba1 hugetlb: force allocating surplus hugepages on mempolicy allowed nodes
    16896914bace8 landlock: Don't lose track of restrictions on cred_transfer
    cc3368064c68a LoongArch: Check TIF_LOAD_WATCH to enable user space watchpoint
    8fe6e8cb5fba5 sbitmap: fix io hung due to race on sbitmap_word::cleared
    a3e4c8f8da2c8 sbitmap: use READ_ONCE to access map->word
    e511167e65d33 s390/dasd: fix error checks in dasd_copy_pair_store()
    145bc12827186 powerpc/8xx: fix size given to set_huge_pte_at()
    acb2835abe41d fs/ntfs3: Keep runs for $MFT::$ATTR_DATA and $MFT::$ATTR_BITMAP
    f8599ff1a0b99 fs/ntfs3: Missed error return
    58ebd50d22529 fs/ntfs3: Fix the format of the "nocase" mount option
    99eb4449cf0f5 rtc: interface: Add RTC offset to alarm after fix-up
    a3fd1a14ddfd4 nilfs2: avoid undefined behavior in nilfs_cnt32_ge macro
    8acbcc5067acb fs/proc/task_mmu: properly detect PM_MMAP_EXCLUSIVE per page of PMD-mapped THPs
    cdeba6d1cfb10 fs/proc/task_mmu: don't indicate PM_MMAP_EXCLUSIVE without PM_PRESENT
    92e8bd49ab486 fs/proc/task_mmu.c: add_to_pagemap: remove useless parameter addr
    3aa4d9163ae18 fs/proc/task_mmu: indicate PM_FILE for PMD-mapped file THP
    09c5a17293e76 pinctrl: renesas: r8a779g0: Fix TPU suffixes
    798a182fb3946 pinctrl: renesas: r8a779g0: Fix TCLK suffixes
    6b8ba65b09285 pinctrl: renesas: r8a779g0: FIX PWM suffixes
    637cb96dc70c2 pinctrl: renesas: r8a779g0: Fix IRQ suffixes
    37198b25defcd pinctrl: renesas: r8a779g0: Fix (H)SCIF3 suffixes
    70b7259e6f8cc pinctrl: renesas: r8a779g0: Fix (H)SCIF1 suffixes
    e59258c5649c5 pinctrl: renesas: r8a779g0: Fix FXR_TXEN[AB] suffixes
    8cdbe6ebfd176 pinctrl: renesas: r8a779g0: Fix CANFD5 suffix
    a0bfea5e7e8b9 fs/ntfs3: Fix field-spanning write in INDEX_HDR
    ab09df593db51 fs/ntfs3: Drop stray '\' (backslash) in formatting string
    d0c3ba56fb642 fs/ntfs3: Correct undo if ntfs_create_inode failed
    53173e3865acb fs/ntfs3: Replace inode_trylock with inode_lock
    e0ed0ea337fd2 pinctrl: freescale: mxs: Fix refcount of child
    a9b717514070e pinctrl: ti: ti-iodelay: fix possible memory leak when pinctrl_enable() fails
    cbcdfab9b9417 pinctrl: ti: ti-iodelay: Drop if block with always false condition
    197c5c80353be pinctrl: single: fix possible memory leak when pinctrl_enable() fails
    99ae0689ab567 pinctrl: core: fix possible memory leak when pinctrl_enable() fails
    d51dc9f949c37 pinctrl: rockchip: update rk3308 iomux routes
    bcd4e15e7e481 fs/ntfs3: Add missing .dirty_folio in address_space_operations
    055f22654ae3c fs/ntfs3: Fix getting file type
    2f4ddb5a17739 fs/ntfs3: Missed NI_FLAG_UPDATE_PARENT setting
    645da4f92c782 fs/ntfs3: Deny getting attr data block in compressed frame
    c4df2d482137b fs/ntfs3: Fix transform resident to nonresident for compressed files
    f37b756a2350d fs/ntfs3: Merge synonym COMPRESSION_UNIT and NTFS_LZNT_CUNIT
    967879893cfe4 net: dsa: b53: Limit chip-wide jumbo frame config to CPU ports
    50816049b1dc4 net: dsa: mv88e6xxx: Limit chip-wide frame size config to CPU ports
    935dec4e42773 ipv4: Fix incorrect TOS in fibmatch route get reply
    015d29dbe450e ipv4: Fix incorrect TOS in route get reply
    4afbac11f2f62 net: flow_dissector: use DEBUG_NET_WARN_ON_ONCE
    9b66bb1c586cc gve: Fix XDP TX completion handling when counters overflow
    3dd428039e06e ipvs: properly dereference pe in ip_vs_add_service
    69b6a67f70529 netfilter: nf_set_pipapo: fix initial map fill
    744bd92e0b902 netfilter: nft_set_pipapo: constify lookup fn args where possible
    27662b46f2ada netfilter: ctnetlink: use helper function to calculate expect ID
    08e4d9209a033 bnxt_re: Fix imm_data endianness
    ac45a09a19ca9 RDMA: Fix netdev tracker in ib_device_set_netdev
    60708cb279f34 RDMA/core: Remove NULL check before dev_{put, hold}
    ddeff5d66e120 iommu/vt-d: Fix identity map bounds in si_domain_init()
    e22ea60d2cabd RDMA/hns: Fix insufficient extend DB for VFs.
    7bf1e00d95168 RDMA/hns: Fix undifined behavior caused by invalid max_sge
    b47c078787d9e RDMA/hns: Fix shift-out-bounds when max_inline_data is 0
    4d480e45cb7ff RDMA/hns: Fix missing pagesize and alignment check in FRMR
    f098ad96ebb0f RDMA/hns: Fix unmatch exception handling when init eq table fails
    72bbfe07f7ea4 RDMA/hns: Check atomic wr length
    a60111f96ef49 macintosh/therm_windtunnel: fix module unload.
    4af273068f0d1 powerpc/xmon: Fix disassembly CPU feature checks
    924464999a7c3 PCI: dwc: Fix index 0 incorrectly being interpreted as a free ATU slot
    6c1a7c00baacf PCI: qcom-ep: Disable resources unconditionally during PERST# assert
    f59ae465b28a1 MIPS: Octeron: remove source file executable bit
    aa8cc8b237d96 clk: en7523: fix rate divider for slic and spi clocks
    56a118f5c7d54 clk: qcom: Park shared RCGs upon registration
    7e8e9d3d4ecfd clk: qcom: kpss-xcc: Return of_clk_add_hw_provider to transfer the error
    adbaa8f99c9a1 crypto: qat - extend scope of lock in adf_cfg_add_key_value_param()
    846ee3b60abf4 nvmem: rockchip-otp: set add_legacy_fixed_of_cells config option
    90d41ebe0cd46 net: missing check virtio
    30bd459366944 vhost/vsock: always initialize seqpacket_allow
    3750e92cccf09 PCI: endpoint: Fix error handling in epf_ntb_epc_cleanup()
    0e27e2e8697b8 PCI: endpoint: Clean up error handling in vpci_scan_bus()
    99b642dac24f6 ASoC: amd: Adjust error handling in case of absent codec device
    3dbfcd4d68f54 Input: elan_i2c - do not leave interrupt disabled on suspend failure
    480d281743ded RDMA/device: Return error earlier if port in not valid
    52cfbd6d9a1e9 mtd: make mtd_test.c a separate module
    5e1659d71c099 ASoC: max98088: Check for clk_prepare_enable() error
    6e891b0406b24 powerpc/prom: Add CPU info to hardware description string later
    e977bf4c61c6b hwrng: core - Fix wrong quality calculation at hw rng registration
    57600a7dd2b52 scsi: lpfc: Fix a possible null pointer dereference
    b32e36e398e28 ASoC: qcom: Adjust issues in case of DT error in asoc_qcom_lpass_cpu_platform_probe()
    9fbfef061f3f6 RDMA/rxe: Don't set BTH_ACK_MASK for UC or UD QPs
    f79ae071ba348 RDMA/mlx5: Use sq timestamp as QP timestamp when RoCE is disabled
    36812619d2b47 RDMA/mlx4: Fix truncated output warning in alias_GUID.c
    f0583d6dea6c8 RDMA/mlx4: Fix truncated output warning in mad.c
    8f8b4da72f1bd Input: qt1050 - handle CHIP_ID reading error
    48eecce940eff interconnect: qcom: qcm2290: Fix mas_snoc_bimc RPM master ID
    e2c0cc7976174 clk: qcom: gpucc-sa8775p: Update wait_val fields for GPU GDSC's
    9d6cff2b3734b clk: qcom: gpucc-sa8775p: Park RCG's clk source at XO during disable
    5d7c8436e3f90 clk: qcom: gpucc-sa8775p: Remove the CLK_IS_CRITICAL and ALWAYS_ON flags
    e37d8e79ce115 clk: qcom: gcc-sa8775p: Update the GDSC wait_val fields and flags
    48de26f358ae6 clk: qcom: gpucc-sm8350: Park RCG's clk source at XO during disable
    77765f8fc08a1 RDMA/cache: Release GID table even if leak is detected
    9cc5d640d20d4 usb: typec-mux: nb7vpq904m: unregister typec switch on probe error and remove
    5f7b12db1fa44 ASoC: cs35l56: Accept values greater than 0 as IRQ numbers
    417fb74fa7920 ASoc: tas2781: Enable RCA-based playback without DSP firmware download
    93090f08cf7a5 RDMA/mlx5: Set mkeys for dmabuf at PAGE_SIZE
    0b6bef6202963 coresight: Fix ref leak when of_coresight_parse_endpoint() fails
    b8bdda6811778 KVM: PPC: Book3S HV: Fix the get_one_reg of SDAR
    74e308be5b496 KVM: PPC: Book3S HV: Fix the set_one_reg for MMCR3
    d115e1759d189 iio: frequency: adrf6780: rm clk provider include
    b6f7aac2b1bb0 clk: qcom: camcc-sc7280: Add parent dependency to all camera GDSCs
    698f30703f53f clk: qcom: gcc-sc7280: Update force mem core bit for UFS ICE clock
    993cace4f39f6 scsi: ufs: mcq: Fix missing argument 'hba' in MCQ_OPR_OFFSET_n
    526a877c6273d PCI: rcar: Demote WARN() to dev_warn_ratelimited() in rcar_pcie_wakeup()
    0a6f1b5fe8ef8 PCI: keystone: Fix NULL pointer dereference in case of DT error in ks_pcie_setup_rc_app_regs()
    24e2490c58454 PCI: keystone: Don't enable BAR 0 for AM654x
    764d75ce552b6 PCI: keystone: Relocate ks_pcie_set/clear_dbi_mode()
    4cd2eca07fa32 PCI: Fix resource double counting on remove & rescan
    31ff8464ef540 iio: Fix the sorting functionality in iio_gts_build_avail_time_table
    0cd55c6e6d90c SUNRPC: Fixup gss_status tracepoint error output
    c7e94ab3ae78e sparc64: Fix incorrect function signature and add prototype for prom_cif_init
    051a246bae056 leds: flash: leds-qcom-flash: Test the correct variable in init
    1e81d6c383da1 ext4: avoid writing unitialized memory to disk in EA inodes
    6b18e4eff352a ext4: don't track ranges in fast_commit if inode has inlined data
    5d52f871c7f00 NFSv4.1 another fix for EXCHGID4_FLAG_USE_PNFS_DS for DS server
    3b45d190eb7a2 SUNRPC: avoid soft lockup when transmitting UDP to reachable server.
    83e025da9f427 xprtrdma: Fix rpcrdma_reqs_reset()
    5b042b7b3fee6 mfd: omap-usb-tll: Use struct_size to allocate tll
    05e4efd12fca6 mfd: rsmu: Split core code into separate module
    3fc173fb4f3d1 perf intel-pt: Fix exclude_guest setting
    f24f95be74dde perf intel-pt: Fix aux_watermark calculation for 64-bit size
    645753ce91cd5 media: venus: flush all buffers in output plane streamoff
    844801d980561 drm/mediatek/dp: Fix spurious kfree()
    8f0d32c78732f drm/mediatek/dp: switch to ->edid_read callback
    c6e67df64783e ext4: fix infinite loop when replaying fast_commit
    016accce9da6d drm/mediatek: Remove less-than-zero comparison of an unsigned value
    c327a4fafe139 Revert "leds: led-core: Fix refcount leak in of_led_get()"
    4b1f303bdecea drm/qxl: Add check for drm_cvt_mode
    6b723caa4ec2f drm/etnaviv: fix DMA direction handling for cached RW buffers
    7678d9b3487ee perf report: Fix condition in sort__sym_cmp()
    6b3b9c234ce05 perf pmus: Fixes always false when compare duplicates aliases
    fa423fe6d9ca5 perf test: Make test_arm_callgraph_fp.sh more robust
    98c14a4d37f75 drm/msm/dpu: drop validity checks for clear_pending_flush() ctl op
    724ec08c6e0df drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
    cb8aa9d2a4c8a leds: trigger: Unregister sysfs attributes before calling deactivate()
    be50a293ebc61 media: imx-jpeg: Drop initial source change event if capture has been setup
    176509258f77c drm/mediatek: Add OVL compatible name for MT8195
    5dbb98e7fa42b drm/mediatek: Turn off the layers with zero width or height
    7445f2ab56da5 drm/mediatek: Fix destination alpha error in OVL
    7b59d750d43dd drm/mediatek: Fix XRGB setting error in Mixer
    35447af296ae1 drm/mediatek: Fix XRGB setting error in OVL
    232c04216cbf0 drm/mediatek: Use 8-bit alpha in ETHDR
    df55acaac4bb7 drm/mediatek: Add missing plane settings when async update
    74e622f30737e media: renesas: vsp1: Store RPF partition configuration per RPF instance
    fe2025b8f977e media: renesas: vsp1: Fix _irqsave and _irq mix
    c276c2bfd785b media: rcar-csi2: Cleanup subdevice in remove()
    3b6d4821dd076 media: rcar-csi2: Disable runtime_pm in probe error
    ea4f6c74d41f8 media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
    c6ad6096f9ce5 drm: zynqmp_kms: Fix AUX bus not getting unregistered
    b2f9bfe76d460 drm: zynqmp_dpsub: Fix an error handling path in zynqmp_dpsub_probe()
    afb83918e1a95 media: uvcvideo: Override default flags
    6dbe1b7697920 media: uvcvideo: Add quirk for invalid dev_sof in Logitech C920
    7b0155fe8f7e8 media: uvcvideo: Quirk for invalid dev_sof in Logitech C922
    991df39499e55 media: uvcvideo: Disable autosuspend for Insta360 Link
    6377b078e5593 media: i2c: imx219: fix msr access command sequence
    6c1358bbdd5b3 saa7134: Unchecked i2c_transfer function result fixed
    fa6950e4dab8e ipmi: ssif_bmc: prevent integer overflow on 32bit systems
    27465601abe1a x86/shstk: Make return uprobe work with shadow stack
    1c109f23b271a media: mediatek: vcodec: Handle invalid decoder vsi
    8736604ef5335 s390/uv: Don't call folio_wait_writeback() without a folio reference
    79bcb67ed9bb6 s390/mm: Convert gmap_make_secure to use a folio
    098ca9219c496 s390/mm: Convert make_page_secure to use a folio
    249212ceb4187 media: v4l: async: Fix NULL pointer dereference in adding ancillary links
    88a45f9dc1845 media: i2c: Fix imx412 exposure control
    ff64b8197203e media: imon: Fix race getting ictx->lock
    f543af2e0a6df media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()
    3d8fd92939e21 media: pci: ivtv: Add check for DMA map result
    9414381fea73c drm/bridge: it6505: fix hibernate to resume no display issue
    2918b50ad6a7f drm/bridge: Fixed a DP link training bug
    c9bec33bd4cf4 drm/panel: boe-tv101wum-nl6: Check for errors on the NOP in prepare()
    93296c252789d drm/panel: boe-tv101wum-nl6: If prepare fails, disable GPIO before regulators
    93486f4f4810d drm/panel: himax-hx8394: Handle errors from mipi_dsi_dcs_set_display_on() better
    6d72626808325 drm/amdgpu: Remove GC HW IP 9.3.0 from noretry=1
    67b4592a7d74e drm/amdgpu: Check if NBIO funcs are NULL in amdgpu_device_baco_exit
    ae1dd0a379e41 drm/amdgpu: Fix memory range calculation
    0af2e5cb74514 drm/amd/pm: Fix aldebaran pcie speed reporting
    8d869d02a10e5 drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_generic_write_seq()
    4e9d95a132d0b drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq()
    cd1885ae4cbf1 drm/amdkfd: Fix CU Masking for GFX 9.4.3
    5b78b88aa00a6 drm/arm/komeda: Fix komeda probe failing if there are no links in the secondary pipeline
    86d201285a29e drm/rockchip: vop2: Fix the port mux of VP2
    c43046d7e7a49 net: bridge: mst: Check vlan state for egress decision
    bf0ce5aa5f252 xdp: fix invalid wait context of page_pool_destroy()
    e8558b800ea1a Bluetooth: btnxpuart: Add handling for boot-signature timeout errors
    e19f7b046ac23 Bluetooth: btintel: Refactor btintel_set_ppag()
    424b424fad37a Bluetooth: hci_bcm4377: Use correct unit for timeouts
    7c1118588aa66 selftests: forwarding: devlink_lib: Wait for udev events after reloading
    9d40fd516aeae bpf: Fix null pointer dereference in resolve_prog_type() for BPF_PROG_TYPE_EXT
    33a1321fb9a93 bpf: Eliminate remaining "make W=1" warnings in kernel/bpf/btf.o
    b0ff0cd0847b0 bna: adjust 'name' buf size of bna_tcb and bna_ccb structures
    5306d9a55492f bpf: annotate BTF show functions with __printf
    67f4e66b34a4b selftests/resctrl: Fix closing IMC fds on error and open-code R+W instead of loops
    384dc568e3b2f selftests/resctrl: Convert perror() to ksft_perror() or ksft_print_msg()
    ec204ab6c2a9e selftests/resctrl: Move run_benchmark() to a more fitting file
    a2cb20de7a21a selftests/bpf: Close obj in error path in xdp_adjust_tail
    691ec7043122c selftests/bpf: Null checks for links in bpf_tcp_ca
    2a789fc168614 selftests/bpf: Close fd in error path in drop_on_reuseport
    d179ebed94c73 locking/rwsem: Add __always_inline annotation to __down_write_common() and inlined callers
    9a95e70726337 wifi: virt_wifi: don't use strlen() in const context
    477163b7f58e2 gss_krb5: Fix the error handling path for crypto_sync_skcipher_setkey
    36e92b5edc8e0 wifi: virt_wifi: avoid reporting connection success with wrong SSID
    4b66e79650cf0 xfrm: call xfrm_dev_policy_delete when kill policy
    0c92f090170a4 xfrm: fix netdev reference count imbalance
    7a0edc3d83aff wifi: rtw89: Fix array index mistake in rtw89_sta_info_get_iter()
    ef49102bfa364 perf/x86/intel/cstate: Fix Alderlake/Raptorlake/Meteorlake
    0c8a2ef120b81 perf: Fix default aux_watermark calculation
    3e43ad7df75ab perf: Prevent passing zero nr_pages to rb_alloc_aux()
    3d5fa18ea1612 perf: Fix perf_aux_size() for greater-than 32-bit size
    69da07e53ce9b perf/x86/intel/pt: Fix pt_topa_entry_for_page() address calculation
    77bf25dab8cee bpftool: Mount bpffs when pinmaps path not under the bpffs
    878c90b54b839 xfrm: Export symbol xfrm_dev_state_delete.
    0f6b8aed5d915 wifi: rtl8xxxu: 8188f: Limit TX power index
    150b7f9a914a0 wifi: rtw89: 8852b: fix definition of KIP register number
    802de757097bb netfilter: nf_tables: rise cap on SELinux secmark context
    fed3317b2d3f5 ipvs: Avoid unnecessary calls to skb_is_gso_sctp
    d5f53edd43daf xfrm: Fix unregister netdevice hang on hardware offload.
    c276044f2661d libbpf: Checking the btf_type kind when fixing variable offsets
    16c5cb3280b8d net: fec: Fix FEC_ECR_EN1588 being cleared on link-down
    e6c691f6626aa net: fec: Refactor: #define magic constants
    fe2ead240c31e udf: Fix bogus checksum computation in udf_rename()
    67b5f1054197e wifi: cfg80211: handle 2x996 RU allocation in cfg80211_calculate_bitrate_he()
    0675037972d12 wifi: cfg80211: fix typo in cfg80211_calculate_bitrate_he()
    51a8a235f2403 wifi: ath11k: fix wrong handling of CCMP256 and GCMP ciphers
    fc5cdbe1be31f jump_label: Fix concurrency issues in static_key_slow_dec()
    a1359e085d75d perf/x86: Serialize set_attr_rdpmc()
    f7c2f0e0cb5cb mlxsw: spectrum_acl: Fix ACL scale regression and firmware errors
    0e59c2d228532 mlxsw: spectrum_acl_erp: Fix object nesting warning
    1936fa05a1808 lib: objagg: Fix general protection fault
    e382588b8d149 udf: Fix lock ordering in udf_evict_inode()
    be953b4eb420c selftests/bpf: Check length of recv in test_sockmap
    a9e46f955409a net/smc: set rmb's SG_MAX_SINGLE_ALLOC limitation only when CONFIG_ARCH_NO_SG_CHAIN is defined
    44aa1e461ccd1 tcp: fix races in tcp_v[46]_err()
    bc4f9c2ccd68a tcp: fix race in tcp_write_err()
    ecc6836d63513 tcp: add tcp_done_with_error() helper
    c42b268bee48f wifi: ath12k: fix wrong definition of CE ring's base address
    3e779817167a2 wifi: ath11k: fix wrong definition of CE ring's base address
    586c7fb1f5bed wifi: ath11k: Update Qualcomm Innovation Center, Inc. copyrights
    0de96f9a82308 wifi: ath12k: fix firmware crash during reo reinject
    8126f82dab7bd wifi: ath12k: fix invalid memory access while processing fragmented packets
    e99d9b16ff153 wifi: ath12k: change DMA direction while mapping reinjected packets
    7797efc98e715 net: esp: cleanup esp_output_tail_tcp() in case of unsupported ESPINTCP
    d8ffeb5bd59ab selftests/bpf: Fix prog numbers in test_sockmap
    f3c9773d9c3dc bpftool: Un-const bpf_func_info to fix it for llvm 17 and newer
    3d4e3a37cce4e wifi: ath12k: Fix tx completion ring (WBM2SW) setup failure
    cf484c84c69d5 wifi: ath12k: Correct 6 GHz frequency value in rx status
    0c1c95850d870 wifi: brcmsmac: LCN PHY code is used for BCM4313 2G-only device
    d027ac4a08541 firmware: turris-mox-rwtm: Initialize completion before mailbox
    6173dd13f65f3 firmware: turris-mox-rwtm: Fix checking return value of wait_for_completion_timeout()
    2f4f8d171ecc5 firmware: turris-mox-rwtm: Do not complete if there are no waiters
    9312a63da77c0 vmlinux.lds.h: catch .bss..L* sections into BSS")
    e6c9eca327e6a ARM: spitz: fix GPIO assignment for backlight
    b8cdefdaa555b m68k: cmpxchg: Fix return value for default case in __arch_xchg()
    13a71384ae6a8 cpufreq/amd-pstate: Fix the scaling_max_freq setting on shared memory CPPC systems
    72ff9d26964a3 arm64: dts: qcom: sm6350: Add missing qcom,non-secure-domain property
    c2e8bdc0d08ec arm64: dts: rockchip: fixes PHY reset for Lunzn Fastrhino R68S
    78beab7a91293 arm64: dts: rockchip: disable display subsystem for Lunzn Fastrhino R6xS
    d1568659662cb arm64: dts: rockchip: remove unused usb2 nodes for Lunzn Fastrhino R6xS
    215b1aaa73d85 arm64: dts: rockchip: fix pmu_io supply for Lunzn Fastrhino R6xS
    d523659f7abbc arm64: dts: rockchip: fix usb regulator for Lunzn Fastrhino R6xS
    bca0d0102fcde arm64: dts: rockchip: fix regulator name for Lunzn Fastrhino R6xS
    becbe98ceeb1f arm64: dts: rockchip: Add missing power-domains for rk356x vop_mmu
    da8ea49d00921 x86/xen: Convert comma to semicolon
    2e67d5cdc3706 arm64: dts: imx8mp: Fix pgc vpu locations
    713750aadbd0f arm64: dts: imx8mp: add HDMI power-domains
    0150dbc01d266 arm64: dts: imx8mp: Fix pgc_mlmix location
    1beddcda55d54 arm64: dts: imx8mp: Add NPU Node
    1667b2756216e m68k: atari: Fix TT bootup freeze / unexpected (SCU) interrupt messages
    d5cfd8da7e353 arm64: dts: renesas: r9a07g054: Add missing hypervisor virtual timer IRQ
    fc46ee662496f arm64: dts: renesas: r9a07g044: Add missing hypervisor virtual timer IRQ
    35dcc7e3bd258 arm64: dts: renesas: r9a07g043u: Add missing hypervisor virtual timer IRQ
    ad15922975042 arm64: dts: renesas: r8a779g0: Add missing hypervisor virtual timer IRQ
    880c61a7cae2c arm64: dts: renesas: r8a779f0: Add missing hypervisor virtual timer IRQ
    5baa02d5c07f2 arm64: dts: renesas: r8a779a0: Add missing hypervisor virtual timer IRQ
    878177c7dd2da arm64: dts: rockchip: Fix mic-in-differential usage on rk3568-evb1-v10
    e15757553b27f arm64: dts: rockchip: Fix mic-in-differential usage on rk3566-roc-pc
    3f2f40a1d1959 arm64: dts: rockchip: Drop invalid mic-in-differential on rk3568-rock-3a
    3f75eb9f99635 arm64: dts: amlogic: setup hdmi system clock
    fbb1f7ab0b15b arm64: dts: amlogic: add power domain to hdmitx
    b44836994a749 arm64: dts: amlogic: gx: correct hdmi clocks
    3cfa05f9e1ab9 arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add ports node for anx7625
    0580ecfcafb79 arm64: dts: mediatek: mt8183-kukui: Fix the value of `dlg,jack-det-rate` mismatch
    db85bab1a46a2 arm64: dts: mediatek: mt7622: fix "emmc" pinctrl mux
    d014162a3e7ab arm64: dts: mediatek: mt8192-asurada: Add off-on-delay-us for pp3300_mipibrdg
    94a6cd9f279cc arm64: dts: mediatek: mt8183-kukui: Drop bogus output-enable property
    440a052ff9b89 arm64: dts: mediatek: mt8195: Fix GPU thermal zone name for SVS
    80d8afcaecf3d ARM: dts: imx6qdl-kontron-samx6i: fix PCIe reset polarity
    5b2db0b42fa71 ARM: dts: imx6qdl-kontron-samx6i: fix SPI0 chip selects
    e71469e2af115 ARM: dts: imx6qdl-kontron-samx6i: fix board reset
    3b96e42127ab2 ARM: dts: imx6qdl-kontron-samx6i: fix PHY reset
    e139b742a7efb ARM: dts: imx6qdl-kontron-samx6i: fix phy-mode
    7120acc1a1c66 arm64: dts: amlogic: sm1: fix spdif compatibles
    665272557447f arm64: dts: rockchip: Increase VOP clk rate on RK3328
    d48f3bb4314fa soc: qcom: pdr: fix parsing of domains lists
    3e815626d73e0 soc: qcom: pdr: protect locator_addr with the main mutex
    aad41f4c169bc soc: qcom: icc-bwmon: Fix refcount imbalance seen during bwmon_remove
    fab4a7b23492e arm64: dts: qcom: qdu1000: Add secure qfprom node
    7267936f3c115 arm64: dts: qcom: qdu1000-idp: drop unused LLCC multi-ch-bit-off
    051ac32bedab2 arm64: dts: ti: k3-am62-verdin: Drop McASP AFIFOs
    7eb34eae2463b arm64: dts: ti: k3-am625-beagleplay: Drop McASP AFIFOs
    22646c52e42bb arm64: dts: ti: k3-am62x: Drop McASP AFIFOs
    c22649e217457 memory: fsl_ifc: Make FSL_IFC config visible and selectable
    21dec02291f67 OPP: ti: Fix ti_opp_supply_probe wrong return values
    d94eb194aacb3 cpufreq: ti-cpufreq: Handle deferred probe with dev_err_probe()
    4b493143662a8 arm64: dts: qcom: qrb4210-rb2: make L9A always-on
    b6271fb067bfb ARM: dts: stm32: Add arm,no-tick-in-suspend to STM32MP15xx STGEN timer
    0fffc2e1bf40a ARM: dts: sunxi: remove duplicated entries in makefile
    a96e60a6ea681 soc: xilinx: rename cpu_number1 to dummy_cpu_number
    adc0b5c113ab9 arm64: dts: qcom: sa8775p: mark ethernet devices as DMA-coherent
    33fb3e38c98c1 arm64: dts: qcom: msm8996: specify UFS core_clk frequencies
    a86a568567583 arm64: dts: rockchip: Update WIFi/BT related nodes on rk3308-rock-pi-s
    0c4c1b7daf23b arm64: dts: rockchip: Add mdio and ethernet-phy nodes to rk3308-rock-pi-s
    30ee9e5ecc5fd arm64: dts: rockchip: Add pinctrl for UART0 to rk3308-rock-pi-s
    96155dc8c99e7 arm64: dts: rockchip: Add sdmmc related properties on rk3308-rock-pi-s
    459f84f8ee8db soc: qcom: rpmh-rsc: Ensure irqs aren't disabled by rpmh_rsc_send_data() callers
    762384e9cc656 soc: qcom: pmic_glink: Handle the return value of pmic_glink_init
    4bf50c7dcd393 arm64: dts: qcom: msm8998: enable adreno_smmu by default
    23e44279f23e6 arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix IPA firmware path
    d74b0b6c67efc arm64: dts: qcom: msm8996-xiaomi-common: drop excton from the USB PHY
    4d460ea917e75 arm64: dts: qcom: sm8450: add power-domain to UFS PHY
    bfe998470dc45 arm64: dts: qcom: sm8350: add power-domain to UFS PHY
    f43134d6188fd arm64: dts: qcom: sm8250: add power-domain to UFS PHY
    cf2ca135496ad arm64: dts: qcom: sm8250: switch UFS QMP PHY to new style of bindings
    928691e768b17 arm64: dts: qcom: sm6350: add power-domain to UFS PHY
    3832f6d4f4b11 arm64: dts: qcom: sm6115: add power-domain to UFS PHY
    15a0aec207cec arm64: dts: qcom: sdm845: add power-domain to UFS PHY
    23ce7878ed7ba arm64: dts: qcom: sc8180x: add power-domain to UFS PHY
    9a39bcdaa6c84 arm64: dts: qcom: sc8180x: switch UFS QMP PHY to new style of bindings
    72a9e5ffd4837 arm64: dts: qcom: sc8180x: Correct PCIe slave ports
    5bf6767c13d20 hwmon: (max6697) Fix swapped temp{1,8} critical alarms
    feb57c9a4f8d5 hwmon: (max6697) Fix underflow when writing limit attributes
    0804bd05f3354 pwm: atmel-tcb: Fix race condition and convert to guards
    390645c5c1642 drm/meson: fix canvas release in bind function
    908ce7f56847a nvmet-auth: fix nvmet_auth hash error handling
    386171ae7fa8b pwm: stm32: Always do lazy disabling
    00893662707a5 md: Don't wait for MD_RECOVERY_NEEDED for HOT_REMOVE_DISK ioctl
    2a6849a2b6bea block/mq-deadline: Fix the tag reservation code
    b2c67e1f80deb block: Call .limit_depth() after .hctx has been set
    ff36cc0bc63a7 hwmon: (adt7475) Fix default duty on fan is disabled
    96226fbed566f cgroup/cpuset: Prevent UAF in proc_cpuset_show()
    aea95c68b7459 kernfs: Convert kernfs_path_from_node_locked() from strlcpy() to strscpy()
    c8a36455a0fb7 x86/platform/iosf_mbi: Convert PCIBIOS_* return codes to errnos
    56d4e76223aac x86/pci/xen: Fix PCIBIOS_* return code handling
    12b24c1cee71d x86/pci/intel_mid_pci: Fix PCIBIOS_* return code handling
    f6c475c3dc440 x86/of: Return consistent error type from x86_of_pci_irq_enable()
    f04da10d2cbc1 hfsplus: fix to avoid false alarm of circular locking
    c8cae1c194268 x86/kconfig: Add as-instr64 macro to properly evaluate AS_WRUSS
    23a19655fb56f block: initialize integrity buffer to zero before writing it to media
    1cfdfb965e274 ubd: untagle discard vs write zeroes not support handling
    3236c24532839 ubd: refactor the interrupt handler
    b37d68ab60c58 platform/chrome: cros_ec_debugfs: fix wrong EC message version
    2d0738a8322bf md: fix deadlock between mddev_suspend and flush bio
    43b75d54398ac rcu/tasks: Fix stale task snaphot for Tasks Trace
    c25ae63de6805 EDAC, i10nm: make skx_common.o a separate module
    754b569bc801c spi: atmel-quadspi: Add missing check for clk_prepare
    df8e2a3eabcf9 spi: spi-microchip-core: Fix the number of chip selects supported
    310377719c544 powerpc/configs: Update defconfig with now user-visible CONFIG_FSL_IFC
    35046aea43c85 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b86219 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e5039 bpftool: Query only cgroup-related attach types
    f71bb11887bae cpu/amd: inhibit SMP check for qemux86
    c31365597a17b powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b5 usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    7c76aad68f6d1 kselftest: Add a ksft_perror() helper
    06644f0d7193d drm/tilcdc: Set preferred depth
    ff7ae7b323242 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0b arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701f x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c793 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6e qemux86: add configuration symbol to select values
    630c33229e6d5 sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6e clear_warn_once: add a clear_warn_once= boot parameter
    46934791b9026 clear_warn_once: bind a timer to written reset value
    cdee9e38ff324 clear_warn_once: expand debugfs to include read support
    82b562b818419 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b1 libbpf: Fix build warning on ref_ctr_off
    9e3e1fe209827 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65b perf: x86-32: explicitly include <errno.h>
    7b57ddd89565b perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7f perf: fix bench numa compilation
    98bc2815fade4 perf: add SLANG_INC for slang.h
    17209a70b9b39 perf: add sgidefs.h to for mips builds
    9cd4258d910af perf: change --root to --prefix for python install
    8110a4f266284 perf: add 'libperl not found' warning
    bc89d5e08f773 perf: force include of <stdbool.h>
    4f6c760cc876a fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b21 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab3786 FAT: Added FAT_NO_83NAME
    cef98d22b4edf FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1b FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084a aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf21 aufs6: fix magic.mk include path
    35266bc2dc81a aufs6: adapt to v6.6
    8edede4e98be1 aufs6: core
    712248233ebe1 aufs6: standalone
    3b71a8a848d8b aufs6: mmap
    3e2924871f371 aufs6: base
    7f4907a931016 aufs6: kbuild
    d2f7b03e4aa77 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa04 yaffs2: v6.5 fixups
    cc615704b5f54 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf913 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d34 yaffs2: replace bdevname call with sprintf
    395b01cdc39d1 yaffs2: convert read_page -> readfolio
    d98b07e43ba61 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe8 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f3 yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090b yaffs: include blkdev.h
    dbd44252cd592 yaffs: fix misplaced variable declaration
    c223a10b1ac08 yaffs2: v5.6 build fixups
    90f6007cfbf41 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea10 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6e yaffs: repair yaffs_get_mtd_device
    fb98f65a466a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea27 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0b yaffs: Avoid setting any ACL releated xattr
    ff4130a9c3766 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67cd fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba90565 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4a yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8b initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4d pnmtologo: use relocatable file name
    664a6a0a484ba tools: use basename to identify file in gen-mach-types
    9de64bc0c1857 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295a vt/conmakehash: improve reproducibility
    a972323151bdd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc01984 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b197 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffcd defconfigs: drop obselete options
    00fe4152df313 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf1 linux-yocto: Handle /bin/awk issues
    3d55d299f23a7 uvesafb: provide option to specify timeout for task completion
    23c068c080bea uvesafb: print error message when task timeout occurs
    edbfc939266ec compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19ab vmware: include jiffies.h
    572d84d928c87 Resolve jiffies wrapping about arp
    fdcd47cac8435 nfs: Allow default io size to be configured.
    927d488010984 check console device file on fs when booting
    57cc27f821ddf mount_root: clarify error messages for when no rootfs found
    1b53d82a81528 mconf: fix output of cflags and libraries
    1811da09f42ca menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f3 modpost: mask trivial warnings
    6de6730394846 kbuild: exclude meta directory from distclean processing
    6decd32815f53 powerpc: serialize image targets
    f6b683b38318c arm: serialize build targets
    e798b09ebf572 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f86 x86_64_defconfig: Fix warnings
    68491e5f72b61 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce30048 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b18 powerpc: kexec fix for powerpc64
    da6871c62c371 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11de mips: make current_cpu_data preempt safe
    5e94a8247ce7f mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7f mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbdc 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5d malta uhci quirks: make allowance for slow 4k(e)c
    881948cd15176 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7a arm64: defconfig: cleanup config options
    f1727c537ba8d vexpress: Pass LOADADDR to Makefile
    4474c32dc24a4 arm: ARM EABI socketcall
    75e31a2b70fd3 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index a928ac9aa1..f73661c84a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "299b9490722243371219d1e115eecd5f0fa16367"
-SRCREV_meta ?= "dad768d3d6c23e46e232a5b20a7caad80c3dc0e4"
+SRCREV_machine ?= "d9fad680399f7443d173322d9a0112bf98ca7da4"
+SRCREV_meta ?= "4a494b202029e94a72ebb3c3966d9f1d249900f3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.43"
+LINUX_VERSION ?= "6.6.44"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 709341169d..15a0bbb0dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.43"
+LINUX_VERSION ?= "6.6.44"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
-SRCREV_meta ?= "dad768d3d6c23e46e232a5b20a7caad80c3dc0e4"
+SRCREV_machine ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
+SRCREV_meta ?= "4a494b202029e94a72ebb3c3966d9f1d249900f3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 7a34e6a418..c0a8d5e77f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "63d5f5d5e6e730e4d867a9020f07e1e596b1c68c"
-SRCREV_machine:qemuarm64 ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
-SRCREV_machine:qemuloongarch64 ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
-SRCREV_machine:qemumips ?= "0d762cde73dbf7ddfd9af79612054980030ed330"
-SRCREV_machine:qemuppc ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
-SRCREV_machine:qemuriscv64 ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
-SRCREV_machine:qemuriscv32 ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
-SRCREV_machine:qemux86 ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
-SRCREV_machine:qemux86-64 ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
-SRCREV_machine:qemumips64 ?= "fba6619b60be1ec8eb7f9e043c92a79686f94641"
-SRCREV_machine ?= "a481fed9f16f9a627e3dfb4ab22df050ae96f9b1"
-SRCREV_meta ?= "dad768d3d6c23e46e232a5b20a7caad80c3dc0e4"
+SRCREV_machine:qemuarm ?= "2d8c7205265cc1c6e29a3364a75a27bc9ba778cd"
+SRCREV_machine:qemuarm64 ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
+SRCREV_machine:qemuloongarch64 ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
+SRCREV_machine:qemumips ?= "9754a9326e9c11b63586d7a90a79ad6a0f8fbb41"
+SRCREV_machine:qemuppc ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
+SRCREV_machine:qemuriscv64 ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
+SRCREV_machine:qemuriscv32 ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
+SRCREV_machine:qemux86 ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
+SRCREV_machine:qemux86-64 ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
+SRCREV_machine:qemumips64 ?= "7958022dd42f6796c174c33d99dedd75bfd1c22b"
+SRCREV_machine ?= "43ea1c5e6eb3c62ff9bcb45b01728e1a5dff7c11"
+SRCREV_meta ?= "4a494b202029e94a72ebb3c3966d9f1d249900f3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "58b0425ff5df680d0b67f64ae1f3f1ebdf1c4de9"
+SRCREV_machine:class-devupstream ?= "7213910600667c51c978e577bf5454d3f7b313b7"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.43"
+LINUX_VERSION ?= "6.6.44"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


