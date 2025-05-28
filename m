Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEEBC5AE59
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 19:41:31 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.4443.1748461284218679050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 12:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dsra3Chj;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476b89782c3so1749091cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 12:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748461283; x=1749066083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=er/csgEBOy3i8H1d/dAuYb2vnMgwBDeGV1+DXch9+4M=;
        b=dsra3ChjnwlgHpK+Vnadc+dgOYCaDNsa/wMEkt0sLdrFNWcHzKxZwas4W5v61g3vnK
         Yhx4VF6FZO39m8u3azKwwMMF9wjtVmCbRgCTw15o5cKugU9BbXkFLz6qJW9jG6edxbL3
         OONpfsDxz+faszRSvCJ9IUExRb+Q4ObO4nTK6bZEG2Mnctoa7W9d5Z3YwMdCqrAimmBB
         as/Q9q15no0CMcno67yzFFgVT+Y2cYBWTZV4w/UXbMAnjG4enAsx5GrIjHBeps0Dw9T5
         8Ll87A56+gmdXr5+8llnQFCRyKqq9WEW7Z+iR/AioAU9F4hSxnzL0jD2yGidbD7p9Vn9
         PL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461283; x=1749066083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=er/csgEBOy3i8H1d/dAuYb2vnMgwBDeGV1+DXch9+4M=;
        b=kdGCca7QMQCs41xxalDFpSKaSNwFSI6lf54eeiiwoKgNWqOZfydgwshs7FCS/+5/D6
         4PfpKSb1e/34lq6dt9ZzHltopdoCziCO6GefQ/gFLOai8Crrbp8OxnyGoNWvgg1tvhrf
         QOEOaf9ZBxzi7KqGfL5oeNjKN/QfZMUMFZ/BipS1HR4rjlbPssZKNMMnv7REfnE1KjKB
         VvE+Jv1TjhyUo9fdPnWOEGZpVayvfUSBMulobZdXR51hYDThIDQDZrJUcatVK4c0h5V0
         cDUCipc9qN1KmxMDtkBbcZicPpfPqyV63tKdk9WK4TmTM87Cho2S0dFv+THH72p3jQP5
         AdWw==
X-Gm-Message-State: AOJu0YwoCuDIRnWeGgkpoJ8oIJ0kW9UqTXkLbT/slc07fGUJBHxjH3Ni
	vkhSK1OH6Ptp9A65wKUNE7/L3Hvz2r9dm3IvaHRFeXfYTaAJ/K6G3jjpfrnQTm55
X-Gm-Gg: ASbGncsSRkbJdrnMSLDUZtVLCtaltbR5VM0V51rFgUmE+CJkoF68tiN1XXHepIFOA2Y
	QtKLvPAh2wkNsu9eTAPBTpkgjlp0e8PlC8ULm0oHs7wQgzExXxoalSurpNJFX4GRshKjN4bMjFX
	EfYXkjWSgjQjVGOfFUlFx8+zJqaoJg6VYX+3GoRlLdjqAL4mANCBJhK9VmV3GZEgxfrTtm9oDs4
	AogiaVqzUBwIkU6l2fsuKnu33KfDdPX5z6W57Oa/u43qEetAYgRRJcyj0TXXvJo9SiDA5MzEQHg
	kaod/iea2+lfQcj1+MFUdLq3tG3o7MBv6bLEnHY81SWR7F58AzLXYnPQf8hF3qcGvJFkJEqEeHY
	1tvWdHuMSlTjUuPjhUZbZ1b+x+CG7jCbyNrTkFGxtwCLn4Y6MhNNe
X-Google-Smtp-Source: AGHT+IF0k9hBP2ph0cfodOb6QjOpxhdYgpWHZWj9MfAL4At7mas3XWYWW98nDs0W9nTxbF8OxJ+/Ig==
X-Received: by 2002:a05:622a:1f10:b0:494:ab13:6824 with SMTP id d75a77b69052e-4a3800e5ae3mr56513601cf.15.1748461282903;
        Wed, 28 May 2025 12:41:22 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a3c80f323bsm9577691cf.72.2025.05.28.12.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:41:21 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/6] linux-yocto/6.6: update to v6.6.88
Date: Wed, 28 May 2025 15:41:15 -0400
Message-Id: <20250528194118.1534655-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250528194118.1534655-1-bruce.ashfield@gmail.com>
References: <20250528194118.1534655-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 19:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217391

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    23ec0b405729 Linux 6.6.88
    e7144dae6bba ALSA: hda/realtek: Fix built-in mic on another ASUS VivoBook model
    03af77aa9c03 drm/tests: Build KMS helpers when DRM_KUNIT_TEST_HELPERS is enabled
    b6b77ca4c980 btrfs: fix the length of reserved qgroup to free
    81faa5bfba73 MIPS: ds1287: Match ds1287_set_base_clock() function types
    1dab036557e6 MIPS: cevt-ds1287: Add missing ds1287.h include
    9cac3ed9ca51 MIPS: dec: Declare which_prom() as static
    2eb70f54ad86 sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
    f8dafdafddcf sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
    1e2d849efc32 sign-file,extract-cert: move common SSL helper functions to a header
    202bca49b7f9 xdp: Reset bpf_redirect_info before running a xdp's BPF prog.
    0a721f240a68 nvmet-fc: Remove unused functions
    efde4462b321 landlock: Add the errata interface
    c84632096722 drm/amd/display: Stop amdgpu_dm initialize when link nums greater than max_links
    31ff06b4a8a8 wifi: rtw89: pci: disable PCIE wake bit when PCIE deinit
    48128f54f572 wifi: rtw89: pci: add pre_deinit to be called after probe complete
    84464db2ec2a btrfs: fix qgroup reserve leaks in cow_file_range
    e8336d3c9ab7 usb: typec: fix pm usage counter imbalance in ucsi_ccg_sync_control()
    0e66fd8e5a2e usb: typec: fix potential array underflow in ucsi_ccg_sync_control()
    37491e1dbb50 LoongArch: Eliminate superfluous get_numa_distances_cnt()
    1f1feff02e9d powerpc/rtas: Prevent Spectre v1 gadget construction in sys_rtas()
    427036030f4d nvme-rdma: unquiesce admin_q before destroy it
    6f8d51051d80 x86/split_lock: Fix the delayed detection logic
    29f040d4efb0 x86/tdx: Fix arch_safe_halt() execution for TDX VMs
    e5f0581ecb2a x86/xen: fix memblock_reserve() usage on PVH
    fa1103f21b7a x86/xen: move xen_reserve_extra_memory()
    dafbcfb8ffe6 efi/libstub: Bump up EFI_MMAP_NR_SLACK_SLOTS to 32
    4f687721a981 Fix mmu notifiers for range-based invalidates
    da210d4f884f misc: pci_endpoint_test: Fix 'irq_type' to convey the correct type
    9d8d2899c5b9 misc: pci_endpoint_test: Fix displaying 'irq_type' after 'request_irq' error
    5a4b71812132 misc: pci_endpoint_test: Avoid issue of interrupts remaining after request_irq error
    11a2f91f1844 selftests: mptcp: add mptcp_lib_wait_local_port_listen
    392dfed4af72 mptcp: sockopt: fix getting freebind & transparent
    d69a23d8e925 md: fix mddev uaf while iterating all_mddevs list
    9b1f50da6054 kbuild: Add '-fno-builtin-wcslen'
    8c8d0e800044 cpufreq: Reference count policy in cpufreq_update_limits()
    7e2449ee6693 io_uring/net: fix accept multishot handling
    3184297d6ff0 drm/i915/gvt: fix unterminated-string-initialization warning
    3309feab2b26 drm/sti: remove duplicate object names
    31e94c798957 drm/nouveau: prime: fix ttm_bo_delayed_delete oops
    ae73db71a2a1 drm/amdgpu/dma_buf: fix page_link check
    068091b79648 drm/amd/pm/powerplay/hwmgr/vega20_thermal: Prevent division by zero
    c3ff73e3bddf drm/amd/pm/swsmu/smu13/smu_v13_0: Prevent division by zero
    b0742a709be7 drm/amd/pm/powerplay/hwmgr/smu7_thermal: Prevent division by zero
    de2cba068c9c drm/amd/pm/smu11: Prevent division by zero
    587de3ca7875 drm/amd/pm/powerplay: Prevent division by zero
    509617407411 drm/amd/pm: Prevent division by zero
    d189b32f9dd8 drm/amd: Handle being compiled without SI or CIK support better
    42c2525bc0a8 drm/msm/a6xx: Fix stale rpmh votes from GPU
    31330248abad drm/repaper: fix integer overflows in repeat functions
    0df68b586020 perf/x86/intel/uncore: Fix the scale of IIO free running counters on SPR
    9686a16c35ef perf/x86/intel/uncore: Fix the scale of IIO free running counters on ICX
    aea923afeae4 perf/x86/intel/uncore: Fix the scale of IIO free running counters on SNR
    196a4eecb87b perf/x86/intel: Allow to update user space GPRs from PEBS records
    c2b169fc7a12 RDMA/cma: Fix workqueue crash in cma_netevent_work_handler
    064dc7a70cec scsi: ufs: exynos: Ensure consistent phy reference counts
    92d8a4e6217e scsi: megaraid_sas: Block zero-length ATA VPD inquiry
    bbb6b149c339 x86/boot/sev: Avoid shared GHCB page for early memory acceptance
    5e036349bb01 x86/cpu/amd: Fix workaround for erratum 1054
    971ba6a64c53 x86/microcode/AMD: Extend the SHA check to Zen5, block loading of any unreleased standalone Zen5 microcode patches
    f6ec52710dc5 virtiofs: add filesystem context source name check
    89baf6bbe6b6 tracing: Fix filter string testing
    596cbe632068 string: Add load_unaligned_zeropad() code path to sized_strscpy()
    d5421baa0e15 smb3 client: fix open hardlink on deferred close file error
    607723b13a0c selftests/mm: generate a temporary mountpoint for cgroup filesystem
    e0e1b00208ec riscv: Avoid fortify warning in syscall_get_arguments()
    8dbf06048023 Revert "smb: client: fix TCP timers deadlock after rmmod"
    fd8973b625b6 Revert "smb: client: Fix netns refcount imbalance causing leaks and use-after-free"
    b7ce8db49028 ksmbd: fix the warning from __kernel_write_iter
    160935d81f2c ksmbd: Prevent integer overflow in calculation of deadtime
    296cb5457cc6 ksmbd: fix use-after-free in smb_break_all_levII_oplock()
    1db2451de23e ksmbd: Fix dangling pointer in krb_authenticate
    0874b629f653 ovl: don't allow datadir only
    23385f567b03 mm: fix apply_to_existing_page_range()
    c3b3987bae52 mm: fix filemap_get_folios_contig returning batches of identical folios
    006b67ac6131 mm/gup: fix wrongly calculated returned value in fault_in_safe_writeable()
    2912683a104e loop: LOOP_SET_FD: send uevents for partitions
    f8530400f21c loop: properly send KOBJ_CHANGED uevent for disk device
    952e7a7e317f isofs: Prevent the use of too small fid
    e89bf1311d44 i2c: cros-ec-tunnel: defer probe if parent EC is not present
    9f77aa584a65 hfs/hfsplus: fix slab-out-of-bounds in hfs_bnode_read_key
    8a53d36ba10b crypto: caam/qi - Fix drv_ctx refcount bug
    78b1126ca42b btrfs: correctly escape subvol in btrfs_show_options()
    ab46314a4e90 Bluetooth: vhci: Avoid needless snprintf() calls
    600a099bec16 Bluetooth: l2cap: Process valid commands in too long frame
    0a6c0fc1f83f ftrace: fix incorrect hash size in register_ftrace_direct()
    42203e004d8e i2c: atr: Fix wrong include
    7d192e27a431 nfsd: decrease sc_count directly if fail to queue dl_recall
    b699aeb91b10 nfs: add missing selections of CONFIG_CRC32
    e446b60a2be1 asus-laptop: Fix an uninitialized variable
    a12c14577882 ASoC: qcom: Fix sc7280 lpass potential buffer overflow
    bf39a185a626 ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels
    444139d6c43b ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
    3d6102ae330a Revert "PCI: Avoid reset when disabled via sysfs"
    411b7005f4e8 writeback: fix false warning in inode_to_wb()
    404faab1dd6b cpufreq/sched: Fix the usage of CPUFREQ_NEED_UPDATE_LIMITS
    d217f7a82291 riscv: KGDB: Remove ".option norvc/.option rvc" for kgdb_compiled_break
    ba433e6c1002 riscv: KGDB: Do not inline arch_kgdb_breakpoint()
    ec95d0dfc672 kunit: qemu_configs: SH: Respect kunit cmdline
    d7c65ecad959 riscv: Properly export reserved regions in /proc/iomem
    a2874f0dff63 net: ethernet: mtk_eth_soc: revise QDMA packet scheduler settings
    d853feb79d7e net: ethernet: mtk_eth_soc: correct the max weight of the queue limit for 100Mbps
    7891619d21f0 net: ti: icss-iep: Fix possible NULL pointer dereference for perout request
    8b9808b1f64e net: ti: icss-iep: Add phase offset configuration for perout signal
    d64a7166fd12 net: ti: icss-iep: Add pwidth configuration for perout signal
    06ec3c18810f ptp: ocp: fix start time alignment in ptp_ocp_signal_set
    c7ee467f29a8 net: dsa: avoid refcount warnings when ds->ops->tag_8021q_vlan_del() fails
    fb12b460ec46 net: dsa: free routing table on probe failure
    86c6613a69bc net: dsa: clean up FDB, MDB, VLAN entries on unbind
    afae90873014 net: dsa: mv88e6xxx: fix -ENOENT when deleting VLANs and MST is unsupported
    bbb80f004f7a net: dsa: mv88e6xxx: avoid unregistering devlink regions which were never registered
    0f0284285ad3 net: bridge: switchdev: do not notify new brentries as changed
    c9dbc7ec442f net: b53: enable BPDU reception for management port
    2315cfaf4782 netlink: specs: rt-link: adjust mctp attribute naming
    2f6e52cab1d4 netlink: specs: rt-link: add an attr layer around alt-ifname
    08aa59c0be76 cxgb4: fix memory leak in cxgb4_init_ethtool_filters() error path
    e729dd9602e3 ata: libata-sata: Save all fields from sense data descriptor
    94d5809c7fa8 net: ethernet: ti: am65-cpsw: fix port_np reference counting
    422b7b9d1362 net: ethernet: ti: am65-cpsw-nuss: rename phy_node -> port_np
    7c2b66a31c7a net: ngbe: fix memory leak in ngbe_probe() error path
    824a7c2df512 net: openvswitch: fix nested key length validation in the set() action
    549cbbd14bbe block: fix resource leak in blk_register_queue() error path
    a8a3b61ce140 net: mctp: Set SOCK_RCU_FREE
    9027e0735670 pds_core: fix memory leak in pdsc_debugfs_add_qcq()
    86dc3a05fa70 test suite: use %zu to print size_t
    b45b7a0bb88f igc: add lock preventing multiple simultaneous PTM transactions
    d8dde48a1ca6 igc: cleanup PTP module if probe fails
    bcb2d6bfa5e2 igc: handle the IGC_PTP_ENABLED flag correctly
    5262d34f5e40 igc: move ktime snapshot into PTM retry loop
    b1f3e69dc984 igc: increase wait time before retrying PTM
    16194ca3f3b4 igc: fix PTM cycle trigger logic
    6f1ac9b5a9ce Revert "wifi: mac80211: Update skb's control block key in ieee80211_tx_dequeue()"
    9e3114958d87 Bluetooth: l2cap: Check encryption key size on incoming connection
    3db6605043b5 Bluetooth: btrtl: Prevent potential NULL dereference
    fd1621f38fbe Bluetooth: hci_event: Fix sending MGMT_EV_DEVICE_FOUND for invalid address
    ae470d06320d RDMA/core: Silence oversized kvmalloc() warning
    d1d6fa08b1ef ASoC: cs42l43: Reset clamp override on jack removal
    efeddd8acecf RDMA/hns: Fix wrong maximum DMA segment size
    344baf8c1fb1 RDMA/usnic: Fix passing zero to PTR_ERR in usnic_ib_pci_probe()
    4f7b6029ae8e ovl: remove unused forward declaration
    aaa93b884610 ASoC: Intel: avs: Fix null-ptr-deref in avs_component_probe()
    4a655ba2830a ASoC: dwc: always enable/disable i2s irqs
    0b5390aeaa85 md/md-bitmap: fix stats collection for external bitmaps
    f10aa9bc94de md/raid10: fix missing discard IO accounting
    b0348f33940f scsi: iscsi: Fix missing scsi_host_put() in error path
    4a43fd367106 wifi: wl1251: fix memory leak in wl1251_tx_work
    c74b84544dee wifi: mac80211: Purge vif txq in ieee80211_do_stop()
    7fa75affe2a9 wifi: mac80211: Update skb's control block key in ieee80211_tx_dequeue()
    7ca513631fa6 wifi: at76c50x: fix use after free access in at76_disconnect
    a70ea9296419 scsi: hisi_sas: Enable force phy when SATA disk directly connected
    58eb29dba712 HSI: ssi_protocol: Fix use after free vulnerability in ssi_protocol Driver Due to Race Condition
    02e1bcdfdf76 Bluetooth: hci_uart: Fix another race during initialization
    fa43166f2e8b media: mediatek: vcodec: mark vdec_vp9_slice_map_counts_eob_coef noinline
    5029c8f2d7ea x86/e820: Fix handling of subpage regions when calculating nosave ranges in e820__register_nosave_regions()
    bf56f45b167e iommufd: Fail replace if device has not been attached
    e5eadb652014 ACPI: platform-profile: Fix CFI violation when accessing sysfs files
    8d25a8e275bb x86/paravirt: Move halt paravirt calls under CONFIG_PARAVIRT
    4117975672c4 arm64: errata: Add newer ARM cores to the spectre_bhb_loop_affected() lists
    d784cb189035 selftests: mptcp: fix incorrect fd checks in main_loop
    970688e64df9 selftests: mptcp: close fd_in before returning in main_loop
    0d527afa7698 pinctrl: qcom: Clear latched interrupt status when changing IRQ type
    d11839156653 phy: freescale: imx8m-pcie: assert phy reset and perst in power off
    6176fa57dd30 PCI: Fix reference leak in pci_alloc_child_bus()
    1fea7726276e PCI: brcmstb: Fix missing of_node_put() in brcm_pcie_probe()
    468773325ec1 of/irq: Fix device node refcount leakages in of_irq_init()
    b48732849dbb of/irq: Fix device node refcount leakage in API irq_of_parse_and_map()
    eac3d34101ab of/irq: Fix device node refcount leakages in of_irq_count()
    37ff581ddfea of/irq: Fix device node refcount leakage in API of_irq_parse_raw()
    77e3fd880376 of/irq: Fix device node refcount leakage in API of_irq_parse_one()
    6ea67933af7c ntb: use 64-bit arithmetic for the MSI doorbell mask
    8a3df0aa1087 KVM: x86: Acquire SRCU in KVM_GET_MP_STATE to protect guest memory accesses
    8cb249d56e63 KVM: x86: Explicitly zero-initialize on-stack CPUID unions
    504464fd01dc gve: handle overflow when reporting TX consumed descriptors
    bbc702d73f71 gpio: zynq: Fix wakeup source leaks on device unbind
    4009ad6c7695 gpio: tegra186: fix resource handling in ACPI probe path
    5d336ac215e5 ftrace: Add cond_resched() to ftrace_graph_set_hash()
    2eec9e2eb6e3 dt-bindings: coresight: qcom,coresight-tpdm: Fix too many 'reg'
    39cf18f8ec42 dt-bindings: coresight: qcom,coresight-tpda: Fix too many 'reg'
    f46260c3dd44 dm-verity: fix prefetch-vs-suspend race
    7958b71d8baa dm-integrity: set ti->error on memory allocation failure
    841ca9e9224c dm-ebs: fix prefetch-vs-suspend race
    5baddc08066a crypto: ccp - Fix check for the primary ASP device
    ecc44297ac4c clk: qcom: gdsc: Set retain_ff before moving to HW CTRL
    fe25487f2dd1 clk: qcom: gdsc: Capture pm_genpd_add_subdomain result code
    1be6fe9527b1 clk: qcom: gdsc: Release pm subdomains in reverse add order
    541c1a5554ee clk: qcom: clk-branch: Fix invert halt status bit check for votable clocks
    5569a2c55780 cifs: Ensure that all non-client-specific reparse points are processed by the server
    b350dab6d4f4 cifs: fix integer overflow in match_server()
    864ba5c651b0 cifs: avoid NULL pointer dereference in dbg call
    f75eb9acf9df thermal/drivers/rockchip: Add missing rk3328 mapping entry
    233b9cef917c tracing: Do not add length to print format in synthetic events
    8d4750f06359 x86/xen: fix balloon target initialization for PVH dom0
    c6fefcb71d24 sctp: detect and prevent references to a freed transport in sendmsg
    b5681a8b997e mm/hugetlb: move hugetlb_sysctl_init() to the __init section
    94b3a19cedb3 mm/hwpoison: do not send SIGBUS to processes with recovered clean pages
    0b83b941d387 mm/userfaultfd: fix release hang over concurrent GUP
    376183178f42 mm: add missing release barrier on PGDAT_RECLAIM_LOCKED unlock
    e351ffc48b5e mm/mremap: correctly handle partial mremap() of VMA starting at 0
    f4bc11b3c55f mm: fix lazy mmu docs and usage
    402769cde5eb mm: make page_mapped_in_vma() hugetlb walk aware
    e09661ac0b84 mm/rmap: reject hugetlb folios in folio_make_device_exclusive()
    70ec7d13bbd4 sparc/mm: avoid calling arch_enter/leave_lazy_mmu() in set_ptes
    b266dd4d2256 sparc/mm: disable preemption in lazy mmu mode
    e02c44b6ecfd iommufd: Fix uninitialized rc in iommufd_access_rw()
    e921fce3a295 btrfs: zoned: fix zone finishing with missing devices
    fa55f2a31ba2 btrfs: zoned: fix zone activation with missing devices
    897ad7f70dd7 btrfs: fix non-empty delayed iputs list on unmount due to compressed write workers
    1c82f5a393d8 backlight: led_bl: Hold led_access lock when calling led_sysfs_disable()
    c8fa7ffc1c23 arm64: dts: mediatek: mt8173: Fix disp-pwm compatible string
    8db1206d834b arm64: mm: Correct the update of max_pfn
    bfbbef7f1d38 mtd: rawnand: Add status chack in r852_ready()
    7772621041ee mtd: inftlcore: Add error check for inftl_read_oob()
    29b21145721a mptcp: only inc MPJoinAckHMacFailure for HMAC failures
    7f9ae060ed64 mptcp: fix NULL pointer in can_accept_new_subflow
    8ddd124f8a9e lib: scatterlist: fix sg_split_phys to preserve original scatterlist offsets
    8385532d4dd4 locking/lockdep: Decrease nr_unused_locks if lock unused in zap_class()
    388ba8781616 mailbox: tegra-hsp: Define dimensioning masks in SoC data
    ea07760676bb mfd: ene-kb3930: Fix a potential NULL pointer dereference
    b20ec02fcb34 leds: rgb: leds-qcom-lpg: Fix calculation of best period Hi-Res PWMs
    5d97ee4d8d61 leds: rgb: leds-qcom-lpg: Fix pwm resolution max for Hi-Res PWMs
    c88f7328bb0f jbd2: remove wrong sb->s_sequence check
    6871a676aa53 i3c: Add NULL pointer check in i3c_master_queue_ibi()
    c3250bdf5da9 i3c: master: svc: Use readsb helper for reading MDB
    b00b040abfbb smb311 client: fix missing tcon check when mounting with linux/posix extensions
    5f80fd2ff8bf soc: samsung: exynos-chipid: Add NULL pointer check in exynos_chipid_probe()
    1404dff1e11b tpm: do not start chip while suspended
    a64d8972f00f udf: Fix inode_getblk() return value
    a5434db74bf2 vdpa/mlx5: Fix oversized null mkey longer than 32bit
    a5464ac3eeff f2fs: fix to avoid atomicity corruption of atomic file
    2eeb1085bf7b ext4: fix off-by-one error in do_split
    5f084993c90d bus: mhi: host: Fix race between unprepare and queue_buf
    7e439ff5efab ASoC: qdsp6: q6asm-dai: fix q6asm_dai_compr_set_params error path
    7ed8f978a894 ASoC: qdsp6: q6apm-dai: fix capture pipeline overruns.
    b860a99800bc ASoC: qdsp6: q6apm-dai: set 10 ms period and buffer alignment.
    176e7c9a0f62 ASoC: q6apm: add q6apm_get_hw_pointer helper
    35c4a652d833 io_uring/kbuf: reject zero sized provided buffers
    21b0c54546d6 wifi: mac80211: fix integer overflow in hwmp_route_info_get()
    f86e2d083753 wifi: mt76: Add check for devm_kstrdup()
    f304da692876 clocksource/drivers/stm32-lptimer: Use wakeup capable instead of init wakeup
    ce6cabc080c1 mtd: Replace kcalloc() with devm_kcalloc()
    64baf646846e net: dsa: mv88e6xxx: workaround RGMII transmit delay erratum for 6320 family
    7a083ad29fd4 mtd: Add check for devm_kcalloc()
    92b68442790f mptcp: sockopt: fix getting IPV6_V6ONLY
    8a19d34f1e0a media: i2c: imx219: Rectify runtime PM handling in probe and remove
    05b07e52a0d0 media: venus: hfi_parser: refactor hfi packet parsing logic
    d4d88ece4ba9 media: venus: hfi_parser: add check to avoid out of bound access
    28bdf7b9140a media: i2c: ov7251: Introduce 1 ms delay between regulators and en GPIO
    f249c05416ea media: i2c: ov7251: Set enable GPIO low in probe
    86c20c4ebc91 media: i2c: ccs: Set the device's runtime PM status correctly in probe
    2f282e88c2aa media: i2c: ccs: Set the device's runtime PM status correctly in remove
    c3d68e38aa04 media: v4l2-dv-timings: prevent possible overflow in v4l2_detect_gtf()
    571a1873da47 media: platform: stm32: Add check for clk_enable()
    bedb5a7b9783 media: visl: Fix ERANGE error when setting enum controls
    3eaf580cbaa3 media: streamzap: prevent processing IR data on URB failure
    3fcff11317b2 tpm, tpm_tis: Fix timeout handling when waiting for TPM status
    9bd51723ab51 mtd: rawnand: brcmnand: fix PM resume warning
    b8e772e2d8b3 spi: cadence-qspi: Fix probe on AM62A LP SK
    5085e02362b9 KVM: arm64: Tear down vGIC on failed vCPU creation
    db8a657980e7 arm64: errata: Add KRYO 2XX/3XX/4XX silver cores to Spectre BHB safe list
    3ca6b0c9171b arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre BHB
    1577657f5efc arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
    892d24d7e355 arm64: cputype: Add MIDR_CORTEX_A76AE
    9da005f88418 xenfs/xensyms: respect hypervisor's "next" indication
    192b87608c2c media: siano: Fix error handling in smsdvb_module_init()
    3e7fc0606e71 media: vim2m: print device name after registering device
    40084302f639 media: venus: hfi: add check to handle incorrect queue size
    5af611c70fb8 media: venus: hfi: add a check to handle OOB in sfr region
    259dafed1879 media: i2c: adv748x: Fix test pattern selection mask
    8895a7af8452 media: mtk-vcodec: venc: avoid -Wenum-compare-conditional warning
    fd7bb97ede48 media: mediatek: vcodec: Fix a resource leak related to the scp device in FW initialization
    39cb5a29cd60 dt-bindings: media: st,stmipid02: correct lane-polarities maxItems
    480faed292f2 ext4: don't treat fhandle lookup of ea_inode as FS corruption
    d5cba7730d76 bpf: support SKF_NET_OFF and SKF_LL_OFF on skb frags
    0e1816d8c277 pwm: fsl-ftm: Handle clk_get_rate() returning 0
    d837f37cd4d9 pwm: rcar: Improve register calculation
    8ddbec73ea25 pwm: mediatek: Prevent divide-by-zero in pwm_mediatek_config()
    a0171967abdd tpm, tpm_tis: Workaround failed command reception on Infineon devices
    16fae241f49a ktest: Fix Test Failures Due to Missing LOG_FILE Directories
    14345d5d7db7 tracing: probe-events: Add comments about entry data storing code
    fda15c5b96b8 fbdev: omapfb: Add 'plane' value check
    3ab9cd2d2e9a drm/amdgpu: grab an additional reference on the gang fence v2
    13e5148f70e8 PCI: vmd: Make vmd_dev::cfg_lock a raw_spinlock_t type
    f8693e1bae9c drm/amdgpu: handle amdgpu_cgs_create_device() errors in amd_powerplay_create()
    988705e558f0 drm/mediatek: mtk_dpi: Explicitly manage TVD clock in power on/off
    50967df6e4d2 drm/mediatek: mtk_dpi: Move the input_2p_en bit to platform data
    a36f8d544522 drm/amdkfd: debugfs hang_hws skip GPU with MES
    864d739fbc72 drm/amdkfd: Fix pqm_destroy_queue race with GPU reset
    89af6b39f028 drm/amdkfd: Fix mode1 reset crash issue
    06a1db4cb7ac drm/amdkfd: clamp queue size to minimum
    61d1a8296eeb drivers: base: devres: Allow to release group on device release
    100cf2fa0140 drm/bridge: panel: forbid initializing a panel with unknown connector type
    1e27e6050c8c drm: panel-orientation-quirks: Add quirk for OneXPlayer Mini (Intel)
    49ef9e47e72b drm: panel-orientation-quirks: Add new quirk for GPD Win 2
    118f95e3ff6c drm: panel-orientation-quirks: Add quirk for AYA NEO Slide
    14dc15279512 drm: panel-orientation-quirks: Add quirks for AYA NEO Flip DS and KB
    bfea2e6f0305 drm: panel-orientation-quirks: Add support for AYANEO 2S
    d74554965cac drm/amd/display: add workaround flag to link to force FFE preset
    2528ccb0f2fc drm/amd/display: Update Cursor request mode to the beginning prefetch always
    f5b168c309a7 drm: allow encoder mode_set even when connectors change for crtc
    fb95ab35d0e1 Bluetooth: qca: simplify WCN399x NVM loading
    806464634e7f Bluetooth: hci_uart: fix race during initialization
    e711501970a0 tracing: fix return value in __ftrace_event_enable_disable for TRACE_REG_UNREGISTER
    d537859e56bc net: vlan: don't propagate flags on open
    efd75512e38a wifi: mt76: mt76x2u: add TP-Link TL-WDN6200 ID to device table
    e4d1ca0a84a6 scsi: st: Fix array overflow in st_setup()
    06f20cd706d7 cdc_ether|r8152: ThinkPad Hybrid USB-C/A Dock quirk
    362a90cecd36 ext4: ignore xattrs past end
    b7cc9e3adfee Revert "f2fs: rebuild nat_bits during umount"
    1dbece9c2fbc ext4: protect ext4_release_dquot against freezing
    1263713795d0 ahci: add PCI ID for Marvell 88SE9215 SATA Controller
    8b5e5aac44fe f2fs: fix to avoid out-of-bounds access in f2fs_truncate_inode_blocks()
    7f1d986da5c6 wifi: ath12k: Fix invalid data access in ath12k_dp_rx_h_undecap_nwifi
    da3ba4a44e96 net: sfp: add quirk for 2.5G OEM BX SFP
    7568e5e4486d ata: libata-eh: Do not use ATAPI DMA for a device limited to PIO mode
    cc0bc4cb62ce jfs: add sanity check for agwidth in dbMount
    b3c4884b987e jfs: Prevent copying of nlink with value 0 from disk inode
    7ccf3b352745 fs/jfs: Prevent integer overflow in AG size calculation
    a14b2592a7a7 fs/jfs: cast inactags to s64 to prevent potential overflow
    067347e00a3a jfs: Fix uninit-value access of imap allocated in the diMount() function
    95f17738b86f page_pool: avoid infinite loop to schedule delayed worker
    809bf3a7d05d net: usb: asix_devices: add FiberGecko DeviceID
    4ae2e891552e scsi: target: spc: Fix RSOC parameter data header size
    4fc5c17538cb f2fs: don't retry IO for corrupted data scenario
    2c512f2eadab wifi: ath12k: Fix invalid entry fetch in ath12k_dp_mon_srng_process
    b3e04472a87b ASoC: amd: yc: update quirk data for new Lenovo model
    01529e60ae14 ASoC: amd: Add DMI quirk for ACP6X mic support
    63f516088870 ALSA: usb-audio: Fix CME quirk for UF series keyboards
    0932950d3a3f mmc: dw_mmc: add a quirk for accessing 64-bit FIFOs in two halves
    035c6e60074f media: uvcvideo: Add quirk for Actions UVC05
    bd095d3a9dff ASoC: fsl_audmix: register card device depends on 'dais' property
    1d91458b126e ALSA: hda: intel: Add Lenovo IdeaPad Z570 to probe denylist
    fb44392bd5a4 ALSA: hda: intel: Fix Optimus when GPU has no sound
    be706a48bb78 HID: pidff: Fix null pointer dereference in pidff_find_fields
    4d5bcca217ae HID: pidff: Add PERIODIC_SINE_ONLY quirk
    c1fde337b317 HID: Add hid-universal-pidff driver and supported device ids
    fd6055c1a103 HID: pidff: Add FIX_WHEEL_DIRECTION quirk
    123e94f66d2a HID: pidff: Add hid_pidff_init_with_quirks and export as GPL symbol
    b2f378891cb2 HID: pidff: Add PERMISSIVE_CONTROL quirk
    1830b4166f01 HID: pidff: Add MISSING_PBO quirk and its detection
    bf284760372b HID: pidff: Add MISSING_DELAY quirk and its detection
    a08ee3c7eeca HID: pidff: Do not send effect envelope if it's empty
    520e0371d1dc HID: pidff: Convert infinite length from Linux API to PID standard
    4a29465fbe60 ASoC: SOF: topology: Use krealloc_array() to replace krealloc()
    1e5b04f08e52 zstd: Increase DYNAMIC_BMI2 GCC version cutoff from 4.8 to 11.0 to work around compiler segfault
    af71db7de067 xen/mcelog: Add __nonstring annotations for unterminated strings
    150d1cbdf781 arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
    f14d29b89186 perf: arm_pmu: Don't disable counter in armpmu_add()
    c7dec3461275 x86/cpu: Don't clear X86_FEATURE_LAHF_LM flag in init_amd_k8() on AMD when running in a virtual machine
    8449fd2a1433 x86/ia32: Leave NULL selector values 0~3 unchanged
    d0f4b75a8f96 x86/mm: Clear _PAGE_DIRTY for kernel mappings when we clear _PAGE_RW
    942a4b97fc77 pm: cpupower: bench: Prevent NULL dereference on malloc failure
    4ec80a68733f umount: Allow superblock owners to force umount
    323960a187a9 fs: consistently deref the files table with rcu_dereference_raw()
    6abd09bed43b iommu/mediatek: Fix NULL pointer deference in mtk_iommu_device_group
    90cdd7e5a484 nft_set_pipapo: fix incorrect avx2 match of 5th field octet
    fbaffe8bccf1 net: ppp: Add bound checking for skb data on ppp_sync_txmung
    6509e2e17d32 ipv6: Align behavior across nexthops during path selection
    d2718324f9e3 net_sched: sch_sfq: move the limit validation
    00d44fe29e75 net_sched: sch_sfq: use a temporary work area for validating configuration
    a8008b975890 nvmet-fcloop: swap list_add_tail arguments
    9f5ef4a5eaa6 drm/i915/huc: Fix fence not released on early probe errors
    44984339d38e ata: sata_sx4: Add error handling in pdc20621_i2c_read()
    c17ef974bfcf net: libwx: handle page_pool_dev_alloc_pages error
    9649d08010ff drm/tests: probe-helper: Fix drm_display_mode memory leak
    718a892e2def drm/tests: modes: Fix drm_display_mode memory leak
    cea2c8ace75c drm/tests: cmdline: Fix drm_display_mode memory leak
    742a084c6a9e drm/tests: helpers: Create kunit helper to destroy a drm_display_mode
    0c6550ab45c3 drm/tests: helpers: Fix compiler warning
    85926abafad5 drm/tests: helpers: Add helper for drm_display_mode_from_cea_vic()
    60f481fdf1e7 drm/tests: Add helper to create mock crtc
    af1dccab386f drm/tests: Add helper to create mock plane
    a31fd0eaf75e drm/tests: helpers: Add atomic helpers
    eceb15bbf6ed drm/tests: modeset: Fix drm_display_mode memory leak
    c5ed0eaddcbd net: ethtool: Don't call .cleanup_data when prepare_data fails
    8b158a0d19ed tc: Ensure we have enough buffer space when sending filter netlink notifications
    28f2cd143b5b net/sched: cls_api: conditional notification of events
    aa258dbf4598 rtnl: add helper to check if a notification is needed
    abd07987f7fe rtnl: add helper to check if rtnl group has listeners
    af4e364fb1c3 octeontx2-pf: qos: fix VF root node parent queue index
    2bcad8fefcec net: tls: explicitly disallow disconnect
    2f9761a94bae codel: remove sch->q.qlen check before qdisc_tree_reduce_backlog()
    09c2dcda2c55 tipc: fix memory leak in tipc_link_xmit
    ae7e9d29a3c3 objtool: Fix INSN_CONTEXT_SWITCH handling in validate_unret()
    5b09bf6243b0 ata: pata_pxa: Fix potential NULL pointer dereference in pxa_ata_probe()
    4d4bf6d6b147 drm/i915: Disable RPG during live selftest
    303d76047514 drm/i915/dg2: wait for HuC load completion before running selftests
    8b2148daa73b drm/i915/xelpg: Extend driver code of Xe_LPG to Xe_LPG+
    18520ecc3cfa drm/i915/mocs: use to_gt() instead of direct &i915->gt
    58c1e8c569bd selftests/futex: futex_waitv wouldblock test should fail
    6a5b2ed82152 ARM: dts: am335x-bone-common: Increase MDIO reset deassert time
    ceb5fadbf450 Revert "v6.6 -stable -rt merge fixup"
    1c2962a164ff v6.6 -stable -rt merge fixup
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
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index b98a092ba8..765652e6f5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4e24c0078d347a06de2d385594f2f0973f022d7a"
-SRCREV_meta ?= "79c4bead901471e10fd490024be437feeb562d20"
+SRCREV_machine ?= "a0454499911667c6469f2bb8c66040da8fea3d53"
+SRCREV_meta ?= "60d2dc333c5a027c81bf12f650deebcf4337a5b0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.87"
+LINUX_VERSION ?= "6.6.88"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 93ca6ef039..6cc8d766fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.87"
+LINUX_VERSION ?= "6.6.88"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "27de730c610542bb1cf01401f477bc79ec524e90"
-SRCREV_meta ?= "79c4bead901471e10fd490024be437feeb562d20"
+SRCREV_machine ?= "f152cbb186c26d709c289a33b34ffc1cbf0ab8c2"
+SRCREV_meta ?= "60d2dc333c5a027c81bf12f650deebcf4337a5b0"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 239469e0d1..285285462d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "05feaab2ce4c325c87564949d4bca59b38c31641"
-SRCREV_machine:qemuarm64 ?= "63fc4f3e7d43d60d768645a8b7c39e8791fbedd8"
-SRCREV_machine:qemuloongarch64 ?= "c2cf29e216cebdcdb6352ce8e8d23550bdc9ba2f"
-SRCREV_machine:qemumips ?= "f41ac798fa73c10c1a06f9fe7be4a7f30e7b02c6"
-SRCREV_machine:qemuppc ?= "0a1c77f1b1051f4653530a27d12753af2060963f"
-SRCREV_machine:qemuriscv64 ?= "c2cf29e216cebdcdb6352ce8e8d23550bdc9ba2f"
-SRCREV_machine:qemuriscv32 ?= "c2cf29e216cebdcdb6352ce8e8d23550bdc9ba2f"
-SRCREV_machine:qemux86 ?= "c2cf29e216cebdcdb6352ce8e8d23550bdc9ba2f"
-SRCREV_machine:qemux86-64 ?= "c2cf29e216cebdcdb6352ce8e8d23550bdc9ba2f"
-SRCREV_machine:qemumips64 ?= "e527daa55776fb53eceeedbc59f9a4c97f7eadaf"
-SRCREV_machine ?= "c2cf29e216cebdcdb6352ce8e8d23550bdc9ba2f"
-SRCREV_meta ?= "79c4bead901471e10fd490024be437feeb562d20"
+SRCREV_machine:qemuarm ?= "dd6ce84338d67979d2ca408ca956affc239954c3"
+SRCREV_machine:qemuarm64 ?= "9b9fe6cea58a9ca82a3359bf450cb9b25a9827b0"
+SRCREV_machine:qemuloongarch64 ?= "358824da80133d743605499668f295f00c8e11cb"
+SRCREV_machine:qemumips ?= "072ba5c31caecbaa2a4e999d8fa6cb5d830c4cb1"
+SRCREV_machine:qemuppc ?= "30195da29112099bf74cca8b9a7a4792ebac07ae"
+SRCREV_machine:qemuriscv64 ?= "358824da80133d743605499668f295f00c8e11cb"
+SRCREV_machine:qemuriscv32 ?= "358824da80133d743605499668f295f00c8e11cb"
+SRCREV_machine:qemux86 ?= "358824da80133d743605499668f295f00c8e11cb"
+SRCREV_machine:qemux86-64 ?= "358824da80133d743605499668f295f00c8e11cb"
+SRCREV_machine:qemumips64 ?= "41a26cf54207c045a113a613cf400a4ba52c375c"
+SRCREV_machine ?= "358824da80133d743605499668f295f00c8e11cb"
+SRCREV_meta ?= "60d2dc333c5a027c81bf12f650deebcf4337a5b0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "814637ca257f4faf57a73fd4e38888cce88b5911"
+SRCREV_machine:class-devupstream ?= "23ec0b4057294d86cdefafe373b1f03568f75aff"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.87"
+LINUX_VERSION ?= "6.6.88"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


