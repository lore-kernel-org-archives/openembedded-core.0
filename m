Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63DE8C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 14:43:50 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.51666.1743086628112733439
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 07:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=07GRkN6u;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22548a28d0cso31097175ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 07:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743086627; x=1743691427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZ7FROtOHFVE/xbFbbjDd7MdpUf3aPJ1T+6C/DalNvg=;
        b=07GRkN6uQelRy5EpEPZNg4c7rmEiQPmUBznjGydPFCwNFOTYK1V+B0IXlS0T04nTJ/
         gSo4bi9+rLkpJ2DoAjptgkefTqxKhz0PZG0vPAum+ObQOyFwtWiXJRtoJuErU1BLBK3o
         GP5qKqWjGYMjzEM6LROGtJn6i1Yx1TVHspO5CdMubHNX1gV/iJHAz8Ab3q0LvfS/wHxw
         4Jgfn5fyL8DIFm3WTv/1ISTGPoyzVoXICEs8XKXxnhYdNRxKKHs7trF1+VXWfyQJd6y3
         tzfOyvH/+T/vLz4ibPr266vi9P0Ql+CTGjmhh89/TM1F1Wa7JsoqOGQzzPLKcFydrzzw
         99Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086627; x=1743691427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ7FROtOHFVE/xbFbbjDd7MdpUf3aPJ1T+6C/DalNvg=;
        b=GyVFXJBplOhFBWtRPyRbIWjohYe1MxdztBA32D5fZX3VQO5DnnxhkJGAErLN6PNNan
         xoXj6P5dbhrk3HbTp2hoYTVLk3dMig5ogkuReICAcsG5PxZ0HyDVMQOGxyYm7DSldfWs
         6R0g0W249SrD8rxps/FuCt0O6vQEmvJzrYBRpBqAKOjEy1EFmdMaqPE9S1YNGufF2duM
         v/qg8Hy87xfnyJ6fIKCQWU7Ca8IBu6HJ5/jHKAkGjLbi8K3tAAKcKOn+TMVBw3cvlwMW
         B4xtxMAEEsJA+CcwELHwJhELPBPd4n3HLWPqSBTbScrlDHHRcxUy56akI5zEeuo+NRNR
         3FFg==
X-Gm-Message-State: AOJu0Yybb7XJmFbEKX+RU2CvOHh/vyH78ETRNZ3LFH5vNkjSdvFpGlaP
	4GnSqILFTqDtcVnc2Ww2F2l1jcTuDjFSt4HWuFLN1sCSdxM8AUVKxGEOM6W9I6ll/A3q1lDp9wr
	8
X-Gm-Gg: ASbGncsnC0hCm+U2ojRviIjZ0yRSffVHI0vRt5snjSODDs5NgFzrKzA9Is8pyXLL4K7
	L+k2Tw8QExiTA2sSjhD+80t2RtJYe0df3zFe/ifH/L/MVA74n0VXDs0OTNs0d7vo0YaFiG+51QA
	mqiefDrJF/QNM8TFwxjrbc5AtRGME9ytt7ksyOLmMFcOshmO+3nYIqUvMTxDvFIIP720a79TaoN
	LaV+Iv8sRD0LA5U36aM7AFOTjJSbW5rARmVCPvqlRL0yHnYOo1qZKzRNq1YJknzLP7bIz6lk15+
	sSWdX7/Qz0SvPTTwOhH/JG9GlZhnT79j9tg=
X-Google-Smtp-Source: AGHT+IFSwnjTUhx68rgWskD5i4gxdOv+Pu0t+q9mWXGEGvtiI3IY2midgekhypgovBROwRrTKQSHYw==
X-Received: by 2002:a05:6a21:3992:b0:1fd:e9c8:b8c3 with SMTP id adf61e73a8af0-1fea2ef612fmr5518721637.26.1743086626175;
        Thu, 27 Mar 2025 07:43:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:811c:968e:2c1:6363])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618e5absm14819074b3a.175.2025.03.27.07.43.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:43:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/4] linux-yocto/5.15: update to v5.15.179
Date: Thu, 27 Mar 2025 07:43:29 -0700
Message-ID: <8d6940f6a2c5fb81d3ed8dafb95b52a013174a57.1743086467.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743086467.git.steve@sakoman.com>
References: <cover.1743086467.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 14:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213756

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    0c935c049b5c Linux 5.15.179
    bf500b0d0cfe net: ipv6: fix dst refleaks in rpl, seg6 and ioam6 lwtunnels
    02e43735932d kbuild: userprogs: use correct lld when linking through clang
    bb0245fa72b7 sched: sch_cake: add bounds checks to host bulk flow fairness counts
    bab61f41c942 vsock: Orphan socket after transport release
    e48fcb403c2d vsock: Keep the binding until socket destruction
    857428f4acc1 bpf, vsock: Invoke proto::close on close()
    117f7a2975ba media: uvcvideo: Remove dangling pointers
    0fdd7cc59338 media: uvcvideo: Fix crash during unbind if gpio unit is in use
    607dc724b162 nilfs2: handle errors that nilfs_prepare_chunk() may return
    e5606b783307 nilfs2: eliminate staggered calls to kunmap in nilfs_rename
    1fa500f494f1 nilfs2: move page release outside of nilfs_delete_entry and nilfs_set_link
    1cd7fd082c78 spi-mxs: Fix chipselect glitch
    cd0938805875 mtd: rawnand: cadence: fix unchecked dereference
    3e9899c12d5a md: select BLOCK_LEGACY_AUTOLOAD
    1a7c8039d2ee media: uvcvideo: Avoid returning invalid controls
    69b06b05ff94 media: uvcvideo: Avoid invalid memory access
    4e15cf870d2c drivers: virt: acrn: hsm: Use kzalloc to avoid info leak in pmcmd_ioctl
    ade9362dec18 eeprom: digsy_mtc: Make GPIO lookup table match the device
    7746f3bb8917 bus: mhi: host: pci_generic: Use pci_try_reset_function() to avoid deadlock
    09d34c4cbc38 slimbus: messaging: Free transaction ID in delayed interrupt scenario
    1437d13ca83e intel_th: pci: Add Panther Lake-P/U support
    cebbd798ff25 intel_th: pci: Add Panther Lake-H support
    8875af55b825 intel_th: pci: Add Arrow Lake support
    e1651332291e mei: me: add panther lake P DID
    cf46f88b92cf Squashfs: check the inode number is not the invalid value of zero
    ac9a7d4c9007 usb: xhci: Enable the TRB overfetch quirk on VIA VL805
    41eae5d6e308 xhci: pci: Fix indentation in the PCI device ID definitions
    c3a772540220 usb: gadget: Check bmAttributes only if configuration is valid
    7e6b36d92dce usb: gadget: Fix setting self-powered state on suspend
    2b229d7b8a59 usb: gadget: Set self-powered based on MaxPower and bmAttributes
    a0dc4a3bdede usb: typec: tcpci_rt1711h: Unmask alert interrupts to fix functionality
    3d8b87be73e9 usb: typec: ucsi: increase timeout for PPM reset operations
    00ac1ea9c0cd usb: dwc3: gadget: Prevent irq storm when TH re-executes
    78669d6f45a5 usb: dwc3: Set SUSPENDENABLE soon after phy init
    bf4409f84023 usb: atm: cxacru: fix a flaw in existing endpoint checks
    3248c1f833f9 usb: renesas_usbhs: Flush the notify_hotplug_work
    a1ad97347a45 usb: quirks: Add DELAY_INIT and NO_LPM for Prolific Mass Storage Card Reader
    894b4c75eadf usb: hub: lack of clearing xHC resources
    ec4b6f492ea1 usb: renesas_usbhs: Use devm_usb_get_phy()
    50b9010da101 usb: renesas_usbhs: Call clk_put()
    30e37db26120 Revert "drivers/card_reader/rtsx_usb: Restore interrupt based detection"
    329393a0325b gpio: rcar: Fix missing of_node_put() call
    f185b6d0aeea net: ipv6: fix missing dst ref drop in ila lwtunnel
    82043c99801e net: ipv6: fix dst ref loop in ila lwtunnel
    5cb300dcdd27 sched/fair: Fix potential memory corruption in child_cfs_rq_on_list
    49bf31477184 net-timestamp: support TCP GSO case for a few missing flags
    413e908f13ce exfat: fix soft lockup in exfat_clear_bitmap
    6d099f3f7b27 x86/sgx: Fix size overflows in sgx_encl_create()
    a2d112a3b408 x86/sgx: Support VA page allocation without reclaiming
    51e5bc6d39d1 x86/sgx: Export sgx_encl_{grow,shrink}()
    48fa260f15b6 x86/sgx: Move PTE zap code to new sgx_zap_enclave_ptes()
    110a40c51415 x86/sgx: Support loading enclave page without VMA permissions check
    0fb7aa04c19e vlan: enforce underlying device type
    4e2191b0fd0c ppp: Fix KMSAN uninit-value warning with bpf
    b7d8d4529984 net: hns3: make sure ptp clock is unregister and freed if hclge_ptp_get_cycle returns an error
    671aaa17bd31 be2net: fix sleeping while atomic bugs in be_ndo_bridge_getlink
    3f9e7298053c drm/sched: Fix preprocessor guard
    e9813e0887fe hwmon: fix a NULL vs IS_ERR_OR_NULL() check in xgene_hwmon_probe()
    9b6f083db141 llc: do not use skb_get() before dev_queue_xmit()
    e2eebbb52d15 ALSA: usx2y: validate nrpacks module parameter on probe
    afa9cd90e765 hwmon: (ad7314) Validate leading zero bits and return error
    996340f3db89 hwmon: (ntc_thermistor) Fix the ncpXXxh103 sensor table
    13de3056e38c hwmon: (pmbus) Initialise page count in pmbus_identify()
    8e4e08ca4cc6 caif_virtio: fix wrong pointer check in cfv_probe()
    455217ac9db0 net: gso: fix ownership in __udp_gso_segment
    17451b795002 nvmet-tcp: Fix a possible sporadic response drops in weakly ordered arch
    01b18a330cda HID: intel-ish-hid: Fix use-after-free issue in ishtp_hid_remove()
    4283afde4f8d HID: google: fix unused variable warning under !CONFIG_ACPI
    47616b82f2d4 wifi: iwlwifi: limit printed string from FW file
    b4739de37538 mm: don't skip arch_sync_kernel_mappings() in error paths
    955c5a1ddd6e mm/page_alloc: fix uninitialized variable
    51e0101ab9e9 block: fix conversion of GPT partition name to 7-bit
    03f075d56063 s390/traps: Fix test_monitor_call() inline assembly
    cdd9f58f7fe4 rapidio: fix an API misues when rio_add_net() fails
    181d4daaefb3 rapidio: add check for rio_add_net() in rio_scan_alloc_net()
    cd1bdcb77fdc wifi: nl80211: reject cooked mode if it is set along with other flags
    6a5e3b23054c wifi: cfg80211: regulatory: improve invalid hints checking
    d8786dfa9f45 x86/cpu: Properly parse CPUID leaf 0x2 TLB descriptor 0x63
    61104ea20840 x86/cpu: Validate CPUID leaf 0x2 EDX output
    dafc649de271 x86/cacheinfo: Validate CPUID leaf 0x2 EDX output
    421c91ba9099 platform/x86: thinkpad_acpi: Add battery quirk for ThinkPad X131e
    63c2c523f5ca drm/radeon: Fix rs400_gpu_init for ATI mobility radeon Xpress 200M
    ffcc3f070263 ALSA: hda/realtek: update ALC222 depop optimize
    6ea0f0a47640 ALSA: hda: intel: Add Dell ALC3271 to power_save denylist
    807789018186 gpio: aggregator: protect driver attr handlers against module unload
    7c1f36f9c9ac gpio: rcar: Use raw_spinlock to protect register access
    b1d95d733cd6 HID: appleir: Fix potential NULL dereference at raw event handle
    a3325fdbee9b Revert "of: reserved-memory: Fix using wrong number of cells to get property 'alignment'"
    6486abfcf891 drm/amdgpu: disable BAR resize on Dell G5 SE
    4be891399cdc drm/amdgpu: Check extended configuration space register when system uses large bar
    f618aeb6cad2 smb: client: Add check for next_buffer in receive_encrypted_standard()
    a56a6e8589a9 pfifo_tail_enqueue: Drop new packet when sch->limit == 0
    e38f9d761b34 intel_idle: Handle older CPUs, which stop the TSC in deeper C states, correctly
    288fdb8dcb71 sched/core: Prevent rescheduling when interrupts are disabled
    3d67976d304e vmlinux.lds: Ensure that const vars with relocations are mapped R/O
    7cca31035c05 mptcp: always handle address removal under msk socket lock
    b66eb3f54ac3 phy: exynos5-usbdrd: fix MPLL_MULTIPLIER and SSC_REFCLKSEL masks in refclk
    f07c325f54c4 phy: tegra: xusb: reset VBUS & ID OVERRIDE
    d20b23a5412c net: enetc: correct the xdp_tx statistics
    ccce797d9052 net: enetc: update UDP checksum when updating originTimestamp field
    b68d88b79975 net: enetc: fix the off-by-one issue in enetc_map_tx_buffs()
    9bcb8cbc3e5d usbnet: gl620a: fix endpoint checking in genelink_bind()
    e3aea1dba97d i2c: npcm: disable interrupt enable bit before devm_request_irq
    c327a355a4ff drm/amd/display: Fix HPD after gpu reset
    922e18d67bc0 perf/core: Fix low freq setting via IOC_PERIOD
    fca3b89abc92 ALSA: usb-audio: Re-add sample rate quirk for Pioneer DJM-900NXS2
    3d738b53ed6c ftrace: Avoid potential division by zero in function_stat_show()
    7163da88c07b x86/CPU: Fix warm boot hang regression on AMD SC1100 SoC systems
    2daabaa55c7c net: ipv6: fix dst ref loop on input in rpl lwt
    c0b11dc50590 net: ipv6: rpl_iptunnel: mitigate 2-realloc issue
    dbd4f89a4a58 net: ipv6: fix dst ref loop on input in seg6 lwt
    634710a372ba net: ipv6: seg6_iptunnel: mitigate 2-realloc issue
    8513e56e31fc include: net: add static inline dst_dev_overhead() to dst.h
    3e97606c954f seg6: add support for SRv6 H.L2Encaps.Red behavior
    86df97f030be seg6: add support for SRv6 H.Encaps.Red behavior
    bf5801cc24cc net/mlx5: IRQ, Fix null string in debug print
    b8e0dd7ff319 net: mvpp2: cls: Fixed Non IP flow, with vlan tag flow defination.
    0e70cec1839f tcp: Defer ts_recent changes until req is owned
    a3c25f8374c2 ipvs: Always clear ipvs_property flag in skb_scrub_packet()
    eba344580acb ASoC: es8328: fix route from DAC to output
    39a26120ad99 net: cadence: macb: Synchronize stats calculations
    718725496191 net: loopback: Avoid sending IP packets without an Ethernet header
    806fcc99e4c0 afs: Fix the server_list to unuse a displaced server rather than putting it
    9055fb0bb4f4 afs: Make it possible to find the volumes that are using a server
    ba335b157a6a afs: remove variable nr_servers
    1154e50e53e4 Bluetooth: L2CAP: Fix L2CAP_ECRED_CONN_RSP response
    a340768d7311 ALSA: usb-audio: Avoid dropping MIDI events at closing multiple ports
    a8f4ceb21f65 sunrpc: suppress warnings for unused procfs functions
    f36cf97e4978 RDMA/mlx5: Fix bind QP error cleanup flow
    66fee638e4dd scsi: core: Clear driver private data when retrying request
    668ef6c54ca7 scsi: core: Don't memset() the entire scsi_cmnd in scsi_init_command()
    4b49d939b5a7 ovl: fix UAF in ovl_dentry_update_reval by moving dput() in ovl_link_up
    802d342bf8bc ovl: pass ofs to creation operations
    be2343e08165 ovl: use wrappers to all vfs_*xattr() calls
    1cd7f84c88ae IB/mlx5: Set and get correct qp_num for a DCT QP
    9a7fc5641c6f x86/cpu/kvm: SRSO: Fix possible missing IBPB on VM-Exit
    b0c7cda8d636 mtd: rawnand: cadence: fix incorrect device in dma_unmap_single
    099a31651850 mtd: rawnand: cadence: use dma_map_resource for sdma address
    0301f9b44877 mtd: rawnand: cadence: fix error code in cadence_nand_init()
    29853440da38 acct: block access to kernel internal filesystems
    5d5b936cfa4b acct: perform last write from workqueue
    d97d560f7d36 ALSA: hda/conexant: Add quirk for HP ProBook 450 G4 mute LED
    924b239f9704 nfp: bpf: Add check for nfp_app_ctrl_msg_alloc()
    872c7c7e57a7 drop_monitor: fix incorrect initialization order
    c0a9a9481591 tee: optee: Fix supplicant wait loop
    a3feeb1b4cb2 bpf: skip non exist keys in generic_map_lookup_batch
    3bb2204ec30f nvme/ioctl: add missing space in err message
    9f3891867e8e power: supply: da9150-fg: fix potential overflow
    ef305447885e arp: switch to dev_getbyhwaddr() in arp_req_set_public()
    e860d5103591 net: Add non-RCU dev_getbyhwaddr() helper
    2af45b1f2962 flow_dissector: Fix port range key handling in BPF conversion
    fbb727e4934a flow_dissector: Fix handling of mixed port and port-range keys
    65196ee66ec2 net: extract port range fields from fl_flow_key
    a94e59db1d89 geneve: Suppress list corruption splat in geneve_destroy_tunnels().
    cb15bb1bde0b gtp: Suppress list corruption splat in gtp_net_exit_batch_rtnl().
    f74f65601467 geneve: Fix use-after-free in geneve_find_dev().
    6847b3e40bb9 powerpc/code-patching: Fix KASAN hit by not flagging text patching area as VM_ALLOC
    718d0480ca3a ALSA: hda/realtek: Fixup ALC225 depop procedure
    71f427413d2d powerpc/64s: Rewrite __real_pte() and __rpte_to_hidx() as static inline
    61a45806db46 powerpc/64s/mm: Move __real_pte stubs into hash-4k.h
    b09957657d77 USB: gadget: f_midi: f_midi_complete to call queue_work
    006a4e9069a1 usb: dwc3: Fix timeout issue during controller enter/exit from halt state
    47cc53c3ebe3 usb: dwc3: Increase DWC3 controller halt timeout
    3c0e0aecb78c batman-adv: Drop unmanaged ELP metric worker
    6ad063461332 batman-adv: Drop initialization of flexible ethtool_link_ksettings
    d775f9e9e663 media: uvcvideo: Only save async fh if success
    e0360e009904 media: uvcvideo: Refactor iterators
    972f412da53b media: uvcvideo: Set error_idx during ctrl_commit errors
    c113bccf1f87 soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove
    c3fa28e6cac8 soc/mediatek: mtk-devapc: Convert to platform remove callback returning void
    4dd78251db13 soc: mediatek: mtk-devapc: Fix leaking IO map on error paths
    10185d020c8f soc: mediatek: mtk-devapc: Switch to devm_clk_get_enabled()
    f03ad378249f kfence: skip __GFP_THISNODE allocations on NUMA systems
    8e19db074ab3 kfence: enable check kfence canary on panic via boot param
    b7792fe79fbe kfence: allow use of a deferrable timer
    0621d2599d6e tpm: Change to kvalloc() in eventlog/acpi.c
    906ac470b16c tpm: Use managed allocation for bios event log
    5e8bee0e4914 arm64: dts: mediatek: mt8183: Disable DSI display output by default
    4a06ed6b962b ASoC: renesas: rz-ssi: Add a check for negative sample_space
    8c4b9b0c3950 drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()
    5211d75e2cb7 drm/probe-helper: Create a HPD IRQ event helper for a single connector
    f3b9fb276459 ksmbd: fix integer overflows on 32 bit systems
    a9042dbc1ed4 memcg: fix soft lockup in the OOM process
    4edae3ff6d4e mm: update mark_victim tracepoints fields
    a32ba399a030 media: imx-jpeg: Fix potential error pointer dereference in detach_pm()
    e290d1fe37f7 crypto: testmgr - some more fixes to RSA test vectors
    add54f963938 crypto: testmgr - populate RSA CRT parameters in RSA test vectors
    40689219a28b crypto: testmgr - fix version number of RSA tests
    bd258be9a8be crypto: testmgr - Fix wrong test case of RSA
    8fbf27a746c3 crypto: testmgr - fix wrong key length for pkcs1pad
    4969dcc05bc3 arm64: mte: Do not allow PROT_MTE on MAP_HUGETLB user mappings
    c4041b6b0a7a pps: Fix a use-after-free
    26f2fdc47fea btrfs: avoid monopolizing a core when activating a swap file
    dc550af962b7 Revert "btrfs: avoid monopolizing a core when activating a swap file"
    caae54426402 x86/i8253: Disable PIT timer 0 when not in use
    3aa5254d8096 f2fs: fix to wait dio completion
    234549fb3db3 ARM: dts: dra7: Add bus_dma_limit for l4 cfg bus
    c97306464928 selftests: rtnetlink: update netdevsim ipsec output format
    28435f5d9d08 netdevsim: print human readable IP address
    810109436b28 parport_pc: add support for ASIX AX99100
    79cf08014ef3 serial: 8250_pci: add support for ASIX AX99100
    1840fb92baf4 can: ems_pci: move ASIX AX99100 ids to pci_ids.h
    d8ff250e085a nilfs2: protect access to buffers with no active references
    f51ff43c4c5a nilfs2: do not force clear folio if buffer is referenced
    1bf43414ccff nilfs2: do not output warnings when clearing dirty buffers
    c6ddb3848599 alpha: replace hardcoded stack offsets with autogenerated ones
    5fb8cda2fcea x86/static-call: Remove early_boot_irqs_disabled check to fix Xen PVH dom0
    9c0a3aab4b8d kdb: Do not assume write() callback available
    22e19c8c5f6b drm/v3d: Stop active perfmon if it is being destroyed
    37054243cf5d drm/tidss: Clear the interrupt status for interrupts being disabled
    2b7db8abf84f drm/tidss: Fix issue in irq handling causing irq-flood issue
    29fa42197f26 ipv6: mcast: add RCU protection to mld_newpack()
    e24d225e4cb8 ndisc: extend RCU protection in ndisc_send_skb()
    a884f57600e4 openvswitch: use RCU protection in ovs_vport_cmd_fill_info()
    d9366ac2f956 arp: use RCU protection in arp_xmit()
    40d8f2f2a373 neighbour: use RCU protection in __neigh_notify()
    44e359552378 neighbour: delete redundant judgment statements
    b870256dd2a5 ndisc: use RCU protection in ndisc_alloc_skb()
    28de355b63ad ipv6: use RCU protection in ip6_default_advmss()
    ce3c6165fce0 ipv4: use RCU protection in __ip_rt_update_pmtu()
    fc07a232326a net: ipv4: Cache pmtu for all packet paths if multipath enabled
    a7246d3949c2 selftest: net: Test IPv4 PMTU exceptions with DSCP and ECN
    7385291def47 Namespaceify mtu_expires sysctl
    686792179f20 Namespaceify min_pmtu sysctl
    4561343d2b6c ipv4: use RCU protection in inet_select_addr()
    50d356db0542 ipv4: use RCU protection in rt_is_expired()
    6e0d21491686 net: add dev_net_rcu() helper
    c22b8d77816e net: treat possible_net_t net pointer as an RCU one and add read_pnet_rcu()
    0e5ea98edc3b ipv4: add RCU protection to ip4_dst_hoplimit()
    60f54f0d4ea5 clocksource: Use migrate_disable() to avoid calling get_random_u32() in atomic context
    a02540d4401f clocksource: Use pr_info() for "Checking clocksource synchronization" message
    4ae5e361537d clocksource: Replace cpumask_weight() with cpumask_empty()
    acfebfb2abf3 btrfs: fix hole expansion when writing at an offset beyond EOF
    e4291f26c501 mlxsw: Add return value check for mlxsw_sp_port_get_stats_raw()
    9abfb2c8693d arm64: Handle .ARM.attributes section in linker scripts
    78be8f779b20 regmap-irq: Add missing kfree()
    40a35d14f3c0 partitions: mac: fix handling of bogus partition table
    4647cb4e0013 gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock
    ede3fa7b0cb6 alpha: align stack for page fault and user unaligned trap handlers
    bf3f395b9c37 serial: 8250: Fix fifo underflow on flush
    19f3e16bc9f7 cgroup: fix race between fork and cgroup.kill
    4d832459170d efi: Avoid cold plugged memory for placing the kernel
    b737d6439113 alpha: make stack 16-byte aligned (most cases)
    f1767d255807 can: j1939: j1939_sk_send_loop(): fix unable to send messages with data length zero
    f7a43d1563ac can: c_can: fix unbalanced runtime PM disable in error path
    9fccb6b65510 USB: serial: option: drop MeiG Smart defines
    412458d7e92b USB: serial: option: fix Telit Cinterion FN990A name
    60f0765d673b USB: serial: option: add Telit Cinterion FN990B compositions
    95fcacb5b9a9 USB: serial: option: add MeiG Smart SLM828
    6878c61a3880 usb: cdc-acm: Fix handling of oversized fragments
    871619c2b78f usb: cdc-acm: Check control transfer buffer size before access
    9ee5bb1938f3 USB: cdc-acm: Fill in Renesas R-Car D3 USB Download mode quirk
    d3a67adb365c USB: hub: Ignore non-compliant devices with too many configs or interfaces
    d8e86700c8a8 usb: gadget: f_midi: fix MIDI Streaming descriptor lengths
    aeda961736f3 USB: Add USB_QUIRK_NO_LPM quirk for sony xperia xz1 smartphone
    6afdad04f6c1 USB: quirks: add USB_QUIRK_NO_LPM quirk for Teclast dist
    b605fd13b832 usb: core: fix pipe creation for get_bMaxPacketSize0
    1af4043ec5bc USB: pci-quirks: Fix HCCPARAMS register error for LS7A EHCI
    ef5e915db375 usb: dwc2: gadget: remove of_node reference upon udc_stop
    626ab15ddc4b usb: gadget: udc: renesas_usb3: Fix compiler warning
    6a902573f2ca usb: roles: set switch registered flag early on
    f4ca0cf536b1 perf/x86/intel: Ensure LBRs are disabled when a CPU is starting
    45fa526b0f5a KVM: x86: Reject Hyper-V's SEND_IPI hypercalls if local APIC isn't in-kernel
    2e8f0f0e0097 batman-adv: Ignore neighbor throughput metrics in error case
    f0a16c6c7976 batman-adv: fix panic during interface removal
    6b7d69806c42 ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet 5V
    8725882b0f69 orangefs: fix a oob in orangefs_debug_write
    848b58151775 x86/mm/tlb: Only trim the mm_cpumask once a second
    cd8de1f521d5 Grab mm lock before grabbing pt lock
    69b812149b8b vfio/pci: Enable iowrite64 and ioread64 for vfio pci
    20b7d9675437 PCI/DPC: Quirk PIO log size for Intel Raptor Lake-P
    59a707ad952e media: vidtv: Fix a null-ptr-deref in vidtv_mux_stop_thread
    d485a8b22794 media: cxd2841er: fix 64-bit division on gcc-9
    ba842a609ff8 x86/xen: allow larger contiguous memory regions in PV guests
    5b750e76dfd5 xen: remove a confusing comment on auto-translated guest I/O
    d340047cf29b gpio: bcm-kona: Add missing newline to dev_err format string
    f66a5da15f14 gpio: bcm-kona: Make sure GPIO bits are unlocked when requesting IRQ
    54b0de7b6abe gpio: bcm-kona: Fix GPIO lock/unlock for banks above bank 0
    092dc83b9a3c drm/i915/selftests: avoid using uninitialized context
    88a3e6afaf00 arm64: cacheinfo: Avoid out-of-bounds write to cacheinfo array
    f443687ad20c team: better TEAM_OPTION_TYPE_STRING validation
    5bb4228c3226 vrf: use RCU protection in l3mdev_l3_out()
    80f70686857e ndisc: ndisc_send_redirect() must use dev_get_by_index_rcu()
    2052b44cd0a6 HID: multitouch: Add NULL check in mt_input_configured
    efa8a261c575 NFSD: fix hang in nfsd4_shutdown_callback
    6f7cfee1a316 nfsd: clear acl_access/acl_default after releasing them
    e22a97700901 tty: xilinx_uartps: split sysrq handling
    59cf03ddf127 mptcp: prevent excessive coalescing on receive
    03b605ac1e5b ocfs2: check dir i_size in ocfs2_find_entry
    ad73b43e6908 memory: tegra20-emc: Correct memory device mask
    12a1cf9db178 gpio: xilinx: remove excess kernel doc
    9772e2e15482 net/ncsi: use dev_set_mac_address() for Get MC MAC Address handling
    3fec5d194fc9 MIPS: ftrace: Declare ftrace_get_parent_ra_addr() as static
    1334c64a5d1d ptp: Ensure info->enable callback is always set
    0eda6b12a108 net: phy: c45-tjaxx: add delay between MDIO write and read in soft_reset
    83db3d545d39 net/ncsi: wait for the last response to Deselect Package before configuring channel
    2ed6d46f8037 misc: fastrpc: Fix registered buffer page address
    820603335006 mtd: onenand: Fix uninitialized retlen in do_otp_read()
    10b3f947b609 NFC: nci: Add bounds checking in nci_hci_create_pipe()
    8f41df5fd4c1 nilfs2: fix possible int overflows in nilfs_fiemap()
    8aee4184c5b7 ocfs2: handle a symlink read error correctly
    5a1c86066f1b ocfs2: fix incorrect CPU endianness conversion causing mount failure
    c00e53672d7d pnfs/flexfiles: retry getting layout segment for reads
    f65ce06387f8 vfio/platform: check the bounds of read/write syscalls
    66325de71801 nvmem: core: improve range check for nvmem_cell_write()
    c897de3d1f4d nvmem: qcom-spmi-sdam: Set size in struct nvmem_config
    f52f00efd8c0 crypto: qce - unregister previously registered algos in error path
    efae52c61150 crypto: qce - fix goto jump in error path
    14810fb99091 media: uvcvideo: Remove redundant NULL assignment
    74512c021525 media: uvcvideo: Fix event flags in uvc_ctrl_send_events
    1662c5812b84 media: ccs: Fix cleanup order in ccs_probe()
    66a2c461703e media: ccs: Fix CCS static data parsing for large block sizes
    d6fae50f5eb7 media: ov5640: fix get_light_freq on auto
    9a6c627f3fe4 media: mc: fix endpoint iteration
    9e6cd5f99496 soc: qcom: smem_state: fix missing of_node_put in error path
    1880c45ebe14 iio: light: as73211: fix channel handling in only-color triggered buffer
    22d1dcd0b053 media: ccs: Clean up parsed CCS static data on parse failure
    6bdbb75ffc6c xfs: Add error handling for xfs_reflink_cancel_cow_range
    4e9af1ddbc98 crypto: qce - fix priority to be less than ARMv8 CE
    231dfd6bb61e arm64: dts: qcom: sm8350: Fix MPSS memory length
    e7e06872144e x86/boot: Use '-std=gnu11' to fix build with GCC 15
    81a3a0c1a68f kbuild: Move -Wenum-enum-conversion to W=2
    2bce0a6a4433 scsi: storvsc: Set correct data length for sending SCSI command without payload
    73d3d3c66f10 scsi: qla2xxx: Move FCE Trace buffer allocation to user control
    ad88fd9ee93a nvme-pci: Add TUXEDO IBP Gen9 to Samsung sleep quirk
    662964484f8a nvme-pci: Add TUXEDO InfinityFlex to Samsung sleep quirk
    d88422ccb97f PCI: endpoint: Finish virtual EP removal in pci_epf_remove_vepf()
    abe03cd5d5b7 ALSA: hda/realtek: Enable headset mic on Positivo C6400
    94e418935e1d Revert "media: uvcvideo: Require entities to have a non-zero unique ID"
    d24476777e8b mips/math-emu: fix emulation of the prefx instruction
    63b759c9680e dm-crypt: track tag_offset in convert_context
    84d6db1a7327 dm-crypt: don't update io->sector after kcryptd_crypt_write_io_submit()
    453a0a22ceb8 powerpc/pseries/eeh: Fix get PE state translation
    a3d92e7af72a MIPS: Loongson64: remove ROM Size unit in boardinfo
    48a6a4dfa5c8 serial: sh-sci: Do not probe the serial port if its slot in sci_ports[] is in use
    6b7947990681 serial: sh-sci: Drop __initdata macro for port_cfg
    2d09d3c9afa2 soc: qcom: socinfo: Avoid out of bounds read of serial number
    5fa25ae6484b usb: gadget: f_tcm: Don't prepare BOT write request twice
    d5e48551866e usb: gadget: f_tcm: ep_autoconfig with fullspeed endpoint
    45956a34f9a8 usb: gadget: f_tcm: Decrement command ref count on cleanup
    93facdc47dc6 usb: gadget: f_tcm: Translate error to sense
    61541d9b5a23 wifi: brcmfmac: fix NULL pointer dereference in brcmf_txfinalize()
    7f44aa9d3960 wifi: rtlwifi: rtl8821ae: Fix media status report
    e27d77db198a HID: hid-sensor-hub: don't use stale platform-data on remove
    c0a158e7634a of: reserved-memory: Fix using wrong number of cells to get property 'alignment'
    4f7c0deea1b3 of: Fix of_find_node_opts_by_path() handling of alias+path+options
    87141db6d148 of: Correct child specifier used as input of the 2nd nexus node
    a0d751d2d8ec perf bench: Fix undefined behavior in cmpworker()
    be042a185cc5 efi: libstub: Use '-std=gnu11' to fix build with GCC 15
    38287f779b34 blk-cgroup: Fix class @block_class's subsystem refcount leakage
    44bd016cbaa3 clk: qcom: clk-rpmh: prevent integer overflow in recalc_rate
    4e2996526679 clk: qcom: gcc-mdm9607: Fix cmd_rcgr offset for blsp1_uart6 rcg
    175af15551ed clk: qcom: gcc-sm6350: Add missing parent_map for two clocks
    4d8d1f443a6c clk: qcom: clk-alpha-pll: fix alpha mode configuration
    45d563356db6 clk: sunxi-ng: a100: enable MMC clock reparenting
    f26831839566 Bluetooth: L2CAP: accept zero as a special value for MTU auto-selection
    cf601a24120c Bluetooth: L2CAP: handle NULL sock pointer in l2cap_sock_alloc
    250164081da0 drm/i915: Drop 64bpp YUV formats from ICL+ SDR planes
    5098970ecc1d drm/komeda: Add check for komeda_get_layer_fourcc_list()
    e89f74ef6bee drm/amd/pm: Mark MM activity as unsupported
    224fa21f00fc KVM: s390: vsie: fix some corner-cases when grabbing vsie pages
    7c4899239d0f KVM: Explicitly verify target vCPU is online in kvm_get_vcpu()
    b0e8b635a331 arm64: dts: rockchip: increase gmac rx_delay on rk3399-puma
    bc8ca18b8ef4 binfmt_flat: Fix integer overflow bug on 32 bit systems
    20ecbadad51a m68k: vga: Fix I/O defines
    592ffb238132 s390/futex: Fix FUTEX_OP_ANDN implementation
    61b4e072b7e8 drm/modeset: Handle tiled displays in pan_display_atomic.
    4e2de62318b9 leds: lp8860: Write full EEPROM, not only half of it
    fc7da1095247 cpufreq: s3c64xx: Fix compilation warning
    4defa9ebef14 tun: revert fix group permission check
    98a2c685293a netem: Update sch->q.qlen before qdisc_tree_reduce_backlog()
    d85d721f3225 x86/xen: add FRAME_END to xen_hypercall_hvm()
    aaa15fc4291b x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
    d308661a0f4e net: rose: lock the socket in rose_bind()
    5bb48702e946 net: atlantic: fix warning during hot unplug
    a6f3981d04d1 gpio: pca953x: Improve interrupt support
    61e7e18fa64c udp: gso: do not drop small packets when PMTU reduces
    540ffff7925b tg3: Disable tg3 PCIe AER on system reboot
    712e6ed39e5c gpu: drm_dp_cec: fix broken CEC adapter properties check
    256768b17e62 firmware: iscsi_ibft: fix ISCSI_IBFT Kconfig entry
    51df156e04e5 nvme: handle connectivity loss in nvme_set_queue_count
    cf30300a216a usb: xhci: Fix NULL pointer dereference on certain command aborts
    b27f10764d80 usb: xhci: Add timeout argument in address_device USB HCD callback
    d31d3dc92775 xfs: don't over-report free space or inodes in statvfs
    bd015e2e7f26 xfs: report realtime block quota limits on realtime directories
    d25041d4a3b2 gpio: xilinx: Convert gpio_lock to raw spinlock
    4489cce8e4e7 net/ncsi: fix locking in Get MAC Address handling
    8930834d1525 net/ncsi: Add NC-SI 1.2 Get MC MAC Address command
    3f46fefab962 usb: chipidea: ci_hdrc_imx: decrement device's refcount in .remove() and in the error path of .probe()
    998b1fa6c218 usb: chipidea/ci_hdrc_imx: Convert to platform remove callback returning void
    9794ea40979b usb: chipidea: ci_hdrc_imx: use dev_err_probe()
    af431197516a x86/mm: Don't disable PCID when INVLPG has been fixed by microcode
    c56ea30db33d platform/x86: acer-wmi: Ignore AC events
    78a88a1690bc Input: allocate keycode for phone linking
    b191b2b3b5ad selftests/net/ipsec: Fix Null pointer dereference in rtattr_pack()
    f213bb330fc6 tipc: re-order conditions in tipc_crypto_key_rcv()
    c9b80829b001 mmc: sdhci-msm: Correctly set the load for the regulator
    4dddb00d0397 net: wwan: iosm: Fix hibernation by re-binding the driver around it
    5c60cdcff102 APEI: GHES: Have GHES honor the panic= setting
    3fa04850ddac i2c: Force ELAN06FA touchpad I2C bus freq to 100KHz
    0bae6625cabc wifi: iwlwifi: avoid memory leak
    578845229c4e net/mlx5: use do_aux_work for PHC overflow checks
    463f5f6402b9 HID: Wacom: Add PCI Wacom device support
    c16b96035c48 mfd: lpc_ich: Add another Gemini Lake ISA bridge PCI device-id
    b2bd5857a0d6 tomoyo: don't emit warning in tomoyo_write_control()
    d280a12e9b87 wifi: brcmsmac: add gain range check to wlc_phy_iqcal_gainparams_nphy()
    bafaee99fc23 mmc: core: Respect quirk_max_rate for non-UHS SDIO card
    9b560350aa7b tun: fix group permission check
    ecf6a4a55809 safesetid: check size of policy writes
    bb8ff054e19f printk: Fix signed integer overflow when defining LOG_BUF_LEN_MAX
    99795e62e7a5 x86/amd_nb: Restrict init function to AMD-based systems
    23434fcf90b9 lockdep: Fix upper limit for LOCKDEP_*_BITS configs
    56135262c1f9 sched: Don't try to catch up excess steal time.
    13dae4fa17be btrfs: convert BUG_ON in btrfs_reloc_cow_block() to proper error handling
    367b72fa18b0 btrfs: fix data race when accessing the inode's disk_i_size at btrfs_drop_extents()
    7e954b6bb95d btrfs: fix use-after-free when attempting to join an aborted transaction
    51bcf530c6dc btrfs: output the reason for open_ctree() failure
    bbb7f49839b5 usb: gadget: f_tcm: Don't free command immediately
    3ba8884a56a3 media: uvcvideo: Fix double free in error path
    3a7fda57b0f9 mptcp: consolidate suboption status
    83a3a5aeb1b1 usb: typec: tcpci: Prevent Sink disconnection before vPpsShutdown in SPR PPS
    bb52bce4c91c usb: typec: tcpm: set SRC_SEND_CAPABILITIES timeout to PD_T_SENDER_RESPONSE
    16d5669ff07f usb: dwc3: core: Defer the probe until USB power supply ready
    2cfbf53baeaf usb: gadget: f_tcm: Fix Get/SetInterface return value
    3c1f8dfa01b3 drivers/card_reader/rtsx_usb: Restore interrupt based detection
    d42168f109f9 net: usb: rtl8150: enable basic endpoint checking
    10eff770fd16 ALSA: usb-audio: Add delay quirk for iBasso DC07 Pro
    deec230cb835 ktest.pl: Check kernelrelease return in get_version
    5083a7ae4500 netfilter: nf_tables: reject mismatching sum of field_len with set key length
    d712ca4807ce NFSD: Reset cb_seq_status after NFS4ERR_DELAY
    b0938ffd39ae f2fs: Introduce linear search for dentries
    679bb865c881 hexagon: Fix unbalanced spinlock in die()
    8e83dbe9ff32 hexagon: fix using plain integer as NULL pointer warning in cmpxchg
    4bd72d9fe11d kconfig: fix memory leak in sym_warn_unmet_dep()
    5f45a419bdd1 kconfig: WERROR unmet symbol dependency
    ccc1287a02ea kconfig: deduplicate code in conf_read_simple()
    3e31777acf2d kconfig: remove unused code for S_DEF_AUTO in conf_read_simple()
    131f1604fa6b kconfig: require a space after '#' for valid input
    6bdf078908c3 kconfig: add warn-unknown-symbols sanity check
    4780a614f013 kconfig: fix file name in warnings when loading KCONFIG_DEFCONFIG_LIST
    c48b8fc7f0a8 genksyms: fix memory leak when the same symbol is read from *.symref file
    bb28d02726ab genksyms: fix memory leak when the same symbol is added from source
    13310513f549 net: hsr: fix fill_frame_info() regression vs VLAN packets
    df3398504b97 net: sh_eth: Fix missing rtnl lock in suspend/resume path
    3ce32a9fb1d2 bgmac: reduce max frame size to support just MTU 1500
    ab2df791b1d4 vsock: Allow retrying on connect() failure
    a48ebcd853a4 perf trace: Fix runtime error of index out of bounds
    0dd6c67f6cfe ptp: Properly handle compat ioctls
    7d7d201eb3b7 net: davicom: fix UAF in dm9000_drv_remove
    cfb17f637562 net: netdevsim: try to close UDP port harness races
    1409b45d4690 net: rose: fix timer races against user threads
    c499bd77ca2a PM: hibernate: Add error handling for syscore_suspend()
    547ef7e8cbb9 ipmr: do not call mr_mfc_uses_dev() for unres entries
    6468f3a9842f net: fec: implement TSO descriptor cleanup
    5934bfaeaffe gpio: mxc: remove dead code after switch to DT-only
    8c640dd3d900 net: hns3: fix oops when unload drivers paralleling
    1787cd67bb94 ubifs: skip dumping tnc tree when zroot is null
    e5536677da80 rtc: pcf85063: fix potential OOB write in PCF85063 NVMEM read
    2943af7d72d7 dmaengine: ti: edma: fix OF node reference leaks in edma_driver
    c9cc70bca158 xfrm: replay: Fix the update of replay_esn->oseq_hi for GSO
    6be3ea508111 tools/bootconfig: Fix the wrong format specifier
    26e5c3c8d780 NFSv4.2: mark OFFLOAD_CANCEL MOVEABLE
    edcaf4156ced NFSv4.2: fix COPY_NOTIFY xdr buf size calculation
    f6bae8cc42ab module: Extend the preempt disabled section in dereference_symbol_descriptor().
    2e2bb52b8e58 ocfs2: mark dquot as inactive if failed to start trans while releasing dquot
    fe761befd845 scsi: ufs: bsg: Delete bsg_dev when setting up bsg fails
    13186db840b9 scsi: mpt3sas: Set ioc->manu_pg11.EEDPTagMode directly to 1
    6987e021b64c PCI: rcar-ep: Fix incorrect variable used when calling devm_request_mem_region()
    68ee578e6e31 staging: media: imx: fix OF node leak in imx_media_add_of_subdevs()
    6f3c167de057 mtd: hyperbus: hbmc-am654: fix an OF node reference leak
    784a7f4a9efb mtd: hyperbus: hbmc-am654: Convert to platform remove callback returning void
    c1aea4faa984 mtd: hyperbus: Make hyperbus_unregister_device() return void
    3b86841430a6 media: uvcvideo: Propagate buf->error to userspace
    235ab2be3572 media: camif-core: Add check for clk_enable()
    cc0d04ae127d media: mipi-csis: Add check for clk_enable()
    5bdd8b64153d media: i2c: ov9282: Correct the exposure offset
    8ab5c3af1406 media: i2c: imx412: Add missing newline to prints
    333f8f9b6667 media: marvell: Add check for clk_enable()
    a61cd3df84b3 PCI: endpoint: Destroy the EPC device in devm_pci_epc_destroy()
    55c326068f6b media: lmedm04: Handle errors for lme2510_int_read
    8bea20f4d630 media: rc: iguanair: handle timeouts
    0486d65804cc efi: sysfb_efi: fix W=1 warnings when EFI is not set
    8049a0845bfc of: reserved-memory: Do not make kmemleak ignore freed address
    ca36f0848eb8 memblock: drop memblock_free_early_nid() and memblock_free_early()
    d26e179d2cac xen/x86: free_p2m_page: use memblock_free_ptr() to free a virtual pointer
    708ce479ff3c RDMA/mlx5: Fix indirect mkey ODP page count
    95b4474c93a0 RDMA/mlx5: Enforce umem boundaries for explicit ODP page faults
    fe090e183d26 RDMA/mlx5: Remove iova from struct mlx5_core_mkey
    b9c5f50926e3 fbdev: omapfb: Fix an OF node leak in dss_of_port_get_parent_device()
    96cd8661f225 ARM: dts: mediatek: mt7623: fix IR nodename
    311afb2be167 arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
    eb3e76baaf1b arm64: dts: qcom: sm8150-microsoft-surface-duo: fix typos in da7280 properties
    312e11fc5060 arm64: dts: qcom: sm8350: correct sleep clock frequency
    8fbb052b3bd3 arm64: dts: qcom: sm8250: correct sleep clock frequency
    c990f5e0b2cb arm64: dts: qcom: sm6125: correct sleep clock frequency
    88c84e743d4c arm64: dts: qcom: sc7280: correct sleep clock frequency
    afc66a233ad9 arm64: dts: qcom: msm8994: correct sleep clock frequency
    9cc46ab94b61 arm64: dts: qcom: msm8916: correct sleep clock frequency
    09153a482e90 arm64: dts: qcom: msm8994: Describe USB interrupts
    31952ff5833c arm64: dts: qcom: msm8996: Fix up USB3 interrupts
    ea7232a05e10 arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop pp3300_panel voltage settings
    c3def10c610a memory: tegra20-emc: fix an OF node reference bug in tegra_emc_find_node_by_ram_code()
    d9f36f957bb2 memory: tegra20-emc: Support matching timings by LPDDR2 configuration
    0f3c0d94c815 memory: Add LPDDR2-info helpers
    4274acb5b996 arm64: dts: mediatek: mt8183: willow: Support second source touchscreen
    cba8c5daa9d8 arm64: dts: mediatek: mt8183: kenzo: Support second source touchscreen
    d098183961e0 arm64: dts: mediatek: mt8173-evb: Fix MT6397 PMIC sub-node names
    b9a5544dbad5 arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC sub-node names
    032c92e01aaa arm64: dts: mediatek: mt8173-elm: Drop regulator-compatible property
    2a28a21a925f arm64: dts: mediatek: mt8173-evb: Drop regulator-compatible property
    e53ca458f543 rdma/cxgb4: Prevent potential integer overflow on 32bit
    160450e4908b RDMA/mlx4: Avoid false error about access to uninitialized gids array
    f92f10cdb7fa arm64: dts: mediatek: mt8516: reserve 192 KiB for TF-A
    52a976a83dda arm64: dts: mediatek: mt8516: add i2c clock-div property
    6047c27de667 arm64: dts: mediatek: mt8516: remove 2 invalid i2c clocks
    bcc6c817e2ad arm64: dts: mediatek: mt8516: fix wdt irq type
    3ad0e4e15581 arm64: dts: mediatek: mt8516: fix GICv2 range
    9792f0c9880a arm64: dts: mt8183: set DMIC one-wire mode on Damu
    abbb15f54a35 ARM: at91: pm: change BU Power Switch to automatic mode
    4c6209efea22 padata: avoid UAF for reorder_work
    035ed9577b48 padata: add pd get/put refcnt helper
    f3e0b9f790f8 padata: fix UAF in padata_reorder
    e306eaaa3d78 bpf: Send signals asynchronously if !preemptible
    d6becd34dc65 perf report: Fix misleading help message about --demangle
    54b587874a7c perf top: Don't complain about lack of vmlinux when not resolving some kernel samples
    ca0b62b2dc9a padata: fix sysfs store callback check
    b467ed29b586 crypto: ixp4xx - fix OF node reference leaks in init_ixp_crypto()
    778a73f8d38d crypto: hisilicon/sec2 - fix for aead invalid authsize
    37e032978e55 crypto: hisilicon/sec2 - fix for aead icv error
    017b2680816b crypto: hisilicon/sec2 - optimize the error return process
    8f268c476c83 crypto: hisilicon/sec - delete redundant blank lines
    0db426905cb4 crypto: hisilicon/sec - add some comments for soft fallback
    4086792b8883 ktest.pl: Remove unused declarations in run_bisect_test function
    4c45f82e101a ASoC: renesas: rz-ssi: Use only the proper amount of dividers
    49c5d851a2bf perf bpf: Fix two memory leakages when calling perf_env__insert_bpf_prog_info()
    ac026a0ba486 perf header: Fix one memory leakage in process_bpf_prog_info()
    11491bb26fd9 perf header: Fix one memory leakage in process_bpf_btf()
    d79fc69eda73 ASoC: sun4i-spdif: Add clock multiplier settings
    6a5d02ae6ff8 libbpf: Fix segfault due to libelf functions not setting errno
    3c99e59404f3 tools/testing/selftests/bpf/test_tc_tunnel.sh: Fix wait for server bind
    b8583b54455c net/rose: prevent integer overflows in rose_setsockopt()
    3cfabbb18810 tcp_cubic: fix incorrect HyStart round start detection
    ed8c0300f302 net: ethernet: ti: am65-cpsw: fix freeing IRQ in am65_cpsw_nuss_remove_tx_chns()
    920f736e6c64 netfilter: nft_flow_offload: update tcp state flags under lock
    38646749d6e1 net: sched: Disallow replacing of child qdisc from one parent to another
    26bc6076798a net: avoid race between device unregistration and ethnl ops
    f023bf675814 net/mlxfw: Drop hard coded max FW flash image size
    0e2f1d93d287 net: let net.core.dev_weight always be non-zero
    0cc8fc34df84 selftests/landlock: Fix error message
    78eadb30f5ce clk: analogbits: Fix incorrect calculation of vco rate delta
    7d07de96990e wifi: cfg80211: adjust allocation of colocated AP data
    7427e4afbd16 wifi: cfg80211: Handle specific BSSID in 6GHz scanning
    23b54d193a90 selftests: harness: fix printing of mismatch values in __EXPECT()
    28063f72460d cpufreq: ACPI: Fix max-frequency computation
    965e41a93fce wifi: mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
    a1fccf6b72b5 landlock: Handle weird files
    b32a42383c26 landlock: Move filesystem helpers and add a new one
    ba079f94cb0a net/smc: fix data error when recvmsg with MSG_PEEK flag
    9394c1163c20 wifi: wlcore: fix unbalanced pm_runtime calls
    a7e98a85990a samples/landlock: Fix possible NULL dereference in parse_path()
    332ee5fc52e1 regulator: of: Implement the unwind path of of_regulator_match()
    bd099a2fa9be team: prevent adding a device which is already a team device lower
    f5072f5c806f clk: imx8mp: Fix clkout1/2 support
    68fb4aafe3bb cpufreq: schedutil: Fix superfluous updates caused by need_freq_update
    0e833dc042b9 leds: netxbig: Fix an OF node reference leak in netxbig_leds_get_of_pdata()
    4efb30e564f2 dt-bindings: mfd: bd71815: Fix rsense and typos
    725d01fdde59 cpupower: fix TSC MHz calculation
    fc1750250f85 ACPI: fan: cleanup resources in the error path of .probe()
    f575806ef1da regulator: dt-bindings: mt6315: Drop regulator-compatible property
    a57bce750a52 HID: multitouch: fix support for Goodix PID 0x01e9
    25c30f902438 Revert "HID: multitouch: Add support for lenovo Y9000P Touchpad"
    8c52d33d88ef HID: multitouch: Add support for lenovo Y9000P Touchpad
    4c436e8bd326 wifi: rtlwifi: pci: wait for firmware loading before releasing memory
    b96371339fd9 wifi: rtlwifi: fix memory leaks and invalid access at probe error path
    0eea81f30c6e wifi: rtlwifi: destroy workqueue at rtl_deinit_core
    8e2fcc68fbaa wifi: rtlwifi: remove unused check_buddy_priv
    ed3d742c2204 wifi: rtlwifi: remove unused dualmac control leftovers
    c8951a13d626 wifi: rtlwifi: remove unused timer and related code
    5f945d2595cd rtlwifi: replace usage of found with dedicated list iterator variable
    94b4c15bca53 dt-bindings: leds: class-multicolor: Fix path to color definitions
    f045124251f5 dt-bindings: leds: class-multicolor: reference class directly in multi-led node
    594cb8eeac49 dt-bindings: leds: Add multicolor PWM LED bindings
    7c09f7ba7ad3 dt-bindings: leds: Optional multi-led unit address
    e547ede9d118 dt-bindings: leds: Add Qualcomm Light Pulse Generator binding
    621600ed2ce5 dt-bindings: Another pass removing cases of 'allOf' containing a '$ref'
    b220d6b97a8b spi: dt-bindings: add schema listing peripheral-specific properties
    efb8b60b7990 dt-bindings: mmc: controller: clarify the address-cells description
    4960235d6662 spi: zynq-qspi: Add check for clk_enable()
    5a80bbc5df58 wifi: rtlwifi: usb: fix workqueue leak when probe fails
    643c584528ce wifi: rtlwifi: fix init_sw_vars leak when probe fails
    284a6f64f4cf wifi: rtlwifi: wait for firmware loading before releasing memory
    949845dfdb9b wifi: rtlwifi: rtl8192se: rise completion of firmware loading as last step
    56e84ffaf3d8 wifi: rtlwifi: do not complete firmware loading needlessly
    eb288ab33fd8 ipmi: ipmb: Add check devm_kasprintf() returned value
    62f14b506f5b genirq: Make handle_enforce_irqctx() unconditionally available
    2396bc91935c drm/amdgpu: Fix potential NULL pointer dereference in atomctrl_get_smc_sclk_range_table
    a32ea3f982b3 HID: core: Fix assumption that Resolution Multipliers must be in Logical Collections
    c589074b64dd drm/etnaviv: Fix page property being used for non writecombine buffers
    c7971fc03a06 sched/fair: Fix value reported by hot tasks pulled in /proc/schedstat
    b3a5ff8c4b6e sched/psi: Use task->psi_flags to clear in CPU migration
    105ff3024397 afs: Fix the fallback handling for the YFS.RemoveFile2 RPC call
    0a60270ee48c select: Fix unbalanced user_access_end()
    b9ca509e5b7f partitions: ldm: remove the initial kernel-doc notation
    8714ecb8fa55 nvme: Add error check for xa_store in nvme_get_effects_log
    113563188f22 pstore/blk: trivial typo fixes
    e3be8862d73c nbd: don't allow reconnect after disconnect
    2d43a6fcea0e block: retry call probe after request_module in blk_request_module
    6327dacfe6d6 block: deprecate autoloading based on dev_t
    effcbfb1e5ea fs: fix proc_handler for sysctl_nr_open
    a3eff27900d0 fs: move fs stat sysctls to file_table.c
    ca5d118b213e fs: move inode sysctls to its own file
    548fae8fb904 sysctl: share unsigned long const values
    7584027c80dc sysctl: use const for typically used max/min proc sysctls
    d96a8f8e86d1 hung_task: move hung_task sysctl interface to hung_task.c
    f3cfafcdb5bb afs: Fix directory format encoding struct
    ef5f2706364d afs: Fix EEXIST error returned from afs_rmdir() to be ENOTEMPTY
    e0bb89c44b56 efi: libstub: Use '-std=gnu11' to fix build with GCC 15
    b5d500042eb3 usb: hcd-pci: remove the action of faking interrupt request
    6f0605db50e2 clk: imx: Add check for kcalloc
    5b837b9e1543 bpf: Fix the indention issue in grow_stack_state()
    42b62697634d cifs: Fix the calling of smb_version_operations::calc_smb_size()
    b14acf729e9d f2fs: Add inline to f2fs_build_fault_attr() stub
    7c317bec311f f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    81c12119c23f bpf: Fix accesses to uninit stack slots [ Upstream commit 6b4a64bafd107e521c01eec3453ce94a3fb38529 ]
    c4fa05422d87 smb: client: fix potential OOB in smb2_dump_detail()
    299ef3b5b00b of: module: add buffer overflow check in of_modalias()
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 2d78db3fdc..fa8c25c34c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e7c2ec263d8c16095369ddd7523a9514aeff11e8"
-SRCREV_meta ?= "853814dcf5cf386ac47bcc85ef384d2055c8a4e7"
+SRCREV_machine ?= "b3259cd1a23cad4b953927eff2ff3bb33455942c"
+SRCREV_meta ?= "896128cbf5fc140cad076227af3456cc38e8f442"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.178"
+LINUX_VERSION ?= "5.15.179"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index d9745fd21f..8204c85350 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.178"
+LINUX_VERSION ?= "5.15.179"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ac353b3cfa6ce5383c90fa9f3dc742fac5ee5ea4"
-SRCREV_meta ?= "853814dcf5cf386ac47bcc85ef384d2055c8a4e7"
+SRCREV_machine ?= "0add6cb84172889c436c78560713eaa3e86c4041"
+SRCREV_meta ?= "896128cbf5fc140cad076227af3456cc38e8f442"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 8759b69c37..98729e3a41 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "31fa49dbe9f3a64362078de6b59da96afcad718f"
-SRCREV_machine:qemuarm64 ?= "e46eb0a3250c9a5ee8ebea25a80298f693ae691c"
-SRCREV_machine:qemumips ?= "539bfe9f18782440707e86df545a47f425208797"
-SRCREV_machine:qemuppc ?= "c26ce5169b6964dcdafb09b4528c47b378f94528"
-SRCREV_machine:qemuriscv64 ?= "9026df72c466542d6a1592bdc12c9c8dfa54dd33"
-SRCREV_machine:qemuriscv32 ?= "9026df72c466542d6a1592bdc12c9c8dfa54dd33"
-SRCREV_machine:qemux86 ?= "9026df72c466542d6a1592bdc12c9c8dfa54dd33"
-SRCREV_machine:qemux86-64 ?= "9026df72c466542d6a1592bdc12c9c8dfa54dd33"
-SRCREV_machine:qemumips64 ?= "d633d7d27475d3615f5a33467c04b0b0cb14517c"
-SRCREV_machine ?= "9026df72c466542d6a1592bdc12c9c8dfa54dd33"
-SRCREV_meta ?= "853814dcf5cf386ac47bcc85ef384d2055c8a4e7"
+SRCREV_machine:qemuarm ?= "cf3b7736503d85cf402e004c050c50eea7a77e37"
+SRCREV_machine:qemuarm64 ?= "2bf9cba52f8924bdb2f0daba23ee62cc34d85622"
+SRCREV_machine:qemumips ?= "a29f88d7cef3c7da41cc1c801b50cd09a35e837d"
+SRCREV_machine:qemuppc ?= "db3626867d8d215297b745a95aea30881de96f72"
+SRCREV_machine:qemuriscv64 ?= "e3234082ae63e31dad3500dac02b90633079d79c"
+SRCREV_machine:qemuriscv32 ?= "e3234082ae63e31dad3500dac02b90633079d79c"
+SRCREV_machine:qemux86 ?= "e3234082ae63e31dad3500dac02b90633079d79c"
+SRCREV_machine:qemux86-64 ?= "e3234082ae63e31dad3500dac02b90633079d79c"
+SRCREV_machine:qemumips64 ?= "afef0f609941ca98d67ac6fcf4ca97d28a171243"
+SRCREV_machine ?= "e3234082ae63e31dad3500dac02b90633079d79c"
+SRCREV_meta ?= "896128cbf5fc140cad076227af3456cc38e8f442"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c16c81c81336c0912eb3542194f16215c0a40037"
+SRCREV_machine:class-devupstream ?= "0c935c049b5c196b83b968c72d348ae6fff83ea2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.178"
+LINUX_VERSION ?= "5.15.179"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


