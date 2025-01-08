Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E23EE7719D
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 21:17:34 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.31969.1736371051707195290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 13:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2ZEAPx88;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2163b0c09afso3089545ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 13:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736371051; x=1736975851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HA4J1ralPMXoDuo8P4uTr49JT5BSsrPBy5fNI1n98eo=;
        b=2ZEAPx88lTgAbV8zim2vh1agZ4yGjcmX2/kTTTHg7djVCKa6YuGtElPUOiMhFecqCx
         NHhiAz8opnCC0e/SMGqbqczxkmJjWyEcILdlV5TOo5qRoYNjoQ+rZOh37J9/1alFnKKE
         35tRQ9hAD4fNUzggKbummfLKJhT4K9UERBRcm8Sy5021mGlonztMyviTe3eUrax8zEs/
         XaXkraoymsSXaOJ8F+i9qfM+yG4OKnhpcEBsm+L40fntcaZlmCOYUjnQofsYZAmvVyy4
         gp7hhZBzOd+s+KBNLWUEHUJ5Zi5S/HVRwfsEzM8p4rw3krP9W2XPlNUHNzdkNH3ro5np
         ydNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736371051; x=1736975851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HA4J1ralPMXoDuo8P4uTr49JT5BSsrPBy5fNI1n98eo=;
        b=Mn9nWGo7IarQg6mAqGyN/oslZg/PG7BTB6hzHnXW8Clm9K7iK3c8+dXODcmicUYN9r
         hAUjqgsXZer3Rfadk6BRAftvFyNMvy2GWUmDIRn2Op7sWTIe2t5ClbJ9WUinnuZyFh8J
         qWtxJo2dmfyarB5UJMkofQsuN0tYtdGtJ1Fv7XAvX8s4y0yWjzS+EaKxRfVK0i9ZqqvM
         qc0VyHu/MDIOUXD1lZpQEQaSgTfr6RtgNc79U09cU6EEsi91qjaxOpopFHlTHvWUYtKo
         iphxq7m5e73UDUarajRABtH/rUiGVkB0SvaXt/uwMHf145wKolgRaC+ATDFwHSBK8wZK
         JGBA==
X-Gm-Message-State: AOJu0YwG4DmdhrQ9s9VUpkNngyf/76q5dCv2D0CIieltilVGplKKV0sA
	7RQ9FTgr5uwMGq7I+4uMujMoen1+JbHon4USzmsVtdIstciIjs0XgFjdYKxosyOw4QvLldP04mF
	BMy0=
X-Gm-Gg: ASbGncuJb/lwZcMCflwa4ViO9XITO/C6/LzbA29aNSXyVrZYKybgUwpQpIkmQjl465h
	jP6AxeklD0wGRchm63aLGc4z7eL+fxAvS5AfEHGcUcsvEOjX/dFokkJt1jqqz7Njb3bt9212Z05
	FZVs0SBGn+nBoxJvGVBUWTO0xTolZmtLqkLVbKM1I9UwP7MoVLiSgGt/si0AEmq5D5qIPcp1nSd
	IiUadmutdCbKjaJVTZRMuCk0dHAsRuVHco0/NucQGWKVA==
X-Google-Smtp-Source: AGHT+IG0CF5u2A3VpYTP+J7qqUNzubcduBOFeWsGCgkUKWAtSwMZ9RTPbCrmNfCEcwA7kQLHQOfNIA==
X-Received: by 2002:a17:902:d488:b0:216:2f9d:32c with SMTP id d9443c01a7336-21a83fd36d0mr64373615ad.53.1736371050659;
        Wed, 08 Jan 2025 13:17:30 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdd9bsm331403495ad.132.2025.01.08.13.17.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 13:17:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 09/18] linux-yocto/6.6: update to v6.6.62
Date: Wed,  8 Jan 2025 13:16:59 -0800
Message-ID: <629547ed8fc1a186eda2d68c29fee163ec96fe3b.1736370890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736370890.git.steve@sakoman.com>
References: <cover.1736370890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 21:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209599

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    c1036e4f14d0 Linux 6.6.62
    9da3636a4880 9p: fix slab cache name creation for real
    fc4951c3e335 mm/thp: fix deferred split unqueue naming and locking
    eb6b6d3e1f1e mm: refactor folio_undo_large_rmappable()
    0275e4021b0c mm: always initialise folio->_deferred_list
    e8769509d622 mm: support order-1 folios in the page cache
    2ad2067e9ffc mm/readahead: do not allow order-1 folio
    bc8990235fb5 mm: add page_rmappable_folio() wrapper
    71548fada7ee mm: krealloc: Fix MTE false alarm in __do_krealloc
    950ac86cff33 io_uring: fix possible deadlock in io_register_iowq_max_workers()
    d5092b0a1aaf bpf: Check validity of link->type in bpf_link_show_fdinfo()
    9dcf69612453 net: usb: qmi_wwan: add Fibocom FG132 0x0112 composition
    f08621233573 ASoC: fsl_micfil: Add sample rate constraint
    f198c09fe2ca LoongArch: Use "Exception return address" to comment ERA
    4f885fa64983 ASoC: rt722-sdca: increase clk_stop_timeout to fix clock stop issue
    e01cac3d6284 RISCV: KVM: use raw_spinlock for critical section in imsic
    bff14c38ed51 HID: lenovo: Add support for Thinkpad X1 Tablet Gen 3 keyboard
    24e8cc49c03e HID: multitouch: Add quirk for Logitech Bolt receiver w/ Casa touchpad
    1cb5bfc5bfc6 fs: Fix uninitialized value issue in from_kuid and from_kgid
    ebf63d5c82e7 ASoC: amd: yc: Fix non-functional mic on ASUS E1404FA
    34ec7bcee3d8 ASoC: amd: yc: Add quirk for ASUS Vivobook S15 M3502RA
    77c523dfb053 bpf: Fix mismatched RCU unlock flavour in bpf_out_neigh_v6
    a078a480ff3f bpf: Add sk_is_inet and IS_ICSK check in tls_sw_has_ctx_tx/rx
    6fbf6ff7549e vDPA/ifcvf: Fix pci_read_config_byte() return code handling
    5a526388d0ac nvme/host: Fix RCU list traversal to use SRCU primitive
    e8c714941811 smb: client: Fix use-after-free of network namespace.
    1a1bcca5c9ef nvme: make keep-alive synchronous operation
    e4f9fffbb1dc nvme-loop: flush off pending I/O while shutting down loop controller
    dd5d32f74fc1 net: phy: mdio-bcm-unimac: Add BCM6846 support
    bee372110e69 powerpc/powernv: Free name on error in opal_event_init()
    4c332037fcbb drm/amdkfd: Accounting pdd vram_usage for svm
    4a57f42e5ed4 nvme-multipath: defer partition scanning
    3406bfc813a9 RDMA/siw: Add sendpage_ok() check to disable MSG_SPLICE_PAGES
    c6db3a111e2d drm/vmwgfx: Limit display layout ioctl array size to VMWGFX_NUM_DISPLAY_UNITS
    87791a733a3b sound: Make CONFIG_SND depend on INDIRECT_IOMEM instead of UML
    839c22a2134a crypto: marvell/cesa - Disable hash algorithms
    83394e7d9421 crypto: api - Fix liveliness check in crypto_alg_tested
    d22f177935dd bpf: use kvzmalloc to allocate BPF verifier environment
    e04e64805802 nvme: disable CC.CRIME (NVME_CC_CRIME)
    8902a5223962 iommu/arm-smmu: Clarify MMU-500 CPRE workaround
    ded2b3b2bc50 HID: multitouch: Add quirk for HONOR MagicBook Art 14 touchpad
    6e306b87c035 HID: multitouch: Add support for B2402FVA track point
    f49a9d86c4cd block: Fix elevator_get_default() checking for NULL q->tag_set
    975cb1d21215 nvme: tcp: avoid race between queue_lock lock and destroy
    4b3441089235 irqchip/ocelot: Fix trigger register address
    68ec5395bc24 selftests/bpf: Verify that sync_linked_regs preserves subreg_def
    0d6c0b3b6f3f 9p: Avoid creating multiple slab caches with the same name
    a63c78c3493c 9p: v9fs_fid_find: also lookup by inode if not found dentry
    f1ab3a1bcbbc Linux 6.6.61
    b110196fec44 vsock/virtio: Initialization of the dangling pointer occurring in vsk->trans
    4bdc5a62c6e5 hv_sock: Initializing vsk->trans to NULL to prevent a dangling pointer
    f7a08b2897da ASoC: amd: yc: fix internal mic on Xiaomi Book Pro 14 2022
    1e8f31656ac1 ucounts: fix counter leak in inc_rlimit_get_ucounts()
    dd73c942eed7 ocfs2: remove entry once instead of null-ptr-dereference in ocfs2_xa_remove()
    c8fe8c223297 irqchip/gic-v3: Force propagation of the active state with a read-back
    4fea315a9fd8 USB: serial: option: add Quectel RG650V
    836eefa7c7e1 USB: serial: option: add Fibocom FG132 0x0112 composition
    4ffcb9d7891c USB: serial: qcserial: add support for Sierra Wireless EM86xx
    13d6ff3ca760 USB: serial: io_edgeport: fix use after free in debug printk
    69e19774f15e usb: typec: fix potential out of bounds in ucsi_ccg_update_set_new_cam_cmd()
    35925e2b7b40 usb: typec: qcom-pmic: init value of hdr_len/txbuf_len earlier
    4abc5ee334fe usb: dwc3: fix fault at system suspend if device was already runtime suspended
    8a30da5aa960 usb: musb: sunxi: Fix accessing an released usb phy
    4877d9b2a2eb signal: restore the override_rlimit logic
    5b548fd0d298 fs/proc: fix compile warning about variable 'vmcore_mmap_ops'
    ef59a49a4b0b i2c: designware: do not hold SCL low when I2C_DYNAMIC_TAR_UPDATE is not set
    a2746ab3bbc9 filemap: Fix bounds checking in filemap_read()
    575a562f7a3e media: uvcvideo: Skip parsing frames of type UVC_VS_UNDEFINED in uvc_parse_format
    0186347f1605 Revert "selftests/bpf: Implement get_hw_ring_size function to retrieve current and max interface size"
    bb9982d77734 Revert "wifi: mac80211: fix RCU list iterations"
    6e62dab357ee riscv/purgatory: align riscv_kernel_entry
    f04be6d68f71 btrfs: reinitialize delayed ref list after deleting it from the list
    701fae8dce72 arm64: smccc: Remove broken support for SMCCCv1.3 SVE discard hint
    22aaaa7a1a73 arm64: Kconfig: Make SME depend on BROKEN for now
    51d11ea0250d arm64/sve: Discard stale CPU state when handling SVE traps
    30db2a648550 mptcp: use sock_kfree_s instead of kfree
    1325e838089d net: vertexcom: mse102x: Fix possible double free of TX skb
    20f4eb96afe2 net: wwan: t7xx: Fix off-by-one error in t7xx_dpmaif_rx_buf_alloc()
    f749cb60a01f nfs: Fix KMSAN warning in decode_getfattr_attrs()
    203003c4ff18 posix-cpu-timers: Clear TICK_DEP_BIT_POSIX_TIMER on clone
    e639fe493614 ALSA: usb-audio: Add quirk for HP 320 FHD Webcam
    edfae9d997c7 dm-unstriped: cast an operand to sector_t to prevent potential uint32_t overflow
    036dd6e3d263 dm cache: fix potential out-of-bounds access on the first resume
    53421c3c0ee0 dm cache: optimize dirty bit checking with find_next_bit when resizing
    e57648ce325f dm cache: fix out-of-bounds access to the dirty bitset when resizing
    8cc12dab6353 dm cache: fix flushing uninitialized delayed_work on cache_ctr error
    11d5a3f8427a dm cache: correct the number of origin blocks to match the target length
    1df8231f4e99 thermal/drivers/qcom/lmh: Remove false lockdep backtrace
    a613a3924175 drm/amdgpu: prevent NULL pointer dereference if ATIF is not supported
    3930715c1aef drm/amdgpu: Fix DPX valid mode check on GC 9.4.3
    e2574b57990d drm/amdgpu: Adjust debugfs register access permissions
    8906728f2fbd drm/amdgpu: add missing size check in amdgpu_debugfs_gprwave_read()
    5a8ae5fa576c drm/amdgpu: Adjust debugfs eviction and IB access permissions
    343fcd066c09 rpmsg: glink: Handle rejected intent request better
    767975d74952 pwm: imx-tpm: Use correct MODULO value for EPWM mode
    c6cdc08c25a8 ksmbd: fix slab-use-after-free in smb3_preauth_hash_rsp
    726c1568b914 ksmbd: Fix the missing xa_store error check
    1f993777275c ksmbd: check outstanding simultaneous SMB operations
    e923503a56b3 ksmbd: fix slab-use-after-free in ksmbd_smb2_session_create
    5ba7258ff028 can: mcp251xfd: mcp251xfd_ring_alloc(): fix coalescing configuration when switching CAN modes
    91017ba42df0 can: mcp251xfd: mcp251xfd_get_tef_len(): fix length calculation
    89d8048df70c can: m_can: m_can_close(): don't call free_irq() for IRQ-less devices
    32adcb833ecc media: v4l2-ctrls-api: fix error handling for v4l2_g_ctrl()
    2d0f01aa602f media: v4l2-tpg: prevent the risk of a division by zero
    4264e26a34e3 media: pulse8-cec: fix data timestamp at pulse8_setup()
    83c152b55d88 media: cx24116: prevent overflows on SNR calculus
    784bc785a453 media: s5p-jpeg: prevent buffer overflows
    a244b82d0ae6 media: ar0521: don't overflow when checking PLL values
    bd24d8337159 ASoC: SOF: sof-client-probes-ipc4: Set param_size extension bits
    23bdbd1ef3e0 ASoC: stm32: spdifrx: fix dma channel release in stm32_spdifrx_remove
    d3304dbc2d5f thermal/of: support thermal zones w/o trips subnode
    5f2d0b607c70 tools/lib/thermal: Fix sampling handler context ptr
    57a9e9d71d77 ALSA: firewire-lib: fix return value on fail in amdtp_tscm_init()
    a8ce18094f42 scsi: sd_zbc: Use kvzalloc() to allocate REPORT ZONES buffer
    b01f2230868b media: adv7604: prevent underflow condition when reporting colorspace
    492275748168 media: dvb_frontend: don't play tricks with underflow values
    1e461672616b media: dvbdev: prevent the risk of out of memory access
    c776231e3d0b media: stb0899_algo: initialize cfr before using it
    203d04968af0 Revert "ALSA: hda/conexant: Mute speakers at suspend / shutdown"
    1947143cb188 drivers: net: ionic: add missed debugfs cleanup to ionic_probe() error path
    996a7208dadb rxrpc: Fix missing locking causing hanging calls
    0012be71c55b net: arc: rockchip: fix emac mdio node support
    8ed7a4a39c3f net: arc: fix the device for dma_map_single/dma_unmap_single
    af0aa8aecbe8 virtio_net: Add hash_key_length check
    bfd05c68e4c6 netfilter: nf_tables: wait for rcu grace period on net_device removal
    825a80817cf1 netfilter: nf_tables: pass nft_chain to destroy function, not nft_ctx
    d122b259a717 netfilter: nf_tables: cleanup documentation
    b0a3c915529e net: stmmac: Fix unbalanced IRQ wake disable warning on single irq case
    421cf80e7dee net: phy: ti: add PHY_RST_AFTER_CLK_EN flag
    719edd9f3372 net: hns3: fix kernel crash when uninstalling driver
    4b0599a66614 e1000e: Remove Meteor Lake SMBUS workarounds
    bf5f837d9fd2 i40e: fix race condition by adding filter's intermediate sync state
    6103d401b1cf ice: change q_index variable type to s16 to store -1 value
    f32fc3becfc7 can: c_can: fix {rx,tx}_errors statistics
    ef0edfbe9eee net: enetc: allocate vf_state during PF probes
    d3fb3cc83cf3 sctp: properly validate chunk size in sctp_sf_ootb()
    345267bf3643 dt-bindings: net: xlnx,axi-ethernet: Correct phy-mode property value
    d4c52c6a2bd5 net: enetc: set MAC address to the VF net_device
    9b7c0405af66 regulator: rtq2208: Fix uninitialized use of regulator_config
    3e79ad156bed security/keys: fix slab-out-of-bounds in key_task_permission
    6173b0bfcea3 nfs: avoid i_lock contention in nfs_clear_invalid_mapping
    351f03398ba8 NFSv3: only use NFS timeout for MOUNT when protocols are compatible
    d428de979bb2 sunrpc: handle -ENOTCONN in xs_tcp_setup_socket()
    7a3ed3f12529 platform/x86/amd/pmc: Detect when STB is not available
    9d9f5c75c0c7 HID: core: zero-initialize the report buffer
    24a7ac9d3d1b arm64: dts: rockchip: Correct GPIO polarity on brcm BT nodes
    95106521c1d8 ARM: dts: rockchip: Fix the realtek audio codec on rk3036-kylin
    1a22d3723f48 ARM: dts: rockchip: Fix the spi controller on rk3036
    0f4e827100ad ARM: dts: rockchip: drop grf reference from rk3036 hdmi
    f3d09c233bea ARM: dts: rockchip: fix rk3036 acodec node
    6900713f93c8 arm64: dts: rockchip: remove orphaned pinctrl-names from pinephone pro
    15b17bbcea07 firmware: arm_scmi: Fix slab-use-after-free in scmi_bus_notifier()
    810615507942 arm64: dts: imx8mp: correct sdhc ipg clk
    5cfe9619ce8a arm64: dts: imx8-ss-vpu: Fix imx8qm VPU IRQs
    ad0a938050d3 arm64: dts: imx8qxp: Add VPU subsystem file
    f8181c545d0a arm64: dts: rockchip: remove num-slots property from rk3328-nanopi-r2s-plus
    e24351485d15 arm64: dts: rockchip: Fix LED triggers on rk3308-roc-cc
    d0beaf49abc7 arm64: dts: rockchip: Remove #cooling-cells from fan on Theobroma lion
    d09940e349f6 arm64: dts: rockchip: Remove undocumented supports-emmc property
    d0a08abbe182 arm64: dts: rockchip: Add DTS for FriendlyARM NanoPi R2S Plus
    87759aaaab5c arm64: dts: rockchip: Fix bluetooth properties on Rock960 boards
    55907bdf4858 arm64: dts: rockchip: Fix bluetooth properties on rk3566 box demo
    54d80a600051 arm64: dts: rockchip: fix i2c2 pinctrl-names property on anbernic-rg353p/v
    08e793866570 arm64: dts: rockchip: Fix reset-gpios property on brcm BT nodes
    4d580a57ec23 arm64: dts: rockchip: Fix wakeup prop names on PineNote BT node
    f1da910ee9a2 arm64: dts: rockchip: Remove hdmi's 2nd interrupt on rk3328
    771bd4dde450 arm64: dts: rockchip: Fix rt5651 compatible value on rk3399-sapphire-excavator
    27b69008d637 arm64: dts: rockchip: Fix rt5651 compatible value on rk3399-eaidk-610
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
(cherry picked from commit 83dc33ac568e1320e1f675eaaa5e3b75dae26733)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 68e9011ffa..99e8248c72 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "00cd5a2760872bcd59fad7e687b3e7fc01b8eea3"
-SRCREV_meta ?= "0b2608e19938739a210b80898ad59d1dd8914636"
+SRCREV_machine ?= "67f358194225f9936b9a98ee9366417597be1769"
+SRCREV_meta ?= "ccfbc11e4a21d87bd7ab9f176d1b941c4d44e6bb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.60"
+LINUX_VERSION ?= "6.6.62"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 0cf105d40b..dce2633842 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.60"
+LINUX_VERSION ?= "6.6.62"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
-SRCREV_meta ?= "0b2608e19938739a210b80898ad59d1dd8914636"
+SRCREV_machine ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
+SRCREV_meta ?= "ccfbc11e4a21d87bd7ab9f176d1b941c4d44e6bb"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 446619c7fc..924a9c709e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9d35c8ab017f07efb3e2a571747ef34cc231e83f"
-SRCREV_machine:qemuarm64 ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
-SRCREV_machine:qemuloongarch64 ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
-SRCREV_machine:qemumips ?= "37d619f98381af0e00da822aed6baacc90ede82a"
-SRCREV_machine:qemuppc ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
-SRCREV_machine:qemuriscv64 ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
-SRCREV_machine:qemuriscv32 ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
-SRCREV_machine:qemux86 ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
-SRCREV_machine:qemux86-64 ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
-SRCREV_machine:qemumips64 ?= "bf5c9805a70504d2d4cc6a2bdcede372dd899c6f"
-SRCREV_machine ?= "0748903d61df7571e5e3aa5d7e305e064498094e"
-SRCREV_meta ?= "0b2608e19938739a210b80898ad59d1dd8914636"
+SRCREV_machine:qemuarm ?= "1e6b41eda7272a27f84bad099bbd0289936e66e6"
+SRCREV_machine:qemuarm64 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
+SRCREV_machine:qemuloongarch64 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
+SRCREV_machine:qemumips ?= "34755af7887cc9dae4d4aa10395a8b2ba16550fc"
+SRCREV_machine:qemuppc ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
+SRCREV_machine:qemuriscv64 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
+SRCREV_machine:qemuriscv32 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
+SRCREV_machine:qemux86 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
+SRCREV_machine:qemux86-64 ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
+SRCREV_machine:qemumips64 ?= "9b078a376adbf198325e1569246106e480191063"
+SRCREV_machine ?= "c0b4a8f13b976065abdeaa2f1177dbc5cb600b4b"
+SRCREV_meta ?= "ccfbc11e4a21d87bd7ab9f176d1b941c4d44e6bb"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "9b5aad3a7498c261116a0251fe57f14ba9c4c6cf"
+SRCREV_machine:class-devupstream ?= "c1036e4f14d03aba549cdd9b186148d331013056"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.60"
+LINUX_VERSION ?= "6.6.62"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


