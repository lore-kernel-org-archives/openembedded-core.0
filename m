Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD0EC02185
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:47:28 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.28737.1736801244622453092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NV5keQeJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21675fd60feso107365435ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736801244; x=1737406044; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiR0VzCKAj9NNOXMpq7dApYNwQcMyAoCHJYVKcVnoTA=;
        b=NV5keQeJ2KPeQogUTa/4eVrPZ4PIz6wnnldsVg8Z+9YUqdGDDoTR6Ic5+caXXGx6Sw
         R18N0bwN2TAKqpJY+DJNHMPCTO49au+ffGoK2gdoL0uCVOcQYFUebCZDTLg6Ci/NlFj0
         0jX4lY4gwob/asTy79LhKj/gluiP3NxKgOWP7uCK3+9SmXuIykg4y9G6zkg1RZksoF8Z
         FfhIZvv8/htTZ5pWj/dH3Y0o4lWcIHYZvwoCutBD1cHUju2Qk8A4Vruc+O8QzIG7UL7f
         InXgHQ6G28wv9VN0soELpvyy4nuMlW0ewbanoNgghtGH6OAHWM2pamMYBo1YqH26v47N
         gj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801244; x=1737406044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xiR0VzCKAj9NNOXMpq7dApYNwQcMyAoCHJYVKcVnoTA=;
        b=Kibf9PiUlpZhm7BGKy4JpTiSnsr/tmH5LSZUO3TlYfg/ny+f//rcsA3HET+lv9bBJ8
         pI3yETAFYGl3mSw5xiyV/p+mBb8vBDTvEuA23m5pgUe3U/wIcu/JZ07R4Tsxivo47xle
         dLQq5qIbnwn4cPK6s/XW84iqbMEZuFN8c7YleDMZHKeYkH8VbRC0w4riju1jfvITfeEn
         Cbd90Zz9cwuCCgQJGcQXbckOANFlLlbFvjbFyThdFqaubdeHP1K0yo6qpFt6xR7xLtuh
         d6ICkyGKAgyPdJ8epn9Mg7K9cxeJEWrgy7mgL034qumhXzsWXpriP4VO1LD7mi76hSfm
         L93Q==
X-Gm-Message-State: AOJu0YxTRkfCXANt+lBwh+D4b6oQei81+9ciO6MitTCIjx3DewO58hBK
	tKfuIn5IwovH5GM3Z2BHzNXOnnsesn18UIKFeshleCInQI/LZQ3agrSmt5nrCshmpfsB+YyWBn/
	hy0c=
X-Gm-Gg: ASbGncsHcEU7VX/oiK+YPDkSLHDoij6pM15WFh9BrRS3mKVxtQ/50irPelUiCD/Lk4z
	wdp+nWFTUA9otdzKSi1Ucd8oza5OJdW7z0bHCG9wYKp9LZOz7iKOPAb5IkGL2lwRlqTcUqSaHLT
	hugl7vUF1DQOmeVybB2ma+rVI2MQocfyuz0As29TX9yYVYhVwOBUQ49T4FG5DNJruTfFyL7MuiB
	DSGvtGVTtUUW/yVLRw2KISbAHHaUuzoi4CAwMzGv/Xajw==
X-Google-Smtp-Source: AGHT+IFirJyTEVCdbln4JdhHPkOAMDu6P4job/VtkhEY4ZJ9612Wb2KYGK54C12T8jiP8Vl+w0Ngsg==
X-Received: by 2002:a05:6a20:43ab:b0:1e1:b1e4:e750 with SMTP id adf61e73a8af0-1e88d1c2651mr35253638637.18.1736801243459;
        Mon, 13 Jan 2025 12:47:23 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm6449435b3a.12.2025.01.13.12.47.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:47:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/15] linux-yocto/6.6: update to v6.6.59
Date: Mon, 13 Jan 2025 12:46:57 -0800
Message-ID: <56fa329e447215d34fc6fe5770017d9f38a87fbb.1736801113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736801113.git.steve@sakoman.com>
References: <cover.1736801113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:47:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209749

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    bf3af7e92bda Linux 6.6.59
    7d9868180bd1 xfrm: validate new SA's prefixlen using SA family when sel.family is unset
    7a26cb660775 task_work: make TWA_NMI_CURRENT handling conditional on IRQ_WORK
    81507f633e79 tracing: probes: Fix to zero initialize a local variable
    042804a9fff1 RDMA/bnxt_re: Fix unconditional fence for newer adapters
    67819f10702b RDMA/bnxt_re: Avoid creating fence MR for newer adapters
    1aee34ed99e9 RDMA/bnxt_re: Fix the offset for GenP7 adapters for user applications
    38ca6fd426ea ACPI: PRM: Clean up guid type in struct prm_handler_info
    d1e55eeee056 platform/x86: dell-wmi: Ignore suspend notifications
    73cc3f905ca9 ASoC: qcom: Fix NULL Dereference in asoc_qcom_lpass_cpu_platform_probe()
    24f638125cc3 ata: libata: Set DID_TIME_OUT for commands that actually timed out
    ce4a70d9b916 net: phy: dp83822: Fix reset pin definitions
    4512c448f54c selinux: improve error checking in sel_write_load()
    c79e0a18e4b3 drm/amd/display: Disable PSR-SU on Parade 08-01 TCON too
    62c85b9a0dd7 hv_netvsc: Fix VF namespace also in synthetic NIC NETDEV_REGISTER event
    c73bca72b84b xfrm: fix one more kernel-infoleak in algo dumping
    36bd0f386b7c LoongArch: Make KASAN usable for variable cpu_vabits
    8915ed160dbd LoongArch: Enable IRQ if do_ale() triggered in irq-enabled context
    cd2cef731170 LoongArch: Get correct cores_per_package for SMT systems
    5d10f6fb2cb7 ALSA: hda/realtek: Add subwoofer quirk for Acer Predator G9-593
    0d674f2e73b4 ALSA: hda/tas2781: select CRC32 instead of CRC32_SARWATE
    60a5ba560f29 x86/lam: Disable ADDRESS_MASKING in most cases
    599eee0e9817 KVM: arm64: Don't eagerly teardown the vgic on init error
    04ed2ba07ce7 KVM: arm64: Fix shift-out-of-bounds bug
    2c4adc9b192a KVM: nSVM: Ignore nCR3[4:0] when loading PDPTEs from memory
    f421a3b18aa7 openat2: explicitly return -E2BIG for (usize > PAGE_SIZE)
    743c78d455e7 nilfs2: fix kernel bug due to missing clearing of buffer delay flag
    a299d415dd37 ACPI: button: Add DMI quirk for Samsung Galaxy Book2 to fix initial lid detection issue
    795b080d9aa1 ACPI: PRM: Find EFI_MEMORY_RUNTIME block for PRM handler and context
    bdaab141edb6 ACPI: resource: Add LG 16T90SP to irq1_level_low_skip_override[]
    975ede2a7bec drm/amd: Guard against bad data for ATIF ACPI method
    004ad1a2d684 btrfs: zoned: fix zone unusable accounting for freed reserved extent
    3521754614cf btrfs: fix passing 0 to ERR_PTR in btrfs_search_dir_index_item()
    2f2684c7903e cpufreq: CPPC: fix perf_to_khz/khz_to_perf conversion exception
    33e89c16cea0 cpufreq/cppc: Move and rename cppc_cpufreq_{perf_to_khz|khz_to_perf}()
    35dbac8c328d smb: client: Handle kstrdup failures for passwords
    66921a4d8e84 ALSA: hda/realtek: Update default depop procedure
    f965dc0f099a nfsd: cancel nfsd_shrinker_work using sync mode in nfs4_state_shutdown_net
    5f0468f30c8f powercap: dtpm_devfreq: Fix error check against dev_pm_qos_add_request()
    4bdc21506f12 ALSA: firewire-lib: Avoid division by zero in apply_constraint_to_size()
    8b339beb7cfe ASoC: fsl_micfil: Add a flag to distinguish with different volume control types
    f9ba85f823e7 ASoC: rsnd: Fix probe failure on HiHope boards due to endpoint parsing
    83a420e965f6 ASoC: max98388: Fix missing increment of variable slot_found
    6e4aed4acc1a ASoC: loongson: Fix component check failed on FDT systems
    f10cba3f761b ASoC: dt-bindings: davinci-mcasp: Fix interrupt properties
    5e3583b4c000 ASoC: dt-bindings: davinci-mcasp: Fix interrupts property
    773dc610ca64 net: dsa: mv88e6xxx: support 4000ps cycle counter period
    06b1c8091542 net: dsa: mv88e6xxx: read cycle counter period from hardware
    4dc655d86b54 net: dsa: mv88e6xxx: group cycle counter coefficients
    21db2f35fa97 bpf,perf: Fix perf_event_detach_bpf_prog error handling
    14bcb721d241 Bluetooth: ISO: Fix UAF on iso_sock_timeout
    d30803f6a972 Bluetooth: SCO: Fix UAF on sco_sock_timeout
    1ba33b327c3f posix-clock: posix-clock: Fix unbalanced locking in pc_clock_settime()
    7d6d46b42980 r8169: avoid unsolicited interrupts
    5d282467245f net: sched: use RCU read-side critical section in taprio_dump()
    0d4c0d2844e4 net: sched: fix use-after-free in taprio_change()
    a5cf8670acbb net/sched: act_api: deny mismatched skip_sw/skip_hw flags for actions created by classifiers
    d123062a3fdc bpf: Remove MEM_UNINIT from skb/xdp MTU helpers
    48068ccaea95 bpf: Fix overloading of MEM_UNINIT's meaning
    8a33a047bd31 bpf: Add MEM_WRITE attribute
    d1100acab464 bpf: Simplify checking size of helper accesses
    7caee37c466a net: usb: usbnet: fix name regression
    a7bdb199784f net: fix races in netdev_tx_sent_queue()/dev_watchdog()
    10cb940429c2 net/sched: adjust device watchdog timer to detect stopped queue at right time
    69076f8435c1 net: wwan: fix global oob in wwan_rtnl_policy
    433742ba96ba netfilter: xtables: fix typo causing some targets not to load on IPv6
    5ed4334fc951 fsl/fman: Fix refcount handling of fman-related devices
    275bebf5be50 fsl/fman: Save device references taken in mac_probe()
    06b526846cc9 net: dsa: mv88e6xxx: Fix error when setting port policy on mv88e6393x
    c2d2dc4f88bb octeon_ep: Add SKB allocation failures handling in __octep_oq_process_rx()
    e71146ff378c octeon_ep: Implement helper for iterating packets in Rx queue
    64854b218703 net: plip: fix break; causing plip to never transmit
    641c1beed52b be2net: fix potential memory leak in be_xmit()
    6dc937a3086e net/sun3_82586: fix potential memory leak in sun3_82586_send_packet()
    f41bd93b3e05 netfilter: bpf: must hold reference on net namespace
    c1530660410c xfrm: respect ip protocols rules criteria when performing dst lookups
    ac1d820eaa30 xfrm: extract dst lookup parameters into a struct
    a14a075a14af tracing: Consider the NULL character when validating the event length
    6bc24db74fe4 tracing/probes: Fix MAX_TRACE_ARGS limit handling
    f475d8a0cca7 jfs: Fix sanity check in dbMount
    a94c197d4d74 LoongArch: Don't crash in stack_top() for tasks without vDSO
    3d75f500f64d platform/x86: dell-sysman: add support for alienware products
    6d52db315cfc cifs: Validate content of NFS reparse point buffer
    f47a40ee4cdb ASoC: qcom: sm8250: add qrb4210-rb2-sndcard compatible string
    1ac49babc952 udf: fix uninit-value use in udf_get_fileshortad
    493447dd8336 udf: refactor inode_bmap() to handle error
    5fc8da4d326d udf: refactor udf_next_aext() to handle error
    402c8862fe54 udf: refactor udf_current_aext() to handle error
    8c213cc21724 arm64: Force position-independent veneers
    85e70dcd1f85 ASoC: fsl_sai: Enable 'FIFO continue on error' FCONT bit
    935e5c5f93df ASoC: codecs: lpass-rx-macro: add missing CDC_RX_BCL_VBAT_RF_PROC2 to default regs values
    b3d4f2329312 ASoC: amd: yc: Add quirk for HP Dragonfly pro one
    9eb32bd23bbc drm/vboxvideo: Replace fake VLA at end of vbva_mouse_pointer_shape with real VLA
    0d16f53c9111 exec: don't WARN for racy path_noexec check
    9e5f93788c9d uprobe: avoid out-of-bounds memory access of fetching args
    f0a7ea54f3dc uprobes: prevent mutex_lock() under rcu_read_lock()
    f5272c98a4a0 uprobes: prepare uprobe args buffer lazily
    1c7fa34863c7 uprobes: encapsulate preparation of uprobe args buffer
    91f62703146a tracing/probes: Support $argN in return probe (kprobe and fprobe)
    e96b42d22f66 tracing/probes: cleanup: Set trace_probe::nr_args at trace_probe_init
    5868fa7ebe66 tracing/fprobe-event: cleanup: Fix a wrong comment in fprobe event
    4fad73700867 usb: dwc3: core: Fix system suspend on TI AM62 platforms
    66e56efc45cb XHCI: Separate PORT and CAPs macros into dedicated file
    ecc8a9502b3c usb: gadget: f_uac2: fix return value for UAC2_ATTRIBUTE_STRING store
    0a2794e244d8 usb: gadget: f_uac2: fix non-newline-terminated function name
    3af6c7285413 usb: gadget: f_uac2: Replace snprintf() with the safer scnprintf() variant
    c691c2adeb75 xhci: dbc: honor usb transfer size boundaries.
    7cbcb40d4699 xhci: dbgtty: use kfifo from tty_port struct
    32bd1720ede6 xhci: dbgtty: remove kfifo_out() wrapper
    fe19d913d2c8 iio: adc: ti-lmp92064: add missing select IIO_(TRIGGERED_)BUFFER in Kconfig
    5f029be65dca mm: khugepaged: fix the arguments order in khugepaged_collapse_file trace point
    36249a0b212e khugepaged: remove hpage from collapse_file()
    03e36dba005e khugepaged: convert alloc_charge_hpage to alloc_charge_folio
    281a0312ce41 khugepaged: inline hpage_collapse_alloc_folio()
    c556c5580646 mm/khugepaged: use a folio more in collapse_file()
    4ba70817cfad mm: convert collapse_huge_page() to use a folio
    a1afee6c6f53 mm/khugepaged: convert alloc_charge_hpage() to use folios
    cf2bb1bf0306 cdrom: Avoid barrier_nospec() in cdrom_ioctl_media_changed()
    bb0f943675a9 bpf: Fix iter/task tid filtering
    4ed32cc0939b nvme-pci: fix race condition between reset and nvme_dev_disable()
    e2c03a2c838e nvme-pci: set doorbell config before unquiescing
    ed67a5b99e4d riscv, bpf: Make BPF_CMPXCHG fully ordered
    8a377818bcf8 bpf, vsock: Drop static vsock_bpf_prot initialization
    9dd9b16018cc vsock: Update msg_count on read_skb()
    66cd51de31c6 vsock: Update rx_bytes on read_skb()
    12c3e619d34a bpf, sockmap: SK_DROP on attempted redirects of unsupported af_vsock
    9f2ccb6f3888 net/mlx5: Unregister notifier on eswitch init failure
    d88564c79d1c net/mlx5: Fix command bitmask initialization
    5ec33b1fe86d net/mlx5: Check for invalid vector index on EQ creation
    59ba6cdadb9c vmxnet3: Fix packet corruption in vmxnet3_xdp_xmit_frame
    d10cd7bf574e Bluetooth: bnep: fix wild-memory-access in proto_unregister
    97bbdc5001db bpf: Fix link info netfilter flags to populate defrag flag
    9221ae88c205 s390: Initialize psw mask in perf_arch_fetch_caller_regs()
    1ded6b12499e usb: typec: altmode should keep reference to parent
    b209c3a0bc3a smb: client: fix OOBs when building SMB2_IOCTL request
    b1813c220b76 smb: client: fix possible double free in smb2_set_ea()
    b80e9bc85bd9 scsi: target: core: Fix null-ptr-deref in target_alloc_device()
    2fe1384cbb7c net: ravb: Only advertise Rx/Tx timestamps if hardware supports it
    e9638d3e62dc ravb: Remove setting of RX software timestamp
    b94e5375ec66 genetlink: hold RCU in genlmsg_mcast()
    f8f8afc101f2 net: dsa: mv88e6xxx: Fix the max_vid definition for the MV88E6361
    997ae8da14f1 tcp/dccp: Don't use timer_pending() in reqsk_queue_unlink().
    7218de0778ae net: bcmasp: fix potential memory leak in bcmasp_xmit()
    1999a9e050c5 drm/msm/dpu: don't always program merge_3d block
    b18db3a4fa5f irqchip/renesas-rzg2l: Fix missing put_device
    39cb86f19199 irqchip/renesas-rzg2l: Add support for suspend to RAM
    0776b25d79d8 irqchip/renesas-rzg2l: Document structure members
    05cc5e67dda8 irqchip/renesas-rzg2l: Align struct member names to tabs
    4b70478b984a net: systemport: fix potential memory leak in bcm_sysport_xmit()
    08b8f206de4c bpf: Fix truncation bug in coerce_reg_to_size_sx()
    b01fbbf38584 net: xilinx: axienet: fix potential memory leak in axienet_start_xmit()
    0017189d6057 net/smc: Fix searching in list of known pnetids in smc_pnet_add_pnetid
    79571c4d2f65 net: ethernet: aeroflex: fix potential memory leak in greth_start_xmit_gbit()
    681ce79ab6fb netdevsim: use cond_resched() in nsim_dev_trap_report_work()
    268446b40bb1 macsec: don't increment counters for an unrelated SA
    65ca9f8ddc0d drm/amd/amdgpu: Fix double unlock in amdgpu_mes_add_ring
    a4bc03078eb3 octeontx2-af: Fix potential integer overflows on integer shifts
    e61fa0d66f22 net: stmmac: dwmac-tegra: Fix link bring-up sequence
    bc52115cc41a net: usb: usbnet: fix race in probe failure
    a17874a3a5ab net/smc: Fix memory leak when using percpu refs
    95e3da26819d firmware: arm_scmi: Queue in scmi layer for mailbox implementation
    d4e44b8a6a18 drm/msm: Allocate memory for disp snapshot with kvzalloc()
    f7ad91627348 drm/msm: Avoid NULL dereference in msm_disp_state_print_regs()
    33ece6c4f0c1 drm/msm/dsi: fix 32-bit signed integer extension in pclk_rate calculation
    9f2361089152 drm/msm/dsi: improve/fix dsc pclk calculation
    dd58a5f8b308 drm/msm/dpu: check for overflow in _dpu_crtc_setup_lm_bounds()
    adde6c68bf1a drm/msm/dpu: make sure phys resources are properly initialized
    1931dc14b537 accel/qaic: Fix the for loop used to walk SG table
    5032bf57ab5d RDMA/bnxt_re: Fix the GID table length
    bf39b3532143 RDMA/bnxt_re: Update the BAR offsets
    87cb3b0054e5 RDMA/bnxt_re: Fix a bug while setting up Level-2 PBL pages
    d517cadae6c3 RDMA/bnxt_re: Return more meaningful error
    05c5fcc1869a RDMA/bnxt_re: Fix out of bound check
    903f8b01c587 RDMA/bnxt_re: Fix the max CQ WQEs for older adapters
    5fcf649e4334 RDMA/bnxt_re: Support new 5760X P7 devices
    1ee5ef316a77 ipv4: give an IPv4 dev to blackhole_netdev
    3a662cc5b5d5 RDMA/srpt: Make slab cache names unique
    af29c430a343 RDMA/irdma: Fix misspelling of "accept*"
    c29fd05329a9 RDMA/cxgb4: Fix RDMA_CM_EVENT_UNREACHABLE error for iWARP
    6d91d07913ae firmware: arm_scmi: Fix the double free in scmi_debugfs_common_setup()
    8971fd61210d ALSA: hda/cs8409: Fix possible NULL dereference
    509c29d0d26f sched/core: Disable page allocation in task_tick_mm_cid()
    380681a29066 task_work: Add TWA_NMI_CURRENT as an additional notify mode.
    a3fe89d4f5bb selftests/bpf: Fix cross-compiling urandom_read
    923c5ded505c drm/vmwgfx: Handle possible ENOMEM in vmw_stdu_connector_atomic_check
    119249d146d5 iio: frequency: admv4420: fix missing select REMAP_SPI in Kconfig
    1b3090ca3265 iio: frequency: {admv4420,adrf6780}: format Kconfig entries
    3e212996d21f bpf: fix kfunc btf caching for modules
    b56328660be0 s390/pci: Handle PCI error codes other than 0x3a
    6617ae800cbb selftests/bpf: fix perf_event link info name_len assertion
    0ce20181976d selftests/bpf: Add cookies check for perf_event fill_link_info test
    e909258d41b2 selftests/bpf: Use bpf_link__destroy in fill_link_info tests
    e5c2b971db09 bpf: fix unpopulated name_len field in perf_event link info
    cfd63c3a4538 bpf: Add cookie to perf_event bpf_link_info records
    99bf10e92a3f bpf: Add missed value to kprobe perf link info
    f4381ccf1ed1 ARM: dts: bcm2837-rpi-cm3-io3: Fix HDMI hpd-gpio pin
    9e3d07e503ea x86/resctrl: Avoid overflow in MB settings in bw_validate()
    b7bf17f4f92f RDMA/core: Fix ENODEV error for iWARP test over vlan
    c71957271f2e RDMA/bnxt_re: Add a check for memory allocation
    7d10555a340a RDMA/bnxt_re: Fix incorrect AVID type in WQE structure
    73e04a6114e0 RDMA/bnxt_re: Fix a possible memory leak
    90ad4e2fe3a2 bpf: Fix memory leak in bpf_core_apply
    978d1f63fc6e lib/Kconfig.debug: fix grammar in RUST_BUILD_ASSERT_ALLOW
    8552150e5d80 cpufreq/amd-pstate: Fix amd_pstate mode switch on shared memory systems
    49454f09936a bpf: devmap: provide rxq after redirect
    0fca5ed4be8e bpf: Make sure internal and UAPI bpf_redirect flags don't overlap
    de1f0ab13915 iio: accel: bma400: Fix uninitialized variable field_value in tap event handling.
    18abb2787b53 x86/syscall: Mark exit[_group] syscall handlers __noreturn
    2879d995e569 pnmtologo: sync with 6.6
    43ea1c5e6eb3 lib/build_OID_registry: take -stable reproducibility changes
    35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e503 bpftool: Query only cgroup-related attach types
    f71bb11887ba cpu/amd: inhibit SMP check for qemux86
    c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    7c76aad68f6d kselftest: Add a ksft_perror() helper
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7505c0387450c5467249828ec5c022f393b42a5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index b663804e17..4d18fb7b15 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0dc843fc43271230499a7e5c39e7a22eb1dbd2b9"
-SRCREV_meta ?= "b3f537ae33e504d33eeae8149f0c0972d886b3ff"
+SRCREV_machine ?= "97ad625f80bc466b28144cf04ae1606b755d70ce"
+SRCREV_meta ?= "4e156f65ccbc88f0e7b7017fd641c305872cd681"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.58"
+LINUX_VERSION ?= "6.6.59"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 0faf40ef2d..a1a12ae1db 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.58"
+LINUX_VERSION ?= "6.6.59"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_meta ?= "b3f537ae33e504d33eeae8149f0c0972d886b3ff"
+SRCREV_machine ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
+SRCREV_meta ?= "4e156f65ccbc88f0e7b7017fd641c305872cd681"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index db06c05c38..fd8fa1da71 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4716fde8fc6bd72e95465c85e6a0c5878df3f59b"
-SRCREV_machine:qemuarm64 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_machine:qemuloongarch64 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_machine:qemumips ?= "b1965dc5855088df8636d3891f366e9b5bcdf95e"
-SRCREV_machine:qemuppc ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_machine:qemuriscv64 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_machine:qemuriscv32 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_machine:qemux86 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_machine:qemux86-64 ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_machine:qemumips64 ?= "b15f0ede8d222c8fe745a21e830166a7a8da2f1f"
-SRCREV_machine ?= "cf1b259ea79d8e8509e08f9c121e2bab85412d30"
-SRCREV_meta ?= "b3f537ae33e504d33eeae8149f0c0972d886b3ff"
+SRCREV_machine:qemuarm ?= "267df33395ed7a86b047a0c7f2f6495985b88c3e"
+SRCREV_machine:qemuarm64 ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
+SRCREV_machine:qemuloongarch64 ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
+SRCREV_machine:qemumips ?= "7aac15fa06719901f8c9c19d25fcf98284e73e34"
+SRCREV_machine:qemuppc ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
+SRCREV_machine:qemuriscv64 ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
+SRCREV_machine:qemuriscv32 ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
+SRCREV_machine:qemux86 ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
+SRCREV_machine:qemux86-64 ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
+SRCREV_machine:qemumips64 ?= "8e946d861567941bf31d468ed034cb0a3beadd7d"
+SRCREV_machine ?= "e558aca87ea3665ed1b86bb90974e7b88694ec69"
+SRCREV_meta ?= "4e156f65ccbc88f0e7b7017fd641c305872cd681"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "18916a684a8b836957df88438f9bca590799d04c"
+SRCREV_machine:class-devupstream ?= "bf3af7e92bda9f48085b7741e657eeb387a61644"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.58"
+LINUX_VERSION ?= "6.6.59"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


