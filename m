Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D175EC44524
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 16:01:01 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.884.1784563251505505537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 09:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YPwMAgVB;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-96944741eaeso2527564241.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784563250; x=1785168050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rEr5ghVtJ7+CraJVeb+qNL+lcq9WBY6cH4kcMnqAUb0=;
        b=YPwMAgVB8oPkMOZhqDqjrpSAPUiUifoXolPpg4VtXmIDRSJw1eZ2YW4C9E8vrNF74X
         SZUr0U7r1r6MRz97loLM1O1zI7zOIZzWNBTiBSAF86VVeH9K+WD0UtEG6tHojJee4o6i
         0wB7cWCDI2HKVNQKnvSFcbvRqQLdERLlKCT9DMRvsXgGy4GbPnp/CsRH1WclVlaCb2Fy
         ZCpGLLMNXb71zoaaP9UkfH1F9YXHiGZ5TkYcMAdfbmC0QM15vwmAJghAqb4q5szU/Zkj
         N0Y8fMHqwtYuiWx71J3i3AosSAUSZNGPUoULtCM04tIol9U5AobzFrDUgAOAuJy9xXSw
         rvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784563250; x=1785168050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEr5ghVtJ7+CraJVeb+qNL+lcq9WBY6cH4kcMnqAUb0=;
        b=Xdp03V+lWBAPXzZNP+HlHrI1E5A/lN4JmH1DDtOGlrStYRoVXH+PeyrCiPDl8dlCfp
         Xjz8YO2AjegaLDjKAbG+NV1f8B0H2SZND8Mc5uXt5W5aPDu+HT/w5YyIXAbrcbemm+mI
         xpF3RyjJo48xKhDouKmgaYYSs6mDp3u5PGYILy9fzkOOhWCNVYwfDPykq8VxC1w/QOEM
         X8QQgq9K66gJ0eEREZyBC+gvDvrdmRVpl+/TB8PvaBfXV9woYyFqMLPJCTlB8CSizgI2
         NrrNczHB/Rn60utp43ISRk4sQJ1TftUk3Axvh+1DGfmg6cBwlH2YZJXztKSucMM7f2pF
         aEoA==
X-Gm-Message-State: AOJu0YyfZ/pzehjcc3aPuaX/tfF4ryD1NkfnqHX1M+k1sfGWa/F5CtCk
	ov0s/7hSk15ex5iCCvISKR8ycg+UZgaGwRIJ6Kvryefq738yQ/Cevvkt
X-Gm-Gg: AfdE7ckE4H4hTqkLZ0KVHRXeB2rVPCPXMXK5Hj9RAcyRrVp0jcBlS9IF0UL4nl6HaN8
	8ZpfzeodlpYv8GTZj5j7y1e9mJDVTlu9UYy/W9G6WEtgLIanSKx7EZ0xmBBUFwxZ3Jmns6RyAfu
	SiWX/9jgkjp9MW17pxLDq+w5VauEfx4Sk5i+I2bG0TpD/Rl/YsPbhDiELdXdX8tqeqHKPinBusk
	W+M/u4Fbjo+aOtXm1sxurHxsbjCg7Gm60S/Bf3scYdmRcuKjDArr3h3bNdjmzm9bltu9C0Q9RnH
	ltjQK4fgOC+ZU1TdQw31yMFNamqnLh3X+9b2w3aeHin8nh90wpt8y91rvUSPIzkdqKzhDnGLIxD
	niFJEXQ+9uKMW7btgN2ZsA003huX1S3gjNxUIEI+kQ8l40G5B9iCS/mvMAiiUii28B1r3YJWvxE
	fg86nBhyBCZOtooQoa8KaBHO+/VpldXNa7lovZlukiGjfLGwjliS8HMjkjqDoeFT9rIFAHDVPoE
	H8fk7SedSYR509RPw2ChM/VBCoPJbWjuc2Ffn9BDuTQEw48XmvDi9q+n6Z+45JVWJfqyF8FUC28
	MEdjfKzyookvoC+z7y544jQ=
X-Received: by 2002:a05:6102:1510:b0:740:2974:1b19 with SMTP id ada2fe7eead31-747534657e5mr3362185137.4.1784563248816;
        Mon, 20 Jul 2026 09:00:48 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-747581b09absm8486374137.8.2026.07.20.09.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:00:47 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][scarthgap][PATCH 01/02] linux-yocto/6.6: update to v6.6.143
Date: Mon, 20 Jul 2026 12:00:44 -0400
Message-ID: <20260720160045.569687-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 16:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241423

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    d1cfde2d5d15 Linux 6.6.143
    726abf975668 netfilter: require Ethernet MAC header before using eth_hdr()
    05bd072e97fe x86/CPU/AMD: Rename init_amd_zn() to init_amd_zen_common()
    4a83b435acf8 x86/CPU/AMD: Call the spectral chicken in the Zen2 init function
    5e0c93dca433 x86/CPU/AMD: Move the Zen3 BTC_NO detection to the Zen3 init function
    217f53b5e3c6 Revert "selftest/ptp: update ptp selftest to exercise the gettimex options"
    189c7e57826f mptcp: fix missing wakeups in edge scenarios
    c12e67a0ef93 mptcp: add-addr: always drop other suboptions
    1111ab94fd49 arm64: errata: Mitigate TLBI errata on Microsoft Azure Cobalt 100 CPU
    e5b6bdc3d8b8 arm64: errata: Mitigate TLBI errata on NVIDIA Olympus CPU
    e717a4d08779 arm64: errata: Mitigate TLBI errata on various Arm CPUs
    baf63e6a6435 arm64: cputype: Add C1-Premium definitions
    1e4a5225b4d3 arm64: cputype: Add C1-Ultra definitions
    f58e88f8653f arm64: cputype: Add NVIDIA Olympus definitions
    2602d4b53925 ALSA: hda/hdmi: Add quirk for TUXEDO IBS14G6
    9aa7edc1347b ipvs: skip ipv6 extension headers for csum checks
    2de5c8eea0a9 net: bonding: fix use-after-free in bond_xmit_broadcast()
    8fe0231adebe RDMA/umem: Fix truncation for block sizes >= 4G
    3faebd387ed1 RDMA: Move DMA block iterator logic into dedicated files
    a7c6be320c0e RDMA/umem: fix kernel-doc warnings
    09dc18894148 RDMA: During rereg_mr ensure that REREG_ACCESS is compatible
    09b8a7aa5a34 hv_netvsc: use kmap_local_page in netvsc_copy_to_send_buf
    77b73b54801a mm/memory-failure: fix hugetlb_lock AA deadlock in get_huge_page_for_hwpoison
    252bb328b36f mm/memory-failure: fix missing ->mf_stats count in hugetlb poison
    05f1ad6d62a3 mm/hugetlb: rename folio_putback_active_hugetlb() to folio_putback_hugetlb()
    471f5d78ea4b mm/migrate: don't call folio_putback_active_hugetlb() on dst hugetlb folio
    411fa5113da0 mm/hugetlb: rename isolate_hugetlb() to folio_isolate_hugetlb()
    eb8a8124484d netfilter: nft_fib: fix stale stack leak via the OIFNAME register
    46582b0fd381 usb: typec: ucsi: Don't update power_supply on power role change if not connected
    c91ea13375f7 serial: qcom_geni: fix kfifo underflow when flush precedes DMA completion IRQ
    d3e9b79aa794 scsi: target: iscsi: Fix CRC overread and double-free in iscsit_handle_text_cmd()
    b4621e5ef634 thunderbolt: property: Cap recursion depth in __tb_property_parse_dir()
    078c11224c7f usb: typec: ucsi: Check if power role change actually happened before handling
    e15c414092b3 usb: gadget: uvc: hold opts->lock across XU walks in uvc_function_bind
    5542d2c35930 usb: dwc3: xilinx: fix error handling in zynqmp init error paths
    b987f380620b usb: musb: omap2430: Fix use-after-free in omap2430_probe()
    a9c22e0f93ba tty: serial: samsung: Remove redundant port lock acquisition in rx helpers
    8809b7941c4a tty: serial: samsung: use u32 for register interactions
    33da47d4a003 serial: samsung_tty: Use port lock wrappers
    1cdb07d8946c ALSA: firewire-motu: Protect register DSP event queue positions
    b3f4f82d1315 memfd: deny writeable mappings when implying SEAL_WRITE
    2619d9d2aac3 iio: dac: ad5686: fix ref bit initialization for single-channel parts
    f8dcef820161 usb: cdns3: plat: fix leaked usb2_phy initialization on usb3_phy acquisition failure
    e85bc501947f iio: chemical: scd30: fix division by zero in write_raw
    73d8bf36f217 iio: chemical: scd30: Use guard(mutex) to allow early returns
    86298fb6829c iio: gyro: adis16260: fix division by zero in write_raw
    b35e71b7cc7a mptcp: handle first subflow closing consistently
    792fa6eee73e Bluetooth: hci_qca: Convert timeout from jiffies to ms
    c3fc351d256c Bluetooth: hci_qca: Migrate to serdev specific shutdown function
    123724bb6ee5 serdev: Provide a bustype shutdown function
    ca2f48b9c03d serdev: make serdev_bus_type const
    c0e37017a452 mm/damon/sysfs-schemes: delete tried region in regions_rmdirs()
    e7af1b15c884 mm/memory: fix spurious warning when unmapping device-private/exclusive pages
    fe76413677e7 mptcp: do not drop partial packets
    293b0e63136b mptcp: introduce the mptcp_init_skb helper
    681d14ef45b1 iio: adc: npcm: fix unbalanced clk_disable_unprepare()
    4ed1366f9f90 iio: adc: npcm: Convert to platform remove callback returning void
    d766a49d9b55 arm64: tlb: Flush walk cache when unsharing PMD tables
    4c29603498b0 octeontx2-pf: avoid double free of pool->stack on AQ init failure
    26342087fac9 af_unix: Fix UAF read of tail->len in unix_stream_data_wait()
    db9389042db4 af_unix: Cache state->msg in unix_stream_read_generic().
    c2c764b00c0f rxrpc: Fix RESPONSE packet verification to extract skb to a linear buffer
    a05bf6d9e621 rxrpc: Fix DATA decrypt vs splice() by copying data to buffer in recvmsg
    7713f4aafb57 net: hsr: defer node table free until after RCU readers
    1dca7e491f07 ipv6: ioam: add NULL check for idev in ipv6_hop_ioam()
    dcc42d701529 ipv6/addrconf: annotate data-races around devconf fields (II)
    ada8dcfd5298 mptcp: pm: fix ADD_ADDR timer infinite retry on option space insufficient
    04318e252c58 ice: fix VF queue configuration with low MTU values
    d37a60086ee7 selftests: mptcp: drop nanoseconds width specifier
    00ffe9893f4b mptcp: reset rcv wnd on disconnect
    1521fecf44fc mptcp: cleanup fallback dummy mapping generation
    78f9d747f386 mptcp: use plain bool instead of custom binary enum
    e043017ac429 octeontx2-af: CGX: add bounds check to cgx_speed_mbps index
    1132ca7a1ba8 octeontx2-af: replace deprecated strncpy with strscpy
    557edaf01062 platform/x86/intel/vsec: Fix enable_cnt imbalance on PCIe error recovery
    969bc6370334 smb: client: require net admin for CIFS SWN netlink
    e19eff331240 genetlink: Use internal flags for multicast groups
    14897ef9341c cgroup/cpuset: Reset DL migration state on can_attach() failure
    850452af77f5 ksmbd: fix OOB write in QUERY_INFO for compound requests
    6d8f52f3f80a fbdev/vt8500lcdfb: Initialize fb_ops with fbdev macros
    666bd0598f37 ipmi:ssif: NULL thread on error
    318a0403b270 ipmi:ssif: Remove unnecessary indention
    ae9d4caf6f13 mm/huge_memory: update file PMD counter before folio_put()
    310a8cc74612 soc: qcom: ice: Fix race between qcom_ice_probe() and of_qcom_ice_get()
    428a33573dcb mm/hugetlb: avoid false positive lockdep assertion
    000e8f55fbc7 driver core: reject devices with unregistered buses
    b5fa9e32fb67 fs/fcntl: fix SOFTIRQ-unsafe lock order in fasync signaling
    201151e120f0 drm/amd/display: Use krealloc_array() in dal_vector_reserve()
    7fc4fab4acc3 drm/amd/display: Fix NULL deref and buffer over-read in SDP debugfs
    4d1c3c26c2ab drm/amd/display: Clamp VBIOS HDMI retimer register count to array size
    79e0273272a0 drm/amd/display: Clamp HDMI HDCP2 rx_id_list read to buffer size
    3fe2c6af3f51 drm/amdgpu: restart the CS if some parts of the VM are still invalidated
    16dad1fb0d78 drm/amdkfd: Fix buffer overflow in SDMA queue checkpoint/restore on GFX11
    62bd09e23a23 drm/amdkfd: fix NULL dereference in get_queue_ids()
    d54a221b0f3c slimbus: qcom-ngd-ctrl: Avoid ABBA on tx_lock/ctrl->lock
    9f4a76c7e9fa slimbus: qcom-ngd-ctrl: fix OF node refcount
    fc261397295b thunderbolt: Limit XDomain response copy to actual frame size
    0dd61ba03d05 thunderbolt: Validate XDomain request packet size before type cast
    5db10c8ad8c0 thunderbolt: Clamp XDomain response data copy to allocation size
    4d0b1524caad thunderbolt: Bound root directory content to block size
    5f56bc6bddff thunderbolt: Reject zero-length property entries in validator
    7dd9a42b044a sctp: stream: fully roll back denied add-stream state
    e97c2a535e23 sctp: diag: reject stale associations in dump_one path
    7e60d675288d mmc: sdhci: add signal voltage switch in sdhci_resume_host
    b46521877611 mmc: renesas_sdhi: Add OF entry for RZ/G2H SoC
    6dc14b9b431e mmc: litex_mmc: Set mandatory idle clocks before CMD0
    30e727657185 mmc: core: Fix host controller programming for fixed driver type
    8d6e1dd3ad13 mm/hugetlb: restore reservation on error in hugetlb folio copy paths
    f0ca9c7f44a9 octeontx2-af: fix memory leak in rvu_setup_hw_resources()
    033d498b0f47 nvmem: layouts: onie-tlv: fix hang on unknown types
    e7cf30aa5f1f net: rds: clear i_sends on setup unwind
    1ccad3ee7998 net: mv643xx: fix OF node refcount
    a629418d463f net: bonding: fix NULL pointer dereference in bond_do_ioctl()
    c090df5be6bc net/mlx5: Reorder completion before putting command entry in cmd_work_handler
    8fb4a23df5b7 misc: fastrpc: Fix NULL pointer dereference in rpmsg callback
    d3e26df2e8eb misc: fastrpc: fix DMA address corruption due to find_vma misuse
    8b080c891831 misc: fastrpc: fix use-after-free race in fastrpc_map_create
    df08fadcf0e5 misc: fastrpc: fix use-after-free of fastrpc_user in workqueue context
    6560be3f6a5b ipc/shm: serialize orphan cleanup with shm_nattch updates
    7a395a147f06 Input: atkbd - skip deactivate for HONOR BCC-N's internal keyboard
    81d60181ed55 Input: atkbd - add DMI quirk for Lenovo Yoga Air 14 (83QK)
    2d175d6aae9c i2c: tegra: Fix NOIRQ suspend/resume
    5bebff5e8492 i2c: stm32f7: fix timing computation ignoring i2c-analog-filter
    7107627b8b35 i2c: qcom-cci: Fix NULL pointer dereference in cci_remove()
    dd92773d4d9c fuse: reject fuse_notify() pagecache ops on directories
    254c469a404a pidfd: refuse access to tasks that have started exiting harder
    0e823ca0e739 inet: frags: fix use-after-free caused by the fqdir_pre_exit() flush
    c1234229399f IB/isert: Reject login PDUs shorter than ISER_HEADERS_LEN
    1a418ad0e5e5 bnxt_en: Fix NULL pointer dereference
    6f5285a6054a ASoC: fsl_sai: Fix 32 slots TDM broken by integer shift UB in xMR write
    dfd853197615 vsock/vmci: fix sk_ack_backlog leak on failed handshake
    688fcac7054a wifi: nl80211: reject oversized EMA RNR lists
    eb13ab2f66e2 selftests: mptcp: add test for extra_subflows underflow on userspace PM
    026c4a70e2a9 mptcp: sockopt: check timestamping ret value
    b1fd13074f22 mptcp: allow subflow rcv wnd to shrink
    907ac6b1658e mptcp: close TOCTOU race while computing rcv_wnd
    f2c9012fc115 mptcp: fix retransmission loop when csum is enabled
    c2e3aadc8fef ARM: 9475/1: entry: use byte load for KASAN VMAP stack shadow
    b6290cc96dc8 ARM: 9474/1: io: avoid KASAN instrumentation of raw halfword I/O
    c35c0763af34 ARM: socfpga: Fix OF node refcount leak in SMP setup
    1b585673a224 udp: clear skb->dev before running a sockmap verdict
    0c2821665ff7 zram: fix use-after-free in zram_bvec_write_partial()
    0d64bc200ebe RDMA/srp: bound SRP_RSP sense copy by the received length
    5c97ae9382de mm/damon/ops-common: call folio_test_lru() after folio_get()
    5242b5f3c77f drm/amd/display: Reject gpio_bitshift >= 32 in bios_parser_get_gpio_pin_info()
    898bd0ccfed7 drm/virtio: fix dma_fence refcount leak on error in virtio_gpu_dma_fence_wait()
    e2331730175f ALSA: timer: Fix UAF at snd_timer_user_params()
    a1288cd700f7 USB: serial: kl5kusb105: fix bulk-out buffer overflow
    f71f8f99a9cd USB: serial: option: add usb-id for Dell Wireless DW5826e-m
    4cb722747ed2 USB: serial: io_ti: fix heap overflow in build_i2c_fw_hdr()
    d92f17af7097 USB: serial: io_ti: fix heap overflow in get_manuf_info()
    aa82a078f70f xfrm: espintcp: do not reuse an in-progress partial send
    0da2e073f9cb ksmbd: fix use-after-free of a deferred file_lock on double SMB2_CANCEL
    07c33be968d9 drm/i915/gem: Fix phys BO pread/pwrite with offset
    033d39e41fc3 KVM: Don't WARN if memory is dirtied without a vCPU when the VM is dying
    88520b2fecc4 mmc: litex_mmc: Use DIV_ROUND_UP for more accurate clock calculation
    1e927a468500 tracing/probes: Point the error offset correctly for eprobe argument error
    214a2042b16b Bluetooth: L2CAP: reject BR/EDR signaling packets over MTUsig
    1338ee049a89 Bluetooth: hci_sync: reject oversized Broadcast Announcement prepend
    8767fe4079af netfilter: nft_tunnel: fix use-after-free on object destroy
    e0ce103e89d6 drm/vc4: fix krealloc() memory leak
    ed3e134700a2 drm/virtio: Fix driver removal with disabled KMS
    c5f438dd2fd8 clk: qcom: dispcc-sc8280xp: Don't park mdp_clk_src at registration time
    5e1c1d22268a netfilter: ctnetlink: ensure safe access to master conntrack
    5f82b02b4059 ipv6: Fix a potential NPD in cleanup_prefix_route()
    ccdd7f1949bb net: mvpp2: build skb from XDP-adjusted data on XDP_PASS
    580f92f27cb8 net: mvpp2: refill RX buffers before XDP or skb use
    26c0986cb613 net: mvpp2: Add metadata support for xdp mode
    3b8b0c3631b1 net: mvpp2: limit XDP frame size to the RX buffer
    bede0f481b91 net: mvpp2: sync RX data at the hardware packet offset
    cd513e43b4b2 netfilter: nft_exthdr: fix register tracking for F_PRESENT flag
    8a81e336da68 netfilter: nf_log: validate MAC header was set before dumping it
    a0d16941adf3 netfilter: x_tables: avoid leaking percpu counter pointers
    29d8cc44bbdf netfilter: nf_conntrack: destroy stale expectfn expectations on unregister
    eb7e77342e3e rds: mark snapshot pages dirty in rds_info_getsockopt()
    f513f308cc4b ip6_vti: fix incorrect tunnel matching in vti6_tnl_lookup()
    0f22412a2f4f net/rds: fix NULL deref in rds_ib_send_cqe_handler() on masked atomic completion
    b903e9b5629e net: guard timestamp cmsgs to real error queue skbs
    8ce96f118264 sctp: fix uninit-value in __sctp_rcv_asconf_lookup()
    22f4ee66614e r8152: handle the return value of usb_reset_device()
    25fdf5369853 net: openvswitch: fix possible kfree_skb of ERR_PTR
    0bfa7bba1f41 ipv6: sit: reload inner IPv6 header after GSO offloads
    41781f278930 net/mlx5: Fix slab-out-of-bounds in mlx5_query_nic_vport_mac_list
    2047c2aa0963 net: qrtr: fix refcount saturation and potential UAF in qrtr_port_remove
    12fb84dc4dc8 net: phy: clean the sfp upstream if phy probing fails
    838f411b8ef8 net/mlx4: avoid GCC 10 __bad_copy_from() false positive
    ecfe9171b26a tcp: restrict SO_ATTACH_FILTER to priv users
    10def23b67b4 ASoC: wm_adsp: Fix NULL dereference when removing firmware controls
    7db09011ce62 gpio: mvebu: fix NULL pointer dereference in suspend/resume
    07a18f5c90dd netlabel: validate unlabeled address and mask attribute lengths
    42827d03f800 xfrm: policy: fix use-after-free on inexact bin in xfrm_policy_bysel_ctx()
    f4e4b98cee82 iomap: don't revert iov_iter on partially completed buffered writes
    fed65bc9de8e arm64: tlb: Optimize ARM64_WORKAROUND_REPEAT_TLBI
    b7d3add1884c arm64: tlb: Allow XZR argument to TLBI ops
    523bc49979b9 KVM: arm64: Remove VPIPT I-cache handling
    d30aac0fa00c tap: free page on error paths in tap_get_user_xdp()
    ceafb893b12f net: skbuff: fix missing zerocopy reference in pskb_carve helpers
    9eaa4e8d5561 tools/rv: Fix cleanup after failed trace setup
    7fce959e9be3 usb: gadget: u_ether: Fix NULL pointer deref in eth_get_drvinfo
    36c41e9724c9 usb: gadget: f_ncm: Fix net_device lifecycle with device_move
    d68b621bb5a4 ALSA: PCM: Fix wait queue list corruption in snd_pcm_drain() on linked streams
    c12c4cae0cd7 time: Fix off-by-one in settimeofday() usec validation
    f4aae11abb44 signal: clear JOBCTL_PENDING_MASK for caller in zap_other_threads()
    6e39863cefe4 ipmi: Fix rcu_read_unlock to srcu_read_unlock in handle_read_event_rsp
    2afc9e684dc7 sctp: purge outqueue on stale COOKIE-ECHO handling
    6d6e42e8e17f net/802/mrp: fix vector attribute parsing in mrp_pdu_parse_vecattr
    1a827b95e62b ieee802154: 6lowpan: only accept IPv6 packets in lowpan_xmit()
    9db4dd019a6b vxlan: vnifilter: fix spurious notification on VNI update
    5a7ad529fd53 vxlan: vnifilter: send notification on VNI add
    e4e7428349d9 octeontx2-af: npc: Fix CPT channel mask in npc_install_flow
    72775977e89c net: ethernet: mtk_eth_soc: Fix use-after-free in metadata dst teardown
    cecdc6574a82 ptp: vclock: Switch from RCU to SRCU
    8ff85dbabbbf ipv4: restrict IPOPT_SSRR and IPOPT_LSRR options
    ba760c38b38b Bluetooth: MGMT: Fix backward compatibility with userspace
    0622e527a31d Bluetooth: fix memory leak in error path of hci_alloc_dev()
    691f14b6a48b Bluetooth: bnep: reject short frames before parsing
    10e90715e68f Bluetooth: bnep: fix incorrect length parsing in bnep_rx_frame() extension handling
    98377e6b1a1a Bluetooth: RFCOMM: validate skb length in MCC handlers
    74c08e4db35a Bluetooth: MGMT: validate advertising TLV before type checks
    de31973ef00e Bluetooth: RFCOMM: hold listener socket in rfcomm_connect_ind()
    28a6a3762796 net: fec: fix pinctrl default state restore order on resume
    caeb42f28f00 net: lan743x: permit VLAN-tagged packets up to configured MTU
    74e02121be1d net: garp: fix unsigned integer underflow in garp_pdu_parse_attr
    271355c2ef61 hsr: Remove WARN_ONCE() in hsr_addr_is_self().
    91cdbb9b308f net: Annotate sk->sk_write_space() for UDP SOCKMAP.
    daf5a9eef894 pcnet32: stop holding device spin lock during napi_complete_done
    e732c4444bcf drm/imx: Fix three kernel-doc warnings in dcss-scaler.c
    06ce6fc106b1 6lowpan: fix off-by-one in multicast context address compression
    8b136f18ac4b net/sched: act_api: use RCU with deferred freeing for action lifecycle
    b4892561552d dm cache policy smq: check allocation under invalidate lock
    afd64b59c3de netfilter: bridge: make ebt_snat ARP rewrite writable
    af80f78ce984 netfilter: nft_ct: bail out on template ct in get eval
    7c34f9130529 netfilter: conntrack_irc: fix possible out-of-bounds read
    0f8ba5e4c53d netfilter: synproxy: add mutex to guard hook reference counting
    c6376b9b1b4d ipvs: clear the svc scheduler ptr early on edit
    8122abd4fd92 netfilter: xt_NFQUEUE: prefer raw_smp_processor_id
    945a86b21b40 ksmbd: fix NULL-deref of opinfo->conn in oplock/lease break notifiers
    9a0dc9279d09 tee: optee: prevent use-after-free when the client exits before the supplicant
    5d27d2ffe487 net/smc: fix sleep-inside-lock in __smc_setsockopt() causing local DoS
    2a613bf49702 ipv6: mcast: Fix use-after-free when processing MLD queries
    aa6ef7340169 i2c: dev: prevent integer overflow in I2C_TIMEOUT ioctl
    067579d5cf8c Disable -Wattribute-alias for clang-23 and newer
    b26849cffaa7 hwmon: (pmbus/core) Protect regulator operations with mutex
    d859e53596d1 RDMA/rxe: Fix "trying to register non-static key in rxe_qp_do_cleanup" bug
    7502c1cf303b Bluetooth: hci_conn: fix potential UAF in set_cig_params_sync
    90dbad14b109 USB: serial: mct_u232: fix memory corruption with small endpoint
    f8b8f1d4bb76 bpf: Free reuseport cBPF prog after RCU grace period.
    37f488be2a82 usb: core: Fix SuperSpeed root hub wMaxPacketSize
    ff3c2b623bfa HID: core: Fix size_t specifier in hid_report_raw_event()
    9e36568e67f8 HID: pass the buffer size to hid_report_raw_event
    20a816422e98 HID: core: Add printk_ratelimited variants to hid_warn() etc
    bb2040484f90 serial: zs: Convert to use a platform device
    c9e78361fe92 serial: dz: Convert to use a platform device
    5fc2943ad6a1 serial: dz: Fix bootconsole handover lockup
    bef9e8bdbc60 xhci: tegra: Fix ghost USB device on dual-role port unplug
    8a65db5edd7b USB: serial: digi_acceleport: fix memory corruption with small endpoints
    fbf718d5afe2 landlock: Fix handling of disconnected directories
    0e96cd314c0d x86/kexec: Disable KCOV instrumentation after load_segments()
    a55618c0f4ce Bluetooth: hci_sync: fix UAF in hci_le_create_cis_sync
    4bcaa59f403d USB: serial: cypress_m8: fix memory corruption with small endpoint
    36f07474f2b9 serial: zs: Switch to using channel reset
    633a33fe1a34 serial: zs: Fix bootconsole handover lockup
    6f22119afe53 serial: dz: Fix bootconsole message clobbering at chip reset
    a8bd09d3d843 drm/amdkfd: Check for pdd drm file first in CRIU restore path
    4e5f808b4541 drm/amdkfd: fix a vulnerability of integer overflow in kfd debugger
    6495cc09f7e6 drm/amdkfd: fix NULL pointer bug in svm_range_set_attr
    c33322ef3ce5 serial: fsl_lpuart: fix rx buffer and DMA map leaks in start_rx_dma
    ea7bdbee9fc3 serial: zs: Fix swapped RI/DSR modem line transition counting
    4860f9821baf serial: sh-sci: fix memory region release in error path
    70982b7ac673 serial: qcom-geni: fix UART_RX_PAR_EN bit position
    3c29f8af029b serial: altera_jtaguart: handle uart_add_one_port() failures
    a1b9535768ed drm/amd/pm/si: Disregard vblank time when no displays are connected
    28b22dbaf407 drm/i915: Fix potential UAF in TTM object purge
    049a6b474823 drm/hyperv: validate VMBus packet size in receive callback
    1fb565b77b8f drm/hyperv: validate resolution_count and fix WIN8 fallback
    edd06675a023 scsi: target: iscsi: Validate CHAP_R length before base64 decode
    4e9f0c4a645c scsi: target: iscsi: Bound iscsi_encode_text_output() appends to rsp_buf
    163bd704d751 scsi: scsi_transport_fc: Widen FPIN pname walker counter to u32
    0e3c6e5a8fc1 scsi: fcoe: Reject FIP descriptors with zero fip_dlen in CVL walker
    5506c825f14d thunderbolt: property: Reject dir_len < 4 to prevent size_t underflow
    8d4a758b407a thunderbolt: property: Reject u32 wrap in tb_property_entry_valid()
    e835bf9a055f usb: gadget: f_fs: copy only received bytes on short ep0 read
    a183b47fee46 usb: gadget: dummy_hcd: Reject hub port requests for non-existent ports
    046870ff6b6f usb: gadget: composite: fix integer underflow in WebUSB GET_URL handling
    5d39924ae38c usb: gadget: f_hid: fix device reference leak in hidg_alloc()
    085652fda7f3 usb: gadget: net2280: Fix double free in probe error path
    70bb9a2661d3 USB: serial: mct_u232: fix missing interrupt-in transfer sanity check
    be3a1ed4ae51 USB: serial: mxuport: fix memory corruption with small endpoint
    0bde5431037a USB: serial: keyspan: fix missing indat transfer sanity check
    be50533fe706 USB: serial: cypress_m8: validate interrupt packet headers
    ffb739a49186 USB: serial: belkin_sa: validate interrupt status length
    37a2ac9f5125 USB: serial: option: add missing RSVD(5) flag for Rolling RW135R-GL
    5a0e65d56ffd USB: serial: option: add MeiG SRM813Q
    17587492179c usb: usbtmc: reject interrupt endpoints with small wMaxPacketSize
    5de7df75ef3a usb: usbtmc: check URB actual_length for interrupt-IN notifications
    a0638db2340e usbip: vudc: Fix use after free bug in vudc_remove due to race condition
    02c76e026c06 usb: storage: Add quirks for PNY Elite Portable SSD
    aec4d38ac605 USB: quirks: add NO_LPM for Lenovo ThinkPad USB-C Dock Gen2 hub controllers
    e21f5abf80ad usb: core: Fix up Interrupt IN endpoints with bogus wBytesPerInterval
    028cc2555eca usb: chipidea: core: convert ci_role_switch to local variable
    6dd5c0ea139b tty: serial: pch_uart: add check for dma_alloc_coherent()
    68f603bb8622 counter: Fix refcount leak in counter_alloc() error path
    9fa854ea4318 comedi: comedi_test: Fix limiting of convert_arg in waveform_ai_cmdtest()
    422af0f9ce0c comedi: comedi_test: fix check for valid scan_begin_src in waveform_ai_cmdtest()
    2ad3397f3cc5 Input: synaptics - add LEN2058 to SMBus passlist for ThinkPad E490
    e9b62996ba53 Input: atmel_mxt_ts - fix boundary check in mxt_prepare_cfg_mem
    0fe08c5776a7 ksmbd: OOB read regression in smb_check_perm_dacl() ACE-walk loops
    ba451cf21f1d Input: xpad - add support for ASUS ROG RAIKIRI II
    6e6de3eba8e4 Input: xpad - add "Nova 2 Lite" from GameSir
    322e48187e02 xfrm: esp: restore combined single-frag length gate
    d780c61bd2ef ASoC: qcom: q6asm-dai: do not set stream state in event and trigger callbacks
    ed4e2ff1ddd1 ASoC: qcom: q6asm-dai: close stream only when running
    2bb6d82b586e netfilter: conntrack: tcp: do not force CLOSE on invalid-seq RST without direction check
    32aa292fbcb9 xfrm: ah: use skb_to_full_sk in async output callbacks
    00f2c451e57d xfrm: route MIGRATE notifications to caller's netns
    c4cc6b3b0013 nfc: hci: fix out-of-bounds read in HCP header parsing
    1552b979a0b6 iommu, debugobjects: avoid gcc-16.1 section mismatch warnings
    ed598de9f615 HID: wacom: Fix OOB write in wacom_hid_set_device_mode()
    f1e89a943ee5 ip6: vti: Use ip6_tnl.net in vti6_changelink().
    48ce101cd630 xfrm: input: hold netns during deferred transport reinjection
    a29768d56eb3 ipv6: validate extension header length before copying to cmsg
    1acfb7d9c6fc ip6: vti: Use ip6_tnl.net in vti6_siocdevprivate().
    12d957979e4a ipv6: exthdrs: refresh nh after handling HAO option
    f21a9285147a ASoC: qcom: q6asm-dai: fix error handling in prepare and set_params
    bddaa4dfc7f3 ipv6: exthdrs: refresh nh pointer after ipv6_hop_jumbo()
    679e13a65e68 macsec: fix replay protection at XPN lower-PN wrap
    96b72672ce84 bpf: sockmap: fix tail fragment offset in bpf_msg_push_data
    48b0aa9c08a3 Input: elan_i2c - validate firmware size before use
    0584af4fe40f usb: dwc2: Fix use after free in debug code
    c28bfafa9d70 usb: cdns3: plat: fix unbalanced pm_runtime_forbid() call permanently leaks the runtime PM usage counter across bind/unbind cycles
    96291794d162 usb: cdns3: gadget: fix request skipping after clearing halt
    9a3860454bdf USB: serial: omninet: fix memory corruption with small endpoint
    29783e6b6ec0 iio: buffer: hw-consumer: fix use-after-free in error path
    d291f76e4231 iio: light: cm3323: fix reg_conf not being initialized correctly
    d534936cf3ac iio: magnetometer: st_magn: fix default DRDY pin selection for LIS2MDL
    c43741113cd6 iio: temperature: tsys01: fix broken PROM checksum validation
    b5d9befff543 iio: ssp_sensors: cancel delayed work_refresh on remove
    31bbd4b87dd6 iio: gyro: itg3200: fix i2c read into the wrong stack location
    d434a6abd101 iio: adc: viperboard: Fix error handling in vprbrd_iio_read_raw
    1c375f2c4a7a iio: dac: ad5686: acquire lock when doing powerdown control
    99d8feee7560 iio: dac: ad5686: fix input raw value check
    9a8fca2af3aa iio: dac: max5821: fix return value check in powerdown sync
    baff1f00d8b5 iio: adc: xilinx-xadc: Fix sequencer mode in postdisable for dual mux
    7b9dcbe89d7a wireguard: send: append trailer after expanding head
    a452ca80b7ad KVM: SVM: Flush the current TLB when transitioning from xAVIC => x2AVIC
    c881af73ae98 KVM: arm64: PMU: Preserve AArch32 counter low bits
    ecc9635e7501 USB: cdc-acm: Fix bit overlap and move quirk definitions to header
    15b1723c1472 parport: Fix race between port and client registration
    bcfb4833cd40 Input: xpad - fix out-of-bounds access for Share button
    35f68f36d988 Bluetooth: ISO: serialize iso_sock_clear_timer with socket lock
    119fb6f80c44 Bluetooth: ISO: fix UAF in iso_recv_frame
    d313683d6ccd Bluetooth: HIDP: fix missing length checks in hidp_input_report()
    63cd225cc13d Bluetooth: L2CAP: fix chan ref leak in l2cap_chan_timeout() on !conn
    89dec9204171 Bluetooth: L2CAP: use chan timer to close channels in cleanup_listen()
    8776032fe989 auxdisplay: line-display: fix OOB read on zero-length message_store()
    157ce2c6836c ipc: limit next_id allocation to the valid ID range
    7c58c55a2a16 hpfs: fix a crash if hpfs_map_dnode_bitmap fails
    dcd2b02b095f Bluetooth: btusb: Allow firmware re-download when version matches
    4c52e31e9ea6 HID: quirks: Add ALWAYS_POLL quirk for SIGMACHIP USB mouse
    0cd7b3a15a49 Input: ims-pcu - fix usb_free_coherent() size in ims_pcu_buffers_free()
    060fca8e0983 media: rc: igorplugusb: fix control request setup packet
    9b3145b3001f USB: serial: safe_serial: fix memory corruption with small endpoint
    156b6f0aec61 usb: typec: ucsi: validate connector number in ucsi_connector_change()
    0af00f1459f5 usb: typec: tcpm/tcpci_maxim: validate header NDO against RX_BYTE_CNT
    5cd0e7ac4eef usb: typec: wcove: don't write past struct pd_message in wcove_read_rx_buffer()
    70e7045849e9 usb: typec: altmodes/displayport: validate count before reading Status Update VDO
    592cbdc644c6 usb: typec: ucsi: displayport: NAK DP_CMD_CONFIGURE without a payload VDO
    3f432b820306 usb: typec: ucsi: ccg: reject firmware images without a ':' record header
    d42ac0bfb6a1 iio: imu: st_lsm6dsx: fix stack leak in tagged FIFO buffer
    d1c9c79eb06e soc/tegra: pmc: Fix unsafe generic_handle_irq() call
    0bb1522d3081 hwmon: (pmbus/adm1266) serialize NVMEM blackbox read with pmbus_lock
    96852c116071 hwmon: (pmbus/adm1266) serialize GPIO PMBus accesses with pmbus_lock
    7e2476057950 x86/kexec: add a sanity check on previous kernel's ima kexec buffer
    566db3370f12 of/kexec: refactor ima_get_kexec_buffer() to use ima_validate_range()
    43308106a176 ima: verify the previous kernel's IMA buffer lies in addressable RAM
    e1d839efc1e4 phy: mscc: Use PHY_ID_MATCH_EXACT for VSC8584, VSC8582, VSC8575, VSC856X
    64858b76ec67 arm64: io: Extract user memory type in ioremap_prot()
    4356c4d85050 arm64: io: Rename ioremap_prot() to __ioremap_prot()
    05ff52238039 drm/i915/psr: Apply Intel DPCD workaround when SDP on prior line used
    45e27857b24e drm/dp: Add eDP 1.5 bit definition
    ac7045d3f6d3 drm/i915/psr: Read Intel DPCD workaround register
    28557e9deb23 drm/i915/psr: Add defininitions for INTEL_WA_REGISTER_CAPS DPCD register
    22ee4010866d inet: frags: flush pending skbs in fqdir_pre_exit()
    e0fc5427d6a8 inet: frags: add inet_frag_queue_flush()
    711ebd961190 drm, fbcon, vga_switcheroo: Avoid race condition in fbcon setup
    f707f53f9ff5 drm/fbdev-helper: Set and clear VGA switcheroo client from fb_info
    228cc232079d media: rc: ttusbir: fix inverted error logic
    a7becb58f6b8 media: rc: fix race between unregister and urb/irq callbacks
    3edb8ebbf79b mm/page_alloc: clear page->private in free_pages_prepare()
    a9393751ecf7 batman-adv: bla: avoid double decrement of bla.num_requests
    99f17d1cdb37 batman-adv: tt: avoid empty VLAN responses
    65a1e67339aa batman-adv: tt: fix TOCTOU race for reported vlans
    5bc2d50fb66b batman-adv: tp_meter: directly shut down timer on cleanup
    3c19cb8a84ef net: af_key: zero aligned sockaddr tail in PF_KEY exports
    100953b5011d batman-adv: tp_meter: avoid role confusion in tp_list
    cf12f8881832 batman-adv: iv: recover OGM scheduling after forward packet error
    13493b00dd1e batman-adv: tvlv: reject oversized TVLV packets
    2a8c9e865291 batman-adv: bla: avoid NULL-ptr deref for claim via dropped interface
    a5904f2c92b0 batman-adv: tt: reject oversized local TVLV buffers
    fcedc98bd03c batman-adv: tvlv: abort OGM send on tvlv append failure
    31dcb9711abd batman-adv: v: stop OGMv2 on disabled interface
    ae1ada0af162 perf: Fix dangling cgroup pointer in cpuctx
    1488367423a6 net: skbuff: fix pskb_carve leaking zcopy pages
    c87cd3cb3096 ipv6: fix possible infinite loop in fib6_select_path()
    279853aec9f5 ipv6: fix possible infinite loop in rt6_fill_node()
    634a9af8a26a sctp: fix race between sctp_wait_for_connect and peeloff
    95e414f83243 net: mana: Add NULL guards in teardown path to prevent panic on attach failure
    88403b42faa8 gpio: rockchip: convert bank->clk to devm_clk_get_enabled()
    6319b38fe69f Bluetooth: L2CAP: Fix possible crash on l2cap_ecred_conn_rsp
    cc2b4f749de0 Bluetooth: l2cap: clear chan->ident on ECRED reconfiguration success
    97e06791368c ipv6: rpl: fix hdrlen overflow in ipv6_rpl_srh_decompress()
    65674d2489a1 ethtool: eeprom: add more safeties to EEPROM Netlink fallback
    091b58d9a65b ethtool: eeprom: add missing ethnl_ops_begin() / _complete() during fallback
    f4d78a81f57d bonding: refuse to enslave CAN devices
    b06203ac5f12 Bluetooth: 6lowpan: check skb_clone() return value in send_mcast_pkt()
    5fe860af8630 ASoC: codecs: simple-mux: Fix enum control bounds check
    3127a884525d ksmbd: fix FSCTL permission bypass by adding a permission check for FSCTL_SET_SPARSE
    e917d0c69f01 tunnels: do not assume transport header in iptunnel_pmtud_check_icmp()
    dc3bfa050f87 vxlan: do not reuse cached ip_hdr() value after skb_tunnel_check_pmtu()
    76cd9398a047 tunnels: load network headers after skb_cow() in iptunnel_pmtud_build_icmp[v6]()
    5165922a8b5c gpio: mxc: fix irq_high handling
    a4b64f3e9c7b net: hsr: fix potential OOB access in supervision frame handling
    e9e1dbdee16e ASoC: Intel: bytcht_es8316: Fix MCLK leak on init errors
    8e59d4d0dcde ipv4: free net->ipv4.sysctl_local_reserved_ports after unregister_net_sysctl_table()
    15fb19af49f2 scsi: core: Run queues for all non-SDEV_DEL devices from scsi_run_host_queues
    cd691beafea0 net/iucv: fix locking in .getsockopt
    ed7a75831301 net/smc: Do not re-initialize smc hashtables
    e523bb6d1de3 net: netlink: don't set nsid on local notifications
    490a6ef32ab2 net: netlink: fix sending unassigned nsid after assigned one
    20f977a75333 vsock: keep poll shutdown state consistent
    60d9c0d6cdde tun: free page on build_skb failure in tun_xdp_one()
    5b34f9e4fe2f tun: free page on short-frame rejection in tun_xdp_one()
    b80ef316e978 netfilter: nf_tables: fix dst corruption in same register operation
    ce0712149e21 netfilter: bitwise: add support for doing AND, OR and XOR directly
    45cb4821021e netfilter: bitwise: rename some boolean operation functions
    a27cb7325a6c netfilter: ebtables: fix OOB read in compat_mtw_from_user
    21994d11461b netfilter: xt_cpu: prefer raw_smp_processor_id
    af2c22ccb1f6 netfilter: synproxy: refresh tcphdr after skb_ensure_writable
    d0cbeaa85b58 nfc: nxp-nci: i2c: use rising-edge IRQ on ACPI systems
    fccd685b32df xfrm: Check for underflow in xfrm_state_mtu
    ee2d1a8a1833 nfc: llcp: Fix use-after-free race in nfc_llcp_recv_cc()
    e00f50f86977 nfc: llcp: Fix use-after-free in llcp_sock_release()
    67cca9df4d17 net: cpsw_new: Fix potential unregister of netdev that has not been registered yet
    4f33d74ccf69 bcache: fix uninitialized closure object
    b4a659bae3b8 drm: Remove plane hsub/vsub alignment requirement for core helpers
    6c153d97c100 net/sched: sch_sfb: Replace direct dequeue call with peek and qdisc_dequeue_peeked
    963537a26fd8 net: mctp: ensure our nlmsg responses are initialised
    5df49f0579f7 net/sched: cls_fw: fix NULL dereference of "old" filters before change()
    d883312061cc Input: usbtouchscreen - clamp NEXIO data_len/x_len to URB buffer size

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index c3200cfd3f..e5a3882efe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1ceada58731a98237f70384921758a4df3951960"
-SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
+SRCREV_machine ?= "fcddef60733f35eb43e4f8d5c7fd23d1c5bc4b24"
+SRCREV_meta ?= "b32016757524151fa9577e2c13b2fcc0355a076f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.142"
+LINUX_VERSION ?= "6.6.143"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 563598a2bd..ed4b0c67ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.142"
+LINUX_VERSION ?= "6.6.143"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "66e051144e21d531fa26ef67476dfdefbfc119a2"
-SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
+SRCREV_machine ?= "14b1b02cc139bf807405c9ad97a799a1dbfc0e4d"
+SRCREV_meta ?= "b32016757524151fa9577e2c13b2fcc0355a076f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 07a06f1852..c682d6ff17 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d81ffd8843535762fecf5aa5fb2ca7d2c4343038"
-SRCREV_machine:qemuarm64 ?= "1f7f3a52dacadfcc75863f25252a534b06fdaeeb"
-SRCREV_machine:qemuloongarch64 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
-SRCREV_machine:qemumips ?= "4410226fddf113b89cceb26e7ee5ca5bb70c55fb"
-SRCREV_machine:qemuppc ?= "8f8faf1fe9183f295901f8f2b8916ff54f4a4bfb"
-SRCREV_machine:qemuriscv64 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
-SRCREV_machine:qemuriscv32 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
-SRCREV_machine:qemux86 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
-SRCREV_machine:qemux86-64 ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
-SRCREV_machine:qemumips64 ?= "14ca63e9f1ce2090e189c16b1024ed3df8f833f0"
-SRCREV_machine ?= "a8a7d078f151a24e01d4501853c88c6b08c9cad9"
-SRCREV_meta ?= "4a6f16d14b76e28ab7615c88e2fbdf95ee15fc98"
+SRCREV_machine:qemuarm ?= "900d4f2a9c0cd33b2f32053ea438c709ca4fc69c"
+SRCREV_machine:qemuarm64 ?= "5f9c75b34f19ebfb1ac2cf26b0cdf1e637b0a67b"
+SRCREV_machine:qemuloongarch64 ?= "d7c355e593fea6abba6099c009d0b4ec566ffba1"
+SRCREV_machine:qemumips ?= "d066c05c4207d69ff781175fbd4544af3a57a6e4"
+SRCREV_machine:qemuppc ?= "c9444b37f0f19f6f7186e4936f940b2e29cef806"
+SRCREV_machine:qemuriscv64 ?= "d7c355e593fea6abba6099c009d0b4ec566ffba1"
+SRCREV_machine:qemuriscv32 ?= "d7c355e593fea6abba6099c009d0b4ec566ffba1"
+SRCREV_machine:qemux86 ?= "d7c355e593fea6abba6099c009d0b4ec566ffba1"
+SRCREV_machine:qemux86-64 ?= "d7c355e593fea6abba6099c009d0b4ec566ffba1"
+SRCREV_machine:qemumips64 ?= "4c96d4f0d9ae5848015aa021c683bc1c68b596ee"
+SRCREV_machine ?= "d7c355e593fea6abba6099c009d0b4ec566ffba1"
+SRCREV_meta ?= "b32016757524151fa9577e2c13b2fcc0355a076f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "924b4a879cbb75aef37c160b955b92f6894b11a4"
+SRCREV_machine:class-devupstream ?= "d1cfde2d5d15be14123bdd1689162bd27f995a90"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.142"
+LINUX_VERSION ?= "6.6.143"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


