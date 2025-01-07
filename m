Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BC0E77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 18:09:13 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.100.1736273349247996938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 10:09:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=J/vyQwFB;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2164b662090so205932615ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 10:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736273348; x=1736878148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaiNjXSgtUKjAXQfOl0iu2CW5NuKcu18eT6UK4AyQes=;
        b=J/vyQwFB3QE0Jg3NZkD8FB8bit7fc87GrIdyPuBacckcUgdm8TSfBmfOBKiXi+BsHx
         9nx365sjKe640jfTZOzfrKAF75uOcFljOgUBe2WNbhEnEojWYQp/CLeJQ4vwIvpBzoKh
         efd03VVwolln5LkdDsK3Acc0SWlipSX1cw/AFSYXQ+jhAWbDV1lVl3moZLP/MQhV1gds
         sW70d5PGQiVefCUhFHGBdV16FLJnObmNMcHE805T95mdvF1DXGmCFFUErz9JtbMPjFR+
         A3qdV4oQnwNLhw0M8uX1GnZhZFoKmR3fHgLE0BA6qo5nUXZTiZ0x1fqNJfoyAGbc/jae
         mqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736273348; x=1736878148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaiNjXSgtUKjAXQfOl0iu2CW5NuKcu18eT6UK4AyQes=;
        b=paac1SRjbInWyLMaNF/Bomd1PKf22UlTAdJVnUGtb364QjnNyOyoAnFdcw4/3ajsdN
         WsXpiyx2QUTCmqKTopR+LPSrcrXSXmWpPHi7IRUP881Bmr3fXDBKEHpqdesSq8OUZ5eW
         pnG+ROMQtwFYYAYvgW/3W5y8USdCUCi4FquUUsbSc9fg/zMfue6RgGYUilSHAvNEfuOE
         woAqSuAySFjSwv/zIZshW3oOYp2PraiWH+Hdxrvs6HymvWzg1A6DmxnsmyRvWcw2mR6M
         63uaEzESSmlRaL6W+8myp2NeUSehg2zm1XuPxJVt07QKoHKkwAn7GZYBw9cuLOwQay9r
         PtiA==
X-Gm-Message-State: AOJu0Yz9jZqm+ObGl+2HJNIXjqvnX8A6CgVPWwcgttlOGGLwHOOUE2oh
	u3prHI0sDwVvuVJOdPJV6NtW0+Eas5Bee+TazIAKaOFu1Q9SMEmJVE2/8mAiFjNB3Wp+KeMM5zd
	lQ94=
X-Gm-Gg: ASbGnct1xOEBtpWGwoRhDm5cCGvCSAJv5N5UBX5XFDhra1YMF4ATIwLPWxY4F75t580
	NWVG02DYQh8QcbdsCRTRdHihn+0E8UD+l4ywlLgzLJpu2HRhPtLJwL3MY4DAiEAUUzSgcj2mjFX
	zfNhDQXI/FlrLGZzXOy8fvcrgGMqJ4i98AKbogtYiXHpPX52sGFz7VJxbYmS8gPYcQhrhc9uUXI
	+kBSu++eLIqXYrwe8d2Bw6VVPs1zRJnw3M6IwItIk1HsQ==
X-Google-Smtp-Source: AGHT+IE/N6gE4wNwxV/Pb4Lx02aNfP2xQGE5i6Z/gsPMDW9zITw6JLtYuldF7Usq08obYEKIGPwhxw==
X-Received: by 2002:a17:902:ecc5:b0:216:57a6:2887 with SMTP id d9443c01a7336-21a83f5db98mr139285ad.21.1736273347551;
        Tue, 07 Jan 2025 10:09:07 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4413sm314166335ad.172.2025.01.07.10.09.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 10:09:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/19] linux-yocto/5.15: update to v5.15.168
Date: Tue,  7 Jan 2025 10:08:31 -0800
Message-ID: <6e52b8bdf3dd48240c7a37a5dfc30a21cb3a792a.1736273200.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736273200.git.steve@sakoman.com>
References: <cover.1736273200.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 18:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209494

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    584a40a22cb9 Linux 5.15.168
    1b62ef7f23c3 net: xilinx: axienet: Schedule NAPI in two steps
    56d5ca2ef0d7 selftests: net: more strict check in net_helper
    7ef0ff59324a net: axienet: start napi before enabling Rx/Tx
    a97eacadb096 ext4: fix warning in ext4_dio_write_end_io()
    8fcd1021b260 netfilter: ip6t_rpfilter: Fix regression with VRF interfaces
    83948838e1c7 net: vrf: determine the dst using the original ifindex for multicast
    70247cc8ddb4 net: seg6: fix seg6_lookup_any_nexthop() to handle VRFs using flowi_l3mdev
    760852df5707 net: Handle l3mdev in ip_tunnel_init_flow
    9476ecd7f7b8 xfrm: Pass flowi_oif or l3mdev as oif to xfrm_dst_lookup
    78f4daf715e8 net: geneve: add missing netlink policy and size for IFLA_GENEVE_INNER_PROTO_INHERIT
    7db54f3ba8cf i2c: smbus: Check for parent device before dereference
    63a07379fdb6 block, bfq: fix uaf for accessing waker_bfqq after splitting
    40a6e660d2a3 kthread: unpark only parked kthread
    8c3de9282dde nouveau/dmem: Fix vulnerability in migrate_to_ram upon copy error
    cda875cd1506 mptcp: pm: do not remove closing subflows
    d8435f584031 net: dsa: lan9303: ensure chip reset and wait for READY status
    1cdec792b245 net: Fix an unsafe loop on the list
    daf462ff3cde net: explicitly clear the sk pointer, when pf->create fails
    24ab54a066d2 drm/v3d: Stop the active perfmon before being destroyed
    dd2bac3d6339 hid: intel-ish-hid: Fix uninitialized variable 'rv' in ish_fw_xfer_direct_dma
    1c4da771257e usb: storage: ignore bogus device raised by JieLi BR21 USB sound chip
    e31942147bf5 usb: xhci: Fix problem with xhci resume from suspend
    254ef45afea5 usb: dwc3: core: Stop processing of pending events if controller is halted
    34354210968f Revert "usb: yurex: Replace snprintf() with the safer scnprintf() variant"
    d246ee018569 HID: plantronics: Workaround for an unexcepted opposite volume key
    8a6fef7d22a1 resource: fix region_intersects() vs add_memory_driver_managed()
    8c6ad37e5882 HID: amd_sfh: Switch to device-managed dmam_alloc_coherent()
    a77e1d1ae962 hwmon: (adt7470) Add missing dependency on REGMAP_I2C
    36b8e8dee2d5 hwmon: (adm9240) Add missing dependency on REGMAP_I2C
    b5a3a65f2907 hwmon: (tmp513) Add missing dependency on REGMAP_I2C
    1fdc3bab3073 x86/fpu: Avoid writing LBR bit to IA32_XSS unless supported
    330c825e66ef RDMA/hns: Fix UAF for cq async event
    5e336384cc9b slip: make slhc_remember() more robust against malicious packets
    fadf8fdb3110 ppp: fix ppp_async_encode() illegal access
    c9abdd07f52f mctp: Handle error of rtnl_register_module().
    947acd1b09b0 rtnetlink: Add bulk registration helpers for rtnetlink message handlers.
    21d30b12695a net: rtnetlink: add msg kind names
    95ad7ee0faee netfilter: fib: check correct rtable in vrf setups
    66464a439e61 netfilter: rpfilter/fib: Set ->flowic_uid correctly for user namespaces.
    5c6cb7ab36e7 netfilter: rpfilter/fib: Populate flowic_l3mdev field
    5bcde9b43021 net: Add l3mdev index to flow struct and avoid oif reset for port devices
    85ff9a0f793c netfilter: xtables: avoid NFPROTO_UNSPEC where needed
    f30ea678a21e sctp: ensure sk_state is set to CLOSED if hashing fails in sctp_listen_start
    b5d662f49701 net: ibm: emac: mal: fix wrong goto
    8fb6503592d3 net/sched: accept TCA_STAB only for root qdisc
    0a94079e3841 igb: Do not bring the device up after non-fatal error
    9db6ce9e2738 i40e: Fix macvlan leak by synchronizing access to mac_filter_hash
    394ded964ec9 ice: Fix netif_is_ice() in Safe Mode
    dcd9bf6d4eb2 gpio: aspeed: Use devm_clk api to manage clock source
    a82f6a31b1cb gpio: aspeed: Add the flush write to ensure the write complete.
    043b681d7613 net: dsa: b53: fix jumbo frames on 10/100 ports
    6bc26a82b6df net: dsa: b53: allow lower MTUs on BCM5325/5365
    94a40349914b net: dsa: b53: fix max MTU for BCM5325/BCM5365
    7b444a8d8f4b net: dsa: b53: fix max MTU for 1g switches
    def87a33e062 net: dsa: b53: fix jumbo frame mtu check
    8403021b6f32 thermal: intel: int340x: processor: Fix warning during module unload
    2ba1af0c9f99 thermal: int340x: processor_thermal: Set feature mask before proc_thermal_add
    5f14a2d06a8a net: phy: bcm84881: Fix some error handling paths
    496b2ab0fd10 Bluetooth: RFCOMM: FIX possible deadlock in rfcomm_sk_state_change
    95c0cff5a1a5 netfilter: br_netfilter: fix panic with metadata_dst skb
    7134b01bdb6a tcp: fix tcp_enter_recovery() to zero retrans_stamp when it's safe
    ffdcd3bd2b42 tcp: fix to allow timestamp undo if no retransmits were sent
    ad0d76b8ee5d net: phy: dp83869: fix memory corruption when enabling fiber
    584c019baedd NFSv4: Prevent NULL-pointer dereference in nfs42_complete_copies()
    91b9a4c5cfca SUNRPC: Fix integer overflow in decode_rc_list()
    8a2023730850 ice: fix VLAN replay after reset
    ca5b42375bb8 NFSD: Mark filecache "down" if init fails
    e0e14dd35d42 RDMA/rxe: Fix seg fault in rxe_comp_queue_pkt
    41cf6f26abe4 fbdev: sisfb: Fix strbuf array overflow
    c643ef59390e drm/amd/display: Check null pointer before dereferencing se
    57551835ce41 driver core: bus: Return -EIO instead of 0 when show/store invalid bus attribute
    59eba86b811b tools/iio: Add memory allocation failure check for trigger_name
    9a2bc9b6f929 virtio_pmem: Check device status before requesting flush
    6515b7b11757 comedi: ni_routing: tools: Check when the file could not be opened
    98d5873ee063 usb: dwc2: Adjust the timing of USB Driver Interrupt Registration in the Crashkernel Scenario
    7ad71deb9bb7 usb: chipidea: udc: enable suspend interrupt after usb reset
    d18dc8e14b9c clk: imx: Remove CLK_SET_PARENT_GATE for DRAM mux for i.MX7D
    64f2ca5ce971 remoteproc: imx_rproc: Use imx specific hook for find_loaded_rsc_table
    52f8c06eb34d media: videobuf2-core: clear memory related fields in __vb2_plane_dmabuf_put()
    92728fceefda ntb: ntb_hw_switchtec: Fix use after free vulnerability in switchtec_ntb_remove due to race condition
    f1c9b8dc7693 PCI: Mark Creative Labs EMU20k2 INTx masking as broken
    28ad4ed09378 i2c: i801: Use a different adapter-name for IDF adapters
    351a97d9f8e7 PCI: Add ACS quirk for Qualcomm SA8775P
    3e11b8de964d clk: bcm: bcm53573: fix OF node leak in init
    394b2f4d5e01 RDMA/rtrs-srv: Avoid null pointer deref during path establishment
    eb54979471aa PCI: Add function 0 DMA alias quirk for Glenfly Arise chip
    7022a517bf1c RDMA/mad: Improve handling of timed out WRs of mad agent
    ee603aae244e ktest.pl: Avoid false positives with grub2 skip regex
    b85e6e461b6d s390/cpum_sf: Remove WARN_ON_ONCE statements
    4f5768a31cf7 ext4: nested locking for xattr inode
    fbb177bc1d64 ext4: don't set SB_RDONLY after filesystem errors
    11cd5f6e3578 bpf, x64: Fix a jit convergence issue
    02e5e382885c s390/mm: Add cond_resched() to cmm_alloc/free_pages()
    4a749c14fa2b s390/facility: Disable compile time optimization for decompressor code
    297c326c3e21 bpf: Check percpu map value size first
    40364194698d Input: synaptics-rmi4 - fix UAF of IRQ domain on driver removal
    1ce2632ebc30 virtio_console: fix misc probe bugs
    54b946e6518f fs/ntfs3: Refactor enum_rstbl to suppress static checker
    9d7e3c9fd6f5 selftests: net: Remove executable bits from library scripts
    5174a2aa22f0 selftests/net: synchronize udpgro tests' tx and rx connection
    fc1ec829bdf6 selftests/net: give more time to udpgro bg processes to complete startup
    084435dbd1f1 tracing: Have saved_cmdlines arrays all in one allocation
    455df76f48b1 drm/crtc: fix uninitialized variable use even harder
    daceb147b072 tracing: Remove precision vsnprintf() check from print event
    5320baa12de3 net: ethernet: cortina: Drop TSO support
    651b954cd8d5 unicode: Don't special case ignorable code points
    f57204edc107 ALSA: usb-audio: Fix possible NULL pointer dereference in snd_usb_pcm_has_fixed_rate()
    a71677981775 perf report: Fix segfault when 'sym' sort key is not used
    46128370a72c vhost/scsi: null-ptr-dereference in vhost_scsi_get_req()
    3bb6763a8319 9p: add missing locking around taking dentry fid list
    8b4920bd66e1 ext4: fix inode tree inconsistency caused by ENOMEM
    5292eafa1b78 Revert "arm64: dts: qcom: sm8250: switch UFS QMP PHY to new style of bindings"
    07b98400cb02 ACPI: battery: Fix possible crash when unregistering a battery hook
    eb7924f88f8a ACPI: battery: Simplify battery hook locking
    a1a37348195b clk: qcom: gcc-sc8180x: Add GPLL9 support
    21950321ad33 r8169: add tally counter fields added with RTL8125
    e36d8907f321 r8169: Fix spelling mistake: "tx_underun" -> "tx_underrun"
    befa8b1f466e dt-bindings: clock: qcom: Add GPLL9 support on gcc-sc8180x
    f691f2b5b0f9 dt-bindings: clock: qcom: Add missing UFS QREF clocks
    a0c5a9b910c7 media: imx335: Fix reset-gpio handling
    846a78f7a1cb media: i2c: imx335: Enable regulator supplies
    e1b0752da800 drm/rockchip: vop: clear DMA stop bit on RK3066
    5e889e72de58 drm/rockchip: support gamma control on RK3399
    a8ade6a33ba9 drm/rockchip: define gamma registers for RK3399
    8fa2b6817a95 lib/buildid: harden build ID parsing logic
    91fdcb0d609c build-id: require program headers to be right after ELF header
    feca60173e0f drm/amd/display: Allow backlight to go below `AMDGPU_DM_DEFAULT_MIN_BACKLIGHT`
    21cb47db1ec9 uprobes: fix kernel info leak via "[uprobes]" vma
    9707c7895c05 arm64: errata: Expand speculative SSBS workaround once more
    f76454cf0fc1 arm64: cputype: Add Neoverse-N3 definitions
    66f6e22dbcad arm64: Add Cortex-715 CPU part definition
    8c30a9a8610c ext4: dax: fix overflowing extents beyond inode size when partially writing
    bb990db7baca ext4: properly sync file size update after O_SYNC direct IO
    d1c3c8a543a7 spi: bcm63xx: Fix missing pm_runtime_disable()
    676546ba317e i2c: xiic: Fix pm_runtime_set_suspended() with runtime pm enabled
    01eb21aff7f3 i2c: xiic: Use devm_clk_get_enabled()
    65677e96e958 i2c: core: Lock address during client device instantiation
    0e8926abfd7a i2c: create debugfs entry per adapter
    19e9b89c2c7a i2c: smbus: Use device_*() functions instead of of_*()
    c15e2ab4fed9 device property: Add fwnode_irq_get_byname
    bf36521e559e device property: Add fwnode_iomap()
    3d5bce8a9f6f kconfig: qconf: fix buffer overflow in debug links
    eb9329cd882a drm/amd/display: Fix system hang while resume with TBT monitor
    622bc6472350 drm/sched: Add locking to drm_sched_entity_modify_sched
    7e9d945af0b5 close_range(): fix the logics in descriptor table trimming
    322920b53dc1 tracing/timerlat: Fix a race during cpuhp processing
    5b8d9e4998ef tracing/hwlat: Fix a race during cpuhp processing
    4764c8206a0c gpio: davinci: fix lazy disable
    4c98fe0dfa2a btrfs: wait for fixup workers before stopping cleaner kthread during umount
    37fee9c220b9 btrfs: fix a NULL pointer dereference when failed to start a new trasacntion
    5ec5d4dddcd2 ACPI: resource: Add Asus ExpertBook B2502CVA to irq1_level_low_skip_override[]
    d32f7a43468f ACPI: resource: Add Asus Vivobook X1704VAP to irq1_level_low_skip_override[]
    95555f9f844d Input: adp5589-keys - fix adp5589_gpio_get_value()
    4449fedb8a71 Input: adp5589-keys - fix NULL pointer dereference
    fc65bc81884a rtc: at91sam9: fix OF node leak in probe() error path
    b0da9504a528 net: stmmac: Fix zero-division error when disabling tc cbs
    84a9d1356e76 tomoyo: fallback to realpath if symlink's pathname does not exist
    14bf8400bc47 iio: magnetometer: ak8975: Fix reading for ak099xx sensors
    ab727ca020e6 clk: qcom: gcc-sc8180x: Fix the sdcc2 and sdcc4 clocks freq table
    c02e3ab7ec6c clk: qcom: gcc-sm8250: Do not turn off PCIe GDSCs during gdsc_disable()
    bf6be32e2d39 media: venus: fix use after free bug in venus_remove due to race condition
    248e516937c4 clk: qcom: gcc-sm8150: De-register gcc_cpuss_ahb_clk_src
    ed17f3177153 clk: qcom: clk-rpmh: Fix overflow in BCM vote
    5c78477386bf media: uapi/linux/cec.h: cec_msg_set_reply_to: zero flags
    862ab6b7c733 media: sun4i_csi: Implement link validate for sun4i_csi subdev
    595f3a4c6541 clk: qcom: dispcc-sm8250: use CLK_SET_RATE_PARENT for branch clocks
    6be85772b0aa clk: rockchip: fix error for unknown clocks
    07b418d50ccb aoe: fix the potential use-after-free problem in more places
    2f8f226f4d56 NFSD: Fix NFSv4's PUTPUBFH operation
    825789ca9460 nfsd: map the EBADMSG to nfserr_io to avoid warning
    c5f73b371622 nfsd: fix delegation_blocked() to block correctly for at least 30 seconds
    fdb6429ae356 perf hist: Update hist symbol when updating maps
    ddf704c2ce3b exfat: fix memory leak in exfat_load_bitmap()
    f47b1d5e596a riscv: define ILLEGAL_POINTER_VALUE for 64bit
    aab0032d416e ext4: mark fc as ineligible using an handle in ext4_xattr_set()
    b4eff7c777df ext4: use handle to mark fc as ineligible in __track_dentry_update()
    4e66fc1d8c2b ext4: fix fast commit inode enqueueing during a full journal commit
    13e4a67f9508 ext4: fix incorrect tid assumption in jbd2_journal_shrink_checkpoint_list()
    3c1777a490ac ext4: fix incorrect tid assumption in ext4_wait_for_tail_page_commit()
    a9fcb1717d75 ext4: update orig_path in ext4_find_extent()
    32bbb59e3f18 ext4: fix double brelse() the buffer of the extents path
    9df59009dfc6 ext4: aovid use-after-free in ext4_ext_insert_extent()
    a34bed978364 ext4: drop ppath from ext4_ext_replay_update_ex() to avoid double-free
    02cb2cb02aa7 ext4: fix incorrect tid assumption in __jbd2_log_wait_for_space()
    a11cfe5eed24 ext4: propagate errors from ext4_find_extent() in ext4_insert_range()
    cafcc1bd6293 ext4: fix slab-use-after-free in ext4_split_extent_at()
    a1f71afb4f14 ext4: correct encrypted dentry name hash when not casefolded
    aca593e6070e ext4: no need to continue when the number of entries is 1
    c25c05b22a4a ALSA: hda/realtek: Add quirk for Huawei MateBook 13 KLV-WX9
    6d62d3ef0844 ALSA: line6: add hw monitor volume control to POD HD500X
    5276f42f9aaf ALSA: usb-audio: Add native DSD support for Luxman D-08u
    cac2df1c0207 ALSA: usb-audio: Add delay quirk for VIVO USB-C HEADSET
    c82ee0462f60 ALSA: core: add isascii() check to card ID generator
    90e8f0bee38d drm: Consistently use struct drm_mode_rect for FB_DAMAGE_CLIPS
    2d158286932e parisc: Fix itlb miss handler for 64-bit programs
    1905a87cf6f4 perf/core: Fix small negative period being ignored
    0c9655647ca9 power: supply: hwmon: Fix missing temp1_max_alarm attribute
    5199bc715fb1 spi: bcm63xx: Fix module autoloading
    35f7af9ba77e firmware: tegra: bpmp: Drop unused mbox_client_to_bpmp()
    438e11739cb3 i2c: xiic: Wait for TX empty to avoid missed TX NAKs
    b261af5668cd i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()
    1883cad2cc62 i2c: stm32f7: Do not prepare/unprepare clock during runtime suspend/resume
    1973c4d8ee07 platform/x86: ISST: Fix the KASAN report slab-out-of-bounds bug
    b8219d9dd128 selftests: vDSO: fix vdso_config for s390
    2d07646df487 selftests: vDSO: fix ELF hash table entry size for s390x
    0fc61eef8a46 selftests/mm: fix charge_reserved_hugetlb.sh test
    4862f6653c68 selftests: vDSO: fix vDSO symbols lookup for powerpc64
    cd7bd2afa30f selftests: vDSO: fix vdso_config for powerpc
    e6b63652b991 selftests: vDSO: fix vDSO name for powerpc
    d9663682ec6b selftests: breakpoints: use remaining time to check if suspend succeed
    ed11dd795817 spi: s3c64xx: fix timeout counters in flush_fifo
    0e2d6c17afb4 spi: spi-imx: Fix pm_runtime_set_suspended() with runtime pm enabled
    2a07e6f0ad8a usb: typec: tcpm: Check for port partner validity before consuming it
    09e829b39b43 blk-integrity: register sysfs attributes on struct device
    6356f2d2fc73 blk-integrity: convert to struct device_attribute
    71246997b749 blk-integrity: use sysfs_emit
    ef05572da0c0 ext4: fix i_data_sem unlock order in ext4_ind_migrate()
    4999fed877bb ext4: avoid use-after-free in ext4_ext_show_leaf()
    69fe6502aba1 ext4: ext4_search_dir should return a proper error
    ee6b6fa14592 of/irq: Refer to actual buffer size in of_irq_parse_one()
    9550d8d6f19f drm/amd/pm: ensure the fw_info is not null before using it
    c8c095856c1f drm/radeon/r100: Handle unknown family in r100_cp_init_microcode()
    eb9a4b6fcb1c scsi: aacraid: Rearrange order of struct aac_srb_unit
    6aeb160ec5bd drm/printer: Allow NULL data in devcoredump printer
    1f9f8186e239 drm/amd/display: Initialize get_bytes_per_element's default to 1
    c13f9c62015c drm/amd/display: Fix index out of bounds in DCN30 color transformation
    c6979719012a drm/amd/display: Fix index out of bounds in degamma hardware format translation
    de6ee4f9e6b1 drm/amd/display: Fix index out of bounds in DCN30 degamma hardware format translation
    14db8692afe1 drm/amd/display: Check stream before comparing them
    0af53bc5d13b platform/x86: touchscreen_dmi: add nanote-next quirk
    3217b83e1b80 HID: multitouch: Add support for Thinkpad X12 Gen 2 Kbd Portfolio
    f38b68a6b31d drm/amdgpu: enable gfxoff quirk on HP 705G4
    0000f7b4da60 drm/amdgpu: add raven1 gfxoff quirk
    d7444f91a9f9 jfs: Fix uninit-value access of new_ea in ea_buffer
    48edb1f7c288 scsi: smartpqi: correct stream detection
    25d2a3ff02f2 jfs: check if leafidx greater than num leaves per dmap tree
    e7ae14f7ee76 jfs: Fix uaf in dbFreeBits
    89257ecbc0f6 jfs: UBSAN: shift-out-of-bounds in dbFindBits
    a545a9403e04 drm/amd/display: Check null pointers before using dc->clk_mgr
    6a6045adeb59 ata: sata_sil: Rename sil_blacklist to sil_quirks
    8ab59527852a drm/amd/display: Add null check for top_pipe_to_program in commit_planes_for_stream
    8840dc73ac9e iommu/vt-d: Fix potential lockup if qi_submit_sync called with 0 count
    4a96abcc0a2a iommu/vt-d: Always reserve a domain ID for identity setup
    d9e19f1b20ee power: reset: brcmstb: Do not go into infinite loop if reset fails
    f4ff7eb5fa74 iommu/arm-smmu-qcom: hide last LPASS SMMU context bank from linux
    afb940c929c2 rcuscale: Provide clear error when async specified without primitives
    4cda484e584b fbdev: pxafb: Fix possible use after free in pxafb_task()
    1af86293f12d x86/syscall: Avoid memcpy() for ia32 syscall_get_arguments()
    6c4194f385ce ALSA: hdsp: Break infinite MIDI input flush loop
    36ee4021bcc3 ALSA: asihpi: Fix potential OOB array access
    dacec3a3248f tools/x86/kcpuid: Protect against faulty "max subleaf" values
    d6a62fcfd494 ALSA: usb-audio: Add logitech Audio profile quirk
    8659f67f1e41 ALSA: usb-audio: Define macros for quirk table entries
    e479cb835fee x86/ioapic: Handle allocation failures gracefully
    8af3e93c5a95 ALSA: usb-audio: Add input value sanity checks for standard types
    4631445ce633 signal: Replace BUG_ON()s
    c50c8946e975 nfp: Use IRQF_NO_AUTOEN flag in request_irq()
    e59bdb1ba594 wifi: mwifiex: Fix memcpy() field-spanning write warning in mwifiex_cmd_802_11_scan_ext()
    0f722fb45973 wifi: mt76: mt7915: hold dev->mt76.mutex while disabling tx worker
    4a55880fa909 proc: add config & param to block forcing mem writes
    0a898bec6c22 ACPICA: iasl: handle empty connection_node
    34478851da8d tcp: avoid reusing FIN_WAIT2 when trying to find port in connect() process
    f7a05d5d9987 net: atlantic: Avoid warning about potential string truncation
    fb55f3d88fe1 ipv4: Mask upper DSCP bits and ECN bits in NETLINK_FIB_LOOKUP family
    babfc87445bf ipv4: Check !in_dev earlier for ioctl(SIOCSIFADDR).
    4fd17b6152a4 net: mvpp2: Increase size of queue_name buffer
    54dae0e9063e tipc: guard against string buffer overrun
    1c9b8775062f ACPICA: check null return of ACPI_ALLOCATE_ZEROED() in acpi_db_convert_to_package()
    d6e279a09158 ACPI: EC: Do not release locks during operation region accesses
    7df619575dc5 wifi: rtw88: select WANT_DEV_COREDUMP
    4dd732893bd3 wifi: ath11k: fix array out-of-bound access in SoC stats
    a37a6976e475 nvme-pci: qdepth 1 quirk
    f4ef9bef023d blk_iocost: fix more out of bound shifts
    d1e08ebca617 net: sched: consistently use rcu_replace_pointer() in taprio_change()
    5ee8ee672aa7 ACPICA: Fix memory leak if acpi_ps_get_next_field() fails
    bcf5c9306707 ACPICA: Fix memory leak if acpi_ps_get_next_namepath() fails
    92e5661b7d07 ACPI: PAD: fix crash in exit_round_robin()
    1163b7a18d0f net: hisilicon: hns_mdio: fix OF node leak in probe()
    36622aa3c48e net: hisilicon: hns_dsaf_mac: fix OF node leak in hns_mac_get_info()
    3d055e845339 net: hisilicon: hip04: fix OF node leak in probe()
    a0465723b858 net/xen-netback: prevent UAF in xenvif_flush_hash()
    d107d63e6635 ice: Adjust over allocation of memory in ice_sched_add_root_node() and ice_sched_add_node()
    012ae530afa0 wifi: ath9k_htc: Use __skb_set_length() for resetting urb before resubmit
    08a24438fa13 wifi: ath9k: fix possible integer overflow in ath9k_get_et_stats()
    88ff021e1fea f2fs: Require FMODE_WRITE for atomic write ioctls
    a37b50143d26 ALSA: hda/conexant: Fix conflicting quirk for System76 Pangolin
    472b5fc6f8f1 ASoC: imx-card: Set card.owner to avoid a warning calltrace if SND=m
    e142b12f11cd ALSA: hda/generic: Unconditionally prefer preferred_dacs pairs
    6eac1b151d8e ALSA: hda/realtek: Fix the push button function for the ALC257
    2bded581f00a ALSA: mixer_oss: Remove some incorrect kfree_const() usages
    d5ed208d04ac media: usbtv: Remove useless locks in usbtv_video_free()
    fa593e9cd2b3 i2c: xiic: Try re-initialization on bus busy timeout
    5ffff2b57d8f i2c: xiic: improve error message when transfer fails to start
    72cb227a368c i2c: xiic: xiic_xfer(): Fix runtime PM leak on error path
    a50c8564ab82 i2c: xiic: Fix RX IRQ busy check
    c7ed4ddaa5a2 i2c: xiic: Switch from waitqueue to completion
    574d8d0fe424 i2c: xiic: Fix broken locking on tx_msg
    e7a8442195e8 sctp: set sk_state back to CLOSED if autobind fails in sctp_listen_start
    176dd41e8c2b ppp: do not assume bh is held in ppp_channel_bridge_input()
    97b1f515816d ipv4: ip_gre: Fix drops of small packets in ipgre_xmit
    105a292189f6 net: stmmac: dwmac4: extend timeout for VLAN Tag register busy bit check
    a785cbc8da30 net: stmmac: Disable automatic FCS/Pad stripping
    e255383aff9f stmmac_pci: Fix underflow size in stmmac_rx
    2415f465730e net: add more sanity checks to qdisc_pkt_len_init()
    939c88cbdc66 net: avoid potential underflow in qdisc_pkt_len_init() with UFO
    469856f76f48 net: ethernet: lantiq_etop: fix memory disclosure
    62a4567e3e10 Bluetooth: btmrvl: Use IRQF_NO_AUTOEN flag in request_irq()
    38e3fd0c4a26 netfilter: nf_tables: prevent nf_skb_duplicated corruption
    3ed462d05807 net: ieee802154: mcr20a: Use IRQF_NO_AUTOEN flag in request_irq()
    62ac553b834f netfilter: uapi: NFTA_FLOWTABLE_HOOK is NLA_NESTED
    4655456a64a0 net/mlx5e: Fix NULL deref in mlx5e_tir_builder_alloc()
    201ce2f738f4 net/mlx5: Added cond_resched() to crdump collection
    ce828b347cf1 net/mlx5: Fix error path in multi-packet WQE transmit
    ee57897c7f65 ieee802154: Fix build error
    f863bfd0a2c6 ceph: remove the incorrect Fw reference check when dirtying pages
    df293ea78740 mailbox: bcm2835: Fix timeout during suspend mode
    6bd8e9effadc mailbox: rockchip: fix a typo in module autoloading
    bc9356513d56 static_call: Replace pointless WARN_ON() in static_call_module_notify()
    ed4c8ce0f307 static_call: Handle module init failure correctly in static_call_del_module()
    894ac00deb84 spi: lpspi: Simplify some error message
    1e0417dc346a usb: yurex: Fix inconsistent locking bug in yurex_read()
    84554d42ff53 i2c: isch: Add missed 'else'
    a2146b6150bc i2c: aspeed: Update the stop sw state when the bus recovery occurs
    8ce4b0d44083 mm: only enforce minimum stack gap size if it's sensible
    e59cd4b1a72d lockdep: fix deadlock issue between lockdep and rcu
    cc59ee9b8a4c bpf: lsm: Set bpf_lsm_blob_sizes.lbs_task to 0
    9186293c610d x86/entry: Remove unwanted instrumentation in common_interrupt()
    c86f5a9dfd24 x86/idtentry: Incorporate definitions/declarations of the FRED entries
    3a69dcccd0ca pps: add an error check in parport_attach
    ec22387afb26 pps: remove usage of the deprecated ida_simple_xx() API
    009a2f6cc031 usb: xhci: fix loss of data on Cadence xHC
    112625ec8319 xhci: Add a quirk for writing ERST in high-low order
    cfe314e969d4 xhci: Preserve RsvdP bits in ERSTBA register correctly
    d2e4da8704e6 xhci: Refactor interrupter code for initial multi interrupter support.
    f2ae6fd0c38b xhci: remove xhci_test_trb_in_td_math early development check
    a646b4e59613 xhci: fix event ring segment table related masks and variables in header
    0bf337c41c5b USB: misc: yurex: fix race between read and write
    979687509d75 usb: yurex: Replace snprintf() with the safer scnprintf() variant
    23c84724aee7 soc: versatile: realview: fix soc_dev leak during device remove
    5eae90b24f28 soc: versatile: realview: fix memory leak during device remove
    72164d5b6489 padata: use integer wrap around to prevent deadlock on seq_nr overflow
    c3dfec3c05b6 EDAC/igen6: Fix conversion of system address to physical memory address
    62356668d855 nfs: fix memory leak in error path of nfs4_do_reclaim
    394584185c76 fs: Fix file_set_fowner LSM hook inconsistencies
    3721a6940329 vfs: fix race between evice_inodes() and find_inode()&iput()
    3eb0143d9cff arm64: dts: rockchip: Correct the Pinebook Pro battery design capacity
    04afbac8c6ac arm64: dts: rockchip: Raise Pinebook Pro's panel backlight PWM frequency
    beb14f6068c6 hwrng: cctrng - Add missing clk_disable_unprepare in cctrng_resume
    07f76feca097 hwrng: bcm2835 - Add missing clk_disable_unprepare in bcm2835_rng_init
    8bdb39831bf4 hwrng: mtk - Use devm_pm_runtime_enable
    dc9a23d3b4ee f2fs: avoid potential int overflow in sanity_check_area_boundary()
    afb5da22a7fa f2fs: prevent possible int overflow in dir_block_index()
    21f055191ea5 debugobjects: Fix conditions in fill_pool()
    f5056adc042f wifi: mt76: mt7615: check devm_kasprintf() returned value
    44f94356e6a4 wifi: rtw88: 8822c: Fix reported RX band width
    5ebb243e68c3 perf/x86/intel/pt: Fix sampling synchronization
    11690d7e7684 efistub/tpm: Use ACPI reclaim memory for event log to avoid corruption
    43f5d026da0b ACPI: resource: Add another DMI match for the TongFang GMxXGxx
    0cdfb9178a3b ACPI: sysfs: validate return type of _STR method
    90ed958acfd1 drbd: Add NULL check for net_conf to prevent dereference in state validation
    c9ae82e4871d drbd: Fix atomicity violation in drbd_uuid_set_bm()
    3e425c8a48d0 crypto: ccp - Properly unregister /dev/sev on sev PLATFORM_STATUS failure
    7ddf551c4d31 xhci: Set quirky xHC PCI hosts to D3 _after_ stopping and freeing them.
    bfdddc20d270 tty: rp2: Fix reset with non forgiving PCIe host bridges
    a77fc4acfd49 firmware_loader: Block path traversal
    4d6e61d7113a bus: integrator-lm: fix OF node leak in probe()
    2682248bdcfb usb: dwc2: drd: fix clock gating on USB role switch
    ff359dadecb0 usb: cdnsp: Fix incorrect usb_request status
    92f9e6c8b993 USB: class: CDC-ACM: fix race between get_serial and set_serial
    cde120f5870f USB: misc: cypress_cy7c63: check for short transfer
    39c22ede7739 USB: appledisplay: close race between probe and completion handler
    b80aacfea6e8 usbnet: fix cyclical race on disconnect with work queue
    75349cb4b00d scsi: mac_scsi: Disallow bus errors during PDMA send
    aa4d228b1e0a scsi: mac_scsi: Refactor polling loop
    3fe6d2a707df scsi: mac_scsi: Revise printk(KERN_DEBUG ...) messages
    9113f60bce80 drm/amd/display: Validate backlight caps are sane
    458c54c6f947 drm/amd/display: Round calculated vtotal
    a2c1d68a4ab5 Input: i8042 - add another board name for TUXEDO Stellaris Gen5 AMD line
    7874e99b4ebf Input: i8042 - add TUXEDO Stellaris 15 Slim Gen6 AMD to i8042 quirk table
    87d6eabb2322 Input: i8042 - add TUXEDO Stellaris 16 Gen5 AMD to i8042 quirk table
    c3b04fe1bb8e Revert "media: tuners: fix error return code of hybrid_tuner_request_state()"
    d738f1dc8b48 soc: versatile: integrator: fix OF node leak in probe() error path
    49006a92c7c9 ASoC: rt5682: Return devm_of_clk_add_hw_provider to transfer the error
    65038f8c6b10 PCI: xilinx-nwl: Fix off-by-one in INTx IRQ handler
    fdceebc86a5a Remove *.orig pattern from .gitignore
    fe0cd5379111 selinux,smack: don't bypass permissions check in inode_setsecctx hook
    a6d810554d7d vfio/pci: fix potential memory leak in vfio_intx_enable()
    a1630bd15f23 x86/mm: Switch to new Intel CPU model defines
    3088bb7aadf6 powercap: RAPL: fix invalid initialization for pl4_supported field
    9a4be35d9c53 Input: goodix - use the new soc_intel_is_byt() helper
    714426520846 drm/amd/display: Fix Synaptics Cascaded Panamera DSC Determination
    5d72a13dcc25 netfilter: ctnetlink: compile ctnetlink_label_size with CONFIG_NF_CONNTRACK_EVENTS
    39696868a24a netfilter: nf_tables: Keep deleted flowtable hooks until after RCU
    c1be35e774f8 bonding: Fix unnecessary warnings and logs from bond_xdp_get_xmit_slave()
    0066d4bac5d9 net: qrtr: Update packets cloning when broadcasting
    5c4c03288a4a tcp: check skb is non-NULL in tcp_rto_delta_us()
    a3e83a402a73 net: ipv6: select DST_CACHE from IPV6_RPL_LWTUNNEL
    822c7bb1f6f8 net: seeq: Fix use after free vulnerability in ether3 Driver Due to Race Condition
    fbff87d682e5 netfilter: nf_reject_ipv6: fix nf_reject_ip6_tcphdr_put()
    d1c98c68d0dd net: xilinx: axienet: Fix packet counting
    fac3629829ec net: axienet: Switch to 64-bit RX/TX statistics
    15d2b2bf096e net: axienet: Use NAPI for TX completion path
    e09deb71fb91 net: axienet: Be more careful about updating tx_bd_tail
    0493a5d80b4b net: axienet: add coalesce timer ethtool configuration
    72e135bace88 net: axienet: reduce default RX interrupt threshold to 1
    3b4b8afd9083 net: axienet: implement NAPI and GRO receive
    635e766e602f net: axienet: don't set IRQ timer when IRQ delay not used
    50a2ed164f59 net: axienet: Clean up DMA start/stop and error handling
    9384262ad810 net: axienet: Clean up device used for DMA calls
    043dc922cd47 Revert "dm: requeue IO if mapping table not yet available"
    927a2580208e vhost_vdpa: assign irq bypass producer token correctly
    4d10104d987a vdpa: Add eventfd for the vdpa callback
    b22db5572fcc interconnect: qcom: sm8250: Enable sync_state
    4a6e221019e6 coresight: tmc: sg: Do not leak sg_table
    01a2e65598a2 iio: adc: ad7606: fix standby gpio state to match the documentation
    2abf0fa4f4b2 iio: adc: ad7606: fix oversampling gpio array
    7553f7a85cb9 spi: spi-fsl-lpspi: Undo runtime PM changes at driver exit time
    00148baf8f53 spi: lpspi: release requested DMA channels
    41324fd0a823 spi: lpspi: Silence error message upon deferred probe
    e8d64f598eeb f2fs: get rid of online repaire on corrupted directory
    e2d39a5981cf f2fs: clean up w/ dotdot_name
    0cab715836db f2fs: introduce F2FS_IPU_HONOR_OPU_WRITE ipu policy
    de5561be4a68 f2fs: fix to wait page writeback before setting gcing flag
    520ff47fc61f f2fs: optimize error handling in redirty_blocks
    2e580f42d175 f2fs: reduce expensive checkpoint trigger frequency
    500d362dab97 f2fs: remove unneeded check condition in __f2fs_setxattr()
    6eacbf58e410 f2fs: fix to update i_ctime in __f2fs_setxattr()
    9c58cd07a9f1 f2fs: fix typo
    b7b7a8df41ef nfsd: return -EINVAL when namelen is 0
    9803ab882d56 nfsd: call cache_put if xdr_reserve_space returns NULL
    85a84de8e360 ntb_perf: Fix printk format
    a429158f2e0a ntb: intel: Fix the NULL vs IS_ERR() bug for debugfs_create_dir()
    35c8e66e7952 RDMA/irdma: fix error message in irdma_modify_qp_roce()
    b11318dc8a1e RDMA/cxgb4: Added NULL check for lookup_atid
    208dba182ee6 riscv: Fix fp alignment bug in perf_callchain_user()
    16eda7c0ce5c RDMA/hns: Optimize hem allocation performance
    3e5a43da4984 RDMA/hns: Fix VF triggering PF reset in abnormal interrupt handler
    4685b6802258 RDMA/hns: Refactor the abnormal interrupt handler function
    254b52a2d7e5 RDMA/hns: Fix the wrong type of return value of the interrupt handler
    55f98f48ee17 RDMA/hns: Remove unused abnormal interrupt of type RAS
    29c0f546d3fd RDMA/hns: Fix spin_unlock_irqrestore() called with IRQs enabled
    b79ddb93ec67 RDMA/hns: Fix the overflow risk of hem_list_calc_ba_range()
    15bcd2dc26d7 RDMA/hns: Don't modify rq next block addr in HIP09 QPC
    bd5f76ccc079 watchdog: imx_sc_wdt: Don't disable WDT in suspend
    1730d47d1865 IB/core: Fix ib_cache_setup_one error flow cleanup
    70ce36ada30b pinctrl: mvebu: Fix devinit_dove_pinctrl_probe function
    255527b8d416 pinctrl: mvebu: Use devm_platform_get_and_ioremap_resource()
    bef565d739cf nfsd: fix refcount leak when file is unhashed after being found
    0b5bc6d1f25f nfsd: remove unneeded EEXIST error check in nfsd_do_file_acquire
    e69b5883ae03 clk: ti: dra7-atl: Fix leak of of_nodes
    0429a4e97208 RDMA/rtrs-clt: Reset cid to con_num - 1 to stay in bounds
    c84af5f5f2ea RDMA/rtrs: Reset hb_missed_cnt after receiving other traffic from peer
    8e5612295811 pinctrl: single: fix missing error code in pcs_probe()
    da0392698c62 RDMA/iwcm: Fix WARNING:at_kernel/workqueue.c:#check_flush_dependency
    9cf0b13a19c8 PCI: xilinx-nwl: Clean up clock on probe failure/removal
    5bbcac07d7e0 PCI: xilinx-nwl: Fix register misspelling
    dc5aeba07395 PCI: keystone: Fix if-statement expression in ks_pcie_quirk()
    86d920d2600c drivers: media: dvb-frontends/rtl2830: fix an out-of-bounds write error
    a879b6cdd481 drivers: media: dvb-frontends/rtl2832: fix an out-of-bounds write error
    9a2d7636af44 Input: ilitek_ts_i2c - add report id message validation
    f448eb55b7ee Input: ilitek_ts_i2c - avoid wrong input subsystem sync
    821332430624 clk: rockchip: Set parent rate for DCLK_VOP clock on RK3228
    7d214562057d remoteproc: imx_rproc: Initialize workqueue earlier
    070d45027c58 remoteproc: imx_rproc: Correct ddr alias for i.MX8M
    30efd7590912 clk: imx: imx8qxp: Parent should be initialized earlier than the clock
    f1046dd07456 clk: imx: imx8qxp: Register dc0_bypass0_clk before disp clk
    03b2049e76f9 clk: imx: imx8mp: fix clock tree update of TF-A managed clocks
    47a121d9d0bd perf time-utils: Fix 32-bit nsec parsing
    dcdbb13ef3b4 perf sched timehist: Fixed timestamp error when unable to confirm event sched_in time
    f73fc46d0816 perf sched timehist: Fix missing free of session in perf_sched__timehist()
    f666eb1bb8a2 perf mem: Free the allocated sort string, fixing a leak
    9dada37c9739 bpf: Fix bpf_strtol and bpf_strtoul helpers for 32bit
    c4f8554996e8 nilfs2: fix potential oob read in nilfs_btree_check_delete()
    42d44163d41b nilfs2: determine empty node blocks as corrupted
    73d23ecf234b nilfs2: fix potential null-ptr-deref in nilfs_btree_insert()
    be2e9b111e27 ext4: avoid OOB when system.data xattr changes underneath the filesystem
    299d996f1031 ext4: return error on ext4_find_inline_entry
    bf4cabdf3a86 ext4: avoid negative min_clusters in find_group_orlov()
    a2037e06b8dc ext4: avoid potential buffer_head leak in __ext4_new_inode()
    9b638bcfff8f ext4: avoid buffer_head leak in ext4_mark_inode_used()
    86964b59b506 smackfs: Use rcu_assign_pointer() to ensure safe assignment in smk_set_cipso
    38c0090658e0 ext4: clear EXT4_GROUP_INFO_WAS_TRIMMED_BIT even mount with discard
    a75b4f3a3dee kthread: fix task state in kthread worker if being frozen
    c37bf4ded344 xz: cleanup CRC32 edits from 2018
    bfea0441a692 selftests/bpf: Fix C++ compile error from missing _Bool type
    aa02db40963b selftests/bpf: Fix error compiling test_lru_map.c
    f40796cda0e6 selftests/bpf: Fix errors compiling cg_storage_multi.h with musl libc
    bf5988a40e10 selftests/bpf: Fix compiling core_reloc.c with musl-libc
    e0fcf564cb6c selftests/bpf: Fix compiling tcp_rtt.c with musl-libc
    a445d939a91c selftests/bpf: Fix compiling flow_dissector.c with musl-libc
    9b548bff0206 selftests/bpf: Fix compiling kfree_skb.c with musl-libc
    0193a67cfb38 selftests/bpf: Fix missing ARRAY_SIZE() definition in bench.c
    ea960f62a3c4 selftests/bpf: Fix error compiling bpf_iter_setsockopt.c with musl libc
    c9a6207a064e selftests/bpf: Fix compile error from rlim_t in sk_storage_map.c
    ebc4e1f4492d tpm: Clean up TPM space after command failure
    07c9cccc4c3f xen/swiotlb: add alignment check for dma buffers
    ed3e8cc9159a xen: use correct end address of kernel for conflict checking
    a8906615f7c8 drivers:drm:exynos_drm_gsc:Fix wrong assignment in gsc_bind()
    0220a2d7d07f drm/msm: fix %s null argument error
    72782ec6f3a1 ipmi: docs: don't advertise deprecated sysfs entries
    9963b910411b drm/msm/a5xx: workaround early ring-buffer emptiness check
    1058abdcfbbc drm/msm: Drop priv->lastctx
    d183881468ce drm/msm/a5xx: fix races in preemption evaluation stage
    b43f548e7593 drm/msm/a5xx: properly clear preemption records on resume
    1dae34bd7529 drm/msm/a5xx: disable preemption in submits by default
    071e6751e828 drm/msm: Fix incorrect file name output in adreno_request_fw()
    18f0b0b16251 powerpc/8xx: Fix kernel vs user address comparison
    a078336d0c67 powerpc/8xx: Fix initial memory mapping
    6f790377ef43 powerpc/32: Remove 'noltlbs' kernel parameter
    1c0e359a5bdf powerpc/32: Remove the 'nobats' kernel parameter
    46184cbbae1e drm/mediatek: Use spin_lock_irqsave() for CRTC event lock
    ead825332785 jfs: fix out-of-bounds in dbNextAG() and diAlloc()
    16a570f07d87 scsi: elx: libefc: Fix potential use after free in efc_nport_vport_del()
    791b3d66d2ef drm/bridge: lontium-lt8912b: Validate mode in drm_bridge_funcs::mode_valid()
    e8a4a2e45ddf drm/radeon/evergreen_cs: fix int overflow errors in cs track offsets
    4d871e3e8dfe drm/rockchip: dw_hdmi: Fix reading EDID when using a forced mode
    b4cb296e6b89 drm/rockchip: vop: Allow 4096px width scaling
    036ab40a0af4 scsi: NCR5380: Check for phase match during PDMA fixup
    c63e92842790 scsi: NCR5380: Add SCp members to struct NCR5380_cmd
    b95955dc8b6d drm/radeon: properly handle vbios fake edid sizing
    26819a5b69b0 drm/radeon: Replace one-element array with flexible-array member
    92734d5e4000 drm/amdgpu: properly handle vbios fake edid sizing
    a1f0111fcf18 drm/amdgpu: Replace one-element array with flexible-array member
    44948d3cb943 drm/amd/display: Add null check for set_output_gamma in dcn30_set_output_transfer_func
    2948bb2951fe drm/stm: Fix an error handling path in stm_drm_platform_probe()
    1d43adec2ed3 pmdomain: core: Harden inter-column space in debug summary
    962c92e46a52 mtd: powernv: Add check devm_kasprintf() returned value
    21d445fd2d6a fbdev: hpfb: Fix an error handling path in hpfb_dio_probe()
    5f54a8669ff0 power: supply: max17042_battery: Fix SOC threshold calc w/ no current sense
    eac72ef92fec power: supply: axp20x_battery: Remove design from min and max voltage
    bb58bae2fd32 hwmon: (ntc_thermistor) fix module autoloading
    a2cb89bb9054 mtd: slram: insert break after errors in parsing the map
    d5c43b103987 hwmon: (max16065) Fix alarm attributes
    d522354ca1c8 hwmon: (max16065) Remove use of i2c_match_id()
    41fe2205aae6 i2c: Add i2c_get_match_data()
    302bb15d87ad hwmon: (max16065) Fix overflows seen when writing limits
    365384c3f078 m68k: Fix kernel_clone_args.flags in m68k_clone()
    d681dae5ecdf clocksource/drivers/qcom: Add missing iounmap() on errors in msm_dt_timer_init()
    4a60b539f70f reset: k210: fix OF node leak in probe() error path
    aaeadde77e4b reset: berlin: fix OF node leak in probe() error path
    dcf11d388fbd ARM: versatile: fix OF node leak in CPUs prepare
    d8539f136c58 ARM: dts: imx7d-zii-rmu2: fix Ethernet PHY pinctrl property
    bb55d5e7f0e9 ARM: dts: microchip: sam9x60: Fix rtc/rtt clocks
    412a519da455 arm64: dts: renesas: r9a07g044: Correct GICD and GICR sizes
    db323e084748 spi: ppc4xx: Avoid returning 0 when failed to parse and map IRQ
    89008d5e4b2f spi: ppc4xx: handle irq_of_parse_and_map() errors
    cc4d21d9492d block: fix potential invalid pointer dereference in blk_add_partition
    a894cf7efda0 block: print symbolic error name instead of error code
    e0c20d88b7dc block, bfq: don't break merge chain in bfq_split_bfqq()
    3883a6873b92 block, bfq: choose the last bfqq from merge chain in bfq_setup_cooperator()
    8aa9de02a4be block, bfq: fix possible UAF for bfqq->bic with merge chain
    67adffd35dda net: tipc: avoid possible garbage value
    1ee3ffd8600a net: ipv6: rpl_iptunnel: Fix memory leak in rpl_input
    613dad98a8c8 r8169: disable ALDPS per default for RTL8125
    ad0af1890919 net: enetc: Use IRQF_NO_AUTOEN flag in request_irq()
    64ad2aac64c8 bareudp: Pull inner IP header on xmit.
    b293c9d81473 geneve: Fix incorrect inner network header offset when innerprotoinherit is set
    446f84d3a74d net: geneve: support IPv4/IPv6 as inner protocol
    2099b709b546 bareudp: Pull inner IP header in bareudp_udp_encap_recv().
    b614fde13162 Bluetooth: btusb: Fix not handling ZPL/short-transfer
    2b3164186e77 can: m_can: m_can_close(): stop clocks after device has been shut down
    9550baada4c8 can: bcm: Clear bo->bcm_proc_read after remove_proc_entry().
    984648aac87a sock_map: Add a cond_resched() in sock_hash_free()
    bf090f4fe935 wifi: wilc1000: fix potential RCU dereference issue in wilc_parse_join_bss_param
    acb53a716e49 wifi: mac80211: use two-phase skb reclamation in ieee80211_do_stop()
    439353e50cb9 wifi: cfg80211: fix two more possible UBSAN-detected off-by-one errors
    95f2c90b826a wifi: mt76: mt7915: fix rx filter setting for bfee functionality
    c8d744549f37 wifi: cfg80211: fix UBSAN noise in cfg80211_wext_siwscan()
    40fb64257dab x86/sgx: Fix deadlock in SGX NUMA node search
    b6e1cdf2d625 cpufreq: ti-cpufreq: Introduce quirks to handle syscon fails appropriately
    3e2b7c9d5ec8 netfilter: nf_tables: remove annotation to access set timeout while holding lock
    b5f97550839d netfilter: nf_tables: reject expiration higher than timeout
    b987e863cfd9 netfilter: nf_tables: reject element expiration with no timeout
    616aa2873969 netfilter: nf_tables: elements with timeout below CONFIG_HZ never expire
    94e8c988468d ACPI: CPPC: Fix MASK_VAL() usage
    895885122cf3 ACPI: bus: Avoid using CPPC if not supported by firmware
    b48ba8089d26 can: j1939: use correct function name in comment
    e53934e36549 padata: Honor the caller's alignment in case of chunk_size 0
    b48560a5c3c2 wifi: iwlwifi: mvm: increase the time between ranging measurements
    d5ecaf72fd26 mount: handle OOM on mnt_warn_timestamp_expiry
    33e460b424b8 fs/namespace: fnic: Switch to use %ptTd
    a6e8d2a06368 mount: warn only once about timestamp range expiration
    b6a9b12e8c72 fs: explicitly unregister per-superblock BDIs
    66663a9d672f wifi: rtw88: remove CPT execution branch never used
    d19865d5f17d net: stmmac: dwmac-loongson: Init ref and PTP clocks rate
    43df8109c701 wifi: ath9k: Remove error checks when creating debugfs entries
    49d8d8e0190a wifi: ath9k: fix parameter check in ath9k_init_debug()
    9dd0cb484cfa ACPI: PMIC: Remove unneeded check in tps68470_pmic_opregion_probe()
    435ec96011f5 crypto: xor - fix template benchmarking
    ceaab3fb64d6 wifi: rtw88: always wait for both firmware loading attempts
    7367e0fea5e6 EDAC/synopsys: Fix error injection on Zynq UltraScale+
    12ee2b3a4fe4 EDAC/synopsys: Fix ECC status and IRQ control race condition
    7e1cf435de0b EDAC/synopsys: Re-enable the error interrupts on v3 hw
    9a9187f364ad EDAC/synopsys: Use the correct register to disable the error interrupt on v3 hw
    28ccc0418205 EDAC/synopsys: Add support for version 3 of the Synopsys EDAC DDR
    0c927dfc0b9b USB: usbtmc: prevent kernel-usb-infoleak
    86b4954483fc USB: serial: pl2303: add device id for Macrosilicon MS3020
    9405d778a49a cgroup: Move rcu_head up near the top of cgroup_root
    c218058f075a gpiolib: cdev: Ignore reconfiguration without direction
    4318608dc28e inet: inet_defrag: prevent sk release while still in use
    c65ab97efcd4 gpio: prevent potential speculation leaks in gpio_device_get_desc()
    e0f67494957f Revert "wifi: cfg80211: check wiphy mutex is held for wdev mutex"
    ded5376ee34b netfilter: nf_tables: missing iterator type in lookup walk
    ce9fef54c5ec netfilter: nft_set_pipapo: walk over current view on netlink dump
    de77545c72c4 cgroup: Make operations on the cgroup root_list RCU safe
    c031d286eceb ocfs2: strict bound check before memcmp in ocfs2_xattr_find_entry()
    5bbe51eaf01a ocfs2: add bounds checking to ocfs2_xattr_find_entry()
    ad98e04b53bb spi: spidev: Add missing spi_device_id for jg10309-01
    4e1b1fceaa1a x86/hyperv: Set X86_FEATURE_TSC_KNOWN_FREQ when Hyper-V provides frequency
    bba8f3393116 spi: bcm63xx: Enable module autoloading
    534f63c5fdcf drm: komeda: Fix an issue related to normalized zpos
    82ead539fb8b spi: spidev: Add an entry for elgin,jg10309-01
    b77954625a03 ASoC: tda7419: fix module autoloading
    f2f5918c7347 ASoC: intel: fix module autoloading
    6a9e652ecb9a wifi: iwlwifi: clear trans->state earlier upon error
    1afed66cb271 wifi: iwlwifi: mvm: don't wait for tx queues if firmware is dead
    a15df5f37fa3 wifi: iwlwifi: mvm: pause TCM when the firmware is stopped
    8f03a04b619a wifi: iwlwifi: mvm: fix iwl_mvm_scan_fits() calculation
    6f19780d1f7d wifi: iwlwifi: lower message level for FW buffer destination
    8e46e6d38e73 net: ftgmac100: Ensure tx descriptor updates are visible
    6f8366122015 microblaze: don't treat zero reserved memory regions as error
    befc2d67f7b8 pinctrl: at91: make it work with current gpiolib
    e69c0100a461 scsi: lpfc: Fix overflow build issue
    04eb0c4957fa ALSA: hda/realtek - FIxed ALC285 headphone no sound
    fe0401442a39 ALSA: hda/realtek - Fixed ALC256 headphone no sound
    2208c2520eb6 ASoC: allow module autoloading for table db1200_pids
    fb0530025d50 ASoC: meson: axg-card: fix 'use-after-free'
    79cce5e81d20 dma-buf: heaps: Fix off-by-one in CMA heap fault handler
    16b3e7addd5b soundwire: stream: Revert "soundwire: stream: fix programming slave ports for non-continous port maps"
    491f9646f7ac spi: nxp-fspi: fix the KASAN report out-of-bounds bug
    38f5db5587c0 net: dpaa: Pad packets to ETH_ZLEN
    ddc7c423c4a5 netfilter: nft_socket: fix sk refcount leaks
    e259f8aabbcc net: ftgmac100: Enable TX interrupt to avoid TX timeout
    8fa298172438 octeontx2-af: Modify SMQ flush sequence to drop packets
    e216ded408f8 octeontx2-af: Set XOFF on other child transmit schedulers during SMQ flush
    16ff08952830 fou: fix initialization of grc
    b503f0045f31 net/mlx5: Add missing masks and QoS bit masks for scheduling elements
    63991ecfe864 net/mlx5: Add IFC bits and enums for flow meter
    0a596903425f net/mlx5: Add support to create match definer
    636de1029485 net/mlx5: Explicitly set scheduling element and TSAR type
    3f8d4d9bffe7 net/mlx5e: Add missing link modes to ptys2ethtool_map
    61964f36349d igb: Always call igb_xdp_ring_update_tail() under Tx lock
    25cf67f8ff2f ice: fix accounting for filters shared by multiple VSIs
    3f796b4d9527 hwmon: (pmbus) Conditionally clear individual status bits for pmbus rev >= 1.2
    7e40afcc6989 hwmon: (pmbus) Introduce and use write_byte_data callback
    87bd31cb7e7a selftests/bpf: Support SOCK_STREAM in unix_inet_redir_to_connected()
    47c5117ac526 eeprom: digsy_mtc: Fix 93xx46 driver probe failure
    f7bfeb689041 arm64: dts: rockchip: fix PMIC interrupt pin in pinctrl for ROCK Pi E
    8fd28e6beb86 fs/ntfs3: Use kvfree to free memory allocated by kvmalloc
    5b2c8b34f6d7 mm: avoid leaving partial pfn mappings around in error case
    b6e5727d262a net: tighten bad gso csum offset check in virtio_net_hdr
    235af50e7cf6 minmax: reduce min/max macro expansion in atomisp driver
    73103e803400 arm64: dts: rockchip: override BIOS_DISABLE signal via GPIO hog on RK3399 Puma
    3554482f4691 mptcp: pm: Fix uaf in __timer_delete_sync
    190b8a6486eb platform/x86: panasonic-laptop: Allocate 1 entry extra in the sinf array
    b7c2f692307f platform/x86: panasonic-laptop: Fix SINF array out of bounds accesses
    3666a2574efa NFS: Avoid unnecessary rescanning of the per-server delegation list
    e796a3db5768 NFSv4: Fix clearing of layout segments in layoutreturn
    2fb6f8948e4d Input: i8042 - add Fujitsu Lifebook E756 to i8042 quirk table
    156ea0823d3c drm/msm/adreno: Fix error return if missing firmware-name
    da69c01768da platform/surface: aggregator_registry: Add support for Surface Laptop Go 3
    18576c701e85 scripts: kconfig: merge_config: config files: add a trailing newline
    7d91a0b2151a HID: multitouch: Add support for GT7868Q
    10c111760128 Input: synaptics - enable SMBus for HP Elitebook 840 G2
    39de55eddf73 Input: ads7846 - ratelimit the spi_sync error message
    f5a73abe62ac btrfs: update target inode's ctime on unlink
    00ef1de6d646 powerpc/mm: Fix boot warning with hugepages and CONFIG_DEBUG_VIRTUAL
    be4e5f5bdc19 net: phy: vitesse: repair vsc73xx autonegotiation
    9ef29b75f5f9 net: ethernet: use ip_hdrlen() instead of bit shift
    d71c5e8cbcf9 usbnet: ipheth: fix carrier detection in modes 1 and 4
    df944dc46d06 ocfs2: fix possible null-ptr-deref in ocfs2_set_buffer_uptodate
    ff55291fb367 ocfs2: fix null-ptr-deref when journal load failed.
    f55a33fe0fb5 ocfs2: remove unreasonable unlock in ocfs2_read_blocks
    4173d1277c00 ocfs2: cancel dqi_sync_work before freeing oinfo
    020f5c53c17f ocfs2: reserve space for inline xattr before attaching reflink tree
    077182694e87 ocfs2: fix uninit-value in ocfs2_get_block()
    ff8875e5f6e9 ocfs2: fix the la space leak when unmounting an ocfs2 volume
    44f79667fefd mm: krealloc: consider spare memory for __GFP_ZERO
    70fee3689ace jbd2: correctly compare tids with tid_geq function in jbd2_fc_begin_commit
    ec7f8337c98a jbd2: stop waiting for space when jbd2_cleanup_journal_tail() returns error
    e60b0d3b5aa2 drm: omapdrm: Add missing check for alloc_ordered_workqueue
    4515773394f9 of/irq: Support #msi-cells=<0> in of_msi_get_domain
    e18d233efa82 parisc: Fix stack start for ADDR_NO_RANDOMIZE personality
    cb94678485d7 parisc: Fix 64-bit userspace syscall path
    6f0605db50e2 clk: imx: Add check for kcalloc
    5b837b9e1543 bpf: Fix the indention issue in grow_stack_state()
    42b62697634d cifs: Fix the calling of smb_version_operations::calc_smb_size()
    b14acf729e9d f2fs: Add inline to f2fs_build_fault_attr() stub
    7c317bec311f f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    81c12119c23f bpf: Fix accesses to uninit stack slots [ Upstream commit 6b4a64bafd107e521c01eec3453ce94a3fb38529 ]
    c4fa05422d87 smb: client: fix potential OOB in smb2_dump_detail()
    299ef3b5b00b of: module: add buffer overflow check in of_modalias()
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index ee39aabbac..92c0ff13ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "282f09eae637932615463274dd0c76a862a7c3d8"
-SRCREV_meta ?= "150b4c5d88b91e848d757c8cad9d841b91163b75"
+SRCREV_machine ?= "c2d5627be67a346327ef3db5cb181b319378819b"
+SRCREV_meta ?= "12ed2d0695e6be3eaa055a0fd776d09093397335"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.167"
+LINUX_VERSION ?= "5.15.168"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 7d3a73d109..ff0d482314 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.167"
+LINUX_VERSION ?= "5.15.168"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f280216b8c5a4795f402e24a31689a6d492d078e"
-SRCREV_meta ?= "150b4c5d88b91e848d757c8cad9d841b91163b75"
+SRCREV_machine ?= "a8680c3f127af3ad9c867eb1a41ae69b39f9628c"
+SRCREV_meta ?= "12ed2d0695e6be3eaa055a0fd776d09093397335"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 9ac3e8368d..c0e976f45c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6eac800fa7a11f4de7a74b578efa0bba47360ded"
-SRCREV_machine:qemuarm64 ?= "866724b5bb6c32f16adb648e4b251227b711ea07"
-SRCREV_machine:qemumips ?= "bbb3f06bae8f8954e6725a75fd693512d91c5f29"
-SRCREV_machine:qemuppc ?= "3e7fae8f2bf9a92ae8c0f7036a070c1e6c5da47c"
-SRCREV_machine:qemuriscv64 ?= "52f5ff9f0af8d552aa6307143e74659e1e21fe6d"
-SRCREV_machine:qemuriscv32 ?= "52f5ff9f0af8d552aa6307143e74659e1e21fe6d"
-SRCREV_machine:qemux86 ?= "52f5ff9f0af8d552aa6307143e74659e1e21fe6d"
-SRCREV_machine:qemux86-64 ?= "52f5ff9f0af8d552aa6307143e74659e1e21fe6d"
-SRCREV_machine:qemumips64 ?= "b8b0a5ddb82108f0cf62676b91a757d233f6fec8"
-SRCREV_machine ?= "52f5ff9f0af8d552aa6307143e74659e1e21fe6d"
-SRCREV_meta ?= "150b4c5d88b91e848d757c8cad9d841b91163b75"
+SRCREV_machine:qemuarm ?= "37475ce625ab568d93acf13a10538ba991e8a6a8"
+SRCREV_machine:qemuarm64 ?= "f01353910df23af6b3be9d6a7108234183c682c2"
+SRCREV_machine:qemumips ?= "65a9ceffd440c955ced497fc6ffa2d2819e617d5"
+SRCREV_machine:qemuppc ?= "49c62f329fc9603c407533587bd5c822f0380e4b"
+SRCREV_machine:qemuriscv64 ?= "d918322631e0d79969629d5479b34cde7a38b284"
+SRCREV_machine:qemuriscv32 ?= "d918322631e0d79969629d5479b34cde7a38b284"
+SRCREV_machine:qemux86 ?= "d918322631e0d79969629d5479b34cde7a38b284"
+SRCREV_machine:qemux86-64 ?= "d918322631e0d79969629d5479b34cde7a38b284"
+SRCREV_machine:qemumips64 ?= "3ece68fdfb8a074a78d7fe6d4f855d5504a87b60"
+SRCREV_machine ?= "d918322631e0d79969629d5479b34cde7a38b284"
+SRCREV_meta ?= "12ed2d0695e6be3eaa055a0fd776d09093397335"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3a5928702e7120f83f703fd566082bfb59f1a57e"
+SRCREV_machine:class-devupstream ?= "584a40a22cb9bf5a03135869f11c3106b6200453"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.167"
+LINUX_VERSION ?= "5.15.168"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


