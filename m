Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04198C02186
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:47:39 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.28633.1736801255125492375
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:47:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zFeKD5Wh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2161eb94cceso57737985ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736801254; x=1737406054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIXwbxKohzz2PySRjHfRsuC2Id95pMZmOMbajlrLbKs=;
        b=zFeKD5WhjF2eWOiocipY4nQE4XNV18pBpf+1YiL6kzkGUiwAN+4J6FwQlW1txu2RkG
         k6rUSFu2rresPUOka/vrWoGUbZTBaY5E7xqGBCNtSTEUdW1lzoE5zU6LxhpdsjXRthO7
         lFHaq20vwao4uxA0gWH+2AZylmp9PtkpnushNw2u6XqA/VSRVYV61Hi65zBTtIY+keZQ
         V+6g6IH5Y2CTsdo+nrN3wTAJkL0oxvcBTA32zCawoptiWzF/ayovN2CvLab5hezgqb7m
         ruAbPgjAc6nqQ0F/5pEbXMFOX5PCwClhqgCpNGWy2SDox23oFbTohOwDzRg+h5iLO4dc
         rIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801254; x=1737406054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SIXwbxKohzz2PySRjHfRsuC2Id95pMZmOMbajlrLbKs=;
        b=k0V8f16P8EV7Oihl7FMJJzcyaQ0r3jSdmRytIaa9vWGCqUk9ha5le9VC5TnUQDmhDk
         bf5AshQWK4N+xMEH3UwumzYF3W9qqWqbfhL+Z1JzMrnVqemtOHwzxtbhPJBU/YJTqeZ8
         v0ImUmvdmmCS3EKqaOe013AijIPXZZtNWyXZKtGdGaUVktslor+TXucr761aLNhhOgMO
         hyekSTUpMgCUnJcYhLuPUoiMnD2+D0Ujf7YMO7umfisF8UKbXlNGOHlL97x6XRZfnkFj
         S+DdxvAq4BVZtOh4I5mrFY7BZStbmxTPg7KqEhHF2rmzJfLQsaTkNAmzKCgB0gl0c942
         Nn7A==
X-Gm-Message-State: AOJu0YwNf+6nAtJ434aZqQQgKJwa5oCG+zHgFWAIS3otWtajO+Z+VvHL
	z2VU1B+1xRo/iLV7JpCZBdBGcfAauRPLUnwhBOog/4MmeQOBZN5gFxgLKO4wU9OmQmRlO9oOPmM
	+TIU=
X-Gm-Gg: ASbGnctYYqtNZlZsdHJbzSQ7lIbUas5Y9ouVQeZsftvo0Z542j8+5cbZ1ClH4MqOYug
	63FD6Oz/O1b+vk54duYmGeuU/WRxq7J3DEjextV0ywNXZvM4T61Kkbs1LMGlp7CrrPIyx53Rf9Q
	pZj3IWOAZWxTvf5pNTk0l4YWe+xxFUnhHAHllX93Fkul/t6MLvOX15DooE9adp6jEs6Jtub9Gyr
	ExwL0Hx+2VKiHLLMgAehn7DCFF4/iqtkpnFhbPjDomoJA==
X-Google-Smtp-Source: AGHT+IGgceHRyf3QsScSp5fcE0vgpiZ7XuWmGS0169Q252fEMQKkl2xCY1CxviNLQW97cKKV0BbyMA==
X-Received: by 2002:a05:6a21:6f87:b0:1e1:ac71:2b6a with SMTP id adf61e73a8af0-1e88d0afd73mr36639015637.28.1736801253492;
        Mon, 13 Jan 2025 12:47:33 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm6449435b3a.12.2025.01.13.12.47.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:47:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/15] linux-yocto/6.6: update to v6.6.64
Date: Mon, 13 Jan 2025 12:47:02 -0800
Message-ID: <dc44be98107d4a5fa74225ff2fdf9dabd067c22b.1736801113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736801113.git.steve@sakoman.com>
References: <cover.1736801113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209754

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    22a054ea1f08 Linux 6.6.64
    f3b82bb26f5b posix-timers: Target group sigqueue to current task only if not exiting
    8a799149ab45 drm/amd/pm: update current_socclk and current_uclk in gpu_metrics on smu v13.0.7
    3990ef742c06 drm/amdgpu: fix usage slab after free
    70e6599a9e78 drm/amdkfd: Use the correct wptr size
    d50b5a7ac7f5 drm: xlnx: zynqmp_dpsub: fix hotplug detection
    65bea1cb0230 drm/etnaviv: flush shader L1 cache after user commandstream
    a3d970f106bb drm/mediatek: Fix child node refcount handling in early exit
    8ab73ac97c0f drm/sti: avoid potential dereference of error pointers
    997b64c3f4c1 drm/sti: avoid potential dereference of error pointers in sti_gdp_atomic_check
    82a5312f874f drm/sti: avoid potential dereference of error pointers in sti_hqvdp_atomic_check
    ac48ddf6b023 udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap
    cfaf83501a0c tpm: Lock TPM chip in tpm_pm_suspend() first
    135b4819f6fb btrfs: don't BUG_ON on ENOMEM from btrfs_lookup_extent_info() in walk_down_proc()
    c062bba16246 powerpc: Adjust adding stack protector flags to KBUILD_CLAGS for clang
    0760e47fa632 powerpc: Fix stack protector Kconfig test for clang
    1bdff8a19cd6 iio: gts: fix infinite loop for gain_to_scaletables()
    e5cac3272199 iio: adc: ad7923: Fix buffer overflow for tx_buf and ring_xfer
    98e1f03de842 iio: Fix fwnode_handle in __fwnode_iio_channel_get_by_name()
    8e5e63d6ca95 iio: accel: kx022a: Fix raw read format
    37dfc81266d3 nfsd: fix nfs4_openowner leak when concurrent nfsd4_open occur
    1cecfdbc6bfc nfsd: make sure exp active before svc_export_show
    2eb355346c5a PCI: rockchip-ep: Fix address translation unit programming
    8b404b08be92 PCI: of_property: Assign PCI instead of CPU bus address to dynamic PCI nodes
    6f433923d3b6 dm thin: Add missing destroy_work_on_stack()
    fad9d2a96600 dm: Fix typo in error message
    c5f4540ae66e ovl: properly handle large files in ovl_security_fileattr
    4a44bcb73a0b leds: flash: mt6360: Fix device_for_each_child_node() refcounting in error paths
    5294e8abd46c thermal: int3400: Fix reading of current_uuid for active policy
    6868deee4a6b fs/proc/kcore.c: Clear ret value in read_kcore_iter after successful iov_iter_zero
    b50b631d8fce PCI: endpoint: Clear secondary (not primary) EPC in pci_epc_remove_epf()
    2bf49d724c9e PCI: keystone: Add link up check to ks_pcie_other_map_bus()
    344134ac9190 PCI: keystone: Set mode as Root Complex for "ti,keystone-pcie" compatible
    ce30d11b39e8 i3c: master: Fix miss free init_dyn_addr at i3c_master_put_i3c_addrs()
    0a0dc4834f66 i3c: master: svc: Fix pm_runtime_set_suspended() with runtime pm enabled
    cdcc26d714c9 scsi: ufs: exynos: Fix hibern8 notify callbacks
    6caff31c3d18 util_macros.h: fix/rework find_closest() macros
    308e0cc36dc4 ceph: extract entity name from device id
    33a213c04faf mm/slub: Avoid list corruption when removing a slab from the full list
    2c932d5c7aac ARM: 9431/1: mm: Pair atomic_set_release() with _read_acquire()
    ef21187c0672 ARM: 9430/1: entry: Do a dummy read from VMAP shadow
    1af22528fee8 s390/entry: Mark IRQ entries to fix stack depot warnings
    1359fd9eae29 ARM: 9429/1: ioremap: Sync PGDs for VMALLOC shadow
    7e3a8ea3d1ad ad7780: fix division by zero in ad7780_write_raw()
    8bca39b958f1 clk: qcom: gcc-qcs404: fix initial rate of GPLL3
    6aa39a78128a leds: lp55xx: Remove redundant test for invalid channel number
    3723d1c056d0 iommu/io-pgtable-arm: Fix stage-2 map/unmap for concatenated tables
    9a8b989d8958 zram: clear IDLE flag after recompression
    f8cca70b0e57 vmstat: call fold_vm_zone_numa_events() before show per zone NUMA event
    8a92dc4df89c ftrace: Fix regression with module command in stack_trace_filter
    6e290ee989dd maple_tree: refine mas_store_root() on storing NULL
    065bf5dd2163 ovl: Filter invalid inodes with missing lookup function
    b11813bc2f4e media: uvcvideo: Require entities to have a non-zero unique ID
    f83f6a6e1263 media: uvcvideo: Stop stream during unregister
    6712a28a4f92 media: platform: allegro-dvt: Fix possible memory leak in allocate_buffers_internal()
    2dbb2307e19d media: gspca: ov534-ov772x: Fix off-by-one error in set_frame_rate()
    047178d650bc media: venus: Fix pm_runtime_set_suspended() with runtime pm enabled
    3806bec2d470 media: amphion: Fix pm_runtime_set_suspended() with runtime pm enabled
    d173aee5709b efi/libstub: Free correct pointer on failure
    5262cbf40264 media: platform: exynos4-is: Fix an OF node reference leak in fimc_md_is_isp_available
    a2ed3b780f34 media: ts2020: fix null-ptr-deref in ts2020_probe()
    9ca2c2ad6ffa media: verisilicon: av1: Fix reference video buffer pointer assignment
    b7a830bbc25d media: imx-jpeg: Ensure power suppliers be suspended before detach them
    b59ab89bc83f media: i2c: tc358743: Fix crash in the probe error path when using polling
    76ef98f9131e arm64: dts: freescale: imx8mp-verdin: Fix SD regulator startup delay
    55aebcbcfc0a media: i2c: dw9768: Fix pm_runtime_set_suspended() with runtime pm enabled
    0ba08c21c6a9 media: mtk-jpeg: Fix null-ptr-deref during unload module
    68efeff2f7fc media: imx-jpeg: Set video drvdata before register video device
    988cc10ddbde media: amphion: Set video drvdata before register video device
    71a15258f3c9 arm64: dts: ti: k3-am62-verdin: Fix SD regulator startup delay
    7477b16f8031 arm64: dts: freescale: imx8mm-verdin: Fix SD regulator startup delay
    14635785805f arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer
    7897f1f8b785 md/md-bitmap: Add missing destroy_work_on_stack()
    4275ac274194 btrfs: ref-verify: fix use-after-free after invalid ref action
    757171d1369b btrfs: add a sanity check for btrfs root in btrfs_search_slot()
    99f3cd5a866d btrfs: don't loop for nowait writes when checking for cross references
    bcacb52a985f quota: flush quota_release_work upon quota writeback
    a2110964d536 xfs: remove unknown compat feature check in superblock write validation
    b8b84dcdf3ab sh: intc: Fix use-after-free bug in register_intc_controller()
    906cdbdd3b01 block, bfq: fix bfqq uaf in bfq_limit_depth()
    0ca87e506375 sunrpc: fix one UAF issue caused by sunrpc kernel tcp socket
    931be6b73830 SUNRPC: timeout and cancel TLS handshake with -ETIMEDOUT
    3811172e8c98 sunrpc: clear XPRT_SOCK_UPD_TIMEOUT when reset transport
    065902117a5b nfs: ignore SB_RDONLY when mounting nfs
    5fab8abc2c27 cifs: unlock on error in smb3_reconfigure()
    880a661e6764 cifs: during remount, make sure passwords are in sync
    fe44c5477284 modpost: remove incorrect code in do_eisa_entry()
    625e2357c8fc smb: Initialize cfid->tcon before performing network ops
    0dd7a8b948fd Rename .data.once to .data..once to fix resetting WARN*_ONCE
    eda52d5ae82d Rename .data.unlikely to .data..unlikely
    ab8c357dbf87 init/modpost: conditionally check section mismatch to __meminit*
    52197a7c14df modpost: squash ALL_{INIT,EXIT}_TEXT_SECTIONS to ALL_TEXT_SECTIONS
    17f4332ae695 modpost: use ALL_INIT_SECTIONS for the section check from DATA_SECTIONS
    db081efa9b80 modpost: disallow the combination of EXPORT_SYMBOL and __meminit*
    a169a023e064 modpost: remove EXIT_SECTIONS macro
    2462732f35f1 modpost: remove MEM_INIT_SECTIONS macro
    95da0b40fa8c modpost: disallow *driver to reference .meminit* sections
    db5647420fb2 modpost: remove ALL_EXIT_DATA_SECTIONS macro
    4151b8e1fca8 rtc: ab-eoz9: don't fail temperature reads on undervoltage notification
    24891e0ebca5 cifs: Fix parsing reparse point with native symlink in SMB1 non-UNICODE session
    430afd3edabf cifs: Fix parsing native symlinks relative to the export
    e061482601b4 smb: client: disable directory caching when dir_cache_timeout is zero
    03a0e2520350 perf/arm-cmn: Ensure port and device id bits are set properly
    9890e6f2ec92 perf/arm-smmuv3: Fix lockdep assert in ->event_init()
    2bb3ee1bf237 9p/xen: fix release of IRQ
    e978643c4c9c 9p/xen: fix init sequence
    5da567d3f737 block: return unsigned int from bdev_io_min
    1e20e4ff3a75 nvme/multipath: Fix RCU list traversal to use SRCU primitive
    f0679539fad9 nvme-multipath: avoid hang on inaccessible namespaces
    85b9f3e63e79 nvme-multipath: implement "queue-depth" iopolicy
    a7071e2bd0fc nvme-multipath: prepare for "queue-depth" iopolicy
    18db8ae7abb5 rtc: rzn1: fix BCD to rtc_time conversion errors
    011c3320e1fc jffs2: fix use of uninitialized variable
    01d3a2293d7e ubifs: authentication: Fix use-after-free in ubifs_tnc_end_commit
    612824dd0c94 ubi: fastmap: Fix duplicate slab cache names while attaching
    074b310f0591 ubifs: Correct the total block count by deducting journal reservation
    7e66d36871d1 ubi: fastmap: wl: Schedule fm_work if wear-leveling pool is empty
    dd4b1cbcc916 rtc: check if __rtc_read_time was successful in rtc_timer_do_work()
    a990130f6770 rtc: abx80x: Fix WDT bit position of the status register
    96fd3dfb1d14 rtc: st-lpc: Use IRQF_NO_AUTOEN flag in request_irq()
    229a30ed42bb NFSv4.0: Fix a use-after-free problem in the asynchronous open()
    e7b5a40b9b38 um: Always dump trace for specified task in show_stack
    d3ca120303a7 um: Fix the return value of elf_core_copy_task_fpregs
    a875c023155e um: Fix potential integer overflow during physmem setup
    acfaf37888e0 SUNRPC: make sure cache entry active before cache_show
    dde654cad08f NFSD: Prevent a potential integer overflow
    10209665b5bf ipc: fix memleak if msg_init_ns failed in create_ipc_ns
    27d6e7eff07f f2fs: fix to do sanity check on node blkaddr in truncate_node()
    f7f33bb2dbaf lib: string_helpers: silence snprintf() output truncation warning
    9e68fcffc764 ublk: fix error code for unsupported command
    1534f6f69393 usb: dwc3: gadget: Fix looping of queued SG entries
    bb6bf24fe03b usb: dwc3: gadget: Fix checking for number of TRBs left
    5906ee369367 usb: musb: Fix hardware lockup on first Rx endpoint request
    73934e535cff smb: During unmount, ensure all cached dir instances drop their dentry
    791f83305357 smb: prevent use-after-free due to open_cached_dir error paths
    31fabf70d583 smb: Don't leak cfid when reconnect races with open_cached_dir
    921d90907eb9 smb: client: handle max length for SMB symlinks
    83cb4fb72d64 smb3: request handle caching when caching directories
    edf5b298eb36 ALSA: hda/realtek: Apply quirk for Medion E15433
    0e37c70bff7c ALSA: hda/realtek: Fix Internal Speaker and Mic boost of Infinix Y4 Max
    76e3de272587 ALSA: hda/realtek: Set PCBeep to default value for ALC274
    c917f415c18a ALSA: hda/realtek: Update ALC225 depop procedure
    bc200027ee92 ALSA: pcm: Add sanity NULL check for the default mmap fault handler
    0357abf951c4 ALSA: ump: Fix evaluation of MIDI 1.0 FB info
    e9bf513718d0 media: v4l2-core: v4l2-dv-timings: check cvt/gtf result
    305c75f402e8 soc: fsl: rcpm: fix missing of_node_put() in copy_ippdexpcr1_setting()
    378ce4e08ca2 media: wl128x: Fix atomicity violation in fmc_send_cmd()
    c68dab166532 HID: wacom: Interpret tilt data from Intuos Pro BT as signed values
    68a69ed52a8b blk-mq: Make blk_mq_quiesce_tagset() hold the tag list mutex less long
    e95080fba190 block: fix ordering between checking BLK_MQ_S_STOPPED request adding
    679b1874eba7 block: fix ordering between checking QUEUE_FLAG_QUIESCED request adding
    fe0d9800ead6 block: fix missing dispatching request when queue is started or unquiesced
    ad654c5bfe3e arm64: tls: Fix context-switching of tpidrro_el0 when kpti is enabled
    80f25003af22 ublk: fix ublk_ch_mmap() for 64K page size
    1681131bfa23 iio: gts: Fix uninitialized symbol 'ret'
    09faf32c682e sh: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    8204dd589c4f um: vector: Do not use drvdata in release
    ad253966ee98 serial: 8250: omap: Move pm_runtime_get_sync
    63ff22d706bb serial: 8250_fintek: Add support for F81216E
    11af46904019 dt-bindings: serial: rs485: Fix rs485-rts-delay property
    cdbd5a1dcdc2 um: net: Do not use drvdata in release
    2d194d951895 um: ubd: Do not use drvdata in release
    5e1feafa7347 ubi: wl: Put source PEB into correct list if trying locking LEB failed
    de70a7e1f3d6 platform/chrome: cros_ec_typec: fix missing fwnode reference decrement
    46f8e2592681 smb: client: fix NULL ptr deref in crypto_aead_setkey()
    a96f9eb7add3 ksmbd: fix use-after-free in SMB request handling
    9665bbefab87 parisc/ftrace: Fix function graph tracing disablement
    185f065f458b cifs: support mounting with alternate password to allow password rotation
    4ca70a0630b0 cpufreq: mediatek-hw: Fix wrong return value in mtk_cpufreq_get_cpu_power()
    13dc02cae4e3 mtd: spi-nor: core: replace dummy buswidth from addr to data
    66f0fbc8ba18 spi: Fix acpi deferred irq probe
    856023ef032d netfilter: ipset: add missing range check in bitmap_ip_uadt
    5691e457251b gpio: exar: set value when external pull-up or pull-down is present
    d2543d75f81d Revert "serial: sh-sci: Clean sci_ports[0] after at earlycon exit"
    671bf7530c08 serial: sh-sci: Clean sci_ports[0] after at earlycon exit
    32ffdd003f6f Revert "usb: gadget: composite: fix OS descriptors w_value logic"
    69c83ff5299c wifi: brcmfmac: release 'root' node in all execution paths
    81da9c085454 wifi: ath12k: fix crash when unbinding
    8f3551f67991 wifi: rtlwifi: Drastically reduce the attempts to read efuse in case of failures
    223b546c6222 wifi: ath12k: fix warning when unbinding
    ebefd0c746a2 ARM: dts: omap36xx: declare 1GHz OPP as turbo again
    ae0ef0d756d2 usb: xhci: Fix TD invalidation under pending Set TR Dequeue
    5540869a3f75 Compiler Attributes: disable __counted_by for clang < 19.1.3
    19714c9e8885 Bluetooth: Fix type of len in rfcomm_sock_getsockopt{,_old}()
    0d53178a3d8b exfat: fix uninit-value in __exfat_get_dentry_set
    7451f7297e74 dt-bindings: iio: dac: ad3552r: fix maximum spi speed
    6a4645bc3b14 pinctrl: qcom: spmi: fix debugfs drive strength
    ee68555b979e tools/nolibc: s390: include std.h
    85cfe884668d locking/lockdep: Avoid creating new name string literals in lockdep_set_subclass()
    958275235d40 tty: ldsic: fix tty_ldisc_autoload sysctl's proc_handler
    2a9b68f2dc68 apparmor: test: Fix memory leak for aa_unpack_strdup()
    9b07fb464eb6 comedi: Flush partial mappings in error case
    1b8868b818ec fsnotify: fix sending inotify event with unexpected filename
    e5d5c04aac71 PCI: Fix use-after-free of slot->bus on hot remove
    7484289822c5 KVM: arm64: vgic-its: Clear DTE when MAPD unmaps a device
    2a4ec241dbe7 KVM: arm64: vgic-its: Add a data length check in vgic_its_save_*
    dd2f9861f275 KVM: arm64: Get rid of userspace_irqchip_in_use
    718f1712e155 KVM: arm64: vgic-its: Clear ITE when DISCARD frees an ITE
    130abaa1da82 KVM: arm64: Ignore PMCNTENSET_EL0 while checking for overflow status
    26cd7f91f27f KVM: arm64: vgic-v3: Sanitise guest writes to GICR_INVLPIR
    10c95568e7ac powerpc/pseries: Fix KVM guest detection for disabling hardlockup detector
    d79f765b2eb8 KVM: x86/mmu: Skip the "try unsync" path iff the old SPTE was a leaf SPTE
    046fb04cbce9 crypto: x86/aegis128 - access 32-bit arguments as 32-bit
    e68ca7dafecb perf/x86/intel/pt: Fix buffer full but size is 0 case
    a7fc8dce17e6 ASoC: codecs: Fix atomicity violation in snd_soc_component_get_drvdata()
    30a2d503367b ASoC: amd: yc: Add a quirk for microfone on Lenovo ThinkPad P14s Gen 5 21MES00B00
    9353cdf28d4c jfs: xattr: check invalid xattr size more strictly
    2bd7c6086641 ext4: fix FS_IOC_GETFSMAP handling
    786a552739bb ext4: supress data-race warnings in ext4_free_inodes_{count,set}()
    095694f58fe2 soc: qcom: socinfo: fix revision check in qcom_socinfo_probe()
    bdae089f4b95 ASoC: Intel: sst: Fix used of uninitialized ctx to log an error
    acf693decaa3 arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled
    387a4dc33bb7 Revert "arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0 on xhci1 as disabled"
    b8f8b81dabe5 ALSA: usb-audio: Fix potential out-of-bound accesses for Extigy and Mbox devices
    22d907bcd283 btrfs: do not BUG_ON() when freeing tree block after error
    b98777309756 f2fs: fix null reference error when checking end of zone
    475d99e611d5 perf/x86/intel: Hide Topdown metrics events if the feature is not enumerated
    e4f3bb7d53b9 dm-bufio: fix warnings about duplicate slab caches
    cd1e565a5b7f drm/amd/display: Add NULL pointer check for kzalloc
    d247af7c5dbf drm/amd/display: Check phantom_stream before it is used
    8c854138b593 drm/amd/display: Add NULL check for function pointer in dcn20_set_output_transfer_func
    ebef6616219f drm/amd/display: Check null pointer before try to access it
    ec1be3c527b4 drm/amd/display: Add NULL check for clk_mgr in dcn32_init_hw
    205e3b96cc9a drm/amd/display: Add NULL check for clk_mgr and clk_mgr->funcs in dcn30_init_hw
    f14fc623dd23 dm-cache: fix warnings about duplicate slab caches
    ecb4aaa658da closures: Change BUG_ON() to WARN_ON()
    3347581bf9ed usb: ehci-spear: fix call balance of sehci clk handling routines
    74cb86e1006c ALSA: usb-audio: Fix out of bounds reads when finding clock sources
    804b96f8d0a0 xen: Fix the issue of resource not being properly released in xenbus_dev_probe()
    7cd9f0a33e73 xfs: add bounds checking to xlog_recover_process_data
    6b42ded89ba8 nvme: fix metadata handling in nvme-passthrough
    232a138bd843 scsi: lpfc: Validate hdwq pointers before dereferencing in reset/errata paths
    d00df6700ad1 mailbox: mtk-cmdq: Move devm_mbox_controller_register() after devm_pm_runtime_enable()
    a90cb059969b f2fs: fix fiemap failure issue when page size is 16KB
    d7f0c4c95652 gfs2: Remove and replace gfs2_glock_queue_work
    6e92dd3ac246 gfs2: Don't set GLF_LOCK in gfs2_dispose_glock_lru
    22185892fc22 ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD entry
    2c9a5607ecba apparmor: fix 'Do simple duplicate message elimination'
    020002c76147 drm/amd/display: Fix null check for pipe_ctx->plane_state in hwss_setup_dpp
    756f30dc27ae drm/radeon: Fix spurious unplug event on radeon HDMI
    5e3a0f772d97 drm/radeon: change rdev->ddev to rdev_to_drm(rdev)
    28f6a86a2f66 drm/radeon: add helper rdev_to_drm(rdev)
    95070c084e20 ALSA: hda/realtek: Update ALC256 depop procedure
    789a72498d32 firmware_loader: Fix possible resource leak in fw_log_firmware_info()
    4a92e1030242 counter: ti-ecap-capture: Add check for clk_enable()
    5f7d46164af2 counter: stm32-timer-cnt: Add check for clk_enable()
    ed4c8fc2e71d misc: apds990x: Fix missing pm_runtime_disable()
    ce833757ba75 USB: chaoskey: Fix possible deadlock chaoskey_list_lock
    acfc4350dc2a USB: chaoskey: fail open after removal
    67970b0cc76b usb: yurex: make waiting on yurex_write interruptible
    7051f66d8158 usb: using mutex lock and supporting O_NONBLOCK flag in iowarrior_read()
    8353a251accf iio: light: al3010: Fix an error handling path in al3010_probe()
    8e0e47f038bc ipmr: fix tables suspicious RCU usage
    bba7909b511b ip6mr: fix tables suspicious RCU usage
    65ed89cad1f5 tcp: Fix use-after-free of nreq in reqsk_timer_handler().
    265f1f22fddd rxrpc: Improve setsockopt() handling of malformed user input
    9a62ca28d3f8 llc: Improve setsockopt() handling of malformed user input
    5703fb1d85f6 Bluetooth: MGMT: Fix possible deadlocks
    95f7a972194a Bluetooth: MGMT: Fix slab-use-after-free Read in set_powered_sync
    65e3a909bdab bnxt_en: Unregister PTP during PCI shutdown and suspend
    85c37802d94f bnxt_en: Refactor bnxt_ptp_init()
    c48cfa53fe96 bnxt_en: Reserve rings after PCIe AER recovery if NIC interface is down
    fd7259c1bacc net: hsr: fix hsr_init_sk() vs network/transport headers.
    41535cb14342 spi: atmel-quadspi: Fix register name in verbose logging function
    fed89cfab189 octeontx2-af: Quiesce traffic before NIX block reset
    0bbba28d4b8c octeontx2-af: RPM: fix stale FCFEC counters
    f002f21c1227 octeontx2-af: RPM: fix stale RSFEC counters
    92ada6df6ce7 octeontx2-pf: Reset MAC stats during probe
    3eda3da855da octeontx2-af: RPM: Fix low network performance
    6030d66ac03a octeontx2-af: RPM: Fix mismatch in lmac type
    7501912e5a9f net: stmmac: dwmac-socfpga: Set RX watchdog interrupt as broken
    93ccc94dd713 marvell: pxa168_eth: fix call balance of pep->clk handling routines
    6aa2ede634ad net: mdio-ipq4019: add missing error check
    836deb96383e net/ipv6: delete temporary address if mngtmpaddr is removed or unmanaged
    42251c2d1ef1 s390/iucv: MSG_PEEK causes memory leak in iucv_sock_destruct()
    f2a30e6fcd5a net: microchip: vcap: Add typegroup table terminators in kunit tests
    e3bb76fe2288 net: usb: lan78xx: Fix refcounting and autosuspend on invalid WoL configuration
    d0f06266562b tg3: Set coherent DMA mask bits to 31 for BCM57766 chipsets
    bca2c418a597 net: usb: lan78xx: Fix memory leak on device unplug by freeing PHY device
    a422ebec863d net: usb: lan78xx: Fix double free issue with interrupt buffer allocation
    3ea084dfc5a8 power: supply: rt9471: Use IC status regfield to report real charger status
    8637f400b253 power: supply: rt9471: Fix wrong WDT function regfield declaration
    7f395c87a8fe power: supply: bq27xxx: Fix registers of bq27426
    348d7d07ef3b power: supply: core: Remove might_sleep() from power_supply_put()
    0c8d50501bc1 LoongArch: BPF: Sign-extend return values
    a639cea4de29 LoongArch: Fix build failure with GCC 15 (-std=gnu23)
    7ea2a3d40142 fs_parser: update mount_api doc to match function signature
    06f2fcf49854 vfio/pci: Properly hide first-in-list PCIe extended capability
    1f7b85e5ffd8 gpio: zevio: Add missed label initialisation
    c2d6226bef96 selftests/mount_setattr: Fix failures on 64K PAGE_SIZE kernels
    6c5ddc2b68f2 vdpa/mlx5: Fix suboptimal range on iotlb iteration
    40be5b4c0c15 hwmon: (tps23861) Fix reporting of negative temperatures
    1dfc79bfc544 NFSD: Fix nfsd4_shutdown_copy()
    1c9a99c89e45 svcrdma: fix miss destroy percpu_counter in svc_rdma_proc_init()
    bd8524148dd8 nfsd: release svc_expkey/svc_export with rcu_work
    028417543535 NFSD: Cap the number of bytes copied by nfs4_reset_recoverydir()
    eb51733ae5fc NFSD: Prevent NULL dereference in nfsd4_process_cb_update()
    242ee2b0ad9b PCI: endpoint: epf-mhi: Avoid NULL dereference if DT lacks 'mmio'
    2ffc58ec837e remoteproc: qcom_q6v5_mss: Re-order writes to the IMEM region
    ab897ca4d7bb rpmsg: glink: use only lower 16-bits of param2 for CMD_OPEN name length
    c437af60c4f1 remoteproc: qcom: pas: add minidump_id to SM8350 resources
    2f465476ff8b perf trace: Avoid garbage when not printing a syscall's arguments
    fad7be239512 perf trace: Do not lose last events in a race
    e3b4b95c2b8b perf trace: Fix tracing itself, creating feedback loops
    f38ab496c7c4 perf list: Fix topic and pmu_name argument order
    838dd342962c svcrdma: Address an integer overflow
    022c3fc12850 m68k: coldfire/device.c: only build FEC when HW macros are defined
    c178bcaccbfd m68k: mcfgpio: Fix incorrect register offset for CONFIG_M5441x
    ad8cf4a18d99 perf trace: avoid garbage when not printing a trace event's arguments
    16784362b4bd f2fs: fix to avoid forcing direct write to use buffered IO on inline_data inode
    794fa8792d4e f2fs: fix race in concurrent f2fs_stop_gc_thread
    e466b89987d8 PCI: j721e: Deassert PERST# after a delay of PCIE_T_PVPERL_MS milliseconds
    9621a3d5a4e0 PCI: j721e: Add suspend and resume support
    bea0c0e4013b PCI: j721e: Use T_PERST_CLK_US macro
    0a289ca90225 PCI: j721e: Add reset GPIO to struct j721e_pcie
    762de2993b77 PCI: cadence: Set cdns_pcie_host_init() global
    4231df767001 PCI: cadence: Extract link setup sequence from cdns_pcie_host_setup()
    5261d258e318 PCI: j721e: Add PCIe 4x lane selection support
    7c3bf691097c PCI: j721e: Add per platform maximum lane settings
    47203d68f52a PCI: Add T_PVPERL macro
    ed16873faf6a f2fs: fix to avoid use GC_AT when setting gc_mode as GC_URGENT_LOW or GC_URGENT_MID
    ecf4e6782b01 f2fs: fix to avoid potential deadlock in f2fs_record_stop_reason()
    67f4c6646011 f2fs: check curseg->inited before write_sum_page in change_curseg
    f3d586b7ab62 f2fs: fix the wrong f2fs_bug_on condition in f2fs_do_replace_block
    aac3361f6d22 perf ftrace latency: Fix unit on histogram first entry when using --use-nsec
    b6b896c2fd44 PCI: cpqphp: Fix PCIBIOS_* return value confusion
    f974480cf399 PCI: cpqphp: Use PCI_POSSIBLE_ERROR() to check config reads
    b7c4121a4390 rust: macros: fix documentation of the paste! macro
    cbc853c490c9 perf probe: Correct demangled symbols in C++ program
    2c6f6c3843df perf probe: Fix libdw memory leak
    f1b8bfe8d2f2 f2fs: fix to account dirty data in __get_secs_required()
    6b0ed65c94c2 f2fs: compress: fix inconsistent update of i_blocks in release_compress_blocks and reserve_compress_blocks
    9ac8d6636230 perf test attr: Add back missing topdown events
    0c4753453964 perf trace: Keep exited threads for summary
    380bc5a698b9 perf stat: Fix affinity memory leaks on error path
    035c6b7a13ac perf stat: Close cork_fd when create_perf_stat_counter() failed
    8e098baf6bc3 PCI: Fix reset_method_store() memory leak
    e30cab288c8d gfs2: Fix unlinked inode cleanup
    8264963475ca gfs2: Allow immediate GLF_VERIFY_DELETE work
    4389447f1b2a gfs2: Rename GLF_VERIFY_EVICT to GLF_VERIFY_DELETE
    39822f7f4963 gfs2: Replace gfs2_glock_queue_put with gfs2_glock_put_async
    67696fef78cf gfs2: Get rid of gfs2_glock_queue_put in signal_our_withdraw
    300b21886232 perf cs-etm: Don't flush when packet_queue fills up
    39e5f390c2c9 mailbox: arm_mhuv2: clean up loop in get_irq_chan_comb()
    ebe0f8dc243e smb: cached directories can be more than root file handle
    f65f4ad87797 pinctrl: k210: Undef K210_PC_DEFAULT
    0dffdb2e70f1 arm64: dts: qcom: sc8180x: Add a SoC-specific compatible to cpufreq-hw
    118aa7cacaa5 clk: clk-axi-clkgen: make sure to enable the AXI bus clock
    abdf848ce528 dt-bindings: clock: axi-clkgen: include AXI clk
    fbb13732c6ff clk: ralink: mtmips: fix clocks probe order in oldest ralink SoCs
    f85a1d06afbc clk: ralink: mtmips: fix clock plan for Ralink SoC RT3883
    72ea9a7e9e26 clk: clk-apple-nco: Add NULL check in applnco_probe
    921fcf2971a1 RDMA/mlx5: Move events notifier registration to be after device registration
    b6334d2356fc IB/mlx5: Allocate resources just before first QP/SRQ is created
    3dd9df8e5f34 fbdev: sh7760fb: Fix a possible memory leak in sh7760fb_alloc_mem()
    1dd2d5630f0c powerpc/kexec: Fix return of uninitialized variable
    277ecc3d9797 powerpc/sstep: make emulate_vsx_load and emulate_vsx_store static
    d2f3414036be KVM: PPC: Book3S HV: Avoid returning to nested hypervisor on pending doorbells
    e7d134bd28ee KVM: PPC: Book3S HV: Stop using vc->dpdes for nested KVM guests
    a6faea503ba4 dax: delete a stale directory pmem
    8e0de82ed18b ocfs2: fix uninitialized value in ocfs2_file_read_iter()
    ae5427f88f19 cpufreq: CPPC: Fix wrong return value in cppc_get_cpu_power()
    4989d1ccf6f1 cpufreq: CPPC: Fix wrong return value in cppc_get_cpu_cost()
    6b0d7d6e6883 RDMA/hns: Fix NULL pointer derefernce in hns_roce_map_mr_sg()
    451d57b22b4a RDMA/hns: Fix out-of-order issue of requester when setting FENCE
    837197f49c71 x86/tdx: Dynamically disable SEPT violations from causing #VEs
    44cb69dbec78 x86/tdx: Rename tdx_parse_tdinfo() to tdx_setup()
    d4e39b6f96fe x86/tdx: Introduce wrappers to read and write TD metadata
    d0f6d80dbc79 x86/tdx: Pass TDCALL/SEAMCALL input/output registers via a structure
    a79a114f60f1 x86/tdx: Rename __tdx_module_call() to __tdcall()
    40d3b219aeb7 x86/tdx: Make macros of TDCALLs consistent with the spec
    2765142c05a6 x86/tdx: Skip saving output regs when SEAMCALL fails with VMFailInvalid
    c72a9456fdc8 scsi: sg: Enable runtime power management
    10a6fc486ac4 scsi: qedi: Fix a possible memory leak in qedi_alloc_and_init_sb()
    7c1832287b21 scsi: qedf: Fix a possible memory leak in qedf_alloc_and_init_sb()
    ac3c9fb621de scsi: fusion: Remove unused variable 'rc'
    c28409f851ab scsi: bfa: Fix use-after-free in bfad_im_module_exit()
    d069227df10d fs/proc/kcore.c: fix coccinelle reported ERROR instances
    ed2571229155 mfd: rt5033: Fix missing regmap_del_irq_chip()
    ec3eb00526bf checkpatch: always parse orig_commit in fixes tag
    f6a2560e149e checkpatch: check for missing Fixes tags
    0ac9a7fbe907 iommu/vt-d: Fix checks and print in pgtable_walk()
    c801250a7714 iommu/vt-d: Fix checks and print in dmar_fault_dump_ptes()
    0bfed74e80cc clk: imx: imx8-acm: Fix return value check in clk_imx_acm_attach_pm_domains()
    e334c2fd518c clk: imx: clk-scu: fix clk enable state save and restore
    b92706bd0eb0 clk: imx: fracn-gppll: fix pll power up
    db62437bf2da clk: imx: fracn-gppll: correct PLL initialization flow
    791bf6190357 clk: imx: lpcg-scu: SW workaround for errata (e10858)
    cd2f9bc87711 RISC-V: KVM: Fix APLIC in_clrip and clripnum write emulation
    e435f311c55d RDMA/rxe: Set queue pair cur_qp_state when being queried
    a9b251599bd3 clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
    4f2d22278e93 clk: sunxi-ng: d1: Fix PLL_AUDIO0 preset
    f37cc04fe893 RDMA/bnxt_re: Check cqe flags to know imm_data vs inv_irkey
    31978d5c5aef RDMA/rxe: Fix the qp flush warnings in req
    b4ba31e5aaff RDMA/hns: Fix cpu stuck caused by printings during reset
    8e20ac838be8 RDMA/hns: Use dev_* printings in hem code instead of ibdev_*
    44470c5eb88b RDMA/hns: Fix an AEQE overflow error caused by untimely update of eq_db_ci
    f05ef81db638 cpufreq: CPPC: Fix possible null-ptr-deref for cppc_get_cpu_cost()
    e07570a8f2cf cpufreq: CPPC: Fix possible null-ptr-deref for cpufreq_cpu_get_raw()
    a246daa26b71 powerpc/pseries: Fix dtl_access_lock to be a rw_semaphore
    8a06435959cc mtd: spi-nor: spansion: Use nor->addr_nbytes in octal DTR mode in RD_ANY_REG_OP
    9ea8d8bf9b62 powerpc/mm/fault: Fix kfence page fault reporting
    f1290871c8aa mtd: rawnand: atmel: Fix possible memory leak
    95b9fb67e493 mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
    29664ae6c473 mtd: hyperbus: rpc-if: Convert to platform remove callback returning void
    c5c1d1ef7083 powerpc/fadump: Move fadump_cma_init to setup_arch() after initmem_init()
    92f7cc84c3db powerpc/fadump: Refactor and prepare fadump_cma_init for late init
    783df31532f9 cpufreq: loongson2: Unregister platform_driver on failure
    d4cc78bd6a25 mfd: intel_soc_pmic_bxtwc: Use IRQ domain for PMIC devices
    1b734ad0e336 mfd: intel_soc_pmic_bxtwc: Use IRQ domain for TMU device
    e1ef62e8d262 mfd: intel_soc_pmic_bxtwc: Use IRQ domain for USB Type-C device
    d80635d7ebef mfd: da9052-spi: Change read-mask to write-mask
    7c8ac49aa18a mfd: tps65010: Use IRQF_NO_AUTOEN flag in request_irq() to fix race
    a7083f0ce5f8 powerpc/vdso: Flag VDSO64 entry points as functions
    40163b26c3de scsi: hisi_sas: Enable all PHYs that are not disabled by user during controller reset
    8b12c4e29ac2 pinctrl: zynqmp: drop excess struct member description
    840295a8ff9e trace/trace_event_perf: remove duplicate samples on the first tracepoint event
    3d02397ca30b clk: mediatek: drop two dead config options
    e2f15cb48ab7 cppc_cpufreq: Use desired perf if feedback ctrs are 0 or unchanged
    c4b6c1781f6c unicode: Fix utf8_load() error path
    da2bc8a0c8f3 bpf: fix recursive lock when verdict program return SK_PASS
    aeafba58c432 wireguard: selftests: load nf_conntrack if not present
    4802caac250b netpoll: Use rcu_access_pointer() in netpoll_poll_lock
    f466641debcb erofs: handle NONHEAD !delta[1] lclusters gracefully
    de5a44f351ca Bluetooth: fix use-after-free in device_for_each_child()
    b754e831a94f ALSA: 6fire: Release resources at card release
    4507a8b9b303 ALSA: caiaq: Use snd_card_free_when_closed() at disconnection
    2938dd264852 ALSA: us122l: Use snd_card_free_when_closed() at disconnection
    e07605d855c4 ALSA: usx2y: Use snd_card_free_when_closed() at disconnection
    440f6a15700e net: rfkill: gpio: Add check for clk_enable()
    89bf1b665ba9 bpf: Force uprobe bpf program to always return 0
    38e3d796f654 drm/amdkfd: Fix wrong usage of INIT_WORK()
    d1fb89f0024d selftests: net: really check for bg process completion
    43e25adc8026 ipv6: release nexthop on device removal
    70530a2f8120 net: use unrcu_pointer() helper
    bba7266d9dc4 sock_diag: allow concurrent operation in sock_diag_rcv_msg()
    161d4fc07133 sock_diag: allow concurrent operations
    37103a9d7f12 sock_diag: add module pointer to "struct sock_diag_handler"
    5ef3e03228e1 bpf, sockmap: Fix sk_msg_reset_curr
    98c7ea7d11f2 bpf, sockmap: Several fixes to bpf_msg_pop_data
    a53ad8ab116d bpf, sockmap: Several fixes to bpf_msg_push_data
    9df2dddc083a selftests/bpf: Add push/pop checking for msg_verify_data in test_sockmap
    862b395de02d selftests/bpf: Fix total_bytes in msg_loop_rx in test_sockmap
    a1820f63dd1e selftests/bpf: Fix SENDPAGE data logic in test_sockmap
    c8803b286d9d selftests/bpf: Add txmsg_pass to pull/push/pop in test_sockmap
    c88ae0a77c21 netlink: typographical error in nlmsg_type constants definition
    c65cff783752 netfilter: nf_tables: must hold rcu read lock while iterating object type list
    5199d4a4e018 netfilter: nf_tables: skip transaction if update object is not implemented
    981af60dd6a2 netfilter: nf_tables: must hold rcu read lock while iterating expression type list
    cd38d9cdf4bb netfilter: nf_tables: avoid false-positive lockdep splat on rule deletion
    6ee1c9849cc4 netfilter: nf_tables: Introduce nf_tables_getrule_single()
    1d0f811ec145 netfilter: nf_tables: Open-code audit log call in nf_tables_getrule()
    cf7b5e0bc199 drm: use ATOMIC64_INIT() for atomic64_t
    23c3f60082ac drm/vkms: Drop unnecessary call to drm_crtc_cleanup()
    41f0b320b6ea bpf, bpftool: Fix incorrect disasm pc
    b32f915fc659 drm/msm/dpu: cast crtc_clk calculation to u64 in _dpu_core_perf_calc_clk()
    1c079dace922 wifi: wfx: Fix error handling in wfx_core_init()
    a17b9afe58c4 drm: zynqmp_kms: Unplug DRM device before removal
    237f2dbfa005 drm/nouveau/gr/gf100: Fix missing unlock in gf100_gr_chan_new()
    ba0599332acc drm/etnaviv: hold GPU lock across perfmon sampling
    6b1c1297bcd5 drm/etnaviv: Request pages from DMA32 zone on addressing_limited
    a3d37915f133 drm/msm/gpu: Check the status of registration to PM QoS
    1021cc87206a drm/msm/adreno: Use IRQF_NO_AUTOEN flag in request_irq()
    d6a559c5642d bpf, arm64: Remove garbage frame for struct_ops trampoline
    c6120d95c729 drm/panfrost: Remove unused id_mask from struct panfrost_model
    b955ceba2c1e selftests/bpf: fix test_spin_lock_fail.c's global vars usage
    b99db02209ca octeontx2-pf: handle otx2_mbox_get_rsp errors in otx2_dcbnl.c
    3ccbc7a51886 octeontx2-pf: handle otx2_mbox_get_rsp errors in otx2_dmac_flt.c
    c5a6c5af4346 octeontx2-pf: handle otx2_mbox_get_rsp errors in cn10k.c
    c4eae7bac880 octeontx2-pf: handle otx2_mbox_get_rsp errors in otx2_flows.c
    c0f64fd73b60 octeontx2-pf: handle otx2_mbox_get_rsp errors in otx2_ethtool.c
    52c63a6a27d3 octeontx2-pf: handle otx2_mbox_get_rsp errors in otx2_common.c
    bfbd0b09aff0 drm/msm/dpu: drop LM_3 / LM_4 on MSM8998
    29fa82adec3c drm/msm/dpu: drop LM_3 / LM_4 on SDM845
    b9ebac16315e drm/msm/dpu: on SDM845 move DSPP_3 to LM_5 block
    0e5bcf5136f1 drm: fsl-dcu: enable PIXCLK on LS1021A
    c4698ef8c42e wifi: mwifiex: Fix memcpy() field-spanning write warning in mwifiex_config_scan()
    557e07a7a487 selftests/bpf: Fix txmsg_redir of test_txmsg_pull in test_sockmap
    26f54adde839 selftests/bpf: Fix msg_verify_data in test_sockmap
    5981e6e1b50d drm/bridge: tc358767: Fix link properties discovery
    80afbcbdaf48 netdevsim: copy addresses for both in and out paths
    ef38a689f4e0 libbpf: never interpret subprogs in .text as entry programs
    452eb0e1589d ASoC: rt722-sdca: Remove logically deadcode in rt722-sdca.c
    36c79b9ff20a libbpf: fix sym_is_subprog() logic for weak global subprogs
    a8ec6447d76d drm/vc4: Match drm_dev_enter and exit calls in vc4_hvs_atomic_flush
    fff56eb08053 ice: consistently use q_idx in ice_vc_cfg_qs_msg()
    a340f9115301 ice: Support FCS/CRC strip disable for VF
    2edb61b5d3f0 virtchnl: Add CRC stripping capability
    fb5d7f68e676 wifi: ath11k: Fix CE offset address calculation for WCN6750 in SSR
    e05f60981951 bpf: Fix the xdp_adjust_tail sample prog issue
    44a21d9fbc2d libbpf: Fix output .symtab byte-order during linking
    d900a20e33d7 libbpf: Fix expected_attach_type set handling in program load callback
    65f9fe75cad1 drm/bridge: it6505: Drop EDID cache on bridge power off
    c2a04ba6f93d drm/bridge: anx7625: Drop EDID cache on bridge power off
    3340acafcce6 ASoC: dt-bindings: mt6359: Update generic node name and dmic-mode
    537f327629be ASoC: fsl_micfil: fix regmap_write_bits usage
    53507b7c6363 dt-bindings: vendor-prefixes: Add NeoFidelity, Inc
    d73da0dd2853 wifi: ath12k: Skip Rx TID cleanup for self peer
    8325a50983c1 wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss2
    9ef3985a9e02 wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss1
    56541262079d drm/v3d: Address race-condition in MMU flush
    fda29dff5581 drm/imx/ipuv3: Use IRQF_NO_AUTOEN flag in request_irq()
    b509546bfa1f drm/imx/dcss: Use IRQF_NO_AUTOEN flag in request_irq()
    521d4b3f1dc1 wifi: mwifiex: Use IRQF_NO_AUTOEN flag in request_irq()
    dbdca51b054f wifi: p54: Use IRQF_NO_AUTOEN flag in request_irq()
    088e10e74390 drm/omap: Fix locking in omap_gem_new_dmabuf()
    4da37fba2a6b drm/omap: Fix possible NULL dereference
    b6551479daf2 wifi: ath9k: add range check for conn_rsp_epid in htc_connect_service()
    9728b508b01a drm/vc4: hvs: Correct logic on stopping an HVS channel
    52c1716f65a5 drm/vc4: hvs: Remove incorrect limit from hvs_dlist debugfs function
    8182b5ca19c6 drm/vc4: hvs: Fix dlist debug not resetting the next entry pointer
    c7d474974954 drm/vc4: hdmi: Avoid hang with debug registers when suspended
    40c77e93cfdd drm/vc4: hvs: Don't write gamma luts on 2711
    2ee46de426cc drm/mm: Mark drm_mm_interval_tree*() functions with __maybe_unused
    6c8938e41b82 platform/x86: panasonic-laptop: Return errno correctly in show callback
    b03e713a400a HID: hyperv: streamline driver probe to avoid devres issues
    599929021528 arm64: dts: rockchip: correct analog audio name on Indiedroid Nova
    8066badaf746 media: atomisp: Add check for rgby_data memory allocation failure
    025067eeb945 firmware: arm_scpi: Check the DVFS OPP count returned by the firmware
    667b0527a3e7 selftests/resctrl: Protect against array overrun during iMC config parsing
    99ca7bddcade selftests/resctrl: Fix memory overflow due to unhandled wraparound
    feb6e4412537 selftests/resctrl: Refactor fill_buf functions
    315f9a1e1748 selftests/resctrl: Split fill_buf to allow tests finer-grained control
    367a0a92b968 arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add supplies for fixed regulators
    1e1acb879e3c arm64: dts: mediatek: mt8183-kukui-jacuzzi: Fix DP bridge supply names
    7db9c3c15fb5 arm64: dts: mediatek: mt6358: fix dtbs_check error
    dbcba9b1108a arm64: dts: mediatek: Add ADC node on MT6357, MT6358, MT6359 PMICs
    a67ebf6dcc4a arm64: dts: renesas: hihope: Drop #sound-dai-cells
    3dea2312ab45 regmap: irq: Set lockdep class for hierarchical IRQ domains
    2c8cfd167100 spi: zynqmp-gqspi: Undo runtime PM changes at driver exit time​
    48e518e705e7 spi: tegra210-quad: Avoid shift-out-of-bounds
    872bfc20abea pmdomain: ti-sci: Add missing of_node_put() for args.np
    1103d3b5a502 of/fdt: add dt_phys arg to early_init_dt_scan and early_init_dt_verify
    be0a96cfa9c0 x86/of: Unconditionally call unflatten_and_copy_device_tree()
    ccf190dba640 um: Unconditionally call unflatten_device_tree()
    66b991a52ae6 arm64: dts: ti: k3-j721s2: Fix clock IDs for MCSPI instances
    a21e7623d782 arm64: dts: ti: k3-j721e: Fix clock IDs for MCSPI instances
    cae00563f173 arm64: dts: ti: k3-j7200: Fix clock ids for MCSPI instances
    ccdac40ce4d2 arm64: dts: ti: k3-j7200: Fix register map for main domain pmx
    4981b8a2d9fa arm64: dts: ti: k3-j7200: use ti,j7200-padconf compatible
    9810ceccd99b ARM: dts: cubieboard4: Fix DCDC5 regulator constraints
    0d9cee68a3f1 pwm: imx27: Workaround of the pwm output bug when decrease the duty cycle
    15cbeb8ae3c0 arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns
    8e965120d845 arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns
    8b833a02b454 arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns
    0f627e99cca6 arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns
    52c3eb1c8ce8 regulator: rk808: Restrict DVS GPIOs to the RK808 variant only
    9e67b054198f cgroup/bpf: only cgroup v2 can be attached by bpf programs
    92031d660152 Revert "cgroup: Fix memory leak caused by missing cgroup_bpf_offline"
    2ef8dc16041b arm64: dts: mediatek: mt8173-elm-hana: Add vdd-supply to second source trackpad
    78a8e85b5314 arm64: dts: mt8183: kukui: Fix the address of eeprom at i2c4
    699e5e70ad34 arm64: dts: mt8183: krane: Fix the address of eeprom at i2c4
    3164cc7cf77a media: i2c: ds90ub960: Fix missing return check on ub960_rxport_read call
    f8549e3f03c1 tpm: fix signed/unsigned bug when checking event logs
    ae0ad1626018 efi/libstub: fix efi_parse_options() ignoring the default command line
    b18f8d9e2827 openrisc: Implement fixmap to fix earlycon
    91884250825f mmc: mmc_spi: drop buggy snprintf()
    4e12b09f57c2 ARM: dts: microchip: sam9x60: Add missing property atmel,usart-mode
    653847d80fa9 arm64: dts: qcom: sm6350: Fix GPU frequencies missing on some speedbins
    c24e019ca12d soc: qcom: geni-se: fix array underflow in geni_se_clk_tbl_get()
    bfd19f48c45c soc: ti: smartreflex: Use IRQF_NO_AUTOEN flag in request_irq()
    b7394c6fba3a arm64: dts: mt8195: Fix dtbs_check error for infracfg_ao node
    0a3ba7c09ac8 arm64: dts: mt8195: Fix dtbs_check error for mutex node
    1dcb74ebda5c microblaze: Export xmb_manager functions
    882d7afaa4b8 drivers: soc: xilinx: add the missing kfree in xlnx_add_cb_for_suspend()
    d3a5e7ffbd41 spi: spi-fsl-lpspi: Use IRQF_NO_AUTOEN flag in request_irq()
    ecbc50474769 clocksource/drivers/timer-ti-dm: Fix child node refcount handling
    3ba257d80ffa clocksource/drivers:sp804: Make user selectable
    45eec49fa2fa kcsan, seqlock: Fix incorrect assumption in read_seqbegin()
    5b12a7e70b0b kcsan, seqlock: Support seqcount_latch_t
    01b61f5cef36 time: Fix references to _msecs_to_jiffies() handling of values
    7723bfe6f903 time: Partially revert cleanup on msecs_to_jiffies() documentation
    8d91bdca2f97 x86/unwind/orc: Fix unwind for newly forked tasks
    cc08c2c8e98e thermal/lib: Fix memory leak on error in thermal_genl_auto()
    1b78ac7eb6c7 tools/lib/thermal: Make more generic the command encoding function
    5cecc5786506 rcuscale: Do a proper cleanup if kfree_scale_init() fails
    a40520a7a5e6 crypto: cavium - Fix an error handling path in cpt_ucode_load_fw()
    ae5253313e0e crypto: bcm - add error check in the ahash_hmac_init function
    5a0329563e25 crypto: caam - add error check to caam_rsa_set_priv_key_form
    1fa9635a5f67 ACPI: CPPC: Fix _CPC register setting issue
    685c10269c41 hwmon: (nct6775-core) Fix overflows seen when writing limit attributes
    4ffcf7893f4b hwmon: (pmbus/core) clear faults after setting smbalert mask
    714788c6a697 hwmon: (pmbus_core) Allow to hook PMBUS_SMBALERT_MASK
    967a0e619108 rcu/kvfree: Fix data-race in __mod_timer / kvfree_call_rcu
    f5fed8a850d0 doc: rcu: update printed dynticks counter bits
    605150b4c903 crypto: inside-secure - Fix the return value of safexcel_xcbcmac_cra_init()
    830cabb61113 EDAC/igen6: Avoid segmentation fault on module unload
    6a975fbab1d2 crypto: hisilicon/qm - disable same error report before resetting
    4b3c113af8d6 amd-pstate: Set min_perf to nominal_perf for active mode performance gov
    db74e48b49ad crypto: cavium - Fix the if condition to exit loop after timeout
    5edae7a9a356 crypto: pcrypt - Call crypto layer directly when padata_do_parallel() return -EBUSY
    d9338b781fe9 EDAC/{skx_common,i10nm}: Fix incorrect far-memory error source indicator
    edf58d4bebc3 EDAC/skx_common: Differentiate memory error sources
    63a2d940c719 EDAC/fsl_ddr: Fix bad bit shift operations
    ac7dfac63970 thermal: core: Initialize thermal zones before registering them
    85a57cdc1b25 crypto: qat - remove faulty arbiter config reset
    ac6ebb9edcdb EDAC/bluefield: Fix potential integer overflow
    bba6cba4dab2 firmware: google: Unregister driver_info on failure
    05c9a7a53444 crypto: qat/qat_4xxx - fix off by one in uof_get_name()
    2a064b788dee crypto: qat - remove check after debugfs_create_dir()
    1f8e2f597b91 crypto: caam - Fix the pointer passed to caam_qi_shutdown()
    b2c36fa9ac8a virtio_blk: reverse request order in virtio_queue_rqs
    519899291235 nvme-pci: reverse request order in nvme_queue_rqs
    77035e4d27e1 ext4: fix race in buffer_head read fault injection
    cca059508975 ext4: remove array of buffer_heads from mext_page_mkuptodate()
    2266fe580adf ext4: pipeline buffer reads in mext_page_mkuptodate()
    fbd359a2ee20 ext4: remove calls to to set/clear the folio error flag
    21900e847812 hfsplus: don't query the device logical block size multiple times
    13ebba9e57a6 s390/syscalls: Avoid creation of arch/arch/ directory
    fad4262bd40d block: fix bio_split_rw_at to take zone_write_granularity into account
    539fabba965e netfs/fscache: Add a memory barrier for FSCACHE_VOLUME_CREATING
    ae8c963906ed cachefiles: Fix missing pos updates in cachefiles_ondemand_fd_write_iter()
    01f605a4cd74 acpi/arm64: Adjust error handling procedure in gtdt_parse_timer_block()
    b46bc5b02ded arm64: fix .data.rel.ro size assertion when CONFIG_LTO_CLANG
    d4e05e954504 m68k: mvme147: Reinstate early console
    6395a5f9eb44 m68k: mvme16x: Add and use "mvme16x.h"
    d77659d3ffba m68k: mvme147: Fix SCSI controller IRQ numbers
    cee3bff51a35 nvme-pci: fix freeing of the HMB descriptor table
    1a423bbbeaf9 initramfs: avoid filename buffer overrun
    372042443be4 mips: asm: fix warning when disabling MIPS_FP_SUPPORT
    6c63de9b4d0e ext4: avoid remount errors with 'abort' mount option
    410896624db6 brd: defer automatic disk creation until module initialization succeeds
    83d123e27623 x86/pvh: Call C code via the kernel virtual mapping
    f662b4a69e1d x86/pvh: Set phys_base when calling xen_prepare_pvh()
    aa6e32c654fc s390/pageattr: Implement missing kernel_page_present()
    a1dc0428c05a s390/cio: Do not unregister the subchannel based on DNV
    9820f3548679 kselftest/arm64: mte: fix printf type warnings about longs
    b95a1cd26a28 kselftest/arm64: mte: fix printf type warnings about __u64
    0dd9a53bb9b2 arm64: probes: Disable kprobes/uprobes on MOPS instructions
    ecc2aeeaa08a bpf: support non-r10 register spill/fill to/from stack in precision tracking
    44b1bfb5bd97 mptcp: fix possible integer overflow in mptcp_reset_tout_timer
    68f75e6f08aa drm/amd/display: Add null check for pipe_ctx->plane_state in dcn20_program_pipe
    36ff963c133a platform/x86: x86-android-tablets: Unregister devices in reverse order
    f7d9a18572fc nvme: apple: fix device reference counting
    3820b0fac773 fs/proc: do_task_stat: use sig->stats_lock to gather the threads/children stats
    c7e65cab54a8 drm/amd/display: Don't refer to dc_sink in is_dsc_need_re_compute
    c3a3b6d9a938 drm/amd/display: Check null-initialized variables
    e0f6ee75f504 fs/inode: Prevent dump_mapping() accessing invalid dentry.d_name.name
    9f35cec5e4b9 drm/amd/display: Initialize denominators' default to 1
    f38b09ba6a33 drm/amd/display: Add NULL check for function pointer in dcn32_set_output_transfer_func
    9d0f1e745e95 x86/stackprotector: Work around strict Clang TLS symbol requirements
    dc5ead0e8fc5 serial: sc16is7xx: fix invalid FIFO access with special register set
    a891938947f4 s390/pkey: Wipe copies of clear-key structures on failure
    d038693e08ad i2c: lpi2c: Avoid calling clk_get_rate during transfer
    561063997ae3 ipmr: Fix access to mfc_cache_list without lock held
    2abc2bd53e4c ARM: 9420/1: smp: Fix SMP for xip kernels
    344fb3c52923 ALSA: usb-audio: Fix Yamaha P-125 Quirk Entry
    7ed79c551c09 LoongArch: Define a default value for VM_DATA_DEFAULT_FLAGS
    65b08af3c4a1 ASoC: audio-graph-card2: Purge absent supplies for device tree nodes
    fe8c40810a11 proc/softirqs: replace seq_printf with seq_put_decimal_ull_width
    82d0f099009e drm: panel-orientation-quirks: Make Lenovo Yoga Tab 3 X90F DMI match less strict
    0058f8ebfdb0 ASoC: stm: Prevent potential division by zero in stm32_sai_get_clk_div()
    d525fc94249a ASoC: stm: Prevent potential division by zero in stm32_sai_mclk_round_rate()
    1423de2c7ba1 ASoC: amd: yc: Support dmic on another model of Lenovo Thinkpad E14 Gen 6
    b07b441b79c2 platform/x86: thinkpad_acpi: Fix for ThinkPad's with ECFW showing incorrect fan speed
    769aa742527c can: j1939: fix error in J1939 documentation.
    3e8cc9901073 tools/lib/thermal: Remove the thermal.h soft link when doing make clean
    bb64195b56ca ASoC: tas2781: Add new driver version for tas2563 & tas2781 qfn chip
    739aac7323f0 platform/x86: dell-wmi-base: Handle META key Lock/Unlock events
    32660e18f5ca platform/x86: dell-smbios-base: Extends support to Alienware products
    fd782cb8f9d3 regulator: rk808: Add apply_bit for BUCK3 on RK809
    cb5bf9377102 firmware: arm_scmi: Reject clear channel request on A2P
    3bb3fa542835 soc: qcom: Add check devm_kasprintf() returned value
    7c92e2b55677 net: usb: qmi_wwan: add Quectel RG650V
    363473736bb0 bpf: fix filed access without lock
    3e3bc9cf3fdf x86/amd_nb: Fix compile-testing without CONFIG_AMD_NB
    1b15738a7d30 ALSA: hda/realtek: Add subwoofer quirk for Infinix ZERO BOOK 13
    9dc3380fb586 selftests/watchdog-test: Fix system accidentally reset after watchdog-test
    16009cc182ef usb: typec: use cleanup facility for 'altmodes_node'
    f083283f914b usb: add support for new USB device ID 0x17EF:0x3098 for the r8152 driver
    24fa3e9443a4 mac80211: fix user-power when emulating chanctx
    675a1803efa1 wifi: iwlwifi: mvm: Use the sync timepoint API in suspend
    9b0f6adf28b4 ASoC: Intel: sst: Support LPE0F28 ACPI HID
    92cab36cf11a ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet
    6909df783e42 ASoC: Intel: bytcr_rt5640: Add support for non ACPI instantiated codec
    98130b150916 ASoC: codecs: rt5640: Always disable IRQs from rt5640_cancel_work()
    28f152fc9553 wifi: radiotap: Avoid -Wflex-array-member-not-at-end warnings
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
(cherry picked from commit f77ff46e2a31c7a5ced9ede51ad871e38084d33e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 3eef9a67d7..6b13ce78dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "db1ff5ceabc3902a2a385e1f1d0a234812bff52c"
-SRCREV_meta ?= "99c5ec65d21cd824d26ee9eb8bca7d2e59311e5f"
+SRCREV_machine ?= "ec2b8ce9a5c287dc48d9643f9f5d5cf1bb3784de"
+SRCREV_meta ?= "ff64121c498bd9a8ead8b08663da323e3e103179"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.63"
+LINUX_VERSION ?= "6.6.64"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 7d4f9f4306..adf1215ff1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.63"
+LINUX_VERSION ?= "6.6.64"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7161bda718e673d92774adeec664c182a9503b23"
-SRCREV_meta ?= "99c5ec65d21cd824d26ee9eb8bca7d2e59311e5f"
+SRCREV_machine ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
+SRCREV_meta ?= "ff64121c498bd9a8ead8b08663da323e3e103179"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 2d76148bfb..73f3c437db 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d2cfc8b451eb38afd1f722e8d1047da4e23bb187"
-SRCREV_machine:qemuarm64 ?= "7161bda718e673d92774adeec664c182a9503b23"
-SRCREV_machine:qemuloongarch64 ?= "7161bda718e673d92774adeec664c182a9503b23"
-SRCREV_machine:qemumips ?= "af4cdb96163587bbf381ebfa551b6fa259201cca"
-SRCREV_machine:qemuppc ?= "7161bda718e673d92774adeec664c182a9503b23"
-SRCREV_machine:qemuriscv64 ?= "7161bda718e673d92774adeec664c182a9503b23"
-SRCREV_machine:qemuriscv32 ?= "7161bda718e673d92774adeec664c182a9503b23"
-SRCREV_machine:qemux86 ?= "7161bda718e673d92774adeec664c182a9503b23"
-SRCREV_machine:qemux86-64 ?= "7161bda718e673d92774adeec664c182a9503b23"
-SRCREV_machine:qemumips64 ?= "e1b42bae30e5681c236b9377d73dee82becd53c3"
-SRCREV_machine ?= "7161bda718e673d92774adeec664c182a9503b23"
-SRCREV_meta ?= "99c5ec65d21cd824d26ee9eb8bca7d2e59311e5f"
+SRCREV_machine:qemuarm ?= "390fa422d33daad3f6046b7223654f58517eb285"
+SRCREV_machine:qemuarm64 ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
+SRCREV_machine:qemuloongarch64 ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
+SRCREV_machine:qemumips ?= "47f3134d3ef0f0ccc24bec6325dc66520045dc00"
+SRCREV_machine:qemuppc ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
+SRCREV_machine:qemuriscv64 ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
+SRCREV_machine:qemuriscv32 ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
+SRCREV_machine:qemux86 ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
+SRCREV_machine:qemux86-64 ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
+SRCREV_machine:qemumips64 ?= "37a948fa6a662b8f42fb23009734edaa20dfef22"
+SRCREV_machine ?= "6ae9eb480f36462d25b89758e541d6298f607a5b"
+SRCREV_meta ?= "ff64121c498bd9a8ead8b08663da323e3e103179"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "bff3e13adb72656356111d2549d8be7c872d6e15"
+SRCREV_machine:class-devupstream ?= "22a054ea1f081d7837cc8e24ad4c7aa36e8bba04"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.63"
+LINUX_VERSION ?= "6.6.64"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


