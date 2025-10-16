Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC73CCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 03:08:54 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.4645.1760584128245429187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 20:08:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YTR3l7le;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-87c0ea50881so6025706d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 20:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760584127; x=1761188927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jL/xgJsxH6ygb1wbVblOVtyGpsrSNaquwT4V+epqwWA=;
        b=YTR3l7ler537E8kshwkJ4Ej5xNaVHJEuZtE4Tz03ZdYiZ64LPebvCZ0vWuEIPbiQJc
         BS4kegGNbVWEVWgdOPfOoBDNiYnBLL9PtBU/qsQbfmuANOkQ2VJo0hsbShMFJA0VWHK4
         rDBG2hqk+o7Htj40FMh+3rVIuZmP5stA7FtETqESxxMezQmljS8kvmJBoe8LGlCHRSXX
         PZ3IFYQqL1IV2K7l8pb6cesUjh7cMwUJN2D45cynGrvi0+LLlhgruOp1R2YyJXhKeZQs
         WnFMa1+bry88XrXukusTaAbeaIqbBJiYCcqnUKrXXFWhHFuXqpfoFtujUO02mQLMOGju
         fSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760584127; x=1761188927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jL/xgJsxH6ygb1wbVblOVtyGpsrSNaquwT4V+epqwWA=;
        b=YG3ufBXtgsK4r4wBkvTwQbLUfliNGgYlO2SjdivcbR4mjLQNwG/oAtWWD4oPkdlnq4
         epE8W/aGsnUVAl3w0VHqz45IuiSBYsWivCryaOlPOgF9mHGHISkTlfymCtKKmjvM+NyQ
         IgjJ8BMqzWE8T6ADA/TFslapxJnJhxnEC2dG+0fLSqcgOJMlK1PPbqUwplvaWtnWCf+v
         ohz9904Ct4/fc/qvkXWGGy72jSDTzKOFnTBRcHmLT6leaZk/et4eKu6EAzhUSapzGZK/
         WOslLkCpftsmc8CqRdJoCPW8woQJKLL9GOwfytjhSyRcem+YtQMkzQgLXUOiJ4dhB7vd
         K/qg==
X-Gm-Message-State: AOJu0YzA4vHOFEDBbMjXw8QUwGs4syqcC4iKHZWRHybkbquXIYEthMrq
	zgk8oYkeF3YKNFGQuS+YkiVGR1Bz3m3dauOioyqg+4M9sCNkAXxGWVeeMsbtBwrjBd8=
X-Gm-Gg: ASbGnct4kyVfMwRSWiZVsqDDZH5lmaGdweH81MH/qF9jFO7lkLQ2eWZ6IWYWYE/O/vk
	3d16ySlGAh0qypVfoja6+vF1vECa5hoj4fzSjrXkP3Ygn9EkH/RN2zl1WKG1akKQDsVYoqxhJrr
	TtfaeCYZrLvcv8oYLVfmprcsnRfvMBahkOVDH8EB/Jxg4vy4yTudZP7rkLLs4dCK0sMKrseReuE
	duACUy3UIitlgUdu+mrax2hbVV8d/iB7y9kG5j+vt+raGZOTY3OfHMqhC8st1PdlUU8Qgn1Nh1U
	cz7oDqC7w4Llc4acwKz9MR5JhCsdRre6ppnVZ+QSqeOJHRIg0srcrGA32ar+XCmmat3+2oba4Zy
	W4ZEumpVsZOSsrcQlR6aHd2YFr6rlfCH5TARKtNaZH1A0R64nWDOWkiwhhetVKX8kp0q3+FXCEj
	z81ag/uTYzCtVWQWfPf8+HHRo1ytUUq1McdKiOwx+L1uKbZMHYbOvx3GSBGYqVublSQaLAKU0Im
	YIUOA0WROe5O3c=
X-Google-Smtp-Source: AGHT+IGggJdfdjbuHLk/8hIeUUH9WFncI7rHC4edKu/MoBOJT5u4XVC/NzqqB2GSVAkcX5MSTIpVng==
X-Received: by 2002:ad4:5ec5:0:b0:796:5c30:b05e with SMTP id 6a1803df08f44-87b2eff1bc1mr497784286d6.54.1760584127045;
        Wed, 15 Oct 2025 20:08:47 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012a39d9sm30824986d6.44.2025.10.15.20.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 20:08:46 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/11] linux-yocto/6.16: update to v6.16.11
Date: Wed, 15 Oct 2025 23:08:34 -0400
Message-Id: <b55ac598f0e003a6d7f650d72b4de098e841a601.1760583881.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1760583881.git.bruce.ashfield@gmail.com>
References: <cover.1760583881.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 03:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224916

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.16 to the latest korg -stable release that comprises
the following commits:

    683320aeb0e83 Linux 6.16.11
    8f9c9fafc0e7a ASoC: qcom: audioreach: fix potential null pointer dereference
    1f053d82e59c7 media: stm32-csi: Fix dereference before NULL check
    c9e024e907caf media: iris: Fix memory leak by freeing untracked persist buffer
    888830b2cbc03 wifi: ath11k: fix NULL dereference in ath11k_qmi_m3_load()
    9cddad3b26dac mm: swap: check for stable address space before operating on the VMA
    15c0e136bd8cd media: uvcvideo: Mark invalid entities with id UVC_INVALID_ENTITY_ID
    d9f6ce99624a4 media: rc: fix races with imon_disconnect()
    9a00de20ed8ba media: tuner: xc5000: Fix use-after-free in xc5000_release
    f3f3f00bcabbd media: i2c: tc358743: Fix use-after-free bugs caused by orphan timer in probe
    3ffabc79388e6 media: b2c2: Fix use-after-free causing by irq_check_work in flexcop_pci_remove
    af600e7f5526d ALSA: usb-audio: fix race condition to UAF in snd_usbmidi_free
    4b29228694958 scsi: target: target_core_configfs: Add length check to avoid buffer overflow
    412450c2f9d16 gcc-plugins: Remove TODO_verify_il for GCC >= 16
    8faee580d63bc blk-mq: fix blk_mq_tags double free while nr_requests grown
    bcabc18865f36 Linux 6.16.10
    e4825368285e3 iommufd: Fix race during abort for file descriptors
    e7e5315212819 spi: cadence-qspi: defer runtime support on socfpga if reset bit is enabled
    b7ec8a2b094a3 spi: cadence-quadspi: Implement refcount to handle unbind during busy
    4109506b7eba2 sched_ext: idle: Handle migration-disabled tasks in BPF code
    1f2bffc8dd18b sched_ext: idle: Make local functions static in ext_idle.c
    2243b9b728b3c wifi: iwlwifi: pcie: fix byte count table for some devices
    b9ebc20920be3 wifi: iwlwifi: fix byte count table for old devices
    fc19489dfaf42 fbcon: Fix OOB access in font allocation
    c0c01f9aa08c8 fbcon: fix integer overflow in fbcon_do_set_font
    2aa2cea8f7716 mm/damon/sysfs: do not ignore callback's return value in damon_sysfs_damon_call()
    21ee79ce93812 mm/hugetlb: fix folio is still mapped when deleted
    7c78ae54e342d x86/Kconfig: Reenable PTDUMP on i386
    309b8857c50d0 x86/topology: Implement topology_is_core_online() to address SMT regression
    b64d23d1b9321 riscv: Use an atomic xchg in pudp_huge_get_and_clear()
    8df142e93098b netfs: fix reference leak
    5855792c6bb9a kmsan: fix out-of-bounds access to shadow memory
    61ae3a52075dc gpiolib: Extend software-node support to support secondary software-nodes
    a2cb8818a3d91 fs/proc/task_mmu: check p->vec_buf for NULL
    41782c44bb843 afs: Fix potential null pointer dereference in afs_put_server
    a63e7dcf6a552 vhost-net: flush batched before enabling notifications
    7de587f87f37e Revert "vhost/net: Defer TX queue re-enable until after sendmsg"
    238f33bb3f6fa pinctrl: airoha: fix wrong MDIO function bitmaks
    cda80b7937bb5 pinctrl: airoha: fix wrong PHY LED mux value for LED1 GPIO46
    3bf00f58a8075 drm/amd/display: Only restore backlight after amdgpu_dm_init or dm_resume
    40903aa97e193 drm/ast: Use msleep instead of mdelay for edid read
    5168f19d4d819 drm/xe: Don't copy pinned kernel bos twice on suspend
    408d90e817211 arm64: dts: marvell: cn9132-clearfog: fix multi-lane pci x2 and x4 ports
    eca259860a084 arm64: dts: marvell: cn9132-clearfog: disable eMMC high-speed modes
    a22ccb766ced5 arm64: dts: marvell: cn913x-solidrun: fix sata ports status
    d00bcd2d5414e ARM: dts: socfpga: sodia: Fix mdio bus probe and PHY address
    e57d19757aeb2 tracing: fprobe: Fix to remove recorded module addresses from filter
    cbb8c94f92d0c tracing: fgraph: Protect return handler from recursion loop
    b47c4e06687a5 tracing: dynevent: Add a missing lockdown check on dynevent
    fbe96bd25423e crypto: af_alg - Fix incorrect boolean values in af_alg_ctx
    6200d2e7ea6a6 i40e: improve VF MAC filters accounting
    168107437eac5 i40e: add mask to apply valid bits for itr_idx
    8b13df5aa877b i40e: add max boundary check for VF filters
    a991dc56d3e9a i40e: fix validation of VF state in get resources
    560e168341058 i40e: fix input validation logic for action_meta
    5c1f96123113e i40e: fix idx validation in config queues msg
    d4e3eaaa3cb3a i40e: fix idx validation in i40e_validate_queue_map
    afec12adab55d i40e: add validation for ring_len param
    1cf7258a9cf33 HID: asus: add support for missing PX series fn keys
    f76347f4ec435 HID: intel-thc-hid: intel-quickspi: Add WCL Device IDs
    930cb05a9e107 tracing/osnoise: Fix slab-out-of-bounds in _parse_integer_limit()
    908478fe58848 Revert "drm/xe/guc: Enable extended CAT error reporting"
    e35eeb3a8eaf8 Revert "drm/xe/guc: Set RCS/CCS yield policy"
    093615fc76063 smb: client: fix wrong index reference in smb2_compound_op()
    923638cea4c17 platform/x86: lg-laptop: Fix WMAB call in fan_mode_store()
    2858cae6896ea drm/panthor: Defer scheduler entitiy destruction to queue release
    f1635765cd0fd futex: Use correct exit on failure from futex_hash_allocate_default()
    c6adf475f375c drm/amd/display: remove output_tf_change flag
    9682dc123f8f1 drm/i915/ddi: Guard reg_val against a INVALID_TRANSCODER
    94c5669b1b172 drm/xe: Fix build with CONFIG_MODULES=n
    bacbadedbba73 drm/xe/vf: Don't expose sysfs attributes not applicable for VFs
    6021d412108f7 gpio: regmap: fix memory leak of gpio_regmap structure
    d824b2dbdcfe3 futex: Prevent use-after-free during requeue-PI
    0fc650fa475b5 drm/gma500: Fix null dereference in hdmi teardown
    a8a63f27c3a8a octeontx2-pf: Fix potential use after free in otx2_tc_add_flow()
    449aae54fa510 net: dsa: lantiq_gswip: suppress -EINVAL errors for bridge FDB entries added to the CPU port
    075c92577f529 net: dsa: lantiq_gswip: move gswip_add_single_port_br() call to port_setup()
    8523fee4caad8 net/mlx5e: Fix missing FEC RS stats for RS_544_514_INTERLEAVED_QUAD
    5aa468e563ce7 net/mlx5: HWS, ignore flow level for multi-dest table
    7f1b5d056f053 net/mlx5: HWS, remove unused create_dest_array parameter
    3c77f6d244188 net/mlx5: fs, fix UAF in flow counter release
    1c5a55ce47578 selftests: fib_nexthops: Fix creation of non-FDB nexthops
    8dd4aa0122885 nexthop: Forbid FDB status change while nexthop is in a group
    61341d935833f net: allow alloc_skb_with_frags() to use MAX_SKB_FRAGS
    3e4a313b11fca bnxt_en: correct offset handling for IPv6 destination address
    4d109d6c56c60 broadcom: fix support for PTP_EXTTS_REQUEST2 ioctl
    1bfb2d9456c18 broadcom: fix support for PTP_PEROUT_DUTY_CYCLE
    87a1f16f07c6c Bluetooth: MGMT: Fix possible UAFs
    7ce635b3d3aba vhost: Take a reference on the task in struct vhost_task.
    a78fd4fc5694e Bluetooth: hci_event: Fix UAF in hci_acl_create_conn_sync
    dde33124f17cf Bluetooth: hci_event: Fix UAF in hci_conn_tx_dequeue
    1609ab5393d33 Bluetooth: hci_sync: Fix hci_resume_advertising_sync
    c283e4a0e078a ethernet: rvu-af: Remove slash from the driver name
    d5411685dc2f6 net/smc: fix warning in smc_rx_splice() when calling get_page()
    1697577e1669b net: tun: Update napi->skb after XDP process
    394c58017e5f4 can: peak_usb: fix shift-out-of-bounds issue
    b638c3fb0f163 can: mcba_usb: populate ndo_change_mtu() to prevent buffer overflow
    7f7b21026a6fe can: sun4i_can: populate ndo_change_mtu() to prevent buffer overflow
    e77fdf9e33a83 can: hi311x: populate ndo_change_mtu() to prevent buffer overflow
    e587af2c89ecc can: etas_es58x: populate ndo_change_mtu() to prevent buffer overflow
    cc4cb275764da xfrm: fix offloading of cross-family tunnels
    a78e557765223 xfrm: xfrm_alloc_spi shouldn't use 0 as SPI
    966877e96d022 selftests/bpf: Skip timer cases when bpf_timer is not supported
    b6b7db6530236 bpf: Reject bpf_timer for PREEMPT_RT
    f577bec9836d1 can: rcar_can: rcar_can_resume(): fix s2ram with PSCI
    528151da32c17 wifi: virt_wifi: Fix page fault on connect
    0bcc5ea4bb30d amd/amdkfd: correct mem limit calculation for small APUs
    a01d1325e0fbd drm/amdkfd: fix p2p links bug in topology
    aae986c5805c7 NFSv4.2: Protect copy offload and clone against 'eof page pollution'
    204099ce6574b NFS: Protect against 'eof page pollution'
    f51f9695207bc btrfs: don't allow adding block device of less than 1 MB
    e64b692a2d55f selftests/fs/mount-notify: Fix compilation failure.
    6233715b4b714 bpf: Check the helper function is valid in get_helper_proto
    e6014ad4d009e smb: server: use disable_work_sync in transport_rdma.c
    27ce0a17ee989 smb: server: don't use delayed_work for post_recv_credits_work
    302c25ec64051 cpufreq: Initialize cpufreq-based invariance before subsys
    d342ba13c2a91 ARM: dts: kirkwood: Fix sound DAI cells for OpenRD clients
    c49b3ffc64cae arm64: dts: imx8mp: Correct thermal sensor index
    8707ccbf686f7 firmware: imx: Add stub functions for SCMI CPU API
    5f9587bbb3bb7 firmware: imx: Add stub functions for SCMI LMM API
    39cc5381c80c0 firmware: imx: Add stub functions for SCMI MISC API
    e3aba0b7f24c4 arm64: dts: rockchip: Fix the headphone detection on the orangepi 5
    1f58c03bc7580 HID: amd_sfh: Add sync across amd sfh work functions
    0fd5a4eeb726c HID: cp2112: fix setter callbacks return value
    f1958eb140458 IB/mlx5: Fix obj_type mismatch for SRQ event subscriptions
    dbeeeae988cce net: sfp: add quirk for FLYPRO copper SFP+ module
    4ceb739a3260a ALSA: usb-audio: Add mute TLV for playback volumes on more devices
    f20938fb3ba2e ALSA: usb-audio: move mixer_quirks' min_mute into common quirk
    f637c0678f8e8 gpiolib: acpi: Add quirk for ASUS ProArt PX13
    001470af9436a ALSA: usb-audio: Add DSD support for Comtrue USB Audio device
    86cb0f559b71e platform/x86: oxpec: Add support for OneXPlayer X1 Mini Pro (Strix Point)
    1e1873264e9de ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for PTL.
    eae9d5c299b78 ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in PTL match table
    71f64a3244ac9 ASoC: Intel: soc-acpi: Add entry for sof_es8336 in PTL match table.
    9b866ec1b3d8f i2c: designware: Add quirk for Intel Xe
    dcae67ba20e39 mmc: sdhci-cadence: add Mobileye eyeQ support
    44fd9560ea831 drm/panfrost: Add support for Mali on the MT8370 SoC
    39fdf31a26526 drm/panfrost: Commonize Mediatek power domain array definitions
    8cae20f2a4719 drm/panfrost: Drop duplicated Mediatek supplies arrays
    01c1287ef2a44 net: sfp: add quirk for Potron SFP+ XGSPON ONU Stick
    a94d1a0de44d7 net: fec: rename struct fec_devinfo fec_imx6x_info -> fec_imx6sx_info
    e9d96c5baa454 usb: core: Add 0x prefix to quirks debug output
    330e7cc51c275 ALSA: usb-audio: Fix build with CONFIG_INPUT=n
    645c7aa98d1e9 ALSA: hda/realtek: Add support for ASUS NUC using CS35L41 HDA
    9a183aeb23ca4 ALSA: usb-audio: Convert comma to semicolon
    bdb9cc8a8f940 HID: multitouch: specify that Apple Touch Bar is direct
    3e4453b40562f HID: multitouch: take cls->maxcontacts into account for Apple Touch Bar even without a HID_DG_CONTACTMAX field
    cf60067a13847 HID: multitouch: support getting the tip state from HID_DG_TOUCH fields in Apple Touch Bar
    6a6edca250126 HID: multitouch: Get the contact ID from HID_DG_TRANSDUCER_INDEX fields in case of Apple Touch Bar
    0105cfc41abeb ALSA: usb-audio: Add mixer quirk for Sony DualSense PS5
    042ce4cb97ae4 ALSA: usb-audio: Remove unneeded wmb() in mixer_quirks
    9f76d2c9e8c02 ALSA: usb-audio: Simplify NULL comparison in mixer_quirks
    8af6015e380ca ALSA: usb-audio: Avoid multiple assignments in mixer_quirks
    d3934ea7fb976 ALSA: usb-audio: Drop unnecessary parentheses in mixer_quirks
    0afc2246dd448 ALSA: usb-audio: Fix block comments in mixer_quirks
    c11341fb8fc3a ALSA: usb-audio: Fix whitespace & blank line issues in mixer_quirks
    2ea8b2ce48de5 ALSA: usb-audio: Fix code alignment in mixer_quirks
    f8ae65129919a firewire: core: fix overlooked update of subsystem ABI version
    16bd546200ec5 scsi: ufs: mcq: Fix memory allocation checks for SQE and CQE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.16.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.16.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index 0d6ea9b392..9c1752d179 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4f8446899dbe7700c1e7394bcc8afd497809ebc0"
-SRCREV_meta ?= "1ac1d0ff730fe1dd1371823d562db8126750a98c"
+SRCREV_machine ?= "c31e0cb82247b36842209614bb72af9127ef2471"
+SRCREV_meta ?= "2581b577580a3432c267877d9800bdb88f0e85aa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.16.9"
+LINUX_VERSION ?= "6.16.11"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index 4ab4d22486..c0dbec8b29 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.16.inc
 
-LINUX_VERSION ?= "6.16.9"
+LINUX_VERSION ?= "6.16.11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
-SRCREV_meta ?= "1ac1d0ff730fe1dd1371823d562db8126750a98c"
+SRCREV_machine ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
+SRCREV_meta ?= "2581b577580a3432c267877d9800bdb88f0e85aa"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 1a633bad9b..81f37c8d8a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.16/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.16/standard/base"
 KBRANCH:qemumips64 ?= "v6.16/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "945e9592c57f30b248f1973ca70678556fd8b441"
-SRCREV_machine:qemuarm64 ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
-SRCREV_machine:qemuloongarch64 ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
-SRCREV_machine:qemumips ?= "a924b211fade75edc1e28362ad8d321c08d428c8"
-SRCREV_machine:qemuppc ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
-SRCREV_machine:qemuriscv64 ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
-SRCREV_machine:qemuriscv32 ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
-SRCREV_machine:qemux86 ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
-SRCREV_machine:qemux86-64 ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
-SRCREV_machine:qemumips64 ?= "ccb566d859459b4dfef541f7c2af8d5eb6e47988"
-SRCREV_machine ?= "3f9db490a81eeb0077be3c5a5aa1388a2372232f"
-SRCREV_meta ?= "1ac1d0ff730fe1dd1371823d562db8126750a98c"
+SRCREV_machine:qemuarm ?= "cdb5121dcb8fbde2d7616011e8e84623914d17a4"
+SRCREV_machine:qemuarm64 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
+SRCREV_machine:qemuloongarch64 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
+SRCREV_machine:qemumips ?= "62ea92a539f58803a222be98b81118403074206e"
+SRCREV_machine:qemuppc ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
+SRCREV_machine:qemuriscv64 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
+SRCREV_machine:qemuriscv32 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
+SRCREV_machine:qemux86 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
+SRCREV_machine:qemux86-64 ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
+SRCREV_machine:qemumips64 ?= "9fb4ff0187c85426f21fd40d4c61b742800f65c4"
+SRCREV_machine ?= "42ddd61a7bcedefc5eaedb89e91dcec7061e78ce"
+SRCREV_meta ?= "2581b577580a3432c267877d9800bdb88f0e85aa"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "b0d8acc711981d712a59ee20b073cbc52a4109c5"
+SRCREV_machine:class-devupstream ?= "683320aeb0e83deac1b6c6794b0567969de09548"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.16/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.16.9"
+LINUX_VERSION ?= "6.16.11"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


