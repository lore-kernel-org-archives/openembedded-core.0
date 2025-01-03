Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE97CE77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 14:17:26 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.31531.1735913836788092690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 06:17:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lih0OXwK;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6ed9ed5b9so1694972385a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735913836; x=1736518636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmLHU+VhjpoTGBzH48/AVaFLrI+1DS/o1rjAPhK78l0=;
        b=Lih0OXwK5AsxH6+f6zrl3fMH/9cr/mL1G0W3x6rU1xGr0WppucMqGubeTYxWS1t8WV
         Mq4Nz+NIYNnHhzxENTAenG/sKFRVR08RQUWK1kVkOW9jz6Auv4ovHBgSvznSaV5frGyU
         fmojNFGkUOWwWjYJO7EyHYhZLlZ1y5KjpxU4UIJ8WUzVgP2qTRBK0YDGrxkdDqGIACSV
         9ci7UCqVJXaGqqNsm/IZBqPGuwxjER9appbjndYKImtBJerqXibMYM2ZVarCPkaKNgmk
         QhwMjba7DZ0VWvq4lI0VhqJ4ON0LqIbeAzFMegBUBIO6MG+5xSIsIawgs+dsd3yNh4FE
         fPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913836; x=1736518636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmLHU+VhjpoTGBzH48/AVaFLrI+1DS/o1rjAPhK78l0=;
        b=nLkkU84eJuztq6TKVM0VphailZoxFUMfRS4feab+FEE0W6ubmOg0UbVE37qD3Q9n4o
         Sn9b04TgV44HWO+WAT9beMGT8cqREw5ZkCrUsBJKXEYUdVV+9e28j8lkY9ID2+kTxaAA
         sCCu399sXRFXKA82PoeZq6jcHCKgY6/l5DeHBre2MlE+o4iDFo+Ml+3NIH14OjYReWPn
         sbLx/hAcTXHU9HlYtqbBvDdcUr8jEaHnGIksBAiYBI0cvjk/SoPfjCbEK09hTLG/KGlJ
         7lYq4FUGaazSa4ai7V+Zvob0ZfTjgSONTqXcoWOmVTkewosNbQ0GxvXmEl3YqgtcsO2Y
         g4vg==
X-Gm-Message-State: AOJu0YyDhxNd7m8R+QWx9i3YjSmaCANZ8DHe/UDSEaPj9es2ox+Zwm3u
	yYgr8tDeoEsKrhBtoOsQv8TcM1VS9TuATlLKkJEEBtK3rowO/QTx8N37ysrW9fU=
X-Gm-Gg: ASbGncvQc4gm2ul6oOTgO95rMurDo+n7454BIiq1jLOuGp8hi+5oMUHTjiaZuMpDKeV
	5Xq0owzOwCdkObfPRM0JIQDZeDIr30eedEVLqRXiMt/k3CqzenFlYfFGvnla2iJyxRYX6wihx1o
	GZqMJEJFJQWH5PL1V5Z1e8HfHJxRLW9as4SP8zhL120WP/zkSggMD73DzEAFRwB0UO9XHrOCert
	LdeaSAt3qAFYbrZYHAqqOunvzS9LFTwTN1RO4eDYtcghoACFj7XhELEc9/S6S/C7ULmVGbS0KE9
	Ze0jve4Ln8NgnX3mCr3x2woRdZQks6Fs2xiJLPdydlvscwH9ieXp8H845g==
X-Google-Smtp-Source: AGHT+IEwnRxnLrp6ohaaQqibwRxgB4inf5AO26TTw4x1yMXKO992rZxH6XWRBh9GX2M5Gm+KuCB7jQ==
X-Received: by 2002:a05:620a:1a8b:b0:7b6:dac1:cb81 with SMTP id af79cd13be357-7b9ba6ef9b2mr8811739085a.1.1735913835169;
        Fri, 03 Jan 2025 06:17:15 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4ef0f6sm1275015485a.123.2025.01.03.06.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:17:14 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/10] linux-yocto/5.10: update to v5.10.227
Date: Fri,  3 Jan 2025 09:17:02 -0500
Message-Id: <20250103141709.2848730-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
References: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 14:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209357

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    eac1c5bfc13c Linux 5.10.227
    9350016415b6 net: dsa: microchip: fix build warning
    9f76a9d1849d RDMA/hns: Fix uninitialized variable
    4911610c7a1f ext4: fix warning in ext4_dio_write_end_io()
    05cc42d601e7 netfilter: ip6t_rpfilter: Fix regression with VRF interfaces
    95f62e5a783d net: vrf: determine the dst using the original ifindex for multicast
    3adb1be04f6c net: seg6: fix seg6_lookup_any_nexthop() to handle VRFs using flowi_l3mdev
    ab6c9463b137 net: Handle l3mdev in ip_tunnel_init_flow
    0825c5ff246c xfrm: Pass flowi_oif or l3mdev as oif to xfrm_dst_lookup
    4bf1bd3ffff6 net: geneve: add missing netlink policy and size for IFLA_GENEVE_INNER_PROTO_INHERIT
    73f75d2b5aee nouveau/dmem: Fix vulnerability in migrate_to_ram upon copy error
    548d0102dc5c net: dsa: lan9303: ensure chip reset and wait for READY status
    68ad5da6ca63 net: Fix an unsafe loop on the list
    fcda074c98de hid: intel-ish-hid: Fix uninitialized variable 'rv' in ish_fw_xfer_direct_dma
    e7a1d51b3910 usb: storage: ignore bogus device raised by JieLi BR21 USB sound chip
    1d7fc802a725 usb: xhci: Fix problem with xhci resume from suspend
    f8dea2fede79 usb: dwc3: core: Stop processing of pending events if controller is halted
    a7564b160692 Revert "usb: yurex: Replace snprintf() with the safer scnprintf() variant"
    8669bca53fe6 HID: plantronics: Workaround for an unexcepted opposite volume key
    799a06ca7f6a hwmon: (adm9240) Add missing dependency on REGMAP_I2C
    ab6bc15e99d7 hwmon: (tmp513) Add missing dependency on REGMAP_I2C
    1d5f85f1b7db resource: fix region_intersects() vs add_memory_driver_managed()
    36b054324d18 slip: make slhc_remember() more robust against malicious packets
    30d91a478d58 ppp: fix ppp_async_encode() illegal access
    3502b1a29720 netfilter: fib: check correct rtable in vrf setups
    037145e2a214 netfilter: rpfilter/fib: Set ->flowic_uid correctly for user namespaces.
    d98558fe2699 netfilter: rpfilter/fib: Populate flowic_l3mdev field
    740de1987766 net: Add l3mdev index to flow struct and avoid oif reset for port devices
    265bf63e2471 sctp: ensure sk_state is set to CLOSED if hashing fails in sctp_listen_start
    23e139f90b25 net: ibm: emac: mal: fix wrong goto
    adbc3eef43fc net/sched: accept TCA_STAB only for root qdisc
    d79af3af2f49 igb: Do not bring the device up after non-fatal error
    c70e05b929b4 gpio: aspeed: Use devm_clk api to manage clock source
    36fd66cb5178 gpio: aspeed: Add the flush write to ensure the write complete.
    0e91c4b48445 net: dsa: b53: fix jumbo frames on 10/100 ports
    a7c9402bbc4a net: dsa: b53: allow lower MTUs on BCM5325/5365
    9f3407aa6cba net: dsa: b53: fix max MTU for BCM5325/BCM5365
    0109267c1ec4 net: dsa: b53: fix max MTU for 1g switches
    a625acf221c1 net: dsa: b53: fix jumbo frame mtu check
    e13ffbf5fdf5 net: phy: bcm84881: Fix some error handling paths
    ef44274dae9b Bluetooth: RFCOMM: FIX possible deadlock in rfcomm_sk_state_change
    cce8419b8168 netfilter: br_netfilter: fix panic with metadata_dst skb
    8a517d184549 tcp: fix tcp_enter_recovery() to zero retrans_stamp when it's safe
    fe238ddf8576 tcp: fix to allow timestamp undo if no retransmits were sent
    21b5af7f0c99 net: phy: dp83869: fix memory corruption when enabling fiber
    f892165c564e NFSv4: Prevent NULL-pointer dereference in nfs42_complete_copies()
    64f1b4922b6e SUNRPC: Fix integer overflow in decode_rc_list()
    1fc13f6a4166 ice: fix VLAN replay after reset
    993ce09fe622 NFSD: Mark filecache "down" if init fails
    de5a059e3665 RDMA/rxe: Fix seg fault in rxe_comp_queue_pkt
    252f147b1826 fbdev: sisfb: Fix strbuf array overflow
    f4149eec9601 drm/amd/display: Check null pointer before dereferencing se
    56452dbc0a2c driver core: bus: Return -EIO instead of 0 when show/store invalid bus attribute
    d8ac7378bc79 tools/iio: Add memory allocation failure check for trigger_name
    4ce662fe4be6 virtio_pmem: Check device status before requesting flush
    30ea38665dbf usb: dwc2: Adjust the timing of USB Driver Interrupt Registration in the Crashkernel Scenario
    4c83143fc65c usb: chipidea: udc: enable suspend interrupt after usb reset
    b677b94a9193 clk: imx: Remove CLK_SET_PARENT_GATE for DRAM mux for i.MX7D
    37c181e389f0 media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
    b65018968782 ntb: ntb_hw_switchtec: Fix use after free vulnerability in switchtec_ntb_remove due to race condition
    63047187a516 PCI: Mark Creative Labs EMU20k2 INTx masking as broken
    a28703d4d406 i2c: i801: Use a different adapter-name for IDF adapters
    e4f218455cef PCI: Add ACS quirk for Qualcomm SA8775P
    f3e0a8b7d4a5 clk: bcm: bcm53573: fix OF node leak in init
    b10c1ca941c2 PCI: Add function 0 DMA alias quirk for Glenfly Arise chip
    713adaf0ecfc RDMA/mad: Improve handling of timed out WRs of mad agent
    24318116c485 ktest.pl: Avoid false positives with grub2 skip regex
    345d3c0bf2bd s390/cpum_sf: Remove WARN_ON_ONCE statements
    c2097d5efb19 ext4: nested locking for xattr inode
    dced2c9d661e s390/mm: Add cond_resched() to cmm_alloc/free_pages()
    1cd197813eb8 s390/facility: Disable compile time optimization for decompressor code
    029aa36ba332 bpf: Check percpu map value size first
    4f4a6d70d78e Input: synaptics-rmi4 - fix UAF of IRQ domain on driver removal
    546fb43a2e4b tracing/kprobes: Fix symbol counting logic by looking at modules as well
    90a6a070a80a tracing/kprobes: Return EADDRNOTAVAIL when func matches several symbols
    2622c805abe7 kallsyms: Make module_kallsyms_on_each_symbol generally available
    2aa861ec7290 kallsyms: Make kallsyms_on_each_symbol generally available
    9b82d737d261 virtio_console: fix misc probe bugs
    f2fd1a9597d6 tracing: Have saved_cmdlines arrays all in one allocation
    25b00216206b s390/zcore: release dump save area on restart or power down
    0b4dc46f87c3 s390/zcore: no need to check return value of debugfs_create functions
    421795b06430 drm/crtc: fix uninitialized variable use even harder
    a009e88cc976 tracing: Remove precision vsnprintf() check from print event
    6063d72b61ca net: ethernet: cortina: Drop TSO support
    39fffca57284 unicode: Don't special case ignorable code points
    6592347f06e2 vhost/scsi: null-ptr-dereference in vhost_scsi_get_req()
    2f6da71e9de8 ext4: fix inode tree inconsistency caused by ENOMEM
    da964de4c181 ACPI: battery: Fix possible crash when unregistering a battery hook
    20557232c91a ACPI: battery: Simplify battery hook locking
    991e8b0bab66 r8169: add tally counter fields added with RTL8125
    238d5c541e7f r8169: Fix spelling mistake: "tx_underun" -> "tx_underrun"
    281edfa1cdef clk: qcom: dispcc-sm8250: use CLK_SET_RATE_PARENT for branch clocks
    570e257621be drm/rockchip: vop: clear DMA stop bit on RK3066
    411e2e1d0132 drm/rockchip: support gamma control on RK3399
    1aeaa7e8d859 drm/rockchip: define gamma registers for RK3399
    f561b48d633a uprobes: fix kernel info leak via "[uprobes]" vma
    24afda0421af arm64: errata: Expand speculative SSBS workaround once more
    9df353ca1301 arm64: cputype: Add Neoverse-N3 definitions
    c45edd5942cc arm64: Add Cortex-715 CPU part definition
    f8a7c342326f ext4: dax: fix overflowing extents beyond inode size when partially writing
    dde4c1e1663b ext4: properly sync file size update after O_SYNC direct IO
    6ff56ef7f724 i2c: xiic: Fix pm_runtime_set_suspended() with runtime pm enabled
    d223126bb0ac i2c: xiic: Use devm_clk_get_enabled()
    9bd3443e34e6 i2c: xiic: Simplify with dev_err_probe()
    8b55076b7bd4 kconfig: qconf: fix buffer overflow in debug links
    bfab5fbc12c5 drm/sched: Add locking to drm_sched_entity_modify_sched
    c54aa7d75055 gpio: davinci: fix lazy disable
    70b60c8d9b42 btrfs: wait for fixup workers before stopping cleaner kthread during umount
    d73d48acf36f btrfs: fix a NULL pointer dereference when failed to start a new trasacntion
    67db431b8520 ACPI: resource: Add Asus ExpertBook B2502CVA to irq1_level_low_skip_override[]
    1a819c7f857e ACPI: resource: Add Asus Vivobook X1704VAP to irq1_level_low_skip_override[]
    f976d964a64c Input: adp5589-keys - fix adp5589_gpio_get_value()
    bf8363e46fba rtc: at91sam9: fix OF node leak in probe() error path
    e33fe25b1efe net: stmmac: Fix zero-division error when disabling tc cbs
    68e579316cbf tomoyo: fallback to realpath if symlink's pathname does not exist
    68c77a70e33c iio: magnetometer: ak8975: Fix reading for ak099xx sensors
    1d108095d5e5 clk: qcom: gcc-sm8250: Do not turn off PCIe GDSCs during gdsc_disable()
    60b6968341a6 media: venus: fix use after free bug in venus_remove due to race condition
    4445bc6e9f2b clk: qcom: clk-rpmh: Fix overflow in BCM vote
    3f73da56af91 media: uapi/linux/cec.h: cec_msg_set_reply_to: zero flags
    5443e70fb7fc media: sun4i_csi: Implement link validate for sun4i_csi subdev
    ed0d5103f9ef clk: rockchip: fix error for unknown clocks
    f63461af2c1a aoe: fix the potential use-after-free problem in more places
    7ae7ada29a6f NFSD: Fix NFSv4's PUTPUBFH operation
    0ea4333c679f nfsd: map the EBADMSG to nfserr_io to avoid warning
    96cad5da791e nfsd: fix delegation_blocked() to block correctly for at least 30 seconds
    f692160d3e1e exfat: fix memory leak in exfat_load_bitmap()
    e01e9ae43e64 riscv: define ILLEGAL_POINTER_VALUE for 64bit
    61b84013e560 ocfs2: fix possible null-ptr-deref in ocfs2_set_buffer_uptodate
    bf605ae98dab ocfs2: fix null-ptr-deref when journal load failed.
    3f1ca6ba5452 ocfs2: remove unreasonable unlock in ocfs2_read_blocks
    14114d8148db ocfs2: cancel dqi_sync_work before freeing oinfo
    aac31d654a0a ocfs2: reserve space for inline xattr before attaching reflink tree
    8e3bf366368e ocfs2: fix uninit-value in ocfs2_get_block()
    ff1500fe2649 ocfs2: fix the la space leak when unmounting an ocfs2 volume
    a54378585624 mm: krealloc: consider spare memory for __GFP_ZERO
    7fabacb337f0 jbd2: correctly compare tids with tid_geq function in jbd2_fc_begin_commit
    481e8f18a290 jbd2: stop waiting for space when jbd2_cleanup_journal_tail() returns error
    2bda89735199 drm: omapdrm: Add missing check for alloc_ordered_workqueue
    3e8862875f8b of/irq: Support #msi-cells=<0> in of_msi_get_domain
    a63fdf20cc26 parisc: Fix stack start for ADDR_NO_RANDOMIZE personality
    ea7dead20420 parisc: Fix 64-bit userspace syscall path
    25ec5c873c45 ext4: fix incorrect tid assumption in ext4_wait_for_tail_page_commit()
    6766937d0327 ext4: update orig_path in ext4_find_extent()
    b6c29c8f3d7c ext4: fix double brelse() the buffer of the extents path
    5e811066c5ab ext4: aovid use-after-free in ext4_ext_insert_extent()
    8c26d9e53e5f ext4: drop ppath from ext4_ext_replay_update_ex() to avoid double-free
    4286a0418369 ext4: fix incorrect tid assumption in __jbd2_log_wait_for_space()
    7bcdef04d071 ext4: propagate errors from ext4_find_extent() in ext4_insert_range()
    e52f933598b7 ext4: fix slab-use-after-free in ext4_split_extent_at()
    133ff0d78f1b ext4: no need to continue when the number of entries is 1
    2c08dfc99fc4 ALSA: hda/realtek: Add quirk for Huawei MateBook 13 KLV-WX9
    c36ff6948c00 ALSA: line6: add hw monitor volume control to POD HD500X
    64d315aeec57 ALSA: core: add isascii() check to card ID generator
    b078a7eee12c drm: Consistently use struct drm_mode_rect for FB_DAMAGE_CLIPS
    afa999052393 parisc: Fix itlb miss handler for 64-bit programs
    d6b22a2d5563 perf/core: Fix small negative period being ignored
    8ab638bb498a spi: bcm63xx: Fix module autoloading
    f53c2b55d0e2 firmware: tegra: bpmp: Drop unused mbox_client_to_bpmp()
    2c1effc2255c i2c: xiic: Wait for TX empty to avoid missed TX NAKs
    46c72b01397f i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()
    9b8bc33ad641 i2c: stm32f7: Do not prepare/unprepare clock during runtime suspend/resume
    10dde0c1fb1b selftests/mm: fix charge_reserved_hugetlb.sh test
    e45803c71fc4 selftests: vDSO: fix vDSO symbols lookup for powerpc64
    76242231557f selftests: breakpoints: use remaining time to check if suspend succeed
    eda94fc74b84 spi: s3c64xx: fix timeout counters in flush_fifo
    e3b57186f457 spi: spi-imx: Fix pm_runtime_set_suspended() with runtime pm enabled
    53b1999cfd2c ext4: fix i_data_sem unlock order in ext4_ind_migrate()
    b0cb4561fc42 ext4: avoid use-after-free in ext4_ext_show_leaf()
    a34416ec269e ext4: ext4_search_dir should return a proper error
    e82df17e5f32 of/irq: Refer to actual buffer size in of_irq_parse_one()
    29f388945770 drm/amd/pm: ensure the fw_info is not null before using it
    0a377fcacefd drm/radeon/r100: Handle unknown family in r100_cp_init_microcode()
    aec72bfbc198 scsi: aacraid: Rearrange order of struct aac_srb_unit
    cf387300b819 drm/printer: Allow NULL data in devcoredump printer
    f921335123f6 drm/amd/display: Initialize get_bytes_per_element's default to 1
    7ab69af56a23 drm/amd/display: Fix index out of bounds in DCN30 color transformation
    c130a3c09e37 drm/amd/display: Fix index out of bounds in degamma hardware format translation
    ad89f83343a5 drm/amd/display: Fix index out of bounds in DCN30 degamma hardware format translation
    0167d570f6a0 drm/amd/display: Check stream before comparing them
    e2743d0a03b2 platform/x86: touchscreen_dmi: add nanote-next quirk
    831e8a816e09 drm/amdgpu: enable gfxoff quirk on HP 705G4
    e407715e7a8d drm/amdgpu: add raven1 gfxoff quirk
    8b1dcf25c26d jfs: Fix uninit-value access of new_ea in ea_buffer
    2451e5917c56 jfs: check if leafidx greater than num leaves per dmap tree
    fd026b6b6758 jfs: Fix uaf in dbFreeBits
    f9db7bb112c4 jfs: UBSAN: shift-out-of-bounds in dbFindBits
    8d54001f8dcc drm/amd/display: Check null pointers before using dc->clk_mgr
    49ded709540b ata: sata_sil: Rename sil_blacklist to sil_quirks
    1ebfa6663807 drm/amd/display: Add null check for top_pipe_to_program in commit_planes_for_stream
    de9e7f687625 iommu/vt-d: Fix potential lockup if qi_submit_sync called with 0 count
    5652c448da39 iommu/vt-d: Always reserve a domain ID for identity setup
    9e493f002d52 power: reset: brcmstb: Do not go into infinite loop if reset fails
    d9245b9296fd iommu/arm-smmu-qcom: hide last LPASS SMMU context bank from linux
    ceff6f5e7173 rcuscale: Provide clear error when async specified without primitives
    e6897e299f57 fbdev: pxafb: Fix possible use after free in pxafb_task()
    79681036a336 x86/syscall: Avoid memcpy() for ia32 syscall_get_arguments()
    98111af33849 ALSA: hdsp: Break infinite MIDI input flush loop
    219587bca267 ALSA: asihpi: Fix potential OOB array access
    e2b200c50230 ALSA: usb-audio: Add logitech Audio profile quirk
    35733d1a6057 ALSA: usb-audio: Define macros for quirk table entries
    6ee6835f8288 signal: Replace BUG_ON()s
    aa4e9056dfbc nfp: Use IRQF_NO_AUTOEN flag in request_irq()
    1756918f51e9 wifi: mwifiex: Fix memcpy() field-spanning write warning in mwifiex_cmd_802_11_scan_ext()
    47be40b698b9 proc: add config & param to block forcing mem writes
    02c1725eb2ad ACPICA: iasl: handle empty connection_node
    95a91802e4ef tcp: avoid reusing FIN_WAIT2 when trying to find port in connect() process
    b7cbdd6b1bcd net: atlantic: Avoid warning about potential string truncation
    a479b653d5e4 ipv4: Mask upper DSCP bits and ECN bits in NETLINK_FIB_LOOKUP family
    669d337aa1f6 ipv4: Check !in_dev earlier for ioctl(SIOCSIFADDR).
    bf60b4f58796 net: mvpp2: Increase size of queue_name buffer
    e2b2558971e0 tipc: guard against string buffer overrun
    cbb67e245dac ACPICA: check null return of ACPI_ALLOCATE_ZEROED() in acpi_db_convert_to_package()
    a40e7a2b805e ACPI: EC: Do not release locks during operation region accesses
    7cd004102b7d wifi: rtw88: select WANT_DEV_COREDUMP
    0f26f2694403 wifi: ath11k: fix array out-of-bound access in SoC stats
    1f61d509257d blk_iocost: fix more out of bound shifts
    62b8a46ba8bb net: sched: consistently use rcu_replace_pointer() in taprio_change()
    74c63fd016bc ACPICA: Fix memory leak if acpi_ps_get_next_field() fails
    30cd2158f249 ACPICA: Fix memory leak if acpi_ps_get_next_namepath() fails
    4440bac6f0ca net: hisilicon: hns_mdio: fix OF node leak in probe()
    124554285680 net: hisilicon: hns_dsaf_mac: fix OF node leak in hns_mac_get_info()
    ac6e862b8deb net: hisilicon: hip04: fix OF node leak in probe()
    a7f0073fcd12 net/xen-netback: prevent UAF in xenvif_flush_hash()
    ed418cad8386 ice: Adjust over allocation of memory in ice_sched_add_root_node() and ice_sched_add_node()
    b02eb7c86ff2 wifi: ath9k_htc: Use __skb_set_length() for resetting urb before resubmit
    2171e1d75001 wifi: ath9k: fix possible integer overflow in ath9k_get_et_stats()
    000bab8753ae f2fs: Require FMODE_WRITE for atomic write ioctls
    b820cb910f98 ALSA: hda/conexant: Fix conflicting quirk for System76 Pangolin
    f7785c449868 ALSA: hda/generic: Unconditionally prefer preferred_dacs pairs
    f10d29b108bd ALSA: hda/realtek: Fix the push button function for the ALC257
    7c93044298a4 ALSA: mixer_oss: Remove some incorrect kfree_const() usages
    f13b04cf65a8 Bluetooth: L2CAP: Fix not validating setsockopt user input
    4ec4641df57c media: usbtv: Remove useless locks in usbtv_video_free()
    a73d99643621 i2c: xiic: Try re-initialization on bus busy timeout
    c9668503e4e1 i2c: xiic: improve error message when transfer fails to start
    2d320d9de7d3 i2c: xiic: xiic_xfer(): Fix runtime PM leak on error path
    148fdc3c7df3 i2c: xiic: Fix RX IRQ busy check
    30def367fa20 i2c: xiic: Switch from waitqueue to completion
    6da4bbeb16cf i2c: xiic: Fix broken locking on tx_msg
    dd70c8a89ef9 sctp: set sk_state back to CLOSED if autobind fails in sctp_listen_start
    16b66c46b69b ipv4: ip_gre: Fix drops of small packets in ipgre_xmit
    566a931a1436 net: add more sanity checks to qdisc_pkt_len_init()
    ba26060a29d3 net: avoid potential underflow in qdisc_pkt_len_init() with UFO
    185df159843d net: ethernet: lantiq_etop: fix memory disclosure
    c8bb4e2d5fae Bluetooth: btmrvl: Use IRQF_NO_AUTOEN flag in request_irq()
    531754952f5d netfilter: nf_tables: prevent nf_skb_duplicated corruption
    7675fe977be5 net: ieee802154: mcr20a: Use IRQF_NO_AUTOEN flag in request_irq()
    181fbbdd46c0 netfilter: uapi: NFTA_FLOWTABLE_HOOK is NLA_NESTED
    cdd86fb75f1f net/mlx5: Added cond_resched() to crdump collection
    ca36d6c1a49b net/mlx5: Fix error path in multi-packet WQE transmit
    fd7fcd802edb ieee802154: Fix build error
    f55e003d261b ceph: remove the incorrect Fw reference check when dirtying pages
    32ee78823dea mailbox: bcm2835: Fix timeout during suspend mode
    3948c73c9295 mailbox: rockchip: fix a typo in module autoloading
    6b9a551b836e spi: lpspi: Simplify some error message
    767b71f29207 usb: yurex: Fix inconsistent locking bug in yurex_read()
    9f1c4edee8c8 i2c: isch: Add missed 'else'
    742a1b69c003 i2c: aspeed: Update the stop sw state when the bus recovery occurs
    52f7cab29039 mm: only enforce minimum stack gap size if it's sensible
    1472dd897fab lockdep: fix deadlock issue between lockdep and rcu
    118a0c3e55e3 xhci: Set quirky xHC PCI hosts to D3 _after_ stopping and freeing them.
    cc1de44135ca usb: renesas-xhci: Remove renesas_xhci_pci_exit()
    0f8e74a061cf pps: add an error check in parport_attach
    0e508348148a pps: remove usage of the deprecated ida_simple_xx() API
    47a632e5c6a1 USB: misc: yurex: fix race between read and write
    bf509ca62fea usb: yurex: Replace snprintf() with the safer scnprintf() variant
    6ea76e19d6df soc: versatile: realview: fix soc_dev leak during device remove
    6b3b25311d3e soc: versatile: realview: fix memory leak during device remove
    263d04df0644 PCI: xilinx-nwl: Fix off-by-one in INTx IRQ handler
    6dacc0b667a9 PCI: xilinx-nwl: Use irq_data_get_irq_chip_data()
    46c4079460f4 padata: use integer wrap around to prevent deadlock on seq_nr overflow
    7d0079d64442 nfs: fix memory leak in error path of nfs4_do_reclaim
    a239ff33c512 fs: Fix file_set_fowner LSM hook inconsistencies
    47a68c75052a vfs: fix race between evice_inodes() and find_inode()&iput()
    0eecd2ee23af arm64: dts: rockchip: Correct the Pinebook Pro battery design capacity
    b2cb101b9b72 arm64: dts: rockchip: Raise Pinebook Pro's panel backlight PWM frequency
    d41d66534637 hwrng: cctrng - Add missing clk_disable_unprepare in cctrng_resume
    1b2137f6c9bd hwrng: mtk - Use devm_pm_runtime_enable
    cef1056ee6fc f2fs: avoid potential int overflow in sanity_check_area_boundary()
    85c2f7bd573d f2fs: prevent possible int overflow in dir_block_index()
    5e3a031dfa5a debugobjects: Fix conditions in fill_pool()
    dbffe7be554c wifi: rtw88: 8822c: Fix reported RX band width
    44f18167492b perf/x86/intel/pt: Fix sampling synchronization
    f76b69ab9cf0 efistub/tpm: Use ACPI reclaim memory for event log to avoid corruption
    45a765f4ba4c ACPI: resource: Add another DMI match for the TongFang GMxXGxx
    4b081991c436 ACPI: sysfs: validate return type of _STR method
    2e20b69b86c8 drbd: Add NULL check for net_conf to prevent dereference in state validation
    62720f2daab9 drbd: Fix atomicity violation in drbd_uuid_set_bm()
    a295fa38dcbb crypto: ccp - Properly unregister /dev/sev on sev PLATFORM_STATUS failure
    c7148bf45da1 tty: rp2: Fix reset with non forgiving PCIe host bridges
    c30558e6c5c9 firmware_loader: Block path traversal
    e89f925093a3 bus: integrator-lm: fix OF node leak in probe()
    61c12c72b1ab USB: class: CDC-ACM: fix race between get_serial and set_serial
    fa83e1df43f1 USB: misc: cypress_cy7c63: check for short transfer
    1c5cd41b4b50 USB: appledisplay: close race between probe and completion handler
    84f4d44703d9 drm/amd/display: Round calculated vtotal
    60aadf84bef0 Input: i8042 - add another board name for TUXEDO Stellaris Gen5 AMD line
    13175be789b5 Input: i8042 - add TUXEDO Stellaris 15 Slim Gen6 AMD to i8042 quirk table
    bf3f1affba62 Input: i8042 - add TUXEDO Stellaris 16 Gen5 AMD to i8042 quirk table
    cb9897b94608 soc: versatile: integrator: fix OF node leak in probe() error path
    c55ebcb21656 ASoC: rt5682: Return devm_of_clk_add_hw_provider to transfer the error
    aaaf3cd0a734 Remove *.orig pattern from .gitignore
    f291dc4cbc65 mptcp: fix sometimes-uninitialized warning
    2dbc4b7bac60 selinux,smack: don't bypass permissions check in inode_setsecctx hook
    4b81a9f92b36 bpf: Fix DEVMAP_HASH overflow check on 32-bit arches
    0e6378dd9bbc Revert "bpf: Eliminate rlimit-based memory accounting for devmap maps"
    bfe249c15122 Revert "bpf: Fix DEVMAP_HASH overflow check on 32-bit arches"
    892620144757 x86/mm: Switch to new Intel CPU model defines
    089aece01a10 powercap: RAPL: fix invalid initialization for pl4_supported field
    ba624f656a8b Input: goodix - use the new soc_intel_is_byt() helper
    50460579fe87 drm/amd/display: Fix Synaptics Cascaded Panamera DSC Determination
    e0dbda9f26e2 netfilter: ctnetlink: compile ctnetlink_label_size with CONFIG_NF_CONNTRACK_EVENTS
    db9c5f08eea3 netfilter: nf_tables: Keep deleted flowtable hooks until after RCU
    6c36857fe564 net: qrtr: Update packets cloning when broadcasting
    ec31cf42fc4e tcp: check skb is non-NULL in tcp_rto_delta_us()
    98d14164c0a7 net: ipv6: select DST_CACHE from IPV6_RPL_LWTUNNEL
    338a0582b28e net: seeq: Fix use after free vulnerability in ether3 Driver Due to Race Condition
    dcf48ab3ca2c netfilter: nf_reject_ipv6: fix nf_reject_ip6_tcphdr_put()
    1429a9260fed Revert "dm: requeue IO if mapping table not yet available"
    0c170b1e918b vhost_vdpa: assign irq bypass producer token correctly
    10348fb6feae vdpa: Add eventfd for the vdpa callback
    64add9aaf78a interconnect: qcom: sm8250: Enable sync_state
    d4951dd16e9f coresight: tmc: sg: Do not leak sg_table
    cf0674248ddb iio: adc: ad7606: fix standby gpio state to match the documentation
    1ea56cd9a651 iio: adc: ad7606: fix oversampling gpio array
    b7413dbc6341 spi: spi-fsl-lpspi: Undo runtime PM changes at driver exit time
    0ed35dd547ec spi: lpspi: release requested DMA channels
    d612d419a579 spi: lpspi: Silence error message upon deferred probe
    6f2eeba7c3e4 f2fs: reduce expensive checkpoint trigger frequency
    3dc483f0e6d0 f2fs: remove unneeded check condition in __f2fs_setxattr()
    87aceb1ce66a f2fs: fix to update i_ctime in __f2fs_setxattr()
    db930da94792 f2fs: fix typo
    7b5476f06154 f2fs: enhance to update i_mode and acl atomically in f2fs_setattr()
    0f1d007bbea3 nfsd: return -EINVAL when namelen is 0
    9f03f0016ff7 nfsd: call cache_put if xdr_reserve_space returns NULL
    40d578735499 ntb_perf: Fix printk format
    ef7e34237e26 ntb: intel: Fix the NULL vs IS_ERR() bug for debugfs_create_dir()
    dd598ac57dca RDMA/cxgb4: Added NULL check for lookup_atid
    502dac909ee9 riscv: Fix fp alignment bug in perf_callchain_user()
    322911a2e666 RDMA/hns: Optimize hem allocation performance
    07f0f643d7e5 RDMA/hns: Fix spin_unlock_irqrestore() called with IRQs enabled
    1e6195dc7aca RDMA/hns: Fix the overflow risk of hem_list_calc_ba_range()
    6258c4fb8d33 RDMA/hns: Refactor root BT allocation for MTR
    d06fbe0b8703 RDMA/hns: Add mapped page count checking for MTR
    2a2894e90cec watchdog: imx_sc_wdt: Don't disable WDT in suspend
    5353f8ec59f7 pinctrl: mvebu: Fix devinit_dove_pinctrl_probe function
    d8c75b8a91fd pinctrl: mvebu: Use devm_platform_get_and_ioremap_resource()
    600735914369 nfsd: fix refcount leak when file is unhashed after being found
    6fcb4bbbecb4 nfsd: remove unneeded EEXIST error check in nfsd_do_file_acquire
    0ce9d89343c2 clk: ti: dra7-atl: Fix leak of of_nodes
    88ba7cd9f482 pinctrl: single: fix missing error code in pcs_probe()
    2efe8da2ddbf RDMA/iwcm: Fix WARNING:at_kernel/workqueue.c:#check_flush_dependency
    f29951897a30 PCI: xilinx-nwl: Fix register misspelling
    c289903b7a21 PCI: keystone: Fix if-statement expression in ks_pcie_quirk()
    badbd736e664 drivers: media: dvb-frontends/rtl2830: fix an out-of-bounds write error
    6ae3b9aee426 drivers: media: dvb-frontends/rtl2832: fix an out-of-bounds write error
    45f826f6c827 clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228
    ca34aa37820a clk: imx: imx8mp: fix clock tree update of TF-A managed clocks
    11396ba4f820 perf time-utils: Fix 32-bit nsec parsing
    a10a7d6d171b perf sched timehist: Fixed timestamp error when unable to confirm event sched_in time
    727660723ea7 perf sched timehist: Fix missing free of session in perf_sched__timehist()
    ea837ae511aa bpf: Fix bpf_strtol and bpf_strtoul helpers for 32bit
    d20674f31626 nilfs2: fix potential oob read in nilfs_btree_check_delete()
    e2290906bb24 nilfs2: determine empty node blocks as corrupted
    24bf40740a3d nilfs2: fix potential null-ptr-deref in nilfs_btree_insert()
    7fc22c3b3ffc ext4: avoid OOB when system.data xattr changes underneath the filesystem
    e65f698736b0 ext4: return error on ext4_find_inline_entry
    2e073a579f71 ext4: avoid negative min_clusters in find_group_orlov()
    22d591d916b4 ext4: avoid potential buffer_head leak in __ext4_new_inode()
    08c63b79624c ext4: avoid buffer_head leak in ext4_mark_inode_used()
    c4227a38ab88 smackfs: Use rcu_assign_pointer() to ensure safe assignment in smk_set_cipso
    4766ba108b83 ext4: clear EXT4_GROUP_INFO_WAS_TRIMMED_BIT even mount with discard
    3a1a31a38fcc kthread: fix task state in kthread worker if being frozen
    28fbbd0ce7ab kthread: add kthread_work tracepoints
    dd417529c063 xz: cleanup CRC32 edits from 2018
    4e1c8c12cac1 selftests/bpf: Fix C++ compile error from missing _Bool type
    9374068b3690 selftests/bpf: Fix error compiling test_lru_map.c
    c2db6acd8cc3 selftests/bpf: Fix errors compiling cg_storage_multi.h with musl libc
    3467a9412610 selftests/bpf: Fix compiling tcp_rtt.c with musl-libc
    5ad69f5a0458 selftests/bpf: Fix compiling flow_dissector.c with musl-libc
    306efef84bbf selftests/bpf: Fix compiling kfree_skb.c with musl-libc
    cc52d5282a14 selftests/bpf: Fix missing ARRAY_SIZE() definition in bench.c
    04eb60af431d selftests/bpf: Fix compile error from rlim_t in sk_storage_map.c
    2c9b228938e9 tpm: Clean up TPM space after command failure
    a0a8b7bebe1b xen/swiotlb: add alignment check for dma buffers
    cb9134aa0998 xen: use correct end address of kernel for conflict checking
    86da3c79b889 drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind()
    02657ced604d drm/msm: fix %s null argument error
    72fa5f700e76 ipmi: docs: don't advertise deprecated sysfs entries
    e9e482e1e5da drm/msm/a5xx: workaround early ring-buffer emptiness check
    d041301f304c drm/msm: Drop priv->lastctx
    9dffbbd7b84f drm/msm: Add priv->mm_lock to protect active/inactive lists
    5ce4075ddea0 drm/msm/a5xx: fix races in preemption evaluation stage
    cfca8b26a9f5 drm/msm/a5xx: properly clear preemption records on resume
    fe93cd663518 drm/msm/a5xx: disable preemption in submits by default
    14531e3b82ce drm/msm: Fix incorrect file name output in adreno_request_fw()
    0338e66cba27 jfs: fix out-of-bounds in dbNextAG() and diAlloc()
    36820265a009 drm/radeon/evergreen_cs: fix int overflow errors in cs track offsets
    6b38aedfdcd9 drm/rockchip: dw_hdmi: Fix reading EDID when using a forced mode
    5f37e8c41526 drm/rockchip: vop: Allow 4096px width scaling
    e37fead06a45 drm/radeon: properly handle vbios fake edid sizing
    af2fb608e95f drm/radeon: Replace one-element array with flexible-array member
    5f943045ecd0 drm/amdgpu: properly handle vbios fake edid sizing
    cd8810561601 drm/amdgpu: Replace one-element array with flexible-array member
    65f9be03482a drm/stm: Fix an error handling path in stm_drm_platform_probe()
    278ec2595281 mtd: powernv: Add check devm_kasprintf() returned value
    7661e90a60fb fbdev: hpfb: Fix an error handling path in hpfb_dio_probe()
    9fb482fdf3a9 power: supply: max17042_battery: Fix SOC threshold calc w/ no current sense
    5c1997f7ad4e power: supply: axp20x_battery: Remove design from min and max voltage
    c59f57f3f1bd power: supply: axp20x_battery: allow disabling battery charging
    8202306e9fc1 hwmon: (ntc_thermistor) fix module autoloading
    9efa58381ae1 mtd: slram: insert break after errors in parsing the map
    d7a7dd2966d5 hwmon: (max16065) Fix alarm attributes
    932559f25a7c hwmon: (max16065) Remove use of i2c_match_id()
    514a1508c3fe i2c: Add i2c_get_match_data()
    167e4371ef92 device property: Add const qualifier to device_get_match_data() parameter
    aeed49dd2b89 hwmon: (max16065) Fix overflows seen when writing limits
    cdb20b703e0e m68k: Fix kernel_clone_args.flags in m68k_clone()
    42a9899e56de clocksource/drivers/qcom: Add missing iounmap() on errors in msm_dt_timer_init()
    97586fbd6998 reset: berlin: fix OF node leak in probe() error path
    ad0b53e4b5d0 ARM: versatile: fix OF node leak in CPUs prepare
    06ceed8eff02 ARM: dts: imx7d-zii-rmu2: fix Ethernet PHY pinctrl property
    fb3cd974fb82 ARM: dts: microchip: sam9x60: Fix rtc/rtt clocks
    5f19060ab0ac spi: ppc4xx: Avoid returning 0 when failed to parse and map IRQ
    63c7417ad463 spi: ppc4xx: handle irq_of_parse_and_map() errors
    4bc4272e2506 block: fix potential invalid pointer dereference in blk_add_partition
    4d2760df0f3d block: print symbolic error name instead of error code
    3630a18846c7 block, bfq: don't break merge chain in bfq_split_bfqq()
    a819a496d2f2 block, bfq: choose the last bfqq from merge chain in bfq_setup_cooperator()
    e1277ae780cc block, bfq: fix possible UAF for bfqq->bic with merge chain
    cab9ff7fe83f net: tipc: avoid possible garbage value
    207503742caf net: ipv6: rpl_iptunnel: Fix memory leak in rpl_input
    3df68f37c567 r8169: disable ALDPS per default for RTL8125
    5755eabda22c net: enetc: Use IRQF_NO_AUTOEN flag in request_irq()
    e296245ca85a bareudp: Pull inner IP header on xmit.
    b48fae6788b3 geneve: Fix incorrect inner network header offset when innerprotoinherit is set
    3b84799ea26e net: geneve: support IPv4/IPv6 as inner protocol
    76851c70a5cf bareudp: Pull inner IP header in bareudp_udp_encap_recv().
    cb1f7ef1f415 bareudp: allow redirecting bareudp packets to eth devices
    2accdb38c1c1 Bluetooth: btusb: Fix not handling ZPL/short-transfer
    3703e18a910f can: m_can: m_can_close(): stop clocks after device has been shut down
    b6dce5b5a823 can: m_can: Add support for transceiver as phy
    5cc00913c1fd can: bcm: Clear bo->bcm_proc_read after remove_proc_entry().
    1a11a1a53255 sock_map: Add a cond_resched() in sock_hash_free()
    557418e17046 wifi: wilc1000: fix potential RCU dereference issue in wilc_parse_join_bss_param
    f232916fab67 wifi: mac80211: use two-phase skb reclamation in ieee80211_do_stop()
    793e01f99666 wifi: cfg80211: fix two more possible UBSAN-detected off-by-one errors
    f8e0ca304996 wifi: mt76: mt7915: fix rx filter setting for bfee functionality
    635ccdcd9840 wifi: cfg80211: fix UBSAN noise in cfg80211_wext_siwscan()
    7b0724f7a927 cpufreq: ti-cpufreq: Introduce quirks to handle syscon fails appropriately
    0723ddb2d161 netfilter: nf_tables: reject expiration higher than timeout
    39c1012f5f78 netfilter: nf_tables: reject element expiration with no timeout
    1c0c097ded94 netfilter: nf_tables: elements with timeout below CONFIG_HZ never expire
    4bb459040d3d can: j1939: use correct function name in comment
    b0947eca2a5f padata: Honor the caller's alignment in case of chunk_size 0
    60da25076f38 mount: handle OOM on mnt_warn_timestamp_expiry
    f0a39ba6e05e fs/namespace: fnic: Switch to use %ptTd
    396e9c5cbf8f mount: warn only once about timestamp range expiration
    9722aa53fa23 fs: explicitly unregister per-superblock BDIs
    005dcd6bc4b4 ACPI: PMIC: Remove unneeded check in tps68470_pmic_opregion_probe()
    a0c1e2da652c wifi: rtw88: always wait for both firmware loading attempts
    16e0ab9ed3ae USB: usbtmc: prevent kernel-usb-infoleak
    50cff34deed4 USB: serial: pl2303: add device id for Macrosilicon MS3020
    31292316c5fe usb: dwc3: Fix a typo in field name
    4abf1841680f cgroup: Move rcu_head up near the top of cgroup_root
    65fd90e354c7 gpiolib: cdev: Ignore reconfiguration without direction
    1880a324af1c ftrace: Fix possible use-after-free issue in ftrace_location()
    e6be2e1ebc77 x86/ibt,ftrace: Search for __fentry__ location
    9705f447bf9a inet: inet_defrag: prevent sk release while still in use
    0e7814b028cd mptcp: pm: Fix uaf in __timer_delete_sync
    6a53e5def7a8 mptcp: validate 'id' when stopping the ADD_ADDR retransmit timer
    a684b45a7770 mptcp: export lookup_anno_list_by_saddr
    9d682e89c44b gpio: prevent potential speculation leaks in gpio_device_get_desc()
    5badd0ae8b7d netfilter: nf_tables: missing iterator type in lookup walk
    ff89db14c63a netfilter: nft_set_pipapo: walk over current view on netlink dump
    45a81667e0e8 cgroup: Make operations on the cgroup root_list RCU safe
    57a3d89831fc ocfs2: strict bound check before memcmp in ocfs2_xattr_find_entry()
    34759b7e4493 ocfs2: add bounds checking to ocfs2_xattr_find_entry()
    d5624db2326c x86/hyperv: Set X86_FEATURE_TSC_KNOWN_FREQ when Hyper-V provides frequency
    bbd11db41be6 spi: bcm63xx: Enable module autoloading
    040511d9f282 drm: komeda: Fix an issue related to normalized zpos
    3d39061b7b92 ASoC: tda7419: fix module autoloading
    9c6d4649f2dc ASoC: intel: fix module autoloading
    de46b1d24f5f wifi: iwlwifi: mvm: don't wait for tx queues if firmware is dead
    db81677f4b6c wifi: iwlwifi: lower message level for FW buffer destination
    dd34ef88d58c net: ftgmac100: Ensure tx descriptor updates are visible
    1a8e85289e29 microblaze: don't treat zero reserved memory regions as error
    2e5052143c28 pinctrl: at91: make it work with current gpiolib
    9f08d024eda5 ALSA: hda/realtek - FIxed ALC285 headphone no sound
    fff183aa3c83 ALSA: hda/realtek - Fixed ALC256 headphone no sound
    0f4da063a1c6 ASoC: allow module autoloading for table db1200_pids
    007180fcb6cc dma-buf: heaps: Fix off-by-one in CMA heap fault handler
    5a2cc2bb8139 ASoC: meson: axg-card: fix 'use-after-free'
    ae96b02b9deb soundwire: stream: Revert "soundwire: stream: fix programming slave ports for non-continous port maps"
    609260542cf8 spi: nxp-fspi: fix the KASAN report out-of-bounds bug
    1f31f51bfc82 net: dpaa: Pad packets to ETH_ZLEN
    f2b13ec20854 net: ftgmac100: Enable TX interrupt to avoid TX timeout
    392f6a97fcbe fou: fix initialization of grc
    b9063702a048 net/mlx5e: Add missing link modes to ptys2ethtool_map
    097cc80396b7 net/mlx5: Update the list of the PCI supported devices
    e7a9cca35ead ice: fix accounting for filters shared by multiple VSIs
    a38c552abfa9 hwmon: (pmbus) Conditionally clear individual status bits for pmbus rev >= 1.2
    b9d15b50b279 hwmon: (pmbus) Introduce and use write_byte_data callback
    e829dbaf7669 minmax: reduce min/max macro expansion in atomisp driver
    78078862f0a8 arm64: dts: rockchip: override BIOS_DISABLE signal via GPIO hog on RK3399 Puma
    14341f28a3a9 NFS: Avoid unnecessary rescanning of the per-server delegation list
    4f0e491644b7 Input: i8042 - add Fujitsu Lifebook E756 to i8042 quirk table
    00d54431b0ed drm/msm/adreno: Fix error return if missing firmware-name
    44eb665889e3 scripts: kconfig: merge_config: config files: add a trailing newline
    9deecde63714 Input: synaptics - enable SMBus for HP Elitebook 840 G2
    3f7183e28fa3 Input: ads7846 - ratelimit the spi_sync error message
    f08589057f32 btrfs: update target inode's ctime on unlink
    43662ba6ca86 powerpc/mm: Fix boot warning with hugepages and CONFIG_DEBUG_VIRTUAL
    acb4baa4846d net: phy: vitesse: repair vsc73xx autonegotiation
    3b9ca0230077 net: ethernet: use ip_hdrlen() instead of bit shift
    b06bb81ef940 usbnet: ipheth: fix carrier detection in modes 1 and 4
    8a30bee7f534 usb: dwc3: core: update LC timer as per USB Spec V3.2
    1ac066765826 usb: dwc3: core: Enable GUCTL1 bit 10 for fixing termination error after resume bug
    6b3af2ad53cf usb: dwc3: Decouple USB 2.0 L1 & L2 events
    03a85a51f33a fix vfsub build error
    12594a0e7118 sock_map: avoid race between sock_map_close and sk_psock_put
    7a346798c1e1 sock_map: Fix a potential use-after-free in sock_map_close()
    843556a46e16 bpf, sockmap: Don't let sock_map_{close,destroy,unhash} call itself
    4af417c06d37 of: module: add buffer overflow check in of_modalias()
    b29e4b50c556 scripts/gdb: fix SB_* constants parsing
    02fd398f5e2b bpf: Reject variable offset alu on PTR_TO_FLOW_KEYS
    2bba1cb1487b loop: Select I/O scheduler 'none' from inside add_disk()
    027f4dd7c993 blk-mq: Introduce the BLK_MQ_F_NO_SCHED_BY_DEFAULT flag
    2214ded26c86 tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    44494049e815 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    0d7c23009d82 tpm: Add flag to use default cancellation policy
    07914bef4e16 tpm: tis_i2c: Fix sanity check interrupt enable mask
    35f85f04bd69 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    7b04c6c08107 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    4790cb2d1283 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    50f74deaf308 hwmon: Add driver for Texas Instruments TMP464 and TMP468
    a4e6e4b7bb08 dt-bindings: hwmon: add tmp464.yaml
    e0ed2149d7b5 drm/amdkfd: Check for null pointer after calling kmemdup
    c6ddded89322 ARM: renumber bits related to _TIF_WORK_MASK
    35b96a325c1e arm64: make _TIF_WORK_MASK bits contiguous
    f5a8f06aa595 arm64: uaccess: remove vestigal UAO support
    3a330b569301 arm64: uaccess: remove redundant PAN toggling
    9cbbb016d6e7 arm64: uaccess: remove addr_limit_user_check()
    fd83411f5e08 arm64: uaccess: remove set_fs()
    15a6dc2f4b53 arm64: uaccess cleanup macro naming
    912a6ab683a4 arm64: uaccess: split user/kernel routines
    d004ab02dae2 arm64: uaccess: refactor __{get,put}_user
    e1941a8b459e arm64: uaccess: simplify __copy_user_flushcache()
    dfae822b4c59 arm64: uaccess: rename privileged uaccess routines
    1efdb8f0a0c7 arm64: sdei: explicitly simulate PAN/UAO entry
    b35fec69554c arm64: sdei: move uaccess logic to arch/arm64/
    b5a28033fe7b arm64: head.S: always initialize PSTATE
    243eb8553513 arm64: head.S: cleanup SCTLR_ELx initialization
    74a00405d97f arm64: head.S: rename el2_setup -> init_kernel_el
    73c5f386d175 arm64: add C wrappers for SET_PSTATE_*()
    e17fb7543df1 arm64: ensure ERET from kthread is illegal
    eff6289cc53b ixgbevf: add disable link state
    262595681381 ixgbe: add improvement for MDD response functionality
    b9d78b06dea8 ixgbe: add the ability for the PF to disable VF link state
    d829911485da Documentation: arm64: Document PMU counters access from userspace
    fe5d29bfce20 arm64: perf: Enable PMU counter userspace access for perf event
    15ce6d04ed6a arm64: perf: Add userspace counter access disable switch
    4f288acbeed8 perf: Add a counter for number of user access events in context
    354ba4a8c4b8 x86: perf: Move RDPMC event flag to a common definition
    d29cec94c49b libperf xyarray: Add bounds checks to xyarray__entry()
    8264d2b91841 libperf: Add support for user space counter access
    7fd81b678b5f libperf tests: Add support for verbose printing
    6029ff53a48f libperf: Add evsel mmap support
    28b0c8956369 tools include: Add an initial math64.h
    492e532d20f1 perf record: Improve 'Workload failed' message printing events + what was exec'ed
    d0a1fc61733e perf evlist: Add a method to return the list of evsels as a string
    81a77b39be0a perf annotate: Fix sample events lost in stdio mode
    2883e69e202d pnmtologo: use relocatable file name
    80f5207b5abd tools: use basename to identify file in gen-mach-types
    4d201ec392f1 vt/conmakehash: improve reproducibility
    ae24d013888f lib/build_OID_registry: fix reproducibility issues
    5d72da88dbb4 x86/boot: Wrap literal addresses in absolute_pointer()
    dc0bd7aa2319 ACPI: thermal: drop an always true check
    0c4288cceef5 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    5509050b3392 xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    669827c6e293 virtio-pci: Remove wrong address verification in vp_del_vqs()
    1c80d994d3db regulator: consumer: Add missing stubs to regulator/consumer.h
    3303d0e2aeff ipv6: Fix stats accounting in ip6_pkt_drop
    c56e60f665e7 memcg: enable accounting of ipc resources
    e6c8ebd210a2 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    1655ee30e684 sched/isolation: really align nohz_full with rcu_nocbs
    253c752ed120 pstore/ftrace: Add and use ftrace_test_recursion_trylock_safe
    356e8a12bd66 pstore/ftrace: Add recursion protection to the ftrace callback
    334706a1e873 ftrace: Add ftrace_test_recursion_trylock() helper function
    78c260d7f60b ftrace: Move the recursion testing into global headers
    c0b313d988a1 powerpc/mm: Switch obsolete dssall to .long
    1bd813fe8d0e riscv: fix build with binutils 2.38
    835a2d1b24c6 powerpc/lib/sstep: fix 'ptesync' build error
    fd84b99a8ccb drm/amd/display: Don't allow partial copy_from_user
    024f4ff63d55 drm/amdgpu: Fix even more out of bound writes from debugfs
    0c0ad634e899 e1000e: Serialize TGP e1000e PM ops
    add88b0536fa e1000e: Make mei_me active when e1000e is in use
    a8f317c1a17e yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    c8400a2cbe1f iommu/arm-smmu-v3: Ratelimit event dump
    b8ec7e43e95e regmap: teach regmap to use raw spinlocks if requested in the config
    4b7fa7684be7 OF: DT-Overlay configfs interface (v7)
    d515a5c0e9a9 net: xilinx_emaclite: Do not print real IOMEM pointer
    11329e49959b drivers: net: xilinx_emaclite: remove arch limitation
    29dc69bf2a07 drivers: net: xilinx_emaclite: Add COMPILE_TEST support
    ff106eff01f6 drivers: net: xilinx_emaclite: Fix -Wpointer-to-int-cast warnings with W=1
    c27462391070 serial: 8250: 8250_omap: Fix possible array out of bounds access
    16976d8e307f perf intel-pt: Use aux_watermark
    d421a2346946 perf: Cap allocation order at aux_watermark
    6da8d5f29481 timers: Fix get_next_timer_interrupt() with no timers pending
    af141841735a eventfd: Enlarge recursion limit to allow vhost to work
    a125a6102808 iwlwifi: select MAC80211_LEDS conditionally
    139fe7d68413 rcu: Fix stall-warning deadlock due to non-release of rcu_node ->lock
    8d0c79931235 console: Fix build when CONFIG_BLK_DEV_INITRD is disabled.
    ea777841e8ea yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    ab49d2db98bd cgroup1: fix leaked context root causing sporadic NULL deref in LTP
    bdda1b6cf99b aufs5: aufs-core
    2fa276071d07 aufs5: aufs-standalone
    06ed4d532456 aufs5: aufs-mmap
    372857834999 aufs5: aufs-kbuild
    fd68c9840693 aufs5: aufs-base
    a673c127156c Revert "aufs5: core"
    cf62bfcde384 Revert "aufs5: aufs5-base"
    a644419ec785 Revert "aufs5: aufs5-mmap"
    b893f9a999bb Revert "aufs5: aufs5-standalone"
    c60db0819480 Revert "aufs: initial port to v5.10"
    c66a5900f139 Revert "Revert "aufs: initial port to v5.10""
    1320cf58f5dd Revert "aufs: linux-v5.10-rc1, no more set_fs()"
    02349d7738ff Revert "for aufs: linux-v5.10-rc1, no more vfs_(read|write)f_t"
    f01dab74750c Revert "aufs: linux-v5.10-rc1, no more f_op->read() and ->write()"
    3d5de709b676 Revert "aufs5: aufs5-kbuild"
    a97f1329edf7 tracing/arm: Have max stack tracer handle the case of return address after data
    5c54112a05ab net: Treat __napi_schedule_irqoff() as __napi_schedule() on PREEMPT_RT
    ddac76981cb3 sched/isolation: reconcile rcu_nocbs= and nohz_full=
    56fd8c36614e net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    a8808e541750 aufs: linux-v5.10-rc1, no more f_op->read() and ->write()
    cb1c41dac775 for aufs: linux-v5.10-rc1, no more vfs_(read|write)f_t
    a5805df6583f aufs: linux-v5.10-rc1, no more set_fs()
    64e145dcca8c Revert "aufs: initial port to v5.10"
    d6e20b2257ec defconfig: add dependency for CONFIG_ACPI_APEI_PCIEAER
    b237d48208d0 arm64/mm: Drop THP conditionality from FORCE_MAX_ZONEORDER
    1209195ed0f7 driver: adc: ltc2497: return directly after reading the adc conversion value
    a60fe3fcf113 Revert "mfd: syscon: Don't free allocated name for regmap_config"
    13d68767aa4a rcutorture: Use "all" and "N" in "nohz_full" and "rcu_nocbs"
    54e69571a97d rcu: deprecate "all" option to rcu_nocbs=
    a605b9d20447 lib: test_bitmap: add tests for "N" alias
    8c22517f444e lib: bitmap: support "N" as an alias for size of bitmap
    88187167e63a lib: bitmap: move ERANGE check from set_region to check_region
    ca5429633613 lib: bitmap: fold nbits into region struct
    9381134cea8a lib: test_bitmap: add more start-end:offset/len tests
    c825800730ab lib: test_bitmap: add tests to trigger ERANGE case.
    8cc8264dca3f lib: test_bitmap: clearly separate ERANGE from EINVAL tests.
    470da7b7f2ff Revert "cpumask: Un-inline cpulist_parse for SMP; prepare for ascii helpers"
    28dc1d37602d Revert "cpumask: Make "all" alias global and not just RCU"
    dbfe0b183fca Revert "cpumask: Add a "none" alias to complement "all""
    a57711fcff30 Revert "cpumask: Add "last" alias for cpu list specifications"
    34523d7c8476 qemux86: add configuration symbol to select values
    cdca78778415 objtool: Fix seg fault with Clang non-section symbols
    d3287798bd88 x86/entry: Emit a symbol for register restoring thunk
    2ad99ddaac78 cpumask: Add "last" alias for cpu list specifications
    c10e9481810b cpumask: Add a "none" alias to complement "all"
    b00ceed9d388 cpumask: Make "all" alias global and not just RCU
    8b215206e797 cpumask: Un-inline cpulist_parse for SMP; prepare for ascii helpers
    1b5024caeda8 clear_warn_once: add a clear_warn_once= boot parameter
    fc0dd76cce0e clear_warn_once: bind a timer to written reset value
    d64fc2d2b14a clear_warn_once: expand debugfs to include read support
    77592e956cc9 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    6e022759f727 perf: x86-32: explicitly include <errno.h>
    22d6bbb947d4 perf: mips64: Convert __u64 to unsigned long long
    c35f9150001c perf: fix bench numa compilation
    c4caef513eb1 perf: add SLANG_INC for slang.h
    07dfbf9405dd perf: add sgidefs.h to for mips builds
    42c5431ad2cf perf: change --root to --prefix for python install
    af79bfe90143 perf: add 'libperl not found' warning
    ddfbd9e75f08 perf: force include of <stdbool.h>
    0f34e6305176 fat: don't use obsolete random32 call in namei_vfat
    b5b55eaad1df FAT: Added FAT_NO_83NAME
    756b13bfab6e FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    fabad71cb2b5 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    06fd68d75bd1 aufs: initial port to v5.10
    c9126877d1f5 aufs5: core
    f5150173c643 aufs5: aufs5-standalone
    b57d26b072d9 aufs5: aufs5-mmap
    78f128c4b8e5 aufs5: aufs5-base
    47aa35171d08 aufs5: aufs5-kbuild
    35c480a23c66 yaffs: include blkdev.h
    2c64c43540a5 yaffs: fix misplaced variable declaration
    bde410ee9f59 yaffs2: v5.6 build fixups
    414c8e866931 yaffs2: fix memory leak when /proc/yaffs is read
    c99c1990cf7c yaffs: add strict check when call yaffs_internal_read_super
    498f5fafe50a yaffs: repair yaffs_get_mtd_device
    7ca3c08ebbf9 yaffs: Fix build failure by handling inode i_version with proper atomic API
    0ba47e881bb8 yaffs2: fix memory leak in mount/umount
    39a5406665dd yaffs: Avoid setting any ACL releated xattr
    ca5b43ddc6fd Yaffs:check oob size before auto selecting Yaffs1
    c2619c05a53e fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    5e08fb7b8ee0 yaffs2: adjust to proper location of MS_RDONLY
    5f1a1a9678a8 yaffs2: import git revision b4ce1bb (jan, 2020)
    fc21f09ae369 initramfs: allow an optional wrapper script around initramfs generation
    73887fca03be arm64/perf: Fix wrong cast that may cause wrong truncation
    a267cafaac44 defconfigs: drop obselete options
    eb5d1bc00c3f arm64/perf: fix backtrace for AAPCS with FP enabled
    062b2c98c087 linux-yocto: Handle /bin/awk issues
    d3beb253ae71 uvesafb: provide option to specify timeout for task completion
    75ccbf377a51 uvesafb: print error message when task timeout occurs
    18ffa2e88024 compiler.h: Undef before redefining __attribute_const__
    3ed931201746 vmware: include jiffies.h
    938942859596 Resolve jiffies wrapping about arp
    069a883d837c nfs: Allow default io size to be configured.
    3b568edcd3e9 check console device file on fs when booting
    77ec93228920 mount_root: clarify error messages for when no rootfs found
    17a15e0f7536 menuconfig,mconf-cfg: Allow specification of ncurses location
    8f13b1349a74 modpost: mask trivial warnings
    b6c9e0fa24e8 kbuild: exclude meta directory from distclean processing
    62dbbdbec60a powerpc: serialize image targets
    27b8dec5dbb3 arm: serialize build targets
    fc365512e4c4 Revert "platform/x86: wmi: Destroy on cleanup rather than unregister"
    9a6e91d2e691 crtsavres: fixups for 5.4+
    7dbc3cd0398f powerpc/ptrace: Disable array-bounds warning with gcc8
    ebe3bcb89cb0 powerpc: Disable attribute-alias warnings from gcc8
    65ba0e7de081 powerpc: add crtsavres.o to archprepare for kbuild
    6bd3efdce5a9 powerpc: kexec fix for powerpc64
    41671522c159 powerpc: Add unwind information for SPE registers of E500 core
    8851006b0109 mips: vdso: fix 'jalr $t9' crash in vdso code
    ed5db62477e8 mips: Kconfig: add QEMUMIPS64 option
    2a7ca094fc42 4kc cache tlb hazard: tlbp cache coherency
    b742d60d3f70 malta uhci quirks: make allowance for slow 4k(e)c
    8a160fc86eb6 arm/Makefile: Fix systemtap
    b9805882353c vexpress: Pass LOADADDR to Makefile
    332e618aa7ae arm: ARM EABI socketcall
    1ec682cb85f8 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 8a60bebcba..629a59a9b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7b4e7ae2a10c124e48fd4cce93fcc93f15750d86"
-SRCREV_meta ?= "a26c1def6dceccb96ab9a707072d22e75888eda9"
+SRCREV_machine ?= "2ae1270a98b8e62cfecf36a485731a99ff0ab6a8"
+SRCREV_meta ?= "f5f141c395405345203f11703ca4bf609fef3fc2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.226"
+LINUX_VERSION ?= "5.10.227"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index b1c644db57..eacd59014e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.226"
+LINUX_VERSION ?= "5.10.227"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "30ae83f5cb6ff45d30bf47958f1585d3275740b3"
-SRCREV_machine ?= "b61c15e2143de80c4ae22605a8346023383f653a"
-SRCREV_meta ?= "a26c1def6dceccb96ab9a707072d22e75888eda9"
+SRCREV_machine:qemuarm ?= "5bb97dac8754ff70fb2ccdef76702bc9a96ce3f7"
+SRCREV_machine ?= "42d448fa7ff4633abcbf0a7a02ce0b2509df44a9"
+SRCREV_meta ?= "f5f141c395405345203f11703ca4bf609fef3fc2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e6d8787395..29091261c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "15bb053d77debfc3e5bf7388d6a99c2f766f0450"
-SRCREV_machine:qemuarm64 ?= "24b6c64975625da3c82321fbe888edbf540361f5"
-SRCREV_machine:qemumips ?= "bdd2635646d4b6508287a3037fef5caafe74f1bd"
-SRCREV_machine:qemuppc ?= "cfdef5fc7631d32ff3dd05852f15c0c544273b47"
-SRCREV_machine:qemuriscv64 ?= "ab15dae067f713bc506e8e8ad435e5e9f98263fd"
-SRCREV_machine:qemuriscv32 ?= "ab15dae067f713bc506e8e8ad435e5e9f98263fd"
-SRCREV_machine:qemux86 ?= "ab15dae067f713bc506e8e8ad435e5e9f98263fd"
-SRCREV_machine:qemux86-64 ?= "ab15dae067f713bc506e8e8ad435e5e9f98263fd"
-SRCREV_machine:qemumips64 ?= "d42c39f3a3588754fb0347054f27c818f8873d76"
-SRCREV_machine ?= "ab15dae067f713bc506e8e8ad435e5e9f98263fd"
-SRCREV_meta ?= "a26c1def6dceccb96ab9a707072d22e75888eda9"
+SRCREV_machine:qemuarm ?= "b08a4f767c2ecd86d0272a65f9e3cd98f1a06e66"
+SRCREV_machine:qemuarm64 ?= "77acdf2e0c5738d3e6c766ff55c0ba1ebe43bd56"
+SRCREV_machine:qemumips ?= "1e873174e49fe04bfa47306c92f2e761f23abe40"
+SRCREV_machine:qemuppc ?= "393a202ffe7f28b0158df1e97ce0b24edaf59ff9"
+SRCREV_machine:qemuriscv64 ?= "cfcd5579a447eb3768773c3be44e59a4addcf85a"
+SRCREV_machine:qemuriscv32 ?= "cfcd5579a447eb3768773c3be44e59a4addcf85a"
+SRCREV_machine:qemux86 ?= "cfcd5579a447eb3768773c3be44e59a4addcf85a"
+SRCREV_machine:qemux86-64 ?= "cfcd5579a447eb3768773c3be44e59a4addcf85a"
+SRCREV_machine:qemumips64 ?= "4f1163b1c00922dbf33f5ff55807584d3e287430"
+SRCREV_machine ?= "cfcd5579a447eb3768773c3be44e59a4addcf85a"
+SRCREV_meta ?= "f5f141c395405345203f11703ca4bf609fef3fc2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.226"
+LINUX_VERSION ?= "5.10.227"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


