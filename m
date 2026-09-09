Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4BDC79FBC
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:00 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6429.1788938996413394407
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=J82JwriG;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48586861639so3427476f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788938995; x=1789543795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/xByexk267SoBcCMljGk5XCJl4Sn9kaX8FCnLFkol4Y=;
        b=J82JwriGOk2MTdGfsiElQdnSeWI3ILgLVy3ip7AsSNv5MR7v3RrCLbZjjXwXdk6mG8
         ccoWZk4eUGE5dW7q2TijhOUjd8a+AeXwtlehBHj6XGaO/IkqrapefwACrLRG5ojropy+
         sRpS7sl6525zZo44mQ6czi0g4WSBK0XgM/qCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938995; x=1789543795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/xByexk267SoBcCMljGk5XCJl4Sn9kaX8FCnLFkol4Y=;
        b=jK9ocq3AG1L+Z4WvFIxbqZkhBFVqN+DRa+tawdCSQSs9wT8WZC56d44dA2tImCiLKm
         gDZjT+i6CYQ/+qCQ9sgJ/6z5IFkFDNRHHYmJNwmjOUtSISySD9E5DcFGtrzxQL2Iwi1c
         03lU/2HsCPFW6v+cXjZNdsaat9Ojyzm6Ah249YcvWWEHZHFa9ISOUEthlt+ayilpJqtG
         8/Fv05upcKI7YBpsAQ5Dtf0/z/KAeChzUZKhqt2VwNsr7j2iMtiFd+48hESDgRGXxlEW
         OH3H1IaBAeuzDdCleRnbCRcF0OJEqEtIYs2FREKI5Wsz7pbth2D9mtN0pBQXI/uMNacD
         PhZg==
X-Gm-Message-State: AFuF++k7g7RUy6pr0GOPN6GE+cSCvw71vML6olOLG6v9INnL3/c24dzr
	zdFhkT3XwczrIde7oGNW+2+1UJvgJO+5gu39UdqM7GDW/QNJGo/daS4dX4xuMVSpPeNu8/GQ5oi
	NH5hrcmk=
X-Gm-Gg: AYBFou012i2hBP551ZKMYlaZGSoMJZ9Vf3eecgtBUjxD5p4E68XSPCzVKRvcqLgKU+O
	a8xG0bREMFFdpAp165aqdid0EnnHQFYpjCDhll8JhjR+U8zsnftZ/4p99Pjrc62QNk8xlFBEfjT
	cBGZZIDpYhfaN8oi9GCtiNoG3bpgzA96+bIRUY9AhnChhOMVy3eCFFujk+2iuHXAe1IjzazCE3J
	QWZ4ZVjVaDNHN0KG9xAR0sSbcR3UHLZ/Awpwvh6ULhoZFMmdSmzCKe+ldb5WlGVXV/AHjiBzj7Y
	vjRmFiD3byrdH9ZqD1xDyp7h3y+fcrThjhQmZMPJmmsTihffRnet6HQoHwAv1rvVcQdbomwoYcN
	8PiLTIM3W8QMxOSLYhhUh04Xky89AxOx7DxtfeP5MWUQc3Npp69NNmioMalhhCq6nVhv7pMjOku
	naaMHTr4V4HiZA4UrLVWi4ZC/5oIs+yUsBBt0EL9lFxMax8y4p28D8XWHncCKcqnm3MSZxkI+ES
	snP/xgmBxe/Ey/hvQ6tGJ8glRmr8ki4DNxHjZVL5xfXRWN3URhUYpp9wzU88AU3Gmrzed0UIVc=
X-Received: by 2002:a05:6000:4918:b0:485:ad72:cd65 with SMTP id ffacd0b85a97d-485ad72cf0fmr2274517f8f.2.1788938993929;
        Wed, 09 Sep 2026 00:29:53 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.29.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:29:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/38] linux-yocto/6.18: update to v6.18.44
Date: Wed,  9 Sep 2026 09:29:02 +0200
Message-ID: <a20c4a02f68c68919c8e39d8299b0afbf74d9cbd.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245411

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    1efe5d048a391 Linux 6.18.44
    358b5dcf1fd7f drm/tegra: fbdev: Do not assign to struct drm_fb_helper.info
    e7731507270c2 drm/fb-helper: Fix a locking bug in an error path
    7bc7af179916b usb: typec: ucsi: Correct teardown ordering in ucsi_init() error path
    10be509fa8fd9 can: isotp: fix timer drain order, wakeup handling and tx_gen ordering
    0902f06a6c0bb can: use skb hash instead of private variable in headroom
    157b1e3384d7d drm/xe/pt: Reset current_op in xe_pt_update_ops_init()
    b1a71151317c4 drm/xe: Add page reclamation info to device info
    6107b64cfccef drm/xe: Stub out new pagefault layer
    184de3d31f728 drm/xe: Use SVM range helpers in PT layer
    df1582c0a101e drm/i915/vrr: require valid min/max vfreq for VRR
    894d4a7395662 drm/i915/vrr: Check HAS_VRR() first in intel_vrr_is_capable()
    21976fe525849 drm/xe: Wait on external BO kernel fences in exec IOCTL
    b8ad916ba4e18 drm/exec: Remove the index parameter from drm_exec_for_each_locked_obj[_reverse]
    d256dac008d1d drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC
    8fa8b0a463729 drm/xe/vm: Prevent binding of purged buffer objects
    1ba553ee0b521 drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
    0015b054b06d3 drm/xe: add xe_migrate_resolve wrapper and is_vram_resolve support
    005b9b4431606 drm/xe/pat: Add helper to query compression enable status
    3cb42a973f889 drm/amd/display: Exit idle optimizations before programming
    dbbe08d73b8bc drm/amd/display: check GRPH_FLIP status before sending event
    b485bfb455551 drm/xe/guc: Fix buffer overflow in steered register list allocation
    30b2d0843a410 drm/amdgpu: Respect placement requirements in amdgpu_gtt_mgr functions
    e06c39cc1c48d drm/amdgpu: Fix context pstate override handling
    4d49ca777cf1a drm/tegra: fbdev: Remove offset into framebuffer memory
    3f58077457985 drm/fb-helper: Allocate and release fb_info in single place
    165613191ad9d userfaultfd: prevent registration of special VMAs
    02d378828af8b wifi: brcmfmac: drain bus_reset work on device removal
    d6f322d68abfd media: uapi: rkisp: Correct name version enum
    5c6d5d2484cab media: qcom: camss: Fix RDI streaming for CSID 340
    f730ee0ef8fac media: qcom: camss: csid-340: Fix unused variables
    276420a86e75f media: chips-media: wave5: Support CBP profile
    3f7b3728dd901 usb: typec: ucsi: Fix race condition and ordering in port unregistration
    58d9caa64f9c6 usb: typec: ucsi: split connector lock classes
    2bf24a7e190aa net/handshake: Drain pending requests at net namespace exit
    6e7b52bd13948 net/handshake: Close the submit-side sock_hold race
    68eba6519cbd6 net/handshake: hand off the pinned file reference to accept_doit
    b913801ad9b9a net/handshake: Take a long-lived file reference at submit
    5ddfc47e1228d net/handshake: Fix null-ptr-deref in handshake_complete()
    97e745b4ea055 net/handshake: convert handshake_nl_accept_doit() to FD_PREPARE()
    f00dd592abe77 file: ensure cleanup
    10827847c40c1 file: add FD_{ADD,PREPARE}()
    10065fb891651 mm/huge_memory: unlock i_mmap_rwsem before releasing after-split folios
    be11b4bf498a3 fs/proc/task_mmu: fix PAGEMAP_SCAN written state for unpopulated ptes
    2b9a07002c2f2 mm/hugetlb: fix swap entry corruption when clearing uffd-wp at fork()
    fc0c76b0450f2 drm/xe/rtp: Ensure locking/ref counting for OA whitelists
    9783d8662b565 drm/xe/oa: (De-)whitelist OA registers on OA stream open/release
    f5966d9006623 drm/xe/rtp: (De-)whitelist OA registers for all hwe's for a gt
    d43abc858f082 drm/xe/rtp: Toggle 'deny' bit to (de-)whitelist OA regs
    c2cfee9bf8d46 drm/xe/rtp: Save OA nonpriv registers to register save/restore lists
    4bb92418e749f drm/xe/rtp: Generalize whitelist_apply_to_hwe
    cc716d3ac560f drm/xe/rtp: Keep track of non-OA nonpriv slots
    f73e97080debd drm/xe/rtp: Maintain OA whitelists separately
    7982678fa21ed drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA whitelists
    542d3b9fa8ec6 drm/xe/rtp: Refactor OAG MMIO trigger register whitelisting
    2b70bebc70948 HID: logitech-dj: Fix maxfield check in DJ short report validation
    6be3dbe45b287 spi: spi-cadence: enable SPI_CONTROLLER_MUST_TX
    042ca38779554 drm/vmwgfx: validate external BO copy bounds for both stride paths
    cfd163169af3b drm/vmwgfx: use check_add_overflow for shader size+offset bound
    1eb4f796695be drm/vmwgfx: enforce cursor size limits for MOB cursors
    96efee36453b6 drm/vmwgfx: avoid destroy_workqueue(NULL) on vkms init failure
    7e40e6120fb23 drm/vmwgfx: bound DMA command body size against suffix pointer
    dc0be7662b7b0 drm/vmwgfx: validate DRAW_PRIMITIVES header size before division
    a8434b145b1e4 drm/vmwgfx: drop dma_buf reference on foreign-fd prime import
    b79e82ea18236 drm/vmwgfx: take fman->lock around fence list mutation in fifo_down
    10460699c312e drm/vmwgfx: clamp dirty-page range with min, not max
    e479240a1e076 drm/vmwgfx: reject DX_BIND_QUERY without a DX context
    282f261cb035e drm/vmwgfx: fix guest_memory_dirty bitfield clobbered as size
    6a52f48157fa7 drm/amdkfd: hold event_mutex while checkpointing CRIU events
    6189ceca5ce75 drm/amdkfd: Handle invalid event type in CRIU event restore
    6dc0b4b39ed4f drm/amdkfd: fix uint32_t overflow in EOP ring buffer size alignment
    5f0f2ddeac738 drm/amdkfd: fix QID bit leak in pqm_create_queue()
    9e52212aff8ed drm/amdkfd: Fix missing authorization check in KFD_IOC_DBG_TRAP_DISABLE
    02647d9834073 drm/amd/display: use proper context for logging
    3c2ae9509717c drm/amd/display: Increase HDMI AV mute wait from 2 to 3 frames
    1860818feb4db drm/amd/pm: fix torn gpu metrics reads
    45ba7f091abf4 drm/amdgpu: cap GTT size to physical RAM on APUs
    d330ac90d85f3 drm/amdgpu: restore UMD profile pstate after runtime resume
    18d21c9d04b00 drm/amdgpu: move debug_vm handling to amdgpu_cs_parser_fini
    0f1ff05c58e17 drm/mediatek: ovl_adaptor: balance component registrations
    c835f2b0b7167 drm/panthor: validate firmware interface structure sizes
    2a761b9be5863 drm/panthor: reject firmware sections with oversized data
    da898bb6faf32 drm/bridge: display-connector: Fix I2C adapter resource leak
    57667eb7548fa drm/vc4: Zero the tile state data array before each BIN job
    6cd5acf6f87c0 drm/vc4: Supply the overflow slot size in BPOS, not the whole bin BO size
    58d2bb394e884 drm/dp: Read the PCON max FRL bandwidth only for HDMI DFPs
    e8b797940536c can: ctucanfd: mark error-active controller status valid
    7d1619f56a75a can: ctucanfd: handle bus error interrupts
    46fc5aecde5cd can: ctucanfd: unmap BAR0 using base address
    cae2880f8ffae can: ctucanfd: use self-test mode for PRESUME_ACK
    aa5e790bf185e can: ctucanfd: add missing MODULE_DEVICE_TABLE()
    2427ef427bdd7 can: peak_usb: validate uCAN receive record lengths
    92d0de80ca222 can: peak_usb: peak_usb_start(): fix double free of transfer buffer on URB submit error
    1acab790b7cec can: peak_usb: add bounds check for USB channel index
    2ee477e541a6d can: softing: fw_parse(): validate firmware record spans
    185cb1fa38142 can: kvaser_usb_leaf: kvaser_usb_leaf_wait_cmd(): validate received command extents
    2e90b2b406077 can: kvaser_usb: kvaser_usb_hydra_get_busparams(): fix memory leak in kvaser_usb_hydra_get_busparams()
    54258ea8d61fc can: j1939: use netdevice_tracker for j1939_{priv,session,ecu} tracking
    8604a3b81b9d0 can: j1939: transport: j1939_session_fresh_new(): initialize receive buffer
    996eb21acdc9c can: gs_usb: gs_usb_receive_bulk_callback(): resubmit URB on skb allocation failure
    c311f17c261fd can: etas_es58x: es58x_read_bulk_callback(): fix RX buffer leak on URB resubmit failure
    0b23144c59c12 can: ems_usb: validate CPC message lengths
    26cf99713a96f can: c_can: c_can_chip_config(): keep controller in init mode until bittiming is configured
    affd62f5719a7 i2c: imx: Cancel hrtimer before clearing slave pointer
    12a4f0950a158 i2c: imx: Fix slave registration race and error handling
    7a5db225ab5a6 i2c: imx: mark I2C adapter when hardware is powered down
    82233ff0e36df i2c: iproc: reset bus after timeout if START_BUSY is stuck
    19b783335d62e i2c: jz4780: Cache host clock rate at probe to prevent CCF prepare_lock deadlock
    40dd717445998 i2c: qcom-cci: drop custom suspend/resume and rely on runtime PM helpers
    d9b5419df0654 i2c: spacemit: request IRQ after controller initialization
    6a5cc2b4e6faf ice: fix memory leak in ice_lbtest_prepare_rings()
    326c89ea2685a ice: fix VF interrupts cleanup
    7e8789f5b5d8a ice: wait for reset completion in ice_resume()
    e0ba8eaef2a0d net: openvswitch: fix skb leak on flow key update failure during ct
    9c7246cc509fd net: openvswitch: fix skb leak on flow key update failure during recirculation
    90623c9499627 net: openvswitch: fix potential UAF on meter attach failure
    74b30e7ef4618 phy: zynqmp: keep SERDES scrambler and 8b/10b enabled for USB
    79a312664118f phy: zynqmp: use read-modify-write for SERDES scrambler bypass
    4211450f0fecb phy: zynqmp: fix L0_TM_DISABLE_SCRAMBLE_ENCODER mask
    013a4484f061a s390/zcrypt: Validate length for CCA ECC private key requests
    ad93a1f1a4565 s390/zcrypt: Validate length for CCA AES cipher key requests
    fbb0410986e8a s390/zcrypt: Fix missing mem scrub at clear key import in cca_clr2cipherkey()
    a57fd7fcdb63e s390/zcrypt: Fix buffer over-read in cca_cipher2protkey
    672b12940e3f1 s390/zcrypt: Fix wrong domain value verification with EP11 CPRBs
    e16e0fc54120c s390/dasd: Fix undersized format-check buffer
    86cdfd061509b s390/dasd: Fix potential NULL pointer dereference
    bd63c7879eaa8 s390/qeth: Check CAP_NET_ADMIN for private ioctls
    ef1aa7cfb8c63 s390/pci: Fix s390_pci_mmio_write syscall error return without MIO
    b039f13e095d2 power: supply: max17040: handle missing status supplier
    6d89f33a64675 power: supply: bq25890: fix the -10 C NTC lookup entry
    63d6c855b27df cpufreq: schedutil: Publish util hooks only after all sg_cpu are initialized
    437b38a08c0a8 cpufreq: powernow-k8: Fix possible memory leak in powernowk8_cpu_init()
    efbcecdecefc2 cifs: add fscache_resize_cookie() to cifs_setsize()
    466ab0c41d5f5 gpio: pch: use raw_spinlock_t for the register lock
    2e4bc8422cdee gpio: pca953x: fix cache_only and IRQ state on restore_context() failure
    1883a09a37fed i2c: amd-mp2: Unregister callback on adapter add failure
    7a91d07939e07 hwmon: (pmbus/core) notify on the hwmon device, not the i2c client
    30ae663746378 hwmon: (npcm750-pwm-fan): stop fan timer on device detach
    4ba5bf7ed50f2 sctp: prevent peer transport count overflow
    a0d1693923f41 sctp: reject stale cookies with mismatched verification tags
    2047ed09bf134 scsi: scsi_debug: Fix REPORT ZONES alloc_len underflow OOB write
    5b4d4d5a29f92 selftests/clone3: fix wild pointer access of getline due to missing init
    a0bc578641d74 selftests/mm: fix potential wild pointer access of getline due to missing init
    2e047b4171de4 spi: qcom-qspi: Correct max DMA length to avoid 64K boundary failure
    581e5166f0780 spi: spi-qpic-snand: write the feature value before executing SET_FEATURE
    c26a6477e149c tracing/filters: Fix false positive match in regex_match_full()
    cbb5ed3be9cae tracing: Check return value of __register_event() in trace_module_add_events()
    205feb72e5beb ublk: reset kernel-owned dev_info fields in ublk_ctrl_add_dev()
    ee799977d7941 vxlan: use pskb_network_may_pull() in route_shortcircuit()
    94dee751aad62 vxlan: use pskb_network_may_pull() for transmit path header pulls
    ff89415d34c3a vxlan: use neigh_ha_snapshot() in route_shortcircuit()
    adeed09eeb3b6 vxlan: unclone skb head before modifying eth header in route_shortcircuit()
    1235e017aa11c vxlan: re-fetch eth header after route_shortcircuit()
    b24ba0bbffe3e veth: convert frag_list skbs before running XDP
    3bd35a5e272a1 uprobes: Fix NULL pointer dereference in hprobe_expire()
    180ff4c81faf0 um: vector: fix use-after-free in vector_mmsg_rx()
    e4b98f9778dfc powerpc/ps3: Fix map failure path in dma_ioc0_map_pages()
    4ef801b838d85 net: pktgen: fix proc entry use-after-free
    dc3ab04220667 net: ipv6: clear suppressed fib6 rule result
    0309ebbc57000 net: bridge: stop fast-leave after deleting a port group
    332a546b4ee56 mm: memcg: initialize *locked in memcg1_oom_prepare() stub
    b11907c905fa0 mm/page_reporting: use system_freezable_wq to fix UAF during suspend
    63b361f228866 io_uring/net: initialize mshot_len for send
    4dad8ca637d44 binfmt_misc: don't let an 'F' entry pin its own instance
    840bb9c49c3e7 binfmt_misc: reject a flag character as the field delimiter
    255a758697da8 binfmt_misc: use exe_file_deny_write_access() for the interpreter clone
    fdc1d702bf300 binfmt_misc: restore write access when removing an entry
    c9dcfe6b8b713 wifi: mwifiex: use the subframe length when parsing A-MSDU TDLS frames
    bed792737b5f1 tipc: avoid use-after-free in poll trace queue dumps
    88752b811f72a of/address: Fix NULL bus dereference in of_pci_range_parser_one()
    4ae701848e4ba netfilter: ipset: do not update comments from kernel-side hash adds
    f807a63d0d956 net/smc: fix socket use-after-free during link group termination
    2060764e0f46c mshv: fix hv_input_get_system_property struct
    a60b5da05e318 ksmbd: reject repeated SMB2 NEGOTIATE requests
    b5ee5b266f833 ipvs: do not propagate one-packet flag to synced conns
    3b5aee6fcbf6b igc: remove napi_synchronize() in igc_down()
    845a9cdd9b03b igbvf: Fix leak in TX DMA error cleanup
    b10bb77e91e97 e1000: fix memory leak in e1000_probe()
    b0bdca3a49cf3 dmaengine: qcom: bam_dma: Fix command element mask field for BAM v1.6.0+
    2db4535d6af79 ALSA: usb-audio: Clamp frame size in implicit-feedback mode
    04595233e5606 ALSA: usb-audio: Fix DMA buffer out-of-bounds write when fill_max is set
    b5305a0d0bb8e ALSA: usb-audio: fix OOB write in snd_usbmidi_akai_output()
    7ba01e0d3539d ALSA: usb-audio: fix stack info leak in RME Digiface status
    cc014ebf80317 ALSA: usb-audio: fix use-after-free in ump_to_endpoint()
    79f8720029f26 ata: libata-sata: fix ata_scsi_lpm_supported() iteration
    9562ddbc6ed8f ata: libata-eh: Increase STANDBY IMMEDIATE timeout
    0a02b0c878071 ASoC: tas2562: fix broken entries in the volume lookup table
    35d5f1852e390 ASoC: tas2562: fix DVC coefficient write order
    cac7d2066b2f0 ASoC: fsl_easrc: fix m2m_init error path to use goto instead of bare return
    6df5b32881602 ASoC: fsl_asrc: fix m2m_init error path to use goto instead of bare return
    032746c2dd9a4 ALSA: ump: fix double free of out_cvts on rawmidi error
    a26a2e52736f9 ALSA: timer: Clear SNDRV_TIMER_IFLG_DEAD once the close completes
    5260e195c53e8 ALSA: seq: Fix division by zero in initialize_timer()
    2940cc3cf43c7 ALSA: pcm: wake linked drain waiters on unlink
    4969533a1b950 ALSA: lx6464es: fix period byte count for 16-bit streams
    7484669d1fbab ALSA: hda/realtek: Add quirk for TongFang X6SP45xU
    11e2953d9f4c7 ALSA: 6fire: Fix UAF at error handling during probe
    c0d3b81f703b2 afs: Fix UAF when sending a message
    d703f022a28a2 afs: Fix afs_fs_fetch_data() to subtract transferred from len
    b53face003b4d afs: Fix afs_fs_fetch_data() to set call->async
    5c7fdcbecbab2 bpf: lwt: Fix dst reference leak on reroute failure
    27cc0e603355c Bluetooth: HIDP: validate numbered report payloads
    2ebf63aa557a6 Bluetooth: HIDP: reject frames without a transaction header
    eb1d8318764de Bluetooth: hci_sync: Fix advertising data UAFs
    c569def320aa8 Bluetooth: mgmt: fix UAF in pair command cancellation
    a33bc07b4730b Bluetooth: SCO: give the socket its own sco_conn reference
    814f82f432dc6 Bluetooth: mgmt: fix pending command UAF in EIR updates
    6936b367ee6d4 Bluetooth: btmtk: Fix short read errors in btmtk_usb_uhw_reg_read()
    f14d41dbc2fdf Bluetooth: btusb: Fix short read errors in btusb_qca_send_vendor_req()
    cae0dfed5d307 audit: fix potential use-after-free in audit_del_rule()
    185c784c98094 audit: fix potential integer overflow in audit_log_n_string()
    17b412468c7a4 sctp: validate Adaptation Indication parameter length
    c0837aeace961 dibs: fix use-after-free of dmb_node in loopback attach/detach/unregister
    b878ba7e28144 KVM: s390: pci: Validate AIBV and AISB before pinning guest pages
    e137d082325bb KVM: s390: pci: Fix NULL dereference on AIBV allocation failure
    1abf9ce39a862 KVM: s390: pci: Fix missing error codes and memory unaccounting
    70871b121f81d KVM: s390: pci: Fix memory accounting for pinned/unpinned pages
    6837f0ae85fd5 KVM: s390: pci: Reject adapter interrupt forwarding if already enabled
    7668c58dcf465 KVM: SVM: Update x2APIC MSR intercepts if AVIC is inhibited while L2 is active
    5acc92947baa2 KVM: VMX: add memory clobber to asm for VMX instructions
    e768ea3a422d1 tracing/fprobe: Roll back on enable_trace_fprobe() failure
    3b2e08e0ede72 tracing/probes: Reject $arg0 in meta argument expansion
    e0fa737783b5b mm/vmstat: fold stranded per-cpu node stats when a node comes online
    126a70bf1a08d mm/hugetlb: fix list corruption in allocate_file_region_entries()
    32134cf9211b8 mm/percpu-km: fix bitmap overflow and accounting in pcpu_create_chunk()
    7d3e1d3a0dce9 fs/proc/task_mmu: fix PAGEMAP_SCAN written state for PMD holes
    c091462e46f75 selftest: fix headers in fclog.c
    9668ffe0e2a5e mm/util: don't read __page_2 for order-1 folios in snapshot_page()
    2be94d6b20789 mm: migrate_device: fix pte_pfn/pte_dirty called on non-present PTE
    2205263b1e013 fortify: Disable -Wstringop-overread in tests
    96b0aa79b0e1e pinctrl: bm1880: add missing select GENERIC_PINCONF
    5aaa06dfc10f8 erofs: cap LZMA stream pool size
    ad0ad3c228b6f pinctrl: devicetree: don't free uninitialized dev_name on error path
    93d934668047f pinctrl: microchip-sgpio: add missing select REGMAP_MMIO
    6da8f37419dd4 iommu/iommufd: Fix IOPF group ownership UAF
    564ac339c0f8b iommufd: Fix wrong hwpt passed to iommufd_auto_response_faults on replace
    ee2212b482320 iommufd/viommu: Publish a vDEVICE only after vdevice_init() succeeds
    294b464b2be7e iommufd/viommu: Release the igroup lock on the vdevice_size error path
    062aa5dcc49a9 mshv: Order pt_vp_array publish against irqfd assertion path
    f50f5d3972da0 mshv: Fix level-triggered check on uninitialized data
    fc362bfcb060e mshv: adjust interrupt control structure for ARM64
    72a90ce4918b5 mshv: Fix race in mshv_irqfd_deassign
    cfc686a1174aa iomap: add a separate bio_set for iomap_split_ioend
    9be4a66f019ea ksmbd: fix use-after-free in __close_file_table_ids()
    213b4568f6e5d ksmbd: return success for deferred final close
    cebba11df714b drm/i915/hdmi: Poll for 200 msec for TMDS_Scrambler_Status
    e51becb8f3377 qede: sync udp_tunnel ports outside qede_lock in the recovery path
    51c52e493346f spi: spi-nxp-fspi: add per-SoC SDR/DTR clock rate limits for all supported SoCs
    caeaaf23f7c36 sched/deadline: Use revised wakeup rule only for running dl_server
    5a73e8c632c31 octeontx2-pf: Set correct sequence for carrier off and tx queue stop
    b90916156b472 net: libwx: fix FDIR ATR queue mismatch for software VLAN packets
    6bf322ab07418 ptp: netc: fix potential interrupt storm caused by incorrect unbind order
    1e0dfb7e7a5d9 net: dsa: mt7530: error out on failed reads in MT7531 PHY polling
    fd9586881d478 net: dsa: mt7530: check bus->read() errors in the MDIO regmap backend
    54e07a158f7ae riscv: mm: Fix out-of-bounds page-table walk during memory hot-remove
    b297559dc2f29 accel/qaic: use sizeof(*trans_hdr) for transaction length check
    01bd01b61ad9e riscv: drop __init from vec_check_unaligned_access_speed_all_cpus
    a20a0010eb648 tracing/mmiotrace: Add NULL check for mmio_trace_array in logging functions
    9b604041f1009 tracing/mmiotrace: Reset dropped_count in mmio_reset_data()
    fc97dcb42fb46 fprobe: Fix module reference count leak on error in register_fprobe()
    84b5aa55de7c8 drm/i915/dp: Ignore the sink's DSC max FRL rate without a PCON DSC encoder
    50edffd0854fe can: isotp: check register_netdevice_notifier() error in module init
    b4f8c33593f25 net: sxgbe: check descriptor ring allocation failures
    42b87cfd9666e net: sxgbe: free TX rings on RX allocation failure
    69a258a5a322e scsi: target: Clear cmd_cnt when initial counter enrollment fails
    54c6fb24c6021 scsi: zfcp: Fix memory leak during adapter release by destroying gid_pn_req
    ff333def31476 scsi: ufs: core: Revert "Delegate the interrupt service routine to a threaded IRQ handler"
    c249cfe1d8df2 scsi: ufs: core: Avoid IRQ thread wakeup during active UIC command
    e504204489993 scsi: ufs: core: Cancel RTC work in active-active suspend
    bdd8a1297ef10 scsi: target: iblock: Fix wrong PR ops NULL check for PREEMPT/RELEASE
    613aaeeaf8cb1 net: phylink: put link_gpio if phylink_create fails
    5ea70ad040c1b x86/boot: Add volatile, clobbers and zero-length test in memcmp()
    5576afebf726c Bluetooth: hci_sync: fix hci_conn_del() use in hci_le_create_conn_sync
    e8f9fef362bab Bluetooth: hci_conn: hold conn reference in abort_conn_sync()
    de17305393ec8 Bluetooth: hci_sync: make hci_cmd_sync_run_once return -EEXIST if exists
    c618a9a5b08ea Bluetooth: btintel: Validate length before parsing diagnostics TLV
    3b921533e8aa9 Bluetooth: ISO: fix refcounting of iso_conn
    e941799c31f68 Bluetooth: ISO: ensure no dangling hcon references in iso_conn
    82e982f54f962 Bluetooth: ISO: avoid deadlocks in iso_sock_timeout
    e76a0ae6542ae Bluetooth: ISO: fix leaking sk after socket release
    4e9b5e8669b36 Bluetooth: ISO: hold sk properly in iso_conn_ready
    09a69828ae594 Bluetooth: ISO: fix CONNECTED -> CLOSED transition on shutdown/release
    cde36776cfe64 Bluetooth: ISO: Fix not updating BIS sender source address
    dfce8d30fc5be Bluetooth: ISO: validate sockaddr_iso first in iso_sock_rebind_bis()
    1fc2132950c23 Bluetooth: ISO: fix timeout vs sync_timeout typo in check_bcast_qos
    e8e9cff6d80ee Bluetooth: ISO: lock sk in iso_connect_ind
    3120664aa3330 Bluetooth: ISO: Fix data-race on iso_pi(sk) in socket and HCI event paths
    f1f167991a68f Bluetooth: HCI: Add initial support for PAST
    72d5bb1d77d7c Bluetooth: ISO: lock sk in iso_sock_getname
    58e3c5289ad23 Bluetooth: L2CAP: fix UAF in l2cap_le_connect_rsp
    63c0f396a18b7 Bluetooth: ISO: clear iso_data always when detaching conn from hcon
    4e1f45de5b313 ice: suppress DPLL errors during reset recovery
    6ebbf198e76ca idpf: Fix mailbox IRQ name leak on request failure
    d44081c61dc92 idpf: adjust TxQ ring count minimum
    ae7120102e1bb hwmon: (pmbus) Fix return value from pmbus_update_byte_data()
    276f1f180f55d net: ethernet: mtk_eth_soc: pass eth to mtk_handle_irq_rx in poll_controller
    2c148a31ca01f netfs: release readahead folios on iterator preparation failure
    291ebecdf315d netfs: handle single writeback rolling buffer allocation failure
    627826ef42080 netfs: clear PG_private_2 on copy-to-cache append failure
    b558e07708d88 wifi: mac80211: validate individual TWT params before driver setup
    f82a2ded3d7a9 net: udp_tunnel: fix memory leak in udp_tunnel_nic_unregister()
    acbf711a20669 powerpc/boot: Fix treeboot-akebono CPU node lookup check
    b407b98cf665d powerpc/boot: Fix treeboot-currituck CPU node lookup check
    3d24f2e5641b2 powerpc/boot: Fix simpleboot CPU node lookup check
    db986098f3088 rtase: fix double free of multi-frag skb on DMA map failure
    5a6b0ccb8b018 hwmon: (adt7470) Fix PWM auto temp state array and bounds check
    96ad57d317635 hwmon: (adt7470) Fix divide-by-zero TOCTOU crash in fan speed read
    ddd689bd72264 hwmon: (adt7470) Use cached PWM frequency value
    1d6b54dbe8850 hwmon: (adt7470) Fix swapped PWM3 and PWM4 auto mode masks
    d5d4034bb6f6e hwmon: (adt7470) Fix temperature alarm logic in hwmon_temp_read()
    82d65f7ef11ed hwmon: (adt7470) Fix busy-loop and I2C flooding in update thread
    3e06ff0c79ea3 hwmon: (adt7470) Fix cache updated before hardware write on I2C error
    28548ecc2b458 hwmon: (adt7470) Fix fans stuck in manual mode on I2C errors
    ae20a8a4de06a forcedeth: fix UAF of txrx_stats in nv_remove
    2e0c6761c0553 net: bridge: mrp: fix Option TLV length in MRP_Test frames
    1b722740ac5c2 hwmon: (nct6775-core) Prevent access to unsupported weight registers
    5ec5f00fc606a net: do not send ICMP/NDISC Redirects when peer allocation fails
    2332d35aaf206 hwmon: (nzxt-smart2) DMA-align output buffer
    075fce376cf85 hwmon: (lm90) Only report alarms if driver is ready
    c498adfd4c3e8 hwmon: (sht3x) Fix unaligned accesses
    08aee6d45eefc hwmon: (ltc4282) Fix reading the minimum alarm voltage
    b60e8486c04de hwmon: (ina2xx) Fix various overflow issues
    e627f4ad9eea2 hwmon: (ina2xx) Shift INA234 shunt and current registers
    fdfde077e025c hwmon: (ina2xx) Add support for INA234
    8da94361f9ae1 hwmon: (ina2xx) Make it easier to add more devices
    a42d727dae570 hwmon: (nct6775-core) Fix number of temperature registers for NCT6116
    e28d478c003d7 spi: spi-cadence: Move TX FIFO full busy-wait into FIFO
    d3337eefab626 spi: spi-cadence: supports transmission with bits_per_word of 16 and 32
    fcc3d77fef02c ASoC: tas2781: Use correct calibration data for SINEGAIN2 register
    b2851429afc5b smb: client: fix buffer leaks in SMB1 read and write
    9e24b47ef81d4 scsi: libsas: Fix HA resume deadlock and hisi_sas disk-wake race
    72815741715bd scsi: libiscsi_tcp: Bound SCSI Response data segment to the connection buffer
    3ef209ca0b4b6 scsi: libiscsi: Fix stale-data leak into the SCSI sense buffer
    8e0996418590b pinctrl-amd: Don't clear S4 wake bits at probe
    ceb00cb87a22c xsk: drain continuation descs after overflow in xsk_build_skb()
    411554cb868b8 xsk: use a smaller new lock for shared pool case
    05e283466b86e xsk: fix buffer leak in xsk_drop_skb() for AF_XDP multi-buffer Tx
    814c5b1590037 selftests/net/af_unix: test listen() rejects wrong socket states
    643ec3e24a490 selftest: af_unix: Create its own .gitignore.
    0372a52191127 selftests: af_unix: Add tests for ECONNRESET and EOF semantics
    5c170577049f9 af_unix: fix listen() succeeding on sockets in the wrong state
    b1d480fce05f8 rds: tcp: hold the RCU lock across ipv6_chk_addr() in rds_tcp_laddr_check()
    f6787fdffcae5 rds: Fix inet6_addr_lst NULL dereference when IPv6 is disabled
    4147866087fbe ASoC: SDCA: Ensure that Control Range is large enough for header
    16b553c46e347 netfilter: nft_payload: fix mask build for partial field offload
    e6f4b4b40db87 ipvs: do not mangle ICMP replies for non-first fragments
    ce96c40a049be ipvs: fix places with wrong packet offsets
    00eb23829fd08 ipvs: fix the checksum validations
    d186f77d18bdf netfilter: xt_hashlimit: validate hashtable supports XT_HASHLIMIT_RATE_MATCH
    63ba12b664a2c netfilter: nf_tables: make nft_object rhltable per table
    adf1a3ba27ad1 assoc_array: trim the final shortcut word using the current chunk end
    3d9f16c0b643c keys: make keyring key-chunk byte order agree with keyring_diff_objects()
    e9417d21a22ad keys: fix out-of-bounds read in keyring_get_key_chunk()
    6469ad3005087 KEYS: trusted: dcp: fix key_len validation and calc_blob_len() return type
    31d491f9da948 KVM: arm64: Reject guest_memfd memslots when the VM has MTE
    db1c4a8e9080f mshv: Fix sleeping under spinlock in mshv_portid_alloc
    a920ead0bc2f1 mshv: Fix duplicate GSI detection for GSI 0
    b215cb70e14c7 Drivers: hv: vmbus: Replace lockdep_hardirq_threaded() with lockdep annotation
    d397787dbc4bf Drivers: hv: Allocate the paravisor SynIC pages when required
    74d20e3cf88e4 Drivers: hv: Rename fields for SynIC message and event pages
    82cdbb6155a2c arch/x86: mshyperv: Discover Confidential VMBus availability
    6e70eba930a24 drm/mediatek: Check CRTC state before freeing
    f74554e67ccf0 netfilter: nf_conntrack_sip: widen NAT rewrite delta to s32 in sip_help_tcp()
    ec81ecd2ac093 phy: zynqmp: fix runtime PM leak on probe allocation failure
    86fb88ac8c915 phy: zynqmp: fix clock error handling in xpsgtr_phy_init()
    dff474e723ede btrfs: raid56: fix an incorrect csum skip during scrub
    4d4ef6627304a btrfs: zoned: reset meta_write_pointer on zone reset
    deddd28fd83c2 btrfs: zoned: fix deadlock between metadata writeback and transaction commit
    762561c438599 btrfs: fix leaking BTRFS_FS_STATE_REMOUNTING flag
    cfa7e27348773 of: reserved_mem: prevent OOB when too many dynamic regions are defined
    f5edba9bc69d0 ASoC: max98090: fix missing IS_ERR() before PTR_ERR() on mclk lookup
    3cbfb9b886dc1 ASoC: max98095: fix missing IS_ERR() before PTR_ERR() on mclk lookup
    3fd94b9ffe997 phy: qcom: m31-eusb2: Fix return value of init call
    9355f526c821f ata: ahci_ceva: fix error paths in ceva_ahci_platform_enable_resources()
    a0f288ebe6d8a ata: sata_mv: accept 1 or 2 resources in platform probe
    8229a53888540 selftests/seccomp: Fix pointer type mismatch build error
    99dc2c143dfc0 selftests/lkdtm: rename STACKLEAK_ERASING to KSTACK_ERASE
    094145989b31f gpio: sloppy-logic-analyzer: Fix memory leak in gpio_la_poll_probe()
    3808bab5d95ae iommu/arm-smmu-v3-iommufd: Require exactly one Stream ID for a vDEVICE
    0679c0c189d25 dmaengine: idxd: fix fdev setup failure cleanup in idxd_cdev_open()
    9086b488f2737 dmaengine: sun6i-dma: Fix reclaim descriptors while terminating DMA
    2ef9bb422dd6d pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151
    3e55d28095476 pinctrl: qcom: Unconditionally mark gpio as wakeup enable
    54a62153c765c thunderbolt: Prevent XDomain delayed work use-after-free on disconnect
    d01e88d421a6d mm/slab: prevent unbounded recursion in free path with new kmalloc type
    3e957c9b160cf lib/alloc_tag: introduce mem_alloc_profiling_permanently_disabled()
    98f57011e6cd1 HID: logitech-dj: fix wrong detection of bad DJ_SHORT output report
    bc3bba4656ad2 HID: logitech-dj: Prevent REPORT_ID_DJ_SHORT related user initiated OOB write
    df0f33293c0a3 HID: logitech-dj: Standardise hid_report_enum variable nomenclature
    302eb87651326 ALSA: hda/realtek: add quirk for HP Dragonfly Folio G3 2-in-1
    e8362523fd1b6 drm/gpusvm: publish dpagemap early to avoid device mapping leak on error
    a5cdd2407dd89 net: mpls: initialize rtm_tos in mpls_getroute()
    85b94a74a0b83 netfilter: br_netfilter: Reallocate headroom if necessary in neigh_hh_bridge()
    9bb3714e09986 kunit: tool: Terminate kernel under test on SIGINT
    d36086cd1826e kunit: tool: skip stty when stdin is not a tty
    285641eb82f0e netfilter: nf_conntrack_expect: restore helper propagation via expectation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5ad5ad94f023ec2149585f0e0bae9847fc5bb06d)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index edb3696b25e..a7051c6e47c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f3301719a9aa0f6e52a9ef3f54f7339a4241f7b9"
-SRCREV_meta ?= "7f630b9b05e171d09925e2f0edd84697ff826f93"
+SRCREV_machine ?= "f987d803014658f4fbccff70cfb9c42cc381f710"
+SRCREV_meta ?= "7b09e5efab49e4bae0c69f7f2c65b4df00e9c565"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.43"
+LINUX_VERSION ?= "6.18.44"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 894267acdf1..6f3c9b63e5a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.43"
+LINUX_VERSION ?= "6.18.44"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
-SRCREV_meta ?= "7f630b9b05e171d09925e2f0edd84697ff826f93"
+SRCREV_machine ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
+SRCREV_meta ?= "7b09e5efab49e4bae0c69f7f2c65b4df00e9c565"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index e510ff01aaf..2a515e6bfe9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "6e4861d133214a07c0b2f3e6d8de190fa2734697"
-SRCREV_machine:qemuarm64 ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
-SRCREV_machine:qemuloongarch64 ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
+SRCREV_machine:qemuarm ?= "ca14f75460e4cdd77e7f4b18e356d772236fc4bf"
+SRCREV_machine:qemuarm64 ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
+SRCREV_machine:qemuloongarch64 ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
-SRCREV_machine:qemuriscv64 ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
-SRCREV_machine:qemuriscv32 ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
-SRCREV_machine:qemux86 ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
-SRCREV_machine:qemux86-64 ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
+SRCREV_machine:qemuppc ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
+SRCREV_machine:qemuriscv64 ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
+SRCREV_machine:qemuriscv32 ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
+SRCREV_machine:qemux86 ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
+SRCREV_machine:qemux86-64 ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
-SRCREV_meta ?= "7f630b9b05e171d09925e2f0edd84697ff826f93"
+SRCREV_machine ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
+SRCREV_meta ?= "7b09e5efab49e4bae0c69f7f2c65b4df00e9c565"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7b923c78b50d2ec52690c4353e5aad8302e80599"
+SRCREV_machine:class-devupstream ?= "1efe5d048a391de3ead2804b2e7f86376c356cc5"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.43"
+LINUX_VERSION ?= "6.18.44"
 
 PV = "${LINUX_VERSION}+git"
 

