Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37F8E67495
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:26 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68777.1766353046237461822
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qeRgLcRg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so2167387b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353045; x=1766957845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRsL+cFRAogD4EVp5sn0By+zjbPHAoZvsmN3axbQ8m8=;
        b=qeRgLcRg5cMe4hV14jSie+ClClR4YBedSXJb7hwDQfjr0UUyUC8IuyDBmvAzdiSQO9
         GQ8nwUofWpn2QdV61zVzQR56Wx/1gKGgJmI1Gb+Cp4ZOl9B7MlL7y6CuO3+dsN8PH86+
         JCUW8R+wBvY8caL6vLyrs7T+dj20ZS7WicPGIEyMQM34x/FguVLt4hpKFOpNdK20PxoK
         rW32wrYgMZDPGQZkSyZQ17xRDJxboXepm9coTZxF5oGThm4qUwiCK42FgumLmF+pxs1K
         qma0IBJkWDdvVPjQZoX4I1eh9QnAdWMSga9yGLgEyeD8miIaQCVjAWsF/7oGpYh5p+Lw
         SG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353045; x=1766957845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KRsL+cFRAogD4EVp5sn0By+zjbPHAoZvsmN3axbQ8m8=;
        b=NLV4ByrQbH2E5Ct175ZEM488ETbWyp/DiB4AwWhZMugvj3ts/sKDoXKr7w2KLSBDdN
         svk0UUG+g0bHwfFZtN0P2S0HPp4ffoDZ3PHpb7V3B4Gs6fYeFZcA6eCi+2lJztAApnLm
         3kqVOPab6gQDNirMjTfdgg4L/t61hH8u4oIA/HgrU3gcnx7sbslNMSS+3zWjpvmZO1x/
         sfl+kmi/N9/8xCGaTjYSo9FxUCP/S2LASciSBELBoa45eHqR9r9wmXMLeqD/Ovs0+ioJ
         027ioeVcOblnMNra/LpiobzK+lx8JTltqRTO74jepRUEi+ZkCcKZYb+Jgj1B7vrBxOlg
         FtVQ==
X-Gm-Message-State: AOJu0YxE/GKJT9drQ8trot0uUZ4zPtN54/DsvE1s9WcKrqM3OzRsfoHv
	EwZFenYCyETC7mqQPWBjwlcI8bUOGEmuD9+fIde9JfIlaDBRHAl+/dLvIR1PulujFOfyQ3ft2Ku
	nXQ/C0Tk=
X-Gm-Gg: AY/fxX6ipCgYW4R0D7BpxZbgUiyvw+0To4fpejRtxcxKzqqMDwa0XkIkyZAbSfU2Wqd
	oJ1teEi/gjSIkgTWejpGRnut0nfQZN8rBw6dC05toOHUXWj9YVtWzx2/oFhw24x4YwUBGS772n/
	GeQDAU4cHJlKN4sTr1zqCIonvBreGn56irqry6SKForcZNX/eJnD+XySPOkw0XMS0mZ6JYup5TL
	hx2F5KjxfuQ3K0ZK1tK0H5gVbVPqCavyLwgktAiOAJr6dFzZNKobydGDcaFTHeRf/rhlc1PITc8
	ZoahiEku5wADHJ71pFDIJ8bvXUCj+l0byqOfnbDqvxEYMIXKSRWoxQy8Xl60VcQGaKqiVlI+kg3
	N0KGvRbhtZlzhCDaB8ZmsLc4gEc7PIfDrnHuHQjfzf0MTI4lFgYNZ6n/PGYHp2ybuWEKThiWSLV
	PZSA/IT1/EHCo=
X-Google-Smtp-Source: AGHT+IHhyjyJT7s+BBtcpoJ2k3WrFc92BjANWwZvfsH5NE8xVnUwJR7mqCP0tBEjkbciVAluTdeGvg==
X-Received: by 2002:a05:6a00:8086:b0:7e8:4587:e8c8 with SMTP id d2e1a72fcca58-7ff6687381bmr8396038b3a.59.1766353044673;
        Sun, 21 Dec 2025 13:37:24 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 04/18] linux-yocto/6.12: update to v6.12.58
Date: Sun, 21 Dec 2025 13:36:57 -0800
Message-ID: <1f25f5e1f96a9bd7a3401f1afdb1571524301b04.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228262

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    7475d784169c7 Linux 6.12.58
    b12a603d2213c drm/amd/display: Fix black screen with HDMI outputs
    f4fccd55e81d3 drm/amdgpu: Fix function header names in amdgpu_connectors.c
    451cd07a8f9d4 drm/amdgpu: Fix unintended error log in VCN5_0_0
    3f916a93fc598 ACPI: SPCR: Check for table version when using precise baudrate
    a2dae25eb803e extcon: adc-jack: Cleanup wakeup source only if it was enabled
    86e7baf0ce165 drm/amd/display: update color on atomic commit time
    1a9dcdabc8117 scsi: ufs: core: Add a quirk to suppress link_startup_again
    2d80fad2356ee scsi: ufs: ufs-pci: Set UFSHCD_QUIRK_PERFORM_LINK_STARTUP_ONCE for Intel ADL
    57a6a406f381c scsi: ufs: ufs-pci: Fix S0ix/S3 for Intel controllers
    c664eb1166039 lib/crypto: curve25519-hacl64: Fix older clang KASAN workaround for GCC
    82fe78065450d virtio-net: fix received length check in big packets
    d990c7f180aa7 drm/amd/display: Fix NULL deref in debugfs odm_combine_segments
    6519650838614 drm/amdgpu/smu: Handle S0ix for vangogh
    065bd62412271 smb: client: fix potential UAF in smb2_close_cached_fid()
    3d82cb8465718 smb: client: validate change notify buffer before copy
    a557649f0038e x86/microcode/AMD: Add more known models to entry sign checking
    97f01babb4593 rtc: rx8025: fix incorrect register reference
    9ac1f44723f26 parisc: Avoid crash due to unaligned access in unwinder
    de7f2c67ceb19 iommufd: Don't overflow during division for dirty tracking
    4b7d4aa5399b5 Bluetooth: MGMT: Fix OOB access in parse_adv_monitor_pattern()
    0d63031ee4a57 drm/sched: Fix deadlock in drm_sched_entity_kill_jobs_cb
    aa4be25f41f34 drm/amd/display: Enable mst when it's detected but yet to be initialized
    dc387c6def4dd tracing: Fix memory leaks in create_field_var()
    29d4429a993f1 net: bridge: fix MST static key usage
    bf3843183bc31 net: bridge: fix use-after-free due to MST port state bypass
    c8ab03aa5bd9f lan966x: Fix sleeping in atomic context
    1884402c63349 net: dsa: microchip: Fix reserved multicast address table programming
    6639a9c2fa6e5 net: wan: framer: pef2256: Switch to devm_mfd_add_devices()
    fbc60375ff59b net/mlx5e: SHAMPO, Fix skb size check for 64K pages
    f04217a292573 net: ti: icssg-prueth: Fix fdb hash size configuration
    6fc3fdc5ab190 net/mlx5e: Fix return value in case of module EEPROM read error
    e8fa86b0bd968 wifi: mac80211_hwsim: Limit destroy_on_close radio removal to netgroup
    c43fe48a30ce2 bnxt_en: Add a 'force' parameter to bnxt_free_ctx_mem()
    48c3e656362f1 bnxt_en: Refactor bnxt_free_ctx_mem()
    2b8503ddeb3be bnxt_en: Add mem_valid bit to struct bnxt_ctx_mem_type
    2c8ca35f5a202 bnxt_en: Fix a possible memory leak in bnxt_ptp_init
    ae811175cea35 net: usb: qmi_wwan: initialize MAC header offset in qmimux_rx_fixup
    8ed6059c2c4b6 net: ionic: map SKB after pseudo-header checksum prep
    75d8062e9056a net: ionic: add dma_wmb() before ringing TX doorbell
    a10496048cc57 sctp: Hold sock lock while iterating over address list
    2fe08fcaacb7e sctp: Prevent TOCTOU out-of-bounds write
    97a2bb90a6b64 sctp: Hold RCU read lock while iterating over address list
    a366a1544e511 net: dsa: b53: stop reading ARL entries if search is done
    7236a4840b4be net: dsa: b53: fix enabling ip multicast
    734a04aa66477 net: dsa: b53: fix bcm63xx RGMII port link adjustment
    5a8d24ef5272f net: dsa: b53: fix resetting speed and pause on forced link
    70180a6031056 gpiolib: fix invalid pointer access in debugfs
    5a0aca55e84d9 gpio: swnode: don't use the swnode's name as the key for GPIO lookup
    a4a701a816006 net: vlan: sync VLAN features with lower device
    c62376b938e69 selftests: netdevsim: Fix ethtool-coalesce.sh fail by installing ethtool-common.sh
    91e2fe103be15 selftests/net: use destination options instead of hop-by-hop
    3293a08538ffb selftests/net: fix out-of-order delivery of FIN in gro:tcp test
    02c492301a603 net: dsa: tag_brcm: legacy: fix untagged rx on unbridged ports for bcm63xx
    fc4bb4ed4387d net: dsa: tag_brcm: legacy: reorganize functions
    0545cc1a4a020 Bluetooth: btrtl: Fix memory leak in rtlbt_parse_firmware_v2()
    cf2c2acec1cf4 Bluetooth: hci_event: validate skb length for unknown CC opcode
    c849e6941fec2 riscv: ptdump: use seq_puts() in pt_dump_seq_puts() macro
    27379fcc15a10 riscv: stacktrace: Disable KASAN checks for non-current tasks
    f0b3ecdbb5bbe net: libwx: fix device bus LAN ID
    b42dbef4f2083 ring-buffer: Do not warn in ring_buffer_map_get_reader() when reader catches up
    77d4afd6c78b5 Revert "wifi: ath10k: avoid unnecessary wait for service ready message"
    0eaa0a3dfe218 drm/mediatek: Disable AFBC support on Mediatek DRM driver
    a6a493b985bff media: videobuf2: forbid remove_bufs when legacy fileio is active
    d3ecc18281d3d media: uvcvideo: Use heuristic to find stream entity
    e2b3859067bf0 btrfs: ensure no dirty metadata is written back for an fs with errors
    228573280db98 ALSA: hda/realtek: Audio disappears on HP 15-fc000 after warm boot again
    9d4583a57fcc7 x86: uaccess: don't use runtime-const rewriting in modules
    822166b6b764c x86/runtime-const: Add the RUNTIME_CONST_PTR assembly macro
    141a3e658b6bc x86: use cmov for user address masking
    07640d34a781b ceph: fix multifs mds auth caps issue
    61f1263954269 ceph: refactor wake_up_bit() pattern of calling
    08beed92552f3 ceph: fix potential race condition in ceph_ioctl_lazyio()
    80e2b741af98a ceph: add checking of wait_for_completion_killable() return value
    e2105ba1c262d drm/amdkfd: Fix mmap write lock not release
    cda427c933b47 ASoC: meson: aiu-encoder-i2s: fix bit clock polarity
    12cdc37381728 kbuild: uapi: Strip comments before size type check
    328ddff9ab058 net: wwan: t7xx: add support for HP DRMR-H01
    7a31a7abdb104 rtc: pcf2127: fix watchdog interrupt mask on pcf2131
    15ba9acafb051 fbdev: Add bounds checking in bit_putcs to fix vmalloc-out-of-bounds
    9285548962479 tools: lib: thermal: use pkg-config to locate libnl3
    f36678ddde84c tools: lib: thermal: don't preserve owner in install
    df5af85e15820 tools bitmap: Add missing asm-generic/bitsperlong.h include
    8effcd6db7a29 LoongArch: Handle new atomic instructions for probes
    76e6561d7b1b4 ACPI: property: Return present device nodes only on fwnode interface
    de7488fd00dca scsi: ufs: core: Include UTP error in INT_FATAL_ERRORS
    425be0fd8c220 9p: sysfs_init: don't hardcode error to ENOMEM
    0e0d3046270e0 cpufreq: tegra186: Initialize all cores to max frequencies
    659233c179e0e 9p: fix /sys/fs/9p/caches overwriting itself
    1c1fcba64ee5d NTB: epf: Allow arbitrary BAR mapping
    a1f310511c922 clk: clocking-wizard: Fix output clock register offset for Versal platforms
    6bd92bdc43664 clk: scmi: Add duty cycle ops only when duty cycle is supported
    51771264b874f clk: ti: am33xx: keep WKUP_DEBUGSS_CLKCTRL enabled
    2e1461034aef9 9p/trans_fd: p9_fd_request: kick rx thread if EPOLLIN
    b2cf49f469caf clk: at91: clk-sam9x60-pll: force write to PLL_UPDT register
    0fbbc9973997b clk: at91: clk-master: Add check for divide by 3
    7af4f219766d5 clk: at91: sam9x7: Add peripheral clock id for pmecc
    15e6440f2ab18 ARM: at91: pm: save and restore ACR during PLL disable/enable
    bc56647527762 rtc: pcf2127: clear minute/second interrupt
    8de8329100447 clk: sunxi-ng: sun6i-rtc: Add A523 specifics
    d8c4a6d84bfdc um: Fix help message for ssl-non-raw
    4e7a3e00c1a77 fs/hpfs: Fix error code for new_inode() failure in mkdir/create/mknod/symlink
    9a7a5d50ee2e0 clk: qcom: gcc-ipq6018: rework nss_port5 clock to multiple conf
    6125acdf9aceb btrfs: mark dirty extent range for out of bound prealloc extents
    3412d0e973e8f btrfs: fix memory leak of qgroup_list in btrfs_add_qgroup_relation
    fa5867c496528 RDMA/hns: Fix wrong WQE data when QP wraps around
    65ddffb2c718c RDMA/hns: Fix the modification of max_send_sge
    2f8953e1b1398 RDMA/hns: Fix recv CQ and QP cache affinity
    6562b4233795b RDMA/irdma: Set irdma_cq cq_num field during CQ create
    ec3efa0d83970 RDMA/irdma: Remove unused struct irdma_cq fields
    a99cfe5cf60a6 RDMA/irdma: Fix SD index calculation
    b7c21dec60f9d ACPICA: Update dsmethod.c to get rid of unused variable warning
    6e223d5dc81d2 drm/amd/display: Add fallback path for YCBCR422
    c5f456784a847 char: misc: restrict the dynamic range to exclude reserved minors
    ab03634f6c18d usb: xhci-pci: Fix USB2-only root hub registration
    edd824eb45e4f ima: don't clear IMA_DIGSIG flag when setting or removing non-IMA xattr
    ecda324c28049 smb: client: transport: avoid reconnects triggered by pending task work
    c55305efbc1a6 ksmbd: use sock_create_kern interface to create kernel socket
    40c8ee40e48a2 ftrace: Fix softlockup in ftrace_module_enable
    9127d1e90c90e orangefs: fix xattr related buffer overflow...
    10de826c551cb page_pool: Clamp pool size to max 16K pages
    2896476cb4b19 6pack: drop redundant locking and refcounting
    6bc58b4c53795 exfat: validate cluster allocation bits of the allocation bitmap
    a76aba65e823f exfat: limit log print for IO error
    ac79f9b6c6324 net: stmmac: est: Drop frames causing HLBS error
    acf2159ffef40 ALSA: usb-audio: add mono main switch to Presonus S1824c
    b420a4c7f915f Bluetooth: bcsp: receive data only if registered
    da4e3cfba2563 Bluetooth: btusb: Add new VID/PID 13d3/3633 for MT7922
    ed10dddc7df2d Bluetooth: SCO: Fix UAF on sco_conn_free
    2ad85a751fa1b Bluetooth: btusb: Check for unexpected bytes when defragmenting HCI frames
    0d2fad775194f net: macb: avoid dealing with endianness in macb_set_hwaddr()
    c691d6a238e1f net/mlx5e: Don't query FEC statistics when FEC is disabled
    47ed17f2cbea2 vfio/pci: Fix INTx handling on legacy non-PCI 2.3 devices
    0dae3d96ca011 ACPI: scan: Update honor list for RPMI System MSI
    fbf767ea54d86 ASoC: tlv320aic3x: Fix class-D initialization for tlv320aic3007
    4d7fc991d2769 ASoC: stm32: sai: manage context in set_sysclk callback
    bc9e789053abe amd/amdkfd: resolve a race in amdgpu_amdkfd_device_fini_sw
    1c553d19ff283 ext4: increase IO priority of fastcommit
    238f7a7356c33 fs: ext4: change GFP_KERNEL to GFP_NOFS to avoid deadlock
    d1dfe21a332d3 accel/habanalabs: support mapping cb with vmalloc-backed coherent memory
    71b40ff8d3031 accel/habanalabs/gaudi2: read preboot status after recovering from dirty state
    c53ac86de8e85 accel/habanalabs: return ENOMEM if less than requested pages were pinned
    21aecbbff7502 scsi: mpt3sas: Add support for 22.5 Gbps SAS link rate
    a71cf0a1100c0 accel/habanalabs/gaudi2: fix BMON disable configuration
    ac7872404a26f scsi: libfc: Fix potential buffer overflow in fc_ct_ms_fill()
    50952c6c3c30c net: bridge: Install FDB for bridge MAC on VLAN 0
    40be5b9080114 nfs4_setup_readdir(): insufficient locking for ->d_parent->d_inode dereferencing
    0fc9604a42ee8 NFSv4.1: fix mount hang after CREATE_SESSION failure
    4904f473c4553 NFSv4: handle ERR_GRACE on delegation recalls
    204ac63a8fecf drm/amd/display: change dc stream color settings only in atomic commit
    c424fce27e5cd drm/amd/display: Fix for test crash due to power gating
    0b9cb68d1aa2b drm/amd/display: Init dispclk from bootup clock for DCN314
    5949255c589b8 drm/amd/display: Add AVI infoframe copy in copy_stream_update_to_stream
    634e0468c31ec net: dsa: microchip: Set SPI as bus interface during reset for KSZ8463
    07d862c7de3d6 wifi: ath12k: Increase DP_REO_CMD_RING_SIZE to 256
    8ce228a03c855 remoteproc: qcom: q6v5: Avoid handling handover twice
    a4a6e1c87880e selftests: forwarding: Reorder (ar)ping arguments to obey POSIX getopt
    9200cc08d44c6 PCI/PM: Skip resuming to D0 if device is disconnected
    93b6099076f71 crypto: hisilicon/qm - clear all VF configurations in the hardware
    e551fa258ec9a crypto: hisilicon/qm - invalidate queues in use
    76ff15eacef6a vfio: return -ENOTTY for unsupported device feature
    59ef42bb3cf67 sparc64: fix prototypes of reads[bwl]()
    4bfc756fef80b sparc/module: Add R_SPARC_UA64 relocation handling
    953eb3796ef06 PCI: cadence: Check for the existence of cdns_pcie::ops before using it
    d32bc92bf53ea r8169: set EEE speed down ratio to 1
    496188098d888 net: intel: fm10k: Fix parameter idx set but not used
    522734fc807c6 wifi: mac80211: Track NAN interface start/stop
    8db790c2491e8 wifi: ath10k: Fix connection after GTK rekeying
    3a5394b3b0b82 iommu/vt-d: Replace snprintf with scnprintf in dmar_latency_snapshot()
    0d06aa3007904 bus: mhi: core: Improve mhi_sync_power_up handling for SYS_ERR state
    202d502593f5a net: ethernet: microchip: sparx5: make it selectable for ARCH_LAN969X
    80d3bf09168e3 net: phy: clear link parameters on admin link down
    75b7565439223 ASoC: qcom: sc8280xp: explicitly set S16LE format in sc8280xp_be_hw_params_fixup()
    35f3fb86bb015 drm/amdgpu/atom: Check kcalloc() for WS buffer in amdgpu_atom_execute_table_locked()
    cbf2f527ae4ca jfs: fix uninitialized waitqueue in transaction manager
    1795277a4e98d jfs: Verify inode mode when loading from disk
    50610139823b5 IB/ipoib: Ignore L3 master device
    8ced3cb73ccd2 RDMA/irdma: Update Kconfig
    8bb73ab12d939 ipv6: np->rxpmtu race annotation
    e792e710e1fbd usb: xhci-pci: add support for hosts with zero USB3 ports
    72f1984246e6a wifi: rtw89: renew a completion for each H2C command waiting C2H event
    336da4414300b wifi: rtw89: obtain RX path from ppdu status IE00
    c0b9951bb2668 f2fs: fix infinite loop in __insert_extent_tree()
    2cde2edef9ceb usb: xhci: plat: Facilitate using autosuspend for xhci plat devices
    8b2b310be1fe9 usb: mon: Increase BUFF_MAX to 64 MiB to support multi-MB URBs
    39f3ac9cc5cce allow finish_no_open(file, ERR_PTR(-E...))
    4ae7e2d72da64 scsi: lpfc: Ensure PLOGI_ACC is sent prior to PRLI in Point to Point topology
    fdf019f2a342b scsi: lpfc: Define size of debugfs entry for xri rebalancing
    78273bfb21d9e scsi: lpfc: Remove ndlp kref decrement clause for F_Port_Ctrl in lpfc_cleanup
    dd475ead4bf7e scsi: lpfc: Check return status of lpfc_reset_flush_io_context during TGT_RESET
    90b02095726f2 scsi: lpfc: Decrement ndlp kref after FDISC retries exhausted
    234cb3ca07c34 scsi: lpfc: Clean up allocated queues when queue setup mbox commands fail
    c6e1e2135d004 scsi: ufs: core: Disable timestamp functionality if not supported
    961af1c22e558 selftests/Makefile: include $(INSTALL_DEP_TARGETS) in clean target to clean net/lib dependency
    f893ccd30b3f5 drm/amdgpu: reject gang submissions under SRIOV
    91630b700fabd drm/xe/guc: Return an error code if the GuC load fails
    262e830ce16b0 HID: i2c-hid: Resolve touchpad issues on Dell systems during S4
    689ca6be7ee50 ethernet: Extend device_get_mac_address() to use NVMEM
    3671a07759520 page_pool: always add GFP_NOWARN for ATOMIC allocations
    0fccd5180fdf7 drm/amd/display/dml2: Guard dml21_map_dc_state_into_dml_display_cfg with DC_FP_START
    15abc54efdcc6 drm/amd/display: Disable VRR on DCE 6
    cc9387df03f80 drm/amd/display: Fix DVI-D/HDMI adapters
    305cd0ca0efa2 drm/amd: Avoid evicting resources at S5
    bf3b34614f5e9 drm/amd/display: fix dml ms order of operations
    acf23b42132cc drm/amd/display: Set up pixel encoding for YCBCR422
    c5b9a12c71f17 drm/amdgpu: Use memdup_array_user in amdgpu_cs_wait_fences_ioctl
    da91687f01f46 wifi: mt76: mt7996: fix memory leak on mt7996_mcu_sta_key_tlv error
    bfb9d871844b4 ALSA: serial-generic: remove shared static buffer
    a534dd44b70e8 wifi: mt76: mt76_eeprom_override to int
    aa5ed215cfe87 wifi: mt76: mt7996: Temporarily disable EPCS
    efe2ef24feab0 wifi: mt76: mt7921: Add 160MHz beamformee capability for mt7922 device
    06a2fc1d1ef0d net/cls_cgroup: Fix task_get_classid() during qdisc run
    082dbb39af036 crypto: caam - double the entropy delay interval for retry
    dcfd2557325ac crypto: ccp - Fix incorrect payload size calculation in psp_poulate_hsti()
    c65a83bcc90fb PCI: dwc: Verify the single eDMA IRQ in dw_pcie_edma_irq_verify()
    1b3b8b67773e9 crypto: sun8i-ce - remove channel timeout field
    09d0da8d29a2f watchdog: s3c2410_wdt: Fix max_timeout being calculated larger
    77a3e9b0b3cd9 HID: asus: add Z13 folio to generic group for multitouch to work
    51b3033088f04 udp_tunnel: use netdev_warn() instead of netdev_WARN()
    bcd4e9fc4f181 net: devmem: expose tcp_recvmsg_locked errors
    b5a02be42517d selftests: Replace sleep with slowwait
    1c25b38929e7d eth: 8139too: Make 8139TOO_PIO depend on !NO_IOPORT_MAP
    ce0145574d748 selftests: Disable dad for ipv6 in fcnal-test.sh
    32718b63671ec x86/kvm: Prefer native qspinlock for dedicated vCPUs irrespective of PV_UNHALT
    7f56d81d1c3d8 netfilter: nf_reject: don't reply to icmp error messages
    483886e1f7760 openrisc: Add R_OR1K_32_PCREL relocation type module support
    317d3bbc22220 selftests: traceroute: Return correct value on failure
    51d35366f9175 selftests: traceroute: Use require_command()
    1ca27d3174864 media: redrat3: use int type to store negative error codes
    f4a427973f925 selftests: net: replace sleeps in fcnal-test with waits
    e2d440f2c1d1d net: sh_eth: Disable WoL if system can not suspend
    32f3d1e812f3e drm/msm/registers: Generate _HI/LO builders for reg64
    66bb2a020d594 phy: rockchip: phy-rockchip-inno-csidphy: allow writes to grf register 0
    1539159cf2089 phy: renesas: r8a779f0-ether-serdes: add new step added to latest datasheet
    3e9223eeb143a Fix access to video_is_primary_device() when compiled without CONFIG_VIDEO
    88f1caa0cdd8f phy: cadence: cdns-dphy: Enable lower resolutions in dphy
    5de410dfb4d90 wifi: mac80211: Fix HE capabilities element check
    37f65e68ba985 ntfs3: pretend $Extend records as regular files
    9c899984def99 scsi: ufs: host: mediatek: Disable auto-hibern8 during power mode changes
    10ad4de87f32c scsi: ufs: host: mediatek: Correct system PM flow
    70b956be58696 net: phy: marvell: Fix 88e1510 downshift counter errata
    7783805fb864a scsi: ufs: host: mediatek: Enhance recovery on hibernation exit failure
    0a762d32f1387 scsi: ufs: host: mediatek: Fix unbalanced IRQ enable issue
    074ecd24d0418 scsi: ufs: host: mediatek: Enhance recovery on resume failure
    a8482a6d412c9 selftests: mptcp: join: allow more time to send ADD_ADDR
    0d8ea98ebb08e f2fs: fix wrong layout information on 16KB page
    e53f250bd1977 media: i2c: og01a1b: Specify monochrome media bus format instead of Bayer
    1e792110823e9 media: ov08x40: Fix the horizontal flip control
    f157d1cb2cdc5 wifi: iwlwifi: fw: Add ASUS to PPAG and TAS list
    e741dabcc52b9 PCI: endpoint: pci-epf-test: Limit PCIe BAR size for fixed BARs
    e9f66c989de49 char: Use list_del_init() in misc_deregister() to reinitialize list pointer
    20d15d76605fd drm/msm: make sure to not queue up recovery more than once
    f0db721d8f319 tty/vt: Add missing return value for VT_RESIZE in vt_ioctl()
    9c52f01429c37 usb: cdns3: gadget: Use-after-free during failed initialization and exit of cdnsp gadget
    fd6820af0ac9c usb: gadget: f_hid: Fix zero length packet transfer
    e014ff9ec18dd net: dsa: felix: support phy-mode = "10g-qxgmii"
    b3cc2a33b3c79 drm/amd/display: Fix pbn_div Calculation Error
    e4481e73e4ccf drm/amdgpu: add support for cyan skillfish gpu_info
    1f3eb6d464b01 drm/amdgpu: don't enable SMU on cyan skillfish
    1a15bde54e194 drm/amd: add more cyan skillfish PCI ids
    512f9a6c1531e iommu/apple-dart: Clear stream error indicator bits for T8110 DARTs
    1eefe9a9ceb63 crypto: ccp: Skip SEV and SNP INIT for kdump boot
    3344716ddee01 iommu/amd: Skip enabling command/event buffers for kdump
    8cd230920bdf2 smsc911x: add second read of EEPROM mac when possible corruption seen
    562bcdc0d776f net: call cond_resched() less often in __release_sock()
    8831d3a5d896e drm/xe/guc: Set upper limit of H2G retries over CTB
    598e9fc58aa97 PCI: imx6: Enable the Vaux supply if available
    73cd60aaba743 ALSA: usb-audio: apply quirk for MOONDROP Quark2
    c9df78e84e85c wifi: mac80211: Fix 6 GHz Band capabilities element advertisement in lower bands
    f013e6aadd6d8 media: verisilicon: Explicitly disable selection api ioctls for decoders
    f6405d5ea261f media: adv7180: Only validate format in querystd
    115a068cd28cc media: adv7180: Do not write format to device in set_fmt
    5f9e09f28609b media: adv7180: Add missing lock in suspend callback
    e01a42c5a1855 net: nfc: nci: Increase NCI_DATA_TIMEOUT to 3000 ms
    1da1cfa9c2b55 drm: panel-backlight-quirks: Make EDID match optional
    885c69a343101 drm/panthor: check bo offset alignment in vm bind
    483303d94c2d4 ipv6: Add sanity checks on ipv6_devconf.rpl_seg_enabled
    356f6a277f05f selftests: drv-net: rss_ctx: make the test pass with few queues
    4a988c672b668 drm/xe/guc: Increase GuC crash dump buffer size
    6238fab18c1c6 drm/amdgpu: Allow kfd CRIU with no buffer objects
    ddd8742737669 drm/msm/dsi/phy_7nm: Fix missing initial VCO rate
    e8b63d342d434 drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
    2c55ec15062e1 dmaengine: dw-edma: Set status for callback_result
    4cd966067226e dmaengine: mv_xor: match alloc_wc and free_wc
    0f0d31760811d dmaengine: sh: setup_xref error handling
    3b66c3689fde9 ptp: Limit time setting of PTP clocks
    65d52148298b5 scsi: ufs: exynos: fsd: Gate ref_clk and put UFS device in reset on suspend
    5838b11e66801 scsi: pm8001: Use int instead of u32 to store error codes
    2ced7045c9319 crypto: qat - use kcalloc() in qat_uclo_map_objs_from_mof()
    bc2b881a0896c tcp: use dst_dev_rcu() in tcp_fastopen_active_disable_ofo_check()
    047c08808c22d microchip: lan865x: add ndo_eth_ioctl handler to enable PHY ioctl support
    296357dcdc4b5 inet_diag: annotate data-races in inet_diag_bc_sk()
    62d07edc3408a mips: lantiq: danube: rename stp node on EASY50712 reference board
    b3b2bcb198cc3 mips: lantiq: xway: sysctrl: rename stp clock
    00f2c5bb59b10 mips: lantiq: danube: add missing device_type in pci node
    e91be5cb71eec mips: lantiq: danube: add model to EASY50712 dts
    77439a0d125e2 mips: lantiq: danube: add missing properties to cpu node
    e14605b6035e9 drm/amdgpu: Respect max pixel clock for HDMI and DVI-D (v2)
    fd1052e860b43 drm/amdgpu: Avoid vcn v5.0.1 poison irq call trace on sriov guest
    353c6373d8d9f drm/amd/display: incorrect conditions for failing dto calculations
    cc84d7a6ba012 drm/amd/display: Increase minimum clock for TMDS 420 with pipe splitting
    e5fd6965f6b55 ASoC: SOF: ipc4-pcm: Add fixup for channels
    bc7bb1a0dd257 media: pci: mgb4: Fix timings comparison in VIDIOC_S_DV_TIMINGS
    d17dc9b16a1a6 media: fix uninitialized symbol warnings
    20b979de3fdc2 selftests: drv-net: rss_ctx: fix the queue count check
    2f95f8cbc5df6 platform/x86/intel-uncore-freq: Fix warning in partitioned system
    79670b12a4161 drm/amdkfd: Tie UNMAP_LATENCY to queue_preemption
    3cc92e9bffa7c drm/amd/display: Support HW cursor 180 rot for any number of pipe splits
    01ffa1ba69d9b drm/amdkfd: fix vram allocation failure for a special case
    d367caca4a64a drm/amdgpu: Correct the counts of nr_banks and nr_errors
    deee089a226f8 fuse: zero initialize inode private data
    c57da33f6316e net: phy: fixed_phy: let fixed_phy_unregister free the phy_device
    67a9a278c96f4 remoteproc: wkup_m3: Use devm_pm_runtime_enable() helper
    8c30f5534b097 extcon: adc-jack: Fix wakeup source leaks on device unbind
    ad1c6577a0d3c scsi: pm80xx: Fix race condition caused by static variables
    d4375909d89e0 scsi: mpi3mr: Fix controller init failure on fault during queue creation
    f3355d810570d scsi: mpi3mr: Fix I/O failures during controller reset
    a0559eb8dcc6a net: ipv4: allow directed broadcast routes to use dst hint
    212187161ecec rpmsg: char: Export alias for RPMSG ID rpmsg-raw from table
    0db2260ecd3cd media: ipu6: isys: Set embedded data type correctly for metadata formats
    93fbacaf4875e net: wangxun: limit tx_max_coalesced_frames_irq
    c0aac13ce3789 rds: Fix endianness annotation for RDS_MPATH_HASH
    b2caf82bcdfe4 idpf: do not linearize big TSO packets
    9b966c72b6a7a ALSA: usb-audio: Add validation of UAC2/UAC3 effect units
    5a1e6d4dd11a7 tty: serial: Modify the use of dev_err_probe()
    97c9394124a0b bnxt_en: Add Hyper-V VF ID
    ccb8a899530f1 PCI/P2PDMA: Fix incorrect pointer usage in devm_kfree() call
    6b9525596a83c f2fs: fix to detect potential corrupted nid in free_nid_list
    0f5cb5b089b05 net: Call trace_sock_exceed_buf_limit() for memcg failure with SK_MEM_RECV.
    719fcdf29051f net: stmmac: Correctly handle Rx checksum offload errors
    2263e086abefb net: When removing nexthops, don't call synchronize_net if it is not necessary
    6f3dcc809071d char: misc: Does not request module for miscdevice with dynamic minor
    72cd71ec60e89 char: misc: Make misc_register() reentry for miscdevice who wants dynamic minor
    b40c7c348f6a6 dm error: mark as DM_TARGET_PASSES_INTEGRITY
    958234997dd51 wifi: rtw89: fix BSSID comparison for non-transmitted BSSID
    ca18975c4de2e wifi: rtw89: wow: remove notify during WoWLAN net-detect
    858e1b984408c usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
    5a46feb45873c iio: adc: imx93_adc: load calibrated values even calibration failed
    71cb5d38a7398 iio: adc: spear_adc: mask SPEAR_ADC_STATUS channel and avg sample before setting register
    b8698db53a1b4 drm/amdkfd: Handle lack of READ permissions in SVM mapping
    47281febebe33 drm/amdgpu: fix nullptr err of vm_handle_moved
    ac5a106c6da6e drm/bridge: display-connector: don't set OP_DETECT for DisplayPorts
    fecad28960498 HID: pidff: PERMISSIVE_CONTROL quirk autodetection
    17107ba4050e1 HID: pidff: Use direction fix only for conditional effects
    475e9d306c1c1 drm/panthor: Serialize GPU cache flush operations
    0213e4175abbb media: imon: make send_packet() more robust
    c14cf41094136 net: ipv6: fix field-spanning memcpy warning in AH output
    22dd4394da5a2 scsi: ufs: host: mediatek: Fix invalid access in vccqx handling
    f394022d753e7 scsi: ufs: host: mediatek: Change reset sequence for improved stability
    514a0a4c4945e scsi: ufs: host: mediatek: Assign power mode userdata before FASTAUTO mode change
    3cedc28d28695 scsi: ufs: host: mediatek: Fix PWM mode switch issue
    9aa36bba59533 scsi: ufs: host: mediatek: Fix auto-hibern8 timer configuration
    d7e41e51c4d0e bridge: Redirect to backup port when port is administratively down
    a77f4ee149db7 s390/pci: Use pci_uevent_ers() in PCI recovery
    62b249b132fc1 powerpc/eeh: Use result of error_detected() in uevent
    460e0dc9af2d7 tty: serial: ip22zilog: Use platform device for probing
    c3b015d15c820 thunderbolt: Use is_pciehp instead of is_hotplug_bridge
    747930be915ef ice: Don't use %pK through printk or tracepoints
    740bfb80ac594 net: stmmac: Check stmmac_hw_setup() in stmmac_resume()
    1b2d4eea3f54c x86/vsyscall: Do not require X86_PF_INSTR to emulate vsyscall
    fea2f9e487d7d PCI/ERR: Update device error_state already after reset
    e12465e5b70c5 media: i2c: Kconfig: Ensure a dependency on HAVE_CLK for VIDEO_CAMERA_SENSOR
    6f6a157df378e drm/tidss: Set crtc modesetting parameters with adjusted mode
    e6f4716011fd2 drm/bridge: cdns-dsi: Don't fail on MIPI_DSI_MODE_VIDEO_BURST
    6827f61b02f4d drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
    754cb9cc89f63 drm/tidss: Use the crtc_* timings when programming the HW
    41edf187dd246 media: amphion: Delete v4l2_fh synchronously in .release()
    c9d4cf333f3d7 media: pci: ivtv: Don't create fake v4l2_fh
    0b240c76defc9 drm/amdkfd: return -ENOTTY for unsupported IOCTLs
    bc1ca06998c1c wifi: rtw88: sdio: use indirect IO for device registers before power-on
    8ebef59d02945 wifi: rtw89: print just once for unknown C2H events
    b0faf30921d55 selftests/net: Ensure assert() triggers in psock_tpacket.c
    5f58cae7ccf94 selftests/net: Replace non-standard __WORDSIZE with sizeof(long) * 8
    59f223bace9fe PCI: Disable MSI on RDC PCI to PCIe bridges
    1ffd2a2cdbbbb drm/amd/display: Wait until OTG enable state is cleared
    fc17bb647d416 drm/amd/display: Reset apply_eamless_boot_optimization when dpms_off
    3db7394212d02 ASoC: mediatek: Use SND_JACK_AVOUT for HDMI/DP jacks
    630debf099bac drm/nouveau: replace snprintf() with scnprintf() in nvkm_snprintbf()
    86ddaac6f06fc drm/amdgpu/jpeg: Hold pg_lock before jpeg poweroff
    8a379fd23e802 drm/amd/pm: Use cached metrics data on arcturus
    b024916b365de drm/amd/pm: Use cached metrics data on aldebaran
    7abc99984f8b2 drm/amd/display: update dpp/disp clock from smu clock table
    1b18a6fd7dd92 drm/amd/display: add more cyan skillfish devices
    51ece8d2a98ad drm/amdgpu: Skip poison aca bank from UE channel
    eb553214dc9d5 drm/amd/amdgpu: Release xcp drm memory after unplug
    55fadcd04ed2e drm/amdgpu: Avoid rma causes GPU duplicate reset
    99428bd6123d5 drm/xe: Fix oops in xe_gem_fault when running core_hotunplug test.
    efffbbbe80bce drm/xe/guc: Add more GuC load error status codes
    ec77576783514 drm/amd/display: Increase AUX Intra-Hop Done Max Wait Duration
    021fe59351fb2 drm/amd/display: Move setup_stream_attribute
    a72b486d41352 drm/amdgpu: Check vcn sram load return value
    9cb03fb9ec46e drm/amdgpu: add range check for RAS bad page address
    77e69d00a457f drm/amd/display: ensure committing streams is seamless
    069dc0232ae4a drm/amd/display: fix condition for setting timing_adjust_pending
    42e7440ac65c1 mfd: intel-lpss: Add Intel Wildcat Lake LPSS PCI IDs
    67e8a4d053233 mfd: core: Increment of_node's refcount before linking it to the platform device
    933fc45da2777 mfd: da9063: Split chip variant reading in two bus transactions
    3735ee5c21e0f mfd: madera: Work around false-positive -Wininitialized warning
    38f73c37cf1ee mfd: stmpe-i2c: Add missing MODULE_LICENSE
    6dc754d517b47 mfd: stmpe: Remove IRQ domain upon removal
    634eaa0614ad1 tools/power x86_energy_perf_policy: Prefer driver HWP limits
    ece6d9d5125e7 tools/power x86_energy_perf_policy: Enhance HWP enable
    4535b7ec16b4b tools/power x86_energy_perf_policy: Fix incorrect fopen mode usage
    1dee521b9412f selftests/bpf: Fix flaky bpf_cookie selftest
    02e73f9f56148 tools/cpupower: Fix incorrect size in cpuidle_state_disable()
    e913f379acfaa hwmon: (dell-smm) Remove Dell Precision 490 custom config data
    527fbd192c020 hwmon: (asus-ec-sensors) increase timeout for locking ACPI mutex
    945d73ef5c9f3 uprobe: Do not emulate/sstep original instruction when ip is changed
    a8576f1e80d99 nvme: Use non zero KATO for persistent discovery connections
    a7ced9d338c7b bpf: Clear pfmemalloc flag when freeing all fragments
    e628b0524b378 riscv: bpf: Fix uninitialized symbol 'retval_off'
    56ac639d6fa6f blk-cgroup: fix possible deadlock while configuring policy
    8cc561dd9d02f clocksource/drivers/timer-rtl-otto: Do not interfere with interrupts
    d0e217b33d42b clocksource/drivers/timer-rtl-otto: Work around dying timers
    355c1a72cb39a clocksource/drivers/vf-pit: Replace raw_readl/writel to readl/writel
    c9172cced19bf ACPI: SPCR: Support Precise Baud Rate field
    f25411c9d87bd spi: rpc-if: Add resume support for RZ/G3E
    7163513c1c702 selftests/bpf: Fix selftest verifier_arena_large failure
    3b4222494489f futex: Don't leak robust_list pointer on exec race
    c876a729a4cd1 cpuidle: Fail cpuidle device registration if there is one already
    7e7d5bfbbec0e bpftool: Fix -Wuninitialized-const-pointer warnings with clang >= 21
    13276961ae688 power: supply: qcom_battmgr: handle charging state change notifications
    a4914df87fdda pmdomain: apple: Add "apple,t8103-pmgr-pwrstate"
    eff9be1646922 tools/cpupower: fix error return value in cpupower_write_sysfs()
    ffd87e786745b video: backlight: lp855x_bl: Set correct EPROM start for LP8556
    16c0240a4b30e i3c: mipi-i3c-hci-pci: Add support for Intel Wildcat Lake-U I3C
    dea5e008d5c72 bpf: Do not limit bpf_cgroup_from_id to current's namespace
    9950af4303942 nvme-fc: use lock accessing port_state and rport state
    04d17540ef51e nvmet-fc: avoid scheduling association deletion twice
    819c619cc4ec6 tee: allow a driver to allocate a tee_device without a pool
    fd39594a00012 ACPICA: dispatcher: Use acpi_ds_clear_operands() in acpi_ds_call_control_method()
    b89e25efa2bd1 pwm: pca9685: Use bulk write to atomicially update registers
    03d4d9a1d818d mmc: sdhci-msm: Enable tuning for SDR50 mode for SD card
    ebac995a8aedd firmware: qcom: tzmem: disable sc7180 platform
    168b8941261d8 ARM: tegra: transformer-20: fix audio-codec interrupt
    5c95e96e94181 ARM: tegra: transformer-20: add missing magnetometer interrupt
    27517baf234ec ARM: tegra: p880: set correct touchscreen clipping
    472452e76d9c0 soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups
    10bda7ac2ac52 arm64: zynqmp: Revert usb node drive strength and slew rate for zcu106
    ea6534d41f6d2 arm64: zynqmp: Disable coresight by default
    ff023ab94f332 cpufreq: ondemand: Update the efficient idle check for Intel extended Families
    f420b7cb807f1 irqchip/loongson-pch-lpc: Use legacy domain for PCH-LPC IRQ controller
    aa06016d5b31c hwmon: sy7636a: add alias
    94a612b6b7397 power: supply: sbs-charger: Support multiple devices
    e237d61d10ce5 pinctrl: keembay: release allocated memory in detach path
    c79a51eaf6769 hwmon: (sbtsi_temp) AMD CPU extended temperature range support
    db2056038deca hwmon: (lenovo-ec-sensors) Update P8 supprt
    f9c64e110da1b hwmon: (k10temp) Add device ID for Strix Halo
    2bd194738ca92 hwmon: (k10temp) Add thermal support for AMD Family 1Ah-based models
    ce7c0d7be1f15 power: supply: qcom_battmgr: add OOI chemistry
    bbe77f5bb5c7f thermal: intel: selftests: workload_hint: Mask unsupported types
    91507503663d8 thermal: gov_step_wise: Allow cooling level to be reduced earlier
    0725fc68fc671 ACPI: scan: Add Intel CVS ACPI HIDs to acpi_ignore_dep_ids[]
    6bb7489f38d9e ACPI: resource: Skip IRQ override on ASUS Vivobook Pro N6506CU
    c1e1a5653b684 ACPI: PRM: Skip handlers with NULL handler_address or NULL VA
    cd63490ff4ed5 irqchip/gic-v2m: Handle Multiple MSI base IRQ Alignment
    c9a1c43f762ce selftests/bpf: Upon failures, exit with code 1 in test_xsk.sh
    e8e0637b85a12 arc: Fix __fls() const-foldability via __builtin_clzl()
    64adabb6d9d51 cpufreq/longhaul: handle NULL policy in longhaul_exit
    e832948915e2a selftests/bpf: Fix bpf_prog_detach2 usage in test_lirc_mode2
    4aeae7cc71563 libbpf: Fix USDT SIB argument handling causing unrecognized register error
    e38c07cc59c9c ACPI: video: force native for Lenovo 82K8
    c0cc3080aae07 ACPI: sysfs: Use ACPI_FREE() for freeing an ACPI object
    aaafd17d3f4be io_uring/zctx: check chained notif contexts
    a3c875e9aeb4d irqchip/sifive-plic: Respect mask state when setting affinity
    a4af74391b549 firewire: ohci: move self_id_complete tracepoint after validating register
    0f20be8733d1e bpf: Use tnums for JEQ/JNE is_branch_taken logic
    6dc536165ba5f cpufreq: ti: Add support for AM62D2
    09daf72a64b73 memstick: Add timeout to prevent indefinite waiting
    37aa3afbf8c6f mmc: host: renesas_sdhi: Fix the actual clock
    9673c58764ed4 pinctrl: single: fix bias pull up/down handling in pin_config_set
    943797cbe89b1 bpf: Don't use %pK through printk
    b51878b5edb9d soc: ti: pruss: don't use %pK through printk
    1c2c60c9bb6ae spi: loopback-test: Don't use %pK through printk
    1bc4a402c0184 soc: qcom: smem: Fix endian-unaware access of num_entries
    27568eeee66d9 firmware: qcom: scm: preserve assign_mem() error return value
    afc13decf32b6 soc: aspeed: socinfo: Add AST27xx silicon IDs
    5e23918e43522 s390: Disable ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
    3591d56ea9bfd s390/pci: Avoid deadlock between PCI error recovery and mlx5 crdump
    6be3d7f731dcf drm/sched: Fix race in drm_sched_entity_select_rq()
    f78da4cad3b11 drm/sched: Re-group and rename the entity run-queue lock
    431b4e8c7bfdc drm/sched: Optimise drm_sched_entity_push_job
    d62b808d5c68a usb: gadget: f_fs: Fix epfile null pointer access after ep enable.
    e980de2ff109d x86/CPU/AMD: Add RDSEED fix for Zen5
    958999dbd18ec mfd: kempld: Switch back to earlier ->init() behavior
    acbbd683b3ea6 cpuidle: governors: menu: Select polling state in some more cases
    e3853abbba506 cpuidle: governors: menu: Rearrange main loop in menu_select()
    46fcee9f99ef4 sched_ext: Mark scx_bpf_dsq_move_set_[slice|vtime]() with KF_RCU
    094932903f6d1 ACPI: fan: Use platform device for devres-related actions
    d2e07b95e0a1b ACPI: fan: Add fan speed reporting for fans with only _FST
    ab574f883307c drm/amd/display: Fix incorrect return of vblank enable on unconfigured crtc
    3daad56d20db3 drm/amd: Check that VPE has reached DPM0 in idle handler
    aeb1cf1e8db36 drm/ast: Clear preserved bits from register output value
    0142fe895986a drm/mediatek: Fix device use-after-free on unbind
    23c3745dba57a drm/nouveau: Fix race in nouveau_sched_fini()
    3ec3d47e3a03d drm/sched: avoid killing parent entity on child SIGKILL
    6bdef5648a60e drm/sysfb: Do not dereference NULL pointer in plane reset
    c8788295ce527 drm/xe: Do not wake device during a GT reset
    7eb7ee2bbd866 s390/mm: Fix memory leak in add_marker() when kvrealloc() fails
    a16e92f8d7dc7 regmap: slimbus: fix bus_context pointer in regmap init calls
    1b61a1da3d810 perf/x86/intel: Fix KASAN global-out-of-bounds warning
    f9caae663343b block: make REQ_OP_ZONE_OPEN a write operation
    1e84391707b5b block: fix op_is_zone_mgmt() to handle REQ_OP_ZONE_RESET_ALL
    a53c8e15153a3 ACPI: fan: Use ACPI handle when retrieving _FST
    ba58efa890cc8 drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Iceland
    6f18f14eb3edf drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Fiji
    3545f3cb517c1 drm/amd/pm: fix smu table id bound check issue in smu_cmn_update_table()
    2fa41445d8c98 drm/radeon: Remove calls to drm_put_dev()
    f7482516002a1 drm/radeon: Do not kfree() devres managed rdev
    3e8b6796df1e3 ASoC: fsl_sai: Fix sync error in consumer mode
    8fe39c8387d84 dpll: spec: add missing module-name and clock-id to pin-get reply
    97b34c9765cbb sfc: fix potential memory leak in efx_mae_process_mport()
    95f1e4ecf7df1 net: hns3: return error code when function fails
    6294e03caef26 tools: ynl: fix string attribute length to include null terminator
    8fe83fad4bb66 drm/etnaviv: fix flush sequence logic
    20897a8fa66c1 Bluetooth: hci_core: Fix tracking of periodic advertisement
    b10f8ff2231c3 Bluetooth: ISO: Fix another instance of dst_type handling
    3a9dfe641913b Bluetooth: HCI: Fix tracking of advertisement set/instance 0x00
    cd7a128032973 Bluetooth: btmtksdio: Add pmctrl handling for BT closed state during reset
    fd25c5bb96b31 Bluetooth: ISO: Fix BIS connection dst_type handling
    825ce373fd709 Bluetooth: ISO: Update hci_conn_hash_lookup_big for Broadcast slave
    ae76cf6c2c842 Bluetooth: hci_sync: fix race in hci_cmd_sync_dequeue_once
    2ce1de32e0544 usbnet: Prevents free active kevent
    10e2d2d16ab48 libbpf: Fix powerpc's stack register definition in bpf_tracing.h
    9c52bf5819c4a ASoC: fsl_sai: fix bit order for DSD format
    ca6d2b7aca778 ASoC: Intel: avs: Disable periods-elapsed work when closing PCM
    25a4d105a9bd0 ASoC: Intel: avs: Unprepare a stream when XRUN occurs
    29d0504077044 crypto: aspeed - fix double free caused by devm
    8df22e4bb6d88 bpf: Do not audit capability check in do_jit()
    0efcafd48d252 bpf, x86: Avoid repeated usage of bpf_prog->aux->stack_depth
    40f5c9fc66894 bpf: Find eligible subprogs for private stack support
    55a01a4777a01 scsi: ufs: core: Initialize value of an attribute returned by uic cmd
    10ca3b2eec384 bpf: Sync pending IRQ work before freeing ring buffer
    22aa7d1631e8a kunit: test_dev_action: Correctly cast 'priv' pointer to long*
    5596a90c8952b wifi: mac80211: fix key tailroom accounting leak
    23b8682f05ec5 wifi: mac80211: don't mark keys for inactive links as uploaded
    c06a402459b15 ASoC: cs-amp-lib-test: Fix missing include of kunit/test-bug.h
    c903a5848d814 ALSA: usb-audio: fix control pipe direction
    411b8b9c9cf81 drm/msm/a6xx: Fix GMU firmware parser
    e3373f10c6a6c wifi: ath11k: avoid bit operation on key flags
    50f50dd024b4d wifi: ath11k: add support for MU EDCA
    2a6cd5951ba8e wifi: ath12k: free skb during idr cleanup callback
    775e37df2acc3 wifi: ath11k: Add missing platform IDs for quirk table
    c4840991ee4cc wifi: ath10k: Fix memory leak on unsupported WMI command
    5b2619b488f1d x86/fpu: Ensure XFD state on signal delivery
    327f89c21601e smb: client: fix potential cfid UAF in smb2_query_info_compound
    d13fe1d330aa5 s390/pci: Restore IRQ unconditionally for the zPCI device
    ae68e814f213c ASoC: qdsp6: q6asm: do not sleep while atomic
    0c4f121c0e87e mptcp: restore window probe
    0aee3dd83edec mptcp: drop bogus optimization in __mptcp_check_push()
    3ea7b3a6971c1 fbdev: valkyriefb: Fix reference count leak in valkyriefb_init
    a22bcb7f104aa fbdev: pvr2fb: Fix leftover reference to ONCHIP_NR_DMA_CHANNELS
    a6eed58249e7d wifi: brcmfmac: fix crash while sending Action Frames in standalone AP Mode
    2fc5484456630 Bluetooth: rfcomm: fix modem control handling
    901f44227072b fbdev: bitblit: bound-check glyph index in bit_putcs*
    e16d5c139ad96 virtio-net: drop the multi-buffer XDP packet in zerocopy
    6fb16571a6d5c ACPI: button: Call input_free_device() on failing input device registration
    de5fc93275a4a ACPI: video: Fix use-after-free in acpi_video_switch_brightness()
    9280286e048e0 fbdev: atyfb: Check if pll_ops->init_pll failed
    c079d42f70109 fbcon: Set fb_display[i]->mode to NULL when the mode is released
    67051ecfce050 net: usb: asix_devices: Check return value of usbnet_get_endpoints
    a4948875ed059 NFSD: Fix crash in nfsd4_read_release()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7463821cf0ae63cf87ccf3773be0dfb986345647)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index b778a7aac5..f5eb0a3180 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "af2d3ab81402c14f81072715d771097a0dfcb427"
-SRCREV_meta ?= "2987fc4250f2ad7f6e2df663bba0742638fbae51"
+SRCREV_machine ?= "33873de18361d5ae1da9d8673270f490e177da19"
+SRCREV_meta ?= "7a8d96185b9be165feb974fe6297b518f83b3b9c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.57"
+LINUX_VERSION ?= "6.12.58"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index a1636f536d..4bcf13c826 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.57"
+LINUX_VERSION ?= "6.12.58"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
-SRCREV_meta ?= "2987fc4250f2ad7f6e2df663bba0742638fbae51"
+SRCREV_machine ?= "081aa259b8f0252bfc7999b289b79bf129893498"
+SRCREV_meta ?= "7a8d96185b9be165feb974fe6297b518f83b3b9c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index fa761a3ee1..c59046b090 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8d546b19fe6f217785674b80de068bdbe0bf32fc"
-SRCREV_machine:qemuarm64 ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
-SRCREV_machine:qemuloongarch64 ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
-SRCREV_machine:qemumips ?= "fc2ecbb2ff9ad036cbe11762e51c458150f56aea"
-SRCREV_machine:qemuppc ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
-SRCREV_machine:qemuriscv64 ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
-SRCREV_machine:qemuriscv32 ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
-SRCREV_machine:qemux86 ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
-SRCREV_machine:qemux86-64 ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
-SRCREV_machine:qemumips64 ?= "bde855d69b528925fb0f6b44c87105def1c69ea4"
-SRCREV_machine ?= "95efd6fa4403e21402aeb96b4b54be01e076016e"
-SRCREV_meta ?= "2987fc4250f2ad7f6e2df663bba0742638fbae51"
+SRCREV_machine:qemuarm ?= "3f9921848760dfc9fd6c0a4d148e5b9d0bec64ea"
+SRCREV_machine:qemuarm64 ?= "081aa259b8f0252bfc7999b289b79bf129893498"
+SRCREV_machine:qemuloongarch64 ?= "081aa259b8f0252bfc7999b289b79bf129893498"
+SRCREV_machine:qemumips ?= "c09059f5ac654152a9cd92016df30d0c2e9eb58b"
+SRCREV_machine:qemuppc ?= "081aa259b8f0252bfc7999b289b79bf129893498"
+SRCREV_machine:qemuriscv64 ?= "081aa259b8f0252bfc7999b289b79bf129893498"
+SRCREV_machine:qemuriscv32 ?= "081aa259b8f0252bfc7999b289b79bf129893498"
+SRCREV_machine:qemux86 ?= "081aa259b8f0252bfc7999b289b79bf129893498"
+SRCREV_machine:qemux86-64 ?= "081aa259b8f0252bfc7999b289b79bf129893498"
+SRCREV_machine:qemumips64 ?= "1c91b074e875fab932bde7698d0103c5840f2e8f"
+SRCREV_machine ?= "081aa259b8f0252bfc7999b289b79bf129893498"
+SRCREV_meta ?= "7a8d96185b9be165feb974fe6297b518f83b3b9c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4fc43debf5047d2469bdef3b25c02121afa7ef3d"
+SRCREV_machine:class-devupstream ?= "7475d784169c7df48b0c55525fb862e06674d63c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.57"
+LINUX_VERSION ?= "6.12.58"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


