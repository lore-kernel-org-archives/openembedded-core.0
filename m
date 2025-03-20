Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A4AC35FFF
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 13:40:28 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.7687.1742478019148526223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 06:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WOloGk97;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ddcff5a823so5976136d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 06:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742478018; x=1743082818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiwaQfstt9SGqGt42axyshDTV7dB28tzWTzuucoySVw=;
        b=WOloGk97fY3ZFagD/4pahJGE6uUUcBqCznMqxbyx0WjavNspyH3Sb1/8kMk1twcZty
         R8afFDRYa0C08Z1tbYv78DKuulX2pyk/Xsfvj0y1uJcA80/CSkHGvzU6Xjy1BIGGu2Mq
         iBD4q3CfnEJVKuZ3HumYu9SM5FHXeX2uNUlIigLmHflQlZ1ts61NfDVB5nSb7OhXCT6R
         okOxXhwLYsjOT18meBtFIeN0KWRoG8lDMxmJzz54mMIkGOzbELIIJ7SilsPoiIfB2fsh
         PNb05bhllY4pbNRGXsFQVwDfldIE9WyIktrdDQm1C4/WBL//VJaz6/4kC1+H/7TpX/Hy
         CrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742478018; x=1743082818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiwaQfstt9SGqGt42axyshDTV7dB28tzWTzuucoySVw=;
        b=FgnCCoqhlinBUR1onRmwfoXbZARIMfEEBT61mfSos0dydbNanNDxj4M4hRmXoEa3W2
         XCLJVJnxJ1Fsdp6piNWPRs3B0fIezxqU7bqaoNR2CatVJd1ze2T4O7hHImJPQrqr74dY
         lQLJjWsOen8T74Cnvz7k4L877rLs6K20ri16WwelLZzi95anKFaQMPB0LuxPn6JPahW2
         ugMq8Ag7J7Fo0h0g2z4zcl5CFMrR4qjB3xUelHqvupIXSCFphLAOPntMkN2aT4/iTKuv
         WXToRkWmLh6dUlBq7U0Pu460Itmf8c5bxJgZcWBE+83Q2EZ0ClvP7JFvsAstJNAOjBzp
         t1mQ==
X-Gm-Message-State: AOJu0YwMqigqxJVExUthFteQMrV8IsTjmR+lkvthrNQ78rYEx/2oQRWB
	N7MQyPMCk4zIdvVu5gWKVxUxGLFEYE1E313UGOZ+1xWy7zXZzNma5KuZK8ys8NU=
X-Gm-Gg: ASbGncvdf0sXMrUOlJmi0dq2Wo8rLj0OV+su5qXzFzeUFZWqZlgsWWSqktn3WqHJgA7
	wIwjrthrocnN0gR/k+0Qi37ac4PAIK3I3y9vIVOWGBFs+b704ELEByPyaU+NUA/HdkMTsuXKOUf
	HkP36IQXcvnB62W44e8WlLZHWJ0n4aB3QMMEo/ZUDK/Ib7q8ESui1Gvv0NNcaqfV7x4rNThF7e7
	1+4y72o6c/QVn96HGudVhq3pJJ3wnZZYHjtk/cx0wZBtK25aUmBJnnnHKxCFcRjg8BKbkIl3hqm
	UlvZOPaulGAxHTY09UBIqdJlR3W+w/yffvv9oo9ct5D1Kkaqu5BKEYXO7ma79iCx5DmFOmfOk4/
	JF4Ipbhhcug+gVh/ul7yPtceOenPKWVcwts5goxvVuUzLPg==
X-Google-Smtp-Source: AGHT+IH2uXJJ9Ztth8A88yrsqroTdMWvK4ahxjVVzdMOf5q4w33Y8N7ina/+vt1KE9CdajHqcWS0tQ==
X-Received: by 2002:a05:6214:d47:b0:6d8:a1fe:7293 with SMTP id 6a1803df08f44-6eb353664f4mr37196476d6.42.1742478017089;
        Thu, 20 Mar 2025 06:40:17 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade231256sm93954166d6.32.2025.03.20.06.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 06:40:16 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/6.12: update to v6.12.17
Date: Thu, 20 Mar 2025 09:40:08 -0400
Message-Id: <36f4b350765beb3c167631aef2cfda8ea360d3e3.1742477836.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1742477836.git.bruce.ashfield@gmail.com>
References: <cover.1742477836.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 13:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213393

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    41b222412985 Linux 6.12.17
    27b929c45d6c drm/amdgpu: bump version for RV/PCO compute fix
    4ce4d5e1f999 drm/amdgpu/gfx9: manually control gfxoff for CS on RV
    7d672fd64a72 arm64: dts: rockchip: change eth phy mode to rgmii-id for orangepi r1 plus lts
    54dba9d5ae94 selftests/mm: build with -O2
    2799d16d0ca9 sched_ext: Fix incorrect assumption about migration disabled tasks in task_can_run_on_remote_rq()
    4abbe664a14e net: pse-pd: Fix deadlock in current limit functions
    384c8291f7ce tracing: Fix using ret variable in tracing_set_tracer()
    67cb8eaafca1 ftrace: Do not add duplicate entries in subops manager ops
    6856b5cdfb39 ftrace: Fix accounting of adding subops to a manager ops
    1bfc1f1b9eb4 ftrace: Correct preemption accounting for function tracing.
    e28e7d7b205f EDAC/qcom: Correct interrupt enable register configuration
    a9b0b4b29877 smb: client: Add check for next_buffer in receive_encrypted_standard()
    ada54b2e81eb irqchip/gic-v3: Fix rk3399 workaround when secure interrupts are enabled
    562d40ff3d23 perf/x86/intel: Fix event constraints for LNC
    82ac99303dd5 mtd: rawnand: cadence: fix incorrect device in dma_unmap_single
    0ce541686396 mtd: rawnand: cadence: use dma_map_resource for sdma address
    3c906b6dda2d mtd: rawnand: cadence: fix error code in cadence_nand_init()
    bb1accc7e0f6 mtd: spi-nor: sst: Fix SST write failure
    ff673b71f0a5 mm,madvise,hugetlb: check for 0-length range after end address adjustment
    ef5f11be7696 acct: block access to kernel internal filesystems
    5a59ced8ffc7 acct: perform last write from workqueue
    e8b4eb50000f ASoC: SOF: pcm: Clear the susbstream pointer to NULL on close
    1cce98bf4139 ALSA: hda/conexant: Add quirk for HP ProBook 450 G4 mute LED
    cb2b6244e50c ALSA: hda: Add error check for snd_ctl_rename_id() in snd_hda_create_dig_out_ctls()
    da2ce0dfa2f9 ASoC: fsl_micfil: Enable default case in micfil_set_quality()
    62ab1ae5511c ASoC: SOF: stream-ipc: Check for cstream nullity in sof_ipc_msg_data()
    aa8457effd1f gve: set xdp redirect target only when it is available
    897c32cd763f nfp: bpf: Add check for nfp_app_ctrl_msg_alloc()
    a1b5ed0a6144 smb: client: fix chmod(2) regression with ATTR_READONLY
    cd1c4113ba9e lib/iov_iter: fix import_iovec_ubuf iovec management
    3fb84dfb9784 xfs: fix online repair probing when CONFIG_XFS_ONLINE_REPAIR=n
    b720facbe096 s390/boot: Fix ESSA detection
    0841885c73c4 soc: loongson: loongson2_guts: Add check for devm_kstrdup()
    37b3d203610a arm64: dts: rockchip: Disable DMA for uart5 on px30-ringneck
    5e58e3636801 arm64: dts: rockchip: Move uart5 pin configuration to px30 ringneck SoM
    60e4e8bdf9c1 arm64: dts: rockchip: Fix broken tsadc pinctrl names for rk3588
    3f9240d59e9a mm/migrate_device: don't add folio to be freed to LRU in migrate_device_finalize()
    b7859e8643e7 drop_monitor: fix incorrect initialization order
    fd9d2d6124c2 tee: optee: Fix supplicant wait loop
    6f3edf2d50c9 gpiolib: protect gpio_chip with SRCU in array_info paths in multi get/set
    506b9b5e8c2d io_uring: prevent opcode speculation
    79151b47bf23 io_uring/rw: forbid multishot async reads
    2bf1f4c129db drm/i915/gt: Use spin_lock_irqsave() in interruptible context
    c949307a84c4 drm/i915/ddi: Fix HDMI port width programming in DDI_BUF_CTL
    9c1ae19a3dcb drm/i915/dp: Fix error handling during 128b/132b link training
    4ad9fe1b0cbb drm/i915: Make sure all planes in use by the joiner have their crtc included
    040f8f99ad4f drm/msm/dpu: Disable dither in phys encoder cleanup
    d754ae423bbf drm: panel: jd9365da-h3: fix reset signal polarity
    97621151f4a6 irqchip/jcore-aic, clocksource/drivers/jcore: Fix jcore-pit interrupt request
    2e2e49495445 drm/nouveau/pmu: Fix gp10b firmware guard
    7b8894ef0352 bpf: skip non exist keys in generic_map_lookup_batch
    d2d5fe4c6480 nvme/ioctl: add missing space in err message
    020c50e314dc nvme-tcp: fix connect failure on receiving partial ICResp PDU
    1070154b40bf nvme: tcp: Fix compilation warning with W=1
    4968166642bf drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
    08592a6f8674 drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
    a57ddf00c577 drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
    83fe04708319 drm/msm/dpu: Don't leak bits_per_component into random DSC_ENC fields
    2d1b3830b924 drm/msm/dpu: enable DPU_WB_INPUT_CTRL for DPU 5.x
    ab8af31d54a3 drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450
    45bb1eaa0e28 drm/msm: Avoid rounding up to one jiffy
    f5d5e8165aee nouveau/svm: fix missing folio unlock + put after make_device_exclusive_range()
    179831a606d8 platform: cznic: CZNIC_PLATFORMS should depend on ARCH_MVEBU
    bd29b3269de8 firmware: imx: IMX_SCMI_MISC_DRV should depend on ARCH_MXC
    fc810d09ad1c md/raid*: Fix the set_queue_limits implementations
    f3adf0094b6e firmware: arm_scmi: imx: Correct tx size of scmi_imx_misc_ctrl_set
    df0723313255 arm64: dts: rockchip: adjust SMMU interrupt type on rk3588
    c1f3f3892d45 bpf: Fix softlockup in arena_map_free on 64k page kernel
    f579afacd0a6 net: Add rx_skb of kfree_skb to raw_tp_null_args[].
    abd30e947f70 selftests/bpf: Add tests for raw_tp null handling
    ae11d93046a0 power: supply: axp20x_battery: Fix fault handling for AXP717
    8fa6c55e08ff power: supply: da9150-fg: fix potential overflow
    2ccd6679c469 arm64: dts: rockchip: Fix lcdpwr_en pin for Cool Pi GenBook
    fac674d2bd68 bpf: Fix deadlock when freeing cgroup storage
    f91716d5fa0b bpf: Disable non stream socket for strparser
    6798f428d8f8 bpf: Fix wrong copied_seq calculation
    a87a6888c05b strparser: Add read_sock callback
    d95607a5f2f9 bpf: avoid holding freeze_mutex during mmap operation
    1c81ba1913fb bpf: unify VM_WRITE vs VM_MAYWRITE use in BPF map mmaping logic
    972bafed67ca bpf, test_run: Fix use-after-free issue in eth_skb_pkt_type()
    ed0ca7d2127c net: allow small head cache usage with large MAX_SKB_FRAGS values
    cd34a07f7444 tcp: drop secpath at the same time as we currently drop dst
    83539bfbc119 net: axienet: Set mac_managed_pm
    c4a0f1153265 arp: switch to dev_getbyhwaddr() in arp_req_set_public()
    36d5616bc5ee net: Add non-RCU dev_getbyhwaddr() helper
    cbd75b9136c5 flow_dissector: Fix port range key handling in BPF conversion
    90c7f5cd5920 flow_dissector: Fix handling of mixed port and port-range keys
    4b02b06daf79 geneve: Suppress list corruption splat in geneve_destroy_tunnels().
    ff81b1401036 gtp: Suppress list corruption splat in gtp_net_exit_batch_rtnl().
    a055b1bc4009 net: pse-pd: pd692x0: Fix power limit retrieval
    9a2e2b058162 net: pse-pd: Use power limit at driver side instead of current limit
    414ce1853b8d net: pse-pd: Avoid setting max_uA in regulator constraints
    997ef6117efc tcp: adjust rcvq_space after updating scaling ratio
    478a46f1122f vsock/bpf: Warn on socket without transport
    22b683217ad2 sockmap, vsock: For connectible sockets allow only connected
    25dddd01dcc8 ibmvnic: Don't reference skb after sending to VIOS
    0ad0093cf0a8 ibmvnic: Add stat for tx direct vs tx batched
    0505ff2936f1 s390/ism: add release function for struct device
    4da5a3547d69 ALSA: seq: Drop UMP events when no UMP-conversion is set
    3e4c56cf4187 net/sched: cls_api: fix error handling causing NULL dereference
    e0f5b5407d0e ALSA: hda/cirrus: Correct the full scale volume set logic
    da9b0ae47f08 geneve: Fix use-after-free in geneve_find_dev().
    4381a4fab3a5 vsock/virtio: fix variables initialization during resuming
    72be19e184fc ASoC: imx-audmix: remove cpu_mclk which is from cpu dai device
    8d06e9208184 powerpc/code-patching: Fix KASAN hit by not flagging text patching area as VM_ALLOC
    baf6c85075c6 ALSA: hda/realtek: Fixup ALC225 depop procedure
    d57a90c83d69 powerpc/64s: Rewrite __real_pte() and __rpte_to_hidx() as static inline
    5980d4456dd6 powerpc/code-patching: Disable KASAN report during patching via temporary mm
    87c8768a9609 ASoC: SOF: ipc4-topology: Harden loops for looking up ALH copiers
    8de1ea6e427b ASoC: rockchip: i2s-tdm: fix shift config for SND_SOC_DAIFMT_DSP_[AB]
    3d92aa03900a sched_ext: Fix migration disabled handling in targeted dispatches
    d045c8f014c3 sched_ext: Factor out move_task_between_dsqs() from scx_dispatch_from_dsq()
    e9fec6f42c45 USB: gadget: f_midi: f_midi_complete to call queue_work
    1e6419b1a41d tracing: Have the error of __tracing_resize_ring_buffer() passed to user
    3284fbfa8711 tracing: Switch trace.c code over to use guard()
    e68f4717a292 drm/amdkfd: Ensure consistent barrier state saved in gfx12 trap handler
    1d83efc7e7dd drm/amdkfd: Move gfx12 trap handler to separate file
    639fc79f84f3 accel/ivpu: Fix error handling in recovery/reset
    6e254503a388 accel/ivpu: Add FW state dump on TDR
    509662f532ac accel/ivpu: Add coredump support
    d3f80d98f204 accel/ivpu: Limit FW version string length
    d91a36b2703c arm64: dts: mediatek: mt8183: Disable DSI display output by default
    66c5a2f4b738 arm64: dts: mediatek: mt8183-pumpkin: add HDMI support
    75334c9cd6b2 PCI: Restore original INTX_DISABLE bit by pcim_intx()
    ed020100b62c PCI: Remove devres from pci_intx()
    969c54c82d8c PCI: Export pci_intx_unmanaged() and pcim_intx()
    1711fd7bd915 PCI: Make pcim_request_all_regions() a public function
    4543b1b8f865 ASoC: renesas: rz-ssi: Add a check for negative sample_space
    fffb4a352672 ASoC: renesas: rz-ssi: Terminate all the DMA transactions
    3e179d3f1ada Input: synaptics - fix crash when enabling pass-through port
    3e0686bc608e Input: serio - define serio_pause_rx guard to pause and resume serio ports
    4a679448ef61 Bluetooth: qca: Fix poor RF performance for WCN6855
    065215ef00f1 Bluetooth: qca: Update firmware-name to support board specific nvm
    a81171bb2b78 drm/amd/display: Correct register address in dcn35
    6d173b198709 drm/amd/display: update dcn351 used clock offset
    3cd3a58908ab drm/amd/display: Refactoring if and endif statements to enable DC_LOGGER
    15d199404713 KVM: nVMX: Defer SVI update to vmcs01 on EOI when L2 is active w/o VID
    9d5034a35c3a KVM: x86: Inline kvm_get_apic_mode() in lapic.h
    2356acd8aa1d KVM: x86: Get vcpu->arch.apic_base directly and drop kvm_get_apic_base()
    2627661c31ba btrfs: fix double accounting race when extent_writepage_io() failed
    21333148b5c9 btrfs: fix double accounting race when btrfs_run_delalloc_range() failed
    80f32acfa14e btrfs: use btrfs_inode in extent_writepage()
    0138f46fea3f btrfs: rename btrfs_folio_(set|start|end)_writer_lock()
    e0922986ea6a btrfs: unify to use writer locks for subpage locking
    93c985ddccc3 btrfs: remove unused btrfs_folio_start_writer_lock()
    9f9e6f07cd57 btrfs: mark all dirty sectors as locked inside writepage_delalloc()
    4dd35a361f87 btrfs: move the delalloc range bitmap search into extent_io.c
    1853fd089416 btrfs: do not assume the full page range is not dirty in extent_writepage_io()
    fb96af0daa69 xe/oa: Fix query mode of operation for OAR/OAC
    c3bfba2be7ad drm/xe/oa: Add input fence dependencies
    803d418b7338 drm/xe/oa/uapi: Define and parse OA sync properties
    49db780464ef drm/xe/oa: Separate batch submission from waiting for completion
    93745f5f2377 arm64: mte: Do not allow PROT_MTE on MAP_HUGETLB user mappings
    19b4657de424 Linux 6.12.16
    61749c035911 Revert "vfio/platform: check the bounds of read/write syscalls"
    3a866f8376f0 vsock: Orphan socket after transport release
    645ce25aa0e6 vsock: Keep the binding until socket destruction
    7d0dc28dae83 io_uring/kbuf: reallocate buf lists on upgrade
    13129b1fbfff scsi: ufs: core: Ensure clk_gating.lock is used only after initialization
    2248b8145053 net: ipv6: fix dst refleaks in rpl, seg6 and ioam6 lwtunnels
    704fdc59601e cpufreq/amd-pstate: Remove the goto label in amd_pstate_update_limits
    e5aeac73ab04 wifi: rtw89: pci: disable PCIE wake bit when PCIE deinit
    d5c8ffaa9d53 selftests/bpf: Fix uprobe consumer test
    449dd20852d8 bpf: handle implicit declaration of function gettid in bpf_iter.c
    728dd20c8df7 x86/static-call: Remove early_boot_irqs_disabled check to fix Xen PVH dom0
    0df35b26dcd2 selftests: rtnetlink: update netdevsim ipsec output format
    adbf808f5901 netdevsim: print human readable IP address
    2ec95be2b743 drm: renesas: rz-du: Increase supported resolutions
    62cd174616ae drm/xe/tracing: Fix a potential TP_printk UAF
    1c5673a2c892 drm/v3d: Stop active perfmon if it is being destroyed
    549b4664fb72 drm/msm/dpu1: don't choke on disabling the writeback connector
    508a399ab6f2 drm/msm/dpu: fix x1e80100 intf_6 underrun/vsync interrupt
    a674aa0d33d6 drm/rcar-du: dsi: Fix PHY lock bit check
    2f1845e46c41 drm/msm/gem: prevent integer overflow in msm_ioctl_gem_submit()
    6c4dcdbe5137 drm/tidss: Clear the interrupt status for interrupts being disabled
    f94c5f24dae7 drm/tidss: Fix race condition while handling interrupt registers
    c5dcd3f421d0 drm/tidss: Fix issue in irq handling causing irq-flood issue
    25195f9d5ffc ipv6: mcast: add RCU protection to mld_newpack()
    19bfe57b1c24 btrfs: fix stale page cache after race between readahead and direct IO write
    53ba1169d976 btrfs: rename __get_extent_map() and pass btrfs_inode
    0bf8e2f37686 ipv6: mcast: extend RCU protection in igmp6_send()
    789230e5a8c1 ndisc: extend RCU protection in ndisc_send_skb()
    a849a10de5e0 openvswitch: use RCU protection in ovs_vport_cmd_fill_info()
    01d1b5c9abca arp: use RCU protection in arp_xmit()
    cdd5c2a12dda neighbour: use RCU protection in __neigh_notify()
    bbec88e4108e ndisc: use RCU protection in ndisc_alloc_skb()
    3e38cbbfa0a1 HID: hid-steam: Move hidraw input (un)registering to work
    2152b417be16 HID: hid-steam: Make sure rumble work is canceled on removal
    653bb5225cd4 ipv6: icmp: convert to dev_net_rcu()
    713a40c892f4 ipv6: use RCU protection in ip6_default_advmss()
    a57582779191 flow_dissector: use RCU protection to fetch dev_net()
    3c925321a574 ipv4: icmp: convert to dev_net_rcu()
    4583748b65de ipv4: use RCU protection in __ip_rt_update_pmtu()
    7f5005457b30 net: ipv4: Cache pmtu for all packet paths if multipath enabled
    ad66c7c4d81d ipv4: use RCU protection in inet_select_addr()
    77096420be1f ipv4: use RCU protection in rt_is_expired()
    f4ba5e65c92b ipv4: use RCU protection in ipv4_default_advmss()
    ec9af7645109 net: add dev_net_rcu() helper
    dfe542e745fc ipv4: use RCU protection in ip_dst_mtu_maybe_forward()
    cb4d7fbc937e ipv4: add RCU protection to ip4_dst_hoplimit()
    56e6976793c0 cpufreq/amd-pstate: Fix cpufreq_policy ref counting
    698d93debbc5 cpufreq/amd-pstate: convert mutex use to guard()
    f7548a939b24 cpufreq/amd-pstate: Merge amd_pstate_epp_cpu_offline() and amd_pstate_epp_offline()
    4ee13803d185 cpufreq/amd-pstate: Remove the cppc_state check in offline/online functions
    8ce0d636da0f cpufreq/amd-pstate: Refactor amd_pstate_epp_reenable() and amd_pstate_epp_offline()
    881d940d9f92 cpufreq/amd-pstate: Align offline flow of shared memory and MSR based systems
    31c1cc82da48 cpufreq/amd-pstate: Call cppc_set_epp_perf in the reenable function
    86f563c7431a rust: kbuild: add -fzero-init-padding-bits to bindgen_skip_cflags
    7d46869aa7bd scsi: ufs: Fix toggling of clk_gating.state when clock gating is not allowed
    f453c4515208 scsi: ufs: core: Introduce a new clock_gating lock
    9ece41a0d7d3 scsi: ufs: core: Prepare to introduce a new clock_gating lock
    f7015dcac273 scsi: ufs: core: Introduce ufshcd_has_pending_tasks()
    cc3d79e7c806 clocksource: Use migrate_disable() to avoid calling get_random_u32() in atomic context
    ebf0ac02e2d8 clocksource: Use pr_info() for "Checking clocksource synchronization" message
    5ab11a4e219e net: ipv6: fix dst ref loops in rpl, seg6 and ioam6 lwtunnels
    4a855c5aec41 net: ipv6: rpl_iptunnel: mitigate 2-realloc issue
    2fcc9f3798ef net: ipv6: seg6_iptunnel: mitigate 2-realloc issue
    8471e228448a net: ipv6: ioam6_iptunnel: mitigate 2-realloc issue
    9a1c65ff5e0d include: net: add static inline dst_dev_overhead() to dst.h
    cad62c5aee91 btrfs: fix hole expansion when writing at an offset beyond EOF
    23ab814ae449 mlxsw: Add return value check for mlxsw_sp_port_get_stats_raw()
    c45aa877256a cifs: pick channels for individual subrequests
    fe2a10a4cb19 igc: Set buffer type for empty frames in igc_init_empty_frame
    95992ebdafe6 mmc: mtk-sd: Fix register settings for hs400(es) mode
    7caed8d5f1ce arm64: Handle .ARM.attributes section in linker scripts
    eeb64f963756 regmap-irq: Add missing kfree()
    db60d2d896a1 iommu: Fix potential memory leak in iopf_queue_remove_device()
    2ca8802a24f7 regulator: qcom_smd: Add l2, l5 sub-node to mp5496 regulator
    75bf2f80c046 sched_ext: Fix incorrect autogroup migration detection
    6578717ebca9 partitions: mac: fix handling of bogus partition table
    6ccb3bbdad67 gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock
    9f602c273fae gpiolib: acpi: Add a quirk for Acer Nitro ANV14
    01df870db957 s390/pci: Fix handling of isolated VFs
    c746d3eb0ddf s390/pci: Pull search for parent PF out of zpci_iov_setup_virtfn()
    a6a7e8b5a98b alpha: align stack for page fault and user unaligned trap handlers
    80d922bc08f6 alpha: replace hardcoded stack offsets with autogenerated ones
    c8a52c772c7c serial: 8250: Fix fifo underflow on flush
    010eb5fe2299 serial: port: Always update ->iotype in __uart_read_properties()
    29c04864fba2 serial: port: Assign ->iotype correctly when ->iobase is set
    edd408444537 cgroup: fix race between fork and cgroup.kill
    05b9d614eb64 rust: rbtree: fix overindented list item
    4166ac765340 objtool/rust: add one more `noreturn` Rust function
    bcaa01f4f4ff arm64: rust: clean Rust 1.85.0 warning using softfloat target
    3ed642e80c94 efi: Avoid cold plugged memory for placing the kernel
    3d041fb3b6e8 kbuild: userprogs: fix bitsize and target detection on clang
    ce526e1b29c7 PCI: Avoid FLR for Mediatek MT7922 WiFi
    44de00e8bc8f wifi: ath12k: fix handling of 6 GHz rules
    2c637b4aa50f alpha: make stack 16-byte aligned (most cases)
    722e8e1219c8 can: etas_es58x: fix potential NULL pointer dereference on udev->serial
    118fb35681bd can: rockchip: rkcanfd_handle_rx_fifo_overflow_int(): bail out if skb cannot be allocated
    759e4e94a3c9 can: j1939: j1939_sk_send_loop(): fix unable to send messages with data length zero
    6ea780e9a7ca can: c_can: fix unbalanced runtime PM disable in error path
    b0e592dd46a0 can: ctucanfd: handle skb allocation failure
    bd035e2758cc USB: serial: option: drop MeiG Smart defines
    db70ef8a8cef USB: serial: option: fix Telit Cinterion FN990A name
    addcc3128bce USB: serial: option: add Telit Cinterion FN990B compositions
    0ab22a1c2bd5 USB: serial: option: add MeiG Smart SLM828
    f894448f3904 usb: gadget: core: flush gadget workqueue after device removal
    a5b205ceefa5 usb: cdc-acm: Fix handling of oversized fragments
    f64079bef6a8 usb: cdc-acm: Check control transfer buffer size before access
    165fac6cebc8 USB: cdc-acm: Fill in Renesas R-Car D3 USB Download mode quirk
    62d8f4c5454d USB: hub: Ignore non-compliant devices with too many configs or interfaces
    6b16761a9287 usb: gadget: f_midi: fix MIDI Streaming descriptor lengths
    f4e1cebbfaa0 USB: Add USB_QUIRK_NO_LPM quirk for sony xperia xz1 smartphone
    6c4fce1b16d0 USB: quirks: add USB_QUIRK_NO_LPM quirk for Teclast dist
    847fff8e20c9 usb: core: fix pipe creation for get_bMaxPacketSize0
    9c91296e2dc6 USB: pci-quirks: Fix HCCPARAMS register error for LS7A EHCI
    f3b755022f5c usb: xhci: Restore xhci_pci support for Renesas HCs
    34971970d512 usb: dwc2: gadget: remove of_node reference upon udc_stop
    bcc1c91017c4 usb: gadget: udc: renesas_usb3: Fix compiler warning
    69f27580e8ee usb: roles: set switch registered flag early on
    5fead36e095f usb: dwc3: Fix timeout issue during controller enter/exit from halt state
    a5852836e589 usb: gadget: f_midi: Fixing wMaxPacketSize exceeded issue during MIDI bind retries
    9f837ea9221c ring-buffer: Update pages_touched to reflect persistent buffer content
    3ec743d558f1 ring-buffer: Validate the persistent meta data subbuf array
    e8dff5f73912 tracing: Do not allow mmap() of persistent ring buffer
    abb99f28b4f0 ring-buffer: Unlock resize on mmap error
    71762f455a81 perf/x86/intel: Ensure LBRs are disabled when a CPU is starting
    aa7a1bee54f9 perf/x86/intel: Fix ARCH_PERFMON_NUM_COUNTER_LEAF
    55057ec275f7 KVM: nSVM: Enter guest mode before initializing nested NPT MMU
    4eb063de686b KVM: x86: Load DR6 with guest value only before entering .vcpu_run() loop
    aca8be4403fb KVM: x86: Reject Hyper-V's SEND_IPI hypercalls if local APIC isn't in-kernel
    2498d2db1d35 drm/amdgpu: avoid buffer overflow attach in smu_sys_set_pp_table()
    0fdc3c166ac1 batman-adv: Drop unmanaged ELP metric worker
    e8f60d9cdae8 batman-adv: Ignore neighbor throughput metrics in error case
    2c3fb7df4cc6 batman-adv: fix panic during interface removal
    f71cb6da1366 kbuild: Use -fzero-init-padding-bits=all
    c0ccff7c6da9 ASoC: Intel: bytcr_rt5640: Add DMI quirk for Vexia Edu Atla 10 tablet 5V
    bf5a5e636aab kbuild: suppress stdout from merge_config for silent builds
    897f496b946f orangefs: fix a oob in orangefs_debug_write
    3dbe889a1b82 x86/mm/tlb: Only trim the mm_cpumask once a second
    019287b90532 ACPI: x86: Add skip i2c clients quirk for Vexia EDU ATLA 10 tablet 5V
    40f161657334 selftests: gpio: gpio-sim: Fix missing chip disablements
    de4049f85e89 Grab mm lock before grabbing pt lock
    e2db652741e8 fs/ntfs3: Unify inode corruption marking with _ntfs_bad_inode()
    44e35bfd2e55 vfio/nvgrace-gpu: Expose the blackwell device PF BAR1 to the VM
    18457b697f04 vfio/nvgrace-gpu: Read dvsec register to determine need for uncached resmem
    dd8830779b77 NFS: Fix potential buffer overflowin nfs_sysfs_link_rpc_client()
    758a5e1dc6db vfio/pci: Enable iowrite64 and ioread64 for vfio pci
    14a2a8ec50bc kunit: platform: Resolve 'struct completion' warning
    324785dc9f43 8250: microchip: pci1xxxx: Add workaround for RTS bit toggle
    1883eaf9b5dd serial: 8250_pci: Share WCH IDs with parport_serial driver
    c58e0d2d04fa serial: 8250_pci: Resolve WCH vendor ID ambiguity
    4d8e3a746b6c rtla/timerlat_top: Abort event processing on second signal
    8604b9805b85 rtla/timerlat_hist: Abort event processing on second signal
    88a01e9c9ad4 scsi: ufs: bsg: Set bsg_queue to NULL after removal
    551df35e4f4c PCI: switchtec: Add Microchip PCI100X device IDs
    2290d3bd9650 PCI/DPC: Quirk PIO log size for Intel Raptor Lake-P
    95432a37778c media: vidtv: Fix a null-ptr-deref in vidtv_mux_stop_thread
    24407a758460 media: uvcvideo: Add Kurokesu C1 PRO camera
    7706d1edb90d media: uvcvideo: Add new quirk definition for the Sonix Technology Co. 292a camera
    1b259a5df5e6 media: uvcvideo: Implement dual stream quirk to fix loss of usb packets
    eef0ce8d8d36 media: bcm2835-unicam: Disable trigger mode operation
    810634a07675 media: i2c: ds90ub953: Add error handling for i2c reads/writes
    e7a69bc05f32 media: i2c: ds90ub913: Add error handling to ub913_hw_init()
    aac9b55507ce media: cxd2841er: fix 64-bit division on gcc-9
    31ce02a272bb i3c: mipi-i3c-hci: Add support for MIPI I3C HCI on PCI bus
    2b5547ce45e9 i3c: mipi-i3c-hci: Add Intel specific quirk to ring resuming
    3d5c53cf3c20 soc/tegra: fuse: Update Tegra234 nvmem keepout list
    aa8e22cbedeb fbdev: omap: use threaded IRQ for LCD DMA
    cd955b75849b firmware: qcom: scm: smc: Handle missing SCM device
    fb3b0d1a19e8 RDMA/efa: Reset device on probe failure
    87fef8f6f2e0 tools: fix annoying "mkdir -p ..." logs when building tools in parallel
    40c731472f41 iommu/amd: Expicitly enable CNTRL.EPHEn bit in resume path
    a7052afa9eae gpiolib: Fix crash on error in gpiochip_get_ngpios()
    9a0a411f591e sched_ext: Use SCX_CALL_OP_TASK in task_tick_scx
    465255d52628 sched_ext: Fix the incorrect bpf_list kfunc API in common.bpf.h.
    9e6d70a91045 block: cleanup and fix batch completion adding conditions
    d159c142e623 x86/xen: allow larger contiguous memory regions in PV guests
    5a10af375347 xen/swiotlb: relax alignment requirements
    740bc21e2582 drm: Fix DSC BPP increment decoding
    d1d10bd59553 drm/amdgpu: bail out when failed to load fw in psp_init_cap_microcode()
    ae5ab1c1ae50 amdkfd: properly free gang_ctx_bo when failed to init user queue
    98d6ee3e305e io_uring/uring_cmd: remove dead req_has_async_data() check
    9d32212b998c io_uring/waitid: don't abuse io_tw_state
    1c3a7720fd96 gpio: bcm-kona: Add missing newline to dev_err format string
    30785bbbd5fe gpio: bcm-kona: Make sure GPIO bits are unlocked when requesting IRQ
    c7bee225dda4 gpio: bcm-kona: Fix GPIO lock/unlock for banks above bank 0
    19a6d7c28278 drm/i915/selftests: avoid using uninitialized context
    6c04fdb58f43 drm/xe/client: bo->client does not need bos_lock
    b12c991c6acb perf/x86/intel: Clean up PEBS-via-PT on hybrid
    c3e39d6acb05 cgroup: Remove steal time from usage_usec
    396d8e5136b4 gpu: host1x: Fix a use of uninitialized mutex
    715eb1af6477 arm64: cacheinfo: Avoid out-of-bounds write to cacheinfo array
    f3bafc927668 drm/tests: hdmi: Fix WW_MUTEX_SLOWPATH failures
    25ddd8f92a42 sched_ext: Fix lock imbalance in dispatch_to_local_dsq()
    e7c16028a424 workqueue: Put the pwq after detaching the rescuer from the pool
    4236bf471658 team: better TEAM_OPTION_TYPE_STRING validation
    a700e50fcf96 Bluetooth: btintel_pcie: Fix a potential race condition
    390bf69dcb20 net: ethernet: ti: am65_cpsw: fix tx_cleanup for XDP case
    1bba1d042107 net: ethernet: ti: am65-cpsw: fix memleak in certain XDP cases
    1dfb37ec8f01 LoongArch: KVM: Fix typo issue about GCFG feature detection
    9f15a8df542c LoongArch: csum: Fix OoB access in IP checksum code for negative lengths
    78d192f6147c LoongArch: Fix idle VS timer enqueue
    e860f847787f vxlan: check vxlan_vnigroup_init() return value
    4fceee361b37 igc: Fix HW RX timestamp when passed by ZC XDP
    16435bbe9147 idpf: call set_real_num_queues in idpf_open
    b2e2f6cc8752 idpf: record rx queue in skb for RSC packets
    99634723cfb0 idpf: fix handling rsc packet with a single segment
    022cac1c693a vrf: use RCU protection in l3mdev_l3_out()
    18e77fccfcf9 ndisc: ndisc_send_redirect() must use dev_get_by_index_rcu()
    b3a7b2a24174 Documentation/networking: fix basic node example document ISO 15765-2
    889e6b42a479 net: fib_rules: annotate data-races around rule->[io]ifindex
    b58f7ca86a7b ax25: Fix refcount leak caused by setting SO_BINDTODEVICE sockopt
    4df6f005bef0 spi: sn-f-ospi: Fix division by zero
    36fd8f1c735e HID: hid-steam: Don't use cancel_delayed_work_sync in IRQ context
    cdd9a1ea23ff HID: hid-thrustmaster: fix stack-out-of-bounds read in usb_check_int_endpoints()
    ba6ab3f04d0b pinctrl: pinconf-generic: Print unsigned value if a format is registered
    1f5b7a566e5b scripts/Makefile.extrawarn: Do not show clang's non-kprintf warnings at W=1
    aa879ef6d3ac HID: multitouch: Add NULL check in mt_input_configured
    b99dbdee8a89 HID: winwing: Add NULL check in winwing_init_led()
    59b55b65a96d pinctrl: cy8c95x0: Respect IRQ trigger settings from firmware
    4bc83ca7a035 pinctrl: cy8c95x0: Rename PWMSEL to SELPWM
    39fa22850fe9 pinctrl: cy8c95x0: Enable regmap locking for debug
    b74329644848 pinctrl: cy8c95x0: Avoid accessing reserved registers
    eea6d16f56e9 x86/cpu/kvm: SRSO: Fix possible missing IBPB on VM-Exit
    a88ca5d6d965 nfsd: validate the nfsd_serv pointer before calling svc_wake_up
    cedfbb92cf97 NFSD: fix hang in nfsd4_shutdown_callback
    f8d871523142 nfsd: clear acl_access/acl_default after releasing them
    984391de59a1 Linux 6.12.15
    681ee24cd5a2 xfs: don't lose solo dquot update transactions
    6b8aa7944351 Linux 6.12.14
    e149636e5eb6 ocfs2: check dir i_size in ocfs2_find_entry
    6c9cd0a70cce arm64: dts: rockchip: add reset-names for combphy on rk3568
    d49c64c1d723 statmount: let unset strings be empty
    7db0365ee609 fs: fix adding security options to statmount.mnt_opt
    45439a8b1115 fs: prepend statmount.mnt_opts string with security_sb_mnt_opts()
    bdea9e692de5 drm/xe: Fix and re-enable xe_print_blob_ascii85()
    c963ef1840a0 Revert "drm/amd/display: Fix green screen issue after suspend"
    8d82e8e4c3cd Revert "selftests/sched_ext: fix build after renames in sched_ext API"
    880b2cfda6aa md: Fix linear_set_limits()
    4c42502e9051 md/md-linear: Fix a NULL vs IS_ERR() bug in linear_add()
    eb03ebb34873 x86/mm: Convert unreachable() to BUG()
    3d67f2bb792a mptcp: prevent excessive coalescing on receive
    926a16e39d86 btrfs: avoid monopolizing a core when activating a swap file
    118b41e78b0a Revert "btrfs: avoid monopolizing a core when activating a swap file"
    38939faa290b spi: atmel-qspi: Memory barriers after memory-mapped I/O
    dfce40c775e6 spi: atmel-quadspi: Create `atmel_qspi_ops` to support newer SoC families
    d13f17af94f2 xfs: fix mount hang during primary superblock recovery failure
    84307caff2f4 xfs: lock dquot buffer before detaching dquot from b_li_list
    ee6984a2279e xfs: release the dquot buf outside of qli_lock
    d331fc154564 xfs: convert quotacheck to attach dquot buffers
    5808d4206f7c xfs: attach dquot buffer to dquot log item buffer
    e2150d6ced90 xfs: clean up log item accesses in xfs_qm_dqflush{,_done}
    08c7027e43a2 xfs: separate dquot buffer reads from xfs_dqflush
    ef24207c99cb xfs: don't lose solo superblock counter update transactions
    ee93e08d4c8b xfs: avoid nested calls to __xfs_trans_commit
    9be0b25adeb2 MIPS: ftrace: Declare ftrace_get_parent_ra_addr() as static
    4801e961be61 s390/fpu: Add fpc exception handler / remove fixup section again
    c6dd70e5b465 timers/migration: Fix off-by-one root mis-connection
    acbfc674ced7 rtc: zynqmp: Fix optional clock name property
    b13d32786aca RDMA/mlx5: Fix a race for an ODP MR which leads to CQE with error
    8441aea46445 ptp: Ensure info->enable callback is always set
    f45d9220fdb4 pinctrl: renesas: rzg2l: Fix PFC_MASK for RZ/V2H and RZ/G3E
    14fc1e3bb886 pinctrl: samsung: fix fwnode refcount cleanup if platform_get_irq_optional() fails
    1fdfafdeab49 rtla/timerlat_top: Stop timerlat tracer on signal
    e04985561769 rtla/timerlat_hist: Stop timerlat tracer on signal
    2cf2ddfdeb90 rtla: Add trace_instance_stop
    66e1ca983b5d rtla/timerlat_top: Set OSNOISE_WORKLOAD for kernel threads
    6bcf53498516 rtla/timerlat_hist: Set OSNOISE_WORKLOAD for kernel threads
    6b3ce60f2df3 rtla/osnoise: Distinguish missing workload option
    b45707c3c067 tracing/osnoise: Fix resetting of tracepoints
    f6760e7fb03a scripts/gdb: fix aarch64 userspace detection in get_current_task
    19fc795e9de0 maple_tree: simplify split calculation
    aab2bc4a0633 net: phy: c45-tjaxx: add delay between MDIO write and read in soft_reset
    2677640f7fe5 net/ncsi: wait for the last response to Deselect Package before configuring channel
    24a79c6bc8de misc: fastrpc: Fix copy buffer page size
    67419ee2c52b misc: fastrpc: Fix registered buffer page address
    a2544ebcb466 misc: fastrpc: Deregister device nodes properly in error scenarios
    8b4120b3e060 misc: misc_minor_alloc to use ida for all dynamic/misc dynamic minors
    1cda594dfad5 mtd: onenand: Fix uninitialized retlen in do_otp_read()
    c9a6200e7932 irqchip/apple-aic: Only handle PMC interrupt as FIQ when configured so
    e39861992070 i3c: master: Fix missing 'ret' assignment in set_speed()
    39603bb38cf1 fgraph: Fix set_graph_notrace with setting TRACE_GRAPH_NOTRACE_BIT
    2ae4bade5a64 NFC: nci: Add bounds checking in nci_hci_create_pipe()
    a833dbe62a90 mailbox: zynqmp: Remove invalid __percpu annotation in zynqmp_ipi_probe()
    cbdce45e81c5 mailbox: tegra-hsp: Clear mailbox before using message
    24d05ea5a044 NFSD: Encode COMPOUND operation status on page boundaries
    7cb77019afdf nfs: Make NFS_FSCACHE select NETFS_SUPPORT instead of depending on it
    b9495a9109ab nilfs2: fix possible int overflows in nilfs_fiemap()
    52a326f93ceb ocfs2: handle a symlink read error correctly
    d0b100a46301 ocfs2: fix incorrect CPU endianness conversion causing mount failure
    3996a41b1eeb pnfs/flexfiles: retry getting layout segment for reads
    7dc5a84ba549 selftests: mptcp: connect: -f: no reconnect
    61ba518195d6 vfio/platform: check the bounds of read/write syscalls
    be985aea92ea io_uring/net: don't retry connect operation on EPOLLERR
    35ae7910c349 io_uring: fix multishots with selected buffers
    0c15fe711d67 nvmem: imx-ocotp-ele: set word length to 1
    829421f1eaa2 nvmem: imx-ocotp-ele: fix reading from non zero offset
    ca81889d66aa nvmem: imx-ocotp-ele: fix MAC address byte order
    6d8b86781513 nvmem: imx-ocotp-ele: simplify read beyond device check
    2c3109dcdaed nvmem: core: improve range check for nvmem_cell_write()
    c01dd86afbd2 nvmem: qcom-spmi-sdam: Set size in struct nvmem_config
    146109fe936a ceph: fix memory leak in ceph_mds_auth_match()
    76e6d50fa5a2 crypto: qce - unregister previously registered algos in error path
    ea96d8ddcf7e crypto: qce - fix goto jump in error path
    06124c6ae800 irqchip/irq-mvebu-icu: Fix access to msi_data from irq_domain::host_data
    0dd5aade301a ata: libata-sff: Ensure that we cannot write outside the allocated buffer
    4491159774d9 mm/compaction: fix UBSAN shift-out-of-bounds warning
    ac304fa97846 mm/hugetlb: fix hugepage allocation for interleaved memory nodes
    4b6930831479 mm/vmscan: accumulate nr_demoted for accurate demotion statistics
    a403eca86c58 mm: gup: fix infinite loop within __get_longterm_locked
    e87df541b439 mm: kmemleak: fix upper boundary check for physical address objects
    438bda062b2c media: uvcvideo: Remove dangling pointers
    e8a650dbc732 media: uvcvideo: Remove redundant NULL assignment
    34fb9eb31d66 media: uvcvideo: Only save async fh if success
    ac7737ed9aee media: uvcvideo: Support partial control reads
    4f534dd576b7 media: uvcvideo: Fix event flags in uvc_ctrl_send_events
    d2eac8b14ac6 media: uvcvideo: Fix crash during unbind if gpio unit is in use
    9513dac27804 media: i2c: ds90ub960: Fix logging SP & EQ status only for UB9702
    6de9786c6138 media: i2c: ds90ub960: Fix UB9702 VC map
    1ee76f7b430e media: i2c: ds90ub960: Fix use of non-existing registers on UB9702
    f4e4373322f8 media: i2c: ds90ub9x3: Fix extra fwnode_handle_put()
    fd551f51908e media: ccs: Fix cleanup order in ccs_probe()
    c85a33577c11 media: ccs: Fix CCS static data parsing for large block sizes
    ffb7e57e40c6 media: stm32: dcmipp: correct dma_set_mask_and_coherent mask value
    920127636e58 media: ov5640: fix get_light_freq on auto
    1496ec94bd38 media: intel/ipu6: remove cpu latency qos request on error
    b2c82610ebef media: imx296: Add standby delay during probe
    bdd823b9d068 media: nuvoton: Fix an error check in npcm_video_ece_init()
    5100391acad4 media: mc: fix endpoint iteration
    8e95e0933aff media: mmp: Bring back registration of the device
    b64b7730879a soc: qcom: smem_state: fix missing of_node_put in error path
    2153c78328aa soc: qcom: llcc: Enable LLCC_WRCACHE at boot on X1
    270d7917b02b soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove
    532fd6c0070f soc: mediatek: mtk-devapc: Fix leaking IO map on error paths
    8fd332aebde3 soc: samsung: exynos-pmu: Fix uninitialized ret in tensor_set_bits_atomic()
    46607b0ab140 iommufd/fault: Use a separate spinlock to protect fault->deliver list
    97fff044f892 iommufd/fault: Destroy response and mutex in iommufd_fault_destroy()
    db22b33c7ec9 iommu/tegra241-cmdqv: Read SMMU IDR1.CMDQS instead of hardcoding
    5f4a0561783d iio: light: as73211: fix channel handling in only-color triggered buffer
    33c8c1d45a32 mm/hugetlb: fix avoid_reserve to allow taking folio from subpool
    fcffbb75db92 media: ccs: Clean up parsed CCS static data on parse failure
    2a54e8f1187c kfence: skip __GFP_THISNODE allocations on NUMA systems
    7caf6c4bc25a iommufd: Fix struct iommu_hwpt_pgfault init and padding
    e456a88bddae hrtimers: Force migrate away hrtimers queued after CPUHP_AP_HRTIMERS_DYING
    c287f18f646d rv: Reset per-task monitors also for idle tasks
    422d7f4e8d81 tpm: Change to kvalloc() in eventlog/acpi.c
    bef994de9980 ACPI: PRM: Remove unnecessary strict handler address checks
    a468d0585d98 accel/ivpu: Clear runtime_error after pm_runtime_resume_and_get() fails
    31c2134667ee xfs: Add error handling for xfs_reflink_cancel_cow_range
    a5e7a81e3a60 xfs: Propagate errors from xfs_reflink_cancel_cow_range in xfs_dax_write_iomap_end
    88678371a53e xfs: don't call remap_verify_area with sb write protection held
    df751229b5c6 pwm: microchip-core: fix incorrect comparison with max period
    386ee93cf0cf parisc: Temporarily disable jump label support
    a9fb1a44cfb2 arm64: tegra: Disable Tegra234 sce-fabric node
    36d6ea0000cd arm64: tegra: Fix typo in Tegra234 dce-fabric compatible
    b26dc27dd90f crypto: qce - fix priority to be less than ARMv8 CE
    6a59fe8bffff arm64: dts: qcom: sm8650: correct MDSS interconnects
    2b4cd9c82ce8 arm64: dts: qcom: sm8550: correct MDSS interconnects
    f456effc2c6d arm64: dts: qcom: sm8650: Fix MPSS memory length
    e37b8d8d6360 arm64: dts: qcom: sm8650: Fix CDSP memory length
    068a57a068a8 arm64: dts: qcom: sm8650: Fix ADSP memory base and length
    0ae91af31ce2 arm64: dts: qcom: sm8550: Fix MPSS memory length
    b416d7c207f2 arm64: dts: qcom: sm8550: Fix CDSP memory length
    c32e19dd39da arm64: dts: qcom: sm8550: Fix ADSP memory base and length
    c9555e8fe004 arm64: dts: qcom: sm8450: Fix MPSS memory length
    33821887be61 arm64: dts: qcom: sm8450: Fix CDSP memory length
    1376952ff24c arm64: dts: qcom: sm8450: Fix ADSP memory base and length
    589d36b20654 arm64: dts: qcom: sm8350: Fix MPSS memory length
    9ec362186877 arm64: dts: qcom: sm8350: Fix CDSP memory base and length
    9b2c1fa39cd7 arm64: dts: qcom: sm8350: Fix ADSP memory base and length
    6fd804a1f84a arm64: dts: qcom: sm6375: Fix MPSS memory base and length
    be52cd29f5bb arm64: dts: qcom: sm6375: Fix CDSP memory base and length
    b2a8ce68364f arm64: dts: qcom: sm6375: Fix ADSP memory length
    6aeb58dc6d39 arm64: dts: qcom: sm6350: Fix uart1 interconnect path
    78508f1ef817 arm64: dts: qcom: sm6350: Fix MPSS memory length
    7acd2cce0040 arm64: dts: qcom: sm6350: Fix ADSP memory length
    e73b392d82cd arm64: dts: qcom: sm6115: Fix ADSP memory base and length
    93d13d6a1a67 arm64: dts: qcom: sm6115: Fix CDSP memory length
    cb0391430d7b arm64: dts: qcom: sm6115: Fix MPSS memory length
    df06630449b9 arm64: dts: qcom: x1e80100: Fix CDSP memory length
    1552b3b80e31 arm64: dts: qcom: x1e80100: Fix ADSP memory base and length
    3052c4713764 arm64: dts: qcom: sdx75: Fix MPSS memory length
    e906ed7dd9c0 arm64: dts: mediatek: mt8183: Disable DPI display output by default
    f08524ae594c ARM: dts: ti/omap: gta04: fix pm issues caused by spi module
    8330abd5d373 ARM: dts: dra7: Add bus_dma_limit for l4 cfg bus
    15fd2e1ad5da ubi: Add a check for ubi_num
    247abefeb50d x86/boot: Use '-std=gnu11' to fix build with GCC 15
    c4abb4a010e5 x86/acpi: Fix LAPIC/x2APIC parsing order
    93893d741357 x86: rust: set rustc-abi=x86-softfloat on rustc>=1.86.0
    332e85d220ee rust: init: use explicit ABI to clean warning in future compilers
    cbcd8b83d22d kbuild: Move -Wenum-enum-conversion to W=2
    8db25d4c4a48 scsi: core: Do not retry I/Os during depopulation
    43b0b2a08f16 scsi: storvsc: Set correct data length for sending SCSI command without payload
    0c77c0d754fe scsi: ufs: core: Fix use-after free in init error and remove paths
    f77e890c7623 scsi: ufs: qcom: Fix crypto key eviction
    2cf3c3fe9a11 scsi: qla2xxx: Move FCE Trace buffer allocation to user control
    4367fb2a0841 scsi: st: Don't set pos_unknown just after device recognition
    2b3928b7c896 KVM: x86/mmu: Ensure NX huge page recovery thread is alive before waking
    2c4cda456ee5 nvme-pci: Add TUXEDO IBP Gen9 to Samsung sleep quirk
    9fbac831005c nvme-pci: Add TUXEDO InfinityFlex to Samsung sleep quirk
    b5cacfd06706 PCI: dwc: ep: Prevent changing BAR size/flags in pci_epc_set_bar()
    36786d1a45c6 PCI: dwc: ep: Write BAR_MASK before iATU registers in pci_epc_set_bar()
    3d17a4bbf257 PCI: endpoint: Finish virtual EP removal in pci_epf_remove_vepf()
    5ee3dd6e59b8 PCI: Avoid putting some root ports into D3 on TUXEDO Sirius Gen1
    a1ecc325416a s390/pci: Fix SR-IOV for PFs initially in standby
    ef814c884151 arm64: tegra: Fix Tegra234 PCIe interrupt-map
    679beb818093 ALSA: hda: Fix headset detection failure due to unstable sort
    cf5870192a0a ALSA: hda/realtek: Fix quirk matching for Legion Pro 7
    965e7d9ad7fa ALSA: hda/realtek: Enable headset mic on Positivo C6400
    fee921e3c641 firmware: qcom: scm: Fix missing read barrier in qcom_scm_get_tzmem_pool()
    0d712f9b4b30 firmware: qcom: scm: Fix missing read barrier in qcom_scm_is_available()
    0a14a2b84177 Revert "media: uvcvideo: Require entities to have a non-zero unique ID"
    68f16d3034a0 block: don't revert iter for -EIOCBQUEUED
    8a844ea6d73f Revert "MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT"
    6d76a2a72c2e MIPS: pci-legacy: Override pci_address_to_pio
    0bf083a80373 mips/math-emu: fix emulation of the prefx instruction
    68a25ceb11cd dm-crypt: track tag_offset in convert_context
    d0b81ea5a513 dm-crypt: don't update io->sector after kcryptd_crypt_write_io_submit()
    211473af5858 powerpc/pseries/eeh: Fix get PE state translation
    e2bc9a5d7a23 LoongArch: Extend the maximum number of watchpoints
    9b5922b0fab4 MIPS: Loongson64: remove ROM Size unit in boardinfo
    ee95d0843a49 serial: sh-sci: Do not probe the serial port if its slot in sci_ports[] is in use
    7ec1dc3d579d serial: sh-sci: Drop __initdata macro for port_cfg
    407c928305c1 soc: qcom: socinfo: Avoid out of bounds read of serial number
    62746ec80dfb ASoC: acp: Support microphone from Lenovo Go S
    a198ee66328d arm64: dts: qcom: x1e80100: Fix usb_2 controller interrupts
    3a42fd8626d2 arm64: dts: qcom: x1e80100-microsoft-romulus: Fix USB QMP PHY supplies
    fdad58e0b85e arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix USB QMP PHY supplies
    25bc7ee64bd5 arm64: dts: qcom: x1e80100-crd: Fix USB QMP PHY supplies
    b42072041f03 arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix USB QMP PHY supplies
    b4c67165fc30 arm64: dts: qcom: x1e80100-qcp: Fix USB QMP PHY supplies
    b7da8e54480d arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix USB QMP PHY supplies
    829a5645616f usbnet: ipheth: document scope of NCM implementation
    5835bf66c50a usbnet: ipheth: fix DPE OoB read
    c0912ae6586e usbnet: ipheth: break up NCM header size computation
    cf63d65ab9bb usbnet: ipheth: refactor NCM datagram loop
    387ec9277a9e usbnet: ipheth: check that DPE points past NCM header
    cf1ac7f7cf60 usbnet: ipheth: use static NDP16 location in URB
    d677e7dd59ad usbnet: ipheth: fix possible overflow in DPE length check
    df5bc4891b3d usb: gadget: f_tcm: Don't prepare BOT write request twice
    3e01f162a10a usb: gadget: f_tcm: ep_autoconfig with fullspeed endpoint
    0c3d544b61c6 usb: gadget: f_tcm: Decrement command ref count on cleanup
    5ff4628b8dcf usb: gadget: f_tcm: Translate error to sense
    0ee1df18f27d wifi: rtw88: 8703b: Fix RX/TX issues
    a64cf5532719 wifi: mt76: mt7915: add module param to select 5 GHz or 6 GHz on MT7916
    46fa0c08d223 wifi: rtw88: sdio: Fix disconnection after beacon loss
    59dd56cf3b70 wifi: mt76: mt7921u: Add VID/PID for TP-Link TXE50UH
    fbbfef2a5b85 wifi: brcmfmac: fix NULL pointer dereference in brcmf_txfinalize()
    e3f7ee7a2dff wifi: rtlwifi: rtl8821ae: Fix media status report
    d0bf6bfc9cf2 atomic64: Use arch_spin_locks instead of raw_spin_locks
    ed0ad04c6825 ring-buffer: Do not allow events in NMI with generic atomic64 cmpxchg()
    416d22fe8c18 HID: hid-sensor-hub: don't use stale platform-data on remove
    c866c0056093 Input: bbnsm_pwrkey - add remove hook
    5b91440ebef9 of: reserved-memory: Fix using wrong number of cells to get property 'alignment'
    4e4b3d492673 of: Fix of_find_node_opts_by_path() handling of alias+path+options
    e62c63081020 of: address: Fix empty resource handling in __of_address_resource_bounds()
    45ad3c7d62eb of: Correct child specifier used as input of the 2nd nexus node
    ae959ab075fb scsi: ufs: core: Fix the HIGH/LOW_TEMP Bit Definitions
    3fb0f8df1d02 perf bench: Fix undefined behavior in cmpworker()
    acd8ff789bf1 efi: libstub: Use '-std=gnu11' to fix build with GCC 15
    2ce09aabe009 blk-cgroup: Fix class @block_class's subsystem refcount leakage
    5a262628f4cf seccomp: passthrough uretprobe systemcall without filtering
    c4241c04df05 clk: mediatek: mt2701-mm: add missing dummy clk
    314edc5a52e6 clk: mediatek: mt2701-img: add missing dummy clk
    89843e4c7795 clk: mediatek: mt2701-bdp: add missing dummy clk
    b7b72c7f93fc clk: mediatek: mt2701-aud: fix conversion to mtk_clk_simple_probe
    234438b46322 clk: mediatek: mt2701-vdec: fix conversion to mtk_clk_simple_probe
    35ce9e7c9fce clk: qcom: clk-rpmh: prevent integer overflow in recalc_rate
    fe7ce4e583e0 clk: qcom: gcc-mdm9607: Fix cmd_rcgr offset for blsp1_uart6 rcg
    2dba8d5d423f clk: qcom: dispcc-sm6350: Add missing parent_map for a clock
    b6fe13566bf5 clk: qcom: gcc-sm6350: Add missing parent_map for two clocks
    a4911d6891bd clk: qcom: gcc-sm8650: Do not turn off PCIe GDSCs during gdsc_disable()
    e2dd0efa4d03 clk: qcom: gcc-sm8550: Do not turn off PCIe GDSCs during gdsc_disable()
    26dae7a6c080 clk: qcom: clk-alpha-pll: fix alpha mode configuration
    ea3f6ef7720b clk: clk-loongson2: Fix the number count of clk provider
    15413c1a6551 media: i2c: ds90ub960: Fix UB9702 refclk register access
    eca01d5911fb clk: mmp2: call pm_genpd_init() only after genpd.name is set
    410586e60037 clk: sunxi-ng: a100: enable MMC clock reparenting
    3192f1c54ddd KEYS: trusted: dcp: fix improper sg use with CONFIG_VMAP_STACK=y
    ddfc234761a4 Bluetooth: L2CAP: accept zero as a special value for MTU auto-selection
    691218a50c31 Bluetooth: L2CAP: handle NULL sock pointer in l2cap_sock_alloc
    7173b70df472 drm/amd/display: Fix seamless boot sequence
    20a57f68db1b drm/amdgpu: add a BO metadata flag to disable write compression for Vulkan
    4b1d3186284f drm/i915: Drop 64bpp YUV formats from ICL+ SDR planes
    c842f22fc26e drm/i915/dp: Iterate DSC BPP from high to low on all platforms
    b20ecb792c00 drm/xe/devcoredump: Move exec queue snapshot to Contexts section
    36b9be873809 drm/komeda: Add check for komeda_get_layer_fourcc_list()
    2708a151e0e9 drm/i915: Fix page cleanup on DMA remap failure
    5775ef49d792 drm/i915/guc: Debug print LRC state entries only if the context is pinned
    95c75578c420 Revert "drm/amd/display: Use HW lock mgr for PSR1"
    4d23b42a45dc drm/amdkfd: Block per-queue reset when halt_if_hws_hang=1
    89dcc75d5172 drm/amdkfd: only flush the validate MES contex
    7e207a094ee6 drm/amd/amdgpu: change the config of cgcg on gfx12
    721a493fa2a5 drm/amd/pm: Mark MM activity as unsupported
    3ec8e3dab60c drm/amd/display: Optimize cursor position updates
    b4b902737746 ksmbd: fix integer overflows on 32 bit systems
    5b199733b901 KVM: s390: vsie: fix some corner-cases when grabbing vsie pages
    27f651d28fee kvm: defer huge page recovery vhost task to later
    f2f805ada63b KVM: Explicitly verify target vCPU is online in kvm_get_vcpu()
    dd78c25a14fe remoteproc: omap: Handle ARM dma_iommu_mapping
    f50ed030dbf0 arm64: dts: rockchip: increase gmac rx_delay on rk3399-puma
    5f50c5586c77 drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()
    de3ffeb2122e KVM: arm64: timer: Always evaluate the need for a soft timer
    e5251ae5d3c0 arm64/mm: Reduce PA space to 48 bits when LPA2 is not enabled
    c66e5205fd22 arm64/sme: Move storage of reg_smidr to __cpuinfo_store_cpu()
    8abf61300643 arm64/mm: Override PARange for !LPA2 and use it consistently
    5a6520493c41 arm64/kvm: Configure HYP TCR.PS/DS based on host stage1
    1b705df8ecdb accel/ivpu: Fix Qemu crash when running in passthrough
    a009378af674 binfmt_flat: Fix integer overflow bug on 32 bit systems
    f735c9d4dc93 fs/proc: do_task_stat: Fix ESP not readable during coredump
    36bcdf340017 m68k: vga: Fix I/O defines
    4204ca15ec5e arm64: Filter out SVE hwcaps when FEAT_SVE isn't implemented
    6e83f167bb10 s390/futex: Fix FUTEX_OP_ANDN implementation
    2b7f9749e6b3 md: reintroduce md-linear
    7ec4ef57aec1 smb: client: change lease epoch type from unsigned int to __u16
    e776cff5ed1e smb: client: fix order of arguments of tracepoints
    ac7b5f3e4d5b drm/client: Handle tiled displays better
    b865c6a6178b drm/modeset: Handle tiled displays in pan_display_atomic.
    843bd0089c06 cifs: Remove intermediate object of failed create SFU call
    0a2beaa95f74 ALSA: hda/realtek: Enable Mute LED on HP Laptop 14s-fq1xxx
    37cab2868e5c leds: lp8860: Write full EEPROM, not only half of it
    ab061462be52 cpufreq: s3c64xx: Fix compilation warning
    9325895e4162 cpufreq: fix using cpufreq-dt as module
    ac52c98e1ff3 rxrpc: Fix call state set to not include the SERVER_SECURING state
    181b23ca2ef0 net: sched: Fix truncation of offloaded action statistics
    e36364d5d434 tun: revert fix group permission check
    631255524908 netem: Update sch->q.qlen before qdisc_tree_reduce_backlog()
    e40cb34b7f24 pfifo_tail_enqueue: Drop new packet when sch->limit == 0
    bb6f3569dd0b ACPI: property: Fix return value for nval == 0 in acpi_data_prop_read()
    d5079b8f34f9 x86/xen: add FRAME_END to xen_hypercall_hvm()
    4890a0858c09 x86/xen: fix xen_hypercall_hvm() to not clobber %rbx
    f014a926eb5a gpio: sim: lock hog configfs items if present
    970cd2ed26cd net: rose: lock the socket in rose_bind()
    2e53fb8afe41 net: atlantic: fix warning during hot unplug
    1ecc3bed3846 gpio: pca953x: Improve interrupt support
    d1754c69448f rxrpc: Fix the rxrpc_connection attend queue handling
    3139a7024e9a ethtool: rss: fix hiding unsupported fields in dumps
    4c6ed049bc4e drm/i915/dp: fix the Adaptive sync Operation mode for SDP
    83ebf741aa64 udp: gso: do not drop small packets when PMTU reduces
    b55dfd7bac24 tg3: Disable tg3 PCIe AER on system reboot
    2bd762847d20 vmxnet3: Fix tx queue race condition with XDP
    f21d479c1f69 ice: Add check for devm_kzalloc()
    acd5f07e9f0f net: bcmgenet: Correct overlaying of PHY and MAC Wake-on-LAN
    8ed1b13a38d7 nvme-fc: use ctrl state getter
    5eba53a9eaf8 nvme: make nvme_tls_attrs_group static
    ab7522ce29fd ice: stop storing XDP verdict within ice_rx_buf
    50e4b64a2d4a ice: gather page_count()'s of each frag right before XDP prog call
    311813ed013c ice: put Rx buffers after being done with current frame
    ec53033c5723 gpu: drm_dp_cec: fix broken CEC adapter properties check
    fd6df04a91e8 firmware: iscsi_ibft: fix ISCSI_IBFT Kconfig entry
    bc85817e6bc0 nvme: handle connectivity loss in nvme_set_queue_count
    57e07d10b338 sched/fair: Fix inaccurate h_nr_runnable accounting with delayed dequeue
    1c1c91bf05ef platform/x86: serdev_helpers: Check for serial_ctrl_uid == NULL
    e46d91ca504d tty: Permit some TIOCL_SETSEL modes without CAP_SYS_ADMIN
    9b88a7c4584b tty: xilinx_uartps: split sysrq handling
    30c6a7a9da55 xfs: don't over-report free space or inodes in statvfs
    1f88b5c4f992 xfs: report realtime block quota limits on realtime directories
    4e144498d16b drm/amdgpu: Fix Circular Locking Dependency in AMDGPU GFX Isolation
    48fe216d7db6 KVM: e500: always restore irqs
    833f69be62ac KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
    f2623aec7fdc KVM: PPC: e500: Mark "struct page" pfn accessed before dropping mmu_lock
    dec857329fb9 KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()
    7056d426a637 platform/x86: acer-wmi: Ignore AC events
    c74d1721804a platform/x86: acer-wmi: add support for Acer Nitro AN515-58
    33a4a9f54ae9 Input: allocate keycode for phone linking
    999531398e15 ASoC: amd: Add ACPI dependency to fix build error
    06fe7c32d58a platform/x86: acer-wmi: Add support for Acer Predator PH16-72
    90778f31efdf ASoC: soc-pcm: don't use soc_pcm_ret() on .prepare callback
    c021dc03bfa7 platform/x86: acer-wmi: Add support for Acer PH14-51
    0a30353beca2 platform/x86: int3472: Check for adev == NULL
    c578aedea2a1 iommu/arm-smmu-v3: Clean up more on probe failure
    d888437bd317 iommu/arm-smmu-qcom: add sdm670 adreno iommu compatible
    0f76d831070c ASoC: Intel: sof_sdw: Correct quirk for Lenovo Yoga Slim 7
    06a0e2a320a5 x86/kexec: Allocate PGD for x86_64 transition page tables separately
    e012a77e4d76 ASoC: SOF: Intel: hda-dai: Ensure DAI widget is valid during params
    82b44cdb0355 net: ethernet: ti: am65-cpsw: ensure proper channel cleanup in error path
    4f60eff8b5e6 selftests/net/ipsec: Fix Null pointer dereference in rtattr_pack()
    c257c15845e7 tipc: re-order conditions in tipc_crypto_key_rcv()
    6bb91eb7c079 octeon_ep_vf: update tx/rx stats locally for persistence
    09c86dc2ada1 octeon_ep: update tx/rx stats locally for persistence
    30d003f24a93 mmc: sdhci-msm: Correctly set the load for the regulator
    ca06b3769c93 HID: hid-asus: Disable OOBE mode on the ProArt P16
    2785019ea03a net: wwan: iosm: Fix hibernation by re-binding the driver around it
    ebb90f23f0ac Bluetooth: MGMT: Fix slab-use-after-free Read in mgmt_remove_adv_monitor_sync
    c3a1c34110ed Bluetooth: btusb: Add new VID/PID 13d3/3628 for MT7925
    7e55e224300e Bluetooth: btusb: Add new VID/PID 13d3/3610 for MT7922
    584b3e250ee0 APEI: GHES: Have GHES honor the panic= setting
    a54240c71d57 i2c: Force ELAN06FA touchpad I2C bus freq to 100KHz
    d822b30c077a wifi: iwlwifi: avoid memory leak
    131dd3e936d1 wifi: iwlwifi: pcie: Add support for new device ids
    7ef2ea142968 wifi: brcmfmac: Check the return value of of_property_read_string_index()
    62483e0a1fbf net/mlx5: use do_aux_work for PHC overflow checks
    adcb8ce68dde HID: Wacom: Add PCI Wacom device support
    e557b15ea2ec HID: multitouch: Add quirk for Hantick 5288 touchpad
    9e6b899883a2 clk: qcom: Make GCC_8150 depend on QCOM_GDSC
    36720607c909 wifi: rtw88: add __packed attribute to efuse layout struct
    6e1feb300fcb mfd: lpc_ich: Add another Gemini Lake ISA bridge PCI device-id
    c9382f380e8d tomoyo: don't emit warning in tomoyo_write_control()
    c27ce584d274 wifi: brcmsmac: add gain range check to wlc_phy_iqcal_gainparams_nphy()
    60fd500eda3e mmc: sdhci-esdhc-imx: enable 'SDHCI_QUIRK_NO_LED' quirk for S32G
    f4b8bac3cfe4 mmc: core: Respect quirk_max_rate for non-UHS SDIO card
    5c2b1d938613 tun: fix group permission check
    9543e67fa364 wifi: rtw89: add crystal_cap check to avoid setting as overflow value
    22a1a758183d ring-buffer: Make reading page consistent with the code logic
    d1544dc32c67 drm/amd/display: Limit Scaling Ratio on DCN3.01
    835d37b60bc3 drm/amd/display: Increase sanitizer frame larger than limit when compile testing with clang
    36b385d0f2b4 safesetid: check size of policy writes
    52858d7fe6fb drm/bridge: it6505: fix HDCP CTS KSV list wait timer
    4ebd696fe716 drm/bridge: it6505: fix HDCP CTS compare V matching
    05040e0847d4 drm/bridge: it6505: fix HDCP encryption when R0 ready
    5d88251a8b5e drm/bridge: it6505: fix HDCP Bstatus check
    3a047075b47c drm/bridge: it6505: Change definition MAX_HDCP_DOWN_STREAM_COUNT
    d76dc02531a6 drm/amdkfd: Queue interrupt work to different CPU
    9f9524503375 drm/amdgpu: Don't enable sdma 4.4.5 CTXEMPTY interrupt
    b79eaf9b86a8 drm/amd/display: Fix Mode Cutoff in DSC Passthrough to DP2.1 Monitor
    1eec554f898b drm/vc4: hdmi: use eld_mutex to protect access to connector->eld
    68c3008b06d8 drm/sti: hdmi: use eld_mutex to protect access to connector->eld
    1cd3e56a07ac drm/radeon: use eld_mutex to protect access to connector->eld
    6b57c63f5bf6 drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
    cd604e8e993c drm/amd/display: use eld_mutex to protect access to connector->eld
    f1b4a5005c9e drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
    e43f3adba3dc drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
    b006aadf72f9 drm/connector: add mutex to protect ELD from concurrent access
    404e5fd918a0 printk: Fix signed integer overflow when defining LOG_BUF_LEN_MAX
    0412bca906d5 drm/amd/display: Overwriting dualDPP UBF values before usage
    d25d5eb35905 drm/amd/display: Populate chroma prefetch parameters, DET buffer fix
    ebf2d94128ef drm/tests: hdmi: return meaningful value from set_connector_edid()
    e0d048dabe33 drm/tests: hdmi: handle empty modes in find_preferred_mode()
    56e6c7f6d2a6 nvkm: correctly calculate the available space of the GSP cmdq buffer
    5185e63b45ea nvkm/gsp: correctly advance the read pointer of GSP message queue
    0877fd896ca4 drm: panel-backlight-quirks: Add Framework 13 glossy and 2.8k panels
    34004adc64e2 drm: panel-backlight-quirks: Add Framework 13 matte panel
    c5842f1dade0 drm: Add panel backlight quirks
    18daf9e83c4f drm/virtio: New fence for every plane update
    8b60f25c3e67 x86/amd_nb: Restrict init function to AMD-based systems
    149dd2acff5d lockdep: Fix upper limit for LOCKDEP_*_BITS configs
    fbcd9eedce20 locking/ww_mutex/test: Use swap() macro
    910d55f7d67d x86: Convert unreachable() to BUG()
    e5ff8d825db7 sched: Don't try to catch up excess steal time.
    d3ef1a2f77b8 btrfs: convert BUG_ON in btrfs_reloc_cow_block() to proper error handling
    5975577d8cd4 btrfs: fix data race when accessing the inode's disk_i_size at btrfs_drop_extents()
    46e9c4a376af s390/stackleak: Use exrl instead of ex in __stackleak_poison()
    38a1aa02b90b exec: fix up /proc/pid/comm in the execveat(AT_EMPTY_PATH) case
    72f02c34e58b arm64/mm: Ensure adequate HUGE_MAX_HSTATE
    86d71a026a7f btrfs: fix use-after-free when attempting to join an aborted transaction
    5ff189eb84f1 btrfs: do not output error message if a qgroup has been already cleaned up
    0ff88c2a742a btrfs: fix assertion failure when splitting ordered extent after transaction abort
    b19deb5acbc7 irqchip/lan966x-oic: Make CONFIG_LAN966X_OIC depend on CONFIG_MCHP_LAN966X_PCI
    807165b1ec1c tools/power/x86/intel-speed-select: Prefix header search path with sysroot
    e97df805b938 drm/tilcdc: Set preferred depth
    7160a4379dcc arch/arm64/configs: remove CONFIG_SM_DISPCC_8650
    6d8ac5ebe6e8 aufs6: core
    587abc1b64c4 aufs6: standalone
    1af41d30ef42 aufs6: mmap
    6ee2464d2e9d aufs6: base
    103b676505f7 aufs6: kbuild
    67281562943f qemux86: add configuration symbol to select values
    73f315ca0823 sched/isolation: really align nohz_full with rcu_nocbs
    1e4e7f8ab622 clear_warn_once: add a clear_warn_once= boot parameter
    918e7a825e8b clear_warn_once: bind a timer to written reset value
    f533f87c3758 clear_warn_once: expand debugfs to include read support
    f149ca27cba9 tools: Remove some options from CLANG_CROSS_FLAGS
    e633abe9c44e libbpf: Fix build warning on ref_ctr_off
    ec0916a4cfc1 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    03721ceb5626 perf: x86-32: explicitly include <errno.h>
    4c36c5295bb0 perf: mips64: Convert __u64 to unsigned long long
    b0200449610d perf: fix bench numa compilation
    aff0940b2212 perf: add SLANG_INC for slang.h
    ef912018d28c perf: add sgidefs.h to for mips builds
    d8860f858b87 perf: change --root to --prefix for python install
    dc38a0eee6e5 perf: add 'libperl not found' warning
    6ed51f8786da perf: force include of <stdbool.h>
    c538d4c4ac65 fat: Replace prandom_u32() with get_random_u32()
    63d94846f0c5 fat: don't use obsolete random32 call in namei_vfat
    7816667451ef FAT: Added FAT_NO_83NAME
    f81dbd60f0d5 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    771cdefba44b FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    a24784fd8f88 yaffs2: update to v6.12 folio changes
    d0a48fd46db8 yaffs2: adapt to v6.10 i_time changes
    d097e4d4115a yaffs: fix mtime/itime field access
    4411e0d49fe3 yaffs2: update VFS ctime operations to 6.6+
    1b6619086e8b yaffs2: v6.5 fixups
    25b261ee3c54 yaffs2: Fix miscalculation of devname buffer length
    5c07936a5d1c yaffs2: convert user_namespace to mnt_idmap
    55986a1284b3 yaffs2: replace bdevname call with sprintf
    6f5508f8db8f yaffs2: convert read_page -> readfolio
    fd179a5df5d5 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    c9a620dacdd1 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    78588208ed17 yaffs2: v5.12+ build fixups (not runtime tested)
    8d2dddba272c yaffs: include blkdev.h
    8c1ca9ef9712 yaffs: Fix build failure by handling inode i_version with proper atomic API
    27005cbac2ed yaffs2: v5.6 build fixups
    668211c9f9b7 yaffs2: fix memory leak when /proc/yaffs is read
    285f911dcc1c yaffs: add strict check when call yaffs_internal_read_super
    ffc2ed489ccf yaffs: repair yaffs_get_mtd_device
    6dce4b70a5e3 yaffs: Fix build failure by handling inode i_version with proper atomic API
    19f283abc5d1 yaffs2: fix memory leak in mount/umount
    04e84672b571 yaffs: Avoid setting any ACL releated xattr
    4f221d6a32e2 Yaffs:check oob size before auto selecting Yaffs1
    81f36004e56b fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    26d7a3dd0054 yaffs2: adjust to proper location of MS_RDONLY
    a7016eac4540 yaffs2: import git revision b4ce1bb (jan, 2020)
    feb240bbb91e initramfs: allow an optional wrapper script around initramfs generation
    874746eaa341 drivers: gpu: drm: msm: registers: improve reproducibility
    1d42508faee8 tools: use basename to identify file in gen-mach-types
    4b055eca593d iwlwifi: select MAC80211_LEDS conditionally
    97e20e275ac0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    6dec58319165 defconfigs: drop obselete options
    a416ccb5b6c9 linux-yocto: Handle /bin/awk issues
    7efe8a1e5158 uvesafb: provide option to specify timeout for task completion
    78d10ae07eca uvesafb: print error message when task timeout occurs
    80473b7eb8ca compiler.h: Undef before redefining __attribute_const__
    ddeff2f1a9a7 vmware: include jiffies.h
    3dcdda8912b4 Resolve jiffies wrapping about arp
    3b1507db6735 nfs: Allow default io size to be configured.
    c2fedad05f77 check console device file on fs when booting
    208d6fbada3f mount_root: clarify error messages for when no rootfs found
    dbe9454c8ea0 mconf: fix output of cflags and libraries
    7c7b224f5cce menuconfig,mconf-cfg: Allow specification of ncurses location
    b6c189c81397 modpost: mask trivial warnings
    a5cc21325ba9 kbuild: exclude meta directory from distclean processing
    361ec143c23f powerpc: serialize image targets
    605e6ccb304c arm: serialize build targets
    e94b04fcb7d2 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    44cc7f69a0a0 cpu/amd: inhibit SMP check for qemux86
    a08cb65331e6 x86_64_defconfig: Fix warnings
    8ad332ef777b mips: make current_cpu_data preempt safe
    754f05ddce3f mips: vdso: fix 'jalr $t9' crash in vdso code
    325ff78ff44d mips: Kconfig: add QEMUMIPS64 option
    99ae0eadcf11 4kc cache tlb hazard: tlbp cache coherency
    c6894c66a534 malta uhci quirks: make allowance for slow 4k(e)c
    8b52c01f3294 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    16c7629f035e drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    6b60c874cbb0 arm64: defconfig: cleanup config options
    8e44673ecd89 vexpress: Pass LOADADDR to Makefile
    f34e6805aad5 arm: ARM EABI socketcall
    94dec9b88de4 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index a7475dd4fd..bfd4212187 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "81e03d4794dcbe5a29307241dc110f42fa7d7f76"
-SRCREV_meta ?= "190a3cea8f7382423bc20fcde64847afc9e191ed"
+SRCREV_machine ?= "df1d139b08b489ba1becbf2c5609f7e87a891bb2"
+SRCREV_meta ?= "f24c58a63b7e047d2c4441dd2adc30de21c8814d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.13"
+LINUX_VERSION ?= "6.12.17"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 5890379dfb..77860639b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.13"
+LINUX_VERSION ?= "6.12.17"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a8ef1d3063769a834565490956e620d38c1ce708"
-SRCREV_meta ?= "190a3cea8f7382423bc20fcde64847afc9e191ed"
+SRCREV_machine ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
+SRCREV_meta ?= "f24c58a63b7e047d2c4441dd2adc30de21c8814d"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 6d8ce19efd..f97957d0fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6c4ce60cf79602b35d0dbb3528737ef9130baeb5"
-SRCREV_machine:qemuarm64 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
-SRCREV_machine:qemuloongarch64 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
-SRCREV_machine:qemumips ?= "8c0b66057f688ffac2ae035a8ee7385cd8d535e9"
-SRCREV_machine:qemuppc ?= "a8ef1d3063769a834565490956e620d38c1ce708"
-SRCREV_machine:qemuriscv64 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
-SRCREV_machine:qemuriscv32 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
-SRCREV_machine:qemux86 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
-SRCREV_machine:qemux86-64 ?= "a8ef1d3063769a834565490956e620d38c1ce708"
-SRCREV_machine:qemumips64 ?= "fd60fdcf820529aad2f28d498f7fccb5bce884d8"
-SRCREV_machine ?= "a8ef1d3063769a834565490956e620d38c1ce708"
-SRCREV_meta ?= "190a3cea8f7382423bc20fcde64847afc9e191ed"
+SRCREV_machine:qemuarm ?= "6bbf0f87ce16fb3287e38440f08832c3b0a73fd5"
+SRCREV_machine:qemuarm64 ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
+SRCREV_machine:qemuloongarch64 ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
+SRCREV_machine:qemumips ?= "b01c0e548f2cf0fe508e03c18fd5ca472f7aec05"
+SRCREV_machine:qemuppc ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
+SRCREV_machine:qemuriscv64 ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
+SRCREV_machine:qemuriscv32 ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
+SRCREV_machine:qemux86 ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
+SRCREV_machine:qemux86-64 ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
+SRCREV_machine:qemumips64 ?= "551ea60d261d79bdd132dde106705c2bbbfea75e"
+SRCREV_machine ?= "0542a5ac828c168b89b9e606d631adaa4eef7644"
+SRCREV_meta ?= "f24c58a63b7e047d2c4441dd2adc30de21c8814d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "984391de59a1d6918ac9ba63c095decbcfc85c71"
+SRCREV_machine:class-devupstream ?= "41b222412985dc8410b88fb7a0fda87e6640d4df"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.13"
+LINUX_VERSION ?= "6.12.17"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


