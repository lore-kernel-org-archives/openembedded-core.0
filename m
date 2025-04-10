Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A49C369A9
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 18:55:55 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.6456.1744311347114572898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 11:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kmEinetz;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c55b53a459so133342085a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744311346; x=1744916146; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKOlALES/x26Mm6+t+MftWqRKLM52XcW33JQgThzrEI=;
        b=kmEinetznk70Fc+a4KU7QUwaG/GIZnQGhUOsb7wL02ZjqNL8K/ObzBcgdzE4kYgvIm
         HBxy2/dVzFq3tX5Ol703N5gYsHmnte4kDGylkCbBbh14jhNCSQXkeD1y14UpB78MGTa9
         uuUxNfktwf0KRnL8UW0Xgi9XaqdvXRfuNQshmcg3rjbCbNn5QN/iqRwpxYjYc6cCM2Jl
         byI03w+67pOL6rCr8HtjvvhBUFtb/qnSP3JVgRjH7x0Q6WmZRTvbjQ0IMB9S2JBVlQp7
         YQfQ6bZCilCCTwTNgXHOYDRIK1ikmd1w+n5iOfIoIkrLxlXw+hhwcKzVAe9Ui8JhMTCl
         dKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744311346; x=1744916146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKOlALES/x26Mm6+t+MftWqRKLM52XcW33JQgThzrEI=;
        b=T/Aimak/k0PTBokVbCNxJrbKvw6AuhLE6uq+oAisKzTudvRv+u1mWf63CHc8YxQoif
         uTkVtc5y/2LEk3BN1qKUhdz1X0zYMzGtv2F2sdnc8Mfd+XKSGNl/CyxWsICmz57pVfQc
         Td4gA8hm4PSgzAulI+9ZJKzkwrpydGXunM2pIeRwnQ+DprjOlUdpG8m+okYA4/tVSade
         sSORQg8GFk/ivj/XSm4Z4dnET25vyyX0C03/m9DPFL5Z4YqvStIHJe6kMCYRRLbBU1O4
         a8+kaoyJlwVGc/CxirlyzXTasMZCeZuHsWmD3jH2/MGVnbM0zD3t/QG/XF8ANCUjfs+r
         DOPQ==
X-Gm-Message-State: AOJu0YzBTiHvVlqZAVbqgGXaowM+Hcmr2lXoBP/xJtHpxfWNTf1OsL5w
	NGJiFlKaLKre0P76aqITL4psQYcg+1lGXbUIweQeHXngtiO9WoRn48APSaovT/Y=
X-Gm-Gg: ASbGnctPB4uUVMdtgQfl4YU7b4pTjPZKSuWU7z/ont4ZSiE/Yh0qH+WKF50H1ub0E1w
	VGrLfgwYwKKDJKiuj5LXcSpYLI3wjB7kjN6OSG3zFGh5le66GtuAdVkUxV3aEB7xdl11bR+Yt9L
	Ar9TkdGYVaFi1btMXSLZcX/fVwT8p+Bt8Sq7S71qk0YSVmXyT29ZY3+7HY5X8fQqy6ZcrqgHZbE
	mykjrlLBbZX8Vq8c7dCkw5dDGpwNJbM/mMFl37iOt05OZP8OGA/AR4gLkGyuQycwF6gIa5Fs1IX
	y9Ll+mrCT/atzH3EL7v0gve/jzCx7NRo5+/7nqL9O9uvxnsjBn6zFP4LcWVS77LE5p51VWHVo+w
	KzDwrMV7OXg88yAk8jB7McF2+PVZYxT80uHXBOCGx4Q==
X-Google-Smtp-Source: AGHT+IE5SMO4bosRkHCOl9daFeth7sk5bV8A1eYNbeB8RXRdmHvq35uV3rcd5YSc7VXPyg2aKIX92w==
X-Received: by 2002:a05:620a:471e:b0:7c7:a555:8788 with SMTP id af79cd13be357-7c7af0c0efamr14049085a.2.1744311345776;
        Thu, 10 Apr 2025 11:55:45 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8942eadsm134956585a.5.2025.04.10.11.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 11:55:45 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/6.12: update to v6.12.22
Date: Thu, 10 Apr 2025 14:55:39 -0400
Message-Id: <497dc75b67a1a60529eae0c7f048258583c11165.1744311165.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1744311165.git.bruce.ashfield@gmail.com>
References: <cover.1744311165.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 18:55:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214697

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    55767d6e74ef Linux 6.12.22
    9e6e83e1e2d0 bcachefs: bch2_ioctl_subvolume_destroy() fixes
    a964484a3537 serial: 8250_dma: terminate correct DMA in tx_dma_flush()
    5f9176f82ec7 serial: stm32: do not deassert RS485 RTS GPIO prematurely
    f86907583000 perf tools: Fix up some comments and code to properly use the event_source bus
    b094e8e3988e memstick: rtsx_usb_ms: Fix slab-use-after-free in rtsx_usb_ms_drv_remove
    a4931d9fb99e usb: xhci: Apply the link chain quirk on NEC isoc endpoints
    6af20ac254cb usb: xhci: Don't skip on Stopped - Length Invalid
    ed5760db3d8a net: usb: usbnet: restore usb%d name exception for local mac addresses
    52e05bea53c2 net: usb: qmi_wwan: add Telit Cinterion FE990B composition
    666e78b47713 net: usb: qmi_wwan: add Telit Cinterion FN990B composition
    53a005d3019f tty: serial: fsl_lpuart: disable transmitter before changing RS485 related registers
    27bd86d139ce tty: serial: 8250: Add Brainboxes XC devices
    54f9a8dcab90 tty: serial: 8250: Add some more device IDs
    0fac51a2d143 counter: microchip-tcb-capture: Fix undefined counter channel state on probe
    181a2ab650f7 counter: stm32-lptimer-cnt: fix error handling when enabling
    3ed38d0297fa ALSA: hda/realtek: Support mute LED on HP Laptop 15s-du3xxx
    2bb139e483f8 netfilter: socket: Lookup orig tuple for IPv6 SNAT
    2c1674fb52b2 drm/amd/display: Don't write DP_MSTM_CTRL after LT
    95407304253a nfsd: fix legacy client tracking initialization
    09691f367df4 atm: Fix NULL pointer dereference
    dddd13f7f167 HID: hid-plantronics: Add mic mute mapping and generalize quirks
    a532e7680878 ALSA: usb-audio: Add quirk for Plantronics headsets to fix control names
    2ee7ebed771b mips: Add '-std=gnu11' to vdso CFLAGS
    3423cae69078 Linux 6.12.21
    2fa52cd829c1 mptcp: Fix data stream corruption in the address announcement
    86368616a9ce mm/huge_memory: drop beyond-EOF folios with the right number of refs
    e7940c5794c3 arm64: dts: rockchip: fix u2phy1_host status for NanoPi R4S
    9aaffd371829 libsubcmd: Silence compiler warning
    8ece5abd7490 Revert "sched/core: Reduce cost of sched_move_task when config autogroup"
    c7762348038b KVM: arm64: Eagerly switch ZCR_EL{1,2}
    4a397bf077e7 KVM: arm64: Mark some header functions as inline
    2e4f2c20db53 KVM: arm64: Refactor exit handlers
    cb53828d6911 KVM: arm64: Remove VHE host restore of CPACR_EL1.SMEN
    d547b363f16a KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
    f19a46cb5373 KVM: arm64: Remove host FPSIMD saving for non-protected KVM
    79e140bba70b KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state
    e6cd28bbbf90 KVM: arm64: Calculate cptr_el2 traps on activating traps
    73ef4f6e379b io_uring/net: fix sendzc double notif flush
    a4cb17797a5d ksmbd: fix incorrect validation for num_aces field of smb_acl
    731eccbd65aa drm/amdkfd: Fix user queue validation on Gfx7/8
    3aa8e00fefca drm/amdgpu: Fix JPEG video caps max size for navi1x and raven
    a0a43a133371 drm/amdgpu: Fix MPEG2, MPEG4 and VC1 video caps max size
    499d1adcac3e drm/amdgpu: Remove JPEG from vega and carrizo video caps
    97c2a78d2995 drm/amdgpu/pm: wire up hwmon fan speed for smu 14.0.2
    4b8b7026fc3b drm/amdgpu/pm: Handle SCLK offset correctly in overdrive for smu 14.0.2
    8201c17e986e drm/amdgpu: Restore uncached behaviour on GFX12
    eacbc9d28391 drm/amd/pm: add unique_id for gfx12
    c58726d64d08 drm/amd/display: Use HW lock mgr for PSR1 when only one eDP
    1992e216fd3c drm/amd/display: Fix message for support_edp0_on_dp1
    7341e36e6513 drm/amdgpu/gfx12: correct cleanup of 'me' field with gfx_v12_0_me_fini()
    1135a9431160 drm/sched: Fix fence reference count leak
    dd1801aa01bb drm/radeon: fix uninitialized size issue in radeon_vce_cs_parse()
    b2ab8c713bad pmdomain: amlogic: fix T7 ISP secpower
    f4489260f571 soc: qcom: pdr: Fix the potential deadlock
    91176c193417 batman-adv: Ignore own maximum aggregation size during RX
    130290f44bce xsk: fix an integer overflow in xp_create_and_assign_umem()
    6afe2ea2daec keys: Fix UAF in key_put()
    8332847875f7 efi/libstub: Avoid physical address 0x0 when doing random allocation
    c4e37b381a7a firmware: qcom: uefisecapp: fix efivars registration race
    54ccfef43773 ARM: shmobile: smp: Enforce shmobile_smp_* alignment
    0b1d48698ed9 ARM: dts: imx6qdl-apalis: Fix poweroff on Apalis iMX6
    2e1dfe3105ab memcg: drain obj stock on cpu hotplug teardown
    ede3e8ac90ae proc: fix UAF in proc_get_inode()
    4b84c6437f4b mm/page_alloc: fix memory accept before watermarks gets initialized
    c057ee03f751 mm/migrate: fix shmem xarray update during migration
    abc2677d167d mm: fix error handling in __filemap_get_folio() with FGP_NOWAIT
    baa37829052f selftests/mm: run_vmtests.sh: fix half_ufd_size_MB calculation
    8f8eb5afa2cb mmc: atmel-mci: Add missing clk_disable_unprepare()
    e96500b7d695 mmc: sdhci-brcmstb: add cqhci suspend/resume to PM ops
    838c916e6d66 arm64: dts: rockchip: fix pinmux of UART5 for PX30 Ringneck on Haikou
    f8ec8036e7e0 arm64: dts: rockchip: fix pinmux of UART0 for PX30 Ringneck on Haikou
    200517d82b4c arm64: dts: freescale: imx8mm-verdin-dahlia: add Microphone Jack to sound card
    16f1b7dc28a4 arm64: dts: freescale: imx8mp-verdin-dahlia: add Microphone Jack to sound card
    b362fc904d26 accel/qaic: Fix integer overflow in qaic_validate_req()
    a99f1254b11e regulator: check that dummy regulator has been probed before using it
    d3b83a1442a0 regulator: dummy: force synchronous probing
    0def1a40c3e7 netfs: Call `invalidate_cache` only if implemented
    adb7325362c7 riscv: dts: starfive: Fix a typo in StarFive JH7110 pin function definitions
    66e3cc3885e8 io_uring/net: don't clear REQ_F_NEED_CLEANUP unconditionally
    4b4d2527840f drm/v3d: Don't run jobs that have errors flagged in its fence
    c76a537ca228 drm/xe: Fix exporting xe buffers multiple times
    dc55ba5f6dd5 can: flexcan: disable transceiver during system PM
    7072723e0534 can: flexcan: only change CAN state when link up in system PM
    8cec9e314d33 can: ucan: fix out of bound read in strscpy() source
    eb14937ece4f can: rcar_canfd: Fix page entries in the AFL list
    76a13fad5a3f dt-bindings: can: renesas,rcar-canfd: Fix typo in pattern properties for R-Car V4M
    15cc669513d6 net: mana: Support holes in device list reply msg
    bb83e6e7b56e i2c: omap: fix IRQ storms
    71c9cf87776e tracing: tprobe-events: Fix leakage of module refcount
    a3ff812d68f6 Revert "gre: Fix IPv6 link-local address generation."
    250793874f91 net/neighbor: add missing policy for NDTPA_QUEUE_LENBYTES
    176d0333aae4 libfs: Fix duplicate directory entry in offset_dir_lookup
    0d8a8179fa52 net: ipv6: ioam6: fix lwtunnel_output() loop
    49a009135042 net: lwtunnel: fix recursion loops
    1344df9a981c net: ti: icssg-prueth: Add lock to stats
    326223182e47 net: atm: fix use after free in lec_send()
    99918fb674d2 gpu: host1x: Do not assume that a NULL domain means no DMA IOMMU
    58ed057dcdb3 phy: fix xa_alloc_cyclic() error handling
    cb2f8a5c1fd9 dpll: fix xa_alloc_cyclic() error handling
    f8aaa38cfaf6 devlink: fix xa_alloc_cyclic() error handling
    cfbde06fda15 ipv6: Set errno after ip_fib_metrics_init() in ip6_route_info_create().
    29d91820184d ipv6: Fix memleak of nhc_pcpu_rth_output in fib_check_nh_v6_gw().
    8940e6168bb3 net: ipv6: fix TCP GSO segmentation with NAT
    d4bf956547c3 net: ethernet: ti: am65-cpsw: Fix NAPI registration sequence
    8bf2f1ba2729 ata: libata-core: Add ATA_QUIRK_NO_LPM_ON_ATI for certain Samsung SSDs
    5ba4f58ec2de tracing: tprobe-events: Fix to clean up tprobe correctly when module unload
    dfc80ed249b6 ARM: davinci: da850: fix selecting ARCH_DAVINCI_DA8XX
    1be40f79d36d accel/qaic: Fix possible data corruption in BOs > 2G
    e8f50474037f Bluetooth: hci_event: Fix connection regression between LE and non-LE adapters
    761b7c36addd Bluetooth: Fix error code in chan_alloc_skb_cb()
    bc6824b3aaff RDMA/hns: Fix wrong value of max_sge_rd
    abf7f5be159a RDMA/hns: Fix missing xa_destroy()
    0fa35d93d50a RDMA/hns: Fix a missing rollback in error path of hns_roce_create_qp_common()
    7912097c9304 RDMA/hns: Fix invalid sq params not being blocked
    4e4c2571aac4 RDMA/hns: Fix unmatched condition in error path of alloc_user_qp_db()
    13a52f6c9ff9 RDMA/hns: Fix soft lockup during bt pages loop
    d7b8dc4a0dce RDMA/bnxt_re: Avoid clearing VLAN_ID mask in modify qp path
    ca3c033a4fe1 dma-mapping: fix missing clear bdr in check_ram_in_range_map()
    db7dd032eeb2 ARM: dts: BCM5301X: Fix switch port labels of ASUS RT-AC3200
    2c74f29eaa0d ARM: dts: BCM5301X: Fix switch port labels of ASUS RT-AC5300
    d4ebdbbd4603 ARM: dts: bcm2711: Don't mark timer regs unconfigured
    49d3178ea54a ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
    7c2a5a535cbd RDMA/mlx5: Handle errors returned from mlx5r_ib_rate()
    adeba5b0d120 RDMA/bnxt_re: Add missing paranthesis in map_qp_id_to_tbl_indx
    2776978d2fac RDMA/rxe: Fix the failure of ibv_query_device() and ibv_query_device_ex() tests
    9d22afe499d0 arm64: dts: rockchip: Remove undocumented sdmmc property from lubancat-1
    be96850f9ed2 arm64: dts: bcm2712: PL011 UARTs are actually r1p5
    98c175b8eb2b ARM: dts: bcm2711: PL011 UARTs are actually r1p5
    b8a47aa0b3df ARM: dts: bcm2711: Fix xHCI power-domain
    11ae21f1b926 soc: imx8m: Unregister cpufreq and soc dev in cleanup path
    224d8bf798fb soc: imx8m: Use devm_* to simplify probe failure handling
    4d709816638d soc: imx8m: Remove global soc_uid
    25e4700489cf xfrm_output: Force software GSO only in tunnel mode
    a0395e96831a xfrm: fix tunnel mode TX datapath in packet offload mode
    a64df69c9718 arm64: dts: rockchip: remove supports-cqe from rk3588 tiger
    02396956ad89 arm64: dts: rockchip: remove supports-cqe from rk3588 jaguar
    5e203693ebf2 arm64: dts: freescale: tqma8mpql: Fix vqmmc-supply
    ea835113e5d0 firmware: imx-scu: fix OF node leak in .probe()
    d78510d151b5 firmware: qcom: scm: Fix error code in probe()
    f491dd2afe1c Linux 6.12.20
    62b9ad7e52d4 fs/netfs/read_collect: add to next->prev_donated
    8f324d99306b HID: apple: disable Fn key handling on the Omoton KB066
    888bcd6c5832 nvme-fc: rely on state transitions to handle connectivity loss
    f87271d21dd4 Bluetooth: L2CAP: Fix corrupted list in hci_chan_del
    ee06d5c81041 tools/sched_ext: Add helper to check task migration state
    46db29a2c8b1 sched_ext: selftests/dsp_local_on: Fix selftest on UP systems
    9d9d87e44dd7 smb: client: Fix match_session bug preventing session reuse
    beb97eba4cd8 smb3: add support for IAKerb
    f41514828296 mm/hugetlb: wait for hugetlb folios to be freed
    3b699bcc2667 i2c: sis630: Fix an error handling path in sis630_probe()
    ee2ae325f78e i2c: ali15x3: Fix an error handling path in ali15x3_probe()
    be05097610f0 i2c: ali1535: Fix an error handling path in ali1535_probe()
    9233b85afb47 x86/vmware: Parse MP tables for SEV-SNP enabled guests under VMware hypervisors
    1c46673be93d cifs: Fix integer overflow while processing closetimeo mount option
    4740cef2a9d0 cifs: Fix integer overflow while processing actimeo mount option
    2809a79bc649 cifs: Fix integer overflow while processing acdirmax mount option
    833f2903eb8b cifs: Fix integer overflow while processing acregmax mount option
    527bde0d9cac block: change blk_mq_add_to_batch() third argument type to bool
    0dfe4a7957a5 scripts: generate_rust_analyzer: add uapi crate
    4614939363bb scripts: generate_rust_analyzer: add missing include_dirs
    657f5e3eeceb scripts: generate_rust_analyzer: add missing macros deps
    7c29e8fd1f0e drm/i915: Increase I915_PARAM_MMAP_GTT_VERSION version to indicate support for partial mmaps
    e72a52a5cf18 ASoC: codecs: wm0010: Fix error handling path in wm0010_spi_probe()
    77213a424a48 nvme: move error logging from nvme_end_req() to __nvme_end_req()
    6f33bb8664b8 drm/xe/pm: Temporarily disable D3Cold on BMG
    b99b5c254442 drm/xe/userptr: Fix an incorrect assert
    0e9989bea707 drm/xe: Release guc ids before cancelling work
    084c46a133c1 drm/xe: cancel pending job timer before freeing scheduler
    90d1cf2fad80 ASoC: rt722-sdca: add missing readable registers
    9dcd2b72ea05 rust: init: add missing newline to pr_info! calls
    c79a462560d0 ASoC: cs42l43: Fix maximum ADC Volume
    cebcc1f336a6 drm/gma500: Add NULL check for pci_gfx_root in mid_get_vbt_data()
    4ec50b0cead5 rust: error: add missing newline to pr_warn! calls
    a46a9371f8b9 ASoC: ops: Consistently treat platform_max as control value
    752b56bb76e2 sched_ext: Validate prev_cpu in scx_bpf_select_cpu_dfl()
    72833a339f1f net: phy: nxp-c45-tja11xx: add TJA112XB SGMII PCS restart errata
    d52d624f3d70 net: phy: nxp-c45-tja11xx: add TJA112X PHY configuration errata
    b9004fe68878 smb: client: fix regression with guest option
    9721f3a79345 qlcnic: fix memory leak issues in qlcnic_sriov_common.c
    608bbf7ff5a5 Fix mmu notifiers for range-based invalidates
    f6bbea2ffea7 arm64: mm: Populate vmemmap at the page level if not section aligned
    5a87e46da241 dm-flakey: Fix memory corruption in optional corrupt_bio_byte feature
    454825019d2f netmem: prevent TX of unreadable skbs
    e2c89427e08b ASoC: amd: yc: Support mic on another Lenovo ThinkPad E16 Gen 2 model
    ac4b32cb59ff ASoC: Intel: sof_sdw: Fix unlikely uninitialized variable use in create_sdw_dailinks()
    0a024f992500 clk: samsung: gs101: fix synchronous external abort in samsung_clk_save()
    d14ef11b1d1e clk: samsung: update PLL locktime for PLL142XX used on FSD platform
    a4261bbc33fb ksmbd: prevent connection release during oplock break notification
    62746ae3f541 ksmbd: fix use-after-free in ksmbd_free_work_struct
    bac7b8b1a3f1 drm/amd/display: Fix slab-use-after-free on hdcp_work
    04f90b505ad3 drm/amd/display: Assign normalized_pix_clk when color depth = 14
    6d669a3b031a drm/amd/display: Restore correct backlight brightness after a GPU reset
    fefa811e616b drm/amd/display: fix missing .is_two_pixels_per_container
    9826fd36ff20 drm/amd/display: fix default brightness
    d1227b94d75c drm/amd/display: Disable unneeded hpd interrupts during dm_init
    60ae74e367ae drm/amdgpu/display: Allow DCC for video formats on GFX12
    c5c5e76aea80 drm/amd/amdkfd: Evict all queues even HWS remove queue failed
    72235808eabe drm/amdgpu: NULL-check BO's backing store when determining GFX12 PTE flags
    beb47bc67363 drm/dp_mst: Fix locking when skipping CSN before topology probing
    962912aaf8d1 drm/atomic: Filter out redundant DPMS calls
    e487d35964fb drm/panic: fix overindented list items in documentation
    8232ec53bcdd drm/panic: use `div_ceil` to clean Clippy warning
    8f55d4414d55 drm/i915/cdclk: Do cdclk post plane programming later
    220e26960ef4 spi: microchip-core: prevent RX overflows when transmit size > FIFO size
    488ffc0cac38 x86/microcode/AMD: Fix out-of-bounds on systems with CPU-less NUMA nodes
    677088b7fa88 rust: init: fix `Zeroable` implementation for `Option<NonNull<T>>` and `Option<KBox<T>>`
    514d35a745b8 rust: Disallow BTF generation with Rust + LTO
    28d472f153f9 rust: alloc: satisfy POSIX alignment requirement
    6db379b34a06 rust: remove leftover mentions of the `alloc` crate
    2ef7bdb84620 rust: lockdep: Remove support for dynamically allocated LockClassKeys
    ccffb475c133 USB: serial: option: match on interface class for Telit FN990B
    d233dbf101b1 USB: serial: option: fix Telit Cinterion FE990A name
    3bfa629f4516 USB: serial: option: add Telit Cinterion FE990B compositions
    87ede08ef245 USB: serial: ftdi_sio: add support for Altera USB Blaster 3
    1a7493a2b899 Input: i8042 - swap old quirk combination with new quirk for more devices
    64c6abf1b427 Input: i8042 - swap old quirk combination with new quirk for several devices
    ee554ffa3731 Input: i8042 - add required quirks for missing old boardnames
    3d6fa8c56bb1 Input: i8042 - swap old quirk combination with new quirk for NHxxRZQ
    0ff93d895619 Input: xpad - rename QH controller to Legion Go S
    f7ccf4eb4bac Input: xpad - add support for TECNO Pocket Go
    d91dd818f1fc Input: xpad - add support for ZOTAC Gaming Zone
    e2304bbf8789 Input: xpad - add multiple supported devices
    1936b189fa7d Input: xpad - add 8BitDo SN30 Pro, Hyperkin X91 and Gamesir G7 SE controllers
    84f7b6f1d63a Input: iqs7222 - preserve system status register
    2daccd3b50dd Input: ads7846 - fix gpiod allocation
    eff502828bb4 Input: goodix-berlin - fix vddio regulator references
    fef9d44b24be cifs: Throw -EOPNOTSUPP error on unsupported reparse point type from parse_reparse_point()
    b2bccc729b93 cifs: Validate content of WSL reparse point buffers
    061ea46c56f6 vhost: return task creation error instead of NULL
    7184e996107c block: fix 'kmem_cache of name 'bio-108' already exists'
    d1ceef54b239 net: Handle napi_schedule() calls from non-interrupt
    1cf295ac531c drm/nouveau: Do not override forced connector status
    27fcaf0afe16 mptcp: safety check before fallback
    d7e94211d12d perf/x86/rapl: Add support for Intel Arrow Lake U
    2d2b4bdf083d x86/irq: Define trace events conditionally
    c481ada21a72 x86/of: Don't use DTB for SMP setup if ACPI is enabled
    b1d5a2c0501f perf/x86/intel: Use better start period for frequency mode
    665de082f3cb drm/vkms: Round fixp2int conversion in lerp_u16
    7b67d2671481 ASoC: SOF: Intel: don't check number of sdw links when set dmic_fixup
    e5c9f8d2202d ASoC: dapm-graph: set fill colour of turned on nodes
    df2ae00d9605 fuse: don't truncate cached, mutated symlink
    c54e42985189 ASoC: tas2764: Set the SDOUT polarity correctly
    1769f5cb5395 ASoC: tas2764: Fix power control mask
    e43334e1dc09 ASoC: tas2770: Fix volume scale
    06d7337799dc phy: ti: gmii-sel: Do not use syscon helper to build regmap
    bfe7f298eedc nvme: only allow entering LIVE from CONNECTING state
    94e7476fa7c5 sctp: Fix undefined behavior in left shift operation
    7ece63c977c1 cifs: Treat unhandled directory name surrogate reparse points as mount directory nodes
    317fb015fe58 apple-nvme: Release power domains when probe fails
    1f07456a5a66 nvmet-rdma: recheck queue state is LIVE in state lock in recv done
    fd903dd30122 nvme-pci: quirk Acer FA100 for non-uniqueue identifiers
    b349a3d1b15e io-wq: backoff when retrying worker creation
    4fd9f51368a2 net: wwan: mhi_wwan_mbim: Silence sequence number glitch errors
    a14be80a82c8 ASoC: SOF: amd: Handle IPC replies before FW_BOOT_COMPLETE
    985c2c69a5e4 ASoC: SOF: amd: Add post_fw_run_delay ACP quirk
    eb49f80b8a6f ALSA: hda: hda-intel: add Panther Lake-H support
    458173e86d77 ASoC: SOF: Intel: pci-ptl: Add support for PTL-H
    c51c8ec76cfc ALSA: hda: intel-dsp-config: Add PTL-H support
    4ed43c26b7dc PCI: pci_ids: add INTEL_HDA_PTL_H
    8aac6256919d ASoC: SOF: Intel: hda: add softdep pre to snd-hda-codec-hdmi module
    5b27776a2beb ASoC: arizona/madera: use fsleep() in up/down DAPM event delays.
    f6eaaf1f5bcf ASoC: rsnd: adjust convert rate limitation
    6ff121ffe87c ASoC: rsnd: don't indicate warning on rsnd_kctrl_accept_runtime()
    e96e1000be20 ASoC: rsnd: indicate unsupported clock rate
    d44418f5024f ALSA: hda/realtek: Limit mic boost on Positivo ARN50
    a402f90da448 ASoC: simple-card-utils.c: add missing dlc->of_node
    c18fc7e6bbd0 ASoC: Intel: soc-acpi-intel-mtl-match: declare adr as ull
    ed05ae9a27c9 ASoC: Intel: sof_sdw: Add quirk for Asus Zenbook S14
    d5742c484f52 ASoC: Intel: sof_sdw: Add lookup of quirk using PCI subsystem ID
    45fb7e0d0cab selftests/bpf: Fix invalid flag of recv()
    02a12760d7c9 drm/tests: hdmi: Fix recursive locking
    b0f9bb67869d drm/tests: hdmi: Reorder DRM entities variables assignment
    9828d2f2a6ee drm/tests: hdmi: Remove redundant assignments
    f8094625a591 Bluetooth: L2CAP: Fix slab-use-after-free Read in l2cap_send_cmd
    2139811c3f79 Xen/swiotlb: mark xen_swiotlb_fixup() __init
    aa3b0ea4742a arm64: amu: Delay allocating cpumask for AMU FIE support
    8aa4c89378ed LoongArch: KVM: Set host with kernel mode when switch to VM mode
    f30b7b949ed8 LoongArch: Fix kernel_page_present() for KPRANGE/XKPRANGE
    a91922e9eab5 thermal/cpufreq_cooling: Remove structure member documentation
    e129f7291506 s390/cio: Fix CHPID "configure" attribute caching
    7e759fb01512 platform/x86: int3472: Call "reset" GPIO "enable" for INT347E
    515b17dcd4cf platform/x86: int3472: Use correct type for "polarity", call it gpio_flags
    f6ee81371e70 platform/x86: thinkpad_acpi: Support for V9 DYTC platform profiles
    f92324135f09 platform/x86: thinkpad_acpi: Fix invalid fan speed on ThinkPad X120e
    30a40b592594 sched: Clarify wake_up_q()'s write to task->wake_q.next
    c39bd0df25b4 objtool: Ignore dangling jump table entries
    d5ca39d3369a btrfs: fix two misuses of folio_shift()
    3ceaafa26f30 HID: apple: fix up the F6 key on the Omoton KB066 keyboard
    024d7e006aa4 HID: hid-apple: Apple Magic Keyboard a3203 USB-C support
    08fde0878480 selftests/cgroup: use bash in test_cpuset_v1_hp.sh
    fb019cf04211 HID: topre: Fix n-key rollover on Realforce R3S TKL boards
    2501c9ce2da7 HID: intel-ish-hid: ipc: Add Panther Lake PCI device IDs
    25736fe5893d usb: phy: generic: Use proper helper for property detection
    705f2515189c HID: hid-steam: Fix issues with disabling both gamepad mode and lizard mode
    6ca3d4d87af4 HID: ignore non-functional sensor in HP 5MP Camera
    3cef11955f29 HID: intel-ish-hid: Send clock sync message immediately after reset
    e9275a19e271 HID: intel-ish-hid: fix the length of MNG_SYNC_FW_CLOCK in doorbell
    05db4968d4bb sched_ext: selftests/dsp_local_on: Fix sporadic failures
    7963b379a37c selftests: always check mask returned by statmount(2)
    37e638d4cae4 vboxsf: fix building with GCC 15
    3b477a0296f4 alpha/elf: Fix misc/setarch test of util-linux by removing 32bit support
    ef35c36fb4f1 smb: client: fix noisy when tree connecting to DFS interlink targets
    61699cb2534f ACPI: resource: IRQ override for Eluktronics MECH-17
    af71ba921d08 scsi: qla1280: Fix kernel oops when debug level > 2
    3be04084517e scsi: ufs: core: Fix error return with query response
    1207e5d1a268 scsi: core: Use GFP_NOIO to avoid circular locking dependency
    36793d90d76f drm/amd/display: Fix out-of-bound accesses
    8bf1b5eeaf94 platform/x86/intel: pmc: fix ltr decode in pmc_core_ltr_show()
    20d6994b6f1f sched/debug: Provide slice length for fair tasks
    b253660fac5e iscsi_ibft: Fix UBSAN shift-out-of-bounds warning in ibft_attr_show_nic()
    aa189c394168 futex: Pass in task to futex_queue()
    fb51a7209398 btrfs: avoid starting new transaction when cleaning qgroup during subvolume drop
    ccdec7ea9a3d powercap: call put_device() on an error path in powercap_register_control_type()
    ae5716b4631f hrtimers: Mark is_migration_base() with __always_inline
    18bee525aa9a nvme-fc: do not ignore connectivity loss during connecting
    50ef04270048 nvme-fc: go straight to connecting state when initializing
    d6402fb37720 net/mlx5e: Prevent bridge link show failure for non-eswitch-allowed devices
    f7bf259a0427 net/mlx5: Bridge, fix the crash caused by LAG state check
    b22fae6a7aaf net/mlx5: Lag, Check shared fdb before creating MultiPort E-Switch
    4251e73182c3 net/mlx5: Fix incorrect IRQ pool usage when releasing IRQs
    5f634c972be8 net/mlx5: HWS, Rightsize bwc matcher priority
    9e79fdabd52c Revert "openvswitch: switch to per-action label counting in conntrack"
    e6610f9c08b4 net: openvswitch: remove misbehaving actions length check
    a4d42b590115 gre: Fix IPv6 link-local address generation.
    931681bc821f netfilter: nft_exthdr: fix offset with ipv4_find_option()
    5c3ca9cb48b5 net_sched: Prevent creation of classes with TC_H_ROOT
    e6cb63fac7fd ipvs: prevent integer overflow in do_ip_vs_get_ctl()
    db1e0c085682 netfilter: nf_conncount: Fully initialize struct nf_conncount_tuple in insert_tree()
    992a60cdfd9f rtase: Fix improper release of ring list entries in rtase_sw_reset
    247347fe0cdd selftests: bonding: fix incorrect mac address
    4cf224c45fe7 bonding: fix incorrect MAC address setting to receive NS messages
    5c47d5bfa7b0 net: mctp: unshare packets when reassembling
    a597d4b75669 net: switchdev: Convert blocking notification chain to a raw one
    187ef72a8438 eth: bnxt: fix memory leak in queue reset
    0997443906b9 bnxt_en: handle tpa_info in queue API implementation
    fa36f457eec3 bnxt_en: refactor tpa_info alloc/free into helpers
    f49bc4d7ff3d eth: bnxt: use page pool for head frags
    f059a0fd7330 eth: bnxt: fix kernel panic in the bnxt_get_queue_stats{rx | tx}
    5b57ed14a1b8 eth: bnxt: do not update checksum in bnxt_xdp_build_skb()
    a6604717850e eth: bnxt: do not use BNXT_VNIC_NTUPLE unconditionally in queue restart logic
    14eb5f0d6554 eth: bnxt: return fail if interface is down in bnxt_queue_mem_alloc()
    19107e71be33 eth: bnxt: fix truesize for mb-xdp-pass case
    1d34296409a5 net/mlx5: handle errors in mlx5_chains_create_table()
    102d02874911 Drivers: hv: vmbus: Don't release fb_mmio resource in vmbus_free_mmio()
    4545e2aa121a fbdev: hyperv_fb: Allow graceful removal of framebuffer
    ae833890703c fbdev: hyperv_fb: Simplify hvfb_putmem
    cfffe46a994a fbdev: hyperv_fb: Fix hang in kdump kernel when on Hyper-V Gen 2 VMs
    24f1bbfb2be7 drm/hyperv: Fix address space leak when Hyper-V DRM device is removed
    be7188d7f1f6 netpoll: hold rcu read lock in __netpoll_send_skb()
    caff87addf19 net: mctp i2c: Copy headers if cloned
    370dacb7edc2 net: mctp i3c: Copy headers if cloned
    956d8ef54a42 net: dsa: mv88e6xxx: Verify after ATU Load ops
    251841a71c4f net/mlx5: Fill out devlink dev info only for PFs
    55b098a2beec Revert "Bluetooth: hci_core: Fix sleeping function called from invalid context"
    0677a4f3c067 Bluetooth: hci_event: Fix enabling passive scanning
    a5158d67bff0 wifi: cfg80211: cancel wiphy_work before freeing wiphy
    83a73cb88f1d wifi: mac80211: don't queue sdata::work for a non-running sdata
    6114d2e6efda wifi: iwlwifi: mvm: fix PNVM timeout for non-MSI-X platforms
    68896dd50180 sched: address a potential NULL pointer dereference in the GRED scheduler.
    0befa32ac3f9 netfilter: nf_tables: make destruction work queue pernet
    a5396ee0f541 netfilter: nf_conncount: garbage collection is not skipped when jiffies wrap around
    198907fa1444 ice: Fix switchdev slow-path in LAG
    3b27e6e10a32 ice: fix memory leak in aRFS after reset
    44386eb2d9b7 ice: do not configure destination override for switchdev
    2231d7c821f3 netfilter: nft_ct: Use __refcount_inc() for per-CPU nft_ct_pcpu_template.
    a585f6ea42ec pinctrl: nuvoton: npcm8xx: Add NULL check in npcm8xx_gpio_fw
    319900a10835 pinctrl: bcm281xx: Fix incorrect regmap max_registers value
    ea8411db9fba fbdev: hyperv_fb: iounmap() the correct memory when removing a device
    99012b24ca23 userfaultfd: fix PTE unmapping stack-allocated PTE copies
    4e9507246298 mm: fix kernel BUG when userfaultfd_move encounters swapcache
    a74979dce9e9 mm/slab/kvfree_rcu: Switch to WQ_MEM_RECLAIM wq
    b2c792d89ac5 yaffs2: switch from readlink_copy() to vfs_readlink()
    807165b1ec1c tools/power/x86/intel-speed-select: Prefix header search path with sysroot
    e97df805b938 drm/tilcdc: Set preferred depth
    7160a4379dcc arch/arm64/configs: remove CONFIG_SM_DISPCC_8650
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
index c09a91c579..e672d79dd7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "15dd975f84e62ba7b866a96108aff27b97cdbf80"
-SRCREV_meta ?= "722f1da424c10f7a7cd02646657bbc56b86c2c7b"
+SRCREV_machine ?= "960077a20c6a927a576235a80d23851a00bbc34f"
+SRCREV_meta ?= "702c2b220c24ba42deb79a2d3c40488a698bd77b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.19"
+LINUX_VERSION ?= "6.12.22"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index ec030dedca..23b1d80c4b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.19"
+LINUX_VERSION ?= "6.12.22"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
-SRCREV_meta ?= "722f1da424c10f7a7cd02646657bbc56b86c2c7b"
+SRCREV_machine ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
+SRCREV_meta ?= "702c2b220c24ba42deb79a2d3c40488a698bd77b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 97505b1263..b0fcecc850 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "3a973aae1addba0ecd7485694d4fcfc624085f24"
-SRCREV_machine:qemuarm64 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
-SRCREV_machine:qemuloongarch64 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
-SRCREV_machine:qemumips ?= "fc7877fe6aa5f2a445e17941a5858c7e19a1746d"
-SRCREV_machine:qemuppc ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
-SRCREV_machine:qemuriscv64 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
-SRCREV_machine:qemuriscv32 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
-SRCREV_machine:qemux86 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
-SRCREV_machine:qemux86-64 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
-SRCREV_machine:qemumips64 ?= "9e2bc57fafb525cb3fbbfab7c7f92bca7e9a43f4"
-SRCREV_machine ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
-SRCREV_meta ?= "722f1da424c10f7a7cd02646657bbc56b86c2c7b"
+SRCREV_machine:qemuarm ?= "fe9e38fa63fe6652f86046bcc6f670729deee4bf"
+SRCREV_machine:qemuarm64 ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
+SRCREV_machine:qemuloongarch64 ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
+SRCREV_machine:qemumips ?= "4b24835dc644c442b4008815241a38497356f029"
+SRCREV_machine:qemuppc ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
+SRCREV_machine:qemuriscv64 ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
+SRCREV_machine:qemuriscv32 ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
+SRCREV_machine:qemux86 ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
+SRCREV_machine:qemux86-64 ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
+SRCREV_machine:qemumips64 ?= "bf4d16d07b6213b7423097d9c6b207d809313392"
+SRCREV_machine ?= "6c467459255e4005f8fa082a7c1f2909abcf9de5"
+SRCREV_meta ?= "702c2b220c24ba42deb79a2d3c40488a698bd77b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e9cc806c0152fa9993f817cebf42989a3e2530bb"
+SRCREV_machine:class-devupstream ?= "55767d6e74ef155f43fff978ad4e2f69f3f8fad7"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.19"
+LINUX_VERSION ?= "6.12.22"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


