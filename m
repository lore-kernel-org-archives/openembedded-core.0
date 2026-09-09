Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED3EC79FB9
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:29:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6430.1788938997300836205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Bzkhdr7I;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f96c5b722so3889765f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788938995; x=1789543795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Io6KDWFWJjeBfov3c6B+ah48x7CTVaKauI3BrgXzycM=;
        b=Bzkhdr7IuicGRYQJBr5dHtL8oUJmsd19J8MCcqD7JN4wXDs2RA7XiKpzWiWYN1FFGr
         PuT6auWZpnCPGzX/PK6QxkMVz3xQrbxL5Gvd5U7bYNgSGyih5LT+rOke2UoH7KxkxAV3
         IViqP0jObvmzQ3EyDeojqvbCMkqCqbi67WP7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938995; x=1789543795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Io6KDWFWJjeBfov3c6B+ah48x7CTVaKauI3BrgXzycM=;
        b=Tt9xjf92G5ybzBAjw3WbHVeZLAfsaYM5IqGOVKeKSi3pYvNZfZX0O238XJ65IV21u7
         EETE/Wx8ODE3/R5s84MhOOhLlO7niL07FXrnbaSFPp6sRxf4lv8WrfKD/teKiNMQfH15
         iVhSpW4kyYQ3CUjZhMjKvva1qXPqPjflaoK36YScEE7bzbTvJ92vI/A6yRsGkLtIn//G
         L53HzWFqNaY67tHyvAPp/MxYJTg3LR1p1LEBgK3yC5V1D/f7+YZe38RxfCZFzBPb2UdL
         JdbqtbWni0b3wG4yy4R4zSxQ6XZ3rHnPFUXJ/lDfVbdd9eyMI9ifFSeqqCzGS2oWW6MW
         Hl7w==
X-Gm-Message-State: AFuF++kFAwmRBqlVmIgtS0XNZcyUTg8nu4bAjFvLfyofwynEarj5g3x3
	zfg8W1sowxg1GaBHvp2bVS4d8zhktdK+Ot1PCkKmnSkSo+DeXRisfqbmcrqjOtHSL/DQnZ6ZNsH
	U6QTZUck=
X-Gm-Gg: AYBFou0ODF4ypH4gEFEODtHpk0boW6kaRKbFawd+pjzSpPjBUUcywYUuGn8czEgnVhn
	a5Sa6MQM7sqEtXl/vCxLg68A9PykmF3YmLfb63k3nCSgD4shm1H7bDYNgI56dhL9VLaI31Qyfgz
	zwmFK7FQ8IOjj3VgZEYV+Zt7QbNLjbFoXFCrgK3WjAU1uq59XNqAN3gIrTwxp3571H8OW/SUAbt
	ka019qbBf1AvIftErwgj4xglEc6WOX3VYDJVPUne9ULv0U+FvgGZkK/DST7FefZ7qxNV3M4jUFp
	VAuB/++7glP45/TEbpAQ9gOo5HzgaXc4p53dAZjvSFEUsnc45Rdbu0oqnCd13+ruE2fK0oMZw4Y
	6RAxyzFuPqwYywHwJRQEey/8JpDHal21QmNubTmBgdbpHUTPKbUXU6Hz6zCfAvWyqGc8fZJM7eD
	rQ9rubUtt3mJ9lMoOTvILSyrRoWZ5cvXi6kjevUrwKOC2q2WHt6joz0AVbAcYgvOmDFf3JpVkUA
	pjV8rzn7rKkr5wFvuS98r9VItS5rEmj4BQA63Br0FtTA6LWmFlr79eVVvOSlc3XmXTzEhPcZNQ=
X-Received: by 2002:a05:6000:4a0a:b0:484:3310:f39b with SMTP id ffacd0b85a97d-485872e05f9mr36397343f8f.28.1788938994868;
        Wed, 09 Sep 2026 00:29:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.29.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:29:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/38] linux-yocto/6.18: update to v6.18.48
Date: Wed,  9 Sep 2026 09:29:03 +0200
Message-ID: <6e1e2cea84e83705a95e341d7eccf7e1b804b9fb.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245414

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    5bbb9c9f8f808 Linux 6.18.48
    c49f04e8d2b94 inet: frags: strip GSO state from fragments before reassembly
    7519e95095c9b Linux 6.18.47
    3ce832e2bd431 net: gro: properly validate BIG TCP aggregation criteria
    5b4f2bec7bea6 ptp: vmclock: prevent read-only mappings from becoming writable
    dba60d26e9dda futex: Avoid private hash use-after-free on final put
    e1534d49a7b8b Bluetooth: hci_aml: validate firmware segment lengths
    b7d9edcf9fe6e Bluetooth: MGMT: reject HCI_CMD_SYNC params_len above 255
    1f6d1f2611af0 Bluetooth: ISO: zero the sockaddr before returning it in getname
    753af97d8d423 Bluetooth: ISO: do not force BT_LISTEN after a failed BIG sync
    fe93a697a7a92 Bluetooth: hci_sync: Fix accept list UAF during suspend
    e3f82e8f2a591 Bluetooth: hci_event: validate LE Set CIG Parameters response
    39a3afb91be3c Bluetooth: hci_event: fix LE list UAF on reset
    608f8fd8c0f7b HID: hyperv: validate initial device info bounds
    849e537160bbb HID: uclogic: fix use-after-free of inrange_timer on remove
    8406d4b69d48b HID: sensor: custom: Fix use-after-free in enable_sensor
    1fa1591efd417 HID: core: fix number/pointer type confusion on long items
    5efcd7bbfaaec HID: nintendo: stop device IO before hid_hw_stop on probe failure
    268679f501386 HID: nintendo: register input device after capabilities are set
    51cfd1adbe7a4 HID: nintendo: fix out-of-bounds read in joycon_ctlr_read_handler()
    942b89f7824f8 futex: Fix might_sleep() warning in futex_pivot_pending()
    86d12b34bafc9 futex: Fix race on the initial mm->futex.phash.ref allocation
    fdf538b2e6965 futex/pi: Plug private futex exec() race
    4da67def9efe6 futex: Sanitize and document task_struct::futex::state transitions
    2b92e5562653b futex/pi: Reject cross-mm private futex owners
    f303f6a4c9099 Input: atkbd - skip deactivate for HONOR ZQC-P
    936ea65543da0 Input: atkbd - skip deactivate for HONOR FMB-P's internal keyboard
    0ea8f06454012 xfrm: fix sk_dst_cache double-free in xfrm_user_policy()
    39fc615e355b6 net/ionic: avoid OOB TX partner lookup for hwstamp RXQ
    4529c03c3da8f HID: pidff: fix OOB write when hid->inputs is empty
    9a1d7c5f0d82e HID: core: fix OOB read of field->usage in hid_set_field()
    ace7fc4d38799 HID: magicmouse: Prevent out-of-bounds (OOB) read during DOUBLE_REPORT_ID
    15b60ade825c8 HID: magicmouse: do not keep a stale msc->input if no input is claimed
    62ec3c591ee81 HID: magicmouse: re-enable multitouch after reset-resume
    02a88f8308ae7 HID: magicmouse: fix battery reporting for Bluetooth Magic Trackpad USB-C
    b6baab796d11f ASoC: codecs: lpass-tx-macro: Fix enum kcontrol accesses
    9fe5eebb664ec mptcp: pm: fix memory leak from alloc-during-teardown race
    6fa2064761ec0 mptcp: pm: uniform announced addresses helpers
    714c6d11aceaa mptcp: pm: rename add_entry structure to add_addr
    defc59e74c1b4 mptcp: pm: use for_each_subflow helper
    f31650243c1ab nvmet: pci-epf: put CQ ref on create_cq mapping failure
    20be486d1c225 nvmet: pci-epf: fix use-after-free in nvmet_pci_epf_exec_iod_work()
    9c95f7e66c62e nvmet-tcp: Do not WARN on remotely-controlled oversized SGL allocations
    6d27199ebe8cb nvmet-tcp: bound SGL data length before allocating command buffers
    8bce9cd08aae4 nvmet-fc: fix invalid free in LS IOD error path
    b26189d284421 nvmet-auth: zero the AUTH_RECEIVE response buffer
    23a475ff24d29 dmaengine: fsl-edma: Add error handling for devm_kasprintf
    364edaedf4125 mailbox: mchp-ipc-sbi: Add null check for devm_kasprintf()
    3dc98e5fe82d0 ipv6: fix use-after-free in ip6_finish_output2()
    d9d1a676b033a ipv4: reject undersized MTUs in ip_do_fragment()
    f034150305791 drm/xe: Fix DPT allocation paths.
    20892d2923e48 nfc: nci: free destination parameters when closing a connection
    0d4b5cfab6891 nfc: nci: fix uninit-value in the RF discover/activated NTF handlers
    2f08dbce3b376 nfc: nci: fix out-of-bounds write in nci_target_auto_activated()
    9620a91f8d643 nfc: nci: add data_len bound checks to activation parameter extractors
    bfcca5f42c9aa nfc: st21nfca: validate ATR_REQ length against the received frame
    2f5d093194ec2 nfc: pn533: purge fragmented skbs during cleanup
    e969e98410051 nfc: llcp: reject PDUs shorter than the LLCP header
    2d239590d1845 nfc: llcp: fix OOB read and u8 offset wrap in TLV parsers
    e87527b506c40 nfc: llcp: bound the connect_sn TLV walk to the skb
    d0902a7c45432 nfc: microread: validate target discovery payload lengths
    db7e464b35096 nfc: fdp: bound the device-reported read length and fix an skb leak
    a56773e649ea9 nfc: digital: clamp SENSF_RES length to the destination buffer
    cb8246e5846db libceph: fix OOB read in decode_watchers() via missing bounds check
    184c1a80421a5 xfs: validate attr entry pointer before field access
    e0e7f464d6ce8 ext4: fix incorrect function call when initializing s_resgid
    458776af0061a ext4: don't enable DAX on new encrypted files
    f3d2fa3a99336 ext4: propagate errors from fast commit range replay
    5f46f084f74b5 ext4: avoid tail write_begin walk for uptodate folios
    fb5980fbe44fc ext4: clear error before retrying inode xattr space fallback
    e447f7edb99bd nilfs2: reject invalid block index in GC ioctl
    4902a5cba21ae ext4: stop retrying saturated xattr cache entries
    e11f5b48c8270 kcov: fix data corruption and race conditions on PREEMPT_RT
    164ca33cf5366 null_blk: fix UBSAN shift-out-of-bounds when zone_size is 0 or overflows
    6176313622e34 ocfs2: fix missing metadata reservation for large xattrs
    15ccf53709859 io_uring/uring_cmd: don't skip completion for a synchronous multishot cmd
    45c945107e007 io_uring/rsrc: fix folio size overflow in io_vec_fill_bvec()
    4074ae2f1da9e io_uring/io-wq: fix worker accounting when canceling creation callbacks
    b6a768aa975b9 io_uring/cmd: fix iovec leak when the async cmd is not recycled
    f20c2c32ec1c5 ALSA: dummy: Check card index validity at probe
    3da64f2ed902b io_uring/futex: don't mark futex wake requests as inflight
    61dc1a37e04d4 nvmet: fix NULL pointer dereference in nvmet_execute_identify_nslist()
    e971d956353d3 rndis_host: add overflow check in rndis_rx_fixup()
    4305e4b52acc0 ALSA: scarlett2: Use a private URB for the notification endpoint
    65aceb45ca91d ALSA: FCP: Use a private URB for the notification endpoint
    7596354148c5a iommu/iommufd: Fix NULL pointer deref in iommufd_ioas_change_process when racing with iopt_map_file_pages
    d2ab08437e913 iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free on teardown
    d4b1a13b1eff2 Bluetooth: RFCOMM: take rfcomm_mutex for the deferred setup accept
    0c55707bd5d0d PCI: host-generic: Fix NULL pointer dereference on 32-bit CAM systems
    159d162fe80bd xfs: don't livelock in scrub on a circular unlinked list
    a05a1b663464b xfs: hoist per-bucket unlinked list check to helper
    8d678be8e58e9 xfs: rtsummary scrub should treat rtbitmap corruption errors as an xref error
    00e2baf0b5ea9 xfs: add a xchk_ip_set_corrupt helper
    755d0b7ee3563 serial: sc16is7xx: enable THRI before filling TX FIFO
    c5a12344a043e serial: sc16is7xx: use guards for simple mutex locks
    450fe8f6f1f8c serial: sc16is7xx: rename EFR mutex with generic name
    1f99e9ab748fc Linux 6.18.46
    b7ce4b3bc1068 ALSA: hda/realtek: Enable headset mic on F+ FLAPTOP r
    192f44513a03b firewire: ohci: initialize page array to use alloc_pages_bulk() correctly
    e5e6ce7009a6c drm/vmwgfx: Set surface-framebuffer GEM objects
    7e351209dc2f4 erofs: fix EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS on some UP platforms
    67ac7e01c26be spi: virtio: mark device ready before registering the controller
    a7d172b27aa3e drm/log: Fix infinite loop when scale is too large for display
    a6325e2807dc2 drm/client: Remove drm_client_framebuffer_delete()
    329731b3119f0 drm/client: Deprecate struct drm_client_buffer.gem
    0763282e689e2 drm/client: Inline drm_client_buffer_addfb() and _rmfb()
    60f1a2ecdf8b9 drm/client: Move dumb-buffer handling to drm_client_framebuffer_create()
    841bc853a2b11 drm/client: Remove pitch from struct drm_client_buffer
    16a2716910ecf drm/log: Fix out-of-bounds read on empty message length
    948f346fe36e1 drm/xe/oa: Fix sync entry leak on OA config emit failure
    ed5470771c7ed firewire: ohci: fix NULL pointer dereference in ar_context_release
    384d9f04b38f4 firewire: ohci: split page allocation from dma mapping
    adb3e7c26a51a net/sched: cls_bpf: reject dev-bound programs bound to a different device
    1f493c44a2f04 accel/amdxdna: Skip unmapped range in aie2_populate_range()
    72e4e3d7efc3b net: ethernet: ti: am65-cpsw-nuss: Fix port_id extraction from SRC TAG
    6cf600b276a55 regmap: sdw-mbq: don't call an unset readable_reg callback
    c27eed546ae20 m68k: Define NR_CPUS to 1
    31f26a95eeee9 net/sched: cls_u32: skip hash tables in u32_bind_class()
    abceabc4408fc net/sched: act_api: fix TOCTOU NULL deref on a->goto_chain
    98c5914d6b7bd af_packet: Don't send zero-byte data in tpacket_snd().
    37c5ccaaacd48 regmap: sdw-mbq: Fix swap of timeout and retry times
    f51a540b14eec ASoC: xilinx: formatter_pcm: pass aud_drv_data to irq handlers
    82d9269f01ebf net/tls: Fail tls_sw_splice_read() after a failed async decrypt
    cef4c5b9aca24 net: ngbe: fix NULL pointer dereference in non-MSI-X interrupt enabling
    5ffaa5d7f56ab net: tap: fix wrong transport_header when sending VLAN-tagged frame
    f9297abbcaba7 net: packet: fix wrong transport_header when sending VLAN-tagged frame
    0af3afd054e7b net: phy: realtek: fix EEE advertisement write on the internal PHY MMD path
    17e3181d740d1 tcp: fix icsk_ack.ato bitfield overflow
    73f8dd22b1e53 veth: fix queue index used to wake the peer txq in veth_poll
    96fa90b74385b macvlan: inherit needed_headroom and needed_tailroom from lowerdev
    5f33188457bbc ipvlan: inherit needed_headroom and needed_tailroom from phy_dev
    1072f0f442820 eth: bnxt: keep the aRFS rmap updated when TPH is enabled
    394f1b16c5d1b eth: bnxt: cancel IRQ notifier before freeing affinity mask
    a26a1be1b6541 netfilter: ipset: let destroy callbacks adjust ext mem size
    29c011b3537d7 netfilter: ipset: fix list type element drift bug
    d9d3050a70efe netfilter: flowtable: publish GC-visible tuple last
    4a923fe60939a netfilter: nf_tables_offload: suppress WARN_ON_ONCE for ENOMEM in abort path
    cb20da33839f2 netfilter: ipset: fix refcount race between list:set GC and swap
    9e75e7da43740 ASoC: tas2781: fix clang build error for goto bypassing cleanup variable
    24d0f33f5415f gpio: ml-ioh: share the register lock across channels
    7a03413f31c19 perf: Reject exited events as group leaders
    6c85d169eeecc riscv: ftrace: Fix ftrace_modify_call failure on kprobed functions
    a3a676495c641 ovpn: finish crypto callback cleanup before peer release
    a47a080d06ee9 ovpn: fix NULL dereference when killing missing key
    99a18e1d979e0 crypto: tegra - fix rctx->cryptlen calculation in tegra_gcm_do_one_req()
    3e4bf50c94511 crypto: ccm - Set rfc4309 maxauthsize from child
    d9ecc9787e118 arm64: tegra: Add EL2 virtual timer interrupt for Tegra194
    a4e340971fe8c NTB: ntb_netdev: Preserve RX queue depth on allocation failure
    08437c5156b0a net: ntb_netdev: Introduce per-queue context
    2a7d8fc0fd50e ASoC: SOF: ipc4-topology: Refresh copier IPC payload before widget setup
    8c685df5c3b26 drm/amd/pm: fix pptable use-after-free
    2895aeb4327c9 drm/amd/pm: adjust the visibility of pp_table sysfs node
    7755be923e325 mm/page_table_check: skip special zero mappings
    4ae625d16eefb ring-buffer: Prevent resizing of persistent ring buffer
    54fc67500ad1b ring-buffer: Store bpage pointers into subbuf_ids
    27d7fcaf237df ring-buffer: Add helper functions for allocations
    2ca6b43edf83f sched_ext: Take cgroup_lock() first in scx_cgroup_lock()
    f786e6652b931 sched_ext: Reorganize enable/disable path for multi-scheduler support
    0907f81536f7d sched_ext: Update p->scx.disallow warning in scx_init_task()
    4a7e941ca29a6 futex: Fix race in futex_pivot_pending() during private hash resize
    870f8392b284e can: rcar_canfd: change the initializing flow for clocks and resets
    45bf067681ad5 can: rcar_canfd: Extract rcar_canfd_global_{,de}init()
    e7a4ca927857a can: rcar_canfd: Use devm_clk_get_optional() for RAM clk
    f8c8c81707d17 can: rcar_canfd: Invert global vs. channel teardown
    562d4befa9357 can: rcar_canfd: Invert reset assert order
    867aed6a48487 binfmt_misc: don't leak the user namespace when the mount fails
    4c8d7595a10a6 ata: libata-scsi: terminate deferred commands on time out
    db488d653d896 ASoC: tas2562: Validate values for volume writes
    5f0a99ea72120 KVM: x86: Cancel delayed I/O APIC EOI handling before destroying vCPUs
    ef60eca789ee6 userfaultfd: wait on source PMD during UFFDIO_MOVE
    ea563ed2b10ae mm: replace pmd_to_swp_entry() with softleaf_from_pmd()
    54a09573eb440 fs/proc/task_mmu: refactor pagemap_pmd_range()
    549148d5aa4e3 btrfs: zoned: fix missing chunk metadata reservation
    58ae8b7e8dc88 btrfs: remove fs_info argument from btrfs_zoned_activate_one_bg()
    d9e9753dfd43b ksmbd: validate minimum PDU size for transform requests
    15a2fedb5dff3 smb/server: fix minimum SMB2 PDU size
    23d34ce118857 smb/server: fix minimum SMB1 PDU size
    5649004f71613 ksmbd: rename smb2_get_msg to smb_get_msg
    29dbb4e29e1f1 ksmbd: Fix to handle removal of rfc1002 header from smb_hdr
    df3cf61adbe68 smb/server: rename include guard in smb_common.h
    9d154c3c0f5d9 smb: move get_rfc1002_len() to common/smbglob.h
    8ddc2eb0d2da9 net/sched: serialize qdisc_rtab_list against concurrent get/put
    89df5d71f83f8 libceph: fix two unsafe bare decodes in decode_lockers()
    590b07ceea138 libceph: bound pg_{temp,upmap,upmap_items} length to CEPH_PG_MAX_SIZE
    89a50fb32d69a libceph: Amend checking to fix `make W=1` build breakage
    a3bc6b3e9ef3f ceph: fix hanging __ceph_get_caps() with stale mds_wanted
    79d95b43ca090 ceph: avoid fs reclaim while using current->journal_info
    bb13785d54999 xfs: check v5 superblock features early
    04228b8ba196f xfs: check xfarray iteration errors when committing unlinked inode lists
    33b56c6c465aa xfs: don't ignore runtime errors in xrep_iunlink_reload_next
    38a4dbe588bd0 xfs: don't swallow dquot recovery verification errors
    0f27b22343b63 xfs: fix exchange-range reflink flag clearing issue with INO1_WRITTEN
    cd1f876d1bc2e xfs: avoid UAF on sc->tempip in xrep_tempfile_create
    e75150d494dcd xfs: don't return EFSCORRUPTED when scrubbing corrupt parent pointers
    b6baf0db357fb xfs: fix another iunlink infinite loop bug in online fsck
    fc7d8a5c5fcc7 xfs: fix allocated inodes that show up in the unlinked list
    c36d7f68f1c2e xfs: don't walk off the end of a null sc->sa.agi_bp in AGI repair
    73ffd2620df3a xfs: don't zap the attr fork on repair when there are queued pptr updates
    514a5d42d4188 xfs: fix ilock leak on error in xfs_dq_get_next_id
    9680b1929d897 xfs: load next_agino from the correct xfarray in xrep_iunlink_relink_prev
    8b52fa8fb3abb xfs: nlink scrub must take IOLOCK before determining ILOCK state
    7d1d82c463e22 xfs: pass runtime errors from xrep_iunlink_mark_ondisk_rec up to callers
    ab4e133370763 xfs: set the prev pointer when reinserting an inode on the unlinked list
    ce2a7006ec5ed xfs: don't double-lock when deleting a self-referential directory
    983588e756a30 xfs: only check mergeability of bnobt records
    62c0b1435dfe2 xfs: zero i_nlink before repair puts inode on unlinked list
    a9114c6d4ec2f xfs: fix transaction block reservation in xrep_rtbitmap
    90a49b8fcf821 xfs: check cowextsize in xrep_inode_cowextsize
    069c0eadc8df0 xfs: clear zapped attr fork state when bmap repair finds no attr fork
    aeadf3fd2dc3c xfs: mark nonzero sb_gquotino as corrupt on metadir filesystems
    f8288214459ea xfs: bounds-check buffer log item's dirty bitmap
    8a0ecae2ecda9 xfs: fix off-by-one in rtrefcount btree root level validation
    ec19cea4ef1ce xfs: propagate errors from xfs_rtginode_load
    71aa45f7bfe46 drm/amdgpu: disallow multiple FENCE chunks in one submit
    25ee120f3803a drm/amdgpu: Fix UVD decode image min size calculation
    38914cb2c6afb drm/amdgpu: Fix UVD dpb min size calculation for H264
    c76e5cca0675b drm/amdgpu: Fix UVD min buffer sizes
    86a5cb0203221 drm/amdgpu: Implement insert_end for VCE 3
    339deb76ee485 drm/amdgpu: Reject UVD message with dimensions above 4096
    220aa2589d732 drm/amdgpu: validate GEM_CREATE domain combinations
    a082bd76c5f25 drm/amdgpu: check ASPM on the dGPU host link
    916e8a1550be1 drm/amdgpu: fix nbif 6.3.1 l1 low power not functional
    e304c3e0d9ce2 drm/amdgpu: Reject UVD message with invalid number of h265 refs
    e3e6a631dcb1c drm/amd/display: fix BT.2020 YCbCr output CSC matrices for DCE
    cd99fa1cbaf5a drm/amd/display: fix BT.2020 YCbCr limited output CSC matrix
    5045fb4c70bfd drm/amd/display: Fix NULL pointer dereference in amdgpu_dm_crtc_set_vblank()
    95c1de6923b06 s390/zcrypt: Fix CPRB memory allocation in zcrypt misc code
    7902be374cbfc s390/vfio_ccw: Implement a crw lock
    3b224d3c50a38 s390/vfio_ccw: Calculate idal length based on idaw type
    b6aecea4b2b24 s390/vfio_ccw: Selectively expand io_mutex
    af1759d8e6e6d s390/vfio_ccw: Move cp cleanup out of not operational
    4c2e1d359d7a2 s390/vfio_ccw: Fix out of bounds check on CCW array
    08ef2a8211569 s390/vfio_ccw: Ensure first IDAW remains constant
    649badf3a2fd8 s390/vfio_ccw: Ensure index for read/write regions are within range
    b7ae0f7993867 s390/vfio_ccw: Cancel existing workqueues
    06f4d6e5a8af6 s390/vfio_ccw: Limit the number of channel program segments
    32e3d364a7b82 s390/vfio_ccw: Free all memory if cp_init() fails
    45aa38567c798 eth: bnxt: make sure we populate the qcfg defaults on old FW/HW
    0382ed41c6645 eth: bnxt: always set the queue mgmt ops
    31ef57083e785 drm/radeon: fix autosuspend cleanup during teardown
    361114857813d drm/xe: Fix xe_device_probe() failure
    7b90db6f024b8 drm/xe: Order ring writes before ring tail updates
    198b4a89b9033 pmdomain: mediatek: Fix mt8183 hang on boot
    8f7f7a6d5aed8 mmc: loongson2: Fix sg iteration in data reorder functions
    e5b527804a1ea drm/connector/hdmi: Fix out of bounds memory read
    b5060ff2f5460 mmc: atmel-mci: Fix use-after-free in atmci_remove due to race condition
    78e59ab343372 pmdomains: mediatek: Avoid setting RTFF's CLK_DIS before NRESTORE
    7c0d1767ce464 mmc: sdhci: make tuning_err a signed int
    970b9c83a07c4 pmdomain: mediatek: fix remaining %pOF after of_node_put()
    36d1b69c5c698 mmc: sdhci: unmap the bounce buffer before device release
    0418b7ed2c1c6 mmc: omap_hsmmc: fix busy_timeout overflow in ns conversion on 32-bit
    b37e84280045b libceph: tolerate addrvecs with multiple entries of the same type
    4490fad7992a7 ceph: fix MDS random selection readiness predicate
    4f392fec07556 libceph: Avoid using invalid osd indices from primary_temp
    f3854719fba9f Input: sur40 - fix V4L error path cleanup
    5c1c5227c93f1 Input: sur40 - fix input device registration ordering
    a88d688be8d7f openrisc: signal: do not restore privileged SR bits on sigreturn
    f634598e8fb7b ftrace: Fix off-by-one fentry site disable in ftrace_free_mem()
    f8fe843a96344 ftrace: Protect direct_functions in ftrace_find_rec_direct
    d1bba38574d09 libceph: fix multiple unsafe decodes in decode_locker()
    ebdecef6fd842 pmdomain: arm: Fix -EINVAL from scmi_pd_set_perf_state() on state 0
    bc7934d0acd4f gpio: ml-ioh: use raw_spinlock_t for the register lock
    9e678cffc11c2 gve: fix zero-length skb frag with header-split
    bd4e5a97edf8c selftests/ftrace: Convert ELF entry point to file offset in uprobe test
    23e9f32c0c7d2 gpio: sloppy-logic-analyzer: fix use-after-free via debugfs trigger on unbind
    e9482feeed66d gve: fix NULL dereference due to missing ptp adjfine
    a134e4b8102c0 crypto: qce - fix error path in devm_qce_register_algs
    ef92c0ad0268e crypto: starfive - use scatterlist length before DMA mapping
    38e7d5c1ade04 Input: hynitron_cstxxx - validate touch count and finger IDs
    70f9aad394355 Input: synaptics-rmi4 - propagate F54 worker errors to V4L2 queue
    ff0849705d292 Input: synaptics-rmi4 - block s_input when F54 queue is busy
    6b06aab79ff16 Input: synaptics-rmi4 - bound the F54 report size to the allocated buffer
    b28593a05afdd Input: synaptics-rmi4 - zero report size on F54 work error
    828a8d1a9107a powerpc/pseries: papr-phy-attest - validate cmd.length, plug mem leak
    2bdec532202b3 powerpc/pseries: lparcfg - fix kbuf[] underflow
    8dbfd8e32a13e Input: byd - synchronize timer deletion before freeing private data
    a64a8b6b31cd6 Input: iforce - validate input packet lengths
    e7b8a107ecad5 Input: atkbd - skip deactivate for Xiaomi Book Pro 14's internal keyboard
    8d622c58205ad Input: psxpad-spi - set driver data before use
    83c265bfc084d Input: focaltech - fix array out-of-bounds in focaltech_process_rel_packet
    9b184c8337c6e Input: synaptics-rmi4 - fix F55 transmitter electrode count typo
    652e952850d9a powerpc/pseries: pci - logic bug
    52a818c586ae2 Input: cs40l50-vibra - validate custom data from user space
    455dbb5bdd814 Input: xpad - add support for ZENAIM LEVERLESS
    6635d544bd6bc ASoC: SOF: topology: Use acpi mach from the machine driver
    bcc66461f574a drm/amdgpu: fix aperture iounmap skipped on device removal
    dffacbe8118fc drm/amdgpu: fix JPEG v4.0.5 queue reset failure in DPG mode
    e45356f6adae4 drm/amdgpu: fix JPEG v5.0.0 queue reset failure in DPG mode
    4550b90bd2e6c drm/amdgpu: read TRUNCATE_COORD_MODE on gfx12
    1474f3970d1af drm/amdgpu: reject oversized IBs with per-ring packet limits
    25556a46ae6ec drm/panthor: skip zero-sized firmware sections
    7ff87a01ae3a8 fbdev: core: Fix pointer desynchronization in fb_io_read()
    2fe7a89b2b5b7 ASoC: codecs: lpass-wsa-macro: Fix enum kcontrol accesses
    cc61f0fa2c714 ASoC: cs35l41: sort the register default table
    3298f13d1f126 ASoC: cs35l45: sort the register default table
    d7bd683b0d90c ASoC: cs4265: sort the register default table
    f2435a46dfa1a ASoC: SOF: ipc4-pcm: Continue the pipeline trigger in case of IPC timeout
    8cba53b862e14 ASoC: SOF: sof-audio: Fix error path in sof_widget_setup_unlocked()
    a308364774794 s390/qeth: validate user buffer length in SNMP and ARP query ioctls
    75e564b2ced1c mptcp: fastopen: only mark MPTFO subflows with SYN data
    3f8e5eb0c4999 mptcp: pm: fix data race in add_addr timer callback
    1fade1b2ac5b1 mptcp: options: reset DSS fields in case of unexpected size
    a04dcc784959e mptcp: avoid combining some incoming suboptions
    0cb3846c26c11 selftests: mptcp: join: mark tests with data corruption as failed
    473f1a5ab2abc mptcp: reclaim forward-allocated memory on RX path errors
    9b46fba7528f5 selinux: reject a permission value exceeding the class permission count
    841aea4d5a25e selinux: reject an unclaimed class value in security_get_classes()
    1b4ff94ae7c58 selinux: do not cancel a policy conversion that never started
    acd5b09be98fd selinux: reject a class permission count below its inherited common
    42a7107f99d86 selinux: require every boolean value to be defined
    1a4c3ffe2a48b ipvs: separate destination availability state
    9ff46bf75bfad ubi: fastmap: fix ubi->fm memory leak
    075036cea14ae mtd: ubi: skip programming unused bits in ubi headers
    bb03b56d1d754 block: stop the timeout timer when releasing a never added disk
    e2c3337c2238e ALSA: hda/realtek: Add quirk for HP Dragonfly Folio G3 2-in-1 (103c:8a05)
    bf3be28f6721e Linux 6.18.45
    1eb0dc458b6e8 netfilter: flowtable: ensure sufficient headroom in xmit path
    99ec511f258e0 netfilter: always set route tuple out ifindex
    9977321835c7a thunderbolt: Fix bandwidth group reservation indexing
    40d2ffb74094c thunderbolt: Bound the DROM dual link port number before indexing sw->ports
    ca33df36aa014 sctp: clear new_transport when removing a peer
    07daf4f975010 sctp: fix use-after-free of cached ASCONF chunk
    2b3b5eec8b2c3 sctp: keep chunk->transport in step with the list it is queued on
    3bd46d33e3fd5 scsi: scsi_debug: Negate wrapped memcmp() result
    a14e4ef1d90c3 bpf, sockmap: Fix sk_redir use-after-free in send verdict
    3c6d4ffa0c6db fsverity: Fix silent truncation in bpf_get_fsverity_digest()
    2a5cfcad1d56e fsverity: Fix bpf_get_fsverity_digest() dynptr assumptions
    4917e3ebcab50 mm/filemap: __filemap_add_folio() restore index before retrying
    dd21c96a71e87 ima: Instantiate file_truncate and path_truncate hooks
    102fb2dacf450 sched/psi: Create the psimon kthread outside of cgroup_mutex
    8037c5b2b2a44 sched/psi: Shut down rtpoll_timer in psi_cgroup_free()
    653e888a24c87 fscrypt: use the mount idmap for the owner check in fscrypt_ioctl_set_policy()
    4eb15c465337b ip6_tunnel: clear skb2->cb[] in ip6ip6_err()
    3b2231e358d26 ipv6: fix Route Information option length validation
    7f740664aec1f mm/ptdump: always stabilise against page table freeing using init_mm
    5b926fb04cb9e ring-buffer: Use current_context for safe per-CPU buffer swap
    2e37f2bf11142 ring-buffer: Initialise reader page order in rb_allocate_cpu_buffer()
    5fd91dd4a1434 ptp: ocp: Fix board ID over-read
    8d34019d14136 Revert "thermal/drivers/hwmon: Cleanup coding style a bit"
    5635211b44969 eventfs: Fix use-after-free in eventfs_remove_rec()
    66bc868a33cf1 KVM: x86/mmu: WARN and clear role.invalid when creating a child shadow page
    47976eaaf0a4e KVM: SVM: Serialize accesses to the owner and mirror list with separate lock
    1ffacbadc1453 smb: client: Fix use-after-free in cifs_try_adding_channels()
    c3f2347a47754 tipc: read le->link under the node lock in tipc_node_link_down()
    3fc5044796dd8 tls: don't leave a full plaintext sk_msg ring unpushed
    68787940274ec tls: rx: restore msg_iter before TLS 1.3 optimistic retry
    f1e21108e3ddf vhost: reset the vring metadata cache on vring reconfiguration
    cdf745b7a777f veth: fix skb length accounting after XDP frag adjustment
    38c7763fdc533 vsock/virtio: avoid refilling the RX queue after teardown
    bd43a7ec668be vsock/virtio: read virtqueues under worker locks
    46bb297ad7768 vxlan: do not arm the ageing timer on a device that is down
    fab820f1691a9 xdp: reject clones that overrun skb_shared_info tailroom
    e708fc1566ebd x86/mce: Set up the polling timer before CMCI discovery
    846b92e26c8ab x86/CPU: Add a tlbi= cmdline switch
    69298af46f397 arm64: remove redundant concurrent ptdump UAF mitigation
    fe79571f40434 dibs: initialise dibs->lock in dibs_dev_alloc()
    a2e326c52c4bc Revert "drm/amdgpu: fix aperture mapping leak"
    24e95a24f151c binfmt_misc: don't warn when the mount is completed from another user namespace
    be161fa31e3e9 ovl: don't warn when the mount is completed from another user namespace
    92f00f1d4d204 net/sched: act_gact, act_police: range check the fallback control action
    b47bb899e04b5 net/sched: act_ct: fix sk_buff leak when the header checks reject a packet
    782cc40b7ade4 net: atlantic: free RX pages of consumed but not refilled buffers
    b13202d401e1a net: atlantic: free stranded TX buffers on ring deinit
    0424186d570aa netfilter: nf_conntrack: defer invalid log until after unlock
    c58d34fe8b7e4 netfilter: bridge: release template ct on non-IP path
    e9bfe12b1d04c net: devmem: prevent net-iov / page mixing
    4bc522b33438f net/x25: fix use-after-free of the socket by its timers
    ece6426b61241 net/dibs: Correct freeing of dmb_clientid_arr
    680fbd7942185 ipv6: prevent in6_dev_get() from resurrecting inet6_dev
    0b7d54cedea5c net: smc: fix splice entry lifetime imbalance in smc_rx_splice
    b65c11bc62216 net: phy: mediatek: fix TX blink masks using the RX bits
    105d04edbec83 mm/huge_memory: fix huge_zero_pfn race
    152a00440dc6e tracing: Fix NULL pointer dereference in module event cache removal
    62978cf634797 ring-buffer: Prevent subbuf order change when resizing is disabled
    bc9db0d879c65 fbdev: bitblit: bound-check glyph index in bit_cursor()
    ed49684e69f84 tracing: Fix race between update_event_fields and, event_define_fields
    a979a642402d0 perf/core: Fix group leader use-after-free after sibling detach
    5884851a096d8 drm/v3d: Serialize the scheduler timeout handlers
    7779249561d14 ALSA: us144mkii: re-anchor capture URBs on resubmission
    a6b79dff1cc1c ALSA: hda/tas2781: fix ACPI reference handling
    bb30e35c36ed0 ALSA: FCP: fix OOB write in fcp_meter_ctl_get()
    f75d6f61f0d9c ALSA: usx2y: bound the hwdep mmap fault offset
    d217d723c5e43 ALSA: usb: Fix UAF at delayed release of MIDI2 EPs
    976da5475472e mm/damon: adjust isolated pages stat for DAMOS_MIGRATE_{HOT,COLD}
    e16b8d640ec99 samples/damon/mtier: error out for zero quota goal target values
    460181e4bb47a mm/damon/ops-common: putback folios on invalid migrate nid
    6dd7a06894d6d ring-buffer: Fix crash passing ERR_PTR to kthread_stop()
    688c71bed6852 misc: fastrpc: fix memory leak in fastrpc_channel_ctx_free
    af6345159abcb misc: fastrpc: take fl->lock when moving mmaps on interrupted invoke
    9bf22a7d950ce misc: fastrpc: Remove buffer from list prior to unmap operation
    c5a03c2cadd2f misc: fastrpc: fix channel ctx ref leak when session alloc fails
    cd02b93863159 misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
    8b3e4ed9c35d3 staging: rtl8723bs: validate monitor transmit frame lengths
    a28a4b0592e4a staging: rtl8723bs: fix missing shared-key auth challenge length check
    e5b7610008f4e staging: rtl8723bs: fix OOB read in WMM_param_handler()
    e167a38a8a8f5 staging: rtl8723bs: fix OOB read in rtw_get_wpa_ie()
    5974cb66681ea serial: amba-pl011: synchronize DMA teardown
    759ead98a39fb serial: amba-pl011: cancel RS485 hrtimers after freeing IRQ
    2a0ee25f75cdb serial: amba-pl011: fix indefinite RS485 post-send delay
    3ce24bc4d1153 serial: 8250_of: clear stuck empty-FIFO RX-timeout on LPC32xx
    ae05d9e50b6b9 serial: 8250_dma: Clear stale RX state on shutdown
    1c31e2377f4c1 serial: qcom-geni: fix TX DMA buffer flush
    dd6946a70ddbd rust_binder: do not query current thread for all ioctls
    9dbe1d0111893 nvmem: layouts: Add fixed-layout driver
    da59844f561d1 nvmem: apple-spmi-nvmem: wrap regmap calls to satisfy CFI
    104c2e8b8e38b mei: pull kvfree out of spinlock
    63996ffc594d1 ipv4: fix use-after-free in fib_nhc_update_mtu()
    a59edda6eda12 ipv4: Fix fib_nlmsg_size() for RTA_VIA nexthops
    94166072975aa selftests/bpf: Adapt sockmap update error handling
    edee58a9c460a selftests/bpf: Ensure UDP sockets are bound
    dc0c462fa838c Bluetooth: btusb: Add TP-Link UB600 for Realtek 8761BUV
    373d425f7638a Bluetooth: btrtl: fix RTL8761B/BU broken LE extended scan
    8545f4ef9eae6 netfilter: nf_tables: avoid softlockup warnings in nft_chain_validate
    7b8c53263f887 futex: Prevent robust futex exit race some more
    cf8a9672fc25c iommu/vt-d: Gather the unmapped range before freeing its page tables
    643b410bdfa48 dt-bindings: crypto: qcom,ice: Fix missing power-domain and iface clk
    8d817ef1aa4e9 KVM: s390: pci: Fix aisb calculation
    cf895cd72e404 blk-mq: reinsert cached request to the list
    97e2d08de282e blk-mq: pop cached request if it is usable
    59b07ccca4c05 Revert "drm/amd/display: Fix backlight max_brightness to match exported range"
    5912cf1822fbe net: bridge: mrp: fix uninitialised bytes on the wire
    47a119ec8a7e2 netfilter: ebt_nflog: pin the NFLOG backend
    a0e76de6a2f28 igc: fix netdev not re-attached after resume if interface is down
    e6cd416a899ed mac802154: fix netdev use-after-free in beacon worker
    9f904dd3e4557 inet: frags: publish queues before arming timer
    dbb30dc943a93 net: remove CAP_SYS_RAWIO zero-padding in dev_validate_header
    99ae2239069ed net: octeontx2-pf: Fix UB in shift operation
    a4b14a4df29d3 net/sched: reject overly deep qdisc hierarchies
    23716dd9d8d46 net: openvswitch: reallocate update replies for mismatched IDs
    5f30f9c302cea net: fix skb length accounting after generic XDP frag adjustment
    2c7b5eb87b2b2 packet: synchronize pressure clearing with ring reconfiguration
    971aa7d99242b net/packet: reset the MAC header on the packet-socket transmit path
    27e068d1b35db packet: use consistent hard_header_len in TX_RING send path
    5bb10753d428a packet: use consistent hard_header_len in non-ring send paths
    75eec935444db ipvs: clear IPv4 options after rebasing tunnel ICMP errors
    0f88fe0552bee ipvs: properly update the overload flag on dest edit
    59b90c17bec5b ipvs: add totalconns for dest
    e7f34f29b3302 ipvs: stop estimator after disabled calc phase
    27f3924061592 ima: fix out-of-bounds read in xattr_verify()
    c5bf8cd148cfe mm/vmalloc: acquire init_mm lock on huge vmap to avoid ptdump UAF
    bd3c4108a56de Input: evdev - fix information leak in evdev_pass_values()
    b664592e9ba8c vt: stabilize tty reference in kbd_keycode with tty_port_tty_get
    a1c31e026c93e vt: add permission check for KDSKBMETA ioctl
    2c7496124e94c net: usb: ipheth: fix carrier_work UAF on disconnect
    58733b1dd46bb net: usb: ax88179_178a: fix skb leak in ax88179_tx_fixup()
    d328fdc607fa1 usb: gadget: f_ncm: Use unsigned int for ndp_index
    2dfefdd498ab4 usb: cdnsp: fix incorrect endian conversions for APB timeout register
    6e4c09bea8e9c thunderbolt: icm: Preserve USB4 proxy data-valid bit
    2f73a065791d2 usb: atm: cxacru: properly kill rcv_urb on error in cxacru_cm()
    ebfd1e82ab0a6 usb: misc: usbio: check ibuf_len against rxbuf_len in bulk msg
    04b71290fb419 usb: quirks: Add ShanWan gamepad to quirk list
    1740fd2aaa8fd usb: core: Add quirk for 255-bytes initial config read
    0a235379825e1 ALSA: usb-audio: fix OOB write on Type II inbound URBs
    4034ef247a9dd Input: evdev - sanitize event type index when fetching event masks
    8b444b126cd8e net: tap: set skb->dev before parsing virtio net header in tap_get_user_xdp()
    fad7cecb5c2c0 net: fec: do not release NULL pages when RX buffer allocation fails
    c768fb2e43c8a hwmon: (ltc4282) Fix parsing adi,current-limit-sense-microvolt
    de58b90a4d141 hwmon: (ltc4282) Clamp negative current limits
    124bd4b006199 hwmon: (ltc4282) Avoid overflow in maximum power calculation
    678a76c8fd33d hwmon: (ads7828) Fix external VREF regulator handling
    5ee1f603a64bd hwmon: (corsair-psu) fix possible out-of-bounds access on missing string termination
    29fe74c9aa69d watchdog: at91sam9_wdt: prevent timer rearm during teardown
    6d1d3ca6c8f4a tls: don't abort the connection on signal-interrupted sends
    18d704bdd8093 sctp: clear control chunk transport if it is being removed
    9f77c1ab38218 net/atm: fix slab-out-of-bounds read in vcc_setsockopt()
    fc3021284050e s390/ism: Fix UAF of sba and ieq during ism_dev_exit()
    8fa684db8709b bnge: Fix resource leak in bnge_init_nic() error path
    a837deeaa37cc ata: pata_sl82c105: fix bridge revision use-after-free
    4dd71cb0d23d4 net: thunderbolt: Tear down DMA paths before stopping the rings
    78e5ebcd1c10e net/smc: fix TOCTOU race between smc_listen_out() and listener close
    c8f256dc84920 net: remove WARN_ON_ONCE() from sk_mc_loop()
    363e048a9d0a6 net: prestera: validate firmware header length
    02226af693627 net/ncsi: fix heap OOB read in NCSI_CMD_SEND_CMD payload length
    12afa450a6a6c netfilter: nf_flow_table: drop existing skb dst before skb_dst_set_noref()
    25d40cf9dab15 netfilter: flowtable: consolidate xmit path
    a66e869cf0c90 tcp: fix TFO max_qlen accounting across reuseport migration
    6c24ec01fb768 sctp: fix addip_serial increment on ASCONF_ACK allocation failure
    1e8f24b1e3fee bnxt_en: Fix PTP PPS setting bug
    aab3b5f4d8ec8 bnxt_en: Disable EOP for TPA on all chips to prevent data corruption
    6a2e50924e57e bnxt_en: Refresh VNIC default ring on queue restart if needed
    f1a4e95e296b2 bnxt_en: Determine and store default RX ring in vnic structure
    965c45be24e15 bnxt_en: Move RSS table fill outside __bnxt_hwrm_vnic_set_rss()
    88664c48d7d1e net/mlx5e: fix BQL reset on SQ re-activation
    beb47092fe8fc bnge: use int for bnge_fix_rings_count() return value
    4901b23b5ca7b net: stmmac: resume PHY before hardware setup when opening the interface
    99b7bcee01589 selftests/ftrace: refactor eprobes test to fix argument checks
    a7a00ecf54243 hwmon: (pmbus/lm25066) Fix PMBus coefficient calculations
    2e5ea8272ceae hwmon: (nzxt-smart2) Check return value of init_device() in probe
    9fccf43f05317 drm/xe/uc: Apply RCS/CCS yield policy to SR-IOV VFs
    d6222af7274f0 net/sched: cls_api: Always acquire rtnl_lock when destroying locked classifiers
    a8139285c8925 net/openvswitch: check Ethernet header length in key_extract()
    a06e4611d4551 vhost-scsi: reject feature changes after endpoint
    2417a498cf3fe vhost-scsi: Validate T10 PI scatterlist counts
    cd2f1d9fe8a50 net/sched: sch_cake: drop WARN_ON(1) for malformed packets in ACK filter
    64d322c288577 udp: fix potential use-after-free in tunnel segmentation
    5fd121971912d xsk: validate metadata when processing requests
    1a1534cc3b419 xsk: move xsk_tx_metadata_request() to xdp_sock_drv.h
    af511afa1d297 xsk: validate launch-time metadata size
    0ba2e1eb07a82 xsk: clear metadata pointer when no timestamp is requested
    5ec4f525373bc xsk: pass TX metadata pointer by reference
    642c6e73fce17 xsk: require at least 16 bytes of TX metadata
    b0b7202f751bb bnxt: fix memory leak in bnxt_queue_mem_alloc error cases
    ad9ffc61fafeb eth: bnxt: support qcfg provided rx page size
    cd5485a702efd eth: bnxt: store rx buffer size per queue
    9c1406e2ecd2e net: pass queue rx page size from memory provider
    b3fecb888e94b net: add bare bone queue configs
    96197286b0ac8 net: reduce indent of struct netdev_queue_mgmt_ops members
    34debe05685d1 bnxt_en: Do not set EOP on RX AGG BDs on 5760X chips
    5ba1a458c5e26 tcp: do not change rcv_ssthresh in tcp_measure_rcv_mss()
    821f6416e6978 hwmon: (pmbus) Fix type confusion in notification logic
    11720d869be1a hwmon: (pmbus_core) Use guard() for mutex protection
    cde8931a25392 vdpa/mlx5: Fix buffer length in create_direct_keys()
    a1c236b385d85 vhost/vdpa: reject overflowing PA map page counts on 32-bit
    cefcbbe20846a bpf: tcp: Fix use-after-free in bpf_iter_tcp_established_batch()
    846ce792b6dd2 counter: microchip-tcb-capture: Fix DT channel validation
    80094352bd40b net/mlx5: fw_tracer, return NULL on create error
    7b02c6d2a3cd2 devlink: fix net namespace reference leak in reload
    1efcc71140094 net: hisilicon: hix5hd2_gmac: remove redundant NAPI delete
    0e7a8cf8895b0 net/sched: cls_route: fix fastmap use-after-free on filter
    10cb31b2b74cb net/smc: fix qentry overwrite for CONFIRM_LINK and ADD_LINK_CONT in smc_llc_event_handler()
    d8a6f79935205 bpf: Propagate untrusted pointer state in commuted arithmetic
    c2da73a1f715f bpf: split check_reg_sane_offset() in two parts
    db6382ed3361b bpf: Preserve pointer state for commuted arithmetic
    24a8f2c29aebb btrfs: fix memory leak in btrfs_do_encoded_write()
    26e968526eb53 watchdog: bd96801_wdt: Fix timeout for enabled WDG
    b3ff48c4ea8b2 ipvs: return the csum validation for forward hook
    a69a4b3fff581 ipvs: avoid out-of-bounds write in ip_vs_nat_icmp
    1e8a5467a7a7b netfilter: ipset: switch ext_size to atomic64_t
    970e9494f44af pds_core: cancel pending PCI reset work on AER recovery
    ef8e37ac448d4 pds_core: keep the health thread stopped during reset
    ff9e7d5e3500b net/mlx5e: TC, Check if flow is PEER before acquiring devcom lock
    e506e704b7474 enic: fix tx_hang_reset use-after-free on device removal
    2faf75a8a0650 bonding: alb: re-check primary_is_promisc under RTNL in bond_alb_monitor
    35ddcc856b5b3 Revert "net: thunderbolt: Enable end-to-end flow control also in transmit"
    d512823059af8 net: hns3: fix speed configuration residue after driver reload
    8701a643db231 drm/bridge: ps8640: propagate AUX transfer register errors
    d47212d866906 ovpn: fix incorrect use of rcu_access_pointer()
    54dd83f24b913 ovpn: ensure TCP vars are initialized first
    f34949d63cbbe ovpn: disable IPv4 redirects on MP interfaces
    e774f7d8fc733 ovpn: hash floated peer by transport identity only
    9a776388ef8d5 ovpn: zero-initialize sockaddr before learning a floated endpoint
    61fb3cca40ff9 ovpn: ensure socket is owned by ovpn before deref sk_user_data
    157164812a0c5 ovpn: rehash peer in by_transp_addr table on CMD_PEER_SET
    d20c181088984 ovpn: skip rehash for peers already removed from by_id
    9e5e88fbfc87d ARM: dts: BCM5301X: fix PCIe controller 2 second interrupt
    92b9d92a35a0f ovpn: add missing rtnl_link_ops->get_size callback
    d740dea9e2557 pinctrl: qcom: ipq806x: mark pci reset as a GPIO pin function
    23c94a468efe3 pinctrl: qcom: ipq806x: mark gpio as a GPIO pin function
    913d2295b772e selftests/sched_ext: Handle sleeping task affinity changes in numa test
    ce0212d230bd6 ARM: npcm: Fix OF node refcount leaks in SMP setup
    ccf6738adcafa xfs: handle NULL b_addr in xfs_buf_free
    d90599a42f6c5 arm64: dts: broadcom: bcm2712: Remove non-functional EL2 virtual timer
    d71dfffa512e7 NFS: Pin the 'struct nfs_server' during a FREE_STATEID call
    bd45b89d7346f arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower PSCI cluster idle
    df9d22383d7c0 arm64: dts: qcom: purwa: Fix GPU IOMMU property
    7a6e90afb696c arm64: dts: qcom: rename x1p42100 to purwa
    1e2b408c1a769 arm64: dts: qcom: Rework X1-based Asus Zenbook A14's displays
    387edbe4706b6 arm64: dts: qcom: rename x1e80100 to hamoa
    d089f32d34f82 drm/amd/display: Check for tg ops in dce110_set_avmute
    8aba384bfc8aa drm/amd/display: Add AV mute wait frames to dce110_set_avmute
    50359c42e0eba selftests/bpf: Fail unbound UDP on sockmap update
    62fefb817bb3b sched/fair: Revert 6d71a9c61604 ("sched/fair: Fix EEVDF entity placement bug causing scheduling lag")
    4043e196dc882 sched/fair: Separate se->vlag from se->vprot
    9a3eef676cd8b mount: honour SB_NOUSER in the new mount API
    79a45d44323b3 KVM: s390: pci: Fix resource leak on IRQ registration failure

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 714654a1625f4f39a5c44c5ded9602d75b6cb6c8)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index a7051c6e47c..a0c2abf1c5f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f987d803014658f4fbccff70cfb9c42cc381f710"
-SRCREV_meta ?= "7b09e5efab49e4bae0c69f7f2c65b4df00e9c565"
+SRCREV_machine ?= "40cf3a2e9ae15c3d4b3a528d4de015263639cac3"
+SRCREV_meta ?= "185549fc38a492dc3e431b32ac6774620ae6b468"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.44"
+LINUX_VERSION ?= "6.18.48"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 6f3c9b63e5a..0d4c98f2840 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.44"
+LINUX_VERSION ?= "6.18.48"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
-SRCREV_meta ?= "7b09e5efab49e4bae0c69f7f2c65b4df00e9c565"
+SRCREV_machine ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
+SRCREV_meta ?= "185549fc38a492dc3e431b32ac6774620ae6b468"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 2a515e6bfe9..1a7a8659bf8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "ca14f75460e4cdd77e7f4b18e356d772236fc4bf"
-SRCREV_machine:qemuarm64 ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
-SRCREV_machine:qemuloongarch64 ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
+SRCREV_machine:qemuarm ?= "1cd95e881ac1b4f07906bd0e9482891e12f84a83"
+SRCREV_machine:qemuarm64 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
+SRCREV_machine:qemuloongarch64 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
-SRCREV_machine:qemuriscv64 ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
-SRCREV_machine:qemuriscv32 ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
-SRCREV_machine:qemux86 ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
-SRCREV_machine:qemux86-64 ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
+SRCREV_machine:qemuppc ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
+SRCREV_machine:qemuriscv64 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
+SRCREV_machine:qemuriscv32 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
+SRCREV_machine:qemux86 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
+SRCREV_machine:qemux86-64 ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "1b6ed62ce69bdf976f1b580c20f5271ed105958e"
-SRCREV_meta ?= "7b09e5efab49e4bae0c69f7f2c65b4df00e9c565"
+SRCREV_machine ?= "5b95344d2d0cfbe5889e3eb5a2ea3939dc3412f0"
+SRCREV_meta ?= "185549fc38a492dc3e431b32ac6774620ae6b468"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "1efe5d048a391de3ead2804b2e7f86376c356cc5"
+SRCREV_machine:class-devupstream ?= "5bbb9c9f8f808710e2123f2b30f0d61d7d698f52"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.44"
+LINUX_VERSION ?= "6.18.48"
 
 PV = "${LINUX_VERSION}+git"
 

