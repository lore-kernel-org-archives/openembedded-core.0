Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A83DC83F3D
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 20:05:17 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.24812.1753041915057252776
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 13:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nzeli92J;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2350fc2591dso34093975ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 13:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753041914; x=1753646714; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtvMHs9LFHwgcJfTZUYgZlXY0AhmtNmziuxGDUsWwhg=;
        b=nzeli92JRwSYMF19sCqfY/O2ehK2QDVXL2f/oJ1ZhPvCH0rAm3zX7Q4HAF6yQrS5Vv
         JylZVjerEpwQ8KC8j0oYQtpNkxyykIEmtI9hMfglS6oHviXNUFJhsrN4KgxVP2BBw5RB
         4ds4I6nNpUx38fuVt1tSY5D/JJmwBtsCldt+J+XtAs7Rf+ht49CBwd22aazwDll8ha+r
         Ug5VCoe0NIHijbu5CkESpXvbR730nv7DknD3W3fQqTxxu69YCXxlXMcM49PWlK1mEcoe
         pk4kJfBS2jAm7bZVzgw4pM6iUnkFs8sp7Ct5figHWYpEs2p19xk79ng4kNqyB7sQsczT
         KTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041914; x=1753646714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtvMHs9LFHwgcJfTZUYgZlXY0AhmtNmziuxGDUsWwhg=;
        b=sOaE5+cQWc2jTGRKgN0LMBVEVRiHHDhvmydXdk3JYeme4EAc2tvxeXZaqr1+AbNg7F
         Q918BW6MNFVRr/KYgVQqCdu/8bzUCXW7gBCTuCHk0eslsnMI1JC2fQA+5asxM0DkvpAv
         ZCQWizmVzgmm1Cp7UlWyI6jcwPlyCuRZdhNdfFfZdr+DUzn3gHfoTC1FJg1BdRD5N/PP
         kbXQMkW7n9wtjxzLrR1s45Dsm8WEXYDkTljeAcKk+p1YjLs8ErV4Czj+Odx9KLaC1JpW
         3e7V9o3xj848m6mZRO3f69FemvG+n/4OBKqKmrJTs6F867t9BL2BIVT7Dojo91DWC4mk
         HJlw==
X-Gm-Message-State: AOJu0YyLNg3GeB/o1NgGx0DfWvB7pArgmgRMcRTIqFE7aJMLKTsLNEVp
	i2I3WohoRnHXMs7g/8HLsi/5A0rvzr3VR4CR6VB26ywVSd5l62Bz5fVibRgirqGt8oqLx8d7zdE
	9KumT2pg=
X-Gm-Gg: ASbGncuffBR0Qrfr1O/51dm+SliE1sdGkQ2bV6iDJuNCTVWHSw/u7rEcMCLa3ThVxKI
	rR4KwNvi37B5mZNWAXEvS8xAO3t+7Jj3EFAMTAL0qhCNAYk+gs4x0DqqZhDa8/60JfSqUknitHr
	WRGWaQO+ZpbbX6yufcZBjBy8+06DOQx/89xNkejEuDR/QhkX3coi72gj601ZGxOZ+3lgbe6uIHZ
	gAzQBiY+IitOsLxzcPPxrgwJ2Qck0r+kC0tHGIpApH2eeZpCrbVqSXJGioNeejEpjEf19Hwdemj
	GiT4bC374kQG2x8LTEKnRWPD5Ngz4nsvqvTmLU0wl6m1WhUmvWt1sYXh+cE+iwYJ8tXcmGp7vi5
	UvmFJbcQtH+Kwyw==
X-Google-Smtp-Source: AGHT+IEQ16sniNvzXRQHiwwwXrmgXbDlWaEu32ksTO5MNmzavAzkUVZGq+/UUoLkGmDQdv1jTjNFLA==
X-Received: by 2002:a17:902:ce0a:b0:236:71a5:4417 with SMTP id d9443c01a7336-23e38f1f64dmr132685735ad.5.1753041913649;
        Sun, 20 Jul 2025 13:05:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:31c9:438f:a923:8d3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f096sm44894035ad.78.2025.07.20.13.05.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 13:05:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 08/12] linux-yocto/6.12: update to v6.12.36
Date: Sun, 20 Jul 2025 13:04:45 -0700
Message-ID: <39094717651a02b709b9466b7d2c1d54775fe74f.1753041740.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753041740.git.steve@sakoman.com>
References: <cover.1753041740.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 20:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220633

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    df64e51d4ab83 Linux 6.12.36
    2701654671697 spi: fsl-qspi: Fix double cleanup in probe error path
    07836bc18f4ae btrfs: fix use-after-free on inode when scanning root during em shrinking
    5f4863cfb29a7 btrfs: zoned: fix extent range end unlock in cow_file_range()
    f68b27d82a749 spi: fsl-qspi: use devm function instead of driver remove
    442312c2a90d6 net: stmmac: Fix accessing freed irq affinity_hint
    725a59d29adb5 drm/amdkfd: Fix instruction hazard in gfx12 trap handler
    6c7dc7ad867c1 drm/amdkfd: remove gfx 12 trap handler page size cap
    37d28309ee8b9 ALSA: hda/realtek: Bass speaker fixup for ASUS UM5606KA
    4ea0883b5af75 arm64: dts: rockchip: Add avdd HDMI supplies to RockPro64 board dtsi
    1fc00e1451720 riscv/atomic: Do proper sign extension also for unsigned in arch_cmpxchg
    fbbb0e0de97f6 btrfs: do regular iput instead of delayed iput during extent map shrinking
    fef55c4d9c9c2 btrfs: make the extent map shrinker run asynchronously as a work queue job
    c223f378b6956 btrfs: skip inodes without loaded extent maps when shrinking extent maps
    0d087de947bab drm/fbdev-dma: Add shadow buffering for deferred I/O
    8e2dcdf22c8b2 drm/msm/dp: account for widebus and yuv420 during mode validation
    287b9cec2eef6 usb: typec: tcpm: PSSourceOffTimer timeout in PR_Swap enters ERROR_RECOVERY
    ab64e42864c98 drm/xe: Carve out wopcm portion from the stolen memory
    b2d2be772d50d iio: dac: ad3552r-common: fix ad3541/2r ranges
    c890a5b80d1f2 iio: dac: ad3552r: extract common code (no changes in behavior intended)
    0a8ac8f8430db iio: dac: ad3552r: changes to use FIELD_PREP
    10b3772292bf1 btrfs: do proper folio cleanup when cow_file_range() failed
    5d479182d4ccd net: phy: realtek: add RTL8125D-internal PHY
    5eb0b10eea271 net: phy: realtek: merge the drivers for internal NBase-T PHY's
    37cb5967bd251 r8169: add support for RTL8125D
    1f4b030e08391 mm/vma: reset VMA iterator on commit_merge() OOM failure
    560c3b51c799e io_uring/kbuf: flag partial buffer mappings
    c8d152b8c1968 io_uring/net: mark iov as dynamically allocated even for single segments
    b8be3ae062e63 io_uring/net: always use current transfer count for buffer put
    725fcba8bd2e3 io_uring/net: only consider msg_inq if larger than 1
    0c07f2bf49f26 io_uring/net: only retry recv bundle for a full transfer
    399214d70304a io_uring/net: improve recv bundles
    50998b0ae7d9d io_uring/rsrc: don't rely on user vaddr alignment
    53fd75f25b223 io_uring/rsrc: fix folio unpinning
    8b8a366e8cb26 io_uring: fix potential page leak in io_sqe_buffer_register()
    6d56ea133adf0 net: libwx: fix Tx L4 checksum
    c216c235ac1b3 x86/pkeys: Simplify PKRU update in signal frame
    f609cebca1e29 x86/fpu: Refactor xfeature bitmask update code for sigframe XSAVE
    0519b6107583c media: uvcvideo: Rollback non processed entities on error
    8cd7ee9cd7dec drm/amd/display: Fix mpv playback corruption on weston
    5f2e040f19c4d drm/amdgpu: switch job hw_fence to amdgpu_fence
    9cfa2fea2566f drm/amdgpu: Fix SDMA UTC_L1 handling during start/stop sequences
    cc0a3fd781bf8 drm/i915/dsi: Fix off by one in BXT_MIPI_TRANS_VTOTAL
    e5e1996780292 drm/xe: Fix early wedge on GuC load failure
    a6d81b2d7037e drm/xe: Fix taking invalid lock on wedge
    57e044005e9ed drm/xe: Fix memset on iomem
    e881b82f5d3d8 drm/amd/display: Check dce_hwseq before dereferencing it
    593517e5561cb drm/amdgpu: Add kicker device detection
    ba1ffc32bda79 drm/amd/display: Fix RMCM programming seq errors
    57f1ed963cb26 drm/xe/guc_submit: add back fix
    f684192fca915 drm/xe/sched: stop re-submitting signalled jobs
    0bc8ad50f0768 drm/xe/vm: move rebind_work init earlier
    ca8efc6a89716 drm/amd/display: Correct non-OLED pre_T11_delay.
    e2c3133ff4d59 drm/amdgpu: amdgpu_vram_mgr_new(): Clamp lpfn to total vram
    4ce9f2dc9ff7c drm/amd/display: Add null pointer check for get_first_active_display()
    b7e273ebb3992 drm/bridge: cdns-dsi: Wait for Clk and Data Lanes to be ready
    88189662ade0b drm/bridge: cdns-dsi: Check return value when getting default PHY config
    40261f044793d drm/bridge: cdns-dsi: Fix connecting to next bridge
    750442b99e0a5 drm/bridge: cdns-dsi: Fix phy de-init and flag it so
    0d11689681d90 drm/bridge: cdns-dsi: Fix the clock variable for mode_valid()
    b681e2a8a7595 drm/amdkfd: Fix race in GWS queue scheduling
    1847ea44e3bdf drm/msm/gpu: Fix crash when throttling GPU immediately during boot
    4da83f06c3ed7 drm/udl: Unregister device before cleaning up on disconnect
    31ac2c680a8ac drm/tegra: Fix a possible null pointer dereference
    7271a32074ebf drm/tegra: Assign plane type before registration
    b464edc12d5bd drm/etnaviv: Protect the scheduler's pending list with its lock
    2dae4a71a1365 drm/cirrus-qemu: Fix pitch programming
    3d379b2a73282 drm/ast: Fix comment on modeset lock
    6a87e794046f5 scsi: ufs: core: Fix clk scaling to be conditional in reset and restore
    19a47c966deb3 scsi: megaraid_sas: Fix invalid node index
    70017f56b1207 HID: wacom: fix kobject reference count leak
    2746d020667ef HID: wacom: fix memory leak on sysfs attribute creation failure
    a85999b987654 HID: wacom: fix memory leak on kobject creation failure
    4b4b639cc50a8 HID: lenovo: Restrict F7/9/11 mode to compact keyboards only
    c465f523333ec f2fs: fix to zero post-eof page
    7b4ac8433c7d6 mm/gup: revert "mm: gup: fix infinite loop within __get_longterm_locked"
    cf95f8426f889 maple_tree: fix MA_STATE_PREALLOC flag in mas_preallocate()
    db0035ec7a6bb net: libwx: fix the creation of page_pool
    74b0b4cf13fc0 spi: spi-cadence-quadspi: Fix pm runtime unbalance
    6c59782898d44 btrfs: update superblock's device bytes_used when dropping chunk
    2088895d59030 btrfs: fix a race between renames and directory logging
    b9f78c36c095c dm-raid: fix variable in journal device check
    5a8400ebc2463 Bluetooth: L2CAP: Fix L2CAP MTU negotiation
    765af231964d6 serial: imx: Restore original RXTL for console to fix data loss
    2b8788496f132 serial: core: restore of_node information in sysfs
    1f6e759907003 dt-bindings: serial: 8250: Make clocks and clock-frequency exclusive
    379cca2ad9da4 staging: rtl8723bs: Avoid memset() in aes_cipher() and aes_decipher()
    2b9052d88de72 x86/traps: Initialize DR6 by writing its architectural reset value
    8ed96d8e0559b EDAC/amd64: Fix size calculation for Non-Power-of-Two DIMMs
    bced02aca3437 cifs: Fix reading into an ITER_FOLIOQ from the smbdirect code
    87dcc7e33fc3d cifs: Fix the smbd_response slab to allow usercopy
    b8ddcca4391ee smb: client: make use of common smbdirect_socket_parameters
    69cafc413c2d8 smb: smbdirect: introduce smbdirect_socket_parameters
    c39639bc77232 smb: client: make use of common smbdirect_socket
    f4b05342c2937 smb: smbdirect: add smbdirect_socket.h
    a6ec1fcafd411 smb: smbdirect: add smbdirect.h with public structures
    6509de31b1b67 smb: client: make use of common smbdirect_pdu.h
    a9bb4006c4f3a smb: smbdirect: add smbdirect_pdu.h with protocol definitions
    7f3ead8ebc0ef smb: client: fix potential deadlock when reconnecting channels
    1b12f8dabbb8f drm/xe: Process deferred GGTT node removals on device unwind
    3549ad85aaf33 drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type
    29a7c0b653162 drm/bridge: ti-sn65dsi86: make use of debugfs_init callback
    18ec560e3e9b4 drm/i915: fix build error some more
    23116bf9a3d04 drm/amd: Adjust output for discovery error handling
    840fe792a1706 drm/amdgpu/discovery: optionally use fw based ip discovery
    104048a4a49e5 net: selftests: fix TCP packet checksum
    3b6a9d35defb4 ALSA: hda/realtek: Fix built-in mic on ASUS VivoBook X507UAR
    ae539d963a174 atm: Release atm_dev_mutex after removing procfs in atm_dev_deregister().
    12bcb7eb0fb96 netlink: specs: tc: replace underscores with dashes in names
    a493e780b53a8 net: enetc: Correct endianness handling in _enetc_rd_reg64
    11b3e07e7d6a2 libbpf: Fix possible use-after-free for externs
    e1f6654f22994 um: ubd: Add missing error check in start_io_thread()
    c6665b8f0f580 bnxt: properly flush XDP redirect lists
    dbcd546400ead vsock/uapi: fix linux/vm_sockets.h userspace compilation errors
    353739da693e7 wifi: mac80211: finish link init before RCU publish
    d383657857385 wifi: mac80211: Create separate links for VLAN interfaces
    a4afc3d522ca0 wifi: mac80211: Add link iteration macro for link data
    949060a62399f af_unix: Don't set -ECONNRESET for consumed OOB skb.
    8d049443f7e5b wifi: mac80211: fix beacon interval calculation overflow
    715f6dbe9bdf6 ethernet: ionic: Fix DMA mapping tests
    5b7d9b26a177a libbpf: Fix null pointer dereference in btf_dump__free on allocation failure
    b10a7953649b1 attach_recursive_mnt(): do not lock the covering tree when sliding something under it
    0ee87c2814deb ALSA: usb-audio: Fix out-of-bounds read in snd_usb_get_audioformat_uac3()
    ce23b73f0f27e Bluetooth: hci_core: Fix use-after-free in vhci_flush()
    a07005a77b18a atm: clip: prevent NULL deref in clip_push()
    a4f182ffa30c5 HID: wacom: fix crash in wacom_aes_battery_handler()
    ac758d459642b drm/xe/display: Add check for alloc_ordered_workqueue()
    874b5818ca355 Revert "riscv: misaligned: fix sleeping function called during misaligned access handling"
    fe30c30bf3bb6 Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"
    29d39e0d5f16c lib/group_cpus: fix NULL pointer dereference from group_cpus_evenly()
    93abf5e0d584b fs/proc/task_mmu: fix PAGE_IS_PFNZERO detection for the huge zero folio
    f855b119e62b0 s390/pkey: Prevent overflow in size calculation for memdup_user()
    13e23872a9615 ASoC: amd: yc: Add DMI quirk for Lenovo IdeaPad Slim 5 15
    c5d5b0047b0c0 mm/damon/sysfs-schemes: free old damon_sysfs_scheme_filter->memcg_path on write
    f85c7138f786f smb: client: remove \t from TP_printk statements
    59e31c92b3bc4 ata: ahci: Use correct DMI identifier for ASUSPRO-D840SA LPM quirk
    28f0c4c93a1d0 i2c: robotfuzz-osif: disable zero-length read messages
    a4dae6cbd23b0 i2c: tiny-usb: disable zero-length read messages
    61a9ad7b69ce6 af_unix: Don't leave consecutive consumed OOB skbs.
    6420a8d27ef3f accel/ivpu: Trigger device recovery on engine reset/resume failure
    397f3a7402fae accel/ivpu: Add debugfs interface for setting HWS priority bands
    d80302350c32c accel/ivpu: Separate DB ID and CMDQ ID allocations from CMDQ allocation
    fbc93866b0cf0 accel/ivpu: Make command queue ID allocated on XArray
    0c3fa6e8441b1 accel/ivpu: Remove copy engine support
    341de32ea4d6e accel/ivpu: Do not fail on cmdq if failed to allocate preemption buffers
    fe82323201257 PCI: apple: Set only available ports up
    b5939ac40380f PCI: apple: Use helper function for_each_child_of_node_scoped()
    4149f0ee5e085 f2fs: don't over-report free space or inodes in statvfs
    a8795f3cd289c ASoC: codecs: wcd9335: Fix missing free of regulator supplies
    2dc8ebfb69559 ASoC: codec: wcd9335: Convert to GPIO descriptors
    8b69608c6b677 jfs: validate AG parameters in dbMount() to prevent crashes
    4b58be1bc4228 fs/jfs: consolidate sanity checking in dbMount
    f51efc4606e44 btrfs: fix qgroup reservation leak on failure to allocate ordered extent
    4cce1b05eb950 btrfs: use unsigned types for constants defined as bit shifts
    1fe766ddb90cf btrfs: factor out nocow ordered extent and extent map generation into a helper
    7952c4bb50925 Revert "drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1"
    5b930e72aaeaf drm/i915/gem: Allow EXEC_CAPTURE on recoverable contexts on DG1
    bbe9231fe611a btrfs: handle csum tree error with rescue=ibadroots correctly
    04373900864e2 ovl: Check for NULL d_inode() in ovl_dentry_upper()
    ae2353d862eb0 scsi: ufs: core: Don't perform UFS clkscaling during host async scan
    a52f78bc8bb1a ceph: fix possible integer overflow in ceph_zero_objects()
    7d468ca41a159 ASoC: rt1320: fix speaker noise when volume bar is 100%
    1818fc3602e87 ALSA: usb-audio: Add a quirk for Lenovo Thinkpad Thunderbolt 3 dock
    2b331e7b6cc57 ALSA: hda: Add new pci id for AMD GPU display HD audio controller
    c863f7e08f6e5 ALSA: hda: Ignore unsol events for cards being shut down
    1346d12e4658c riscv: add a data fence for CMODX in the kernel mode
    1ef2737432fcc usb: typec: mux: do not return on EOPNOTSUPP in {mux, switch}_set
    10cc2cfd3e5d0 usb: typec: displayport: Receive DP Status Update NAK request exit dp altmode
    cf69fedbb1192 usb: gadget: f_hid: wake up readers on disable/unbind
    43ea23645b16b usb: cdc-wdm: avoid setting WDM_READ for ZLP-s
    53809d38ec364 usb: Add checks for snprintf() calls in usb_alloc_dev()
    4fb6703824793 usb: common: usb-conn-gpio: use a unique name for usb connector device
    685d29f2c5057 tty: serial: uartlite: register uart driver in init
    358d5ba08f160 usb: potential integer overflow in usbg_make_tpg()
    a10c8bff454b1 misc: tps6594-pfsm: Add NULL pointer check in tps6594_pfsm_probe()
    71f79ec25a5a4 iio: adc: ad_sigma_delta: Fix use of uninitialized status_pos
    ba78c2b3254c4 usb: dwc2: also exit clock_gating when stopping udc while suspended
    c7bfbba30fd10 coresight: Only check bottom two claim bits
    a0baf4d78b2be 8250: microchip: pci1xxxx: Add PCIe Hot reset disable support for Rev C0 and later devices
    cf6d532de4423 um: use proper care when taking mmap lock during segfault
    4f95f49d2bd02 um: Add cmpxchg8b_emu and checksum functions to asm-prototypes.h
    6795442e6ae57 iio: pressure: zpa2326: Use aligned_s64 for the timestamp
    aefd0a9356251 drm/scheduler: signal scheduled fence when kill job
    777580609d578 drm/amdgpu: seq64 memory unmap uses uninterruptible lock
    667c3f52373ff bcache: fix NULL pointer in cache_set_flush()
    861204dce6ed0 amd/amdkfd: fix a kfd_process ref leak
    3b611834b9386 md/md-bitmap: fix dm-raid max_write_behind setting
    78a4adcd3fedb nvme-tcp: sanitize request list handling
    7b86ce16706b9 nvme-tcp: fix I/O stalls on congested sockets
    519ab9c725db7 PCI: imx6: Add workaround for errata ERR051624
    1d34f7fb7a7e7 PCI: apple: Fix missing OF node reference in apple_pcie_setup_port
    9f0fa01811114 PCI: dwc: Make link training more robust by setting PORT_LOGIC_LINK_WIDTH to one lane
    80fb5c71ae214 dmaengine: xilinx_dma: Set dma_device directions
    98fd66c8ba77e dmaengine: idxd: Check availability of workqueue allocated by idxd wq driver before using
    6298a28a2c2ad rust: arm: fix unknown (to Clang) argument '-mno-fdpic'
    58364e74070bf rust: module: place cleanup_module() in .exit.text section
    229aa5b810e0b ksmbd: provide zero as a unique ID to the Mac client
    0fce0027a56a2 ksmbd: allow a filename to contain special characters on SMB3.1.1 posix extension
    2414d3452ae6d hwmon: (pmbus/max34440) Fix support for max34451
    9453ce2dd672b NFSv4: xattr handlers should check for absent nfs filehandles
    b3dc5c735a754 cxl/region: Add a dev_err() on missing target list entries
    3a0f33c420c5f fuse: fix race between concurrent setattrs from multiple nodes
    dcd5b32139cd6 leds: multicolor: Fix intensity setting while SW blinking
    77da618098531 dm vdo indexer: don't read request structure after enqueuing
    5fc29fb747a11 sunrpc: don't immediately retransmit on seqno miss
    b9c7bc45ead8c mfd: max14577: Fix wakeup source leaks on device unbind
    8a997e1ab550f mailbox: Not protect module_put with spin_lock_irqsave
    7dd032d124056 NFSv4.2: fix setattr caching of TIME_[MODIFY|ACCESS]_SET when timestamps are delegated
    871d1d7f374e7 NFSv4.2: fix listxattr to return selinux security label
    605daf6ae663e NFSv4: Always set NLINK even if the server doesn't support it
    61dd1dcf0549f cifs: Fix encoding of SMB1 Session Setup NTLMSSP Request in non-UNICODE mode
    ef4b3a7bf95bb cifs: Fix cifs_query_path_info() for Windows NT servers
    f80fdf48b80c2 cifs: Correctly set SMB1 SessionKey field in Session Setup Request
    783cd2c3dca8b Linux 6.12.35
    da70cb95b8b56 bpftool: Fix cgroup command to only show cgroup bpf programs
    f4d483852a455 cifs: Remove duplicate fattr->cf_dtype assignment from wsl_to_fattr() function
    fddf20b3341d8 gpio: mlxbf3: only get IRQ for device instance 0
    b99cf44daacfd perf test: Directory file descriptor leak
    e6386adcb435e perf evsel: Missed close() when probing hybrid core PMUs
    1afda9f2bd854 gpio: pca953x: fix wrong error probe return value
    ca1f9cc89ca94 RISC-V: KVM: Don't treat SBI HFENCE calls as NOPs
    ee85e957f6d74 RISC-V: KVM: Fix the size parameter check in SBI SFENCE calls
    38cd10628252f scsi: elx: efct: Fix memory leak in efct_hw_parse_filter()
    22f935bc86bdf arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth()
    fd199366bf386 perf/core: Fix WARN in perf_cgroup_switch()
    7335c33d621fd perf: Fix cgroup state vs ERROR
    456019adaa2f5 perf: Fix sample vs do_exit()
    989c77a3dec8b s390/pci: Fix __pcilg_mio_inuser() inline assembly
    8ae7814589d7b smb: client: fix max_sge overflow in smb_extract_folioq_to_rdma()
    e27cb3ac5a83e smb: client: fix first command failure during re-negotiation
    977b7cc77852d serial: sh-sci: Increment the runtime usage counter for the earlycon device
    966dbf35e36f8 serial: sh-sci: Clean sci_ports[0] after at earlycon exit
    43f26094d6702 smb: Log an error when close_all_cached_dirs fails
    a5b7c237ea36c dt-bindings: i2c: nvidia,tegra20-i2c: Specify the required properties
    031d274c7bc2f EDAC/amd64: Correct number of UMCs for family 19h models 70h-7fh
    5fe1b23a2f87f net: atm: fix /proc/net/atm/lec handling
    f4d80b16ecc42 net: atm: add lec_mutex
    b4603bf956c42 mlxbf_gige: return EPROBE_DEFER if PHY IRQ is not available
    988edde4d52d5 calipso: Fix null-ptr-deref in calipso_req_{set,del}attr().
    929544ba3c35a drm/xe/bmg: Update Wa_16023588340
    d42b44736ea29 drm/xe/gt: Update handling of xe_force_wake_get return
    abf32d8fa1032 drm/xe: Wire up device shutdown handler
    0f8df5d6f25ac ublk: santizize the arguments from userspace when adding a device
    41017bd66c533 net: lan743x: fix potential out-of-bounds write in lan743x_ptp_io_event_clock_get()
    670179265ad78 eth: fbnic: avoid double free when failing to DMA-map FW msg
    31d50dfe9c602 tcp: fix passive TFO socket having invalid NAPI ID
    0d3d91c3500f0 tipc: fix null-ptr-deref when acquiring remote ip of ethernet bearer
    397c1faf8fde7 tcp: fix tcp_packet_delayed() for tcp_is_non_sack_preventing_reopen() behavior
    e996507f59610 atm: atmtcp: Free invalid length skb in atmtcp_c_send().
    517bc6836ee9f mpls: Use rcu_dereference_rtnl() in mpls_route_input_rcu().
    301268dbaac8e wifi: carl9170: do not ping device which has failed to load firmware
    61b39e189d5c9 ptp: allow reading of currently dialed frequency to succeed on free-running clocks
    11e25a2b5d36e ptp: fix breakage after ptp_vclock_in_use() rework
    1f755ba8abdc4 bnxt_en: Update MRU and RSS table of RSS contexts on queue reset
    672b9d85bdd2b bnxt_en: Add a helper function to configure MRU and RSS
    e1724f0769343 eth: bnxt: fix out-of-range access of vnic_info array
    6f2cd30949292 bnxt_en: Fix double invocation of bnxt_ulp_stop()/bnxt_ulp_start()
    ac462a75fd38e net: netmem: fix skb_ensure_writable with unreadable skbs
    3890da762a661 ksmbd: add free_transport ops in ksmbd connection
    8873080b88514 workqueue: Initialize wq_isolated_cpumask in workqueue_init_early()
    b268e43012ef3 e1000e: set fixed clock frequency indication for Nahum 11 and Nahum 13
    d6715193de439 ice: fix eswitch code memory leak in reset scenario
    cbea0cace663d net: ice: Perform accurate aRFS flow match
    6b358b3adfb9b io_uring/sqpoll: don't put task_struct on tctx setup failure
    fa2a79f0da926 aoe: clean device rq_list in aoedev_downdev()
    35d78d9eb58d5 pldmfw: Select CRC32 when PLDMFW is selected
    fddf0d0d6cc92 hwmon: (ltc4282) avoid repeated register write
    6869a79da2791 hwmon: (occ) fix unaligned accesses
    bf41b962bd0e2 hwmon: (occ) Rework attribute registration for stack usage
    fcc95344aa1c4 drm/i915/pmu: Fix build error with GCOV and AutoFDO enabled
    880902675299a drm/nouveau/bl: increase buffer size to avoid truncate warning
    114370b2717b0 ionic: Prevent driver/fw getting out of sync on devcmd(s)
    9216ca340bf6c drm/ssd130x: fix ssd132x_clear_screen() columns
    8a1f52651dd82 drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE
    0c76d70fc3fd5 drm/msm: Fix CP_RESET_CONTEXT_STATE bitfield names
    64fe4cd99515d drm/msm/dsi/dsi_phy_10nm: Fix missing initial VCO rate
    1bb894c1608cf drm/msm/disp: Correct porch timing for SDM845
    9411a9909e9da smb: fix secondary channel creation issue with kerberos by populating hostname when adding channels
    3c44ebad5aed3 ipv6: replace ipcm6_init calls with ipcm6_init_sk
    348e541fef1d4 ipv6: remove leftover ip6 cookie initializer
    c426f8c4ac47e x86/tools: Drop duplicate unlikely() definition in insn_decoder_test.c
    b8abcba6e4aec Kunit to check the longest symbol length
    c886784000934 drm/v3d: Avoid NULL pointer dereference in `v3d_job_update_stats()`
    353e75b55e583 sunrpc: handle SVC_GARBAGE during svc auth processing as auth error
    0174154fafaf2 nfsd: use threads array as-is in netlink interface
    50189d9c5eb5c erofs: remove unused trace event erofs_destroy_inode
    251629918451c bpf: Fix L4 csum update on IPv6 in CHECKSUM_COMPLETE
    dc5f0aef9ebdf net: Fix checksum update for ILA adj-transport
    60d8db49ef143 rust: compile libcore with edition 2024 for 1.87+
    1814e71a4e9c2 kbuild: rust: add rustc-min-version support function
    cef081c8231b5 drm/amdgpu: read back register after written for VCN v4.0.5
    9cf5b2a3b72c2 mm/hugetlb: unshare page tables during VMA split, not before
    5cfc95dc2f018 iio: accel: fxls8962af: Fix temperature calculation
    d488691a4a8c0 ALSA: hda/realtek: Add quirk for Asus GU605C
    b09323c6e8f2e ALSA: hda/realtek: Fix built-in mic on ASUS VivoBook X513EA
    9ef0b695a9d12 ALSA: hda/realtek: enable headset mic on Latitude 5420 Rugged
    96fe253552c26 ALSA: hda/realtek - Add mute LED support for HP Victus 16-s1xxx and HP Victus 15-fa1xxx
    cb078e238054c ALSA: hda/intel: Add Thinkpad E15 to PM deny list
    c4f7e90e66b6d ALSA: usb-audio: Rename ALSA kcontrol PCM and PCM1 for the KTMicro sound card
    47f34289d1006 arm64: Restrict pagetable teardown to avoid false warning
    60606efbf5258 wifi: cfg80211: init wiphy_work before allocating rfkill fails
    a69a594794fca wifi: ath12k: Clear affinity hint before calling ath12k_pci_free_irq() in error path
    f6ac7d68bbde9 Input: sparcspkr - avoid unannotated fall-through
    82b6dfff0d600 cpufreq/amd-pstate: Add missing NULL ptr check in amd_pstate_update
    44b25cc82574e wifi: rtw89: phy: add dummy C2H event handler for report of TAS power
    3d828519bd69b atm: Revert atm_account_tx() if copy_from_iter_full() fails.
    57ec0818698c7 sched_ext, sched/core: Don't call scx_group_set_weight() prematurely from sched_create_group()
    6e7a2d38816d1 platform/x86/intel-uncore-freq: Fail module load when plat_info is NULL
    870dd7e7840cd selinux: fix selinux_xfrm_alloc_user() to set correct ctx_len
    ff67d178c64de platform/x86: ideapad-laptop: use usleep_range() for EC polling
    1193486dffb74 ksmbd: fix null pointer dereference in destroy_previous_session
    2cb89aef981ef selftests/x86: Add a test to detect infinite SIGTRAP handler loop
    47bf9d03a969d x86/virt/tdx: Avoid indirect calls to TDX assembly functions
    5ec6148cb8378 udmabuf: use sgtable-based scatterlist wrappers
    510a29d776990 mm: close theoretical race where stale TLB entries could linger
    2a3ad42a57b43 net: clear the dst when changing skb protocol
    f9b97d466e602 net_sched: sch_sfq: reject invalid perturb period
    4220cc0b98c9d nvme: always punt polled uring_cmd end_io work to task_work
    c455ae2ce09ce scsi: s390: zfcp: Ensure synchronous unit_add
    dba20f641872f scsi: storvsc: Increase the timeouts to storvsc_timeout
    3a83a904bf9a2 smb: improve directory cache reuse for readdir operations
    2c34f1e095a12 cifs: do not disable interface polling on failure
    3b2bec886f554 cifs: serialize other channels when query server interfaces is pending
    b735c8dfbf5ce cifs: deal with the channel loading lag while picking channels
    d1b81776f337a jffs2: check jffs2_prealloc_raw_node_refs() result in few other places
    da12ef7e19048 jffs2: check that raw node were preallocated before writing summary
    985f086f281b7 LoongArch: Fix panic caused by NULL-PMD in huge_pte_offset()
    d46f8f1ede200 LoongArch: Avoid using $r0/$r1 as "mask" for csrxchg
    c7a6bd2019e73 LoongArch: vDSO: Correctly use asm parameters in syscall wrappers
    ec401f84e78e0 platform/loongarch: laptop: Add backlight power control support
    141523e6fd5e7 platform/loongarch: laptop: Unregister generic_sub_drivers on exit
    30cfeebdadd3c platform/loongarch: laptop: Get brightness setting from EC on probe
    1cce6ac47f4a2 drivers/rapidio/rio_cm.c: prevent possible heap overwrite
    1a4254ab06740 io_uring: fix task leak issue in io_wq_create()
    2e10dc9c2a87e io_uring/kbuf: don't truncate end buffer for multiple buffer peeks
    50452fe7caf0c powerpc/eeh: Fix missing PE bridge reconfiguration during VFIO EEH recovery
    7518ef0f79b57 powerpc/vdso: Fix build of VDSO32 with pcrel
    5807588a54abb platform/x86: dell_rbu: Stop overwriting data buffer
    4d71f2c1e5263 platform/x86: dell_rbu: Fix list usage
    78f8e25442825 platform/x86/amd: pmf: Prevent amd_pmf_tee_deinit() from running twice
    c4972e77236c0 platform/x86/amd: pmc: Clear metrics table at start of cycle
    7c41f73b64baa fs/xattr.c: fix simple_xattr_list()
    311389a799d1b Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first"
    7109ae53f971b tee: Prevent size calculation wraparound on 32-bit kernels
    69e888cbae9fc ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY
    d9ab5bad38136 bus: fsl-mc: increase MC_CMD_COMPLETION_TIMEOUT_MS value
    a1a63a270e438 watchdog: da9052_wdt: respect TWDMIN
    f28f1f578cd81 fbcon: Make sure modelist not set on unregistered console
    4930ac3bc0368 net/mlx5: HWS, Harden IP version definer checks
    4752355037ea7 wifi: ath12k: Pass correct values of center freq1 and center freq2 for 160 MHz
    11127b08210bc wifi: ath12k: fix incorrect CE addresses
    edbfb9752ede0 wifi: ath12k: fix link valid field initialization in the monitor Rx
    f9eee822b4205 wifi: ath11k: determine PM policy based on machine model
    21b5d9a2b63da octeontx2-pf: Add error log forcn10k_map_unmap_rq_policer()
    2bd434bb0eeb6 net: ethernet: cortina: Use TOE/TSO on all TCP
    b8b4b8bb346a8 bpf, sockmap: Fix data lost during EAGAIN retries
    a58f0a0e99139 f2fs: fix to set atomic write status more clear
    3d2fdb77cea5a usbnet: asix AX88772: leave the carrier control to phylink
    7a08a9d6f5575 ice: fix check for existing switch rule
    94bf4146af0f6 RDMA/hns: initialize db in update_srq_db()
    098983de3f692 ixgbe: Fix unreachable retry logic in combined and byte I2C write functions
    3502dd42f178d i40e: fix MMIO write access to an invalid page in i40e_clear_hw
    b7129ef57d967 sock: Correct error checking condition for (assign|release)_proto_idx()
    2f63bf0d2b146 scsi: lpfc: Use memcpy() for BIOS version
    41afa1abc1cd1 wifi: ath12k: fix failed to set mhi state error during reboot with hardware grouping
    d728dfafc10a9 pinctrl: mcp23s08: Reset all pins to input at probe
    7e73f517ca7ef isofs: fix Y2038 and Y2156 issues in Rock Ridge TF entry
    4b3383110b6df software node: Correct a OOB check in software_node_get_reference_args()
    d589b45b7ca62 net: ethernet: ti: am65-cpsw: handle -EPROBE_DEFER
    f66971c608c49 wifi: ath12k: using msdu end descriptor to check for rx multicast packets
    9f20f96511657 bnxt_en: Remove unused field "ref_count" in struct bnxt_ulp
    1baee1365c631 vxlan: Do not treat dst cache initialization errors as fatal
    78f768e36c065 net: bridge: mcast: re-implement br_multicast_{enable, disable}_port functions
    23d336e8a28b8 net: bridge: mcast: update multicast contex when vlan state is changed
    0388a85971245 wifi: iwlwifi: Add missing MODULE_FIRMWARE for Qu-c0-jf-b0
    2112fba7b7799 Revert "mac80211: Dynamically set CoDel parameters per station"
    e0e8f580d5ce9 wifi: mac80211: VLAN traffic in multicast path
    448dc45eeacd3 bpf: Use proper type to calculate bpf_raw_tp_null_args.mask index
    b562ceee43c0a net/mlx5: HWS, Fix IP version decision
    4e42f355c5105 netdevsim: Mark NAPI ID on skb in nsim_rcv
    606b577368a2b wifi: mac80211_hwsim: Prevent tsf from setting if beacon is disabled
    f92312f6dd070 wifi: rtw89: 8922a: fix TX fail with wrong VCO setting
    aa3e56caf6f22 wifi: iwlwifi: pcie: make sure to lock rxq->read
    91ef6a152768b iommu/amd: Ensure GA log notifier callbacks finish running before module unload
    57a85eb125656 scsi: smartpqi: Add new PCI IDs
    ab3f6cf370a38 scsi: lpfc: Fix lpfc_check_sli_ndlp() handling for GEN_REQUEST64 commands
    d003ff1f0a32e libbpf: Add identical pointer detection to btf_dedup_is_equiv()
    0ab3de047808f netfilter: nft_set_pipapo: clamp maximum map bucket size to INT_MAX
    f0023d7a2a869 f2fs: fix to bail out in get_new_segment()
    85d6986da04ef wifi: iwlwifi: mvm: fix beacon CCK flag
    ff38cf0bd888f hid-asus: check ROG Ally MCU version and warn
    6f84ec0a5ac7e clk: rockchip: rk3036: mark ddrphy as critical
    4c43d2c649269 wifi: mac80211: do not offer a mesh path if forwarding is disabled
    bc4abf1f2fb0e wireless: purelifi: plfxlc: fix memory leak in plfxlc_usb_wreq_asyn()
    07693edecfa13 net: vertexcom: mse102x: Return code for mse102x_rx_pkt_spi
    4d19bf267430a net: mlx4: add SOF_TIMESTAMPING_TX_SOFTWARE flag when getting ts info
    2cd2022c38fa2 pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get()
    ddead1832f0ac libbpf: Check bpf_map_skeleton link for NULL
    133f17922b3db pinctrl: armada-37xx: propagate error from armada_37xx_pmx_gpio_set_direction()
    b241b5fde0ef0 net: stmmac: generate software timestamp just before the doorbell
    8fdf2f79ebf06 bpf: Pass the same orig_call value to trampoline functions
    aefe45843ea66 pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get_direction()
    461d5a73ae45f pinctrl: armada-37xx: propagate error from armada_37xx_pmx_set_by_name()
    01ed9a06e5909 net: atlantic: generate software timestamp just before the doorbell
    8b0741b167c6e xfrm: validate assignment of maximal possible SEQ number
    5eb9c50e0c6d3 net: page_pool: Don't recycle into cache on PREEMPT_RT
    3a9e74d158a97 ipv4/route: Use this_cpu_inc() for stats on PREEMPT_RT
    dc5de5bd6deab x86/sgx: Prevent attempts to reclaim poisoned pages
    84c156a351459 tcp: add receive queue awareness in tcp_rcv_space_adjust()
    89b20c406ea1a tcp: fix initial tp->rcvq_space.space value for passive TS enabled flows
    f97085d365eae tcp: remove zero TCP TS samples for autotuning
    0a8446058c6e3 tcp: always seek for minimal rtt in tcp_rcv_rtt_update()
    72b03d8abcd23 wifi: rtw89: leave idle mode when setting WEP encryption for AP mode
    3cb5d934e074d iommu/amd: Allow matching ACPI HID devices without matching UIDs
    847f414bf9812 wifi: ath11k: Fix QMI memory reuse logic
    4585e37d0846e wifi: ath12k: fix a possible dead lock caused by ab->base_lock
    fd1bf3985d4a9 wifi: ath12k: fix macro definition HAL_RX_MSDU_PKT_LENGTH_GET
    7c6b9f6a53357 net: dlink: add synchronization for stats update
    a856d71fbb5f5 clk: qcom: gcc-x1e80100: Set FORCE MEM CORE for UFS clocks
    cb8484d1ba71c i2c: npcm: Add clock toggle recovery
    75a864f21ceeb i2c: tegra: check msg length in SMBUS block read
    77ff6aec7c319 cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs
    45251bcfe031d libbpf/btf: Fix string handling to support multi-split BTF
    ec7d08ad9a00e sctp: Do not wake readers in __sctp_write_space()
    cba1b82bdc992 wifi: mac80211: validate SCAN_FLAG_AP in scan request during MLO
    84feb629fc10b wifi: mt76: mt7925: introduce thermal protection
    7f622bb3b5bc8 wifi: mt76: mt7921: add 160 MHz AP for mt7922 device
    e7a18650568a4 wifi: mt76: mt76x2: Add support for LiteOn WN4516R,WN4519R
    b5e792c206d2a Bluetooth: btusb: Add new VID/PID 13d3/3630 for MT7925
    57cfe4a06d25f emulex/benet: correct command version selection in be_cmd_get_stats()
    d4b93f9c2f666 wifi: mt76: mt7996: drop fragments with multicast or broadcast RA
    4d56803464991 i2c: designware: Invoke runtime suspend on quick slave re-registration
    0cc5c7c14fbbf Bluetooth: btusb: Add new VID/PID 13d3/3584 for MT7922
    2d834477bbc1e bpf: Check rcu_read_lock_trace_held() in bpf_map_lookup_percpu_elem()
    b0e647442c08b f2fs: use vmalloc instead of kvmalloc in .init_{,de}compress_ctx
    6c1151d53ca73 tipc: use kfree_sensitive() for aead cleanup
    51318d644c993 net: lan743x: Modify the EEPROM and OTP size for PCI1xxxx devices
    2d15f5e448eff net: macb: Check return value of dma_set_mask_and_coherent()
    e8cd4a8d5b885 ACPI: battery: negate current when discharging
    05713a9fc20a0 power: supply: max17040: adjust thermal channel scaling
    1f152ae557d6d PM: runtime: fix denying of auto suspend in pm_suspend_timer_fn()
    c519f81e9c08a gpiolib: of: Add polarity quirk for s5m8767
    8975b40c07502 Make 'cc-option' work correctly for the -Wno-xyzzy pattern
    bf6a433b884fe ASoC: tegra210_ahub: Add check to of_device_get_match_data()
    f34e0c15561d8 platform-msi: Add msi_remove_device_irq_domain() in platform_device_msi_free_irqs_all()
    9281360d1c9a0 ACPICA: utilities: Fix overflow check in vsnprintf()
    33cd650d38e49 pmdomain: core: Reset genpd->states to avoid freeing invalid data
    02de16babe53c power: supply: bq27xxx: Retrieve again when busy
    bc51712997e70 ALSA: hda: cs35l41: Fix swapped l/r audio channels for Acer Helios laptops
    7efa7856f460a ACPICA: Apply pack(1) to union aml_resource
    198c2dab022e5 ACPICA: fix acpi parse and parseext cache leaks
    66613b13cde9d ACPI: Add missing prototype for non CONFIG_SUSPEND/CONFIG_X86 case
    b01a29a80cca2 ACPI: bus: Bail out if acpi_kobj registration fails
    7fe1b9381b03d ASoC: intel/sdw_utils: Assign initial value in asoc_sdw_rt_amp_spk_rtd_init()
    c0a6053f90425 ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
    c05aba32a9ad9 ACPICA: Avoid sequence overread in call to strncmp()
    ddec63e2dd496 mmc: Add quirk to disable DDR50 tuning
    0cd0ef0a0a98b power: supply: collie: Fix wakeup source leaks on device unbind
    7b45d2401d9b9 clocksource: Fix the CPUs' choice in the watchdog per CPU verification
    6cd75d8f0b5b2 ASoC: amd: yc: Add quirk for Lenovo Yoga Pro 7 14ASP9
    76d3716815588 ACPICA: fix acpi operand cache leak in dswstate.c
    0c81bcc14bd6a iio: adc: ad7606_spi: fix reg write value mask
    399e325f3f0fc iio: adc: ti-ads1298: Kconfig: add kfifo dependency to fix module build
    aaa25db0b8a35 iio: adc: ad7944: mask high bits on direct read
    ea66a9effa485 iio: imu: inv_icm42600: Fix temperature calculation
    034a52b5ef57c mm/hugetlb: fix huge_pmd_unshare() vs GUP-fast race
    acbe1597e358a dummycon: Trigger redraw when switching consoles with deferred takeover
    de72e0a13e0f2 accel/ivpu: Fix warning in ivpu_gem_bo_free()
    d2551a6178049 accel/ivpu: Use dma_resv_lock() instead of a custom mutex
    954b19010691f accel/ivpu: Use firmware names from upstream repo
    648f1d5446dde accel/ivpu: Improve buffer object logging
    2facd42665949 iio: accel: fxls8962af: Fix temperature scan element sign
    ae3c4187640c3 PCI: dw-rockchip: Fix PHY function call sequence in rockchip_pcie_phy_deinit()
    0835fbe0d1182 PCI: dw-rockchip: Remove PCIE_L0S_ENTRY check from rockchip_pcie_link_up()
    be0cf75cbd37f PCI: Fix lock symmetry in pci_slot_unlock()
    b20701d594d10 PCI: Add ACS quirk for Loongson PCIe
    68e58f5791214 PCI: dwc: ep: Correct PBA offset in .set_msix() callback
    523815857b1e7 PCI: cadence-ep: Correct PBA offset in .set_msix() callback
    bf1299797c3c4 uio_hv_generic: Align ring size to system page
    157b0827d7f04 uio_hv_generic: Use correct size for interrupt and monitor pages
    704cd2f207420 Drivers: hv: Allocate interrupt and monitor pages aligned to system page boundary
    a9e916fa5c7d0 smb: client: add NULL check in automount_fullpath
    dba032110b231 cifs: dns resolution is needed only for primary channel
    e2328267d00af cifs: update dstaddr whenever channel iface is updated
    180079e4da0a6 cifs: reset connections for all channels when reconnect requested
    30b031c0bd4fe remoteproc: k3-m4: Don't assert reset in detach routine
    f4ef928ca504c remoteproc: core: Release rproc->clean_table after rproc_attach() fails
    92776ca0ccfe7 remoteproc: core: Cleanup acquired resources when rproc_handle_resources() fails in rproc_attach()
    20462b6111a39 regulator: max14577: Add error check for max14577_read_reg()
    ec5f0b44125c0 ovl: Fix nested backing file paths
    6dbda47fe8bd6 mips: Add -std= flag specified in KBUILD_CFLAGS to vdso CFLAGS
    bf1605e2eaaa1 staging: iio: ad5933: Correct settling cycles encoding per datasheet
    4df6f2a167bbc pwm: axi-pwmgen: fix missing separate external clock
    5c70e3ad85d28 video: screen_info: Relocate framebuffers behind PCI bridges
    337bf0bbb0425 sysfb: Fix screen_info type check for VGA
    ce4ef0274cb66 KVM: s390: rename PROT_NONE to PROT_TYPE_DUMMY
    4da7fcc098218 net: ch9200: fix uninitialised access during mii_nway_restart
    5572d21a72bb0 phy: fsl-imx8mq-usb: fix phy_tx_vboost_level_from_property()
    f2986bccf250f dm: lock limits when reading them
    8e89c17dc8970 ftrace: Fix UAF when lookup kallsym after ftrace disabled
    d6bf5ad1a5e30 mtd: rawnand: qcom: Fix read len for onfi param page
    e3cf1ef5717e2 dm-verity: fix a memory leak if some arguments are specified multiple times
    e93624e6458df dm-mirror: fix a tiny race condition
    a9a76d58ba587 KVM: VMX: Flush shadow VMCS on emergency reboot
    264edbfc3ba16 KVM: SVM: Clear current_vmcb during vCPU free for all *possible* CPUs
    850931ba01c88 mtd: nand: sunxi: Add randomizer configuration before randomizer enable
    bb2c7c5e30a13 mtd: rawnand: sunxi: Add randomizer configuration in sunxi_nfc_hw_ecc_write_chunk
    462eee6d42485 firmware: arm_scmi: Ensure that the message-id supports fastchannel
    015f04ac884a4 configfs-tsm-report: Fix NULL dereference of tsm_ops
    a8ec526969cf2 soc: qcom: pmic_glink_altmode: fix spurious DP hotplug events
    02137179ffc92 mm: fix ratelimit_pages update error in dirty_ratio_handler()
    764c9f69beabe RDMA/iwcm: Fix use-after-free of work objects after cm_id destruction
    f16a797dce66e watchdog: fix watchdog may detect false positive of softlockup
    68c173ea138b6 ipc: fix to protect IPCS lookups using RCU
    9f019fcb73661 clk: meson-g12a: add missing fclk_div2 to spicc
    1aa41444c5105 parisc: fix building with gcc-15
    f20fd54af4e10 vgacon: Add check for vc_origin address range in vgacon_scroll()
    8d0645b59b19d parisc/unaligned: Fix hex output to show 8 hex chars
    b3071bb463ea1 fbdev: Fix fb_set_var to prevent null-ptr-deref in fb_videomode_to_var
    4904bd82673b5 EDAC/altera: Use correct write width with the INTTEST register
    3f2098f4fba77 fbdev: Fix do_register_framebuffer to prevent null-ptr-deref in fb_videomode_to_var
    fb5873b779dd5 iommu/vt-d: Restore context entry setup order for aliased devices
    81c64c2f84ab5 net: ftgmac100: select FIXED_PHY
    8a008c89e5e5c net/sched: fix use-after-free in taprio_dev_notifier
    55c3dbd838963 NFC: nci: uart: Set tty->disc_data only in success path
    83e2ba8971ccd hwmon: (ftsteutates) Fix TOCTOU race in fts_read()
    ee1b421c46987 f2fs: fix to do sanity check on sit_bitmap_size
    aaa644e7ffff0 f2fs: prevent kernel warning due to negative i_nlink from corrupted image
    fed611bd8c7b7 f2fs: fix to do sanity check on ino and xnid
    a0b1c91ada45b Input: gpio-keys - fix possible concurrent access in gpio_keys_irq_timer()
    5a8cd6ae8393e Input: ims-pcu - check record size in ims_pcu_flash_firmware()
    be5f3061a6f90 ext4: only dirty folios when data journaling regular files
    4b36399711c43 ext4: ensure i_size is smaller than maxbytes
    b841ca8c8fa93 ext4: factor out ext4_get_maxbytes()
    796632e6f8298 ext4: fix calculation of credits for extent tree modification
    5766da2237e53 ext4: inline: fix len overflow in ext4_prepare_inline_data
    63e50525b5ab3 bus: fsl-mc: fix GET/SET_TAILDROP command ids
    2de74c25e7522 bus: fsl-mc: do not add a device-link for the UAPI used DPMCP device
    4d0686b53cc93 ata: ahci: Disallow LPM for Asus B550-F motherboard
    cf4f7511f8385 ata: ahci: Disallow LPM for ASUSPRO-D840SA motherboard
    947f9304d3c87 ata: pata_via: Force PIO for ATAPI devices on VT6415/VT6330
    a0890b7805d24 bus: firewall: Fix missing static inline annotations for stubs
    1c71f3cf5f91b cgroup,freezer: fix incomplete freezing when attaching tasks
    5d555f17d18bd ceph: set superblock s_magic for IMA fsmagic matching
    75583606aeef3 ceph: avoid kernel BUG for encrypted inode with unaligned file size
    04e93f75b1e57 can: tcan4x5x: fix power regulator retrieval during probe
    d8a054b6e6824 can: kvaser_pciefd: refine error prone echo_skb_max handling logic
    896bbceebf99d bus: mhi: host: Fix conflict between power_up and SYSERR
    f704a80d9fa26 bus: mhi: ep: Update read pointer only after buffer is written
    943801c380059 block: Clear BIO_EMULATES_ZONE_APPEND flag on BIO completion
    5538af384318b block: use plug request list tail for one-shot backmerge attempt
    6e1276195f176 ASoC: codecs: wcd937x: Drop unused buck_supply
    c8228b5f3d74f ASoC: codecs: wcd9375: Fix double free of regulator supplies
    5626fefb46aef ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4
    1c40263443109 ARM: 9447/1: arm/memremap: fix arch_memremap_can_ram_remap()
    86d9837e46c09 arm64/mm: Close theoretical race where stale TLB entry remains valid
    aac91ae06c473 media: uvcvideo: Fix deferred probing error
    6d2b12e7c5216 media: uvcvideo: Send control events for partial succeeds
    b52dc88361299 media: uvcvideo: Return the number of processed controls
    0ee9469f818a0 media: imx-jpeg: Cleanup after an allocation error
    9df9d453651e7 media: imx-jpeg: Reset slot data pointers when freed
    c8332e6a0ba52 media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
    314893d15a898 media: imx-jpeg: Drop the first error frames
    00da1c767a656 media: vivid: Change the siize of the composing
    72541cae73d08 media: vidtv: Terminating the subsequent process of initialization failure
    5d8b057ed735c media: videobuf2: use sgtable-based scatterlist wrappers
    742c60333bef5 media: venus: Fix probe error handling
    2429bb9fad88c media: v4l2-dev: fix error handling in __video_register_device()
    63ea94aa72e4d media: omap3isp: use sgtable-based scatterlist wrappers
    f3033169d1474 media: mediatek: vcodec: Correct vsi_core framebuffer size
    831b460e923aa media: ipu6: Remove workaround for Meteor Lake ES2
    a2d4fdef06669 media: intel/ipu6: Fix dma mask for non-secure mode
    2a2bd7df402de media: imagination: fix a potential memory leak in e5010_probe()
    1f78790d988c9 media: i2c: imx335: Fix frame size enumeration
    5ae9ff1ee2be8 media: gspca: Add error handling for stv06xx_read_sensor()
    ca43a9386c0b5 media: davinci: vpif: Fix memory leak in probe error path
    9bff888c92f5c media: cxusb: no longer judge rbuf when the write fails
    c89339591b324 media: ccs-pll: Check for too high VT PLL multiplier in dual PLL case
    dc723f6c8d8d5 media: ccs-pll: Correct the upper limit of maximum op_pre_pll_clk_div
    e251f4fe65808 media: ccs-pll: Start OP pre-PLL multiplier search from correct value
    6216c67c90e24 media: ov2740: Move pm-runtime cleanup on probe-errors to proper place
    d0e6032ee06f0 media: ccs-pll: Start VT pre-PLL multiplier search from correct value
    eda32d4432357 media: i2c: ds90ub913: Fix returned fmt from .set_fmt()
    fb50ee19aa69f media: nxp: imx8-isi: better handle the m2m usage_count
    b93864e0865f2 media: imx335: Use correct register width for HNUM
    2f4c2c6bde6e6 media: ov5675: suppress probe deferral errors
    ceb901f795718 media: ov8856: suppress probe deferral errors
    ac93035040672 wifi: rtlwifi: disable ASPM for RTL8723BE with subsystem ID 11ad:1723
    b88447ce11eb5 wifi: rtw88: usb: Reduce control message timeout to 500 ms
    cb3cba0ec372f svcrdma: Unregister the device if svc_rdma_accept() fails
    f78b38af3540b jbd2: fix data-race and null-ptr-deref in jbd2_journal_dirty_metadata()
    d35e6c3616b6f wifi: ath12k: fix ring-buffer corruption
    5bf0b9eeb0174 fs/nfs/read: fix double-unlock bug in nfs_return_empty_folio()
    95c4322c2a7e9 NFSv4: Don't check for OPEN feature support in v4.1
    c08e00a416a8c SUNRPC: Prevent hang on NFS mount with xprtsec=[m]tls
    d622c2ee6c081 nfsd: Initialize ssc before laundromat_work to prevent NULL dereference
    7a75a956692aa nfsd: nfsd4_spo_must_allow() must check this is a v4 compound request
    07862d4f7c357 NFSD: Implement FATTR4_CLONE_BLKSIZE attribute
    2029ca75cdfa6 NFSD: fix race between nfsd registration and exports_proc
    3f3eb3c3420d4 NFSD: unregister filesystem in case genl_register_family() fails
    763d1789c03f8 wifi: ath11k: fix ring-buffer corruption
    09f7616cb5fe3 wifi: rtw88: usb: Upload the firmware in bigger chunks
    314053de3a917 wifi: ath11k: fix rx completion meta data corruption
    7a20cdb55c295 wifi: mt76: mt7925: fix host interrupt register initialization
    6d05390d20f11 wifi: p54: prevent buffer-overflow in p54_rx_eeprom_readback()
    c3afa81f2ef1c net/mlx5: Add error handling in mlx5_query_nic_vport_node_guid()
    5297c5cf2620e net/mlx5_core: Add error handling inmlx5_query_nic_vport_qkey_viol_cntr()
    b96ba2d1fb6c6 regulator: max20086: Change enable gpio to optional
    028bb7b658114 regulator: max20086: Fix MAX200086 chip id
    f2e8a863fdc93 s390/pci: Serialize device addition and removal
    31a7dc5a24c06 s390/pci: Allow re-add of a reserved but not yet removed device
    f86ca2b55309f s390/pci: Prevent self deletion in disable_slot()
    94c0731dbf3e8 s390/pci: Remove redundant bus removal and disable from zpci_release_device()
    0b42b68cec822 powerpc/pseries/msi: Avoid reading PCI device registers in reduced power states
    c58b577cf7576 io_uring/kbuf: account ring io_buffer_list memory
    ba789be63d956 io_uring: account drain memory to cgroup
    082b0ca9a79d7 ASoC: amd: sof_amd_sdw: Fix unlikely uninitialized variable use in create_sdw_dailinks()
    2864c19ae9e62 ASoC: meson: meson-card-utils: use of_property_present() for DT parsing
    98640457c02c5 ASoC: qcom: sdm845: Add error handling in sdm845_slim_snd_hw_params()
    d765505bca3cf crypto: qat - add shutdown handler to qat_dh895xcc
    eb94a34c276dd crypto: qat - add shutdown handler to qat_c62x
    59fd1b29092ce crypto: qat - add shutdown handler to qat_4xxx
    5e4e6d0cae11f crypto: qat - add shutdown handler to qat_420xx
    261f2a655b709 crypto: qat - add shutdown handler to qat_c3xxx
    f2cc87bf3e3a6 gfs2: move msleep to sleepable context
    ea3c81acb041a crypto: marvell/cesa - Do not chain submitted requests
    bdb71ee651318 configfs: Do not override creating attribute file failure in populate_attrs()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 48277f45cfd497ebceeb1bfffdefce094fac13c2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 5623807c2f..baa13c866e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "83770b9370dec1870d4d4ed2501e28f5be2b6d0c"
-SRCREV_meta ?= "f1c5cbeca3d98713c869113dd8b0c31aada2f5a5"
+SRCREV_machine ?= "6f409db4f0082642197240f39b8a58850c8eb884"
+SRCREV_meta ?= "f8cd1607519efd135e4037c84b6e42684b12c5a8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.34"
+LINUX_VERSION ?= "6.12.36"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 82788e8e42..ec2136f035 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.34"
+LINUX_VERSION ?= "6.12.36"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ad3170041071652d21ac5288f76b4692f458adc8"
-SRCREV_meta ?= "f1c5cbeca3d98713c869113dd8b0c31aada2f5a5"
+SRCREV_machine ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
+SRCREV_meta ?= "f8cd1607519efd135e4037c84b6e42684b12c5a8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 05eb585637..cc564b13c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "fdfa4799f741ad68067f8595762ca24a28b4e67e"
-SRCREV_machine:qemuarm64 ?= "ad3170041071652d21ac5288f76b4692f458adc8"
-SRCREV_machine:qemuloongarch64 ?= "ad3170041071652d21ac5288f76b4692f458adc8"
-SRCREV_machine:qemumips ?= "7c3d2bbb9ce39a46bbbdf1f20711fcd111b755c5"
-SRCREV_machine:qemuppc ?= "ad3170041071652d21ac5288f76b4692f458adc8"
-SRCREV_machine:qemuriscv64 ?= "ad3170041071652d21ac5288f76b4692f458adc8"
-SRCREV_machine:qemuriscv32 ?= "ad3170041071652d21ac5288f76b4692f458adc8"
-SRCREV_machine:qemux86 ?= "ad3170041071652d21ac5288f76b4692f458adc8"
-SRCREV_machine:qemux86-64 ?= "ad3170041071652d21ac5288f76b4692f458adc8"
-SRCREV_machine:qemumips64 ?= "6453d66effdb1695ecb852bfb2f20d8a0edc88cb"
-SRCREV_machine ?= "ad3170041071652d21ac5288f76b4692f458adc8"
-SRCREV_meta ?= "f1c5cbeca3d98713c869113dd8b0c31aada2f5a5"
+SRCREV_machine:qemuarm ?= "511b6848cd392ee9bbc841794a5e905f4db31689"
+SRCREV_machine:qemuarm64 ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
+SRCREV_machine:qemuloongarch64 ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
+SRCREV_machine:qemumips ?= "afbfb2216d4f16a231b834922a937641864c8931"
+SRCREV_machine:qemuppc ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
+SRCREV_machine:qemuriscv64 ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
+SRCREV_machine:qemuriscv32 ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
+SRCREV_machine:qemux86 ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
+SRCREV_machine:qemux86-64 ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
+SRCREV_machine:qemumips64 ?= "707ad7179119ed07e5911b61b08b7b11d2c9a352"
+SRCREV_machine ?= "5633e9a98a153afa6b2051b116faef6c5e855bd8"
+SRCREV_meta ?= "f8cd1607519efd135e4037c84b6e42684b12c5a8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "23fdf46589db718d538fa3e65ab0d57362d50b4a"
+SRCREV_machine:class-devupstream ?= "df64e51d4ab83244b6a4eb11eb41f89403611e24"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.34"
+LINUX_VERSION ?= "6.12.36"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


