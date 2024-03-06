Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FB7C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 17:38:34 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.76.1709746713118552725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 09:38:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=msC3rIfQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.171, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60978479651so68444437b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 09:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709746712; x=1710351512; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yMIqrJ9E4wgOHxTZ5AXEBLzEcyAySfAoHnae5mmbOPI=;
        b=msC3rIfQ8DdgcaT0MFaeU+VpUrOVjJN7SgN1Hb4xop0DxtTc4F/6FuXqcFCBQaBJH4
         GBMerjP7BFrwez7A1PSeTR8MFlYWHXm/ewXTZoHMhPCfYfelGxjqvQmWWrwo0mJaIT36
         pXQwJv/NBQnhZx0ohdfnNiHDRQAhnliinxllruVOnw5lo6VUuj1X03TbeyvZllUrufzA
         Ns5ovfly6ZovSaX6BZI6Dl8elXjpNpi4+JTChYueNQyZpjoUT7l7GdUeERuz5zUokA4M
         wXMPCoe0PsFHTpU2FN8WV2zjSllJ2QB3LY638Yo19fRl4Iyp2ukkKVIMFKA2ey3yiwlU
         hAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709746712; x=1710351512;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMIqrJ9E4wgOHxTZ5AXEBLzEcyAySfAoHnae5mmbOPI=;
        b=GYi0QdoSgZ8AVsNgKPbcETmars1Ssuuusnn6SaX2hfiDRH8de0dqssyKNNN/CLgcfS
         WBGhb2j/tmSvnuh2i6Y/YtdeH0exorJznHoo6aMD/ZcXRqMJijeAJCwA4cOzX5FC4YU8
         +ZbteIC7ydD4O/ov1H5kJPD7dzg8w6K29bp3hFdPquw27vEieA27zsQc8+veo45LIZ+9
         ktpoHrLml7rVsBeG6vwyf4OmpTzC9QOMdZhm39oz1/YS2Zw/sarnUkvwQ+zQX5jTpSG/
         ULpmtB/VGsU8VRv90Bh8j6KEFPjCncciwtcMX1CywnXxmMHj6ag00pvxDr9mVwyfM4G9
         LOAA==
X-Forwarded-Encrypted: i=1; AJvYcCUASUA4k/DoYHJt9vPu3e+Y4yUydNN0wMAp16Zq45MwYiHhA1l1dpL7AvcslSQDv8j6n6p/FwweqRz636mA+V6lzmtCIqdkLanLkge7uELRPzQ44P6ae8/q
X-Gm-Message-State: AOJu0YyiqknemofGmvMp3mUQOwYbYcQMdsbJvuRuvBm4uQuVmqH+RwTT
	rUSYMF/lYkLaOtlbNVMwrYKtqeJSNvsOqZD+DU1OjTDYGlcocgB1AwP5HKj6MzUwcVH+Q0+/KhN
	3z9wbZQ6OGBVmeeARfJXasiojNqWrusYX1PsduQ==
X-Google-Smtp-Source: AGHT+IH22HCWwluEUi9Q9DGYrD8tnEXmhtVNk2EFU2sTVvSuLvRK/rvdupxGJyKYqHAcdzzDawRxBF9c9O4oiibYPyQ=
X-Received: by 2002:a81:4904:0:b0:609:bff8:657d with SMTP id
 w4-20020a814904000000b00609bff8657dmr8209843ywa.28.1709746710348; Wed, 06 Mar
 2024 09:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20231205044036.4163615-1-bruce.ashfield@gmail.com>
 <20231205044036.4163615-5-bruce.ashfield@gmail.com> <CAOSpxdZU+CoRTo=Xz+C3dk44ubHLSa7pis7sa4CyVMGJnY1_EA@mail.gmail.com>
 <CAOSpxdYcFTMY-m9TDB-wAVXu70v5DkmGfH8UjH2dLKDY-x0AbA@mail.gmail.com>
 <CADkTA4NhG1AciK=QkaYiajfXfuqc1YQ9=qJBssoKSQh4GOMcvQ@mail.gmail.com> <17BA3874E3FB1D6A.21429@lists.openembedded.org>
In-Reply-To: <17BA3874E3FB1D6A.21429@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 6 Mar 2024 07:38:06 -1000
Message-ID: <CAOSpxdYFR72uWeix5mKTJY5R-bewDQO0jMh5obByiz0h7WgDyw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 4/4] linux-yocto/5.15: update to v5.15.141
To: Steve Sakoman <steve@sakoman.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000053a4c80613016df3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 17:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196749

--00000000000053a4c80613016df3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 6:04=E2=80=AFAM Steve Sakoman via lists.openembedded=
.org
<steve=3Dsakoman.com@lists.openembedded.org> wrote:
>
> On Wed, Mar 6, 2024 at 5:59=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gma=
il.com>
wrote:
> >
> > On Wed, Mar 6, 2024 at 10:43=E2=80=AFAM Steve Sakoman <steve@sakoman.co=
m> wrote:
> > >
> > > On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM Steve Sakoman <steve@sakoman.c=
om>
wrote:
> > > >
> > > > Hi Bruce,
> > > >
> > > > The 5.10 version bumps look fine in testing, but sadly this 5.15
> > > > version bump breaks qemux86-64-ptest:
> > > >
> > > > AssertionError: Failed ptests:
> > > > {'parted': ['t1104-remove-and-add-partition.sh',
> > > >             't8000-loop.sh',
> > > >             't8001-loop-blkpg.sh']}
> > > >
> > > > Failure is reproducible 100% of the time, so there is that ...
> > >
> > > After  wading through the hundreds of changes in this version bump
> > > from 5.15.124 to 5.15.141 I found this in the 5.13.132 portion that
> > > looks suspicious:
> > >
> > > 072cd213c64f block: don't add or resize partition on the disk with
> > > GENHD_FL_NO_PART
> > > c6ce1c5dd327 block: rename GENHD_FL_NO_PART_SCAN to GENHD_FL_NO_PART
> > >
> >
> > It could very well be that, I haven't been able to get to any local
> > testing on this
> > yet.
> >
> > I will go look at parted for commits that indicate they are fixing a
> > kernel interface
> > that sounds similar .. since we don't want to revert an offending
commit, the
> > way to fix this is via selective update of parted.
>
> I'm doing a test kirkstone build that bumps parted to the same version
> as in master.
>
> This will at least let us know whether it has been fixed in upstream
parted.

The test completed and I get the same failure with the most recent parted
version.

So apparently not fixed in parted.

Steve
> > > > On Mon, Dec 4, 2023 at 6:40=E2=80=AFPM <bruce.ashfield@gmail.com> w=
rote:
> > > > >
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >
> > > > > Updating  to the latest korg -stable release that comprises
> > > > > the following commits:
> > > > >
> > > > >     9b91d36ba301 Linux 5.15.141
> > > > >     313a34d1c0ee io_uring: fix off-by one bvec index
> > > > >     49ae2e4e8ed3 USB: dwc3: qcom: fix wakeup after probe deferral
> > > > >     eb17fb4b160a USB: dwc3: qcom: fix software node leak on probe
errors
> > > > >     98f0e9b6276f usb: dwc3: set the dma max_seg_size
> > > > >     1a3dcb1d811d usb: dwc3: Fix default mode initialization
> > > > >     a22702a81844 USB: dwc2: write HCINT with INTMASK applied
> > > > >     1134fde92088 usb: typec: tcpm: Skip hard reset when in error
recovery
> > > > >     64830d041515 USB: serial: option: don't claim interface 4 for
ZTE MF290
> > > > >     9611cbc6a132 USB: serial: option: fix FM101R-GL defines
> > > > >     a8d80b1fbacf USB: serial: option: add Fibocom L7xx modules
> > > > >     de8c6fce8d09 usb: cdnsp: Fix deadlock issue during using NCM
gadget
> > > > >     dd0cc4b69f7d bcache: fixup lock c->root error
> > > > >     a912742d8411 bcache: fixup init dirty data errors
> > > > >     137660f84462 bcache: prevent potential division by zero error
> > > > >     f7077ce8d97b bcache: check return value from
btree_node_alloc_replacement()
> > > > >     1eed01092101 dm-delay: fix a race between delay_presuspend
and delay_bio
> > > > >     d181a7a1d55d hv_netvsc: Mark VF as slave before exposing it
to user-mode
> > > > >     97683466e24c hv_netvsc: Fix race of
register_netdevice_notifier and VF register
> > > > >     3841921018a2 USB: serial: option: add Luat Air72*U series
products
> > > > >     6062c527d040 s390/dasd: protect device queue against
concurrent access
> > > > >     35b5d86e43ec io_uring/fs: consider link->flags when getting
path for LINKAT
> > > > >     2bb75a2c3490 bcache: fixup multi-threaded
bch_sectors_dirty_init() wake-up race
> > > > >     6f09318fd90a md: fix bi_status reporting in md_end_clone_io
> > > > >     72ecb9753cbe bcache: replace a mistaken IS_ERR() by
IS_ERR_OR_NULL() in btree_gc_coalesce()
> > > > >     e09ba90f1ad0 swiotlb-xen: provide the "max_mapping_size"
method
> > > > >     0f05021e937c ACPI: resource: Skip IRQ override on ASUS
ExpertBook B1402CVA
> > > > >     f95e9f7afe86 proc: sysctl: prevent aliased sysctls from
getting passed to init
> > > > >     3f3880fc011c ext4: make sure allocate pending entry not fail
> > > > >     e33eb4997585 ext4: fix slab-use-after-free in
ext4_es_insert_extent()
> > > > >     859893f61906 ext4: using nofail preallocation in
ext4_es_insert_extent()
> > > > >     048e7f38b31c ext4: using nofail preallocation in
ext4_es_insert_delayed_block()
> > > > >     580b9dd6ab0b ext4: using nofail preallocation in
ext4_es_remove_extent()
> > > > >     66bc78a295b3 ext4: use pre-allocated es in
__es_remove_extent()
> > > > >     b1995ba6269c ext4: use pre-allocated es in
__es_insert_extent()
> > > > >     edec12712ae1 ext4: factor out __es_alloc_extent() and
__es_free_extent()
> > > > >     e82d05cf5ccb ext4: add a new helper to check if es must be
kept
> > > > >     612edd488872 media: qcom: camss: Fix csid-gen2 for test
pattern generator
> > > > >     ceb5276d8c99 media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE
when VC is greater than 3
> > > > >     f001e6f62693 media: camss: sm8250: Virtual channels for CSID
> > > > >     9fb81ca7aa05 media: camss: Replace hard coded value with
parameter
> > > > >     8ef9b32f20ab MIPS: KVM: Fix a build warning about variable
set but not used
> > > > >     6ddaca6b20f7 lockdep: Fix block chain corruption
> > > > >     61747778a88b USB: dwc3: qcom: fix ACPI platform device leak
> > > > >     027472889970 USB: dwc3: qcom: fix resource leaks on probe
deferral
> > > > >     e26c6febac43 nvmet: nul-terminate the NQNs passed in the
connect command
> > > > >     b5d50c6a609d afs: Fix file locking on R/O volumes to operate
in local mode
> > > > >     84ebfbed3ae0 afs: Return ENOENT if no cell DNS record can be
found
> > > > >     6aeac88a45de net: axienet: Fix check for partial TX checksum
> > > > >     293acba84108 amd-xgbe: propagate the correct speed and duplex
status
> > > > >     b3874cc25a70 amd-xgbe: handle the corner-case during tx
completion
> > > > >     e949dbc28cd5 amd-xgbe: handle corner-case during sfp hotplug
> > > > >     01a8b94726b1 octeontx2-pf: Fix ntuple rule creation to direct
packet to VF with higher Rx queue than its PF
> > > > >     fcc4a03ad3b1 arm/xen: fix xen_vcpu_info allocation alignment
> > > > >     90072af9efe8 net/smc: avoid data corruption caused by decline
> > > > >     66c023469b3e net: usb: ax88179_178a: fix failed operations
during ax88179_reset
> > > > >     ba81c5228ef8 ipv4: Correct/silence an endian warning in
__ip_do_redirect
> > > > >     364406d4c114 HID: fix HID device resource race between HID
core and debugging support
> > > > >     52badc06b119 HID: core: store the unique system identifier in
hid_device
> > > > >     221be624a55d drm/rockchip: vop: Fix color for RGB888/BGR888
format on VOP full
> > > > >     b0c835fd7d89 ata: pata_isapnp: Add missing error check for
devm_ioport_map()
> > > > >     9754a498aa5b octeontx2-pf: Fix memory leak during interface
down
> > > > >     be41c0c4a632 wireguard: use DEV_STATS_INC()
> > > > >     f163a6d17a95 drm/panel: simple: Fix Innolux G101ICE-L01
timings
> > > > >     608de3a587eb drm/panel: simple: Fix Innolux G101ICE-L01 bus
flags
> > > > >     18bd108a13cb drm/panel: auo,b101uan08.3: Fine tune the panel
power sequence
> > > > >     9fe5718d3f09 drm/panel: boe-tv101wum-nl6: Fine tune the panel
power sequence
> > > > >     c8a49336e1de afs: Make error on cell lookup failure
consistent with OpenAFS
> > > > >     ac239fccf5a5 afs: Fix afs_server_list to be cleaned up with
RCU
> > > > >     a78d278e01b1 Linux 5.15.140
> > > > >     947c9e12ddd6 driver core: Release all resources during unbind
before updating device links
> > > > >     5a434d5c3823 Input: xpad - add VID for Turtle Beach
controllers
> > > > >     cbc7c29dff0f tracing: Have trace_event_file have ref counters
> > > > >     1dcf90c9fa01 powerpc/powernv: Fix fortify source warnings in
opal-prd.c
> > > > >     3d7912710e5e io_uring/fdinfo: lock SQ thread while retrieving
thread cpu/pid
> > > > >     595b051c83a1 drm/amd/display: Change the DMCUB mailbox memory
location from FB to inbox
> > > > >     a2a6e97c4b33 drm/amdgpu: fix error handling in
amdgpu_bo_list_get()
> > > > >     e380992c479b drm/amdgpu: don't use ATRM for external devices
> > > > >     4ff985b8810c drm/i915: Fix potential spectre vulnerability
> > > > >     ea0c4d5ec57f drm/amd/pm: Handle non-terminated overdrive
commands.
> > > > >     9ce842d7762a ext4: add missed brelse in update_backups
> > > > >     ce19c20064b6 ext4: remove gdb backup copy for meta bg in
setup_new_flex_group_blocks
> > > > >     ac45d8e34bed ext4: correct the start block of counting
reserved clusters
> > > > >     8f9842c4b925 ext4: correct return value of
ext4_convert_meta_bg
> > > > >     8798d3b2722d ext4: correct offset of gdb backup in non
meta_bg group to update_backups
> > > > >     8a3bb38bfdaf ext4: apply umask if ACL support is disabled
> > > > >     d5c380149b96 Revert "net: r8169: Disable multicast filter for
RTL8168H and RTL8107E"
> > > > >     6ad3d8594d5e media: qcom: camss: Fix missing vfe_lite clocks
check
> > > > >     e0376cf06950 media: qcom: camss: Fix VFE-17x
vfe_disable_output()
> > > > >     8f733387d17f media: qcom: camss: Fix vfe_get() error jump
> > > > >     841fc648fbb5 media: qcom: camss: Fix pm_domain_on sequence in
probe
> > > > >     4c9c43f79a12 mmc: sdhci-pci-gli: GL9750: Mask the replay
timer timeout of AER
> > > > >     72bf271c5a77 r8169: fix network lost after resume on DASH
systems
> > > > >     468e3ebf4786 mm: kmem: drop __GFP_NOFAIL when allocating
objcg vectors
> > > > >     0387978fda07 mmc: sdhci-pci-gli: A workaround to allow GL9750
to enter ASPM L1.2
> > > > >     070b3ccb9b8b riscv: kprobes: allow writing to x0
> > > > >     cd0e9f475a46 nfsd: fix file memleak on client_opens_release
> > > > >     114c9d732cf9 media: ccs: Correctly initialise try compose
rectangle
> > > > >     6c8aeeb2c549 media: venus: hfi: add checks to handle
capabilities from firmware
> > > > >     cdeb0a4cf327 media: venus: hfi: fix the check to handle
session buffer requirement
> > > > >     7d62570f75fe media: venus: hfi_parser: Add check to keep the
number of codecs within range
> > > > >     d0d831e7d68d media: sharp: fix sharp encoding
> > > > >     6003733c8f95 media: lirc: drop trailing space from scancode
transmit
> > > > >     e4088d7d8f11 f2fs: avoid format-overflow warning
> > > > >     12055238d046 i2c: i801: fix potential race in
i801_block_transaction_byte_by_byte
> > > > >     336e6db5c120 net: phylink: initialize carrier state at
creation
> > > > >     d8cb287d31cb net: dsa: lan9303: consequently nested-lock
physical MDIO
> > > > >     656262cb0f95 net: ethtool: Fix documentation of
ethtool_sprintf()
> > > > >     acca20cc16f3 s390/ap: fix AP bus crash on early config change
callback invocation
> > > > >     019b7d42a416 i2c: designware: Disable TX_EMPTY irq while
waiting for block length byte
> > > > >     c6e89348fd58 sbsa_gwdt: Calculate timeout with 64-bit math
> > > > >     132670ae9ffb lsm: fix default return value for inode_getsecct=
x
> > > > >     223196b50605 lsm: fix default return value for
vm_enough_memory
> > > > >     06d320ca170b Revert "i2c: pxa: move to generic GPIO recovery"
> > > > >     ddec3d04f874 Revert ncsi: Propagate carrier gain/loss events
to the NCSI controller
> > > > >     ad0b74d0f331 powerpc/pseries/ddw: simplify enable_ddw()
> > > > >     b3e993de400e arm64: dts: qcom: ipq6018: Fix tcsr_mutex
register size
> > > > >     b99ac20612ca arm64: dts: qcom: ipq6018: switch TCSR mutex to
MMIO
> > > > >     aaf0a07d6088 ksmbd: fix slab out of bounds write in
smb_inherit_dacl()
> > > > >     1c701423bb03 Bluetooth: btusb: Add 0bda:b85b for Fn-Link
RTL8852BE
> > > > >     36a573b32550 Bluetooth: btusb: Add RTW8852BE device 13d3:3570
to device tables
> > > > >     c4976160a0a4 bluetooth: Add device 13d3:3571 to device tables
> > > > >     603e77e9e8c0 bluetooth: Add device 0bda:887b to device tables
> > > > >     e9bb966c50a7 Bluetooth: btusb: Add Realtek RTL8852BE support
ID 0x0cb8:0xc559
> > > > >     cf642ee641ce cpufreq: stats: Fix buffer overflow detection in
trans_stats()
> > > > >     63e09cdfe948 regmap: Ensure range selector registers are
updated after cache sync
> > > > >     0c49e74e95bf tty: serial: meson: fix hard LOCKUP on crtscts
mode
> > > > >     6f26b6a61b08 serial: meson: Use platform_get_irq() to get the
interrupt
> > > > >     450fa8bf803f ALSA: hda/realtek - Enable internal speaker of
ASUS K6500ZC
> > > > >     cc549ba50bb8 ALSA: hda/realtek - Add Dell ALC295 to pin fall
back table
> > > > >     767c988771cb ALSA: info: Fix potential deadlock at
disconnection
> > > > >     09022ae66261 xhci: Enable RPM on controllers that support
low-power states
> > > > >     68574fe2e488 parisc/pgtable: Do not drop upper 5 address bits
of physical address
> > > > >     ea7593c18ff7 parisc: Prevent booting 64-bit kernels on PA1.x
machines
> > > > >     2c9092e8b29a i3c: master: svc: fix SDA keep low when polling
IBIWON timeout happen
> > > > >     da754f92fc02 i3c: master: svc: fix check wrong status
register in irq handler
> > > > >     5ba77b6b45d6 i3c: master: svc: fix ibi may not return
mandatory data byte
> > > > >     e0a70ed4a580 i3c: master: svc: fix wrong data return when IBI
happen during start frame
> > > > >     7383675aba2f i3c: master: svc: fix race condition in ibi work
thread
> > > > >     cc7efd1054f4 i3c: master: cdns: Fix reading status register
> > > > >     d3c6a08c2b77 mtd: cfi_cmdset_0001: Byte swap OTP info
> > > > >     a4668088128d mm/memory_hotplug: use pfn math in place of
direct struct page manipulation
> > > > >     792a796085cf mm/cma: use nth_page() in place of direct struct
page manipulation
> > > > >     9b59fc31226e s390/cmma: fix detection of DAT pages
> > > > >     45bb94aab891 dmaengine: stm32-mdma: correct desc prep when
channel running
> > > > >     91659b77e937 mcb: fix error handling for different scenarios
when parsing
> > > > >     534790fde890 tracing: Have the user copy of synthetic event
address use correct context
> > > > >     f6237afabc34 i2c: core: Run atomic i2c xfer when !preemptible
> > > > >     931aa7154bc4 kernel/reboot: emergency_restart: Set correct
system_state
> > > > >     7a3424c3b76a quota: explicitly forbid quota files from being
encrypted
> > > > >     47f509832168 jbd2: fix potential data lost in recovering
journal raced with synchronizing fs bdev
> > > > >     f13e1ea45699 ASoC: codecs: wsa-macro: fix uninitialized stack
variables with name prefix
> > > > >     28436d8092ad selftests/resctrl: Reduce failures due to
outliers in MBA/MBM tests
> > > > >     6ce63598a1fb selftests/resctrl: Remove duplicate feature
check from CMT test
> > > > >     e90efe17fc07 netfilter: nf_tables: split async and sync
catchall in two functions
> > > > >     0d9506c766c9 netfilter: nf_tables: remove catchall element in
GC sync path
> > > > >     96fc7a50a278 PCI: keystone: Don't discard .probe() callback
> > > > >     e0d394df9812 PCI: keystone: Don't discard .remove() callback
> > > > >     f4f12667167c KEYS: trusted: Rollback init_trusted()
consistently
> > > > >     c407ff72fb3a genirq/generic_chip: Make
irq_remove_generic_chip() irqdomain aware
> > > > >     bc8a14e3c630 mmc: meson-gx: Remove setting of CMD_CFG_ERROR
> > > > >     3a51e6b4da71 wifi: ath11k: fix htt pktlog locking
> > > > >     426e718ce9ba wifi: ath11k: fix dfs radar event locking
> > > > >     e9d84413b1b7 wifi: ath11k: fix temperature event locking
> > > > >     5ff849948c11 ima: detect changes to the backing overlay file
> > > > >     4584a421a6d9 ima: annotate iint mutex to avoid lockdep false
positive warnings
> > > > >     4049576c639f ACPI: FPDT: properly handle invalid FPDT
subtables
> > > > >     628e76e684c8 firmware: qcom_scm: use 64-bit calling
convention only when client is 64-bit
> > > > >     6eb8c191e360 btrfs: don't arbitrarily slow down delalloc if
we're committing
> > > > >     0b99626b28ca rcu: kmemleak: Ignore kmemleak false positives
when RCU-freeing objects
> > > > >     71f5344f477c PM: hibernate: Clean up sync_read handling in
snapshot_write_next()
> > > > >     57dbc0eb8abe PM: hibernate: Use __get_safe_page() rather than
touching the list
> > > > >     87a30633b5d3 arm64: dts: qcom: ipq6018: Fix hwlock index for
SMEM
> > > > >     ebaee06a7292 rcu/tree: Defer setting of jiffies during stall
reset
> > > > >     057d1034d012 svcrdma: Drop connection after an RDMA Read erro=
r
> > > > >     541b3757fd44 wifi: wilc1000: use vmm_table as array in wilc
struct
> > > > >     b156f62f19da PCI: exynos: Don't discard .remove() callback
> > > > >     f88796721002 PCI/ASPM: Fix L1 substate handling in
aspm_attr_store_common()
> > > > >     467864d55b52 mmc: sdhci_am654: fix start loop index for TAP
value parsing
> > > > >     ef34a97bb9cb mmc: vub300: fix an error code
> > > > >     36adb6204cff clk: qcom: ipq6018: drop the CLK_SET_RATE_PARENT
flag from PLL clocks
> > > > >     090b167b2c41 clk: qcom: ipq8074: drop the CLK_SET_RATE_PARENT
flag from PLL clocks
> > > > >     18640a1818f1 clk: socfpga: Fix undefined behavior bug in
struct stratix10_clock_data
> > > > >     4d17b54c9be3 parisc/pdc: Add width field to struct pdc_model
> > > > >     936c9c10efae arm64: Restrict CPU_BIG_ENDIAN to GNU as or LLVM
IAS 15.x or newer
> > > > >     8b24bb54bf3a ACPI: resource: Do IRQ override on TongFang
GMxXGxx
> > > > >     5619c34d3c4c watchdog: move softlockup_panic back to
early_param
> > > > >     a6c3a1fe09a2 PCI/sysfs: Protect driver's D3cold preference
from user space
> > > > >     01975bee0a14 hvc/xen: fix event channel handling for
secondary consoles
> > > > >     cfd543c10871 hvc/xen: fix error path in xen_hvc_init() to
always register frontend driver
> > > > >     730e08cb9101 hvc/xen: fix console unplug
> > > > >     fa0b93a3de40 tty/sysrq: replace smp_processor_id() with
get_cpu()
> > > > >     92e6c0f00d38 audit: don't WARN_ON_ONCE(!current->mm) in
audit_exe_compare()
> > > > >     e29c095f1ad4 audit: don't take task_lock() in
audit_exe_compare() code path
> > > > >     5eb6519f483e KVM: x86: Ignore MSR_AMD64_TW_CFG access
> > > > >     1c49ef7041f2 KVM: x86: hyper-v: Don't auto-enable stimer on
write from user-space
> > > > >     fe6b461c37cb x86/cpu/hygon: Fix the CPU topology evaluation
for real
> > > > >     3a2adf48d8b1 crypto: x86/sha - load modules based on CPU
features
> > > > >     be079aa71a12 scsi: qla2xxx: Fix system crash due to bad
pointer access
> > > > >     6ba3569f78d3 scsi: megaraid_sas: Increase register read retry
rount from 3 to 30 for selected registers
> > > > >     6a33b5810031 scsi: mpt3sas: Fix loop logic
> > > > >     3c5aede46cdc bpf: Fix precision tracking for BPF_ALU |
BPF_TO_BE | BPF_END
> > > > >     403470431b15 bpf: Fix check_stack_write_fixed_off() to
correctly spill imm
> > > > >     ba115f6c3a8c randstruct: Fix gcc-plugin performance mode to
stay in group
> > > > >     2771fac4382b powerpc/perf: Fix disabling BHRB and instruction
sampling
> > > > >     7e450cc9ad54 media: venus: hfi: add checks to perform sanity
on queue pointers
> > > > >     1566e8be73fd i915/perf: Fix NULL deref bugs with drm_dbg()
calls
> > > > >     35c17257ef09 xfs: Fix unreferenced object reported by
kmemleak in xfs_sysfs_init()
> > > > >     5db146322b17 xfs: fix memory leak in xfs_errortag_init
> > > > >     c540284d8488 xfs: fix exception caused by unexpected illegal
bestcount in leaf dir
> > > > >     5212d586e76f xfs: avoid a UAF when log intent item recovery
fails
> > > > >     ba179cc12109 xfs: fix inode reservation space for removing
transaction
> > > > >     b7847653a2d6 xfs: Fix false ENOSPC when performing direct
write on a delalloc extent in cow fork
> > > > >     92d38b87e886 xfs: add missing cmap->br_state =3D XFS_EXT_NORM
update
> > > > >     8d0baec78e8a xfs: fix intermittent hang during quotacheck
> > > > >     76545c0e881b xfs: don't leak memory when attr fork loading
fails
> > > > >     eb888caf27d9 xfs: fix use-after-free in xattr node block
inactivation
> > > > >     4cb3842967e6 xfs: flush inode gc workqueue before clearing
agi bucket
> > > > >     188594c64a1e xfs: prevent a UAF when log IO errors race with
unmount
> > > > >     921c96215850 xfs: use invalidate_lock to check the state of
mmap_lock
> > > > >     efd194800b69 xfs: convert buf_cancel_table allocation to
kmalloc_array
> > > > >     074fee186931 xfs: don't leak xfs_buf_cancel structures when
recovery fails
> > > > >     b8effd31a862 xfs: refactor buffer cancellation table
allocation
> > > > >     4968c2aa6a1f cifs: fix check of rc in function
generate_smb3signingkey
> > > > >     8d725bf0d16d cifs: spnego: add ';' in HOST_KEY_LEN
> > > > >     21accf149161 tools/power/turbostat: Enable the C-state
Pre-wake printing
> > > > >     0045c1ff7ac0 tools/power/turbostat: Fix a knl bug
> > > > >     5bcce23f387b macvlan: Don't propagate promisc change to lower
dev in passthru
> > > > >     7574b5e65e92 net/mlx5e: Check return value of snprintf
writing to fw_version buffer for representors
> > > > >     55553c5b53ae net/mlx5e: Reduce the size of icosq_str
> > > > >     51655fd35703 net/mlx5e: Fix pedit endianness
> > > > >     a990dd7410ec net/mlx5e: Refactor mod header management API
> > > > >     39f95b1d0d8f net/mlx5e: Move mod hdr allocation to a single
place
> > > > >     c0f37a3715cb net/mlx5e: Remove incorrect addition of action
fwd flag
> > > > >     6974fd92d5f1 net/mlx5e: fix double free of encap_header in
update funcs
> > > > >     f3c4a7044201 net/mlx5e: fix double free of encap_header
> > > > >     931e9e8e30bf net: stmmac: fix rx budget limit check
> > > > >     b8b514b2a6cd netfilter: nf_tables: fix pointer math issue in
nft_byteorder_eval()
> > > > >     25da0f582119 netfilter: nf_tables: add and use BE register
load-store helpers
> > > > >     a48f6be5bdb7 netfilter: nf_tables: use the correct get/put
helpers
> > > > >     7d3901bf3baa netfilter: nf_conntrack_bridge: initialize err
to 0
> > > > >     75bcfc188abf af_unix: fix use-after-free in
unix_stream_read_actor()
> > > > >     0b480c654ef2 net: ethernet: cortina: Fix MTU max setting
> > > > >     097588e20c6b net: ethernet: cortina: Handle large frames
> > > > >     f9269b274cdf net: ethernet: cortina: Fix max RX frame define
> > > > >     53064e8239dd bonding: stop the device in bond_setup_by_slave(=
)
> > > > >     cda210a4bdf7 ptp: annotate data-race around q->head and
q->tail
> > > > >     b67d16b2373b xen/events: fix delayed eoi list handling
> > > > >     8531a4194e59 ppp: limit MRU to 64K
> > > > >     9ae82308d184 tipc: Fix kernel-infoleak due to uninitialized
TLV value
> > > > >     359c65daf6b5 net: hns3: fix VF wrong speed and duplex issue
> > > > >     406be003d698 net: hns3: fix VF reset fail issue
> > > > >     cfc131b078a3 net: hns3: fix variable may not initialized
problem in hns3_init_mac_addr()
> > > > >     070581829c1a net: hns3: fix incorrect capability bit display
for copper port
> > > > >     a3c65cf7854d net: hns3: add barrier in vf mailbox reply
process
> > > > >     e671d8203758 net: hns3: add byte order conversion for PF to
VF mailbox message
> > > > >     bb0f14257c04 net: hns3: refine the definition for struct
hclge_pf_to_vf_msg
> > > > >     1d8f66d4060a net: hns3: fix add VLAN fail issue
> > > > >     4b3b2541d40e tty: Fix uninit-value access in
ppp_sync_receive()
> > > > >     1f64cad3ac38 ipvlan: add ipvlan_route_v6_outbound() helper
> > > > >     6c71b9b177c6 net: set SOCK_RCU_FREE before inserting socket
into hashtable
> > > > >     427165421c25 net: inet: Retire port only listening_hash
> > > > >     be1ceb8b7c58 net: inet: Open code inet_hash2 and inet_unhash2
> > > > >     bb9bcf47fba7 net: inet: Remove count from
inet_listen_hashbucket
> > > > >     de634368e079 mptcp: listen diag dump support
> > > > >     870f438aca56 mptcp: diag: switch to context structure
> > > > >     be020f658c63 gfs2: Silence "suspicious RCU usage in
gfs2_permission" warning
> > > > >     194454afa6aa SUNRPC: Fix RPC client cleaned up the freed
pipefs dentries
> > > > >     319ed0cba164 NFSv4.1: fix SP4_MACH_CRED protection for pnfs I=
O
> > > > >     809684f5b388 SUNRPC: Add an IS_ERR() check back to where it
was
> > > > >     46d6b768072b SUNRPC: ECONNRESET might require a rebind
> > > > >     a7032d4d6499 media: cec: meson: always include meson
sub-directory in Makefile
> > > > >     16e78f28517d media: cadence: csi2rx: Unregister v4l2 async
notifier
> > > > >     20c2ca9abb78 sched/core: Optimize in_task() and
in_interrupt() a bit
> > > > >     9894c58c1777 tracing/perf: Add interrupt_context_level()
helper
> > > > >     48fef664d7e9 tracing: Reuse logic from perf's
get_recursion_context()
> > > > >     670b3e902f62 wifi: iwlwifi: Use FW rate for non-data frames
> > > > >     a7ee519e8095 pwm: Fix double shift bug
> > > > >     7054366cd076 drm/amdgpu: fix software pci_unplug on some chip=
s
> > > > >     e48a5e78d077 drm/qxl: prevent memory leak
> > > > >     0835e7f296ca ASoC: ti: omap-mcbsp: Fix runtime PM underflow
warnings
> > > > >     38ada2f304f6 i2c: dev: copy userspace array safely
> > > > >     610244988f32 kgdb: Flush console before entering kgdb on pani=
c
> > > > >     4e497f1acd99 drm/amd/display: Avoid NULL dereference of
timing generator
> > > > >     5e0b788fb96b media: imon: fix access to invalid resource for
the second interface
> > > > >     ae6bcafe1f6b media: ccs: Fix driver quirk struct documentatio=
n
> > > > >     d01b0ad79ecd media: cobalt: Use FIELD_GET() to extract Link
Width
> > > > >     03ce0655bf8e gfs2: fix an oops in gfs2_permission
> > > > >     5bfda356e903 gfs2: ignore negated quota changes
> > > > >     16631907d013 media: vivid: avoid integer overflow
> > > > >     09cd8b561aa9 media: gspca: cpia1: shift-out-of-bounds in
set_flicker
> > > > >     39c71357e68e i3c: master: mipi-i3c-hci: Fix a kernel panic
for accessing DAT_data.
> > > > >     72775cad7f57 virtio-blk: fix implicit overflow on
virtio_max_dma_size
> > > > >     f7f3bdb225e3 i2c: sun6i-p2wi: Prevent potential division by
zero
> > > > >     d23ad76f240c i3c: mipi-i3c-hci: Fix out of bounds access in
hci_dma_irq_handler
> > > > >     e6fbad3cc880 9p: v9fs_listxattr: fix %s null argument warning
> > > > >     a18be976be41 9p/trans_fd: Annotate data-racy writes to
file::f_flags
> > > > >     2cc5e191d671 usb: gadget: f_ncm: Always set current gadget in
ncm_bind()
> > > > >     6c80f48912b5 tty: vcc: Add check for kstrdup() in vcc_probe()
> > > > >     2ff61106d6b4 exfat: support handle zero-size directory
> > > > >     c86a3007a685 HID: Add quirk for Dell Pro Wireless Keyboard
and Mouse KM5221W
> > > > >     3453f945af89 PCI: Use FIELD_GET() in Sapphire RX 5600 XT
Pulse quirk
> > > > >     0a93a0f99a09 misc: pci_endpoint_test: Add Device ID for R-Car
S4-8 PCIe controller
> > > > >     03dbd6a9ea4e PCI: Disable ATS for specific Intel IPU E2000
devices
> > > > >     a9a0b3444845 PCI: Extract ATS disabling to a helper function
> > > > >     fe511d24418a PCI: Use FIELD_GET() to extract Link Width
> > > > >     56d78b5495eb scsi: libfc: Fix potential NULL pointer
dereference in fc_lport_ptp_setup()
> > > > >     37a51e7f36b7 atm: iphase: Do PCI error checks on own line
> > > > >     f05ae00106aa PCI: tegra194: Use FIELD_GET()/FIELD_PREP() with
Link Width fields
> > > > >     631a96e9eb42 ALSA: hda: Fix possible null-ptr-deref when
assigning a stream
> > > > >     1c805b9cd2e3 ARM: 9320/1: fix stack depot IRQ stack filter
> > > > >     8d25ec69f8f1 HID: lenovo: Detect quirk-free fw on cptkbd and
stop applying workaround
> > > > >     64f062baf202 jfs: fix array-index-out-of-bounds in diAlloc
> > > > >     da3da5e1e6f7 jfs: fix array-index-out-of-bounds in dbFindLeaf
> > > > >     1f74d336990f fs/jfs: Add validity check for db_maxag and
db_agpref
> > > > >     5f148b16972e fs/jfs: Add check for negative db_l2nbperpage
> > > > >     e1d1f79b1929 scsi: ibmvfc: Remove BUG_ON in the case of an
empty event pool
> > > > >     f0bfc8a5561f scsi: hisi_sas: Set debugfs_dir pointer to NULL
after removing debugfs
> > > > >     5904dee70771 RDMA/hfi1: Use FIELD_GET() to extract Link Width
> > > > >     546c1796ad1e crypto: pcrypt - Fix hungtask for PADATA_RESET
> > > > >     bc443a199f8c ASoC: soc-card: Add storage for PCI SSID
> > > > >     9f2082067c5f selftests/efivarfs: create-read: fix a resource
leak
> > > > >     428cad17f53b arm64: dts: ls208xa: use a pseudo-bus to
constrain usb dma size
> > > > >     174f62a0aa15 drm/amdgpu: Fix a null pointer access when the
smc_rreg pointer is NULL
> > > > >     3f7a400d5e80 drm/amdkfd: Fix shift out-of-bounds issue
> > > > >     300589d551d4 drm/panel: st7703: Pick different reset sequence
> > > > >     eaa03ea366c8 drm/amdgpu/vkms: fix a possible null pointer
dereference
> > > > >     84c923d89890 drm/panel/panel-tpo-tpg110: fix a possible null
pointer dereference
> > > > >     2381f6b628b3 drm/panel: fix a possible null pointer
dereference
> > > > >     c11cf5e117f5 drm/amdgpu: Fix potential null pointer derefernc=
e
> > > > >     a237675aa1e6 drm/amd: Fix UBSAN array-index-out-of-bounds for
Polaris and Tonga
> > > > >     acdb6830de02 drm/amd: Fix UBSAN array-index-out-of-bounds for
SMU7
> > > > >     829ce8e995a8 drm/msm/dp: skip validity check for DP CTS EDID
checksum
> > > > >     689b33b94f09 drm: vmwgfx_surface.c: copy user-array safely
> > > > >     22260dabcfe3 kernel: watch_queue: copy user-array safely
> > > > >     d4f2c09d4672 kernel: kexec: copy user-array safely
> > > > >     24b17d530c42 string.h: add array-wrappers for (v)memdup_user(=
)
> > > > >     3a3a6dc9a330 drm/amd/display: use full update for clip size
increase of large plane source
> > > > >     7d43cdd22cd8 drm/amdkfd: Fix a race condition of vram buffer
unref in svm code
> > > > >     eea81424c5b8 drm/komeda: drop all currently held locks if
deadlock happens
> > > > >     812886866be6 platform/x86: thinkpad_acpi: Add battery quirk
for Thinkpad X120e
> > > > >     ba7088769800 Bluetooth: Fix double free in hci_conn_cleanup
> > > > >     f9de14bde56d Bluetooth: btusb: Add date->evt_skb is NULL chec=
k
> > > > >     a43cf6acf017 wifi: ath10k: Don't touch the CE interrupt
registers after power up
> > > > >     6f42bd243327 net: annotate data-races around
sk->sk_dst_pending_confirm
> > > > >     19ab5fd26441 net: annotate data-races around
sk->sk_tx_queue_mapping
> > > > >     f3be63f7a8ee wifi: ath10k: fix clang-specific fortify warning
> > > > >     02a0547b8da0 wifi: ath9k: fix clang-specific fortify warnings
> > > > >     cf353904a828 bpf: Detect IP =3D=3D ksym.end as part of BPF pr=
ogram
> > > > >     c29a89b23f67 atl1c: Work around the DMA RX overflow issue
> > > > >     21a0f310a9f3 wifi: mac80211: don't return unset power in
ieee80211_get_tx_power()
> > > > >     3073e38086d0 wifi: mac80211_hwsim: fix clang-specific fortify
warning
> > > > >     e8e55fa44435 x86/mm: Drop the 4 MB restriction on minimal
NUMA node memory size
> > > > >     f9d3ba62e87b workqueue: Provide one lock class key per
work_on_cpu() callsite
> > > > >     0a5b512d526c clocksource/drivers/timer-atmel-tcb: Fix
initialization on SAM9 hardware
> > > > >     465b88c0873b clocksource/drivers/timer-imx-gpt: Fix potential
memory leak
> > > > >     fd0df3f87192 perf/core: Bail out early if the request AUX
area is out of bound
> > > > >     e89d0ed45a41 locking/ww_mutex/test: Fix potential workqueue
corruption
> > > > >     2a910f4af54d Linux 5.15.139
> > > > >     3443337acd37 btrfs: use u64 for buffer sizes in the tree
search ioctls
> > > > >     f9f5e8cecba9 Revert "mmc: core: Capture correct oemid-bits
for eMMC cards"
> > > > >     824829c2c6b4 tracing/kprobes: Fix the order of argument
descriptions
> > > > >     560680f745fc fbdev: fsl-diu-fb: mark wr_reg_wa() static
> > > > >     8e4b510fe917 fbdev: imsttfb: fix a resource leak in probe
> > > > >     3648582181b6 fbdev: imsttfb: Fix error path of imsttfb_probe(=
)
> > > > >     30959f9f4540 spi: spi-zynq-qspi: add spi-mem to driver
kconfig dependencies
> > > > >     9cf044cc36c1 ASoC: hdmi-codec: register hpd callback on
component probe
> > > > >     705e5a28ec1d drm/syncobj: fix
DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
> > > > >     0ca05fae2790 netfilter: nat: fix ipv6 nat redirect with
mapped and scoped addresses
> > > > >     1652f57f02eb netfilter: nft_redir: use `struct nf_nat_range2`
throughout and deduplicate eval call-backs
> > > > >     d28c17abe098 netfilter: xt_recent: fix (increase) ipv6
literal buffer length
> > > > >     f30567fcbc4d i2c: iproc: handle invalid slave state
> > > > >     38f5ac54b917 r8169: respect userspace disabling IFF_MULTICAST
> > > > >     fd01115b033c blk-core: use pr_warn_ratelimited() in
bio_check_ro()
> > > > >     b80148710983 block: remove unneeded return value of
bio_check_ro()
> > > > >     d8d94d6b3bd3 tg3: power down device only on SYSTEM_POWER_OFF
> > > > >     5ea06a23f8f4 net/smc: put sk reference if close work was
canceled
> > > > >     884606f8283c net/smc: allow cdc msg send rather than drop it
with NULL sndbuf_desc
> > > > >     a62af7146daa net/smc: fix dangling sock under state
SMC_APPFINCLOSEWAIT
> > > > >     866606826f16 selftests: pmtu.sh: fix result checking
> > > > >     2d117ac1b8f8 net: stmmac: xgmac: Enable support for multiple
Flexible PPS outputs
> > > > >     95a99ac112c5 Fix termination state for idr_for_each_entry_ul(=
)
> > > > >     70ef755f126b net: r8169: Disable multicast filter for
RTL8168H and RTL8107E
> > > > >     0dad0e75d62b dccp/tcp: Call security_inet_conn_request()
after setting IPv6 addresses.
> > > > >     c340713bdf32 dccp: Call security_inet_conn_request() after
setting IPv4 addresses.
> > > > >     d1b7e6562a4c octeontx2-pf: Fix holes in error code
> > > > >     f60297ef59d4 octeontx2-pf: Fix error codes
> > > > >     794d360b1d65 inet: shrink struct flowi_common
> > > > >     8943083bbb64 bpf: Check map->usercnt after timer->timer is
assigned
> > > > >     3907b89cd17f tipc: Change nla_policy for bearer-related names
to NLA_NUL_STRING
> > > > >     a1a485e45d24 hsr: Prevent use after free in
prp_create_tagged_frame()
> > > > >     352887b3edd0 llc: verify mac len before reading mac header
> > > > >     303766bb92c5 Input: synaptics-rmi4 - fix use after free in
rmi_unregister_function()
> > > > >     741e4c15d7c0 pwm: brcmstb: Utilize appropriate clock APIs in
suspend/resume
> > > > >     895ac9a21f69 pwm: sti: Reduce number of allocations and drop
usage of chip_data
> > > > >     db64ddddeeec regmap: prevent noinc writes from clobbering
cache
> > > > >     004d4002534e media: dvb-usb-v2: af9035: fix missing unlock
> > > > >     a0beda184756 media: cedrus: Fix clock/reset sequence
> > > > >     980be4c3b0d5 media: vidtv: mux: Add check and kfree for
kstrdup
> > > > >     d17269fb9161 media: vidtv: psi: Add check for kstrdup
> > > > >     db89f551b706 media: s3c-camif: Avoid inappropriate kfree()
> > > > >     51c94256a83f media: bttv: fix use after free error due to
btv->timeout timer
> > > > >     d3937f9e25d9 media: i2c: max9286: Fix some redundant
of_node_put() calls
> > > > >     9d060f2fc40c pcmcia: ds: fix possible name leak in error path
in pcmcia_device_add()
> > > > >     24e9df588e2e pcmcia: ds: fix refcount leak in
pcmcia_device_add()
> > > > >     24e73ab542c7 pcmcia: cs: fix possible hung task and memory
leak pccardd()
> > > > >     b3eaa0d43c74 rtc: pcf85363: fix wrong mask/val parameters in
regmap_update_bits call
> > > > >     20bd0198bebd cxl/mem: Fix shutdown order
> > > > >     d48fe8d98171 i3c: Fix potential refcount leak in
i3c_master_register_new_i3c_devs
> > > > >     855d6fb2cc7b 9p/net: fix possible memory leak in
p9_check_errors()
> > > > >     0d456ebaad30 perf hist: Add missing puts to
hist__account_cycles
> > > > >     924e8d0b7645 perf machine: Avoid out of bounds LBR memory rea=
d
> > > > >     76b0eab987c4 usb: host: xhci-plat: fix possible kernel oops
while resuming
> > > > >     c9c4dab06a5a xhci: Loosen RPM as default policy to cover for
AMD xHC 1.1
> > > > >     92c9ef156431 powerpc/pseries: fix potential memory leak in
init_cpu_associativity()
> > > > >     516235e7b35f powerpc/imc-pmu: Use the correct spinlock
initializer.
> > > > >     945dc61d7840 powerpc/xive: Fix endian conversion size
> > > > >     bce31a2bcb1e powerpc/40x: Remove stale PTE_ATOMIC_UPDATES
macro
> > > > >     1308e55eb09c modpost: fix tee MODULE_DEVICE_TABLE built on
big-endian host
> > > > >     863a9c3fdec2 powerpc: Only define __parse_fpscr() when
required
> > > > >     01f62c6bd2db f2fs: fix to initialize map.m_pblk in
f2fs_precache_extents()
> > > > >     dfebea7114e0 dmaengine: pxa_dma: Remove an erroneous BUG_ON()
in pxad_free_desc()
> > > > >     72f8fa6c4b78 USB: usbip: fix stub_dev hub disconnect
> > > > >     168697f15a53 tools: iio: iio_generic_buffer ensure alignment
> > > > >     a61c3c647ffd misc: st_core: Do not call kfree_skb() under
spin_lock_irqsave()
> > > > >     732aa0cb2601 dmaengine: ti: edma: handle
irq_of_parse_and_map() errors
> > > > >     2941a29fe9d6 usb: chipidea: Simplify Tegra DMA alignment code
> > > > >     58e8316b200b usb: chipidea: Fix DMA overwrite for Tegra
> > > > >     fcaafb574fc8 usb: dwc2: fix possible NULL pointer dereference
caused by driver concurrency
> > > > >     c956be5641cc dmaengine: idxd: Register dsa_bus_type before
registering idxd sub-drivers
> > > > >     ca46d7ce1fbe livepatch: Fix missing newline character in
klp_resolve_symbols()
> > > > >     b77f7c025e85 tty: tty_jobctrl: fix pid memleak in
disassociate_ctty()
> > > > >     e9f598a5cc9a f2fs: compress: fix to avoid redundant compress
extension
> > > > >     8c4504cc0c64 f2fs: compress: fix to avoid use-after-free on
dic
> > > > >     ca0aae3837a6 leds: trigger: ledtrig-cpu:: Fix 'output may be
truncated' issue for 'cpu'
> > > > >     206a972511a8 leds: pwm: Don't disable the PWM when the LED
should be off
> > > > >     893eedf596dd leds: turris-omnia: Do not use SMBUS calls
> > > > >     aec3706971b3 leds: turris-omnia: Drop unnecessary mutex
locking
> > > > >     c9a4f13c58f1 mfd: arizona-spi: Set pdata.hpdet_channel for
ACPI enumerated devs
> > > > >     63a99d7b57b4 mfd: dln2: Fix double put in dln2_probe
> > > > >     2742c860e0b7 mfd: core: Ensure disabled devices are skipped
without aborting
> > > > >     94eb5423d75e mfd: core: Un-constify mfd_cell.of_reg
> > > > >     8890d4d5f25e ASoC: ams-delta.c: use component after check
> > > > >     a2ae48bd82ee crypto: qat - fix deadlock in backlog processing
> > > > >     0dd34a7ad395 padata: Fix refcnt handling in
padata_free_shell()
> > > > >     93e4aa8545ab ASoC: Intel: Skylake: Fix mem leak when parsing
UUIDs fails
> > > > >     cd1c2df64d6b HID: logitech-hidpp: Move
get_wireless_feature_index() check to hidpp_connect_event()
> > > > >     99893b7c4592 HID: logitech-hidpp: Revert "Don't restart
communication if not necessary"
> > > > >     5f2f38602583 HID: logitech-hidpp: Don't restart IO, instead
defer hid_connect() only
> > > > >     1f80041c5867 HID: logitech-hidpp: Remove
HIDPP_QUIRK_NO_HIDINPUT quirk
> > > > >     d3b196a1da3e Revert "HID: logitech-hidpp: add a module
parameter to keep firmware gestures"
> > > > >     6885e5ffa09d sh: bios: Revive earlyprintk support
> > > > >     b0c25e957f9b hid: cp2112: Fix IRQ shutdown stopping polling
for all IRQs on chip
> > > > >     d06dc0f99f72 RDMA/hfi1: Workaround truncation compilation
error
> > > > >     086cd44204bb scsi: ufs: core: Leave space for '\0' in utf8
desc string
> > > > >     a0f1999090b3 ASoC: fsl: Fix PM disable depth imbalance in
fsl_easrc_probe
> > > > >     904fc0103776 RDMA/hns: The UD mode can only be configured
with DCQCN
> > > > >     9f8db02d30ad RDMA/hns: Fix signed-unsigned mixed comparisons
> > > > >     2de683e27e1d RDMA/hns: Fix uninitialized ucmd in
hns_roce_create_qp_common()
> > > > >     611260e36f16 IB/mlx5: Fix rdma counter binding for RAW QP
> > > > >     922b2693b9af ASoC: fsl: mpc5200_dma.c: Fix warning of
Function parameter or member not described
> > > > >     001f90cd9d2f ext4: move 'ix' sanity check to corrent position
> > > > >     c24a3c9e373e ARM: 9321/1: memset: cast the constant byte to
unsigned char
> > > > >     012d0c66f939 hid: cp2112: Fix duplicate workqueue
initialization
> > > > >     1ce09238e8e8 crypto: qat - increase size of buffers
> > > > >     62df66b726f9 crypto: caam/jr - fix Chacha20 + Poly1305 self
test failure
> > > > >     61f25d4686bf crypto: caam/qi2 - fix Chacha20 + Poly1305 self
test failure
> > > > >     66eb7b7f23dd nd_btt: Make BTT lanes preemptible
> > > > >     6563e0f79d63 libnvdimm/of_pmem: Use devm_kstrdup instead of
kstrdup and check its return value
> > > > >     d4ad0c1a83ce scsi: ibmvfc: Fix erroneous use of
rtas_busy_delay with hcall return code
> > > > >     b79c7d684c3f RDMA/core: Use size_{add,sub,mul}() in calls to
struct_size()
> > > > >     a5c83c8043d7 hwrng: geode - fix accessing registers
> > > > >     a8607725b20a crypto: hisilicon/hpre - Fix a erroneous check
after snprintf()
> > > > >     b01b9dc5487a selftests/resctrl: Ensure the benchmark commands
fits to its array
> > > > >     2d2300fcf8f6 selftests/pidfd: Fix ksft print formats
> > > > >     8bc9c9447489 arm64: dts: imx8mn: Add sound-dai-cells to
micfil node
> > > > >     1abd658492b5 arm64: dts: imx8mm: Add sound-dai-cells to
micfil node
> > > > >     cf7abb54f8b1 arm64: dts: imx8qm-ss-img: Fix jpegenc
compatible entry
> > > > >     8704bf18a888 clk: scmi: Free scmi_clk allocated when the
clocks with invalid info are skipped
> > > > >     bdb0428aa294 firmware: arm_ffa: Assign the missing IDR
allocation ID to the FFA device
> > > > >     b0ffdc164365 firmware: ti_sci: Mark driver as non removable
> > > > >     995ee1e84e8d soc: qcom: llcc: Handle a second device without
data corruption
> > > > >     19b8098f73c6 ARM: dts: qcom: mdm9615: populate vsdcc fixed
regulator
> > > > >     a8ab88f84b89 arm64: dts: qcom: apq8016-sbc: Add missing
ADV7533 regulators
> > > > >     ddc0df81eeac ARM64: dts: marvell: cn9310: Use appropriate
label for spi1 pins
> > > > >     12d9de01c09c arm64: dts: qcom: sdm845-mtp: fix WiFi
configuration
> > > > >     690b89255971 arm64: dts: qcom: sc7280: Add missing LMH
interrupts
> > > > >     2a4cce4168f7 arm64: dts: qcom: msm8992-libra: drop duplicated
reserved memory
> > > > >     eb9daf47806b arm64: dts: qcom: msm8916: Fix iommu local
address range
> > > > >     541640dcbf48 ARM: dts: renesas: blanche: Fix typo in GP_11_2
pin name
> > > > >     0e1e88bba286 perf: hisi: Fix use-after-free when register pmu
fails
> > > > >     4067d39f3c57 drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET
settings/handling
> > > > >     a6a6f70aedca drm/msm/dsi: use msm_gem_kernel_put to free TX
buffer
> > > > >     aea6f32a4318 xen-pciback: Consider INTx disabled when
MSI/MSI-X is enabled
> > > > >     e588ca45bf55 drm/rockchip: Fix type promotion bug in
rockchip_gem_iommu_map()
> > > > >     a00a293d57a5 arm64/arm: xen: enlighten: Fix KPTI checks
> > > > >     d0d01bb4a560 drm/bridge: lt9611uxc: fix the race in the error
path
> > > > >     29aba28ea195 drm/bridge: lt9611uxc: Register and attach our
DSI device at probe
> > > > >     f53a04579328 drm/bridge: lt9611uxc: Switch to devm MIPI-DSI
helpers
> > > > >     517a5137a57b drm/rockchip: cdn-dp: Fix some error handling
paths in cdn_dp_probe()
> > > > >     865ccd4ca674 drm/mediatek: Fix iommu fault during crtc
enabling
> > > > >     8e3c8253b34f drm/mediatek: Fix iommu fault by swapping FBs
after updating plane state
> > > > >     e11e339faa11 drm/amdkfd: fix some race conditions in vram
buffer alloc/free of svm code
> > > > >     30cb99e09648 drm/bridge: tc358768: Fix bit updates
> > > > >     1cd4ae681a6a drm/bridge: tc358768: Disable non-continuous
clock mode
> > > > >     c13591b859be drm/bridge: tc358768: Fix use of uninitialized
variable
> > > > >     d78bddd94b80 drm/bridge: lt8912b: Add missing
drm_bridge_attach call
> > > > >     5cc2bc519afd drm/bridge: lt8912b: Manually disable HPD only
if it was enabled
> > > > >     42071feab712 drm/bridge: lt8912b: Fix crash on bridge detach
> > > > >     d9217286d0ab drm/bridge: lt8912b: Fix bridge_detach
> > > > >     cc3057958c5c drm/bridge: lt8912b: Add hot plug detection
> > > > >     ef4a40953c80 drm/bridge: lt8912b: Register and attach our DSI
device at probe
> > > > >     3580b8a01305 drm/bridge: lt8912b: Switch to devm MIPI-DSI
helpers
> > > > >     52541851a8d1 drm/mipi-dsi: Create devm device attachment
> > > > >     a20d6ecd261a drm/mipi-dsi: Create devm device registration
> > > > >     347f025a02b3 drm/radeon: possible buffer overflow
> > > > >     b163b371d741 drm/rockchip: vop: Fix call to crtc reset helper
> > > > >     9a96bed1df7b drm/rockchip: vop: Fix reset of state in
duplicate state crtc funcs
> > > > >     1b0bc99cf316 hwmon: (coretemp) Fix potentially truncated
sysfs attribute name
> > > > >     b3e7eb23a6e9 hwmon: (axi-fan-control) Fix possible NULL
pointer dereference
> > > > >     e0bf076b734a platform/x86: wmi: Fix opening of char device
> > > > >     c57e81d5e538 platform/x86: wmi: remove unnecessary
initializations
> > > > >     2ca4e461a298 platform/x86: wmi: Fix probe failure when
failing to register WMI devices
> > > > >     f75e11f54d98 clk: qcom: config IPQ_APSS_6018 should depend on
QCOM_SMEM
> > > > >     d1175cf4bd2b clk: mediatek: clk-mt2701: Add check for
mtk_alloc_clk_data
> > > > >     e964d21dc034 clk: mediatek: clk-mt7629: Add check for
mtk_alloc_clk_data
> > > > >     c4070ada5d51 clk: mediatek: clk-mt7629-eth: Add check for
mtk_alloc_clk_data
> > > > >     3aefc6fcfbad clk: mediatek: clk-mt6797: Add check for
mtk_alloc_clk_data
> > > > >     ca6d565a2319 clk: mediatek: clk-mt6779: Add check for
mtk_alloc_clk_data
> > > > >     533ca5153ad6 clk: mediatek: clk-mt6765: Add check for
mtk_alloc_clk_data
> > > > >     e531e4e73734 clk: npcm7xx: Fix incorrect kfree
> > > > >     761c2a690d8f clk: ti: fix double free in
of_ti_divider_clk_setup()
> > > > >     1c37faca0908 clk: ti: change ti_clk_register[_omap_hw]() API
> > > > >     28b72fba1e19 clk: ti: Update component clocks to use
ti_dt_clk_name()
> > > > >     c4bffed2e52b clk: ti: Update pll and clockdomain clocks to
use ti_dt_clk_name()
> > > > >     9b5e9d8bf9a6 clk: ti: Add ti_dt_clk_name() helper to use
clock-output-names
> > > > >     f45fff806ebb clk: keystone: pll: fix a couple NULL vs
IS_ERR() checks
> > > > >     7ff8ca9beefb spi: nxp-fspi: use the correct ioremap function
> > > > >     26206c858dae clk: renesas: rzg2l: Fix computation formula
> > > > >     1966bf2a79e6 clk: renesas: rzg2l: Use FIELD_GET() for PLL
register fields
> > > > >     7ece2efa87af clk: renesas: rzg2l: Simplify
multiplication/shift logic
> > > > >     e2239f716529 clk: imx: imx8qxp: Fix elcdif_pll clock
> > > > >     7d416973cd12 clk: imx: imx8mq: correct error handling path
> > > > >     608ebb098b79 clk: imx: Select MXC_CLK for CLK_IMX8QXP
> > > > >     8861b2925a84 clk: qcom: gcc-sm8150: Fix gcc_sdcc2_apps_clk_sr=
c
> > > > >     76e8f00f54a8 clk: qcom: mmcc-msm8998: Fix the SMMU GDSC
> > > > >     56c4bb46a5a0 clk: qcom: mmcc-msm8998: Don't check halt bit on
some branch clks
> > > > >     0881d24cf5ca clk: qcom: clk-rcg2: Fix clock rate overflow for
high parent frequencies
> > > > >     b64683f5d728 spi: tegra: Fix missing IRQ check in
tegra_slink_probe()
> > > > >     b13e8b38be51 regmap: debugfs: Fix a erroneous check after
snprintf()
> > > > >     8fafac407346 ipvlan: properly track tx_errors
> > > > >     3eedc19a9d0f net: add DEV_STATS_READ() helper
> > > > >     359bce81b841 ipv6: avoid atomic fragment on GSO packets
> > > > >     6b413d52f6ab ACPI: sysfs: Fix create_pnp_modalias() and
create_of_modalias()
> > > > >     32aaa3b98789 wifi: iwlwifi: empty overflow queue during flush
> > > > >     0e3ad00be4e8 wifi: iwlwifi: pcie: synchronize IRQs before NAP=
I
> > > > >     a8ebe549e0ce wifi: iwlwifi: call napi_synchronize() before
freeing rx/tx queues
> > > > >     627a3b3f5c80 iwlwifi: pcie: adjust to Bz completion descripto=
r
> > > > >     0d91506a40ec tcp: fix cookie_init_timestamp() overflows
> > > > >     4f6e904ed4e3 chtls: fix tp->rcv_tstamp initialization
> > > > >     5d7bec7ae4db r8169: fix rare issue with broken rx after
link-down on RTL8125
> > > > >     e143a3c82d33 r8169: use tp_to_dev instead of open code
> > > > >     3a8f4e58e1ee thermal: core: prevent potential string overflow
> > > > >     bfd4ed4988aa netfilter: nf_tables: Drop pointless memset when
dumping rules
> > > > >     80986257d2cd PM / devfreq: rockchip-dfi: Make pmu regmap
mandatory
> > > > >     826120c9ba68 can: dev: can_put_echo_skb(): don't crash kernel
if can_priv::echo_skb is accessed out of bounds
> > > > >     28e9e015916e can: dev: can_restart(): fix race condition
between controller restart and netif_carrier_on()
> > > > >     ada4dc4788f1 can: dev: can_restart(): don't crash kernel if
carrier is OK
> > > > >     d4eb4182a823 wifi: rtlwifi: fix EDCA limit set by BT
coexistence
> > > > >     2027e74150ee tcp_metrics: do not create an entry from
tcp_init_metrics()
> > > > >     3f7cb7c47ce0 tcp_metrics: properly set tp->snd_ssthresh in
tcp_init_metrics()
> > > > >     ca7b6fa9e61a tcp_metrics: add missing barriers on delete
> > > > >     227709a0e47c wifi: mt76: mt7603: improve stuck beacon handlin=
g
> > > > >     eab5b0aa5065 mt76: pass original queue id from
__mt76_tx_queue_skb to the driver
> > > > >     75336a762539 mt76: add support for overriding the device used
for DMA mapping
> > > > >     77b2ab5cd1a4 mt76: dma: use kzalloc instead of devm_kzalloc
for txwi
> > > > >     064b32f18db1 wifi: mt76: mt7603: rework/fix rx pse hang check
> > > > >     1afbb9ececd3 wifi: rtw88: debug: Fix the NULL vs IS_ERR() bug
for debugfs_create_file()
> > > > >     ebcbf5f5e047 net: spider_net: Use size_add() in call to
struct_size()
> > > > >     56e7424c6efc tipc: Use size_add() in calls to struct_size()
> > > > >     3e51efcb2909 mlxsw: Use size_mul() in call to struct_size()
> > > > >     dc3fef310732 gve: Use size_add() in call to struct_size()
> > > > >     70f032db8516 tcp: call tcp_try_undo_recovery when an RTOd TFO
SYNACK is ACKed
> > > > >     a2d540c74549 udp: add missing WRITE_ONCE() around
up->encap_rcv
> > > > >     8f7eef3a13df selftests/bpf: Correct map_fd to data_fd in
tailcalls
> > > > >     3eefb2fbf4ec selftests/bpf: Test tail call counting with
bpf2bpf and data on stack
> > > > >     ab91992ec4d4 i40e: fix potential memory leaks in i40e_remove(=
)
> > > > >     702742373650 genirq/matrix: Exclude managed interrupts in
irq_matrix_allocated()
> > > > >     379b120e4f27 pstore/platform: Add check for kstrdup
> > > > >     81b8638e4ef4 x86/boot: Fix incorrect startup_gdt_descr.size
> > > > >     c7e8c7452e5a x86/sev-es: Allow copy_from_kernel_nofault() in
earlier boot
> > > > >     0b5da8ce0f18 x86: Share definition of __is_canonical_address(=
)
> > > > >     90b263db856d futex: Don't include process MM in futex key on
no-MMU
> > > > >     f0d6e5841172 x86/srso: Fix SBPB enablement for (possible)
future fixed HW
> > > > >     565f9337b68e writeback, cgroup: switch inodes with dirty
timestamps to release dying cgwbs
> > > > >     2bb46b20825d vfs: fix readahead(2) on block devices
> > > > >     20195f87db19 sched: Fix stop_one_cpu_nowait() vs hotplug
> > > > >     13cde955e52e sched/uclamp: Ignore (util =3D=3D 0) optimizatio=
n in
feec() when p_util_max =3D 0
> > > > >     cc6198ff20c0 iov_iter, x86: Be consistent about the __user
tag on copy_mc_to_user()
> > > > >     80529b4968a8 Linux 5.15.138
> > > > >     3d8344a7c4a3 ALSA: hda: intel-dsp-config: Fix JSL Chromebook
quirk detection
> > > > >     f049c0c0037d misc: pci_endpoint_test: Add deviceID for J721S2
PCIe EP device support
> > > > >     28b8ad8ccecd tty: 8250: Add Brainboxes Oxford
Semiconductor-based quirks
> > > > >     44c4dfac3f02 tty: 8250: Add support for Intashield IX cards
> > > > >     d541ccb34de2 tty: 8250: Add support for additional Brainboxes
PX cards
> > > > >     60debc01fcbb tty: 8250: Fix up PX-803/PX-857
> > > > >     1f5649aed527 tty: 8250: Fix port count of PX-257
> > > > >     3fe3cc63c730 tty: 8250: Add support for Intashield IS-100
> > > > >     a5b6390fd609 tty: 8250: Add support for Brainboxes UP cards
> > > > >     738fe41b6443 tty: 8250: Add support for additional Brainboxes
UC cards
> > > > >     ff6059c3d234 tty: 8250: Remove UC-257 and UC-431
> > > > >     81a4dd5e6c78 tty: n_gsm: fix race condition in status line
change on dead connections
> > > > >     e25197747f0e usb: raw-gadget: properly handle interrupted
requests
> > > > >     e5f53a68a596 usb: typec: tcpm: Fix NULL pointer dereference
in tcpm_pd_svdm()
> > > > >     7c4855b22a3f usb: storage: set 1.50 as the lower bcdDevice
for older "Super Top" compatibility
> > > > >     c48aae53850c PCI: Prevent xHCI driver from claiming AMD
VanGogh USB3 DRD device
> > > > >     6628c3627c02 drm/amd: Disable ASPM for VI w/ all Intel system=
s
> > > > >     b6c3c7786e24 drm/amd: Move helper for dynamic speed switch
check out of smu13
> > > > >     9015169f00ee can: isotp: isotp_sendmsg(): fix TX state
detection and wait behavior
> > > > >     d72ff6478323 can: isotp: isotp_bind(): do not validate unused
address information
> > > > >     e163ad6a8639 can: isotp: add local echo tx processing and tx
without FC
> > > > >     b4e78ea26638 can: isotp: handle wait_event_interruptible()
return values
> > > > >     2fc6f337257f can: isotp: check CAN address family in
isotp_bind()
> > > > >     f8c3bd211cf3 can: isotp: isotp_bind(): return -EINVAL on
incorrect CAN ID formatting
> > > > >     615c4dd64050 can: isotp: set max PDU size to 64 kByte
> > > > >     6627b96851f1 powerpc/mm: Fix boot crash with FLATMEM
> > > > >     f0f998648887 r8152: Check for unplug in r8153b_ups_en() /
r8153c_ups_en()
> > > > >     78c939a88729 r8152: Check for unplug in
rtl_phy_patch_request()
> > > > >     51cc28ce742e net: chelsio: cxgb4: add an error code check in
t4_load_phy_fw
> > > > >     bbc926199321 platform/mellanox: mlxbf-tmfifo: Fix a warning
message
> > > > >     db4416ea3a5d scsi: mpt3sas: Fix in error path
> > > > >     d48b2e8189d5 fbdev: uvesafb: Call cn_del_callback() at the
end of uvesafb_exit()
> > > > >     e39440c3268b drm/ttm: Reorder sys manager cleanup step
> > > > >     aade33d3d9bb ASoC: rt5650: fix the wrong result of key button
> > > > >     fa32e21c0568 netfilter: nfnetlink_log: silence bogus compiler
warning
> > > > >     dfcbb983eb6e spi: npcm-fiu: Fix UMA reads when dummy.nbytes
=3D=3D 0
> > > > >     64ae128b095d fs/ntfs3: Avoid possible memory leak
> > > > >     27a0bed1285e fs/ntfs3: Fix directory element type detection
> > > > >     94524980ee75 fs/ntfs3: Fix NULL pointer dereference on error
in attr_allocate_frame()
> > > > >     2de328398b50 fs/ntfs3: Fix possible NULL-ptr-deref in
ni_readpage_cmpr()
> > > > >     962a3d3d731c fs/ntfs3: Use kvmalloc instead of kmalloc(...
__GFP_NOWARN)
> > > > >     393966e79ba1 fs/ntfs3: Write immediately updated ntfs state
> > > > >     59e629fc7157 fs/ntfs3: Add ckeck in ni_update_parent()
> > > > >     738a3adc7c8b fbdev: atyfb: only use ioremap_uc() on i386 and
ia64
> > > > >     afef8af919d2 Input: synaptics-rmi4 - handle reset delay when
using SMBus trsnsport
> > > > >     abc62fc06d4a powerpc/85xx: Fix math emulation exception
> > > > >     4bdde4dca00e dmaengine: ste_dma40: Fix PM disable depth
imbalance in d40_probe
> > > > >     39d2c10367a8 irqchip/stm32-exti: add missing DT IRQ flag
translation
> > > > >     c57aef9075e0 irqchip/riscv-intc: Mark all INTC nodes as
initialized
> > > > >     eb99b6e204cd net: sched: cls_u32: Fix allocation size in
u32_init()
> > > > >     5e78ebe7c1db ASoC: simple-card: fixup asoc_simple_probe()
error handling
> > > > >     65fd21aa3805 x86: Fix .brk attribute in linker script
> > > > >     d4c8bf5635c4 rpmsg: Fix possible refcount leak in
rpmsg_register_device_override()
> > > > >     a82e0fda8a2f rpmsg: glink: Release driver_override
> > > > >     bfd4a664ddfb rpmsg: Fix calling device_lock() on
non-initialized device
> > > > >     2e76b4f6218c rpmsg: Fix kfree() of static memory on setting
driver_override
> > > > >     5c0da71871d3 rpmsg: Constify local variable in field store
macro
> > > > >     389190b25472 driver: platform: Add helper for safer setting
of driver_override
> > > > >     37ffa428d58c objtool/x86: add missing embedded_insn check
> > > > >     f031e15d0bb8 ext4: avoid overlapping preallocations due to
overflow
> > > > >     f2c3a3aa6f11 ext4: fix BUG in ext4_mb_new_inode_pa() due to
overflow
> > > > >     7a992726f727 ext4: add two helper functions
extent_logical_end() and pa_logical_end()
> > > > >     9e78e7709f7d x86/mm: Fix RESERVE_BRK() for older binutils
> > > > >     d3201c718058 x86/mm: Simplify RESERVE_BRK()
> > > > >     897b56acf126 x86/i8259: Skip probing when ACPI/MADT
advertises PCAT compatibility
> > > > >     77db87c4a4ed gve: Fix GFP flags when allocing pages
> > > > >     8b424bdf6c9c iio: afe: rescale: Accept only offset channels
> > > > >     c1eeb494f684 iio: afe: rescale: add offset support
> > > > >     7c76b7db5521 iio: afe: rescale: expose scale processing
function
> > > > >     c60671502dc2 iio: afe: rescale: reorder includes
> > > > >     27dd09f5ec7f clk: Sanitize possible_parent_show to Handle
Return Value of of_clk_get_parent_name
> > > > >     c27ca4aebbee sparc32: fix a braino in fault handling in
csum_and_copy_..._user()
> > > > >     21b07a2e6095 perf/core: Fix potential NULL deref
> > > > >     6efd498009b9 nvmem: imx: correct nregs for i.MX6UL
> > > > >     0c2948118c34 nvmem: imx: correct nregs for i.MX6SLL
> > > > >     6e22bf6f00d5 nvmem: imx: correct nregs for i.MX6ULL
> > > > >     e0f95b831b4a misc: fastrpc: Clean buffers on remote
invocation failures
> > > > >     c4957f00f9e2 tracing/kprobes: Fix the description of variable
length arguments
> > > > >     cdc57093b470 i2c: aspeed: Fix i2c bus hang in slave read
> > > > >     e97d374a2506 i2c: stm32f7: Fix PEC handling in case of SMBUS
transfers
> > > > >     2766a872103b i2c: muxes: i2c-demux-pinctrl: Use
of_get_i2c_adapter_by_node()
> > > > >     48b58f7469e5 i2c: muxes: i2c-mux-gpmux: Use
of_get_i2c_adapter_by_node()
> > > > >     cb65e692765b i2c: muxes: i2c-mux-pinctrl: Use
of_get_i2c_adapter_by_node()
> > > > >     eace761f35a1 iio: adc: xilinx-xadc: Correct temperature
offset/scale for UltraScale
> > > > >     70322a446ef2 iio: adc: xilinx-xadc: Don't clobber preset
voltage/temperature thresholds
> > > > >     3c1312b5d49a iio: exynos-adc: request second interupt only
when touchscreen mode is used
> > > > >     4e14f2d5885f kasan: print the original fault addr when access
invalid shadow
> > > > >     bdfa4fa7588d i40e: Fix wrong check for
I40E_TXR_FLAGS_WB_ON_ITR
> > > > >     d5c175f4cea6 gtp: fix fragmentation needed check with gso
> > > > >     c0dad0c0924c gtp: uapi: fix GTPA_MAX
> > > > >     852fb4ce426d tcp: fix wrong RTO timeout when received SACK
reneging
> > > > >     83cfa3b51a78 r8152: Release firmware if we have an error in
probe
> > > > >     e0f9231ccd6c r8152: Cancel hw_phy_work if we have an error in
probe
> > > > >     ff42b0a55659 r8152: Run the unload routine if we have errors
during probe
> > > > >     6fa3b9f9478e r8152: Increase USB control msg timeout to
5000ms as per spec
> > > > >     76873f2eadc0 net: usb: smsc95xx: Fix uninit-value access in
smsc95xx_read_reg
> > > > >     6afd112c3f95 net: ieee802154: adf7242: Fix some potential
buffer overflow in adf7242_stats_show()
> > > > >     46cd35e4e774 igc: Fix ambiguity in the ethtool advertising
> > > > >     49529413eaed neighbour: fix various data-races
> > > > >     667554946360 igb: Fix potential memory leak in
igb_add_ethtool_nfc_entry
> > > > >     263421905346 treewide: Spelling fix in comment
> > > > >     bc0c4bc119d2 i40e: Fix I40E_FLAG_VF_VLAN_PRUNING value
> > > > >     c532c5df01ad r8169: fix the KCSAN reported data race in
rtl_rx while reading desc->opts1
> > > > >     6afb294c88c6 r8169: fix the KCSAN reported data-race in
rtl_tx while reading TxDescArray[entry].opts1
> > > > >     9d7b3838428c r8169: fix the KCSAN reported data-race in
rtl_tx() while reading tp->cur_tx
> > > > >     04dbfa4122e0 firmware/imx-dsp: Fix use_after_free in
imx_dsp_setup_channels()
> > > > >     0d587b86cd0d drm/dp_mst: Fix NULL deref in
get_mst_branch_device_by_guid_helper()
> > > > >     8860f0175e51 vsock/virtio: initialize the_virtio_vsock before
using VQs
> > > > >     762c251c7f5c vsock/virtio: add support for device
suspend/resume
> > > > >     1e02df6f6907 vsock/virtio: factor our the code to initialize
and delete VQs
> > > > >     15a8cac3c250 drm/i915/pmu: Check if pmu is closed before
stopping event
> > > > >     43bd431a5dd9 nfsd: lock_rename() needs both directories to
live on the same fs
> > > > >     556b68d9b95f mm/migrate: fix do_pages_move for compat pointer=
s
> > > > >     c4071c6114de mm/page_alloc: correct start page when guard
page debug is enabled
> > > > >     3a6cee2bfb53 vhost: Allow null msg.size on
VHOST_IOTLB_INVALIDATE
> > > > >     fbc9a8718f31 virtio-mmio: fix memory leak of vm_dev
> > > > >     862a356bc986 virtio_balloon: Fix endless deflation and
inflation on arm64
> > > > >     41bb770e42bc mcb-lpc: Reallocate memory region to avoid
memory overlapping
> > > > >     f2ac8b2643dd mcb: Return actual parsed size when reading
chameleon table
> > > > >     90918ef995b5 mptcp: more conservative check for zero probes
> > > > >     fd2b2dab6f5b tcp: cleanup tcp_remove_empty_skb() use
> > > > >     68342755b9b2 tcp: remove dead code from tcp_sendmsg_locked()
> > > > >     0f482ad7b1a5 pinctrl: qcom: lpass-lpi: fix concurrent
register updates
> > > > >     51b054f6fe01 ASoC: codecs: wcd938x: fix runtime PM imbalance
on remove
> > > > >     cb34f4e79e54 ASoC: codecs: wcd938x: fix resource leaks on
bind errors
> > > > >     12952a23a5da Linux 5.15.137
> > > > >     dff33880d40a xfrm6: fix inet6_dev refcount underflow problem
> > > > >     5a9d05a4f1c3 Bluetooth: hci_sock: Correctly bounds check and
pad HCI_MON_NEW_INDEX name
> > > > >     a6df96ee0b45 Bluetooth: hci_sock: fix slab oob read in
create_monitor_event
> > > > >     c08d609fb2b6 phy: mapphone-mdm6600: Fix pinctrl_pm handling
for sleep pins
> > > > >     e1b030b101f6 phy: mapphone-mdm6600: Fix runtime PM for remove
> > > > >     59f1095ab58e phy: mapphone-mdm6600: Fix runtime disable on
probe
> > > > >     b618062c0b13 serial: 8250: omap: Move uart_write() inside PM
section
> > > > >     67f29cd2f851 ASoC: pxa: fix a memory leak in probe()
> > > > >     76d04c339508 gpio: vf610: set value before the direction to
avoid a glitch
> > > > >     4b129e3964b3 platform/x86: asus-wmi: Map 0x2a code, Ignore
0x2b and 0x2c events
> > > > >     e1a058cc2467 platform/x86: asus-wmi: Change ASUS_WMI_BRN_DOWN
code from 0x20 to 0x2e
> > > > >     c6bbe51dcdf3 platform/surface: platform_profile: Propagate
error if profile registration fails
> > > > >     a73c8d716938 s390/cio: fix a memleak in css_alloc_subchannel
> > > > >     c8b6c2df1e7d selftests/ftrace: Add new test case which checks
non unique symbol
> > > > >     3ad81e6affcb s390/pci: fix iommu bitmap allocation
> > > > >     71d224acc4d1 perf: Disallow mis-matched inherited group reads
> > > > >     5aa89a11a2a6 USB: serial: option: add Fibocom to DELL custom
modem FM101R-GL
> > > > >     8c376d863618 USB: serial: option: add entry for Sierra EM9191
with new firmware
> > > > >     483221216176 USB: serial: option: add Telit LE910C4-WWX
0x1035 composition
> > > > >     e750fb71dc6a nvme-rdma: do not try to stop unallocated queues
> > > > >     a9fd6d44abbc nvme-pci: add BOGUS_NID for Intel 0a54 device
> > > > >     071382bda1da ACPI: irq: Fix incorrect return value in
acpi_register_gsi()
> > > > >     431a5010bce2 NFSv4.1: fixup use EXCHGID4_FLAG_USE_PNFS_DS for
DS server
> > > > >     5762e72ef1b0 pNFS: Fix a hang in nfs4_evict_inode()
> > > > >     5a3abee2eee9 Revert "pinctrl: avoid unsafe code pattern in
find_pinctrl()"
> > > > >     24959825377f mmc: core: Capture correct oemid-bits for eMMC
cards
> > > > >     8041e7b7e7e9 mmc: core: sdio: hold retuning if sdio in 1-bit
mode
> > > > >     262029c0c58c mmc: mtk-sd: Use readl_poll_timeout_atomic in
msdc_reset_hw
> > > > >     3e363db1c13a mtd: physmap-core: Restore map_rom fallback
> > > > >     71823463b1b2 mtd: spinand: micron: correct bitmask for ecc
status
> > > > >     a50d2f17d562 mtd: rawnand: arasan: Ensure program page
operations are successful
> > > > >     ae53c92e928c mtd: rawnand: marvell: Ensure program page
operations are successful
> > > > >     c0ca2ab23098 mtd: rawnand: pl353: Ensure program page
operations are successful
> > > > >     a7070628043e mtd: rawnand: qcom: Unmap the right resource
upon probe failure
> > > > >     3f928d1362f7 net: fix ifname in netlink ntf during netns move
> > > > >     ac43ec299a6f net: move from strlcpy with unused retval to
strscpy
> > > > >     30e2db403032 net: introduce a function to check if a netdev
name is in use
> > > > >     38ba5479355b Bluetooth: hci_event: Fix using memcmp when
comparing keys
> > > > >     3b2da6d62b42 net/mlx5: Handle fw tracer change ownership
event based on MTRC
> > > > >     f6e263824539 platform/x86: touchscreen_dmi: Add info for the
Positivo C4128B
> > > > >     ca56d8afe648 HID: multitouch: Add required quirk for
Synaptics 0xcd7e device
> > > > >     ca5bec7ecf26 btrfs: error out when reallocating block for
defrag using a stale transaction
> > > > >     2692fd37aaf4 btrfs: error when COWing block from a root that
is being deleted
> > > > >     ef491d9560d9 btrfs: error out when COWing block using a stale
transaction
> > > > >     f89ed0a09673 btrfs: fix some -Wmaybe-uninitialized warnings
in ioctl.c
> > > > >     df486b75feca drm: panel-orientation-quirks: Add quirk for One
Mix 2S
> > > > >     d5ba30ee4f6d ipv4/fib: send notify when delete source address
routes
> > > > >     9d07b7abd277 sky2: Make sure there is at least one frag_addr
available
> > > > >     f652eb4adf27 regulator/core: Revert "fix kobject release
warning and memory leak in regulator_register()"
> > > > >     aa77b187b1f0 wifi: cfg80211: avoid leaking stack data into
trace
> > > > >     30a2285a2e18 wifi: mac80211: allow transmitting EAPOL frames
with tainted key
> > > > >     b64eb31a1b53 wifi: cfg80211: Fix 6GHz scan configuration
> > > > >     bbec1724519e Bluetooth: hci_core: Fix build warnings
> > > > >     02b0e6991838 Bluetooth: Avoid redundant authentication
> > > > >     38681af225b6 Bluetooth: btusb: add shutdown function for
QCA6174
> > > > >     e6e9a32c3e60 HID: holtek: fix slab-out-of-bounds Write in
holtek_kbd_input_event
> > > > >     06aabf7715da wifi: iwlwifi: Ensure ack flag is properly
cleared.
> > > > >     6063f6f64fa4 wifi: mwifiex: Sanity check tlv_len and
tlv_bitmap_len
> > > > >     59ebfeb7b319 tracing: relax trace_event_eval_update()
execution with cond_resched()
> > > > >     3d85fb391fa7 ata: libata-eh: Fix compilation warning in
ata_eh_link_report()
> > > > >     89e3cc1b0703 ata: libata-core: Fix compilation warning in
ata_dev_config_ncq()
> > > > >     137c658ea3ce gpio: timberdale: Fix potential deadlock on
&tgpio->lock
> > > > >     68f106c2b2ab overlayfs: set ctime when setting mtime and atim=
e
> > > > >     ef3c62e2f0f1 i2c: mux: Avoid potential false error message in
i2c_mux_add_adapter
> > > > >     e2f64f3eebaa btrfs: initialize start_slot in
btrfs_log_prealloc_extents
> > > > >     266dab0ce42d btrfs: return -EUCLEAN for delayed tree ref with
a ref count not equals to 1
> > > > >     bc424f18fbdc fs-writeback: do not requeue a clean inode
having skipped pages
> > > > >     92609823592c ARM: dts: ti: omap: Fix noisy serial with
overrun-throttle-ms for mapphone
> > > > >     3898d8d685ab ksmbd: not allow to open file if delelete on
close bit is set
> > > > >     d3dc26c4fdc2 nfp: flower: avoid rmmod nfp crash issues
> > > > >     6c52b1215904 mctp: perform route lookups under a RCU
read-side lock
> > > > >     db3f17e571e8 mctp: Allow local delivery to the null EID
> > > > >     29017ab1a539 powerpc/47x: Fix 47x syscall return crash
> > > > >     558ee0fafd40 powerpc/32s: Do kuep_lock() and kuep_unlock() in
assembly
> > > > >     d00f4ae3accf powerpc/32s: Remove capability to disable KUEP
at boottime
> > > > >     fcb3f09e8173 drm/atomic-helper: relax unregistered connector
check
> > > > >     403d201d1fd1 perf/x86/lbr: Filter vsyscall addresses
> > > > >     419ac18d8808 perf/x86: Move branch classifier
> > > > >     030099bc9115 perf: Add irq and exception return branch types
> > > > >     ae80d5290c14 iio: adc: ad7192: Correct reference voltage
> > > > >     569a126f244b iio: cros_ec: fix an use-after-free in
cros_ec_sensors_push_data()
> > > > >     a9c471892d75 iio: core: introduce
iio_device_{claim|release}_buffer_mode() APIs
> > > > >     eafbb1966152 iio: core: Hide read accesses to
iio_dev->currentmode
> > > > >     919721348c04 iio: Un-inline iio_buffer_enabled()
> > > > >     7f74bc91eb00 serial: 8250_omap: Fix errors with
no_console_suspend
> > > > >     d67d831e1dbc serial: 8250: omap: Fix imprecise external abort
for omap_8250_pm()
> > > > >     aff3019b553e selftests/mm: fix awk usage in
charge_reserved_hugetlb.sh and hugetlb_reparenting_test.sh that may cause
error
> > > > >     4f1d3d1ca500 net: pktgen: Fix interface flags printing
> > > > >     8bdf95e29f86 netfilter: nf_tables: revert do not remove
elements if set backend implements .abort
> > > > >     cc19daa037f5 netfilter: nf_tables: do not remove elements if
set backend implements .abort
> > > > >     db33720697c8 netfilter: nft_set_rbtree: .deactivate fails if
element has expired
> > > > >     44768cad012c neighbor: tracing: Move pin6 inside
CONFIG_IPV6=3Dy section
> > > > >     b33179dbf3f2 net/sched: sch_hfsc: upgrade 'rt' to 'sc' when
it becomes a inner curve
> > > > >     0426d7bc17b8 bonding: Return pointer to data after pull on sk=
b
> > > > >     66982023d741 net: dsa: bcm_sf2: Fix possible memory leak in
bcm_sf2_mdio_register()
> > > > >     0ea476863ef7 i40e: prevent crash on probe if hw registers
have invalid values
> > > > >     f9202217a6ea net: usb: smsc95xx: Fix an error code in
smsc95xx_reset()
> > > > >     a2ceb30cc1fc ipv4: fib: annotate races around
nh->nh_saddr_genid and nh->nh_saddr
> > > > >     a270aa7a47db tun: prevent negative ifindex
> > > > >     9d55719f983d tcp: tsq: relax tcp_small_queue_check() when rtx
queue contains a single skb
> > > > >     8ae344291e38 tcp: fix excessive TLP and RACK timeouts from HZ
rounding
> > > > >     8b6b4ca42a94 net: rfkill: gpio: prevent value glitch during
probe
> > > > >     4df9ba0d7a82 net: ipv6: fix return value check in
esp_remove_trailer
> > > > >     a9651e66d0bd net: ipv4: fix return value check in
esp_remove_trailer
> > > > >     26a3c734cb8a xfrm: interface: use DEV_STATS_INC()
> > > > >     f8bc4b708b11 xfrm: fix a data-race in xfrm_gen_index()
> > > > >     b660e58ef72d qed: fix LL2 RX buffer allocation
> > > > >     d35f398b88a1 ASoC: codecs: wcd938x: fix unbind tear down orde=
r
> > > > >     d182d8ed7b7e ASoC: codecs: wcd938x: drop bogus bind error
handling
> > > > >     8d32a6b67e77 ASoC: codecs: wcd938x-sdw: fix runtime PM
imbalance on probe errors
> > > > >     6df571a6c153 ASoC: codecs: wcd938x-sdw: fix use after free on
driver unbind
> > > > >     36eabe87031f drm/i915: Retry gtt fault when out of fence
registers
> > > > >     34f62612be2a nvmet-tcp: Fix a possible UAF in queue
intialization setup
> > > > >     04e0eef74b8f netfilter: nft_payload: fix wrong mac header
matching
> > > > >     efe43d1bcbcb fs/ntfs3: fix deadlock in mark_as_free_ex
> > > > >     ab40c7ab7a93 fs/ntfs3: fix panic about slab-out-of-bounds
caused by ntfs_list_ea()
> > > > >     24badb9dd8b8 fs/ntfs3: Fix possible null-pointer dereference
in hdr_find_e()
> > > > >     ff38d2a705e1 tcp: check mptcp-level constraints for backlog
coalescing
> > > > >     582f7993353c x86/sev: Check for user-space IOIO pointing to
kernel space
> > > > >     5c2c01be809d x86/sev: Check IOBM for IOIO exceptions from
user-space
> > > > >     6797c6d09e50 x86/sev: Disable MMIO emulation from user mode
> > > > >     0b4e772a6a89 KVM: x86: Mask LVTPC when handling a PMI
> > > > >     f61c43be1eb9 regmap: fix NULL deref on lookup
> > > > >     ffdc881f6807 nfc: nci: fix possible NULL pointer dereference
in send_acknowledge()
> > > > >     d42aeae14fc4 ice: reset first in crash dump kernels
> > > > >     e42cecb513af ice: fix over-shifted variable
> > > > >     f6c093b97761 Bluetooth: avoid memcmp() out of bounds warning
> > > > >     e5f8b43c9c90 Bluetooth: hci_event: Fix coding style
> > > > >     1597c1ed0e7d Bluetooth: vhci: Fix race when opening vhci
device
> > > > >     1ef071526848 Bluetooth: Fix a refcnt underflow problem for
hci_conn
> > > > >     dd6b62fdd245 Bluetooth: Reject connection with the device
which has same BD_ADDR
> > > > >     848a05c4423f Bluetooth: hci_event: Ignore NULL link key
> > > > >     e7a2aa7770d3 xfs: don't expose internal symlink metadata
buffers to the vfs
> > > > >     fe5c6fbc5e4a Documentation: sysctl: align cells in second
content column
> > > > >     1815844652cc lib/Kconfig.debug: do not enable DEBUG_PREEMPT
by default
> > > > >     00c03985402e Linux 5.15.136
> > > > >     5266b5b6e975 eth: remove remaining copies of the
NAPI_POLL_WEIGHT define
> > > > >     528f0ba9f7a4 usb: hub: Guard against accesses to
uninitialized BOS descriptors
> > > > >     542a3f1a3cc1 Revert "kernel/sched: Modify initial boot task
idle setup"
> > > > >     737ce5518a9c arm64: armv8_deprecated: fix unused-function
error
> > > > >     2e10931e2d77 arm64: armv8_deprecated: rework deprected
instruction handling
> > > > >     abd4aa081905 arm64: armv8_deprecated: move aarch32 helper
earlier
> > > > >     f10abdb04c3d arm64: armv8_deprecated move emulation functions
> > > > >     0b4eec015fa5 arm64: armv8_deprecated: fold ops into
insn_emulation
> > > > >     a8d2910be6f8 arm64: rework EL0 MRS emulation
> > > > >     057f9123b1a8 arm64: factor insn read out of call_undef_hook()
> > > > >     3f82927cabaf arm64: factor out EL1 SSBS emulation hook
> > > > >     474385adcd84 arm64: split EL0/EL1 UNDEF handlers
> > > > >     de0358635401 arm64: allow kprobes on EL0 handlers
> > > > >     7154e2db8890 arm64: rework BTI exception handling
> > > > >     cd5ceadc2b37 arm64: rework FPAC exception handling
> > > > >     b6358002fd0c arm64: consistently pass ESR_ELx to die()
> > > > >     7ddb1ef2bb42 arm64: die(): pass 'err' as long
> > > > >     9a3e177ef570 arm64: report EL1 UNDEFs better
> > > > >     d6808be3ff94 powerpc/64e: Fix wrong test in
__ptep_test_and_clear_young()
> > > > >     9c0dc3e2c996 powerpc/8xx: Fix pte_access_permitted() for
PAGE_NONE
> > > > >     4da05eba66e6 dmaengine: mediatek: Fix deadlock caused by
synchronize_irq()
> > > > >     82f61b2d5187 dmaengine: idxd: use spin_lock_irqsave before
wait_event_lock_irq
> > > > >     ecba5afe86f3 x86/alternatives: Disable KASAN in
apply_alternatives()
> > > > >     cbd2aac00498 usb: cdnsp: Fixes issue with dequeuing not
queued requests
> > > > >     7014807fb7ef usb: gadget: ncm: Handle decoding of multiple
NTB's in unwrap call
> > > > >     50259cf71a1b usb: gadget: udc-xilinx: replace memcpy with
memcpy_toio
> > > > >     308f19249641 counter: microchip-tcb-capture: Fix the use of
internal GCLK logic
> > > > >     5a6ce81d7c16 pinctrl: avoid unsafe code pattern in
find_pinctrl()
> > > > >     1c790191cab4 cgroup: Remove duplicates in cgroup v1 tasks fil=
e
> > > > >     1680c82929bc tee: amdtee: fix use-after-free vulnerability in
amdtee_close_session
> > > > >     b8ec40a90acd Input: goodix - ensure int GPIO is in input for
gpio_count =3D=3D 1 && gpio_int_idx =3D=3D 0 case
> > > > >     d092630e8a20 Input: i8042 - add Fujitsu Lifebook E5411 to
i8042 quirk table
> > > > >     7cea6fa2d73f Input: xpad - add PXN V900 support
> > > > >     6ff4e50e2d2a Input: psmouse - fix fast_reconnect function for
PS/2 mode
> > > > >     6a4a39638640 Input: powermate - fix use-after-free in
powermate_config_complete
> > > > >     6ad7f52d8c58 ceph: fix type promotion bug on 32bit systems
> > > > >     c0c4acd53a98 ceph: fix incorrect revoked caps assert in
ceph_fill_file_size()
> > > > >     58f0e6324ec7 libceph: use kernel_connect()
> > > > >     d727b97f8f2e thunderbolt: Check that lane 1 is in CL0 before
enabling lane bonding
> > > > >     04c38bedd07c thunderbolt: Workaround an IOMMU fault on
certain systems with Intel Maple Ridge
> > > > >     a586742a3780 mcb: remove is_added flag from mcb_device struct
> > > > >     4382d1a996e5 x86/cpu: Fix AMD erratum #1485 on Zen4-based CPU=
s
> > > > >     763167003a80 ACPI: resource: Skip IRQ override on ASUS
ExpertBook B1402CBA
> > > > >     510d4a01d84c drm/amd/display: Don't set dpms_off for seamless
boot
> > > > >     9cb61ab9f4ca drm/amdgpu: add missing NULL check
> > > > >     f9a1af37b801 iio: pressure: ms5611: ms5611_prom_is_valid
false negative bug
> > > > >     09b8ed9547f1 iio: pressure: dps310: Adjust Timeout Settings
> > > > >     4c80ecef859d iio: pressure: bmp280: Fix NULL pointer exceptio=
n
> > > > >     a625de7e5464 usb: musb: Modify the "HWVers" register address
> > > > >     eb28694f6da8 usb: musb: Get the musb_qh poniter after
musb_giveback
> > > > >     ee88141873a8 usb: cdns3: Modify the return value of
cdns_set_active () to void when CONFIG_PM_SLEEP is disabled
> > > > >     3b2dbc4f3302 usb: dwc3: Soft reset phy on probe for host
> > > > >     42c56e015653 net: usb: dm9601: fix uninitialized variable use
in dm9601_mdio_read
> > > > >     524f45361789 usb: xhci: xhci-ring: Use sysdev for mapping
bounce buffer
> > > > >     1d8e7fe85528 xhci: Keep interrupt disabled in initialization
until host is running.
> > > > >     cb34e3b25c37 dmaengine: stm32-mdma: abort resume if no
ongoing transfer
> > > > >     d56dbfe750a8 media: mtk-jpeg: Fix use after free bug due to
uncanceled work
> > > > >     5e13e69ddf0d net: release reference to inet6_dev pointer
> > > > >     aade10d51ddc net: change accept_ra_min_rtr_lft to affect all
RA lifetimes
> > > > >     8f12d2d66cba net: add sysctl accept_ra_min_rtr_lft
> > > > >     bc9f6cbeb999 workqueue: Override implicit ordered attribute
in workqueue_apply_unbound_cpumask()
> > > > >     25dd54b95abf nfc: nci: assert requested protocol is valid
> > > > >     b2bb3b43b94a pinctrl: renesas: rzn1: Enable missing PINMUX
> > > > >     c4140dd77c3b net/smc: Fix pos miscalculation in statistics
> > > > >     d888d3f70b0d net: nfc: fix races in nfc_llcp_sock_get() and
nfc_llcp_sock_get_sn()
> > > > >     249a1fdb95d5 net/mlx5e: Again mutually exclude RX-FCS and
RX-port-timestamp
> > > > >     2112cacb38aa ixgbe: fix crash with empty VF macvlan list
> > > > >     935a15334d77 net: phy: mscc: macsec: reject PN update request=
s
> > > > >     667fe9101a3a net: macsec: indicate next pn update when
offloading
> > > > >     2dcb31e65d26 bpf: Fix verifier log for async callback return
values
> > > > >     6a217af2c67f drm/vmwgfx: fix typo of sizeof argument
> > > > >     72ef70886556 riscv, bpf: Sign-extend return values
> > > > >     7795592e0818 riscv, bpf: Factor out emit_call for kernel and
bpf context
> > > > >     58941cc742ca xen-netback: use default TX queue size for vifs
> > > > >     cffdced18af8 eth: remove copies of the NAPI_POLL_WEIGHT defin=
e
> > > > >     5c360eec5332 mlxsw: fix mlxsw_sp2_nve_vxlan_learning_set()
return type
> > > > >     84c6aa0ae5c4 ieee802154: ca8210: Fix a potential UAF in
ca8210_probe
> > > > >     616761cf9df9 ravb: Fix use-after-free issue in
ravb_tx_timeout_work()
> > > > >     30ebd4177593 ravb: Fix up dma_free_coherent() call in
ravb_remove()
> > > > >     3f39de2bd1d2 drm/msm/dpu: change _dpu_plane_calc_bw() to use
u64 to avoid overflow
> > > > >     85ae07d4dcc6 drm/msm/dsi: fix irq_of_parse_and_map() error
checking
> > > > >     9a890c7d4d0f drm/msm/dsi: skip the wait for video mode done
if not applicable
> > > > >     b9de60b6830c drm/msm/dp: do not reinitialize phy unless retry
during link training
> > > > >     afe5f596b588 KEYS: trusted: Remove redundant static calls
usage
> > > > >     20e73ece06b3 KEYS: trusted: allow use of kernel RNG for key
material
> > > > >     a01d68b6c666 ALSA: usb-audio: Fix microphone sound on
Opencomm2 Headset
> > > > >     5b5e58299eac net: prevent address rewrite in kernel_bind()
> > > > >     56e96b38d2f7 quota: Fix slow quotaoff
> > > > >     28ddc1e0b898 HID: logitech-hidpp: Fix kernel crash on
receiver USB disconnect
> > > > >     b930f0f7bbc2 lib/test_meminit: fix off-by-one error in
test_pages()
> > > > >     982bd86fd659 platform/x86: hp-wmi:: Mark driver struct with
__refdata to prevent section mismatch warning
> > > > >     124cf0ea4b82 platform/x86: think-lmi: Fix reference leak
> > > > >     3d2a16f878f0 of: overlay: Reorder struct fragment fields
kerneldoc
> > > > >     10f4a0b6657e perf/arm-cmn: Fix the unhandled overflow status
of counter 4 to 7
> > > > >     b7966e2191d0 RDMA/cxgb4: Check skb value for failure to
allocate
> > > > >     b9bdffb3f9aa RDMA/srp: Do not call scsi_done() from
srp_abort()
> > > > >     7d4999589ebc scsi: ib_srp: Call scsi_done() directly
> > > > >     d2746cdfd5e5 scsi: core: Rename scsi_mq_done() into
scsi_done() and export it
> > > > >     8f2350e204da scsi: core: Use a structure member to track the
SCSI command submitter
> > > > >     29298c85a81a iommu/vt-d: Avoid memory allocation in
iommu_suspend()
> > > > >     02e21884dcf2 Linux 5.15.135
> > > > >     c8af81a9d36e xen/events: replace evtchn_rwlock with RCU
> > > > >     c346494ec7f1 parisc: Restore __ldcw_align for PA-RISC 2.0
processors
> > > > >     694e13732e83 ksmbd: fix uaf in smb20_oplock_break_ack
> > > > >     e914c3a47e45 RDMA/mlx5: Fix NULL string error
> > > > >     81b7bf367eea RDMA/siw: Fix connection failure handling
> > > > >     5d8bd138204f RDMA/uverbs: Fix typo of sizeof argument
> > > > >     60c9ed88526d RDMA/cma: Fix truncation compilation warning in
make_cma_ports
> > > > >     7f6136ced1b8 RDMA/cma: Initialize ib_sa_multicast structure
to 0 when join
> > > > >     1dd6095fc727 gpio: pxa: disable pinctrl calls for MMP_GPIO
> > > > >     844fcf4c697c gpio: aspeed: fix the GPIO number passed to
pinctrl_gpio_set_config()
> > > > >     1878d6666c32 IB/mlx4: Fix the size of a buffer in
add_port_entries()
> > > > >     718d9b44afca of: dynamic: Fix potential memory leak in
of_changeset_action()
> > > > >     e0878f38b661 RDMA/core: Require admin capabilities to set
system parameters
> > > > >     18a839064fc6 dm zoned: free dmz->ddev array in
dmz_put_zoned_devices
> > > > >     8781fe259dd5 HID: intel-ish-hid: ipc: Disable and reenable
ACPI GPE bit
> > > > >     949ccc91c35b HID: sony: remove duplicate NULL check before
calling usb_free_urb()
> > > > >     a02c02adc2bd sctp: update hb timer immediately after users
change hb_interval
> > > > >     7783b471bfce sctp: update transport state when processing a
dupcook packet
> > > > >     1abac613c0d5 tcp: fix delayed ACKs for MSS boundary condition
> > > > >     821b3b00bc0f tcp: fix quick-ack counting to count actual ACKs
of new data
> > > > >     24fb22bddb71 tipc: fix a potential deadlock on &tx->lock
> > > > >     2e53585e233c net: stmmac: dwmac-stm32: fix resume on STM32 MC=
U
> > > > >     74e569324050 ipv4: Set offload_failed flag in fibmatch result=
s
> > > > >     a4b9bbd1d12f netfilter: nf_tables: nft_set_rbtree: fix
spurious insertion failure
> > > > >     88497f74d684 netfilter: handle the connecting collision
properly in nf_conntrack_proto_sctp
> > > > >     0c9cf5e8807f ibmveth: Remove condition to recompute TCP
header checksum.
> > > > >     5a899e2ce848 net: ethernet: ti: am65-cpsw: Fix error code in
am65_cpsw_nuss_init_tx_chns()
> > > > >     4837a192f6d0 net: nfc: llcp: Add lock when modifying device
list
> > > > >     cda10784a176 net: usb: smsc75xx: Fix uninit-value access in
__smsc75xx_read_reg
> > > > >     2801a1ddb26d net: dsa: mv88e6xxx: Avoid EEPROM timeout when
EEPROM is absent
> > > > >     cb145e6c2070 ptp: ocp: Fix error handling in
ptp_ocp_device_init
> > > > >     cd1189956393 ipv4, ipv6: Fix handling of transhdrlen in
__ip{,6}_append_data()
> > > > >     147d89ee4143 net: fix possible store tearing in
neigh_periodic_work()
> > > > >     bdb4fcf18e16 modpost: add missing else to the "of" check
> > > > >     bc8b89b69638 bpf, sockmap: Reject sk_msg egress redirects to
non-TCP sockets
> > > > >     9fb4dfb8e212 NFSv4: Fix a nfs4_state_manager() race
> > > > >     fcdd79fda38a ima: rework CONFIG_IMA dependency block
> > > > >     b67adca1e1be scsi: target: core: Fix deadlock due to
recursive locking
> > > > >     9a103e0b100c ima: Finish deprecation of IMA_TRUSTED_KEYRING
Kconfig
> > > > >     bb6aee0696c6 regmap: rbtree: Fix wrong register marked as
in-cache when creating new node
> > > > >     0cee8c1b3af3 wifi: mt76: mt76x02: fix MT76x0 external LNA
gain handling
> > > > >     3f6fbbccba2d drivers/net: process the result of hdlc_open()
and add call of hdlc_close() in uhdlc_close()
> > > > >     ebad2e4c4847 bpf: Fix tr dereferencing
> > > > >     5afb996349cb wifi: mwifiex: Fix oob check condition in
mwifiex_process_rx_packet
> > > > >     7c8faa310803 wifi: iwlwifi: mvm: Fix a memory corruption issu=
e
> > > > >     5db7af530ebd iwlwifi: avoid void pointer arithmetic
> > > > >     6ff75f524dae wifi: iwlwifi: dbg_ini: fix structure packing
> > > > >     0ea2a6349733 ubi: Refuse attaching if mtd's erasesize is 0
> > > > >     bb0707fde749 HID: sony: Fix a potential memory leak in
sony_probe()
> > > > >     8afbacf61919 arm64: Add Cortex-A520 CPU part definition
> > > > >     0da6d21ba235 drm/amd: Fix detection of _PR3 on the PCIe root
port
> > > > >     1ad7ccd45a65 net: prevent rewrite of msg_name in
sock_sendmsg()
> > > > >     0fb3df94274b net: replace calls to sock->ops->connect() with
kernel_connect()
> > > > >     37b54e8acea5 wifi: mwifiex: Fix tlv_buf_left calculation
> > > > >     e80f55d6d2a9 qed/red_ll2: Fix undefined behavior bug in
struct qed_ll2_info
> > > > >     1e69422efcc6 vringh: don't use vringh_kiov_advance() in
vringh_iov_xfer()
> > > > >     4e2f83952b1d scsi: zfcp: Fix a double put in
zfcp_port_enqueue()
> > > > >     310bca649b30 Revert "clk: imx: pll14xx: dynamically configure
PLL for 393216000/361267200Hz"
> > > > >     3f59e63568ad block: fix use-after-free of q->q_usage_counter
> > > > >     b75b017b3f37 rbd: take header_rwsem in rbd_dev_refresh() only
when updating
> > > > >     33229d783466 rbd: decouple parent info read-in from updating
rbd_dev
> > > > >     ab73e7ed79d3 rbd: decouple header read-in from updating
rbd_dev->header
> > > > >     b4ddad3fb0ea rbd: move rbd_dev_refresh() definition
> > > > >     bb1fae816c90 iommu/arm-smmu-v3: Avoid constructing invalid
range commands
> > > > >     c4edc7b5c836 iommu/arm-smmu-v3: Set TTL invalidation hint
better
> > > > >     a98ad3adf60d arm64: Avoid repeated AA64MMFR1_EL1 register
read on pagefault path
> > > > >     aad6ba1715ec ring-buffer: Fix bytes info in per_cpu buffer
stats
> > > > >     8012d0b05158 ring-buffer: remove obsolete comment for
free_buffer_page()
> > > > >     65a218ca516e NFSv4: Fix a state manager thread deadlock
regression
> > > > >     8454a2f5e930 NFS: rename nfs_client_kset to nfs_kset
> > > > >     f8b0b6a8e196 NFS: Cleanup unused rpc_clnt variable
> > > > >     686746be7bfb ASoC: tegra: Fix redundant PLLA and PLLA_OUT0
updates
> > > > >     0a210e63844b ASoC: soc-utils: Export snd_soc_dai_is_dummy()
symbol
> > > > >     b4f7f1556813 spi: zynqmp-gqspi: fix clock imbalance on probe
failure
> > > > >     e514f897ad66 spi: zynqmp-gqspi: Convert to platform remove
callback returning void
> > > > >     1edcec18cfb7 Linux 5.15.134
> > > > >     09a683023785 netfilter: nf_tables: fix kdoc warnings after gc
rework
> > > > >     66cb6d74f5a1 drm/meson: fix memory leak on ->hpd_notify
callback
> > > > >     91f1f025b6d9 fs: binfmt_elf_efpic: fix personality for
ELF-FDPIC
> > > > >     1cae7473a6dd ata: libata-sata: increase PMP SRST timeout to
10s
> > > > >     e74adc589922 ata: libata-core: Do not register PM operations
for SAS ports
> > > > >     4cbd55a81965 ata: libata-core: Fix port and device removal
> > > > >     ddc525fffb44 ata: libata-core: Fix ata_port_request_pm()
locking
> > > > >     2990a195edb5 net: thunderbolt: Fix TCPv6 GSO checksum
calculation
> > > > >     132a5ae4136b bpf: Fix BTF_ID symbol generation collision in
tools/
> > > > >     58d560e98da5 bpf: Fix BTF_ID symbol generation collision
> > > > >     f8673f651bc1 btrfs: properly report 0 avail for very full
file systems
> > > > >     b5d00cd7db66 ring-buffer: Update "shortest_full" in polling
> > > > >     00d2cb8066cb proc: nommu: /proc/<pid>/maps: release mmap read
lock
> > > > >     40527ebb3e45 Revert "SUNRPC dont update timeout value on
connection reset"
> > > > >     a2b1d486fb70 io_uring/fs: remove sqe->rw_flags checking from
LINKAT
> > > > >     111fe77cb13f sched/rt: Fix live lock between
select_fallback_rq() and RT push
> > > > >     3569ad59664f kernel/sched: Modify initial boot task idle setu=
p
> > > > >     07f78e97676c i2c: i801: unregister tco_pdev in i801_probe()
error path
> > > > >     70df8b9c59bc ata: libata-scsi: ignore reserved bits for
REPORT SUPPORTED OPERATION CODES
> > > > >     a7e0c10a8c33 ALSA: hda: Disable power save for solving pop
issue on Lenovo ThinkCentre M70q
> > > > >     0c5fd85fb01f netfilter: nf_tables: disallow rule removal from
chain binding
> > > > >     3936e8714907 nilfs2: fix potential use after free in
nilfs_gccache_submit_read_data()
> > > > >     2b837f13a818 serial: 8250_port: Check IRQ data before use
> > > > >     a48d2bcd23f2 Revert "tty: n_gsm: fix UAF in gsm_cleanup_mux"
> > > > >     78e70c6238d2 misc: rtsx: Fix some platforms can not boot and
move the l1ss judgment to probe
> > > > >     f090a8b4d2e3 x86/srso: Add SRSO mitigation for Hygon
processors
> > > > >     f5a604757aa8 iommu/arm-smmu-v3: Fix soft lockup triggered by
arm_smmu_mm_invalidate_range
> > > > >     efce75bd2dbc Smack:- Use overlay inode label in
smack_inode_copy_up()
> > > > >     0e3450487f99 smack: Retrieve transmuting information in
smack_inode_getsecurity()
> > > > >     3586b3feed1b smack: Record transmuting in smk_transmuted
> > > > >     9690ad557d94 nvme-pci: always return an ERR_PTR from
nvme_pci_alloc_dev
> > > > >     3c29c6e8cd7c scsi: qla2xxx: Fix NULL pointer dereference in
target mode
> > > > >     6e5e4223c897 i40e: fix potential NULL pointer dereferencing
of pf->vf i40e_sync_vsi_filters()
> > > > >     aff3994d4bdd watchdog: iTCO_wdt: Set NO_REBOOT if the
watchdog is not already running
> > > > >     83a30e945571 watchdog: iTCO_wdt: No need to stop the timer in
probe
> > > > >     1e8c573f50a7 nvme-pci: do not set the NUMA node of device if
it has none
> > > > >     182d13dadb03 nvme-pci: factor out a nvme_pci_alloc_dev helper
> > > > >     af58072e867c nvme-pci: factor the iod mempool creation into a
helper
> > > > >     c8bc44936f2c cgroup: Fix suspicious rcu_dereference_check()
usage warning
> > > > >     ce6b88a5853d sched/cpuacct: Optimize away RCU read lock
> > > > >     b1deb155524e perf build: Define YYNOMEM as YYNOABORT for
bison < 3.81
> > > > >     86e65ffc4d0f fbdev/sh7760fb: Depend on FB=3Dy
> > > > >     4bf0044fe43f ncsi: Propagate carrier gain/loss events to the
NCSI controller
> > > > >     288990ec3580 powerpc/watchpoints: Annotate atomic context in
more places
> > > > >     47a94e87f00c powerpc/watchpoint: Disable pagefaults when
getting user instruction
> > > > >     7eb09f70d9c2 powerpc/watchpoints: Disable preemption in
thread_change_pc()
> > > > >     134b01a39077 media: vb2: frame_vector.c: replace WARN_ONCE
with a comment
> > > > >     baf7cf0fdb83 ASoC: imx-rpmsg: Set ignore_pmdown_time for
dai_link
> > > > >     9da93c74490c bpf: Clarify error expectations from
bpf_clone_redirect
> > > > >     e1a8b79ad768 ASoC: fsl: imx-pcm-rpmsg: Add
SNDRV_PCM_INFO_BATCH flag
> > > > >     45e028accbdf spi: stm32: add a delay before SPI disable
> > > > >     25850bf83dcd spi: nxp-fspi: reset the FLSHxCR1 registers
> > > > >     50662d21e414 ata: libata-eh: do not clear
ATA_PFLAG_EH_PENDING in ata_eh_reset()
> > > > >     8e3cdab909db smb3: correct places where ENOTSUPP is used
instead of preferred EOPNOTSUPP
> > > > >     d540a4370aba scsi: pm80xx: Avoid leaking tags when processing
OPC_INB_SET_CONTROLLER_CONFIG command
> > > > >     fde57d7ba9b3 scsi: pm80xx: Use phy-specific SAS address when
sending PHY_START command
> > > > >     a1589abd7c4a drm/amdgpu: Handle null atom context in VBIOS
info ioctl
> > > > >     fd334cfd8412 drm/amd/display: Don't check registers, if using
AUX BL control
> > > > >     a8bc0f6357af platform/mellanox: mlxbf-bootctl: add NET
dependency into Kconfig
> > > > >     344f2f3e61a9 ring-buffer: Do not attempt to read past "commit=
"
> > > > >     3db9b420709b selftests: fix dependency checker script
> > > > >     4aa90e624c30 btrfs: improve error message after failure to
add delayed dir index item
> > > > >     53e7c559b7bf ring-buffer: Avoid softlockup in
ring_buffer_resize()
> > > > >     b4874f72cf57 selftests/ftrace: Correctly enable event in
instance-event.tc
> > > > >     8c5c9ecbfa8d scsi: ufs: core: Move __ufshcd_send_uic_cmd()
outside host_lock
> > > > >     e08e61d50a30 scsi: qedf: Add synchronization between I/O
completions and abort
> > > > >     ada7fcba2d6a parisc: irq: Make irq_stack_union static to
avoid sparse warning
> > > > >     b7e376a26b0c parisc: drivers: Fix sparse warning
> > > > >     d8c6fad00282 parisc: iosapic.c: Fix sparse warnings
> > > > >     1ecdcfec4e4a parisc: sba: Fix compile warning wrt list of SBA
devices
> > > > >     bd1ec7f9983b spi: sun6i: fix race between DMA RX transfer
completion and RX FIFO drain
> > > > >     ff05ed4ae214 spi: sun6i: reduce DMA RX transfer width to
single byte
> > > > >     ac0d06809934 dma-debug: don't call
__dma_entry_alloc_check_leak() under free_entries_lock
> > > > >     d938c3d278d5 i2c: npcm7xx: Fix callback completion ordering
> > > > >     0c615323a745 gpio: pmic-eic-sprd: Add can_sleep flag for PMIC
EIC chip
> > > > >     2a47ee15a6ab soc: imx8m: Enable OCOTP clock for imx8mm before
reading registers
> > > > >     7c59b882b9b3 xtensa: boot/lib: fix function prototypes
> > > > >     70460e81e2d1 xtensa: boot: don't add include-dirs
> > > > >     bc51434b6612 xtensa: iss/network: make functions static
> > > > >     8e0f78a84f64 xtensa: add default definition for
XCHAL_HAVE_DIV32
> > > > >     be57fc50dc3c firmware: imx-dsp: Fix an error handling path in
imx_dsp_setup_channels()
> > > > >     1df81ea9e4db power: supply: ucs1002: fix error code in
ucs1002_get_property()
> > > > >     6937e44ffb91 bus: ti-sysc: Fix SYSC_QUIRK_SWSUP_SIDLE_ACT
handling for uart wake-up
> > > > >     0e75aa86a7d0 ARM: dts: ti: omap: motorola-mapphone: Fix
abe_clkctrl warning on boot
> > > > >     1b39eae11752 ARM: dts: ti: omap: Fix bandgap thermal cells
addressing for omap3/4
> > > > >     fcbf770c66ef ARM: dts: omap: correct indentation
> > > > >     f5e12de36ab3 treewide: Replace GPLv2 boilerplate/reference
with SPDX - gpl-2.0_56.RULE (part 1)
> > > > >     6829bc7978e0 clk: tegra: fix error return case for recalc_rat=
e
> > > > >     78277b096d4c bus: ti-sysc: Fix missing AM35xx SoC matching
> > > > >     5435a49b3b66 bus: ti-sysc: Use fsleep() instead of
usleep_range() in sysc_reset()
> > > > >     c39df101d8ca drm/bridge: ti-sn65dsi83: Do not generate
HFP/HBP/HSA and EOT packet
> > > > >     4bf10fd51ca5 MIPS: Alchemy: only build mmc support helpers if
au1xmmc is enabled
> > > > >     d2640d86876e btrfs: reset destination buffer when
read_extent_buffer() gets invalid range
> > > > >     1a541999f31f scsi: qla2xxx: Use raw_smp_processor_id()
instead of smp_processor_id()
> > > > >     532a23960566 scsi: qla2xxx: Select qpair depending on which
CPU post_cmd() gets called
> > > > >     6642b4eb083b ata: ahci: Add Elkhart Lake AHCI controller
> > > > >     072611960741 ata: ahci: Rename board_ahci_mobile
> > > > >     8274154712a0 ata: ahci: Add support for AMD A85 FCH (Hudson
D4)
> > > > >     bd69c74dca70 ata: libata: Rename link flag
ATA_LFLAG_NO_DB_DELAY
> > > > >     f5ba6d9d6bec netfilter: nft_exthdr: Fix non-linear header
modification
> > > > >     7ca3a1b0f474 netfilter: exthdr: add support for tcp option
removal
> > > > >     fb6f65780c9c Input: i8042 - add quirk for TUXEDO Gemini 17
Gen1/Clevo PD70PN
> > > > >     191fc23cfa9a Input: i8042 - rename i8042-x86ia64io.h to
i8042-acpipnpio.h
> > > > >     5d2b57c0bc40 xfs: fix xfs_inodegc_stop racing with
mod_delayed_work
> > > > >     657f842859c4 xfs: disable reaping in fscounters scrub
> > > > >     8444467eadb2 xfs: check that per-cpu inodegc workers actually
run on that cpu
> > > > >     67db9ecb84d5 xfs: explicitly specify cpu when forcing inodegc
delayed work to run immediately
> > > > >     99e65f075e6c xfs: introduce xfs_inodegc_push()
> > > > >     2df381963240 xfs: bound maximum wait time for inodegc work
> > > > >     08dc21596751 i2c: mux: gpio: Add missing fwnode_handle_put()
> > > > >     f912d9d87421 i2c: mux: gpio: Replace custom
acpi_get_local_address()
> > > > >     1aa39eee57f6 i2c: mux: demux-pinctrl: check the return value
of devm_kstrdup()
> > > > >     9910b1411e7e gpio: tb10x: Fix an error handling path in
tb10x_gpio_probe()
> > > > >     d7acb7031758 Fix up backport of 136191703038 ("interconnect:
Teach lockdep about icc_bw_lock order")
> > > > >     d645206e9be2 igc: Expose tx-usecs coalesce setting to user
> > > > >     d7a2bf6faa82 bnxt_en: Flush XDP for bnxt_poll_nitroa0()'s NAP=
I
> > > > >     56d2418a079a net: ena: Flush XDP packets on error.
> > > > >     07b569051f6e locking/seqlock: Do the lockdep annotation
before locking in do_write_seqcount_begin_nested()
> > > > >     a70dbdede0c7 netfilter: ipset: Fix race between
IPSET_CMD_CREATE and IPSET_CMD_SWAP
> > > > >     0dcc9b4097d8 netfilter: nf_tables: disable toggling dormant
table state more than once
> > > > >     ea82139e6e35 net: rds: Fix possible NULL-pointer dereference
> > > > >     cd05eec2ee0c team: fix null-ptr-deref when team device type
is changed
> > > > >     8bc97117b51d net: bridge: use DEV_STATS_INC()
> > > > >     0d3939cccb20 net: hns3: add 5ms delay before clear firmware
reset irq source
> > > > >     d6d182d856d0 net: hns3: fix fail to delete tc flower rules
during reset issue
> > > > >     7c47b238f4ec net: hns3: only enable unicast promisc when mac
table full
> > > > >     96af9a55b782 net: hns3: fix GRE checksum offload issue
> > > > >     13ea4b92e875 x86/srso: Fix SBPB enablement for
spec_rstack_overflow=3Doff
> > > > >     e2c34afe8362 x86/srso: Fix srso_show_state() side effect
> > > > >     21efa88e777f platform/x86: intel_scu_ipc: Fail IPC send if
still busy
> > > > >     0a5d236b52cf platform/x86: intel_scu_ipc: Don't override scu
in intel_scu_ipc_dev_simple_command()
> > > > >     ab78000c38b4 platform/x86: intel_scu_ipc: Check status upon
timeout in ipc_wait_for_interrupt()
> > > > >     47329633b3f0 platform/x86: intel_scu_ipc: Check status after
timeout in busy_loop()
> > > > >     26df9ab5de30 dccp: fix dccp_v4_err()/dccp_v6_err() again
> > > > >     3b14e8431855 powerpc/perf/hv-24x7: Update domain value check
> > > > >     8860d354f653 ipv4: fix null-deref in ipv4_link_failure
> > > > >     c196ecd3f893 igc: Fix infinite initialization loop with early
XDP redirect
> > > > >     a2d69dcb6ccb ionic: fix 16bit math issue when PAGE_SIZE >=3D
64KB
> > > > >     3796e449a03e i40e: Fix VF VLAN offloading when port VLAN is
configured
> > > > >     a628f3b5cd8d i40e: Add VF VLAN pruning
> > > > >     7a9eee3b5d4d iavf: do not process adminq tasks when
__IAVF_IN_REMOVE_TASK is set
> > > > >     f3c6a17900e8 ASoC: imx-audmix: Fix return error with
devm_clk_get()
> > > > >     f90a7b9586d7 net/core: Fix ETH_P_1588 flow dissector
> > > > >     55629e616452 selftests: tls: swap the TX and RX sockets in
some tests
> > > > >     acabf5df49aa bpf: Avoid deadlock when using queue and stack
maps from NMI
> > > > >     c6e44f4c31c5 netfilter: nf_tables: disallow element removal
on anonymous sets
> > > > >     6a8de7775329 ASoC: meson: spdifin: start hw on dai probe
> > > > >     ef99506eaf1d netfilter: nf_tables: fix memleak when more than
255 elements expired
> > > > >     8d7a00b904da netfilter: nft_set_hash: try later when GC hits
EAGAIN on iteration
> > > > >     83d3a4607c58 netfilter: nft_set_pipapo: stop GC iteration if
GC transaction allocation fails
> > > > >     949369f9f0d9 netfilter: nft_set_pipapo: call
nft_trans_gc_queue_sync() in catchall GC
> > > > >     2e6846b613fa netfilter: nft_set_rbtree: use read spinlock to
avoid datapath contention
> > > > >     9af7dfb3c9d7 netfilter: nft_set_rbtree: skip sync GC for new
elements in this transaction
> > > > >     9366966caf1a netfilter: nf_tables: defer gc run if previous
batch is still pending
> > > > >     082791b42123 netfilter: nf_tables: use correct lock to
protect gc_list
> > > > >     b44a459c6561 netfilter: nf_tables: GC transaction race with
abort path
> > > > >     24707fa1e1f9 netfilter: nf_tables: GC transaction race with
netns dismantle
> > > > >     6796800f0d8e netfilter: nf_tables: fix GC transaction races
with netns and netlink event exit path
> > > > >     af78b0489e88 netfilter: nf_tables: don't fail inserts if
duplicate has expired
> > > > >     8f24fe69e3ca netfilter: nf_tables: remove busy mark and gc
batch API
> > > > >     b290795bd26f netfilter: nft_set_hash: mark set element as
dead when deleting from packet path
> > > > >     479a2cf52593 netfilter: nf_tables: adapt set backend to use
GC transaction API
> > > > >     d19e8bf3ea41 netfilter: nf_tables: GC transaction API to
avoid race with control plane
> > > > >     7c7e658a36f8 netfilter: nf_tables: don't skip expired
elements during walk
> > > > >     a2d1125ee04e tracing: Have event inject files inc the trace
array ref count
> > > > >     6b6c088c38f7 ext4: do not let fstrim block system suspend
> > > > >     a9d3bb58da95 ext4: move setting of trimmed bit into
ext4_try_to_trim_range()
> > > > >     d91abea15c61 ext4: replace the traditional ternary
conditional operator with with max()/min()
> > > > >     656f0495e4ac ext4: change s_last_trim_minblks type to
unsigned long
> > > > >     be57857fb3c3 ext4: scope ret locally in
ext4_try_to_trim_range()
> > > > >     e832b55881a1 ata: libahci: clear pending interrupt status
> > > > >     f6189f373151 ata: ahci: Drop pointless VPRINTK() calls and
convert the remaining ones
> > > > >     fa6d449e4d02 tracing: Increase trace array ref count on
enable and filter files
> > > > >     7a688f191a17 tracing: Make trace_marker{,_raw} stream-like
> > > > >     68fc0e75c793 NFSv4.1: fix pnfs MDS=3DDS session trunking
> > > > >     0ff78c455494 NFSv4.1: use EXCHGID4_FLAG_USE_PNFS_DS for DS
server
> > > > >     d381bfe13895 SUNRPC: Mark the cred for revalidation if the
server rejects it
> > > > >     f1c434ddafe6 NFS/pNFS: Report EINVAL errors from connect() to
the server
> > > > >     0c0a7e1f2a6a NFS: More fixes for
nfs_direct_write_reschedule_io()
> > > > >     a354b4a367f5 NFS: Use the correct commit info in
nfs_join_page_group()
> > > > >     b911329317b4 Linux 5.15.133
> > > > >     e3a29b80e9e6 interconnect: Teach lockdep about icc_bw_lock
order
> > > > >     c6244cd00c97 drm/amd/display: enable cursor degamma for DCN3+
DRM legacy gamma
> > > > >     08569c92f7f3 net/sched: Retire rsvp classifier
> > > > >     6b080fa8aae1 drm/amdgpu: fix amdgpu_cs_p1_user_fence
> > > > >     6386a2d4dc01 drm/amd/display: fix the white screen issue when
>=3D 64GB DRAM
> > > > >     e04b7073bdce ext4: fix rec_len verify error
> > > > >     93763d58705a scsi: pm8001: Setup IRQs on resume
> > > > >     72a22696cf19 scsi: megaraid_sas: Fix deadlock on firmware
crashdump
> > > > >     54603e8a88bc ata: libata: disallow dev-initiated LPM
transitions to unsupported states
> > > > >     01c7c38a90bc i2c: aspeed: Reset the i2c controller when
timeout occurs
> > > > >     763d39f4e8fb tracefs: Add missing lockdown check to
tracefs_create_dir()
> > > > >     bf195968e362 nfsd: fix change_info in NFSv4 RENAME replies
> > > > >     bf38c1d29f8b tracing: Have option files inc the trace array
ref count
> > > > >     85ad4688b7a7 tracing: Have current_trace inc the trace array
ref count
> > > > >     962e6723239b tracing: Have tracing_max_latency inc the trace
array ref count
> > > > >     380bbd46d61c btrfs: release path before inode lookup during
the ino lookup ioctl
> > > > >     779c3cf2749c btrfs: fix lockdep splat and potential deadlock
after failure running delayed items
> > > > >     f9c78afcee46 ovl: fix incorrect fdput() on aio completion
> > > > >     05a7289a5d4b ovl: fix failed copyup of fileattr on a symlink
> > > > >     8bcb80293be7 attr: block mode changes of symlinks
> > > > >     d30af15e460f md/raid1: fix error: ISO C90 forbids mixed
declarations
> > > > >     abdfde037712 samples/hw_breakpoint: fix building without
module unloading
> > > > >     58787ff3d023 x86/purgatory: Remove LTO flags
> > > > >     8abf1ec895d5 x86/boot/compressed: Reserve more memory for
page tables
> > > > >     e1a27664fcf5 scsi: lpfc: Fix the NULL vs IS_ERR() bug for
debugfs_create_file()
> > > > >     f0fd24f1fae0 selftests: tracing: Fix to unmount tracefs for
recovering environment
> > > > >     dded6b81ad68 scsi: qla2xxx: Fix NULL vs IS_ERR() bug for
debugfs_create_dir()
> > > > >     1d5caeac9655 drm: gm12u320: Fix the timeout usage for
usb_bulk_msg()
> > > > >     b9f0572b38c1 btrfs: compare the correct fsid/metadata_uuid in
btrfs_validate_super
> > > > >     cba491ee38e2 btrfs: add a helper to read the superblock
metadata_uuid
> > > > >     cb3671a2eeac btrfs: move btrfs_pinned_by_swapfile prototype
into volumes.h
> > > > >     f16fe29368fd perf test shell stat_bpf_counters: Fix test on
Intel
> > > > >     ad73216e006f perf test: Remove bash construct from
stat_bpf_counters.sh test
> > > > >     d8f81baeb9eb MIPS: Use "grep -E" instead of "egrep"
> > > > >     dfe961b1e476 mtd: rawnand: brcmnand: Fix ECC level field
setting for v7.2 controller
> > > > >     56cf9f446b33 mtd: rawnand: brcmnand: Allow SoC to provide I/O
operations
> > > > >     34fcb59437a7 jbd2: correct the end of the journal recovery
scan range
> > > > >     a4605449cc9f jbd2: rename jbd_debug() to jbd2_debug()
> > > > >     db6c90f2671c jbd2: kill t_handle_lock transaction spinlock
> > > > >     e9270898222a jbd2: fix use-after-free of transaction_t race
> > > > >     b0412dd1c24b jbd2: refactor wait logic for transaction
updates into a common function
> > > > >     f980bf1586ef printk: Consolidate console deferred printing
> > > > >     9be2957f014d interconnect: Fix locking for runpm vs reclaim
> > > > >     f3f6bf22a4f5 kobject: Add sanity check for kset->kobj.ktype
in kset_register()
> > > > >     81bbe6667024 media: pci: ipu3-cio2: Initialise timing struct
to avoid a compiler warning
> > > > >     d4ef3c9c7947 usb: ehci: add workaround for chipidea
PORTSC.PEC bug
> > > > >     c829d25e26fb serial: cpm_uart: Avoid suspicious locking
> > > > >     5353df78c226 scsi: target: iscsi: Fix buffer overflow in
lio_target_nacl_info_show()
> > > > >     b97aaf9faf89 tools: iio: iio_generic_buffer: Fix some integer
type and calculation
> > > > >     60a71fd1910e usb: gadget: fsl_qe_udc: validate endpoint index
for ch9 udc
> > > > >     c861a61be6d3 usb: cdns3: Put the cdns set active part outside
the spin lock
> > > > >     930c60e13947 media: pci: cx23885: replace BUG with error
return
> > > > >     48bb6a9fa5cb media: tuners: qt1010: replace BUG_ON with a
regular error
> > > > >     2a33fc57133d media: dvb-usb-v2: gl861: Fix null-ptr-deref in
gl861_i2c_master_xfer
> > > > >     5b1ea100ad36 media: az6007: Fix null-ptr-deref in
az6007_i2c_xfer()
> > > > >     3dd5846a8739 media: anysee: fix null-ptr-deref in
anysee_master_xfer
> > > > >     033b0c0780ad media: af9005: Fix null-ptr-deref in
af9005_i2c_xfer
> > > > >     903566208ae6 media: dw2102: Fix null-ptr-deref in
dw2102_i2c_transfer()
> > > > >     d9ef84a7c222 media: dvb-usb-v2: af9035: Fix null-ptr-deref in
af9035_i2c_master_xfer
> > > > >     ca49cef3acaa PCI: fu740: Set the number of MSI vectors
> > > > >     d35e7ae10eb8 powerpc/pseries: fix possible memory leak in
ibmebus_bus_init()
> > > > >     46870eea5496 ARM: 9317/1: kexec: Make smp stop calls
asynchronous
> > > > >     ef7311101ca4 jfs: fix invalid free of JFS_IP(ipimap)->i_imap
in diUnmount
> > > > >     aa5b019a3e0f fs/jfs: prevent double-free in dbUnmount() after
failed jfs_remount()
> > > > >     7ac65c29b6c2 ext2: fix datatype of block number in
ext2_xattr_set2()
> > > > >     4f96c0665f9f md: raid1: fix potential OOB in
raid1_remove_disk()
> > > > >     f3e9fc7b02b9 bus: ti-sysc: Configure uart quirks for k3 SoC
> > > > >     3157aa794c75 drm/exynos: fix a possible null-pointer
dereference due to data race in exynos_drm_crtc_atomic_disable()
> > > > >     78bc9d25997a drm/amd/display: Blocking invalid 420 modes on
HDMI TMDS for DCN31
> > > > >     5eca70c14b31 ALSA: hda: intel-dsp-cfg: add LunarLake support
> > > > >     e8ba418d4926 samples/hw_breakpoint: Fix kernel BUG 'invalid
opcode: 0000'
> > > > >     961df5a3f5cc arm64: dts: qcom: sm8250-edo: correct ramoops
pmsg-size
> > > > >     49cd54900078 arm64: dts: qcom: sm8150-kumano: correct ramoops
pmsg-size
> > > > >     1e0a38bb840a arm64: dts: qcom: sm6125-pdx201: correct ramoops
pmsg-size
> > > > >     201071956ec6 drm/bridge: tc358762: Instruct DSI host to
generate HSE packets
> > > > >     c64ee9dd3358 wifi: mac80211_hwsim: drop short frames
> > > > >     66594a1e6ddd netfilter: ebtables: fix fortify warnings in
size_entry_mwt()
> > > > >     fedd9377dd9c wifi: mac80211: check S1G action frame size
> > > > >     e08333e2abae alx: fix OOB-read compiler warning
> > > > >     2b0a093cdf59 mmc: sdhci-esdhc-imx: improve
ESDHC_FLAG_ERR010450
> > > > >     0a1f87f0ca76 tpm_tis: Resend command to recover from data
transfer errors
> > > > >     67589d247909 crypto: lib/mpi - avoid null pointer deref in
mpi_cmp_ui()
> > > > >     389106425dee wifi: wil6210: fix fortify warnings
> > > > >     ddb8f358b5e0 wifi: mwifiex: fix fortify warning
> > > > >     a7ebe459c72e wifi: ath9k: fix printk specifier
> > > > >     3de6b6ab69e2 wifi: ath9k: fix fortify warnings
> > > > >     6b0adfafb073 crypto: lrw,xts - Replace strlcpy with strscpy
> > > > >     dc100292e503 devlink: remove reload failed checks in params
get/set callbacks
> > > > >     7b7964cd9db3 ACPI: x86: s2idle: Catch multiple
ACPI_TYPE_PACKAGE objects
> > > > >     eda268b5b7ad hw_breakpoint: fix single-stepping when using
bpf_overflow_handler
> > > > >     6e743b7261ef perf/imx_ddr: speed up overflow frequency of
cycle
> > > > >     f9a2c79c2970 perf/smmuv3: Enable HiSilicon Erratum 162001900
quirk for HIP08/09
> > > > >     ed1afb597280 ACPI: video: Add backlight=3Dnative DMI quirk fo=
r
Lenovo Ideapad Z470
> > > > >     f685311dbe05 scftorture: Forgive memory-allocation failure if
KASAN
> > > > >     4f03fba096bf rcuscale: Move rcu_scale_writer()
schedule_timeout_uninterruptible() to _idle()
> > > > >     f1ceff37ac6b kernel/fork: beware of __put_task_struct()
calling context
> > > > >     430787056dd3 ACPICA: Add AML_NO_OPERAND_RESOLVE flag to Timer
> > > > >     766e56faddbe locks: fix KASAN: use-after-free in
trace_event_raw_event_filelock_lock
> > > > >     6994f806c6d1 btrfs: output extra debug info if we failed to
find an inline backref
> > > > >     71eeddcad734 autofs: fix memory leak of waitqueues in
autofs_catatonic_mode
> > > > >     35ecaa3632bf Linux 5.15.132
> > > > >     0c0d79f3366a pcd: fix error codes in pcd_init_unit()
> > > > >     893978f1b4d1 drm/amd/display: Fix a bug when searching for
insert_above_mpcc
> > > > >     0b8e09b39ef3 MIPS: Only fiddle with CHECKFLAGS if
`need-compiler'
> > > > >     55d2e7c1ab8e kcm: Fix error handling for SOCK_DGRAM in
kcm_sendmsg().
> > > > >     e80228b27487 ixgbe: fix timestamp configuration code
> > > > >     5b55dac919ec ipv6: fix ip6_sock_set_addr_preferences() typo
> > > > >     481bd6dcc5fe net/tls: do not free tls_rec on async operation
in bpf_exec_tx_verdict()
> > > > >     3600c0dc0deb platform/mellanox: mlxbf-pmc: Fix reading of
unprogrammed events
> > > > >     07c0abc80604 platform/mellanox: mlxbf-pmc: Fix potential
buffer overflows
> > > > >     7c34ea34516d platform/mellanox: mlxbf-tmfifo: Drop jumbo
frames
> > > > >     694035201aac platform/mellanox: mlxbf-tmfifo: Drop the Rx
packet if no more descriptors
> > > > >     97275339c34c kcm: Fix memory leak in error path of
kcm_sendmsg()
> > > > >     864da4a5d5eb r8152: check budget for r8152_poll()
> > > > >     fbdc4e9908b2 net: dsa: sja1105: hide all multicast addresses
from "bridge fdb show"
> > > > >     6a4480c5e6eb hsr: Fix uninit-value access in fill_frame_info(=
)
> > > > >     072324cfab9b net: ethernet: mtk_eth_soc: fix possible NULL
pointer dereference in mtk_hwlro_get_fdir_all()
> > > > >     5bb09dddc724 net: ethernet: mvpp2_main: fix possible OOB
write in mvpp2_ethtool_get_rxnfc()
> > > > >     06b4934ab2b5 net/smc: use smc_lgr_list.lock to protect
smc_lgr_list.list iterate in smcr_port_add
> > > > >     aea3801c234d kselftest/runner.sh: Propagate SIGTERM to runner
child
> > > > >     2f1e86014d0c net: ipv4: fix one memleak in __inet_del_ifa()
> > > > >     f086e859ddc2 ARM: dts: BCM5301X: Extend RAM to full 256MB for
Linksys EA6500 V2
> > > > >     8173d9027031 ARM: dts: samsung: exynos4210-i9100: Fix LCD
screen's physical size
> > > > >     072cd213c64f block: don't add or resize partition on the disk
with GENHD_FL_NO_PART
> > > > >     c6ce1c5dd327 block: rename GENHD_FL_NO_PART_SCAN to
GENHD_FL_NO_PART
> > > > >     6c06a7f6b41c block: move GENHD_FL_BLOCK_EVENTS_ON_EXCL_WRITE
to disk->event_flags
> > > > >     8247ff0d5036 block: move GENHD_FL_NATIVE_CAPACITY to
disk->state
> > > > >     5ad42b999a42 pcd: cleanup initialization
> > > > >     7607bc7fe6cc pcd: move the identify buffer into pcd_identify
> > > > >     242bbe218814 perf hists browser: Fix the number of entries
for 'e' key
> > > > >     4d7a8a44e030 perf tools: Handle old data in PERF_RECORD_ATTR
> > > > >     a8f91f480c62 perf hists browser: Fix hierarchy mode header
> > > > >     4ee1cf2a5bcc MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS
`modules_install' regression
> > > > >     df4d8d5ab647 drm/amd/display: prevent potential division by
zero errors
> > > > >     3b51d016bbbf mtd: rawnand: brcmnand: Fix potential false time
out warning
> > > > >     2353b7bb61e4 mtd: rawnand: brcmnand: Fix potential
out-of-bounds access in oob write
> > > > >     b59ff750bf80 mtd: rawnand: brcmnand: Fix crash during the
panic_write
> > > > >     ca5218aef9e5 btrfs: use the correct superblock to compare
fsid in btrfs_validate_super
> > > > >     f3260733894a btrfs: don't start transaction when joining with
TRANS_JOIN_NOSTART
> > > > >     7ef0e8b812e0 btrfs: free qgroup rsv on io failure
> > > > >     5fd6f40d17e8 fuse: nlookup missing decrement in
fuse_direntplus_link
> > > > >     65b6890c3d01 ata: pata_ftide010: Add missing
MODULE_DESCRIPTION
> > > > >     0b62825dc6c3 ata: sata_gemini: Add missing MODULE_DESCRIPTION
> > > > >     81dd61cb1caa ata: pata_falcon: fix IO base selection for Q40
> > > > >     20bc2c470369 lib: test_scanf: Add explicit type cast to
result initialization in test_number_prefix()
> > > > >     4315b4a95ecf ext4: add correct group descriptors and reserved
GDT blocks to system zone
> > > > >     ef5fea70e591 jbd2: check 'jh->b_transaction' before removing
it from checkpoint
> > > > >     6778a3857266 jbd2: fix checkpoint cleanup performance
regression
> > > > >     6b195e07a2cf dmaengine: sh: rz-dmac: Fix destination and
source data size setting
> > > > >     0476f2016ddc ARC: atomics: Add compiler barrier to atomic
operations...
> > > > >     3375186d5e3f net/mlx5: Free IRQ rmap and notifier on kernel
shutdown
> > > > >     2348a375ee16 sh: boards: Fix CEU buffer size passed to
dma_declare_coherent_memory()
> > > > >     f5160dc17e81 net: hns3: remove GSO partial feature bit
> > > > >     6d548b7cb216 net: hns3: fix the port information display when
sfp is absent
> > > > >     cc3c67e08169 net: hns3: fix invalid mutex between tc qdisc
and dcb ets command issue
> > > > >     2c9643fa6360 net: hns3: fix debugfs concurrency issue between
kfree buffer and read
> > > > >     8bfa87cf4a86 net: hns3: fix byte order conversion issue in
hclge_dbg_fd_tcam_read()
> > > > >     19280e8dfb52 netfilter: nfnetlink_osf: avoid OOB read
> > > > >     1ad7b189cc14 netfilter: nftables: exthdr: fix 4-byte stack
OOB write
> > > > >     347f765176db net: dsa: sja1105: complete tc-cbs offload
support on SJA1110
> > > > >     cb4494cfe4b7 net: dsa: sja1105: fix -ENOSPC when replacing
the same tc-cbs too many times
> > > > >     77b850b84d21 net: dsa: sja1105: fix bandwidth discrepancy
between tc-cbs software and offload
> > > > >     d11109c03d6e ip_tunnels: use DEV_STATS_INC()
> > > > >     fcfb5842ef9c idr: fix param name in idr_alloc_cyclic() doc
> > > > >     131cd74a8e38 s390/zcrypt: don't leak memory if dev_set_name()
fails
> > > > >     12de76fdddb5 igb: Change IGB_MIN to allow set rx/tx value
between 64 and 80
> > > > >     7c2f90b1c213 igbvf: Change IGBVF_MIN to allow set rx/tx value
between 64 and 80
> > > > >     f4c5640d6d38 igc: Change IGC_MIN to allow set rx/tx value
between 64 and 80
> > > > >     9210b3dd74ac octeontx2-af: Fix truncation of smq in CN10K NIX
AQ enqueue mbox handler
> > > > >     1840f08c2a1b kcm: Destroy mutex in kcm_exit_net()
> > > > >     6ea277b2c626 net: sched: sch_qfq: Fix UAF in qfq_dequeue()
> > > > >     3868de7c5361 af_unix: Fix data race around sk->sk_err.
> > > > >     d95456660fae af_unix: Fix data-races around sk->sk_shutdown.
> > > > >     e5edc6e44a88 af_unix: Fix data-race around unix_tot_inflight.
> > > > >     9151ed4b0061 af_unix: Fix data-races around
user->unix_inflight.
> > > > >     907fbed65cec net: phy: micrel: Correct bit assignments for
phy_device flags
> > > > >     5d2d3f2300c3 net: ipv6/addrconf: avoid integer underflow in
ipv6_create_tempaddr
> > > > >     77dd55f5ec6a veth: Fixing transmit return status for dropped
packets
> > > > >     56603b2c82e3 igb: disable virtualization features on 82580
> > > > >     149bc7834d6f ipv4: ignore dst hint for multipath routes
> > > > >     e18b49495a52 drm/i915/gvt: Drop unused helper
intel_vgpu_reset_gtt()
> > > > >     5979985f2d6b xsk: Fix xsk_diag use-after-free error during
socket cleanup
> > > > >     49acc5c5b280 net: fib: avoid warn splat in flow dissector
> > > > >     ed4e0adfa407 net: read sk->sk_family once in sk_mc_loop()
> > > > >     e0b483a0584f ipv4: annotate data-races around fi->fib_dead
> > > > >     74df0319e4e2 sctp: annotate data-races around
sk->sk_wmem_queued
> > > > >     973a4c302d7f net/sched: fq_pie: avoid stalls in fq_pie_timer(=
)
> > > > >     5e22217c1142 pwm: lpc32xx: Remove handling of PWM channels
> > > > >     676152264dec watchdog: intel-mid_wdt: add MODULE_ALIAS() to
allow auto-load
> > > > >     d6aa2be1379d perf top: Don't pass an ERR_PTR() directly to
perf_session__delete()
> > > > >     79bd17c99ec9 perf vendor events: Drop some of the JSON/events
for power10 platform
> > > > >     1356eaceef34 perf vendor events: Update the JSON/events
descriptions for power10 platform
> > > > >     24481d5c7413 x86/virt: Drop unnecessary check on extended
CPUID level in cpu_has_svm()
> > > > >     6e9863165674 perf annotate bpf: Don't enclose non-debug code
with an assert()
> > > > >     184be0d59242 Input: tca6416-keypad - fix interrupt enable
disbalance
> > > > >     0b79f5a19cfb Input: tca6416-keypad - always expect proper IRQ
number in i2c client
> > > > >     1e3167aa4ba2 backlight: gpio_backlight: Drop output GPIO
direction check for initial power state
> > > > >     6fc8bdc3cf4c pwm: atmel-tcb: Fix resource freeing in error
path and remove
> > > > >     6b2bb1a1a63c pwm: atmel-tcb: Harmonize resource allocation
order
> > > > >     d4734ef765eb pwm: atmel-tcb: Convert to platform remove
callback returning void
> > > > >     c3bc668581e7 perf trace: Really free the evsel->priv area
> > > > >     8e96f741b328 perf trace: Use zfree() to reduce chances of use
after free
> > > > >     414cf7a2cc87 kconfig: fix possible buffer overflow
> > > > >     be9ce0dbde4f gfs2: low-memory forced flush fixes
> > > > >     751facd3634c gfs2: Switch to wait_event in gfs2_logd
> > > > >     d0245b066971 kbuild: do not run depmod for 'make modules_sign=
'
> > > > >     05333a6a21e3 bus: mhi: host: Skip MHI reset if device is in
RDDM
> > > > >     e2964c98ec31 NFSv4/pnfs: minor fix for cleanup path in
nfs4_get_device_info
> > > > >     da302f1d476a NFS: Fix a potential data corruption
> > > > >     0db19df21be5 clk: qcom: mss-sc7180: fix missing resume during
probe
> > > > >     f64f682be7c8 clk: qcom: q6sstop-qcs404: fix missing resume
during probe
> > > > >     b2f39b813d1e soc: qcom: qmi_encdec: Restrict string length in
decode
> > > > >     e61db8922631 clk: qcom: gcc-mdm9615: use proper parent for
pll0_vote clock
> > > > >     a8474506c912 clk: imx: pll14xx: dynamically configure PLL for
393216000/361267200Hz
> > > > >     a69b951c8398 dt-bindings: clock: xlnx,versal-clk: drop
select:false
> > > > >     ead2436cf05e pinctrl: cherryview: fix address_space_handler()
argument
> > > > >     8859f58c1790 parisc: led: Reduce CPU overhead for disk & lan
LED computation
> > > > >     2655e1d970cf parisc: led: Fix LAN receive and transmit LEDs
> > > > >     7ad44409cd3b lib/test_meminit: allocate pages up to order
MAX_ORDER
> > > > >     2d8138cea71d clk: qcom: turingcc-qcs404: fix missing resume
during probe
> > > > >     9f5db4ab19f8 drm/ast: Fix DRAM init on AST2200
> > > > >     cfc47807a482 clk: qcom: camcc-sc7180: fix async resume during
probe
> > > > >     309c27162afe fbdev/ep93xx-fb: Do not assign to struct
fb_info.dev
> > > > >     4316e951f164 scsi: qla2xxx: Fix firmware resource tracking
> > > > >     7b89c3727bff scsi: qla2xxx: Error code did not return to
upper layer
> > > > >     15a71bb25beb scsi: qla2xxx: Fix smatch warn for
qla_init_iocb_limit()
> > > > >     106392156273 scsi: qla2xxx: Flush mailbox commands on chip
reset
> > > > >     def49a05aef4 scsi: qla2xxx: Remove unsupported ql2xenabledif
option
> > > > >     be12c9f4c60c scsi: qla2xxx: Fix TMF leak through
> > > > >     4322f3de9f21 scsi: qla2xxx: Fix session hang in gnl
> > > > >     a4708402c458 scsi: qla2xxx: Turn off noisy message log
> > > > >     b0453b0cf506 scsi: qla2xxx: Fix erroneous link up failure
> > > > >     5934b2125f5b scsi: qla2xxx: Fix command flush during TMF
> > > > >     4a16a46c8481 scsi: qla2xxx: fix inconsistent TMF timeout
> > > > >     f1ea164be545 scsi: qla2xxx: Fix deletion race condition
> > > > >     683945b17724 scsi: qla2xxx: Limit TMF to 8 per function
> > > > >     fde268c234d1 scsi: qla2xxx: Adjust IOCB resource on qpair
create
> > > > >     c29848249f78 io_uring: break iopolling on signal
> > > > >     0def123f1254 io_uring: break out of iowq iopoll on teardown
> > > > >     1a0aba2bf293 io_uring: always lock in io_apoll_task_func
> > > > >     2920cc4c64a1 net/ipv6: SKB symmetric hash should incorporate
transport ports
> > > > >     529bcc70c49c udf: initialize newblock to 0
> > > > >     fae2d591f3cb Revert "drm/amdgpu: install stub fence into
potential unused fence pointers"
> > > > >     f01e21d6c7ed md/md-bitmap: remove unnecessary local variable
in backlog_store()
> > > > >     99a8d14d7965 tracing: Zero the pipe cpumask on alloc to avoid
spurious -EBUSY
> > > > >     05c581ad3e7b perf/x86/uncore: Correct the number of CHAs on
EMR
> > > > >     861cfdc51f22 x86/sgx: Break up long non-preemptible delays in
sgx_vepc_release()
> > > > >     7e3ddbea87a9 USB: core: Fix oversight in SuperSpeed
initialization
> > > > >     7fe9d8799606 USB: core: Fix race by not overwriting
udev->descriptor in hub_port_init()
> > > > >     eda9a2966582 USB: core: Change usb_get_device_descriptor() AP=
I
> > > > >     56c49a3328e9 USB: core: Unite old scheme and new scheme
descriptor reads
> > > > >     0ad6bad31da6 usb: typec: bus: verify partner exists in
typec_altmode_attention
> > > > >     31220bd89c22 usb: typec: tcpm: set initial svdm version based
on pd revision
> > > > >     3acc6b9f266f cpufreq: brcmstb-avs-cpufreq: Fix -Warray-bounds
bug
> > > > >     cb65ad51f1bd crypto: stm32 - fix loop iterating through
scatterlist for DMA
> > > > >     9ab2c149c2e7 s390/ipl: add missing secure/has_secure file to
ipl type 'unknown'
> > > > >     6aff2732577c arm64: sdei: abort running SDEI handlers during
crash
> > > > >     fedecaeef888 pstore/ram: Check start of empty przs during ini=
t
> > > > >     8d68582b93e6 mmc: renesas_sdhi: register irqs before
registering controller
> > > > >     5294144b6ad2 fsverity: skip PKCS#7 parser when keyring is
empty
> > > > >     86608e1b0c6f net: handle ARPHRD_PPP in
dev_is_mac_header_xmit()
> > > > >     51ffed9ca1a4 X.509: if signature is unsupported skip
validation
> > > > >     6ecf09699eb1 dccp: Fix out of bounds access in DCCP error
handler
> > > > >     7a2978e8d3c0 dlm: fix plock lookup when using multiple
lockspaces
> > > > >     703cf47d47ba parisc: Fix /proc/cpuinfo output for lscpu
> > > > >     49a49d442075 procfs: block chmod on /proc/thread-self/comm
> > > > >     44f6ec589353 Revert "PCI: Mark NVIDIA T4 GPUs to avoid bus
reset"
> > > > >     d73d3787c9d1 ntb: Fix calculation
ntb_transport_tx_free_entry()
> > > > >     da0c7293f4db ntb: Clean up tx tail index on link down
> > > > >     bfa051f650a7 ntb: Drop packets when qp link is down
> > > > >     8f4edcd65534 scsi: mpt3sas: Perform additional retries if
doorbell read returns 0
> > > > >     58388f2958f6 Revert "scsi: qla2xxx: Fix buffer overrun"
> > > > >     bd188d1e3855 media: venus: hfi_venus: Write to VIDC_CTRL_INIT
after unmasking interrupts
> > > > >     6e9632a01e6d media: dvb: symbol fixup for dvb_attach()
> > > > >     9a43563cfd6b arm64: csum: Fix OoB access in IP checksum code
for negative lengths
> > > > >     a0a49da2a79a i3c: master: svc: fix probe failure when no i3c
device exist
> > > > >     a905ac21b2ab xtensa: PMU: fix base address for the newer
hardware
> > > > >     8742dbf9c25d backlight/lv5207lp: Compare against struct
fb_info.device
> > > > >     568132f74cb1 backlight/bd6107: Compare against struct
fb_info.device
> > > > >     4e7b4ddc900c backlight/gpio_backlight: Compare against struct
fb_info.device
> > > > >     3b018c3d1016 ARM: OMAP2+: Fix -Warray-bounds warning in
_pwrdm_state_switch()
> > > > >     cbb7d8a4b4be ipmi_si: fix a memleak in try_smi_init()
> > > > >     6043dd31f771 PCI: rockchip: Use 64-bit mask on MSI 64-bit PCI
address
> > > > >     aba1bf197467 media: i2c: ccs: Check rules is non-NULL
> > > > >     df64819dd6a0 mm/vmalloc: add a safer version of
find_vm_area() for debug
> > > > >     20b7d0a62ad1 scsi: core: Fix the scsi_set_resid()
documentation
> > > > >     20990d6a8543 printk: ringbuffer: Fix truncating buffer size
min_t cast
> > > > >     0a22f9c17b1a rcu: dump vmalloc memory info safely
> > > > >     d479c841b18d ALSA: pcm: Fix missing fixup call in compat
hw_refine ioctl
> > > > >     111bafa210ae PM / devfreq: Fix leak in devfreq_dev_release()
> > > > >     be7353af5b35 igb: set max size RX buffer when store bad
packet is enabled
> > > > >     d5790386595d skbuff: skb_segment, Call zero copy functions
before using skbuff frags
> > > > >     267a29f8bfdb netfilter: xt_sctp: validate the flag_info count
> > > > >     b3d07714ad24 netfilter: xt_u32: validate user space input
> > > > >     a9e6142e5f8f netfilter: ipset: add the missing
IP_SET_HASH_WITH_NET0 macro for ip_set_hash_netportnet.c
> > > > >     3e48f741e98a igmp: limit igmpv3_newpack() packet size to
IP_MAX_MTU
> > > > >     de16cb7986f2 virtio_ring: fix avail_wrap_counter in
virtqueue_add_packed
> > > > >     d6f80ddb9eda cpufreq: Fix the race condition while updating
the transition_task of policy
> > > > >     42d8c7fa0bf6 dmaengine: ste_dma40: Add missing IRQ check in
d40_probe
> > > > >     329d0f168c8f um: Fix hostaudio build errors
> > > > >     58d17e766093 mtd: rawnand: fsmc: handle clk prepare error in
fsmc_nand_resume()
> > > > >     679a71b31179 mtd: spi-nor: Check bus width while setting QE
bit
> > > > >     8869fd166f23 leds: trigger: tty: Do not use LED_ON/OFF
constants, use led_blink_set_oneshot instead
> > > > >     0f715ea7d36e leds: multicolor: Use rounded division when
calculating color components
> > > > >     1a68bef23726 leds: pwm: Fix error code in
led_pwm_create_fwnode()
> > > > >     abd740db896b rpmsg: glink: Add check for kstrdup
> > > > >     b45cf29f97a2 phy/rockchip: inno-hdmi: do not power on rk3328
post pll on reg write
> > > > >     40d637359f3f phy/rockchip: inno-hdmi: round fractal pixclock
in rk3328 recalc_rate
> > > > >     52942a47d034 phy/rockchip: inno-hdmi: use correct vco_div_5
macro on rk3328
> > > > >     31d7e6c7689b mtd: rawnand: brcmnand: Fix mtd oobsize
> > > > >     6182318ac046 tracing: Fix race issue between cpu buffer write
and swap
> > > > >     548f48ec1915 tracing: Remove extra space at the end of
hwlat_detector/mode
> > > > >     2ba8bb00720a x86/speculation: Mark all Skylake CPUs as
vulnerable to GDS
> > > > >     dde88ab4e45b HID: multitouch: Correct devm device reference
for hidinput input_dev name
> > > > >     4fb28379b3c7 HID: logitech-dj: Fix error handling in
logi_dj_recv_switch_to_dj_mode()
> > > > >     1bb42aca7a96 Revert "IB/isert: Fix incorrect release of isert
connection"
> > > > >     4f1807fddd9b amba: bus: fix refcount leak
> > > > >     1c3701373463 serial: tegra: handle clk prepare error in
tegra_uart_hw_init()
> > > > >     076fb40cf27a scsi: fcoe: Fix potential deadlock on
&fip->ctlr_lock
> > > > >     c4772759abe1 scsi: core: Use 32-bit hostnum in
scsi_host_lookup()
> > > > >     6248f4305378 cgroup:namespace: Remove unused
cgroup_namespaces_init()
> > > > >     04824d50e6b5 media: i2c: rdacm21: Fix uninitialized value
> > > > >     f3572eef8551 media: ov2680: Fix regulators being left enabled
on ov2680_power_on() errors
> > > > >     205f71744176 media: ov2680: Fix ov2680_set_fmt() which =3D=3D
V4L2_SUBDEV_FORMAT_TRY not working
> > > > >     89ecb4b40094 media: ov2680: Add ov2680_fill_format() helper
function
> > > > >     784d1b83ae2c media: ov2680: Don't take the lock for try_fmt
calls
> > > > >     dbb717b4ee68 media: ov2680: Remove VIDEO_V4L2_SUBDEV_API
ifdef-s
> > > > >     4c1a5c2885d4 media: ov2680: Fix vflip / hflip set functions
> > > > >     958905ed42b8 media: ov2680: Fix ov2680_bayer_order()
> > > > >     cdd5fca7200d media: ov2680: Remove auto-gain and
auto-exposure controls
> > > > >     322a805ffdff media: i2c: ov2680: Set
V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
> > > > >     abba34017e16 media: ov5640: Enable MIPI interface in
ov5640_set_power_mipi()
> > > > >     1717f67be875 USB: gadget: f_mass_storage: Fix unused variable
warning
> > > > >     121b8d30f42c media: venus: hfi_venus: Only consider
sys_idle_indicator on V1
> > > > >     f6b483ead6dc media: go7007: Remove redundant if statement
> > > > >     d079a3e1ccdd platform/x86: dell-sysman: Fix reference leak
> > > > >     426bd7418701 iommu/vt-d: Fix to flush cache of PASID
directory table
> > > > >     9dc6f660815a iommu/qcom: Disable and reset context bank
before programming
> > > > >     3274e32fc969 fsi: aspeed: Reset master errors after CFAM rese=
t
> > > > >     7a17deca33e1 IB/uverbs: Fix an potential error pointer
dereference
> > > > >     42d111304dd7 RDMA/hns: Fix CQ and QP cache affinity
> > > > >     b051c3bf3bdf RDMA/hns: Fix incorrect post-send with direct
wqe of wr-list
> > > > >     154822356e4d RDMA/hns: Fix port active speed
> > > > >     de4aca5b284e iommu/sprd: Add missing force_aperture
> > > > >     46b76f13f1ad driver core: test_async: fix an error code
> > > > >     a6992ecefe5d dma-buf/sync_file: Fix docs syntax
> > > > >     d3256d80406c coresight: tmc: Explicit type conversions to
prevent integer overflow
> > > > >     93a5b461a4e1 RDMA/irdma: Replace one-element array with
flexible-array member
> > > > >     97097ea2f37e scsi: qedf: Do not touch __user pointer in
qedf_dbg_fp_int_cmd_read() directly
> > > > >     1c996be7f233 scsi: qedf: Do not touch __user pointer in
qedf_dbg_debug_cmd_read() directly
> > > > >     cb6d20a8b5d7 scsi: qedf: Do not touch __user pointer in
qedf_dbg_stop_io_on_error_cmd_read() directly
> > > > >     2f0d202d82b9 x86/APM: drop the duplicate APM_MINOR_DEV macro
> > > > >     f34508d934c4 serial: sprd: Fix DMA buffer leak issue
> > > > >     c54c66d904fa serial: sprd: Assign sprd_port after initialized
to avoid wrong access
> > > > >     f61fc650c478 scsi: qla4xxx: Add length check when parsing
nlattrs
> > > > >     46ad449efde1 scsi: be2iscsi: Add length check when parsing
nlattrs
> > > > >     4bd57d889099 scsi: iscsi: Add strlen() check in
iscsi_if_set{_host}_param()
> > > > >     e9bac3cc744f scsi: iscsi: Add length check for nlattr payload
> > > > >     9285efd95996 scsi: iscsi: Rename iscsi_set_param() to
iscsi_if_set_param()
> > > > >     7231d60d41c4 scsi: RDMA/srp: Fix residual handling
> > > > >     484ddaa90b7e usb: phy: mxs: fix getting wrong state with
mxs_phy_is_otg_host()
> > > > >     cbb8f7097e11 media: mediatek: vcodec: Return NULL if no
vdec_fb is found
> > > > >     18dc93de9019 media: rkvdec: increase max supported height for
H.264
> > > > >     f1e7d999f37e scsi: hisi_sas: Fix normally completed I/O
analysed as failed
> > > > >     46d1b2a3d5a6 scsi: hisi_sas: Fix warnings detected by sparse
> > > > >     e454e985950b scsi: hisi_sas: Modify v3 HW SATA completion
error processing
> > > > >     7caac45b52f4 scsi: hisi_sas: Modify v3 HW SSP underflow error
processing
> > > > >     f64d02822b82 media: cx24120: Add retval check for
cx24120_message_send()
> > > > >     7ca7cd02114a media: dvb-usb: m920x: Fix a potential memory
leak in m920x_i2c_xfer()
> > > > >     fb24b65aaccd media: dib7000p: Fix potential division by zero
> > > > >     56a3d8ae4576 drivers: usb: smsusb: fix error handling code in
smsusb_init_device
> > > > >     d1b51b130d32 iommu: rockchip: Fix directory table address
encoding
> > > > >     a50d60b8f2af iommu/amd/iommu_v2: Fix pasid_state refcount dec
hit 0 warning on pasid unbind
> > > > >     caf058833b6f media: v4l2-core: Fix a potential resource leak
in v4l2_fwnode_parse_link()
> > > > >     711e9e44f6c4 media: i2c: tvp5150: check return value of
devm_kasprintf()
> > > > >     30d4380eb030 media: ad5820: Drop unsupported ad5823 from i2c_
and of_device_id tables
> > > > >     663114dfc178 RDMA/qedr: Remove a duplicate assignment in
irdma_query_ah()
> > > > >     1473e40b3912 pNFS: Fix assignment of xprtdata.cred
> > > > >     fb7ddc1138b0 NFSv4.2: fix handling of COPY ERR_OFFLOAD_NO_REQ
> > > > >     53a1e5ab1b11 NFS: Guard against READDIR loop when entry names
exceed MAXNAMELEN
> > > > >     19a648a07572 NFSD: da_addr_body field missing in some
GETDEVICEINFO replies
> > > > >     b0f127a7c635 fs: lockd: avoid possible wrong NULL parameter
> > > > >     8f994b830dd0 jfs: validate max amount of blocks before
allocation.
> > > > >     f6a84ef1d080 ext4: fix unttached inode after power cut with
orphan file feature enabled
> > > > >     a9ddbfed5346 powerpc/iommu: Fix notifiers being shared by PCI
and VIO buses
> > > > >     a70c8de30514 nfs/blocklayout: Use the passed in gfp flags
> > > > >     2935443dc9c2 powerpc/pseries: Rework lppaca_shared_proc() to
avoid DEBUG_PREEMPT
> > > > >     75dcb650a7ef powerpc: Don't include lppaca.h in paca.h
> > > > >     cefcb002c5c9 PCI: layerscape: Add workaround for lost link
capabilities during reset
> > > > >     4be323c73797 PCI: layerscape: Add the endpoint linkup
notifier support
> > > > >     69c712389e1f PCI: dwc: Add start_link/stop_link inlines
> > > > >     aac0a9a1577b wifi: ath10k: Use RMW accessors for changing
LNKCTL
> > > > >     3539bab5f9de wifi: ath11k: Use RMW accessors for changing
LNKCTL
> > > > >     ea670d0146a3 net/mlx5: Use RMW accessors for changing LNKCTL
> > > > >     348ef09df984 drm/radeon: Use RMW accessors for changing LNKCT=
L
> > > > >     5468237382ed drm/amdgpu: Use RMW accessors for changing LNKCT=
L
> > > > >     00f79e78bf4b powerpc/perf: Convert fsl_emb notifier to state
machine callbacks
> > > > >     a26a5e4be2c4 powerpc/fadump: reset dump area size if fadump
memory reserve fails
> > > > >     13fd667db999 vfio/type1: fix cap_migration information leak
> > > > >     6b708243d3d9 powerpc/radix: Move some functions into #ifdef
CONFIG_KVM_BOOK3S_HV_POSSIBLE
> > > > >     dbde1d9c54e2 clk: imx: composite-8m: fix clock pauses when
set_rate would be a no-op
> > > > >     824e97302fd8 clk: imx8mp: fix sai4 clock
> > > > >     66ef144dbdf9 PCI/ASPM: Use RMW accessors for changing LNKCTL
> > > > >     f46fa8ab8d82 PCI: pciehp: Use RMW accessors for changing
LNKCTL
> > > > >     759d978e831b pinctrl: mcp23s08: check return value of
devm_kasprintf()
> > > > >     02faf0bd6fdc PCI: Mark NVIDIA T4 GPUs to avoid bus reset
> > > > >     4c20a4143276 PCI: microchip: Correct the DED and SEC
interrupt bit offsets
> > > > >     377f7aeddda0 clk: qcom: gcc-sm6350: Fix gcc_sdcc2_apps_clk_sr=
c
> > > > >     1c4a98c55fa3 clk: qcom: reset: Use the correct type of
sleep/delay based on length
> > > > >     bd4eff9c835a clk: qcom: gcc-sm8250: Fix gcc_sdcc2_apps_clk_sr=
c
> > > > >     b1cb8bf42b36 ext4: avoid potential data overflow in
next_linear_group
> > > > >     3e24082f1682 ext4: correct grp validation in
ext4_mb_good_group
> > > > >     febacbefe451 EDAC/igen6: Fix the issue of no error events
> > > > >     964f62caac08 clk: qcom: gcc-sc7180: Fix up
gcc_sdcc2_apps_clk_src
> > > > >     f1399e1543e7 clk: sunxi-ng: Modify mismatched function name
> > > > >     92913d32e719 drivers: clk: keystone: Fix parameter judgment
in _of_pll_clk_init()
> > > > >     3ad53071fe85 ipmi:ssif: Fix a memory leak when scanning for
an adapter
> > > > >     7792869495b6 ipmi:ssif: Add check for kstrdup
> > > > >     53abafedfeb7 ALSA: ac97: Fix possible error value of *rac97
> > > > >     48fc5717b249 of: unittest: Fix overlay type in apply/revert
check
> > > > >     01bb96ad3808 of: overlay: Call of_changeset_init() early
> > > > >     30f04a41e7d7 md: raid0: account for split bio in iostat
accounting
> > > > >     9643cc0b1771 md/raid0: Fix performance regression for large
sequential writes
> > > > >     17fbf7da491f md/raid0: Factor out helper for mapping and
submitting a bio
> > > > >     d04f1e322f52 md: add error_handlers for raid0 and linear
> > > > >     d8b6adb84041 md: Set MD_BROKEN for RAID1 and RAID10
> > > > >     a68fabdad970 bus: ti-sysc: Fix cast to enum warning
> > > > >     7636dfc42b66 arm64: dts: qcom: apq8016-sbc: Fix ov5640
regulator supply names
> > > > >     fff4d36247e8 drm/mediatek: Fix potential memory leak if
vmap() fail
> > > > >     e5758ad9a34f drm/mediatek: Remove freeing not dynamic
allocated memory
> > > > >     97274bea0136 bus: ti-sysc: Fix build warning for 64-bit build
> > > > >     cc6b09671d0c io_uring: fix drain stalls by invalid SQE
> > > > >     0152e7758cc4 audit: fix possible soft lockup in
__audit_inode_child()
> > > > >     48e4c4819039 drm/msm/a2xx: Call adreno_gpu_init() earlier
> > > > >     76c3ad12441f drm/amd/pm: fix variable dereferenced issue in
amdgpu_device_attr_create()
> > > > >     32e060927351 smackfs: Prevent underflow in smk_set_cipso()
> > > > >     502dfc5875ba firmware: meson_sm: fix to avoid potential NULL
pointer dereference
> > > > >     c0b1eee64870 drm/msm/mdp5: Don't leak some plane state
> > > > >     d0b82c217feb drm: xlnx: zynqmp_dpsub: Add missing check for
dma_set_mask
> > > > >     b7b0c48851c4 ima: Remove deprecated IMA_TRUSTED_KEYRING
Kconfig
> > > > >     8025396b76e9 drm/panel: simple: Add missing connector type
and pixel format for AUO T215HVN01
> > > > >     27eee65b2e31 drm/armada: Fix off-by-one error in
armada_overlay_get_property()
> > > > >     cc9254b24a4b arm64: dts: qcom: sm8150: Fix the I2C7 interrupt
> > > > >     ea5bc6f5aa09 of: unittest: fix null pointer dereferencing in
of_unittest_find_node_by_name()
> > > > >     4197eeb55f4b drm/tegra: dpaux: Fix incorrect return value of
platform_get_irq
> > > > >     9712279e9743 drm/msm: Update dev core dump to not print
backwards
> > > > >     8ef5d1f16d92 md/md-bitmap: hold 'reconfig_mutex' in
backlog_store()
> > > > >     382638364711 md/bitmap: don't set max_write_behind if there
is no write mostly device
> > > > >     a3d36107ee48 md/raid10: use dereference_rdev_and_rrdev() to
get devices
> > > > >     94ca5eed9530 md/raid10: factor out
dereference_rdev_and_rrdev()
> > > > >     246bac7d3c3e drm/amdgpu: Update min() to min_t() in
'amdgpu_info_ioctl'
> > > > >     de93b4711ac2 arm64: dts: qcom: sdm845: Fix the min frequency
of "ice_core_clk"
> > > > >     a9e56fa8a0ca arm64: dts: qcom: sdm845: Add missing RPMh power
domain to GCC
> > > > >     db0ba312542d ARM: dts: BCM53573: Fix Ethernet info for Luxul
devices
> > > > >     c4413633ef78 drm: adv7511: Fix low refresh rate register for
ADV7533/5
> > > > >     57b6d92c79e9 ARM: dts: samsung: s5pv210-smdkv210: correct
ethernet reg addresses (split)
> > > > >     b7f47031e319 ARM: dts: s5pv210: add dummy 5V regulator for
backlight on SMDKv210
> > > > >     2f0246b3c7ff ARM: dts: samsung: s3c6410-mini6410: correct
ethernet reg addresses (split)
> > > > >     d12beb1b1ee5 ARM: dts: s3c64xx: align pinctrl with dtschema
> > > > >     188f2d41fa5d x86/mm: Fix PAT bit missing from page protection
modify mask
> > > > >     1dd43e1e54d5 drm/etnaviv: fix dumping of active MMU context
> > > > >     1634fe406c34 arm64: dts: qcom: pmi8994: Add missing OVP
interrupt
> > > > >     4b7eb5e2c1c4 arm64: dts: qcom: Move WLED num-strings from
pmi8994 to sony-xperia-tone
> > > > >     92919d98e673 arm64: dts: qcom: pmi8994: Remove hardcoded
linear WLED enabled-strings
> > > > >     365909857242 arm64: dts: qcom: pm660l: Add missing short
interrupt
> > > > >     ea48fd91df12 arm64: dts: qcom: correct SPMI WLED register
range encoding
> > > > >     eee01e0d6abe arm64: dts: qcom: pmi8998: Add node for WLED
> > > > >     b788afdbfd5a arm64: dts: qcom: sm8250-sony-xperia: correct
GPIO keys wakeup again
> > > > >     2840d9b9c875 ARM: dts: BCM53573: Use updated "spi-gpio"
binding properties
> > > > >     b35f3ca1877e ARM: dts: BCM53573: Add cells sizes to PCIe node
> > > > >     bed08bb83292 drm/amdgpu: avoid integer overflow warning in
amdgpu_device_resize_fb_bar()
> > > > >     261e69456617 arm64: dts: qcom: sm8250: Mark PCIe hosts as DMA
coherent
> > > > >     12a93e53eaf0 arm64: dts: qcom: pmk8350: fix ADC-TM compatible
string
> > > > >     4c9a637258bb arm64: dts: qcom: sm8350: Use proper CPU
compatibles
> > > > >     4c918fb77dea arm64: dts: qcom: sm8350: Add missing LMH
interrupts to cpufreq
> > > > >     9c022ab2db40 arm64: dts: qcom: msm8996: Add missing interrupt
to the USB2 controller
> > > > >     bda65ecaec97 arm64: dts: qcom: sm8250-edo: Rectify gpio-keys
> > > > >     6119aaced94f arm64: dts: qcom: sm8250-edo: Add GPIO line
names for PMIC GPIOs
> > > > >     c0dc9d7d3f2b arm64: dts: qcom: sm8250-edo: Add gpio line
names for TLMM
> > > > >     d2d698daa1fa arm64: dts: qcom: sm8250: correct dynamic power
coefficients
> > > > >     510bae3d37f7 soc: qcom: ocmem: Fix NUM_PORTS & NUM_MACROS
macros
> > > > >     b08c7a31baeb soc: qcom: ocmem: Add OCMEM hardware version
print
> > > > >     dc04034502e6 ASoC: stac9766: fix build errors with REGMAP_AC9=
7
> > > > >     89602de9a2d7 quota: fix dqput() to follow the guarantees
dquot_srcu should provide
> > > > >     1df46e717ee9 quota: add new helper dquot_active()
> > > > >     bd0a6452f070 quota: rename dquot_active() to
inode_quota_active()
> > > > >     5b8240223407 quota: factor out dquot_write_dquot()
> > > > >     6c6efd3a1d06 drm/bridge: tc358764: Fix debug print parameter
order
> > > > >     a48e7def0006 netrom: Deny concurrent connect().
> > > > >     4cf994d3f4ff net/sched: sch_hfsc: Ensure inner classes have
fsc curve
> > > > >     edb5b1b3b9f8 hwmon: (tmp513) Fix the channel number in
tmp51x_is_visible()
> > > > >     a85fd8116555 mlxsw: i2c: Limit single transaction buffer size
> > > > >     7790b6a2f5f0 mlxsw: i2c: Fix chunk size setting in output
mailbox buffer
> > > > >     510e0cbd6408 net: arcnet: Do not call kfree_skb() under
local_irq_disable()
> > > > >     93a572b9d42f wifi: ath9k: use IS_ERR() with
debugfs_create_dir()
> > > > >     5138beea8e7f Bluetooth: btusb: Do not call kfree_skb() under
spin_lock_irqsave()
> > > > >     d7fd24b8d1bb wifi: mwifiex: avoid possible NULL skb pointer
dereference
> > > > >     71ce8be48bf0 wifi: nl80211/cfg80211: add forgotten nla_policy
for BSS color attribute
> > > > >     11f93fff6e8a wifi: ath9k: protect WMI command response buffer
replacement with a lock
> > > > >     6904c7afd512 wifi: ath9k: fix races between ath9k_wmi_cmd and
ath9k_wmi_ctrl_rx
> > > > >     cec7db9ea031 samples/bpf: fix broken map lookup probe
> > > > >     89f19a9a055d wifi: mwifiex: Fix missed return in oob checks
failed path
> > > > >     308eb3a609ac wifi: mwifiex: fix memory leak in
mwifiex_histogram_read()
> > > > >     9c00731bf05d fs: ocfs2: namei: check return value of
ocfs2_add_entry()
> > > > >     f683992d30ee lwt: Check LWTUNNEL_XMIT_CONTINUE strictly
> > > > >     e3f647e4b642 lwt: Fix return values of BPF xmit ops
> > > > >     4ff998134025 hwrng: iproc-rng200 - Implement suspend and
resume calls
> > > > >     5a70ab6b59b2 crypto: caam - fix unchecked return value error
> > > > >     660b6b1c5cf8 ice: ice_aq_check_events: fix off-by-one check
when filling buffer
> > > > >     55fab9389d65 net-memcg: Fix scope of sockmem pressure
indicators
> > > > >     41c40d84838d selftests/bpf: Clean up fmod_ret in bench_rename
test script
> > > > >     50c78e71446d net: tcp: fix unexcepted socket die when snd_wnd
is 0
> > > > >     942d8cefb022 Bluetooth: Fix potential use-after-free when
clear keys
> > > > >     7b0243d26a71 Bluetooth: nokia: fix value check in
nokia_bluetooth_serdev_probe()
> > > > >     048545d9fc64 crypto: api - Use work queue in
crypto_destroy_instance
> > > > >     56cb7bbefcaf crypto: stm32 - Properly handle pm_runtime_get
failing
> > > > >     e3c4a6b073e4 selftests/bpf: fix static assert compilation
issue for test_cls_*.c
> > > > >     43423b3e0467 wifi: mwifiex: fix error recovery in PCIE buffer
descriptor management
> > > > >     7c54b6fc39eb wifi: mwifiex: Fix OOB and integer underflow
when rx packets
> > > > >     a20b96cf6925 wifi: mt76: mt7915: fix power-limits while
chan_switch
> > > > >     5c75a4379589 can: gs_usb: gs_usb_receive_bulk_callback():
count RX overflow errors also in case of OOM
> > > > >     890843254f38 spi: tegra20-sflash: fix to check return value
of platform_get_irq() in tegra_sflash_probe()
> > > > >     2ff9ac0cf25f wifi: mt76: testmode: add nla_policy for
MT76_TM_ATTR_TX_LENGTH
> > > > >     802008e8c73a ipv6: Add reasons for skb drops to __udp6_lib_rc=
v
> > > > >     7dcbc0bb0e5c bpf: reject unhashed sockets in bpf_sk_assign
> > > > >     caa2883b1885 udp: re-score reuseport groups when connected
sockets are present
> > > > >     b60dfa4559d8 regmap: rbtree: Use alloc_flags for memory
allocations
> > > > >     34f1180658d9 hwrng: pic32 - use devm_clk_get_enabled
> > > > >     5af3c8676b36 hwrng: nomadik - keep clock enabled while hwrng
is registered
> > > > >     14c6d1e80847 tcp: tcp_enter_quickack_mode() should be static
> > > > >     7b75b4c90a9e bpf: Clear the probe_addr for uprobe
> > > > >     75d3960be702 bpftool: Use a local bpf_perf_event_value to fix
accessing its fields
> > > > >     8ea6871116d5 cpufreq: powernow-k8: Use related_cpus instead
of cpus in driver.exit()
> > > > >     be2092d2a703 x86/efistub: Fix PCI ROM preservation in mixed
mode
> > > > >     9eb25ea7b65d ACPI: x86: s2idle: Fix a logic error parsing AMD
constraints table
> > > > >     26097a7f28b3 ACPI: x86: s2idle: Post-increment variables when
getting constraints
> > > > >     8a962f11a95b s390/paes: fix PKEY_TYPE_EP11_AES handling for
secure keyblobs
> > > > >     7833a74f8d00 s390/pkey: fix/harmonize internal keyblob header=
s
> > > > >     208383d68510 selftests/futex: Order calls to futex_lock_pi
> > > > >     c7802ff51adc perf/imx_ddr: don't enable counter0 if none of 4
counters are used
> > > > >     0a872a0521c8 x86/decompressor: Don't rely on upper 32 bits of
GPRs being preserved
> > > > >     3af6f77e8090 selftests/resctrl: Close perf value read fd on
errors
> > > > >     4505ad996b66 selftests/resctrl: Unmount resctrl FS if child
fails to run benchmark
> > > > >     c68a196e7ff6 selftests/resctrl: Don't leak buffer in
fill_cache()
> > > > >     fdcb63afd3f6 selftests/resctrl: Add resctrl.h into build deps
> > > > >     b2ba11ed4d10 selftests/resctrl: Make resctrl_tests run using
kselftest framework
> > > > >     e0478944f4a5 OPP: Fix passing 0 to PTR_ERR in
_opp_attach_genpd()
> > > > >     ec9d118ad99d refscale: Fix uninitalized use of
wait_queue_head_t
> > > > >     e280033ef135 ARM: ptrace: Restore syscall skipping for tracer=
s
> > > > >     4c3f33904dea ARM: ptrace: Restore syscall restart tracing
> > > > >     0481251b7cd6 selftests/harness: Actually report SKIP for
signal tests
> > > > >     060ca3f7899a tmpfs: verify {g,u}id mount options correctly
> > > > >     d412e9b34b90 fs: Fix error checking for d_hash_and_lookup()
> > > > >     a4229f93bc54 eventfd: prevent underflow for eventfd semaphore=
s
> > > > >     cedb8719333d reiserfs: Check the return value from __getblk()
> > > > >     c1a4117f1544 Revert "net: macsec: preserve ingress frame
ordering"
> > > > >     40671f90d5b5 udf: Handle error when adding extent to a file
> > > > >     099bf90d7fc4 udf: Check consistency of Space Bitmap Descripto=
r
> > > > >     7039aa1be9cc of: kexec: Mark ima_{free,stable}_kexec_buffer()
as __init
> > > > >     759d51eda2d0 net: Avoid address overwrite in kernel_connect
> > > > >     7c4cce5700b9 arm64: lib: Import latest version of Arm
Optimized Routines' strncmp
> > > > >     104df1c695c1 crypto: rsa-pkcs1pad - Use helper to set reqsize
> > > > >     273f4615314f platform/mellanox: Fix mlxbf-tmfifo not handling
all virtio CONSOLE notifications
> > > > >     9ef5c25bcf1b tracing: Introduce pipe_cpumask to avoid race on
trace_pipes
> > > > >     8c1b60dad0f5 ALSA: seq: oss: Fix racy open/close of MIDI
devices
> > > > >     fa05aea28195 scsi: lpfc: Fix incorrect big endian type
assignment in bsg loopback path
> > > > >     f0bf8a071134 scsi: storvsc: Always set no_report_opcodes
> > > > >     e9e62419e797 sctp: handle invalid error codes without calling
BUG()
> > > > >     3714bb4a1df8 bnx2x: fix page fault following EEH recovery
> > > > >     53b8cc2f9685 netlabel: fix shift wrapping bug in
netlbl_catmap_setlong()
> > > > >     867cdd7f9544 drm/amdgpu: Match against exact bootloader statu=
s
> > > > >     0863204deb3c net: hns3: restore user pause configure when
disable autoneg
> > > > >     ac93def0dbb4 scsi: qedi: Fix potential deadlock on
&qedi_percpu->p_work_lock
> > > > >     bef6c89a92d0 scsi: lpfc: Remove reftag check in DIF paths
> > > > >     b439e33a8c93 idmaengine: make FSL_EDMA and INTEL_IDMA64
depends on HAS_IOMEM
> > > > >     156b803194ae wifi: brcmfmac: Fix field-spanning write in
brcmf_scan_params_v2_to_v1()
> > > > >     87ea5e89407e net: usb: qmi_wwan: add Quectel EM05GV2
> > > > >     e1313fa9d2e3 vmbus_testing: fix wrong python syntax for
integer value comparison
> > > > >     5faad57ba6c7 clk: fixed-mmio: make COMMON_CLK_FIXED_MMIO
depend on HAS_IOMEM
> > > > >     e13f0dd5fbe2 kprobes: Prohibit probing on CFI preamble symbol
> > > > >     ee49b97cb5ae security: keys: perform capable check only on
privileged operations
> > > > >     f44f50305de2 ata: pata_arasan_cf: Use dev_err_probe() instead
dev_err() in data_xfer()
> > > > >     a85c523aeccd ovl: Always reevaluate the file signature for IM=
A
> > > > >     3faa126258a9 drm/amd/display: Exit idle optimizations before
attempt to access PHY
> > > > >     c152ca4f219b platform/x86: huawei-wmi: Silence ambient light
sensor
> > > > >     a9988b9c7a31 platform/x86/intel/hid: Add HP Dragonfly G2 to
VGBS DMI quirks
> > > > >     7f3901b04c8f platform/x86: intel: hid: Always call BTNL ACPI
method
> > > > >     23151421ed01 ASoC: atmel: Fix the 8K sample parameter in I2SC
master
> > > > >     c934d2a6970c ASoC: rt711-sdca: fix for JD event handling in
ClockStop Mode0
> > > > >     20587011d271 ASoC: rt711: fix for JD event handling in
ClockStop Mode0
> > > > >     b41f79896456 ASoc: codecs: ES8316: Fix DMIC config
> > > > >     cc2b0a2055dc ASoC: rt5682-sdw: fix for JD event handling in
ClockStop Mode0
> > > > >     5b64fc2471f9 fs/nls: make load_nls() take a const parameter
> > > > >     f85908f6bfd2 s390/dasd: fix hanging device after request
requeue
> > > > >     a4845e694893 s390/dasd: use correct number of retries for ERP
requests
> > > > >     e062aa1acf9b m68k: Fix invalid .section syntax
> > > > >     bbfa7d712b24 vxlan: generalize vxlan_parse_gpe_hdr and remove
unused args
> > > > >     b10215ffdb01 ethernet: atheros: fix return value check in
atl1c_tso_csum()
> > > > >     6bb94f46d31a ASoC: da7219: Check for failure reading AAD IRQ
events
> > > > >     279a6dad0cd9 ASoC: da7219: Flush pending AAD IRQ when
suspending
> > > > >     d424c636b750 ksmbd: no response from compound read
> > > > >     82373d1b763e ksmbd: fix out of bounds in smb3_decrypt_req()
> > > > >     20d449a08749 9p: virtio: make sure 'offs' is initialized in
zc_request
> > > > >     c4269c7258d9 media: pci: cx23885: fix error handling for
cx23885 ATSC boards
> > > > >     17d75773b66e media: pulse8-cec: handle possible ping error
> > > > >     f281a3739399 phy: qcom-snps-femto-v2: use
qcom_snps_hsphy_suspend/resume error code
> > > > >     dfff9c91cbb0 ARM: dts: imx: Set default tuning step for imx7d
usdhc
> > > > >     4e364cab1331 ARM: dts: imx: Adjust dma-apbh node name
> > > > >     99319298fd9a ARM: dts: imx7s: Drop dma-apb interrupt-names
> > > > >     1dc2c12854b6 ARM: dts: imx: update sdma node name format
> > > > >     aff03380bda4 Linux 5.15.131
> > > > >     cd8ab566cf17 usb: typec: tcpci: clear the fault status bit
> > > > >     403b2e940910 usb: typec: tcpci: move tcpci.h to
include/linux/usb/
> > > > >     f29483873e24 pinctrl: amd: Don't show `Invalid config param`
errors
> > > > >     b911bef132a0 nilfs2: fix WARNING in mark_buffer_dirty due to
discarded buffer reuse
> > > > >     1c6ddf739f15 nilfs2: fix general protection fault in
nilfs_lookup_dirty_data_buffers()
> > > > >     f6e61aef5c5d tcpm: Avoid soft reset when partner does not
support get_status
> > > > >     da0e7d435e31 fsi: master-ast-cf: Add MODULE_FIRMWARE macro
> > > > >     72eca651d732 firmware: stratix10-svc: Fix an NULL vs IS_ERR()
bug in probe
> > > > >     907216337bea serial: sc16is7xx: fix bug when first setting
GPIO direction
> > > > >     45d9611ebff2 serial: sc16is7xx: fix broken port 0 uart init
> > > > >     f90e267dd27e serial: qcom-geni: fix opp vote on shutdown
> > > > >     46d13013b574 wifi: mt76: mt7921: do not support one stream on
secondary antenna only
> > > > >     a5c2a467e9e7 Bluetooth: btsdio: fix use after free bug in
btsdio_remove due to race condition
> > > > >     f49294ad6898 staging: rtl8712: fix race condition
> > > > >     d17cec60e87c HID: wacom: remove the battery when the EKR is
off
> > > > >     842c7da3eee2 usb: chipidea: imx: improve logic if
samsung,picophy-* parameter is 0
> > > > >     276a906f81a7 usb: dwc3: meson-g12a: do post init to fix
broken usb after resumption
> > > > >     60f938e84fbb ALSA: usb-audio: Fix init call orders for UAC1
> > > > >     e949dd2a9b6b USB: serial: option: add FOXCONN T99W368/T99W373
product
> > > > >     c41411d8b333 USB: serial: option: add Quectel EM05G variant
(0x030e)
> > > > >     09baa839d415 modules: only allow symbol_get of
EXPORT_SYMBOL_GPL modules
> > > > >     997a194914c4 rtc: ds1685: use EXPORT_SYMBOL_GPL for
ds1685_rtc_poweroff
> > > > >     3d0f6408601b net: enetc: use EXPORT_SYMBOL_GPL for
enetc_phc_index
> > > > >     da95090821c4 mmc: au1xmmc: force non-modular build and remove
symbol_get usage
> > > > >     e3e68100c036 ARM: pxa: remove use of symbol_get()
> > > > >     bb5bf157b5be ksmbd: replace one-element array with flex-array
member in struct smb2_ea_info
> > > > >     2e3f57f74c0a ksmbd: fix wrong DataOffset validation of create
context
> > > > >     b3ad7f39fd85 erofs: ensure that the post-EOF tails are all
zeroed
> > > > >     8f790700c974 Linux 5.15.130
> > > > >     69347c334071 rcu-tasks: Add trc_inspect_reader() checks for
exiting critical section
> > > > >     8046fb611f70 rcu-tasks: Wait for trc_read_check_handler() IPI=
s
> > > > >     da22db901cc1 rcu-tasks: Fix IPI failure handling in
trc_wait_for_one_reader
> > > > >     a0249d365ac8 rcu: Prevent expedited GP from enabling tick on
offline CPU
> > > > >     7aec063d6029 ARM: module: Use module_init_layout_section() to
spot init sections
> > > > >     4a8976052acd arm64: module: Use module_init_layout_section()
to spot init sections
> > > > >     f8a74159d116 arm64: module-plts: inline linux/moduleloader.h
> > > > >     363bbb5008e5 module: Expose module_init_layout_section()
> > > > >     758e3d0cb753 ACPI: thermal: Drop nocrt parameter
> > > > >     9e43368a3393 Linux 5.15.129
> > > > >     d48016d74836 mm,ima,kexec,of: use memblock_free_late from
ima_free_kexec_buffer
> > > > >     1c41cd30d5cd mm: memory-failure: fix unexpected return value
in soft_offline_page()
> > > > >     0712721e4f4f mm: memory-failure: kill soft_offline_free_page(=
)
> > > > >     efd02b5cadd5 dma-buf/sw_sync: Avoid recursive lock during
fence signal
> > > > >     8dbf913520c4 pinctrl: renesas: rza2: Add lock around
pinctrl_generic{{add,remove}_group,{add,remove}_function}
> > > > >     f1c0402b8e22 clk: Fix undefined reference to
`clk_rate_exclusive_{get,put}'
> > > > >     10bc3eddc605 scsi: core: raid_class: Remove
raid_component_add()
> > > > >     d3d57cdbfda4 scsi: snic: Fix double free in snic_tgt_create()
> > > > >     ef56cc8889be can: raw: add missing refcount for memory leak
fix
> > > > >     930f3f164964 drm/i915: Fix premature release of request's
reusable memory
> > > > >     3cb86cc565df cgroup/cpuset: Free DL BW in case can_attach()
fails
> > > > >     ffff4fc4bad7 sched/deadline: Create DL BW alloc, free & check
overflow interface
> > > > >     86aa90795979 cgroup/cpuset: Iterate only if DEADLINE tasks
are present
> > > > >     43d8cbfefa7c sched/cpuset: Keep track of SCHED_DEADLINE task
in cpusets
> > > > >     d0eb4917f4d3 sched/cpuset: Bring back cpuset_mutex
> > > > >     918879de0e23 cgroup/cpuset: Rename functions dealing with
DEADLINE accounting
> > > > >     78efab71a649 torture: Fix hang during kthread shutdown phase
> > > > >     c8fb97dd7fe6 nfsd: use vfs setgid helper
> > > > >     01966511868e nfs: use vfs setgid helper
> > > > >     a7a1849899aa x86/fpu: Set X86_FEATURE_OSXSAVE feature after
enabling OSXSAVE in CR4
> > > > >     ad79f943c869 x86/fpu: Invalidate FPU state correctly on exec(=
)
> > > > >     b190cf1f277a drm/display/dp: Fix the DP DSC Receiver cap size
> > > > >     c8aab333d41a drm/vmwgfx: Fix shader stage validation
> > > > >     b53ed415163e PCI: acpiphp: Use
pci_assign_unassigned_bridge_resources() only for non-root bus
> > > > >     60ba1bfa036a media: vcodec: Fix potential array out-of-bounds
in encoder queue_setup
> > > > >     544cd10defa1 of: dynamic: Refactor action prints to not use
"%pOF" inside devtree_lock
> > > > >     f1d4a5881856 of: unittest: Fix EXPECT for
parse_phandle_with_args_map() test
> > > > >     ce66cd478636 radix tree: remove unused variable
> > > > >     898c8c5b1114 lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for
32-bit kernels
> > > > >     ff90a4c6edf8 batman-adv: Hold rtnl lock during MTU update via
netlink
> > > > >     ea38c0d9aaa2 batman-adv: Fix batadv_v_ogm_aggr_send memory
leak
> > > > >     7f3f72eb8f5b batman-adv: Fix TT global entry leak when client
roamed back
> > > > >     f7667b49880a batman-adv: Do not get eth header before
batadv_check_management_packet
> > > > >     3f9312dd7581 batman-adv: Don't increase MTU when set by user
> > > > >     cde5a240d72d batman-adv: Trigger events for auto adjusted MTU
> > > > >     22426e1ce679 selinux: set next pointer before attaching to
list
> > > > >     711595bfdccf nfsd: Fix race to FREE_STATEID and cl_revoked
> > > > >     bd1697e12230 NFS: Fix a use after free in
nfs_direct_join_group()
> > > > >     5f642613746e mm: add a call to flush_cache_vmap() in
vmap_pfn()
> > > > >     440c10034b4d ALSA: ymfpci: Fix the missing snd_card_free()
call at probe error
> > > > >     5cc7d81cf576 clk: Fix slab-out-of-bounds error in
devm_clk_release()
> > > > >     0f72859acfa2 NFSv4: Fix dropped lock for racing OPEN and
delegation return
> > > > >     9c025420fef2 ibmveth: Use dcbf rather than dcbfl
> > > > >     7e546bd08943 Revert "KVM: x86: enable TDP MMU by default"
> > > > >     67af12f5582b net/ncsi: change from ndo_set_mac_address to
dev_set_mac_address
> > > > >     4451457d61e0 net/ncsi: make one oem_gma function for all mfr
id
> > > > >     f683f4be802b bonding: fix macvlan over alb bond support
> > > > >     0fa8046e923a net: remove bond_slave_has_mac_rcu()
> > > > >     f0ec97fca629 rtnetlink: Reject negative ifindexes in
RTM_NEWLINK
> > > > >     00247cfd2b69 rtnetlink: return ENODEV when ifname does not
exist and group is given
> > > > >     75cfb7de44e5 netfilter: nf_tables: fix out of memory error
handling
> > > > >     f22954f8c58f netfilter: nf_tables: flush pending destroy work
before netlink notifier
> > > > >     ff34403fef98 net/sched: fix a qdisc modification with
ambiguous command request
> > > > >     30624ea3f8b6 igc: Fix the typo in the PTM Control macro
> > > > >     f697c3ead109 igb: Avoid starting unnecessary workqueues
> > > > >     d7823d752ce1 ice: fix receive buffer size miscalculation
> > > > >     ace1b0ae3097 net: validate veth and vxcan peer ifindexes
> > > > >     335be585416d net: bcmgenet: Fix return value check for
fixed_phy_register()
> > > > >     60a5034584ea net: bgmac: Fix return value check for
fixed_phy_register()
> > > > >     5b52c9ba42c0 ipvlan: Fix a reference count leak warning in
ipvlan_ns_exit()
> > > > >     2bad37b6f675 dccp: annotate data-races in dccp_poll()
> > > > >     9b015360e86f sock: annotate data-races around
prot->memory_pressure
> > > > >     c52c6c0223e1 octeontx2-af: SDP: fix receive link config
> > > > >     ce6e2b14bc09 tracing: Fix memleak due to race between
current_tracer and trace
> > > > >     ef748360ba91 tracing: Fix cpu buffers unavailable due to
'record_disabled' missed
> > > > >     fdf5804d7475 can: raw: fix lockdep issue in raw_release()
> > > > >     278fccf587dd drm/amd/display: check TG is non-null before
checking if enabled
> > > > >     a955e6a0e39d drm/amd/display: do not wait for mpc idle if tg
is disabled
> > > > >     e0bd4f0c60b4 can: raw: fix receiver memory leak
> > > > >     b832174b7f89 jbd2: fix a race when checking checkpoint buffer
busy
> > > > >     9c31bb2684f8 jbd2: remove journal_clean_one_cp_list()
> > > > >     d91783e6864a jbd2: remove t_checkpoint_io_list
> > > > >     a0ab49e7a758 ALSA: pcm: Fix potential data race at PCM memory
allocation helpers
> > > > >     2e56d380daa9 fbdev: fix potential OOB read in fast_imageblit(=
)
> > > > >     14163f4a4fa6 fbdev: Fix sys_imageblit() for arbitrary image
widths
> > > > >     5b60bd9081a9 fbdev: Improve performance of sys_imageblit()
> > > > >     166f0bf4560b MIPS: cpu-features: Use boot_cpu_type for CPU
type based features
> > > > >     8f106e97409d MIPS: cpu-features: Enable octeon_cache by
cpu_type
> > > > >     d1d0b239f974 fs: dlm: fix mismatch of plock results from
userspace
> > > > >     77d334c44681 fs: dlm: use dlm_plock_info for do_unlock_close
> > > > >     f9a33cc7d946 fs: dlm: change plock interrupted message to
debug again
> > > > >     7ac088841ffb fs: dlm: add pid to debug log
> > > > >     df9c842ab0a4 dlm: replace usage of found with dedicated list
iterator variable
> > > > >     33e9c610e337 dlm: improve plock logging if interrupted
> > > > >     d9ce077f8b1f PCI: acpiphp: Reassign resources on bridge if
necessary
> > > > >     8cc8645dd3e1 xprtrdma: Remap Receive buffers after a reconnec=
t
> > > > >     91a707507e83 NFSv4: fix out path in __nfs4_get_acl_uncached
> > > > >     323b830eebd1 NFSv4.2: fix error handling in
nfs42_proc_getxattr
> > > > >     5de0a325c45e objtool/x86: Fix SRSO mess
> > > > >     5ddfe5cc8716 Linux 5.15.128
> > > > >     9080f4fcc202 x86/srso: Correct the mitigation status when SMT
is disabled
> > > > >     484eefc6ff9c objtool/x86: Fixup frame-pointer vs rethunk
> > > > >     55f1cbeaa159 x86/retpoline,kprobes: Fix position of thunk
sections with CONFIG_LTO_CLANG
> > > > >     fa24cd0fbcb7 x86/srso: Disable the mitigation on unaffected
configurations
> > > > >     aa0777ce0d3d x86/CPU/AMD: Fix the DIV(0) initial fix attempt
> > > > >     bbe585239d4f x86/retpoline: Don't clobber RFLAGS during
srso_safe_ret()
> > > > >     19f23d16b0e0 x86/static_call: Fix __static_call_fixup()
> > > > >     df6495f203a7 x86/srso: Explain the untraining sequences a bit
more
> > > > >     43548590ad7e x86/cpu: Cleanup the untrain mess
> > > > >     035e906bfc93 x86/cpu: Rename srso_(.*)_alias to srso_alias_\1
> > > > >     19c1c0499650 x86/cpu: Rename original retbleed methods
> > > > >     f77dbb90962b x86/cpu: Clean up SRSO return thunk mess
> > > > >     f624ce6c7fc2 x86/ibt: Add ANNOTATE_NOENDBR
> > > > >     f1171d455d94 objtool: Add frame-pointer-specific function
ignore
> > > > >     08f7cfd44f77 x86/alternative: Make custom return thunk
unconditional
> > > > >     0d810eff090c x86/cpu: Fix up srso_safe_ret() and
__x86_return_thunk()
> > > > >     8089aae6020e x86/cpu: Fix __x86_return_thunk symbol type
> > > > >     5b28fda5fdee mmc: f-sdh30: fix order of function calls in
sdhci_f_sdh30_remove
> > > > >     e8c5081da2cc net: fix the RTO timer retransmitting skb every
1ms if linear option is enabled
> > > > >     431db3f48c28 virtio-net: set queues after driver_ok
> > > > >     d39fc9b94dc0 af_unix: Fix null-ptr-deref in
unix_stream_sendpage().
> > > > >     9a4d8dc706c2 arm64: dts: rockchip: Disable HS400 for eMMC on
ROCK Pi 4
> > > > >     6b64974e02ea exfat: check if filename entries exceeds max
filename length
> > > > >     6065b3017107 netfilter: set default timeout to 3 secs for
sctp shutdown send and recv state
> > > > >     a00c5d2c208b drm/amd: flush any delayed gfxoff on suspend
entry
> > > > >     d578c919deb7 drm/qxl: fix UAF on handle creation
> > > > >     ff09f9e671ff mmc: block: Fix in_flight[issue_type] value erro=
r
> > > > >     b803fedb6e50 mmc: wbsd: fix double mmc_free_host() in
wbsd_init()
> > > > >     961f7ce16223 cifs: Release folio lock on fscache read hit.
> > > > >     cc3f194f46e7 ALSA: usb-audio: Add support for Mythware
XA001AU capture and playback interfaces.
> > > > >     18e27df4f2b4 serial: 8250: Fix oops for port->pm on
uart_change_pm()
> > > > >     e9b8ee715dbc riscv: uaccess: Return the number of bytes
effectively not copied
> > > > >     b2a331abcb03 ALSA: hda/realtek - Remodified 3k pull low
procedure
> > > > >     dfb9676ed25b soc: aspeed: socinfo: Add kfree for kstrdup
> > > > >     c5ac7522a8db ASoC: meson: axg-tdm-formatter: fix channel slot
allocation
> > > > >     fd346ef1cd2d ASoC: rt5665: add missed regulator_bulk_disable
> > > > >     e878458d820c ARM: dts: imx: Set default tuning step for
imx6sx usdhc
> > > > >     430c29a54e4a arm64: dts: qcom: qrb5165-rb5: fix thermal zone
conflict
> > > > >     03522d73a498 bus: ti-sysc: Flush posted write on enable
before reset
> > > > >     578371ce0d7f net: do not allow gso_size to be set to
GSO_BY_FRAGS
> > > > >     5fc4fd3f3eb8 sock: Fix misuse of sk_under_memory_pressure()
> > > > >     fc3d82d295d1 net: dsa: mv88e6xxx: Wait for EEPROM done before
HW reset
> > > > >     f11c2802e143 i40e: fix misleading debug logs
> > > > >     5ba2b936f3e1 iavf: fix FDIR rule fields masks validation
> > > > >     ae6834689fd6 team: Fix incorrect deletion of ETH_P_8021AD
protocol vid from slaves
> > > > >     0ffbc341cfae net: phy: broadcom: stub c45 read/write for 5481=
0
> > > > >     bf221e5e4b19 netfilter: nft_dynset: disallow object maps
> > > > >     9177869b85dd ipvs: fix racy memcpy in proc_do_sync_threshold
> > > > >     1adaec4758d1 netfilter: nf_tables: deactivate catchall
elements in next generation
> > > > >     82109740d610 netfilter: nf_tables: fix false-positive lockdep
splat
> > > > >     b2f6d73395cb drm/panel: simple: Fix AUO G121EAN01 panel
timings according to the docs
> > > > >     7207ee323afa selftests: mirror_gre_changes: Tighten up the
TTL test match
> > > > >     c2a6ffe3f1a3 net: phy: fix IRQ-based wake-on-lan over
hibernate / power off
> > > > >     8e5e967348ca xfrm: add forgotten nla_policy for
XFRMA_MTIMER_THRESH
> > > > >     075448a2eb75 xfrm: add NULL check in xfrm_update_ae_params
> > > > >     e1e04cc2ef2c ip_vti: fix potential slab-use-after-free in
decode_session6
> > > > >     a1639a82ce14 ip6_vti: fix slab-use-after-free in
decode_session6
> > > > >     44b3d4096700 xfrm: fix slab-use-after-free in decode_session6
> > > > >     a465ace883ac net: xfrm: Amend XFRMA_SEC_CTX nla_policy
structure
> > > > >     fed1cd2cd3aa net: af_key: fix sadb_x_filter validation
> > > > >     1960f468078b net: xfrm: Fix xfrm_address_filter OOB read
> > > > >     080dedb1cad8 i2c: designware: Handle invalid SMBus block data
response length value
> > > > >     416c538684bd i2c: designware: Correct length byte validation
logic
> > > > >     b966e9e1e250 btrfs: fix BUG_ON condition in
btrfs_cancel_balance
> > > > >     77698e6ff6f0 tty: serial: fsl_lpuart: Clear the error flags
by writing 1 for lpuart32 platforms
> > > > >     2a5234464383 tty: n_gsm: fix the UAF caused by race condition
in gsm_cleanup_mux
> > > > >     8ef25fb13494 powerpc/rtas_flash: allow user copy to flash
block cache objects
> > > > >     bb70e2b70f8d fbdev: mmp: fix value check in mmphw_probe()
> > > > >     184f1b68bb99 i2c: hisi: Only handle the interrupt of the
driver's transfer
> > > > >     c4e671dae50e i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock
issue
> > > > >     b99f490ea87e cifs: fix potential oops in cifs_oplock_break
> > > > >     a5ae5a81bc19 vduse: Use proper spinlock for IRQ injection
> > > > >     5b7d5c2dd664 virtio-mmio: don't break lifecycle of vm_dev
> > > > >     edf3b5aadb25 btrfs: move out now unused BG from the reclaim
list
> > > > >     170773563ef6 ARM: dts: nxp/imx6sll: fix wrong property name
in usbphy node
> > > > >     4ffbfe1c980f ARM: dts: imx6sll: fixup of operating points
> > > > >     e2ff5cf681a8 mmc: sunxi: fix deferred probing
> > > > >     f93e8c5a7bd9 mmc: bcm2835: fix deferred probing
> > > > >     4eeba5d476fe USB: dwc3: fix use-after-free on core driver
unbind
> > > > >     a78fe5c9d8d5 USB: dwc3: qcom: fix NULL-deref on suspend
> > > > >     8a6b7534020d tty: serial: fsl_lpuart: reduce RX watermark to
0 on LS1028A
> > > > >     701bb5fee7c3 tty: serial: fsl_lpuart: make rx_watermark
configurable for different platforms
> > > > >     fa254ab7d02d tty: serial: fsl_lpuart: Add i.MXRT1050 support
> > > > >     20351ddb1f41 usb: dwc3: gadget: Improve dwc3_gadget_suspend()
and dwc3_gadget_resume()
> > > > >     31a0e60fe16b USB: dwc3: gadget: drop dead hibernation code
> > > > >     d9e004104e45 usb: dwc3: Fix typos in gadget.c
> > > > >     2fa487a94667 usb: dwc3: Remove DWC3 locking during gadget
suspend/resume
> > > > >     7dfb384e76ee usb: dwc3: gadget: Synchronize IRQ between soft
connect/disconnect
> > > > >     d3c82f24ee69 drm/amd/display: fix access hdcp_workqueue asser=
t
> > > > >     0ba6c7ba081e drm/amd/display: phase3 mst hdcp for multiple
displays
> > > > >     99c444d3c3c4 drm/amd/display: save restore hdcp state when
display is unplugged from mst hub
> > > > >     4f1beb75f652 ARM: dts: aspeed: asrock: Correct firmware flash
SPI clocks
> > > > >     f84c2ca3490c igc: read before write to SRRCTL register
> > > > >     9fa82f031af8 iio: addac: stx104: Fix race condition when
converting analog-to-digital
> > > > >     d31d04ec404c iio: addac: stx104: Fix race condition for
stx104_write_raw()
> > > > >     89a007f3a383 iio: stx104: Move to addac subdirectory
> > > > >     cadf8f2d7c9d iio: adc: stx104: Implement and utilize register
structures
> > > > >     6089d354346f iio: adc: stx104: Utilize iomap interface
> > > > >     565b96d9a7ab iio: add addac subdirectory
> > > > >     49b830d75f03 ring-buffer: Do not swap cpu_buffer during
resize process
> > > > >     6657ecbcc39c powerpc/kasan: Disable KCOV in KASAN code
> > > > >     8703b26387e1 ALSA: hda: fix a possible null-pointer
dereference due to data race in snd_hdac_regmap_sync()
> > > > >     5ed4dbc13726 ALSA: hda/realtek: Add quirks for Unis H3C
Desktop B760 & Q760
> > > > >     c7d8b5f46f06 fs/ntfs3: Mark ntfs dirty when on-disk struct is
corrupted
> > > > >     3a00ec562f8c fs: ntfs3: Fix possible null-pointer
dereferences in mi_read()
> > > > >     e7799bb4dbe2 fs/ntfs3: Enhance sanity check while generating
attr_list
> > > > >     ef568da1fd84 drm/amdgpu: Fix potential fence use-after-free v=
2
> > > > >     5720c7e185d4 Bluetooth: btusb: Add MT7922 bluetooth ID for
the Asus Ally
> > > > >     548a6b64b3c0 Bluetooth: L2CAP: Fix use-after-free
> > > > >     302d04596364 watchdog: sp5100_tco: support Hygon FCH/SCH
(Server Controller Hub)
> > > > >     2ea70379e4f4 firewire: net: fix use after free in
fwnet_finish_incoming_packet()
> > > > >     97fd1c8e9c5a pcmcia: rsrc_nonstatic: Fix memory leak in
nonstatic_release_resource_db()
> > > > >     85e888150075 gfs2: Fix possible data races in
gfs2_show_options()
> > > > >     eafb79d2448a usb: chipidea: imx: add missing USB PHY DPDM
wakeup setting
> > > > >     7bdb4c963049 usb: chipidea: imx: don't request QoS for imx8ul=
p
> > > > >     25decbbb66e4 thunderbolt: Read retimer NVM authentication
status prior tb_retimer_set_inbound_sbtx()
> > > > >     776b34615a29 media: platform: mediatek: vpu: fix NULL ptr
dereference
> > > > >     cb174344bf85 usb: gadget: u_serial: Avoid spinlock recursion
in __gs_console_push
> > > > >     1676748aa290 media: v4l2-mem2mem: add lock to protect
parameter num_rdy
> > > > >     985086704267 smb: client: fix warning in cifs_smb3_do_mount()
> > > > >     a3f252436e57 ovl: check type and offset of struct vfsmount in
ovl_entry
> > > > >     1a650d3ccd79 RDMA/mlx5: Return the firmware result upon
destroying QP/RQ
> > > > >     9631d88503ab HID: add quirk for 03f0:464a HP Elite Presenter
Mouse
> > > > >     4921792e04f2 drm/amdgpu: install stub fence into potential
unused fence pointers
> > > > >     fd41646d4350 HID: logitech-hidpp: Add USB and Bluetooth IDs
for the Logitech G915 TKL Keyboard
> > > > >     ff10cd3e9b3a dma-remap: use kvmalloc_array/kvfree for larger
dma memory remap
> > > > >     e9ce774052ee ASoC: SOF: Intel: fix SoundWire/HDaudio mutual
exclusion
> > > > >     7d53d1e4765c iopoll: Call cpu_relax() in busy loops
> > > > >     ca66e9dd98ef ARM: dts: imx6dl: prtrvt, prtvt7, prti6q,
prtwd2: fix USB related warnings
> > > > >     cc1590830859 PCI: tegra194: Fix possible array out of bounds
access
> > > > >     e2d10f1de1fa net: tls: avoid discarding data on record close
> > > > >     9a15ca893909 net/tls: Multi-threaded calls to TX tls_dev_del
> > > > >     2d93157b7e2d net/tls: Perform immediate device ctx cleanup
when possible
> > > > >     51222e1c77a1 macsec: use DEV_STATS_INC()
> > > > >     3d64a232e4d9 macsec: Fix traffic counters/statistics
> > > > >     396a1921406a selftests: forwarding: tc_actions: Use ncat
instead of nc
> > > > >     d61a0886d336 selftests: forwarding: tc_actions: cleanup
temporary files when test is aborted
> > > > >     a798977df6d0 mmc: sdhci-f-sdh30: Replace with sdhci_pltfm
> > > > >     f6f7927ac664 Linux 5.15.127
> > > > >     c597d8cb0d33 timers/nohz: Last resort update jiffies on
nohz_full IRQ entry
> > > > >     b4d36e6c5dc4 timers/nohz: Switch to ONESHOT_STOPPED in the
low-res handler when the tick is stopped
> > > > >     c3b954a51b64 tick: Detect and fix jiffies update stall
> > > > >     af99918f0e39 sch_netem: fix issues in netem_change() vs
get_dist_table()
> > > > >     5d094d4e7b99 alpha: remove __init annotation from exported
page_is_ram()
> > > > >     f8d6d25756ea scsi: qedf: Fix firmware halt over suspend and
resume
> > > > >     85db1cd1744e scsi: qedi: Fix firmware halt over suspend and
resume
> > > > >     e70469c28953 scsi: fnic: Replace return codes in
fnic_clean_pending_aborts()
> > > > >     6bc7f4c8c27d scsi: core: Fix possible memory leak if
device_add() fails
> > > > >     461f8ac666fa scsi: snic: Fix possible memory leak if
device_add() fails
> > > > >     171e117cdc0a scsi: 53c700: Check that command slot is not NUL=
L
> > > > >     7a792b3d888a scsi: storvsc: Fix handling of virtual Fibre
Channel timeouts
> > > > >     0f52d7b78251 scsi: core: Fix legacy /proc parsing buffer
overflow
> > > > >     b757ef99df39 netfilter: nf_tables: report use refcount
overflow
> > > > >     9bdbbcf9d148 nvme-rdma: fix potential unbalanced freeze &
unfreeze
> > > > >     d68f8ef6ef70 nvme-tcp: fix potential unbalanced freeze &
unfreeze
> > > > >     ae6e21f8bb2a btrfs: set cache_block_group_error if we find an
error
> > > > >     314135b7bae9 btrfs: reject invalid reloc tree root keys with
stack dump
> > > > >     69dd147de419 btrfs: exit gracefully if reloc roots don't matc=
h
> > > > >     c40d4b60c58d btrfs: don't stop integrity writeback too early
> > > > >     555e126dd30b ibmvnic: Handle DMA unmapping of login buffs in
release functions
> > > > >     34fcc823823a ibmvnic: Unmap DMA login rsp buffer on send
login fail
> > > > >     cee62753cf2e ibmvnic: Enforce stronger sanity checks on login
response
> > > > >     27e8db8380eb net/mlx5: Skip clock update work when device is
in error state
> > > > >     f638fc2f7377 net/mlx5: Allow 0 for total host VFs
> > > > >     086a80eb6213 dmaengine: mcf-edma: Fix a potential
un-allocated memory access
> > > > >     7e1dc94b2d50 nexthop: Fix infinite nexthop bucket dump when
using maximum nexthop ID
> > > > >     608a4327c257 nexthop: Make nexthop bucket dump more efficient
> > > > >     4457300cfd84 nexthop: Fix infinite nexthop dump when using
maximum nexthop ID
> > > > >     91307347d632 net: hns3: add wait until mac link down
> > > > >     094310eb2b93 net: hns3: refactor hclge_mac_link_status_wait
for interface reuse
> > > > >     1ae9703c2e32 net: phy: at803x: remove set/get wol callbacks
for AR8032
> > > > >     7d496cd83a9d RDMA/umem: Set iova in ODP flow
> > > > >     f78a4238a873 wifi: cfg80211: fix sband iftype data lookup for
AP_VLAN
> > > > >     26a27dd76054 drm/rockchip: Don't spam logs in atomic check
> > > > >     918c1e6843b7 IB/hfi1: Fix possible panic during hotplug remov=
e
> > > > >     df21468bfdc8 iavf: fix potential races for FDIR filters
> > > > >     b1f985cf1c52 drivers: net: prevent tun_build_skb() to exceed
the packet size limit
> > > > >     f239c9e1d98b dccp: fix data-race around dp->dccps_mss_cache
> > > > >     49a1fee22fae bonding: Fix incorrect deletion of ETH_P_8021AD
protocol vid from slaves
> > > > >     789fcd94c9ca xsk: fix refcount underflow in error path
> > > > >     e95808121953 tunnels: fix kasan splat when generating ipv4
pmtu error
> > > > >     7903311b2cec net/packet: annotate data-races around tp->statu=
s
> > > > >     f4614e379bf9 mISDN: Update parameter type of dsp_cmx_send()
> > > > >     3961761af392 bpf, sockmap: Fix bug that strp_done cannot be
called
> > > > >     20d53895d5c0 bpf, sockmap: Fix map type error in
sock_map_del_link
> > > > >     a09c258cfa77 net: core: remove unnecessary frame_sz check in
bpf_xdp_adjust_tail()
> > > > >     85af0b226c0b selftests: forwarding: tc_flower: Relax success
criterion
> > > > >     7b3fa99526f9 selftests: forwarding: Switch off timeout
> > > > >     e410f85ebca9 selftests: forwarding: Skip test when no
interfaces are specified
> > > > >     4a4499452620 selftests: forwarding: ethtool_extended_state:
Skip when using veth pairs
> > > > >     b8d216e9c607 selftests: forwarding: ethtool: Skip when using
veth pairs
> > > > >     b9dfb80d9fb2 selftests: forwarding: Add a helper to skip test
when using veth pairs
> > > > >     b973eb76dff3 selftests/rseq: Fix build with undefined __weak
> > > > >     b8b8db5857d4 drm/nouveau/disp: Revert a NULL check inside
nouveau_connector_get_modes
> > > > >     4c6767c8bf5e x86: Move gds_ucode_mitigated() declaration to
header
> > > > >     f919cbc90441 x86/speculation: Add cpu_show_gds() prototype
> > > > >     9290ef14c96b x86/mm: Fix VDSO and VVAR placement on 5-level
paging machines
> > > > >     829409510d00 x86/cpu/amd: Enable Zenbleed fix for AMD Custom
APU 0405
> > > > >     c41a22b93d7c x86/srso: Fix build breakage with the LLVM linke=
r
> > > > >     c2372b1559d4 usb: typec: tcpm: Fix response to vsafe0V event
> > > > >     f776b94ccdf0 usb: common: usb-conn-gpio: Prevent bailing out
if initial role is none
> > > > >     00cc14b52d6f usb: dwc3: Properly handle processing of pending
events
> > > > >     7a11d1e2625b usb-storage: alauda: Fix uninit-value in
alauda_check_media()
> > > > >     945e1b3c361b misc: rtsx: judge ASPM Mode to set PETXCFG Reg
> > > > >     03eebad96233 binder: fix memory leak in binder_init()
> > > > >     a8e2ae6296d5 iio: adc: ina2xx: avoid NULL pointer dereference
on OF device match
> > > > >     2df8ae1e42b8 iio: cros_ec: Fix the allocation size for
cros_ec_command
> > > > >     a7cedc2b7612 io_uring: correct check for O_TMPFILE
> > > > >     697bc234632c selftests/bpf: Fix sk_assign on s390x
> > > > >     127277262110 selftests/bpf: Workaround verification failure
for fexit_bpf2bpf/func_replace_return_code
> > > > >     ee701208f4cc selftests/bpf: make test_align selftest more
robust
> > > > >     683d2969a082 bpf: aggressively forget precise markings during
state checkpointing
> > > > >     2516deeb872a bpf: stop setting precise in current state
> > > > >     c47d0178ad86 bpf: allow precision tracking for programs with
subprogs
> > > > >     3645510cf926 nilfs2: fix use-after-free of nilfs_root in
dirtying inodes via iput
> > > > >     36a3b560c78d radix tree test suite: fix incorrect allocation
size for pthreads
> > > > >     8d10284243b7 hwmon: (pmbus/bel-pfe) Enable
PMBUS_SKIP_STATUS_CHECK for pfe1100
> > > > >     3ad4ba2b6112 drm/amd/display: check attr flag before set
cursor degamma on DCN3+
> > > > >     621204fca047 drm/shmem-helper: Reset vma->vm_ops before
calling dma_buf_mmap()
> > > > >     64e6253f6489 drm/nouveau/gr: enable memory loads on helper
invocation on all channels
> > > > >     bcd9eeb3a309 riscv,mmio: Fix readX()-to-delay() ordering
> > > > >     57772ae9b339 dmaengine: pl330: Return DMA_PAUSED when
transaction is paused
> > > > >     3ca8f5c733c4 ipv6: adjust ndisc_is_useropt() to also return
true for PIO
> > > > >     6cde60777675 mmc: moxart: read scr register without changing
byte order
> > > > >     3f00757ab416 wireguard: allowedips: expand maximum node depth
> > > > >     aeb974907642 ksmbd: fix wrong next length validation of ea
buffer in smb2_set_ea()
> > > > >     595679098bdc ksmbd: validate command request size
> > > > >     24c4de4069cb Linux 5.15.126
> > > > >     aeb4db8ab7f1 PM: sleep: wakeirq: fix wake irq arming
> > > > >     b5d3a4251bd2 PM / wakeirq: support enabling wake-up irq after
runtime_suspend called
> > > > >     a36b522767f3 soundwire: fix enumeration completion
> > > > >     7996facaf0ee soundwire: bus: pm_runtime_request_resume on
peripheral attachment
> > > > >     c91c07ae0849 selftests/rseq: Play nice with binaries
statically linked against glibc 2.35+
> > > > >     1cdb50faf7f7 selftests/rseq: check if libc rseq support is
registered
> > > > >     0f1f471b91f4 drm/imx/ipuv3: Fix front porch adjustment upon
hactive aligning
> > > > >     5058c1444040 powerpc/mm/altmap: Fix altmap boundary check
> > > > >     eb7a5e4d14c8 mtd: rawnand: fsl_upm: Fix an off-by one test in
fun_exec_op()
> > > > >     70643e98cbc3 mtd: rawnand: rockchip: Align hwecc vs. raw page
helper layouts
> > > > >     1796b492f8cc mtd: rawnand: rockchip: fix oobfree offset and
description
> > > > >     f6807b62fb0e mtd: rawnand: omap_elm: Fix incorrect type in
assignment
> > > > >     596be6716bc5 ext2: Drop fragment support
> > > > >     0ccfe21949bc fs: Protect reconfiguration of sb read-write
from racing writes
> > > > >     27d0f755d649 net: usbnet: Fix WARNING in
usbnet_start_xmit/usb_submit_urb
> > > > >     fbe5a2fed815 Bluetooth: L2CAP: Fix use-after-free in
l2cap_sock_ready_cb
> > > > >     afd9a31b5aa4 fs/sysv: Null check to prevent null-ptr-deref bu=
g
> > > > >     80ec112c1996 fs/ntfs3: Use __GFP_NOWARN allocation at
ntfs_load_attr_list()
> > > > >     0d6f639f1dcd file: reinstate f_pos locking optimization for
regular files
> > > > >     b44d28b98f18 bpf, cpumap: Make sure kthread is running before
map update returns
> > > > >     8089eb93d678 drm/ttm: check null pointer before accessing
when swapping
> > > > >     ef0d07c66843 open: make RESOLVE_CACHED correctly test for
O_TMPFILE
> > > > >     c81bdf8f9f2b bpf: Disable preemption in bpf_event_output
> > > > >     ae07cfe2b099 rbd: prevent busy loop when requesting exclusive
lock
> > > > >     7978bcca4c1f wifi: mt76: mt7615: do not advertise 5 GHz on
first phy of MT7615D (DBDC)
> > > > >     32ca6a55e10e net: tap_open(): set sk_uid from current_fsuid()
> > > > >     4ed3eed99ee6 net: tun_chr_open(): set sk_uid from
current_fsuid()
> > > > >     adacc3a954fa arm64: dts: stratix10: fix incorrect I2C
property for SCL signal
> > > > >     b92c88009da1 mtd: rawnand: meson: fix OOB available bytes for
ECC
> > > > >     b0875c583e41 mtd: spinand: toshiba: Fix ecc_get_status
> > > > >     1c33ca1e1974 exfat: release s_lock before calling dir_emit()
> > > > >     8a34a242cf03 exfat: use kvmalloc_array/kvfree instead of
kmalloc_array/kfree
> > > > >     a74878207b02 x86/CPU/AMD: Do not leak quotient data after a
division by 0
> > > > >     b8f029fc4075 firmware: arm_scmi: Drop OF node reference in
the transport channel setup
> > > > >     287c2c8677ed ceph: defer stopping mdsc delayed_work
> > > > >     98b521d10e73 USB: zaurus: Add ID for A-300/B-500/C-700
> > > > >     cd6872f2cf56 libceph: fix potential hang in ceph_osdc_notify(=
)
> > > > >     e5f5b4a89809 scsi: storvsc: Limit max_sectors for virtual
Fibre Channel devices
> > > > >     212a9a3c67be scsi: zfcp: Defer fc_rport blocking until after
ADISC response
> > > > >     dac382725394 tcp_metrics: fix data-race in tcpm_suck_dst() vs
fastopen
> > > > >     4517782e1bc3 tcp_metrics: annotate data-races around
tm->tcpm_net
> > > > >     e842a68667d4 tcp_metrics: annotate data-races around
tm->tcpm_vals[]
> > > > >     d3184bea4ace tcp_metrics: annotate data-races around
tm->tcpm_lock
> > > > >     9a7367cbe33d tcp_metrics: annotate data-races around
tm->tcpm_stamp
> > > > >     6f6bd67f4894 tcp_metrics: fix addr_same() helper
> > > > >     b0acbcf1e7a1 prestera: fix fallback to previous version on
same major version
> > > > >     d6d9d0f5a5e0 net/mlx5: fs_core: Skip the FTs in the same
FS_TYPE_PRIO_CHAINS fs_prio
> > > > >     c999fb1039dd net/mlx5: fs_core: Make find_closest_ft more
generic
> > > > >     32ef2c0c6cf1 vxlan: Fix nexthop hash size
> > > > >     1bb54a21f4d9 ip6mr: Fix skb_under_panic in
ip6mr_cache_report()
> > > > >     64e3affee288 s390/qeth: Don't call dev_close/dev_open
(DOWN/UP)
> > > > >     a0da2684db18 net: dcb: choose correct policy to parse
DCB_ATTR_BCN
> > > > >     193333229aac net: netsec: Ignore 'phy-mode' on SynQuacer in
DT mode
> > > > >     766c9dd00c5f net: korina: handle clk prepare error in
korina_probe()
> > > > >     6cecfdf65053 net: ll_temac: fix error checking of
irq_of_parse_and_map()
> > > > >     3761ff4f8670 net: ll_temac: Switch to use dev_err_probe()
helper
> > > > >     5c534640a7da bpf: sockmap: Remove preempt_disable in
sock_map_sk_acquire
> > > > >     79c3d81c9ad1 net/sched: cls_route: No longer copy tcf_result
on update to avoid use-after-free
> > > > >     9edf7955025a net/sched: cls_fw: No longer copy tcf_result on
update to avoid use-after-free
> > > > >     262430dfc618 net/sched: cls_u32: No longer copy tcf_result on
update to avoid use-after-free
> > > > >     b58d34068fd9 bpf, cpumap: Handle skb as well when clean up
ptr_ring
> > > > >     f04f6d9b3b06 net/sched: taprio: Limit
TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME to INT_MAX.
> > > > >     2c55d4941518 net: add missing data-race annotation for
sk_ll_usec
> > > > >     e934c50c48e2 net: add missing data-race annotations around
sk->sk_peek_off
> > > > >     fdd8d8d54d6a net: add missing READ_ONCE(sk->sk_rcvbuf)
annotation
> > > > >     98f0d1db3a27 net: add missing READ_ONCE(sk->sk_sndbuf)
annotation
> > > > >     0d1047b77b23 net: add missing READ_ONCE(sk->sk_rcvlowat)
annotation
> > > > >     6c058a1f67f0 net: annotate data-races around
sk->sk_max_pacing_rate
> > > > >     2950c5ac65b3 qed: Fix scheduling in a tasklet while getting
stats
> > > > >     a19952dbb5b6 qed: Fix kernel-doc warnings
> > > > >     6d8c259f4827 mISDN: hfcpci: Fix potential deadlock on
&hc->lock
> > > > >     8dedcc6af341 net: sched: cls_u32: Fix match key mis-addressin=
g
> > > > >     675d29de69c7 perf test uprobe_from_different_cu: Skip if
there is no gcc
> > > > >     0f6e3d8d7f91 net: dsa: fix value check in bcm_sf2_sw_probe()
> > > > >     047508edd602 rtnetlink: let rtnl_bridge_setlink checks
IFLA_BRIDGE_MODE length
> > > > >     cc9ebceaa6d0 bpf: Add length check for
SK_DIAG_BPF_STORAGE_REQ_MAP_FD parsing
> > > > >     8f9a04c742e1 net/mlx5e: fix return value check in
mlx5e_ipsec_remove_trailer()
> > > > >     00cecb0a8f9e net/mlx5: DR, fix memory leak in
mlx5dr_cmd_create_reformat_ctx
> > > > >     4c224ea31bed wifi: cfg80211: Fix return value in scan logic
> > > > >     8e72db3ffa5d KVM: s390: fix sthyi error handling
> > > > >     809edb4262f0 word-at-a-time: use the same return type for
has_zero regardless of endianness
> > > > >     b7880809d75d arm64: dts: imx8mn-var-som: add missing pull-up
for onboard PHY reset pinmux
> > > > >     804e72062be4 iommu/arm-smmu-v3: Document nesting-related
errata
> > > > >     744e6b80b830 iommu/arm-smmu-v3: Add explicit feature for
nesting
> > > > >     fd86b5944215 iommu/arm-smmu-v3: Document MMU-700 erratum
2812531
> > > > >     2de9f3dcfe63 iommu/arm-smmu-v3: Work around MMU-600 erratum
1076982
> > > > >     a850fa85d477 arm64: errata: Add detection for TRBE write to
out-of-range
> > > > >     073699df4a09 arm64: errata: Add workaround for TSB flush
failures
> > > > >     44b45e8161a5 net/mlx5: Free irqs only on shutdown callback
> > > > >     40601542c43c perf: Fix function pointer case
> > > > >     c12fa4ac8997 io_uring: gate iowait schedule on having pending
requests
> > > > >     c275eaaaa342 Linux 5.15.125
> > > > >     754e0c7c4a30 x86: fix backwards merge of GDS/SRSO bit
> > > > >     b14a3924c267 xen/netback: Fix buffer overrun triggered by
unusual packet
> > > > >     153f9a7b02d4 x86/srso: Tie SBPB bit setting to microcode
patch detection
> > > > >     df4c3823cba5 x86/srso: Fix return thunks in generated code
> > > > >     0071b17eb66b x86/srso: Add IBPB on VMEXIT
> > > > >     5398faac76a6 x86/srso: Add IBPB
> > > > >     c24aaa7dde5f x86/srso: Add SRSO_NO support
> > > > >     4e9115e194a8 x86/srso: Add IBPB_BRTYPE support
> > > > >     b35087763a44 x86/srso: Add a Speculative RAS Overflow
mitigation
> > > > >     c3b4c644525e x86/cpu, kvm: Add support for CPUID_80000021_EAX
> > > > >     236dd7133394 x86/bugs: Increase the x86 bugs vector size to
two u32s
> > > > >     0242a8bdef56 Documentation/x86: Fix backwards on/off logic
about YMM support
> > > > >     27a72e350869 x86/mm: Initialize text poking earlier
> > > > >     d0317b9502ea mm: Move mm_cachep initialization to mm_init()
> > > > >     8e4c2530879d x86/mm: Use mm_alloc() in poking_init()
> > > > >     13ec5cb4c113 x86/mm: fix poking_init() for Xen PV guests
> > > > >     3e90080d5665 x86/xen: Fix secondary processors' FPU
initialization
> > > > >     348741a9e4d3 KVM: Add GDS_NO support to KVM
> > > > >     59d78655f808 x86/speculation: Add Kconfig option for GDS
> > > > >     0cc5643b63ae x86/speculation: Add force option to GDS
mitigation
> > > > >     348a89e20184 x86/speculation: Add Gather Data Sampling
mitigation
> > > > >     a094d3b30967 x86/fpu: Move FPU initialization into
arch_cpu_finalize_init()
> > > > >     59f2739111ca x86/fpu: Mark init functions __init
> > > > >     bb9c20d903f6 x86/fpu: Remove cpuinfo argument from init
functions
> > > > >     de8b7ce4c533 x86/init: Initialize signal frame size late
> > > > >     041d929233bb init, x86: Move mem_encrypt_init() into
arch_cpu_finalize_init()
> > > > >     8ae795ed6115 init: Invoke arch_cpu_finalize_init() earlier
> > > > >     7e270cebaffd init: Remove check_bugs() leftovers
> > > > >     285384ac24c3 um/cpu: Switch to arch_cpu_finalize_init()
> > > > >     6ea421786426 sparc/cpu: Switch to arch_cpu_finalize_init()
> > > > >     21a1fc8d13d8 sh/cpu: Switch to arch_cpu_finalize_init()
> > > > >     dfeb371a2707 mips/cpu: Switch to arch_cpu_finalize_init()
> > > > >     4baf46a3ba00 m68k/cpu: Switch to arch_cpu_finalize_init()
> > > > >     8c8165cd25cf ia64/cpu: Switch to arch_cpu_finalize_init()
> > > > >     de8c592cc5a1 ARM: cpu: Switch to arch_cpu_finalize_init()
> > > > >     75da6209d3ba x86/cpu: Switch to arch_cpu_finalize_init()
> > > > >     0774fc2177c3 init: Provide arch_cpu_finalize_init()
> > > > >
> > > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > ---
> > > > >  .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
> > > > >  .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
> > > > >  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26
+++++++++----------
> > > > >  3 files changed, 19 insertions(+), 19 deletions(-)
> > > > >
> > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > > > > index 6ac3118f81..f7286759a9 100644
> > > > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > > > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > > > > @@ -11,13 +11,13 @@ python () {
> > > > >          raise bb.parse.SkipRecipe("Set
PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> > > > >  }
> > > > >
> > > > > -SRCREV_machine ?=3D "0ac91942af8fec31671ffe62e9518aaf15f110b3"
> > > > > -SRCREV_meta ?=3D "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
> > > > > +SRCREV_machine ?=3D "423b5d5cb3f45a272285fa4157d1964086fabc2e"
> > > > > +SRCREV_meta ?=3D "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
> > > > >
> > > > >  SRC_URI =3D "git://
git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine
<http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=
=3Dmachine>
\
> > > > >             git://
git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dy=
octo-5.15;destsuffix=3D${KMETA}
<http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;br=
anch=3Dyocto-5.15;destsuffix=3D$%7BKMETA%7D>
"
> > > > >
> > > > > -LINUX_VERSION ?=3D "5.15.124"
> > > > > +LINUX_VERSION ?=3D "5.15.141"
> > > > >
> > > > >  LIC_FILES_CHKSUM =3D
"file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e46"
> > > > >
> > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > > > > index 9c06ddf200..7461087299 100644
> > > > > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > > > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > > > > @@ -5,7 +5,7 @@ KCONFIG_MODE =3D "--allnoconfig"
> > > > >
> > > > >  require recipes-kernel/linux/linux-yocto.inc
> > > > >
> > > > > -LINUX_VERSION ?=3D "5.15.124"
> > > > > +LINUX_VERSION ?=3D "5.15.141"
> > > > >  LIC_FILES_CHKSUM =3D
"file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e46"
> > > > >
> > > > >  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86',
'elfutils-native', '', d)}"
> > > > > @@ -14,8 +14,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
> > > > >  KMETA =3D "kernel-meta"
> > > > >  KCONF_BSP_AUDIT_LEVEL =3D "2"
> > > > >
> > > > > -SRCREV_machine ?=3D "cdb289c798fe1fc9f259a08c32e2dd9516ccb7a4"
> > > > > -SRCREV_meta ?=3D "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
> > > > > +SRCREV_machine ?=3D "ddf2eeeb31d1edaa5a80e9aabc8b2674ae95f865"
> > > > > +SRCREV_meta ?=3D "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
> > > > >
> > > > >  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> > > > >
> > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > > > > index 439479022b..c7b07dee62 100644
> > > > > --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > > > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > > > > @@ -14,24 +14,24 @@ KBRANCH:qemux86  ?=3D "v5.15/standard/base"
> > > > >  KBRANCH:qemux86-64 ?=3D "v5.15/standard/base"
> > > > >  KBRANCH:qemumips64 ?=3D "v5.15/standard/mti-malta64"
> > > > >
> > > > > -SRCREV_machine:qemuarm ?=3D
"676a22c65ec0f8bb5dc7e13d130f6e3764959d75"
> > > > > -SRCREV_machine:qemuarm64 ?=3D
"f0e7afd5948f71be062cd9194b56cd03de94b7cb"
> > > > > -SRCREV_machine:qemumips ?=3D
"0f1ceb9008f182cd7f21420bbec6f21a67da8397"
> > > > > -SRCREV_machine:qemuppc ?=3D
"4ec9fc13283ce01627ef8c32617a1eb71e127c62"
> > > > > -SRCREV_machine:qemuriscv64 ?=3D
"1c09be01f4b87f60ea64136459167d73502a118f"
> > > > > -SRCREV_machine:qemuriscv32 ?=3D
"1c09be01f4b87f60ea64136459167d73502a118f"
> > > > > -SRCREV_machine:qemux86 ?=3D
"1c09be01f4b87f60ea64136459167d73502a118f"
> > > > > -SRCREV_machine:qemux86-64 ?=3D
"1c09be01f4b87f60ea64136459167d73502a118f"
> > > > > -SRCREV_machine:qemumips64 ?=3D
"fad09cc6acf2175aa6b5979ef48cd5f05afc3da0"
> > > > > -SRCREV_machine ?=3D "1c09be01f4b87f60ea64136459167d73502a118f"
> > > > > -SRCREV_meta ?=3D "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
> > > > > +SRCREV_machine:qemuarm ?=3D
"0bd882ff2a47566033965928ab468491f7e1ffd6"
> > > > > +SRCREV_machine:qemuarm64 ?=3D
"d353330a9ba30300be32f1d732723ae3678da684"
> > > > > +SRCREV_machine:qemumips ?=3D
"7f8fbffda634dc22a70f69ff2b762a1f3ff9c842"
> > > > > +SRCREV_machine:qemuppc ?=3D
"fb2191ca96824c7451fbca4eef129660d25711af"
> > > > > +SRCREV_machine:qemuriscv64 ?=3D
"54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
> > > > > +SRCREV_machine:qemuriscv32 ?=3D
"54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
> > > > > +SRCREV_machine:qemux86 ?=3D
"54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
> > > > > +SRCREV_machine:qemux86-64 ?=3D
"54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
> > > > > +SRCREV_machine:qemumips64 ?=3D
"35895af6b529915f9c09a720592554feaca9a2c7"
> > > > > +SRCREV_machine ?=3D "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
> > > > > +SRCREV_meta ?=3D "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
> > > > >
> > > > >  # set your preferred provider of linux-yocto to
'linux-yocto-upstream', and you'll
> > > > >  # get the <version>/base branch, which is pure upstream -stable,
and the same
> > > > >  # meta SRCREV as the linux-yocto-standard builds. Select your
version using the
> > > > >  # normal PREFERRED_VERSION settings.
> > > > >  BBCLASSEXTEND =3D "devupstream:target"
> > > > > -SRCREV_machine:class-devupstream ?=3D
"38d4ca22a5288c4bae7e6d62a1728b0718d51866"
> > > > > +SRCREV_machine:class-devupstream ?=3D
"9b91d36ba301db86bbf9e783169f7f6abf2585d8"
> > > > >  PN:class-devupstream =3D "linux-yocto-upstream"
> > > > >  KBRANCH:class-devupstream =3D "v5.15/base"
> > > > >
> > > > > @@ -39,7 +39,7 @@ SRC_URI =3D "git://
git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D${KBRA
<http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7BKB=
RA>
> > > > >             git://
git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dy=
octo-5.15;destsuffix=3D${KMETA}
<http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;br=
anch=3Dyocto-5.15;destsuffix=3D$%7BKMETA%7D>
"
> > > > >
> > > > >  LIC_FILES_CHKSUM =3D
"file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7e46"
> > > > > -LINUX_VERSION ?=3D "5.15.124"
> > > > > +LINUX_VERSION ?=3D "5.15.141"
> > > > >
> > > > >  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86',
'elfutils-native', '', d)}"
> > > > >  DEPENDS +=3D "openssl-native util-linux-native"
> > > > > --
> > > > > 2.39.2
> > > > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196734):
https://lists.openembedded.org/g/openembedded-core/message/196734
> Mute This Topic: https://lists.openembedded.org/mt/102986495/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
steve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--00000000000053a4c80613016df3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br>
<br>
On Wed, Mar 6, 2024 at 6:04=E2=80=AFAM Steve Sakoman via <a href=3D"http://=
lists.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.com@lists.ope=
nembedded.org" target=3D"_blank" rel=3D"noreferrer">sakoman.com@lists.opene=
mbedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Mar 6, 2024 at 5:59=E2=80=AFAM Bruce Ashfield &lt;<a href=3D"m=
ailto:bruce.ashfield@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.=
ashfield@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Mar 6, 2024 at 10:43=E2=80=AFAM Steve Sakoman &lt;<a href=
=3D"mailto:steve@sakoman.com" target=3D"_blank" rel=3D"noreferrer">steve@sa=
koman.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM Steve Sakoman &lt;<a =
href=3D"mailto:steve@sakoman.com" target=3D"_blank" rel=3D"noreferrer">stev=
e@sakoman.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi Bruce,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The 5.10 version bumps look fine in testing, but sadly =
this 5.15<br>
&gt; &gt; &gt; &gt; version bump breaks qemux86-64-ptest:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; AssertionError: Failed ptests:<br>
&gt; &gt; &gt; &gt; {&#39;parted&#39;: [&#39;t1104-remove-and-add-partition=
.sh&#39;,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;t80=
00-loop.sh&#39;,<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;t80=
01-loop-blkpg.sh&#39;]}<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Failure is reproducible 100% of the time, so there is t=
hat ...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; After=C2=A0 wading through the hundreds of changes in this v=
ersion bump<br>
&gt; &gt; &gt; from 5.15.124 to 5.15.141 I found this in the 5.13.132 porti=
on that<br>
&gt; &gt; &gt; looks suspicious:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; 072cd213c64f block: don&#39;t add or resize partition on the=
 disk with<br>
&gt; &gt; &gt; GENHD_FL_NO_PART<br>
&gt; &gt; &gt; c6ce1c5dd327 block: rename GENHD_FL_NO_PART_SCAN to GENHD_FL=
_NO_PART<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; It could very well be that, I haven&#39;t been able to get to any=
 local<br>
&gt; &gt; testing on this<br>
&gt; &gt; yet.<br>
&gt; &gt;<br>
&gt; &gt; I will go look at parted for commits that indicate they are fixin=
g a<br>
&gt; &gt; kernel interface<br>
&gt; &gt; that sounds similar .. since we don&#39;t want to revert an offen=
ding commit, the<br>
&gt; &gt; way to fix this is via selective update of parted.<br>
&gt;<br>
&gt; I&#39;m doing a test kirkstone build that bumps parted to the same ver=
sion<br>
&gt; as in master.<br>
&gt;<br>
&gt; This will at least let us know whether it has been fixed in upstream p=
arted.<br>
<br>
The test completed and I get the same failure with the most recent parted v=
ersion.<br>
<br>
So apparently not fixed in parted.<br>
<br>
Steve<br>
&gt; &gt; &gt; &gt; On Mon, Dec 4, 2023 at 6:40=E2=80=AFPM &lt;<a href=3D"m=
ailto:bruce.ashfield@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.=
ashfield@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.a=
shfield@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmai=
l.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Updating=C2=A0 to the latest korg -stable release =
that comprises<br>
&gt; &gt; &gt; &gt; &gt; the following commits:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09b91d36ba301 Linux 5.15.141<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0313a34d1c0ee io_uring: fix off-=
by one bvec index<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A049ae2e4e8ed3 USB: dwc3: qcom: f=
ix wakeup after probe deferral<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb17fb4b160a USB: dwc3: qcom: f=
ix software node leak on probe errors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A098f0e9b6276f usb: dwc3: set the=
 dma max_seg_size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01a3dcb1d811d usb: dwc3: Fix def=
ault mode initialization<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a22702a81844 USB: dwc2: write H=
CINT with INTMASK applied<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01134fde92088 usb: typec: tcpm: =
Skip hard reset when in error recovery<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A064830d041515 USB: serial: optio=
n: don&#39;t claim interface 4 for ZTE MF290<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09611cbc6a132 USB: serial: optio=
n: fix FM101R-GL defines<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8d80b1fbacf USB: serial: optio=
n: add Fibocom L7xx modules<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de8c6fce8d09 usb: cdnsp: Fix de=
adlock issue during using NCM gadget<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dd0cc4b69f7d bcache: fixup lock=
 c-&gt;root error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a912742d8411 bcache: fixup init=
 dirty data errors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0137660f84462 bcache: prevent po=
tential division by zero error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f7077ce8d97b bcache: check retu=
rn value from btree_node_alloc_replacement()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01eed01092101 dm-delay: fix a ra=
ce between delay_presuspend and delay_bio<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d181a7a1d55d hv_netvsc: Mark VF=
 as slave before exposing it to user-mode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A097683466e24c hv_netvsc: Fix rac=
e of register_netdevice_notifier and VF register<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03841921018a2 USB: serial: optio=
n: add Luat Air72*U series products<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06062c527d040 s390/dasd: protect=
 device queue against concurrent access<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A035b5d86e43ec io_uring/fs: consi=
der link-&gt;flags when getting path for LINKAT<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02bb75a2c3490 bcache: fixup mult=
i-threaded bch_sectors_dirty_init() wake-up race<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06f09318fd90a md: fix bi_status =
reporting in md_end_clone_io<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072ecb9753cbe bcache: replace a =
mistaken IS_ERR() by IS_ERR_OR_NULL() in btree_gc_coalesce()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e09ba90f1ad0 swiotlb-xen: provi=
de the &quot;max_mapping_size&quot; method<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00f05021e937c ACPI: resource: Sk=
ip IRQ override on ASUS ExpertBook B1402CVA<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f95e9f7afe86 proc: sysctl: prev=
ent aliased sysctls from getting passed to init<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f3880fc011c ext4: make sure al=
locate pending entry not fail<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e33eb4997585 ext4: fix slab-use=
-after-free in ext4_es_insert_extent()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0859893f61906 ext4: using nofail=
 preallocation in ext4_es_insert_extent()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0048e7f38b31c ext4: using nofail=
 preallocation in ext4_es_insert_delayed_block()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0580b9dd6ab0b ext4: using nofail=
 preallocation in ext4_es_remove_extent()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066bc78a295b3 ext4: use pre-allo=
cated es in __es_remove_extent()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b1995ba6269c ext4: use pre-allo=
cated es in __es_insert_extent()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0edec12712ae1 ext4: factor out _=
_es_alloc_extent() and __es_free_extent()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e82d05cf5ccb ext4: add a new he=
lper to check if es must be kept<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0612edd488872 media: qcom: camss=
: Fix csid-gen2 for test pattern generator<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ceb5276d8c99 media: qcom: camss=
: Fix set CSI2_RX_CFG1_VC_MODE when VC is greater than 3<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f001e6f62693 media: camss: sm82=
50: Virtual channels for CSID<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09fb81ca7aa05 media: camss: Repl=
ace hard coded value with parameter<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08ef9b32f20ab MIPS: KVM: Fix a b=
uild warning about variable set but not used<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ddaca6b20f7 lockdep: Fix block=
 chain corruption<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A061747778a88b USB: dwc3: qcom: f=
ix ACPI platform device leak<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0027472889970 USB: dwc3: qcom: f=
ix resource leaks on probe deferral<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e26c6febac43 nvmet: nul-termina=
te the NQNs passed in the connect command<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b5d50c6a609d afs: Fix file lock=
ing on R/O volumes to operate in local mode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A084ebfbed3ae0 afs: Return ENOENT=
 if no cell DNS record can be found<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06aeac88a45de net: axienet: Fix =
check for partial TX checksum<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0293acba84108 amd-xgbe: propagat=
e the correct speed and duplex status<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3874cc25a70 amd-xgbe: handle t=
he corner-case during tx completion<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e949dbc28cd5 amd-xgbe: handle c=
orner-case during sfp hotplug<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A001a8b94726b1 octeontx2-pf: Fix =
ntuple rule creation to direct packet to VF with higher Rx queue than its P=
F<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fcc4a03ad3b1 arm/xen: fix xen_v=
cpu_info allocation alignment<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A090072af9efe8 net/smc: avoid dat=
a corruption caused by decline<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066c023469b3e net: usb: ax88179_=
178a: fix failed operations during ax88179_reset<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ba81c5228ef8 ipv4: Correct/sile=
nce an endian warning in __ip_do_redirect<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0364406d4c114 HID: fix HID devic=
e resource race between HID core and debugging support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A052badc06b119 HID: core: store t=
he unique system identifier in hid_device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0221be624a55d drm/rockchip: vop:=
 Fix color for RGB888/BGR888 format on VOP full<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0c835fd7d89 ata: pata_isapnp: =
Add missing error check for devm_ioport_map()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09754a498aa5b octeontx2-pf: Fix =
memory leak during interface down<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be41c0c4a632 wireguard: use DEV=
_STATS_INC()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f163a6d17a95 drm/panel: simple:=
 Fix Innolux G101ICE-L01 timings<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0608de3a587eb drm/panel: simple:=
 Fix Innolux G101ICE-L01 bus flags<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A018bd108a13cb drm/panel: auo,b10=
1uan08.3: Fine tune the panel power sequence<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09fe5718d3f09 drm/panel: boe-tv1=
01wum-nl6: Fine tune the panel power sequence<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8a49336e1de afs: Make error on=
 cell lookup failure consistent with OpenAFS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ac239fccf5a5 afs: Fix afs_serve=
r_list to be cleaned up with RCU<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a78d278e01b1 Linux 5.15.140<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0947c9e12ddd6 driver core: Relea=
se all resources during unbind before updating device links<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a434d5c3823 Input: xpad - add =
VID for Turtle Beach controllers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cbc7c29dff0f tracing: Have trac=
e_event_file have ref counters<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01dcf90c9fa01 powerpc/powernv: F=
ix fortify source warnings in opal-prd.c<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03d7912710e5e io_uring/fdinfo: l=
ock SQ thread while retrieving thread cpu/pid<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0595b051c83a1 drm/amd/display: C=
hange the DMCUB mailbox memory location from FB to inbox<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2a6e97c4b33 drm/amdgpu: fix er=
ror handling in amdgpu_bo_list_get()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e380992c479b drm/amdgpu: don&#3=
9;t use ATRM for external devices<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04ff985b8810c drm/i915: Fix pote=
ntial spectre vulnerability<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea0c4d5ec57f drm/amd/pm: Handle=
 non-terminated overdrive commands.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09ce842d7762a ext4: add missed b=
relse in update_backups<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ce19c20064b6 ext4: remove gdb b=
ackup copy for meta bg in setup_new_flex_group_blocks<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ac45d8e34bed ext4: correct the =
start block of counting reserved clusters<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f9842c4b925 ext4: correct retu=
rn value of ext4_convert_meta_bg<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08798d3b2722d ext4: correct offs=
et of gdb backup in non meta_bg group to update_backups<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08a3bb38bfdaf ext4: apply umask =
if ACL support is disabled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d5c380149b96 Revert &quot;net: =
r8169: Disable multicast filter for RTL8168H and RTL8107E&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ad3d8594d5e media: qcom: camss=
: Fix missing vfe_lite clocks check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0376cf06950 media: qcom: camss=
: Fix VFE-17x vfe_disable_output()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f733387d17f media: qcom: camss=
: Fix vfe_get() error jump<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0841fc648fbb5 media: qcom: camss=
: Fix pm_domain_on sequence in probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04c9c43f79a12 mmc: sdhci-pci-gli=
: GL9750: Mask the replay timer timeout of AER<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072bf271c5a77 r8169: fix network=
 lost after resume on DASH systems<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0468e3ebf4786 mm: kmem: drop __G=
FP_NOFAIL when allocating objcg vectors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00387978fda07 mmc: sdhci-pci-gli=
: A workaround to allow GL9750 to enter ASPM L1.2<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0070b3ccb9b8b riscv: kprobes: al=
low writing to x0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd0e9f475a46 nfsd: fix file mem=
leak on client_opens_release<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0114c9d732cf9 media: ccs: Correc=
tly initialise try compose rectangle<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c8aeeb2c549 media: venus: hfi:=
 add checks to handle capabilities from firmware<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cdeb0a4cf327 media: venus: hfi:=
 fix the check to handle session buffer requirement<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d62570f75fe media: venus: hfi_=
parser: Add check to keep the number of codecs within range<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d0d831e7d68d media: sharp: fix =
sharp encoding<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06003733c8f95 media: lirc: drop =
trailing space from scancode transmit<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e4088d7d8f11 f2fs: avoid format=
-overflow warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A012055238d046 i2c: i801: fix pot=
ential race in i801_block_transaction_byte_by_byte<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0336e6db5c120 net: phylink: init=
ialize carrier state at creation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d8cb287d31cb net: dsa: lan9303:=
 consequently nested-lock physical MDIO<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0656262cb0f95 net: ethtool: Fix =
documentation of ethtool_sprintf()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0acca20cc16f3 s390/ap: fix AP bu=
s crash on early config change callback invocation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0019b7d42a416 i2c: designware: D=
isable TX_EMPTY irq while waiting for block length byte<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c6e89348fd58 sbsa_gwdt: Calcula=
te timeout with 64-bit math<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0132670ae9ffb lsm: fix default r=
eturn value for inode_getsecctx<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0223196b50605 lsm: fix default r=
eturn value for vm_enough_memory<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A006d320ca170b Revert &quot;i2c: =
pxa: move to generic GPIO recovery&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ddec3d04f874 Revert ncsi: Propa=
gate carrier gain/loss events to the NCSI controller<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ad0b74d0f331 powerpc/pseries/dd=
w: simplify enable_ddw()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3e993de400e arm64: dts: qcom: =
ipq6018: Fix tcsr_mutex register size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b99ac20612ca arm64: dts: qcom: =
ipq6018: switch TCSR mutex to MMIO<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aaf0a07d6088 ksmbd: fix slab ou=
t of bounds write in smb_inherit_dacl()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c701423bb03 Bluetooth: btusb: =
Add 0bda:b85b for Fn-Link RTL8852BE<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A036a573b32550 Bluetooth: btusb: =
Add RTW8852BE device 13d3:3570 to device tables<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4976160a0a4 bluetooth: Add dev=
ice 13d3:3571 to device tables<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0603e77e9e8c0 bluetooth: Add dev=
ice 0bda:887b to device tables<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9bb966c50a7 Bluetooth: btusb: =
Add Realtek RTL8852BE support ID 0x0cb8:0xc559<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cf642ee641ce cpufreq: stats: Fi=
x buffer overflow detection in trans_stats()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A063e09cdfe948 regmap: Ensure ran=
ge selector registers are updated after cache sync<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c49e74e95bf tty: serial: meson=
: fix hard LOCKUP on crtscts mode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06f26b6a61b08 serial: meson: Use=
 platform_get_irq() to get the interrupt<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0450fa8bf803f ALSA: hda/realtek =
- Enable internal speaker of ASUS K6500ZC<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc549ba50bb8 ALSA: hda/realtek =
- Add Dell ALC295 to pin fall back table<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0767c988771cb ALSA: info: Fix po=
tential deadlock at disconnection<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A009022ae66261 xhci: Enable RPM o=
n controllers that support low-power states<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A068574fe2e488 parisc/pgtable: Do=
 not drop upper 5 address bits of physical address<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea7593c18ff7 parisc: Prevent bo=
oting 64-bit kernels on PA1.x machines<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02c9092e8b29a i3c: master: svc: =
fix SDA keep low when polling IBIWON timeout happen<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0da754f92fc02 i3c: master: svc: =
fix check wrong status register in irq handler<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ba77b6b45d6 i3c: master: svc: =
fix ibi may not return mandatory data byte<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0a70ed4a580 i3c: master: svc: =
fix wrong data return when IBI happen during start frame<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07383675aba2f i3c: master: svc: =
fix race condition in ibi work thread<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc7efd1054f4 i3c: master: cdns:=
 Fix reading status register<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3c6a08c2b77 mtd: cfi_cmdset_00=
01: Byte swap OTP info<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a4668088128d mm/memory_hotplug:=
 use pfn math in place of direct struct page manipulation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0792a796085cf mm/cma: use nth_pa=
ge() in place of direct struct page manipulation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09b59fc31226e s390/cmma: fix det=
ection of DAT pages<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A045bb94aab891 dmaengine: stm32-m=
dma: correct desc prep when channel running<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A091659b77e937 mcb: fix error han=
dling for different scenarios when parsing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0534790fde890 tracing: Have the =
user copy of synthetic event address use correct context<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6237afabc34 i2c: core: Run ato=
mic i2c xfer when !preemptible<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0931aa7154bc4 kernel/reboot: eme=
rgency_restart: Set correct system_state<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07a3424c3b76a quota: explicitly =
forbid quota files from being encrypted<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A047f509832168 jbd2: fix potentia=
l data lost in recovering journal raced with synchronizing fs bdev<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f13e1ea45699 ASoC: codecs: wsa-=
macro: fix uninitialized stack variables with name prefix<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028436d8092ad selftests/resctrl:=
 Reduce failures due to outliers in MBA/MBM tests<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ce63598a1fb selftests/resctrl:=
 Remove duplicate feature check from CMT test<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e90efe17fc07 netfilter: nf_tabl=
es: split async and sync catchall in two functions<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d9506c766c9 netfilter: nf_tabl=
es: remove catchall element in GC sync path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A096fc7a50a278 PCI: keystone: Don=
&#39;t discard .probe() callback<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0d394df9812 PCI: keystone: Don=
&#39;t discard .remove() callback<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f4f12667167c KEYS: trusted: Rol=
lback init_trusted() consistently<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c407ff72fb3a genirq/generic_chi=
p: Make irq_remove_generic_chip() irqdomain aware<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc8a14e3c630 mmc: meson-gx: Rem=
ove setting of CMD_CFG_ERROR<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a51e6b4da71 wifi: ath11k: fix =
htt pktlog locking<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0426e718ce9ba wifi: ath11k: fix =
dfs radar event locking<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9d84413b1b7 wifi: ath11k: fix =
temperature event locking<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ff849948c11 ima: detect change=
s to the backing overlay file<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04584a421a6d9 ima: annotate iint=
 mutex to avoid lockdep false positive warnings<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04049576c639f ACPI: FPDT: proper=
ly handle invalid FPDT subtables<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0628e76e684c8 firmware: qcom_scm=
: use 64-bit calling convention only when client is 64-bit<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06eb8c191e360 btrfs: don&#39;t a=
rbitrarily slow down delalloc if we&#39;re committing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b99626b28ca rcu: kmemleak: Ign=
ore kmemleak false positives when RCU-freeing objects<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A071f5344f477c PM: hibernate: Cle=
an up sync_read handling in snapshot_write_next()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A057dbc0eb8abe PM: hibernate: Use=
 __get_safe_page() rather than touching the list<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A087a30633b5d3 arm64: dts: qcom: =
ipq6018: Fix hwlock index for SMEM<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ebaee06a7292 rcu/tree: Defer se=
tting of jiffies during stall reset<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0057d1034d012 svcrdma: Drop conn=
ection after an RDMA Read error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0541b3757fd44 wifi: wilc1000: us=
e vmm_table as array in wilc struct<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b156f62f19da PCI: exynos: Don&#=
39;t discard .remove() callback<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f88796721002 PCI/ASPM: Fix L1 s=
ubstate handling in aspm_attr_store_common()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0467864d55b52 mmc: sdhci_am654: =
fix start loop index for TAP value parsing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef34a97bb9cb mmc: vub300: fix a=
n error code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A036adb6204cff clk: qcom: ipq6018=
: drop the CLK_SET_RATE_PARENT flag from PLL clocks<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0090b167b2c41 clk: qcom: ipq8074=
: drop the CLK_SET_RATE_PARENT flag from PLL clocks<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A018640a1818f1 clk: socfpga: Fix =
undefined behavior bug in struct stratix10_clock_data<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04d17b54c9be3 parisc/pdc: Add wi=
dth field to struct pdc_model<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0936c9c10efae arm64: Restrict CP=
U_BIG_ENDIAN to GNU as or LLVM IAS 15.x or newer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08b24bb54bf3a ACPI: resource: Do=
 IRQ override on TongFang GMxXGxx<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05619c34d3c4c watchdog: move sof=
tlockup_panic back to early_param<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a6c3a1fe09a2 PCI/sysfs: Protect=
 driver&#39;s D3cold preference from user space<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A001975bee0a14 hvc/xen: fix event=
 channel handling for secondary consoles<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cfd543c10871 hvc/xen: fix error=
 path in xen_hvc_init() to always register frontend driver<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0730e08cb9101 hvc/xen: fix conso=
le unplug<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fa0b93a3de40 tty/sysrq: replace=
 smp_processor_id() with get_cpu()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092e6c0f00d38 audit: don&#39;t W=
ARN_ON_ONCE(!current-&gt;mm) in audit_exe_compare()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e29c095f1ad4 audit: don&#39;t t=
ake task_lock() in audit_exe_compare() code path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05eb6519f483e KVM: x86: Ignore M=
SR_AMD64_TW_CFG access<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c49ef7041f2 KVM: x86: hyper-v:=
 Don&#39;t auto-enable stimer on write from user-space<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fe6b461c37cb x86/cpu/hygon: Fix=
 the CPU topology evaluation for real<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a2adf48d8b1 crypto: x86/sha - =
load modules based on CPU features<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be079aa71a12 scsi: qla2xxx: Fix=
 system crash due to bad pointer access<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ba3569f78d3 scsi: megaraid_sas=
: Increase register read retry rount from 3 to 30 for selected registers<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06a33b5810031 scsi: mpt3sas: Fix=
 loop logic<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03c5aede46cdc bpf: Fix precision=
 tracking for BPF_ALU | BPF_TO_BE | BPF_END<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0403470431b15 bpf: Fix check_sta=
ck_write_fixed_off() to correctly spill imm<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ba115f6c3a8c randstruct: Fix gc=
c-plugin performance mode to stay in group<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02771fac4382b powerpc/perf: Fix =
disabling BHRB and instruction sampling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07e450cc9ad54 media: venus: hfi:=
 add checks to perform sanity on queue pointers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01566e8be73fd i915/perf: Fix NUL=
L deref bugs with drm_dbg() calls<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A035c17257ef09 xfs: Fix unreferen=
ced object reported by kmemleak in xfs_sysfs_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05db146322b17 xfs: fix memory le=
ak in xfs_errortag_init<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c540284d8488 xfs: fix exception=
 caused by unexpected illegal bestcount in leaf dir<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05212d586e76f xfs: avoid a UAF w=
hen log intent item recovery fails<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ba179cc12109 xfs: fix inode res=
ervation space for removing transaction<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b7847653a2d6 xfs: Fix false ENO=
SPC when performing direct write on a delalloc extent in cow fork<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092d38b87e886 xfs: add missing c=
map-&gt;br_state =3D XFS_EXT_NORM update<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d0baec78e8a xfs: fix intermitt=
ent hang during quotacheck<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076545c0e881b xfs: don&#39;t lea=
k memory when attr fork loading fails<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb888caf27d9 xfs: fix use-after=
-free in xattr node block inactivation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04cb3842967e6 xfs: flush inode g=
c workqueue before clearing agi bucket<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0188594c64a1e xfs: prevent a UAF=
 when log IO errors race with unmount<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0921c96215850 xfs: use invalidat=
e_lock to check the state of mmap_lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0efd194800b69 xfs: convert buf_c=
ancel_table allocation to kmalloc_array<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0074fee186931 xfs: don&#39;t lea=
k xfs_buf_cancel structures when recovery fails<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b8effd31a862 xfs: refactor buff=
er cancellation table allocation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04968c2aa6a1f cifs: fix check of=
 rc in function generate_smb3signingkey<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d725bf0d16d cifs: spnego: add =
&#39;;&#39; in HOST_KEY_LEN<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A021accf149161 tools/power/turbos=
tat: Enable the C-state Pre-wake printing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00045c1ff7ac0 tools/power/turbos=
tat: Fix a knl bug<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05bcce23f387b macvlan: Don&#39;t=
 propagate promisc change to lower dev in passthru<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07574b5e65e92 net/mlx5e: Check r=
eturn value of snprintf writing to fw_version buffer for representors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A055553c5b53ae net/mlx5e: Reduce =
the size of icosq_str<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051655fd35703 net/mlx5e: Fix ped=
it endianness<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a990dd7410ec net/mlx5e: Refacto=
r mod header management API<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A039f95b1d0d8f net/mlx5e: Move mo=
d hdr allocation to a single place<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0f37a3715cb net/mlx5e: Remove =
incorrect addition of action fwd flag<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06974fd92d5f1 net/mlx5e: fix dou=
ble free of encap_header in update funcs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f3c4a7044201 net/mlx5e: fix dou=
ble free of encap_header<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0931e9e8e30bf net: stmmac: fix r=
x budget limit check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b8b514b2a6cd netfilter: nf_tabl=
es: fix pointer math issue in nft_byteorder_eval()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A025da0f582119 netfilter: nf_tabl=
es: add and use BE register load-store helpers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a48f6be5bdb7 netfilter: nf_tabl=
es: use the correct get/put helpers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d3901bf3baa netfilter: nf_conn=
track_bridge: initialize err to 0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A075bcfc188abf af_unix: fix use-a=
fter-free in unix_stream_read_actor()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b480c654ef2 net: ethernet: cor=
tina: Fix MTU max setting<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0097588e20c6b net: ethernet: cor=
tina: Handle large frames<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9269b274cdf net: ethernet: cor=
tina: Fix max RX frame define<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A053064e8239dd bonding: stop the =
device in bond_setup_by_slave()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cda210a4bdf7 ptp: annotate data=
-race around q-&gt;head and q-&gt;tail<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b67d16b2373b xen/events: fix de=
layed eoi list handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08531a4194e59 ppp: limit MRU to =
64K<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09ae82308d184 tipc: Fix kernel-i=
nfoleak due to uninitialized TLV value<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0359c65daf6b5 net: hns3: fix VF =
wrong speed and duplex issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0406be003d698 net: hns3: fix VF =
reset fail issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cfc131b078a3 net: hns3: fix var=
iable may not initialized problem in hns3_init_mac_addr()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0070581829c1a net: hns3: fix inc=
orrect capability bit display for copper port<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a3c65cf7854d net: hns3: add bar=
rier in vf mailbox reply process<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e671d8203758 net: hns3: add byt=
e order conversion for PF to VF mailbox message<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb0f14257c04 net: hns3: refine =
the definition for struct hclge_pf_to_vf_msg<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01d8f66d4060a net: hns3: fix add=
 VLAN fail issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04b3b2541d40e tty: Fix uninit-va=
lue access in ppp_sync_receive()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f64cad3ac38 ipvlan: add ipvlan=
_route_v6_outbound() helper<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c71b9b177c6 net: set SOCK_RCU_=
FREE before inserting socket into hashtable<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0427165421c25 net: inet: Retire =
port only listening_hash<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be1ceb8b7c58 net: inet: Open co=
de inet_hash2 and inet_unhash2<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb9bcf47fba7 net: inet: Remove =
count from inet_listen_hashbucket<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de634368e079 mptcp: listen diag=
 dump support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0870f438aca56 mptcp: diag: switc=
h to context structure<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be020f658c63 gfs2: Silence &quo=
t;suspicious RCU usage in gfs2_permission&quot; warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0194454afa6aa SUNRPC: Fix RPC cl=
ient cleaned up the freed pipefs dentries<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0319ed0cba164 NFSv4.1: fix SP4_M=
ACH_CRED protection for pnfs IO<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0809684f5b388 SUNRPC: Add an IS_=
ERR() check back to where it was<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A046d6b768072b SUNRPC: ECONNRESET=
 might require a rebind<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7032d4d6499 media: cec: meson:=
 always include meson sub-directory in Makefile<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A016e78f28517d media: cadence: cs=
i2rx: Unregister v4l2 async notifier<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020c2ca9abb78 sched/core: Optimi=
ze in_task() and in_interrupt() a bit<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09894c58c1777 tracing/perf: Add =
interrupt_context_level() helper<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A048fef664d7e9 tracing: Reuse log=
ic from perf&#39;s get_recursion_context()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0670b3e902f62 wifi: iwlwifi: Use=
 FW rate for non-data frames<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7ee519e8095 pwm: Fix double sh=
ift bug<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07054366cd076 drm/amdgpu: fix so=
ftware pci_unplug on some chips<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e48a5e78d077 drm/qxl: prevent m=
emory leak<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00835e7f296ca ASoC: ti: omap-mcb=
sp: Fix runtime PM underflow warnings<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A038ada2f304f6 i2c: dev: copy use=
rspace array safely<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0610244988f32 kgdb: Flush consol=
e before entering kgdb on panic<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04e497f1acd99 drm/amd/display: A=
void NULL dereference of timing generator<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05e0b788fb96b media: imon: fix a=
ccess to invalid resource for the second interface<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ae6bcafe1f6b media: ccs: Fix dr=
iver quirk struct documentation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d01b0ad79ecd media: cobalt: Use=
 FIELD_GET() to extract Link Width<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A003ce0655bf8e gfs2: fix an oops =
in gfs2_permission<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05bfda356e903 gfs2: ignore negat=
ed quota changes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A016631907d013 media: vivid: avoi=
d integer overflow<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A009cd8b561aa9 media: gspca: cpia=
1: shift-out-of-bounds in set_flicker<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A039c71357e68e i3c: master: mipi-=
i3c-hci: Fix a kernel panic for accessing DAT_data.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072775cad7f57 virtio-blk: fix im=
plicit overflow on virtio_max_dma_size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f7f3bdb225e3 i2c: sun6i-p2wi: P=
revent potential division by zero<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d23ad76f240c i3c: mipi-i3c-hci:=
 Fix out of bounds access in hci_dma_irq_handler<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e6fbad3cc880 9p: v9fs_listxattr=
: fix %s null argument warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a18be976be41 9p/trans_fd: Annot=
ate data-racy writes to file::f_flags<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02cc5e191d671 usb: gadget: f_ncm=
: Always set current gadget in ncm_bind()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c80f48912b5 tty: vcc: Add chec=
k for kstrdup() in vcc_probe()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02ff61106d6b4 exfat: support han=
dle zero-size directory<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c86a3007a685 HID: Add quirk for=
 Dell Pro Wireless Keyboard and Mouse KM5221W<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03453f945af89 PCI: Use FIELD_GET=
() in Sapphire RX 5600 XT Pulse quirk<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a93a0f99a09 misc: pci_endpoint=
_test: Add Device ID for R-Car S4-8 PCIe controller<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A003dbd6a9ea4e PCI: Disable ATS f=
or specific Intel IPU E2000 devices<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9a0b3444845 PCI: Extract ATS d=
isabling to a helper function<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fe511d24418a PCI: Use FIELD_GET=
() to extract Link Width<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056d78b5495eb scsi: libfc: Fix p=
otential NULL pointer dereference in fc_lport_ptp_setup()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A037a51e7f36b7 atm: iphase: Do PC=
I error checks on own line<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f05ae00106aa PCI: tegra194: Use=
 FIELD_GET()/FIELD_PREP() with Link Width fields<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0631a96e9eb42 ALSA: hda: Fix pos=
sible null-ptr-deref when assigning a stream<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c805b9cd2e3 ARM: 9320/1: fix s=
tack depot IRQ stack filter<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d25ec69f8f1 HID: lenovo: Detec=
t quirk-free fw on cptkbd and stop applying workaround<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A064f062baf202 jfs: fix array-ind=
ex-out-of-bounds in diAlloc<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0da3da5e1e6f7 jfs: fix array-ind=
ex-out-of-bounds in dbFindLeaf<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f74d336990f fs/jfs: Add validi=
ty check for db_maxag and db_agpref<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05f148b16972e fs/jfs: Add check =
for negative db_l2nbperpage<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1d1f79b1929 scsi: ibmvfc: Remo=
ve BUG_ON in the case of an empty event pool<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0bfc8a5561f scsi: hisi_sas: Se=
t debugfs_dir pointer to NULL after removing debugfs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05904dee70771 RDMA/hfi1: Use FIE=
LD_GET() to extract Link Width<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0546c1796ad1e crypto: pcrypt - F=
ix hungtask for PADATA_RESET<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc443a199f8c ASoC: soc-card: Ad=
d storage for PCI SSID<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09f2082067c5f selftests/efivarfs=
: create-read: fix a resource leak<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0428cad17f53b arm64: dts: ls208x=
a: use a pseudo-bus to constrain usb dma size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0174f62a0aa15 drm/amdgpu: Fix a =
null pointer access when the smc_rreg pointer is NULL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f7a400d5e80 drm/amdkfd: Fix sh=
ift out-of-bounds issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0300589d551d4 drm/panel: st7703:=
 Pick different reset sequence<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eaa03ea366c8 drm/amdgpu/vkms: f=
ix a possible null pointer dereference<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A084c923d89890 drm/panel/panel-tp=
o-tpg110: fix a possible null pointer dereference<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02381f6b628b3 drm/panel: fix a p=
ossible null pointer dereference<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c11cf5e117f5 drm/amdgpu: Fix po=
tential null pointer derefernce<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a237675aa1e6 drm/amd: Fix UBSAN=
 array-index-out-of-bounds for Polaris and Tonga<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0acdb6830de02 drm/amd: Fix UBSAN=
 array-index-out-of-bounds for SMU7<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0829ce8e995a8 drm/msm/dp: skip v=
alidity check for DP CTS EDID checksum<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0689b33b94f09 drm: vmwgfx_surfac=
e.c: copy user-array safely<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A022260dabcfe3 kernel: watch_queu=
e: copy user-array safely<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4f2c09d4672 kernel: kexec: cop=
y user-array safely<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024b17d530c42 string.h: add arra=
y-wrappers for (v)memdup_user()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a3a6dc9a330 drm/amd/display: u=
se full update for clip size increase of large plane source<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d43cdd22cd8 drm/amdkfd: Fix a =
race condition of vram buffer unref in svm code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eea81424c5b8 drm/komeda: drop a=
ll currently held locks if deadlock happens<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0812886866be6 platform/x86: thin=
kpad_acpi: Add battery quirk for Thinkpad X120e<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ba7088769800 Bluetooth: Fix dou=
ble free in hci_conn_cleanup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9de14bde56d Bluetooth: btusb: =
Add date-&gt;evt_skb is NULL check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a43cf6acf017 wifi: ath10k: Don&=
#39;t touch the CE interrupt registers after power up<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06f42bd243327 net: annotate data=
-races around sk-&gt;sk_dst_pending_confirm<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A019ab5fd26441 net: annotate data=
-races around sk-&gt;sk_tx_queue_mapping<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f3be63f7a8ee wifi: ath10k: fix =
clang-specific fortify warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A002a0547b8da0 wifi: ath9k: fix c=
lang-specific fortify warnings<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cf353904a828 bpf: Detect IP =3D=
=3D ksym.end as part of BPF program<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c29a89b23f67 atl1c: Work around=
 the DMA RX overflow issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A021a0f310a9f3 wifi: mac80211: do=
n&#39;t return unset power in ieee80211_get_tx_power()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03073e38086d0 wifi: mac80211_hws=
im: fix clang-specific fortify warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e8e55fa44435 x86/mm: Drop the 4=
 MB restriction on minimal NUMA node memory size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9d3ba62e87b workqueue: Provide=
 one lock class key per work_on_cpu() callsite<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a5b512d526c clocksource/driver=
s/timer-atmel-tcb: Fix initialization on SAM9 hardware<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0465b88c0873b clocksource/driver=
s/timer-imx-gpt: Fix potential memory leak<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd0df3f87192 perf/core: Bail ou=
t early if the request AUX area is out of bound<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e89d0ed45a41 locking/ww_mutex/t=
est: Fix potential workqueue corruption<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02a910f4af54d Linux 5.15.139<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03443337acd37 btrfs: use u64 for=
 buffer sizes in the tree search ioctls<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9f5e8cecba9 Revert &quot;mmc: =
core: Capture correct oemid-bits for eMMC cards&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0824829c2c6b4 tracing/kprobes: F=
ix the order of argument descriptions<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0560680f745fc fbdev: fsl-diu-fb:=
 mark wr_reg_wa() static<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08e4b510fe917 fbdev: imsttfb: fi=
x a resource leak in probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03648582181b6 fbdev: imsttfb: Fi=
x error path of imsttfb_probe()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030959f9f4540 spi: spi-zynq-qspi=
: add spi-mem to driver kconfig dependencies<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09cf044cc36c1 ASoC: hdmi-codec: =
register hpd callback on component probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0705e5a28ec1d drm/syncobj: fix D=
RM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00ca05fae2790 netfilter: nat: fi=
x ipv6 nat redirect with mapped and scoped addresses<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01652f57f02eb netfilter: nft_red=
ir: use `struct nf_nat_range2` throughout and deduplicate eval call-backs<b=
r>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d28c17abe098 netfilter: xt_rece=
nt: fix (increase) ipv6 literal buffer length<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f30567fcbc4d i2c: iproc: handle=
 invalid slave state<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A038f5ac54b917 r8169: respect use=
rspace disabling IFF_MULTICAST<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd01115b033c blk-core: use pr_w=
arn_ratelimited() in bio_check_ro()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b80148710983 block: remove unne=
eded return value of bio_check_ro()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d8d94d6b3bd3 tg3: power down de=
vice only on SYSTEM_POWER_OFF<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ea06a23f8f4 net/smc: put sk re=
ference if close work was canceled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0884606f8283c net/smc: allow cdc=
 msg send rather than drop it with NULL sndbuf_desc<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a62af7146daa net/smc: fix dangl=
ing sock under state SMC_APPFINCLOSEWAIT<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0866606826f16 selftests: pmtu.sh=
: fix result checking<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02d117ac1b8f8 net: stmmac: xgmac=
: Enable support for multiple Flexible PPS outputs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A095a99ac112c5 Fix termination st=
ate for idr_for_each_entry_ul()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070ef755f126b net: r8169: Disabl=
e multicast filter for RTL8168H and RTL8107E<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00dad0e75d62b dccp/tcp: Call sec=
urity_inet_conn_request() after setting IPv6 addresses.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c340713bdf32 dccp: Call securit=
y_inet_conn_request() after setting IPv4 addresses.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d1b7e6562a4c octeontx2-pf: Fix =
holes in error code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f60297ef59d4 octeontx2-pf: Fix =
error codes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0794d360b1d65 inet: shrink struc=
t flowi_common<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08943083bbb64 bpf: Check map-&gt=
;usercnt after timer-&gt;timer is assigned<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03907b89cd17f tipc: Change nla_p=
olicy for bearer-related names to NLA_NUL_STRING<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a1a485e45d24 hsr: Prevent use a=
fter free in prp_create_tagged_frame()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0352887b3edd0 llc: verify mac le=
n before reading mac header<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0303766bb92c5 Input: synaptics-r=
mi4 - fix use after free in rmi_unregister_function()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0741e4c15d7c0 pwm: brcmstb: Util=
ize appropriate clock APIs in suspend/resume<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0895ac9a21f69 pwm: sti: Reduce n=
umber of allocations and drop usage of chip_data<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db64ddddeeec regmap: prevent no=
inc writes from clobbering cache<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0004d4002534e media: dvb-usb-v2:=
 af9035: fix missing unlock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a0beda184756 media: cedrus: Fix=
 clock/reset sequence<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0980be4c3b0d5 media: vidtv: mux:=
 Add check and kfree for kstrdup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d17269fb9161 media: vidtv: psi:=
 Add check for kstrdup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db89f551b706 media: s3c-camif: =
Avoid inappropriate kfree()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051c94256a83f media: bttv: fix u=
se after free error due to btv-&gt;timeout timer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3937f9e25d9 media: i2c: max928=
6: Fix some redundant of_node_put() calls<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09d060f2fc40c pcmcia: ds: fix po=
ssible name leak in error path in pcmcia_device_add()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024e9df588e2e pcmcia: ds: fix re=
fcount leak in pcmcia_device_add()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024e73ab542c7 pcmcia: cs: fix po=
ssible hung task and memory leak pccardd()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3eaa0d43c74 rtc: pcf85363: fix=
 wrong mask/val parameters in regmap_update_bits call<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020bd0198bebd cxl/mem: Fix shutd=
own order<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d48fe8d98171 i3c: Fix potential=
 refcount leak in i3c_master_register_new_i3c_devs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0855d6fb2cc7b 9p/net: fix possib=
le memory leak in p9_check_errors()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d456ebaad30 perf hist: Add mis=
sing puts to hist__account_cycles<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0924e8d0b7645 perf machine: Avoi=
d out of bounds LBR memory read<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076b0eab987c4 usb: host: xhci-pl=
at: fix possible kernel oops while resuming<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c9c4dab06a5a xhci: Loosen RPM a=
s default policy to cover for AMD xHC 1.1<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092c9ef156431 powerpc/pseries: f=
ix potential memory leak in init_cpu_associativity()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0516235e7b35f powerpc/imc-pmu: U=
se the correct spinlock initializer.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0945dc61d7840 powerpc/xive: Fix =
endian conversion size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bce31a2bcb1e powerpc/40x: Remov=
e stale PTE_ATOMIC_UPDATES macro<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01308e55eb09c modpost: fix tee M=
ODULE_DEVICE_TABLE built on big-endian host<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0863a9c3fdec2 powerpc: Only defi=
ne __parse_fpscr() when required<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A001f62c6bd2db f2fs: fix to initi=
alize map.m_pblk in f2fs_precache_extents()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dfebea7114e0 dmaengine: pxa_dma=
: Remove an erroneous BUG_ON() in pxad_free_desc()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072f8fa6c4b78 USB: usbip: fix st=
ub_dev hub disconnect<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0168697f15a53 tools: iio: iio_ge=
neric_buffer ensure alignment<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a61c3c647ffd misc: st_core: Do =
not call kfree_skb() under spin_lock_irqsave()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0732aa0cb2601 dmaengine: ti: edm=
a: handle irq_of_parse_and_map() errors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02941a29fe9d6 usb: chipidea: Sim=
plify Tegra DMA alignment code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058e8316b200b usb: chipidea: Fix=
 DMA overwrite for Tegra<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fcaafb574fc8 usb: dwc2: fix pos=
sible NULL pointer dereference caused by driver concurrency<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c956be5641cc dmaengine: idxd: R=
egister dsa_bus_type before registering idxd sub-drivers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca46d7ce1fbe livepatch: Fix mis=
sing newline character in klp_resolve_symbols()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b77f7c025e85 tty: tty_jobctrl: =
fix pid memleak in disassociate_ctty()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9f598a5cc9a f2fs: compress: fi=
x to avoid redundant compress extension<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08c4504cc0c64 f2fs: compress: fi=
x to avoid use-after-free on dic<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca0aae3837a6 leds: trigger: led=
trig-cpu:: Fix &#39;output may be truncated&#39; issue for &#39;cpu&#39;<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0206a972511a8 leds: pwm: Don&#39=
;t disable the PWM when the LED should be off<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0893eedf596dd leds: turris-omnia=
: Do not use SMBUS calls<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aec3706971b3 leds: turris-omnia=
: Drop unnecessary mutex locking<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c9a4f13c58f1 mfd: arizona-spi: =
Set pdata.hpdet_channel for ACPI enumerated devs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A063a99d7b57b4 mfd: dln2: Fix dou=
ble put in dln2_probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02742c860e0b7 mfd: core: Ensure =
disabled devices are skipped without aborting<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A094eb5423d75e mfd: core: Un-cons=
tify mfd_cell.of_reg<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08890d4d5f25e ASoC: ams-delta.c:=
 use component after check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2ae48bd82ee crypto: qat - fix =
deadlock in backlog processing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00dd34a7ad395 padata: Fix refcnt=
 handling in padata_free_shell()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A093e4aa8545ab ASoC: Intel: Skyla=
ke: Fix mem leak when parsing UUIDs fails<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd1c2df64d6b HID: logitech-hidp=
p: Move get_wireless_feature_index() check to hidpp_connect_event()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A099893b7c4592 HID: logitech-hidp=
p: Revert &quot;Don&#39;t restart communication if not necessary&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05f2f38602583 HID: logitech-hidp=
p: Don&#39;t restart IO, instead defer hid_connect() only<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f80041c5867 HID: logitech-hidp=
p: Remove HIDPP_QUIRK_NO_HIDINPUT quirk<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3b196a1da3e Revert &quot;HID: =
logitech-hidpp: add a module parameter to keep firmware gestures&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06885e5ffa09d sh: bios: Revive e=
arlyprintk support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0c25e957f9b hid: cp2112: Fix I=
RQ shutdown stopping polling for all IRQs on chip<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d06dc0f99f72 RDMA/hfi1: Workaro=
und truncation compilation error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0086cd44204bb scsi: ufs: core: L=
eave space for &#39;\0&#39; in utf8 desc string<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a0f1999090b3 ASoC: fsl: Fix PM =
disable depth imbalance in fsl_easrc_probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0904fc0103776 RDMA/hns: The UD m=
ode can only be configured with DCQCN<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09f8db02d30ad RDMA/hns: Fix sign=
ed-unsigned mixed comparisons<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02de683e27e1d RDMA/hns: Fix unin=
itialized ucmd in hns_roce_create_qp_common()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0611260e36f16 IB/mlx5: Fix rdma =
counter binding for RAW QP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0922b2693b9af ASoC: fsl: mpc5200=
_dma.c: Fix warning of Function parameter or member not described<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0001f90cd9d2f ext4: move &#39;ix=
&#39; sanity check to corrent position<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c24a3c9e373e ARM: 9321/1: memse=
t: cast the constant byte to unsigned char<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0012d0c66f939 hid: cp2112: Fix d=
uplicate workqueue initialization<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01ce09238e8e8 crypto: qat - incr=
ease size of buffers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A062df66b726f9 crypto: caam/jr - =
fix Chacha20 + Poly1305 self test failure<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A061f25d4686bf crypto: caam/qi2 -=
 fix Chacha20 + Poly1305 self test failure<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066eb7b7f23dd nd_btt: Make BTT l=
anes preemptible<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06563e0f79d63 libnvdimm/of_pmem:=
 Use devm_kstrdup instead of kstrdup and check its return value<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4ad0c1a83ce scsi: ibmvfc: Fix =
erroneous use of rtas_busy_delay with hcall return code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b79c7d684c3f RDMA/core: Use siz=
e_{add,sub,mul}() in calls to struct_size()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a5c83c8043d7 hwrng: geode - fix=
 accessing registers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8607725b20a crypto: hisilicon/=
hpre - Fix a erroneous check after snprintf()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b01b9dc5487a selftests/resctrl:=
 Ensure the benchmark commands fits to its array<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02d2300fcf8f6 selftests/pidfd: F=
ix ksft print formats<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08bc9c9447489 arm64: dts: imx8mn=
: Add sound-dai-cells to micfil node<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01abd658492b5 arm64: dts: imx8mm=
: Add sound-dai-cells to micfil node<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cf7abb54f8b1 arm64: dts: imx8qm=
-ss-img: Fix jpegenc compatible entry<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08704bf18a888 clk: scmi: Free sc=
mi_clk allocated when the clocks with invalid info are skipped<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bdb0428aa294 firmware: arm_ffa:=
 Assign the missing IDR allocation ID to the FFA device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0ffdc164365 firmware: ti_sci: =
Mark driver as non removable<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0995ee1e84e8d soc: qcom: llcc: H=
andle a second device without data corruption<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A019b8098f73c6 ARM: dts: qcom: md=
m9615: populate vsdcc fixed regulator<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8ab88f84b89 arm64: dts: qcom: =
apq8016-sbc: Add missing ADV7533 regulators<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ddc0df81eeac ARM64: dts: marvel=
l: cn9310: Use appropriate label for spi1 pins<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A012d9de01c09c arm64: dts: qcom: =
sdm845-mtp: fix WiFi configuration<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0690b89255971 arm64: dts: qcom: =
sc7280: Add missing LMH interrupts<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02a4cce4168f7 arm64: dts: qcom: =
msm8992-libra: drop duplicated reserved memory<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb9daf47806b arm64: dts: qcom: =
msm8916: Fix iommu local address range<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0541640dcbf48 ARM: dts: renesas:=
 blanche: Fix typo in GP_11_2 pin name<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00e1e88bba286 perf: hisi: Fix us=
e-after-free when register pmu fails<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04067d39f3c57 drm: mediatek: mtk=
_dsi: Fix NO_EOT_PACKET settings/handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a6a6f70aedca drm/msm/dsi: use m=
sm_gem_kernel_put to free TX buffer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aea6f32a4318 xen-pciback: Consi=
der INTx disabled when MSI/MSI-X is enabled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e588ca45bf55 drm/rockchip: Fix =
type promotion bug in rockchip_gem_iommu_map()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a00a293d57a5 arm64/arm: xen: en=
lighten: Fix KPTI checks<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d0d01bb4a560 drm/bridge: lt9611=
uxc: fix the race in the error path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A029aba28ea195 drm/bridge: lt9611=
uxc: Register and attach our DSI device at probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f53a04579328 drm/bridge: lt9611=
uxc: Switch to devm MIPI-DSI helpers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0517a5137a57b drm/rockchip: cdn-=
dp: Fix some error handling paths in cdn_dp_probe()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0865ccd4ca674 drm/mediatek: Fix =
iommu fault during crtc enabling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08e3c8253b34f drm/mediatek: Fix =
iommu fault by swapping FBs after updating plane state<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e11e339faa11 drm/amdkfd: fix so=
me race conditions in vram buffer alloc/free of svm code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030cb99e09648 drm/bridge: tc3587=
68: Fix bit updates<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01cd4ae681a6a drm/bridge: tc3587=
68: Disable non-continuous clock mode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c13591b859be drm/bridge: tc3587=
68: Fix use of uninitialized variable<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d78bddd94b80 drm/bridge: lt8912=
b: Add missing drm_bridge_attach call<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05cc2bc519afd drm/bridge: lt8912=
b: Manually disable HPD only if it was enabled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A042071feab712 drm/bridge: lt8912=
b: Fix crash on bridge detach<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d9217286d0ab drm/bridge: lt8912=
b: Fix bridge_detach<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc3057958c5c drm/bridge: lt8912=
b: Add hot plug detection<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef4a40953c80 drm/bridge: lt8912=
b: Register and attach our DSI device at probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03580b8a01305 drm/bridge: lt8912=
b: Switch to devm MIPI-DSI helpers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A052541851a8d1 drm/mipi-dsi: Crea=
te devm device attachment<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a20d6ecd261a drm/mipi-dsi: Crea=
te devm device registration<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0347f025a02b3 drm/radeon: possib=
le buffer overflow<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b163b371d741 drm/rockchip: vop:=
 Fix call to crtc reset helper<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a96bed1df7b drm/rockchip: vop:=
 Fix reset of state in duplicate state crtc funcs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01b0bc99cf316 hwmon: (coretemp) =
Fix potentially truncated sysfs attribute name<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3e7eb23a6e9 hwmon: (axi-fan-co=
ntrol) Fix possible NULL pointer dereference<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0bf076b734a platform/x86: wmi:=
 Fix opening of char device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c57e81d5e538 platform/x86: wmi:=
 remove unnecessary initializations<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02ca4e461a298 platform/x86: wmi:=
 Fix probe failure when failing to register WMI devices<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f75e11f54d98 clk: qcom: config =
IPQ_APSS_6018 should depend on QCOM_SMEM<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d1175cf4bd2b clk: mediatek: clk=
-mt2701: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e964d21dc034 clk: mediatek: clk=
-mt7629: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4070ada5d51 clk: mediatek: clk=
-mt7629-eth: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03aefc6fcfbad clk: mediatek: clk=
-mt6797: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca6d565a2319 clk: mediatek: clk=
-mt6779: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0533ca5153ad6 clk: mediatek: clk=
-mt6765: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e531e4e73734 clk: npcm7xx: Fix =
incorrect kfree<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0761c2a690d8f clk: ti: fix doubl=
e free in of_ti_divider_clk_setup()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c37faca0908 clk: ti: change ti=
_clk_register[_omap_hw]() API<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028b72fba1e19 clk: ti: Update co=
mponent clocks to use ti_dt_clk_name()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4bffed2e52b clk: ti: Update pl=
l and clockdomain clocks to use ti_dt_clk_name()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09b5e9d8bf9a6 clk: ti: Add ti_dt=
_clk_name() helper to use clock-output-names<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f45fff806ebb clk: keystone: pll=
: fix a couple NULL vs IS_ERR() checks<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ff8ca9beefb spi: nxp-fspi: use=
 the correct ioremap function<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A026206c858dae clk: renesas: rzg2=
l: Fix computation formula<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01966bf2a79e6 clk: renesas: rzg2=
l: Use FIELD_GET() for PLL register fields<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ece2efa87af clk: renesas: rzg2=
l: Simplify multiplication/shift logic<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e2239f716529 clk: imx: imx8qxp:=
 Fix elcdif_pll clock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d416973cd12 clk: imx: imx8mq: =
correct error handling path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0608ebb098b79 clk: imx: Select M=
XC_CLK for CLK_IMX8QXP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08861b2925a84 clk: qcom: gcc-sm8=
150: Fix gcc_sdcc2_apps_clk_src<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076e8f00f54a8 clk: qcom: mmcc-ms=
m8998: Fix the SMMU GDSC<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056c4bb46a5a0 clk: qcom: mmcc-ms=
m8998: Don&#39;t check halt bit on some branch clks<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00881d24cf5ca clk: qcom: clk-rcg=
2: Fix clock rate overflow for high parent frequencies<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b64683f5d728 spi: tegra: Fix mi=
ssing IRQ check in tegra_slink_probe()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b13e8b38be51 regmap: debugfs: F=
ix a erroneous check after snprintf()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08fafac407346 ipvlan: properly t=
rack tx_errors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03eedc19a9d0f net: add DEV_STATS=
_READ() helper<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0359bce81b841 ipv6: avoid atomic=
 fragment on GSO packets<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06b413d52f6ab ACPI: sysfs: Fix c=
reate_pnp_modalias() and create_of_modalias()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A032aaa3b98789 wifi: iwlwifi: emp=
ty overflow queue during flush<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00e3ad00be4e8 wifi: iwlwifi: pci=
e: synchronize IRQs before NAPI<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8ebe549e0ce wifi: iwlwifi: cal=
l napi_synchronize() before freeing rx/tx queues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0627a3b3f5c80 iwlwifi: pcie: adj=
ust to Bz completion descriptor<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d91506a40ec tcp: fix cookie_in=
it_timestamp() overflows<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04f6e904ed4e3 chtls: fix tp-&gt;=
rcv_tstamp initialization<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05d7bec7ae4db r8169: fix rare is=
sue with broken rx after link-down on RTL8125<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e143a3c82d33 r8169: use tp_to_d=
ev instead of open code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a8f4e58e1ee thermal: core: pre=
vent potential string overflow<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bfd4ed4988aa netfilter: nf_tabl=
es: Drop pointless memset when dumping rules<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A080986257d2cd PM / devfreq: rock=
chip-dfi: Make pmu regmap mandatory<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0826120c9ba68 can: dev: can_put_=
echo_skb(): don&#39;t crash kernel if can_priv::echo_skb is accessed out of=
 bounds<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028e9e015916e can: dev: can_rest=
art(): fix race condition between controller restart and netif_carrier_on()=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ada4dc4788f1 can: dev: can_rest=
art(): don&#39;t crash kernel if carrier is OK<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4eb4182a823 wifi: rtlwifi: fix=
 EDCA limit set by BT coexistence<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02027e74150ee tcp_metrics: do no=
t create an entry from tcp_init_metrics()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f7cb7c47ce0 tcp_metrics: prope=
rly set tp-&gt;snd_ssthresh in tcp_init_metrics()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca7b6fa9e61a tcp_metrics: add m=
issing barriers on delete<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0227709a0e47c wifi: mt76: mt7603=
: improve stuck beacon handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eab5b0aa5065 mt76: pass origina=
l queue id from __mt76_tx_queue_skb to the driver<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A075336a762539 mt76: add support =
for overriding the device used for DMA mapping<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A077b2ab5cd1a4 mt76: dma: use kza=
lloc instead of devm_kzalloc for txwi<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0064b32f18db1 wifi: mt76: mt7603=
: rework/fix rx pse hang check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01afbb9ececd3 wifi: rtw88: debug=
: Fix the NULL vs IS_ERR() bug for debugfs_create_file()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ebcbf5f5e047 net: spider_net: U=
se size_add() in call to struct_size()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056e7424c6efc tipc: Use size_add=
() in calls to struct_size()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03e51efcb2909 mlxsw: Use size_mu=
l() in call to struct_size()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dc3fef310732 gve: Use size_add(=
) in call to struct_size()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070f032db8516 tcp: call tcp_try_=
undo_recovery when an RTOd TFO SYNACK is ACKed<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2d540c74549 udp: add missing W=
RITE_ONCE() around up-&gt;encap_rcv<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f7eef3a13df selftests/bpf: Cor=
rect map_fd to data_fd in tailcalls<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03eefb2fbf4ec selftests/bpf: Tes=
t tail call counting with bpf2bpf and data on stack<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ab91992ec4d4 i40e: fix potentia=
l memory leaks in i40e_remove()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0702742373650 genirq/matrix: Exc=
lude managed interrupts in irq_matrix_allocated()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0379b120e4f27 pstore/platform: A=
dd check for kstrdup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A081b8638e4ef4 x86/boot: Fix inco=
rrect startup_gdt_descr.size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c7e8c7452e5a x86/sev-es: Allow =
copy_from_kernel_nofault() in earlier boot<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b5da8ce0f18 x86: Share definit=
ion of __is_canonical_address()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A090b263db856d futex: Don&#39;t i=
nclude process MM in futex key on no-MMU<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0d6e5841172 x86/srso: Fix SBPB=
 enablement for (possible) future fixed HW<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0565f9337b68e writeback, cgroup:=
 switch inodes with dirty timestamps to release dying cgwbs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02bb46b20825d vfs: fix readahead=
(2) on block devices<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020195f87db19 sched: Fix stop_on=
e_cpu_nowait() vs hotplug<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A013cde955e52e sched/uclamp: Igno=
re (util =3D=3D 0) optimization in feec() when p_util_max =3D 0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc6198ff20c0 iov_iter, x86: Be =
consistent about the __user tag on copy_mc_to_user()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A080529b4968a8 Linux 5.15.138<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03d8344a7c4a3 ALSA: hda: intel-d=
sp-config: Fix JSL Chromebook quirk detection<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f049c0c0037d misc: pci_endpoint=
_test: Add deviceID for J721S2 PCIe EP device support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028b8ad8ccecd tty: 8250: Add Bra=
inboxes Oxford Semiconductor-based quirks<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A044c4dfac3f02 tty: 8250: Add sup=
port for Intashield IX cards<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d541ccb34de2 tty: 8250: Add sup=
port for additional Brainboxes PX cards<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A060debc01fcbb tty: 8250: Fix up =
PX-803/PX-857<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f5649aed527 tty: 8250: Fix por=
t count of PX-257<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03fe3cc63c730 tty: 8250: Add sup=
port for Intashield IS-100<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a5b6390fd609 tty: 8250: Add sup=
port for Brainboxes UP cards<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0738fe41b6443 tty: 8250: Add sup=
port for additional Brainboxes UC cards<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff6059c3d234 tty: 8250: Remove =
UC-257 and UC-431<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A081a4dd5e6c78 tty: n_gsm: fix ra=
ce condition in status line change on dead connections<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e25197747f0e usb: raw-gadget: p=
roperly handle interrupted requests<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e5f53a68a596 usb: typec: tcpm: =
Fix NULL pointer dereference in tcpm_pd_svdm()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c4855b22a3f usb: storage: set =
1.50 as the lower bcdDevice for older &quot;Super Top&quot; compatibility<b=
r>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c48aae53850c PCI: Prevent xHCI =
driver from claiming AMD VanGogh USB3 DRD device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06628c3627c02 drm/amd: Disable A=
SPM for VI w/ all Intel systems<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b6c3c7786e24 drm/amd: Move help=
er for dynamic speed switch check out of smu13<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09015169f00ee can: isotp: isotp_=
sendmsg(): fix TX state detection and wait behavior<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d72ff6478323 can: isotp: isotp_=
bind(): do not validate unused address information<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e163ad6a8639 can: isotp: add lo=
cal echo tx processing and tx without FC<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b4e78ea26638 can: isotp: handle=
 wait_event_interruptible() return values<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02fc6f337257f can: isotp: check =
CAN address family in isotp_bind()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f8c3bd211cf3 can: isotp: isotp_=
bind(): return -EINVAL on incorrect CAN ID formatting<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0615c4dd64050 can: isotp: set ma=
x PDU size to 64 kByte<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06627b96851f1 powerpc/mm: Fix bo=
ot crash with FLATMEM<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0f998648887 r8152: Check for u=
nplug in r8153b_ups_en() / r8153c_ups_en()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A078c939a88729 r8152: Check for u=
nplug in rtl_phy_patch_request()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051cc28ce742e net: chelsio: cxgb=
4: add an error code check in t4_load_phy_fw<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bbc926199321 platform/mellanox:=
 mlxbf-tmfifo: Fix a warning message<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db4416ea3a5d scsi: mpt3sas: Fix=
 in error path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d48b2e8189d5 fbdev: uvesafb: Ca=
ll cn_del_callback() at the end of uvesafb_exit()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e39440c3268b drm/ttm: Reorder s=
ys manager cleanup step<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aade33d3d9bb ASoC: rt5650: fix =
the wrong result of key button<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fa32e21c0568 netfilter: nfnetli=
nk_log: silence bogus compiler warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dfcbb983eb6e spi: npcm-fiu: Fix=
 UMA reads when dummy.nbytes =3D=3D 0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A064ae128b095d fs/ntfs3: Avoid po=
ssible memory leak<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A027a0bed1285e fs/ntfs3: Fix dire=
ctory element type detection<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A094524980ee75 fs/ntfs3: Fix NULL=
 pointer dereference on error in attr_allocate_frame()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02de328398b50 fs/ntfs3: Fix poss=
ible NULL-ptr-deref in ni_readpage_cmpr()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0962a3d3d731c fs/ntfs3: Use kvma=
lloc instead of kmalloc(... __GFP_NOWARN)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0393966e79ba1 fs/ntfs3: Write im=
mediately updated ntfs state<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A059e629fc7157 fs/ntfs3: Add ckec=
k in ni_update_parent()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0738a3adc7c8b fbdev: atyfb: only=
 use ioremap_uc() on i386 and ia64<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0afef8af919d2 Input: synaptics-r=
mi4 - handle reset delay when using SMBus trsnsport<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0abc62fc06d4a powerpc/85xx: Fix =
math emulation exception<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04bdde4dca00e dmaengine: ste_dma=
40: Fix PM disable depth imbalance in d40_probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A039d2c10367a8 irqchip/stm32-exti=
: add missing DT IRQ flag translation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c57aef9075e0 irqchip/riscv-intc=
: Mark all INTC nodes as initialized<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb99b6e204cd net: sched: cls_u3=
2: Fix allocation size in u32_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05e78ebe7c1db ASoC: simple-card:=
 fixup asoc_simple_probe() error handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A065fd21aa3805 x86: Fix .brk attr=
ibute in linker script<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4c8bf5635c4 rpmsg: Fix possibl=
e refcount leak in rpmsg_register_device_override()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a82e0fda8a2f rpmsg: glink: Rele=
ase driver_override<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bfd4a664ddfb rpmsg: Fix calling=
 device_lock() on non-initialized device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02e76b4f6218c rpmsg: Fix kfree()=
 of static memory on setting driver_override<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05c0da71871d3 rpmsg: Constify lo=
cal variable in field store macro<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0389190b25472 driver: platform: =
Add helper for safer setting of driver_override<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A037ffa428d58c objtool/x86: add m=
issing embedded_insn check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f031e15d0bb8 ext4: avoid overla=
pping preallocations due to overflow<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f2c3a3aa6f11 ext4: fix BUG in e=
xt4_mb_new_inode_pa() due to overflow<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07a992726f727 ext4: add two help=
er functions extent_logical_end() and pa_logical_end()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09e78e7709f7d x86/mm: Fix RESERV=
E_BRK() for older binutils<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3201c718058 x86/mm: Simplify R=
ESERVE_BRK()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0897b56acf126 x86/i8259: Skip pr=
obing when ACPI/MADT advertises PCAT compatibility<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A077db87c4a4ed gve: Fix GFP flags=
 when allocing pages<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08b424bdf6c9c iio: afe: rescale:=
 Accept only offset channels<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c1eeb494f684 iio: afe: rescale:=
 add offset support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c76b7db5521 iio: afe: rescale:=
 expose scale processing function<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c60671502dc2 iio: afe: rescale:=
 reorder includes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A027dd09f5ec7f clk: Sanitize poss=
ible_parent_show to Handle Return Value of of_clk_get_parent_name<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c27ca4aebbee sparc32: fix a bra=
ino in fault handling in csum_and_copy_..._user()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A021b07a2e6095 perf/core: Fix pot=
ential NULL deref<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06efd498009b9 nvmem: imx: correc=
t nregs for i.MX6UL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c2948118c34 nvmem: imx: correc=
t nregs for i.MX6SLL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06e22bf6f00d5 nvmem: imx: correc=
t nregs for i.MX6ULL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0f95b831b4a misc: fastrpc: Cle=
an buffers on remote invocation failures<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4957f00f9e2 tracing/kprobes: F=
ix the description of variable length arguments<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cdc57093b470 i2c: aspeed: Fix i=
2c bus hang in slave read<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e97d374a2506 i2c: stm32f7: Fix =
PEC handling in case of SMBUS transfers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02766a872103b i2c: muxes: i2c-de=
mux-pinctrl: Use of_get_i2c_adapter_by_node()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A048b58f7469e5 i2c: muxes: i2c-mu=
x-gpmux: Use of_get_i2c_adapter_by_node()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb65e692765b i2c: muxes: i2c-mu=
x-pinctrl: Use of_get_i2c_adapter_by_node()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eace761f35a1 iio: adc: xilinx-x=
adc: Correct temperature offset/scale for UltraScale<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070322a446ef2 iio: adc: xilinx-x=
adc: Don&#39;t clobber preset voltage/temperature thresholds<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03c1312b5d49a iio: exynos-adc: r=
equest second interupt only when touchscreen mode is used<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04e14f2d5885f kasan: print the o=
riginal fault addr when access invalid shadow<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bdfa4fa7588d i40e: Fix wrong ch=
eck for I40E_TXR_FLAGS_WB_ON_ITR<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d5c175f4cea6 gtp: fix fragmenta=
tion needed check with gso<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0dad0c0924c gtp: uapi: fix GTP=
A_MAX<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0852fb4ce426d tcp: fix wrong RTO=
 timeout when received SACK reneging<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A083cfa3b51a78 r8152: Release fir=
mware if we have an error in probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0f9231ccd6c r8152: Cancel hw_p=
hy_work if we have an error in probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff42b0a55659 r8152: Run the unl=
oad routine if we have errors during probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06fa3b9f9478e r8152: Increase US=
B control msg timeout to 5000ms as per spec<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076873f2eadc0 net: usb: smsc95xx=
: Fix uninit-value access in smsc95xx_read_reg<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06afd112c3f95 net: ieee802154: a=
df7242: Fix some potential buffer overflow in adf7242_stats_show()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A046cd35e4e774 igc: Fix ambiguity=
 in the ethtool advertising<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A049529413eaed neighbour: fix var=
ious data-races<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0667554946360 igb: Fix potential=
 memory leak in igb_add_ethtool_nfc_entry<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0263421905346 treewide: Spelling=
 fix in comment<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc0c4bc119d2 i40e: Fix I40E_FLA=
G_VF_VLAN_PRUNING value<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c532c5df01ad r8169: fix the KCS=
AN reported data race in rtl_rx while reading desc-&gt;opts1<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06afb294c88c6 r8169: fix the KCS=
AN reported data-race in rtl_tx while reading TxDescArray[entry].opts1<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09d7b3838428c r8169: fix the KCS=
AN reported data-race in rtl_tx() while reading tp-&gt;cur_tx<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A004dbfa4122e0 firmware/imx-dsp: =
Fix use_after_free in imx_dsp_setup_channels()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d587b86cd0d drm/dp_mst: Fix NU=
LL deref in get_mst_branch_device_by_guid_helper()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08860f0175e51 vsock/virtio: init=
ialize the_virtio_vsock before using VQs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0762c251c7f5c vsock/virtio: add =
support for device suspend/resume<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01e02df6f6907 vsock/virtio: fact=
or our the code to initialize and delete VQs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A015a8cac3c250 drm/i915/pmu: Chec=
k if pmu is closed before stopping event<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A043bd431a5dd9 nfsd: lock_rename(=
) needs both directories to live on the same fs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0556b68d9b95f mm/migrate: fix do=
_pages_move for compat pointers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4071c6114de mm/page_alloc: cor=
rect start page when guard page debug is enabled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a6cee2bfb53 vhost: Allow null =
msg.size on VHOST_IOTLB_INVALIDATE<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fbc9a8718f31 virtio-mmio: fix m=
emory leak of vm_dev<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0862a356bc986 virtio_balloon: Fi=
x endless deflation and inflation on arm64<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A041bb770e42bc mcb-lpc: Reallocat=
e memory region to avoid memory overlapping<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f2ac8b2643dd mcb: Return actual=
 parsed size when reading chameleon table<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A090918ef995b5 mptcp: more conser=
vative check for zero probes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd2b2dab6f5b tcp: cleanup tcp_r=
emove_empty_skb() use<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A068342755b9b2 tcp: remove dead c=
ode from tcp_sendmsg_locked()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00f482ad7b1a5 pinctrl: qcom: lpa=
ss-lpi: fix concurrent register updates<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051b054f6fe01 ASoC: codecs: wcd9=
38x: fix runtime PM imbalance on remove<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb34f4e79e54 ASoC: codecs: wcd9=
38x: fix resource leaks on bind errors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A012952a23a5da Linux 5.15.137<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dff33880d40a xfrm6: fix inet6_d=
ev refcount underflow problem<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a9d05a4f1c3 Bluetooth: hci_soc=
k: Correctly bounds check and pad HCI_MON_NEW_INDEX name<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a6df96ee0b45 Bluetooth: hci_soc=
k: fix slab oob read in create_monitor_event<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c08d609fb2b6 phy: mapphone-mdm6=
600: Fix pinctrl_pm handling for sleep pins<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1b030b101f6 phy: mapphone-mdm6=
600: Fix runtime PM for remove<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A059f1095ab58e phy: mapphone-mdm6=
600: Fix runtime disable on probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b618062c0b13 serial: 8250: omap=
: Move uart_write() inside PM section<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A067f29cd2f851 ASoC: pxa: fix a m=
emory leak in probe()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076d04c339508 gpio: vf610: set v=
alue before the direction to avoid a glitch<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04b129e3964b3 platform/x86: asus=
-wmi: Map 0x2a code, Ignore 0x2b and 0x2c events<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1a058cc2467 platform/x86: asus=
-wmi: Change ASUS_WMI_BRN_DOWN code from 0x20 to 0x2e<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c6bbe51dcdf3 platform/surface: =
platform_profile: Propagate error if profile registration fails<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a73c8d716938 s390/cio: fix a me=
mleak in css_alloc_subchannel<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8b6c2df1e7d selftests/ftrace: =
Add new test case which checks non unique symbol<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03ad81e6affcb s390/pci: fix iomm=
u bitmap allocation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A071d224acc4d1 perf: Disallow mis=
-matched inherited group reads<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05aa89a11a2a6 USB: serial: optio=
n: add Fibocom to DELL custom modem FM101R-GL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08c376d863618 USB: serial: optio=
n: add entry for Sierra EM9191 with new firmware<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0483221216176 USB: serial: optio=
n: add Telit LE910C4-WWX 0x1035 composition<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e750fb71dc6a nvme-rdma: do not =
try to stop unallocated queues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9fd6d44abbc nvme-pci: add BOGU=
S_NID for Intel 0a54 device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0071382bda1da ACPI: irq: Fix inc=
orrect return value in acpi_register_gsi()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0431a5010bce2 NFSv4.1: fixup use=
 EXCHGID4_FLAG_USE_PNFS_DS for DS server<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05762e72ef1b0 pNFS: Fix a hang i=
n nfs4_evict_inode()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a3abee2eee9 Revert &quot;pinct=
rl: avoid unsafe code pattern in find_pinctrl()&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024959825377f mmc: core: Capture=
 correct oemid-bits for eMMC cards<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08041e7b7e7e9 mmc: core: sdio: h=
old retuning if sdio in 1-bit mode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0262029c0c58c mmc: mtk-sd: Use r=
eadl_poll_timeout_atomic in msdc_reset_hw<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03e363db1c13a mtd: physmap-core:=
 Restore map_rom fallback<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A071823463b1b2 mtd: spinand: micr=
on: correct bitmask for ecc status<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a50d2f17d562 mtd: rawnand: aras=
an: Ensure program page operations are successful<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ae53c92e928c mtd: rawnand: marv=
ell: Ensure program page operations are successful<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0ca2ab23098 mtd: rawnand: pl35=
3: Ensure program page operations are successful<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7070628043e mtd: rawnand: qcom=
: Unmap the right resource upon probe failure<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f928d1362f7 net: fix ifname in=
 netlink ntf during netns move<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ac43ec299a6f net: move from str=
lcpy with unused retval to strscpy<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030e2db403032 net: introduce a f=
unction to check if a netdev name is in use<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A038ba5479355b Bluetooth: hci_eve=
nt: Fix using memcmp when comparing keys<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03b2da6d62b42 net/mlx5: Handle f=
w tracer change ownership event based on MTRC<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6e263824539 platform/x86: touc=
hscreen_dmi: Add info for the Positivo C4128B<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca56d8afe648 HID: multitouch: A=
dd required quirk for Synaptics 0xcd7e device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca5bec7ecf26 btrfs: error out w=
hen reallocating block for defrag using a stale transaction<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02692fd37aaf4 btrfs: error when =
COWing block from a root that is being deleted<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef491d9560d9 btrfs: error out w=
hen COWing block using a stale transaction<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f89ed0a09673 btrfs: fix some -W=
maybe-uninitialized warnings in ioctl.c<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0df486b75feca drm: panel-orienta=
tion-quirks: Add quirk for One Mix 2S<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d5ba30ee4f6d ipv4/fib: send not=
ify when delete source address routes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09d07b7abd277 sky2: Make sure th=
ere is at least one frag_addr available<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f652eb4adf27 regulator/core: Re=
vert &quot;fix kobject release warning and memory leak in regulator_registe=
r()&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aa77b187b1f0 wifi: cfg80211: av=
oid leaking stack data into trace<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030a2285a2e18 wifi: mac80211: al=
low transmitting EAPOL frames with tainted key<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b64eb31a1b53 wifi: cfg80211: Fi=
x 6GHz scan configuration<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bbec1724519e Bluetooth: hci_cor=
e: Fix build warnings<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A002b0e6991838 Bluetooth: Avoid r=
edundant authentication<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A038681af225b6 Bluetooth: btusb: =
add shutdown function for QCA6174<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e6e9a32c3e60 HID: holtek: fix s=
lab-out-of-bounds Write in holtek_kbd_input_event<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A006aabf7715da wifi: iwlwifi: Ens=
ure ack flag is properly cleared.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06063f6f64fa4 wifi: mwifiex: San=
ity check tlv_len and tlv_bitmap_len<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A059ebfeb7b319 tracing: relax tra=
ce_event_eval_update() execution with cond_resched()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03d85fb391fa7 ata: libata-eh: Fi=
x compilation warning in ata_eh_link_report()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A089e3cc1b0703 ata: libata-core: =
Fix compilation warning in ata_dev_config_ncq()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0137c658ea3ce gpio: timberdale: =
Fix potential deadlock on &amp;tgpio-&gt;lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A068f106c2b2ab overlayfs: set cti=
me when setting mtime and atime<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef3c62e2f0f1 i2c: mux: Avoid po=
tential false error message in i2c_mux_add_adapter<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e2f64f3eebaa btrfs: initialize =
start_slot in btrfs_log_prealloc_extents<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0266dab0ce42d btrfs: return -EUC=
LEAN for delayed tree ref with a ref count not equals to 1<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc424f18fbdc fs-writeback: do n=
ot requeue a clean inode having skipped pages<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092609823592c ARM: dts: ti: omap=
: Fix noisy serial with overrun-throttle-ms for mapphone<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03898d8d685ab ksmbd: not allow t=
o open file if delelete on close bit is set<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3dc26c4fdc2 nfp: flower: avoid=
 rmmod nfp crash issues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c52b1215904 mctp: perform rout=
e lookups under a RCU read-side lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db3f17e571e8 mctp: Allow local =
delivery to the null EID<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A029017ab1a539 powerpc/47x: Fix 4=
7x syscall return crash<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0558ee0fafd40 powerpc/32s: Do ku=
ep_lock() and kuep_unlock() in assembly<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d00f4ae3accf powerpc/32s: Remov=
e capability to disable KUEP at boottime<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fcb3f09e8173 drm/atomic-helper:=
 relax unregistered connector check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0403d201d1fd1 perf/x86/lbr: Filt=
er vsyscall addresses<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0419ac18d8808 perf/x86: Move bra=
nch classifier<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0030099bc9115 perf: Add irq and =
exception return branch types<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ae80d5290c14 iio: adc: ad7192: =
Correct reference voltage<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0569a126f244b iio: cros_ec: fix =
an use-after-free in cros_ec_sensors_push_data()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9c471892d75 iio: core: introdu=
ce iio_device_{claim|release}_buffer_mode() APIs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eafbb1966152 iio: core: Hide re=
ad accesses to iio_dev-&gt;currentmode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0919721348c04 iio: Un-inline iio=
_buffer_enabled()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07f74bc91eb00 serial: 8250_omap:=
 Fix errors with no_console_suspend<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d67d831e1dbc serial: 8250: omap=
: Fix imprecise external abort for omap_8250_pm()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aff3019b553e selftests/mm: fix =
awk usage in charge_reserved_hugetlb.sh and hugetlb_reparenting_test.sh tha=
t may cause error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04f1d3d1ca500 net: pktgen: Fix i=
nterface flags printing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08bdf95e29f86 netfilter: nf_tabl=
es: revert do not remove elements if set backend implements .abort<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc19daa037f5 netfilter: nf_tabl=
es: do not remove elements if set backend implements .abort<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db33720697c8 netfilter: nft_set=
_rbtree: .deactivate fails if element has expired<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A044768cad012c neighbor: tracing:=
 Move pin6 inside CONFIG_IPV6=3Dy section<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b33179dbf3f2 net/sched: sch_hfs=
c: upgrade &#39;rt&#39; to &#39;sc&#39; when it becomes a inner curve<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00426d7bc17b8 bonding: Return po=
inter to data after pull on skb<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066982023d741 net: dsa: bcm_sf2:=
 Fix possible memory leak in bcm_sf2_mdio_register()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00ea476863ef7 i40e: prevent cras=
h on probe if hw registers have invalid values<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9202217a6ea net: usb: smsc95xx=
: Fix an error code in smsc95xx_reset()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2ceb30cc1fc ipv4: fib: annotat=
e races around nh-&gt;nh_saddr_genid and nh-&gt;nh_saddr<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a270aa7a47db tun: prevent negat=
ive ifindex<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09d55719f983d tcp: tsq: relax tc=
p_small_queue_check() when rtx queue contains a single skb<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08ae344291e38 tcp: fix excessive=
 TLP and RACK timeouts from HZ rounding<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08b6b4ca42a94 net: rfkill: gpio:=
 prevent value glitch during probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04df9ba0d7a82 net: ipv6: fix ret=
urn value check in esp_remove_trailer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9651e66d0bd net: ipv4: fix ret=
urn value check in esp_remove_trailer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A026a3c734cb8a xfrm: interface: u=
se DEV_STATS_INC()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f8bc4b708b11 xfrm: fix a data-r=
ace in xfrm_gen_index()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b660e58ef72d qed: fix LL2 RX bu=
ffer allocation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d35f398b88a1 ASoC: codecs: wcd9=
38x: fix unbind tear down order<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d182d8ed7b7e ASoC: codecs: wcd9=
38x: drop bogus bind error handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d32a6b67e77 ASoC: codecs: wcd9=
38x-sdw: fix runtime PM imbalance on probe errors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06df571a6c153 ASoC: codecs: wcd9=
38x-sdw: fix use after free on driver unbind<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A036eabe87031f drm/i915: Retry gt=
t fault when out of fence registers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A034f62612be2a nvmet-tcp: Fix a p=
ossible UAF in queue intialization setup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A004e0eef74b8f netfilter: nft_pay=
load: fix wrong mac header matching<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0efe43d1bcbcb fs/ntfs3: fix dead=
lock in mark_as_free_ex<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ab40c7ab7a93 fs/ntfs3: fix pani=
c about slab-out-of-bounds caused by ntfs_list_ea()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024badb9dd8b8 fs/ntfs3: Fix poss=
ible null-pointer dereference in hdr_find_e()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff38d2a705e1 tcp: check mptcp-l=
evel constraints for backlog coalescing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0582f7993353c x86/sev: Check for=
 user-space IOIO pointing to kernel space<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05c2c01be809d x86/sev: Check IOB=
M for IOIO exceptions from user-space<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06797c6d09e50 x86/sev: Disable M=
MIO emulation from user mode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b4e772a6a89 KVM: x86: Mask LVT=
PC when handling a PMI<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f61c43be1eb9 regmap: fix NULL d=
eref on lookup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ffdc881f6807 nfc: nci: fix poss=
ible NULL pointer dereference in send_acknowledge()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d42aeae14fc4 ice: reset first i=
n crash dump kernels<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e42cecb513af ice: fix over-shif=
ted variable<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6c093b97761 Bluetooth: avoid m=
emcmp() out of bounds warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e5f8b43c9c90 Bluetooth: hci_eve=
nt: Fix coding style<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01597c1ed0e7d Bluetooth: vhci: F=
ix race when opening vhci device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01ef071526848 Bluetooth: Fix a r=
efcnt underflow problem for hci_conn<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dd6b62fdd245 Bluetooth: Reject =
connection with the device which has same BD_ADDR<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0848a05c4423f Bluetooth: hci_eve=
nt: Ignore NULL link key<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e7a2aa7770d3 xfs: don&#39;t exp=
ose internal symlink metadata buffers to the vfs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fe5c6fbc5e4a Documentation: sys=
ctl: align cells in second content column<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01815844652cc lib/Kconfig.debug:=
 do not enable DEBUG_PREEMPT by default<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A000c03985402e Linux 5.15.136<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05266b5b6e975 eth: remove remain=
ing copies of the NAPI_POLL_WEIGHT define<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0528f0ba9f7a4 usb: hub: Guard ag=
ainst accesses to uninitialized BOS descriptors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0542a3f1a3cc1 Revert &quot;kerne=
l/sched: Modify initial boot task idle setup&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0737ce5518a9c arm64: armv8_depre=
cated: fix unused-function error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02e10931e2d77 arm64: armv8_depre=
cated: rework deprected instruction handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0abd4aa081905 arm64: armv8_depre=
cated: move aarch32 helper earlier<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f10abdb04c3d arm64: armv8_depre=
cated move emulation functions<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b4eec015fa5 arm64: armv8_depre=
cated: fold ops into insn_emulation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8d2910be6f8 arm64: rework EL0 =
MRS emulation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0057f9123b1a8 arm64: factor insn=
 read out of call_undef_hook()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f82927cabaf arm64: factor out =
EL1 SSBS emulation hook<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0474385adcd84 arm64: split EL0/E=
L1 UNDEF handlers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de0358635401 arm64: allow kprob=
es on EL0 handlers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07154e2db8890 arm64: rework BTI =
exception handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd5ceadc2b37 arm64: rework FPAC=
 exception handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b6358002fd0c arm64: consistentl=
y pass ESR_ELx to die()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ddb1ef2bb42 arm64: die(): pass=
 &#39;err&#39; as long<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a3e177ef570 arm64: report EL1 =
UNDEFs better<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d6808be3ff94 powerpc/64e: Fix w=
rong test in __ptep_test_and_clear_young()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09c0dc3e2c996 powerpc/8xx: Fix p=
te_access_permitted() for PAGE_NONE<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04da05eba66e6 dmaengine: mediate=
k: Fix deadlock caused by synchronize_irq()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A082f61b2d5187 dmaengine: idxd: u=
se spin_lock_irqsave before wait_event_lock_irq<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ecba5afe86f3 x86/alternatives: =
Disable KASAN in apply_alternatives()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cbd2aac00498 usb: cdnsp: Fixes =
issue with dequeuing not queued requests<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07014807fb7ef usb: gadget: ncm: =
Handle decoding of multiple NTB&#39;s in unwrap call<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A050259cf71a1b usb: gadget: udc-x=
ilinx: replace memcpy with memcpy_toio<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0308f19249641 counter: microchip=
-tcb-capture: Fix the use of internal GCLK logic<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a6ce81d7c16 pinctrl: avoid uns=
afe code pattern in find_pinctrl()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c790191cab4 cgroup: Remove dup=
licates in cgroup v1 tasks file<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01680c82929bc tee: amdtee: fix u=
se-after-free vulnerability in amdtee_close_session<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b8ec40a90acd Input: goodix - en=
sure int GPIO is in input for gpio_count =3D=3D 1 &amp;&amp; gpio_int_idx =
=3D=3D 0 case<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d092630e8a20 Input: i8042 - add=
 Fujitsu Lifebook E5411 to i8042 quirk table<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07cea6fa2d73f Input: xpad - add =
PXN V900 support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ff4e50e2d2a Input: psmouse - f=
ix fast_reconnect function for PS/2 mode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06a4a39638640 Input: powermate -=
 fix use-after-free in powermate_config_complete<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ad7f52d8c58 ceph: fix type pro=
motion bug on 32bit systems<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0c4acd53a98 ceph: fix incorrec=
t revoked caps assert in ceph_fill_file_size()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058f0e6324ec7 libceph: use kerne=
l_connect()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d727b97f8f2e thunderbolt: Check=
 that lane 1 is in CL0 before enabling lane bonding<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A004c38bedd07c thunderbolt: Worka=
round an IOMMU fault on certain systems with Intel Maple Ridge<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a586742a3780 mcb: remove is_add=
ed flag from mcb_device struct<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04382d1a996e5 x86/cpu: Fix AMD e=
rratum #1485 on Zen4-based CPUs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0763167003a80 ACPI: resource: Sk=
ip IRQ override on ASUS ExpertBook B1402CBA<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0510d4a01d84c drm/amd/display: D=
on&#39;t set dpms_off for seamless boot<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09cb61ab9f4ca drm/amdgpu: add mi=
ssing NULL check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9a1af37b801 iio: pressure: ms5=
611: ms5611_prom_is_valid false negative bug<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A009b8ed9547f1 iio: pressure: dps=
310: Adjust Timeout Settings<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04c80ecef859d iio: pressure: bmp=
280: Fix NULL pointer exception<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a625de7e5464 usb: musb: Modify =
the &quot;HWVers&quot; register address<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb28694f6da8 usb: musb: Get the=
 musb_qh poniter after musb_giveback<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ee88141873a8 usb: cdns3: Modify=
 the return value of cdns_set_active () to void when CONFIG_PM_SLEEP is dis=
abled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03b2dbc4f3302 usb: dwc3: Soft re=
set phy on probe for host<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A042c56e015653 net: usb: dm9601: =
fix uninitialized variable use in dm9601_mdio_read<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0524f45361789 usb: xhci: xhci-ri=
ng: Use sysdev for mapping bounce buffer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01d8e7fe85528 xhci: Keep interru=
pt disabled in initialization until host is running.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb34e3b25c37 dmaengine: stm32-m=
dma: abort resume if no ongoing transfer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d56dbfe750a8 media: mtk-jpeg: F=
ix use after free bug due to uncanceled work<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05e13e69ddf0d net: release refer=
ence to inet6_dev pointer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aade10d51ddc net: change accept=
_ra_min_rtr_lft to affect all RA lifetimes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f12d2d66cba net: add sysctl ac=
cept_ra_min_rtr_lft<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc9f6cbeb999 workqueue: Overrid=
e implicit ordered attribute in workqueue_apply_unbound_cpumask()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A025dd54b95abf nfc: nci: assert r=
equested protocol is valid<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b2bb3b43b94a pinctrl: renesas: =
rzn1: Enable missing PINMUX<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4140dd77c3b net/smc: Fix pos m=
iscalculation in statistics<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d888d3f70b0d net: nfc: fix race=
s in nfc_llcp_sock_get() and nfc_llcp_sock_get_sn()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0249a1fdb95d5 net/mlx5e: Again m=
utually exclude RX-FCS and RX-port-timestamp<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02112cacb38aa ixgbe: fix crash w=
ith empty VF macvlan list<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0935a15334d77 net: phy: mscc: ma=
csec: reject PN update requests<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0667fe9101a3a net: macsec: indic=
ate next pn update when offloading<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02dcb31e65d26 bpf: Fix verifier =
log for async callback return values<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06a217af2c67f drm/vmwgfx: fix ty=
po of sizeof argument<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072ef70886556 riscv, bpf: Sign-e=
xtend return values<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07795592e0818 riscv, bpf: Factor=
 out emit_call for kernel and bpf context<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058941cc742ca xen-netback: use d=
efault TX queue size for vifs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cffdced18af8 eth: remove copies=
 of the NAPI_POLL_WEIGHT define<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05c360eec5332 mlxsw: fix mlxsw_s=
p2_nve_vxlan_learning_set() return type<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A084c6aa0ae5c4 ieee802154: ca8210=
: Fix a potential UAF in ca8210_probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0616761cf9df9 ravb: Fix use-afte=
r-free issue in ravb_tx_timeout_work()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030ebd4177593 ravb: Fix up dma_f=
ree_coherent() call in ravb_remove()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f39de2bd1d2 drm/msm/dpu: chang=
e _dpu_plane_calc_bw() to use u64 to avoid overflow<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A085ae07d4dcc6 drm/msm/dsi: fix i=
rq_of_parse_and_map() error checking<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a890c7d4d0f drm/msm/dsi: skip =
the wait for video mode done if not applicable<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b9de60b6830c drm/msm/dp: do not=
 reinitialize phy unless retry during link training<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0afe5f596b588 KEYS: trusted: Rem=
ove redundant static calls usage<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020e73ece06b3 KEYS: trusted: all=
ow use of kernel RNG for key material<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a01d68b6c666 ALSA: usb-audio: F=
ix microphone sound on Opencomm2 Headset<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05b5e58299eac net: prevent addre=
ss rewrite in kernel_bind()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056e96b38d2f7 quota: Fix slow qu=
otaoff<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028ddc1e0b898 HID: logitech-hidp=
p: Fix kernel crash on receiver USB disconnect<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b930f0f7bbc2 lib/test_meminit: =
fix off-by-one error in test_pages()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0982bd86fd659 platform/x86: hp-w=
mi:: Mark driver struct with __refdata to prevent section mismatch warning<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0124cf0ea4b82 platform/x86: thin=
k-lmi: Fix reference leak<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03d2a16f878f0 of: overlay: Reord=
er struct fragment fields kerneldoc<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A010f4a0b6657e perf/arm-cmn: Fix =
the unhandled overflow status of counter 4 to 7<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b7966e2191d0 RDMA/cxgb4: Check =
skb value for failure to allocate<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b9bdffb3f9aa RDMA/srp: Do not c=
all scsi_done() from srp_abort()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d4999589ebc scsi: ib_srp: Call=
 scsi_done() directly<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d2746cdfd5e5 scsi: core: Rename=
 scsi_mq_done() into scsi_done() and export it<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f2350e204da scsi: core: Use a =
structure member to track the SCSI command submitter<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A029298c85a81a iommu/vt-d: Avoid =
memory allocation in iommu_suspend()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A002e21884dcf2 Linux 5.15.135<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8af81a9d36e xen/events: replac=
e evtchn_rwlock with RCU<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c346494ec7f1 parisc: Restore __=
ldcw_align for PA-RISC 2.0 processors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0694e13732e83 ksmbd: fix uaf in =
smb20_oplock_break_ack<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e914c3a47e45 RDMA/mlx5: Fix NUL=
L string error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A081b7bf367eea RDMA/siw: Fix conn=
ection failure handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05d8bd138204f RDMA/uverbs: Fix t=
ypo of sizeof argument<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A060c9ed88526d RDMA/cma: Fix trun=
cation compilation warning in make_cma_ports<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07f6136ced1b8 RDMA/cma: Initiali=
ze ib_sa_multicast structure to 0 when join<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01dd6095fc727 gpio: pxa: disable=
 pinctrl calls for MMP_GPIO<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0844fcf4c697c gpio: aspeed: fix =
the GPIO number passed to pinctrl_gpio_set_config()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01878d6666c32 IB/mlx4: Fix the s=
ize of a buffer in add_port_entries()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0718d9b44afca of: dynamic: Fix p=
otential memory leak in of_changeset_action()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0878f38b661 RDMA/core: Require=
 admin capabilities to set system parameters<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A018a839064fc6 dm zoned: free dmz=
-&gt;ddev array in dmz_put_zoned_devices<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08781fe259dd5 HID: intel-ish-hid=
: ipc: Disable and reenable ACPI GPE bit<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0949ccc91c35b HID: sony: remove =
duplicate NULL check before calling usb_free_urb()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a02c02adc2bd sctp: update hb ti=
mer immediately after users change hb_interval<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07783b471bfce sctp: update trans=
port state when processing a dupcook packet<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01abac613c0d5 tcp: fix delayed A=
CKs for MSS boundary condition<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0821b3b00bc0f tcp: fix quick-ack=
 counting to count actual ACKs of new data<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024fb22bddb71 tipc: fix a potent=
ial deadlock on &amp;tx-&gt;lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02e53585e233c net: stmmac: dwmac=
-stm32: fix resume on STM32 MCU<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A074e569324050 ipv4: Set offload_=
failed flag in fibmatch results<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a4b9bbd1d12f netfilter: nf_tabl=
es: nft_set_rbtree: fix spurious insertion failure<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A088497f74d684 netfilter: handle =
the connecting collision properly in nf_conntrack_proto_sctp<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c9cf5e8807f ibmveth: Remove co=
ndition to recompute TCP header checksum.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a899e2ce848 net: ethernet: ti:=
 am65-cpsw: Fix error code in am65_cpsw_nuss_init_tx_chns()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04837a192f6d0 net: nfc: llcp: Ad=
d lock when modifying device list<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cda10784a176 net: usb: smsc75xx=
: Fix uninit-value access in __smsc75xx_read_reg<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02801a1ddb26d net: dsa: mv88e6xx=
x: Avoid EEPROM timeout when EEPROM is absent<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb145e6c2070 ptp: ocp: Fix erro=
r handling in ptp_ocp_device_init<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd1189956393 ipv4, ipv6: Fix ha=
ndling of transhdrlen in __ip{,6}_append_data()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0147d89ee4143 net: fix possible =
store tearing in neigh_periodic_work()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bdb4fcf18e16 modpost: add missi=
ng else to the &quot;of&quot; check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc8b89b69638 bpf, sockmap: Reje=
ct sk_msg egress redirects to non-TCP sockets<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09fb4dfb8e212 NFSv4: Fix a nfs4_=
state_manager() race<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fcdd79fda38a ima: rework CONFIG=
_IMA dependency block<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b67adca1e1be scsi: target: core=
: Fix deadlock due to recursive locking<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a103e0b100c ima: Finish deprec=
ation of IMA_TRUSTED_KEYRING Kconfig<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb6aee0696c6 regmap: rbtree: Fi=
x wrong register marked as in-cache when creating new node<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00cee8c1b3af3 wifi: mt76: mt76x0=
2: fix MT76x0 external LNA gain handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f6fbbccba2d drivers/net: proce=
ss the result of hdlc_open() and add call of hdlc_close() in uhdlc_close()<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ebad2e4c4847 bpf: Fix tr derefe=
rencing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05afb996349cb wifi: mwifiex: Fix=
 oob check condition in mwifiex_process_rx_packet<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c8faa310803 wifi: iwlwifi: mvm=
: Fix a memory corruption issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05db7af530ebd iwlwifi: avoid voi=
d pointer arithmetic<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ff75f524dae wifi: iwlwifi: dbg=
_ini: fix structure packing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00ea2a6349733 ubi: Refuse attach=
ing if mtd&#39;s erasesize is 0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb0707fde749 HID: sony: Fix a p=
otential memory leak in sony_probe()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08afbacf61919 arm64: Add Cortex-=
A520 CPU part definition<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00da6d21ba235 drm/amd: Fix detec=
tion of _PR3 on the PCIe root port<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01ad7ccd45a65 net: prevent rewri=
te of msg_name in sock_sendmsg()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00fb3df94274b net: replace calls=
 to sock-&gt;ops-&gt;connect() with kernel_connect()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A037b54e8acea5 wifi: mwifiex: Fix=
 tlv_buf_left calculation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e80f55d6d2a9 qed/red_ll2: Fix u=
ndefined behavior bug in struct qed_ll2_info<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01e69422efcc6 vringh: don&#39;t =
use vringh_kiov_advance() in vringh_iov_xfer()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04e2f83952b1d scsi: zfcp: Fix a =
double put in zfcp_port_enqueue()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0310bca649b30 Revert &quot;clk: =
imx: pll14xx: dynamically configure PLL for 393216000/361267200Hz&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f59e63568ad block: fix use-aft=
er-free of q-&gt;q_usage_counter<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b75b017b3f37 rbd: take header_r=
wsem in rbd_dev_refresh() only when updating<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A033229d783466 rbd: decouple pare=
nt info read-in from updating rbd_dev<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ab73e7ed79d3 rbd: decouple head=
er read-in from updating rbd_dev-&gt;header<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b4ddad3fb0ea rbd: move rbd_dev_=
refresh() definition<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb1fae816c90 iommu/arm-smmu-v3:=
 Avoid constructing invalid range commands<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4edc7b5c836 iommu/arm-smmu-v3:=
 Set TTL invalidation hint better<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a98ad3adf60d arm64: Avoid repea=
ted AA64MMFR1_EL1 register read on pagefault path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aad6ba1715ec ring-buffer: Fix b=
ytes info in per_cpu buffer stats<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08012d0b05158 ring-buffer: remov=
e obsolete comment for free_buffer_page()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A065a218ca516e NFSv4: Fix a state=
 manager thread deadlock regression<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08454a2f5e930 NFS: rename nfs_cl=
ient_kset to nfs_kset<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f8b0b6a8e196 NFS: Cleanup unuse=
d rpc_clnt variable<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0686746be7bfb ASoC: tegra: Fix r=
edundant PLLA and PLLA_OUT0 updates<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a210e63844b ASoC: soc-utils: E=
xport snd_soc_dai_is_dummy() symbol<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b4f7f1556813 spi: zynqmp-gqspi:=
 fix clock imbalance on probe failure<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e514f897ad66 spi: zynqmp-gqspi:=
 Convert to platform remove callback returning void<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01edcec18cfb7 Linux 5.15.134<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A009a683023785 netfilter: nf_tabl=
es: fix kdoc warnings after gc rework<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066cb6d74f5a1 drm/meson: fix mem=
ory leak on -&gt;hpd_notify callback<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A091f1f025b6d9 fs: binfmt_elf_efp=
ic: fix personality for ELF-FDPIC<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01cae7473a6dd ata: libata-sata: =
increase PMP SRST timeout to 10s<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e74adc589922 ata: libata-core: =
Do not register PM operations for SAS ports<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04cbd55a81965 ata: libata-core: =
Fix port and device removal<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ddc525fffb44 ata: libata-core: =
Fix ata_port_request_pm() locking<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02990a195edb5 net: thunderbolt: =
Fix TCPv6 GSO checksum calculation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0132a5ae4136b bpf: Fix BTF_ID sy=
mbol generation collision in tools/<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058d560e98da5 bpf: Fix BTF_ID sy=
mbol generation collision<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f8673f651bc1 btrfs: properly re=
port 0 avail for very full file systems<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b5d00cd7db66 ring-buffer: Updat=
e &quot;shortest_full&quot; in polling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A000d2cb8066cb proc: nommu: /proc=
/&lt;pid&gt;/maps: release mmap read lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A040527ebb3e45 Revert &quot;SUNRP=
C dont update timeout value on connection reset&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2b1d486fb70 io_uring/fs: remov=
e sqe-&gt;rw_flags checking from LINKAT<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0111fe77cb13f sched/rt: Fix live=
 lock between select_fallback_rq() and RT push<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03569ad59664f kernel/sched: Modi=
fy initial boot task idle setup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A007f78e97676c i2c: i801: unregis=
ter tco_pdev in i801_probe() error path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070df8b9c59bc ata: libata-scsi: =
ignore reserved bits for REPORT SUPPORTED OPERATION CODES<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7e0c10a8c33 ALSA: hda: Disable=
 power save for solving pop issue on Lenovo ThinkCentre M70q<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c5fd85fb01f netfilter: nf_tabl=
es: disallow rule removal from chain binding<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03936e8714907 nilfs2: fix potent=
ial use after free in nilfs_gccache_submit_read_data()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02b837f13a818 serial: 8250_port:=
 Check IRQ data before use<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a48d2bcd23f2 Revert &quot;tty: =
n_gsm: fix UAF in gsm_cleanup_mux&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A078e70c6238d2 misc: rtsx: Fix so=
me platforms can not boot and move the l1ss judgment to probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f090a8b4d2e3 x86/srso: Add SRSO=
 mitigation for Hygon processors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f5a604757aa8 iommu/arm-smmu-v3:=
 Fix soft lockup triggered by arm_smmu_mm_invalidate_range<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0efce75bd2dbc Smack:- Use overla=
y inode label in smack_inode_copy_up()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00e3450487f99 smack: Retrieve tr=
ansmuting information in smack_inode_getsecurity()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03586b3feed1b smack: Record tran=
smuting in smk_transmuted<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09690ad557d94 nvme-pci: always r=
eturn an ERR_PTR from nvme_pci_alloc_dev<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03c29c6e8cd7c scsi: qla2xxx: Fix=
 NULL pointer dereference in target mode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06e5e4223c897 i40e: fix potentia=
l NULL pointer dereferencing of pf-&gt;vf i40e_sync_vsi_filters()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aff3994d4bdd watchdog: iTCO_wdt=
: Set NO_REBOOT if the watchdog is not already running<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A083a30e945571 watchdog: iTCO_wdt=
: No need to stop the timer in probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01e8c573f50a7 nvme-pci: do not s=
et the NUMA node of device if it has none<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0182d13dadb03 nvme-pci: factor o=
ut a nvme_pci_alloc_dev helper<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0af58072e867c nvme-pci: factor t=
he iod mempool creation into a helper<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8bc44936f2c cgroup: Fix suspic=
ious rcu_dereference_check() usage warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ce6b88a5853d sched/cpuacct: Opt=
imize away RCU read lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b1deb155524e perf build: Define=
 YYNOMEM as YYNOABORT for bison &lt; 3.81<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A086e65ffc4d0f fbdev/sh7760fb: De=
pend on FB=3Dy<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04bf0044fe43f ncsi: Propagate ca=
rrier gain/loss events to the NCSI controller<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0288990ec3580 powerpc/watchpoint=
s: Annotate atomic context in more places<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A047a94e87f00c powerpc/watchpoint=
: Disable pagefaults when getting user instruction<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07eb09f70d9c2 powerpc/watchpoint=
s: Disable preemption in thread_change_pc()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0134b01a39077 media: vb2: frame_=
vector.c: replace WARN_ONCE with a comment<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0baf7cf0fdb83 ASoC: imx-rpmsg: S=
et ignore_pmdown_time for dai_link<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09da93c74490c bpf: Clarify error=
 expectations from bpf_clone_redirect<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1a8b79ad768 ASoC: fsl: imx-pcm=
-rpmsg: Add SNDRV_PCM_INFO_BATCH flag<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A045e028accbdf spi: stm32: add a =
delay before SPI disable<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A025850bf83dcd spi: nxp-fspi: res=
et the FLSHxCR1 registers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A050662d21e414 ata: libata-eh: do=
 not clear ATA_PFLAG_EH_PENDING in ata_eh_reset()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08e3cdab909db smb3: correct plac=
es where ENOTSUPP is used instead of preferred EOPNOTSUPP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d540a4370aba scsi: pm80xx: Avoi=
d leaking tags when processing OPC_INB_SET_CONTROLLER_CONFIG command<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fde57d7ba9b3 scsi: pm80xx: Use =
phy-specific SAS address when sending PHY_START command<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a1589abd7c4a drm/amdgpu: Handle=
 null atom context in VBIOS info ioctl<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd334cfd8412 drm/amd/display: D=
on&#39;t check registers, if using AUX BL control<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8bc0f6357af platform/mellanox:=
 mlxbf-bootctl: add NET dependency into Kconfig<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0344f2f3e61a9 ring-buffer: Do no=
t attempt to read past &quot;commit&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03db9b420709b selftests: fix dep=
endency checker script<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04aa90e624c30 btrfs: improve err=
or message after failure to add delayed dir index item<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A053e7c559b7bf ring-buffer: Avoid=
 softlockup in ring_buffer_resize()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b4874f72cf57 selftests/ftrace: =
Correctly enable event in <a href=3D"http://instance-event.tc" rel=3D"noref=
errer noreferrer" target=3D"_blank">instance-event.tc</a><br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08c5c9ecbfa8d scsi: ufs: core: M=
ove __ufshcd_send_uic_cmd() outside host_lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e08e61d50a30 scsi: qedf: Add sy=
nchronization between I/O completions and abort<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ada7fcba2d6a parisc: irq: Make =
irq_stack_union static to avoid sparse warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b7e376a26b0c parisc: drivers: F=
ix sparse warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d8c6fad00282 parisc: iosapic.c:=
 Fix sparse warnings<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01ecdcfec4e4a parisc: sba: Fix c=
ompile warning wrt list of SBA devices<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bd1ec7f9983b spi: sun6i: fix ra=
ce between DMA RX transfer completion and RX FIFO drain<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff05ed4ae214 spi: sun6i: reduce=
 DMA RX transfer width to single byte<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ac0d06809934 dma-debug: don&#39=
;t call __dma_entry_alloc_check_leak() under free_entries_lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d938c3d278d5 i2c: npcm7xx: Fix =
callback completion ordering<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c615323a745 gpio: pmic-eic-spr=
d: Add can_sleep flag for PMIC EIC chip<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02a47ee15a6ab soc: imx8m: Enable=
 OCOTP clock for imx8mm before reading registers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c59b882b9b3 xtensa: boot/lib: =
fix function prototypes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070460e81e2d1 xtensa: boot: don&=
#39;t add include-dirs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc51434b6612 xtensa: iss/networ=
k: make functions static<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08e0f78a84f64 xtensa: add defaul=
t definition for XCHAL_HAVE_DIV32<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be57fc50dc3c firmware: imx-dsp:=
 Fix an error handling path in imx_dsp_setup_channels()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01df81ea9e4db power: supply: ucs=
1002: fix error code in ucs1002_get_property()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06937e44ffb91 bus: ti-sysc: Fix =
SYSC_QUIRK_SWSUP_SIDLE_ACT handling for uart wake-up<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00e75aa86a7d0 ARM: dts: ti: omap=
: motorola-mapphone: Fix abe_clkctrl warning on boot<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01b39eae11752 ARM: dts: ti: omap=
: Fix bandgap thermal cells addressing for omap3/4<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fcbf770c66ef ARM: dts: omap: co=
rrect indentation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f5e12de36ab3 treewide: Replace =
GPLv2 boilerplate/reference with SPDX - gpl-2.0_56.RULE (part 1)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06829bc7978e0 clk: tegra: fix er=
ror return case for recalc_rate<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A078277b096d4c bus: ti-sysc: Fix =
missing AM35xx SoC matching<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05435a49b3b66 bus: ti-sysc: Use =
fsleep() instead of usleep_range() in sysc_reset()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c39df101d8ca drm/bridge: ti-sn6=
5dsi83: Do not generate HFP/HBP/HSA and EOT packet<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04bf10fd51ca5 MIPS: Alchemy: onl=
y build mmc support helpers if au1xmmc is enabled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d2640d86876e btrfs: reset desti=
nation buffer when read_extent_buffer() gets invalid range<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01a541999f31f scsi: qla2xxx: Use=
 raw_smp_processor_id() instead of smp_processor_id()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0532a23960566 scsi: qla2xxx: Sel=
ect qpair depending on which CPU post_cmd() gets called<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06642b4eb083b ata: ahci: Add Elk=
hart Lake AHCI controller<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0072611960741 ata: ahci: Rename =
board_ahci_mobile<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08274154712a0 ata: ahci: Add sup=
port for AMD A85 FCH (Hudson D4)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bd69c74dca70 ata: libata: Renam=
e link flag ATA_LFLAG_NO_DB_DELAY<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f5ba6d9d6bec netfilter: nft_ext=
hdr: Fix non-linear header modification<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ca3a1b0f474 netfilter: exthdr:=
 add support for tcp option removal<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fb6f65780c9c Input: i8042 - add=
 quirk for TUXEDO Gemini 17 Gen1/Clevo PD70PN<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0191fc23cfa9a Input: i8042 - ren=
ame i8042-x86ia64io.h to i8042-acpipnpio.h<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05d2b57c0bc40 xfs: fix xfs_inode=
gc_stop racing with mod_delayed_work<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0657f842859c4 xfs: disable reapi=
ng in fscounters scrub<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08444467eadb2 xfs: check that pe=
r-cpu inodegc workers actually run on that cpu<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A067db9ecb84d5 xfs: explicitly sp=
ecify cpu when forcing inodegc delayed work to run immediately<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A099e65f075e6c xfs: introduce xfs=
_inodegc_push()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02df381963240 xfs: bound maximum=
 wait time for inodegc work<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A008dc21596751 i2c: mux: gpio: Ad=
d missing fwnode_handle_put()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f912d9d87421 i2c: mux: gpio: Re=
place custom acpi_get_local_address()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01aa39eee57f6 i2c: mux: demux-pi=
nctrl: check the return value of devm_kstrdup()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09910b1411e7e gpio: tb10x: Fix a=
n error handling path in tb10x_gpio_probe()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d7acb7031758 Fix up backport of=
 136191703038 (&quot;interconnect: Teach lockdep about icc_bw_lock order&qu=
ot;)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d645206e9be2 igc: Expose tx-use=
cs coalesce setting to user<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d7a2bf6faa82 bnxt_en: Flush XDP=
 for bnxt_poll_nitroa0()&#39;s NAPI<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056d2418a079a net: ena: Flush XD=
P packets on error.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A007b569051f6e locking/seqlock: D=
o the lockdep annotation before locking in do_write_seqcount_begin_nested()=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a70dbdede0c7 netfilter: ipset: =
Fix race between IPSET_CMD_CREATE and IPSET_CMD_SWAP<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00dcc9b4097d8 netfilter: nf_tabl=
es: disable toggling dormant table state more than once<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea82139e6e35 net: rds: Fix poss=
ible NULL-pointer dereference<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd05eec2ee0c team: fix null-ptr=
-deref when team device type is changed<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08bc97117b51d net: bridge: use D=
EV_STATS_INC()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d3939cccb20 net: hns3: add 5ms=
 delay before clear firmware reset irq source<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d6d182d856d0 net: hns3: fix fai=
l to delete tc flower rules during reset issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c47b238f4ec net: hns3: only en=
able unicast promisc when mac table full<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A096af9a55b782 net: hns3: fix GRE=
 checksum offload issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A013ea4b92e875 x86/srso: Fix SBPB=
 enablement for spec_rstack_overflow=3Doff<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e2c34afe8362 x86/srso: Fix srso=
_show_state() side effect<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A021efa88e777f platform/x86: inte=
l_scu_ipc: Fail IPC send if still busy<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a5d236b52cf platform/x86: inte=
l_scu_ipc: Don&#39;t override scu in intel_scu_ipc_dev_simple_command()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ab78000c38b4 platform/x86: inte=
l_scu_ipc: Check status upon timeout in ipc_wait_for_interrupt()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A047329633b3f0 platform/x86: inte=
l_scu_ipc: Check status after timeout in busy_loop()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A026df9ab5de30 dccp: fix dccp_v4_=
err()/dccp_v6_err() again<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03b14e8431855 powerpc/perf/hv-24=
x7: Update domain value check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08860d354f653 ipv4: fix null-der=
ef in ipv4_link_failure<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c196ecd3f893 igc: Fix infinite =
initialization loop with early XDP redirect<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2d69dcb6ccb ionic: fix 16bit m=
ath issue when PAGE_SIZE &gt;=3D 64KB<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03796e449a03e i40e: Fix VF VLAN =
offloading when port VLAN is configured<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a628f3b5cd8d i40e: Add VF VLAN =
pruning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07a9eee3b5d4d iavf: do not proce=
ss adminq tasks when __IAVF_IN_REMOVE_TASK is set<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f3c6a17900e8 ASoC: imx-audmix: =
Fix return error with devm_clk_get()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f90a7b9586d7 net/core: Fix ETH_=
P_1588 flow dissector<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A055629e616452 selftests: tls: sw=
ap the TX and RX sockets in some tests<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0acabf5df49aa bpf: Avoid deadloc=
k when using queue and stack maps from NMI<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c6e44f4c31c5 netfilter: nf_tabl=
es: disallow element removal on anonymous sets<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06a8de7775329 ASoC: meson: spdif=
in: start hw on dai probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef99506eaf1d netfilter: nf_tabl=
es: fix memleak when more than 255 elements expired<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d7a00b904da netfilter: nft_set=
_hash: try later when GC hits EAGAIN on iteration<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A083d3a4607c58 netfilter: nft_set=
_pipapo: stop GC iteration if GC transaction allocation fails<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0949369f9f0d9 netfilter: nft_set=
_pipapo: call nft_trans_gc_queue_sync() in catchall GC<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02e6846b613fa netfilter: nft_set=
_rbtree: use read spinlock to avoid datapath contention<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09af7dfb3c9d7 netfilter: nft_set=
_rbtree: skip sync GC for new elements in this transaction<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09366966caf1a netfilter: nf_tabl=
es: defer gc run if previous batch is still pending<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0082791b42123 netfilter: nf_tabl=
es: use correct lock to protect gc_list<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b44a459c6561 netfilter: nf_tabl=
es: GC transaction race with abort path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024707fa1e1f9 netfilter: nf_tabl=
es: GC transaction race with netns dismantle<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06796800f0d8e netfilter: nf_tabl=
es: fix GC transaction races with netns and netlink event exit path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0af78b0489e88 netfilter: nf_tabl=
es: don&#39;t fail inserts if duplicate has expired<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f24fe69e3ca netfilter: nf_tabl=
es: remove busy mark and gc batch API<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b290795bd26f netfilter: nft_set=
_hash: mark set element as dead when deleting from packet path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0479a2cf52593 netfilter: nf_tabl=
es: adapt set backend to use GC transaction API<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d19e8bf3ea41 netfilter: nf_tabl=
es: GC transaction API to avoid race with control plane<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c7e658a36f8 netfilter: nf_tabl=
es: don&#39;t skip expired elements during walk<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2d1125ee04e tracing: Have even=
t inject files inc the trace array ref count<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06b6c088c38f7 ext4: do not let f=
strim block system suspend<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9d3bb58da95 ext4: move setting=
 of trimmed bit into ext4_try_to_trim_range()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d91abea15c61 ext4: replace the =
traditional ternary conditional operator with with max()/min()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0656f0495e4ac ext4: change s_las=
t_trim_minblks type to unsigned long<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be57857fb3c3 ext4: scope ret lo=
cally in ext4_try_to_trim_range()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e832b55881a1 ata: libahci: clea=
r pending interrupt status<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6189f373151 ata: ahci: Drop po=
intless VPRINTK() calls and convert the remaining ones<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fa6d449e4d02 tracing: Increase =
trace array ref count on enable and filter files<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07a688f191a17 tracing: Make trac=
e_marker{,_raw} stream-like<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A068fc0e75c793 NFSv4.1: fix pnfs =
MDS=3DDS session trunking<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00ff78c455494 NFSv4.1: use EXCHG=
ID4_FLAG_USE_PNFS_DS for DS server<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d381bfe13895 SUNRPC: Mark the c=
red for revalidation if the server rejects it<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f1c434ddafe6 NFS/pNFS: Report E=
INVAL errors from connect() to the server<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c0a7e1f2a6a NFS: More fixes fo=
r nfs_direct_write_reschedule_io()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a354b4a367f5 NFS: Use the corre=
ct commit info in nfs_join_page_group()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b911329317b4 Linux 5.15.133<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e3a29b80e9e6 interconnect: Teac=
h lockdep about icc_bw_lock order<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c6244cd00c97 drm/amd/display: e=
nable cursor degamma for DCN3+ DRM legacy gamma<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A008569c92f7f3 net/sched: Retire =
rsvp classifier<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06b080fa8aae1 drm/amdgpu: fix am=
dgpu_cs_p1_user_fence<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06386a2d4dc01 drm/amd/display: f=
ix the white screen issue when &gt;=3D 64GB DRAM<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e04b7073bdce ext4: fix rec_len =
verify error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A093763d58705a scsi: pm8001: Setu=
p IRQs on resume<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072a22696cf19 scsi: megaraid_sas=
: Fix deadlock on firmware crashdump<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A054603e8a88bc ata: libata: disal=
low dev-initiated LPM transitions to unsupported states<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A001c7c38a90bc i2c: aspeed: Reset=
 the i2c controller when timeout occurs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0763d39f4e8fb tracefs: Add missi=
ng lockdown check to tracefs_create_dir()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bf195968e362 nfsd: fix change_i=
nfo in NFSv4 RENAME replies<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bf38c1d29f8b tracing: Have opti=
on files inc the trace array ref count<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A085ad4688b7a7 tracing: Have curr=
ent_trace inc the trace array ref count<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0962e6723239b tracing: Have trac=
ing_max_latency inc the trace array ref count<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0380bbd46d61c btrfs: release pat=
h before inode lookup during the ino lookup ioctl<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0779c3cf2749c btrfs: fix lockdep=
 splat and potential deadlock after failure running delayed items<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9c78afcee46 ovl: fix incorrect=
 fdput() on aio completion<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A005a7289a5d4b ovl: fix failed co=
pyup of fileattr on a symlink<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08bcb80293be7 attr: block mode c=
hanges of symlinks<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d30af15e460f md/raid1: fix erro=
r: ISO C90 forbids mixed declarations<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0abdfde037712 samples/hw_breakpo=
int: fix building without module unloading<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058787ff3d023 x86/purgatory: Rem=
ove LTO flags<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08abf1ec895d5 x86/boot/compresse=
d: Reserve more memory for page tables<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1a27664fcf5 scsi: lpfc: Fix th=
e NULL vs IS_ERR() bug for debugfs_create_file()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0fd24f1fae0 selftests: tracing=
: Fix to unmount tracefs for recovering environment<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dded6b81ad68 scsi: qla2xxx: Fix=
 NULL vs IS_ERR() bug for debugfs_create_dir()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01d5caeac9655 drm: gm12u320: Fix=
 the timeout usage for usb_bulk_msg()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b9f0572b38c1 btrfs: compare the=
 correct fsid/metadata_uuid in btrfs_validate_super<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cba491ee38e2 btrfs: add a helpe=
r to read the superblock metadata_uuid<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb3671a2eeac btrfs: move btrfs_=
pinned_by_swapfile prototype into volumes.h<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f16fe29368fd perf test shell st=
at_bpf_counters: Fix test on Intel<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ad73216e006f perf test: Remove =
bash construct from stat_bpf_counters.sh test<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d8f81baeb9eb MIPS: Use &quot;gr=
ep -E&quot; instead of &quot;egrep&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dfe961b1e476 mtd: rawnand: brcm=
nand: Fix ECC level field setting for v7.2 controller<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056cf9f446b33 mtd: rawnand: brcm=
nand: Allow SoC to provide I/O operations<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A034fcb59437a7 jbd2: correct the =
end of the journal recovery scan range<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a4605449cc9f jbd2: rename jbd_d=
ebug() to jbd2_debug()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db6c90f2671c jbd2: kill t_handl=
e_lock transaction spinlock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9270898222a jbd2: fix use-afte=
r-free of transaction_t race<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0412dd1c24b jbd2: refactor wai=
t logic for transaction updates into a common function<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f980bf1586ef printk: Consolidat=
e console deferred printing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09be2957f014d interconnect: Fix =
locking for runpm vs reclaim<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f3f6bf22a4f5 kobject: Add sanit=
y check for kset-&gt;kobj.ktype in kset_register()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A081bbe6667024 media: pci: ipu3-c=
io2: Initialise timing struct to avoid a compiler warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4ef3c9c7947 usb: ehci: add wor=
karound for chipidea PORTSC.PEC bug<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c829d25e26fb serial: cpm_uart: =
Avoid suspicious locking<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05353df78c226 scsi: target: iscs=
i: Fix buffer overflow in lio_target_nacl_info_show()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b97aaf9faf89 tools: iio: iio_ge=
neric_buffer: Fix some integer type and calculation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A060a71fd1910e usb: gadget: fsl_q=
e_udc: validate endpoint index for ch9 udc<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c861a61be6d3 usb: cdns3: Put th=
e cdns set active part outside the spin lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0930c60e13947 media: pci: cx2388=
5: replace BUG with error return<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A048bb6a9fa5cb media: tuners: qt1=
010: replace BUG_ON with a regular error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02a33fc57133d media: dvb-usb-v2:=
 gl861: Fix null-ptr-deref in gl861_i2c_master_xfer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05b1ea100ad36 media: az6007: Fix=
 null-ptr-deref in az6007_i2c_xfer()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03dd5846a8739 media: anysee: fix=
 null-ptr-deref in anysee_master_xfer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0033b0c0780ad media: af9005: Fix=
 null-ptr-deref in af9005_i2c_xfer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0903566208ae6 media: dw2102: Fix=
 null-ptr-deref in dw2102_i2c_transfer()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d9ef84a7c222 media: dvb-usb-v2:=
 af9035: Fix null-ptr-deref in af9035_i2c_master_xfer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca49cef3acaa PCI: fu740: Set th=
e number of MSI vectors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d35e7ae10eb8 powerpc/pseries: f=
ix possible memory leak in ibmebus_bus_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A046870eea5496 ARM: 9317/1: kexec=
: Make smp stop calls asynchronous<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef7311101ca4 jfs: fix invalid f=
ree of JFS_IP(ipimap)-&gt;i_imap in diUnmount<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aa5b019a3e0f fs/jfs: prevent do=
uble-free in dbUnmount() after failed jfs_remount()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ac65c29b6c2 ext2: fix datatype=
 of block number in ext2_xattr_set2()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04f96c0665f9f md: raid1: fix pot=
ential OOB in raid1_remove_disk()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f3e9fc7b02b9 bus: ti-sysc: Conf=
igure uart quirks for k3 SoC<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03157aa794c75 drm/exynos: fix a =
possible null-pointer dereference due to data race in exynos_drm_crtc_atomi=
c_disable()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A078bc9d25997a drm/amd/display: B=
locking invalid 420 modes on HDMI TMDS for DCN31<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05eca70c14b31 ALSA: hda: intel-d=
sp-cfg: add LunarLake support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e8ba418d4926 samples/hw_breakpo=
int: Fix kernel BUG &#39;invalid opcode: 0000&#39;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0961df5a3f5cc arm64: dts: qcom: =
sm8250-edo: correct ramoops pmsg-size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A049cd54900078 arm64: dts: qcom: =
sm8150-kumano: correct ramoops pmsg-size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01e0a38bb840a arm64: dts: qcom: =
sm6125-pdx201: correct ramoops pmsg-size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0201071956ec6 drm/bridge: tc3587=
62: Instruct DSI host to generate HSE packets<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c64ee9dd3358 wifi: mac80211_hws=
im: drop short frames<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066594a1e6ddd netfilter: ebtable=
s: fix fortify warnings in size_entry_mwt()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fedd9377dd9c wifi: mac80211: ch=
eck S1G action frame size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e08333e2abae alx: fix OOB-read =
compiler warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02b0a093cdf59 mmc: sdhci-esdhc-i=
mx: improve ESDHC_FLAG_ERR010450<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a1f87f0ca76 tpm_tis: Resend co=
mmand to recover from data transfer errors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A067589d247909 crypto: lib/mpi - =
avoid null pointer deref in mpi_cmp_ui()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0389106425dee wifi: wil6210: fix=
 fortify warnings<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ddb8f358b5e0 wifi: mwifiex: fix=
 fortify warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7ebe459c72e wifi: ath9k: fix p=
rintk specifier<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03de6b6ab69e2 wifi: ath9k: fix f=
ortify warnings<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06b0adfafb073 crypto: lrw,xts - =
Replace strlcpy with strscpy<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dc100292e503 devlink: remove re=
load failed checks in params get/set callbacks<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07b7964cd9db3 ACPI: x86: s2idle:=
 Catch multiple ACPI_TYPE_PACKAGE objects<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eda268b5b7ad hw_breakpoint: fix=
 single-stepping when using bpf_overflow_handler<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06e743b7261ef perf/imx_ddr: spee=
d up overflow frequency of cycle<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9a2c79c2970 perf/smmuv3: Enabl=
e HiSilicon Erratum 162001900 quirk for HIP08/09<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ed1afb597280 ACPI: video: Add b=
acklight=3Dnative DMI quirk for Lenovo Ideapad Z470<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f685311dbe05 scftorture: Forgiv=
e memory-allocation failure if KASAN<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04f03fba096bf rcuscale: Move rcu=
_scale_writer() schedule_timeout_uninterruptible() to _idle()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f1ceff37ac6b kernel/fork: bewar=
e of __put_task_struct() calling context<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0430787056dd3 ACPICA: Add AML_NO=
_OPERAND_RESOLVE flag to Timer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0766e56faddbe locks: fix KASAN: =
use-after-free in trace_event_raw_event_filelock_lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06994f806c6d1 btrfs: output extr=
a debug info if we failed to find an inline backref<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A071eeddcad734 autofs: fix memory=
 leak of waitqueues in autofs_catatonic_mode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A035ecaa3632bf Linux 5.15.132<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c0d79f3366a pcd: fix error cod=
es in pcd_init_unit()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0893978f1b4d1 drm/amd/display: F=
ix a bug when searching for insert_above_mpcc<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b8e09b39ef3 MIPS: Only fiddle =
with CHECKFLAGS if `need-compiler&#39;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A055d2e7c1ab8e kcm: Fix error han=
dling for SOCK_DGRAM in kcm_sendmsg().<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e80228b27487 ixgbe: fix timesta=
mp configuration code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05b55dac919ec ipv6: fix ip6_sock=
_set_addr_preferences() typo<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0481bd6dcc5fe net/tls: do not fr=
ee tls_rec on async operation in bpf_exec_tx_verdict()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03600c0dc0deb platform/mellanox:=
 mlxbf-pmc: Fix reading of unprogrammed events<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A007c0abc80604 platform/mellanox:=
 mlxbf-pmc: Fix potential buffer overflows<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c34ea34516d platform/mellanox:=
 mlxbf-tmfifo: Drop jumbo frames<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0694035201aac platform/mellanox:=
 mlxbf-tmfifo: Drop the Rx packet if no more descriptors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A097275339c34c kcm: Fix memory le=
ak in error path of kcm_sendmsg()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0864da4a5d5eb r8152: check budge=
t for r8152_poll()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fbdc4e9908b2 net: dsa: sja1105:=
 hide all multicast addresses from &quot;bridge fdb show&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06a4480c5e6eb hsr: Fix uninit-va=
lue access in fill_frame_info()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0072324cfab9b net: ethernet: mtk=
_eth_soc: fix possible NULL pointer dereference in mtk_hwlro_get_fdir_all()=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05bb09dddc724 net: ethernet: mvp=
p2_main: fix possible OOB write in mvpp2_ethtool_get_rxnfc()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A006b4934ab2b5 net/smc: use smc_l=
gr_list.lock to protect smc_lgr_list.list iterate in smcr_port_add<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aea3801c234d kselftest/runner.s=
h: Propagate SIGTERM to runner child<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02f1e86014d0c net: ipv4: fix one=
 memleak in __inet_del_ifa()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f086e859ddc2 ARM: dts: BCM5301X=
: Extend RAM to full 256MB for Linksys EA6500 V2<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08173d9027031 ARM: dts: samsung:=
 exynos4210-i9100: Fix LCD screen&#39;s physical size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0072cd213c64f block: don&#39;t a=
dd or resize partition on the disk with GENHD_FL_NO_PART<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c6ce1c5dd327 block: rename GENH=
D_FL_NO_PART_SCAN to GENHD_FL_NO_PART<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c06a7f6b41c block: move GENHD_=
FL_BLOCK_EVENTS_ON_EXCL_WRITE to disk-&gt;event_flags<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08247ff0d5036 block: move GENHD_=
FL_NATIVE_CAPACITY to disk-&gt;state<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ad42b999a42 pcd: cleanup initi=
alization<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07607bc7fe6cc pcd: move the iden=
tify buffer into pcd_identify<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0242bbe218814 perf hists browser=
: Fix the number of entries for &#39;e&#39; key<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04d7a8a44e030 perf tools: Handle=
 old data in PERF_RECORD_ATTR<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8f91f480c62 perf hists browser=
: Fix hierarchy mode header<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04ee1cf2a5bcc MIPS: Fix CONFIG_C=
PU_DADDI_WORKAROUNDS `modules_install&#39; regression<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0df4d8d5ab647 drm/amd/display: p=
revent potential division by zero errors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03b51d016bbbf mtd: rawnand: brcm=
nand: Fix potential false time out warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02353b7bb61e4 mtd: rawnand: brcm=
nand: Fix potential out-of-bounds access in oob write<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b59ff750bf80 mtd: rawnand: brcm=
nand: Fix crash during the panic_write<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca5218aef9e5 btrfs: use the cor=
rect superblock to compare fsid in btrfs_validate_super<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f3260733894a btrfs: don&#39;t s=
tart transaction when joining with TRANS_JOIN_NOSTART<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ef0e8b812e0 btrfs: free qgroup=
 rsv on io failure<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05fd6f40d17e8 fuse: nlookup miss=
ing decrement in fuse_direntplus_link<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A065b6890c3d01 ata: pata_ftide010=
: Add missing MODULE_DESCRIPTION<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b62825dc6c3 ata: sata_gemini: =
Add missing MODULE_DESCRIPTION<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A081dd61cb1caa ata: pata_falcon: =
fix IO base selection for Q40<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020bc2c470369 lib: test_scanf: A=
dd explicit type cast to result initialization in test_number_prefix()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04315b4a95ecf ext4: add correct =
group descriptors and reserved GDT blocks to system zone<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef5fea70e591 jbd2: check &#39;j=
h-&gt;b_transaction&#39; before removing it from checkpoint<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06778a3857266 jbd2: fix checkpoi=
nt cleanup performance regression<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06b195e07a2cf dmaengine: sh: rz-=
dmac: Fix destination and source data size setting<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00476f2016ddc ARC: atomics: Add =
compiler barrier to atomic operations...<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03375186d5e3f net/mlx5: Free IRQ=
 rmap and notifier on kernel shutdown<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02348a375ee16 sh: boards: Fix CE=
U buffer size passed to dma_declare_coherent_memory()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f5160dc17e81 net: hns3: remove =
GSO partial feature bit<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06d548b7cb216 net: hns3: fix the=
 port information display when sfp is absent<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc3c67e08169 net: hns3: fix inv=
alid mutex between tc qdisc and dcb ets command issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02c9643fa6360 net: hns3: fix deb=
ugfs concurrency issue between kfree buffer and read<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08bfa87cf4a86 net: hns3: fix byt=
e order conversion issue in hclge_dbg_fd_tcam_read()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A019280e8dfb52 netfilter: nfnetli=
nk_osf: avoid OOB read<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01ad7b189cc14 netfilter: nftable=
s: exthdr: fix 4-byte stack OOB write<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0347f765176db net: dsa: sja1105:=
 complete tc-cbs offload support on SJA1110<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb4494cfe4b7 net: dsa: sja1105:=
 fix -ENOSPC when replacing the same tc-cbs too many times<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A077b850b84d21 net: dsa: sja1105:=
 fix bandwidth discrepancy between tc-cbs software and offload<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d11109c03d6e ip_tunnels: use DE=
V_STATS_INC()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fcfb5842ef9c idr: fix param nam=
e in idr_alloc_cyclic() doc<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0131cd74a8e38 s390/zcrypt: don&#=
39;t leak memory if dev_set_name() fails<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A012de76fdddb5 igb: Change IGB_MI=
N to allow set rx/tx value between 64 and 80<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c2f90b1c213 igbvf: Change IGBV=
F_MIN to allow set rx/tx value between 64 and 80<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f4c5640d6d38 igc: Change IGC_MI=
N to allow set rx/tx value between 64 and 80<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09210b3dd74ac octeontx2-af: Fix =
truncation of smq in CN10K NIX AQ enqueue mbox handler<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01840f08c2a1b kcm: Destroy mutex=
 in kcm_exit_net()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ea277b2c626 net: sched: sch_qf=
q: Fix UAF in qfq_dequeue()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03868de7c5361 af_unix: Fix data =
race around sk-&gt;sk_err.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d95456660fae af_unix: Fix data-=
races around sk-&gt;sk_shutdown.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e5edc6e44a88 af_unix: Fix data-=
race around unix_tot_inflight.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09151ed4b0061 af_unix: Fix data-=
races around user-&gt;unix_inflight.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0907fbed65cec net: phy: micrel: =
Correct bit assignments for phy_device flags<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05d2d3f2300c3 net: ipv6/addrconf=
: avoid integer underflow in ipv6_create_tempaddr<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A077dd55f5ec6a veth: Fixing trans=
mit return status for dropped packets<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056603b2c82e3 igb: disable virtu=
alization features on 82580<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0149bc7834d6f ipv4: ignore dst h=
int for multipath routes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e18b49495a52 drm/i915/gvt: Drop=
 unused helper intel_vgpu_reset_gtt()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05979985f2d6b xsk: Fix xsk_diag =
use-after-free error during socket cleanup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A049acc5c5b280 net: fib: avoid wa=
rn splat in flow dissector<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ed4e0adfa407 net: read sk-&gt;s=
k_family once in sk_mc_loop()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0b483a0584f ipv4: annotate dat=
a-races around fi-&gt;fib_dead<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A074df0319e4e2 sctp: annotate dat=
a-races around sk-&gt;sk_wmem_queued<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0973a4c302d7f net/sched: fq_pie:=
 avoid stalls in fq_pie_timer()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05e22217c1142 pwm: lpc32xx: Remo=
ve handling of PWM channels<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0676152264dec watchdog: intel-mi=
d_wdt: add MODULE_ALIAS() to allow auto-load<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d6aa2be1379d perf top: Don&#39;=
t pass an ERR_PTR() directly to perf_session__delete()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A079bd17c99ec9 perf vendor events=
: Drop some of the JSON/events for power10 platform<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01356eaceef34 perf vendor events=
: Update the JSON/events descriptions for power10 platform<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024481d5c7413 x86/virt: Drop unn=
ecessary check on extended CPUID level in cpu_has_svm()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06e9863165674 perf annotate bpf:=
 Don&#39;t enclose non-debug code with an assert()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0184be0d59242 Input: tca6416-key=
pad - fix interrupt enable disbalance<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b79f5a19cfb Input: tca6416-key=
pad - always expect proper IRQ number in i2c client<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01e3167aa4ba2 backlight: gpio_ba=
cklight: Drop output GPIO direction check for initial power state<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06fc8bdc3cf4c pwm: atmel-tcb: Fi=
x resource freeing in error path and remove<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06b2bb1a1a63c pwm: atmel-tcb: Ha=
rmonize resource allocation order<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4734ef765eb pwm: atmel-tcb: Co=
nvert to platform remove callback returning void<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c3bc668581e7 perf trace: Really=
 free the evsel-&gt;priv area<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08e96f741b328 perf trace: Use zf=
ree() to reduce chances of use after free<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0414cf7a2cc87 kconfig: fix possi=
ble buffer overflow<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be9ce0dbde4f gfs2: low-memory f=
orced flush fixes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0751facd3634c gfs2: Switch to wa=
it_event in gfs2_logd<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d0245b066971 kbuild: do not run=
 depmod for &#39;make modules_sign&#39;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A005333a6a21e3 bus: mhi: host: Sk=
ip MHI reset if device is in RDDM<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e2964c98ec31 NFSv4/pnfs: minor =
fix for cleanup path in nfs4_get_device_info<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0da302f1d476a NFS: Fix a potenti=
al data corruption<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00db19df21be5 clk: qcom: mss-sc7=
180: fix missing resume during probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f64f682be7c8 clk: qcom: q6sstop=
-qcs404: fix missing resume during probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b2f39b813d1e soc: qcom: qmi_enc=
dec: Restrict string length in decode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e61db8922631 clk: qcom: gcc-mdm=
9615: use proper parent for pll0_vote clock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8474506c912 clk: imx: pll14xx:=
 dynamically configure PLL for 393216000/361267200Hz<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a69b951c8398 dt-bindings: clock=
: xlnx,versal-clk: drop select:false<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ead2436cf05e pinctrl: cherryvie=
w: fix address_space_handler() argument<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08859f58c1790 parisc: led: Reduc=
e CPU overhead for disk &amp; lan LED computation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02655e1d970cf parisc: led: Fix L=
AN receive and transmit LEDs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ad44409cd3b lib/test_meminit: =
allocate pages up to order MAX_ORDER<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02d8138cea71d clk: qcom: turingc=
c-qcs404: fix missing resume during probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09f5db4ab19f8 drm/ast: Fix DRAM =
init on AST2200<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cfc47807a482 clk: qcom: camcc-s=
c7180: fix async resume during probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0309c27162afe fbdev/ep93xx-fb: D=
o not assign to struct <a href=3D"http://fb_info.dev" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">fb_info.dev</a><br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04316e951f164 scsi: qla2xxx: Fix=
 firmware resource tracking<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07b89c3727bff scsi: qla2xxx: Err=
or code did not return to upper layer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A015a71bb25beb scsi: qla2xxx: Fix=
 smatch warn for qla_init_iocb_limit()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0106392156273 scsi: qla2xxx: Flu=
sh mailbox commands on chip reset<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0def49a05aef4 scsi: qla2xxx: Rem=
ove unsupported ql2xenabledif option<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be12c9f4c60c scsi: qla2xxx: Fix=
 TMF leak through<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04322f3de9f21 scsi: qla2xxx: Fix=
 session hang in gnl<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a4708402c458 scsi: qla2xxx: Tur=
n off noisy message log<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0453b0cf506 scsi: qla2xxx: Fix=
 erroneous link up failure<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05934b2125f5b scsi: qla2xxx: Fix=
 command flush during TMF<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04a16a46c8481 scsi: qla2xxx: fix=
 inconsistent TMF timeout<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f1ea164be545 scsi: qla2xxx: Fix=
 deletion race condition<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0683945b17724 scsi: qla2xxx: Lim=
it TMF to 8 per function<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fde268c234d1 scsi: qla2xxx: Adj=
ust IOCB resource on qpair create<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c29848249f78 io_uring: break io=
polling on signal<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00def123f1254 io_uring: break ou=
t of iowq iopoll on teardown<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01a0aba2bf293 io_uring: always l=
ock in io_apoll_task_func<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02920cc4c64a1 net/ipv6: SKB symm=
etric hash should incorporate transport ports<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0529bcc70c49c udf: initialize ne=
wblock to 0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fae2d591f3cb Revert &quot;drm/a=
mdgpu: install stub fence into potential unused fence pointers&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f01e21d6c7ed md/md-bitmap: remo=
ve unnecessary local variable in backlog_store()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A099a8d14d7965 tracing: Zero the =
pipe cpumask on alloc to avoid spurious -EBUSY<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A005c581ad3e7b perf/x86/uncore: C=
orrect the number of CHAs on EMR<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0861cfdc51f22 x86/sgx: Break up =
long non-preemptible delays in sgx_vepc_release()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07e3ddbea87a9 USB: core: Fix ove=
rsight in SuperSpeed initialization<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07fe9d8799606 USB: core: Fix rac=
e by not overwriting udev-&gt;descriptor in hub_port_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eda9a2966582 USB: core: Change =
usb_get_device_descriptor() API<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056c49a3328e9 USB: core: Unite o=
ld scheme and new scheme descriptor reads<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00ad6bad31da6 usb: typec: bus: v=
erify partner exists in typec_altmode_attention<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A031220bd89c22 usb: typec: tcpm: =
set initial svdm version based on pd revision<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03acc6b9f266f cpufreq: brcmstb-a=
vs-cpufreq: Fix -Warray-bounds bug<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb65ad51f1bd crypto: stm32 - fi=
x loop iterating through scatterlist for DMA<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09ab2c149c2e7 s390/ipl: add miss=
ing secure/has_secure file to ipl type &#39;unknown&#39;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06aff2732577c arm64: sdei: abort=
 running SDEI handlers during crash<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fedecaeef888 pstore/ram: Check =
start of empty przs during init<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d68582b93e6 mmc: renesas_sdhi:=
 register irqs before registering controller<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05294144b6ad2 fsverity: skip PKC=
S#7 parser when keyring is empty<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A086608e1b0c6f net: handle ARPHRD=
_PPP in dev_is_mac_header_xmit()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051ffed9ca1a4 X.509: if signatur=
e is unsupported skip validation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ecf09699eb1 dccp: Fix out of b=
ounds access in DCCP error handler<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07a2978e8d3c0 dlm: fix plock loo=
kup when using multiple lockspaces<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0703cf47d47ba parisc: Fix /proc/=
cpuinfo output for lscpu<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A049a49d442075 procfs: block chmo=
d on /proc/thread-self/comm<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A044f6ec589353 Revert &quot;PCI: =
Mark NVIDIA T4 GPUs to avoid bus reset&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d73d3787c9d1 ntb: Fix calculati=
on ntb_transport_tx_free_entry()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0da0c7293f4db ntb: Clean up tx t=
ail index on link down<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bfa051f650a7 ntb: Drop packets =
when qp link is down<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f4edcd65534 scsi: mpt3sas: Per=
form additional retries if doorbell read returns 0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058388f2958f6 Revert &quot;scsi:=
 qla2xxx: Fix buffer overrun&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bd188d1e3855 media: venus: hfi_=
venus: Write to VIDC_CTRL_INIT after unmasking interrupts<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06e9632a01e6d media: dvb: symbol=
 fixup for dvb_attach()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a43563cfd6b arm64: csum: Fix O=
oB access in IP checksum code for negative lengths<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a0a49da2a79a i3c: master: svc: =
fix probe failure when no i3c device exist<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a905ac21b2ab xtensa: PMU: fix b=
ase address for the newer hardware<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08742dbf9c25d backlight/lv5207lp=
: Compare against struct fb_info.device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0568132f74cb1 backlight/bd6107: =
Compare against struct fb_info.device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04e7b4ddc900c backlight/gpio_bac=
klight: Compare against struct fb_info.device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03b018c3d1016 ARM: OMAP2+: Fix -=
Warray-bounds warning in _pwrdm_state_switch()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cbb7d8a4b4be ipmi_si: fix a mem=
leak in try_smi_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06043dd31f771 PCI: rockchip: Use=
 64-bit mask on MSI 64-bit PCI address<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aba1bf197467 media: i2c: ccs: C=
heck rules is non-NULL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0df64819dd6a0 mm/vmalloc: add a =
safer version of find_vm_area() for debug<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020b7d0a62ad1 scsi: core: Fix th=
e scsi_set_resid() documentation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020990d6a8543 printk: ringbuffer=
: Fix truncating buffer size min_t cast<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a22f9c17b1a rcu: dump vmalloc =
memory info safely<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d479c841b18d ALSA: pcm: Fix mis=
sing fixup call in compat hw_refine ioctl<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0111bafa210ae PM / devfreq: Fix =
leak in devfreq_dev_release()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be7353af5b35 igb: set max size =
RX buffer when store bad packet is enabled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d5790386595d skbuff: skb_segmen=
t, Call zero copy functions before using skbuff frags<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0267a29f8bfdb netfilter: xt_sctp=
: validate the flag_info count<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3d07714ad24 netfilter: xt_u32:=
 validate user space input<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9e6142e5f8f netfilter: ipset: =
add the missing IP_SET_HASH_WITH_NET0 macro for ip_set_hash_netportnet.c<br=
>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03e48f741e98a igmp: limit igmpv3=
_newpack() packet size to IP_MAX_MTU<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de16cb7986f2 virtio_ring: fix a=
vail_wrap_counter in virtqueue_add_packed<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d6f80ddb9eda cpufreq: Fix the r=
ace condition while updating the transition_task of policy<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A042d8c7fa0bf6 dmaengine: ste_dma=
40: Add missing IRQ check in d40_probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0329d0f168c8f um: Fix hostaudio =
build errors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058d17e766093 mtd: rawnand: fsmc=
: handle clk prepare error in fsmc_nand_resume()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0679a71b31179 mtd: spi-nor: Chec=
k bus width while setting QE bit<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08869fd166f23 leds: trigger: tty=
: Do not use LED_ON/OFF constants, use led_blink_set_oneshot instead<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00f715ea7d36e leds: multicolor: =
Use rounded division when calculating color components<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01a68bef23726 leds: pwm: Fix err=
or code in led_pwm_create_fwnode()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0abd740db896b rpmsg: glink: Add =
check for kstrdup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b45cf29f97a2 phy/rockchip: inno=
-hdmi: do not power on rk3328 post pll on reg write<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A040d637359f3f phy/rockchip: inno=
-hdmi: round fractal pixclock in rk3328 recalc_rate<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A052942a47d034 phy/rockchip: inno=
-hdmi: use correct vco_div_5 macro on rk3328<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A031d7e6c7689b mtd: rawnand: brcm=
nand: Fix mtd oobsize<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06182318ac046 tracing: Fix race =
issue between cpu buffer write and swap<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0548f48ec1915 tracing: Remove ex=
tra space at the end of hwlat_detector/mode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02ba8bb00720a x86/speculation: M=
ark all Skylake CPUs as vulnerable to GDS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dde88ab4e45b HID: multitouch: C=
orrect devm device reference for hidinput input_dev name<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04fb28379b3c7 HID: logitech-dj: =
Fix error handling in logi_dj_recv_switch_to_dj_mode()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01bb42aca7a96 Revert &quot;IB/is=
ert: Fix incorrect release of isert connection&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04f1807fddd9b amba: bus: fix ref=
count leak<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c3701373463 serial: tegra: han=
dle clk prepare error in tegra_uart_hw_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0076fb40cf27a scsi: fcoe: Fix po=
tential deadlock on &amp;fip-&gt;ctlr_lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4772759abe1 scsi: core: Use 32=
-bit hostnum in scsi_host_lookup()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06248f4305378 cgroup:namespace: =
Remove unused cgroup_namespaces_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A004824d50e6b5 media: i2c: rdacm2=
1: Fix uninitialized value<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f3572eef8551 media: ov2680: Fix=
 regulators being left enabled on ov2680_power_on() errors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0205f71744176 media: ov2680: Fix=
 ov2680_set_fmt() which =3D=3D V4L2_SUBDEV_FORMAT_TRY not working<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A089ecb4b40094 media: ov2680: Add=
 ov2680_fill_format() helper function<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0784d1b83ae2c media: ov2680: Don=
&#39;t take the lock for try_fmt calls<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dbb717b4ee68 media: ov2680: Rem=
ove VIDEO_V4L2_SUBDEV_API ifdef-s<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04c1a5c2885d4 media: ov2680: Fix=
 vflip / hflip set functions<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0958905ed42b8 media: ov2680: Fix=
 ov2680_bayer_order()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cdd5fca7200d media: ov2680: Rem=
ove auto-gain and auto-exposure controls<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0322a805ffdff media: i2c: ov2680=
: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0abba34017e16 media: ov5640: Ena=
ble MIPI interface in ov5640_set_power_mipi()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01717f67be875 USB: gadget: f_mas=
s_storage: Fix unused variable warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0121b8d30f42c media: venus: hfi_=
venus: Only consider sys_idle_indicator on V1<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6b483ead6dc media: go7007: Rem=
ove redundant if statement<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d079a3e1ccdd platform/x86: dell=
-sysman: Fix reference leak<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0426bd7418701 iommu/vt-d: Fix to=
 flush cache of PASID directory table<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09dc6f660815a iommu/qcom: Disabl=
e and reset context bank before programming<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03274e32fc969 fsi: aspeed: Reset=
 master errors after CFAM reset<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07a17deca33e1 IB/uverbs: Fix an =
potential error pointer dereference<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A042d111304dd7 RDMA/hns: Fix CQ a=
nd QP cache affinity<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b051c3bf3bdf RDMA/hns: Fix inco=
rrect post-send with direct wqe of wr-list<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0154822356e4d RDMA/hns: Fix port=
 active speed<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de4aca5b284e iommu/sprd: Add mi=
ssing force_aperture<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A046b76f13f1ad driver core: test_=
async: fix an error code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a6992ecefe5d dma-buf/sync_file:=
 Fix docs syntax<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3256d80406c coresight: tmc: Ex=
plicit type conversions to prevent integer overflow<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A093a5b461a4e1 RDMA/irdma: Replac=
e one-element array with flexible-array member<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A097097ea2f37e scsi: qedf: Do not=
 touch __user pointer in qedf_dbg_fp_int_cmd_read() directly<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c996be7f233 scsi: qedf: Do not=
 touch __user pointer in qedf_dbg_debug_cmd_read() directly<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb6d20a8b5d7 scsi: qedf: Do not=
 touch __user pointer in qedf_dbg_stop_io_on_error_cmd_read() directly<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02f0d202d82b9 x86/APM: drop the =
duplicate APM_MINOR_DEV macro<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f34508d934c4 serial: sprd: Fix =
DMA buffer leak issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c54c66d904fa serial: sprd: Assi=
gn sprd_port after initialized to avoid wrong access<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f61fc650c478 scsi: qla4xxx: Add=
 length check when parsing nlattrs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A046ad449efde1 scsi: be2iscsi: Ad=
d length check when parsing nlattrs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04bd57d889099 scsi: iscsi: Add s=
trlen() check in iscsi_if_set{_host}_param()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9bac3cc744f scsi: iscsi: Add l=
ength check for nlattr payload<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09285efd95996 scsi: iscsi: Renam=
e iscsi_set_param() to iscsi_if_set_param()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07231d60d41c4 scsi: RDMA/srp: Fi=
x residual handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0484ddaa90b7e usb: phy: mxs: fix=
 getting wrong state with mxs_phy_is_otg_host()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cbb8f7097e11 media: mediatek: v=
codec: Return NULL if no vdec_fb is found<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A018dc93de9019 media: rkvdec: inc=
rease max supported height for H.264<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f1e7d999f37e scsi: hisi_sas: Fi=
x normally completed I/O analysed as failed<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A046d1b2a3d5a6 scsi: hisi_sas: Fi=
x warnings detected by sparse<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e454e985950b scsi: hisi_sas: Mo=
dify v3 HW SATA completion error processing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07caac45b52f4 scsi: hisi_sas: Mo=
dify v3 HW SSP underflow error processing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f64d02822b82 media: cx24120: Ad=
d retval check for cx24120_message_send()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ca7cd02114a media: dvb-usb: m9=
20x: Fix a potential memory leak in m920x_i2c_xfer()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fb24b65aaccd media: dib7000p: F=
ix potential division by zero<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056a3d8ae4576 drivers: usb: smsu=
sb: fix error handling code in smsusb_init_device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d1b51b130d32 iommu: rockchip: F=
ix directory table address encoding<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a50d60b8f2af iommu/amd/iommu_v2=
: Fix pasid_state refcount dec hit 0 warning on pasid unbind<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0caf058833b6f media: v4l2-core: =
Fix a potential resource leak in v4l2_fwnode_parse_link()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0711e9e44f6c4 media: i2c: tvp515=
0: check return value of devm_kasprintf()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030d4380eb030 media: ad5820: Dro=
p unsupported ad5823 from i2c_ and of_device_id tables<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0663114dfc178 RDMA/qedr: Remove =
a duplicate assignment in irdma_query_ah()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01473e40b3912 pNFS: Fix assignme=
nt of xprtdata.cred<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fb7ddc1138b0 NFSv4.2: fix handl=
ing of COPY ERR_OFFLOAD_NO_REQ<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A053a1e5ab1b11 NFS: Guard against=
 READDIR loop when entry names exceed MAXNAMELEN<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A019a648a07572 NFSD: da_addr_body=
 field missing in some GETDEVICEINFO replies<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0f127a7c635 fs: lockd: avoid p=
ossible wrong NULL parameter<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f994b830dd0 jfs: validate max =
amount of blocks before allocation.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6a84ef1d080 ext4: fix unttache=
d inode after power cut with orphan file feature enabled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9ddbfed5346 powerpc/iommu: Fix=
 notifiers being shared by PCI and VIO buses<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a70c8de30514 nfs/blocklayout: U=
se the passed in gfp flags<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02935443dc9c2 powerpc/pseries: R=
ework lppaca_shared_proc() to avoid DEBUG_PREEMPT<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A075dcb650a7ef powerpc: Don&#39;t=
 include lppaca.h in paca.h<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cefcb002c5c9 PCI: layerscape: A=
dd workaround for lost link capabilities during reset<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04be323c73797 PCI: layerscape: A=
dd the endpoint linkup notifier support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A069c712389e1f PCI: dwc: Add star=
t_link/stop_link inlines<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aac0a9a1577b wifi: ath10k: Use =
RMW accessors for changing LNKCTL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03539bab5f9de wifi: ath11k: Use =
RMW accessors for changing LNKCTL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea670d0146a3 net/mlx5: Use RMW =
accessors for changing LNKCTL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0348ef09df984 drm/radeon: Use RM=
W accessors for changing LNKCTL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05468237382ed drm/amdgpu: Use RM=
W accessors for changing LNKCTL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A000f79e78bf4b powerpc/perf: Conv=
ert fsl_emb notifier to state machine callbacks<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a26a5e4be2c4 powerpc/fadump: re=
set dump area size if fadump memory reserve fails<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A013fd667db999 vfio/type1: fix ca=
p_migration information leak<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06b708243d3d9 powerpc/radix: Mov=
e some functions into #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dbde1d9c54e2 clk: imx: composit=
e-8m: fix clock pauses when set_rate would be a no-op<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0824e97302fd8 clk: imx8mp: fix s=
ai4 clock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066ef144dbdf9 PCI/ASPM: Use RMW =
accessors for changing LNKCTL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f46fa8ab8d82 PCI: pciehp: Use R=
MW accessors for changing LNKCTL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0759d978e831b pinctrl: mcp23s08:=
 check return value of devm_kasprintf()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A002faf0bd6fdc PCI: Mark NVIDIA T=
4 GPUs to avoid bus reset<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04c20a4143276 PCI: microchip: Co=
rrect the DED and SEC interrupt bit offsets<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0377f7aeddda0 clk: qcom: gcc-sm6=
350: Fix gcc_sdcc2_apps_clk_src<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c4a98c55fa3 clk: qcom: reset: =
Use the correct type of sleep/delay based on length<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bd4eff9c835a clk: qcom: gcc-sm8=
250: Fix gcc_sdcc2_apps_clk_src<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b1cb8bf42b36 ext4: avoid potent=
ial data overflow in next_linear_group<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03e24082f1682 ext4: correct grp =
validation in ext4_mb_good_group<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0febacbefe451 EDAC/igen6: Fix th=
e issue of no error events<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0964f62caac08 clk: qcom: gcc-sc7=
180: Fix up gcc_sdcc2_apps_clk_src<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f1399e1543e7 clk: sunxi-ng: Mod=
ify mismatched function name<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092913d32e719 drivers: clk: keys=
tone: Fix parameter judgment in _of_pll_clk_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03ad53071fe85 ipmi:ssif: Fix a m=
emory leak when scanning for an adapter<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07792869495b6 ipmi:ssif: Add che=
ck for kstrdup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A053abafedfeb7 ALSA: ac97: Fix po=
ssible error value of *rac97<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A048fc5717b249 of: unittest: Fix =
overlay type in apply/revert check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A001bb96ad3808 of: overlay: Call =
of_changeset_init() early<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030f04a41e7d7 md: raid0: account=
 for split bio in iostat accounting<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09643cc0b1771 md/raid0: Fix perf=
ormance regression for large sequential writes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A017fbf7da491f md/raid0: Factor o=
ut helper for mapping and submitting a bio<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d04f1e322f52 md: add error_hand=
lers for raid0 and linear<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d8b6adb84041 md: Set MD_BROKEN =
for RAID1 and RAID10<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a68fabdad970 bus: ti-sysc: Fix =
cast to enum warning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07636dfc42b66 arm64: dts: qcom: =
apq8016-sbc: Fix ov5640 regulator supply names<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fff4d36247e8 drm/mediatek: Fix =
potential memory leak if vmap() fail<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e5758ad9a34f drm/mediatek: Remo=
ve freeing not dynamic allocated memory<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A097274bea0136 bus: ti-sysc: Fix =
build warning for 64-bit build<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc6b09671d0c io_uring: fix drai=
n stalls by invalid SQE<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00152e7758cc4 audit: fix possibl=
e soft lockup in __audit_inode_child()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A048e4c4819039 drm/msm/a2xx: Call=
 adreno_gpu_init() earlier<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076c3ad12441f drm/amd/pm: fix va=
riable dereferenced issue in amdgpu_device_attr_create()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A032e060927351 smackfs: Prevent u=
nderflow in smk_set_cipso()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0502dfc5875ba firmware: meson_sm=
: fix to avoid potential NULL pointer dereference<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0b1eee64870 drm/msm/mdp5: Don&=
#39;t leak some plane state<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d0b82c217feb drm: xlnx: zynqmp_=
dpsub: Add missing check for dma_set_mask<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b7b0c48851c4 ima: Remove deprec=
ated IMA_TRUSTED_KEYRING Kconfig<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08025396b76e9 drm/panel: simple:=
 Add missing connector type and pixel format for AUO T215HVN01<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A027eee65b2e31 drm/armada: Fix of=
f-by-one error in armada_overlay_get_property()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc9254b24a4b arm64: dts: qcom: =
sm8150: Fix the I2C7 interrupt<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea5bc6f5aa09 of: unittest: fix =
null pointer dereferencing in of_unittest_find_node_by_name()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04197eeb55f4b drm/tegra: dpaux: =
Fix incorrect return value of platform_get_irq<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09712279e9743 drm/msm: Update de=
v core dump to not print backwards<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08ef5d1f16d92 md/md-bitmap: hold=
 &#39;reconfig_mutex&#39; in backlog_store()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0382638364711 md/bitmap: don&#39=
;t set max_write_behind if there is no write mostly device<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a3d36107ee48 md/raid10: use der=
eference_rdev_and_rrdev() to get devices<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A094ca5eed9530 md/raid10: factor =
out dereference_rdev_and_rrdev()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0246bac7d3c3e drm/amdgpu: Update=
 min() to min_t() in &#39;amdgpu_info_ioctl&#39;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de93b4711ac2 arm64: dts: qcom: =
sdm845: Fix the min frequency of &quot;ice_core_clk&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9e56fa8a0ca arm64: dts: qcom: =
sdm845: Add missing RPMh power domain to GCC<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db0ba312542d ARM: dts: BCM53573=
: Fix Ethernet info for Luxul devices<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4413633ef78 drm: adv7511: Fix =
low refresh rate register for ADV7533/5<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A057b6d92c79e9 ARM: dts: samsung:=
 s5pv210-smdkv210: correct ethernet reg addresses (split)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b7f47031e319 ARM: dts: s5pv210:=
 add dummy 5V regulator for backlight on SMDKv210<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02f0246b3c7ff ARM: dts: samsung:=
 s3c6410-mini6410: correct ethernet reg addresses (split)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d12beb1b1ee5 ARM: dts: s3c64xx:=
 align pinctrl with dtschema<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0188f2d41fa5d x86/mm: Fix PAT bi=
t missing from page protection modify mask<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01dd43e1e54d5 drm/etnaviv: fix d=
umping of active MMU context<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01634fe406c34 arm64: dts: qcom: =
pmi8994: Add missing OVP interrupt<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04b7eb5e2c1c4 arm64: dts: qcom: =
Move WLED num-strings from pmi8994 to sony-xperia-tone<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092919d98e673 arm64: dts: qcom: =
pmi8994: Remove hardcoded linear WLED enabled-strings<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0365909857242 arm64: dts: qcom: =
pm660l: Add missing short interrupt<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea48fd91df12 arm64: dts: qcom: =
correct SPMI WLED register range encoding<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eee01e0d6abe arm64: dts: qcom: =
pmi8998: Add node for WLED<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b788afdbfd5a arm64: dts: qcom: =
sm8250-sony-xperia: correct GPIO keys wakeup again<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02840d9b9c875 ARM: dts: BCM53573=
: Use updated &quot;spi-gpio&quot; binding properties<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b35f3ca1877e ARM: dts: BCM53573=
: Add cells sizes to PCIe node<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bed08bb83292 drm/amdgpu: avoid =
integer overflow warning in amdgpu_device_resize_fb_bar()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0261e69456617 arm64: dts: qcom: =
sm8250: Mark PCIe hosts as DMA coherent<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A012a93e53eaf0 arm64: dts: qcom: =
pmk8350: fix ADC-TM compatible string<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04c9a637258bb arm64: dts: qcom: =
sm8350: Use proper CPU compatibles<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04c918fb77dea arm64: dts: qcom: =
sm8350: Add missing LMH interrupts to cpufreq<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09c022ab2db40 arm64: dts: qcom: =
msm8996: Add missing interrupt to the USB2 controller<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bda65ecaec97 arm64: dts: qcom: =
sm8250-edo: Rectify gpio-keys<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06119aaced94f arm64: dts: qcom: =
sm8250-edo: Add GPIO line names for PMIC GPIOs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0dc9d7d3f2b arm64: dts: qcom: =
sm8250-edo: Add gpio line names for TLMM<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d2d698daa1fa arm64: dts: qcom: =
sm8250: correct dynamic power coefficients<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0510bae3d37f7 soc: qcom: ocmem: =
Fix NUM_PORTS &amp; NUM_MACROS macros<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b08c7a31baeb soc: qcom: ocmem: =
Add OCMEM hardware version print<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dc04034502e6 ASoC: stac9766: fi=
x build errors with REGMAP_AC97<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A089602de9a2d7 quota: fix dqput()=
 to follow the guarantees dquot_srcu should provide<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01df46e717ee9 quota: add new hel=
per dquot_active()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bd0a6452f070 quota: rename dquo=
t_active() to inode_quota_active()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05b8240223407 quota: factor out =
dquot_write_dquot()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c6efd3a1d06 drm/bridge: tc3587=
64: Fix debug print parameter order<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a48e7def0006 netrom: Deny concu=
rrent connect().<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04cf994d3f4ff net/sched: sch_hfs=
c: Ensure inner classes have fsc curve<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0edb5b1b3b9f8 hwmon: (tmp513) Fi=
x the channel number in tmp51x_is_visible()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a85fd8116555 mlxsw: i2c: Limit =
single transaction buffer size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07790b6a2f5f0 mlxsw: i2c: Fix ch=
unk size setting in output mailbox buffer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0510e0cbd6408 net: arcnet: Do no=
t call kfree_skb() under local_irq_disable()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A093a572b9d42f wifi: ath9k: use I=
S_ERR() with debugfs_create_dir()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05138beea8e7f Bluetooth: btusb: =
Do not call kfree_skb() under spin_lock_irqsave()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d7fd24b8d1bb wifi: mwifiex: avo=
id possible NULL skb pointer dereference<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A071ce8be48bf0 wifi: nl80211/cfg8=
0211: add forgotten nla_policy for BSS color attribute<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A011f93fff6e8a wifi: ath9k: prote=
ct WMI command response buffer replacement with a lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06904c7afd512 wifi: ath9k: fix r=
aces between ath9k_wmi_cmd and ath9k_wmi_ctrl_rx<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cec7db9ea031 samples/bpf: fix b=
roken map lookup probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A089f19a9a055d wifi: mwifiex: Fix=
 missed return in oob checks failed path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0308eb3a609ac wifi: mwifiex: fix=
 memory leak in mwifiex_histogram_read()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09c00731bf05d fs: ocfs2: namei: =
check return value of ocfs2_add_entry()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f683992d30ee lwt: Check LWTUNNE=
L_XMIT_CONTINUE strictly<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e3f647e4b642 lwt: Fix return va=
lues of BPF xmit ops<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04ff998134025 hwrng: iproc-rng20=
0 - Implement suspend and resume calls<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a70ab6b59b2 crypto: caam - fix=
 unchecked return value error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0660b6b1c5cf8 ice: ice_aq_check_=
events: fix off-by-one check when filling buffer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A055fab9389d65 net-memcg: Fix sco=
pe of sockmem pressure indicators<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A041c40d84838d selftests/bpf: Cle=
an up fmod_ret in bench_rename test script<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A050c78e71446d net: tcp: fix unex=
cepted socket die when snd_wnd is 0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0942d8cefb022 Bluetooth: Fix pot=
ential use-after-free when clear keys<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07b0243d26a71 Bluetooth: nokia: =
fix value check in nokia_bluetooth_serdev_probe()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0048545d9fc64 crypto: api - Use =
work queue in crypto_destroy_instance<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056cb7bbefcaf crypto: stm32 - Pr=
operly handle pm_runtime_get failing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e3c4a6b073e4 selftests/bpf: fix=
 static assert compilation issue for test_cls_*.c<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A043423b3e0467 wifi: mwifiex: fix=
 error recovery in PCIE buffer descriptor management<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c54b6fc39eb wifi: mwifiex: Fix=
 OOB and integer underflow when rx packets<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a20b96cf6925 wifi: mt76: mt7915=
: fix power-limits while chan_switch<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05c75a4379589 can: gs_usb: gs_us=
b_receive_bulk_callback(): count RX overflow errors also in case of OOM<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0890843254f38 spi: tegra20-sflas=
h: fix to check return value of platform_get_irq() in tegra_sflash_probe()<=
br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02ff9ac0cf25f wifi: mt76: testmo=
de: add nla_policy for MT76_TM_ATTR_TX_LENGTH<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0802008e8c73a ipv6: Add reasons =
for skb drops to __udp6_lib_rcv<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07dcbc0bb0e5c bpf: reject unhash=
ed sockets in bpf_sk_assign<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0caa2883b1885 udp: re-score reus=
eport groups when connected sockets are present<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b60dfa4559d8 regmap: rbtree: Us=
e alloc_flags for memory allocations<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A034f1180658d9 hwrng: pic32 - use=
 devm_clk_get_enabled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05af3c8676b36 hwrng: nomadik - k=
eep clock enabled while hwrng is registered<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A014c6d1e80847 tcp: tcp_enter_qui=
ckack_mode() should be static<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07b75b4c90a9e bpf: Clear the pro=
be_addr for uprobe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A075d3960be702 bpftool: Use a loc=
al bpf_perf_event_value to fix accessing its fields<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08ea6871116d5 cpufreq: powernow-=
k8: Use related_cpus instead of cpus in driver.exit()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be2092d2a703 x86/efistub: Fix P=
CI ROM preservation in mixed mode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09eb25ea7b65d ACPI: x86: s2idle:=
 Fix a logic error parsing AMD constraints table<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A026097a7f28b3 ACPI: x86: s2idle:=
 Post-increment variables when getting constraints<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08a962f11a95b s390/paes: fix PKE=
Y_TYPE_EP11_AES handling for secure keyblobs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07833a74f8d00 s390/pkey: fix/har=
monize internal keyblob headers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0208383d68510 selftests/futex: O=
rder calls to futex_lock_pi<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c7802ff51adc perf/imx_ddr: don&=
#39;t enable counter0 if none of 4 counters are used<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a872a0521c8 x86/decompressor: =
Don&#39;t rely on upper 32 bits of GPRs being preserved<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03af6f77e8090 selftests/resctrl:=
 Close perf value read fd on errors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04505ad996b66 selftests/resctrl:=
 Unmount resctrl FS if child fails to run benchmark<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c68a196e7ff6 selftests/resctrl:=
 Don&#39;t leak buffer in fill_cache()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fdcb63afd3f6 selftests/resctrl:=
 Add resctrl.h into build deps<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b2ba11ed4d10 selftests/resctrl:=
 Make resctrl_tests run using kselftest framework<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0478944f4a5 OPP: Fix passing 0=
 to PTR_ERR in _opp_attach_genpd()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ec9d118ad99d refscale: Fix unin=
italized use of wait_queue_head_t<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e280033ef135 ARM: ptrace: Resto=
re syscall skipping for tracers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04c3f33904dea ARM: ptrace: Resto=
re syscall restart tracing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00481251b7cd6 selftests/harness:=
 Actually report SKIP for signal tests<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0060ca3f7899a tmpfs: verify {g,u=
}id mount options correctly<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d412e9b34b90 fs: Fix error chec=
king for d_hash_and_lookup()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a4229f93bc54 eventfd: prevent u=
nderflow for eventfd semaphores<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cedb8719333d reiserfs: Check th=
e return value from __getblk()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c1a4117f1544 Revert &quot;net: =
macsec: preserve ingress frame ordering&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A040671f90d5b5 udf: Handle error =
when adding extent to a file<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0099bf90d7fc4 udf: Check consist=
ency of Space Bitmap Descriptor<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07039aa1be9cc of: kexec: Mark im=
a_{free,stable}_kexec_buffer() as __init<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0759d51eda2d0 net: Avoid address=
 overwrite in kernel_connect<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c4cce5700b9 arm64: lib: Import=
 latest version of Arm Optimized Routines&#39; strncmp<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0104df1c695c1 crypto: rsa-pkcs1p=
ad - Use helper to set reqsize<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0273f4615314f platform/mellanox:=
 Fix mlxbf-tmfifo not handling all virtio CONSOLE notifications<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09ef5c25bcf1b tracing: Introduce=
 pipe_cpumask to avoid race on trace_pipes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08c1b60dad0f5 ALSA: seq: oss: Fi=
x racy open/close of MIDI devices<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fa05aea28195 scsi: lpfc: Fix in=
correct big endian type assignment in bsg loopback path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0bf8a071134 scsi: storvsc: Alw=
ays set no_report_opcodes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9e62419e797 sctp: handle inval=
id error codes without calling BUG()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03714bb4a1df8 bnx2x: fix page fa=
ult following EEH recovery<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A053b8cc2f9685 netlabel: fix shif=
t wrapping bug in netlbl_catmap_setlong()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0867cdd7f9544 drm/amdgpu: Match =
against exact bootloader status<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00863204deb3c net: hns3: restore=
 user pause configure when disable autoneg<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ac93def0dbb4 scsi: qedi: Fix po=
tential deadlock on &amp;qedi_percpu-&gt;p_work_lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bef6c89a92d0 scsi: lpfc: Remove=
 reftag check in DIF paths<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b439e33a8c93 idmaengine: make F=
SL_EDMA and INTEL_IDMA64 depends on HAS_IOMEM<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0156b803194ae wifi: brcmfmac: Fi=
x field-spanning write in brcmf_scan_params_v2_to_v1()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A087ea5e89407e net: usb: qmi_wwan=
: add Quectel EM05GV2<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1313fa9d2e3 vmbus_testing: fix=
 wrong python syntax for integer value comparison<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05faad57ba6c7 clk: fixed-mmio: m=
ake COMMON_CLK_FIXED_MMIO depend on HAS_IOMEM<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e13f0dd5fbe2 kprobes: Prohibit =
probing on CFI preamble symbol<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ee49b97cb5ae security: keys: pe=
rform capable check only on privileged operations<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f44f50305de2 ata: pata_arasan_c=
f: Use dev_err_probe() instead dev_err() in data_xfer()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a85c523aeccd ovl: Always reeval=
uate the file signature for IMA<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03faa126258a9 drm/amd/display: E=
xit idle optimizations before attempt to access PHY<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c152ca4f219b platform/x86: huaw=
ei-wmi: Silence ambient light sensor<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9988b9c7a31 platform/x86/intel=
/hid: Add HP Dragonfly G2 to VGBS DMI quirks<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07f3901b04c8f platform/x86: inte=
l: hid: Always call BTNL ACPI method<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A023151421ed01 ASoC: atmel: Fix t=
he 8K sample parameter in I2SC master<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c934d2a6970c ASoC: rt711-sdca: =
fix for JD event handling in ClockStop Mode0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020587011d271 ASoC: rt711: fix f=
or JD event handling in ClockStop Mode0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b41f79896456 ASoc: codecs: ES83=
16: Fix DMIC config<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc2b0a2055dc ASoC: rt5682-sdw: =
fix for JD event handling in ClockStop Mode0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05b64fc2471f9 fs/nls: make load_=
nls() take a const parameter<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f85908f6bfd2 s390/dasd: fix han=
ging device after request requeue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a4845e694893 s390/dasd: use cor=
rect number of retries for ERP requests<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e062aa1acf9b m68k: Fix invalid =
.section syntax<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bbfa7d712b24 vxlan: generalize =
vxlan_parse_gpe_hdr and remove unused args<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b10215ffdb01 ethernet: atheros:=
 fix return value check in atl1c_tso_csum()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06bb94f46d31a ASoC: da7219: Chec=
k for failure reading AAD IRQ events<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0279a6dad0cd9 ASoC: da7219: Flus=
h pending AAD IRQ when suspending<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d424c636b750 ksmbd: no response=
 from compound read<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A082373d1b763e ksmbd: fix out of =
bounds in smb3_decrypt_req()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020d449a08749 9p: virtio: make s=
ure &#39;offs&#39; is initialized in zc_request<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4269c7258d9 media: pci: cx2388=
5: fix error handling for cx23885 ATSC boards<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A017d75773b66e media: pulse8-cec:=
 handle possible ping error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f281a3739399 phy: qcom-snps-fem=
to-v2: use qcom_snps_hsphy_suspend/resume error code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dfff9c91cbb0 ARM: dts: imx: Set=
 default tuning step for imx7d usdhc<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04e364cab1331 ARM: dts: imx: Adj=
ust dma-apbh node name<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A099319298fd9a ARM: dts: imx7s: D=
rop dma-apb interrupt-names<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01dc2c12854b6 ARM: dts: imx: upd=
ate sdma node name format<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aff03380bda4 Linux 5.15.131<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd8ab566cf17 usb: typec: tcpci:=
 clear the fault status bit<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0403b2e940910 usb: typec: tcpci:=
 move tcpci.h to include/linux/usb/<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f29483873e24 pinctrl: amd: Don&=
#39;t show `Invalid config param` errors<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b911bef132a0 nilfs2: fix WARNIN=
G in mark_buffer_dirty due to discarded buffer reuse<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c6ddf739f15 nilfs2: fix genera=
l protection fault in nilfs_lookup_dirty_data_buffers()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6e61aef5c5d tcpm: Avoid soft r=
eset when partner does not support get_status<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0da0e7d435e31 fsi: master-ast-cf=
: Add MODULE_FIRMWARE macro<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072eca651d732 firmware: stratix1=
0-svc: Fix an NULL vs IS_ERR() bug in probe<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0907216337bea serial: sc16is7xx:=
 fix bug when first setting GPIO direction<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A045d9611ebff2 serial: sc16is7xx:=
 fix broken port 0 uart init<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f90e267dd27e serial: qcom-geni:=
 fix opp vote on shutdown<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A046d13013b574 wifi: mt76: mt7921=
: do not support one stream on secondary antenna only<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a5c2a467e9e7 Bluetooth: btsdio:=
 fix use after free bug in btsdio_remove due to race condition<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f49294ad6898 staging: rtl8712: =
fix race condition<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d17cec60e87c HID: wacom: remove=
 the battery when the EKR is off<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0842c7da3eee2 usb: chipidea: imx=
: improve logic if samsung,picophy-* parameter is 0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0276a906f81a7 usb: dwc3: meson-g=
12a: do post init to fix broken usb after resumption<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A060f938e84fbb ALSA: usb-audio: F=
ix init call orders for UAC1<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e949dd2a9b6b USB: serial: optio=
n: add FOXCONN T99W368/T99W373 product<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c41411d8b333 USB: serial: optio=
n: add Quectel EM05G variant (0x030e)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A009baa839d415 modules: only allo=
w symbol_get of EXPORT_SYMBOL_GPL modules<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0997a194914c4 rtc: ds1685: use E=
XPORT_SYMBOL_GPL for ds1685_rtc_poweroff<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03d0f6408601b net: enetc: use EX=
PORT_SYMBOL_GPL for enetc_phc_index<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0da95090821c4 mmc: au1xmmc: forc=
e non-modular build and remove symbol_get usage<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e3e68100c036 ARM: pxa: remove u=
se of symbol_get()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb5bf157b5be ksmbd: replace one=
-element array with flex-array member in struct smb2_ea_info<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02e3f57f74c0a ksmbd: fix wrong D=
ataOffset validation of create context<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3ad7f39fd85 erofs: ensure that=
 the post-EOF tails are all zeroed<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f790700c974 Linux 5.15.130<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A069347c334071 rcu-tasks: Add trc=
_inspect_reader() checks for exiting critical section<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08046fb611f70 rcu-tasks: Wait fo=
r trc_read_check_handler() IPIs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0da22db901cc1 rcu-tasks: Fix IPI=
 failure handling in trc_wait_for_one_reader<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a0249d365ac8 rcu: Prevent exped=
ited GP from enabling tick on offline CPU<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07aec063d6029 ARM: module: Use m=
odule_init_layout_section() to spot init sections<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04a8976052acd arm64: module: Use=
 module_init_layout_section() to spot init sections<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f8a74159d116 arm64: module-plts=
: inline linux/moduleloader.h<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0363bbb5008e5 module: Expose mod=
ule_init_layout_section()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0758e3d0cb753 ACPI: thermal: Dro=
p nocrt parameter<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09e43368a3393 Linux 5.15.129<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d48016d74836 mm,ima,kexec,of: u=
se memblock_free_late from ima_free_kexec_buffer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c41cd30d5cd mm: memory-failure=
: fix unexpected return value in soft_offline_page()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00712721e4f4f mm: memory-failure=
: kill soft_offline_free_page()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0efd02b5cadd5 dma-buf/sw_sync: A=
void recursive lock during fence signal<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08dbf913520c4 pinctrl: renesas: =
rza2: Add lock around pinctrl_generic{{add,remove}_group,{add,remove}_funct=
ion}<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f1c0402b8e22 clk: Fix undefined=
 reference to `clk_rate_exclusive_{get,put}&#39;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A010bc3eddc605 scsi: core: raid_c=
lass: Remove raid_component_add()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3d57cdbfda4 scsi: snic: Fix do=
uble free in snic_tgt_create()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef56cc8889be can: raw: add miss=
ing refcount for memory leak fix<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0930f3f164964 drm/i915: Fix prem=
ature release of request&#39;s reusable memory<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03cb86cc565df cgroup/cpuset: Fre=
e DL BW in case can_attach() fails<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ffff4fc4bad7 sched/deadline: Cr=
eate DL BW alloc, free &amp; check overflow interface<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A086aa90795979 cgroup/cpuset: Ite=
rate only if DEADLINE tasks are present<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A043d8cbfefa7c sched/cpuset: Keep=
 track of SCHED_DEADLINE task in cpusets<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d0eb4917f4d3 sched/cpuset: Brin=
g back cpuset_mutex<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0918879de0e23 cgroup/cpuset: Ren=
ame functions dealing with DEADLINE accounting<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A078efab71a649 torture: Fix hang =
during kthread shutdown phase<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8fb97dd7fe6 nfsd: use vfs setg=
id helper<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A001966511868e nfs: use vfs setgi=
d helper<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7a1849899aa x86/fpu: Set X86_F=
EATURE_OSXSAVE feature after enabling OSXSAVE in CR4<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ad79f943c869 x86/fpu: Invalidat=
e FPU state correctly on exec()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b190cf1f277a drm/display/dp: Fi=
x the DP DSC Receiver cap size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8aab333d41a drm/vmwgfx: Fix sh=
ader stage validation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b53ed415163e PCI: acpiphp: Use =
pci_assign_unassigned_bridge_resources() only for non-root bus<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A060ba1bfa036a media: vcodec: Fix=
 potential array out-of-bounds in encoder queue_setup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0544cd10defa1 of: dynamic: Refac=
tor action prints to not use &quot;%pOF&quot; inside devtree_lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f1d4a5881856 of: unittest: Fix =
EXPECT for parse_phandle_with_args_map() test<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ce66cd478636 radix tree: remove=
 unused variable<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0898c8c5b1114 lib/clz_ctz.c: Fix=
 __clzdi2() and __ctzdi2() for 32-bit kernels<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff90a4c6edf8 batman-adv: Hold r=
tnl lock during MTU update via netlink<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea38c0d9aaa2 batman-adv: Fix ba=
tadv_v_ogm_aggr_send memory leak<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07f3f72eb8f5b batman-adv: Fix TT=
 global entry leak when client roamed back<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f7667b49880a batman-adv: Do not=
 get eth header before batadv_check_management_packet<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f9312dd7581 batman-adv: Don&#3=
9;t increase MTU when set by user<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cde5a240d72d batman-adv: Trigge=
r events for auto adjusted MTU<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A022426e1ce679 selinux: set next =
pointer before attaching to list<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0711595bfdccf nfsd: Fix race to =
FREE_STATEID and cl_revoked<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bd1697e12230 NFS: Fix a use aft=
er free in nfs_direct_join_group()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05f642613746e mm: add a call to =
flush_cache_vmap() in vmap_pfn()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0440c10034b4d ALSA: ymfpci: Fix =
the missing snd_card_free() call at probe error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05cc7d81cf576 clk: Fix slab-out-=
of-bounds error in devm_clk_release()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00f72859acfa2 NFSv4: Fix dropped=
 lock for racing OPEN and delegation return<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09c025420fef2 ibmveth: Use dcbf =
rather than dcbfl<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07e546bd08943 Revert &quot;KVM: =
x86: enable TDP MMU by default&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A067af12f5582b net/ncsi: change f=
rom ndo_set_mac_address to dev_set_mac_address<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04451457d61e0 net/ncsi: make one=
 oem_gma function for all mfr id<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f683f4be802b bonding: fix macvl=
an over alb bond support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00fa8046e923a net: remove bond_s=
lave_has_mac_rcu()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0ec97fca629 rtnetlink: Reject =
negative ifindexes in RTM_NEWLINK<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A000247cfd2b69 rtnetlink: return =
ENODEV when ifname does not exist and group is given<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A075cfb7de44e5 netfilter: nf_tabl=
es: fix out of memory error handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f22954f8c58f netfilter: nf_tabl=
es: flush pending destroy work before netlink notifier<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff34403fef98 net/sched: fix a q=
disc modification with ambiguous command request<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030624ea3f8b6 igc: Fix the typo =
in the PTM Control macro<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f697c3ead109 igb: Avoid startin=
g unnecessary workqueues<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d7823d752ce1 ice: fix receive b=
uffer size miscalculation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ace1b0ae3097 net: validate veth=
 and vxcan peer ifindexes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0335be585416d net: bcmgenet: Fix=
 return value check for fixed_phy_register()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A060a5034584ea net: bgmac: Fix re=
turn value check for fixed_phy_register()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05b52c9ba42c0 ipvlan: Fix a refe=
rence count leak warning in ipvlan_ns_exit()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02bad37b6f675 dccp: annotate dat=
a-races in dccp_poll()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09b015360e86f sock: annotate dat=
a-races around prot-&gt;memory_pressure<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c52c6c0223e1 octeontx2-af: SDP:=
 fix receive link config<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ce6e2b14bc09 tracing: Fix memle=
ak due to race between current_tracer and trace<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef748360ba91 tracing: Fix cpu b=
uffers unavailable due to &#39;record_disabled&#39; missed<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fdf5804d7475 can: raw: fix lock=
dep issue in raw_release()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0278fccf587dd drm/amd/display: c=
heck TG is non-null before checking if enabled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a955e6a0e39d drm/amd/display: d=
o not wait for mpc idle if tg is disabled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0bd4f0c60b4 can: raw: fix rece=
iver memory leak<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b832174b7f89 jbd2: fix a race w=
hen checking checkpoint buffer busy<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09c31bb2684f8 jbd2: remove journ=
al_clean_one_cp_list()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d91783e6864a jbd2: remove t_che=
ckpoint_io_list<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a0ab49e7a758 ALSA: pcm: Fix pot=
ential data race at PCM memory allocation helpers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02e56d380daa9 fbdev: fix potenti=
al OOB read in fast_imageblit()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A014163f4a4fa6 fbdev: Fix sys_ima=
geblit() for arbitrary image widths<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05b60bd9081a9 fbdev: Improve per=
formance of sys_imageblit()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0166f0bf4560b MIPS: cpu-features=
: Use boot_cpu_type for CPU type based features<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f106e97409d MIPS: cpu-features=
: Enable octeon_cache by cpu_type<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d1d0b239f974 fs: dlm: fix misma=
tch of plock results from userspace<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A077d334c44681 fs: dlm: use dlm_p=
lock_info for do_unlock_close<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9a33cc7d946 fs: dlm: change pl=
ock interrupted message to debug again<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ac088841ffb fs: dlm: add pid t=
o debug log<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0df9c842ab0a4 dlm: replace usage=
 of found with dedicated list iterator variable<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A033e9c610e337 dlm: improve plock=
 logging if interrupted<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d9ce077f8b1f PCI: acpiphp: Reas=
sign resources on bridge if necessary<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08cc8645dd3e1 xprtrdma: Remap Re=
ceive buffers after a reconnect<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A091a707507e83 NFSv4: fix out pat=
h in __nfs4_get_acl_uncached<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0323b830eebd1 NFSv4.2: fix error=
 handling in nfs42_proc_getxattr<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05de0a325c45e objtool/x86: Fix S=
RSO mess<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ddfe5cc8716 Linux 5.15.128<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09080f4fcc202 x86/srso: Correct =
the mitigation status when SMT is disabled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0484eefc6ff9c objtool/x86: Fixup=
 frame-pointer vs rethunk<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A055f1cbeaa159 x86/retpoline,kpro=
bes: Fix position of thunk sections with CONFIG_LTO_CLANG<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fa24cd0fbcb7 x86/srso: Disable =
the mitigation on unaffected configurations<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aa0777ce0d3d x86/CPU/AMD: Fix t=
he DIV(0) initial fix attempt<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bbe585239d4f x86/retpoline: Don=
&#39;t clobber RFLAGS during srso_safe_ret()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A019f23d16b0e0 x86/static_call: F=
ix __static_call_fixup()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0df6495f203a7 x86/srso: Explain =
the untraining sequences a bit more<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A043548590ad7e x86/cpu: Cleanup t=
he untrain mess<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0035e906bfc93 x86/cpu: Rename sr=
so_(.*)_alias to srso_alias_\1<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A019c1c0499650 x86/cpu: Rename or=
iginal retbleed methods<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f77dbb90962b x86/cpu: Clean up =
SRSO return thunk mess<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f624ce6c7fc2 x86/ibt: Add ANNOT=
ATE_NOENDBR<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f1171d455d94 objtool: Add frame=
-pointer-specific function ignore<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A008f7cfd44f77 x86/alternative: M=
ake custom return thunk unconditional<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d810eff090c x86/cpu: Fix up sr=
so_safe_ret() and __x86_return_thunk()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08089aae6020e x86/cpu: Fix __x86=
_return_thunk symbol type<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05b28fda5fdee mmc: f-sdh30: fix =
order of function calls in sdhci_f_sdh30_remove<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e8c5081da2cc net: fix the RTO t=
imer retransmitting skb every 1ms if linear option is enabled<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0431db3f48c28 virtio-net: set qu=
eues after driver_ok<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d39fc9b94dc0 af_unix: Fix null-=
ptr-deref in unix_stream_sendpage().<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a4d8dc706c2 arm64: dts: rockch=
ip: Disable HS400 for eMMC on ROCK Pi 4<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06b64974e02ea exfat: check if fi=
lename entries exceeds max filename length<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06065b3017107 netfilter: set def=
ault timeout to 3 secs for sctp shutdown send and recv state<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a00c5d2c208b drm/amd: flush any=
 delayed gfxoff on suspend entry<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d578c919deb7 drm/qxl: fix UAF o=
n handle creation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff09f9e671ff mmc: block: Fix in=
_flight[issue_type] value error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b803fedb6e50 mmc: wbsd: fix dou=
ble mmc_free_host() in wbsd_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0961f7ce16223 cifs: Release foli=
o lock on fscache read hit.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc3f194f46e7 ALSA: usb-audio: A=
dd support for Mythware XA001AU capture and playback interfaces.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A018e27df4f2b4 serial: 8250: Fix =
oops for port-&gt;pm on uart_change_pm()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9b8ee715dbc riscv: uaccess: Re=
turn the number of bytes effectively not copied<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b2a331abcb03 ALSA: hda/realtek =
- Remodified 3k pull low procedure<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dfb9676ed25b soc: aspeed: socin=
fo: Add kfree for kstrdup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c5ac7522a8db ASoC: meson: axg-t=
dm-formatter: fix channel slot allocation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd346ef1cd2d ASoC: rt5665: add =
missed regulator_bulk_disable<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e878458d820c ARM: dts: imx: Set=
 default tuning step for imx6sx usdhc<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0430c29a54e4a arm64: dts: qcom: =
qrb5165-rb5: fix thermal zone conflict<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A003522d73a498 bus: ti-sysc: Flus=
h posted write on enable before reset<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0578371ce0d7f net: do not allow =
gso_size to be set to GSO_BY_FRAGS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05fc4fd3f3eb8 sock: Fix misuse o=
f sk_under_memory_pressure()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fc3d82d295d1 net: dsa: mv88e6xx=
x: Wait for EEPROM done before HW reset<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f11c2802e143 i40e: fix misleadi=
ng debug logs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ba2b936f3e1 iavf: fix FDIR rul=
e fields masks validation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ae6834689fd6 team: Fix incorrec=
t deletion of ETH_P_8021AD protocol vid from slaves<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00ffbc341cfae net: phy: broadcom=
: stub c45 read/write for 54810<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bf221e5e4b19 netfilter: nft_dyn=
set: disallow object maps<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09177869b85dd ipvs: fix racy mem=
cpy in proc_do_sync_threshold<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01adaec4758d1 netfilter: nf_tabl=
es: deactivate catchall elements in next generation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A082109740d610 netfilter: nf_tabl=
es: fix false-positive lockdep splat<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b2f6d73395cb drm/panel: simple:=
 Fix AUO G121EAN01 panel timings according to the docs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07207ee323afa selftests: mirror_=
gre_changes: Tighten up the TTL test match<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c2a6ffe3f1a3 net: phy: fix IRQ-=
based wake-on-lan over hibernate / power off<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08e5e967348ca xfrm: add forgotte=
n nla_policy for XFRMA_MTIMER_THRESH<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0075448a2eb75 xfrm: add NULL che=
ck in xfrm_update_ae_params<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1e04cc2ef2c ip_vti: fix potent=
ial slab-use-after-free in decode_session6<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a1639a82ce14 ip6_vti: fix slab-=
use-after-free in decode_session6<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A044b3d4096700 xfrm: fix slab-use=
-after-free in decode_session6<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a465ace883ac net: xfrm: Amend X=
FRMA_SEC_CTX nla_policy structure<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fed1cd2cd3aa net: af_key: fix s=
adb_x_filter validation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01960f468078b net: xfrm: Fix xfr=
m_address_filter OOB read<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0080dedb1cad8 i2c: designware: H=
andle invalid SMBus block data response length value<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0416c538684bd i2c: designware: C=
orrect length byte validation logic<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b966e9e1e250 btrfs: fix BUG_ON =
condition in btrfs_cancel_balance<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A077698e6ff6f0 tty: serial: fsl_l=
puart: Clear the error flags by writing 1 for lpuart32 platforms<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02a5234464383 tty: n_gsm: fix th=
e UAF caused by race condition in gsm_cleanup_mux<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08ef25fb13494 powerpc/rtas_flash=
: allow user copy to flash block cache objects<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb70e2b70f8d fbdev: mmp: fix va=
lue check in mmphw_probe()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0184f1b68bb99 i2c: hisi: Only ha=
ndle the interrupt of the driver&#39;s transfer<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4e671dae50e i2c: bcm-iproc: Fi=
x bcm_iproc_i2c_isr deadlock issue<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b99f490ea87e cifs: fix potentia=
l oops in cifs_oplock_break<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a5ae5a81bc19 vduse: Use proper =
spinlock for IRQ injection<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05b7d5c2dd664 virtio-mmio: don&#=
39;t break lifecycle of vm_dev<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0edf3b5aadb25 btrfs: move out no=
w unused BG from the reclaim list<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0170773563ef6 ARM: dts: nxp/imx6=
sll: fix wrong property name in usbphy node<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04ffbfe1c980f ARM: dts: imx6sll:=
 fixup of operating points<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e2ff5cf681a8 mmc: sunxi: fix de=
ferred probing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f93e8c5a7bd9 mmc: bcm2835: fix =
deferred probing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04eeba5d476fe USB: dwc3: fix use=
-after-free on core driver unbind<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a78fe5c9d8d5 USB: dwc3: qcom: f=
ix NULL-deref on suspend<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08a6b7534020d tty: serial: fsl_l=
puart: reduce RX watermark to 0 on LS1028A<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0701bb5fee7c3 tty: serial: fsl_l=
puart: make rx_watermark configurable for different platforms<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fa254ab7d02d tty: serial: fsl_l=
puart: Add i.MXRT1050 support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020351ddb1f41 usb: dwc3: gadget:=
 Improve dwc3_gadget_suspend() and dwc3_gadget_resume()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A031a0e60fe16b USB: dwc3: gadget:=
 drop dead hibernation code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d9e004104e45 usb: dwc3: Fix typ=
os in gadget.c<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02fa487a94667 usb: dwc3: Remove =
DWC3 locking during gadget suspend/resume<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07dfb384e76ee usb: dwc3: gadget:=
 Synchronize IRQ between soft connect/disconnect<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3c82f24ee69 drm/amd/display: f=
ix access hdcp_workqueue assert<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00ba6c7ba081e drm/amd/display: p=
hase3 mst hdcp for multiple displays<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A099c444d3c3c4 drm/amd/display: s=
ave restore hdcp state when display is unplugged from mst hub<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04f1beb75f652 ARM: dts: aspeed: =
asrock: Correct firmware flash SPI clocks<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f84c2ca3490c igc: read before w=
rite to SRRCTL register<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09fa82f031af8 iio: addac: stx104=
: Fix race condition when converting analog-to-digital<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d31d04ec404c iio: addac: stx104=
: Fix race condition for stx104_write_raw()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A089a007f3a383 iio: stx104: Move =
to addac subdirectory<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cadf8f2d7c9d iio: adc: stx104: =
Implement and utilize register structures<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06089d354346f iio: adc: stx104: =
Utilize iomap interface<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0565b96d9a7ab iio: add addac sub=
directory<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A049b830d75f03 ring-buffer: Do no=
t swap cpu_buffer during resize process<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06657ecbcc39c powerpc/kasan: Dis=
able KCOV in KASAN code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08703b26387e1 ALSA: hda: fix a p=
ossible null-pointer dereference due to data race in snd_hdac_regmap_sync()=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ed4dbc13726 ALSA: hda/realtek:=
 Add quirks for Unis H3C Desktop B760 &amp; Q760<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c7d8b5f46f06 fs/ntfs3: Mark ntf=
s dirty when on-disk struct is corrupted<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a00ec562f8c fs: ntfs3: Fix pos=
sible null-pointer dereferences in mi_read()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e7799bb4dbe2 fs/ntfs3: Enhance =
sanity check while generating attr_list<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef568da1fd84 drm/amdgpu: Fix po=
tential fence use-after-free v2<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05720c7e185d4 Bluetooth: btusb: =
Add MT7922 bluetooth ID for the Asus Ally<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0548a6b64b3c0 Bluetooth: L2CAP: =
Fix use-after-free<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0302d04596364 watchdog: sp5100_t=
co: support Hygon FCH/SCH (Server Controller Hub)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02ea70379e4f4 firewire: net: fix=
 use after free in fwnet_finish_incoming_packet()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A097fd1c8e9c5a pcmcia: rsrc_nonst=
atic: Fix memory leak in nonstatic_release_resource_db()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A085e888150075 gfs2: Fix possible=
 data races in gfs2_show_options()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eafb79d2448a usb: chipidea: imx=
: add missing USB PHY DPDM wakeup setting<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07bdb4c963049 usb: chipidea: imx=
: don&#39;t request QoS for imx8ulp<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A025decbbb66e4 thunderbolt: Read =
retimer NVM authentication status prior tb_retimer_set_inbound_sbtx()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0776b34615a29 media: platform: m=
ediatek: vpu: fix NULL ptr dereference<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb174344bf85 usb: gadget: u_ser=
ial: Avoid spinlock recursion in __gs_console_push<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01676748aa290 media: v4l2-mem2me=
m: add lock to protect parameter num_rdy<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0985086704267 smb: client: fix w=
arning in cifs_smb3_do_mount()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a3f252436e57 ovl: check type an=
d offset of struct vfsmount in ovl_entry<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01a650d3ccd79 RDMA/mlx5: Return =
the firmware result upon destroying QP/RQ<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09631d88503ab HID: add quirk for=
 03f0:464a HP Elite Presenter Mouse<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04921792e04f2 drm/amdgpu: instal=
l stub fence into potential unused fence pointers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd41646d4350 HID: logitech-hidp=
p: Add USB and Bluetooth IDs for the Logitech G915 TKL Keyboard<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff10cd3e9b3a dma-remap: use kvm=
alloc_array/kvfree for larger dma memory remap<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9ce774052ee ASoC: SOF: Intel: =
fix SoundWire/HDaudio mutual exclusion<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d53d1e4765c iopoll: Call cpu_r=
elax() in busy loops<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca66e9dd98ef ARM: dts: imx6dl: =
prtrvt, prtvt7, prti6q, prtwd2: fix USB related warnings<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc1590830859 PCI: tegra194: Fix=
 possible array out of bounds access<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e2d10f1de1fa net: tls: avoid di=
scarding data on record close<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a15ca893909 net/tls: Multi-thr=
eaded calls to TX tls_dev_del<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02d93157b7e2d net/tls: Perform i=
mmediate device ctx cleanup when possible<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051222e1c77a1 macsec: use DEV_ST=
ATS_INC()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03d64a232e4d9 macsec: Fix traffi=
c counters/statistics<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0396a1921406a selftests: forward=
ing: tc_actions: Use ncat instead of nc<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d61a0886d336 selftests: forward=
ing: tc_actions: cleanup temporary files when test is aborted<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a798977df6d0 mmc: sdhci-f-sdh30=
: Replace with sdhci_pltfm<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6f7927ac664 Linux 5.15.127<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c597d8cb0d33 timers/nohz: Last =
resort update jiffies on nohz_full IRQ entry<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b4d36e6c5dc4 timers/nohz: Switc=
h to ONESHOT_STOPPED in the low-res handler when the tick is stopped<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c3b954a51b64 tick: Detect and f=
ix jiffies update stall<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0af99918f0e39 sch_netem: fix iss=
ues in netem_change() vs get_dist_table()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05d094d4e7b99 alpha: remove __in=
it annotation from exported page_is_ram()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f8d6d25756ea scsi: qedf: Fix fi=
rmware halt over suspend and resume<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A085db1cd1744e scsi: qedi: Fix fi=
rmware halt over suspend and resume<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e70469c28953 scsi: fnic: Replac=
e return codes in fnic_clean_pending_aborts()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06bc7f4c8c27d scsi: core: Fix po=
ssible memory leak if device_add() fails<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0461f8ac666fa scsi: snic: Fix po=
ssible memory leak if device_add() fails<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0171e117cdc0a scsi: 53c700: Chec=
k that command slot is not NULL<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07a792b3d888a scsi: storvsc: Fix=
 handling of virtual Fibre Channel timeouts<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00f52d7b78251 scsi: core: Fix le=
gacy /proc parsing buffer overflow<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b757ef99df39 netfilter: nf_tabl=
es: report use refcount overflow<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09bdbbcf9d148 nvme-rdma: fix pot=
ential unbalanced freeze &amp; unfreeze<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d68f8ef6ef70 nvme-tcp: fix pote=
ntial unbalanced freeze &amp; unfreeze<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ae6e21f8bb2a btrfs: set cache_b=
lock_group_error if we find an error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0314135b7bae9 btrfs: reject inva=
lid reloc tree root keys with stack dump<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A069dd147de419 btrfs: exit gracef=
ully if reloc roots don&#39;t match<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c40d4b60c58d btrfs: don&#39;t s=
top integrity writeback too early<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0555e126dd30b ibmvnic: Handle DM=
A unmapping of login buffs in release functions<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A034fcc823823a ibmvnic: Unmap DMA=
 login rsp buffer on send login fail<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cee62753cf2e ibmvnic: Enforce s=
tronger sanity checks on login response<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A027e8db8380eb net/mlx5: Skip clo=
ck update work when device is in error state<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f638fc2f7377 net/mlx5: Allow 0 =
for total host VFs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0086a80eb6213 dmaengine: mcf-edm=
a: Fix a potential un-allocated memory access<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07e1dc94b2d50 nexthop: Fix infin=
ite nexthop bucket dump when using maximum nexthop ID<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0608a4327c257 nexthop: Make next=
hop bucket dump more efficient<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04457300cfd84 nexthop: Fix infin=
ite nexthop dump when using maximum nexthop ID<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A091307347d632 net: hns3: add wai=
t until mac link down<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0094310eb2b93 net: hns3: refacto=
r hclge_mac_link_status_wait for interface reuse<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01ae9703c2e32 net: phy: at803x: =
remove set/get wol callbacks for AR8032<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d496cd83a9d RDMA/umem: Set iov=
a in ODP flow<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f78a4238a873 wifi: cfg80211: fi=
x sband iftype data lookup for AP_VLAN<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A026a27dd76054 drm/rockchip: Don&=
#39;t spam logs in atomic check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0918c1e6843b7 IB/hfi1: Fix possi=
ble panic during hotplug remove<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0df21468bfdc8 iavf: fix potentia=
l races for FDIR filters<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b1f985cf1c52 drivers: net: prev=
ent tun_build_skb() to exceed the packet size limit<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f239c9e1d98b dccp: fix data-rac=
e around dp-&gt;dccps_mss_cache<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A049a1fee22fae bonding: Fix incor=
rect deletion of ETH_P_8021AD protocol vid from slaves<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0789fcd94c9ca xsk: fix refcount =
underflow in error path<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e95808121953 tunnels: fix kasan=
 splat when generating ipv4 pmtu error<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07903311b2cec net/packet: annota=
te data-races around tp-&gt;status<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f4614e379bf9 mISDN: Update para=
meter type of dsp_cmx_send()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03961761af392 bpf, sockmap: Fix =
bug that strp_done cannot be called<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020d53895d5c0 bpf, sockmap: Fix =
map type error in sock_map_del_link<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a09c258cfa77 net: core: remove =
unnecessary frame_sz check in bpf_xdp_adjust_tail()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A085af0b226c0b selftests: forward=
ing: tc_flower: Relax success criterion<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07b3fa99526f9 selftests: forward=
ing: Switch off timeout<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e410f85ebca9 selftests: forward=
ing: Skip test when no interfaces are specified<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04a4499452620 selftests: forward=
ing: ethtool_extended_state: Skip when using veth pairs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b8d216e9c607 selftests: forward=
ing: ethtool: Skip when using veth pairs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b9dfb80d9fb2 selftests: forward=
ing: Add a helper to skip test when using veth pairs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b973eb76dff3 selftests/rseq: Fi=
x build with undefined __weak<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b8b8db5857d4 drm/nouveau/disp: =
Revert a NULL check inside nouveau_connector_get_modes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04c6767c8bf5e x86: Move gds_ucod=
e_mitigated() declaration to header<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f919cbc90441 x86/speculation: A=
dd cpu_show_gds() prototype<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09290ef14c96b x86/mm: Fix VDSO a=
nd VVAR placement on 5-level paging machines<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0829409510d00 x86/cpu/amd: Enabl=
e Zenbleed fix for AMD Custom APU 0405<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c41a22b93d7c x86/srso: Fix buil=
d breakage with the LLVM linker<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c2372b1559d4 usb: typec: tcpm: =
Fix response to vsafe0V event<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f776b94ccdf0 usb: common: usb-c=
onn-gpio: Prevent bailing out if initial role is none<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A000cc14b52d6f usb: dwc3: Properl=
y handle processing of pending events<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07a11d1e2625b usb-storage: alaud=
a: Fix uninit-value in alauda_check_media()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0945e1b3c361b misc: rtsx: judge =
ASPM Mode to set PETXCFG Reg<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A003eebad96233 binder: fix memory=
 leak in binder_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8e2ae6296d5 iio: adc: ina2xx: =
avoid NULL pointer dereference on OF device match<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02df8ae1e42b8 iio: cros_ec: Fix =
the allocation size for cros_ec_command<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7cedc2b7612 io_uring: correct =
check for O_TMPFILE<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0697bc234632c selftests/bpf: Fix=
 sk_assign on s390x<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0127277262110 selftests/bpf: Wor=
karound verification failure for fexit_bpf2bpf/func_replace_return_code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ee701208f4cc selftests/bpf: mak=
e test_align selftest more robust<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0683d2969a082 bpf: aggressively =
forget precise markings during state checkpointing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02516deeb872a bpf: stop setting =
precise in current state<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c47d0178ad86 bpf: allow precisi=
on tracking for programs with subprogs<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03645510cf926 nilfs2: fix use-af=
ter-free of nilfs_root in dirtying inodes via iput<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A036a3b560c78d radix tree test su=
ite: fix incorrect allocation size for pthreads<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d10284243b7 hwmon: (pmbus/bel-=
pfe) Enable PMBUS_SKIP_STATUS_CHECK for pfe1100<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03ad4ba2b6112 drm/amd/display: c=
heck attr flag before set cursor degamma on DCN3+<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0621204fca047 drm/shmem-helper: =
Reset vma-&gt;vm_ops before calling dma_buf_mmap()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A064e6253f6489 drm/nouveau/gr: en=
able memory loads on helper invocation on all channels<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bcd9eeb3a309 riscv,mmio: Fix re=
adX()-to-delay() ordering<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A057772ae9b339 dmaengine: pl330: =
Return DMA_PAUSED when transaction is paused<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03ca8f5c733c4 ipv6: adjust ndisc=
_is_useropt() to also return true for PIO<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06cde60777675 mmc: moxart: read =
scr register without changing byte order<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f00757ab416 wireguard: allowed=
ips: expand maximum node depth<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aeb974907642 ksmbd: fix wrong n=
ext length validation of ea buffer in smb2_set_ea()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0595679098bdc ksmbd: validate co=
mmand request size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024c4de4069cb Linux 5.15.126<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aeb4db8ab7f1 PM: sleep: wakeirq=
: fix wake irq arming<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b5d3a4251bd2 PM / wakeirq: supp=
ort enabling wake-up irq after runtime_suspend called<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a36b522767f3 soundwire: fix enu=
meration completion<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07996facaf0ee soundwire: bus: pm=
_runtime_request_resume on peripheral attachment<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c91c07ae0849 selftests/rseq: Pl=
ay nice with binaries statically linked against glibc 2.35+<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01cdb50faf7f7 selftests/rseq: ch=
eck if libc rseq support is registered<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00f1f471b91f4 drm/imx/ipuv3: Fix=
 front porch adjustment upon hactive aligning<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05058c1444040 powerpc/mm/altmap:=
 Fix altmap boundary check<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb7a5e4d14c8 mtd: rawnand: fsl_=
upm: Fix an off-by one test in fun_exec_op()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070643e98cbc3 mtd: rawnand: rock=
chip: Align hwecc vs. raw page helper layouts<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01796b492f8cc mtd: rawnand: rock=
chip: fix oobfree offset and description<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6807b62fb0e mtd: rawnand: omap=
_elm: Fix incorrect type in assignment<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0596be6716bc5 ext2: Drop fragmen=
t support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00ccfe21949bc fs: Protect reconf=
iguration of sb read-write from racing writes<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A027d0f755d649 net: usbnet: Fix W=
ARNING in usbnet_start_xmit/usb_submit_urb<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fbe5a2fed815 Bluetooth: L2CAP: =
Fix use-after-free in l2cap_sock_ready_cb<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0afd9a31b5aa4 fs/sysv: Null chec=
k to prevent null-ptr-deref bug<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A080ec112c1996 fs/ntfs3: Use __GF=
P_NOWARN allocation at ntfs_load_attr_list()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d6f639f1dcd file: reinstate f_=
pos locking optimization for regular files<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b44d28b98f18 bpf, cpumap: Make =
sure kthread is running before map update returns<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08089eb93d678 drm/ttm: check nul=
l pointer before accessing when swapping<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef0d07c66843 open: make RESOLVE=
_CACHED correctly test for O_TMPFILE<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c81bdf8f9f2b bpf: Disable preem=
ption in bpf_event_output<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ae07cfe2b099 rbd: prevent busy =
loop when requesting exclusive lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07978bcca4c1f wifi: mt76: mt7615=
: do not advertise 5 GHz on first phy of MT7615D (DBDC)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A032ca6a55e10e net: tap_open(): s=
et sk_uid from current_fsuid()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04ed3eed99ee6 net: tun_chr_open(=
): set sk_uid from current_fsuid()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0adacc3a954fa arm64: dts: strati=
x10: fix incorrect I2C property for SCL signal<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b92c88009da1 mtd: rawnand: meso=
n: fix OOB available bytes for ECC<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0875c583e41 mtd: spinand: tosh=
iba: Fix ecc_get_status<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c33ca1e1974 exfat: release s_l=
ock before calling dir_emit()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08a34a242cf03 exfat: use kvmallo=
c_array/kvfree instead of kmalloc_array/kfree<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a74878207b02 x86/CPU/AMD: Do no=
t leak quotient data after a division by 0<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b8f029fc4075 firmware: arm_scmi=
: Drop OF node reference in the transport channel setup<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0287c2c8677ed ceph: defer stoppi=
ng mdsc delayed_work<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A098b521d10e73 USB: zaurus: Add I=
D for A-300/B-500/C-700<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd6872f2cf56 libceph: fix poten=
tial hang in ceph_osdc_notify()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e5f5b4a89809 scsi: storvsc: Lim=
it max_sectors for virtual Fibre Channel devices<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0212a9a3c67be scsi: zfcp: Defer =
fc_rport blocking until after ADISC response<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dac382725394 tcp_metrics: fix d=
ata-race in tcpm_suck_dst() vs fastopen<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04517782e1bc3 tcp_metrics: annot=
ate data-races around tm-&gt;tcpm_net<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e842a68667d4 tcp_metrics: annot=
ate data-races around tm-&gt;tcpm_vals[]<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3184bea4ace tcp_metrics: annot=
ate data-races around tm-&gt;tcpm_lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a7367cbe33d tcp_metrics: annot=
ate data-races around tm-&gt;tcpm_stamp<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06f6bd67f4894 tcp_metrics: fix a=
ddr_same() helper<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0acbcf1e7a1 prestera: fix fall=
back to previous version on same major version<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d6d9d0f5a5e0 net/mlx5: fs_core:=
 Skip the FTs in the same FS_TYPE_PRIO_CHAINS fs_prio<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c999fb1039dd net/mlx5: fs_core:=
 Make find_closest_ft more generic<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A032ef2c0c6cf1 vxlan: Fix nexthop=
 hash size<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01bb54a21f4d9 ip6mr: Fix skb_und=
er_panic in ip6mr_cache_report()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A064e3affee288 s390/qeth: Don&#39=
;t call dev_close/dev_open (DOWN/UP)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a0da2684db18 net: dcb: choose c=
orrect policy to parse DCB_ATTR_BCN<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0193333229aac net: netsec: Ignor=
e &#39;phy-mode&#39; on SynQuacer in DT mode<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0766c9dd00c5f net: korina: handl=
e clk prepare error in korina_probe()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06cecfdf65053 net: ll_temac: fix=
 error checking of irq_of_parse_and_map()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03761ff4f8670 net: ll_temac: Swi=
tch to use dev_err_probe() helper<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05c534640a7da bpf: sockmap: Remo=
ve preempt_disable in sock_map_sk_acquire<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A079c3d81c9ad1 net/sched: cls_rou=
te: No longer copy tcf_result on update to avoid use-after-free<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09edf7955025a net/sched: cls_fw:=
 No longer copy tcf_result on update to avoid use-after-free<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0262430dfc618 net/sched: cls_u32=
: No longer copy tcf_result on update to avoid use-after-free<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b58d34068fd9 bpf, cpumap: Handl=
e skb as well when clean up ptr_ring<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f04f6d9b3b06 net/sched: taprio:=
 Limit TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME to INT_MAX.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02c55d4941518 net: add missing d=
ata-race annotation for sk_ll_usec<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e934c50c48e2 net: add missing d=
ata-race annotations around sk-&gt;sk_peek_off<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fdd8d8d54d6a net: add missing R=
EAD_ONCE(sk-&gt;sk_rcvbuf) annotation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A098f0d1db3a27 net: add missing R=
EAD_ONCE(sk-&gt;sk_sndbuf) annotation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d1047b77b23 net: add missing R=
EAD_ONCE(sk-&gt;sk_rcvlowat) annotation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c058a1f67f0 net: annotate data=
-races around sk-&gt;sk_max_pacing_rate<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02950c5ac65b3 qed: Fix schedulin=
g in a tasklet while getting stats<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a19952dbb5b6 qed: Fix kernel-do=
c warnings<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06d8c259f4827 mISDN: hfcpci: Fix=
 potential deadlock on &amp;hc-&gt;lock<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08dedcc6af341 net: sched: cls_u3=
2: Fix match key mis-addressing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0675d29de69c7 perf test uprobe_f=
rom_different_cu: Skip if there is no gcc<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00f6e3d8d7f91 net: dsa: fix valu=
e check in bcm_sf2_sw_probe()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0047508edd602 rtnetlink: let rtn=
l_bridge_setlink checks IFLA_BRIDGE_MODE length<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc9ebceaa6d0 bpf: Add length ch=
eck for SK_DIAG_BPF_STORAGE_REQ_MAP_FD parsing<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f9a04c742e1 net/mlx5e: fix ret=
urn value check in mlx5e_ipsec_remove_trailer()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A000cecb0a8f9e net/mlx5: DR, fix =
memory leak in mlx5dr_cmd_create_reformat_ctx<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04c224ea31bed wifi: cfg80211: Fi=
x return value in scan logic<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08e72db3ffa5d KVM: s390: fix sth=
yi error handling<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0809edb4262f0 word-at-a-time: us=
e the same return type for has_zero regardless of endianness<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b7880809d75d arm64: dts: imx8mn=
-var-som: add missing pull-up for onboard PHY reset pinmux<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0804e72062be4 iommu/arm-smmu-v3:=
 Document nesting-related errata<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0744e6b80b830 iommu/arm-smmu-v3:=
 Add explicit feature for nesting<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd86b5944215 iommu/arm-smmu-v3:=
 Document MMU-700 erratum 2812531<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02de9f3dcfe63 iommu/arm-smmu-v3:=
 Work around MMU-600 erratum 1076982<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a850fa85d477 arm64: errata: Add=
 detection for TRBE write to out-of-range<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0073699df4a09 arm64: errata: Add=
 workaround for TSB flush failures<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A044b45e8161a5 net/mlx5: Free irq=
s only on shutdown callback<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A040601542c43c perf: Fix function=
 pointer case<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c12fa4ac8997 io_uring: gate iow=
ait schedule on having pending requests<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c275eaaaa342 Linux 5.15.125<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0754e0c7c4a30 x86: fix backwards=
 merge of GDS/SRSO bit<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b14a3924c267 xen/netback: Fix b=
uffer overrun triggered by unusual packet<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0153f9a7b02d4 x86/srso: Tie SBPB=
 bit setting to microcode patch detection<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0df4c3823cba5 x86/srso: Fix retu=
rn thunks in generated code<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00071b17eb66b x86/srso: Add IBPB=
 on VMEXIT<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05398faac76a6 x86/srso: Add IBPB=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c24aaa7dde5f x86/srso: Add SRSO=
_NO support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04e9115e194a8 x86/srso: Add IBPB=
_BRTYPE support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b35087763a44 x86/srso: Add a Sp=
eculative RAS Overflow mitigation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c3b4c644525e x86/cpu, kvm: Add =
support for CPUID_80000021_EAX<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0236dd7133394 x86/bugs: Increase=
 the x86 bugs vector size to two u32s<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00242a8bdef56 Documentation/x86:=
 Fix backwards on/off logic about YMM support<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A027a72e350869 x86/mm: Initialize=
 text poking earlier<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d0317b9502ea mm: Move mm_cachep=
 initialization to mm_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08e4c2530879d x86/mm: Use mm_all=
oc() in poking_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A013ec5cb4c113 x86/mm: fix poking=
_init() for Xen PV guests<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03e90080d5665 x86/xen: Fix secon=
dary processors&#39; FPU initialization<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0348741a9e4d3 KVM: Add GDS_NO su=
pport to KVM<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A059d78655f808 x86/speculation: A=
dd Kconfig option for GDS<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00cc5643b63ae x86/speculation: A=
dd force option to GDS mitigation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0348a89e20184 x86/speculation: A=
dd Gather Data Sampling mitigation<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a094d3b30967 x86/fpu: Move FPU =
initialization into arch_cpu_finalize_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A059f2739111ca x86/fpu: Mark init=
 functions __init<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb9c20d903f6 x86/fpu: Remove cp=
uinfo argument from init functions<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de8b7ce4c533 x86/init: Initiali=
ze signal frame size late<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0041d929233bb init, x86: Move me=
m_encrypt_init() into arch_cpu_finalize_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08ae795ed6115 init: Invoke arch_=
cpu_finalize_init() earlier<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07e270cebaffd init: Remove check=
_bugs() leftovers<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0285384ac24c3 um/cpu: Switch to =
arch_cpu_finalize_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ea421786426 sparc/cpu: Switch =
to arch_cpu_finalize_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A021a1fc8d13d8 sh/cpu: Switch to =
arch_cpu_finalize_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dfeb371a2707 mips/cpu: Switch t=
o arch_cpu_finalize_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04baf46a3ba00 m68k/cpu: Switch t=
o arch_cpu_finalize_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08c8165cd25cf ia64/cpu: Switch t=
o arch_cpu_finalize_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de8c592cc5a1 ARM: cpu: Switch t=
o arch_cpu_finalize_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A075da6209d3ba x86/cpu: Switch to=
 arch_cpu_finalize_init()<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00774fc2177c3 init: Provide arch=
_cpu_finalize_init()<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailt=
o:bruce.ashfield@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashf=
ield@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_5=
.15.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto-rt_5.15=
.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-tiny=
_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yocto-tiny_=
5.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++---<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://=
linux-yocto_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-=
yocto_5.15.bb</a> | 26 +++++++++----------<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 3 files changed, 19 insertions(+), 19 deleti=
ons(-)<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"=
http://linux-yocto-rt_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">linux-yocto-rt_5.15.bb</a> b/meta/recipes-kernel/linux/<a href=3D"http:=
//linux-yocto-rt_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">l=
inux-yocto-rt_5.15.bb</a><br>
&gt; &gt; &gt; &gt; &gt; index 6ac3118f81..f7286759a9 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://=
linux-yocto-rt_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">lin=
ux-yocto-rt_5.15.bb</a><br>
&gt; &gt; &gt; &gt; &gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://=
linux-yocto-rt_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">lin=
ux-yocto-rt_5.15.bb</a><br>
&gt; &gt; &gt; &gt; &gt; @@ -11,13 +11,13 @@ python () {<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.S=
kipRecipe(&quot;Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to =
enable it&quot;)<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine ?=3D &quot;0ac91942af8fec31671ffe6=
2e9518aaf15f110b3&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_meta ?=3D &quot;f484a7f175b4f3c4f7d2b553cd=
e232bd41f757d8&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine ?=3D &quot;423b5d5cb3f45a272285fa4=
157d1964086fabc2e&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_meta ?=3D &quot;92bd0a656f0f9db955fb53c52b=
e71cce9296bdb2&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://gi=
t.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" =
rel=3D"noreferrer noreferrer" target=3D"_blank">git.yoctoproject.org/linux-=
yocto.git;branch=3D${KBRANCH};name=3Dmachine</a> \<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git=
://<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;n=
ame=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;type=
=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA}</a>&quot;<br=
>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -LINUX_VERSION ?=3D &quot;5.15.124&quot;<br>
&gt; &gt; &gt; &gt; &gt; +LINUX_VERSION ?=3D &quot;5.15.141&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md=
5=3D6bc538ed5bd9a7fc9398086aedcd7e46&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"=
http://linux-yocto-tiny_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">linux-yocto-tiny_5.15.bb</a> b/meta/recipes-kernel/linux/<a href=3D"h=
ttp://linux-yocto-tiny_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">linux-yocto-tiny_5.15.bb</a><br>
&gt; &gt; &gt; &gt; &gt; index 9c06ddf200..7461087299 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://=
linux-yocto-tiny_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">l=
inux-yocto-tiny_5.15.bb</a><br>
&gt; &gt; &gt; &gt; &gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://=
linux-yocto-tiny_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">l=
inux-yocto-tiny_5.15.bb</a><br>
&gt; &gt; &gt; &gt; &gt; @@ -5,7 +5,7 @@ KCONFIG_MODE =3D &quot;--allnoconf=
ig&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 require recipes-kernel/linux/linux-yocto.inc=
<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -LINUX_VERSION ?=3D &quot;5.15.124&quot;<br>
&gt; &gt; &gt; &gt; &gt; +LINUX_VERSION ?=3D &quot;5.15.141&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md=
5=3D6bc538ed5bd9a7fc9398086aedcd7e46&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39=
;ARCH&#39;, &#39;x86&#39;, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;=
<br>
&gt; &gt; &gt; &gt; &gt; @@ -14,8 +14,8 @@ DEPENDS +=3D &quot;openssl-nativ=
e util-linux-native&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 KMETA =3D &quot;kernel-meta&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine ?=3D &quot;cdb289c798fe1fc9f259a08=
c32e2dd9516ccb7a4&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_meta ?=3D &quot;f484a7f175b4f3c4f7d2b553cd=
e232bd41f757d8&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine ?=3D &quot;ddf2eeeb31d1edaa5a80e9a=
abc8b2674ae95f865&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_meta ?=3D &quot;92bd0a656f0f9db955fb53c52b=
e71cce9296bdb2&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&qu=
ot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"=
http://linux-yocto_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>linux-yocto_5.15.bb</a> b/meta/recipes-kernel/linux/<a href=3D"http://linu=
x-yocto_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-yoct=
o_5.15.bb</a><br>
&gt; &gt; &gt; &gt; &gt; index 439479022b..c7b07dee62 100644<br>
&gt; &gt; &gt; &gt; &gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://=
linux-yocto_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-=
yocto_5.15.bb</a><br>
&gt; &gt; &gt; &gt; &gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://=
linux-yocto_5.15.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">linux-=
yocto_5.15.bb</a><br>
&gt; &gt; &gt; &gt; &gt; @@ -14,24 +14,24 @@ KBRANCH:qemux86=C2=A0 ?=3D &qu=
ot;v5.15/standard/base&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 KBRANCH:qemux86-64 ?=3D &quot;v5.15/standard=
/base&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 KBRANCH:qemumips64 ?=3D &quot;v5.15/standard=
/mti-malta64&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine:qemuarm ?=3D &quot;676a22c65ec0f8b=
b5dc7e13d130f6e3764959d75&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine:qemuarm64 ?=3D &quot;f0e7afd5948f7=
1be062cd9194b56cd03de94b7cb&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine:qemumips ?=3D &quot;0f1ceb9008f182=
cd7f21420bbec6f21a67da8397&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine:qemuppc ?=3D &quot;4ec9fc13283ce01=
627ef8c32617a1eb71e127c62&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine:qemuriscv64 ?=3D &quot;1c09be01f4b=
87f60ea64136459167d73502a118f&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine:qemuriscv32 ?=3D &quot;1c09be01f4b=
87f60ea64136459167d73502a118f&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine:qemux86 ?=3D &quot;1c09be01f4b87f6=
0ea64136459167d73502a118f&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine:qemux86-64 ?=3D &quot;1c09be01f4b8=
7f60ea64136459167d73502a118f&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine:qemumips64 ?=3D &quot;fad09cc6acf2=
175aa6b5979ef48cd5f05afc3da0&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine ?=3D &quot;1c09be01f4b87f60ea64136=
459167d73502a118f&quot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_meta ?=3D &quot;f484a7f175b4f3c4f7d2b553cd=
e232bd41f757d8&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine:qemuarm ?=3D &quot;0bd882ff2a47566=
033965928ab468491f7e1ffd6&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine:qemuarm64 ?=3D &quot;d353330a9ba30=
300be32f1d732723ae3678da684&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine:qemumips ?=3D &quot;7f8fbffda634dc=
22a70f69ff2b762a1f3ff9c842&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine:qemuppc ?=3D &quot;fb2191ca96824c7=
451fbca4eef129660d25711af&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine:qemuriscv64 ?=3D &quot;54a34725069=
56ed41289ae423ca9b7ad4cbb3ab5&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine:qemuriscv32 ?=3D &quot;54a34725069=
56ed41289ae423ca9b7ad4cbb3ab5&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine:qemux86 ?=3D &quot;54a3472506956ed=
41289ae423ca9b7ad4cbb3ab5&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine:qemux86-64 ?=3D &quot;54a347250695=
6ed41289ae423ca9b7ad4cbb3ab5&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine:qemumips64 ?=3D &quot;35895af6b529=
915f9c09a720592554feaca9a2c7&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine ?=3D &quot;54a3472506956ed41289ae4=
23ca9b7ad4cbb3ab5&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_meta ?=3D &quot;92bd0a656f0f9db955fb53c52b=
e71cce9296bdb2&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 # set your preferred provider of linux-yocto=
 to &#39;linux-yocto-upstream&#39;, and you&#39;ll<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 # get the &lt;version&gt;/base branch, which=
 is pure upstream -stable, and the same<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 # meta SRCREV as the linux-yocto-standard bu=
ilds. Select your version using the<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 # normal PREFERRED_VERSION settings.<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 BBCLASSEXTEND =3D &quot;devupstream:target&q=
uot;<br>
&gt; &gt; &gt; &gt; &gt; -SRCREV_machine:class-devupstream ?=3D &quot;38d4c=
a22a5288c4bae7e6d62a1728b0718d51866&quot;<br>
&gt; &gt; &gt; &gt; &gt; +SRCREV_machine:class-devupstream ?=3D &quot;9b91d=
36ba301db86bbf9e783169f7f6abf2585d8&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 PN:class-devupstream =3D &quot;linux-yocto-u=
pstream&quot;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 KBRANCH:class-devupstream =3D &quot;v5.15/ba=
se&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; @@ -39,7 +39,7 @@ SRC_URI =3D &quot;git://<a href=
=3D"http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7=
BKBRA" rel=3D"noreferrer noreferrer" target=3D"_blank">git.yoctoproject.org=
/linux-yocto.git;name=3Dmachine;branch=3D${KBRA</a><br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git=
://<a href=3D"http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;n=
ame=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">git.yoctoproject.org/yocto-kernel-cache;type=
=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA}</a>&quot;<br=
>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md=
5=3D6bc538ed5bd9a7fc9398086aedcd7e46&quot;<br>
&gt; &gt; &gt; &gt; &gt; -LINUX_VERSION ?=3D &quot;5.15.124&quot;<br>
&gt; &gt; &gt; &gt; &gt; +LINUX_VERSION ?=3D &quot;5.15.141&quot;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39=
;ARCH&#39;, &#39;x86&#39;, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;=
<br>
&gt; &gt; &gt; &gt; &gt;=C2=A0 DEPENDS +=3D &quot;openssl-native util-linux=
-native&quot;<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; 2.39.2<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait<br>
&gt; &gt; thee at its end<br>
&gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#196734): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/196734" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1967=
34</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10298649=
5/3620601" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/102986495/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sako=
man.com" target=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br></div>

--00000000000053a4c80613016df3--

