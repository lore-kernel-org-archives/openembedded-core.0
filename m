Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3011ECCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:44:34 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.3294.1760733867117001617
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=M4WJPk3P;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-789fb76b466so2176589b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733866; x=1761338666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Var/G2fiRuYwxcFs9nSxO5lpvVNNykuahozaewzr1Bs=;
        b=M4WJPk3PQ9Oy1w0HHKEKHAt2wEsy+wq8RKkfB1VFlEt8i0PpSl5W+ZSMihlJfWOlGC
         LTuS8z4rImpOtoNYm0E/rWLQCaNMshtzpTdEOTToXEWPda079fN859WIsrqnMOR3SNLs
         rYBZDhMcZsX9uztBuRTFrnuzCVCeJyaX2yx5xZSpnR8OEEXZ7oahR2zJFLZudAfPTOTV
         DEXUp18axI8mBWMyiCvdzg+rM2Avq62QJwS+qr6GGgQtj5Qr7DAbJ+JjpXNULv19Mgam
         euqsebchWOYZvdcGgJTmt/XztvLpsB1eOQJvWVcW2iV2CDOj6QXnUaaeLcgYtOJonNPR
         aqMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733866; x=1761338666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Var/G2fiRuYwxcFs9nSxO5lpvVNNykuahozaewzr1Bs=;
        b=Gh4Z7T/h8+e7HltZ2IyTstuR6pRA+q5qQYcfJBOYeNODkrPpt/W5yv2NCKRekGr1cM
         xHWkPrPMX4RXRQQ0nJwhd80O0Vt6Ui2N198wNUivD1pxh4MMx9KghNEjWNVYDVZdE29X
         q/NRx2Kxev4G+n7g3rttFQH3ZDbAlMS1KzICtwubT6oQ1/jSzgOYjBWdt9sBXamUNjlT
         i2YpMT5XK6QdYqFI2FnOztTAEtw3I6kSpyhJK555M/OJKdpBew9MvJ8AUys+4de/Arhi
         W80+iaDnRU9x7xcpg1gDvbxGPHbHO1+cklD+FTl5nIEYfIlhZ9rRA3P/k4QEqlDRMYch
         9Miw==
X-Gm-Message-State: AOJu0YwcG/QCtUv3n8pq8OgT0yOUHq0wOFE+FjdouBRo4WKXHIPQWSBt
	sS7w19IdOu/FWiXFoGrkCXxCo9MDVCUpONMZntVJaqYEgcEL7BzN7tmhNEaKGLlo9/YpDAvJ6UI
	8StZTsSU=
X-Gm-Gg: ASbGncu0SGOF7AkDp7uzY8+sSWunsPkFCb7S+hGtpa+wLz/AJRa4H5tbTG/zFtfFAVt
	J5t5uS1GSTC9xrrppWoEOdCkqZIAIttxHjv++wwUvJbhJ8DVkXKuRvB1oCKR8VQ7AedjW2ieoxq
	7XZMCWbWaPIkEcwbSoGiwTE1VzGecfvKtAQ6lYbDaVkyMyBB7VOQ5qJm4dfyKpwF6MXUaORbpon
	Vmw+AMP5kc3eq26xARWOM1L0o6fp8oCDqqm6YrmGE2Z8PBXZ8lCOStJSB37c4t7CTsf/Y1yHV2D
	S0YjuThh1wlDqedg71D3+e6T7fCxJG3jt1fciq+amceEvCbVhJcZJrBYudzFqbAtYiGJKeu7/5/
	AN5VxqbEyDbiuuRto1Gl7tHOsufTcFeMd2ozXR7F8qaNM4gdN4n2JSetJj21PytZxBw==
X-Google-Smtp-Source: AGHT+IFDATTMRTOM08zFr4J1Ss3dz1KjDvBSBuaju9qxXdHhTc1fo7cwdvTpRmvh8ZjMPSzeJQyqaw==
X-Received: by 2002:a05:6a00:2d8d:b0:781:261b:7524 with SMTP id d2e1a72fcca58-7a220aa1dc7mr6841256b3a.14.1760733866183;
        Fri, 17 Oct 2025 13:44:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm477066b3a.70.2025.10.17.13.44.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:44:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] linux-yocto/5.15: update to v5.15.194
Date: Fri, 17 Oct 2025 13:44:06 -0700
Message-ID: <b75a820962588097058e528a7db9ccd04368d299.1760733724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733724.git.steve@sakoman.com>
References: <cover.1760733724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:44:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225068

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    29e53a5b1c4f1 Linux 5.15.194
    1c532dd246bf2 drm/i915/backlight: Return immediately when scale() finds invalid parameters
    45a7527cd7da4 i40e: add validation for ring_len param
    8043ca4882e77 i40e: increase max descriptors for XL710
    1fa0aadade344 i40e: fix idx validation in config queues msg
    8e35c80f85704 i40e: fix validation of VF state in get resources
    3e851448078f5 mm/hugetlb: fix folio is still mapped when deleted
    4f52f7c50f5b6 mm/migrate_device: don't add folio to be freed to LRU in migrate_device_finalize()
    523edfed4f68b af_unix: Don't leave consecutive consumed OOB skbs.
    ecbfd9ef5cf3e fbcon: Fix OOB access in font allocation
    b8a6e85328aeb fbcon: fix integer overflow in fbcon_do_set_font
    0d41604d2d53c tracing: dynevent: Add a missing lockdown check on dynevent
    1b1c3bdb8ab3f i40e: add mask to apply valid bits for itr_idx
    77a35be582dff i40e: add max boundary check for VF filters
    f8c8e11825b24 i40e: fix input validation logic for action_meta
    34dfac0c90482 i40e: fix idx validation in i40e_validate_queue_map
    d382d6daf0184 crypto: af_alg - Fix incorrect boolean values in af_alg_ctx
    e4c1ec11132ec crypto: af_alg - Disallow concurrent writes in af_alg_sendmsg
    e15de80737d44 drm/gma500: Fix null dereference in hdmi teardown
    37821b843e4e5 net: dsa: lantiq_gswip: suppress -EINVAL errors for bridge FDB entries added to the CPU port
    e8687ab9c8a11 net: dsa: lantiq_gswip: move gswip_add_single_port_br() call to port_setup()
    b9010dba5f36b net: dsa: lantiq_gswip: do also enable or disable cpu port
    cf2d597fb6f04 selftests: fib_nexthops: Fix creation of non-FDB nexthops
    0e7bfe7a268cc nexthop: Forbid FDB status change while nexthop is in a group
    5d4856a3717d6 bnxt_en: correct offset handling for IPv6 destination address
    d646358255b69 ethernet: rvu-af: Remove slash from the driver name
    48822a59ecc47 can: peak_usb: fix shift-out-of-bounds issue
    6eec67bfb2563 can: mcba_usb: populate ndo_change_mtu() to prevent buffer overflow
    60463a1c13890 can: sun4i_can: populate ndo_change_mtu() to prevent buffer overflow
    7ab85762274c0 can: hi311x: populate ndo_change_mtu() to prevent buffer overflow
    72de0facc50af can: etas_es58x: populate ndo_change_mtu() to prevent buffer overflow
    256b64f7a9ba0 can: etas_es58x: sort the includes by alphabetic order
    f44124f407a39 can: etas_es58x: advertise timestamping capabilities and add ioctl support
    0a6e1bd2d2500 can: dev: add generic function can_eth_ioctl_hwts()
    b9a0e6f3b043a can: dev: add generic function can_ethtool_op_get_ts_info_hwts()
    533e3220bac26 can: bittiming: replace CAN units with the generic ones from linux/units.h
    33b83a90b65e4 can: bittiming: allow TDC{V,O} to be zero and add can_tdc_const::tdc{v,o,f}_min
    d51c6b51981fa bpf: Reject bpf_timer for PREEMPT_RT
    9ebf862184569 can: rcar_can: rcar_can_resume(): fix s2ram with PSCI
    b32c64db4370c cpufreq: Initialize cpufreq-based invariance before subsys
    db28f975ed7f3 arm64: dts: imx8mp: Correct thermal sensor index
    bb3eeb3a7c749 IB/mlx5: Fix obj_type mismatch for SRQ event subscriptions
    825c17c54cfb2 usb: core: Add 0x prefix to quirks debug output
    9ba349a33f50e ALSA: usb-audio: Fix build with CONFIG_INPUT=n
    1746e7a74ca0b ALSA: usb-audio: Convert comma to semicolon
    b4b94f092f193 ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5
    4f9294613bb39 ALSA: usb-audio: Remove unneeded wmb() in mixer_quirks
    790b167e58570 ALSA: usb-audio: Simplify NULL comparison in mixer_quirks
    e4f6ae98ebd94 ALSA: usb-audio: Avoid multiple assignments in mixer_quirks
    a4bb77c1bab94 ALSA: usb-audio: Drop unnecessary parentheses in mixer_quirks
    2f56442a417d5 ALSA: usb-audio: Fix block comments in mixer_quirks
    ada2282259243 net: rfkill: gpio: Fix crash due to dereferencering uninitialized pointer
    98c2894580f42 net: rfkill: gpio: add DT support
    2f58e6d3e7a71 mptcp: propagate shutdown to subflows when possible
    773fddf976d28 ksmbd: smbdirect: validate data_offset and data_length field of smb_direct_data_transfer
    dde28a51b8c3a mptcp: set remote_deny_join_id0 on SYN recv
    ca9e4e6a87376 phy: ti: omap-usb2: fix device leak at unbind
    f5648527d2e88 phy: Use device_get_match_data()
    0df0f4bcc7a25 phy: broadcom: ns-usb3: fix Wvoid-pointer-to-enum-cast warning
    662b75f7d1bfb USB: gadget: dummy-hcd: Fix locking bug in RT-enabled kernels
    94fac8987bea7 usb: gadget: dummy_hcd: remove usage of list iterator past the loop body
    dbf216ae5aea8 xhci: dbc: Fix full DbC transfer ring after several reconnects
    503ba5026801b xhci: dbc: decouple endpoint allocation from initialization
    84870a62c48f7 serial: sc16is7xx: fix bug in flow control levels init
    dfca6fa9d174c drm: bridge: cdns-mhdp8546: Fix missing mutex unlock on error path
    51a501e990a35 drm: bridge: anx7625: Fix NULL pointer dereference with early IRQ
    79a06d96e73e4 ASoC: SOF: Intel: hda-stream: Fix incorrect variable used in error message
    e07847f44a0e0 ASoC: wm8974: Correct PLL rate rounding
    0235a5787e87b ASoC: wm8940: Correct typo in control name
    2e94bc6451cb6 rds: ib: Increment i_fastreg_wrs before bailing out
    9697890763328 KVM: SVM: Sync TPR from LAPIC into VMCB::V_TPR even if AVIC is active
    8a29726633978 mmc: mvsdio: Fix dma_unmap_sg() nents value
    4f935a1297080 btrfs: tree-checker: fix the incorrect inode ref size check
    29d9125d6c07f power: supply: bq27xxx: restrict no-battery detection to bq27000
    fe0f602a75cc9 power: supply: bq27xxx: fix error return in case of no bq27000 hdq battery
    40fb833c64cab nilfs2: fix CFI failure when accessing /sys/fs/nilfs2/features/*
    0405055930264 cnic: Fix use-after-free bugs in cnic_delete_task
    428c1dd78ef66 net: liquidio: fix overflow in octeon_init_instr_queue()
    3cae94808b2ff Revert "net/mlx5e: Update and set Xon/Xoff upon port speed set"
    33a4fdf0b4a25 tcp: Clear tcp_sk(sk)->fastopen_rsk in tcp_disconnect().
    17cb9b4017be7 i40e: remove redundant memory barrier when cleaning Tx descs
    95235d29cd8b0 net: natsemi: fix `rx_dropped` double accounting on `netif_rx()` failure
    e0e24571a7b2f qed: Don't collect too many protection override GRC elements
    e4343d400761c dpaa2-switch: fix buffer pool seeding for control traffic
    5e94e44c9cb30 um: virtio_uml: Fix use-after-free after put_device in probe
    f2795d1b92506 cgroup: split cgroup_destroy_wq into 3 workqueues
    f2ede1f9070cc pcmcia: omap_cf: Mark driver struct with __refdata to prevent section mismatch
    0f9cf94656d08 wifi: mac80211: fix incorrect type for ret
    d2587970f0887 ALSA: firewire-motu: drop EPOLLOUT from poll return values as write is not supported
    5f2f50aa44de7 net: hsr: hsr_slave: Fix the promiscuous mode in offload mode
    99f7048957f5a mm/memory-failure: fix VM_BUG_ON_PAGE(PagePoisoned(page)) when unpoison memory
    a8b0032687c74 drm/i915/power: fix size for for_each_set_bit() in abox iteration
    f1b349706538c drm/amdgpu: fix a memory leak in fence cleanup when unloading
    91b2c8ee68219 soc: qcom: mdt_loader: Deal with zero e_shentsize
    e3d490ff8d12e phy: ti-pipe3: fix device leak at unbind
    4de4344ed4164 phy: tegra: xusb: fix device and OF node leak at probe
    6ac1599d0e780 dmaengine: qcom: bam_dma: Fix DT error handling for num-channels/ees
    24a65b46cd663 hrtimers: Unconditionally update target CPU base after offline timer migration
    e90b685c5f2a8 hrtimer: Rename __hrtimer_hres_active() to hrtimer_hres_active()
    95b76ebeb0f14 hrtimer: Remove unused function
    5d5385feef357 regulator: sy7636a: fix lifecycle of power good gpio
    301a96cc4dc00 dmaengine: ti: edma: Fix memory allocation size for queue_priority_map
    810167fa6f34a hsr: use hsr_for_each_port_rtnl in hsr_port_get_hsr
    cedfcd09a338e hsr: use rtnl lock when iterating over ports
    1100242709d56 net: hsr: Add VLAN CTAG filter support
    7e0ef989aa6d4 net: hsr: Add support for MC filtering at the slave device
    d981b9680be2b net: hsr: Disable promiscuous mode in offload mode
    e202ffd9e5453 can: xilinx_can: xcan_write_frame(): fix use-after-free of transmitted SKB
    5cf37a6fcb61c can: j1939: j1939_local_ecu_get(): undo increment when j1939_local_ecu_get() fails
    3245eb9c25e94 can: j1939: j1939_sk_bind(): call j1939_priv_put() immediately when j1939_local_ecu_get() failed
    b9721a023df38 i40e: fix IRQ freeing in i40e_vsi_request_irq_msix error path
    7d9bd1c2bf4a7 i40e: Use irq_update_affinity_hint()
    e7ddb59a63cb8 genirq: Provide new interfaces for affinity hints
    582f5ce29adce igb: fix link test skipping when interface is admin down
    f39a12660ea88 tunnels: reset the GSO metadata before reusing the skb
    93a699d6e92cf net: fec: Fix possible NPD in fec_enet_phy_reset_after_clk_enable()
    e818c35296a4f USB: serial: option: add Telit Cinterion LE910C4-WWX new compositions
    93e4404990206 USB: serial: option: add Telit Cinterion FN990A w/audio compositions
    28d20ff4e3886 dt-bindings: serial: brcm,bcm7271-uart: Constrain clocks
    d91604c39b74c tty: hvc_console: Call hvc_kick in hvc_write unconditionally
    9cf2429fe6cbb Input: i8042 - add TUXEDO InfinityBook Pro Gen10 AMD to i8042 quirk table
    e32a2ea52b513 mtd: rawnand: stm32_fmc2: avoid overlapping mappings on ECC buffer
    6e2859c6aa466 mtd: rawnand: stm32_fmc2: Fix dma_map_sg error check
    e0bca4dd48fc5 mtd: nand: raw: atmel: Respect tAR, tCLR in read setup timing
    c3f1ea856e147 mtd: nand: raw: atmel: Fix comment in timings preparation
    123e31a54d51b mm/khugepaged: fix the address passed to notifier on testing young
    ea12ab684f8ae libceph: fix invalid accesses to ceph_connection_v1_info
    1e1bcbc548777 fuse: prevent overflow in copy_file_range return value
    5d41589fa0699 fuse: check if copy_file_range() returns larger than requested size
    b8af2e74e49db mtd: rawnand: stm32_fmc2: fix ECC overwrite
    ef30404980e4c ocfs2: fix recursive semaphore deadlock in fiemap call
    23092f6723bc1 mptcp: sockopt: make sync_socket_options propagate SOCK_KEEPOPEN
    5d7267abcd65e compiler-clang.h: define __SANITIZE_*__ macros only when undefined
    8178ccf5671e6 EDAC/altera: Delete an inappropriate dma_free_coherent() call
    34b87ac4bb903 KVM: SVM: Set synthesized TSA CPUID flags
    54270c1b29f2a KVM: SVM: Return TSA_SQ_NO and TSA_L1_NO bits in __do_cpuid_func()
    2fab1e2af6c59 KVM: x86: Move open-coded CPUID leaf 0x80000021 EAX bit propagation code
    7429b8b9bfbc2 tcp_bpf: Call sk_msg_free() when tcp_bpf_send_verdict() fails to allocate psock->cork.
    5f756d1866ebb NFSv4/flexfiles: Fix layout merge mirror check.
    9a38cd92493c2 tracing: Fix tracing_marker may trigger page fault during preempt_disable
    c10744fd7fec8 NFSv4: Clear the NFS_CAP_XATTR flag if not supported by the server
    89f40500c09aa NFSv4: Clear the NFS_CAP_FS_LOCATIONS flag if it is not set
    91902607106c0 NFSv4: Don't clear capabilities that won't be reset
    929de8cc2f66c flexfiles/pNFS: fix NULL checks on result of ff_layout_choose_ds_for_read
    76b1a7c29ef3b mm/rmap: reject hugetlb folios in folio_make_device_exclusive()
    1cdb41d4f08a6 tracing: Do not add length to print format in synthetic events
    d51e47e2ab6ef net: Fix null-ptr-deref by sock_lock_init_class_and_name() and rmmod.
    85d1c5d416c6a media: i2c: imx214: Fix link frequency validation
    6e31585286b97 media: mtk-vcodec: venc: avoid -Wenum-compare-conditional warning
    10d8884e1869f mm: introduce and use {pgd,p4d}_populate_kernel()
    adb2f26b875b9 kunit: kasan_test: disable fortify string checker on kasan_strings() test
    69944b3cd7ec5 xfs: short circuit xfs_growfs_data_private() if delta is zero
    c0950ee2c3cc8 Revert "fbdev: Disable sysfb device registration when removing conflicting FBs"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 6db8ab45e1..a79d3b1511 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bf6a706b67fab1f1b87d036a27eae3e29b416780"
-SRCREV_meta ?= "7b92175ae0ed45be2aae0a1f61f9e2e2562b32d4"
+SRCREV_machine ?= "259f7f9d0bd0df2c3e497395568a655c5745b5ac"
+SRCREV_meta ?= "578937826ffad97749eba3a5d1b21b37b5cd7bdc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.193"
+LINUX_VERSION ?= "5.15.194"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index f300e36917..e2e56ec010 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.193"
+LINUX_VERSION ?= "5.15.194"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "425235969cb20fd27d9d43e0c659fa9d24bafe75"
-SRCREV_meta ?= "7b92175ae0ed45be2aae0a1f61f9e2e2562b32d4"
+SRCREV_machine ?= "57960f78280a75ea48270a3984ac01bd06078b88"
+SRCREV_meta ?= "578937826ffad97749eba3a5d1b21b37b5cd7bdc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 5455d391c7..bbdf94746d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "cfd5f47f2a7dc7f381124fa6b3648786e5a906ac"
-SRCREV_machine:qemuarm64 ?= "d1a6a76c533ad75ed1da9e1b4616be85f1f26d90"
-SRCREV_machine:qemumips ?= "6520b1720ebcc7b9f6f537e26a56eb3dbb667a7d"
-SRCREV_machine:qemuppc ?= "0a049d670d02ffb90a9130ae60b2add036d4af2f"
-SRCREV_machine:qemuriscv64 ?= "c7153ab5fdd753945b04ed678cce72c6ad05fb41"
-SRCREV_machine:qemuriscv32 ?= "c7153ab5fdd753945b04ed678cce72c6ad05fb41"
-SRCREV_machine:qemux86 ?= "c7153ab5fdd753945b04ed678cce72c6ad05fb41"
-SRCREV_machine:qemux86-64 ?= "c7153ab5fdd753945b04ed678cce72c6ad05fb41"
-SRCREV_machine:qemumips64 ?= "a76cb44b6fd95096dc2a16da2b237f1059c23d7f"
-SRCREV_machine ?= "c7153ab5fdd753945b04ed678cce72c6ad05fb41"
-SRCREV_meta ?= "7b92175ae0ed45be2aae0a1f61f9e2e2562b32d4"
+SRCREV_machine:qemuarm ?= "7b19f872b07703f73c494baa81cd7e984db01336"
+SRCREV_machine:qemuarm64 ?= "431a37a229ce5be7b6ba116dc7bd282be4a745fa"
+SRCREV_machine:qemumips ?= "9404d4015b457e7324d5675d3e14f46d84cd8c40"
+SRCREV_machine:qemuppc ?= "bfd132d4b358cdb5260fccc71eb1e5a09daae033"
+SRCREV_machine:qemuriscv64 ?= "5df8e23ccadd62ab9945320b6b4327b082870c61"
+SRCREV_machine:qemuriscv32 ?= "5df8e23ccadd62ab9945320b6b4327b082870c61"
+SRCREV_machine:qemux86 ?= "5df8e23ccadd62ab9945320b6b4327b082870c61"
+SRCREV_machine:qemux86-64 ?= "5df8e23ccadd62ab9945320b6b4327b082870c61"
+SRCREV_machine:qemumips64 ?= "ed52c5eccf0cc2b0da2dd7d13d012c50db78a62a"
+SRCREV_machine ?= "5df8e23ccadd62ab9945320b6b4327b082870c61"
+SRCREV_meta ?= "578937826ffad97749eba3a5d1b21b37b5cd7bdc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "43bb85222e53926decace01ce6584ca88e09a0a9"
+SRCREV_machine:class-devupstream ?= "29e53a5b1c4f144301ee36a907e8b03d7733f0b0"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.193"
+LINUX_VERSION ?= "5.15.194"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.43.0


