Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 785BFE9463A
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 03:17:31 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12142.1770693449938557048
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 19:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=itVK1UV7;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5029aa94f28so47727771cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 19:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770693447; x=1771298247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BGJbxRnmj/IOSkFjd2Fw7Kb1HUadEvVXv2H5Fv8YzVc=;
        b=itVK1UV7PuPRuDIGKJJsJahgJ5PUF2qq38M2npKF/n+A8TsAZgeSV6gTAv899u4rwL
         TWsAii6GqALoZevOiUO8uYsH0Q2hgYZNzbvRFSIzMQ2sFHD4Tdo7/C7MPIhdnb3wiq5m
         ikw1wLAQFZCqA5Ctzl387P3M8PPCdHgQJGf+ZJboofD57yn88SpmR1q0Wz3KeI6spjHM
         K/5f5woWvuV+bojh6eSwfsesGh3mGFDj795naTKDqkYuZrnuf3leOfgmtF6kJ8V//9ig
         f9xXrvGISwSazhHfYXRp15gRkiYXJjGWMLhIKVrZqquNmeLRfRqQ+s6b+wwP7n4XrXEu
         sxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770693447; x=1771298247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGJbxRnmj/IOSkFjd2Fw7Kb1HUadEvVXv2H5Fv8YzVc=;
        b=b9cTXbE2XVgpT9hpr80fFTkp7ohhdeN9Cw6J8i1+iUguS6K0GdW+B0VsMttSnTwG3a
         bhUE3nr8UtrYodZb8Q2b2sKPoP0VJl/tylc1ZD7lSXbfQ4vht9t9BPv/K+yMydNTPF+K
         xWcRj1jPwUunVy9TJ5a/3HOAzi038B58ZEq92XCWoFVhZAN6j8d1XFcepVXSquz/qZlP
         C16fh/E81iSGK8qV7YifV6PA/ObpbPbD4xaod1L1e/9qIDI3ZtVZU1zi7AsK8ScMHFYT
         oot4mKjdKY4EwiWHAnSDkolDT6CAJGFvXCQcaYlMpDH5azJNGzA1PCeir2VqCP7NPU0T
         28kw==
X-Gm-Message-State: AOJu0YzWxqkwJqor8c7HTCT4o9jShxs+e2HHSDmqR5iYmRbzVZW6mDFD
	jwj05pRRk3yndvPShhPJ46DpbauSRMdbybJMgLELkXkb9zTuFRp06WzFyKRSe7yv
X-Gm-Gg: AZuq6aKcT9sgw89fRWcHyDd7fZgCu7dNg10geVYNPZN7/ibADj9WZXzfiY8WnMgzc0P
	xs9gUIPRjMtLKfFc47m2UBCGUHa0z3VwoziGq/DI4nuqbATbj0Vblluodakb/8vXXpeQ69Smpcb
	cBckd3OUD7vXULK5ZQ9Az5WSmjcO5zhWD3lwVunehKbPeE7kym2PZPIJv3ZMBwmZhA/Nojw4nGi
	iCAc3pSeLjSSCdU7xR+enuYAsJxHHMvpUKslKtbFoZiBjsH3X1kR7cqdCMRByIv9S6BhXdVlRrX
	zgUbfT1GvPhpLaloe6S7n/ThQ70+3UdULa21OKPvG4EKKauwZIR04KTBI4VJBlwgREaaYqwVqCS
	lXjVAKNnBFFNbJ6vdrpvERaCuFGIdUrGy61/5Kj8coWJGx3TIiE0wNd6tjHwjNK5RZzh24jo6r5
	EBt7c+70xsmYfpgljhjeJ8YsMpVUyDqDpQlA8R0H4CLnRAgTlYqDKoDZDDbHOk79rlSni2oIQzC
	AzuuqchqdANMqN3etSKADPifvuxz717HEFSMovRIoGnBOxsYP7ZnYeOInY=
X-Received: by 2002:ac8:5f0f:0:b0:4ff:82aa:d845 with SMTP id d75a77b69052e-50672e71421mr13257231cf.41.1770693445820;
        Mon, 09 Feb 2026 19:17:25 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5064f581107sm60477941cf.28.2026.02.09.19.17.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:17:24 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: [meta][whinlatter][PATCH 01/02] linux-yocto/6.12: update to v6.12.69
Date: Mon,  9 Feb 2026 22:17:21 -0500
Message-ID: <20260210031722.1347242-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 03:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230844

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    ff21773827997 Linux 6.12.69
    1654507c960c8 bpf/selftests: test_select_reuseport_kern: Remove unused header
    465dc66425852 RDMA/mana_ib: Handle net event for pointing to the current netdev
    367bad70cc52a net: mana: Change the function signature of mana_get_primary_netdev_rcu
    40daf043b92b4 pinctrl: lpass-lpi: implement .get_direction() for the GPIO driver
    69ada05fa1052 drm/amdgpu/gfx11: adjust KGQ reset sequence
    76ee199c68e3d writeback: fix 100% CPU usage when dirtytime_expire_interval is 0
    5aac392fcd3d9 perf: sched: Fix perf crash with new is_user_task() helper
    b45d52c60cee5 perf: Simplify get_perf_callchain() user logic
    42c44bd729dcb mptcp: avoid dup SUB_CLOSED events after disconnect
    601cbef809805 pinctrl: qcom: sm8350-lpass-lpi: Merge with SC7280 to fix I2S2 and SWR TX pins
    3845bd336a406 net/sched: act_ife: convert comma to semicolon
    22b10cbb9a2e1 btrfs: prevent use-after-free on folio private data in btrfs_subpage_clear_uptodate()
    6214b2b1e823f Revert "drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)"
    1d2178918efc9 wifi: ath11k: add srng->lock for ath11k_hal_srng_* in monitor mode
    823ec0ef9343c mm/kfence: randomize the freelist on initialization
    3dedeeecd1ae4 libbpf: Fix -Wdiscarded-qualifiers under C23
    70ba85e439221 ksmbd: smbd: fix dma_unmap_sg() nents
    c08cf314191cd rxrpc: Fix data-race warning and potential load/store tearing
    993047031c9fc cgroup: Fix kernfs_node UAF in css_free_rwork_fn
    5658a031f3310 rust: kbuild: support `-Cjump-tables=n` for Rust 1.93.0
    6a21a60f46ce0 gpiolib: acpi: Fix potential out-of-boundary left shift
    b4ce08aa03d67 drm/amdgpu: Fix cond_exec handling in amdgpu_ib_schedule()
    7611d7faccc12 drm/amdgpu: fix NULL pointer dereference in amdgpu_gmc_filter_faults_remove
    997f056c46c9d drm/amdgpu/gfx12: fix wptr reset in KGQ init
    8561c654107b6 drm/amdgpu/gfx11: fix wptr reset in KGQ init
    633e76d818747 drm/amdgpu/gfx10: fix wptr reset in KGQ init
    ea9b200a2f7ba drm/amdgpu/soc21: fix xclk for APUs
    77365382585b4 drm/imx/tve: fix probe device leak
    fb399a65d1e97 drm/msm/a6xx: fix bogus hwcg register updates
    11eb41a91829e scripts: generate_rust_analyzer: Add compiler_builtins -> core dep
    98b858a250a91 scripts: generate_rust_analyzer: compile sysroot with correct edition
    e88964adbb422 scripts: generate_rust_analyzer: remove sysroot assertion
    3e62db1e31404 net: fix segmentation of forwarding fraglist GRO
    a99f9a4669a04 mm/shmem, swap: fix race of truncate and swap entry split
    813c51bc25204 mm/memory-failure: teach kill_accessing_process to accept hugetlb tail page pfn
    9a04ab38a6739 mm/memory-failure: fix missing ->mf_stats count in hugetlb poison
    78ede9ebd679d flex_proportions: make fprop_new_period() hardirq safe
    11b3b1514e66e selftests: mptcp: join: fix local endp not being tracked
    4b0860c0ac622 selftests: mptcp: check subflow errors in close events
    17c1b2df8cbd2 selftests: mptcp: check no dup close events after error
    64b243f5bc889 mptcp: only reset subflow errors when propagated
    0e338c4a3ea82 mm/kasan: fix KASAN poisoning in vrealloc()
    c2be9f1903e89 gpio: rockchip: Stop calling pinctrl for set_direction
    ee10b06980acc nvmet: fix race in nvmet_bio_done() leading to NULL pointer dereference
    89b8ca709eeea efivarfs: fix error propagation in efivar_entry_get()
    d6441c6e95fb4 scsi: qla2xxx: edif: Fix dma_free_coherent() size
    135252f5def0e gpio: pca953x: mask interrupts in irq shutdown
    5a91dcf85d0d9 ASoC: amd: yc: Add DMI quirk for Acer TravelMate P216-41-TCO
    3caa653085622 scsi: be2iscsi: Fix a memory leak in beiscsi_boot_get_sinfo()
    32bcebea15030 ASoC: fsl: imx-card: Do not force slot width to sample width
    4713feae156aa rust: kbuild: give `--config-path` to `rustfmt` in `.rsi` target
    eda4afb0437a6 rust: rbtree: fix documentation typo in CursorMut peek_next method
    c3268c8022096 riscv: compat: fix COMPAT_UTS_MACHINE definition
    fee56df342344 pinctrl: meson: mark the GPIO controller as sleeping
    8d349452b2a63 sched/deadline: Fix 'stuck' dl_server
    08e22f0a8c413 sched/deadline: Document dl_server
    9d6470eea28b5 dma/pool: distinguish between missing and exhausted atomic pools
    f339f846fa3b6 bcache: fix I/O accounting leak in detached_dev_do_request
    0aed692e94219 bcache: use bio cloning for detached device requests
    39c607f892c0b bcache: fix improper use of bi_end_io
    815a8e3bf7281 gpio: virtuser: fix UAF in configfs release path
    65ebe77c36c6e gpiolib: acpi: use BIT_ULL() for u64 mask in address space handler
    dc142ac1130e0 ASoC: Intel: sof_es8336: fix headphone GPIO logic inversion
    37efce0653fad scsi: firewire: sbp-target: Fix overflow in sbp_make_tpg()
    4089765faaa79 net/mlx5e: Skip ESN replay window setup for IPsec crypto offload
    1b8d88690167a net/mlx5: Fix vhca_id access call trace use before alloc
    0fb69a8efac93 net/mlx5: Initialize events outside devlink lock
    fc36cab061e65 net/mlx5: fs, Fix inverted cap check in tx flow table root disconnect
    b5b356af5b989 net: phy: micrel: fix clk warning when removing the driver
    ce9f1bdd4bc86 net: bridge: fix static key check
    126cd30cad37b nfc: nci: Fix race between rfkill and nci_unregister_device().
    2652e2f1253c5 net/mlx5e: TC, delete flows only for existing peers
    e500423f8f1fe ice: stop counting UDP csum mismatch as rx_errors
    d75c7b7c3c2b8 ice: Fix NULL pointer dereference in ice_vsi_set_napi_queues
    3098e5c8af0f4 nfc: llcp: Fix memleak in nfc_llcp_send_ui_frame().
    d8723917efda3 rocker: fix memory leak in rocker_world_port_post_fini()
    af4b8577d0b38 net: wwan: t7xx: fix potential skb->frags overflow in RX path
    c55bdc0494f63 ipv6: use the right ifindex when replying to icmpv6 from localhost
    7e44aba0f5edb net: mvpp2: cls: Fix memory leak in mvpp2_ethtool_cls_rule_ins()
    b956289b83887 bonding: annotate data-races around slave->last_rx
    fdfd28e13c244 octeon_ep: Fix memory leak in octep_device_setup()
    8c4d5d8fda5fa net: bcmasp: fix early exit leak with fixed phy
    8986cdf52f862 can: gs_usb: gs_usb_receive_bulk_callback(): fix error message
    35ad9487185c8 net/mlx5: Fix memory leak in esw_acl_ingress_lgcy_setup()
    1850a558d116d Bluetooth: MGMT: Fix memory leak in set_ssp_complete
    53e54cb31e667 Bluetooth: hci_uart: fix null-ptr-deref in hci_uart_write_work
    f82680295cde6 can: at91_can: Fix memory leak in at91_can_probe()
    90ecf7d9daa2d Linux 6.12.68
    e6cee5d4a122c vsock/virtio: Fix message iterator handling on transmit path
    a3fc25e1d7841 net: Introduce skb_copy_datagram_from_iter_full()
    69c5bf306115e vsock/virtio: Allocate nonlinear SKBs for handling large transmit buffers
    65e808a6023f8 vhost/vsock: Allocate nonlinear SKBs for handling large receive buffers
    2d651c3c035e7 vsock/virtio: Rename virtio_vsock_skb_rx_put()
    bdea2c39fa06c vsock/virtio: Move SKB allocation lower-bound check to callers
    74ea6184df7fa vsock/virtio: Rename virtio_vsock_alloc_skb()
    ca82ab9fd920a vsock/virtio: Move length check to callers of virtio_vsock_skb_rx_put()
    9f1a002f0171d wifi: ath11k: fix RCU stall while reaping monitor destination ring
    db4ae18e1b31e btrfs: fix racy bitfield write in btrfs_clear_space_info_full()
    0328bb097bef0 accel/ivpu: Fix race condition when unbinding BOs
    f7728057220ca fs/ntfs3: Initialize allocated memory before use
    541959b2fadb8 sched_ext: Fix possible deadlock in the deferred_irq_workfn()
    fc9ce762525e7 exfat: fix refcount leak in exfat_find
    437a8711116e5 iio: adc: exynos_adc: fix OF populate on driver rebind
    629be44a1f51a iio: core: add separate lockdep class for info_exist_lock
    1e8e13cc7d8bf iio: core: Replace lockdep_set_class() + mutex_init() by combined call
    5210af7ca6896 iio: core: add missing mutex_destroy in iio_dev_release()
    5c9737bba560f arm64: dts: rockchip: remove redundant max-link-speed from nanopi-r4s
    0f3a60869ca22 bpf: Do not let BPF test infra emit invalid GSO types to stack
    eca8bb92f9948 selftests/bpf: Check for timeout in perf_link test
    9d1807b442fc3 can: esd_usb: esd_usb_read_bulk_callback(): fix URB memory leak
    4d733efd584b5 dmaengine: ti: k3-udma: Enable second resource range for BCDMA and PKTDMA
    b75070823b890 migrate: correct lock ordering for hugetlb file folios
    c775ea4308949 gpio: cdev: Correct return code on memory allocation failure
    f72b579931d17 drm/amdgpu: remove frame cntl for gfx v12
    ea4a98e924164 can: usb_8dev: usb_8dev_read_bulk_callback(): fix URB memory leak
    94c9f6f7b953f can: mcba_usb: mcba_usb_read_bulk_callback(): fix URB memory leak
    94a7fc42e21c7 can: kvaser_usb: kvaser_usb_read_bulk_callback(): fix URB memory leak
    46a191ff7eeec can: ems_usb: ems_usb_read_bulk_callback(): fix URB memory leak
    3722109f21668 net: sfp: add potron quirk to the H-COM SPP425H-GAB4 SFP+ Stick
    084ba3b99f2df irqchip/gic-v3-its: Avoid truncating memory addresses
    5970673704c6c perf/x86/intel: Do not enable BTS for guests
    5c56a6f4b5a4f pmdomain: imx8m-blk-ctrl: Remove separate rst and clk mask for 8mq vpu
    b2e7996352520 platform/x86: hp-bioscfg: Fix automatic module loading
    94d1a8bd08af1 netrom: fix double-free in nr_route_frame()
    47634d7007389 uacce: ensure safe queue release with state management
    a407ddd61b3e6 uacce: implement mremap in uacce_vm_ops to return -EPERM
    fdbbb47d15ae1 uacce: fix isolate sysfs check condition
    98d67a1bd6cad uacce: fix cdev handling in the cleanup path
    e01f18c5af543 s390/ap: Fix wrong APQN fill calculation
    f609d3491a069 mei: trace: treat reg parameter as string
    0fca16c559153 intel_th: fix device leak on output open()
    327af07dff6ab tracing: Fix crash on synthetic stacktrace field usage
    54de72a7aabc0 slimbus: core: fix device reference leak on report present
    a6798c5f0d7da slimbus: core: fix runtime PM imbalance on report present
    0a070fd102235 octeontx2: Fix otx2_dma_map_page() error return code
    9773a886f2676 arm64: Set __nocfi on swsusp_arch_resume()
    0af233d66eff9 arm64/fpsimd: signal: Allocate SSVE storage when restoring ZA
    99129d80a5d49 wifi: rsi: Fix memory corruption due to not set vif driver data size
    99e6b136d69d6 wifi: mwifiex: Fix a loop in mwifiex_update_ampdu_rxwinsize()
    24585a13c41ea wifi: ath12k: fix dma_free_coherent() pointer
    5d6fa4d2c9799 wifi: ath10k: fix dma_free_coherent() pointer
    0807ca4c879c3 drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)
    de0ad7156036a mmc: sdhci-of-dwcmshc: Prevent illegal clock reduction in HS200/HS400 mode
    ec5eccf56026f mmc: rtsx_pci_sdmmc: implement sdmmc_card_busy function
    e6f103a22b08d ALSA: usb-audio: Fix use-after-free in snd_usb_mixer_free()
    27049f50be9f5 ALSA: scarlett2: Fix buffer overflow in config retrieval
    d77ba72558cd6 ALSA: ctxfi: Fix potential OOB access in audio mixer handling
    b7a0349a54ff3 iio: dac: ad5686: add AD5695R to ad5686_chip_info_tbl
    caee197b4d70b iio: chemical: scd4x: fix reported channel endianness
    f3807fbb1dd04 iio: adc: pac1934: Fix clamped value in pac1934_reg_snapshot
    d7b6fc224c7f5 iio: adc: at91-sama5d2_adc: Fix potential use-after-free in sama5d2_adc driver
    5ae10f7e613f8 iio: adc: ad9467: fix ad9434 vref mask
    cb99bd4f74997 iio: accel: iis328dq: fix gain values
    83befd303f0dd iio: accel: adxl380: fix handling of unavailable "INT1" interrupt
    3f8b3223c90cd of: platform: Use default match table for /firmware
    642cd023db5d1 of: fix reference count leak in of_alias_scan()
    da565bf98c9ad leds: led-class: Only Add LED to leds_list when it is fully ready
    9e23bd3e69fa2 keys/trusted_keys: fix handle passed to tpm_buf_append_name during unseal
    f4be921bc204c tpm: Compare HMAC values in constant time
    70ad9245f0439 x86: make page fault handling disable interrupts properly
    dfec0501dba8f dpll: Prevent duplicate registrations
    374915dfc932a net/sched: act_ife: avoid possible NULL deref
    c0e42fb0e054c vsock/virtio: cap TX credit to local buffer size
    1016df2c2928f vsock/test: fix seqpacket message bounds test
    d05bc313788f0 vsock/virtio: fix potential underflow in virtio_transport_get_credit()
    a8043681b11d7 net: openvswitch: fix data race in ovs_vport_get_upcall_stats
    1baa43ebca626 octeontx2-af: Fix error handling
    ac42e52979fbf net: dsa: fix off-by-one in maximum bridge ID determination
    bc3c8d2493c6f bonding: provide a net pointer to __skb_flow_dissect()
    11ff981e99c65 selftests: net: amt: wait longer for connection before sending packets
    47ffb4dcffe33 be2net: Fix NULL pointer dereference in be_cmd_get_mac_from_list
    aa647a1c02544 drm/nouveau: implement missing DCB connector types; gracefully handle unknown connectors
    68ff3e02978a7 drm/nouveau: add missing DCB connector types
    d833faf4b56f5 drm/amd/pm: Workaround SI powertune issue on Radeon 430 (v2)
    ada63e9ba061c drm/amd/pm: Don't clear SI SMC table when setting power limit
    eb24c281ee879 sched/fair: Fix pelt clock sync when entering idle
    cbd62b6075763 clocksource: Reduce watchdog readout delay limit to prevent false positives
    662dc80a5e86b usbnet: limit max_mtu based on device's hard_mtu
    2a2b9d25f801a ipv6: annotate data-race in ndisc_router_discovery()
    aa6e33cd74ca4 mISDN: annotate data-race around dev->work
    1edd38e6e9f56 net: hns3: fix the HCLGE_FD_AD_NXT_KEY error setting issue
    4e88144b4742e net: hns3: fix wrong GENMASK() for HCLGE_FD_AD_COUNTER_NUM_M
    22d0db49316d9 be2net: fix data race in be_get_new_eqd
    a758e781d0024 net: hns3: fix data race in hns3_fetch_stats
    bfb9d5448e3cb ice: Fix persistent failure in ice_get_rxfh
    d77379ca82efc netdevsim: fix a race issue related to the operation on bpf_bound_progs list
    8de11803656fe drm/imagination: Wait for FW trace update command completion
    b1144e52f0230 ALSA: usb: Increase volume range that triggers a warning
    1922468a4a804 scsi: qla2xxx: Sanitize payload size to prevent member overflow
    64ae21b9c4f0c scsi: core: Wake up the error handler when final completions race against each other
    1152dffe01af8 platform/x86/amd: Fix memory leak in wbrf_record()
    a392051d8d110 riscv: clocksource: Fix stimecmp update hazard on RV32
    bc5e2399e2456 kconfig: fix static linking of nconf
    4aab0ca0a0f77 regmap: Fix race condition in hwspinlock irqsave routine
    346775f2b4cf8 spi: spi-sprd-adi: Fix double free in probe error path
    935d0938b5705 interconnect: debugfs: initialize src_node and dst_node to empty strings
    c7ee18052d001 iio: adc: ad7280a: handle spi_setup() errors in probe()
    4d60ffcdedfe2 iio: imu: st_lsm6dsx: fix iio_chan_spec for sensors without event detection
    2e8ca1078b141 io_uring/io-wq: check IO_WQ_BIT_EXIT inside work run loop
    77752fe6d9931 mm/rmap: fix two comments related to huge_pmd_unshare()
    eba49c1dee9c5 platform/x86: hp-bioscfg: Fix kernel panic in GET_INSTANCE_ID macro
    6476be59b7162 platform/x86: hp-bioscfg: Fix kobject warnings for empty attribute names
    75aae6e389327 comedi: Fix getting range information for subdevices 16 to 255
    008778f708484 x86/kfence: avoid writing L1TF-vulnerable PTEs
    1648d1ac34fe1 arm64: dts: rockchip: Fix voltage threshold for volume keys for Pinephone Pro
    f25bbc106a088 arm64: dts: rockchip: remove dangerous max-link-speed from helios64
    32e52b56056da scsi: xen: scsiback: Fix potential memory leak in scsiback_remove()
    85a844b6c5a4c scsi: storvsc: Process unsupported MODE_SENSE_10
    d05944a3af709 Input: i8042 - add quirk for ASUS Zenbook UX425QA_UM425QA
    ea74433df6806 Input: i8042 - add quirks for MECHREVO Wujie 15X Pro
    df2033acf2654 Revert "nfc/nci: Add the inconsistency check between the input data length and count"
    47687092f2d62 w1: fix redundant counter decrement in w1_attach_slave_device()
    6fd6d2a8e41b7 w1: therm: Fix off-by-one buffer overflow in alarms_store
    99e6c370c5b87 comedi: dmm32at: serialize use of paged registers
    8a28894aba27a serial: 8250_pci: Fix broken RS485 for F81504/508/512
    d482e6593fd89 wifi: mac80211: don't perform DA check on S1G beacon
    161bdc90fce25 crypto: authencesn - reject too-short AAD (assoclen<8) to match ESP/ESN spec
    abd9fc26ea577 net/sched: qfq: Use cl_is_active to determine whether class is active in qfq_rm_from_ag
    4c7e8aa71c923 net/sched: Enforce that teql can only be used as root qdisc
    05388752c950b octeontx2: cn10k: fix RX flowid TCAM mask handling
    1f300c10d92c5 ipvlan: Make the addrs_lock be per port
    3d6d414b214ce l2tp: avoid one data-race in l2tp_tunnel_del_work()
    fab36d87e09cf veth: fix data race in veth_get_ethtool_stats
    b7db31a52c386 fou: Don't allow 0 for FOU_ATTR_IPPROTO.
    09fe0532cd652 tools: ynl: Specify --no-line-number in ynl-regen.sh.
    ce569b389a5c7 gue: Fix skb memleak with inner IP protocol 0.
    fbba89e7a1110 amd-xgbe: avoid misleading per-packet error log
    bf2b543b3cc4e sctp: move SCTP_CMD_ASSOC_SHKEY right after SCTP_CMD_PEER_INIT
    c610b550ccc04 can: gs_usb: gs_usb_receive_bulk_callback(): unanchor URL on usb_submit_urb() error
    f7d28b8b6784f selftests: net: fib-onlink-tests: Convert to use namespaces by default
    5cd158a88eef3 l2tp: Fix memleak in l2tp_udp_encap_recv().
    ef68afb1bee8d bonding: limit BOND_MODE_8023AD to Ethernet devices
    61173010fdfe3 net: usb: dm9601: remove broken SR9700 support
    568e9cd8ed7ca vsock/virtio: Coalesce only linear skb
    71b9f40b5be5c igc: fix race condition in TX timestamp read for register 0
    8fdfa207afdd9 igc: Restore default Qbv schedule when changing channels
    a5cb7456d59ef ice: Fix incorrect timeout ice_release_res()
    77407dc2d7eac ice: Avoid detrimental cleanup for bond during interface stop
    60bd8ff17b398 ice: initialize ring_stats->syncp
    37080e96acd96 ata: libata: Print features also for ATAPI devices
    ff50853f848c2 ata: libata: Call ata_dev_config_lpm() for ATAPI devices
    7ed741e68fc37 ata: libata-core: Introduce ata_dev_config_lpm()
    97593e2724c1a ata: libata: Add cpr_log to ata_dev_print_features() early return
    0dfe9069d1ce8 ata: libata-sata: Improve link_power_management_supported sysfs attribute
    f7e722acdb511 ata: ahci: Do not read the per port area for unimplemented ports
    7be5516fbf45b btrfs: fix missing fields in superblock backup with BLOCK_GROUP_TREE
    65130319ce0d1 Drivers: hv: Always do Hyper-V panic notification in hv_kmsg_dump()
    f878f9d0af0ae arm64: dts: qcom: sc8280xp: Add missing VDD_MXC links
    27f558bed5302 pmdomain: qcom: rpmhpd: Add MXC to SC8280XP
    1ce854343236f dt-bindings: power: qcom,rpmpd: Add SC8280XP_MXC_AO
    5d79846b7596c dt-bindings: power: qcom-rpmpd: split RPMh domains definitions
    584b63dc1bb48 dt-bindings: power: qcom,rpmpd: add Turbo L5 corner
    2411e8d383e89 dt-bindings: power: qcom,rpmpd: document the SM8750 RPMh Power Domains
    2e6908dadc36f testptp: Add option to open PHC in readonly mode
    fa361565a7275 selftest/ptp: update ptp selftest to exercise the gettimex options
    97529630d85f9 ptp: Add PHC file mode checks. Allow RO adjtime() without FMODE_WRITE.
    9fe52e15e1f1d posix-clock: Store file pointer in struct posix_clock_context
    abf529abd660d Linux 6.12.67
    7c734ad868cea mm/fake-numa: handle cases with no SRAT info
    df63d31e9ae02 mm/page_alloc: prevent pcp corruption with SMP=n
    22056349e8ec9 mm/page_alloc: batch page freeing in decay_pcp_high
    48273ed85fa0a mm/page_alloc/vmstat: simplify refresh_cpu_vm_stats change detection
    ce358252a943c dmaengine: fsl-edma: Fix clk leak on alloc_chan_resources failure
    027d42b97e6eb phy: rockchip: inno-usb2: Fix a double free bug in rockchip_usb2phy_probe()
    10f07114483d6 phy: phy-rockchip-inno-usb2: Use dev_err_probe() in the probe path
    c5b13f0b10faa mm: numa,memblock: include <asm/numa.h> for 'numa_nodes_parsed'
    a76f5cafcca47 mm/fake-numa: allow later numa node hotplug
    d1beb4dd8b8d4 mm: kmsan: fix poisoning of high-order non-compound pages
    2d402c6cc966e selftests/bpf: Test invalid narrower ctx load
    058a0da4f6d91 bpf: Reject narrower access to pointer ctx fields
    16236b0b4a08f mm/damon/sysfs-scheme: cleanup access_pattern subdirs on scheme dir setup failure
    b831557a0d20d mm/damon/sysfs-scheme: cleanup quotas subdirs on scheme dir setup failure
    5ee8005f72c4b xfs: set max_agbno to allow sparse alloc of last full inode chunk
    8b0bb145d3bc2 btrfs: fix deadlock in wait_current_trans() due to ignored transaction type
    68f7f10156fca HID: intel-ish-hid: Fix -Wcast-function-type-strict in devm_ishtp_alloc_workqueue()
    e79b03d386341 HID: intel-ish-hid: Use dedicated unbound workqueues to prevent resume blocking
    23133e0470d28 dmaengine: ti: k3-udma: fix device leak on udma lookup
    f810132e82558 dmaengine: ti: dma-crossbar: fix device leak on am335x route allocation
    e50b9bf91d1f3 dmaengine: ti: dma-crossbar: fix device leak on dra7x route allocation
    f45cafe3b6bfb dmaengine: stm32: dmamux: fix OF node leak on route allocation failure
    2fb10259d4efb dmaengine: stm32: dmamux: fix device leak on route allocation
    9969db4816aed dmaengine: sh: rz-dmac: Fix rz_dmac_terminate_all()
    01b1d781394fc dmaengine: qcom: gpi: Fix memory leak in gpi_peripheral_config()
    618a8229911ea dmaengine: lpc32xx-dmamux: fix device leak on route allocation
    992eb8055a6e5 dmaengine: lpc18xx-dmamux: fix device leak on route allocation
    0c97ff108f825 dmaengine: idxd: fix device leaks on compat bind and unbind
    8f7a391211381 dmaengine: dw: dmamux: fix OF node leak on route allocation failure
    db6f1d6d31711 dmaengine: bcm-sba-raid: fix device leak on probe
    6a86cf2c09e14 dmaengine: at_hdmac: fix device leak on of_dma_xlate()
    aca18ac3332b0 dmaengine: apple-admac: Add "apple,t8103-admac" compatible
    5319234215729 LoongArch: dts: loongson-2k2000: Add default interrupt controller address cells
    4df476a33687b LoongArch: dts: loongson-2k1000: Fix i2c-gpio node names
    9cce27181e9ad LoongArch: dts: loongson-2k1000: Add default interrupt controller address cells
    94b010200a3c9 LoongArch: dts: loongson-2k0500: Add default interrupt controller address cells
    ef4af7597fd8b drm/vmwgfx: Fix an error return check in vmw_compat_shader_add()
    04218cd68d150 drm/panel-simple: fix connector type for DataImage SCF0700C48GGU18 panel
    6a4e619c4209e drm/nouveau/disp/nv50-: Set lock_core in curs507a_prepare
    819c417a30aa7 drm/amdkfd: fix a memory leak in device_queue_manager_init()
    8140ac7c55e75 drm/amd: Clean up kfd node on surprise disconnect
    ae5b1d291c814 drm/amd/display: Bump the HDMI clock to 340MHz
    df7a49b328928 LoongArch: Fix PMU counter allocation for mixed-type event groups
    5651c0c391c00 mm/damon/sysfs: cleanup attrs subdirs on context dir setup failure
    654fa76032eee mm/page_alloc: make percpu_pagelist_high_fraction reads lock-free
    550c228cb0e83 mm/zswap: fix error pointer free in zswap_cpu_comp_prepare()
    a705886ac8ef2 nvme: fix PCIe subsystem reset controller state transition
    05cea40d333bd x86/resctrl: Fix memory bandwidth counter width for Hygon
    56377881cd94d x86/resctrl: Add missing resctrl initialization for Hygon
    469f8fe4c87e4 i2c: riic: Move suspend handling to NOIRQ phase
    eaff85ada8526 tcpm: allow looking for role_sw device in the main node
    df643bfe1d808 EDAC/i3200: Fix a resource leak in i3200_probe1()
    4433ddc3700ce EDAC/x38: Fix a resource leak in x38_probe1()
    0e66a004a3632 hrtimer: Fix softirq base check in update_needs_ipi()
    8e8542c539927 ext4: fix iloc.bh leak in ext4_xattr_inode_update_ref
    60f7e00894350 ASoC: codecs: wsa881x: fix unnecessary initialisation
    2617495ba77ba nvme-pci: disable secondary temp for Wodposit WPBSNM8
    7f78a77c3e16a USB: serial: ftdi_sio: add support for PICAXE AXE027 cable
    fe9175e9127f4 USB: serial: option: add Telit LE910 MBIM composition
    5400370f29b68 USB: OHCI/UHCI: Add soft dependencies on ehci_platform
    17b7ddee0eb40 usb: core: add USB_QUIRK_NO_BOS for devices that hang on BOS descriptor
    f07f660d52cf7 usb: dwc3: Check for USB4 IP_NAME
    40a753a906787 phy: tegra: xusb: Explicitly configure HS_DISCON_LEVEL to 0x7
    28ec201d87454 phy: rockchip: inno-usb2: fix disconnection in gadget mode
    24d759976a4a7 phy: freescale: imx8m-pcie: assert phy reset during power on
    66fcfceee2549 phy: ti: gmii-sel: fix regmap leak on probe failure
    9659ba4217de2 phy: rockchip: inno-usb2: fix communication disruption in gadget mode
    bba9e08d189e4 x86/kaslr: Recognize all ZONE_DEVICE users as physaddr consumers
    b11dfb7708f21 lib/buildid: use __kernel_read() for sleepable context
    87c3ced649fef xfs: Fix the return value of xfs_rtcopy_summary()
    cb2a610867bc3 net: can: j1939: j1939_xtp_rx_rts_session_active(): deactivate session upon receiving the second rts
    ca99392876e4e can: ctucanfd: fix SSP_SRC in cases when bit-rate is higher than 1 MBit.
    08624b7206ddb can: gs_usb: gs_usb_receive_bulk_callback(): fix URB memory leak
    d59ba448ccd59 null_blk: fix kmemleak by releasing references to fault configfs items
    e3073d119c0bb ALSA: pcm: Improve the fix for race of buffer access at PCM OSS layer
    bfa97e3cc0692 scsi: core: Fix error handler encryption support
    42ba3197a5d2b io_uring: move local task_work in exit cancel loop
    7934cb03dc233 drm/amd/display: mark static functions noinline_for_stack
    f394aa2e4217e ASoC: codecs: wsa883x: fix unnecessary initialisation
    bdced577da71b bridge: mcast: Fix use-after-free during router port configuration
    bb719f86be14b HID: usbhid: paper over wrong bNumDescriptor field
    36c627d3a2ba6 i2c: qcom-geni: make sure I2C hub controllers can't use SE DMA
    4b93712e96be1 dmaengine: omap-dma: fix dma_pool resource leak in error paths
    69566a1b88d91 selftests/landlock: Properly close a file descriptor
    0a7f3d4c9d5d4 phy: broadcom: ns-usb3: Fix Wvoid-pointer-to-enum-cast warning (again)
    64bf182dfb429 selftests/landlock: Remove invalid unix socket bind()
    68495f89a19b6 selftests/landlock: Fix TCP bind(AF_UNSPEC) test case
    fe2401c5d8215 phy: ti: da8xx-usb: Handle devm_pm_runtime_enable() errors
    b91c9f6bfb04e phy: stm32-usphyc: Fix off by one in probe()
    d50a9b7fd0729 phy: qcom-qusb2: Fix NULL pointer dereference on early suspend
    742de96d936ee phy: drop probe registration printks
    00dc370dfba94 phy: phy-snps-eusb2: refactor constructs names
    2b36202354f7f phy: fsl-imx8mq-usb: Clear the PCS_TX_SWING_FULL field before using it
    99dccb81cba85 dmaengine: xilinx_dma: Fix uninitialized addr_width when "xlnx,addrwidth" property is missing
    cb2c9c4bb1322 dmaengine: tegra-adma: Fix use-after-free
    606ea969e7829 dmaengine: xilinx: xdma: Fix regmap max_register
    a1bf8ea50cbc4 mm, kfence: describe @slab parameter in __kfence_obj_info()
    d11475ea5c2a5 textsearch: describe @list member in ts_ops search
    7a01b91ad6327 mm: describe @flags parameter in memalloc_flags_save()
    efb769dd9e479 drm/amd/pm: fix smu overdrive data type wrong issue on smu 14.0.2
    e35a9085b4808 ASoC: tlv320adcx140: fix word length
    61757f5191daa ASoC: tlv320adcx140: fix null pointer
    fa4744e659e14 ASoC: sdw_utils: cs42l43: Enable Headphone pin for LINEOUT jack type
    362e269bb03f7 net/sched: sch_qfq: do not free existing class in qfq_change_class()
    1e9d2b422fb68 selftests: drv-net: fix RPS mask handling for high CPU numbers
    2684610a9c9c5 ipv6: Fix use-after-free in inet6_addr_del().
    4cd55c609e85a net: hv_netvsc: reject RSS hash key programming without RX indirection table
    29a3c30b911f0 ALSA: hda/cirrus_scodec_test: Fix incorrect setup of gpiochip
    aa05a8371ae4a net: octeon_ep_vf: fix free_irq dev_id mismatch in IRQ rollback
    bb4fa4c0b54aa btrfs: fix memory leaks in create_space_info() error paths
    190d5a7c4fe42 btrfs: introduce btrfs_space_info sub-group
    d046ff8e554e4 btrfs: factor out check_removing_space_info() from btrfs_free_block_groups()
    3351d4825185b btrfs: factor out init_space_info() from create_space_info()
    32e93a14170a2 net/mlx5e: Restore destroying state bit after profile cleanup
    a7625bacaa8c8 net/mlx5e: Pass netdev to mlx5e_destroy_netdev instead of priv
    dcb2ad755a16c net/mlx5e: Don't store mlx5e_priv in mlx5e_dev devlink priv
    dad52950b409d net/mlx5e: Fix crash on profile change rollback failure
    b7e11383ef3cf vsock/test: add a final full barrier after run all tests
    aa57bfea4674e ipv4: ip_gre: make ipgre_header() robust
    8518712a2ca95 macvlan: fix possible UAF in macvlan_forward_source()
    dfd1f962f2773 net: update netdev_lock_{type,name}
    df5ffde966931 ip6_tunnel: use skb_vlan_inet_prepare() in __ip6_tnl_rcv()
    6dabb5b89ccec net: bridge: annotate data-races around fdb->{updated,used}
    db00636643e66 btrfs: send: check for inline extents in range_is_hole_in_parent()
    3def524315071 nvme-tcp: fix NULL pointer dereferences in nvmet_tcp_build_pdu_iovec
    ba45e3d6b02c9 can: etas_es58x: allow partial RX URB allocation to succeed
    c6dc745bba80e PM: EM: Fix incorrect description of the cost field in struct em_perf_state
    b0c5a56de1951 drm/vmwgfx: Merge vmw_bo_release and vmw_bo_free functions
    0e036606b29fb pnfs/blocklayout: Fix memory leak in bl_parse_scsi()
    86da7efd12295 pnfs/flexfiles: Fix memory leak in nfs4_ff_alloc_deviceid_node()
    49d352bc263fe NFS: Fix a deadlock involving nfs_release_folio()
    a316fd9d3065b pNFS: Fix a deadlock when returning a delegation during open()
    a2a3c7bf2c0cd xfrm: set ipv4 no_pmtu_disc flag only on output sa when direction is set
    f93a187c255f5 xfrm: Fix inner mode lookup in tunnel mode GSO segmentation
    cce714dffcc6e ASoC: codecs: wsa884x: fix codec initialisation
    f577508cc8a0a x86/fpu: Clear XSTATE_BV[i] in guest XSAVE state whenever XFD[i]=1
    d6bb04690b5be Revert "gfs2: Fix use of bio_chain"
    81dcb27e9b596 efi/cper: Fix cper_bits_to_str buffer handling and return value
    1f819393de23f firmware: imx: scu-irq: Set mu_resource_id before get handle
    f6044d1fd846e Linux 6.12.66
    9e3f8fa53348a bpf: test_run: Fix ctx leak in bpf_prog_test_run_xdp error path
    f8b4061987788 ALSA: hda: intel-dsp-config: Prefer legacy driver as fallback
    47e676ce4d68f tpm2-sessions: Fix out of range indexing in name_size
    42440155fe275 spi: cadence-quadspi: Prevent lost complete() call during indirect read
    3762535fbbc09 scsi: sg: Fix occasional bogus elapsed time that exceeds timeout
    0810c8e94d6b3 ASoC: fsl_sai: Add missing registers to cache default
    1d2a10913089f ALSA: hda/realtek: enable woofer speakers on Medion NM14LNL
    8072299bf13f1 ASoC: amd: yc: Add quirk for Honor MagicBook X16 2025
    44ed8fae346fe ALSA: usb-audio: Update for native DSD support quirks
    ba6f0d1832eeb can: j1939: make j1939_session_activate() fail if device is no longer registered
    47206d70d1fba drm/amdkfd: Fix improper NULL termination of queue restore SMI event string
    1c06d85c3d511 spi: mt65xx: Use IRQF_ONESHOT with threaded IRQ
    f609041424d56 drm/amd/display: Fix DP no audio issue
    9f6cf07687bef ata: libata-core: Disable LPM on ST2000DM008-2FR102
    14fa3d1927f13 netfilter: nf_tables: avoid chain re-validation if possible
    feb28b6827ece powercap: fix sscanf() error return value handling
    3835d59f69993 powercap: fix race condition in register_control_type()
    7b60aed82db15 net: sfp: extend Potron XGSPON quirk to cover additional EEPROM variant
    fb9ef40cccdba bpf: Fix reference count leak in bpf_prog_test_run_xdp()
    6447e697cfa8a bpf, test_run: Subtract size of xdp_frame from allowed metadata size
    6611a73b29916 bpf: Support specifying linear xdp packet data size for BPF_PROG_TEST_RUN
    0eb6e9d3b7249 bpf: Make variables in bpf_prog_test_run_xdp less confusing
    202c5b915e22a bpf: Fix an issue in bpf_prog_test_run_xdp when page size greater than 4K
    5c647749bce3f btrfs: fix beyond-EOF write handling
    afbb57899612a btrfs: use variable for end offset in extent_writepage_io()
    a915072e5ac3c btrfs: truncate ordered extent when skipping writeback past i_size
    7216d78ca34f1 btrfs: remove btrfs_fs_info::sectors_per_page
    ced5459df05a1 btrfs: add extra error messages for delalloc range related errors
    fb4fa3f9012bb btrfs: subpage: dump the involved bitmap when ASSERT() failed
    9ed14c3b787ba btrfs: fix error handling of submit_uncompressed_range()
    fcc04c92cbb54 ALSA: ac97: fix a double free in snd_ac97_controller_register()
    71138011dc014 ALSA: ac97bus: Use guard() for mutex locks
    7388ba6e5ccd4 erofs: fix file-backed mounts no longer working on EROFS partitions
    d47b03775d550 erofs: don't bother with s_stack_depth increasing for now
    dd6ccec088adf arp: do not assume dev_hard_header() does not change skb->head
    de77d2cd178af net: enetc: fix build warning when PAGE_SIZE is greater than 128K
    471dfb97599ee net: usb: pegasus: fix memory leak in update_eth_regs_async()
    43497313d0da3 net/sched: sch_qfq: Fix NULL deref when deactivating inactive aggregate in qfq_reset
    3d67e8c22685f HID: quirks: work around VID/PID conflict for appledisplay
    4969d6fa61af3 net: netdevsim: fix inconsistent carrier state after link/unlink
    d916df47a031e idpf: cap maximum Rx buffer size
    a4212d6732e3f idpf: fix memory leak in idpf_vport_rel()
    be3d312761995 idpf: keep the netdev when a reset fails
    3264881431e30 net: fix memory leak in skb_segment_list for GRO packets
    92ff65c660eb9 riscv: pgtable: Cleanup useless VA_USER_XXX definitions
    1eeaaeceafcfd btrfs: only enforce free space tree if v1 cache is required for bs < ps cases
    6762937a8b454 vsock: Make accept()ed sockets use custom setsockopt()
    f1029391e6043 bnxt_en: Fix potential data corruption with HW GRO/LRO
    57f1dd8fa9668 net: wwan: iosm: Fix memory leak in ipc_mux_deinit()
    9e0f54294fae1 net/mlx5e: Don't print error message due to invalid module
    b71d08b968645 netdev: preserve NETIF_F_ALL_FOR_ALL across TSO updates
    005671c60fcf1 net: sock: fix hardened usercopy panic in sock_recv_errqueue
    50f65526b33d2 inet: ping: Fix icmp out counting
    03fb1708b7d1e net: mscc: ocelot: Fix crash when adding interface under a lag
    269c9283ff7f2 bridge: fix C-VLAN preservation in 802.1ad vlan_tunnel egress
    3950054c9512a net: marvell: prestera: fix NULL dereference on devlink_alloc() failure
    26a82dce2beee netfilter: nf_conncount: update last_gc only when GC has been performed
    e1a436981ac95 netfilter: nf_tables: fix memory leak in nf_tables_newrule()
    cdafa52ad39b7 gpio: pca953x: handle short interrupt pulses on PCAL devices
    d4f333a0155d9 gpio: pca953x: Add support for level-triggered interrupts
    dd42e23b6d9e1 netfilter: nft_synproxy: avoid possible data-race on update operation
    16b4508e87178 netfilter: nft_set_pipapo: fix range overlap detection
    b397bb9c34acf arm64: dts: mba8mx: Fix Ethernet PHY IRQ support
    97fdde3189b6f arm64: dts: imx8qm-ss-dma: correct the dma channels of lpuart
    35b38dd6a7923 arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on DH electronics i.MX8M Plus DHCOM
    88d60cff3000c ARM: dts: imx6q-ba16: fix RTC interrupt level
    3e458210ee2c3 arm64: dts: add off-on-delay-us for usdhc2 regulator
    06b1dfa40090b crypto: qat - fix duplicate restarting msg during AER error
    8f6afb1664028 arm64: dts: ti: k3-am62-lp-sk-nand: Rename pinctrls to fix schema warnings
    75e2bc2985f4a drm/amd/display: Apply e4479aecf658 to dml
    163df8d79a0d2 drm/amd/display: Respect user's CONFIG_FRAME_WARN more for dml files
    582ba48e4a4c0 btrfs: fix NULL dereference on root when tracing inode eviction
    ec3695dd0acd5 btrfs: tracepoints: use btrfs_root_id() to get the id of a root
    53df7a4c3a564 btrfs: qgroup: update all parent qgroups when doing quick inherit
    b9b19fecad7d5 btrfs: fix qgroup_snapshot_quick_inherit() squota bug
    dedec6e6b4215 scsi: Revert "scsi: libsas: Fix exp-attached device scan after probe failure scanned in again after probe failed"
    496ca70a15f4d scsi: ufs: core: Fix EH failure after W-LUN resume error
    f373695d62e05 scsi: ipr: Enable/disable IRQD_NO_BALANCING during reset
    261233f765d2a smb/client: fix NT_STATUS_NO_DATA_DETECTED value
    596d1b9686604 smb/client: fix NT_STATUS_DEVICE_DOOR_OPEN value
    b1dd686016766 smb/client: fix NT_STATUS_UNABLE_TO_FREE_VM value
    e83af97d5c391 drm/amd/display: shrink struct members
    a8559efcd5760 NFS: Fix up the automount fs_context to use the correct cred
    71029266093b6 ASoC: rockchip: Fix Wvoid-pointer-to-enum-cast warning (again)
    e1df03e293a0b NFSv4: ensure the open stateid seqid doesn't go backwards
    6a1099604b0ca dm-snapshot: fix 'scheduling while atomic' on real-time kernels
    f002df3a33051 alpha: don't reference obsolete termio struct for TC* constants
    1b645cd729ef8 ARM: 9461/1: Disable HIGHPTE on PREEMPT_RT kernels
    7010683101b56 csky: fix csky_cmpxchg_fixup not working
    32dc49f49ea0f drm/xe: Ensure GT is in C0 during resumes
    e724d0261b7cf drm/xe: make xe_gt_idle_disable_c6() handle the forcewake internally
    f09cd209359a2 tls: Use __sk_dst_get() and dst_dev_rcu() in get_netdev_for_sock().
    6f468f6ff233c libceph: make calc_target() set t->paused, not just clear it
    e94075e950a65 libceph: reset sparse-read state in osd_fault()
    d2c4a5f699668 libceph: return the handler error from mon_handle_auth_done()
    c4c2152a858c0 libceph: make free_choose_arg_map() resilient to partial allocation
    6c6cec3db3b41 libceph: replace overzealous BUG_ON in osdmap_apply_incremental()
    2802ef3380fa8 libceph: prevent potential out-of-bounds reads in handle_auth_done()
    f94f95b817360 wifi: mac80211: restore non-chanctx injection behaviour
    024f71a57d563 wifi: avoid kernel-infoleak from struct iw_point
    fcb7500bfa24c pinctrl: qcom: lpass-lpi: mark the GPIO controller as sleeping
    321e17ff31427 gpio: rockchip: mark the GPIO controller as sleeping
    7500ab83bad20 drm/radeon: Remove __counted_by from ClockInfoArray.clockInfo[]
    bc96db7051ccc drm/pl111: Fix error handling in pl111_amba_probe
    90b4b130a20d8 drm/amdgpu: Fix query for VPE block_type and ip_count
    49a66829dd365 counter: interrupt-cnt: Drop IRQF_NO_THREAD flag
    c61440f1e7417 counter: 104-quad-8: Fix incorrect return value in IRQ handler
    196e8fd7424b6 lib/crypto: aes: Fix missing MMU protection for AES S-box
    97130283b83fe mei: me: add nova lake point S DID
    0c2413c69129f btrfs: always detect conflicting inodes when logging inode refs
    8b402146e3a8e arm64: Fix cleared E0POE bit after cpu_suspend()/resume()
    2f05f7737e16d net: 3com: 3c59x: fix possible null dereference in vortex_probe1()
    1320d94a4df1c atm: Fix dma_free_coherent() size
    3f5d7f3865c6f NFSD: Remove NFSERR_EAGAIN
    8c1cf63ed4652 NFSD: net ref data still needs to be freed even if net hasn't startup
    d95499900fe52 nfsd: check that server is running in unlock_filesystem
    03c68f94fad13 nfsd: use correct loop termination in nfsd4_revoke_states()
    ba4811c8b433b nfsd: provide locking for v4_end_grace
    6b7ad17f4dd59 NFSD: Fix permission check for read access to executable-only files
    39cb076c7dc7e Linux 6.12.65
    b00d41629d81f Revert "iommu/amd: Skip enabling command/event buffers for kdump"
    69f542a54578a pwm: stm32: Always program polarity
    828b59fdf8ef2 virtio_console: fix order of fields cols and rows
    1b9c118fe318a sched/fair: Proportional newidle balance
    c6ae271bc5fd4 sched/fair: Small cleanup to update_newidle_cost()
    52aa889c6f57f sched/fair: Small cleanup to sched_balance_newidle()
    4888e1dcc341e net: Remove RTNL dance for SIOCBRADDIF and SIOCBRDELIF.
    b03136582acb5 cpufreq: intel_pstate: Check IDA only before MSR_IA32_PERF_CTL writes
    c4d18e9540bf2 drm/amdgpu: Forward VMID reservation errors
    585dbb5cdbb84 net: phy: mediatek: fix nvmem cell reference leak in mt798x_phy_calibration
    7b240a8935d55 wifi: mac80211: Discard Beacon frames to non-broadcast address
    1c7c3a9314d8a mptcp: ensure context reset on disconnect()
    58a32633d1240 mm: consider non-anon swap cache folios in folio_expected_ref_count()
    11f66b84fa7eb mm: simplify folio_expected_ref_count()
    9147690488180 mm/page_alloc: change all pageblocks migrate type on coalescing
    79f80a7a47849 mptcp: fallback earlier on simult connection
    1a4a7249e794d Linux 6.12.64
    c8cdc025a6d24 block: fix NULL pointer dereference in blk_zone_reset_all_bio_endio()
    51297686e00f4 iomap: allocate s_dio_done_wq for async reads as well
    b1671989173db mm/damon/tests/vaddr-kunit: handle alloc failures on damon_do_test_apply_three_regions()
    7ca5ed830df43 mm/damon/tests/core-kunit: handle alloc failres in damon_test_new_filter()
    d13c133704a63 mm/damon/tests/core-kunit: handle alloc failures on damon_test_split_regions_of()
    ce19b17163616 vfio/pci: Disable qword access to the PCI ROM bar
    527a73d111a65 media: amphion: Remove vpu_vb_is_codecconfig
    915775d037102 media: amphion: Make some vpu_v4l2 functions static
    ce6f2d63edcd7 media: amphion: Add a frame flush mode for decoder
    b92c19675f632 media: mediatek: vcodec: Use spinlock for context list protection lock
    a219c54a15c42 powerpc/pseries/cmm: adjust BALLOON_MIGRATE when migrating pages
    1d71d509b413e mm/balloon_compaction: convert balloon_page_delete() to balloon_page_finalize()
    451b0ed48e1ff mm/balloon_compaction: we cannot have isolated pages in the balloon list
    38aa6ca6285ff PCI: brcmstb: Fix disabling L0s capability
    b4e2b74f69781 PCI: brcmstb: Set MLW based on "num-lanes" DT property if present
    8d185636a6299 PCI: brcmstb: Reuse pcie_cfg_data structure
    ebdbe19336f26 ASoC: renesas: rz-ssi: Fix rz_ssi_priv::hw_params_cache::sample_width
    985131a81ef6f ASoC: qcom: sdw: fix memory leak for sdw_stream_runtime
    28b2ec0662a81 soundwire: stream: extend sdw_alloc_stream() to take 'type' parameter
    2cd2003f7b360 block: handle zone management operations completions
    1fe39f5030412 ASoC: renesas: rz-ssi: Fix channel swap issue in full duplex mode
    f5b7f49bd2377 gve: defer interrupt enabling until NAPI registration
    d579cc549298a hrtimers: Make hrtimer_update_function() less expensive
    6b60113d77023 idpf: remove obsolete stashing code
    a7a7bff258e1f idpf: stop Tx if there are insufficient buffer resources
    e3e11c9db1658 idpf: replace flow scheduling buffer ring with buffer pool
    702c417b5719e idpf: simplify and fix splitq Tx packet rollback error path
    2d799d58d4021 idpf: improve when to set RE bit logic
    e8f9e3ec17a24 idpf: add support for Tx refillqs in flow scheduling mode
    b82cc442aa533 idpf: trigger SW interrupt when exiting wb_on_itr mode
    f2a43c70e517e idpf: add support for SW triggered interrupts
    d7d4c3884c99c wifi: mt76: mt7925: add handler to hif suspend/resume event
    cce9746046c97 wifi: mt76: mt7925: fix CLC command timeout when suspend/resume
    08c5a901fdf0b wifi: mt76: mt7925: fix the unfinished command of regd_notifier before suspend
    620f9d7bcf771 media: i2c: imx219: Fix 1920x1080 mode to use 1:1 pixel aspect ratio
    adcef72bc9bcf x86/microcode/AMD: Select which microcode patch to load
    6be62c78aed57 tty: fix tty_port_tty_*hangup() kernel-doc
    70390c48d6eb4 serial: core: Fix serial device initialization
    d1944bab8e0c1 usbnet: Fix using smp_processor_id() in preemptible code warnings
    5d1be493d1110 net: use dst_dev_rcu() in sk_setup_caps()
    8e8d6bf68633d ipv6: adopt dst_dev() helper
    1e28e7701b109 net: ipv6: ioam6: use consistent dst names
    8355eea2a2e9c drm/panthor: Flush shmem writes before mapping buffers CPU-uncached
    31ff67982c5fa md/raid10: wait barrier before returning discard request with REQ_NOWAIT
    4ab2cd906e4e1 netfilter: nft_ct: add seqadj extension for natted connections
    f21e4cc4a6baf gpiolib: acpi: Add quirk for Dell Precision 7780
    8b822b35ac6e6 gpiolib: acpi: Add quirk for ASUS ProArt PX13
    c1af28f23ab24 gpiolib: acpi: Add a quirk for Acer Nitro V15
    b2023685b2de4 gpiolib: acpi: Move quirks to a separate file
    134d014bc64fb gpiolib: acpi: Add acpi_gpio_need_run_edge_events_on_boot() getter
    7d76825dcd8a8 gpiolib: acpi: Handle deferred list via new API
    c53dffad86075 gpiolib: acpi: Switch to use enum in acpi_gpio_in_ignore_list()
    d01cdf6425242 f2fs: fix to propagate error from f2fs_enable_checkpoint()
    341f6a26bfa92 f2fs: dump more information for f2fs_{enable,disable}_checkpoint()
    621dc9eb90a59 f2fs: add timeout in f2fs_enable_checkpoint()
    cccd92ec7e344 f2fs: clear SBI_POR_DOING before initing inmem curseg
    fdca9bfd6206c serial: xilinx_uartps: fix rs485 delay_rts_after_send
    589ec2d37e386 serial: xilinx_uartps: Use helper function hrtimer_update_function()
    12493e7e888d2 hrtimers: Introduce hrtimer_update_function()
    f548c5ebe6565 drm/displayid: add quirk to ignore DisplayID checksum errors
    d4dd6694d1021 sched_ext: Fix missing post-enqueue handling in move_local_task_to_local_dsq()
    44273abc2fea0 sched_ext: Factor out local_dsq_post_enq() from dispatch_enqueue()
    a3b7eb67225c4 tpm2-sessions: Fix tpm2_read_public range checks
    aa85f48dfc55b block: freeze queue when updating zone resources
    65484682b1b0d ARM: dts: microchip: sama7g5: fix uart fifo size to 32
    5f140b525180c svcrdma: bound check rq_pages index in inline path
    6673d1d818f04 mm/ksm: fix exec/fork inheritance support for prctl
    984dc07404e2d mptcp: pm: ignore unknown endpoint flags
    2494b4d8a1ba4 serial: core: Restore sysfs fwnode information
    1060180f3619e serial: core: fix OF node leak
    0bf1a02494c7e f2fs: fix to avoid updating compression context during writeback
    5796c5382101f f2fs: drop inode from the donation list when the last file is closed
    1eb0b130196bc f2fs: use global inline_xattr_slab instead of per-sb slab cache
    baf1a27e5664d f2fs: fix to detect recoverable inode during dryrun of find_fsync_dnodes()
    e750e2f2a2dd2 xhci: dbgtty: fix device unregister: fixup
    2299e3ba1247c tty: introduce and use tty_port_tty_vhangup() helper
    686e3762980f5 jbd2: fix the inconsistency between checksum and data in memory for journal sb
    e61f636cc3104 sched_ext: Fix incorrect sched_class settings for per-cpu migration tasks
    5b9cc2bbde858 erofs: fix unexpected EIO under memory pressure
    bddd95054e33c sched/eevdf: Fix min_vruntime vs avg_vruntime
    c8d4f4c2528bf btrfs: don't rewrite ret from inode_permission
    a94048d99318b gfs2: fix freeze error handling
    7578200fa9234 lib/crypto: riscv/chacha: Avoid s0/fp register
    8a8c1e06c8381 drm/imagination: Disallow exporting of PM/FW protected objects
    64e39e3806bff drm/nouveau/dispnv50: Don't call drm_atomic_get_crtc_state() in prepare_fb
    24d55ac8e31d2 drm/i915/gem: Zero-initialize the eb.vma array in i915_gem_do_execbuffer
    471baae774a30 drm/msm/dpu: Add missing NULL pointer check for pingpong interface
    700cd81dc5af2 drm/xe: Drop preempt-fences when destroying imported dma-bufs.
    dd3278ebfc04e drm/xe: Use usleep_range for accurate long-running workload timeslicing
    d420cea5199a0 drm/xe: Adjust long-running workload timeslices to reasonable values
    641797734d077 drm/xe/oa: Disallow 0 OA property values
    4f26159adc9c0 drm/xe/bo: Don't include the CCS metadata in the dma-buf sg-table
    106af2a55b854 drm/mgag200: Fix big-endian support
    5a81095d3e1b5 drm/ttm: Avoid NULL pointer deref for evicted BOs
    a742fa0aa2169 drm/i915: Fix format string truncation warning
    f9465376fe190 drm/amdkfd: Trap handler support for expert scheduling mode
    b5971d0cc5039 drm/amdkfd: bump minimum vgpr size for gfx1151
    df130b75e955e drm/amdkfd: Export the cwsr_size and ctl_stack_size to userspace
    3eb34432ea946 drm/mediatek: Fix probe device leaks
    49ec28aaa334b drm/mediatek: Fix probe memory leak
    bd5ce36c41813 drm/mediatek: Fix probe resource leaks
    27e44ca6465e3 drm/mediatek: Fix device node reference leak in mtk_dp_dt_parse()
    c6d30b65b7a44 drm/xe/oa: Fix potential UAF in xe_oa_add_config_ioctl()
    5c831abdf7420 drm/edid: add DRM_EDID_IDENT_INIT() to initialize struct drm_edid_ident
    0a82fb3f58270 drm/gma500: Remove unused helper psb_fbdev_fb_setcolreg()
    6417428ce5da9 drm/buddy: Separate clear and dirty free block trees
    1b339b19eec28 drm/buddy: Optimize free block management with RB tree
    e317afd8db9e6 drm/msm/a6xx: Fix out of bound IO access in a6xx_get_gmu_registers
    5fc5506edfe02 drm/amdgpu/gmc11: add amdgpu_vm_handle_fault() handling
    2ba843759a3ae drm/amdgpu: add missing lock to amdgpu_ttm_access_memory_sdma
    c0cd4bfb729b4 drm/amdgpu/gmc12: add amdgpu_vm_handle_fault() handling
    f9a4ec64a6267 Revert "drm/amd: Skip power ungate during suspend for VPE"
    f5c055c284156 net: macb: Relocate mog_init_rings() callback from macb_mac_link_up() to macb_open()
    8fc4632fb5084 net: nfc: fix deadlock between nfc_unregister_device and rfkill_fop_write
    96634d108a17f net: usb: sr9700: fix incorrect command used to write single register
    cb0255265fa02 nfsd: Drop the client reference in client_states_open()
    0d666db731e95 LoongArch: BPF: Sign extend kfunc call arguments
    fcaafcc27ba5b LoongArch: BPF: Zero-extend bpf_tail_call() index
    bb92a3af3ce58 LoongArch: Refactor register restoration in ftrace_common_return
    73feae0c71bde fjes: Add missing iounmap in fjes_hw_init()
    26c8bebc2f252 e1000: fix OOB in e1000_tbi_should_accept()
    5cb34bb5fd726 RDMA/cm: Fix leaking the multicast GID table reference
    acadd4097d25d RDMA/core: Check for the presence of LS_NLA_TYPE_DGID correctly
    c9d0f5a18bd7e samples/ftrace: Adjust LoongArch register restore order in direct calls
    2197c4c6bda54 tools/mm/page_owner_sort: fix timestamp comparison for stable sorting
    802934da00a88 x86/microcode/AMD: Fix Entrysign revision check for Zen5/Strix Halo
    7fbea59f737eb mm/page_owner: fix memory leak in page_owner_stack_fops->release()
    36cdde5c28c9a idr: fix idr_alloc() returning an ID out of range
    181bb6766762a lockd: fix vfs_test_lock() calls
    365178de51ac6 kasan: unpoison vms[area] addresses with a common tag
    c00ca876e0732 kasan: refactor pcpu kasan vmalloc unpoison
    69676792c23f2 mm/kasan: fix incorrect unpoisoning in vrealloc for KASAN
    3d2c0eb678196 compiler_types.h: add "auto" as a macro for "__auto_type"
    a4a4599b9164a pmdomain: imx: Fix reference count leak in imx_gpc_probe()
    365cd49669a68 mm/damon/tests/core-kunit: handle alloc failure on damon_test_set_attrs()
    ffec0aa4750f9 mm/damon/tests/core-kunit: handle alloc failures in damon_test_ops_registration()
    e74033baf900f mm/damon/tests/core-kunit: handle alloc failures in damon_test_update_monitoring_result()
    b4993197d6cb9 mm/damon/tests/core-kunit: handle alloc failures in damon_test_set_regions()
    360077a2aa33e mm/damon/tests/core-kunit: handle alloc failures on damon_test_merge_two()
    62d66eb0ce63d mm/damon/tests/core-kunit: handle alloc failures on dasmon_test_merge_regions_of()
    4ec993020fb55 mm/damon/tests/core-kunit: handle memory alloc failure from damon_test_aggregate()
    9d6f085d5ec1a mm/damon/tests/core-kunit: handle memory failure from damon_test_target()
    19b20ac8b4c59 mm/damon/tests/core-kunit: handle allocation failures in damon_test_regions()
    24d20b65e36f3 mm/damon/tests/core-kunit: handle alloc failures on damon_test_split_at()
    de18eec7420f4 mm/damon/tests/vaddr-kunit: handle alloc failures on damon_test_split_evenly_succ()
    5574c977b5cb1 mm/damon/tests/vaddr-kunit: handle alloc failures in damon_test_split_evenly_fail()
    8a2944f5a54f0 mm/damon/tests/sysfs-kunit: handle alloc failures on damon_sysfs_test_add_targets()
    f4d24ea32f493 LoongArch: Use unsigned long for _end and _text
    6d5ec5a2b2b91 LoongArch: Use __pmd()/__pte() for swap entry conversions
    caffc71aad486 LoongArch: Fix build errors for CONFIG_RANDSTRUCT
    c26d621b3ebbe LoongArch: Correct the calculation logic of thread_count
    553e8f9e18452 LoongArch: Add new PCI ID for pci_fixup_vgadev()
    1dcb2f27efb24 media: mediatek: vcodec: Fix a reference leak in mtk_vcodec_fw_vpu_init()
    59f8c23f2bc21 media: i2c: adv7842: Remove redundant cancel_delayed_work in probe
    4f58e5cddcb5a media: i2c: ADV7604: Remove redundant cancel_delayed_work in probe
    b7ef6b263cf9b media: amphion: Cancel message work before releasing the VPU core
    6d0e77882c4cb media: vpif_display: fix section mismatch
    51fe47b112d21 media: vpif_capture: fix section mismatch
    29aaec521e54d media: videobuf2: Fix device reference leak in vb2_dc_alloc error path
    3d0ec859e009e media: verisilicon: Protect G2 HEVC decoder against invalid DPB index
    3680da86c180a media: TDA1997x: Remove redundant cancel_delayed_work in probe
    d2f8e900e6766 media: samsung: exynos4-is: fix potential ABBA deadlock on init
    2844c564a065a media: renesas: rcar_drif: fix device node reference leak in rcar_drif_bond_enabled
    db4d27e6bbbf5 media: platform: mtk-mdp3: fix device leaks at probe
    634a5a133ac20 media: msp3400: Avoid possible out-of-bounds array accesses in msp3400c_thread()
    44aedcb25125f media: cec: Fix debugfs leak on bus_register() failure
    a135dfe84a58d fbdev: tcx.c fix mem_map to correct smem_start offset
    b58f85225be0a fbdev: pxafb: Fix multiple clamped values in pxafb_adjust_timing
    77c8170a62f8a fbdev: gbefb: fix to use physical address instead of dma address
    1e1104eb8aa27 dm-bufio: align write boundary on physical block size
    8578764183082 dm-ebs: Mark full buffer dirty even on partial write
    e914da9be0619 firmware: stratix10-svc: Add mutex in stratix10 memory management
    60dde0960e3ea media: adv7842: Avoid possible out-of-bounds array accesses in adv7842_cp_log_status()
    bfa153eae8da9 powerpc/pseries/cmm: call balloon_devinfo_init() also without CONFIG_BALLOON_COMPACTION
    92686ff2e8575 perf/x86/amd/uncore: Fix the return value of amd_uncore_df_event_init() on error
    2aa65e353fb54 parisc: entry: set W bit for !compat tasks in syscall_restore_rfi()
    5e38e72dbcdc7 parisc: entry.S: fix space adjustment on interruption for 64-bit userspace
    dced78b918610 mtd: spi-nor: winbond: Add support for W25H02NWxxAM chips
    bce08eb151150 mtd: spi-nor: winbond: Add support for W25H01NWxxAM chips
    ea3ccb6ed0e8a mtd: spi-nor: winbond: Add support for W25H512NWxxAM chips
    528bad89e9630 mtd: spi-nor: winbond: Add support for W25Q02NWxxIM chips
    dc99e18fe52f6 mtd: spi-nor: winbond: Add support for W25Q01NWxxIM chips
    80c502df26c46 mtd: spi-nor: winbond: Add support for W25Q01NWxxIQ chips
    846ceb1a94460 mtd: mtdpart: ignore error -ENOENT from parsers on subpartitions
    add7da91ccf4f media: verisilicon: Fix CPU stalls on G2 bus error
    db7ab33238462 media: rc: st_rc: Fix reset control resource leak
    8dda29c9950b2 mfd: max77620: Fix potential IRQ chip conflict when probing two devices
    9b9e152a87ca4 mfd: altera-sysmgr: Fix device leak on sysmgr regmap lookup
    eb1f3a6ab3efe clk: samsung: exynos-clkout: Assign .num before accessing .hws
    777a1ddeb9151 block: Clear BLK_ZONE_WPLUG_PLUGGED when aborting plugged BIOs
    407f9bd005850 leds: leds-lp50xx: Enable chip before any communication
    5c02ebdf24ee4 leds: leds-lp50xx: LP5009 supports 3 modules for a total of 9 LEDs
    5b0ceb3ee343e leds: leds-lp50xx: Allow LED 0 to be added to module bank
    ffdec4686eae4 leds: leds-cros_ec: Skip LEDs without color components
    895123c309a34 powerpc/64s/slb: Fix SLB multihit issue during SLB preload
    acba48ba51bc0 powerpc, mm: Fix mprotect on book3s 32-bit
    3968852076ed1 arm64: dts: ti: k3-j721e-sk: Fix pinmux for pin Y1 used by power regulator
    40fa3b520171d PCI/PM: Reinstate clearing state_saved in legacy and !PM codepaths
    47d1f7e785924 fgraph: Check ftrace_pids_enabled on registration for early filtering
    cad08168f1399 fgraph: Initialize ftrace_ops->private for function graph ops
    f1d629bda89de HID: logitech-dj: Remove duplicate error logging
    c2c3f1a3fd74e iommu: disable SVA when CONFIG_X86 is set
    9f620cf7496fa iommu/tegra: fix device leak on probe_device()
    2deb48f25b91f iommu/sun50i: fix device leak on of_xlate()
    5b696fd46ffe9 iommu/qcom: fix device leak on of_xlate()
    f1a8835964f45 iommu/omap: fix device leaks on probe_device()
    df5b0080583e2 iommu/mediatek: fix device leak on of_xlate()
    9d90e4e8986b0 iommu/mediatek-v1: fix device leaks on probe()
    11cd45ac86fba iommu/mediatek-v1: fix device leak on probe_device()
    4287295758f4d iommu/ipmmu-vmsa: fix device leak on of_xlate()
    480f40ba50f18 iommu/exynos: fix device leak on of_xlate()
    c2e050e7872c8 iommu/apple-dart: fix device leak on of_xlate()
    1970ddf9f70dc iommu/amd: Propagate the error code returned by __modify_irte_ga() in modify_irte_ga()
    168d50e1d82b5 iommu/amd: Fix pci_segment memleak in alloc_pci_segment()
    cfcd57cc9e5c3 ASoC: qcom: qdsp6: q6asm-dai: set 10 ms period and buffer alignment.
    0eb81013e47d3 ASoC: qcom: q6adm: the the copp device only during last instance
    cc1a9a33a90b9 ASoC: qcom: q6asm-dai: perform correct state check before closing
    488643e5605d1 ASoC: qcom: q6apm-dai: set flags to reflect correct operation of appl_ptr
    60ffd2bc19976 ASoC: codecs: lpass-tx-macro: fix SM6115 support
    bae74771fc5d3 ASoC: stm32: sai: fix OF node leak on probe
    27cae2a7fe061 ASoC: stm32: sai: fix clk prepare imbalance on probe failure
    c908cde32dc2f ASoC: stm32: sai: fix device leak on probe
    c69790a51b52a ASoC: codecs: wcd939x: fix regmap leak on probe failure
    b56476d8e9d18 ntfs: Do not overwrite uptodate pages
    b6f446e12e69d selftests/ftrace: traceonoff_triggers: strip off names
    9eb1ee1f2acbf blk-mq: skip CPU offline notify on unmapped hctx
    29abf51fdf77f RDMA/bnxt_re: fix dma_free_coherent() pointer
    ff552378e80df RDMA/rtrs: Fix clt_path::max_pages_per_mr calculation
    676907004256e ksmbd: Fix memory leak in get_file_all_info()
    20597b7229aea md/raid5: fix possible null-pointer dereferences in raid5_store_group_thread_cnt()
    d9118a67547f2 md: Fix static checker warning in analyze_sbs
    8f2f65ee99f7d RDMA/bnxt_re: Fix to use correct page size for PDE table
    e7f29946157af RDMA/bnxt_re: Fix IB_SEND_IP_CSUM handling in post_send
    20436f2742a92 RDMA/core: always drop device refcount in ib_del_sub_device_and_put()
    116a7a351dce3 RDMA/bnxt_re: Fix incorrect BAR check in bnxt_qplib_map_creq_db()
    33834f51220ea RDMA/core: Fix logic error in ib_get_gids_from_rdma_hdr()
    580edee9f39d3 RDMA/efa: Remove possible negative shift
    bf197c7c79ef6 RDMA/irdma: avoid invalid read in irdma_net_event
    1dc33ad086732 ipv6: fix a BUG in rt6_get_pcpu_route() under PREEMPT_RT
    b409ba9e1e63c net: rose: fix invalid array index in rose_kill_by_device()
    ee4183501ea55 ipv4: Fix reference count leak when using error routes with nexthop objects
    bf3709738d8a8 ipv6: BUG() in pskb_expand_head() as part of calipso_skbuff_setattr()
    45ee0462b8839 net: stmmac: fix the crash issue for zero copy XDP_TX action
    aa743b0d98448 octeontx2-pf: fix "UBSAN: shift-out-of-bounds error"
    db4c26adf7117 platform/x86: hp-bioscfg: Fix out-of-bounds array access in ACPI package parsing
    a09b30ddd4ae8 vfio/pds: Fix memory leak in pds_vfio_dirty_enable()
    18b6574d4c647 net: bridge: Describe @tunnel_hash member in net_bridge_vlan_group struct
    98a12c2547a44 net: usb: asix: validate PHY address before use
    2c39c0b6de01a kbuild: fix compilation of dtb specified on command-line without make rule
    b37927e834bbf net: dsa: b53: skip multicast entries for fdb_dump()
    5934f280ac57f firewire: nosy: Fix dma_free_coherent() size
    00fe09364caf2 genalloc.h: fix htmldocs warning
    36561b86cb250 smc91x: fix broken irq-context in PREEMPT_RT
    68f66d67d8d52 selftests: net: fix "buffer overflow detected" for tap.c
    6492ad6439ff1 net: usb: rtl8150: fix memory leak on usb_submit_urb() failure
    9842946cdab6b amd-xgbe: reset retries and mode on RX adapt failures
    8f25951a891fa net: dsa: fix missing put_device() in dsa_tree_find_first_conduit()
    107d245f84cb4 team: fix check for port enabled in team_queue_override_port_prio_changed()
    d95544ee2bd66 platform/x86: ibm_rtl: fix EBDA signature search pointer arithmetic
    b1718c819ffa0 platform/x86: msi-laptop: add missing sysfs_remove_group()
    70984f8717ef0 platform/mellanox: mlxbf-pmc: Remove trailing whitespaces from event names
    5fe210533e345 ip6_gre: make ip6gre_header() robust
    5116f61ab1184 net: openvswitch: Avoid needlessly taking the RTNL on vport destroy
    72bc82bd1cdb6 net: mdio: aspeed: add dummy read to avoid read-after-write issue
    1e54c19eaf84b Bluetooth: btusb: revert use of devm_kzalloc in btusb
    ccbb96434d88e crypto: seqiv - Do not use req->iv after crypto_aead_encrypt
    655fdbcbbf004 idpf: reduce mbx_task schedule delay to 300us
    f36de3045d006 iavf: fix off-by-one issues in iavf_config_rss_reg()
    550664e839890 i40e: validate ring_len parameter against hardware-specific values
    9fe48a3c9dddd i40e: fix scheduling in set_rx_mode
    d12d193fe1e47 wifi: mac80211: do not use old MBSSID elements
    0c67efb56d045 wifi: cfg80211: sme: store capped length in __cfg80211_connect_result()
    9765d6eb8298b wifi: rtlwifi: 8192cu: fix tid out of range in rtl92cu_tx_fill_desc()
    1f8ae2e99a9df wifi: rtw88: limit indirect IO under powered off for RTL8822CS
    fbba8b00bbe4e fuse: fix readahead reclaim deadlock
    1ef70a0b104ae iommu/mediatek: fix use-after-free on probe deferral
    34cd26b1d86d2 x86/msi: Make irq_retrigger() functional for posted MSI
    94f03afbb7714 ARM: dts: microchip: sama5d2: fix spi flexcom fifo size to 32
    96221a072d5d0 hwmon: (w83l786ng) Convert macros to functions to avoid TOCTOU
    a9fb6e8835a22 hwmon: (w83791d) Convert macros to functions to avoid TOCTOU
    5596f3eb41b44 hwmon: (max6697) fix regmap leak on probe failure
    2aa6eb6666af0 hwmon: (max16065) Use local variable to avoid TOCTOU
    a5f4cfd2f2df9 interconnect: qcom: sdx75: Drop QPIC interconnect and BCM nodes
    36f3cc056dd85 i2c: amd-mp2: fix reference leak in MP2 PCI device
    85d7acd413810 platform/x86: intel: chtwc_int33fe: don't dereference swnode args
    fcab5c2672f8d rpmsg: glink: fix rpmsg device leak
    5c8f2499c5e1f soc: amlogic: canvas: fix device leak on lookup
    eb0df8cf030e2 soc: apple: mailbox: fix device leak on lookup
    90e176b3e791c soc: qcom: ocmem: fix device leak on lookup
    b38487a29e124 soc: qcom: pbs: fix device leak on lookup
    caf1e989f56ef soc: samsung: exynos-pmu: fix device leak on regmap lookup
    8b497efd6bf21 tracing: Fix fixed array of synthetic event
    f655550322469 virtio: vdpa: Fix reference count leak in octep_sriov_enable()
    24a58ffc444c6 amba: tegra-ahb: Fix device leak on SMMU enable
    f0cab88ff8702 crypto: caam - Add check for kcalloc() in test_len()
    5a4b655236089 crypto: af_alg - zero initialize memory allocated via sock_kmalloc
    4398797b3aa10 dt-bindings: PCI: qcom,pcie-sm8550: Add missing required power-domains and resets
    2c29bc88f2213 dt-bindings: PCI: qcom,pcie-sm8450: Add missing required power-domains and resets
    e48e50bec7b6b dt-bindings: PCI: qcom,pcie-sm8350: Add missing required power-domains and resets
    bf6738307d154 dt-bindings: PCI: qcom,pcie-sm8250: Add missing required power-domains and resets
    c83b7222e1932 dt-bindings: PCI: qcom,pcie-sm8150: Add missing required power-domains and resets
    51e075834cc4a dt-bindings: PCI: qcom,pcie-sc8280xp: Add missing required power-domains and resets
    3e911a40ac5d5 dt-bindings: PCI: qcom,pcie-sc7280: Add missing required power-domains and resets
    b71781f41cffa arm64: Revamp HCR_EL2.E2H RES1 detection
    84e5006115cbb KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()
    cdd6fb56e93f9 KVM: arm64: Initialize HCR_EL2.E2H early
    debfbc047196d sched/rt: Fix race in push_rt_task
    9433ba79c2ec3 hsr: hold rcu and dev lock for hsr_get_port_ndev
    f8bb150f228f4 pinctrl: renesas: rzg2l: Fix ISEL restore on resume
    3139828f6b755 ALSA: wavefront: Clear substream pointers on close
    04520b4422fde ALSA: wavefront: Use guard() for spin locks
    e6ba921b17797 ALSA: hda: cs35l41: Fix NULL pointer dereference in cs35l41_hda_read_acpi()
    05a609c1e5ed3 drm/displayid: pass iter to drm_find_displayid_extension()
    0f38ce08dde9b drm/amd/display: Fix scratch registers offsets for DCN351
    29ff286cd5203 drm/amd/display: Fix scratch registers offsets for DCN35
    9e7d3b8542d14 drm/amd/display: Use GFP_ATOMIC in dc_create_plane_state()
    90706235f14de Revert "drm/amd/display: Fix pbn to kbps Conversion"
    4ce784e8d2230 io_uring: fix min_wait wakeups for SQPOLL
    c1669c03bfbc2 io_uring/poll: correctly handle io_poll_add() return value on update
    a39b53ee7fa57 gpio: regmap: Fix memleak in error path in gpio_regmap_register()
    b56975f463417 s390/ipl: Clear SBP flag when bootprog is set
    d478f50727c3e btrfs: don't log conflicting inode if it's a dir moved in the current transaction
    f0c0a681ffb77 powerpc/kexec: Enable SMT before waking offline CPUs
    a2c6f25ab98b4 SUNRPC: svcauth_gss: avoid NULL deref on zero length gss_token in gss_read_proxy_verf
    e8623e9c451e2 svcrdma: use rc_pageoff for memcpy byte offset
    adef4a2ff3348 svcrdma: return 0 on success from svc_rdma_copy_inline_range
    0dacf9ce7954a nfsd: Mark variable __maybe_unused to avoid W=1 build break
    bf4e671c65153 NFSD: NFSv4 file creation neglects setting ACL
    fcb8d118e1492 NFSD: Clear SECLABEL in the suppattr_exclcreat bitmap
    7b82a1d6ae869 net/handshake: restore destructor on submit failure
    82f7416bcbd95 fsnotify: do not generate ACCESS/MODIFY events on child for special files
    0b7cc0a99035a net: phy: marvell-88q2xxx: Fix clamped value in mv88q2xxx_hwmon_write
    d60624e909f2f r8169: fix RTL8117 Wake-on-Lan in DASH mode
    46cd9c3b67a18 PM: runtime: Do not clear needs_force_resume with enabled runtime PM
    3437c775bf209 tracing: Do not register unsupported perf events
    1e2d3aa19c796 xfs: fix a UAF problem in xattr repair
    561e0756f1bfe xfs: fix stupid compiler warning
    3a07cb7636cd3 xfs: fix a memory leak in xfs_buf_item_init()
    35ddb0b624006 KVM: nSVM: Clear exit_code_hi in VMCB when synthesizing nested VM-Exits
    de39f5a4be137 KVM: nSVM: Set exit_code_hi to -1 when synthesizing SVM_EXIT_ERR (failed VMRUN)
    3eaa520d282b3 KVM: nVMX: Immediately refresh APICv controls as needed on nested VM-Exit
    4dac2f321e05f KVM: SVM: Mark VMCB_PERM_MAP as dirty on nested VMRUN
    5d018c1eac353 KVM: nSVM: Propagate SVM_EXIT_CR0_SEL_WRITE correctly for LMSW emulation
    70487dfde0cce KVM: SVM: Mark VMCB_NPT as dirty on nested VMRUN
    254d7963baddc KVM: nSVM: Avoid incorrect injection of SVM_EXIT_CR0_SEL_WRITE
    e746e51947053 KVM: x86: Fix VM hard lockup after prolonged inactivity with periodic HV timer
    5707aaba681dd KVM: x86: Explicitly set new periodic hrtimer expiration in apic_timer_fn()
    90d3e9c62a453 KVM: x86: WARN if hrtimer callback for periodic APIC timer fires with period=0
    359188420175c powerpc: Add reloc_offset() to font bitmap pointer used for bootx_printf()
    5d0d8c292531f libceph: make decode_pool() more resilient against corrupted osdmaps
    60560d13ff368 parisc: Do not reprogram affinitiy on ASP chip
    9ef28943471a1 scs: fix a wrong parameter in __scs_magic
    4701493ba3765 platform/chrome: cros_ec_ishtp: Fix UAF after unbinding driver
    244e4e60e3759 KVM: x86: Don't clear async #PF queue when CR0.PG is disabled (e.g. on #SMI)
    e24aedae71652 ocfs2: fix kernel BUG in ocfs2_find_victim_chain
    a69c7fd603bf5 media: vidtv: initialize local pointers upon transfer of memory ownership
    89dbbe6ff323f KVM: Disallow toggling KVM_MEM_GUEST_MEMFD on an existing memslot
    030b9cdcb5427 tools/testing/nvdimm: Use per-DIMM device handle
    473550e715654 f2fs: fix return value of f2fs_recover_fsync_data()
    baf461563a8da f2fs: fix uninitialized one_time_gc in victim_sel_policy
    19d7ac99e1012 f2fs: fix age extent cache insertion skip on counter overflow
    c89845fae250e f2fs: invalidate dentry cache on failed whiteout creation
    4f244c64efe62 f2fs: fix to avoid updating zero-sized extent in extent cache
    6c3bab5c6261a f2fs: fix to avoid potential deadlock
    3b15d5f12935e f2fs: ensure node page reads complete before f2fs_put_super() finishes
    0229d07a7220b scsi: ufs: core: Add ufshcd_update_evt_hist() for UFS suspend error
    7ae98a3cf428f scsi: mpi3mr: Read missing IOCFacts flag for reply queue full overflow
    0d36db68fdb8a scsi: target: Reset t_task_cdb pointer in error case
    d0835714042d4 NFSD: use correct reservation type in nfsd4_scsi_fence_client
    a41dc180b6e12 scsi: aic94xx: fix use-after-free in device removal path
    b10ebbfd59a53 scsi: Revert "scsi: qla2xxx: Perform lockless command completion in abort path"
    2abf4525593b2 cpufreq: nforce2: fix reference count leak in nforce2
    6e606c2673e9b cpuidle: governors: teo: Drop misguided target residency check
    7bcbac8dd76af serial: sh-sci: Check that the DMA cookie is valid
    0618fbaf42223 mei: gsc: add dependency on Xe driver
    ef66e20741309 intel_th: Fix error handling in intel_th_output_open
    74883565c621e char: applicom: fix NULL pointer dereference in ac_ioctl
    8313323e3e969 usb: renesas_usbhs: Fix a resource leak in usbhs_pipe_malloc()
    d8d17ff57924f usb: dwc3: keep susphy enabled during exit to avoid controller faults
    50d0d2239d4b2 usb: dwc3: of-simple: fix clock resource leak in dwc3_of_simple_probe
    6bcbffda814eb usb: gadget: lpc32xx_udc: fix clock imbalance in error path
    5d3df03f70547 usb: phy: isp1301: fix non-OF device reference imbalance
    69f9a0701abc3 usb: phy: fsl-usb: Fix use-after-free in delayed work during device removal
    8bd518ea03b81 USB: lpc32xx_udc: Fix error handling in probe
    5a338aa9dab34 usb: typec: altmodes/displayport: Drop the device reference in dp_altmode_probe()
    c062deb480f5f usb: ohci-nxp: fix device leak on probe failure
    2a38605427f25 phy: broadcom: bcm63xx-usbh: fix section mismatches
    759456cef2542 media: pvrusb2: Fix incorrect variable used in trace message
    fe3e129ab4980 media: dvb-usb: dtv5100: fix out-of-bounds in dtv5100_i2c_msg()
    bbf91bd694fee usb: usb-storage: Maintain minimal modifications to the bcdDevice range.
    0ca9fb4335e72 mptcp: avoid deadlock on fallback while reinjecting
    9cc0ba7934a9a mptcp: schedule rtx timer only after pushing data
    e1f1ce0442a41 selftests: mptcp: pm: ensure unknown flags are ignored
    1f65b924c5f24 media: v4l2-mem2mem: Fix outdated documentation
    bd1aff6060999 jbd2: use a weaker annotation in journal handling
    22ea3cb34dc92 jbd2: use a per-journal lock_class_key for jbd2_trans_commit_key
    4f6f4e5a33282 ext4: align max orphan file size with e2fsprogs limit
    419812d8e6750 ext4: fix incorrect group number assertion in mb_check_buddy
    9a424b99d5617 ext4: clear i_state_flags when alloc inode
    5b154e901fda2 ext4: xattr: fix null pointer deref in ext4_raw_inode()
    db9ee13fab026 ext4: fix string copying in parse_apply_sb_mount_options()
    b69492161c056 tpm: Cap the number of PCR banks
    4d1c44cd98231 ktest.pl: Fix uninitialized var in config-bisect.pl
    5c7265d31501e fs/ntfs3: fix mount failure for sparse runs in run_unpack()
    f6dd017bde25a kallsyms: Fix wrong "big" kernel symbol type read from procfs
    6458658807c32 floppy: fix for PAGE_SIZE != 4KB
    0a65cac1d86ee block: rate-limit capacity change info log
    e768e889561e1 wifi: mt76: Fix DTS power-limits on little endian systems
    bfe512fb5b68e s390/dasd: Fix gendisk parent after copy pair swap
    129b3bc149011 lib/crypto: x86/blake2s: Fix 32-bit arg treated as 64-bit
    af225540e7d61 perf: arm_cspmu: fix error handling in arm_cspmu_impl_unregister()
    b679e1985dcb8 mmc: sdhci-msm: Avoid early clock doubling during HS400 transition
    d0564ab15dda3 x86/mce: Do not clear bank's poll bit in mce_poll_banks on AMD SMCA systems
    e232269d51156 io_uring: fix filename leak in __io_openat_prep()
    9b015f2918b95 KEYS: trusted: Fix a memory leak in tpm2_load_cmd
    5679cc90bb541 cifs: Fix memory and information leak in smb3_reconfigure()
    4f23082b371a8 vhost/vsock: improve RCU read sections around vhost_vsock_get()
    af8b6fb41064b block: rnbd-clt: Fix signedness bug in init_dev()
    ee374ebb5e8e2 scsi: scsi_debug: Fix atomic write enable module param description
    e3e33ac2eb69d MIPS: ftrace: Fix memory corruption when kernel is located beyond 32 bits
    aaa642f20ad79 platform/x86/intel/hid: Add Dell Pro Rugged 10/12 tablet to VGBS DMI quirks
    142b2e74186ff nvme-fabrics: add ENOKEY to no retry criteria for authentication failures
    855a444013cf3 nvme-fc: don't hold rport lock when putting ctrl
    3b4c4f26e87c3 i2c: designware: Disable SMBus interrupts to prevent storms from mis-configured firmware
    939b6c52f46c1 clk: qcom: dispcc-sm7150: Fix dispcc_mdss_pclk0_clk_src
    6b4f044d9cd8a libperf cpumap: Fix perf_cpu_map__max for an empty/NULL map
    3f7a5d52a4ea9 serial: sprd: Return -EPROBE_DEFER when uart clock is not ready
    56664ab5ca286 usb: usb-storage: No additional quirks need to be added to the EL-R12 optical drive.
    5f839f9c80379 usb: xhci: limit run_graceperiod for only usb 3.0 devices
    f421105c99e8c iio: adc: ti_am335x_adc: Limit step_avg to valid range for gcc complains
    3042a57a8e8bc usb: typec: ucsi: Handle incorrect num_connectors capability
    015200bb776f5 usbip: Fix locking bug in RT-enabled kernels
    28442546f2d2b exfat: zero out post-EOF page cache on file extension
    df3ca04116dbd exfat: fix remount failure in different process environments
    d8218e3f39a70 reset: fix BIT macro reference
    f7b6370d0fbee via_wdt: fix critical boot hang due to unnamed resource allocation
    edadf1d7f9194 fuse: Invalidate the page cache after FOPEN_DIRECT_IO write
    b4f4212436baf fuse: Always flush the page cache before FOPEN_DIRECT_IO write
    45100a1a9b310 scsi: qla2xxx: Use reinit_completion on mbx_intr_comp
    3354e116ccc1f scsi: qla2xxx: Fix initiator mode with qlini_mode=exclusive
    c203c1ea9467d scsi: qla2xxx: Fix lost interrupts with qlini_mode=disabled
    a5b26e4a08a96 powerpc/addnote: Fix overflow on 32-bit builds
    83127df037ca6 clk: mvebu: cp110 add CLK_IGNORE_UNUSED to pcie_x10, pcie_x11 & pcie_x4
    8869c4962570d scsi: smartpqi: Add support for Hurray Data new controller PCI device
    89d33906cb934 ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx
    c379ec2361adb firmware: imx: scu-irq: Init workqueue before request mbox channel
    b7200a265d14f scsi: ufs: host: mediatek: Fix shutdown/suspend race condition
    2ab207530ce3b ipmi: Fix __scan_channels() failing to rescan channels
    8f4156b242f86 ipmi: Fix the race between __scan_channels() and deliver_response()
    7ced0c07791f5 nfsd: fix memory leak in nfsd_create_serv error paths
    43c1b514422e7 nfsd: rename nfsd_serv_ prefixed methods and variables with nfsd_net_
    6abdb63db720a nfsd: update percpu_ref to manage references on nfsd_net
    47c4976513f1d ASoC: ak4458: remove the reset operation in probe and remove
    a8ad320efb663 ALSA: usb-mixer: us16x08: validate meter packet indices
    6874a88306a51 ALSA: pcmcia: Fix resource leak in snd_pdacf_probe error path
    3837413ab3f4f ALSA: vxpocket: Fix resource leak in vxpocket_probe error path
    14e5a8878d4fe x86/fpu: Fix FPU state core dump truncation on CPUs with no extended xfeatures
    1742974c24a9c net/hsr: fix NULL pointer dereference in prp_get_untagged_frame()
    276bbd6061c62 dt-bindings: mmc: sdhci-of-aspeed: Switch ref to sdhci-common.yaml
    52a3f9051d4a2 mmc: sdhci-of-arasan: Increase CD stable timeout to 2 seconds
    fd750d6866746 mmc: sdhci-esdhc-imx: add alternate ARCH_S32 dependency to Kconfig
    743cebcbd1b26 spi: fsl-cpm: Check length parity before switching to 16 bit mode
    ed781eaa9e042 ACPI: CPPC: Fix missing PCC check for guaranteed_perf
    a11f596653f8a ACPI: PCC: Fix race condition by removing static qualifier
    d844aeba59455 soc/tegra: fuse: Do not register SoC device on ACPI boot
    ed2c2c84a2b42 can: gs_usb: gs_can_open(): fix error handling
    507b7333ac1aa xfs: don't leak a locked dquot when xfs_dquot_attach_buf fails
    24709064ee473 Input: i8042 - add TUXEDO InfinityBook Max Gen10 AMD to i8042 quirk table
    ed8c61b89be0c Input: alps - fix use-after-free bugs caused by dev3_register_work
    3a7cd1397c209 Input: lkkbd - disable pending work before freeing device
    84e4d35431689 Input: ti_am335x_tsc - fix off-by-one error in wire_order validation
    04e9249d31f5e HID: input: map HID_GD_Z to ABS_DISTANCE for stylus/pen
    d26af6d14da43 ksmbd: fix buffer validation by including null terminator size in EA length
    02e06785e85b4 ksmbd: Fix refcount leak when invalid session is found on session lookup
    a6f4cfa378380 ksmbd: skip lock-range check on equal size to avoid size==0 underflow
    e5718a35eb034 hwmon: (ltc4282): Fix reset_history file permissions
    b963636331fb4 drm/xe/oa: Limit num_syncs to prevent oversized allocations
    e281d1fd6903a drm/xe: Limit num_syncs to prevent oversized allocations
    24be3b815554a block: rnbd-clt: Fix leaked ID in init_dev()
    2ae324db9f496 spi: cadence-quadspi: Fix clock disable on probe failure path
    0849560e52c53 arm64: kdump: Fix elfcorehdr overlap caused by reserved memory processing reorder
    ec599026acb6a x86/xen: Fix sparse warning in enlighten_pv.c
    d30f46717fa5f x86/xen: Move Xen upcall handler
    ea55a61d72759 drm/panel: sony-td4353-jdi: Enable prepare_prev_first
    1ed476f3836e1 MIPS: Fix a reference leak bug in ip22_check_gio()
    ca29fc28fb44f drm/xe: Restore engine registers before restarting schedulers after GT reset
    d0326fd9dfc19 drm/me/gsc: mei interrupt top half should be in irq disabled context
    94f9c07b56759 hwmon: (tmp401) fix overflow caused by default conversion rate value
    68d62e5bebbd1 hwmon: (ibmpex) fix use-after-free in high/low store
    415d1638c7424 hwmon: (dell-smm) Limit fan multiplier to avoid overflow
    95cca255a7a5a net: hns3: add VLAN id validation before using
    96a1b2988119b net: hns3: using the num_tqps to check whether tqp_index is out of range when vf get ring info from mbx
    429f946a7af3f net: hns3: using the num_tqps in the vf driver to apply for resources
    08c37829c01f5 net: enetc: do not transmit redirected XDP frames when the link is down
    e1641177e7fb4 net/handshake: duplicate handshake cancellations leak socket
    0e40549e321d5 net/mlx5: Serialize firmware reset with devlink
    c3f606107a345 net/mlx5: fw_tracer, Handle escaped percent properly
    45bd283b1d69e net/mlx5: fw_tracer, Validate format string parameters
    4f929a9db234d net/mlx5: Drain firmware reset in shutdown callback
    dc7325cc50e66 net/mlx5: fw reset, clear reset requested on drain_fw_reset
    7bea09f60f2ad ethtool: Avoid overflowing userspace buffer on stats query
    e6c122cffcbb2 iommufd/selftest: Check for overflow in IOMMU_TEST_OP_ADD_RESERVED
    b627f7703f07c iommufd/selftest: Make it clearer to gcc that the access is not out of bounds
    724f6df514f78 iommufd/selftest: Update hw_info coverage for an input data_type
    ec519fbf6dd8d iommufd/selftest: Add coverage for reporting max_pasid_log2 via IOMMU_HW_INFO
    a085b36b7a71d selftests: netfilter: packetdrill: avoid failure on HZ=100 kernel
    20594fe157221 netfilter: nf_tables: remove redundant chain validation on register store
    2503f11fbf88c netfilter: nf_nat: remove bogus direction check
    2d6fd8a8dd921 nfc: pn533: Fix error code in pn533_acr122_poweron_rdr()
    cca2ed931b734 net/sched: ets: Remove drr class from the active list if it changes to strict
    4ec29714aa4e0 caif: fix integer underflow in cffrml_receive()
    25ab24df31f7a ipvs: fix ipv4 null-ptr-deref in route error path
    0b88be7211d21 netfilter: nf_conncount: fix leaked ct in error paths
    70e23c094de55 broadcom: b44: prevent uninitialized value usage
    2ecfc4433acdb net: openvswitch: fix middle attribute validation in push_nsh() action
    4b83902a1e67f bnxt_en: Fix XDP_TX path
    216afc198484f mlxsw: spectrum_mr: Fix use-after-free when updating multicast route stats
    ed8141b206bdc mlxsw: spectrum_router: Fix neighbour use-after-free
    3c8828fc9bf54 mlxsw: spectrum_router: Fix possible neighbour reference count leak
    c98eeb05d7d92 ipvlan: Ignore PACKET_LOOPBACK in handle_mode_l2()
    06bfb66a7c8b4 net/sched: ets: Always remove class from active list before deleting in ets_qdisc_change
    8d1ccba4b171c netrom: Fix memory leak in nr_sendmsg()
    278b8a9cd448b net: fec: ERR007885 Workaround for XDP TX path
    9e2e02ca7b2cb gfs2: Fix use of bio_chain
    edc2512e8d268 Bluetooth: btusb: Add new VID/PID 0x0489/0xE12F for RTL8852BE-VT
    381a6fdfb3b9c Bluetooth: btusb: Add new VID/PID 13d3/3533 for RTL8821CE
    a087c7cb86a75 Bluetooth: btusb: MT7920: Add VID/PID 0489/e135
    ee3a1e7882e53 Bluetooth: btusb: MT7922: Add VID/PID 0489/e170
    b87b6c1d8b9e6 Bluetooth: btusb: Add new VID/PID 2b89/6275 for RTL8761BUV
    ccc7878104158 ksmbd: vfs: fix race on m_flags in vfs_cache
    21a3d01fc6db5 ksmbd: fix use-after-free in ksmbd_tree_connect_put under concurrency
    2770b46167b60 smb/server: fix return value of smb2_ioctl()
    ab24e7802dcf4 gfs2: Fix "gfs2: Switch to wait_event in gfs2_quotad"
    122fdb8d3d86c gfs2: fix remote evict for read-only filesystems
    986908a287301 btrfs: scrub: always update btrfs_scrub_progress::last_physical
    5dadd27e80c41 wifi: brcmfmac: Add DMI nvram filename quirk for Acer A1 840 tablet
    f423753269a0d wifi: mt76: mt792x: fix wifi init fail by setting MCU_RUNNING after CLC load
    1ec6f2e3d5e48 wifi: cfg80211: use cfg80211_leave() in iftype change
    ca6bf76ae4dc7 wifi: cfg80211: stop radar detection in cfg80211_leave()
    f4001ba4a8ca4 wifi: rtl8xxxu: Fix HT40 channel config for RTL8192CU, RTL8723AU
    fcd6855b70e68 fs/ntfs3: check for shutdown in fsync
    87027decfe732 hfsplus: fix volume corruption issue for generic/073
    edfb2e602b5ba hfsplus: Verify inode mode when loading from disk
    457f795e7abd7 hfsplus: fix missing hfs_bnode_get() in __hfs_bnode_create
    187d06bcdf315 hfsplus: fix volume corruption issue for generic/070
    4fff9a625da95 ntfs: set dummy blocksize to read boot_block when mounting
    eeb154b999fe0 kbuild: Use objtree for module signing key path
    4fa631188267f fs/ntfs3: Support timestamps prior to epoch
    5da872dc712ec livepatch: Match old_sympos 0 and 1 in klp_find_func()
    93735b3a72f08 cpuidle: menu: Use residency threshold in polling state override decisions
    7488bf9818089 cpufreq: s5pv210: fix refcount leak
    84a8b8f53bbbb ACPI: fan: Workaround for 64-bit firmware bug
    0055505fa66eb cpufreq: dt-platdev: Add JH7110S SOC to the allowlist
    59e60f6d3aac1 ACPI: property: Use ACPI functions in acpi_graph_get_next_endpoint() only
    0d8bb08126920 ACPICA: Avoid walking the Namespace if start_node is NULL
    73a52f7fd913f x86/ptrace: Always inline trivial accessors
    81343616e712a sched/fair: Revert max_newidle_lb_cost bump
    dbc61834b0412 sched/deadline: only set free_cpus for online runqueues
    e1028fb38b328 perf/x86/amd: Check event before enable to avoid GPF
    c186564c96dce scripts/faddr2line: Fix "Argument list too long" error
    7d107be58b5c6 iomap: account for unaligned end offsets when truncating read range
    12053695c8ef5 iomap: adjust read range correctly for non-block-aligned positions
    4b0fe71fb3965 shmem: fix recovery on rename failures
    e065fc63ecc16 btrfs: fix memory leak of fs_devices in degraded seed device path
    26eb399edcbd6 bpf, arm64: Do not audit capability check in do_jit()
    c3446d541616b btrfs: fix a potential path leak in print_data_reloc_error()
    a8f13833135ba btrfs: do not skip logging new dentries when logging a new name
    567bd8cbc2fe6 Linux 6.12.63
    6e611d9cf0723 ASoC: codecs: nau8325: Silence uninitialized variables warnings
    5588b7c86efff ALSA: wavefront: Fix integer overflow in sample size validation
    c0a1fe1902ad2 ALSA: dice: fix buffer overflow in detect_stream_formats()
    8404a1b1f5f16 usb: dwc3: dwc3_power_off_all_roothub_ports: Use ioremap_np when required
    6c36af8083503 usb: phy: Initialize struct usb_phy list_head
    6f31b2ca1e483 usb: gadget: tegra-xudc: Always reinitialize data toggle when clear halt
    4b89397807eb0 tcp_metrics: use dst_dev_net_rcu()
    90c47a1a526c2 net: dst: introduce dst->dev_rcu
    8401fe8638491 net: lan743x: Allocate rings outside ZONE_DMA
    429bf3f04c24a LoongArch: Add machine_kexec_mask_interrupts() implementation
    a4b7a958c908a ocfs2: fix memory leak in ocfs2_merge_rec_left()
    3873afcb57614 irqchip/mchp-eic: Fix error code in mchp_eic_domain_alloc()
    31ab2aad7a7b7 scsi: imm: Fix use-after-free bug caused by unfinished delayed work
    4d7944f49b7cc efi/cper: align ARM CPER type with UEFI 2.9A/2.10 specs
    448fd9d43a122 efi/cper: Adjust infopfx size to accept an extra space
    0294effcc106c efi/cper: Add a new helper function to print bitmasks
    c3590c7812000 dm log-writes: Add missing set_freezable() for freezable kthread
    138603953aab3 dm-raid: fix possible NULL dereference with undefined raid type
    49278ca55ccf0 block: return unsigned int from queue_dma_alignment
    3baeec23a82e7 block: Use RCU in blk_mq_[un]quiesce_tagset() instead of set->tag_list_lock
    592c4fe953d7d ARM: 9464/1: fix input-only operand modification in load_unaligned_zeropad()
    0d71b3c2ed742 ALSA: firewire-motu: add bounds check in put_user loop for DSP events
    5998ad91f8722 rtc: gamecube: Check the return value of ioremap()
    c5bb128353e12 drm/amdkfd: Use huge page size to check split svm range alignment
    79331b0b4df10 ALSA: uapi: Fix typo in asound.h comment
    fb41332a7a8b5 dma/pool: eliminate alloc_pages warning in atomic_pool_expand
    b23111ec50d86 docs: hwmon: fix link to g762 devicetree binding
    341d5aa3f0592 cifs: Fix handling of a beyond-EOF DIO/unbuffered read over SMB2
    7cd9ed8132d38 drm/nouveau: refactor deprecated strcpy
    6275fd726d53a ALSA: firewire-motu: fix buffer overflow in hwdep read for DSP events
    d532934cf11ad regulator: fixed: Rely on the core freeing the enable GPIO
    3371a55632b84 drm/plane: Fix IS_ERR() vs NULL check in drm_plane_create_hotspot_properties()
    19478fd933414 nvme-auth: use kvfree() for memory allocated with kvcalloc()
    453e4b0c84d0d block: fix memory leak in __blkdev_issue_zero_pages
    b8da217fc9280 block: fix comment for op_is_zone_mgmt() to include RESET_ALL
    be83e65542635 blk-mq: Abort suspend when wakeup events are pending
    91aa13e108c75 ASoC: ak5558: Disable regulator when error happens
    436602fc10f7e ASoC: ak4458: Disable regulator when error happens
    7131bff8d2198 ASoC: bcm: bcm63xx-pcm-whistler: Check return value of of_dma_configure()
    5c51a11c1aee0 platform/x86: asus-wmi: use brightness_set_blocking() for kbd led
    76b7524ece4a5 fs/nls: Fix inconsistency between utf8_to_utf32() and utf32_to_utf8()
    a3dbaa09db4f5 NFS: Fix inheritance of the block sizes when automounting
    d867a77a939a1 Expand the type of nfs_fattr->valid
    612cc98698d66 NFS: Automounted filesystems should inherit ro,noexec,nodev,sync flags
    2704453bd1fbb Revert "nfs: ignore SB_RDONLY when mounting nfs"
    1caf1aa241f7f Revert "nfs: clear SB_RDONLY before getting superblock"
    acd4088a25800 Revert "nfs: ignore SB_RDONLY when remounting nfs"
    59947dff0fb7c NFSv4/pNFS: Clear NFS_INO_LAYOUTCOMMIT in pnfs_mark_layout_stateid_invalid
    fa561b29b7a85 NFS: Initialise verifiers for visible dentries in _nfs4_open_and_get_state
    ef97a2a5c1d56 nfs/vfs: discard d_exact_alias()
    af4c780b9f1fd NFS: Initialise verifiers for visible dentries in nfs_atomic_open()
    85d84f6c98fcb NFS: Initialise verifiers for visible dentries in readdir and lookup
    0aba4b43a27bf fs/nls: Fix utf16 to utf8 conversion
    ef7a9c2fae325 NFS: Avoid changing nlink when file removes and attribute updates race
    dfa39de442ecd f2fs: maintain one time GC mode is enabled during whole zoned GC cycle
    3573b62002723 f2fs: add gc_boost_gc_greedy sysfs node
    4236c017c4cec f2fs: add gc_boost_gc_multiple sysfs node
    4c5181b9e1a99 f2fs: introduce reserved_pin_section sysfs entry
    d4a4abba45849 f2fs: sysfs: add encoding_flags entry
    7cc6b80df66f6 f2fs: add carve_out sysfs node
    65e42a7084d1a f2fs: fix to avoid running out of free segments
    9933e05f508e0 f2fs: add a sysfs entry to reclaim POSIX_FADV_NOREUSE pages
    58ecedab080c4 f2fs: keep POSIX_FADV_NOREUSE ranges
    3e50b6e2b118d platform/x86:intel/pmc: Update Arrow Lake telemetry GUID
    cee20212a7b09 sched/fair: Fix unfairness caused by stalled tg_load_avg_contrib when the last task migrates out
    b15affae51ed9 9p: fix cache/debug options printing in v9fs_show_options
    d4b20e53b67cc fbdev: ssd1307fb: fix potential page leak in ssd1307fb_probe()
    15a6847f28085 pinctrl: single: Fix incorrect type for error return variable
    495f3e9155716 perf hist: In init, ensure mem_info is put on error paths
    e8097bd44a52d perf tools: Fix split kallsyms DSO counting
    d6cbe9b36f368 perf tools: Mark split kallsyms DSOs as loaded
    0b6216f9b3d1c net/sched: sch_cake: Fix incorrect qlen reduction in cake_drop
    2c011aea3d28b net: dsa: xrs700x: reject unsupported HSR configurations
    dccbe4fab76f1 net: hsr: create an API to get hsr port type
    ef964411c8ca7 net: hsr: Create and export hsr_get_port_ndev()
    57364f7d6d921 net: hsr: remove synchronize_rcu() from hsr_add_port()
    f906362c605bc net: hsr: remove one synchronize_rcu() from hsr_del_port()
    b61d747c0a749 clk: keystone: fix compile testing
    fa73dbe02e052 md/raid5: fix IO hang when array is broken with IO inflight
    a553e969dc9c4 remoteproc: qcom_q6v5_wcss: fix parsing of qcom,halt-regs
    6e1acbe563ddd mtd: lpddr_cmds: fix signed shifts in lpddr_cmds
    bd8bb75d859a1 selftests: bonding: add delay before each xvlan_over_bond connectivity check
    0b6795286e7a1 selftests: bonding: add ipvlan over bond testing
    b7e669dce505a net: phy: aquantia: check for NVMEM deferral
    45d7cf5174e4b vfio/pci: Use RCU for error/request triggers to avoid circular locking
    cad6c0fd6f3c0 spi: ch341: fix out-of-bounds memory access in ch341_transfer_one
    f6f13e468b725 mtd: rawnand: renesas: Handle devm_pm_runtime_enable() errors
    7c3ba62a4d29f net: stmmac: fix rx limit check in stmmac_rx_zc()
    b29ddccf36946 netfilter: nft_connlimit: update the count if add was skipped
    3558faee8aace netfilter: nf_conncount: rework API to use sk_buff directly
    9f953b045886c netfilter: flowtable: check for maximum number of encapsulations in bridge vlan
    c80fa09cba1f5 Reinstate "resource: avoid unnecessary lookups in find_next_iomem_res()"
    d050ffbf22212 resource: introduce is_type_match() helper and use it
    9a15982a2c099 resource: replace open coded resource_intersection()
    a9864d42ebcdd regulator: core: Protect regulator_supply_alias_list with regulator_list_mutex
    2d2fd5b65b1ed ARM: dts: samsung: exynos4412-midas: turn off SDIO WLAN chip during system suspend
    bac13d9609b50 ARM: dts: samsung: exynos4210-trats: turn off SDIO WLAN chip during system suspend
    03d6aa9e43d89 ARM: dts: samsung: exynos4210-i9100: turn off SDIO WLAN chip during system suspend
    5cc0fd103918c ARM: dts: samsung: universal_c210: turn off SDIO WLAN chip during system suspend
    7be6791043574 spi: airoha-snfi: en7523: workaround flash damaging if UART_TXD was short to GND
    9ff7ef2efae33 ASoC: Intel: catpt: Fix error path in hw_params()
    7bc42097e9729 vdpa/pds: use %pe for ERR_PTR() in event handler registration
    0cea55e0272cb vhost: Fix kthread worker cgroup failure handling
    30be771c090a8 vdpa/mlx5: Fix incorrect error code reporting in query_virtqueues
    807b0fb13a80a virtio: fix virtqueue_set_affinity() docs
    6cdca761ef227 virtio: fix grammar in virtio_queue_info docs
    bdc76b2c1cf50 virtio: fix whitespace in virtio_config_ops
    3a4894736e6b0 virtio: fix typo in virtio_device_ready() comment
    5f5cb2c99ae97 virtio_vdpa: fix misleading return in void function
    094e8f78c6335 of: Skip devicetree kunit tests when RISCV+ACPI doesn't populate root node
    ade5800a8d325 ext4: improve integrity checking in __mb_check_buddy by enhancing order-0 validation
    d6d3371611d28 ublk: prevent invalid access with DEBUG
    438f9673f3cb1 ACPI: processor_core: fix map_x2apic_id for amd-pstate on am4
    0927f7b4dcb9d hwmon: sy7636a: Fix regulator_enable resource leak on error path
    332825d72dcb3 drm/amd/display: Fix logical vs bitwise bug in get_embedded_panel_info_v2_1()
    1b3eb9500fc55 greybus: gb-beagleplay: Fix timeout handling in bootloader functions
    80c2106b09d3b firmware_loader: make RUST_FW_LOADER_ABSTRACTIONS select FW_LOADER
    6f1a1e7b5a48f ASoC: fsl_xcvr: clear the channel status control memory
    edb2b25561862 gfs2: Prevent recursive memory reclaim
    ceb8ee5ed4507 ASoC: nau8325: add missing build config
    78b923fa3de32 ASoC: nau8325: use simple i2c probe function
    c59358338c0b9 drm/panthor: Avoid adding of kernel BOs to extobj list
    6567f40a75adb RDMA/irdma: Do not directly rely on IB_PD_UNSAFE_GLOBAL_RKEY
    ef043432e4ec1 RDMA/irdma: Fix data race in irdma_free_pble
    abd2675d9aac4 RDMA/irdma: Fix data race in irdma_sc_ccq_arm
    64144891d882c iommu/arm-smmu-qcom: Enable use of all SMR groups when running bare-metal
    45285d357287b backlight: lp855x: Fix lp855x.h kernel-doc warnings
    0e63ea4378489 backlight: led-bl: Add devlink to supplier LEDs
    452eec7f208f5 wifi: ieee80211: correct FILS status codes
    3b5f35085f815 iomap: always run error completions in user context
    133900d61dacd iomap: factor out a iomap_dio_done helper
    96eab6610cb3a um: Don't rename vmap to kernel_vmap
    168592b56cae4 drm/nouveau: restrict the flush page to a 32-bit address
    ee1aedaef571f PCI: dwc: Fix wrong PORT_LOGIC_LTSSM_STATE_MASK definition
    14dd377ab65f1 btrfs: fix leaf leak in an error path in btrfs_del_items()
    1b1284e4f30e8 iommu/arm-smmu-v3: Fix error check in arm_smmu_alloc_cd_tables
    e0d1555bb0828 staging: fbtft: core: fix potential memory leak in fbtft_probe_common()
    50b878db54c85 firmware: stratix10-svc: fix make htmldocs warning for stratix10_svc
    278bfed4529a0 mt76: mt7615: Fix memory leak in mt7615_mcu_wtbl_sta_add()
    1df9aeb2a4f03 ASoC: tas2781: correct the wrong period
    7b5f15a32912f RDMA/bnxt_re: Pass correct flag for dma mr creation
    c996c81cecb6c RDMA/bnxt_re: Fix the inline size for GenP7 devices
    34447aeedbaea erofs: limit the level of fs stacking for file-backed mounts
    349f101d3f967 RISC-V: KVM: Fix guest page fault within HLV* instructions
    1e38b525909b4 crypto: ccree - Correctly handle return of sg_nents_for_len
    0c3854d65cc44 crypto: starfive - Correctly handle return of sg_nents_for_len
    ef5e709c0494f selftests/bpf: Improve reliability of test_perf_branches_no_hw()
    510282952d7c6 selftests/bpf: skip test_perf_branches_hw() on unsupported platforms
    ef065c4d4a2d8 usb: raw-gadget: cap raw_io transfer length to KMALLOC_MAX_SIZE
    f8408e1e54dda usb: dwc2: fix hang during suspend if set as peripheral
    23c928493dc5d usb: dwc2: fix hang during shutdown if set as peripheral
    cc9b6180a4c44 usb: dwc2: disable platform lowlevel hw resources during shutdown
    1358e9fecb89c usb: chaoskey: fix locking for O_NONBLOCK
    c2238d487a640 ima: Handle error code returned by ima_filter_rule_match()
    2599ad5e33b62 RAS: Report all ARM processor CPER information to userspace
    4758770a673c6 wifi: rtl818x: rtl8187: Fix potential buffer underflow in rtl8187_rx_cb()
    a0e2c571e8504 cpuset: Treat cpusets in attaching as populated
    d8b726ee9d937 net: phy: adin1100: Fix software power-down ready condition
    42d6ee65cdc89 phy: rockchip: samsung-hdptx: Prevent Inter-Pair Skew from exceeding the limits
    3200ec35a050b phy: rockchip: samsung-hdptx: Reduce ROPLL loop bandwidth
    9f23c97c45dd1 phy: freescale: Initialize priv->lock
    8fee9a8cb58fa phy: renesas: rcar-gen3-usb2: Fix an error handling path in rcar_gen3_phy_usb2_probe()
    3c5869f5fd366 leds: rgb: leds-qcom-lpg: Don't enable TRILED when configuring PWM
    579a91ff0845e mfd: mt6358-irq: Fix missing irq_domain_remove() in error path
    80daa408957ac mfd: mt6397-irq: Fix missing irq_domain_remove() in error path
    199aea40b8680 wifi: mac80211: fix CMAC functions not handling errors
    903e36c9e952f iommu/vt-d: Fix unused invalidation hint in qi_desc_iotlb
    8e9f0a0717ba3 scsi: qla2xxx: Fix improper freeing of purex item
    157cf2b51d74f pwm: bcm2835: Make sure the channel is enabled after pwm_request()
    96e436a051993 perf arm_spe: Fix memset subclass in operation
    c8fe12ed4da96 perf arm-spe: Extend branch operations
    03f642caab84b ipv6: clear RA flags when adding a static route
    a2339a354d115 drm/msm/a6xx: Improve MX rail fallback in RPMH vote init
    ae43fd9d556ea drm/msm/a6xx: Fix the gemnoc workaround
    630f2ce9c7cc6 drm/msm/a6xx: Flush LRZ cache before PT switch
    4f4f7b5797883 drm/mediatek: Fix CCORR mtk_ctm_s31_32_to_s1_n function issue
    e5bb424266927 fs/ntfs3: Prevent memory leaks in add sub record
    c4af1cd7f22a3 fs/ntfs3: out1 also needs to put mi
    8d04afc9da642 powerpc/64s/ptdump: Fix kernel_hash_pagetable dump for ISA v3.00 HPTE format
    f6573f4049f78 powerpc/64s/hash: Restrict stress_hpt_struct memblock region to within RMA limit
    539137e3038ce bpf: Fix invalid prog->stats access when update_effective_progs fails
    ee7db11742b30 wifi: rtl818x: Fix potential memory leaks in rtl8180_init_rx_ring()
    241dcbe651b07 drm/msm/a2xx: stop over-complaining about the legacy firmware
    de38f64811973 block/blk-throttle: Fix throttle slice time for SSDs
    bbc709db0ca76 NFSD/blocklayout: Fix minlength check in proc_layoutget
    3bcb274a192fc tracefs: fix a leak in eventfs_create_events_dir()
    362438cfc52d5 watchdog: starfive: Fix resource leak in probe error path
    0c1646149f4ed watchdog: wdat_wdt: Fix ACPI table leak in probe function
    30ce906557a21 bpf: Check skb->transport_header is set in bpf_skb_check_mtu
    ef87c16884126 selftests/bpf: Fix failure paths in send_signal test
    027ab4cbe3bd0 bpf: Handle return value of ftrace_set_filter_ip in register_fentry
    1dd5d772bcaf8 ps3disk: use memcpy_{from,to}_bvec index
    a25a953b6911e drm/msm/dpu: drop dpu_hw_dsc_destroy() prototype
    33d9ec273d60b crypto: iaa - Fix incorrect return value in save_iaa_wq()
    6816cd35ca5aa arm64: dts: rockchip: Add eeprom vcc-supply for Radxa ROCK 3C
    7225af2545d77 arm64: dts: rockchip: Add eeprom vcc-supply for Radxa ROCK 5A
    117327d2051ae arm64: dts: rockchip: Move the EEPROM to correct I2C bus on Radxa ROCK 5A
    d258d7e5d3c94 PCI: keystone: Exit ks_pcie_probe() for invalid mode
    3bf1378747e25 bpf: Free special fields when update [lru_,]percpu_hash maps
    345e130c0b28d leds: netxbig: Fix GPIO descriptor leak in error paths
    0401a20abbd65 scsi: sim710: Fix resource leak by adding missing ioport_unmap() calls
    9b2e70df6dd02 ACPI: property: Fix fwnode refcount leak in acpi_fwnode_graph_parse_endpoint()
    e5c2503696ec2 ocfs2: relax BUG() to ocfs2_error() in __ocfs2_move_extent()
    c2a0862ad4c36 lib/vsprintf: Check pointer before dereferencing in time_and_date()
    aa07a5df8cf17 clk: renesas: r9a06g032: Fix memory leak in error path
    38e5e8b4d645e coresight: etm4x: Add context synchronization before enabling trace
    11c5672a04d09 coresight: etm4x: Extract the trace unit controlling
    bebb32a222280 coresight: etm4x: Correct polling IDLE bit
    fef8b751d8d05 coresight: Change device mode to atomic type
    c9b99c948b4fb nbd: defer config unlock in nbd_genl_connect
    199c3a2725add wifi: cw1200: Fix potential memory leak in cw1200_bh_rx_helper()
    230621ffdb361 macintosh/mac_hid: fix race condition in mac_hid_toggle_emumouse
    d8a3693c58ae3 powerpc/32: Fix unpaired stwcx. on interrupt exit
    d8c573471ec0b powerpc/kdump: Fix size calculation for hot-removed memory ranges
    37d511e849139 cpufreq/amd-pstate: Call cppc_set_auto_sel() only for online CPUs
    90138ed922e57 scsi: ufs: core: fix incorrect buffer duplication in ufshcd_read_string_desc()
    98ae4025dea14 drm/panthor: Fix potential memleak of vma structure
    6e17555728bc4 ntfs3: init run lock for extend inode
    054e5045f1563 ARM: dts: stm32: stm32mp157c-phycore: Fix STMPE811 touchscreen node properties
    2e2b5aba8ad77 RDMA/rtrs: server: Fix error handling in get_or_create_srv
    71786f697121d dt-bindings: PCI: amlogic: Fix the register name of the DBI region
    eccc02ba17475 scsi: smartpqi: Fix device resources accessed after device removal
    8616943e0729a scsi: stex: Fix reboot_notifier leak in probe error path
    6b69593f72e1b nbd: defer config put in recv_work
    21989cb5034c8 md: fix rcu protection in md_wakeup_thread
    b991eda2a7f1b regulator: core: disable supply if enabling main regulator fails
    a0f1e48023c8f perf/x86/intel: Correct large PEBS flag check
    a7abd40cbfcfd ext4: correct the checking of quota files before moving extents
    520de30d8c92b mfd: da9055: Fix missing regmap_del_irq_chip() in error path
    22b5b6262958a locktorture: Fix memory leak in param_set_cpumask()
    2390e90a5cd2f efi/libstub: Fix page table access in 5-level to 4-level paging transition
    b299217115f54 x86/boot: Fix page table access in 5-level to 4-level paging transition
    2e1132b0832ea ARM: dts: omap3: n900: Correct obsolete TWL4030 power compatible
    99da0f593d0b0 ARM: dts: omap3: beagle-xm: Correct obsolete TWL4030 power compatible
    6110aca23ded7 ARM: dts: am335x-netcom-plus-2xx: add missing GPIO labels
    627be3c40095e libbpf: Fix parsing of multi-split BTF
    551060efb156c spi: tegra210-quad: Fix timeout handling
    5a0060ddfc1fc drm/panthor: Fix UAF on kernel BO VA nodes
    ae6e58069d846 drm/panthor: Fix race with suspend during unplug
    31db188355a49 drm/panthor: Fix UAF race between device unplug and FW event processing
    1ed88300c3330 drm/panthor: Fix group_free_queue() for partially initialized queues
    82484ee4f02f0 drm/panthor: Handle errors returned by drm_sched_entity_init()
    e5b181c4ea852 fs/9p: Don't open remote file with APPEND mode when writeback cache is used
    288fa0d792bcc scsi: target: Do not write NUL characters into ASCII configfs output
    e8fe1cd91ec88 power: supply: apm_power: only unset own apm_get_power_status
    f8897c84d9be6 power: supply: wm831x: Check wm831x_set_bits() return value
    1b8769af5dc1c power: supply: rt9467: Prevent using uninitialized local variable in rt9467_set_value_from_ranges()
    e52391c353028 power: supply: rt9467: Return error on failure in rt9467_set_value_from_ranges()
    076481e5ee775 power: supply: max17040: Check iio_read_channel_processed() return code
    748c3b8a68121 power: supply: cw2015: Check devm_delayed_work_autocancel() return code
    853e3e566595c power: supply: rt5033_charger: Fix device node reference leaks
    3a3dff0a73ba2 perf record: skip synthesize event when open evsel failed
    25b5ee3439cfc perf lock contention: Load kernel map before lookup
    76a339268d75c drm/imagination: Fix reference to devm_platform_get_and_ioremap_resource()
    f674cb00630ab interconnect: debugfs: Fix incorrect error handling for NULL path
    b528a34aaf487 arm64: dts: qcom: msm8996: add interconnect paths to USB2 controller
    3b946560c90d1 interconnect: qcom: msm8996: add missing link to SLAVE_USB_HS
    4351b8664583d wifi: ath12k: fix potential memory leak in ath12k_wow_arp_ns_offload()
    b9f9fbc3777a2 i3c: master: svc: Prevent incomplete IBI transaction
    d3bacdd55ec93 i3c: fix refcount inconsistency in i3c_master_register
    6b860ae7cd95d pinctrl: stm32: fix hwspinlock resource leak in probe function
    60d1c1d4d9258 soc: qcom: smem: fix hwspinlock resource leak in probe error paths
    5bfe033a1b775 tools/nolibc/stdio: let perror work when NOLIBC_IGNORE_ERRNO is set
    d6bec89235d73 x86/dumpstack: Prevent KASAN false positive warnings in __show_regs()
    ee96f47123495 task_work: Fix NMI race condition
    329f8323d3a55 perf/x86/intel/cstate: Remove PC3 support from LunarLake
    d1f424a77b6bd bpf: Fix stackmap overflow check in __bpf_get_stackid()
    0c472ae306761 bpf: Refactor stack map trace depth calculation into helper function
    d6d416f3b822f perf: Remove get_perf_callchain() init_nr argument
    f5a4950ad270c mtd: rawnand: lpc32xx_slc: fix GPIO descriptor leak on probe error and remove
    87e02ae9ad15e mtd: nand: relax ECC parameter validation check
    bfbb87096b953 Revert "mtd: rawnand: marvell: fix layouts"
    1d79c9aa5397a ARM: dts: renesas: r9a06g032-rzn1d400-db: Drop invalid #cells properties
    dfa2bdcf7893a ARM: dts: renesas: gose: Remove superfluous port property
    b8f6eeb87a76b RDMA/rxe: Fix null deref on srq->rq.queue after resize failure
    283a90add79fa sctp: Defer SCTP_DBG_OBJCNT_DEC() to sctp_destroy_sock().
    a720fb15bd06a phy: mscc: Fix PTP for VSC8574 and VSC8572
    41d2074ca8689 arm64: dts: qcom: qcm6490-shift-otter: Add missing reserved-memory
    11fc271a600a4 arm64: dts: qcom: sm8650: set ufs as dma coherent
    3309c64e0ecd6 arm64: dts: qcom: sdm845-oneplus: Correct gpio used for slider
    4173401d2fd8b arm64: dts: qcom: x1e80100: Add missing quirk for HS only USB controller
    7335bfb012594 arm64: dts: qcom: x1e80100: Fix compile warnings for USB HS controller
    17b65e48030ef firmware: imx: scu-irq: fix OF node leak in
    d5b0d62a2ee8f arm64: dts: ti: k3-am62p: Fix memory ranges for GPU
    d1376bcacc820 s390/ap: Don't leak debug feature files if AP instructions are not available
    ecb0b9f92503b s390/smp: Fix fallback CPU detection
    097c870b91817 wifi: ath11k: fix peer HE MCS assignment
    7ee69f3590714 wifi: ath11k: fix VHT MCS assignment
    ecd1ca3bd8bdd crypto: hisilicon/qm - restore original qos values
    c73be4f51eed9 crypto: asymmetric_keys - prevent overflow in asymmetric_key_generate_id
    7e7135c842872 soc: qcom: gsbi: fix double disable caused by devm
    3cc3f161201b7 soc: Switch back to struct platform_driver::remove()
    23e8fc7c9543a clk: qcom: camcc-sm7150: Fix PLL config of PLL2
    01b20bb5313d7 clk: qcom: camcc-sm6350: Fix PLL config of PLL2
    d55e7dec3c2f7 clk: qcom: camcc-sm6350: Specify Titan GDSC power domain as a parent to other
    9bfd3a7d31ba7 clk: qcom: camcc-sm8550: Specify Titan GDSC power domain as a parent to other
    fa963643a8906 uio: uio_fsl_elbc_gpcm:: Add null pointer check to uio_fsl_elbc_gpcm_probe
    f93f66ffcb0d5 PCI: rcar-gen2: Drop ARM dependency from PCI_RCAR_GEN2
    0ac1d13b2442c arm64: dts: exynos: gs101: fix sysreg_apm reg property
    c8c93fe1c444a perf annotate: Check return value of evsel__get_arch() properly
    cc67b6d82b122 arm64: dts: imx8mp-venice-gw702x: remove off-board sdhc1
    7c8dc554965f7 arm64: dts: imx8mp-venice-gw702x: remove off-board uart
    54235eadb2284 arm64: dts: imx8mm-venice-gw72xx: remove unused sdhc1 pinctrl
    ad7356c7ead8b arm64: dts: freescale: imx8mp-venice-gw7905-2x: remove duplicate usdhc1 props
    da06fa2308fe5 block/mq-deadline: Switch back to a single dispatch list
    53d0a52ccc9cb block/mq-deadline: Introduce dd_start_request()
    a38a8be61000e firmware: qcom: tzmem: fix qcom_tzmem_policy kernel-doc
    9e745721342cb iio: imu: st_lsm6dsx: Fix measurement unit for odr struct member
    fe89feb2bdce1 inet: Avoid ehash lookup race in inet_twsk_hashdance_schedule()
    e1480cc48d416 inet: Avoid ehash lookup race in inet_ehash_insert()
    6b9cbefb73c35 rculist: Add hlist_nulls_replace_rcu() and hlist_nulls_replace_init_rcu()
    d96461c6c6a31 clk: qcom: gcc-x1e80100: Add missing USB4 clocks/resets
    6a2af03a6e58f dt-bindings: clock: qcom,x1e80100-gcc: Add missing USB4 clocks/resets
    3a877b22edbed dt-bindings: clock: qcom,x1e80100-gcc: Add missing video resets
    4b1fd82848fdf ntfs3: Fix uninit buffer allocated by __getname()
    7ce8f2028dfcc ntfs3: fix uninit memory after failed mi_read in mi_format_new
    752e578549ff1 crypto: authenc - Correctly pass EINPROGRESS back up to the caller
    9268a215905af irqchip/qcom-irq-combiner: Fix section mismatch
    f761c6e6db3ad irqchip/starfive-jh8100: Fix section mismatch
    d604a43972ca2 irqchip/renesas-rzg2l: Fix section mismatch
    3054c0fcb4bb0 irqchip/imx-mu-msi: Fix section mismatch
    987028716f9dd irqchip/irq-brcmstb-l2: Fix section mismatch
    75f13a37fcf5f irqchip/irq-bcm7120-l2: Fix section mismatch
    c30d7fa84614f irqchip/irq-bcm7038-l1: Fix section mismatch
    d5843e1530d8d sched/fair: Forfeit vruntime on yield
    735e232cd9cc9 wifi: ath11k: restore register window after global reset
    6d9ff97af0151 wifi: ath10k: move recovery check logic into a new work
    78d6455b04bc3 wifi: ath10k: Add missing include of export.h
    5b9c7e103728b wifi: ath10k: Avoid vdev delete timeout when firmware is already down
    aea8e105743be objtool: Fix weak symbol detection
    5be8a348528b7 objtool: Fix standalone --hacks=jump_label
    f0581990dbf3a HID: logitech-hidpp: Do not assume FAP in hidpp_send_message_sync()
    fe4b23d94f3ac drm: atmel-hlcdc: fix atmel_xlcdc_plane_setup_scaler()
    95f29bada0505 clk: renesas: cpg-mssr: Read back reset registers to assure values latched
    c0b15580c17f0 clk: renesas: Pass sub struct of cpg_mssr_priv to cpg_clk_register
    efa305a20eb96 clk: renesas: Use str_on_off() helper
    26fa515baf084 clk: renesas: cpg-mssr: Add missing 1ms delay into reset toggle callback
    d87a89c5a7eba pinctrl: renesas: rzg2l: Fix PMC restore
    1f925f9047a4f USB: Fix descriptor count when handling invalid MBIM extended descriptor
    338e388c0d80f drm/vgem-fence: Fix potential deadlock on release
    470da7a2c29c6 accel/ivpu: Fix DCT active percent format
    e4341b780b22f accel/ivpu: Make function parameter names consistent
    e7bf47d73cd87 drm/panel: visionox-rm69299: Don't clear all mode flags
    a3c1fa8fe761e accel/ivpu: Ensure rpm_runtime_put in case of engine reset/resume fail
    b5890eb95ebb3 accel/ivpu: Prevent runtime suspend during context abort work
    4e6e07ce0197a gpu: host1x: Fix race in syncpt alloc/free
    f0a9ef99fb3c4 smack: fix bug: setting task label silently ignores input garbage
    ac9fce2efabad smack: fix bug: unprivileged task can create labels
    b68902daf0994 smack: fix bug: invalid label of unix socket file
    ad396a05d9851 smack: always "instantiate" inode in smack_inode_init_security()
    abf20a13507fe smack: deduplicate xattr setting in smack_inode_init_security()
    d684f66dd729e smack: fix bug: SMACK64TRANSMUTE set on non-directory
    74a813e575ef5 smack: deduplicate "does access rule request transmutation"
    53d3c6ddbb974 Linux 6.12.62
    7bce22989c7b7 bus: mhi: host: pci_generic: Add Telit FN990B40 modem support
    4e3297ec0c469 bus: mhi: host: pci_generic: Add Telit FN920C04 modem support
    d1ab7f9cee22e staging: rtl8723bs: fix out-of-bounds read in OnBeacon ESR IE parsing
    61871c83259a5 staging: rtl8723bs: fix stack buffer overflow in OnAssocReq IE parsing
    a54e2b2db1b7d staging: rtl8723bs: fix out-of-bounds read in rtw_get_ie() parser
    f6e629dfe6f59 comedi: check device's attached status in compat ioctls
    8952bc1973cd5 comedi: multiq3: sanitize config options in multiq3_attach()
    9fd8c8ad35c8d comedi: c6xdigio: Fix invalid PNP driver unregistration
    ff100f869c2e6 wifi: rtw88: Add USB ID 2001:3329 for D-Link AC13U rev. A1
    2f6ea894eba4c wifi: rtl8xxxu: Add USB ID 2001:3328 for D-Link AN3U rev. A1
    68852305e967c samples: work around glibc redefining some of our defines wrong
    4d9fb5428568f LoongArch: Mask all interrupts during kexec/kdump
    898c0794e7997 HID: elecom: Add support for ELECOM M-XT3URBK (018F)
    15bfd5b946a0c platform/x86/amd/pmc: Add spurious_8042 to Xbox Ally
    84c2898ad1412 platform/x86/amd: pmc: Add Lenovo Legion Go 2 to pmc quirk list
    9fc36198989e6 platform/x86: huawei-wmi: add keys for HONOR models
    b22703f8b5b37 HID: apple: Add SONiX AK870 PRO to non_apple_keyboards quirk list
    6e55ee83b1426 platform/x86: acer-wmi: Ignore backlight event
    a71677392ca53 pinctrl: qcom: msm: Fix deadlock in pinmux configuration
    e8061d02b49c5 nvme: fix admin request_queue lifetime
    573bccc5c2fcc HID: hid-input: Extend Elan ignore battery quirk to USB
    77899444d4616 bfs: Reconstruct file type when loading from disk
    002c4d2d8482b ALSA: usb-audio: Add native DSD quirks for PureAudio DAC series
    e71a1bafe6f68 drm/amdkfd: Fix GPU mappings for APU after prefetch
    ef9b1e6b8f902 smb: fix invalid username check in smb3_fs_context_parse_param()
    4c5b89f381543 Bluetooth: btrtl: Avoid loading the config file on security chips
    f09812f4dcb13 drm/vmwgfx: Use kref in vmw_bo_dirty
    5daaca0150db8 spi: imx: keep dma request disabled before dma transfer setup
    a215b8db00b51 spi: xilinx: increase number of retries before declaring stall
    deff7dfc4dc4e ftrace: bpf: Fix IPMODIFY + DIRECT in modify_ftrace_direct()
    700d4d1e785d8 USB: serial: kobil_sct: fix TIOCMBIS and TIOCMBIC
    2ceb2b5813b29 USB: serial: belkin_sa: fix TIOCMBIS and TIOCMBIC
    0423aaa295cee serial: add support of CPCI cards
    ccf6e31b91ae6 USB: serial: ftdi_sio: match on interface number for jtag
    31dea5e1c28ce USB: serial: option: move Telit 0x10c7 composition in the right place
    b38c151b4aaf6 USB: serial: option: add Telit Cinterion FE910C04 new compositions
    1f39939fbe2ef USB: serial: option: add Foxconn T99W760
    87cc1622c88a4 KVM: SVM: Don't skip unrelated instruction if INT3/INTO is replaced
    5caa40e7c6a43 comedi: pcl818: fix null-ptr-deref in pcl818_ai_cancel()
    22a76b0861ae6 ext4: add i_data_sem protection in ext4_destroy_inline_data_nolock()
    b163a5e8c7032 locking/spinlock/debug: Fix data-race in do_raw_write_lock
    5ac763713a1ef ksmbd: ipc: fix use-after-free in ipc_msg_send_request
    210ac60a86a3a ext4: refresh inline data size before write operations
    a2a7f854d154a jbd2: avoid bug_on in jbd2_journal_get_create_access() when file system corrupted
    432cb68e4555c Documentation: process: Also mention Sasha Levin as stable tree maintainer
    f68ffd58d444c xfrm: flush all states in xfrm_state_fini
    f7d879c19d306 xfrm: also call xfrm_state_delete_tunnel at destroy time for states that were never added
    13b32a7e544c0 Revert "xfrm: destroy xfrm_state synchronously on net exit path"
    dc3636912d417 xfrm: delete x->tunnel as we delete x
    dcbeffaf66d03 Linux 6.12.61
    c640adf07d874 spi: spi-nxp-fspi: Check return value of devm_mutex_init()
    e656ba6ca5347 drm/i915/dp: Initialize the source OUI write timestamp always
    fe0d2f610f12f Revert "ACPI: Suppress misleading SPCR console message when SPCR table is absent"
    a1eb56723b320 wifi: ath12k: correctly handle mcast packets for clients
    a017b984db205 net: dsa: microchip: Free previously initialized ports on init failures
    7f0bc8f2c8995 net: dsa: microchip: Do not execute PTP driver code for unsupported switches
    482330f8261b4 drm, fbcon, vga_switcheroo: Avoid race condition in fbcon setup
    1ba6da6ca3db7 net: dsa: microchip: Fix symetry in ksz_ptp_msg_irq_{setup/free}()
    6bee6fc3ed124 KVM: SVM: Fix redundant updates of LBR MSR intercepts
    76b0fef087465 KVM: nSVM: Fix and simplify LBR virtualization handling with nested
    c931ea944e575 KVM: nSVM: Always recalculate LBR MSR intercepts in svm_update_lbrv()
    d8a64e55ceb26 KVM: SVM: Introduce svm_recalc_lbr_msr_intercepts()
    592db83615a9f mm/huge_memory: fix NULL pointer deference when splitting folio
    10014310193cf usb: gadget: udc: fix use-after-free in usb_gadget_state_work
    0a544833e2664 usb: udc: Add trace event for usb_gadget_set_state
    f88ba5098e833 can: rcar_canfd: Fix CAN-FD mode as default
    59cb298d69c0b usb: typec: ucsi: psy: Set max current to zero when disconnected
    6326eb4c58dbf nfsd: Replace clamp_t in nfsd4_get_drc_mem()
    bccf7c5cd434a staging: rtl8712: Remove driver using deprecated API wext
    e67e3be690f5f libceph: replace BUG_ON with bounds check for map->max_osd
    5ef575834ca99 libceph: prevent potential out-of-bounds writes in handle_auth_session_key()
    e08021b3b56b2 libceph: fix potential use-after-free in have_mon_and_osd_map()
    9428654c827fa net: dsa: microchip: Don't free uninitialized ksz_irq
    040444baae90c net: dsa: microchip: ptp: Fix checks on irq_find_mapping()
    4d15bbe4997cf net: dsa: microchip: common: Fix checks on irq_find_mapping()
    901a8766734b6 drm/amd/display: Don't change brightness for disabled connectors
    f7cf491cd5b54 drm/amd/display: Check NULL before accessing
    204d3bb80c927 drm/amd/amdgpu: reserve vm invalidation engine for uni_mes
    9cb4deb88350b drm: sti: fix device leaks at component probe
    d24483349b012 USB: serial: option: add support for Rolling RW101R-GL
    4009495262338 USB: serial: ftdi_sio: add support for u-blox EVK-M101
    81fbc6f6dcaab xhci: dbgtty: fix device unregister
    aa55e09cfc4b6 xhci: dbgtty: Fix data corruption when transmitting data form DbC to host
    d77efd7b3def7 xhci: fix stale flag preventig URBs after link state error is cleared
    7cfb62888eba2 usb: dwc3: Fix race condition between concurrent dwc3_remove_requests() call paths
    61fcb9833071f usb: dwc3: pci: Sort out the Intel device IDs
    425ef1fa2ca7e usb: dwc3: pci: add support for the Intel Nova Lake -S
    2b90a8131c83f usb: uas: fix urb unmapping issue when the uas device is remove during ongoing data transfer
    a20f1dd19d21d usb: storage: sddr55: Reject out-of-bound new_pba
    fada9c8f7ee80 USB: storage: Remove subclass and protocol overrides from Novatek quirk
    0f18eac44c566 usb: storage: Fix memory leak in USB bulk transport
    26838f147aeaa usb: renesas_usbhs: Fix synchronous external abort on unbind
    e72c963177c70 usb: gadget: f_eem: Fix memory leak in eem_unwrap
    77124212374da usb: cdns3: Fix double resource release in cdns3_pci_probe
    2274767dc02b7 most: usb: fix double free on late probe failure
    8fef76f57966c serial: amba-pl011: prefer dma_mapping_error() over explicit address checking
    05f5e26d488cd mptcp: Initialise rcv_mss before calling tcp_send_active_reset() in mptcp_do_fastclose().
    3725bca17d021 mptcp: clear scheduled subflows on retransmit
    ce3b8270392fd mmc: sdhci-of-dwcmshc: Promote the th1520 reset handling to ip level
    50b4c1c28733a mm/memfd: fix information leak in hugetlb folios
    60ab1851614e6 firmware: stratix10-svc: fix bug in saving controller data
    96d9a20a66d56 nvmem: layouts: fix nvmem_layout_bus_uevent
    0904f0400e93c slimbus: ngd: Fix reference count leak in qcom_slim_ngd_notify_slaves
    1a96b5f823a34 thunderbolt: Add support for Intel Wildcat Lake
    f15288c137d96 smb: client: fix memory leak in cifs_construct_tcon()
    237f00629b246 drivers/usb/dwc3: fix PCI parent check
    b3f5d4f6af00b dm-verity: fix unreliable memory allocation
    47144748fbf12 ceph: fix crash in process_v2_sparse_read() for encrypted directories
    b6aa7c5e29cdb can: sun4i_can: sun4i_can_interrupt(): fix max irq loop handling
    0f7213b8fbc66 can: sja1000: fix max irq loop handling
    2fa09fe98ca3b Bluetooth: btusb: mediatek: Avoid btusb_mtk_claim_iso_intf() NULL deref
    667ac86882322 atm/fore200e: Fix possible data race in fore200e_open()
    df4630d02b42a ARM: dts: nxp: imx6ul: correct SAI3 interrupt line
    b543d79b4f48a arm64: dts: imx8qm-mek: fix mux-controller select/enable-gpios polarity
    8e93451fe5394 arm64: dts: imx8dxl-ss-conn: swap interrupts number of eqos
    866df92e7041a ALSA: usb-audio: Add DSD quirk for LEAK Stereo 230
    922fdd0b755a8 tracing: Fix WARN_ON in tracing_buffers_mmap_close for split VMAs
    63a93d1cd6077 MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
    135178e90aa43 MIPS: mm: Prevent a TLB shutdown on initial uniquification
    45abbbdb46578 iio: adc: rtq6056: Correct the sign bit index
    6656fbfee4f42 iio: adc: ad7280a: fix ad7280_store_balance_timer()
    96a474c35d0f3 iio: accel: fix ADXL355 startup race condition
    65ad4ed983fd9 iio: accel: bmc150: Fix irq assumption regression
    9ef53b3540338 iio: adc: stm32-dfsdm: fix st,adc-alt-channel property handling
    5b82774d0e4fa iio:common:ssp_sensors: Fix an error handling path ssp_probe()
    90e8768209264 iio: imu: st_lsm6dsx: fix array size for st_lsm6dsx_settings fields
    9434c58b8e421 iio: humditiy: hdc3020: fix units for thresholds and hysteresis
    70e1c26f8c469 iio: humditiy: hdc3020: fix units for temperature and humidity measurement
    af8a7abca453d iio: buffer: support getting dma channel from the buffer
    6717a94824203 iio: buffer-dmaengine: enable .get_dma_dev()
    61f136211d063 iio: buffer-dma: support getting the DMA channel
    0cc09278c39c4 Revert "perf/x86: Always store regs->ip in perf_callchain_kernel()"
    a2b16ee991df0 Revert "drm/amd/display: Move setup_stream_attribute"
    e31194bf494f6 spi: bcm63xx: fix premature CS deassertion on RX-only transactions
    74d016b9909e0 spi: nxp-fspi: Propagate fwnode in ACPI case as well
    29504b730405c spi: spi-nxp-fspi: Add OCT-DTR mode support
    96ff82494bb3e spi: spi-nxp-fspi: remove the goto in probe
    f08573eb642e6 spi: nxp-fspi: Support per spi-mem operation frequency switches
    c02d4deb82225 spi: spi-mem: Add a new controller capability
    0941b7cdfc023 spi: spi-mem: Extend spi-mem operations with a per-operation maximum frequency
    698c2abf5280c spi: spi-mem: Allow specifying the byte order in Octal DTR mode
    1f4a8954c6755 spi: amlogic-spifc-a1: Handle devm_pm_runtime_enable() errors
    6e5ee3c217265 spi: tegra114: remove Kconfig dependency on TEGRA20_APB_DMA
    4a16b2a0c1f03 fs/namespace: fix reference leak in grab_requested_mnt_ns
    1080ed39eae39 mailbox: pcc: don't zero error register
    733e3d0c1ab37 mailbox: pcc: Refactor error handling in irq handler into separate function
    ba7a25411c6a5 mailbox: mtk-cmdq: Refine DMA address handling for the command buffer
    f73d41f2a1d6f mailbox: mailbox-test: Fix debugfs_create_dir error checking
    779a422b45d0b usb: gadget: renesas_usbf: Handle devm_pm_runtime_enable() errors
    051e941285b2d iio: st_lsm6dsx: Fixed calibrated timestamp calculation
    4c6c2cf740532 net: fec: do not register PPS event for PEROUT
    ca2964a7cb1ee net: fec: do not allow enabling PPS and PEROUT simultaneously
    10bc6ce79eaab net: fec: do not update PEROUT if it is enabled
    18a474a325572 net: fec: cancel perout_timer when PEROUT is disabled
    3fd2105e1b7e0 net: atlantic: fix fragment overflow handling in RX path
    c40cbebc1a5f4 eth: fbnic: Fix counter roll-over issue
    7c18cd7aa31c1 net: dsa: sja1105: fix SGMII linking at 10M or 100M but not passing traffic
    5b5159fc64fb7 net: dsa: sja1105: simplify static configuration reload
    b7e9ba8dfbfaa net: wwan: mhi: Keep modem name match with Foxconn T99W640
    b46aaeafd6da9 drm/amdgpu: fix cyan_skillfish2 gpu info fw handling
    45b5b4ddb8d6b net: sxgbe: fix potential NULL dereference in sxgbe_rx()
    4040b5e896398 team: Move team device type change at the end of team_port_add
    cf7922c7597a8 net/mlx5e: Fix validation logic in rate limiting
    15f4066889157 drm/xe: Fix conversion from clock ticks to milliseconds
    c20df1e31be2f net: lan966x: Fix the initialization of taprio
    47e6085425bdc net: aquantia: Add missing descriptor cache invalidation on ATL2
    a21615a4ac6fe platform/x86: intel: punit_ipc: fix memory corruption
    fec6e69f0a35d net: phy: mxl-gpy: fix bogus error on USXGMII and integrated PHY
    c1ceabcb347d1 veth: reduce XDP no_direct return section to fix race
    dd419a3f2ebc1 veth: more robust handing of race to avoid txq getting stuck
    76bed44c5a3c3 veth: prevent NULL pointer dereference in veth_xdp_rcv
    9fe31b3f31453 veth: apply qdisc backpressure on full ptr_ring to reduce TX drops
    bf7528722e936 net: sched: generalize check for no-queue qdisc on TX queue
    429bcd8ffa531 Bluetooth: SMP: Fix not generating mackey and ltk when repairing
    e90c05fc5bbea Bluetooth: hci_sock: Prevent race in socket write iter and sock bind
    b1225ccdbdf86 Bluetooth: hci_core: Fix triggering cmd_timer for HCI_OP_NOP
    421e88a0d8578 Bluetooth: btusb: mediatek: Fix kernel crash when releasing mtk iso interface
    ad55004a3cb5b can: gs_usb: gs_usb_receive_bulk_callback(): check actual_length before accessing data
    616eee3e895b8 can: gs_usb: gs_usb_receive_bulk_callback(): check actual_length before accessing header
    4a82072e451ea can: gs_usb: gs_usb_xmit_callback(): fix handling of failed transmitted URBs
    0897cea266e39 can: kvaser_usb: leaf: Fix potential infinite loop in command parsers

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index c4cef55c86..e720629b14 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b23e01aff4eb21167db80c8d178ffeaf174be51c"
-SRCREV_meta ?= "204830448d850850867fa4ca7ee0dab04fdb7011"
+SRCREV_machine ?= "35d6569f165579f64f76cbdfd1feb41a2b5359ec"
+SRCREV_meta ?= "5b1ff7df002df6e7069a53b361d9e8f5f9df3aac"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.60"
+LINUX_VERSION ?= "6.12.69"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 2818a9fd40..164557eaa0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.60"
+LINUX_VERSION ?= "6.12.69"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_meta ?= "204830448d850850867fa4ca7ee0dab04fdb7011"
+SRCREV_machine ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
+SRCREV_meta ?= "5b1ff7df002df6e7069a53b361d9e8f5f9df3aac"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 4a82ea08a2..91b013f498 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0435f9a900bbfb3daa3a28123d517c6437831628"
-SRCREV_machine:qemuarm64 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemuloongarch64 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemumips ?= "07d29856173d5d2cec0a67801492a95a00e03491"
-SRCREV_machine:qemuppc ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemuriscv64 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemuriscv32 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemux86 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemux86-64 ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_machine:qemumips64 ?= "f21d4ebef1ebdfd38a182e87c7bdaad6fe79ba3c"
-SRCREV_machine ?= "cd2fe60ac1c07ad28e3c84e4325c3f8163ce3719"
-SRCREV_meta ?= "204830448d850850867fa4ca7ee0dab04fdb7011"
+SRCREV_machine:qemuarm ?= "4c24c5ab253ea3f46bb578fe43d25877bc269206"
+SRCREV_machine:qemuarm64 ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
+SRCREV_machine:qemuloongarch64 ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
+SRCREV_machine:qemumips ?= "377285b4e49c411f89784c6b1c374dbfb634e253"
+SRCREV_machine:qemuppc ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
+SRCREV_machine:qemuriscv64 ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
+SRCREV_machine:qemuriscv32 ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
+SRCREV_machine:qemux86 ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
+SRCREV_machine:qemux86-64 ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
+SRCREV_machine:qemumips64 ?= "f2e77270b007d80acbfc32114e81d1abc411e8b4"
+SRCREV_machine ?= "a7fbaf7533ae7ebc35f56c0dfb86970eda4d721c"
+SRCREV_meta ?= "5b1ff7df002df6e7069a53b361d9e8f5f9df3aac"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "318a47068f7b88de838518897500d7509e3fe205"
+SRCREV_machine:class-devupstream ?= "ff2177382799753070b71747f646963147eabc7c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.60"
+LINUX_VERSION ?= "6.12.69"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.43.0


