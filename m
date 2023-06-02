Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87393C7EE31
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:22:39 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.3364.1685672545756889129
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=PdF7IBdm;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-392116b8f31so1064716b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 19:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685672552; x=1688264552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tQ3FwX7jxS6Kls4eCkzbBNIGGtlks63dTnIo9S7xtw=;
        b=PdF7IBdmROFrhYdLyX3k2NSBGzuNCehWM8Zo5wzE3GX3nfLmWSQaXxYAWKxqT1YUh+
         KVcW/ylZ4Q/r9l1eEhkVCAoQmsTymzKqxFc2FwqY5ro6KPyHPk2WmtZtPn1lOuIU9pu7
         XiX3vI7mXgRp7J+bYcRvK2YYPwA2RVMf4+onLIokPXC6uUyPINfnI22boDQ8ElwQiYta
         RXnYbPrhQrkQxi6dnPdPC88hRVj1A7O+zOOAvEILkDNJ0QFN6MtZjOOkCzH+zaJRhm3J
         zwBpoPqr06gJia9w+d18YAyNFs7j3E9PQuu/wSRimmKNdfWfWwwafUsNf2Y3TQBeIlNR
         dpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672552; x=1688264552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tQ3FwX7jxS6Kls4eCkzbBNIGGtlks63dTnIo9S7xtw=;
        b=hmQ+7E6Wu3yNuzwrADxuDU34udxxdeIZLQz6aFQHO/fk2LRv4DUpi+xrIXVpc5uomh
         yhnOKL7leDrpo8nWXi6LXjubUaPJM+mR9mIbcgXmI+iUWY8K01NmAGwWwS0VNkHbEFAk
         SL+Kd1d0mpsdovgOClpl3SL86BAaaddczrWt6594rSi7duT/Ij60OdKVHyBLfhXbG0ZW
         9XjsdU/Y0/WSZ4s1Sxd+GEdOFxS97tlEABWsUP0wGCbQBTEusHf1MGgf5wpG6wd4VWkq
         gH9PfhPg2i+se21gNaN/vP2Rr9ORMUMq2ekpL61xbON2MvxvNdbU+tofY5voykH7kVDr
         LujA==
X-Gm-Message-State: AC+VfDzikNwW1w1eaqD2XT7s9/KNfLessCpTe16mSgda3wi2a1qdSQtq
	M34K9JE4WnE5EcubzZvHAxQCQwY0zM4nZlp6xmQ=
X-Google-Smtp-Source: ACHHUZ5Rj6VgHsFAXn0auWeupoprCcokyXkkdtXntgi+UrCiHxAkcXawFQ7vXS37sF/3xeffwaJBaA==
X-Received: by 2002:a05:6808:97:b0:398:55ff:1fb8 with SMTP id s23-20020a056808009700b0039855ff1fb8mr994971oic.37.1685672551523;
        Thu, 01 Jun 2023 19:22:31 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0064fc715b380sm5850234pfn.176.2023.06.01.19.22.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:22:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 05/13] linux-yocto/5.15: update to v5.15.113
Date: Thu,  1 Jun 2023 16:22:04 -1000
Message-Id: <e59689be96bb366233a10db22246751f484691fa.1685672395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685672395.git.steve@sakoman.com>
References: <cover.1685672395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182128

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    1fe619a7d252 Linux 5.15.113
    7de20a23e52a HID: wacom: add three styli to wacom_intuos_get_tool_type
    25b835d40838 HID: wacom: Add new Intuos Pro Small (PTH-460) device IDs
    a540aabefa9b HID: wacom: Force pen out of prox if no events have been received in a while
    b4c7b54b83f6 s390/qdio: fix do_sqbs() inline assembly constraint
    b8427b8522d9 nilfs2: fix use-after-free bug of nilfs_root in nilfs_evict_inode()
    cafdd9cefc5b powerpc/64s/radix: Fix soft dirty tracking
    fe59dd824fad tpm/tpm_tis: Disable interrupts for more Lenovo devices
    b9eb4491f0c9 powerpc/iommu: Incorrect DDW Table is referenced for SR-IOV device
    317ee8c54faa ceph: force updating the msg pointer in non-split case
    e3d1adcad5b7 vc_screen: reload load of struct vc_data pointer in vcs_write() to avoid UAF
    03e39ec73941 thunderbolt: Clear registers properly when auto clear isn't in use
    742ed5bb683e serial: qcom-geni: fix enabling deactivated interrupt
    6960267e7d0b serial: 8250_exar: Add support for USR298x PCI Modems
    7d8873ecbd3c serial: Add support for Advantech PCI-1611U card
    51d90382d241 statfs: enforce statfs[64] structure initialization
    865be1cff2c0 ksmbd: fix global-out-of-bounds in smb2_find_context_vals
    7657321b2624 ksmbd: fix wrong UserName check in session_user
    61e043326e72 ksmbd: allocate one more byte for implied bcc[0]
    1c2461b41f30 ksmbd: smb2: Allow messages padded to 8byte boundary
    49f47945386e SMB3: drop reference to cfile before sending oplock break
    653d30a1512c SMB3: Close all deferred handles of inode in case of handle lease break
    972a33e6cc76 can: kvaser_pciefd: Disable interrupts in probe error path
    143623940a03 can: kvaser_pciefd: Do not send EFLUSH command on TFD interrupt
    c724a6edc1c6 can: kvaser_pciefd: Clear listen-only bit if not explicitly requested
    f04628305cac can: kvaser_pciefd: Empty SRB buffer in probe
    da711a8af0fa can: kvaser_pciefd: Call request_irq() before enabling interrupts
    4857ccfbe283 can: kvaser_pciefd: Set CAN_STATE_STOPPED in kvaser_pciefd_stop()
    9ac2448c24a9 can: isotp: recvmsg(): allow MSG_CMSG_COMPAT flag
    a17cf315f246 can: j1939: recvmsg(): allow MSG_CMSG_COMPAT flag
    83af0876040b ALSA: hda/realtek: Add quirk for 2nd ASUS GU603
    cc1924ab21d7 ALSA: hda/realtek: Add a quirk for HP EliteDesk 805
    3a32c5149461 ALSA: hda/realtek: Add quirk for Clevo L140AU
    059a18e95e06 ALSA: hda: Add NVIDIA codec IDs a3 through a7 to patch table
    e8c7d7c43d5e ALSA: hda: Fix Oops by 9.1 surround channel names
    831a1ffb0a93 xhci: Fix incorrect tracking of free space on transfer rings
    4c5c4870694b xhci-pci: Only run d3cold avoidance quirk for s2idle
    fc0e18f95c88 usb: typec: altmodes/displayport: fix pin_assignment_show
    0ed9257a8ab9 usb: gadget: u_ether: Fix host MAC address case
    c51a131cacf4 usb: dwc3: debugfs: Resume dwc3 before accessing registers
    720be29c7d1c USB: UHCI: adjust zhaoxin UHCI controllers OverCurrent bit value
    2ef3ecff0907 usb-storage: fix deadlock when a scsi command timeouts more than once
    3b43d9df27a7 USB: usbtmc: Fix direction for 0-length ioctl control messages
    15d744133218 ALSA: usb-audio: Add a sample rate workaround for Line6 Pod Go
    62499cf3ddd7 bridge: always declare tunnel functions
    ec5caa765f7f netfilter: nft_set_rbtree: fix null deref on element insertion
    b0cc763806c0 netfilter: nf_tables: fix nft_trans type confusion
    addaba68018b vlan: fix a potential uninit-value in vlan_dev_hard_start_xmit()
    3a0450d38a3e igb: fix bit_shift to be in [1..8] range
    c15c3bb90c9a net: dsa: mv88e6xxx: Fix mv88e6393x EPC write command offset
    234e744d86bd cassini: Fix a memory leak in the error handling path of cas_init_one()
    76a7cd047b3a scsi: storvsc: Don't pass unused PFNs to Hyper-V host
    05ad5a4d421c wifi: iwlwifi: mvm: don't trust firmware n_channels
    d66490c29364 wifi: iwlwifi: mvm: fix cancel_delayed_work_sync() deadlock
    fce7d92a8990 wifi: mac80211: fix min center freq offset tracing
    fd8bc0f581af net: bcmgenet: Restore phy_stop() depending upon suspend/close
    99c5acfd1f6a net: bcmgenet: Remove phy_stop() from bcmgenet_netif_stop()
    ed1283c46d90 s390/cio: include subchannels without devices also for evaluation
    673cb4798921 tipc: check the bearer min mtu properly when setting it by netlink
    575e84d90a74 tipc: do not update mtu if msg_max is too small in mtu negotiation
    5cf99d5f656a tipc: add tipc_bearer_min_mtu to calculate min mtu
    6a7690f2bd17 virtio_net: Fix error unwinding of XDP initialization
    18c0bd6888b3 virtio-net: Maintain reverse cleanup order
    cdd8160dcda1 net: nsh: Use correct mac_offset to unwind gso skb in nsh_gso_segment()
    f51d15d9bc41 drm/exynos: fix g2d_open/close helper function definitions
    45a158a212d9 SUNRPC: Fix trace_svc_register() call site
    1c28b206ae49 SUNRPC: always free ctxt when freeing deferred request
    54832355b0b1 SUNRPC: Remove svc_rqst::rq_xprt_hlen
    7a1dca013124 SUNRPC: Remove dead code in svc_tcp_release_rqst()
    9712097e89b2 SUNRPC: Clean up svc_deferred_class trace events
    8c26ecd887ef tracing: Introduce helpers to safely handle dynamic-sized sockaddrs
    7851771789e8 SUNRPC: double free xprt_ctxt while still in use
    051af3f0b7d1 media: netup_unidvb: fix use-after-free at del_timer()
    8e37baf62181 net: hns3: fix reset delay time to avoid configuration timeout
    aaf7c7d8448f net: hns3: fix sending pfc frames after reset issue
    56640004ee56 net: hns3: fix output information incomplete for dumping tx queue info with debugfs
    98e964801811 erspan: get the proto with the md version for collect_md
    5258395e67fe serial: 8250_bcm7271: fix leak in `brcmuart_probe`
    cc2f7cee933f serial: 8250_bcm7271: balance clk_enable calls
    f76a18e53a66 serial: arc_uart: fix of_iomap leak in `arc_serial_probe`
    15251e783a4b tcp: fix possible sk_priority leak in tcp_v4_send_reset()
    2832d6244634 vsock: avoid to close connected socket after the timeout
    2c1617dc6dab ALSA: hda/realtek: Apply HP B&O top speaker profile to Pavilion 15
    bbb5ac533ca6 ALSA: firewire-digi00x: prevent potential use after free
    81c843152422 net: phy: dp83867: add w/a for packet errors seen with short cables
    c1bc2870f14e net: fec: Better handle pm_runtime_get() failing in .remove()
    b598e76b49cc selftets: seg6: disable rp_filter by default in srv6_end_dt4_l3vpn_test
    5041897b9f0f selftests: seg6: disable DAD on IPv6 router cfg for srv6_end_dt4_l3vpn_test
    d6c89d776be2 af_key: Reject optional tunnel/BEET mode templates in outbound policies
    19457a4423a3 cpupower: Make TSC read per CPU for Mperf monitor
    3a4ff14b0ecb ASoC: fsl_micfil: Fix error handler with pm_runtime_enable
    a2e5a77ae3c3 dt-bindings: display/msm: dsi-controller-main: Document qcom, master-dsi and qcom, sync-dual-dsi
    e1c9c7482e31 drm/msm/dpu: Remove duplicate register defines from INTF
    85eb9aef4fb5 drm/msm/dpu: Move non-MDP_TOP INTF_INTR offsets out of hwio header
    b688a4115bdf drm/msm/dpu: Add INTF_5 interrupts
    d8a291e39af2 drm/msm/dp: unregister audio driver during unbind
    288247879f4e Revert "Fix XFRM-I support for nested ESP tunnels"
    46f1a953545f xfrm: don't check the default policy if the policy allows the packet
    98f179c5b072 platform/x86: hp-wmi: add micmute to hp_wmi_keymap struct
    a832a43fdd95 platform/x86: Move existing HP drivers to a new hp subdir
    df14d64b36b1 platform/x86: hp-wmi: Support touchpad on/off
    6158e958e824 parisc: Replace regular spinlock with spin_trylock on panic path
    1fa3fb4f7018 mfd: dln2: Fix memory leak in dln2_probe()
    c9faa002ea4b soundwire: qcom: gracefully handle too many ports in DT
    b61382a825c0 phy: st: miphy28lp: use _poll_timeout functions for waits
    dc9c54d34dbd Input: xpad - add constants for GIP interface numbers
    92c089a931fd iommu/sprd: Release dma buffer to avoid memory leak
    a2bc5241ee14 iommu/arm-smmu-v3: Acknowledge pri/event queue overflow if any
    aa50d0a460cc clk: tegra20: fix gcc-7 constant overflow warning
    20f9bfc664d6 fs/ntfs3: Fix a possible null-pointer dereference in ni_clear()
    85afd3007465 fs/ntfs3: Add length check in indx_get_root
    2a67f26f70ab fs/ntfs3: Validate MFT flags before replaying logs
    d4b744825295 fs/ntfs3: Fix NULL dereference in ni_write_inode
    1fd5b80c9339 fs/ntfs3: Enhance the attribute size check
    6d3d3283e6b4 fs/ntfs3: Fix NULL pointer dereference in 'ni_write_inode'
    8ebcbd1811b8 iommu/arm-smmu-qcom: Limit the SMR groups to 128
    036e02dfd515 RDMA/core: Fix multiple -Warray-bounds warnings
    ff70ad9159fb recordmcount: Fix memory leaks in the uwrite function
    f3458b84c627 sched: Fix KCSAN noinstr violation
    0652b54957ff mcb-pci: Reallocate memory region to avoid memory overlapping
    1ba5594739d8 serial: 8250: Reinit port->pm on port specific driver unbind
    ee009c2abc44 usb: typec: tcpm: fix multiple times discover svids error
    973f84956b2c HID: wacom: generic: Set battery quirk only when we see battery data
    b2069cfe1b33 spi: spi-imx: fix MX51_ECSPI_* macros when cs > 3
    6293d0533cfe HID: logitech-hidpp: Reconcile USB and Unifying serials
    3f1719790cc3 HID: logitech-hidpp: Don't use the USB serial for USB devices
    a97e60bd2896 staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
    116b9c002c89 Bluetooth: L2CAP: fix "bad unlock balance" in l2cap_disconnect_rsp
    392a06f965fe Bluetooth: hci_bcm: Fall back to getting bdaddr from EFI if not set
    c018360885f0 Bluetooth: btintel: Add LE States quirk support
    7aa14a7a3a85 ipvs: Update width of source for ip_vs_sync_conn_options
    52851d0c3354 nbd: fix incomplete validation of ioctl arg
    3d3f8fe01a01 wifi: ath11k: Fix SKB corruption in REO destination ring
    87940e4030e4 wifi: iwlwifi: dvm: Fix memcpy: detected field-spanning write backtrace
    35e304dbcefa null_blk: Always check queue mode setting from configfs
    82f877ec9b04 wifi: iwlwifi: pcie: Fix integer overflow in iwl_write_to_user_buf
    7545f21eee13 wifi: iwlwifi: pcie: fix possible NULL pointer dereference
    095018267c87 bpf: Add preempt_count_{sub,add} into btf id deny list
    e3e6e252d74f samples/bpf: Fix fout leak in hbm's run_bpf_prog
    e2759a59a4cc f2fs: fix to check readonly condition correctly
    d8f4ad5f3979 f2fs: fix to drop all dirty pages during umount() if cp_error is set
    613f6cde5ebb ext4: Fix best extent lstart adjustment logic in ext4_mb_new_inode_pa()
    bc4a3e1d07a8 ext4: set goal start correctly in ext4_mb_normalize_request
    203e8875d294 scsi: ufs: ufs-pci: Add support for Intel Lunar Lake
    71ee06193ed7 gfs2: Fix inode height consistency check
    e84282efc87f scsi: message: mptlan: Fix use after free bug in mptlan_remove() due to race condition
    c6ed54dd9069 lib: cpu_rmap: Avoid use after free on rmap->obj array entries
    1911cca5916b scsi: target: iscsit: Free cmds before session free
    a6f9f53d73bf net: Catch invalid index in XPS mapping
    e3644d15d74a net: pasemi: Fix return type of pasemi_mac_start_tx()
    d5eaf2a6b077 bnxt: avoid overflow in bnxt_get_nvram_directory()
    f91037487036 scsi: lpfc: Prevent lpfc_debugfs_lockstat_write() buffer overflow
    99f8a15af6c9 ext2: Check block size validity during mount
    e242c66f7ecf wifi: brcmfmac: cfg80211: Pass the PMK in binary instead of hex
    fe913db2acef bpf: Annotate data races in bpf_local_storage
    aa186074b6f2 wifi: ath: Silence memcpy run-time false positive warning
    9f87ee85ce1d media: Prefer designated initializers over memset for subdev pad ops
    66acfe798cd0 drm/amd: Fix an out of bounds error in BIOS parser
    d997c920a530 ACPICA: ACPICA: check null return of ACPI_ALLOCATE_ZEROED in acpi_db_display_objects
    3a7a4aa3958c ACPICA: Avoid undefined behavior: applying zero offset to null pointer
    0aa3d558f14e drm/msm/dp: Clean up handling of DP AUX interrupts
    33cc6ef106c9 drm/tegra: Avoid potential 32-bit integer overflow
    19882a49b242 remoteproc: stm32_rproc: Add mutex protection for workqueue
    f4a573eed637 ACPI: EC: Fix oops when removing custom query handlers
    66caf2278771 firmware: arm_sdei: Fix sleep from invalid context BUG
    162a9b321538 memstick: r592: Fix UAF bug in r592_remove due to race condition
    dcf632bca424 media: pci: tw68: Fix null-ptr-deref bug in buf prepare and finish
    f0a06203f2fe media: cx23885: Fix a null-ptr-deref bug in buffer_prepare() and buffer_finish()
    c12733784112 arm64: dts: qcom: msm8996: Add missing DWC3 quirks
    15856ab95617 regmap: cache: Return error in cache sync operations for REGCACHE_NONE
    e9c5fc4f3f35 drm/amd/display: Use DC_LOG_DC in the trasform pixel function
    9fd5be74b38f drm/displayid: add displayid_get_header() and check bounds better
    37cab61a52d6 fs: hfsplus: remove WARN_ON() from hfsplus_cat_{read,write}_inode()
    e30a55e98ae6 rcu: Protect rcu_print_task_exp_stall() ->exp_tasks access
    718b66c5eb65 refscale: Move shutdown from wait_event() to wait_event_idle()
    620a3c28221b ext4: allow ext4_get_group_info() to fail
    99f7ce0fac22 ext4: allow to find by goal if EXT4_MB_HINT_GOAL_ONLY is set
    1de53f2223eb ext4: fix lockdep warning when enabling MMP
    c53936d9fb35 ext4: don't clear SB_RDONLY when remounting r/w until quota is re-enabled
    3f937d6615dd ext4: reflect error codes from ext4_multi_mount_protect() to its callers
    1284253ce95a ext4: remove an unused variable warning with CONFIG_QUOTA=n
    96b3233f42fb fbdev: arcfb: Fix error handling in arcfb_probe()
    33b5890dfaf2 drm/i915/dp: prevent potential div-by-zero
    a41559ae3681 af_unix: Fix data races around sk->sk_shutdown.
    610fd07c1370 af_unix: Fix a data race of sk->sk_receive_queue->qlen.
    62d43dd14b1d net: datagram: fix data-races in datagram_poll()
    7c8be27727fe ipvlan:Fix out-of-bounds caused by unclear skb->cb
    3c9d916e39ef gve: Remove the code of clearing PBA bit
    43d938a82ed1 tcp: add annotations around sk->sk_shutdown accesses
    9dd9ffe11841 net: add vlan_get_protocol_and_depth() helper
    538b511bc54e net: deal with most data-races in sk_wait_event()
    159a81d5e5a9 net: annotate sk->sk_err write from do_recvmmsg()
    1d5c8b01f1df netlink: annotate accesses to nlk->cb_running
    1a2b27f2d7ac netfilter: conntrack: fix possible bug_on with enable_hooks=1
    8d56f00c61f6 netfilter: nf_tables: always release netdev hooks from notifier
    de260d1e02cd net: Fix load-tearing on sk->sk_stamp in sock_recv_cmsgs().
    5f5549b99828 net: stmmac: Initialize MAC_ONEUS_TIC_COUNTER register
    b0a513ba5b28 net: stmmac: switch to use interrupt for hw crosstimestamping
    46e100be0f02 linux/dim: Do nothing if no time delta between samples
    2fdce3e52dc3 tick/broadcast: Make broadcast device replacement work correctly
    6e455b89f02c scsi: ufs: core: Fix I/O hang that occurs when BKOPS fails in W-LUN suspend
    b614567e0dd8 net: mdio: mvusb: Fix an error handling path in mvusb_mdio_probe()
    da3cd1a81d4e ARM: 9296/1: HP Jornada 7XX: fix kernel-doc warnings
    ac88a1f41f93 drm/mipi-dsi: Set the fwnode for mipi_dsi_device

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index e2915849bc..f49623a2cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2424be7d485ac0bbcbca912b1a6cd4a79e5bab38"
-SRCREV_meta ?= "397c9face7f492ea6c6047499afcf6ef387d0513"
+SRCREV_machine ?= "613a261b361c2f0d1e1428ad02dffe4e81d1a24b"
+SRCREV_meta ?= "957ddf5f9d4bf5791e88a46ce9ec4352a6d0a171"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.112"
+LINUX_VERSION ?= "5.15.113"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 41e656293d..1981d6e5ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.112"
+LINUX_VERSION ?= "5.15.113"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b521a0dd3eb1941526d1cc853a81c60182f08e10"
-SRCREV_meta ?= "397c9face7f492ea6c6047499afcf6ef387d0513"
+SRCREV_machine ?= "cad8d3fd06feec26840453ddfd483216b4cf5b51"
+SRCREV_meta ?= "957ddf5f9d4bf5791e88a46ce9ec4352a6d0a171"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 7f236d3753..6213763295 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9d59e27807dc264aa457efb8f808d5d246af0de2"
-SRCREV_machine:qemuarm64 ?= "795baaef531bf613f908372e46f0aa02e7f0c033"
-SRCREV_machine:qemumips ?= "240c1a6921778edceeddb57c666c1ad39eb99ab8"
-SRCREV_machine:qemuppc ?= "e62acaa3576f120915a766812d4f57e9b472d132"
-SRCREV_machine:qemuriscv64 ?= "4d4b7f0ffa7c815225722b8a3c8fe2fd3ebdb796"
-SRCREV_machine:qemuriscv32 ?= "4d4b7f0ffa7c815225722b8a3c8fe2fd3ebdb796"
-SRCREV_machine:qemux86 ?= "4d4b7f0ffa7c815225722b8a3c8fe2fd3ebdb796"
-SRCREV_machine:qemux86-64 ?= "4d4b7f0ffa7c815225722b8a3c8fe2fd3ebdb796"
-SRCREV_machine:qemumips64 ?= "943c52494237f510c59592bc3c10858b1fde736c"
-SRCREV_machine ?= "4d4b7f0ffa7c815225722b8a3c8fe2fd3ebdb796"
-SRCREV_meta ?= "397c9face7f492ea6c6047499afcf6ef387d0513"
+SRCREV_machine:qemuarm ?= "8f55d1b405ec36812e15592bec1a471c4afa8dfa"
+SRCREV_machine:qemuarm64 ?= "6f43cd2bf083a3a6d77edd2ddd275b9c6c3adf63"
+SRCREV_machine:qemumips ?= "942912a383bbb5b1edb362c1da8f328c50e8e16a"
+SRCREV_machine:qemuppc ?= "9b2cc2b52ad546d07bcef0d6c76e657ff46140ce"
+SRCREV_machine:qemuriscv64 ?= "934b0d629afd6e3bf31fcaeada9828b1f13dbd91"
+SRCREV_machine:qemuriscv32 ?= "934b0d629afd6e3bf31fcaeada9828b1f13dbd91"
+SRCREV_machine:qemux86 ?= "934b0d629afd6e3bf31fcaeada9828b1f13dbd91"
+SRCREV_machine:qemux86-64 ?= "934b0d629afd6e3bf31fcaeada9828b1f13dbd91"
+SRCREV_machine:qemumips64 ?= "570b02954e1cf598ba8792aa6127ddde7f2af647"
+SRCREV_machine ?= "934b0d629afd6e3bf31fcaeada9828b1f13dbd91"
+SRCREV_meta ?= "957ddf5f9d4bf5791e88a46ce9ec4352a6d0a171"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "9d6bde853685609a631871d7c12be94fdf8d912e"
+SRCREV_machine:class-devupstream ?= "1fe619a7d25218e9b9fdcce9fcac6a05cd62abed"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.112"
+LINUX_VERSION ?= "5.15.113"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


