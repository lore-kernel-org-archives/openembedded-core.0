Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9629CC3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 18:28:30 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.2767.1748456905506828459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 11:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ab8Z//HB;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47677b77725so777841cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 11:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748456904; x=1749061704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PthADD+ODmb6xwwV3f2bkXKd24oDPlCEieS55V9oEU8=;
        b=Ab8Z//HBaUee08br/aToYx/1HTS2m/4Urbvaxj14yGpNqozFwTQwcxB2Nf4GE/XGyY
         sLOwBK5FmcdZ8ZuaS58B8b5/3nKM6XgYKoUvfbdWoj1bX19r59BKHkbXj0vcRpb976wP
         gz7sWGaZmwnj+VDpOpBQcS2yAvlRXjJ3tW263VitNox4V/+UYYLN+YRTsLR2Nk2GTrK4
         pMPtiguqx6EfQJIhqAh3dxO+C/7v3BiR+yDBjZEq54jORHHzm23E3ULRERV5evNNkyFo
         ruDgX2owm3wFb32HHB/fr3mZpXWUwfTaj5ROfiGE60M2fFLUBnPk3CrtF6gvTIRQ01TB
         QejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748456904; x=1749061704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PthADD+ODmb6xwwV3f2bkXKd24oDPlCEieS55V9oEU8=;
        b=plgb612ZK3804yW/dUELx3ejg2ZFpF5sNbJEGk5ZwldutaJm8omFYCscSsfi6b9nYY
         OTBq6pOHvV9dy5/h5qSoXFMsQM4RYgrOlz3zzn4cbU0UjoGPBG5wbc4FHekj78GwPAu+
         ZJmVij9eFl8pr6nbr3gYCpCda9dxU6W7ZwFWS7idgcWpZ+CtPWRE8aTKZGWelBX1l6wB
         MrJkgijphii9dh90+E6C2v70XknPoAIkw+/p6I3vCRXKWvWRXHzYVJBi3xsv21NTySFq
         dfuKzFTQA8YD0S07B3evxG3vuLEsqmFRtSibWCbDgBGPLn/Lxlc+1FuwGK+AWB72hklO
         q6UA==
X-Gm-Message-State: AOJu0YxhRF0HmOEguC3Jj7KcjdlmtFXLxXytER3pPIN8RSas+kPrbs7j
	01+a7m6IvAIo7Eq12X9bN7l4i3d48q+U3+vKhh3TnzE0DjhHpLZglKKU85t3Ghlv
X-Gm-Gg: ASbGncvMu78HrUSYg4tiJgY6VEyfp4GOxgCE9cbAKHZRkyAuyrgkLm4xdk9Uqf+cFHP
	iqn9Fdp5LzOH8mnSbbNKozExzoLkXoumOfcN2iyLG+6Wog/0sCLdCSiqb3UyuHrMvCPa/F+59Iv
	hq2lSQYgLPB/x5vquwxfJ7xglj9/bcguZ4p0aSs1BwvrgjiLiLmNy1oD86MXkehpTjxoBQYIPY3
	D5vyd6or4zuzrKTywc6EbPWskSON8i0jehLDlU2a7Ahr8J9XFSnUt6psJRdiiifA5zF0IuYybPe
	rXRCNsAdDxXOOD1dgJWRA1B7sqVchn7/7PWWQXZWdnXCmwRSZ3YxbwBD9BkyNINIVsl/VQZ24n1
	ViaMSSfT2dK/12/otZSlKAZxEc53AondZpxkUFsH8Krk6Fx7YYgUq
X-Google-Smtp-Source: AGHT+IGhQUPuwlopoodWk1xZ1Zn+LxZEb/8vVAVItkDLkH9EfRE4/OJ0CkiQxK6xq+0BjIQXHqqHyA==
X-Received: by 2002:a05:622a:418f:b0:476:af62:8532 with SMTP id d75a77b69052e-49f47fd1af6mr262688371cf.45.1748456904324;
        Wed, 28 May 2025 11:28:24 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a3c80d4dd3sm8992151cf.54.2025.05.28.11.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 11:28:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/6.12: update to v6.12.29
Date: Wed, 28 May 2025 14:28:17 -0400
Message-Id: <dcf8f96c3c5d23496400fc9f4feda72a04e755f1.1748456757.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1748456757.git.bruce.ashfield@gmail.com>
References: <cover.1748456757.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 18:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217381

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    5be5dbf91ef3 Linux 6.12.29
    7e78061be78b x86/its: FineIBT-paranoid vs ITS
    bb85c3abbfd8 x86/its: Fix build errors when CONFIG_MODULES=n
    2a6194e12427 selftest/x86/bugs: Add selftests for ITS
    88a817e60dbb x86/its: Use dynamic thunks for indirect branches
    15335117c5d7 x86/ibt: Keep IBT disabled during alternative patching
    bd57853b863e x86/its: Align RETs in BHB clear sequence to avoid thunking
    9f132c0397df x86/its: Add support for RSB stuffing mitigation
    4dc1902fdee7 x86/its: Add "vmexit" option to skip mitigation on some CPUs
    68d59e9ba384 x86/its: Enable Indirect Target Selection mitigation
    51000047235f x86/its: Add support for ITS-safe return thunk
    16a7d5b7a46e x86/its: Add support for ITS-safe indirect thunk
    a6f2a436e9d6 x86/its: Enumerate Indirect Target Selection (ITS) bug
    76f847655bcb Documentation: x86/bugs/its: Add ITS documentation
    f23d4f4aebf0 x86/speculation: Remove the extra #ifdef around CALL_NOSPEC
    9ebe6f1bd213 x86/speculation: Add a conditional CS prefix to CALL_NOSPEC
    d2498bbb54f6 x86/speculation: Simplify and make CALL_NOSPEC consistent
    9d8295dcf243 x86/bhi: Do not set BHI_DIS_S in 32-bit mode
    b86349f32625 x86/bpf: Add IBHF call at end of classic BPF
    87a12b9b3810 x86/bpf: Call branch history clearing sequence on exit
    2176530849b1 arm64: proton-pack: Add new CPUs 'k' values for branch mitigation
    e5f5100f1c64 arm64: bpf: Only mitigate cBPF programs loaded by unprivileged users
    38c345fd54af arm64: bpf: Add BHB mitigation to the epilogue for cBPF programs
    f2aebb8ec64d arm64: proton-pack: Expose whether the branchy loop k value
    ec5bca57afc6 arm64: proton-pack: Expose whether the platform is mitigated by firmware
    2a3915e86187 arm64: insn: Add support for encoding DSB
    86b37810fa1e sched/eevdf: Fix se->slice being set to U64_MAX and resulting crash
    16bae58f7355 mm: page_alloc: speed up fallbacks in rmqueue_bulk()
    564d25b1a6a0 mm: page_alloc: don't steal single pages from biggest buddy
    12abefb8c821 Bluetooth: btmtk: Remove the resetting step before downloading the fw
    c7a9df4ef4a7 Bluetooth: btmtk: Remove resetting mt7921 before downloading the fw
    2482f7705b83 io_uring: always arm linked timeouts prior to issue
    6b0383a21d3a rust: clean Rust 1.88.0's `clippy::uninlined_format_args` lint
    1c25723831c4 rust: allow Rust 1.87.0's `clippy::ptr_eq` lint
    6aac2c54762c Revert "um: work around sched_yield not yielding in time-travel mode"
    cd010271a92b do_umount(): add missing barrier before refcount checks in sync case
    3edac2949eb5 io_uring/sqpoll: Increase task_work submission batch size
    944af45bb76b drm/xe/tests/mocs: Hold XE_FORCEWAKE_ALL for LNCF regs
    95a75ed2b005 drm/xe/tests/mocs: Update xe_force_wake_get() return handling
    d6b013b44e44 riscv: misaligned: enable IRQs while handling misaligned accesses
    45a0697ceeae riscv: misaligned: factorize trap handling
    19fa2a483029 nvme: unblock ctrl state transition for firmware update
    7798edcc5b56 drm/panel: simple: Update timings for AUO G101EVN010
    184b147b9f7f loop: Add sanity check for read/write_iter
    a781ffe410d8 loop: factor out a loop_assign_backing_file helper
    5e1470b27672 loop: refactor queue limits updates
    0558ce095b76 loop: Fix ABBA locking race
    722f6dece719 loop: Simplify discard granularity calc
    02a77b3020a2 loop: Use bdev limit helpers for configuring discard
    126be03494f2 riscv: misaligned: Add handling for ZCB instructions
    eaa30e1d0ed2 MIPS: Fix MAX_REG_OFFSET
    fb98c9e584f4 iio: adc: dln2: Use aligned_s64 for timestamp
    ef5d6a409680 iio: accel: adxl355: Make timestamp 64-bit aligned using aligned_s64
    afe884959738 types: Complement the aligned types with signed 64-bit one
    245e319019c6 iio: temp: maxim-thermocouple: Fix potential lack of DMA safe buffer.
    e9bf391a9bce iio: accel: adxl367: fix setting odr for activity time update
    a2ad060643a4 usb: usbtmc: Fix erroneous generic_read ioctl return
    207391377646 usb: usbtmc: Fix erroneous wait_srq ioctl return
    29e17737465c usb: usbtmc: Fix erroneous get_stb ioctl error returns
    9d90c283eac5 USB: usbtmc: use interruptible sleep in usbtmc_read
    5ad298d6d4ae usb: typec: ucsi: displayport: Fix NULL pointer access
    3366a199483a usb: typec: tcpm: delay SNK_TRY_WAIT_DEBOUNCE to SRC_TRYWAIT transition
    1c001b6ddeb7 usb: misc: onboard_usb_dev: fix support for Cypress HX3 hubs
    08eca452a648 usb: host: tegra: Prevent host controller crash when OTG port is used
    d1c8fa4c6edb usb: gadget: Use get_status callback to set remote wakeup capability
    43ae91f561de usb: gadget: tegra-xudc: ACK ST_RC after clearing CTRL_RUN
    75f23e49add8 usb: gadget: f_ecm: Add get_status callback
    fae7f4460188 usb: cdnsp: fix L1 resume issue for RTL_REVISION_NEW_LPM version
    88d92cffc9d9 usb: cdnsp: Fix issue with resuming from L1
    f6fdbe4d543b usb: dwc3: gadget: Make gadget_wakeup asynchronous
    d133023c9a3f ocfs2: stop quota recovery before disabling quotas
    fe3d752a7a10 ocfs2: implement handshaking with ocfs2 recovery thread
    f96041a959f7 ocfs2: switch osb->disable_recovery to enum
    1b3b9158521a ocfs2: fix the issue with discontiguous allocation in the global_bitmap
    b76eaef983c7 x86/microcode: Consolidate the loader enablement checking
    d63851049f41 module: ensure that kobject_put() is safe for module type kobjects
    d66a22f6a432 memblock: Accept allocated memory before use in memblock_double_array()
    ed45af6841a9 clocksource/i8253: Use raw_spinlock_irqsave() in clockevent_i8253_disable()
    abbc99e898e4 arm64: cpufeature: Move arm64_use_ng_mappings to the .data section to prevent wrong idmap generation
    55701e992b17 accel/ivpu: Increase state dump msg timeout
    8e9c8a0393b5 xenbus: Use kref to track req lifetime
    54dd5d6af705 xen: swiotlb: Use swiotlb bouncing if kmalloc allocation demands it
    571dcf3d27b2 smb: client: Avoid race in open_cached_dir with lease breaks
    a9f28dbfdd1e usb: uhci-platform: Make the clock really optional
    92d0a28afba2 drm/amdgpu/hdp7: use memcfg register to post the write for HDP flush
    df044182621a drm/amdgpu/hdp6: use memcfg register to post the write for HDP flush
    0a776c305435 drm/amdgpu/hdp5: use memcfg register to post the write for HDP flush
    b6f0f3e6c7a9 drm/amdgpu/hdp5.2: use memcfg register to post the write for HDP flush
    4872de413e20 drm/amdgpu/hdp4: use memcfg register to post the write for HDP flush
    a13f9ac569f0 drm/amd/display: Copy AUX read reply data whenever length > 0
    2d63e66f7ba7 drm/amd/display: Fix wrong handling for AUX_DEFER case
    0e225bdba360 drm/amd/display: Remove incorrect checking in dmub aux handler
    fc7ac4ad1d16 drm/amd/display: Fix the checking condition in dmub aux handling
    468034a06a6e drm/amd/display: more liberal vmin/vmax update for freesync
    d8c4afe78385 drm/amd/display: Fix invalid context error in dml helper
    19323f414baa drm/amdgpu/vcn: using separate VCN1_AON_SOC offset
    206569cbf71a drm/xe: Add page queue multiplier
    a5f162727b91 drm/v3d: Add job to pending list if the reset was skipped
    dadf91161083 iio: imu: st_lsm6dsx: fix possible lockup in st_lsm6dsx_read_tagged_fifo
    a1cad8a3bca4 iio: imu: st_lsm6dsx: fix possible lockup in st_lsm6dsx_read_fifo
    82f6334a0b3e iio: imu: inv_mpu6050: align buffer for timestamp
    c4dfff960b34 iio: adis16201: Correct inclinometer channel resolution
    4cbd37a12aed iio: adc: rockchip: Fix clock initialization sequence
    c9f8413b78f2 iio: adc: ad7606: fix serial register access
    7f37e3148368 io_uring: ensure deferred completions are flushed for multishot
    4d41b9e4c9e8 drm/amd/display: Shift DMUB AUX reply command if necessary
    d362b21fefce KVM: SVM: Forcibly leave SMM mode on SHUTDOWN interception
    5156f7c484ab selftests/mm: fix a build failure on powerpc
    b21ec0726a7b selftests/mm: compaction_test: support platform with huge mount of memory
    b543a5a73b5c mm/userfaultfd: fix uninitialized output field for -EAGAIN race
    6166c3cf4054 mm/huge_memory: fix dereferencing invalid pmd migration entry
    2910019b04eb mm: vmalloc: support more granular vrealloc() sizing
    efb597345953 mm: fix folio_pte_batch() on XEN PV
    d87392094f96 x86/mm: Eliminate window where TLB flushes may be inadvertently skipped
    e8b1d65f0a93 staging: axis-fifo: Correct handling of tx_fifo_depth for size validation
    38a8982ca0b7 staging: axis-fifo: Remove hardware resets for user errors
    06753f49336a staging: bcm2835-camera: Initialise dev in v4l2_dev
    215e42e2f12c staging: iio: adc: ad7816: Correct conditional logic for store mode
    5bb112f16008 rust: clean Rust 1.88.0's warning about `clippy::disallowed_macros` configuration
    a85d8aed0c08 objtool/rust: add one more `noreturn` Rust function for Rust 1.87.0
    376b73292a26 rust: clean Rust 1.88.0's `unnecessary_transmutes` lint
    2943297acfea Input: synaptics - enable InterTouch on TUXEDO InfinityBook Pro 14 v5
    a82f4f5563b6 Input: synaptics - enable SMBus for HP Elitebook 850 G1
    bbb5081015ed Input: synaptics - enable InterTouch on Dell Precision M3800
    bc4556bba1c8 Input: synaptics - enable InterTouch on Dynabook Portege X30L-G
    9d9074af50e8 Input: synaptics - enable InterTouch on Dynabook Portege X30-D
    38bb0170d6ad Input: xpad - fix two controller table values
    bf239d383538 Input: xpad - add support for 8BitDo Ultimate 2 Wireless Controller
    302a0cd0bbc4 Input: xpad - fix Share button on Xbox One controllers
    619c05fb176c Input: mtk-pmic-keys - fix possible null pointer dereference
    f36230dacde9 Input: cyttsp5 - fix power control issue on wakeup
    ee25256789c3 Input: cyttsp5 - ensure minimum reset pulse width
    de02eb727f1a virtio-net: fix total qstat values
    bb8f86f40e04 net: export a helper for adding up queue stats
    7eea40818e8f fbnic: Do not allow mailbox to toggle to ready outside fbnic_mbx_poll_tx_ready
    650e283b4cd3 fbnic: Pull fbnic_fw_xmit_cap_msg use out of interrupt context
    9d9010879dc9 fbnic: Improve responsiveness of fbnic_mbx_poll_tx_ready
    612a05c9f20c fbnic: Actually flush_tx instead of stalling out
    fea860a2a613 fbnic: Gate AXI read/write enabling on FW mailbox
    cd25fc4c562e fbnic: Fix initialization of mailbox descriptor rings
    ce97489864c9 net: dsa: b53: do not set learning and unicast/multicast on up
    e5b40f4a2b3e net: dsa: b53: fix learning on VLAN unaware bridges
    ce1a289bf2ab net: dsa: b53: fix toggling vlan_filtering
    2407c98a1b4c net: dsa: b53: do not program vlans when vlan filtering is off
    7dac02582911 net: dsa: b53: do not allow to configure VLAN 0
    11c427a8699e net: dsa: b53: always rejoin default untagged VLAN on bridge leave
    90b65bc357ca net: dsa: b53: fix VLAN ID for untagged vlan on bridge leave
    42ab1f2b6f45 net: dsa: b53: fix flushing old pvid VLAN on pvid change
    4ed7e603139f net: dsa: b53: fix clearing PVID of a port
    46de8f2aa389 net: dsa: b53: keep CPU port always tagged again
    11dbd4e0a89a net: dsa: b53: allow leaky reserved multicast
    b37e54259cab bpf: Scrub packet on bpf_redirect_peer
    e2ab67672b22 netfilter: ipset: fix region locking in hash types
    0160ac84fb03 ipvs: fix uninit-value for saddr in do_output_route4
    64385c0d02f7 erofs: ensure the extra temporary copy is valid for shortened bvecs
    574686c80754 ice: use DSN instead of PCI BDF for ice_adapter index
    62946989e660 ice: Initial support for E825C hardware in ice_adapter
    4555c4a13a93 wifi: mac80211: fix the type of status_code for negotiated TID to Link Mapping
    c33927f3858c can: gw: fix RCU/BH usage in cgw_create_job()
    8f24cc6a72eb can: mcp251xfd: fix TDC setting for low data bit rates
    2ecce25ea296 can: m_can: m_can_class_allocate_dev(): initialize spin lock on device probe
    79a6945e3de5 net: ethernet: mtk_eth_soc: do not reset PSE when setting FE
    aac9d5fa537b net: ethernet: mtk_eth_soc: reset all TX queues on DMA free
    35be4c0cdf46 gre: Fix again IPv6 link-local address generation.
    94a6f6c204ab virtio-net: free xsk_buffs on error in virtnet_xsk_pool_enable()
    edd53ee790f3 virtio_net: xsk: bind/unbind xsk for tx
    98cd7ed92753 sch_htb: make htb_deactivate() idempotent
    5c3b8f05756b s390/entry: Fix last breaking event handling in case of stack corruption
    2148d34371b0 ksmbd: fix memory leak in parse_lease_state()
    ec334aaab747 openvswitch: Fix unsafe attribute parsing in output_userspace()
    9e9841e232b5 ksmbd: Fix UAF in __close_file_table_ids
    d62ba16563a8 ksmbd: prevent out-of-bounds stream writes by validating *pos
    c57301e332cc ksmbd: prevent rename with empty string
    1b7b1cbc6e73 can: rockchip_canfd: rkcanfd_remove(): fix order of unregistration calls
    12ef60f1b99c can: mcp251xfd: mcp251xfd_remove(): fix order of unregistration calls
    c488f8b53e15 s390/pci: Fix duplicate pci_dev_put() in disable_slot() when PF has child VFs
    afa5cdce062a vfio/pci: Align huge faults to order
    9423f6da8251 wifi: cfg80211: fix out-of-bounds access during multi-link element defragmentation
    be54b750c333 s390/pci: Fix missing check for zpci_create_device() error return
    e0a8e3ca07be can: mcan: m_can_class_unregister(): fix order of unregistration calls
    14ee85b74807 firmware: arm_scmi: Fix timeout checks on polling path
    fe3da1bfd8d4 arm64: dts: imx8mm-verdin: Link reg_usdhc2_vqmmc to usdhc2
    ff7d691921c7 Revert "btrfs: canonicalize the device path before adding it"
    61e0fc331230 fs/erofs/fileio: call erofs_onlinefolio_split() after bio_add_folio()
    b32411f0459d dm: add missing unlock on in dm_keyslot_evict()
    2ee7ebed771b mips: Add '-std=gnu11' to vdso CFLAGS
    b2c792d89ac5 yaffs2: switch from readlink_copy() to vfs_readlink()
    807165b1ec1c tools/power/x86/intel-speed-select: Prefix header search path with sysroot
    e97df805b938 drm/tilcdc: Set preferred depth
    7160a4379dcc arch/arm64/configs: remove CONFIG_SM_DISPCC_8650
    6d8ac5ebe6e8 aufs6: core
    587abc1b64c4 aufs6: standalone
    1af41d30ef42 aufs6: mmap
    6ee2464d2e9d aufs6: base
    103b676505f7 aufs6: kbuild
    67281562943f qemux86: add configuration symbol to select values
    73f315ca0823 sched/isolation: really align nohz_full with rcu_nocbs
    1e4e7f8ab622 clear_warn_once: add a clear_warn_once= boot parameter
    918e7a825e8b clear_warn_once: bind a timer to written reset value
    f533f87c3758 clear_warn_once: expand debugfs to include read support
    f149ca27cba9 tools: Remove some options from CLANG_CROSS_FLAGS
    e633abe9c44e libbpf: Fix build warning on ref_ctr_off
    ec0916a4cfc1 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    03721ceb5626 perf: x86-32: explicitly include <errno.h>
    4c36c5295bb0 perf: mips64: Convert __u64 to unsigned long long
    b0200449610d perf: fix bench numa compilation
    aff0940b2212 perf: add SLANG_INC for slang.h
    ef912018d28c perf: add sgidefs.h to for mips builds
    d8860f858b87 perf: change --root to --prefix for python install
    dc38a0eee6e5 perf: add 'libperl not found' warning
    6ed51f8786da perf: force include of <stdbool.h>
    c538d4c4ac65 fat: Replace prandom_u32() with get_random_u32()
    63d94846f0c5 fat: don't use obsolete random32 call in namei_vfat
    7816667451ef FAT: Added FAT_NO_83NAME
    f81dbd60f0d5 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    771cdefba44b FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    a24784fd8f88 yaffs2: update to v6.12 folio changes
    d0a48fd46db8 yaffs2: adapt to v6.10 i_time changes
    d097e4d4115a yaffs: fix mtime/itime field access
    4411e0d49fe3 yaffs2: update VFS ctime operations to 6.6+
    1b6619086e8b yaffs2: v6.5 fixups
    25b261ee3c54 yaffs2: Fix miscalculation of devname buffer length
    5c07936a5d1c yaffs2: convert user_namespace to mnt_idmap
    55986a1284b3 yaffs2: replace bdevname call with sprintf
    6f5508f8db8f yaffs2: convert read_page -> readfolio
    fd179a5df5d5 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    c9a620dacdd1 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    78588208ed17 yaffs2: v5.12+ build fixups (not runtime tested)
    8d2dddba272c yaffs: include blkdev.h
    8c1ca9ef9712 yaffs: Fix build failure by handling inode i_version with proper atomic API
    27005cbac2ed yaffs2: v5.6 build fixups
    668211c9f9b7 yaffs2: fix memory leak when /proc/yaffs is read
    285f911dcc1c yaffs: add strict check when call yaffs_internal_read_super
    ffc2ed489ccf yaffs: repair yaffs_get_mtd_device
    6dce4b70a5e3 yaffs: Fix build failure by handling inode i_version with proper atomic API
    19f283abc5d1 yaffs2: fix memory leak in mount/umount
    04e84672b571 yaffs: Avoid setting any ACL releated xattr
    4f221d6a32e2 Yaffs:check oob size before auto selecting Yaffs1
    81f36004e56b fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    26d7a3dd0054 yaffs2: adjust to proper location of MS_RDONLY
    a7016eac4540 yaffs2: import git revision b4ce1bb (jan, 2020)
    feb240bbb91e initramfs: allow an optional wrapper script around initramfs generation
    874746eaa341 drivers: gpu: drm: msm: registers: improve reproducibility
    1d42508faee8 tools: use basename to identify file in gen-mach-types
    4b055eca593d iwlwifi: select MAC80211_LEDS conditionally
    97e20e275ac0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    6dec58319165 defconfigs: drop obselete options
    a416ccb5b6c9 linux-yocto: Handle /bin/awk issues
    7efe8a1e5158 uvesafb: provide option to specify timeout for task completion
    78d10ae07eca uvesafb: print error message when task timeout occurs
    80473b7eb8ca compiler.h: Undef before redefining __attribute_const__
    ddeff2f1a9a7 vmware: include jiffies.h
    3dcdda8912b4 Resolve jiffies wrapping about arp
    3b1507db6735 nfs: Allow default io size to be configured.
    c2fedad05f77 check console device file on fs when booting
    208d6fbada3f mount_root: clarify error messages for when no rootfs found
    dbe9454c8ea0 mconf: fix output of cflags and libraries
    7c7b224f5cce menuconfig,mconf-cfg: Allow specification of ncurses location
    b6c189c81397 modpost: mask trivial warnings
    a5cc21325ba9 kbuild: exclude meta directory from distclean processing
    361ec143c23f powerpc: serialize image targets
    605e6ccb304c arm: serialize build targets
    e94b04fcb7d2 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    44cc7f69a0a0 cpu/amd: inhibit SMP check for qemux86
    a08cb65331e6 x86_64_defconfig: Fix warnings
    8ad332ef777b mips: make current_cpu_data preempt safe
    754f05ddce3f mips: vdso: fix 'jalr $t9' crash in vdso code
    325ff78ff44d mips: Kconfig: add QEMUMIPS64 option
    99ae0eadcf11 4kc cache tlb hazard: tlbp cache coherency
    c6894c66a534 malta uhci quirks: make allowance for slow 4k(e)c
    8b52c01f3294 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    16c7629f035e drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    6b60c874cbb0 arm64: defconfig: cleanup config options
    8e44673ecd89 vexpress: Pass LOADADDR to Makefile
    f34e6805aad5 arm: ARM EABI socketcall
    94dec9b88de4 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 3daeea905c..c6be153d16 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "25c4a5115a23de065dd0a75ad7a95cd9efe4101c"
-SRCREV_meta ?= "dbf27c65983541ec12f26dc63efa0289ff16e1e3"
+SRCREV_machine ?= "9ee7ecfcabe12ffae693f11c83d8cf6d8181f12a"
+SRCREV_meta ?= "020a66c734ee618ed2b25a89102fd8de2ef98f9b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.28"
+LINUX_VERSION ?= "6.12.29"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 755aa35da5..f81f20e74e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.28"
+LINUX_VERSION ?= "6.12.29"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
-SRCREV_meta ?= "dbf27c65983541ec12f26dc63efa0289ff16e1e3"
+SRCREV_machine ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
+SRCREV_meta ?= "020a66c734ee618ed2b25a89102fd8de2ef98f9b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 96272d1d3d..e1a7d05fbb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f9767e83fd62a9807a62c2f6d2733fe2f5f792fd"
-SRCREV_machine:qemuarm64 ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
-SRCREV_machine:qemuloongarch64 ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
-SRCREV_machine:qemumips ?= "53f5fd2e711999de5fef3b4c336482a900a292d7"
-SRCREV_machine:qemuppc ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
-SRCREV_machine:qemuriscv64 ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
-SRCREV_machine:qemuriscv32 ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
-SRCREV_machine:qemux86 ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
-SRCREV_machine:qemux86-64 ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
-SRCREV_machine:qemumips64 ?= "b5d3ac10319c3de37ef49e685b1379f831d355b1"
-SRCREV_machine ?= "aaade4403631dc295fda2ed1f949c2820e409daf"
-SRCREV_meta ?= "dbf27c65983541ec12f26dc63efa0289ff16e1e3"
+SRCREV_machine:qemuarm ?= "556bd3efe644334440f7c2be6df21a5d05d9e471"
+SRCREV_machine:qemuarm64 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
+SRCREV_machine:qemuloongarch64 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
+SRCREV_machine:qemumips ?= "93b73e8b0f1d2d23499ece2050e55a69057aec5a"
+SRCREV_machine:qemuppc ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
+SRCREV_machine:qemuriscv64 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
+SRCREV_machine:qemuriscv32 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
+SRCREV_machine:qemux86 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
+SRCREV_machine:qemux86-64 ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
+SRCREV_machine:qemumips64 ?= "e2f38ec1df747da895699dcb9955606e1a8d60da"
+SRCREV_machine ?= "e4b00bee45a4432a5739542e2b50def9a63ba6d0"
+SRCREV_meta ?= "020a66c734ee618ed2b25a89102fd8de2ef98f9b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f08cdc6cc92e3d23a05745f0f12f8caa348a27b4"
+SRCREV_machine:class-devupstream ?= "5be5dbf91ef3c8643d2a3698d557a52059702487"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.28"
+LINUX_VERSION ?= "6.12.29"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


