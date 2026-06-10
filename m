Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3C8CD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 17:56:44 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27159.1781114195869711529
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 10:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aReBZ3vE;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8423efd76c8so4569013b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 10:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781114195; cv=none;
        d=google.com; s=arc-20240605;
        b=XYxMNRaYTHghbtEad91Blgrm8HCnD08cCQAJkFELxonW+aMKkbWFIslXqDYXprDRdw
         7GlLzV8JvpDgWjEV8y/a5h2obGWdolvXA5rZ/RcVej8HBPDXSJKYvaYi4gEMnFzEBYLP
         gSDUYWuJRETz4SQuSEJeJPkgod1Vzv7upaq6tKRqr3IZGL0AeLat2qOafsHp/ZcElyyZ
         JAzRDKWWgRDRzMNNk6tSw5LlcSI2oaV8vssgZBbJFaDqR9QZlzTBgZ2m9yIlJSuT6Qqw
         Jo8wwEjwZS8IkUz6CJ6718LhyXmYwsjoGqeR1hErmctoNhyWh1mMMApP/UxSAuWO4heP
         tkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tu5drS/E7935YWpSC2eyVDLIBDlglyacKTodQRp52Yw=;
        fh=fGmv3Qnfn4CIVfhEfK2kKU8KS+Pi41HJriPcP3YwyDo=;
        b=KwZJQmmOjxYYn+WyJHVul+Gj4WGHg+Ebm1abdS4oczK4J+qB99wfwa61ZvC7womqiw
         jtog99kE7y9vdPXORrDNJH3P/oU+O4PKbGyQodyQ9PMpJeGDJqC73nsqI5/qoKA9Qq+D
         UsIfu63orHA3dkGVxnSqI8SwWcYCHwUIAjuO8vpUCumalBlEtoPfFLQU/WP9PTH9kaJJ
         X4fhqKUpleTweOttZq7kiDwh+diqQIqRRpgvCcBIr46nJH0DTSeWQSPYe/S0a6pe7KMJ
         d2Fuh4hVga4FPumfB9m1ATd5WfgdjCzepnUm0Kaut+0S/e2bR+jnu8tjwDA2lNJ0/F4n
         7Q7w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781114195; x=1781718995; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tu5drS/E7935YWpSC2eyVDLIBDlglyacKTodQRp52Yw=;
        b=aReBZ3vEIwp2VPoVCL4mY6GiaIfYZoLZGCrmWcAXG71QUE2YGE9ljhWTEPfEX/B40g
         aAlLGnFea0bEkg+Ht3M3N3PlBiXVcGIxFQAkxBhuajzHN4WA0aUnHRZKnLzBZKEi/wxd
         NK4sMMdhekBK6gw67hhf26Bbf5LezUB/CtZ8vVSuVaBoqUZKQEvr7cHqo4IjOKqXTpVP
         UTC9op5nk2bL3ZxEZwM2O6Tie5jXGwPctxKqAw/bdmqlcN0NquP7xI4L1w7Rv39Y8evn
         iOSJ0RG8UAHmNReyuvkJ/JsDBebN2gWa0YhWSkrmfBjzFCzhLA+cj50935vbzz3hpDVH
         J2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114195; x=1781718995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tu5drS/E7935YWpSC2eyVDLIBDlglyacKTodQRp52Yw=;
        b=KFs2E0bMyBDGDu9Z6xkRUeSsWqrsVJIgjOs74PSQGKA2V4GApcPrXbPaAIH3EVdzGG
         W/9SamNrW6ko5/raTrvjbvR3Wff6eDjXfVUhntQYfnzgWQXZVD3+JSLxpUGJ0tz0YRyf
         Hkg47OKjyrhzfzHyReLqlxHybgEBTyxcCP56MuPQCauJ04Ud8WNDiUH5+DKp3MgEKyot
         ZeusemO9od3KPCszoD2nTrcXVZo++kOLL8ttMVN4Ha5H+v2X7pW6ZuzdXe1TQZI5LVSg
         A4YxIDECXk8EVyOWzuF4HXIhysIMEf+gu5Y8MmPOhTuYZmUM9K9v3GgI0XLbralIaKfa
         UbQA==
X-Forwarded-Encrypted: i=1; AFNElJ8WYNNZgEB9hlUHOp4l8NSdAFLFevQaeatd6sJ10Ie5pu+8oq/JhBgpiHvg03DeZIbyrsadMNlK/JsHcw8Gm3QaBA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzt/dn4syxmHdcPpifo7of3ID/vgCcCoRLkI2C3nltz4mnhcn86
	RS/PXiyDzvv1JTzdX1ukqIjj2Fv558iYZ5MTAqDR6qdekBakIPirZhIejkgsE4LEDal2q+86nEl
	ywadASlfaXxxLfQFEVl3oN2dh7VBqkx4=
X-Gm-Gg: Acq92OHOLkgqI0C43xt3cdyqUJhuOErxbvI1KRlMCnKK29dmGoLd2mLzUE64mdJUnL+
	ABRS8nKSrhnY/NHgZzOP2uaYrnJW3eYfZbKEazLpqchupQ5YyWcoJTgAE20MFFTNm5EpnFrP1/g
	17Q5bTG24PAJQewc/12NXwDwaoEo5OHBPsiRyRjTSfDEpNgOwtUQRTj4g3Be9U1k3JX0WuIexta
	83upGLZRCVpxD5FRRkgLYyUDpUxCftd7Qv9yDqph0MOlTS99xDe4Urd/ZN50r8DjdlKV6oa1vbc
	xants4Asoy+pQDb6S0ePT7HuBIQCqXD7XQ+1gsAKg+PpQdx17GGE9Fgv5RmtfKBn4fFrKRQq0tx
	YyBfD11GKBXNHn71JuyXX0IpnpWQ1NTwLtThb
X-Received: by 2002:a05:6a00:1485:b0:842:4982:81c with SMTP id
 d2e1a72fcca58-84330b3cdd0mr373955b3a.20.1781114194546; Wed, 10 Jun 2026
 10:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260610165008.1870552-1-bruce.ashfield@gmail.com> <DJ5JEECQGTXS.3DLVUENBUV0HU@smile.fr>
In-Reply-To: <DJ5JEECQGTXS.3DLVUENBUV0HU@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 10 Jun 2026 13:56:22 -0400
X-Gm-Features: AVVi8CfJl064D6HYxCBbgwncA8voR6IcbnQBFDJgE8AMZfv6AyVojOTochTvn4c
Message-ID: <CADkTA4NFUmsbewJ1RL+xoYtefyNO0Z2Y0o8kXVbxdDByqH-iXQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][scarthgap][PATCH 01/11] linux-yocto/6.6: update
 to v6.6.129
To: Yoann Congal <yoann.congal@smile.fr>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ded5430653e9f662"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 17:56:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238392

--000000000000ded5430653e9f662
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 1:14=E2=80=AFPM Yoann Congal <yoann.congal@smile.fr=
> wrote:

> On Wed Jun 10, 2026 at 6:49 PM CEST, Bruce Ashfield via
> lists.openembedded.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Updating linux-yocto/6.6 to the latest korg -stable release that
> comprises
> > the following commits:
>
> Hi Bruce,
>
> Are there changes from the previous series (6.6.129-6.6.135)?
>
> There was some autobuilder failures:
> https://lore.kernel.org/all/DIBGIUMGTRU4.ZOHIWWT1QG6I@smile.fr/


I missed that before. I'll have a look at it next week and resend as
required.

Bruce



>
>
> Thanks!
>
> >
> >     fc00fe35d46 Linux 6.6.129
> >     acf7c8972775 Revert "x86/kexec: add a sanity check on previous
> kernel's ima kexec buffer"
> >     682d8e2f892b Linux 6.6.128
> >     0ac0e02183c5 arm64: Fix sampling the "stable" virtual counter in
> preemptible section
> >     18845fb30921 drm/i915/wakeref: clean up INTEL_WAKEREF_PUT_* flag
> macros
> >     fe418ef21efd NTB: ntb_transport: Fix too small buffer for
> debugfs_name
> >     1cdff5d564fe tracing: Wake up poll waiters for hist files when
> removing an event
> >     e4e5026252b4 tracing: Fix checking of freed trace_event_file for
> hist files
> >     ad058a4317db net: nfc: nci: Fix parameter validation for packet dat=
a
> >     dc99b25ed4f7 arm64: Force the use of CNTVCT_EL0 in __delay()
> >     ad3640895956 x86/kexec: Copy ACPI root pointer address from config
> table
> >     9c735a7d98c9 net/sched: act_skbedit: fix divide-by-zero in
> tcf_skbedit_hash()
> >     1e300c33ef3c net: ethernet: ec_bhf: Fix dma_free_coherent() dma
> handle
> >     6ccfcad1b582 ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 15X
> M6501RR
> >     c854ab481ece cifs: some missing initializations on replay
> >     6a3ce8c8ad80 fbcon: Remove struct fbcon_display.inverse
> >     b6de6d481cc2 fbdev: ffb: fix corrupted video output on Sun FFB1
> >     3ed019654234 fbdev: of: display_timing: fix refcount leak in
> of_get_display_timings()
> >     e8c5d5f6cd66 fbdev: vt8500lcdfb: fix missing dma_free_coherent()
> >     a785c4e2a999 fbcon: check return value of con2fb_acquire_newinfo()
> >     632d233cf2e6 ipv6: ioam: fix heap buffer overflow in
> __ioam6_fill_trace_data()
> >     e075ec9b08f8 atm: fore200e: fix use-after-free in tasklets during
> device removal
> >     9f8ad199844c net: intel: fix PCI device ID conflict between i40e an=
d
> ipw2200
> >     6eb571a37631 io_uring/filetable: clamp alloc_hint to the configured
> alloc range
> >     0f4dcba31bf4 tracing: Fix to set write permission to per-cpu
> buffer_size_kb
> >     ec4445ae9e58 net: macb: Fix tx/rx malfunction after phy link down
> and up
> >     013ac469596a octeontx2-af: CGX: fix bitmap leaks
> >     0f85a9655445 net: wan/fsl_ucc_hdlc: Fix dma_free_coherent() in
> uhdlc_memclean()
> >     63afc078bba6 net: ethernet: marvell: skge: remove incorrect
> conflicting PCI ID
> >     710657d3d31f LoongArch: Disable instrumentation for setup_ptwalker(=
)
> >     6868bd64dc90 LoongArch: Guard percpu handler under !CONFIG_PREEMPT_=
RT
> >     a50371c6ad99 LoongArch: Prefer top-down allocation after
> arch_mem_init()
> >     bb1a54f7f011 LoongArch: Make cpumask_of_node() robust against
> NUMA_NO_NODE
> >     9efa154609cd ceph: supply snapshot context in
> ceph_zero_partial_object()
> >     103e9d1d43e6 MIPS: rb532: Fix MMIO UART resource registration
> >     953953abb66e cifs: Fix locking usage for tcon fields
> >     cc3f83b6fb37 staging: rtl8723bs: fix null dereference in find_netwo=
rk
> >     369d369ed08f parisc: kernel: replace kfree() with put_device() in
> create_tree_node()
> >     a19b61fdb958 PCI: Fix pci_slot_trylock() error handling
> >     65e794574069 net: cpsw_new: Fix unnecessary netdev unregistration i=
n
> cpsw_probe() error path
> >     4857c37c7ba9 drm/amdkfd: Fix out-of-bounds write in
> kfd_event_page_set()
> >     7a4fd19c567f tipc: fix RCU dereference race in tipc_aead_users_dec(=
)
> >     8e875cf8851b mtd: rawnand: pl353: Fix software ECC support
> >     f5da4c24aa6d usb: dwc2: fix resume failure if dr_mode is host
> >     76c1123ffccf usb: dwc3: gadget: Move vbus draw to workqueue context
> >     aa8d68d97c7f scsi: ufs: core: Flush exception handling work when RP=
M
> level is zero
> >     d3e837e11ee9 perf/arm-cmn: Reject unsupported hardware configuratio=
ns
> >     9bd98d088f47 remoteproc: imx_rproc: Fix invalid loaded resource
> table detection
> >     d99a08c2b4d5 btrfs: continue trimming remaining devices on failure
> >     41a09925ec68 arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=3D=
y
> >     1047ca2d8169 PCI/IOV: Fix race between SR-IOV enable/disable and
> hotplug
> >     639265296fe6 Revert "PCI/IOV: Add PCI rescan-remove locking when
> enabling/disabling SR-IOV"
> >     cfccd3b8c51b kexec: derive purgatory entry from symbol
> >     bb273b68c171 ocfs2: fix reflink preserve cleanup issue
> >     649c2e853608 rapidio: replace rio_free_net() with kfree() in
> rio_scan_alloc_net()
> >     81c44a4bc168 mm/highmem: fix __kmap_to_page() build error
> >     1eabfd2c437b iio: gyro: itg3200: Fix unchecked return value in
> read_raw
> >     9d0ca11258e7 powerpc/smp: Add check for kcalloc() failure in
> parse_thread_groups()
> >     442f5db91317 tools: Fix bitfield dependency failure
> >     e4709950acd4 dm mpath: make pg_init_delay_msecs settable
> >     542dd6da35eb bus: fsl-mc: fix an error handling in
> fsl_mc_device_add()
> >     65f5a17b6d56 usb: gadget: tegra-xudc: Add handling for
> BLCG_COREPLL_PWRDN
> >     22e460b6333a x86/kexec: add a sanity check on previous kernel's ima
> kexec buffer
> >     57c4fd0f4b02 nvmem: Drop OF node reference on nvmem_add_one_cell()
> failure
> >     13c1f31f777c nfsd: fix return error code for nfsd_map_name_to_[ug]i=
d
> >     d92b8fac294b md/bitmap: fix GPF in write_page caused by resize race
> >     142b1bba3299 PCI: endpoint: Fix swapped parameters in
> pci_{primary/secondary}_epc_epf_unlink() functions
> >     708e20c66b27 KVM: x86: Add SRCU protection for reading PDPTRs in
> __get_sregs2()
> >     a6f660d62bc1 xfs: fix remote xattr valuelblk check
> >     38613c01f69e xfs: fix freemap adjustments when adding xattrs to lea=
f
> blocks
> >     ffaf5c99d0f8 xfs: delete attr leaf freemap entries when empty
> >     e2e7c275f557 mfd: core: Add locking around 'mfd_of_node_list'
> >     01aed2f1d7cb iommu/vt-d: Flush dev-IOTLB only when PCIe device is
> accessible in scalable mode
> >     a5b1ddbe31f4 media: verisilicon: AV1: Fix tile info buffer size
> >     8be53110395e xfs: mark data structures corrupt on EIO and ENODATA
> >     297bb8b1db60 selftests/mm/charge_reserved_hugetlb: drop mount size
> for hugetlbfs
> >     aa5f25d55cda mm, page_alloc, thp: prevent reclaim for __GFP_THISNOD=
E
> THP allocations
> >     8dcff1979381 drm: of: drm_of_panel_bridge_remove(): fix device_node
> leak
> >     52920a853381 media: venus: vdec: restrict EOS addr quirk to IRIS2
> only
> >     225f2221b422 media: venus: vdec: fix error state assignment for zer=
o
> bytesused
> >     272d44fa7bce arm64: dts: rockchip: Do not enable hdmi_sound node on
> Pinebook Pro
> >     ed36f6ae0039 dm-unstripe: fix mapping bug when there are multiple
> targets in a table
> >     fb49f209995f dm-integrity: fix recalculation in bitmap mode
> >     de7934627cc4 s390/pci: Handle futile config accesses of disabled
> devices directly
> >     1c7c87cf18da clk: tegra: tegra124-emc: Fix potential memory leak in
> tegra124_clk_register_emc()
> >     0f0809bfe4fa media: i2c: ov01a10: Fix digital gain range
> >     85cc6574f21b clk: clk-apple-nco: Add "apple,t8103-nco" compatible
> >     3880e331b0b3 KVM: nSVM: Always use vmcb01 in VMLOAD/VMSAVE emulatio=
n
> >     e113339cc7d2 soc: ti: pruss: Fix double free in pruss_clk_mux_setup=
()
> >     d451bf970a0c soc: ti: k3-socinfo: Fix regmap leak on probe failure
> >     7daf279c674d dm: clear cloned request bio pointer when last clone
> bio completes
> >     2d10a3dad8d6 dm-integrity: fix a typo in the code for write/discard
> race
> >     d03a29cb36d6 media: i2c: ov5647: use our own mutex for the ctrl loc=
k
> >     089625cccd7e media: i2c: ov5647: Fix PIXEL_RATE value for VGA mode
> >     c146483bad46 media: i2c: ov5647: Sensor should report RAW color spa=
ce
> >     e5f4aad2627d media: i2c: ov5647: Correct minimum VBLANK value
> >     1f413dac763a media: i2c: ov5647: Correct pixel array offset
> >     cabd025182cf media: i2c: ov5647: Initialize subdev before controls
> >     c9af1818387f media: ccs: Avoid possible division by zero
> >     0c074e80921f media: qcom: camss: vfe: Fix out-of-bounds access in
> vfe_isr_reg_update()
> >     8de39720e7a3 media: i2c: ov01a10: Fix test-pattern disabling
> >     a14a3cef8017 media: i2c: ov01a10: Add missing v4l2_subdev_cleanup()
> calls
> >     567a03fe8d08 media: i2c: ov01a10: Fix analogue gain range
> >     e2f6d78dc3a8 media: i2c: ov01a10: Fix reported pixel-rate value
> >     bb2b049f75f1 media: i2c: ov01a10: Fix the horizontal flip control
> >     ccb92def042a media: i2c/tw9906: Fix potential memory leak in
> tw9906_probe()
> >     9cb9eca33d20 media: i2c/tw9903: Fix potential memory leak in
> tw9903_probe()
> >     046c5db6bbba media: cx25821: Add missing unmap in
> snd_cx25821_hw_params()
> >     544215cc37d0 media: cx23885: Add missing unmap in
> snd_cx23885_hw_params()
> >     10ab64f8efc2 media: cx88: Add missing unmap in snd_cx88_hw_params()
> >     27c508f61963 media: radio-keene: fix memory leak in error path
> >     dd8508820246 media: verisilicon: AV1: Set IDR flag for intra_only
> frame type
> >     8305902ac038 arm64: dts: apple: t8112-j473: Keep the HDMI port
> powered on
> >     b74bf7d0d01f HID: logitech-hidpp: Check maxfield in
> hidpp_get_report_length()
> >     3f1b21cc67a1 HID: prodikeys: Check presence of pm->input_ep82
> >     243e1165eb03 HID: magicmouse: Do not crash on missing msc->input
> >     449004434e1f HID: hid-pl: handle probe errors
> >     cad7442ff23b arm64: Disable branch profiling for all arm64 code
> >     deb8f6dfd31d KVM: nSVM: Remove a user-triggerable WARN on
> nested_svm_load_cr3() succeeding
> >     275e15fd1cf7 ARM: omap2: Fix reference count leaks in
> omap_control_init()
> >     b44eb959159f media: verisilicon: AV1: Fix tx mode bit setting
> >     8ad7e6ea46a9 media: verisilicon: AV1: Fix enable cdef computation
> >     564fd3a63efc media: mtk-mdp: Fix a reference leak bug in
> mtk_mdp_remove()
> >     12cafc15d246 media: mtk-mdp: Fix error handling in probe function
> >     637510cb5bed media: mediatek: encoder: Fix uninitialized scalar
> variable issue
> >     031f2adc1499 dm-verity: correctly handle dm_bufio_client_create()
> failure
> >     a9ddc035050a fpga: dfl: use subsys_initcall to allow built-in
> drivers to be added
> >     d6f5aed42760 ASoC: SOF: ipc4-control: Keep the payload size up to
> date
> >     e1dd7092fa8f ASoC: SOF: ipc4-control: Use the correct size for
> scontrol->ipc_control_data
> >     59fe643f21b9 ASoC: SOF: ipc4-topology: Correct the allocation size
> for bytes controls
> >     3a5a4b066329 ASoC: SOF: ipc4-control: If there is no data do not
> send bytes update
> >     955e2d6e5e0a clk: renesas: rzg2l: Select correct div round macro
> >     a4be3b90ba9d clk: renesas: rzg2l: Fix intin variable size
> >     90c8353f4718 rpmsg: core: fix race in driver_override_show() and us=
e
> core helper
> >     7ef82863d422 netfilter: nf_conntrack_h323: fix OOB read in
> decode_choice()
> >     b690635d4719 dpaa2-switch: validate num_ifs to prevent out-of-bound=
s
> write
> >     9ac6aebef4b4 net: consume xmit errors of GSO frames
> >     175881094756 net/mlx5: Fix missing devlink lock in SRIOV enable
> error path
> >     54fb0577ebe7 net/mlx5: DR, Fix circular locking dependency in dump
> >     b324327ff6f4 RDMA/umem: Fix double dma_buf_unpin in failure path
> >     35854ed5c40b net: usb: pegasus: enable basic endpoint checking
> >     df001db47708 RDMA/efa: Fix typo in efa_alloc_mr()
> >     337d7b4112a4 net: wan: farsync: Fix use-after-free bugs caused by
> unfinished tasklets
> >     52d469319ced RDMA/core: Fix stale RoCE GIDs during netdev events at
> registration
> >     0b7d596da5de tipc: fix duplicate publication key in
> tipc_service_insert_publ()
> >     481ea39b342c Bluetooth: L2CAP: Fix missing key size check for
> L2CAP_LE_CONN_REQ
> >     efcdb4da480c Bluetooth: L2CAP: Fix not checking output MTU is
> acceptable on L2CAP_ECRED_CONN_REQ
> >     1a138921ce56 Bluetooth: L2CAP: Fix response to L2CAP_ECRED_CONN_REQ
> >     1d93a369b5aa Bluetooth: hci_qca: Cleanup on all setup failures
> >     7247f340f824 Bluetooth: L2CAP: Fix invalid response to
> L2CAP_ECRED_RECONF_REQ
> >     2983b39f8c0d Remove WARN_ALL_UNSEEDED_RANDOM kernel config option
> >     1f40fde29349 wifi: cfg80211: wext: fix IGTK key ID off-by-one
> >     322437972f0a net: ethernet: xscale: Check for PTP support properly
> >     854f5997df49 net: ixp4xx_eth: convert to ndo_hwtstamp_get() and
> ndo_hwtstamp_set()
> >     19f359963ae8 net: usb: lan78xx: scan all MDIO addresses on LAN7801
> >     ef9b10a02050 net: usb: kaweth: remove TX queue manipulation in
> kaweth_set_rx_mode
> >     166801e49a5b xfrm: always flush state and policy upon
> NETDEV_UNREGISTER event
> >     56d5c0557e53 ipmi: ipmb: initialise event handler read bytes
> >     f13e4fe961a7 xfrm: skip templates check for packet offload tunnel
> mode
> >     719918fc88df xfrm6: fix uninitialized saddr in xfrm6_get_saddr()
> >     d0559d07afab ntb: ntb_hw_switchtec: Fix shift-out-of-bounds for 0 m=
w
> lut
> >     85c9daa1f831 ntb: ntb_hw_switchtec: Fix array-index-out-of-bounds
> access
> >     a4557dc20df4 rtc: zynqmp: correct frequency value
> >     61bd8787c605 drm/amd/display: Remove conditional for shaper 3DLUT
> power-on
> >     0b284a7ce311 btrfs: replace BUG() with error handling in
> __btrfs_balance()
> >     8995fc0e00b3 ALSA: usb-audio: Add sanity check for OOB writes at
> silencing
> >     6a997eb80644 drm/radeon: Add HAINAN clock adjustment
> >     5b9af0342402 drm/amdgpu: Add HAINAN clock adjustment
> >     c26bde6301f2 ALSA: usb-audio: Update the number of packets properly
> at receiving
> >     d2e92247b24a drm/amdgpu: Adjust usleep_range in fence wait
> >     068dee782c8c drm/amd/display: Avoid updating surface with the same
> surface under MPO
> >     1a7f1116c7f8 ARM: 9467/1: mm: Don't use %pK through printk
> >     44373b1e9c12 include: uapi: netfilter_bridge.h: Cover for musl libc
> >     9f33e83c8393 thermal: int340x: Fix sysfs group leak on DLVR
> registration failure
> >     e1dc45d97975 libceph: define and enforce CEPH_MAX_KEY_LEN
> >     a87a445ac1d9 ceph: supply snapshot context in ceph_uninline_data()
> >     2f5c626ea792 fs/ntfs3: avoid calling run_get_entry() when run =3D=
=3D
> NULL in ntfs_read_run_nb_ra()
> >     ad0d779cdc26 fs/ntfs3: drop preallocated clusters for sparse and
> compressed files
> >     8d8c70b57dbe fs: ntfs3: fix infinite loop triggered by zero-sized
> ATTR_LIST
> >     af839013c70a fs: ntfs3: fix infinite loop in attr_load_runs_range o=
n
> inconsistent metadata
> >     68e32694be23 fs: ntfs3: check return value of indx_find to avoid
> infinite loop
> >     6dedf0369f2a MIPS: Loongson: Make cpumask_of_node() robust against
> NUMA_NO_NODE
> >     da08099d5f7a iio: magnetometer: Remove IRQF_ONESHOT
> >     53f2152b48d5 iio: Use IRQF_NO_THREAD
> >     be5465701341 Revert "mfd: da9052-spi: Change read-mask to write-mas=
k"
> >     dc3bc979814b phy: fsl-imx8mq-usb: disable bind/unbind platform
> driver feature
> >     afb941338c8e phy: mvebu-cp110-utmi: fix dr_mode property read from
> dts
> >     d476130e53d3 watchdog: imx7ulp_wdt: handle the nowayout option
> >     0883ddd583ed binder: don't use %pK through printk
> >     1d7120244b54 fix it87_wdt early reboot by reporting running timer
> >     4ff5ab3e7141 serial: 8250: 8250_omap.c: Clear DMA RX running status
> only after DMA termination is done
> >     8311bb40698b staging: rtl8723bs: fix memory leak on failure path
> >     03a2f7f9864c misc: eeprom: Fix EWEN/EWDS/ERAL commands for 93xx56
> and 93xx66
> >     ece3722169ba misc: bcm_vk: Fix possible null-pointer dereferences i=
n
> bcm_vk_read()
> >     c219c20cc357 dmaengine: stm32-mdma: initialize m2m_hw_period and cc=
r
> to fix warnings
> >     f89324e2e09d dmaengine: sun6i: Choose appropriate burst length unde=
r
> maxburst
> >     f9305dda5015 fpga: of-fpga-region: Fail if any bridge is missing
> >     b2bbcaa36c1a usb: typec: ucsi: psy: Fix voltage and current max for
> non-Fixed PDOs
> >     32ccda4895ba serial: 8250_dw: handle clock enable errors in
> runtime_resume
> >     52b42c24750a staging: rtl8723bs: fix missing status update on
> sdio_alloc_irq() failure
> >     cd496527efa8 soundwire: dmi-quirks: add mapping for Avell B.ON (OEM
> rebranded of NUC15)
> >     3be7beef4a05 m68k: nommu: fix memmove() with differently aligned sr=
c
> and dest for 68000
> >     6ce681cf8082 clk: microchip: core: correct return value on
> *_get_parent()
> >     e2809ad08252 mailbox: sprd: clear delivery flag before handling TX
> done
> >     4c4679b31b9d remoteproc: mediatek: Break lock dependency to
> `prepare_lock`
> >     332fb842181e mailbox: sprd: mask interrupts that are not handled
> >     17ee46882b3e mailbox: imx: Skip the suspend flag for i.MX7ULP
> >     51edcbd17c8d mailbox: pcc: Remove spurious IRQF_ONESHOT usage
> >     f720e653aa1a remoteproc: imx_dsp_rproc: Skip RP_MBOX_SUSPEND_SYSTEM
> when mailbox TX channel is uninitialized
> >     cb6c4aa73491 tracing: Fix false sharing in hwlat get_sample()
> >     9566c87101b2 vhost: fix caching attributes of MMIO regions by
> setting them explicitly
> >     f1bf5ebd5fda scsi: buslogic: Reduce stack usage
> >     d16337560750 hisi_acc_vfio_pci: update status after RAS error
> >     559e227b1df7 ata: libata: avoid long timeouts on hot-unplugged SATA
> DAS
> >     55de264a4d32 RDMA/rtrs-clt: For conn rejection use actual err numbe=
r
> >     3819890d6ab2 nfc: nxp-nci: remove interrupt trigger type
> >     392e3d44841d myri10ge: avoid uninitialized variable use
> >     6e2a6100ac5b PCI: Mark Nvidia GB10 to avoid bus reset
> >     846b226065fe PCI: Add ACS quirk for Qualcomm Hamoa & Glymur
> >     ec494c0260bf PCI: Enable ACS after configuring IOMMU for OF platfor=
ms
> >     a2376e912723 PCI: Fix pci_slot_lock () device locking
> >     f5ea62163a78 PCI: Mark ASM1164 SATA controller to avoid bus reset
> >     391200c274e9 net/rds: Clear reconnect pending bit
> >     f713dcd2ce83 vmw_vsock: bypass false-positive Wnonnull warning with
> gcc-16
> >     7a8acafd45a9 net: usb: sr9700: remove code to drive nonexistent
> multicast filter
> >     87465580215c wifi: ath10k: fix lock protection in
> ath10k_wmi_event_peer_sta_ps_state_chg()
> >     b015d4c70c9a wifi: rtw89: pci: restore LDO setting after device
> resume
> >     d9b549b6951b octeontx2-af: Workaround SQM/PSE stalls by disabling
> sticky
> >     37f4e6804d98 Bluetooth: btusb: Add device ID for Realtek RTL8761BU
> >     c051ef2f61f4 Bluetooth: btusb: Add new VID/PID for RTL8852CE
> >     07960da05c0d Bluetooth: hci_conn: use mod_delayed_work for active
> mode timeout
> >     c06dbfd954c9 Bluetooth: hci_conn: Set link_policy on incoming ACL
> connections
> >     9eaeba5600e5 ipv4: fib: Annotate access to struct fib_alias.fa_stat=
e.
> >     31d4bb68f436 wifi: iwlegacy: add missing mutex protection in
> il3945_store_measurement()
> >     941e3066441c wifi: iwlegacy: add missing mutex protection in
> il4965_store_tx_power()
> >     2ace7ac88cb0 net: hns3: extend HCLGE_FD_AD_QID to 11 bits
> >     d5cd3bb7794e ipv4: igmp: annotate data-races around idev->mr_maxdel=
ay
> >     ab2848d3783a gro: change the BUG_ON() in gro_pull_from_frag0()
> >     f0f729bdffb0 net/rds: No shortcut out of RDS_CONN_ERROR
> >     db62e9f44838 wifi: iwlwifi: mvm: check the validity of noa_len
> >     116bc0980e91 net: usb: r8152: fix transmit queue timeout
> >     f4bf64072c36 openrisc: define arch-specific version of nop()
> >     07a9b32eaae7 netfilter: xt_tcpmss: check remaining length before
> reading optlen
> >     89f50775d883 netfilter: nf_conntrack: Add allow_clash to generic
> protocol handler
> >     99c75e53cec0 ext4: mark group extend fast-commit ineligible
> >     0d5fcb063cda ext4: move ext4_percpu_param_init() before
> ext4_mb_init()
> >     83b074b69022 ext4: mark group add fast-commit ineligible
> >     46ed4e9c8d30 ipv6: exthdrs: annotate data-race over multiple sysctl
> >     55170230de66 ipv6: annotate data-races in
> ip6_multipath_hash_{policy,fields}()
> >     f73528f140f1 wifi: ath12k: fix preferred hardware mode calculation
> >     c5547727bd1c wifi: ath11k: add pm quirk for Thinkpad Z13/Z16 Gen1
> >     ddfe47664cc6 PCI: dw-rockchip: Disable BAR 0 and BAR 1 for Root Por=
t
> >     d880c9b73890 wifi: rtw89: wow: add reason codes for disassociation
> in WoWLAN mode
> >     f2f65b28d802 iommu/amd: move wait_on_sem() out of spinlock
> >     5bfb25495e39 wifi: libertas: fix WARNING in usb_tx_block
> >     9ff4843e6ea3 iommu/arm-smmu-v3: Improve CMDQ lock fairness and
> efficiency
> >     4f9e7ca933a9 dm: remove fake timeout to avoid leak request
> >     df379f57c2cd dm: replace -EEXIST with -EBUSY
> >     dd181178c245 wifi: rtw88: rtw8821cu: Add ID for Mercusys MU6H
> >     a96d161cfdb1 wifi: rtw88: 8822b: Avoid WARNING in
> rtw8822b_config_trx_mode()
> >     9fdce77e38c1 wifi: rtw88: fix DTIM period handling when
> conf->dtim_period is zero
> >     f70fcbc2ac7c jfs: nlink overflow in jfs_rename
> >     68f7fc769243 jfs: Add missing set_freezable() for freezable kthread
> >     34506cb119bb ALSA: usb-audio: Add iface reset and delay quirk for
> AB13X USB Audio
> >     8fb5c4c979ae modpost: Amend ppc64 save/restfpr symnames for -Os bui=
ld
> >     fecfe41f7ed0 ASoC: es8328: Add error unwind in resume
> >     18c67fb3750b hwmon: (f71882fg) Add F81968 support
> >     f8ddbe303419 hwmon: (nct6775) Add ASUS Pro WS WRX90E-SAGE SE
> >     2d48f60307e6 ASoC: codecs: max98390: Check return value of
> devm_gpiod_get_optional() in max98390_i2c_probe()
> >     3383271464b7 spi: spi-mem: Protect dirmap_create() with
> spi_mem_access_start/end
> >     19513daa8d13 ASoC: sunxi: sun50i-dmic: Add missing check for
> devm_regmap_init_mmio
> >     d1b6536ac20d gpio: aspeed-sgpio: Change the macro to support
> deferred probe
> >     98c0e07dc7d6 ALSA: hda/conexant: Add headset mic fix for MECHREVO
> Wujie 15X Pro
> >     49afc2e5bfae HID: elecom: Add support for ELECOM HUGE Plus M-HT1MRB=
K
> >     4df1e6252d07 HID: multitouch: add eGalaxTouch EXC3188 support
> >     876bb1eabdb1 media: rkisp1: Fix filter mode register configuration
> >     ac2d898da509 drm/atmel-hlcdc: fix use-after-free of drm_crtc_commit
> after release
> >     80b8b0df370f drm/atmel-hlcdc: don't reject the commit if the src
> rect has fractional parts
> >     ec40702029b0 drm/atmel-hlcdc: fix memory leak from the
> atomic_destroy_state callback
> >     af67b50311e7 virt: vbox: uapi: Mark inner unions in packed structs
> as packed
> >     34eae7e0ab61 hyper-v: Mark inner union in hv_kvp_exchg_msg_value as
> packed
> >     bbfaa5761f58 drm: Account property blob allocations to memcg
> >     e97de3e924b3 drm/amdkfd: Fix GART PTE for non-4K pagesize in
> svm_migrate_gart_map()
> >     30aaed311f97 media: v4l2-async: Fix error handling on steps after
> finding a match
> >     4010e596d23c media: cx25821: Fix a resource leak in
> cx25821_dev_setup()
> >     33af366211ee media: solo6x10: Check for out of bounds chip_id
> >     4ba5c7a1aade media: pvrusb2: fix URB leak in pvr2_send_request_ex
> >     45d9a0cd1b88 media: adv7180: fix frame interval in progressive mode
> >     f5a5a824f0ac media: amphion: Clear last_buffer_dequeued flag for
> DEC_CMD_START
> >     81bc7d5e7897 spi: spi-mem: Limit octal DTR constraints to octal DTR
> situations
> >     822530fb85d8 ASoC: wm8962: Don't report a microphone if it's shorte=
d
> to ground on plug
> >     21f6e02a1910 ASoC: wm8962: Add WM8962_ADC_MONOMIX to "3D
> Coefficients" mask
> >     04184bcb50f5 HID: apple: Add "SONiX KN85 Keyboard" to the list of
> non-apple keyboards
> >     55462d16cb9c drm/amdgpu: avoid a warning in timedout job handler
> >     40e0b938db37 drm/amdgpu: add support for HDP IP version 6.1.1
> >     b0d35bc9c159 media: mediatek: vcodec: Don't try to decode 422/444 V=
P9
> >     38ef3e1e1e9b media: omap3isp: set initial format
> >     d490523d2374 media: omap3isp: isppreview: always clamp in
> preview_try_format()
> >     a9d1d7d27151 media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus fix=
es
> >     2663ef70c612 drm/v3d: Set DMA segment size to avoid debug warnings
> >     50e8aac244e7 spi: stm32: fix Overrun issue at < 8bpw
> >     8b971c21603a media: dvb-core: dmxdevfilter must always flush bufs
> >     b2a97f2259f6 spi-geni-qcom: use xfer->bits_per_word for can_dma()
> >     5d0814ad6654 spi-geni-qcom: initialize mode related registers to 0
> >     ac9a7c329a56 drm/display/dp_mst: Add protection against 0 vcpi
> >     afa0bfe1437d parisc: Prevent interrupts during reboot
> >     12535a5d5d64 arm64: tegra: smaug: Add usb-role-switch support
> >     1da904e84de6 pstore: ram_core: fix incorrect success return when
> vmap() fails
> >     a4345acbe390 char: tpm: cr50: Remove IRQF_ONESHOT
> >     3e656f767407 mailbox: bcm-ferxrm-mailbox: Use default primary handl=
er
> >     7b9394e49720 crypto: hisilicon/qm - move the barrier before writing
> to the mailbox register
> >     5f007c6acaa7 PCI/MSI: Unmap MSI-X region on error
> >     f557c206c32e clocksource/drivers/timer-integrator-ap: Add missing
> Kconfig dependency on OF
> >     6f113ab549b8 clocksource/drivers/sh_tmu: Always leave device runnin=
g
> after probe
> >     c8a34bceefbc bpf: verifier improvement in 32bit shift sign extensio=
n
> pattern
> >     47bbd0cb7db3 sparc: don't reference obsolete termio struct for TC*
> constants
> >     6aa04820dbfe sparc: Synchronize user stack on fork and clone
> >     648aa7ce0bd8 blk-mq-debugfs: add missing debugfs_mutex in
> blk_mq_debugfs_register_hctxs()
> >     9150176cbf71 xenbus: Use .freeze/.thaw to handle xenbus devices
> >     2050a5cff32c perf/cxlpmu: Replace IRQF_ONESHOT with IRQF_NO_THREAD
> >     84a17b7b292d s390/perf: Disable register readout on sampling events
> >     bafd4aa1908a cpufreq: dt-platdev: Block the driver from probing on
> more QC platforms
> >     a61c1bc84c4a md-cluster: fix NULL pointer dereference in
> process_metadata_update
> >     b4a0b646cc28 ACPICA: Abort AML bytecode execution when executing
> AML_FATAL_OP
> >     01e8751b37a3 ACPI: processor: Fix NULL-pointer dereference in
> acpi_processor_errata_piix4()
> >     64eb63f573f4 EFI/CPER: don't go past the ARM processor CPER record
> buffer
> >     e0ec99115e13 APEI/GHES: ensure that won't go past CPER allocated
> record
> >     5a9b1dda8481 EFI/CPER: don't dump the entire memory region
> >     6ea4b7bc2e7b x86/xen/pvh: Enable PAE mode for 32-bit guest only whe=
n
> CONFIG_X86_PAE is set
> >     30868a6a5238 rnbd-srv: Zero the rsp buffer before using it
> >     fd7e360845d3 arm64: Add support for TSV110 Spectre-BHB mitigation
> >     94ab05af1d96 perf/arm-cmn: Support CMN-600AE
> >     61cd0b287fb9 s390/purgatory: Add -Wno-default-const-init-unsafe to
> KBUILD_CFLAGS
> >     7823e09a68b5 tools/power cpupower: Reset errno before strtoull()
> >     93e8e3ee165a smb: client: prevent races in ->query_interfaces()
> >     e428670cfb29 gfs2: fiemap page fault fix
> >     048b58edc57d smb: client: add proper locking around
> ses->iface_last_update
> >     8b5dcfa97bf3 btrfs: handle user interrupt properly in btrfs_trim_fs=
()
> >     2bb588cede1c minix: Add required sanity checking to
> minix_check_superblock()
> >     43ccadb866de i3c: master: svc: Initialize 'dev' to NULL in
> svc_i3c_master_ibi_isr()
> >     de9affb698d5 hfsplus: pretend special inodes as regular files
> >     f5d27ad99fca audit: add missing syscalls to read class
> >     c1b6227555c5 fs/buffer: add alert in try_to_free_buffers() for
> folios without buffers
> >     bccd4ebbdac3 hfsplus: fix volume corruption issue for generic/498
> >     91e27bc79c3b audit: add fchmodat2() to change attributes class
> >     4bde6678bc54 rtc: interface: Alarm race handling should not discard
> preceding error
> >     4927e2d29b74 libperf build: Always place libperf includes first
> >     5cf6e76e4f4f libperf: Don't remove -g when EXTRA_CFLAGS are used
> >     66e9b70c64df libsubcmd: Fix null intersection case in exclude_cmds(=
)
> >     56042755b72f perf callchain: Fix srcline printing with inlines
> >     eddddf4ed7f6 perf unwind-libdw: Fix invalid reference counts
> >     985d844a5997 perf test stat tests: Fix for virtualized machines
> >     fa99e8717a68 perf test stat: Update test expectations and events
> >     8f36abf181c2 ASoC: dt-bindings: asahi-kasei,ak5558: Fix the supply
> names
> >     f939f666ec02 ASoC: dt-bindings: asahi-kasei,ak4458: Fix the supply
> names
> >     ce18fa88b154 ASoC: dt-bindings: asahi-kasei,ak4458: set
> unevaluatedProperties:false
> >     655c9ba9915f SUNRPC: fix gss_auth kref leak in gss_alloc_msg error
> path
> >     df10f23defff SUNRPC: auth_gss: fix memory leaks in XDR decoding
> error paths
> >     97503a852d3b ata: libata-scsi: refactor ata_scsi_translate()
> >     51680e9a1680 ata: pata_ftide010: Fix some DMA timings
> >     f18f70123962 ext4: use optimized mballoc scanning regardless of
> inode format
> >     4a79fde8db7e ext4: fix memory leak in ext4_ext_shift_extents()
> >     93b2ebbbcb2e ext4: don't cache extent during splitting extent
> >     c0155dee51b9 MIPS: Work around LLVM bug when gp is used as global
> register variable
> >     c941c268ad00 drm/amd/display: Use same max plane scaling limits for
> all 64 bpp formats
> >     da0959402742 ASoC: rockchip: i2s-tdm: Use param rate if not provide=
d
> by set_sysclk
> >     5fed5f6c6a02 x86/hyperv: Fix error pointer dereference
> >     1ee1d006c9fe btrfs: fix invalid leaf access in btrfs_quota_enable()
> if ref key not found
> >     b7bc182ec184 efi: Fix reservation of unaccepted memory table
> >     3222c8020aeb s390/kexec: Make KEXEC_SIG available when
> CONFIG_MODULES=3Dn
> >     9e5cb7e67fbd spi: wpcm-fiu: Fix potential NULL pointer dereference
> in wpcm_fiu_probe()
> >     a98d73dcc339 spi: wpcm-fiu: Simplify with dev_err_probe()
> >     978137e940de spi: wpcm-fiu: Fix uninitialized res
> >     87e463136302 spi: wpcm-fiu: Use
> devm_platform_ioremap_resource_byname()
> >     971bf8e61e9b drm/amdkfd: Fix watch_id bounds checking in debug
> address watch v2
> >     17e94789c216 drm/amdkfd: fix debug watchpoints for logical devices
> >     e975148b2c29 ASoC: codecs: aw88261: Fix erroneous bitmask logic in
> Awinic init
> >     3a2f5a21285b drm/i915/acpi: free _DSM package when no connectors
> >     29b2fbe3498d ASoC: fsl_xcvr: Revert fix missing lock in
> fsl_xcvr_mode_put()
> >     f8a5426652bd drm/amdgpu: Fix memory leak in amdgpu_ras_init()
> >     e87c73a80a12 drm/amdgpu: Fix memory leak in
> amdgpu_acpi_enumerate_xcc()
> >     8dc6beca70f0 apparmor: fix aa_label to return state from compount
> and component match
> >     b25298e89a29 apparmor: fix invalid deref of rawdata when
> export_binary is unset
> >     dbbe0a2e3e4b apparmor: make label_match return a consistent value
> >     0563743d3f70 apparmor: remove apply_modes_to_perms from label_match
> >     32928c1749e8 apparmor: refcount the pdb
> >     f89b657e1785 apparmor: provide separate audit messages for file and
> policy checks
> >     e78e00cf9eba apparmor: use passed in gfp flags in aa_alloc_null()
> >     1f736dfe27c8 apparmor: fix rlimit for posix cpu timers
> >     24bb7d11dc30 apparmor: return -ENOMEM in unpack_perms_table upon
> alloc failure
> >     0dc19bca2260 apparmor: fix NULL sock in aa_sock_file_perm
> >     a4ff9e4f4ad4 net/mlx5: Fix multiport device check over light SFs
> >     f94a0de7b9f3 bonding: alb: fix UAF in rlb_arp_recv during bond
> up/down
> >     8bc48c4fb636 octeontx2-af: Fix default entries mcam entry action
> >     3f483a90634d inet: move icmp_global_{credit,stamp} to a separate
> cache line
> >     c9141a794fdc cache: add __cacheline_group_{begin, end}_aligned() (+
> couple more)
> >     8dacf34eb427 netns-ipv4: reorganize netns_ipv4 fast path variables
> >     1402ebe132a9 cache: enforce cache groups
> >     4ec8a98b3dc3 tcp: Set pingpong threshold via sysctl
> >     b4d5e97679bc tcp: defer regular ACK while processing socket backlog
> >     22023ffad74c icmp: prevent possible overflow in icmp_global_allow()
> >     b0da61015db2 icmp: icmp_msgs_per_sec and icmp_msgs_burst sysctls
> become per netns
> >     e0987b6c3b34 icmp: move icmp_global.credit and icmp_global.stamp to
> per netns storage
> >     19c7d8ac5198 macvlan: observe an RCU grace period in
> macvlan_common_newlink() error path
> >     b5c84070333a ping: annotate data-races in ping_lookup()
> >     6b6b2fbd66d8 bpftool: Fix truncated netlink dumps
> >     db4636748c22 ipv6: fix a race in ip6_sock_set_v6only()
> >     7017745068a9 netfilter: nf_tables: fix use-after-free in
> nf_tables_addchain()
> >     9464ca7a6e56 net: remove WARN_ON_ONCE when accessing forward path
> array
> >     60e921703943 netfilter: nf_conntrack_h323: don't pass uninitialised
> l3num value
> >     f199874c199b selftests: forwarding: vxlan_bridge_1d_ipv6: fix test
> failure with br_netfilter enabled
> >     3c2b767a8ae2 selftests: forwarding: vxlan_bridge_1d: fix test
> failure with br_netfilter enabled
> >     d0fdad1bdd21 net: bridge: mcast: always update mdb_n_entries for
> vlan contexts
> >     779a9ae0ef22 net/rds: rds_sendmsg should not discard payload_len
> >     88b0fced1bbb xen-netback: reject zero-queue configuration from gues=
t
> >     163d04897e57 net: usb: catc: enable basic endpoint checking
> >     b067e6c7973b net: sparx5/lan969x: fix PTP clock max_adj value
> >     bcc60ad129ae ipv6: Fix out-of-bound access in fib6_add_rt2node().
> >     cc1b179f778f net: mscc: ocelot: add missing lock protection in
> ocelot_port_xmit_inj()
> >     357a3544a385 net: mscc: ocelot: split xmit into FDMA and register
> injection paths
> >     487fac2388ad net: mscc: ocelot: extract ocelot_xmit_timestamp()
> helper
> >     d6f03772d9c0 net: sparx5/lan969x: fix DWRR cost max to match
> hardware register width
> >     9eefda7a03ef selftests: mlxsw: tc_restrictions: Fix test failure
> with new iproute2
> >     5c577ac939bc cpuidle: Skip governor when only one idle state is
> available
> >     7bb9178df6f0 ACPI: PM: Add unused power resource quirk for
> THUNDEROBOT ZERO
> >     d389943443c5 selftests/memfd: use IPC semaphore instead of
> SIGSTOP/SIGCONT
> >     2efc98314a61 selftests/memfd: delete unused declarations
> >     d809ee17c0d1 kbuild: Add objtool to top-level clean target
> >     e156a104ba26 powercap: intel_rapl_tpmi: Remove FW_BUG from invalid
> version check
> >     727992102836 ACPI: CPPC: Fix remaining for_each_possible_cpu() to
> use online CPUs
> >     a584b9d1059b fs/ntfs3: Fix slab-out-of-bounds read in
> DeleteIndexEntryRoot
> >     71c8b966ec56 fs/ntfs3: prevent infinite loops caused by the next
> valid being the same
> >     fb2d7c30d030 io_uring/cancel: de-unionize file and user_data in
> struct io_cancel_data
> >     533d495f15e4 dmaengine: fsl-edma: don't explicitly disable clocks i=
n
> .remove()
> >     592833ea0051 dmaengine: fsl-edma-main: Convert to platform remove
> callback returning void
> >     a489f1fd52bc backlight: qcom-wled: Change PM8950 WLED configuration=
s
> >     82f2eaab2f94 backlight: qcom-wled: Support ovp values for PMI8994
> >     97790c9b255d leds: qcom-lpg: Check the return value of
> regmap_bulk_write()
> >     99cc7352156c pinctrl: single: fix refcount leak in
> pcs_add_gpio_func()
> >     eccf17c0a801 pinctrl: qcom: sm8250-lpass-lpi: Fix i2s2_data_groups
> definition
> >     e8e960c3d23f iio: sca3000: Fix a resource leak in sca3000_probe()
> >     43b6f69e1806 ovl: Fix uninit-value in ovl_fill_real
> >     d26685b2d9ad pinctrl: equilibrium: Fix device node reference leak i=
n
> pinbank_init()
> >     4f531b1a5468 usb: bdc: fix sleep during atomic
> >     c5bde5357e10 drivers: iio: mpu3050: use dev_err_probe for regulator
> request
> >     29040d42d641 mfd: simple-mfd-i2c: Add Delta TN48M CPLD support
> >     fd1a3a0b98a9 mfd: simple-mfd-i2c: Keep compatible strings in
> alphabetical order
> >     d9e5d3e1924a mfd: simple-mfd-i2c: Add SpacemiT P1 support
> >     07fb61ff35fd mfd: simple-mfd-i2c: Add compatible strings for
> Layerscape QIXIS FPGA
> >     b07aa526d053 mfd: simple-mfd-i2c: Add MAX77705 support
> >     3ea01691738b mfd: arizona: Fix regulator resource leak on
> wm5102_clear_write_sequencer() failure
> >     9c858ef369bb Revert "mmc: rtsx_pci_sdmmc: increase power-on settlin=
g
> delay to 5ms"
> >     b359ca27c589 coresight: etm3x: Fix cpulocked warning on cpuhp
> >     2fad88d7760c watchdog: starfive-wdt: Fix PM reference leak in probe
> error path
> >     7281a0c907cc iio: pressure: mprls0025pa: fix scan_type struct
> >     6dd1e95cc554 mmc: rtsx_pci_sdmmc: increase power-on settling delay
> to 5ms
> >     24ec8015beca serial: SH_SCI: improve "DMA support" prompt
> >     c233e1e81873 serial: imx: change SERIAL_IMX_CONSOLE to bool
> >     65f2c608096d staging: greybus: lights: avoid NULL deref
> >     e230aee60444 dma: dma-axi-dmac: fix SW cyclic transfers
> >     6be32baf6541 dmaengine: mediatek: uart-apdma: Fix above 4G
> addressing TX/RX
> >     06c8ed283635 clk: mediatek: Fix error handling in runtime PM setup
> >     547ae2f17349 clk: qcom: gfx3d: add parent to parent request map
> >     bb5de8aca640 clk: qcom: dispcc-sdm845: Enable parents for pixel
> clocks
> >     ae56e2c27f6d clk: Move clk_{save,restore}_context() to COMMON_CLK
> section
> >     d81b51c8a7ed clk: qcom: gcc-ipq5018: flag sleep clock as critical
> >     048fbee3e431 clk: qcom: gcc-msm8917: Remove ALWAYS_ON flag from
> cpp_gdsc
> >     df1c437bfca4 clk: qcom: gcc-msm8953: Remove ALWAYS_ON flag from
> cpp_gdsc
> >     915e7579855e clk: qcom: gcc-qdu1000: Update the SDCC RCGs to use
> shared_floor_ops
> >     d31b1b143819 clk: qcom: gcc-sdx75: Update the SDCC RCGs to use
> shared_floor_ops
> >     45a013dabc5f clk: qcom: gcc-sm8450: Update the SDCC RCGs to use
> shared_floor_ops
> >     ac003c1a80d9 clk: meson: gxbb: Limit the HDMI PLL OD to /4 on
> GXL/GXM SoCs
> >     1e1664eb6f24 clk: qcom: rcg2: compute 2d using duty fraction direct=
ly
> >     8cb92d27454e clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
> >     3e5349e54113 fbdev: au1200fb: Fix a memory leak in
> au1200fb_drv_probe()
> >     68dae7b64c31 fbdev: of_display_timing: Fix device node reference
> leak in of_get_display_timings()
> >     ca81f7811dfe tracing: Remove duplicate ENABLE_EVENT_STR and
> DISABLE_EVENT_STR macros
> >     7e6556e9329b tracing: Properly process error handling in
> event_hist_trigger_parse()
> >     aa6e847e2795 fs/nfs: Fix readdir slow-start regression
> >     c1f244f7868c nvdimm: virtio_pmem: serialize flush requests
> >     25d623f0d77c scsi: csiostor: Fix dereference of null pointer rn
> >     94a6c85a68bc scsi: ufs: host: mediatek: Require CONFIG_PM
> >     fdf1188cfa80 scsi: smartpqi: Fix memory leak in
> pqi_report_phys_luns()
> >     8e3d91135417 pNFS: fix a missing wake up while waiting on
> NFS_LAYOUT_DRAIN
> >     34276d267742 RDMA/uverbs: Add __GFP_NOWARN to
> ib_uverbs_unmarshall_recv() kmalloc
> >     685163733ed1 power: supply: qcom_battmgr: Recognize "LiP" as
> lithium-polymer
> >     d2a6ca4c0748 mtd: spinand: Fix kernel doc
> >     9fbbd62436ce mtd: parsers: ofpart: fix OF node refcount leak in
> parse_fixed_partitions()
> >     5f1a84bb4a95 cxl: Fix premature commit_end increment on decoder
> commit failure
> >     db830aea65e4 RDMA/core: add rdma_rw_max_sge() helper for SQ sizing
> >     6faf28106ea1 svcrdma: Reduce the number of rdma_rw contexts per-QP
> >     63a45e2a1264 svcrdma: Increase the per-transport rw_ctx count
> >     46ccddede7be svcrdma: Clean up comment in svc_rdma_accept()
> >     4965711d22a0 svcrdma: Remove queue-shortening warnings
> >     91cb7ff68604 RDMA/core: Fix a couple of obvious typos in comments
> >     756c93d6df7c RDMA/rxe: Fix race condition in QP timer handlers
> >     bf1feed1a788 RDMA/uverbs: Validate wqe_size before using it in
> ib_uverbs_post_send
> >     0f5e62ea5c43 mtd: parsers: Fix memory leak in
> mtd_parser_tplink_safeloader_parse()
> >     1733d168099e crypto: ccp - Send PSP_CMD_TEE_RING_DESTROY when
> PSP_CMD_TEE_RING_INIT fails
> >     2abf05a122cf crypto: ccp - Factor out ring destroy handling to a
> helper
> >     b2e7e269aba9 crypto: ccp - Move direct access to some PSP registers
> out of TEE
> >     54541017ac6a crypto: ccp - Add an S4 restore flow
> >     21f422a86ded mtd: rawnand: cadence: Fix return type of CDMA
> send-and-wait helper
> >     bc779d426ef1 tools/power/x86/intel-speed-select: Fix file descripto=
r
> leak in isolate_cpus()
> >     26793db60925 RDMA/rxe: Fix double free in rxe_srq_from_init
> >     9a0323f5e54e RDMA/rtrs-srv: fix SG mapping
> >     86183153c299 power: supply: wm97xx: Fix NULL pointer dereference in
> power_supply_changed()
> >     3af85f239648 power: supply: bq27xxx: fix wrong errno when bus ops
> are unsupported
> >     7ac6501b587c power: reset: nvmem-reboot-mode: respect cell size for
> nvmem_cell_write
> >     2078830c32d1 power: supply: sbs-battery: Fix use-after-free in
> power_supply_changed()
> >     af261f218a76 power: supply: rt9455: Fix use-after-free in
> power_supply_changed()
> >     77ea437faa4c power: supply: goldfish: Fix use-after-free in
> power_supply_changed()
> >     cbb9b07f88a9 power: supply: cpcap-battery: Fix use-after-free in
> power_supply_changed()
> >     0de95d29d847 power: supply: bq25980: Fix use-after-free in
> power_supply_changed()
> >     cb5c743936ed power: supply: bq256xx: Fix use-after-free in
> power_supply_changed()
> >     697bb5dc0cb4 power: supply: act8945a: Fix use-after-free in
> power_supply_changed()
> >     f50433f2603d power: supply: ab8500: Fix use-after-free in
> power_supply_changed()
> >     2ad50784c9eb RDMA/hns: Notify ULP of remaining soft-WCs during rese=
t
> >     70a5eb757ace RDMA/hns: Fix WQ_MEM_RECLAIM warning
> >     2fb573fa9d71 IB/cache: update gid cache on client reregister event
> >     04b41f1d0e33 RDMA/rtrs: server: remove dead code
> >     d858a1d814d3 octeontx2-pf: Unregister devlink on probe failure
> >     320b54651a59 ionic: Rate limit unknown xcvr type messages
> >     69042a930eae octeon_ep: ensure dbell BADDR updation
> >     664355e6f130 octeon_ep: set backpressure watermark for RX queues
> >     dc4d11c5f316 octeon_ep: disable per ring interrupts
> >     2c33c53a9c8c octeon_ep: support Octeon CN10K devices
> >     a40e276b9696 octeon_ep: restructured interrupt handlers
> >     77c641b3bd4e octeon_ep: support to fetch firmware info
> >     331e2b705163 serial: caif: fix use-after-free in caif_serial
> ldisc_close()
> >     2c1f59005da9 xfrm: fix ip_rt_bug race in icmp_route_lookup reverse
> path
> >     d621dd67a72d net: Switch to skb_dstref_steal/skb_dstref_restore for
> ip_route_input callers
> >     31ca4fbf56d1 net: Add skb_dstref_steal and skb_dstref_restore
> >     dea1465394ff net: sunhme: Fix sbus regression
> >     e3f80666c273 net: atm: fix crash due to unvalidated vcc pointer in
> sigd_send()
> >     e131aac543cd smb: client: correct value for
> smbd_max_fragmented_recv_size
> >     0e64bd46a04a procfs: fix missing RCU protection when reading
> real_parent in do_task_stat()
> >     6dc10494cfe2 net: hns3: fix double free issue for tx spare buffer
> >     44b2256b17f1 PCI: Add ACS quirk for Pericom PI7C9X2G404 switches
> [12d8:b404]
> >     f1535d56fc3f netfilter: nft_set_rbtree: check for partial overlaps
> in anonymous sets
> >     f7eb1903c6e0 netfilter: nft_counter: fix reset of counters on 32bit
> archs
> >     cfe35cb86256 netfilter: nft_set_hash: fix get operation on big endi=
an
> >     77eef9f2eef0 nfc: hci: shdlc: Stop timers and work before freeing
> context
> >     db76b75ede38 inet: RAW sockets using IPPROTO_RAW MUST drop incoming
> ICMP
> >     43f4661e9b2c bonding: only set speed/duplex to unknown, if getting
> speed failed
> >     8b5ed7c5417b octeontx2-af: Fix PF driver crash with kexec kernel
> booting
> >     cf5967514735 mptcp: fix receive space timestamp initialization
> >     2622f355e621 of: unittest: fix possible null-pointer dereferences i=
n
> of_unittest_property_copy()
> >     e7c1e60802d8 ucount: check for CAP_SYS_RESOURCE using
> ns_capable_noaudit()
> >     7dc4778ee848 ipc: don't audit capability check in ipc_permissions()
> >     2c80b0974047 PCI/ACPI: Restrict program_hpx_type2() to AER bits
> >     89db6475c0b4 PCI: Add defines for bridge window indexing
> >     82bd7f9d08ce PCI: Add PCIE_MSG_CODE_ASSERT_INTx message macros
> >     1f5438cb5d78 PCI: Log bridge info when first enumerating bridge
> >     f49c44723a70 PCI: Log bridge windows conditionally
> >     988b8b98103c PCI: Supply bridge device, not secondary bus, to read
> window details
> >     7fd6672a1bb0 PCI: Move pci_read_bridge_windows() below individual
> window accessors
> >     a79a3d1fd32c PCI: Initialize RCB from pci_configure_device()
> >     a7c08278f2d0 wifi: ath10k: sdio: add missing lock protection in
> ath10k_sdio_fw_crashed_dump()
> >     62c2290dc976 tcp: tcp_tx_timestamp() must look at the rtx queue
> >     d3b7ffa90f61 fat: avoid parent link count underflow in rmdir
> >     243f71ed873f nfsd: never defer requests during idmap lookup
> >     0114244ec49a dm: use bio_clone_blkg_association
> >     c93f23375d8c iommu/vt-d: Flush cache for PASID table before using i=
t
> >     bff7ac6b98fa PCI: Mark 3ware-9650SA Root Port Extended Tags as brok=
en
> >     af0f0d30fd02 kallsyms/ftrace: set module buildid in
> ftrace_mod_address_lookup()
> >     ecb0af907733 module: add helper function for reading module_buildid=
()
> >     767f1a8c8483 netfilter: nf_conncount: fix tracking of connections
> from localhost
> >     abaa1508d5db netfilter: nft_compat: add more restrictions on netlin=
k
> attributes
> >     0792ad077d77 netfilter: nf_conncount: increase the connection clean
> up limit to 64
> >     d12e9e90632c netfilter: nf_conncount: make nf_conncount_gc_list() t=
o
> disable BH
> >     5802782366ba netfilter: nf_tables: reset table validation state on
> abort
> >     4d7a05da767e wifi: cfg80211: stop NAN and P2P in cfg80211_leave
> >     11f832532440 mctp i2c: initialise event handler read bytes
> >     f03666259d22 net: mctp-i2c: fix duplicate reception of old data
> >     37ccd48cf35f quota: fix livelock between quotactl and freeze_super
> >     96ac80ce22bc PCI/portdrv: Fix potential resource leak
> >     cf7e6dbb51a7 PCI: Do not attempt to set ExtTag for VFs
> >     a4176432d41e Documentation: tracing: Add PCI tracepoint documentati=
on
> >     60b896647d88 Documentation: trace: Refactor toctree
> >     b2f972293451 docs: fix WARNING document not included in any toctree
> >     bd43a6e85779 Documentation: tracing: Add ring-buffer mapping
> >     baa42b756d18 PCI/P2PDMA: Release per-CPU pgmap ref when
> vm_insert_page() fails
> >     d8e7624e2113 PCI/PM: Avoid redundant delays on D3hot->D3cold
> >     63d3556c9a8e Documentation: PCI: endpoint: Fix ntb/vntb copy & past=
e
> errors
> >     24c190a5a24e PCI: mediatek: Fix IRQ domain leak when MSI allocation
> fails
> >     f448acd86835 Revert "hwmon: (ibmpex) fix use-after-free in high/low
> store"
> >     1ae5fd122398 spi: tools: Add include folder to .gitignore
> >     169ae51f31b0 platform/chrome: cros_ec_lightbar: Fix response size
> initialization
> >     e3311645c7c1 media: uvcvideo: Fix allocation for small frame sizes
> >     01fe5a26ccc6 platform/chrome: cros_typec_switch: Don't touch struct
> fwnode_handle::dev
> >     0347548ccf07 drm/msm/a2xx: fix pixel shader start on A225
> >     661152ffb0f2 media: ccs: Accommodate C-PHY into the calculation
> >     e7815709bc97 drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
> >     33acf9a4d6eb HID: playstation: Add missing check for
> input_ff_create_memless
> >     f0a6e4b27bad regulator: core: move supply check earlier in
> set_machine_constraints()
> >     2d5b17e8364b drm/msm/disp/dpu: add merge3d support for sc7280
> >     83d3d9ec347a drm/amdgpu: Use explicit VCN instance 0 in SR-IOV init
> >     f721f873d3e1 ASoC: nau8821: Fixup nau8821_enable_jack_detect()
> >     88a6bed89eb8 ASoC: nau8821: Avoid unnecessary blocking in IRQ handl=
er
> >     e19f5b5d1059 ASoC: nau8821: Consistently clear interrupts before
> unmasking
> >     1c7ee23dfcd1 smack: /smack/doi: accept previously used values
> >     661d87242dd6 smack: /smack/doi must be > 0
> >     34bacb3cc343 workqueue: Process rescuer work items one-by-one using
> a cursor
> >     c906c9d81fdf workqueue: Only assign rescuer work when really needed
> >     c17f947a6fca workqueue: Factor out assign_rescuer_work()
> >     e3b15841172e arm64: dts: qcom: sm6115: Add CX_MEM/DBGC GPU regions
> >     4ffe98b89c9c arm64: dts: qcom: sdm845-db845c: specify power for WiF=
i
> CH1
> >     c77d1b2f5e51 arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
> >     1895ad99349e arm64: dts: amlogic: g12: assign the MMC A signal cloc=
k
> >     44cd81bbb21b arm64: dts: amlogic: g12: assign the MMC B and C signa=
l
> clocks
> >     6a47c69a8bba arm64: dts: amlogic: gx: assign the MMC signal clocks
> >     59f3138d11cc arm64: dts: amlogic: axg: assign the MMC signal clocks
> >     716c8ebe0409 arm: dts: lpc32xx: add clocks property to Motor Contro=
l
> PWM device tree node
> >     8461f646f68a ARM: dts: lpc32xx: Set motor PWM #pwm-cells property
> value to 3 cells
> >     87a1f93986aa powerpc/eeh: fix recursive pci_lock_rescan_remove
> locking in EEH event handling
> >     06195456c4e4 soc: mediatek: svs: Fix memory leak in
> svs_enable_debug_write()
> >     993d41578772 soc: qcom: cmd-db: Use devm_memremap() to fix memory
> leak in cmd_db_dev_probe
> >     c43e0a0353e5 powerpc/uaccess: Move barrier_nospec() out of
> allow_read_{from/write}_user()
> >     ac2c85d2a2f6 ARM: dts: allwinner: sun5i-a13-utoo-p66: delete
> "power-gpios" property
> >     dc62cf0814fa arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator
> as boot-on
> >     1aeb4ed95c3f arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply
> boot-on
> >     93aaa53ecf20 arm64: dts: qcom: sdm630: fix gpu_speed_bin size
> >     e15f1e18cdf4 clk: qcom: Return correct error code in
> qcom_cc_probe_by_index()
> >     458f7417fae0 arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad
> control settings
> >     063898a3f9ac EDAC/i5400: Fix snprintf() limit calculation in
> calculate_dimm_size()
> >     e37f5e05b5bc EDAC/i5000: Fix snprintf() size calculation in
> calculate_dimm_size()
> >     8afa17757873 soc: qcom: smem: handle ENOMEM error during probe
> >     cff0ef043e16 pstore/ram: fix buffer overflow in
> persistent_ram_save_old()
> >     8ad5577b2d4a sched/rt: Skip currently executing CPU in rto_next_cpu=
()
> >     322154c3981e mfd: wm8350-core: Use IRQF_ONESHOT
> >     3db9471b23f5 EDAC/altera: Remove IRQF_ONESHOT
> >     adb69cc223d7 scsi: efct: Use IRQF_ONESHOT and default primary handl=
er
> >     ddc34a1b8550 bpf: Fix bpf_xdp_store_bytes proto for read-only arg
> >     74081d6c1da1 crypto: hisilicon/trng - support tfms sharing the devi=
ce
> >     260a9e382996 crypto: hisilicon/trng - modifying the order of header
> files
> >     9681044e45c9 bpf, sockmap: Fix FIONREAD for sockmap
> >     acaf1ea47bbf bpf, sockmap: Fix incorrect copied_seq calculation
> >     7111701a09cc hrtimer: Fix trace oddity
> >     33a30bf9e0d4 crypto: hisilicon/sec2 - support skcipher/aead fallbac=
k
> for hardware queue unavailable
> >     6eae58af0c31 crypto: hisilicon/zip - adjust the way to obtain the
> req in the callback function
> >     ab8b2eaf7add crypto: hisilicon/zip - remove zlib and gzip
> >     70b2f4fc1ede crypto: hisilicon/zip - support deflate algorithm
> >     0aa430f4661d crypto: octeontx - fix dma_free_coherent() size
> >     53e97a309cc3 crypto: cavium - fix dma_free_coherent() size
> >     2b757fea9f4f ARM: VDSO: Patch out __vdso_clock_getres() if
> unavailable
> >     e1767524765e libbpf: Fix OOB read in btf_dump_get_bitfield_value
> >     542bf32cf757 selftests/bpf: veristat: fix printing order in
> output_stats()
> >     6e6abc72accf crypto: qat - fix warning on adf_pfvf_pf_proto.c
> >     abb6e07f46a7 s390/cio: Fix device lifecycle handling in
> css_alloc_subchannel()
> >     27d7a35b8052 PM: sleep: wakeirq: harden dev_pm_clear_wake_irq()
> against races
> >     70e8af620210 perf: arm_spe: Properly set hw.state on failures
> >     3deb7b6a2e31 PM: wakeup: Handle empty list in
> wakeup_sources_walk_start()
> >     d6749d0b8ddc Partial revert "x86/xen: fix balloon target
> initialization for PVH dom0"
> >     ef3b74d20f5e x86/xen: make some functions static
> >     31cac6acf77e ublk: Validate SQE128 flag before accessing the cmd
> >     8f3d79abdec0 iomap: fix submission side handling of completion side
> errors
> >     597ec9e7f5cc md/raid10: fix any_working flag handling in
> raid10_sync_request
> >     72b2db83705b cpuidle: governors: menu: Always check timers with tic=
k
> stopped
> >     0add3e6f91aa cpuidle: menu: Cleanup after loadavg removal
> >     ca762fa01f64 io_uring/sync: validate passed in offset
> >     f2cf475d23b8 ACPICA: Fix NULL pointer dereference in
> acpi_ev_address_space_dispatch()
> >     9cc9efa703f0 xen/virtio: Don't use grant-dma-ops when running as Do=
m0
> >     7425453ea16d smb: client: fix potential UAF and double free in
> smb2_open_file()
> >     e3d1fd084319 btrfs: fix block_group_tree dirty_list corruption
> >     46fb7ee9f852 btrfs: qgroup: return correct error when deleting
> qgroup relation item
> >     a51cff9be046 tpm: st33zp24: Fix missing cleanup on get_burstcount()
> error
> >     948966e546f2 tpm: tpm_i2c_infineon: Fix locality leak on
> get_burstcount() failure
> >     20ac431e02dc i3c: dw: Initialize spinlock to avoid upsetting lockde=
p
> >     d87268326b27 gfs2: Fix use-after-free in iomap inline data write pa=
th
> >     4991b13cc9f1 gfs2: Add metapath_dibh helper
> >     7e3b7a47867a gfs2: Retries missing in gfs2_{rename,exchange}
> >     b68be2b8b564 i3c: master: Update hot-join flag only on success
> >     5560116126da fs: add <linux/init_task.h> for 'init_fs'
> >     4b2a0a4e9428 i3c: Move device name assignment after i3c_bus_init
> >     e2647d540bea audit: move the compat_xxx_class[] extern declarations
> to audit_arch.h
> >     979c708e6c9d rcu: Fix rcu_read_unlock() deadloop due to softirq
> >     dffd52d0d14e rcu: Remove local_irq_save/restore() in
> rcu_preempt_deferred_qs_handler()
> >     3ccd035ef99d rcu: Refactor expedited handling check in
> rcu_read_unlock_special()
> >     6cc7a424a39a rcu/exp: Move expedited kthread worker creation
> functions above rcutree_prepare_cpu()
> >     cb9eaff659dd rcu: s/boost_kthread_mutex/kthread_mutex
> >     7b57ada854b3 hfsplus: return error when node already exists in
> hfs_bnode_create
> >     2e000d8a5306 auxdisplay: arm-charlcd: fix release_mem_region() size
> >     a6a3e4af1099 RDMA/umad: Reject negative data_len in ib_umad_write
> >     ffba40b67663 RDMA/siw: Fix potential NULL pointer dereference in
> header processing
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
> >  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
> >  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
> >  3 files changed, 20 insertions(+), 20 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > index 8685e5cbf6..8250679ed0 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > @@ -14,13 +14,13 @@ python () {
> >          raise bb.parse.SkipRecipe("Set
> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> >  }
> >
> > -SRCREV_machine ?=3D "c45743dc8dc2ddfbe7bd165997e1f7cf887fa6b7"
> > -SRCREV_meta ?=3D "45f69741c733e066ed1a12b6025e347e5cd6063e"
> > +SRCREV_machine ?=3D "8751b899ea5af349e8570e8985365290efa5e7d6"
> > +SRCREV_meta ?=3D "fdd48963e673d657f0df21b4b1fb6b18dbaa96bc"
> >
> >  SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine;p=
rotocol=3Dhttps
> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=
=3Dmachine;protocol=3Dhttps>
> \
> >             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-6.6;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
> >
> > -LINUX_VERSION ?=3D "6.6.127"
> > +LINUX_VERSION ?=3D "6.6.129"
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedc=
d7e46"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > index d6a9afdf17..bd4a10b564 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > @@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
> >  # CVE exclusions
> >  include recipes-kernel/linux/cve-exclusion_6.6.inc
> >
> > -LINUX_VERSION ?=3D "6.6.127"
> > +LINUX_VERSION ?=3D "6.6.129"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedc=
d7e46"
> >
> >  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '=
',
> d)}"
> > @@ -17,8 +17,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
> >  KMETA =3D "kernel-meta"
> >  KCONF_BSP_AUDIT_LEVEL =3D "2"
> >
> > -SRCREV_machine ?=3D "8247922ff493e4fef938ce36562cac9c0cce86aa"
> > -SRCREV_meta ?=3D "45f69741c733e066ed1a12b6025e347e5cd6063e"
> > +SRCREV_machine ?=3D "d82c6cc64c037058c6bfd630f2d2604a38684c7d"
> > +SRCREV_meta ?=3D "fdd48963e673d657f0df21b4b1fb6b18dbaa96bc"
> >
> >  PV =3D "${LINUX_VERSION}+git"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > index 92ad6afa3a..58a72979c5 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > @@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?=3D "v6.6/standard/base"
> >  KBRANCH:qemuloongarch64  ?=3D "v6.6/standard/base"
> >  KBRANCH:qemumips64 ?=3D "v6.6/standard/mti-malta64"
> >
> > -SRCREV_machine:qemuarm ?=3D "aa66687c1abe2afe2ee6c00c36bfaaf3d5d9636c"
> > -SRCREV_machine:qemuarm64 ?=3D "cf88783fdb92901d9d228afb7d700c6575742f1=
b"
> > -SRCREV_machine:qemuloongarch64 ?=3D
> "70af2998be31b72a111de67966b7816b3d54d472"
> > -SRCREV_machine:qemumips ?=3D "cbd6f9a670486dcd83ef0f8b90a75b2b7b44b447=
"
> > -SRCREV_machine:qemuppc ?=3D "bce75aa765505d7db3bb1bfefb5d3f524a1a5b64"
> > -SRCREV_machine:qemuriscv64 ?=3D "70af2998be31b72a111de67966b7816b3d54d=
472"
> > -SRCREV_machine:qemuriscv32 ?=3D "70af2998be31b72a111de67966b7816b3d54d=
472"
> > -SRCREV_machine:qemux86 ?=3D "70af2998be31b72a111de67966b7816b3d54d472"
> > -SRCREV_machine:qemux86-64 ?=3D "70af2998be31b72a111de67966b7816b3d54d4=
72"
> > -SRCREV_machine:qemumips64 ?=3D "4cc6d51a6f63436a37c3ba4ea2da93c7fd3240=
b4"
> > -SRCREV_machine ?=3D "70af2998be31b72a111de67966b7816b3d54d472"
> > -SRCREV_meta ?=3D "45f69741c733e066ed1a12b6025e347e5cd6063e"
> > +SRCREV_machine:qemuarm ?=3D "539bf858552c12417a449646d0cad5e53e038aa0"
> > +SRCREV_machine:qemuarm64 ?=3D "e4153b3c5bff6c503990c35826d84a034d2d7a3=
3"
> > +SRCREV_machine:qemuloongarch64 ?=3D
> "3dbf485808fc7be82368f70f385fead9735b5904"
> > +SRCREV_machine:qemumips ?=3D "d5da07b097555f20280b2484da875c93f1494d48=
"
> > +SRCREV_machine:qemuppc ?=3D "9434ddc68ebc90e9336d4cc6f642aa82c0da023c"
> > +SRCREV_machine:qemuriscv64 ?=3D "3dbf485808fc7be82368f70f385fead9735b5=
904"
> > +SRCREV_machine:qemuriscv32 ?=3D "3dbf485808fc7be82368f70f385fead9735b5=
904"
> > +SRCREV_machine:qemux86 ?=3D "3dbf485808fc7be82368f70f385fead9735b5904"
> > +SRCREV_machine:qemux86-64 ?=3D "3dbf485808fc7be82368f70f385fead9735b59=
04"
> > +SRCREV_machine:qemumips64 ?=3D "e6f498c7aa6909c17b90b50267d1577ddc19c0=
d6"
> > +SRCREV_machine ?=3D "3dbf485808fc7be82368f70f385fead9735b5904"
> > +SRCREV_meta ?=3D "fdd48963e673d657f0df21b4b1fb6b18dbaa96bc"
> >
> >  # set your preferred provider of linux-yocto to 'linux-yocto-upstream'=
,
> and you'll
> >  # get the <version>/base branch, which is pure upstream -stable, and
> the same
> >  # meta SRCREV as the linux-yocto-standard builds. Select your version
> using the
> >  # normal PREFERRED_VERSION settings.
> >  BBCLASSEXTEND =3D "devupstream:target"
> > -SRCREV_machine:class-devupstream ?=3D
> "7a137e9bfa0e1919555d60f9dc0c05a7a5ba75d0"
> > +SRCREV_machine:class-devupstream ?=3D
> "4fc00fe35d46b4fc8dac2eb543a0e3d44bb15f47"
> >  PN:class-devupstream =3D "linux-yocto-upstream"
> >  KBRANCH:class-devupstream =3D "v6.6/base"
> >
> > @@ -44,7 +44,7 @@ SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D${KBRA
> <http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7B=
KBRA>
> >             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-6.6;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps>
> "
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedc=
d7e46"
> > -LINUX_VERSION ?=3D "6.6.127"
> > +LINUX_VERSION ?=3D "6.6.129"
> >
> >  PV =3D "${LINUX_VERSION}+git"
> >
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ded5430653e9f662
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 10, 2026 at 1:14=
=E2=80=AFPM Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr">yoann=
.congal@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Wed Jun 10, 2026 at 6:49 PM CEST, Bruce Ashfield via <a =
href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank"=
>lists.openembedded.org</a> wrote:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Updating linux-yocto/6.6 to the latest korg -stable release that compr=
ises<br>
&gt; the following commits:<br>
<br>
Hi Bruce,<br>
<br>
Are there changes from the previous series (6.6.129-6.6.135)?<br>
<br>
There was some autobuilder failures:<br>
<a href=3D"https://lore.kernel.org/all/DIBGIUMGTRU4.ZOHIWWT1QG6I@smile.fr/"=
 rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/all/DIBGIUMGT=
RU4.ZOHIWWT1QG6I@smile.fr/</a></blockquote><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">I missed that before. I&#39;ll=
 have a look at it next week and resend as required.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Thanks!<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0fc00fe35d46 Linux 6.6.129<br>
&gt;=C2=A0 =C2=A0 =C2=A0acf7c8972775 Revert &quot;x86/kexec: add a sanity c=
heck on previous kernel&#39;s ima kexec buffer&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0682d8e2f892b Linux 6.6.128<br>
&gt;=C2=A0 =C2=A0 =C2=A00ac0e02183c5 arm64: Fix sampling the &quot;stable&q=
uot; virtual counter in preemptible section<br>
&gt;=C2=A0 =C2=A0 =C2=A018845fb30921 drm/i915/wakeref: clean up INTEL_WAKER=
EF_PUT_* flag macros<br>
&gt;=C2=A0 =C2=A0 =C2=A0fe418ef21efd NTB: ntb_transport: Fix too small buff=
er for debugfs_name<br>
&gt;=C2=A0 =C2=A0 =C2=A01cdff5d564fe tracing: Wake up poll waiters for hist=
 files when removing an event<br>
&gt;=C2=A0 =C2=A0 =C2=A0e4e5026252b4 tracing: Fix checking of freed trace_e=
vent_file for hist files<br>
&gt;=C2=A0 =C2=A0 =C2=A0ad058a4317db net: nfc: nci: Fix parameter validatio=
n for packet data<br>
&gt;=C2=A0 =C2=A0 =C2=A0dc99b25ed4f7 arm64: Force the use of CNTVCT_EL0 in =
__delay()<br>
&gt;=C2=A0 =C2=A0 =C2=A0ad3640895956 x86/kexec: Copy ACPI root pointer addr=
ess from config table<br>
&gt;=C2=A0 =C2=A0 =C2=A09c735a7d98c9 net/sched: act_skbedit: fix divide-by-=
zero in tcf_skbedit_hash()<br>
&gt;=C2=A0 =C2=A0 =C2=A01e300c33ef3c net: ethernet: ec_bhf: Fix dma_free_co=
herent() dma handle<br>
&gt;=C2=A0 =C2=A0 =C2=A06ccfcad1b582 ASoC: amd: yc: Add DMI quirk for ASUS =
Vivobook Pro 15X M6501RR<br>
&gt;=C2=A0 =C2=A0 =C2=A0c854ab481ece cifs: some missing initializations on =
replay<br>
&gt;=C2=A0 =C2=A0 =C2=A06a3ce8c8ad80 fbcon: Remove struct fbcon_display.inv=
erse<br>
&gt;=C2=A0 =C2=A0 =C2=A0b6de6d481cc2 fbdev: ffb: fix corrupted video output=
 on Sun FFB1<br>
&gt;=C2=A0 =C2=A0 =C2=A03ed019654234 fbdev: of: display_timing: fix refcoun=
t leak in of_get_display_timings()<br>
&gt;=C2=A0 =C2=A0 =C2=A0e8c5d5f6cd66 fbdev: vt8500lcdfb: fix missing dma_fr=
ee_coherent()<br>
&gt;=C2=A0 =C2=A0 =C2=A0a785c4e2a999 fbcon: check return value of con2fb_ac=
quire_newinfo()<br>
&gt;=C2=A0 =C2=A0 =C2=A0632d233cf2e6 ipv6: ioam: fix heap buffer overflow i=
n __ioam6_fill_trace_data()<br>
&gt;=C2=A0 =C2=A0 =C2=A0e075ec9b08f8 atm: fore200e: fix use-after-free in t=
asklets during device removal<br>
&gt;=C2=A0 =C2=A0 =C2=A09f8ad199844c net: intel: fix PCI device ID conflict=
 between i40e and ipw2200<br>
&gt;=C2=A0 =C2=A0 =C2=A06eb571a37631 io_uring/filetable: clamp alloc_hint t=
o the configured alloc range<br>
&gt;=C2=A0 =C2=A0 =C2=A00f4dcba31bf4 tracing: Fix to set write permission t=
o per-cpu buffer_size_kb<br>
&gt;=C2=A0 =C2=A0 =C2=A0ec4445ae9e58 net: macb: Fix tx/rx malfunction after=
 phy link down and up<br>
&gt;=C2=A0 =C2=A0 =C2=A0013ac469596a octeontx2-af: CGX: fix bitmap leaks<br=
>
&gt;=C2=A0 =C2=A0 =C2=A00f85a9655445 net: wan/fsl_ucc_hdlc: Fix dma_free_co=
herent() in uhdlc_memclean()<br>
&gt;=C2=A0 =C2=A0 =C2=A063afc078bba6 net: ethernet: marvell: skge: remove i=
ncorrect conflicting PCI ID<br>
&gt;=C2=A0 =C2=A0 =C2=A0710657d3d31f LoongArch: Disable instrumentation for=
 setup_ptwalker()<br>
&gt;=C2=A0 =C2=A0 =C2=A06868bd64dc90 LoongArch: Guard percpu handler under =
!CONFIG_PREEMPT_RT<br>
&gt;=C2=A0 =C2=A0 =C2=A0a50371c6ad99 LoongArch: Prefer top-down allocation =
after arch_mem_init()<br>
&gt;=C2=A0 =C2=A0 =C2=A0bb1a54f7f011 LoongArch: Make cpumask_of_node() robu=
st against NUMA_NO_NODE<br>
&gt;=C2=A0 =C2=A0 =C2=A09efa154609cd ceph: supply snapshot context in ceph_=
zero_partial_object()<br>
&gt;=C2=A0 =C2=A0 =C2=A0103e9d1d43e6 MIPS: rb532: Fix MMIO UART resource re=
gistration<br>
&gt;=C2=A0 =C2=A0 =C2=A0953953abb66e cifs: Fix locking usage for tcon field=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc3f83b6fb37 staging: rtl8723bs: fix null dereferen=
ce in find_network<br>
&gt;=C2=A0 =C2=A0 =C2=A0369d369ed08f parisc: kernel: replace kfree() with p=
ut_device() in create_tree_node()<br>
&gt;=C2=A0 =C2=A0 =C2=A0a19b61fdb958 PCI: Fix pci_slot_trylock() error hand=
ling<br>
&gt;=C2=A0 =C2=A0 =C2=A065e794574069 net: cpsw_new: Fix unnecessary netdev =
unregistration in cpsw_probe() error path<br>
&gt;=C2=A0 =C2=A0 =C2=A04857c37c7ba9 drm/amdkfd: Fix out-of-bounds write in=
 kfd_event_page_set()<br>
&gt;=C2=A0 =C2=A0 =C2=A07a4fd19c567f tipc: fix RCU dereference race in tipc=
_aead_users_dec()<br>
&gt;=C2=A0 =C2=A0 =C2=A08e875cf8851b mtd: rawnand: pl353: Fix software ECC =
support<br>
&gt;=C2=A0 =C2=A0 =C2=A0f5da4c24aa6d usb: dwc2: fix resume failure if dr_mo=
de is host<br>
&gt;=C2=A0 =C2=A0 =C2=A076c1123ffccf usb: dwc3: gadget: Move vbus draw to w=
orkqueue context<br>
&gt;=C2=A0 =C2=A0 =C2=A0aa8d68d97c7f scsi: ufs: core: Flush exception handl=
ing work when RPM level is zero<br>
&gt;=C2=A0 =C2=A0 =C2=A0d3e837e11ee9 perf/arm-cmn: Reject unsupported hardw=
are configurations<br>
&gt;=C2=A0 =C2=A0 =C2=A09bd98d088f47 remoteproc: imx_rproc: Fix invalid loa=
ded resource table detection<br>
&gt;=C2=A0 =C2=A0 =C2=A0d99a08c2b4d5 btrfs: continue trimming remaining dev=
ices on failure<br>
&gt;=C2=A0 =C2=A0 =C2=A041a09925ec68 arm64: Fix non-atomic __READ_ONCE() wi=
th CONFIG_LTO=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A01047ca2d8169 PCI/IOV: Fix race between SR-IOV enabl=
e/disable and hotplug<br>
&gt;=C2=A0 =C2=A0 =C2=A0639265296fe6 Revert &quot;PCI/IOV: Add PCI rescan-r=
emove locking when enabling/disabling SR-IOV&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0cfccd3b8c51b kexec: derive purgatory entry from sym=
bol<br>
&gt;=C2=A0 =C2=A0 =C2=A0bb273b68c171 ocfs2: fix reflink preserve cleanup is=
sue<br>
&gt;=C2=A0 =C2=A0 =C2=A0649c2e853608 rapidio: replace rio_free_net() with k=
free() in rio_scan_alloc_net()<br>
&gt;=C2=A0 =C2=A0 =C2=A081c44a4bc168 mm/highmem: fix __kmap_to_page() build=
 error<br>
&gt;=C2=A0 =C2=A0 =C2=A01eabfd2c437b iio: gyro: itg3200: Fix unchecked retu=
rn value in read_raw<br>
&gt;=C2=A0 =C2=A0 =C2=A09d0ca11258e7 powerpc/smp: Add check for kcalloc() f=
ailure in parse_thread_groups()<br>
&gt;=C2=A0 =C2=A0 =C2=A0442f5db91317 tools: Fix bitfield dependency failure=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0e4709950acd4 dm mpath: make pg_init_delay_msecs set=
table<br>
&gt;=C2=A0 =C2=A0 =C2=A0542dd6da35eb bus: fsl-mc: fix an error handling in =
fsl_mc_device_add()<br>
&gt;=C2=A0 =C2=A0 =C2=A065f5a17b6d56 usb: gadget: tegra-xudc: Add handling =
for BLCG_COREPLL_PWRDN<br>
&gt;=C2=A0 =C2=A0 =C2=A022e460b6333a x86/kexec: add a sanity check on previ=
ous kernel&#39;s ima kexec buffer<br>
&gt;=C2=A0 =C2=A0 =C2=A057c4fd0f4b02 nvmem: Drop OF node reference on nvmem=
_add_one_cell() failure<br>
&gt;=C2=A0 =C2=A0 =C2=A013c1f31f777c nfsd: fix return error code for nfsd_m=
ap_name_to_[ug]id<br>
&gt;=C2=A0 =C2=A0 =C2=A0d92b8fac294b md/bitmap: fix GPF in write_page cause=
d by resize race<br>
&gt;=C2=A0 =C2=A0 =C2=A0142b1bba3299 PCI: endpoint: Fix swapped parameters =
in pci_{primary/secondary}_epc_epf_unlink() functions<br>
&gt;=C2=A0 =C2=A0 =C2=A0708e20c66b27 KVM: x86: Add SRCU protection for read=
ing PDPTRs in __get_sregs2()<br>
&gt;=C2=A0 =C2=A0 =C2=A0a6f660d62bc1 xfs: fix remote xattr valuelblk check<=
br>
&gt;=C2=A0 =C2=A0 =C2=A038613c01f69e xfs: fix freemap adjustments when addi=
ng xattrs to leaf blocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0ffaf5c99d0f8 xfs: delete attr leaf freemap entries =
when empty<br>
&gt;=C2=A0 =C2=A0 =C2=A0e2e7c275f557 mfd: core: Add locking around &#39;mfd=
_of_node_list&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A001aed2f1d7cb iommu/vt-d: Flush dev-IOTLB only when =
PCIe device is accessible in scalable mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0a5b1ddbe31f4 media: verisilicon: AV1: Fix tile info=
 buffer size<br>
&gt;=C2=A0 =C2=A0 =C2=A08be53110395e xfs: mark data structures corrupt on E=
IO and ENODATA<br>
&gt;=C2=A0 =C2=A0 =C2=A0297bb8b1db60 selftests/mm/charge_reserved_hugetlb: =
drop mount size for hugetlbfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0aa5f25d55cda mm, page_alloc, thp: prevent reclaim f=
or __GFP_THISNODE THP allocations<br>
&gt;=C2=A0 =C2=A0 =C2=A08dcff1979381 drm: of: drm_of_panel_bridge_remove():=
 fix device_node leak<br>
&gt;=C2=A0 =C2=A0 =C2=A052920a853381 media: venus: vdec: restrict EOS addr =
quirk to IRIS2 only<br>
&gt;=C2=A0 =C2=A0 =C2=A0225f2221b422 media: venus: vdec: fix error state as=
signment for zero bytesused<br>
&gt;=C2=A0 =C2=A0 =C2=A0272d44fa7bce arm64: dts: rockchip: Do not enable hd=
mi_sound node on Pinebook Pro<br>
&gt;=C2=A0 =C2=A0 =C2=A0ed36f6ae0039 dm-unstripe: fix mapping bug when ther=
e are multiple targets in a table<br>
&gt;=C2=A0 =C2=A0 =C2=A0fb49f209995f dm-integrity: fix recalculation in bit=
map mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0de7934627cc4 s390/pci: Handle futile config accesse=
s of disabled devices directly<br>
&gt;=C2=A0 =C2=A0 =C2=A01c7c87cf18da clk: tegra: tegra124-emc: Fix potentia=
l memory leak in tegra124_clk_register_emc()<br>
&gt;=C2=A0 =C2=A0 =C2=A00f0809bfe4fa media: i2c: ov01a10: Fix digital gain =
range<br>
&gt;=C2=A0 =C2=A0 =C2=A085cc6574f21b clk: clk-apple-nco: Add &quot;apple,t8=
103-nco&quot; compatible<br>
&gt;=C2=A0 =C2=A0 =C2=A03880e331b0b3 KVM: nSVM: Always use vmcb01 in VMLOAD=
/VMSAVE emulation<br>
&gt;=C2=A0 =C2=A0 =C2=A0e113339cc7d2 soc: ti: pruss: Fix double free in pru=
ss_clk_mux_setup()<br>
&gt;=C2=A0 =C2=A0 =C2=A0d451bf970a0c soc: ti: k3-socinfo: Fix regmap leak o=
n probe failure<br>
&gt;=C2=A0 =C2=A0 =C2=A07daf279c674d dm: clear cloned request bio pointer w=
hen last clone bio completes<br>
&gt;=C2=A0 =C2=A0 =C2=A02d10a3dad8d6 dm-integrity: fix a typo in the code f=
or write/discard race<br>
&gt;=C2=A0 =C2=A0 =C2=A0d03a29cb36d6 media: i2c: ov5647: use our own mutex =
for the ctrl lock<br>
&gt;=C2=A0 =C2=A0 =C2=A0089625cccd7e media: i2c: ov5647: Fix PIXEL_RATE val=
ue for VGA mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0c146483bad46 media: i2c: ov5647: Sensor should repo=
rt RAW color space<br>
&gt;=C2=A0 =C2=A0 =C2=A0e5f4aad2627d media: i2c: ov5647: Correct minimum VB=
LANK value<br>
&gt;=C2=A0 =C2=A0 =C2=A01f413dac763a media: i2c: ov5647: Correct pixel arra=
y offset<br>
&gt;=C2=A0 =C2=A0 =C2=A0cabd025182cf media: i2c: ov5647: Initialize subdev =
before controls<br>
&gt;=C2=A0 =C2=A0 =C2=A0c9af1818387f media: ccs: Avoid possible division by=
 zero<br>
&gt;=C2=A0 =C2=A0 =C2=A00c074e80921f media: qcom: camss: vfe: Fix out-of-bo=
unds access in vfe_isr_reg_update()<br>
&gt;=C2=A0 =C2=A0 =C2=A08de39720e7a3 media: i2c: ov01a10: Fix test-pattern =
disabling<br>
&gt;=C2=A0 =C2=A0 =C2=A0a14a3cef8017 media: i2c: ov01a10: Add missing v4l2_=
subdev_cleanup() calls<br>
&gt;=C2=A0 =C2=A0 =C2=A0567a03fe8d08 media: i2c: ov01a10: Fix analogue gain=
 range<br>
&gt;=C2=A0 =C2=A0 =C2=A0e2f6d78dc3a8 media: i2c: ov01a10: Fix reported pixe=
l-rate value<br>
&gt;=C2=A0 =C2=A0 =C2=A0bb2b049f75f1 media: i2c: ov01a10: Fix the horizonta=
l flip control<br>
&gt;=C2=A0 =C2=A0 =C2=A0ccb92def042a media: i2c/tw9906: Fix potential memor=
y leak in tw9906_probe()<br>
&gt;=C2=A0 =C2=A0 =C2=A09cb9eca33d20 media: i2c/tw9903: Fix potential memor=
y leak in tw9903_probe()<br>
&gt;=C2=A0 =C2=A0 =C2=A0046c5db6bbba media: cx25821: Add missing unmap in s=
nd_cx25821_hw_params()<br>
&gt;=C2=A0 =C2=A0 =C2=A0544215cc37d0 media: cx23885: Add missing unmap in s=
nd_cx23885_hw_params()<br>
&gt;=C2=A0 =C2=A0 =C2=A010ab64f8efc2 media: cx88: Add missing unmap in snd_=
cx88_hw_params()<br>
&gt;=C2=A0 =C2=A0 =C2=A027c508f61963 media: radio-keene: fix memory leak in=
 error path<br>
&gt;=C2=A0 =C2=A0 =C2=A0dd8508820246 media: verisilicon: AV1: Set IDR flag =
for intra_only frame type<br>
&gt;=C2=A0 =C2=A0 =C2=A08305902ac038 arm64: dts: apple: t8112-j473: Keep th=
e HDMI port powered on<br>
&gt;=C2=A0 =C2=A0 =C2=A0b74bf7d0d01f HID: logitech-hidpp: Check maxfield in=
 hidpp_get_report_length()<br>
&gt;=C2=A0 =C2=A0 =C2=A03f1b21cc67a1 HID: prodikeys: Check presence of pm-&=
gt;input_ep82<br>
&gt;=C2=A0 =C2=A0 =C2=A0243e1165eb03 HID: magicmouse: Do not crash on missi=
ng msc-&gt;input<br>
&gt;=C2=A0 =C2=A0 =C2=A0449004434e1f HID: hid-pl: handle probe errors<br>
&gt;=C2=A0 =C2=A0 =C2=A0cad7442ff23b arm64: Disable branch profiling for al=
l arm64 code<br>
&gt;=C2=A0 =C2=A0 =C2=A0deb8f6dfd31d KVM: nSVM: Remove a user-triggerable W=
ARN on nested_svm_load_cr3() succeeding<br>
&gt;=C2=A0 =C2=A0 =C2=A0275e15fd1cf7 ARM: omap2: Fix reference count leaks =
in omap_control_init()<br>
&gt;=C2=A0 =C2=A0 =C2=A0b44eb959159f media: verisilicon: AV1: Fix tx mode b=
it setting<br>
&gt;=C2=A0 =C2=A0 =C2=A08ad7e6ea46a9 media: verisilicon: AV1: Fix enable cd=
ef computation<br>
&gt;=C2=A0 =C2=A0 =C2=A0564fd3a63efc media: mtk-mdp: Fix a reference leak b=
ug in mtk_mdp_remove()<br>
&gt;=C2=A0 =C2=A0 =C2=A012cafc15d246 media: mtk-mdp: Fix error handling in =
probe function<br>
&gt;=C2=A0 =C2=A0 =C2=A0637510cb5bed media: mediatek: encoder: Fix uninitia=
lized scalar variable issue<br>
&gt;=C2=A0 =C2=A0 =C2=A0031f2adc1499 dm-verity: correctly handle dm_bufio_c=
lient_create() failure<br>
&gt;=C2=A0 =C2=A0 =C2=A0a9ddc035050a fpga: dfl: use subsys_initcall to allo=
w built-in drivers to be added<br>
&gt;=C2=A0 =C2=A0 =C2=A0d6f5aed42760 ASoC: SOF: ipc4-control: Keep the payl=
oad size up to date<br>
&gt;=C2=A0 =C2=A0 =C2=A0e1dd7092fa8f ASoC: SOF: ipc4-control: Use the corre=
ct size for scontrol-&gt;ipc_control_data<br>
&gt;=C2=A0 =C2=A0 =C2=A059fe643f21b9 ASoC: SOF: ipc4-topology: Correct the =
allocation size for bytes controls<br>
&gt;=C2=A0 =C2=A0 =C2=A03a5a4b066329 ASoC: SOF: ipc4-control: If there is n=
o data do not send bytes update<br>
&gt;=C2=A0 =C2=A0 =C2=A0955e2d6e5e0a clk: renesas: rzg2l: Select correct di=
v round macro<br>
&gt;=C2=A0 =C2=A0 =C2=A0a4be3b90ba9d clk: renesas: rzg2l: Fix intin variabl=
e size<br>
&gt;=C2=A0 =C2=A0 =C2=A090c8353f4718 rpmsg: core: fix race in driver_overri=
de_show() and use core helper<br>
&gt;=C2=A0 =C2=A0 =C2=A07ef82863d422 netfilter: nf_conntrack_h323: fix OOB =
read in decode_choice()<br>
&gt;=C2=A0 =C2=A0 =C2=A0b690635d4719 dpaa2-switch: validate num_ifs to prev=
ent out-of-bounds write<br>
&gt;=C2=A0 =C2=A0 =C2=A09ac6aebef4b4 net: consume xmit errors of GSO frames=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0175881094756 net/mlx5: Fix missing devlink lock in =
SRIOV enable error path<br>
&gt;=C2=A0 =C2=A0 =C2=A054fb0577ebe7 net/mlx5: DR, Fix circular locking dep=
endency in dump<br>
&gt;=C2=A0 =C2=A0 =C2=A0b324327ff6f4 RDMA/umem: Fix double dma_buf_unpin in=
 failure path<br>
&gt;=C2=A0 =C2=A0 =C2=A035854ed5c40b net: usb: pegasus: enable basic endpoi=
nt checking<br>
&gt;=C2=A0 =C2=A0 =C2=A0df001db47708 RDMA/efa: Fix typo in efa_alloc_mr()<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0337d7b4112a4 net: wan: farsync: Fix use-after-free =
bugs caused by unfinished tasklets<br>
&gt;=C2=A0 =C2=A0 =C2=A052d469319ced RDMA/core: Fix stale RoCE GIDs during =
netdev events at registration<br>
&gt;=C2=A0 =C2=A0 =C2=A00b7d596da5de tipc: fix duplicate publication key in=
 tipc_service_insert_publ()<br>
&gt;=C2=A0 =C2=A0 =C2=A0481ea39b342c Bluetooth: L2CAP: Fix missing key size=
 check for L2CAP_LE_CONN_REQ<br>
&gt;=C2=A0 =C2=A0 =C2=A0efcdb4da480c Bluetooth: L2CAP: Fix not checking out=
put MTU is acceptable on L2CAP_ECRED_CONN_REQ<br>
&gt;=C2=A0 =C2=A0 =C2=A01a138921ce56 Bluetooth: L2CAP: Fix response to L2CA=
P_ECRED_CONN_REQ<br>
&gt;=C2=A0 =C2=A0 =C2=A01d93a369b5aa Bluetooth: hci_qca: Cleanup on all set=
up failures<br>
&gt;=C2=A0 =C2=A0 =C2=A07247f340f824 Bluetooth: L2CAP: Fix invalid response=
 to L2CAP_ECRED_RECONF_REQ<br>
&gt;=C2=A0 =C2=A0 =C2=A02983b39f8c0d Remove WARN_ALL_UNSEEDED_RANDOM kernel=
 config option<br>
&gt;=C2=A0 =C2=A0 =C2=A01f40fde29349 wifi: cfg80211: wext: fix IGTK key ID =
off-by-one<br>
&gt;=C2=A0 =C2=A0 =C2=A0322437972f0a net: ethernet: xscale: Check for PTP s=
upport properly<br>
&gt;=C2=A0 =C2=A0 =C2=A0854f5997df49 net: ixp4xx_eth: convert to ndo_hwtsta=
mp_get() and ndo_hwtstamp_set()<br>
&gt;=C2=A0 =C2=A0 =C2=A019f359963ae8 net: usb: lan78xx: scan all MDIO addre=
sses on LAN7801<br>
&gt;=C2=A0 =C2=A0 =C2=A0ef9b10a02050 net: usb: kaweth: remove TX queue mani=
pulation in kaweth_set_rx_mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0166801e49a5b xfrm: always flush state and policy up=
on NETDEV_UNREGISTER event<br>
&gt;=C2=A0 =C2=A0 =C2=A056d5c0557e53 ipmi: ipmb: initialise event handler r=
ead bytes<br>
&gt;=C2=A0 =C2=A0 =C2=A0f13e4fe961a7 xfrm: skip templates check for packet =
offload tunnel mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0719918fc88df xfrm6: fix uninitialized saddr in xfrm=
6_get_saddr()<br>
&gt;=C2=A0 =C2=A0 =C2=A0d0559d07afab ntb: ntb_hw_switchtec: Fix shift-out-o=
f-bounds for 0 mw lut<br>
&gt;=C2=A0 =C2=A0 =C2=A085c9daa1f831 ntb: ntb_hw_switchtec: Fix array-index=
-out-of-bounds access<br>
&gt;=C2=A0 =C2=A0 =C2=A0a4557dc20df4 rtc: zynqmp: correct frequency value<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A061bd8787c605 drm/amd/display: Remove conditional fo=
r shaper 3DLUT power-on<br>
&gt;=C2=A0 =C2=A0 =C2=A00b284a7ce311 btrfs: replace BUG() with error handli=
ng in __btrfs_balance()<br>
&gt;=C2=A0 =C2=A0 =C2=A08995fc0e00b3 ALSA: usb-audio: Add sanity check for =
OOB writes at silencing<br>
&gt;=C2=A0 =C2=A0 =C2=A06a997eb80644 drm/radeon: Add HAINAN clock adjustmen=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A05b9af0342402 drm/amdgpu: Add HAINAN clock adjustmen=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0c26bde6301f2 ALSA: usb-audio: Update the number of =
packets properly at receiving<br>
&gt;=C2=A0 =C2=A0 =C2=A0d2e92247b24a drm/amdgpu: Adjust usleep_range in fen=
ce wait<br>
&gt;=C2=A0 =C2=A0 =C2=A0068dee782c8c drm/amd/display: Avoid updating surfac=
e with the same surface under MPO<br>
&gt;=C2=A0 =C2=A0 =C2=A01a7f1116c7f8 ARM: 9467/1: mm: Don&#39;t use %pK thr=
ough printk<br>
&gt;=C2=A0 =C2=A0 =C2=A044373b1e9c12 include: uapi: netfilter_bridge.h: Cov=
er for musl libc<br>
&gt;=C2=A0 =C2=A0 =C2=A09f33e83c8393 thermal: int340x: Fix sysfs group leak=
 on DLVR registration failure<br>
&gt;=C2=A0 =C2=A0 =C2=A0e1dc45d97975 libceph: define and enforce CEPH_MAX_K=
EY_LEN<br>
&gt;=C2=A0 =C2=A0 =C2=A0a87a445ac1d9 ceph: supply snapshot context in ceph_=
uninline_data()<br>
&gt;=C2=A0 =C2=A0 =C2=A02f5c626ea792 fs/ntfs3: avoid calling run_get_entry(=
) when run =3D=3D NULL in ntfs_read_run_nb_ra()<br>
&gt;=C2=A0 =C2=A0 =C2=A0ad0d779cdc26 fs/ntfs3: drop preallocated clusters f=
or sparse and compressed files<br>
&gt;=C2=A0 =C2=A0 =C2=A08d8c70b57dbe fs: ntfs3: fix infinite loop triggered=
 by zero-sized ATTR_LIST<br>
&gt;=C2=A0 =C2=A0 =C2=A0af839013c70a fs: ntfs3: fix infinite loop in attr_l=
oad_runs_range on inconsistent metadata<br>
&gt;=C2=A0 =C2=A0 =C2=A068e32694be23 fs: ntfs3: check return value of indx_=
find to avoid infinite loop<br>
&gt;=C2=A0 =C2=A0 =C2=A06dedf0369f2a MIPS: Loongson: Make cpumask_of_node()=
 robust against NUMA_NO_NODE<br>
&gt;=C2=A0 =C2=A0 =C2=A0da08099d5f7a iio: magnetometer: Remove IRQF_ONESHOT=
<br>
&gt;=C2=A0 =C2=A0 =C2=A053f2152b48d5 iio: Use IRQF_NO_THREAD<br>
&gt;=C2=A0 =C2=A0 =C2=A0be5465701341 Revert &quot;mfd: da9052-spi: Change r=
ead-mask to write-mask&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0dc3bc979814b phy: fsl-imx8mq-usb: disable bind/unbi=
nd platform driver feature<br>
&gt;=C2=A0 =C2=A0 =C2=A0afb941338c8e phy: mvebu-cp110-utmi: fix dr_mode pro=
perty read from dts<br>
&gt;=C2=A0 =C2=A0 =C2=A0d476130e53d3 watchdog: imx7ulp_wdt: handle the nowa=
yout option<br>
&gt;=C2=A0 =C2=A0 =C2=A00883ddd583ed binder: don&#39;t use %pK through prin=
tk<br>
&gt;=C2=A0 =C2=A0 =C2=A01d7120244b54 fix it87_wdt early reboot by reporting=
 running timer<br>
&gt;=C2=A0 =C2=A0 =C2=A04ff5ab3e7141 serial: 8250: 8250_omap.c: Clear DMA R=
X running status only after DMA termination is done<br>
&gt;=C2=A0 =C2=A0 =C2=A08311bb40698b staging: rtl8723bs: fix memory leak on=
 failure path<br>
&gt;=C2=A0 =C2=A0 =C2=A003a2f7f9864c misc: eeprom: Fix EWEN/EWDS/ERAL comma=
nds for 93xx56 and 93xx66<br>
&gt;=C2=A0 =C2=A0 =C2=A0ece3722169ba misc: bcm_vk: Fix possible null-pointe=
r dereferences in bcm_vk_read()<br>
&gt;=C2=A0 =C2=A0 =C2=A0c219c20cc357 dmaengine: stm32-mdma: initialize m2m_=
hw_period and ccr to fix warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0f89324e2e09d dmaengine: sun6i: Choose appropriate b=
urst length under maxburst<br>
&gt;=C2=A0 =C2=A0 =C2=A0f9305dda5015 fpga: of-fpga-region: Fail if any brid=
ge is missing<br>
&gt;=C2=A0 =C2=A0 =C2=A0b2bbcaa36c1a usb: typec: ucsi: psy: Fix voltage and=
 current max for non-Fixed PDOs<br>
&gt;=C2=A0 =C2=A0 =C2=A032ccda4895ba serial: 8250_dw: handle clock enable e=
rrors in runtime_resume<br>
&gt;=C2=A0 =C2=A0 =C2=A052b42c24750a staging: rtl8723bs: fix missing status=
 update on sdio_alloc_irq() failure<br>
&gt;=C2=A0 =C2=A0 =C2=A0cd496527efa8 soundwire: dmi-quirks: add mapping for=
 Avell B.ON (OEM rebranded of NUC15)<br>
&gt;=C2=A0 =C2=A0 =C2=A03be7beef4a05 m68k: nommu: fix memmove() with differ=
ently aligned src and dest for 68000<br>
&gt;=C2=A0 =C2=A0 =C2=A06ce681cf8082 clk: microchip: core: correct return v=
alue on *_get_parent()<br>
&gt;=C2=A0 =C2=A0 =C2=A0e2809ad08252 mailbox: sprd: clear delivery flag bef=
ore handling TX done<br>
&gt;=C2=A0 =C2=A0 =C2=A04c4679b31b9d remoteproc: mediatek: Break lock depen=
dency to `prepare_lock`<br>
&gt;=C2=A0 =C2=A0 =C2=A0332fb842181e mailbox: sprd: mask interrupts that ar=
e not handled<br>
&gt;=C2=A0 =C2=A0 =C2=A017ee46882b3e mailbox: imx: Skip the suspend flag fo=
r i.MX7ULP<br>
&gt;=C2=A0 =C2=A0 =C2=A051edcbd17c8d mailbox: pcc: Remove spurious IRQF_ONE=
SHOT usage<br>
&gt;=C2=A0 =C2=A0 =C2=A0f720e653aa1a remoteproc: imx_dsp_rproc: Skip RP_MBO=
X_SUSPEND_SYSTEM when mailbox TX channel is uninitialized<br>
&gt;=C2=A0 =C2=A0 =C2=A0cb6c4aa73491 tracing: Fix false sharing in hwlat ge=
t_sample()<br>
&gt;=C2=A0 =C2=A0 =C2=A09566c87101b2 vhost: fix caching attributes of MMIO =
regions by setting them explicitly<br>
&gt;=C2=A0 =C2=A0 =C2=A0f1bf5ebd5fda scsi: buslogic: Reduce stack usage<br>
&gt;=C2=A0 =C2=A0 =C2=A0d16337560750 hisi_acc_vfio_pci: update status after=
 RAS error<br>
&gt;=C2=A0 =C2=A0 =C2=A0559e227b1df7 ata: libata: avoid long timeouts on ho=
t-unplugged SATA DAS<br>
&gt;=C2=A0 =C2=A0 =C2=A055de264a4d32 RDMA/rtrs-clt: For conn rejection use =
actual err number<br>
&gt;=C2=A0 =C2=A0 =C2=A03819890d6ab2 nfc: nxp-nci: remove interrupt trigger=
 type<br>
&gt;=C2=A0 =C2=A0 =C2=A0392e3d44841d myri10ge: avoid uninitialized variable=
 use<br>
&gt;=C2=A0 =C2=A0 =C2=A06e2a6100ac5b PCI: Mark Nvidia GB10 to avoid bus res=
et<br>
&gt;=C2=A0 =C2=A0 =C2=A0846b226065fe PCI: Add ACS quirk for Qualcomm Hamoa =
&amp; Glymur<br>
&gt;=C2=A0 =C2=A0 =C2=A0ec494c0260bf PCI: Enable ACS after configuring IOMM=
U for OF platforms<br>
&gt;=C2=A0 =C2=A0 =C2=A0a2376e912723 PCI: Fix pci_slot_lock () device locki=
ng<br>
&gt;=C2=A0 =C2=A0 =C2=A0f5ea62163a78 PCI: Mark ASM1164 SATA controller to a=
void bus reset<br>
&gt;=C2=A0 =C2=A0 =C2=A0391200c274e9 net/rds: Clear reconnect pending bit<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0f713dcd2ce83 vmw_vsock: bypass false-positive Wnonn=
ull warning with gcc-16<br>
&gt;=C2=A0 =C2=A0 =C2=A07a8acafd45a9 net: usb: sr9700: remove code to drive=
 nonexistent multicast filter<br>
&gt;=C2=A0 =C2=A0 =C2=A087465580215c wifi: ath10k: fix lock protection in a=
th10k_wmi_event_peer_sta_ps_state_chg()<br>
&gt;=C2=A0 =C2=A0 =C2=A0b015d4c70c9a wifi: rtw89: pci: restore LDO setting =
after device resume<br>
&gt;=C2=A0 =C2=A0 =C2=A0d9b549b6951b octeontx2-af: Workaround SQM/PSE stall=
s by disabling sticky<br>
&gt;=C2=A0 =C2=A0 =C2=A037f4e6804d98 Bluetooth: btusb: Add device ID for Re=
altek RTL8761BU<br>
&gt;=C2=A0 =C2=A0 =C2=A0c051ef2f61f4 Bluetooth: btusb: Add new VID/PID for =
RTL8852CE<br>
&gt;=C2=A0 =C2=A0 =C2=A007960da05c0d Bluetooth: hci_conn: use mod_delayed_w=
ork for active mode timeout<br>
&gt;=C2=A0 =C2=A0 =C2=A0c06dbfd954c9 Bluetooth: hci_conn: Set link_policy o=
n incoming ACL connections<br>
&gt;=C2=A0 =C2=A0 =C2=A09eaeba5600e5 ipv4: fib: Annotate access to struct f=
ib_alias.fa_state.<br>
&gt;=C2=A0 =C2=A0 =C2=A031d4bb68f436 wifi: iwlegacy: add missing mutex prot=
ection in il3945_store_measurement()<br>
&gt;=C2=A0 =C2=A0 =C2=A0941e3066441c wifi: iwlegacy: add missing mutex prot=
ection in il4965_store_tx_power()<br>
&gt;=C2=A0 =C2=A0 =C2=A02ace7ac88cb0 net: hns3: extend HCLGE_FD_AD_QID to 1=
1 bits<br>
&gt;=C2=A0 =C2=A0 =C2=A0d5cd3bb7794e ipv4: igmp: annotate data-races around=
 idev-&gt;mr_maxdelay<br>
&gt;=C2=A0 =C2=A0 =C2=A0ab2848d3783a gro: change the BUG_ON() in gro_pull_f=
rom_frag0()<br>
&gt;=C2=A0 =C2=A0 =C2=A0f0f729bdffb0 net/rds: No shortcut out of RDS_CONN_E=
RROR<br>
&gt;=C2=A0 =C2=A0 =C2=A0db62e9f44838 wifi: iwlwifi: mvm: check the validity=
 of noa_len<br>
&gt;=C2=A0 =C2=A0 =C2=A0116bc0980e91 net: usb: r8152: fix transmit queue ti=
meout<br>
&gt;=C2=A0 =C2=A0 =C2=A0f4bf64072c36 openrisc: define arch-specific version=
 of nop()<br>
&gt;=C2=A0 =C2=A0 =C2=A007a9b32eaae7 netfilter: xt_tcpmss: check remaining =
length before reading optlen<br>
&gt;=C2=A0 =C2=A0 =C2=A089f50775d883 netfilter: nf_conntrack: Add allow_cla=
sh to generic protocol handler<br>
&gt;=C2=A0 =C2=A0 =C2=A099c75e53cec0 ext4: mark group extend fast-commit in=
eligible<br>
&gt;=C2=A0 =C2=A0 =C2=A00d5fcb063cda ext4: move ext4_percpu_param_init() be=
fore ext4_mb_init()<br>
&gt;=C2=A0 =C2=A0 =C2=A083b074b69022 ext4: mark group add fast-commit ineli=
gible<br>
&gt;=C2=A0 =C2=A0 =C2=A046ed4e9c8d30 ipv6: exthdrs: annotate data-race over=
 multiple sysctl<br>
&gt;=C2=A0 =C2=A0 =C2=A055170230de66 ipv6: annotate data-races in ip6_multi=
path_hash_{policy,fields}()<br>
&gt;=C2=A0 =C2=A0 =C2=A0f73528f140f1 wifi: ath12k: fix preferred hardware m=
ode calculation<br>
&gt;=C2=A0 =C2=A0 =C2=A0c5547727bd1c wifi: ath11k: add pm quirk for Thinkpa=
d Z13/Z16 Gen1<br>
&gt;=C2=A0 =C2=A0 =C2=A0ddfe47664cc6 PCI: dw-rockchip: Disable BAR 0 and BA=
R 1 for Root Port<br>
&gt;=C2=A0 =C2=A0 =C2=A0d880c9b73890 wifi: rtw89: wow: add reason codes for=
 disassociation in WoWLAN mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0f2f65b28d802 iommu/amd: move wait_on_sem() out of s=
pinlock<br>
&gt;=C2=A0 =C2=A0 =C2=A05bfb25495e39 wifi: libertas: fix WARNING in usb_tx_=
block<br>
&gt;=C2=A0 =C2=A0 =C2=A09ff4843e6ea3 iommu/arm-smmu-v3: Improve CMDQ lock f=
airness and efficiency<br>
&gt;=C2=A0 =C2=A0 =C2=A04f9e7ca933a9 dm: remove fake timeout to avoid leak =
request<br>
&gt;=C2=A0 =C2=A0 =C2=A0df379f57c2cd dm: replace -EEXIST with -EBUSY<br>
&gt;=C2=A0 =C2=A0 =C2=A0dd181178c245 wifi: rtw88: rtw8821cu: Add ID for Mer=
cusys MU6H<br>
&gt;=C2=A0 =C2=A0 =C2=A0a96d161cfdb1 wifi: rtw88: 8822b: Avoid WARNING in r=
tw8822b_config_trx_mode()<br>
&gt;=C2=A0 =C2=A0 =C2=A09fdce77e38c1 wifi: rtw88: fix DTIM period handling =
when conf-&gt;dtim_period is zero<br>
&gt;=C2=A0 =C2=A0 =C2=A0f70fcbc2ac7c jfs: nlink overflow in jfs_rename<br>
&gt;=C2=A0 =C2=A0 =C2=A068f7fc769243 jfs: Add missing set_freezable() for f=
reezable kthread<br>
&gt;=C2=A0 =C2=A0 =C2=A034506cb119bb ALSA: usb-audio: Add iface reset and d=
elay quirk for AB13X USB Audio<br>
&gt;=C2=A0 =C2=A0 =C2=A08fb5c4c979ae modpost: Amend ppc64 save/restfpr symn=
ames for -Os build<br>
&gt;=C2=A0 =C2=A0 =C2=A0fecfe41f7ed0 ASoC: es8328: Add error unwind in resu=
me<br>
&gt;=C2=A0 =C2=A0 =C2=A018c67fb3750b hwmon: (f71882fg) Add F81968 support<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0f8ddbe303419 hwmon: (nct6775) Add ASUS Pro WS WRX90=
E-SAGE SE<br>
&gt;=C2=A0 =C2=A0 =C2=A02d48f60307e6 ASoC: codecs: max98390: Check return v=
alue of devm_gpiod_get_optional() in max98390_i2c_probe()<br>
&gt;=C2=A0 =C2=A0 =C2=A03383271464b7 spi: spi-mem: Protect dirmap_create() =
with spi_mem_access_start/end<br>
&gt;=C2=A0 =C2=A0 =C2=A019513daa8d13 ASoC: sunxi: sun50i-dmic: Add missing =
check for devm_regmap_init_mmio<br>
&gt;=C2=A0 =C2=A0 =C2=A0d1b6536ac20d gpio: aspeed-sgpio: Change the macro t=
o support deferred probe<br>
&gt;=C2=A0 =C2=A0 =C2=A098c0e07dc7d6 ALSA: hda/conexant: Add headset mic fi=
x for MECHREVO Wujie 15X Pro<br>
&gt;=C2=A0 =C2=A0 =C2=A049afc2e5bfae HID: elecom: Add support for ELECOM HU=
GE Plus M-HT1MRBK<br>
&gt;=C2=A0 =C2=A0 =C2=A04df1e6252d07 HID: multitouch: add eGalaxTouch EXC31=
88 support<br>
&gt;=C2=A0 =C2=A0 =C2=A0876bb1eabdb1 media: rkisp1: Fix filter mode registe=
r configuration<br>
&gt;=C2=A0 =C2=A0 =C2=A0ac2d898da509 drm/atmel-hlcdc: fix use-after-free of=
 drm_crtc_commit after release<br>
&gt;=C2=A0 =C2=A0 =C2=A080b8b0df370f drm/atmel-hlcdc: don&#39;t reject the =
commit if the src rect has fractional parts<br>
&gt;=C2=A0 =C2=A0 =C2=A0ec40702029b0 drm/atmel-hlcdc: fix memory leak from =
the atomic_destroy_state callback<br>
&gt;=C2=A0 =C2=A0 =C2=A0af67b50311e7 virt: vbox: uapi: Mark inner unions in=
 packed structs as packed<br>
&gt;=C2=A0 =C2=A0 =C2=A034eae7e0ab61 hyper-v: Mark inner union in hv_kvp_ex=
chg_msg_value as packed<br>
&gt;=C2=A0 =C2=A0 =C2=A0bbfaa5761f58 drm: Account property blob allocations=
 to memcg<br>
&gt;=C2=A0 =C2=A0 =C2=A0e97de3e924b3 drm/amdkfd: Fix GART PTE for non-4K pa=
gesize in svm_migrate_gart_map()<br>
&gt;=C2=A0 =C2=A0 =C2=A030aaed311f97 media: v4l2-async: Fix error handling =
on steps after finding a match<br>
&gt;=C2=A0 =C2=A0 =C2=A04010e596d23c media: cx25821: Fix a resource leak in=
 cx25821_dev_setup()<br>
&gt;=C2=A0 =C2=A0 =C2=A033af366211ee media: solo6x10: Check for out of boun=
ds chip_id<br>
&gt;=C2=A0 =C2=A0 =C2=A04ba5c7a1aade media: pvrusb2: fix URB leak in pvr2_s=
end_request_ex<br>
&gt;=C2=A0 =C2=A0 =C2=A045d9a0cd1b88 media: adv7180: fix frame interval in =
progressive mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0f5a5a824f0ac media: amphion: Clear last_buffer_dequ=
eued flag for DEC_CMD_START<br>
&gt;=C2=A0 =C2=A0 =C2=A081bc7d5e7897 spi: spi-mem: Limit octal DTR constrai=
nts to octal DTR situations<br>
&gt;=C2=A0 =C2=A0 =C2=A0822530fb85d8 ASoC: wm8962: Don&#39;t report a micro=
phone if it&#39;s shorted to ground on plug<br>
&gt;=C2=A0 =C2=A0 =C2=A021f6e02a1910 ASoC: wm8962: Add WM8962_ADC_MONOMIX t=
o &quot;3D Coefficients&quot; mask<br>
&gt;=C2=A0 =C2=A0 =C2=A004184bcb50f5 HID: apple: Add &quot;SONiX KN85 Keybo=
ard&quot; to the list of non-apple keyboards<br>
&gt;=C2=A0 =C2=A0 =C2=A055462d16cb9c drm/amdgpu: avoid a warning in timedou=
t job handler<br>
&gt;=C2=A0 =C2=A0 =C2=A040e0b938db37 drm/amdgpu: add support for HDP IP ver=
sion 6.1.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0b0d35bc9c159 media: mediatek: vcodec: Don&#39;t try=
 to decode 422/444 VP9<br>
&gt;=C2=A0 =C2=A0 =C2=A038ef3e1e1e9b media: omap3isp: set initial format<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0d490523d2374 media: omap3isp: isppreview: always cl=
amp in preview_try_format()<br>
&gt;=C2=A0 =C2=A0 =C2=A0a9d1d7d27151 media: omap3isp: isp_video_mbus_to_pix=
/pix_to_mbus fixes<br>
&gt;=C2=A0 =C2=A0 =C2=A02663ef70c612 drm/v3d: Set DMA segment size to avoid=
 debug warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A050e8aac244e7 spi: stm32: fix Overrun issue at &lt; =
8bpw<br>
&gt;=C2=A0 =C2=A0 =C2=A08b971c21603a media: dvb-core: dmxdevfilter must alw=
ays flush bufs<br>
&gt;=C2=A0 =C2=A0 =C2=A0b2a97f2259f6 spi-geni-qcom: use xfer-&gt;bits_per_w=
ord for can_dma()<br>
&gt;=C2=A0 =C2=A0 =C2=A05d0814ad6654 spi-geni-qcom: initialize mode related=
 registers to 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0ac9a7c329a56 drm/display/dp_mst: Add protection aga=
inst 0 vcpi<br>
&gt;=C2=A0 =C2=A0 =C2=A0afa0bfe1437d parisc: Prevent interrupts during rebo=
ot<br>
&gt;=C2=A0 =C2=A0 =C2=A012535a5d5d64 arm64: tegra: smaug: Add usb-role-swit=
ch support<br>
&gt;=C2=A0 =C2=A0 =C2=A01da904e84de6 pstore: ram_core: fix incorrect succes=
s return when vmap() fails<br>
&gt;=C2=A0 =C2=A0 =C2=A0a4345acbe390 char: tpm: cr50: Remove IRQF_ONESHOT<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A03e656f767407 mailbox: bcm-ferxrm-mailbox: Use defau=
lt primary handler<br>
&gt;=C2=A0 =C2=A0 =C2=A07b9394e49720 crypto: hisilicon/qm - move the barrie=
r before writing to the mailbox register<br>
&gt;=C2=A0 =C2=A0 =C2=A05f007c6acaa7 PCI/MSI: Unmap MSI-X region on error<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0f557c206c32e clocksource/drivers/timer-integrator-a=
p: Add missing Kconfig dependency on OF<br>
&gt;=C2=A0 =C2=A0 =C2=A06f113ab549b8 clocksource/drivers/sh_tmu: Always lea=
ve device running after probe<br>
&gt;=C2=A0 =C2=A0 =C2=A0c8a34bceefbc bpf: verifier improvement in 32bit shi=
ft sign extension pattern<br>
&gt;=C2=A0 =C2=A0 =C2=A047bbd0cb7db3 sparc: don&#39;t reference obsolete te=
rmio struct for TC* constants<br>
&gt;=C2=A0 =C2=A0 =C2=A06aa04820dbfe sparc: Synchronize user stack on fork =
and clone<br>
&gt;=C2=A0 =C2=A0 =C2=A0648aa7ce0bd8 blk-mq-debugfs: add missing debugfs_mu=
tex in blk_mq_debugfs_register_hctxs()<br>
&gt;=C2=A0 =C2=A0 =C2=A09150176cbf71 xenbus: Use .freeze/.thaw to handle xe=
nbus devices<br>
&gt;=C2=A0 =C2=A0 =C2=A02050a5cff32c perf/cxlpmu: Replace IRQF_ONESHOT with=
 IRQF_NO_THREAD<br>
&gt;=C2=A0 =C2=A0 =C2=A084a17b7b292d s390/perf: Disable register readout on=
 sampling events<br>
&gt;=C2=A0 =C2=A0 =C2=A0bafd4aa1908a cpufreq: dt-platdev: Block the driver =
from probing on more QC platforms<br>
&gt;=C2=A0 =C2=A0 =C2=A0a61c1bc84c4a md-cluster: fix NULL pointer dereferen=
ce in process_metadata_update<br>
&gt;=C2=A0 =C2=A0 =C2=A0b4a0b646cc28 ACPICA: Abort AML bytecode execution w=
hen executing AML_FATAL_OP<br>
&gt;=C2=A0 =C2=A0 =C2=A001e8751b37a3 ACPI: processor: Fix NULL-pointer dere=
ference in acpi_processor_errata_piix4()<br>
&gt;=C2=A0 =C2=A0 =C2=A064eb63f573f4 EFI/CPER: don&#39;t go past the ARM pr=
ocessor CPER record buffer<br>
&gt;=C2=A0 =C2=A0 =C2=A0e0ec99115e13 APEI/GHES: ensure that won&#39;t go pa=
st CPER allocated record<br>
&gt;=C2=A0 =C2=A0 =C2=A05a9b1dda8481 EFI/CPER: don&#39;t dump the entire me=
mory region<br>
&gt;=C2=A0 =C2=A0 =C2=A06ea4b7bc2e7b x86/xen/pvh: Enable PAE mode for 32-bi=
t guest only when CONFIG_X86_PAE is set<br>
&gt;=C2=A0 =C2=A0 =C2=A030868a6a5238 rnbd-srv: Zero the rsp buffer before u=
sing it<br>
&gt;=C2=A0 =C2=A0 =C2=A0fd7e360845d3 arm64: Add support for TSV110 Spectre-=
BHB mitigation<br>
&gt;=C2=A0 =C2=A0 =C2=A094ab05af1d96 perf/arm-cmn: Support CMN-600AE<br>
&gt;=C2=A0 =C2=A0 =C2=A061cd0b287fb9 s390/purgatory: Add -Wno-default-const=
-init-unsafe to KBUILD_CFLAGS<br>
&gt;=C2=A0 =C2=A0 =C2=A07823e09a68b5 tools/power cpupower: Reset errno befo=
re strtoull()<br>
&gt;=C2=A0 =C2=A0 =C2=A093e8e3ee165a smb: client: prevent races in -&gt;que=
ry_interfaces()<br>
&gt;=C2=A0 =C2=A0 =C2=A0e428670cfb29 gfs2: fiemap page fault fix<br>
&gt;=C2=A0 =C2=A0 =C2=A0048b58edc57d smb: client: add proper locking around=
 ses-&gt;iface_last_update<br>
&gt;=C2=A0 =C2=A0 =C2=A08b5dcfa97bf3 btrfs: handle user interrupt properly =
in btrfs_trim_fs()<br>
&gt;=C2=A0 =C2=A0 =C2=A02bb588cede1c minix: Add required sanity checking to=
 minix_check_superblock()<br>
&gt;=C2=A0 =C2=A0 =C2=A043ccadb866de i3c: master: svc: Initialize &#39;dev&=
#39; to NULL in svc_i3c_master_ibi_isr()<br>
&gt;=C2=A0 =C2=A0 =C2=A0de9affb698d5 hfsplus: pretend special inodes as reg=
ular files<br>
&gt;=C2=A0 =C2=A0 =C2=A0f5d27ad99fca audit: add missing syscalls to read cl=
ass<br>
&gt;=C2=A0 =C2=A0 =C2=A0c1b6227555c5 fs/buffer: add alert in try_to_free_bu=
ffers() for folios without buffers<br>
&gt;=C2=A0 =C2=A0 =C2=A0bccd4ebbdac3 hfsplus: fix volume corruption issue f=
or generic/498<br>
&gt;=C2=A0 =C2=A0 =C2=A091e27bc79c3b audit: add fchmodat2() to change attri=
butes class<br>
&gt;=C2=A0 =C2=A0 =C2=A04bde6678bc54 rtc: interface: Alarm race handling sh=
ould not discard preceding error<br>
&gt;=C2=A0 =C2=A0 =C2=A04927e2d29b74 libperf build: Always place libperf in=
cludes first<br>
&gt;=C2=A0 =C2=A0 =C2=A05cf6e76e4f4f libperf: Don&#39;t remove -g when EXTR=
A_CFLAGS are used<br>
&gt;=C2=A0 =C2=A0 =C2=A066e9b70c64df libsubcmd: Fix null intersection case =
in exclude_cmds()<br>
&gt;=C2=A0 =C2=A0 =C2=A056042755b72f perf callchain: Fix srcline printing w=
ith inlines<br>
&gt;=C2=A0 =C2=A0 =C2=A0eddddf4ed7f6 perf unwind-libdw: Fix invalid referen=
ce counts<br>
&gt;=C2=A0 =C2=A0 =C2=A0985d844a5997 perf test stat tests: Fix for virtuali=
zed machines<br>
&gt;=C2=A0 =C2=A0 =C2=A0fa99e8717a68 perf test stat: Update test expectatio=
ns and events<br>
&gt;=C2=A0 =C2=A0 =C2=A08f36abf181c2 ASoC: dt-bindings: asahi-kasei,ak5558:=
 Fix the supply names<br>
&gt;=C2=A0 =C2=A0 =C2=A0f939f666ec02 ASoC: dt-bindings: asahi-kasei,ak4458:=
 Fix the supply names<br>
&gt;=C2=A0 =C2=A0 =C2=A0ce18fa88b154 ASoC: dt-bindings: asahi-kasei,ak4458:=
 set unevaluatedProperties:false<br>
&gt;=C2=A0 =C2=A0 =C2=A0655c9ba9915f SUNRPC: fix gss_auth kref leak in gss_=
alloc_msg error path<br>
&gt;=C2=A0 =C2=A0 =C2=A0df10f23defff SUNRPC: auth_gss: fix memory leaks in =
XDR decoding error paths<br>
&gt;=C2=A0 =C2=A0 =C2=A097503a852d3b ata: libata-scsi: refactor ata_scsi_tr=
anslate()<br>
&gt;=C2=A0 =C2=A0 =C2=A051680e9a1680 ata: pata_ftide010: Fix some DMA timin=
gs<br>
&gt;=C2=A0 =C2=A0 =C2=A0f18f70123962 ext4: use optimized mballoc scanning r=
egardless of inode format<br>
&gt;=C2=A0 =C2=A0 =C2=A04a79fde8db7e ext4: fix memory leak in ext4_ext_shif=
t_extents()<br>
&gt;=C2=A0 =C2=A0 =C2=A093b2ebbbcb2e ext4: don&#39;t cache extent during sp=
litting extent<br>
&gt;=C2=A0 =C2=A0 =C2=A0c0155dee51b9 MIPS: Work around LLVM bug when gp is =
used as global register variable<br>
&gt;=C2=A0 =C2=A0 =C2=A0c941c268ad00 drm/amd/display: Use same max plane sc=
aling limits for all 64 bpp formats<br>
&gt;=C2=A0 =C2=A0 =C2=A0da0959402742 ASoC: rockchip: i2s-tdm: Use param rat=
e if not provided by set_sysclk<br>
&gt;=C2=A0 =C2=A0 =C2=A05fed5f6c6a02 x86/hyperv: Fix error pointer derefere=
nce<br>
&gt;=C2=A0 =C2=A0 =C2=A01ee1d006c9fe btrfs: fix invalid leaf access in btrf=
s_quota_enable() if ref key not found<br>
&gt;=C2=A0 =C2=A0 =C2=A0b7bc182ec184 efi: Fix reservation of unaccepted mem=
ory table<br>
&gt;=C2=A0 =C2=A0 =C2=A03222c8020aeb s390/kexec: Make KEXEC_SIG available w=
hen CONFIG_MODULES=3Dn<br>
&gt;=C2=A0 =C2=A0 =C2=A09e5cb7e67fbd spi: wpcm-fiu: Fix potential NULL poin=
ter dereference in wpcm_fiu_probe()<br>
&gt;=C2=A0 =C2=A0 =C2=A0a98d73dcc339 spi: wpcm-fiu: Simplify with dev_err_p=
robe()<br>
&gt;=C2=A0 =C2=A0 =C2=A0978137e940de spi: wpcm-fiu: Fix uninitialized res<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A087e463136302 spi: wpcm-fiu: Use devm_platform_iorem=
ap_resource_byname()<br>
&gt;=C2=A0 =C2=A0 =C2=A0971bf8e61e9b drm/amdkfd: Fix watch_id bounds checki=
ng in debug address watch v2<br>
&gt;=C2=A0 =C2=A0 =C2=A017e94789c216 drm/amdkfd: fix debug watchpoints for =
logical devices<br>
&gt;=C2=A0 =C2=A0 =C2=A0e975148b2c29 ASoC: codecs: aw88261: Fix erroneous b=
itmask logic in Awinic init<br>
&gt;=C2=A0 =C2=A0 =C2=A03a2f5a21285b drm/i915/acpi: free _DSM package when =
no connectors<br>
&gt;=C2=A0 =C2=A0 =C2=A029b2fbe3498d ASoC: fsl_xcvr: Revert fix missing loc=
k in fsl_xcvr_mode_put()<br>
&gt;=C2=A0 =C2=A0 =C2=A0f8a5426652bd drm/amdgpu: Fix memory leak in amdgpu_=
ras_init()<br>
&gt;=C2=A0 =C2=A0 =C2=A0e87c73a80a12 drm/amdgpu: Fix memory leak in amdgpu_=
acpi_enumerate_xcc()<br>
&gt;=C2=A0 =C2=A0 =C2=A08dc6beca70f0 apparmor: fix aa_label to return state=
 from compount and component match<br>
&gt;=C2=A0 =C2=A0 =C2=A0b25298e89a29 apparmor: fix invalid deref of rawdata=
 when export_binary is unset<br>
&gt;=C2=A0 =C2=A0 =C2=A0dbbe0a2e3e4b apparmor: make label_match return a co=
nsistent value<br>
&gt;=C2=A0 =C2=A0 =C2=A00563743d3f70 apparmor: remove apply_modes_to_perms =
from label_match<br>
&gt;=C2=A0 =C2=A0 =C2=A032928c1749e8 apparmor: refcount the pdb<br>
&gt;=C2=A0 =C2=A0 =C2=A0f89b657e1785 apparmor: provide separate audit messa=
ges for file and policy checks<br>
&gt;=C2=A0 =C2=A0 =C2=A0e78e00cf9eba apparmor: use passed in gfp flags in a=
a_alloc_null()<br>
&gt;=C2=A0 =C2=A0 =C2=A01f736dfe27c8 apparmor: fix rlimit for posix cpu tim=
ers<br>
&gt;=C2=A0 =C2=A0 =C2=A024bb7d11dc30 apparmor: return -ENOMEM in unpack_per=
ms_table upon alloc failure<br>
&gt;=C2=A0 =C2=A0 =C2=A00dc19bca2260 apparmor: fix NULL sock in aa_sock_fil=
e_perm<br>
&gt;=C2=A0 =C2=A0 =C2=A0a4ff9e4f4ad4 net/mlx5: Fix multiport device check o=
ver light SFs<br>
&gt;=C2=A0 =C2=A0 =C2=A0f94a0de7b9f3 bonding: alb: fix UAF in rlb_arp_recv =
during bond up/down<br>
&gt;=C2=A0 =C2=A0 =C2=A08bc48c4fb636 octeontx2-af: Fix default entries mcam=
 entry action<br>
&gt;=C2=A0 =C2=A0 =C2=A03f483a90634d inet: move icmp_global_{credit,stamp} =
to a separate cache line<br>
&gt;=C2=A0 =C2=A0 =C2=A0c9141a794fdc cache: add __cacheline_group_{begin, e=
nd}_aligned() (+ couple more)<br>
&gt;=C2=A0 =C2=A0 =C2=A08dacf34eb427 netns-ipv4: reorganize netns_ipv4 fast=
 path variables<br>
&gt;=C2=A0 =C2=A0 =C2=A01402ebe132a9 cache: enforce cache groups<br>
&gt;=C2=A0 =C2=A0 =C2=A04ec8a98b3dc3 tcp: Set pingpong threshold via sysctl=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0b4d5e97679bc tcp: defer regular ACK while processin=
g socket backlog<br>
&gt;=C2=A0 =C2=A0 =C2=A022023ffad74c icmp: prevent possible overflow in icm=
p_global_allow()<br>
&gt;=C2=A0 =C2=A0 =C2=A0b0da61015db2 icmp: icmp_msgs_per_sec and icmp_msgs_=
burst sysctls become per netns<br>
&gt;=C2=A0 =C2=A0 =C2=A0e0987b6c3b34 icmp: move icmp_global.credit and icmp=
_global.stamp to per netns storage<br>
&gt;=C2=A0 =C2=A0 =C2=A019c7d8ac5198 macvlan: observe an RCU grace period i=
n macvlan_common_newlink() error path<br>
&gt;=C2=A0 =C2=A0 =C2=A0b5c84070333a ping: annotate data-races in ping_look=
up()<br>
&gt;=C2=A0 =C2=A0 =C2=A06b6b2fbd66d8 bpftool: Fix truncated netlink dumps<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0db4636748c22 ipv6: fix a race in ip6_sock_set_v6onl=
y()<br>
&gt;=C2=A0 =C2=A0 =C2=A07017745068a9 netfilter: nf_tables: fix use-after-fr=
ee in nf_tables_addchain()<br>
&gt;=C2=A0 =C2=A0 =C2=A09464ca7a6e56 net: remove WARN_ON_ONCE when accessin=
g forward path array<br>
&gt;=C2=A0 =C2=A0 =C2=A060e921703943 netfilter: nf_conntrack_h323: don&#39;=
t pass uninitialised l3num value<br>
&gt;=C2=A0 =C2=A0 =C2=A0f199874c199b selftests: forwarding: vxlan_bridge_1d=
_ipv6: fix test failure with br_netfilter enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A03c2b767a8ae2 selftests: forwarding: vxlan_bridge_1d=
: fix test failure with br_netfilter enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0d0fdad1bdd21 net: bridge: mcast: always update mdb_=
n_entries for vlan contexts<br>
&gt;=C2=A0 =C2=A0 =C2=A0779a9ae0ef22 net/rds: rds_sendmsg should not discar=
d payload_len<br>
&gt;=C2=A0 =C2=A0 =C2=A088b0fced1bbb xen-netback: reject zero-queue configu=
ration from guest<br>
&gt;=C2=A0 =C2=A0 =C2=A0163d04897e57 net: usb: catc: enable basic endpoint =
checking<br>
&gt;=C2=A0 =C2=A0 =C2=A0b067e6c7973b net: sparx5/lan969x: fix PTP clock max=
_adj value<br>
&gt;=C2=A0 =C2=A0 =C2=A0bcc60ad129ae ipv6: Fix out-of-bound access in fib6_=
add_rt2node().<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc1b179f778f net: mscc: ocelot: add missing lock pr=
otection in ocelot_port_xmit_inj()<br>
&gt;=C2=A0 =C2=A0 =C2=A0357a3544a385 net: mscc: ocelot: split xmit into FDM=
A and register injection paths<br>
&gt;=C2=A0 =C2=A0 =C2=A0487fac2388ad net: mscc: ocelot: extract ocelot_xmit=
_timestamp() helper<br>
&gt;=C2=A0 =C2=A0 =C2=A0d6f03772d9c0 net: sparx5/lan969x: fix DWRR cost max=
 to match hardware register width<br>
&gt;=C2=A0 =C2=A0 =C2=A09eefda7a03ef selftests: mlxsw: tc_restrictions: Fix=
 test failure with new iproute2<br>
&gt;=C2=A0 =C2=A0 =C2=A05c577ac939bc cpuidle: Skip governor when only one i=
dle state is available<br>
&gt;=C2=A0 =C2=A0 =C2=A07bb9178df6f0 ACPI: PM: Add unused power resource qu=
irk for THUNDEROBOT ZERO<br>
&gt;=C2=A0 =C2=A0 =C2=A0d389943443c5 selftests/memfd: use IPC semaphore ins=
tead of SIGSTOP/SIGCONT<br>
&gt;=C2=A0 =C2=A0 =C2=A02efc98314a61 selftests/memfd: delete unused declara=
tions<br>
&gt;=C2=A0 =C2=A0 =C2=A0d809ee17c0d1 kbuild: Add objtool to top-level clean=
 target<br>
&gt;=C2=A0 =C2=A0 =C2=A0e156a104ba26 powercap: intel_rapl_tpmi: Remove FW_B=
UG from invalid version check<br>
&gt;=C2=A0 =C2=A0 =C2=A0727992102836 ACPI: CPPC: Fix remaining for_each_pos=
sible_cpu() to use online CPUs<br>
&gt;=C2=A0 =C2=A0 =C2=A0a584b9d1059b fs/ntfs3: Fix slab-out-of-bounds read =
in DeleteIndexEntryRoot<br>
&gt;=C2=A0 =C2=A0 =C2=A071c8b966ec56 fs/ntfs3: prevent infinite loops cause=
d by the next valid being the same<br>
&gt;=C2=A0 =C2=A0 =C2=A0fb2d7c30d030 io_uring/cancel: de-unionize file and =
user_data in struct io_cancel_data<br>
&gt;=C2=A0 =C2=A0 =C2=A0533d495f15e4 dmaengine: fsl-edma: don&#39;t explici=
tly disable clocks in .remove()<br>
&gt;=C2=A0 =C2=A0 =C2=A0592833ea0051 dmaengine: fsl-edma-main: Convert to p=
latform remove callback returning void<br>
&gt;=C2=A0 =C2=A0 =C2=A0a489f1fd52bc backlight: qcom-wled: Change PM8950 WL=
ED configurations<br>
&gt;=C2=A0 =C2=A0 =C2=A082f2eaab2f94 backlight: qcom-wled: Support ovp valu=
es for PMI8994<br>
&gt;=C2=A0 =C2=A0 =C2=A097790c9b255d leds: qcom-lpg: Check the return value=
 of regmap_bulk_write()<br>
&gt;=C2=A0 =C2=A0 =C2=A099cc7352156c pinctrl: single: fix refcount leak in =
pcs_add_gpio_func()<br>
&gt;=C2=A0 =C2=A0 =C2=A0eccf17c0a801 pinctrl: qcom: sm8250-lpass-lpi: Fix i=
2s2_data_groups definition<br>
&gt;=C2=A0 =C2=A0 =C2=A0e8e960c3d23f iio: sca3000: Fix a resource leak in s=
ca3000_probe()<br>
&gt;=C2=A0 =C2=A0 =C2=A043b6f69e1806 ovl: Fix uninit-value in ovl_fill_real=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0d26685b2d9ad pinctrl: equilibrium: Fix device node =
reference leak in pinbank_init()<br>
&gt;=C2=A0 =C2=A0 =C2=A04f531b1a5468 usb: bdc: fix sleep during atomic<br>
&gt;=C2=A0 =C2=A0 =C2=A0c5bde5357e10 drivers: iio: mpu3050: use dev_err_pro=
be for regulator request<br>
&gt;=C2=A0 =C2=A0 =C2=A029040d42d641 mfd: simple-mfd-i2c: Add Delta TN48M C=
PLD support<br>
&gt;=C2=A0 =C2=A0 =C2=A0fd1a3a0b98a9 mfd: simple-mfd-i2c: Keep compatible s=
trings in alphabetical order<br>
&gt;=C2=A0 =C2=A0 =C2=A0d9e5d3e1924a mfd: simple-mfd-i2c: Add SpacemiT P1 s=
upport<br>
&gt;=C2=A0 =C2=A0 =C2=A007fb61ff35fd mfd: simple-mfd-i2c: Add compatible st=
rings for Layerscape QIXIS FPGA<br>
&gt;=C2=A0 =C2=A0 =C2=A0b07aa526d053 mfd: simple-mfd-i2c: Add MAX77705 supp=
ort<br>
&gt;=C2=A0 =C2=A0 =C2=A03ea01691738b mfd: arizona: Fix regulator resource l=
eak on wm5102_clear_write_sequencer() failure<br>
&gt;=C2=A0 =C2=A0 =C2=A09c858ef369bb Revert &quot;mmc: rtsx_pci_sdmmc: incr=
ease power-on settling delay to 5ms&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b359ca27c589 coresight: etm3x: Fix cpulocked warnin=
g on cpuhp<br>
&gt;=C2=A0 =C2=A0 =C2=A02fad88d7760c watchdog: starfive-wdt: Fix PM referen=
ce leak in probe error path<br>
&gt;=C2=A0 =C2=A0 =C2=A07281a0c907cc iio: pressure: mprls0025pa: fix scan_t=
ype struct<br>
&gt;=C2=A0 =C2=A0 =C2=A06dd1e95cc554 mmc: rtsx_pci_sdmmc: increase power-on=
 settling delay to 5ms<br>
&gt;=C2=A0 =C2=A0 =C2=A024ec8015beca serial: SH_SCI: improve &quot;DMA supp=
ort&quot; prompt<br>
&gt;=C2=A0 =C2=A0 =C2=A0c233e1e81873 serial: imx: change SERIAL_IMX_CONSOLE=
 to bool<br>
&gt;=C2=A0 =C2=A0 =C2=A065f2c608096d staging: greybus: lights: avoid NULL d=
eref<br>
&gt;=C2=A0 =C2=A0 =C2=A0e230aee60444 dma: dma-axi-dmac: fix SW cyclic trans=
fers<br>
&gt;=C2=A0 =C2=A0 =C2=A06be32baf6541 dmaengine: mediatek: uart-apdma: Fix a=
bove 4G addressing TX/RX<br>
&gt;=C2=A0 =C2=A0 =C2=A006c8ed283635 clk: mediatek: Fix error handling in r=
untime PM setup<br>
&gt;=C2=A0 =C2=A0 =C2=A0547ae2f17349 clk: qcom: gfx3d: add parent to parent=
 request map<br>
&gt;=C2=A0 =C2=A0 =C2=A0bb5de8aca640 clk: qcom: dispcc-sdm845: Enable paren=
ts for pixel clocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0ae56e2c27f6d clk: Move clk_{save,restore}_context()=
 to COMMON_CLK section<br>
&gt;=C2=A0 =C2=A0 =C2=A0d81b51c8a7ed clk: qcom: gcc-ipq5018: flag sleep clo=
ck as critical<br>
&gt;=C2=A0 =C2=A0 =C2=A0048fbee3e431 clk: qcom: gcc-msm8917: Remove ALWAYS_=
ON flag from cpp_gdsc<br>
&gt;=C2=A0 =C2=A0 =C2=A0df1c437bfca4 clk: qcom: gcc-msm8953: Remove ALWAYS_=
ON flag from cpp_gdsc<br>
&gt;=C2=A0 =C2=A0 =C2=A0915e7579855e clk: qcom: gcc-qdu1000: Update the SDC=
C RCGs to use shared_floor_ops<br>
&gt;=C2=A0 =C2=A0 =C2=A0d31b1b143819 clk: qcom: gcc-sdx75: Update the SDCC =
RCGs to use shared_floor_ops<br>
&gt;=C2=A0 =C2=A0 =C2=A045a013dabc5f clk: qcom: gcc-sm8450: Update the SDCC=
 RCGs to use shared_floor_ops<br>
&gt;=C2=A0 =C2=A0 =C2=A0ac003c1a80d9 clk: meson: gxbb: Limit the HDMI PLL O=
D to /4 on GXL/GXM SoCs<br>
&gt;=C2=A0 =C2=A0 =C2=A01e1664eb6f24 clk: qcom: rcg2: compute 2d using duty=
 fraction directly<br>
&gt;=C2=A0 =C2=A0 =C2=A08cb92d27454e clk: qcom: gcc-sm8550: Use floor ops f=
or SDCC RCGs<br>
&gt;=C2=A0 =C2=A0 =C2=A03e5349e54113 fbdev: au1200fb: Fix a memory leak in =
au1200fb_drv_probe()<br>
&gt;=C2=A0 =C2=A0 =C2=A068dae7b64c31 fbdev: of_display_timing: Fix device n=
ode reference leak in of_get_display_timings()<br>
&gt;=C2=A0 =C2=A0 =C2=A0ca81f7811dfe tracing: Remove duplicate ENABLE_EVENT=
_STR and DISABLE_EVENT_STR macros<br>
&gt;=C2=A0 =C2=A0 =C2=A07e6556e9329b tracing: Properly process error handli=
ng in event_hist_trigger_parse()<br>
&gt;=C2=A0 =C2=A0 =C2=A0aa6e847e2795 fs/nfs: Fix readdir slow-start regress=
ion<br>
&gt;=C2=A0 =C2=A0 =C2=A0c1f244f7868c nvdimm: virtio_pmem: serialize flush r=
equests<br>
&gt;=C2=A0 =C2=A0 =C2=A025d623f0d77c scsi: csiostor: Fix dereference of nul=
l pointer rn<br>
&gt;=C2=A0 =C2=A0 =C2=A094a6c85a68bc scsi: ufs: host: mediatek: Require CON=
FIG_PM<br>
&gt;=C2=A0 =C2=A0 =C2=A0fdf1188cfa80 scsi: smartpqi: Fix memory leak in pqi=
_report_phys_luns()<br>
&gt;=C2=A0 =C2=A0 =C2=A08e3d91135417 pNFS: fix a missing wake up while wait=
ing on NFS_LAYOUT_DRAIN<br>
&gt;=C2=A0 =C2=A0 =C2=A034276d267742 RDMA/uverbs: Add __GFP_NOWARN to ib_uv=
erbs_unmarshall_recv() kmalloc<br>
&gt;=C2=A0 =C2=A0 =C2=A0685163733ed1 power: supply: qcom_battmgr: Recognize=
 &quot;LiP&quot; as lithium-polymer<br>
&gt;=C2=A0 =C2=A0 =C2=A0d2a6ca4c0748 mtd: spinand: Fix kernel doc<br>
&gt;=C2=A0 =C2=A0 =C2=A09fbbd62436ce mtd: parsers: ofpart: fix OF node refc=
ount leak in parse_fixed_partitions()<br>
&gt;=C2=A0 =C2=A0 =C2=A05f1a84bb4a95 cxl: Fix premature commit_end incremen=
t on decoder commit failure<br>
&gt;=C2=A0 =C2=A0 =C2=A0db830aea65e4 RDMA/core: add rdma_rw_max_sge() helpe=
r for SQ sizing<br>
&gt;=C2=A0 =C2=A0 =C2=A06faf28106ea1 svcrdma: Reduce the number of rdma_rw =
contexts per-QP<br>
&gt;=C2=A0 =C2=A0 =C2=A063a45e2a1264 svcrdma: Increase the per-transport rw=
_ctx count<br>
&gt;=C2=A0 =C2=A0 =C2=A046ccddede7be svcrdma: Clean up comment in svc_rdma_=
accept()<br>
&gt;=C2=A0 =C2=A0 =C2=A04965711d22a0 svcrdma: Remove queue-shortening warni=
ngs<br>
&gt;=C2=A0 =C2=A0 =C2=A091cb7ff68604 RDMA/core: Fix a couple of obvious typ=
os in comments<br>
&gt;=C2=A0 =C2=A0 =C2=A0756c93d6df7c RDMA/rxe: Fix race condition in QP tim=
er handlers<br>
&gt;=C2=A0 =C2=A0 =C2=A0bf1feed1a788 RDMA/uverbs: Validate wqe_size before =
using it in ib_uverbs_post_send<br>
&gt;=C2=A0 =C2=A0 =C2=A00f5e62ea5c43 mtd: parsers: Fix memory leak in mtd_p=
arser_tplink_safeloader_parse()<br>
&gt;=C2=A0 =C2=A0 =C2=A01733d168099e crypto: ccp - Send PSP_CMD_TEE_RING_DE=
STROY when PSP_CMD_TEE_RING_INIT fails<br>
&gt;=C2=A0 =C2=A0 =C2=A02abf05a122cf crypto: ccp - Factor out ring destroy =
handling to a helper<br>
&gt;=C2=A0 =C2=A0 =C2=A0b2e7e269aba9 crypto: ccp - Move direct access to so=
me PSP registers out of TEE<br>
&gt;=C2=A0 =C2=A0 =C2=A054541017ac6a crypto: ccp - Add an S4 restore flow<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A021f422a86ded mtd: rawnand: cadence: Fix return type=
 of CDMA send-and-wait helper<br>
&gt;=C2=A0 =C2=A0 =C2=A0bc779d426ef1 tools/power/x86/intel-speed-select: Fi=
x file descriptor leak in isolate_cpus()<br>
&gt;=C2=A0 =C2=A0 =C2=A026793db60925 RDMA/rxe: Fix double free in rxe_srq_f=
rom_init<br>
&gt;=C2=A0 =C2=A0 =C2=A09a0323f5e54e RDMA/rtrs-srv: fix SG mapping<br>
&gt;=C2=A0 =C2=A0 =C2=A086183153c299 power: supply: wm97xx: Fix NULL pointe=
r dereference in power_supply_changed()<br>
&gt;=C2=A0 =C2=A0 =C2=A03af85f239648 power: supply: bq27xxx: fix wrong errn=
o when bus ops are unsupported<br>
&gt;=C2=A0 =C2=A0 =C2=A07ac6501b587c power: reset: nvmem-reboot-mode: respe=
ct cell size for nvmem_cell_write<br>
&gt;=C2=A0 =C2=A0 =C2=A02078830c32d1 power: supply: sbs-battery: Fix use-af=
ter-free in power_supply_changed()<br>
&gt;=C2=A0 =C2=A0 =C2=A0af261f218a76 power: supply: rt9455: Fix use-after-f=
ree in power_supply_changed()<br>
&gt;=C2=A0 =C2=A0 =C2=A077ea437faa4c power: supply: goldfish: Fix use-after=
-free in power_supply_changed()<br>
&gt;=C2=A0 =C2=A0 =C2=A0cbb9b07f88a9 power: supply: cpcap-battery: Fix use-=
after-free in power_supply_changed()<br>
&gt;=C2=A0 =C2=A0 =C2=A00de95d29d847 power: supply: bq25980: Fix use-after-=
free in power_supply_changed()<br>
&gt;=C2=A0 =C2=A0 =C2=A0cb5c743936ed power: supply: bq256xx: Fix use-after-=
free in power_supply_changed()<br>
&gt;=C2=A0 =C2=A0 =C2=A0697bb5dc0cb4 power: supply: act8945a: Fix use-after=
-free in power_supply_changed()<br>
&gt;=C2=A0 =C2=A0 =C2=A0f50433f2603d power: supply: ab8500: Fix use-after-f=
ree in power_supply_changed()<br>
&gt;=C2=A0 =C2=A0 =C2=A02ad50784c9eb RDMA/hns: Notify ULP of remaining soft=
-WCs during reset<br>
&gt;=C2=A0 =C2=A0 =C2=A070a5eb757ace RDMA/hns: Fix WQ_MEM_RECLAIM warning<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A02fb573fa9d71 IB/cache: update gid cache on client r=
eregister event<br>
&gt;=C2=A0 =C2=A0 =C2=A004b41f1d0e33 RDMA/rtrs: server: remove dead code<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0d858a1d814d3 octeontx2-pf: Unregister devlink on pr=
obe failure<br>
&gt;=C2=A0 =C2=A0 =C2=A0320b54651a59 ionic: Rate limit unknown xcvr type me=
ssages<br>
&gt;=C2=A0 =C2=A0 =C2=A069042a930eae octeon_ep: ensure dbell BADDR updation=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0664355e6f130 octeon_ep: set backpressure watermark =
for RX queues<br>
&gt;=C2=A0 =C2=A0 =C2=A0dc4d11c5f316 octeon_ep: disable per ring interrupts=
<br>
&gt;=C2=A0 =C2=A0 =C2=A02c33c53a9c8c octeon_ep: support Octeon CN10K device=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A0a40e276b9696 octeon_ep: restructured interrupt hand=
lers<br>
&gt;=C2=A0 =C2=A0 =C2=A077c641b3bd4e octeon_ep: support to fetch firmware i=
nfo<br>
&gt;=C2=A0 =C2=A0 =C2=A0331e2b705163 serial: caif: fix use-after-free in ca=
if_serial ldisc_close()<br>
&gt;=C2=A0 =C2=A0 =C2=A02c1f59005da9 xfrm: fix ip_rt_bug race in icmp_route=
_lookup reverse path<br>
&gt;=C2=A0 =C2=A0 =C2=A0d621dd67a72d net: Switch to skb_dstref_steal/skb_ds=
tref_restore for ip_route_input callers<br>
&gt;=C2=A0 =C2=A0 =C2=A031ca4fbf56d1 net: Add skb_dstref_steal and skb_dstr=
ef_restore<br>
&gt;=C2=A0 =C2=A0 =C2=A0dea1465394ff net: sunhme: Fix sbus regression<br>
&gt;=C2=A0 =C2=A0 =C2=A0e3f80666c273 net: atm: fix crash due to unvalidated=
 vcc pointer in sigd_send()<br>
&gt;=C2=A0 =C2=A0 =C2=A0e131aac543cd smb: client: correct value for smbd_ma=
x_fragmented_recv_size<br>
&gt;=C2=A0 =C2=A0 =C2=A00e64bd46a04a procfs: fix missing RCU protection whe=
n reading real_parent in do_task_stat()<br>
&gt;=C2=A0 =C2=A0 =C2=A06dc10494cfe2 net: hns3: fix double free issue for t=
x spare buffer<br>
&gt;=C2=A0 =C2=A0 =C2=A044b2256b17f1 PCI: Add ACS quirk for Pericom PI7C9X2=
G404 switches [12d8:b404]<br>
&gt;=C2=A0 =C2=A0 =C2=A0f1535d56fc3f netfilter: nft_set_rbtree: check for p=
artial overlaps in anonymous sets<br>
&gt;=C2=A0 =C2=A0 =C2=A0f7eb1903c6e0 netfilter: nft_counter: fix reset of c=
ounters on 32bit archs<br>
&gt;=C2=A0 =C2=A0 =C2=A0cfe35cb86256 netfilter: nft_set_hash: fix get opera=
tion on big endian<br>
&gt;=C2=A0 =C2=A0 =C2=A077eef9f2eef0 nfc: hci: shdlc: Stop timers and work =
before freeing context<br>
&gt;=C2=A0 =C2=A0 =C2=A0db76b75ede38 inet: RAW sockets using IPPROTO_RAW MU=
ST drop incoming ICMP<br>
&gt;=C2=A0 =C2=A0 =C2=A043f4661e9b2c bonding: only set speed/duplex to unkn=
own, if getting speed failed<br>
&gt;=C2=A0 =C2=A0 =C2=A08b5ed7c5417b octeontx2-af: Fix PF driver crash with=
 kexec kernel booting<br>
&gt;=C2=A0 =C2=A0 =C2=A0cf5967514735 mptcp: fix receive space timestamp ini=
tialization<br>
&gt;=C2=A0 =C2=A0 =C2=A02622f355e621 of: unittest: fix possible null-pointe=
r dereferences in of_unittest_property_copy()<br>
&gt;=C2=A0 =C2=A0 =C2=A0e7c1e60802d8 ucount: check for CAP_SYS_RESOURCE usi=
ng ns_capable_noaudit()<br>
&gt;=C2=A0 =C2=A0 =C2=A07dc4778ee848 ipc: don&#39;t audit capability check =
in ipc_permissions()<br>
&gt;=C2=A0 =C2=A0 =C2=A02c80b0974047 PCI/ACPI: Restrict program_hpx_type2()=
 to AER bits<br>
&gt;=C2=A0 =C2=A0 =C2=A089db6475c0b4 PCI: Add defines for bridge window ind=
exing<br>
&gt;=C2=A0 =C2=A0 =C2=A082bd7f9d08ce PCI: Add PCIE_MSG_CODE_ASSERT_INTx mes=
sage macros<br>
&gt;=C2=A0 =C2=A0 =C2=A01f5438cb5d78 PCI: Log bridge info when first enumer=
ating bridge<br>
&gt;=C2=A0 =C2=A0 =C2=A0f49c44723a70 PCI: Log bridge windows conditionally<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0988b8b98103c PCI: Supply bridge device, not seconda=
ry bus, to read window details<br>
&gt;=C2=A0 =C2=A0 =C2=A07fd6672a1bb0 PCI: Move pci_read_bridge_windows() be=
low individual window accessors<br>
&gt;=C2=A0 =C2=A0 =C2=A0a79a3d1fd32c PCI: Initialize RCB from pci_configure=
_device()<br>
&gt;=C2=A0 =C2=A0 =C2=A0a7c08278f2d0 wifi: ath10k: sdio: add missing lock p=
rotection in ath10k_sdio_fw_crashed_dump()<br>
&gt;=C2=A0 =C2=A0 =C2=A062c2290dc976 tcp: tcp_tx_timestamp() must look at t=
he rtx queue<br>
&gt;=C2=A0 =C2=A0 =C2=A0d3b7ffa90f61 fat: avoid parent link count underflow=
 in rmdir<br>
&gt;=C2=A0 =C2=A0 =C2=A0243f71ed873f nfsd: never defer requests during idma=
p lookup<br>
&gt;=C2=A0 =C2=A0 =C2=A00114244ec49a dm: use bio_clone_blkg_association<br>
&gt;=C2=A0 =C2=A0 =C2=A0c93f23375d8c iommu/vt-d: Flush cache for PASID tabl=
e before using it<br>
&gt;=C2=A0 =C2=A0 =C2=A0bff7ac6b98fa PCI: Mark 3ware-9650SA Root Port Exten=
ded Tags as broken<br>
&gt;=C2=A0 =C2=A0 =C2=A0af0f0d30fd02 kallsyms/ftrace: set module buildid in=
 ftrace_mod_address_lookup()<br>
&gt;=C2=A0 =C2=A0 =C2=A0ecb0af907733 module: add helper function for readin=
g module_buildid()<br>
&gt;=C2=A0 =C2=A0 =C2=A0767f1a8c8483 netfilter: nf_conncount: fix tracking =
of connections from localhost<br>
&gt;=C2=A0 =C2=A0 =C2=A0abaa1508d5db netfilter: nft_compat: add more restri=
ctions on netlink attributes<br>
&gt;=C2=A0 =C2=A0 =C2=A00792ad077d77 netfilter: nf_conncount: increase the =
connection clean up limit to 64<br>
&gt;=C2=A0 =C2=A0 =C2=A0d12e9e90632c netfilter: nf_conncount: make nf_connc=
ount_gc_list() to disable BH<br>
&gt;=C2=A0 =C2=A0 =C2=A05802782366ba netfilter: nf_tables: reset table vali=
dation state on abort<br>
&gt;=C2=A0 =C2=A0 =C2=A04d7a05da767e wifi: cfg80211: stop NAN and P2P in cf=
g80211_leave<br>
&gt;=C2=A0 =C2=A0 =C2=A011f832532440 mctp i2c: initialise event handler rea=
d bytes<br>
&gt;=C2=A0 =C2=A0 =C2=A0f03666259d22 net: mctp-i2c: fix duplicate reception=
 of old data<br>
&gt;=C2=A0 =C2=A0 =C2=A037ccd48cf35f quota: fix livelock between quotactl a=
nd freeze_super<br>
&gt;=C2=A0 =C2=A0 =C2=A096ac80ce22bc PCI/portdrv: Fix potential resource le=
ak<br>
&gt;=C2=A0 =C2=A0 =C2=A0cf7e6dbb51a7 PCI: Do not attempt to set ExtTag for =
VFs<br>
&gt;=C2=A0 =C2=A0 =C2=A0a4176432d41e Documentation: tracing: Add PCI tracep=
oint documentation<br>
&gt;=C2=A0 =C2=A0 =C2=A060b896647d88 Documentation: trace: Refactor toctree=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0b2f972293451 docs: fix WARNING document not include=
d in any toctree<br>
&gt;=C2=A0 =C2=A0 =C2=A0bd43a6e85779 Documentation: tracing: Add ring-buffe=
r mapping<br>
&gt;=C2=A0 =C2=A0 =C2=A0baa42b756d18 PCI/P2PDMA: Release per-CPU pgmap ref =
when vm_insert_page() fails<br>
&gt;=C2=A0 =C2=A0 =C2=A0d8e7624e2113 PCI/PM: Avoid redundant delays on D3ho=
t-&gt;D3cold<br>
&gt;=C2=A0 =C2=A0 =C2=A063d3556c9a8e Documentation: PCI: endpoint: Fix ntb/=
vntb copy &amp; paste errors<br>
&gt;=C2=A0 =C2=A0 =C2=A024c190a5a24e PCI: mediatek: Fix IRQ domain leak whe=
n MSI allocation fails<br>
&gt;=C2=A0 =C2=A0 =C2=A0f448acd86835 Revert &quot;hwmon: (ibmpex) fix use-a=
fter-free in high/low store&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A01ae5fd122398 spi: tools: Add include folder to .git=
ignore<br>
&gt;=C2=A0 =C2=A0 =C2=A0169ae51f31b0 platform/chrome: cros_ec_lightbar: Fix=
 response size initialization<br>
&gt;=C2=A0 =C2=A0 =C2=A0e3311645c7c1 media: uvcvideo: Fix allocation for sm=
all frame sizes<br>
&gt;=C2=A0 =C2=A0 =C2=A001fe5a26ccc6 platform/chrome: cros_typec_switch: Do=
n&#39;t touch struct fwnode_handle::dev<br>
&gt;=C2=A0 =C2=A0 =C2=A00347548ccf07 drm/msm/a2xx: fix pixel shader start o=
n A225<br>
&gt;=C2=A0 =C2=A0 =C2=A0661152ffb0f2 media: ccs: Accommodate C-PHY into the=
 calculation<br>
&gt;=C2=A0 =C2=A0 =C2=A0e7815709bc97 drm/msm/dpu: fix CMD panels on DPU 1.x=
 - 3.x<br>
&gt;=C2=A0 =C2=A0 =C2=A033acf9a4d6eb HID: playstation: Add missing check fo=
r input_ff_create_memless<br>
&gt;=C2=A0 =C2=A0 =C2=A0f0a6e4b27bad regulator: core: move supply check ear=
lier in set_machine_constraints()<br>
&gt;=C2=A0 =C2=A0 =C2=A02d5b17e8364b drm/msm/disp/dpu: add merge3d support =
for sc7280<br>
&gt;=C2=A0 =C2=A0 =C2=A083d3d9ec347a drm/amdgpu: Use explicit VCN instance =
0 in SR-IOV init<br>
&gt;=C2=A0 =C2=A0 =C2=A0f721f873d3e1 ASoC: nau8821: Fixup nau8821_enable_ja=
ck_detect()<br>
&gt;=C2=A0 =C2=A0 =C2=A088a6bed89eb8 ASoC: nau8821: Avoid unnecessary block=
ing in IRQ handler<br>
&gt;=C2=A0 =C2=A0 =C2=A0e19f5b5d1059 ASoC: nau8821: Consistently clear inte=
rrupts before unmasking<br>
&gt;=C2=A0 =C2=A0 =C2=A01c7ee23dfcd1 smack: /smack/doi: accept previously u=
sed values<br>
&gt;=C2=A0 =C2=A0 =C2=A0661d87242dd6 smack: /smack/doi must be &gt; 0<br>
&gt;=C2=A0 =C2=A0 =C2=A034bacb3cc343 workqueue: Process rescuer work items =
one-by-one using a cursor<br>
&gt;=C2=A0 =C2=A0 =C2=A0c906c9d81fdf workqueue: Only assign rescuer work wh=
en really needed<br>
&gt;=C2=A0 =C2=A0 =C2=A0c17f947a6fca workqueue: Factor out assign_rescuer_w=
ork()<br>
&gt;=C2=A0 =C2=A0 =C2=A0e3b15841172e arm64: dts: qcom: sm6115: Add CX_MEM/D=
BGC GPU regions<br>
&gt;=C2=A0 =C2=A0 =C2=A04ffe98b89c9c arm64: dts: qcom: sdm845-db845c: speci=
fy power for WiFi CH1<br>
&gt;=C2=A0 =C2=A0 =C2=A0c77d1b2f5e51 arm64: dts: qcom: sdm845-db845c: drop =
CS from SPIO0<br>
&gt;=C2=A0 =C2=A0 =C2=A01895ad99349e arm64: dts: amlogic: g12: assign the M=
MC A signal clock<br>
&gt;=C2=A0 =C2=A0 =C2=A044cd81bbb21b arm64: dts: amlogic: g12: assign the M=
MC B and C signal clocks<br>
&gt;=C2=A0 =C2=A0 =C2=A06a47c69a8bba arm64: dts: amlogic: gx: assign the MM=
C signal clocks<br>
&gt;=C2=A0 =C2=A0 =C2=A059f3138d11cc arm64: dts: amlogic: axg: assign the M=
MC signal clocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0716c8ebe0409 arm: dts: lpc32xx: add clocks property=
 to Motor Control PWM device tree node<br>
&gt;=C2=A0 =C2=A0 =C2=A08461f646f68a ARM: dts: lpc32xx: Set motor PWM #pwm-=
cells property value to 3 cells<br>
&gt;=C2=A0 =C2=A0 =C2=A087a1f93986aa powerpc/eeh: fix recursive pci_lock_re=
scan_remove locking in EEH event handling<br>
&gt;=C2=A0 =C2=A0 =C2=A006195456c4e4 soc: mediatek: svs: Fix memory leak in=
 svs_enable_debug_write()<br>
&gt;=C2=A0 =C2=A0 =C2=A0993d41578772 soc: qcom: cmd-db: Use devm_memremap()=
 to fix memory leak in cmd_db_dev_probe<br>
&gt;=C2=A0 =C2=A0 =C2=A0c43e0a0353e5 powerpc/uaccess: Move barrier_nospec()=
 out of allow_read_{from/write}_user()<br>
&gt;=C2=A0 =C2=A0 =C2=A0ac2c85d2a2f6 ARM: dts: allwinner: sun5i-a13-utoo-p6=
6: delete &quot;power-gpios&quot; property<br>
&gt;=C2=A0 =C2=A0 =C2=A0dc62cf0814fa arm64: dts: qcom: sdm845-oneplus: Mark=
 l14a regulator as boot-on<br>
&gt;=C2=A0 =C2=A0 =C2=A01aeb4ed95c3f arm64: dts: qcom: sdm845-oneplus: Don&=
#39;t mark ts supply boot-on<br>
&gt;=C2=A0 =C2=A0 =C2=A093aaa53ecf20 arm64: dts: qcom: sdm630: fix gpu_spee=
d_bin size<br>
&gt;=C2=A0 =C2=A0 =C2=A0e15f1e18cdf4 clk: qcom: Return correct error code i=
n qcom_cc_probe_by_index()<br>
&gt;=C2=A0 =C2=A0 =C2=A0458f7417fae0 arm64: dts: tqma8mpql-mba8mpxl: Fix HD=
MI CEC pad control settings<br>
&gt;=C2=A0 =C2=A0 =C2=A0063898a3f9ac EDAC/i5400: Fix snprintf() limit calcu=
lation in calculate_dimm_size()<br>
&gt;=C2=A0 =C2=A0 =C2=A0e37f5e05b5bc EDAC/i5000: Fix snprintf() size calcul=
ation in calculate_dimm_size()<br>
&gt;=C2=A0 =C2=A0 =C2=A08afa17757873 soc: qcom: smem: handle ENOMEM error d=
uring probe<br>
&gt;=C2=A0 =C2=A0 =C2=A0cff0ef043e16 pstore/ram: fix buffer overflow in per=
sistent_ram_save_old()<br>
&gt;=C2=A0 =C2=A0 =C2=A08ad5577b2d4a sched/rt: Skip currently executing CPU=
 in rto_next_cpu()<br>
&gt;=C2=A0 =C2=A0 =C2=A0322154c3981e mfd: wm8350-core: Use IRQF_ONESHOT<br>
&gt;=C2=A0 =C2=A0 =C2=A03db9471b23f5 EDAC/altera: Remove IRQF_ONESHOT<br>
&gt;=C2=A0 =C2=A0 =C2=A0adb69cc223d7 scsi: efct: Use IRQF_ONESHOT and defau=
lt primary handler<br>
&gt;=C2=A0 =C2=A0 =C2=A0ddc34a1b8550 bpf: Fix bpf_xdp_store_bytes proto for=
 read-only arg<br>
&gt;=C2=A0 =C2=A0 =C2=A074081d6c1da1 crypto: hisilicon/trng - support tfms =
sharing the device<br>
&gt;=C2=A0 =C2=A0 =C2=A0260a9e382996 crypto: hisilicon/trng - modifying the=
 order of header files<br>
&gt;=C2=A0 =C2=A0 =C2=A09681044e45c9 bpf, sockmap: Fix FIONREAD for sockmap=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0acaf1ea47bbf bpf, sockmap: Fix incorrect copied_seq=
 calculation<br>
&gt;=C2=A0 =C2=A0 =C2=A07111701a09cc hrtimer: Fix trace oddity<br>
&gt;=C2=A0 =C2=A0 =C2=A033a30bf9e0d4 crypto: hisilicon/sec2 - support skcip=
her/aead fallback for hardware queue unavailable<br>
&gt;=C2=A0 =C2=A0 =C2=A06eae58af0c31 crypto: hisilicon/zip - adjust the way=
 to obtain the req in the callback function<br>
&gt;=C2=A0 =C2=A0 =C2=A0ab8b2eaf7add crypto: hisilicon/zip - remove zlib an=
d gzip<br>
&gt;=C2=A0 =C2=A0 =C2=A070b2f4fc1ede crypto: hisilicon/zip - support deflat=
e algorithm<br>
&gt;=C2=A0 =C2=A0 =C2=A00aa430f4661d crypto: octeontx - fix dma_free_cohere=
nt() size<br>
&gt;=C2=A0 =C2=A0 =C2=A053e97a309cc3 crypto: cavium - fix dma_free_coherent=
() size<br>
&gt;=C2=A0 =C2=A0 =C2=A02b757fea9f4f ARM: VDSO: Patch out __vdso_clock_getr=
es() if unavailable<br>
&gt;=C2=A0 =C2=A0 =C2=A0e1767524765e libbpf: Fix OOB read in btf_dump_get_b=
itfield_value<br>
&gt;=C2=A0 =C2=A0 =C2=A0542bf32cf757 selftests/bpf: veristat: fix printing =
order in output_stats()<br>
&gt;=C2=A0 =C2=A0 =C2=A06e6abc72accf crypto: qat - fix warning on adf_pfvf_=
pf_proto.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0abb6e07f46a7 s390/cio: Fix device lifecycle handlin=
g in css_alloc_subchannel()<br>
&gt;=C2=A0 =C2=A0 =C2=A027d7a35b8052 PM: sleep: wakeirq: harden dev_pm_clea=
r_wake_irq() against races<br>
&gt;=C2=A0 =C2=A0 =C2=A070e8af620210 perf: arm_spe: Properly set hw.state o=
n failures<br>
&gt;=C2=A0 =C2=A0 =C2=A03deb7b6a2e31 PM: wakeup: Handle empty list in wakeu=
p_sources_walk_start()<br>
&gt;=C2=A0 =C2=A0 =C2=A0d6749d0b8ddc Partial revert &quot;x86/xen: fix ball=
oon target initialization for PVH dom0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ef3b74d20f5e x86/xen: make some functions static<br=
>
&gt;=C2=A0 =C2=A0 =C2=A031cac6acf77e ublk: Validate SQE128 flag before acce=
ssing the cmd<br>
&gt;=C2=A0 =C2=A0 =C2=A08f3d79abdec0 iomap: fix submission side handling of=
 completion side errors<br>
&gt;=C2=A0 =C2=A0 =C2=A0597ec9e7f5cc md/raid10: fix any_working flag handli=
ng in raid10_sync_request<br>
&gt;=C2=A0 =C2=A0 =C2=A072b2db83705b cpuidle: governors: menu: Always check=
 timers with tick stopped<br>
&gt;=C2=A0 =C2=A0 =C2=A00add3e6f91aa cpuidle: menu: Cleanup after loadavg r=
emoval<br>
&gt;=C2=A0 =C2=A0 =C2=A0ca762fa01f64 io_uring/sync: validate passed in offs=
et<br>
&gt;=C2=A0 =C2=A0 =C2=A0f2cf475d23b8 ACPICA: Fix NULL pointer dereference i=
n acpi_ev_address_space_dispatch()<br>
&gt;=C2=A0 =C2=A0 =C2=A09cc9efa703f0 xen/virtio: Don&#39;t use grant-dma-op=
s when running as Dom0<br>
&gt;=C2=A0 =C2=A0 =C2=A07425453ea16d smb: client: fix potential UAF and dou=
ble free in smb2_open_file()<br>
&gt;=C2=A0 =C2=A0 =C2=A0e3d1fd084319 btrfs: fix block_group_tree dirty_list=
 corruption<br>
&gt;=C2=A0 =C2=A0 =C2=A046fb7ee9f852 btrfs: qgroup: return correct error wh=
en deleting qgroup relation item<br>
&gt;=C2=A0 =C2=A0 =C2=A0a51cff9be046 tpm: st33zp24: Fix missing cleanup on =
get_burstcount() error<br>
&gt;=C2=A0 =C2=A0 =C2=A0948966e546f2 tpm: tpm_i2c_infineon: Fix locality le=
ak on get_burstcount() failure<br>
&gt;=C2=A0 =C2=A0 =C2=A020ac431e02dc i3c: dw: Initialize spinlock to avoid =
upsetting lockdep<br>
&gt;=C2=A0 =C2=A0 =C2=A0d87268326b27 gfs2: Fix use-after-free in iomap inli=
ne data write path<br>
&gt;=C2=A0 =C2=A0 =C2=A04991b13cc9f1 gfs2: Add metapath_dibh helper<br>
&gt;=C2=A0 =C2=A0 =C2=A07e3b7a47867a gfs2: Retries missing in gfs2_{rename,=
exchange}<br>
&gt;=C2=A0 =C2=A0 =C2=A0b68be2b8b564 i3c: master: Update hot-join flag only=
 on success<br>
&gt;=C2=A0 =C2=A0 =C2=A05560116126da fs: add &lt;linux/init_task.h&gt; for =
&#39;init_fs&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A04b2a0a4e9428 i3c: Move device name assignment after=
 i3c_bus_init<br>
&gt;=C2=A0 =C2=A0 =C2=A0e2647d540bea audit: move the compat_xxx_class[] ext=
ern declarations to audit_arch.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0979c708e6c9d rcu: Fix rcu_read_unlock() deadloop du=
e to softirq<br>
&gt;=C2=A0 =C2=A0 =C2=A0dffd52d0d14e rcu: Remove local_irq_save/restore() i=
n rcu_preempt_deferred_qs_handler()<br>
&gt;=C2=A0 =C2=A0 =C2=A03ccd035ef99d rcu: Refactor expedited handling check=
 in rcu_read_unlock_special()<br>
&gt;=C2=A0 =C2=A0 =C2=A06cc7a424a39a rcu/exp: Move expedited kthread worker=
 creation functions above rcutree_prepare_cpu()<br>
&gt;=C2=A0 =C2=A0 =C2=A0cb9eaff659dd rcu: s/boost_kthread_mutex/kthread_mut=
ex<br>
&gt;=C2=A0 =C2=A0 =C2=A07b57ada854b3 hfsplus: return error when node alread=
y exists in hfs_bnode_create<br>
&gt;=C2=A0 =C2=A0 =C2=A02e000d8a5306 auxdisplay: arm-charlcd: fix release_m=
em_region() size<br>
&gt;=C2=A0 =C2=A0 =C2=A0a6a3e4af1099 RDMA/umad: Reject negative data_len in=
 ib_umad_write<br>
&gt;=C2=A0 =C2=A0 =C2=A0ffba40b67663 RDMA/siw: Fix potential NULL pointer d=
ereference in header processing<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_6.6.bb" rel=3D"norefe=
rrer" target=3D"_blank">linux-yocto-rt_6.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++--<br>
&gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-tiny_6.6.bb" rel=3D"nore=
ferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++--<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.6.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.6.bb</a>=C2=A0 | 28 ++++=
+++++----------<br>
&gt;=C2=A0 3 files changed, 20 insertions(+), 20 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-r=
t_6.6.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.6.bb</a> b/=
meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.6.bb" rel=3D"n=
oreferrer" target=3D"_blank">linux-yocto-rt_6.6.bb</a><br>
&gt; index 8685e5cbf6..8250679ed0 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.6.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.6.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.6.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.6.bb</a><br>
&gt; @@ -14,13 +14,13 @@ python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;Set =
PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it&quot;)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -SRCREV_machine ?=3D &quot;c45743dc8dc2ddfbe7bd165997e1f7cf887fa6b7&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;45f69741c733e066ed1a12b6025e347e5cd6063e&quot;=
<br>
&gt; +SRCREV_machine ?=3D &quot;8751b899ea5af349e8570e8985365290efa5e7d6&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;fdd48963e673d657f0df21b4b1fb6b18dbaa96bc&quot;=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/l=
inux-yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine;protocol=3Dhttps" rel=
=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;bran=
ch=3D${KBRANCH};name=3Dmachine;protocol=3Dhttps</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http:/=
/git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3D=
yocto-6.6;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" ta=
rget=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;=
<br>
&gt;=C2=A0 <br>
&gt; -LINUX_VERSION ?=3D &quot;6.6.127&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;6.6.129&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc=
9398086aedcd7e46&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-t=
iny_6.6.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb</a=
> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.6.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb</a><br>
&gt; index d6a9afdf17..bd4a10b564 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.6=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.6=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb</a><br>
&gt; @@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc<br>
&gt;=C2=A0 # CVE exclusions<br>
&gt;=C2=A0 include recipes-kernel/linux/cve-exclusion_6.6.inc<br>
&gt;=C2=A0 <br>
&gt; -LINUX_VERSION ?=3D &quot;6.6.127&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;6.6.129&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc=
9398086aedcd7e46&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86=
&#39;, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt; @@ -17,8 +17,8 @@ DEPENDS +=3D &quot;openssl-native util-linux-native&=
quot;<br>
&gt;=C2=A0 KMETA =3D &quot;kernel-meta&quot;<br>
&gt;=C2=A0 KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt;=C2=A0 <br>
&gt; -SRCREV_machine ?=3D &quot;8247922ff493e4fef938ce36562cac9c0cce86aa&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;45f69741c733e066ed1a12b6025e347e5cd6063e&quot;=
<br>
&gt; +SRCREV_machine ?=3D &quot;d82c6cc64c037058c6bfd630f2d2604a38684c7d&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;fdd48963e673d657f0df21b4b1fb6b18dbaa96bc&quot;=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6=
.6.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.6.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_6.6.bb" rel=3D"noreferrer=
" target=3D"_blank">linux-yocto_6.6.bb</a><br>
&gt; index 92ad6afa3a..58a72979c5 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.6.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.6.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.6.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.6.bb</a><br>
&gt; @@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?=3D &quot;v6.6/standard/base&q=
uot;<br>
&gt;=C2=A0 KBRANCH:qemuloongarch64=C2=A0 ?=3D &quot;v6.6/standard/base&quot=
;<br>
&gt;=C2=A0 KBRANCH:qemumips64 ?=3D &quot;v6.6/standard/mti-malta64&quot;<br=
>
&gt;=C2=A0 <br>
&gt; -SRCREV_machine:qemuarm ?=3D &quot;aa66687c1abe2afe2ee6c00c36bfaaf3d5d=
9636c&quot;<br>
&gt; -SRCREV_machine:qemuarm64 ?=3D &quot;cf88783fdb92901d9d228afb7d700c657=
5742f1b&quot;<br>
&gt; -SRCREV_machine:qemuloongarch64 ?=3D &quot;70af2998be31b72a111de67966b=
7816b3d54d472&quot;<br>
&gt; -SRCREV_machine:qemumips ?=3D &quot;cbd6f9a670486dcd83ef0f8b90a75b2b7b=
44b447&quot;<br>
&gt; -SRCREV_machine:qemuppc ?=3D &quot;bce75aa765505d7db3bb1bfefb5d3f524a1=
a5b64&quot;<br>
&gt; -SRCREV_machine:qemuriscv64 ?=3D &quot;70af2998be31b72a111de67966b7816=
b3d54d472&quot;<br>
&gt; -SRCREV_machine:qemuriscv32 ?=3D &quot;70af2998be31b72a111de67966b7816=
b3d54d472&quot;<br>
&gt; -SRCREV_machine:qemux86 ?=3D &quot;70af2998be31b72a111de67966b7816b3d5=
4d472&quot;<br>
&gt; -SRCREV_machine:qemux86-64 ?=3D &quot;70af2998be31b72a111de67966b7816b=
3d54d472&quot;<br>
&gt; -SRCREV_machine:qemumips64 ?=3D &quot;4cc6d51a6f63436a37c3ba4ea2da93c7=
fd3240b4&quot;<br>
&gt; -SRCREV_machine ?=3D &quot;70af2998be31b72a111de67966b7816b3d54d472&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;45f69741c733e066ed1a12b6025e347e5cd6063e&quot;=
<br>
&gt; +SRCREV_machine:qemuarm ?=3D &quot;539bf858552c12417a449646d0cad5e53e0=
38aa0&quot;<br>
&gt; +SRCREV_machine:qemuarm64 ?=3D &quot;e4153b3c5bff6c503990c35826d84a034=
d2d7a33&quot;<br>
&gt; +SRCREV_machine:qemuloongarch64 ?=3D &quot;3dbf485808fc7be82368f70f385=
fead9735b5904&quot;<br>
&gt; +SRCREV_machine:qemumips ?=3D &quot;d5da07b097555f20280b2484da875c93f1=
494d48&quot;<br>
&gt; +SRCREV_machine:qemuppc ?=3D &quot;9434ddc68ebc90e9336d4cc6f642aa82c0d=
a023c&quot;<br>
&gt; +SRCREV_machine:qemuriscv64 ?=3D &quot;3dbf485808fc7be82368f70f385fead=
9735b5904&quot;<br>
&gt; +SRCREV_machine:qemuriscv32 ?=3D &quot;3dbf485808fc7be82368f70f385fead=
9735b5904&quot;<br>
&gt; +SRCREV_machine:qemux86 ?=3D &quot;3dbf485808fc7be82368f70f385fead9735=
b5904&quot;<br>
&gt; +SRCREV_machine:qemux86-64 ?=3D &quot;3dbf485808fc7be82368f70f385fead9=
735b5904&quot;<br>
&gt; +SRCREV_machine:qemumips64 ?=3D &quot;e6f498c7aa6909c17b90b50267d1577d=
dc19c0d6&quot;<br>
&gt; +SRCREV_machine ?=3D &quot;3dbf485808fc7be82368f70f385fead9735b5904&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;fdd48963e673d657f0df21b4b1fb6b18dbaa96bc&quot;=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # set your preferred provider of linux-yocto to &#39;linux-yocto=
-upstream&#39;, and you&#39;ll<br>
&gt;=C2=A0 # get the &lt;version&gt;/base branch, which is pure upstream -s=
table, and the same<br>
&gt;=C2=A0 # meta SRCREV as the linux-yocto-standard builds. Select your ve=
rsion using the<br>
&gt;=C2=A0 # normal PREFERRED_VERSION settings.<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;devupstream:target&quot;<br>
&gt; -SRCREV_machine:class-devupstream ?=3D &quot;7a137e9bfa0e1919555d60f9d=
c0c05a7a5ba75d0&quot;<br>
&gt; +SRCREV_machine:class-devupstream ?=3D &quot;4fc00fe35d46b4fc8dac2eb54=
3a0e3d44bb15f47&quot;<br>
&gt;=C2=A0 PN:class-devupstream =3D &quot;linux-yocto-upstream&quot;<br>
&gt;=C2=A0 KBRANCH:class-devupstream =3D &quot;v6.6/base&quot;<br>
&gt;=C2=A0 <br>
&gt; @@ -44,7 +44,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.yoctop=
roject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7BKBRA" rel=3D"norefer=
rer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dmachine;=
branch=3D${KBRA</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http:/=
/git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3D=
yocto-6.6;destsuffix=3D$%7BKMETA%7D;protocol=3Dhttps" rel=3D"noreferrer" ta=
rget=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=
=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps</a>&quot;=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc=
9398086aedcd7e46&quot;<br>
&gt; -LINUX_VERSION ?=3D &quot;6.6.127&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;6.6.129&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
&gt;=C2=A0 <br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000ded5430653e9f662--

