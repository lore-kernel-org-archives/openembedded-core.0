Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81747CAC580
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 16:09:39 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.584.1757088573436537649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 09:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZPt5Ubui;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-723c971b63bso19244806d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757088572; x=1757693372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uNptkh8l/nHyD+fbRWjDdy+MDjH7M0I0b9AjbzMXxc=;
        b=ZPt5UbuiNj2CJQYbO5H+eHBB5YMI023XFDJxnWsZLCdHQU17SpIdBmkUko5qJ5G5Ik
         xKpVJOcFTGWobQG8EcV287FV7x3SmnURI5/s5BhO26fVe1qyJsoS7LgNXirRAncLr+6p
         h0lD/LqrV3rS76Ug2dt0zoUv9014k8piWOi5uw80/OAHTHh/cabW/XnyKJa2pXxEP0eg
         /ua96Np8trSH+FeNAaUyE/L8VllZXqIRJ2qDZVXx16XLHG/B4pyEk0qMwMBMusN4WkT4
         y3Q6PHnPW7uvvLoorClVSIU/RDFVkecF8LpIJZy+OahTN2NKigoguHMVm3blxyBxTPLz
         XuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757088572; x=1757693372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uNptkh8l/nHyD+fbRWjDdy+MDjH7M0I0b9AjbzMXxc=;
        b=KnlsZZve72VVxBDJKNDCgtAbDH164wuDvZrzXR9ScPr2vjLJryNRpshvk7CMvm2pCT
         CLB8TTZxHgv/cTT22L/1m59xXE3ljRbDcr+Hq5hY8DN7eHuyHsjjcjmcYqCt6rEXP5d1
         kBkkslzVtUzfKxjrEzpBxPi4WdspfWApzlTKJGzi6QD329wlg3UDo0j7w2i7jZeMz4ET
         y0zG6maNa3opsVw9KcDbGB6K5qftMkY790FKgf1pDiu1bjRPQUQG2xCu7aMi/gkIslI+
         pohzd8kjK8aoYKYhLw+WqkUuWc6/uNvBN5ICKwWi7ETCMdGuaqsWTR1zVsNk3SOUH2mF
         evLA==
X-Gm-Message-State: AOJu0YyR/9ghaGZMsA29JIb0t8dL89nK0ArNrpfwrZb9Ayz+upwj4wOw
	ilMHmzNPUTdkk2fgsbnUxVzN/BOUUTEHJ/Lmj9kKXjwDXSiE7rs8kWrdmWL784dL
X-Gm-Gg: ASbGncuyMaj+e3hlsa4wP+i6+YPSYyFxQALAJhlTwVjl0UDcpF5G+P7ajkzypN7B/Nf
	/z8R/4YX0hPWRN76BRu7zvAfuoS8jewOCCxyqnMyIR445emoJgBd4WNZRpFfqt0j3grhqAo7AUs
	fQrIP3Kz7/e6V4jGOtWzy7bfH4zMpyqagVIwmnuezefgd807qGRtnsoxWCAFYlflZ111MA7qYP9
	1Nmn13Ecbl/yaqZKz2KA/j5F3wTJX+Xw0jplzG6MdtQ/ClELRq8a3LHfx8k8SwjbXyAARR+KaVV
	OX+4UTo7ucT8tb1mAcu9540EEti7l4FQN6PNG0RARKXIg0GmYGxzik3pLL9t8MJLrT+gyNATWJR
	CBid9xObWliRvEyIwqCejPSJDDep8IERrJjKvO0tOiodQf85i8yWXh2BpKv6At5RcVilC8OD1s/
	3mUSAv32HTwWkPYB9zj+nADCJ2SHrpNpfB+E0K0QfQiVhO9hnnF55hqXrLRqqSfFJx9A==
X-Google-Smtp-Source: AGHT+IHTa+s4FaYkMpmpWK8jDcAnLyLakqPAzfsvF9M3S9JGE9hfmHJLWHsBc4VFhFBJvE9Z7Bas5A==
X-Received: by 2002:ad4:5e8e:0:b0:71a:fbab:ace5 with SMTP id 6a1803df08f44-71afbabae07mr216091966d6.31.1757088571563;
        Fri, 05 Sep 2025 09:09:31 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ac16de30sm69127446d6.7.2025.09.05.09.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 09:09:30 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/6.16: update to v6.16.4
Date: Fri,  5 Sep 2025 12:09:24 -0400
Message-Id: <4ed19f49eda5e3ff23a2cbd15fa2423a2ef8588a.1757088383.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1757088383.git.bruce.ashfield@gmail.com>
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 16:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223012

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.16 to the latest korg -stable release that comprises
the following commits:

no ids found, dumping:
    be15dab9a451 Linux 6.16.4
    77a946bf1af0 drm/xe: Fix vm_bind_ioctl double free bug
    2d6c8cfb4d89 drm/xe: Move ASID allocation and user PT BO tracking into xe_vm_create
    b32e1590a8d2 netfilter: nf_reject: don't leak dst refcount for loopback packets
    13b8655986bd s390/hypfs: Enable limited access during lockdown
    9859935da6d7 s390/hypfs: Avoid unnecessary ioctl registration in debugfs
    24a627965f23 ALSA: usb-audio: Use correct sub-type for UAC3 feature unit validation
    27f55ec13d7c net/mlx5e: Preserve shared buffer capacity during headroom updates
    a19477c49b7f net/mlx5e: Query FW for buffer ownership
    aeeea0293f79 net/mlx5: Add IFC bits and enums for buf_ownership
    285ed9ab9bf2 net/mlx5: Base ECVF devlink port attrs from 0
    1c120fe1fa64 Octeontx2-af: Skip overlap check for SPI field
    0cbf3ed34bcc block: avoid cpu_hotplug_lock depedency on freeze_lock
    e74191a23a7f block: skip q->rq_qos check in rq_qos_done_bio()
    a277d8870a6c block: decrement block_rq_qos static key in rq_qos_del()
    f9a9098ca826 blk-mq: fix lockdep warning in __blk_mq_update_nr_hw_queues
    e01facfb54a9 block: fix potential deadlock while running nr_hw_queue update
    58567d8e95c0 block: fix lockdep warning caused by lock dependency in elv_iosched_store
    1837d9226755 block: move elevator queue allocation logic into blk_mq_init_sched
    4bd3ed125c1d net: airoha: ppe: Do not invalid PPE entries in case of SW hash collision
    4f58c0bfd264 bonding: send LACPDUs periodically in passive mode after receiving partner's LACPDU
    3310f0ebba5e bonding: update LACP activity flag after setting lacp_active
    af386b52531d ALSA: timer: fix ida_free call while not allocated
    9c9bbbe1b3e2 net/sched: Remove unnecessary WARNING condition for empty child qdisc in htb_activate
    62d591dde4de net/sched: Make cake_enqueue return NET_XMIT_CN when past buffer_limit
    be9062668aca net: dsa: microchip: Fix KSZ9477 HSR port setup issue
    ea3707144c12 igc: fix disabling L1.2 PCI-E link substate on I226 on init
    9ccf8d4cdbb4 ixgbe: xsk: resolve the negative overflow of budget in ixgbe_xmit_zc
    f771c0acfbe7 LoongArch: KVM: Use kvm_get_vcpu_by_id() instead of kvm_get_vcpu()
    8bb4dfcc3611 LoongArch: KVM: Use standard bitops API with eiointc
    1d7864acd497 s390/mm: Do not map lowcore with identity mapping
    53492b4dc70e ASoC: cs35l56: Remove SoundWire Clock Divider workaround for CS35L63
    92c4406b6578 ASoC: cs35l56: Handle new algorithms IDs for CS35L63
    22a5164afe62 ASoC: cs35l56: Update Firmware Addresses for CS35L63 for production silicon
    a096b0280168 LoongArch: Optimize module load time by optimizing PLT/GOT counting
    c83e6873c61c LoongArch: Pass annotate-tablejump option if LTO is enabled
    4050d08f846e objtool/LoongArch: Get table size correctly if LTO is enabled
    81fad991f35d microchip: lan865x: fix missing Timer Increment config for Rev.B0/B1
    0112da9f08fa microchip: lan865x: fix missing netif_start_queue() call on device open
    9603699528e6 net/mlx5: CT: Use the correct counter offset
    9ab89476b93e net/mlx5: HWS, Fix table creation UID
    37d54bc28d09 net/mlx5: HWS, fix complex rules rehash error flow
    748528ffb877 net/mlx5: HWS, fix bad parameter in CQ creation
    85545f1525f9 net/smc: fix UAF on smcsk after smc_listen_out()
    a82a5e21b5d7 net: stmmac: thead: Enable TX clock before MAC initialization
    9d8a41e9a4ff gve: prevent ethtool ops after shutdown
    523eab02fce4 net: usb: asix_devices: Fix PHY address mask in MDIO bus initialization
    5d30659b384d phy: mscc: Fix timestamping for vsc8584
    6adaa9fae36f cifs: Fix oops due to uninitialised variable
    74605d602bce regulator: tps65219: regulator: tps65219: Fix error codes in probe()
    d5b6f0cbb787 drm/xe: Assign ioctl xe file handler to vm in xe_vm_create
    6efb0265ac59 net: ti: icssg-prueth: Fix HSR and switch offload Enablement during firwmare reload.
    f97f6475fdcb ppp: fix race conditions in ppp_fill_forward_path
    d5cdb783b8d3 net: ethernet: mtk_ppe: add RCU lock around dev_fill_forward_path
    aaf17a35a595 scsi: ufs: ufs-qcom: Fix ESI null pointer dereference
    f5ba3aefddea scsi: ufs: ufs-qcom: Update esi_vec_mask for HW major version >= 6
    c0cc24c139e0 scsi: ufs: core: Remove WARN_ON_ONCE() call from ufshcd_uic_cmd_compl()
    1a659c93d00a scsi: ufs: core: Fix IRQ lock inversion for the SCSI host lock
    5885d39dce87 bnxt_en: Fix lockdep warning during rmmod
    60f6f39cd57b ipv6: sr: validate HMAC algorithm ID in seg6_hmac_info_add
    794ddbb7b63b net: gso: Forbid IPv6 TSO with extensions on devices with only IPV6_CSUM
    f494028897b6 drm/amd/display: Don't print errors for nonexistent connectors
    d767b095cb4e drm/amd/display: Adjust DCE 8-10 clock, don't overclock by 15%
    2ee86b764c54 drm/amd/display: Add null pointer check in mod_hdcp_hdcp1_create_session()
    7a8c8aa0b0b2 regulator: pca9450: Use devm_register_sys_off_handler
    5ff4ad5f3eeb ALSA: usb-audio: Fix size validation in convert_chmap_v3()
    a4e0ea587ae7 drm/hisilicon/hibmc: fix dp and vga cannot show together
    ccda4b7fe50d drm/hisilicon/hibmc: fix rare monitors cannot display problem
    d3e774266c28 drm/hisilicon/hibmc: fix the hibmc loaded failed bug
    06d261a085a1 drm/hisilicon/hibmc: fix irq_request()'s irq name variable is local
    2713953e93de drm/hisilicon/hibmc: fix the i2c device resource leak when vdac init failed
    a9bff7e67468 rust: alloc: fix `rusttest` by providing `Cmalloc::aligned_layout` too
    21b38f35f07e md: fix sync_action incorrect display during resync
    62f06ac3b2ae md: add helper rdev_needs_recovery()
    ba73ee8a59c9 md: rename recovery_cp to resync_offset
    09d6d8f51b3b drm: nova-drm: fix 32-bit arm build
    d6bbeed7b24a mlxsw: spectrum: Forward packets with an IPv4 link-local source IP
    eebfe804be47 Bluetooth: hci_core: Fix not accounting for BIS/CIS/PA links separately
    087812a6119b Bluetooth: Add PA_LINK to distinguish BIG sync and PA sync connections
    a33d56316091 Bluetooth: hci_conn: do return error from hci_enhanced_setup_sync()
    5e12d3c05079 Bluetooth: hci_event: fix MTU for BN == 0 in CIS Established
    6839859a00d4 Bluetooth: hci_sync: Prevent unintended PA sync when SID is 0xFF
    5a044299c709 Bluetooth: hci_core: Fix using ll_privacy_capable for current settings
    5c472a3a3987 Bluetooth: hci_core: Fix using {cis,bis}_capable for current settings
    2b979ef70494 Bluetooth: btmtk: Fix wait_on_bit_timeout interruption during shutdown
    921a470ab75a Bluetooth: hci_sync: Fix scan state after PA Sync has been established
    736db11c86f0 iommu/amd: Avoid stack buffer overflow from kernel cmdline
    f4bc3cdfe951 scsi: qla4xxx: Prevent a potential error pointer dereference
    1ec37e5e359a rtase: Fix Rx descriptor CRC error bit definition
    a225f44d84b8 net/sched: Fix backlog accounting in qdisc_dequeue_internal
    5bf5fce8a0c2 net: bridge: fix soft lockup in br_multicast_query_expired()
    59431eb72bb0 net: xilinx: axienet: Fix RX skb ring management in DMAengine mode
    fee345385d8e RDMA/hns: Fix dip entries leak on devices newer than hip09
    ae3df92efd02 RDMA/core: Free pfn_list with appropriate kvfree call
    1adaa345e604 RDMA/bnxt_re: Fix to initialize the PBL array
    2df8bc645bb5 RDMA/bnxt_re: Fix a possible memory leak in the driver
    673e40a410e3 RDMA/bnxt_re: Fix to remove workload check in SRQ limit path
    ac23dfbfcdb3 RDMA/bnxt_re: Fix to do SRQ armena by default
    52c13a4e741b RDMA/hns: Fix querying wrong SCC context for DIP algorithm
    a473adc12a63 RDMA/erdma: Fix unset QPN of GSI QP
    5f0cb9013d0f RDMA/erdma: Fix ignored return value of init_kernel_qp
    d47782d5c0cb platform/x86/amd/hsmp: Ensure sock->metric_tbl_addr is non-NULL
    7c626f6cb0e0 drm/panic: Add a u64 divide by 10 for arm32
    72097f917f20 rust: drm: don't pass the address of drm::Device to drm_dev_put()
    f46b0e361d28 rust: drm: remove pin annotations from drm::Device
    9cd486e47ca8 rust: drm: ensure kmalloc() compatible Layout
    3340149cebd9 rust: alloc: replace aligned_size() with Kmalloc::aligned_layout()
    6b14c9c91406 iosys-map: Fix undefined behavior in iosys_map_clear()
    9ab05797198c drm/tests: Fix drm_test_fb_xrgb8888_to_xrgb2101010() on big-endian
    c7f57093c5fb drm/tests: Do not use drm_fb_blit() in format-helper tests
    832b77ffd64f drm/tests: Fix endian warning
    933563ad9bbf cgroup/cpuset: Fix a partition error with CPU hotplug
    de2e883b65b0 cgroup/cpuset: Use static_branch_enable_cpuslocked() on cpusets_insane_config_key
    7d9110e3b35d drm/nouveau/nvif: Fix potential memory leak in nvif_vmm_ctor().
    b4223dfc8cea spi: spi-qpic-snand: fix calculating of ECC OOB regions' properties
    566f60ffbdbd spi: spi-fsl-lpspi: Clamp too high speed_hz
    eb9a497b9330 spi: spi-qpic-snand: use correct CW_PER_PAGE value for OOB write
    9fcc7401c59e iio: imu: inv_icm42600: change invalid data error to -EBUSY
    96abc49df8b9 iio: imu: inv_icm42600: Convert to uXX and sXX integer types
    22afdbd6fd2e iio: imu: inv_icm42600: use = { } instead of memset()
    d150fa3de946 ixgbe: prevent from unwanted interface name changes
    e02b94131603 devlink: let driver opt out of automatic phys_port_name generation
    ce94b5a280b0 i2c: rtl9300: Add missing count byte for SMBus Block Ops
    2245a5e3b2d2 i2c: rtl9300: Increase timeout for transfer polling
    f2acaff7be6a i2c: rtl9300: Fix multi-byte I2C write
    071e43fcba5d i2c: rtl9300: Fix out-of-bounds bug in rtl9300_i2c_smbus_xfer
    d23264c257a7 x86/cpu/hygon: Add missing resctrl_cpu_detect() in bsp_init helper
    7d06af2fa25b x86/CPU/AMD: Ignore invalid reset reason value
    29c0ce3c8cdb tls: fix handling of zero-length records on the rx_list
    e93c964fa05a PCI: dwc: Ensure that dw_pcie_wait_for_link() waits 100 ms after link up
    12403bffed98 ovl: use I_MUTEX_PARENT when locking parent in ovl_create_temp()
    3079517a5ba8 tracing: Limit access to parser->buffer when trace_get_user failed
    a970a8a7403e tracing: Remove unneeded goto out logic
    5af0b2aac1dd usb: dwc3: pci: add support for the Intel Wildcat Lake
    db27482b9db3 usb: dwc3: Remove WARN_ON for device endpoint command timeouts
    2e61dd38d051 usb: dwc3: Ignore late xferNotReady event to prevent halt timeout
    36b93b34f392 usb: xhci: fix host not responding after suspend and resume
    83b0a4acf397 usb: xhci: Fix slot_id resource race conflict
    c151e1644d72 usb: typec: maxim_contaminant: re-enable cc toggle if cc is open and port is clean
    90baa40c68f7 usb: typec: maxim_contaminant: disable low power mode when reading comparator values
    fe682f5b857e USB: storage: Ignore driver CD mode for Realtek multi-mode Wi-Fi dongles
    378da3668e4b usb: storage: realtek_cr: Use correct byte order for bcs->Residue
    8ea397f1c813 USB: storage: Add unusual-devs entry for Novatek NTK96550-based camera
    74152db56a18 usb: renesas-xhci: Fix External ROM access timeouts
    84dc7084ae5b usb: core: hcd: fix accessing unmapped memory in SINGLE_STEP_SET_FEATURE test
    aecf0d557ddd comedi: Fix use of uninitialized memory in do_insn_ioctl() and do_insnlist_ioctl()
    d8992c9a01f8 comedi: pcl726: Prevent invalid irq number
    dc0a2f142d65 comedi: Make insn_rw_emulate_bits() do insn->n samples
    5eb586cbbde0 usb: quirks: Add DELAY_INIT quick for another SanDisk 3.2Gen1 Flash Drive
    b23474adb491 cdx: Fix off-by-one error in cdx_rpmsg_probe()
    9502b99bac0b kcov, usb: Don't disable interrupts in kcov_remote_start_usb_softirq()
    913f3c0c68b6 most: core: Drop device reference after usage in get_channel()
    f947b1f153b5 iio: adc: rzg2l: Cleanup suspend/resume path
    9a50243a949c iio: proximity: isl29501: fix buffered read on big-endian systems
    59138285cf21 iio: adc: ad7173: prevent scan if too many setups requested
    4266666a3061 iio: adc: bd79124: Add GPIOLIB dependency
    e7ce902db071 iio: adc: rzg2l_adc: Set driver data before enabling runtime PM
    f93f84bfa1fc iio: pressure: bmp280: Use IS_ERR() in bmp280_common_probe()
    8acd9a0eaa8c iio: light: as73211: Ensure buffer holes are zeroed
    23c0d44cc9e8 iio: adc: ad7124: fix channel lookup in syscalib functions
    600b6acad1ca iio: temperature: maxim_thermocouple: use DMA-safe buffer for spi_read()
    64db338140d2 ftrace: Also allocate and copy hash for reading of filter files
    c88c04adb861 iio: accel: sca3300: fix uninitialized iio scan data
    fbadb1f118b5 iio: adc: ad7380: fix missing max_conversion_rate_hz on adaq4381-4
    c3522378f7aa fpga: zynq_fpga: Fix the wrong usage of dma_map_sgtable()
    944e732be9c3 drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS
    c97636cc83d4 drm/amd: Restore cached manual clock settings during resume
    f875c3d5e302 iommu/virtio: Make instance lookup robust
    7a4c7d82aaf1 iommu: Remove ops.pgsize_bitmap from drivers that don't use it
    f9d5eaca749e use uniform permission checks for all mount propagation changes
    9464ca13e51a signal: Fix memory leak for PIDFD_SELF* sentinels
    90b5193edb32 fs/buffer: fix use-after-free when call bh_read() helper
    e41e33400516 smb: server: split ksmbd_rdma_stop_listening() out of ksmbd_rdma_destroy()
    a69da89ebc32 libfs: massage path_from_stashed() to allow custom stashing behavior
    f24ea09d04e0 fhandle: do_handle_open() should get FD with user flags
    580dc5286533 btrfs: zoned: fix data relocation block group reservation
    f5e395a0aa35 fs: fix incorrect lflags value in the move_mount syscall
    b68b61b5254a debugfs: fix mount options not being applied
    d30e2aa0633b rust: faux: fix C header link
    c8c752194916 xfs: fix frozen file system assert in xfs_trans_alloc
    e69d24d4a725 soc: qcom: mdt_loader: Fix error return values in mdt_header_valid()
    3a0dc1f487c3 drm/amdgpu: fix task hang from failed job submission during process kill
    ac58c2890b8d PCI: rockchip: Set Target Link Speed to 5.0 GT/s before retraining
    7c5d98374101 PCI: rockchip: Use standard PCIe definitions
    4df7f633a34b scsi: mpi3mr: Serialize admin queue BAR writes on 32-bit systems
    123c33677141 scsi: mpi3mr: Drop unnecessary volatile from __iomem pointers
    a8cd4c9e507d drm/amd/display: Fill display clock and vblank time in dce110_fill_display_configs
    630850b81a03 drm/amd/display: Find first CRTC and its line time in dce110_fill_display_configs
    17217623c946 drm/amd/display: Fix DP audio DTO1 clock source on DCE 6.
    f8db9f79d689 drm/amd/display: Fix Xorg desktop unresponsive on Replay panel
    c8365bbd54c7 drm/amd/display: Fix fractional fb divider in set_pixel_clock_v3
    6e31eeaef20c drm/amd/display: Don't overclock DCE 6 by 15%
    0c1a486cbe6f drm/amd/display: Avoid a NULL pointer dereference
    bb646e91f568 drm/i915/icl+/tc: Convert AUX powered WARN to a debug message
    1693effa11c8 drm/i915/lnl+/tc: Use the cached max lane count value
    45c2c8cede9b drm/i915/lnl+/tc: Fix max lane count HW readout
    68c3646e1b2f drm/i915/icl+/tc: Cache the max lane count value
    4059818663cb drm/i915/lnl+/tc: Fix handling of an enabled/disconnected dp-alt sink
    e1eff52183f8 drm/i915/gt: Relocate compression repacking WA for JSL/EHL
    37207b696369 drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
    ec9e405ac16c drm/i915: silence rpm wakeref asserts on GEN11_GU_MISC_IIR access
    80eddbd0182a drm/amdgpu/swm14: Update power limit logic
    df647220b218 accel/habanalabs/gaudi2: Use kvfree() for memory allocated with kvcalloc()
    cde3a9094a48 compiler: remove __ADDRESSABLE_ASM{_STR,}() again
    7410fc77376a platform/x86/intel-uncore-freq: Check write blocked for ELC
    bf83ae353735 s390/sclp: Fix SCCB present check
    8ead139a8ede RDMA/rxe: Flush delayed SKBs while releasing RXE resources
    e7ea47001fe8 ALSA: hda/realtek: Add support for HP EliteBook x360 830 G6 and EliteBook 830 G6
    2812815aa796 ALSA: hda: tas2781: Fix wrong reference of tasdevice_priv
    d70ca21f7bff mm/mremap: fix WARN with uffd that has remap events disabled
    23580f9a3342 mm/memory-failure: fix infinite UCE for VM_PFNMAP pfn
    561171db3b3e mm/debug_vm_pgtable: clear page table entries at destroy_args()
    ee2d4f6cd021 mm/damon/core: fix damos_commit_filter not changing allow
    81e8bdf7fb21 squashfs: fix memory leak in squashfs_fill_super
    202a3432d21a NFS: Fix a race when updating an existing write
    c5a684386add mmc: sdhci_am654: Disable HS400 for AM62P SR1.0 and SR1.1
    4ab8829c1dfb mmc: sdhci-pci-gli: GL9763e: Rename the gli_set_gl9763e() for consistency
    439cf5e70a40 mmc: sdhci-pci-gli: GL9763e: Mask the replay timer timeout of AER
    3e2c9b87a53e memstick: Fix deadlock by moving removing flag earlier
    e2878bfec9f3 kho: warn if KHO is disabled due to an error
    4039ab9bdc72 kho: mm: don't allow deferred struct page with KHO
    9a140705f1a0 kho: init new_physxa->phys_bits to fix lockdep
    11b6e25ef6cd mmc: sdhci-pci-gli: Add a new function to simplify the code
    904a97fd5b32 mmc: sdhci-of-arasan: Ensure CD logic stabilization before power-up
    f9045bb7a700 mm/damon/core: fix commit_ops_filters by using correct nth function
    34ed1f9793b2 iommu/arm-smmu-v3: Fix smmu_domain->nr_ats_masters decrement
    95b6b3770add iov_iter: iterate_folioq: fix handling of offset >= folio size
    d34c04152df5 io_uring/futex: ensure io_futex_wait() cleans up properly on failure
    220c49149025 iommu/riscv: prevent NULL deref in iova_to_phys
    7ec68c59461c crypto: acomp - Fix CFI failure due to type punning
    31eb1b5e3f8a erofs: Do not select tristate symbols from bool symbols
    890a8ea06a09 erofs: fix build error with CONFIG_EROFS_FS_ZIP_ACCEL=y
    e91bed9a256a xfs: Remove unused label in xfs_dax_notify_dev_failure
    a97792008d16 xfs: fully decouple XFS_IBULK* flags from XFS_IWALK* flags
    6224b3cd64a3 xfs: improve the comments in xfs_select_zone_nowait
    3d4d9618c098 xfs: return the allocated transaction from xfs_trans_alloc_empty
    69dbbfeaab85 xfs: decouple xfs_trans_alloc_empty from xfs_trans_alloc
    bce7a5c77a1e btrfs: subpage: keep TOWRITE tag until folio is cleaned
    2c221996279c btrfs: rename btrfs_subpage structure
    e4a82c18c12d btrfs: add comments on the extra btrfs specific subpage bitmaps
    10ec363cfefe btrfs: fix subpage deadlock in try_release_subpage_extent_buffer()
    98f97e261641 btrfs: use refcount_t type for the extent buffer reference counter
    71f50f3c8691 btrfs: add comment for optimization in free_extent_buffer()
    99f62a4d5c19 btrfs: reorganize logic at free_extent_buffer() for better readability
    f4f5bd9251a4 btrfs: abort transaction on unexpected eb generation at btrfs_copy_root()
    31faf314f531 btrfs: always abort transaction on failure to add block group to free space tree
    a78818390cc0 btrfs: move transaction aborts to the error site in add_block_group_free_space()
    9d0c2d15aff9 mm/damon/ops-common: ignore migration request to invalid nodes
    7912d110cbf5 selftests: mptcp: sockopt: fix C23 extension warning
    201a991417dd selftests: mptcp: connect: fix C23 extension warning
    e39df3506fb8 selftests: mptcp: pm: check flush doesn't reset limits
    18ab643fb9a2 mptcp: disable add_addr retransmission when timeout is 0
    297878767c3c mptcp: remove duplicate sk_reset_timer call
    1e640c78faeb mptcp: pm: kernel: flush: do not reset ADD_ADDR limit
    1983470069cb mptcp: drop skb if MPTCP skb extension allocation fails
    b02eec41c9bb ACPI: APEI: EINJ: Fix resource leak by remove callback in .exit.text
    908094681f64 ACPI: pfr_update: Fix the driver update version check
    49f6c5634844 cpuidle: governors: menu: Avoid selecting states with too much latency
    e58d219b04d6 cgroup: avoid null de-ref in css_rstat_exit()
    f7878d47560d ipv6: sr: Fix MAC comparison to be constant-time
    6a32cbe95029 sched/ext: Fix invalid task state transitions on class switch
    61009439e4bd net, hsr: reject HSR frame if skb can't hold tag
    716d57caa0f9 LoongArch: KVM: Add address alignment check in pch_pic register access
    b5b49d341f90 LoongArch: KVM: Fix stack protector issue in send_ipi_data()
    c8e5c452bd38 LoongArch: KVM: Make function kvm_own_lbt() robust
    bc7d1d2e8233 drm/amd/display: Don't overwrite dce60_clk_mgr
    7133d48b9b06 drm/amd/display: Revert "drm/amd/display: Fix AMDGPU_MAX_BL_LEVEL value"
    dbbaa73e4927 drm/amd/display: Pass up errors for reset GPU that fails to init HW
    2700e35f1695 drm/amd/display: fix initial backlight brightness calculation
    a3fe5909ce0e drm/amd/display: Fix DCE 6.0 and 6.4 PLL programming.
    4ade995b9b25 drm/amd/display: fix a Null pointer dereference vulnerability
    1ed73a5d8aaa drm/amd/display: Add primary plane to commits for correct VRR handling
    ac2021ff853e drm/amdkfd: Fix checkpoint-restore on multi-xcc
    910735ded17c drm/amdkfd: Destroy KFD debugfs after destroy KFD wq
    382928bd92fc drm/amdgpu: Update supported modes for GC v9.5.0
    0d2e2bc1dd85 drm/amdgpu: update mmhub 4.1.0 client id mappings
    8a29e52fb53e drm/amdgpu: update mmhub 3.3 client id mappings
    e8510423f220 drm/amdgpu: update mmhub 3.0.1 client id mappings
    a5c060425719 drm/amdgpu: Update external revid for GC v9.5.0
    7c6119c239d0 drm/amdgpu: track whether a queue is a kernel queue in amdgpu_mqd_prop
    88b2dcc8f3a0 drm/amdgpu: Retain job->vm in amdgpu_job_prepare_job
    a7bb3e1dcf47 drm/amdgpu: Initialize data to NULL in imu_v12_0_program_rlc_ram()
    98e92fceb950 drm/amdgpu: check if hubbub is NULL in debugfs/amdgpu_dm_capabilities
    35a37af0b3ef drm/amdgpu: Avoid extra evict-restore process.
    30c699785ba3 drm/amdgpu: add missing vram lost check for LEGACY RESET
    b6700e1db625 drm/amdgpu: add kicker fws loading for gfx12/smu14/psp14
    be549f991478 drm/amd: Restore cached power limit during resume
    1d37040767f4 drm/amdgpu/discovery: fix fw based ip discovery
    56b955718be0 drm/amd/amdgpu: fix missing lock for cper.ring->rptr/wptr access
    8415a9c3f97a drm/xe: Defer buffer object shrinker write-backs and GPU waits
    b89714bfc993 drm/xe/bmg: Add one additional PCI ID
    aa59dd7d3d90 media: iris: Remove unnecessary re-initialization of flush completion
    490754519d0d media: iris: Verify internal buffer release on close
    b4cb178ca378 media: iris: Update CAPTURE format info based on OUTPUT format
    7309f625f8cb media: iris: Track flush responses to prevent premature completion
    fcb27affcb61 media: iris: Skip flush on first sequence change
    be05123a14c1 media: iris: Skip destroying internal buffer if not dequeued
    a6a196cd6d68 media: iris: Send V4L2_BUF_FLAG_ERROR for capture buffers with 0 filled length
    8d12079a139f media: iris: Remove error check for non-zero v4l2 controls
    61429aaa019b media: iris: Remove deprecated property setting to firmware
    991e88119f83 media: iris: Prevent HFI queue writes when core is in deinit state
    ec8c4354638f media: iris: Fix typo in depth variable
    992ddee3c0da media: iris: Fix NULL pointer dereference
    af5af85abd8d media: iris: Fix missing function pointer initialization
    55a2bc01c768 media: iris: Fix buffer preparation failure during resolution change
    3b2631783222 media: iris: Drop port check for session property response
    280d4c8e026d media: iris: Avoid updating frame size to firmware during reconfig
    7cbce62ce99c media: venus: venc: Clamp param smaller than 1fps and bigger than 240
    974aba0da7cd media: venus: vdec: Clamp param smaller than 1fps and bigger than 240.
    e796028b4835 media: venus: protect against spurious interrupts during probe
    c957a0a01af4 media: venus: hfi: explicitly release IRQ during teardown
    9e8a0ddeaee1 media: venus: Fix MSM8998 frequency table
    f0cbd9386f97 media: venus: Add a check for packet size after reading from shared memory
    a1524d9ed110 media: qcom: camss: Remove extraneous -supply postfix on supply names
    423d163c5d8c media: qcom: camss: cleanup media device allocated resource on error path
    850538d18347 media: qcom: camss: csiphy-3ph: Fix inadvertent dropping of SDM660/SDM670 phy init
    1dfe73394dcf media: ivsc: Fix crash at shutdown due to missing mei_cldev_disable() calls
    41b97490a165 media: mt9m114: Fix deadlock in get_frame_interval/set_frame_interval
    bd5811e253f2 media: ov2659: Fix memory leaks in ov2659_probe()
    3681d9a0f0b0 media: pisp_be: Fix pm_runtime underrun in probe
    ff9dd3db6cd4 media: rainshadow-cec: fix TOCTOU race condition in rain_interrupt()
    9f886d21e235 media: usbtv: Lock resolution while streaming
    d8bf3e843eab media: v4l2-ctrls: Don't reset handler's error in v4l2_ctrl_handler_free()
    673ce1119ed1 media: verisilicon: Fix AV1 decoder clock frequency
    130474bd3e57 media: vivid: fix wrong pixel_array control size
    6b07fdbe3dbf media: ipu6: isys: Use correct pads for xlate_streams()
    d8c94df2064d media: imx: fix a potential memory leak in imx_media_csc_scaler_device_init()
    1d60df423dff media: hi556: correct the test pattern configuration
    1eaed533aae1 media: gspca: Add bounds checking to firmware parser
    8f4cb3d0d0ab parisc: Update comments in make_insert_tlb
    2545af5b608b parisc: Try to fixup kernel exception in bad_area_nosemaphore path of do_page_fault()
    9b6af875baba parisc: Revise gateway LWS calls to probe user read access
    741b163e4406 parisc: Revise __get_user() to probe user read access
    b9948b890df7 parisc: Rename pte_needs_flush() to pte_needs_cache_flush() in cache.c
    7595fe8f2a5a parisc: Makefile: explain that 64BIT requires both 32-bit and 64-bit compilers
    4afb1352b85d parisc: Drop WARN_ON_ONCE() from flush_cache_vmap
    5f441312a75d parisc: Define and use set_pte_at()
    372da085eff5 parisc: Check region is readable by user in raw_copy_from_user()
    dd673de98954 soc/tegra: pmc: Ensure power-domains are in a known state
    ec8d823eb049 proc: proc_maps_open allow proc_mem_open to return NULL
    69dbdc711d91 open_tree_attr: do not allow id-mapping changes without OPEN_TREE_CLONE
    23a94fc0fcd2 Mark xe driver as BROKEN if kernel page size is not 4kB
    2ed7759ffd27 kbuild: userprogs: use correct linker when mixing clang and GNU ld
    c9ec713e03e6 kasan/test: fix protection against compiler elision
    3faac5e1d14c jbd2: prevent softlockup in jbd2_log_do_checkpoint()
    86de3aaf29a4 iomap: Fix broken data integrity guarantees for O_SYNC writes
    13344509b72d i2c: qcom-geni: fix I2C frequency table to achieve accurate bus rates
    f1d5093d9fe9 f2fs: fix to avoid out-of-boundary access in dnode page
    a51d24abb2f8 block: restore default wbt enablement
    8b7b5f147713 ASoC: SOF: amd: acp-loader: Use GFP_KERNEL for DMA allocations in resume context
    bae2af0eadd0 amdgpu/amdgpu_discovery: increase timeout limit for IFWI init
    03875a42b43a phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy initialization sequence
    0a73a4215b2b vhost/vsock: Avoid allocating arbitrarily-sized SKBs
    676f03760ca1 vsock/virtio: Validate length in packet header before skb_put()
    8ba110b3dfda PCI: imx6: Delay link start until configfs 'start' written
    6182c00bc0ec PCI: imx6: Remove apps_reset toggling from imx_pcie_{assert/deassert}_core_reset
    fa596cb9aa16 PCI: imx6: Add IMX8MM_EP and IMX8MP_EP fixed 256-byte BAR 4 in epc_features
    f2d5c599c1e4 PCI: imx6: Add IMX8MQ_EP third 64-bit BAR in epc_features
    315b964fa9d7 PCI: endpoint: Fix configfs group removal on driver teardown
    a302bd89db35 PCI: endpoint: Fix configfs group list head handling
    16557320f378 PCI: Fix link speed calculation on retrain failure
    a9fae40f362a PCI/portdrv: Use is_pciehp instead of is_hotplug_bridge
    fd2e31c9fab7 readahead: fix return value of page_cache_next_miss() when no hole is found
    815b33994fa0 mfd: mt6397: Do not use generic name for keypad sub-devices
    2128bd83aec3 mtd: rawnand: renesas: Add missing check after DMA map
    f8f74ac7b0d7 mtd: rawnand: fsmc: Add missing check after DMA map
    bbbe279879d1 mtd: spinand: propagate spinand_wait() errors from spinand_write_page()
    5a3a4e425ba4 mtd: spi-nor: Fix spi_nor_try_unlock_all()
    ccca9b82fe11 hwmon: (gsc-hwmon) fix fan pwm setpoint show functions
    bf1a20c57101 pwm: mediatek: Fix duty and period setting
    ab2331507c72 pwm: mediatek: Handle hardware enable and clock enable separately
    e50917dc04cd pwm: imx-tpm: Reset counter if CMOD is 0
    6fc2589aae91 wifi: ath11k: fix dest ring-buffer corruption when ring is full
    eed5fcf4a3d2 wifi: ath11k: fix source ring-buffer corruption
    0f708ced8975 wifi: ath11k: fix dest ring-buffer corruption
    d4c7edd0b383 wifi: ath12k: fix dest ring-buffer corruption when ring is full
    06fcf123f31b wifi: ath12k: fix source ring-buffer corruption
    c2e387387439 wifi: ath12k: fix dest ring-buffer corruption
    b860da3ace17 wifi: brcmsmac: Remove const from tbl_ptr parameter in wlc_lcnphy_common_read_table()
    fb67be2b6864 iio: adc: ad7173: fix setting ODR in probe
    5c6c645d9916 iio: adc: ad7173: fix calibration channel
    2def1a8691eb iio: adc: ad7173: fix channels index for syscalib_mode
    4c6cc6d7dbbf iio: adc: ad_sigma_delta: change to buffer predisable
    5c2b601922c0 iio: imu: bno055: fix OOB access of hw_xlate array
    700b7fd04e8d zynq_fpga: use sgtable-based scatterlist wrappers
    81278be4eb5f soc: qcom: mdt_loader: Ensure we don't read past the ELF header
    6e1536900639 ata: libata-scsi: Fix CDL control
    947ee26c115b scsi: ufs: ufs-pci: Fix default runtime and system PM levels
    626a57fd7204 scsi: ufs: ufs-pci: Fix hibernate state transition for Intel MTL-like host controllers
    369144743de1 ata: libata-scsi: Return aborted command when missing sense and result TF
    979f38605b7f ata: libata-scsi: Fix ata_to_sense_error() status handling
    c38de5c5d59b scsi: mpi3mr: Fix race between config read submit and interrupt completion
    5b9f1ef29342 scsi: ufs: exynos: Fix programming of HCI_UTRL_NEXUS_TYPE
    88c0aacaf5f0 scsi: dt-bindings: mediatek,ufs: Add ufs-disable-mcq flag for UFS host
    ffd43c23c09d dt-bindings: display: vop2: Add optional PLL clock property for rk3576
    c6b1871ada1b dt-bindings: display: sprd,sharkl3-dsi-host: Fix missing clocks constraints
    fa2bb2cadee1 dt-bindings: display: sprd,sharkl3-dpu: Fix missing clocks constraints
    063b381661e1 apparmor: Fix 8-byte alignment for initial dfa blob streams
    47b2d7b91af4 arm64: dts: rockchip: Remove workaround that prevented Turing RK1 GPU power regulator control
    fb62e2166b79 arm64: dts: ti: k3-am62-verdin: Enable pull-ups on I2C buses
    2b31be87128f arm64: dts: exynos7870-on7xelte: reduce memory ranges to base amount
    9b6e6a68a556 arm64: dts: ti: k3-am62*: Move eMMC pinmux to top level board file
    5cb67d96d312 arm64: dts: ti: k3-am62a7-sk: fix pinmux for main_uart1
    276ee664cada arm64: dts: exynos: gs101: ufs: add dma-coherent property
    68e82705b464 arm64: dts: rockchip: Enable HDMI PHY clk provider on rk3576
    cd93a971ff3e arm64: dts: rockchip: Add HDMI PHY PLL clock source to VOP2 on rk3576
    980648aa73f9 arm64: dts: exynos7870: add quirk to disable USB2 LPM in gadget mode
    432868604b8f arm64: dts: ti: k3-pinctrl: Enable Schmitt Trigger by default
    8c164d6915d3 arm64: dts: exynos7870-j6lte: reduce memory ranges to base amount
    9874d3d27fe1 arm64: dts: ti: k3-am62-main: Remove eMMC High Speed DDR support
    c1e72a3b4b62 arm64: dts: apple: t8012-j132: Include touchbar framebuffer node
    e8dd21d68572 btrfs: fix printing of mount info messages for NODATACOW/NODATASUM
    0a9ce997b883 btrfs: restore mount option info messages during mount
    df2fe1a7f689 btrfs: fix incorrect log message for nobarrier mount option
    e8cf57134aa7 btrfs: zoned: fix write time activation failure for metadata block group
    f1dad8922501 ext4: fix hole length calculation overflow in non-extent inodes
    5e14e7060bb5 ext4: use kmalloc_array() for array space allocation
    2ea0fcc8878f ext4: don't try to clear the orphan_present feature block device is r/o
    dea93e9d7bdc ext4: fix reserved gdt blocks handling in fsmap
    63235222321d ext4: fix fsmap end of range reporting with bigalloc
    a4f16e7104fa ext4: check fast symlink for ea_inode correctly
    ccfa47edb01b ext4: preserve SB_I_VERSION on remount
    918974a4bd80 tracing: fprobe-event: Sanitize wildcard for fprobe event name
    8c9ee2e4f58e ksmbd: extend the connection limiting mechanism to support IPv6
    9a7abce6e8c0 ksmbd: fix refcount leak causing resource not released
    fd1896dccc9a Revert "vgacon: Add check for vc_origin address range in vgacon_scroll()"
    26f8402ba28f crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)
    415273fc22bf crypto: octeontx2 - Fix address alignment on CN10KB and CN10KA-B0
    11a6e7d57025 crypto: octeontx2 - Fix address alignment on CN10K A0/A1 and OcteonTX2
    6208992dcb93 crypto: octeontx2 - Fix address alignment issue on ucode loading
    475104178f4d crypto: x86/aegis - Add missing error checks
    02caf91b2fa1 crypto: x86/aegis - Fix sleeping when disallowed on PREEMPT_RT
    e59a52e429e1 crypto: qat - flush misc workqueue during device shutdown
    488ed465e579 crypto: caam - Prevent crash on suspend with iMX8QM / iMX8ULP
    7e3d3e10f3a4 crypto: ccp - Fix SNP panic notifier unregistration
    bd1e33b90abd crypto: qat - lower priority for skcipher and aead algorithms
    ef74efa598b7 lib/crypto: arm64/poly1305: Fix register corruption in no-SIMD contexts
    87bdfba903be lib/crypto: arm/poly1305: Fix register corruption in no-SIMD contexts
    23c46714cc01 lib/crypto: mips/chacha: Fix clang build and remove unneeded byteswap
    387164a2b97e netfs: Fix unbuffered write error handling
    99c39cf8b9d6 vt: defkeymap: Map keycodes above 127 to K_HOLE
    7099408cfb9b vt: keyboard: Don't process Unicode characters in K_OFF mode
    44e1a079e18f bus: mhi: host: Detect events pointing to unexpected TREs
    d6d3405b1005 bus: mhi: host: Fix endianness of BHI vector table
    f23ad68dfb1a usb: dwc3: imx8mp: fix device leak at unbind
    3d238a236bb9 usb: dwc3: meson-g12a: fix device leaks at unbind
    38a0b2f2c5e0 usb: musb: omap2430: fix device leak at unbind
    4997027888b3 usb: gadget: udc: renesas_usb3: fix device leak at unbind
    42f86088b700 usb: atm: cxacru: Merge cxacru_upload_firmware() into cxacru_heavy_init()
    d58b1124494d iio: adc: ad7173: fix num_slots
    c8e96018630a m68k: Fix lost column on framebuffer debug console
    b67964b373c8 dm: Check for forbidden splitting of zone write operations
    52a2c4c60470 dm: dm-crypt: Do not partially accept write BIOs with zoned targets
    e753e3534e6c PM: runtime: Take active children into account in pm_runtime_get_if_in_use()
    55131fdb0cad platform/chrome: cros_ec: Unregister notifier in cros_ec_unregister()
    a7a22cc80550 cpufreq: armada-8k: Fix off by one in armada_8k_cpufreq_free_table()
    fa70bb0c8504 ata: Fix SATA_MOBILE_LPM_POLICY description in Kconfig
    38c0ea484ded serial: 8250: fix panic due to PSLVERR
    fd590381da18 Linux 6.16.3
    3471c1400ad1 ext4: replace ext4_writepage_trans_blocks()
    2e8216e289d0 ext4: reserved credits for one extent during the folio writeback
    2b6d39229bc7 ext4: correct the reserved credits for extent conversion
    7fe61ac00262 ext4: enhance tracepoints during the folios writeback
    ffb21eafbf4f ext4: restart handle if credits are insufficient during allocating blocks
    ab13e8cc3fb2 ext4: refactor the block allocation process of ext4_page_mkwrite()
    98571b628c61 ext4: fix stale data if it bail out of the extents mapping loop
    de83915e8f2a ext4: move the calculation of wbc->nr_to_write to mpage_folio_done()
    dc3588c04deb ext4: process folios writeback in bytes

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.16.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.16.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index 06d4c51a70..cf8f86504d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0efe352ff92817ba56a91bfe983e96cd55c76940"
-SRCREV_meta ?= "f7034ee0721badc73a0417aa324755c1e6c415e5"
+SRCREV_machine ?= "c631c6cf05de829937afe048e6ae2fea15634cc8"
+SRCREV_meta ?= "c8f3f45cdd56085242916804754ccad79d2573c9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.16.2"
+LINUX_VERSION ?= "6.16.4"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index 04fb3eef42..1e5ed856b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
-LINUX_VERSION ?= "6.16.2"
+LINUX_VERSION ?= "6.16.4"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
-SRCREV_meta ?= "f7034ee0721badc73a0417aa324755c1e6c415e5"
+SRCREV_machine ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
+SRCREV_meta ?= "c8f3f45cdd56085242916804754ccad79d2573c9"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index d19803cb6c..f37c1a62c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.16/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.16/standard/base"
 KBRANCH:qemumips64 ?= "v6.16/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5b1e57ea06450da46fd00359cfbd11d26ffd1cd5"
-SRCREV_machine:qemuarm64 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
-SRCREV_machine:qemuloongarch64 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
-SRCREV_machine:qemumips ?= "19cfa2226631af5c18647b69eba294619e1b7323"
-SRCREV_machine:qemuppc ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
-SRCREV_machine:qemuriscv64 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
-SRCREV_machine:qemuriscv32 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
-SRCREV_machine:qemux86 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
-SRCREV_machine:qemux86-64 ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
-SRCREV_machine:qemumips64 ?= "dea33382cd8394c214422ebead1a2e08a4832c90"
-SRCREV_machine ?= "f6b5e4a67c21308265aabd3cb6cf00e329d930f6"
-SRCREV_meta ?= "f7034ee0721badc73a0417aa324755c1e6c415e5"
+SRCREV_machine:qemuarm ?= "b1d9863cd54ffc3b03ee0e270c86e8c99c88462c"
+SRCREV_machine:qemuarm64 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
+SRCREV_machine:qemuloongarch64 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
+SRCREV_machine:qemumips ?= "297e7bd12c944fd0746419990157ec1a7fb7ddf3"
+SRCREV_machine:qemuppc ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
+SRCREV_machine:qemuriscv64 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
+SRCREV_machine:qemuriscv32 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
+SRCREV_machine:qemux86 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
+SRCREV_machine:qemux86-64 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
+SRCREV_machine:qemumips64 ?= "2459c29bf2c3d221fd6d3222c7200b368156986e"
+SRCREV_machine ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
+SRCREV_meta ?= "c8f3f45cdd56085242916804754ccad79d2573c9"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "25bf10be219d37d2fb221c93816a913f5f735530"
+SRCREV_machine:class-devupstream ?= "be15dab9a451155bdf3f5278608fe8dc67e07cc1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.16/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.16.2"
+LINUX_VERSION ?= "6.16.4"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


