Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452D3C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:05:32 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.15610.1709741121931387891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fwidqi+y;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-21e9589d4ffso3886854fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 08:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709741121; x=1710345921; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tp+0Fom9Dwi9tm/F+5YdJwoLUtebHYwgZtKByWinqX4=;
        b=Fwidqi+y39BiNutlXBTJd2i5oLSBcWIYXUBbRC2NDKrnoulhI68IfzdIaXuRbpRGrO
         kDjXRZBUwS8FF3EVHfcG0CMOdyg2LWrQvOD8SEW+PWywtsv/cxAjNNC+vHLxRBu65N4Q
         Th7unk4joI1NMub083iOtjOQ3xg5eQ6RFUKTEWvEN1EOItK+KnEd5TSo60ARdb1EHvps
         IAmwbT5PXo1Jct204iS72THCt1TDxK8UE0Ap911WgEQOiqn42wIibUEZZhdx6TjGx0Ug
         YNG/sZejNtv19GtV5X0AKpd5lvsDtl1aiScYoZM6ccR4suYcUriBgt5Ame+jfx7QzZ8J
         bgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709741121; x=1710345921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tp+0Fom9Dwi9tm/F+5YdJwoLUtebHYwgZtKByWinqX4=;
        b=wdjErtW/FudlNiav6VkcCzVUKF5Hy1jnHLGmpXa6mCX3jFA3mfxekMpZWFolF4L2U1
         aOOQRQ4/mo/yYquHHI28ocUKctA7fyVaVubfcyYV7vSf2nw98SRiLcNB8xEMBKWyVKJx
         c9NK8lN+f7IBxG775nHPMvs/3L4BiQr9bBxmD4OsiCfs7DV4/or2lV/iI+Mp+yv5OsqB
         GAnEkQZ3rsaRghXZaZSYfd5lnzETT5eDT0ptfrVi12Va+rEXXJ5Lk4E4FTj5fJFQaDth
         acajx/WfB6UZaVecQzUBE61bt7tw1eWeGNsqGDVnYZuaTKwKqvVfK/blqyPMn+/K/wpd
         nNKg==
X-Forwarded-Encrypted: i=1; AJvYcCUYK8txEMXXqJpf5h8rkIrhLrCDdw9bi4pAolM+QHSZi2e8cW1RT+2OjgKYCk6sm5N8A7JaogSomrx5algGYA2N9u2I8WNdFobrZeQsR9lpNd0WS8vm3dfM
X-Gm-Message-State: AOJu0YwgzerFbnqURosh6ER9WKv44J/OnQffBNIF05kfx2Gf2iBUgzAE
	dlGw6lVICpC5zdb4BbY05EDxjxdilA5PXO/8w7j1CaKdfeu9Sc5puJy1//lrSjau9CYqcdZmYKC
	RDGnx3KWKVwP8JkL9OrPhKViF1rKRwzoW
X-Google-Smtp-Source: AGHT+IHyGcw0RAelgh58IwZbgWTMRFggQ/zk2sMAkP3Jws5zn6TI3TSyrFXIpJONNRLQ+r2P9QtZK3PvROc4k8btH10=
X-Received: by 2002:a05:6871:14c:b0:221:4b44:82df with SMTP id
 z12-20020a056871014c00b002214b4482dfmr3536451oab.0.1709741120486; Wed, 06 Mar
 2024 08:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20231205044036.4163615-1-bruce.ashfield@gmail.com>
 <20231205044036.4163615-5-bruce.ashfield@gmail.com> <CAOSpxdZU+CoRTo=Xz+C3dk44ubHLSa7pis7sa4CyVMGJnY1_EA@mail.gmail.com>
 <CAOSpxdYcFTMY-m9TDB-wAVXu70v5DkmGfH8UjH2dLKDY-x0AbA@mail.gmail.com> <CADkTA4NhG1AciK=QkaYiajfXfuqc1YQ9=qJBssoKSQh4GOMcvQ@mail.gmail.com>
In-Reply-To: <CADkTA4NhG1AciK=QkaYiajfXfuqc1YQ9=qJBssoKSQh4GOMcvQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2024 08:05:09 -0800
Message-ID: <CAMKF1spN7Eog=3rgK++pytRbuBF1auCQqeSFuHNXp28LsfxAgw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 4/4] linux-yocto/5.15: update to v5.15.141
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002501be0613002096"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 16:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196735

--0000000000002501be0613002096
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 7:59=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmail=
.com>
wrote:

> On Wed, Mar 6, 2024 at 10:43=E2=80=AFAM Steve Sakoman <steve@sakoman.com>=
 wrote:
> >
> > On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM Steve Sakoman <steve@sakoman.com=
> wrote:
> > >
> > > Hi Bruce,
> > >
> > > The 5.10 version bumps look fine in testing, but sadly this 5.15
> > > version bump breaks qemux86-64-ptest:
> > >
> > > AssertionError: Failed ptests:
> > > {'parted': ['t1104-remove-and-add-partition.sh',
> > >             't8000-loop.sh',
> > >             't8001-loop-blkpg.sh']}
> > >
> > > Failure is reproducible 100% of the time, so there is that ...
> >
> > After  wading through the hundreds of changes in this version bump
> > from 5.15.124 to 5.15.141 I found this in the 5.13.132 portion that
> > looks suspicious:
> >
> > 072cd213c64f block: don't add or resize partition on the disk with
> > GENHD_FL_NO_PART
> > c6ce1c5dd327 block: rename GENHD_FL_NO_PART_SCAN to GENHD_FL_NO_PART
> >
>
> It could very well be that, I haven't been able to get to any local
> testing on this
> yet.
>
> I will go look at parted for commits that indicate they are fixing a
> kernel interface
> that sounds similar .. since we don't want to revert an offending commit,
> the
> way to fix this is via selective update of parted.
>

I hope the parted change would be backward compatible otherwise we will be
breaking all the kernels which do not have this commit except Linux-yocto


> Bruce
>
> > Thoughts?
> >
> > Steve
> >
> > > On Mon, Dec 4, 2023 at 6:40=E2=80=AFPM <bruce.ashfield@gmail.com> wro=
te:
> > > >
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > Updating  to the latest korg -stable release that comprises
> > > > the following commits:
> > > >
> > > >     9b91d36ba301 Linux 5.15.141
> > > >     313a34d1c0ee io_uring: fix off-by one bvec index
> > > >     49ae2e4e8ed3 USB: dwc3: qcom: fix wakeup after probe deferral
> > > >     eb17fb4b160a USB: dwc3: qcom: fix software node leak on probe
> errors
> > > >     98f0e9b6276f usb: dwc3: set the dma max_seg_size
> > > >     1a3dcb1d811d usb: dwc3: Fix default mode initialization
> > > >     a22702a81844 USB: dwc2: write HCINT with INTMASK applied
> > > >     1134fde92088 usb: typec: tcpm: Skip hard reset when in error
> recovery
> > > >     64830d041515 USB: serial: option: don't claim interface 4 for
> ZTE MF290
> > > >     9611cbc6a132 USB: serial: option: fix FM101R-GL defines
> > > >     a8d80b1fbacf USB: serial: option: add Fibocom L7xx modules
> > > >     de8c6fce8d09 usb: cdnsp: Fix deadlock issue during using NCM
> gadget
> > > >     dd0cc4b69f7d bcache: fixup lock c->root error
> > > >     a912742d8411 bcache: fixup init dirty data errors
> > > >     137660f84462 bcache: prevent potential division by zero error
> > > >     f7077ce8d97b bcache: check return value from
> btree_node_alloc_replacement()
> > > >     1eed01092101 dm-delay: fix a race between delay_presuspend and
> delay_bio
> > > >     d181a7a1d55d hv_netvsc: Mark VF as slave before exposing it to
> user-mode
> > > >     97683466e24c hv_netvsc: Fix race of register_netdevice_notifier
> and VF register
> > > >     3841921018a2 USB: serial: option: add Luat Air72*U series
> products
> > > >     6062c527d040 s390/dasd: protect device queue against concurrent
> access
> > > >     35b5d86e43ec io_uring/fs: consider link->flags when getting pat=
h
> for LINKAT
> > > >     2bb75a2c3490 bcache: fixup multi-threaded
> bch_sectors_dirty_init() wake-up race
> > > >     6f09318fd90a md: fix bi_status reporting in md_end_clone_io
> > > >     72ecb9753cbe bcache: replace a mistaken IS_ERR() by
> IS_ERR_OR_NULL() in btree_gc_coalesce()
> > > >     e09ba90f1ad0 swiotlb-xen: provide the "max_mapping_size" method
> > > >     0f05021e937c ACPI: resource: Skip IRQ override on ASUS
> ExpertBook B1402CVA
> > > >     f95e9f7afe86 proc: sysctl: prevent aliased sysctls from getting
> passed to init
> > > >     3f3880fc011c ext4: make sure allocate pending entry not fail
> > > >     e33eb4997585 ext4: fix slab-use-after-free in
> ext4_es_insert_extent()
> > > >     859893f61906 ext4: using nofail preallocation in
> ext4_es_insert_extent()
> > > >     048e7f38b31c ext4: using nofail preallocation in
> ext4_es_insert_delayed_block()
> > > >     580b9dd6ab0b ext4: using nofail preallocation in
> ext4_es_remove_extent()
> > > >     66bc78a295b3 ext4: use pre-allocated es in __es_remove_extent()
> > > >     b1995ba6269c ext4: use pre-allocated es in __es_insert_extent()
> > > >     edec12712ae1 ext4: factor out __es_alloc_extent() and
> __es_free_extent()
> > > >     e82d05cf5ccb ext4: add a new helper to check if es must be kept
> > > >     612edd488872 media: qcom: camss: Fix csid-gen2 for test pattern
> generator
> > > >     ceb5276d8c99 media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE
> when VC is greater than 3
> > > >     f001e6f62693 media: camss: sm8250: Virtual channels for CSID
> > > >     9fb81ca7aa05 media: camss: Replace hard coded value with
> parameter
> > > >     8ef9b32f20ab MIPS: KVM: Fix a build warning about variable set
> but not used
> > > >     6ddaca6b20f7 lockdep: Fix block chain corruption
> > > >     61747778a88b USB: dwc3: qcom: fix ACPI platform device leak
> > > >     027472889970 USB: dwc3: qcom: fix resource leaks on probe
> deferral
> > > >     e26c6febac43 nvmet: nul-terminate the NQNs passed in the connec=
t
> command
> > > >     b5d50c6a609d afs: Fix file locking on R/O volumes to operate in
> local mode
> > > >     84ebfbed3ae0 afs: Return ENOENT if no cell DNS record can be
> found
> > > >     6aeac88a45de net: axienet: Fix check for partial TX checksum
> > > >     293acba84108 amd-xgbe: propagate the correct speed and duplex
> status
> > > >     b3874cc25a70 amd-xgbe: handle the corner-case during tx
> completion
> > > >     e949dbc28cd5 amd-xgbe: handle corner-case during sfp hotplug
> > > >     01a8b94726b1 octeontx2-pf: Fix ntuple rule creation to direct
> packet to VF with higher Rx queue than its PF
> > > >     fcc4a03ad3b1 arm/xen: fix xen_vcpu_info allocation alignment
> > > >     90072af9efe8 net/smc: avoid data corruption caused by decline
> > > >     66c023469b3e net: usb: ax88179_178a: fix failed operations
> during ax88179_reset
> > > >     ba81c5228ef8 ipv4: Correct/silence an endian warning in
> __ip_do_redirect
> > > >     364406d4c114 HID: fix HID device resource race between HID core
> and debugging support
> > > >     52badc06b119 HID: core: store the unique system identifier in
> hid_device
> > > >     221be624a55d drm/rockchip: vop: Fix color for RGB888/BGR888
> format on VOP full
> > > >     b0c835fd7d89 ata: pata_isapnp: Add missing error check for
> devm_ioport_map()
> > > >     9754a498aa5b octeontx2-pf: Fix memory leak during interface dow=
n
> > > >     be41c0c4a632 wireguard: use DEV_STATS_INC()
> > > >     f163a6d17a95 drm/panel: simple: Fix Innolux G101ICE-L01 timings
> > > >     608de3a587eb drm/panel: simple: Fix Innolux G101ICE-L01 bus fla=
gs
> > > >     18bd108a13cb drm/panel: auo,b101uan08.3: Fine tune the panel
> power sequence
> > > >     9fe5718d3f09 drm/panel: boe-tv101wum-nl6: Fine tune the panel
> power sequence
> > > >     c8a49336e1de afs: Make error on cell lookup failure consistent
> with OpenAFS
> > > >     ac239fccf5a5 afs: Fix afs_server_list to be cleaned up with RCU
> > > >     a78d278e01b1 Linux 5.15.140
> > > >     947c9e12ddd6 driver core: Release all resources during unbind
> before updating device links
> > > >     5a434d5c3823 Input: xpad - add VID for Turtle Beach controllers
> > > >     cbc7c29dff0f tracing: Have trace_event_file have ref counters
> > > >     1dcf90c9fa01 powerpc/powernv: Fix fortify source warnings in
> opal-prd.c
> > > >     3d7912710e5e io_uring/fdinfo: lock SQ thread while retrieving
> thread cpu/pid
> > > >     595b051c83a1 drm/amd/display: Change the DMCUB mailbox memory
> location from FB to inbox
> > > >     a2a6e97c4b33 drm/amdgpu: fix error handling in
> amdgpu_bo_list_get()
> > > >     e380992c479b drm/amdgpu: don't use ATRM for external devices
> > > >     4ff985b8810c drm/i915: Fix potential spectre vulnerability
> > > >     ea0c4d5ec57f drm/amd/pm: Handle non-terminated overdrive
> commands.
> > > >     9ce842d7762a ext4: add missed brelse in update_backups
> > > >     ce19c20064b6 ext4: remove gdb backup copy for meta bg in
> setup_new_flex_group_blocks
> > > >     ac45d8e34bed ext4: correct the start block of counting reserved
> clusters
> > > >     8f9842c4b925 ext4: correct return value of ext4_convert_meta_bg
> > > >     8798d3b2722d ext4: correct offset of gdb backup in non meta_bg
> group to update_backups
> > > >     8a3bb38bfdaf ext4: apply umask if ACL support is disabled
> > > >     d5c380149b96 Revert "net: r8169: Disable multicast filter for
> RTL8168H and RTL8107E"
> > > >     6ad3d8594d5e media: qcom: camss: Fix missing vfe_lite clocks
> check
> > > >     e0376cf06950 media: qcom: camss: Fix VFE-17x vfe_disable_output=
()
> > > >     8f733387d17f media: qcom: camss: Fix vfe_get() error jump
> > > >     841fc648fbb5 media: qcom: camss: Fix pm_domain_on sequence in
> probe
> > > >     4c9c43f79a12 mmc: sdhci-pci-gli: GL9750: Mask the replay timer
> timeout of AER
> > > >     72bf271c5a77 r8169: fix network lost after resume on DASH syste=
ms
> > > >     468e3ebf4786 mm: kmem: drop __GFP_NOFAIL when allocating objcg
> vectors
> > > >     0387978fda07 mmc: sdhci-pci-gli: A workaround to allow GL9750 t=
o
> enter ASPM L1.2
> > > >     070b3ccb9b8b riscv: kprobes: allow writing to x0
> > > >     cd0e9f475a46 nfsd: fix file memleak on client_opens_release
> > > >     114c9d732cf9 media: ccs: Correctly initialise try compose
> rectangle
> > > >     6c8aeeb2c549 media: venus: hfi: add checks to handle
> capabilities from firmware
> > > >     cdeb0a4cf327 media: venus: hfi: fix the check to handle session
> buffer requirement
> > > >     7d62570f75fe media: venus: hfi_parser: Add check to keep the
> number of codecs within range
> > > >     d0d831e7d68d media: sharp: fix sharp encoding
> > > >     6003733c8f95 media: lirc: drop trailing space from scancode
> transmit
> > > >     e4088d7d8f11 f2fs: avoid format-overflow warning
> > > >     12055238d046 i2c: i801: fix potential race in
> i801_block_transaction_byte_by_byte
> > > >     336e6db5c120 net: phylink: initialize carrier state at creation
> > > >     d8cb287d31cb net: dsa: lan9303: consequently nested-lock
> physical MDIO
> > > >     656262cb0f95 net: ethtool: Fix documentation of ethtool_sprintf=
()
> > > >     acca20cc16f3 s390/ap: fix AP bus crash on early config change
> callback invocation
> > > >     019b7d42a416 i2c: designware: Disable TX_EMPTY irq while waitin=
g
> for block length byte
> > > >     c6e89348fd58 sbsa_gwdt: Calculate timeout with 64-bit math
> > > >     132670ae9ffb lsm: fix default return value for inode_getsecctx
> > > >     223196b50605 lsm: fix default return value for vm_enough_memory
> > > >     06d320ca170b Revert "i2c: pxa: move to generic GPIO recovery"
> > > >     ddec3d04f874 Revert ncsi: Propagate carrier gain/loss events to
> the NCSI controller
> > > >     ad0b74d0f331 powerpc/pseries/ddw: simplify enable_ddw()
> > > >     b3e993de400e arm64: dts: qcom: ipq6018: Fix tcsr_mutex register
> size
> > > >     b99ac20612ca arm64: dts: qcom: ipq6018: switch TCSR mutex to MM=
IO
> > > >     aaf0a07d6088 ksmbd: fix slab out of bounds write in
> smb_inherit_dacl()
> > > >     1c701423bb03 Bluetooth: btusb: Add 0bda:b85b for Fn-Link
> RTL8852BE
> > > >     36a573b32550 Bluetooth: btusb: Add RTW8852BE device 13d3:3570 t=
o
> device tables
> > > >     c4976160a0a4 bluetooth: Add device 13d3:3571 to device tables
> > > >     603e77e9e8c0 bluetooth: Add device 0bda:887b to device tables
> > > >     e9bb966c50a7 Bluetooth: btusb: Add Realtek RTL8852BE support ID
> 0x0cb8:0xc559
> > > >     cf642ee641ce cpufreq: stats: Fix buffer overflow detection in
> trans_stats()
> > > >     63e09cdfe948 regmap: Ensure range selector registers are update=
d
> after cache sync
> > > >     0c49e74e95bf tty: serial: meson: fix hard LOCKUP on crtscts mod=
e
> > > >     6f26b6a61b08 serial: meson: Use platform_get_irq() to get the
> interrupt
> > > >     450fa8bf803f ALSA: hda/realtek - Enable internal speaker of ASU=
S
> K6500ZC
> > > >     cc549ba50bb8 ALSA: hda/realtek - Add Dell ALC295 to pin fall
> back table
> > > >     767c988771cb ALSA: info: Fix potential deadlock at disconnectio=
n
> > > >     09022ae66261 xhci: Enable RPM on controllers that support
> low-power states
> > > >     68574fe2e488 parisc/pgtable: Do not drop upper 5 address bits o=
f
> physical address
> > > >     ea7593c18ff7 parisc: Prevent booting 64-bit kernels on PA1.x
> machines
> > > >     2c9092e8b29a i3c: master: svc: fix SDA keep low when polling
> IBIWON timeout happen
> > > >     da754f92fc02 i3c: master: svc: fix check wrong status register
> in irq handler
> > > >     5ba77b6b45d6 i3c: master: svc: fix ibi may not return mandatory
> data byte
> > > >     e0a70ed4a580 i3c: master: svc: fix wrong data return when IBI
> happen during start frame
> > > >     7383675aba2f i3c: master: svc: fix race condition in ibi work
> thread
> > > >     cc7efd1054f4 i3c: master: cdns: Fix reading status register
> > > >     d3c6a08c2b77 mtd: cfi_cmdset_0001: Byte swap OTP info
> > > >     a4668088128d mm/memory_hotplug: use pfn math in place of direct
> struct page manipulation
> > > >     792a796085cf mm/cma: use nth_page() in place of direct struct
> page manipulation
> > > >     9b59fc31226e s390/cmma: fix detection of DAT pages
> > > >     45bb94aab891 dmaengine: stm32-mdma: correct desc prep when
> channel running
> > > >     91659b77e937 mcb: fix error handling for different scenarios
> when parsing
> > > >     534790fde890 tracing: Have the user copy of synthetic event
> address use correct context
> > > >     f6237afabc34 i2c: core: Run atomic i2c xfer when !preemptible
> > > >     931aa7154bc4 kernel/reboot: emergency_restart: Set correct
> system_state
> > > >     7a3424c3b76a quota: explicitly forbid quota files from being
> encrypted
> > > >     47f509832168 jbd2: fix potential data lost in recovering journa=
l
> raced with synchronizing fs bdev
> > > >     f13e1ea45699 ASoC: codecs: wsa-macro: fix uninitialized stack
> variables with name prefix
> > > >     28436d8092ad selftests/resctrl: Reduce failures due to outliers
> in MBA/MBM tests
> > > >     6ce63598a1fb selftests/resctrl: Remove duplicate feature check
> from CMT test
> > > >     e90efe17fc07 netfilter: nf_tables: split async and sync catchal=
l
> in two functions
> > > >     0d9506c766c9 netfilter: nf_tables: remove catchall element in G=
C
> sync path
> > > >     96fc7a50a278 PCI: keystone: Don't discard .probe() callback
> > > >     e0d394df9812 PCI: keystone: Don't discard .remove() callback
> > > >     f4f12667167c KEYS: trusted: Rollback init_trusted() consistentl=
y
> > > >     c407ff72fb3a genirq/generic_chip: Make irq_remove_generic_chip(=
)
> irqdomain aware
> > > >     bc8a14e3c630 mmc: meson-gx: Remove setting of CMD_CFG_ERROR
> > > >     3a51e6b4da71 wifi: ath11k: fix htt pktlog locking
> > > >     426e718ce9ba wifi: ath11k: fix dfs radar event locking
> > > >     e9d84413b1b7 wifi: ath11k: fix temperature event locking
> > > >     5ff849948c11 ima: detect changes to the backing overlay file
> > > >     4584a421a6d9 ima: annotate iint mutex to avoid lockdep false
> positive warnings
> > > >     4049576c639f ACPI: FPDT: properly handle invalid FPDT subtables
> > > >     628e76e684c8 firmware: qcom_scm: use 64-bit calling convention
> only when client is 64-bit
> > > >     6eb8c191e360 btrfs: don't arbitrarily slow down delalloc if
> we're committing
> > > >     0b99626b28ca rcu: kmemleak: Ignore kmemleak false positives whe=
n
> RCU-freeing objects
> > > >     71f5344f477c PM: hibernate: Clean up sync_read handling in
> snapshot_write_next()
> > > >     57dbc0eb8abe PM: hibernate: Use __get_safe_page() rather than
> touching the list
> > > >     87a30633b5d3 arm64: dts: qcom: ipq6018: Fix hwlock index for SM=
EM
> > > >     ebaee06a7292 rcu/tree: Defer setting of jiffies during stall
> reset
> > > >     057d1034d012 svcrdma: Drop connection after an RDMA Read error
> > > >     541b3757fd44 wifi: wilc1000: use vmm_table as array in wilc
> struct
> > > >     b156f62f19da PCI: exynos: Don't discard .remove() callback
> > > >     f88796721002 PCI/ASPM: Fix L1 substate handling in
> aspm_attr_store_common()
> > > >     467864d55b52 mmc: sdhci_am654: fix start loop index for TAP
> value parsing
> > > >     ef34a97bb9cb mmc: vub300: fix an error code
> > > >     36adb6204cff clk: qcom: ipq6018: drop the CLK_SET_RATE_PARENT
> flag from PLL clocks
> > > >     090b167b2c41 clk: qcom: ipq8074: drop the CLK_SET_RATE_PARENT
> flag from PLL clocks
> > > >     18640a1818f1 clk: socfpga: Fix undefined behavior bug in struct
> stratix10_clock_data
> > > >     4d17b54c9be3 parisc/pdc: Add width field to struct pdc_model
> > > >     936c9c10efae arm64: Restrict CPU_BIG_ENDIAN to GNU as or LLVM
> IAS 15.x or newer
> > > >     8b24bb54bf3a ACPI: resource: Do IRQ override on TongFang GMxXGx=
x
> > > >     5619c34d3c4c watchdog: move softlockup_panic back to early_para=
m
> > > >     a6c3a1fe09a2 PCI/sysfs: Protect driver's D3cold preference from
> user space
> > > >     01975bee0a14 hvc/xen: fix event channel handling for secondary
> consoles
> > > >     cfd543c10871 hvc/xen: fix error path in xen_hvc_init() to alway=
s
> register frontend driver
> > > >     730e08cb9101 hvc/xen: fix console unplug
> > > >     fa0b93a3de40 tty/sysrq: replace smp_processor_id() with get_cpu=
()
> > > >     92e6c0f00d38 audit: don't WARN_ON_ONCE(!current->mm) in
> audit_exe_compare()
> > > >     e29c095f1ad4 audit: don't take task_lock() in
> audit_exe_compare() code path
> > > >     5eb6519f483e KVM: x86: Ignore MSR_AMD64_TW_CFG access
> > > >     1c49ef7041f2 KVM: x86: hyper-v: Don't auto-enable stimer on
> write from user-space
> > > >     fe6b461c37cb x86/cpu/hygon: Fix the CPU topology evaluation for
> real
> > > >     3a2adf48d8b1 crypto: x86/sha - load modules based on CPU featur=
es
> > > >     be079aa71a12 scsi: qla2xxx: Fix system crash due to bad pointer
> access
> > > >     6ba3569f78d3 scsi: megaraid_sas: Increase register read retry
> rount from 3 to 30 for selected registers
> > > >     6a33b5810031 scsi: mpt3sas: Fix loop logic
> > > >     3c5aede46cdc bpf: Fix precision tracking for BPF_ALU | BPF_TO_B=
E
> | BPF_END
> > > >     403470431b15 bpf: Fix check_stack_write_fixed_off() to correctl=
y
> spill imm
> > > >     ba115f6c3a8c randstruct: Fix gcc-plugin performance mode to sta=
y
> in group
> > > >     2771fac4382b powerpc/perf: Fix disabling BHRB and instruction
> sampling
> > > >     7e450cc9ad54 media: venus: hfi: add checks to perform sanity on
> queue pointers
> > > >     1566e8be73fd i915/perf: Fix NULL deref bugs with drm_dbg() call=
s
> > > >     35c17257ef09 xfs: Fix unreferenced object reported by kmemleak
> in xfs_sysfs_init()
> > > >     5db146322b17 xfs: fix memory leak in xfs_errortag_init
> > > >     c540284d8488 xfs: fix exception caused by unexpected illegal
> bestcount in leaf dir
> > > >     5212d586e76f xfs: avoid a UAF when log intent item recovery fai=
ls
> > > >     ba179cc12109 xfs: fix inode reservation space for removing
> transaction
> > > >     b7847653a2d6 xfs: Fix false ENOSPC when performing direct write
> on a delalloc extent in cow fork
> > > >     92d38b87e886 xfs: add missing cmap->br_state =3D XFS_EXT_NORM
> update
> > > >     8d0baec78e8a xfs: fix intermittent hang during quotacheck
> > > >     76545c0e881b xfs: don't leak memory when attr fork loading fail=
s
> > > >     eb888caf27d9 xfs: fix use-after-free in xattr node block
> inactivation
> > > >     4cb3842967e6 xfs: flush inode gc workqueue before clearing agi
> bucket
> > > >     188594c64a1e xfs: prevent a UAF when log IO errors race with
> unmount
> > > >     921c96215850 xfs: use invalidate_lock to check the state of
> mmap_lock
> > > >     efd194800b69 xfs: convert buf_cancel_table allocation to
> kmalloc_array
> > > >     074fee186931 xfs: don't leak xfs_buf_cancel structures when
> recovery fails
> > > >     b8effd31a862 xfs: refactor buffer cancellation table allocation
> > > >     4968c2aa6a1f cifs: fix check of rc in function
> generate_smb3signingkey
> > > >     8d725bf0d16d cifs: spnego: add ';' in HOST_KEY_LEN
> > > >     21accf149161 tools/power/turbostat: Enable the C-state Pre-wake
> printing
> > > >     0045c1ff7ac0 tools/power/turbostat: Fix a knl bug
> > > >     5bcce23f387b macvlan: Don't propagate promisc change to lower
> dev in passthru
> > > >     7574b5e65e92 net/mlx5e: Check return value of snprintf writing
> to fw_version buffer for representors
> > > >     55553c5b53ae net/mlx5e: Reduce the size of icosq_str
> > > >     51655fd35703 net/mlx5e: Fix pedit endianness
> > > >     a990dd7410ec net/mlx5e: Refactor mod header management API
> > > >     39f95b1d0d8f net/mlx5e: Move mod hdr allocation to a single pla=
ce
> > > >     c0f37a3715cb net/mlx5e: Remove incorrect addition of action fwd
> flag
> > > >     6974fd92d5f1 net/mlx5e: fix double free of encap_header in
> update funcs
> > > >     f3c4a7044201 net/mlx5e: fix double free of encap_header
> > > >     931e9e8e30bf net: stmmac: fix rx budget limit check
> > > >     b8b514b2a6cd netfilter: nf_tables: fix pointer math issue in
> nft_byteorder_eval()
> > > >     25da0f582119 netfilter: nf_tables: add and use BE register
> load-store helpers
> > > >     a48f6be5bdb7 netfilter: nf_tables: use the correct get/put
> helpers
> > > >     7d3901bf3baa netfilter: nf_conntrack_bridge: initialize err to =
0
> > > >     75bcfc188abf af_unix: fix use-after-free in
> unix_stream_read_actor()
> > > >     0b480c654ef2 net: ethernet: cortina: Fix MTU max setting
> > > >     097588e20c6b net: ethernet: cortina: Handle large frames
> > > >     f9269b274cdf net: ethernet: cortina: Fix max RX frame define
> > > >     53064e8239dd bonding: stop the device in bond_setup_by_slave()
> > > >     cda210a4bdf7 ptp: annotate data-race around q->head and q->tail
> > > >     b67d16b2373b xen/events: fix delayed eoi list handling
> > > >     8531a4194e59 ppp: limit MRU to 64K
> > > >     9ae82308d184 tipc: Fix kernel-infoleak due to uninitialized TLV
> value
> > > >     359c65daf6b5 net: hns3: fix VF wrong speed and duplex issue
> > > >     406be003d698 net: hns3: fix VF reset fail issue
> > > >     cfc131b078a3 net: hns3: fix variable may not initialized proble=
m
> in hns3_init_mac_addr()
> > > >     070581829c1a net: hns3: fix incorrect capability bit display fo=
r
> copper port
> > > >     a3c65cf7854d net: hns3: add barrier in vf mailbox reply process
> > > >     e671d8203758 net: hns3: add byte order conversion for PF to VF
> mailbox message
> > > >     bb0f14257c04 net: hns3: refine the definition for struct
> hclge_pf_to_vf_msg
> > > >     1d8f66d4060a net: hns3: fix add VLAN fail issue
> > > >     4b3b2541d40e tty: Fix uninit-value access in ppp_sync_receive()
> > > >     1f64cad3ac38 ipvlan: add ipvlan_route_v6_outbound() helper
> > > >     6c71b9b177c6 net: set SOCK_RCU_FREE before inserting socket int=
o
> hashtable
> > > >     427165421c25 net: inet: Retire port only listening_hash
> > > >     be1ceb8b7c58 net: inet: Open code inet_hash2 and inet_unhash2
> > > >     bb9bcf47fba7 net: inet: Remove count from inet_listen_hashbucke=
t
> > > >     de634368e079 mptcp: listen diag dump support
> > > >     870f438aca56 mptcp: diag: switch to context structure
> > > >     be020f658c63 gfs2: Silence "suspicious RCU usage in
> gfs2_permission" warning
> > > >     194454afa6aa SUNRPC: Fix RPC client cleaned up the freed pipefs
> dentries
> > > >     319ed0cba164 NFSv4.1: fix SP4_MACH_CRED protection for pnfs IO
> > > >     809684f5b388 SUNRPC: Add an IS_ERR() check back to where it was
> > > >     46d6b768072b SUNRPC: ECONNRESET might require a rebind
> > > >     a7032d4d6499 media: cec: meson: always include meson
> sub-directory in Makefile
> > > >     16e78f28517d media: cadence: csi2rx: Unregister v4l2 async
> notifier
> > > >     20c2ca9abb78 sched/core: Optimize in_task() and in_interrupt() =
a
> bit
> > > >     9894c58c1777 tracing/perf: Add interrupt_context_level() helper
> > > >     48fef664d7e9 tracing: Reuse logic from perf's
> get_recursion_context()
> > > >     670b3e902f62 wifi: iwlwifi: Use FW rate for non-data frames
> > > >     a7ee519e8095 pwm: Fix double shift bug
> > > >     7054366cd076 drm/amdgpu: fix software pci_unplug on some chips
> > > >     e48a5e78d077 drm/qxl: prevent memory leak
> > > >     0835e7f296ca ASoC: ti: omap-mcbsp: Fix runtime PM underflow
> warnings
> > > >     38ada2f304f6 i2c: dev: copy userspace array safely
> > > >     610244988f32 kgdb: Flush console before entering kgdb on panic
> > > >     4e497f1acd99 drm/amd/display: Avoid NULL dereference of timing
> generator
> > > >     5e0b788fb96b media: imon: fix access to invalid resource for th=
e
> second interface
> > > >     ae6bcafe1f6b media: ccs: Fix driver quirk struct documentation
> > > >     d01b0ad79ecd media: cobalt: Use FIELD_GET() to extract Link Wid=
th
> > > >     03ce0655bf8e gfs2: fix an oops in gfs2_permission
> > > >     5bfda356e903 gfs2: ignore negated quota changes
> > > >     16631907d013 media: vivid: avoid integer overflow
> > > >     09cd8b561aa9 media: gspca: cpia1: shift-out-of-bounds in
> set_flicker
> > > >     39c71357e68e i3c: master: mipi-i3c-hci: Fix a kernel panic for
> accessing DAT_data.
> > > >     72775cad7f57 virtio-blk: fix implicit overflow on
> virtio_max_dma_size
> > > >     f7f3bdb225e3 i2c: sun6i-p2wi: Prevent potential division by zer=
o
> > > >     d23ad76f240c i3c: mipi-i3c-hci: Fix out of bounds access in
> hci_dma_irq_handler
> > > >     e6fbad3cc880 9p: v9fs_listxattr: fix %s null argument warning
> > > >     a18be976be41 9p/trans_fd: Annotate data-racy writes to
> file::f_flags
> > > >     2cc5e191d671 usb: gadget: f_ncm: Always set current gadget in
> ncm_bind()
> > > >     6c80f48912b5 tty: vcc: Add check for kstrdup() in vcc_probe()
> > > >     2ff61106d6b4 exfat: support handle zero-size directory
> > > >     c86a3007a685 HID: Add quirk for Dell Pro Wireless Keyboard and
> Mouse KM5221W
> > > >     3453f945af89 PCI: Use FIELD_GET() in Sapphire RX 5600 XT Pulse
> quirk
> > > >     0a93a0f99a09 misc: pci_endpoint_test: Add Device ID for R-Car
> S4-8 PCIe controller
> > > >     03dbd6a9ea4e PCI: Disable ATS for specific Intel IPU E2000
> devices
> > > >     a9a0b3444845 PCI: Extract ATS disabling to a helper function
> > > >     fe511d24418a PCI: Use FIELD_GET() to extract Link Width
> > > >     56d78b5495eb scsi: libfc: Fix potential NULL pointer dereferenc=
e
> in fc_lport_ptp_setup()
> > > >     37a51e7f36b7 atm: iphase: Do PCI error checks on own line
> > > >     f05ae00106aa PCI: tegra194: Use FIELD_GET()/FIELD_PREP() with
> Link Width fields
> > > >     631a96e9eb42 ALSA: hda: Fix possible null-ptr-deref when
> assigning a stream
> > > >     1c805b9cd2e3 ARM: 9320/1: fix stack depot IRQ stack filter
> > > >     8d25ec69f8f1 HID: lenovo: Detect quirk-free fw on cptkbd and
> stop applying workaround
> > > >     64f062baf202 jfs: fix array-index-out-of-bounds in diAlloc
> > > >     da3da5e1e6f7 jfs: fix array-index-out-of-bounds in dbFindLeaf
> > > >     1f74d336990f fs/jfs: Add validity check for db_maxag and
> db_agpref
> > > >     5f148b16972e fs/jfs: Add check for negative db_l2nbperpage
> > > >     e1d1f79b1929 scsi: ibmvfc: Remove BUG_ON in the case of an empt=
y
> event pool
> > > >     f0bfc8a5561f scsi: hisi_sas: Set debugfs_dir pointer to NULL
> after removing debugfs
> > > >     5904dee70771 RDMA/hfi1: Use FIELD_GET() to extract Link Width
> > > >     546c1796ad1e crypto: pcrypt - Fix hungtask for PADATA_RESET
> > > >     bc443a199f8c ASoC: soc-card: Add storage for PCI SSID
> > > >     9f2082067c5f selftests/efivarfs: create-read: fix a resource le=
ak
> > > >     428cad17f53b arm64: dts: ls208xa: use a pseudo-bus to constrain
> usb dma size
> > > >     174f62a0aa15 drm/amdgpu: Fix a null pointer access when the
> smc_rreg pointer is NULL
> > > >     3f7a400d5e80 drm/amdkfd: Fix shift out-of-bounds issue
> > > >     300589d551d4 drm/panel: st7703: Pick different reset sequence
> > > >     eaa03ea366c8 drm/amdgpu/vkms: fix a possible null pointer
> dereference
> > > >     84c923d89890 drm/panel/panel-tpo-tpg110: fix a possible null
> pointer dereference
> > > >     2381f6b628b3 drm/panel: fix a possible null pointer dereference
> > > >     c11cf5e117f5 drm/amdgpu: Fix potential null pointer derefernce
> > > >     a237675aa1e6 drm/amd: Fix UBSAN array-index-out-of-bounds for
> Polaris and Tonga
> > > >     acdb6830de02 drm/amd: Fix UBSAN array-index-out-of-bounds for
> SMU7
> > > >     829ce8e995a8 drm/msm/dp: skip validity check for DP CTS EDID
> checksum
> > > >     689b33b94f09 drm: vmwgfx_surface.c: copy user-array safely
> > > >     22260dabcfe3 kernel: watch_queue: copy user-array safely
> > > >     d4f2c09d4672 kernel: kexec: copy user-array safely
> > > >     24b17d530c42 string.h: add array-wrappers for (v)memdup_user()
> > > >     3a3a6dc9a330 drm/amd/display: use full update for clip size
> increase of large plane source
> > > >     7d43cdd22cd8 drm/amdkfd: Fix a race condition of vram buffer
> unref in svm code
> > > >     eea81424c5b8 drm/komeda: drop all currently held locks if
> deadlock happens
> > > >     812886866be6 platform/x86: thinkpad_acpi: Add battery quirk for
> Thinkpad X120e
> > > >     ba7088769800 Bluetooth: Fix double free in hci_conn_cleanup
> > > >     f9de14bde56d Bluetooth: btusb: Add date->evt_skb is NULL check
> > > >     a43cf6acf017 wifi: ath10k: Don't touch the CE interrupt
> registers after power up
> > > >     6f42bd243327 net: annotate data-races around
> sk->sk_dst_pending_confirm
> > > >     19ab5fd26441 net: annotate data-races around
> sk->sk_tx_queue_mapping
> > > >     f3be63f7a8ee wifi: ath10k: fix clang-specific fortify warning
> > > >     02a0547b8da0 wifi: ath9k: fix clang-specific fortify warnings
> > > >     cf353904a828 bpf: Detect IP =3D=3D ksym.end as part of BPF prog=
ram
> > > >     c29a89b23f67 atl1c: Work around the DMA RX overflow issue
> > > >     21a0f310a9f3 wifi: mac80211: don't return unset power in
> ieee80211_get_tx_power()
> > > >     3073e38086d0 wifi: mac80211_hwsim: fix clang-specific fortify
> warning
> > > >     e8e55fa44435 x86/mm: Drop the 4 MB restriction on minimal NUMA
> node memory size
> > > >     f9d3ba62e87b workqueue: Provide one lock class key per
> work_on_cpu() callsite
> > > >     0a5b512d526c clocksource/drivers/timer-atmel-tcb: Fix
> initialization on SAM9 hardware
> > > >     465b88c0873b clocksource/drivers/timer-imx-gpt: Fix potential
> memory leak
> > > >     fd0df3f87192 perf/core: Bail out early if the request AUX area
> is out of bound
> > > >     e89d0ed45a41 locking/ww_mutex/test: Fix potential workqueue
> corruption
> > > >     2a910f4af54d Linux 5.15.139
> > > >     3443337acd37 btrfs: use u64 for buffer sizes in the tree search
> ioctls
> > > >     f9f5e8cecba9 Revert "mmc: core: Capture correct oemid-bits for
> eMMC cards"
> > > >     824829c2c6b4 tracing/kprobes: Fix the order of argument
> descriptions
> > > >     560680f745fc fbdev: fsl-diu-fb: mark wr_reg_wa() static
> > > >     8e4b510fe917 fbdev: imsttfb: fix a resource leak in probe
> > > >     3648582181b6 fbdev: imsttfb: Fix error path of imsttfb_probe()
> > > >     30959f9f4540 spi: spi-zynq-qspi: add spi-mem to driver kconfig
> dependencies
> > > >     9cf044cc36c1 ASoC: hdmi-codec: register hpd callback on
> component probe
> > > >     705e5a28ec1d drm/syncobj: fix
> DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
> > > >     0ca05fae2790 netfilter: nat: fix ipv6 nat redirect with mapped
> and scoped addresses
> > > >     1652f57f02eb netfilter: nft_redir: use `struct nf_nat_range2`
> throughout and deduplicate eval call-backs
> > > >     d28c17abe098 netfilter: xt_recent: fix (increase) ipv6 literal
> buffer length
> > > >     f30567fcbc4d i2c: iproc: handle invalid slave state
> > > >     38f5ac54b917 r8169: respect userspace disabling IFF_MULTICAST
> > > >     fd01115b033c blk-core: use pr_warn_ratelimited() in
> bio_check_ro()
> > > >     b80148710983 block: remove unneeded return value of
> bio_check_ro()
> > > >     d8d94d6b3bd3 tg3: power down device only on SYSTEM_POWER_OFF
> > > >     5ea06a23f8f4 net/smc: put sk reference if close work was cancel=
ed
> > > >     884606f8283c net/smc: allow cdc msg send rather than drop it
> with NULL sndbuf_desc
> > > >     a62af7146daa net/smc: fix dangling sock under state
> SMC_APPFINCLOSEWAIT
> > > >     866606826f16 selftests: pmtu.sh: fix result checking
> > > >     2d117ac1b8f8 net: stmmac: xgmac: Enable support for multiple
> Flexible PPS outputs
> > > >     95a99ac112c5 Fix termination state for idr_for_each_entry_ul()
> > > >     70ef755f126b net: r8169: Disable multicast filter for RTL8168H
> and RTL8107E
> > > >     0dad0e75d62b dccp/tcp: Call security_inet_conn_request() after
> setting IPv6 addresses.
> > > >     c340713bdf32 dccp: Call security_inet_conn_request() after
> setting IPv4 addresses.
> > > >     d1b7e6562a4c octeontx2-pf: Fix holes in error code
> > > >     f60297ef59d4 octeontx2-pf: Fix error codes
> > > >     794d360b1d65 inet: shrink struct flowi_common
> > > >     8943083bbb64 bpf: Check map->usercnt after timer->timer is
> assigned
> > > >     3907b89cd17f tipc: Change nla_policy for bearer-related names t=
o
> NLA_NUL_STRING
> > > >     a1a485e45d24 hsr: Prevent use after free in
> prp_create_tagged_frame()
> > > >     352887b3edd0 llc: verify mac len before reading mac header
> > > >     303766bb92c5 Input: synaptics-rmi4 - fix use after free in
> rmi_unregister_function()
> > > >     741e4c15d7c0 pwm: brcmstb: Utilize appropriate clock APIs in
> suspend/resume
> > > >     895ac9a21f69 pwm: sti: Reduce number of allocations and drop
> usage of chip_data
> > > >     db64ddddeeec regmap: prevent noinc writes from clobbering cache
> > > >     004d4002534e media: dvb-usb-v2: af9035: fix missing unlock
> > > >     a0beda184756 media: cedrus: Fix clock/reset sequence
> > > >     980be4c3b0d5 media: vidtv: mux: Add check and kfree for kstrdup
> > > >     d17269fb9161 media: vidtv: psi: Add check for kstrdup
> > > >     db89f551b706 media: s3c-camif: Avoid inappropriate kfree()
> > > >     51c94256a83f media: bttv: fix use after free error due to
> btv->timeout timer
> > > >     d3937f9e25d9 media: i2c: max9286: Fix some redundant
> of_node_put() calls
> > > >     9d060f2fc40c pcmcia: ds: fix possible name leak in error path i=
n
> pcmcia_device_add()
> > > >     24e9df588e2e pcmcia: ds: fix refcount leak in pcmcia_device_add=
()
> > > >     24e73ab542c7 pcmcia: cs: fix possible hung task and memory leak
> pccardd()
> > > >     b3eaa0d43c74 rtc: pcf85363: fix wrong mask/val parameters in
> regmap_update_bits call
> > > >     20bd0198bebd cxl/mem: Fix shutdown order
> > > >     d48fe8d98171 i3c: Fix potential refcount leak in
> i3c_master_register_new_i3c_devs
> > > >     855d6fb2cc7b 9p/net: fix possible memory leak in
> p9_check_errors()
> > > >     0d456ebaad30 perf hist: Add missing puts to hist__account_cycle=
s
> > > >     924e8d0b7645 perf machine: Avoid out of bounds LBR memory read
> > > >     76b0eab987c4 usb: host: xhci-plat: fix possible kernel oops
> while resuming
> > > >     c9c4dab06a5a xhci: Loosen RPM as default policy to cover for AM=
D
> xHC 1.1
> > > >     92c9ef156431 powerpc/pseries: fix potential memory leak in
> init_cpu_associativity()
> > > >     516235e7b35f powerpc/imc-pmu: Use the correct spinlock
> initializer.
> > > >     945dc61d7840 powerpc/xive: Fix endian conversion size
> > > >     bce31a2bcb1e powerpc/40x: Remove stale PTE_ATOMIC_UPDATES macro
> > > >     1308e55eb09c modpost: fix tee MODULE_DEVICE_TABLE built on
> big-endian host
> > > >     863a9c3fdec2 powerpc: Only define __parse_fpscr() when required
> > > >     01f62c6bd2db f2fs: fix to initialize map.m_pblk in
> f2fs_precache_extents()
> > > >     dfebea7114e0 dmaengine: pxa_dma: Remove an erroneous BUG_ON() i=
n
> pxad_free_desc()
> > > >     72f8fa6c4b78 USB: usbip: fix stub_dev hub disconnect
> > > >     168697f15a53 tools: iio: iio_generic_buffer ensure alignment
> > > >     a61c3c647ffd misc: st_core: Do not call kfree_skb() under
> spin_lock_irqsave()
> > > >     732aa0cb2601 dmaengine: ti: edma: handle irq_of_parse_and_map()
> errors
> > > >     2941a29fe9d6 usb: chipidea: Simplify Tegra DMA alignment code
> > > >     58e8316b200b usb: chipidea: Fix DMA overwrite for Tegra
> > > >     fcaafb574fc8 usb: dwc2: fix possible NULL pointer dereference
> caused by driver concurrency
> > > >     c956be5641cc dmaengine: idxd: Register dsa_bus_type before
> registering idxd sub-drivers
> > > >     ca46d7ce1fbe livepatch: Fix missing newline character in
> klp_resolve_symbols()
> > > >     b77f7c025e85 tty: tty_jobctrl: fix pid memleak in
> disassociate_ctty()
> > > >     e9f598a5cc9a f2fs: compress: fix to avoid redundant compress
> extension
> > > >     8c4504cc0c64 f2fs: compress: fix to avoid use-after-free on dic
> > > >     ca0aae3837a6 leds: trigger: ledtrig-cpu:: Fix 'output may be
> truncated' issue for 'cpu'
> > > >     206a972511a8 leds: pwm: Don't disable the PWM when the LED
> should be off
> > > >     893eedf596dd leds: turris-omnia: Do not use SMBUS calls
> > > >     aec3706971b3 leds: turris-omnia: Drop unnecessary mutex locking
> > > >     c9a4f13c58f1 mfd: arizona-spi: Set pdata.hpdet_channel for ACPI
> enumerated devs
> > > >     63a99d7b57b4 mfd: dln2: Fix double put in dln2_probe
> > > >     2742c860e0b7 mfd: core: Ensure disabled devices are skipped
> without aborting
> > > >     94eb5423d75e mfd: core: Un-constify mfd_cell.of_reg
> > > >     8890d4d5f25e ASoC: ams-delta.c: use component after check
> > > >     a2ae48bd82ee crypto: qat - fix deadlock in backlog processing
> > > >     0dd34a7ad395 padata: Fix refcnt handling in padata_free_shell()
> > > >     93e4aa8545ab ASoC: Intel: Skylake: Fix mem leak when parsing
> UUIDs fails
> > > >     cd1c2df64d6b HID: logitech-hidpp: Move
> get_wireless_feature_index() check to hidpp_connect_event()
> > > >     99893b7c4592 HID: logitech-hidpp: Revert "Don't restart
> communication if not necessary"
> > > >     5f2f38602583 HID: logitech-hidpp: Don't restart IO, instead
> defer hid_connect() only
> > > >     1f80041c5867 HID: logitech-hidpp: Remove HIDPP_QUIRK_NO_HIDINPU=
T
> quirk
> > > >     d3b196a1da3e Revert "HID: logitech-hidpp: add a module paramete=
r
> to keep firmware gestures"
> > > >     6885e5ffa09d sh: bios: Revive earlyprintk support
> > > >     b0c25e957f9b hid: cp2112: Fix IRQ shutdown stopping polling for
> all IRQs on chip
> > > >     d06dc0f99f72 RDMA/hfi1: Workaround truncation compilation error
> > > >     086cd44204bb scsi: ufs: core: Leave space for '\0' in utf8 desc
> string
> > > >     a0f1999090b3 ASoC: fsl: Fix PM disable depth imbalance in
> fsl_easrc_probe
> > > >     904fc0103776 RDMA/hns: The UD mode can only be configured with
> DCQCN
> > > >     9f8db02d30ad RDMA/hns: Fix signed-unsigned mixed comparisons
> > > >     2de683e27e1d RDMA/hns: Fix uninitialized ucmd in
> hns_roce_create_qp_common()
> > > >     611260e36f16 IB/mlx5: Fix rdma counter binding for RAW QP
> > > >     922b2693b9af ASoC: fsl: mpc5200_dma.c: Fix warning of Function
> parameter or member not described
> > > >     001f90cd9d2f ext4: move 'ix' sanity check to corrent position
> > > >     c24a3c9e373e ARM: 9321/1: memset: cast the constant byte to
> unsigned char
> > > >     012d0c66f939 hid: cp2112: Fix duplicate workqueue initializatio=
n
> > > >     1ce09238e8e8 crypto: qat - increase size of buffers
> > > >     62df66b726f9 crypto: caam/jr - fix Chacha20 + Poly1305 self tes=
t
> failure
> > > >     61f25d4686bf crypto: caam/qi2 - fix Chacha20 + Poly1305 self
> test failure
> > > >     66eb7b7f23dd nd_btt: Make BTT lanes preemptible
> > > >     6563e0f79d63 libnvdimm/of_pmem: Use devm_kstrdup instead of
> kstrdup and check its return value
> > > >     d4ad0c1a83ce scsi: ibmvfc: Fix erroneous use of rtas_busy_delay
> with hcall return code
> > > >     b79c7d684c3f RDMA/core: Use size_{add,sub,mul}() in calls to
> struct_size()
> > > >     a5c83c8043d7 hwrng: geode - fix accessing registers
> > > >     a8607725b20a crypto: hisilicon/hpre - Fix a erroneous check
> after snprintf()
> > > >     b01b9dc5487a selftests/resctrl: Ensure the benchmark commands
> fits to its array
> > > >     2d2300fcf8f6 selftests/pidfd: Fix ksft print formats
> > > >     8bc9c9447489 arm64: dts: imx8mn: Add sound-dai-cells to micfil
> node
> > > >     1abd658492b5 arm64: dts: imx8mm: Add sound-dai-cells to micfil
> node
> > > >     cf7abb54f8b1 arm64: dts: imx8qm-ss-img: Fix jpegenc compatible
> entry
> > > >     8704bf18a888 clk: scmi: Free scmi_clk allocated when the clocks
> with invalid info are skipped
> > > >     bdb0428aa294 firmware: arm_ffa: Assign the missing IDR
> allocation ID to the FFA device
> > > >     b0ffdc164365 firmware: ti_sci: Mark driver as non removable
> > > >     995ee1e84e8d soc: qcom: llcc: Handle a second device without
> data corruption
> > > >     19b8098f73c6 ARM: dts: qcom: mdm9615: populate vsdcc fixed
> regulator
> > > >     a8ab88f84b89 arm64: dts: qcom: apq8016-sbc: Add missing ADV7533
> regulators
> > > >     ddc0df81eeac ARM64: dts: marvell: cn9310: Use appropriate label
> for spi1 pins
> > > >     12d9de01c09c arm64: dts: qcom: sdm845-mtp: fix WiFi configurati=
on
> > > >     690b89255971 arm64: dts: qcom: sc7280: Add missing LMH interrup=
ts
> > > >     2a4cce4168f7 arm64: dts: qcom: msm8992-libra: drop duplicated
> reserved memory
> > > >     eb9daf47806b arm64: dts: qcom: msm8916: Fix iommu local address
> range
> > > >     541640dcbf48 ARM: dts: renesas: blanche: Fix typo in GP_11_2 pi=
n
> name
> > > >     0e1e88bba286 perf: hisi: Fix use-after-free when register pmu
> fails
> > > >     4067d39f3c57 drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET
> settings/handling
> > > >     a6a6f70aedca drm/msm/dsi: use msm_gem_kernel_put to free TX
> buffer
> > > >     aea6f32a4318 xen-pciback: Consider INTx disabled when MSI/MSI-X
> is enabled
> > > >     e588ca45bf55 drm/rockchip: Fix type promotion bug in
> rockchip_gem_iommu_map()
> > > >     a00a293d57a5 arm64/arm: xen: enlighten: Fix KPTI checks
> > > >     d0d01bb4a560 drm/bridge: lt9611uxc: fix the race in the error
> path
> > > >     29aba28ea195 drm/bridge: lt9611uxc: Register and attach our DSI
> device at probe
> > > >     f53a04579328 drm/bridge: lt9611uxc: Switch to devm MIPI-DSI
> helpers
> > > >     517a5137a57b drm/rockchip: cdn-dp: Fix some error handling path=
s
> in cdn_dp_probe()
> > > >     865ccd4ca674 drm/mediatek: Fix iommu fault during crtc enabling
> > > >     8e3c8253b34f drm/mediatek: Fix iommu fault by swapping FBs afte=
r
> updating plane state
> > > >     e11e339faa11 drm/amdkfd: fix some race conditions in vram buffe=
r
> alloc/free of svm code
> > > >     30cb99e09648 drm/bridge: tc358768: Fix bit updates
> > > >     1cd4ae681a6a drm/bridge: tc358768: Disable non-continuous clock
> mode
> > > >     c13591b859be drm/bridge: tc358768: Fix use of uninitialized
> variable
> > > >     d78bddd94b80 drm/bridge: lt8912b: Add missing drm_bridge_attach
> call
> > > >     5cc2bc519afd drm/bridge: lt8912b: Manually disable HPD only if
> it was enabled
> > > >     42071feab712 drm/bridge: lt8912b: Fix crash on bridge detach
> > > >     d9217286d0ab drm/bridge: lt8912b: Fix bridge_detach
> > > >     cc3057958c5c drm/bridge: lt8912b: Add hot plug detection
> > > >     ef4a40953c80 drm/bridge: lt8912b: Register and attach our DSI
> device at probe
> > > >     3580b8a01305 drm/bridge: lt8912b: Switch to devm MIPI-DSI helpe=
rs
> > > >     52541851a8d1 drm/mipi-dsi: Create devm device attachment
> > > >     a20d6ecd261a drm/mipi-dsi: Create devm device registration
> > > >     347f025a02b3 drm/radeon: possible buffer overflow
> > > >     b163b371d741 drm/rockchip: vop: Fix call to crtc reset helper
> > > >     9a96bed1df7b drm/rockchip: vop: Fix reset of state in duplicate
> state crtc funcs
> > > >     1b0bc99cf316 hwmon: (coretemp) Fix potentially truncated sysfs
> attribute name
> > > >     b3e7eb23a6e9 hwmon: (axi-fan-control) Fix possible NULL pointer
> dereference
> > > >     e0bf076b734a platform/x86: wmi: Fix opening of char device
> > > >     c57e81d5e538 platform/x86: wmi: remove unnecessary
> initializations
> > > >     2ca4e461a298 platform/x86: wmi: Fix probe failure when failing
> to register WMI devices
> > > >     f75e11f54d98 clk: qcom: config IPQ_APSS_6018 should depend on
> QCOM_SMEM
> > > >     d1175cf4bd2b clk: mediatek: clk-mt2701: Add check for
> mtk_alloc_clk_data
> > > >     e964d21dc034 clk: mediatek: clk-mt7629: Add check for
> mtk_alloc_clk_data
> > > >     c4070ada5d51 clk: mediatek: clk-mt7629-eth: Add check for
> mtk_alloc_clk_data
> > > >     3aefc6fcfbad clk: mediatek: clk-mt6797: Add check for
> mtk_alloc_clk_data
> > > >     ca6d565a2319 clk: mediatek: clk-mt6779: Add check for
> mtk_alloc_clk_data
> > > >     533ca5153ad6 clk: mediatek: clk-mt6765: Add check for
> mtk_alloc_clk_data
> > > >     e531e4e73734 clk: npcm7xx: Fix incorrect kfree
> > > >     761c2a690d8f clk: ti: fix double free in
> of_ti_divider_clk_setup()
> > > >     1c37faca0908 clk: ti: change ti_clk_register[_omap_hw]() API
> > > >     28b72fba1e19 clk: ti: Update component clocks to use
> ti_dt_clk_name()
> > > >     c4bffed2e52b clk: ti: Update pll and clockdomain clocks to use
> ti_dt_clk_name()
> > > >     9b5e9d8bf9a6 clk: ti: Add ti_dt_clk_name() helper to use
> clock-output-names
> > > >     f45fff806ebb clk: keystone: pll: fix a couple NULL vs IS_ERR()
> checks
> > > >     7ff8ca9beefb spi: nxp-fspi: use the correct ioremap function
> > > >     26206c858dae clk: renesas: rzg2l: Fix computation formula
> > > >     1966bf2a79e6 clk: renesas: rzg2l: Use FIELD_GET() for PLL
> register fields
> > > >     7ece2efa87af clk: renesas: rzg2l: Simplify multiplication/shift
> logic
> > > >     e2239f716529 clk: imx: imx8qxp: Fix elcdif_pll clock
> > > >     7d416973cd12 clk: imx: imx8mq: correct error handling path
> > > >     608ebb098b79 clk: imx: Select MXC_CLK for CLK_IMX8QXP
> > > >     8861b2925a84 clk: qcom: gcc-sm8150: Fix gcc_sdcc2_apps_clk_src
> > > >     76e8f00f54a8 clk: qcom: mmcc-msm8998: Fix the SMMU GDSC
> > > >     56c4bb46a5a0 clk: qcom: mmcc-msm8998: Don't check halt bit on
> some branch clks
> > > >     0881d24cf5ca clk: qcom: clk-rcg2: Fix clock rate overflow for
> high parent frequencies
> > > >     b64683f5d728 spi: tegra: Fix missing IRQ check in
> tegra_slink_probe()
> > > >     b13e8b38be51 regmap: debugfs: Fix a erroneous check after
> snprintf()
> > > >     8fafac407346 ipvlan: properly track tx_errors
> > > >     3eedc19a9d0f net: add DEV_STATS_READ() helper
> > > >     359bce81b841 ipv6: avoid atomic fragment on GSO packets
> > > >     6b413d52f6ab ACPI: sysfs: Fix create_pnp_modalias() and
> create_of_modalias()
> > > >     32aaa3b98789 wifi: iwlwifi: empty overflow queue during flush
> > > >     0e3ad00be4e8 wifi: iwlwifi: pcie: synchronize IRQs before NAPI
> > > >     a8ebe549e0ce wifi: iwlwifi: call napi_synchronize() before
> freeing rx/tx queues
> > > >     627a3b3f5c80 iwlwifi: pcie: adjust to Bz completion descriptor
> > > >     0d91506a40ec tcp: fix cookie_init_timestamp() overflows
> > > >     4f6e904ed4e3 chtls: fix tp->rcv_tstamp initialization
> > > >     5d7bec7ae4db r8169: fix rare issue with broken rx after
> link-down on RTL8125
> > > >     e143a3c82d33 r8169: use tp_to_dev instead of open code
> > > >     3a8f4e58e1ee thermal: core: prevent potential string overflow
> > > >     bfd4ed4988aa netfilter: nf_tables: Drop pointless memset when
> dumping rules
> > > >     80986257d2cd PM / devfreq: rockchip-dfi: Make pmu regmap
> mandatory
> > > >     826120c9ba68 can: dev: can_put_echo_skb(): don't crash kernel i=
f
> can_priv::echo_skb is accessed out of bounds
> > > >     28e9e015916e can: dev: can_restart(): fix race condition betwee=
n
> controller restart and netif_carrier_on()
> > > >     ada4dc4788f1 can: dev: can_restart(): don't crash kernel if
> carrier is OK
> > > >     d4eb4182a823 wifi: rtlwifi: fix EDCA limit set by BT coexistenc=
e
> > > >     2027e74150ee tcp_metrics: do not create an entry from
> tcp_init_metrics()
> > > >     3f7cb7c47ce0 tcp_metrics: properly set tp->snd_ssthresh in
> tcp_init_metrics()
> > > >     ca7b6fa9e61a tcp_metrics: add missing barriers on delete
> > > >     227709a0e47c wifi: mt76: mt7603: improve stuck beacon handling
> > > >     eab5b0aa5065 mt76: pass original queue id from
> __mt76_tx_queue_skb to the driver
> > > >     75336a762539 mt76: add support for overriding the device used
> for DMA mapping
> > > >     77b2ab5cd1a4 mt76: dma: use kzalloc instead of devm_kzalloc for
> txwi
> > > >     064b32f18db1 wifi: mt76: mt7603: rework/fix rx pse hang check
> > > >     1afbb9ececd3 wifi: rtw88: debug: Fix the NULL vs IS_ERR() bug
> for debugfs_create_file()
> > > >     ebcbf5f5e047 net: spider_net: Use size_add() in call to
> struct_size()
> > > >     56e7424c6efc tipc: Use size_add() in calls to struct_size()
> > > >     3e51efcb2909 mlxsw: Use size_mul() in call to struct_size()
> > > >     dc3fef310732 gve: Use size_add() in call to struct_size()
> > > >     70f032db8516 tcp: call tcp_try_undo_recovery when an RTOd TFO
> SYNACK is ACKed
> > > >     a2d540c74549 udp: add missing WRITE_ONCE() around up->encap_rcv
> > > >     8f7eef3a13df selftests/bpf: Correct map_fd to data_fd in
> tailcalls
> > > >     3eefb2fbf4ec selftests/bpf: Test tail call counting with bpf2bp=
f
> and data on stack
> > > >     ab91992ec4d4 i40e: fix potential memory leaks in i40e_remove()
> > > >     702742373650 genirq/matrix: Exclude managed interrupts in
> irq_matrix_allocated()
> > > >     379b120e4f27 pstore/platform: Add check for kstrdup
> > > >     81b8638e4ef4 x86/boot: Fix incorrect startup_gdt_descr.size
> > > >     c7e8c7452e5a x86/sev-es: Allow copy_from_kernel_nofault() in
> earlier boot
> > > >     0b5da8ce0f18 x86: Share definition of __is_canonical_address()
> > > >     90b263db856d futex: Don't include process MM in futex key on
> no-MMU
> > > >     f0d6e5841172 x86/srso: Fix SBPB enablement for (possible) futur=
e
> fixed HW
> > > >     565f9337b68e writeback, cgroup: switch inodes with dirty
> timestamps to release dying cgwbs
> > > >     2bb46b20825d vfs: fix readahead(2) on block devices
> > > >     20195f87db19 sched: Fix stop_one_cpu_nowait() vs hotplug
> > > >     13cde955e52e sched/uclamp: Ignore (util =3D=3D 0) optimization =
in
> feec() when p_util_max =3D 0
> > > >     cc6198ff20c0 iov_iter, x86: Be consistent about the __user tag
> on copy_mc_to_user()
> > > >     80529b4968a8 Linux 5.15.138
> > > >     3d8344a7c4a3 ALSA: hda: intel-dsp-config: Fix JSL Chromebook
> quirk detection
> > > >     f049c0c0037d misc: pci_endpoint_test: Add deviceID for J721S2
> PCIe EP device support
> > > >     28b8ad8ccecd tty: 8250: Add Brainboxes Oxford
> Semiconductor-based quirks
> > > >     44c4dfac3f02 tty: 8250: Add support for Intashield IX cards
> > > >     d541ccb34de2 tty: 8250: Add support for additional Brainboxes P=
X
> cards
> > > >     60debc01fcbb tty: 8250: Fix up PX-803/PX-857
> > > >     1f5649aed527 tty: 8250: Fix port count of PX-257
> > > >     3fe3cc63c730 tty: 8250: Add support for Intashield IS-100
> > > >     a5b6390fd609 tty: 8250: Add support for Brainboxes UP cards
> > > >     738fe41b6443 tty: 8250: Add support for additional Brainboxes U=
C
> cards
> > > >     ff6059c3d234 tty: 8250: Remove UC-257 and UC-431
> > > >     81a4dd5e6c78 tty: n_gsm: fix race condition in status line
> change on dead connections
> > > >     e25197747f0e usb: raw-gadget: properly handle interrupted
> requests
> > > >     e5f53a68a596 usb: typec: tcpm: Fix NULL pointer dereference in
> tcpm_pd_svdm()
> > > >     7c4855b22a3f usb: storage: set 1.50 as the lower bcdDevice for
> older "Super Top" compatibility
> > > >     c48aae53850c PCI: Prevent xHCI driver from claiming AMD VanGogh
> USB3 DRD device
> > > >     6628c3627c02 drm/amd: Disable ASPM for VI w/ all Intel systems
> > > >     b6c3c7786e24 drm/amd: Move helper for dynamic speed switch chec=
k
> out of smu13
> > > >     9015169f00ee can: isotp: isotp_sendmsg(): fix TX state detectio=
n
> and wait behavior
> > > >     d72ff6478323 can: isotp: isotp_bind(): do not validate unused
> address information
> > > >     e163ad6a8639 can: isotp: add local echo tx processing and tx
> without FC
> > > >     b4e78ea26638 can: isotp: handle wait_event_interruptible()
> return values
> > > >     2fc6f337257f can: isotp: check CAN address family in isotp_bind=
()
> > > >     f8c3bd211cf3 can: isotp: isotp_bind(): return -EINVAL on
> incorrect CAN ID formatting
> > > >     615c4dd64050 can: isotp: set max PDU size to 64 kByte
> > > >     6627b96851f1 powerpc/mm: Fix boot crash with FLATMEM
> > > >     f0f998648887 r8152: Check for unplug in r8153b_ups_en() /
> r8153c_ups_en()
> > > >     78c939a88729 r8152: Check for unplug in rtl_phy_patch_request()
> > > >     51cc28ce742e net: chelsio: cxgb4: add an error code check in
> t4_load_phy_fw
> > > >     bbc926199321 platform/mellanox: mlxbf-tmfifo: Fix a warning
> message
> > > >     db4416ea3a5d scsi: mpt3sas: Fix in error path
> > > >     d48b2e8189d5 fbdev: uvesafb: Call cn_del_callback() at the end
> of uvesafb_exit()
> > > >     e39440c3268b drm/ttm: Reorder sys manager cleanup step
> > > >     aade33d3d9bb ASoC: rt5650: fix the wrong result of key button
> > > >     fa32e21c0568 netfilter: nfnetlink_log: silence bogus compiler
> warning
> > > >     dfcbb983eb6e spi: npcm-fiu: Fix UMA reads when dummy.nbytes =3D=
=3D 0
> > > >     64ae128b095d fs/ntfs3: Avoid possible memory leak
> > > >     27a0bed1285e fs/ntfs3: Fix directory element type detection
> > > >     94524980ee75 fs/ntfs3: Fix NULL pointer dereference on error in
> attr_allocate_frame()
> > > >     2de328398b50 fs/ntfs3: Fix possible NULL-ptr-deref in
> ni_readpage_cmpr()
> > > >     962a3d3d731c fs/ntfs3: Use kvmalloc instead of kmalloc(...
> __GFP_NOWARN)
> > > >     393966e79ba1 fs/ntfs3: Write immediately updated ntfs state
> > > >     59e629fc7157 fs/ntfs3: Add ckeck in ni_update_parent()
> > > >     738a3adc7c8b fbdev: atyfb: only use ioremap_uc() on i386 and ia=
64
> > > >     afef8af919d2 Input: synaptics-rmi4 - handle reset delay when
> using SMBus trsnsport
> > > >     abc62fc06d4a powerpc/85xx: Fix math emulation exception
> > > >     4bdde4dca00e dmaengine: ste_dma40: Fix PM disable depth
> imbalance in d40_probe
> > > >     39d2c10367a8 irqchip/stm32-exti: add missing DT IRQ flag
> translation
> > > >     c57aef9075e0 irqchip/riscv-intc: Mark all INTC nodes as
> initialized
> > > >     eb99b6e204cd net: sched: cls_u32: Fix allocation size in
> u32_init()
> > > >     5e78ebe7c1db ASoC: simple-card: fixup asoc_simple_probe() error
> handling
> > > >     65fd21aa3805 x86: Fix .brk attribute in linker script
> > > >     d4c8bf5635c4 rpmsg: Fix possible refcount leak in
> rpmsg_register_device_override()
> > > >     a82e0fda8a2f rpmsg: glink: Release driver_override
> > > >     bfd4a664ddfb rpmsg: Fix calling device_lock() on non-initialize=
d
> device
> > > >     2e76b4f6218c rpmsg: Fix kfree() of static memory on setting
> driver_override
> > > >     5c0da71871d3 rpmsg: Constify local variable in field store macr=
o
> > > >     389190b25472 driver: platform: Add helper for safer setting of
> driver_override
> > > >     37ffa428d58c objtool/x86: add missing embedded_insn check
> > > >     f031e15d0bb8 ext4: avoid overlapping preallocations due to
> overflow
> > > >     f2c3a3aa6f11 ext4: fix BUG in ext4_mb_new_inode_pa() due to
> overflow
> > > >     7a992726f727 ext4: add two helper functions extent_logical_end(=
)
> and pa_logical_end()
> > > >     9e78e7709f7d x86/mm: Fix RESERVE_BRK() for older binutils
> > > >     d3201c718058 x86/mm: Simplify RESERVE_BRK()
> > > >     897b56acf126 x86/i8259: Skip probing when ACPI/MADT advertises
> PCAT compatibility
> > > >     77db87c4a4ed gve: Fix GFP flags when allocing pages
> > > >     8b424bdf6c9c iio: afe: rescale: Accept only offset channels
> > > >     c1eeb494f684 iio: afe: rescale: add offset support
> > > >     7c76b7db5521 iio: afe: rescale: expose scale processing functio=
n
> > > >     c60671502dc2 iio: afe: rescale: reorder includes
> > > >     27dd09f5ec7f clk: Sanitize possible_parent_show to Handle Retur=
n
> Value of of_clk_get_parent_name
> > > >     c27ca4aebbee sparc32: fix a braino in fault handling in
> csum_and_copy_..._user()
> > > >     21b07a2e6095 perf/core: Fix potential NULL deref
> > > >     6efd498009b9 nvmem: imx: correct nregs for i.MX6UL
> > > >     0c2948118c34 nvmem: imx: correct nregs for i.MX6SLL
> > > >     6e22bf6f00d5 nvmem: imx: correct nregs for i.MX6ULL
> > > >     e0f95b831b4a misc: fastrpc: Clean buffers on remote invocation
> failures
> > > >     c4957f00f9e2 tracing/kprobes: Fix the description of variable
> length arguments
> > > >     cdc57093b470 i2c: aspeed: Fix i2c bus hang in slave read
> > > >     e97d374a2506 i2c: stm32f7: Fix PEC handling in case of SMBUS
> transfers
> > > >     2766a872103b i2c: muxes: i2c-demux-pinctrl: Use
> of_get_i2c_adapter_by_node()
> > > >     48b58f7469e5 i2c: muxes: i2c-mux-gpmux: Use
> of_get_i2c_adapter_by_node()
> > > >     cb65e692765b i2c: muxes: i2c-mux-pinctrl: Use
> of_get_i2c_adapter_by_node()
> > > >     eace761f35a1 iio: adc: xilinx-xadc: Correct temperature
> offset/scale for UltraScale
> > > >     70322a446ef2 iio: adc: xilinx-xadc: Don't clobber preset
> voltage/temperature thresholds
> > > >     3c1312b5d49a iio: exynos-adc: request second interupt only when
> touchscreen mode is used
> > > >     4e14f2d5885f kasan: print the original fault addr when access
> invalid shadow
> > > >     bdfa4fa7588d i40e: Fix wrong check for I40E_TXR_FLAGS_WB_ON_ITR
> > > >     d5c175f4cea6 gtp: fix fragmentation needed check with gso
> > > >     c0dad0c0924c gtp: uapi: fix GTPA_MAX
> > > >     852fb4ce426d tcp: fix wrong RTO timeout when received SACK
> reneging
> > > >     83cfa3b51a78 r8152: Release firmware if we have an error in pro=
be
> > > >     e0f9231ccd6c r8152: Cancel hw_phy_work if we have an error in
> probe
> > > >     ff42b0a55659 r8152: Run the unload routine if we have errors
> during probe
> > > >     6fa3b9f9478e r8152: Increase USB control msg timeout to 5000ms
> as per spec
> > > >     76873f2eadc0 net: usb: smsc95xx: Fix uninit-value access in
> smsc95xx_read_reg
> > > >     6afd112c3f95 net: ieee802154: adf7242: Fix some potential buffe=
r
> overflow in adf7242_stats_show()
> > > >     46cd35e4e774 igc: Fix ambiguity in the ethtool advertising
> > > >     49529413eaed neighbour: fix various data-races
> > > >     667554946360 igb: Fix potential memory leak in
> igb_add_ethtool_nfc_entry
> > > >     263421905346 treewide: Spelling fix in comment
> > > >     bc0c4bc119d2 i40e: Fix I40E_FLAG_VF_VLAN_PRUNING value
> > > >     c532c5df01ad r8169: fix the KCSAN reported data race in rtl_rx
> while reading desc->opts1
> > > >     6afb294c88c6 r8169: fix the KCSAN reported data-race in rtl_tx
> while reading TxDescArray[entry].opts1
> > > >     9d7b3838428c r8169: fix the KCSAN reported data-race in rtl_tx(=
)
> while reading tp->cur_tx
> > > >     04dbfa4122e0 firmware/imx-dsp: Fix use_after_free in
> imx_dsp_setup_channels()
> > > >     0d587b86cd0d drm/dp_mst: Fix NULL deref in
> get_mst_branch_device_by_guid_helper()
> > > >     8860f0175e51 vsock/virtio: initialize the_virtio_vsock before
> using VQs
> > > >     762c251c7f5c vsock/virtio: add support for device suspend/resum=
e
> > > >     1e02df6f6907 vsock/virtio: factor our the code to initialize an=
d
> delete VQs
> > > >     15a8cac3c250 drm/i915/pmu: Check if pmu is closed before
> stopping event
> > > >     43bd431a5dd9 nfsd: lock_rename() needs both directories to live
> on the same fs
> > > >     556b68d9b95f mm/migrate: fix do_pages_move for compat pointers
> > > >     c4071c6114de mm/page_alloc: correct start page when guard page
> debug is enabled
> > > >     3a6cee2bfb53 vhost: Allow null msg.size on VHOST_IOTLB_INVALIDA=
TE
> > > >     fbc9a8718f31 virtio-mmio: fix memory leak of vm_dev
> > > >     862a356bc986 virtio_balloon: Fix endless deflation and inflatio=
n
> on arm64
> > > >     41bb770e42bc mcb-lpc: Reallocate memory region to avoid memory
> overlapping
> > > >     f2ac8b2643dd mcb: Return actual parsed size when reading
> chameleon table
> > > >     90918ef995b5 mptcp: more conservative check for zero probes
> > > >     fd2b2dab6f5b tcp: cleanup tcp_remove_empty_skb() use
> > > >     68342755b9b2 tcp: remove dead code from tcp_sendmsg_locked()
> > > >     0f482ad7b1a5 pinctrl: qcom: lpass-lpi: fix concurrent register
> updates
> > > >     51b054f6fe01 ASoC: codecs: wcd938x: fix runtime PM imbalance on
> remove
> > > >     cb34f4e79e54 ASoC: codecs: wcd938x: fix resource leaks on bind
> errors
> > > >     12952a23a5da Linux 5.15.137
> > > >     dff33880d40a xfrm6: fix inet6_dev refcount underflow problem
> > > >     5a9d05a4f1c3 Bluetooth: hci_sock: Correctly bounds check and pa=
d
> HCI_MON_NEW_INDEX name
> > > >     a6df96ee0b45 Bluetooth: hci_sock: fix slab oob read in
> create_monitor_event
> > > >     c08d609fb2b6 phy: mapphone-mdm6600: Fix pinctrl_pm handling for
> sleep pins
> > > >     e1b030b101f6 phy: mapphone-mdm6600: Fix runtime PM for remove
> > > >     59f1095ab58e phy: mapphone-mdm6600: Fix runtime disable on prob=
e
> > > >     b618062c0b13 serial: 8250: omap: Move uart_write() inside PM
> section
> > > >     67f29cd2f851 ASoC: pxa: fix a memory leak in probe()
> > > >     76d04c339508 gpio: vf610: set value before the direction to
> avoid a glitch
> > > >     4b129e3964b3 platform/x86: asus-wmi: Map 0x2a code, Ignore 0x2b
> and 0x2c events
> > > >     e1a058cc2467 platform/x86: asus-wmi: Change ASUS_WMI_BRN_DOWN
> code from 0x20 to 0x2e
> > > >     c6bbe51dcdf3 platform/surface: platform_profile: Propagate erro=
r
> if profile registration fails
> > > >     a73c8d716938 s390/cio: fix a memleak in css_alloc_subchannel
> > > >     c8b6c2df1e7d selftests/ftrace: Add new test case which checks
> non unique symbol
> > > >     3ad81e6affcb s390/pci: fix iommu bitmap allocation
> > > >     71d224acc4d1 perf: Disallow mis-matched inherited group reads
> > > >     5aa89a11a2a6 USB: serial: option: add Fibocom to DELL custom
> modem FM101R-GL
> > > >     8c376d863618 USB: serial: option: add entry for Sierra EM9191
> with new firmware
> > > >     483221216176 USB: serial: option: add Telit LE910C4-WWX 0x1035
> composition
> > > >     e750fb71dc6a nvme-rdma: do not try to stop unallocated queues
> > > >     a9fd6d44abbc nvme-pci: add BOGUS_NID for Intel 0a54 device
> > > >     071382bda1da ACPI: irq: Fix incorrect return value in
> acpi_register_gsi()
> > > >     431a5010bce2 NFSv4.1: fixup use EXCHGID4_FLAG_USE_PNFS_DS for D=
S
> server
> > > >     5762e72ef1b0 pNFS: Fix a hang in nfs4_evict_inode()
> > > >     5a3abee2eee9 Revert "pinctrl: avoid unsafe code pattern in
> find_pinctrl()"
> > > >     24959825377f mmc: core: Capture correct oemid-bits for eMMC car=
ds
> > > >     8041e7b7e7e9 mmc: core: sdio: hold retuning if sdio in 1-bit mo=
de
> > > >     262029c0c58c mmc: mtk-sd: Use readl_poll_timeout_atomic in
> msdc_reset_hw
> > > >     3e363db1c13a mtd: physmap-core: Restore map_rom fallback
> > > >     71823463b1b2 mtd: spinand: micron: correct bitmask for ecc stat=
us
> > > >     a50d2f17d562 mtd: rawnand: arasan: Ensure program page
> operations are successful
> > > >     ae53c92e928c mtd: rawnand: marvell: Ensure program page
> operations are successful
> > > >     c0ca2ab23098 mtd: rawnand: pl353: Ensure program page operation=
s
> are successful
> > > >     a7070628043e mtd: rawnand: qcom: Unmap the right resource upon
> probe failure
> > > >     3f928d1362f7 net: fix ifname in netlink ntf during netns move
> > > >     ac43ec299a6f net: move from strlcpy with unused retval to strsc=
py
> > > >     30e2db403032 net: introduce a function to check if a netdev nam=
e
> is in use
> > > >     38ba5479355b Bluetooth: hci_event: Fix using memcmp when
> comparing keys
> > > >     3b2da6d62b42 net/mlx5: Handle fw tracer change ownership event
> based on MTRC
> > > >     f6e263824539 platform/x86: touchscreen_dmi: Add info for the
> Positivo C4128B
> > > >     ca56d8afe648 HID: multitouch: Add required quirk for Synaptics
> 0xcd7e device
> > > >     ca5bec7ecf26 btrfs: error out when reallocating block for defra=
g
> using a stale transaction
> > > >     2692fd37aaf4 btrfs: error when COWing block from a root that is
> being deleted
> > > >     ef491d9560d9 btrfs: error out when COWing block using a stale
> transaction
> > > >     f89ed0a09673 btrfs: fix some -Wmaybe-uninitialized warnings in
> ioctl.c
> > > >     df486b75feca drm: panel-orientation-quirks: Add quirk for One
> Mix 2S
> > > >     d5ba30ee4f6d ipv4/fib: send notify when delete source address
> routes
> > > >     9d07b7abd277 sky2: Make sure there is at least one frag_addr
> available
> > > >     f652eb4adf27 regulator/core: Revert "fix kobject release warnin=
g
> and memory leak in regulator_register()"
> > > >     aa77b187b1f0 wifi: cfg80211: avoid leaking stack data into trac=
e
> > > >     30a2285a2e18 wifi: mac80211: allow transmitting EAPOL frames
> with tainted key
> > > >     b64eb31a1b53 wifi: cfg80211: Fix 6GHz scan configuration
> > > >     bbec1724519e Bluetooth: hci_core: Fix build warnings
> > > >     02b0e6991838 Bluetooth: Avoid redundant authentication
> > > >     38681af225b6 Bluetooth: btusb: add shutdown function for QCA617=
4
> > > >     e6e9a32c3e60 HID: holtek: fix slab-out-of-bounds Write in
> holtek_kbd_input_event
> > > >     06aabf7715da wifi: iwlwifi: Ensure ack flag is properly cleared=
.
> > > >     6063f6f64fa4 wifi: mwifiex: Sanity check tlv_len and
> tlv_bitmap_len
> > > >     59ebfeb7b319 tracing: relax trace_event_eval_update() execution
> with cond_resched()
> > > >     3d85fb391fa7 ata: libata-eh: Fix compilation warning in
> ata_eh_link_report()
> > > >     89e3cc1b0703 ata: libata-core: Fix compilation warning in
> ata_dev_config_ncq()
> > > >     137c658ea3ce gpio: timberdale: Fix potential deadlock on
> &tgpio->lock
> > > >     68f106c2b2ab overlayfs: set ctime when setting mtime and atime
> > > >     ef3c62e2f0f1 i2c: mux: Avoid potential false error message in
> i2c_mux_add_adapter
> > > >     e2f64f3eebaa btrfs: initialize start_slot in
> btrfs_log_prealloc_extents
> > > >     266dab0ce42d btrfs: return -EUCLEAN for delayed tree ref with a
> ref count not equals to 1
> > > >     bc424f18fbdc fs-writeback: do not requeue a clean inode having
> skipped pages
> > > >     92609823592c ARM: dts: ti: omap: Fix noisy serial with
> overrun-throttle-ms for mapphone
> > > >     3898d8d685ab ksmbd: not allow to open file if delelete on close
> bit is set
> > > >     d3dc26c4fdc2 nfp: flower: avoid rmmod nfp crash issues
> > > >     6c52b1215904 mctp: perform route lookups under a RCU read-side
> lock
> > > >     db3f17e571e8 mctp: Allow local delivery to the null EID
> > > >     29017ab1a539 powerpc/47x: Fix 47x syscall return crash
> > > >     558ee0fafd40 powerpc/32s: Do kuep_lock() and kuep_unlock() in
> assembly
> > > >     d00f4ae3accf powerpc/32s: Remove capability to disable KUEP at
> boottime
> > > >     fcb3f09e8173 drm/atomic-helper: relax unregistered connector
> check
> > > >     403d201d1fd1 perf/x86/lbr: Filter vsyscall addresses
> > > >     419ac18d8808 perf/x86: Move branch classifier
> > > >     030099bc9115 perf: Add irq and exception return branch types
> > > >     ae80d5290c14 iio: adc: ad7192: Correct reference voltage
> > > >     569a126f244b iio: cros_ec: fix an use-after-free in
> cros_ec_sensors_push_data()
> > > >     a9c471892d75 iio: core: introduce
> iio_device_{claim|release}_buffer_mode() APIs
> > > >     eafbb1966152 iio: core: Hide read accesses to
> iio_dev->currentmode
> > > >     919721348c04 iio: Un-inline iio_buffer_enabled()
> > > >     7f74bc91eb00 serial: 8250_omap: Fix errors with
> no_console_suspend
> > > >     d67d831e1dbc serial: 8250: omap: Fix imprecise external abort
> for omap_8250_pm()
> > > >     aff3019b553e selftests/mm: fix awk usage in
> charge_reserved_hugetlb.sh and hugetlb_reparenting_test.sh that may cause
> error
> > > >     4f1d3d1ca500 net: pktgen: Fix interface flags printing
> > > >     8bdf95e29f86 netfilter: nf_tables: revert do not remove element=
s
> if set backend implements .abort
> > > >     cc19daa037f5 netfilter: nf_tables: do not remove elements if se=
t
> backend implements .abort
> > > >     db33720697c8 netfilter: nft_set_rbtree: .deactivate fails if
> element has expired
> > > >     44768cad012c neighbor: tracing: Move pin6 inside CONFIG_IPV6=3D=
y
> section
> > > >     b33179dbf3f2 net/sched: sch_hfsc: upgrade 'rt' to 'sc' when it
> becomes a inner curve
> > > >     0426d7bc17b8 bonding: Return pointer to data after pull on skb
> > > >     66982023d741 net: dsa: bcm_sf2: Fix possible memory leak in
> bcm_sf2_mdio_register()
> > > >     0ea476863ef7 i40e: prevent crash on probe if hw registers have
> invalid values
> > > >     f9202217a6ea net: usb: smsc95xx: Fix an error code in
> smsc95xx_reset()
> > > >     a2ceb30cc1fc ipv4: fib: annotate races around nh->nh_saddr_geni=
d
> and nh->nh_saddr
> > > >     a270aa7a47db tun: prevent negative ifindex
> > > >     9d55719f983d tcp: tsq: relax tcp_small_queue_check() when rtx
> queue contains a single skb
> > > >     8ae344291e38 tcp: fix excessive TLP and RACK timeouts from HZ
> rounding
> > > >     8b6b4ca42a94 net: rfkill: gpio: prevent value glitch during pro=
be
> > > >     4df9ba0d7a82 net: ipv6: fix return value check in
> esp_remove_trailer
> > > >     a9651e66d0bd net: ipv4: fix return value check in
> esp_remove_trailer
> > > >     26a3c734cb8a xfrm: interface: use DEV_STATS_INC()
> > > >     f8bc4b708b11 xfrm: fix a data-race in xfrm_gen_index()
> > > >     b660e58ef72d qed: fix LL2 RX buffer allocation
> > > >     d35f398b88a1 ASoC: codecs: wcd938x: fix unbind tear down order
> > > >     d182d8ed7b7e ASoC: codecs: wcd938x: drop bogus bind error
> handling
> > > >     8d32a6b67e77 ASoC: codecs: wcd938x-sdw: fix runtime PM imbalanc=
e
> on probe errors
> > > >     6df571a6c153 ASoC: codecs: wcd938x-sdw: fix use after free on
> driver unbind
> > > >     36eabe87031f drm/i915: Retry gtt fault when out of fence
> registers
> > > >     34f62612be2a nvmet-tcp: Fix a possible UAF in queue
> intialization setup
> > > >     04e0eef74b8f netfilter: nft_payload: fix wrong mac header
> matching
> > > >     efe43d1bcbcb fs/ntfs3: fix deadlock in mark_as_free_ex
> > > >     ab40c7ab7a93 fs/ntfs3: fix panic about slab-out-of-bounds cause=
d
> by ntfs_list_ea()
> > > >     24badb9dd8b8 fs/ntfs3: Fix possible null-pointer dereference in
> hdr_find_e()
> > > >     ff38d2a705e1 tcp: check mptcp-level constraints for backlog
> coalescing
> > > >     582f7993353c x86/sev: Check for user-space IOIO pointing to
> kernel space
> > > >     5c2c01be809d x86/sev: Check IOBM for IOIO exceptions from
> user-space
> > > >     6797c6d09e50 x86/sev: Disable MMIO emulation from user mode
> > > >     0b4e772a6a89 KVM: x86: Mask LVTPC when handling a PMI
> > > >     f61c43be1eb9 regmap: fix NULL deref on lookup
> > > >     ffdc881f6807 nfc: nci: fix possible NULL pointer dereference in
> send_acknowledge()
> > > >     d42aeae14fc4 ice: reset first in crash dump kernels
> > > >     e42cecb513af ice: fix over-shifted variable
> > > >     f6c093b97761 Bluetooth: avoid memcmp() out of bounds warning
> > > >     e5f8b43c9c90 Bluetooth: hci_event: Fix coding style
> > > >     1597c1ed0e7d Bluetooth: vhci: Fix race when opening vhci device
> > > >     1ef071526848 Bluetooth: Fix a refcnt underflow problem for
> hci_conn
> > > >     dd6b62fdd245 Bluetooth: Reject connection with the device which
> has same BD_ADDR
> > > >     848a05c4423f Bluetooth: hci_event: Ignore NULL link key
> > > >     e7a2aa7770d3 xfs: don't expose internal symlink metadata buffer=
s
> to the vfs
> > > >     fe5c6fbc5e4a Documentation: sysctl: align cells in second
> content column
> > > >     1815844652cc lib/Kconfig.debug: do not enable DEBUG_PREEMPT by
> default
> > > >     00c03985402e Linux 5.15.136
> > > >     5266b5b6e975 eth: remove remaining copies of the
> NAPI_POLL_WEIGHT define
> > > >     528f0ba9f7a4 usb: hub: Guard against accesses to uninitialized
> BOS descriptors
> > > >     542a3f1a3cc1 Revert "kernel/sched: Modify initial boot task idl=
e
> setup"
> > > >     737ce5518a9c arm64: armv8_deprecated: fix unused-function error
> > > >     2e10931e2d77 arm64: armv8_deprecated: rework deprected
> instruction handling
> > > >     abd4aa081905 arm64: armv8_deprecated: move aarch32 helper earli=
er
> > > >     f10abdb04c3d arm64: armv8_deprecated move emulation functions
> > > >     0b4eec015fa5 arm64: armv8_deprecated: fold ops into
> insn_emulation
> > > >     a8d2910be6f8 arm64: rework EL0 MRS emulation
> > > >     057f9123b1a8 arm64: factor insn read out of call_undef_hook()
> > > >     3f82927cabaf arm64: factor out EL1 SSBS emulation hook
> > > >     474385adcd84 arm64: split EL0/EL1 UNDEF handlers
> > > >     de0358635401 arm64: allow kprobes on EL0 handlers
> > > >     7154e2db8890 arm64: rework BTI exception handling
> > > >     cd5ceadc2b37 arm64: rework FPAC exception handling
> > > >     b6358002fd0c arm64: consistently pass ESR_ELx to die()
> > > >     7ddb1ef2bb42 arm64: die(): pass 'err' as long
> > > >     9a3e177ef570 arm64: report EL1 UNDEFs better
> > > >     d6808be3ff94 powerpc/64e: Fix wrong test in
> __ptep_test_and_clear_young()
> > > >     9c0dc3e2c996 powerpc/8xx: Fix pte_access_permitted() for
> PAGE_NONE
> > > >     4da05eba66e6 dmaengine: mediatek: Fix deadlock caused by
> synchronize_irq()
> > > >     82f61b2d5187 dmaengine: idxd: use spin_lock_irqsave before
> wait_event_lock_irq
> > > >     ecba5afe86f3 x86/alternatives: Disable KASAN in
> apply_alternatives()
> > > >     cbd2aac00498 usb: cdnsp: Fixes issue with dequeuing not queued
> requests
> > > >     7014807fb7ef usb: gadget: ncm: Handle decoding of multiple NTB'=
s
> in unwrap call
> > > >     50259cf71a1b usb: gadget: udc-xilinx: replace memcpy with
> memcpy_toio
> > > >     308f19249641 counter: microchip-tcb-capture: Fix the use of
> internal GCLK logic
> > > >     5a6ce81d7c16 pinctrl: avoid unsafe code pattern in find_pinctrl=
()
> > > >     1c790191cab4 cgroup: Remove duplicates in cgroup v1 tasks file
> > > >     1680c82929bc tee: amdtee: fix use-after-free vulnerability in
> amdtee_close_session
> > > >     b8ec40a90acd Input: goodix - ensure int GPIO is in input for
> gpio_count =3D=3D 1 && gpio_int_idx =3D=3D 0 case
> > > >     d092630e8a20 Input: i8042 - add Fujitsu Lifebook E5411 to i8042
> quirk table
> > > >     7cea6fa2d73f Input: xpad - add PXN V900 support
> > > >     6ff4e50e2d2a Input: psmouse - fix fast_reconnect function for
> PS/2 mode
> > > >     6a4a39638640 Input: powermate - fix use-after-free in
> powermate_config_complete
> > > >     6ad7f52d8c58 ceph: fix type promotion bug on 32bit systems
> > > >     c0c4acd53a98 ceph: fix incorrect revoked caps assert in
> ceph_fill_file_size()
> > > >     58f0e6324ec7 libceph: use kernel_connect()
> > > >     d727b97f8f2e thunderbolt: Check that lane 1 is in CL0 before
> enabling lane bonding
> > > >     04c38bedd07c thunderbolt: Workaround an IOMMU fault on certain
> systems with Intel Maple Ridge
> > > >     a586742a3780 mcb: remove is_added flag from mcb_device struct
> > > >     4382d1a996e5 x86/cpu: Fix AMD erratum #1485 on Zen4-based CPUs
> > > >     763167003a80 ACPI: resource: Skip IRQ override on ASUS
> ExpertBook B1402CBA
> > > >     510d4a01d84c drm/amd/display: Don't set dpms_off for seamless
> boot
> > > >     9cb61ab9f4ca drm/amdgpu: add missing NULL check
> > > >     f9a1af37b801 iio: pressure: ms5611: ms5611_prom_is_valid false
> negative bug
> > > >     09b8ed9547f1 iio: pressure: dps310: Adjust Timeout Settings
> > > >     4c80ecef859d iio: pressure: bmp280: Fix NULL pointer exception
> > > >     a625de7e5464 usb: musb: Modify the "HWVers" register address
> > > >     eb28694f6da8 usb: musb: Get the musb_qh poniter after
> musb_giveback
> > > >     ee88141873a8 usb: cdns3: Modify the return value of
> cdns_set_active () to void when CONFIG_PM_SLEEP is disabled
> > > >     3b2dbc4f3302 usb: dwc3: Soft reset phy on probe for host
> > > >     42c56e015653 net: usb: dm9601: fix uninitialized variable use i=
n
> dm9601_mdio_read
> > > >     524f45361789 usb: xhci: xhci-ring: Use sysdev for mapping bounc=
e
> buffer
> > > >     1d8e7fe85528 xhci: Keep interrupt disabled in initialization
> until host is running.
> > > >     cb34e3b25c37 dmaengine: stm32-mdma: abort resume if no ongoing
> transfer
> > > >     d56dbfe750a8 media: mtk-jpeg: Fix use after free bug due to
> uncanceled work
> > > >     5e13e69ddf0d net: release reference to inet6_dev pointer
> > > >     aade10d51ddc net: change accept_ra_min_rtr_lft to affect all RA
> lifetimes
> > > >     8f12d2d66cba net: add sysctl accept_ra_min_rtr_lft
> > > >     bc9f6cbeb999 workqueue: Override implicit ordered attribute in
> workqueue_apply_unbound_cpumask()
> > > >     25dd54b95abf nfc: nci: assert requested protocol is valid
> > > >     b2bb3b43b94a pinctrl: renesas: rzn1: Enable missing PINMUX
> > > >     c4140dd77c3b net/smc: Fix pos miscalculation in statistics
> > > >     d888d3f70b0d net: nfc: fix races in nfc_llcp_sock_get() and
> nfc_llcp_sock_get_sn()
> > > >     249a1fdb95d5 net/mlx5e: Again mutually exclude RX-FCS and
> RX-port-timestamp
> > > >     2112cacb38aa ixgbe: fix crash with empty VF macvlan list
> > > >     935a15334d77 net: phy: mscc: macsec: reject PN update requests
> > > >     667fe9101a3a net: macsec: indicate next pn update when offloadi=
ng
> > > >     2dcb31e65d26 bpf: Fix verifier log for async callback return
> values
> > > >     6a217af2c67f drm/vmwgfx: fix typo of sizeof argument
> > > >     72ef70886556 riscv, bpf: Sign-extend return values
> > > >     7795592e0818 riscv, bpf: Factor out emit_call for kernel and bp=
f
> context
> > > >     58941cc742ca xen-netback: use default TX queue size for vifs
> > > >     cffdced18af8 eth: remove copies of the NAPI_POLL_WEIGHT define
> > > >     5c360eec5332 mlxsw: fix mlxsw_sp2_nve_vxlan_learning_set()
> return type
> > > >     84c6aa0ae5c4 ieee802154: ca8210: Fix a potential UAF in
> ca8210_probe
> > > >     616761cf9df9 ravb: Fix use-after-free issue in
> ravb_tx_timeout_work()
> > > >     30ebd4177593 ravb: Fix up dma_free_coherent() call in
> ravb_remove()
> > > >     3f39de2bd1d2 drm/msm/dpu: change _dpu_plane_calc_bw() to use u6=
4
> to avoid overflow
> > > >     85ae07d4dcc6 drm/msm/dsi: fix irq_of_parse_and_map() error
> checking
> > > >     9a890c7d4d0f drm/msm/dsi: skip the wait for video mode done if
> not applicable
> > > >     b9de60b6830c drm/msm/dp: do not reinitialize phy unless retry
> during link training
> > > >     afe5f596b588 KEYS: trusted: Remove redundant static calls usage
> > > >     20e73ece06b3 KEYS: trusted: allow use of kernel RNG for key
> material
> > > >     a01d68b6c666 ALSA: usb-audio: Fix microphone sound on Opencomm2
> Headset
> > > >     5b5e58299eac net: prevent address rewrite in kernel_bind()
> > > >     56e96b38d2f7 quota: Fix slow quotaoff
> > > >     28ddc1e0b898 HID: logitech-hidpp: Fix kernel crash on receiver
> USB disconnect
> > > >     b930f0f7bbc2 lib/test_meminit: fix off-by-one error in
> test_pages()
> > > >     982bd86fd659 platform/x86: hp-wmi:: Mark driver struct with
> __refdata to prevent section mismatch warning
> > > >     124cf0ea4b82 platform/x86: think-lmi: Fix reference leak
> > > >     3d2a16f878f0 of: overlay: Reorder struct fragment fields
> kerneldoc
> > > >     10f4a0b6657e perf/arm-cmn: Fix the unhandled overflow status of
> counter 4 to 7
> > > >     b7966e2191d0 RDMA/cxgb4: Check skb value for failure to allocat=
e
> > > >     b9bdffb3f9aa RDMA/srp: Do not call scsi_done() from srp_abort()
> > > >     7d4999589ebc scsi: ib_srp: Call scsi_done() directly
> > > >     d2746cdfd5e5 scsi: core: Rename scsi_mq_done() into scsi_done()
> and export it
> > > >     8f2350e204da scsi: core: Use a structure member to track the
> SCSI command submitter
> > > >     29298c85a81a iommu/vt-d: Avoid memory allocation in
> iommu_suspend()
> > > >     02e21884dcf2 Linux 5.15.135
> > > >     c8af81a9d36e xen/events: replace evtchn_rwlock with RCU
> > > >     c346494ec7f1 parisc: Restore __ldcw_align for PA-RISC 2.0
> processors
> > > >     694e13732e83 ksmbd: fix uaf in smb20_oplock_break_ack
> > > >     e914c3a47e45 RDMA/mlx5: Fix NULL string error
> > > >     81b7bf367eea RDMA/siw: Fix connection failure handling
> > > >     5d8bd138204f RDMA/uverbs: Fix typo of sizeof argument
> > > >     60c9ed88526d RDMA/cma: Fix truncation compilation warning in
> make_cma_ports
> > > >     7f6136ced1b8 RDMA/cma: Initialize ib_sa_multicast structure to =
0
> when join
> > > >     1dd6095fc727 gpio: pxa: disable pinctrl calls for MMP_GPIO
> > > >     844fcf4c697c gpio: aspeed: fix the GPIO number passed to
> pinctrl_gpio_set_config()
> > > >     1878d6666c32 IB/mlx4: Fix the size of a buffer in
> add_port_entries()
> > > >     718d9b44afca of: dynamic: Fix potential memory leak in
> of_changeset_action()
> > > >     e0878f38b661 RDMA/core: Require admin capabilities to set syste=
m
> parameters
> > > >     18a839064fc6 dm zoned: free dmz->ddev array in
> dmz_put_zoned_devices
> > > >     8781fe259dd5 HID: intel-ish-hid: ipc: Disable and reenable ACPI
> GPE bit
> > > >     949ccc91c35b HID: sony: remove duplicate NULL check before
> calling usb_free_urb()
> > > >     a02c02adc2bd sctp: update hb timer immediately after users
> change hb_interval
> > > >     7783b471bfce sctp: update transport state when processing a
> dupcook packet
> > > >     1abac613c0d5 tcp: fix delayed ACKs for MSS boundary condition
> > > >     821b3b00bc0f tcp: fix quick-ack counting to count actual ACKs o=
f
> new data
> > > >     24fb22bddb71 tipc: fix a potential deadlock on &tx->lock
> > > >     2e53585e233c net: stmmac: dwmac-stm32: fix resume on STM32 MCU
> > > >     74e569324050 ipv4: Set offload_failed flag in fibmatch results
> > > >     a4b9bbd1d12f netfilter: nf_tables: nft_set_rbtree: fix spurious
> insertion failure
> > > >     88497f74d684 netfilter: handle the connecting collision properl=
y
> in nf_conntrack_proto_sctp
> > > >     0c9cf5e8807f ibmveth: Remove condition to recompute TCP header
> checksum.
> > > >     5a899e2ce848 net: ethernet: ti: am65-cpsw: Fix error code in
> am65_cpsw_nuss_init_tx_chns()
> > > >     4837a192f6d0 net: nfc: llcp: Add lock when modifying device lis=
t
> > > >     cda10784a176 net: usb: smsc75xx: Fix uninit-value access in
> __smsc75xx_read_reg
> > > >     2801a1ddb26d net: dsa: mv88e6xxx: Avoid EEPROM timeout when
> EEPROM is absent
> > > >     cb145e6c2070 ptp: ocp: Fix error handling in ptp_ocp_device_ini=
t
> > > >     cd1189956393 ipv4, ipv6: Fix handling of transhdrlen in
> __ip{,6}_append_data()
> > > >     147d89ee4143 net: fix possible store tearing in
> neigh_periodic_work()
> > > >     bdb4fcf18e16 modpost: add missing else to the "of" check
> > > >     bc8b89b69638 bpf, sockmap: Reject sk_msg egress redirects to
> non-TCP sockets
> > > >     9fb4dfb8e212 NFSv4: Fix a nfs4_state_manager() race
> > > >     fcdd79fda38a ima: rework CONFIG_IMA dependency block
> > > >     b67adca1e1be scsi: target: core: Fix deadlock due to recursive
> locking
> > > >     9a103e0b100c ima: Finish deprecation of IMA_TRUSTED_KEYRING
> Kconfig
> > > >     bb6aee0696c6 regmap: rbtree: Fix wrong register marked as
> in-cache when creating new node
> > > >     0cee8c1b3af3 wifi: mt76: mt76x02: fix MT76x0 external LNA gain
> handling
> > > >     3f6fbbccba2d drivers/net: process the result of hdlc_open() and
> add call of hdlc_close() in uhdlc_close()
> > > >     ebad2e4c4847 bpf: Fix tr dereferencing
> > > >     5afb996349cb wifi: mwifiex: Fix oob check condition in
> mwifiex_process_rx_packet
> > > >     7c8faa310803 wifi: iwlwifi: mvm: Fix a memory corruption issue
> > > >     5db7af530ebd iwlwifi: avoid void pointer arithmetic
> > > >     6ff75f524dae wifi: iwlwifi: dbg_ini: fix structure packing
> > > >     0ea2a6349733 ubi: Refuse attaching if mtd's erasesize is 0
> > > >     bb0707fde749 HID: sony: Fix a potential memory leak in
> sony_probe()
> > > >     8afbacf61919 arm64: Add Cortex-A520 CPU part definition
> > > >     0da6d21ba235 drm/amd: Fix detection of _PR3 on the PCIe root po=
rt
> > > >     1ad7ccd45a65 net: prevent rewrite of msg_name in sock_sendmsg()
> > > >     0fb3df94274b net: replace calls to sock->ops->connect() with
> kernel_connect()
> > > >     37b54e8acea5 wifi: mwifiex: Fix tlv_buf_left calculation
> > > >     e80f55d6d2a9 qed/red_ll2: Fix undefined behavior bug in struct
> qed_ll2_info
> > > >     1e69422efcc6 vringh: don't use vringh_kiov_advance() in
> vringh_iov_xfer()
> > > >     4e2f83952b1d scsi: zfcp: Fix a double put in zfcp_port_enqueue(=
)
> > > >     310bca649b30 Revert "clk: imx: pll14xx: dynamically configure
> PLL for 393216000/361267200Hz"
> > > >     3f59e63568ad block: fix use-after-free of q->q_usage_counter
> > > >     b75b017b3f37 rbd: take header_rwsem in rbd_dev_refresh() only
> when updating
> > > >     33229d783466 rbd: decouple parent info read-in from updating
> rbd_dev
> > > >     ab73e7ed79d3 rbd: decouple header read-in from updating
> rbd_dev->header
> > > >     b4ddad3fb0ea rbd: move rbd_dev_refresh() definition
> > > >     bb1fae816c90 iommu/arm-smmu-v3: Avoid constructing invalid rang=
e
> commands
> > > >     c4edc7b5c836 iommu/arm-smmu-v3: Set TTL invalidation hint bette=
r
> > > >     a98ad3adf60d arm64: Avoid repeated AA64MMFR1_EL1 register read
> on pagefault path
> > > >     aad6ba1715ec ring-buffer: Fix bytes info in per_cpu buffer stat=
s
> > > >     8012d0b05158 ring-buffer: remove obsolete comment for
> free_buffer_page()
> > > >     65a218ca516e NFSv4: Fix a state manager thread deadlock
> regression
> > > >     8454a2f5e930 NFS: rename nfs_client_kset to nfs_kset
> > > >     f8b0b6a8e196 NFS: Cleanup unused rpc_clnt variable
> > > >     686746be7bfb ASoC: tegra: Fix redundant PLLA and PLLA_OUT0
> updates
> > > >     0a210e63844b ASoC: soc-utils: Export snd_soc_dai_is_dummy()
> symbol
> > > >     b4f7f1556813 spi: zynqmp-gqspi: fix clock imbalance on probe
> failure
> > > >     e514f897ad66 spi: zynqmp-gqspi: Convert to platform remove
> callback returning void
> > > >     1edcec18cfb7 Linux 5.15.134
> > > >     09a683023785 netfilter: nf_tables: fix kdoc warnings after gc
> rework
> > > >     66cb6d74f5a1 drm/meson: fix memory leak on ->hpd_notify callbac=
k
> > > >     91f1f025b6d9 fs: binfmt_elf_efpic: fix personality for ELF-FDPI=
C
> > > >     1cae7473a6dd ata: libata-sata: increase PMP SRST timeout to 10s
> > > >     e74adc589922 ata: libata-core: Do not register PM operations fo=
r
> SAS ports
> > > >     4cbd55a81965 ata: libata-core: Fix port and device removal
> > > >     ddc525fffb44 ata: libata-core: Fix ata_port_request_pm() lockin=
g
> > > >     2990a195edb5 net: thunderbolt: Fix TCPv6 GSO checksum calculati=
on
> > > >     132a5ae4136b bpf: Fix BTF_ID symbol generation collision in
> tools/
> > > >     58d560e98da5 bpf: Fix BTF_ID symbol generation collision
> > > >     f8673f651bc1 btrfs: properly report 0 avail for very full file
> systems
> > > >     b5d00cd7db66 ring-buffer: Update "shortest_full" in polling
> > > >     00d2cb8066cb proc: nommu: /proc/<pid>/maps: release mmap read
> lock
> > > >     40527ebb3e45 Revert "SUNRPC dont update timeout value on
> connection reset"
> > > >     a2b1d486fb70 io_uring/fs: remove sqe->rw_flags checking from
> LINKAT
> > > >     111fe77cb13f sched/rt: Fix live lock between
> select_fallback_rq() and RT push
> > > >     3569ad59664f kernel/sched: Modify initial boot task idle setup
> > > >     07f78e97676c i2c: i801: unregister tco_pdev in i801_probe()
> error path
> > > >     70df8b9c59bc ata: libata-scsi: ignore reserved bits for REPORT
> SUPPORTED OPERATION CODES
> > > >     a7e0c10a8c33 ALSA: hda: Disable power save for solving pop issu=
e
> on Lenovo ThinkCentre M70q
> > > >     0c5fd85fb01f netfilter: nf_tables: disallow rule removal from
> chain binding
> > > >     3936e8714907 nilfs2: fix potential use after free in
> nilfs_gccache_submit_read_data()
> > > >     2b837f13a818 serial: 8250_port: Check IRQ data before use
> > > >     a48d2bcd23f2 Revert "tty: n_gsm: fix UAF in gsm_cleanup_mux"
> > > >     78e70c6238d2 misc: rtsx: Fix some platforms can not boot and
> move the l1ss judgment to probe
> > > >     f090a8b4d2e3 x86/srso: Add SRSO mitigation for Hygon processors
> > > >     f5a604757aa8 iommu/arm-smmu-v3: Fix soft lockup triggered by
> arm_smmu_mm_invalidate_range
> > > >     efce75bd2dbc Smack:- Use overlay inode label in
> smack_inode_copy_up()
> > > >     0e3450487f99 smack: Retrieve transmuting information in
> smack_inode_getsecurity()
> > > >     3586b3feed1b smack: Record transmuting in smk_transmuted
> > > >     9690ad557d94 nvme-pci: always return an ERR_PTR from
> nvme_pci_alloc_dev
> > > >     3c29c6e8cd7c scsi: qla2xxx: Fix NULL pointer dereference in
> target mode
> > > >     6e5e4223c897 i40e: fix potential NULL pointer dereferencing of
> pf->vf i40e_sync_vsi_filters()
> > > >     aff3994d4bdd watchdog: iTCO_wdt: Set NO_REBOOT if the watchdog
> is not already running
> > > >     83a30e945571 watchdog: iTCO_wdt: No need to stop the timer in
> probe
> > > >     1e8c573f50a7 nvme-pci: do not set the NUMA node of device if it
> has none
> > > >     182d13dadb03 nvme-pci: factor out a nvme_pci_alloc_dev helper
> > > >     af58072e867c nvme-pci: factor the iod mempool creation into a
> helper
> > > >     c8bc44936f2c cgroup: Fix suspicious rcu_dereference_check()
> usage warning
> > > >     ce6b88a5853d sched/cpuacct: Optimize away RCU read lock
> > > >     b1deb155524e perf build: Define YYNOMEM as YYNOABORT for bison =
<
> 3.81
> > > >     86e65ffc4d0f fbdev/sh7760fb: Depend on FB=3Dy
> > > >     4bf0044fe43f ncsi: Propagate carrier gain/loss events to the
> NCSI controller
> > > >     288990ec3580 powerpc/watchpoints: Annotate atomic context in
> more places
> > > >     47a94e87f00c powerpc/watchpoint: Disable pagefaults when gettin=
g
> user instruction
> > > >     7eb09f70d9c2 powerpc/watchpoints: Disable preemption in
> thread_change_pc()
> > > >     134b01a39077 media: vb2: frame_vector.c: replace WARN_ONCE with
> a comment
> > >

--0000000000002501be0613002096
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Mar 6, 2024 at 7:59=E2=80=AFAM Bruce Ash=
field &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, Mar 6, 2=
024 at 10:43=E2=80=AFAM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.c=
om" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM Steve Sakoman &lt;<a href=3D"ma=
ilto:steve@sakoman.com" target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt; Hi Bruce,<br>
&gt; &gt;<br>
&gt; &gt; The 5.10 version bumps look fine in testing, but sadly this 5.15<=
br>
&gt; &gt; version bump breaks qemux86-64-ptest:<br>
&gt; &gt;<br>
&gt; &gt; AssertionError: Failed ptests:<br>
&gt; &gt; {&#39;parted&#39;: [&#39;t1104-remove-and-add-partition.sh&#39;,<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;t8000-loop.sh=
&#39;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;t8001-loop-bl=
kpg.sh&#39;]}<br>
&gt; &gt;<br>
&gt; &gt; Failure is reproducible 100% of the time, so there is that ...<br=
>
&gt;<br>
&gt; After=C2=A0 wading through the hundreds of changes in this version bum=
p<br>
&gt; from 5.15.124 to 5.15.141 I found this in the 5.13.132 portion that<br=
>
&gt; looks suspicious:<br>
&gt;<br>
&gt; 072cd213c64f block: don&#39;t add or resize partition on the disk with=
<br>
&gt; GENHD_FL_NO_PART<br>
&gt; c6ce1c5dd327 block: rename GENHD_FL_NO_PART_SCAN to GENHD_FL_NO_PART<b=
r>
&gt;<br>
<br>
It could very well be that, I haven&#39;t been able to get to any local<br>
testing on this<br>
yet.<br>
<br>
I will go look at parted for commits that indicate they are fixing a<br>
kernel interface<br>
that sounds similar .. since we don&#39;t want to revert an offending commi=
t, the<br>
way to fix this is via selective update of parted.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I hope the parte=
d change would be backward compatible otherwise we will be breaking all the=
 kernels which do not have this commit except Linux-yocto=C2=A0</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Bruce<br>
<br>
&gt; Thoughts?<br>
&gt;<br>
&gt; Steve<br>
&gt;<br>
&gt; &gt; On Mon, Dec 4, 2023 at 6:40=E2=80=AFPM &lt;<a href=3D"mailto:bruc=
e.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wr=
ote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Updating=C2=A0 to the latest korg -stable release that compr=
ises<br>
&gt; &gt; &gt; the following commits:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09b91d36ba301 Linux 5.15.141<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0313a34d1c0ee io_uring: fix off-by one bve=
c index<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A049ae2e4e8ed3 USB: dwc3: qcom: fix wakeup =
after probe deferral<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb17fb4b160a USB: dwc3: qcom: fix softwar=
e node leak on probe errors<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A098f0e9b6276f usb: dwc3: set the dma max_s=
eg_size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01a3dcb1d811d usb: dwc3: Fix default mode =
initialization<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a22702a81844 USB: dwc2: write HCINT with =
INTMASK applied<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01134fde92088 usb: typec: tcpm: Skip hard =
reset when in error recovery<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A064830d041515 USB: serial: option: don&#39=
;t claim interface 4 for ZTE MF290<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09611cbc6a132 USB: serial: option: fix FM1=
01R-GL defines<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8d80b1fbacf USB: serial: option: add Fib=
ocom L7xx modules<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de8c6fce8d09 usb: cdnsp: Fix deadlock iss=
ue during using NCM gadget<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dd0cc4b69f7d bcache: fixup lock c-&gt;roo=
t error<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a912742d8411 bcache: fixup init dirty dat=
a errors<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0137660f84462 bcache: prevent potential di=
vision by zero error<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f7077ce8d97b bcache: check return value f=
rom btree_node_alloc_replacement()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01eed01092101 dm-delay: fix a race between=
 delay_presuspend and delay_bio<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d181a7a1d55d hv_netvsc: Mark VF as slave =
before exposing it to user-mode<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A097683466e24c hv_netvsc: Fix race of regis=
ter_netdevice_notifier and VF register<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03841921018a2 USB: serial: option: add Lua=
t Air72*U series products<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06062c527d040 s390/dasd: protect device qu=
eue against concurrent access<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A035b5d86e43ec io_uring/fs: consider link-&=
gt;flags when getting path for LINKAT<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02bb75a2c3490 bcache: fixup multi-threaded=
 bch_sectors_dirty_init() wake-up race<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06f09318fd90a md: fix bi_status reporting =
in md_end_clone_io<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072ecb9753cbe bcache: replace a mistaken I=
S_ERR() by IS_ERR_OR_NULL() in btree_gc_coalesce()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e09ba90f1ad0 swiotlb-xen: provide the &qu=
ot;max_mapping_size&quot; method<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00f05021e937c ACPI: resource: Skip IRQ ove=
rride on ASUS ExpertBook B1402CVA<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f95e9f7afe86 proc: sysctl: prevent aliase=
d sysctls from getting passed to init<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f3880fc011c ext4: make sure allocate pen=
ding entry not fail<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e33eb4997585 ext4: fix slab-use-after-fre=
e in ext4_es_insert_extent()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0859893f61906 ext4: using nofail prealloca=
tion in ext4_es_insert_extent()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0048e7f38b31c ext4: using nofail prealloca=
tion in ext4_es_insert_delayed_block()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0580b9dd6ab0b ext4: using nofail prealloca=
tion in ext4_es_remove_extent()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066bc78a295b3 ext4: use pre-allocated es i=
n __es_remove_extent()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b1995ba6269c ext4: use pre-allocated es i=
n __es_insert_extent()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0edec12712ae1 ext4: factor out __es_alloc_=
extent() and __es_free_extent()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e82d05cf5ccb ext4: add a new helper to ch=
eck if es must be kept<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0612edd488872 media: qcom: camss: Fix csid=
-gen2 for test pattern generator<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ceb5276d8c99 media: qcom: camss: Fix set =
CSI2_RX_CFG1_VC_MODE when VC is greater than 3<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f001e6f62693 media: camss: sm8250: Virtua=
l channels for CSID<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09fb81ca7aa05 media: camss: Replace hard c=
oded value with parameter<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08ef9b32f20ab MIPS: KVM: Fix a build warni=
ng about variable set but not used<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ddaca6b20f7 lockdep: Fix block chain cor=
ruption<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A061747778a88b USB: dwc3: qcom: fix ACPI pl=
atform device leak<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0027472889970 USB: dwc3: qcom: fix resourc=
e leaks on probe deferral<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e26c6febac43 nvmet: nul-terminate the NQN=
s passed in the connect command<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b5d50c6a609d afs: Fix file locking on R/O=
 volumes to operate in local mode<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A084ebfbed3ae0 afs: Return ENOENT if no cel=
l DNS record can be found<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06aeac88a45de net: axienet: Fix check for =
partial TX checksum<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0293acba84108 amd-xgbe: propagate the corr=
ect speed and duplex status<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3874cc25a70 amd-xgbe: handle the corner-=
case during tx completion<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e949dbc28cd5 amd-xgbe: handle corner-case=
 during sfp hotplug<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A001a8b94726b1 octeontx2-pf: Fix ntuple rul=
e creation to direct packet to VF with higher Rx queue than its PF<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fcc4a03ad3b1 arm/xen: fix xen_vcpu_info a=
llocation alignment<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A090072af9efe8 net/smc: avoid data corrupti=
on caused by decline<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066c023469b3e net: usb: ax88179_178a: fix =
failed operations during ax88179_reset<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ba81c5228ef8 ipv4: Correct/silence an end=
ian warning in __ip_do_redirect<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0364406d4c114 HID: fix HID device resource=
 race between HID core and debugging support<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A052badc06b119 HID: core: store the unique =
system identifier in hid_device<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0221be624a55d drm/rockchip: vop: Fix color=
 for RGB888/BGR888 format on VOP full<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0c835fd7d89 ata: pata_isapnp: Add missin=
g error check for devm_ioport_map()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09754a498aa5b octeontx2-pf: Fix memory lea=
k during interface down<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be41c0c4a632 wireguard: use DEV_STATS_INC=
()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f163a6d17a95 drm/panel: simple: Fix Innol=
ux G101ICE-L01 timings<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0608de3a587eb drm/panel: simple: Fix Innol=
ux G101ICE-L01 bus flags<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A018bd108a13cb drm/panel: auo,b101uan08.3: =
Fine tune the panel power sequence<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09fe5718d3f09 drm/panel: boe-tv101wum-nl6:=
 Fine tune the panel power sequence<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8a49336e1de afs: Make error on cell look=
up failure consistent with OpenAFS<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ac239fccf5a5 afs: Fix afs_server_list to =
be cleaned up with RCU<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a78d278e01b1 Linux 5.15.140<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0947c9e12ddd6 driver core: Release all res=
ources during unbind before updating device links<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a434d5c3823 Input: xpad - add VID for Tu=
rtle Beach controllers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cbc7c29dff0f tracing: Have trace_event_fi=
le have ref counters<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01dcf90c9fa01 powerpc/powernv: Fix fortify=
 source warnings in opal-prd.c<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03d7912710e5e io_uring/fdinfo: lock SQ thr=
ead while retrieving thread cpu/pid<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0595b051c83a1 drm/amd/display: Change the =
DMCUB mailbox memory location from FB to inbox<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2a6e97c4b33 drm/amdgpu: fix error handli=
ng in amdgpu_bo_list_get()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e380992c479b drm/amdgpu: don&#39;t use AT=
RM for external devices<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04ff985b8810c drm/i915: Fix potential spec=
tre vulnerability<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea0c4d5ec57f drm/amd/pm: Handle non-termi=
nated overdrive commands.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09ce842d7762a ext4: add missed brelse in u=
pdate_backups<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ce19c20064b6 ext4: remove gdb backup copy=
 for meta bg in setup_new_flex_group_blocks<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ac45d8e34bed ext4: correct the start bloc=
k of counting reserved clusters<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f9842c4b925 ext4: correct return value o=
f ext4_convert_meta_bg<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08798d3b2722d ext4: correct offset of gdb =
backup in non meta_bg group to update_backups<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08a3bb38bfdaf ext4: apply umask if ACL sup=
port is disabled<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d5c380149b96 Revert &quot;net: r8169: Dis=
able multicast filter for RTL8168H and RTL8107E&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ad3d8594d5e media: qcom: camss: Fix miss=
ing vfe_lite clocks check<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0376cf06950 media: qcom: camss: Fix VFE-=
17x vfe_disable_output()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f733387d17f media: qcom: camss: Fix vfe_=
get() error jump<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0841fc648fbb5 media: qcom: camss: Fix pm_d=
omain_on sequence in probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04c9c43f79a12 mmc: sdhci-pci-gli: GL9750: =
Mask the replay timer timeout of AER<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072bf271c5a77 r8169: fix network lost afte=
r resume on DASH systems<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0468e3ebf4786 mm: kmem: drop __GFP_NOFAIL =
when allocating objcg vectors<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00387978fda07 mmc: sdhci-pci-gli: A workar=
ound to allow GL9750 to enter ASPM L1.2<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0070b3ccb9b8b riscv: kprobes: allow writin=
g to x0<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd0e9f475a46 nfsd: fix file memleak on cl=
ient_opens_release<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0114c9d732cf9 media: ccs: Correctly initia=
lise try compose rectangle<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c8aeeb2c549 media: venus: hfi: add check=
s to handle capabilities from firmware<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cdeb0a4cf327 media: venus: hfi: fix the c=
heck to handle session buffer requirement<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d62570f75fe media: venus: hfi_parser: Ad=
d check to keep the number of codecs within range<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d0d831e7d68d media: sharp: fix sharp enco=
ding<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06003733c8f95 media: lirc: drop trailing s=
pace from scancode transmit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e4088d7d8f11 f2fs: avoid format-overflow =
warning<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A012055238d046 i2c: i801: fix potential rac=
e in i801_block_transaction_byte_by_byte<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0336e6db5c120 net: phylink: initialize car=
rier state at creation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d8cb287d31cb net: dsa: lan9303: consequen=
tly nested-lock physical MDIO<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0656262cb0f95 net: ethtool: Fix documentat=
ion of ethtool_sprintf()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0acca20cc16f3 s390/ap: fix AP bus crash on=
 early config change callback invocation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0019b7d42a416 i2c: designware: Disable TX_=
EMPTY irq while waiting for block length byte<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c6e89348fd58 sbsa_gwdt: Calculate timeout=
 with 64-bit math<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0132670ae9ffb lsm: fix default return valu=
e for inode_getsecctx<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0223196b50605 lsm: fix default return valu=
e for vm_enough_memory<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A006d320ca170b Revert &quot;i2c: pxa: move =
to generic GPIO recovery&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ddec3d04f874 Revert ncsi: Propagate carri=
er gain/loss events to the NCSI controller<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ad0b74d0f331 powerpc/pseries/ddw: simplif=
y enable_ddw()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3e993de400e arm64: dts: qcom: ipq6018: F=
ix tcsr_mutex register size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b99ac20612ca arm64: dts: qcom: ipq6018: s=
witch TCSR mutex to MMIO<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aaf0a07d6088 ksmbd: fix slab out of bound=
s write in smb_inherit_dacl()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c701423bb03 Bluetooth: btusb: Add 0bda:b=
85b for Fn-Link RTL8852BE<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A036a573b32550 Bluetooth: btusb: Add RTW885=
2BE device 13d3:3570 to device tables<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4976160a0a4 bluetooth: Add device 13d3:3=
571 to device tables<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0603e77e9e8c0 bluetooth: Add device 0bda:8=
87b to device tables<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9bb966c50a7 Bluetooth: btusb: Add Realte=
k RTL8852BE support ID 0x0cb8:0xc559<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cf642ee641ce cpufreq: stats: Fix buffer o=
verflow detection in trans_stats()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A063e09cdfe948 regmap: Ensure range selecto=
r registers are updated after cache sync<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c49e74e95bf tty: serial: meson: fix hard=
 LOCKUP on crtscts mode<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06f26b6a61b08 serial: meson: Use platform_=
get_irq() to get the interrupt<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0450fa8bf803f ALSA: hda/realtek - Enable i=
nternal speaker of ASUS K6500ZC<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc549ba50bb8 ALSA: hda/realtek - Add Dell=
 ALC295 to pin fall back table<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0767c988771cb ALSA: info: Fix potential de=
adlock at disconnection<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A009022ae66261 xhci: Enable RPM on controll=
ers that support low-power states<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A068574fe2e488 parisc/pgtable: Do not drop =
upper 5 address bits of physical address<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea7593c18ff7 parisc: Prevent booting 64-b=
it kernels on PA1.x machines<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02c9092e8b29a i3c: master: svc: fix SDA ke=
ep low when polling IBIWON timeout happen<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0da754f92fc02 i3c: master: svc: fix check =
wrong status register in irq handler<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ba77b6b45d6 i3c: master: svc: fix ibi ma=
y not return mandatory data byte<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0a70ed4a580 i3c: master: svc: fix wrong =
data return when IBI happen during start frame<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07383675aba2f i3c: master: svc: fix race c=
ondition in ibi work thread<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc7efd1054f4 i3c: master: cdns: Fix readi=
ng status register<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3c6a08c2b77 mtd: cfi_cmdset_0001: Byte s=
wap OTP info<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a4668088128d mm/memory_hotplug: use pfn m=
ath in place of direct struct page manipulation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0792a796085cf mm/cma: use nth_page() in pl=
ace of direct struct page manipulation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09b59fc31226e s390/cmma: fix detection of =
DAT pages<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A045bb94aab891 dmaengine: stm32-mdma: corre=
ct desc prep when channel running<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A091659b77e937 mcb: fix error handling for =
different scenarios when parsing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0534790fde890 tracing: Have the user copy =
of synthetic event address use correct context<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6237afabc34 i2c: core: Run atomic i2c xf=
er when !preemptible<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0931aa7154bc4 kernel/reboot: emergency_res=
tart: Set correct system_state<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07a3424c3b76a quota: explicitly forbid quo=
ta files from being encrypted<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A047f509832168 jbd2: fix potential data los=
t in recovering journal raced with synchronizing fs bdev<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f13e1ea45699 ASoC: codecs: wsa-macro: fix=
 uninitialized stack variables with name prefix<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028436d8092ad selftests/resctrl: Reduce fa=
ilures due to outliers in MBA/MBM tests<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ce63598a1fb selftests/resctrl: Remove du=
plicate feature check from CMT test<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e90efe17fc07 netfilter: nf_tables: split =
async and sync catchall in two functions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d9506c766c9 netfilter: nf_tables: remove=
 catchall element in GC sync path<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A096fc7a50a278 PCI: keystone: Don&#39;t dis=
card .probe() callback<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0d394df9812 PCI: keystone: Don&#39;t dis=
card .remove() callback<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f4f12667167c KEYS: trusted: Rollback init=
_trusted() consistently<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c407ff72fb3a genirq/generic_chip: Make ir=
q_remove_generic_chip() irqdomain aware<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc8a14e3c630 mmc: meson-gx: Remove settin=
g of CMD_CFG_ERROR<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a51e6b4da71 wifi: ath11k: fix htt pktlog=
 locking<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0426e718ce9ba wifi: ath11k: fix dfs radar =
event locking<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9d84413b1b7 wifi: ath11k: fix temperatur=
e event locking<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ff849948c11 ima: detect changes to the b=
acking overlay file<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04584a421a6d9 ima: annotate iint mutex to =
avoid lockdep false positive warnings<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04049576c639f ACPI: FPDT: properly handle =
invalid FPDT subtables<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0628e76e684c8 firmware: qcom_scm: use 64-b=
it calling convention only when client is 64-bit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06eb8c191e360 btrfs: don&#39;t arbitrarily=
 slow down delalloc if we&#39;re committing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b99626b28ca rcu: kmemleak: Ignore kmemle=
ak false positives when RCU-freeing objects<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A071f5344f477c PM: hibernate: Clean up sync=
_read handling in snapshot_write_next()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A057dbc0eb8abe PM: hibernate: Use __get_saf=
e_page() rather than touching the list<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A087a30633b5d3 arm64: dts: qcom: ipq6018: F=
ix hwlock index for SMEM<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ebaee06a7292 rcu/tree: Defer setting of j=
iffies during stall reset<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0057d1034d012 svcrdma: Drop connection aft=
er an RDMA Read error<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0541b3757fd44 wifi: wilc1000: use vmm_tabl=
e as array in wilc struct<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b156f62f19da PCI: exynos: Don&#39;t disca=
rd .remove() callback<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f88796721002 PCI/ASPM: Fix L1 substate ha=
ndling in aspm_attr_store_common()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0467864d55b52 mmc: sdhci_am654: fix start =
loop index for TAP value parsing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef34a97bb9cb mmc: vub300: fix an error co=
de<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A036adb6204cff clk: qcom: ipq6018: drop the=
 CLK_SET_RATE_PARENT flag from PLL clocks<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0090b167b2c41 clk: qcom: ipq8074: drop the=
 CLK_SET_RATE_PARENT flag from PLL clocks<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A018640a1818f1 clk: socfpga: Fix undefined =
behavior bug in struct stratix10_clock_data<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04d17b54c9be3 parisc/pdc: Add width field =
to struct pdc_model<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0936c9c10efae arm64: Restrict CPU_BIG_ENDI=
AN to GNU as or LLVM IAS 15.x or newer<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08b24bb54bf3a ACPI: resource: Do IRQ overr=
ide on TongFang GMxXGxx<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05619c34d3c4c watchdog: move softlockup_pa=
nic back to early_param<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a6c3a1fe09a2 PCI/sysfs: Protect driver&#3=
9;s D3cold preference from user space<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A001975bee0a14 hvc/xen: fix event channel h=
andling for secondary consoles<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cfd543c10871 hvc/xen: fix error path in x=
en_hvc_init() to always register frontend driver<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0730e08cb9101 hvc/xen: fix console unplug<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fa0b93a3de40 tty/sysrq: replace smp_proce=
ssor_id() with get_cpu()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092e6c0f00d38 audit: don&#39;t WARN_ON_ONC=
E(!current-&gt;mm) in audit_exe_compare()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e29c095f1ad4 audit: don&#39;t take task_l=
ock() in audit_exe_compare() code path<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05eb6519f483e KVM: x86: Ignore MSR_AMD64_T=
W_CFG access<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c49ef7041f2 KVM: x86: hyper-v: Don&#39;t=
 auto-enable stimer on write from user-space<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fe6b461c37cb x86/cpu/hygon: Fix the CPU t=
opology evaluation for real<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a2adf48d8b1 crypto: x86/sha - load modul=
es based on CPU features<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be079aa71a12 scsi: qla2xxx: Fix system cr=
ash due to bad pointer access<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ba3569f78d3 scsi: megaraid_sas: Increase=
 register read retry rount from 3 to 30 for selected registers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06a33b5810031 scsi: mpt3sas: Fix loop logi=
c<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03c5aede46cdc bpf: Fix precision tracking =
for BPF_ALU | BPF_TO_BE | BPF_END<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0403470431b15 bpf: Fix check_stack_write_f=
ixed_off() to correctly spill imm<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ba115f6c3a8c randstruct: Fix gcc-plugin p=
erformance mode to stay in group<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02771fac4382b powerpc/perf: Fix disabling =
BHRB and instruction sampling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07e450cc9ad54 media: venus: hfi: add check=
s to perform sanity on queue pointers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01566e8be73fd i915/perf: Fix NULL deref bu=
gs with drm_dbg() calls<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A035c17257ef09 xfs: Fix unreferenced object=
 reported by kmemleak in xfs_sysfs_init()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05db146322b17 xfs: fix memory leak in xfs_=
errortag_init<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c540284d8488 xfs: fix exception caused by=
 unexpected illegal bestcount in leaf dir<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05212d586e76f xfs: avoid a UAF when log in=
tent item recovery fails<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ba179cc12109 xfs: fix inode reservation s=
pace for removing transaction<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b7847653a2d6 xfs: Fix false ENOSPC when p=
erforming direct write on a delalloc extent in cow fork<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092d38b87e886 xfs: add missing cmap-&gt;br=
_state =3D XFS_EXT_NORM update<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d0baec78e8a xfs: fix intermittent hang d=
uring quotacheck<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076545c0e881b xfs: don&#39;t leak memory w=
hen attr fork loading fails<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb888caf27d9 xfs: fix use-after-free in x=
attr node block inactivation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04cb3842967e6 xfs: flush inode gc workqueu=
e before clearing agi bucket<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0188594c64a1e xfs: prevent a UAF when log =
IO errors race with unmount<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0921c96215850 xfs: use invalidate_lock to =
check the state of mmap_lock<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0efd194800b69 xfs: convert buf_cancel_tabl=
e allocation to kmalloc_array<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0074fee186931 xfs: don&#39;t leak xfs_buf_=
cancel structures when recovery fails<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b8effd31a862 xfs: refactor buffer cancell=
ation table allocation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04968c2aa6a1f cifs: fix check of rc in fun=
ction generate_smb3signingkey<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d725bf0d16d cifs: spnego: add &#39;;&#39=
; in HOST_KEY_LEN<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A021accf149161 tools/power/turbostat: Enabl=
e the C-state Pre-wake printing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00045c1ff7ac0 tools/power/turbostat: Fix a=
 knl bug<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05bcce23f387b macvlan: Don&#39;t propagate=
 promisc change to lower dev in passthru<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07574b5e65e92 net/mlx5e: Check return valu=
e of snprintf writing to fw_version buffer for representors<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A055553c5b53ae net/mlx5e: Reduce the size o=
f icosq_str<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051655fd35703 net/mlx5e: Fix pedit endiann=
ess<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a990dd7410ec net/mlx5e: Refactor mod head=
er management API<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A039f95b1d0d8f net/mlx5e: Move mod hdr allo=
cation to a single place<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0f37a3715cb net/mlx5e: Remove incorrect =
addition of action fwd flag<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06974fd92d5f1 net/mlx5e: fix double free o=
f encap_header in update funcs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f3c4a7044201 net/mlx5e: fix double free o=
f encap_header<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0931e9e8e30bf net: stmmac: fix rx budget l=
imit check<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b8b514b2a6cd netfilter: nf_tables: fix po=
inter math issue in nft_byteorder_eval()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A025da0f582119 netfilter: nf_tables: add an=
d use BE register load-store helpers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a48f6be5bdb7 netfilter: nf_tables: use th=
e correct get/put helpers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d3901bf3baa netfilter: nf_conntrack_brid=
ge: initialize err to 0<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A075bcfc188abf af_unix: fix use-after-free =
in unix_stream_read_actor()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b480c654ef2 net: ethernet: cortina: Fix =
MTU max setting<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0097588e20c6b net: ethernet: cortina: Hand=
le large frames<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9269b274cdf net: ethernet: cortina: Fix =
max RX frame define<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A053064e8239dd bonding: stop the device in =
bond_setup_by_slave()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cda210a4bdf7 ptp: annotate data-race arou=
nd q-&gt;head and q-&gt;tail<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b67d16b2373b xen/events: fix delayed eoi =
list handling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08531a4194e59 ppp: limit MRU to 64K<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09ae82308d184 tipc: Fix kernel-infoleak du=
e to uninitialized TLV value<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0359c65daf6b5 net: hns3: fix VF wrong spee=
d and duplex issue<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0406be003d698 net: hns3: fix VF reset fail=
 issue<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cfc131b078a3 net: hns3: fix variable may =
not initialized problem in hns3_init_mac_addr()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0070581829c1a net: hns3: fix incorrect cap=
ability bit display for copper port<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a3c65cf7854d net: hns3: add barrier in vf=
 mailbox reply process<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e671d8203758 net: hns3: add byte order co=
nversion for PF to VF mailbox message<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb0f14257c04 net: hns3: refine the defini=
tion for struct hclge_pf_to_vf_msg<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01d8f66d4060a net: hns3: fix add VLAN fail=
 issue<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04b3b2541d40e tty: Fix uninit-value access=
 in ppp_sync_receive()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f64cad3ac38 ipvlan: add ipvlan_route_v6_=
outbound() helper<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c71b9b177c6 net: set SOCK_RCU_FREE befor=
e inserting socket into hashtable<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0427165421c25 net: inet: Retire port only =
listening_hash<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be1ceb8b7c58 net: inet: Open code inet_ha=
sh2 and inet_unhash2<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb9bcf47fba7 net: inet: Remove count from=
 inet_listen_hashbucket<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de634368e079 mptcp: listen diag dump supp=
ort<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0870f438aca56 mptcp: diag: switch to conte=
xt structure<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be020f658c63 gfs2: Silence &quot;suspicio=
us RCU usage in gfs2_permission&quot; warning<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0194454afa6aa SUNRPC: Fix RPC client clean=
ed up the freed pipefs dentries<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0319ed0cba164 NFSv4.1: fix SP4_MACH_CRED p=
rotection for pnfs IO<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0809684f5b388 SUNRPC: Add an IS_ERR() chec=
k back to where it was<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A046d6b768072b SUNRPC: ECONNRESET might req=
uire a rebind<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7032d4d6499 media: cec: meson: always in=
clude meson sub-directory in Makefile<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A016e78f28517d media: cadence: csi2rx: Unre=
gister v4l2 async notifier<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020c2ca9abb78 sched/core: Optimize in_task=
() and in_interrupt() a bit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09894c58c1777 tracing/perf: Add interrupt_=
context_level() helper<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A048fef664d7e9 tracing: Reuse logic from pe=
rf&#39;s get_recursion_context()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0670b3e902f62 wifi: iwlwifi: Use FW rate f=
or non-data frames<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7ee519e8095 pwm: Fix double shift bug<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07054366cd076 drm/amdgpu: fix software pci=
_unplug on some chips<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e48a5e78d077 drm/qxl: prevent memory leak=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00835e7f296ca ASoC: ti: omap-mcbsp: Fix ru=
ntime PM underflow warnings<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A038ada2f304f6 i2c: dev: copy userspace arr=
ay safely<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0610244988f32 kgdb: Flush console before e=
ntering kgdb on panic<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04e497f1acd99 drm/amd/display: Avoid NULL =
dereference of timing generator<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05e0b788fb96b media: imon: fix access to i=
nvalid resource for the second interface<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ae6bcafe1f6b media: ccs: Fix driver quirk=
 struct documentation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d01b0ad79ecd media: cobalt: Use FIELD_GET=
() to extract Link Width<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A003ce0655bf8e gfs2: fix an oops in gfs2_pe=
rmission<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05bfda356e903 gfs2: ignore negated quota c=
hanges<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A016631907d013 media: vivid: avoid integer =
overflow<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A009cd8b561aa9 media: gspca: cpia1: shift-o=
ut-of-bounds in set_flicker<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A039c71357e68e i3c: master: mipi-i3c-hci: F=
ix a kernel panic for accessing DAT_data.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072775cad7f57 virtio-blk: fix implicit ove=
rflow on virtio_max_dma_size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f7f3bdb225e3 i2c: sun6i-p2wi: Prevent pot=
ential division by zero<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d23ad76f240c i3c: mipi-i3c-hci: Fix out o=
f bounds access in hci_dma_irq_handler<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e6fbad3cc880 9p: v9fs_listxattr: fix %s n=
ull argument warning<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a18be976be41 9p/trans_fd: Annotate data-r=
acy writes to file::f_flags<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02cc5e191d671 usb: gadget: f_ncm: Always s=
et current gadget in ncm_bind()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c80f48912b5 tty: vcc: Add check for kstr=
dup() in vcc_probe()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02ff61106d6b4 exfat: support handle zero-s=
ize directory<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c86a3007a685 HID: Add quirk for Dell Pro =
Wireless Keyboard and Mouse KM5221W<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03453f945af89 PCI: Use FIELD_GET() in Sapp=
hire RX 5600 XT Pulse quirk<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a93a0f99a09 misc: pci_endpoint_test: Add=
 Device ID for R-Car S4-8 PCIe controller<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A003dbd6a9ea4e PCI: Disable ATS for specifi=
c Intel IPU E2000 devices<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9a0b3444845 PCI: Extract ATS disabling t=
o a helper function<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fe511d24418a PCI: Use FIELD_GET() to extr=
act Link Width<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056d78b5495eb scsi: libfc: Fix potential N=
ULL pointer dereference in fc_lport_ptp_setup()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A037a51e7f36b7 atm: iphase: Do PCI error ch=
ecks on own line<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f05ae00106aa PCI: tegra194: Use FIELD_GET=
()/FIELD_PREP() with Link Width fields<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0631a96e9eb42 ALSA: hda: Fix possible null=
-ptr-deref when assigning a stream<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c805b9cd2e3 ARM: 9320/1: fix stack depot=
 IRQ stack filter<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d25ec69f8f1 HID: lenovo: Detect quirk-fr=
ee fw on cptkbd and stop applying workaround<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A064f062baf202 jfs: fix array-index-out-of-=
bounds in diAlloc<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0da3da5e1e6f7 jfs: fix array-index-out-of-=
bounds in dbFindLeaf<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f74d336990f fs/jfs: Add validity check f=
or db_maxag and db_agpref<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05f148b16972e fs/jfs: Add check for negati=
ve db_l2nbperpage<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1d1f79b1929 scsi: ibmvfc: Remove BUG_ON =
in the case of an empty event pool<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0bfc8a5561f scsi: hisi_sas: Set debugfs_=
dir pointer to NULL after removing debugfs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05904dee70771 RDMA/hfi1: Use FIELD_GET() t=
o extract Link Width<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0546c1796ad1e crypto: pcrypt - Fix hungtas=
k for PADATA_RESET<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc443a199f8c ASoC: soc-card: Add storage =
for PCI SSID<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09f2082067c5f selftests/efivarfs: create-r=
ead: fix a resource leak<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0428cad17f53b arm64: dts: ls208xa: use a p=
seudo-bus to constrain usb dma size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0174f62a0aa15 drm/amdgpu: Fix a null point=
er access when the smc_rreg pointer is NULL<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f7a400d5e80 drm/amdkfd: Fix shift out-of=
-bounds issue<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0300589d551d4 drm/panel: st7703: Pick diff=
erent reset sequence<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eaa03ea366c8 drm/amdgpu/vkms: fix a possi=
ble null pointer dereference<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A084c923d89890 drm/panel/panel-tpo-tpg110: =
fix a possible null pointer dereference<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02381f6b628b3 drm/panel: fix a possible nu=
ll pointer dereference<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c11cf5e117f5 drm/amdgpu: Fix potential nu=
ll pointer derefernce<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a237675aa1e6 drm/amd: Fix UBSAN array-ind=
ex-out-of-bounds for Polaris and Tonga<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0acdb6830de02 drm/amd: Fix UBSAN array-ind=
ex-out-of-bounds for SMU7<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0829ce8e995a8 drm/msm/dp: skip validity ch=
eck for DP CTS EDID checksum<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0689b33b94f09 drm: vmwgfx_surface.c: copy =
user-array safely<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A022260dabcfe3 kernel: watch_queue: copy us=
er-array safely<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4f2c09d4672 kernel: kexec: copy user-arr=
ay safely<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024b17d530c42 string.h: add array-wrappers=
 for (v)memdup_user()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a3a6dc9a330 drm/amd/display: use full up=
date for clip size increase of large plane source<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d43cdd22cd8 drm/amdkfd: Fix a race condi=
tion of vram buffer unref in svm code<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eea81424c5b8 drm/komeda: drop all current=
ly held locks if deadlock happens<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0812886866be6 platform/x86: thinkpad_acpi:=
 Add battery quirk for Thinkpad X120e<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ba7088769800 Bluetooth: Fix double free i=
n hci_conn_cleanup<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9de14bde56d Bluetooth: btusb: Add date-&=
gt;evt_skb is NULL check<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a43cf6acf017 wifi: ath10k: Don&#39;t touc=
h the CE interrupt registers after power up<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06f42bd243327 net: annotate data-races aro=
und sk-&gt;sk_dst_pending_confirm<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A019ab5fd26441 net: annotate data-races aro=
und sk-&gt;sk_tx_queue_mapping<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f3be63f7a8ee wifi: ath10k: fix clang-spec=
ific fortify warning<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A002a0547b8da0 wifi: ath9k: fix clang-speci=
fic fortify warnings<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cf353904a828 bpf: Detect IP =3D=3D ksym.e=
nd as part of BPF program<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c29a89b23f67 atl1c: Work around the DMA R=
X overflow issue<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A021a0f310a9f3 wifi: mac80211: don&#39;t re=
turn unset power in ieee80211_get_tx_power()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03073e38086d0 wifi: mac80211_hwsim: fix cl=
ang-specific fortify warning<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e8e55fa44435 x86/mm: Drop the 4 MB restri=
ction on minimal NUMA node memory size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9d3ba62e87b workqueue: Provide one lock =
class key per work_on_cpu() callsite<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a5b512d526c clocksource/drivers/timer-at=
mel-tcb: Fix initialization on SAM9 hardware<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0465b88c0873b clocksource/drivers/timer-im=
x-gpt: Fix potential memory leak<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd0df3f87192 perf/core: Bail out early if=
 the request AUX area is out of bound<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e89d0ed45a41 locking/ww_mutex/test: Fix p=
otential workqueue corruption<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02a910f4af54d Linux 5.15.139<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03443337acd37 btrfs: use u64 for buffer si=
zes in the tree search ioctls<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9f5e8cecba9 Revert &quot;mmc: core: Capt=
ure correct oemid-bits for eMMC cards&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0824829c2c6b4 tracing/kprobes: Fix the ord=
er of argument descriptions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0560680f745fc fbdev: fsl-diu-fb: mark wr_r=
eg_wa() static<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08e4b510fe917 fbdev: imsttfb: fix a resour=
ce leak in probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03648582181b6 fbdev: imsttfb: Fix error pa=
th of imsttfb_probe()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030959f9f4540 spi: spi-zynq-qspi: add spi-=
mem to driver kconfig dependencies<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09cf044cc36c1 ASoC: hdmi-codec: register h=
pd callback on component probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0705e5a28ec1d drm/syncobj: fix DRM_SYNCOBJ=
_WAIT_FLAGS_WAIT_AVAILABLE<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00ca05fae2790 netfilter: nat: fix ipv6 nat=
 redirect with mapped and scoped addresses<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01652f57f02eb netfilter: nft_redir: use `s=
truct nf_nat_range2` throughout and deduplicate eval call-backs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d28c17abe098 netfilter: xt_recent: fix (i=
ncrease) ipv6 literal buffer length<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f30567fcbc4d i2c: iproc: handle invalid s=
lave state<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A038f5ac54b917 r8169: respect userspace dis=
abling IFF_MULTICAST<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd01115b033c blk-core: use pr_warn_rateli=
mited() in bio_check_ro()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b80148710983 block: remove unneeded retur=
n value of bio_check_ro()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d8d94d6b3bd3 tg3: power down device only =
on SYSTEM_POWER_OFF<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ea06a23f8f4 net/smc: put sk reference if=
 close work was canceled<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0884606f8283c net/smc: allow cdc msg send =
rather than drop it with NULL sndbuf_desc<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a62af7146daa net/smc: fix dangling sock u=
nder state SMC_APPFINCLOSEWAIT<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0866606826f16 selftests: pmtu.sh: fix resu=
lt checking<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02d117ac1b8f8 net: stmmac: xgmac: Enable s=
upport for multiple Flexible PPS outputs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A095a99ac112c5 Fix termination state for id=
r_for_each_entry_ul()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070ef755f126b net: r8169: Disable multicas=
t filter for RTL8168H and RTL8107E<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00dad0e75d62b dccp/tcp: Call security_inet=
_conn_request() after setting IPv6 addresses.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c340713bdf32 dccp: Call security_inet_con=
n_request() after setting IPv4 addresses.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d1b7e6562a4c octeontx2-pf: Fix holes in e=
rror code<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f60297ef59d4 octeontx2-pf: Fix error code=
s<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0794d360b1d65 inet: shrink struct flowi_co=
mmon<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08943083bbb64 bpf: Check map-&gt;usercnt a=
fter timer-&gt;timer is assigned<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03907b89cd17f tipc: Change nla_policy for =
bearer-related names to NLA_NUL_STRING<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a1a485e45d24 hsr: Prevent use after free =
in prp_create_tagged_frame()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0352887b3edd0 llc: verify mac len before r=
eading mac header<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0303766bb92c5 Input: synaptics-rmi4 - fix =
use after free in rmi_unregister_function()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0741e4c15d7c0 pwm: brcmstb: Utilize approp=
riate clock APIs in suspend/resume<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0895ac9a21f69 pwm: sti: Reduce number of a=
llocations and drop usage of chip_data<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db64ddddeeec regmap: prevent noinc writes=
 from clobbering cache<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0004d4002534e media: dvb-usb-v2: af9035: f=
ix missing unlock<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a0beda184756 media: cedrus: Fix clock/res=
et sequence<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0980be4c3b0d5 media: vidtv: mux: Add check=
 and kfree for kstrdup<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d17269fb9161 media: vidtv: psi: Add check=
 for kstrdup<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db89f551b706 media: s3c-camif: Avoid inap=
propriate kfree()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051c94256a83f media: bttv: fix use after f=
ree error due to btv-&gt;timeout timer<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3937f9e25d9 media: i2c: max9286: Fix som=
e redundant of_node_put() calls<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09d060f2fc40c pcmcia: ds: fix possible nam=
e leak in error path in pcmcia_device_add()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024e9df588e2e pcmcia: ds: fix refcount lea=
k in pcmcia_device_add()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024e73ab542c7 pcmcia: cs: fix possible hun=
g task and memory leak pccardd()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3eaa0d43c74 rtc: pcf85363: fix wrong mas=
k/val parameters in regmap_update_bits call<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020bd0198bebd cxl/mem: Fix shutdown order<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d48fe8d98171 i3c: Fix potential refcount =
leak in i3c_master_register_new_i3c_devs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0855d6fb2cc7b 9p/net: fix possible memory =
leak in p9_check_errors()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d456ebaad30 perf hist: Add missing puts =
to hist__account_cycles<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0924e8d0b7645 perf machine: Avoid out of b=
ounds LBR memory read<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076b0eab987c4 usb: host: xhci-plat: fix po=
ssible kernel oops while resuming<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c9c4dab06a5a xhci: Loosen RPM as default =
policy to cover for AMD xHC 1.1<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092c9ef156431 powerpc/pseries: fix potenti=
al memory leak in init_cpu_associativity()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0516235e7b35f powerpc/imc-pmu: Use the cor=
rect spinlock initializer.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0945dc61d7840 powerpc/xive: Fix endian con=
version size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bce31a2bcb1e powerpc/40x: Remove stale PT=
E_ATOMIC_UPDATES macro<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01308e55eb09c modpost: fix tee MODULE_DEVI=
CE_TABLE built on big-endian host<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0863a9c3fdec2 powerpc: Only define __parse=
_fpscr() when required<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A001f62c6bd2db f2fs: fix to initialize map.=
m_pblk in f2fs_precache_extents()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dfebea7114e0 dmaengine: pxa_dma: Remove a=
n erroneous BUG_ON() in pxad_free_desc()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072f8fa6c4b78 USB: usbip: fix stub_dev hub=
 disconnect<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0168697f15a53 tools: iio: iio_generic_buff=
er ensure alignment<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a61c3c647ffd misc: st_core: Do not call k=
free_skb() under spin_lock_irqsave()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0732aa0cb2601 dmaengine: ti: edma: handle =
irq_of_parse_and_map() errors<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02941a29fe9d6 usb: chipidea: Simplify Tegr=
a DMA alignment code<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058e8316b200b usb: chipidea: Fix DMA overw=
rite for Tegra<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fcaafb574fc8 usb: dwc2: fix possible NULL=
 pointer dereference caused by driver concurrency<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c956be5641cc dmaengine: idxd: Register ds=
a_bus_type before registering idxd sub-drivers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca46d7ce1fbe livepatch: Fix missing newli=
ne character in klp_resolve_symbols()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b77f7c025e85 tty: tty_jobctrl: fix pid me=
mleak in disassociate_ctty()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9f598a5cc9a f2fs: compress: fix to avoid=
 redundant compress extension<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08c4504cc0c64 f2fs: compress: fix to avoid=
 use-after-free on dic<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca0aae3837a6 leds: trigger: ledtrig-cpu::=
 Fix &#39;output may be truncated&#39; issue for &#39;cpu&#39;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0206a972511a8 leds: pwm: Don&#39;t disable=
 the PWM when the LED should be off<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0893eedf596dd leds: turris-omnia: Do not u=
se SMBUS calls<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aec3706971b3 leds: turris-omnia: Drop unn=
ecessary mutex locking<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c9a4f13c58f1 mfd: arizona-spi: Set pdata.=
hpdet_channel for ACPI enumerated devs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A063a99d7b57b4 mfd: dln2: Fix double put in=
 dln2_probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02742c860e0b7 mfd: core: Ensure disabled d=
evices are skipped without aborting<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A094eb5423d75e mfd: core: Un-constify mfd_c=
ell.of_reg<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08890d4d5f25e ASoC: ams-delta.c: use compo=
nent after check<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2ae48bd82ee crypto: qat - fix deadlock i=
n backlog processing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00dd34a7ad395 padata: Fix refcnt handling =
in padata_free_shell()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A093e4aa8545ab ASoC: Intel: Skylake: Fix me=
m leak when parsing UUIDs fails<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd1c2df64d6b HID: logitech-hidpp: Move ge=
t_wireless_feature_index() check to hidpp_connect_event()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A099893b7c4592 HID: logitech-hidpp: Revert =
&quot;Don&#39;t restart communication if not necessary&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05f2f38602583 HID: logitech-hidpp: Don&#39=
;t restart IO, instead defer hid_connect() only<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f80041c5867 HID: logitech-hidpp: Remove =
HIDPP_QUIRK_NO_HIDINPUT quirk<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3b196a1da3e Revert &quot;HID: logitech-h=
idpp: add a module parameter to keep firmware gestures&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06885e5ffa09d sh: bios: Revive earlyprintk=
 support<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0c25e957f9b hid: cp2112: Fix IRQ shutdow=
n stopping polling for all IRQs on chip<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d06dc0f99f72 RDMA/hfi1: Workaround trunca=
tion compilation error<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0086cd44204bb scsi: ufs: core: Leave space=
 for &#39;\0&#39; in utf8 desc string<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a0f1999090b3 ASoC: fsl: Fix PM disable de=
pth imbalance in fsl_easrc_probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0904fc0103776 RDMA/hns: The UD mode can on=
ly be configured with DCQCN<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09f8db02d30ad RDMA/hns: Fix signed-unsigne=
d mixed comparisons<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02de683e27e1d RDMA/hns: Fix uninitialized =
ucmd in hns_roce_create_qp_common()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0611260e36f16 IB/mlx5: Fix rdma counter bi=
nding for RAW QP<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0922b2693b9af ASoC: fsl: mpc5200_dma.c: Fi=
x warning of Function parameter or member not described<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0001f90cd9d2f ext4: move &#39;ix&#39; sani=
ty check to corrent position<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c24a3c9e373e ARM: 9321/1: memset: cast th=
e constant byte to unsigned char<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0012d0c66f939 hid: cp2112: Fix duplicate w=
orkqueue initialization<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01ce09238e8e8 crypto: qat - increase size =
of buffers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A062df66b726f9 crypto: caam/jr - fix Chacha=
20 + Poly1305 self test failure<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A061f25d4686bf crypto: caam/qi2 - fix Chach=
a20 + Poly1305 self test failure<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066eb7b7f23dd nd_btt: Make BTT lanes preem=
ptible<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06563e0f79d63 libnvdimm/of_pmem: Use devm_=
kstrdup instead of kstrdup and check its return value<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4ad0c1a83ce scsi: ibmvfc: Fix erroneous =
use of rtas_busy_delay with hcall return code<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b79c7d684c3f RDMA/core: Use size_{add,sub=
,mul}() in calls to struct_size()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a5c83c8043d7 hwrng: geode - fix accessing=
 registers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8607725b20a crypto: hisilicon/hpre - Fix=
 a erroneous check after snprintf()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b01b9dc5487a selftests/resctrl: Ensure th=
e benchmark commands fits to its array<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02d2300fcf8f6 selftests/pidfd: Fix ksft pr=
int formats<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08bc9c9447489 arm64: dts: imx8mn: Add soun=
d-dai-cells to micfil node<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01abd658492b5 arm64: dts: imx8mm: Add soun=
d-dai-cells to micfil node<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cf7abb54f8b1 arm64: dts: imx8qm-ss-img: F=
ix jpegenc compatible entry<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08704bf18a888 clk: scmi: Free scmi_clk all=
ocated when the clocks with invalid info are skipped<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bdb0428aa294 firmware: arm_ffa: Assign th=
e missing IDR allocation ID to the FFA device<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0ffdc164365 firmware: ti_sci: Mark drive=
r as non removable<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0995ee1e84e8d soc: qcom: llcc: Handle a se=
cond device without data corruption<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A019b8098f73c6 ARM: dts: qcom: mdm9615: pop=
ulate vsdcc fixed regulator<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8ab88f84b89 arm64: dts: qcom: apq8016-sb=
c: Add missing ADV7533 regulators<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ddc0df81eeac ARM64: dts: marvell: cn9310:=
 Use appropriate label for spi1 pins<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A012d9de01c09c arm64: dts: qcom: sdm845-mtp=
: fix WiFi configuration<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0690b89255971 arm64: dts: qcom: sc7280: Ad=
d missing LMH interrupts<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02a4cce4168f7 arm64: dts: qcom: msm8992-li=
bra: drop duplicated reserved memory<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb9daf47806b arm64: dts: qcom: msm8916: F=
ix iommu local address range<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0541640dcbf48 ARM: dts: renesas: blanche: =
Fix typo in GP_11_2 pin name<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00e1e88bba286 perf: hisi: Fix use-after-fr=
ee when register pmu fails<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04067d39f3c57 drm: mediatek: mtk_dsi: Fix =
NO_EOT_PACKET settings/handling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a6a6f70aedca drm/msm/dsi: use msm_gem_ker=
nel_put to free TX buffer<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aea6f32a4318 xen-pciback: Consider INTx d=
isabled when MSI/MSI-X is enabled<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e588ca45bf55 drm/rockchip: Fix type promo=
tion bug in rockchip_gem_iommu_map()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a00a293d57a5 arm64/arm: xen: enlighten: F=
ix KPTI checks<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d0d01bb4a560 drm/bridge: lt9611uxc: fix t=
he race in the error path<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A029aba28ea195 drm/bridge: lt9611uxc: Regis=
ter and attach our DSI device at probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f53a04579328 drm/bridge: lt9611uxc: Switc=
h to devm MIPI-DSI helpers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0517a5137a57b drm/rockchip: cdn-dp: Fix so=
me error handling paths in cdn_dp_probe()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0865ccd4ca674 drm/mediatek: Fix iommu faul=
t during crtc enabling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08e3c8253b34f drm/mediatek: Fix iommu faul=
t by swapping FBs after updating plane state<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e11e339faa11 drm/amdkfd: fix some race co=
nditions in vram buffer alloc/free of svm code<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030cb99e09648 drm/bridge: tc358768: Fix bi=
t updates<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01cd4ae681a6a drm/bridge: tc358768: Disabl=
e non-continuous clock mode<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c13591b859be drm/bridge: tc358768: Fix us=
e of uninitialized variable<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d78bddd94b80 drm/bridge: lt8912b: Add mis=
sing drm_bridge_attach call<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05cc2bc519afd drm/bridge: lt8912b: Manuall=
y disable HPD only if it was enabled<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A042071feab712 drm/bridge: lt8912b: Fix cra=
sh on bridge detach<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d9217286d0ab drm/bridge: lt8912b: Fix bri=
dge_detach<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc3057958c5c drm/bridge: lt8912b: Add hot=
 plug detection<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef4a40953c80 drm/bridge: lt8912b: Registe=
r and attach our DSI device at probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03580b8a01305 drm/bridge: lt8912b: Switch =
to devm MIPI-DSI helpers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A052541851a8d1 drm/mipi-dsi: Create devm de=
vice attachment<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a20d6ecd261a drm/mipi-dsi: Create devm de=
vice registration<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0347f025a02b3 drm/radeon: possible buffer =
overflow<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b163b371d741 drm/rockchip: vop: Fix call =
to crtc reset helper<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a96bed1df7b drm/rockchip: vop: Fix reset=
 of state in duplicate state crtc funcs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01b0bc99cf316 hwmon: (coretemp) Fix potent=
ially truncated sysfs attribute name<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3e7eb23a6e9 hwmon: (axi-fan-control) Fix=
 possible NULL pointer dereference<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0bf076b734a platform/x86: wmi: Fix openi=
ng of char device<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c57e81d5e538 platform/x86: wmi: remove un=
necessary initializations<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02ca4e461a298 platform/x86: wmi: Fix probe=
 failure when failing to register WMI devices<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f75e11f54d98 clk: qcom: config IPQ_APSS_6=
018 should depend on QCOM_SMEM<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d1175cf4bd2b clk: mediatek: clk-mt2701: A=
dd check for mtk_alloc_clk_data<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e964d21dc034 clk: mediatek: clk-mt7629: A=
dd check for mtk_alloc_clk_data<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4070ada5d51 clk: mediatek: clk-mt7629-et=
h: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03aefc6fcfbad clk: mediatek: clk-mt6797: A=
dd check for mtk_alloc_clk_data<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca6d565a2319 clk: mediatek: clk-mt6779: A=
dd check for mtk_alloc_clk_data<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0533ca5153ad6 clk: mediatek: clk-mt6765: A=
dd check for mtk_alloc_clk_data<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e531e4e73734 clk: npcm7xx: Fix incorrect =
kfree<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0761c2a690d8f clk: ti: fix double free in =
of_ti_divider_clk_setup()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c37faca0908 clk: ti: change ti_clk_regis=
ter[_omap_hw]() API<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028b72fba1e19 clk: ti: Update component cl=
ocks to use ti_dt_clk_name()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4bffed2e52b clk: ti: Update pll and cloc=
kdomain clocks to use ti_dt_clk_name()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09b5e9d8bf9a6 clk: ti: Add ti_dt_clk_name(=
) helper to use clock-output-names<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f45fff806ebb clk: keystone: pll: fix a co=
uple NULL vs IS_ERR() checks<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ff8ca9beefb spi: nxp-fspi: use the corre=
ct ioremap function<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A026206c858dae clk: renesas: rzg2l: Fix com=
putation formula<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01966bf2a79e6 clk: renesas: rzg2l: Use FIE=
LD_GET() for PLL register fields<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ece2efa87af clk: renesas: rzg2l: Simplif=
y multiplication/shift logic<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e2239f716529 clk: imx: imx8qxp: Fix elcdi=
f_pll clock<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d416973cd12 clk: imx: imx8mq: correct er=
ror handling path<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0608ebb098b79 clk: imx: Select MXC_CLK for=
 CLK_IMX8QXP<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08861b2925a84 clk: qcom: gcc-sm8150: Fix g=
cc_sdcc2_apps_clk_src<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076e8f00f54a8 clk: qcom: mmcc-msm8998: Fix=
 the SMMU GDSC<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056c4bb46a5a0 clk: qcom: mmcc-msm8998: Don=
&#39;t check halt bit on some branch clks<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00881d24cf5ca clk: qcom: clk-rcg2: Fix clo=
ck rate overflow for high parent frequencies<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b64683f5d728 spi: tegra: Fix missing IRQ =
check in tegra_slink_probe()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b13e8b38be51 regmap: debugfs: Fix a erron=
eous check after snprintf()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08fafac407346 ipvlan: properly track tx_er=
rors<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03eedc19a9d0f net: add DEV_STATS_READ() he=
lper<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0359bce81b841 ipv6: avoid atomic fragment =
on GSO packets<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06b413d52f6ab ACPI: sysfs: Fix create_pnp_=
modalias() and create_of_modalias()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A032aaa3b98789 wifi: iwlwifi: empty overflo=
w queue during flush<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00e3ad00be4e8 wifi: iwlwifi: pcie: synchro=
nize IRQs before NAPI<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8ebe549e0ce wifi: iwlwifi: call napi_syn=
chronize() before freeing rx/tx queues<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0627a3b3f5c80 iwlwifi: pcie: adjust to Bz =
completion descriptor<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d91506a40ec tcp: fix cookie_init_timesta=
mp() overflows<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04f6e904ed4e3 chtls: fix tp-&gt;rcv_tstamp=
 initialization<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05d7bec7ae4db r8169: fix rare issue with b=
roken rx after link-down on RTL8125<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e143a3c82d33 r8169: use tp_to_dev instead=
 of open code<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a8f4e58e1ee thermal: core: prevent poten=
tial string overflow<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bfd4ed4988aa netfilter: nf_tables: Drop p=
ointless memset when dumping rules<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A080986257d2cd PM / devfreq: rockchip-dfi: =
Make pmu regmap mandatory<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0826120c9ba68 can: dev: can_put_echo_skb()=
: don&#39;t crash kernel if can_priv::echo_skb is accessed out of bounds<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028e9e015916e can: dev: can_restart(): fix=
 race condition between controller restart and netif_carrier_on()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ada4dc4788f1 can: dev: can_restart(): don=
&#39;t crash kernel if carrier is OK<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4eb4182a823 wifi: rtlwifi: fix EDCA limi=
t set by BT coexistence<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02027e74150ee tcp_metrics: do not create a=
n entry from tcp_init_metrics()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f7cb7c47ce0 tcp_metrics: properly set tp=
-&gt;snd_ssthresh in tcp_init_metrics()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca7b6fa9e61a tcp_metrics: add missing bar=
riers on delete<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0227709a0e47c wifi: mt76: mt7603: improve =
stuck beacon handling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eab5b0aa5065 mt76: pass original queue id=
 from __mt76_tx_queue_skb to the driver<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A075336a762539 mt76: add support for overri=
ding the device used for DMA mapping<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A077b2ab5cd1a4 mt76: dma: use kzalloc inste=
ad of devm_kzalloc for txwi<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0064b32f18db1 wifi: mt76: mt7603: rework/f=
ix rx pse hang check<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01afbb9ececd3 wifi: rtw88: debug: Fix the =
NULL vs IS_ERR() bug for debugfs_create_file()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ebcbf5f5e047 net: spider_net: Use size_ad=
d() in call to struct_size()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056e7424c6efc tipc: Use size_add() in call=
s to struct_size()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03e51efcb2909 mlxsw: Use size_mul() in cal=
l to struct_size()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dc3fef310732 gve: Use size_add() in call =
to struct_size()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070f032db8516 tcp: call tcp_try_undo_recov=
ery when an RTOd TFO SYNACK is ACKed<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2d540c74549 udp: add missing WRITE_ONCE(=
) around up-&gt;encap_rcv<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f7eef3a13df selftests/bpf: Correct map_f=
d to data_fd in tailcalls<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03eefb2fbf4ec selftests/bpf: Test tail cal=
l counting with bpf2bpf and data on stack<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ab91992ec4d4 i40e: fix potential memory l=
eaks in i40e_remove()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0702742373650 genirq/matrix: Exclude manag=
ed interrupts in irq_matrix_allocated()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0379b120e4f27 pstore/platform: Add check f=
or kstrdup<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A081b8638e4ef4 x86/boot: Fix incorrect star=
tup_gdt_descr.size<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c7e8c7452e5a x86/sev-es: Allow copy_from_=
kernel_nofault() in earlier boot<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b5da8ce0f18 x86: Share definition of __i=
s_canonical_address()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A090b263db856d futex: Don&#39;t include pro=
cess MM in futex key on no-MMU<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0d6e5841172 x86/srso: Fix SBPB enablemen=
t for (possible) future fixed HW<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0565f9337b68e writeback, cgroup: switch in=
odes with dirty timestamps to release dying cgwbs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02bb46b20825d vfs: fix readahead(2) on blo=
ck devices<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020195f87db19 sched: Fix stop_one_cpu_nowa=
it() vs hotplug<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A013cde955e52e sched/uclamp: Ignore (util =
=3D=3D 0) optimization in feec() when p_util_max =3D 0<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc6198ff20c0 iov_iter, x86: Be consistent=
 about the __user tag on copy_mc_to_user()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A080529b4968a8 Linux 5.15.138<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03d8344a7c4a3 ALSA: hda: intel-dsp-config:=
 Fix JSL Chromebook quirk detection<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f049c0c0037d misc: pci_endpoint_test: Add=
 deviceID for J721S2 PCIe EP device support<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028b8ad8ccecd tty: 8250: Add Brainboxes Ox=
ford Semiconductor-based quirks<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A044c4dfac3f02 tty: 8250: Add support for I=
ntashield IX cards<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d541ccb34de2 tty: 8250: Add support for a=
dditional Brainboxes PX cards<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A060debc01fcbb tty: 8250: Fix up PX-803/PX-=
857<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f5649aed527 tty: 8250: Fix port count of=
 PX-257<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03fe3cc63c730 tty: 8250: Add support for I=
ntashield IS-100<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a5b6390fd609 tty: 8250: Add support for B=
rainboxes UP cards<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0738fe41b6443 tty: 8250: Add support for a=
dditional Brainboxes UC cards<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff6059c3d234 tty: 8250: Remove UC-257 and=
 UC-431<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A081a4dd5e6c78 tty: n_gsm: fix race conditi=
on in status line change on dead connections<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e25197747f0e usb: raw-gadget: properly ha=
ndle interrupted requests<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e5f53a68a596 usb: typec: tcpm: Fix NULL p=
ointer dereference in tcpm_pd_svdm()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c4855b22a3f usb: storage: set 1.50 as th=
e lower bcdDevice for older &quot;Super Top&quot; compatibility<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c48aae53850c PCI: Prevent xHCI driver fro=
m claiming AMD VanGogh USB3 DRD device<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06628c3627c02 drm/amd: Disable ASPM for VI=
 w/ all Intel systems<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b6c3c7786e24 drm/amd: Move helper for dyn=
amic speed switch check out of smu13<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09015169f00ee can: isotp: isotp_sendmsg():=
 fix TX state detection and wait behavior<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d72ff6478323 can: isotp: isotp_bind(): do=
 not validate unused address information<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e163ad6a8639 can: isotp: add local echo t=
x processing and tx without FC<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b4e78ea26638 can: isotp: handle wait_even=
t_interruptible() return values<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02fc6f337257f can: isotp: check CAN addres=
s family in isotp_bind()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f8c3bd211cf3 can: isotp: isotp_bind(): re=
turn -EINVAL on incorrect CAN ID formatting<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0615c4dd64050 can: isotp: set max PDU size=
 to 64 kByte<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06627b96851f1 powerpc/mm: Fix boot crash w=
ith FLATMEM<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0f998648887 r8152: Check for unplug in r=
8153b_ups_en() / r8153c_ups_en()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A078c939a88729 r8152: Check for unplug in r=
tl_phy_patch_request()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051cc28ce742e net: chelsio: cxgb4: add an =
error code check in t4_load_phy_fw<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bbc926199321 platform/mellanox: mlxbf-tmf=
ifo: Fix a warning message<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db4416ea3a5d scsi: mpt3sas: Fix in error =
path<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d48b2e8189d5 fbdev: uvesafb: Call cn_del_=
callback() at the end of uvesafb_exit()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e39440c3268b drm/ttm: Reorder sys manager=
 cleanup step<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aade33d3d9bb ASoC: rt5650: fix the wrong =
result of key button<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fa32e21c0568 netfilter: nfnetlink_log: si=
lence bogus compiler warning<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dfcbb983eb6e spi: npcm-fiu: Fix UMA reads=
 when dummy.nbytes =3D=3D 0<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A064ae128b095d fs/ntfs3: Avoid possible mem=
ory leak<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A027a0bed1285e fs/ntfs3: Fix directory elem=
ent type detection<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A094524980ee75 fs/ntfs3: Fix NULL pointer d=
ereference on error in attr_allocate_frame()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02de328398b50 fs/ntfs3: Fix possible NULL-=
ptr-deref in ni_readpage_cmpr()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0962a3d3d731c fs/ntfs3: Use kvmalloc inste=
ad of kmalloc(... __GFP_NOWARN)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0393966e79ba1 fs/ntfs3: Write immediately =
updated ntfs state<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A059e629fc7157 fs/ntfs3: Add ckeck in ni_up=
date_parent()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0738a3adc7c8b fbdev: atyfb: only use iorem=
ap_uc() on i386 and ia64<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0afef8af919d2 Input: synaptics-rmi4 - hand=
le reset delay when using SMBus trsnsport<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0abc62fc06d4a powerpc/85xx: Fix math emula=
tion exception<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04bdde4dca00e dmaengine: ste_dma40: Fix PM=
 disable depth imbalance in d40_probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A039d2c10367a8 irqchip/stm32-exti: add miss=
ing DT IRQ flag translation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c57aef9075e0 irqchip/riscv-intc: Mark all=
 INTC nodes as initialized<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb99b6e204cd net: sched: cls_u32: Fix all=
ocation size in u32_init()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05e78ebe7c1db ASoC: simple-card: fixup aso=
c_simple_probe() error handling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A065fd21aa3805 x86: Fix .brk attribute in l=
inker script<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4c8bf5635c4 rpmsg: Fix possible refcount=
 leak in rpmsg_register_device_override()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a82e0fda8a2f rpmsg: glink: Release driver=
_override<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bfd4a664ddfb rpmsg: Fix calling device_lo=
ck() on non-initialized device<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02e76b4f6218c rpmsg: Fix kfree() of static=
 memory on setting driver_override<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05c0da71871d3 rpmsg: Constify local variab=
le in field store macro<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0389190b25472 driver: platform: Add helper=
 for safer setting of driver_override<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A037ffa428d58c objtool/x86: add missing emb=
edded_insn check<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f031e15d0bb8 ext4: avoid overlapping prea=
llocations due to overflow<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f2c3a3aa6f11 ext4: fix BUG in ext4_mb_new=
_inode_pa() due to overflow<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07a992726f727 ext4: add two helper functio=
ns extent_logical_end() and pa_logical_end()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09e78e7709f7d x86/mm: Fix RESERVE_BRK() fo=
r older binutils<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3201c718058 x86/mm: Simplify RESERVE_BRK=
()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0897b56acf126 x86/i8259: Skip probing when=
 ACPI/MADT advertises PCAT compatibility<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A077db87c4a4ed gve: Fix GFP flags when allo=
cing pages<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08b424bdf6c9c iio: afe: rescale: Accept on=
ly offset channels<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c1eeb494f684 iio: afe: rescale: add offse=
t support<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c76b7db5521 iio: afe: rescale: expose sc=
ale processing function<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c60671502dc2 iio: afe: rescale: reorder i=
ncludes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A027dd09f5ec7f clk: Sanitize possible_paren=
t_show to Handle Return Value of of_clk_get_parent_name<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c27ca4aebbee sparc32: fix a braino in fau=
lt handling in csum_and_copy_..._user()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A021b07a2e6095 perf/core: Fix potential NUL=
L deref<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06efd498009b9 nvmem: imx: correct nregs fo=
r i.MX6UL<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c2948118c34 nvmem: imx: correct nregs fo=
r i.MX6SLL<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06e22bf6f00d5 nvmem: imx: correct nregs fo=
r i.MX6ULL<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0f95b831b4a misc: fastrpc: Clean buffers=
 on remote invocation failures<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4957f00f9e2 tracing/kprobes: Fix the des=
cription of variable length arguments<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cdc57093b470 i2c: aspeed: Fix i2c bus han=
g in slave read<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e97d374a2506 i2c: stm32f7: Fix PEC handli=
ng in case of SMBUS transfers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02766a872103b i2c: muxes: i2c-demux-pinctr=
l: Use of_get_i2c_adapter_by_node()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A048b58f7469e5 i2c: muxes: i2c-mux-gpmux: U=
se of_get_i2c_adapter_by_node()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb65e692765b i2c: muxes: i2c-mux-pinctrl:=
 Use of_get_i2c_adapter_by_node()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eace761f35a1 iio: adc: xilinx-xadc: Corre=
ct temperature offset/scale for UltraScale<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070322a446ef2 iio: adc: xilinx-xadc: Don&#=
39;t clobber preset voltage/temperature thresholds<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03c1312b5d49a iio: exynos-adc: request sec=
ond interupt only when touchscreen mode is used<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04e14f2d5885f kasan: print the original fa=
ult addr when access invalid shadow<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bdfa4fa7588d i40e: Fix wrong check for I4=
0E_TXR_FLAGS_WB_ON_ITR<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d5c175f4cea6 gtp: fix fragmentation neede=
d check with gso<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0dad0c0924c gtp: uapi: fix GTPA_MAX<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0852fb4ce426d tcp: fix wrong RTO timeout w=
hen received SACK reneging<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A083cfa3b51a78 r8152: Release firmware if w=
e have an error in probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0f9231ccd6c r8152: Cancel hw_phy_work if=
 we have an error in probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff42b0a55659 r8152: Run the unload routin=
e if we have errors during probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06fa3b9f9478e r8152: Increase USB control =
msg timeout to 5000ms as per spec<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076873f2eadc0 net: usb: smsc95xx: Fix unin=
it-value access in smsc95xx_read_reg<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06afd112c3f95 net: ieee802154: adf7242: Fi=
x some potential buffer overflow in adf7242_stats_show()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A046cd35e4e774 igc: Fix ambiguity in the et=
htool advertising<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A049529413eaed neighbour: fix various data-=
races<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0667554946360 igb: Fix potential memory le=
ak in igb_add_ethtool_nfc_entry<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0263421905346 treewide: Spelling fix in co=
mment<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc0c4bc119d2 i40e: Fix I40E_FLAG_VF_VLAN_=
PRUNING value<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c532c5df01ad r8169: fix the KCSAN reporte=
d data race in rtl_rx while reading desc-&gt;opts1<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06afb294c88c6 r8169: fix the KCSAN reporte=
d data-race in rtl_tx while reading TxDescArray[entry].opts1<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09d7b3838428c r8169: fix the KCSAN reporte=
d data-race in rtl_tx() while reading tp-&gt;cur_tx<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A004dbfa4122e0 firmware/imx-dsp: Fix use_af=
ter_free in imx_dsp_setup_channels()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d587b86cd0d drm/dp_mst: Fix NULL deref i=
n get_mst_branch_device_by_guid_helper()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08860f0175e51 vsock/virtio: initialize the=
_virtio_vsock before using VQs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0762c251c7f5c vsock/virtio: add support fo=
r device suspend/resume<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01e02df6f6907 vsock/virtio: factor our the=
 code to initialize and delete VQs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A015a8cac3c250 drm/i915/pmu: Check if pmu i=
s closed before stopping event<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A043bd431a5dd9 nfsd: lock_rename() needs bo=
th directories to live on the same fs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0556b68d9b95f mm/migrate: fix do_pages_mov=
e for compat pointers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4071c6114de mm/page_alloc: correct start=
 page when guard page debug is enabled<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a6cee2bfb53 vhost: Allow null msg.size o=
n VHOST_IOTLB_INVALIDATE<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fbc9a8718f31 virtio-mmio: fix memory leak=
 of vm_dev<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0862a356bc986 virtio_balloon: Fix endless =
deflation and inflation on arm64<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A041bb770e42bc mcb-lpc: Reallocate memory r=
egion to avoid memory overlapping<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f2ac8b2643dd mcb: Return actual parsed si=
ze when reading chameleon table<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A090918ef995b5 mptcp: more conservative che=
ck for zero probes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd2b2dab6f5b tcp: cleanup tcp_remove_empt=
y_skb() use<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A068342755b9b2 tcp: remove dead code from t=
cp_sendmsg_locked()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00f482ad7b1a5 pinctrl: qcom: lpass-lpi: fi=
x concurrent register updates<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051b054f6fe01 ASoC: codecs: wcd938x: fix r=
untime PM imbalance on remove<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb34f4e79e54 ASoC: codecs: wcd938x: fix r=
esource leaks on bind errors<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A012952a23a5da Linux 5.15.137<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dff33880d40a xfrm6: fix inet6_dev refcoun=
t underflow problem<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a9d05a4f1c3 Bluetooth: hci_sock: Correct=
ly bounds check and pad HCI_MON_NEW_INDEX name<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a6df96ee0b45 Bluetooth: hci_sock: fix sla=
b oob read in create_monitor_event<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c08d609fb2b6 phy: mapphone-mdm6600: Fix p=
inctrl_pm handling for sleep pins<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1b030b101f6 phy: mapphone-mdm6600: Fix r=
untime PM for remove<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A059f1095ab58e phy: mapphone-mdm6600: Fix r=
untime disable on probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b618062c0b13 serial: 8250: omap: Move uar=
t_write() inside PM section<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A067f29cd2f851 ASoC: pxa: fix a memory leak=
 in probe()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076d04c339508 gpio: vf610: set value befor=
e the direction to avoid a glitch<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04b129e3964b3 platform/x86: asus-wmi: Map =
0x2a code, Ignore 0x2b and 0x2c events<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1a058cc2467 platform/x86: asus-wmi: Chan=
ge ASUS_WMI_BRN_DOWN code from 0x20 to 0x2e<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c6bbe51dcdf3 platform/surface: platform_p=
rofile: Propagate error if profile registration fails<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a73c8d716938 s390/cio: fix a memleak in c=
ss_alloc_subchannel<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8b6c2df1e7d selftests/ftrace: Add new te=
st case which checks non unique symbol<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03ad81e6affcb s390/pci: fix iommu bitmap a=
llocation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A071d224acc4d1 perf: Disallow mis-matched i=
nherited group reads<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05aa89a11a2a6 USB: serial: option: add Fib=
ocom to DELL custom modem FM101R-GL<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08c376d863618 USB: serial: option: add ent=
ry for Sierra EM9191 with new firmware<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0483221216176 USB: serial: option: add Tel=
it LE910C4-WWX 0x1035 composition<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e750fb71dc6a nvme-rdma: do not try to sto=
p unallocated queues<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9fd6d44abbc nvme-pci: add BOGUS_NID for =
Intel 0a54 device<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0071382bda1da ACPI: irq: Fix incorrect ret=
urn value in acpi_register_gsi()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0431a5010bce2 NFSv4.1: fixup use EXCHGID4_=
FLAG_USE_PNFS_DS for DS server<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05762e72ef1b0 pNFS: Fix a hang in nfs4_evi=
ct_inode()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a3abee2eee9 Revert &quot;pinctrl: avoid =
unsafe code pattern in find_pinctrl()&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024959825377f mmc: core: Capture correct o=
emid-bits for eMMC cards<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08041e7b7e7e9 mmc: core: sdio: hold retuni=
ng if sdio in 1-bit mode<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0262029c0c58c mmc: mtk-sd: Use readl_poll_=
timeout_atomic in msdc_reset_hw<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03e363db1c13a mtd: physmap-core: Restore m=
ap_rom fallback<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A071823463b1b2 mtd: spinand: micron: correc=
t bitmask for ecc status<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a50d2f17d562 mtd: rawnand: arasan: Ensure=
 program page operations are successful<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ae53c92e928c mtd: rawnand: marvell: Ensur=
e program page operations are successful<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0ca2ab23098 mtd: rawnand: pl353: Ensure =
program page operations are successful<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7070628043e mtd: rawnand: qcom: Unmap th=
e right resource upon probe failure<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f928d1362f7 net: fix ifname in netlink n=
tf during netns move<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ac43ec299a6f net: move from strlcpy with =
unused retval to strscpy<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030e2db403032 net: introduce a function to=
 check if a netdev name is in use<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A038ba5479355b Bluetooth: hci_event: Fix us=
ing memcmp when comparing keys<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03b2da6d62b42 net/mlx5: Handle fw tracer c=
hange ownership event based on MTRC<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6e263824539 platform/x86: touchscreen_dm=
i: Add info for the Positivo C4128B<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca56d8afe648 HID: multitouch: Add require=
d quirk for Synaptics 0xcd7e device<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca5bec7ecf26 btrfs: error out when reallo=
cating block for defrag using a stale transaction<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02692fd37aaf4 btrfs: error when COWing blo=
ck from a root that is being deleted<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef491d9560d9 btrfs: error out when COWing=
 block using a stale transaction<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f89ed0a09673 btrfs: fix some -Wmaybe-unin=
itialized warnings in ioctl.c<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0df486b75feca drm: panel-orientation-quirk=
s: Add quirk for One Mix 2S<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d5ba30ee4f6d ipv4/fib: send notify when d=
elete source address routes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09d07b7abd277 sky2: Make sure there is at =
least one frag_addr available<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f652eb4adf27 regulator/core: Revert &quot=
;fix kobject release warning and memory leak in regulator_register()&quot;<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aa77b187b1f0 wifi: cfg80211: avoid leakin=
g stack data into trace<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030a2285a2e18 wifi: mac80211: allow transm=
itting EAPOL frames with tainted key<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b64eb31a1b53 wifi: cfg80211: Fix 6GHz sca=
n configuration<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bbec1724519e Bluetooth: hci_core: Fix bui=
ld warnings<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A002b0e6991838 Bluetooth: Avoid redundant a=
uthentication<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A038681af225b6 Bluetooth: btusb: add shutdo=
wn function for QCA6174<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e6e9a32c3e60 HID: holtek: fix slab-out-of=
-bounds Write in holtek_kbd_input_event<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A006aabf7715da wifi: iwlwifi: Ensure ack fl=
ag is properly cleared.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06063f6f64fa4 wifi: mwifiex: Sanity check =
tlv_len and tlv_bitmap_len<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A059ebfeb7b319 tracing: relax trace_event_e=
val_update() execution with cond_resched()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03d85fb391fa7 ata: libata-eh: Fix compilat=
ion warning in ata_eh_link_report()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A089e3cc1b0703 ata: libata-core: Fix compil=
ation warning in ata_dev_config_ncq()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0137c658ea3ce gpio: timberdale: Fix potent=
ial deadlock on &amp;tgpio-&gt;lock<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A068f106c2b2ab overlayfs: set ctime when se=
tting mtime and atime<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef3c62e2f0f1 i2c: mux: Avoid potential fa=
lse error message in i2c_mux_add_adapter<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e2f64f3eebaa btrfs: initialize start_slot=
 in btrfs_log_prealloc_extents<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0266dab0ce42d btrfs: return -EUCLEAN for d=
elayed tree ref with a ref count not equals to 1<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc424f18fbdc fs-writeback: do not requeue=
 a clean inode having skipped pages<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092609823592c ARM: dts: ti: omap: Fix nois=
y serial with overrun-throttle-ms for mapphone<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03898d8d685ab ksmbd: not allow to open fil=
e if delelete on close bit is set<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3dc26c4fdc2 nfp: flower: avoid rmmod nfp=
 crash issues<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c52b1215904 mctp: perform route lookups =
under a RCU read-side lock<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db3f17e571e8 mctp: Allow local delivery t=
o the null EID<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A029017ab1a539 powerpc/47x: Fix 47x syscall=
 return crash<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0558ee0fafd40 powerpc/32s: Do kuep_lock() =
and kuep_unlock() in assembly<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d00f4ae3accf powerpc/32s: Remove capabili=
ty to disable KUEP at boottime<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fcb3f09e8173 drm/atomic-helper: relax unr=
egistered connector check<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0403d201d1fd1 perf/x86/lbr: Filter vsyscal=
l addresses<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0419ac18d8808 perf/x86: Move branch classi=
fier<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0030099bc9115 perf: Add irq and exception =
return branch types<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ae80d5290c14 iio: adc: ad7192: Correct re=
ference voltage<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0569a126f244b iio: cros_ec: fix an use-aft=
er-free in cros_ec_sensors_push_data()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9c471892d75 iio: core: introduce iio_dev=
ice_{claim|release}_buffer_mode() APIs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eafbb1966152 iio: core: Hide read accesse=
s to iio_dev-&gt;currentmode<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0919721348c04 iio: Un-inline iio_buffer_en=
abled()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07f74bc91eb00 serial: 8250_omap: Fix error=
s with no_console_suspend<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d67d831e1dbc serial: 8250: omap: Fix impr=
ecise external abort for omap_8250_pm()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aff3019b553e selftests/mm: fix awk usage =
in charge_reserved_hugetlb.sh and hugetlb_reparenting_test.sh that may caus=
e error<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04f1d3d1ca500 net: pktgen: Fix interface f=
lags printing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08bdf95e29f86 netfilter: nf_tables: revert=
 do not remove elements if set backend implements .abort<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc19daa037f5 netfilter: nf_tables: do not=
 remove elements if set backend implements .abort<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db33720697c8 netfilter: nft_set_rbtree: .=
deactivate fails if element has expired<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A044768cad012c neighbor: tracing: Move pin6=
 inside CONFIG_IPV6=3Dy section<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b33179dbf3f2 net/sched: sch_hfsc: upgrade=
 &#39;rt&#39; to &#39;sc&#39; when it becomes a inner curve<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00426d7bc17b8 bonding: Return pointer to d=
ata after pull on skb<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066982023d741 net: dsa: bcm_sf2: Fix possi=
ble memory leak in bcm_sf2_mdio_register()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00ea476863ef7 i40e: prevent crash on probe=
 if hw registers have invalid values<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9202217a6ea net: usb: smsc95xx: Fix an e=
rror code in smsc95xx_reset()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2ceb30cc1fc ipv4: fib: annotate races ar=
ound nh-&gt;nh_saddr_genid and nh-&gt;nh_saddr<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a270aa7a47db tun: prevent negative ifinde=
x<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09d55719f983d tcp: tsq: relax tcp_small_qu=
eue_check() when rtx queue contains a single skb<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08ae344291e38 tcp: fix excessive TLP and R=
ACK timeouts from HZ rounding<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08b6b4ca42a94 net: rfkill: gpio: prevent v=
alue glitch during probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04df9ba0d7a82 net: ipv6: fix return value =
check in esp_remove_trailer<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9651e66d0bd net: ipv4: fix return value =
check in esp_remove_trailer<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A026a3c734cb8a xfrm: interface: use DEV_STA=
TS_INC()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f8bc4b708b11 xfrm: fix a data-race in xfr=
m_gen_index()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b660e58ef72d qed: fix LL2 RX buffer alloc=
ation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d35f398b88a1 ASoC: codecs: wcd938x: fix u=
nbind tear down order<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d182d8ed7b7e ASoC: codecs: wcd938x: drop =
bogus bind error handling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d32a6b67e77 ASoC: codecs: wcd938x-sdw: f=
ix runtime PM imbalance on probe errors<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06df571a6c153 ASoC: codecs: wcd938x-sdw: f=
ix use after free on driver unbind<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A036eabe87031f drm/i915: Retry gtt fault wh=
en out of fence registers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A034f62612be2a nvmet-tcp: Fix a possible UA=
F in queue intialization setup<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A004e0eef74b8f netfilter: nft_payload: fix =
wrong mac header matching<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0efe43d1bcbcb fs/ntfs3: fix deadlock in ma=
rk_as_free_ex<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ab40c7ab7a93 fs/ntfs3: fix panic about sl=
ab-out-of-bounds caused by ntfs_list_ea()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024badb9dd8b8 fs/ntfs3: Fix possible null-=
pointer dereference in hdr_find_e()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff38d2a705e1 tcp: check mptcp-level const=
raints for backlog coalescing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0582f7993353c x86/sev: Check for user-spac=
e IOIO pointing to kernel space<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05c2c01be809d x86/sev: Check IOBM for IOIO=
 exceptions from user-space<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06797c6d09e50 x86/sev: Disable MMIO emulat=
ion from user mode<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b4e772a6a89 KVM: x86: Mask LVTPC when ha=
ndling a PMI<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f61c43be1eb9 regmap: fix NULL deref on lo=
okup<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ffdc881f6807 nfc: nci: fix possible NULL =
pointer dereference in send_acknowledge()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d42aeae14fc4 ice: reset first in crash du=
mp kernels<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e42cecb513af ice: fix over-shifted variab=
le<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6c093b97761 Bluetooth: avoid memcmp() ou=
t of bounds warning<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e5f8b43c9c90 Bluetooth: hci_event: Fix co=
ding style<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01597c1ed0e7d Bluetooth: vhci: Fix race wh=
en opening vhci device<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01ef071526848 Bluetooth: Fix a refcnt unde=
rflow problem for hci_conn<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dd6b62fdd245 Bluetooth: Reject connection=
 with the device which has same BD_ADDR<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0848a05c4423f Bluetooth: hci_event: Ignore=
 NULL link key<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e7a2aa7770d3 xfs: don&#39;t expose intern=
al symlink metadata buffers to the vfs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fe5c6fbc5e4a Documentation: sysctl: align=
 cells in second content column<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01815844652cc lib/Kconfig.debug: do not en=
able DEBUG_PREEMPT by default<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A000c03985402e Linux 5.15.136<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05266b5b6e975 eth: remove remaining copies=
 of the NAPI_POLL_WEIGHT define<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0528f0ba9f7a4 usb: hub: Guard against acce=
sses to uninitialized BOS descriptors<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0542a3f1a3cc1 Revert &quot;kernel/sched: M=
odify initial boot task idle setup&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0737ce5518a9c arm64: armv8_deprecated: fix=
 unused-function error<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02e10931e2d77 arm64: armv8_deprecated: rew=
ork deprected instruction handling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0abd4aa081905 arm64: armv8_deprecated: mov=
e aarch32 helper earlier<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f10abdb04c3d arm64: armv8_deprecated move=
 emulation functions<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b4eec015fa5 arm64: armv8_deprecated: fol=
d ops into insn_emulation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8d2910be6f8 arm64: rework EL0 MRS emulat=
ion<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0057f9123b1a8 arm64: factor insn read out =
of call_undef_hook()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f82927cabaf arm64: factor out EL1 SSBS e=
mulation hook<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0474385adcd84 arm64: split EL0/EL1 UNDEF h=
andlers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de0358635401 arm64: allow kprobes on EL0 =
handlers<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07154e2db8890 arm64: rework BTI exception =
handling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd5ceadc2b37 arm64: rework FPAC exception=
 handling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b6358002fd0c arm64: consistently pass ESR=
_ELx to die()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ddb1ef2bb42 arm64: die(): pass &#39;err&=
#39; as long<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a3e177ef570 arm64: report EL1 UNDEFs bet=
ter<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d6808be3ff94 powerpc/64e: Fix wrong test =
in __ptep_test_and_clear_young()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09c0dc3e2c996 powerpc/8xx: Fix pte_access_=
permitted() for PAGE_NONE<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04da05eba66e6 dmaengine: mediatek: Fix dea=
dlock caused by synchronize_irq()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A082f61b2d5187 dmaengine: idxd: use spin_lo=
ck_irqsave before wait_event_lock_irq<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ecba5afe86f3 x86/alternatives: Disable KA=
SAN in apply_alternatives()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cbd2aac00498 usb: cdnsp: Fixes issue with=
 dequeuing not queued requests<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07014807fb7ef usb: gadget: ncm: Handle dec=
oding of multiple NTB&#39;s in unwrap call<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A050259cf71a1b usb: gadget: udc-xilinx: rep=
lace memcpy with memcpy_toio<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0308f19249641 counter: microchip-tcb-captu=
re: Fix the use of internal GCLK logic<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a6ce81d7c16 pinctrl: avoid unsafe code p=
attern in find_pinctrl()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c790191cab4 cgroup: Remove duplicates in=
 cgroup v1 tasks file<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01680c82929bc tee: amdtee: fix use-after-f=
ree vulnerability in amdtee_close_session<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b8ec40a90acd Input: goodix - ensure int G=
PIO is in input for gpio_count =3D=3D 1 &amp;&amp; gpio_int_idx =3D=3D 0 ca=
se<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d092630e8a20 Input: i8042 - add Fujitsu L=
ifebook E5411 to i8042 quirk table<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07cea6fa2d73f Input: xpad - add PXN V900 s=
upport<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ff4e50e2d2a Input: psmouse - fix fast_re=
connect function for PS/2 mode<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06a4a39638640 Input: powermate - fix use-a=
fter-free in powermate_config_complete<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ad7f52d8c58 ceph: fix type promotion bug=
 on 32bit systems<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0c4acd53a98 ceph: fix incorrect revoked =
caps assert in ceph_fill_file_size()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058f0e6324ec7 libceph: use kernel_connect(=
)<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d727b97f8f2e thunderbolt: Check that lane=
 1 is in CL0 before enabling lane bonding<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A004c38bedd07c thunderbolt: Workaround an I=
OMMU fault on certain systems with Intel Maple Ridge<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a586742a3780 mcb: remove is_added flag fr=
om mcb_device struct<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04382d1a996e5 x86/cpu: Fix AMD erratum #14=
85 on Zen4-based CPUs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0763167003a80 ACPI: resource: Skip IRQ ove=
rride on ASUS ExpertBook B1402CBA<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0510d4a01d84c drm/amd/display: Don&#39;t s=
et dpms_off for seamless boot<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09cb61ab9f4ca drm/amdgpu: add missing NULL=
 check<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9a1af37b801 iio: pressure: ms5611: ms561=
1_prom_is_valid false negative bug<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A009b8ed9547f1 iio: pressure: dps310: Adjus=
t Timeout Settings<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04c80ecef859d iio: pressure: bmp280: Fix N=
ULL pointer exception<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a625de7e5464 usb: musb: Modify the &quot;=
HWVers&quot; register address<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb28694f6da8 usb: musb: Get the musb_qh p=
oniter after musb_giveback<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ee88141873a8 usb: cdns3: Modify the retur=
n value of cdns_set_active () to void when CONFIG_PM_SLEEP is disabled<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03b2dbc4f3302 usb: dwc3: Soft reset phy on=
 probe for host<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A042c56e015653 net: usb: dm9601: fix uninit=
ialized variable use in dm9601_mdio_read<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0524f45361789 usb: xhci: xhci-ring: Use sy=
sdev for mapping bounce buffer<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01d8e7fe85528 xhci: Keep interrupt disable=
d in initialization until host is running.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb34e3b25c37 dmaengine: stm32-mdma: abort=
 resume if no ongoing transfer<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d56dbfe750a8 media: mtk-jpeg: Fix use aft=
er free bug due to uncanceled work<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05e13e69ddf0d net: release reference to in=
et6_dev pointer<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aade10d51ddc net: change accept_ra_min_rt=
r_lft to affect all RA lifetimes<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f12d2d66cba net: add sysctl accept_ra_mi=
n_rtr_lft<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc9f6cbeb999 workqueue: Override implicit=
 ordered attribute in workqueue_apply_unbound_cpumask()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A025dd54b95abf nfc: nci: assert requested p=
rotocol is valid<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b2bb3b43b94a pinctrl: renesas: rzn1: Enab=
le missing PINMUX<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4140dd77c3b net/smc: Fix pos miscalculat=
ion in statistics<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d888d3f70b0d net: nfc: fix races in nfc_l=
lcp_sock_get() and nfc_llcp_sock_get_sn()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0249a1fdb95d5 net/mlx5e: Again mutually ex=
clude RX-FCS and RX-port-timestamp<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02112cacb38aa ixgbe: fix crash with empty =
VF macvlan list<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0935a15334d77 net: phy: mscc: macsec: reje=
ct PN update requests<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0667fe9101a3a net: macsec: indicate next p=
n update when offloading<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02dcb31e65d26 bpf: Fix verifier log for as=
ync callback return values<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06a217af2c67f drm/vmwgfx: fix typo of size=
of argument<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072ef70886556 riscv, bpf: Sign-extend retu=
rn values<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07795592e0818 riscv, bpf: Factor out emit_=
call for kernel and bpf context<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058941cc742ca xen-netback: use default TX =
queue size for vifs<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cffdced18af8 eth: remove copies of the NA=
PI_POLL_WEIGHT define<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05c360eec5332 mlxsw: fix mlxsw_sp2_nve_vxl=
an_learning_set() return type<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A084c6aa0ae5c4 ieee802154: ca8210: Fix a po=
tential UAF in ca8210_probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0616761cf9df9 ravb: Fix use-after-free iss=
ue in ravb_tx_timeout_work()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030ebd4177593 ravb: Fix up dma_free_cohere=
nt() call in ravb_remove()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f39de2bd1d2 drm/msm/dpu: change _dpu_pla=
ne_calc_bw() to use u64 to avoid overflow<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A085ae07d4dcc6 drm/msm/dsi: fix irq_of_pars=
e_and_map() error checking<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a890c7d4d0f drm/msm/dsi: skip the wait f=
or video mode done if not applicable<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b9de60b6830c drm/msm/dp: do not reinitial=
ize phy unless retry during link training<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0afe5f596b588 KEYS: trusted: Remove redund=
ant static calls usage<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020e73ece06b3 KEYS: trusted: allow use of =
kernel RNG for key material<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a01d68b6c666 ALSA: usb-audio: Fix microph=
one sound on Opencomm2 Headset<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05b5e58299eac net: prevent address rewrite=
 in kernel_bind()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056e96b38d2f7 quota: Fix slow quotaoff<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028ddc1e0b898 HID: logitech-hidpp: Fix ker=
nel crash on receiver USB disconnect<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b930f0f7bbc2 lib/test_meminit: fix off-by=
-one error in test_pages()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0982bd86fd659 platform/x86: hp-wmi:: Mark =
driver struct with __refdata to prevent section mismatch warning<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0124cf0ea4b82 platform/x86: think-lmi: Fix=
 reference leak<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03d2a16f878f0 of: overlay: Reorder struct =
fragment fields kerneldoc<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A010f4a0b6657e perf/arm-cmn: Fix the unhand=
led overflow status of counter 4 to 7<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b7966e2191d0 RDMA/cxgb4: Check skb value =
for failure to allocate<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b9bdffb3f9aa RDMA/srp: Do not call scsi_d=
one() from srp_abort()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d4999589ebc scsi: ib_srp: Call scsi_done=
() directly<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d2746cdfd5e5 scsi: core: Rename scsi_mq_d=
one() into scsi_done() and export it<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f2350e204da scsi: core: Use a structure =
member to track the SCSI command submitter<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A029298c85a81a iommu/vt-d: Avoid memory all=
ocation in iommu_suspend()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A002e21884dcf2 Linux 5.15.135<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8af81a9d36e xen/events: replace evtchn_r=
wlock with RCU<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c346494ec7f1 parisc: Restore __ldcw_align=
 for PA-RISC 2.0 processors<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0694e13732e83 ksmbd: fix uaf in smb20_oplo=
ck_break_ack<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e914c3a47e45 RDMA/mlx5: Fix NULL string e=
rror<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A081b7bf367eea RDMA/siw: Fix connection fai=
lure handling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05d8bd138204f RDMA/uverbs: Fix typo of siz=
eof argument<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A060c9ed88526d RDMA/cma: Fix truncation com=
pilation warning in make_cma_ports<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07f6136ced1b8 RDMA/cma: Initialize ib_sa_m=
ulticast structure to 0 when join<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01dd6095fc727 gpio: pxa: disable pinctrl c=
alls for MMP_GPIO<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0844fcf4c697c gpio: aspeed: fix the GPIO n=
umber passed to pinctrl_gpio_set_config()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01878d6666c32 IB/mlx4: Fix the size of a b=
uffer in add_port_entries()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0718d9b44afca of: dynamic: Fix potential m=
emory leak in of_changeset_action()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0878f38b661 RDMA/core: Require admin cap=
abilities to set system parameters<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A018a839064fc6 dm zoned: free dmz-&gt;ddev =
array in dmz_put_zoned_devices<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08781fe259dd5 HID: intel-ish-hid: ipc: Dis=
able and reenable ACPI GPE bit<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0949ccc91c35b HID: sony: remove duplicate =
NULL check before calling usb_free_urb()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a02c02adc2bd sctp: update hb timer immedi=
ately after users change hb_interval<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07783b471bfce sctp: update transport state=
 when processing a dupcook packet<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01abac613c0d5 tcp: fix delayed ACKs for MS=
S boundary condition<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0821b3b00bc0f tcp: fix quick-ack counting =
to count actual ACKs of new data<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024fb22bddb71 tipc: fix a potential deadlo=
ck on &amp;tx-&gt;lock<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02e53585e233c net: stmmac: dwmac-stm32: fi=
x resume on STM32 MCU<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A074e569324050 ipv4: Set offload_failed fla=
g in fibmatch results<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a4b9bbd1d12f netfilter: nf_tables: nft_se=
t_rbtree: fix spurious insertion failure<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A088497f74d684 netfilter: handle the connec=
ting collision properly in nf_conntrack_proto_sctp<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c9cf5e8807f ibmveth: Remove condition to=
 recompute TCP header checksum.<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a899e2ce848 net: ethernet: ti: am65-cpsw=
: Fix error code in am65_cpsw_nuss_init_tx_chns()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04837a192f6d0 net: nfc: llcp: Add lock whe=
n modifying device list<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cda10784a176 net: usb: smsc75xx: Fix unin=
it-value access in __smsc75xx_read_reg<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02801a1ddb26d net: dsa: mv88e6xxx: Avoid E=
EPROM timeout when EEPROM is absent<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb145e6c2070 ptp: ocp: Fix error handling=
 in ptp_ocp_device_init<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd1189956393 ipv4, ipv6: Fix handling of =
transhdrlen in __ip{,6}_append_data()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0147d89ee4143 net: fix possible store tear=
ing in neigh_periodic_work()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bdb4fcf18e16 modpost: add missing else to=
 the &quot;of&quot; check<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc8b89b69638 bpf, sockmap: Reject sk_msg =
egress redirects to non-TCP sockets<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09fb4dfb8e212 NFSv4: Fix a nfs4_state_mana=
ger() race<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fcdd79fda38a ima: rework CONFIG_IMA depen=
dency block<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b67adca1e1be scsi: target: core: Fix dead=
lock due to recursive locking<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a103e0b100c ima: Finish deprecation of I=
MA_TRUSTED_KEYRING Kconfig<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb6aee0696c6 regmap: rbtree: Fix wrong re=
gister marked as in-cache when creating new node<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00cee8c1b3af3 wifi: mt76: mt76x02: fix MT7=
6x0 external LNA gain handling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f6fbbccba2d drivers/net: process the res=
ult of hdlc_open() and add call of hdlc_close() in uhdlc_close()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ebad2e4c4847 bpf: Fix tr dereferencing<br=
>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05afb996349cb wifi: mwifiex: Fix oob check=
 condition in mwifiex_process_rx_packet<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c8faa310803 wifi: iwlwifi: mvm: Fix a me=
mory corruption issue<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05db7af530ebd iwlwifi: avoid void pointer =
arithmetic<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ff75f524dae wifi: iwlwifi: dbg_ini: fix =
structure packing<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00ea2a6349733 ubi: Refuse attaching if mtd=
&#39;s erasesize is 0<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb0707fde749 HID: sony: Fix a potential m=
emory leak in sony_probe()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08afbacf61919 arm64: Add Cortex-A520 CPU p=
art definition<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00da6d21ba235 drm/amd: Fix detection of _P=
R3 on the PCIe root port<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01ad7ccd45a65 net: prevent rewrite of msg_=
name in sock_sendmsg()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00fb3df94274b net: replace calls to sock-&=
gt;ops-&gt;connect() with kernel_connect()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A037b54e8acea5 wifi: mwifiex: Fix tlv_buf_l=
eft calculation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e80f55d6d2a9 qed/red_ll2: Fix undefined b=
ehavior bug in struct qed_ll2_info<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01e69422efcc6 vringh: don&#39;t use vringh=
_kiov_advance() in vringh_iov_xfer()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04e2f83952b1d scsi: zfcp: Fix a double put=
 in zfcp_port_enqueue()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0310bca649b30 Revert &quot;clk: imx: pll14=
xx: dynamically configure PLL for 393216000/361267200Hz&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f59e63568ad block: fix use-after-free of=
 q-&gt;q_usage_counter<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b75b017b3f37 rbd: take header_rwsem in rb=
d_dev_refresh() only when updating<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A033229d783466 rbd: decouple parent info re=
ad-in from updating rbd_dev<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ab73e7ed79d3 rbd: decouple header read-in=
 from updating rbd_dev-&gt;header<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b4ddad3fb0ea rbd: move rbd_dev_refresh() =
definition<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb1fae816c90 iommu/arm-smmu-v3: Avoid con=
structing invalid range commands<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4edc7b5c836 iommu/arm-smmu-v3: Set TTL i=
nvalidation hint better<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a98ad3adf60d arm64: Avoid repeated AA64MM=
FR1_EL1 register read on pagefault path<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aad6ba1715ec ring-buffer: Fix bytes info =
in per_cpu buffer stats<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08012d0b05158 ring-buffer: remove obsolete=
 comment for free_buffer_page()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A065a218ca516e NFSv4: Fix a state manager t=
hread deadlock regression<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08454a2f5e930 NFS: rename nfs_client_kset =
to nfs_kset<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f8b0b6a8e196 NFS: Cleanup unused rpc_clnt=
 variable<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0686746be7bfb ASoC: tegra: Fix redundant P=
LLA and PLLA_OUT0 updates<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a210e63844b ASoC: soc-utils: Export snd_=
soc_dai_is_dummy() symbol<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b4f7f1556813 spi: zynqmp-gqspi: fix clock=
 imbalance on probe failure<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e514f897ad66 spi: zynqmp-gqspi: Convert t=
o platform remove callback returning void<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01edcec18cfb7 Linux 5.15.134<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A009a683023785 netfilter: nf_tables: fix kd=
oc warnings after gc rework<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066cb6d74f5a1 drm/meson: fix memory leak o=
n -&gt;hpd_notify callback<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A091f1f025b6d9 fs: binfmt_elf_efpic: fix pe=
rsonality for ELF-FDPIC<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01cae7473a6dd ata: libata-sata: increase P=
MP SRST timeout to 10s<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e74adc589922 ata: libata-core: Do not reg=
ister PM operations for SAS ports<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04cbd55a81965 ata: libata-core: Fix port a=
nd device removal<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ddc525fffb44 ata: libata-core: Fix ata_po=
rt_request_pm() locking<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02990a195edb5 net: thunderbolt: Fix TCPv6 =
GSO checksum calculation<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0132a5ae4136b bpf: Fix BTF_ID symbol gener=
ation collision in tools/<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058d560e98da5 bpf: Fix BTF_ID symbol gener=
ation collision<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f8673f651bc1 btrfs: properly report 0 ava=
il for very full file systems<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b5d00cd7db66 ring-buffer: Update &quot;sh=
ortest_full&quot; in polling<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A000d2cb8066cb proc: nommu: /proc/&lt;pid&g=
t;/maps: release mmap read lock<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A040527ebb3e45 Revert &quot;SUNRPC dont upd=
ate timeout value on connection reset&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2b1d486fb70 io_uring/fs: remove sqe-&gt;=
rw_flags checking from LINKAT<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0111fe77cb13f sched/rt: Fix live lock betw=
een select_fallback_rq() and RT push<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03569ad59664f kernel/sched: Modify initial=
 boot task idle setup<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A007f78e97676c i2c: i801: unregister tco_pd=
ev in i801_probe() error path<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070df8b9c59bc ata: libata-scsi: ignore res=
erved bits for REPORT SUPPORTED OPERATION CODES<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7e0c10a8c33 ALSA: hda: Disable power sav=
e for solving pop issue on Lenovo ThinkCentre M70q<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c5fd85fb01f netfilter: nf_tables: disall=
ow rule removal from chain binding<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03936e8714907 nilfs2: fix potential use af=
ter free in nilfs_gccache_submit_read_data()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02b837f13a818 serial: 8250_port: Check IRQ=
 data before use<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a48d2bcd23f2 Revert &quot;tty: n_gsm: fix=
 UAF in gsm_cleanup_mux&quot;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A078e70c6238d2 misc: rtsx: Fix some platfor=
ms can not boot and move the l1ss judgment to probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f090a8b4d2e3 x86/srso: Add SRSO mitigatio=
n for Hygon processors<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f5a604757aa8 iommu/arm-smmu-v3: Fix soft =
lockup triggered by arm_smmu_mm_invalidate_range<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0efce75bd2dbc Smack:- Use overlay inode la=
bel in smack_inode_copy_up()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00e3450487f99 smack: Retrieve transmuting =
information in smack_inode_getsecurity()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03586b3feed1b smack: Record transmuting in=
 smk_transmuted<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09690ad557d94 nvme-pci: always return an E=
RR_PTR from nvme_pci_alloc_dev<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03c29c6e8cd7c scsi: qla2xxx: Fix NULL poin=
ter dereference in target mode<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06e5e4223c897 i40e: fix potential NULL poi=
nter dereferencing of pf-&gt;vf i40e_sync_vsi_filters()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aff3994d4bdd watchdog: iTCO_wdt: Set NO_R=
EBOOT if the watchdog is not already running<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A083a30e945571 watchdog: iTCO_wdt: No need =
to stop the timer in probe<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01e8c573f50a7 nvme-pci: do not set the NUM=
A node of device if it has none<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0182d13dadb03 nvme-pci: factor out a nvme_=
pci_alloc_dev helper<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0af58072e867c nvme-pci: factor the iod mem=
pool creation into a helper<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8bc44936f2c cgroup: Fix suspicious rcu_d=
ereference_check() usage warning<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ce6b88a5853d sched/cpuacct: Optimize away=
 RCU read lock<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b1deb155524e perf build: Define YYNOMEM a=
s YYNOABORT for bison &lt; 3.81<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A086e65ffc4d0f fbdev/sh7760fb: Depend on FB=
=3Dy<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04bf0044fe43f ncsi: Propagate carrier gain=
/loss events to the NCSI controller<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0288990ec3580 powerpc/watchpoints: Annotat=
e atomic context in more places<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A047a94e87f00c powerpc/watchpoint: Disable =
pagefaults when getting user instruction<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07eb09f70d9c2 powerpc/watchpoints: Disable=
 preemption in thread_change_pc()<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0134b01a39077 media: vb2: frame_vector.c: =
replace WARN_ONCE with a comment<br>
&gt; &gt; </blockquote></div></div>

--0000000000002501be0613002096--

