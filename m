Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B4FE8FDAC
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 19:37:11 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.138.1696361825599936021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 12:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JYNCQ0G1;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3af5fd13004so886329b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 12:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696361824; x=1696966624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUqKe639/IDA1DrrDASOQX0ETdrEVhIu48aASMJ5Jmk=;
        b=JYNCQ0G1JTlpFKRQlXjyz/xwAwHwzeK1j0bJtnFi94ikSnsjn+vRGJAztawvKUTu/Z
         iwgu9AKcAq3CBOG4kJ3c0LQm0ljIhcmut5VP/QHz6sRCe/befkBPqBV/8MEn81/67OVt
         bTIUPszdGsCBawf/MYHblb/trVsKg45LdWO/9ZXAm1iqyb1G2JEg9ZV7htwmgsUUhdK+
         xDJKcBYs35ZmAyaswbz+WuOrFStHdHafoTB/9C9zAtQeAbPNUDD60ppdC9a7wTi32SCr
         kSKpobDTCFVgvny0Y780pGpcbAZIyb8hKBJkcL5NTjCixGl56tJ/2ULYyu7GlQlYjxmu
         TmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361824; x=1696966624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUqKe639/IDA1DrrDASOQX0ETdrEVhIu48aASMJ5Jmk=;
        b=EppiAqTJc21qwkOvTktOgr0QXBulx4pX0bev9kS6JMnIWqoYSJnB2i1LiJaLxrFSBP
         DXtyNKo5l7FpCSUEJ21rjr62+YjM/I5Ii36nI44CB0QsdNmP0mO8ff/zvBxAXQn/J5et
         cTDItNoMfjnnemN4XnDH1yo+sivK6oGSq5B87b5/lcTqOugzDJhduIQZOfKTFKwTBbjm
         yb1EY6QlqOBHZrTX//BvrxdceM6Qqor3rM5TEn45ittj3uHztoCVe4q5TGSXHrTW9xsp
         YxSN9bxpBCrlZpNMpj+UNVsbIv5kMJAj78mjTvOBswXOCD/aJn6vK/18Gyzr344w4vvI
         R0og==
X-Gm-Message-State: AOJu0YyH7wCj7ng0ITJaBTEw8mpyGG5QiXZ7A8YJt7F6lwRAtz0htVvZ
	KxsjDP9bGSfHiCPLpVl8xJ3TArA09U6Tgdy94/E=
X-Google-Smtp-Source: AGHT+IErobG6kp2sEnYyXaGy/wIHyXZcQTPcjIazYWyqf/F5DHWstoPRMfkmnlmClpGGmF0rA3Luyg==
X-Received: by 2002:a05:6808:1d8:b0:3ae:156f:d329 with SMTP id x24-20020a05680801d800b003ae156fd329mr460406oic.19.1696361824413;
        Tue, 03 Oct 2023 12:37:04 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b0025dc5749b4csm9333642pje.21.2023.10.03.12.37.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:37:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/10] linux-yocto/5.10: update to v5.10.191
Date: Tue,  3 Oct 2023 09:36:44 -1000
Message-Id: <f3db78f6fdc439ba0d3450837d8b3e9052b7d8ca.1696361593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696361593.git.steve@sakoman.com>
References: <cover.1696361593.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 19:37:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188654

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    da742ebfa00c Linux 5.10.191
    3b55ce96efc5 sch_netem: fix issues in netem_change() vs get_dist_table()
    db9d161a0407 alpha: remove __init annotation from exported page_is_ram()
    4af122b5d7b8 scsi: qedf: Fix firmware halt over suspend and resume
    3bb05745cacc scsi: qedi: Fix firmware halt over suspend and resume
    aa9a76d5ffde scsi: core: Fix possible memory leak if device_add() fails
    58889d5ad74c scsi: snic: Fix possible memory leak if device_add() fails
    a370e2d653e5 scsi: 53c700: Check that command slot is not NULL
    1678408d08f3 scsi: storvsc: Fix handling of virtual Fibre Channel timeouts
    267ad381c2fc scsi: core: Fix legacy /proc parsing buffer overflow
    039ce5eb6ba2 netfilter: nf_tables: report use refcount overflow
    93b3195d370a nvme-rdma: fix potential unbalanced freeze & unfreeze
    9ad83e3e6121 nvme-tcp: fix potential unbalanced freeze & unfreeze
    200ae5fa0b7e btrfs: set cache_block_group_error if we find an error
    bd3175f9d597 btrfs: don't stop integrity writeback too early
    c91d822127d3 ibmvnic: Handle DMA unmapping of login buffs in release functions
    9024873b943d ibmvnic: Unmap DMA login rsp buffer on send login fail
    d4750cea76f7 ibmvnic: Enforce stronger sanity checks on login response
    879750c6a7e1 net/mlx5: Allow 0 for total host VFs
    f8510dfa958b dmaengine: mcf-edma: Fix a potential un-allocated memory access
    e8d349408a49 net: hns3: add wait until mac link down
    70660e6faac5 net: hns3: refactor hclge_mac_link_status_wait for interface reuse
    b564f32fb369 net: phy: at803x: remove set/get wol callbacks for AR8032
    0d3573811894 wifi: cfg80211: fix sband iftype data lookup for AP_VLAN
    33c677d1e087 IB/hfi1: Fix possible panic during hotplug remove
    13f7752f4adb drivers: net: prevent tun_build_skb() to exceed the packet size limit
    6d701c95ee64 dccp: fix data-race around dp->dccps_mss_cache
    6d0bd7b7b3a7 bonding: Fix incorrect deletion of ETH_P_8021AD protocol vid from slaves
    5850c391fd7e tunnels: fix kasan splat when generating ipv4 pmtu error
    b3b6b9331abc net/packet: annotate data-races around tp->status
    cafe399d4d50 mISDN: Update parameter type of dsp_cmx_send()
    4f1d1cc16ad3 selftests: forwarding: tc_flower: Relax success criterion
    501e3de09a53 selftests: forwarding: Switch off timeout
    fe8fac37aa73 selftests: forwarding: Skip test when no interfaces are specified
    44a47be97cf2 selftests: forwarding: ethtool_extended_state: Skip when using veth pairs
    0a93fa240d7c selftests: forwarding: ethtool: Skip when using veth pairs
    7e6af9c133c0 selftests: forwarding: Add a helper to skip test when using veth pairs
    e731ad522159 selftests/rseq: Fix build with undefined __weak
    cba47d0c95fb drm/nouveau/disp: Revert a NULL check inside nouveau_connector_get_modes
    98eaa12c967b x86: Move gds_ucode_mitigated() declaration to header
    09f78fc442fa x86/speculation: Add cpu_show_gds() prototype
    5258281a930c x86/mm: Fix VDSO and VVAR placement on 5-level paging machines
    eda9f8ffca46 x86/cpu/amd: Enable Zenbleed fix for AMD Custom APU 0405
    cb1eefc04634 x86/srso: Fix build breakage with the LLVM linker
    df8d390a210f usb: common: usb-conn-gpio: Prevent bailing out if initial role is none
    598ccdb92dec usb: dwc3: Properly handle processing of pending events
    fe7c3a445d22 usb-storage: alauda: Fix uninit-value in alauda_check_media()
    d7e5e2b87f5d binder: fix memory leak in binder_init()
    0439ce5aefcd iio: cros_ec: Fix the allocation size for cros_ec_command
    aa425ee2278d io_uring: correct check for O_TMPFILE
    372072408724 nilfs2: fix use-after-free of nilfs_root in dirtying inodes via iput
    a16c66baa4de x86/pkeys: Revert a5eff7259790 ("x86/pkeys: Add PKRU value to init_fpstate")
    04499d2c973a radix tree test suite: fix incorrect allocation size for pthreads
    db0e1e2abddb hwmon: (pmbus/bel-pfe) Enable PMBUS_SKIP_STATUS_CHECK for pfe1100
    a73d999fdfd9 drm/amd/display: check attr flag before set cursor degamma on DCN3+
    188e8e25ae24 drm/shmem-helper: Reset vma->vm_ops before calling dma_buf_mmap()
    6b6839e440d7 drm/nouveau/gr: enable memory loads on helper invocation on all channels
    002cde0b78d3 riscv,mmio: Fix readX()-to-delay() ordering
    8362ad5367dc dmaengine: pl330: Return DMA_PAUSED when transaction is paused
    7328c5319e08 selftests/bpf: Fix sk_assign on s390x
    b1a3e27d6bfc selftests/bpf: Workaround verification failure for fexit_bpf2bpf/func_replace_return_code
    4af2d9ddb7e7 selftests/bpf: make test_align selftest more robust
    1952a4d5e4cf bpf: aggressively forget precise markings during state checkpointing
    7ca3e7459f4a bpf: stop setting precise in current state
    2474ec58b96d bpf: allow precision tracking for programs with subprogs
    6796c2a0c5fc ipv6: adjust ndisc_is_useropt() to also return true for PIO
    f327f463c7ac mmc: moxart: read scr register without changing byte order
    890ac460b0e8 wireguard: allowedips: expand maximum node depth
    ec585727b63d Linux 5.10.190
    b6fc2fbf8908 x86/CPU/AMD: Do not leak quotient data after a division by 0
    98b7ab5e8d88 ARM: dts: nxp/imx6sll: fix wrong property name in usbphy node
    14f2e2ac731b ARM: dts: imx6sll: fixup of operating points
    f1c928496d2a ARM: dts: imx: add usb alias
    c0e7123e896a wifi: mt76: mt7615: do not advertise 5 GHz on first phy of MT7615D (DBDC)
    37fad83ae527 mt76: mt7615: Fix fall-through warnings for Clang
    b85c7882fd3c mt76: move band capabilities in mt76_phy
    381f7df0f3c3 exfat: check if filename entries exceeds max filename length
    bd3bdb9e0d65 exfat: support dynamic allocate bh for exfat_entry_set_cache
    e0d192a4023e exfat: speed up iterate/lookup by fixing start point of traversing cluster chain
    86e4e949ea81 PM: sleep: wakeirq: fix wake irq arming
    9a320469add4 PM / wakeirq: support enabling wake-up irq after runtime_suspend called
    48d1d0ce0782 soundwire: fix enumeration completion
    7d949774e7c1 soundwire: bus: pm_runtime_request_resume on peripheral attachment
    662735bc1127 soundwire: bus: add better dev_dbg to track complete() calls
    173d9c7090db selftests/rseq: Play nice with binaries statically linked against glibc 2.35+
    c08de20e7041 selftests/rseq: check if libc rseq support is registered
    fbb6657037d4 powerpc/mm/altmap: Fix altmap boundary check
    1f09d67d3906 mtd: rawnand: fsl_upm: Fix an off-by one test in fun_exec_op()
    027710952b53 mtd: rawnand: omap_elm: Fix incorrect type in assignment
    d328849fb63b ext2: Drop fragment support
    7e4e87ec56aa fs: Protect reconfiguration of sb read-write from racing writes
    ec0d0be41721 net: usbnet: Fix WARNING in usbnet_start_xmit/usb_submit_urb
    06f87c96216b Bluetooth: L2CAP: Fix use-after-free in l2cap_sock_ready_cb
    7f740bc696d4 fs/sysv: Null check to prevent null-ptr-deref bug
    426656e8dd03 tracing: Fix sleeping while atomic in kdb ftdump
    4f86da9abe31 file: reinstate f_pos locking optimization for regular files
    d39971d902d0 drm/ttm: check null pointer before accessing when swapping
    c9c78b91c783 open: make RESOLVE_CACHED correctly test for O_TMPFILE
    3048cb0dc0cc bpf: Disable preemption in bpf_event_output
    33a339e717be net: tap_open(): set sk_uid from current_fsuid()
    5ea23f1cb67e net: tun_chr_open(): set sk_uid from current_fsuid()
    8d104bfd41a9 arm64: dts: stratix10: fix incorrect I2C property for SCL signal
    8625802a1ba8 mtd: rawnand: meson: fix OOB available bytes for ECC
    82dc2bffeabc mtd: spinand: toshiba: Fix ecc_get_status
    ddf7cc702973 exfat: release s_lock before calling dir_emit()
    79d16a84ea41 exfat: use kvmalloc_array/kvfree instead of kmalloc_array/kfree
    a4b2673e3c04 ceph: defer stopping mdsc delayed_work
    b5b39ff6917f USB: zaurus: Add ID for A-300/B-500/C-700
    513bfdde8a3b libceph: fix potential hang in ceph_osdc_notify()
    181274d2f3de scsi: zfcp: Defer fc_rport blocking until after ADISC response
    6d9f5f3d8920 tcp_metrics: fix data-race in tcpm_suck_dst() vs fastopen
    05d1dc88c40f tcp_metrics: annotate data-races around tm->tcpm_net
    079afb181504 tcp_metrics: annotate data-races around tm->tcpm_vals[]
    57bcbbb208a0 tcp_metrics: annotate data-races around tm->tcpm_lock
    289091eef30f tcp_metrics: annotate data-races around tm->tcpm_stamp
    420aad608f72 tcp_metrics: fix addr_same() helper
    80e9488ece3d net/mlx5: fs_core: Skip the FTs in the same FS_TYPE_PRIO_CHAINS fs_prio
    7a634336a03b net/mlx5: fs_core: Make find_closest_ft more generic
    c650597647ec vxlan: Fix nexthop hash size
    1683124129a4 ip6mr: Fix skb_under_panic in ip6mr_cache_report()
    c33d5a5c5b2c s390/qeth: Don't call dev_close/dev_open (DOWN/UP)
    8e309f43d0ca net: dcb: choose correct policy to parse DCB_ATTR_BCN
    6d4f24736df9 net: netsec: Ignore 'phy-mode' on SynQuacer in DT mode
    216092963ce5 net: ll_temac: fix error checking of irq_of_parse_and_map()
    20fe059c1d47 net: ll_temac: Switch to use dev_err_probe() helper
    a0e42f4bd496 bpf: sockmap: Remove preempt_disable in sock_map_sk_acquire
    aaa71c4e8ad9 net/sched: cls_route: No longer copy tcf_result on update to avoid use-after-free
    a8d478200b10 net/sched: cls_fw: No longer copy tcf_result on update to avoid use-after-free
    b4256c99a711 net/sched: cls_u32: No longer copy tcf_result on update to avoid use-after-free
    268b29ef1947 net: add missing data-race annotation for sk_ll_usec
    ad417bab9d5b net: add missing data-race annotations around sk->sk_peek_off
    11e0590af333 net: add missing READ_ONCE(sk->sk_rcvbuf) annotation
    dc20f7bada00 net: add missing READ_ONCE(sk->sk_sndbuf) annotation
    427c611d846d net: add missing READ_ONCE(sk->sk_rcvlowat) annotation
    c7ebe08f4081 net: annotate data-races around sk->sk_max_pacing_rate
    14db69381dd8 mISDN: hfcpci: Fix potential deadlock on &hc->lock
    d163337bef20 net: sched: cls_u32: Fix match key mis-addressing
    e68929f11b19 perf test uprobe_from_different_cu: Skip if there is no gcc
    eb8031b7ce0c net: dsa: fix value check in bcm_sf2_sw_probe()
    abb0172fa8dc rtnetlink: let rtnl_bridge_setlink checks IFLA_BRIDGE_MODE length
    6b93c510684a bpf: Add length check for SK_DIAG_BPF_STORAGE_REQ_MAP_FD parsing
    2cf67912078f net/mlx5e: fix return value check in mlx5e_ipsec_remove_trailer()
    165159854757 net/mlx5: DR, fix memory leak in mlx5dr_cmd_create_reformat_ctx
    ef3d0a732d69 wifi: cfg80211: Fix return value in scan logic
    b4bdcbc0e391 KVM: s390: fix sthyi error handling
    4241cfc973ad word-at-a-time: use the same return type for has_zero regardless of endianness
    94f8447ab802 arm64: dts: imx8mn-var-som: add missing pull-up for onboard PHY reset pinmux
    832a4d4cdb3f loop: Select I/O scheduler 'none' from inside add_disk()
    3f7395c38204 perf: Fix function pointer case
    a883b98dc737 io_uring: gate iowait schedule on having pending requests
    058c0cbd251a x86/kprobes: Fix JNG/JNLE emulation
    edc2ac7c7265 x86/kprobes: Update kcb status flag after singlestepping
    f07f3938c813 x86/kprobes: Move 'inline' to the beginning of the kprobe_is_ss() declaration
    2b5afe25f5b6 x86/kprobes: Fix to identify indirect jmp and others using range case
    ba7d1dae9fe8 x86/kprobes: Use int3 instead of debug trap for single-step
    2c57553a77e1 x86/kprobes: Identify far indirect JMP correctly
    41db23bad952 x86/kprobes: Retrieve correct opcode for group instruction
    ff97a14c8a86 x86/kprobes: Do not decode opcode in resume_execution()
    5601d812c8d8 kprobes/x86: Fix fall-through warnings for Clang
    7a413fa04726 ASoC: cs42l51: fix driver to properly autoload with automatic module loading
    4d360a819453 io_uring: treat -EAGAIN for REQ_F_NOWAIT as final for io-wq
    9164e27c5a8e selftests: mptcp: depend on SYN_COOKIES
    f0acd6c3a2cd cpufreq: intel_pstate: Drop ACPI _PSS states table patching
    a241fc02f1ce ACPI: processor: perflib: Avoid updating frequency QoS unnecessarily
    ad938dd2af28 ACPI: processor: perflib: Use the "no limit" frequency QoS
    4148f28f9824 drm/ttm: make ttm_bo_unpin more defensive
    c0f2b2b02096 dm cache policy smq: ensure IO doesn't prevent cleaner policy progress
    aae65b1793bb ceph: never send metrics if disable_send_metrics is set
    4f669618c99f ASoC: wm8904: Fill the cache for WM8904_ADC_TEST_0 register
    c837f121bc98 s390/dasd: fix hanging device after quiesce/resume
    276738b382cf virtio-net: fix race between set queues and probe
    3d10481a90c3 btrfs: check if the transaction was aborted at btrfs_wait_for_commit()
    fc511ae405f7 staging: r8712: Fix memory leak in _r8712_init_xmit_priv()
    223ecf871b42 staging: rtl8712: Use constants from <linux/ieee80211.h>
    836b13168336 KVM: VMX: Don't fudge CR0 and CR4 for restricted L2 guest
    c710ff061237 KVM: nVMX: Do not clear CR3 load/store exiting bits if L1 wants 'em
    7fc51da40b9d KVM: VMX: Fold ept_update_paging_mode_cr0() back into vmx_set_cr0()
    96c73bc9efef KVM: VMX: Invert handling of CR0.WP for EPT without unrestricted guest
    90cd5ab951ea irqchip/gic-v4.1: Properly lock VPEs when doing a directLPI invalidation
    57b8db5800a5 irq-bcm6345-l1: Do not assume a fixed block to cpu mapping
    b1867cddd780 tpm_tis: Explicitly check for error code
    5be81139d2ff nfsd: Remove incorrect check in nfsd4_validate_stateid
    4a871fcebc02 file: always lock position for FMODE_ATOMIC_POS
    c5c797ccc3b5 btrfs: check for commit error at btrfs_attach_transaction_barrier()
    5e0e4e72ca21 hwmon: (nct7802) Fix for temp6 (PECI1) processed even if PECI1 disabled
    7c6df7f0fc3d ALSA: hda/relatek: Enable Mute LED on HP 250 G8
    8fc0eabaa73b tty: n_gsm: fix UAF in gsm_cleanup_mux
    caac4b6c15b6 staging: ks7010: potential buffer overflow in ks_wlan_set_encode_ext()
    baef414b1ca0 Documentation: security-bugs.rst: clarify CVE handling
    0d5b23743bed Documentation: security-bugs.rst: update preferences when dealing with the linux-distros group
    65cd02e3c37e Revert "usb: xhci: tegra: Fix error check"
    b0fd110578e7 usb: xhci-mtk: set the dma max_seg_size
    d0b588bbe4d9 USB: quirks: add quirk for Focusrite Scarlett
    66a622275a11 usb: ohci-at91: Fix the unhandle interrupt when resume
    96c433aff5fd usb: dwc3: don't reset device side if dwc3 was configured as host-only
    05b201de4418 usb: dwc3: pci: skip BYT GPIO lookup table for hardwired phy
    75ad45cef699 Revert "usb: dwc3: core: Enable AutoRetry feature in the controller"
    bf468806b63f can: gs_usb: gs_can_close(): add missing set of CAN state to CAN_STATE_STOPPED
    d5db33a667f5 USB: serial: simple: sort driver entries
    81c54eef1dd7 USB: serial: simple: add Kaufmann RKS+CAN VCP
    fca2a74eee5a USB: serial: option: add Quectel EC200A module support
    c704cb21138b USB: serial: option: support Quectel EM060K_128
    1037ee1dbf73 serial: sifive: Fix sifive_serial_console_setup() section
    6209a7383d3a serial: 8250_dw: Preserve original value of DLF register
    9e671a6116f4 serial: qcom-geni: drop bogus runtime pm state update
    68e6287ac61d USB: gadget: Fix the memory leak in raw_gadget driver
    da1b105dc66d Revert "usb: gadget: tegra-xudc: Fix error check in tegra_xudc_powerdomain_init()"
    a6d2fd1703cd tracing: Fix warning in trace_buffered_event_disable()
    0efbdbc4530c ring-buffer: Fix wrong stat of cpu_buffer->read
    e410839c0cd8 ata: pata_ns87415: mark ns87560_tf_read static
    82ce0ae87a96 dm raid: protect md_stop() with 'reconfig_mutex'
    d6a1cf4ee5eb dm raid: clean up four equivalent goto tags in raid_ctr()
    a43c761a7e1c dm raid: fix missing reconfig_mutex unlock in raid_ctr() error paths
    d82bfe9686f3 block: Fix a source code comment in include/uapi/linux/blkzoned.h
    ab6d14bc4041 ASoC: fsl_spdif: Silence output on stop
    94bac776cd27 drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in a5xx_submit_in_rb()
    b0100bdb9dcd RDMA/mthca: Fix crash when polling CQ for shared QPs
    62a8a4cafa96 drm/msm/adreno: Fix snapshot BINDLESS_DATA size
    5c9e03b86756 drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
    08aa5a5297e6 RDMA/mlx4: Make check for invalid flags stricter
    9d1fd118bcb4 tipc: stop tipc crypto on failure in tipc_node_create
    d03de937765f tipc: check return value of pskb_trim()
    3661bab5afcb benet: fix return value check in be_lancer_xmit_workarounds()
    f40f7a858b3b net/sched: mqprio: Add length check for TCA_MQPRIO_{MAX/MIN}_RATE64
    3ed3729a6a8e net/sched: mqprio: add extack to mqprio_parse_nlattr()
    6227b461542f net/sched: mqprio: refactor nlattr parsing to a separate function
    308a43f1521d netfilter: nf_tables: disallow rule addition to bound chain via NFTA_RULE_CHAIN_ID
    ab5a97a94b57 netfilter: nf_tables: skip immediate deactivate in _PREPARE_ERROR
    7782ce022fea netfilter: nftables: add helper function to validate set element data
    893cb3c3513c netfilter: nft_set_rbtree: fix overlap expiration walk
    89060b831c41 platform/x86: msi-laptop: Fix rfkill out-of-sync on MSI Wind U100
    75f57acda32f team: reset team's flags when down link is P2P device
    de982f46be83 bonding: reset bond's flags when down link is P2P device
    b2712c4bfc3b ice: Fix memory management in ice_ethtool_fdir.c
    0cd74fbd3b83 tcp: Reduce chance of collisions in inet6_hashfn().
    b55a2b34b1b6 ipv6 addrconf: fix bug where deleting a mngtmpaddr can create a new temporary address
    5a3c92968223 ethernet: atheros: fix return value check in atl1e_tso_csum()
    ad249aa3c38f phy: hisilicon: Fix an out of bounds check in hisi_inno_phy_probe()
    6f26f1457377 vxlan: calculate correct header length for GPE
    d2741769d512 vxlan: move to its own directory
    076f786f0414 net: hns3: fix wrong bw weight of disabled tc issue
    344b7c000398 net: hns3: reconstruct function hclge_ets_validate()
    111b699300a7 net: phy: marvell10g: fix 88x3310 power up
    8a6cc852f658 i40e: Fix an NULL vs IS_ERR() bug for debugfs_create_dir()
    39c789c9570d media: staging: atomisp: select V4L2_FWNODE
    fb1db979043a phy: qcom-snps-femto-v2: properly enable ref clock
    ffebc22bdd08 phy: qcom-snps-femto-v2: keep cfg_ahb_clk enabled during runtime suspend
    f34090579a8b phy: qcom-snps: correct struct qcom_snps_hsphy kerneldoc
    ceba255a791b phy: qcom-snps: Use dev_err_probe() to simplify code
    ed3d841f2fc2 ext4: fix to check return value of freeze_bdev() in ext4_shutdown()
    e3454b438c67 pwm: meson: fix handling of period/duty if greater than UINT_MAX
    b306d09967ca pwm: meson: Simplify duplicated per-channel tracking
    840ce9cfc86f tracing: Show real address for trace event arguments
    8996b13051f0 drm/ttm: never consider pinned BOs for eviction&swap
    5f6d5b58c59e drm/ttm: add ttm_bo_pin()/ttm_bo_unpin() v2
    1815d9bf02b7 fs: dlm: interrupt posix locks only when process is killed
    0f6741acfd5b dlm: rearrange async condition return
    793123331007 dlm: cleanup plock_op vs plock_xop
    838d6e86ec74 PCI/ASPM: Avoid link retraining race
    9f283ca643dd PCI/ASPM: Factor out pcie_wait_for_retrain()
    ffc0ee491f04 PCI/ASPM: Return 0 or -ETIMEDOUT from pcie_retrain_link()
    9fd349c8858e i2c: nomadik: Remove a useless call in the remove function
    a7ab5d7943b5 i2c: nomadik: Use devm_clk_get_enabled()
    ec954a4ab0c8 i2c: nomadik: Remove unnecessary goto label
    04b114067849 i2c: Improve size determinations
    41e90f0e50f5 i2c: Delete error messages for failed memory allocations
    52df40a5c71e btrfs: fix extent buffer leak after tree mod log failure at split_node()
    52403c3dad20 btrfs: fix race between quota disable and relocation
    3069fc0326b8 gpio: tps68470: Make tps68470_gpio_output() always set the initial value
    22786d53817d io_uring: don't audit the capability check in io_uring_create()
    8e635da0e0d3 KVM: s390: pv: fix index value of replaced ASCE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 772ffac071..09eb7d1d17 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "63fd205e5d1e048a576d5ba03cdbdf5782a2f6b4"
-SRCREV_meta ?= "603507f09e4a22a650e37fb9dcfbcb69ceb36841"
+SRCREV_machine ?= "5204a0cb3d9b9a5512aad3f5e2483311b8834bb2"
+SRCREV_meta ?= "f16f63fae82fd0565f9314a61ae6be1d0509eb24"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.189"
+LINUX_VERSION ?= "5.10.191"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index aebec33555..4afb182d18 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.189"
+LINUX_VERSION ?= "5.10.191"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "8f8fe5c5719959ad536be166937fc22606b7a7f3"
-SRCREV_machine ?= "452190ae123212f7d3c233fc48419c60874f4223"
-SRCREV_meta ?= "603507f09e4a22a650e37fb9dcfbcb69ceb36841"
+SRCREV_machine:qemuarm ?= "cb953c5b7e239e63ec26076f412644875ae00f2c"
+SRCREV_machine ?= "e6837b01492363eeec6fb51e8ea923e046594f1d"
+SRCREV_meta ?= "f16f63fae82fd0565f9314a61ae6be1d0509eb24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 81dce1a513..f9cb15dc16 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0f9599a793f23d2e1cd2da30aba53c4876b3621d"
-SRCREV_machine:qemuarm64 ?= "358a41898b853ccfc3309fcf30a95621b3d15ec6"
-SRCREV_machine:qemumips ?= "8ad0f4fa028c844dbc6f32321664488e50bd5e64"
-SRCREV_machine:qemuppc ?= "4f0a30a5edc13b65482bb788d1a2eb7a5405190a"
-SRCREV_machine:qemuriscv64 ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
-SRCREV_machine:qemuriscv32 ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
-SRCREV_machine:qemux86 ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
-SRCREV_machine:qemux86-64 ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
-SRCREV_machine:qemumips64 ?= "a01ff251fdd19b1ab7ee109c7ee2213e6b01a28b"
-SRCREV_machine ?= "fc99f5e7ce23e4814c7b41f24c5d0296754be89e"
-SRCREV_meta ?= "603507f09e4a22a650e37fb9dcfbcb69ceb36841"
+SRCREV_machine:qemuarm ?= "e8c5b2165b5bfcef1358cd6fa70368fc174ac2f4"
+SRCREV_machine:qemuarm64 ?= "d8165863c5d9467c555ef97318193595242b85a7"
+SRCREV_machine:qemumips ?= "54bad1b3d7ed3c3cf1ccb98ee21ae2ed059c20b0"
+SRCREV_machine:qemuppc ?= "7ab0ce8ef9f6f1b4c12f3594b1f410f84ef35bfa"
+SRCREV_machine:qemuriscv64 ?= "c723f1548ae98a23895a85e67466df935d09e594"
+SRCREV_machine:qemuriscv32 ?= "c723f1548ae98a23895a85e67466df935d09e594"
+SRCREV_machine:qemux86 ?= "c723f1548ae98a23895a85e67466df935d09e594"
+SRCREV_machine:qemux86-64 ?= "c723f1548ae98a23895a85e67466df935d09e594"
+SRCREV_machine:qemumips64 ?= "702fe224e3553677ba09d28e45b7eaee31c667f4"
+SRCREV_machine ?= "c723f1548ae98a23895a85e67466df935d09e594"
+SRCREV_meta ?= "f16f63fae82fd0565f9314a61ae6be1d0509eb24"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.189"
+LINUX_VERSION ?= "5.10.191"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


