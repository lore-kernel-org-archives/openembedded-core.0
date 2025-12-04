Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7701D1CDDE
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:42 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35377.1764822639252711058
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aM/qtpch;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8843ebf2facso6823976d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822638; x=1765427438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Us5y22j6bf13Jpz2mYloP18TU1YkapBsMABnfawNKEw=;
        b=aM/qtpchR5CPGew8TJAC484Dna8dv4WjxDhqZYtELj+hwPBUmkz2K9Hue0pJfKaose
         l0ul2Oq9UPX3d7IJwZCkCQpyjBsdshHMJMZ7+M4XmX5sKOmztyFDfkt5MvrZ/fGqknpC
         9QFeIcDjw1PRB0qHHHQDwDzB2xzUhMOX5i3S3VIpH74J3/P+EtY4z3oaS6CLHB1F4GSk
         Z4FfHGdZVhukvxWbjRwDabPrRU6dFO7w6Ms/5nLluir/9vx2eZRU3sbZOOMzZy5mtDdr
         j4hvguDrKMAgk9+ueZCaTWd7fVBeXs6aX9nwZRqMbfIHs1AQn3C7g+8zV4709D3snMY7
         aQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822638; x=1765427438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Us5y22j6bf13Jpz2mYloP18TU1YkapBsMABnfawNKEw=;
        b=ayPgn/C+vnw5I8VzsjDQQ+oSrPAsLmzD2bM/kr+ViBQ/ZRI4RepxxXuTJerGIT9JZQ
         ivugGKS8qkB1t8eMIfGiU/BRiegjt9zSaLkcFs87RZtcxlcbtbQ8mp6QuG4tck5pcSqE
         fbpPe9EV0TOP4iQ0qprfYoAMDMBfZTHNE8qVCBlYmeujQVNqfZk6EElEeuB3Lw/TasKy
         UCF6Lc5z41yJSpKWVrsHDOEtU3lxkHndZvFGUbmc4PQHIkYaYYFw2/SK1W+ssK0dWYmO
         YFhHKveyJaWejW/cbJIOyES45ypBiyBjoIf616RuPHII8aXhGR8Emq6wnXdMprWqZLu3
         Ut8Q==
X-Gm-Message-State: AOJu0Yzcgwa+mTIGd5FLJoD+/FLfv8i6Qf9d55kejRk3iIxq/fseV5/X
	ej7no2p1Q5ri9movGSDl4D9enuJKL5I3ZHpC59deWN566FjQf5V5geeDApKtrBDNq3U=
X-Gm-Gg: ASbGncuktit39RxD/48WzY7uUf9Sue0chIN6m1T/BzDyC/Nr9kf48HcLMzvIi7dnxwO
	nEF78YUOELluVkZk1zu8n9jVl5B3iFsJ3eKHoDZn4BPlbiazF4BKHoIfe7Z7FPIA8QtQ8AVxAce
	5TbUWL2+cO4UFMQymkDqLFWw8s5ZG3JtaVt99FC6nDXgeWqHW8RsANkte8JJ6wc/VyXW5QGjGBv
	Y45pRY29ZukYQbBMvlXX5/QqS2QdbrFhTjgqOmoJzmcH9QLSZdmw0YIOVEd7sl6JPYZAn8wz3wQ
	WWtb/ngTRpNUveeFcGUKwFZLwdjMmT25f8uBn8N21ByBi3Tqc6yIncPbwpuAX/PIMsljKhB0/2k
	e1DAvm02ujbQzNMeogNZyVOBuMuV4D+7LCLmjdYAgzYW2Twt1SY+Fzm95Xbg8D8qqUj5KpsFA29
	ugPxme4/9F38yp9fUFTifJ/xdrLECM76tlsrAR9E3q+/FBIsKHwtDKuO6MKtQRvcojxuSMABGW9
	HOSzOy6vATCIjVgEc/VbiqbCA==
X-Google-Smtp-Source: AGHT+IFnC9gavCG0h05WmT5PRBIthH6A95pIs7/lxC1IBxjQeyqy0E9hAoW+D7H18wSMIS7Zxs4zVQ==
X-Received: by 2002:a05:6214:4981:b0:882:3b63:f7fc with SMTP id 6a1803df08f44-88819588e79mr76425436d6.36.1764822637797;
        Wed, 03 Dec 2025 20:30:37 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:36 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/16] linux-yocto/6.17: update to v6.17.8
Date: Wed,  3 Dec 2025 23:30:17 -0500
Message-Id: <1ddbd56561b60eb76ac95786c84eb1220e9d0f85.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227256

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.17 to the latest korg -stable release that comprises
the following commits:

    8ac42a63c561a Linux 6.17.8
    2706516c999c1 dt-bindings: eeprom: at25: use "size" for FRAMs without device ID
    cdf7022a5d3cf selftests: drv-net: Reload pkt pointer after calling filter_udphdr
    c42338b9d1172 drm/amd/display: Fix black screen with HDMI outputs
    bc215236e37bd drm/amd/display: use GFP_NOWAIT for allocation in interrupt handler
    b47260ed4debb drm/amd/display: Reject modes with too high pixel clock on DCE6-10
    896bceea3bcc9 drm/msm/dpu: Fix adjusted mode clock check for 3d merge
    b993999a20140 drm/amdgpu/userq: assign an error code for invalid userq va
    77d8c1e520e30 drm/amdgpu: Fix function header names in amdgpu_connectors.c
    9ea5d978a3c02 drm/amd/display: Fix vupdate_offload_work doc
    1b60457c2c514 drm/amdgpu: Fix unintended error log in VCN5_0_0
    039018bcb340b kbuild: Strip trailing padding bytes from modules.builtin.modinfo
    7fa9e0ee49170 ACPI: SPCR: Check for table version when using precise baudrate
    8c845ed3cd13c ALSA: hda/tas2781: Enable init_profile_id for device initialization
    365184e242575 kunit: Extend kconfig help text for KUNIT_UML_PCI
    224165dfd5c04 extcon: adc-jack: Cleanup wakeup source only if it was enabled
    df0a86a3153ef drm/amd/display: update color on atomic commit time
    df96dbe1af7f6 scsi: ufs: core: Fix invalid probe error return value
    dbd6c27d45b9a scsi: ufs: core: Add a quirk to suppress link_startup_again
    cf09ef5918e54 scsi: ufs: ufs-pci: Set UFSHCD_QUIRK_PERFORM_LINK_STARTUP_ONCE for Intel ADL
    9ab4cf7a9405f scsi: ufs: ufs-pci: Fix S0ix/S3 for Intel controllers
    798983faa2330 lib/crypto: curve25519-hacl64: Fix older clang KASAN workaround for GCC
    1f05ead877ff3 virtio_net: fix alignment for virtio_net_hdr_v1_hash
    3e9d89f2ecd36 virtio-net: fix received length check in big packets
    ab29b26db1ea0 drm/amdkfd: Don't clear PT after process killed
    c05fe5d47baac drm/amd/display: Fix NULL deref in debugfs odm_combine_segments
    429385da90db9 drm/amdgpu/smu: Handle S0ix for vangogh
    852542c559b15 drm/nouveau: Advertise correct modifiers on GB20x
    6c19a8cbfd98f drm: define NVIDIA DRM format modifiers for GB20x
    4c6b56a76478b x86/CPU/AMD: Add missing terminator for zen5_rdseed_microcode
    77a1fb9d17afd xfs: fix various problems in xfs_atomic_write_cow_iomap_begin
    8e31320fd1c3a xfs: fix delalloc write failures in software-provided atomic writes
    c4ad899a33198 x86/amd_node: Fix AMD root device caching
    6b8c512811644 perf/core: Fix system hang caused by cpu-clock usage
    bdb596ceb4b7c smb: client: fix potential UAF in smb2_close_cached_fid()
    826ce37a84263 io_uring: fix regbuf vector size truncation
    c43fe1e6d79d9 smb: client: validate change notify buffer before copy
    62e15fd31c9e2 x86/microcode/AMD: Add more known models to entry sign checking
    34c40428a5e3b rtc: rx8025: fix incorrect register reference
    009270208f764 parisc: Avoid crash due to unaligned access in unwinder
    fa22279da370c riscv: Fix memory leak in module_frob_arch_sections()
    dbf316fc90aa9 iommufd: Don't overflow during division for dirty tracking
    3a50d59b3781b Bluetooth: MGMT: Fix OOB access in parse_adv_monitor_pattern()
    3e8ada4fd838e drm/sched: Fix deadlock in drm_sched_entity_kill_jobs_cb
    dde026c5d2a58 fscrypt: fix left shift underflow when inode->i_blkbits > PAGE_SHIFT
    d03fea3a60096 wifi: mac80211: use wiphy_hrtimer_work for csa.switch_work
    e81bd3b1843d9 wifi: mac80211: use wiphy_hrtimer_work for ttlm_work
    b8113bb56c45b platform/x86: int3472: Fix double free of GPIO device during unregister
    898d7299e0adc wifi: mac80211: use wiphy_hrtimer_work for ml_reconf_work
    5f82abea9a36f wifi: cfg80211: add an hrtimer based delayed work item
    723ebd5ed7f70 drm/amd/display: Enable mst when it's detected but yet to be initialized
    a7b35dbd4b5a4 tracing: Fix memory leaks in create_field_var()
    8224cc7b34627 selftests/vsock: avoid false-positives when checking dmesg
    c6c9c32d73811 net: bridge: fix MST static key usage
    991fbe1680cd4 net: bridge: fix use-after-free due to MST port state bypass
    3ac743c60ec50 lan966x: Fix sleeping in atomic context
    8803d2f90c9d4 net: dsa: microchip: Fix reserved multicast address table programming
    6f0295765f074 net: wan: framer: pef2256: Switch to devm_mfd_add_devices()
    11def028ae430 net/mlx5e: SHAMPO, Fix header formulas for higher MTUs and 64K pages
    aadec7f9c4d08 net/mlx5e: SHAMPO, Fix skb size check for 64K pages
    d02b4dd8990ba net/mlx5e: SHAMPO, Fix header mapping for 64K pages
    3cacaffff2171 net: ti: icssg-prueth: Fix fdb hash size configuration
    ff8be497dc213 net/mlx5e: Fix return value in case of module EEPROM read error
    fe9cf295ba305 io_uring: fix types for region size calulation
    ca88aca10d44a wifi: mac80211_hwsim: Limit destroy_on_close radio removal to netgroup
    06742a3ab884d netpoll: Fix deadlock in memory allocation under spinlock
    e26c9cce35e3b bnxt_en: Fix warning in bnxt_dl_reload_down()
    3df5b2289490f bnxt_en: Always provide max entry and entry size in coredump segments
    689ae5ba31293 bnxt_en: Fix null pointer dereference in bnxt_bs_trace_check_wrap()
    5c2289bad2557 bnxt_en: Fix a possible memory leak in bnxt_ptp_init
    1a8a15c3f71d1 bnxt_en: Shutdown FW DMA in bnxt_shutdown()
    8ab3b8f958d86 net: usb: qmi_wwan: initialize MAC header offset in qmimux_rx_fixup
    3af1510a33ff2 octeontx2-pf: Fix devm_kcalloc() error checking
    af048f7bd8e87 net: ionic: map SKB after pseudo-header checksum prep
    dbaafbef83d0f net: ionic: add dma_wmb() before ringing TX doorbell
    e791743714a3b sctp: Hold sock lock while iterating over address list
    89eac1e150dbd sctp: Prevent TOCTOU out-of-bounds write
    164b75dc9e253 sctp: Hold RCU read lock while iterating over address list
    465b77730d750 net: dsa: b53: properly bound ARL searches for < 4 ARL bin chips
    a991025c998ca net: dsa: b53: stop reading ARL entries if search is done
    f7036dc9f4f06 net: dsa: b53: fix enabling ip multicast
    d779413fb2165 net: dsa: b53: fix bcm63xx RGMII port link adjustment
    7c7cbf2f61757 net: dsa: b53: fix resetting speed and pause on forced link
    dc8ed3823473b net: mdio: Check regmap pointer returned by device_node_to_regmap()
    3c91c8f424d3e gpiolib: fix invalid pointer access in debugfs
    25decf0469d4c gpio: swnode: don't use the swnode's name as the key for GPIO lookup
    ff70aa7e8cf05 netconsole: Acquire su_mutex before navigating configs hierarchy
    ddf03fbe8326f net: vlan: sync VLAN features with lower device
    cc606bdda90ac selftests: netdevsim: Fix ethtool-coalesce.sh fail by installing ethtool-common.sh
    c972bdc060650 selftests/net: use destination options instead of hop-by-hop
    c3c907e5b15a7 selftests/net: fix out-of-order delivery of FIN in gro:tcp test
    848208b85aee0 net: dsa: tag_brcm: legacy: fix untagged rx on unbridged ports for bcm63xx
    c9efb03ff4fae gve: Implement settime64 with -EOPNOTSUPP
    96ec90412ceb5 gve: Implement gettimex64 with -EOPNOTSUPP
    08e38cee9be56 Bluetooth: btrtl: Fix memory leak in rtlbt_parse_firmware_v2()
    1a0ddaaf97405 Bluetooth: hci_event: validate skb length for unknown CC opcode
    6eca4d45fc8dc scsi: ufs: core: Revert "Make HID attributes visible"
    73ddbe20b8383 Revert "wifi: ath12k: Fix missing station power save configuration"
    fd8ee6c0cd04d riscv: ptdump: use seq_puts() in pt_dump_seq_puts() macro
    2c8d2b53866fb riscv: stacktrace: Disable KASAN checks for non-current tasks
    34c845d0f907e scsi: ufs: core: Fix a race condition related to the "hid" attribute group
    93e52b75f11a8 net: libwx: fix device bus LAN ID
    6f5c4f8109fa4 ring-buffer: Do not warn in ring_buffer_map_get_reader() when reader catches up
    d9168cda12ff5 tracing: tprobe-events: Fix to put tracepoint_user when disable the tprobe
    5b30f8e69da31 tracing: tprobe-events: Fix to register tracepoint correctly
    0db5f1497269d Revert "wifi: ath10k: avoid unnecessary wait for service ready message"
    72223700b6208 drm/mediatek: Disable AFBC support on Mediatek DRM driver
    e819b34df0a70 media: videobuf2: forbid remove_bufs when legacy fileio is active
    7b1289ca5ca97 media: uvcvideo: Use heuristic to find stream entity
    54a5b5a15588e btrfs: ensure no dirty metadata is written back for an fs with errors
    8634e9cbefdf4 rust: kbuild: treat `build_error` and `rustdoc` as kernel objects
    d484e915056a0 rust: kbuild: workaround `rustdoc` doctests modifier bug
    e033d62c353b1 rust: devres: fix private intra-doc link
    923ffdc635037 rust: condvar: fix broken intra-doc link
    4ebf02e01d742 x86: uaccess: don't use runtime-const rewriting in modules
    ca3da8b27ab9a ceph: fix multifs mds auth caps issue
    1b65ccff4021f ceph: refactor wake_up_bit() pattern of calling
    035df850cdaa9 ceph: fix potential race condition in ceph_ioctl_lazyio()
    496961aa4b75e ceph: add checking of wait_for_completion_killable() return value
    eba3906b85ffc drm/amdgpu: Report individual reset error
    f7569ef1cf978 drm/amdkfd: Fix mmap write lock not release
    158e43f999e59 ASoC: rt722: add settings for rt722VB
    ac6b19b4c87a0 ASoC: meson: aiu-encoder-i2s: fix bit clock polarity
    cc48afe1df98c kbuild: uapi: Strip comments before size type check
    5e56e51a7015b net: wwan: t7xx: add support for HP DRMR-H01
    c9aac4c5f46eb rtc: pcf2127: fix watchdog interrupt mask on pcf2131
    e825c583a262d rtc: zynqmp: Restore alarm functionality after kexec transition
    dfe6c9a3b6c84 ALSA: hda/realtek: Add quirk for ASUS ROG Zephyrus Duo
    2d1359e11674e fbdev: Add bounds checking in bit_putcs to fix vmalloc-out-of-bounds
    3cc8161f91bab tools: lib: thermal: use pkg-config to locate libnl3
    e5c5a7c0c3f60 tools: lib: thermal: don't preserve owner in install
    80ae305c82ad9 tools bitmap: Add missing asm-generic/bitsperlong.h include
    7b23dafb9daf5 LoongArch: Handle new atomic instructions for probes
    7b8bb62e12c02 ACPI: property: Return present device nodes only on fwnode interface
    f3964e93e3494 fbdev: core: Fix ubsan warning in pixel_to_pat
    b0bdab70c6366 scsi: ufs: core: Include UTP error in INT_FATAL_ERRORS
    05f1fcac17a4a 9p: sysfs_init: don't hardcode error to ENOMEM
    eefea729934f4 cpufreq: tegra186: Initialize all cores to max frequencies
    7e438c9d91189 9p: fix /sys/fs/9p/caches overwriting itself
    82b7e707e8b78 NTB: epf: Allow arbitrary BAR mapping
    625946cb334a7 clk: clocking-wizard: Fix output clock register offset for Versal platforms
    d3e3c24500840 clk: scmi: Add duty cycle ops only when duty cycle is supported
    d0be867b1fbd5 clk: ti: am33xx: keep WKUP_DEBUGSS_CLKCTRL enabled
    242531004d7de 9p/trans_fd: p9_fd_request: kick rx thread if EPOLLIN
    9f596279a9e6e clk: at91: clk-sam9x60-pll: force write to PLL_UPDT register
    e8e06b7797f67 clk: at91: clk-master: Add check for divide by 3
    b115b9accaec8 clk: at91: sam9x7: Add peripheral clock id for pmecc
    468f72d56f86d clk: at91: add ACR in all PLL settings
    cdec28dde5e7f ARM: at91: pm: save and restore ACR during PLL disable/enable
    72896f8583411 rtc: pcf2127: clear minute/second interrupt
    cb6bfe5421cd1 clk: sunxi-ng: sun6i-rtc: Add A523 specifics
    2baa22558084e um: Fix help message for ssl-non-raw
    b019352d2b6cf hyperv: Add missing field to hv_output_map_device_interrupt
    78d6283bad906 clocksource: hyper-v: Skip unnecessary checks for the root partition
    33f9fab3c20bb fs/hpfs: Fix error code for new_inode() failure in mkdir/create/mknod/symlink
    2d5f900f4fcfb clk: samsung: exynos990: Add missing USB clock registers to HSI0
    47d153274bd67 clk: renesas: rzv2h: Re-assert reset on deassert timeout
    bdec5e01fc2f3 clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL
    7add29381ef12 clk: qcom: gcc-ipq6018: rework nss_port5 clock to multiple conf
    ad48bd796924f btrfs: mark dirty extent range for out of bound prealloc extents
    a4d9ebe23bcb7 btrfs: fix memory leak of qgroup_list in btrfs_add_qgroup_relation
    00b56d28dd7f7 RDMA/hns: Fix wrong WQE data when QP wraps around
    ac63f8ebcd7ca RDMA/hns: Fix the modification of max_send_sge
    2f6e922dd9f4b RDMA/hns: Fix recv CQ and QP cache affinity
    fe7dc8ffb453a RDMA/uverbs: Fix umem release in UVERBS_METHOD_CQ_CREATE
    48d81eedb9a59 RDMA/irdma: Set irdma_cq cq_num field during CQ create
    a08966dba4835 RDMA/irdma: Remove unused struct irdma_cq fields
    ad705e9424e9f RDMA/irdma: Fix SD index calculation
    3bf2fbd869899 RDMA/bnxt_re: Fix a potential memory leak in destroy_gsi_sqp
    24e4530fd6b5e ACPICA: Update dsmethod.c to get rid of unused variable warning
    e47502609971b drm/amd/display: Add fallback path for YCBCR422
    71b38354f0d39 usb: xhci-pci: Fix USB2-only root hub registration
    02aa671c08a48 ima: don't clear IMA_DIGSIG flag when setting or removing non-IMA xattr
    84489ac3b20f1 smb: client: transport: avoid reconnects triggered by pending task work
    064ff81c51e88 smb: client: update cfid->last_access_time in open_cached_dir_by_dentry()
    e3ba9392fc6a4 ksmbd: use sock_create_kern interface to create kernel socket
    bda7b709af5d6 net/mlx5e: Prevent entering switchdev mode with inconsistent netns
    7e3c96010ade2 ftrace: Fix softlockup in ftrace_module_enable
    c2ca015ac109f orangefs: fix xattr related buffer overflow...
    6af18a2c0cc59 page_pool: Clamp pool size to max 16K pages
    f90e4358e3ab2 6pack: drop redundant locking and refcounting
    13c1d24803d5b exfat: validate cluster allocation bits of the allocation bitmap
    6a7bbbb289271 exfat: limit log print for IO error
    1f7766917b4ac net: stmmac: est: Drop frames causing HLBS error
    55c1519fca830 Bluetooth: bcsp: receive data only if registered
    394266c4544aa Bluetooth: btusb: Add new VID/PID 13d3/3633 for MT7922
    391f83547b7b2 Bluetooth: SCO: Fix UAF on sco_conn_free
    2689df9ba357e Bluetooth: ISO: Use sk_sndtimeo as conn_timeout
    e7d1cad6545c0 Bluetooth: btusb: Check for unexpected bytes when defragmenting HCI frames
    7204774fbc0c1 Bluetooth: ISO: Don't initiate CIS connections if there are no buffers
    763d35d333d24 Bluetooth: btintel_pcie: Define hdev->wakeup() callback
    2115edc993036 Bluetooth: btusb: Add new VID/PID 13d3/3627 for MT7925
    1f0eecc84643f net: macb: avoid dealing with endianness in macb_set_hwaddr()
    998037897119c Bluetooth: btintel: Add support for BlazarIW core
    6da7b466cfcca net/mlx5e: Don't query FEC statistics when FEC is disabled
    285e43849f7f6 selftest: net: Fix error message if empty variable
    28743a11c8f12 vfio/nvgrace-gpu: Add GB300 SKU to the devid table
    8a8c9bfc45162 vfio/pci: Fix INTx handling on legacy non-PCI 2.3 devices
    0452a94143944 platform/x86: x86-android-tablets: Stop using EPROBE_DEFER
    a52c7789eb5b3 ACPI: scan: Update honor list for RPMI System MSI
    362685bc52d23 ASoC: tlv320aic3x: Fix class-D initialization for tlv320aic3007
    536d80f660ec1 amd/amdkfd: enhance kfd process check in switch partition
    560163312fda1 ASoC: stm32: sai: manage context in set_sysclk callback
    9f747663000c6 drm/amdgpu: Fix fence signaling race condition in userqueue
    00310d6316e51 drm/amdgpu: Add fallback to pipe reset if KCQ ring reset fails
    2f89a2d15550b amd/amdkfd: resolve a race in amdgpu_amdkfd_device_fini_sw
    a809967214894 ext4: increase IO priority of fastcommit
    009127b0fc013 fs: ext4: change GFP_KERNEL to GFP_NOFS to avoid deadlock
    9af01df3e26c0 ASoC: renesas: msiof: set SIFCTR register
    b4d2d28f2bc13 ASoC: renesas: msiof: tidyup DMAC stop timing
    ba7d41f2ba416 ASoC: renesas: msiof: use reset controller
    6ec31b2ee31d8 ASoC: renesas: msiof: add .symmetric_xxx on snd_soc_dai_driver
    73c7c2cdb442f accel/habanalabs: support mapping cb with vmalloc-backed coherent memory
    7005921ad6fbb accel/habanalabs/gaudi2: read preboot status after recovering from dirty state
    09edad3c0fbb1 accel/habanalabs: return ENOMEM if less than requested pages were pinned
    e36fcddbaee89 scsi: mpt3sas: Add support for 22.5 Gbps SAS link rate
    602709a3ce303 accel/habanalabs/gaudi2: fix BMON disable configuration
    df2147b81a572 scsi: libfc: Fix potential buffer overflow in fc_ct_ms_fill()
    18d25d3b4fb02 scsi: ufs: core: Change MCQ interrupt enable flow
    8bfc441a72470 net: phy: dp83640: improve phydev and driver removal handling
    d9d94cd43cdbb net: bridge: Install FDB for bridge MAC on VLAN 0
    f5e570eaab36a nfs4_setup_readdir(): insufficient locking for ->d_parent->d_inode dereferencing
    bb612fabf2d41 NFSv4.1: fix mount hang after CREATE_SESSION failure
    20f36b053e738 NFSv4: handle ERR_GRACE on delegation recalls
    cc4a81cd5a95f drm/amd/display: change dc stream color settings only in atomic commit
    8a00c4161ff77 drm/amd/display: Fix for test crash due to power gating
    cb06ae7afec45 drm/amd/display: Init dispclk from bootup clock for DCN314
    cb416dfc2752e drm/amd/display: Add fast sync field in ultra sleep more for DMUB
    5177779831e1a drm/amd/display: Add AVI infoframe copy in copy_stream_update_to_stream
    c357381ab9d2c drm/amd/display: Add missing post flip calls
    58acd0fa3a6e7 ovl: make sure that ovl_create_real() returns a hashed dentry
    7f3df9e527c56 tcp: Update bind bucket state on port release
    fa50d10d51c68 ALSA: usb-audio: don't apply interface quirk to Presonus S1824c
    8a960e7fdf746 bng_en: make bnge_alloc_ring() self-unwind on failure
    686fd7bad842e net: dsa: microchip: Set SPI as bus interface during reset for KSZ8463
    8678a25b7abd2 wifi: ath12k: Increase DP_REO_CMD_RING_SIZE to 256
    1481e8482a250 remoteproc: qcom: q6v5: Avoid handling handover twice
    8879883c9bda4 selftests: forwarding: Reorder (ar)ping arguments to obey POSIX getopt
    482b19eee596d PCI/PM: Skip resuming to D0 if device is disconnected
    87ad049fd1670 ASoC: ops: improve snd_soc_get_volsw
    d14942e9af68d crypto: hisilicon/qm - clear all VF configurations in the hardware
    6b2e9ce1d89d1 crypto: hisilicon/qm - invalidate queues in use
    a9c6cb47c4827 ptp_ocp: make ptp_ocp driver compatible with PTP_EXTTS_REQUEST2
    f3d2bc112b147 vfio: return -ENOTTY for unsupported device feature
    3c550bbc9626f sparc64: fix prototypes of reads[bwl]()
    ddcd1704ffd90 sparc/module: Add R_SPARC_UA64 relocation handling
    363448d069e29 PCI: cadence: Check for the existence of cdns_pcie::ops before using it
    cb3687adf5ddf r8169: set EEE speed down ratio to 1
    573c6d1802afd net: intel: fm10k: Fix parameter idx set but not used
    47b6bd446f400 wifi: mac80211: Track NAN interface start/stop
    cea8dced270e3 wifi: mac80211: Get the correct interface for non-netdev skb status
    040effd554cbc iommu/vt-d: Remove LPIG from page group response descriptor
    d908f39b8c91b wifi: ath10k: Fix connection after GTK rekeying
    2f2fae44eaa6a iommu/vt-d: Replace snprintf with scnprintf in dmar_latency_snapshot()
    27fef5d5937a9 bus: mhi: core: Improve mhi_sync_power_up handling for SYS_ERR state
    d74e67fd40f4a net: ethernet: microchip: sparx5: make it selectable for ARCH_LAN969X
    a1b44f9317acc net: phy: clear link parameters on admin link down
    b7913eaf6ff6f ASoC: qcom: sc8280xp: explicitly set S16LE format in sc8280xp_be_hw_params_fixup()
    997e28d3d00a1 drm/amdgpu/atom: Check kcalloc() for WS buffer in amdgpu_atom_execute_table_locked()
    aab8d2fa21d65 mei: make a local copy of client uuid in connect
    038861414ab38 jfs: fix uninitialized waitqueue in transaction manager
    8d6a9cbd276b3 jfs: Verify inode mode when loading from disk
    6276efa156516 bnxt_en: Add fw log trace support for 5731X/5741X chips
    fe36c0496eb78 IB/ipoib: Ignore L3 master device
    d99785a49870b RDMA/irdma: Update Kconfig
    e50f29f40bedb ipv6: np->rxpmtu race annotation
    58d6fd0471a36 usb: xhci-pci: add support for hosts with zero USB3 ports
    d2702b8dd1cdf wifi: rtw89: renew a completion for each H2C command waiting C2H event
    6b2b29ac69e03 wifi: rtw89: obtain RX path from ppdu status IE00
    9e2617afee6c1 wifi: rtw89: disable RTW89_PHYSTS_IE09_FTR_0 for ppdu status
    f4c31adcb2a05 f2fs: fix infinite loop in __insert_extent_tree()
    9484a8a0852a3 usb: xhci: plat: Facilitate using autosuspend for xhci plat devices
    2cc651be5b6ec usb: mon: Increase BUFF_MAX to 64 MiB to support multi-MB URBs
    d346157fc40dc allow finish_no_open(file, ERR_PTR(-E...))
    47c5304f1f9d1 scsi: lpfc: Ensure PLOGI_ACC is sent prior to PRLI in Point to Point topology
    6b576b77cd5bc scsi: lpfc: Define size of debugfs entry for xri rebalancing
    8fdbcb7561c6b scsi: lpfc: Remove ndlp kref decrement clause for F_Port_Ctrl in lpfc_cleanup
    bb8fa90d4ed94 scsi: lpfc: Check return status of lpfc_reset_flush_io_context during TGT_RESET
    ec4ae686c4cff scsi: lpfc: Decrement ndlp kref after FDISC retries exhausted
    2882a24d41047 scsi: lpfc: Clean up allocated queues when queue setup mbox commands fail
    61fdae2f1dce0 scsi: ufs: core: Disable timestamp functionality if not supported
    e5862f6d57f77 selftests/Makefile: include $(INSTALL_DEP_TARGETS) in clean target to clean net/lib dependency
    57a6f5cf63711 drm/amdgpu: reject gang submissions under SRIOV
    ad99109b54c06 drm/xe/guc: Return an error code if the GuC load fails
    89613a35e562c tools: ynl-gen: validate nested arrays
    cdea590eecc33 hinic3: Fix missing napi->dev in netif_queue_set_napi
    fffe8ed743c74 hinic3: Queue pair endianness improvements
    3c652ec829127 HID: i2c-hid: Resolve touchpad issues on Dell systems during S4
    af83d7cbe4df5 scsi: ufs: ufs-qcom: Disable lane clocks during phy hibern8
    49eedae2b984c ethernet: Extend device_get_mac_address() to use NVMEM
    ab48dc0e23eb7 page_pool: always add GFP_NOWARN for ATOMIC allocations
    a1ff3141ff291 net: phy: clear EEE runtime state in PHY_HALTED/PHY_ERROR
    3ebccbd727baa drm/amd/display/dml2: Guard dml21_map_dc_state_into_dml_display_cfg with DC_FP_START
    2803b6a6e1448 drm/amd/display: Disable VRR on DCE 6
    7b7fc6693a240 drm/amd/display: Fix DVI-D/HDMI adapters
    aa92197d6cdf5 drm/amd/display: Keep PLL0 running on DCE 6.0 and 6.4
    5b7ace5ffe2a7 drm/amd/display: Don't use non-registered VUPDATE on DCE 6
    fa64a152508c8 drm/amd: Avoid evicting resources at S5
    1e7f0aee2f022 drm/amd/display: fix dml ms order of operations
    a33a30d990cb7 drm/amd/display: Set up pixel encoding for YCBCR422
    404140aba3222 drm/amd/display: Fix DMCUB loading sequence for DCN3.2
    cfee28ef80e15 drm/amdgpu: Release hive reference properly
    5a577de86c4a1 drm/amdgpu: validate userq buffer virtual address and size
    cef94220f02cb drm/amdgpu: Use memdup_array_user in amdgpu_cs_wait_fences_ioctl
    e287b909fc77d wifi: mt76: improve phy reset on hw restart
    9d45bad8c7cbf wifi: mt76: use altx queue for offchannel tx on connac+
    9ef945d1107ee wifi: mt76: mt7996: disable promiscuous mode by default
    937bf331f563a wifi: mt76: mt7996: fix memory leak on mt7996_mcu_sta_key_tlv error
    73b9a78c624ec ALSA: serial-generic: remove shared static buffer
    0076b94781afa wifi: mt76: mt76_eeprom_override to int
    91a5a48702e94 wifi: mt76: mt7996: support writing MAC TXD for AddBA Request
    94063d67d6257 wifi: mt76: mt7996: Temporarily disable EPCS
    fd8784dbf48b4 wifi: mt76: mt7996: Set def_wcid pointer in mt7996_mac_sta_init_link()
    4f522a2dc1b26 wifi: mt76: mt7996: Fix mt7996_reverse_frag0_hdr_trans for MLO
    a3533a6103ecd wifi: mt76: mt7925: add pci restore for hibernate
    7c3376f9c1e7a wifi: mt76: mt7921: Add 160MHz beamformee capability for mt7922 device
    cb47b93f03860 net/cls_cgroup: Fix task_get_classid() during qdisc run
    9d58aa3d2e3ad ionic: use int type for err in ionic_get_module_eeprom_by_page
    51304da80935c net: mana: Reduce waiting time if HWC not responding
    4429fb1e2c5be can: rcar_canfd: Update bit rate constants for RZ/G3E and R-Car Gen4
    ac18c2c78df88 crypto: caam - double the entropy delay interval for retry
    b2e54b1c1672a crypto: ccp - Fix incorrect payload size calculation in psp_poulate_hsti()
    364454379f60e PCI: dwc: Verify the single eDMA IRQ in dw_pcie_edma_irq_verify()
    8d45c5197774b crypto: sun8i-ce - remove channel timeout field
    47e276b9ebff5 watchdog: s3c2410_wdt: Fix max_timeout being calculated larger
    8db20d5fa1b90 HID: asus: add Z13 folio to generic group for multitouch to work
    3c3b148bf8384 udp_tunnel: use netdev_warn() instead of netdev_WARN()
    48bd421186f80 selftests: net: lib.sh: Don't defer failed commands
    a4a49dde12c6d net: devmem: expose tcp_recvmsg_locked errors
    8fa73b4bf746c selftests: Replace sleep with slowwait
    6618243bcc3f6 PCI/AER: Fix NULL pointer access by aer_info
    f6a94d641f46a eth: 8139too: Make 8139TOO_PIO depend on !NO_IOPORT_MAP
    cc9b23e0a710d selftests: Disable dad for ipv6 in fcnal-test.sh
    aec28aa85b394 x86/virt/tdx: Use precalculated TDVPR page physical address
    94846f7d77425 x86/kvm: Prefer native qspinlock for dedicated vCPUs irrespective of PV_UNHALT
    482cdd3135f0e netfilter: nf_reject: don't reply to icmp error messages
    7c0254dc9b96d openrisc: Add R_OR1K_32_PCREL relocation type module support
    6701d66a159ea selftests: traceroute: Return correct value on failure
    d2ce5aff4f2b3 selftests: traceroute: Use require_command()
    5cfa95e863c5a platform/x86/amd/pmf: Fix the custom bios input handling mechanism
    47c51a26add81 media: redrat3: use int type to store negative error codes
    d675a112af11a selftests: net: replace sleeps in fcnal-test with waits
    683a5bc3d1578 net: sh_eth: Disable WoL if system can not suspend
    dc6a56b41e930 drm/msm/registers: Generate _HI/LO builders for reg64
    ffe7379030d66 phy: rockchip: phy-rockchip-inno-csidphy: allow writes to grf register 0
    4801c622f8683 phy: renesas: r8a779f0-ether-serdes: add new step added to latest datasheet
    929531518b533 Fix access to video_is_primary_device() when compiled without CONFIG_VIDEO
    de8cd8ac8dab3 phy: cadence: cdns-dphy: Enable lower resolutions in dphy
    0f1f546f3eaf1 fbcon: Use screen info to find primary device
    fb233d66d1fc6 wifi: mac80211: Fix HE capabilities element check
    23a2935b20e7e wifi: cfg80211: update the time stamps in hidden ssid
    57534db1bbc4c ntfs3: pretend $Extend records as regular files
    0be426684281f scsi: ufs: host: mediatek: Fix adapt issue after PA_Init
    eef0c0ba480c1 scsi: ufs: host: mediatek: Disable auto-hibern8 during power mode changes
    1323030fcab06 scsi: ufs: host: mediatek: Correct system PM flow
    79e74da09142e net: phy: marvell: Fix 88e1510 downshift counter errata
    35344b306d513 scsi: ufs: host: mediatek: Enhance recovery on hibernation exit failure
    dda10c28847c4 scsi: ufs: host: mediatek: Fix unbalanced IRQ enable issue
    e9b0909f1aeff scsi: ufs: ufs-qcom: Align programming sequence of Shared ICE for UFS controller v5
    b6f7828c1f75f scsi: ufs: host: mediatek: Enhance recovery on resume failure
    5a4f1a9db4bc3 selftests: mptcp: join: allow more time to send ADD_ADDR
    bdaa7ad3a5bb6 drm/amdgpu: validate userq input args
    1040ad5bb2b9a f2fs: fix wrong layout information on 16KB page
    a4e7fda4891ff drm/xe/guc: Always add CT disable action during second init step
    a0ae4b3563351 drm/bridge: write full Audio InfoFrame
    f1876ecec412e media: qcom: camss: csiphy-3ph: Add CSIPHY 2ph DPHY v2.0.1 init sequence
    c94782583924f media: i2c: og01a1b: Specify monochrome media bus format instead of Bayer
    5f4cfb4b99b10 media: ov08x40: Fix the horizontal flip control
    bd8d046c601c6 drm/xe/i2c: Enable bus mastering
    4faf0adfa3b14 wifi: iwlwifi: fw: Add ASUS to PPAG and TAS list
    364152abc7ce9 wifi: rtw89: Add USB ID 2001:3327 for D-Link AX18U rev. A1
    58d8f871ed6b7 wifi: rtw89: Add USB ID 2001:332a for D-Link AX9U rev. A1
    63f62b69abd41 PCI: endpoint: pci-epf-test: Limit PCIe BAR size for fixed BARs
    3e1f74e9fa105 selftests: net: make the dump test less sensitive to mem accounting
    ed498f3609eef idpf: link NAPIs to queues
    469b6b0813e2a drm/msm/a6xx: Switch to GMU AO counter
    ea44af1bd8d64 drm/msm/adreno: Add fenced regwrite support
    74b1cdb13f8b9 drm/msm/adreno: Add speedbin data for A623 GPU
    ecf56bb1997e0 char: Use list_del_init() in misc_deregister() to reinitialize list pointer
    1ceaafdf202e0 drm/msm: make sure to not queue up recovery more than once
    13ce82e062f0e dt-bindings: display/msm/gmu: Update Adreno 623 bindings
    36d85c2a139bf drm/msm: Fix 32b size truncation
    fe3c95e7ad0b1 drm/msm/adreno: Add speedbins for A663 GPU
    f65b2bd0cd91c eeprom: at25: support Cypress FRAMs without device ID
    98ec880a8598f tty/vt: Add missing return value for VT_RESIZE in vt_ioctl()
    b0a5b4959c34f serdev: Drop dev_pm_domain_detach() call
    7a18bdbafe151 serial: qcom-geni: Add DFS clock mode support to GENI UART driver
    fdf573c517627 usb: cdns3: gadget: Use-after-free during failed initialization and exit of cdnsp gadget
    98fefd9729fa9 usb: gadget: f_hid: Fix zero length packet transfer
    4fd8c3b76b6d4 net: dsa: felix: support phy-mode = "10g-qxgmii"
    e2e2a093eecd4 selftests: ncdevmem: don't retry EFAULT
    e39af94cbd8f5 drm/amd/display: Indicate when custom brightness curves are in use
    39d6ad4cdb995 drm/amd/pm: refine amdgpu pm sysfs node error code
    8e909b4f0a017 drm/amd/display: dont wait for pipe update during medupdate/highirq
    d22e31a1a46ca drm/amd/display: Fix pbn_div Calculation Error
    1b507e4a7adf8 drm/amdgpu: add support for cyan skillfish gpu_info
    6d51d035ea693 drm/amdgpu: don't enable SMU on cyan skillfish
    7071f3c695b11 drm/amd: add more cyan skillfish PCI ids
    eb559e430041e drm/amdgpu: Correct info field of bad page threshold exceed CPER
    df42e29132596 bus: mhi: host: pci_generic: Add support for all Foxconn T99W696 SKU variants
    5fb21754cb84a iommu/apple-dart: Clear stream error indicator bits for T8110 DARTs
    67438edce4e49 crypto: ccp: Skip SEV and SNP INIT for kdump boot
    e1ee7dbd34c02 iommu/amd: Reuse device table for kdump
    fa20630c4988f iommu/amd: Skip enabling command/event buffers for kdump
    653398d19a345 iommu/amd: Add support to remap/unmap IOMMU buffers for kdump
    c3235825284da drm/xe: improve dma-resv handling for backup object
    08e9fd78ba1b9 drm/gpusvm: fix hmm_pfn_to_map_order() usage
    a8d9bb3bf41d9 smsc911x: add second read of EEPROM mac when possible corruption seen
    c42221a8de595 net: call cond_resched() less often in __release_sock()
    ce2f59140950a drm/xe/guc: Set upper limit of H2G retries over CTB
    f1053f8395710 PCI: imx6: Enable the Vaux supply if available
    df72ac3e61962 ALSA: usb-audio: apply quirk for MOONDROP Quark2
    762468d8db04d platform/x86/intel-uncore-freq: Present unique domain ID per package
    ef6446c3f75dc platform/x86: think-lmi: Add extra TC BIOS error messages
    5495f28064efa wifi: mac80211: Fix 6 GHz Band capabilities element advertisement in lower bands
    62dbedd6b6b60 media: verisilicon: Explicitly disable selection api ioctls for decoders
    0aac92cdad160 media: adv7180: Only validate format in querystd
    e6308d99d54d9 media: adv7180: Do not write format to device in set_fmt
    4ff0ef7fad330 media: adv7180: Add missing lock in suspend callback
    8a0db8aa14bcd net: nfc: nci: Increase NCI_DATA_TIMEOUT to 3000 ms
    4624dfe5e7452 netlink: specs: fou: change local-v6/peer-v6 check
    c7b97fcf1d40d ixgbe: reduce number of reads when getting OROM data
    8733f89f24248 drm: panel-backlight-quirks: Make EDID match optional
    5e302584d803f drm/panthor: check bo offset alignment in vm bind
    905bfe0664f13 wifi: mac80211: count reg connection element in the size
    e5665d687c1ce drm/xe: Extend Wa_22021007897 to Xe3 platforms
    6d78eb366de5f ipv6: Add sanity checks on ipv6_devconf.rpl_seg_enabled
    6d3e1ee45d1c4 selftests: drv-net: rss_ctx: make the test pass with few queues
    2711524e3ca5d move_mount(2): take sanity checks in 'beneath' case into do_lock_mount()
    d251d54a26694 drm/amd/pm: Increase SMC timeout on SI and warn (v3)
    f7524faa94986 drm/xe/guc: Increase GuC crash dump buffer size
    24469566312d3 drm/amdgpu: Allow kfd CRIU with no buffer objects
    3ee32ef0af761 drm/msm/dsi/phy_7nm: Fix missing initial VCO rate
    6fe3349074277 drm/msm/dsi/phy: Toggle back buffer resync after preparing PLL
    81be30dfdec8c netfilter: nf_tables: all transaction allocations can now sleep
    cada05ac8ffba dmaengine: dw-edma: Set status for callback_result
    4d6e88850714c dmaengine: mv_xor: match alloc_wc and free_wc
    71e581cc1b1d8 dmaengine: sh: setup_xref error handling
    52faa05fcd9f7 drm/xe/guc: Add devm release action to safely tear down CT
    ee7ddc9382957 ptp: Limit time setting of PTP clocks
    1a72b11e881c4 drm/st7571-i2c: add support for inverted pixel format
    7685a76fa19fd wifi: iwlwifi: pcie: remember when interrupts are disabled
    029914306b93b media: nxp: imx8-isi: Fix streaming cleanup on release
    983dce2d4c5ea media: imx-mipi-csis: Only set clock rate when specified in DT
    ba085a9d8ae38 scsi: ufs: exynos: fsd: Gate ref_clk and put UFS device in reset on suspend
    907a75bffc8e3 iio: adc: ad7124: do not require mclk
    20921a4ecf8db scsi: pm8001: Use int instead of u32 to store error codes
    c9cfe6058a877 crypto: qat - use kcalloc() in qat_uclo_map_objs_from_mof()
    06da08d9355bf tcp: use dst_dev_rcu() in tcp_fastopen_active_disable_ofo_check()
    28c96ce273541 microchip: lan865x: add ndo_eth_ioctl handler to enable PHY ioctl support
    af9e9aad8ca8a inet_diag: annotate data-races in inet_diag_bc_sk()
    b549b15c16525 mips: lantiq: danube: rename stp node on EASY50712 reference board
    0cfd836683623 mips: lantiq: xway: sysctrl: rename stp clock
    0b95b5277446f mips: lantiq: danube: add missing device_type in pci node
    0fc3bc64970e2 mips: lantiq: danube: add model to EASY50712 dts
    b841bdb2ffa75 mips: lantiq: danube: add missing properties to cpu node
    93392aba88ede drm/amdgpu: Respect max pixel clock for HDMI and DVI-D (v2)
    f9422b246ec88 drm/amdgpu: Avoid vcn v5.0.1 poison irq call trace on sriov guest
    19f52266ed83f drm/amd/display: incorrect conditions for failing dto calculations
    e44b31b0854ad drm/amdgpu: Avoid jpeg v5.0.1 poison irq call trace on sriov guest
    3796a7feb1e70 drm/amd/display: Increase minimum clock for TMDS 420 with pipe splitting
    f712d871ab849 drm/amdgpu: Notify pmfw bad page threshold exceeded
    0197fa9da35b2 ASoC: SOF: ipc4-pcm: Add fixup for channels
    80936ea142b97 media: pci: mgb4: Fix timings comparison in VIDIOC_S_DV_TIMINGS
    dedfff2f4973c media: fix uninitialized symbol warnings
    93758f6e562fb selftests: drv-net: rss_ctx: fix the queue count check
    a2cd421d5d014 drm/msm: Use of_reserved_mem_region_to_resource() for "memory-region"
    8157d5f06ba2d drm/msm/dpu: Filter modes based on adjusted mode clock
    35b9336260968 platform/x86/intel-uncore-freq: Fix warning in partitioned system
    9967cbc2a34d4 wifi: iwlwifi: mld: trigger mlo scan only when not in EMLSR
    2b58eec23eae7 eth: fbnic: Reset hw stats upon PCI error
    402904bfe3e52 net: Prevent RPS table overwrite of active flows
    5fe51260a5208 drm/xe: Cancel pending TLB inval workers on teardown
    2dc9e2a642de9 drm/amdgpu/vpe: cancel delayed work in hw_fini
    7563050a3bd70 drm/amd/display: Consider sink max slice width limitation for dsc
    5f5007c06c0c9 drm/amd/display: wait for otg update pending latch before clock optimization
    041da1290e265 drm/amdkfd: Tie UNMAP_LATENCY to queue_preemption
    508193c0c229d drm/amd/display: Support HW cursor 180 rot for any number of pipe splits
    ae60b1f826a5b drm/amdkfd: fix vram allocation failure for a special case
    ec79674ca9466 drm/amdgpu: Correct the counts of nr_banks and nr_errors
    582d38cc9f24f drm/amdgpu: Correct the loss of aca bank reg info
    daa59c1c083cc misc: pci_endpoint_test: Skip IRQ tests if irq is out of range
    1efe0fe3913e8 drm/xe: Ensure GT is in C0 during resumes
    f59ec0a02463f selftests: pci_endpoint: Skip IRQ test if IRQ is out of range.
    513321e218b39 virtio_fs: fix the hash table using in virtio_fs_enqueue_req()
    4fc7274108783 fuse: zero initialize inode private data
    165d2ec10d997 selftests: drv-net: hds: restore hds settings
    c4f0e17720e13 net: phy: fixed_phy: let fixed_phy_unregister free the phy_device
    e46e9b20e223f drm/xe/wcl: Extend L3bank mask workaround
    47023a8124155 remoteproc: wkup_m3: Use devm_pm_runtime_enable() helper
    8b0bce2959de4 drm/xe: Set GT as wedged before sending wedged uevent
    403873cd0bb4b extcon: axp288: Fix wakeup source leaks on device unbind
    9d909bc7b4e88 extcon: fsa9480: Fix wakeup source leaks on device unbind
    6bef9ced21585 extcon: adc-jack: Fix wakeup source leaks on device unbind
    d31b2fa31de87 scsi: pm80xx: Fix race condition caused by static variables
    8dada4b66aec2 scsi: mpi3mr: Fix controller init failure on fault during queue creation
    ef33d9cd912c6 scsi: mpi3mr: Fix I/O failures during controller reset
    0a3ad5bb1e5c2 wifi: rtw89: coex: Limit Wi-Fi scan slot cost to avoid A2DP glitch
    d44c4154b18b1 scsi: mpi3mr: Fix device loss during enclosure reboot due to zero link speed
    b03d98e7bd329 net: ipv4: allow directed broadcast routes to use dst hint
    1829dcd3d2b29 rpmsg: char: Export alias for RPMSG ID rpmsg-raw from table
    a22a6e679ec72 media: ipu6: isys: Set embedded data type correctly for metadata formats
    03cb283ccd657 iio: imu: bmi270: Match PNP ID found on newer GPD firmware
    e8c475c76c212 net: wangxun: limit tx_max_coalesced_frames_irq
    8bd2ba22d2640 rds: Fix endianness annotation for RDS_MPATH_HASH
    012445943545b drm/panel: ilitek-ili9881c: move display_on/_off dcs calls to (un-)prepare
    c7b7dbcb98c85 drm/panel: ilitek-ili9881c: turn off power-supply when init fails
    e496b2cf6b400 drm/xe/pcode: Initialize data0 for pcode read routine
    3a0738fadf037 idpf: do not linearize big TSO packets
    7d273f77c99f2 Octeontx2-af: Broadcast XON on all channels
    d9a83c5811ef3 ALSA: usb-audio: Add validation of UAC2/UAC3 effect units
    96c87440bdf8e tty: serial: Modify the use of dev_err_probe()
    768764868ab8f bnxt_en: Add Hyper-V VF ID
    a065556994261 PCI/P2PDMA: Fix incorrect pointer usage in devm_kfree() call
    adbcb34f03abb f2fs: fix to detect potential corrupted nid in free_nid_list
    2e4aee4b61038 dmaengine: idxd: Add a new IAA device ID for Wildcat Lake family platforms
    ab88593830b6b net: Call trace_sock_exceed_buf_limit() for memcg failure with SK_MEM_RECV.
    1aa319e0f12d2 net: stmmac: Correctly handle Rx checksum offload errors
    8108f42ab1ad9 net: When removing nexthops, don't call synchronize_net if it is not necessary
    38e77897bcd17 char: misc: Does not request module for miscdevice with dynamic minor
    1f99717593c98 char: misc: Make misc_register() reentry for miscdevice who wants dynamic minor
    c764ac2def4e4 dm error: mark as DM_TARGET_PASSES_INTEGRITY
    03a2ec1febf45 wifi: rtw89: 8851b: rfk: update IQK TIA setting
    037cc7e1e3693 wifi: rtw89: fix BSSID comparison for non-transmitted BSSID
    42cdbc10d24d4 wifi: rtw89: wow: remove notify during WoWLAN net-detect
    041205cf7bc0f drm/xe: Make page size consistent in loop
    4ad10b1119aad ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers
    128bf29c99298 ASoC: Intel: avs: Do not share the name pointer between components
    2ae1e7104382e ASoC: es8323: add proper left/right mixer controls via DAPM
    ded5c61b91de1 ASoC: es8323: remove DAC enablement write from es8323_probe
    757e38a490f9a usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
    a46813be01e64 iio: adc: imx93_adc: load calibrated values even calibration failed
    01ab16213b070 iio: adc: spear_adc: mask SPEAR_ADC_STATUS channel and avg sample before setting register
    60c035d2be828 hwrng: timeriomem - Use us_to_ktime() where appropriate
    90d9dd7e0fdfa drm/amdgpu: refactor bad_page_work for corner case handling
    790c701078cc4 drm/amdkfd: Handle lack of READ permissions in SVM mapping
    273d1ea12e42e drm/amdgpu: fix nullptr err of vm_handle_moved
    de68849113b98 drm/bridge: display-connector: don't set OP_DETECT for DisplayPorts
    931bd004381f1 HID: pidff: PERMISSIVE_CONTROL quirk autodetection
    66be625a93b7a HID: pidff: Use direction fix only for conditional effects
    a26e36c5eed9a drm/panthor: Serialize GPU cache flush operations
    f7f3ecb4934ff media: imon: make send_packet() more robust
    b056f971bd72b net: ipv6: fix field-spanning memcpy warning in AH output
    c6d8afd4a4ff1 gpu: nova-core: register: allow fields named `offset`
    9ac79185ed90b scsi: ufs: host: mediatek: Fix invalid access in vccqx handling
    013e09f45d64a scsi: ufs: host: mediatek: Change reset sequence for improved stability
    0e091c540fe63 scsi: ufs: host: mediatek: Assign power mode userdata before FASTAUTO mode change
    08b92c37eeb5a scsi: ufs: host: mediatek: Fix PWM mode switch issue
    abcd6915c022e scsi: ufs: host: mediatek: Fix auto-hibern8 timer configuration
    77d11a808e7fc net: phy: mscc: report and configure in-band auto-negotiation for SGMII/QSGMII
    cd3011094de4f selftests: drv-net: wait for carrier
    de5bf99ad0d85 bridge: Redirect to backup port when port is administratively down
    8be2452c91073 s390/pci: Use pci_uevent_ers() in PCI recovery
    061fbb01076d1 powerpc/eeh: Use result of error_detected() in uevent
    86ddc4a08c528 ASoC: es8323: enable DAPM power widgets for playback DAC and output
    77a196ca904d6 tty: serial: ip22zilog: Use platform device for probing
    42886dbc49e2c thunderbolt: Use is_pciehp instead of is_hotplug_bridge
    452e6bf5342d3 ice: Don't use %pK through printk or tracepoints
    938828d73af3b net: stmmac: Check stmmac_hw_setup() in stmmac_resume()
    94449679ce8ef x86/vsyscall: Do not require X86_PF_INSTR to emulate vsyscall
    3c490bc30e969 PCI/ERR: Update device error_state already after reset
    5fe8a47147407 media: i2c: Kconfig: Ensure a dependency on HAVE_CLK for VIDEO_CAMERA_SENSOR
    a259cd63b9ee8 RDMA/mana_ib: Drain send wrs of GSI QP
    ac43d2e2bbc57 drm/tidss: Remove early fb
    5e9ad60947569 drm/tidss: Set crtc modesetting parameters with adjusted mode
    333776ae37102 drm/bridge: cdns-dsi: Don't fail on MIPI_DSI_MODE_VIDEO_BURST
    74d25a79f2e2e drm/bridge: cdns-dsi: Fix REG_WAKEUP_TIME value
    54f6cce304e7b drm/tidss: Use the crtc_* timings when programming the HW
    8d6bbca5e7dda media: amphion: Delete v4l2_fh synchronously in .release()
    12fde2177be8c media: pci: ivtv: Don't create fake v4l2_fh
    66ecaa43e91e9 selftests: drv-net: devmem: flip the direction of Tx tests
    6035e1413e5d7 selftests: drv-net: devmem: add / correct the IPv6 support
    6cf92b484b4c5 drm/amdkfd: return -ENOTTY for unsupported IOCTLs
    a6440ccd72e22 wifi: rtw89: add dummy C2H handlers for BCN resend and update done
    63998ebfdb0cc wifi: rtw88: sdio: use indirect IO for device registers before power-on
    91bab307fa5da wifi: rtw89: print just once for unknown C2H events
    f29fc3bf20a85 selftests/net: Ensure assert() triggers in psock_tpacket.c
    8730996e9ab42 selftests/net: Replace non-standard __WORDSIZE with sizeof(long) * 8
    163564ca1b4aa drm/panel-edp: Add SHP LQ134Z1 panel for Dell XPS 9345
    dd602d44db3bb drm/nouveau: always set RMDevidCheckIgnore for GSP-RM
    c4b519a034cc5 PCI: Disable MSI on RDC PCI to PCIe bridges
    ccffcbf8e09ff drm/sharp-memory: Do not access GEM-DMA vaddr directly
    0f889675c57a1 docs: kernel-doc: avoid script crash on ancient Python
    67cce15b190d8 drm/xe: rework PDE PAT index selection
    5a738b99d9cfe drm/amd/display: Wait until OTG enable state is cleared
    7fc4489174041 drm/amdgpu: add to custom amdgpu_drm_release drm_dev_enter/exit
    8bd8551e4d0da drm/amd/display: Reset apply_eamless_boot_optimization when dpms_off
    46ff4ec5f5f4c ASoC: mediatek: Use SND_JACK_AVOUT for HDMI/DP jacks
    3a5fb922c5618 ASoC: tas2781: Add keyword "init" in profile section
    75e8987dce918 drm/nouveau: replace snprintf() with scnprintf() in nvkm_snprintbf()
    0a7fec33cbbef drm/xe/pf: Program LMTT directory pointer on all GTs within a tile
    5edea8416e497 drm/amdgpu/jpeg: Hold pg_lock before jpeg poweroff
    bfe6e7a2a84b1 accel/amdxdna: Unify pm and rpm suspend and resume callbacks
    3b44ac9694f37 drm/amd/pm: Use cached metrics data on arcturus
    28d545c165e55 drm/amd/pm: Use cached metrics data on aldebaran
    e3d2a19a2cf09 drm/amd/display: update dpp/disp clock from smu clock table
    09250b6e73b88 drm/amd/display: fix dmub access race condition
    2384304de368e drm/amdgpu: skip mgpu fan boost for multi-vf
    a4d47177112e9 drm/amdgpu: Initialize jpeg v5_0_1 ras function
    70725c6240eab drm/amd/display: add more cyan skillfish devices
    06f882edd04ee drm/amdgpu: Skip poison aca bank from UE channel
    0ba48df62596e drm/xe: Extend wa_13012615864 to additional Xe2 and Xe3 platforms
    09b875b338c1b drm/amdgpu: Fix vcn v5.0.1 poison irq call trace
    b7f9d79bb57b3 drm/amd/amdgpu: Release xcp drm memory after unplug
    ff2c7994e8f3e drm/amdgpu: Effective health check before reset
    1590b008bf7de drm/amdgpu: Avoid rma causes GPU duplicate reset
    fdbc2d56fcd23 drm/amdgpu: Update IPID value for bad page threshold CPER
    d92dc17bbe729 drm/amdgpu: Fix build error when CONFIG_SUSPEND is disabled
    cef5ad8748fb9 drm/xe/pf: Don't resume device from restart worker
    29a3064f9c5a9 drm/xe: Fix oops in xe_gem_fault when running core_hotunplug test.
    024cf8587cbce drm/xe/guc: Add more GuC load error status codes
    9ecd238e8230e drm/amd/display: Cache streams targeting link when performing LT automation
    bda0b99d00345 drm/amd/display: Fix dmub_cmd header alignment
    70de7e02c6569 drm/amd/display: Increase AUX Intra-Hop Done Max Wait Duration
    7965cb3606551 drm/amd/display: Move setup_stream_attribute
    8f5936356a7a0 drm/amd/display: Remove check DPIA HPD status for BW Allocation
    a38af6ab21a1f drm/amdgpu: Check vcn sram load return value
    68aa28834ff25 drm/amdgpu: add range check for RAS bad page address
    626a89e482db4 drm/amd/display: ensure committing streams is seamless
    fd9dad1d73e57 drm/amd/display: fix condition for setting timing_adjust_pending
    88084925a6f55 drm/amd/display: Update tiled to tiled copy command
    adbeae33ffe1d drm/xe/configfs: Enforce canonical device names
    79033c5e0c20a drm/xe/ptl: Apply Wa_16026007364
    8edbdb9e96e36 mfd: intel-lpss: Add Intel Wildcat Lake LPSS PCI IDs
    b8f8d27922409 mfd: cs42l43: Move IRQ enable/disable to encompass force suspend
    2e559b1279384 mfd: core: Increment of_node's refcount before linking it to the platform device
    eaec8466703c8 mfd: macsmc: Add "apple,t8103-smc" compatible
    09d0fff93f8f8 mfd: da9063: Split chip variant reading in two bus transactions
    c4530545e9a7a mfd: madera: Work around false-positive -Wininitialized warning
    0334f2dd0930e mfd: qnap-mcu: Include linux/types.h in qnap-mcu.h shared header
    1f5e7ca0fdf98 mfd: qnap-mcu: Handle errors returned from qnap_mcu_write
    de61dc5fcd6ab mfd: stmpe-i2c: Add missing MODULE_LICENSE
    d8a3c649e1a5b mfd: stmpe: Remove IRQ domain upon removal
    3652c8b9f5265 mfd: simple-mfd-i2c: Add compatible strings for Layerscape QIXIS FPGA
    6fa4c7fbef608 tools/power x86_energy_perf_policy: Prefer driver HWP limits
    94744f287c43b tools/power x86_energy_perf_policy: Enhance HWP enable
    1548c1c59d098 tools/power x86_energy_perf_policy: Fix incorrect fopen mode usage
    322a7def4aaa4 tools/power turbostat: Fix incorrect sorting of PMT telemetry
    f80cb9f0a0170 selftests/bpf: Fix flaky bpf_cookie selftest
    7b3183d2ae939 tools/cpupower: Fix incorrect size in cpuidle_state_disable()
    165e0c1aa7103 hwmon: (dell-smm) Add support for Dell OptiPlex 7040
    9b3d6ed629a8d hwmon: (dell-smm) Remove Dell Precision 490 custom config data
    8794d7e93d716 hwmon: (asus-ec-sensors) increase timeout for locking ACPI mutex
    f745f315be69c uprobe: Do not emulate/sstep original instruction when ip is changed
    9829067919584 nvme: Use non zero KATO for persistent discovery connections
    80413e2866dad selftests: drv-net: Pull data before parsing headers
    de13a2f870473 bpf: Clear pfmemalloc flag when freeing all fragments
    db0e5ba6625d1 riscv: bpf: Fix uninitialized symbol 'retval_off'
    0585b24d71197 blk-cgroup: fix possible deadlock while configuring policy
    612495b32cdb8 clocksource/drivers/timer-rtl-otto: Do not interfere with interrupts
    a105ec25d6c57 clocksource/drivers/timer-rtl-otto: Work around dying timers
    a654de814f800 clocksource/drivers/vf-pit: Replace raw_readl/writel to readl/writel
    a3e510755f84c ACPI: SPCR: Support Precise Baud Rate field
    bf1588cd4280f spi: rpc-if: Add resume support for RZ/G3E
    fc4f3a7c8ec50 selftests: ublk: fix behavior when fio is not installed
    1d07acea66b53 selftests/bpf: Fix selftest verifier_arena_large failure
    b524455a51feb futex: Don't leak robust_list pointer on exec race
    e1eefae44601d cpuidle: Fail cpuidle device registration if there is one already
    f988d57f7291a bpftool: Fix -Wuninitialized-const-pointer warnings with clang >= 21
    810afeb76dae8 power: supply: qcom_battmgr: handle charging state change notifications
    c6b5caf11dacd pmdomain: apple: Add "apple,t8103-pmgr-pwrstate"
    0345c24b9b395 io_uring/zcrx: account niov arrays to cgroup
    5f41eb9b317a3 tools/cpupower: fix error return value in cpupower_write_sysfs()
    910f3c2443bc9 io_uring/zcrx: check all niovs filled with dma addresses
    b13e199e4b475 i3c: dw: Add shutdown support to dw_i3c_master driver
    2212651199cb1 video: backlight: lp855x_bl: Set correct EPROM start for LP8556
    9f1229c8f164f rust: kunit: allow `cfg` on `test`s
    f048d9ee9a03a i3c: mipi-i3c-hci-pci: Add support for Intel Wildcat Lake-U I3C
    d83df2fab8058 bpf: Do not limit bpf_cgroup_from_id to current's namespace
    31c19084df475 selftests/bpf: Fix arena_spin_lock selftest failure
    cbb6a5243d64e kunit: Enable PCI on UML without triggering WARN()
    a2f7fa75c4a2a nvme-fc: use lock accessing port_state and rport state
    c09ac9a63fc3a nvmet-fc: avoid scheduling association deletion twice
    f8c3397788f63 tee: allow a driver to allocate a tee_device without a pool
    bf70f1c6a595f ACPICA: dispatcher: Use acpi_ds_clear_operands() in acpi_ds_call_control_method()
    d2844edbf27d7 pwm: pca9685: Use bulk write to atomicially update registers
    8c0c2c995b9c1 mmc: sdhci-msm: Enable tuning for SDR50 mode for SD card
    f574d6122786a soc: ti: k3-socinfo: Add information for AM62L SR1.1
    c3f954cf52601 firmware: qcom: tzmem: disable sc7180 platform
    9dc55f17923e9 ARM: tegra: transformer-20: fix audio-codec interrupt
    8075feaa5c04c ARM: tegra: transformer-20: add missing magnetometer interrupt
    f62a6879d7cca ARM: tegra: p880: set correct touchscreen clipping
    79bcb61b9b03c soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups
    71a9d5f14fad5 arm64: zynqmp: Revert usb node drive strength and slew rate for zcu106
    d1f60799a170c arm64: zynqmp: Disable coresight by default
    74986b07dc26e cpufreq: ondemand: Update the efficient idle check for Intel extended Families
    a4da5317cf6e9 irqchip/loongson-pch-lpc: Use legacy domain for PCH-LPC IRQ controller
    fb03efa1692bc block: check for valid bio while splitting
    bac3bc3550e7d selftests/bpf: Fix incorrect array size calculation
    d9fa3a81b0403 hwmon: sy7636a: add alias
    f54f7bb644899 io_uring/rsrc: respect submitter_task in io_register_clone_buffers()
    129e59feb5cb9 power: supply: sbs-charger: Support multiple devices
    2a4aa93a82c11 pinctrl: keembay: release allocated memory in detach path
    0e06adcd6c7d7 pinctrl: renesas: rzg2l: Add suspend/resume support for Schmitt control registers
    dc8eab29b1592 hwmon: (sbtsi_temp) AMD CPU extended temperature range support
    85971c560f965 hwmon: (lenovo-ec-sensors) Update P8 supprt
    0bf12556a9976 hwmon: (k10temp) Add device ID for Strix Halo
    0a59e141dc9e4 hwmon: (k10temp) Add thermal support for AMD Family 1Ah-based models
    675da371288ec power: supply: qcom_battmgr: add OOI chemistry
    3dc9abe4e7c0a thermal: intel: selftests: workload_hint: Mask unsupported types
    ab853509f3edb thermal: gov_step_wise: Allow cooling level to be reduced earlier
    9d65e2a1665db ACPI: scan: Add Intel CVS ACPI HIDs to acpi_ignore_dep_ids[]
    3ce7276c1f746 ACPI: resource: Skip IRQ override on ASUS Vivobook Pro N6506CU
    6bf67b78a26f7 ACPI: PRM: Skip handlers with NULL handler_address or NULL VA
    8712e166a1c82 irqchip/gic-v2m: Handle Multiple MSI base IRQ Alignment
    76343c0b525cc selftests/bpf: Upon failures, exit with code 1 in test_xsk.sh
    1c56c4ed57101 arc: Fix __fls() const-foldability via __builtin_clzl()
    f305c1c437dab kselftest/arm64: tpidr2: Switch to waitpid() over wait4()
    00ace13105744 firmware: qcom: scm: Allow QSEECOM on Dell Inspiron 7441 / Latitude 7455
    809cf2a7794ca cpufreq/longhaul: handle NULL policy in longhaul_exit
    98524618629c7 arm64: versal-net: Update rtc calibration value
    71c2548a51845 selftests/bpf: Fix bpf_prog_detach2 usage in test_lirc_mode2
    eadee37283111 libbpf: Fix USDT SIB argument handling causing unrecognized register error
    59b95f18cf371 ACPI: video: force native for Lenovo 82K8
    386ad0b397ff8 ACPI: sysfs: Use ACPI_FREE() for freeing an ACPI object
    d664a3ce3a604 io_uring/zctx: check chained notif contexts
    fd06538d8fc11 irqchip/loongson-eiointc: Route interrupt parsed from bios table
    5bf8cb4a1e2bd irqchip/sifive-plic: Respect mask state when setting affinity
    ff35d2d052d45 firewire: ohci: move self_id_complete tracepoint after validating register
    3a274f142ad83 firmware: ti_sci: Enable abort handling of entry to LPM
    d945a3c33977a bpf: Use tnums for JEQ/JNE is_branch_taken logic
    69a073c6df03d cpufreq: ti: Add support for AM62D2
    af633eeeef030 memstick: Add timeout to prevent indefinite waiting
    fe653f9f1fdb5 mmc: host: renesas_sdhi: Fix the actual clock
    6a6613f968c9e pinctrl: single: fix bias pull up/down handling in pin_config_set
    ad67d4d8fd357 mmc: sdhci: Disable SD card clock before changing parameters
    c5b5d71cd9176 bpf: Don't use %pK through printk
    9b1857e6a4482 soc: ti: pruss: don't use %pK through printk
    5f63e8a11eaef spi: spi-qpic-snand: handle 'use_ecc' parameter of qcom_spi_config_cw_read()
    929a89b3aa5e4 spi: loopback-test: Don't use %pK through printk
    b4965033df8c8 soc: qcom: smem: Fix endian-unaware access of num_entries
    168787897cb60 firmware: qcom: scm: preserve assign_mem() error return value
    71ba3ef2fcb78 soc: aspeed: socinfo: Add AST27xx silicon IDs
    30880e9df2733 usb: gadget: f_fs: Fix epfile null pointer access after ep enable.
    d71fc931c4ae2 mfd: kempld: Switch back to earlier ->init() behavior
    4ddf7293928cb PM: sleep: Allow pm_restrict_gfp_mask() stacking
    17fe3b27d055c PM: hibernate: Combine return paths in power_down()
    ef14be6774d3f cpuidle: governors: menu: Select polling state in some more cases
    a6b0fae1784ce cpuidle: governors: menu: Rearrange main loop in menu_select()
    7d6d10eee01ed mptcp: fix MSG_PEEK stream corruption
    1943b49e9f046 mptcp: leverage skb deferral free
    1abb92fc59d01 drm/amd/display: Add HDR workaround for a specific eDP
    41ec9e0f7978c drm/amd/display: Don't program BLNDGAM_MEM_PWR_FORCE when CM low-power is disabled on DCN30
    d7f6128288438 drm/amd/display: Fix incorrect return of vblank enable on unconfigured crtc
    c940c473ef225 drm/amd: Check that VPE has reached DPM0 in idle handler
    02f36acce4bc1 drm/ast: Clear preserved bits from register output value
    2606dfd971347 drm/i915/dmc: Clear HRR EVT_CTL/HTP to zero on ADL-S
    8ba827e09eb58 drm/mediatek: Fix device use-after-free on unbind
    8c8fc6496b90f drm/nouveau: Fix race in nouveau_sched_fini()
    2f02495fb7690 drm/sched: Fix race in drm_sched_entity_select_rq()
    54eebe7be0fbd drm/sched: avoid killing parent entity on child SIGKILL
    c7d5e69866bbe drm/sysfb: Do not dereference NULL pointer in plane reset
    c977473be4a96 drm/xe: Do not wake device during a GT reset
    1e7eaf55aeb74 s390/mm: Fix memory leak in add_marker() when kvrealloc() fails
    d4a8238e57295 s390: Disable ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
    54f938d9f5693 s390/pci: Avoid deadlock between PCI error recovery and mlx5 crdump
    7604dfcddcd1c regmap: irq: Correct documentation of wake_invert flag
    b65f3303349ea regmap: slimbus: fix bus_context pointer in regmap init calls
    710a72e81a702 perf/x86/intel: Fix KASAN global-out-of-bounds warning
    29cce25a756c9 kbuild: align modinfo section for Secureboot Authenticode EDK2 compat
    b568dbc43f739 dma-fence: Fix safe access wrapper to call timeline name method
    80abadeaad490 block: make REQ_OP_ZONE_OPEN a write operation
    0bf99ddc12cbb block: fix op_is_zone_mgmt() to handle REQ_OP_ZONE_RESET_ALL
    87b4a83dc2377 ACPI: fan: Use ACPI handle when retrieving _FST
    c326c13f6091f drm/amdgpu: fix SPDX header on irqsrcs_vcn_5_0.h
    0056f9c56c5d5 drm/amdgpu: fix SPDX header on amd_cper.h
    a179813d1c015 drm/amdgpu: fix SPDX headers on amdgpu_cper.c/h
    1d5c5c44ccf8d drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Iceland
    b15d3772563f6 drm/amd/pm/powerplay/smumgr: Fix PCIeBootLinkLevel value on Fiji
    deaa95e09bb54 drm/amd/pm: fix smu table id bound check issue in smu_cmn_update_table()
    ec18f6b2c743c drm/radeon: Remove calls to drm_put_dev()
    2413bbd1d692a drm/radeon: Do not kfree() devres managed rdev
    bbf734920b9f8 ASoC: soc_sdw_utils: remove cs42l43 component_name
    0bf0e9b845f1e ASoC: fsl_sai: Fix sync error in consumer mode
    af0a7452508d9 dpll: spec: add missing module-name and clock-id to pin-get reply
    5a67600949e7e tools: ynl: avoid print_field when there is no reply
    03bdc44517442 sfc: fix potential memory leak in efx_mae_process_mport()
    e1c29d60cbb37 net: hns3: return error code when function fails
    62086582236d5 tools: ynl: fix string attribute length to include null terminator
    dd5b22a13b13a drm/etnaviv: fix flush sequence logic
    a8db654292d2f ACPI: MRRM: Check revision of MRRM table
    abacc904c73b0 ALSA: usb-audio: don't log messages meant for 1810c when initializing 1824c
    dc6aa30812045 ALSA: usb-audio: add mono main switch to Presonus S1824c
    7222f8cf86364 drm/msm: Ensure vm is created in VM_BIND ioctl
    fc8a62c5fad2b bpf: Conditionally include dynptr copy kfuncs
    82fcca0807484 Bluetooth: hci_core: Fix tracking of periodic advertisement
    5bf4ce5802abd Bluetooth: hci_conn: Fix connection cleanup with BIG with 2 or more BIS
    1a31f50f74821 Bluetooth: btintel_pcie: Fix event packet loss issue
    5b6ced023ab9c Bluetooth: ISO: Fix another instance of dst_type handling
    1c9aca1787e83 Bluetooth: MGMT: fix crash in set_mesh_sync and set_mesh_complete
    66b3659324bae Bluetooth: HCI: Fix tracking of advertisement set/instance 0x00
    b62c9c2f5acc7 Bluetooth: btmtksdio: Add pmctrl handling for BT closed state during reset
    202d049966bcb Bluetooth: ISO: Fix BIS connection dst_type handling
    9cd536970192b Bluetooth: hci_sync: fix race in hci_cmd_sync_dequeue_once
    5158fb8da162e usbnet: Prevents free active kevent
    e05e77547ccad ASoC: mediatek: Fix double pm_runtime_disable in remove functions
    ac591482ffcad libbpf: Fix powerpc's stack register definition in bpf_tracing.h
    4d987e2b349ca ASoC: fsl_micfil: correct the endian format for DSD
    d3d196590a89b ASoC: fsl_sai: fix bit order for DSD format
    b41fca4aa60be ASoC: Intel: avs: Disable periods-elapsed work when closing PCM
    a33b20f944968 ASoC: Intel: avs: Unprepare a stream when XRUN occurs
    e8407dfd26701 crypto: aspeed - fix double free caused by devm
    671e8b50e9f59 crypto: s390/phmac - Do not modify the req->nbytes value
    ead5017944584 nvmet-auth: update sc_c in host response
    c2b2f81e04cc2 bpf: Do not audit capability check in do_jit()
    75b731334f3d7 scsi: core: Fix the unit attention counter implementation
    9e4f21a0b1924 scsi: ufs: core: Initialize value of an attribute returned by uic cmd
    430e15544f11f bpf: Sync pending IRQ work before freeing ring buffer
    d3f8abb93a4de kunit: test_dev_action: Correctly cast 'priv' pointer to long*
    ea6d9fc6c74c5 wifi: nl80211: call kfree without a NULL check
    4f33913b88542 wifi: mac80211: fix key tailroom accounting leak
    65f1156747562 wifi: mac80211: reset FILS discovery and unsol probe resp intervals
    a031627b73f35 ASoC: cs-amp-lib-test: Fix missing include of kunit/test-bug.h
    5b4a239c9f94e wifi: iwlwifi: fix potential use after free in iwl_mld_remove_link()
    cba094c18823f ALSA: usb-audio: fix control pipe direction
    8ee817ceafba2 drm/msm: make sure last_fence is always updated
    d2c9b33b4b86e drm/msm/a6xx: Fix GMU firmware parser
    9674c4cb2fe62 drm/msm: Fix GEM free for imported dma-bufs
    e51ceb4c7d68e wifi: ath11k: avoid bit operation on key flags
    1eea91ffd1011 wifi: ath12k: free skb during idr cleanup callback
    69b28f4cddb46 wifi: ath11k: Add missing platform IDs for quirk table
    aac914238d2a1 wifi: ath10k: Fix memory leak on unsupported WMI command
    3f735419c4b43 x86/fpu: Ensure XFD state on signal delivery
    36ff93e66d0ef x86/CPU/AMD: Add RDSEED fix for Zen5
    8c1a0f8f6121d x86/build: Disable SSE4a
    b556c278d43f4 smb: client: fix potential cfid UAF in smb2_query_info_compound
    fc1961898d01f s390/pci: Restore IRQ unconditionally for the zPCI device
    d8fe61d74ee00 ASoC: renesas: rz-ssi: Use proper dma_buffer_pos after resume
    12c1ac72197ec ASoC: qdsp6: q6asm: do not sleep while atomic
    95e645b192d37 mptcp: restore window probe
    5f8515b7c1af9 mptcp: drop bogus optimization in __mptcp_check_push()
    63e72f13543e5 fbdev: valkyriefb: Fix reference count leak in valkyriefb_init
    ee718044bbc80 fbdev: pvr2fb: Fix leftover reference to ONCHIP_NR_DMA_CHANNELS
    dbc7357b6aae6 wifi: brcmfmac: fix crash while sending Action Frames in standalone AP Mode
    8a4965c155bdc net: phy: dp83867: Disable EEE support as not implemented
    e159cd26fafec Bluetooth: rfcomm: fix modem control handling
    efaf89a75a29b fbdev: bitblit: bound-check glyph index in bit_putcs*
    d46be47524241 batman-adv: Release references to inactive interfaces
    e4c53dc37eedb virtio-net: drop the multi-buffer XDP packet in zerocopy
    1cf52204e7852 ACPI: fan: Use platform device for devres-related actions
    e8acd3e0b8d26 ACPI: button: Call input_free_device() on failing input device registration
    293125536ef55 ACPI: video: Fix use-after-free in acpi_video_switch_brightness()
    291708863b1f9 fbdev: atyfb: Check if pll_ops->init_pll failed
    de89d19f4f30d fbcon: Set fb_display[i]->mode to NULL when the mode is released
    22b282f42573d net: usb: asix_devices: Check return value of usbnet_get_endpoints
    b3ee7ce432289 Revert "NFSD: Remove the cap on number of operations per NFSv4 COMPOUND"
    8f244b773c63f NFSD: Fix crash in nfsd4_read_release()
    d8f3f94dc950e NFSD: Define actions for the new time_deleg FATTR4 attributes
    ef215ad4081e8 sched_ext: Mark scx_bpf_dsq_move_set_[slice|vtime]() with KF_RCU
    6e270b95c9652 Revert "Bluetooth: L2CAP: convert timeouts to secs_to_jiffies()"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.17.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.17.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.17.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
index 736e847f1b6..f4a561cfee6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ec65f0ddf93e8dd3499482d166725c8548f6af65"
-SRCREV_meta ?= "fe82000d683fae54ffe37a97d45162cb769a2506"
+SRCREV_machine ?= "aa06dc4f22d9c05bcbfc45c91308f3f8dd65c5e1"
+SRCREV_meta ?= "064a61babfe08bd4240e22c956735f2c9cb200ef"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.17.7"
+LINUX_VERSION ?= "6.17.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
index bba067e8062..618628d75f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.17.inc
 
-LINUX_VERSION ?= "6.17.7"
+LINUX_VERSION ?= "6.17.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e92d9fd0cb4a691ad487797d96fa2706e5c75626"
-SRCREV_meta ?= "fe82000d683fae54ffe37a97d45162cb769a2506"
+SRCREV_machine ?= "7cded9eb9d18c490e808f46f2eb1e286655ccad1"
+SRCREV_meta ?= "064a61babfe08bd4240e22c956735f2c9cb200ef"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
index 4cf8b87b655..4c72d9e6c4a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.17/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.17/standard/base"
 KBRANCH:qemumips64 ?= "v6.17/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "bac520a62b7b2f90204df17e1119f724782e04b9"
-SRCREV_machine:qemuarm64 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
-SRCREV_machine:qemuloongarch64 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
+SRCREV_machine:qemuarm ?= "a9b28b052aebddf539073d88f824045724f54e5f"
+SRCREV_machine:qemuarm64 ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
+SRCREV_machine:qemuloongarch64 ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
-SRCREV_machine:qemuriscv64 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
-SRCREV_machine:qemuriscv32 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
-SRCREV_machine:qemux86 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
-SRCREV_machine:qemux86-64 ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
+SRCREV_machine:qemuppc ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
+SRCREV_machine:qemuriscv64 ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
+SRCREV_machine:qemuriscv32 ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
+SRCREV_machine:qemux86 ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
+SRCREV_machine:qemux86-64 ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "fdf7be21d60ee59ac690e6e11755222d95be3183"
-SRCREV_meta ?= "fe82000d683fae54ffe37a97d45162cb769a2506"
+SRCREV_machine ?= "b9df5c4816e8095813e5e341ab013c6e7c8d726b"
+SRCREV_meta ?= "064a61babfe08bd4240e22c956735f2c9cb200ef"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7660ce69123ea73b22930fcf20d995ad310049ef"
+SRCREV_machine:class-devupstream ?= "8ac42a63c561a8b4cccfe84ed8b97bb057e6ffae"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.17/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.17;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.17.7"
+LINUX_VERSION ?= "6.17.8"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


