Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80FBE77198
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 14:08:26 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.31251.1735913296925954773
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 06:08:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wj9CPzS6;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6dcd4f1aaccso50000426d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735913296; x=1736518096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtIzVQYzEdoLJRvVyfKB3eOZM548Utj1yKpASfk5uIc=;
        b=Wj9CPzS6SDEzVKfeslvB0sHTLSkJPaJ5FMySI8xYy7AiJ6RpCUclPXiF1X9+HlPNAF
         BJjDYsFXnFB7Z+TTjnYc37nK1T9tHkHnadj3I5MrZo8ILEfLRIooaNP9IrgCbUcb5HHw
         cHKeEY/wv0fToEwtMp4JHvO9+YUlnquIurYnb4HsZJ6TXNawhi+gS9VgUHYH/esbh4Xk
         H7JymD+hCT65kKMWEdhSPcaQrie6upMEb55wG+6FkupYPfAX6ykujXNCJE+DgjQ0EzSM
         6Hs6M6SfXcuAjMKye35RoWW4phG0EZyJ7HFovdr3fbz+wDq5UFl+4LznVW4sYAzjkKBC
         VVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913296; x=1736518096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtIzVQYzEdoLJRvVyfKB3eOZM548Utj1yKpASfk5uIc=;
        b=S2Snb0l7gZgBdI2M3dh/5Zg8/Xl4PYhIpSV2s1ZF42SPBR1PagQmd7PNbSr0G70OPr
         8kSfyVIJCWzN1FHsCraJxOa/aJAK9peHttVytC4QAnJB5XZwT1Tx1T5i4P741zi0pd1V
         i9wZVYk/TasZCpiNECoTtKOETYpSb2QMb2e6QzYkX26MMjnwjz3jX7pB8k4el1oPMY9T
         evhLTBJZgkFvb+f7kJv9xw7s1wqscaa7qLOG+6IqXTRzH+rvnuPYuxU9/BOmyvLhVEsp
         kJPgwf5TKDi/USokb6i4gFF8wiIFVXQZ3B95FdETpVOz6tO6P8iIkFsks2yb8K81CawI
         bW4g==
X-Gm-Message-State: AOJu0YxErnKC17CC7+wnKboDWepkVpXHAX7mGu7MJGhfmhJugYTvcTIM
	csFfUtPkn1oAVVDj9FiVCIlwHwqqjY2MZlNhxG1ILA1wdiZF457JF7PpMqoDw6o=
X-Gm-Gg: ASbGnctZAb0wc8SXea2u8qrjqvWVNMchJfinOkCCsZl3vAmbRVHLIUgXCZpxy9/Gcut
	xIvjMAGMJsN0/na0gKJUDHs1U644xWivD6/T+jELoOdWRcf1ieDKe5he/kF0dQogc5hhysfv8vr
	9MxMTliODThzjyzG+bcPb99I28b/9tNOvcrbZ4rIXCpsQmzzP/OWf5NXvKh11dBF9pe2DERioLR
	t6HpbZxcCGwvmOXY/qlnqQ4XLhnFzJfXIy/891zBXxzkh8jZIbuP+vYBpXH5lNWMqfYcNALp0I3
	Et2y7cvTtFA6Y0qzzf2zeip4BU29y6/+Ib2Xu4o3991TC44dVK7WsMrLtw==
X-Google-Smtp-Source: AGHT+IFqcvVqqbA2vr0vPrjLz+65ziyD8bt1Ta96xwU3aWbNjjGXCjpvBUpjOF77hY9wk6niEeySMg==
X-Received: by 2002:a05:6214:240e:b0:6d8:9838:d3a9 with SMTP id 6a1803df08f44-6dd23356042mr713551556d6.26.1735913295228;
        Fri, 03 Jan 2025 06:08:15 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ddbe688b33sm18748286d6.84.2025.01.03.06.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:08:14 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/6.12: update to v6.12.5
Date: Fri,  3 Jan 2025 09:08:07 -0500
Message-Id: <fd9d4569aae3ccdba63a1e663555b95bd6af682d.1735913191.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1735913191.git.bruce.ashfield@gmail.com>
References: <cover.1735913191.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 14:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209349

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    7143efb58e33 Linux 6.12.5
    6aeef0214de7 softirq: Allow raising SCHED_SOFTIRQ from SMP-call-function on RT kernel
    1a678f6829a8 clocksource: Make negative motion detection more robust
    7b7a9175c63b timekeeping: Remove CONFIG_DEBUG_TIMEKEEPING
    a8c03c6dc1bd ALSA: hda/realtek: Fix spelling mistake "Firelfy" -> "Firefly"
    ef6bb8f4d8d3 s390/pci: Fix leak of struct zpci_dev when zpci_add_device() fails
    87917ad3034e Revert "drm/amd/display: parse umc_info or vram_info based on ASIC"
    eaf83f14c67e ALSA: hda: Fix build error without CONFIG_SND_DEBUG
    99a02eab8251 drm/amdgpu: rework resume handling for display (v2)
    b050c6284a20 ASoC: Intel: avs: Fix return status of avs_pcm_hw_constraints_init()
    871caea15202 net/mlx5: unique names for per device caches
    81d2c5968dba ocfs2: Revert "ocfs2: fix the la space leak when unmounting an ocfs2 volume"
    d38610a978d6 media: ipu6: use the IPU6 DMA mapping APIs to do mapping
    4904a01e4737 jffs2: Fix rtime decompressor
    dc39b08fcc38 jffs2: Prevent rtime decompress memory corruption
    547b7f8fdebc KVM: x86/mmu: Ensure that kvm_release_pfn_clean() takes exact pfn from kvm_faultin_pfn()
    7f91d9206220 selftests/ftrace: adjust offset for kprobe syntax error test
    ad4095d1259d vfio/mlx5: Align the page tracking max message size with the device capability
    0a5152f5fbe7 Revert "unicode: Don't special case ignorable code points"
    7913d1f737c4 x86: Fix build regression with CONFIG_KEXEC_JUMP enabled
    364dc8070baf tracing/eprobe: Fix to release eprobe when failed to add dyn_event
    07bc1978d59b clk: en7523: Initialize num before accessing hws in en7523_register_clocks()
    650214c925e8 btrfs: fix missing snapshot drew unlock when root is dead during swap activation
    653b704e7db6 btrfs: fix mount failure due to remount races
    b633b3c3e370 btrfs: drop unused parameter data from btrfs_fill_super()
    b680ec3ad29b btrfs: drop unused parameter options from open_ctree()
    e41074904d9e sched/deadline: Fix warning in migrate_enable for boosted tasks
    b4ec68868c20 sched/core: Prevent wakeup of ksoftirqd during idle load balance
    f9e144a54428 sched/fair: Check idle_cpu() before need_resched() to detect ilb CPU turning busy
    a39ad4f507bf sched/core: Remove the unnecessary need_resched() check in nohz_csd_func()
    5c3fb75f538c sched: fix warning in sched_setaffinity
    4a2fcf88be76 drm/amd/display: Add option to retrieve detile buffer size
    7bcf6b3cc92a drm/xe/devcoredump: Update handling of xe_force_wake_get return
    deb05f8431f3 drm/xe/forcewake: Add a helper xe_force_wake_ref_has_domain()
    e7fd13686ae0 drm/xe/guc: Copy GuC log prior to dumping
    e3e6bea207ff drm/xe/devcoredump: Add ASCII85 dump helper function
    47c45a050d09 drm/xe/devcoredump: Improve section headings and add tile info
    7e4b4543078f drm/xe/devcoredump: Use drm_puts and already cached local variables
    cd188519d246 scsi: ufs: pltfrm: Dellocate HBA during ufshcd_pltfrm_remove()
    d5b2ddf1f90c io_uring/tctx: work around xa_store() allocation error issue
    1f659d3c13f8 setlocalversion: work around "git describe" performance
    a21406d31414 smb: client: don't try following DFS links in cifs_tree_connect()
    9ac8c1da9f82 irqchip/gicv3-its: Add workaround for hip09 ITS erratum 162100801
    950210c9c721 Revert "nvme: make keep-alive synchronous operation"
    1648c7000f9d serial: 8250_dw: Add Sophgo SG2044 quirk
    f43324df566a rtc: cmos: avoid taking rtc_lock for extended period of time
    65570470175c misc: eeprom: eeprom_93cx6: Add quirk for extra read clock cycle
    296a109fa771 powerpc/prom_init: Fixup missing powermac #size-cells
    01e49d7f3f50 ASoC: amd: yc: Add quirk for microphone on Lenovo Thinkpad T14s Gen 6 21M1CTO1WW
    01575f2ff8ba MIPS: Loongson64: DTS: Really fix PCIe port nodes for ls7a
    3c1d06bbad22 drm/amdgpu/vcn: reset fw_shared when VCPU buffers corrupted on vcn v4.0.3
    e451d7ca7870 ASoC: amd: yc: fix internal mic on Redmi G 2022
    b03142825986 usb: typec: ucsi: glink: be more precise on orientation-aware ports
    359eebd5e7f6 iio: light: ltr501: Add LTER0303 to the supported devices
    c5d8facf107a iio: adc: ad7192: properly check spi_get_device_match_data()
    c0ca6fd5f6eb usb: typec: ucsi: Do not call ACPI _DSM method for UCSI read operations
    37065eee084e usb: chipidea: udc: handle USB Error Interrupt if IOC not set
    f14e63cf8649 usb: chipidea: udc: create bounce buffer for problem sglist entries if possible
    8a5c06ebc2ee usb: chipidea: udc: limit usb request length to max 16KB
    b89bbf32fc46 usb: chipidea: add CI_HDRC_HAS_SHORT_PKT_LIMIT flag
    4bbdddcefeb5 regulator: qcom-rpmh: Update ranges for FTSMPS525
    db7fc56646ca fs/ntfs3: Fix case when unmarked clusters intersect with zone
    58edd785ea14 fs/ntfs3: Fix warning in ni_fiemap
    6575e0867bd4 LoongArch: Fix sleeping in atomic context for PREEMPT_RT
    4806ed7abddc ACPI: x86: Clean up Asus entries in acpi_quirk_skip_dmi_ids[]
    ac0536c564ec ACPI: x86: Add skip i2c clients quirk for Acer Iconia One 8 A1-840
    7c2e5ed2175e f2fs: add a sysfs node to limit max read extent count per-inode
    924f7dd1e832 f2fs: fix to shrink read extent node in batches
    6d41a2d5c168 f2fs: print message if fscorrupted was found in f2fs_new_node_page()
    1f51ae217d09 i3c: Use i3cdev->desc->info instead of calling i3c_device_get_info() to avoid deadlock
    fb80d442c896 remoteproc: qcom: pas: enable SAR2130P audio DSP support
    617bd1e6c394 PCI: Add ACS quirk for Wangxun FF5xxx NICs
    51276b5e28cf PCI: Add 'reset_subordinate' to reset hierarchy below bridge
    ea1adfd7d0fc PCI: starfive: Enable controller runtime PM before probing host bridge
    932a5f00a808 PCI: Detect and trust built-in Thunderbolt chips
    293debb105cf PCI: vmd: Set devices to D0 before enabling PM L1 Substates
    34883c93bd33 PCI: vmd: Add DID 8086:B06F and 8086:B60B for Intel client SKUs
    b51aa6a07ee0 PCI: qcom: Add support for IPQ9574
    19cc5767334b i3c: mipi-i3c-hci: Mask ring interrupts before ring stop request
    7e45af15cf72 KMSAN: uninit-value in inode_go_dump (5)
    9e28513fd285 f2fs: fix f2fs_bug_on when uninstalling filesystem call f2fs_evict_inode.
    d6855f060443 mailbox: pcc: Check before sending MCTP PCC response ACK
    67f21fdd35a9 verification/dot2: Improve dot parser robustness
    98bf83f0e44d tools/rtla: Enhance argument parsing in timerlat_load.py
    7214d3a64e6e tracing: Fix function name for trampoline
    d58ed5c2813c smb: client: memcpy() with surrounding object base address
    1c67333b8feb nvdimm: rectify the illogical code within nd_dax_probe()
    a5289e7085ff thermal/drivers/qcom/tsens-v1: Add support for MSM8937 tsens
    d7145e6af9e7 pinctrl: qcom: spmi-mpp: Add PM8937 compatible
    ec6d6a0c448f pinctrl: qcom-pmic-gpio: add support for PM8937
    b04ca7b0649d scsi: st: Add MTIOCGET and MTLOAD to ioctls allowed after device reset
    16f5f485774e scsi: st: Don't modify unknown block number in MTIOCGET
    bb4a6236a430 leds: class: Protect brightness_show() with led_cdev->led_access mutex
    f29438bcfad0 clk: qcom: clk-alpha-pll: Add NSS HUAYRA ALPHA PLL support for ipq9574
    a6096f091c68 clk: qcom: dispcc-sm8550: enable support for SAR2130P
    082b6e35ff2f clk: qcom: tcsrcc-sm8550: add SAR2130P support
    ecc8f3c06edd clk: qcom: rpmh: add support for SAR2130P
    ec81102ae27f clk: qcom: rcg2: add clk_rcg2_shared_floor_ops
    e4913d4bc592 scsi: lpfc: Prevent NDLP reference count underflow in dev_loss_tmo callback
    32a2d387822b scsi: lpfc: Check SLI_ACTIVE flag in FDMI cmpl before submitting follow up FDMI
    78ef7c3909a5 scsi: lpfc: Call lpfc_sli4_queue_unset() in restart and rmmod paths
    2fcb921c2799 bpf: put bpf_link's program when link is safe to be deallocated
    a95387d8f54c iommu/amd: Fix corruption when mapping large pages from 0
    b865d4e56928 scsi: ufs: core: Make DMA mask configuration more flexible
    c11e2ec9a780 pinmux: Use sequential access to access desc->pinmux data
    09c083fbea76 ring-buffer: Limit time with disabled interrupts in rb_check_pages()
    6c55f9912307 scsi: hisi_sas: Create all dump files during debugfs initialization
    601f8001373f scsi: hisi_sas: Add cond_resched() for no forced preemption model
    caa061be068b rtla/timerlat: Make timerlat_hist_cpu->*_count unsigned long long
    76e00648ebf4 rtla/timerlat: Make timerlat_top_cpu->*_count unsigned long long
    020d042d03e2 tools/rtla: fix collision with glibc sched_attr/sched_set_attr
    d1133dd57ef8 tracing: Use atomic64_inc_return() in trace_clock_counter()
    f63a1caae97d tracing/ftrace: disable preemption in syscall probe
    5f87f1b22f3f rtla: Fix consistency in getopt_long for timerlat_hist
    53835aaccc2c pinctrl: freescale: fix COMPILE_TEST error with PINCTRL_IMX_SCU
    9556551a6d91 netpoll: Use rcu_access_pointer() in __netpoll_setup
    166cf430706d net/neighbor: clear error in case strict check is not set
    4f995f5b1633 rocker: fix link status detection in rocker_carrier_init()
    f5cc301e98a6 ASoC: hdmi-codec: reorder channel allocation list
    058067b73b9d Bluetooth: btusb: Add 3 HWIDs for MT7925
    01649f8d6d93 Bluetooth: btusb: Add new VID/PID 0489/e124 for MT7925
    b476133f037e Bluetooth: btusb: Add new VID/PID 0489/e111 for MT7925
    f64f7ff29701 Bluetooth: Set quirks for ATS2851
    359fc41e3c4f Bluetooth: Support new quirks for ATS2851
    b04b4fb91d42 Bluetooth: Add new quirks for ATS2851
    93a6160dc198 Bluetooth: hci_core: Fix not checking skb length on hci_acldata_packet
    c55a4c5a04ba Bluetooth: hci_conn: Use disable_delayed_work_sync
    1de7ce1a88cd Bluetooth: btusb: Add USB HW IDs for MT7920/MT7925
    05c10ebcbfde Bluetooth: btusb: Add RTL8852BE device 0489:e123 to device tables
    da561d5fb646 Bluetooth: hci_conn: Reduce hci_conn_drop() calls in two functions
    6e72b117614c i2c: i801: Add support for Intel Panther Lake
    1ab42ad28076 dsa: qca8k: Use nested lock to avoid splat
    9fbc0ece455e mptcp: fix possible integer overflow in mptcp_reset_tout_timer
    a50b4aa3007e bpf: Call free_htab_elem() after htab_unlock_bucket()
    34941321b516 wifi: brcmfmac: Fix oops due to NULL pointer dereference in brcmf_sdiod_sglist_rw()
    d82d48ab0c8c wifi: ipw2x00: libipw_rx_any(): fix bad alignment
    76649ccf97e2 drm/amdgpu: set the right AMDGPU sg segment limitation
    920159e1bf17 ALSA: usb-audio: Make mic volume workarounds globally applicable
    67a11de8965c virtio-net: fix overflow inside virtnet_rq_alloc
    8a71e5b65308 drm/amdgpu: skip amdgpu_device_cache_pci_state under sriov
    60dde89f944c drm/amd/display: Prune Invalid Modes For HDMI Output
    f46e40df44a9 drm/amd/display: parse umc_info or vram_info based on ASIC
    8ffd4262463d drm/amd/display: Remove hw w/a toggle if on DP2/HPO
    229d16a67093 drm/panic: Add ABGR2101010 support
    051f49d51766 net/tcp: Add missing lockdep annotations for TCP-AO hlist traversals
    bd9287ae1e85 fsl/fman: Validate cell-index value obtained from Device Tree
    8a4311bbde70 jfs: add a check to prevent array-index-out-of-bounds in dbAdjTree
    8ff757955457 jfs: fix array-index-out-of-bounds in jfs_readdir
    52756a57e978 jfs: fix shift-out-of-bounds in dbSplit
    22dcbf7661c6 jfs: array-index-out-of-bounds fix in dtReadFirst
    f2b95248a16c dma-debug: fix a possible deadlock on radix_lock
    477aa7116a76 mptcp: annotate data-races around subflow->fully_established
    cc97e79832fb drm/amd/display: Fix underflow when playing 8K video in full screen mode
    9f0cb200f469 ASoC: Intel: soc-acpi-intel-arl-match: Add rt722 and rt1320 support
    4ed4aa24b0f8 ASoC: sdw_utils: Add quirk to exclude amplifier function
    d86db5fd8a23 drm/amdgpu: refine error handling in amdgpu_ttm_tt_pin_userptr
    76d6bff2f847 netlink: specs: Add missing bitset attrs to ethtool spec
    7560543ee11f drm/amdgpu: Dereference the ATCS ACPI buffer
    f034130a7e22 drm/amdgpu: clear RB_OVERFLOW bit when enabling interrupts for vega20_ih
    dbb662d6dde2 drm/amdgpu/gfx9: Add cleaner shader for GFX9.4.2
    dff526dc3e27 drm/amd/display: Adding array index check to prevent memory corruption
    2da108b4b5fb drm/sched: memset() 'job' in drm_sched_job_init()
    3e75b36733dd net: stmmac: Programming sequence for VLAN packets with split header
    cdacfe413b6a net: sfp: change quirks for Alcatel Lucent G-010S-P
    53145c20ab06 drm/panel: simple: Add Microchip AC69T88A LVDS Display panel
    b9c6b66865d6 drm/xe/guc/ct: Flush g2h worker in case of g2h response timeout
    cccaab2b8d63 ASoC: Intel: sof_sdw: Add quirks for some new Lenovo laptops
    b55418d835bd ASoC: Intel: sof_sdw: Add quirk for cs42l43 system using host DMICs
    3b3526352977 ASoC: sdw_utils: Add a quirk to allow the cs42l43 mic DAI to be ignored
    93d419a5532e ASoC: sdw_utils: Add support for exclusion DAI quirks
    987aa730bad3 bpf: Prevent tailcall infinite loop caused by freplace
    5b6209c793ef fanotify: allow reporting errors on failure to open fd
    6cd0f8f2f317 wifi: ath5k: add PCI ID for Arcadyan devices
    778c0bbc9f43 wifi: ath5k: add PCI ID for SX76X
    543c0924d446 wifi: ath10k: avoid NULL pointer error during sdio remove
    f44fceb71d72 net: inet6: do not leave a dangling sk pointer in inet6_create()
    691d6d816f93 net: inet: do not leave a dangling sk pointer in inet_create()
    03caa9bfb9fd net: ieee802154: do not leave a dangling sk pointer in ieee802154_create()
    8df832e6b945 net: af_can: do not leave a dangling sk pointer in can_create()
    32df687e129e Bluetooth: RFCOMM: avoid leaving dangling sk pointer in rfcomm_sock_alloc()
    61686abc2f3c Bluetooth: L2CAP: do not leave dangling sk pointer on error in l2cap_sock_create()
    fd09880b16d3 af_packet: avoid erroring out after sock_init_data() in packet_create()
    ef18243f8ecb net/sched: cbs: Fix integer overflow in cbs_set_port_rate()
    ff3e39bc3cc6 net: ethernet: fs_enet: Use %pa to format resource_size_t
    821e3dc5cb44 net: fec_mpc52xx_phy: Use %pa to format resource_size_t
    9e5d6a4caebe drm/amd/display: Full exit out of IPS2 when all allow signals have been cleared
    3151d7859f93 accel/qaic: Add AIC080 support
    2093f062b268 wifi: ath12k: fix atomic calls in ath12k_mac_op_set_bitrate_mask()
    fbdf26dcc6d6 samples/bpf: Fix a resource leak
    8945c33b0500 r8169: don't apply UDP padding quirk on RTL8126A
    c76d0ebea9b4 ALSA: hda/realtek: Use codec SSID matching for Lenovo devices
    753693b1ba0a ALSA: hda/conexant: Use the new codec SSID matching
    074b2b0a4d52 ALSA: hda: Use own quirk lookup helper
    07a4acea17f5 drm/display: Fix building with GCC 15
    ee6219b9d0d2 drm/xe/xe3: Add initial set of workarounds
    43a859bd40ce drm/xe/ptl: L3bank mask is not available on the media GT
    61fda5faad77 drm/amd/display: disable SG displays on cyan skillfish
    b33f6e83921f drm/amd/display: Fix garbage or black screen when resetting otg
    9921e7879be9 drm/amd/display: skip disable CRTC in seemless bootup case
    2db11504ef82 dlm: fix possible lkb_resource null dereference
    0becac5c4e10 ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for MTL.
    015027aa6382 drm/radeon/r600_cs: Fix possible int overflow in r600_packet3_check()
    f01ddd589e16 drm/amd/display: Fix out-of-bounds access in 'dcn21_link_encoder_create'
    7296e5611adb wifi: rtw89: check return value of ieee80211_probereq_get() for RNR
    f2a107b53649 drm/mcde: Enable module autoloading
    86f5f19d670f drm/bridge: it6505: Enable module autoloading
    187d5ff497db drm: panel-orientation-quirks: Add quirk for AYA NEO GEEK
    5d7f35ed5f73 drm: panel-orientation-quirks: Add quirk for AYA NEO Founder edition
    4150f223428a drm: panel-orientation-quirks: Add quirk for AYA NEO 2 model
    9a13d81c74b1 drm/xe/pciid: Add new PCI id for ARL
    9bca6528f203 wifi: rtw88: use ieee80211_purge_tx_queue() to purge TX skb
    ef3da232796a drm/xe/pciids: Add PVC's PCI device ID macros
    a06ef71dec3e drm/vc4: hvs: Set AXI panic modes for the HVS
    7315275ada2a drm/vc4: hdmi: Avoid log spam for audio start failure
    74bee8735bb3 drm/xe/pciids: separate ARL and MTL PCI IDs
    73b50c34acb9 drm/xe/pciids: separate RPL-U and RPL-P PCI IDs
    7f70c81a77f2 HID: magicmouse: Apple Magic Trackpad 2 USB-C driver support
    cd38a8f52940 sched_ext: add a missing rcu_read_lock/unlock pair at scx_select_cpu_dfl()
    8b6752909058 selftests/resctrl: Protect against array overflow when reading strings
    0380da1da737 regmap: maple: Provide lockdep (sub)class for maple tree's internal lock
    997a3c04d7fa soc: imx8m: Probe the SoC driver as platform driver
    0104b5cac446 firmware: qcom: scm: Allow QSEECOM on Dell XPS 13 9345
    f7bfc223b9cb mmc: sdhci-esdhc-imx: enable quirks SDHCI_QUIRK_NO_LED
    bc7ff558d72c mmc: core: Add SD card quirk for broken poweroff notification
    87ace43e5105 media: cx231xx: Add support for Dexatek USB Video Grabber 1d19:6108
    3cc5228d5b60 media: uvcvideo: Force UVC version to 1.0a for 0408:4033
    0c20fadfd074 media: uvcvideo: Add a quirk for the Kaiweets KTI-W02 infrared camera
    17db6ed5a323 media: uvcvideo: RealSense D421 Depth module metadata
    c617ac035860 soc: qcom: pd-mapper: Add QCM6490 PD maps
    bb6a99db1d2e firmware: qcom: scm: Allow QSEECOM on Lenovo Yoga Slim 7x
    ea74e9675b8e HID: add per device quirk to force bind to hid-generic
    46b99cadaef4 soc: qcom: llcc: Use designated initializers for LLC settings
    8455230b1ba0 spi: spi-fsl-lpspi: Adjust type of scldiv
    3946e07552de gpio: free irqs that are still requested when the chip is being removed
    e26cbab9821a timekeeping: Always check for negative motion
    c7559dc2047e iio: magnetometer: fix if () scoped_guard() formatting
    ff599ad2d2b8 cleanup: Adjust scoped_guard() macros to avoid potential warning
    1e5b551f8198 perf/x86/amd: Warn only on new bits set
    94c6fd020081 ACPI: video: force native for Apple MacbookPro11,2 and Air7,2
    e173bce05f70 ACPI: x86: Add adev NULL check to acpi_quirk_skip_serdev_enumeration()
    342d91f67051 ACPI: x86: Make UART skip quirks work on PCI UARTs without an UID
    41b92874281e hwmon: (nct6775) Add 665-ACE/600M-CL to ASUS WMI monitoring list
    889a0d3a35fd kcsan: Turn report_filterlist_lock into a raw_spinlock
    c82bb825f9fc crypto: ecdsa - Avoid signed integer overflow on signature decoding
    b6ce2dbe984b ext4: partial zero eof block on unaligned inode size extension
    2e996ea42ba2 kselftest/arm64: Don't leak pipe fds in pac.exec_sign_all()
    597d2e04659c btrfs: do not clear read-only when adding sprout device
    5d261f60b5c8 btrfs: canonicalize the device path before adding it
    73978a9042ce btrfs: avoid unnecessary device path update for the same device
    a2e99dcd7aaf btrfs: don't take dev_replace rwsem on task already holding it
    493326c4f10c block: RCU protect disk->conv_zones_bitmap
    be54e6e0f93a s390/cpum_sf: Handle CPU hotplug remove during sampling
    14cf8e7be177 kselftest/arm64: Log fp-stress child startup errors to stdout
    d222934627b9 epoll: annotate racy check
    23a63cf560a5 s390/pci: Ignore RID for isolated VFs
    fbb370c01ef4 s390/pci: Use topology ID for multi-function devices
    1f3b309108fd s390/pci: Sort PCI functions prior to creating virtual busses
    e18d5b424893 rust: enable arbitrary_self_types and remove `Receiver`
    2cec2d916a7d memblock: allow zero threshold in validate_numa_converage()
    5c63e24b1bb7 scsi: ufs: pltfrm: Drop PM runtime reference count after ufshcd_remove()
    fe1a34e92a83 mm: respect mmap hint address when aligning for THP
    536ffb401442 mm: fix vrealloc()'s KASAN poisoning logic
    bd4d2333a3c5 mm: open-code page_folio() in dump_page()
    1dde3fde62b7 mm: open-code PageTail in folio_flags() and const_folio_flags()
    35e8f9125d3c mm: memcg: declare do_memsw_account inline
    e4c59f343800 mm/damon: fix order of arguments in damos_before_apply tracepoint
    34b7abe40fa9 x86/mm: Add _PAGE_NOPTISHADOW bit to avoid updating userspace page tables
    0214a12832e8 x86/cpu/topology: Remove limit of CPUs due to disabled IO/APIC
    42d9fe2adf86 mm/mempolicy: fix migrate_to_node() assuming there is at least one VMA in a MM
    69d319450d1c mm/gup: handle NULL pages in unpin_user_pages()
    835ca042dfcf kasan: make report_lock a raw spinlock
    a71ddd5b87cd sched/numa: fix memory leak due to the overwritten vma->numab_state
    9fcb73b960e8 lib: stackinit: hide never-taken branch from compiler
    9bfeeeff2c92 stackdepot: fix stack_depot_save_flags() in NMI context
    eb58460ff77e ocfs2: update seq_file index in ocfs2_dlm_seq_next
    9722010afd9c x86/cpu: Add Lunar Lake to list of CPUs with a broken MONITOR implementation
    d562b457e1c3 mmc: core: Further prevent card detect during shutdown
    637cf7d444b0 mmc: sdhci-pci: Add DMI quirk for missing CD GPIO on Vexia Edu Atla 10 tablet
    af2b48a07690 arch_numa: Restore nid checks before registering a memblock with a node
    14258211d684 regmap: detach regmap from dev on regmap_exit
    d486b5741d98 xsk: fix OOB map writes when deleting elements
    47155559646e dma-fence: Use kernel's sort for merging fences
    f3dbb097d653 dma-fence: Fix reference leak on fence merge failure path
    3dcc20418ea6 dma-buf: fix dma_fence_array_signaled v4
    178e31df1fb3 bpf: fix OOB devmap writes when deleting elements
    3702a27a67c7 x86/kexec: Restore GDT on return from ::preserve_context kexec
    bc031095d1a1 modpost: Add .irqentry.text to OTHER_SECTIONS
    573e70eb7e76 drm/amdgpu/hdp5.2: do a posting read when flushing HDP
    8499665f2c2d drm/amdgpu/hdp7.0: do a posting read when flushing HDP
    c99261fa723e drm/amdgpu/hdp5.0: do a posting read when flushing HDP
    8976f9cc99ca drm/amdgpu/hdp4.0: do a posting read when flushing HDP
    e55d088edfcf drm/amdgpu/hdp6.0: do a posting read when flushing HDP
    2e7bea50a9b7 drm/amd/display: Add a left edge pixel if in YCbCr422 or YCbCr420 and odm
    f443172fbf9f drm/amd/display: Limit VTotal range to max hw cap minus fp
    a249735619a8 drm/amd/display: Correct prefetch calculation
    be826b4451fd drm/dp_mst: Fix resetting msg rx state after topology removal
    f4e1544ab82c drm/dp_mst: Verify request type in the corresponding down message reply
    0a203ff705fd drm/amd/pm: fix and simplify workload handling
    0a2d502a0aec drm/amdkfd: add MEC version that supports no PCIe atomics for GFX12
    1fc1f32c4a34 drm/dp_mst: Fix MST sideband message body length check
    c206d13552de drm/amdkfd: hard-code cacheline for gc943,gc944
    76ce78cab705 x86/cacheinfo: Delete global num_cache_leaves
    95e197354e0d cacheinfo: Allocate memory during CPU hotplug if not done from the primary CPU
    ed9132d03854 selftest: hugetlb_dio: fix test naming
    a32ea1d9ee71 selftests/damon: add _damon_sysfs.py to TEST_FILES
    a63907c8c712 pmdomain: imx: gpcv2: Adjust delay after power up handshake
    85351e4941a2 Revert "readahead: properly shorten readahead when falling back to do_page_cache_ra()"
    5e0e913624bc bcache: revert replacing IS_ERR_OR_NULL with IS_ERR again
    793e560a6b7c io_uring: Change res2 parameter type in io_uring_cmd_done
    74aaafabd3c1 smb3.1.1: fix posix mounts to older servers
    6e4672301e71 fs/smb/client: cifs_prime_dcache() for SMB3 POSIX reparse points
    aeb255487559 fs/smb/client: Implement new SMB3 POSIX type
    469e955d757e fs/smb/client: avoid querying SMB2_OP_QUERY_WSL_EA for SMB3 POSIX
    31f7b57a77d4 nilfs2: fix potential out-of-bounds memory access in nilfs_find_entry()
    5a717f43c2ea scsi: ufs: core: Add missing post notify for power mode change
    8c9425768c38 scsi: ufs: pltfrm: Disable runtime PM during removal of glue drivers
    f99cb5f6344e scsi: ufs: qcom: Only free platform MSIs when ESI is enabled
    2e7a3bb0331e scsi: ufs: core: Cancel RTC work during ufshcd_remove()
    9c191055c7ab scsi: ufs: core: sysfs: Prevent div by zero
    31d3ed440fa6 scsi: qla2xxx: Remove check req_sg_cnt should be equal to rsp_sg_cnt
    6abf16d3c915 scsi: qla2xxx: Fix use after free on unload
    2922ccf00bea scsi: qla2xxx: Supported speed displayed incorrectly for VPorts
    5d1f2b471cde scsi: qla2xxx: Fix NVMe and NPIV connect issue
    b89012158525 scsi: qla2xxx: Fix abort in bsg timeout
    763d6c294d9e ALSA: hda/realtek: Add support for Samsung Galaxy Book3 360 (NP730QFG)
    f9e25ff6ddfb ALSA: hda/realtek: Enable mute and micmute LED on HP ProBook 430 G8
    c74de4e57685 ALSA: usb-audio: add mixer mapping for Corsair HS80
    061434122610 ALSA: hda/realtek: fix micmute LEDs don't work on HP Laptops
    39c5d89b567a ALSA: usb-audio: Add extra PID for RME Digiface USB
    7f1292f8d4d6 ALSA: usb-audio: Fix a DMA to stack memory bug
    4105dd76bc8a arm64: ptrace: fix partial SETREGSET for NT_ARM_POE
    8ab73c34e3c5 arm64: ptrace: fix partial SETREGSET for NT_ARM_FPMR
    abd614bbfcee arm64: ptrace: fix partial SETREGSET for NT_ARM_TAGGED_ADDR_CTRL
    34b61978676a arm64: Ensure bits ASID[15:8] are masked out when the kernel uses 8-bit ASIDs
    ec643064abcf arm64: mm: Fix zone_dma_limit calculation
    2b3f30c8edbf iommufd: Fix out_fput in iommufd_fault_alloc()
    aec9ed5663d2 net :mana :Request a V2 response version for MANA_QUERY_GF_STAT
    ba0ee489cdde tracing: Fix cmp_entries_dup() to respect sort() comparison rules
    2f4320f9f888 can: mcp251xfd: mcp251xfd_get_tef_len(): work around erratum DS80000789E 6.
    3b0c5bb437d3 can: dev: can_set_termination(): allow sleeping GPIOs
    f505fb7e2558 watchdog: rti: of: honor timeout-sec property
    c5797f195c67 ksmbd: fix Out-of-Bounds Write in ksmbd_vfs_stream_write
    81eed631935f ksmbd: fix Out-of-Bounds Read in ksmbd_vfs_stream_read
    1aece9662013 LoongArch: KVM: Protect kvm_check_requests() with SRCU
    9b602190cf2d LoongArch: Add architecture specific huge_pte_clear()
    e689bc6697a7 HID: wacom: fix when get product name maybe null pointer
    0c08f4a6016d HID: i2c-hid: Revert to using power commands to wake on resume
    a7e0e292dca4 rust: allow `clippy::needless_lifetimes`
    73bb82a4259a x86/CPU/AMD: WARN when setting EFER.AUTOIBRS if and only if the WRMSR fails
    412bf01fd5db bpf: Fix exact match conditions in trie_get_next_key()
    7218e441ad9d bpf: Handle in-place update for full LPM trie correctly
    6dc076a257a5 bpf: Remove unnecessary kfree(im_node) in lpm_trie_update_elem
    81ec3c6ceb7c bpf: Handle BPF_EXIST and BPF_NOEXIST for LPM trie
    0d8658c0cb59 smb: client: fix potential race in cifs_put_tcon()
    0e421cb8085c iio: magnetometer: yas530: use signed integer type for clamp limits
    c2277e285923 scatterlist: fix incorrect func name in kernel-doc
    03db61c43c8e ocfs2: free inode when ocfs2_get_init_inode() fails
    b94c2f7a1a23 drm/v3d: Enable Performance Counters before clearing them
    687e10f3a3c5 ASoC: mediatek: mt8188-mt6359: Remove hardcoded dmic codec
    1e1083db623d scsi: scsi_debug: Fix hrtimer support for ndelay
    1f5e2f1ca587 scsi: sg: Fix slab-use-after-free read in sg_release()
    05b436f3cf65 nvme-rdma: unquiesce admin_q before destroy it
    ceff9ac13a24 nvme-tcp: fix the memleak while create new ctrl failed
    845cc4ee8e64 nvme-fabrics: handle zero MAXCMD without closing the connection
    f9f2a2739eb3 bpf: Fix narrow scalar spill onto 64-bit spilled scalar slots
    0da7d4b7caf0 bpf: Don't mark STACK_INVALID as STACK_MISC in mark_stack_slot_misc
    2459a0b14967 drivers/virt: pkvm: Don't fail ioremap() call if MMIO_GUARD fails
    7cddf3b4a052 irqchip/stm32mp-exti: CONFIG_STM32MP_EXTI should not default to y when compile-testing
    bdbf87486dca bpf: Ensure reg is PTR_TO_STACK in process_iter_arg
    dd9478d54c73 x86/pkeys: Ensure updated PKRU value is XRSTOR'd
    00dee8e1d7a9 x86/pkeys: Change caller of update_pkru_in_sigframe()
    554888798756 nvme: don't apply NVME_QUIRK_DEALLOCATE_ZEROES when DSM is not supported
    913a3f1c06a4 pmdomain: core: Fix error path in pm_genpd_init() when ida alloc fails
    a78af1180623 pmdomain: core: Add missing put_device()
    036d4d0d11a3 ASoC: SOF: ipc3-topology: fix resource leaks in sof_ipc3_widget_setup_comp_dai()
    eee02810cea3 ASoC: SOF: ipc3-topology: Convert the topology pin index to ALH dai index
    90b72189de2c spi: mpc52xx: Add cancel_work_sync before module remove
    cd3018c9b2ad tools: Override makefile ARCH variable if defined, but empty
    7bc37dd9ea96 ALSA: usb-audio: Notify xrun for low-latency mode
    01c3525718e8 ALSA: seq: ump: Fix seq port updates per FB info notify
    5c9e3bb43a35 tcp_bpf: Fix the sk_mem_uncharge logic in tcp_bpf_sendmsg
    8bc28b537d57 drm/sti: Add __iomem for mixer_dbg_mxn's parameter
    1b6341c9d20b bpftool: fix potential NULL pointer dereferencing in prog_dump()
    dabaf268460f xsk: always clear DMA mapping information when unmapping the pool
    a222e48feaf1 bpf, vsock: Invoke proto::close on close()
    47f4ad956be0 bpf, vsock: Fix poll() missing a queue
    3ad69f2f0899 scsi: ufs: core: Add ufshcd_send_bsg_uic_cmd() for UFS BSG
    7d4e5e33ea4e scsi: ufs: core: Always initialize the UIC done completion
    66edf59bc444 drm/amd/display: Ignore scalar validation failure if pipe is phantom
    7c4fd0072ad1 drm/amd/display: calculate final viewport before TAP optimization
    111746277362 i3c: master: Fix dynamic address leak when 'assigned-address' is present
    c3806cf64739 i3c: master: Extend address status bit to 4 and add I3C_ADDR_SLOT_EXT_DESIRED
    815d8f0e524f i3c: master: Replace hard code 2 with macro I3C_ADDR_SLOT_STATUS_BITS
    8e9fec7f79ad f2fs: fix to requery extent which cross boundary of inquiry
    e6a91ed4b9e5 f2fs: fix to adjust appropriate length for fiemap
    6358df316dd8 f2fs: clean up w/ F2FS_{BLK_TO_BYTES,BTYES_TO_BLK}
    405b6d5f90df ntp: Remove invalid cast in time offset math
    0ab037634ba5 zram: clear IDLE flag in mark_idle()
    4e51552bc5d8 zram: do not mark idle slots that cannot be idle
    42311846d358 mmc: core: Use GFP_NOIO in ACMD22
    19e22f1e68c7 mmc: core: Adjust ACMD22 to SDUC
    c00372e41bf6 mmc: sd: SDUC Support Recognition
    f42e0656d483 mmc: mtk-sd: Fix MMC_CAP2_CRYPTO flag setting
    eac322ed9378 mmc: mtk-sd: fix devm_clk_get_optional usage
    95b6c851fb99 mmc: mtk-sd: Fix error handle of probe function
    acb8edf2ec34 mmc: mtk-sd: use devm_mmc_alloc_host
    db2fc255fcf4 gpio: grgpio: Add NULL check in grgpio_probe
    8b287418b529 gpio: grgpio: use a helper variable to store the address of ofdev->dev
    316183d58319 net: avoid potential UAF in default_operstate()
    876113e99ae1 vsock/test: fix parameter types in SO_VM_SOCKETS_* calls
    b24737a85e18 vsock/test: fix failures due to wrong SO_RCVLOWAT parameter
    3591bc906718 net/mlx5e: Remove workaround to avoid syndrome for internal port
    83ca241410e2 net/mlx5e: SD, Use correct mdev to build channel param
    9ede83d29267 net/mlx5: HWS: Properly set bwc queue locks lock classes
    1af1342724bd net/mlx5: HWS: Fix memory leak in mlx5hws_definer_calc_layout
    177b72ed7c77 geneve: do not assume mac header is set in geneve_xmit_skb()
    68292db0d069 mlxsw: spectrum_acl_flex_keys: Use correct key block on Spectrum-4
    cfa0f932774b mlxsw: spectrum_acl_flex_keys: Constify struct mlxsw_afk_element_inst
    22074dc1d4d3 ethtool: Fix wrong mod state in case of verbose and no_mask bitset
    be4d0ac67d92 netfilter: nft_set_hash: skip duplicated elements pending gc run
    ba5e070f3668 netfilter: ipset: Hold module reference while requesting a module
    152a8c179f2e net: sched: fix erspan_opt settings in cls_flower
    a36a6d7037fc Revert "udp: avoid calling sock_def_readable() if possible"
    da5cc778e7bf netfilter: nft_inner: incorrect percpu area handling under softirq
    992fd34122de igb: Fix potential invalid memory access in igb_init_module()
    f017f37387f7 ixgbe: Correct BASE-BX10 compliance code
    25d6979ef303 ixgbe: downgrade logging of unsupported VF API version to debug
    bf4c4782e532 ixgbevf: stop attempting IPSEC offload on Mailbox API 1.5
    befb42b7ce55 idpf: set completion tag for "empty" bufs associated with a packet
    7ee237851dcf ice: Fix VLAN pruning in switchdev mode
    25a702f2528a ice: fix PHY timestamp extraction for ETH56G
    2fbcd12de22e ice: fix PHY Clock Recovery availability check
    688842f47ee9 net: hsr: must allocate more bytes for RedBox support
    5e1c91f4e6f7 net/qed: allow old cards not supporting "num_images" to work
    6f0ae06a234a net/smc: fix LGR and link use-after-free issue
    6638e52dcfaf net/smc: initialize close_work early to avoid warning
    e48b211c4c59 tipc: Fix use-after-free of kernel socket in cleanup_bearer().
    9ee68b0f2370 dccp: Fix memory leak in dccp_feat_change_recv
    8b591bd522b7 net/ipv6: release expired exception dst cached in socket
    3027a9fe02ed net: phy: microchip: Reset LAN88xx PHY to ensure clean link state on LAN7800/7850
    ddc6402e2934 platform/x86: asus-wmi: Ignore return value when writing thermal policy
    68fceb143b63 can: j1939: j1939_session_new(): fix skb reference counting
    01f95357e472 ipv6: avoid possible NULL deref in modify_prefix_route()
    9545011e7b2a net: Fix icmp host relookup triggering ip_rt_bug
    9a97fb4fdb81 bnxt_en: ethtool: Supply ntuple rss context action
    7ea527fbd7b9 net: hsr: avoid potential out-of-bound access in fill_frame_info()
    a007f8895f7c net/sched: tbf: correct backlog statistic for GSO packets
    e0964a577864 ptp: Add error handling for adjfine callback in ptp_clock_adjtime
    b718b68a9964 net: enetc: Do not configure preemptible TCs if SIs do not support
    5bf92a924f1f selftests: hid: fix typo and exit code
    e227c042580a netfilter: nft_socket: remove WARN_ON_ONCE on maximum cgroup level
    c40c96d98e53 netfilter: x_tables: fix LED ID check in led_tg_check()
    48130002e64f ipvs: fix UB due to uninitialized stack access in ip_vs_protocol_init()
    02b10fd22d3a can: f81604: f81604_handle_can_bus_errors(): fix {rx,tx}_errors statistics
    51251ed96e82 can: ems_usb: ems_usb_rx_err(): fix {rx,tx}_errors statistics
    0d515fff98b5 can: sun4i_can: sun4i_can_err(): fix {rx,tx}_errors statistics
    bc18651a8175 can: sja1000: sja1000_err(): fix {rx,tx}_errors statistics
    4bf39aee3b70 can: hi311x: hi3110_can_ist(): fix {rx,tx}_errors statistics
    377647078baf can: ifi_canfd: ifi_canfd_handle_lec_err(): fix {rx,tx}_errors statistics
    42e3dccf9682 can: m_can: m_can_handle_lec_err(): fix {rx,tx}_errors statistics
    bc30b2fe8c54 can: hi311x: hi3110_can_ist(): fix potential use-after-free
    412a8927e1db can: sun4i_can: sun4i_can_err(): call can_change_state() even if cf is NULL
    cdf85e7c979c can: c_can: c_can_handle_bus_err(): update statistics if skb allocation fails
    fc2aeda8c9f7 can: gs_usb: add usb endpoint address detection at driver probe step
    316b301a2f93 watchdog: mediatek: Make sure system reset gets asserted in mtk_wdt_restart()
    17cab7b4ff4b watchdog: apple: Actually flush writes after requesting watchdog restart
    337dbfeea335 watchdog: xilinx_wwdt: Calculate max_hw_heartbeat_ms using clock frequency
    a282aff221bf iTCO_wdt: mask NMI_NOW bit for update_no_reboot_bit() call
    7160a4379dcc arch/arm64/configs: remove CONFIG_SM_DISPCC_8650
    61baee2dc534 Linux 6.12.4
    372504eb9c10 Revert "drm/xe/xe_guc_ads: save/restore OA registers and allowlist regs"
    aa2895911816 posix-timers: Target group sigqueue to current task only if not exiting
    bf078ed5daa3 drm/amd/display: Remove PIPE_DTO_SRC_SEL programming from set_dtbclk_dto
    ca9982977325 drm/amd/display: update pipe selection policy to check head pipe
    8cb2f6793845 drm/amd/display: Fix handling of plane refcount
    08e5f8e1a24f drm/amd/pm: Remove arcturus min power limit
    8f5b79a452bd drm/amd/pm: disable pcie speed switching on Intel platform for smu v14.0.2/3
    c8a6a98b813c drm/amd/pm: update current_socclk and current_uclk in gpu_metrics on smu v13.0.7
    6209e4178aea drm/amd: Fix initialization mistake for NBIO 7.11 devices
    e5483137d16f drm/amd/pm: skip setting the power source on smu v14.0.2/3
    6383199ada42 drm/amdgpu: fix usage slab after free
    be51376b1f50 drm/amd: Add some missing straps from NBIO 7.11.0
    a4f2599ef70f drm/amdgpu/pm: add gen5 display to the user on smu v14.0.2/3
    ff34c909ed3f drm/amdkfd: Use the correct wptr size
    5ddcb50b7002 drm/xe/guc_submit: fix race around suspend_pending
    1c052c66461f drm/xe/migrate: use XE_BO_FLAG_PAGETABLE
    f6f6bcb4e228 Revert "drm/radeon: Delay Connector detecting when HPD singals is unstable"
    b940b6516bc2 drm/xe/migrate: fix pat index usage
    cb56ef805f44 drm/xe/xe_guc_ads: save/restore OA registers and allowlist regs
    2719fe94d28c drm: xlnx: zynqmp_dpsub: fix hotplug detection
    96c308559eed drm/etnaviv: flush shader L1 cache after user commandstream
    e1f0df8ba6f5 drm/bridge: it6505: Fix inverted reset polarity
    576fe9345d0a drm/mediatek: Fix child node refcount handling in early exit
    22fd2377b9ce drm/fbdev-dma: Select FB_DEFERRED_IO
    f67786293193 drm/sti: avoid potential dereference of error pointers
    faf6c1caf580 drm: panel: jd9365da-h3: Remove unused num_init_cmds structure member
    3cf2e7c448e2 drm/sti: avoid potential dereference of error pointers in sti_gdp_atomic_check
    837eb99ad334 drm/sti: avoid potential dereference of error pointers in sti_hqvdp_atomic_check
    73292e8e6187 drm/panic: Fix uninitialized spinlock acquisition with CONFIG_DRM_PANIC=n
    742ae9253ca8 net: fec: make PPS channel configurable
    75d06a0404ee net: fec: refactor PPS channel configuration
    e8139c66df98 dt-bindings: net: fec: add pps channel property
    0207180b59cd binder: add delivered_freeze to debugfs output
    b8b77712142f binder: fix memleak of proc->delivered_freeze
    f3cf682d3a97 binder: allow freeze notification for dead nodes
    648c92b1a898 binder: fix BINDER_WORK_CLEAR_FREEZE_NOTIFICATION debug logs
    af8a8044b09a binder: fix BINDER_WORK_FROZEN_BINDER debug logs
    fe39e0ea2d0b binder: fix freeze UAF in binder_release_work()
    6b1be1da1f82 binder: fix OOB in binder_add_freeze_work()
    38fbefeb2c14 binder: fix node UAF in binder_add_freeze_work()
    ac04ef405da9 powerpc: Adjust adding stack protector flags to KBUILD_CLAGS for clang
    fab0610d646a powerpc: Fix stack protector Kconfig test for clang
    edd18cc7ba04 iio: gts: fix infinite loop for gain_to_scaletables()
    218ecc359491 iio: adc: ad7923: Fix buffer overflow for tx_buf and ring_xfer
    ee7a0a9daa8e iio: Fix fwnode_handle in __fwnode_iio_channel_get_by_name()
    c11a06753211 iio: invensense: fix multiple odr switch when FIFO is off
    1344ff89fe4d iio: accel: kx022a: Fix raw read format
    6f73f920b7ad nfsd: fix nfs4_openowner leak when concurrent nfsd4_open occur
    7365d1f8de63 nfsd: make sure exp active before svc_export_show
    d093cc19f709 PCI: rockchip-ep: Fix address translation unit programming
    f8553091240f PCI: of_property: Assign PCI instead of CPU bus address to dynamic PCI nodes
    e9a75f2de97d PCI: dwc: ep: Fix advertised resizable BAR size regression
    a4ee8ff07636 dm thin: Add missing destroy_work_on_stack()
    3cad6b5a1278 dm: Fix typo in error message
    f9a18889aad9 mm/vmalloc: combine all TLB flush operations of KASAN shadow virtual address into one operation
    1ba771763d1b ovl: properly handle large files in ovl_security_fileattr
    e78d04d36481 leds: flash: mt6360: Fix device_for_each_child_node() refcounting in error paths
    3a3f789ee15b thermal: int3400: Fix reading of current_uuid for active policy
    987999769e69 fs/proc/kcore.c: Clear ret value in read_kcore_iter after successful iov_iter_zero
    8b5aea5e5186 slab: Fix too strict alignment check in create_cache()
    a143b50de2b8 PCI: endpoint: Clear secondary (not primary) EPC in pci_epc_remove_epf()
    c74a1df6c2a2 PCI: endpoint: Fix PCI domain ID release in pci_epc_destroy()
    5946dc018bef PCI: keystone: Add link up check to ks_pcie_other_map_bus()
    c8a1d7b85d9e PCI: keystone: Set mode as Root Complex for "ti,keystone-pcie" compatible
    768673a15bad i3c: master: svc: Modify enabled_events bit 7:0 to act as IBI enable counter
    34a55b54845d i3c: master: svc: fix possible assignment of the same address to two devices
    0e8ab955c6d0 i3c: master: Fix miss free init_dyn_addr at i3c_master_put_i3c_addrs()
    b2529be317f8 i3c: master: svc: Fix pm_runtime_set_suspended() with runtime pm enabled
    7491d6255659 scsi: ufs: exynos: Fix hibern8 notify callbacks
    0581ec70b351 scsi: ufs: exynos: Add check inside exynos_ufs_config_smu()
    20c263578264 s390/stacktrace: Use break instead of return statement
    3e5fbcbc388a util_macros.h: fix/rework find_closest() macros
    234d5f75c3ae mtd: spinand: winbond: Fix 512GW, 01GW, 01JW and 02JW ECC information
    5e127c439298 mtd: spinand: winbond: Fix 512GW and 02JW OOB layout
    e3d1c9e2b811 ceph: fix cred leak in ceph_mds_check_access()
    ffa6ba7bdb7f ceph: pass cred pointer to ceph_mds_auth_match()
    2431ce949f7f ceph: extract entity name from device id
    15136c3861a3 f2fs: fix to drop all discards after creating snapshot on lvm device
    943c0f601cd2 mm/slub: Avoid list corruption when removing a slab from the full list
    ac43ea3d27a8 PCI: imx6: Fix suspend/resume support on i.MX6QDL
    7eba7f8c65fc remoteproc: qcom_q6v5_pas: disable auto boot for wpss
    5fe7c08e758d perf jevents: fix breakage when do perf stat on system metric
    8cc7aba7b6d9 PCI: qcom: Disable ASPM L0s for X1E80100
    15bfacdb8539 vfio/qat: fix overflow check in qat_vf_resume_write()
    33544a590df2 net: stmmac: set initial EEE policy configuration
    0cfd6929fa78 ARM: 9431/1: mm: Pair atomic_set_release() with _read_acquire()
    c86d26b4b089 ARM: 9430/1: entry: Do a dummy read from VMAP shadow
    473ffae30301 s390/entry: Mark IRQ entries to fix stack depot warnings
    ad6750c17fb4 ARM: 9429/1: ioremap: Sync PGDs for VMALLOC shadow
    43cc7939f5e6 spmi: pmic-arb: fix return path in for_each_available_child_of_node()
    d34bf994bb97 driver core: fw_devlink: Stop trying to optimize cycle detection logic
    d60e418834b9 nvmem: core: Check read_only flag for force_ro in bin_attr_nvmem_write()
    f25a9f1df1f6 ad7780: fix division by zero in ad7780_write_raw()
    6d79acba7ad3 clk: qcom: gcc-qcs404: fix initial rate of GPLL3
    322b2054f3c1 cpufreq: scmi: Fix cleanup path when boost enablement fails
    d63516b1e0d3 powerpc/vdso: Drop -mstack-protector-guard flags in 32-bit files with clang
    100120f64f5b mm/damon/vaddr: fix issue in damon_va_evenly_split_region()
    2a93e095867f leds: lp55xx: Remove redundant test for invalid channel number
    5018696b19bc iommu/arm-smmu: Defer probe of clients after smmu device bound
    aa3c291fd254 iommu/io-pgtable-arm: Fix stage-2 map/unmap for concatenated tables
    641404289fdd zram: clear IDLE flag after recompression
    034582624a1d vmstat: call fold_vm_zone_numa_events() before show per zone NUMA event
    19cacabdd5a8 ftrace: Fix regression with module command in stack_trace_filter
    29aa92f514bf maple_tree: refine mas_store_root() on storing NULL
    72014e7745cc ovl: Filter invalid inodes with missing lookup function
    3213b92754b9 kunit: string-stream: Fix a UAF bug in kunit_init_suite()
    5d28fac59369 kunit: Fix potential null dereference in kunit_device_driver_test()
    b544be374458 tracing: Fix function timing profiler to initialize hashtable
    4f74bd307f07 media: uvcvideo: Require entities to have a non-zero unique ID
    7ccadc3217bc media: uvcvideo: Stop stream during unregister
    891b5790bee8 media: platform: allegro-dvt: Fix possible memory leak in allocate_buffers_internal()
    6f238d620181 media: ov08x40: Fix burst write sequence
    e3bd4ab16584 media: gspca: ov534-ov772x: Fix off-by-one error in set_frame_rate()
    b954af359f5d media: venus: Fix pm_runtime_set_suspended() with runtime pm enabled
    92b1d2a7a110 media: amphion: Fix pm_runtime_set_suspended() with runtime pm enabled
    6b29c887a63a net: phy: dp83869: fix status reporting for 1000base-x autonegotiation
    eaafbcf0a578 efi/libstub: Free correct pointer on failure
    36a4bfb5fc67 media: platform: exynos4-is: Fix an OF node reference leak in fimc_md_is_isp_available
    901070571bc1 media: ts2020: fix null-ptr-deref in ts2020_probe()
    ff1c45c865e1 media: verisilicon: av1: Fix reference video buffer pointer assignment
    4f0904a175c6 media: platform: rga: fix 32-bit DMA limitation
    2f86d104539f media: imx-jpeg: Ensure power suppliers be suspended before detach them
    1def915b1564 media: i2c: tc358743: Fix crash in the probe error path when using polling
    6f655bc1f712 arm64: dts: freescale: imx8mp-verdin: Fix SD regulator startup delay
    3c0be29b6aad media: i2c: dw9768: Fix pm_runtime_set_suspended() with runtime pm enabled
    bc3889a39baf media: mtk-jpeg: Fix null-ptr-deref during unload module
    5ade59d28ead media: imx-jpeg: Set video drvdata before register video device
    182b9edc02c4 media: amphion: Set video drvdata before register video device
    c98586d8d01c media: qcom: camss: fix error path on configuration of power domains
    3f94622dbeaa arm64: dts: mediatek: mt8186-corsola: Fix IT6505 reset line polarity
    2bea1d0e57ae arm64: dts: ti: k3-am62-verdin: Fix SD regulator startup delay
    5d71869f3385 arm64: dts: freescale: imx8mm-verdin: Fix SD regulator startup delay
    e7f2429130fb arm64: dts: mediatek: mt8186-corsola: Fix GPU supply coupling max-spread
    cd70598eb061 arm64: dts: allwinner: pinephone: Add mount matrix to accelerometer
    c3d075489697 md/md-bitmap: Add missing destroy_work_on_stack()
    be19e6e4339d md/raid5: Wait sync io to finish before changing group cnt
    596f7faa60b2 netkit: Add option for scrubbing skb meta data
    259449873c37 iommu/tegra241-cmdqv: Fix unused variable warning
    a6f9e7a0bf11 btrfs: ref-verify: fix use-after-free after invalid ref action
    93992c3d9629 btrfs: add a sanity check for btrfs root in btrfs_search_slot()
    b03d19312b90 btrfs: don't loop for nowait writes when checking for cross references
    f8a5129e4a9f btrfs: fix use-after-free in btrfs_encoded_read_endio()
    13bfaeafbfe3 btrfs: move priv off stack in btrfs_encoded_read_regular_fill_pages()
    a0f5689a684e btrfs: change btrfs_encoded_read() so that reading of extent is done by caller
    11755f72e54f btrfs: drop unused parameter file_offset from btrfs_encoded_read_regular_fill_pages()
    8ea87e347922 quota: flush quota_release_work upon quota writeback
    2e87ea9bf367 xfs: remove unknown compat feature check in superblock write validation
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
index f4fe3bf156..d5c50d7e07 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "29974e6f86d7ddc55a72fc44d209b84256c69e21"
-SRCREV_meta ?= "38b941ae2f4f28c0ba40b2ba6da466f6f5fe3ba0"
+SRCREV_machine ?= "6d3cbfc4586bbdc1bea2ee4d40e3ab8f60b0ac79"
+SRCREV_meta ?= "96ce9b7ee67702aec75816c4d44a527061c418c5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.3"
+LINUX_VERSION ?= "6.12.5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 0ed00fbb64..867f1a8683 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.3"
+LINUX_VERSION ?= "6.12.5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
-SRCREV_meta ?= "38b941ae2f4f28c0ba40b2ba6da466f6f5fe3ba0"
+SRCREV_machine ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
+SRCREV_meta ?= "96ce9b7ee67702aec75816c4d44a527061c418c5"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 76f38d8884..b3934341eb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0c33fda4cb5c0a3dfbdbb2040a8b4affbb34e00a"
-SRCREV_machine:qemuarm64 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
-SRCREV_machine:qemuloongarch64 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
-SRCREV_machine:qemumips ?= "cb10a94d7ca5ce5c00608ffcea74a79df6b15329"
-SRCREV_machine:qemuppc ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
-SRCREV_machine:qemuriscv64 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
-SRCREV_machine:qemuriscv32 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
-SRCREV_machine:qemux86 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
-SRCREV_machine:qemux86-64 ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
-SRCREV_machine:qemumips64 ?= "861600ef3aecc4bb78dd57f92e4814c9647f1cd9"
-SRCREV_machine ?= "7160a4379dccf0e95526f1ab9be4ef704835074a"
-SRCREV_meta ?= "38b941ae2f4f28c0ba40b2ba6da466f6f5fe3ba0"
+SRCREV_machine:qemuarm ?= "9142db2532267443050a42deb8a17c3ac8cda055"
+SRCREV_machine:qemuarm64 ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
+SRCREV_machine:qemuloongarch64 ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
+SRCREV_machine:qemumips ?= "075aa6336cc711850452d1767c84ade46ce88137"
+SRCREV_machine:qemuppc ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
+SRCREV_machine:qemuriscv64 ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
+SRCREV_machine:qemuriscv32 ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
+SRCREV_machine:qemux86 ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
+SRCREV_machine:qemux86-64 ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
+SRCREV_machine:qemumips64 ?= "e576f3b991cb3f33dd80f5d33fa65ef21abc78cf"
+SRCREV_machine ?= "ce1b5cfc9bdef020d007b881d78aca2d0350d6fe"
+SRCREV_meta ?= "96ce9b7ee67702aec75816c4d44a527061c418c5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "47edb26c8ed9dd1877f8623ee1cd3b998874ca65"
+SRCREV_machine:class-devupstream ?= "61baee2dc5341c936e7fa7b1ca33c5607868de69"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.3"
+LINUX_VERSION ?= "6.12.5"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


