Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52541C04A6A
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 16:24:53 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.138684.1692116686842155581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 09:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=KhHtG6jg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bee82fab5aso2225585ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 09:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692116686; x=1692721486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+KDhxn0voHyVbQ6bJ1qnTmjZp1JaowFKycHEGF7ytQ=;
        b=KhHtG6jgLRj2JeVAaSg+EriwflWkpzGGnu4hZoZkawaSTS/ku1Behh3ZGJ6zlWwr+5
         EpjwEvJBy3RuBBZrYkc9pS4Hg5vJR6MieepYWXHS7Hg/BQvC4u0AqmJATzbkrv0gR3EU
         Yu1szkEczSyB4VAjkBrjhExHvZbCUvi98oqmrEYUznESHz5kPYgr+m4kXr/pUpB5d5L3
         IrRpwcMSlN/l/ncvGo03t7xGA3huRM7ZQbwhXDzG5vJIyOFp1hiY+tdAFsZdoJmNOweG
         yUDUG0nfgt4aEzg4B5FhDCH7zUem+JNu01HKDdLqYGy5xr9CYG2I8ZsezMp92U+rQ2Cc
         WIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692116686; x=1692721486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+KDhxn0voHyVbQ6bJ1qnTmjZp1JaowFKycHEGF7ytQ=;
        b=Zm7B2WBu1rSKCVigv298MruCsv2bcSGsbtQ19vnPtg5dsnBGtqvghJAdCx7T/NzWKL
         7pi4Zi+vERUC08I395ZQaaJ694moKWXP2e9ZOQ8PeHUaoscJJqAKG1Nrmr9tz/+wTApE
         6qeGxVIsGTL2LGDzMa8fFaJcBPHyCOoGcfOPVcm9tfcFfVr9WgToS6C/vc8vznu++DP4
         KcOcgCw+KGrmX8sKW1quj0mdZwJAGcQdlhRmyJVhnREENFFVNTSqW/18QFBfx9vIywwK
         kQrZdzxRBUd4AC3NVAl7NRbjndDVrTnX1HGfTychtpGyhPIkbarQgzVUsajp0w90CaHY
         B3+Q==
X-Gm-Message-State: AOJu0YxWMCzRd0vEO4yhfDeo2bhrrsJLBOsZ4pfNzbZMLNJsZx0ltPcQ
	EicymAzYrZrEL6Nnwi2EkKnrtcdxWgLtZIyrolo=
X-Google-Smtp-Source: AGHT+IEs6PuJNwcMePRazS4iUisWVI1QIRtJR80h9P9BuqfUj8xYVwhIX9eu9t0msJ6HZYVtNmUF2A==
X-Received: by 2002:a17:903:2594:b0:1bd:e998:ec0a with SMTP id jb20-20020a170903259400b001bde998ec0amr4971001plb.67.1692116685554;
        Tue, 15 Aug 2023 09:24:45 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ij13-20020a170902ab4d00b001b02bd00c61sm11414623plb.237.2023.08.15.09.24.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 09:24:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/18] linux-yocto/6.1: update to v6.1.43
Date: Tue, 15 Aug 2023 06:24:15 -1000
Message-Id: <4d881910e37b2694527a621911604ef3084c93ea.1692116535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692116535.git.steve@sakoman.com>
References: <cover.1692116535.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 16:24:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186085

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    52a953d0934b Linux 6.1.43
    c3d576baa6c8 dma-buf: fix an error pointer vs NULL bug
    23acc2b850ba dma-buf: keep the signaling time of merged fences v3
    665e6fd71468 test_firmware: return ENOMEM instead of ENOSPC on failed memory allocation
    0ab95d5ce8be selftests: mptcp: sockopt: use 'iptables-legacy' if available
    bd2decac7345 mptcp: ensure subflow is unhashed before cleaning the backlog
    ab79c7541d84 cpufreq: intel_pstate: Drop ACPI _PSS states table patching
    602a1cbc24a2 ACPI: processor: perflib: Avoid updating frequency QoS unnecessarily
    f7fcc0f1b26b ACPI: processor: perflib: Use the "no limit" frequency QoS
    d701687c898e drm/amd/display: Write to correct dirty_rect
    d58fb94f24f8 drm/amd/display: perform a bounds check before filling dirty rectangles
    0441c4415442 tracing: Fix trace_event_raw_event_synth() if else statement
    f5e8f7a02c15 drm/amd/display: set per pipe dppclk to 0 when dpp is off
    73679f8c455e rbd: retrieve and check lock owner twice before blocklisting
    0c0b6412c966 rbd: harden get_lock_owner_info() a bit
    c0d067c79b23 rbd: make get_lock_owner_info() return a single locker or NULL
    3d215ad49c6a dm cache policy smq: ensure IO doesn't prevent cleaner policy progress
    507f70c06aa9 drm/i915/dpt: Use shmem for dpt objects
    e046aecb73e0 ceph: never send metrics if disable_send_metrics is set
    8ab9ad163804 PM: sleep: wakeirq: fix wake irq arming
    356e711640ae arm64/sme: Set new vector length before reallocating
    ff54cb993b31 ASoC: wm8904: Fill the cache for WM8904_ADC_TEST_0 register
    6deb8727f2a5 s390/dasd: print copy pair message only for the correct error
    c4ae208cc335 s390/dasd: fix hanging device after quiesce/resume
    2b58bd384730 LoongArch: BPF: Enable bpf_probe_read{, str}() on LoongArch
    8a5e0c1f71dc LoongArch: BPF: Fix check condition to call lu32id in move_imm()
    024ed3b9b8e3 Revert "um: Use swap() to make code cleaner"
    e1d54962a63b soundwire: fix enumeration completion
    dda7cfcaa46b selftests: mptcp: join: only check for ip6tables if needed
    aedec6019d7c net: dsa: qca8k: fix mdb add/del case with 0 VID
    828f9526f061 net: dsa: qca8k: fix broken search_and_del
    d42c326288ac net: dsa: qca8k: fix search_and_insert wrong handling of new rule
    e1fda7c1250f virtio-net: fix race between set queues and probe
    cd1a8952ff52 xen: speed up grant-table reclaim
    af7aa4fe94b3 proc/vmcore: fix signedness bug in read_from_oldmem()
    7f1715d827dc locking/rtmutex: Fix task->pi_waiters integrity
    d392d2d72af3 irqchip/gic-v4.1: Properly lock VPEs when doing a directLPI invalidation
    a80d2cb27d39 irq-bcm6345-l1: Do not assume a fixed block to cpu mapping
    2edb87931afd tpm_tis: Explicitly check for error code
    c9af433b1138 ACPI/IORT: Remove erroneous id_count check in iort_node_get_rmr_info()
    d79f730bb807 nfsd: Remove incorrect check in nfsd4_validate_stateid
    e5a87723e8c7 file: always lock position for FMODE_ATOMIC_POS
    2663e2cb91a7 x86/MCE/AMD: Decrement threshold_bank refcount when removing threshold blocks
    360c98f5830d btrfs: check for commit error at btrfs_attach_transaction_barrier()
    a7b85dc31644 btrfs: check if the transaction was aborted at btrfs_wait_for_commit()
    cbec34d3021d btrfs: account block group tree when calculating global reserve size
    5fec6f7903f9 hwmon: (nct7802) Fix for temp6 (PECI1) processed even if PECI1 disabled
    85f8077893ec hwmon: (k10temp) Enable AMD3255 Proc to show negative temperature
    bf7b30dc16da ALSA: hda/relatek: Enable Mute LED on HP 250 G8
    db3c5ca31400 ALSA: hda/realtek: Support ASUS G713PV laptop
    96a0b80eb1b0 Revert "xhci: add quirk for host controllers that don't update endpoint DCS"
    9615ca54bc13 tty: n_gsm: fix UAF in gsm_cleanup_mux
    7ae9f55a4950 staging: ks7010: potential buffer overflow in ks_wlan_set_encode_ext()
    41e05572e871 staging: r8712: Fix memory leak in _r8712_init_xmit_priv()
    ef301c41a10e Documentation: security-bugs.rst: clarify CVE handling
    ddb9503d1c2e Documentation: security-bugs.rst: update preferences when dealing with the linux-distros group
    9ae3d7941f8d Revert "usb: xhci: tegra: Fix error check"
    cf8203ea19ef usb: xhci-mtk: set the dma max_seg_size
    c0ebcc7e7fb1 usb: cdns3: fix incorrect calculation of ep_buf_size when more than one config
    9590eeef4d65 USB: quirks: add quirk for Focusrite Scarlett
    98a6054d51cc usb: ohci-at91: Fix the unhandle interrupt when resume
    a28062554190 usb: misc: ehset: fix wrong if condition
    c1fad1695bef usb: dwc3: don't reset device side if dwc3 was configured as host-only
    84ff2e988b0b usb: dwc3: pci: skip BYT GPIO lookup table for hardwired phy
    bf4986fbeb21 Revert "usb: dwc3: core: Enable AutoRetry feature in the controller"
    60816ac26f2f usb: typec: Use sysfs_emit_at when concatenating the string
    9e4c1e68bf6a usb: typec: Iterate pds array when showing the pd list
    59feda7f3889 usb: typec: Set port->pd before adding device for typec_port
    efd354eb7955 can: gs_usb: gs_can_close(): add missing set of CAN state to CAN_STATE_STOPPED
    60dea45ea317 USB: serial: simple: sort driver entries
    889122fe36f4 USB: serial: simple: add Kaufmann RKS+CAN VCP
    6341ef50ca26 USB: serial: option: add Quectel EC200A module support
    f13b7a9f16db USB: serial: option: support Quectel EM060K_128
    71bef922ff9a serial: sifive: Fix sifive_serial_console_setup() section
    ace0efeb56f4 serial: 8250_dw: Preserve original value of DLF register
    016a4a2a7587 serial: qcom-geni: drop bogus runtime pm state update
    eb1a542824ee KVM: x86: Disallow KVM_SET_SREGS{2} if incoming CR0 is invalid
    d8eb0c480f1e KVM: VMX: Don't fudge CR0 and CR4 for restricted L2 guest
    ed8bbe6627cf KVM: Grab a reference to KVM for VM and vCPU stats file descriptors
    c80b7c8f9d52 usb: gadget: core: remove unbalanced mutex_unlock in usb_gadget_activate
    de77000c1923 USB: gadget: Fix the memory leak in raw_gadget driver
    0f23a9eb8abf usb: gadget: call usb_gadget_check_config() to verify UDC capability
    0cf9741aa323 Revert "usb: gadget: tegra-xudc: Fix error check in tegra_xudc_powerdomain_init()"
    a3a3c7bddab9 tracing: Fix warning in trace_buffered_event_disable()
    77996fa5c64f ring-buffer: Fix wrong stat of cpu_buffer->read
    9d0a4a7777cc ata: pata_ns87415: mark ns87560_tf_read static
    84415f934ad4 ublk: fail to recover device if queue setup is interrupted
    0d5916c43957 ublk: fail to start device if queue setup is interrupted
    c741076a3c76 ublk_drv: move ublk_get_device_from_id into ublk_ctrl_uring_cmd
    a39bf13f8640 drm/msm: Disallow submit with fence id 0
    3398e8b2833f drm/msm: Switch idr_lock to spinlock
    d722661362ca RDMA/irdma: Report correct WC error
    fe3409cd013c RDMA/irdma: Fix op_type reporting in CQEs
    e139cc2974b8 drm/amd/display: Unlock on error path in dm_handle_mst_sideband_msg_ready_event()
    5c58d120bf81 drm/amd: Fix an error handling mistake in psp_sw_init()
    ce114218f74e dm raid: protect md_stop() with 'reconfig_mutex'
    e08db3f85df2 dm raid: clean up four equivalent goto tags in raid_ctr()
    d43c7edfeb94 dm raid: fix missing reconfig_mutex unlock in raid_ctr() error paths
    37b5a0bdb896 xenbus: check xen_domain in xenbus_probe_initcall
    a71cd15a8592 drm/i915: Fix an error handling path in igt_write_huge()
    ddac66e802ce smb3: do not set NTLMSSP_VERSION flag for negotiate not auth request
    55704f087f78 block: Fix a source code comment in include/uapi/linux/blkzoned.h
    f656ba177f69 ASoC: fsl_spdif: Silence output on stop
    6806494ed4a0 cxl/acpi: Return 'rc' instead of '0' in cxl_parse_cfmws()
    748fadc08bcb cxl/acpi: Fix a use-after-free in cxl_parse_cfmws()
    1b8b83537338 drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in a5xx_submit_in_rb()
    b8500538b8f5 RDMA/bnxt_re: Prevent handling any completions after qp destroy
    d335b5fb332e RDMA/mthca: Fix crash when polling CQ for shared QPs
    5986e96be7d0 RDMA/irdma: Fix data race on CQP request done
    4e1a5842a359 RDMA/irdma: Fix data race on CQP completion stats
    b83e4c1e4c72 RDMA/irdma: Add missing read barriers
    14627d02b103 drm/msm/adreno: Fix snapshot BINDLESS_DATA size
    b6432b68700f drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
    10b5920c33c1 RDMA/mlx4: Make check for invalid flags stricter
    539cf23cb488 tipc: stop tipc crypto on failure in tipc_node_create
    5f6a842db178 tipc: check return value of pskb_trim()
    0069a11a6f00 benet: fix return value check in be_lancer_xmit_workarounds()
    0f7432b7c3b5 net/sched: mqprio: Add length check for TCA_MQPRIO_{MAX/MIN}_RATE64
    eefc0b32159a net/sched: mqprio: add extack to mqprio_parse_nlattr()
    5523d2e31935 net/sched: mqprio: refactor nlattr parsing to a separate function
    7218974aba07 mm: suppress mm fault logging if fatal signal already pending
    268cb07ef3ee netfilter: nf_tables: disallow rule addition to bound chain via NFTA_RULE_CHAIN_ID
    4237462a073e netfilter: nf_tables: skip immediate deactivate in _PREPARE_ERROR
    89a4d1a89751 netfilter: nft_set_rbtree: fix overlap expiration walk
    c09df09241fd igc: Fix Kernel Panic during ndo_tx_timeout callback
    1ecdbf2467ae x86/traps: Fix load_unaligned_zeropad() handling for shared TDX memory
    cb160f4f90d1 platform/x86: msi-laptop: Fix rfkill out-of-sync on MSI Wind U100
    847265678ec5 net: stmmac: Apply redundant write work around on 4.xx too
    17e67a071b60 octeontx2-af: Fix hash extraction enable configuration
    9b0c968a13fa octeontx2-af: Removed unnecessary debug messages.
    517a4f3b093c team: reset team's flags when down link is P2P device
    4c50927853f6 bonding: reset bond's flags when down link is P2P device
    46bf2459d6de ice: Fix memory management in ice_ethtool_fdir.c
    51aea7e9d521 tcp: Reduce chance of collisions in inet6_hashfn().
    776da4eca034 ipv6 addrconf: fix bug where deleting a mngtmpaddr can create a new temporary address
    6ed1e466ef69 ethernet: atheros: fix return value check in atl1e_tso_csum()
    85c38ac62c13 atheros: fix return value check in atl1_tso()
    01cb355bb92e phy: hisilicon: Fix an out of bounds check in hisi_inno_phy_probe()
    69534f5ab784 vxlan: fix GRO with VXLAN-GPE
    9e22b434ff4a vxlan: generalize vxlan_parse_gpe_hdr and remove unused args
    ddc6ab3834bc vxlan: calculate correct header length for GPE
    4de5cd8d8939 net: hns3: fix wrong bw weight of disabled tc issue
    487b685c815b net: hns3: fix wrong tc bandwidth weight data issue
    b93161779b45 net: hns3: fix the imp capability bit cannot exceed 32 bits issue
    e3339d44e016 net: phy: marvell10g: fix 88x3310 power up
    c76d3742b688 iavf: check for removal state before IAVF_FLAG_PF_COMMS_FAILED
    469879eda36d iavf: fix potential deadlock on allocation failure
    c0fa9a5a7a3f i40e: Fix an NULL vs IS_ERR() bug for debugfs_create_dir()
    940a2c75f5e9 media: amphion: Fix firmware path to match linux-firmware
    70f9f05abaad media: staging: atomisp: select V4L2_FWNODE
    accc838fd66a soundwire: qcom: update status correctly with mask
    cf52320a391a phy: qcom-snps-femto-v2: properly enable ref clock
    01d8e499999c phy: qcom-snps-femto-v2: keep cfg_ahb_clk enabled during runtime suspend
    b6132813be93 phy: qcom-snps: correct struct qcom_snps_hsphy kerneldoc
    3a5dbdc53a5f phy: phy-mtk-dp: Fix an error code in probe()
    15c94c3151d9 drm/amd/display: Prevent vtotal from being set to 0
    d5741133e6e2 drm/amd/display: Fix possible underflow for displays with large vblank
    342ec1696d2d drm/amd/display: update extended blank for dcn314 onwards
    27931ea53ce5 drm/amd/display: Add FAMS validation before trying to use it
    6415d5de13f5 drm/amd/display: fix dc/core/dc.c kernel-doc
    549f20581996 drm/amd/display: Rework comments on dc file
    4eed29e8a8fd maple_tree: fix 32 bit mas_next testing
    1b6e8744ed7c maple_tree: add __init and __exit to test module
    cba7ddf552bb test_maple_tree: test modifications while iterating
    a6e2a0e4144c tracing/probes: Fix to record 0-length data_loc in fetch_store_string*() if fails
    bee994668855 Revert "tracing: Add "(fault)" name injection to kernel probes"
    f3baa42afeea tracing: Allow synthetic events to pass around stacktraces
    d92ee6bce196 tracing/probes: Fix to avoid double count of the string length on the array
    16cc22202611 tracing/probes: Add symstr type for dynamic events
    f5ded0c11d4b mptcp: do not rely on implicit state check in mptcp_listen()
    fbe9fa195ef2 mptcp: introduce 'sk' to replace 'sock->sk' in mptcp_listen()
    cde7f2fd6323 arm64: errata: Mitigate Ampere1 erratum AC03_CPU_38 at stage-2
    eb1de0a2347c KVM: arm64: Condition HW AF updates on config option
    17e188e0feb0 drm/ttm: never consider pinned BOs for eviction&swap
    a7451c38e15b tty: fix hang on tty device with no_room set
    72deb1755011 n_tty: Rename tail to old_tail in n_tty_read()
    e9c44738cb1f drm/ttm: Don't leak a resource on eviction error
    3a8f9b8ccf2b drm/ttm: Don't print error message if eviction was interrupted
    76fcfc6ae3a6 drm/amd/display: Set minimum requirement for using PSR-SU on Phoenix
    f8b61a2c29fc drm/amd/display: Set minimum requirement for using PSR-SU on Rembrandt
    41c666e2b751 drm/amd/display: Update correct DCN314 register header
    8f0582fb6d0e drm/amd/display: fix dcn315 single stream crb allocation
    38fa05cad9df drm/amd/display: add pixel rate based CRB allocation support
    ad8c20954406 drm/amd/display: fix unbounded requesting for high pixel rate modes on dcn315
    acba20a5b2c8 drm/amd/display: use low clocks for no plane configs
    8d515d39d800 drm/amd/display: add ODM case when looking for first split pipe
    3a88351318bb drm/amd/display: Use min transition for all SubVP plane add/remove
    a5397c85f0b8 drm/amd/display: Include surface of unaffected streams
    d5b3e4cf9942 drm/amd/display: Copy DC context in the commit streams
    4efb2d22003f drm/amd/display: Enable new commit sequence only for DCN32x
    bc2c7003888b drm/amd/display: Rework context change check
    810329d3d418 drm/amd/display: Check if link state is valid
    f1edb2f58adb drm/amd/display: add FB_DAMAGE_CLIPS support
    ed92b595af43 PCI: rockchip: Don't advertise MSI-X in PCIe capabilities
    7b65231b65cc PCI: rockchip: Fix window mapping and address translation for endpoint
    3b117fd8cf43 PCI: rockchip: Remove writes to unused registers
    13b9c5f6059f PCI/ASPM: Avoid link retraining race
    4d1cd90cea2e PCI/ASPM: Factor out pcie_wait_for_retrain()
    8dfeae80825f PCI/ASPM: Return 0 or -ETIMEDOUT from pcie_retrain_link()
    ecd9da1d0599 MIPS: Loongson: Fix build error when make modules_install
    3fac9a39f8bb MIPS: Loongson: Move arch cflags to MIPS top level Makefile
    70957ae16093 i2c: nomadik: Remove a useless call in the remove function
    a9be061237aa i2c: nomadik: Use devm_clk_get_enabled()
    82dee5b2586c i2c: nomadik: Remove unnecessary goto label
    1dc23fb83b71 i2c: Improve size determinations
    38a8983ae1d0 i2c: Delete error messages for failed memory allocations
    7b7291ab2912 btrfs: fix race between quota disable and relocation
    44e2afbf650f gpio: mvebu: fix irq domain leak
    8ee94aab9970 gpio: mvebu: Make use of devm_pwmchip_add
    19156bcb881c pwm: Add a stub for devm_pwmchip_add()
    b2d8ac988f3c gpio: tps68470: Make tps68470_gpio_output() always set the initial value
    04f7d4917471 io_uring: don't audit the capability check in io_uring_create()
    017f686bcb53 KVM: s390: pv: fix index value of replaced ASCE
    e8df12986066 powerpc/pseries/vas: Hold mmap_mutex after mmap lock during window close
    557ea2ff0519 blk-mq: Fix stall due to recursive flush plug
    0935bbbf6e5a jbd2: Fix wrongly judgement for buffer head removing while doing checkpoint
    6e385845eea1 drm/amd: Align SMU11 SMU_MSG_OverridePcieParameters implementation with SMU13
    32631ac27c91 drm/amd: Move helper for dynamic speed switch check out of smu13
    53dd2ca2c02f ovl: fix null pointer dereference in ovl_permission()
    a9174f0d7add drm/amd/display: Keep PHY active for dp config
    2bb912161697 platform/x86/amd/pmf: reduce verbosity of apmf_get_system_params
    fd14866ebedd platform/x86/amd/pmf: Notify OS power slider update
    b068314fd8ce netfilter: nf_tables: fix underflow in chain reference counter
    35651fde1a7b netfilter: nf_tables: fix underflow in object reference counter
    d2a6dc4eaf6d Linux 6.1.42
    1d4607f2a50c Revert "drm/amd/display: edp do not add non-edid timings"
    2f2ba3c16230 drm/amd/display: Add polling method to handle MST reply packet
    78ea2ed76ce9 drm/amd/display: fix linux dp link lost handled only one time
    b31143b0fbbd drm/amd/display: Clean up errors & warnings in amdgpu_dm.c
    c14702daf1f5 drm/amd/display: force connector state when bpc changes during compliance
    00f68f5c1be1 drm/dp_mst: Clear MSG_RDY flag before sending new message
    c085ffaf67db drm/amd/display: fix some coding style issues
    374735cbe2f1 drm/amd/display: use max_dsc_bpp in amdgpu_dm
    268bfb378256 selftests/bpf: Fix sk_assign on s390x
    fd1e31d1bcb7 selftests/bpf: Workaround verification failure for fexit_bpf2bpf/func_replace_return_code
    a7c1eb9cb86f selftests/bpf: make test_align selftest more robust
    4c8f30a2ad94 bpf: aggressively forget precise markings during state checkpointing
    8b57a37d0ee7 bpf: stop setting precise in current state
    56675ddcb011 bpf: allow precision tracking for programs with subprogs
    dd33fbe4af2c scripts/kallsyms: update the usage in the comment block
    5fab8c91e59c scripts/kallsyms.c Make the comment up-to-date with current implementation
    320f980bc0bb kallsyms: add kallsyms_seqs_of_names to list of special symbols
    7531eb07b254 spi: dw: Remove misleading comment for Mount Evans SoC
    70a3015683b0 drm/ttm: fix bulk_move corruption when adding a entry
    61622fa37914 tracing/histograms: Return an error if we fail to add histogram to hist_vars list
    bae17da3ae4c jbd2: recheck chechpointing non-dirty buffer
    b9f0f20ab014 net: phy: prevent stale pointer dereference in phy_init()
    f311c7680014 tcp: annotate data-races around fastopenq.max_qlen
    01a1563a09c0 tcp: annotate data-races around icsk->icsk_user_timeout
    918a1beb0abf tcp: annotate data-races around tp->notsent_lowat
    b02f8fce7cc5 tcp: annotate data-races around rskq_defer_accept
    17c3d7583399 tcp: annotate data-races around tp->linger2
    e63939720243 tcp: annotate data-races around icsk->icsk_syn_retries
    d27a1aa37e32 tcp: annotate data-races around tp->keepalive_probes
    161b069389dd tcp: annotate data-races around tp->keepalive_intvl
    87b8466eb0cd tcp: annotate data-races around tp->keepalive_time
    2c84a3d78ad8 tcp: annotate data-races around tp->tsoffset
    949eb838803a tcp: annotate data-races around tp->tcp_tx_delay
    0d4d6b083da9 Bluetooth: hci_sync: Avoid use-after-free in dbg for hci_remove_adv_monitor()
    e969bfed84c1 Bluetooth: ISO: fix iso_conn related locking and validity issues
    59bd1e476bbc Bluetooth: hci_event: call disconnect callback before deleting conn
    13ad45ad14df Bluetooth: use RCU for hci_conn_params and iterate safely in hci_sync
    e18922ce3e31 netfilter: nf_tables: skip bound chain on rule flush
    ec3e856075c5 netfilter: nf_tables: skip bound chain in netns release path
    90c3955beb85 netfilter: nft_set_pipapo: fix improper element removal
    f372992820be netfilter: nf_tables: can't schedule in nft_chain_validate
    6026fa4f4702 netfilter: nf_tables: fix spurious set element insertion failure
    c1dc350a371a ALSA: hda/realtek: Fix generic fixup definition for cs35l41 amp
    050c24656a94 llc: Don't drop packet from non-root netns.
    50e4b32d2e58 fbdev: au1200fb: Fix missing IRQ check in au1200fb_drv_probe
    a44ff125731f Revert "tcp: avoid the lookup process failing to get sk in ehash table"
    d1a4d697a9ec net:ipv6: check return value of pskb_trim()
    205bad1b3042 net: ipv4: Use kfree_sensitive instead of kfree
    fac47182d3c2 tcp: annotate data-races around tcp_rsk(req)->ts_recent
    aa32235da43c tcp: annotate data-races around tcp_rsk(req)->txhash
    f62a00b7d135 net: ipv4: use consistent txhash in TIME_WAIT and SYN_RECV
    1d8e3ec4f0a6 igc: Prevent garbled TX queue with XDP ZEROCOPY
    c0268bc0d7ad igc: Avoid transmit queue timeout for XDP
    bb6ae775ff7f bpf, arm64: Fix BTI type used for freplace attached functions
    8620c53ced63 bpf: Repeat check_max_stack_depth for async callbacks
    d55ff358b049 bpf: Fix subprog idx logic in check_max_stack_depth
    c355f3a27b11 octeontx2-pf: Dont allocate BPIDs for LBK interfaces
    0f56bfe19aa6 security: keys: Modify mismatched function name
    3fc081edddf3 iavf: fix reset task race with iavf_remove()
    2647ff59c52e iavf: fix a deadlock caused by rtnl and driver's lock circular dependencies
    9743519240c6 iavf: Wait for reset in callbacks which trigger it
    f43ab442a8eb iavf: make functions static where possible
    9e36533d666d iavf: send VLAN offloading caps once after VFR
    5d1c0ac33d81 iavf: Move netdev_update_features() into watchdog task
    6d9d01689b82 iavf: use internal state to free traffic IRQs
    6e1d8f133207 iavf: Fix out-of-bounds when setting channels on remove
    ca12b98e04b5 iavf: Fix use-after-free in free_netdev
    ce3ec3fc64e0 net: dsa: microchip: correct KSZ8795 static MAC table access
    54830adfd9a5 net: dsa: microchip: ksz8_r_sta_mac_table(): Avoid using error code for empty entries
    8a60427c8abd net: dsa: microchip: ksz8: Make ksz8_r_sta_mac_table() static
    e4820a764e95 net: dsa: microchip: ksz8: Separate static MAC table operations for code reuse
    155f59453414 net: sched: cls_bpf: Undo tcf_bind_filter in case of an error
    2256b27f542b net: sched: cls_u32: Undo refcount decrement in case update failed
    a9345793469b net: sched: cls_u32: Undo tcf_bind_filter if u32_replace_hw_knode
    fa753f865677 net: sched: cls_matchall: Undo tcf_bind_filter in case of failure after mall_set_parms
    813572a08d49 ASoC: SOF: ipc3-dtrace: uninitialized data in dfsentry_trace_filter_write()
    c55901d381a2 cifs: fix mid leak during reconnection after timeout threshold
    855643c8d289 net: ethernet: mtk_eth_soc: handle probe deferral
    6924f3c89846 bridge: Add extack warning when enabling STP in netns.
    3325b8ddfe29 net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()/cpsw_ale_set_field()
    4148d6c766c4 dsa: mv88e6xxx: Do a final check before timing out
    f4c0a6b8ce17 kallsyms: strip LTO-only suffixes from promoted global functions
    5004d383fe8c kallsyms: Correctly sequence symbols when CONFIG_LTO_CLANG=y
    28fdfda791d4 kallsyms: Improve the performance of kallsyms_lookup_name()
    c401b72836ca spi: s3c64xx: clear loopback bit after loopback test
    9c85f71d3fc8 btrfs: be a bit more careful when setting mirror_num_ret in btrfs_map_block
    08bdd70974a8 perf build: Fix library not found error when using CSLIBS
    6aa851f6276f fbdev: imxfb: Removed unneeded release_mem_region
    e7bb9436ea97 fbdev: imxfb: warn about invalid left/right margin
    7a2d80a8c24a spi: bcm63xx: fix max prepend length
    6af800f91747 pinctrl: renesas: rzg2l: Handle non-unique subnode names
    be087281dc79 pinctrl: renesas: rzv2m: Handle non-unique subnode names
    92cc0153324b sched/psi: use kernfs polling functions for PSI trigger polling
    d5dca1977685 sched/psi: Allow unprivileged polling of N*2s period
    fb4bc32fc1be sched/psi: Extract update_triggers side effect
    c1623d4d0bef sched/psi: Rename existing poll members in preparation
    c176dda0a6a6 sched/psi: Rearrange polling code in preparation
    7d8bba4da1a8 sched/psi: Fix avgs_work re-arm in psi_avgs_work()
    45f739e8fb34 sched/fair: Use recent_used_cpu to test p->cpus_ptr
    6ede0d0f8865 ASoC: qcom: q6apm: do not close GPR port before closing graph
    5da98d0438bd ASoC: codecs: wcd938x: fix dB range for HPHL and HPHR
    e3495bc99464 ASoC: codecs: wcd938x: fix mbhc impedance loglevel
    3122e90b5cb0 ASoC: amd: acp: fix for invalid dai id handling in acp_get_byte_count()
    da64c8889fcd net: hns3: fix strncpy() not using dest-buf length as length issue
    39695e87d86f igb: Fix igb_down hung on surprise removal
    6887f3588171 wifi: iwlwifi: pcie: add device id 51F1 for killer 1675
    6862557e9afe wifi: iwlwifi: mvm: avoid baid size integer overflow
    a46a62491460 wifi: iwlwifi: Add support for new PCI Id
    8e0a94e31ade wifi: wext-core: Fix -Wstringop-overflow warning in ioctl_standard_iw_point()
    408d40c729cb devlink: report devlink_port_type_warn source device
    0d1426415522 net: ethernet: litex: add support for 64 bit stats
    86f9330a49d1 wifi: ath11k: fix memory leak in WMI firmware stats
    766e606536b9 spi: dw: Add compatible for Intel Mount Evans SoC
    d0124848c794 wifi: mac80211_hwsim: Fix possible NULL dereference
    8656b31d2efd wifi: ath11k: add support default regdb while searching board-2.bin for WCN6855
    4e291a07af77 bpf: tcp: Avoid taking fast sock lock in iterator
    c006fe361cfd bpf: Address KCSAN report on bpf_lru_list
    10fa03a9c1bc bpf: Print a warning only if writing to unprivileged_bpf_disabled.
    8d1342108c2b wifi: ath11k: fix registration of 6Ghz-only phy without the full channel range
    78a5f711efce sched/fair: Don't balance task to its current running CPU
    896f4d6046b3 rcu: Mark additional concurrent load from ->cpu_no_qs.b.exp
    9027d69221ff rcu-tasks: Avoid pr_info() with spin lock in cblist_init_generic()
    e055d0ec8809 ACPI: video: Add backlight=native DMI quirk for Dell Studio 1569
    aa7cdf487ab3 FS: JFS: Check for read-only mounted filesystem in txBegin
    3e5eb6c5ecd8 FS: JFS: Fix null-ptr-deref Read in txBegin
    da0a7c697595 MIPS: dec: prom: Address -Warray-bounds warning
    bdf07ab1595b fs: jfs: Fix UBSAN: array-index-out-of-bounds in dbAllocDmapLev
    a68241498093 udf: Fix uninitialized array access for some pathnames
    cce9107c315f ovl: check type and offset of struct vfsmount in ovl_entry
    5228d4d50528 HID: add quirk for 03f0:464a HP Elite Presenter Mouse
    6432843debe1 quota: fix warning in dqgrab()
    1f2ec87f4ab8 quota: Properly disable quotas when add_dquot_ref() fails
    2a97ec78092f ALSA: emu10k1: roll up loops in DSP setup code for Audigy
    2e1be420b869 drm/radeon: Fix integer overflow in radeon_cs_parser_init
    0ca376853412 ext4: correct inline offset when handling xattrs in inode body
    aba8f85eca81 ASoC: codecs: wcd938x: fix soundwire initialisation race
    1a261a4193b5 ASoC: codecs: wcd938x: fix codec initialisation race
    8b11d2f0e525 ASoC: codecs: wcd934x: fix resource leaks on component remove
    bb241ae928c6 ASoC: codecs: wcd938x: fix missing mbhc init error handling
    4eac89ffc510 ASoC: codecs: wcd938x: fix resource leaks on component remove
    c584b5eca3fb ASoC: tegra: Fix AMX byte map
    d55fc2bdaaa8 ASoC: qdsp6: audioreach: fix topology probe deferral
    17feff71d06c ASoC: codecs: wcd-mbhc-v2: fix resource leaks on component remove
    b0fbf3c353af ASoC: codecs: wcd938x: fix missing clsh ctrl error handling
    1dd61a5b5cca ASoC: cs42l51: fix driver to properly autoload with automatic module loading
    0e3cf6432466 ASoC: rt5640: Fix sleep in atomic context
    e5b2389e04d9 ASoC: tegra: Fix ADX byte map
    24bed70aa617 ASoC: fsl_sai: Revert "ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode"
    651881287770 ASoC: fsl_sai: Disable bit clock with transmitter
    b9741ba942f3 drm/amd/display: Keep PHY active for DP displays on DCN31
    889bac5fd796 drm/amd/display: check TG is non-null before checking if enabled
    9f28e8c2be1e drm/amd/display: Disable MPC split by default on special asic
    438542074174 drm/amd/display: only accept async flips for fast updates
    917bef37cfac drm/client: Fix memory leak in drm_client_modeset_probe
    b5359d7a5087 drm/client: Fix memory leak in drm_client_target_cloned
    91bd7acf89cb drm/amdgpu/pm: make mclk consistent for smu 13.0.7
    0b4f3d9a5c8a drm/amdgpu/pm: make gfxclock consistent for sienna cichlid
    13cb7bfbccb5 drm/amdgpu/vkms: relax timer deactivation by hrtimer_try_to_cancel
    19e7b9f1f7e1 dma-buf/dma-resv: Stop leaking on krealloc() failure
    25ad24969941 selftests: tc: add ConnTrack procfs kconfig
    54950747d5e7 can: gs_usb: gs_can_open(): improve error handling
    995f47d76647 can: bcm: Fix UAF in bcm_proc_show()
    a2d31762d73b can: mcp251xfd: __mcp251xfd_chip_set_mode(): increase poll timeout
    aa5cf8bd1318 arm64/fpsimd: Ensure SME storage is allocated after SVE VL changes
    3e463a4f3801 regmap: Account for register length in SMBus I/O limits
    ef7ad397fb8c of: Preserve "of-display" device name for compatibility
    f16c2eb6945b regmap: Drop initial version of maximum transfer length fixes
    efeac348cdc2 selftests: tc: add 'ct' action kconfig dep
    4986dd1b5132 selftests: tc: set timeout to 15 minutes
    ddf7e8984c83 btrfs: fix race between balance and cancel/pause
    c828e913c8dc fuse: ioctl: translate ENOSYS in outarg
    c35ea6061962 btrfs: zoned: fix memory leak after finding block group with super blocks
    0a5e0bc8e861 btrfs: set_page_extent_mapped after read_folio in btrfs_cont_expand
    549f5093e9d6 fuse: Apply flags2 only when userspace set the FUSE_INIT_EXT
    af6d1fc5b8a6 fuse: revalidate: don't invalidate if interrupted
    89e994688e96 btrfs: fix warning when putting transaction with qgroups enabled after abort
    c1b3d1a9c6be perf probe: Add test for regression introduced by switch to die_get_decl_file()
    00edfa6d4fe0 keys: Fix linking a duplicate key to a keyring's assoc_array
    4984a10a21c6 maple_tree: fix node allocation testing on 32 bit
    85718972b004 maple_tree: set the node limit when creating a new root node
    e0c3e25cfc57 ALSA: hda/realtek: Enable Mute LED on HP Laptop 15s-eq2xxx
    0f493b5bfe37 ALSA: hda/realtek: Add quirk for Clevo NS70AU
    7ed4e5297390 ALSA: hda/realtek - remove 3k pull low procedure
    1b87f546a035 io_uring: treat -EAGAIN for REQ_F_NOWAIT as final for io-wq

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0bf3be6fe59d8c14d7b783a80020806c7453a2a6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index e8b2566cd9..0645458d11 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f3cd63990e848c0956ce688ccc0cb2ec3f867e7d"
-SRCREV_meta ?= "837831b6b2fa523cd084c3d26610e97d8c58c72d"
+SRCREV_machine ?= "ca3ebd29a77417d2c6cabc451496f2283d69e46d"
+SRCREV_meta ?= "9f8ee63473567964331b9465fa1aba301a9a725b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.41"
+LINUX_VERSION ?= "6.1.43"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index a7a3d2bdd9..dfc1e5e5d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.41"
+LINUX_VERSION ?= "6.1.43"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
-SRCREV_meta ?= "837831b6b2fa523cd084c3d26610e97d8c58c72d"
+SRCREV_machine ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
+SRCREV_meta ?= "9f8ee63473567964331b9465fa1aba301a9a725b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 7667eebb2b..c9694fb58e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a8246bf155b45ca59c6ec3d324f4eab9cdc7129f"
-SRCREV_machine:qemuarm64 ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
-SRCREV_machine:qemuloongarch64 ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
-SRCREV_machine:qemumips ?= "37550d5e3ac0ac65a8899c82e7e72a2dfe4bb8b5"
-SRCREV_machine:qemuppc ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
-SRCREV_machine:qemuriscv64 ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
-SRCREV_machine:qemuriscv32 ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
-SRCREV_machine:qemux86 ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
-SRCREV_machine:qemux86-64 ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
-SRCREV_machine:qemumips64 ?= "9de56faddff17d49695cd2f98a13668c99c48ba4"
-SRCREV_machine ?= "e6b254abfbb16492998e6bd355302b47d0080b76"
-SRCREV_meta ?= "837831b6b2fa523cd084c3d26610e97d8c58c72d"
+SRCREV_machine:qemuarm ?= "d6ed8644d9b0767f8f676987a5c4f61173b803a8"
+SRCREV_machine:qemuarm64 ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
+SRCREV_machine:qemuloongarch64 ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
+SRCREV_machine:qemumips ?= "6e0c4ce9fd26b55a23becbddd466d0100b3fc2b0"
+SRCREV_machine:qemuppc ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
+SRCREV_machine:qemuriscv64 ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
+SRCREV_machine:qemuriscv32 ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
+SRCREV_machine:qemux86 ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
+SRCREV_machine:qemux86-64 ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
+SRCREV_machine:qemumips64 ?= "98b8dbe56e119690cdc0af0661867df6c3ee39a2"
+SRCREV_machine ?= "19cd9d8c4bafb673a03b2d7c22407d7c8d192a96"
+SRCREV_meta ?= "9f8ee63473567964331b9465fa1aba301a9a725b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5302e81aa2091d7dd59803f0727d1ba35ed2f929"
+SRCREV_machine:class-devupstream ?= "52a953d0934b17a88f403b4135eb3cdf83d19f91"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.41"
+LINUX_VERSION ?= "6.1.43"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


