Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABEFDCD8C90
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 17:14:53 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26014.1781111692439158998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 10:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ibSx1Tc8;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ef1198766so60599f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 10:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781111691; x=1781716491; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdzep5OX1CEVDKL431pVBT3f9THIaAQ9PLlaYIZoG6M=;
        b=ibSx1Tc8v44lsNS5+T+YbNzaYYslDdRty+QNMWuBMcv4uKxjZH+LSgWR6rW48jdqin
         AgYZOzzk3xZlcFAQc6fdxLCJFk5+Kl4Fqg6sWeYzegeg3NKkIzMf7/02JTh/CV/q+zZr
         kkn3Tv7jxD1bRGNho6MLSsn/2lTx1ztn/ViJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781111691; x=1781716491;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wdzep5OX1CEVDKL431pVBT3f9THIaAQ9PLlaYIZoG6M=;
        b=S3cP66c/xfdIZzckDB7EITRszeBUTnewqGz1x/UM6Rsf4ovjhhSnaDL+Ck4z1Sj/9O
         qteX9FcAznQr9yR9/XQbu5h9nrN3J7ybyp9Wi38LTh9lhVSox5Ud+UXsZSgmSc2W6AMu
         NM7GgooSrDwLtTw8JUQYrsGCUFAkKZszul29Kx9SWm1FxsdQpgUfvefKUqayTFi38Yrn
         GLSpgTYm9ytl4ZF0Es/CaZZRIABmGQi3MLS6LINRwjc4SHXXqmNigkrntpGJ1G6Oq9O+
         dyzu808eJJnOeWDbmReQZXteqg7z5MqXYmfuZ9/2cBAFT4/VudBKJfv60q/j456bVvcS
         u7LA==
X-Gm-Message-State: AOJu0YyPlhQKHaweKbH8AUGLTRwlyGxU4QVltgJUXP006FY+UJR0KrsL
	nTCEhbnRh/Z9LDYwyMtJQugu8S8Av7uUQnIt6Uk1twuT7BX5BoKDDWntk8wWeivUXhM=
X-Gm-Gg: Acq92OEgzmcXIFhSV+4j+mR/P7KeWiqgOc32QNO7R+YeUvdYbJNBh1sSyYVdnh+XW0q
	hQnk1vc3Dxq8KZlJRfTJtXSbknYb7Oc5qjyG6GfEMmgAHQVcBOyzYB0mv0KSq5XpIfn+10KYBw0
	GJ/1BI4pMm2h8kVwHeyfF5qQBCN7RDpZwPyhuzlNmmelhgsfrPK8x8MYb4uq4tXcT9yC1jfMv7m
	MidpqEqcHl9o/UMmz2iTaGPrb7hnSAAolE6z8QxPShYN5UNjjvWZWtPWYnkpASP1pYQLKQsRrJu
	xRluLEZXSJCXJzHiecJQjDbCM+5JkZjAN7o9kclTzegvhnAT1VtVnV6hsqcIhtk2T2vg3Iz9fMp
	75/6SX1CO4DNk1MEN4FhqCU7sUc7hJum0E0beroytPqmZKt24WOKqCZtpOHWlFWWVA3kGGhNwXP
	8MWPsJPi1YvpnUeRo9BQnOvUvvhjrFA0XNyFUHy+G8FU1lpvf6K2iNMRmgtkzINXjOrlbHwsLFk
	o7ZaSkRHUkh2SzilFFBdJdPIaI=
X-Received: by 2002:a05:6000:298f:20b0:45e:73a1:8d04 with SMTP id ffacd0b85a97d-46032b61217mr24559250f8f.1.1781111690407;
        Wed, 10 Jun 2026 10:14:50 -0700 (PDT)
Received: from localhost (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4004sm73337645f8f.9.2026.06.10.10.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 10:14:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 19:14:49 +0200
Message-Id: <DJ5JEECQGTXS.3DLVUENBUV0HU@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [meta][scarthgap][PATCH 01/11] linux-yocto/6.6:
 update to v6.6.129
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
In-Reply-To: <20260610165008.1870552-1-bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 17:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238391

On Wed Jun 10, 2026 at 6:49 PM CEST, Bruce Ashfield via lists.openembedded.=
org wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating linux-yocto/6.6 to the latest korg -stable release that comprise=
s
> the following commits:

Hi Bruce,

Are there changes from the previous series (6.6.129-6.6.135)?

There was some autobuilder failures:
https://lore.kernel.org/all/DIBGIUMGTRU4.ZOHIWWT1QG6I@smile.fr/

Thanks!

>
>     fc00fe35d46 Linux 6.6.129
>     acf7c8972775 Revert "x86/kexec: add a sanity check on previous kernel=
's ima kexec buffer"
>     682d8e2f892b Linux 6.6.128
>     0ac0e02183c5 arm64: Fix sampling the "stable" virtual counter in pree=
mptible section
>     18845fb30921 drm/i915/wakeref: clean up INTEL_WAKEREF_PUT_* flag macr=
os
>     fe418ef21efd NTB: ntb_transport: Fix too small buffer for debugfs_nam=
e
>     1cdff5d564fe tracing: Wake up poll waiters for hist files when removi=
ng an event
>     e4e5026252b4 tracing: Fix checking of freed trace_event_file for hist=
 files
>     ad058a4317db net: nfc: nci: Fix parameter validation for packet data
>     dc99b25ed4f7 arm64: Force the use of CNTVCT_EL0 in __delay()
>     ad3640895956 x86/kexec: Copy ACPI root pointer address from config ta=
ble
>     9c735a7d98c9 net/sched: act_skbedit: fix divide-by-zero in tcf_skbedi=
t_hash()
>     1e300c33ef3c net: ethernet: ec_bhf: Fix dma_free_coherent() dma handl=
e
>     6ccfcad1b582 ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X M=
6501RR
>     c854ab481ece cifs: some missing initializations on replay
>     6a3ce8c8ad80 fbcon: Remove struct fbcon_display.inverse
>     b6de6d481cc2 fbdev: ffb: fix corrupted video output on Sun FFB1
>     3ed019654234 fbdev: of: display_timing: fix refcount leak in of_get_d=
isplay_timings()
>     e8c5d5f6cd66 fbdev: vt8500lcdfb: fix missing dma_free_coherent()
>     a785c4e2a999 fbcon: check return value of con2fb_acquire_newinfo()
>     632d233cf2e6 ipv6: ioam: fix heap buffer overflow in __ioam6_fill_tra=
ce_data()
>     e075ec9b08f8 atm: fore200e: fix use-after-free in tasklets during dev=
ice removal
>     9f8ad199844c net: intel: fix PCI device ID conflict between i40e and =
ipw2200
>     6eb571a37631 io_uring/filetable: clamp alloc_hint to the configured a=
lloc range
>     0f4dcba31bf4 tracing: Fix to set write permission to per-cpu buffer_s=
ize_kb
>     ec4445ae9e58 net: macb: Fix tx/rx malfunction after phy link down and=
 up
>     013ac469596a octeontx2-af: CGX: fix bitmap leaks
>     0f85a9655445 net: wan/fsl_ucc_hdlc: Fix dma_free_coherent() in uhdlc_=
memclean()
>     63afc078bba6 net: ethernet: marvell: skge: remove incorrect conflicti=
ng PCI ID
>     710657d3d31f LoongArch: Disable instrumentation for setup_ptwalker()
>     6868bd64dc90 LoongArch: Guard percpu handler under !CONFIG_PREEMPT_RT
>     a50371c6ad99 LoongArch: Prefer top-down allocation after arch_mem_ini=
t()
>     bb1a54f7f011 LoongArch: Make cpumask_of_node() robust against NUMA_NO=
_NODE
>     9efa154609cd ceph: supply snapshot context in ceph_zero_partial_objec=
t()
>     103e9d1d43e6 MIPS: rb532: Fix MMIO UART resource registration
>     953953abb66e cifs: Fix locking usage for tcon fields
>     cc3f83b6fb37 staging: rtl8723bs: fix null dereference in find_network
>     369d369ed08f parisc: kernel: replace kfree() with put_device() in cre=
ate_tree_node()
>     a19b61fdb958 PCI: Fix pci_slot_trylock() error handling
>     65e794574069 net: cpsw_new: Fix unnecessary netdev unregistration in =
cpsw_probe() error path
>     4857c37c7ba9 drm/amdkfd: Fix out-of-bounds write in kfd_event_page_se=
t()
>     7a4fd19c567f tipc: fix RCU dereference race in tipc_aead_users_dec()
>     8e875cf8851b mtd: rawnand: pl353: Fix software ECC support
>     f5da4c24aa6d usb: dwc2: fix resume failure if dr_mode is host
>     76c1123ffccf usb: dwc3: gadget: Move vbus draw to workqueue context
>     aa8d68d97c7f scsi: ufs: core: Flush exception handling work when RPM =
level is zero
>     d3e837e11ee9 perf/arm-cmn: Reject unsupported hardware configurations
>     9bd98d088f47 remoteproc: imx_rproc: Fix invalid loaded resource table=
 detection
>     d99a08c2b4d5 btrfs: continue trimming remaining devices on failure
>     41a09925ec68 arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=3Dy
>     1047ca2d8169 PCI/IOV: Fix race between SR-IOV enable/disable and hotp=
lug
>     639265296fe6 Revert "PCI/IOV: Add PCI rescan-remove locking when enab=
ling/disabling SR-IOV"
>     cfccd3b8c51b kexec: derive purgatory entry from symbol
>     bb273b68c171 ocfs2: fix reflink preserve cleanup issue
>     649c2e853608 rapidio: replace rio_free_net() with kfree() in rio_scan=
_alloc_net()
>     81c44a4bc168 mm/highmem: fix __kmap_to_page() build error
>     1eabfd2c437b iio: gyro: itg3200: Fix unchecked return value in read_r=
aw
>     9d0ca11258e7 powerpc/smp: Add check for kcalloc() failure in parse_th=
read_groups()
>     442f5db91317 tools: Fix bitfield dependency failure
>     e4709950acd4 dm mpath: make pg_init_delay_msecs settable
>     542dd6da35eb bus: fsl-mc: fix an error handling in fsl_mc_device_add(=
)
>     65f5a17b6d56 usb: gadget: tegra-xudc: Add handling for BLCG_COREPLL_P=
WRDN
>     22e460b6333a x86/kexec: add a sanity check on previous kernel's ima k=
exec buffer
>     57c4fd0f4b02 nvmem: Drop OF node reference on nvmem_add_one_cell() fa=
ilure
>     13c1f31f777c nfsd: fix return error code for nfsd_map_name_to_[ug]id
>     d92b8fac294b md/bitmap: fix GPF in write_page caused by resize race
>     142b1bba3299 PCI: endpoint: Fix swapped parameters in pci_{primary/se=
condary}_epc_epf_unlink() functions
>     708e20c66b27 KVM: x86: Add SRCU protection for reading PDPTRs in __ge=
t_sregs2()
>     a6f660d62bc1 xfs: fix remote xattr valuelblk check
>     38613c01f69e xfs: fix freemap adjustments when adding xattrs to leaf =
blocks
>     ffaf5c99d0f8 xfs: delete attr leaf freemap entries when empty
>     e2e7c275f557 mfd: core: Add locking around 'mfd_of_node_list'
>     01aed2f1d7cb iommu/vt-d: Flush dev-IOTLB only when PCIe device is acc=
essible in scalable mode
>     a5b1ddbe31f4 media: verisilicon: AV1: Fix tile info buffer size
>     8be53110395e xfs: mark data structures corrupt on EIO and ENODATA
>     297bb8b1db60 selftests/mm/charge_reserved_hugetlb: drop mount size fo=
r hugetlbfs
>     aa5f25d55cda mm, page_alloc, thp: prevent reclaim for __GFP_THISNODE =
THP allocations
>     8dcff1979381 drm: of: drm_of_panel_bridge_remove(): fix device_node l=
eak
>     52920a853381 media: venus: vdec: restrict EOS addr quirk to IRIS2 onl=
y
>     225f2221b422 media: venus: vdec: fix error state assignment for zero =
bytesused
>     272d44fa7bce arm64: dts: rockchip: Do not enable hdmi_sound node on P=
inebook Pro
>     ed36f6ae0039 dm-unstripe: fix mapping bug when there are multiple tar=
gets in a table
>     fb49f209995f dm-integrity: fix recalculation in bitmap mode
>     de7934627cc4 s390/pci: Handle futile config accesses of disabled devi=
ces directly
>     1c7c87cf18da clk: tegra: tegra124-emc: Fix potential memory leak in t=
egra124_clk_register_emc()
>     0f0809bfe4fa media: i2c: ov01a10: Fix digital gain range
>     85cc6574f21b clk: clk-apple-nco: Add "apple,t8103-nco" compatible
>     3880e331b0b3 KVM: nSVM: Always use vmcb01 in VMLOAD/VMSAVE emulation
>     e113339cc7d2 soc: ti: pruss: Fix double free in pruss_clk_mux_setup()
>     d451bf970a0c soc: ti: k3-socinfo: Fix regmap leak on probe failure
>     7daf279c674d dm: clear cloned request bio pointer when last clone bio=
 completes
>     2d10a3dad8d6 dm-integrity: fix a typo in the code for write/discard r=
ace
>     d03a29cb36d6 media: i2c: ov5647: use our own mutex for the ctrl lock
>     089625cccd7e media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode
>     c146483bad46 media: i2c: ov5647: Sensor should report RAW color space
>     e5f4aad2627d media: i2c: ov5647: Correct minimum VBLANK value
>     1f413dac763a media: i2c: ov5647: Correct pixel array offset
>     cabd025182cf media: i2c: ov5647: Initialize subdev before controls
>     c9af1818387f media: ccs: Avoid possible division by zero
>     0c074e80921f media: qcom: camss: vfe: Fix out-of-bounds access in vfe=
_isr_reg_update()
>     8de39720e7a3 media: i2c: ov01a10: Fix test-pattern disabling
>     a14a3cef8017 media: i2c: ov01a10: Add missing v4l2_subdev_cleanup() c=
alls
>     567a03fe8d08 media: i2c: ov01a10: Fix analogue gain range
>     e2f6d78dc3a8 media: i2c: ov01a10: Fix reported pixel-rate value
>     bb2b049f75f1 media: i2c: ov01a10: Fix the horizontal flip control
>     ccb92def042a media: i2c/tw9906: Fix potential memory leak in tw9906_p=
robe()
>     9cb9eca33d20 media: i2c/tw9903: Fix potential memory leak in tw9903_p=
robe()
>     046c5db6bbba media: cx25821: Add missing unmap in snd_cx25821_hw_para=
ms()
>     544215cc37d0 media: cx23885: Add missing unmap in snd_cx23885_hw_para=
ms()
>     10ab64f8efc2 media: cx88: Add missing unmap in snd_cx88_hw_params()
>     27c508f61963 media: radio-keene: fix memory leak in error path
>     dd8508820246 media: verisilicon: AV1: Set IDR flag for intra_only fra=
me type
>     8305902ac038 arm64: dts: apple: t8112-j473: Keep the HDMI port powere=
d on
>     b74bf7d0d01f HID: logitech-hidpp: Check maxfield in hidpp_get_report_=
length()
>     3f1b21cc67a1 HID: prodikeys: Check presence of pm->input_ep82
>     243e1165eb03 HID: magicmouse: Do not crash on missing msc->input
>     449004434e1f HID: hid-pl: handle probe errors
>     cad7442ff23b arm64: Disable branch profiling for all arm64 code
>     deb8f6dfd31d KVM: nSVM: Remove a user-triggerable WARN on nested_svm_=
load_cr3() succeeding
>     275e15fd1cf7 ARM: omap2: Fix reference count leaks in omap_control_in=
it()
>     b44eb959159f media: verisilicon: AV1: Fix tx mode bit setting
>     8ad7e6ea46a9 media: verisilicon: AV1: Fix enable cdef computation
>     564fd3a63efc media: mtk-mdp: Fix a reference leak bug in mtk_mdp_remo=
ve()
>     12cafc15d246 media: mtk-mdp: Fix error handling in probe function
>     637510cb5bed media: mediatek: encoder: Fix uninitialized scalar varia=
ble issue
>     031f2adc1499 dm-verity: correctly handle dm_bufio_client_create() fai=
lure
>     a9ddc035050a fpga: dfl: use subsys_initcall to allow built-in drivers=
 to be added
>     d6f5aed42760 ASoC: SOF: ipc4-control: Keep the payload size up to dat=
e
>     e1dd7092fa8f ASoC: SOF: ipc4-control: Use the correct size for scontr=
ol->ipc_control_data
>     59fe643f21b9 ASoC: SOF: ipc4-topology: Correct the allocation size fo=
r bytes controls
>     3a5a4b066329 ASoC: SOF: ipc4-control: If there is no data do not send=
 bytes update
>     955e2d6e5e0a clk: renesas: rzg2l: Select correct div round macro
>     a4be3b90ba9d clk: renesas: rzg2l: Fix intin variable size
>     90c8353f4718 rpmsg: core: fix race in driver_override_show() and use =
core helper
>     7ef82863d422 netfilter: nf_conntrack_h323: fix OOB read in decode_cho=
ice()
>     b690635d4719 dpaa2-switch: validate num_ifs to prevent out-of-bounds =
write
>     9ac6aebef4b4 net: consume xmit errors of GSO frames
>     175881094756 net/mlx5: Fix missing devlink lock in SRIOV enable error=
 path
>     54fb0577ebe7 net/mlx5: DR, Fix circular locking dependency in dump
>     b324327ff6f4 RDMA/umem: Fix double dma_buf_unpin in failure path
>     35854ed5c40b net: usb: pegasus: enable basic endpoint checking
>     df001db47708 RDMA/efa: Fix typo in efa_alloc_mr()
>     337d7b4112a4 net: wan: farsync: Fix use-after-free bugs caused by unf=
inished tasklets
>     52d469319ced RDMA/core: Fix stale RoCE GIDs during netdev events at r=
egistration
>     0b7d596da5de tipc: fix duplicate publication key in tipc_service_inse=
rt_publ()
>     481ea39b342c Bluetooth: L2CAP: Fix missing key size check for L2CAP_L=
E_CONN_REQ
>     efcdb4da480c Bluetooth: L2CAP: Fix not checking output MTU is accepta=
ble on L2CAP_ECRED_CONN_REQ
>     1a138921ce56 Bluetooth: L2CAP: Fix response to L2CAP_ECRED_CONN_REQ
>     1d93a369b5aa Bluetooth: hci_qca: Cleanup on all setup failures
>     7247f340f824 Bluetooth: L2CAP: Fix invalid response to L2CAP_ECRED_RE=
CONF_REQ
>     2983b39f8c0d Remove WARN_ALL_UNSEEDED_RANDOM kernel config option
>     1f40fde29349 wifi: cfg80211: wext: fix IGTK key ID off-by-one
>     322437972f0a net: ethernet: xscale: Check for PTP support properly
>     854f5997df49 net: ixp4xx_eth: convert to ndo_hwtstamp_get() and ndo_h=
wtstamp_set()
>     19f359963ae8 net: usb: lan78xx: scan all MDIO addresses on LAN7801
>     ef9b10a02050 net: usb: kaweth: remove TX queue manipulation in kaweth=
_set_rx_mode
>     166801e49a5b xfrm: always flush state and policy upon NETDEV_UNREGIST=
ER event
>     56d5c0557e53 ipmi: ipmb: initialise event handler read bytes
>     f13e4fe961a7 xfrm: skip templates check for packet offload tunnel mod=
e
>     719918fc88df xfrm6: fix uninitialized saddr in xfrm6_get_saddr()
>     d0559d07afab ntb: ntb_hw_switchtec: Fix shift-out-of-bounds for 0 mw =
lut
>     85c9daa1f831 ntb: ntb_hw_switchtec: Fix array-index-out-of-bounds acc=
ess
>     a4557dc20df4 rtc: zynqmp: correct frequency value
>     61bd8787c605 drm/amd/display: Remove conditional for shaper 3DLUT pow=
er-on
>     0b284a7ce311 btrfs: replace BUG() with error handling in __btrfs_bala=
nce()
>     8995fc0e00b3 ALSA: usb-audio: Add sanity check for OOB writes at sile=
ncing
>     6a997eb80644 drm/radeon: Add HAINAN clock adjustment
>     5b9af0342402 drm/amdgpu: Add HAINAN clock adjustment
>     c26bde6301f2 ALSA: usb-audio: Update the number of packets properly a=
t receiving
>     d2e92247b24a drm/amdgpu: Adjust usleep_range in fence wait
>     068dee782c8c drm/amd/display: Avoid updating surface with the same su=
rface under MPO
>     1a7f1116c7f8 ARM: 9467/1: mm: Don't use %pK through printk
>     44373b1e9c12 include: uapi: netfilter_bridge.h: Cover for musl libc
>     9f33e83c8393 thermal: int340x: Fix sysfs group leak on DLVR registrat=
ion failure
>     e1dc45d97975 libceph: define and enforce CEPH_MAX_KEY_LEN
>     a87a445ac1d9 ceph: supply snapshot context in ceph_uninline_data()
>     2f5c626ea792 fs/ntfs3: avoid calling run_get_entry() when run =3D=3D =
NULL in ntfs_read_run_nb_ra()
>     ad0d779cdc26 fs/ntfs3: drop preallocated clusters for sparse and comp=
ressed files
>     8d8c70b57dbe fs: ntfs3: fix infinite loop triggered by zero-sized ATT=
R_LIST
>     af839013c70a fs: ntfs3: fix infinite loop in attr_load_runs_range on =
inconsistent metadata
>     68e32694be23 fs: ntfs3: check return value of indx_find to avoid infi=
nite loop
>     6dedf0369f2a MIPS: Loongson: Make cpumask_of_node() robust against NU=
MA_NO_NODE
>     da08099d5f7a iio: magnetometer: Remove IRQF_ONESHOT
>     53f2152b48d5 iio: Use IRQF_NO_THREAD
>     be5465701341 Revert "mfd: da9052-spi: Change read-mask to write-mask"
>     dc3bc979814b phy: fsl-imx8mq-usb: disable bind/unbind platform driver=
 feature
>     afb941338c8e phy: mvebu-cp110-utmi: fix dr_mode property read from dt=
s
>     d476130e53d3 watchdog: imx7ulp_wdt: handle the nowayout option
>     0883ddd583ed binder: don't use %pK through printk
>     1d7120244b54 fix it87_wdt early reboot by reporting running timer
>     4ff5ab3e7141 serial: 8250: 8250_omap.c: Clear DMA RX running status o=
nly after DMA termination is done
>     8311bb40698b staging: rtl8723bs: fix memory leak on failure path
>     03a2f7f9864c misc: eeprom: Fix EWEN/EWDS/ERAL commands for 93xx56 and=
 93xx66
>     ece3722169ba misc: bcm_vk: Fix possible null-pointer dereferences in =
bcm_vk_read()
>     c219c20cc357 dmaengine: stm32-mdma: initialize m2m_hw_period and ccr =
to fix warnings
>     f89324e2e09d dmaengine: sun6i: Choose appropriate burst length under =
maxburst
>     f9305dda5015 fpga: of-fpga-region: Fail if any bridge is missing
>     b2bbcaa36c1a usb: typec: ucsi: psy: Fix voltage and current max for n=
on-Fixed PDOs
>     32ccda4895ba serial: 8250_dw: handle clock enable errors in runtime_r=
esume
>     52b42c24750a staging: rtl8723bs: fix missing status update on sdio_al=
loc_irq() failure
>     cd496527efa8 soundwire: dmi-quirks: add mapping for Avell B.ON (OEM r=
ebranded of NUC15)
>     3be7beef4a05 m68k: nommu: fix memmove() with differently aligned src =
and dest for 68000
>     6ce681cf8082 clk: microchip: core: correct return value on *_get_pare=
nt()
>     e2809ad08252 mailbox: sprd: clear delivery flag before handling TX do=
ne
>     4c4679b31b9d remoteproc: mediatek: Break lock dependency to `prepare_=
lock`
>     332fb842181e mailbox: sprd: mask interrupts that are not handled
>     17ee46882b3e mailbox: imx: Skip the suspend flag for i.MX7ULP
>     51edcbd17c8d mailbox: pcc: Remove spurious IRQF_ONESHOT usage
>     f720e653aa1a remoteproc: imx_dsp_rproc: Skip RP_MBOX_SUSPEND_SYSTEM w=
hen mailbox TX channel is uninitialized
>     cb6c4aa73491 tracing: Fix false sharing in hwlat get_sample()
>     9566c87101b2 vhost: fix caching attributes of MMIO regions by setting=
 them explicitly
>     f1bf5ebd5fda scsi: buslogic: Reduce stack usage
>     d16337560750 hisi_acc_vfio_pci: update status after RAS error
>     559e227b1df7 ata: libata: avoid long timeouts on hot-unplugged SATA D=
AS
>     55de264a4d32 RDMA/rtrs-clt: For conn rejection use actual err number
>     3819890d6ab2 nfc: nxp-nci: remove interrupt trigger type
>     392e3d44841d myri10ge: avoid uninitialized variable use
>     6e2a6100ac5b PCI: Mark Nvidia GB10 to avoid bus reset
>     846b226065fe PCI: Add ACS quirk for Qualcomm Hamoa & Glymur
>     ec494c0260bf PCI: Enable ACS after configuring IOMMU for OF platforms
>     a2376e912723 PCI: Fix pci_slot_lock () device locking
>     f5ea62163a78 PCI: Mark ASM1164 SATA controller to avoid bus reset
>     391200c274e9 net/rds: Clear reconnect pending bit
>     f713dcd2ce83 vmw_vsock: bypass false-positive Wnonnull warning with g=
cc-16
>     7a8acafd45a9 net: usb: sr9700: remove code to drive nonexistent multi=
cast filter
>     87465580215c wifi: ath10k: fix lock protection in ath10k_wmi_event_pe=
er_sta_ps_state_chg()
>     b015d4c70c9a wifi: rtw89: pci: restore LDO setting after device resum=
e
>     d9b549b6951b octeontx2-af: Workaround SQM/PSE stalls by disabling sti=
cky
>     37f4e6804d98 Bluetooth: btusb: Add device ID for Realtek RTL8761BU
>     c051ef2f61f4 Bluetooth: btusb: Add new VID/PID for RTL8852CE
>     07960da05c0d Bluetooth: hci_conn: use mod_delayed_work for active mod=
e timeout
>     c06dbfd954c9 Bluetooth: hci_conn: Set link_policy on incoming ACL con=
nections
>     9eaeba5600e5 ipv4: fib: Annotate access to struct fib_alias.fa_state.
>     31d4bb68f436 wifi: iwlegacy: add missing mutex protection in il3945_s=
tore_measurement()
>     941e3066441c wifi: iwlegacy: add missing mutex protection in il4965_s=
tore_tx_power()
>     2ace7ac88cb0 net: hns3: extend HCLGE_FD_AD_QID to 11 bits
>     d5cd3bb7794e ipv4: igmp: annotate data-races around idev->mr_maxdelay
>     ab2848d3783a gro: change the BUG_ON() in gro_pull_from_frag0()
>     f0f729bdffb0 net/rds: No shortcut out of RDS_CONN_ERROR
>     db62e9f44838 wifi: iwlwifi: mvm: check the validity of noa_len
>     116bc0980e91 net: usb: r8152: fix transmit queue timeout
>     f4bf64072c36 openrisc: define arch-specific version of nop()
>     07a9b32eaae7 netfilter: xt_tcpmss: check remaining length before read=
ing optlen
>     89f50775d883 netfilter: nf_conntrack: Add allow_clash to generic prot=
ocol handler
>     99c75e53cec0 ext4: mark group extend fast-commit ineligible
>     0d5fcb063cda ext4: move ext4_percpu_param_init() before ext4_mb_init(=
)
>     83b074b69022 ext4: mark group add fast-commit ineligible
>     46ed4e9c8d30 ipv6: exthdrs: annotate data-race over multiple sysctl
>     55170230de66 ipv6: annotate data-races in ip6_multipath_hash_{policy,=
fields}()
>     f73528f140f1 wifi: ath12k: fix preferred hardware mode calculation
>     c5547727bd1c wifi: ath11k: add pm quirk for Thinkpad Z13/Z16 Gen1
>     ddfe47664cc6 PCI: dw-rockchip: Disable BAR 0 and BAR 1 for Root Port
>     d880c9b73890 wifi: rtw89: wow: add reason codes for disassociation in=
 WoWLAN mode
>     f2f65b28d802 iommu/amd: move wait_on_sem() out of spinlock
>     5bfb25495e39 wifi: libertas: fix WARNING in usb_tx_block
>     9ff4843e6ea3 iommu/arm-smmu-v3: Improve CMDQ lock fairness and effici=
ency
>     4f9e7ca933a9 dm: remove fake timeout to avoid leak request
>     df379f57c2cd dm: replace -EEXIST with -EBUSY
>     dd181178c245 wifi: rtw88: rtw8821cu: Add ID for Mercusys MU6H
>     a96d161cfdb1 wifi: rtw88: 8822b: Avoid WARNING in rtw8822b_config_trx=
_mode()
>     9fdce77e38c1 wifi: rtw88: fix DTIM period handling when conf->dtim_pe=
riod is zero
>     f70fcbc2ac7c jfs: nlink overflow in jfs_rename
>     68f7fc769243 jfs: Add missing set_freezable() for freezable kthread
>     34506cb119bb ALSA: usb-audio: Add iface reset and delay quirk for AB1=
3X USB Audio
>     8fb5c4c979ae modpost: Amend ppc64 save/restfpr symnames for -Os build
>     fecfe41f7ed0 ASoC: es8328: Add error unwind in resume
>     18c67fb3750b hwmon: (f71882fg) Add F81968 support
>     f8ddbe303419 hwmon: (nct6775) Add ASUS Pro WS WRX90E-SAGE SE
>     2d48f60307e6 ASoC: codecs: max98390: Check return value of devm_gpiod=
_get_optional() in max98390_i2c_probe()
>     3383271464b7 spi: spi-mem: Protect dirmap_create() with spi_mem_acces=
s_start/end
>     19513daa8d13 ASoC: sunxi: sun50i-dmic: Add missing check for devm_reg=
map_init_mmio
>     d1b6536ac20d gpio: aspeed-sgpio: Change the macro to support deferred=
 probe
>     98c0e07dc7d6 ALSA: hda/conexant: Add headset mic fix for MECHREVO Wuj=
ie 15X Pro
>     49afc2e5bfae HID: elecom: Add support for ELECOM HUGE Plus M-HT1MRBK
>     4df1e6252d07 HID: multitouch: add eGalaxTouch EXC3188 support
>     876bb1eabdb1 media: rkisp1: Fix filter mode register configuration
>     ac2d898da509 drm/atmel-hlcdc: fix use-after-free of drm_crtc_commit a=
fter release
>     80b8b0df370f drm/atmel-hlcdc: don't reject the commit if the src rect=
 has fractional parts
>     ec40702029b0 drm/atmel-hlcdc: fix memory leak from the atomic_destroy=
_state callback
>     af67b50311e7 virt: vbox: uapi: Mark inner unions in packed structs as=
 packed
>     34eae7e0ab61 hyper-v: Mark inner union in hv_kvp_exchg_msg_value as p=
acked
>     bbfaa5761f58 drm: Account property blob allocations to memcg
>     e97de3e924b3 drm/amdkfd: Fix GART PTE for non-4K pagesize in svm_migr=
ate_gart_map()
>     30aaed311f97 media: v4l2-async: Fix error handling on steps after fin=
ding a match
>     4010e596d23c media: cx25821: Fix a resource leak in cx25821_dev_setup=
()
>     33af366211ee media: solo6x10: Check for out of bounds chip_id
>     4ba5c7a1aade media: pvrusb2: fix URB leak in pvr2_send_request_ex
>     45d9a0cd1b88 media: adv7180: fix frame interval in progressive mode
>     f5a5a824f0ac media: amphion: Clear last_buffer_dequeued flag for DEC_=
CMD_START
>     81bc7d5e7897 spi: spi-mem: Limit octal DTR constraints to octal DTR s=
ituations
>     822530fb85d8 ASoC: wm8962: Don't report a microphone if it's shorted =
to ground on plug
>     21f6e02a1910 ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D Coefficients=
" mask
>     04184bcb50f5 HID: apple: Add "SONiX KN85 Keyboard" to the list of non=
-apple keyboards
>     55462d16cb9c drm/amdgpu: avoid a warning in timedout job handler
>     40e0b938db37 drm/amdgpu: add support for HDP IP version 6.1.1
>     b0d35bc9c159 media: mediatek: vcodec: Don't try to decode 422/444 VP9
>     38ef3e1e1e9b media: omap3isp: set initial format
>     d490523d2374 media: omap3isp: isppreview: always clamp in preview_try=
_format()
>     a9d1d7d27151 media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fixes
>     2663ef70c612 drm/v3d: Set DMA segment size to avoid debug warnings
>     50e8aac244e7 spi: stm32: fix Overrun issue at < 8bpw
>     8b971c21603a media: dvb-core: dmxdevfilter must always flush bufs
>     b2a97f2259f6 spi-geni-qcom: use xfer->bits_per_word for can_dma()
>     5d0814ad6654 spi-geni-qcom: initialize mode related registers to 0
>     ac9a7c329a56 drm/display/dp_mst: Add protection against 0 vcpi
>     afa0bfe1437d parisc: Prevent interrupts during reboot
>     12535a5d5d64 arm64: tegra: smaug: Add usb-role-switch support
>     1da904e84de6 pstore: ram_core: fix incorrect success return when vmap=
() fails
>     a4345acbe390 char: tpm: cr50: Remove IRQF_ONESHOT
>     3e656f767407 mailbox: bcm-ferxrm-mailbox: Use default primary handler
>     7b9394e49720 crypto: hisilicon/qm - move the barrier before writing t=
o the mailbox register
>     5f007c6acaa7 PCI/MSI: Unmap MSI-X region on error
>     f557c206c32e clocksource/drivers/timer-integrator-ap: Add missing Kco=
nfig dependency on OF
>     6f113ab549b8 clocksource/drivers/sh_tmu: Always leave device running =
after probe
>     c8a34bceefbc bpf: verifier improvement in 32bit shift sign extension =
pattern
>     47bbd0cb7db3 sparc: don't reference obsolete termio struct for TC* co=
nstants
>     6aa04820dbfe sparc: Synchronize user stack on fork and clone
>     648aa7ce0bd8 blk-mq-debugfs: add missing debugfs_mutex in blk_mq_debu=
gfs_register_hctxs()
>     9150176cbf71 xenbus: Use .freeze/.thaw to handle xenbus devices
>     2050a5cff32c perf/cxlpmu: Replace IRQF_ONESHOT with IRQF_NO_THREAD
>     84a17b7b292d s390/perf: Disable register readout on sampling events
>     bafd4aa1908a cpufreq: dt-platdev: Block the driver from probing on mo=
re QC platforms
>     a61c1bc84c4a md-cluster: fix NULL pointer dereference in process_meta=
data_update
>     b4a0b646cc28 ACPICA: Abort AML bytecode execution when executing AML_=
FATAL_OP
>     01e8751b37a3 ACPI: processor: Fix NULL-pointer dereference in acpi_pr=
ocessor_errata_piix4()
>     64eb63f573f4 EFI/CPER: don't go past the ARM processor CPER record bu=
ffer
>     e0ec99115e13 APEI/GHES: ensure that won't go past CPER allocated reco=
rd
>     5a9b1dda8481 EFI/CPER: don't dump the entire memory region
>     6ea4b7bc2e7b x86/xen/pvh: Enable PAE mode for 32-bit guest only when =
CONFIG_X86_PAE is set
>     30868a6a5238 rnbd-srv: Zero the rsp buffer before using it
>     fd7e360845d3 arm64: Add support for TSV110 Spectre-BHB mitigation
>     94ab05af1d96 perf/arm-cmn: Support CMN-600AE
>     61cd0b287fb9 s390/purgatory: Add -Wno-default-const-init-unsafe to KB=
UILD_CFLAGS
>     7823e09a68b5 tools/power cpupower: Reset errno before strtoull()
>     93e8e3ee165a smb: client: prevent races in ->query_interfaces()
>     e428670cfb29 gfs2: fiemap page fault fix
>     048b58edc57d smb: client: add proper locking around ses->iface_last_u=
pdate
>     8b5dcfa97bf3 btrfs: handle user interrupt properly in btrfs_trim_fs()
>     2bb588cede1c minix: Add required sanity checking to minix_check_super=
block()
>     43ccadb866de i3c: master: svc: Initialize 'dev' to NULL in svc_i3c_ma=
ster_ibi_isr()
>     de9affb698d5 hfsplus: pretend special inodes as regular files
>     f5d27ad99fca audit: add missing syscalls to read class
>     c1b6227555c5 fs/buffer: add alert in try_to_free_buffers() for folios=
 without buffers
>     bccd4ebbdac3 hfsplus: fix volume corruption issue for generic/498
>     91e27bc79c3b audit: add fchmodat2() to change attributes class
>     4bde6678bc54 rtc: interface: Alarm race handling should not discard p=
receding error
>     4927e2d29b74 libperf build: Always place libperf includes first
>     5cf6e76e4f4f libperf: Don't remove -g when EXTRA_CFLAGS are used
>     66e9b70c64df libsubcmd: Fix null intersection case in exclude_cmds()
>     56042755b72f perf callchain: Fix srcline printing with inlines
>     eddddf4ed7f6 perf unwind-libdw: Fix invalid reference counts
>     985d844a5997 perf test stat tests: Fix for virtualized machines
>     fa99e8717a68 perf test stat: Update test expectations and events
>     8f36abf181c2 ASoC: dt-bindings: asahi-kasei,ak5558: Fix the supply na=
mes
>     f939f666ec02 ASoC: dt-bindings: asahi-kasei,ak4458: Fix the supply na=
mes
>     ce18fa88b154 ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedPr=
operties:false
>     655c9ba9915f SUNRPC: fix gss_auth kref leak in gss_alloc_msg error pa=
th
>     df10f23defff SUNRPC: auth_gss: fix memory leaks in XDR decoding error=
 paths
>     97503a852d3b ata: libata-scsi: refactor ata_scsi_translate()
>     51680e9a1680 ata: pata_ftide010: Fix some DMA timings
>     f18f70123962 ext4: use optimized mballoc scanning regardless of inode=
 format
>     4a79fde8db7e ext4: fix memory leak in ext4_ext_shift_extents()
>     93b2ebbbcb2e ext4: don't cache extent during splitting extent
>     c0155dee51b9 MIPS: Work around LLVM bug when gp is used as global reg=
ister variable
>     c941c268ad00 drm/amd/display: Use same max plane scaling limits for a=
ll 64 bpp formats
>     da0959402742 ASoC: rockchip: i2s-tdm: Use param rate if not provided =
by set_sysclk
>     5fed5f6c6a02 x86/hyperv: Fix error pointer dereference
>     1ee1d006c9fe btrfs: fix invalid leaf access in btrfs_quota_enable() i=
f ref key not found
>     b7bc182ec184 efi: Fix reservation of unaccepted memory table
>     3222c8020aeb s390/kexec: Make KEXEC_SIG available when CONFIG_MODULES=
=3Dn
>     9e5cb7e67fbd spi: wpcm-fiu: Fix potential NULL pointer dereference in=
 wpcm_fiu_probe()
>     a98d73dcc339 spi: wpcm-fiu: Simplify with dev_err_probe()
>     978137e940de spi: wpcm-fiu: Fix uninitialized res
>     87e463136302 spi: wpcm-fiu: Use devm_platform_ioremap_resource_byname=
()
>     971bf8e61e9b drm/amdkfd: Fix watch_id bounds checking in debug addres=
s watch v2
>     17e94789c216 drm/amdkfd: fix debug watchpoints for logical devices
>     e975148b2c29 ASoC: codecs: aw88261: Fix erroneous bitmask logic in Aw=
inic init
>     3a2f5a21285b drm/i915/acpi: free _DSM package when no connectors
>     29b2fbe3498d ASoC: fsl_xcvr: Revert fix missing lock in fsl_xcvr_mode=
_put()
>     f8a5426652bd drm/amdgpu: Fix memory leak in amdgpu_ras_init()
>     e87c73a80a12 drm/amdgpu: Fix memory leak in amdgpu_acpi_enumerate_xcc=
()
>     8dc6beca70f0 apparmor: fix aa_label to return state from compount and=
 component match
>     b25298e89a29 apparmor: fix invalid deref of rawdata when export_binar=
y is unset
>     dbbe0a2e3e4b apparmor: make label_match return a consistent value
>     0563743d3f70 apparmor: remove apply_modes_to_perms from label_match
>     32928c1749e8 apparmor: refcount the pdb
>     f89b657e1785 apparmor: provide separate audit messages for file and p=
olicy checks
>     e78e00cf9eba apparmor: use passed in gfp flags in aa_alloc_null()
>     1f736dfe27c8 apparmor: fix rlimit for posix cpu timers
>     24bb7d11dc30 apparmor: return -ENOMEM in unpack_perms_table upon allo=
c failure
>     0dc19bca2260 apparmor: fix NULL sock in aa_sock_file_perm
>     a4ff9e4f4ad4 net/mlx5: Fix multiport device check over light SFs
>     f94a0de7b9f3 bonding: alb: fix UAF in rlb_arp_recv during bond up/dow=
n
>     8bc48c4fb636 octeontx2-af: Fix default entries mcam entry action
>     3f483a90634d inet: move icmp_global_{credit,stamp} to a separate cach=
e line
>     c9141a794fdc cache: add __cacheline_group_{begin, end}_aligned() (+ c=
ouple more)
>     8dacf34eb427 netns-ipv4: reorganize netns_ipv4 fast path variables
>     1402ebe132a9 cache: enforce cache groups
>     4ec8a98b3dc3 tcp: Set pingpong threshold via sysctl
>     b4d5e97679bc tcp: defer regular ACK while processing socket backlog
>     22023ffad74c icmp: prevent possible overflow in icmp_global_allow()
>     b0da61015db2 icmp: icmp_msgs_per_sec and icmp_msgs_burst sysctls beco=
me per netns
>     e0987b6c3b34 icmp: move icmp_global.credit and icmp_global.stamp to p=
er netns storage
>     19c7d8ac5198 macvlan: observe an RCU grace period in macvlan_common_n=
ewlink() error path
>     b5c84070333a ping: annotate data-races in ping_lookup()
>     6b6b2fbd66d8 bpftool: Fix truncated netlink dumps
>     db4636748c22 ipv6: fix a race in ip6_sock_set_v6only()
>     7017745068a9 netfilter: nf_tables: fix use-after-free in nf_tables_ad=
dchain()
>     9464ca7a6e56 net: remove WARN_ON_ONCE when accessing forward path arr=
ay
>     60e921703943 netfilter: nf_conntrack_h323: don't pass uninitialised l=
3num value
>     f199874c199b selftests: forwarding: vxlan_bridge_1d_ipv6: fix test fa=
ilure with br_netfilter enabled
>     3c2b767a8ae2 selftests: forwarding: vxlan_bridge_1d: fix test failure=
 with br_netfilter enabled
>     d0fdad1bdd21 net: bridge: mcast: always update mdb_n_entries for vlan=
 contexts
>     779a9ae0ef22 net/rds: rds_sendmsg should not discard payload_len
>     88b0fced1bbb xen-netback: reject zero-queue configuration from guest
>     163d04897e57 net: usb: catc: enable basic endpoint checking
>     b067e6c7973b net: sparx5/lan969x: fix PTP clock max_adj value
>     bcc60ad129ae ipv6: Fix out-of-bound access in fib6_add_rt2node().
>     cc1b179f778f net: mscc: ocelot: add missing lock protection in ocelot=
_port_xmit_inj()
>     357a3544a385 net: mscc: ocelot: split xmit into FDMA and register inj=
ection paths
>     487fac2388ad net: mscc: ocelot: extract ocelot_xmit_timestamp() helpe=
r
>     d6f03772d9c0 net: sparx5/lan969x: fix DWRR cost max to match hardware=
 register width
>     9eefda7a03ef selftests: mlxsw: tc_restrictions: Fix test failure with=
 new iproute2
>     5c577ac939bc cpuidle: Skip governor when only one idle state is avail=
able
>     7bb9178df6f0 ACPI: PM: Add unused power resource quirk for THUNDEROBO=
T ZERO
>     d389943443c5 selftests/memfd: use IPC semaphore instead of SIGSTOP/SI=
GCONT
>     2efc98314a61 selftests/memfd: delete unused declarations
>     d809ee17c0d1 kbuild: Add objtool to top-level clean target
>     e156a104ba26 powercap: intel_rapl_tpmi: Remove FW_BUG from invalid ve=
rsion check
>     727992102836 ACPI: CPPC: Fix remaining for_each_possible_cpu() to use=
 online CPUs
>     a584b9d1059b fs/ntfs3: Fix slab-out-of-bounds read in DeleteIndexEntr=
yRoot
>     71c8b966ec56 fs/ntfs3: prevent infinite loops caused by the next vali=
d being the same
>     fb2d7c30d030 io_uring/cancel: de-unionize file and user_data in struc=
t io_cancel_data
>     533d495f15e4 dmaengine: fsl-edma: don't explicitly disable clocks in =
.remove()
>     592833ea0051 dmaengine: fsl-edma-main: Convert to platform remove cal=
lback returning void
>     a489f1fd52bc backlight: qcom-wled: Change PM8950 WLED configurations
>     82f2eaab2f94 backlight: qcom-wled: Support ovp values for PMI8994
>     97790c9b255d leds: qcom-lpg: Check the return value of regmap_bulk_wr=
ite()
>     99cc7352156c pinctrl: single: fix refcount leak in pcs_add_gpio_func(=
)
>     eccf17c0a801 pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups de=
finition
>     e8e960c3d23f iio: sca3000: Fix a resource leak in sca3000_probe()
>     43b6f69e1806 ovl: Fix uninit-value in ovl_fill_real
>     d26685b2d9ad pinctrl: equilibrium: Fix device node reference leak in =
pinbank_init()
>     4f531b1a5468 usb: bdc: fix sleep during atomic
>     c5bde5357e10 drivers: iio: mpu3050: use dev_err_probe for regulator r=
equest
>     29040d42d641 mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
>     fd1a3a0b98a9 mfd: simple-mfd-i2c: Keep compatible strings in alphabet=
ical order
>     d9e5d3e1924a mfd: simple-mfd-i2c: Add SpacemiT P1 support
>     07fb61ff35fd mfd: simple-mfd-i2c: Add compatible strings for Layersca=
pe QIXIS FPGA
>     b07aa526d053 mfd: simple-mfd-i2c: Add MAX77705 support
>     3ea01691738b mfd: arizona: Fix regulator resource leak on wm5102_clea=
r_write_sequencer() failure
>     9c858ef369bb Revert "mmc: rtsx_pci_sdmmc: increase power-on settling =
delay to 5ms"
>     b359ca27c589 coresight: etm3x: Fix cpulocked warning on cpuhp
>     2fad88d7760c watchdog: starfive-wdt: Fix PM reference leak in probe e=
rror path
>     7281a0c907cc iio: pressure: mprls0025pa: fix scan_type struct
>     6dd1e95cc554 mmc: rtsx_pci_sdmmc: increase power-on settling delay to=
 5ms
>     24ec8015beca serial: SH_SCI: improve "DMA support" prompt
>     c233e1e81873 serial: imx: change SERIAL_IMX_CONSOLE to bool
>     65f2c608096d staging: greybus: lights: avoid NULL deref
>     e230aee60444 dma: dma-axi-dmac: fix SW cyclic transfers
>     6be32baf6541 dmaengine: mediatek: uart-apdma: Fix above 4G addressing=
 TX/RX
>     06c8ed283635 clk: mediatek: Fix error handling in runtime PM setup
>     547ae2f17349 clk: qcom: gfx3d: add parent to parent request map
>     bb5de8aca640 clk: qcom: dispcc-sdm845: Enable parents for pixel clock=
s
>     ae56e2c27f6d clk: Move clk_{save,restore}_context() to COMMON_CLK sec=
tion
>     d81b51c8a7ed clk: qcom: gcc-ipq5018: flag sleep clock as critical
>     048fbee3e431 clk: qcom: gcc-msm8917: Remove ALWAYS_ON flag from cpp_g=
dsc
>     df1c437bfca4 clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from cpp_g=
dsc
>     915e7579855e clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use shar=
ed_floor_ops
>     d31b1b143819 clk: qcom: gcc-sdx75: Update the SDCC RCGs to use shared=
_floor_ops
>     45a013dabc5f clk: qcom: gcc-sm8450: Update the SDCC RCGs to use share=
d_floor_ops
>     ac003c1a80d9 clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM=
 SoCs
>     1e1664eb6f24 clk: qcom: rcg2: compute 2d using duty fraction directly
>     8cb92d27454e clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
>     3e5349e54113 fbdev: au1200fb: Fix a memory leak in au1200fb_drv_probe=
()
>     68dae7b64c31 fbdev: of_display_timing: Fix device node reference leak=
 in of_get_display_timings()
>     ca81f7811dfe tracing: Remove duplicate ENABLE_EVENT_STR and DISABLE_E=
VENT_STR macros
>     7e6556e9329b tracing: Properly process error handling in event_hist_t=
rigger_parse()
>     aa6e847e2795 fs/nfs: Fix readdir slow-start regression
>     c1f244f7868c nvdimm: virtio_pmem: serialize flush requests
>     25d623f0d77c scsi: csiostor: Fix dereference of null pointer rn
>     94a6c85a68bc scsi: ufs: host: mediatek: Require CONFIG_PM
>     fdf1188cfa80 scsi: smartpqi: Fix memory leak in pqi_report_phys_luns(=
)
>     8e3d91135417 pNFS: fix a missing wake up while waiting on NFS_LAYOUT_=
DRAIN
>     34276d267742 RDMA/uverbs: Add __GFP_NOWARN to ib_uverbs_unmarshall_re=
cv() kmalloc
>     685163733ed1 power: supply: qcom_battmgr: Recognize "LiP" as lithium-=
polymer
>     d2a6ca4c0748 mtd: spinand: Fix kernel doc
>     9fbbd62436ce mtd: parsers: ofpart: fix OF node refcount leak in parse=
_fixed_partitions()
>     5f1a84bb4a95 cxl: Fix premature commit_end increment on decoder commi=
t failure
>     db830aea65e4 RDMA/core: add rdma_rw_max_sge() helper for SQ sizing
>     6faf28106ea1 svcrdma: Reduce the number of rdma_rw contexts per-QP
>     63a45e2a1264 svcrdma: Increase the per-transport rw_ctx count
>     46ccddede7be svcrdma: Clean up comment in svc_rdma_accept()
>     4965711d22a0 svcrdma: Remove queue-shortening warnings
>     91cb7ff68604 RDMA/core: Fix a couple of obvious typos in comments
>     756c93d6df7c RDMA/rxe: Fix race condition in QP timer handlers
>     bf1feed1a788 RDMA/uverbs: Validate wqe_size before using it in ib_uve=
rbs_post_send
>     0f5e62ea5c43 mtd: parsers: Fix memory leak in mtd_parser_tplink_safel=
oader_parse()
>     1733d168099e crypto: ccp - Send PSP_CMD_TEE_RING_DESTROY when PSP_CMD=
_TEE_RING_INIT fails
>     2abf05a122cf crypto: ccp - Factor out ring destroy handling to a help=
er
>     b2e7e269aba9 crypto: ccp - Move direct access to some PSP registers o=
ut of TEE
>     54541017ac6a crypto: ccp - Add an S4 restore flow
>     21f422a86ded mtd: rawnand: cadence: Fix return type of CDMA send-and-=
wait helper
>     bc779d426ef1 tools/power/x86/intel-speed-select: Fix file descriptor =
leak in isolate_cpus()
>     26793db60925 RDMA/rxe: Fix double free in rxe_srq_from_init
>     9a0323f5e54e RDMA/rtrs-srv: fix SG mapping
>     86183153c299 power: supply: wm97xx: Fix NULL pointer dereference in p=
ower_supply_changed()
>     3af85f239648 power: supply: bq27xxx: fix wrong errno when bus ops are=
 unsupported
>     7ac6501b587c power: reset: nvmem-reboot-mode: respect cell size for n=
vmem_cell_write
>     2078830c32d1 power: supply: sbs-battery: Fix use-after-free in power_=
supply_changed()
>     af261f218a76 power: supply: rt9455: Fix use-after-free in power_suppl=
y_changed()
>     77ea437faa4c power: supply: goldfish: Fix use-after-free in power_sup=
ply_changed()
>     cbb9b07f88a9 power: supply: cpcap-battery: Fix use-after-free in powe=
r_supply_changed()
>     0de95d29d847 power: supply: bq25980: Fix use-after-free in power_supp=
ly_changed()
>     cb5c743936ed power: supply: bq256xx: Fix use-after-free in power_supp=
ly_changed()
>     697bb5dc0cb4 power: supply: act8945a: Fix use-after-free in power_sup=
ply_changed()
>     f50433f2603d power: supply: ab8500: Fix use-after-free in power_suppl=
y_changed()
>     2ad50784c9eb RDMA/hns: Notify ULP of remaining soft-WCs during reset
>     70a5eb757ace RDMA/hns: Fix WQ_MEM_RECLAIM warning
>     2fb573fa9d71 IB/cache: update gid cache on client reregister event
>     04b41f1d0e33 RDMA/rtrs: server: remove dead code
>     d858a1d814d3 octeontx2-pf: Unregister devlink on probe failure
>     320b54651a59 ionic: Rate limit unknown xcvr type messages
>     69042a930eae octeon_ep: ensure dbell BADDR updation
>     664355e6f130 octeon_ep: set backpressure watermark for RX queues
>     dc4d11c5f316 octeon_ep: disable per ring interrupts
>     2c33c53a9c8c octeon_ep: support Octeon CN10K devices
>     a40e276b9696 octeon_ep: restructured interrupt handlers
>     77c641b3bd4e octeon_ep: support to fetch firmware info
>     331e2b705163 serial: caif: fix use-after-free in caif_serial ldisc_cl=
ose()
>     2c1f59005da9 xfrm: fix ip_rt_bug race in icmp_route_lookup reverse pa=
th
>     d621dd67a72d net: Switch to skb_dstref_steal/skb_dstref_restore for i=
p_route_input callers
>     31ca4fbf56d1 net: Add skb_dstref_steal and skb_dstref_restore
>     dea1465394ff net: sunhme: Fix sbus regression
>     e3f80666c273 net: atm: fix crash due to unvalidated vcc pointer in si=
gd_send()
>     e131aac543cd smb: client: correct value for smbd_max_fragmented_recv_=
size
>     0e64bd46a04a procfs: fix missing RCU protection when reading real_par=
ent in do_task_stat()
>     6dc10494cfe2 net: hns3: fix double free issue for tx spare buffer
>     44b2256b17f1 PCI: Add ACS quirk for Pericom PI7C9X2G404 switches [12d=
8:b404]
>     f1535d56fc3f netfilter: nft_set_rbtree: check for partial overlaps in=
 anonymous sets
>     f7eb1903c6e0 netfilter: nft_counter: fix reset of counters on 32bit a=
rchs
>     cfe35cb86256 netfilter: nft_set_hash: fix get operation on big endian
>     77eef9f2eef0 nfc: hci: shdlc: Stop timers and work before freeing con=
text
>     db76b75ede38 inet: RAW sockets using IPPROTO_RAW MUST drop incoming I=
CMP
>     43f4661e9b2c bonding: only set speed/duplex to unknown, if getting sp=
eed failed
>     8b5ed7c5417b octeontx2-af: Fix PF driver crash with kexec kernel boot=
ing
>     cf5967514735 mptcp: fix receive space timestamp initialization
>     2622f355e621 of: unittest: fix possible null-pointer dereferences in =
of_unittest_property_copy()
>     e7c1e60802d8 ucount: check for CAP_SYS_RESOURCE using ns_capable_noau=
dit()
>     7dc4778ee848 ipc: don't audit capability check in ipc_permissions()
>     2c80b0974047 PCI/ACPI: Restrict program_hpx_type2() to AER bits
>     89db6475c0b4 PCI: Add defines for bridge window indexing
>     82bd7f9d08ce PCI: Add PCIE_MSG_CODE_ASSERT_INTx message macros
>     1f5438cb5d78 PCI: Log bridge info when first enumerating bridge
>     f49c44723a70 PCI: Log bridge windows conditionally
>     988b8b98103c PCI: Supply bridge device, not secondary bus, to read wi=
ndow details
>     7fd6672a1bb0 PCI: Move pci_read_bridge_windows() below individual win=
dow accessors
>     a79a3d1fd32c PCI: Initialize RCB from pci_configure_device()
>     a7c08278f2d0 wifi: ath10k: sdio: add missing lock protection in ath10=
k_sdio_fw_crashed_dump()
>     62c2290dc976 tcp: tcp_tx_timestamp() must look at the rtx queue
>     d3b7ffa90f61 fat: avoid parent link count underflow in rmdir
>     243f71ed873f nfsd: never defer requests during idmap lookup
>     0114244ec49a dm: use bio_clone_blkg_association
>     c93f23375d8c iommu/vt-d: Flush cache for PASID table before using it
>     bff7ac6b98fa PCI: Mark 3ware-9650SA Root Port Extended Tags as broken
>     af0f0d30fd02 kallsyms/ftrace: set module buildid in ftrace_mod_addres=
s_lookup()
>     ecb0af907733 module: add helper function for reading module_buildid()
>     767f1a8c8483 netfilter: nf_conncount: fix tracking of connections fro=
m localhost
>     abaa1508d5db netfilter: nft_compat: add more restrictions on netlink =
attributes
>     0792ad077d77 netfilter: nf_conncount: increase the connection clean u=
p limit to 64
>     d12e9e90632c netfilter: nf_conncount: make nf_conncount_gc_list() to =
disable BH
>     5802782366ba netfilter: nf_tables: reset table validation state on ab=
ort
>     4d7a05da767e wifi: cfg80211: stop NAN and P2P in cfg80211_leave
>     11f832532440 mctp i2c: initialise event handler read bytes
>     f03666259d22 net: mctp-i2c: fix duplicate reception of old data
>     37ccd48cf35f quota: fix livelock between quotactl and freeze_super
>     96ac80ce22bc PCI/portdrv: Fix potential resource leak
>     cf7e6dbb51a7 PCI: Do not attempt to set ExtTag for VFs
>     a4176432d41e Documentation: tracing: Add PCI tracepoint documentation
>     60b896647d88 Documentation: trace: Refactor toctree
>     b2f972293451 docs: fix WARNING document not included in any toctree
>     bd43a6e85779 Documentation: tracing: Add ring-buffer mapping
>     baa42b756d18 PCI/P2PDMA: Release per-CPU pgmap ref when vm_insert_pag=
e() fails
>     d8e7624e2113 PCI/PM: Avoid redundant delays on D3hot->D3cold
>     63d3556c9a8e Documentation: PCI: endpoint: Fix ntb/vntb copy & paste =
errors
>     24c190a5a24e PCI: mediatek: Fix IRQ domain leak when MSI allocation f=
ails
>     f448acd86835 Revert "hwmon: (ibmpex) fix use-after-free in high/low s=
tore"
>     1ae5fd122398 spi: tools: Add include folder to .gitignore
>     169ae51f31b0 platform/chrome: cros_ec_lightbar: Fix response size ini=
tialization
>     e3311645c7c1 media: uvcvideo: Fix allocation for small frame sizes
>     01fe5a26ccc6 platform/chrome: cros_typec_switch: Don't touch struct f=
wnode_handle::dev
>     0347548ccf07 drm/msm/a2xx: fix pixel shader start on A225
>     661152ffb0f2 media: ccs: Accommodate C-PHY into the calculation
>     e7815709bc97 drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
>     33acf9a4d6eb HID: playstation: Add missing check for input_ff_create_=
memless
>     f0a6e4b27bad regulator: core: move supply check earlier in set_machin=
e_constraints()
>     2d5b17e8364b drm/msm/disp/dpu: add merge3d support for sc7280
>     83d3d9ec347a drm/amdgpu: Use explicit VCN instance 0 in SR-IOV init
>     f721f873d3e1 ASoC: nau8821: Fixup nau8821_enable_jack_detect()
>     88a6bed89eb8 ASoC: nau8821: Avoid unnecessary blocking in IRQ handler
>     e19f5b5d1059 ASoC: nau8821: Consistently clear interrupts before unma=
sking
>     1c7ee23dfcd1 smack: /smack/doi: accept previously used values
>     661d87242dd6 smack: /smack/doi must be > 0
>     34bacb3cc343 workqueue: Process rescuer work items one-by-one using a=
 cursor
>     c906c9d81fdf workqueue: Only assign rescuer work when really needed
>     c17f947a6fca workqueue: Factor out assign_rescuer_work()
>     e3b15841172e arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions
>     4ffe98b89c9c arm64: dts: qcom: sdm845-db845c: specify power for WiFi =
CH1
>     c77d1b2f5e51 arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
>     1895ad99349e arm64: dts: amlogic: g12: assign the MMC A signal clock
>     44cd81bbb21b arm64: dts: amlogic: g12: assign the MMC B and C signal =
clocks
>     6a47c69a8bba arm64: dts: amlogic: gx: assign the MMC signal clocks
>     59f3138d11cc arm64: dts: amlogic: axg: assign the MMC signal clocks
>     716c8ebe0409 arm: dts: lpc32xx: add clocks property to Motor Control =
PWM device tree node
>     8461f646f68a ARM: dts: lpc32xx: Set motor PWM #pwm-cells property val=
ue to 3 cells
>     87a1f93986aa powerpc/eeh: fix recursive pci_lock_rescan_remove lockin=
g in EEH event handling
>     06195456c4e4 soc: mediatek: svs: Fix memory leak in svs_enable_debug_=
write()
>     993d41578772 soc: qcom: cmd-db: Use devm_memremap() to fix memory lea=
k in cmd_db_dev_probe
>     c43e0a0353e5 powerpc/uaccess: Move barrier_nospec() out of allow_read=
_{from/write}_user()
>     ac2c85d2a2f6 ARM: dts: allwinner: sun5i-a13-utoo-p66: delete "power-g=
pios" property
>     dc62cf0814fa arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as=
 boot-on
>     1aeb4ed95c3f arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply b=
oot-on
>     93aaa53ecf20 arm64: dts: qcom: sdm630: fix gpu_speed_bin size
>     e15f1e18cdf4 clk: qcom: Return correct error code in qcom_cc_probe_by=
_index()
>     458f7417fae0 arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control=
 settings
>     063898a3f9ac EDAC/i5400: Fix snprintf() limit calculation in calculat=
e_dimm_size()
>     e37f5e05b5bc EDAC/i5000: Fix snprintf() size calculation in calculate=
_dimm_size()
>     8afa17757873 soc: qcom: smem: handle ENOMEM error during probe
>     cff0ef043e16 pstore/ram: fix buffer overflow in persistent_ram_save_o=
ld()
>     8ad5577b2d4a sched/rt: Skip currently executing CPU in rto_next_cpu()
>     322154c3981e mfd: wm8350-core: Use IRQF_ONESHOT
>     3db9471b23f5 EDAC/altera: Remove IRQF_ONESHOT
>     adb69cc223d7 scsi: efct: Use IRQF_ONESHOT and default primary handler
>     ddc34a1b8550 bpf: Fix bpf_xdp_store_bytes proto for read-only arg
>     74081d6c1da1 crypto: hisilicon/trng - support tfms sharing the device
>     260a9e382996 crypto: hisilicon/trng - modifying the order of header f=
iles
>     9681044e45c9 bpf, sockmap: Fix FIONREAD for sockmap
>     acaf1ea47bbf bpf, sockmap: Fix incorrect copied_seq calculation
>     7111701a09cc hrtimer: Fix trace oddity
>     33a30bf9e0d4 crypto: hisilicon/sec2 - support skcipher/aead fallback =
for hardware queue unavailable
>     6eae58af0c31 crypto: hisilicon/zip - adjust the way to obtain the req=
 in the callback function
>     ab8b2eaf7add crypto: hisilicon/zip - remove zlib and gzip
>     70b2f4fc1ede crypto: hisilicon/zip - support deflate algorithm
>     0aa430f4661d crypto: octeontx - fix dma_free_coherent() size
>     53e97a309cc3 crypto: cavium - fix dma_free_coherent() size
>     2b757fea9f4f ARM: VDSO: Patch out __vdso_clock_getres() if unavailabl=
e
>     e1767524765e libbpf: Fix OOB read in btf_dump_get_bitfield_value
>     542bf32cf757 selftests/bpf: veristat: fix printing order in output_st=
ats()
>     6e6abc72accf crypto: qat - fix warning on adf_pfvf_pf_proto.c
>     abb6e07f46a7 s390/cio: Fix device lifecycle handling in css_alloc_sub=
channel()
>     27d7a35b8052 PM: sleep: wakeirq: harden dev_pm_clear_wake_irq() again=
st races
>     70e8af620210 perf: arm_spe: Properly set hw.state on failures
>     3deb7b6a2e31 PM: wakeup: Handle empty list in wakeup_sources_walk_sta=
rt()
>     d6749d0b8ddc Partial revert "x86/xen: fix balloon target initializati=
on for PVH dom0"
>     ef3b74d20f5e x86/xen: make some functions static
>     31cac6acf77e ublk: Validate SQE128 flag before accessing the cmd
>     8f3d79abdec0 iomap: fix submission side handling of completion side e=
rrors
>     597ec9e7f5cc md/raid10: fix any_working flag handling in raid10_sync_=
request
>     72b2db83705b cpuidle: governors: menu: Always check timers with tick =
stopped
>     0add3e6f91aa cpuidle: menu: Cleanup after loadavg removal
>     ca762fa01f64 io_uring/sync: validate passed in offset
>     f2cf475d23b8 ACPICA: Fix NULL pointer dereference in acpi_ev_address_=
space_dispatch()
>     9cc9efa703f0 xen/virtio: Don't use grant-dma-ops when running as Dom0
>     7425453ea16d smb: client: fix potential UAF and double free in smb2_o=
pen_file()
>     e3d1fd084319 btrfs: fix block_group_tree dirty_list corruption
>     46fb7ee9f852 btrfs: qgroup: return correct error when deleting qgroup=
 relation item
>     a51cff9be046 tpm: st33zp24: Fix missing cleanup on get_burstcount() e=
rror
>     948966e546f2 tpm: tpm_i2c_infineon: Fix locality leak on get_burstcou=
nt() failure
>     20ac431e02dc i3c: dw: Initialize spinlock to avoid upsetting lockdep
>     d87268326b27 gfs2: Fix use-after-free in iomap inline data write path
>     4991b13cc9f1 gfs2: Add metapath_dibh helper
>     7e3b7a47867a gfs2: Retries missing in gfs2_{rename,exchange}
>     b68be2b8b564 i3c: master: Update hot-join flag only on success
>     5560116126da fs: add <linux/init_task.h> for 'init_fs'
>     4b2a0a4e9428 i3c: Move device name assignment after i3c_bus_init
>     e2647d540bea audit: move the compat_xxx_class[] extern declarations t=
o audit_arch.h
>     979c708e6c9d rcu: Fix rcu_read_unlock() deadloop due to softirq
>     dffd52d0d14e rcu: Remove local_irq_save/restore() in rcu_preempt_defe=
rred_qs_handler()
>     3ccd035ef99d rcu: Refactor expedited handling check in rcu_read_unloc=
k_special()
>     6cc7a424a39a rcu/exp: Move expedited kthread worker creation function=
s above rcutree_prepare_cpu()
>     cb9eaff659dd rcu: s/boost_kthread_mutex/kthread_mutex
>     7b57ada854b3 hfsplus: return error when node already exists in hfs_bn=
ode_create
>     2e000d8a5306 auxdisplay: arm-charlcd: fix release_mem_region() size
>     a6a3e4af1099 RDMA/umad: Reject negative data_len in ib_umad_write
>     ffba40b67663 RDMA/siw: Fix potential NULL pointer dereference in head=
er processing
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
>  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
>  3 files changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recip=
es-kernel/linux/linux-yocto-rt_6.6.bb
> index 8685e5cbf6..8250679ed0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> @@ -14,13 +14,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to linux-yocto-rt to enable it")
>  }
> =20
> -SRCREV_machine ?=3D "c45743dc8dc2ddfbe7bd165997e1f7cf887fa6b7"
> -SRCREV_meta ?=3D "45f69741c733e066ed1a12b6025e347e5cd6063e"
> +SRCREV_machine ?=3D "8751b899ea5af349e8570e8985365290efa5e7d6"
> +SRCREV_meta ?=3D "fdd48963e673d657f0df21b4b1fb6b18dbaa96bc"
> =20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBRAN=
CH};name=3Dmachine;protocol=3Dhttps \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps"
> =20
> -LINUX_VERSION ?=3D "6.6.127"
> +LINUX_VERSION ?=3D "6.6.129"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-tiny_6.6.bb
> index d6a9afdf17..bd4a10b564 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> @@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
>  # CVE exclusions
>  include recipes-kernel/linux/cve-exclusion_6.6.inc
> =20
> -LINUX_VERSION ?=3D "6.6.127"
> +LINUX_VERSION ?=3D "6.6.129"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> =20
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
> @@ -17,8 +17,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
> =20
> -SRCREV_machine ?=3D "8247922ff493e4fef938ce36562cac9c0cce86aa"
> -SRCREV_meta ?=3D "45f69741c733e066ed1a12b6025e347e5cd6063e"
> +SRCREV_machine ?=3D "d82c6cc64c037058c6bfd630f2d2604a38684c7d"
> +SRCREV_meta ?=3D "fdd48963e673d657f0df21b4b1fb6b18dbaa96bc"
> =20
>  PV =3D "${LINUX_VERSION}+git"
> =20
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.6.bb
> index 92ad6afa3a..58a72979c5 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> @@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?=3D "v6.6/standard/base"
>  KBRANCH:qemuloongarch64  ?=3D "v6.6/standard/base"
>  KBRANCH:qemumips64 ?=3D "v6.6/standard/mti-malta64"
> =20
> -SRCREV_machine:qemuarm ?=3D "aa66687c1abe2afe2ee6c00c36bfaaf3d5d9636c"
> -SRCREV_machine:qemuarm64 ?=3D "cf88783fdb92901d9d228afb7d700c6575742f1b"
> -SRCREV_machine:qemuloongarch64 ?=3D "70af2998be31b72a111de67966b7816b3d5=
4d472"
> -SRCREV_machine:qemumips ?=3D "cbd6f9a670486dcd83ef0f8b90a75b2b7b44b447"
> -SRCREV_machine:qemuppc ?=3D "bce75aa765505d7db3bb1bfefb5d3f524a1a5b64"
> -SRCREV_machine:qemuriscv64 ?=3D "70af2998be31b72a111de67966b7816b3d54d47=
2"
> -SRCREV_machine:qemuriscv32 ?=3D "70af2998be31b72a111de67966b7816b3d54d47=
2"
> -SRCREV_machine:qemux86 ?=3D "70af2998be31b72a111de67966b7816b3d54d472"
> -SRCREV_machine:qemux86-64 ?=3D "70af2998be31b72a111de67966b7816b3d54d472=
"
> -SRCREV_machine:qemumips64 ?=3D "4cc6d51a6f63436a37c3ba4ea2da93c7fd3240b4=
"
> -SRCREV_machine ?=3D "70af2998be31b72a111de67966b7816b3d54d472"
> -SRCREV_meta ?=3D "45f69741c733e066ed1a12b6025e347e5cd6063e"
> +SRCREV_machine:qemuarm ?=3D "539bf858552c12417a449646d0cad5e53e038aa0"
> +SRCREV_machine:qemuarm64 ?=3D "e4153b3c5bff6c503990c35826d84a034d2d7a33"
> +SRCREV_machine:qemuloongarch64 ?=3D "3dbf485808fc7be82368f70f385fead9735=
b5904"
> +SRCREV_machine:qemumips ?=3D "d5da07b097555f20280b2484da875c93f1494d48"
> +SRCREV_machine:qemuppc ?=3D "9434ddc68ebc90e9336d4cc6f642aa82c0da023c"
> +SRCREV_machine:qemuriscv64 ?=3D "3dbf485808fc7be82368f70f385fead9735b590=
4"
> +SRCREV_machine:qemuriscv32 ?=3D "3dbf485808fc7be82368f70f385fead9735b590=
4"
> +SRCREV_machine:qemux86 ?=3D "3dbf485808fc7be82368f70f385fead9735b5904"
> +SRCREV_machine:qemux86-64 ?=3D "3dbf485808fc7be82368f70f385fead9735b5904=
"
> +SRCREV_machine:qemumips64 ?=3D "e6f498c7aa6909c17b90b50267d1577ddc19c0d6=
"
> +SRCREV_machine ?=3D "3dbf485808fc7be82368f70f385fead9735b5904"
> +SRCREV_meta ?=3D "fdd48963e673d657f0df21b4b1fb6b18dbaa96bc"
> =20
>  # set your preferred provider of linux-yocto to 'linux-yocto-upstream', =
and you'll
>  # get the <version>/base branch, which is pure upstream -stable, and the=
 same
>  # meta SRCREV as the linux-yocto-standard builds. Select your version us=
ing the
>  # normal PREFERRED_VERSION settings.
>  BBCLASSEXTEND =3D "devupstream:target"
> -SRCREV_machine:class-devupstream ?=3D "7a137e9bfa0e1919555d60f9dc0c05a7a=
5ba75d0"
> +SRCREV_machine:class-devupstream ?=3D "4fc00fe35d46b4fc8dac2eb543a0e3d44=
bb15f47"
>  PN:class-devupstream =3D "linux-yocto-upstream"
>  KBRANCH:class-devupstream =3D "v6.6/base"
> =20
> @@ -44,7 +44,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git=
;name=3Dmachine;branch=3D${KBRA
>             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;na=
me=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
> -LINUX_VERSION ?=3D "6.6.127"
> +LINUX_VERSION ?=3D "6.6.129"
> =20
>  PV =3D "${LINUX_VERSION}+git"
> =20


--=20
Yoann Congal
Smile ECS


