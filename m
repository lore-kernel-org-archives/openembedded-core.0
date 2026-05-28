Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989DDCD6E4B
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 02:37:26 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2835.1779935844173725501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 19:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a+6wFnqy;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5102582e23eso97608311cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 19:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779935843; x=1780540643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sY3ZDJVtC4VBgnHrQiLKrNK19Pb+cLCuAacySCSSXU=;
        b=a+6wFnqyqdww7eOV2JX307/4hBT6ZQT2vY2u8EFilG1Czl6Wl4Ib0rgmuLvPwFVZDC
         mcSD0W14KPadefIyO2tO8Kofqj5JcgYYL5m20Rs3gyyZ75nGTYN8MRHONbDm6k9TWsKh
         aCsI7NkvpHVBuwDE61CfUI7aJ/jMLVSgqbtOS0b45Ug6M/mQZA8rJOLa4ZkxNWcf+ZN0
         mwTFDiEHaxPD34v4W3yYb6D769ZabkSLdXPIq9l4He4JQPXTRC7D4VaWQ/mIOQcXOFRO
         AP7/wyv2aR16q6gB+DrRynY1D+VzpdqXc+l4MgdJNVkAJiMQHFHWz1k0wXZqyATjkpG+
         DvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779935843; x=1780540643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1sY3ZDJVtC4VBgnHrQiLKrNK19Pb+cLCuAacySCSSXU=;
        b=Si5shyBFveZFDa6Hx4EWJgPMz7SQKzq8NdEEoy8YuepJBtLo09iXXXPUh7kYwGr9W+
         74zh117GsBaolu7zRPpNC8i/h9nqqEiLv8AiGgVZYiXEgKg4Qw1C+fdaHYRXgTKxGY1s
         snOazBEzLi5GKvQnV/pfZE7fJngMJFK2iMDHbfL7lNda9E71jkRimmMWNN4TD2NDOewa
         RgZ1yBrgGbFcD+Ky4I+yEXgeUJVjunFUzGpX/ELVFbJwDHDnm1rNKc79RnhEN4UxBNFo
         1leeaBsi7a5cu/Fr2KKkmNOPDTS/uqBO1hMsS9XbuckVAiXeBuVcAgjI+1i9Hl3IP7H+
         5Lfg==
X-Gm-Message-State: AOJu0Yw+QJOfQB8dVBaGbbxSvcEfPHLJ8PABlf02BuDAbPkKmJv0wp2H
	dkUxBWHSlFhyvw2h+vhMHViApaPxt/LQ32IsCoVhyaPp1dPrbpkCVgrkcTleNUhy
X-Gm-Gg: Acq92OEm9dekKHE/WZ38S1qlvAz5kTMlvBeTF+s4jBx//1xyMQfGwdHwxK8IuHKcpcq
	TJWpxxWC6ujb2g2LtYSiCZJJYYaO/uoXUdZzdt6+VRqRQ/DDLKW6Olk0NeUN3L3bGZ8lBT8YW+5
	Mp/XjQgvJjHykmWS+GtEJ0A/RwrOc0tbvB29TEOJ4UJEo5BdunWwORoVt/wyn4nB+m7QaGDF8Z+
	d4mEd0+ucTAnZRkQJLqwuVoUWF2G4RAU9G8OglyxwmVK7B1A7fTQ8BWAtqJLVnfeDopf82SEf9o
	yVbUhrbZySbHj0ka7xkaX3KvQvuwwSb6jnZnrq2qx02FpE3yL7dOjiNzdyfqZPvDtd7c60n7kPs
	6HWl9GESnyv6WgHqzBRWnpMcoSZTro3INQbsvRkKBHC+Y3H6SHX+qGaGcJv5D8+qDaSvd8s7eJa
	AeSMx1ZZgOHhHk0LakaAiLS30yRTMpLpp3HB5oWb6E8hMIu5nhYJkFHTTy4M47U69Nh4ZxO+l/z
	vnVwShMaxajcZZIN7Vl9XsN/Uir9BPOfThG22IW/ybThmgRfyN6cSgIlN2HHdBfpWBfo2vJBI/F
	d4VFlqFhIINzUcn6HlyC6IZFVDjZJlK0Ueg8libf75AdkohKyaMFQhY=
X-Received: by 2002:a05:622a:d01:b0:50f:be4f:465d with SMTP id d75a77b69052e-516d44096aemr272025671cf.46.1779935842924;
        Wed, 27 May 2026 19:37:22 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcec8esm186146436d6.7.2026.05.27.19.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 19:37:22 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta-yocto-bsp][PATCH 06/07] yocto-bsps: update to v6.18.31
Date: Wed, 27 May 2026 22:37:10 -0400
Message-ID: <20260528023714.4026613-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
References: <20260528023714.4026613-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 02:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237687

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.18 to the latest korg -stable release that comprises
the following commits:

    52386a7b1beb Linux 6.18.32
    271cd5429513 drm/amdgpu/vcn4: Avoid overflow on msg bound check
    016b64a0313e drm/amdgpu/vcn3: Avoid overflow on msg bound check
    e9edf9893cf2 vsock/virtio: fix accept queue count leak on transport mismatch
    52da6a74ca3d vsock/virtio: fix empty payload in tap skb for non-linear buffers
    a534e1f985b6 vsock/virtio: fix length and offset in tap skb for split packets
    2602f7bb5818 vsock: fix buffer size clamping order
    8be786053797 batman-adv: tp_meter: fix tp_num leak on kmalloc failure
    5e9dfc07d061 tracing/fprobe: Remove fprobe from hash in failure path
    a2181464a4a7 tracing/fprobe: Unregister fprobe even if memory allocation fails
    d83e51202fec tracing: fprobe: optimization for entry only case
    52277410cbed tracing: fprobe: use rhltable for fprobe_ip_table
    5d12e0ab009a btrfs: fix btrfs_ioctl_space_info() slot_count TOCTOU which can lead to info-leak
    dfd05a16b5c9 btrfs: fix double free in create_space_info_sub_group() error path
    a4b5c5d2f8c5 btrfs: remove fs_info argument from btrfs_sysfs_add_space_info_type()
    d784865ce48f usb: dwc3: Move GUID programming after PHY initialization
    476ee6389120 usb: dwc3: Add dwc pointer to dwc3_readl/writel
    e63942da5e96 usb: dwc3: Remove of dep->regs
    ce9aaa3af445 sched_ext: Read scx_root under scx_cgroup_ops_rwsem in cgroup setters
    30cf8e05d635 sched/ext: Implement cgroup_set_idle() callback
    dc34f8d8240f Bluetooth: hci_conn: fix potential UAF in create_big_sync
    c0a8dca8d556 spi: zynq-qspi: fix controller deregistration
    ed822a569645 spi: zynq-qspi: Simplify clock handling with devm_clk_get_enabled()
    33e5ce64b817 spi: tegra114: fix controller deregistration
    65eafad7a600 spi: tegra20-sflash: fix controller deregistration
    fafa9a4e831b spi: uniphier: fix controller deregistration
    b0a97cb0b9ba spi: uniphier: Simplify clock handling with devm_clk_get_enabled()
    6542e180fa6e pseries/papr-hvpipe: Fix race with interrupt handler
    09c15bbbed53 papr-hvpipe: convert papr_hvpipe_dev_create_handle() to FD_PREPARE()
    24d2912962d0 EDAC/versalnet: Fix device name memory leak
    d281f3ac0d00 block: fix zone write plug removal
    7105d9f1387d fbcon: Avoid OOB font access if console rotation fails
    1817dd0c350f fbcon: Rename struct fbcon_ops to struct fbcon_par
    f0d3bb6f5125 drm/amdgpu: rework how we handle TLB fences
    13e9ea445191 Revert "drm/amdgpu: don't attach the tlb fence for SI"
    576b73b24656 drm/amdgpu: Fix validating flush_gpu_tlb_pasid()
    fd78e63459ab drm/amdgpu: validate the flush_gpu_tlb_pasid()
    a9591e4083cc mm/damon/core: disallow time-quota setting zero esz
    377c3d5dc952 usb: typec: tcpm: reset internal port states on soft reset AMS
    d893804e9e3b mm/damon/reclaim: detect and use fresh enabled and kdamond_pid values
    4697ed7be9b9 mm/damon/lru_sort: detect and use fresh enabled and kdamond_pid values
    679e65ae721c mm/damon/core: implement damon_kdamond_pid()
    20048f0b38cd LoongArch: KVM: Compile switch.S directly into the kernel
    f49a00180dfc io_uring/zcrx: warn on freelist violations
    1a516d19100e io_uring/zcrx: use guards for locking
    0baf4b659cdc batman-adv: bla: put backbone reference on failed claim hash insert
    b65365d2b1e6 batman-adv: bla: only purge non-released claims
    00155f336a5e batman-adv: bla: prevent use-after-free when deleting claims
    09dc0d1a1222 batman-adv: stop caching unowned originator pointers in BAT IV
    03660dab86f9 batman-adv: stop tp_meter sessions during mesh teardown
    e1e2194cc725 batman-adv: reject new tp_meter sessions during teardown
    bf872db54f91 batman-adv: fix integer overflow on buff_pos
    c9dadb31f360 sctp: revalidate list cursor after sctp_sendmsg_to_asoc() in SCTP_SENDALL
    cd39452498e2 arm64: dts: ti: k3-am62a7-sk: Fix pin name in comment from M19 to N22
    3eb7d0e2d4a0 arm64: dts: qcom: lemans: Correct QUP interrupt numbers
    f8f546883e87 drm/amdgpu/pm: align Hawaii mclk workaround with radeon
    6fed6e9f1062 drm/amdgpu/pm: add missing revision check for CI
    0b91ea46bb68 drm/amdgpu/sdma4: replace BUG_ON with WARN_ON in fence emission
    6fbd52d210c1 drm/amdkfd: Make all TLB-flushes heavy-weight
    46bc180e6ede drm/panel: boe-tv101wum-nl6: restore MODE_LPM after sending disable cmds
    73af14be7645 drm/bridge: tda998x: Use __be32 for audio port OF property pointer
    71614ab2a683 drm/amdgpu/gfx9: drop unnecessary 64-bit fence flag check in KIQ
    f6dbec5bee72 drm/panel: himax-hx83102: restore MODE_LPM after sending disable cmds
    ed21d6e4ce03 drm/exynos: remove bridge when component_add fails
    b17175d0a375 drm/amdgpu: zero-initialize GART table on allocation
    264ee64cf867 drm/radeon: add missing revision check for CI
    672464dd5323 drm: Set old handle to NULL before prime swap in change_handle
    87f9b1528e1f drm/xe/uapi: Reject coh_none PAT index for CPU cached memory in madvise
    fa449b88706e drm/xe/bo: Fix bo leak on unaligned size validation in xe_bo_init_locked()
    0afa8b1ef582 drm/xe: Fix dma-buf attachment leak in xe_gem_prime_import()
    cd38e1503e67 drm/xe/bo: Fix bo leak on GGTT flag validation in xe_bo_init_locked()
    f9ad21b90162 drm/xe: Fix bo leak in xe_dma_buf_init_obj() on allocation failure
    2b5ba326f9d0 drm/udl: Increase GET_URB_TIMEOUT
    db9530a9873a drm/amdkfd: validate SVM ioctl nattr against buffer size
    a7735b491a2d drm/appletbdrm: Use kvzalloc for big allocations
    1a17ea9861e8 drm/gem: Fix inconsistent plane dimension calculation in drm_gem_fb_init_with_funcs()
    158def957199 drm/amd/display: Change dither policy for 10 bpc output back to dithering
    638e48ee39d0 drm/amdgpu/vcn3: Prevent OOB reads when parsing dec msg
    63b51e8a9d54 drm/amdgpu/vcn4: Prevent OOB reads when parsing dec msg
    b3d1a0a45c4a drm/amdgpu/vce: Prevent partial address patches
    a6d5563ba1f0 drm/amdgpu/vcn4: Prevent OOB reads when parsing IB
    fec8b11b55e5 drm/amdgpu: Add bounds checking to ib_{get,set}_value
    44d5a450c04d drm/amdkfd: Add upper bound check for num_of_nodes
    de137adccf7a drm/amd/pm: fix incorrect FeatureCtrlMask setting on smu v14.0.x
    f34eda3ff33d drm/amdgpu: gate VM CPU HDP flush on reset lock
    2795d325bb5c drm/amdgpu: Use SMUIO 15.0.0 offsets for TSC upper and lower count.
    77d0b5d11387 drm/amdkfd: Clear VRAM on allocation to prevent stale data exposure
    48fb2213e2c2 drm/i915/psr: Init variable to avoid early exit from et alignment loop
    132b8d51f0ff drm/msm: always recover the gpu
    c5b5a0e418b1 drm/imx: parallel-display: Prefer bus format set via legacy "interface-pix-fmt" DT property
    c57c861956b8 drm/msm/gem: fix error handling in msm_ioctl_gem_info_get_metadata()
    e9ae6590405d spi: cadence: fix clock imbalance on probe failure
    6ac380a0071d spi: cadence: fix unclocked access on unbind
    59701f07b19e spi: cadence: fix controller deregistration
    6c3e413919a1 spi: mpc52xx: fix use-after-free on unbind
    28f28a0f4e32 spi: mpc52xx: fix controller deregistration
    336d9ad7560b spi: mpc52xx: fix use-after-free on registration failure
    07dc76d31be4 spi: orion: fix clock imbalance on registration failure
    b809b8d2a114 spi: orion: fix runtime pm leak on unbind
    ec7a4cff8355 spi: orion: fix controller deregistration
    5c03d52ee6ce spi: mxic: fix controller deregistration
    2a2973cb3682 spi: imx: fix runtime pm leak on probe deferral
    6a405d594207 spi: mpfs: fix controller deregistration
    b2bdbe293012 spi: img-spfi: fix controller deregistration
    4b0fe572a8ea spi: slave-mt27xx: fix controller deregistration
    0df72db5a13c spi: sh-msiof: fix controller deregistration
    aee76c1dd189 spi: rspi: fix controller deregistration
    229cc70e4e90 spi: sprd: fix controller deregistration
    cdbf6baefff0 spi: pic32-sqi: fix controller deregistration
    82a95eca235b spi: cavium-thunderx: fix controller deregistration
    e84a84209b3f spi: npcm-pspi: fix controller deregistration
    ee2100d08094 spi: coldfire-qspi: fix controller deregistration
    047f939c602c spi: bcmbca-hsspi: fix controller deregistration
    ca3195c7b883 spi: fsl: fix controller deregistration
    d78c5ca1563c spi: sh-hspi: fix controller deregistration
    4422fc2411cb spi: ch341: fix devres lifetime
    af4f58c18c4c spi: pl022: fix controller deregistration
    cc8a904cbe6d spi: mtk-nor: fix controller deregistration
    894d761a3a85 spi: pic32: fix controller deregistration
    4ed7de898bbb spi: omap2-mcspi: fix controller deregistration
    09ceedcebc77 spi: fsl-espi: fix controller deregistration
    b99939bccae9 spi: s3c64xx: fix controller deregistration
    c74ba7340010 spi: dln2: fix controller deregistration
    724520793a2e spi: mt65xx: fix controller deregistration
    cc525debdfc8 spi: mxs: fix controller deregistration
    22ee38cbf536 media: qcom: camss: Add missing clocks for VFE lite on sa8775p
    696ac7c49c27 media: iris: Fix dma_free_attrs() size in iris_hfi_queues_init()
    095c51bc86d3 media: venus: fix QCOM_MDT_LOADER dependency
    e56a25247860 media: qcom: iris: increase H265D_MAX_SLICE to fix H.265 decoding on SC7280
    9d6217429cd4 media: qcom: camss: Fix csid IRQ offset for sa8775p
    8744fd0835dd media: qcom: camss: Fix csid clock configuration for sa8775p
    dd24998a4a40 media: iris: Fix use-after-free in iris_release_internal_buffers()
    1920b4602ec9 media: iris: fix QCOM_MDT_LOADER dependency
    d172bb82f70c media: omap3isp: drop the use count of v4l2 pipeline
    cedfde9f45b1 media: i2c: ov08d10: fix runtime PM handling in probe
    d9e678e8c633 media: i2c: ov08d10: fix image vertical start setting
    ea91dee38b4e media: staging: imx: request mbus_config in csi_start
    731d7ab8dfa2 media: i2c: imx412: Assert reset GPIO during probe
    34fe9c3c594e media: dib8000: avoid division by 0 in dib8000_set_dds()
    def939175ab8 media: pci: zoran: fix potential memory leak in zoran_probe()
    84d781069294 arm64: dts: broadcom: bcm2712-d-rpi-5-b: update uart10 interrupt
    65d7b2aecdfe arm64: dts: broadcom: bcm2712-d-rpi-5-b: add fixes for pinctrl/pinctrl_aon
    5167575b79e2 vsock/virtio: fix MSG_PEEK ignoring skb offset when calculating bytes to copy
    75c38af4d919 platform/x86: hp-wmi: Ignore backlight and FnLock events
    45890a035e2b spi: aspeed-smc: fix controller deregistration
    07938829cc11 spi: amlogic-spisg: fix controller deregistration
    6047dc542fa4 media: saa7164: add ioremap return checks and cleanups
    d6f56e66e8f4 spi: at91-usart: fix controller deregistration
    5d707cf9c138 spi: qup: fix controller deregistration
    4eccd83f228f spi: meson-spicc: fix controller deregistration
    6ca3eaa82812 spi: lantiq-ssc: fix controller deregistration
    184dcecc9521 regulator: bd9571mwv: fix OF node reference imbalance
    037bcca27835 regulator: s2dos05: fix OF node reference imbalance
    890a8bcef309 regulator: act8945a: fix OF node reference imbalance
    41ef27dcaa12 media: i2c: imx283: Fix hang when going from large to small resolution
    f43e30646fc9 media: intel/ipu6: fix error pointer dereference
    21fade52ab9f media: videobuf2: Set vma_flags in vb2_dma_sg_mmap
    dd681c102b4b regulator: rk808: fix OF node reference imbalance
    e7374c142169 regulator: bq257xx: fix OF node reference imbalance
    6c5d4c819d92 media: i2c: imx283: Enter full standby when stopping streaming
    ecd0c501bd63 media: rc: streamzap: Error handling in probe
    63a960b39de9 media: rc: xbox_remote: heed DMA restrictions
    a8ada5b76115 regulator: max77650: fix OF node reference imbalance
    8993d307cf2c spi: st-ssc4: fix controller deregistration
    2d51cfca8482 regulator: mt6357: fix OF node reference imbalance
    c7848b67ef10 staging: media: atomisp: Disallow all private IOCTLs
    af2dc8b8460c arm64: dts: lx2160a-cex7/lx2162a-sr-som: fix usd-cd & gpio pinmux
    72972aba49df spi: atmel: fix controller deregistration
    c66a6f226a5f spi: bcm63xx: fix controller deregistration
    7fbb3b4bef02 drm/gpusvm: Force unmapping on error in drm_gpusvm_get_pages
    ea28b33e1b15 media: chips-media: wave5: add missing spinlock protection for handle_dynamic_resolution_change()
    d71fc6874fce media: chips-media: wave5: add missing spinlock protection for send_eos_event()
    b40ec65e0926 media: chips-media: wave5: fix a potential memory leak in wave5_vdi_init()
    6261d5fd172b media: dt-bindings: rockchip,vdec: Mark reg-names required for RK35{76,88}
    361e66fb431d media: dt-bindings: rockchip,vdec: Add alternative reg-names order for RK35{76,88}
    791598484fd5 media: i2c: ov8856: free control handler on error in ov8856_init_controls()
    b6e5c80cc2b2 media: renesas: vin: Fix RAW8 (again)
    bfb2081ba00a media: renesas: vsp1: Fix NULL pointer deref on module unload
    4d6e8496486d media: nxp: imx8-isi: Reduce minimum queued buffers from 2 to 0
    0ac9ec121d89 drm/msm/hdmi: Fix wrong CTRL1 register used in writing info frames
    06d99af8db11 media: uvcvideo: Enable VB2_DMABUF for metadata stream
    80d8cc29d3b6 HID: pidff: Fix integer overflow in pidff_rescale
    5c0830323689 HID: appletb-kbd: run inactivity autodim from workqueues
    59a79938ca55 HID: appletb-kbd: fix UAF in inactivity-timer cleanup path
    7812694752a5 HID: playstation: Clamp num_touch_reports
    6c1de6e6aa8c Linux 6.18.31
    2a93a4fac7b6 ptrace: slightly saner 'get_dumpable()' logic
    52dc660c85db Linux 6.18.30
    1aa60fea7f63 ksmbd: validate inherited ACE SID length
    28f5ed477eef x86/CPU/AMD: Prevent improper isolation of shared resources in Zen2's op cache
    a0e560d15ff1 rust: pin-init: fix incorrect accessor reference lifetime
    4af2e62cbcda net: stmmac: Prevent NULL deref when RX memory exhausted
    9d1774b33e10 net: stmmac: rename STMMAC_GET_ENTRY() -> STMMAC_NEXT_ENTRY()
    5cffe3c13689 crypto: caam - guard HMAC key hex dumps in hash_digest_key
    ef63ef44e86c printk: add print_hex_dump_devel()
    c9ce18e6bb2c erofs: fix unsigned underflow in z_erofs_lz4_handle_overlap()
    24da4cc6bf27 erofs: tidy up z_erofs_lz4_handle_overlap()
    d309d3308de6 hfsplus: fix held lock freed on hfsplus_fill_super()
    a42090445096 hfsplus: fix uninit-value by validating catalog record size
    23b814ec96a8 firmware: exynos-acpm: Drop fake 'const' on handle pointer
    bbcef208c5da mm, swap: speed up hibernation allocation and writeout
    4d7b42941c9b crypto: qat - fix firmware loading failure for GEN6 devices
    fb6616806f3d crypto: qat - fix indentation of macros in qat_hal.c
    afece4e3f2cd mmc: core: Optimize time for secure erase/trim for some Kingston eMMCs
    f597ab044bea mmc: core: Add quirk for incorrect manufacturing date
    ebad72308271 mmc: core: Adjust MDT beyond 2025
    b0f4711b426a octeon_ep_vf: add NULL check for napi_build_skb()
    1869da3efe70 hwmon: (powerz) Avoid cacheline sharing for DMA buffer
    609936df7ce1 dma-mapping: add __dma_from_device_group_begin()/end()
    25c2b77bc463 fbdev: defio: Disconnect deferred I/O from the lifetime of struct fb_info
    1de2db19a602 mm/damon/core: disallow non-power of two min_region_sz on damon_start()
    d18099f19e53 bpf: Fix use-after-free in arena_vm_close on fork
    737adda64f51 io_uring/tw: serialize ctx->retry_llist with ->uring_lock
    2563d7880c4d io_uring/kbuf: support min length left for incremental buffers
    23900db3787a LoongArch: Use per-root-bridge PCIH flag to skip mem resource fixup
    aaaf41aee5ac LoongArch: KVM: Use kvm_set_pte() in kvm_flush_pte()
    3d44ed6dd219 LoongArch: KVM: Move unconditional delay into timer clear scenery
    b715ceb72ed9 LoongArch: KVM: Fix HW timer interrupt lost when inject interrupt by software
    1c32824fbdec LoongArch: KVM: Fix "unreliable stack" for kvm_exc_entry
    e50d8573534f LoongArch: KVM: Cap KVM_CAP_NR_VCPUS by KVM_CAP_MAX_VCPUS
    9e1aed63a555 LoongArch: Fix potential ADE in loongson_gpu_fixup_dma_hang()
    7d3c27b54253 KVM: arm64: Fix pin leak and publication ordering in __pkvm_init_vcpu()
    931c9c777e35 KVM: arm64: Fix FEAT_Debugv8p9 to check DebugVer, not PMUVer
    7e9f5f62f8d1 KVM: arm64: Fix FEAT_SPE_FnE to use PMSIDR_EL1.FnE, not PMSVer
    81e7907fe542 KVM: arm64: Fix initialisation order in __pkvm_init_finalise()
    7b99369b2c7a KVM: arm64: vgic: Fix IIDR revision field extracted from wrong value
    837db0777792 KVM: arm64: Wake-up from WFI when iqrchip is in userspace
    8be551f538dc f2fs: fix fsck inconsistency caused by FGGC of node block
    03806ec9c4cd f2fs: fix inline data not being written to disk in writeback path
    4bdc05b2032b f2fs: refactor f2fs_move_node_folio function
    8d269aae6f73 f2fs: fix uninitialized kobject put in f2fs_init_sysfs()
    b0e4395870eb f2fs: fix node_cnt race between extent node destroy and writeback
    d438a9fb20d0 f2fs: fix incorrect multidevice info in trace_f2fs_map_blocks()
    f37012cc7c27 f2fs: fix incorrect file address mapping when inline inode is unwritten
    bedb710b63ae f2fs: fix fsck inconsistency caused by incorrect nat_entry flag usage
    63c2d2ad40d1 f2fs: fix fiemap boundary handling when read extent cache is incomplete
    060029ed542e f2fs: add READ_ONCE() for i_blocks in f2fs_update_inode()
    464747eae483 mptcp: pm: ADD_ADDR rtx: return early if no retrans
    107e956ce544 mptcp: pm: ADD_ADDR rtx: resched blocked ADD_ADDR quicker
    b74ad2019865 mptcp: pm: ADD_ADDR rtx: free sk if last
    acd3d3562315 mptcp: pm: ADD_ADDR rtx: always decrease sk refcount
    2ad56e434199 mptcp: pm: ADD_ADDR rtx: fix potential data-race
    cffc6fc446a2 mptcp: pm: ADD_ADDR rtx: allow ID 0
    07c2f3c29a8a mptcp: pm: kernel: correctly retransmit ADD_ADDR ID 0
    6f5ba49da8b1 mptcp: pm: prio: skip closed subflows
    8a005fe451c7 mptcp: fix scheduling with atomic in timestamp sockopt
    e6ad28d9d5bf mptcp: fix rx timestamp corruption on fastopen
    e083d1d8bbec mptcp: sockopt: increase seq in mptcp_setsockopt_all_sf
    c7362eef3b70 mptcp: sockopt: set timestamp flags on subflow socket, not msk
    e74f33c8a2c7 mptcp: use MPTCP_RST_EMPTCP for ACK HMAC validation failure
    fa26c8deed61 mptcp: use MPJoinSynAckHMacFailure for SynAck HMAC failure
    4f269fc3c73a mptcp: fastclose msk when linger time is 0
    2146145d6dd6 selftests: mptcp: pm: restrict 'unknown' check to pm_nl_ctl
    2efd6bd0e9b1 selftests: mptcp: check output: catch cmd errors
    a8f4a82e5629 sched_ext: idle: Recheck prev_cpu after narrowing allowed mask
    0c63333ff97b RDMA/vmw_pvrdma: Fix double free on pvrdma_alloc_ucontext() error path
    006a3a5f7534 RDMA/rxe: Reject unknown opcodes before ICRC processing
    105bf79a23b8 RDMA/rxe: Reject non-8-byte ATOMIC_WRITE payloads
    8832626a4834 RDMA/ocrdma: Don't NULL deref uctx on errors in ocrdma_copy_pd_uresp()
    b087913ae882 RDMA/mlx5: Fix error path fall-through in mlx5_ib_dev_res_srq_init()
    e01b8c9286c4 RDMA/mlx4: Fix resource leak on error in mlx4_ib_create_srq()
    1e2a44875b6a RDMA/mlx4: Fix mis-use of RCU in mlx4_srq_event()
    012796f9541f RDMA/mana: Validate rx_hash_key_len
    9ef65af26b2a RDMA/mana: Remove user triggerable WARN_ON() in mana_ib_create_qp_rss()
    bb9cb36eaefa RDMA/mana: Fix mana_destroy_wq_obj() cleanup in mana_ib_create_qp_rss()
    ab64c63b460b RDMA/mana: Fix error unwind in mana_ib_create_qp_rss()
    d886bcdcd00d RDMA/ionic: Fix typo in format string
    61df14f306f1 RDMA/ionic: bound node_desc sysfs read with %.64s
    44905248dd87 perf/x86/intel: Always reprogram ACR events to prevent stale masks
    2546fb8c9acc powerpc/xive: fix kmemleak caused by incorrect chip_data lookup
    4b6886ca8114 power: supply: max17042: avoid overflow when determining health
    1bf238ead7cc PCI/ASPM: Fix pci_clear_and_set_config_dword() usage
    24582f5044bf PCI/AER: Stop ruling out unbound devices as error source
    70a5d28dd273 PCI/AER: Clear only error bits in PCIe Device Status
    185d51ec3a54 PCI: Update saved_config_space upon resource assignment
    eafd6f5372d2 mm/damon/sysfs-schemes: protect memcg_path kfree() with damon_sysfs_lock
    cb825c22c002 mm/damon/stat: detect and use fresh enabled value
    bb1703949dca KVM: x86: Do IRR scan in __kvm_apic_update_irr even if PIR is empty
    d6f4e217d663 KVM: x86: check for nEPT/nNPT in slow flush hypercalls
    c688f3ed73d3 smb: client: validate dacloffset before building DACL pointers
    be1ef9512a3f smb: client: use kzalloc to zero-initialize security descriptor buffer
    b8c8a704f0bc smb/client: fix out-of-bounds read in symlink_data()
    512d33bc8ea4 smb/client: fix out-of-bounds read in smb2_compound_op()
    45dcc815fc55 scsi: mpt3sas: Limit NVMe request size to 2 MiB
    cf90a96b7a2d s390/debug: Reject zero-length input before trimming a newline
    e3eee7ea5ec5 s390/debug: Reject zero-length input in debug_input_flush_fn()
    bd62c0f61bc7 riscv: kvm: fix vector context allocation leak
    1912f7879850 RDMA/hns: Fix unlocked call to hns_roce_qp_remove()
    ac4bf66686bb psp: strip variable-length PSP header in psp_dev_rcv()
    51a7dd9cbae9 pmdomain: core: Fix detach procedure for virtual devices in genpd
    3df75fff46b1 openvswitch: vport: fix self-deadlock on release of tunnel ports
    781f47d64143 nvmet: avoid recursive nvmet-wq flush in nvmet_ctrl_free
    67e1aaf93b49 nvmet-tcp: fix race between ICReq handling and queue teardown
    c77c82935c0a nvme-apple: drop invalid put of admin queue reference count
    913d556e4bd1 md/raid10: fix divide-by-zero in setup_geo() with zero far_copies
    b7df9fbd4869 libceph: Fix slab-out-of-bounds access in auth message processing
    7cdf18608302 lib/scatterlist: fix temp buffer in extract_user_to_sg()
    8fbba6829057 lib/scatterlist: fix length calculations in extract_kvec_to_sg
    8637dfb4c1d8 lib/crypto: mpi: Fix integer underflow in mpi_read_raw_from_sgl()
    cbb032fc7432 iommu/arm-smmu-v3: Add a missing dma_wmb() for hitless STE update
    3ea9ce757bd3 iommu/vt-d: Block PASID attachment to nested domain with dirty tracking
    0d96652adc8f iommufd: Fix return value of iommufd_fault_fops_write()
    afbafeddf23d isofs: validate block number from NFS file handle in isofs_export_iget
    e69da8eeab74 isofs: validate Rock Ridge CE continuation extent against volume size
    1919acc5876c dm-verity-fec: correctly reject too-small hash devices
    9a484c8149b2 dm-verity-fec: correctly reject too-small FEC devices
    52b109f1b875 eventfs: Hold eventfs_mutex and SRCU when remount walks events
    5af6a879e915 dm: fix a buffer overflow in ioctl processing
    cb7c6a89e5d8 dm: don't report warning when doing deferred remove
    85311a585a26 dm-thin: fix metadata refcount underflow
    fb388eb58c1b btrfs: fix missing last_unlink_trans update when removing a directory
    9a060970fd7b btrfs: fix double free in create_space_info() error path
    48102d889090 ASoC: qcom: q6apm: remove child devices when apm is removed
    7cab9f2ad51c ASoC: qcom: q6apm-lpass-dai: Fix multiple graph opens
    6d43355a5b9e ASoC: qcom: q6apm-dai: reset queue ptr on trigger stop
    4e550b59315d ASoC: Intel: bytcr_wm5102: Fix MCLK leak on platform_clock_control error
    846fcce3a6bb ASoC: fsl_easrc: fix comment typo
    3a5287c47b13 ASoC: ES8389: convert to devm_clk_get_optional() to get clock
    65aabf889668 ASoC: amd: yc: Add HP OMEN Gaming Laptop 16-ap0xxx product line in quirk table
    54a44bbead39 cpuidle: powerpc: avoid double clear when breaking snooze
    a0780aeea166 clk: microchip: mpfs-ccc: fix out of bounds access during output registration
    9eccdb76ad5e clk: imx: imx8-acm: fix flags for acm clocks
    b528c7ffdc3e tracing/probes: Limit size of event probe to 3K
    d50ef3553acb spi: topcliff-pch: fix use-after-free on unbind
    b3bdc7a8dd44 spi: topcliff-pch: fix controller deregistration
    4b16c06da763 thermal/drivers/sprd: Fix raw temperature clamping in sprd_thm_rawdata_to_temp
    3933dfb360e0 thermal/drivers/sprd: Fix temperature clamping in sprd_thm_temp_to_rawdata
    eb295d2b6e70 thermal: core: Free thermal zone ID later during removal
    1873eb81c65d udf: reject descriptors with oversized CRC length
    b1040af58771 tracefs: Fix default permissions not being applied on initial mount
    998f43196d73 spi: microchip-core-qspi: control built-in cs manually
    ec9d0ddbde60 spi: microchip-core-qspi: don't attempt to transmit during emulated read-only dual/quad operations
    d945d71bbad5 spi: microchip-core-qspi: fix controller deregistration
    121d1f253aed ice: fix double free in ice_sf_eth_activate() error path
    c1f261863e65 ibmveth: Disable GSO for packets with small MSS
    4f82f046f913 hv_sock: Return -EIO for malformed/short packets
    317e434e26af hv_sock: Report EOF instead of -EIO for FIN
    d1b9424f7393 hv_sock: fix ARM64 support
    cb028f72fb3b hv: Select CONFIG_SYSFB only for CONFIG_HYPERV_VMBUS
    5b958822126d gpio: of: clear OF_POPULATED on hog nodes in remove path
    bbf63275d4a5 extcon: ptn5150: handle pending IRQ events during system resume
    196efa8b254b cifs: change_conf needs to be called for session setup
    064f2e49199c cifs: abort open_cached_dir if we don't request leases
    281a0014f46f block: only read from sqe on initial invocation of blkdev_uring_cmd()
    f17d52107532 block: add pgmap check to biovec_phys_mergeable
    cb27e43c0511 pmdomain: mediatek: fix use-after-free in scpsys_get_bus_protection_legacy()
    8aacf87718b9 arm64/fpsimd: ptrace: zero target's fpsimd_state, not the tracer's
    c34c41446acf af_unix: Reject SIOCATMARK on non-stream sockets
    aa4d6fee0449 hwmon: (corsair-psu) Close HID device on probe errors
    370d4deba194 clk: rk808: fix OF node reference imbalance
    13a0f0204d54 hwmon: (ltc2992) Fix u32 overflow in power read path
    357ef14bfde2 hwmon: (ltc2992) Clamp threshold writes to hardware range
    22b365ba1af3 x86/efi: Fix graceful fault handling after FPU softirq changes
    c9b620425fd0 parisc: Fix IRQ leak in LASI driver
    23ae72e8c2f1 platform/chrome: cros_ec_typec: Init mutex in Thunderbolt registration
    2b56d7903ab8 net: wwan: t7xx: validate port_count against message length in t7xx_port_enum_msg_handler
    14ef6fd18db2 net/rds: handle zerocopy send cleanup before the message is queued
    3d47d62c1348 netpoll: pass buffer size to egress_dev() to avoid MAC truncation
    1bca036fe360 net: libwx: use request_irq for VF misc interrupt
    e70cfb40c3a9 ip6_gre: Use cached t->net in ip6erspan_changelink().
    33c5bb50b9c4 net: libwx: fix VF illegal register access
    62951b49754a pseries/papr-hvpipe: Fix the usage of copy_to_user()
    2b1335edaac5 pseries/papr-hvpipe: Fix & simplify error handling in papr_hvpipe_init()
    0479b6e9f999 pseries/papr-hvpipe: Prevent kernel stack memory leak to userspace
    0ff2b713f406 sound: ua101: fix division by zero at probe
    aab56b95bee3 perf/x86/intel: Improve validation and configuration of ACR masks
    4bf22a0afb27 mptcp: pm: ADD_ADDR rtx: skip inactive subflows
    fbe0e6197225 net: rtnetlink: zero ifla_vf_broadcast to avoid stack infoleak in rtnl_fill_vfinfo
    52070a91956f LoongArch: Fix SYM_SIGFUNC_START definition for 32BIT
    8f75597dfc67 mm/hugetlb_cma: round up per_node before logging it
    10c252577ccd arm64: signal: Preserve POR_EL0 if poe_context is missing
    34bdcfb496b2 mtd: spi-nor: debugfs: fix out-of-bounds read in spi_nor_params_show()
    83b131a214f1 KVM: arm64: Fix kvm_vcpu_initialized() macro parameter
    7baa02b0ae9d fanotify: fix false positive on permission events
    d71240d2609b staging: vme_user: fix root device leak on init failure
    1b66f16a571a spi: s3c64xx: fix NULL-deref on driver unbind
    4f0dd529990d spi: zynqmp-gqspi: fix controller deregistration
    93f83b3a50ef spi: sun6i: fix controller deregistration
    9df7d2530412 spi: ti-qspi: fix controller deregistration
    9aea3d4f23ca spi: sun4i: fix controller deregistration
    40db1bd1ffc6 spi: syncuacer: fix controller deregistration
    ca488ac3b083 rust: allow `clippy::collapsible_if` globally
    16a7e845c3a0 rust: allow `clippy::collapsible_match` globally
    4ea3b2e469fc rust: drm: gem: clean up GEM state in init failure case
    32bd343803d4 Bluetooth: L2CAP: Fix null-ptr-deref in l2cap_sock_get_sndtimeo_cb()
    1810e42ff671 Bluetooth: L2CAP: Fix null-ptr-deref in l2cap_sock_state_change_cb()
    741e6024e315 Bluetooth: L2CAP: Fix null-ptr-deref in l2cap_sock_new_connection_cb()
    77981a507aa0 Bluetooth: hci_event: Fix OOB read and infinite loop in hci_le_create_big_complete_evt
    624fb79dadc1 Bluetooth: btmtk: validate WMT event SKB length before struct access
    3485c7236c59 Bluetooth: virtio_bt: validate rx pkt_type header length
    b40cdd1b1370 Bluetooth: virtio_bt: clamp rx length before skb_put
    53ad20efd20a LoongArch: KVM: Fix missing EMULATE_FAIL in kvm_emu_mmio_read()
    05b63fbddfca selinux: prune /sys/fs/selinux/user
    058a5e705424 selinux: prune /sys/fs/selinux/disable
    52a5d9608da5 selinux: prune /sys/fs/selinux/checkreqprot
    e5c12a115ed5 selinux: shrink critical section in sel_write_load()
    71e68e863a7e selinux: don't reserve xattr slot when we won't fill it
    d350fef4bc24 selinux: use sk blob accessor in socket permission helpers
    e3e722ea88e0 selinux: fix avdcache auditing
    7db99a09b3bc xfrm: ah: account for ESN high bits in async callbacks
    9d5047782f9b ipv6: xfrm6: release dst on error in xfrm6_rcv_encap()
    4980162de555 xfrm: defensively unhash xfrm_state lists in __xfrm_state_delete
    0fe995ac77a8 xfrm: provide message size for XFRM_MSG_MAPPING
    c73fdf2e911d x86/efi: Restore IRQ state in EFI page fault handler
    ef49059fce11 powerpc/kdump: fix KASAN sanitization flag for core_$(BITS).o
    9ef79d48f137 ALSA: seq: Fix UMP group 16 filtering
    878c19dd4fbe ALSA: core: Serialize deferred fasync state checks
    d761428f6cc7 ALSA: firewire-tascam: Do not drop unread control events
    d829caccb426 ALSA: hda/realtek: Fix speaker silence after S3 resume on Xiaomi Mi Laptop Pro 15
    ac3e9b55b7da ALSA: pcm: oss: Fix data race at accessing runtime.oss.trigger
    f8ad9ef77156 ALSA: hda: cs35l56: Propagate ASP TX source control errors
    0c1c186f8f48 usb: typec: tcpm: fix debug accessory mode detection for sink ports
    2a71e01b2cf9 usb: ulpi: fix memory leak on ulpi_register() error paths
    6ef872d157f4 USB: serial: option: add Telit Cinterion LE910Cx compositions
    52a0cf7cde26 USB: omap_udc: DMA: Don't enable burst 4 mode
    411f2f7274e3 ALSA: usb-audio: Fix UAC3 cluster descriptor size check
    be09b47ed867 ALSA: usb-audio: Avoid potential endless loop in convert_chmap_v3()
    00e095dc5787 ALSA: usb-audio: midi2: Restart output URBs on resume
    762a6ccf391d usb: usblp: fix uninitialized heap leak via LPGETSTATUS ioctl
    8247f52d8221 usb: usblp: fix heap leak in IEEE 1284 device ID via short response
    658d2e46c2e9 wifi: brcmfmac: Fix potential use-after-free issue when stopping watchdog task
    d7029879bafd wifi: b43: enforce bounds check on firmware key index in b43_rx()
    9e28654f79f4 wifi: mac80211: remove station if connection prep fails
    e9f1081bc775 wifi: ath5k: do not access array OOB
    7577a4b8a10f wifi: mac80211: use safe list iteration in radar detect work
    4f9a4ae8d2c1 wifi: rsi: fix kthread lifetime race between self-exit and external-stop
    e131562d6f2b wifi: mac80211: drop stray 'static' from fast-RX rx_result
    9d1bc1558029 wifi: b43legacy: enforce bounds check on firmware key index in RX path
    6d55948a62ab wifi: mt76: mt7921: fix ROC abort flow interruption in mt7921_roc_work
    0aa63d33742b wifi: mt76: mt7921: fix a potential clc buffer length underflow
    6fc7c8b414ce wifi: mt76: mt7925: fix incorrect length field in txpower command
    5860ab3ddeaa wifi: mt76: mt7925: fix AMPDU state handling in mt7925_tx_check_aggr
    6f49f94f3b11 exit: prevent preemption of oopsing TASK_DEAD task
    8d09618840b9 net/sched: sch_red: Replace direct dequeue call with peek and qdisc_dequeue_peeked
    33fe95663d10 net: stmmac: Disable EEE RX clock stop when VLAN is enabled
    53e821fd9bae KVM: SVM: check validity of VMCB controls when returning from SMM
    edd446ee7cd3 net: af_key: zero aligned sockaddr tail in PF_KEY exports
    9dea2aeabc86 smb: client/smbdirect: fix MR registration for coalesced SG lists
    ff9e4d5e9bba mptcp: sync the msk->sndbuf at accept() time
    0d00b9015069 flow_dissector: do not dissect PPPoE PFC frames
    6200f41d6fcf ceph: fix num_ops off-by-one when crypto allocation fails
    738ec97b1855 KVM: x86: Fix shadow paging use-after-free due to unexpected GFN
    ccee9833e33b ksmbd: rewrite stop_sessions() with restartable iteration
    21a316f27095 spi: rockchip: fix controller deregistration
    8c4339dbab49 wifi: mt76: mt7925: fix incorrect TLV length in CLC command
    0f0c0c1397a4 ASoC: SOF: Don't allow pointer operations on unconfigured streams
    9a2d03d324b2 iommufd: Fix a race with concurrent allocation and unmap
    2c5b8eeea006 tracepoint: balance regfunc() on func_add() failure in tracepoint_add_func()
    540fa6a86b91 ACPI: video: force native backlight on HP OMEN 16 (8A44)
    70446f52251f ACPI: CPPC: Fix related_cpus inconsistency during CPU hotplug
    42f83350394a ACPI: video: Add backlight=native quirk for Dell OptiPlex 7770 AIO
    7f0a53c2b94c ACPI: scan: Use acpi_dev_put() in object add error paths
    da9b065cedfd fbdev: udlfb: add vm_ops to dlfb_ops_mmap to prevent use-after-free
    bc13fce9eeec ipmi:si: Return state to normal if message allocation fails
    42432b579a59 ipmi: Check event message buffer response for bad data
    3d37d2165df9 ipmi: Add limits to event and receive message requests
    00d91bfdce50 scsi: target: configfs: Bound snprintf() return in tg_pt_gp_members_show()
    d31a849ff501 Linux 6.18.29
    3eae0f4f9f72 rxrpc: Also unshare DATA/RESPONSE packets when paged frags are present

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
index 2debe53..c0ca3ae 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.18.bbappend
@@ -8,4 +8,4 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 
 KBRANCH:genericarm64 ?= "v6.18/standard/genericarm64"
-SRCREV_machine:genericarm64 ?= "5cd75b0b5da06045acdd0c66e50656ab82cb880f"
+SRCREV_machine:genericarm64 ?= "3acde948b7470a96df7e730a2119ffaee380d6b1"
-- 
2.43.0


