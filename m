Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804EFFC0372
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:33 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.697.1776959124918387930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=js22jjx3;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50fae4d1f85so52564741cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959124; x=1777563924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWC8Ecuztcw6jF2Y27hX5VZnRr5MlT6MtjuZO9ZJqbk=;
        b=js22jjx31eLdsKbSmer6rgqnv+3KXTLmIsSnCAmGoBEiqe4QfR61qwiwENRPlfgFT+
         +0FNyFcY0RS0O+OqvyzXni1kj4B4hq65ztMX41VQUpSv4q4nm6NoroPoTvsiYTqmEMl/
         1YUlwM3D5eAvuSf09ECzBR/fQsXfVVOGdF1aWK35dK3qBuNdofoQWqprG+CxevHacNA/
         CsgfHRvWb4A1pOPfRQ8F5WoCGnyKzxm6LuiPBct8r8tjdiTuUayhi75LpcJZ/mq4Z5vk
         XK1ruj/hhobj1zFhyQL4OExf80aG6NpFJjfu6Dt5D9rH4vNqzIdushPHkMQDk2ZQho3y
         eGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959124; x=1777563924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VWC8Ecuztcw6jF2Y27hX5VZnRr5MlT6MtjuZO9ZJqbk=;
        b=dS2WBUaE5jmt9r/PGW4b6QsC1kzGw4xuNkwKlxnVeXaPed58jVfmA1WynorRunDDEe
         7N9Pz2VErzfBT9cotUJ5MG0H2V6Ow84oPvZyRZ8MJ14YAHjlrLhii4ySjbPgE5glxx7J
         3OKnpM9O4KGcM6S6a/cF9GZTSuPV8KK/MmBhqlRHwCBQENv/wers49Mh5AqT/lgjwWWs
         e+GvlDsf3I202U/X5B3LUAqW2kdLuRoM9nNncQNg3oW0Pr1m4gnEFIJTofdSIulkjmrs
         CcOqr5YnHd2RFmxcR+FYOkJAIs7ci291Xvmi97J6DjuqrsV7dRvV4/+pDAK2YL6YhV0P
         RZUQ==
X-Gm-Message-State: AOJu0Yx/hx7D4n2JjlfFKQxXUh1kz5sbKFIUfxjdaBhz/Q/FgTUVQota
	Mqhkxo9HAS2uHsH7akEZpdjNnfHGd05pgiKm6ZRkyrBNjTynJKFMIeOIb9Y4WQ1B
X-Gm-Gg: AeBDievwqKdUWVA5xy/mDZabJC4YMSUm7tFFA1OQQ8eKqHmStG0hG49wArdm4ENjMvk
	BYFYp+VrKmHzQUfKkrKcsDkPGKex87NFJF+0gHDSbq2GtBvak9v07U5ws6uNukw4nbZ8yWaAaXK
	FzsaLAxILFKB6NHUeB3ZDRTHl5znlRQEvrAN2HWGcQAXf53vNF4oop7UJ64ZVdLE/EWmN/wsB+2
	sF2xmlHsaY/ZMmy+br6gXpOwKVQxBzux7rw5Igvgqd4FnooKCYUh15GuJhBV/VY5V/LX+jGFpmc
	ksRbWSvv1LEblyKuC8hQaiP9s63Jooug8MPDI7W+j30LtfCNi2iJ+JbgsTZMOkewGdKV9VLWlG/
	cHWLGPVVCdr6twEv1raU+iWw1t0cNwbzcp/KAaJl/U3BhoxEYd47gGBgB88SlwX8K92PeCg3X4w
	X3v5LK1EzqOTxuQoHH3y3tZc3eHGh0hy1T5RQfCwOe+Szl5aWqxVe8Wqt+wtRviSbZd4r4u2UEF
	6o7jA8M1EtVmDYQmFr/DngkGHQ5uG+HW4LIWZ6Td9qM1OAFAVJK2gyqnfQcw4blpDPv6g==
X-Received: by 2002:a05:622a:13ca:b0:50f:b978:82f3 with SMTP id d75a77b69052e-50fb97887a7mr160942241cf.52.1776959123422;
        Thu, 23 Apr 2026 08:45:23 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:22 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 09/18] linux-yocto/6.12: update to v6.12.77
Date: Thu, 23 Apr 2026 11:45:00 -0400
Message-ID: <20260423154509.1933646-10-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235809

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    6f232446a629 Linux 6.12.77
    1ba82a3bbc09 ata: libata-eh: Fix detection of deferred qc timeouts
    0d12453818c3 ata: libata: cancel pending work after clearing deferred_qc
    d2459cba1d99 ata: libata-eh: correctly handle deferred qc timeouts
    42ea6c476b27 ata: libata-core: fix cancellation of a port deferred qc work
    08d9175578d6 ext4: fix potential null deref in ext4_mb_init()
    eecce0263999 apparmor: fix race between freeing data and fs accessing it
    f9761add6d10 apparmor: fix race on rawdata dereference
    34fc60b125ed apparmor: fix differential encoding verification
    0fc63dd91706 apparmor: fix unprivileged local user can do privileged policy management
    86feeccd6b93 apparmor: Fix double free of ns_name in aa_replace_profiles()
    76b4d36c5122 apparmor: fix missing bounds check on DEFAULT table in verify_dfa()
    b73c1dff8a9d apparmor: fix side-effect bug in match_char() macro usage
    853ce31ca720 apparmor: fix: limit the number of levels of policy namespaces
    999bd704b0b6 apparmor: replace recursive profile removal with iterative approach
    786e2c2a87d9 apparmor: fix memory leak in verify_header
    15c3eb8916e7 apparmor: validate DFA start states are in bounds in unpack_pdb
    524ce8b4ea8f net/sched: Only allow act_ct to bind to clsact/ingress qdiscs and shared blocks
    42b380f97d65 tracing: Add NULL pointer check to trigger_data_free()
    1cf22986da18 selftest/arm64: Fix sve2p1_sigill() to hwcap test
    c7c790a07697 xdp: produce a warning when calculated tailroom is negative
    581e209d1ff0 i40e: use xdp.frame_sz as XDP RxQ info frag_size
    7f46fd89d863 i40e: fix registering XDP RxQ info
    addccd49c541 xsk: introduce helper to determine rxq->frag_size
    c12b63c87250 xdp: use modulo operation to calculate XDP frag tailroom
    91a89d3bdc2f net/sched: act_ife: Fix metalist update behavior
    f7c9f8e36074 net: ipv6: fix panic when IPv4 route references loopback IPv6 nexthop
    f0373e9317bc net: vxlan: fix nd_tbl NULL dereference when IPv6 is disabled
    aa73deb3b6b7 net: bridge: fix nd_tbl NULL dereference when IPv6 is disabled
    4614301b900a selftests/harness: order TEST_F and XFAIL_ADD constructors
    0b7cd6fa9aff kselftest/harness: Use helper to avoid zero-size memset warning
    b73dfe1ea7be net: ethernet: mtk_eth_soc: Reset prog ptr to old_prog in case of error in mtk_xdp_setup()
    c12d570d7192 netfilter: nft_set_pipapo: split gc into unlink and reclaim phase
    dcba62d4fade net: stmmac: Fix error handling in VLAN add and delete paths
    78141b8832e1 nfc: rawsock: cancel tx_work before socket teardown
    0beea51b28b2 nfc: nci: clear NCI_DATA_EXCHANGE before calling completion callback
    3245801d44a4 nfc: nci: free skb on nci_transceive early error paths
    0196f36ad01e net_sched: sch_fq: clear q->band_pkt_count[] in fq_reset()
    2451949f0584 net: nfc: nci: Fix zero-length proprietary notifications
    5bc4e69306ed net: sched: avoid qdisc_reset_all_tx_gt() vs dequeue race for lockless qdiscs
    5c38a7ed9a9f hwmon: (max6639) fix inverted polarity
    d7040a5da952 hwmon: (max6639) : Configure based on DT property
    15fb6d627484 nvme: fix memory allocation in nvme_pr_read_keys()
    a0167a4984ca nvme: reject invalid pr_read_keys() num_keys values
    549b68ba830f drm/xe/reg_sr: Fix leak on xa_store failure
    9507f9953a2a i2c: i801: Revert "i2c: i801: replace acpi_lock with I2C bus lock"
    1e6eaf2150ef drm/sched: Fix kernel-doc warning for drm_sched_job_done()
    d6bdc685e19f amd-xgbe: fix sleep while atomic on suspend/resume
    4bdc94d45d54 net: ipv4: fix ARM64 alignment fault in multipath hash seed
    3310fc11fc47 ipv6: fix NULL pointer deref in ip6_rt_get_dev_rcu()
    827c92c15ac8 smb/client: fix buffer size for smb311_posix_qinfo in SMB311_posix_query_info()
    20a126dbd61e smb/client: fix buffer size for smb311_posix_qinfo in smb2_compound_op()
    cfcfa0ca0212 bpf: Fix a UAF issue in bpf_trampoline_link_cgroup_shim
    3dfab6040c10 iavf: fix netdev->max_mtu to respect actual hardware limit
    27e9019fe199 xen/acpi-processor: fix _CST detection using undersized evaluation buffer
    8519e6883a94 net/rds: Fix circular locking dependency in rds_tcp_tune
    1f8b8f0db008 indirect_call_wrapper: do not reevaluate function pointer
    7b692dff8df0 wifi: mt76: Fix possible oob access in mt76_connac2_mac_write_txwi_80211()
    3356464e50e1 wifi: mt76: mt7925: Fix possible oob access in mt7925_mac_write_txwi_80211()
    ca1adc04fc2c wifi: mt76: mt7996: Fix possible oob access in mt7996_mac_write_txwi_80211()
    5feeea59ed14 wifi: wlcore: Fix a locking bug
    35e173d7b878 wifi: cw1200: Fix locking in error paths
    02973ef983cb octeon_ep_vf: avoid compiler and IQ/OQ reordering
    4f3acd77273c octeon_ep_vf: Relocate counter updates before NAPI
    496163a7292e octeon_ep: avoid compiler and IQ/OQ reordering
    799cc585326f octeon_ep: Relocate counter updates before NAPI
    d36ad7e126c6 bpf/bonding: reject vlan+srcmac xmit_hash_policy change when XDP is loaded
    fcb74331c483 net: dsa: realtek: rtl8365mb: fix rtl8365mb_phy_ocp_write return value
    6c8d7984cb25 kunit: tool: copy caller args in run_kernel to prevent mutation
    8891bffb532a rust: kunit: fix warning when !CONFIG_PRINTK
    1a42ea28e01b drm/xe: Do not preempt fence signaling CS instructions
    b64fbd718cf4 wifi: rsi: Don't default to -EOPNOTSUPP in rsi_mac80211_config
    38063cc435b6 can: mcp251x: fix deadlock in error path of mcp251x_open
    8bcf2d847adb can: bcm: fix locking for bcm_op runtime updates
    c8e57b713c17 amd-xgbe: fix MAC_TCR_SS register width for 2.5G and 10M speeds
    ff4d5a3e77f7 net: ti: icssg-prueth: Fix ping failure after offload mode setup when link speed is not 1G
    2d9f57ea29a1 atm: lec: fix null-ptr-deref in lec_arp_clear_vccs
    fa4412cdc517 dpaa2-switch: Fix interrupt storm after receiving bad if_id in IRQ handler
    3f2793713c13 xsk: Fix zero-copy AF_XDP fragment drop
    2a9ea988465e xsk: Fix fragment node deletion to prevent buffer leak
    bf56bae0e5ec xsk: s/free_list_node/list_node/
    fd5614763805 xsk: Get rid of xdp_buff_xsk::xskb_list_node
    ebcdcb5063dd net: ethernet: ti: am65-cpsw-nuss/cpsw-ale: Fix multicast entry handling in ALE table
    98c92c9b2414 drm/solomon: Fix page start when updating rectangle in page addressing mode
    54b631ac6935 e1000e: clear DPG_EN after reset to avoid autonomous power-gating
    b7e91827e1cf i40e: Fix preempt count leak in napi poll tracepoint
    7f213357476b idpf: change IRQ naming to match netdev and ethtool queue numbering
    31f22b8051ee hwmon: (it87) Check the it87_lock() return value
    188ba3468cb7 pinctrl: cirrus: cs42l43: Fix double-put in cs42l43_pin_probe()
    c2611fc89506 HID: multitouch: new class MT_CLS_EGALAX_P80H84
    bdaabb4cf660 HID: multitouch: add quirks for Lenovo Yoga Book 9i
    6890141e856c platform/x86: thinkpad_acpi: Fix errors reading battery thresholds
    af3b0ec98dc1 pinctrl: equilibrium: fix warning trace on load
    5818c3fcd072 pinctrl: equilibrium: rename irq_chip function callbacks
    d5e7ed87a3b6 hwmon: (aht10) Fix initialization commands for AHT20
    947a50cf8abf hwmon: (aht10) Add support for dht20
    64f87b96de0e nvme: fix admin queue leak on controller reset
    8cad5463aec6 ACPI: APEI: GHES: Disable KASAN instrumentation when compile testing with clang < 18
    400989c54567 btrfs: always fallback to buffered write if the inode requires checksum
    5d219040ee7b net: stmmac: dwmac-loongson: Set clk_csr_i to 100-150MHz
    4d1ea0416384 ARM: clean up the memset64() C wrapper
    d151b94967c8 xattr: switch to CLASS(fd)
    8899f3d3f3fa selftests: mptcp: join: check removing signal+subflow endp
    7141b5997c59 selftests: mptcp: more stable simult_flows tests
    ec5c17c687b1 scsi: core: Fix refcount leak for tagset_refcnt
    b746a357abfb smb: client: Don't log plaintext credentials in cifs_set_cifscreds
    5b3aa7384329 smb: client: fix broken multichannel with krb5+signing
    4a5c8e1b6a58 smb: client: fix cifs_pick_channel when channels are equally loaded
    1e906c08594c drbd: fix null-pointer dereference on local read error
    eef1390125b6 drbd: fix "LOGIC BUG" in drbd_al_begin_io_nonblock()
    9e9fa5ad37c9 Squashfs: check metadata block offset is within range
    4fcfa424a581 scsi: target: Fix recursive locking in __configfs_open_file()
    91f3e8d84c89 tracing: Fix WARN_ON in tracing_buffers_mmap_close
    41170716421c nfsd: Fix cred ref leak in nfsd_nl_threads_set_doit().
    78b8d2f55a56 net/sched: ets: fix divide by zero in the offload path
    2fd37450d271 RDMA/irdma: Fix kernel stack leak in irdma_create_user_ah()
    da8eaa73bc37 IB/mthca: Add missed mthca_unmap_user_db() for mthca_create_srq()
    f5d8af683410 wifi: mac80211: fix NULL pointer dereference in mesh_rx_csa_frame()
    bfde158d5d13 wifi: mac80211: bounds-check link_id in ieee80211_ml_reconfiguration
    57e39fe8da57 wifi: cfg80211: cancel rfkill_block work in wiphy_unregister()
    2a60c588d5d3 wifi: radiotap: reject radiotap with unknown bits
    d3904ca40515 ALSA: usb-audio: Use correct version for UAC3 header validation
    9067651da90a platform/x86: dell-wmi: Add audio/mic mute key codes
    0e6115c2f2fa platform/x86: dell-wmi-sysman: Don't hex dump plaintext password data
    399da820ecfe x86/efi: defer freeing of boot services memory
    892dbaf46bb7 HID: Add HID_CLAIMED_INPUT guards in raw_event callbacks missing them
    73f2354f5a33 can: usb: f81604: handle bulk write errors properly
    c5d69da6c919 can: usb: f81604: handle short interrupt urb messages properly
    b878444519fa can: usb: etas_es58x: correctly anchor the urb in the read bulk callback
    bd85f21a6219 can: ucan: Fix infinite loop from zero-length messages
    c001214e1220 can: usb: f81604: correctly anchor the urb in the read bulk callback
    18f75b9cbdc3 can: ems_usb: ems_usb_read_bulk_callback(): check the proper length of a message
    95556b4e8797 net: usb: pegasus: validate USB endpoints
    51c20ea5f155 net: usb: kalmia: validate USB endpoints
    f33e80d195a0 net: usb: kaweth: validate USB endpoints
    7ff14eb070f0 nfc: pn533: properly drop the usb interface reference on disconnect
    d71781bad59b media: dvb-core: fix wrong reinitialization of ringbuffer on reopen
    d1398cca55cf namespace: fix proc mount iteration
    029be23f553b eventpoll: Fix integer overflow in ep_loop_check_proc()
    2ad8b01cb7ee net: arcnet: com20020-pci: fix support for 2.5Mbit cards
    ab6a494abecb ALSA: hda/conexant: Fix headphone jack handling on Acer Swift SF314
    27e8f7a6a1b8 ALSA: hda/realtek: Add quirk for Samsung Galaxy Book3 Pro 360 (NP965QFG)
    a797f5ebfca8 ALSA: hda/realtek: Add quirk for Gigabyte G5 KF5 (2023)
    57b36d4c3474 LoongArch: Remove some extern variables in source files
    8eeb34ae9d4c LoongArch: Handle percpu handler address for ORC unwinder
    5d8e3b81aee2 LoongArch: Remove unnecessary checks for ORC unwinder
    2e6949777d1d LoongArch/orc: Use RCU in all users of __module_address().
    4c2ca3160852 ksmbd: add chann_lock to protect ksmbd_chann_list xarray
    c9c00b85b85b ksmbd: check return value of xa_store() in krb5_authenticate
    5345810d9a80 hwmon: (max16065) Use READ/WRITE_ONCE to avoid compiler optimization induced race
    1b15298ef44b ALSA: hda/conexant: Add quirk for HP ZBook Studio G4
    4b9d205dbc74 drm/amd: Fix hang on amdgpu unload by using pci_dev_is_disconnected()
    56289298431e usb: cdns3: fix role switching during resume
    eef31e654661 usb: cdns3: call cdns_power_is_lost() only once in cdns_resume()
    151b775f5dbf usb: cdns3: remove redundant if branch
    2788b1562776 btrfs: zoned: fixup last alloc pointer after extent removal for RAID0/10
    acefb51f406c btrfs: define the AUTO_KFREE/AUTO_KVFREE helper macros
    531c755f2507 btrfs: zoned: fix stripe width calculation
    3a5125dd004c btrfs: zoned: fixup last alloc pointer after extent removal for DUP
    21b26c833bfd btrfs: zoned: fixup last alloc pointer after extent removal for RAID1
    ea7cc214d3b3 btrfs: zoned: fix alloc_offset calculation for partly conventional block groups
    80cf22e7ffc1 btrfs: fix periodic reclaim condition
    fcb261823f7a btrfs: fix reclaimed bytes accounting after automatic block group reclaim
    c41742dabb80 btrfs: get used bytes while holding lock at btrfs_reclaim_bgs_work()
    be5ee3033326 btrfs: drop unused parameter fs_info from do_reclaim_sweep()
    6c9b043177e6 uprobes: Fix incorrect lockdep condition in filter_chain()
    1d34cb886c82 uprobes: switch to RCU Tasks Trace flavor for better performance
    abfdf449fb3d drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
    fe99afca8cea drm/exynos/vidi: Remove redundant error handling in vidi_get_modes()
    4c4193829109 drm/exynos: vidi: fix to avoid directly dereferencing user pointer
    51a31c0bc282 of/kexec: refactor ima_get_kexec_buffer() to use ima_validate_range()
    f11d7d088f5e ima: verify the previous kernel's IMA buffer lies in addressable RAM
    a3c9222702e1 ima: kexec: define functions to copy IMA log at soft boot
    130e69879746 kexec: define functions to map and unmap segments
    24d7c77955b8 ima: define and call ima_alloc_kexec_file_buf()
    be4ac8d25924 ima: rename variable the seq_file "file" to "ima_kexec_file"
    9e6bd0a8c1af ima: kexec: silence RCU list traversal warning
    a97228fb32e1 clk: tegra: tegra124-emc: fix device leak on set_rate()
    76cce803bf51 arm64: dts: rockchip: Fix rk3588 PCIe range mappings
    497b04231b8f arm64: dts: rockchip: Fix rk356x PCIe range mappings
    48b3f08e68b2 iommu/vt-d: Skip dev-iotlb flush for inaccessible PCIe device without scalable mode
    9b5df5eedc02 Input: synaptics_i2c - guard polling restart in resume
    432612bf478b Input: synaptics_i2c - replace use of system_wq with system_dfl_wq
    c8272cfe36bd workqueue: Add system_percpu_wq and system_dfl_wq
    9eea2f57d11b ext4: always allocate blocks only from groups inode can use
    ec23aa36ddf3 ext4: implement linear-like traversal across order xarrays
    5abec3fee594 ext4: refactor choose group to scan group
    d99d714f714c ext4: convert free groups order lists to xarrays
    007967dab681 ext4: factor out ext4_mb_scan_group()
    2475d11bc431 ext4: factor out ext4_mb_might_prefetch()
    ca4c90dd2aac ext4: factor out __ext4_mb_scan_group()
    f0bb92429c97 ext4: add ext4_try_lock_group() to skip busy groups
    01d9a8c2615d mailbox: Prevent out-of-bounds access in fw_mbox_index_xlate()
    ac75c29c9c95 mailbox: Allow controller specific mapping using fwnode
    b9816026481e mailbox: Use guard/scoped_guard for con_mutex
    186ad0c3034a mailbox: Use dev_err when there is error
    0469ec15c923 mailbox: remove unused header files
    c7b57c4d294c mailbox: sort headers alphabetically
    492c8eb02e81 mailbox: don't protect of_parse_phandle_with_args with con_mutex
    2920ec61c98b ext4: don't set EXT4_GET_BLOCKS_CONVERT when splitting before submitting I/O
    3e00915433df ext4: correct the comments place for EXT4_EXT_MAY_ZEROOUT
    97ac11dbcb42 drm/tegra: dsi: fix device leak on probe
    ce22aaed0112 ata: libata-scsi: avoid Non-NCQ command starvation
    e44a35402439 ata: libata: Introduce ata_port_eh_scheduled()
    87097457625a ata: libata: Remove ATA_DFLAG_ZAC device flag
    4e0e3c784f37 ata: libata-scsi: Remove struct ata_scsi_args
    bcb93aeed8b2 ata: libata-scsi: Document all VPD page inquiry actors
    b057df339361 ata: libata-scsi: Refactor ata_scsiop_maint_in()
    d62d7321212b ata: libata-scsi: Refactor ata_scsiop_read_cap()
    2b3717897c38 ata: libata-scsi: Refactor ata_scsi_simulate()
    2657439265d3 KVM: x86: Ignore -EBUSY when checking nested events from vcpu_block()
    630a61552e58 media: dw9714: Fix powerup sequence
    a4cf3497fb9a media: dw9714: add support for powerdown pin
    1158193e7635 media: dw9714: move power sequences to dedicated functions
    3ca2f0906173 media: tegra-video: Fix memory leak in __tegra_channel_try_format()
    a29639a34297 PCI: Use resource_set_range() that correctly sets ->end
    889b5cb678c1 resource: Add resource set range and size helpers
    52d89a64dd31 Revert "PCI: qcom: Don't wait for link if we can detect Link Up"
    29ff60fda59f PCI: qcom: Don't wait for link if we can detect Link Up
    ff6c9a40e426 Revert "PCI: dw-rockchip: Don't wait for link since we can detect Link Up"
    fdf5e166058a PCI: dw-rockchip: Don't wait for link since we can detect Link Up
    1f23a48ff2b8 memory: mtk-smi: fix device leak on larb probe
    984992f31cfb memory: mtk-smi: fix device leaks on common probe
    a7df760f7074 x86/acpi/boot: Correct acpi_is_processor_usable() check again
    2129ce65c83e PCI: Correct PCI_CAP_EXP_ENDPOINT_SIZEOF_V2 value
    d2c31d8e03d0 bpf: Fix stack-out-of-bounds write in devmap
    80ad264da02c bpf, arm64: Force 8-byte alignment for JIT buffer to prevent atomic tearing
    283cc83f63e0 btrfs: fix compat mask in error messages in btrfs_check_features()
    a78db325aca1 btrfs: print correct subvol num if active swapfile prevents deletion
    390cc898680e btrfs: fix warning in scrub_verify_one_metadata()
    ca57b339e4a7 btrfs: fix objectid value in error message in check_extent_data_ref()
    0226914e4d5e btrfs: fix incorrect key offset in error message in check_dev_extent_item()
    0507cf9ae0a9 ALSA: hda: cs35l56: Fix signedness error in cs35l56_hda_posture_put()
    1c84c68e7524 ALSA: pci: hda: use snd_kcontrol_chip()
    1359449b33bb drm/amdgpu: Fix locking bugs in error paths
    3a9828141d4b drm/amdgpu: Replace kzalloc + copy_from_user with memdup_user
    0518ce29ad20 drm/amdgpu: Unlock a mutex before destroying it
    a7afb8f810c0 PCI: dwc: ep: Flush MSI-X write before unmapping its ATU entry
    5e13ef9235c7 PCI: dwc: ep: Use align addr function for dw_pcie_ep_raise_{msi,msix}_irq()
    fd9528fbe2fb PCI: dwc: endpoint: Implement the pci_epc_ops::align_addr() operation
    9373f0bf9954 PCI: endpoint: Introduce pci_epc_mem_map()/unmap()
    fa391a36e178 PCI: endpoint: Introduce pci_epc_function_is_valid()
    00d5cf8c5978 s390/vtime: Fix virtual timer forwarding
    3120d12adfbf s390/idle: Fix cpu idle exit cpu time accounting
    5c48fdc4b462 perf: Fix __perf_event_overflow() vs perf_remove_from_context() race
    367e4285127f ALSA: usb-audio: Use inclusive terms
    192cc667e77e ALSA: usb-audio: Cap the packet size pre-calculations
    1bcc4ea8207a scsi: ufs: core: Move link recovery for hibern8 exit failure to wl_resume
    6e4f70034387 cgroup/cpuset: Fix incorrect use of cpuset_update_tasks_cpumask() in update_cpumasks_hier()
    27d4450c8f2b rseq: Clarify rseq registration rseq_size bound check comment
    3bc5887b0a2b x86/fred: Correct speculative safety in fred_extint()
    5190fc2ba7a0 ALSA: usb-audio: Remove VALIDATE_RATES quirk for Focusrite devices
    7cefc67b2c4f ALSA: scarlett2: Fix DSP filter control array handling
    2fd1470ca412 ALSA: scarlett2: Fix redeclaration of loop variable
    c5dc39f8ae05 scsi: pm8001: Fix use-after-free in pm8001_queue_command()
    734c2363eb8a scsi: lpfc: Properly set WC for DPP mapping
    686eb378a4a5 irqchip/sifive-plic: Fix frozen interrupt due to affinity setting
    016f1f7ccafd KVM: arm64: Hide S1POE from guests when not supported by the host
    871630255ecd drm/logicvc: Fix device node reference leak in logicvc_drm_config_parse()
    36cb28b6d303 drm/vmwgfx: Return the correct value in vmw_translate_ptr functions
    0d9cb5860077 drm/vmwgfx: Fix invalid kref_put callback in vmw_bo_dirty_release

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 444cab413f..dd906d5ac6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,13 +15,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5c7879a7b2753ea23b696b6a3e7e4a38c40f5776"
-SRCREV_meta ?= "9a7e5434a02c01df4901784d29694d940743d56c"
+SRCREV_machine ?= "d684a294eb3f7a4122771290905565ddc36efd45"
+SRCREV_meta ?= "19b5087399932add6bc893493fe1146fca7d4799"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.76"
+LINUX_VERSION ?= "6.12.77"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 63135de5c7..2803d0215a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-yocto.inc
 include recipes-kernel/linux/cve-exclusion.inc
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.76"
+LINUX_VERSION ?= "6.12.77"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,8 +18,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
-SRCREV_meta ?= "9a7e5434a02c01df4901784d29694d940743d56c"
+SRCREV_machine ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
+SRCREV_meta ?= "19b5087399932add6bc893493fe1146fca7d4799"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 0e1b1fa61f..294431f5dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9dcacd6df5189be895d0b0d59d728ef61743338d"
-SRCREV_machine:qemuarm64 ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
-SRCREV_machine:qemuloongarch64 ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
-SRCREV_machine:qemumips ?= "eca7f78fe1f9f2bd98951df1100e46a8e39d0ea0"
-SRCREV_machine:qemuppc ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
-SRCREV_machine:qemuriscv64 ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
-SRCREV_machine:qemuriscv32 ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
-SRCREV_machine:qemux86 ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
-SRCREV_machine:qemux86-64 ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
-SRCREV_machine:qemumips64 ?= "8acf70fbeddae4770f3d24cbd8548402ae6a4f9e"
-SRCREV_machine ?= "b1a05d710b72913717bcc1139e714080d99e79a8"
-SRCREV_meta ?= "9a7e5434a02c01df4901784d29694d940743d56c"
+SRCREV_machine:qemuarm ?= "448ef862c891700b3d94201e63a831b34a7713e4"
+SRCREV_machine:qemuarm64 ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
+SRCREV_machine:qemuloongarch64 ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
+SRCREV_machine:qemumips ?= "794aa4ace83aa50352e4abc39ed84229c864310c"
+SRCREV_machine:qemuppc ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
+SRCREV_machine:qemuriscv64 ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
+SRCREV_machine:qemuriscv32 ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
+SRCREV_machine:qemux86 ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
+SRCREV_machine:qemux86-64 ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
+SRCREV_machine:qemumips64 ?= "3b21c90c913a00a52877a25a4cd1aff57fc14695"
+SRCREV_machine ?= "43dd0f289325a90f8d17ec0ee8b2544555d056c3"
+SRCREV_meta ?= "19b5087399932add6bc893493fe1146fca7d4799"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "39b686f8d57d7506af7789e915fe7fd103b0fe57"
+SRCREV_machine:class-devupstream ?= "6f232446a62980e51f537db1c655e686d869b9ed"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.76"
+LINUX_VERSION ?= "6.12.77"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


