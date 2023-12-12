Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A47C4167D
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:02 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.2918.1702391279390051109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Cl2HpTt0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d099d316a8so1617498b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391278; x=1702996078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9Rdbfm0X6yAZpcBBkfm50f4OL6DwMcYoKSqk+RdhBY=;
        b=Cl2HpTt0bq+rEvR+CZs2xlIDVEl+wiXSlYQdWlu24GRFw3KY6phcgkQAwTYFowGlER
         d6qYuMN+5P3OBRa/9N+AhHd9AKxbJ39xgw2U4Ur8PjMxrP9TyO/sDI/oxQks88pNY2s6
         5HM0uMtVGpr07grqTpE6DNbxCIQgQDgZtezXuAHVMDguNGbNYuz77B8s7nMhXHW0Cyty
         O39ibaeKBcPl05/v0IDANRWF9R7FYGnHEd7+5x4645XTsZFif56pWeqJQ6caVcgP9D/X
         d5sQUNRZBrqbifvreUShI7W1+Y9wnGmH4jwfJCHBxnmqks1KNMiVcBtiGA8MhkAIUPNa
         hNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391278; x=1702996078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9Rdbfm0X6yAZpcBBkfm50f4OL6DwMcYoKSqk+RdhBY=;
        b=Hu1OGK23t+5KjKch+2Uf0H58os96GKYr1+FdoNQYdTticaghbQDtbLl6HiPf1zuVXF
         T5JdykgCiGeJo0cBhhT7xsgGG+MJX85L2Pm0+Z/2VhZokcI5Madsbikg6xrCUWvFS1Dw
         F7ROiUZeN6CdNhvklXNYBEcWHwtRdafT+YyAAHmJS/Qpoz1l3LBvyNKXKc8fuErmObmL
         dF/+s/y9CMjmdh2m9cqBGXUo9ufSfLHm0yykBzDsvE/8+8/Lglow8a64MjHCKOE4epSZ
         ZrQTiVs5CDjn1fw3HyenT1ppseIJGR9hunPUQNr68lSXFdusz4kxoXMxkKMW89qlfQcf
         IYrA==
X-Gm-Message-State: AOJu0YwzbjR88r417qonZL55Z/fhVpx+BfMBFOayG5d7DaKZ1whnbAyt
	5cVjlLUc3L+vCVmX4lAnmAdH8auF1ZohHxy0fvE=
X-Google-Smtp-Source: AGHT+IHNa6gvzyTPw7j5C0/rMue3XXiaW//2Bg4wkbu5pziRCmVA9NKAiCN686f1Y6hSnstZWsRPmA==
X-Received: by 2002:a05:6a00:a01:b0:6ce:82bd:93ea with SMTP id p1-20020a056a000a0100b006ce82bd93eamr8720521pfh.26.1702391277831;
        Tue, 12 Dec 2023 06:27:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.27.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:27:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 08/29] linux-yocto/6.1: update to v6.1.60
Date: Tue, 12 Dec 2023 04:27:14 -1000
Message-Id: <8c769074d7303d96fbba6f09e5e9da7d0678daed.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192212

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    32c9cdbe383c Linux 6.1.60
    7f5bb254be8d selftests: mptcp: join: no RST when rm subflow/addr
    0e0123e0e53d selftests: mptcp: join: correctly check for no RST
    300447c5722a mptcp: avoid sending RST when closing the initial subflow
    c04f416730ac Bluetooth: hci_sock: Correctly bounds check and pad HCI_MON_NEW_INDEX name
    a429d65428d5 Bluetooth: hci_sock: fix slab oob read in create_monitor_event
    46de539282f2 net: move altnames together with the netdevice
    c1d531aa095b phy: mapphone-mdm6600: Fix pinctrl_pm handling for sleep pins
    13a45130bb17 phy: mapphone-mdm6600: Fix runtime PM for remove
    7fcce3258b6e phy: mapphone-mdm6600: Fix runtime disable on probe
    4eac2cf444af gpio: vf610: mask the gpio irq in system suspend and support wakeup
    9b0f8a9dfdac gpio: vf610: make irq_chip immutable
    1f38ead73f25 tracing/kprobes: Return EADDRNOTAVAIL when func matches several symbols
    e9b4b7256736 kallsyms: Add helper kallsyms_on_each_match_symbol()
    da359f699f59 kallsyms: Reduce the memory occupied by kallsyms_seqs_of_names[]
    3918cada8f1b serial: 8250: omap: convert to modern PM ops
    70a841eb4f99 serial: 8250: omap: Move uart_write() inside PM section
    6df4c9dee011 drm/bridge: ti-sn65dsi86: Associate DSI device lifetime with auxiliary device
    3d57f6ac641c ASoC: pxa: fix a memory leak in probe()
    14a1a7beb3d3 gpio: vf610: set value before the direction to avoid a glitch
    7ec224d98070 platform/x86: asus-wmi: Map 0x2a code, Ignore 0x2b and 0x2c events
    baf191abecf7 platform/x86: asus-wmi: Only map brightness codes when using asus-wmi backlight control
    4186c79c130d platform/x86: asus-wmi: Change ASUS_WMI_BRN_DOWN code from 0x20 to 0x2e
    52d54f1d4e03 platform/x86: intel-uncore-freq: Conditionally create attribute for read frequency
    8a4b575d00ef platform/surface: platform_profile: Propagate error if profile registration fails
    fec769b9fd25 s390/cio: fix a memleak in css_alloc_subchannel
    7241c2627c14 selftests/ftrace: Add new test case which checks non unique symbol
    324c31b0e0d7 s390/pci: fix iommu bitmap allocation
    f6952655a612 perf: Disallow mis-matched inherited group reads
    908c62800584 USB: serial: option: add Fibocom to DELL custom modem FM101R-GL
    acced163ab6a USB: serial: option: add entry for Sierra EM9191 with new firmware
    1dce40c9e6d8 USB: serial: option: add Telit LE910C4-WWX 0x1035 composition
    59aa39697fc2 HID: input: map battery system charging
    ea0e0473093f KVM: x86/mmu: Stop zapping invalidated TDP MMU roots asynchronously
    3519cee444bc nvme-rdma: do not try to stop unallocated queues
    bec9cb90fee1 nvmet-auth: complete a request only after freeing the dhchap pointers
    0ec655ad659d nvme-pci: add BOGUS_NID for Intel 0a54 device
    2c0b40c310a5 nvme: sanitize metadata bounce buffer for reads
    a54974b0076f nfs42: client needs to strip file mode's suid/sgid bit after ALLOCATE op
    8d69b47443e8 ACPI: irq: Fix incorrect return value in acpi_register_gsi()
    c462bf4ef88a NFSv4.1: fixup use EXCHGID4_FLAG_USE_PNFS_DS for DS server
    ab65424d618b pNFS/flexfiles: Check the layout validity in ff_layout_mirror_prepare_stats
    730bbbbe16b7 pNFS: Fix a hang in nfs4_evict_inode()
    fbd8b28fe4a2 Revert "pinctrl: avoid unsafe code pattern in find_pinctrl()"
    c4b7b119c56c mmc: core: Capture correct oemid-bits for eMMC cards
    85664ad23f8b mmc: core: sdio: hold retuning if sdio in 1-bit mode
    aaa476a7ad50 mmc: mtk-sd: Use readl_poll_timeout_atomic in msdc_reset_hw
    43f588b82070 mmc: sdhci-pci-gli: fix LPM negotiation so x86/S0ix SoCs can suspend
    55c2428658ec dt-bindings: mmc: sdhci-msm: correct minimum number of clocks
    73915d26b474 mtd: physmap-core: Restore map_rom fallback
    578687563e71 mtd: spinand: micron: correct bitmask for ecc status
    8b2b755a1a52 mtd: rawnand: arasan: Ensure program page operations are successful
    58277212f576 mtd: rawnand: marvell: Ensure program page operations are successful
    250feed792f8 mtd: rawnand: pl353: Ensure program page operations are successful
    58454486132c mtd: rawnand: qcom: Unmap the right resource upon probe failure
    a7f5558ec2db net/smc: fix smc clc failed issue when netdevice not in init_net
    2efcdbef13c9 tcp_bpf: properly release resources on error paths
    c3e70048ac25 selftests: openvswitch: Add version check for pyroute2
    a1a9e57037e0 Bluetooth: hci_event: Fix using memcmp when comparing keys
    758610516f0b ice: Remove redundant pci_enable_pcie_error_reporting()
    ec9bc89a0188 tcp: allow again tcp_disconnect() when threads are waiting
    9dc02f41d54e net/tls: split tls_rx_reader_lock
    76f96854aa25 net/mlx5e: Don't offload internal port if filter device is out device
    107ff0034bbc net/mlx5: Handle fw tracer change ownership event based on MTRC
    0aa1e83a20f1 net/mlx5: E-switch, register event handler before arming the event
    c21bff1c99b6 xfrm6: fix inet6_dev refcount underflow problem
    d91723f6ca3c net: xfrm: skip policies marked as dead while reinserting policies
    df2cc87f2c38 fprobe: Fix to ensure the number of active retprobes is not zero
    f177a579d2e8 fprobe: Add nr_maxactive to specify rethook_node pool size
    0806cb1e6c63 fprobe: Pass entry_data to handlers
    bacf8c749add cpufreq: schedutil: Update next_freq when cpufreq_limits change
    62733bbae12c platform/x86: touchscreen_dmi: Add info for the Positivo C4128B
    60dc7e39dff8 HID: nintendo: reinitialize USB Pro Controller after resuming from suspend
    ef8cdee81ef5 HID: multitouch: Add required quirk for Synaptics 0xcd7e device
    2a2df4f74f37 drm/amd/pm: add unique_id for gc 11.0.3
    1869638a1444 btrfs: error out when reallocating block for defrag using a stale transaction
    f174c8d2c634 btrfs: error when COWing block from a root that is being deleted
    c833f1e28d13 btrfs: error out when COWing block using a stale transaction
    9d99acb6a162 btrfs: fix some -Wmaybe-uninitialized warnings in ioctl.c
    c3657e5fa7b6 drm: panel-orientation-quirks: Add quirk for One Mix 2S
    ffbb01fe9a15 ipv4/fib: send notify when delete source address routes
    52080d6edc9a sky2: Make sure there is at least one frag_addr available
    d63d39e7f95e regulator/core: Revert "fix kobject release warning and memory leak in regulator_register()"
    2353f6476233 wifi: cfg80211: avoid leaking stack data into trace
    2fd88f5632e1 wifi: mac80211: allow transmitting EAPOL frames with tainted key
    9285fea3a22e wifi: mac80211: work around Cisco AP 9115 VHT MPDU length
    dbbb6090c9b2 wifi: cfg80211: Fix 6GHz scan configuration
    a55d53ad5c86 Bluetooth: hci_core: Fix build warnings
    aad0760c2607 Bluetooth: Avoid redundant authentication
    7045675fc916 Bluetooth: btusb: add shutdown function for QCA6174
    7d823a1071c6 HID: holtek: fix slab-out-of-bounds Write in holtek_kbd_input_event
    f45752f1eb91 HID: logitech-hidpp: Add Bluetooth ID for the Logitech M720 Triathlon mouse
    e045b6a92129 wifi: iwlwifi: Ensure ack flag is properly cleared.
    eb7ae9ed63c6 wifi: mwifiex: Sanity check tlv_len and tlv_bitmap_len
    b812b3169628 tracing: relax trace_event_eval_update() execution with cond_resched()
    1c859abdd7de ata: libata-eh: Fix compilation warning in ata_eh_link_report()
    e4ce5ce29a1c ata: libata-core: Fix compilation warning in ata_dev_config_ncq()
    5075570a3ede gpio: timberdale: Fix potential deadlock on &tgpio->lock
    d0dab9dd327a overlayfs: set ctime when setting mtime and atime
    6133f63d4d87 i2c: mux: Avoid potential false error message in i2c_mux_add_adapter
    febcad3d32ab btrfs: initialize start_slot in btrfs_log_prealloc_extents
    563853bf3b84 btrfs: return -EUCLEAN for delayed tree ref with a ref count not equals to 1
    8a4e34fe1baa btrfs: prevent transaction block reserve underflow when starting transaction
    c194e184a899 fs-writeback: do not requeue a clean inode having skipped pages
    a7354d90642d ARM: dts: ti: omap: Fix noisy serial with overrun-throttle-ms for mapphone
    1c972cb674e3 pwr-mlxbf: extend Kconfig to include gpio-mlxbf3 dependency
    82a93c65a4e0 iio: adc: ad7192: Correct reference voltage
    ee1d783be55d iio: adc: ad7192: Simplify using devm_regulator_get_enable()
    3b02dbd1cd54 iio: cros_ec: fix an use-after-free in cros_ec_sensors_push_data()
    7bca0af538a4 iio: core: introduce iio_device_{claim|release}_buffer_mode() APIs
    681c8a2c238b serial: 8250_omap: Fix errors with no_console_suspend
    9424a0a45691 serial: 8250: omap: Fix imprecise external abort for omap_8250_pm()
    7067c3cf0823 serial: Reduce spinlocked portion of uart_rs485_config()
    147156b19cd0 serial: Rename uart_change_speed() to uart_change_line_settings()
    e4df8000bdd3 serial: Move uart_change_speed() earlier
    4d382ba65ddb usb: misc: onboard_hub: add support for Microchip USB2412 USB 2.0 hub
    8e939c21f60f usb: misc: onboard_usb_hub: add Genesys Logic GL3523 hub support
    a46907e1f6b6 usb: misc: onboard_usb_hub: add Genesys Logic GL852G hub support
    a2431e7e8bdd usb: misc: onboard_usb_hub: add Genesys Logic GL850G hub support
    5e7275e43292 selftests/mm: fix awk usage in charge_reserved_hugetlb.sh and hugetlb_reparenting_test.sh that may cause error
    673edcffa096 net: check for altname conflicts when changing netdev's netns
    9307f5f59a4a net: fix ifname in netlink ntf during netns move
    b92433493bcc net: avoid UAF on deleted altname
    1cf912054a08 net: pktgen: Fix interface flags printing
    2fb84f52142d net: phy: bcm7xxx: Add missing 16nm EPHY statistics
    e1512ff1ecb8 netfilter: nf_tables: revert do not remove elements if set backend implements .abort
    c2eaa8319f99 netfilter: nf_tables: do not remove elements if set backend implements .abort
    0e8cdddf010b netlink: Correct offload_xstats size
    0697918ec0c0 netfilter: nft_set_rbtree: .deactivate fails if element has expired
    d9d289b78c51 selftests: netfilter: Run nft_audit.sh in its own netns
    0bb15735121d selftests: openvswitch: Catch cases where the tests are killed
    e0914e5a05dd neighbor: tracing: Move pin6 inside CONFIG_IPV6=y section
    d80bc191420a net/sched: sch_hfsc: upgrade 'rt' to 'sc' when it becomes a inner curve
    ec7393fe63cb bonding: Return pointer to data after pull on skb
    3065fabd17c5 net: dsa: bcm_sf2: Fix possible memory leak in bcm_sf2_mdio_register()
    9c3d276fa866 i40e: prevent crash on probe if hw registers have invalid values
    f0ab9b0922fc octeon_ep: update BQL sent bytes before ringing doorbell
    1a68d440112a net: usb: smsc95xx: Fix an error code in smsc95xx_reset()
    2c6451d665fb ipv4: fib: annotate races around nh->nh_saddr_genid and nh->nh_saddr
    9570bee67850 tun: prevent negative ifindex
    8b9c79c0ecd2 tcp: Fix listen() warning with v4-mapped-v6 address.
    f534a513e8c3 tcp: tsq: relax tcp_small_queue_check() when rtx queue contains a single skb
    4e1f3457e9af tcp: fix excessive TLP and RACK timeouts from HZ rounding
    df5ee37bf29d net: rfkill: gpio: prevent value glitch during probe
    2a6fc637c625 net: ipv6: fix return value check in esp_remove_trailer
    55d794cef353 net: ipv4: fix return value check in esp_remove_trailer
    49b9165ead33 wifi: cfg80211: use system_unbound_wq for wiphy work
    405dbaf04981 xfrm: interface: use DEV_STATS_INC()
    b372db2b8d18 xfrm: fix a data-race in xfrm_gen_index()
    3065fa2cdd7a xfrm: fix a data-race in xfrm_lookup_with_ifid()
    2c7ec9e9ea70 qed: fix LL2 RX buffer allocation
    cc87f4db1417 ASoC: codecs: wcd938x: fix resource leaks on bind errors
    8092aed62375 ASoC: codecs: wcd938x: fix unbind tear down order
    b2974b20e40d ASoC: codecs: wcd938x: drop bogus bind error handling
    569afdedde68 ASoC: codecs: wcd938x-sdw: fix runtime PM imbalance on probe errors
    0d912daab475 ASoC: codecs: wcd938x-sdw: fix use after free on driver unbind
    d496b6638c20 ALSA: hda/relatek: Enable Mute LED on HP Laptop 15s-fq5xxx
    086babbbf8e0 ALSA: hda/realtek: Add quirk for ASUS ROG GU603ZV
    bcf883e244dd ALSA: hda/realtek - Fixed ASUS platform headset Mic issue
    a9519099e323 drm/mediatek: Correctly free sg_table in gem prime vmap
    add2eeda1d6e drm/i915: Retry gtt fault when out of fence registers
    f691ec5a5482 nvmet-tcp: Fix a possible UAF in queue intialization setup
    02322c5177e8 netfilter: nft_payload: fix wrong mac header matching
    36a315c923e0 fs/ntfs3: fix deadlock in mark_as_free_ex
    c1f2638e315b fs/ntfs3: fix panic about slab-out-of-bounds caused by ntfs_list_ea()
    fb80a28fef2b fs/ntfs3: Fix possible null-pointer dereference in hdr_find_e()
    d4ae85b883f3 mptcp: more conservative check for zero probes
    80990979a946 tcp: check mptcp-level constraints for backlog coalescing
    f7e65c03d5bf audit,io_uring: io_uring openat triggers audit reference count underflow
    a556a0df8df0 x86: KVM: SVM: refresh AVIC inhibition in svm_leave_nested()
    54f030271d6b x86: KVM: SVM: add support for Invalid IPI Vector interception
    482565df3508 KVM: x86: Constrain guest-supported xfeatures only at KVM_GET_XSAVE{2}
    20695711e298 x86/fpu: Allow caller to constrain xfeatures when copying to uabi buffer
    57d0639f60f1 x86/sev: Check for user-space IOIO pointing to kernel space
    def94eb9a804 x86/sev: Check IOBM for IOIO exceptions from user-space
    95ff590b8027 x86/sev: Disable MMIO emulation from user mode
    19ffa9b2515a KVM: x86: Mask LVTPC when handling a PMI
    d11cfd1f30d6 regmap: fix NULL deref on lookup
    d7dbdbe3800a nfc: nci: fix possible NULL pointer dereference in send_acknowledge()
    fb8e1608b0e5 btrfs: fix stripe length calculation for non-zoned data chunk allocation
    753ef5ef4c3b net/smc: return the right falback reason when prefix checks fail
    d994502fdc66 ice: reset first in crash dump kernels
    0f8d381adaa9 ice: fix over-shifted variable
    bbc5c96f8214 Bluetooth: avoid memcmp() out of bounds warning
    feffabdd0ace Bluetooth: hci_event: Fix coding style
    99ccf8d79bdd Bluetooth: vhci: Fix race when opening vhci device
    25e5d2883002 Bluetooth: Fix a refcnt underflow problem for hci_conn
    faa6366605d6 Bluetooth: Reject connection with the device which has same BD_ADDR
    8d76a44d2615 Bluetooth: hci_event: Ignore NULL link key
    84523aeeeaf9 igc: Fix race condition in PTP tx code
    ff996d61ddde igc: Add condition for qbv_config_change_errors counter
    cd7b19dc5f3c igc: Add qbv_config_change_errors counter
    88421f474136 igc: Remove reset adapter task for i226 during disable tsn config
    3c3418a58655 igc: enable Qbv configuration for 2nd GCL
    8420fe4dd2d9 igc: remove I226 Qbv BaseTime restriction
    db4677b35047 lib/Kconfig.debug: do not enable DEBUG_PREEMPT by default

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4ed9491931f90072f054db59e77472c1bc6a8ff4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 388b3bc9aa..6ebf533bb0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a2e879055edc5c20cb585075883a1f14f843236a"
-SRCREV_meta ?= "a7bfe6ed5d665b094b3e2d30c4cd94dece2c75f3"
+SRCREV_machine ?= "0dad5306907b9e6fb89103dfba80dbd0edafcdb6"
+SRCREV_meta ?= "0553e01ca003e82d32d9b85c0275568e8ce67274"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.59"
+LINUX_VERSION ?= "6.1.60"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 3c795ffd7a..af98525c4f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.59"
+LINUX_VERSION ?= "6.1.60"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
-SRCREV_meta ?= "a7bfe6ed5d665b094b3e2d30c4cd94dece2c75f3"
+SRCREV_machine ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
+SRCREV_meta ?= "0553e01ca003e82d32d9b85c0275568e8ce67274"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index faf7b24361..9f17f244f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0dc67474b3a4cff025b88860144d744ddc84c42f"
-SRCREV_machine:qemuarm64 ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
-SRCREV_machine:qemuloongarch64 ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
-SRCREV_machine:qemumips ?= "bbebdd05a604e925644c544881a2c6254fe914dd"
-SRCREV_machine:qemuppc ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
-SRCREV_machine:qemuriscv64 ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
-SRCREV_machine:qemuriscv32 ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
-SRCREV_machine:qemux86 ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
-SRCREV_machine:qemux86-64 ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
-SRCREV_machine:qemumips64 ?= "5df71878658d6ba9b9e61d7bc2a67cd57c2022f1"
-SRCREV_machine ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
-SRCREV_meta ?= "a7bfe6ed5d665b094b3e2d30c4cd94dece2c75f3"
+SRCREV_machine:qemuarm ?= "65ec3fc08dd186624d2004ae7aa15456c26f6ce8"
+SRCREV_machine:qemuarm64 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
+SRCREV_machine:qemuloongarch64 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
+SRCREV_machine:qemumips ?= "88007e8e5b1cffac43b7d0c8db3a784819140c71"
+SRCREV_machine:qemuppc ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
+SRCREV_machine:qemuriscv64 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
+SRCREV_machine:qemuriscv32 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
+SRCREV_machine:qemux86 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
+SRCREV_machine:qemux86-64 ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
+SRCREV_machine:qemumips64 ?= "9f25eb5709ab8af0ece7306014d5e8b7c6150c68"
+SRCREV_machine ?= "780d811bb97bf34f2be6cab28d5a8b099154c40d"
+SRCREV_meta ?= "0553e01ca003e82d32d9b85c0275568e8ce67274"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7d24402875c75ca6e43aa27ae3ce2042bde259a4"
+SRCREV_machine:class-devupstream ?= "32c9cdbe383c153af23cfa1df0a352b97ab3df7a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.59"
+LINUX_VERSION ?= "6.1.60"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


