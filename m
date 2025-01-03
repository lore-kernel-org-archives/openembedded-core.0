Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0DEE77199
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 14:17:16 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.31297.1735913835732840868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 06:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gVIp2Zqy;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6e4d38185so1010718285a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735913835; x=1736518635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogn1dhKRI9Cl7aXHXyIFR58VqR8mE5qxKk7xt+t2z2A=;
        b=gVIp2ZqypZCMx9uusKQlaG82yswzH2AWmh4l1OF7UV9PSu96LKmGXH+hSAC+LyU9aR
         gFf5e0l1EJSrY68gKZtzq3XN6muzHmu3G8Upy8rOnGA6zkjoWdLIO2kY9d77VUe9u5Z5
         ZGasN1ruUisdSVUFE79Gw5TXTuWohH7xqkspTG1YiT4FTdY6d5chAMuIIxuY6GDLxij0
         p4waNQSL9qvsgn4i1vCXuC3A2Or3U/Ud6QfCF/HoJ0nc9ZGyjaXp0Xn1ghxNGSGuNY1s
         XrB4O0Z1E4pqHp32sOeW23ne63vBQ60u39xF3IzOosfbc0EkqfCieAVj0l481dLQCl6b
         wSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913835; x=1736518635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogn1dhKRI9Cl7aXHXyIFR58VqR8mE5qxKk7xt+t2z2A=;
        b=S1tYx88d7o3/KOYWa4iqMsA5ISf+5It1qXoOwJHy0WcVJMw2nDbe9ncQtOQZjeLVuh
         TJCvxI/0MTFt4hsoL1qb2oXcYEvQnuIj1yu9RPQsv3JE997kXp8EBvBFlDWRkRJWoQSO
         46XnZia0vC3ObDdEQU3xiAqGqPT3zWJIINuVz1MeWKdPBrbNJhsa11FY0nh4MpL6vYpX
         NENCEtNwscn2shRKgz9QdLeEAeC2o3YUpUMKzPi2de58MKyn7djDyKWQsOAmugA2opRd
         /nrmbgsSmq9dUn/4ES4uynfdpFDcnPCYhs0E4kB8LX6e1HWmikSfENfL3AFUjtpxBXE2
         3H9A==
X-Gm-Message-State: AOJu0YyIhTFptXYLI0ruCWunWq9As40sZbugfLuKgf9knYgr7PgIKTVo
	NMu5U7WgkFJWyMatx5jY8kBbq4EPi80ay/JUZkiLRmECahQxkQHpSjnNGGGxGZU=
X-Gm-Gg: ASbGncte9EIW96AwFoLuI7hapjfxH9wr5ArvPgIyd4WOPYQUdCbUrhAR1pFUDSUwRDc
	yoK1gtnaDDX78iCa40XTiSt6tXnDPBQiwBwrs/TvnzUXq4QElQbq5NI0s/03d5qhYeUobzA84CH
	2VHV6hp/NsXgCWKYjsqCYKra3bFIl6nXYByYWqZ+qydItDmgqGS106VUX3TS8o6a4iyfWR189Bq
	CLv7bdgXuV3ciczvwHatkSUfY/EJEb94KXoMvBwVK1TO/xFjHjLQAeLYcnIPHfii3HUJPWp1vUn
	yj+eeA3MvsvlJpLTMXoSG/BauhwR7A41KBW7LSOsYjdxX3yc0/IdH4xk5A==
X-Google-Smtp-Source: AGHT+IEXUApKX6n5O6H1el/Sn3zWLLEUxNqOBzYM1bdKHhjV30frd8Ih5kJNeyo6d7AUIjj7ZCByWg==
X-Received: by 2002:a05:620a:28c4:b0:7b6:5dbe:1b52 with SMTP id af79cd13be357-7b9ba7aa6ccmr7147285985a.33.1735913834123;
        Fri, 03 Jan 2025 06:17:14 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4ef0f6sm1275015485a.123.2025.01.03.06.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:17:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/10] linux-yocto/5.10: update to v5.10.226
Date: Fri,  3 Jan 2025 09:17:01 -0500
Message-Id: <20250103141709.2848730-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
References: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 14:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209356

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    ceb091e2c4cc Linux 5.10.226
    912736a0435e memcg: protect concurrent access to mem_cgroup_idr
    02ee1976edb2 net, sunrpc: Remap EPERM in case of connection failure in xs_tcp_setup_socket
    dad75cf2c313 x86/mm: Fix PTI for i386 some more
    1401da1486dc rtmutex: Drop rt_mutex::wait_lock before scheduling
    c6bd80f58522 mmc: cqhci: Fix checking of CQHCI_HALT state
    b35d3c8181c5 drm/i915/fence: Mark debug_fence_free() with __maybe_unused
    b8dfa35f008e drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused
    50632b877ce5 nvmet-tcp: fix kernel crash if commands allocation fails
    4c3b21204abb arm64: acpi: Harden get_cpu_for_acpi_id() against missing CPU entry
    ccb95b37e957 arm64: acpi: Move get_cpu_for_acpi_id() to a header
    3658388cd354 ACPI: processor: Fix memory leaks in error paths of processor_add()
    5dac987d1bf9 ACPI: processor: Return an error if acpi_processor_get_info() fails in processor_add()
    157c0d94b4c4 nilfs2: protect references to superblock parameters exposed in sysfs
    0630e3d435c5 nilfs2: replace snprintf in show functions with sysfs_emit
    7882923f1cb8 perf/aux: Fix AUX buffer serialization
    0f511f2840cd uprobes: Use kzalloc to allocate xol area
    0af6b80dace1 clocksource/drivers/timer-of: Remove percpu irq related code
    3ded318cf06f clocksource/drivers/imx-tpm: Fix next event not taking effect sometime
    cf6ffb16884f clocksource/drivers/imx-tpm: Fix return -ETIME when delta exceeds INT_MAX
    6c563a29857a VMCI: Fix use-after-free when removing resource in vmci_resource_remove()
    359ea5edc919 Drivers: hv: vmbus: Fix rescind handling in uio_hv_generic
    1d8e020e51ab uio_hv_generic: Fix kernel NULL pointer dereference in hv_uio_rescind
    38cd8bde8ace nvmem: Fix return type of devm_nvmem_device_get() in kerneldoc
    3a8154bb4ab4 binder: fix UAF caused by offsets overwrite
    d0d3edb56e26 iio: adc: ad7124: fix chip ID mismatch
    1719ebc8e303 iio: fix scale application in iio_convert_raw_to_processed_unlocked
    f3a54c27bacd iio: buffer-dmaengine: fix releasing dma channel on error
    41cc91e3138f staging: iio: frequency: ad9834: Validate frequency parameter value
    d8a61e69f810 NFSv4: Add missing rescheduling points in nfs_client_return_marked_delegations
    6fb7b7f5baaa ata: pata_macio: Use WARN instead of BUG
    d3ff0f98a52f MIPS: cevt-r4k: Don't call get_c0_compare_int if timer irq is installed
    99418ec776a3 lib/generic-radix-tree.c: Fix rare race in __genradix_ptr_alloc()
    9d1e9f0876b0 of/irq: Prevent device address out-of-bounds read in interrupt map walk
    5c8906de98d0 Squashfs: sanity check symbolic link size
    2f14160d9fe2 usbnet: ipheth: race between ipheth_close and error handling
    51fa08edd800 Input: uinput - reject requests with unreasonable number of slots
    34185de73d74 HID: cougar: fix slab-out-of-bounds Read in cougar_report_fixup
    3206e4a4b062 s390/vmlinux.lds.S: Move ro_after_init section behind rodata section
    912bcdc51b3f btrfs: initialize location to fix -Wmaybe-uninitialized in btrfs_lookup_dentry()
    3eaad59258cc kselftests: dmabuf-heaps: Ensure the driver name is null-terminated
    e6f3008de81c net: dpaa: avoid on-stack arrays of NR_CPUS elements
    e2355d513b89 PCI: Add missing bridge lock to pci_bus_lock()
    c60676b81fab btrfs: clean up our handling of refs == 0 in snapshot delete
    ed1b61398c4e btrfs: replace BUG_ON with ASSERT in walk_down_proc()
    8780129cbcc9 smp: Add missing destroy_work_on_stack() call in smp_call_on_cpu()
    9813770f2585 wifi: mwifiex: Do not return unused priv in mwifiex_get_priv_by_id()
    fb2257089a3a libbpf: Add NULL checks to bpf_object__{prev_map,next_map}
    56cfdeb2c772 hwmon: (w83627ehf) Fix underflows seen when writing limit attributes
    8a1e958e2664 hwmon: (nct6775-core) Fix underflows seen when writing limit attributes
    59c1fb9874a0 hwmon: (lm95234) Fix underflows seen when writing limit attributes
    2a3add62f183 hwmon: (adc128d818) Fix underflows seen when writing limit attributes
    bc1faed19db9 pci/hotplug/pnv_php: Fix hotplug driver crash on Powernv
    9b884bdc29e9 devres: Initialize an uninitialized struct member
    c8944d449fda um: line: always fill *error_out in setup_one_line()
    1434b72a2d12 cgroup: Protect css->cgroup write under css_set_lock
    70854bf00326 iommu/vt-d: Handle volatile descriptor status read
    8a7ef20bf738 dm init: Handle minors larger than 255
    583b5d2d4380 ASoC: topology: Properly initialize soc_enum values
    43b442c97243 net: dsa: vsc73xx: fix possible subblocks range of CAPT block
    19af8a23a1d5 net: bridge: br_fdb_external_learn_add(): always set EXT_LEARN
    231c235d2f7a fou: Fix null-ptr-deref in GRO.
    0ea3f2798d15 gro: remove rcu_read_lock/rcu_read_unlock from gro_complete handlers
    77ad44ee337e gro: remove rcu_read_lock/rcu_read_unlock from gro_receive handlers
    bc18f3c80667 fou: remove sparse errors
    3c0cedc22c97 bareudp: Fix device stats updates.
    32cbafeebfc1 usbnet: modern method to get random MAC
    594cc1dba09b net: usb: don't write directly to netdev->dev_addr
    98a4cabf8762 drivers/net/usb: Remove all strcpy() uses
    acd298513760 igc: Unlock on error in igc_io_resume()
    3efe53eb221a tcp_bpf: fix return value of tcp_bpf_sendmsg()
    ee1c2ecf7bbc platform/x86: dell-smbios: Fix error path in dell_smbios_init()
    45c0c747dfb5 svcrdma: Catch another Reply chunk overflow case
    449d70b16b84 igb: Fix not clearing TimeSync interrupts for 82580
    aec92dbebdbe can: bcm: Remove proc entry when dev is unregistered.
    ee50abebdc0b pcmcia: Use resource_size function on resource object
    9380fe33ab23 media: qcom: camss: Add check for v4l2_fwnode_endpoint_parse
    ebbdbbc580c1 PCI: keystone: Add workaround for Errata #i2037 (AM65x SR 1.0)
    1fa40e0d2784 media: vivid: don't set HDMI TX controls if there are no HDMI outputs
    44a595f89762 usb: uas: set host status byte on data completion error
    3ab3ee4125ac wifi: brcmsmac: advertise MFP_CAPABLE to enable WPA3
    9e28a1df185d leds: spi-byte: Call of_node_put() on error path
    e73b63f1388e media: vivid: fix wrong sizeimage value for mplane
    551966371e17 udf: Avoid excessive partition lengths
    66234da64d47 netfilter: nf_conncount: fix wrong variable type
    f56089a1806f iommu: sun50i: clear bypass register
    1c5bad90e035 af_unix: Remove put_pid()/put_cred() in copy_peercred().
    ec08e3008241 irqchip/armada-370-xp: Do not allow mapping IRQ 0 and 1
    500e4bf67387 smack: unix sockets: fix accept()ed socket label
    414736fcb76d ALSA: hda: Add input value sanity checks to HDMI channel map controls
    751777a79a5c nfsd: make svc_stat per-network namespace instead of global
    f8219c4b8075 nfsd: remove nfsd_stats, make th_cnt a global counter
    f2fe1ec906d4 nfsd: make all of the nfsd stats per-network namespace
    554549696663 nfsd: expose /proc/net/sunrpc/nfsd in net namespaces
    fec6561e75d6 nfsd: rename NFSD_NET_* to NFSD_STATS_*
    9eb5d44b8fb1 sunrpc: use the struct net as the svc proc private
    e0fba78ab9b0 sunrpc: remove ->pg_stats from svc_program
    7f2476914e98 sunrpc: pass in the sv_stats struct through svc_create_pooled
    d06254ae7d6a nfsd: stop setting ->pg_stats for unused stats
    2197b23eda2b sunrpc: don't change ->sv_stats if it doesn't exist
    d47c660e8cb6 NFSD: Fix frame size warning in svc_export_parse()
    a8aaffc0c140 NFSD: Rewrite synopsis of nfsd_percpu_counters_init()
    c5322742027d NFSD: simplify error paths in nfsd_svc()
    ebfce8dd7e3f NFSD: Refactor the duplicate reply cache shrinker
    895807268a4d NFSD: Replace nfsd_prune_bucket()
    a02f9d6ea3c0 NFSD: Rename nfsd_reply_cache_alloc()
    73b72f4b3b3f NFSD: Refactor nfsd_reply_cache_free_locked()
    3025d489f9c8 nfsd: move init of percpu reply_cache_stats counters back to nfsd_init_net
    4e18b58b106e nfsd: move reply cache initialization into nfsd startup
    ddee5b4b6a1c mptcp: pm: avoid possible UaF when selecting endp
    91fb0512a05c mptcp: pr_debug: add missing \n at the end
    7e4c72dbaf62 btrfs: fix use-after-free after failure to create a snapshot
    efdde00d4a1e nilfs2: fix state management in error path of log writing function
    07e4dc2fe000 nilfs2: fix missing cleanup on rollforward recovery error
    7725152b54d2 sched: sch_cake: fix bulk flow accounting logic for host fairness
    93ee345ba349 ila: call nf_unregister_net_hooks() sooner
    e3ad85c47777 tracing: Avoid possible softlockup in tracing_iter_reset()
    3a49b6b1caf5 can: mcp251x: fix deadlock if an interrupt occurs during mcp251x_open
    6949a97f6d40 clk: qcom: clk-alpha-pll: Fix the trion pll postdiv set rate API
    f540bc71d582 clk: qcom: clk-alpha-pll: Fix the pll post div mask
    0811d57384b8 fuse: use unsigned type for getxattr/listxattr size truncation
    9d38c704b425 fuse: update stats for pages in dropped aux writeback list
    4be36d9d1871 mmc: sdhci-of-aspeed: fix module autoloading
    2793f4238935 mmc: dw_mmc: Fix IDMAC operation with pages bigger than 4K
    b2ead0948988 Bluetooth: MGMT: Ignore keys being loaded with invalid type
    029e462bb4f5 Revert "Bluetooth: MGMT/SMP: Fix address type when using SMP over BREDR/LE"
    cb27399b3d48 irqchip/gic-v2m: Fix refcount leak in gicv2m_of_init()
    e0b122a8f6dd ata: libata: Fix memory leak for error path in ata_host_alloc()
    0f27b8c07e9a ALSA: hda/realtek: Support mute LED on HP Laptop 14-dq2xxx
    2ef683b0585b ALSA: hda/realtek: add patch for internal mic in Lenovo V145
    adc688a5054d ALSA: hda/conexant: Add pincfg quirk to enable top speakers on Sirius devices
    8ca21e7a27c6 ASoC: dapm: Fix UAF for snd_soc_pcm_runtime object
    98c75d761879 sch/netem: fix use after free in netem_dequeue
    06e7be693413 bpf, cgroup: Assign cgroup in cgroup_sk_alloc when called from interrupt
    b1400745609d i2c: Use IS_REACHABLE() for substituting empty ACPI functions
    dfc8eb4d7e3b ext4: handle redirtying in ext4_bio_write_page()
    5895541d7389 udf: Limit file size to 4TB
    17c43211d45f rcu-tasks: Fix show_rcu_tasks_trace_gp_kthread buffer overflow
    842a97b5e44f virtio_net: Fix napi_skb_cache_put warning
    c8e5439b5b6a net: set SOCK_RCU_FREE before inserting socket into hashtable
    cf002be3b8d9 bpf, cgroups: Fix cgroup v2 fallback on v1/v2 mixed mode
    2ac9deb7e087 drm/amd/pm: Fix the null pointer dereference for vega10_hwmgr
    3fd11fe4f207 block: initialize integrity buffer to zero before writing it to media
    0623c9f37118 media: uvcvideo: Enforce alignment of frame and interval
    c083c8be6bdd drm/amd/display: Skip wbscl_set_scaler_filter if filter is null
    5eb04f989484 block: remove the blk_flush_integrity call in blk_integrity_unregister
    0305a885ccea wifi: cfg80211: make hash table duplicates more survivable
    d24bc270b7db drm/meson: plane: Add error handling
    a948ec993541 smack: tcp: ipv4, fix incorrect labeling
    3f3ef1d9f66b fsnotify: clear PARENT_WATCHED flags lazily
    7e64cabe81c3 usb: typec: ucsi: Fix null pointer dereference in trace
    bd13c1119a96 usbip: Don't submit special requests twice
    c7975f09ae26 ionic: fix potential irq name truncation
    e85cf9a5a41b hwspinlock: Introduce hwspin_lock_bust()
    7eb7888021ba PCI: al: Check IORESOURCE_BUS existence during probe
    9aa7dd5e3189 wifi: iwlwifi: remove fw_running op
    ed7e9ed9738e drm/amd/pm: check negtive return for table entries
    614564a5b289 drm/amdgpu: the warning dereferencing obj for nbio_v7_4
    008933832a31 drm/amdgpu/pm: Check input value for CUSTOM profile mode setting on legacy SOCs
    52338a3aa772 apparmor: fix possible NULL pointer dereference
    0842db679dc0 drm/amdkfd: Reconcile the definition and use of oem_id in struct kfd_topology_device
    310b9d8363b8 drm/amdgpu: fix mc_data out-of-bounds read warning
    5f09fa5e0ad4 drm/amdgpu: fix ucode out-of-bounds read warning
    725b728cc0c8 drm/amdgpu: Fix out-of-bounds read of df_v1_7_channel_number
    c253b87c7c37 drm/amdgpu: Fix out-of-bounds write warning
    60097df93854 drm/amdgpu/pm: Fix uninitialized variable agc_btc_response
    74c5d8b057cd drm/amd/display: Fix Coverity INTEGER_OVERFLOW within dal_gpio_service_create
    916083054670 drm/amd/display: Check msg_id before processing transcation
    7c47dd2e9234 drm/amd/display: Check num_valid_sets before accessing reader_wm_sets[]
    2a63c90c7a90 drm/amd/display: Add array index check for hdcp ddc access
    754321ed63f0 drm/amd/display: Stop amdgpu_dm initialize when stream nums greater than 6
    40c2e8bc117c drm/amd/display: Check gpio_id before used as array index
    e24fa827299e drm/amdgpu: avoid reading vf2pf info size from FB
    1d0c85d0fcb2 drm/amd/pm: fix uninitialized variable warnings for vega10_hwmgr
    59ac791297e2 drm/amdgpu: fix uninitialized scalar variable warning
    38e32a0d8374 drm/amd/pm: fix the Out-of-bounds read warning
    d592768c1750 drm/amd/pm: fix warning using uninitialized value of max_vid_step
    a601129c785b drm/amd/pm: fix uninitialized variable warning for smu8_hwmgr
    774bae3b8dcd drm/amdgpu: fix overflowed array index read warning
    28b539bbccee drm/amdgpu: Fix uninitialized variable warning in amdgpu_afmt_acr
    40d0fedacfdf net: usb: qmi_wwan: add MeiG Smart SRM825L
    ff5af3f9b510 dma-debug: avoid deadlock between dma debug vs printk and netconsole
    712921d2abf4 i2c: Fix conditional for substituting empty ACPI functions
    0e69cf9b657f ALSA: hda/conexant: Mute speakers at suspend / shutdown
    221ebded43cb ALSA: hda/generic: Add a helper to mute speakers at suspend/shutdown
    e78bc7099c8d drm: panel-orientation-quirks: Add quirk for OrangePi Neo
    03a85a51f33a fix vfsub build error
    b57d01c66f40 Linux 5.10.225
    7e8bad2cf393 apparmor: fix policy_unpack_test on big endian systems
    9e96dea7eff6 scsi: aacraid: Fix double-free on probe failure
    4538335cc23d usb: core: sysfs: Unmerge @usb3_hardware_lpm_attr_group in remove_power_attributes()
    59579a627adb usb: dwc3: st: add missing depopulate in probe error path
    6aee4c5635d8 usb: dwc3: st: fix probed platform device ref count on probe error path
    b72da4d89b97 usb: dwc3: core: Prevent USB core invalid event buffer address access
    16cc6114c981 usb: dwc3: omap: add missing depopulate in probe error path
    f84d5dccc855 USB: serial: option: add MeiG Smart SRM825L
    612843f842ad cdc-acm: Add DISABLE_ECHO quirk for GE HealthCare UI Controller
    f5a5a5a0e95f soc: qcom: cmd-db: Map shared memory as WC, not WB
    8ddaea033de0 nfc: pn533: Add poll mod list filling check
    7e5d5c4ae707 net: busy-poll: use ktime_get_ns() instead of local_clock()
    8bbb9e4e0e66 gtp: fix a potential NULL pointer dereference
    842a40c7273b ethtool: check device is present when getting link settings
    2e8e93dea04d dmaengine: dw: Add memory bus width verification
    9cfe7c53fef1 dmaengine: dw: Add peripheral bus width verification
    f8e1c92868ad soundwire: stream: fix programming slave ports for non-continous port maps
    acddd7c6b782 ovl: do not fail because of O_NOATIME
    338a3ba30c5e net:rds: Fix possible deadlock in rds_message_put
    688325078a8b cgroup/cpuset: Prevent UAF in proc_cpuset_show()
    e83405e75d90 ata: libata-core: Fix null pointer dereference on error
    f2b6cd1335d2 Revert "Input: ioc3kbd - convert to platform remove callback returning void"
    777d9c223e83 media: uvcvideo: Fix integer overflow calculating timestamp
    f7276cdc1912 drm/amdkfd: don't allow mapping the MMIO HDP page with large pages
    0365c9029ad9 ipc: replace costly bailout check in sysvipc_find_ipc()
    2933b4f8a6b3 mptcp: sched: check both backup in retrans
    1388df72dc14 wifi: mwifiex: duplicate static structs used in driver instances
    4e9436375fcc pinctrl: single: fix potential NULL dereference in pcs_get_function()
    d57e6298cca3 pinctrl: rockchip: correct RK3328 iomux width flag for GPIO2-B pins
    a45ee4c98da0 KVM: arm64: Don't use cbz/adr with external symbols
    df02642c21c9 drm/amdgpu: Using uninitialized value *size when calling amdgpu_vce_cs_reloc
    239b1cacceec tools: move alignment-related macros to new <linux/align.h>
    05dd9aabd04f Input: MT - limit max slots
    56b82e6ff3f5 Bluetooth: hci_ldisc: check HCI_UART_PROTO_READY flag in HCIUARTGETPROTO
    93000b294952 nfsd: Don't call freezable_schedule_timeout() after each successful page allocation in svc_alloc_arg().
    b009444700d9 ALSA: timer: Relax start tick time check for slave timer elements
    b891438bc39b Revert "drm/amd/display: Validate hw_points_num before using it"
    92915fa734ab mmc: dw_mmc: allow biu and ciu clocks to defer
    15818af2f7aa KVM: arm64: Make ICC_*SGI*_EL1 undef in the absence of a vGICv3
    65e79c943750 cxgb4: add forgotten u64 ivlan cast before shift
    d1623e7b43d5 HID: microsoft: Add rumble support to latest xbox controllers
    8c0a21d37d04 HID: wacom: Defer calculation of resolution until resolution_code is known
    fc73103a94e3 MIPS: Loongson64: Set timer mode in cpu-probe
    7fd3a5926870 binfmt_misc: pass binfmt_misc flags to the interpreter
    9df9783bd856 Bluetooth: MGMT: Add error handling to pair_device()
    9b9ba386d7bf mmc: mmc_test: Fix NULL dereference on allocation failure
    4370448fca3a drm/msm/dp: reset the link phy params before link training
    e54b08275237 drm/msm/dpu: don't play tricks with debug macros
    ff6607a4777c net: xilinx: axienet: Fix dangling multicast addresses
    2884e73978f6 net: xilinx: axienet: Always disable promiscuous mode
    cb5880a0de12 ipv6: prevent UAF in ip6_send_skb()
    c414000da1c2 netem: fix return value if duplicate enqueue fails
    050e7274ab21 net: dsa: mv88e6xxx: Fix out-of-bound access
    5885217d6663 net: dsa: mv88e6xxx: replace ATU violation prints with trace points
    5d8aed3ca688 net: dsa: mv88e6xxx: read FID when handling ATU violations
    544571911bc6 ice: fix ICE_LAST_OFFSET formula
    5c144835448a bonding: fix xfrm state handling when clearing active slave
    21816b696c17 bonding: fix xfrm real_dev null pointer dereference
    81216b9352be bonding: fix null pointer deref in bond_ipsec_offload_ok
    e8c85f2ff369 bonding: fix bond_ipsec_offload_ok return type
    6e630e1d7740 ip6_tunnel: Fix broken GRO
    4d42a2257ba6 netfilter: nft_counter: Synchronize nft_counter_reset() against reader.
    eb06c8d3022c kcm: Serialise kcm_sendmsg() for the same socket.
    f4b762cf7ef0 tc-testing: don't access non-existent variable on exception
    095a1f19d452 Bluetooth: SMP: Fix assumption of Central always being Initiator
    7a4e7a0c6b0b Bluetooth: hci_core: Fix LE quote calculation
    ce70b0915009 dm suspend: return -ERESTARTSYS instead of -EINTR
    0ba340177782 media: solo6x10: replace max(a, min(b, c)) by clamp(b, a, c)
    d1bd8e0a11ea block: use "unsigned long" for blk_validate_block_size().
    cbb9a969fc19 gtp: pull network headers in gtp_dev_xmit()
    5970a540daad hrtimer: Prevent queuing of hrtimer without a function callback
    b09a5ec8de14 nvmet-rdma: fix possible bad dereference when freeing rsps
    2143cba14381 ext4: set the type of max_zeroout to unsigned int to avoid overflow
    f14cd61826d1 irqchip/gic-v3-its: Remove BUG_ON in its_vpe_irq_domain_alloc
    9e1c4d0d6ae9 usb: dwc3: core: Skip setting event buffers for host only controllers
    1b8e318f9960 s390/iucv: fix receive buffer virtual vs physical address confusion
    d0414f5436bc openrisc: Call setup_memory() earlier in the init sequence
    e5272645a038 NFS: avoid infinite loop in pnfs_update_layout.
    9e0414220bc2 nvmet-tcp: do not continue for invalid icreq
    5ee7495ac278 net: hns3: add checking for vf id of mailbox
    c7c43a784fdf Bluetooth: bnep: Fix out-of-bound access
    bf2f79970b6f usb: gadget: fsl: Increase size of name buffer for endpoints
    bf0c603ab4ed f2fs: fix to do sanity check in update_sit_entry
    8ec052c544f4 btrfs: delete pointless BUG_ON check on quota root in btrfs_qgroup_account_extent()
    0c1d7b960fd7 btrfs: send: handle unexpected data in header buffer in begin_cmd()
    94a7dff229b9 btrfs: handle invalid root reference found in may_destroy_subvol()
    3dd13074e75e btrfs: change BUG_ON to assertion when checking for delayed_node root
    e21448a49b8b powerpc/boot: Only free if realloc() succeeds
    486fb5ebd5d6 powerpc/boot: Handle allocation failure in simple_realloc()
    05c21f285d9f parisc: Use irq_enter_rcu() to fix warning at kernel/context_tracking.c:367
    4e5464005bd3 memory: stm32-fmc2-ebi: check regmap_read return value
    25d31baf922c x86: Increase brk randomness entropy for 64-bit systems
    76ec27b70983 md: clean up invalid BUG_ON in md_ioctl
    95e49b925812 netlink: hold nlk->cb_mutex longer in __netlink_dump_start()
    316bf51edd3e virtiofs: forbid newlines in tags
    be49c4f2a15e drm/lima: set gp bus_stop bit before hard reset
    aa469c3d2854 net/sun3_82586: Avoid reading past buffer in debug output
    5fb0cbf84b18 scsi: lpfc: Initialize status local variable in lpfc_sli4_repost_sgl_list()
    a441ce39adf3 fs: binfmt_elf_efpic: don't use missing interpreter's properties
    e7385510e255 media: pci: cx23885: check cx23885_vdev_init() return
    00d4f971fa3c quota: Remove BUG_ON from dqget()
    239c5e988ec1 ext4: do not trim the group with corrupted block bitmap
    0f6425d90d0f nvmet-trace: avoid dereferencing pointer too early
    5380f1b2b9ab powerpc/xics: Check return value of kasprintf in icp_native_map_one_cpu
    372928e8bef0 IB/hfi1: Fix potential deadlock on &irq_src_lock and &dd->uctxt_lock
    7138c598562b wifi: iwlwifi: abort scan when rfkill on but device enabled
    d483de53d4cf gfs2: setattr_chown: Add missing initialization
    80456d39f08f scsi: spi: Fix sshdr use
    3663e78fab9f media: qcom: venus: fix incorrect return value
    a43edc7abc4f binfmt_misc: cleanup on filesystem umount
    c13541c5eff9 staging: ks7010: disable bh on tx_dev_lock
    db3b679f66f1 drm/amd/display: Validate hw_points_num before using it
    cc49ee343351 staging: iio: resolver: ad2s1210: fix use before initialization
    01fa4415c3cc media: radio-isa: use dev_name to fill in bus_info
    0f83d7792630 s390/smp,mcck: fix early IPI handling
    aeda7043c4db RDMA/rtrs: Fix the problem of variable not initialized fully
    bbb662d0c23d i2c: riic: avoid potential division by zero
    5335c7f8db45 wifi: cw1200: Avoid processing an invalid TIM IE
    11b0c7323c28 wifi: mac80211: fix BA session teardown race
    5fe7bdbe4f53 ssb: Fix division by zero issue in ssb_calc_clock_rate
    dfa894f7ea37 ALSA: hda/realtek: Fix noise from speakers on Lenovo IdeaPad 3 15IAU7
    fc250eca15bd net: hns3: fix a deadlock problem when config TC during resetting
    dbdbadec8a39 net: hns3: fix wrong use of semaphore up
    e5ceff2196dc netfilter: flowtable: initialise extack before use
    50c914b0e6fc mptcp: correct MPTCP_SUBFLOW_ATTR_SSN_OFFSET reserved size
    8e8d306f3b58 net: dsa: vsc73xx: check busy flag in MDIO operations
    351ad72c50d7 net: dsa: vsc73xx: use read_poll_timeout instead delay loop
    665a4caa9c8d net: dsa: vsc73xx: pass value in phy_write operation
    aa9ce4193cba net: axienet: Fix register defines comment description
    1cece837e387 atm: idt77252: prevent use after free in dequeue_rx()
    4b730a147566 net/mlx5e: Correctly report errors for ethtool rx flows
    8e0e6b15ab49 s390/uv: Panic for set and remove shared access UVC errors
    6bcd0f95b899 btrfs: rename bitmap_set_bits() -> btrfs_bitmap_set_bits()
    c10ac31a72de s390/cio: rename bitmap_size() -> idset_bitmap_size()
    e24625310c61 drm/amdgpu/jpeg2: properly set atomics vmid field
    ad149f558534 memcg_write_event_control(): fix a user-triggerable oops
    0452e15e7fe1 drm/amdgpu: Actually check flags for all context ops.
    d88083916fc6 btrfs: tree-checker: add dev extent item checks
    bbcdda4b0d04 selinux: fix potential counting error in avc_add_xperms_decision()
    fe5bf1488170 fix bitmap corruption on close_range() with CLOSE_RANGE_UNSHARE
    de7be1940c34 bitmap: introduce generic optimized bitmap_size()
    03880af02a78 vfs: Don't evict inode under the inode lru traversing context
    ee030e4ffa9b dm persistent data: fix memory allocation failure
    63fd38af880b dm resume: don't return EINVAL when signalled
    1b21a791afc9 arm64: ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
    e245a18281c2 s390/dasd: fix error recovery leading to data corruption on ESE devices
    747bc154577d thunderbolt: Mark XDomain as unplugged when router is removed
    0f0654318e25 xhci: Fix Panther point NULL pointer deref at full-speed re-enumeration
    4905e56f7bac ALSA: usb-audio: Support Yamaha P-125 quirk entry
    4690e2171f65 fuse: Initialize beyond-EOF page contents before setting uptodate
    b2add7c50b5b Linux 5.10.224
    2de18b5cc38e media: Revert "media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()"
    e1ee1c4198c7 ARM: dts: imx6qdl-kontron-samx6i: fix phy-mode
    80ac0cc9c0be wifi: cfg80211: restrict NL80211_ATTR_TXQ_QUANTUM values
    a563f1243092 vhost-vdpa: switch to use vmf_insert_pfn() in the fault handler
    06e9e6ac59fe vdpa: Make use of PFN_PHYS/PFN_UP/PFN_DOWN helper macro
    b21ea49e6e69 nvme/pci: Add APST quirk for Lenovo N60z laptop
    15469d46ba34 exec: Fix ToCToU between perm check and set-uid/gid usage
    d39e0f582b43 media: uvcvideo: Use entity get_cur in uvc_ctrl_set
    ec54634f9123 arm64: cpufeature: Fix the visibility of compat hwcaps
    fb6675db04c4 powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.
    50111a8098fb drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
    31c35f9f89ef netfilter: nf_tables: prefer nft_chain_validate
    d5f87c11114b netfilter: nf_tables: allow clone callbacks to sleep
    7b17de2a71e5 netfilter: nf_tables: use timestamp to check for set element timeout
    191fc4439524 netfilter: nf_tables: set element extended ACK reporting support
    c52f9e1a9eb4 PCI/DPC: Fix use-after-free on concurrent DPC and hot-removal
    7e62564d5e43 Fix gcc 4.9 build issue in 5.10.y
    329eae03d0f9 Add gitignore file for samples/fanotify/ subdirectory
    9bdf0624bdbc samples: Make fs-monitor depend on libc and headers
    5b9f49cc86bd samples: Add fs error monitoring example
    3f84b37abb8f mptcp: pm: fix backup support in signal endpoints
    44165604dd6e mptcp: export local_address
    9b9a64ef9a1a mptcp: mib: count MPJ with backup flag
    96f3c8a85021 mptcp: fix NL PM announced address accounting
    1008f2bcbc8e mptcp: distinguish rcv vs sent backup flag in requests
    381cad7a0873 mptcp: sched: check both directions for backup
    32b133fb7833 drm/mgag200: Set DDC timeout in milliseconds
    fd65cf86ca3c drm/bridge: analogix_dp: properly handle zero sized AUX transactions
    450b6b22acda x86/mtrr: Check if fixed MTRRs exist before saving them
    ab8b397d5997 padata: Fix possible divide-by-0 panic in padata_mt_helper()
    eb223bf01e68 tracing: Fix overflow in get_free_elt()
    ca2ea2dec107 power: supply: axp288_charger: Round constant_charge_voltage writes down
    51e8360d94b4 power: supply: axp288_charger: Fix constant_charge_voltage writes
    a26bcfeea300 genirq/irqdesc: Honor caller provided affinity in alloc_desc()
    db959cdfe67b irqchip/xilinx: Fix shift out of bounds
    52b138f10211 serial: core: check uartclk for zero to avoid divide by zero
    227d455e6cec irqchip/meson-gpio: Convert meson_gpio_irq_controller::lock to 'raw_spinlock_t'
    7dddf560e238 irqchip/meson-gpio: support more than 8 channels gpio irq
    5f1aa8ce6452 scsi: mpt3sas: Avoid IOMMU page faults on REPORT ZONES
    8f209716ea5e scsi: mpt3sas: Remove scsi_dma_map() error messages
    f3405f4997b0 ntp: Safeguard against time_constant overflow
    f098e8fc7227 driver core: Fix uevent_show() vs driver detach race
    dc335b92e5f1 ntp: Clamp maxerror and esterror to operating range
    668c6c4a7e9e tick/broadcast: Move per CPU pointer access into the atomic section
    005c318981bc scsi: ufs: core: Fix hba->last_dme_cmd_tstamp timestamp updating logic
    ef1b208ca813 usb: gadget: u_serial: Set start_delayed during suspend
    7cc9ebcfe58b usb: gadget: core: Check for unset descriptor
    f1205a5aad68 USB: serial: debug: do not echo input by default
    4dacdb9720aa usb: vhci-hcd: Do not drop references before new references are gained
    d993cb25efb1 ALSA: hda/hdmi: Yet more pin fix for HP EliteDesk 800 G4
    c7c1ca6e258d ALSA: hda: Add HP MP9 G4 Retail System AMS to force connect list
    e7e7d2b180d8 ALSA: line6: Fix racy access to midibuf
    5291d4f73452 drm/client: fix null pointer dereference in drm_client_modeset_probe
    44e11ae8f942 ALSA: usb-audio: Re-add ScratchAmp quirk entries
    c9c11ece5ad9 spi: spi-fsl-lpspi: Fix scldiv calculation
    c6ba514732e9 kprobes: Fix to check symbol prefixes correctly
    9ddd5e7835c6 bpf: kprobe: remove unused declaring of bpf_kprobe_override
    455769ebb60f i2c: smbus: Send alert notifications to all devices if source not found
    56f106d2c476 ASoC: codecs: wsa881x: Correct Soundwire ports mask
    5605992ad425 i2c: smbus: Improve handling of stuck alerts
    706f18a8fa43 arm64: errata: Expand speculative SSBS workaround (again)
    f261c5d8d0f8 arm64: cputype: Add Cortex-A725 definitions
    bdae104b0949 arm64: cputype: Add Cortex-X1C definitions
    4a500d4bdcec arm64: errata: Expand speculative SSBS workaround
    bf0d247dfbda arm64: errata: Unify speculative SSBS errata logic
    17ff37fe453f arm64: cputype: Add Cortex-X925 definitions
    77741cdc254d arm64: cputype: Add Cortex-A720 definitions
    b8d683f5b538 arm64: cputype: Add Cortex-X3 definitions
    9f7ba0078249 arm64: errata: Add workaround for Arm errata 3194386 and 3312417
    d8029a49c8af arm64: cputype: Add Neoverse-V3 definitions
    c46b7570c9d5 arm64: cputype: Add Cortex-X4 definitions
    55920e407a7e arm64: Add Neoverse-V2 part
    5b9ae6bb3360 arm64: cpufeature: Force HWCAP to be based on the sysreg visible to user-space
    69299a4282a3 ext4: fix wrong unit use in ext4_mb_find_by_goal
    1d21d4175054 sched/cputime: Fix mul_u64_u64_div_u64() precision for cputime
    3b2b169fadd8 SUNRPC: Fix a race to wake a sync task
    a3e52a4c22c8 s390/sclp: Prevent release of buffer in I/O
    1a6b4240b0b9 jbd2: avoid memleak in jbd2_journal_write_metadata_buffer
    e48a901ce65f media: uvcvideo: Fix the bandwdith quirk on USB 3.x
    de305abd36eb media: uvcvideo: Ignore empty TS packets
    c1749313f35b drm/amdgpu/pm: Fix the null pointer dereference in apply_state_adjust_rules
    d81c1eeb333d drm/amdgpu: Fix the null pointer dereference to ras_manager
    1d4e65fa6239 btrfs: fix bitmap leak when loading free space cache on duplicate entry
    29ce18d7672f wifi: nl80211: don't give key data to userspace
    934f815345c0 udf: prevent integer overflow in udf_bitmap_free_blocks()
    65b982b9af54 PCI: Add Edimax Vendor ID to pci_ids.h
    55985e3aa15a selftests/bpf: Fix send_signal test with nested CONFIG_PARAVIRT
    8e665ccc5262 ACPI: SBS: manage alarm sysfs attribute through psy core
    85d8fe79a3ce ACPI: battery: create alarm sysfs attribute atomically
    64ac0c02352b clocksource/drivers/sh_cmt: Address race condition for clock events
    c384dd4f1fb3 md/raid5: avoid BUG_ON() while continue reshape after reassembling
    5ccf99545c71 md: do not delete safemode_timer in mddev_suspend
    464d242868a8 rcutorture: Fix rcu_torture_fwd_cb_cr() data race
    adc491f3e73d net: fec: Stop PPS on driver remove
    865948628a42 l2tp: fix lockdep splat
    b7b8d9f5e679 net: dsa: bcm_sf2: Fix a possible memory leak in bcm_sf2_mdio_register()
    01150020c071 Bluetooth: l2cap: always unlock channel in l2cap_conless_channel()
    085fb116c4ad net: linkwatch: use system_unbound_wq
    e87f52225e04 net: usb: qmi_wwan: fix memory leak for not ip packets
    52319d9d2f52 sctp: Fix null-ptr-deref in reuseport_add_sock().
    17a93a820196 sctp: move hlist_node and hashent out of sctp_ep_common
    ba4e59f34c64 x86/mm: Fix pti_clone_entry_text() for i386
    d00c9b4bbc44 x86/mm: Fix pti_clone_pgtable() alignment assumption
    75880302cf3a irqchip/mbigen: Fix mbigen node address layout
    c476c5c7bb8d genirq: Allow irq_chip registration functions to take a const irq_chip
    12fa9934332d netfilter: ipset: Add list flush to cancel_gc
    e93fa44f0714 mptcp: fix duplicate data handling
    3deac6f6860d r8169: don't increment tx_dropped in case of NETDEV_TX_BUSY
    646e9e907138 net: usb: sr9700: fix uninitialized variable use in sr_mdio_read
    8b0a5709ac6e ALSA: hda/realtek: Add quirk for Acer Aspire E5-574G
    7b745257ff39 ALSA: usb-audio: Correct surround channels in UAC1 channel map
    08775b3d6ed1 protect the fetch of ->fd[fd] in do_dup2() from mispredictions
    e4b2b0306b6b HID: wacom: Modify pen IDs
    b12a67976b12 platform/chrome: cros_ec_proto: Lock device when updating MKBP version
    59be4a167782 riscv/mm: Add handling for VM_FAULT_SIGSEGV in mm_fault_error()
    7d72f5195109 ipv6: fix ndisc_is_useropt() handling for PIO
    8e97cc828d5f net/mlx5e: Add a check for the return value from mlx5_port_set_eth_ptys
    c65f72eec60a net/iucv: fix use after free in iucv_sock_close()
    7c03ab555eb1 sched: act_ct: take care of padding in struct zones_ht_key
    b17eeed7cd09 drm/vmwgfx: Fix overlay when using Screen Targets
    906372e753c5 drm/nouveau: prime: fix refcount underflow
    6b50462b473f remoteproc: imx_rproc: Skip over memory region when node value is NULL
    5991ef8e7a90 remoteproc: imx_rproc: Fix ignoring mapping vdev regions
    a4ed3286a5c6 remoteproc: imx_rproc: ignore mapping vdev regions
    3a2884a44e5c irqchip/imx-irqsteer: Handle runtime power management correctly
    0548b54d0a26 irqchip/imx-irqsteer: Add runtime PM support
    06a93b720351 irqchip/imx-irqsteer: Constify irq_chip struct
    652e7b4d7300 genirq: Allow the PM device to originate from irq domain
    ef56dcdca8f2 devres: Fix memory leakage caused by driver API devm_free_percpu()
    81484ab2858b driver core: Cast to (void *) with __force for __percpu pointer
    6bb9cc6e2594 drivers: soc: xilinx: check return status of get_api_version()
    79ec4cde1d8a soc: xilinx: move PM_INIT_FINALIZE to zynqmp_pm_domains driver
    58b07286aef1 ext4: check the extent status again before inserting delalloc block
    4b6d9a0fe743 ext4: factor out a common helper to query extent map
    b2591c89a6e2 sysctl: always initialize i_uid/i_gid
    88f053a1dd34 fuse: verify {g,u}id mount options correctly
    997d3c9cbed6 fuse: name fs_context consistently
    2fa82af6fd04 powerpc/configs: Update defconfig with now user-visible CONFIG_FSL_IFC
    d28869a145cf fs: don't allow non-init s_user_ns for filesystems without FS_USERNS_MOUNT
    be23ae63080e nvme-pci: add missing condition check for existence of mapped data
    ce90f30157eb nvme: split command copy into a helper
    b59013d264b6 ceph: fix incorrect kmalloc size of pagevec mempool
    eb1b7575fe52 ASoC: Intel: use soc_intel_is_byt_cr() only when IOSF_MBI is reachable
    3ff431695351 lirc: rc_dev_get_from_fd(): fix file leak
    ea72a8881007 powerpc: fix a file leak in kvm_vcpu_ioctl_enable_cap()
    347dcb84a487 apparmor: Fix null pointer deref when receiving skb during sock creation
    9460ac3dd1ae mISDN: Fix a use after free in hfcmulti_tx()
    dda518dea60d bpf: Fix a segment issue when downgrading gso_size
    5cc4d71dda2d net: nexthop: Initialize all fields in dumped nexthops
    dc2a655437c4 net: stmmac: Correct byte order of perfect_match
    aa38bf74899d tipc: Return non-zero value from tipc_udp_addr2str() on error
    cf791b98fe0c netfilter: nft_set_pipapo_avx2: disable softinterrupts
    c8ae5939f40e net: bonding: correctly annotate RCU in bond_should_notify_peers()
    3bf09eab401e ipv4: Fix incorrect source address in Record Route option
    f62a9cc0c2f7 MIPS: SMP-CPS: Fix address for GCR_ACCESS register for CM3 and later
    257193083e8f dma: fix call order in dmam_free_coherent
    641b7a8920f4 libbpf: Fix no-args func prototype BTF dumping syntax
    ff2387553f6a f2fs: fix start segno of large section
    721190921a87 um: time-travel: fix time-travel-start option
    538a27c8048f jfs: Fix array-index-out-of-bounds in diFree
    1c089efe763d kdb: Use the passed prompt in kdb_position_cursor()
    f0ad62559f05 kdb: address -Wformat-security warnings
    65dba3c9ce75 kernel: rerun task_work while freezing in get_signal()
    b839175c06da io_uring/io-wq: limit retrying worker initialisation
    5f0a6800b8ae nilfs2: handle inconsistent state in nilfs_btnode_create_block()
    9fa8eca2598a Bluetooth: btusb: Add Realtek RTL8852BE support ID 0x13d3:0x3591
    4d3eb40ccd1b Bluetooth: btusb: Add RTL8852BE device 0489:e125 to device tables
    1fccae3fd7ae rbd: don't assume RBD_LOCK_STATE_LOCKED for exclusive mappings
    52d8d27fd6d3 rbd: rename RBD_LOCK_STATE_RELEASING and releasing_wait
    76b62f303508 drm/panfrost: Mark simple_ondemand governor as softdep
    77411a2d2252 MIPS: Loongson64: env: Hook up Loongsson-2K
    636163de03cc MIPS: ip30: ip30-console: Add missing include
    4e8f70d3cc5e rbd: don't assume rbd_is_lock_owner() for exclusive mappings
    24933a55bfaf selftests/sigaltstack: Fix ppc64 GCC build
    94ee7ff99b87 RDMA/iwcm: Fix a use-after-free related to destroying CM IDs
    9667d46f8a77 platform: mips: cpu_hwmon: Disable driver on unsupported hardware
    19f108b3d1ca watchdog/perf: properly initialize the turbo mode timestamp and rearm counter
    9cba1ec637f3 rtc: isl1208: Fix return value of nvmem callbacks
    a49321257f62 perf/x86/intel/pt: Fix a topa_entry base address calculation
    3b8e1b7d26d6 perf/x86/intel/pt: Fix topa_entry base length
    a3ab508a4853 scsi: qla2xxx: validate nvme_local_port correctly
    57ba75637122 scsi: qla2xxx: Complete command early within lock
    b0c39dcbd8a5 scsi: qla2xxx: Fix flash read failure
    87db8d7b7520 scsi: qla2xxx: Fix for possible memory corruption
    e5ed6a26ffde scsi: qla2xxx: During vport delete send async logout explicitly
    2fcd485289c8 rtc: cmos: Fix return value of nvmem callbacks
    d4d814159f53 devres: Fix devm_krealloc() wasting memory
    648d5490460d kobject_uevent: Fix OOB access within zap_modalias_env()
    41dd9636414b kbuild: Fix '-S -c' in x86 stack protector scripts
    0730ea850270 decompress_bunzip2: fix rare decompression failure
    bed9580165d5 ubi: eba: properly rollback inside self_check_eba
    ae99754cd86b clk: davinci: da8xx-cfgchip: Initialize clk_init_data before use
    54bc4e88447e f2fs: fix to don't dirty inode for readonly filesystem
    b848b40794ba scsi: qla2xxx: Return ENOBUFS if sg_cnt is more than one for ELS cmds
    a44f88f7576b dev/parport: fix the array out-of-bounds risk
    388ee7a4d330 binder: fix hang of unregistered readers
    ac2459460ce7 PCI: rockchip: Use GPIOD_OUT_LOW flag while requesting ep_gpio
    e5bae95306f7 PCI: hv: Return zero, not garbage, when reading PCI_INTERRUPT_PIN
    af1d27f88ec9 hwrng: amd - Convert PCIBIOS_* return codes to errnos
    43aab4483daa tools/memory-model: Fix bug in lock.cat
    9d289ce917f8 KVM: VMX: Split out the non-virtualization part of vmx_interrupt_blocked()
    cdbcb4e9f69b jbd2: make jbd2_journal_get_max_txn_bufs() internal
    6d5223be13f2 leds: ss4200: Convert PCIBIOS_* return codes to errnos
    35f8c9ac0cd3 wifi: mwifiex: Fix interface type change
    de2a011a13a4 ext4: make sure the first directory block is not a hole
    42d420517072 ext4: check dot and dotdot of dx_root before making dir indexed
    38463947850c m68k: amiga: Turn off Warp1260 interrupts during boot
    2199e157a465 udf: Avoid using corrupted block bitmap buffer
    5c59cb8dd954 task_work: Introduce task_work_cancel() again
    1fd27cc6f0a5 task_work: s/task_work_cancel()/task_work_cancel_func()/
    973155ca67fe apparmor: use kvfree_sensitive to free data->data
    eb46367187a4 sched/fair: Use all little CPUs for CPU-bound workloads
    9ce89824ff04 drm/amd/display: Check for NULL pointer
    748e9ad7c0c2 scsi: qla2xxx: Fix optrom version displayed in FDMI
    6735d02ead7d drm/gma500: fix null pointer dereference in psb_intel_lvds_get_modes
    b6ac46a00188 drm/gma500: fix null pointer dereference in cdv_intel_lvds_get_modes
    86f4ca8b3b6e ext2: Verify bitmap and itable block numbers before using them
    10f7163bfb5f hfs: fix to initialize fields of hfs_inode_info after hfs_alloc_inode()
    4c9d235630d3 media: venus: fix use after free in vdec_close
    e65cccfae729 char: tpm: Fix possible memory leak in tpm_bios_measurements_open()
    cf0c713c6946 sched/fair: set_load_weight() must also call reweight_task() for SCHED_IDLE tasks
    5c5b02d48946 ipv6: take care of scope when choosing the src addr
    83e2dfadcb62 af_packet: Handle outgoing VLAN packets without hardware offloading
    7e36a3c701b4 net: netconsole: Disable target before netpoll cleanup
    9ef719022814 tick/broadcast: Make takeover of broadcast hrtimer reliable
    f2c2c4cc5af7 dt-bindings: thermal: correct thermal zone node name limit
    14083dc69ba6 rtc: interface: Add RTC offset to alarm after fix-up
    84ffa27eb04c nilfs2: avoid undefined behavior in nilfs_cnt32_ge macro
    9d6571b1c4b6 fs/nilfs2: remove some unused macros to tame gcc
    3c6fa67023bc fs/proc/task_mmu: indicate PM_FILE for PMD-mapped file THP
    21a15d52bc22 pinctrl: freescale: mxs: Fix refcount of child
    d2de7746e5e9 pinctrl: ti: ti-iodelay: fix possible memory leak when pinctrl_enable() fails
    73303a4a8fd7 pinctrl: ti: ti-iodelay: Drop if block with always false condition
    15014206f90d pinctrl: single: fix possible memory leak when pinctrl_enable() fails
    8c3bef7ca88a pinctrl: core: fix possible memory leak when pinctrl_enable() fails
    53f2d5bce177 pinctrl: rockchip: update rk3308 iomux routes
    01c0341e9846 net: dsa: b53: Limit chip-wide jumbo frame config to CPU ports
    ef6af2994261 net: dsa: mv88e6xxx: Limit chip-wide frame size config to CPU ports
    eb4ca1a97e08 netfilter: ctnetlink: use helper function to calculate expect ID
    9118c408ee09 bnxt_re: Fix imm_data endianness
    edc2dee07ab4 RDMA/hns: Fix missing pagesize and alignment check in FRMR
    29723ad94817 macintosh/therm_windtunnel: fix module unload.
    445ffbccd05a powerpc/xmon: Fix disassembly CPU feature checks
    38a7e4b8bfea MIPS: Octeron: remove source file executable bit
    3009d371a2ef Input: elan_i2c - do not leave interrupt disabled on suspend failure
    37a484f771ed RDMA/device: Return error earlier if port in not valid
    695d70c60bdb mtd: make mtd_test.c a separate module
    ab2114f6ffc8 ASoC: max98088: Check for clk_prepare_enable() error
    771f129bed4d RDMA/rxe: Don't set BTH_ACK_MASK for UC or UD QPs
    506e71b0e10d RDMA/mlx4: Fix truncated output warning in alias_GUID.c
    6bf3cf61f35a RDMA/mlx4: Fix truncated output warning in mad.c
    26b6512d5d20 Input: qt1050 - handle CHIP_ID reading error
    2be7e24056d7 coresight: Fix ref leak when of_coresight_parse_endpoint() fails
    3d1c4bf57db8 PCI: Fix resource double counting on remove & rescan
    8105318210a4 SUNRPC: Fixup gss_status tracepoint error output
    8f1dc3f33f2a sparc64: Fix incorrect function signature and add prototype for prom_cif_init
    3d096f2a99eb ext4: avoid writing unitialized memory to disk in EA inodes
    91c22df70138 SUNRPC: avoid soft lockup when transmitting UDP to reachable server.
    84edcf61bd41 xprtrdma: Fix rpcrdma_reqs_reset()
    974294806baf xprtrdma: Rename frwr_release_mr()
    cf9141d2f778 mfd: omap-usb-tll: Use struct_size to allocate tll
    72ac78ec1a35 media: venus: flush all buffers in output plane streamoff
    5ed0496e383c ext4: fix infinite loop when replaying fast_commit
    c9106ad5ea2a Revert "leds: led-core: Fix refcount leak in of_led_get()"
    4e87f592a46b drm/qxl: Add check for drm_cvt_mode
    cd105977b1f8 drm/etnaviv: fix DMA direction handling for cached RW buffers
    6ef4f1e98154 perf report: Fix condition in sort__sym_cmp()
    09c1583f0e10 leds: trigger: Unregister sysfs attributes before calling deactivate()
    3c9071a87105 media: renesas: vsp1: Store RPF partition configuration per RPF instance
    3944484005d6 media: renesas: vsp1: Fix _irqsave and _irq mix
    9459f3317562 media: uvcvideo: Override default flags
    115d814d6acd media: uvcvideo: Allow entity-defined get_info and get_cur
    e470e95616bf saa7134: Unchecked i2c_transfer function result fixed
    f3968b3d3cfb media: imon: Fix race getting ictx->lock
    bcc963f591b9 media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()
    7aaa368c684c drm/panel: boe-tv101wum-nl6: Check for errors on the NOP in prepare()
    fb20da833874 drm/panel: boe-tv101wum-nl6: If prepare fails, disable GPIO before regulators
    be9d08ff102d xdp: fix invalid wait context of page_pool_destroy()
    96178b12c881 selftests: forwarding: devlink_lib: Wait for udev events after reloading
    859bc763747c bpf: Eliminate remaining "make W=1" warnings in kernel/bpf/btf.o
    6ce46045f9b9 bna: adjust 'name' buf size of bna_tcb and bna_ccb structures
    28c8fce2078a bpf: annotate BTF show functions with __printf
    1ccb1399bd51 selftests/bpf: Close fd in error path in drop_on_reuseport
    be53b70fc081 wifi: virt_wifi: don't use strlen() in const context
    f851ff5c6e0e gss_krb5: Fix the error handling path for crypto_sync_skcipher_setkey
    05c4488a0e44 wifi: virt_wifi: avoid reporting connection success with wrong SSID
    b33dd4508640 qed: Improve the stack space of filter_config()
    7f132aca1820 perf: Prevent passing zero nr_pages to rb_alloc_aux()
    a2450206c092 perf: Fix perf_aux_size() for greater-than 32-bit size
    a497a6b72b29 perf/x86/intel/pt: Fix pt_topa_entry_for_page() address calculation
    d4f4188ecfe5 netfilter: nf_tables: rise cap on SELinux secmark context
    0d08015beedb ipvs: Avoid unnecessary calls to skb_is_gso_sctp
    2912a0d136ee net: fec: Fix FEC_ECR_EN1588 being cleared on link-down
    29254059a1f8 net: fec: Refactor: #define magic constants
    2e201b3d162c wifi: cfg80211: handle 2x996 RU allocation in cfg80211_calculate_bitrate_he()
    72e470089fc4 wifi: cfg80211: fix typo in cfg80211_calculate_bitrate_he()
    4055275ca3e0 wifi: ath11k: fix wrong handling of CCMP256 and GCMP ciphers
    2aa1739334d0 ath11k: dp: stop rx pktlog before suspend
    dae1ab70406e mlxsw: spectrum_acl: Fix ACL scale regression and firmware errors
    aa98eb074051 mlxsw: spectrum_acl_bloom_filter: Make mlxsw_sp_acl_bf_key_encode() more flexible
    36a9996e020d mlxsw: spectrum_acl_erp: Fix object nesting warning
    22ae17a267f4 lib: objagg: Fix general protection fault
    ada0c319253a selftests/bpf: Check length of recv in test_sockmap
    249adb30cbc7 net/smc: set rmb's SG_MAX_SINGLE_ALLOC limitation only when CONFIG_ARCH_NO_SG_CHAIN is defined
    15c2ec7c284d net/smc: Allow SMC-D 1MB DMB allocations
    8d0d50a8b738 net: esp: cleanup esp_output_tail_tcp() in case of unsupported ESPINTCP
    2f5738bdd6f6 selftests/bpf: Fix prog numbers in test_sockmap
    1302433dc664 wifi: brcmsmac: LCN PHY code is used for BCM4313 2G-only device
    1eb5751e2369 firmware: turris-mox-rwtm: Initialize completion before mailbox
    085dc942897c firmware: turris-mox-rwtm: Fix checking return value of wait_for_completion_timeout()
    6f3cb1fd6b42 ARM: spitz: fix GPIO assignment for backlight
    7b7d06a310e2 ARM: pxa: spitz: use gpio descriptors for audio
    3ae2ec97d8e9 m68k: cmpxchg: Fix return value for default case in __arch_xchg()
    ba1d2ecfcf1b x86/xen: Convert comma to semicolon
    4a49ce2d63d5 m68k: atari: Fix TT bootup freeze / unexpected (SCU) interrupt messages
    e04654f42577 arm64: dts: amlogic: gx: correct hdmi clocks
    4745535fce11 arm64: dts: mediatek: mt7622: fix "emmc" pinctrl mux
    be5ca4064751 arm64: dts: mediatek: mt8183-kukui: Drop bogus output-enable property
    b1e9396ac410 ARM: dts: imx6qdl-kontron-samx6i: fix PCIe reset polarity
    a992c88fbb8c ARM: dts: imx6qdl-kontron-samx6i: fix SPI0 chip selects
    c79a7cad4115 ARM: dts: imx6qdl-kontron-samx6i: fix board reset
    efd89b5db5be ARM: dts: imx6qdl-kontron-samx6i: fix PHY reset
    bbfa9a71ae4a ARM: dts: imx6qdl-kontron-samx6i: move phy reset into phy-node
    31a9a0958b15 arm64: dts: rockchip: Increase VOP clk rate on RK3328
    5cc525351b0c soc: qcom: pdr: fix parsing of domains lists
    eab05737ee22 soc: qcom: pdr: protect locator_addr with the main mutex
    a584e5d3f7d9 arm64: dts: qcom: msm8996: specify UFS core_clk frequencies
    eedd9fd98641 soc: qcom: rpmh-rsc: Ensure irqs aren't disabled by rpmh_rsc_send_data() callers
    39f4cb508ebf arm64: dts: qcom: sdm845: add power-domain to UFS PHY
    d3e6b30c9cf5 hwmon: (max6697) Fix swapped temp{1,8} critical alarms
    15770a147692 hwmon: (max6697) Fix underflow when writing limit attributes
    ae8bd075a921 pwm: stm32: Always do lazy disabling
    d8571b9a83d1 hwmon: (adt7475) Fix default duty on fan is disabled
    685976438b64 x86/platform/iosf_mbi: Convert PCIBIOS_* return codes to errnos
    010441f08347 x86/pci/xen: Fix PCIBIOS_* return code handling
    c995bea85e2e x86/pci/intel_mid_pci: Fix PCIBIOS_* return code handling
    e2fdf7b79f08 x86/of: Return consistent error type from x86_of_pci_irq_enable()
    97795f23a8ab hfsplus: fix to avoid false alarm of circular locking
    c0748b7684a9 platform/chrome: cros_ec_debugfs: fix wrong EC message version
    3070e8160916 EDAC, i10nm: make skx_common.o a separate module
    9bff9479e143 EDAC/skx_common: Add new ADXL components for 2-level memory
    12594a0e7118 sock_map: avoid race between sock_map_close and sk_psock_put
    7a346798c1e1 sock_map: Fix a potential use-after-free in sock_map_close()
    843556a46e16 bpf, sockmap: Don't let sock_map_{close,destroy,unhash} call itself
    4af417c06d37 of: module: add buffer overflow check in of_modalias()
    b29e4b50c556 scripts/gdb: fix SB_* constants parsing
    02fd398f5e2b bpf: Reject variable offset alu on PTR_TO_FLOW_KEYS
    2bba1cb1487b loop: Select I/O scheduler 'none' from inside add_disk()
    027f4dd7c993 blk-mq: Introduce the BLK_MQ_F_NO_SCHED_BY_DEFAULT flag
    2214ded26c86 tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    44494049e815 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    0d7c23009d82 tpm: Add flag to use default cancellation policy
    07914bef4e16 tpm: tis_i2c: Fix sanity check interrupt enable mask
    35f85f04bd69 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    7b04c6c08107 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    4790cb2d1283 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    50f74deaf308 hwmon: Add driver for Texas Instruments TMP464 and TMP468
    a4e6e4b7bb08 dt-bindings: hwmon: add tmp464.yaml
    e0ed2149d7b5 drm/amdkfd: Check for null pointer after calling kmemdup
    c6ddded89322 ARM: renumber bits related to _TIF_WORK_MASK
    35b96a325c1e arm64: make _TIF_WORK_MASK bits contiguous
    f5a8f06aa595 arm64: uaccess: remove vestigal UAO support
    3a330b569301 arm64: uaccess: remove redundant PAN toggling
    9cbbb016d6e7 arm64: uaccess: remove addr_limit_user_check()
    fd83411f5e08 arm64: uaccess: remove set_fs()
    15a6dc2f4b53 arm64: uaccess cleanup macro naming
    912a6ab683a4 arm64: uaccess: split user/kernel routines
    d004ab02dae2 arm64: uaccess: refactor __{get,put}_user
    e1941a8b459e arm64: uaccess: simplify __copy_user_flushcache()
    dfae822b4c59 arm64: uaccess: rename privileged uaccess routines
    1efdb8f0a0c7 arm64: sdei: explicitly simulate PAN/UAO entry
    b35fec69554c arm64: sdei: move uaccess logic to arch/arm64/
    b5a28033fe7b arm64: head.S: always initialize PSTATE
    243eb8553513 arm64: head.S: cleanup SCTLR_ELx initialization
    74a00405d97f arm64: head.S: rename el2_setup -> init_kernel_el
    73c5f386d175 arm64: add C wrappers for SET_PSTATE_*()
    e17fb7543df1 arm64: ensure ERET from kthread is illegal
    eff6289cc53b ixgbevf: add disable link state
    262595681381 ixgbe: add improvement for MDD response functionality
    b9d78b06dea8 ixgbe: add the ability for the PF to disable VF link state
    d829911485da Documentation: arm64: Document PMU counters access from userspace
    fe5d29bfce20 arm64: perf: Enable PMU counter userspace access for perf event
    15ce6d04ed6a arm64: perf: Add userspace counter access disable switch
    4f288acbeed8 perf: Add a counter for number of user access events in context
    354ba4a8c4b8 x86: perf: Move RDPMC event flag to a common definition
    d29cec94c49b libperf xyarray: Add bounds checks to xyarray__entry()
    8264d2b91841 libperf: Add support for user space counter access
    7fd81b678b5f libperf tests: Add support for verbose printing
    6029ff53a48f libperf: Add evsel mmap support
    28b0c8956369 tools include: Add an initial math64.h
    492e532d20f1 perf record: Improve 'Workload failed' message printing events + what was exec'ed
    d0a1fc61733e perf evlist: Add a method to return the list of evsels as a string
    81a77b39be0a perf annotate: Fix sample events lost in stdio mode
    2883e69e202d pnmtologo: use relocatable file name
    80f5207b5abd tools: use basename to identify file in gen-mach-types
    4d201ec392f1 vt/conmakehash: improve reproducibility
    ae24d013888f lib/build_OID_registry: fix reproducibility issues
    5d72da88dbb4 x86/boot: Wrap literal addresses in absolute_pointer()
    dc0bd7aa2319 ACPI: thermal: drop an always true check
    0c4288cceef5 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    5509050b3392 xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    669827c6e293 virtio-pci: Remove wrong address verification in vp_del_vqs()
    1c80d994d3db regulator: consumer: Add missing stubs to regulator/consumer.h
    3303d0e2aeff ipv6: Fix stats accounting in ip6_pkt_drop
    c56e60f665e7 memcg: enable accounting of ipc resources
    e6c8ebd210a2 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    1655ee30e684 sched/isolation: really align nohz_full with rcu_nocbs
    253c752ed120 pstore/ftrace: Add and use ftrace_test_recursion_trylock_safe
    356e8a12bd66 pstore/ftrace: Add recursion protection to the ftrace callback
    334706a1e873 ftrace: Add ftrace_test_recursion_trylock() helper function
    78c260d7f60b ftrace: Move the recursion testing into global headers
    c0b313d988a1 powerpc/mm: Switch obsolete dssall to .long
    1bd813fe8d0e riscv: fix build with binutils 2.38
    835a2d1b24c6 powerpc/lib/sstep: fix 'ptesync' build error
    fd84b99a8ccb drm/amd/display: Don't allow partial copy_from_user
    024f4ff63d55 drm/amdgpu: Fix even more out of bound writes from debugfs
    0c0ad634e899 e1000e: Serialize TGP e1000e PM ops
    add88b0536fa e1000e: Make mei_me active when e1000e is in use
    a8f317c1a17e yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    c8400a2cbe1f iommu/arm-smmu-v3: Ratelimit event dump
    b8ec7e43e95e regmap: teach regmap to use raw spinlocks if requested in the config
    4b7fa7684be7 OF: DT-Overlay configfs interface (v7)
    d515a5c0e9a9 net: xilinx_emaclite: Do not print real IOMEM pointer
    11329e49959b drivers: net: xilinx_emaclite: remove arch limitation
    29dc69bf2a07 drivers: net: xilinx_emaclite: Add COMPILE_TEST support
    ff106eff01f6 drivers: net: xilinx_emaclite: Fix -Wpointer-to-int-cast warnings with W=1
    c27462391070 serial: 8250: 8250_omap: Fix possible array out of bounds access
    16976d8e307f perf intel-pt: Use aux_watermark
    d421a2346946 perf: Cap allocation order at aux_watermark
    6da8d5f29481 timers: Fix get_next_timer_interrupt() with no timers pending
    af141841735a eventfd: Enlarge recursion limit to allow vhost to work
    a125a6102808 iwlwifi: select MAC80211_LEDS conditionally
    139fe7d68413 rcu: Fix stall-warning deadlock due to non-release of rcu_node ->lock
    8d0c79931235 console: Fix build when CONFIG_BLK_DEV_INITRD is disabled.
    ea777841e8ea yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    ab49d2db98bd cgroup1: fix leaked context root causing sporadic NULL deref in LTP
    bdda1b6cf99b aufs5: aufs-core
    2fa276071d07 aufs5: aufs-standalone
    06ed4d532456 aufs5: aufs-mmap
    372857834999 aufs5: aufs-kbuild
    fd68c9840693 aufs5: aufs-base
    a673c127156c Revert "aufs5: core"
    cf62bfcde384 Revert "aufs5: aufs5-base"
    a644419ec785 Revert "aufs5: aufs5-mmap"
    b893f9a999bb Revert "aufs5: aufs5-standalone"
    c60db0819480 Revert "aufs: initial port to v5.10"
    c66a5900f139 Revert "Revert "aufs: initial port to v5.10""
    1320cf58f5dd Revert "aufs: linux-v5.10-rc1, no more set_fs()"
    02349d7738ff Revert "for aufs: linux-v5.10-rc1, no more vfs_(read|write)f_t"
    f01dab74750c Revert "aufs: linux-v5.10-rc1, no more f_op->read() and ->write()"
    3d5de709b676 Revert "aufs5: aufs5-kbuild"
    a97f1329edf7 tracing/arm: Have max stack tracer handle the case of return address after data
    5c54112a05ab net: Treat __napi_schedule_irqoff() as __napi_schedule() on PREEMPT_RT
    ddac76981cb3 sched/isolation: reconcile rcu_nocbs= and nohz_full=
    56fd8c36614e net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    a8808e541750 aufs: linux-v5.10-rc1, no more f_op->read() and ->write()
    cb1c41dac775 for aufs: linux-v5.10-rc1, no more vfs_(read|write)f_t
    a5805df6583f aufs: linux-v5.10-rc1, no more set_fs()
    64e145dcca8c Revert "aufs: initial port to v5.10"
    d6e20b2257ec defconfig: add dependency for CONFIG_ACPI_APEI_PCIEAER
    b237d48208d0 arm64/mm: Drop THP conditionality from FORCE_MAX_ZONEORDER
    1209195ed0f7 driver: adc: ltc2497: return directly after reading the adc conversion value
    a60fe3fcf113 Revert "mfd: syscon: Don't free allocated name for regmap_config"
    13d68767aa4a rcutorture: Use "all" and "N" in "nohz_full" and "rcu_nocbs"
    54e69571a97d rcu: deprecate "all" option to rcu_nocbs=
    a605b9d20447 lib: test_bitmap: add tests for "N" alias
    8c22517f444e lib: bitmap: support "N" as an alias for size of bitmap
    88187167e63a lib: bitmap: move ERANGE check from set_region to check_region
    ca5429633613 lib: bitmap: fold nbits into region struct
    9381134cea8a lib: test_bitmap: add more start-end:offset/len tests
    c825800730ab lib: test_bitmap: add tests to trigger ERANGE case.
    8cc8264dca3f lib: test_bitmap: clearly separate ERANGE from EINVAL tests.
    470da7b7f2ff Revert "cpumask: Un-inline cpulist_parse for SMP; prepare for ascii helpers"
    28dc1d37602d Revert "cpumask: Make "all" alias global and not just RCU"
    dbfe0b183fca Revert "cpumask: Add a "none" alias to complement "all""
    a57711fcff30 Revert "cpumask: Add "last" alias for cpu list specifications"
    34523d7c8476 qemux86: add configuration symbol to select values
    cdca78778415 objtool: Fix seg fault with Clang non-section symbols
    d3287798bd88 x86/entry: Emit a symbol for register restoring thunk
    2ad99ddaac78 cpumask: Add "last" alias for cpu list specifications
    c10e9481810b cpumask: Add a "none" alias to complement "all"
    b00ceed9d388 cpumask: Make "all" alias global and not just RCU
    8b215206e797 cpumask: Un-inline cpulist_parse for SMP; prepare for ascii helpers
    1b5024caeda8 clear_warn_once: add a clear_warn_once= boot parameter
    fc0dd76cce0e clear_warn_once: bind a timer to written reset value
    d64fc2d2b14a clear_warn_once: expand debugfs to include read support
    77592e956cc9 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    6e022759f727 perf: x86-32: explicitly include <errno.h>
    22d6bbb947d4 perf: mips64: Convert __u64 to unsigned long long
    c35f9150001c perf: fix bench numa compilation
    c4caef513eb1 perf: add SLANG_INC for slang.h
    07dfbf9405dd perf: add sgidefs.h to for mips builds
    42c5431ad2cf perf: change --root to --prefix for python install
    af79bfe90143 perf: add 'libperl not found' warning
    ddfbd9e75f08 perf: force include of <stdbool.h>
    0f34e6305176 fat: don't use obsolete random32 call in namei_vfat
    b5b55eaad1df FAT: Added FAT_NO_83NAME
    756b13bfab6e FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    fabad71cb2b5 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    06fd68d75bd1 aufs: initial port to v5.10
    c9126877d1f5 aufs5: core
    f5150173c643 aufs5: aufs5-standalone
    b57d26b072d9 aufs5: aufs5-mmap
    78f128c4b8e5 aufs5: aufs5-base
    47aa35171d08 aufs5: aufs5-kbuild
    35c480a23c66 yaffs: include blkdev.h
    2c64c43540a5 yaffs: fix misplaced variable declaration
    bde410ee9f59 yaffs2: v5.6 build fixups
    414c8e866931 yaffs2: fix memory leak when /proc/yaffs is read
    c99c1990cf7c yaffs: add strict check when call yaffs_internal_read_super
    498f5fafe50a yaffs: repair yaffs_get_mtd_device
    7ca3c08ebbf9 yaffs: Fix build failure by handling inode i_version with proper atomic API
    0ba47e881bb8 yaffs2: fix memory leak in mount/umount
    39a5406665dd yaffs: Avoid setting any ACL releated xattr
    ca5b43ddc6fd Yaffs:check oob size before auto selecting Yaffs1
    c2619c05a53e fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    5e08fb7b8ee0 yaffs2: adjust to proper location of MS_RDONLY
    5f1a1a9678a8 yaffs2: import git revision b4ce1bb (jan, 2020)
    fc21f09ae369 initramfs: allow an optional wrapper script around initramfs generation
    73887fca03be arm64/perf: Fix wrong cast that may cause wrong truncation
    a267cafaac44 defconfigs: drop obselete options
    eb5d1bc00c3f arm64/perf: fix backtrace for AAPCS with FP enabled
    062b2c98c087 linux-yocto: Handle /bin/awk issues
    d3beb253ae71 uvesafb: provide option to specify timeout for task completion
    75ccbf377a51 uvesafb: print error message when task timeout occurs
    18ffa2e88024 compiler.h: Undef before redefining __attribute_const__
    3ed931201746 vmware: include jiffies.h
    938942859596 Resolve jiffies wrapping about arp
    069a883d837c nfs: Allow default io size to be configured.
    3b568edcd3e9 check console device file on fs when booting
    77ec93228920 mount_root: clarify error messages for when no rootfs found
    17a15e0f7536 menuconfig,mconf-cfg: Allow specification of ncurses location
    8f13b1349a74 modpost: mask trivial warnings
    b6c9e0fa24e8 kbuild: exclude meta directory from distclean processing
    62dbbdbec60a powerpc: serialize image targets
    27b8dec5dbb3 arm: serialize build targets
    fc365512e4c4 Revert "platform/x86: wmi: Destroy on cleanup rather than unregister"
    9a6e91d2e691 crtsavres: fixups for 5.4+
    7dbc3cd0398f powerpc/ptrace: Disable array-bounds warning with gcc8
    ebe3bcb89cb0 powerpc: Disable attribute-alias warnings from gcc8
    65ba0e7de081 powerpc: add crtsavres.o to archprepare for kbuild
    6bd3efdce5a9 powerpc: kexec fix for powerpc64
    41671522c159 powerpc: Add unwind information for SPE registers of E500 core
    8851006b0109 mips: vdso: fix 'jalr $t9' crash in vdso code
    ed5db62477e8 mips: Kconfig: add QEMUMIPS64 option
    2a7ca094fc42 4kc cache tlb hazard: tlbp cache coherency
    b742d60d3f70 malta uhci quirks: make allowance for slow 4k(e)c
    8a160fc86eb6 arm/Makefile: Fix systemtap
    b9805882353c vexpress: Pass LOADADDR to Makefile
    332e618aa7ae arm: ARM EABI socketcall
    1ec682cb85f8 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 268b5d1ec1..8a60bebcba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3a31ff0840cedf5e78ef3490e604a9f66f9b1f1f"
+SRCREV_machine ?= "7b4e7ae2a10c124e48fd4cce93fcc93f15750d86"
 SRCREV_meta ?= "a26c1def6dceccb96ab9a707072d22e75888eda9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.223"
+LINUX_VERSION ?= "5.10.226"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index d35ac04135..b1c644db57 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.223"
+LINUX_VERSION ?= "5.10.226"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "fe7f23b30d73333007fe54c96cdb579a31da43bf"
-SRCREV_machine ?= "ca19be2d9d77072cfdde806553e729752b0d9241"
+SRCREV_machine:qemuarm ?= "30ae83f5cb6ff45d30bf47958f1585d3275740b3"
+SRCREV_machine ?= "b61c15e2143de80c4ae22605a8346023383f653a"
 SRCREV_meta ?= "a26c1def6dceccb96ab9a707072d22e75888eda9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index f20804e7fc..e6d8787395 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2524a39d1d5f16980df4f15ef9a7ac2e148795c0"
-SRCREV_machine:qemuarm64 ?= "57e9463c04f9b211dcedd7b92e32cac9b198bccb"
-SRCREV_machine:qemumips ?= "e8d524ff4ca12d884df488db504b35b97f394b78"
-SRCREV_machine:qemuppc ?= "0f0b7bfda26ff5ea9790d648fd82777486b181c7"
-SRCREV_machine:qemuriscv64 ?= "03a85a51f33ae656439b764cd94e795a055e665e"
-SRCREV_machine:qemuriscv32 ?= "03a85a51f33ae656439b764cd94e795a055e665e"
-SRCREV_machine:qemux86 ?= "03a85a51f33ae656439b764cd94e795a055e665e"
-SRCREV_machine:qemux86-64 ?= "03a85a51f33ae656439b764cd94e795a055e665e"
-SRCREV_machine:qemumips64 ?= "6e5d351f2d183cf91d030fc78b4b176338bcb141"
-SRCREV_machine ?= "03a85a51f33ae656439b764cd94e795a055e665e"
+SRCREV_machine:qemuarm ?= "15bb053d77debfc3e5bf7388d6a99c2f766f0450"
+SRCREV_machine:qemuarm64 ?= "24b6c64975625da3c82321fbe888edbf540361f5"
+SRCREV_machine:qemumips ?= "bdd2635646d4b6508287a3037fef5caafe74f1bd"
+SRCREV_machine:qemuppc ?= "cfdef5fc7631d32ff3dd05852f15c0c544273b47"
+SRCREV_machine:qemuriscv64 ?= "ab15dae067f713bc506e8e8ad435e5e9f98263fd"
+SRCREV_machine:qemuriscv32 ?= "ab15dae067f713bc506e8e8ad435e5e9f98263fd"
+SRCREV_machine:qemux86 ?= "ab15dae067f713bc506e8e8ad435e5e9f98263fd"
+SRCREV_machine:qemux86-64 ?= "ab15dae067f713bc506e8e8ad435e5e9f98263fd"
+SRCREV_machine:qemumips64 ?= "d42c39f3a3588754fb0347054f27c818f8873d76"
+SRCREV_machine ?= "ab15dae067f713bc506e8e8ad435e5e9f98263fd"
 SRCREV_meta ?= "a26c1def6dceccb96ab9a707072d22e75888eda9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.223"
+LINUX_VERSION ?= "5.10.226"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


