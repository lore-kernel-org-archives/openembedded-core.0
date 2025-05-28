Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C398BC5AE59
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 18:41:50 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.3070.1748457709243032021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 11:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=chyA6wX1;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4766631a6a4so1084941cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 11:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748457708; x=1749062508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Shprcm5wg0+utsro7p0tCmkVgzdd70pSY/lSYdKJLUg=;
        b=chyA6wX13zRFKdUi82o4ftVlBbJjOSoTIhAmJLWkFWdJs7RdLa1/rm89JI72RXHopN
         /cdcTscpWQYTWvE5A5H+pcJbcRogm72Ua2Cj+YLp8Y/OoPGfbkzIV0M17+JI9m0PIn/P
         tJM75upTzLbejIJsATNE6y6pXOL1DHdIJKefHYab+IfYifHz6IieX0Ga1yIypL+9fBg1
         1VrVNszBKEr8/5CZAZ0GLMaeN9Xv4i5NKZMwsZoUN+Limq/eKI6jGV/1u4ybisvqL/1Q
         Ftj7gTX3RThf1OOMsfPLFAdqgaMukBOVSwd8pXsS6KzHSHSbOBMxloNbMY5uZp/ytfad
         Z/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748457708; x=1749062508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Shprcm5wg0+utsro7p0tCmkVgzdd70pSY/lSYdKJLUg=;
        b=tsDzGVm27YHhE2pmIVZWJINE41pvDcu/F6R2tTzj7bXhD2B2AFRT/j8xlq++MN6un/
         8nQMnB4H2e8sIeVGxqbHqnpFKYhml39w3WgUJ68D0RLhcPxEGG3eoN1xO2qb1vt7ZAgU
         ufqrEfo+u5GyazkVVJALxl/9WZfkKuU3W2ahgmwFWGIMQKCcGjEuDnCpn5VQiCmw2SbL
         mDw3FszHD1vsv/7URvIFW7wbu348A6aDGWNroDkbwYoKufcejiFZB9n5cvhvZuTrpmT8
         YBF5CKH4/jwyQO2nrfeH1s5BYv9jBiI3ihp8ETmK7VOxjEnrgzluaI/9/BXTtIJ2EFRq
         +yZw==
X-Gm-Message-State: AOJu0YxxMn8tnQ24hujSQgStp/RRGuHNrt+m1+nDjuHlQmc/oBI0FQp+
	vbfze0Gqc4osQ5PsHS8n7oaI7hOQmQEj3hiXGnf3pCSaVt+GWwSTzu3RjwrbhzZe
X-Gm-Gg: ASbGncsUIK0fU6U+CiOSjkRwQd+QnCIpNMdS48r5ObTutFAdcsD+kKW7RFlxsN3IgZp
	EQMrqajubJF9em6Z9jWCggbq7IM6RkcR5K/N7JlnY+vaWrR7o7k/8pDBt14WqH7UjY8kG9s43a2
	urFsSDCf12QobG4NJRRaePjqlgD/HQmhoq5P//m9Rv8kzVPDoJ7EvG/zrXwt4YkphmNvI6b5ik5
	5T14ZfxOtxSs5NleLyB0xDT3DWGEDjPXaNZAazAbxk7WfW245kqy6phG3TAxM8/hYtej2Of/nna
	99kNW/rg36pPrTc/G+kvxmvHslq245hbCcnglQvi0ICbI7V8EfFvOoNPKIlStl6AvHu1h4YJ6SR
	30GgCEzz53iNfk4/yplKN5dxrWtyop21RTNy4q7+GvK1KPYml1o+k
X-Google-Smtp-Source: AGHT+IGoJYkUrzR3QAkvvjkg3oI2/trp/K39RmIhAjzrpHu7WSLXkF/P8rE1bYncFow4tCFW31e0ag==
X-Received: by 2002:a05:620a:29c3:b0:7c0:c3ea:6982 with SMTP id af79cd13be357-7ceecbd0f37mr2284169885a.14.1748457697573;
        Wed, 28 May 2025 11:41:37 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfb8212759sm102891785a.25.2025.05.28.11.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 11:41:36 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/5] linux-yocto/5.15: update to v5.15.181
Date: Wed, 28 May 2025 14:41:31 -0400
Message-Id: <20250528184134.1527736-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250528184134.1527736-1-bruce.ashfield@gmail.com>
References: <20250528184134.1527736-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 18:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217388

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    16fdf2c7111b Linux 5.15.181
    26277a425020 PCI: Release resource invalidated by coalescing
    e4af080f3ef6 PCI: Fix dropping valid root bus resources with .end = zero
    ad367516b1c0 PCI: Fix use-after-free in pci_bus_release_domain_nr()
    1f7fb4247d90 nvme: fixup scan failure for non-ANA multipath controllers
    d2e15c2fd913 MIPS: cm: Fix warning if MIPS_CM is disabled
    c82ca029b29f xdp: Reset bpf_redirect_info before running a xdp's BPF prog.
    43c296870740 drm/amd/display: fix double free issue during amdgpu module unload
    bb6b2175b606 net: dsa: mv88e6xxx: enable .port_set_policy() for 6320 family
    527978c76ef2 net: dsa: mv88e6xxx: enable PVT for 6321 switch
    7a10a6b17401 net: dsa: mv88e6xxx: fix atu_move_port_mask for 6341 family
    3ea027203778 crypto: atmel-sha204a - Set hwrng quality to lowest possible
    4e386645bc01 comedi: jr3_pci: Fix synchronous deletion of timer
    a1166e98d80c jfs: define xtree root and page independently
    2ddd4a7a8b0f md/raid1: Add check for missing source disk in process_checks()
    e5e274f64f32 ubsan: Fix panic from test_ubsan_out_of_bounds
    7dd6ab7f467c loop: aio inherit the ioprio of original request
    1d8f9378cb48 scsi: pm80xx: Set phy_attached to zero when device is gone
    47e8efd6c623 scsi: hisi_sas: Fix I/O errors caused by hardware port ID changes
    4b7bdc2efa11 ext4: make block validity check resistent to sb bh corruption
    0773465fbe1b nvmet-fc: put ref when assoc->del_work is already scheduled
    33acc9c2d1e4 nvmet-fc: take tgtport reference only once
    b6a2cd26bcb9 x86/bugs: Don't fill RSB on context switch with eIBRS
    a71d88ae28ef x86/bugs: Don't fill RSB on VMEXIT with eIBRS+retpoline
    56332c566f36 x86/bugs: Use SBPB in write_ibpb() if applicable
    33f046d7c8d3 selftests/mincore: Allow read-ahead pages to reach the end of the file
    3e70fa900584 objtool: Stop UNRET validation on UD2
    d2830ae38358 nvme: re-read ANA log page after ns scan completes
    26671f662eda ACPI PPTT: Fix coding mistakes in a couple of sizeof() calls
    5a8389206cd4 nvme: requeue namespace scan on missed AENs
    bbe7c3b33292 xen: Change xen-acpi-processor dom0 dependency
    605de05255b3 selftests: ublk: fix test_stripe_04
    373512760e13 udmabuf: fix a buf size overflow issue during udmabuf creation
    4da2a94ed523 KVM: s390: Don't use %pK through tracepoints
    20a3cec623fa sched/isolation: Make CONFIG_CPU_ISOLATION depend on CONFIG_SMP
    40845d9146b9 ntb: reduce stack usage in idt_scan_mws
    5fe708c5e3c8 qibfs: fix _another_ leak
    1640c9b81d66 objtool, ASoC: codecs: wcd934x: Remove potential undefined behavior in wcd934x_slim_irq_handler()
    d26a6093d529 usb: gadget: aspeed: Add NULL pointer check in ast_vhub_init_dev()
    3a259d74f57a usb: xhci: Avoid Stop Endpoint retry loop if the endpoint seems Running
    0725a991727d dmaengine: dmatest: Fix dmatest waiting less when interrupted
    e03b10c45c76 sound/virtio: Fix cancel_sync warnings on uninitialized work_structs
    059d35a7393c usb: dwc3: gadget: Avoid using reserved endpoints on Intel Merrifield
    423e146ed630 fs/ntfs3: Fix WARNING in ntfs_extend_initialized_size
    e10e634ee40f usb: host: max3421-hcd: Add missing spi_device_id table
    d9ef9664e44e s390/tty: Fix a potential memory leak bug
    e1e00dc45648 s390/sclp: Add check for get_zeroed_page()
    6992fb10dff2 parisc: PDT: Fix missing prototype warning
    aa36ec5d96c9 clk: check for disabled clock-provider in of_clk_get_hw_from_clkspec()
    1dd4a8561d85 crypto: null - Use spin lock instead of mutex
    10829b24512a MIPS: cm: Detect CM quirks from device tree
    809fce49f0b6 USB: wdm: add annotation
    6261b99ef0ed USB: wdm: wdm_wwan_port_tx_complete mutex in atomic context
    b02a3fef3e8c USB: wdm: close race between wdm_open and wdm_wwan_port_stop
    17dd48b3f6f2 USB: wdm: handle IO errors in wdm_wwan_port_start
    68be90d3d1aa USB: VLI disk crashes if LPM is used
    394ff4699263 usb: quirks: Add delay init quirk for SanDisk 3.2Gen1 Flash Drive
    50d68345d467 usb: quirks: add DELAY_INIT quirk for Silicon Motion Flash Drive
    c0079630f268 usb: dwc3: gadget: check that event count does not exceed event buffer length
    a143ed263d51 USB: OHCI: Add quirk for LS7A OHCI controller (rev 0x02)
    3ec61fa704a4 usb: chipidea: ci_hdrc_imx: implement usb_phy_init() error handling
    24b808d7516f usb: chipidea: ci_hdrc_imx: fix call balance of regulator routines
    8060b719676e usb: chipidea: ci_hdrc_imx: fix usbmisc handling
    b96239582531 usb: cdns3: Fix deadlock when using NCM gadget
    94df04953061 USB: serial: simple: add OWON HDS200 series oscilloscope support
    82e841dc1eaf USB: serial: option: add Sierra Wireless EM9291
    184cdaa3ea5f USB: serial: ftdi_sio: add support for Abacus Electrics Optical Probe
    b59c7fefded5 serial: sifive: lock port in startup()/shutdown() callbacks
    116c7d35b8f7 KVM: x86: Reset IRTE to host control if *new* route isn't postable
    26ccc791de50 mei: me: add panther lake H DID
    843a6fc56e71 USB: storage: quirk for ADATA Portable HDD CH94
    59f993cd36b6 mcb: fix a double free bug in chameleon_parse_gdd()
    95a34125831e KVM: SVM: Allocate IR data using atomic allocation
    aeba2e15c873 drm/amd/display: Fix gpu reset in multidisplay config
    a14b254c35fe net: selftests: initialize TCP header and skb payload with zero
    bef170d651d3 virtio_console: fix missing byte order handling for cols and rows
    c71ab87a2523 iommu/amd: Return an error if vCPU affinity is set for non-vCPU IRTE
    da7936518996 net_sched: hfsc: Fix a potential UAF in hfsc_dequeue() too
    fcc8ede66356 net_sched: hfsc: Fix a UAF vulnerability in class handling
    5fd464fd24de tipc: fix NULL pointer dereference in tipc_mon_reinit_self()
    663c3da86e80 net: phy: leds: fix memory leak
    46a35fe74bae cpufreq: cppc: Fix invalid return value in .get() callback
    8fbaa76690f6 cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
    4e3d1c1925d8 cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
    ad03f3f852df dma/contiguous: avoid warning about unused size_bytes
    c049376c76d1 drm/msm/a6xx: Fix stale rpmh votes from GPU
    cac1786e41b4 drm/msm/a6xx: Avoid gx gbit halt during rpm suspend
    d5572d3d0034 drm/msm/a6xx: Handle GMU prepare-slumber hfi failure
    c8064e9c334f drm/msm/a6xx: Improve gpu recovery sequence
    14c96391dff0 string: Add load_unaligned_zeropad() code path to sized_strscpy()
    039b1d64c8ea kmsan: disable strscpy() optimization under KMSAN
    f124c35b4a36 selftests/mm: generate a temporary mountpoint for cgroup filesystem
    fbf43c9e237c ksmbd: Prevent integer overflow in calculation of deadtime
    3297497ad224 PCI: Fix reference leak in pci_register_host_bridge()
    db273126bf54 PCI: Assign PCI domain IDs by ida_alloc()
    fd168b7d1d7c PCI: Coalesce host bridge contiguous apertures
    786474c9dadf gpio: tegra186: fix resource handling in ACPI probe path
    bc121680d4eb gpio: tegra186: Force one interrupt per bank
    32d554841024 cifs: fix integer overflow in match_server()
    9c9000cb91b9 cifs: avoid NULL pointer dereference in dbg call
    0f552a0a33db cifs: print TIDs as hex
    74c7d67a3c30 backlight: led_bl: Hold led_access lock when calling led_sysfs_disable()
    28d49aeb7760 backlight: led_bl: Convert to platform remove callback returning void
    9d708a3b72b0 iio: adc: ad7768-1: Fix conversion result sign
    fda3b0b782c8 iio: adc: ad7768-1: Move setting of val a bit later to avoid unnecessary return value check
    8ee067cf0cf8 soc: samsung: exynos-chipid: Add NULL pointer check in exynos_chipid_probe()
    c6f24e85919e soc: samsung: exynos-chipid: Pass revision reg offsets
    75dd8356b681 soc: samsung: exynos-chipid: avoid soc_device_to_device()
    f54829389feb net: dsa: mv88e6xxx: fix VTU methods for 6320 family
    36771754d618 auxdisplay: hd44780: Fix an API misuse in hd44780.c
    959b07fb28b0 auxdisplay: hd44780: Convert to platform remove callback returning void
    f1d518c0bad0 media: streamzap: fix race between device disconnection and urb callback
    a5d7d89ac48a media: streamzap: remove unused struct members
    b608bd3b51c0 media: streamzap: less chatter
    6dd4cf3ece54 media: streamzap: no need for usb pid/vid in device name
    fa5fec7f1555 media: streamzap: remove unnecessary ir_raw_event_reset and handle
    ed4ee9639b07 module: sign with sha512 instead of sha1 by default
    74a466a15731 Bluetooth: SCO: Fix UAF on sco_sock_timeout
    e7d3a0c7bf77 f2fs: Add inline to f2fs_build_fault_attr() stub
    c7dc74ab7975 scsi: lpfc: Fix null pointer dereference after failing to issue FLOGI and PLOGI
    984212fa6b4b pmdomain: ti: Add a null pointer check to the omap_prm_domain_init
    6e5b601706ce f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    eac1e7e1705f mm: fix apply_to_existing_page_range()
    0c35d1914353 fs/proc: do_task_stat: use sig->stats_lock to gather the threads/children stats
    7d21587d35bc drm/i915/gt: Cleanup partial engine discovery failures
    d154b333a566 dm cache: fix flushing uninitialized delayed_work on cache_ctr error
    4de2c04c3acd jfs: Fix shift-out-of-bounds in dbDiscardAG
    500f00c80637 MIPS: ds1287: Match ds1287_set_base_clock() function types
    9aad60a2e686 MIPS: cevt-ds1287: Add missing ds1287.h include
    dd0e9415ff0c MIPS: dec: Declare which_prom() as static
    dac465986a4a net: defer final 'struct net' free in netns dismantle
    22018622e1e9 scsi: ufs: bsg: Set bsg_queue to NULL after removal
    6e9ed2f4721e scsi: lpfc: Fix a possible data race in lpfc_unregister_fcf_rescan()
    930268823f6b openvswitch: fix lockup on tx to unregistering netdev with carrier
    5efcb301523b net: openvswitch: fix race on port output
    211168339657 ipvs: properly dereference pe in ip_vs_add_service
    22e9b83f0f33 ext4: fix timer use-after-free on failed mount
    7d215e013d09 blk-iocost: do not WARN if iocg was already offlined
    d20f28f00770 blk-cgroup: support to track if policy is online
    3516f93cc63d bpf: Check rcu_read_lock_trace_held() before calling bpf map helpers
    0d90d9e15414 bpf: avoid holding freeze_mutex during mmap operation
    82e813b12b10 sched/task_stack: fix object_is_on_stack() for KASAN tagged pointers
    bb6570085826 smb: client: fix potential UAF in cifs_stats_proc_show()
    ce49569079a9 smb: client: fix potential deadlock when releasing mids
    878f32878351 smb/server: fix potential null-ptr-deref of lease_ctx_info in smb2_open()
    4a788ebbb10d smb: client: fix NULL ptr deref in crypto_aead_setkey()
    ef51c0d544b1 smb: client: fix UAF in async decryption
    ed3b36f351d9 cifs: Fix UAF in cifs_demultiplex_thread()
    336a066990bb smb: client: fix use-after-free bug in cifs_debug_data_proc_show()
    58de45f4d663 net: make sock_inuse_add() available
    480469f145e5 ksmbd: fix potencial out-of-bounds when buffer offset is invalid
    d798fd98e356 smb: client: fix potential UAF in cifs_dump_full_key()
    d54fdcf171f0 nvmet-fc: Remove unused functions
    6955fd3a6fb9 landlock: Add the errata interface
    3cc1116de109 drm/amdgpu: fix usage slab after free
    fcf9d6a9f30e drm/amd/display: Add null checks for 'stream' and 'plane' before dereferencing
    b19ca8425a4b drm/amd/display: Fix out-of-bounds access in 'dcn21_link_encoder_create'
    e3cd0d8362de drm/amd/display: Stop amdgpu_dm initialize when link nums greater than max_links
    27fda36eedad wifi: ath10k: avoid NULL pointer error during sdio remove
    c1cbf006feee phy: tegra: xusb: Fix return value of tegra_xusb_find_port_node function
    a262c2dc833f powerpc/rtas: Prevent Spectre v1 gadget construction in sys_rtas()
    d1c85e262c16 x86/pvh: Call C code via the kernel virtual mapping
    386617efacab net: mana: Fix error handling in mana_create_txq/rxq's NAPI cleanup
    66a9937187ac bnxt_re: avoid shift undefined behavior in bnxt_qplib_alloc_init_hwq
    7d3914a477ee phonet/pep: fix racy skb_queue_empty() use
    6cc52df69e84 filemap: Fix bounds checking in filemap_read()
    90c8482a5d97 net: fix crash when config small gso_max_size/gso_ipv4_max_size
    77aa9855a878 ipv6: release nexthop on device removal
    f241e4a78f6a misc: pci_endpoint_test: Fix 'irq_type' to convey the correct type
    30f2cd70c4f9 misc: pci_endpoint_test: Fix displaying 'irq_type' after 'request_irq' error
    54c9f299ad7d misc: pci_endpoint_test: Avoid issue of interrupts remaining after request_irq error
    980a236af12f mptcp: sockopt: fix getting IPV6_V6ONLY
    8fbd9487f676 kbuild: Add '-fno-builtin-wcslen'
    5d3779ceaac8 cpufreq: Reference count policy in cpufreq_update_limits()
    93cc7c7f9b83 KVM: arm64: Eagerly switch ZCR_EL{1,2}
    ec3efc04a6ce KVM: arm64: Calculate cptr_el2 traps on activating traps
    52a473ba8330 KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
    08ce0d1ee622 KVM: arm64: Remove host FPSIMD saving for non-protected KVM
    5289ac43b69c KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state
    978c0ccf80ce arm64/fpsimd: Stop using TIF_SVE to manage register saving in KVM
    6b3d37c9c61e arm64/fpsimd: Have KVM explicitly say which FP registers to save
    8be8ba9cf1df arm64/fpsimd: Track the saved FPSIMD state type separately to TIF_SVE
    c4ab60a86c5e KVM: arm64: Discard any SVE state when entering KVM guests
    58ed930115b8 KVM: arm64: Always start with clearing SVE flag on load
    a2231da36777 KVM: arm64: Get rid of host SVE tracking/saving
    2f420df780c5 drm/sti: remove duplicate object names
    ada78110b2d3 drm/nouveau: prime: fix ttm_bo_delayed_delete oops
    4941966558a0 drm/amdgpu/dma_buf: fix page_link check
    80814924260c drm/amd/pm/powerplay/hwmgr/vega20_thermal: Prevent division by zero
    f2904fa2b9da drm/amd/pm/swsmu/smu13/smu_v13_0: Prevent division by zero
    be0fffc4152a drm/amd/pm/powerplay/hwmgr/smu7_thermal: Prevent division by zero
    0c02fcbe4a13 drm/amd/pm/powerplay: Prevent division by zero
    b7c41df49137 drm/amd/pm: Prevent division by zero
    c177517ea65c drm/repaper: fix integer overflows in repeat functions
    3d81ec24e7db perf/x86/intel/uncore: Fix the scale of IIO free running counters on SPR
    93c5be4da097 perf/x86/intel/uncore: Fix the scale of IIO free running counters on ICX
    609ed2fcc9b5 perf/x86/intel/uncore: Fix the scale of IIO free running counters on SNR
    b55b385b3938 perf/x86/intel: Allow to update user space GPRs from PEBS records
    5ee09cdaf341 virtiofs: add filesystem context source name check
    aac80c3e05cb tracing: Fix filter string testing
    e5467a695337 riscv: Avoid fortify warning in syscall_get_arguments()
    7596182dc17f mm/gup: fix wrongly calculated returned value in fault_in_safe_writeable()
    6b563dc85fb3 loop: LOOP_SET_FD: send uevents for partitions
    81565d0986a9 loop: properly send KOBJ_CHANGED uevent for disk device
    63d5a3e207bf isofs: Prevent the use of too small fid
    cd83035b6f2a i2c: cros-ec-tunnel: defer probe if parent EC is not present
    a33c035df01d hfs/hfsplus: fix slab-out-of-bounds in hfs_bnode_read_key
    877ee3ba2f78 crypto: caam/qi - Fix drv_ctx refcount bug
    cdd459a58bb6 btrfs: correctly escape subvol in btrfs_show_options()
    a70832d35559 nfsd: decrease sc_count directly if fail to queue dl_recall
    bf5f65aebeaf nfs: add missing selections of CONFIG_CRC32
    72f7ccad7ed5 nfs: move nfs_fhandle_hash to common include file
    41a125eb52d6 asus-laptop: Fix an uninitialized variable
    442a0ab6a4e9 ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels
    1a19d2306753 ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
    440225ed4fbb Revert "PCI: Avoid reset when disabled via sysfs"
    2b109b99d45f writeback: fix false warning in inode_to_wb()
    9ac9ad08723d cpufreq/sched: Fix the usage of CPUFREQ_NEED_UPDATE_LIMITS
    6bc390b02d4b riscv: KGDB: Remove ".option norvc/.option rvc" for kgdb_compiled_break
    854d0f048ead riscv: KGDB: Do not inline arch_kgdb_breakpoint()
    3c03e585860a riscv: Properly export reserved regions in /proc/iomem
    9ea760991c11 net: dsa: avoid refcount warnings when ds->ops->tag_8021q_vlan_del() fails
    8ccdf5e24b27 net: dsa: mv88e6xxx: avoid unregistering devlink regions which were never registered
    f7b3bddffff2 net: b53: enable BPDU reception for management port
    118d05b53034 cxgb4: fix memory leak in cxgb4_init_ethtool_filters() error path
    a27526e6b48e net: openvswitch: fix nested key length validation in the set() action
    5c1313b93c8c net: mctp: Set SOCK_RCU_FREE
    18924cdfea58 igc: cleanup PTP module if probe fails
    7d2d77e51371 igc: handle the IGC_PTP_ENABLED flag correctly
    5572511776d4 igc: move ktime snapshot into PTM retry loop
    c1f174edaccc igc: fix PTM cycle trigger logic
    6d16d6cb212f Revert "wifi: mac80211: Update skb's control block key in ieee80211_tx_dequeue()"
    24b2cdfc16e9 Bluetooth: l2cap: Check encryption key size on incoming connection
    2d7c60c2a38b Bluetooth: btrtl: Prevent potential NULL dereference
    056f04935bd8 Bluetooth: hci_event: Fix sending MGMT_EV_DEVICE_FOUND for invalid address
    791daf8240ce RDMA/core: Silence oversized kvmalloc() warning
    bb93bd4b9920 RDMA/hns: Fix wrong maximum DMA segment size
    3af43d7282a8 RDMA/usnic: Fix passing zero to PTR_ERR in usnic_ib_pci_probe()
    e2c440b23f21 md/raid10: fix missing discard IO accounting
    f89ab86401c9 scsi: iscsi: Fix missing scsi_host_put() in error path
    2996144be660 wifi: wl1251: fix memory leak in wl1251_tx_work
    305741e7e632 wifi: mac80211: Purge vif txq in ieee80211_do_stop()
    9d00c0a807a3 wifi: mac80211: Update skb's control block key in ieee80211_tx_dequeue()
    3c619aec1f53 wifi: at76c50x: fix use after free access in at76_disconnect
    00999e369e9e scsi: hisi_sas: Enable force phy when SATA disk directly connected
    31676d55028a scsi: libsas: Add struct sas_tmf_task
    42bbb529955c scsi: libsas: Delete lldd_clear_aca callback
    04bbb1b72b55 scsi: hisi_sas: Fix setting of hisi_sas_slot.is_internal
    8b8e6d433bd9 scsi: hisi_sas: Factor out task prep and delivery code
    6587850b8827 scsi: hisi_sas: Pass abort structure for internal abort
    9ebfa3eb9d52 scsi: hisi_sas: Start delivery hisi_sas_task_exec() directly
    9e5a0f577716 Bluetooth: hci_uart: Fix another race during initialization
    e8ea4dd6659f x86/e820: Fix handling of subpage regions when calculating nosave ranges in e820__register_nosave_regions()
    fb627b8fe4d7 ACPI: platform-profile: Fix CFI violation when accessing sysfs files
    46e22de65eb4 arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists
    72972552d0d0 HSI: ssi_protocol: Fix use after free vulnerability in ssi_protocol Driver Due to Race Condition
    9242391c20b1 pinctrl: qcom: Clear latched interrupt status when changing IRQ type
    40c4c64507fe PCI: Fix reference leak in pci_alloc_child_bus()
    8730a3c6f0f1 PCI: brcmstb: Fix missing of_node_put() in brcm_pcie_probe()
    fa4d10970ea3 of/irq: Fix device node refcount leakages in of_irq_init()
    90d3d651b985 of/irq: Fix device node refcount leakage in API irq_of_parse_and_map()
    52f0888eff56 of/irq: Fix device node refcount leakages in of_irq_count()
    bd8f17219533 ntb: use 64-bit arithmetic for the MSI doorbell mask
    94c1cf839b7a gpio: zynq: Fix wakeup source leaks on device unbind
    dd38803c9088 ftrace: Add cond_resched() to ftrace_graph_set_hash()
    422dd984f7ef dm-integrity: set ti->error on memory allocation failure
    9c5eedb065fa crypto: ccp - Fix check for the primary ASP device
    2e794415ff7f thermal/drivers/rockchip: Add missing rk3328 mapping entry
    0f7df4899299 sctp: detect and prevent references to a freed transport in sendmsg
    20035e675ca0 mm/hwpoison: do not send SIGBUS to processes with recovered clean pages
    f3509cecd0fd mm: add missing release barrier on PGDAT_RECLAIM_LOCKED unlock
    7de3726a3afd sparc/mm: disable preemption in lazy mmu mode
    66a10239be04 arm64: dts: mediatek: mt8173: Fix disp-pwm compatible string
    2dd21fc16490 mtd: rawnand: Add status chack in r852_ready()
    e7d6ceff95c5 mtd: inftlcore: Add error check for inftl_read_oob()
    cef678a27711 mptcp: only inc MPJoinAckHMacFailure for HMAC failures
    b3088bd2a679 mptcp: fix NULL pointer in can_accept_new_subflow
    9ce88838fcea lib: scatterlist: fix sg_split_phys to preserve original scatterlist offsets
    031b53078e88 locking/lockdep: Decrease nr_unused_locks if lock unused in zap_class()
    90ee23c2514a mfd: ene-kb3930: Fix a potential NULL pointer dereference
    ad926f735b4d jbd2: remove wrong sb->s_sequence check
    3ba402610843 i3c: Add NULL pointer check in i3c_master_queue_ibi()
    c658e1302ee3 i3c: master: svc: Use readsb helper for reading MDB
    5d74f8a5fb3c vdpa/mlx5: Fix oversized null mkey longer than 32bit
    2883e9e74f73 ext4: fix off-by-one error in do_split
    899d0353ea69 bus: mhi: host: Fix race between unprepare and queue_buf
    65cc93278f69 ASoC: qdsp6: q6asm-dai: fix q6asm_dai_compr_set_params error path
    9ae11b06c557 wifi: mac80211: fix integer overflow in hwmp_route_info_get()
    977fb8126e5c wifi: mt76: Add check for devm_kstrdup()
    8f80ade0f6ea clocksource/drivers/stm32-lptimer: Use wakeup capable instead of init wakeup
    c1e3583fb61f mtd: Replace kcalloc() with devm_kcalloc()
    ef922b40bb6d net: dsa: mv88e6xxx: workaround RGMII transmit delay erratum for 6320 family
    8f8ed592d8a1 mtd: Add check for devm_kcalloc()
    f195e94c7af9 media: venus: hfi_parser: refactor hfi packet parsing logic
    1ad6aa1464b8 media: venus: hfi_parser: add check to avoid out of bound access
    08ac0e22e456 media: i2c: ov7251: Introduce 1 ms delay between regulators and en GPIO
    e8396890db79 media: i2c: ov7251: Set enable GPIO low in probe
    7c3118db4998 media: i2c: ccs: Set the device's runtime PM status correctly in probe
    5a6b5aa8ebc1 media: i2c: ccs: Set the device's runtime PM status correctly in remove
    457a61c59856 media: v4l2-dv-timings: prevent possible overflow in v4l2_detect_gtf()
    432f748824b6 media: streamzap: prevent processing IR data on URB failure
    fbcb584efa5c mtd: rawnand: brcmnand: fix PM resume warning
    b88004318aeb spi: cadence-qspi: Fix probe on AM62A LP SK
    0b08172a635d arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre BHB safe list
    8cb58a817a45 arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB
    1a646a6206e0 arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
    f6ea5a8a5344 arm64: cputype: Add MIDR_CORTEX_A76AE
    09a128539129 xenfs/xensyms: respect hypervisor's "next" indication
    b98fbad6abda media: siano: Fix error handling in smsdvb_module_init()
    680cc5303f7c media: vim2m: print device name after registering device
    32af5c1fdb9b media: venus: hfi: add check to handle incorrect queue size
    1b8fb257234e media: venus: hfi: add a check to handle OOB in sfr region
    83724b88175c media: i2c: adv748x: Fix test pattern selection mask
    84f2ca8d5f2d ext4: don't treat fhandle lookup of ea_inode as FS corruption
    8273ae803009 bpf: support SKF_NET_OFF and SKF_LL_OFF on skb frags
    831062d76d37 bpf: Add endian modifiers to fix endian warnings
    ed6ff2d48873 pwm: fsl-ftm: Handle clk_get_rate() returning 0
    1f45022f219b pwm: rcar: Improve register calculation
    dc12f37acbc3 pwm: rcar: Simplify multiplication/shift logic
    e3cf0c38d3ce pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()
    7fa3d93d4d29 ktest: Fix Test Failures Due to Missing LOG_FILE Directories
    09dbf22fd68c fbdev: omapfb: Add 'plane' value check
    c250262d6485 PCI: vmd: Make vmd_dev::cfg_lock a raw_spinlock_t type
    1690b4949247 drm/mediatek: mtk_dpi: Explicitly manage TVD clock in power on/off
    25c299517d58 drm/amdkfd: Fix pqm_destroy_queue race with GPU reset
    62b3040a1a29 drm/amdkfd: clamp queue size to minimum
    0236f723b445 drivers: base: devres: Allow to release group on device release
    e2dacf842095 drm/bridge: panel: forbid initializing a panel with unknown connector type
    e33d1037fd89 drm: panel-orientation-quirks: Add new quirk for GPD Win 2
    b60523a75c2b drm: panel-orientation-quirks: Add support for AYANEO 2S
    cc301b9d48ab drm/amd/display: Update Cursor request mode to the beginning prefetch always
    0a5ba5e28b7b drm: allow encoder mode_set even when connectors change for crtc
    d71a57a34ab6 Bluetooth: hci_uart: fix race during initialization
    effeecfe60fc tracing: fix return value in __ftrace_event_enable_disable for TRACE_REG_UNREGISTER
    523fa0979d84 net: vlan: don't propagate flags on open
    5a194041bffd wifi: mt76: mt76x2u: add TP-Link TL-WDN6200 ID to device table
    c6015d0f7a22 scsi: st: Fix array overflow in st_setup()
    f737418b6de3 ext4: ignore xattrs past end
    1648029cd302 ext4: protect ext4_release_dquot against freezing
    fd4c73a2669c ahci: add PCI ID for Marvell 88SE9215 SATA Controller
    67e16ccba74d f2fs: fix to avoid out-of-bounds access in f2fs_truncate_inode_blocks()
    714036b176ba ata: libata-eh: Do not use ATAPI DMA for a device limited to PIO mode
    a741f29ac8b6 jfs: add sanity check for agwidth in dbMount
    86bfeaa18f9e jfs: Prevent copying of nlink with value 0 from disk inode
    3d8a45f87010 fs/jfs: Prevent integer overflow in AG size calculation
    761e36cf8c86 fs/jfs: cast inactags to s64 to prevent potential overflow
    4f10732712fc jfs: Fix uninit-value access of imap allocated in the diMount() function
    91522aba56e9 page_pool: avoid infinite loop to schedule delayed worker
    691d45955eda ALSA: usb-audio: Fix CME quirk for UF series keyboards
    c30b45c78e1a ASoC: fsl_audmix: register card device depends on 'dais' property
    81b19dc8ad80 ALSA: hda: intel: Fix Optimus when GPU has no sound
    6b4449e4f033 HID: pidff: Fix null pointer dereference in pidff_find_fields
    4c5f8e594657 HID: pidff: Do not send effect envelope if it's empty
    b5d9c541ad33 HID: pidff: Convert infinite length from Linux API to PID standard
    01e1c8a26ea3 xen/mcelog: Add __nonstring annotations for unterminated strings
    595a9e7b8cda arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
    016cc0079e74 perf: arm_pmu: Don't disable counter in armpmu_add()
    4162ed24d454 x86/cpu: Don't clear X86_FEATURE_LAHF_LM flag in init_amd_k8() on AMD when running in a virtual machine
    0e297a02e03d pm: cpupower: bench: Prevent NULL dereference on malloc failure
    c2077a80caf2 umount: Allow superblock owners to force umount
    d504882159a2 nft_set_pipapo: fix incorrect avx2 match of 5th field octet
    99aa698dec34 net: ppp: Add bound checking for skb data on ppp_sync_txmung
    e342ea4ce54f nvmet-fcloop: swap list_add_tail arguments
    bea745327f00 ata: sata_sx4: Add error handling in pdc20621_i2c_read()
    3c1c0a8c1a07 ata: sata_sx4: Drop pointless VPRINTK() calls and convert the remaining ones
    81a5174e64ce net: ethtool: Don't call .cleanup_data when prepare_data fails
    ac91c6125468 net: tls: explicitly disallow disconnect
    ed06675d3b8c tipc: fix memory leak in tipc_link_xmit
    d0d720f92828 ata: pata_pxa: Fix potential NULL pointer dereference in pxa_ata_probe()
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
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 080f6301d8..72fc373076 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8a13160b91cb6ee1c352beff6b1499f78c2e3b8c"
-SRCREV_meta ?= "4247019012f1e9a1650dcc3b84589883bedb78c0"
+SRCREV_machine ?= "197338cf0c529a8339a1581adbc41c2ec39933ee"
+SRCREV_meta ?= "8e07fa90bc6101cd74644750736b6f11757a86de"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.180"
+LINUX_VERSION ?= "5.15.181"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 21fe72dfa4..87cc829fb1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.180"
+LINUX_VERSION ?= "5.15.181"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ace85b13a79e7a9dbff02fbfae8a7d8d63e98187"
-SRCREV_meta ?= "4247019012f1e9a1650dcc3b84589883bedb78c0"
+SRCREV_machine ?= "9a5f94119c1261a8b3c4a2dc4b0e022aa31f19d6"
+SRCREV_meta ?= "8e07fa90bc6101cd74644750736b6f11757a86de"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 3a63cf2032..3516cac0e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0b93ca5c0930b1bae3100474d7312b6a951a376d"
-SRCREV_machine:qemuarm64 ?= "6a5c9cec0971ea6810091088c7d3e5c18e9cdcd1"
-SRCREV_machine:qemumips ?= "dead39d95cf00bc4351c2c86e0cfcf9fcaa2a899"
-SRCREV_machine:qemuppc ?= "e0ae237653f6de4c2cbadcab798e2976560615d2"
-SRCREV_machine:qemuriscv64 ?= "d3877a02f0b7b367143d561c558078889228ae29"
-SRCREV_machine:qemuriscv32 ?= "d3877a02f0b7b367143d561c558078889228ae29"
-SRCREV_machine:qemux86 ?= "d3877a02f0b7b367143d561c558078889228ae29"
-SRCREV_machine:qemux86-64 ?= "d3877a02f0b7b367143d561c558078889228ae29"
-SRCREV_machine:qemumips64 ?= "ea852bd2185a4565473cc390fbff3df8aba9e163"
-SRCREV_machine ?= "d3877a02f0b7b367143d561c558078889228ae29"
-SRCREV_meta ?= "4247019012f1e9a1650dcc3b84589883bedb78c0"
+SRCREV_machine:qemuarm ?= "bff9ba7e5b7913bb615db6628bd4d1d6069999b4"
+SRCREV_machine:qemuarm64 ?= "b5bd9477269e51548f417cb0e8a6d22b00e6786b"
+SRCREV_machine:qemumips ?= "cac20a82ab762a5136a17850e9b321cefdf8ec79"
+SRCREV_machine:qemuppc ?= "6fe3f5ceaff581ffde7e58ee6c1fb8ba0baa8aa4"
+SRCREV_machine:qemuriscv64 ?= "7145abd8c342695f3fd6b99bcd364e11e2304217"
+SRCREV_machine:qemuriscv32 ?= "7145abd8c342695f3fd6b99bcd364e11e2304217"
+SRCREV_machine:qemux86 ?= "7145abd8c342695f3fd6b99bcd364e11e2304217"
+SRCREV_machine:qemux86-64 ?= "7145abd8c342695f3fd6b99bcd364e11e2304217"
+SRCREV_machine:qemumips64 ?= "3091890c569f6b2cd55bb61a62c23a1dc91e2719"
+SRCREV_machine ?= "7145abd8c342695f3fd6b99bcd364e11e2304217"
+SRCREV_meta ?= "8e07fa90bc6101cd74644750736b6f11757a86de"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f7347f4005727f3155551c0550f4deb9c40b56c2"
+SRCREV_machine:class-devupstream ?= "16fdf2c7111bd6927f16c3e811f5086fecebbf00"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.180"
+LINUX_VERSION ?= "5.15.181"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


