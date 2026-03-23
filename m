Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC3DF4611C
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:51:15 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17890.1774273867505173009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h2dezwe6;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50b351eaf81so26515961cf.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774273866; x=1774878666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjxKtY3vwrgeAyRq8meuwCtSHXWnHYhOUnM5VNL9Ac0=;
        b=h2dezwe6xJyaJdNdbR1aCuXBFUvETcJRwu16vBv9p2rAwfvpPVfCjW2uraGnLChvfU
         DvET4E9+yx65O9torf2NFE0f08cUyKg3BhxtGttgzQyttbsR+7CIiyhLV4D2zqtnZ+db
         W99sYzI+EHOMh5rgSEeQvoU0Vjc3Vy3s9obfQn6MNsMyF5h9+UQ1Upu2PI5YcCUQFyTJ
         a0FEK4pZdADAwQ7cD8LdrehDMuAli73Dpez2muIWX0s0rw+He+7wuqEKj2UdVBoSmVAM
         PX3+zL9ySRaTdG2ZbEQx27NfHNtG/I8QYfjr48vG880eVuS40BIWei8Ew4+UJpGVsCGS
         1wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774273866; x=1774878666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mjxKtY3vwrgeAyRq8meuwCtSHXWnHYhOUnM5VNL9Ac0=;
        b=axFNuMG7WtM0Oz/WcL24+268vlOJIeFDqA8PE6+sRE/SLgEQZkX+tgR2cQqOX4msiz
         GXwHNO1whLUtrNfyxFGuN7iXrMS/DhypomTQNROEx/CcrBpBoyh5pgQ853CctSPaXZVH
         teuxx1ktpl4C898vFDq5tOmiYig4erIEVpiIJkE1JcMX77323dbrIldPtcpnyIHKanQG
         uim1IY4IdrW50s1wytOhb9zwDcBLL2wE3jHIUMUmHykTKtqUXWVAoGmxYcMEpOjQThLz
         Hn3uR1Uy3UrOMAh5GQdVEzrFcvC4O0Q88ESOvfaqYB3ZlQyFbi6a9Dp+OaAd/UBqzkSs
         gduQ==
X-Gm-Message-State: AOJu0YwA99aaNXnshvBE9uHNnnt4N47pXyUyD8BpJ7GZqUyDTGL3/cN4
	6TFJoy4TeDgKjCJgQOfdgAsJl7sAYM4oqsd2ZpJJ1yc/pLQJOZK+PGi5A3WCsBua
X-Gm-Gg: ATEYQzz4Q6Tv9Cibpna6J7B/PKoPxAH2oiFvpM9JQaVcsx4Qrf/NUPFz+/TQjg59jls
	rz7M5k056YgavaP1QFVmtWCvNzb/HdpVahyjTTFYoyTtoJTIRz/ah7Ym0+DTp902bYeAttfYuRo
	gud/0bBIOv2o01Wy/TY+9TkNmGYDnJDGc8G4lLUQFjTCdrVcS9YxdhnxwuL2VgPBs34r9cfgUJq
	JPJ/h8kbsDNuB+Ayd7kvjU7UjRHx0Vxbq8fQTkXgat5tQs/o+/rih8EAmMC7sgBcDqdbi7h7SFo
	lCwkP2kY3eQzMbq6z4N/KDtQMXVhsfUOUeLLrPCcZEbOSxN1a/NVCakvgxPYuoT7QIbMNM8vNY1
	mnZ4o1ooMclH+PyqGJC0Sbn1/59/AI2ih+n0Ms24ctkKJ1Uxr9zTO6nQDOhkKBOZ78PTOoKsIrn
	suCe9hCgwmMmuWZaICJwAFqsHvEWnPPNZ3shGlh+o52Z42KiK/yei+NoKkCQiZv+8AXpEBzJeGx
	CMx6UtWoknzl4s6GA39Yfgvib/8naxjTC0ycr7HCV+yTuUwbcJxde1dfjc=
X-Received: by 2002:a05:622a:1baa:b0:50b:460b:650e with SMTP id d75a77b69052e-50b460b6d72mr147538871cf.49.1774273865822;
        Mon, 23 Mar 2026 06:51:05 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b664cddc3sm17232041cf.5.2026.03.23.06.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:51:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 05/11] linux-yocto/6.18: update to v6.18.18
Date: Mon, 23 Mar 2026 09:50:51 -0400
Message-ID: <20260323135057.1605923-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
References: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233724

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    3318f10fa289 Linux 6.18.18
    6c5e8f16b5e8 ata: libata: cancel pending work after clearing deferred_qc
    13bc2772414d apparmor: fix race between freeing data and fs accessing it
    af782cc8871e apparmor: fix race on rawdata dereference
    623a9d211bbb apparmor: fix differential encoding verification
    b60b3f7a35c4 apparmor: fix unprivileged local user can do privileged policy management
    7998ab3010d2 apparmor: Fix double free of ns_name in aa_replace_profiles()
    5a68e46dfe0c apparmor: fix missing bounds check on DEFAULT table in verify_dfa()
    0510d1ba0976 apparmor: fix side-effect bug in match_char() macro usage
    d42b2b6bb77c apparmor: fix: limit the number of levels of policy namespaces
    7eade846e013 apparmor: replace recursive profile removal with iterative approach
    4f0889f2df1a apparmor: fix memory leak in verify_header
    0baadb0eece2 apparmor: validate DFA start states are in bounds in unpack_pdb
    380ad8b7c65e net/sched: Only allow act_ct to bind to clsact/ingress qdiscs and shared blocks
    04d75529dc0f net/sched: act_gate: snapshot parameters with RCU on replace
    93ea7e1363fb Linux 6.18.17
    8a185304e42e selftests/bpf: Avoid simplification of crafted bounds test
    63b548c86299 bpf: collect only live registers in linked regs
    2ce8ece5a78d tracing: Add NULL pointer check to trigger_data_free()
    52decf013d53 selftest/arm64: Fix sve2p1_sigill() to hwcap test
    d15ba004b321 ata: libata-eh: Fix detection of deferred qc timeouts
    98cd8b4d0b83 xdp: produce a warning when calculated tailroom is negative
    45a41aecf5e5 net: enetc: use truesize as XDP RxQ info frag_size
    f1ac9d19721b i40e: use xdp.frame_sz as XDP RxQ info frag_size
    b6176646c36d i40e: fix registering XDP RxQ info
    ff7f356cdbb4 xsk: introduce helper to determine rxq->frag_size
    2a9e6ecf0e85 xdp: use modulo operation to calculate XDP frag tailroom
    cd888c396667 net/sched: act_ife: Fix metalist update behavior
    b3b5a037d520 net: ipv6: fix panic when IPv4 route references loopback IPv6 nexthop
    fbbd2118982c net: vxlan: fix nd_tbl NULL dereference when IPv6 is disabled
    33dec6f10777 net: bridge: fix nd_tbl NULL dereference when IPv6 is disabled
    d3b1c4c70da5 selftests/harness: order TEST_F and XFAIL_ADD constructors
    0168443a5db5 kselftest/harness: Use helper to avoid zero-size memset warning
    6f95b5952027 net: ethernet: mtk_eth_soc: Reset prog ptr to old_prog in case of error in mtk_xdp_setup()
    500a50a301ce netfilter: nft_set_pipapo: split gc into unlink and reclaim phase
    9154945a6394 netfilter: nf_tables: clone set on flush only
    6826131c7674 netfilter: nf_tables: unconditionally bump set->nelems before insertion
    6624d1727f3a net: Provide a PREEMPT_RT specific check for netdev_queue::_xmit_lock
    c3e8c75fcb2e block: use trylock to avoid lockdep circular dependency in sysfs
    6b0e35123ba4 net: stmmac: Defer VLAN HW configuration when interface is down
    15e8ef336895 net: stmmac: Fix VLAN HW state restore
    8b8b97eaecae net: stmmac: Improve double VLAN handling
    d55a39435c20 net: stmmac: Fix error handling in VLAN add and delete paths
    edc988613def nfc: rawsock: cancel tx_work before socket teardown
    b3fdbc7f59cd nfc: nci: clear NCI_DATA_EXCHANGE before calling completion callback
    91ff0d8c3464 nfc: nci: complete pending data exchange on device close
    9d448bbab724 nfc: nci: free skb on nci_transceive early error paths
    a77a5423e9c6 net: devmem: use READ_ONCE/WRITE_ONCE on binding->dev
    4596f44d4f5b net_sched: sch_fq: clear q->band_pkt_count[] in fq_reset()
    1c46edf20f82 net: nfc: nci: Fix zero-length proprietary notifications
    eae2f14ab2ef tcp: secure_seq: add back ports to TS offset
    8314944cc3bd net: sched: avoid qdisc_reset_all_tx_gt() vs dequeue race for lockless qdiscs
    d9d4ed40b3be hwmon: (max6639) fix inverted polarity
    de4ea10ae6b4 timekeeping: Fix timex status validation for auxiliary clocks
    5a501379a010 nvme: fix memory allocation in nvme_pr_read_keys()
    76f327fa4f1b nvme: reject invalid pr_read_keys() num_keys values
    05e3f01974d0 drm/xe/reg_sr: Fix leak on xa_store failure
    3c8852cff2bb drm/xe/gsc: Fix GSC proxy cleanup on early initialization failure
    1c72e7b0b442 i2c: i801: Revert "i2c: i801: replace acpi_lock with I2C bus lock"
    da09dfc90cb7 drm/sched: Fix kernel-doc warning for drm_sched_job_done()
    5649775b3ebf amd-xgbe: fix sleep while atomic on suspend/resume
    7e4ad34a8889 net: ipv4: fix ARM64 alignment fault in multipath hash seed
    0b5a78260207 ipv6: fix NULL pointer deref in ip6_rt_get_dev_rcu()
    5566a9eeb00e smb/client: fix buffer size for smb311_posix_qinfo in SMB311_posix_query_info()
    b751369b03c8 smb/client: fix buffer size for smb311_posix_qinfo in smb2_compound_op()
    3eeddb80191f bpf: Fix a UAF issue in bpf_trampoline_link_cgroup_shim
    ba47e3371764 igb: Fix trigger of incorrect irq in igb_xsk_wakeup
    2199e190cf6b iavf: fix netdev->max_mtu to respect actual hardware limit
    0138d1cdb19f libie: don't unroll if fwlog isn't supported
    b9333d41ee03 ice: fix adding AQ LLDP filter for VF
    1e077c65e020 xen/acpi-processor: fix _CST detection using undersized evaluation buffer
    6ce948fa5459 net/rds: Fix circular locking dependency in rds_tcp_tune
    ca795bf1230b indirect_call_wrapper: do not reevaluate function pointer
    9612d91f6172 wifi: mt76: Fix possible oob access in mt76_connac2_mac_write_txwi_80211()
    2831a8c57454 wifi: mt76: mt7925: Fix possible oob access in mt7925_mac_write_txwi_80211()
    f4cdf6b43689 wifi: mt76: mt7996: Fix possible oob access in mt7996_mac_write_txwi_80211()
    fcef983ad888 wifi: wlcore: Fix a locking bug
    f98c195052ab wifi: cw1200: Fix locking in error paths
    93e00a88951d octeon_ep_vf: avoid compiler and IQ/OQ reordering
    04a9f26d63d9 octeon_ep_vf: Relocate counter updates before NAPI
    986904ab1613 octeon_ep: avoid compiler and IQ/OQ reordering
    142a789a51d5 octeon_ep: Relocate counter updates before NAPI
    0ace8027e41f bpf/bonding: reject vlan+srcmac xmit_hash_policy change when XDP is loaded
    d95de5acbf9e net: dsa: realtek: rtl8365mb: fix rtl8365mb_phy_ocp_write return value
    01f5b85fa0da kunit: tool: copy caller args in run_kernel to prevent mutation
    3589cc8f56c1 rust: kunit: fix warning when !CONFIG_PRINTK
    7f971dfd4898 drm/xe/configfs: Free ctx_restore_mid_bb in release
    303b446f2e8f drm/xe: Do not preempt fence signaling CS instructions
    7196a1ff7b9a drm/syncobj: Fix handle <-> fd ioctls with dirty stack
    95ed07644b2c wifi: rsi: Don't default to -EOPNOTSUPP in rsi_mac80211_config
    d27f12c3f5e8 can: mcp251x: fix deadlock in error path of mcp251x_open
    8215ba7bc99e can: bcm: fix locking for bcm_op runtime updates
    d8e38dc605c1 amd-xgbe: fix MAC_TCR_SS register width for 2.5G and 10M speeds
    d5947c3d2d14 net: ti: icssg-prueth: Fix ping failure after offload mode setup when link speed is not 1G
    7ea92ab075d8 atm: lec: fix null-ptr-deref in lec_arp_clear_vccs
    00f42ace446f dpaa2-switch: Fix interrupt storm after receiving bad if_id in IRQ handler
    6a674e0b19b0 xsk: Fix zero-copy AF_XDP fragment drop
    645c6d8376ad xsk: Fix fragment node deletion to prevent buffer leak
    2fc623e17854 tcp: give up on stronger sk_rcvbuf checks (for now)
    b955350778b8 udp: Unhash auto-bound connected sk from 4-tuple hash table when disconnected.
    f5fc6fead277 inet: annotate data-races around isk->inet_num
    3d8f35e182c8 nvme-multipath: fix leak on try_module_get failure
    79cc5a4c311f net: ethernet: ti: am65-cpsw-nuss/cpsw-ale: Fix multicast entry handling in ALE table
    f17c1c4acbe2 net: annotate data-races around sk->sk_{data_ready,write_space}
    f30b95159a53 nvmet-fcloop: Check remoteport port_state before calling done callback
    72d08d283964 netfs: Fix unbuffered/DIO writes to dispatch subrequests in strict sequence
    54b3701901af drm/solomon: Fix page start when updating rectangle in page addressing mode
    ee8e4b7469b4 e1000e: clear DPG_EN after reset to avoid autonomous power-gating
    9e0f09182157 i40e: Fix preempt count leak in napi poll tracepoint
    e9669c2d0535 ice: recap the VSI and QoS info after rebuild
    4458f9f198f5 idpf: Fix flow rule delete failure due to invalid validation
    e7fca8b7fb6f idpf: change IRQ naming to match netdev and ethtool queue numbering
    8f742f495ddb idpf: increment completion queue next_to_clean in sw marker wait routine
    d146275655bb hwmon: (it87) Check the it87_lock() return value
    ea07fcfbba43 pinctrl: cirrus: cs42l43: Fix double-put in cs42l43_pin_probe()
    acbcfe2f8e64 pinctrl: meson: amlogic-a4: Fix device node reference leak in aml_dt_node_to_map_pinmux()
    6359d2d52c95 pinctrl: generic: move function to amlogic-am4 driver
    2c091292ca42 HID: multitouch: new class MT_CLS_EGALAX_P80H84
    ade03840f829 module: Remove duplicate freeing of lockdep classes
    55aefe1647a6 platform/x86: thinkpad_acpi: Fix errors reading battery thresholds
    82f1bb0ad480 pinctrl: qcom: qcs615: Add missing dual edge GPIO IRQ errata flag
    53eba152810e pinctrl: equilibrium: fix warning trace on load
    2c947684bdaa pinctrl: equilibrium: rename irq_chip function callbacks
    9833ed224aad hwmon: (aht10) Fix initialization commands for AHT20
    9c1984180260 hwmon: (aht10) Add support for dht20
    e159eb852aee nvme: fix admin queue leak on controller reset
    038158492979 drm/amd/display: Use GFP_ATOMIC in dc_create_stream_for_sink
    a5c070aaf796 Bluetooth: Fix CIS host feature condition
    d8a286503553 net: stmmac: remove support for lpi_intr_o
    999ff1af649c platform/x86: hp-bioscfg: Support allocations of larger data
    0c578e8065c4 ksmbd: call ksmbd_vfs_kern_path_end_removing() on some error paths
    c08ec55617cb ipmi: Fix use-after-free and list corruption on sender error
    3c3462e9ae35 ASoC: fsl_xcvr: provide regmap names
    227eb258c2cb ASoC: fsl_xcvr: use dev_err_probe() replacing dev_err() + return
    3d46af0f8b28 ARM: clean up the memset64() C wrapper
    54e841a03606 Revert "netfilter: nft_set_rbtree: validate open interval overlap"
    861aa1be41bc kbuild: Split .modinfo out from ELF_DETAILS
    bc2110c10128 selftests: mptcp: join: check removing signal+subflow endp
    23ec7f54a9d6 selftests: mptcp: join: check RM_ADDR not sent over same subflow
    ee6ce81a24a4 selftests: mptcp: more stable simult_flows tests
    a64aa7db3939 mptcp: pm: in-kernel: always mark signal+subflow endp as used
    19a258d03d08 mptcp: pm: avoid sending RM_ADDR over same subflow
    944a333c8e4d scsi: core: Fix refcount leak for tagset_refcnt
    86163b98891a smb: client: fix oops due to uninitialised var in smb2_unlink()
    2ef0fc3bf49d smb: client: Don't log plaintext credentials in cifs_set_cifscreds
    134596a6e4be smb: client: fix broken multichannel with krb5+signing
    0786f9422cbf smb: client: fix cifs_pick_channel when channels are equally loaded
    5a34959a2ab1 xfs: Fix error pointer dereference
    b135cd653d1b xfs: fix xfs_group release bug in xfs_dax_notify_dev_failure
    4e8935053ba3 drbd: fix null-pointer dereference on local read error
    d1ef3aed4df2 drbd: fix "LOGIC BUG" in drbd_al_begin_io_nonblock()
    01ee0bcc2986 Squashfs: check metadata block offset is within range
    0524ee56af2c mm: thp: deny THP for files on anonymous inodes
    9a5641024fbf scsi: target: Fix recursive locking in __configfs_open_file()
    cdd96641b642 tracing: Fix WARN_ON in tracing_buffers_mmap_close
    27c13c5bb094 nfsd: Fix cred ref leak in nfsd_nl_threads_set_doit().
    a6677e23b313 net/sched: ets: fix divide by zero in the offload path
    ca1684dd297b arm64: gcs: Do not set PTE_SHARED on GCS mappings if FEAT_LPA2 is enabled
    a1850e2aef4d cpufreq: intel_pstate: Fix crash during turbo disable
    a6f3e0fa8e86 RDMA/ionic: Fix kernel stack leak in ionic_create_cq()
    cfe962216c16 RDMA/irdma: Fix kernel stack leak in irdma_create_user_ah()
    deee46b37ebd IB/mthca: Add missed mthca_unmap_user_db() for mthca_create_srq()
    2764dcb3c35d net: phy: register phy led_triggers during probe to avoid AB-BA deadlock
    07e0c80e17ef gve: fix incorrect buffer cleanup in gve_tx_clean_pending_packets for QPL
    2b6c942a5266 Bluetooth: purge error queues in socket destructors
    cc6d5a3c0a85 wifi: mac80211: fix NULL pointer dereference in mesh_rx_csa_frame()
    f35ceec54d48 wifi: mac80211: bounds-check link_id in ieee80211_ml_reconfiguration
    584279ad9ff1 wifi: cfg80211: cancel rfkill_block work in wiphy_unregister()
    ed7d30f90b77 wifi: libertas: fix use-after-free in lbs_free_adapter()
    2f8ceeba6706 wifi: radiotap: reject radiotap with unknown bits
    bf21bfd63e01 ALSA: hda/realtek: add quirk for Samsung Galaxy Book Flex (NT950QCT-A38A)
    36facbc94803 ALSA: hda/realtek: Add quirk for Acer Aspire V3-572G
    7eb2d1ce7b45 ALSA: hda/realtek: fix model name typo for Samsung Galaxy Book Flex (NT950QCG-X716)
    27338f3360ef ALSA: hda/intel: increase default bdl_pos_adj for Nvidia controllers
    1e5753ff4c2e ALSA: usb-audio: Use correct version for UAC3 header validation
    be7e624f24df ALSA: doc: usb-audio: Add doc for QUIRK_FLAG_SKIP_IFACE_SETUP
    8d70dff4a2e2 ALSA: hda/realtek: Add quirk for HP Pavilion 15-eh1xxx to enable mute LED
    5f935f133107 platform/x86: dell-wmi: Add audio/mic mute key codes
    bf84193d9130 platform/x86: alienware-wmi-wmax: Add G-Mode support to m18 laptops
    5de34126fb2e platform/x86: dell-wmi-sysman: Don't hex dump plaintext password data
    c42a92d685c4 x86/boot/sev: Move SEV decompressor variables into the .data section
    a586788a669b x86/sev: Allow IBPB-on-Entry feature for SNP guests
    c7258d2010e6 x86/boot: Handle relative CONFIG_EFI_SBAT_FILE file paths
    87aeec43ccb9 perf/x86/intel/uncore: Add per-scheduler IMC CAS count events
    f9e9cc320854 x86/efi: defer freeing of boot services memory
    aaca71f8562f HID: multitouch: Keep latency normal on deactivate for reactivation gesture
    d1edc027a4b0 HID: pidff: Fix condition effect bit clearing
    20864e3e41c7 HID: Add HID_CLAIMED_INPUT guards in raw_event callbacks missing them
    b9a606417999 can: usb: f81604: handle bulk write errors properly
    36ead5744314 can: usb: f81604: handle short interrupt urb messages properly
    18eee279e9b5 can: usb: etas_es58x: correctly anchor the urb in the read bulk callback
    aa9e0a7fe5ef can: ucan: Fix infinite loop from zero-length messages
    f6d80b104f90 can: usb: f81604: correctly anchor the urb in the read bulk callback
    1cf469026d4a can: ems_usb: ems_usb_read_bulk_callback(): check the proper length of a message
    c3f1672eaea6 net: usb: pegasus: validate USB endpoints
    011684cd1834 net: usb: kalmia: validate USB endpoints
    2795fc06e765 net: usb: kaweth: validate USB endpoints
    00477cab053d nfc: pn533: properly drop the usb interface reference on disconnect
    cfd94642025e media: dvb-core: fix wrong reinitialization of ringbuffer on reopen
    3acc627f235a namespace: fix proc mount iteration
    a80161c20370 eventpoll: Fix integer overflow in ep_loop_check_proc()
    14a1db2486fa net: arcnet: com20020-pci: fix support for 2.5Mbit cards
    9498fa25a0b0 drm/i915/dp: Fix pipe BPP clamping due to HDR
    99f617ea2ff0 drm/i915/dp: Fail state computation for invalid DSC source input BPP values
    b05ed70feb66 LoongArch: Remove some extern variables in source files
    079deecc2c9f LoongArch: Handle percpu handler address for ORC unwinder
    e7c58045ad8c LoongArch: Remove unnecessary checks for ORC unwinder
    e653c0718cf5 mm/slab: use prandom if !allow_spin
    d3043852fffa slub: remove CONFIG_SLUB_TINY specific code paths
    58aef054b290 hwmon: (max16065) Use READ/WRITE_ONCE to avoid compiler optimization induced race
    378dff71efdd drm/amd: Fix hang on amdgpu unload by using pci_dev_is_disconnected()
    6c80b35076bc PM: sleep: core: Avoid bit field races related to work_in_progress
    5ec1d82f00b1 btrfs: zoned: fixup last alloc pointer after extent removal for RAID0/10
    4b508c53f3c5 btrfs: define the AUTO_KFREE/AUTO_KVFREE helper macros
    d2cfea67b1b9 KVM: x86: Add x2APIC "features" to control EOI broadcast suppression
    c6db0f4a1659 PCI: dwc: ep: Fix resizable BAR support for multi-PF configurations
    7c0c4b7e84b7 PCI: dwc: Remove duplicate dw_pcie_ep_hide_ext_capability() function
    794b08c50128 PCI: dwc: Add new APIs to remove standard and extended Capability
    26f9e895616b PCI: Add preceding capability position support in PCI_FIND_NEXT_*_CAP macros
    7d610f643b04 ARM: dts: imx53-usbarmory: Replace license text comment with SPDX identifier
    f50c91272425 ACPI: APEI: GHES: Disable KASAN instrumentation when compile testing with clang < 18
    0a654ac440c1 ACPI: APEI: GHES: Add helper for CPER CXL protocol errors checks
    baf4b13a4efc clk: tegra: tegra124-emc: fix device leak on set_rate()
    e5bdc2159f8b arm64: dts: rockchip: Fix rk3588 PCIe range mappings
    7f8f4acf3926 arm64: dts: rockchip: Fix rk356x PCIe range mappings
    e70d5feb10c5 iommu/vt-d: Skip dev-iotlb flush for inaccessible PCIe device without scalable mode
    976c7a3750f7 Input: synaptics_i2c - guard polling restart in resume
    9f5158454eae Input: synaptics_i2c - replace use of system_wq with system_dfl_wq
    1aa5833f29b8 media: iris: Add missing platform data entries for SM8750
    448a7662ae13 media: iris: remove v4l2_m2m_ioctl_{de,en}coder_cmd API usage during STOP handling
    2698731d2582 ext4: don't set EXT4_GET_BLOCKS_CONVERT when splitting before submitting I/O
    e56d023da379 ext4: correct the comments place for EXT4_EXT_MAY_ZEROOUT
    663efc5aac21 x86/uprobes: Fix XOL allocation failure for 32-bit tasks
    f7df71d26b30 unwind_user/x86: Teach FP unwind about start of function
    b9537a51b65a unwind_user/x86: Enable frame pointer unwinding on x86
    6f553dbbb25d unwind: Implement compat fp unwind
    5364f7bbd611 unwind: Simplify unwind_user_next_fp() alignment check
    c45026c4135d drm/tegra: dsi: fix device leak on probe
    1e88b5f854bd KVM: x86: Ignore -EBUSY when checking nested events from vcpu_block()
    2dff8966a3a8 media: tegra-video: Fix memory leak in __tegra_channel_try_format()
    7fc4b49474c8 accel/rocket: fix unwinding in error path in rocket_probe
    17463839162f accel/rocket: fix unwinding in error path in rocket_core_init
    b62076e780a2 usb: gadget: f_ncm: align net_device lifecycle with bind/unbind
    ca9ca411bbcf usb: gadget: u_ether: Add auto-cleanup helper for freeing net_device
    f222eb16d597 usb: gadget: u_ether: add gether_opts for config caching
    7bdff9b9b0c6 net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels
    ed9c15c7be25 Revert "PCI: dw-rockchip: Enumerate endpoints based on dll_link_up IRQ"
    15a66eb1b2c6 PCI: dw-rockchip: Change get_ltssm() to provide L1 Substates info
    aad472c928c9 PCI: dwc: Add L1 Substates context to ltssm_status of debugfs
    80d3a201d7ad PCI: dw-rockchip: Configure L1SS support
    b1f114b7a6fa PCI: dwc: Advertise L1 PM Substates only if driver requests it
    53abc9c61361 PCI: j721e: Add config guards for Cadence Host and Endpoint library APIs
    ee7f2ce97b08 PCI: j721e: Use devm_clk_get_optional_enabled() to get and enable the clock
    f69535b77fa0 memory: mtk-smi: fix device leak on larb probe
    b44d090d6ca1 memory: mtk-smi: fix device leaks on common probe
    a67540127042 x86/acpi/boot: Correct acpi_is_processor_usable() check again
    1b99c0e5b6bd bpf: Improve bounds when tnum has a single possible value
    50a4fab0887e bpf: Introduce tnum_step to step through tnum's members
    4c03342e5ac5 bpf: Add bitwise tracking for BPF_END
    6c10b019785d bpf: Fix race in devmap on PREEMPT_RT
    7466ae2aeed4 bpf: Fix race in cpumap on PREEMPT_RT
    ecb4e02614b9 PCI: Correct PCI_CAP_EXP_ENDPOINT_SIZEOF_V2 value
    878fddc519f7 spi: stm32: fix missing pointer assignment in case of dma chaining
    130c436e7149 sched_ext: Fix SCX_EFLAG_INITIALIZED being a no-op flag
    4778033781b5 selftests/bpf: Fix OOB read in dmabuf_collector
    75d474702b2b bpf: Fix stack-out-of-bounds write in devmap
    519b1ad91de5 bpf, arm64: Force 8-byte alignment for JIT buffer to prevent atomic tearing
    11d1d38087e7 ASoC: SDCA: Fix comments for sdca_irq_request()
    5413b1c94cfe ALSA: usb: qcom: Correct parameter comment for uaudio_transfer_buffer_setup()
    51c8bedb2d08 btrfs: fix compat mask in error messages in btrfs_check_features()
    771c1e38385b btrfs: print correct subvol num if active swapfile prevents deletion
    136e814d1176 btrfs: fix warning in scrub_verify_one_metadata()
    b178561ac38c btrfs: fix objectid value in error message in check_extent_data_ref()
    845c0f1ab54e btrfs: fix incorrect key offset in error message in check_dev_extent_item()
    5ba7d61b5416 btrfs: fix error message order of parameters in btrfs_delete_delayed_dir_index()
    d4f210de01ea btrfs: free pages on error in btrfs_uring_read_extent()
    c18c40e081c1 ALSA: hda: cs35l56: Fix signedness error in cs35l56_hda_posture_put()
    73e8bdf14248 drm/amdgpu: Fix error handling in slot reset
    5c42d9f8b004 drm/amdgpu: Fix locking bugs in error paths
    39ae59e5c1d8 drm/amdgpu: Unlock a mutex before destroying it
    1753f5f81ab6 drm/amdgpu/userq: Do not allow userspace to trivially triger kernel warnings
    6f60a783860c PCI: dwc: ep: Flush MSI-X write before unmapping its ATU entry
    3d64dcc0799c arm64: io: Extract user memory type in ioremap_prot()
    835da0da68d0 arm64: io: Rename ioremap_prot() to __ioremap_prot()
    00ea0c8696b4 s390/vtime: Fix virtual timer forwarding
    d30168b0cbc1 s390/idle: Fix cpu idle exit cpu time accounting
    3f89b61dd504 perf: Fix __perf_event_overflow() vs perf_remove_from_context() race
    b9db33aafc12 ALSA: usb-audio: Use inclusive terms
    9a6693b59843 ALSA: usb-audio: Cap the packet size pre-calculations
    4e3ca5f82346 drm/client: Do not destroy NULL modes
    869c979f3657 zloop: check for spurious options passed to remove
    f6c6a888c8a4 zloop: advertise a volatile write cache
    93b64bef8cd4 regulator: bq257xx: Fix device node reference leak in bq257xx_reg_dt_parse_gpio()
    bbc104dcfc59 scsi: ufs: core: Move link recovery for hibern8 exit failure to wl_resume
    5fc4e150c5ad cxl: Fix race of nvdimm_bus object when creating nvdimm objects
    af9bf9889663 cxl: Move devm_cxl_add_nvdimm_bridge() to cxl_pmem.ko
    a29e63795063 cgroup/cpuset: Fix incorrect use of cpuset_update_tasks_cpumask() in update_cpumasks_hier()
    e540616ec3a5 drm/xe/wa: Steer RMW of MCR registers while building default LRC
    3464e7517551 accel/amdxdna: Validate command buffer payload count
    1500b31db943 accel/amdxdna: Prevent ubuf size overflow
    247cd87f0474 accel/amdxdna: Remove buffer size check when creating command BO
    c67ab059953e perf/core: Fix invalid wait context in ctx_sched_in()
    9a3bcd2984b8 rseq: Clarify rseq registration rseq_size bound check comment
    22a1536b3f5a sched/fair: Fix lag clamp
    c1591343440e sched/eevdf: Update se->vprot in reweight_entity()
    ee54b5ba72d4 sched/fair: Only set slice protection at pick time
    99673934a89f sched/fair: Fix zero_vruntime tracking
    423b750d87d2 sched/fair: Introduce and use the vruntime_cmp() and vruntime_op() wrappers for wrapped-signed aritmetics
    028084eca169 sched/fair: Rename cfs_rq::avg_vruntime to ::sum_w_vruntime, and helper functions
    50890a9a01f3 sched/fair: Rename cfs_rq::avg_load to cfs_rq::sum_weight
    50b3d683dcd4 x86/cfi: Fix CFI rewrite for odd alignments
    e58f1a9b0677 x86/fred: Correct speculative safety in fred_extint()
    ddbbdebeeea8 ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP
    71f72c5d74a9 ALSA: usb-audio: Remove VALIDATE_RATES quirk for Focusrite devices
    561cefafd79d ALSA: scarlett2: Fix DSP filter control array handling
    38072446442c drm/imx: parallel-display: check return value of devm_drm_bridge_add() in imx_pd_probe()
    824a7672e354 scsi: pm8001: Fix use-after-free in pm8001_queue_command()
    c3598e86c916 scsi: lpfc: Properly set WC for DPP mapping
    1883332bf21f irqchip/sifive-plic: Fix frozen interrupt due to affinity setting
    183a6264b32e drm/tiny: sharp-memory: fix pointer error dereference
    cd2713a37336 drm/fourcc: fix plane order for 10/12/16-bit YCbCr formats
    bce3847f7c51 KVM: arm64: Fix ID register initialization for non-protected pKVM guests
    7a15a1e3228d KVM: arm64: Hide S1POE from guests when not supported by the host
    f8a6eba20edb drm/logicvc: Fix device node reference leak in logicvc_drm_config_parse()
    a473c09666f0 debugobject: Make it work with deferred page initialization - again
    531f45589787 drm/vmwgfx: Return the correct value in vmw_translate_ptr functions
    2633a30eb45b drm/vmwgfx: Fix invalid kref_put callback in vmw_bo_dirty_release
    c27dea9f50ed perf/core: Fix refcount bug and potential UAF in perf_mmap

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.18.bb              |  6 ++---
 .../linux/linux-yocto-tiny_6.18.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 24 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
index e5afdd14a1..fe8ae4c835 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "08ee3b03d7797adc88926f332bf27b1c39ffe6c1"
-SRCREV_meta ?= "8ef043d5cbfe1d4c6b6b92d6d884d23c4d3411a3"
+SRCREV_machine ?= "d6ecc487b3c4ee6516274ed00ab74cae159e6010"
+SRCREV_meta ?= "1ee48237bcd76936b5fb21bcd3b9202faa25e18b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.18.16"
+LINUX_VERSION ?= "6.18.18"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
index f782a383d2..3867c91693 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.18.inc
 
-LINUX_VERSION ?= "6.18.16"
+LINUX_VERSION ?= "6.18.18"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
-SRCREV_meta ?= "8ef043d5cbfe1d4c6b6b92d6d884d23c4d3411a3"
+SRCREV_machine ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
+SRCREV_meta ?= "1ee48237bcd76936b5fb21bcd3b9202faa25e18b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index a4b589c0f6..8adc49acca 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.18/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.18/standard/base"
 KBRANCH:qemumips64 ?= "v6.18/standard/mti-malta"
 
-SRCREV_machine:qemuarm ?= "97ca229698636b7e65c1b06d446584b6a84fa2b9"
-SRCREV_machine:qemuarm64 ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
-SRCREV_machine:qemuloongarch64 ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
+SRCREV_machine:qemuarm ?= "4161affdabd6a1ac22fe9e8591b8c51e7765b675"
+SRCREV_machine:qemuarm64 ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
+SRCREV_machine:qemuloongarch64 ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
 SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
-SRCREV_machine:qemuppc ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
-SRCREV_machine:qemuriscv64 ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
-SRCREV_machine:qemuriscv32 ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
-SRCREV_machine:qemux86 ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
-SRCREV_machine:qemux86-64 ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
+SRCREV_machine:qemuppc ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
+SRCREV_machine:qemuriscv64 ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
+SRCREV_machine:qemuriscv32 ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
+SRCREV_machine:qemux86 ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
+SRCREV_machine:qemux86-64 ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
 SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
-SRCREV_machine ?= "84ff1c125bcfdae85155ffaf1d171463eaa2db8a"
-SRCREV_meta ?= "8ef043d5cbfe1d4c6b6b92d6d884d23c4d3411a3"
+SRCREV_machine ?= "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
+SRCREV_meta ?= "1ee48237bcd76936b5fb21bcd3b9202faa25e18b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "6258e292d7463f96d0f06dff2a39093a54c9d16f"
+SRCREV_machine:class-devupstream ?= "3318f10fa28986dc5767444de585e00369c4ace3"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.18/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.18;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.18.16"
+LINUX_VERSION ?= "6.18.18"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


