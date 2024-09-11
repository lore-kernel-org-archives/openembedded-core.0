Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723A2EE57EE
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:23:57 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.35228.1726097027796860326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wwAkOFra;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-717849c0dcaso289439b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097027; x=1726701827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqSqpP3qWXcha9c8kY4VM5qTQjKWyDlO7hSv7ANPQjE=;
        b=wwAkOFraPRThxRLb227N5M9Dg4k5kG1a3MMsqOsoTZmgSuUYjMwNchSzB9TwN1/bbI
         pePcfer5UUEvPV1bkNozLJ8F9c6x0LgUVkJpmdxl0OqHmeAzQUBYjdR+61SN8LyXuTqX
         PaBtBt2OxRTWyOZnqlfjBPFaa9R5zhKTY6iQr7cPqht6G32V98nVWCaLGGN2YYqgSVKm
         l7vQos/Y9kAA91w6CDEJmBJLWm2a7bR6qMQ4g2cwfLOyTH+kQGmYfApeH+4gEPfZIjIB
         lrDYYKc1zX4tV0Tq6rgvU0S5Gx+Df0DRtOu5g/4+4E3qWAO4uOB+emocWF/FoL0958k9
         ZdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097027; x=1726701827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqSqpP3qWXcha9c8kY4VM5qTQjKWyDlO7hSv7ANPQjE=;
        b=wd/EEpjI06esaAtzkg3CMbvQdwrY/NPyh5NjPalTf0y/5qQmjLpYmTsojz5HcBnH76
         jkEDUSPyQ7LnBL8A5NA57Yc7NVvgpIdVTppTBfOYF0MdT2Ty3NrJr3WcoSJ35ah1vZyB
         C4o9a/kwBXp+/fJ7lr5ep9OV1DY+sZ0pM7AvQ9GnH0aMwJjd9ZhhL4YsiROWCQ8TKNjZ
         TyquOP40g1qYsiYyB8R3Kr4tqhpwD5nNXH94MuyNOj07dIdAAJELPbVTkeK27zOgBuEU
         t4paLlEGGmzIySZFSoW0mT0ufu5W3dwt3W2qj14BrNRu2TqKGp0WPbe9gPDjDoq/6LsB
         tbsg==
X-Gm-Message-State: AOJu0YyI8uJnoobozxUBkg37pItQAVNy/OThWGlqU8HAbnl3Fg9Q/DVQ
	0q1b98AKBHP4UlNxxqpaozZRvWLq0fCjzhvQvEvhpUAu1Bpy6R0E32J1ZKZ8TCYqvoEUXkDgJe8
	2
X-Google-Smtp-Source: AGHT+IFpn9cwNtSgbeMqMLdZEik2hESxJ6/1OcsJZytRjihJMnI0mD6+BLbed9euPIMV2uRaEkSCnA==
X-Received: by 2002:a05:6a00:3e23:b0:717:8f0d:ec37 with SMTP id d2e1a72fcca58-71926206e36mr1174249b3a.25.1726097025390;
        Wed, 11 Sep 2024 16:23:45 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.23.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:23:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/22] linux-yocto/5.10: update to v5.10.223
Date: Wed, 11 Sep 2024 16:23:07 -0700
Message-Id: <ab08083489c6d5660245c5e1faa7837a66c695b5.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204404

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    4af417c06d37 of: module: add buffer overflow check in of_modalias()
    b15dc4170c63 Linux 5.10.223
    7431144b406a tap: add missing verification for short frame
    6100e0237204 tun: add missing verification for short frame
    911cc83e56a2 filelock: Fix fcntl/close race recovery compat path
    7fa9d1d2524c ALSA: pcm_dmaengine: Don't synchronize DMA channel when DMA is paused
    ddf0caf01295 arm64: dts: qcom: msm8996: Disable SS instance in Parkmode for USB
    a7ec8a5a7ff2 ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book Pro 360
    74c6b151a85e ALSA: hda/realtek: Enable headset mic on Positivo SU C1400
    6386f1b6a10e jfs: don't walk off the end of ealist
    77495e5da5cb ocfs2: add bounds checking to ocfs2_check_dir_entry()
    6e03006548c6 net: relax socket state check at accept time.
    a5224e2123ce drm/amdgpu: Fix signedness bug in sdma_v4_0_process_trap_irq()
    9760c6ceb2a9 ext4: Send notifications on error
    88e44424a62f ext4: fix error code saved on super block during file system abort
    5ce8fad94123 scsi: core: Fix a use-after-free
    c0809c128dad bpf, skmsg: Fix NULL pointer dereference in sk_psock_skb_ingress_enqueue
    be35504b959f bpf: Fix overrunning reservations in ringbuf
    9e2b0a5e252d ACPI: processor_idle: Fix invalid comparison with insertion sort for latency
    c85e6b7d9ef8 ARM: 9324/1: fix get_user() broken with veneer
    727ed4810c8b spi: mux: set ctlr->bits_per_word_mask
    34f8efd2743f hfsplus: fix uninit-value in copy_name
    f236af756137 selftests/vDSO: fix clang build errors and warnings
    38c2028bb3e4 spi: imx: Don't expect DMA for i.MX{25,35,50,51,53} cspi devices
    f65bffb46440 fs: better handle deep ancestor chains in is_subdir()
    ddeda6ca5f21 Bluetooth: hci_core: cancel all works upon hci_unregister_dev()
    739d8d008209 scsi: libsas: Fix exp-attached device scan after probe failure scanned in again after probe failed
    033c51dfdbb6 powerpc/eeh: avoid possible crash when edev->pdev changes
    6b16098148ea powerpc/pseries: Whitelist dtl slub object for copying to userspace
    d1e4e94cb8ab net: mac802154: Fix racy device stats updates by DEV_STATS_INC() and DEV_STATS_ADD()
    909f4c2fc987 net: usb: qmi_wwan: add Telit FN912 compositions
    8acf8801f3d9 ALSA: dmaengine_pcm: terminate dmaengine before synchronize
    2a28531dd016 ALSA: hda/relatek: Enable Mute LED on HP Laptop 15-gw0xxx
    94818bdb00ef btrfs: qgroup: fix quota root leak after quota disable failure
    2e51db7ab71b s390/sclp: Fix sclp_init() cleanup on failure
    71db8dc6f806 can: kvaser_usb: fix return value for hif_usb_send_regout
    6e90cd169608 ASoC: ti: omap-hdmi: Fix too long driver name
    96414bf03778 ASoC: ti: davinci-mcasp: Set min period size using FIFO config
    072f6348c589 ALSA: dmaengine: Synchronize dma channel after drop()
    73bb3e019413 bytcr_rt5640 : inverse jack detect for Archos 101 cesium
    a87d15d1a3fe Input: i8042 - add Ayaneo Kun to i8042 quirk table
    9b32a1348653 Input: elantech - fix touchpad state on resume for Lenovo N24
    cf704e7d0437 mips: fix compat_sys_lseek syscall
    134b12f0c590 ALSA: hda/realtek: Add more codec ID to no shutup pins list
    4cdf6926f443 KVM: PPC: Book3S HV: Prevent UAF in kvm_spapr_tce_attach_iommu_group()
    6295bad58f98 wifi: cfg80211: wext: add extra SIOCSIWSCAN data check
    9774641b255f mei: demote client disconnect warning on suspend to debug
    229bce543ba0 fs/file: fix the check in find_next_fd()
    ffe47bf986d1 kconfig: remove wrong expr_trans_bool()
    4beba2408573 kconfig: gconf: give a proper initial state to the Save button
    9625afe1dd4a null_blk: fix validation of block size
    9934cda0e7fa arm64: armv8_deprecated: Fix warning in isndep cpuhp starting process
    a0cafb7b0b94 ila: block BH in ila_output()
    34eb7ab9af70 net: ipv6: rpl_iptunnel: block BH in rpl_output() and rpl_input()
    fe855e5b1627 Input: silead - Always support 10 fingers
    42e60f3bde3c selftests/openat2: Fix build warnings on ppc64
    bb8ace6794a1 wifi: mac80211: fix UBSAN noise in ieee80211_prep_hw_scan()
    60cf36f2900f wifi: mac80211: mesh: init nonpeer_pm to active by default in mesh sdata
    6df01b7eabc8 ACPI: EC: Avoid returning AE_OK on errors in address space handler
    fd57dbffd925 ACPI: EC: Abort address space access upon error
    cd9472c43f5e scsi: qedf: Set qed_slowpath_params to zero before use
    5661b9c7ec18 filelock: Remove locks reliably when fcntl/close race is detected
    2e272e7d7159 gcc-plugins: Rename last_stmt() for GCC 14+
    b29e4b50c556 scripts/gdb: fix SB_* constants parsing
    02fd398f5e2b bpf: Reject variable offset alu on PTR_TO_FLOW_KEYS
    83a48a4503d0 Linux 5.10.222
    f52913e5d6ca i2c: rcar: fix error code in probe()
    2907dd5855f6 i2c: rcar: clear NO_RXDMA flag after resetting
    41f62c95e008 i2c: rcar: ensure Gen3+ reset does not disturb local targets
    88046f94cc0c i2c: rcar: introduce Gen4 devices
    a720e2e42fd8 i2c: rcar: reset controller is mandatory for Gen3+
    b4c11a53e1f8 i2c: rcar: Add R-Car Gen4 support
    785290cb16ed i2c: mark HostNotify target address as used
    8d99f26b557a i2c: rcar: bring hardware to known state when probing
    a9a466a69b85 nilfs2: fix kernel bug on rename operation of broken directory
    ca42be8dd1e2 bpf: Allow reads from uninit stack
    9df3b2474a62 ipv6: prevent NULL dereference in ip6_output()
    5edef7986495 ipv6: annotate data-races around cnf.disable_ipv6
    96c58b096659 efi: ia64: move IA64-only declarations to new asm/efi.h header
    596dedc6fa89 x86/retpoline: Move a NOENDBR annotation to the SRSO dummy return thunk
    b6d942365dbe wireguard: send: annotate intentional data race in checking empty queue
    0bdb5a74443f wireguard: queueing: annotate intentional data race in cpu round robin
    ae630de24efb wireguard: allowedips: avoid unaligned 64-bit memory accesses
    34b76d1922e4 libceph: fix race between delayed_work() and ceph_monc_stop()
    f70b51a36562 ALSA: hda/realtek: Limit mic boost on VAIO PRO PX
    4d62aa624721 ALSA: hda/realtek: Enable Mute LED on HP 250 G7
    781092884262 nvmem: meson-efuse: Fix return value of nvmem callbacks
    bdb9c58e8048 hpet: Support 32-bit userspace
    d09dd21bb521 USB: core: Fix duplicate endpoint bug by clearing reserved bits in the descriptor
    e8474a10c535 usb: gadget: configfs: Prevent OOB read/write in usb_string_copy()
    10ae6b364be7 USB: Add USB_QUIRK_NO_SET_INTF quirk for START BP-850k
    932a86a711c7 USB: serial: mos7840: fix crash on resume
    868bc4408629 USB: serial: option: add Rolling RW350-GL variants
    2dc6aad6eaca USB: serial: option: add Netprisma LCUK54 series modules
    fb9ff5139625 USB: serial: option: add support for Foxconn T99W651
    c9e1030198e5 USB: serial: option: add Fibocom FM350-GL
    9fb736742355 USB: serial: option: add Telit FN912 rmnet compositions
    8e4e917f9d30 USB: serial: option: add Telit generic core-dump composition
    26b4d6802ed7 net: ks8851: Fix potential TX stall after interface reopen
    5d7e64d70a11 tcp: avoid too many retransmit packets
    24b9fafe3464 tcp: use signed arithmetic in tcp_rtx_probe0_timed_out()
    b4e9f8905d78 octeontx2-af: fix detection of IP layer
    7e0297c80fa1 ARM: davinci: Convert comma to semicolon
    148d5494258b s390: Mark psw in __load_psw_mask() as __unitialized
    b81a523d54ea net/sched: Fix UAF when resolving a clash
    9f965684c57c udp: Set SOCK_RCU_FREE earlier in udp_lib_get_port().
    c184be30b12e ethtool: netlink: do not return SQI value if link is down
    3ba12c2afd93 ppp: reject claimed-as-LCP but actually malformed packets
    22b16618a808 net: ethernet: lantiq_etop: fix double free in detach
    b4ac93b0418f net: lantiq_etop: add blank line after declaration
    efc05a5fdc0d octeontx2-af: Fix incorrect value output on error path in rvu_check_rsrc_availability()
    893e140dcc02 tcp: fix incorrect undo caused by DSACK of TLP retransmit
    1b95de9433b3 vfs: don't mod negative dentry count when on shrinker list
    7092f1e5821f fs/dcache: Re-use value stored to dentry->d_flags instead of re-reading
    7d4c14f4b511 filelock: fix potential use-after-free in posix_lock_inode
    0100aeb8a12d mm: prevent derefencing NULL ptr in pfn_section_valid()
    1e99ce37e96e nilfs2: fix incorrect inode allocation from reserved inodes
    3affee779bd3 kbuild: fix short log for AS in link-vmlinux.sh
    2f3c22b1d3d7 nvmet: fix a possible leak when destroy a ctrl during qp establishment
    1fa5c6eef4ec platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro
    8802d233505f platform/x86: touchscreen_dmi: Add info for GlobalSpace SolT IVW 11.6" tablet
    560eaa1af038 nvme: adjust multiples of NVME_CTRL_PAGE_SIZE in offset
    2d428a07e8b2 nvme-multipath: find NUMA path only for online numa-node
    97982c31064a ALSA: hda/realtek: Enable headset mic of JP-IK LEAP W502 with ALC897
    2849a1b747cf i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in isr
    2032e5dfae5f media: dw2102: fix a potential buffer overflow
    a6176a802c4b ima: Avoid blocking in RCU read-side critical section
    37c59198bc3b bpf, sockmap: Fix sk->sk_forward_alloc warn_on in sk_stream_kill_queues
    8b17cec33892 bnx2x: Fix multiple UBSAN array-index-out-of-bounds
    55d6a97cf02c mtd: rawnand: Bypass a couple of sanity checks during NAND identification
    fac2544b8c99 drm/amdgpu/atomfirmware: silence UBSAN warning
    274cba8d2d1b drm/nouveau: fix null pointer dereference in nouveau_connector_get_modes
    145faa3d0368 Revert "mm/writeback: fix possible divide-by-zero in wb_dirty_limits(), again"
    c9f715f1b416 fsnotify: Do not generate events for O_PATH file descriptors
    9528e95d6eae can: kvaser_usb: Explicitly initialize family in leafimx driver_info struct
    215a26c2404f Bluetooth: qca: Fix BT enable failure again for QCA6390 after warm reboot
    7a49389771ae mm: avoid overflows in dirty throttling logic
    f033241a7c2d mm: optimize the redundant loop of mm_update_owner_next()
    2f2fa9cf7c35 nilfs2: add missing check for inode numbers on directory entries
    731011ac6c37 nilfs2: fix inode number range checks
    7ef519c8efde inet_diag: Initialize pad field in struct inet_diag_req_v2
    3908637dce2e selftests: make order checking verbose in msg_zerocopy selftest
    1782a42ca25c selftests: fix OOM in msg_zerocopy selftest
    707c85ba3527 bonding: Fix out-of-bounds read in bond_option_arp_ip_targets_set()
    df76fb67eaa2 wifi: wilc1000: fix ies_len type in connect path
    cdffc358717e tcp_metrics: validate source addr length
    febed740a31d UPSTREAM: tcp: fix DSACK undo in fast recovery to call tcp_try_to_open()
    93c034c4314b s390/pkey: Wipe sensitive data on failure
    6d6d94287f63 jffs2: Fix potential illegal address access in jffs2_free_inode
    b694989bb13e bpf: Avoid uninitialized value in BPF_CORE_READ_BITFIELD
    6b84e9d53bc0 powerpc/xmon: Check cpu id in commands "c#", "dp#" and "dx#"
    9d046f697e9a kunit: Fix timeout message
    1617249e24bd orangefs: fix out-of-bounds fsid access
    19cd1d96d6f8 powerpc/64: Set _IO_BASE to POISON_POINTER_DELTA not 0 for CONFIG_PCI=n
    158bcaa2e31b i2c: i801: Annotate apanel_addr as __ro_after_init
    e1ba22618758 media: dvb-frontends: tda10048: Fix integer overflow
    7d2fbd822df1 media: s2255: Use refcount_t instead of atomic_t for num_channels
    39e7a27813be media: dvb-frontends: tda18271c2dd: Remove casting during div
    2a2fe25a103c net: dsa: mv88e6xxx: Correct check for empty list
    8eac1cc159b3 Input: ff-core - prefer struct_size over open coded arithmetic
    402825a23a0e firmware: dmi: Stop decoding on broken entry
    5a18ea7d864c sctp: prefer struct_size over open coded arithmetic
    4dcce63a6f5c media: dw2102: Don't translate i2c read into write
    ffa7bd3ca9cf drm/amd/display: Skip finding free audio for unknown engine_id
    b2e9abc95583 drm/amd/display: Check pipe offset before setting vblank
    b5b8837d066c drm/amd/display: Check index msg_id before read or write
    f0645c99c20e drm/amdgpu: Initialize timestamp for some legacy SOCs
    9db8c299a521 crypto: aead,cipher - zeroize key buffer after use
    5ceb40cdee72 scsi: qedf: Make qedf_execute_tmf() non-preemptible
    62349fbf86b5 IB/core: Implement a limit on UMAD receive List
    167afd3fedaf media: dvb-usb: dib0700_devices: Add missing release_firmware()
    82ef3fa640f6 media: dvb: as102-fe: Fix as10x_register_addr packing
    25d0d9b83d85 drm/lima: fix shared irq handling on driver remove
    94ffdde326f5 Compiler Attributes: Add __uninitialized macro
    6ab8b697d7d1 Linux 5.10.221
    ec3adc2af0f1 tracing/net_sched: NULL pointer dereference in perf_trace_qdisc_reset()
    0a95f0f6d64e serial: 8250_omap: Fix Errata i2310 with RX FIFO level check
    1bd2dc770294 xdp: xdp_mem_allocator can be NULL in trace_mem_connect().
    4686892f615a arm64: dts: rockchip: Add sound-dai-cells for RK3368
    e9918954e370 ARM: dts: rockchip: rk3066a: add #sound-dai-cells to hdmi node
    b63d015b7ae9 KVM: arm64: vgic-v4: Make the doorbell request robust w.r.t preemption
    91efb15b5a3e efi/x86: Free EFI memory map only when installing a new one.
    e5d730882d27 efi: xen: Set EFI_PARAVIRT for Xen dom0 boot on all architectures
    31e0721aeabd efi: memmap: Move manipulation routines into x86 arch tree
    52dc463a76b0 efi: Correct comment on efi_memmap_alloc
    d204beedc82f drivers: fix typo in firmware/efi/memmap.c
    3b32f265805a tcp: Fix data races around icsk->icsk_af_ops.
    ea2ed3f78ab2 ipv6: Fix data races around sk->sk_prot.
    d3bf338e9ca4 ipv6: annotate some data-races around sk->sk_prot
    ed07b26c54ef nfs: Leave pages in the pagecache if readpage failed
    2e6bbfa1abfe pwm: stm32: Refuse too small period requests
    2c43adf36475 mtd: spinand: macronix: Add support for serial NAND flash
    d5f75f01994e syscalls: fix compat_sys_io_pgetevents_time64 usage
    84bf6b64a1a0 ftruncate: pass a signed offset
    010de9acbea5 ata: libata-core: Fix double free on error
    be5016ae5a3b ata: ahci: Clean up sysfs file on error
    692858d9edb3 batman-adv: Don't accept TT entries for out-of-spec VIDs
    56fc4d3b0bde drm/nouveau/dispnv04: fix null pointer dereference in nv17_tv_get_hd_modes
    f771b91f21c4 drm/i915/gt: Fix potential UAF by revoke of fence registers
    259549b2ccf7 drm/nouveau/dispnv04: fix null pointer dereference in nv17_tv_get_ld_modes
    9ec84770e486 hexagon: fix fadvise64_64 calling conventions
    690633552986 csky, hexagon: fix broken sys_sync_file_range
    bf4a43c533d9 kbuild: Install dtb files as 0644 in Makefile.dtbinst
    f6c839e71790 net: can: j1939: enhanced error handling for tightly received RTS messages in xtp_rx_rts_session_new
    3f177e46c935 net: can: j1939: recover socket queue on CAN bus error during BAM transmission
    a2a0ebff7fde net: can: j1939: Initialize unused data in j1939_send_one()
    44add57b5b44 tty: mcf: MCF54418 has 10 UARTS
    cb8793006698 serial: 8250_omap: Implementation of Errata i2310
    75ddbf776dd0 usb: atm: cxacru: fix endpoint checking in cxacru_bind()
    621e90201c84 usb: musb: da8xx: fix a resource leak in probe()
    2798fc156071 usb: gadget: printer: fix races against disable
    84ca47192f97 usb: gadget: printer: SS+ support
    ee88636607e1 net: usb: ax88179_178a: improve link status logs
    59a84bcf1cc7 iio: chemical: bme680: Fix sensor data read operation
    c326551e99f5 iio: chemical: bme680: Fix overflows in compensate() functions
    3d78fc351bee iio: chemical: bme680: Fix calibration data variable
    44f04b1a88d6 iio: chemical: bme680: Fix pressure value output
    28f6d0b5ff9f iio: adc: ad7266: Fix variable checking bug
    78ece307f823 counter: ti-eqep: enable clock at probe
    76da476a4c60 mmc: sdhci: Do not lock spinlock around mmc_gpio_get_ro()
    803835fda351 mmc: sdhci: Do not invert write-protect twice
    5048a44a257e mmc: sdhci-pci: Convert PCIBIOS_* return codes to errnos
    a68b896aa56e ocfs2: fix DIO failure due to insufficient transaction credits
    49c09ca35a5f x86: stop playing stack games in profile_pc()
    38ce30793946 gpiolib: cdev: Disallow reconfiguration without direction (uAPI v1)
    e44a83bf15c4 gpio: davinci: Validate the obtained number of IRQs
    98eae65cb5e3 drm/panel: simple: Add missing display timing flags for KOE TX26D202VM0BWA
    cb4e7a8f3965 nvme: fixup comment for nvme RDMA Provider Type
    1a7a494184cf drm/radeon/radeon_display: Decrease the size of allocated memory
    a45c45767bfe soc: ti: wkup_m3_ipc: Send NULL dummy message instead of pointer message
    e47d3babaa47 media: dvbdev: Initialize sbuf
    d23982ea9aa4 ALSA: emux: improve patch ioctl data validation
    763896ab62a6 net/dpaa2: Avoid explicit cpumask var allocation on stack
    9dadab0db7d9 net/iucv: Avoid explicit cpumask var allocation on stack
    3d6432f20f00 bpf: Add a check for struct bpf_fib_lookup size
    37f646c6040f mtd: partitions: redboot: Added conversion of operands to a larger type
    cae52f61fda0 drm/panel: ilitek-ili9881c: Fix warning with GPIO controllers that sleep
    5d43d789b579 netfilter: nf_tables: fully validate NFT_DATA_VALUE on store to data registers
    4e6367fe3210 parisc: use correct compat recv/recvfrom syscalls
    7620738513f7 sparc: fix compat recv/recvfrom syscalls
    2a700b8de527 sparc: fix old compat_sys_select()
    1095b8efbb13 xdp: Remove WARN() from __xdp_reg_mem_model()
    5a3035306a0b xdp: Allow registering memory model without rxq reference
    f4aa8268d774 xdp: Move the rxq_info.mem clearing to unreg_mem_model()
    0427f74a7953 net: phy: micrel: add Microchip KSZ 9477 to the device table
    65a9383389db net: dsa: microchip: fix initial port flush problem
    3662eb2170e5 ASoC: fsl-asoc-card: set priv->pdev before using it
    229e145a810d nfsd: hold a lighter-weight client reference over CB_RECALL_ANY
    a4f3907ab50b SUNRPC: Fix svcxdr_init_encode's buflen calculation
    f1ef3dc758c7 SUNRPC: Fix svcxdr_init_decode's end-of-buffer calculation
    be20af24585d SUNRPC: Fix a NULL pointer deref in trace_svc_stats_latency()
    3de81c1e84bf SUNRPC: Fix null pointer dereference in svc_rqst_free()
    310dee723530 netfilter: nf_tables: validate family when identifying table via handle
    d8a04a6bfa75 drm/amdgpu: fix UBSAN warning in kv_dpm.c
    52af94393dd6 pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set
    6531f8c6663c pinctrl: rockchip: use dedicated pinctrl type for RK3328
    926cb583b9ef pinctrl/rockchip: separate struct rockchip_pin_bank to a head file
    cfa2527ac80a pinctrl: rockchip: fix pinmux bits for RK3328 GPIO3-B pins
    6ff152b2be88 pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2-B pins
    b813e3fd102a pinctrl: fix deadlock in create_pinctrl() when handling -EPROBE_DEFER
    b6be2b025c72 Input: ili210x - fix ili251x_read_touch_data() return value
    f0ef5ca85f43 ACPI: x86: Force StorageD3Enable on more products
    3f830c248400 ACPI: x86: utils: Add Picasso to the list for forcing StorageD3Enable
    bb1758cc4af8 ACPI: x86: utils: Add Cezanne to the list for forcing StorageD3Enable
    c2a6ab506fd2 ACPI: x86: Add another system to quirk list for forcing StorageD3Enable
    fe73b1d0804d ACPI: x86: Add a quirk for Dell Inspiron 14 2-in-1 for StorageD3Enable
    83f652221005 ACPI: Add quirks for AMD Renoir/Lucienne CPUs to force the D3 hint
    b055752675cd smb: client: fix deadlock in smb2_find_smb_tcon()
    78ebec450ef4 cifs: missed ref-counting smb session in find
    b03555a8fa05 x86/amd_nb: Check for invalid SMN reads
    0caf70a8e816 PCI: Add PCI_ERROR_RESPONSE and related definitions
    a335ad77bda2 perf/core: Fix missing wakeup when waiting for context reference
    695f20c6785d kheaders: explicitly define file modes for archived headers
    247c3f8958ab Revert "kheaders: substituting --sort in archive creation"
    61c1c98e2607 r8169: Fix possible ring buffer corruption on fragmented Tx packets.
    5c88f4f6341c r8169: remove not needed check in rtl8169_start_xmit
    48833226fb08 r8169: remove nr_frags argument from rtl_tx_slots_avail
    41eeb13459b2 r8169: improve rtl8169_start_xmit
    04f9d0cd3974 r8169: improve rtl_tx
    6d3eb1658be6 r8169: remove unneeded memory barrier in rtl_tx
    40a697e34517 x86/cpu: Fix x86_match_cpu() to match just X86_VENDOR_INTEL
    50b1b4e4f3a6 x86/cpu/vfm: Add new macros to work with (vendor/family/model) values
    0e84701753ac tracing: Add MODULE_DESCRIPTION() to preemptirq_delay_test
    2c3d7b03b658 bcache: fix variable length array abuse in btree_iter
    633707246729 spmi: hisi-spmi-controller: Do not override device identifier
    90551062fd69 knfsd: LOOKUP can return an illegal error value
    f77c8a2ce21e pmdomain: ti-sci: Fix duplicate PD referrals
    5fe1b2c72e9e wifi: rtlwifi: rtl8192de: Fix 5 GHz TX power
    33628b6ed3cc rtlwifi: rtl8192de: Style clean-ups
    77942a027231 ARM: dts: samsung: smdk4412: fix keypad no-autorepeat
    1fdaecc326f0 ARM: dts: samsung: exynos4412-origen: fix keypad no-autorepeat
    b263a895d8a1 ARM: dts: samsung: smdkv310: fix keypad no-autorepeat
    cc255080c1c5 drm/amd/display: revert Exit idle optimizations before HDCP execution
    5d7fef7522b1 dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct path to i2c-controller schema
    7884f4afeccb i2c: ocores: set IACK bit after core is enabled
    7879b54f0b90 kcov: don't lose track of remote references during softirqs
    b1684798a300 gcov: add support for GCC 14
    febe794b8369 drm/radeon: fix UBSAN warning in kv_dpm.c
    71bea3e64879 ALSA: hda/realtek: Limit mic boost on N14AP7
    7186b81c1f15 RDMA/mlx5: Add check for srq max_sge attribute
    6eca23100e90 ACPICA: Revert "ACPICA: avoid Info: mapping multiple BARs. Your kernel is fine."
    f3d17826d6b6 dmaengine: ioatdma: Fix missing kmem_cache_destroy()
    34cc20a5441d dmaengine: ioatdma: Fix kmemleak in ioat_pci_probe()
    768ae5e02551 dmaengine: ioatdma: Fix error path in ioat3_dma_probe()
    a486fca282a9 dmaengine: ioat: use PCI core macros for PCIe Capability
    c017a8e3e30c dmaengine: ioatdma: Fix leaking on version mismatch
    f99b00ed9b92 dmaengine: ioat: Drop redundant pci_enable_pcie_error_reporting()
    d293db11cb9c dmaengine: ioat: switch from 'pci_' to 'dma_' API
    97509608b7e4 regulator: core: Fix modpost error "regulator_get_regmap" undefined
    6a0f5d540f0f net: usb: rtl8150 fix unintiatilzed variables in rtl8150_get_link_ksettings
    72d961196886 netfilter: ipset: Fix suspicious rcu_dereference_protected()
    333c0a1f7d5b virtio_net: checksum offloading handling fix
    b4bca4722fda net: stmmac: No need to calculate speed divider when offload is disabled
    03f625505e27 sched: act_ct: add netns into the key of tcf_ct_flow_table
    b4899d75b843 net/sched: act_ct: set 'net' pointer when creating new nf_flow_table
    3eb1b3962789 tipc: force a dst refcount before doing decryption
    c6a7da65a296 net/sched: act_api: fix possible infinite loop in tcf_idr_check_alloc()
    66c7aa157a38 net/sched: act_api: rely on rcu in tcf_idr_check_alloc
    fb910ac2d3da qca_spi: Make interrupt remembering atomic
    2b82028a1f5e netns: Make get_net_ns() handle zero refcount net
    20427b85781a xfrm6: check ip6_dst_idev() return value in xfrm6_get_saddr()
    1ed9849fdf9a ipv6: prevent possible NULL dereference in rt6_probe()
    de5ad4d45cd0 ipv6: prevent possible NULL deref in fib6_nh_init()
    5391f9db2cab netrom: Fix a memory leak in nr_heartbeat_expiry()
    1aabe0f850ad cipso: fix total option length computation
    a85bae262cce tracing: Build event generation tests only as modules
    36d771ce6028 mips: bmips: BCM6358: make sure CBR is correctly set
    7117969bff94 MIPS: Routerboard 532: Fix vendor retry check code
    15c8b2e1d6fc serial: exar: adding missing CTI and Exar PCI ids
    6c1b9fe148a4 MIPS: Octeon: Add PCIe link status check
    c59f79e2b477 PCI/PM: Avoid D3cold for HP Pavilion 17 PC/1972 PCIe Ports
    bffff80d103c udf: udftime: prevent overflow in udf_disk_stamp_to_time()
    04736c1bc321 usb: misc: uss720: check for incompatible versions of the Belkin F5U002
    38a82c8d0063 f2fs: remove clear SB_INLINECRYPT flag in default_options
    d8481016c295 iommu/arm-smmu-v3: Free MSIs in case of ENOMEM
    449d55871cae power: supply: cros_usbpd: provide ID table for avoiding fallback match
    1939648b3aca powerpc/io: Avoid clang null pointer arithmetic warnings
    a8c988d752b3 powerpc/pseries: Enforce hcall result buffer validity and size
    03e7b2f7ae4c drm/lima: mask irqs in timeout path before hard reset
    e12c363cf5fd drm/lima: add mask irq callback to gp and pp
    2db63bf7d87c ASoC: Intel: sof_sdw: add JD2 quirk for HP Omen 14
    b4291f58a9cf drm/amd/display: Exit idle optimizations before HDCP execution
    52d4cfa56b5f Bluetooth: ath3k: Fix multiple issues reported by checkpatch.pl
    6fdc98bcc66e ACPI: video: Add backlight=native quirk for Lenovo Slim 7 16ARH7
    6f6cb0748243 HID: Add quirk for Logitech Casa touchpad
    43c0ca793a18 netpoll: Fix race condition in netpoll_owner_active
    1b577bb1cbe7 kselftest: arm64: Add a null pointer check
    144d76a676b6 scsi: qedi: Fix crash while reading debugfs attribute
    96941f29ebcc drop_monitor: replace spin_lock by raw_spin_lock
    a720d71dd494 af_packet: avoid a false positive warning in packet_setsockopt()
    b5a53d14dd83 wifi: ath9k: work around memset overflow warning
    82cdea8f3af1 batman-adv: bypass empty buckets in batadv_purge_orig_ref()
    e1c3f5fb1be8 selftests/bpf: Fix flaky test btf_map_in_map/lookup_update
    973b32034ce1 selftests/bpf: Prevent client connect before server bind in test_tc_tunnel.sh
    58706e482bf4 block/ioctl: prefer different overflow check
    c15df6f49867 rcutorture: Fix invalid context warning when enable srcu barrier testing
    dd2cb39afc72 rcutorture: Fix rcu_torture_one_read() pipe_count overflow comment
    ec58e6ff29b7 padata: Disable BH when taking works lock on MT path
    82c7acf9a12c zap_pid_ns_processes: clear TIF_NOTIFY_SIGNAL along with TIF_SIGPENDING
    864963d2692e i2c: designware: Fix the functionality flags of the slave-only interface
    0f37d22a6215 i2c: at91: Fix the functionality flags of the slave-only interface
    f68820f1256b usb-storage: alauda: Check whether the media is initialized
    2b6bb0b4abfd greybus: Fix use-after-free bug in gb_interface_release due to race condition.
    d6c26a59e633 remoteproc: k3-r5: Jump to error handling labels in start/stop errors
    990d0710108d mptcp: pm: update add_addr counters after connect
    5a4efafcf843 mptcp: pm: inc RmAddr MIB counter once per RM_ADDR ID
    208cd22ef5e5 mptcp: ensure snd_una is properly initialized on connect
    73014c77ec2a hugetlb_encode.h: fix undefined behaviour (34 << 26)
    0047568dbd9c serial: 8250_pxa: Configure tx_loadsz to match FIFO IRQ level
    33eae51f6569 tick/nohz_full: Don't abuse smp_call_function_single() in tick_setup_device()
    0ecfe3a92869 nilfs2: fix potential kernel bug due to lack of writeback flag waiting
    f699f9f8b2ea intel_th: pci: Add Lunar Lake support
    31f3136fd6fc intel_th: pci: Add Meteor Lake-S support
    c02003a97a88 intel_th: pci: Add Sapphire Rapids SOC support
    dbfe50b50eb9 intel_th: pci: Add Granite Rapids SOC support
    78a41b1614c3 intel_th: pci: Add Granite Rapids support
    02d3b5e48d24 remoteproc: k3-r5: Do not allow core1 to power up before core0 via sysfs
    fe5b53c60217 dmaengine: axi-dmac: fix possible race in remove()
    42ed6bfc2ddb PCI: rockchip-ep: Remove wrong mask on subsys_vendor_id
    050ce8af6838 ocfs2: fix races between hole punching and AIO+DIO
    11a075a1c8c7 ocfs2: use coarse time for new created files
    70c1835e776c fs/proc: fix softlockup in __read_vmcore
    f70ff7373467 vmci: prevent speculation leaks by sanitizing event in event_deliver()
    4dfffb50316c drm/exynos: hdmi: report safe 640x480 mode as a fallback when no EDID found
    0acc356da854 drm/exynos/vidi: fix memory leak in .get_modes()
    760603e30bf1 drivers: core: synchronize really_probe() and dev_uevent()
    fd45d6f19494 iio: imu: inv_icm42600: delete unneeded update watermark call
    9d4dce587081 iio: dac: ad5592r: fix temperature channel scaling value
    e4ce76890e5e iio: adc: ad9467: fix scan type sign
    ff9c2a9426ec ionic: fix use after netif_napi_del()
    b278f9b458fa net/ipv6: Fix the RT cache flush via sysctl using a previous delay
    01ce5bdfdf84 net: stmmac: replace priv->speed with the portTransmitRate from the tc-cbs parameters
    93b53c202b51 netfilter: ipset: Fix race between namespace cleanup and gc in the list:set type
    ea1a98c9a367 Bluetooth: L2CAP: Fix rejecting L2CAP_CONN_PARAM_UPDATE_REQ
    dfd7f4670723 net/mlx5e: Fix features validation check for tunneled UDP (non-VXLAN) packets
    330c8661c993 tcp: fix race in tcp_v6_syn_recv_sock()
    9b164605c115 drm/bridge/panel: Fix runtime warning on panel bridge release
    bda7cdaeebf5 drm/komeda: check for error-valued pointer
    cbf18d8128a7 liquidio: Adjust a NULL pointer handling path in lio_vf_rep_copy_packet
    187e293c8260 net: hns3: add cond_resched() to hns3 ring buffer init process
    bd8e1e6af6d9 net: sfp: Always call `sfp_sm_mod_remove()` on remove
    abc55e738b43 drm/vmwgfx: 3D disabled should not effect STDU memory limits
    caa9c9acb93d HID: logitech-dj: Fix memory leak in logi_dj_recv_switch_to_dj_mode()
    cf34f8f66982 iommu: Return right value in iommu_sva_bind_device()
    d4673a34d8fd iommu/amd: Fix sysfs leak in iommu init
    c0f1bd317b3a iommu/amd: Introduce pci segment structure
    a843c0e9da32 gpio: tqmx86: store IRQ trigger type and unmask status separately
    33f6832798dd HID: core: remove unnecessary WARN_ON() in implement()
    544015b94589 gpio: tqmx86: fix typo in Kconfig label
    66c79c5acc5c SUNRPC: return proper error from gss_wrap_req_priv
    b6a204f937e6 Input: try trimming too long modalias strings
    20b3f435b7c1 powerpc/uaccess: Fix build errors seen with GCC 13/14
    0081d2b3ae0a scsi: mpt3sas: Avoid test/set_bit() operating in non-allocated memory
    baeae72258ad xhci: Apply broken streams quirk to Etron EJ188 xHCI host
    0b05b12e2d03 xhci: Apply reset resume quirk to Etron EJ188 xHCI host
    22de7c9cba6f xhci: Set correct transferred length for cancelled bulk transfers
    fc745f6e83cb jfs: xattr: fix buffer overflow for invalid xattr
    498ff29800a6 mei: me: release irq in mei_me_pci_resume error path
    c0747d76eb05 USB: class: cdc-wdm: Fix CPU lockup caused by excessive log messages
    c77ad608df6c nilfs2: fix nilfs_empty_dir() misjudgment and long loop on I/O errors
    adf1b931d50b nilfs2: return the mapped address from nilfs_get_page()
    8b56df81b369 nilfs2: Remove check for PageError
    05544fd3f18a btrfs: fix leak of qgroup extent records after transaction abort
    79bf1ea0d522 selftests/mm: compaction_test: fix bogus test success on Aarch64
    7c1cc0a5d43f selftests/mm: conform test to TAP format output
    9d3886a1604b selftests/mm: compaction_test: fix incorrect write of zero to nr_hugepages
    6ff7cfa02baa mmc: davinci: Don't strip remove function when driver is builtin
    b5a2a6908109 serial: sc16is7xx: fix bug in sc16is7xx_set_baud() when using prescaler
    9a2e0aa9a809 serial: sc16is7xx: replace hardcoded divisor value with BIT() macro
    e8b8054f5ef4 drm/amd/display: Handle Y carry-over in VCP X.Y calculation
    e500b1c4e29a usb: gadget: f_fs: Fix race between aio_cancel() and AIO request complete
    c69369878766 ipv6: fix possible race in __fib6_drop_pcpu_from()
    74c97c80034f af_unix: Annotate data-race of sk->sk_shutdown in sk_diag_fill().
    35a69f9e5db8 af_unix: Use skb_queue_len_lockless() in sk_diag_show_rqlen().
    a64e4b8f9bf6 af_unix: Use unix_recvq_full_lockless() in unix_stream_connect().
    f70ef84b821e af_unix: Annotate data-race of net->unx.sysctl_max_dgram_qlen.
    44a2437c60b1 af_unix: Annotate data-races around sk->sk_state in UNIX_DIAG.
    b5a6507c6196 af_unix: Annotate data-races around sk->sk_state in sendmsg() and recvmsg().
    cc5d123ce4ae af_unix: Annotate data-races around sk->sk_state in unix_write_space() and poll().
    d2c53bedeb96 af_unix: Annotate data-race of sk->sk_state in unix_inq_len().
    13f61e503ec1 ptp: Fix error message on failed pin verification
    6db4af09987c net/sched: taprio: always validate TCA_TAPRIO_ATTR_PRIOMAP
    d8c79ae03ee1 tcp: count CLOSE-WAIT sockets for TCP_MIB_CURRESTAB
    dd254cde5715 vxlan: Fix regression when dropping packets due to invalid src addresses
    52b1aa07cda6 net: sched: sch_multiq: fix possible OOB write in multiq_tune()
    f9f69e3f6989 ipv6: sr: block BH in seg6_output_core() and seg6_input_core()
    3cbb2ba0a0d9 net/ncsi: Fix the multi thread manner of NCSI driver
    7329bc66b4a0 net/ncsi: Simplify Kconfig/dts control flow
    f40cac4e7083 net/ncsi: add NCSI Intel OEM command to keep PHY up
    7c9b9f822eaa wifi: mac80211: correctly parse Spatial Reuse Parameter Set element
    46c59a253370 wifi: iwlwifi: mvm: don't read past the mfuart notifcation
    3c4771091ea8 wifi: iwlwifi: mvm: check n_ssids before accessing the ssids
    2c80bd07c11c wifi: iwlwifi: dbg_ini: move iwl_dbg_tlv_free outside of debugfs ifdef
    99c4903dcee3 wifi: iwlwifi: mvm: revert gen2 TX A-MPDU size to 64
    8d5c7d7bfd72 wifi: cfg80211: pmsr: use correct nla_get_uX functions
    e7e916d693dc wifi: mac80211: Fix deadlock in ieee80211_sta_ps_deliver_wakeup()
    7518e20a189f wifi: mac80211: mesh: Fix leak of mesh_preq_queue objects
    f64d566f4332 null_blk: Print correct max open zones limit in null_init_zoned_dev()
    8f48a7f8b929 tracing/selftests: Fix kprobe event name test for .isra. functions
    3a3877de4434 Linux 5.10.220
    9444ce5cd488 nfsd: Fix a regression in nfsd_setattr()
    a1a153fc73cc nfsd: don't call locks_release_private() twice concurrently
    feb3352af742 nfsd: don't take fi_lock in nfsd_break_deleg_cb()
    99fb654d01dc nfsd: fix RELEASE_LOCKOWNER
    ca791e1a31cf nfsd: drop the nfsd_put helper
    838a602db75d nfsd: call nfsd_last_thread() before final nfsd_put()
    e35cb663a462 NFSD: fix possible oops when nfsd/pool_stats is closed.
    3add01e06748 Documentation: Add missing documentation for EXPORT_OP flags
    d31cd25f5501 nfsd: separate nfsd_last_thread() from nfsd_put()
    987c0e102874 nfsd: Simplify code around svc_exit_thread() call in nfsd()
    7229200f6866 nfsd: don't allow nfsd threads to be signalled.
    8ef87fe6e87f nfsd: Fix creation time serialization order
    72f28b5ad0b5 NFSD: Add an nfsd4_encode_nfstime4() helper
    b4417c53d4f9 lockd: drop inappropriate svc_get() from locked_get()
    b28b5c726e49 nfsd: fix double fget() bug in __write_ports_addfd()
    8157832461bd nfsd: make a copy of struct iattr before calling notify_change
    05f45f3981d3 NFSD: Fix problem of COMMIT and NFS4ERR_DELAY in infinite loop
    6c05d25ca899 nfsd: simplify the delayed disposal list code
    56b36b8960e5 NFSD: Convert filecache to rhltable
    5a132ffa76bd nfsd: allow reaping files still under writeback
    f7b157737c64 nfsd: update comment over __nfsd_file_cache_purge
    f593ea1423c6 nfsd: don't take/put an extra reference when putting a file
    c3677c14b3d4 nfsd: add some comments to nfsd_file_do_acquire
    c9e8ed6efabe nfsd: don't kill nfsd_files because of lease break error
    2c95ad0a0cb9 nfsd: simplify test_bit return in NFSD_FILE_KEY_FULL comparator
    e378da83577f nfsd: NFSD_FILE_KEY_INODE only needs to find GC'ed entries
    9c599dee8754 nfsd: don't open-code clear_and_wake_up_bit
    65a33135e91e nfsd: call op_release, even when op_func returns an error
    50827896c365 NFSD: Avoid calling OPDESC() with ops->opnum == OP_ILLEGAL
    8235cd619db6 nfsd: don't replace page in rq_pages if it's a continuation of last page
    37b34eb56770 lockd: set file_lock start and end when decoding nlm4 testargs
    b0f33732796b NFSD: Protect against filesystem freezing
    37cd49faaa94 NFSD: copy the whole verifier in nfsd_copy_write_verifier
    dd7d50c695a6 nfsd: don't fsync nfsd_files on last close
    1178547637a2 nfsd: fix courtesy client with deny mode handling in nfs4_upgrade_open
    3db6c79de923 NFSD: fix problems with cleanup on errors in nfsd4_copy
    e5e1dc828499 nfsd: don't hand out delegation on setuid files being opened for write
    2da50149981d NFSD: fix leaked reference count of nfsd4_ssc_umount_item
    fd63299db809 nfsd: clean up potential nfsd_file refcount leaks in COPY codepath
    3c7b9b3487c0 nfsd: allow nfsd_file_get to sanely handle a NULL pointer
    9d7608dc4bd1 NFSD: enhance inter-server copy cleanup
    6856f1385d62 nfsd: don't destroy global nfs4_file table in per-net shutdown
    e997a230d854 nfsd: don't free files unconditionally in __nfsd_file_cache_purge
    2bbf10861d51 NFSD: replace delayed_work with work_struct for nfsd_client_shrinker
    438ef64bbfe4 NFSD: register/unregister of nfsd-client shrinker at nfsd startup/shutdown time
    6ac4c383c39f NFSD: fix use-after-free in nfsd4_ssc_setup_dul()
    2ecc439931ef NFSD: Use set_bit(RQ_DROPME)
    115b58b56f88 Revert "SUNRPC: Use RMW bitops in single-threaded hot paths"
    45c08a752982 nfsd: fix handling of cached open files in nfsd4_open codepath
    f31bc0bc12f3 nfsd: rework refcounting in filecache
    dfbf3066d973 NFSD: Avoid clashing function prototypes
    ea468098605e NFSD: Use only RQ_DROPME to signal the need to drop a reply
    71a98737cdcf NFSD: add delegation reaper to react to low memory condition
    80a81db01ab0 NFSD: add support for sending CB_RECALL_ANY
    87098b663f42 NFSD: refactoring courtesy_client_reaper to a generic low memory shrinker
    35a48412f6a4 NFSD: pass range end to vfs_fsync_range() instead of count
    0d5f3de2b422 lockd: fix file selection in nlmsvc_cancel_blocked
    7ecaa9aff9f5 lockd: ensure we use the correct file descriptor when unlocking
    781c3f3d1812 lockd: set missing fl_flags field when retrieving args
    ae8f2bb3dd34 NFSD: Use struct_size() helper in alloc_session()
    e2505cb85164 nfsd: return error if nfs4_setacl fails
    31c93ee5f1e4 lockd: set other missing fields when unlocking files
    739202b2b9cf NFSD: Add an nfsd_file_fsync tracepoint
    4453e0c1bbab nfsd: fix up the filecache laundrette scheduling
    3d479899f4fe nfsd: reorganize filecache.c
    605a5acd6f42 nfsd: remove the pages_flushed statistic from filecache
    384b23f13672 NFSD: Fix licensing header in filecache.c
    56eedeaf71b0 NFSD: Use rhashtable for managing nfs4_file objects
    8fdef896122f NFSD: Refactor find_file()
    5e92a168495c NFSD: Clean up find_or_add_file()
    5aa2c4a1fe28 NFSD: Add a nfsd4_file_hash_remove() helper
    e77b1d63c02e NFSD: Clean up nfsd4_init_file()
    c152e4ffb9e8 NFSD: Update file_hashtbl() helpers
    b0952d49483a NFSD: Use const pointers as parameters to fh_ helpers
    a10d111fd09f NFSD: Trace delegation revocations
    88cf6a1e76aa NFSD: Trace stateids returned via DELEGRETURN
    14c9c091f2a6 NFSD: Clean up nfs4_preprocess_stateid_op() call sites
    d9991b0b9dd5 NFSD: Flesh out a documenting comment for filecache.c
    5f866f5a8611 NFSD: Add an NFSD_FILE_GC flag to enable nfsd_file garbage collection
    c09b456a81d2 NFSD: Revert "NFSD: NFSv4 CLOSE should release an nfsd_file immediately"
    caa627020132 NFSD: Pass the target nfsd_file to nfsd_commit()
    599d5c22912f exportfs: use pr_debug for unreachable debug statements
    4ab1211c28f1 nfsd: allow disabling NFSv2 at compile time
    68f7bd7f29a0 nfsd: move nfserrno() to vfs.c
    abbd1215c3f9 nfsd: ignore requests to disable unsupported versions
    81714ef8e3ef NFSD: Finish converting the NFSv3 GETACL result encoder
    a20b0abab966 NFSD: Finish converting the NFSv2 GETACL result encoder
    1dd04600f629 NFSD: Remove redundant assignment to variable host_err
    48a237cb5e52 NFSD: Simplify READ_PLUS
    10727ce312c6 nfsd: use locks_inode_context helper
    32c59062f868 lockd: use locks_inode_context helper
    70ffaa7896d9 filelock: add a new locks_inode_context accessor function
    7ea635fc47af NFSD: Fix reads with a non-zero offset that don't end on a page boundary
    7d867c6c30e1 nfsd: put the export reference in nfsd4_verify_deleg_dentry
    551f17db6508 nfsd: fix use-after-free in nfsd_file_do_acquire tracepoint
    31268eb4572b nfsd: fix net-namespace logic in __nfsd_file_cache_purge
    5428383c6fb3 NFSD: unregister shrinker when nfsd_init_net() fails
    1bb33492578c nfsd: rework hashtable handling in nfsd_do_file_acquire
    2db3e73f9afd nfsd: fix nfsd_file_unhash_and_dispose
    683fb922e7b5 fanotify: Remove obsoleted fanotify_event_has_path()
    229e73a0f407 fsnotify: remove unused declaration
    a2d440dce603 fs/notify: constify path
    241685bab277 nfsd: extra checks when freeing delegation stateids
    345e3bb5e82a nfsd: make nfsd4_run_cb a bool return function
    d7f2774d8c59 nfsd: fix comments about spinlock handling with delegations
    89b636270490 nfsd: only fill out return pointer on success in nfsd4_lookup_stateid
    31b16e6b0b78 NFSD: Cap rsize_bop result based on send buffer size
    60b46564e0b6 NFSD: Rename the fields in copy_stateid_t
    b7aea45a67e9 nfsd: use DEFINE_SHOW_ATTRIBUTE to define nfsd_file_cache_stats_fops
    21e18dd5eba4 nfsd: use DEFINE_SHOW_ATTRIBUTE to define nfsd_reply_cache_stats_fops
    443e6484259f nfsd: use DEFINE_SHOW_ATTRIBUTE to define client_info_fops
    615d761a6b99 nfsd: use DEFINE_SHOW_ATTRIBUTE to define export_features_fops and supported_enctypes_fops
    a063abefc6a5 nfsd: use DEFINE_PROC_SHOW_ATTRIBUTE to define nfsd_proc_ops
    cda3e9b8cd5e NFSD: Pack struct nfsd4_compoundres
    a54822e64d3a NFSD: Remove unused nfsd4_compoundargs::cachetype field
    17bb69807867 NFSD: Remove "inline" directives on op_rsize_bop helpers
    f533a01b0982 NFSD: Clean up nfs4svc_encode_compoundres()
    918054d2d8ac NFSD: Clean up WRITE arg decoders
    c92e8b295ae8 NFSD: Use xdr_inline_decode() to decode NFSv3 symlinks
    d08acee648f1 NFSD: Refactor common code out of dirlist helpers
    5e76b25d7cc8 NFSD: Reduce amount of struct nfsd4_compoundargs that needs clearing
    5ed252489368 SUNRPC: Parametrize how much of argsize should be zeroed
    6e50de3b3a28 NFSD: add shrinker to reap courtesy clients on low memory condition
    67302ef04e54 NFSD: keep track of the number of courtesy clients in the system
    1022fe63c57e NFSD: Make nfsd4_remove() wait before returning NFS4ERR_DELAY
    235738ccea3b NFSD: Make nfsd4_rename() wait before returning NFS4ERR_DELAY
    b6c6c7153bdb NFSD: Make nfsd4_setattr() wait before returning NFS4ERR_DELAY
    f326970df189 NFSD: Refactor nfsd_setattr()
    95dce2279c81 NFSD: Add a mechanism to wait for a DELEGRETURN
    3c0e831b87c6 NFSD: Add tracepoints to report NFSv4 callback completions
    bc6bead0af16 nfsd: remove nfsd4_prepare_cb_recall() declaration
    330914c34245 nfsd: clean up mounted_on_fileid handling
    f574d41b1bda NFSD: Fix handling of oversized NFSv4 COMPOUND requests
    b0062184a184 NFSD: drop fname and flen args from nfsd_create_locked()
    c23687911f82 NFSD: Protect against send buffer overflow in NFSv3 READ
    2007867c5874 NFSD: Protect against send buffer overflow in NFSv2 READ
    57774b152616 NFSD: Protect against send buffer overflow in NFSv3 READDIR
    0e57d696f60d NFSD: Protect against send buffer overflow in NFSv2 READDIR
    2bd6f95ff991 NFSD: Increase NFSD_MAX_OPS_PER_COMPOUND
    d40bef3801cd nfsd: Propagate some error code returned by memdup_user()
    490af5b07d85 nfsd: Avoid some useless tests
    cef1ab71ae37 NFSD: remove redundant variable status
    30b0e49a9574 NFSD enforce filehandle check for source file in COPY
    9dc20a662fb8 lockd: move from strlcpy with unused retval to strscpy
    91eebaa181b5 NFSD: move from strlcpy with unused retval to strscpy
    57afda7bf248 nfsd_splice_actor(): handle compound pages
    c7d320e62066 NFSD: fix regression with setting ACLs.
    1f87122d348e lockd: detect and reject lock arguments that overflow
    b15656dfa283 NFSD: discard fh_locked flag and fh_lock/fh_unlock
    5a8d428f5e37 NFSD: use (un)lock_inode instead of fh_(un)lock for file operations
    9ef325edeade NFSD: use explicit lock/unlock for directory ops
    203f09fae4e2 NFSD: reduce locking in nfsd_lookup()
    bedd266b1fe3 NFSD: only call fh_unlock() once in nfsd_link()
    77f83bc2ed03 NFSD: always drop directory lock in nfsd_unlink()
    617f72a1aa6d NFSD: change nfsd_create()/nfsd_symlink() to unlock directory before returning.
    c5409ce523af NFSD: add posix ACLs to struct nfsd_attrs
    18ee0869d6f3 NFSD: add security label to struct nfsd_attrs
    2a5642abeb72 NFSD: set attributes when creating symlinks
    45cf4b1bb10f NFSD: introduce struct nfsd_attrs
    3aac39eaa675 NFSD: verify the opened dentry after setting a delegation
    820bf1383d66 NFSD: drop fh argument from alloc_init_deleg
    c62dcf86332e NFSD: Move copy offload callback arguments into a separate structure
    e1d1b6574e7b NFSD: Add nfsd4_send_cb_offload()
    d87486acbd6e NFSD: Remove kmalloc from nfsd4_do_async_copy()
    a860bd179e7a NFSD: Refactor nfsd4_do_copy()
    8153ed38cc9d NFSD: Refactor nfsd4_cleanup_inter_ssc() (2/2)
    0d592d96d6c6 NFSD: Refactor nfsd4_cleanup_inter_ssc() (1/2)
    ac774e1eebe8 NFSD: Replace boolean fields in struct nfsd4_copy
    627b896c5219 NFSD: Make nfs4_put_copy() static
    0d7e3df76b50 NFSD: Reorder the fields in struct nfsd4_op
    94fd87568e91 NFSD: Shrink size of struct nfsd4_copy
    7c6fd14057a7 NFSD: Shrink size of struct nfsd4_copy_notify
    02bc4d514c25 NFSD: nfserrno(-ENOMEM) is nfserr_jukebox
    8ce03085cc53 NFSD: Fix strncpy() fortify warning
    0a1b9a216f7f NFSD: Clean up nfsd4_encode_readlink()
    c7863472e57e NFSD: Use xdr_pad_size()
    c587004a7634 NFSD: Simplify starting_len
    e77d3f5ee50f NFSD: Optimize nfsd4_encode_readv()
    d176e7348bd0 NFSD: Add an nfsd4_read::rd_eof field
    427bd174a4d3 NFSD: Clean up SPLICE_OK in nfsd4_encode_read()
    8fd87bf897bc NFSD: Optimize nfsd4_encode_fattr()
    d8c3d704085c NFSD: Optimize nfsd4_encode_operation()
    3b5dcf6b46d9 nfsd: silence extraneous printk on nfsd.ko insertion
    f81ab23756ab NFSD: limit the number of v4 clients to 1024 per 1GB of system memory
    ec16f5f7faaa NFSD: keep track of the number of v4 clients in the system
    4e7a739f6372 NFSD: refactoring v4 specific code to a helper in nfs4state.c
    705e2cb1fec0 NFSD: Ensure nf_inode is never dereferenced
    451b2c2125df NFSD: NFSv4 CLOSE should release an nfsd_file immediately
    c553e79c0803 NFSD: Move nfsd_file_trace_alloc() tracepoint
    26664203ddeb NFSD: Separate tracepoints for acquire and create
    de070f66d23f NFSD: Clean up unused code after rhashtable conversion
    a174ce98b302 NFSD: Convert the filecache to use rhashtable
    ebe886ac37d2 NFSD: Set up an rhashtable for the filecache
    1ea9b51f738c NFSD: Replace the "init once" mechanism
    bbb260f3ce9f NFSD: Remove nfsd_file::nf_hashval
    12494d98fea9 NFSD: nfsd_file_hash_remove can compute hashval
    10ba39f78886 NFSD: Refactor __nfsd_file_close_inode()
    a86953523ea9 NFSD: nfsd_file_unhash can compute hashval from nf->nf_inode
    ef7fe4908a1a NFSD: Remove lockdep assertion from unhash_and_release_locked()
    525c2c81fdcc NFSD: No longer record nf_hashval in the trace log
    99735b8d82d1 NFSD: Never call nfsd_file_gc() in foreground paths
    586e8d6c3dc3 NFSD: Fix the filecache LRU shrinker
    51fc2b2c7971 NFSD: Leave open files out of the filecache LRU
    c15db0869e97 NFSD: Trace filecache LRU activity
    7cca6908fa14 NFSD: WARN when freeing an item still linked via nf_lru
    0c426d4621c8 NFSD: Hook up the filecache stat file
    6dc5cab80881 NFSD: Zero counters when the filecache is re-initialized
    04b9376a106f NFSD: Record number of flush calls
    2cba48b3d0a0 NFSD: Report the number of items evicted by the LRU walk
    af057e5884ad NFSD: Refactor nfsd_file_lru_scan()
    e7d5efd20ea9 NFSD: Refactor nfsd_file_gc()
    8d038e72e7ad NFSD: Add nfsd_file_lru_dispose_list() helper
    d176e9840071 NFSD: Report average age of filecache items
    ca9cc17ec04f NFSD: Report count of freed filecache items
    a38dff5964f3 NFSD: Report count of calls to nfsd_file_acquire()
    91c03a61241f NFSD: Report filecache LRU size
    4ff0e22e547e NFSD: Demote a WARN to a pr_warn()
    cc3b111e3b02 nfsd: remove redundant assignment to variable len
    0a18cd2b946b NFSD: Fix space and spelling mistake
    b5b79fc3ff4f NLM: Defend against file_lock changes after vfs_test_lock()
    16acc0677f80 SUNRPC: Fix xdr_encode_bool()
    bcaac325dd95 nfsd: eliminate the NFSD_FILE_BREAK_* flags
    302ae1fb80a3 fsnotify: Fix comment typo
    85c640adf9fc fanotify: introduce FAN_MARK_IGNORE
    99a022c4bcbb fanotify: cleanups for fanotify_mark() input validations
    b8d06d118796 fanotify: prepare for setting event flags in ignore mask
    71860cc4e436 fs: inotify: Fix typo in inotify comment
    795f9fa1b50b lockd: fix nlm_close_files
    486c1acf1423 lockd: set fl_owner when unlocking files
    845b309cf586 NFSD: Decode NFSv4 birth time attribute
    58f985d688aa NFS: restore module put when manager exits.
    e9156a243175 fanotify: refine the validation checks on non-dir inode mask
    6943f1073abe SUNRPC: Optimize xdr_reserve_space()
    ada1757b259f NFSD: Fix potential use-after-free in nfsd_file_put()
    4862b6188603 NFSD: nfsd_file_put() can sleep
    06252d1bd57a NFSD: Add documenting comment for nfsd4_release_lockowner()
    345e2e48d8df NFSD: Modernize nfsd4_release_lockowner()
    13459d22256a nfsd: destroy percpu stats counters after reply cache shutdown
    15081df04a6e nfsd: Fix null-ptr-deref in nfsd_fill_super()
    ff4e7a4b497a nfsd: Unregister the cld notifier when laundry_wq create failed
    e1e87709c453 SUNRPC: Use RMW bitops in single-threaded hot paths
    f7a1ecf2aa4b NFSD: Clean up the show_nf_flags() macro
    7b8462f22a63 NFSD: Trace filecache opens
    a38be0047496 NFSD: Move documenting comment for nfsd4_process_open2()
    bfe9aab120b2 NFSD: Fix whitespace
    2805c5439c95 NFSD: Remove dprintk call sites from tail of nfsd4_open()
    c20097329d2c NFSD: Instantiate a struct file when creating a regular NFSv4 file
    d8714bda3f69 NFSD: Clean up nfsd_open_verified()
    274fd0f9c261 NFSD: Remove do_nfsd_create()
    66af1db0cc37 NFSD: Refactor NFSv4 OPEN(CREATE)
    a019add1b456 NFSD: Refactor NFSv3 CREATE
    a132795b61fe NFSD: Refactor nfsd_create_setattr()
    ee0742a93ccb NFSD: Avoid calling fh_drop_write() twice in do_nfsd_create()
    304505e2e89c NFSD: Clean up nfsd3_proc_create()
    c6207942b255 NFSD: Show state of courtesy client in client info
    4a39f029e7e3 NFSD: add support for lock conflict to courteous server
    97f77d7d501b fs/lock: add 2 callbacks to lock_manager_operations to resolve conflict
    eb2eb6b6afdf fs/lock: add helper locks_owner_has_blockers to check for blockers
    461d0b57c9f3 NFSD: move create/destroy of laundry_wq to init_nfsd and exit_nfsd
    a26848e2bcc9 NFSD: add support for share reservation conflict to courteous server
    67ef9e5fd737 NFSD: add courteous server support for thread with only delegation
    bf1cbe2f3650 NFSD: Clean up nfsd_splice_actor()
    2723d479f51f fanotify: fix incorrect fmode_t casts
    4cd725129e65 fsnotify: consistent behavior for parent not watching children
    e3bce57ffc7b fsnotify: introduce mark type iterator
    f6017a718b63 fanotify: enable "evictable" inode marks
    3083d602ba91 fanotify: use fsnotify group lock helpers
    f85d59005953 fanotify: implement "evictable" inode marks
    80fb0ae4b145 fanotify: factor out helper fanotify_mark_update_flags()
    b9576077eee3 fanotify: create helper fanotify_mark_user_flags()
    ff34ebaa6f6d fsnotify: allow adding an inode mark without pinning inode
    3bd557cfdf99 dnotify: use fsnotify group lock helpers
    cc1c875b6960 nfsd: use fsnotify group lock helpers
    c2c6ced500ad inotify: use fsnotify group lock helpers
    f91ba4a49b6e fsnotify: create helpers for group mark_mutex lock
    74f9be7f64ed fsnotify: make allow_dups a property of the group
    4dc30393bd7b fsnotify: pass flags argument to fsnotify_alloc_group()
    1c47d87317e2 inotify: move control flags from mask to mark flags
    aecfd231bf53 fs/lock: documentation cleanup. Replace inode->i_lock with flc_lock.
    d71ea54835df fanotify: do not allow setting dirent events in mask of non-dir
    9862064ca81f nfsd: Clean up nfsd_file_put()
    cf04df21a46f nfsd: Fix a write performance regression
    997575f1a1b5 SUNRPC: Return true/false (not 1/0) from bool functions
    a5fa9c824db8 fsnotify: remove redundant parameter judgment
    552c24a32ce8 fsnotify: optimize FS_MODIFY events with no ignored masks
    5e84e33832d5 fsnotify: fix merge with parent's ignored mask
    62fa144b8587 nfsd: fix using the correct variable for sizeof()
    e96076f5790f NFSD: Clean up _lm_ operation names
    ec3b252a55f0 NFSD: Remove CONFIG_NFSD_V3
    7e4328b3b98f NFSD: Move svc_serv_ops::svo_function into struct svc_serv
    9802c5746038 NFSD: Remove svc_serv_ops::svo_module
    36c57b27a7d8 SUNRPC: Remove svc_shutdown_net()
    a4bbb1ab69ab SUNRPC: Rename svc_close_xprt()
    c58a9cfd2091 SUNRPC: Rename svc_create_xprt()
    9a43ddd6b626 SUNRPC: Remove svo_shutdown method
    8c60a476704d SUNRPC: Merge svc_do_enqueue_xprt() into svc_enqueue_xprt()
    99ab6abc88ed SUNRPC: Remove the .svo_enqueue_xprt method
    194071d46c5c NFSD: Streamline the rare "found" case
    3304d16c24f5 NFSD: Skip extra computation for RC_NOCACHE case
    4aa8dac58c17 NFSD: De-duplicate hash bucket indexing
    ca6761d39ad2 nfsd: Add support for the birth time attribute
    0d1bbb0efe5a NFSD: Deprecate NFS_OFFSET_MAX
    70a80c7e8d5b NFSD: COMMIT operations must not return NFS?ERR_INVAL
    a231ae6bb50e NFSD: Fix NFSv3 SETATTR/CREATE's handling of large file sizes
    38d02ba22e43 NFSD: Fix ia_size underflow
    1726a39b0879 NFSD: Fix the behavior of READ near OFFSET_MAX
    fc2d8c153d52 lockd: fix failure to cleanup client locks
    20a74a69119e lockd: fix server crash on reboot of client holding lock
    a667e1df409e fanotify: remove variable set but not used
    11bcfabf2481 nfsd: fix crash on COPY_NOTIFY with special stateid
    4eefd1125b96 NFSD: Move fill_pre_wcc() and fill_post_wcc()
    695719e5e6b9 Revert "nfsd: skip some unnecessary stats in the v4 case"
    5e07d49f4abd NFSD: Trace boot verifier resets
    a1c9bcfd16f3 NFSD: Rename boot verifier functions
    e49677ff33f3 NFSD: Clean up the nfsd_net::nfssvc_boot field
    083d44094ff1 NFSD: Write verifier might go backwards
    306d2c1c0803 nfsd: Add a tracepoint for errors in nfsd4_clone_file_range()
    45ef8b7aea36 NFSD: De-duplicate net_generic(nf->nf_net, nfsd_net_id)
    5a1575c02baa NFSD: De-duplicate net_generic(SVC_NET(rqstp), nfsd_net_id)
    aa9ea9ec295f NFSD: Clean up nfsd_vfs_write()
    30282a70aac1 nfsd: Retry once in nfsd_open on an -EOPENSTALE return
    3128aa9c984d nfsd: Add errno mapping for EREMOTEIO
    f12557372b76 nfsd: map EBADF
    9175fcf39c20 NFSD: Fix zero-length NFSv3 WRITEs
    fab02e979949 nfsd4: add refcount for nfsd4_blocked_lock
    535204ecaed0 nfs: block notification on fs with its own ->lock
    bf5e7e1fa1db NFSD: De-duplicate nfsd4_decode_bitmap4()
    5a0710a6b40a nfsd: improve stateid access bitmask documentation
    f0dbe05f6df2 NFSD: Combine XDR error tracepoints
    e8f923e1e9fc NFSD: simplify per-net file cache management
    677fd67d8b80 NFSD: Fix inconsistent indenting
    0bc12c128940 NFSD: Remove be32_to_cpu() from DRC hash function
    e072a635c1ef NFS: switch the callback service back to non-pooled.
    948e4664cc37 lockd: use svc_set_num_threads() for thread start and stop
    deeda24a6762 SUNRPC: always treat sv_nrpools==1 as "not pooled"
    74a0e37a2099 SUNRPC: move the pool_map definitions (back) into svc.c
    9fe19a48a3bf lockd: rename lockd_create_svc() to lockd_get()
    e5087b3d584f lockd: introduce lockd_put()
    8304dd04fb7b lockd: move svc_exit_thread() into the thread
    7077a0070375 lockd: move lockd_start_svc() call into lockd_create_svc()
    a389baad9137 lockd: simplify management of network status notifiers
    32f3e5a70f28 lockd: introduce nlmsvc_serv
    d95899dadb4d NFSD: simplify locking for network notifier.
    7149250beeea SUNRPC: discard svo_setup and rename svc_set_num_threads_sync()
    361452374168 NFSD: Make it possible to use svc_set_num_threads_sync
    6343271d5315 NFSD: narrow nfsd_mutex protection in nfsd thread
    61d12fc30a5e SUNRPC: use sv_lock to protect updates to sv_nrthreads.
    4efe0b9d11fc nfsd: make nfsd_stats.th_cnt atomic_t
    17041f014060 SUNRPC: stop using ->sv_nrthreads as a refcount
    64312a7c9fa1 SUNRPC/NFSD: clean up get/put functions.
    e9a4156137cf SUNRPC: change svc_get() to return the svc.
    e0bf89935220 NFSD: handle errors better in write_ports_addfd()
    307b391221ce NFSD: Fix sparse warning
    c59dc174b2e4 exit: Rename module_put_and_exit to module_put_and_kthread_exit
    15606c8d5200 exit: Implement kthread_exit
    63b8c1923117 fanotify: wire up FAN_RENAME event
    a860dd8bf571 fanotify: report old and/or new parent+name in FAN_RENAME event
    c76fa8515949 fanotify: record either old name new name or both for FAN_RENAME
    da527da33bcd fanotify: record old and new parent and name in FAN_RENAME event
    f59e978cfa9f fanotify: support secondary dir fh and name in fanotify_info
    967ae137209c fanotify: use helpers to parcel fanotify_info buffer
    4e63ce91997a fanotify: use macros to get the offset to fanotify_info buffer
    580eb8de8470 fsnotify: generate FS_RENAME event with rich information
    4e59c7b3e3b6 fanotify: introduce group flag FAN_REPORT_TARGET_FID
    be14cab43ddf fsnotify: separate mark iterator type from object type enum
    c0a5f0b561c8 fsnotify: clarify object type argument
    9e291a6a28d3 NFSD: Fix READDIR buffer overflow
    1abf3ec55877 NFSD: Fix exposure in nfsd4_decode_bitmap()
    88ccda1a8143 nfsd4: remove obselete comment
    f4e9e9565e42 NFSD:fix boolreturn.cocci warning
    022723fe1507 nfsd: update create verifier comment
    c7b0a9c75d3c SUNRPC: Change return value type of .pc_encode
    61cf6815070a SUNRPC: Replace the "__be32 *p" parameter to .pc_encode
    47047d40af7b NFSD: Save location of NFSv4 COMPOUND status
    f747ce574c4a SUNRPC: Change return value type of .pc_decode
    0696b6b513a7 SUNRPC: Replace the "__be32 *p" parameter to .pc_decode
    396b359832e7 NFSD: Have legacy NFSD WRITE decoders use xdr_stream_subsegment()
    c23b25dd1928 NFSD: Initialize pointer ni with NULL and not plain integer 0
    678418809092 NFSD: simplify struct nfsfh
    25054b04ec92 NFSD: drop support for ancient filehandles
    918bc45a57bc NFSD: move filehandle format declarations out of "uapi".
    d2815110a741 NFSD: Optimize DRC bucket pruning
    2b2963c72c8a SUNRPC: Trace calls to .rpc_call_done
    2eda01447798 fanotify: Allow users to request FAN_FS_ERROR events
    b0f01b7c0808 fanotify: Emit generic error info for error event
    aefd9029fa50 fanotify: Report fid info for file related file system errors
    bb247feb22d7 fanotify: WARN_ON against too large file handles
    7fa20568b6e5 fanotify: Add helpers to decide whether to report FID/DFID
    7935cf4070c4 fanotify: Wrap object_fh inline space in a creator macro
    b974c8aa0081 fanotify: Support merging of error events
    9b98f4ff5186 fanotify: Support enqueueing of error events
    68aacb60a799 fanotify: Pre-allocate pool of error events
    eec22d03a98e fanotify: Reserve UAPI bits for FAN_FS_ERROR
    badbf879deca fsnotify: Support FS_ERROR event type
    8ccc724f5070 fanotify: Require fid_mode for any non-fd event
    2f65be620948 fanotify: Encode empty file handle when no inode is provided
    86bda2d75252 fanotify: Allow file handle encoding for unhashed events
    44ce59c25410 fanotify: Support null inode event in fanotify_dfid_inode
    313234a93ea1 fsnotify: Pass group argument to free_event
    c9f9d99ea4c3 fsnotify: Protect fsnotify_handle_inode_event from no-inode events
    5c4ce075c92b fsnotify: Retrieve super block from the data field
    44844158eea6 fsnotify: Add wrapper around fsnotify_add_event
    24eda1b5e6f6 fsnotify: Add helper to detect overflow_event
    7c9ba74cb30b inotify: Don't force FS_IN_IGNORED
    9539a89f28ed fanotify: Split fsid check from other fid mode checks
    326be73a5985 fanotify: Fold event size calculation to its own function
    7fee789540e9 fsnotify: Don't insert unmergeable events in hashtable
    60b6dab8c81e fsnotify: clarify contract for create event hooks
    9601d2073406 fsnotify: pass dentry instead of inode data
    f114860f7279 fsnotify: pass data_type to fsnotify_name()
    6719531e6713 nfsd: Fix a warning for nfsd_file_close_inode
    7918a95bc226 NLM: Fix svcxdr_encode_owner()
    b801327ba3c3 fsnotify: fix sb_connectors leak
    1773901afb33 NFS: Remove unused callback void decoder
    edf220fe1516 NFS: Add a private local dispatcher for NFSv4 callback operations
    91bbbffece63 SUNRPC: Eliminate the RQ_AUTHERR flag
    febf43bcdc2b SUNRPC: Set rq_auth_stat in the pg_authenticate() callout
    a96da583ff54 SUNRPC: Add svc_rqst::rq_auth_stat
    efea5d558ef3 nfs: don't allow reexport reclaims
    bd5b3deed01a lockd: don't attempt blocking locks on nfs reexports
    5ea5be84ddd7 nfs: don't atempt blocking locks on nfs reexports
    e580323ac0b5 Keep read and write fds with each nlm_file
    b4bf52174b4f lockd: update nlm_lookup_file reexport comment
    14c2a0fad541 nlm: minor refactoring
    3fbc744783dd nlm: minor nlm_lookup_file argument change
    860f01260e53 lockd: change the proc_handler for nsm_use_hostnames
    f469e60f9a0f sysctl: introduce new proc handler proc_dobool
    130dcbf77a7e NFSD: remove vanity comments
    86df138e8d4d NFSD: Batch release pages during splice read
    a4f616afb4ee SUNRPC: Add svc_rqst_replace_page() API
    9e5f2e0ae019 NFSD: Clean up splice actor
    860893f9e351 fsnotify: optimize the case of no marks of any type
    9917e1bda3d7 fsnotify: count all objects with attached connectors
    44858a348881 fsnotify: count s_fsnotify_inode_refs for attached connectors
    cdbf9c5f81d0 fsnotify: replace igrab() with ihold() on attach connector
    cde8883b0b29 fanotify: add pidfd support to the fanotify API
    77bc7f529abd fanotify: introduce a generic info record copying helper
    3ddcb1939608 fanotify: minor cosmetic adjustments to fid labels
    03b5d3ee505b kernel/pid.c: implement additional checks upon pidfd_create() parameters
    774c2dbca76e kernel/pid.c: remove static qualifier from pidfd_create()
    e79057d15d96 nfsd: fix NULL dereference in nfs3svc_encode_getaclres
    5610ed80e860 NFSD: Prevent a possible oops in the nfs_dirent() tracepoint
    17600880e153 nfsd: remove redundant assignment to pointer 'this'
    ce1819876203 lockd: Update the NLMv4 SHARE results encoder to use struct xdr_stream
    fec073099281 lockd: Update the NLMv4 nlm_res results encoder to use struct xdr_stream
    e1e61d647f26 lockd: Update the NLMv4 TEST results encoder to use struct xdr_stream
    4f5ba2e6b434 lockd: Update the NLMv4 void results encoder to use struct xdr_stream
    0add7c13bf78 lockd: Update the NLMv4 FREE_ALL arguments decoder to use struct xdr_stream
    604c8a432c6c lockd: Update the NLMv4 SHARE arguments decoder to use struct xdr_stream
    300a4b1632c3 lockd: Update the NLMv4 SM_NOTIFY arguments decoder to use struct xdr_stream
    33f31f6e85d1 lockd: Update the NLMv4 nlm_res arguments decoder to use struct xdr_stream
    9e1daae6303a lockd: Update the NLMv4 UNLOCK arguments decoder to use struct xdr_stream
    0652983fbe18 lockd: Update the NLMv4 CANCEL arguments decoder to use struct xdr_stream
    101d45274aba lockd: Update the NLMv4 LOCK arguments decoder to use struct xdr_stream
    360159aafa8b lockd: Update the NLMv4 TEST arguments decoder to use struct xdr_stream
    c8f404825085 lockd: Update the NLMv4 void arguments decoder to use struct xdr_stream
    45c1384bd767 lockd: Update the NLMv1 SHARE results encoder to use struct xdr_stream
    b04947679016 lockd: Update the NLMv1 nlm_res results encoder to use struct xdr_stream
    d0ddd21bd52c lockd: Update the NLMv1 TEST results encoder to use struct xdr_stream
    e6c92714e9a6 lockd: Update the NLMv1 void results encoder to use struct xdr_stream
    02a3c81665ac lockd: Update the NLMv1 FREE_ALL arguments decoder to use struct xdr_stream
    6c522daf6092 lockd: Update the NLMv1 SHARE arguments decoder to use struct xdr_stream
    56c936af53e3 lockd: Update the NLMv1 SM_NOTIFY arguments decoder to use struct xdr_stream
    90f483a77544 lockd: Update the NLMv1 nlm_res arguments decoder to use struct xdr_stream
    b4ea38d69d89 lockd: Update the NLMv1 UNLOCK arguments decoder to use struct xdr_stream
    2025b3acf655 lockd: Update the NLMv1 CANCEL arguments decoder to use struct xdr_stream
    3e8675ff1ebc lockd: Update the NLMv1 LOCK arguments decoder to use struct xdr_stream
    8f9f41ebfa17 lockd: Update the NLMv1 TEST arguments decoder to use struct xdr_stream
    4c3f448aaa0b lockd: Update the NLMv1 void argument decoder to use struct xdr_stream
    fa4b890c0da0 lockd: Common NLM XDR helpers
    3595ff1c2caa lockd: Create a simplified .vs_dispatch method for NLM requests
    eeea3b96d150 lockd: Remove stale comments
    c58120ab4765 nfsd: rpc_peeraddr2str needs rcu lock
    2983611a663e NFSD: Fix error return code in nfsd4_interssc_connect()
    c5a305d93e6b nfsd: fix kernel test robot warning in SSC code
    22b7c93d9674 nfsd4: Expose the callback address and state of each NFS4 client
    dbc0aa479595 nfsd: move fsnotify on client creation outside spinlock
    a4bc287943f5 NFSD: delay unmount source's export after inter-server copy completed.
    817c6eb97579 NFSD add vfs_fsync after async copy is done
    94a892470173 nfsd: move some commit_metadata()s outside the inode lock
    f666a75ccd9c nfsd: Prevent truncation of an unlinked inode from blocking access to its directory
    e7bbdd7deeb2 NFSD: Update nfsd_cb_args tracepoint
    3e8aeb13a730 NFSD: Remove the nfsd_cb_work and nfsd_cb_done tracepoints
    3a63aa2459dc NFSD: Add an nfsd_cb_probe tracepoint
    a577eb06dee4 NFSD: Replace the nfsd_deleg_break tracepoint
    9f76187f0a46 NFSD: Add an nfsd_cb_offload tracepoint
    60aac215347c NFSD: Add an nfsd_cb_lm_notify tracepoint
    59ddc5a82bc3 NFSD: Enhance the nfsd_cb_setup tracepoint
    fc3b4f0188e9 NFSD: Adjust cb_shutdown tracepoint
    634816f9d3de NFSD: Add cb_lost tracepoint
    3076ede3fc10 NFSD: Drop TRACE_DEFINE_ENUM for NFSD4_CB_<state> macros
    2be1f2275193 NFSD: Capture every CB state transition
    b6ba775ccc94 NFSD: Constify @fh argument of knfsd_fh_hash()
    88b3cdfd4873 NFSD: Add tracepoints for EXCHANGEID edge cases
    5070351cdceb NFSD: Add tracepoints for SETCLIENTID edge cases
    650530d52260 NFSD: Add a couple more nfsd_clid_expired call sites
    056332823cdc NFSD: Add nfsd_clid_destroyed tracepoint
    580ec8b6536a NFSD: Add nfsd_clid_reclaim_complete tracepoint
    3b6808c793f3 NFSD: Add nfsd_clid_confirmed tracepoint
    c6889b75a617 NFSD: Remove trace_nfsd_clid_inuse_err
    8da187120665 NFSD: Add nfsd_clid_verf_mismatch tracepoint
    c8493d73083c NFSD: Add nfsd_clid_cred_mismatch tracepoint
    b00bb7dfe259 NFSD: Add an RPC authflavor tracepoint display helper
    a4d250f5107c fanotify: fix permission model of unprivileged group
    0245993ace73 NFS: fix nfs_fetch_iversion()
    b2c0c7cb7fe3 NFSv4.2: Remove ifdef CONFIG_NFSD from NFSv4.2 client SSC code.
    3793f28102f1 nfsd: Fix fall-through warnings for Clang
    39ab09108e28 nfsd: grant read delegations to clients holding writes
    d2431cc9670a nfsd: reshuffle some code
    ee548b162990 nfsd: track filehandle aliasing in nfs4_files
    cc6d658669f8 nfsd: hash nfs4_files by inode number
    e63b956b2da9 nfsd: removed unused argument in nfsd_startup_generic()
    856b0c4979c7 nfsd: remove unused function
    bd373a90d048 fanotify_user: use upper_32_bits() to verify mask
    4ac0ad23728a fanotify: support limited functionality for unprivileged users
    3e441a872a57 fanotify: configurable limits via sysfs
    7df80a90e1a1 fanotify: limit number of event merge attempts
    40e1e98c1bb2 fsnotify: use hash table for faster events merge
    ae7fd89daeb6 fanotify: mix event info and pid into merge key hash
    5b57a2b74d01 fanotify: reduce event objectid to 29-bit hash
    4f1494894293 Revert "fanotify: limit number of event merge attempts"
    62b7f3847373 fsnotify: allow fsnotify_{peek,remove}_first_event with empty queue
    d9168ab8d714 NFSD: Use DEFINE_SPINLOCK() for spinlock
    b20d88bf1eab UAPI: nfsfh.h: Replace one-element array with flexible-array member
    117dac268d80 SUNRPC: Export svc_xprt_received()
    289adc864d0a nfsd: report client confirmation status in "info" file
    14b13e0603f8 nfsd: don't ignore high bits of copy count
    1f76b1e65926 nfsd: COPY with length 0 should copy to end of file
    ed0181939064 nfsd: Fix typo "accesible"
    2a5df97ba41c nfsd: Log client tracking type log message as info instead of warning
    0fa20162bfc7 nfsd: helper for laundromat expiry calculations
    aab7be2475d1 NFSD: Clean up NFSDDBG_FACILITY macro
    e7dac943b4d4 NFSD: Add a tracepoint to record directory entry encoding
    a6d9f6f371cb NFSD: Clean up after updating NFSv3 ACL encoders
    857a37235cf0 NFSD: Update the NFSv3 SETACL result encoder to use struct xdr_stream
    d505e6619107 NFSD: Update the NFSv3 GETACL result encoder to use struct xdr_stream
    67d4f36707ad NFSD: Clean up after updating NFSv2 ACL encoders
    3d2033a58c6c NFSD: Update the NFSv2 ACL ACCESS result encoder to use struct xdr_stream
    6ef7a56fd7fa NFSD: Update the NFSv2 ACL GETATTR result encoder to use struct xdr_stream
    82ac35b16710 NFSD: Update the NFSv2 SETACL result encoder to use struct xdr_stream
    6677b0d16abe NFSD: Update the NFSv2 GETACL result encoder to use struct xdr_stream
    89ac9a8101ad NFSD: Add an xdr_stream-based encoder for NFSv2/3 ACLs
    93584780eb4d NFSD: Remove unused NFSv2 directory entry encoders
    b8658c947d54 NFSD: Update the NFSv2 READDIR entry encoder to use struct xdr_stream
    801e4d79b779 NFSD: Update the NFSv2 READDIR result encoder to use struct xdr_stream
    bc17759a4e99 NFSD: Count bytes instead of pages in the NFSv2 READDIR encoder
    c4e272758974 NFSD: Add a helper that encodes NFSv3 directory offset cookies
    60bc5af5b8dc NFSD: Update the NFSv2 STATFS result encoder to use struct xdr_stream
    ad0614d3a857 NFSD: Update the NFSv2 READ result encoder to use struct xdr_stream
    27909a583cc3 NFSD: Update the NFSv2 READLINK result encoder to use struct xdr_stream
    9aab4f03e8f2 NFSD: Update the NFSv2 diropres encoder to use struct xdr_stream
    c64d5d0ca9f9 NFSD: Update the NFSv2 attrstat encoder to use struct xdr_stream
    816c23c911f6 NFSD: Update the NFSv2 stat encoder to use struct xdr_stream
    e4e6019ce5a2 NFSD: Reduce svc_rqst::rq_pages churn during READDIR operations
    d8554802010d NFSD: Remove unused NFSv3 directory entry encoders
    37aa5e640222 NFSD: Update NFSv3 READDIR entry encoders to use struct xdr_stream
    7cbec0dc097a NFSD: Update the NFSv3 READDIR3res encoder to use struct xdr_stream
    cacfe8f6d809 NFSD: Count bytes instead of pages in the NFSv3 READDIR encoder
    3b2fef48b77c NFSD: Add a helper that encodes NFSv3 directory offset cookies
    30dabf1d4fd4 NFSD: Update the NFSv3 COMMIT3res encoder to use struct xdr_stream
    349d96b070de NFSD: Update the NFSv3 PATHCONF3res encoder to use struct xdr_stream
    4c06f831d28b NFSD: Update the NFSv3 FSINFO3res encoder to use struct xdr_stream
    f6908e2bcd84 NFSD: Update the NFSv3 FSSTAT3res encoder to use struct xdr_stream
    066dc317fa65 NFSD: Update the NFSv3 LINK3res encoder to use struct xdr_stream
    0404cffec413 NFSD: Update the NFSv3 RENAMEv3res encoder to use struct xdr_stream
    1863ca4c9e29 NFSD: Update the NFSv3 CREATE family of encoders to use struct xdr_stream
    8737a75f265d NFSD: Update the NFSv3 WRITE3res encoder to use struct xdr_stream
    b241ab982373 NFSD: Update the NFSv3 READ3res encode to use struct xdr_stream
    170e6bd25e69 NFSD: Update the NFSv3 READLINK3res encoder to use struct xdr_stream
    c3995f8be13a NFSD: Update the NFSv3 wccstat result encoder to use struct xdr_stream
    f74e0652a60b NFSD: Update the NFSv3 LOOKUP3res encoder to use struct xdr_stream
    fd9e183df625 NFSD: Update the NFSv3 ACCESS3res encoder to use struct xdr_stream
    0ef12d755c4b NFSD: Update the GETATTR3res encoder to use struct xdr_stream
    48aadfa75b61 NFSD: Extract the svcxdr_init_encode() helper
    e864d4d834f8 namei: introduce struct renamedata
    b0fa673c8c24 fs: add file and path permissions helpers
    666a41329592 kallsyms: only build {,module_}kallsyms_on_each_symbol when required
    f8d856862724 kallsyms: refactor {,module_}kallsyms_on_each_symbol
    bef9d8b4f84b module: use RCU to synchronize find_module
    32edffff869a module: unexport find_module and module_mutex
    51f620fcc419 inotify, memcg: account inotify instances to kmemcg
    c1fe2bb305a2 nfsd: skip some unnecessary stats in the v4 case
    0220d5118648 nfs: use change attribute for NFS re-exports
    5a0b45626fc1 NFSv4_2: SSC helper should use its own config.
    b267f61182c1 nfsd: cstate->session->se_client -> cstate->clp
    bc6015541cda nfsd: simplify nfsd4_check_open_reclaim
    25ac4fdbdce7 nfsd: remove unused set_client argument
    87ab73c1cc75 nfsd: find_cpntf_state cleanup
    1d4ccfdc7d0e nfsd: refactor set_client
    17006574683f nfsd: rename lookup_clientid->set_client
    ea92c0768f98 nfsd: simplify nfsd_renew
    52923f25be3c nfsd: simplify process_lock
    4f26b1747a2e nfsd4: simplify process_lookup1
    42cf742d8626 nfsd: report per-export stats
    65b1df135884 nfsd: protect concurrent access to nfsd stats counters
    d1344de0d66d nfsd: remove unused stats counters
    0a13baa6ab5a NFSD: Clean up after updating NFSv3 ACL decoders
    22af3dfbe657 NFSD: Update the NFSv2 SETACL argument decoder to use struct xdr_stream
    f89e3fa89e46 NFSD: Update the NFSv3 GETACL argument decoder to use struct xdr_stream
    5ea5e56cfb57 NFSD: Clean up after updating NFSv2 ACL decoders
    81f79eb2237b NFSD: Update the NFSv2 ACL ACCESS argument decoder to use struct xdr_stream
    9eea3915dd81 NFSD: Update the NFSv2 ACL GETATTR argument decoder to use struct xdr_stream
    508a791fbe87 NFSD: Update the NFSv2 SETACL argument decoder to use struct xdr_stream
    e077857ef0f8 NFSD: Add an xdr_stream-based decoder for NFSv2/3 ACLs
    ea6b0e02dcac NFSD: Update the NFSv2 GETACL argument decoder to use struct xdr_stream
    e44061388635 NFSD: Remove argument length checking in nfsd_dispatch()
    7e6746027b05 NFSD: Update the NFSv2 SYMLINK argument decoder to use struct xdr_stream
    1db54ce543bc NFSD: Update the NFSv2 CREATE argument decoder to use struct xdr_stream
    40de4113f801 NFSD: Update the NFSv2 SETATTR argument decoder to use struct xdr_stream
    ebfb21605f1a NFSD: Update the NFSv2 LINK argument decoder to use struct xdr_stream
    a362dd478be0 NFSD: Update the NFSv2 RENAME argument decoder to use struct xdr_stream
    0047abd4c411 NFSD: Update NFSv2 diropargs decoding to use struct xdr_stream
    7d9ab8ee576f NFSD: Update the NFSv2 READDIR argument decoder to use struct xdr_stream
    672111a40872 NFSD: Add helper to set up the pages where the dirlist is encoded
    365835d2ff67 NFSD: Update the NFSv2 READLINK argument decoder to use struct xdr_stream
    ecee6ba5920c NFSD: Update the NFSv2 WRITE argument decoder to use struct xdr_stream
    6e88b7ec6cd5 NFSD: Update the NFSv2 READ argument decoder to use struct xdr_stream
    ba7e0412fb5a NFSD: Update the NFSv2 GETATTR argument decoder to use struct xdr_stream
    9ceeee0ec887 NFSD: Update the MKNOD3args decoder to use struct xdr_stream
    8841760f685b NFSD: Update the SYMLINK3args decoder to use struct xdr_stream
    b5d1ae6cc4c2 NFSD: Update the MKDIR3args decoder to use struct xdr_stream
    bd54084b587f NFSD: Update the CREATE3args decoder to use struct xdr_stream
    48ea0cb79b45 NFSD: Update the SETATTR3args decoder to use struct xdr_stream
    71d7e7c6a6f4 NFSD: Update the LINK3args decoder to use struct xdr_stream
    e84af2339181 NFSD: Update the RENAME3args decoder to use struct xdr_stream
    69e54a4470a4 NFSD: Update the NFSv3 DIROPargs decoder to use struct xdr_stream
    47614a374e65 NFSD: Update COMMIT3arg decoder to use struct xdr_stream
    fbcd66801610 NFSD: Update READDIR3args decoders to use struct xdr_stream
    e0ddafcc25e5 NFSD: Add helper to set up the pages where the dirlist is encoded
    29270d477fff NFSD: Fix returned READDIR offset cookie
    19285d319f7c NFSD: Update READLINK3arg decoder to use struct xdr_stream
    5f36ae59d6cc NFSD: Update WRITE3arg decoder to use struct xdr_stream
    b77a4a968d1d NFSD: Update READ3arg decoder to use struct xdr_stream
    7bb23be4501b NFSD: Update ACCESS3arg decoder to use struct xdr_stream
    d668aa92a624 NFSD: Update GETATTR3args decoder to use struct xdr_stream
    22b19656eaac SUNRPC: Move definition of XDR_UNIT
    97d254cba30d SUNRPC: Display RPC procedure names instead of proc numbers
    c336597d03ec SUNRPC: Make trace_svc_process() display the RPC procedure symbolically
    5b82798f78f9 NFSD: Restore NFSv4 decoding's SAVEMEM functionality
    bca0057f686b NFSD: Fix sparse warning in nfssvc.c
    131676b8240f fs/lockd: convert comma to semicolon
    185e81a977d1 inotify: Increase default inotify.max_user_watches limit to 1048576
    1aecdaa7e2c6 file: Replace ksys_close with close_fd
    6d256a904cd7 file: Rename __close_fd to close_fd and remove the files parameter
    7458c5ae465e file: Merge __alloc_fd into alloc_fd
    9e8ef54ca890 file: In f_dupfd read RLIMIT_NOFILE once.
    89f9e529643a file: Merge __fd_install into fd_install
    b4b827da9096 proc/fd: In fdinfo seq_show don't use get_files_struct
    c0e3f6df04ce proc/fd: In proc_readfd_common use task_lookup_next_fd_rcu
    a6da7536e488 file: Implement task_lookup_next_fd_rcu
    6007aeeaefb3 kcmp: In get_file_raw_ptr use task_lookup_fd_rcu
    c2291f7bdf25 proc/fd: In tid_fd_mode use task_lookup_fd_rcu
    32ac87287d0b file: Implement task_lookup_fd_rcu
    c4716bb29650 file: Rename fcheck lookup_fd_rcu
    23f55649921b file: Replace fcheck_files with files_lookup_fd_rcu
    9080557c56cd file: Factor files_lookup_fd_locked out of fcheck_files
    ddb21f998420 file: Rename __fcheck_files to files_lookup_fd_raw
    e6f42bc11a60 Revert "fget: clarify and improve __fget_files() implementation"
    4d037e1173b5 proc/fd: In proc_fd_link use fget_task
    c874ec02cb8a bpf: In bpf_task_fd_query use fget_task
    fe1722255ebd kcmp: In kcmp_epoll_target use fget_task
    ba7aac19b4be exec: Remove reset_files_struct
    44f79df28b47 exec: Simplify unshare_files
    5091d051c51d exec: Move unshare_files to fix posix file locking during exec
    527c9b6eb18d exec: Don't open code get_close_on_exec
    8f1df3d0c146 nfsd: Record NFSv4 pre/post-op attributes as non-atomic
    0750e494c75e nfsd: Set PF_LOCAL_THROTTLE on local filesystems only
    f3056a0ac2c5 nfsd: Fix up nfsd to ensure that timeout errors don't result in ESTALE
    38e213c1e41e exportfs: Add a function to return the raw output from fh_to_dentry()
    93f7d515d873 nfsd: close cached files prior to a REMOVE or RENAME that would replace target
    203ca3253b34 nfsd: allow filesystems to opt out of subtree checking
    d5314c9bb7f5 nfsd: add a new EXPORT_OP_NOWCC flag to struct export_operations
    34de27ed8447 Revert "nfsd4: support change_attr_type attribute"
    b720ceec88a7 nfsd4: don't query change attribute in v2/v3 case
    796785a79b4a nfsd: minor nfsd4_change_attribute cleanup
    88dea0f92b20 nfsd: simplify nfsd4_change_info
    f8032b859df6 nfsd: only call inode_query_iversion in the I_VERSION case
    3aea16e6b70b NFSD: Remove macros that are no longer used
    b24e6a40eeba NFSD: Replace READ* macros in nfsd4_decode_compound()
    6b48808835a2 NFSD: Make nfsd4_ops::opnum a u32
    c2d0c16990b9 NFSD: Replace READ* macros in nfsd4_decode_listxattrs()
    8e1b8a78a929 NFSD: Replace READ* macros in nfsd4_decode_setxattr()
    9bc67df0f9a2 NFSD: Replace READ* macros in nfsd4_decode_xattr_name()
    b719fc9375cc NFSD: Replace READ* macros in nfsd4_decode_clone()
    a2f6c16ad138 NFSD: Replace READ* macros in nfsd4_decode_seek()
    f8eb5424e318 NFSD: Replace READ* macros in nfsd4_decode_offload_status()
    c2d2a919b2f2 NFSD: Replace READ* macros in nfsd4_decode_copy_notify()
    8604d294c128 NFSD: Replace READ* macros in nfsd4_decode_copy()
    dc1a31ca8e96 NFSD: Replace READ* macros in nfsd4_decode_nl4_server()
    a0b8dabc5906 NFSD: Replace READ* macros in nfsd4_decode_fallocate()
    de0dc37a791e NFSD: Replace READ* macros in nfsd4_decode_reclaim_complete()
    093f9d2c8f4c NFSD: Replace READ* macros in nfsd4_decode_destroy_clientid()
    7675420fdebe NFSD: Replace READ* macros in nfsd4_decode_test_stateid()
    f0de0b689549 NFSD: Replace READ* macros in nfsd4_decode_sequence()
    1ea743dc481f NFSD: Replace READ* macros in nfsd4_decode_secinfo_no_name()
    b63e313dce04 NFSD: Replace READ* macros in nfsd4_decode_layoutreturn()
    40e627c502da NFSD: Replace READ* macros in nfsd4_decode_layoutget()
    40770a0f8ef6 NFSD: Replace READ* macros in nfsd4_decode_layoutcommit()
    c0a4c4e46b8a NFSD: Replace READ* macros in nfsd4_decode_getdeviceinfo()
    5f892c11787e NFSD: Replace READ* macros in nfsd4_decode_free_stateid()
    92ae309a9908 NFSD: Replace READ* macros in nfsd4_decode_destroy_session()
    73684a8118f3 NFSD: Replace READ* macros in nfsd4_decode_create_session()
    2bd9ef494a2c NFSD: Add a helper to decode channel_attrs4
    d01f41320d2a NFSD: Add a helper to decode nfs_impl_id4
    d50a76f1f3fc NFSD: Add a helper to decode state_protect4_a
    0c935af3cfb7 NFSD: Add a separate decoder for ssv_sp_parms
    cb568dbdef68 NFSD: Add a separate decoder to handle state_protect_ops
    b73633804246 NFSD: Replace READ* macros in nfsd4_decode_bind_conn_to_session()
    7d2108407466 NFSD: Replace READ* macros in nfsd4_decode_backchannel_ctl()
    5658ca0651e6 NFSD: Replace READ* macros in nfsd4_decode_cb_sec()
    79f1a8323a34 NFSD: Replace READ* macros in nfsd4_decode_release_lockowner()
    eeab2f3bf284 NFSD: Replace READ* macros in nfsd4_decode_write()
    b1af8f131eb8 NFSD: Replace READ* macros in nfsd4_decode_verify()
    19a4c05e8167 NFSD: Replace READ* macros in nfsd4_decode_setclientid_confirm()
    2503dcf0f68a NFSD: Replace READ* macros in nfsd4_decode_setclientid()
    7c06ba5c8bf4 NFSD: Replace READ* macros in nfsd4_decode_setattr()
    5277d6034642 NFSD: Replace READ* macros in nfsd4_decode_secinfo()
    2cef1009f8e7 NFSD: Replace READ* macros in nfsd4_decode_renew()
    e2b287a53cca NFSD: Replace READ* macros in nfsd4_decode_rename()
    274b8f0597cf NFSD: Replace READ* macros in nfsd4_decode_remove()
    c24e2a4943ab NFSD: Replace READ* macros in nfsd4_decode_readdir()
    d0a0219a35fc NFSD: Replace READ* macros in nfsd4_decode_read()
    4b28cd7e8322 NFSD: Replace READ* macros in nfsd4_decode_putfh()
    ad1ea32c9732 NFSD: Replace READ* macros in nfsd4_decode_open_downgrade()
    e557a2eabb35 NFSD: Replace READ* macros in nfsd4_decode_open_confirm()
    f6eb911d790b NFSD: Replace READ* macros in nfsd4_decode_open()
    4507c23e4204 NFSD: Add helper to decode OPEN's open_claim4 argument
    48385b58bcf6 NFSD: Replace READ* macros in nfsd4_decode_share_deny()
    fa60cc6971fb NFSD: Replace READ* macros in nfsd4_decode_share_access()
    070df4a4e986 NFSD: Add helper to decode OPEN's openflag4 argument
    c1ea8812d421 NFSD: Add helper to decode OPEN's createhow4 argument
    11ea3e65f070 NFSD: Add helper to decode NFSv4 verifiers
    def95074db3c NFSD: Replace READ* macros in nfsd4_decode_lookup()
    340878b2e0a5 NFSD: Replace READ* macros in nfsd4_decode_locku()
    3625de1522fa NFSD: Replace READ* macros in nfsd4_decode_lockt()
    8357985d2185 NFSD: Replace READ* macros in nfsd4_decode_lock()
    d27f2dcedae2 NFSD: Add helper for decoding locker4
    0c281b7083f2 NFSD: Add helpers to decode a clientid4 and an NFSv4 state owner
    753bb6b0e788 NFSD: Relocate nfsd4_decode_opaque()
    84bc365eee7f NFSD: Replace READ* macros in nfsd4_decode_link()
    42c4437d78e6 NFSD: Replace READ* macros in nfsd4_decode_getattr()
    42e319695efc NFSD: Replace READ* macros in nfsd4_decode_delegreturn()
    3012fe5fea55 NFSD: Replace READ* macros in nfsd4_decode_create()
    57516a96cae8 NFSD: Replace READ* macros in nfsd4_decode_fattr()
    9737a9a8f923 NFSD: Replace READ* macros that decode the fattr4 umask attribute
    91a6752daddd NFSD: Replace READ* macros that decode the fattr4 security label attribute
    064e439befc9 NFSD: Replace READ* macros that decode the fattr4 time_set attributes
    df42ebb61bbe NFSD: Replace READ* macros that decode the fattr4 owner_group attribute
    dec78fb66dd6 NFSD: Replace READ* macros that decode the fattr4 owner attribute
    8801b0c28421 NFSD: Replace READ* macros that decode the fattr4 mode attribute
    3d3690b6620e NFSD: Replace READ* macros that decode the fattr4 acl attribute
    ee02662724e3 NFSD: Replace READ* macros that decode the fattr4 size attribute
    2a8ae039571c NFSD: Change the way the expected length of a fattr4 is checked
    f82c6ad7e2fb NFSD: Replace READ* macros in nfsd4_decode_commit()
    c701c0e5a956 NFSD: Replace READ* macros in nfsd4_decode_close()
    9921353a52a7 NFSD: Replace READ* macros in nfsd4_decode_access()
    bbb0a710a2c7 NFSD: Replace the internals of the READ_BUF() macro
    2994c8888472 NFSD: Add tracepoints in nfsd4_decode/encode_compound()
    568f9ca73d6e NFSD: Add tracepoints in nfsd_dispatch()
    fbffaddb766b NFSD: Add common helpers to decode void args and encode void results
    79e4e0d489c8 SUNRPC: Prepare for xdr_stream-style decoding on the server-side
    2f46cc814106 SUNRPC: Add xdr_set_scratch_page() and xdr_reset_scratch_buffer()
    164937edca64 nfsd: Fix error return code in nfsd_file_cache_init()
    9393f1628f9a NFSD: Add SPDX header for fs/nfsd/trace.c
    a7b8e883cef7 NFSD: Remove extra "0x" in tracepoint format specifier
    9f8405182bdd NFSD: Clean up the show_nf_may macro
    e51368510170 nfsd/nfs3: remove unused macro nfsd3_fhandleres
    92f59545b914 NFSD: A semicolon is not needed after a switch statement.
    a2f25c3208d1 NFSD: Invoke svc_encode_result_payload() in "read" NFSD encoders
    9aa0a43a55ff SUNRPC: Rename svc_encode_read_payload()
    a2ed16062139 Linux 5.10.219
    487489c4c822 RDMA/hns: Fix CQ and QP cache affinity
    68a955937622 RDMA/hns: Use mutex instead of spinlock for ida allocation
    5fe764c781f0 f2fs: compress: fix compression chksum
    d7ae4792b5d0 scsi: ufs: ufs-qcom: Clear qunipro_g4_sel for HW major version > 5
    6285d50a2335 NFS: Fix READ_PLUS when server doesn't support OP_READ_PLUS
    3e41609e629a nfs: fix undefined behavior in nfs_block_bits()
    7360cef95aa1 s390/ap: Fix crash in AP internal function modify_bitmap()
    76dc776153a4 ext4: fix mb_cache_entry's e_refcnt leak in ext4_xattr_block_cache_find()
    08018302f239 sparc: move struct termio to asm/termios.h
    2295a7ef5c8c net: fix __dst_negative_advice() race
    51664ef6ac84 kdb: Use format-specifiers rather than memset() for padding in kdb_read()
    e3d11ff45fde kdb: Merge identical case statements in kdb_read()
    2b5e1534dfc7 kdb: Fix console handling when editing and tab-completing commands
    7c19e28f3a81 kdb: Use format-strings rather than '\0' injection in kdb_read()
    cfdc2fa4db57 kdb: Fix buffer overflow during tab-complete
    b487b48efd0c watchdog: rti_wdt: Set min_hw_heartbeat_ms to accommodate a safety margin
    161f5a1189b7 sparc64: Fix number of online CPUs
    6e7dd338c053 intel_th: pci: Add Meteor Lake-S CPU support
    124947855564 net/9p: fix uninit-value in p9_client_rpc()
    3cc7687f7ff3 net/ipv6: Fix route deleting failure when metric equals 0
    a718b6d2a329 crypto: qat - Fix ADF_DEV_RESET_SYNC memory leak
    6815376b7f5e crypto: ecrdsa - Fix module auto-load on add_key
    4d8226bc7e59 KVM: arm64: Allow AArch32 PSTATE.M to be restored as System mode
    32f92b0078eb fbdev: savage: Handle err return when savagefb_check_var failed
    68447c350fc1 mmc: sdhci-acpi: Disable write protect detection on Toshiba WT10-A
    63eda0f3eb4d mmc: sdhci-acpi: Fix Lenovo Yoga Tablet 2 Pro 1380 sdcard slot not working
    b3418751cca0 mmc: sdhci-acpi: Sort DMI quirks alphabetically
    24b7af86a80c mmc: core: Add mmc_gpiod_set_cd_config() function
    e6823bb7f4eb media: v4l2-core: hold videodev_lock until dev reg, finishes
    567d3a4959dd media: mxl5xx: Move xpt structures off stack
    1514e1fb2a52 media: mc: mark the media devnode as registered from the, start
    82e6eba1a548 arm64: dts: hi3798cv200: fix the size of GICR
    c539721e903f wifi: rtlwifi: rtl8192de: Fix endianness issue in RX path
    6d5bfcd2ccb5 wifi: rtlwifi: rtl8192de: Fix low speed with WPA3-SAE
    8dffc574c765 wifi: rtl8xxxu: Fix the TX power of RTL8192CU, RTL8723AU
    aa64464c8f4d md/raid5: fix deadlock that raid5d() wait for itself to clear MD_SB_CHANGE_PENDING
    1f26711c084c arm64: dts: qcom: qcs404: fix bluetooth device address
    5cd042835674 arm64: tegra: Correct Tegra132 I2C alias
    e2c6a9b342c6 ACPI: resource: Do IRQ override on TongFang GXxHRXx and GMxHGxx
    73485d6bd9d8 ata: pata_legacy: make legacy_exit() work again
    8112fa72b7f1 drm/amdgpu: add error handle to avoid out-of-bounds
    b479fd59a1f4 media: lgdt3306a: Add a check against null-pointer-def
    75c87e2ac614 f2fs: fix to do sanity check on i_xattr_nid in sanity_check_inode()
    cade34279c22 netfilter: nf_tables: Fix potential data-race in __nft_obj_type_get()
    9c1c2ea0996d netfilter: nf_tables: restrict tunnel object to NFPROTO_NETDEV
    a447f2683038 x86/mm: Remove broken vsyscall emulation code from the page fault code
    3ee36f0048a3 vxlan: Fix regression when dropping packets due to invalid src addresses
    67fa90d4a2cc nilfs2: fix use-after-free of timer for log writer thread
    e31fe702ed08 afs: Don't cross .backup mountpoint from backup volume
    b6920325aca0 io_uring: fail NOP if non-zero op flags is passed in
    54e8f88d2baa mmc: core: Do not force a retune before RPMB switch
    75805481c35d binder: fix max_thread type inconsistency
    4cefcd0af745 SUNRPC: Fix loop termination condition in gss_free_in_token_pages()
    0cf6693d3f8e media: cec: core: add adap_nb_transmit_canceled() callback
    6752dfcfff3a genirq/cpuhotplug, x86/vector: Prevent vector leak during CPU offline
    bdd0aa055b8e ALSA: timer: Set lower bound of start tick time
    1f4b84893551 hwmon: (shtc1) Fix property misspelling
    1abbf079da59 ipvlan: Dont Use skb->sk in ipvlan_process_v{4,6}_outbound
    3c5caaef46d6 spi: stm32: Don't warn about spurious interrupts
    19e5a3d771fa kconfig: fix comparison to constant symbols, 'm', 'n'
    07eeedafc59c netfilter: tproxy: bail out if IP has been disabled on the device
    ddd2912a94eb net:fec: Add fec_enet_deinit()
    29467edc2381 bpf: Allow delete from sockmap/sockhash only if update is allowed
    117cacd72ca8 net: usb: smsc95xx: fix changing LED_SEL bit value updated from EEPROM
    3c0d36972edb enic: Validate length of nl attributes in enic_set_vf_port
    540d73a5c052 bpf: Fix potential integer overflow in resolve_btfids
    ae6fc4e6a332 dma-buf/sw-sync: don't enable IRQ from sync_print_obj()
    72c6038d23cb net/mlx5e: Use rx_missed_errors instead of rx_dropped for reporting buffer exhaustion
    82fdfbf24243 nvmet: fix ns enable/disable possible hang
    5f72ba46f1d8 spi: Don't mark message DMA mapped when no transfer in it is
    7ca9cf24b04a netfilter: nft_payload: restore vlan q-in-q match support
    e01065b339e3 netfilter: nfnetlink_queue: acquire rcu_read_lock() in instance_destroy_rcu()
    0f26983c2423 nfc: nci: Fix handling of zero-length payload packets in nci_rx_work()
    728fb8b3b55f nfc: nci: Fix kcov check in nci_rx_work()
    d72e126e9a36 tls: fix missing memory barrier in tls_init
    cb95173e6c0b net: fec: avoid lock evasion when reading pps_enable
    7fbe54f02a5c virtio: delete vq in vp_find_vqs_msix() when request_irq() fails
    461a760d578b arm64: asm-bug: Add .align 2 to the end of __BUG_ENTRY
    8cae65ace421 openvswitch: Set the skbuff pkt_type for proper pmtud support.
    e9b2f60636d1 tcp: Fix shift-out-of-bounds in dctcp_update_alpha().
    42bd4e491cf1 params: lift param_set_uint_minmax to common code
    daf341e0a231 ipv6: sr: fix memleak in seg6_hmac_init_algo
    1c65ebce7d37 rpcrdma: fix handling for RDMA_CM_EVENT_DEVICE_REMOVAL
    f2b326b77450 sunrpc: fix NFSACL RPC retry on soft mount
    6f39d5aae676 ASoC: tas2552: Add TX path for capturing AUDIO-OUT data
    f80b786ab055 nfc: nci: Fix uninit-value in nci_rx_work
    ee6a49784478 x86/kconfig: Select ARCH_WANT_FRAME_POINTERS again when UNWINDER_FRAME_POINTER=y
    8fb8be0e3b6d regulator: bd71828: Don't overwrite runtime voltages
    a2b0c3a6d460 null_blk: Fix the WARNING: modpost: missing MODULE_DESCRIPTION()
    3166b2dffaee media: cec: core: avoid confusing "transmit timed out" message
    5103090f4e55 media: cec: core: avoid recursive cec_claim_log_addrs
    3e938b7d40fb media: cec-adap.c: drop activate_cnt, use state info instead
    73ef9ae980ed media: cec: use call_op and check for !unregistered
    8fa7e4896fdd media: cec: correctly pass on reply results
    b64cb24a9e97 media: cec: abort if the current transmit was canceled
    2c67f3634f82 media: cec: call enable_adap on s_log_addrs
    0ab74ae99f86 media: cec: fix a deadlock situation
    ca55f013be13 media: core headers: fix kernel-doc warnings
    9f6da5da3d7c media: cec: cec-api: add locking in cec_release()
    a0ca5ff24293 media: cec: cec-adap: always cancel work in cec_transmit_msg_fh
    6be4923ade2b um: Fix the -Wmissing-prototypes warning for __switch_mm
    12ea1ec13725 powerpc/pseries: Add failure related checks for h_get_mpp and h_get_ppp
    a2d61b328e39 media: flexcop-usb: fix sanity check of bNumEndpoints
    c11caf1339b8 media: flexcop-usb: clean up endpoint sanity checks
    ca17da90001a scsi: qla2xxx: Replace all non-returning strlcpy() with strscpy()
    a16775828aae media: stk1160: fix bounds checking in stk1160_copy_video()
    f4b3d2585b33 drm/bridge: tc358775: fix support for jeida-18 and jeida-24
    4d5ef7facea1 um: vector: fix bpfflash parameter evaluation
    351d1a645449 um: Add winch to winch_handlers before registering winch IRQ
    1ef5d235be29 um: Fix return value in ubd_init()
    96b9ed94dcb3 drm/msm/dpu: Always flush the slave INTF on the CTL
    a3bb8070b71b Input: pm8xxx-vibrator - correct VIB_MAX_LEVELS calculation
    580e47c28242 mmc: sdhci_am654: Fix ITAPDLY for HS400 timing
    2621bf50f580 mmc: sdhci_am654: Add ITAPDLYSEL in sdhci_j721e_4bit_set_clock
    b55d988df1d6 mmc: sdhci_am654: Add OTAP/ITAP delay enable
    76f2b3ccbd63 mmc: sdhci_am654: Drop lookup for deprecated ti,otap-del-sel
    8dcfbb27e425 mmc: sdhci_am654: Write ITAPDLY for DDR52 timing
    e7a444a35eba mmc: sdhci_am654: Add tuning algorithm for delay chain
    52f8d76769e7 Input: ioc3kbd - add device table
    0096d223f78c Input: ioc3kbd - convert to platform remove callback returning void
    abeaeaee7fa9 Input: ims-pcu - fix printf string overflow
    adc7dc29b796 s390/ipl: Fix incorrect initialization of nvme dump block
    66a02effb898 s390/ipl: Fix incorrect initialization of len fields in nvme reipl block
    ec43f32f66d9 libsubcmd: Fix parse-options memory leak
    158adcb7fd7e serial: sh-sci: protect invalidating RXDMA on shutdown
    b8962cf98595 f2fs: compress: don't allow unaligned truncation on released compress inode
    c1958b978d50 f2fs: fix to release node block count in error path of f2fs_new_node_page()
    a6e1f7744e9b f2fs: compress: fix to cover {reserve,release}_compress_blocks() w/ cp_rwsem lock
    4b6e5edefd46 PCI/EDR: Align EDR_PORT_LOCATE_DSM with PCI Firmware r3.3
    d2e2e90c7637 PCI/EDR: Align EDR_PORT_DPC_ENABLE_DSM with PCI Firmware r3.3
    9ca02da316be extcon: max8997: select IRQ_DOMAIN instead of depending on it
    d32caf51379a ppdev: Add an error check in register_device
    9349e1f2c95f ppdev: Remove usage of the deprecated ida_simple_xx() API
    713fc00c571d stm class: Fix a double free in stm_register_device()
    7716b201d2e2 usb: gadget: u_audio: Clear uac pointer when freed.
    23209f947d41 microblaze: Remove early printk call from cpuinfo-static.c
    34ff72bb5d65 microblaze: Remove gcc flag for non existing early_printk.c file
    26e6e25d742e fpga: region: add owner module and take its refcount
    af02dec83a48 fpga: region: Use standard dev_release for class driver
    b089bb733c47 docs: driver-api: fpga: avoid using UTF-8 chars
    9fdd3d1cd01a fpga: region: Rename dev to parent for parent device
    840c9c7d6aec fpga: region: change FPGA indirect article to an
    be76107dc4c1 iio: pressure: dps310: support negative temperature values
    cdbe0477a0b5 f2fs: fix to check pinfile flag in f2fs_move_file_range()
    2b16554fb26d f2fs: fix to relocate check condition in f2fs_fallocate()
    f1169d2b2aa2 f2fs: fix typos in comments
    bdca4b678621 f2fs: do not allow partial truncation on pinned file
    d992b7802612 f2fs: fix to force keeping write barrier for strict fsync mode
    eebbc4eb7e66 f2fs: add cp_error check in f2fs_write_compressed_pages
    431ecafbffab f2fs: compress: fix to relocate check condition in f2fs_{release,reserve}_compress_blocks()
    8e1651cd667c f2fs: introduce FI_COMPRESS_RELEASED instead of using IMMUTABLE bit
    486009bc2fca f2fs: compress: remove unneeded preallocation
    df4978d96890 f2fs: compress: clean up parameter of __f2fs_cluster_blocks()
    5b09d2e79066 f2fs: add compress_mode mount option
    70fb69e05a25 f2fs: compress: support chksum
    1ada96569290 serial: sc16is7xx: add proper sched.h include for sched_set_fifo()
    276bc8a7dcc1 greybus: arche-ctrl: move device table to its right location
    d1f67d1d8c08 serial: max3100: Fix bitwise types
    e8e2a4339dec serial: max3100: Update uart_driver_registered on driver removal
    cc121e3722a0 serial: max3100: Lock port->lock when calling uart_handle_cts_change()
    bc40d0e356bb firmware: dmi-id: add a release callback function
    83e078085f14 dmaengine: idma64: Add check for dma_set_max_seg_size
    fd4bcb991eba soundwire: cadence: fix invalid PDI offset
    7b98f1493a5b f2fs: fix to wait on page writeback in __clone_blkaddrs()
    eac10cf3a97f greybus: lights: check return of get_channel_from_mode
    ae20865fe637 sched/fair: Allow disabling sched_balance_newidle with sched_relax_domain_level
    e892f9932dd6 af_packet: do not call packet_read_pending() from tpacket_destruct_skb()
    b117e5b4f27c netrom: fix possible dead-lock in nr_rt_ioctl()
    cafccde4298f net: qrtr: ns: Fix module refcnt
    66fd37d0a86f net: qrtr: fix null-ptr-deref in qrtr_ns_remove
    3e83903cd474 RDMA/IPoIB: Fix format truncation compilation errors
    68e8c44c0d7a selftests/kcmp: remove unused open mode
    08df7b006c8f selftests/kcmp: Make the test output consistent and clear
    f148a95f68c6 SUNRPC: Fix gss_free_in_token_pages()
    e28a16af4c3e ext4: fix potential unnitialized variable
    4deaa4d5f800 ext4: remove unused parameter from ext4_mb_new_blocks_simple()
    fdbce4544905 ext4: try all groups in ext4_mb_new_blocks_simple
    e498c2f441d9 ext4: fix unit mismatch in ext4_mb_new_blocks_simple
    f49c865d5b93 ext4: simplify calculation of blkoff in ext4_mb_new_blocks_simple
    2a2bba3cbd6a sunrpc: removed redundant procp check
    7c9ab0a44952 ext4: avoid excessive credit estimate in ext4_tmpfile()
    4d693ca24a36 x86/insn: Fix PUSH instruction in x86 instruction decoder opcode map
    9ff328de0284 clk: qcom: mmcc-msm8998: fix venus clock issue
    45b31be4dd22 RDMA/hns: Modify the print level of CQE error
    9cce44567f1d RDMA/hns: Use complete parentheses in macros
    9efed7448b17 RDMA/hns: Fix return value in hns_roce_map_mr_sg
    4c91ad5ed563 RDMA/hns: Fix incorrect symbol types
    e612e695d3a5 RDMA/hns: Create QP with selected QPN for bank load balance
    3c3744c309e9 RDMA/hns: Refactor the hns_roce_buf allocation flow
    eb9635b4a94f drm/mipi-dsi: use correct return type for the DSC functions
    5d344b30893f drm/panel: simple: Add missing Innolux G121X1-L03 format, flags, connector
    f10aa595ee46 drm/bridge: tc358775: Don't log an error when DSI host can't be found
    ee751403fb82 drm/bridge: lt9611: Don't log an error when DSI host can't be found
    3ce31a0e3705 ASoC: tracing: Export SND_SOC_DAPM_DIR_OUT to its value
    2d9adecc88ab drm: vc4: Fix possible null pointer dereference
    a5fa5b40a278 drm/arm/malidp: fix a possible null pointer dereference
    4b68b861b514 media: atomisp: ssh_css: Fix a null-pointer dereference in load_video_binaries
    08ce354f3da4 fbdev: sh7760fb: allow modular build
    85d1a27402f8 drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference
    552280a9921f media: radio-shark2: Avoid led_names truncations
    409f20085d34 media: ngene: Add dvb_ca_en50221_init return value check
    bb3c425921f6 fbdev: sisfb: hide unused variables
    94349e015c11 powerpc/fsl-soc: hide unused const variable
    d17b75ee9c2e drm/mediatek: Add 0 size check to mtk_drm_gem_obj
    7441f9e0560a drm/meson: vclk: fix calculation of 59.94 fractional rates
    078e02dcb4c6 fbdev: shmobile: fix snprintf truncation
    d3727d6e2b98 mtd: rawnand: hynix: fixed typo
    613a349cbf8b ASoC: Intel: Disable route checks for Skylake boards
    ece8098579e1 ASoC: soc-acpi: add helper to identify parent driver.
    04bc4d1090c3 drm/amd/display: Fix potential index out of bounds in color transformation function
    f6fbb8535e99 net/mlx5: Discard command completions in internal error
    00e6335329f2 ipv6: sr: fix invalid unregister error path
    d33327a7c0b0 ipv6: sr: fix incorrect unregister order
    1ba1b4cc3afb ipv6: sr: add missing seg6_local_exit
    5ab6aecbede0 net: openvswitch: fix overwriting ct original tuple for ICMPv6
    c3dc80f63326 net: usb: smsc95xx: stop lying about skb->truesize
    4d51845d734a af_unix: Fix data races in unix_release_sock/unix_stream_sendmsg
    161e43067b86 net: ethernet: cortina: Locking fixes
    e22b23f5888a eth: sungem: remove .ndo_poll_controller to avoid deadlocks
    ad31e0e765e9 net: ipv6: fix wrong start position when receive hop-by-hop fragment
    3eccf76b572f m68k: mac: Fix reboot hang on Mac IIci
    4eeffecc8e3c m68k: Fix spinlock race in kernel thread creation
    d50b11c21ff0 net: usb: sr9700: stop lying about skb->truesize
    2093cc6e8758 usb: aqc111: stop lying about skb->truesize
    4cff6817ee44 wifi: mwl8k: initialize cmd->addr[] properly
    769b9fd2af02 scsi: qedf: Ensure the copied buf is NUL terminated
    00b425ff0891 scsi: bfa: Ensure the copied buf is NUL terminated
    2321281f19b3 HID: intel-ish-hid: ipc: Add check for pci_alloc_irq_vectors
    2bd97a0868b0 selftests/binderfs: use the Makefile's rules, not Make's implicit rules
    019ae041a568 Revert "sh: Handle calling csum_partial with misaligned data"
    3557a7fc5cbd sh: kprobes: Merge arch_copy_kprobe() into arch_prepare_kprobe()
    ee25389df801 wifi: ar5523: enable proper endpoint verification
    8650725bb0a4 wifi: carl9170: add a proper sanity check for endpoints
    280619bbdeac macintosh/via-macii: Fix "BUG: sleeping function called from invalid context"
    9d132029224f net: give more chances to rcu in netdev_wait_allrefs_any()
    bc7cae63fa39 tcp: avoid premature drops in tcp_add_backlog()
    88aa40df8ee4 wifi: ath10k: populate board data for WCN3990
    5c4756e0fb0c wifi: ath10k: Fix an error code problem in ath10k_dbg_sta_write_peer_debug_trigger()
    1b27468dbe58 x86/purgatory: Switch to the position-independent small code model
    176fb7770d36 scsi: hpsa: Fix allocation size for Scsi_Host private data
    0dc60ee1ed22 scsi: libsas: Fix the failure of adding phy with zero-address to port
    69fab9d2e24a udp: Avoid call to compute_score on multiple sites
    452f8dc251f8 net: remove duplicate reuseport_lookup functions
    0ce990e6efe8 net: export inet_lookup_reuseport and inet6_lookup_reuseport
    dfc56ff5ec99 cpufreq: exit() callback is optional
    92aca16797e6 cpufreq: Rearrange locking in cpufreq_remove_dev()
    19b06dec363b cpufreq: Split cpufreq_offline()
    3a28fbf533d8 cpufreq: Reorganize checks in cpufreq_offline()
    7a4d18a27d85 selftests/bpf: Fix umount cgroup2 error in test_sockmap
    dd52e3bc4fe8 gfs2: Fix "ignore unlock failures after withdraw"
    11f9bd11020e ACPI: disable -Wstringop-truncation
    a8f0a14c3b88 irqchip/loongson-pch-msi: Fix off-by-one on allocation error path
    f31b49ba3662 irqchip/alpine-msi: Fix off-by-one in allocation error path
    bb291d4d0868 scsi: ufs: core: Perform read back after disabling UIC_COMMAND_COMPL
    3bbfbd5a36d8 scsi: ufs: core: Perform read back after disabling interrupts
    bbc00d1b7a71 scsi: ufs: cdns-pltfrm: Perform read back after writing HCLKDIV
    dca975427630 scsi: ufs: qcom: Perform read back after writing CGC enable
    c8f2eefc496e scsi: ufs: qcom: Perform read back after writing unipro mode
    506f63e97d3e scsi: ufs: ufs-qcom: Clear qunipro_g4_sel for HW version major 5
    ee4bf03d261f scsi: ufs: ufs-qcom: Fix the Qcom register name for offset 0xD0
    d113c66bb4ae scsi: ufs: qcom: Perform read back after writing REG_UFS_SYS1CLK_1US
    82783759e88b scsi: ufs-qcom: Fix ufs RST_n spec violation
    d193f4a153ac scsi: ufs: qcom: Perform read back after writing reset bit
    742f58067071 qed: avoid truncating work queue length
    01ea6818fac1 x86/boot: Ignore relocations in .notes sections in walk_relocs() too
    5fb37c456d38 wifi: ath10k: poll service ready message before failing
    3f5b73ef8fd6 md: fix resync softlockup when bitmap size is less than array size
    c62f315238df null_blk: Fix missing mutex_destroy() at module removal
    b2f8354f732a soc: mediatek: cmdq: Fix typo of CMDQ_JUMP_RELATIVE
    f0eea095ce8c jffs2: prevent xattr node from overflowing the eraseblock
    de1207e5fd26 s390/cio: fix tracepoint subchannel type field
    9f6dbd0aa107 crypto: x86/sha256-avx2 - add missing vzeroupper
    0ceb0a40c5ec crypto: x86/nh-avx2 - add missing vzeroupper
    6cd2cbd553ea crypto: ccp - drop platform ifdef checks
    f24cac645937 parisc: add missing export of __cmpxchg_u8()
    dae53e39cdd6 nilfs2: fix out-of-range warning
    edbfc42ab080 ecryptfs: Fix buffer size for tag 66 packet
    e05ee61361e4 firmware: raspberrypi: Use correct device for DMA mappings
    ebed0d666fa7 crypto: bcm - Fix pointer arithmetic
    a81f072e50ee openpromfs: finish conversion to the new mount API
    904a590dab64 nvme: find numa distance only if controller has valid numa id
    5b4d14a0bce6 drm/amdkfd: Flush the process wq before creating a kfd_process
    eb464a8d826e ASoC: da7219-aad: fix usage of device_get_named_child_node()
    43ff957b96f8 ASoC: rt715: add vendor clear control register
    0c71bfad1483 regulator: vqmmc-ipq4019: fix module autoloading
    fcc54151a9ff ASoC: dt-bindings: rt5645: add cbj sleeve gpio property
    6cd625926e26 ASoC: rt5645: Fix the electric noise due to the CBJ contacts floating
    c9c742eaa5fb drm/amd/display: Set color_mgmt_changed to true on unsuspend
    c393ce8157a6 net: usb: qmi_wwan: add Telit FN920C04 compositions
    c7d22022ece9 wifi: cfg80211: fix the order of arguments for trace events of the tx_rx_evt class
    d7ff29a429b5 ALSA: core: Fix NULL module pointer assignment at card init
    eff7cdf890b0 nilfs2: fix potential hang in nilfs_detach_log_writer()
    89e07418a686 nilfs2: fix unexpected freezing of nilfs_segctor_sync()
    0d0ecd841f3f net: smc91x: Fix m68k kernel compilation for ColdFire CPU
    1e160196042c ring-buffer: Fix a race between readers and resize checks
    07ef95cc7a57 speakup: Fix sizeof() vs ARRAY_SIZE() bug
    0fb736c9931e tty: n_gsm: fix possible out-of-bounds in gsm0_receive()
    03a793945396 x86/tsc: Trust initial offset in architectural TSC-adjust MSRs
    61458c864cac Linux 5.10.218
    04a5842ed71f docs: kernel_include.py: Cope with docutils 0.21
    b5fb355c9f5e serial: kgdboc: Fix NMI-safety problems from keyboard reset code
    7ed7748c94cb usb: typec: ucsi: displayport: Fix potential deadlock
    0eb296233f86 drm/amdgpu: Fix possible NULL dereference in amdgpu_ras_query_error_status_helper()
    c48ab6a4cd82 btrfs: add missing mutex_unlock in btrfs_relocate_sys_chunks()
    99951b62bf20 mptcp: ensure snd_nxt is properly initialized on connect
    f2277d9e2a0d firmware: arm_scmi: Harden accesses to the reset domains
    546751d9d43e KVM: x86: Clear "has_error_code", not "error_code", for RM exception injection
    05c9e3fc93b0 netlink: annotate lockless accesses to nlk->max_recvmsg_len
    eb15243bc98b ima: fix deadlock when traversing "ima_default_rules".
    db7aa45c7191 net: bcmgenet: synchronize UMAC_CMD access
    b8d75bb01c56 net: bcmgenet: synchronize EXT_RGMII_OOB_CTRL access
    719225b0f932 Revert "selftests: mm: fix map_hugetlb failure on 64K page size systems"
    1424ab4bb386 x86/xen: Drop USERGS_SYSRET64 paravirt call
    8869c2916dc1 pinctrl: core: handle radix_tree_insert() errors in pinctrl_register_one_pin()
    ce3838dbefdc Linux 5.10.217
    fb5b347efd1b md: fix kmemleak of rdev->serial
    ad2011ea7879 keys: Fix overwrite of key expiration on instantiation
    324be157e029 regulator: core: fix debugfs creation regression
    7788fc8a8b8e hwmon: (pmbus/ucd9000) Increase delay from 250 to 500us
    0c3248bc708a net: fix out-of-bounds access in ops_init
    3cd682357c61 drm/vmwgfx: Fix invalid reads in fence signaled events
    49e09118872e mei: me: add lunar lake point M DID
    41d8ac238ab1 dyndbg: fix old BUG_ON in >control parser
    7fbcbb96aee2 ASoC: tegra: Fix DSPK 16-bit playback
    f6c807e8538c net: bcmgenet: synchronize use of bcmgenet_set_rx_mode()
    367766ff9e40 tipc: fix UAF in error path
    e2648b3d17b4 iio: accel: mxc4005: Interrupt handling fixes
    0ba169bb803b iio:imu: adis16475: Fix sync mode setting
    e6ba44f832c9 ALSA: hda/realtek: Fix mute led of HP Laptop 15-da3001TU
    72410925c804 usb: dwc3: core: Prevent phy suspend during init
    15165b5258cd usb: xhci-plat: Don't include xhci.h
    ffb06cb3248b usb: gadget: f_fs: Fix a race condition when processing setup packets.
    31cfe4e156dd usb: gadget: composite: fix OS descriptors w_value logic
    3afc842e6682 usb: ohci: Prevent missed ohci interrupts
    399ca46db738 usb: Fix regression caused by invalid ep0 maxpacket in virtual SuperSpeed device
    3a970e41c34e usb: typec: ucsi: Fix connector check on init
    3b0b6b327657 usb: typec: ucsi: Check for notifications after init
    09b3536d986f arm64: dts: qcom: Fix 'interrupt-map' parent address cells
    cca330c59c54 firewire: nosy: ensure user_length is taken into account when fetching packet contents
    a2fb0eefa4fe btrfs: fix kvcalloc() arguments order in btrfs_ioctl_send()
    3284447d66ec net: hns3: use appropriate barrier function after setting a bit value
    674c951ab8a2 ipv6: fib6_rules: avoid possible NULL dereference in fib6_rule_action()
    9a2a5cd84fca net: bridge: fix corrupted ethernet header on multicast-to-unicast
    e7eb0737c6d8 kcov: Remove kcov include from sched.h and move it to its users.
    f085e02f0a32 phonet: fix rtm_phonet_notify() skb allocation
    b33ae32b6d84 hwmon: (corsair-cpro) Protect ccp->wait_input_report with a spinlock
    5b37ce7bb223 hwmon: (corsair-cpro) Use complete_all() instead of complete() in ccp_raw_event()
    549e740badb9 hwmon: (corsair-cpro) Use a separate buffer for sending commands
    6c8f44b02500 rtnetlink: Correct nested IFLA_VF_VLAN_LIST attribute validation
    06acb75e7ed6 Bluetooth: l2cap: fix null-ptr-deref in l2cap_chan_timeout
    33a6e92161a7 Bluetooth: Fix use-after-free bugs caused by sco_sock_timeout
    1d9cf07810c3 tcp: Use refcount_inc_not_zero() in tcp_twsk_unique().
    413c33b9f3bc tcp: defer shutdown(SEND_SHUTDOWN) for TCP_SYN_RECV sockets
    a4b760673229 xfrm: Preserve vlan tags for transport mode software GRO
    17f8b8d432e6 net:usb:qmi_wwan: support Rolling modules
    e09096291f87 drm/nouveau/dp: Don't probe eDP ports twice harder
    09be6fa6af94 fs/9p: drop inodes immediately on non-.L too
    c43463fa3ff7 clk: Don't hold prepare_lock when calling kref_put()
    c8e9cc2fa9df gpio: crystalcove: Use -ENOTSUPP consistently
    09c733cde549 gpio: wcove: Use -ENOTSUPP consistently
    dca2b31cf4b6 9p: explicitly deny setlease attempts
    c38c45304b78 fs/9p: translate O_TRUNC into OTRUNC
    5a605930e19f fs/9p: only translate RWX permissions for plain 9P2000
    a79b53d0d9bb selftests: timers: Fix valid-adjtimex signed left-shift undefined behavior
    7c355faad06f MIPS: scall: Save thread_info.syscall unconditionally on entry
    09888cff3242 gpu: host1x: Do not setup DMA for virtual devices
    62accf6c1d7b blk-iocost: avoid out of bounds shift
    7ba3962c9ea1 scsi: target: Fix SELinux error when systemd-modules loads the target module
    b34fdb24ab7d btrfs: always clear PERTRANS metadata during commit
    e2a3a1df2f67 btrfs: make btrfs_clear_delalloc_extent() free delalloc reserve
    2214d3a5d966 tools/power turbostat: Fix Bzy_MHz documentation typo
    413dbd60ea59 tools/power turbostat: Fix added raw MSR output
    fa273f312334 firewire: ohci: mask bus reset interrupts between ISR and bottom half
    e8b125df343f ata: sata_gemini: Check clk_enable() result
    1fb7ab9a6e3e net: bcmgenet: Reset RBUF on first open
    602dd9d99a10 ALSA: line6: Zero-initialize message buffers
    e2f5d61b5a1a btrfs: return accurate error code on open failure in open_fs_devices()
    ad498539dda0 scsi: bnx2fc: Remove spin_lock_bh while releasing resources after upload
    d21475d29de2 net: mark racy access on sk->sk_rcvbuf
    a762b8e0414d wifi: cfg80211: fix rdev_dump_mpp() arguments order
    a21712550a5e wifi: mac80211: fix ieee80211_bss_*_flags kernel-doc
    a7fb16ff6255 gfs2: Fix invalid metadata access in punch_hole
    e7e50ac5f4c4 scsi: lpfc: Update lpfc_ramp_down_queue_handler() logic
    4404465a1bee KVM: arm64: vgic-v2: Check for non-NULL vCPU in vgic_v2_parse_attr()
    4563a0afd99e KVM: arm64: vgic-v2: Use cpuid from userspace as vcpu_id
    bfc78b462849 clk: sunxi-ng: h6: Reparent CPUX during PLL CPUX rate change
    7df798dd59c3 net: gro: add flush check in udp_gro_receive_segment
    adbce6d20da6 tipc: fix a possible memleak in tipc_buf_append
    faa83a7797f0 net: core: reject skb_copy(_expand) for fraglist GSO skbs
    48ab384d2bc6 net: bridge: fix multicast-to-unicast with fraglist GSO
    a0e3faf29ee0 net: dsa: mv88e6xxx: Fix number of databases for 88E6141 / 88E6341
    ea6213141ec4 cxgb4: Properly lock TX queue for the selftest.
    aa50658c7048 ASoC: meson: cards: select SND_DYNAMIC_MINORS
    f25b4c829e1d ASoC: Fix 7/8 spaces indentation in Kconfig
    bf9e84ae15cd net: qede: use return from qede_parse_actions()
    99c9baffcf22 net: qede: use return from qede_parse_flow_attr() for flow_spec
    fff2c7a02bb1 net: qede: use return from qede_parse_flow_attr() for flower
    4a0c24cc145d net: qede: sanitize 'rc' in qede_add_tc_flower_fltr()
    96a592f1601b s390/vdso: Add CFI for RA register to asm macro vdso_func
    553b2f6c3456 net l2tp: drop flow hash on forward
    bbccf0caef2f nsh: Restore skb->{protocol,data,mac_header} for outer header in nsh_gso_segment().
    bcdac70adceb octeontx2-af: avoid off-by-one read from userspace
    6f0f19b79c08 bna: ensure the copied buf is NUL terminated
    78ad3b01caa2 s390/mm: Fix clearing storage keys for huge pages
    e93c82fa966a s390/mm: Fix storage key clearing for guest huge pages
    3994f81ab6e1 regulator: mt6360: De-capitalize devicetree regulator subnodes
    35ab679e8bb5 pinctrl: devicetree: fix refcount leak in pinctrl_dt_to_map()
    5ea5d0619779 power: rt9455: hide unused rt9455_boost_voltage_values
    d4891d817350 nfs: Handle error of rpc_proc_register() in nfs_net_init().
    afdbc21a92a0 nfs: make the rpc_stat per net namespace
    6eef21eb7a16 nfs: expose /proc/net/sunrpc/nfs in net namespaces
    95ebd5fc15b7 sunrpc: add a struct rpc_stats arg to rpc_create_args
    a3f1a38733d9 pinctrl: mediatek: paris: Rework support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE
    e0e916a21e70 pinctrl: mediatek: paris: Fix PIN_CONFIG_INPUT_SCHMITT_ENABLE readback
    d676152a7b41 pinctrl: mediatek: paris: Rework mtk_pinconf_{get,set} switch/case logic
    288bc4aa75f1 pinctrl: core: delete incorrect free in pinctrl_enable()
    734d2dad607e pinctrl/meson: fix typo in PDM's pin name
    20c91ac14bdc pinctrl: pinctrl-aspeed-g6: Fix register offset for pinconf of GPIOR-T
    c850f71fca09 eeprom: at24: fix memory corruption race condition
    ec9dbddea26b eeprom: at24: Probe for DDR3 thermal sensor in the SPD case
    b2643d2532ee eeprom: at24: Use dev_err_probe for nvmem register failure
    5a730a161ac2 wifi: nl80211: don't free NULL coalescing rule
    00d09857f807 dmaengine: Revert "dmaengine: pl330: issue_pending waits until WFP state"
    db6740b4e134 dmaengine: pl330: issue_pending waits until WFP state
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index bc4e49ca08..96208b6731 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "421ad32504cf202dafd09394bae1ad6521539a49"
-SRCREV_meta ?= "19c510890b99cfc450db69a97cf585593deb1d95"
+SRCREV_machine ?= "131cb7adf814a294e91b1f130596274dcf946acc"
+SRCREV_meta ?= "a0827028a62288d735501a325eb8dfb9c9f0d701"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.216"
+LINUX_VERSION ?= "5.10.223"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index d2e540847a..5a86306584 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.216"
+LINUX_VERSION ?= "5.10.223"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "cf393a05f2ba24f3bc5f3727a5fe9dc63ec247bd"
-SRCREV_machine ?= "9f2e7d21741259c175f6186577bd82f82cb1f96a"
-SRCREV_meta ?= "19c510890b99cfc450db69a97cf585593deb1d95"
+SRCREV_machine:qemuarm ?= "b1e71e9f64f711f24a5b4d1c9b95268d85f55223"
+SRCREV_machine ?= "1058d8075ff9a651366d135278effaaf707ee8ba"
+SRCREV_meta ?= "a0827028a62288d735501a325eb8dfb9c9f0d701"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index cb03649545..0a643ebf8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ebf8b0d0c68aeca12d7f7a2fa35c2991e23f5ae4"
-SRCREV_machine:qemuarm64 ?= "9837e97ae4ced4fdb9250acd275ad1decfde6e5e"
-SRCREV_machine:qemumips ?= "18f0ddf9859784df80af64e4d6f9a41c49b8b1f4"
-SRCREV_machine:qemuppc ?= "c0adf44845851025b1a18c50927af16a7d049ab8"
-SRCREV_machine:qemuriscv64 ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
-SRCREV_machine:qemuriscv32 ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
-SRCREV_machine:qemux86 ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
-SRCREV_machine:qemux86-64 ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
-SRCREV_machine:qemumips64 ?= "5341a9dbcda59f3c95aed519a6b86e96cd6fdf65"
-SRCREV_machine ?= "4af417c06d37be4517a786aef96716f13b4b7f3b"
-SRCREV_meta ?= "19c510890b99cfc450db69a97cf585593deb1d95"
+SRCREV_machine:qemuarm ?= "1b786a40d06acef91fe972e1e0ea0fba35c952f1"
+SRCREV_machine:qemuarm64 ?= "1a521d8f1fd43a00256c93eedbb1dcb411c3936b"
+SRCREV_machine:qemumips ?= "730441c1cf02c3ee9176ffb23fe686ef4162e1ff"
+SRCREV_machine:qemuppc ?= "051b2b500b8f91b670d3d65ad0decf4e077c2727"
+SRCREV_machine:qemuriscv64 ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
+SRCREV_machine:qemuriscv32 ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
+SRCREV_machine:qemux86 ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
+SRCREV_machine:qemux86-64 ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
+SRCREV_machine:qemumips64 ?= "3b07617401af5767816a9d60cd2b40dcb9244a2b"
+SRCREV_machine ?= "0e60e683b3a30c66c24a779c8f928d60b1fbb940"
+SRCREV_meta ?= "a0827028a62288d735501a325eb8dfb9c9f0d701"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.216"
+LINUX_VERSION ?= "5.10.223"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


