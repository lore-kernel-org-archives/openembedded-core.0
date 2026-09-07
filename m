Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDDAC79FAF
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 13:36:17 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34942.1788788169719965313
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 06:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hWgS4Ut4;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso45195495e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 06:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788788168; x=1789392968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z4xj6CUBLL89cd+2QpWxk8BubUeRO/3sfKWqy/SAiAY=;
        b=hWgS4Ut4gU0O7x0muUBMjT98MNxECFSE8RqKMkMDX2IPHhULEr66F5NoxQY/8bVZQ6
         fiIMhS6Ooh7JJcMoyMfW56Bhv/xOkbFdQ/WmUnyaENuO615xivr2v7XQEDT5yDV35Im1
         UDWLO7BJm7U0l4vakseEsu2CVN5zUK5ry8GL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788168; x=1789392968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z4xj6CUBLL89cd+2QpWxk8BubUeRO/3sfKWqy/SAiAY=;
        b=fwGO2aCQCZ5VGXx5PTXDlOobQTlvFkc63ArBrbSigvVxouUjQBKBeMuLSdOz/8qKII
         mOoOmysgFELVFTbZfRkjTEn6XWRh8EL2wxY3yNrWETnbNH3q0+38iG520FCZE55hgAC2
         17/F9ywmlKRmlKK17JEzBAv0Xg+CsNKk2p9XGJu9W2qEiLiweFos7t84R0+dxr943mrK
         yBowcH/NPiYF/ytbkDyt6sEG1qFKMUO6zca/t5PJhbLr9OdjY+Y0f3uVUJhPevc3gF7f
         AoTXXx6AHFDJ0vxDxM83H0v+nmDBut1yL9ymXRDpr5ZeDNrgXwN0RtrkYcJsGZVpDwjO
         wKfw==
X-Gm-Message-State: AFuF++lm5sAySWL7T7/vamIQSZ6clKni8BnIQJY1ceQYiSV6jTWBwHQv
	np7popifJplNg2BfCG7pWlVgqPTkiScHZkgPcwg4+ebKpc8103RN2vQxLzHdy9OAqBEB5vMi4vz
	4DQzfpNs=
X-Gm-Gg: AYBFou2v/Rh1RL7lDJ+hQ3b8TLb1p/vGg5bslFrFDPwiyrSEZun4EVNctrYaaBSbA5i
	+xsl4Ria+2DGMRglWmWA91HWRwUF6FLoq2Tjo1ciYgUA3il9sgO/qwpxF6U1RkZ0tJIvjp8v2h1
	C/BR8h6ku9OF7TvmPK5HW1hF9t/kPZqwm/FI4mu/mn9KabgNb/hj25AntR0bUzXOhjuoVDgPktd
	QM8tu/D0jpm7AlwUernx3822waOl/qdv43YRp4+NdeHpMBQZLAvyWBZZSKIllCswMRv1BqXY3Vg
	J220SZKrrMVRbrXQUq1gqrZ9O62qy2VGKIpd2UAmGIaQBy2ZXE2V6VtDkErsEw4ksM7shsLlaUy
	wCdA0a3Q0RxT1NLSonHR9AIrAZODwxrBo/LqlTgDrh6VdbT4WWteRaIO0u5NqhMdnxHOxbSbggp
	XJGkT1NRd45qmEkJW37KEVbrlW9ITffo/EF84sRSzhu1LAbP+qvEonrYF55wW6UIDE7e8L80ibn
	R9jnVoXdoTdCOJ8Ghut3MAAdplQfxoDpp/pXhoPAzpoI59GOeaGfvHsiH2AqG9A
X-Received: by 2002:a05:600c:c173:b0:49c:fc6c:be18 with SMTP id 5b1f17b1804b1-49cfc6cc0b8mr197972755e9.30.1788788167578;
        Mon, 07 Sep 2026 06:36:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm27523836f8f.8.2026.09.07.06.36.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:36:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 30/35] linux-yocto/6.6: update to v6.6.151
Date: Mon,  7 Sep 2026 15:35:26 +0200
Message-ID: <addc18b3b8b4c85c7d39bc3cd7fb312f5c4ff183.1788787321.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788787321.git.yoann.congal@smile.fr>
References: <cover.1788787321.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 13:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245287

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    d27334b2888c1 Linux 6.6.151
    5b75a6e292b82 usb: typec: ucsi: Correct teardown ordering in ucsi_init() error path
    da302460e1516 drm/tegra: fbdev: Do not assign to struct drm_fb_helper.info
    dcaba7b281724 ALSA: hda: codecs: hdmi: disable keep-alive before audio format change
    84351f1239034 drm/i915/hdcp: check streams[] bounds before overflow
    d7bec2276b606 drm/i915/hdcp: require monotonically increasing seq_num_v
    214b63a6df022 drm/i915/hdcp: Move to using intel_display in intel_hdcp
    d1ba0459d8d0c drm/i915/hdcp: migrate away from kdev_to_i915() in bind/unbind
    b02ed4c9099a6 drm/i915/fbc: Extract intel_fbc_has_fences()
    c6eb2d615210b sctp: close UDP tunnel sockets during netns teardown
    d2c3760b45f2f mptcp: pm: userspace: fix use-after-free in get_local_id
    6b6dcc679df19 mptcp: pm: use addr entry for get_local_id
    19b0ae625755d mptcp: add mptcp_userspace_pm_lookup_addr helper
    805b79892a92f mptcp: pm: avoid code duplication to lookup endp
    cb9c9ec479e0b ceph: fix refcount leak in ceph_readdir()
    2cda8a74c91de ceph: print cluster fsid and client global_id in all debug logs
    c30406c39a665 libceph: add doutc and *_client debug macros support
    bf5c4a8b24acb can: isotp: fix timer drain order, wakeup handling and tx_gen ordering
    1107f5959c035 can: use skb hash instead of private variable in headroom
    66700c0719675 sctp: avoid auth_enable sysctl UAF during netns teardown
    ac649bd51e7fc sysctl: treewide: constify ctl_table_header::ctl_table_arg
    c268331845ee0 wifi: brcmfmac: drain bus_reset work on device removal
    1335161f85026 wifi: brcmfmac: set F2 blocksize to 256 for BCM43752
    b516ac892bcb3 wifi: brcmfmac: fix 43752 SDIO FWVID incorrectly labelled as Cypress (CYW)
    64af6534a085f wifi: ath6kl: fix use-after-free in aggr_reset_state()
    47ef04cd13d38 media: v4l2-fwnode: Fix subdev owner overwritten in v4l2_async_register_subdev_sensor()
    fa00d8070d85d media: v4l: async: Set owner for async sub-devices
    e38f054f0af98 netfilter: nf_tables: clone set on flush only
    d94b82d452ca2 rxrpc: Fix irq-disabled in local_bh_enable()
    f9fa11cdd5bf2 media: imx219: Fix maximum frame length in lines
    af4fd77d3430f media: i2c: imx219: Rename VTS to FRM_LENGTH
    b0f5471b0a69a media: i2c: imx219: Calculate crop rectangle dynamically
    cdeb114ed964c media: i2c: imx219: Group functions by purpose
    f2f85e5ff17e3 media: i2c: imx219: Drop IMX219_VTS_* macros
    bc24c30f403a2 media: i2c: imx219: Don't store the current mode in the imx219 structure
    912762e93e6d2 media: i2c: imx219: Access height from active format in imx219_set_ctrl
    6598ac1721c3a drm/i915/vrr: require valid min/max vfreq for VRR
    c8420f048c152 drm/i915/vrr: Check HAS_VRR() first in intel_vrr_is_capable()
    aa31b60d6c4ec drm/amdgpu: Respect placement requirements in amdgpu_gtt_mgr functions
    926a4e2301060 drm/tegra: fbdev: Remove offset into framebuffer memory
    d6c50b6605db0 drm/fb-helper: Allocate and release fb_info in single place
    07f8aaffee705 usb: typec: ucsi: Fix race condition and ordering in port unregistration
    c888e052a09ef usb: typec: ucsi: split connector lock classes
    3a9e3344d1e51 usb: typec: ucsi: Only enable supported notifications
    3118bb872c7df usb: gadget: f_tcm: synchronize delayed set_alt with teardown
    f5307073303ad drm: renesas: rzg2l_mipi_dsi: Increase reset deassertion delay
    4c37112f1af90 drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
    eed56f105a7f7 usb: musb: omap2430: Do not put borrowed of_node in probe
    e56ccb286bc48 usb: musb: omap2430: clean up probe error handling
    bbd2a25bbb415 Revert "ia64: Make acpi_cpufreq_cpu_exit return void"
    16da33cb36e66 gpio: pch: use raw_spinlock_t for the register lock
    95f702e372964 firmware: stratix10-svc: fix memory leaks and list corruption bugs
    be106f7855f03 mm/huge_memory: unlock i_mmap_rwsem before releasing after-split folios
    69cb5825d9988 mm/hugetlb: fix swap entry corruption when clearing uffd-wp at fork()
    6277e85777710 iommu/sva: move x86 disable check before allocation
    9de51b5dbcdfd ata: ahci: Make ahci_ignore_port() handle empty mask_port_map
    0158829969820 ata: libahci_platform: Do not set mask_port_map when not needed
    95b3f23d63249 HID: logitech-dj: Fix maxfield check in DJ short report validation
    b517ca5c6346f spi: spi-cadence: enable SPI_CONTROLLER_MUST_TX
    4e0f669e2951b drm/vmwgfx: validate external BO copy bounds for both stride paths
    1bbe7751f5eba drm/vmwgfx: use check_add_overflow for shader size+offset bound
    036e16ada9538 drm/vmwgfx: bound DMA command body size against suffix pointer
    2666cddf0dd21 drm/vmwgfx: validate DRAW_PRIMITIVES header size before division
    c1c22fca0a089 drm/vmwgfx: drop dma_buf reference on foreign-fd prime import
    7eae011829f94 drm/vmwgfx: reject DX_BIND_QUERY without a DX context
    21bbe38faee4a drm/vmwgfx: fix guest_memory_dirty bitfield clobbered as size
    2040b7e39027c drm/amdkfd: hold event_mutex while checkpointing CRIU events
    dec688cfa18c3 drm/amdkfd: Handle invalid event type in CRIU event restore
    8924e2594a15b drm/amdkfd: fix QID bit leak in pqm_create_queue()
    ce813614f63b0 drm/amdkfd: Fix missing authorization check in KFD_IOC_DBG_TRAP_DISABLE
    668441cff9e05 drm/amdgpu: cap GTT size to physical RAM on APUs
    ef3fa445edc03 drm/amdgpu: restore UMD profile pstate after runtime resume
    8112f0a9396e3 drm/mediatek: ovl_adaptor: balance component registrations
    f5802be65535f drm/vc4: Zero the tile state data array before each BIN job
    2f2291a119e9a drm/vc4: Supply the overflow slot size in BPOS, not the whole bin BO size
    13bd7cf63610a drm/dp: Read the PCON max FRL bandwidth only for HDMI DFPs
    3c9d12561601f can: ctucanfd: mark error-active controller status valid
    4c453560d3c29 can: ctucanfd: handle bus error interrupts
    4a666e648c6bd can: ctucanfd: unmap BAR0 using base address
    bfc20e429de9b can: ctucanfd: use self-test mode for PRESUME_ACK
    5bdd69e8301b1 can: ctucanfd: add missing MODULE_DEVICE_TABLE()
    6067c878e38d0 can: peak_usb: validate uCAN receive record lengths
    525640b93d3e5 can: peak_usb: peak_usb_start(): fix double free of transfer buffer on URB submit error
    825c903ca3c98 can: peak_usb: add bounds check for USB channel index
    ae588e5b9cc26 can: softing: fw_parse(): validate firmware record spans
    695aea154bb2d can: kvaser_usb_leaf: kvaser_usb_leaf_wait_cmd(): validate received command extents
    b954b108891e5 can: kvaser_usb: kvaser_usb_hydra_get_busparams(): fix memory leak in kvaser_usb_hydra_get_busparams()
    30b0b76918834 can: j1939: use netdevice_tracker for j1939_{priv,session,ecu} tracking
    194d67e92197e can: j1939: transport: j1939_session_fresh_new(): initialize receive buffer
    5e2fd705c92e9 can: gs_usb: gs_usb_receive_bulk_callback(): resubmit URB on skb allocation failure
    0ef136ba05210 can: etas_es58x: es58x_read_bulk_callback(): fix RX buffer leak on URB resubmit failure
    ce8125566b1d0 can: ems_usb: validate CPC message lengths
    29bc050802ded can: c_can: c_can_chip_config(): keep controller in init mode until bittiming is configured
    a8a1f9ac3d763 i2c: imx: Cancel hrtimer before clearing slave pointer
    b9f6f4883b9ac i2c: imx: Fix slave registration race and error handling
    14429dc1c756c i2c: jz4780: Cache host clock rate at probe to prevent CCF prepare_lock deadlock
    2b760e8f0ead0 ice: fix memory leak in ice_lbtest_prepare_rings()
    5dd5485189c07 ice: wait for reset completion in ice_resume()
    736e972f3f8a3 net: openvswitch: fix skb leak on flow key update failure during ct
    27b3eb4fc407e net: openvswitch: fix skb leak on flow key update failure during recirculation
    0310d1fa7f9de net: openvswitch: fix potential UAF on meter attach failure
    1f1a8ca58641b phy: zynqmp: keep SERDES scrambler and 8b/10b enabled for USB
    bf3985016cc09 phy: zynqmp: use read-modify-write for SERDES scrambler bypass
    9a83affa2fa14 phy: zynqmp: fix L0_TM_DISABLE_SCRAMBLE_ENCODER mask
    dd25bd9b0f368 s390/zcrypt: Validate length for CCA ECC private key requests
    406b317ea2b50 s390/zcrypt: Validate length for CCA AES cipher key requests
    b505dcc8307d6 s390/zcrypt: Fix wrong domain value verification with EP11 CPRBs
    aca18289c86f2 s390/dasd: Fix undersized format-check buffer
    e156c70c505c6 s390/dasd: Fix potential NULL pointer dereference
    4e48168825818 s390/qeth: Check CAP_NET_ADMIN for private ioctls
    a92df2b3d7a33 power: supply: bq25890: fix the -10 C NTC lookup entry
    a57082657fa5b cpufreq: powernow-k8: Fix possible memory leak in powernowk8_cpu_init()
    83467180e0579 gpio: pca953x: fix cache_only and IRQ state on restore_context() failure
    b7c2c5c886873 i2c: amd-mp2: Unregister callback on adapter add failure
    d20f04fb30bdf hwmon: (pmbus/core) notify on the hwmon device, not the i2c client
    c985e96fa3e3a hwmon: (npcm750-pwm-fan): stop fan timer on device detach
    546221b86ceeb sctp: prevent peer transport count overflow
    61baa5020b0af sctp: reject stale cookies with mismatched verification tags
    49e5b25a0b74d scsi: scsi_debug: Fix REPORT ZONES alloc_len underflow OOB write
    03bfd969f2f72 selftests/clone3: fix wild pointer access of getline due to missing init
    7ecb40609362c selftests/mm: fix potential wild pointer access of getline due to missing init
    fc673c4eb23dd spi: qcom-qspi: Correct max DMA length to avoid 64K boundary failure
    47cef9b4445d2 tracing/filters: Fix false positive match in regex_match_full()
    d61ee2a27dfd5 tracing: Check return value of __register_event() in trace_module_add_events()
    ee41b00858ca6 ublk: reset kernel-owned dev_info fields in ublk_ctrl_add_dev()
    42887be7c4cf2 vxlan: use pskb_network_may_pull() in route_shortcircuit()
    d08e8ac13f2e2 vxlan: use neigh_ha_snapshot() in route_shortcircuit()
    cbb154b2d71ef vxlan: unclone skb head before modifying eth header in route_shortcircuit()
    2355c8c26d2aa vxlan: re-fetch eth header after route_shortcircuit()
    4b9601595e8b6 um: vector: fix use-after-free in vector_mmsg_rx()
    f020d756b3139 powerpc/ps3: Fix map failure path in dma_ioc0_map_pages()
    6d98c70fe0ba8 net: ipv6: clear suppressed fib6 rule result
    159ad90cb929c net: bridge: stop fast-leave after deleting a port group
    f978048326570 mm/page_reporting: use system_freezable_wq to fix UAF during suspend
    1819f82dee766 binfmt_misc: reject a flag character as the field delimiter
    25e5a3fe4f15e wifi: mwifiex: use the subframe length when parsing A-MSDU TDLS frames
    d7940bb6a8e7a tipc: avoid use-after-free in poll trace queue dumps
    661ff9c0cfbe0 netfilter: ipset: do not update comments from kernel-side hash adds
    5a42f162b8570 net/smc: fix socket use-after-free during link group termination
    44af98cc7d5ef ipvs: do not propagate one-packet flag to synced conns
    31089f4eab42e igbvf: Fix leak in TX DMA error cleanup
    5c477b7a205fb e1000: fix memory leak in e1000_probe()
    dc390138a0a31 dmaengine: qcom: bam_dma: Fix command element mask field for BAM v1.6.0+
    56ac3e7c90f6b ALSA: usb-audio: Clamp frame size in implicit-feedback mode
    3852974608f53 ALSA: usb-audio: Fix DMA buffer out-of-bounds write when fill_max is set
    29a4c29943631 ALSA: usb-audio: fix OOB write in snd_usbmidi_akai_output()
    49eccef6d6e1c ALSA: usb-audio: fix use-after-free in ump_to_endpoint()
    3d3339f71807b ata: libata-eh: Increase STANDBY IMMEDIATE timeout
    2f840c7980bcf ASoC: tas2562: fix broken entries in the volume lookup table
    f56d1aac72394 ASoC: tas2562: fix DVC coefficient write order
    e84d2e53a05c7 ALSA: ump: fix double free of out_cvts on rawmidi error
    e8b784a3f4fba ALSA: pcm: wake linked drain waiters on unlink
    20aad5c443848 ALSA: lx6464es: fix period byte count for 16-bit streams
    49bc7741cd276 ALSA: 6fire: Fix UAF at error handling during probe
    487e437b8f092 bpf: lwt: Fix dst reference leak on reroute failure
    b7ad105d46acd Bluetooth: HIDP: validate numbered report payloads
    46ca5ab39737d Bluetooth: HIDP: reject frames without a transaction header
    86ed4dd6548cc Bluetooth: mgmt: fix UAF in pair command cancellation
    a9e7c2609b0cb Bluetooth: mgmt: fix pending command UAF in EIR updates
    c348057dc7066 Bluetooth: btmtk: Fix short read errors in btmtk_usb_uhw_reg_read()
    45bf3df5b32e5 audit: fix potential use-after-free in audit_del_rule()
    17099fad5ef92 audit: fix potential integer overflow in audit_log_n_string()
    93942b5772e0e sctp: validate Adaptation Indication parameter length
    f00ef8efd4144 KVM: s390: pci: Validate AIBV and AISB before pinning guest pages
    0a95abe964400 KVM: s390: pci: Fix NULL dereference on AIBV allocation failure
    78d9648e7e960 KVM: s390: pci: Reject adapter interrupt forwarding if already enabled
    6664a5aea4531 KVM: SVM: Update x2APIC MSR intercepts if AVIC is inhibited while L2 is active
    451ee0f9ca1e1 tracing/probes: Reject $arg0 in meta argument expansion
    421e447b53c70 mm/vmstat: fold stranded per-cpu node stats when a node comes online
    62e1c2741a4d9 mm/hugetlb: fix list corruption in allocate_file_region_entries()
    01504da375f5b mm/percpu-km: fix bitmap overflow and accounting in pcpu_create_chunk()
    a583806ae9697 pinctrl: bm1880: add missing select GENERIC_PINCONF
    e8b3d09aa8889 erofs: cap LZMA stream pool size
    929f6396baade pinctrl: devicetree: don't free uninitialized dev_name on error path
    9d5de82acf289 pinctrl: microchip-sgpio: add missing select REGMAP_MMIO
    c39643ad99fea rhashtable: clear stale iter->p on table restart
    27210d433a8c5 ipv6: fib6: fix NULL deref in fib6_walk_continue() on multi-batch dump
    67aaec2a1fdce ksmbd: fix use-after-free in __close_file_table_ids()
    fb27b7b7b7bb4 ksmbd: return success for deferred final close
    e382a4efeeae6 qede: sync udp_tunnel ports outside qede_lock in the recovery path
    228757a2988c6 octeontx2-pf: Set correct sequence for carrier off and tx queue stop
    272eafaf16258 net: dsa: mt7530: error out on failed reads in MT7531 PHY polling
    aecd00c33b509 accel/qaic: use sizeof(*trans_hdr) for transaction length check
    481737704eee0 tracing/mmiotrace: Reset dropped_count in mmio_reset_data()
    2ba4c5cc30313 can: isotp: check register_netdevice_notifier() error in module init
    128fe7596adcd net: sxgbe: check descriptor ring allocation failures
    3563e2486dcd5 net: sxgbe: free TX rings on RX allocation failure
    8f7812821ed7a scsi: target: Clear cmd_cnt when initial counter enrollment fails
    1b42d05f1c590 scsi: zfcp: Fix memory leak during adapter release by destroying gid_pn_req
    107d3d6c17910 scsi: ufs: core: Cancel RTC work in active-active suspend
    3c60a8b4037dc scsi: target: iblock: Fix wrong PR ops NULL check for PREEMPT/RELEASE
    ba99aed7bad80 net: phylink: put link_gpio if phylink_create fails
    716d47531e740 Bluetooth: hci_sync: fix hci_conn_del() use in hci_le_create_conn_sync
    64d1645f26aa4 Bluetooth: hci_conn: hold conn reference in abort_conn_sync()
    759303b0012cc Bluetooth: hci_sync: make hci_cmd_sync_run_once return -EEXIST if exists
    c31be902ccbbb Bluetooth: btintel: Validate length before parsing diagnostics TLV
    38a9a30614cc7 Bluetooth: ISO: fix timeout vs sync_timeout typo in check_bcast_qos
    fd4c1e301bdec Bluetooth: L2CAP: fix UAF in l2cap_le_connect_rsp
    cc1d39946d62b Bluetooth: ISO: clear iso_data always when detaching conn from hcon
    68c5b240dba96 hwmon: (pmbus) Fix return value from pmbus_update_byte_data()
    ff558072d199c wifi: mac80211: validate individual TWT params before driver setup
    961d80c6389d9 powerpc/boot: Fix treeboot-akebono CPU node lookup check
    1792fcda01785 powerpc/boot: Fix treeboot-currituck CPU node lookup check
    3382cf66522df powerpc/boot: Fix simpleboot CPU node lookup check
    ab8549d5b8f02 hwmon: (adt7470) Fix PWM auto temp state array and bounds check
    d328175045176 hwmon: (adt7470) Fix divide-by-zero TOCTOU crash in fan speed read
    c11d1bc785f2a hwmon: (adt7470) Use cached PWM frequency value
    97fac8440c9ae hwmon: (adt7470) Fix swapped PWM3 and PWM4 auto mode masks
    40a3117650f9d hwmon: (adt7470) Fix temperature alarm logic in hwmon_temp_read()
    1a42bd72a6620 hwmon: (adt7470) Fix busy-loop and I2C flooding in update thread
    0c89e5ae2655f hwmon: (adt7470) Fix cache updated before hardware write on I2C error
    f114a8aa7905a hwmon: (adt7470) Fix fans stuck in manual mode on I2C errors
    cf2dcde228456 forcedeth: fix UAF of txrx_stats in nv_remove
    b60702104b45d net: bridge: mrp: fix Option TLV length in MRP_Test frames
    25b528816f5d8 hwmon: (nct6775-core) Prevent access to unsupported weight registers
    f5ecaa7ea7686 net: do not send ICMP/NDISC Redirects when peer allocation fails
    70ad543ce81f3 hwmon: (nzxt-smart2) DMA-align output buffer
    4eed33c7db5c0 hwmon: (lm90) Only report alarms if driver is ready
    9a87dfaa05c3c hwmon: (nct6775-core) Fix number of temperature registers for NCT6116
    a7b05d5eefc37 spi: spi-cadence: Move TX FIFO full busy-wait into FIFO
    6b0fbc3fb7b71 spi: spi-cadence: supports transmission with bits_per_word of 16 and 32
    593636dcdf20e smb: client: fix buffer leaks in SMB1 read and write
    e50a6523a6035 scsi: libsas: Fix HA resume deadlock and hisi_sas disk-wake race
    c97b5265cc477 scsi: libiscsi_tcp: Bound SCSI Response data segment to the connection buffer
    7567f06abdefb scsi: libiscsi: Fix stale-data leak into the SCSI sense buffer
    870b4535f958a pinctrl-amd: Don't clear S4 wake bits at probe
    76dd48886eeeb rds: tcp: hold the RCU lock across ipv6_chk_addr() in rds_tcp_laddr_check()
    8e48d7ab1e019 rds: Fix inet6_addr_lst NULL dereference when IPv6 is disabled
    b19b5d2e042c2 netfilter: nft_payload: fix mask build for partial field offload
    35c53f9b7839a ipvs: do not mangle ICMP replies for non-first fragments
    cdc55d6ca3a8f ipvs: fix places with wrong packet offsets
    b3869d9b54e76 ipvs: fix the checksum validations
    d1c4acc119ea0 sched: Add task_struct->faults_disabled_mapping
    24683fea1f06b netfilter: xt_hashlimit: validate hashtable supports XT_HASHLIMIT_RATE_MATCH
    55fb23f8bd744 assoc_array: trim the final shortcut word using the current chunk end
    bd0f976ef89dc keys: make keyring key-chunk byte order agree with keyring_diff_objects()
    d1933e03e8c74 keys: fix out-of-bounds read in keyring_get_key_chunk()
    c28d2ae71b706 drm/mediatek: Check CRTC state before freeing
    63eea41759fd6 netfilter: nf_conntrack_sip: widen NAT rewrite delta to s32 in sip_help_tcp()
    8bba4129dc5c0 phy: zynqmp: fix runtime PM leak on probe allocation failure
    599516163bb33 phy: zynqmp: fix clock error handling in xpsgtr_phy_init()
    badff0ff5b20a phy-zynqmp: Postpone getting clock rate until actually needed
    18577e77c2c8a btrfs: zoned: fix deadlock between metadata writeback and transaction commit
    c031ef8093f41 ASoC: max98090: fix missing IS_ERR() before PTR_ERR() on mclk lookup
    b6f1706afb59f ASoC: max98095: fix missing IS_ERR() before PTR_ERR() on mclk lookup
    c1fadd611cc58 ata: ahci_ceva: fix error paths in ceva_ahci_platform_enable_resources()
    55f3fc9c544c7 ahci: Introduce ahci_ignore_port() helper
    e43eb5d7cedf3 ata: libahci_platform: support non-consecutive port numbers
    ee53aae5d7d31 ata: sata_mv: accept 1 or 2 resources in platform probe
    778ccbded2c87 dmaengine: idxd: fix fdev setup failure cleanup in idxd_cdev_open()
    27806fe7b9701 dmaengine: sun6i-dma: Fix reclaim descriptors while terminating DMA
    9ae18a4b22ac3 pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151
    91b40862a0200 thunderbolt: Prevent XDomain delayed work use-after-free on disconnect
    35283a7b3468c soc: qcom: ice: Allow explicit votes on 'iface' clock for ICE
    1c8c6ac4d9f7d HID: logitech-dj: fix wrong detection of bad DJ_SHORT output report
    968e84f5c0dca HID: logitech-dj: Prevent REPORT_ID_DJ_SHORT related user initiated OOB write
    b802ff2a0467d HID: logitech-dj: Standardise hid_report_enum variable nomenclature
    299d5728a7312 gve: fix Rx queue stall on alloc failure
    95651461cf77c net: mpls: initialize rtm_tos in mpls_getroute()
    06a1273ce7213 netfilter: br_netfilter: Reallocate headroom if necessary in neigh_hh_bridge()
    da1f7306c8f28 netfilter: nf_conntrack_expect: restore helper propagation via expectation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index b8297fb8364..39fa0a56c2e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f673898aa832dc82d3f7b41e2b80576195be0c01"
-SRCREV_meta ?= "9f45b4cc5cdbaac7468b31ef04b8d9d74a329a04"
+SRCREV_machine ?= "c0f2d7109571c01223cbd3738db96b5ea20ddc68"
+SRCREV_meta ?= "b768be4d32d53a825349353e988ca5930e83f99c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.150"
+LINUX_VERSION ?= "6.6.151"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 85adcac7676..7675e325422 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.150"
+LINUX_VERSION ?= "6.6.151"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3595fedd1c011c6a9d7333fba206faccd23000d9"
-SRCREV_meta ?= "9f45b4cc5cdbaac7468b31ef04b8d9d74a329a04"
+SRCREV_machine ?= "20c2ecb592178ed51039ae1a75a523c66c1eee5d"
+SRCREV_meta ?= "b768be4d32d53a825349353e988ca5930e83f99c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 56001ec3e75..7a273f9cc6f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "eb3d4176015fb241f1d9ced0aedeb895b5c5b6a2"
-SRCREV_machine:qemuarm64 ?= "7fb3f3439f9a37d1eb5c9b8852fcfd16e106d39c"
-SRCREV_machine:qemuloongarch64 ?= "214397400c9747a170eabf91612d5ac3ccd25407"
-SRCREV_machine:qemumips ?= "1b7be08de47be5e78d90ed8c3843a415293a72ed"
-SRCREV_machine:qemuppc ?= "743a17db9981ac54b45c7e21aff83b9ec8d172ad"
-SRCREV_machine:qemuriscv64 ?= "214397400c9747a170eabf91612d5ac3ccd25407"
-SRCREV_machine:qemuriscv32 ?= "214397400c9747a170eabf91612d5ac3ccd25407"
-SRCREV_machine:qemux86 ?= "214397400c9747a170eabf91612d5ac3ccd25407"
-SRCREV_machine:qemux86-64 ?= "214397400c9747a170eabf91612d5ac3ccd25407"
-SRCREV_machine:qemumips64 ?= "bd7dc237220c9d2525e8ec4783540b8762019d9d"
-SRCREV_machine ?= "214397400c9747a170eabf91612d5ac3ccd25407"
-SRCREV_meta ?= "9f45b4cc5cdbaac7468b31ef04b8d9d74a329a04"
+SRCREV_machine:qemuarm ?= "06b8a8a900edeb9770128b2e25e7814ff0638c72"
+SRCREV_machine:qemuarm64 ?= "bcdc0007d72899e94de35713c4c18e0ad581f41b"
+SRCREV_machine:qemuloongarch64 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
+SRCREV_machine:qemumips ?= "9023f83c1acc4010d43c5891c641a671a12d264e"
+SRCREV_machine:qemuppc ?= "a76593fcb6c3b2183877d531562237a9def7acc5"
+SRCREV_machine:qemuriscv64 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
+SRCREV_machine:qemuriscv32 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
+SRCREV_machine:qemux86 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
+SRCREV_machine:qemux86-64 ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
+SRCREV_machine:qemumips64 ?= "50376ca9492c97cc4d6d291d06e52db021aeb1f1"
+SRCREV_machine ?= "491a3d5683a61ca2a7911f748661cfad50b8d05c"
+SRCREV_meta ?= "b768be4d32d53a825349353e988ca5930e83f99c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "6436c12a2ced865a3382b867e3882d08c2d2bf8d"
+SRCREV_machine:class-devupstream ?= "d27334b2888c10d2b60c954c59b186182d833107"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.150"
+LINUX_VERSION ?= "6.6.151"
 
 PV = "${LINUX_VERSION}+git"
 

