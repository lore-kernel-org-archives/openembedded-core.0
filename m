Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA617C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 04:40:14 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.43993.1739162407200460312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Feb 2025 20:40:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TJpRlr8i;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c056bba58dso118236085a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Feb 2025 20:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739162406; x=1739767206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m8YzmXC7blAkFkUQpTnPg/vUfdX320I3u/ylHtWwvLI=;
        b=TJpRlr8iMf4tzB14U9PyoNSbwEOkcvg/dwNG0zY8nBkOBybZiGXRF2Z10uBEFnTA7d
         OzDQmEtk/YSvh8acKG3V7b3+RNOMY+OOgVSSPXEnUaLHmdrpYwDtf/rCC0X4+IbIy9B8
         k8caM07FCq61AdzhFjNtzDEYSUb0EICIOfIdadXZo+sy74NPaNgije17nAlHPIuW0EcS
         SZYvUTndcKgBh6TLvMxo1ijpuqTYtzT6jdQ/7jbJUAqnsagtWqn+E/XuAnvppYJ4E8Vl
         t1bfk5eefryGu30S+EqU3oP/93xWjtgVlDGwRnIHyF3BPoet9PI8q2wB+XdecKohUXQP
         Lk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739162406; x=1739767206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8YzmXC7blAkFkUQpTnPg/vUfdX320I3u/ylHtWwvLI=;
        b=r5MB6f/pZG+5xdY5W0AMcXjwngMHe82po+VoIwaAxztXZQI/fT/mkWxvR+8QU+Nrhs
         UMgYDDpLCKJ89j1pcyuTVJJ6NJCL9K7iadPtqM2uYNPBtnNxkXjrDX1544KkyX5w6/uu
         yB16Ab1PGTOBJcGEqmIJW12zk3PeIDaY50n+eOWsms3SGGapaoo73rrjjs7JU1E9Axm9
         dC139r+qPsuZA7Wegg2ZLuP4ppjS5QmoaJmeV+YjI/z5G+kcapzO5BJxyQLVMGflfvZ/
         YNRLy5p9GCcLXB7AyT+fDQz6UyvJMZJx7Eqavllr0Lwt6crelWQ9+OIebZsDZ71hfUO0
         6Jhg==
X-Gm-Message-State: AOJu0Yw9bzMQaM5vjw9bPanZRHuBkO065jWi3JiBtbgUIBzv164lpui5
	e+Keefyy1TWggSNN7+NugKE+buEAtZGw20llpMcQJrFpIR7S7Tb3ZEdy9Rfri7M=
X-Gm-Gg: ASbGncv7Uk7rHd7NTf62rXakQvdXN0cewwH24OIrjhlxBLROfkDZ3MXbqED3kDIIM2i
	pQuZySu4L7kVGhI4GrS4ZvYxDCQt++2xFDQOKSGGhzbVw21ooDGJkdRGGEcBYu4Tepl9lJ0pjmq
	IcakbGU7ySUMhItvyQGcyaDZC6EUCL8PG2OkLhUvdvlq6uhAJ3aLGLwQ3I2zmoBu98JD80KJ/wg
	d8OH/5CCNYKjfTov8hUiwpsy/E3IJ8OCkqr6seWHulnciSTHo77od/N3haQ9j9I+NmQvEkfvTV9
	8Nj/S+hn+GfQV+W8J06u+nNzPy7pnKZNUYoOjZbxiWUTveoK5rQuiGN0VJztpQwHM1zdniYgicx
	eAa1rtdlJpqJbwW7s
X-Google-Smtp-Source: AGHT+IG8+TIEJ697/xm0a5qp5ol/hZfjZJhOzsXJ/9+n+aRSyKaBwizw/EwwmRUxiAoyCDB51AMu1w==
X-Received: by 2002:a05:6214:1d24:b0:6d8:ab7e:e554 with SMTP id 6a1803df08f44-6e4456feaa3mr235779036d6.34.1739162405280;
        Sun, 09 Feb 2025 20:40:05 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e454130846sm20776396d6.114.2025.02.09.20.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:40:04 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.12: update to v6.12.13
Date: Sun,  9 Feb 2025 23:40:02 -0500
Message-Id: <20250210044002.537921-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 04:40:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211076

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.12 to the latest korg -stable release that comprises
the following commits:

    4b07fe4a044d Linux 6.12.13
    333f1282241c ethtool: ntuple: fix rss + ring_cookie check
    5ae72abbf91e btrfs: do proper folio cleanup when run_delalloc_nocow() failed
    27a46e60617a LoongArch: Change 8 to 14 for LOONGARCH_MAX_{BRP,WRP}
    c3a3741db8c1 memcg: fix soft lockup in the OOM process
    a9e318519b22 KVM: x86: Plumb in the vCPU to kvm_x86_ops.hwapic_isr_update()
    8eb4d51b44c7 drm/amd/display: Add hubp cache reset when powergating
    593d852f7fe2 s390: Add '-std=gnu11' to decompressor and purgatory CFLAGS
    ba30a82cb2d0 ASoC: da7213: Initialize the mutex
    141a2389a694 selftests/bpf: Add test to verify tailcall and freplace restrictions
    5f72bf80e74b Revert "s390/mm: Allow large pages for KASAN shadow mapping"
    1cf217795968 ethtool: Fix access to uninitialized fields in set RXNFC command
    364d7e7f3097 xfrm: Fix acquire state insertion.
    78b366aa0e81 xfrm: Add error handling when nla_put_u32() returns an error
    698943070ea7 dma-mapping: save base/size instead of pointer to shared DMA pool
    8de4e5a92282 of: reserved-memory: Warn for missing static reserved memory regions
    a6848636d8b4 btrfs: output the reason for open_ctree() failure
    237e19519c8f md/md-bitmap: Synchronize bitmap_get_stats() with bitmap lifetime
    b853ff0b514c powerpc/pseries/iommu: Don't unset window if it was never set
    6e601a64f777 media: imx-jpeg: Fix potential error pointer dereference in detach_pm()
    278a98f6d8a7 staging: media: max96712: fix kernel oops when removing module
    929b69810eec usb: gadget: f_tcm: Don't free command immediately
    7e5ee3281dc0 pps: Fix a use-after-free
    d1f8e69eec91 media: uvcvideo: Fix double free in error path
    f2013d19b770 remoteproc: core: Fix ida_free call while not allocated
    7cc8f681f6d4 RDMA/mlx5: Fix implicit ODP use after free
    b2bf3a2fdc71 mptcp: blackhole only if 1st SYN retrans w/o MPC is accepted
    84ac44d9fed3 mptcp: handle fastopen disconnect correctly
    8ac344cbd84f mptcp: pm: only set fullmesh for subflow endp
    6169e942370b mptcp: consolidate suboption status
    9a49748e5a6e clk: qcom: gcc-x1e80100: Do not turn off usb_2 controller GDSC
    15b50cbc6ff6 usb: typec: tcpci: Prevent Sink disconnection before vPpsShutdown in SPR PPS
    ce5c91a1b2b2 usb: typec: tcpm: set SRC_SEND_CAPABILITIES timeout to PD_T_SENDER_RESPONSE
    01c74aeac297 usb: dwc3: Skip resume if pm_runtime_set_active() fails
    ebba1bebf036 usb: dwc3: core: Defer the probe until USB power supply ready
    e5dd5bfc3359 usb: dwc3-am62: Fix an OF node leak in phy_syscon_pll_refclk()
    b69805e311fb usb: gadget: f_tcm: Fix Get/SetInterface return value
    a1fd89c09385 drivers/card_reader/rtsx_usb: Restore interrupt based detection
    ae069cd2ba09 usb: xhci: Fix NULL pointer dereference on certain command aborts
    f395b7efcee8 net: usb: rtl8150: enable basic endpoint checking
    e0216c39b496 ALSA: usb-audio: Add delay quirk for iBasso DC07 Pro
    631430768b41 xfs: don't shut down the filesystem for media failures beyond end of log
    b0773cf34eec xfs: check for dead buffers in xfs_buf_find_insert
    0a8a05bf2873 ktest.pl: Check kernelrelease return in get_version
    64e222d15615 selftests/ftrace: Fix to use remount when testing mount GID option
    ab5b45301933 selftests/rseq: Fix handling of glibc without rseq support
    f488b53b5443 drm/amd/display: Reduce accessing remote DPCD overhead
    49b7182b97ba netfilter: nf_tables: reject mismatching sum of field_len with set key length
    4cea10a863f9 kbuild: switch from lz4c to lz4 for compression
    31b3e5ce9f79 Revert "SUNRPC: Reduce thread wake-up rate when receiving large RPC messages"
    260cbf992713 md/md-bitmap: move bitmap_{start, end}write to md upper layer
    aa8e15d69f5c md/raid5: implement pers->bitmap_sector()
    783e6715a49d md: add a new callback pers->bitmap_sector()
    88564ef736fb md/md-bitmap: remove the last parameter for bimtap_ops->endwrite()
    dc1967143ab9 md/md-bitmap: factor behind write counters out from bitmap_{start/end}write()
    00d1943fe46d f2fs: Introduce linear search for dentries
    c12b8bc1e9c5 hexagon: Fix unbalanced spinlock in die()
    5892138e3001 hexagon: fix using plain integer as NULL pointer warning in cmpxchg
    e4e8ed67e085 kconfig: fix memory leak in sym_warn_unmet_dep()
    6e26ca181870 kconfig: fix file name in warnings when loading KCONFIG_DEFCONFIG_LIST
    281244ab4271 cifs: Fix getting and setting SACLs over SMB1
    077f372585b6 cifs: Validate EAs for WSL reparse points
    4eb5f692e923 tools/power turbostat: Fix forked child affinity regression
    e7f44edd44ff ASoC: amd: acp: Fix possible deadlock
    206d8e0242de io_uring/uring_cmd: use cached cmd_op in io_uring_cmd_sock()
    21cfbeae7d7c ASoC: rockchip: i2s_tdm: Re-add the set_sysclk callback
    01ef02ab9615 RISC-V: Mark riscv_v_init() as __init
    d562d14f1b11 tools/power turbostat: Fix PMT mmaped file size rounding
    cd89d5745a18 tools/power turbostat: Allow using cpu device in perf counters on hybrid platforms
    9bbb93a9e8d0 hostfs: fix string handling in __dentry_name()
    52f0a28e17f7 genksyms: fix memory leak when the same symbol is read from *.symref file
    a23834b78277 genksyms: fix memory leak when the same symbol is added from source
    a7a84a880afb net: hsr: fix fill_frame_info() regression vs VLAN packets
    13c9e38509e1 net: sh_eth: Fix missing rtnl lock in suspend/resume path
    0296981941cf net: ravb: Fix missing rtnl lock in suspend/resume path
    557707906dd3 net: xdp: Disallow attaching device-bound programs in generic mode
    1dd823a46e25 tcp: correct handling of extreme memory squeeze
    5a1bfd530f34 bgmac: reduce max frame size to support just MTU 1500
    a06bb37d6541 vsock: Allow retrying on connect() failure
    377d47fda395 Bluetooth: btnxpuart: Fix glitches seen in dual A2DP streaming
    930e1790b99e Bluetooth: btusb: mediatek: Add locks for usb_driver_claim_interface()
    dcb4937a7d2c perf test: Skip syscall enum test if no landlock syscall
    161348aea66f perf trace: Fix runtime error of index out of bounds
    59f60af34a9e s390/sclp: Initialize sclp subsystem via arch_cpu_finalize_init()
    b92942e6a457 net: stmmac: Limit FIFO size by hardware capability
    56380f4a0f54 net: stmmac: Limit the number of MTL queues to hardware capability
    a68d7a9fb830 ethtool: Fix set RXNFC command with symmetric RSS hash
    ad1ec19b0bb9 net: ethtool: only allow set_rxnfc with rss + ring_cookie if driver opts in
    3e44707da8db ptp: Properly handle compat ioctls
    5a54367a7c23 net: davicom: fix UAF in dm9000_drv_remove
    f554bce48860 vxlan: Fix uninit-value in vxlan_vnifilter_dump()
    10ba5a3d57af rxrpc, afs: Fix peer hash locking vs RCU callback
    47f7a18e3a13 selftests: net/{lib,openvswitch}: extend CFLAGS to keep options from environment
    ed2c4ea53f2f selftests: mptcp: extend CFLAGS to keep options from environment
    0f893f526698 tools: ynl: c: correct reverse decode of empty attrs
    f6620669ad6f net: netdevsim: try to close UDP port harness races
    1992fb261c90 net: rose: fix timer races against user threads
    85496955355c net/ncsi: use dev_set_mac_address() for Get MC MAC Address handling
    43f9177be438 s390/mm: Allow large pages for KASAN shadow mapping
    29c1fd9fddd2 iavf: allow changing VLAN state without calling PF
    5c9b22519d14 ice: remove invalid parameter of equalizer
    8191df8ec88c ice: extend dump serdes equalizer values feature
    877eed2b01cb ice: rework of dump serdes equalizer values feature
    93fcd499330d ice: fix ice_parser_rt::bst_key array size
    66bf9b3d9e16 idpf: convert workqueues to unbound
    f71daa29bceb idpf: Acquire the lock before accessing the xn->salt
    431759c23b27 idpf: fix transaction timeouts on reset
    7f42a905db2e idpf: add read memory barrier when checking descriptor done bit
    e468aace4074 xfrm: Don't disable preemption while looking up cache state.
    6c9b7d48bf46 perf trace: Fix BPF loading failure (-E2BIG)
    3b732c60a00c PM: hibernate: Add error handling for syscore_suspend()
    a099834a51cc ipmr: do not call mr_mfc_uses_dev() for unres entries
    b3c4360329bf net: fec: implement TSO descriptor cleanup
    bbd4c81ff61e net: phy: marvell-88q2xxx: Fix temperature measurement with reset-gpios
    48cf1415e207 gpio: mxc: remove dead code after switch to DT-only
    82736bb83fb0 net: hns3: fix oops when unload drivers paralleling
    fed2385309f6 net: airoha: Fix wrong GDM4 register definition
    24ac5b75243d regulator: core: Add missing newline character
    77e5266e3d3f ubifs: skip dumping tnc tree when zroot is null
    589444be701d rtc: loongson: clear TOY_MATCH0_REG in loongson_rtc_isr()
    e5e06455760f rtc: pcf85063: fix potential OOB write in PCF85063 NVMEM read
    5127f3cbfc78 rtc: tps6594: Fix integer overflow on 32bit systems
    6945701ca157 xfrm: delete intermediate secpath entry in packet offload mode
    839064a02295 dmaengine: ti: edma: fix OF node reference leaks in edma_driver
    a16871c7832e xfrm: state: fix out-of-bounds read during lookup
    5e4334dc3944 xfrm: Add an inbound percpu state cache.
    aa48a18fdb09 xfrm: Cache used outbound xfrm states at the policy.
    2a64cff2aabe xfrm: Add support for per cpu xfrm state handling.
    87fdd4c4478f xfrm: replay: Fix the update of replay_esn->oseq_hi for GSO
    e69a9ca0c93e tools/bootconfig: Fix the wrong format specifier
    194d26a5a43c LoongArch: Fix warnings during S3 suspend
    265c3dfe976b NFSv4.2: mark OFFLOAD_CANCEL MOVEABLE
    6de31904ebc7 NFSv4.2: fix COPY_NOTIFY xdr buf size calculation
    f4265cd6ddc5 nfs: fix incorrect error handling in LOCALIO
    b35a3edc7c71 serial: 8250: Adjust the timeout for FIFO mode
    f709f3ca1feb tty: mips_ejtag_fdc: fix one more u8 warning
    1614e75d1a1b driver core: class: Fix wild pointer dereferences in API class_dev_iter_next()
    fd41b2e9aaf4 module: Don't fail module loading when setting ro_after_init section RO failed
    565611d10170 module: Extend the preempt disabled section in dereference_symbol_descriptor().
    eddd3176b8c4 nilfs2: handle errors that nilfs_prepare_chunk() may return
    4b08d23d7d19 nilfs2: protect access to buffers with no active references
    1098bb8d5241 nilfs2: do not force clear folio if buffer is referenced
    8b40f17ddfd0 ocfs2: mark dquot as inactive if failed to start trans while releasing dquot
    48964027809b erofs: fix potential return value overflow of z_erofs_shrink_scan()
    9621a0a5e338 erofs: sunset `struct erofs_workgroup`
    f66ba30be7be erofs: move erofs_workgroup operations into zdata.c
    e6d1529c79e9 erofs: get rid of erofs_{find,insert}_workgroup
    c6896bf4c611 firewire: test: Fix potential null dereference in firewire kunit test
    19b248069d1b scsi: mpi3mr: Fix possible crash when setting up bsg fails
    0e0ac81d51f1 scsi: ufs: bsg: Delete bsg_dev when setting up bsg fails
    a183cac63301 scsi: mpt3sas: Set ioc->manu_pg11.EEDPTagMode directly to 1
    c8c65adfd21b PCI: microchip: Set inbound address translation for coherent or non-coherent mode
    90985dc7629f PCI: microchip: Add support for using either Root Port 1 or 2
    538308191b54 PCI: endpoint: pci-epf-test: Fix check for DMA MEMCPY test
    1d12b389ef23 PCI: endpoint: pci-epf-test: Set dma_chan_rx pointer to NULL on error
    a665fab63d06 PCI: dwc: Always stop link in the dw_pcie_suspend_noirq
    a2c80a188166 PCI: qcom: Update ICC and OPP values after Link Up event
    828bd4f4c863 PCI: imx6: Add missing reference clock disable logic
    56bfb833480b PCI: imx6: Deassert apps_reset in imx_pcie_deassert_core_reset()
    d0f8c566464d PCI: imx6: Skip controller_id generation logic for i.MX7D
    7fb8d5a34026 PCI: imx6: Configure PHY based on Root Complex or Endpoint mode
    9ff46b0bfeb6 PCI: rcar-ep: Fix incorrect variable used when calling devm_request_mem_region()
    f86b2180c26c media: dvb-usb-v2: af9035: fix ISO C90 compilation error on af9035_i2c_master_xfer
    5dd040e75f3e staging: media: imx: fix OF node leak in imx_media_add_of_subdevs()
    9cef839d3bb1 watchdog: rti_wdt: Fix an OF node leak in rti_wdt_probe()
    a44591a0ea3c media: nxp: imx8-isi: fix v4l2-compliance test errors
    c538df69c39c mtd: hyperbus: hbmc-am654: fix an OF node reference leak
    aeeec3de85e6 mtd: rawnand: brcmnand: fix status read of brcmnand_waitfunc
    58465dfc429c media: uvcvideo: Propagate buf->error to userspace
    b0b51f4c5636 media: camif-core: Add check for clk_enable()
    406e62371d09 media: mipi-csis: Add check for clk_enable()
    c227d973812b media: i2c: ov9282: Correct the exposure offset
    98be204dc93c media: i2c: imx412: Add missing newline to prints
    85659ca38385 media: i2c: imx290: Register 0x3011 varies between imx327 and imx290
    c3e18562b65c media: marvell: Add check for clk_enable()
    26d8d3d57ce3 remoteproc: mtk_scp: Only populate devices for SCP cores
    45e1246e5c61 PCI: endpoint: Destroy the EPC device in devm_pci_epc_destroy()
    1c49fb86be6e media: lmedm04: Handle errors for lme2510_int_read
    265ecadbe54f media: rc: iguanair: handle timeouts
    e61977c71494 of/fdt: Restore possibility to use both ACPI and FDT from bootloader
    9a0fe62f93ed of: reserved_mem: Restructure how the reserved memory regions are processed
    4c22e09c6566 spi: omap2-mcspi: Correctly handle devm_clk_get_optional() errors
    d5d33f01b86a iommufd/iova_bitmap: Fix shift-out-of-bounds in iova_bitmap_offset_to_index()
    5d679086873f iommu: iommufd: fix WARNING in iommufd_device_unbind
    7a2de8126ed3 RDMA/rxe: Fix the warning "__rxe_cleanup+0x12c/0x170 [rdma_rxe]"
    6531c17e0b3d RDMA/cxgb4: Notify rdma stack for IB_EVENT_QP_LAST_WQE_REACHED event
    02b69afbd545 efi: sysfb_efi: fix W=1 warnings when EFI is not set
    92ed1efb6ac0 of: reserved-memory: Do not make kmemleak ignore freed address
    6cffdf48386c of: property: Avoiding using uninitialized variable @imaplen in parse_interrupt_map()
    823ad923afa1 RDMA/mlx5: Fix indirect mkey ODP page count
    9b0063098fcd i3c: dw: Fix use-after-free in dw_i3c_master driver due to race condition
    7cda16e0fcc5 arm64: dts: qcom: x1e80100-romulus: Update firmware nodes
    72dcd1bec429 arm64: tegra: Fix DMA ID for SPI2
    873f6bdf23b8 fbdev: omapfb: Fix an OF node leak in dss_of_port_get_parent_device()
    e2cd277d7155 arm64: dts: ti: k3-am642-hummingboard-t: Convert overlay to board dts
    a61cac5a6167 arm64: dts: rockchip: fix num-channels property of wolfvision pf5 mic
    ba021d9c40a7 ARM: dts: mediatek: mt7623: fix IR nodename
    c2c7cae5abaf arm64: dts: marvell: cn9131-cf-solidwan: fix cp1 comphy links
    903e0a56c145 arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts
    0df5fc0ff6fc arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
    de18221e411e arm64: dts: qcom: sc8280xp: Fix interrupt type of camss interrupts
    df2b841369d2 arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
    c811521a05df dts: arm64: mediatek: mt8195: Remove MT8183 compatible for OVL
    98d68c9d140b arm64: dts: mediatek: mt7988: Add missing clock-div property for i2c
    390d3baeba51 firmware: qcom: scm: Cleanup global '__scm' on probe failures
    22c805533ce7 arm64: dts: qcom: sc8280xp: Fix up remoteproc register space sizes
    b75d17a66497 arm64: dts: qcom: sm8150-microsoft-surface-duo: fix typos in da7280 properties
    729be2681802 arm64: dts: qcom: sc7180: fix psci power domain node names
    d9b220293850 arm64: dts: qcom: sc7180: change labels to lower-case
    5756723770e8 arm64: dts: qcom: sc7180-trogdor-pompom: rename 5v-choke thermal zone
    7a9b13f7e2a4 arm64: dts: qcom: sc7180-trogdor-quackingstick: add missing avee-supply
    2c778443e0e8 arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: remove disabled ov7251 camera
    e3aef4becef5 arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Convert mezzanine riser to dtso
    4ead95198f48 arm64: dts: qcom: qcm6490-shift-otter: remove invalid orientation-switch
    e51f7dd6d94d ARM: omap1: Fix up the Retu IRQ on Nokia 770
    ab3de8c252e1 RDMA/hns: Clean up the legacy CONFIG_INFINIBAND_HNS
    5a79cc9bc961 RDMA/rtrs: Add missing deinit() call
    14ef8b5ec726 RDMA/bnxt_re: Fix to drop reference to the mmap entry in case of error
    8f2356864982 arm64: dts: allwinner: a64: explicitly assign clock parent for TCON0
    8810a8368b60 arm64: dts: rockchip: Fix sdmmc access on rk3308-rock-s0 v1.1 boards
    770bc57fcca7 arm64: dts: ti: k3-am62a: Remove duplicate GICR reg
    70f974e78f5e arm64: dts: ti: k3-am62: Remove duplicate GICR reg
    0ac272cf7aa2 ARM: dts: microchip: sama5d27_wlsom1_ek: Add no-1-8-v property to sdmmc0 node
    1b2ab35ff782 ARM: dts: microchip: sama5d29_curiosity: Add no-1-8-v property to sdmmc0 node
    03d9d88fd341 arm64: dts: qcom: sm8650: Fix CDSP context banks unit addresses
    04fbd92f2006 arm64: dts: qcom: x1e80100: correct sleep clock frequency
    e1fb7b18f95c arm64: dts: qcom: sm8650: correct sleep clock frequency
    1f1eb092ad8d arm64: dts: qcom: sm8550: correct sleep clock frequency
    7f937e5791fe arm64: dts: qcom: sm8450: correct sleep clock frequency
    b98c1e0602ee arm64: dts: qcom: sm8350: correct sleep clock frequency
    bcea9460c1f2 arm64: dts: qcom: sm8250: correct sleep clock frequency
    c1bcabbc98fe arm64: dts: qcom: sm6375: correct sleep clock frequency
    d2e117be0e8c arm64: dts: qcom: sm6125: correct sleep clock frequency
    8be30ff7bac7 arm64: dts: qcom: sm4450: correct sleep clock frequency
    3f78fff04803 arm64: dts: qcom: sdx75: correct sleep clock frequency
    301ff6f2185d arm64: dts: qcom: sc7280: correct sleep clock frequency
    e20fd641b1b1 arm64: dts: qcom: qrb4210-rb2: correct sleep clock frequency
    cdb697459763 arm64: dts: qcom: q[dr]u1000: correct sleep clock frequency
    b697e33ab4de arm64: dts: qcom: qcs404: correct sleep clock frequency
    514dc233e4e1 arm64: dts: qcom: msm8994: correct sleep clock frequency
    7461e33fd205 arm64: dts: qcom: msm8939: correct sleep clock frequency
    4b209a5f7350 arm64: dts: qcom: msm8916: correct sleep clock frequency
    f6b361ab18be arm64: dts: qcom: sm7225-fairphone-fp4: Drop extra qcom,msm-id value
    5ed403074341 arm64: dts: qcom: msm8994: Describe USB interrupts
    6f2316306c48 arm64: dts: qcom: msm8996: Fix up USB3 interrupts
    eea829201a2a arm64: defconfig: remove obsolete CONFIG_SM_DISPCC_8650
    b7b0c071d0a0 arm64: dts: qcom: sa8775p: Update sleep_clk frequency
    ae73995df9ab arm64: dts: qcom: msm8996-xiaomi-gemini: Fix LP5562 LED1 reg property
    0edca0b18d8e arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop pp3300_panel voltage settings
    3b02273446e2 memory: tegra20-emc: fix an OF node reference bug in tegra_emc_find_node_by_ram_code()
    ed6244294b44 ARM: dts: stm32: Swap USART3 and UART8 alias on STM32MP15xx DHCOM SoM
    5b48e03583f3 ARM: dts: stm32: Deduplicate serial aliases and chosen node for STM32MP15xx DHCOM SoM
    aa0e632b55e8 arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from pcie1
    f502835b42d3 RDMA/srp: Fix error handling in srp_add_port
    932dbae0f803 arm64: dts: mediatek: mt8183: willow: Support second source touchscreen
    925c44d08424 arm64: dts: mediatek: mt8183: kenzo: Support second source touchscreen
    27a54c0ce1d9 RDMA/rxe: Fix mismatched max_msg_sz
    fb855cca17f2 arm: dts: socfpga: use reset-name "stmmaceth-ocp" instead of "ahb"
    854abd4217b4 ARM: dts: aspeed: yosemite4: correct the compatible string for max31790
    baf491720430 ARM: dts: aspeed: yosemite4: Add required properties for IOE on fan boards
    6cd70c80e717 ARM: dts: aspeed: yosemite4: correct the compatible string of adm1272
    e9d981ee7c12 arm64: dts: mediatek: mt8173-evb: Fix MT6397 PMIC sub-node names
    35a4758e11e9 arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC sub-node names
    32840ea43be1 arm64: dts: mediatek: mt8395-genio-1200-evk: Drop regulator-compatible property
    458b389e58b5 arm64: dts: medaitek: mt8395-nio-12l: Drop regulator-compatible property
    e6fda48f49b9 arm64: dts: mediatek: mt8195-demo: Drop regulator-compatible property
    ae6abbcf61f3 arm64: dts: mediatek: mt8195-cherry: Drop regulator-compatible property
    ca967fe61fe0 arm64: dts: mediatek: mt8192-asurada: Drop regulator-compatible property
    3e8842e93f20 arm64: dts: mediatek: mt8173-elm: Drop regulator-compatible property
    ae7421a84e9f arm64: dts: mediatek: mt8173-evb: Drop regulator-compatible property
    dd352107f22b rdma/cxgb4: Prevent potential integer overflow on 32bit
    f1ff9fea7f87 arm64: dts: renesas: rzg3s-smarc: Fix the debug serial alias
    df6851bda8c2 RDMA/mlx4: Avoid false error about access to uninitialized gids array
    69b04ea4e288 ARM: dts: stm32: Fix IPCC EXTI declaration on stm32mp151
    42b5491a18f1 ARM: dts: stm32: Increase CPU core voltage on STM32MP13xx DHCOR SoM
    2e72386c102b arm64: dts: mediatek: mt8516: reserve 192 KiB for TF-A
    60b0c5a9d235 arm64: dts: mediatek: mt8516: add i2c clock-div property
    e37212e54565 arm64: dts: mediatek: mt8516: fix wdt irq type
    cf2059254ec8 arm64: dts: mediatek: mt8516: fix GICv2 range
    c7e34fb570cb arm64: dts: mt8183: set DMIC one-wire mode on Damu
    8e497c5ba700 arm64: dts: mediatek: mt8186: Move wakeup to MTU3 to get working suspend
    cb7e900f7ccb ARM: dts: imx7-tqma7: add missing vs-supply for LM75A (rev. 01xxx)
    3aadad527102 ARM: at91: pm: change BU Power Switch to automatic mode
    252e2209471c soc: atmel: fix device_node release in atmel_soc_device_init()
    33e47d957307 bpf: Cancel the running bpf_timer through kworker for PREEMPT_RT
    0ef5b75641f0 cifs: Use cifs_autodisable_serverino() for disabling CIFS_MOUNT_SERVER_INUM in readdir.c
    699179dfc8d7 smb: client: fix oops due to unset link speed
    f939008a52c5 rhashtable: Fix rhashtable_try_insert test
    8ca38d0ca8c3 padata: avoid UAF for reorder_work
    c629808304e8 padata: add pd get/put refcnt helper
    573ac9c70bf7 padata: fix UAF in padata_reorder
    122fb9d2dfb9 perf lock: Fix parse_lock_type which only retrieve one lock flag
    aab5d33fb6a5 tools: Sync if_xdp.h uapi tooling header
    e8f5f2c0a74c ALSA: hda/realtek - Fixed headphone distorted sound on Acer Aspire A115-31 laptop
    6e1e451456e1 iommu/amd: Remove unused amd_iommu_domain_update()
    0e272fe6a02c bpf: tcp: Mark bpf_load_hdr_opt() arg2 as read-write
    77e2f5d481d0 libbpf: Fix incorrect traversal end type ID when marking BTF_IS_EMBEDDED
    beadb92ea609 libbpf: Fix return zero when elf_begin failed
    20c84906e2da selftests/bpf: Fix btf leak on new btf alloc failure in btf_distill test
    78b97783496b bpf: Send signals asynchronously if !preemptible
    ee46db2c8f99 ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83JX, 83MC and 83NM
    310743bfc8ce ASoC: Intel: sof_sdw: Fix DMI match for Lenovo 83LC
    c560e8405098 perf inject: Fix use without initialization of local variables
    8f4abee94a51 pinctrl: amd: Take suspend type into consideration which pins are non-wake
    cac84246365b pinctrl: stm32: Add check for clk_enable()
    fd0e32fe09af perf report: Fix misleading help message about --demangle
    8f6c2ed42e87 ALSA: hda: Fix compilation of snd_hdac_adsp_xxx() helpers
    11ba17769eb5 perf MANIFEST: Add arch/*/include/uapi/asm/bpf_perf_event.h to the perf tarball
    b2477676dbcb ASoC: Intel: avs: Fix init-config parsing
    deca59b8a485 ASoC: Intel: avs: Fix theoretical infinite loop
    74147a5e097f ASoC: Intel: avs: Fix the minimum firmware version numbers
    27daf3954e6a ASoC: Intel: avs: Do not readq() u32 registers
    d2992b838e81 perf namespaces: Fixup the nsinfo__in_pidns() return type, its bool
    968d6aff5631 perf namespaces: Introduce nsinfo__set_in_pidns()
    3289f79a8103 perf machine: Don't ignore _etext when not a text symbol
    6eed2771d8a7 perf maps: Fix display of kernel symbols
    f156a74cfc4b perf top: Don't complain about lack of vmlinux when not resolving some kernel samples
    7e8e2fefa612 selftests/bpf: Avoid generating untracked files when running bpf selftests
    818a43355825 padata: fix sysfs store callback check
    b777b14c2a4a bpf: Reject struct_ops registration that uses module ptr and the module btf_id is missing
    7c174d312e3b ALSA: seq: Make dependency on UMP clearer
    8e7d29b69821 bpf: Use refcount_t instead of atomic_t for mmap_count
    e665c1f29474 crypto: iaa - Fix IAA disabling that occurs when sync_mode is set to 'async'
    396d44367579 crypto: ixp4xx - fix OF node reference leaks in init_ixp_crypto()
    07cb3e0ab922 crypto: hisilicon/sec2 - fix for aead invalid authsize
    1c2f57cb03e2 crypto: hisilicon/sec2 - fix for aead icv error
    eb2e58484b83 rhashtable: Fix potential deadlock by moving schedule_work outside lock
    b0027500000d bpf: bpf_local_storage: Always use bpf_mem_alloc in PREEMPT_RT
    f5a9be718fae ktest.pl: Remove unused declarations in run_bisect_test function
    888829e54ea4 pinctrl: nomadik: Add check for clk_enable()
    58ad9c26238f perf expr: Initialize is_test value in expr__ctx_new()
    2ac66e67678a ASoC: renesas: rz-ssi: Use only the proper amount of dividers
    e63deda2a51b perf bpf: Fix two memory leakages when calling perf_env__insert_bpf_prog_info()
    0db155d08b9f perf header: Fix one memory leakage in process_bpf_prog_info()
    22ae75ad6ed7 perf header: Fix one memory leakage in process_bpf_btf()
    651959fae5fb crypto: caam - use JobR's space to access page 0 regs
    b7de862bda9d crypto: api - Fix boot-up self-test race
    1dbc270f9df7 crypto: tegra - do not transfer req when tegra init fails
    2122e8553cb4 iommu/arm-smmuv3: Update comments about ATS and bypass
    08b6ffea8158 selftests/bpf: Fix fill_link_info selftest on powerpc
    829b0400e5c9 ASoC: sun4i-spdif: Add clock multiplier settings
    6a6e2beb2af8 ASoC: Intel: sof_sdw: correct mach_params->dmic_num
    a230cd305198 libbpf: Fix segfault due to libelf functions not setting errno
    65f1b9773080 tools/testing/selftests/bpf/test_tc_tunnel.sh: Fix wait for server bind
    950c0d172d3d ASoC: wcd937x: Use *-y for Makefile
    3487c4c0b860 ASoC: mediatek: mt8365: Use *-y for Makefile
    ae2205cdc469 ASoC: cs40l50: Use *-y for Makefile
    a29129e2364c libbpf: don't adjust USDT semaphore address if .stapsdt.base addr is missing
    2bf01c4600a1 pinctrl: samsung: Fix irq handling if an error occurs in exynos_irq_demux_eint16_31()
    d3269ace1058 platform/x86: x86-android-tablets: make platform data be static
    da0735df99db platform/mellanox: mlxbf-pmc: incorrect type in assignment
    d08f4074f9c6 net/rose: prevent integer overflows in rose_setsockopt()
    a0753466f01c tcp_cubic: fix incorrect HyStart round start detection
    8448c87b3af6 net: ethernet: ti: am65-cpsw: fix freeing IRQ in am65_cpsw_nuss_remove_tx_chns()
    5213efec9085 net: sched: refine software bypass handling in tc_run
    bedfabb4e7c9 netfilter: nft_flow_offload: update tcp state flags under lock
    d7fe7e1bbe95 netfilter: nf_tables: fix set size with rbtree backend
    73c7e1d6898c net: sched: Disallow replacing of child qdisc from one parent to another
    b382ab9b885c net: avoid race between device unregistration and ethnl ops
    695359e2ffc8 octeon_ep_vf: remove firmware stats fetch in ndo_get_stats64
    15cc4388d293 octeon_ep: remove firmware stats fetch in ndo_get_stats64
    f7b74f3d0302 net/mlxfw: Drop hard coded max FW flash image size
    33e2168788f8 net: let net.core.dev_weight always be non-zero
    f161d3c9e576 selftests/landlock: Fix error message
    e9d01de8951f selftests/landlock: Fix build with non-default pthread linking
    e730500506e7 pwm: stm32: Add check for clk_enable()
    f98ccd7d7721 dev: Acquire netdev_rename_lock before restoring dev->name in dev_change_name().
    eb5516343daf clk: analogbits: Fix incorrect calculation of vco rate delta
    3d7263512770 inet: ipmr: fix data-races
    1158ad8e8abb Bluetooth: btrtl: check for NULL in btrtl_setup_realtek()
    df2f2d9199e6 Bluetooth: btbcm: Fix NULL deref in btbcm_get_board_name()
    2e857fc25f42 wifi: cfg80211: adjust allocation of colocated AP data
    9f6b2d4a0bca selftests: harness: fix printing of mismatch values in __EXPECT()
    09d28675a834 selftests: timers: clocksource-switch: Adapt progress to kselftest framework
    1f3c13e32984 cpufreq: ACPI: Fix max-frequency computation
    1ed46901bb7c i2c: designware: Actually make use of the I2C_DW_COMMON and I2C_DW symbol namespaces
    776fb8be525f wifi: mt76: mt7996: fix ldpc setting
    2b7e4a8eeff5 wifi: mt76: mt7996: fix definition of tx descriptor
    0e9f49b97f1e wifi: mt76: mt7996: fix incorrect indexing of MIB FW event
    9afda07be035 wifi: mt76: mt7996: fix HE Phy capability
    2c77d8e7881b wifi: mt76: mt7996: fix the capability of reception of EHT MU PPDU
    e6d5e6bdf0ae wifi: mt76: mt7996: add max mpdu len capability
    aa9b8600e558 wifi: mt76: mt7996: fix register mapping
    f1879d80bee3 wifi: mt76: mt7915: fix register mapping
    f1f0bc58d94e wifi: mt76: mt7915: fix omac index assignment after hardware reset
    bb79a37d12bb wifi: mt76: mt7915: firmware restart on devices with a second pcie link
    c8f27e369550 wifi: mt76: only enable tx worker after setting the channel
    fdef354b0542 wifi: mt76: mt7996: fix rx filter setting for bfee functionality
    80bce8956615 wifi: mt76: mt7925: Properly handle responses for commands with events
    4c58e49dd98d wifi: mt76: mt7925: Cleanup MLO settings post-disconnection
    bc59dd02af37 wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO
    d786a67a2854 wifi: mt76: mt7925: Init secondary link PM state
    24ff9b82f8d4 wifi: mt76: mt7925: Update secondary link PS flow
    12f1394600c8 wifi: mt76: mt7925: Update mt7925_unassign_vif_chanctx for per-link BSS
    3fe7acc6f4b4 wifi: mt76: mt7925: Update mt792x_rx_get_wcid for per-link STA
    848276d8b3fb wifi: mt76: mt7925: Update mt7925_mcu_sta_update for BC in ASSOC state
    0443ed06cfb2 wifi: mt76: Enhance mt7925_mac_link_sta_add to support MLO
    89355c2a060e wifi: mt76: mt7925: Enhance mt7925_mac_link_bss_add to support MLO
    7ebe75994843 wifi: mt76: mt7925: Fix CNM Timeout with Single Active Link in MLO
    09f30c9ba539 wifi: mt76: mt7925: fix wrong parameter for related cmd of chan info
    4cc0cfe2fe7e wifi: mt76: mt7925: Fix incorrect WCID phy_idx assignment
    c9389e3f9453 wifi: mt76: mt7925: Fix incorrect WCID assignment for MLO
    7d354bda12bb wifi: mt76: mt7925: Fix incorrect MLD address in bss_mld_tlv for MLO support
    e29e4f883edb wifi: mt76: connac: Extend mt76_connac_mcu_uni_add_dev for MLO
    7e49a6b5e060 wifi: mt76: mt7915: fix overflows seen when writing limit attributes
    bd1170aaf70d wifi: mt76: mt7996: fix overflows seen when writing limit attributes
    c993abb4d0a6 wifi: mt76: mt7925: fix the invalid ip address for arp offload
    f157600d7f4b wifi: mt76: mt7925: fix get wrong chip cap from incorrect pointer
    e3d02ea71121 wifi: mt76: mt7925: fix wrong band_idx setting when enable sniffer mode
    5872530c2862 wifi: mt76: mt7925: fix NULL deref check in mt7925_change_vif_links
    62265c270f17 wifi: mt76: mt7915: Fix an error handling path in mt7915_add_interface()
    5f8535ab79df wifi: mt76: mt7921: fix using incorrect group cipher after disconnection.
    b2c3d926fd5b wifi: mt76: mt76u_vendor_request: Do not print error messages when -EPROTO
    2569e65d2eb6 landlock: Handle weird files
    979204ce6902 net/smc: fix data error when recvmsg with MSG_PEEK flag
    5f8738915b9c clk: thead: Fix cpu2vp_clk for TH1520 AP_SUBSYS clocks
    d592d6635264 clk: thead: Add CLK_IGNORE_UNUSED to fix TH1520 boot
    51232f911441 clk: thead: Fix clk gate registration to pass flags
    d9d1fb1f1708 clk: ralink: mtmips: remove duplicated 'xtal' clock for Ralink SoC RT3883
    cd10b7fcb95a wifi: mac80211: don't flush non-uploaded STAs
    984e7d2aa0de wifi: mac80211: Fix common size calculation for ML element
    10d8f4748111 wifi: mac80211: fix tid removal during mesh forwarding
    8ec6762a8eb8 wifi: cfg80211: Move cfg80211_scan_req_add_chan() n_channels increment earlier
    270ad6776e7c wifi: mac80211: prohibit deactivating all links
    7848626d0e49 wifi: iwlwifi: mvm: don't count mgmt frames as MPDU
    fbb563ad5032 wifi: iwlwifi: mvm: avoid NULL pointer dereference
    72c0f0cbbb43 wifi: iwlwifi: fw: read STEP table from correct UEFI var
    76fe201fd5b2 wifi: mt76: mt7915: Fix mesh scan on MT7916 DBDC
    d03b8fe1b518 wifi: mt76: mt7925: fix off by one in mt7925_load_clc()
    86250b9de90e hwmon: Fix help text for aspeed-g6-pwm-tach
    2403cb3c235d wifi: rtw89: fix race between cancel_hw_scan and hw_scan completion
    c115f7bcbbff wifi: rtw89: mcc: consider time limits not divisible by 1024
    7fc295fdd399 wifi: rtw89: avoid to init mgnt_entry list twice when WoWLAN failed
    223ba95fdcd3 wifi: rtw89: chan: fix soft lockup in rtw89_entity_recalc_mgnt_roles()
    1918a7c6bfcf wifi: rtw89: fix proceeding MCC with wrong scanning state after sequence changes
    61ad3210255b wifi: rtw89: tweak setting of channel and TX power for MLO
    0007546cb406 wifi: rtw89: chan: manage active interfaces
    f8ad42c530a6 wifi: rtw89: handle entity active flag per PHY
    45748f68402b wifi: wlcore: fix unbalanced pm_runtime calls
    b4459381ab7a wifi: mt76: mt7996: fix invalid interface combinations
    5816a934cf1b samples/landlock: Fix possible NULL dereference in parse_path()
    a8251d3a4c0c mfd: syscon: Fix race in device_node_get_regmap()
    f827eb547026 leds: cht-wcove: Use devm_led_classdev_register() to avoid memory leak
    a3bdd1493653 HID: fix generic desktop D-Pad controls
    e5bcae4212a6 HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check
    2a7c25a527a4 clk: qcom: gcc-sdm845: Do not use shared clk_ops for QUPs
    425f6a38173b wifi: ath12k: fix tx power, max reg power update to firmware
    6e657a5515fe ipmi: ssif_bmc: Fix new request loss when bmc ready for a response
    3d62a5037f3e OPP: OF: Fix an OF node leak in _opp_add_static_v2()
    92cff996624c net/mlx5: HWS, fix definer's HWS_SET32 macro for negative offset
    8937f5e38a21 ax25: rcu protect dev->ax25_ptr
    5078123528b1 regulator: of: Implement the unwind path of of_regulator_match()
    210eb2198691 clk: sunxi-ng: a64: stop force-selecting PLL-MIPI as TCON0 parent
    fb330fb03d14 clk: sunxi-ng: a64: drop redundant CLK_PLL_VIDEO0_2X and CLK_PLL_MIPI
    0c2cde001e38 dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
    1bb06f919fa5 team: prevent adding a device which is already a team device lower
    2e65257e315b clk: qcom: camcc-x1e80100: Set titan_top_gdsc as the parent GDSC of subordinate GDSCs
    c197d8c24b78 clk: imx: Apply some clks only for i.MX93
    6a1c64d92948 arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as SPDIF IPG clock
    61e74f4be83e clk: imx93: Add IMX93_CLK_SPDIF_IPG clock
    de5cfdcc4664 clk: imx: add i.MX91 clk
    505b041882a5 clk: imx93: Move IMX93_CLK_END macro to clk driver
    036f2f51098d dt-bindings: clock: imx93: Add SPDIF IPG clk
    46b7a2d86b5c dt-bindings: clock: Add i.MX91 clock support
    a7175e363abe dt-bindings: clock: imx93: Drop IMX93_CLK_END macro definition
    a553c563f9e7 clk: imx8mp: Fix clkout1/2 support
    4f8344fce91c udp: Deal with race between UDP socket address change and rehash
    60fbc6b52639 cpufreq: qcom: Implement clk_ops::determine_rate() for qcom_cpufreq* clocks
    a3ad17201d98 cpufreq: qcom: Fix qcom_cpufreq_hw_recalc_rate() to query LUT if LMh IRQ is not available
    7c86e802c6bc gpio: pca953x: log an error when failing to get the reset GPIO
    de7659f01ad1 net: airoha: Fix error path in airoha_probe()
    3257dac521d0 ptr_ring: do not block hard interrupts in ptr_ring_resize_multiple()
    07fb72fc9bc7 selftests: ktap_helpers: Fix uninitialized variable
    9096ba8b9b4e cpufreq: schedutil: Fix superfluous updates caused by need_freq_update
    c8c23a24fe58 pwm: stm32-lp: Add check for clk_enable()
    9345b588f88a inetpeer: do not get a refcount in inet_getpeer()
    4622e4509753 inetpeer: update inetpeer timestamp in inet_getpeer()
    dc4fd82dad77 inetpeer: remove create argument of inet_getpeer()
    d474a73856ae inetpeer: remove create argument of inet_getpeer_v[46]()
    d57713600916 leds: netxbig: Fix an OF node reference leak in netxbig_leds_get_of_pdata()
    2f5d37e92d1d dt-bindings: mfd: bd71815: Fix rsense and typos
    4a3b902a4aa3 cpupower: fix TSC MHz calculation
    285412c1f0e3 ACPI: fan: cleanup resources in the error path of .probe()
    f0ebb06e222b hwmon: (nct6775): Actually make use of the HWMON_NCT6775 symbol namespace
    889433a2ed5a module: Convert default symbol namespace to string literal
    fa4eada0ab48 wifi: brcmfmac: add missing header include for brcmf_dbg
    27013847229f regulator: dt-bindings: mt6315: Drop regulator-compatible property
    bd1bb30b9f59 HID: multitouch: fix support for Goodix PID 0x01e9
    437212f72374 wifi: rtlwifi: pci: wait for firmware loading before releasing memory
    32acebca0a51 wifi: rtlwifi: fix memory leaks and invalid access at probe error path
    3c8e9b792f06 wifi: rtlwifi: destroy workqueue at rtl_deinit_core
    543e3e9f2e9e wifi: rtlwifi: remove unused check_buddy_priv
    e1f3281d2732 dt-bindings: leds: class-multicolor: Fix path to color definitions
    e561d1a2ba3a clk: fix an OF node reference leak in of_clk_get_parent_name()
    712b9797e45a dt-bindings: mmc: controller: clarify the address-cells description
    5842ce7b120c rxrpc: Fix handling of received connection abort
    87662cb2e8c5 spi: zynq-qspi: Add check for clk_enable()
    7d8947f2153e net_sched: sch_sfq: don't allow 1 packet limit
    82bd38bd5467 net_sched: sch_sfq: handle bigger packets
    47c90db29e25 selftests/bpf: Actuate tx_metadata_len in xdp_hw_metadata
    886271409603 wifi: cfg80211: tests: Fix potential NULL dereference in test_cfg80211_parse_colocated_ap()
    3bd668f4b132 clk: renesas: cpg-mssr: Fix 'soc' node handling in cpg_mssr_reserved_init()
    64c4dcaeac1d wifi: wcn36xx: fix channel survey memory allocation size
    58980b9730f3 wifi: rtlwifi: usb: fix workqueue leak when probe fails
    1ed113485360 wifi: rtlwifi: fix init_sw_vars leak when probe fails
    3ea6d7502213 wifi: rtlwifi: wait for firmware loading before releasing memory
    85e67f3b89fa wifi: rtlwifi: rtl8192se: rise completion of firmware loading as last step
    35a6510800f7 wifi: rtlwifi: do not complete firmware loading needlessly
    411c77386699 wifi: rtlwifi: rtl8821ae: phy: restore removed code to fix infinite loop
    0ef5ef13d661 wifi: ath11k: Fix unexpected return buffer manager error for WCN6750/WCN6855
    e529fbcf1f35 ipmi: ipmb: Add check devm_kasprintf() returned value
    fdf0e2ec4625 genirq: Make handle_enforce_irqctx() unconditionally available
    d9cc477e77c6 drm/amdgpu: fix gpu recovery disable with per queue reset
    fd3ea4d5493f Revert "drm/amdgpu/gfx9: put queue resets behind a debug option"
    495497c6e7f7 drm/amdgpu: tear down ttm range manager for doorbell in amdgpu_ttm_fini()
    53da02eafd5a drm/bridge: it6505: Change definition of AUX_FIFO_MAX_SIZE
    37d00afa8035 drm/msm/mdp4: correct LCDC regulator name
    1ed982971d06 drm/msm: don't clean up priv->kms prematurely
    25599a16d777 drm/msm: Check return value of of_dma_configure()
    13492b477b99 drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
    84170589b50e drm/msm/dpu: link DSPP_2/_3 blocks on SM8650
    d4b2bed705ae drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
    636cb9bdcb3e drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
    f0258f99d209 drm/msm/dpu: link DSPP_2/_3 blocks on SM8250
    31a62075f0b8 drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
    0fa91a4911ab drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
    2c017e0d0970 drm/msm/dpu: provide DSPP and correct LM config for SDM670
    ff2def251849 OPP: fix dev_pm_opp_find_bw_*() when bandwidth table not initialized
    7d68c20638e5 OPP: add index check to assert to avoid buffer overflow in _read_freq()
    833b813b7fda drm/amdgpu/vcn: reset fw_shared under SRIOV
    1831b7b2b16f drm/rockchip: vop2: include rockchip_drm_drv.h
    d76731db8923 drm/rockchip: vop2: Add check for 32 bpp format for rk3588
    c4147b0b2c1e drm/rockchip: vop2: Check linear format for Cluster windows on rk3566/8
    684a0e469140 drm/rockchip: vop2: Setup delay cycle for Esmart2/3
    933d3c6952c9 drm/rockchip: vop2: Set AXI id for rk3588
    4128fb6a69bf drm/connector: Allow clearing HDMI infoframes
    b727c2c9c3ab printk: Defer legacy printing when holding printk_cpu_sync
    a7b38cd0c10a drm/rockchip: vop2: Fix the windows switch between different layers
    36766cdebe92 drm/panthor: Preserve the result returned by panthor_fw_resume()
    dc03fc577966 drm/rockchip: vop2: Fix the mixer alpha setup for layer 0
    869e43d21e7b drm/rockchip: vop2: Fix cluster windows alpha ctrl regsiters offset
    0b97cd8a61b2 drm/amdgpu: Fix potential NULL pointer dereference in atomctrl_get_smc_sclk_range_table
    e656f04ecd52 drm/amd/pm: Fix an error handling path in vega10_enable_se_edc_force_stall_config()
    ebaeca33d32c HID: core: Fix assumption that Resolution Multipliers must be in Logical Collections
    cb52be07651b drm/etnaviv: Fix page property being used for non writecombine buffers
    ae7d4873471c drm/msm/hdmi: simplify code in pll_get_integloop_gain
    99a877d607b4 drm/msm/dp: set safe_to_exit_level before printing it
    60075d4fc2e9 drm/rockchip: vop2: fix rk3588 dp+dsi maxclk verification
    af8d1d524ba6 drm/v3d: Fix performance counter source settings on V3D 7.x
    10a7d3e73408 psi: Fix race when task wakes up before psi_sched_switch() adjusts flags
    3f1215588b26 sched: psi: pass enqueue/dequeue flags to psi callbacks directly
    fd2818c5e08f sched: Split out __schedule() deactivate task logic into a helper
    c572fb94371d x86/topology: Use x86_sched_itmt_flags for PKG domain unconditionally
    b8af5591f35f x86/cpu: Enable SD_ASYM_PACKING for PKG domain on AMD
    490ac3890e4d sched: Fix race between yield_to() and try_to_wake_up()
    5bb4039f77a6 sched/fair: Fix value reported by hot tasks pulled in /proc/schedstat
    e4b64d34a48c sched/fair: Untangle NEXT_BUDDY and pick_next_task()
    d4ac10094869 perf/core: Save raw sample data conditionally based on sample type
    404ec81d6159 afs: Fix the fallback handling for the YFS.RemoveFile2 RPC call
    1e8c151fb26a nvme: fix bogus kzalloc() return check in nvme_init_effects_log()
    68303b5d382b select: Fix unbalanced user_access_end()
    c750de306651 btrfs: subpage: fix the bitmap dump of the locked flags
    0a1e8e59cdae partitions: ldm: remove the initial kernel-doc notation
    3118b5818a8f btrfs: improve the warning and error message for btrfs_remove_qgroup()
    e8c390a9a546 nvme: Add error path for xa_store in nvme_init_effects
    c5c5114bd7cb selftests/powerpc: Fix argument order to timer_sub()
    7043d58ecd13 powerpc/pseries/iommu: IOMMU incorrectly marks MMIO range in DDW
    4621771de1f1 nvme: Add error check for xa_store in nvme_get_effects_log
    dbcc46e79659 nvme-tcp: Fix I/O queue cpu spreading for multiple controllers
    d313ff5308fd block: don't update BLK_FEAT_POLL in __blk_mq_update_nr_hw_queues
    e278c7ff7574 block: check BLK_FEAT_POLL under q_usage_count
    cc0093865ea7 pstore/blk: trivial typo fixes
    a8ee6ecde2b7 nbd: don't allow reconnect after disconnect
    20e84b406fea ps3disk: Do not use dev->bounce_size before it is set
    f83f330fc432 block: retry call probe after request_module in blk_request_module
    d5354552f1f5 block: copy back bounce buffer to user-space correctly in case of split
    784908004f92 fs: fix proc_handler for sysctl_nr_open
    966a8ea20002 afs: Fix cleanup of immediately failed async calls
    47b3d95c0605 afs: Fix directory format encoding struct
    b393be8d8e71 afs: Fix EEXIST error returned from afs_rmdir() to be ENOTEMPTY
    af7198700a31 dlm: fix srcu_read_lock() return type to int
    a78032162103 dlm: fix removal of rsb struct that is master and dir record
    52b76423a4e2 powerpc/book3s64/hugetlb: Fix disabling hugetlb when fadump is active
    4338831b831c coredump: Do not lock during 'comm' reporting
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
index a3499a5118..9ad43410dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7db548fdce28b2d08c92e2c95ae59d9631df9240"
-SRCREV_meta ?= "75501dd73b672b229f8b619b5993cc7eaf09ce69"
+SRCREV_machine ?= "fed5fbc6b68a11d4a9055ea8aa481bb2945c9c89"
+SRCREV_meta ?= "2506ff7d20ee515e70964844fa40b35e4fdfbe92"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.12.12"
+LINUX_VERSION ?= "6.12.13"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 8625338b4a..a01b552000 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.12.inc
 
-LINUX_VERSION ?= "6.12.12"
+LINUX_VERSION ?= "6.12.13"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
-SRCREV_meta ?= "75501dd73b672b229f8b619b5993cc7eaf09ce69"
+SRCREV_machine ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
+SRCREV_meta ?= "2506ff7d20ee515e70964844fa40b35e4fdfbe92"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 022aa1fda2..d99759dba5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.12/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.12/standard/base"
 KBRANCH:qemumips64 ?= "v6.12/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "54de9d68cb5f13c7229c1a4a3d733042a450a2d5"
-SRCREV_machine:qemuarm64 ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
-SRCREV_machine:qemuloongarch64 ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
-SRCREV_machine:qemumips ?= "26293c8635512cec43c94c9b9c40efa39a021341"
-SRCREV_machine:qemuppc ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
-SRCREV_machine:qemuriscv64 ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
-SRCREV_machine:qemuriscv32 ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
-SRCREV_machine:qemux86 ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
-SRCREV_machine:qemux86-64 ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
-SRCREV_machine:qemumips64 ?= "fbd5391a051877d18b4ec30d172bd2d4cb266276"
-SRCREV_machine ?= "c0783a952f13edb776d48fd922e9f32b72a38eb0"
-SRCREV_meta ?= "75501dd73b672b229f8b619b5993cc7eaf09ce69"
+SRCREV_machine:qemuarm ?= "416d14d80c6a4cb641d42f95140aff1ede4da75a"
+SRCREV_machine:qemuarm64 ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
+SRCREV_machine:qemuloongarch64 ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
+SRCREV_machine:qemumips ?= "529b1f229abddc1db8f3240a19a0352257cdea49"
+SRCREV_machine:qemuppc ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
+SRCREV_machine:qemuriscv64 ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
+SRCREV_machine:qemuriscv32 ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
+SRCREV_machine:qemux86 ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
+SRCREV_machine:qemux86-64 ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
+SRCREV_machine:qemumips64 ?= "10419c638ea26a6dbd364c913f7c3d6894c64e23"
+SRCREV_machine ?= "c58d3ea5bbce394208d8099e9d6783bb0a0ddd25"
+SRCREV_meta ?= "2506ff7d20ee515e70964844fa40b35e4fdfbe92"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d914acc16b5910bf9b46e2e8b441569bfe180d1b"
+SRCREV_machine:class-devupstream ?= "4b07fe4a044d863926707e1106ff142427ec6e02"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.12/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.12.12"
+LINUX_VERSION ?= "6.12.13"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


