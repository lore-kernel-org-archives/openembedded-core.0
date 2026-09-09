Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADF0C79FBB
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:00 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6305.1788938996070009099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mZZUp4Tx;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so659048f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788938994; x=1789543794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Q0vextnbp1MkbeFszpEt30uw2gDeBbHnk1FrKVkG1TE=;
        b=mZZUp4TxNbvV4uhGL4LUkfO3yhvGaTf0DDVSTu6G74KOqCB+vHxd5+YO2LQEFXtOZz
         XAHDZu6FjOVZU+cFKdHiuxkkI4r0X3aoxo5Cej4Tnu3/6gzkhufNGjtEGn1O6V9oU4iJ
         rieJWMuLr4ZMUTIhEi4uk6yaVz0nAmXEJw3x0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788938994; x=1789543794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Q0vextnbp1MkbeFszpEt30uw2gDeBbHnk1FrKVkG1TE=;
        b=jFA+RYgmhTh+mLB1PuCjzQvy6kvpk3KkA9bGZQK2I3D/ekwjm3Pye36GVdhnwQaZ9d
         3y75KldfEdgzz0RxqLoC1xtp/sPLTUfEhmx8cy75KtTVukIAKWbTlrG9WRJ+2BKZDH26
         K24kgI+YCLMZIigQ40o1e0qSODqWZrNk5qWjQdf4p5ODlhXLPRJ+tdXXdN3CxIpoHEo6
         vPpriTY25BlRX//S9ruQLb9YFNaWTCYEy7eIId0CbfhSDLKE0HEAKbjIgwJuheQHBvIa
         vOoFQSppLcjZAuSlorzRx0Sdlq5NG2KWaxHK8nWeeL8l2hDeauYVO57oSUa38phe7yL7
         CoWQ==
X-Gm-Message-State: AFuF++ntiyVDwqvhIeJh9Y1gJUvgHW7Qryvertv9CXRUGhunfhpEBNLA
	lU+sbwLDI/Jf+shPPLJL8cEC8h9e5+rPcw3mAh9hmabpOQ9+H3K2dQa4SVdT+JNAUs5ggb+mmm6
	rxZxzvG0=
X-Gm-Gg: AYBFou11XXxfjDHXe9Yrs+28eXrzI1PyIEQNTXbc1RBVAn9zZELWZSsXvfga4hpS502
	2q70qDuZpINN5ipqHIQHl0tqSNI5FMt1FR3u4bDbK98wnNcJ3obXrXrzWm9RcquoRPD+s/jbhaB
	luKqaDtDOEu+YGIW5LLfZi9hNFutFvQWKJZsgGEDTYKmjKTl43M1sGBFGryekAd9gIfjBfs7hDa
	oZu/qHPWJCcofFaB5oilaw4Ke8MX+thmrS7nunC1EmhVmlPcO4+GVJyc0pdU+CG3Rllan5ik+Yp
	QARxnZwMTpu2eqmbHwnu31RUMIiEUoYNhXifeE8kLJlizjdJed0g8lSEtj6k/1FgTNrhPCi2CZl
	AzYSoqJgkaIXYBaLzW2ctAEG4uAyi/rTBjOMvMqTTw+j5lv4AzB4rRozt47su+mCYZaTnrGEWN4
	3hpE/zC6bXMaPh9dZLGnASI2yNNL3mnboxhcGNKgu8H7qyAgxTtBnCKHsPM4nfGzJ5CwJg13vF+
	/u0GBgxcx3FpNibvUZ/KAGDYCkstmjZAaqD6VjJLL8Mde65IWXkpZycwnTvMDTE3FC56uOQZkg=
X-Received: by 2002:adf:e702:0:b0:485:86bf:654a with SMTP id ffacd0b85a97d-485a2434a80mr10073245f8f.19.1788938992888;
        Wed, 09 Sep 2026 00:29:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.29.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:29:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/38] linux-yocto/6.18: update to v6.18.43
Date: Wed,  9 Sep 2026 09:29:01 +0200
Message-ID: <2a7528a090c4920ea90065630181f1ff4509c8e0.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245410

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    7b923c78b50d2 Linux 6.18.43
    bfe7f9993467b x86/bugs: Make Safe-RET robust against interrupt injection
    856a9b51680cb Linux 6.18.42
    0f33b1c457c21 KVM: SVM: Bump asid_generation on CPU online to avoid ASID collision after hotplug
    846ed916cfa0c gpu: Fix uninitialized buddy for built-in drivers
    bcb29986bbba8 net: stmmac: fix dwmac4 transmit performance regression
    a0d1a11b90a51 net/mlx5e: Fix NULL pointer dereference in ioctl module EEPROM query
    f282242906c12 usb: gadget: f_tcm: synchronize delayed set_alt with teardown
    aeebcfa8237c3 rust: device: avoid trailing ; in printing macros
    e94e820df37d4 rust: allow `suspicious_runtime_symbol_definitions` lint for Rust >= 1.98
    6ce0db97fb37a mm/damon/core: disallow overlapping input ranges for damon_set_regions()
    4b6f1d6d5d078 mm/damon/core: validate ranges in damon_set_regions()
    deead12d2e650 i3c: mipi-i3c-hci: Fix handling of shared IRQs during early initialization
    811b581fae651 i3c: mipi-i3c-hci: Fix Hot-Join NACK
    4fd5b33faf092 pmdomain: imx93-blk-ctrl: Extract PHY as shared domain for DSI/CSI
    c389893bb4037 pmdomain: imx93-blk-ctrl: convert to devm_* only
    dc8347f263b21 net: ipa: fix SMEM state handle leaks in SMP2P init
    4c1e8ccd8655e ata: libata-core: Reject an invalid concurrent positioning ranges count
    9466dc5e377f0 bootconfig: fix NULL-pointer arithmetic in xbc_snprint_cmdline()
    a88c2a70ea0ad bootconfig: move xbc_snprint_cmdline() to lib/bootconfig.c
    c73b8795b45f4 octeontx2-af: cn10k: restrict VF LMTLINE sharing to its own PF
    4467fa514482b octeontx2-af: validate body pcifunc in rvu_mbox_handler_rep_event_notify
    ae5ae3d5bfaa6 net: mana: Optimize irq affinity for low vcpu configs
    6d13eaa13341a net: mana: Validate the packet length reported by the NIC
    7b7bb07efe41b fs/resctrl: Fix use-after-free during unmount
    d48cf914c739e fs/resctrl: Move RMID initialization to first mount
    682d3c2cd20e0 fs/resctrl: Move allocation/free of closid_num_dirty_rmid[]
    8c5925f0fa128 x86,fs/resctrl: Rename some L3 specific functions
    696c34a1964f4 x86,fs/resctrl: Rename struct rdt_mon_domain and rdt_hw_mon_domain
    ad4ea2a169a48 fs/resctrl: Split L3 dependent parts out of __mon_event_count()
    5b82af744e06c mmc: vub300: fix use-after-free on probe failure
    73d397ab54f2a mmc: vub300: rename probe error labels
    8ced1d242c34e dm: avoid leaking the caller's thread keyring via the table device file
    dd73cc92a55d7 cred: add kernel_cred() helper
    af7a4c2caa7a1 accel/amdxdna: reject command submission on devices without a submit op
    62dae36be7a62 ovl: use linked upper dentry in copy-up tmpfile
    043acb00e4edd dmaengine: dw-edma-pcie: Reject devices without driver data
    277a035cda47d dmaengine: dw-edma: Fix confusing cleanup.h syntax
    19360c25135fc mtd: maps: vmu-flash: fix fault in unaligned fixup
    b8271be34bce1 kho: make sure scratch size is always aligned by CMA_MIN_ALIGNMENT_BYTES
    3d561f46fa784 mm/sparse-vmemmap: fix vmemmap accounting underflow
    8af652cd99460 remoteproc: xlnx: Check remote core state
    6fc1919a6f2ed cxl: Fix CXL_HEADERLOG_SIZE to match RAS Capability size
    89b2ae039d188 cxl/pci: Remove CXL VH handling in CONFIG_PCIEAER_CXL conditional blocks from core/pci.c
    eeab775069920 cxl/pci: Remove unnecessary CXL RCH handling helper functions
    a64661dccb2eb cxl/pci: Remove unnecessary CXL Endpoint handling helper functions
    5d964cb2b7bc8 SUNRPC: Return an error from xdr_buf_to_bvec() on overflow
    b50b2cb87e7ac SUNRPC: Add helpers to convert xdr_buf byte ranges to scatterlists
    a112b91dd6349 sunrpc: allocate a separate bvec array for socket sends
    3120f21df3fb0 NFSD: pass nfsd_file to nfsd_iter_read()
    6876f767b0490 pinctrl: renesas: rzg2l: Use -ENOTSUPP instead of -EOPNOTSUPP
    7185c5262435b gpu/buddy: bail out of try_harder when alignment cannot be honoured
    9634fd144cdc1 drm: drop lib from header search path.
    65677f7a20c48 gpu: Move DRM buddy allocator one level up (part two)
    09755dc62b026 netfilter: nf_conntrack_sip: validate skb_dst() before accessing it
    a1a94a00b8844 netfilter: nf_conntrack_sip: remove net variable shadowing
    d01c913febead netfilter: nft_fib: reject fib expression on the netdev egress hook
    beeda5bf78577 netfilter: nf_tables: remove register tracking infrastructure
    1de827e24d0ad arm64: dts: qcom: hamoa: Fix OPP tables for all DisplayPort controllers
    0d810ff7a6f65 arm64: dts: qcom: correct RBR opp entry
    690fb82c4122f VDUSE: avoid leaking information to userspace
    7764e9c727d58 vduse: take out allocations from vduse_dev_alloc_coherent
    db5c554b36d50 vduse: remove unused vaddr parameter of vduse_domain_free_coherent
    82e48ad2a1326 vduse: return internal vq group struct as map token
    b1f38c3ec620a xfs: don't replace the wrong part of the cow fork
    3bca70235a706 fuse-uring: fix race between registration and connection abortion
    40879c39d6740 audit: fix recursive locking deadlock in audit_dupe_exe()
    91b64f0be4163 audit: use 'unsigned int' instead of 'unsigned'
    eef6914f2b456 audit: widen ino fields to u64
    c5772ced573ea landlock: Account all audit data allocations to user space
    a95b62759f3b9 landlock: Fix formatting
    682a0066dde05 drm/amd/display: Fix DTB DTO updates breaking live pixel rate sources
    81ea8e8221853 fscrypt: Avoid dynamic allocation in fscrypt_get_devices()
    337022d9dfac4 ksmbd: validate ACE size against SID sub-authorities
    f1eba60db813e ksmbd: bound DACL dedup walk to copied ACEs
    847ecd4eb3c11 ksmbd: restore DACL size on check_add_overflow() to avoid malformed ACL
    b6d3cc6a52441 ksmbd: validate num_subauth when copying ACE in set_ntacl_dacl
    17e6b8c4319fa net: qrtr: ns: Raise node count limit to 512
    7dd26adf7e7d4 ublk: wait on ublk_dev_ready() instead of ub->completion
    5a15eaa50f92b drm/xe/uapi: Reject coh_none PAT index for CPU_ADDR_MIRROR
    5488d3a69d205 dm-verity: fix buffer overflow in FEC calculation
    3f31bde63f9ae dm-verity-fec: replace {MAX,MIN}_RSN with {MIN,MAX}_ROOTS
    d47281b9a4472 dm-verity-fec: fix reading parity bytes split across blocks (take 3)
    a556189c06756 dm-verity-fec: fix the size of dm_verity_fec_io::erasures
    22400725de070 bpf: Fix same-register dst/src OOB read and pointer leak in sock_ops
    15a7cb71a5748 drm/amdgpu: fix check in amdgpu_hmm_invalidate_gfx
    ab7b40c638e0d drm/amd/pm: fix smu13 power limit range calculation
    6405c4e75b3bc drm/amdgpu: fix aperture mapping leak
    08fee493e0261 drm/amdgpu: invoke pm_genpd_remove() before freeing genpd
    68eab5a64ddbc drm/amdgpu: fix resource leak on ACP reset timeout
    ffb33d466a68c drm/amdgpu: fix division by zero with invalid uvd dimensions
    8c6d84a54823c drm/dp_mst: Handle torn-down topology gracefully in drm_dp_mst_topology_queue_probe()
    bd868c077f675 drm/amdgpu/vcn4: avoid rereading IB param length
    7eebef042c12d drm/amdgpu/vce: fix integer overflow in image size
    f7e9eeaccca54 drm/amdgpu/soc24: reset dGPU if suspend got aborted
    dc3f5da1ba8e2 drm/amdgpu/sdma4.4.2: replace BUG_ON() with WARN_ON()
    76c977d396f12 drm/amdgpu/jpeg: fix jpeg_v5_0_1_is_idle detection
    058373af59551 drm/amdgpu/jpeg: fix jpeg_v4_0_3_is_idle detection
    042c047e8bc9c drm/amdgpu/gfx9: replace BUG_ON() with WARN_ON()
    05aea3344c422 drm/amdgpu/gfx9.4.3: replace BUG_ON() with WARN_ON()
    f70bd5235d9ef drm/amdgpu/gfx8: drop unecessary BUG_ON()
    987bedd3ea89d drm/amdgpu/gfx12: replace BUG_ON() with WARN_ON()
    dfd9bf09fd8fe drm/amdgpu/gfx11: replace BUG_ON() with WARN_ON()
    7e22de67e545d drm/amdgpu/gfx10: replace BUG_ON() with WARN_ON()
    e75f71143b68b drm/amd/pm: make pp_features read-only when scpm is enabled
    ada47af5c215e drm/amd/pm: fix amdgpu_pm_info power display units
    7b263cf1dd4c0 watchdog: s32g_wdt: remove incorrect options in watchdog_info struct
    79370b573e92e vxlan: mdb: Fix source list corruption on a failed replace
    f60bac115d8dc vsock/virtio: collapse receive queue under memory pressure
    5f5a41a48dbf9 tipc: clear sock->sk on the failed-insert path in tipc_sk_create()
    234f9ffbd9b2c tcp: challenge ACK for non-exact RST in SYN-RECEIVED
    fadaff3f66e12 tcp: initialize standalone TCP-AO response padding
    4a4f3aa6af205 rtase: Workaround for TX hang caused by hardware packet parsing
    6866abf59976d pppoe: reload header pointer after dev_hard_header()
    460b9f0609d26 ovpn: hold peer before scheduling keepalive work
    b08526bf0bbf8 ovpn: fix peer refcount leak in TCP error paths
    100a23b1613e9 openvswitch: fix GSO userspace truncation underflow
    f80ba170d7b3a mctp: serial: handle zero-length frames to prevent rx buffer overflow
    f20dedce0429b mac802154: llsec: reject frames shorter than the authentication tag
    59c1d5463b7bc mac802154: hold an interface reference across the scan worker
    472aba2603ca7 ila: reload IPv6 header after pskb_may_pull in checksum adjust
    919d0accf2600 ice: use READ_ONCE() to access cached PHC time
    5e496f2b615ce ice: reject out-of-range ptype in ice_parser_profile_init
    91e0249f3ef62 gve: fix Rx queue stall on alloc failure
    18705cace0619 ksmbd: defer destroy_previous_session() until after NTLM authentication
    6098b55f6a0cf smb: client: handle STATUS_STOPPED_ON_SYMLINK responses without a symlink target
    34f2a2f32af57 rbd: Reset positive result codes to zero in object map update path
    63d78b546eefc super: fix emergency thaw deadlock on frozen block devices
    e4406cbdd915f ice: fix PTP Call Trace during PTP release
    b3efb4744abf4 ptp: ptp_s390: Add missing facility check
    9a8a247f0f17b s390/ptff: Export ptff_function_mask[]
    4afc58ea75b96 proc: Fix broken error paths for namespace links
    4056cc19071a3 net: pcs: xpcs: fix SGMII state reading
    80d977f280b4e net: hip04: fix RX buffer leak on build_skb failure
    a4dfd46cc8f08 net: gro: fix double aggregation of flush-marked skbs
    ec6d91a1bf2eb net/x25: fix use-after-free in x25_kill_by_neigh()
    40f9a124ebbe0 net/mlx5e: Use sender devcom for MPV master-up
    900cd6d8119b7 net/iucv: fix use-after-free of a severed iucv_path
    33736ff5e7c97 net/af_iucv: fix NULL deref in afiucv_hs_callback_syn()
    f8c498585d2a0 geneve: require CAP_NET_ADMIN in the device netns for changelink
    5d07b178bef51 net: slip: serialize receive against buffer reallocation
    730c7e5fea7f0 vxlan: require CAP_NET_ADMIN in the device netns for changelink
    a48a889b60f73 phonet: pep: fix use-after-free in pep_get_sb()
    03157872da5ed net: stmmac: intel: skip SerDes reconfig when rate is unchanged
    1b44a5f584bff iommu/vt-d: Disallow SVA if page walk is not coherent
    7037e7bdcd26f iomap: fix out-of-bounds bitmap_set() with zero-length range
    f139498c5ebdd io_uring/rw: fix missing ERESTARTSYS conversion in read paths
    65bf73bee1a4f ftrace: Add global mutex to serialize trace_parser access
    95376fe9c145b fscrypt: Add missing superblock check in find_or_insert_direct_key()
    a019b074903b3 fs: preserve ACL_DONT_CACHE state in forget_cached_acl()
    c78e38745ff1b fs/super: fix emergency thaw double-unlock of s_umount
    89b9121c3b016 binfmt_elf_fdpic: only honour the first PT_INTERP
    d309f8b52b34c ASoC: fsl_sai: Fix spurious BCLK on resume by clearing BYP
    c4d77740eca21 ASoC: fsl: imx-card: Skip sysclk reset for active DAIs in shutdown
    1a644db2cf59f amt: fix use-after-free in AMT delayed works
    8f5a3abc54ba2 libceph: remove debugfs files before client teardown
    3b2f1937f5fce libceph: reject zero bucket types in crush_decode
    e67e8b694872c libceph: Reject monmaps advertising zero monitors
    0060ec912292a libceph: refresh auth->authorizer_buf{,_len} after authorizer update
    4716a64b7cc27 libceph: guard missing CRUSH type name lookup
    1732d89dfcd74 libceph: Fix multiplication overflow in decode_new_up_state_weight()
    4e7ebfaa0d14c libceph: bound get_version reply decode to front len
    7d03e08b763fd ceph: fix writeback_count leak in write_folio_nounlock()
    a7c2dfa610a12 ceph: fix refcount leak in ceph_readdir()
    a4228b93706fb ceph: fix pre-auth out-of-bounds read on snaptrace in ceph_handle_caps()
    3bf0e349cbb4f sctp: close UDP tunnel sockets during netns teardown
    be6aae9d1b91c sctp: avoid auth_enable sysctl UAF during netns teardown
    85aca407c560a sctp: don't free the ASCONF's own transport in DEL-IP processing
    3db217a4c2bdc mm/huge_memory: set PG_has_hwpoisoned only after new folio head is established
    ac7a6f61f56fe mm/kmemleak: fix checksum computation for per-cpu objects
    f2b2933599241 afs: Fix afs_edit_dir_remove() to get, not find, block 0
    d64f6c02495f3 mptcp: pm: userspace: fix use-after-free in get_local_id
    6cd3c3d631555 mptcp: only set DATA_FIN when a mapping is present
    6c936b5ad557e mptcp: decrement subflows counter on failed passive join
    35c4b274d4cc4 Revert "arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates"
    64ab0964c7db9 arm64: syscall: Ensure saved x0 is kept in-sync with tracer updates
    9cd4b1a52eff3 arm64: make huge_ptep_get handled unaligned addresses
    9025946adec9a tracing/probes: Prevent out-of-bounds write in __trace_probe_log_err()
    3b3be8653c594 tracing/probes: Fix potential underflow in LEN_OR_ZERO macro
    949ac1aeb37b8 tracing/probes: Avoid temporary buffer truncation in trace_probe_match_command_args()
    6b5098d745811 tracing/eprobe: Fix exact system name matching in eprobe_dyn_event_match()
    b6a4575f22925 tracing: Fix union collision of module and refcnt for dynamic events
    cf5a82bef623b tracing: Fix resource leak on mmiotrace trace_pipe close
    8464427e1c177 tracing: Fix mmiotrace possible NULL dereferencing of hiter->dev
    1f2e7cd0ff976 tracing: Fix context switch counter truncation
    1da310b94504d misc: nsm: pin the module while the device is open
    8f068342096b0 misc: nsm: only unlock nsm_dev on post-lock error paths
    caba30eb8bd32 intel_th: fix MSC output device reference leak
    59dd34854202d mei: bus: access mei_device under device_lock on cleanup
    5118872357279 selftests: ntsync: correct CONFIG_NTSYNC name
    b2a3eeb57ba24 serial: 8250_mid: Fix NULL function pointer dereference on DNV/ICX-D/SNR platforms
    4fae473b856b4 serial: sc16is7xx: implement gpio get_direction() callback
    635be8b097f0c uio_hv_generic: Bind to FCopy device by default
    cf26dd2d84158 comedi: comedi_parport: deal with premature interrupt
    9bb71b59e0aa3 x86/boot/compressed: Disable jump tables
    4f2db41a09eba firmware: stratix10-svc: fix memory leaks and list corruption bugs
    3ff7c1dbf722c rhashtable: clear stale iter->p on table restart
    d43c5c0c93552 cdrom: fix stack out-of-bounds read in CDROMVOLCTRL
    4427a33faabb4 LoongArch: Retrieve CPU package ID from PPTT when available
    38b025fcdc45b LoongArch: Move jump_label_init() before parse_early_param()
    6ab0abb5a2e0c LoongArch: Fix oops during single-step debugging
    a94d6726ec868 LoongArch: Fix address space mismatch in kexec command line lookup
    c404b1f30b252 objtool/rust: add one more `noreturn` Rust function for Rust 1.99.0
    8ccfb3b315a0e rust: allow `clippy::unwrap_or_default` globally
    6db0c42c87c46 rust: time: fix as_micros_ceil() to round correctly for negative Delta
    12be1d75e9b29 rust_binder: only print failure if error has source
    cc3bbff10b1a7 platform/loongarch: laptop: Explicitly reset bl_powered state when suspend
    1cd4e9b7967da binfmt_misc: set have_execfd only once the interpreter is opened
    2bc6bf70d4105 exec: fix unsigned loop counter wrap in transfer_args_to_stack()
    780b04d09c941 Bluetooth: RFCOMM: Fix session UAF in set_termios
    a42f5536ea9c0 Bluetooth: hci_sync: Protect UUID list traversal
    91eff666c9078 staging: rtl8723bs: fix inverted HT40 secondary channel offset
    875479f18835a staging: rtl8723bs: fix OOB reads in rtw_get_wps_ie()
    0dbaff14fd6a8 wifi: ath11k: fix refcount leak in ath11k_ahb_fw_resources_init()
    efe9de178e4b9 wifi: brcmfmac: set F2 blocksize to 256 for BCM43752
    044fca8f45ba9 wifi: brcmfmac: make release_scratchbuffers idempotent
    9cb72f67e1502 wifi: mt76: mt7925: drop TXRX_NOTIFY on non-mmio buses
    263816e92e8d6 wifi: mt76: mt7921: drop TXRX_NOTIFY on non-mmio buses
    ab4d213393e84 wifi: mt76: mt7615: drop TXRX_NOTIFY on non-mmio buses
    e511e93abd6ee wifi: wilc1000: validate assoc response length before subtracting header
    9375a4ea41216 wifi: mwifiex: fix NULL dereference when the AP has HT-cap but no HT-oper
    18965470d41e6 wifi: ath6kl: fix use-after-free in aggr_reset_state()
    58c6c8dc2e022 wifi: ath6kl: fix OOB access from firmware ADDBA window size
    1395327a96614 ALSA: timer: don't re-enter an instance callback that is still running
    426c0ff1c433d ALSA: timer: drain a slave's callback before its master detaches it
    3bc4de57fc7d1 ALSA: hda: codecs: hdmi: disable keep-alive before audio format change
    6a10025c7fd09 ALSA: seq: close a re-opened queue timer in the destructor
    2ec8f95a08fed ALSA: hda/realtek: Fix speakers on Lunnen Ground 14
    4091b216d11b3 media: vpif_capture: fix OF node reference imbalance
    1349af7f87df5 media: vivid: fix cleanup bugs in vivid_init()
    492c97cb50fea media: vivid: check for vb2_is_busy() when toggling caps
    26e7a8ac286f3 media: vivid: add vivid_update_reduced_fps()
    3780ad3810718 media: vimc: fix reference leak on failed device registration
    86ece01fba2d5 media: vidtv: fix reference leak on failed device registration
    16ae8c166e787 media: verisilicon: Export only needed pixels formats
    b88c929188e3c media: vb2: use ssize_t for vb2_read/vb2_write
    072a883061a46 media: v4l2-subdev: Fail {enable,disable}_streams and s_streaming nicely
    cf9732fd6c4f2 media: v4l2-fwnode: Fix subdev owner overwritten in v4l2_async_register_subdev_sensor()
    3068ab802fc98 media: v4l2-ctrls: validate HEVC active reference counts
    836cfffb2ddbb media: v4l2-ctrls-request: add NULL check in v4l2_ctrl_request_complete()
    7e6521dd747ec media: ti: vpe: unwind v4l2 device registration on probe error
    127fc44e83256 media: tegra-video: vi: fix invalid u32 return value in format lookup
    118c2f5d1d363 media: synopsys: hdmirx: Fix HPD lane hold time
    b5184b3f0e9d4 media: sun4i-csi: Return queued buffers on start_streaming() failure
    931abe1deb65b media: stm32: dcmi: unregister notifier on probe failure
    ed342a86bb2f9 media: stm32-dcmipp: Return queued buffers on start_streaming() failure
    b7936e8cbec1b media: saa7134: Fix a possible memory leak in saa7134_video_init1
    a7a141e4e93c8 media: rzg2l-cru: Skip ICnMC configuration when ICnSVC is used
    894e83509c669 media: rtl2832_sdr: Return queued buffers on start_streaming() failure
    2c71bda6edc63 media: rtl2832: fix use-after-free in rtl2832_remove()
    64cb15878b35e media: radio-si476x: Unregister v4l2_device on probe failure
    a58d01a0ed397 media: qcom: camss: Fix RDI streaming for CSID GEN3
    c39a1d9fde82b media: qcom: camss: Fix RDI streaming for CSID GEN2
    4e451100b35ee media: qcom: camss: Fix RDI streaming for CSID 680
    cb16b79a2be2c media: pwc: Return queued buffers on start_streaming() failure
    9afd605dcd96c media: pwc: Drain fill_buf on start_streaming() failure
    08ddfd628a2db media: pci: dm1105: Free allocated workqueue
    4e077bcb5e1f6 media: nxp: imx8-isi: Fix scale factor calculation for hardware rounding
    28ae75dba701d media: nxp: imx8-isi: Fix potential out-of-bounds issues
    659a7cea0be80 media: nxp: imx8-isi: Fix missing v4l2_subdev_cleanup() in pipe init error path
    4702afbd56f1d media: nxp: imx8-isi: Clean up already-initialized pipes on probe failure
    9e61258fbc3cf media: nxp: imx8-isi: Add missing v4l2_subdev_cleanup() in crossbar and pipe
    181a0aeefd56f media: nuvoton: npcm-video: fix memory leaks in probe and remove
    2147acb948a94 media: nuvoton: npcm-video: fix error handling in npcm_video_init()
    264b5380c4f8a media: msi2500: Return queued buffers on start_streaming() failure
    1391b75bf0119 media: meson: vdec: Fix memory leak in error path of vdec_open
    18e3b838e09d7 media: marvell-cam: fix missing pci_disable_device() on remove
    cf48e9db85652 media: iris: Fix use IRQF_NO_AUTOEN when requesting the IRQ
    d56044558a757 media: intel/ipu6: Improve DWC PHY HSFREQRANGE band selection for overlapping ranges
    00a98fb2a6fb2 media: imx219: Fix maximum frame length in lines
    7337c88205ed0 media: i2c: alvium: fix critical pointer access in alvium_ctrl_init
    c68c4ce72feb6 media: cx23885: add ioremap return check and cleanup
    f468b7ee5d633 media: cx231xx: fix devres lifetime
    f24ca8b53fe15 media: chips-media: wave5: Move src_buf Removal to finish_encode
    9924cb548ee77 media: cedrus: skip invalid H.264 reference list entries
    000e51afb6068 media: cedrus: Fix missing cleanup in error path
    73504935e4365 media: cedrus: clean up media device on probe failure
    6efe665356ec8 media: cec: seco: unregister adapter on IR probe failure
    0459a4304cff8 media: aspeed: fix missing of_reserved_mem_device_release() on probe failure
    391fe3e36e59f media: amlogic-c3: Add validations for ae and awb config
    73bd277986537 media: airspy: Return queued buffers on start_streaming() failure
    a096a6aba6011 drm/v3d: Reach the GMP through the hub registers on V3D 7.x
    a2212fef8e187 drm/gpusvm: Fix MM reference leak in drm_gpusvm_range_evict
    6deaa31720185 drm/vc4: Prevent shader BO mappings from becoming writable
    b1379f0c42b88 drm/vmwgfx: Validate vmw_surface_metadata::array_size
    2b85e19792be4 drm/amd/display: Fix missing DCE check in dm_gpureset_toggle_interrupts()
    a38f2724eb93a drm/vc4: Shut down BO cache timer before teardown
    ee44ea4f7e309 drm/amd/display: Fix flip-done timeouts on mode1 reset
    ba7b6444097a7 drm/amdgpu: fix bo->pin leaking in amdgpu_bo_create_reserved
    fd2de80f28a07 drm/amdgpu: Disable PCIe dynamic speed switching on Ryzen Pinnacle Ridge
    490ceacd2162d drm/amd/display: Fix backlight max_brightness to match exported range
    9c0432044d34b drm/amd/display: Force PWM backlight on Lenovo Legion 5 15ARH05
    51ea665c30c42 drm/amd/display: dce100: skip non-DP stream encoders for DP MST
    0b9fa4272e24b drm/amd/display: consolidate DCN vblank/flip handling onto vupdate_no_lock
    679f23f0a3606 drm/amd/display: set new_stream to NULL after release
    123692ebc1ea7 drm/amd/pm/ci: Don't disable MCLK DPM on Bonaire 0x6658 (R7 260X)
    d8dc3a9e815d6 drm/amdgpu: Fix VFCT bus number matching with soft filter
    312278b309191 drm/amdgpu: Release VFCT ACPI table reference
    e64b2f1e826af drm/panthor: return error on truncated firmware
    22aa7fb4e7d0b drm/ttm: Account for NULL and handle pages in ttm_pool_backup
    b2d8b66c67393 drm/virtio: Don't detach GEM from a non-created context
    a4a1866d50c49 drm/gfx10: Program DB_RING_CONTROL
    e163c5a0946de drm/amd/pm: fix smu14 power limit range calculation
    e3bcd3bf7eeca drm/i915/mst: limit DP MST ESI service loop
    726f27bca93e6 drm/i915/gem: Fix NULL deref in I915_CONTEXT_PARAM_SSEU
    37951ce1567cc drm/i915/gem: Do not leak siblings[] on proto context error
    1173190412fb9 drm/amdgpu: fix lifetime issue of amdgpu_vm_get_task_info_pasid()
    5df5a59c32b46 drm/amd/amdgpu: disable ASPM on VI if pcie dpm is disabled
    8b2da44446f9d drm/i915/bios: range check LFP Data Block panel_type2
    cbec6a57959ab drm/i915: Return NULL on error in active_instance
    d20b5c139b290 drm/amdgpu/sdma5.0: replace BUG_ON() with WARN_ON()
    09da54636bac1 drm/amdgpu/sdma5.2: replace BUG_ON() with WARN_ON()
    51fd520871651 drm/amdgpu/sdma6.0: replace BUG_ON() with WARN_ON()
    4c09483325360 drm/amdgpu/sdma7.0: replace BUG_ON() with WARN_ON()
    3d2ef8d389495 drm/i915/hdcp: check streams[] bounds before overflow
    1f876bd8adc79 drm/i915/hdcp: require monotonically increasing seq_num_v
    35be0e2c6862a drm/virtio: bound EDID block reads to the response buffer
    4ee77643e6194 drm/amd/display: detect_link_and_local_sink: DP alt mode timeout path leaks prev_sink reference
    8a77ccf9cb992 drm/amd/display: Handle struct drm_plane_state.ignore_damage_clips
    abce3276c57e3 drm/amdkfd: fix 32-bit overflow in CWSR total size calculation
    fd1691ec62701 drm/amdkfd: Check bounds on CRIU restore queue type and mqd size
    50319efb865f7 drm/amdkfd: Check bounds in allocate_event_notification_slot
    14a631dca9df0 drm/amdkfd: Use kvcalloc to allocate arrays
    6253bb56bb2eb drm/imagination: acquire vm_ctx->lock before mapping memory to GPU VM
    c45fafa69fe3f drm/imagination: fix error checking of pvr_vm_context_lookup()
    b983a35dad370 drm/imagination: Fix user array stride in pvr_set_uobj_array()
    c88fdbf3da26e drm/imagination: Fix double call to drm_sched_entity_fini()
    c1954c66662de drm/xe: Hold a dma-buf reference for imported BOs
    038d0b80ab778 drm/xe: Fix PTE index in xe_vm_populate_pgtable() for chunked binds
    90a8a938e0cae drm/xe: Return error on non-migratable faults requiring devmem
    3e1f909556aa6 drm/radeon: fix r100_copy_blit for large BOs
    fbb9effc81683 drm/nouveau/acr: fix missing nvkm_done() in error path of nvkm_acr_oneinit()
    45db277b2e1e3 drm/i915/gem: Add missing nospec on parallel submit slot
    748d425e53c31 drm/displayid: fix Tiled Display Topology ID size
    5452eb5c16630 drm/sysfb: Return errno code from drm_sysfb_get_visible_size()
    154795885e8f0 drm/sysfb: Avoid possible truncation with calculating visible size
    4e109faa9ea2b drm/nouveau: fix reversed error cleanup order in ucopy functions
    315d2e5741a81 drm/amdgpu: validate CP_GFX_SHADOW chunk size in CS pass1
    3fb10ec43c25a drm/amdgpu: Fix amdgpu_bo_move() when old_mem and new_mem are both GTT
    9c2b01508831b drm/amdgpu/gfx9: Fix Ring and IB test fail after mode2
    f835eda74cf65 drm/sysfb: Avoid truncating maximum stride
    7daefc6d51952 drm/sysfb: Do not page-align visible size of the framebuffer
    ddba17b3dfa0e drm/amdgpu: check amdgpu_vm_bo_find() result in GET_MAPPING_INFO
    d068a2f53afc8 drm/amdgpu/uvd: Place VCPU BO only in VRAM for UVD 4.x and older
    b3a01cda0ae16 drm/amdgpu/uvd: Fix forcing MSG, FB BOs into VCPU segment when it isn't at 0 (v2)
    e28420e36542a drm/amdgpu/gfx: fix cleaner shader IB buffer overflow
    d5c70523cafa2 drm/dp/mst: fix OOB reads on 2-byte fields in sideband reply parsers
    e2c29d51c0f65 drm/imagination: Fit paired fragment job in the correct CCCB
    1e5827839ad0c drm/dp/mst: fix buffer overflows in sideband chunk accumulation
    533d9e2bede4a drm/dp/mst: fix OOB reads in remote DPCD/I2C sideband reply parsers
    c0384d6872f4d drm/bridge: cdns-dsi: Replace deprecated UNIVERSAL_DEV_PM_OPS()
    943fa73ea0efa drm/imagination: Count paired job fence as dependency in prepare_job()
    6ab29a8683572 drm/rockchip: analogix_dp: Add missing error check for platform_get_resource()
    50cd8a7e98dd2 drm/rockchip: cdn-dp: add missing check in cdn_dp_config_video()
    86ab4d93b3d47 drm/tidss: Fix missing drm_bridge_add() call
    300a2d970a535 drm: renesas: rzg2l_mipi_dsi: Move rzg2l_mipi_dsi_set_display_timing()
    aa8ad3e0d1fe9 drm: renesas: rzg2l_mipi_dsi: Increase reset deassertion delay
    786d690257ec7 bpf, sockmap: Fix cork use-after-free in tcp_bpf_sendmsg()
    3a924139cf526 net: airoha: fix ETS channel derivation in airoha_tc_setup_qdisc_ets()
    391a23c503856 mctp: check register_netdevice_notifier() error in mctp_device_init()
    74ecebfbf1555 ptp: netc: explicitly clear TMR_OFF during initialization
    16df2d154ec82 rds: tcp: unregister sysctl before tearing down listen socket
    1db34097998cc ipv6: Change allocation flags to match rcu_read_lock section requirements
    684d4d0bda95a ice: prevent tstamp ring allocation for non-PF VSI types
    a32604e8d9e2c ice: fix LAG recipe to profile association
    3a81345467674 ice: allow creating VFs when !CONFIG_ICE_SWITCHDEV
    5d54d603cf3e9 net: ipv6: fix dif and sdif mismatch in raw6_icmp_error
    e60e6009d3bae octeontx2-pf: tc: fix egress ratelimiting
    d612754a515cb net/mlx5e: Reject unsupported CB Shaper TSA in ETS validation
    a7e430349fc5e net/mlx5e: Report zero bandwidth for non-ETS traffic classes
    cdddc8188db46 net/mlx5: E-Switch, fix zero num_dest in prio_tag egress vlan rule
    87b39a8c875ca net/mlx5: Fix MCIA register buffer overflow on 32 dword reads
    5f2ef3d53d374 net/mlx5: Refactor EEPROM query error handling to return status separately
    953d47cfe529a raw: annotate lockless match fields in raw_v4_match()
    8150c48fb978e net: qrtr: restrict socket creation to the initial network namespace
    0d57d43d7c4c6 hinic: remove unused ethtool RSS user configuration buffers
    8fc45a2a7cc24 ppp: annotate data races in ppp_generic
    19fe119dfa93f ipv4: icmp: fill flow parameters in icmp_route_lookup decoy lookup
    e037a41938c69 octeontx2-vf: set TC flower flag on MCAM entry allocation
    15a1c5f2ed2ee net: gre: fix lltx regression for GRE tunnels with SEQ/CSUM
    55515c1b1285a net: stmmac: enable the MAC on link up for all supported speeds
    1bcb737fb884d net: stmmac: reset residual action in L3L4 filters on delete
    370dde2b70e58 net: stmmac: fix l3l4 filter rejecting unsupported offload requests
    55d2a8d184e24 net: stmmac: xgmac: fix l4 filter port overwrite on register update
    40413da850363 net: stmmac: cores: remove many xxx_SHIFT definitions
    4a3eea468a041 net: stmmac: socfpga: Add hardware supported cross-timestamp
    01d45e6b2c500 net: stmmac: socfpga: Enable TBS support for Agilex5
    dac8c2ab943a2 net: stmmac: socfpga: Agilex5 EMAC platform configuration
    d67136a931e5f net: stmmac: remove xstats.pcs_* members
    9f27c4f0ae35b bpf: tcp: fix double sock release on batch realloc
    b43bb9ab60035 drm/tests: shmem: Set DMA mask to 64-bit in drm_gem_shmem
    1b8fb5a20508b tipc: fix u16 MTU truncation in media and bearer MTU validation
    c8e4b2a567efb iomap: correct the range of a partial dirty clear
    279339aa8bdcf drm/xe/vm: Fix SVM leak on resv obj alloc failure in xe_vm_create()
    d18d9b2c29a12 drm/xe/i2c: Allow per domain unique id
    4fdb0f162ccdb vmxnet3: fix BUG_ON in vmxnet3_get_hdr_len() for Geneve packets
    18957373920ca sctp: auth: verify auth requirement when auth_chunk is NULL
    ae0ec759865e0 net: dpaa: fix mode setting
    b5ded444621b6 net: hsr: fix memory leak on slave unregistration by removing synced VLANs
    17bb59682b8e6 net: bridge: vlan: fix vlan range dumps starting with pvid
    0a347ca1d6a2e amt: make the head writable before rewriting the L2 header
    ca0e8b661957f amt: re-read skb header pointers after every pull
    9ec22c8113d8c ovl: check access to copy_file_range source with src mounter creds
    31f5f7c959c3e ovl: port ovl_copyfile() to cred guard
    cde234a493f6d ovl: add override_creds cleanup guard extension for overlayfs
    35f0b504394e0 cred: add scoped_with_kernel_creds()
    3139b806923b1 drm/panel: s6e3ha8: fix unmet dependency on DRM_DISPLAY_HELPER
    790da254031cc ovl: fix trusted xattr escape prefix matching
    00ebbf030d8c4 wifi: brcmfmac: fix 802.1X-SHA256 call trace warning
    d5628f39fccc1 wifi: mt76: mt7996: fix possible NULL-pointer deref in mt7996_mcu_sta_bfer_eht()
    95b0cf02731c7 wifi: mt76: mt7925: fix crash in reset link replay
    d14238523ca4c wifi: mt76: mt7996: check pointer returned by mt76_connac_get_he_phy_cap()
    313343ab8cab7 wifi: mt76: mt7925: fix possible NULL-pointer deref in mt7925_mcu_bss_he_tlv()
    c058786b09cfa wifi: mt76: connac: fix possible NULL-pointer deref in mt76_connac_mcu_uni_bss_he_tlv()
    871549814eb4d wifi: mt76: mt7915: guard HE capability lookups
    f1ee53e08fdd2 wifi: mt76: mt7925: guard link STA in decap offload
    cc4d2f8b984c2 ppp: annotate concurrent dev->stats accesses
    b52ff80948d1c ppp: don't store tx skb in the fastpath
    cb9d3e0b55699 ppp: enable TX scatter-gather
    e740e90ca8e7f tipc: fix infinite loop in __tipc_nl_compat_dumpit
    d536bf205c71f nexthop: initialize extack in nh_res_bucket_migrate()
    961e9b1e33445 gtp: check skb_pull_data() return in gtp1u_send_echo_resp()
    023c5e0d0294a selftests: drv-net: increase timeout
    fa065685c8a91 selftests: ovpn: increase timeout
    e2b3d426c7ee5 selftests: ovpn: add IPV6 and VETH configs
    69eab5c4d9aa6 selftests: openvswitch: add config file
    340c389fd3d5d selftests: af_unix: add USER_NS config
    fbd91910c5025 tls: device: push pending open record on splice EOF
    a8bd8c109da5a net: mctp i3c: clean up notifier and buses if driver register fails
    1a10fe1aa9c01 sctp: validate stream count in sctp_process_strreset_inreq()
    c984a4184f810 pds_core: check for workqueue allocation failure
    cf0ed2ba202f5 pds_core: fix auxiliary device add/del races
    0e87fe52b560f pds_core: order completion reads after the ownership check
    3a831f40e88d3 pds_core: yield the CPU while waiting for the adminq to drain
    9e0f80fac50ab pds_core: fix use-after-free on workqueue during remove
    19ef775c91c6b pds_core: fix deadlock between reset thread and remove
    11092d79eb2b7 sctp: fix auth_chunk_list capacity check in sctp_auth_ep_add_chunkid
    2d34421bfa261 net: txgbe: fix FDIR filter leak on remove
    245bfe72a5ad4 net: Call net_enable_timestamp() before failure in sk_clone().
    4122792923312 soreuseport: Clear sk_reuseport_cb before failure in sk_clone().
    f97d199287689 amd-xgbe: fix MAC_AUTO_SW handling in CL37 AN
    e695cb9becbbb arm64: Correct value returned by ESR_ELx_FSC_ADDRSZ_nL()
    f5b8b8ccf9a4a pds_core: reject component parameter in legacy firmware update
    b5fcd1da05622 wifi: mac80211: recalculate TIM when a station enters power save
    d06fea9b85f03 iommu/intel: Fix out-of-bounds memset in dmar_latency_disable()
    e5ebe8544df1a iommu/amd: Bound the early ACPI HID map
    d21464d93f8ba wifi: mwifiex: bound uAP association event IEs to the event buffer
    a0980682d84d2 vhost-net: fix TX stall when vhost owns virtio-net header
    59cbe6cfa0fa2 wan: wanxl: Only reset hardware after BAR mapping
    3b1d4fc3b73ea nfp: Check resource mutex allocation
    0f7eaeb950adb wifi: mac80211: tear down new links on vif update error path
    d053eb7e09e10 iommu/amd: Wait for completion instead of returning early in iommu_completion_wait()
    76fc5604308a1 net: airoha: Fix DMA direction for NPU mailbox buffer
    f112df0744e2d dpaa2-eth: put MAC endpoint device on disconnect
    46e3bed4b0710 net: airoha: Fix potential use-after-free in airoha_ppe_deinit()
    26ac2d3602347 dpaa2-switch: put MAC endpoint device on disconnect
    c9165e199f569 rxrpc: fix io_thread race in rxrpc_wake_up_io_thread()
    b78547914bee5 gtp: parse extension headers before reading inner protocol
    9591042533140 rds: drop incoming messages that cross network namespace boundaries
    992dce02bdabb bonding: fix devconf_all NULL dereference when IPv6 is disabled
    1bc55c29cd858 net/packet: avoid fanout hook re-registration after unregister
    9f4f75df77c89 netlink: specs: rt-link: convert bridge port flag attributes to u8
    4264dbc84ca0a net: phy: marvell: fix return code
    8881daaafadbe Bluetooth: btusb: validate Realtek vendor event length
    9d208de7a8f64 regulator: mt6358: use regmap helper to read fixed LDO calibration
    538d862cc0dbd hwmon: occ: validate poll response sensor blocks
    2f0f661998941 ovpn: use monotonic clock for peer keepalive timeouts
    5b96227c0e8b2 ovpn: fix use after free in unlock_ovpn()
    47cd68e050a63 selftests/net: ovpn: fix getaddrinfo memory leak in ovpn_parse_remote()
    c5bf6b39be235 ovpn: avoid putting unrelated P2P peer on socket release
    2fdd6d196c656 smb: client: validate DFS referral PathConsumed
    d6959dd79088a hwmon: (asus-ec-sensors) add missed handle for ENOMEM
    dd6f730be95b5 hwmon: (asus-ec-sensors) fix EC read intervals
    22e449c1dd543 hwmon: (asus-ec-sensors) fix looping over banks while reading from EC
    d5913f97b5b60 drivers/virt: pkvm: Fix end calculation in mmio_guard_ioremap_hook()
    d0a57f19fe286 usb: atm: ueagle-atm: reject descriptors that confuse probe and disconnect
    2d5dec517b539 wifi: iwlwifi: mvm: fix read in wake packet notification handler
    eae7fdf7d4469 wifi: iwlwifi: validate payload length in iwl_pnvm_complete_fn
    70a6de303c9b3 wifi: iwlwifi: fix pointer arithmetic in iwl_add_mcc_to_tas_block_list
    a076b0c457c71 wifi: iwlwifi: mvm: validate SAR GEO response payload size
    cdf895bfd8035 ASoC: cs35l56: Use complete_all() to signal init_completion
    3c26e8bb14cc6 ASoC: cs35l56: Fix potential probe() deadlock
    1ddb3e0e502a1 ASoC: cs35l56: Don't use devres to unregister component
    9153fa1ee99bf ASoC: bt-sco: fix duplicate DAPM widget names for wideband DAI
    08433c71f1598 ALSA: hda: cs35l41: validate and free ACPI mute object
    eca9fcf9f5d89 ASoC: sun4i-codec: Set quirks.playback_only for H616 codec
    41ae2b7d37c3d ASoC: tas2781: bound firmware description string parsing
    797dc567146c7 btrfs: free mapping node on duplicate reloc root insert
    9304713b70e7e btrfs: don't propagate EXTENT_FLAG_LOGGING to split extent maps
    39f196f64bd38 btrfs: fix u32 to s64 type conversion in dirty_metadata_bytes accounting
    f49ff44831d52 btrfs: declare btrfs_ioctl_search_args_v2::buf as __u8
    4503829843353 wifi: carl9170: fix buffer overflow in rx_stream failover path
    fab6ff91d5b8c wifi: carl9170: fix OOB read from off-by-two in TX status handler
    9aee949c68dc6 wifi: carl9170: bound memcpy length in cmd callback to prevent OOB read
    33b5342d20806 wifi: ath6kl: fix OOB read from firmware IE lengths in connect event
    eb636fbc44314 wifi: ath6kl: fix OOB read from firmware num_msg in TX complete handler
    0177e578d7a88 firewire: net: Fix fragmented datagram reassembly
    51516fda914cc wifi: ath12k: Flush the posted write after writing to PCIE_SOC_GLOBAL_RESET
    9a9b0ea72d8b9 wifi: ath11k: Flush the posted write after writing to PCIE_SOC_GLOBAL_RESET
    a154ca3c441a6 wifi: ath11k: fix potential buffer underflow in ath11k_hal_rx_msdu_list_get()
    8681e5addf717 watchdog: airoha: Prevent division by zero when clock frequency is zero
    7d1658b066de3 watchdog: pretimeout: Fix UAF in watchdog_unregister_governor()
    305c23993e43d hwmon: (nzxt-kraken3) Stop device IO before calling hid_hw_stop
    205cff797a947 hwmon: (nzxt-smart2) Stop device IO before calling hid_hw_stop
    f36e12cc8cfe9 hwmon: (gigabyte_waterforce) Stop device IO before calling hid_hw_stop
    56d2deb644837 hwmon: (corsair-cpro) Stop device IO before calling hid_hw_stop
    ec477af3a7e8d hwmon: (corsair-psu) Stop device IO before calling hid_hw_stop
    e5394605f9a98 wifi: ath11k: fix NULL pointer dereference in ath11k_hal_srng_access_begin
    48a69cedde738 wifi: ath9k: hif_usb: don't dereference hif_dev after re-arming firmware request
    593072aae7fc8 selftests/bpf: Keep verifier_map_ptr exercising ops pointer access
    938bcf99f53e8 selftests/bpf: Adjust verifier_map_ptr for the map's excl field
    fe7892d46921e usb: xhci-pci: Limit VIA VL805 DMA addressing to 36 bits
    958624d638603 Revert "drm/amd/display: Add missing kdoc for ALLM parameters"
    03eb7a8099474 RISC-V: KVM: Serialize virtual interrupt pending state updates
    731acda5ba777 wifi: mwifiex: fix freeze for 60 seconds caused by request_firmware
    0905b3ce1deb7 usb: typec: ucsi: Add duplicate detection to nvidia registration path
    fe8cde072293c usb: typec: ucsi: Detect and skip duplicate altmodes from buggy firmware
    67d2626827e3c USB: serial: option: add TDTECH MT5710-CN
    601f75671b8fb USB: serial: keyspan_pda: fix data loss on receive throttling
    cbe00048b69d6 USB: serial: io_edgeport: cap received transmit credits
    c1611c6744e3a USB: serial: ftdi_sio: add support for E+H FXA291
    1f03658f3e9b2 usb: gadget: uvc: clamp SEND_RESPONSE length to the response buffer
    dcf3e2f164435 usb: gadget: udc: bdc: free IRQ and drain func_wake_notify before teardown
    40c706a0224bd usb: gadget: f_ncm: validate datagram bounds in ncm_unwrap_ntb()
    12b3edca90d4d USB: gadget: fsl-udc: fix dev_printk() device
    66956a5a4258c USB: gadget: fsl-udc: fix device name leak on probe failure
    e5ecfb7767526 USB: gadget: snps-udc: fix device name leak on probe failure
    4cde0b38cc0cb usb: gadget: printer: fix infinite loop in printer_read()
    f45089eaad0a0 usb: gadget: f_midi: cancel pending IN work before freeing the midi object
    e239ea91b4818 usb: gadget: dummy_hcd: prevent fifo_req reuse during giveback
    ace1a0adfc786 usb: chipidea: fix usage_count leak when autosuspend_delay is negative
    8eca14198c202 USB: storage: add NO_ATA_1X quirk for Longmai USB Key
    0950ac52426b0 usb: musb: omap2430: Do not put borrowed of_node in probe
    7714fb896ed30 usb: core: port: Deattach Type-C connector on component unbind
    fb1b50ab69921 wifi: at76c50x-usb: avoid length underflow in at76_guess_freq()
    217774e143d7b usb: core: sysfs: add lock to bos_descriptors_read()
    5f6e7b32bd1fb mpls: fix NULL deref in mpls_valid_fib_dump_req() on CONFIG_INET=n
    a8d20ba0ab518 sctp: fix auth_hmacs array size in struct sctp_cookie
    fed1b1ddab41a net/sched: act_tunnel_key: Defer dst_release to RCU callback
    51c2fcc4cd2e4 dpll: fix NULL pointer dereference in dpll_msg_add_pin_ref_sync()
    e666af5dcc905 tcp: fix TIME_WAIT socket reference leak on PSP policy failure
    6875ee2bef48f accel/amdxdna: Fix use-after-free of mm_struct in job scheduler
    f6b522033bc83 drm/i915/selftests: Fix GT PM sort comparators
    c23abdb922c39 drm/i915/wm: clear the plane ddb_y entries on plane disable
    f0e337e7db67c ksmbd: validate compound request size before reading StructureSize2
    6ecb252efa0b4 ksmbd: pin conn during async oplock break notification
    5e5f298d0af64 drm/xe/wopcm: fix WOPCM size for LNL+
    35ba43b541117 drm/xe/vf: Fix VF CCS attach/detach race with in-flight BO moves
    c1b19d8556265 drm/xe/vf: Shadow buffer management for CCS read/write operations
    bf293b5bcff41 drm/xe/sa: Shadow buffer support in the sub-allocator pool
    65129a03a8018 drm/xe: Allow the caller to pass guc_buf_cache size
    cfb66ad4aa8e5 can: j1939: fix lockless local-destination check
    3f398d45f3c75 riscv: hwprobe: Avoid uninitialized read in hwprobe_get_cpus()
    1d9a2f01b3c4e s390/checksum: Fix csum_partial() without vector facility
    5b06cf93341fe drm/panthor: Check debugfs GEM lock initialization
    250474c69bc3f bpf, sockmap: Reject unhashed UDP sockets on sockmap update
    c3e61df6fabca powerpc/vtime: Initialize starttime at boot for native accounting
    5c3a1cede86fd powerpc/time: Prepare to stop elapsing in dynticks-idle
    c1bbd0a6906b8 powerpc/85xx: Add fsl,ifc to common device ids
    00ba4bf879824 can: raw: add locking for raw flags bitfield
    479425744b219 drm/i915/gt: use correct selftest config symbol
    7e08ab7a061b1 smb/client: handle overlapping allocated ranges in fallocate
    cefb44c367b2b Bluetooth: hci_qca: Clear memdump state on invalid dump size
    d5b3b484b62bb Bluetooth: mgmt: hold reference for hci_conn in mgmt_pending_cmds
    ca58ad287bfc5 Bluetooth: mgmt: fix locking in unpair_device/disconnect_sync
    83b7e67698d0b Bluetooth: hci_sync: extend conn_hash lookup critical sections
    57059ff14d81d Bluetooth: MGMT: revalidate LOAD_CONN_PARAM queued update
    a087ed960fce5 Bluetooth: qca: fix NVM tag length underflow in TLV parser
    f4e23e661a259 ALSA: usb-audio: Skip DSD quirk for Musical Fidelity M6s DAC
    b133f007ba02c accel/ivpu: Fix wrong register read in LNL failure diagnostics
    1842d45f461a7 ata: sata_dwc_460ex: fix infinite loop in NCQ tag completion bit-scanning
    d28920db56960 ata: sata_dwc_460ex: fix clear_interrupt_bit() clearing all pending interrupts
    678d874e6ae11 ata: sata_dwc_460ex: use platform_get_irq()
    daa80b422ed92 ata: sata_dwc_460ex: enable SATA interrupts only after IRQ handler is registered
    c7a1509123720 scsi: core: wake eh reliably when using scsi_schedule_eh
    2c77ed279c4bb udmabuf: Ensure to perform cache synchronisation in begin_cpu_udmabuf()
    c75a950e77356 net/iucv: take a reference on the socket found in afiucv_hs_rcv()
    cb8be318b4432 ipv4: fib: free fib_alias with kfree_rcu() on insert error path
    c9574b8a8edeb ppp: defer channel free to an RCU grace period to fix pppol2tp RX UAF
    88f87cb4b52ed cpufreq: Make cpufreq_update_pressure() fall back to cpuinfo.max_freq
    640a33e77f91b firmware: arm_scmi: Rate-limit queue-full warnings in IRQ context
    fb343716fad46 ASoC: tas2562: fix deprecated 'shut-down' GPIO always cleared after lookup
    7f2cb99eaf53c ASoC: cs42l43: Correct report for forced microphone jack
    9f393d8160435 ASoC: amd: ps: replace bitwise OR with logical OR in IRQ return check
    3b2d32f528152 ASoC: amd: ps: fix wrong ACP version string in pci_request_regions()
    f33ad19e3e3d6 ASoC: amd: ps: disable MSI on resume in ACP PCI driver
    4801f6690f984 ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
    b39b08e6bee81 firmware: arm_ffa: Fix Endpoint Memory Access Descriptor offset calculation
    cf5708c9d78c9 firmware: arm_ffa: Fix out-of-bound writes in ffa_setup_and_transmit()
    11ac7a5e75f51 wifi: cfg80211: bound element ID read when checking non-inheritance
    5c342437ea44b wifi: brcmfmac: initialize SDIO data work before cleanup
    a424985c3ef2a wifi: mac80211: free AP_VLAN bc_buf SKBs outside IRQ lock
    44eda4a8d1dcd wifi: mac80211: avoid non-S1G AID fallback for S1G assoc
    fbaa8c31ef940 wifi: cfg80211: reject unsupported PMSR FTM location requests
    cfbda103aeae6 wifi: cfg80211: validate PMSR FTM preamble range
    0caf6416bfbb3 wifi: cfg80211: validate PMSR measurement type data
    0b6efde0ed970 wifi: nl80211: constrain MBSSID TX link ID range
    f8c547e543e12 wifi: nl80211: validate nested MBSSID IE blobs
    f649dc9c5e657 wifi: cfg80211: derive S1G beacon TSF from S1G fields
    fb052a6e2fa86 wifi: nl80211: free RNR data on MBSSID mismatch
    133684982dd0c wifi: cfg80211: convert pmsr_free_wk to wiphy_work to fix deadlock
    d38f5d868a0a4 wifi: p54: validate RX frame length in p54_rx_eeprom_readback()
    2aa1789880fa5 wifi: mac80211: defer link RX stats percpu free to RCU
    6cda91bbb8dc3 wifi: libertas: fix memory leak in helper_firmware_cb()
    5baaa1042f71d wifi: mac80211: fix fils_discovery double free on alloc failure
    d62b55b7c7dc6 wifi: mac80211: fix unsol_bcast_probe_resp double free on alloc failure
    6dc76371a9a36 wifi: mac80211_hwsim: clamp virtio RX length before skb_put
    e67dc2b8d5ac4 wifi: cfg80211: Fix an error handling path in cfg80211_wext_siwscan()
    f442e581a8893 wifi: ipw2100: fix potential memory leak in ipw2100_pci_init_one()
    9293574ac208d wifi: cfg80211: cancel sched scan results work on unregister
    7acc5ed2f3360 xfrm: policy: preallocate inexact bins before xfrm_hash_rebuild reinsert
    ff636d7b7cba6 xfrm6: clear dst.dev on error to avoid double netdev_put in xfrm6_fill_dst()
    d8aaf06b29f5a xfrm: iptfs: propagate SKBFL_SHARED_FRAG in iptfs_skb_add_frags()
    9845a35986a65 xfrm: clear mode callbacks after failed mode setup
    9e632a70f2044 RDMA/irdma: Prevent overflows in memory contiguity checks
    124382a2a9756 selftests/alsa: Fix memory leak in find_controls error path
    f98ae09c727dc mtd: fix double free and WARN_ON in add_mtd_device() error paths
    fcc9d50022bcd RDMA/siw: publish QP after initialization
    e221dde026af2 RDMA/hns: Fix potential integer overflow in mhop hem cleanup
    d842ef03d9145 RDMA/mana_ib: initialize err for empty send WR lists
    14e519f93a48c RDMA/erdma: initialize ret for empty receive WR lists
    ec675b4cdfd37 RDMA/irdma: Prevent user-triggered null deref on QP create
    1cd56258fe1a0 RDMA/irdma: Remove redundant legacy_mode checks
    ca1c29f05274b RDMA/irdma: Prevent rereg_mr for non-mem regions
    dbb945b80a3a4 RDMA/umem: Add pinned revocable dmabuf import interface
    c4ef25de94d73 RDMA/cma: Fix hardware address comparison length in netevent callback
    d7fc6f351c478 xfrm: reject optional IPTFS templates in outbound policies
    2907e9d0f05b5 sched_ext: Don't warn on core-sched forced idle in put_prev_task_scx()
    57acd51928333 sched/ext: Avoid null ptr traversal when ->put_prev_task() is called with NULL next
    996c5c19d5b5a firmware: arm_ffa: Fix NULL dereference in ffa_partition_info_get()
    8edc925251780 btrfs: fallback to transaction csum tree on a commit root csum miss
    a84ca16ce07e7 btrfs: use bool type for btrfs_path members used as booleans
    60a23d4ea169e btrfs: fix root leak if its reloc root is unexpected in merge_reloc_roots()
    5e1b2ca6b3493 btrfs: reject free space cache with more entries than pages
    0ac9c7d9ccfd7 mtd: nand: mtk-ecc: stop on ECC idle timeouts
    fdb53a9b26071 mtd: mtdswap: remove debugfs stats file on teardown
    98d2d468b4faa IB/mad: Drop unmatched RMPP responses before reassembly
    59114e0ff6e3a firmware: arm_ffa: Respect firmware advertised RX/TX buffer size limits
    33e1b0d25ca0d xfrm: fix stale skb->prev after async crypto steals a GSO segment
    eae16fbc7ce20 xfrm: propagate -EINPROGRESS from validate_xmit_xfrm()
    23bbb9eafec7a net: plumb drop reasons to __dev_queue_xmit()
    4cc4d6fb08e75 net: dropreason: add SKB_DROP_REASON_RECURSION_LIMIT
    4c22b4e3ff502 arm64: tegra: Fix CPU compatible string to cortex-a78ae on Tegra234
    0b9858484d096 arm64: tegra: Remove fallback compatible for GPCDMA
    903f2edc04770 fuse: fix writeback array overflow when max_pages is one
    afe9cda0862aa Input: ims-pcu - fix logic error in packet reset
    d03a740e087de Input: ims-pcu - fix heap-buffer-overflow in ims_pcu_process_data()
    6cbed4be9a6ca xprtrdma: Clear receive-side ownership pointers on release
    0892b427c4b8b crypto: tegra - Don't touch bo refcount in host1x bo pin/unpin
    5f4de3c717d34 gpu: host1x: Fix use-after-free in host1x_bo_clear_cached_mappings
    ec9f66c91bffd dmaengine: sh: rz-dmac: Move interrupt request after everything is set up
    eca8b44d51fc6 can: bcm: track a single source interface for ANYDEV timeout/throttle ops
    136de17f38630 can: bcm: fix data race on rx_stamp/rx_ifindex in bcm_rx_handler()
    6be3e1fedf03e can: bcm: fix stale rx/tx ops after device removal
    b024c21c9066f can: bcm: add missing device refcount for CAN filter removal
    deb6a697cce3f can: bcm: validate frame length in bcm_rx_setup() for RTR replies
    bd46f55dec608 can: bcm: extend bcm_tx_lock usage for data and timer updates
    8104bcdb2612f can: bcm: fix CAN frame rx/tx statistics
    19b1994069dd2 can: bcm: add locking when updating filter and timer values
    ec9daa8fd1b6f KVM: x86/mmu: Fix use-after-free on vendor module reload
    8001d2ce9d9bd KVM: nVMX: Hide shadow VMCS right after VMCLEAR
    dd50ad7935d57 KVM: x86: Only reset TSC Deadline Timer in apic_timer_expired on KVM_RUN
    f3477a6a4164f KVM: x86: Check for invalid/obsolete root *after* making MMU pages available
    865dfe76c150b seqlock: Allow UBSAN_ALIGNMENT to fail optimizing
    3958b1aeef43b seqlock: Allow KASAN to fail optimizing
    ec46baf830825 seqlock: Cure some more scoped_seqlock() optimization fails
    8e39ed92d7c5c fs/proc/task_mmu: fix make_uffd_wp_huge_pte() prot-update race
    89890a5fcefad drm/virtio: fix deadlock in display_info_cb by removing hotplug from dequeue worker
    f6410d18c1e2d netfilter: nf_tables: revert commit_mutex usage in reset path
    0c8a9022f4c56 netfilter: nft_quota: use atomic64_xchg for reset
    cd968dcdec6ae netfilter: nft_counter: serialize reset with spinlock
    55904f1a4689a selftests/bpf: Add tests for ld_{abs,ind} failure path in subprogs
    ce01a4e5cfac7 bpf: Fix ld_{abs,ind} failure path analysis in subprogs
    bffc0b27e457c platform/x86/intel-uncore-freq: Fix current_freq_khz after CPU hotplug

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 24905528a09e7a6b2df9cba342b5f9ba6b8bcf3e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index 37570538857..edb3696b25e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fa4de2c8b38ef83fd991db3b507630001104cac5"
-SRCREV_meta ?= "24949c3ef490d79a73a821f688efdc2f562fc851"
+SRCREV_machine ?= "f3301719a9aa0f6e52a9ef3f54f7339a4241f7b9"
+SRCREV_meta ?= "7f630b9b05e171d09925e2f0edd84697ff826f93"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.41"
+LINUX_VERSION ?= "6.18.43"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index 5addcaae07e..894267acdf1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.41"
+LINUX_VERSION ?= "6.18.43"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
-SRCREV_meta ?= "24949c3ef490d79a73a821f688efdc2f562fc851"
+SRCREV_machine ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
+SRCREV_meta ?= "7f630b9b05e171d09925e2f0edd84697ff826f93"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 3ceba003fa4..e510ff01aaf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "fbf752dfa74a5be78586014f82002bca11063fa8"
-SRCREV_machine:qemuarm64 ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
-SRCREV_machine:qemuloongarch64 ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
+SRCREV_machine:qemuarm ?= "6e4861d133214a07c0b2f3e6d8de190fa2734697"
+SRCREV_machine:qemuarm64 ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
+SRCREV_machine:qemuloongarch64 ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
-SRCREV_machine:qemuriscv64 ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
-SRCREV_machine:qemuriscv32 ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
-SRCREV_machine:qemux86 ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
-SRCREV_machine:qemux86-64 ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
+SRCREV_machine:qemuppc ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
+SRCREV_machine:qemuriscv64 ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
+SRCREV_machine:qemuriscv32 ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
+SRCREV_machine:qemux86 ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
+SRCREV_machine:qemux86-64 ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "06f4fd92efb65a6108294f43855ca32fe22cb96f"
-SRCREV_meta ?= "24949c3ef490d79a73a821f688efdc2f562fc851"
+SRCREV_machine ?= "73fd4709c133ba2ee6012cfb6a63eb908d1a5cc6"
+SRCREV_meta ?= "7f630b9b05e171d09925e2f0edd84697ff826f93"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "2fe596715f840d053aed5cee5455f701bdcd2b50"
+SRCREV_machine:class-devupstream ?= "7b923c78b50d2ec52690c4353e5aad8302e80599"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.41"
+LINUX_VERSION ?= "6.18.43"
 
 PV = "${LINUX_VERSION}+git"
 

