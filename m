Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE3EC5B572
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10427.1787155084907382368
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ykyDYhVY;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so949338f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155083; x=1787759883; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXyfXtsYqgJlmcFe9w2Ce0UihXNxPPgDtd7iQ+Tu+gk=;
        b=ykyDYhVYmGhnOlv8O4IkfWVBxC4O1nGxJfKWO9PmNOWqKCPO9JpEhNy9kviKapIymA
         u9G+T6cc+G7y3G6e9R1edK9rJE9+HmySL01mczMfpkhmNl7tJnxtBoSNgKcAJtY2hdZ7
         9PHWh3Dom6e0rPk9ziStiu6pPrI8V9k/f6Mtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155083; x=1787759883;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mXyfXtsYqgJlmcFe9w2Ce0UihXNxPPgDtd7iQ+Tu+gk=;
        b=qsSgSt2EvEjiAGWsQN35GRaDIbY5OQa59W9Q4ixjPhb6YJ39nZZ7Sw4dLIVTScoivy
         raMXUgY3FeSWC/zBI/fPk6oGizJvem3NumB8WmyPTgRsY3XB8iWDF1Bkvb3uX3Nv7487
         RpgXDkM1dV/13lRPZ4lRcbjdxGPTV7k/D++DRDw6jzz0vEo8gzyjS84P+dCsSt3SjJlA
         hmfDOIlfWUn/HD1zGrzg8XyzOqHIOej/sA3JZHYByJPNSOCVWAPoFUWtnTYU8y4OAD0U
         NvPXo2hvyVpOBbbNfk84bWKyzbOmnmy+3HTJLTSNLZ1hKV5WxobfpnZElCF7raRVTNtG
         EyIw==
X-Gm-Message-State: AFuF++nsw2uh2/IZ3JGMeRByuImz1dO8t5O2lzL4L38FQhRYPSfbXEAZ
	1ets3paGPMqjnAa7r6mNQ37fYuJhZRMU7YsNKO5Gagsqn8/HMPJ5DgnM7Q7XQXpKPNyGVNGrCuS
	QTAg9py0=
X-Gm-Gg: AR+sD11mnfb0hvdYQt8BhpKxuRIzEARD7MW02asU7oCJsPxvumkBefgMQ3XxlIaEn3v
	JYkluJWCi/pJoo0SMTIMdSektjy/oDpCdogI+rluu4DK0c2KS/tJZsvInPqoMQttbBWg3KZA3Ma
	Ijz1Tms0QUWaAuh9N+y3Fwk1iKVsXIe1sBMG3TH63Se+5UUolsgaObUx/s8i0cjtMZR5/npO+M/
	idUbINMhDmaS/XbJaaNOSOdOa76mVLWN/j5M+7j84ZBImKx0Vpto56+R8eV5vSh1UetGgjM56s4
	eZ3lie3jZwrL4RVualhElMRFJxHbr0acicMq18GoymP3OpGiQ4ukhzbm/P8NAbXeTHSbKEa72V9
	qgN/c8nGPwpN87T2S+B6TJYTLRLIs3aEfYbnmERhGgD/MOyyhXBSRQbXwOCFTUTgQdEiarY8L/L
	yTMGYsSZoMKcw4kL51ppCSMCahB5tw6MJAxsDpCmpGADVjly2RhS4eXZ6rxudyYkRxYnt/wYTbO
	uV3EkxgBRmM+vRTRm4o0+aFCKYhYjXRrJLjQnRg6dNwsw9zh0K7KRu8JpqIWlNU1Ywenz+IGj8/
	ZeTdXxFS6aTZwRueWgSEMgXG+ScmXSjAIq6Ck8KC
X-Received: by 2002:a05:6000:41f6:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-482b1fd3b69mr11586505f8f.14.1787155081575;
        Wed, 19 Aug 2026 08:58:01 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.58.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:58:01 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 37/37] linux-yocto/6.6: update to v6.6.147
Date: Wed, 19 Aug 2026 17:57:08 +0200
Message-ID: <7bc6442a1f83593427a502bbb924a3f91b4a0456.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243773

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    a1153c0deb44f Linux 6.6.147
    12a891c773aeb posix-cpu-timers: Prevent UAF caused by non-leader exec() race
    ae068b6761967 Linux 6.6.146
    d8a1f7420d2d5 mm: refactor mm_access() to not return NULL
    c5596480c50e0 Linux 6.6.145
    bd37e81cb475c selftests/bpf: Add simple strscpy() implementation
    8fa926d33f082 tools/testing: add linux/args.h header and fix radix, VMA tests
    2f48e29ce9dca driver core: Guard deferred probe timeout extension with delayed_work_pending()
    d329ff4039abd driver core: Fix missing jiffies conversion in deferred_probe_extend_timeout()
    8cd66ea50f3b1 jiffies: Cast to unsigned long in secs_to_jiffies() conversion
    a48236b8889e8 jiffies: Define secs_to_jiffies()
    df9757a9f5213 writeback: drop now-unnecessary rcu_barrier() in cgroup_writeback_umount()
    19ec404b079be writeback: Fix use after free in inode_switch_wbs_work_fn()
    96ae4c663f127 xfs: fix stupid compiler warning
    2ec1d9d1cd538 Bluetooth: btmtk: remove #ifdef around declarations
    88a04d42aa6c0 Bluetooth: btmtk: Fix btmtk.c undefined reference build error harder
    9f53402757671 selftests/hid: ensure CKI can compile our new tests on old kernels
    4893deede7bbc Bluetooth: 6lowpan: Fix using chan->conn as indication to no remote netdev
    6d012b730fd22 Bluetooth: hci_sync: Fix attempting to send HCI_Disconnect to BIS handle
    3d65aa0fd012e Bluetooth: hci_core: Remove check of BDADDR_ANY in hci_conn_hash_lookup_big_state
    fcd446bbe7446 ksmbd: fix durable reconnect double-bind race in ksmbd_reopen_durable_fd
    faa3ff1dd933c seqlock: fix scoped_seqlock_read kernel-doc
    90d35d2b8e47a KVM: Move kvm_io_bus_get_dev() locking responsibilities to callers
    83b22d7f7c384 Bluetooth: hci_conn: Fix null ptr deref in hci_abort_conn()
    e51042ddc0b20 Bluetooth: hci_sync: annotate data-races around hdev->req_status
    436b54dfa0fb7 Bluetooth: separate CIS_LINK and BIS_LINK link types
    3053a0be28cfa Bluetooth: hci_core: Enable buffer flow control for SCO/eSCO
    097b159d43407 btrfs: fix incorrect buffered IO fallback for append direct writes
    7236d59f58f39 btrfs: fix false IO failure after falling back to buffered write
    d0bf0a7d75bb0 exfat: preserve benign secondary entries during rename and move
    1058a40273237 exfat: move exfat_chain_set() out of __exfat_resolve_path()
    2e22bced8e7e7 exfat: add exfat_get_dentry_set_by_ei() helper
    e603c5487f365 exfat: rename argument name for exfat_move_file and exfat_rename_file
    04fe6ca144141 exfat: remove unnecessary read entry in __exfat_rename()
    fa0d1c1ff406b exfat: move free cluster out of exfat_init_ext_entry()
    744b23aa430d5 mm: do file ownership checks with the proper mount idmap
    e2baf8ea13fb4 regulator: scmi: fix of_node refcount leak in scmi_regulator_probe()
    7c90aa5cae6f5 regulator: scmi: Simplify with scoped for each OF child loop
    1526f3c9884c4 audit: fix potential integer overflow in audit_log_n_hex()
    fc7e17d2f742c audit: add audit_log_nf_skb helper function
    3ba204896c144 crypto: qat - fix restarting state leak on allocation failure
    08f1388e09886 btrfs: check and set EXTENT_DELALLOC_NEW before clearing EXTENT_DELALLOC
    e2e4042d86664 usb: gadget: f_fs: Tie read_buffer lifetime to ffs_epfile
    80cd28b56ab62 nvmet-auth: validate reply message payload bounds against transfer length
    824425c42253a nvmet: return DHCHAP status codes from nvmet_setup_auth()
    981ccee1414ba nvmet: remove superfluous initialization
    d5631081be07f usb: gadget: f_fs: initialize reset_work at allocation time
    7b20686bf065b crypto: atmel-sha204a - drop hwrng quality reduction for ATSHA204A
    9379d998f86d5 crypto: atmel - Drop explicit initialization of struct i2c_device_id::driver_data to 0
    f37d00b9d28d5 usb: typec: tcpm: Fix VDM type for Enter Mode commands
    f2a6abc670104 usb: atm: ueagle-atm: wait for pre-firmware load in .disconnect()
    6be54e2c8ea48 usb: iowarrior: remove inherent race with minor number
    ec662a8b2cde0 bpf: Allow LPM map access from sleepable BPF programs
    85f16dd3f4872 bpf: Consistently use bpf_rcu_lock_held() everywhere
    b6a481642ea19 hfs/hfsplus: fix u32 overflow in check_and_correct_requested_length
    d6be467a9eb23 hfs/hfsplus: prevent getting negative values of offset/length
    587afb06a5d1d serial: 8250_mid: Disable DMA for selected platforms
    184579feec824 serial: 8250_mid: Remove 8250_pci usage
    05e3decc55d1d HID: appleir: fix UAF on pending key_up_timer in remove()
    120306ea29e99 treewide: Switch/rename to timer_delete[_sync]()
    7456ae990a973 proc: protect ptrace_may_access() with exec_update_lock (part 1)
    42417d36cf084 seqlock: Change do_task_stat() to use scoped_seqlock_read()
    7d9295e319ec7 seqlock: Introduce scoped_seqlock_read()
    6256899c3a346 mm/slab: do not limit zeroing to orig_size when only red zoning is enabled
    a6d5ce2e1a2d7 HID: multitouch: fix out-of-bounds bit access on mt_io_flags
    7c29bc073a1f7 HID: add haptics page defines
    a018a7c37d5ae perf/x86/intel/uncore: Defer ADL global PMON enable to enable_box()
    5c3265f3252b2 writeback: fix race between cgroup_writeback_umount() and inode_switch_wbs()
    ac7b2c21f2269 writeback: Avoid contention on wb->list_lock when switching inodes
    138c692d2b2d6 proc: protect ptrace_may_access() with exec_update_lock (FD links)
    5e7fc3518a48d proc: rename proc_setattr to proc_nochmod_setattr
    ea5c9bf99f626 ksmbd: track the connection owning a byte-range lock
    875f1fde874f3 ksmbd: centralize ksmbd_conn final release to plug transport leak
    1e112c47ec5dd ksmbd: use opener credentials for FSCTL mutations
    aa3c0cab4b28c smb: client: resolve SWN tcon from live registrations
    5bb65ae76d055 smb: client: Improve unlocking of a mutex in cifs_get_swn_reg()
    8c37e4338c801 Bluetooth: L2CAP: Fix use-after-free in l2cap_sock_new_connection_cb()
    080a5a42810a4 Bluetooth: 6lowpan: fix cyclic locking warning on netdev unregister
    8daaf7f73fe99 Bluetooth: L2CAP: cancel pending_rx_work before taking conn->lock
    9e6c5169db423 netfilter: ebtables: zero chainstack array
    101358689d262 netfilter: ebtables: Use vmalloc_array() to improve code
    d22fb719654bf media: nxp: imx8-isi: Fix use-after-free on remove
    8b8358c7ce216 media: nxp: imx8-isi: use devm_pm_runtime_enable() to simplify code
    e522a5ec70b88 media: nxp: imx8-isi: Convert to platform remove callback returning void
    7a550256d68bb gpio: sch: use raw_spinlock_t in the irq startup path
    c23a7bbb0277f coresight: etb10: restore atomic_t for shared reading state
    e441cbfbd0eaa mm/shrinker: do not hold RCU lock in shrinker_debugfs_count_show()
    1455793885772 mm: shrinker: remove redundant shrinker_rwsem in debugfs operations
    91047a4396a8b Bluetooth: L2CAP: Fix UAF in channel timeout by holding conn ref
    f344a369d0380 crypto: qat - fix VF2PF work teardown race in adf_disable_sriov()
    b27ecba3196f6 staging: rtl8723bs: fix OOB reads in rtw_get_sec_ie(), rtw_get_wapi_ie(), and rtw_get_wps_attr()
    425e1db64b5a6 staging: rtl8723bs: fix spaces around binary operators
    e2d5e8e8f758f staging: rtl8723bs: core: move constants to right side in comparison
    7d41a98a0d22e PCI: Skip Resizable BAR restore on read error
    51b254181df29 PCI: Move Resizable BAR code to rebar.c
    fd0e8911770f5 PCI: Add kerneldoc for pci_resize_resource()
    0b52ed5ec3deb PCI: Fix restoring BARs on BAR resize rollback path
    56f89adc050b6 PCI: Free saved list without holding pci_bus_sem
    c3e11419a630c PCI: Prevent resource tree corruption when BAR resize fails
    fe8c701a53c28 PCI: mediatek: Fix IRQ domain leak when port fails to enable
    87129460aacb8 PCI: mediatek: Use generic MACRO for TPVPERL delay
    5bbdcf407209d PCI: mediatek: Convert bool to single quirks entry and bitmap
    81842201d74a9 PCI: controller: Use dev_fwnode() instead of of_fwnode_handle()
    4860120380916 PCI: imx6: Fix IMX6SX_GPR12_PCIE_TEST_POWERDOWN handling
    f1db80a67da92 vfio/mlx5: Fix racy bitfields and tighten struct layout
    a25bfa2a6665a PCI: altera: Fix resource leaks on probe failure
    2ee9c46fd2dcd ALSA: aoa: check snd_ctl_new1() return value
    f2315b1675bd3 iio: common: st_sensors: honour channel endianness in read_axis_data
    668e305b743fa bitops: make BYTES_TO_BITS() treewide-available
    5022f4ed5aae9 iio: pressure: mpl115: fix runtime PM leak on read error
    f88ae94a69ce7 iio: imu: inv_icm42600: fix timestamping by limiting FIFO reading
    4700ad28cfdd3 iio: imu: inv_icm42600: stabilized timestamp in interrupt
    e56fac319bb99 iio: invensense: fix timestamp glitches when switching frequency
    3822181f61903 iio: invensense: remove redundant initialization of variable period
    a5df36432d8cc iio: hid-sensor-rotation: Fix stale or zero output when reading raw values
    bd3c53b25b241 iio: imu: adis: add IRQF_NO_THREAD to non-FIFO trigger IRQ
    8e63297ca0af2 ACPI: NFIT: core: Fix possible deadlock and missing notifications
    5dfed5a90e2ca ACPI: NFIT: core: Use devm_acpi_install_notify_handler()
    c5570ebe8ec65 ACPI: bus: Introduce devm_acpi_install_notify_handler()
    f1e12d81f9cd2 ACPI: driver: Check ACPI_COMPANION() against NULL during probe
    c127dbd832bd4 ACPI: NFIT: core: Fix acpi_nfit_init() error cleanup
    ac44b4a3d6137 perf/x86/amd/brs: Fix kernel address leakage
    bd4a622786f92 mtd: rawnand: lpc32xx_slc: fail DMA transfer on completion timeout
    f51f5acaeee65 mtd: rawnand: lpc32xx_mlc: fail DMA transfers on timeout
    f3da9bc7c8c2d mtd: rawnand: fsl_ifc: return errors for failed page reads
    7ee7a77ec2f44 mmc: vub300: defer reset until cmd_mutex is unlocked
    7c0a3a73dccc9 mtd: mchp23k256: use SPI match data for chip caps
    35568121adfc5 mtd: onenand: samsung: report DMA completion timeouts
    deb5f0ae384f1 wifi: mwifiex: fix permanently busy scans after multiple roam iterations
    5d9f700511a52 wifi: mac80211: free ack status frame on TX header build failure
    d97a8f3668949 powerpc/spufs: fix out-of-bounds access in spufs_mem_mmap_access()
    6dc0c8cd9c8a8 reset: sunxi: fix memory region leak on ioremap failure
    ac6ac3d35bfc0 ipvs: reload ip header after head reallocation
    a3f0d5b605cd5 ipvs: fix more places with wrong ipv6 transport offsets
    d5db3439ee8d1 memstick: ms_block: reject a card that reports too many blocks
    9735bc3aacc28 macsec: fix promiscuity refcount leak in macsec_dev_open()
    75866e80e31e9 llc: fix SAP refcount leak when creating incoming sockets
    68c5a2a19987c Bluetooth: btrtl: validate firmware patch bounds
    d573250d22840 net: openvswitch: reject oversized nested action attrs
    e1f485f5ea8cd regulator: ltc3676: Fix incorrect IRQSTAT bit offsets
    a02b52fe54f7b wifi: mac80211: fix memory leak in ieee80211_register_hw()
    eb7474d0253bb wifi: rt2x00: avoid full teardown before work setup in probe
    8bf359e2547e8 powerpc/pseries: fix memory leak on krealloc failure in papr_init
    87af3ebc112fb pmdomain: imx: Fix i.MX8MP VC8000E power up sequence
    5c5d58fff3401 pmdomain: imx: Fix i.MX8MP power notifier
    02f67c4f88be8 cgroup/cpuset: rebind mm mempolicy to effective_mems, not mems_allowed
    3c693635bb7b3 tracing/osnoise: Call synchronize_rcu() when unregistering
    b5f92cc4e24a2 riscv: Prevent NULL pointer dereference in machine_kexec_prepare()
    f16866c626568 drbd: reject data replies with an out-of-range payload size
    f21fa533a3ed1 macsec: don't read an unset MAC header in macsec_encrypt()
    9e36602cbec55 ipvs: reset full ip_vs_seq structs in ip_vs_conn_new
    9cb5ac594ca76 ipvs: use parsed transport offset in SCTP state lookup
    c7881b6088276 llc: fix SAP refcount leak in llc_ui_autobind()
    b91e5248dd7af mac802154: remove interfaces with RCU list deletion
    036bc56610607 s390/monwriter: Reject buffer reuse with different data length
    5da5cf48a432e riscv: probes: save original sp in rethook trampoline
    76392d35c8df4 hwmon: (asus_atk0110) Check package count before accessing element
    2b822df8e498a net: wwan: iosm: bound device offsets in the MUX downlink decoder
    566d5bf1e27c8 ata: pata_pxa: Fix DMA channel leak on probe error
    07c05601a9a8e orangefs: keep the readdir entry size 64-bit in fill_from_part()
    1b7687fc56c9b tracing/probes: Fix double addition of offset for @+FOFFSET
    6ee5a7665a908 net/sched: sch_taprio: Replace direct dequeue call with peek and qdisc_dequeue_peeked
    86a61e46a1919 net/sched: sch_multiq: Replace direct dequeue call with peek and qdisc_dequeue_peeked
    6523daa6852b1 net: lan743x: Initialize eth_syslock spinlock before use
    ffb13fe1947bc fsl/fman: Free init resources on KeyGen failure in fman_init()
    e7fd81e9fb1fe hwmon: (occ) unregister sysfs devices outside occ lock
    b74f293e5f380 net: liquidio: fix BAR resource leak on PF number failure
    22f864f7471a5 hwmon: (w83793) remove vrm sysfs file on probe failure
    43d49fa630edf hwmon: (w83627hf) remove VID sysfs files on error and remove
    22fa00dac08c7 rtc: mpfs: fix counter upload completion condition
    5576ee19a6a4a bnx2x: fix potential memory leak in bnx2x_alloc_mem_bp()
    54d73f18f8919 espintcp: use sk_msg_free_partial to fix partial send
    e8a916579e427 LoongArch: Fix missing dirty page tracking in {pte,pmd}_wrprotect()
    f2423da55976e batman-adv: clean untagged VLAN on netdev registration failure
    e6640923afee6 batman-adv: ensure minimal ethernet header on TX
    f19259395b44a batman-adv: retrieve ethhdr after potential skb realloc on RX
    29dbd6e27d0f8 net/sched: sch_teql: move rcu_read_lock()/spin_lock() from _bh variants
    1fe2643d0b24c ieee802154: ca8210: fix pointer truncation in kfifo on 64-bit
    b9071dc7889be ieee802154: ca8210: fix cas_ctl leak on spi_async failure
    66f3053070c0b ieee802154: allow legacy LLSEC ADD/DEL ops to pass strict validation
    5abe94a205539 ieee802154: admin-gate legacy LLSEC dump operations
    1d4d8ee002083 net: ip6_gre: require CAP_NET_ADMIN in the device netns for changelink
    983cc4aa7e6f6 net: ipip: require CAP_NET_ADMIN in the device netns for changelink
    33fd93961557e net: ip_vti: require CAP_NET_ADMIN in the device netns for changelink
    c64b9ae7eb97e net: ip6_vti: require CAP_NET_ADMIN in the device netns for changelink
    f2ff634d95f8a net: ena: clean up XDP TX queues when regular TX setup fails
    2400c4b05d588 net/sched: act_ct: preserve tc_skb_cb across defragmentation
    fd0b939ebd1ee net: ixp4xx_hss: fix duplicate HDLC netdev allocation
    fd01247bde1ad net: wwan: t7xx: destroy DMA pool on CLDMA late init failure
    388ccffbd2e7e net: sit: require CAP_NET_ADMIN in the device netns for changelink
    f916210f9d64e gpios: palmas: add .get_direction() op
    0ea41686d72f6 gpio-f7188x: Add support for NCT6126D version B
    998f66e9ce320 cpu: hotplug: Bound hotplug states sysfs output
    7a68257b90d8a cpu: hotplug: Preserve per instance callback errors
    cff8281bacd28 posix-cpu-timers: Use u64 multiplication in update_rlimit_cpu()
    218cc15a4c907 net/mlx5e: macsec: fix use-after-free of metadata_dst on RX SC delete
    08bf4b6ee2898 Input: ims-pcu - fix type confusion in CDC union descriptor parsing
    129187ec3f868 Input: ims-pcu - fix race condition in reset_device sysfs callback
    e3f93d63dcd48 Input: ims-pcu - fix potential infinite loop in CDC union descriptor parsing
    3fd7c0ace2453 Input: ims-pcu - fix out-of-bounds read in ims_pcu_irq() debug logging
    477149c848d40 Input: ims-pcu - fix DMA mapping violation in line setup
    f7f5afeed31ba Input: ims-pcu - add response length checks
    aa1885f87e60c Input: ims-pcu - validate control endpoint type
    ae05b7a600c07 Input: ims-pcu - release data interface on disconnect
    6a6c373e6a82e Input: ims-pcu - fix use-after-free and double-free in disconnect
    8c689a8f22922 scsi: elx: efct: Fix I/O leak on unsupported additional CDB
    62cf39a9770a6 scsi: elx: efct: Fix refcount leak in efct_hw_io_abort()
    a040004846f1f scsi: target: core: Fix iSCSI ISID use-after-free in REGISTER AND MOVE
    6ca5de8782e67 scsi: target: Bound PR-OUT TransportID parsing to the received buffer
    fa588f2840110 scsi: xen: scsiback: Free unsubmitted command instead of double-putting it
    18d4f86816592 scsi: xen: scsiback: Free the command tag on the TMR submit-failure path
    5594ee5a2653b scsi: sg: Report request-table problems when any status is set
    c3f4e40766154 scsi: lpfc: Fix memory leak in lpfc_sli4_driver_resource_setup()
    a61de4d7e22a9 scsi: hpsa: Fix DMA mapping leak on IOACCEL2 reset path
    29b8d12278d20 dm-verity: increase sprintf buffer size
    1f04b390add2e dm-verity: fix a possible NULL pointer dereference
    cf9feed8c131e dm-integrity: don't increment hash_offset twice
    259ce9e3fc3a3 dm_early_create: fix freeing used table on dm_resume failure
    9964ae466c589 dm-stats: fix merge accounting
    04ca47b6768d8 dm-stats: fix dm_jiffies_to_msec64
    d05e0edfecf52 dm-log: fix a bitset_size overflow on 32bit machines
    29536a9ff146d dm-ioctl: fix a possible overflow in list_version_get_info
    ae7fac9cb5bb0 dm-bufio: fix wrong count calculation in dm_bufio_issue_discard
    7e1822f83c5a1 dm era: fix out-of-bounds memory access for non-zero start sector
    3dc9ae1029320 dm thin metadata: fix metadata snapshot consistency on commit failure
    a887bf1f0de8e dm thin metadata: fix superblock refcount leak on snapshot shadow failure
    cf419c869e0d0 net: sparx5: unregister blocking notifier on init failure
    8b719cef5ac30 bpf: Add missing access_ok call to copy_user_syms
    c3fd6f28c7ce1 bpf,fork: wipe ->bpf_storage before bailouts that access it
    f53bdab85e64e can: bcm: add missing rcu list annotations and operations
    0f6f9f95294b4 can: bcm: fix lockless bound/ifindex race and silent RX_SETUP failure
    4177762f70646 can: bcm: defer rx_op deallocation to workqueue to fix thrtimer UAF
    6280eda96e070 can: isotp: use unconditional synchronize_rcu() in isotp_release()
    a02e1d8f19132 can: esd_usb: kill anchored URBs before freeing netdevs
    7c96581169c9d nvmet-rdma: handle inline data with a nonzero offset
    a257b41ddfe9e sctp: validate STALE_COOKIE cause length before reading staleness
    49f6705d80b5e spi: uniphier: Fix completion initialization order before devm_request_irq()
    64b4197d013bf time: Fix off-by-one in compat settimeofday() usec validation
    9c513dabd4540 tpm: Make the TPM character devices non-seekable
    0084fd985fe28 tpm: fix event_size output in tpm1_binary_bios_measurements_show
    e9c90756f10da xfrm: xfrm_interface: require CAP_NET_ADMIN in the device netns for changelink
    9257c256efa27 xfrm: use compat translator only for u64 alignment mismatch
    311011f8cc206 xen/gntdev: fix error handling in ioctl
    c3f2f080b21f8 ice: fix ice_init_link() error return preventing probe
    5290a52533e09 i2c: mlxbf: Fix use-after-free in mlxbf_i2c_init_resource()
    6239860c5581f i2c: mediatek: fix WRRD for SoCs without auto_restart option
    1f45a48035bdb hwmon: (ltc2992) add missing 'select REGMAP_I2C' to Kconfig
    b1d16cecefbcd ksmbd: fix integer overflow in set_file_allocation_info()
    ecf3107bfa717 smb: client: use kvzalloc() for megabyte buffer in simple fallocate
    9a14297744686 platform/x86/amd/pmc: Add delay_suspend module parameter
    b977cfb193aad platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops
    1ec0f176f793e platform/x86/amd/pmc: Check for intermediate wakeup in function
    3ee0f478bb29b dmaengine: dw-edma: Add spinlock to protect DONE_INT_MASK and ABORT_INT_MASK
    8f0f5de109111 dmaengine: tegra: Fix burst size calculation
    6b068a97958aa tpm: tpm_tis_spi: Use wait_woken() in wait_for_tmp_stat()
    424130169dc03 irqchip/crossbar: Use correct index in crossbar_domain_free()
    44c6abf5d823d mtd: maps: vmu-flash: fix NULL pointer dereference in initialization
    dc341272cf8e1 mtd: spi-nor: swp: Improve locking user experience
    0d3766fecd9b2 fpga: microchip-spi: fix zero header_size OOB read in mpf_ops_parse_header()
    2b3b4e5ff5a58 net: thunderbolt: Fix frags[] overflow by bounding frame_count
    7a563dbb3d8d5 bus: mhi: ep: Protect mhi_ep_handle_syserr() in the error path
    b2f6220e929b2 fpga: dfl: add bounds check in dfh_get_param_size()
    38c1ef7ce50eb ocfs2: reject non-inline dinodes with i_size and zero i_clusters
    b363e2c77de8e ocfs2: reject dinodes whose i_rdev disagrees with the file type
    a5b555bcabbb0 ocfs2: reject dinodes with non-canonical i_mode type
    7da7e4ac21895 ocfs2: add journal NULL check in ocfs2_checkpoint_inode()
    f14aaaa130356 ocfs2: fix NULL h_transaction deref in ocfs2_assure_trans_credits
    e281d892ce587 ocfs2: avoid moving extents to occupied clusters
    3da4eb15c7b42 mtd: rawnand: fix condition in 'nand_select_target()'
    f62a1f245a716 net/9p: fix infinite loop in p9_client_rpc on fatal signal
    afddc64840351 mtd: rawnand: pl353: fix probe resource allocation
    6ab9356517c7b ocfs2: use kzalloc for quota recovery bitmap allocation
    17400e4d9dd57 scsi: sas: Skip opt_sectors when DMA reports no real optimization hint
    e1919423f1b92 scsi: smartpqi: Use shost_to_hba() in pqi_scan_finished()
    a5a682b016ef5 9p: skip nlink update in cacheless mode to fix WARN_ON
    200b8bc5b6065 mtd: slram: remove failed entries from the device list
    511a60e71aec3 mm/mm_init: fix uninitialized struct pages for ZONE_DEVICE
    31bfda8ca7745 proc: only bump parent nlink when registering directories
    50a753171d255 mm/damon/sysfs-schemes: put stats for scheme_add_dirs() internal error
    a8c0592a80e95 mm/damon/sysfs-schemes: fix dir put orders in access_pattern_add_dirs()
    51afb7da697b6 riscv: cacheinfo: Fix node reference leak in populate_cache_leaves
    3446ffb5d03c3 mips: sched: Fix CPUMASK_OFFSTACK memory corruption
    e44ad91e9f75f power: supply: charger-manager: fix refcount leak in is_full_charged()
    bd77afca2ae9b ntfs3: fix out-of-bounds read in decompress_lznt
    b232eb5c9fe11 ntfs3: validate split-point offset in indx_insert_into_buffer
    53c5f3b2da377 ntfs3: bound to_move in indx_insert_into_root before hdr_insert_head
    7ac4c86915c24 ntfs3: cap RESTART_TABLE free-chain walker at rt->used
    429d653ca641d fs/ntfs3: bound NTFS_DE view.data_off in UpdateRecordData{Root,Allocation}
    96fb64f9da86f fs/ntfs3: add depth limit to indx_find_buffer to prevent stack overflow
    57c071e2c4f30 fs/ntfs3: validate lcns_follow in log_replay conversion
    546518468e6c9 fs/ntfs3: bound attr_off in UpdateResidentValue against data_off
    9b7c28d8c61bd fs/ntfs3: bound copy_lcns dp->page_lcns[] index in analysis pass
    4c8aac931c1cd fs/ntfs3: bound DeleteIndexEntryAllocation memmove length
    af08e689ec260 fs/ntfs3: fix syncing wrong inode on DIRSYNC cross-directory rename
    c31067bf5c8dc mm/damon/core: make charge_addr_from aware of end-address exclusivity
    700c225d829a1 power: supply: cpcap-battery: Fix missing nvmem_device_put() causing reference leak
    27857db30c985 MIPS: DEC: Ensure 32-bit stack location for o32 prom_printf()
    fadd0af657f35 MIPS: ip22-gio: fix device reference leak in probe
    22c4c06006721 MIPS: ip22-gio: fix kfree() of static object
    9d19995c61977 MIPS: ip22-gio: fix gio device memory leak
    65104d6eb43f0 remoteproc: qcom: Fix leak when custom dump_segments addition fails
    4a1148f2739d5 SUNRPC: Bound-check xdr_buf_to_bvec() stores before writing
    7ce4c23e783e7 lockd: Plug nlm_file refcount leak on cached nlm_do_fopen() failure
    ddfbd816273b4 lockd: Plug nlm_file leak when nlm_do_fopen() fails
    0d8ceb3988414 sunrpc: wait for in-flight TLS handshake callback when cancel loses race
    f3b55945dd99f sunrpc: pin svc_xprt across the asynchronous TLS handshake callback
    0b0d9404951aa nvdimm/btt: Free arena sub-allocations on discover_arenas() error path
    5804e6a6912b5 nvdimm/btt: Free arenas on btt_init() error paths
    fb9b49618ed72 jbd2: fix integer underflow in jbd2_journal_initialize_fast_commit()
    d141d9b769bcd Bluetooth: SCO: hold sk properly in sco_conn_ready
    44a203afaedb4 Bluetooth: SCO: fix sleeping under spinlock in sco_conn_ready
    6df7b63afb666 HID: playstation: validate num_touch_reports in DualShock 4 reports
    614b6c5ad99c6 mfd: tps6586x: Fix OF node refcount
    9015475f766b3 cifs: invalidate cfid on unlink/rename/rmdir
    604bd5042fbcd batman-adv: tt: prevent TVLV OOB check overflow
    d2148aeee9319 batman-adv: frag: fix primary_if leak on failed linearization
    740542f11bf8c batman-adv: frag: free unfragmentable packet
    5ae95378caa59 batman-adv: fix VLAN priority offset
    067e413eec2e6 batman-adv: tt: avoid request storms during pending request
    ddfea9b5089c7 batman-adv: dat: fix tie-break for candidate selection
    3c62694c31f04 batman-adv: dat: ensure accessible eth_hdr proto field
    ab2bac47a0263 batman-adv: bla: reacquire gw address after skb realloc
    3404be97b940a batman-adv: dat: acquire ARP hw source only after skb realloc
    ed90eb5c68420 batman-adv: access unicast_ttvn skb->data only after skb realloc
    afac8096bde49 batman-adv: gw: acquire ethernet header only after skb realloc
    27206bb57c47b s390/perf_cpum_cf: Add missing array_index_nospec() to __hw_perf_event_init()
    5be478c1e0898 perf/x86/amd/lbr: Fix kernel address leakage
    7ab30a12b88bf x86/boot: Reject too long acpi_rsdp= values
    9a77a7639dfdc x86/boot: Validate console=uart8250 baud rate to fix early boot hang
    db938eb9a3c13 tools/power/x86/intel-speed-select: Harden daemon pidfile open
    a3e340d506c10 mfd: sm501: Fix reference leak on failed device registration
    8bf529571cca6 leds: uleds: Fix potential buffer overread
    30500acfc43ef selinux: fix incorrect execmem checks on overlayfs
    e507633bf76bc selinux: check connect-related permissions on TCP Fast Open
    bb29a484dee0b soc: fsl: qe: panic on ioremap() failure in qe_reset()
    f747a76004dac soc: ti: k3-ringacc: Fix access mode for k3_ringacc_ring_pop_tail_io/proxy
    edc7267b59a46 gpu: host1x: Fix device reference leak in host1x_device_parse_dt() error path
    c141f69d0a0fb netfilter: bridge: fix stale prevhdr pointer in br_ip6_fragment()
    a842dab87cab2 netfilter: xt_nat: reject unsupported target families
    bca4bfb9cc5c5 netfilter: ecache: fix inverted time_after() check
    7bdc3c0985ecf netfilter: nf_conncount: fix zone comparison in tuple dedup
    cd0d7bbc027b4 netfilter: nf_conntrack_reasm: guard mac_header adjustment after IPv6 defrag
    57e4e29644ec0 netfilter: nf_nat_sip: reload possible stale data pointer
    3f03a2d225c66 netfilter: nf_queue: pin bridge device while NFQUEUE holds fake dst
    fac2fdac3baad netfilter: xt_cluster: reject template conntracks in hash match
    893319e9950d0 netfilter: nfnl_cthelper: apply per-class values when updating policies
    2b70f61f569bb netfilter: nf_conntrack_irc: fix parse_dcc() off-by-one OOB read
    ec369eac0795c ASoC: qcom: q6apm: fix NULL pointer dereference in graph_callback
    48b6c39883637 ASoC: mediatek: mt8183: Release reserved memory on cleanup
    989cbe8cc86f4 ASoC: mediatek: mt8192: Release reserved memory on cleanup
    ee781058cd4d7 ASoC: SOF: ipc3-control: Validate size in snd_sof_update_control
    1adde1941bba7 ASoC: SOF: ipc3-control: Fix heap overflow in bytes_ext put/get
    8d16e5bc78478 fbdev: tridentfb: fix potential memory leak in trident_pci_probe()
    6ca48f23ce61a fbdev: nvidia: fix potential memory leak in nvidiafb_probe()
    124df55c7201d fbdev: vesafb: fix memory leak in vesafb_probe()
    d21e6747f3f68 fbdev: carminefb: fix potential memory leak in alloc_carmine_fb()
    dfbb1a695d889 fbdev: tdfxfb: fix potential memory leak in tdfxfb_probe()
    c53fdf7ee65af fbdev: uvesafb: fix potential memory leak in uvesafb_probe()
    0d0fa8425b296 fbdev: s3fb: fix potential memory leak in s3_pci_probe()
    e1ecbaeec5fbf fbdev: i740fb: fix potential memory leak in i740fb_probe()
    f4dacbfd885f3 fbdev: radeon: fix potential memory leak in radeonfb_pci_register()
    200375909216b fbdev: sm712: Fix operator precedence in big_swap macro
    2952767e399e2 fbdev: hecubafb: fix potential memory leak in hecubafb_probe()
    4ce94f9e3bfb3 fbdev: broadsheetfb: fix potential memory leak in broadsheetfb_probe()
    01708cf3dca2f fbdev: metronomefb: fix potential memory leak in metronomefb_probe()
    8e9f7a95279bf KVM: x86: Ignore pending PV EOI if the vCPU has since disabled PV EOIs
    3ef3190e30601 KVM: s390: pci: Fix handling of AIF enable without AISB
    654be81c4c637 KVM: arm64: vgic: Check the interrupt is still ours before migrating it
    6e69317cd44a2 KVM: s390: pci: Fix GISC refcount leak on AIF enable failure
    1237c24ea3ceb arm64: dts: qcom: sdm630: describe adsp_mem region properly
    cedcabcd3c826 arm64: fpsimd: Fix type mismatch in sve_{save,load}_state()
    9433578bff9c1 net: ife: require ETH_HLEN to be pullable in ife_decode()
    513f820b3f0cf net: atm: reject out-of-range traffic classes in QoS validation
    d0597074e9973 net: qrtr: fix 32-bit integer overflow in qrtr_endpoint_post()
    7c6d2d2baeb1e ASoC: SOF: topology: validate vendor array size before parsing
    0dce240145f47 ASoC: SOF: ipc3-control: Fix TOCTOU in bytes_put and bytes_get
    89a2309a9eec8 ASoC: SOF: ipc3-control: Use overflow checks in control_update size calc
    266f936db83ae ASoC: SOF: ipc4-control: Fix TOCTOU in sof_ipc4_bytes_put
    d7e7c813834c6 vduse: Fix race in vduse_dev_msg_sync and vduse_dev_read_iter
    220d41bdce41f mlxsw: fix refcount leak in mlxsw_sp_vrs_lpm_tree_replace()
    8b3350eacd9df mlxsw: fix refcount leak in mlxsw_sp_port_lag_join()
    160045fc943f6 smb: client: fix overflow in passthrough ioctl bounds check
    212c59e5e4168 octeontx2-af: fix VF bringup affecting PF promiscuous state
    6c97f394bb15f net/mlx5: Fix L3 tunnel entropy refcount leak
    75a59698886cc selftests/net: fix EVP_MD_CTX leak in tcp_mmap
    29a7953e9adea regulator: core: regulator_lock_two() should test for EDEADLK not EDEADLOCK
    889374b8e4a60 dm era: fix NULL pointer dereference in metadata_open()
    79cd550f8c884 SUNRPC: pin upper rpc_clnt across the TLS connect_worker
    ce4d29a99878c SUNRPC: release lower rpc_clnt if killed waiting for XPRT_LOCKED
    d64b6be5740ce cifs: validate DFS referral string offsets
    25e7c0fc304bd s390/zcrypt: Remove the empty file
    9bc9b95aee2b2 ipvs: ensure inner headers in ICMP errors are in headroom
    accee8e53a760 ipvs: fix PMTU for GUE/GRE tunnel ICMP errors
    d45f73c274435 ipvs: use parsed transport offset in TCP state lookup
    946e09454b1a0 ipvs: pass parsed transport offset to state handlers
    9815e834f5ff8 ipv6: mcast: Fix potential UAF in MLD delayed work
    8374a462c74ec ipv6: mcast: Replace locking comments with lockdep annotations.
    40a1e998cb266 ipv4: igmp: Fix potential UAF in igmp_gq_start_timer()
    75a7e03ad7336 octeontx2-pf: check DMAC extraction support before filtering
    336c1e414fc0e net/sched: cake: reject overhead values that underflow length
    ff431529d3773 net: usb: lan78xx: disable VLAN filter in promiscuous mode
    0e75abbc36ed1 net: usb: lan78xx: move functions to avoid forward definitions
    0867b0f2513eb net/tls: Consume empty data records in tls_sw_read_sock()
    dbcb8635b1eb7 ring-buffer: Fix event length with forced 8-byte alignment
    f80b4afe893df Bluetooth: bpa10x: avoid OOB read of revision string in bpa10x_setup()
    85f5e3a9885a3 Bluetooth: ISO: exclude RFU bits from ISO_SDU_Length
    5aabbd01ac315 Bluetooth: MGMT: Fix adv monitor add failure cleanup
    ba1f1ef6522e6 Bluetooth: 6lowpan: hold L2CAP conn across debugfs control
    dd54267a70e32 amt: fix size calculation in amt_get_size()
    647b19e5cc145 net/smc: fix UAF in smc_cdc_rx_handler() by pinning the socket
    0d8532a5e972a net/sched: act_pedit: fix TOCTOU heap OOB write in tc offload
    3868c3244369a net: qualcomm: rmnet: validate MAP frame length before ingress parsing
    0bf78df2d3ecb qede: fix off-by-one in BD ring consumption on build_skb failure
    786456d0a244b net: microchip: vcap: fix races on the shared Super VCAP block
    24c77044cdfcf net/mlx5e: Fix HV VHCA stats agent registration race
    5b927dcec5f10 net/mlx5e: Fix HV VHCA stats zero-sized buffer allocation
    8ace320ac4416 netfilter: xt_connmark: reject invalid shift parameters
    2fd89a50a9783 netfilter: ip6tables: mark malformed IPv6 extension headers for hotdrop
    5da915fc159c6 netfilter: xt_rateest: fix u64 truncation in xt_rateest_mt()
    0a8b7a6d76377 netfilter: xt_u32: reject invalid shift counts
    2a99224c12082 gue: validate REMCSUM private option length
    685e92934f11d net: usb: net1080: validate packet_len before pad-byte access in rx_fixup
    6a3e06f1d1185 selftests/hid: Cover hid_bpf_get_data() size overflow
    56558ef8eb2f8 selftests/hid: convert the hid_bpf selftests with struct_ops
    4dee51c96e870 selftests/hid: force using our compiled libbpf headers
    b52c523eb8fc9 selftests/hid: do not manually call headers_install
    75e9e9f1bc6ca selftests/hid: ensure we can compile the tests on kernels pre-6.3
    6a10e76a56f81 arm64/mm: Optimize TLB flush in unmap_hotplug_[pmd|pud]_range()
    33833e83cf552 arm64/mm: convert ptep_clear() to ptep_get_and_clear()
    3be7e80fc59b2 arm64/mm: convert set_pte_at() to set_ptes(..., 1)
    3ea68f5ec9bfe arm64/mm: convert READ_ONCE(*ptep) to ptep_get(ptep)
    c973d53bcd420 HID: core: Fix OOB read in hid_get_report for numbered reports
    a02d5d7ad7ae5 HID: picolcd: prevent NULL pointer dereference in picolcd_send_and_wait()
    9eae03f0df96b ata: sata_gemini: unwind clocks on IDE pinctrl errors
    a11ebaab50d27 minix: avoid overflow in bitmap block count calculation
    598f8ba4e8818 afs: Fix unchecked-length string display in debug statement
    1607075220cf5 afs: Fix the volume AFS_VOLUME_RM_TREE is set on
    bef5514f6b6cb afs: Fix vllist leak
    5a39b145a8fb4 afs: Fix callback service message parsers to pass through -EAGAIN
    ac428553b5a3d afs: use kvfree() to free memory allocated by kvcalloc()
    9ad9016e3333c afs: Fix error code in afs_extract_vl_addrs()
    bac8fb0d60254 fs: refuse O_TMPFILE creation with an unmapped fsuid or fsgid
    d3b5adfa2f008 net/sched: hhf: clear heavy-hitter state on reset
    fb64c5a232808 pinctrl: meson: restore non-sleeping GPIO access
    1bc19683c8bbb gpio: timberdale: Return -ENOMEM on dynamic memory allocation in probe
    fb978d7205270 ksmbd: fix use-after-free of fp->owner.name in durable handle owner check
    515195c5e508c smb: move some duplicate definitions to common/cifsglob.h
    16fb65ec15fe7 ksmbd: reject undersized DACLs before parsing ACEs
    17efa598efd94 net/sched: act_bpf: use rcu_dereference_bh() to read the filter
    d04abfe08e4f8 cxgb4: Fix decode strings dump for T6 adapters
    97cc510eafb6e virtio_net: disable cb when NAPI is busy-polled
    e6b674dc341c6 irqchip/ts4800: Fix missing chained handler cleanup on remove
    57a48d17a789c irqchip/gic-v3-its: Fix OF node reference leak
    284928533c7ed tracing: eprobe: read the complete FILTER_PTR_STRING pointer
    63d5fd8f5e2db tracing/events: Fix to check the simple_tsk_fn creation
    4c40eec06eeac bridge: stp: Fix a potential use-after-free when deleting a bridge
    735567bde7401 net/sched: sch_teql: Introduce slaves_lock to avoid race condition and UAF
    e8c714acf5573 net: gianfar: dispose irq mappings on probe failure and device removal
    d2c37f26d1a37 net: phy: sfp: free mii_bus in sfp_i2c_mdiobus_destroy
    573418f7ea8f8 usbnet: gl620a: fix out-of-bounds read in genelink_rx_fixup()
    2106bf4056858 hwmon: (pmbus) Fix passing events to regulator core
    39a581bd64a0e hwmon: adm1275: Prevent reading uninitialized stack
    8c693f988ce1b MIPS: DEC: Ensure RTC platform device deregistration upon failure
    dcb0940c3df1e sctp: fix SCTP_RESET_STREAMS stream list length limit
    f55276160ffad net: enetc: check the number of BDs needed for xdp_frame
    e30af53dca803 qede: fix out-of-bounds check for cqe->len_list[]
    804bb969f194c seg6: validate SRH length before reading fixed fields
    a05c848a94bbc gpio: htc-egpio: use managed gpiochip registration
    f0320c623f4d4 gpio: mvebu: fail probe if gpiochip registration fails
    0567b5bcbd793 spi: sh-msiof: abort transfers when reset times out
    edce0203a4fc0 tracing: probes: fix typo in a log message
    cde84429e0fae dt-bindings: net: renesas,ether: Drop example "ethernet-phy-ieee802.3-c22" fallback
    d805c95580b23 ASoC: fsl_asrc_dma: fix eDMA maxburst misalignment with channel count
    1596d8ecb6680 net: ethernet: sunplus: spl2sw: fix phy_node refcount leak in remove
    a63eaf7605d15 net: sungem: fix probe error cleanup
    be626ac1faadd net: mvneta: re-enable percpu interrupt on resume
    aa6e2b431070b rtc: cmos: unregister HPET IRQ handler on probe failure
    ebe5ad5937dbc rtc: ds1307: Fix off-by-one issue with wday for rx8130
    0d6d5194d9bba smb/client: preserve errors from smb2_set_sparse()
    ea8e946b09baf ipv6: fix error handling in disable_policy sysctl
    2474255868717 ipv6: fix error handling in forwarding sysctl
    7469cebbd8107 ipv6: fix error handling in ignore_routes_with_linkdown sysctl
    bcf9266fc3cd1 ipv6: fix error handling in disable_ipv6 sysctl
    447d493034a9c net/sched: cls_api: Handle TC_ACT_CONSUMED in tcf_qevent_handle
    83090f5e7b547 veth: fix NAPI leak in XDP enable error path
    fc62bfd30d30a net: dsa: sja1105: round up PTP perout pin duration
    3876318ea54e8 net, bpf: check master for NULL in xdp_master_redirect()
    bd9e5220ffb15 alpha/PCI: Fix __pci_mmap_fits() overflow for zero-length BARs
    4de5ff924c0a8 alpha/PCI: Add security_locked_down() check to pci_mmap_resource()
    4e5ed2a7dda54 NTB: epf: Fix doorbell bitmask and IRQ vector handling
    3fb009699812a NTB: epf: Report 0-based doorbell vector via ntb_db_event()
    ba1a84de32848 NTB: epf: Make db_valid_mask cover only real doorbell bits
    efc17b9240d82 netfilter: nft_compat: ebtables emulation must reject non-bridge targets
    1655ca28c5b6d netfilter: nft_synproxy: stop bypassing the priv->info snapshot
    abef7f817217f netfilter: nf_conncount: prevent connlimit drops for early confirmed ct
    87f7a720de254 netfilter: nf_nat: avoid invalid nat_net pointer use on failed nf_nat_init()
    6b44c6660aa1c bpf: Disable xfrm_decode_session hook attachment
    b3b4719429d5c bpf, lsm: Add disabled BPF LSM hook list
    49eaf14032013 ipv4: fib: Don't ignore error route in local/main tables.
    302d57ed78728 ipv6: Fix null-ptr-deref in fib6_nh_mtu_change().
    7470511d085af ksmbd: fix use-after-free of conn->preauth_info in concurrent SMB2 NEGOTIATE
    52c73b6992b46 rtc: msc313: fix NULL deref in shared IRQ handler at probe
    3186a301d65d5 i40e: Fix i40e_debug() to use struct i40e_hw argument
    d662269211c49 ice: fix AQ error code comparison in ice_set_pauseparam()
    335c2dd21ad9d ice: fix FDIR CTRL VSI resource leak in ice_reset_all_vfs()
    2465d1bdf84e0 PCI: endpoint: pci-epf-ntb: Add check to detect 'db_count' value of 0
    014dd1c8617ba PCI: endpoint: pci-epf-vntb: Add check to detect 'db_count' value of 0
    bfa05d89dc3ca drm/edid: fix OOB read in drm_parse_tiled_block()
    525e408c27ae7 bpf: Fix effective prog array index with BPF_F_PREORDER
    9fe373020cc9d bpf: zero-initialize the fib lookup flow struct
    475405593de2b bpf: Fix stack slot index in nospec checks
    48c16ed988790 rtc: ds1307: handle oscillator stop flag for ds1337/ds1339/ds3231
    429025d25ac24 rtc: abx80x: fix the RTC_VL_CLR clearing all status flags
    e88b1ff95f2ed octeontx2-pf: mcs: Fix mcs resources free on PF shutdown
    ab9c0b007c7fd octeontx2-pf: Clear stats of all resources when freeing resources
    9ab0fb5758cbb octeontx2-af: mcs: Fix unsupported secy stats read
    754dfaddde3a1 net: ethernet: mtk_ppe: Fix rhashtable leak in mtk_ppe_init error paths
    5e215bf1c47fd tipc: fix use-after-free of the discoverer in tipc_disc_rcv()
    a07f77e995a63 net: marvell: prestera: initialize err in prestera_port_sfp_bind
    c6edb7532c8e7 selftests/mm: fix exclusive_cow test fork() handling
    75ec9461a4623 selftests/mm: allow PUD-level entries in compound testcase of hmm tests
    04dfc21465992 selftests/mm: clarify alternate unmapping in compaction_test
    b508e7542d683 irqchip/crossbar: Fix parent domain resource leak
    f73b7de5338fc netfilter: nft_meta_bridge: fix NFT_META_BRI_IIFPVID stack leak
    76d1bc5498c72 netfilter: nf_reject: skip iphdr options when looking for icmp header
    d01b4b471f0fc netfilter: ipset: fix order of kfree_rcu() and rcu_assign_pointer()
    6329d3a9afe71 netfilter: ipset: Don't use test_bit() in lockless RCU readers in hash types
    28642b1420f27 netfilter: ipset: annotate "pos" for concurrent readers/writers
    bead63993e05e netfilter: ipset: Fix data race between add and dump in all hash types
    c66ed3e6371f5 md/raid1: free r1_bio when REQ_NOWAIT is set and read would block on retry
    71b5add66c51d ieee802154: fix kernel-infoleak in dgram_recvmsg()
    ded58bfebcb32 ieee802154: Remove WARN_ON() in cfg802154_pernet_exit()
    e74488982ecfd ACPI: IPMI: Fix inverted interface check in ipmi_bmc_gone()
    e3987bc539630 ACPI: resource: Amend kernel-doc style
    e432404e63edd thermal: intel: Fix dangling resources on thermal_throttle_online() failure
    79417b08f747d arm64/hw_breakpoint: reject unaligned watchpoints that would truncate BAS
    bcdd5a7363bdd ALSA: usb-audio: Kill MIDI 2.0 URBs before freeing endpoints
    9a65860959db5 flow_dissector: check device type before reading ETH_ADDRS
    f104794507099 devlink: Fix parent ref leak in devl_rate_node_create()
    0ce4f958ddeb8 dpaa2-switch: fix VLAN upper check not rejecting bridge join
    38e94d63e29f4 virtio-net: fix len check in receive_big()
    154e29d0c6a23 spi: rpc-if: Use correct device for hardware reinitialization on resume
    e58aef585d173 PCI: iproc: Restore .map_irq() for the platform bus driver
    722576aba0a6d sctp: hold socket lock when dumping endpoints in sctp_diag
    befe1ebe7fc2c net: psample: fix info leak in PSAMPLE_ATTR_DATA
    19d2d36e193c3 octeontx2-pf: Fix leak of SQ timestamp buffer on teardown
    cfbffc8091f51 drm/amdgpu: initialize irq.lock spinlock earlier
    506e635aed05d drm/amdkfd: fix list_del corruption in kfd_criu_resume_svm
    283e77af49fda drm/amdkfd: Avoid double-unpin of DOORBELL/MMIO BOs on free
    a6d0abb35052c ASoC: tlv320aic3x: restrict CLKDIV bypass Q values in dual-rate mode
    efa9e3b9f3dea xfrm: validate selector family and prefixlen during match
    a1c6d68ddee37 xfrm: annotate data-races around xfrm_policy_count[] and xfrm_policy_default[]
    be8cdef5c93d5 xfrm: Support crypto offload for inbound IPv6 ESP packets not in GRO path
    22d554d9ba241 xfrm: Use the XFRM_GRO to indicate a GRO call on input
    cb4f93bdade99 spi: dw: fix wrong BAUDR setting after resume
    6564da2814a79 gpio: mlxbf3: fail probe if gpiochip registration fails
    e1a215900d2ed sparc: led: avoid trimming a newline from empty writes
    5feaaa1d34b29 apparmor: fix label can not be immediately before a declaration
    b8e89081a97b6 i3c: master: Prevent reuse of dynamic address on device add failure
    07fea242a8942 apparmor: put secmark label after secid lookup
    58817bf37ccc4 apparmor: aa_getprocattr free procattr leak on format failure
    5cba148eae6e8 apparmor: fix potential UAF in aa_replace_profiles
    5acb878db4132 apparmor: grab ns lock and refresh when looking up changehat child profiles
    6a26de6c05542 apparmor: fix rawdata_f_data implicit flex array
    cc2192899d502 apparmor: aa_label_alloc use aa_label_free on alloc failure
    b7c45c05a396a apparmor: check label build before no_new_privs test
    79d80d70b03d1 security/apparmor/apparmorfs.c: conditionally compile get_loaddata_common_ref()
    6848ca381edff Revert "PCI/MSI: Unmap MSI-X region on error"
    2e605bef29e09 PCI: mediatek: Use actual physical address instead of virt_to_phys()
    26b30daf73ae8 PCI: mediatek: Fix possible truncation in mtk_pcie_parse_port()
    b3c60e4f962dd tools lib api: Fix mount_overload() snprintf truncation and toupper range
    bd0a73192c3a9 tools lib api: Fix filename__write_int() writing uninitialized stack data
    20a17dd8a0c7e tools lib api: Fix missing null termination in filename__read_int/ull()
    05457b1241d74 xprtrdma: Return sendctx slot after Send preparation failure
    4322fd9645ee7 xprtrdma: Repost Receive buffers for malformed replies
    4163424214017 xprtrdma: Sanitize the reply credit grant after parsing
    88b5346284a18 xprtrdma: Fix bcall rep leak and unbounded peek
    e967e82e372f4 xprtrdma: Resize reply buffers before reposting receives
    2b84ff4da343b xprtrdma: Document and assert reply-handler invariants
    dd798b76a3481 xprtrdma: Check frwr_wp_create() during connect
    65a04db641fdb PCI: rcar-host: Remove unused LIST_HEAD(res)
    2097a2537d9d1 fs/ntfs3: resize log->one_page_buf when adopting on-disk page size
    018359b048c4c PCI: meson: Propagate devm_add_action_or_reset() failure
    b0c5bc5068f8c PCI: mediatek: Fix operator precedence in PCIE_FTS_NUM_L0 macro
    4bc7e5c789b62 NFSv4/flexfiles: honor FF_FLAGS_NO_IO_THRU_MDS in pg_get_mirror_count_write
    502b282f2f452 NFSv4/flexfiles: honor FF_FLAGS_NO_IO_THRU_MDS on fatal DS connect errors
    c31ce9fd8b349 nfs: keep PG_UPTODATE clear after read errors in page groups
    02e00663846b2 NFSv4/pnfs: defer return_range callbacks until after inode unlock
    9f3d9b68c1c6c xprtrdma: Decouple req recycling from RPC completion
    d006a5fb63b92 xprtrdma: Use sendctx DMA state for Send signaling
    d1b159356a358 xprtrdma: Post receive buffers after RPC completion
    9d17e2618037d xprtrdma: Close lost-wakeup race in xprt_rdma_alloc_slot
    b7070614baeba xprtrdma: Avoid 250 ms delay on backlog wakeup
    e253e1a0b360e xprtrdma: Remove temp allocation of rpcrdma_rep objects
    b6c4002122573 pNFS/filelayout: fix cheking if a layout is striped
    a64d70d5e33f8 clk: qcom: a53: Corrected frequency multiplier for 1152MHz
    5876f38b67a30 dmaengine: Fix possible use after free
    98cc38b541014 dmaengine: qcom: gpi: set DMA_PRIVATE capability
    ba8b410c7c4f6 perf: Fix off-by-one stack buffer overflow in kallsyms__parse()
    b67a3bcc1cb49 dmaengine: imx-sdma: Refine spba bus searching in probe
    bca364c4c7579 drm/amd/display: Add missing kdoc for ALLM parameters
    914a77aa7a24e fs/ntfs3: fix mount failure on 64K page-size kernels
    8afc24a884aff fs/ntfs3: add bounds check to run_get_highest_vcn()
    6c63a4ed26927 HID: logitech-hidpp: remove excess kernel-doc member in hidpp_scroll_counter
    eda31b3b90f15 clk: at91: keep securam node alive while mapping it
    8ac30431ca7e4 iio: tcs3472: power down chip on probe failure
    eed69f8a10b82 iio: accel: mma8452: handle I2C read error(s) in mma8452_read()
    94d158985b6ea iio: adc: xilinx-ams: fix out-of-bounds channel lookup in event handling
    8cf3460745333 iio: magnetometer: ak8975: fix potential kernel stack memory leak
    922e9be5c41a2 iio: light: si1133: prevent race condition on timeout
    4799162324a84 iio: light: si1133: reset counter to prevent race condition
    764723bd67a6c char: tlclk: fix use-after-free in tlclk_cleanup()
    2bb0cfa1392c3 usb: host: max3421: Reject hub port requests for non-existent ports
    d512bdefd241b usb: host: max3421: Fix shift-out-of-bounds in max3421_hub_control()
    4928096212b78 staging: most: video: avoid double free on video register failure
    e519c1d8c5efb mailbox: mtk-adsp: fix UAF during device teardown
    9c55eb9a0f6f4 phy: phy-can-transceiver: Check driver match and driver data against NULL
    4d6628c106697 bus: mhi: ep: Fix potential deadlock in mhi_ep_reset_worker()
    78a0d1fa5d7a3 PCI: loongson: Do not ignore downstream devices on external bridges
    f67b187af7493 platform/x86: xo15-ebook: Fix wakeup source and GPE handling
    37b43903ef0f0 x86/platform/olpc: xo15: Drop wakeup source on driver removal
    4997873e3abba PCI: Check ROM header and data structure addr before accessing
    01b03bc88bd8d PCI: Introduce named defines for PCI ROM
    a397bf58445ff PCI/ASPM: Don't reconfigure ASPM entering low-power state
    d887844028cd6 coresight: etm4x: Correct TRCVMIDCCTLR1 save and restore
    66433aca6e806 coresight: cti: Fix DT filter signals silently ignored
    08626fcfe1230 staging: nvec: fix use-after-free in nvec_rx_completed()
    8aadc136d8e8d net/9p: fix race condition on rdma->state in trans_rdma.c
    49b34bd3ad696 ocfs2: fix circular locking dependency in ocfs2_dio_end_io_write
    2ce02059ceb63 mfd: cs42l43: Sanity check firmware size
    7c3264d273d52 ksmbd: fix use-after-free in same_client_has_lease()
    179966099aa10 ionic: Fix check in ionic_get_link_ext_stats
    572fff10819df tcp: ipv6: clamp default adverting MSS to avoid GSO_BY_FRAGS (0xFFFF)
    50ff092633b06 tipc: fix UAF in tipc_l2_send_msg()
    00cd01ea0cf53 KEYS: Use acquire when reading state in keyring search
    55d0edf94c19c powerpc/kexec: fix double get_cpu() imbalance in kexec_prepare_cpus
    7c75878359bd2 powerpc/powernv: fix preempt count leak in pnv_kexec_wait_secondaries_down
    5397142d60aa2 powerpc/perf: fix preempt count underflow in fsl_emb_pmu_del
    ac7385af1dca8 MIPS: mm: Fix out-of-bounds write in maar_res_walk()
    c05a0ec1cdced bpf, sockmap: fix integer overflow in bpf_msg_pop_data() bounds check
    888706a76286c bpf, sockmap: reject overflowing copy + len in bpf_msg_push_data()
    5c5fccbcf3e1c bpf: Fix bpf_get/setsockopt to tos for ipv4-mapped ipv6 socket
    98219ce3e1c96 selftests/bpf: Initialize operation name before use
    6fb80feea3099 smb/client: always return a value for FS_IOC_GETFLAGS
    4465ebe67d893 cifs: remove all cifs files before kill super
    3ff31b83aacf2 ALSA: core: Fix unintuitive behavior of snd_power_ref_and_wait()
    68d0415c16e5e netfilter: nf_conncount: callers must hold rcu read lock
    b8c90823cdfb5 kcm: use WRITE_ONCE() when changing lower socket callbacks
    498a667dc9542 net: bcmgenet: Use weighted round-robin TX DMA arbitration
    7edd4db82f942 net: wwan: t7xx: check skb_clone in control TX
    8d654fa6ebf45 net/mlx5: Check max_macs devlink param value against max capability
    b6dced2150081 bpf: Run generic devmap egress prog on private skb
    637639118ef33 net: mana: guard TX wq object destroy with INVALID_MANA_HANDLE check
    8e52a247d9aa9 net: mana: initialize gdma queue id to INVALID_QUEUE_ID
    e8c6dbadf139c net/sched: sch_codel: Do not call qdisc_tree_reduce_backlog during peek before restoring qlen
    acc08a0c7f37e net/sched: sch_fq_codel: Do not call qdisc_tree_reduce_backlog during peek before restoring qlen
    25fb53e43ec00 handshake: Require admin permission for DONE command
    23a29ee1d9de3 power: supply: core: fix supplied_from allocations
    820a87639e9aa ASoC: adau1372: Clear PLL_EN on failed PLL lock without reset GPIO
    dfab0d4698a64 spi: xilinx: use FIFO occupancy register to determine buffer size
    cbc2fcf580882 crypto: rng - Free default RNG on module exit
    8afd1007ef798 crypto: cavium/cpt - fix DMA cleanup using wrong loop index
    ed374dbc70c10 crypto: marvell/octeontx - fix DMA cleanup using wrong loop index
    66bdbb8e6c5c8 cxl/test: Add check after kzalloc() memory in alloc_mock_res()
    f1715d92ee309 tipc: reject inverted service ranges from peer bindings
    47ed873e4ceda tipc: prevent snt_unacked underflow on CONN_ACK
    9b937de4b3ded tipc: require net admin for TIPCv2 netlink mutators
    b2a017bfcf565 net/sched: sch_hfsc: Don't make class passive twice
    85f54cf589163 sctp: validate embedded address parameter length
    53788b134519e bridge: cfm: reject invalid CCM interval at configuration time
    a7ef30753353b net: fib_rules: Don't dump dying fib_rule in fib_rules_dump().
    3d05400186027 net/sched: cls_flow: Dont expose folded kernel pointers
    4bcb23635d505 ASoC: tegra: tegra210_ahub: Validate written enum value
    0b10c6203e62d ASoC: fsl: fsl_audmix: Validate written enum values
    8cbf24714d6b3 ASoC: codecs: hdac_hdmi: Validate written enum value
    aabfc845838ef RDMA/mlx5: Release the HW‑provided UAR index rather than the SW one
    6fc874fdfb366 RDMA/mlx5: Fix undefined shift of user RQ WQE size
    87262e60adfe1 RDMA/mlx5: Remove raw RSS QP restrack tracking
    60fa67263a772 fs: efs: remove unneeded debug prints
    41d3e5526fcd6 Bluetooth: vhci: validate devcoredump state before side effects
    290b36f9d1eb9 Bluetooth: hci: validate codec capability element length
    809230cc25dde Bluetooth: hci_qca: fix NULL pointer dereference in qca_dmp_hdr() for non-serdev device
    b43dee28b7c81 s390/process: Fix kernel thread function pointer type
    eb73056ce2a6f bpf: Tighten cgroup storage cookie checks for prog arrays
    b0dbe5f70ee8d of: cpu: add check in __of_find_n_match_cpu_property()
    7f10e0f35ac1d cxl/test: Zero out LSA backing memory to avoid leaking to user
    0101d4000a124 cxl/test: Fix integer overflow in mock LSA bounds checks
    2a0ee19de6e89 selftests/bpf: Fix bpf_iter/task_vma test
    260830a9a706f ext4: fix kernel BUG in ext4_write_inline_data_end
    015e32e264a9b bonding: 3ad: fix mux port state on oper down
    3c75cd8e68f1f ASoC: cs35l56: Don't leave parent IRQ disabled if system_suspend fails
    b72d5d2d8fe76 ASoC: cs35l56: Fix missing calls to wm_adsp2_remove()
    67fb36b508ce7 tools/virtio: check mmap return value in vringh_test
    6445b945024f4 vhost/net: complete zerocopy ubufs only once
    f8e1f130689a2 vduse: Requeue failed read to send_list head
    2b3f79b90b231 vhost/vdpa: validate virtqueue index in mmap and fault paths
    93ed4692f2299 vduse: hold vduse_lock across IDR lookup in open path
    dbc63fe645f09 ASoC: codecs: aw88261: fix incorrect masks for boost regs
    a28ad91dc5d80 spi: meson-spifc: fix runtime PM leak on remove
    407472df02dba IB/mlx4: Fill in the access_flags if IB_MR_REREG_ACCESS is not specified
    fcce8a44dfa39 btrfs: zoned: don't account data relocation space-info in statfs free space
    5a15f8d87a007 hwmon: (it87) Clamp negative values to zero in set_fan()
    b2ff450f7f5cf fbdev: sm501fb: Fix buffer errors in OF binding code
    015dc4a1e0c2c btrfs: fix invalid pointer dereference in __btrfs_run_delayed_refs()
    06010aab6ec04 wifi: mt76: mt7921: fix potential tx_retries underflow
    d42f6f25211a4 wifi: mt76: mt7915: fix potential tx_retries underflow
    e93b18ddc18a2 wifi: mt76: fix argument to ieee80211_is_first_frag()
    66f21eecda2a2 sched/fair: Fix cpu_util runnable_avg arithmetic
    6abaa8ec1b986 hwspinlock: qcom: avoid uninitialized struct members
    af71c2b88ccae vmalloc: fix NULL pointer dereference in is_vm_area_hugepages()
    310958030dc02 pinctrl: mediatek: mt8167: Fix Schmitt trigger register offset of pins 34-39
    9f56b6dbefa85 pinctrl: mediatek: mt8516: Fix Schmitt trigger register offset of pins 34-39
    8c888a062c6de scsi: target: Remove tcm_loop target reset handling
    0165403da5086 scsi: target: Fix hexadecimal CHAP_I handling
    89184909634e5 watchdog: unregister PM notifier on watchdog unregister
    9e57e2863872e configfs: fix lockless traversals of ->s_children
    38149b57427c7 firmware_loader: Fix recursive lock in device_cache_fw_images()
    43c9646d98a04 spi: ep93xx: fix double-free of zeropage on DMA setup failure
    94f7e50eb6b2c IB/mlx5: Properly support implicit ODP rereg_mr
    52d0e6527716f IB/mlx5: Don't take the rereg_mr fallback without a new translation
    2bc08fe88e578 cpufreq: Documentation: fix conservative governor freq_step description
    e67b984f8c142 ACPI: IPMI: Fix message kref handling on dead device
    e0c3edd864145 ALSA: seq: Clear variable event pointer on read
    dba54c80f86eb riscv: stacktrace: Remove bogus -0x4 offset in non-FP walk_stackframe
    32b482fbda6b5 ALSA: seq: Fix partial userptr event expansion
    c07aa0534d503 wifi: wcn36xx: fix OOB read from short trigger BA firmware response
    64228dfc4247a wifi: wcn36xx: fix OOB read from firmware count in PRINT_REG_INFO indication
    cfc67aee0c83e wifi: wcn36xx: fix heap overflow from oversized firmware HAL response
    5e630134d11d4 bpf: Update transport_header when encapsulating UDP tunnel in lwt
    1bfabe51760db bpf: Check tail zero of bpf_prog_info
    f8ab1c1bf42ee arm64: dts: tqma8mpql-mba8mpxl: configure sai clock in audio codec as well
    3982121730f91 RDMA/irdma: Initialize iwmr->access during MR registration
    ad360a31092a8 RDMA/irdma: Fix OOB read during CQ MR registration
    9b82054dfe69a IB/cm: Fix av cm device leak on an error path in cm_init_av_by_path()
    c121473586603 netfilter: conntrack: call nf_ct_gre_keymap_destroy() if master helper is pptp
    6bba4846f196d netfilter: conntrack: revert ct extension genid infrastructure
    8d86b4041d219 netfilter: synproxy: protect nf_ct_seqadj_init() with conntrack lock
    cc5d7dadb6d87 netfilter: nfnetlink_osf: fix mss parsing on big-endian architectures
    f38fb17c8758e ocfs2: fix race between ocfs2_control_install_private() and ocfs2_control_release()
    aa7883b6a3c76 ocfs2/dlm: require a ref for locking_state debugfs open
    346314bb0cc2f ocfs2: reject FITRIM ranges shorter than a cluster
    ecb3f9386f435 ocfs2: fix buffer head management in ocfs2_read_blocks()
    6b38a5b8ee951 ocfs2: rebase copied fsdlm LVB pointers in locking_state
    a97a5f842c68f perf/x86/amd/core: Always use the NMI latency mitigation
    c35dce681145f bpftool: Use libbpf error code for flow dissector query
    71323880be792 drm/amdgpu: set sub_block_index for mca ras sub-blocks
    eee07d769da5a configfs_lookup(): don't leave ->s_dentry dangling on failure
    b0799d03b709f lib/test_meminit: use && for bools
    e8bbcc00760df sched: restore timer_slack_ns when resetting RT policy on fork
    8990dbb7065b0 ext2: fix ignored return value of generic_write_sync()
    4af4f0b04964a mm/fake-numa: fix under-allocation detection in uniform split
    c70d0f9114c3c bpf: fix UAF by restoring RCU-delayed inode freeing in bpffs
    10e05b5ff05ce scsi: ufs: Fix wrong value printed in unexpected UPIU response case
    4f944acca6379 scsi: pm8001: Fix error code in non_fatal_log_show()
    da4853eb4616f scsi: Revert "scsi: Fix sas_user_scan() to handle wildcard and multi-channel scans"
    73e35c1bdfa16 nvdimm/btt: Handle preemption in BTT lane acquisition
    c225bb49c697f ARM: imx31: Fix IIM mapping leak in revision check
    ddab66c9a90d6 ata: libata: Fix ata_exec_internal()
    21b8e6afbd1bb HID: wiimote: Fix table layout and whitespace errors
    7eb7c42ec4930 ARM: imx3: Fix CCM node reference leak
    93bc5642fbda3 ASoC: rsnd: Fix RSND_SOC_MASK width to single nibble
    70b1c71b1fdfb ext4: fix LOGFLUSH shutdown ordering to allow ordered-mode data writeback
    ce3030e92f143 md/raid10: reset read_slot when reusing r10bio for discard
    964a44a990d61 rpmsg: use generic driver_override infrastructure
    04c18c43d250e media: qcom: venus: relax encoder frame/blur step size on v6
    061a2f302fc50 media: qcom: venus: relax encoder frame/blur dimension steps on v4
    c4f0846d1d246 media: qcom: venus: drop extra padding in NV12 raw size calculation
    fc72fd61cc8b2 RDMA/rxe: Copy WQE to local buffer in non-SRQ receive path
    cd19a6345e372 RDMA/rxe: Fix TOCTOU heap overflow in get_srq_wqe
    0c16d7c01284a EDAC/{skx_common,skx}: Fix UBSAN shift-out-of-bounds in skx_get_dimm_info
    01623d834b5e8 drm/msm/dp: Fix the ISR_* enum values
    fee0e0eefcd41 drm/msm/dp: fix HPD state status bit shift value
    86145b5c5a7c2 crypto: hisilicon/qm - disable error report before flr
    cc7d67197c51a ocfs2: kill osb->system_file_mutex lock
    b460f8d01a120 ocfs2: don't BUG_ON an invalid journal dinode
    acd54f42abbbd rapidio/tsi721: prevent a bad dereference in tsi721_db_dpc()
    d47b0b8a69a13 dax/kmem: account for partial discontiguous resource upon removal
    ca06e163e5181 libbpf: Fix UAF in strset__add_str()
    fb203d0e21dc0 libbpf: Harden parse_vma_segs() path parsing
    9980c66ad2d4f drm/nouveau/bios: specify correct display fuse register for Ampere and Ada
    13d9e73955c91 drm/tegra: Fix iommu_map_sgtable() return value check
    3ac173e46ef6f gpu: host1x: Fix iommu_map_sgtable() return value check
    3d211fb43a04e drm/tegra: dc: Fix device node reference leak in tegra_dc_has_output()
    71c017b3f83ff gpu: host1x: Allow entries in BO caches to be freed
    4b731af227c69 drm/tegra: gr2d/gr3d: Contain PM in the gr*d_probe/gr*d_remove
    6e22d5ad61cfa drm/tegra: gr2d/gr3d: Initialize address register map before HOST1X client is registered
    4a76953c3ed04 net/sched: cls_bpf: prevent unbounded recursion in offload rollback
    1e3db30a88815 ipv6: guard against possible NULL deref in __in6_dev_stats_get()
    ec2644cc69e14 workqueue: drop spurious '*' from print_worker_info() fn declaration
    9ffdd11bd6c96 nvme-multipath: fix flex array size in struct nvme_ns_head
    2f7c245d4601d pinctrl: cs42l43: Fix polarity on debounce
    936641af564c3 ALSA: seq: midi: Serialize output teardown with event_input
    82d6a87de7843 mtd: spi-nor: Drop duplicate Kconfig dependency
    5b36ed8cc78f5 mips: n64: add __iomem for writel call
    9291ea4dc7b05 mips: ralink: mt7621: add missing __iomem
    17f5de95069b8 MIPS: DEC: Remove do_IRQ() call indirection
    f3d1b0c22466f MIPS: Fix big-endian stack argument fetching in o32 wrapper
    59096e2aa0f66 PM: sleep: Use complete() in device_pm_sleep_init()
    a22346dc47b02 RDMA/counter: Fix incorrect port index in rdma_counter_init() error cleanup
    a075a7acd155f RDMA/hns: Fix warning in poll cq direct mode
    1035807ed1aba IB/mlx4: Fix refcount leak in add_port() error path
    665fb7d22a700 RDMA/rxe: Fix a use-after-free problem in rxe_mmap
    9f8f0d2099e3d RDMA/irdma: Fix out-of-bounds write in irdma_copy_user_pgaddrs
    b0c4c1d8d42f4 bus: sunxi-rsb: Always check register address validity
    5ff037ec8b5e9 pwm: imx27: Fix variable truncation in .apply()
    7a832f4070be1 cpufreq: conservative: Simplify frequency limit handling
    de8f81c0e7d3e cpufreq: Documentation: fix sampling_down_factor range
    9f1de8e384012 Revert "treewide: Fix probing of devices in DT overlays"
    73323db56aae6 driver core: Use mod_delayed_work to prevent lost deferred probe work
    08739321420f0 device property: fix fwnode reference leak in fwnode_graph_get_endpoint_by_id()
    0c584c27f6649 tracing: Bound synthetic-field strings with seq_buf
    0a1d6bbba52ae arm64: dts: qcom: sm8450: Add power-domain and iface clk for ice node
    30aa348494531 firmware: arm_scmi: Fix OOB in scmi_power_name_get()
    8972d8f38373e media: rockchip: rga: fix too small buffer size
    ed4e2f9f7e54b net/sched: sch_drr: annotate data-races around cl->deficit
    8bfe280576b2a regulator: dt-bindings: mt6359: Drop regulator-name pattern restrictions
    e05e423fff76c bitops: use common function parameter names
    969203772e515 sysfs: clamp show() return value in sysfs_kf_read()
    457136c9719af firmware: arm_scmi: Read sensor config as 32-bit value
    f8c7669f57056 media: atomisp: Fix memory leak in atomisp_fixed_pattern_table()
    dcf7a986f377c RDMA/srpt: fix integer overflow in immediate data length check
    1025dc2f7ba29 RDMA/mlx5: Fix devx subscribe-event unwind NULL dereference
    0ccf70ea84330 RDMA/hns: Fix arithmetic overflow in calc_hem_config()
    2c3b2667dad69 IB/mlx5: Fix transport-domain rollback and initialize lb mutex earlier
    8ed0ce9ea58d6 ipv6: addrconf: bail out of dad_failure when state is no longer POSTDAD
    1134ff0c8228f net/sched: sch_htb: annotate data-races (I)
    dc56c30c50cee net/sched: sch_htb: do not change sch->flags in htb_dump()
    e9c1d78836cef spi: hisi-kunpeng: Use dev_err_probe() for host registration failure
    50c3c7df4f26d crypto: ccp - Treat zero-length cert chain as query for blob lengths
    5543dd4d8eb58 net/sched: sch_hfsc: annotate data-races in hfsc_dump_class_stats()
    1029bb377700e clk: scpi: Unregister child clock providers on remove
    345675e960ab4 thermal: hwmon: Fix critical temperature attribute removal
    a36cbfb85f26e evm: terminate and bound the evm_xattrs read buffer
    31f5ad37509d6 drm/hisilicon/hibmc: use clock to look up the PLL value
    08bb9f3fdd4e6 drm/hisilicon/hibmc: move display contrl config to hibmc_probe()
    cca79a18f6275 arm64: dts: qcom: sm8450: Fix ICE reg size
    79784c80d570e clk: scmi: Fix clock rate rounding
    c10d7a84e5a1a arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA bounce buffer to host
    747a1775c4ee1 iommu/amd: Fix a stale comment about which legacy mode is user visible
    ac3d1a11397a4 nilfs2: fix backing_dev_info reference leak
    ae9e534e502a0 dlm: fix add msg handle in send_queue ordered
    627938383761f crypto: asymmetric_keys - fix OOB read in pefile_digest_pe_contents
    32e50358edf05 crypto: ecrdsa - fix unknown OID check in ecrdsa_param_curve
    e833e865e4944 crypto: atmel-sha204a - fix blocking and non-blocking rng logic
    f79c80f173fda vxlan: Fix potential null-ptr-deref in vxlan_gro_prepare_receive().
    95b9fff4036e3 arm64: dts: imx8x-colibri: Correct SODIMM PAD settings
    118930f6c9dcf arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc
    c399e66507af1 pinctrl: sunxi: fix regulator leak in sunxi_pmx_request() error path
    42fbc613682f5 media: v4l2-common: Add YUV24 format info
    d011267be9a3f media: cedrus: Fix failure to clean up hardware on probe failure
    0b22f0181250b watchdog: sprd_wdt: Remove redundant sprd_wdt_disable() on register failure
    72b77aa04b50a watchdog: sama5d4_wdt: Fix WDDIS detection on SAM9X60 and SAMA7G5
    886c7101db617 watchdog: sp5100_tco: Use EFCH MMIO for newer Hygon FCH
    ee346dcb5ebcd ARM: dts: am335x-sl50: Fix audio bitclock and frame master endpoint
    46ca1451f61b5 wifi: ath9k: fix OOB access from firmware tx status queue ID
    3e135495c1657 kconfig: fix potential NULL pointer dereference in conf_askvalue
    6a3c384393d3f wifi: rtw88: fix OOB read from firmware RX descriptor exceeding DMA buffer
    966fbed4b4463 wifi: rtw89: Correct data type for scan index to avoid infinite loop
    5e79e0180515b driver core: use READ_ONCE() for dev->driver in dev_has_sync_state()
    89a75e3349c4f drm/amdkfd: Validate CRIU-restored IDs before idr_alloc
    d2ebe124d3633 dt-bindings: pinctrl: nvidia,tegra234: Add missing required block
    da4a14062bbcb arm64: tegra: Fix Tegra234 MGBE PTP clock
    dbb66f78931b1 wifi: cfg80211: fix grammar in MLO group key error message
    2ed6b94441cf6 arm64: dts: qcom: sdm845-mezzanine: Fix camss ports unit_address_vs_reg warning
    6d7ef14197b71 arm64: dts: rockchip: Fix gmac0 reset pin for NanoPi R5S
    b6f6a8b8c3f92 Documentation: proc: fix section numbering in table of contents
    126549251ce38 libbpf: Report error when a negative kprobe offset is specified
    1c9ba32308c02 drm/radeon: fix memory leak in radeon_ring_restore() on lock failure
    b7b44937c548c drm/radeon: fix integer overflow in radeon_align_pitch()
    a5d13544cacb3 drm/amdgpu: fix integer overflow in amdgpu_gem_align_pitch()
    a0a24f75f8420 drm/tidss: Drop extra drm_mode_config_reset() call
    c0d5266a945a4 drm/rockchip: Test for imported buffers with drm_gem_is_imported()
    e3e69cfb053e6 clocksource/drivers/sun5i: Handle error returns from devm_reset_control_get_optional_exclusive()
    9b783b7e03dc7 fbcon: fix NULL pointer dereference for a console without vc_data
    f34fa27d4ac18 afs: Fix further netns teardown to cancel the preallocation charger
    867b3ea146a04 afs: fix NULL pointer dereference in afs_get_tree()
    85d5fb80fe4f0 afs: Fix netns teardown to cancel the preallocation charger
    86eff3140c9d4 rxrpc: Fix leak of released call in recvmsg(MSG_PEEK)
    8bbede0afced3 rxrpc: rxrpc_verify_data ensure rx_dec_buffer alloc
    c004ef925faf0 serial: 8250_omap: clear rx_running on zero-length DMA completes
    abc1926c88c18 serial: msm: Disable DMA for kernel console UART
    6c9ac3417de7b dt-bindings: power: imx93: Add MIPI PHY power domain
    3a9c0bee69e68 dt-bindings: media: sun4i-a10-video-engine: Add interconnect properties
    47ca0107e6a65 media: uvcvideo: Fix sequence number when no EOF
    e1052f8406019 media: uvcvideo: Fix buffer sequence in frame gaps
    3351da80ca645 media: uvcvideo: Avoid partial metadata buffers
    116f0e0890896 bpf: Prefer dirty packs for eBPF allocations
    8d65c431e1037 bpf: Prefer packs that won't trigger an IBPB flush on allocation
    1f232626a42b6 bpf: Skip redundant IBPB in pack allocator
    3b3b23c80202c bpf: Restrict JIT predictor flush to cBPF
    cb27f3bf915cc x86/bugs: Enable IBPB flush on BPF JIT allocation
    6e52c240c43a6 bpf: Support for hardening against JIT spraying
    9badc789a500a crypto: hisi-trng - Remove crypto_rng interface
    9a0e68b66e7ce crypto: crypto4xx - Remove insecure and unused rng_alg
    05b7812164cee crypto: crypto4xx - Remove ahash-related code
    b2dbc71fe33b4 x86/mm: Fix check/use ordering in switch_mm_irqs_off()
    306ded31bfa00 crypto: sun4i-ss - Remove insecure and unused rng_alg
    e091ff83d962f nvmet-tcp: Fix potential UAF when ddgst mismatch
    e602c93b25bda nvmet-tcp: check INIT_FAILED before nvmet_req_uninit in digest error path
    477145860dba4 KVM: arm64: Clear __hyp_running_vcpu when flushing the pKVM hyp vCPU
    2c5e72b9fbf83 KVM: arm64: Bound used_lrs when flushing the pKVM hyp vCPU
    7b91e51d0eb7c crypto: algif_skcipher - force synchronous processing on trees without ctx->state
    5a3218fbdeacb sched/fair: Only update stats for allowed CPUs when looking for dst group
    d6998ddd507c8 block: skip sync_blockdev() on surprise removal in bdev_mark_dead()
    c2e252e04fdcc smb/server: do not require delete access for non-replacing links
    50f0012da1040 xfs: resample the data fork mapping after cycling ILOCK
    d0ae7ec3aa61d xfs: fail recovery on a committed log item with no regions
    36bfa52459e45 smb: client: reject overlapping data areas in SMB2 responses
    0e4a5a000123d fuse: re-lock request before returning from fuse_ref_folio()
    018e33d403946 fuse: fix device node leak in cuse_process_init_reply()
    b2e26c955f8dd RDMA/siw: bound Read Response placement to the RREAD length
    2912f3d40355d RDMA/rtrs-srv: Bound RDMA-Write length to chunk size in rdma_write_sg
    04781ba93e362 Input: maplecontrol - set driver data before registering input device
    985cb452c2d10 Input: maplemouse - set driver data before registering input device
    330f7b37f838c Input: maple_keyb - set driver data before registering input device
    d89daead87d9b Input: mms114 - fix multi-touch slot corruption
    a72f944864b45 Input: maplemouse - fix NULL pointer dereference in open()
    5d2ea15ba03bf Input: mms114 - reject an oversized device packet size
    431ad239f2924 Input: touchwin - reset the packet index on every complete packet
    112666835071d Input: mms114 - fix touch indexing for MMS134S and MMS136
    c21295616a8a5 Input: iforce - bound the device-reported force-feedback effect index
    719d1a2c83a46 Input: goodix - clamp the device-reported contact count
    8c1db3418a419 Input: elan_i2c - prevent division by zero and arithmetic underflow
    26c895928d711 Input: synaptics-rmi4 - bound the F30 keymap to the GPIO/LED count
    ba57f43032853 Input: synaptics-rmi4 - bound the F3A keymap to the GPIO count
    5bd64ed8dd76f Input: synaptics-rmi4 - unregister function handlers on physical driver registration failure
    8f9b0cb58a10f i2c: stm32f7: truncate clock period instead of rounding it
    0c36f72fc4d94 i2c: mpc: Fix timeout calculations
    9882a9bd74db0 i2c: core: fix adapter deregistration race
    051be2ed4d073 udmabuf: fix DMA direction mismatch in release_udmabuf()
    ffaaff82336db KVM: VMX: Grab vmcs12 on CR8 interception update iff vCPU is in guest mode
    8192763d0ad78 KVM: VMX: Refresh GUEST_PENDING_DBG_EXCEPTIONS.BS on all injected #DBs
    503fdfdcac243 NTB: epf: Fix request_irq() unwind in ntb_epf_init_isr()
    ce4736c1e6c4c exfat: bound uniname advance in exfat_find_dir_entry()
    afcc0515bbdd2 module: decompress: check return value of module_extend_max_pages()
    22c1fd1355ad4 NFSv4: include MAY_WRITE in open permission mask for O_TRUNC
    35ae19764eabf tracing: Prevent out-of-bounds read in glob matching
    0cab02d06307c watchdog: apple: Add "apple,t8103-wdt" compatible
    caf08fd5ed742 EDAC/i10nm: Don't fail probing if ADXL is missing
    e65505d91fa03 spi: fsl-lpspi: terminate the RX channel on TX prepare failure path
    bf69ee9355c26 spi: fsl-lpspi: replace dmaengine_terminate_all() with dmaengine_terminate_sync()
    51ffc1f5d8981 arm64: fpsimd: Fix type mismatch in sme_{save,load}_state()
    7953af378a19f crypto: talitos/hash - fix SEC2 64k - 1 ahash request limitation
    0fae6fb13c49e crypto: talitos/hash - remove useless wrapper
    c9a65ad48bd24 crypto: talitos/hash - rename first_desc/last_desc to first_request/last_request
    d1731c1798f8f crypto: talitos/hash - drop workqueue mechanism for SEC1
    44174532b459a crypto: talitos/hash - use descriptor chaining for SEC1 instead of workqueue
    49ca4ff6d6432 crypto: talitos/hash - prepare SEC1 descriptor chaining, remove additional descriptor
    9c68f257f9b29 crypto: talitos - move code in current_desc_hdr() into a standalone function
    a9ba45af2788f crypto: talitos - move dma mapping code in talitos_submit() into a standalone dma_map_request() function
    03ab5ac0dc382 crypto: talitos - move dma unmapping code in flush_channel() into a standalone dma_unmap_request() function
    c25be6c4e4bef crypto: talitos - add chaining of arbitrary number of descriptor for the SEC1
    3d1d94445ab01 crypto: talitos - use dma_sync_single_for_cpu() before reading descriptor header
    500319830d769 crypto: qat - validate RSA CRT component lengths
    e3155eb0ea98f crypto: drbg - Fix the fips_enabled priority boost
    d955e2127c34c crypto: drbg - Fix drbg_max_addtl() on 64-bit kernels
    cc42fb40171c2 crypto: drbg - Fix returning success on failure in CTR_DRBG
    82789a44415e3 crypto: pcrypt - restore callback for non-parallel fallback
    677450e5ef850 crypto: ecc - Fix carry overflow in vli multiplication
    c8cfe11e48b2a crypto: caam - use print_hex_dump_devel to guard key hex dumps again
    ebd37eef6e4f4 crypto: caam - use print_hex_dump_devel to guard key hex dumps
    425d2001df58c crypto: af_alg - Remove zero-copy support from skcipher and aead
    b736b12108fd1 isofs: bound Rock Ridge symlink components to the SL record
    fd94a779020f2 partitions: aix: bound the pp_count scan to the ppe array
    9c894159c5b8a btrfs: do not trim a device which is not writeable
    be5e5553b1e2a nvme-multipath: set BIO_REMAPPED on bios remapped to per-path namespace disks
    ee4465a245c14 dm-ioctl: report an error if a device has no table
    93dfe94d55676 hwrng: jh7110 - fix refcount leak in starfive_trng_read()
    7285276aa50d2 udf: validate sparing table length as an entry count, not a byte count
    bb0d384c1f42a udf: validate VAT header length against the VAT inode size
    fb49099206c5c udf: validate free block extents against the partition length
    7f91201b1e486 PCI: Always lift 2.5GT/s restriction in PCIe failed link retraining
    edcbc218c39f6 iio: temperature: ltc2983: Fix n_wires default bypassing rotation check
    97a5da403566c usb: typec: ucsi: cancel pending work on system suspend
    c32df11147822 usb: typec: ucsi: ccg: Fix use-after-free of ucsi on remove
    af040c5b300c0 usb: typec: ucsi: Pass full DP config payload in SET_NEW_CAM for DP alt mode
    0195c30c77e3a usb: typec: ucsi: Invert DisplayPort role assignment
    012406f89abc5 usb: typec: tcpm: Validate SVID index in svdm_consume_modes()
    a82450bcb7ae4 usb: typec: class: drop PD lookup reference
    58b26ba693008 usb: typec: anx7411: use devm_pm_runtime_enable()
    d0ebf9cc7c2dd usbip: vudc: fix NULL deref in vep_dequeue()
    5bd3654a778bd usbip: tools: support SuperSpeedPlus devices
    0b0651f8ed4f0 USB: usb-storage: ene_ub6250: restore media-ready check
    5c098f20f15db USB: ulpi: fix memory leak on registration failure
    699dfb6917503 USB: serial: digi_acceleport: fix write buffer corruption
    bcfeae431db99 USB: serial: digi_acceleport: fix hard lockup on disconnect
    8d50a910194f6 USB: serial: digi_acceleport: fix broken rx after throttle
    64a115456397c USB: serial: option: add Telit Cinterion FE990D50 compositions
    2f7a6b8ab3845 USB: serial: keyspan_pda: fix information leak
    4183874b7925f usb: mtu3: unmap request DMA on queue failure
    0b3073f40cc9f USB: misc: uss720: unregister parport on probe failure
    6a935158d01f9 USB: storage: include US_FL_NO_SAME in quirks mask
    bb545c4dd22a3 usb: sl811-hcd: disable controller wakeup on remove
    0b57e5ddbd89d USB: legousbtower: fix use-after-free on disconnect race
    9b40d283ac2ad USB: quirks: add NO_LPM for the Samsung T5 EVO Portable SSD
    164398601a7f1 USB: iowarrior: fix use-after-free on disconnect
    02ca08fff74cf USB: ldusb: fix use-after-free on disconnect race
    60fc5ef4ecea3 USB: idmouse: fix use-after-free on disconnect race
    75c0ad13e1369 usb: gadget: f_printer: take kref only for successful open
    7a5214dae906d usb: gadget: udc: Fix use-after-free in gadget_match_driver
    56add2b9b2e89 usb: gadget: composite: fix dead empty check in the USB_DT_OTG handler
    be5004395dfd0 usb: free iso schedules on failed submit
    164a966035039 usb: dwc3: meson-g12a: fix refcount leak in dwc3_meson_g12a_resume()
    dd338e4ffa7fe USB: core: add USB_QUIRK_NO_LPM for VIA Labs USB 2.0 hub
    fde3c095e1d48 usb: cdnsp: fix stream context array leak in cdnsp_alloc_stream_info()
    19d9ff2b423d1 usb: cdc_acm: Add quirk for Uniden BC125AT scanner
    46ab32870d010 net: usb: kalmia: bound RX frame length in kalmia_rx_fixup()
    702d75f1a6025 bpf: Restore sysctl new-value from 1 to 0
    bccbab36ff228 bpf: Reject fragmented frames in devmap
    2c590972a2735 xfs: fix unreachable BIGTIME check in dquot flush validation
    960b29769c909 xfs: use null daddr for unset first bad log block
    0fed0fc34ce73 media: mtk-jpeg: cancel workqueue on release for supported platforms only
    286f77d002a33 nilfs2: reject CLEAN_SEGMENTS ioctl with out-of-range segment numbers
    16ca053c2be5f hfs/hfsplus: zero-initialize buffer in hfs_bnode_read
    798d762a5e55b HID: sensor-hub: Add sensor_hub_input_attr_read_values() for multi-byte reads
    33cd1a000daf9 HID: lg-g15: cancel pending work on remove to fix a use-after-free
    523db788c0f84 HID: letsketch: fix UAF on inrange_timer at driver unbind
    1a1ebdcb56ae5 HID: wacom: stop hardware after post-start probe failures
    5b535bde893f5 tools/mm/slabinfo: fix total_objects attribute name
    d2468e241af4c tools/mm/slabinfo: Fix trace disable logic inversion
    459b3a373d197 X.509: Fix validation of ASN.1 certificate header
    9638d3d28f9fe clocksource/drivers/timer-tegra186: Fix support for multiple watchdog instances
    e5ffc638faf5d posix-cpu-timers: Fix pid refcount leak in do_cpu_nanosleep() error path
    982c9f92d57bd cpufreq: pcc: fix use-after-free and double free in _OSC evaluation
    73255d702c756 cpufreq: Fix hotplug-suspend race during reboot
    860aaff72c844 sched/rt: Have RT_PUSH_IPI be default off for non PREEMPT_RT
    069ae9502f27f cpufreq: intel_pstate: Sync policy->cur during CPU offline
    46d403da376a8 firmware_loader: fix device reference leak in firmware_upload_register()
    f0776d142e530 OPP: of: Fix potential memory leak in opp_parse_supplies()
    08c600b7e1818 smb: client: mask server-provided mode to 07777 in modefromsid
    0de5b8e76847f smb: client: harden POSIX SID length parsing
    b723097775598 smb: client: use unaligned reads in parse_posix_ctxt()
    9136a08dc2932 smb: client: Fix next buffer leak in receive_encrypted_standard()
    037511726228a smb: client: fix double-free in SMB2_close() replay
    02bc2896bdc3e smb: client: fix double-free in SMB2_open() replay
    6e27f40b682a5 smb: client: fix double-free in SMB2_flush() replay
    5821f9dbb8b5b smb: client: fix change notify replay double-free
    0be4bc64882ed smb: client: fix double-free in SMB2_ioctl() replay
    100fb7c455fa8 smb: client: fix query_info() replay double-free
    3409aedf3c81a smb: client: fix query directory replay double-free
    f08b3f451f12e ksmbd: use opener credentials for delete-on-close
    2b9d2a370d639 ksmbd: add per-handle permission check to FILE_LINK_INFORMATION
    288a4abc16fe5 ksmbd: enforce FILE_READ_ATTRIBUTES on SMB_FIND_FILE_POSIX_INFORMATION
    b35afd5cf8fab ksmbd: run set info with opener credentials
    e6aa731f1b4b3 ksmbd: add a WRITE_DAC/WRITE_OWNER check to SMB2 SET_INFO SECURITY
    67bdad9cf01b2 ksmbd: require source read access for duplicate extents
    7703fd9aba1f2 ksmbd: fix UAF of struct file_lock in SMB2_LOCK deferred-lock cancellation
    2a64dbf9c739d ksmbd: serialize QUERY_DIRECTORY requests per file
    3072d82461f49 ksmbd: add a permission check for FSCTL_SET_ZERO_DATA
    620d133d46929 ksmbd: add permission checks for FSCTL_DUPLICATE_EXTENTS_TO_FILE
    aa37f5fef78dd smb/client: Fix error code in smb2_aead_req_alloc()
    38dbc8db8341c coresight: ultrasoc-smb: Fix OOB write in smb_sync_perf_buffer()
    ea59d9dbc5504 fs/ntfs3: fix missing run load for vcn0 in attr_data_get_block_locked()
    3ca13af5a4004 fs/ntfs3: zero-fill folios beyond i_valid in ntfs_read_folio()
    92300ac7ff17c fs/ntfs3: handle attr_set_size() errors when truncating files
    caa36a91c9c51 fs/ntfs3: fsync files by syncing parent inodes
    98d93c226bdfa Bluetooth: L2CAP: validate option length before reading conf opt value
    c66a95e60b65d Bluetooth: fix UAF in bt_accept_dequeue()
    21e60eb4d9585 Bluetooth: btnxpuart: Fix out-of-bounds firmware read in nxp_recv_fw_req_v3()
    ae215c5b6422d Bluetooth: bnep: pin L2CAP connection during netdev registration
    466540e045d01 Bluetooth: btmtksdio: fix infinite loop in btmtksdio_txrx_work()
    2664f537ca5bc netfilter: ebtables: terminate table name before find_table_lock()
    d2367d99f2455 netfilter: ebtables: module names must be null-terminated
    e44f78f5f0585 netfilter: ctnetlink: use nf_ct_exp_net() in expectation dump
    09d2407985b8c mm: shrinker: fix NULL pointer dereference in debugfs
    729ae27dc2503 mfd: cros_ec: Delay dev_set_drvdata() until probe success
    e81f805824a81 net: ipv4: bound TCP reordering sysctl writes and MTU probe sizes
    76d030ac95e17 ipv4: igmp: remove multicast group from hash table on device destruction
    ea61b04e1d724 io_uring/io-wq: re-check IO_WQ_BIT_EXIT for each linked work item
    19d63fd528719 gpio: eic-sprd: use raw_spinlock_t in the irq startup path
    1dba8444ac010 NTB: epf: Avoid calling pci_irq_vector() from hardirq context
    946046841013e fs/ntfs3: validate Dirty Page Table capacity in log_replay copy_lcns
    d663fbf28b2ee debugobjects: Plug race against a concurrent OOM disable
    caed4a96d5575 Bluetooth: MGMT: Fix UAF of hci_conn_params in add_device_complete
    7ff42312ccde5 audit: Fix data races of skb_queue_len() readers on audit_queue
    273c06b81d2e9 net: af_key: initialize alg_key_len for IPComp states
    b8e274e69ab09 ksmbd: fix use-after-free of a deferred file_lock on SMB2_CLOSE then SMB2_CANCEL
    f30e2b879bda1 crypto: amlogic - avoid double cleanup in meson_crypto_probe()
    bb3b942da4123 staging: rtl8723bs: fix OOB write in HT_caps_handler()
    6f26cc55affd9 staging: rtl8723bs: fix OOB reads in is_ap_in_tkip() IE loop
    4c21eec80cf50 staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and join_cmd_hdl()
    9193c34f75fd9 staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
    0406d746574e8 staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop
    1f6c9d255bdda staging: rtl8723bs: fix WEP length underflow and OOB read in OnAuth()
    5d7812360abf3 staging: rtl8723bs: fix heap buffer overflow in rtw_cfg80211_set_wpa_ie()
    85263739e810d staging: media: atomisp: reduce load_primary_binaries() stack usage
    b7da3b9f7c3c5 media: staging: ipu3-imgu: Add range check for imgu_css_cfg_acc_stripe
    eef048dd77ebf staging: vme_user: fix location monitor leak in tsi148 bridge
    0471a3c725326 staging: vme_user: fix location monitor leak in fake bridge
    573e502d14714 smb: client: restrict implied bcc[0] exemption to responses without data area
    adc8b9c30d716 staging: vme_user: bound slave read/write to the kern_buf size
    9a51115fcdc78 tipc: fix out-of-bounds read in broadcast Gap ACK blocks
    a8e3a94711134 6lowpan: fix NHC entry use-after-free on error path
    5e5798880eb15 usb: dwc3: run gadget disconnect from sleepable suspend context
    6c82f88bc7a84 USB: chaoskey: Fix slab-use-after-free in chaoskey_release()
    fde19b0d4eeab hwrng: virtio: clamp device-reported used.len at copy_data()
    74a4cac9603d3 virtio-mmio: fix device release warning on module unload
    96fbafc20ebd9 netfilter: ipset: fix race between dump and ip_set_list resize
    74fef68d52115 mm/damon/ops-common: handle extreme intervals in damon_hot_score()
    0f90c4fadef8c PCI: host-common: Request bus reassignment when not probe-only
    b8189e8b0343d PCI: altera: Do not dispose parent IRQ mapping
    ce2e36e8759df usb: typec: tcpci_rt1711h: unregister TCPCI port with devres
    10666ac9c5529 usb: xhci: Fix sleep in atomic context in xhci_free_streams()
    45df558c543bb binder: fix UAF in binder_free_transaction()
    faa070c7ad8ba binder: fix UAF in binder_thread_release()
    7370cb0dccd6d Bluetooth: btusb: fix wakeup source leak on probe failure
    6e1b10df890f4 Bluetooth: btusb: fix use-after-free on marvell probe failure
    e6313b800da61 Bluetooth: btusb: fix use-after-free on registration failure
    9cc0350f2677e Bluetooth: btusb: Add USB ID 2c4e:0128 for Mercusys MA60XNB
    8e872c07e40d5 vfio: prevent infinite loop in vfio_mig_get_next_state() on blocked arc
    08b74e320c7a2 vfio/pci: Fix racy bitfields and tighten struct layout
    9e0a3f642e607 vfio/pci: Release the VGA arbiter client on register_device() failure
    654710ef3135c vfio/pci: Latch disable_idle_d3 per device
    28f92b8d3fefc vfio/pci: Use a private flag to prevent power state change with VFs
    90310e29ca74e ALSA: usb-audio: Update US-16x08 EQ/comp shadow state after successful writes
    73178209f2fec ALSA: usb-audio: Update Babyface Pro control caches only after successful writes
    b31c5faf77cdf ALSA: usb-audio: Roll back quirk control caches on write errors
    a851636ef95a3 ALSA: usb-audio: Propagate US-16x08 write errors in route/mix EQ-switch put callbacks
    29dc393ab69b8 ALSA: usb-audio: Propagate errors in scarlett_ctl_enum_put()
    a47ecd904c51a ALSA: usb-audio: avoid kobject path lookup in DualSense match
    ea672a9f6cc38 ALSA: seq: Fix uninitialised heap leak in snd_seq_event_dup()
    69bf1dfa32155 ALSA: ice1712: check snd_ctl_new1() return value
    eccf8e91266e3 ALSA: gus: check snd_ctl_new1() return value
    3ed2fa1ed8cc6 ALSA: firewire: isight: bound the sample count to the packet payload
    7531a37720c25 ALSA: es1938: check snd_ctl_new1() return value
    8825a06bfa793 ALSA: cmipci: check snd_ctl_new1() return value
    05df59b9a61f7 ALSA: caiaq: fix out-of-bounds read in the Traktor Kontrol S4 input parser
    91095474eea29 ALSA: ymfpci: check snd_ctl_new1() return value
    c31679fedfedc ALSA: virtio: Add missing 384 kHz PCM rate mapping
    46a2cbf57dc3e iio: temperature: ltc2983: Fix reinit_completion() called after conversion start
    ae73df471a835 iio: magnetometer: ak8975: Add missed pm_runtime_put_autosuspend() call
    664376579d1fd iio: light: veml6030: fix channel type when pushing events
    4337683a3639d iio: light: tsl2591: return actual error from probe IRQ failure
    140117813afde iio: light: opt3001: fix missing state reset on timeout
    f350883989ced iio: light: gp2ap002: fix runtime PM leak on read error
    06158c241f9a3 iio: light: al3010: fix incorrect scale for the highest gain range
    34d9d5c81e9df iio: imu: st_lsm6dsx: deselect shub page before reading whoami
    00982b61d026b iio: imu: inv_icm42600: fix timestamp clock period by using lower value
    5a62be142e28e iio: imu: bmi160: add IRQF_NO_THREAD to data-ready trigger IRQ
    5240dd5cf02ba iio: gyro: bmg160: wait full startup time after mode change at probe
    8d202515baea4 iio: gyro: bmg160: bail out when bandwidth/filter is not in table
    0d4a646d7f87e iio: event: Fix event FIFO reset race
    b131f0011dfef iio: chemical: scd30: Cleanup initializations and fix sign-extension bug
    030fb84816471 iio: adc: ti-ads124s08: Return reset GPIO lookup errors
    f3f90bc7b38ba iio: adc: spear: Initialize completion before requesting IRQ
    820c4f15353ef iio: adc: lpc32xx: Initialize completion before requesting IRQ
    36154171385a8 iio: accel: kxsd9: fix runtime PM imbalance on write_raw() error
    bfffc98f3de92 iio: accel: bmc150: clamp the device-reported FIFO frame count
    d6ef5af7d0fe1 usb: gadget: function: rndis: add length check for header
    caea8b1206043 usb: gadget: function: rndis: add length check to response query
    e1919d0267065 MIPS: smp: report dying CPU to RCU in stop_this_cpu()
    cd2463ec60f0d net: Drop the lock in skb_may_tx_timestamp()
    b0b39425b5202 LoongArch: Add PIO for early access before ACPI PCI root register
    865a048a3f5ac virtio_net: Support dynamic rss indirection table size
    dbab796ff3803 arm64: sysreg: Correct sign definitions for EIESB and DoubleLock
    804e2e41641bd arm64: Revamp HCR_EL2.E2H RES1 detection
    6e5714bcc98f3 KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()
    a2c343370351f KVM: arm64: Initialize HCR_EL2.E2H early
    153ed820d525b arm64: Fix early handling of FEAT_E2H0 not being implemented
    4f25422239d09 arm64: Treat HCR_EL2.E2H as RES1 when ID_AA64MMFR4_EL1.E2H0 is negative
    d087272c49aa5 arm64: sysreg: Add layout for ID_AA64MMFR4_EL1
    5b8729416ee88 crypto: talitos - rename first/last to first_desc/last_desc
    22e2db16c8011 crypto: talitos - fix SEC1 32k ahash request limitation
    1981cde2f0be4 crypto: talitos - stop using crypto_ahash::init
    7c3ba8f490f5b Revert "crypto: talitos - fix SEC1 32k ahash request limitation"
    f35e5399c97b1 Revert "crypto: talitos - rename first/last to first_desc/last_desc"
    4cdb1b3ab96eb perf/core: Detach event groups during remove_on_exec
    a44343fe230aa ACPI: NFIT: core: Fix possible NULL pointer dereference
    2fb80e9620290 ACPI: CPPC: Suppress UBSAN warning caused by field misuse
    140133dac0ae9 perf trace beauty fcntl: Fix build with older kernel headers
    927ef409f7139 Bluetooth: ISO: Copy BASE if service data matches EIR_BAA_SERVICE_UUID
    a444c3de7187b xfs: move ->iop_recover to xfs_defer_op_type
    5e327f772ca89 xfs: use xfs_defer_finish_one to finish recovered work items
    ce9d7f9188f18 xfs: dump the recovered xattri log item if corruption happens
    9395d11f63415 xfs: recreate work items when recovering intent items
    9af37d8be0fb6 mm/vmscan: flush deferred TLB before freeing large folios
    420e5aad7ba89 team: fix header_ops type confusion with non-Ethernet ports
    9532d0d0ad1d7 bonding: prevent potential infinite loop in bond_header_parse()
    5d0fb9806ab6c bonding: fix type confusion in bond_setup_by_slave()
    4128ccd7683f8 bonding: fix xfrm offload feature setup on active-backup mode
    8d5c8ac644554 bonding: use common function to compute the features
    a1d397dbc00a7 net: add a common function to compute features for upper devices
    ed976725dba37 bonding: Correctly support GSO ESP offload
    3b2bd2018938b bonding: add ESP offload features when slaves support
    4a85b335f8704 bonding: Fix initial {vlan,mpls}_feature set in bond_compute_features
    7cf5a74558e31 net, team, bonding: Add netdev_base_features helper
    1f1fe94e0c727 net: team: rename team to team_core for linking
    f59f8c2addba0 nfsd: change nfs4_client_to_reclaim() to allocate data
    2a8ff394907fe nfsd: move name lookup out of nfsd4_list_rec_dir()
    42726c616d958 apparmor: advertise the tcp fast open fix is applied
    655349816642f nfsd: Don't reset the write verifier on a commit EAGAIN
    eeabb9020721d NFSv4/flexfiles: reject zero filehandle version count
    a7a526fbc847f fbdev: fbcon: fix out-of-bounds read in err_out of fbcon_do_set_font()
    da9d8d9711f78 i2c: core: fix adapter registration race
    4a0034756c2a6 i2c: core: fix adapter debugfs creation
    ad4322d84ebf7 i2c: core: fix NULL-deref on adapter registration failure
    2f8a894e148a0 i2c: core: fix hang on adapter registration failure
    055aff407db51 i2c: core: fix irq domain leak on adapter registration failure
    1a02a5028bd6d block: Avoid mounting the bdev pseudo-filesystem in userspace
    92fc631b69deb KVM: Replace guest-triggerable BUG_ON() in ioeventfd datamatch with get_unaligned()
    2770041f34b52 f2fs: fix listxattr handling of corrupted xattr entries
    1436031b33fa2 f2fs: fix potential deadlock in gc_merge path of f2fs_balance_fs()
    345c1d1ff7511 f2fs: fix potential deadlock in f2fs_balance_fs()
    76e1a05cf6d40 f2fs: bound i_inline_xattr_size for non-inline-xattr inodes
    7d3ae21783e59 f2fs: atomic: fix UAF issue on f2fs_inode_info.atomic_inode
    d2f236196d542 f2fs: validate orphan inode entry count
    f0b4e1cc8ad76 device property: initialize the remaining fields of fwnode_handle in fwnode_init()
    e54c05ed3d9c2 net: ip_gre: require CAP_NET_ADMIN in the device netns for changelink
    c717f052d7023 drm/amd: Fix set but not used warnings
    290014c798763 slimbus: qcom-ngd-ctrl: Register callbacks after creating the ngd
    c75f153e5d547 slimbus: Convert to platform remove callback returning void
    e43819a198b56 slimbus: qcom-ngd-ctrl: Correct PDR and SSR cleanup ownership
    da82ec28a0cf1 slimbus: qcom-ngd-ctrl: Fix probe error path ordering
    ade787f047906 Bluetooth: btmtk: Fix btmtk.c undefined reference build error
    f6290849b88a0 perf: Fix dangling cgroup pointer in cpuctx backport
    5f4dbdb0a8759 userfaultfd: gate must_wait writability check on pte_present()
    9440a6980fc63 Bluetooth: btmtk: Fix wait_on_bit_timeout interruption during shutdown
    51c4b6e9c0e56 Bluetooth: btmtk: Fix failed to send func ctrl for MediaTek devices.
    f344a2d77d47e Bluetooth: btmtk: move btusb_mtk_[setup, shutdown] to btmtk.c
    9eca71da3b843 Bluetooth: btusb: mediatek: return error for failed reg access
    6501b60129664 Bluetooth: btusb: mediatek: remove the unnecessary goto tag
    6b6d985e7a889 Bluetooth: btusb: mediatek: add MT7922 subsystem reset
    1c770a550df2f Bluetooth: btusb: mediatek: reset the controller before downloading the fw
    eae5bb7c0c160 Bluetooth: btmtk: apply the common btmtk_fw_get_filename
    1fa22de588a65 LoongArch: Report dying CPU to RCU in stop_this_cpu()
    dd699a60a29ee ext4: get rid of ppath in get_ext_path()
    666e837b247fc nfsd: reset write verifier on deferred writeback errors
    48a586e382e4d nfsd: release layout stid on setlease failure
    c39973ebd7329 bpf, arm64: Reject out-of-range B.cond targets
    bb51b626b5a8e ia64: Make acpi_cpufreq_cpu_exit return void

(From OE-Core rev: 92b8d1a7a5576a677c1e299963b44174ed2dceb6)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index cb8d8c418f1..d252eb8c4a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d7fbdb4e5e7a35bdb8bb87d159204d74ef130a32"
-SRCREV_meta ?= "a77e1b965423603456f2d9dbf3de53bb8a3d75af"
+SRCREV_machine ?= "27ed791688e060988fb39429477ee529093c9a01"
+SRCREV_meta ?= "127bac58b21e8c3769d0cf2432f706f5605c4afb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.144"
+LINUX_VERSION ?= "6.6.147"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 73d971f7eee..f50f5cd51e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.144"
+LINUX_VERSION ?= "6.6.147"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "25b07b85b558f3587c11c9363cccd9cb93fcef45"
-SRCREV_meta ?= "a77e1b965423603456f2d9dbf3de53bb8a3d75af"
+SRCREV_machine ?= "18f147623b634b40b3bc5823ae03f049bb14fc84"
+SRCREV_meta ?= "127bac58b21e8c3769d0cf2432f706f5605c4afb"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 64609554ee2..77274850c2b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "3adc19c1e1e3ee865f9b0d7bc0fedd0e4aeee995"
-SRCREV_machine:qemuarm64 ?= "39a4fe09d3d795042cc14eb3c78f6a03874c48df"
-SRCREV_machine:qemuloongarch64 ?= "2baf8e92ef6ad38945005adf39342b9efb4509ec"
-SRCREV_machine:qemumips ?= "ba0b8f925ec8b5926c6c2ddbc2c2c77305324bab"
-SRCREV_machine:qemuppc ?= "66c01b44545110249c940f865c4ed10d4d315b29"
-SRCREV_machine:qemuriscv64 ?= "2baf8e92ef6ad38945005adf39342b9efb4509ec"
-SRCREV_machine:qemuriscv32 ?= "2baf8e92ef6ad38945005adf39342b9efb4509ec"
-SRCREV_machine:qemux86 ?= "2baf8e92ef6ad38945005adf39342b9efb4509ec"
-SRCREV_machine:qemux86-64 ?= "2baf8e92ef6ad38945005adf39342b9efb4509ec"
-SRCREV_machine:qemumips64 ?= "1793417d6568e244579278e6f1fc7107987946f5"
-SRCREV_machine ?= "2baf8e92ef6ad38945005adf39342b9efb4509ec"
-SRCREV_meta ?= "a77e1b965423603456f2d9dbf3de53bb8a3d75af"
+SRCREV_machine:qemuarm ?= "1790b505a65896a34abc5abe3109f9811f6f2960"
+SRCREV_machine:qemuarm64 ?= "4da6f6f6201c34d32cf5ae6524f8de44d003f0ed"
+SRCREV_machine:qemuloongarch64 ?= "402296b5e824b46fd4301eddc7c389b9f7fe1d82"
+SRCREV_machine:qemumips ?= "254643819dbbde9f388d8d02b6d2550606b8e442"
+SRCREV_machine:qemuppc ?= "c0e9acf672bff2c9001b96423b8ae5723d7f7190"
+SRCREV_machine:qemuriscv64 ?= "402296b5e824b46fd4301eddc7c389b9f7fe1d82"
+SRCREV_machine:qemuriscv32 ?= "402296b5e824b46fd4301eddc7c389b9f7fe1d82"
+SRCREV_machine:qemux86 ?= "402296b5e824b46fd4301eddc7c389b9f7fe1d82"
+SRCREV_machine:qemux86-64 ?= "402296b5e824b46fd4301eddc7c389b9f7fe1d82"
+SRCREV_machine:qemumips64 ?= "830cb34f387303f99b95f1f3e3938794195ff1a6"
+SRCREV_machine ?= "402296b5e824b46fd4301eddc7c389b9f7fe1d82"
+SRCREV_meta ?= "127bac58b21e8c3769d0cf2432f706f5605c4afb"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "da47cbc254661aa66d61ef061485a7080305c4be"
+SRCREV_machine:class-devupstream ?= "a1153c0deb44f75190f07677c0c6d61efd887246"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.144"
+LINUX_VERSION ?= "6.6.147"
 
 PV = "${LINUX_VERSION}+git"
 

