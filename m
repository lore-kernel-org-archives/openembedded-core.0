Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CCA4CDE004
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:27 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33420.1782253641451112645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=m7ezW7Cd;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b9318997so2026515e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253640; x=1782858440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h39Z8mBI6kHyQXVqXdkkwbl4FBt5saEFjjdaAXuZS0M=;
        b=m7ezW7Cds6u3xG0zKbeEy7MeiVeBhlEb94YxiXhSD4jzpLWUlnRQ+nXciebavVFoXJ
         TieblxGV2iTw7ZZB3To23YnpWMBf4aDfYKC3uFc8LgQrg7KvxnQAFSIj/yediLcUBfav
         CSr42ZalVkYgL3i6x669JHW57dZA3/4W6EO/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253640; x=1782858440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h39Z8mBI6kHyQXVqXdkkwbl4FBt5saEFjjdaAXuZS0M=;
        b=nzUwk4E51MjhAd4sQRKDsd9rv7r12CRbJmyNx4RVK0/3LnAGeaOXDYFs6BpvJA5Kua
         d+css5ZO3sP7cx/P8ijHbudD8xHAfmM+R9CF8BjoZHW9sIWwvbwqAbLV0TxroOM6dLfk
         +JUjIovKQoE4JQ3rQRPs7ztJcIRBxbIburuhOhla3rqijYzFsXFkEWgsWPKP1V1e6Gn4
         REP6MBh14kl3F/xAzWR3biKftpX57dSp/OsSISV2A2wNXvpTiFwOVogJ+aUmXJSHRbdK
         AqzhowT1C2SGFLe3+5NSktw9ycOULcu9ucHeOaS5Ngp6nrq1mMj+uLM5i708RDOY8Hfi
         HKxw==
X-Gm-Message-State: AOJu0YyUHve4pTZ6WtMuXXVAbPSZ1bGxmOH5JBmU9iS9JNfCOaGcuR38
	N9zw2+upMA+u0DYiVTHGvIBA5NUf2XmAtKYoXyEz/vvMT1L4dNf6akDu0aIO15lYKCdcNztberi
	avbBh
X-Gm-Gg: AfdE7cnCNjHPwERfg+tgfzssx5ErrpRGGxShZ1xTJ5rbRxPqTo2OYt2QaK3Uw/y6Rbh
	m04Ebt8TZkxYZGvZJTsUtXInRtwGOnN0qqVo/EY3OCDH5IdpbZ1/nAryuYDJ2kRipOzdANdXmY+
	B0M2BRy5cXjPNHe4CH74Cr3/3KemDHXzjHlTXl5+PtwNxAe75p9u47VncCCwhzLcsTuQeuvxLIV
	VLnrDH6BE40n2H81EZGwy6JUJH9Wi8qOF41qyfY+NZxRcJH1/mwpOHMc1Iqt6dEmMiP+P5UG38V
	mSVb6WGHlmV2WdMW/a37On3p3eDnizk/Maj8OYXLDc8UTLeS3hfgdjkoWLcW6a2VfGbbVqus/sv
	tPBn2O8MOLvA227iDvLbGlUu8xU/R8/k0Ry//pUPyUVzcx761Vaat/oNs8STTJbHDS8XAHgc4Lf
	3fCs3tWoaiNTty0vaBsYkCMs2GbSeKQXGRMgDPb/3CDTjvXBshodJIiwHFbWX+xZifB+7uDUvwe
	GHU2qE3/ybn+2kd
X-Received: by 2002:a05:600c:8b65:b0:492:40a1:1e16 with SMTP id 5b1f17b1804b1-49260849696mr6875945e9.8.1782253639132;
        Tue, 23 Jun 2026 15:27:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 37/41] linux-yocto/6.6: update to v6.6.141
Date: Wed, 24 Jun 2026 00:26:36 +0200
Message-ID: <050911a7705f3bb17d30034f3f16372b2e79b85d.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239459

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    0a40c6fbd105 Linux 6.6.141
    f9957ea12103 netfs: Fix potential uninitialised var in netfs_extract_user_iter()
    989214c66884 net: skbuff: propagate shared-frag marker through frag-transfer helpers
    78bf6b6bb195 net: skbuff: preserve shared-frag marker during coalescing
    9115669faedc net/rds: reset op_nents when zerocopy page pin fails
    864889ea15f0 mptcp: pm: ADD_ADDR rtx: resched blocked ADD_ADDR quicker
    013dcdc19615 mptcp: pm: ADD_ADDR rtx: fix potential data-race
    b21823f637e0 spi: sifive: fix controller deregistration
    524202b00b91 spi: sifive: Simplify clock handling with devm_clk_get_enabled()
    bf76b4a58c1a media: nxp: imx8-isi: Reduce minimum queued buffers from 2 to 0
    9c7c941d2242 spi: st-ssc4: fix controller deregistration
    d8cd9fb5e655 spi: st-ssc4: switch to use modern name
    a7fb771314fb ksmbd: validate inherited ACE SID length
    190e570cc0fc RDMA/mana: Fix error unwind in mana_ib_create_qp_rss()
    8358a142f2a1 f2fs: fix false alarm of lockdep on cp_global_sem lock
    6b050c4cfade f2fs: fix incorrect file address mapping when inline inode is unwritten
    f63201f674ee mptcp: pm: kernel: correctly retransmit ADD_ADDR ID 0
    93a9014029e4 mptcp: pm: prio: skip closed subflows
    0750c7935feb mptcp: fix rx timestamp corruption on fastopen
    11fdbd033e4c mptcp: drop __mptcp_fastopen_gen_msk_ackseq()
    7d7c9f0fcd19 RDMA/mana: Validate rx_hash_key_len
    cc3c0a0f9657 btrfs: fix missing last_unlink_trans update when removing a directory
    397418a9456c btrfs: use btrfs inodes in btrfs_rmdir() to avoid so much usage of BTRFS_I()
    546ca2e3e55a btrfs: use inode already stored in local variable at btrfs_rmdir()
    39aba0e6d5aa smb: client: Use FullSessionKey for AES-256 encryption key derivation
    cea7d2688ded drm/v3d: Reject empty multisync extension to prevent infinite loop
    958e032618c8 eventfs: Use list_add_tail_rcu() for SRCU-protected children list
    d2a675f2e238 btrfs: fix double free in create_space_info_sub_group() error path
    1ce1ec384486 btrfs: remove fs_info argument from btrfs_sysfs_add_space_info_type()
    707cb5df3eab pmdomain: core: Fix detach procedure for virtual devices in genpd
    c7d1eb27cf37 drm/gma500/oaktrail_lvds: fix i2c adapter leaks on init
    4e04b564c005 drm/gma500/oaktrail_lvds: fix hang on init failure
    63a2b5906e15 drm/gma500/oaktrail_hdmi: fix i2c adapter leak on setup
    4eb9d07b219f drm/panfrost: Fix wait_bo ioctl leaking positive return from dma_resv_wait_timeout()
    e5eb0a29a8aa drm/i915: skip __i915_request_skip() for already signaled requests
    2776f9016f1b iommu/vt-d: Disable DMAR for Intel Q35 IGFX
    534ebc08df97 libceph: handle rbtree insertion error in decode_choose_args()
    ea0d42137f0c libceph: Fix potential out-of-bounds access in crush_decode()
    d7a65a34d245 libceph: Fix potential null-ptr-deref in decode_choose_args()
    0d2dd7e6bb74 libceph: Fix potential out-of-bounds access in osdmap_decode()
    bcbbdae1b88f netfs: fix error handling in netfs_extract_user_iter()
    cad72955f8fb powerpc/warp: Fix error handling in pika_dtm_thread
    d6bda9df0c0a io-wq: check that the predecessor is hashed in io_wq_remove_pending()
    4bfdcefdaa60 ceph: fix a buffer leak in __ceph_setxattr()
    3d3b2b01a3e7 ALSA: usb-audio: Bound MIDI endpoint descriptor scans
    fafc97bd01e4 ALSA: usb-audio: Bound MIDI 2.0 endpoint descriptor scans
    7eaa514be4c0 drm/i915/dp: Fix VSC dynamic range signaling for RGB formats
    b41598bf54b3 smb/client: fix possible infinite loop and oob read in symlink_data()
    a1d4f3d3c0dc ASoC: SOF: Intel: hda: Fix NULL pointer dereference
    0f9ac21618c0 ASoC: SOF: Intel: hda-dai: add support for dspless mode beyond HDAudio
    1eda406a9432 ASoC: SOF: Intel: hda-dai: remove dspless special case
    e3ccb11fc824 netfilter: nf_tables: unconditionally bump set->nelems before insertion
    dde6eca9afae KVM: x86: Fix Xen hypercall tracepoint argument assignment
    a99a25db131e KVM: s390: pci: fix GAIT table indexing due to double-scaling pointer arithmetic
    01b71b930f15 KVM: Reject wrapped offset in kvm_reset_dirty_gfn()
    5b6da42fd804 audit: enforce AUDIT_LOCKED for AUDIT_TRIM and AUDIT_MAKE_EQUIV
    810d382802a5 net: atlantic: preserve PCI wake-from-D3 on shutdown when WOL enabled
    ecca618e1e33 netfilter: nft_ct: fix missing expect put in obj eval
    151ee470edc3 audit: fix incorrect inheritable capability in CAPSET records
    b92e124ef30a netfilter: nf_conntrack_sip: get helper before allocating expectation
    0088b3328a6f workqueue: Fix wq->cpu_pwq leak in alloc_and_link_pwqs() WQ_UNBOUND path
    a5712dc25d14 i40e: Cleanup PTP pins on probe failure
    e4c4a5074532 crypto: af_alg - Cap AEAD AD length to 0x80000000
    fa6794c968d4 bonding: fix NULL pointer dereference in actor_port_prio setting
    044dcbcb19c3 netconsole: avoid out-of-bounds access on empty string in trim_newline()
    feb754bde3ef net/sched: sch_pie: annotate more data-races in pie_dump_stats()
    bf3962084183 ksmbd: validate response sizes in ipc_validate_msg()
    52b9f8099369 net: bcmgenet: fix leaking free_bds
    dda1a2e898ad net: bcmgenet: Initialize u64 stats seq counter
    f17a4850d1ce crypto: nx - fix bounce buffer leaks in nx842_crypto_{alloc,free}_ctx
    d65a64755a3d smb: client: fix OOB reads parsing symlink error response
    ba302d3abb82 smb: client: correctly handle ErrorContextData as a flexible array
    2c7d07892ef8 Revert "crypto: nx - Migrate to scomp API"
    6c9970847516 Revert "crypto: nx - fix bounce buffer leaks in nx842_crypto_{alloc,free}_ctx"
    cb4634cb537b Revert "crypto: nx - fix context leak in nx842_crypto_free_ctx"
    02ecc0978c45 ntfs: ->d_compare() must not block
    9ccd0c1686c3 net/sched: cls_flower: revert unintended changes
    131e50acfeed sfc: fix error code in efx_devlink_info_running_versions()
    688f12aa4451 net: tls: fix strparser anchor skb leak on offload RX setup failure
    3ad2471e61e9 ice: fix NULL pointer dereference in ice_reset_all_vfs()
    bee6158b8a36 iavf: add VIRTCHNL_OP_ADD_VLAN to success completion handler
    b90697dd4b45 iavf: wait for PF confirmation before removing VLAN filters
    5936b7f29a38 iavf: stop removing VLAN filters from PF on interface down
    ee587b3b97b7 iavf: rename IAVF_VLAN_IS_NEW to IAVF_VLAN_ADDING
    3b7265b3a82f bonding: 3ad: implement proper RCU rules for port->aggregator
    2353f43d7ee7 bonding: print churn state via netlink
    fcf04d6f6943 bonding: add support for per-port LACP actor priority
    60fcd5af8279 net: bonding: add broadcast_neighbor option for 802.3ad
    ee2217012b3a bonding: 802.3ad replace MAC_ADDRESS_EQUAL with __agg_has_partner
    71d591d33dc4 drm/amd/display: Read EDID from VBIOS embedded panel info
    3dce88cf11d7 drm/amd/display: Allow DCE link encoder without AUX registers
    e3f95b1ba242 futex: Prevent lockup in requeue-PI during signal/ timeout wakeup
    d68f753d89f4 ALSA: hda/conexant: Fix missing error check for jack detection
    539604dcbf41 ALSA: hda/conexant: Renaming the codec with device ID 0x1f86 and 0x1f87
    35b7210e15a6 ALSA: hda/conexant: fix some typos
    3eaf81c3553e netconsole: propagate device name truncation in dev_name_store()
    3bc2c51a9ba1 net: netconsole: move newline trimming to function
    003b52afba79 net/sched: sch_cake: annotate data-races in cake_dump_stats() (V)
    a0f4e4e8e0f5 bareudp: fix NULL pointer dereference in bareudp_fill_metadata_dst()
    0928f17e86a5 ipv6: rename and move ip6_dst_lookup_tunnel()
    3bab544ae1e1 ipv4: add new arguments to udp_tunnel_dst_lookup()
    f933e5a43732 ipv4: remove "proto" argument from udp_tunnel_dst_lookup()
    0379c21610f0 ipv4: rename and move ip_route_output_tunnel()
    5cb1dd7093d3 sctp: discard stale INIT after handshake completion
    043e4b649b4b netfilter: skip recording stale or retransmitted INIT
    e3610ad82ebd ASoC: codecs: ab8500: Fix casting of private data
    b884ff67d62e drm/amdgpu/jpeg: set no_user_fence for JPEG v4.0.3 ring
    d4e0172a1b61 drm/amdgpu/jpeg: set no_user_fence for JPEG v4.0 ring
    ee035a9d3eed drm/amdgpu/jpeg: set no_user_fence for JPEG v3.0 ring
    63691e396105 drm/amdgpu/jpeg: set no_user_fence for JPEG v2.5 ring
    f675801889b2 drm/amdgpu/jpeg: set no_user_fence for JPEG v2.0 ring
    c12a5d35033c drm/amdgpu/vcn: set no_user_fence for VCN v4.0.3 enc ring
    e74fc9c72c1b drm/amdgpu/vcn: set no_user_fence for VCN v3.0 enc/dec rings
    2c6fb056567e drm/amdgpu/vcn: set no_user_fence for VCN v2.5 enc/dec rings
    f264019be80d drm/amdgpu/vcn: set no_user_fence for VCN v2.0 enc/dec rings
    b233ba52fd2e net: phy: dp83869: fix setting CLK_O_SEL field.
    47d017fe3159 net: mctp i2c: check length before marking flow active
    924b961d293c ALSA: usb-audio: Fix potential leak of pd at parsing UAC3 streams
    9247d59ca15b neigh: let neigh_xmit take skb ownership
    dbe42409bfeb neighbour: add RCU protection to neigh_tables[]
    ec2501e361b0 net/sched: taprio: fix NULL pointer dereference in class dump
    0d0dd383ac4d NFC: trf7970a: Ignore antenna noise when checking for RF field
    17e23e815008 net: usb: rtl8150: free skb on usb_submit_urb() failure in xmit
    5db090ca07b2 net: usb: rtl8150: fix use-after-free in rtl8150_start_xmit()
    3db8d078f7f6 vrf: Fix a potential NPD when removing a port from a VRF
    d4f8505517ff net/sched: sch_fq_pie: annotate data-races in fq_pie_dump_stats()
    229ad4b2dd86 net/sched: sch_choke: annotate data-races in choke_dump_stats()
    bd426bda5741 net/sched: netem: check for negative latency and jitter
    5c4fe716511d net/sched: netem: fix slot delay calculation overflow
    3a3698b96688 net/sched: netem: validate slot configuration
    116f10027e61 net/sched: netem: only reseed PRNG when seed is explicitly provided
    39a66e83ea41 net/sched: netem: fix queue limit check to include reordered packets
    d2a74e0ea346 net/sched: netem: fix probability gaps in 4-state loss model
    818f7673ed7f netdevsim: zero initialize struct iphdr in dummy sk_buff
    47421f8401fc cdrom, scsi: sr: propagate read-only status to block layer via set_disk_ro()
    ea6e650b079e arm64/scs: Fix potential sign extension issue of advance_loc4
    b933de804c84 drm/sysfb: ofdrm: fix PCI device reference leaks
    8524b1c04adc spi: rockchip: Read ISR, not IMR, to detect cs-inactive IRQ
    ea2ecd29b8f4 netfilter: nf_conntrack_sip: don't use simple_strtoul
    82664d0f1ba2 netfilter: xt_policy: fix strict mode inbound policy matching
    f60bc289c555 drm/amdgpu/gfx6: Support harvested SI chips with disabled TCCs (v2)
    da602e831334 drm/amdgpu/uvd3.1: Don't validate the firmware when already validated
    03011db69f5e drm/amdgpu: fix spelling typos
    8c4254c8f583 drm/amdgpu: fix AMDGPU_INFO_READ_MMR_REG
    1b8595d126ea nvme-pci: fix missed admin queue sq doorbell write
    ad9973df8e0e netfilter: arp_tables: fix IEEE1394 ARP payload parsing
    d7c8f95f599b nvmet-tcp: propagate nvmet_tcp_build_pdu_iovec() errors to its callers
    cbf460bf9492 tracing: branch: Fix inverted check on stat tracer registration
    f8f643d5ebef btrfs: fix double-decrement of bytes_may_use in submit_one_async_extent()
    03d3739a830e mailbox: mailbox-test: make data_ready a per-instance variable
    75a365c69bb7 mailbox: mailbox-test: initialize struct earlier
    3afca89fae50 mailbox: mailbox-test: don't free the reused channel
    14aed0d4e583 mailbox: add sanity check for channel array
    0a0ac6cd2e46 cgroup/rdma: fix integer overflow in rdmacg_try_charge()
    81c9e7e4030e mailbox: mailbox-test: free channels on probe error
    0d2edd20b61b fbdev: offb: fix PCI device reference leak on probe failure
    86094f62ba21 rtc: abx80x: Disable alarm feature if no interrupt attached
    a11372a8b1ce fs/adfs: validate nzones in adfs_validate_bblk()
    0897ccf6e930 vhost_net: fix sleeping with preempt-disabled in vhost_net_busy_poll()
    0274f24485fc tipc: fix double-free in tipc_buf_append()
    0ace0ce02911 nfp: fix swapped arguments in nfp_encode_basic_qdr() calls
    6bedc3ff4ba4 net: dsa: realtek: rtl8365mb: fix mode mask calculation
    d394093ed06e net/sched: sch_sfb: annotate data-races in sfb_dump_stats()
    86a6243d8654 net/sched: sch_red: annotate data-races in red_dump_stats()
    717bec018ce1 net/sched: sch_fq_codel: remove data-races from fq_codel_dump_stats()
    7bdb2b038c35 net/sched: sch_pie: annotate data-races in pie_dump_stats()
    046b2d8c9606 net_sched: sch_hhf: annotate data-races in hhf_dump_stats()
    b6ba93a7b71e net/rds: zero per-item info buffer before handing it to visitors
    1ff46c9915c1 ksmbd: scope conn->binding slowpath to bound sessions only
    407b6e699ba8 ksmbd: fix durable fd leak on ClientGUID mismatch in durable v2 open
    27fca12b9c2c ksmbd: destroy async_ida in ksmbd_conn_free()
    8a3cd890fd2a ksmbd: add support for supplementary groups
    234681c54581 ksmbd: Use struct_size() to improve smb_direct_rdma_xmit()
    1f3235364037 ksmbd: destroy tree_conn_ida in ksmbd_session_destroy()
    8db8727ea8d1 arm64: dts: meson-gxl-p230: fix ethernet PHY interrupt number
    37537e42e6df slip: bound decode() reads against the compressed packet length
    c6980e8b1a86 slip: reject VJ receive packets on instances with no rstate array
    5d05de2f0928 netfilter: nfnetlink_osf: fix potential NULL dereference in ttl check
    32e50f92c7cf netfilter: nfnetlink_osf: fix out-of-bounds read on option matching
    5241a3ab2c77 ipvs: fix MTU check for GSO packets in tunnel mode
    cbeb259f3138 netfilter: xtables: restrict several matches to inet family
    1c9fb8aeed06 netfilter: conntrack: remove sprintf usage
    8def8fbd23f4 netfilter: nfnetlink_osf: fix divide-by-zero in OSF_WSS_MODULO
    554cc061ca13 netfilter: nft_osf: restrict it to ipv4
    f9ef3db77a38 openvswitch: cap upcall PID array size and pre-size vport replies
    8a5e840babc5 pppoe: drop PFC frames
    d67fbc6dea5d sctp: fix OOB write to userspace in sctp_getsockopt_peer_auth_chunks
    0069813e6ca9 ipv6: fix possible UAF in icmpv6_rcv()
    733a1b310297 e1000e: Unroll PTP in probe error handling
    8a254c6db3ee i40e: don't advertise IFF_SUPP_NOFCS
    ca6f9d9aee54 ice: fix double-free of tx_buf skb
    a753619ffecf ice: Remove jumbo_remove step from TX path
    982a56c888d3 tcp: annotate data-races around tp->plb_rehash
    993847e92765 tcp: annotate data-races around (tp->write_seq - tp->snd_nxt)
    a445beb84c83 tcp: annotate data-races around tp->dsack_dups
    60db862ea01e tcp: annotate data-races around tp->bytes_retrans
    3e1b40e4f186 tcp: annotate data-races around tp->bytes_sent
    409a02760834 tcp: add data-race annotations around tp->data_segs_out and tp->total_retrans
    eee072fe16c6 net/sched: taprio: fix use-after-free in advance_sched() on schedule switch
    aaac3bed0342 nexthop: fix IPv6 route referencing IPv4 nexthop
    616db97e3aff net/sched: sch_cake: fix NAT destination port not being updated in cake_update_flowkeys
    497925275838 macvlan: fix macvlan_get_size() not reserving space for IFLA_MACVLAN_BC_CUTOFF
    f250c3772dd7 arm64: dts: imx8mm-tqma8mqml: Correct PAD settings for PMIC_nINT
    0fa0bcdebeb0 arm64: dts: imx8mn-tqma8mqnl: Correct PAD settings for PMIC_nINT
    3098c905af2f arm64: dts: imx8mm-emtop-som: Correct PAD settings for PMIC_nINT
    6d9f35fe4638 PCMCIA: Fix garbled log messages for KERN_CONT
    ca962d175543 arm64: dts: imx8mp-data-modul-edm-sbc: Correct PAD settings for PMIC_nINT
    7adb32513191 arm64: dts: imx8mp-dhcom-som: Correct PAD settings for PMIC_nINT
    640aea541eba arm64: dts: imx8mp-icore-mx8mp: Correct PAD settings for PMIC_nINT
    1f285713fb8d arm64: dts: imx8mp-debix-som-a: Correct PAD settings for PMIC_nINT
    827ccceff758 arm64: dts: imx8mp-debix-model-a: Correct PAD settings for PMIC_nINT
    eecee15e263c crypto: ccp - copy IV using skcipher ivsize
    f19a744d5271 crypto: sa2ul - Fix AEAD fallback algorithm names
    424df78c8a64 drm/i915/wm: Verify the correct plane DDB entry
    ed5ca5d5b97c drm/i915: Loop over all active pipes in intel_mbus_dbox_update
    c2577b18c6e2 drm/i915: Extract intel_dbuf_mdclk_cdclk_ratio_update()
    c5de9ff7939b drm/i915: Simplify watermark state checker calling convention
    73abb7c1fffd drm/i915: Constify watermark state checker
    cea15f66b7b6 f2fs: protect extension_list reading with sb_lock in f2fs_sbi_show()
    756d1a3954fe f2fs: Use sysfs_emit_at() to simplify code
    21fe517179f3 clk: visconti: pll: initialize clk_init_data to zero
    caa74d80d749 lib/hexdump: print_hex_dump_bytes() calls print_hex_dump_debug()
    db62a24a07b3 clk: qcom: dispcc-sc7180: Add missing MDSS resets
    5db0537ddef4 dt-bindings: clock: qcom,dispcc-sc7180: Define MDSS resets
    166db4ebae34 clk: xgene: Fix mapping leak in xgene_pllclk_init()
    bf94322387ab clk: qoriq: avoid format string warning
    4ba394f83b3c clk: imx8mq: Correct the CSI PHY sels
    a778bbd3ab28 clk: imx: imx6q: Fix device node reference leak in of_assigned_ldb_sels()
    0d2ba7e2e4c6 clk: imx: imx6q: Fix device node reference leak in pll6_bypassed()
    235c36a86cb7 clk: qcom: dispcc-sm8250: Enable parents for pixel clocks
    081d334fe42d clk: qcom: dispcc-sm8250: Use shared ops on the mdss vsync clk
    d18b05a09142 clk: qcom: gcc-sc8180x: Use retention for PCIe power domains
    9b54ebbe5d2f clk: qcom: gcc-sc8180x: Use retention for USB power domains
    a4cee425ae6b clk: qcom: gcc-sc8180x: Add missing GDSCs
    9109efceb709 dt-bindings: clock: qcom,gcc-sc8180x: Add missing GDSCs
    d7aef29573c7 scsi: target: core: Fix integer overflow in UNMAP bounds check
    b6007cfea4ed clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT from byte_div_clk_src dividers
    c5f4a211e82d scsi: sg: Resolve soft lockup issue when opening /dev/sgX
    d85a906b4e51 scsi: sg: Fix sysctl sg-big-buff register during sg_init()
    f9c921fd5264 scsi: sg: Make sg_sysfs_class constant
    fa4e1c583c9d clk: qcom: dispcc-sm8450: use RCG2 ops for DPTX1 AUX clock source
    137b5918931d RDMA/core: Prefer NLA_NUL_STRING
    ba0843c19558 platform/x86: dell-wmi-sysman: bound enumeration string aggregation
    622754397ac5 platform/x86: dell_rbu: avoid uninit value usage in packet_size_write()
    0b11fcbe80a5 fs/ntfs3: terminate the cached volume label after UTF-8 conversion
    a7fd0d0cb43f nfs/blocklayout: Fix compilation error (`make W=1`) in bl_write_pagelist()
    ccfa51ea8a40 mfd: mc13xxx-core: Fix memory leak in mc13xxx_add_subdevice_pdata()
    3d0e610c43cb platform/x86: panasonic-laptop: Fix OPTD notifier registration and cleanup
    fed8b8f33a46 tty: hvc_iucv: fix off-by-one in number of supported devices
    61599d438e2d leds: lgm-sso: Remove duplicate assignments for priv->mmap
    bc7998e70fa7 platform/surface: surfacepro3_button: Drop wakeup source on remove
    e87c4c0095ac backlight: sky81452-backlight: Check return value of devm_gpiod_get_optional() in sky81452_bl_parse_dt()
    c5be52529ad8 dev_printk: add new dev_err_probe() helpers
    10bb319b0b18 i3c: mipi-i3c-hci: fix IBI payload length calculation for final status
    54dc499e5cb3 perf util: Kill die() prototype, dead for a long time
    2f3548314715 ipmi: ssif_bmc: change log level to dbg in irq callback
    bffedb7a72e6 ipmi: ssif_bmc: fix message desynchronization after truncated response
    7d2a487c275c ipmi: ssif_bmc: fix missing check for copy_to_user() partial failure
    128845823138 perf expr: Return -EINVAL for syntax error in expr__find_ids()
    ea0078135c6a perf lock: Fix option value type in parse_max_stack
    9bab7d2a2850 pinctrl: abx500: Fix type of 'argument' variable
    92170bd2eadd perf: tools: cs-etm: Fix print issue for Coresight debug in ETE/TRBE trace
    aceabce300c3 perf branch: Avoid incrementing NULL
    8fe5240c7bd8 pinctrl: cy8c95x0: Avoid returning positive values to user space
    03e71cc07cba pinctrl: cy8c95x0: Unify messages with help of dev_err_probe()
    091709439f88 pinctrl: cy8c95x0: remove duplicate error message
    a79fdd593c84 pinctrl: pinctrl-pic32: Fix resource leak
    d216b34a9f69 bpf, arm32: Reject BPF-to-BPF calls and callbacks in the JIT
    699e16e65962 bpf: allow UTF-8 literals in bpf_bprintf_prepare()
    520454e83971 bpf: Fix NULL deref in map_kptr_match_type for scalar regs
    2f954f8a04b7 bpf: Fix precedence bug in convert_bpf_ld_abs alignment check
    d0d124dbcef9 bpf, sockmap: Take state lock for af_unix iter
    a94d3dd78ee8 bpf, sockmap: Fix af_unix null-ptr-deref in proto update
    3cef33b9813b bpf, sockmap: Fix af_unix iter deadlock
    7fd3b41260c6 bpf, arm64: Fix off-by-one in check_imm signed range check
    ad4505d2ab3a HID: usbhid: fix deadlock in hid_post_reset()
    5897c1dd1bfe mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
    295757c3b9de mtd: parsers: ofpart: call of_node_get() for dedicated subpartitions
    560c0456e613 mtd: parsers: ofpart: call of_node_put() only in ofpart_fail path
    cca2c083cfcb mtd: spi-nor: swp: check SR_TB flag when getting tb_mask
    b194ae62e9e7 mtd: spi-nor: update spi_nor_fixups::post_sfdp() documentation
    301e85ff299b mtd: spi-nor: sfdp: introduce smpt_map_id fixup hook
    2e472d2bdc14 mtd: spi-nor: sfdp: introduce smpt_read_dummy fixup hook
    036a794e7d7f mtd: spi-nor: core: correct the op.dummy.nbytes when check read operations
    fab6b870dfe6 dt-bindings: interrupt-controller: arm,gic-v3: Fix EPPI range
    ba91de4f0f98 mtd: physmap_of_gemini: Fix disabled pinctrl state check
    033939479b10 HID: asus: do not abort probe when not necessary
    08c4fa3f5a9b HID: asus: make asus_resume adhere to linux kernel coding standards
    5dcb51558e78 ima: check return value of crypto_shash_final() in boot aggregate
    9399a9298935 tracing: Rebuild full_name on each hist_field_name() call
    c258fbf57113 soundwire: cadence: Clear message complete before signaling waiting thread
    0b73d5dfa3fe dmaengine: mxs-dma: Fix missing return value from of_dma_controller_register()
    5acbbb205a1c soundwire: bus: demote UNATTACHED state warnings to dev_dbg()
    faa66f358d30 dmaengine: dw-axi-dmac: Remove unnecessary return statement from void function
    b9ae3942deec ocfs2: validate group add input before caching
    bb3c54d1e715 ocfs2: validate bg_bits during freefrag scan
    d919b905939e ocfs2: fix listxattr handling when the buffer is full
    f1e38ba97b1a ARM: dts: imx27-eukrea: replace interrupts with interrupts-extended
    064494145a70 arm64/xor: fix conflicting attributes for xor_block_template
    08c073e8f8d5 ARM: OMAP1: Fix DEBUG_LL and earlyprintk on OMAP16XX
    96a30f7cb8e0 arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP
    ccff9145cd52 soc: qcom: aoss: compare against normalized cooling state
    d672c7623306 soc: qcom: llcc: fix v1 SB syndrome register offset
    819d8ebad320 ocfs2/dlm: fix off-by-one in dlm_match_regions() region comparison
    f37de46149db ocfs2/dlm: validate qr_numregions in dlm_match_regions()
    813a47b03090 unshare: fix nsproxy leak in ksys_unshare() on set_cred_ucounts() failure
    39a8c0df2d5a soc/tegra: cbb: Set ERD on resume for err interrupt
    b87992ddf49a arm64: dts: imx8qxp-mek: switch Type-C connector power-role to dual
    7d6481cf2987 arm64: dts: qcom: sdm845-xiaomi-beryllium: Mark l1a regulator as powered during boot
    03d523e50662 arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting bias pinctrl
    a37e61cde05a arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and SDR104 SD card modes
    7ce6aa2eca26 arm64: dts: qcom: sm8450: Enable UHS-I SDR50 and SDR104 SD card modes
    1563a05cf920 arm64: dts: qcom: sm8550: Fix xo clock supply of platform SD host controller
    4322d8c7af96 arm64: dts: qcom: sm8550: Fix GIC_ITS range length
    97bacd872319 arm64: dts: qcom: sm8450: Fix GIC_ITS range length
    1e014285a3cd soc: qcom: ocmem: return -EPROBE_DEFER is ocmem is not available
    9f54516bce15 soc: qcom: ocmem: register reasons for probe deferrals
    d45c46c0e84f soc: qcom: ocmem: use scoped device node handling to simplify error paths
    1637ce361b1d soc: qcom: ocmem: make the core clock optional
    2ecad03d6c5d arm64: dts: qcom: msm8953-xiaomi-daisy: fix backlight
    5a0dcba6178f arm64: dts: qcom: msm8953-xiaomi-vince: correct wled ovp value
    5b94fe0879bc arm64: dts: mediatek: mt7986a: Fix gpio-ranges pin count
    167e5fa8feee arm64: dts: mediatek: mt6795: Fix gpio-ranges pin count
    fe1d1423c524 iommufd: vfio compatibility extension check for noiommu mode
    700e54a2beba arm64: dts: imx8mp-evk: Enable pull select bit for PCIe regulator GPIO (M.2 W_DISABLE1)
    036f599234e4 arm64: dts: imx8-apalis: Fix LEDs name collision
    cecc17692ebf memory: tegra30-emc: Fix dll_change check
    7e19e72f3064 memory: tegra124-emc: Fix dll_change check
    c13c938a8058 ARM: dts: mediatek: mt7623: fix efuse fallback compatible
    8fcefe840fa8 ksmbd: fix use-after-free from async crypto on Qualcomm crypto engine
    8be69e9245f8 efi/capsule-loader: fix incorrect sizeof in phys array reallocation
    233a0945a4b1 gfs2: prevent NULL pointer dereference during unmount
    bf5fcd9c37c2 gfs2: add some missing log locking
    6678dde26570 quota: Fix race of dquot_scan_active() with quota deactivation
    f57b68b36571 ktest: Run POST_KTEST hooks on failure and cancellation
    aa6b9e38086c ktest: Honor empty per-test option overrides
    5bddd0d3a926 ktest: Avoid undef warning when WARNINGS_FILE is unset
    232d67974a61 gfs2: Call unlock_new_inode before d_instantiate
    18216b8ab690 crypto: jitterentropy - replace long-held spinlock with mutex
    f57498d2bf16 dm cache: fix missing return in invalidate_committed's error path
    3a77b05ff2c4 ALSA: sc6000: Keep the programmed board state in card-private data
    dcbc2e2b2434 ALSA: sc6000: Use standard print API
    3e79a563377a spi: mtk-snfi: unregister ECC engine on probe failure and remove() callback
    fa7881f3b627 PCI: dwc: Apply ECRC workaround to DesignWare 5.00a as well
    bf98711d2f33 PCI: tegra194: Use DWC IP core version
    5d9c9dfef907 PCI: tegra194: Allow system suspend when the Endpoint link is not up
    2c87f49f2082 PCI: tegra194: Disable direct speed change for Endpoint mode
    272e9c4bcae8 PCI: tegra194: Use devm_gpiod_get_optional() to parse "nvidia,refclk-select"
    997122b96544 PCI: tegra194: Disable PERST# IRQ only in Endpoint mode
    39564f51567e PCI: tegra194: Don't force the device into the D0 state before L2
    e81f33968542 PCI: tegra194: Rename 'root_bus' to 'root_port_bus' in tegra_pcie_downstream_dev_to_D0()
    fdb9c5a3a627 PCI: tegra194: Disable LTSSM after transition to Detect on surprise link down
    8aa59b1e53a7 PCI: tegra194: Increase LTSSM poll time on surprise link down
    8f26b92dc606 PCI: tegra194: Fix polling delay for L2 state
    9e225563c5a9 ASoC: SOF: compress: return the configured codec from get_params
    2721d23db2e9 ALSA: scarlett2: Add missing sentinel initializer field
    7e805fdb16dc selftest: memcg: skip memcg_sock test if address family not supported
    05a3fd57cdfa Documentation: fix a hugetlbfs reservation statement
    11a810989a4d selftests/mm: skip migration tests if NUMA is unavailable
    07a5ecb94768 PCI: mediatek-gen3: Prevent leaking IRQ domains when IRQ not found
    0afb2eca25be PCI: Enable AtomicOps only if Root Port supports them
    9f1daac27ca2 ASoC: rsnd: Fix potential out-of-bounds access of component_dais[]
    5f1035ba3ed9 crypto: qat - use swab32 macro
    1ac96689ce29 ASoC: qcom: qdsp6: topology: check widget type before accessing data
    d39e8c3724a6 ASoC: fsl_easrc: Change the type for iec958 channel status controls
    4d427d3f507a ASoC: fsl_easrc: Fix value type in fsl_easrc_iec958_get_bits()
    a2e9527bc88e ASoC: fsl_easrc: Check the variable range in fsl_easrc_iec958_put_bits()
    4428887805ef ASoC: fsl_xcvr: Fix event generation in fsl_xcvr_mode_put()
    0dddb5642d64 ASoC: fsl_xcvr: Fix event generation in fsl_xcvr_arc_mode_put()
    ceb388682ea1 ASoC: fsl_micfil: Fix event generation in micfil_quality_set()
    4605327fd688 ASoC: fsl_micfil: Fix event generation in micfil_put_dc_remover_state()
    a6bc5432055b ASoC: fsl_micfil: Fix event generation in hwvad_put_init_mode()
    62c4ab11840d ASoC: fsl_micfil: Fix event generation in hwvad_put_enable()
    6adc82ff2f20 ASoC: fsl_micfil: Add access property for "VAD Detected"
    4ba05463862c pmdomain: imx: scu-pd: Fix device_node reference leak during ->probe()
    3a73abb39037 pmdomain: ti: omap_prm: Fix a reference leak on device node
    bad87bdd52f5 drm/msm/a6xx: Use barriers while updating HFI Q headers
    98fce340ec48 drm/msm/shrinker: Fix can_block() logic
    679a533d2235 drm/msm/a6xx: Fix HLSQ register dumping
    f101e4ebf1fc ASoC: SOF: Intel: hda: Place check before dereference
    2958b391d9c5 ALSA: hda/realtek: fix code style (ERROR: else should follow close brace '}')
    ad08dd4476eb drm/amd/pm/smu7: Add SCLK cap for quirky Hawaii board
    ef1c7aaa1319 drm/amd/pm/ci: Fill DW8 fields from SMC
    9e6d83f651ac drm/amd/pm/ci: Clear EnabledForActivity field for memory levels
    4cf77e3298e4 drm/amd/pm/ci: Fix powertune defaults for Hawaii 0x67B0
    37f93b3159fa drm/amd/pm/smu7: Fix SMU7 voltage dependency on display clock
    cc88a98c873b drm/amd/pm/ci: Disable MCLK DPM on problematic CI ASICs
    33da7d5b6a50 drm/amd/pm/ci: Use highest MCLK on CI when MCLK DPM is disabled
    9a7f12105f0e ALSA: core: Validate compress device numbers without dynamic minors
    0558d1b0b5f0 drm/panel: simple: Correct G190EAN01 prepare timing
    c4fc7ed73a0a drm/panel: sharp-ls043t1le01: make use of prepare_prev_first
    97d360a0112e drm/msm/dsi: rename MSM8998 DSI version from V2_2_0 to V2_0_0
    af6825d3e446 drm/msm/dsi: add the missing parameter description
    9830999c9e06 drm/msm/dpu: fix mismatch between power and frequency
    94d99e853617 spi: hisi-kunpeng: prevent infinite while() loop in hisi_spi_flush_fifo
    8ebaa3deb04f drm/amdgpu/gfx10: look at the right prop for gfx queue priority
    a6d44f477000 padata: Put CPU offline callback in ONLINE section to allow failure
    0e664e99abb4 padata: Remove cpu online check from cpu add and removal
    39024f54f098 crypto: atmel-aes - guard unregister on error in atmel_aes_register_algs
    59fce560694d crypto: atmel - Use unregister_{aeads,ahashes,skciphers}
    60c571a7d8d0 crypto: atmel - Remove cfb and ofb
    3cd5cae11afa fbdev: matroxfb: Mark variable with __maybe_unused to avoid W=1 build break
    6f866e941a7e dm init: ensure device probing has finished in dm-mod.waitfor=
    5af3d8f2acb6 drm/amdgpu: Add default case in DVI mode validation
    ef0d045ebbaf drm/sun4i: Fix resource leaks
    6040b24095a8 spi: fsl-qspi: Use reinit_completion() for repeated operations
    dc97ec849559 drm/bridge: cadence: cdns-mhdp8546-core: Handle HDCP state in bridge atomic check
    b01a582c8c6f drm/bridge: cadence: cdns-mhdp8546-core: Add mode_valid hook to drm_bridge_funcs
    5302015daf26 drm/bridge: cadence: cdns-mhdp8546-core: Set the mhdp connector earlier in atomic_enable()
    d4ac87567f86 dm log: fix out-of-bounds write due to region_count overflow
    15c30997dca6 dm cache metadata: fix memory leak on metadata abort retry
    2ebe1ab83292 platform/chrome: chromeos_tbmc: Drop wakeup source on remove
    12105c7f1837 dm cache: fix dirty mapping checking in passthrough mode switching
    89e04987574a dm cache: support shrinking the origin device
    d90accff225f dm cache: fix concurrent write failure in passthrough mode
    ac5ee9944389 dm cache policy smq: fix missing locks in invalidating cache blocks
    ecb10c193cbe dm cache: fix write hang in passthrough mode
    ceff6df26691 dm cache: fix write path cache coherency in passthrough mode
    0aa745fea1f8 dm cache: fix null-deref with concurrent writes in passthrough mode
    002a5f925d42 ASoC: sti: use managed regmap_field allocations
    686a6b305ec8 ASoC: sti: Return errors from regmap_field_alloc()
    cf615b90a11a drm/sun4i: backend: fix error pointer dereference
    d8a541906860 drm/komeda: fix integer overflow in AFBC framebuffer size check
    866d3d9b8775 net, bpf: fix null-ptr-deref in xdp_master_redirect() for down master
    1943e71a0d6a sctp: fix missing encap_port propagation for GSO fragments
    cc4dead22ede net: phy: qcom: at803x: Use the correct bit to disable extended next page
    22f22f1346b4 net: phy: move at803x PHY driver to dedicated directory
    e30356c3cf2f net: phy: add Rust Asix PHY driver
    014860036d1f net: phy: aquantia: move to separate directory
    77a853aec710 Bluetooth: l2cap: Add missing chan lock in l2cap_ecred_reconf_rsp
    6b4d226d01ab Bluetooth: fix locking in hci_conn_request_evt() with HCI_PROTO_DEFER
    a673cf6c4ac7 Bluetooth: hci_ldisc: Clear HCI_UART_PROTO_INIT on error
    315acf971d75 Bluetooth: L2CAP: Fix printing wrong information if SDU length exceeds MTU
    0a04db240eff bpf: reject short IPv4/IPv6 inputs in bpf_prog_test_run_skb
    61a9b216ca5b net/mlx5e: IPsec, fix ASO poll timeout with read_poll_timeout_atomic()
    02c1256f1990 net/mlx5e: Fix features not applied during netdev registration
    4f1ca61e5311 dt-bindings: net: dsa: nxp,sja1105: make spi-cpol optional for sja1110
    b3682e7ad450 net: ipa: Fix decoding EV_PER_EE for IPA v5.0+
    f7361841d0ce net: ipa: Fix programming of QTIME_TIMESTAMP_CFG
    954745d0223e ppp: require CAP_NET_ADMIN in target netns for unattached ioctls
    e19c5ed9f192 bpf: Fix OOB in pcpu_init_value
    07035306bf72 net/rds: Restrict use of RDS/IB to the initial network namespace
    2c7883d606aa net/rds: Optimize rds_ib_laddr_check
    f23424a0ddad net/sched: act_ct: Only release RCU read lock after ct_ft
    e9cf4018d742 net: hamradio: 6pack: fix uninit-value in sixpack_receive_buf
    f4ed5d750b4a 6pack: propagage new tty types
    b1f7158a86f3 bpf: Fix RCU stall in bpf_fd_array_map_clear()
    8849b50e81a2 netfilter: nft_fwd_netdev: check ttl/hl before forwarding
    9ca570236cc0 netfilter: xt_socket: enable defrag after all other checks
    e8206538cbaf net: bcmgenet: fix racing timeout handler
    1b0865a6efce net: bcmgenet: switch to use 64bit statistics
    991cd78f95f2 net: bcmgenet: support reclaiming unsent Tx packets
    355b61569e84 net: bcmgenet: move DESC_INDEX flow to ring 0
    df3a1bb0ae1a net: bcmgenet: add bcmgenet_has_* helpers
    d650d12d58ef net: bcmgenet: Remove custom ndo_poll_controller()
    2a7459017042 net: bcmgenet: fix off-by-one in bcmgenet_put_txcb
    03d97b558d80 arm64: kexec: Remove duplicate allocation for trans_pgd
    0e72fd7f05ae ACPI: AGDI: fix missing newline in error message
    3ff85ae79e1a bpf: reject negative CO-RE accessor indices in bpf_core_parse_spec()
    26b380a3ca0b bpf: Drop task_to_inode and inet_conn_established from lsm sleepable hooks
    d3f280be48f1 wifi: brcmfmac: Fix error pointer dereference
    a713b72ff88c bpf: Fix stale offload->prog pointer after constant blinding
    b4b5a20bed82 bpf: fix end-of-list detection in cgroup_storage_get_next_key()
    1aa61a6f42ad macvlan: annotate data-races around port->bc_queue_len_used
    0adec27bde44 selftests/powerpc: Suppress -Wmaybe-uninitialized with GCC 15
    81bc3a2ccc37 selftests/powerpc: Re-order *FLAGS to follow lib.mk
    7ca35863213c powerpc/crash: fix backup region offset update to elfcorehdr
    6e474972b85e r8152: fix incorrect register write to USB_UPHY_XTAL
    ea04b9881534 wifi: rtw89: phy: fix uninitialized variable access in rtw89_phy_cfo_set_crystal_cap()
    571a05ea1baa bpf: Use RCU-safe iteration in dev_map_redirect_multi() SKB path
    eefe0c2ea2c3 bpf, devmap: Remove unnecessary if check in for loop
    6d5202409467 wifi: mt76: mt7915: fix use-after-free bugs in mt7915_mac_dump_work()
    66f2a0becd35 wifi: mt76: mt7996: fix struct mt7996_mcu_uni_event
    6cf44608d5e6 arm64: cpufeature: Make PMUVer and PerfMon unsigned
    63fe66f10283 wifi: mt76: mt7996: fix FCS error flag check in RX descriptor
    4dd75a78cdfb wifi: mt76: mt7915: fix use_cts_prot support
    382cbdf6e484 wifi: mt76: mt7615: fix use_cts_prot support
    c8e46d0664c4 wifi: mt76: mt7921: Reset ampdu_state state in case of failure in mt76_connac2_tx_check_aggr()
    231b895daa02 module: Fix freeing of charp module parameters when CONFIG_SYSFS=n
    e6962cb18a89 params: Replace __modinit with __init_or_module
    edc90a12073b s390/bpf: Zero-extend bpf prog return values and kfunc arguments
    e70b9c2292cc dpaa2: compile dpaa2 even CONFIG_FSL_DPAA2_ETH=n
    6e8d309bc69b dpaa2: add independent dependencies for FSL_DPAA2_SWITCH
    c7ad31fb948f bpf: test_run: Fix the null pointer dereference issue in bpf_lwt_xmit_push_encap
    5d81743ee3cc bpf: Add CHECKSUM_COMPLETE to bpf test progs
    008c456b76e9 wifi: rtlwifi: pci: fix possible use-after-free caused by unfinished irq_prepare_bcn_tasklet
    255cc1d30f32 wifi: mwifiex: Fix memory leak in mwifiex_11n_aggregate_pkt()
    a5af71c6181e firmware: dmi: Correct an indexing error in dmi.h
    240f832a9c20 locking: Fix rwlock support in <linux/spinlock_up.h>
    ca2d280b9b38 hrtimer: Reduce trace noise in hrtimer_start()
    ece8be21d8c9 hrtimer: Avoid pointless reprogramming in __hrtimer_start_range_ns()
    16774f7333fc hrtimers: Update the return type of enqueue_hrtimer()
    b54f14e1460c irqchip/irq-pic32-evic: Address warning related to wrong printf() formatter
    c4295487124f s390/cio: use generic driver_override infrastructure
    9d606425a752 s390/cio: convert sprintf()/snprintf() to sysfs_emit()
    3d0cfecf4ff7 s390/cio: make sch->lock spinlock pointer a member
    6325eea40a95 debugfs: fix placement of EXPORT_SYMBOL_GPL for debugfs_create_str()
    f9c489418b8e debugfs: check for NULL pointer in debugfs_create_str()
    fc6ecb4b8ef9 thermal/drivers/spear: Fix error condition for reading st,thermal-flags
    f75ea8cdca54 devres: fix missing node debug info in devm_krealloc()
    d172f1c8a8b3 ACPI: x86: cmos_rtc: Improve coordination with ACPI TAD driver
    9a6f4d85a016 ACPI: x86: cmos_rtc: Clean up address space handler driver
    da8255040938 pstore/ram: fix resource leak when ioremap() fails
    4048ed98860d blk-cgroup: fix disk reference leak in blkcg_maybe_throttle_current()
    b88f905d4449 nilfs2: reject zero bd_oblocknr in nilfs_ioctl_mark_blocks_dirty()
    5dd9d864eb96 loop: fix partition scan race between udev and loop_reread_partitions()
    282e06e6d494 drbd: Balance RCU calls in drbd_adm_dump_devices()
    131ea3e57fc2 fs/omfs: reject s_sys_blocksize smaller than OMFS_DIR_START
    467289e0d0f2 blk-cgroup: wait for blkcg cleanup before initializing new disk

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index d8d3d69f197..5fcf0f81d7c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "742fd3c3537c966272314e48f67397f0e1d622d7"
-SRCREV_meta ?= "b043ea37245d4c669239b28a30c78c390bdafdcc"
+SRCREV_machine ?= "7bb6512fc5dc7b1191867beadc83b3ce216a2037"
+SRCREV_meta ?= "020f8355dc905686f3c125ec87ce4d21a5966750"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.140"
+LINUX_VERSION ?= "6.6.141"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 0fd9c36bd80..0bd1ae9ad2d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.140"
+LINUX_VERSION ?= "6.6.141"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cd0d6d62e0e4ff344241d89f37cd6d305e1afb85"
-SRCREV_meta ?= "b043ea37245d4c669239b28a30c78c390bdafdcc"
+SRCREV_machine ?= "90e2be4f80d73789176eab3679ef12ec164d594f"
+SRCREV_meta ?= "020f8355dc905686f3c125ec87ce4d21a5966750"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index dc978f240e6..f684fac7242 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0aa210fedb89bfb9577bc20b56cc674437f85843"
-SRCREV_machine:qemuarm64 ?= "655d3dc028f830d71d9565ec8302a0e339a2de2f"
-SRCREV_machine:qemuloongarch64 ?= "c46ce4bd9d6b7fc0c1d6ca2a519ee3d07fa753a9"
-SRCREV_machine:qemumips ?= "b547c71f2db45462626f69a4e4bffad43ffaeddc"
-SRCREV_machine:qemuppc ?= "c1de905a03cfd9cf9de51657e7fd20ec6fb7d078"
-SRCREV_machine:qemuriscv64 ?= "c46ce4bd9d6b7fc0c1d6ca2a519ee3d07fa753a9"
-SRCREV_machine:qemuriscv32 ?= "c46ce4bd9d6b7fc0c1d6ca2a519ee3d07fa753a9"
-SRCREV_machine:qemux86 ?= "c46ce4bd9d6b7fc0c1d6ca2a519ee3d07fa753a9"
-SRCREV_machine:qemux86-64 ?= "c46ce4bd9d6b7fc0c1d6ca2a519ee3d07fa753a9"
-SRCREV_machine:qemumips64 ?= "6f0fadc3449cfed9ceac3cce845dfb9b70f9affd"
-SRCREV_machine ?= "c46ce4bd9d6b7fc0c1d6ca2a519ee3d07fa753a9"
-SRCREV_meta ?= "b043ea37245d4c669239b28a30c78c390bdafdcc"
+SRCREV_machine:qemuarm ?= "b3697b53304c9f2c0e7e46a22549ed9d64a110ca"
+SRCREV_machine:qemuarm64 ?= "302113f65bb9cbd9afdb476222cc1fa596e36855"
+SRCREV_machine:qemuloongarch64 ?= "2c57d38b7d1560691a786d2daf5be0e25d200dfb"
+SRCREV_machine:qemumips ?= "a6b8c8416a2074c8e14eeeeb36a0e5bd0f2add92"
+SRCREV_machine:qemuppc ?= "413e2245480aec98a737ab657322180581a496f5"
+SRCREV_machine:qemuriscv64 ?= "2c57d38b7d1560691a786d2daf5be0e25d200dfb"
+SRCREV_machine:qemuriscv32 ?= "2c57d38b7d1560691a786d2daf5be0e25d200dfb"
+SRCREV_machine:qemux86 ?= "2c57d38b7d1560691a786d2daf5be0e25d200dfb"
+SRCREV_machine:qemux86-64 ?= "2c57d38b7d1560691a786d2daf5be0e25d200dfb"
+SRCREV_machine:qemumips64 ?= "257558ce69f7bdbc571cb1b2d9eb35890747fd02"
+SRCREV_machine ?= "2c57d38b7d1560691a786d2daf5be0e25d200dfb"
+SRCREV_meta ?= "020f8355dc905686f3c125ec87ce4d21a5966750"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "eac8889a3a1c81d7113cc4656b9420e84c379cf5"
+SRCREV_machine:class-devupstream ?= "0a40c6fbd105802fbbcaadca249e0948fbf8095a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.140"
+LINUX_VERSION ?= "6.6.141"
 
 PV = "${LINUX_VERSION}+git"
 

