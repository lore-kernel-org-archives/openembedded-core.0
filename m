Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CC3C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 14:29:30 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.24383.1709821766577875829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 06:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HC8h3BHt;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e64647af39so930909b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 06:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709821766; x=1710426566; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AUglFtodgrWN4YG2RA0w1+nLw5CD0geJLp7f/UA2lYs=;
        b=HC8h3BHtXSPVeKZXuyI4nFEOOmc50n4C8E+imC4SBFrH89wGgHUVvcqX/AHZV5WfYG
         LNz2SbPW0lazSDC5/LsOy7+6f61pvjyK7tgQY0H68wTlU5o2YWp5gRH15RGgsEJtlyiO
         efHLBwZMnp5rN5Ismn2Pu/c/v4DC66J+dpfumhDV4ObDNsCYg+cAoMQK4usOvYei6vDO
         khDrbmQSAvVXc8MVw0HRxIltl8aqqZaYNK9f/Wqjlft2gGVh0I5PL1ZR+/i91R+ekCvU
         Mab6DRL8A07yjKGvm6xNcAeO0flHfAELij8LiwyNxxj8fBLgcHYc/MJXwopjmQ1/6RG/
         OiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709821766; x=1710426566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AUglFtodgrWN4YG2RA0w1+nLw5CD0geJLp7f/UA2lYs=;
        b=AJtLBYIAT8mvh5PV99ULu47YkPvJf9+OWpVM0tHaLcAp4wH9Uc+05SpLW7LFuFbgVC
         k0WdvLqLoFvsGb5Z3QlKllPrfchy+LlkqZKALwOOAZKAMirTxEMRcrBh+cD0V2NJr5Vs
         6nNXq2iI7YuHW++V5DC1PEgvZX3E4fMD2LeB+tKtesploCeTywPzhLUwzlWOGhnCBW70
         XsaCI6Wf0V8yqtui/FmcmpYZVWHaV8TxCIhZKKSVfTbmziD71q15odNo6jF9YgWnXje2
         A3zE05gpL3rnIPL28dNdIX2vvK0iR+HdzpY63u38Nlmxo1uezqvzZtsqCq9mboEE8FpB
         Z8uA==
X-Gm-Message-State: AOJu0YzjNpc1hr0ZScI1NXRi9gXJzxrCbzxaHvc/j6fcK+RmE+jKdqMm
	tHF0I5zbf9GgWpOJZYrJKEC0BHp0QmpPxv6N1bMDNiVl7zKudgXANcmEDR0C7jUO+bRpRIKlYj3
	AIE/PobT4G6MUgjxsJ+MHfJgCRCV2FPwB4/I=
X-Google-Smtp-Source: AGHT+IFzv3lk8q8vHB8q/s9XzucCfkB1hd+tqUhmCmv6mqDmHJeSyI3u0ONTGE7R6ChSn8y5rCR5hkkTqvcL4mMu9vs=
X-Received: by 2002:a05:6a00:1898:b0:6e5:5872:2aa2 with SMTP id
 x24-20020a056a00189800b006e558722aa2mr22885111pfh.14.1709821764967; Thu, 07
 Mar 2024 06:29:24 -0800 (PST)
MIME-Version: 1.0
References: <20231205044036.4163615-1-bruce.ashfield@gmail.com>
 <20231205044036.4163615-5-bruce.ashfield@gmail.com> <CAOSpxdZU+CoRTo=Xz+C3dk44ubHLSa7pis7sa4CyVMGJnY1_EA@mail.gmail.com>
 <CAOSpxdYcFTMY-m9TDB-wAVXu70v5DkmGfH8UjH2dLKDY-x0AbA@mail.gmail.com>
 <CADkTA4NhG1AciK=QkaYiajfXfuqc1YQ9=qJBssoKSQh4GOMcvQ@mail.gmail.com>
 <17BA3874E3FB1D6A.21429@lists.openembedded.org> <CAOSpxdYFR72uWeix5mKTJY5R-bewDQO0jMh5obByiz0h7WgDyw@mail.gmail.com>
 <CADkTA4O-F7qr2GU1cK_zd7zD9LpCKm-RrMRgkRjY6F2ZOemn5g@mail.gmail.com>
 <17BA7F82CF20F029.10210@lists.openembedded.org> <CAOSpxdYLfPpsop4C7c6DYE5bbbTh6LovcKZ5YuSb7ph6jwyA+g@mail.gmail.com>
In-Reply-To: <CAOSpxdYLfPpsop4C7c6DYE5bbbTh6LovcKZ5YuSb7ph6jwyA+g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 7 Mar 2024 09:29:12 -0500
Message-ID: <CADkTA4PYyJL3Yt-NkHejT9049NVA0BnMBTS1CDe+PjyeB6znbw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 4/4] linux-yocto/5.15: update to v5.15.141
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 14:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196794

On Thu, Mar 7, 2024 at 9:00=E2=80=AFAM Steve Sakoman <steve@sakoman.com> wr=
ote:
>
> On Thu, Mar 7, 2024 at 3:46=E2=80=AFAM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
> >
> > On Wed, Mar 6, 2024 at 7:42=E2=80=AFAM Bruce Ashfield <bruce.ashfield@g=
mail.com> wrote:
> > >
> > > On Wed, Mar 6, 2024 at 12:38=E2=80=AFPM Steve Sakoman <steve@sakoman.=
com> wrote:
> > > >
> > > >
> > > >
> > > > On Wed, Mar 6, 2024 at 6:04=E2=80=AFAM Steve Sakoman via lists.open=
embedded.org <steve=3Dsakoman.com@lists.openembedded.org> wrote:
> > > > >
> > > > > On Wed, Mar 6, 2024 at 5:59=E2=80=AFAM Bruce Ashfield <bruce.ashf=
ield@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Mar 6, 2024 at 10:43=E2=80=AFAM Steve Sakoman <steve@sa=
koman.com> wrote:
> > > > > > >
> > > > > > > On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM Steve Sakoman <steve@s=
akoman.com> wrote:
> > > > > > > >
> > > > > > > > Hi Bruce,
> > > > > > > >
> > > > > > > > The 5.10 version bumps look fine in testing, but sadly this=
 5.15
> > > > > > > > version bump breaks qemux86-64-ptest:
> > > > > > > >
> > > > > > > > AssertionError: Failed ptests:
> > > > > > > > {'parted': ['t1104-remove-and-add-partition.sh',
> > > > > > > >             't8000-loop.sh',
> > > > > > > >             't8001-loop-blkpg.sh']}
> > > > > > > >
> > > > > > > > Failure is reproducible 100% of the time, so there is that =
...
> > > > > > >
> > > > > > > After  wading through the hundreds of changes in this version=
 bump
> > > > > > > from 5.15.124 to 5.15.141 I found this in the 5.13.132 portio=
n that
> > > > > > > looks suspicious:
> > > > > > >
> > > > > > > 072cd213c64f block: don't add or resize partition on the disk=
 with
> > > > > > > GENHD_FL_NO_PART
> > > > > > > c6ce1c5dd327 block: rename GENHD_FL_NO_PART_SCAN to GENHD_FL_=
NO_PART
> > > > > > >
> > > > > >
> > > > > > It could very well be that, I haven't been able to get to any l=
ocal
> > > > > > testing on this
> > > > > > yet.
> > > > > >
> > > > > > I will go look at parted for commits that indicate they are fix=
ing a
> > > > > > kernel interface
> > > > > > that sounds similar .. since we don't want to revert an offendi=
ng commit, the
> > > > > > way to fix this is via selective update of parted.
> > > > >
> > > > > I'm doing a test kirkstone build that bumps parted to the same ve=
rsion
> > > > > as in master.
> > > > >
> > > > > This will at least let us know whether it has been fixed in upstr=
eam parted.
> > > >
> > > > The test completed and I get the same failure with the most recent =
parted version.
> > > >
> > > > So apparently not fixed in parted.
> > >
> > > Which means that the newer kernels have some sort of additional fix o=
r a revert.
> > >
> > > I'll have a look for that as well.
> >
> > From looking at how Ubuntu deals with this
> > (https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2056143):
> >
> > -- Impact --
> > In 22.04/Jammy with the GA 5.15 kernel there was an upstream change
> > preventing partition table operations when GENHD_FL_NO_PART is set.
> >  1a721de8489f "block: don't add or resize partition on the disk with
> > GENHD_FL_NO_PART"
> > Beside of changing return codes and breaking some user-space that way
> > this also causes loop block devices to no longer be able to have
> > partitions manually created. This is because the loop block driver
> > uses GENHD_FL_NO_PART to prevent active partition scans.
> >
> > -- Fix --
> > This was changed in 5.19 (and thus Mantic is not affected) by
> > introducing a separate flag to prevent those scans:
> >  b9684a71fca7 "block, loop: support partitions without scanning"
> > The fix depends on a larger rewrite so it cannot be simply picked. The
> > biggest change from the original is moving the check for the new flag
> > into a helper function in genhd.h which checks whether a disk should
> > be scanned for partitions. That function was dropped with the upstream
> > rewrite and checking moved into the loop driver directly. But it felt
> > like adjusting the helper was the better approach.
> >
> > Note: The upstream patch has a follow-up change submitted:
> >   748008e1da92 "block: don't add partitions if GD_SUPPRESS_PART_SCAN is=
 set"
> > We do _NOT_ need that in Jammy/5.15 because block/partitions/core.c:
> > blk_add_partitions() checks disk_part_scan_enabled() which was where
> > we added the check for the backport instead of modifying
> > disk_scan_partitions() directly.
>
> Forgot to add this:
>
> https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/jammy/=
commit/?h=3Dmaster-next--2024.03.04-1&id=3Dc3032b60ff7b3948325b8f2bd688b9a7=
4be3cfb9
>

Assuming that I'm reading the summary correctly, I'm inclined to
cherry pick 748008e1da92 [ block: don't add partitions if
GD_SUPPRESS_PART_SCAN is set]
into the linux-yocto 5.15 kernel branches.

The commit referenced in the link above doesn't cherry-pick cleanly
(it seems tangled
up in other Ubuntu kernel changes), but 748008e1da92 is simple and
does cherry-pick
without any fuss.

I never did get set up to run the tests myself, but I can send you SRCREV b=
umps
with 748008e1da92 merged into the tree. That's the fastest route to
get it tested.
Alternatively, we wait for me to get a test environment setup or it
could even be a
SRC_URI patch (versus me merging it).

Worst thing that can happen if I merge it, is that it doesn't fix the
problem and I do
a revert, or just stack more changes on top to fix the problem.

Let me know your preference, and I'll pull something together.

Bruce


> Steve
>
> > > > > > > > On Mon, Dec 4, 2023 at 6:40=E2=80=AFPM <bruce.ashfield@gmai=
l.com> wrote:
> > > > > > > > >
> > > > > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > > > >
> > > > > > > > > Updating  to the latest korg -stable release that compris=
es
> > > > > > > > > the following commits:
> > > > > > > > >
> > > > > > > > >     9b91d36ba301 Linux 5.15.141
> > > > > > > > >     313a34d1c0ee io_uring: fix off-by one bvec index
> > > > > > > > >     49ae2e4e8ed3 USB: dwc3: qcom: fix wakeup after probe =
deferral
> > > > > > > > >     eb17fb4b160a USB: dwc3: qcom: fix software node leak =
on probe errors
> > > > > > > > >     98f0e9b6276f usb: dwc3: set the dma max_seg_size
> > > > > > > > >     1a3dcb1d811d usb: dwc3: Fix default mode initializati=
on
> > > > > > > > >     a22702a81844 USB: dwc2: write HCINT with INTMASK appl=
ied
> > > > > > > > >     1134fde92088 usb: typec: tcpm: Skip hard reset when i=
n error recovery
> > > > > > > > >     64830d041515 USB: serial: option: don't claim interfa=
ce 4 for ZTE MF290
> > > > > > > > >     9611cbc6a132 USB: serial: option: fix FM101R-GL defin=
es
> > > > > > > > >     a8d80b1fbacf USB: serial: option: add Fibocom L7xx mo=
dules
> > > > > > > > >     de8c6fce8d09 usb: cdnsp: Fix deadlock issue during us=
ing NCM gadget
> > > > > > > > >     dd0cc4b69f7d bcache: fixup lock c->root error
> > > > > > > > >     a912742d8411 bcache: fixup init dirty data errors
> > > > > > > > >     137660f84462 bcache: prevent potential division by ze=
ro error
> > > > > > > > >     f7077ce8d97b bcache: check return value from btree_no=
de_alloc_replacement()
> > > > > > > > >     1eed01092101 dm-delay: fix a race between delay_presu=
spend and delay_bio
> > > > > > > > >     d181a7a1d55d hv_netvsc: Mark VF as slave before expos=
ing it to user-mode
> > > > > > > > >     97683466e24c hv_netvsc: Fix race of register_netdevic=
e_notifier and VF register
> > > > > > > > >     3841921018a2 USB: serial: option: add Luat Air72*U se=
ries products
> > > > > > > > >     6062c527d040 s390/dasd: protect device queue against =
concurrent access
> > > > > > > > >     35b5d86e43ec io_uring/fs: consider link->flags when g=
etting path for LINKAT
> > > > > > > > >     2bb75a2c3490 bcache: fixup multi-threaded bch_sectors=
_dirty_init() wake-up race
> > > > > > > > >     6f09318fd90a md: fix bi_status reporting in md_end_cl=
one_io
> > > > > > > > >     72ecb9753cbe bcache: replace a mistaken IS_ERR() by I=
S_ERR_OR_NULL() in btree_gc_coalesce()
> > > > > > > > >     e09ba90f1ad0 swiotlb-xen: provide the "max_mapping_si=
ze" method
> > > > > > > > >     0f05021e937c ACPI: resource: Skip IRQ override on ASU=
S ExpertBook B1402CVA
> > > > > > > > >     f95e9f7afe86 proc: sysctl: prevent aliased sysctls fr=
om getting passed to init
> > > > > > > > >     3f3880fc011c ext4: make sure allocate pending entry n=
ot fail
> > > > > > > > >     e33eb4997585 ext4: fix slab-use-after-free in ext4_es=
_insert_extent()
> > > > > > > > >     859893f61906 ext4: using nofail preallocation in ext4=
_es_insert_extent()
> > > > > > > > >     048e7f38b31c ext4: using nofail preallocation in ext4=
_es_insert_delayed_block()
> > > > > > > > >     580b9dd6ab0b ext4: using nofail preallocation in ext4=
_es_remove_extent()
> > > > > > > > >     66bc78a295b3 ext4: use pre-allocated es in __es_remov=
e_extent()
> > > > > > > > >     b1995ba6269c ext4: use pre-allocated es in __es_inser=
t_extent()
> > > > > > > > >     edec12712ae1 ext4: factor out __es_alloc_extent() and=
 __es_free_extent()
> > > > > > > > >     e82d05cf5ccb ext4: add a new helper to check if es mu=
st be kept
> > > > > > > > >     612edd488872 media: qcom: camss: Fix csid-gen2 for te=
st pattern generator
> > > > > > > > >     ceb5276d8c99 media: qcom: camss: Fix set CSI2_RX_CFG1=
_VC_MODE when VC is greater than 3
> > > > > > > > >     f001e6f62693 media: camss: sm8250: Virtual channels f=
or CSID
> > > > > > > > >     9fb81ca7aa05 media: camss: Replace hard coded value w=
ith parameter
> > > > > > > > >     8ef9b32f20ab MIPS: KVM: Fix a build warning about var=
iable set but not used
> > > > > > > > >     6ddaca6b20f7 lockdep: Fix block chain corruption
> > > > > > > > >     61747778a88b USB: dwc3: qcom: fix ACPI platform devic=
e leak
> > > > > > > > >     027472889970 USB: dwc3: qcom: fix resource leaks on p=
robe deferral
> > > > > > > > >     e26c6febac43 nvmet: nul-terminate the NQNs passed in =
the connect command
> > > > > > > > >     b5d50c6a609d afs: Fix file locking on R/O volumes to =
operate in local mode
> > > > > > > > >     84ebfbed3ae0 afs: Return ENOENT if no cell DNS record=
 can be found
> > > > > > > > >     6aeac88a45de net: axienet: Fix check for partial TX c=
hecksum
> > > > > > > > >     293acba84108 amd-xgbe: propagate the correct speed an=
d duplex status
> > > > > > > > >     b3874cc25a70 amd-xgbe: handle the corner-case during =
tx completion
> > > > > > > > >     e949dbc28cd5 amd-xgbe: handle corner-case during sfp =
hotplug
> > > > > > > > >     01a8b94726b1 octeontx2-pf: Fix ntuple rule creation t=
o direct packet to VF with higher Rx queue than its PF
> > > > > > > > >     fcc4a03ad3b1 arm/xen: fix xen_vcpu_info allocation al=
ignment
> > > > > > > > >     90072af9efe8 net/smc: avoid data corruption caused by=
 decline
> > > > > > > > >     66c023469b3e net: usb: ax88179_178a: fix failed opera=
tions during ax88179_reset
> > > > > > > > >     ba81c5228ef8 ipv4: Correct/silence an endian warning =
in __ip_do_redirect
> > > > > > > > >     364406d4c114 HID: fix HID device resource race betwee=
n HID core and debugging support
> > > > > > > > >     52badc06b119 HID: core: store the unique system ident=
ifier in hid_device
> > > > > > > > >     221be624a55d drm/rockchip: vop: Fix color for RGB888/=
BGR888 format on VOP full
> > > > > > > > >     b0c835fd7d89 ata: pata_isapnp: Add missing error chec=
k for devm_ioport_map()
> > > > > > > > >     9754a498aa5b octeontx2-pf: Fix memory leak during int=
erface down
> > > > > > > > >     be41c0c4a632 wireguard: use DEV_STATS_INC()
> > > > > > > > >     f163a6d17a95 drm/panel: simple: Fix Innolux G101ICE-L=
01 timings
> > > > > > > > >     608de3a587eb drm/panel: simple: Fix Innolux G101ICE-L=
01 bus flags
> > > > > > > > >     18bd108a13cb drm/panel: auo,b101uan08.3: Fine tune th=
e panel power sequence
> > > > > > > > >     9fe5718d3f09 drm/panel: boe-tv101wum-nl6: Fine tune t=
he panel power sequence
> > > > > > > > >     c8a49336e1de afs: Make error on cell lookup failure c=
onsistent with OpenAFS
> > > > > > > > >     ac239fccf5a5 afs: Fix afs_server_list to be cleaned u=
p with RCU
> > > > > > > > >     a78d278e01b1 Linux 5.15.140
> > > > > > > > >     947c9e12ddd6 driver core: Release all resources durin=
g unbind before updating device links
> > > > > > > > >     5a434d5c3823 Input: xpad - add VID for Turtle Beach c=
ontrollers
> > > > > > > > >     cbc7c29dff0f tracing: Have trace_event_file have ref =
counters
> > > > > > > > >     1dcf90c9fa01 powerpc/powernv: Fix fortify source warn=
ings in opal-prd.c
> > > > > > > > >     3d7912710e5e io_uring/fdinfo: lock SQ thread while re=
trieving thread cpu/pid
> > > > > > > > >     595b051c83a1 drm/amd/display: Change the DMCUB mailbo=
x memory location from FB to inbox
> > > > > > > > >     a2a6e97c4b33 drm/amdgpu: fix error handling in amdgpu=
_bo_list_get()
> > > > > > > > >     e380992c479b drm/amdgpu: don't use ATRM for external =
devices
> > > > > > > > >     4ff985b8810c drm/i915: Fix potential spectre vulnerab=
ility
> > > > > > > > >     ea0c4d5ec57f drm/amd/pm: Handle non-terminated overdr=
ive commands.
> > > > > > > > >     9ce842d7762a ext4: add missed brelse in update_backup=
s
> > > > > > > > >     ce19c20064b6 ext4: remove gdb backup copy for meta bg=
 in setup_new_flex_group_blocks
> > > > > > > > >     ac45d8e34bed ext4: correct the start block of countin=
g reserved clusters
> > > > > > > > >     8f9842c4b925 ext4: correct return value of ext4_conve=
rt_meta_bg
> > > > > > > > >     8798d3b2722d ext4: correct offset of gdb backup in no=
n meta_bg group to update_backups
> > > > > > > > >     8a3bb38bfdaf ext4: apply umask if ACL support is disa=
bled
> > > > > > > > >     d5c380149b96 Revert "net: r8169: Disable multicast fi=
lter for RTL8168H and RTL8107E"
> > > > > > > > >     6ad3d8594d5e media: qcom: camss: Fix missing vfe_lite=
 clocks check
> > > > > > > > >     e0376cf06950 media: qcom: camss: Fix VFE-17x vfe_disa=
ble_output()
> > > > > > > > >     8f733387d17f media: qcom: camss: Fix vfe_get() error =
jump
> > > > > > > > >     841fc648fbb5 media: qcom: camss: Fix pm_domain_on seq=
uence in probe
> > > > > > > > >     4c9c43f79a12 mmc: sdhci-pci-gli: GL9750: Mask the rep=
lay timer timeout of AER
> > > > > > > > >     72bf271c5a77 r8169: fix network lost after resume on =
DASH systems
> > > > > > > > >     468e3ebf4786 mm: kmem: drop __GFP_NOFAIL when allocat=
ing objcg vectors
> > > > > > > > >     0387978fda07 mmc: sdhci-pci-gli: A workaround to allo=
w GL9750 to enter ASPM L1.2
> > > > > > > > >     070b3ccb9b8b riscv: kprobes: allow writing to x0
> > > > > > > > >     cd0e9f475a46 nfsd: fix file memleak on client_opens_r=
elease
> > > > > > > > >     114c9d732cf9 media: ccs: Correctly initialise try com=
pose rectangle
> > > > > > > > >     6c8aeeb2c549 media: venus: hfi: add checks to handle =
capabilities from firmware
> > > > > > > > >     cdeb0a4cf327 media: venus: hfi: fix the check to hand=
le session buffer requirement
> > > > > > > > >     7d62570f75fe media: venus: hfi_parser: Add check to k=
eep the number of codecs within range
> > > > > > > > >     d0d831e7d68d media: sharp: fix sharp encoding
> > > > > > > > >     6003733c8f95 media: lirc: drop trailing space from sc=
ancode transmit
> > > > > > > > >     e4088d7d8f11 f2fs: avoid format-overflow warning
> > > > > > > > >     12055238d046 i2c: i801: fix potential race in i801_bl=
ock_transaction_byte_by_byte
> > > > > > > > >     336e6db5c120 net: phylink: initialize carrier state a=
t creation
> > > > > > > > >     d8cb287d31cb net: dsa: lan9303: consequently nested-l=
ock physical MDIO
> > > > > > > > >     656262cb0f95 net: ethtool: Fix documentation of ethto=
ol_sprintf()
> > > > > > > > >     acca20cc16f3 s390/ap: fix AP bus crash on early confi=
g change callback invocation
> > > > > > > > >     019b7d42a416 i2c: designware: Disable TX_EMPTY irq wh=
ile waiting for block length byte
> > > > > > > > >     c6e89348fd58 sbsa_gwdt: Calculate timeout with 64-bit=
 math
> > > > > > > > >     132670ae9ffb lsm: fix default return value for inode_=
getsecctx
> > > > > > > > >     223196b50605 lsm: fix default return value for vm_eno=
ugh_memory
> > > > > > > > >     06d320ca170b Revert "i2c: pxa: move to generic GPIO r=
ecovery"
> > > > > > > > >     ddec3d04f874 Revert ncsi: Propagate carrier gain/loss=
 events to the NCSI controller
> > > > > > > > >     ad0b74d0f331 powerpc/pseries/ddw: simplify enable_ddw=
()
> > > > > > > > >     b3e993de400e arm64: dts: qcom: ipq6018: Fix tcsr_mute=
x register size
> > > > > > > > >     b99ac20612ca arm64: dts: qcom: ipq6018: switch TCSR m=
utex to MMIO
> > > > > > > > >     aaf0a07d6088 ksmbd: fix slab out of bounds write in s=
mb_inherit_dacl()
> > > > > > > > >     1c701423bb03 Bluetooth: btusb: Add 0bda:b85b for Fn-L=
ink RTL8852BE
> > > > > > > > >     36a573b32550 Bluetooth: btusb: Add RTW8852BE device 1=
3d3:3570 to device tables
> > > > > > > > >     c4976160a0a4 bluetooth: Add device 13d3:3571 to devic=
e tables
> > > > > > > > >     603e77e9e8c0 bluetooth: Add device 0bda:887b to devic=
e tables
> > > > > > > > >     e9bb966c50a7 Bluetooth: btusb: Add Realtek RTL8852BE =
support ID 0x0cb8:0xc559
> > > > > > > > >     cf642ee641ce cpufreq: stats: Fix buffer overflow dete=
ction in trans_stats()
> > > > > > > > >     63e09cdfe948 regmap: Ensure range selector registers =
are updated after cache sync
> > > > > > > > >     0c49e74e95bf tty: serial: meson: fix hard LOCKUP on c=
rtscts mode
> > > > > > > > >     6f26b6a61b08 serial: meson: Use platform_get_irq() to=
 get the interrupt
> > > > > > > > >     450fa8bf803f ALSA: hda/realtek - Enable internal spea=
ker of ASUS K6500ZC
> > > > > > > > >     cc549ba50bb8 ALSA: hda/realtek - Add Dell ALC295 to p=
in fall back table
> > > > > > > > >     767c988771cb ALSA: info: Fix potential deadlock at di=
sconnection
> > > > > > > > >     09022ae66261 xhci: Enable RPM on controllers that sup=
port low-power states
> > > > > > > > >     68574fe2e488 parisc/pgtable: Do not drop upper 5 addr=
ess bits of physical address
> > > > > > > > >     ea7593c18ff7 parisc: Prevent booting 64-bit kernels o=
n PA1.x machines
> > > > > > > > >     2c9092e8b29a i3c: master: svc: fix SDA keep low when =
polling IBIWON timeout happen
> > > > > > > > >     da754f92fc02 i3c: master: svc: fix check wrong status=
 register in irq handler
> > > > > > > > >     5ba77b6b45d6 i3c: master: svc: fix ibi may not return=
 mandatory data byte
> > > > > > > > >     e0a70ed4a580 i3c: master: svc: fix wrong data return =
when IBI happen during start frame
> > > > > > > > >     7383675aba2f i3c: master: svc: fix race condition in =
ibi work thread
> > > > > > > > >     cc7efd1054f4 i3c: master: cdns: Fix reading status re=
gister
> > > > > > > > >     d3c6a08c2b77 mtd: cfi_cmdset_0001: Byte swap OTP info
> > > > > > > > >     a4668088128d mm/memory_hotplug: use pfn math in place=
 of direct struct page manipulation
> > > > > > > > >     792a796085cf mm/cma: use nth_page() in place of direc=
t struct page manipulation
> > > > > > > > >     9b59fc31226e s390/cmma: fix detection of DAT pages
> > > > > > > > >     45bb94aab891 dmaengine: stm32-mdma: correct desc prep=
 when channel running
> > > > > > > > >     91659b77e937 mcb: fix error handling for different sc=
enarios when parsing
> > > > > > > > >     534790fde890 tracing: Have the user copy of synthetic=
 event address use correct context
> > > > > > > > >     f6237afabc34 i2c: core: Run atomic i2c xfer when !pre=
emptible
> > > > > > > > >     931aa7154bc4 kernel/reboot: emergency_restart: Set co=
rrect system_state
> > > > > > > > >     7a3424c3b76a quota: explicitly forbid quota files fro=
m being encrypted
> > > > > > > > >     47f509832168 jbd2: fix potential data lost in recover=
ing journal raced with synchronizing fs bdev
> > > > > > > > >     f13e1ea45699 ASoC: codecs: wsa-macro: fix uninitializ=
ed stack variables with name prefix
> > > > > > > > >     28436d8092ad selftests/resctrl: Reduce failures due t=
o outliers in MBA/MBM tests
> > > > > > > > >     6ce63598a1fb selftests/resctrl: Remove duplicate feat=
ure check from CMT test
> > > > > > > > >     e90efe17fc07 netfilter: nf_tables: split async and sy=
nc catchall in two functions
> > > > > > > > >     0d9506c766c9 netfilter: nf_tables: remove catchall el=
ement in GC sync path
> > > > > > > > >     96fc7a50a278 PCI: keystone: Don't discard .probe() ca=
llback
> > > > > > > > >     e0d394df9812 PCI: keystone: Don't discard .remove() c=
allback
> > > > > > > > >     f4f12667167c KEYS: trusted: Rollback init_trusted() c=
onsistently
> > > > > > > > >     c407ff72fb3a genirq/generic_chip: Make irq_remove_gen=
eric_chip() irqdomain aware
> > > > > > > > >     bc8a14e3c630 mmc: meson-gx: Remove setting of CMD_CFG=
_ERROR
> > > > > > > > >     3a51e6b4da71 wifi: ath11k: fix htt pktlog locking
> > > > > > > > >     426e718ce9ba wifi: ath11k: fix dfs radar event lockin=
g
> > > > > > > > >     e9d84413b1b7 wifi: ath11k: fix temperature event lock=
ing
> > > > > > > > >     5ff849948c11 ima: detect changes to the backing overl=
ay file
> > > > > > > > >     4584a421a6d9 ima: annotate iint mutex to avoid lockde=
p false positive warnings
> > > > > > > > >     4049576c639f ACPI: FPDT: properly handle invalid FPDT=
 subtables
> > > > > > > > >     628e76e684c8 firmware: qcom_scm: use 64-bit calling c=
onvention only when client is 64-bit
> > > > > > > > >     6eb8c191e360 btrfs: don't arbitrarily slow down delal=
loc if we're committing
> > > > > > > > >     0b99626b28ca rcu: kmemleak: Ignore kmemleak false pos=
itives when RCU-freeing objects
> > > > > > > > >     71f5344f477c PM: hibernate: Clean up sync_read handli=
ng in snapshot_write_next()
> > > > > > > > >     57dbc0eb8abe PM: hibernate: Use __get_safe_page() rat=
her than touching the list
> > > > > > > > >     87a30633b5d3 arm64: dts: qcom: ipq6018: Fix hwlock in=
dex for SMEM
> > > > > > > > >     ebaee06a7292 rcu/tree: Defer setting of jiffies durin=
g stall reset
> > > > > > > > >     057d1034d012 svcrdma: Drop connection after an RDMA R=
ead error
> > > > > > > > >     541b3757fd44 wifi: wilc1000: use vmm_table as array i=
n wilc struct
> > > > > > > > >     b156f62f19da PCI: exynos: Don't discard .remove() cal=
lback
> > > > > > > > >     f88796721002 PCI/ASPM: Fix L1 substate handling in as=
pm_attr_store_common()
> > > > > > > > >     467864d55b52 mmc: sdhci_am654: fix start loop index f=
or TAP value parsing
> > > > > > > > >     ef34a97bb9cb mmc: vub300: fix an error code
> > > > > > > > >     36adb6204cff clk: qcom: ipq6018: drop the CLK_SET_RAT=
E_PARENT flag from PLL clocks
> > > > > > > > >     090b167b2c41 clk: qcom: ipq8074: drop the CLK_SET_RAT=
E_PARENT flag from PLL clocks
> > > > > > > > >     18640a1818f1 clk: socfpga: Fix undefined behavior bug=
 in struct stratix10_clock_data
> > > > > > > > >     4d17b54c9be3 parisc/pdc: Add width field to struct pd=
c_model
> > > > > > > > >     936c9c10efae arm64: Restrict CPU_BIG_ENDIAN to GNU as=
 or LLVM IAS 15.x or newer
> > > > > > > > >     8b24bb54bf3a ACPI: resource: Do IRQ override on TongF=
ang GMxXGxx
> > > > > > > > >     5619c34d3c4c watchdog: move softlockup_panic back to =
early_param
> > > > > > > > >     a6c3a1fe09a2 PCI/sysfs: Protect driver's D3cold prefe=
rence from user space
> > > > > > > > >     01975bee0a14 hvc/xen: fix event channel handling for =
secondary consoles
> > > > > > > > >     cfd543c10871 hvc/xen: fix error path in xen_hvc_init(=
) to always register frontend driver
> > > > > > > > >     730e08cb9101 hvc/xen: fix console unplug
> > > > > > > > >     fa0b93a3de40 tty/sysrq: replace smp_processor_id() wi=
th get_cpu()
> > > > > > > > >     92e6c0f00d38 audit: don't WARN_ON_ONCE(!current->mm) =
in audit_exe_compare()
> > > > > > > > >     e29c095f1ad4 audit: don't take task_lock() in audit_e=
xe_compare() code path
> > > > > > > > >     5eb6519f483e KVM: x86: Ignore MSR_AMD64_TW_CFG access
> > > > > > > > >     1c49ef7041f2 KVM: x86: hyper-v: Don't auto-enable sti=
mer on write from user-space
> > > > > > > > >     fe6b461c37cb x86/cpu/hygon: Fix the CPU topology eval=
uation for real
> > > > > > > > >     3a2adf48d8b1 crypto: x86/sha - load modules based on =
CPU features
> > > > > > > > >     be079aa71a12 scsi: qla2xxx: Fix system crash due to b=
ad pointer access
> > > > > > > > >     6ba3569f78d3 scsi: megaraid_sas: Increase register re=
ad retry rount from 3 to 30 for selected registers
> > > > > > > > >     6a33b5810031 scsi: mpt3sas: Fix loop logic
> > > > > > > > >     3c5aede46cdc bpf: Fix precision tracking for BPF_ALU =
| BPF_TO_BE | BPF_END
> > > > > > > > >     403470431b15 bpf: Fix check_stack_write_fixed_off() t=
o correctly spill imm
> > > > > > > > >     ba115f6c3a8c randstruct: Fix gcc-plugin performance m=
ode to stay in group
> > > > > > > > >     2771fac4382b powerpc/perf: Fix disabling BHRB and ins=
truction sampling
> > > > > > > > >     7e450cc9ad54 media: venus: hfi: add checks to perform=
 sanity on queue pointers
> > > > > > > > >     1566e8be73fd i915/perf: Fix NULL deref bugs with drm_=
dbg() calls
> > > > > > > > >     35c17257ef09 xfs: Fix unreferenced object reported by=
 kmemleak in xfs_sysfs_init()
> > > > > > > > >     5db146322b17 xfs: fix memory leak in xfs_errortag_ini=
t
> > > > > > > > >     c540284d8488 xfs: fix exception caused by unexpected =
illegal bestcount in leaf dir
> > > > > > > > >     5212d586e76f xfs: avoid a UAF when log intent item re=
covery fails
> > > > > > > > >     ba179cc12109 xfs: fix inode reservation space for rem=
oving transaction
> > > > > > > > >     b7847653a2d6 xfs: Fix false ENOSPC when performing di=
rect write on a delalloc extent in cow fork
> > > > > > > > >     92d38b87e886 xfs: add missing cmap->br_state =3D XFS_=
EXT_NORM update
> > > > > > > > >     8d0baec78e8a xfs: fix intermittent hang during quotac=
heck
> > > > > > > > >     76545c0e881b xfs: don't leak memory when attr fork lo=
ading fails
> > > > > > > > >     eb888caf27d9 xfs: fix use-after-free in xattr node bl=
ock inactivation
> > > > > > > > >     4cb3842967e6 xfs: flush inode gc workqueue before cle=
aring agi bucket
> > > > > > > > >     188594c64a1e xfs: prevent a UAF when log IO errors ra=
ce with unmount
> > > > > > > > >     921c96215850 xfs: use invalidate_lock to check the st=
ate of mmap_lock
> > > > > > > > >     efd194800b69 xfs: convert buf_cancel_table allocation=
 to kmalloc_array
> > > > > > > > >     074fee186931 xfs: don't leak xfs_buf_cancel structure=
s when recovery fails
> > > > > > > > >     b8effd31a862 xfs: refactor buffer cancellation table =
allocation
> > > > > > > > >     4968c2aa6a1f cifs: fix check of rc in function genera=
te_smb3signingkey
> > > > > > > > >     8d725bf0d16d cifs: spnego: add ';' in HOST_KEY_LEN
> > > > > > > > >     21accf149161 tools/power/turbostat: Enable the C-stat=
e Pre-wake printing
> > > > > > > > >     0045c1ff7ac0 tools/power/turbostat: Fix a knl bug
> > > > > > > > >     5bcce23f387b macvlan: Don't propagate promisc change =
to lower dev in passthru
> > > > > > > > >     7574b5e65e92 net/mlx5e: Check return value of snprint=
f writing to fw_version buffer for representors
> > > > > > > > >     55553c5b53ae net/mlx5e: Reduce the size of icosq_str
> > > > > > > > >     51655fd35703 net/mlx5e: Fix pedit endianness
> > > > > > > > >     a990dd7410ec net/mlx5e: Refactor mod header managemen=
t API
> > > > > > > > >     39f95b1d0d8f net/mlx5e: Move mod hdr allocation to a =
single place
> > > > > > > > >     c0f37a3715cb net/mlx5e: Remove incorrect addition of =
action fwd flag
> > > > > > > > >     6974fd92d5f1 net/mlx5e: fix double free of encap_head=
er in update funcs
> > > > > > > > >     f3c4a7044201 net/mlx5e: fix double free of encap_head=
er
> > > > > > > > >     931e9e8e30bf net: stmmac: fix rx budget limit check
> > > > > > > > >     b8b514b2a6cd netfilter: nf_tables: fix pointer math i=
ssue in nft_byteorder_eval()
> > > > > > > > >     25da0f582119 netfilter: nf_tables: add and use BE reg=
ister load-store helpers
> > > > > > > > >     a48f6be5bdb7 netfilter: nf_tables: use the correct ge=
t/put helpers
> > > > > > > > >     7d3901bf3baa netfilter: nf_conntrack_bridge: initiali=
ze err to 0
> > > > > > > > >     75bcfc188abf af_unix: fix use-after-free in unix_stre=
am_read_actor()
> > > > > > > > >     0b480c654ef2 net: ethernet: cortina: Fix MTU max sett=
ing
> > > > > > > > >     097588e20c6b net: ethernet: cortina: Handle large fra=
mes
> > > > > > > > >     f9269b274cdf net: ethernet: cortina: Fix max RX frame=
 define
> > > > > > > > >     53064e8239dd bonding: stop the device in bond_setup_b=
y_slave()
> > > > > > > > >     cda210a4bdf7 ptp: annotate data-race around q->head a=
nd q->tail
> > > > > > > > >     b67d16b2373b xen/events: fix delayed eoi list handlin=
g
> > > > > > > > >     8531a4194e59 ppp: limit MRU to 64K
> > > > > > > > >     9ae82308d184 tipc: Fix kernel-infoleak due to uniniti=
alized TLV value
> > > > > > > > >     359c65daf6b5 net: hns3: fix VF wrong speed and duplex=
 issue
> > > > > > > > >     406be003d698 net: hns3: fix VF reset fail issue
> > > > > > > > >     cfc131b078a3 net: hns3: fix variable may not initiali=
zed problem in hns3_init_mac_addr()
> > > > > > > > >     070581829c1a net: hns3: fix incorrect capability bit =
display for copper port
> > > > > > > > >     a3c65cf7854d net: hns3: add barrier in vf mailbox rep=
ly process
> > > > > > > > >     e671d8203758 net: hns3: add byte order conversion for=
 PF to VF mailbox message
> > > > > > > > >     bb0f14257c04 net: hns3: refine the definition for str=
uct hclge_pf_to_vf_msg
> > > > > > > > >     1d8f66d4060a net: hns3: fix add VLAN fail issue
> > > > > > > > >     4b3b2541d40e tty: Fix uninit-value access in ppp_sync=
_receive()
> > > > > > > > >     1f64cad3ac38 ipvlan: add ipvlan_route_v6_outbound() h=
elper
> > > > > > > > >     6c71b9b177c6 net: set SOCK_RCU_FREE before inserting =
socket into hashtable
> > > > > > > > >     427165421c25 net: inet: Retire port only listening_ha=
sh
> > > > > > > > >     be1ceb8b7c58 net: inet: Open code inet_hash2 and inet=
_unhash2
> > > > > > > > >     bb9bcf47fba7 net: inet: Remove count from inet_listen=
_hashbucket
> > > > > > > > >     de634368e079 mptcp: listen diag dump support
> > > > > > > > >     870f438aca56 mptcp: diag: switch to context structure
> > > > > > > > >     be020f658c63 gfs2: Silence "suspicious RCU usage in g=
fs2_permission" warning
> > > > > > > > >     194454afa6aa SUNRPC: Fix RPC client cleaned up the fr=
eed pipefs dentries
> > > > > > > > >     319ed0cba164 NFSv4.1: fix SP4_MACH_CRED protection fo=
r pnfs IO
> > > > > > > > >     809684f5b388 SUNRPC: Add an IS_ERR() check back to wh=
ere it was
> > > > > > > > >     46d6b768072b SUNRPC: ECONNRESET might require a rebin=
d
> > > > > > > > >     a7032d4d6499 media: cec: meson: always include meson =
sub-directory in Makefile
> > > > > > > > >     16e78f28517d media: cadence: csi2rx: Unregister v4l2 =
async notifier
> > > > > > > > >     20c2ca9abb78 sched/core: Optimize in_task() and in_in=
terrupt() a bit
> > > > > > > > >     9894c58c1777 tracing/perf: Add interrupt_context_leve=
l() helper
> > > > > > > > >     48fef664d7e9 tracing: Reuse logic from perf's get_rec=
ursion_context()
> > > > > > > > >     670b3e902f62 wifi: iwlwifi: Use FW rate for non-data =
frames
> > > > > > > > >     a7ee519e8095 pwm: Fix double shift bug
> > > > > > > > >     7054366cd076 drm/amdgpu: fix software pci_unplug on s=
ome chips
> > > > > > > > >     e48a5e78d077 drm/qxl: prevent memory leak
> > > > > > > > >     0835e7f296ca ASoC: ti: omap-mcbsp: Fix runtime PM und=
erflow warnings
> > > > > > > > >     38ada2f304f6 i2c: dev: copy userspace array safely
> > > > > > > > >     610244988f32 kgdb: Flush console before entering kgdb=
 on panic
> > > > > > > > >     4e497f1acd99 drm/amd/display: Avoid NULL dereference =
of timing generator
> > > > > > > > >     5e0b788fb96b media: imon: fix access to invalid resou=
rce for the second interface
> > > > > > > > >     ae6bcafe1f6b media: ccs: Fix driver quirk struct docu=
mentation
> > > > > > > > >     d01b0ad79ecd media: cobalt: Use FIELD_GET() to extrac=
t Link Width
> > > > > > > > >     03ce0655bf8e gfs2: fix an oops in gfs2_permission
> > > > > > > > >     5bfda356e903 gfs2: ignore negated quota changes
> > > > > > > > >     16631907d013 media: vivid: avoid integer overflow
> > > > > > > > >     09cd8b561aa9 media: gspca: cpia1: shift-out-of-bounds=
 in set_flicker
> > > > > > > > >     39c71357e68e i3c: master: mipi-i3c-hci: Fix a kernel =
panic for accessing DAT_data.
> > > > > > > > >     72775cad7f57 virtio-blk: fix implicit overflow on vir=
tio_max_dma_size
> > > > > > > > >     f7f3bdb225e3 i2c: sun6i-p2wi: Prevent potential divis=
ion by zero
> > > > > > > > >     d23ad76f240c i3c: mipi-i3c-hci: Fix out of bounds acc=
ess in hci_dma_irq_handler
> > > > > > > > >     e6fbad3cc880 9p: v9fs_listxattr: fix %s null argument=
 warning
> > > > > > > > >     a18be976be41 9p/trans_fd: Annotate data-racy writes t=
o file::f_flags
> > > > > > > > >     2cc5e191d671 usb: gadget: f_ncm: Always set current g=
adget in ncm_bind()
> > > > > > > > >     6c80f48912b5 tty: vcc: Add check for kstrdup() in vcc=
_probe()
> > > > > > > > >     2ff61106d6b4 exfat: support handle zero-size director=
y
> > > > > > > > >     c86a3007a685 HID: Add quirk for Dell Pro Wireless Key=
board and Mouse KM5221W
> > > > > > > > >     3453f945af89 PCI: Use FIELD_GET() in Sapphire RX 5600=
 XT Pulse quirk
> > > > > > > > >     0a93a0f99a09 misc: pci_endpoint_test: Add Device ID f=
or R-Car S4-8 PCIe controller
> > > > > > > > >     03dbd6a9ea4e PCI: Disable ATS for specific Intel IPU =
E2000 devices
> > > > > > > > >     a9a0b3444845 PCI: Extract ATS disabling to a helper f=
unction
> > > > > > > > >     fe511d24418a PCI: Use FIELD_GET() to extract Link Wid=
th
> > > > > > > > >     56d78b5495eb scsi: libfc: Fix potential NULL pointer =
dereference in fc_lport_ptp_setup()
> > > > > > > > >     37a51e7f36b7 atm: iphase: Do PCI error checks on own =
line
> > > > > > > > >     f05ae00106aa PCI: tegra194: Use FIELD_GET()/FIELD_PRE=
P() with Link Width fields
> > > > > > > > >     631a96e9eb42 ALSA: hda: Fix possible null-ptr-deref w=
hen assigning a stream
> > > > > > > > >     1c805b9cd2e3 ARM: 9320/1: fix stack depot IRQ stack f=
ilter
> > > > > > > > >     8d25ec69f8f1 HID: lenovo: Detect quirk-free fw on cpt=
kbd and stop applying workaround
> > > > > > > > >     64f062baf202 jfs: fix array-index-out-of-bounds in di=
Alloc
> > > > > > > > >     da3da5e1e6f7 jfs: fix array-index-out-of-bounds in db=
FindLeaf
> > > > > > > > >     1f74d336990f fs/jfs: Add validity check for db_maxag =
and db_agpref
> > > > > > > > >     5f148b16972e fs/jfs: Add check for negative db_l2nbpe=
rpage
> > > > > > > > >     e1d1f79b1929 scsi: ibmvfc: Remove BUG_ON in the case =
of an empty event pool
> > > > > > > > >     f0bfc8a5561f scsi: hisi_sas: Set debugfs_dir pointer =
to NULL after removing debugfs
> > > > > > > > >     5904dee70771 RDMA/hfi1: Use FIELD_GET() to extract Li=
nk Width
> > > > > > > > >     546c1796ad1e crypto: pcrypt - Fix hungtask for PADATA=
_RESET
> > > > > > > > >     bc443a199f8c ASoC: soc-card: Add storage for PCI SSID
> > > > > > > > >     9f2082067c5f selftests/efivarfs: create-read: fix a r=
esource leak
> > > > > > > > >     428cad17f53b arm64: dts: ls208xa: use a pseudo-bus to=
 constrain usb dma size
> > > > > > > > >     174f62a0aa15 drm/amdgpu: Fix a null pointer access wh=
en the smc_rreg pointer is NULL
> > > > > > > > >     3f7a400d5e80 drm/amdkfd: Fix shift out-of-bounds issu=
e
> > > > > > > > >     300589d551d4 drm/panel: st7703: Pick different reset =
sequence
> > > > > > > > >     eaa03ea366c8 drm/amdgpu/vkms: fix a possible null poi=
nter dereference
> > > > > > > > >     84c923d89890 drm/panel/panel-tpo-tpg110: fix a possib=
le null pointer dereference
> > > > > > > > >     2381f6b628b3 drm/panel: fix a possible null pointer d=
ereference
> > > > > > > > >     c11cf5e117f5 drm/amdgpu: Fix potential null pointer d=
erefernce
> > > > > > > > >     a237675aa1e6 drm/amd: Fix UBSAN array-index-out-of-bo=
unds for Polaris and Tonga
> > > > > > > > >     acdb6830de02 drm/amd: Fix UBSAN array-index-out-of-bo=
unds for SMU7
> > > > > > > > >     829ce8e995a8 drm/msm/dp: skip validity check for DP C=
TS EDID checksum
> > > > > > > > >     689b33b94f09 drm: vmwgfx_surface.c: copy user-array s=
afely
> > > > > > > > >     22260dabcfe3 kernel: watch_queue: copy user-array saf=
ely
> > > > > > > > >     d4f2c09d4672 kernel: kexec: copy user-array safely
> > > > > > > > >     24b17d530c42 string.h: add array-wrappers for (v)memd=
up_user()
> > > > > > > > >     3a3a6dc9a330 drm/amd/display: use full update for cli=
p size increase of large plane source
> > > > > > > > >     7d43cdd22cd8 drm/amdkfd: Fix a race condition of vram=
 buffer unref in svm code
> > > > > > > > >     eea81424c5b8 drm/komeda: drop all currently held lock=
s if deadlock happens
> > > > > > > > >     812886866be6 platform/x86: thinkpad_acpi: Add battery=
 quirk for Thinkpad X120e
> > > > > > > > >     ba7088769800 Bluetooth: Fix double free in hci_conn_c=
leanup
> > > > > > > > >     f9de14bde56d Bluetooth: btusb: Add date->evt_skb is N=
ULL check
> > > > > > > > >     a43cf6acf017 wifi: ath10k: Don't touch the CE interru=
pt registers after power up
> > > > > > > > >     6f42bd243327 net: annotate data-races around sk->sk_d=
st_pending_confirm
> > > > > > > > >     19ab5fd26441 net: annotate data-races around sk->sk_t=
x_queue_mapping
> > > > > > > > >     f3be63f7a8ee wifi: ath10k: fix clang-specific fortify=
 warning
> > > > > > > > >     02a0547b8da0 wifi: ath9k: fix clang-specific fortify =
warnings
> > > > > > > > >     cf353904a828 bpf: Detect IP =3D=3D ksym.end as part o=
f BPF program
> > > > > > > > >     c29a89b23f67 atl1c: Work around the DMA RX overflow i=
ssue
> > > > > > > > >     21a0f310a9f3 wifi: mac80211: don't return unset power=
 in ieee80211_get_tx_power()
> > > > > > > > >     3073e38086d0 wifi: mac80211_hwsim: fix clang-specific=
 fortify warning
> > > > > > > > >     e8e55fa44435 x86/mm: Drop the 4 MB restriction on min=
imal NUMA node memory size
> > > > > > > > >     f9d3ba62e87b workqueue: Provide one lock class key pe=
r work_on_cpu() callsite
> > > > > > > > >     0a5b512d526c clocksource/drivers/timer-atmel-tcb: Fix=
 initialization on SAM9 hardware
> > > > > > > > >     465b88c0873b clocksource/drivers/timer-imx-gpt: Fix p=
otential memory leak
> > > > > > > > >     fd0df3f87192 perf/core: Bail out early if the request=
 AUX area is out of bound
> > > > > > > > >     e89d0ed45a41 locking/ww_mutex/test: Fix potential wor=
kqueue corruption
> > > > > > > > >     2a910f4af54d Linux 5.15.139
> > > > > > > > >     3443337acd37 btrfs: use u64 for buffer sizes in the t=
ree search ioctls
> > > > > > > > >     f9f5e8cecba9 Revert "mmc: core: Capture correct oemid=
-bits for eMMC cards"
> > > > > > > > >     824829c2c6b4 tracing/kprobes: Fix the order of argume=
nt descriptions
> > > > > > > > >     560680f745fc fbdev: fsl-diu-fb: mark wr_reg_wa() stat=
ic
> > > > > > > > >     8e4b510fe917 fbdev: imsttfb: fix a resource leak in p=
robe
> > > > > > > > >     3648582181b6 fbdev: imsttfb: Fix error path of imsttf=
b_probe()
> > > > > > > > >     30959f9f4540 spi: spi-zynq-qspi: add spi-mem to drive=
r kconfig dependencies
> > > > > > > > >     9cf044cc36c1 ASoC: hdmi-codec: register hpd callback =
on component probe
> > > > > > > > >     705e5a28ec1d drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_=
WAIT_AVAILABLE
> > > > > > > > >     0ca05fae2790 netfilter: nat: fix ipv6 nat redirect wi=
th mapped and scoped addresses
> > > > > > > > >     1652f57f02eb netfilter: nft_redir: use `struct nf_nat=
_range2` throughout and deduplicate eval call-backs
> > > > > > > > >     d28c17abe098 netfilter: xt_recent: fix (increase) ipv=
6 literal buffer length
> > > > > > > > >     f30567fcbc4d i2c: iproc: handle invalid slave state
> > > > > > > > >     38f5ac54b917 r8169: respect userspace disabling IFF_M=
ULTICAST
> > > > > > > > >     fd01115b033c blk-core: use pr_warn_ratelimited() in b=
io_check_ro()
> > > > > > > > >     b80148710983 block: remove unneeded return value of b=
io_check_ro()
> > > > > > > > >     d8d94d6b3bd3 tg3: power down device only on SYSTEM_PO=
WER_OFF
> > > > > > > > >     5ea06a23f8f4 net/smc: put sk reference if close work =
was canceled
> > > > > > > > >     884606f8283c net/smc: allow cdc msg send rather than =
drop it with NULL sndbuf_desc
> > > > > > > > >     a62af7146daa net/smc: fix dangling sock under state S=
MC_APPFINCLOSEWAIT
> > > > > > > > >     866606826f16 selftests: pmtu.sh: fix result checking
> > > > > > > > >     2d117ac1b8f8 net: stmmac: xgmac: Enable support for m=
ultiple Flexible PPS outputs
> > > > > > > > >     95a99ac112c5 Fix termination state for idr_for_each_e=
ntry_ul()
> > > > > > > > >     70ef755f126b net: r8169: Disable multicast filter for=
 RTL8168H and RTL8107E
> > > > > > > > >     0dad0e75d62b dccp/tcp: Call security_inet_conn_reques=
t() after setting IPv6 addresses.
> > > > > > > > >     c340713bdf32 dccp: Call security_inet_conn_request() =
after setting IPv4 addresses.
> > > > > > > > >     d1b7e6562a4c octeontx2-pf: Fix holes in error code
> > > > > > > > >     f60297ef59d4 octeontx2-pf: Fix error codes
> > > > > > > > >     794d360b1d65 inet: shrink struct flowi_common
> > > > > > > > >     8943083bbb64 bpf: Check map->usercnt after timer->tim=
er is assigned
> > > > > > > > >     3907b89cd17f tipc: Change nla_policy for bearer-relat=
ed names to NLA_NUL_STRING
> > > > > > > > >     a1a485e45d24 hsr: Prevent use after free in prp_creat=
e_tagged_frame()
> > > > > > > > >     352887b3edd0 llc: verify mac len before reading mac h=
eader
> > > > > > > > >     303766bb92c5 Input: synaptics-rmi4 - fix use after fr=
ee in rmi_unregister_function()
> > > > > > > > >     741e4c15d7c0 pwm: brcmstb: Utilize appropriate clock =
APIs in suspend/resume
> > > > > > > > >     895ac9a21f69 pwm: sti: Reduce number of allocations a=
nd drop usage of chip_data
> > > > > > > > >     db64ddddeeec regmap: prevent noinc writes from clobbe=
ring cache
> > > > > > > > >     004d4002534e media: dvb-usb-v2: af9035: fix missing u=
nlock
> > > > > > > > >     a0beda184756 media: cedrus: Fix clock/reset sequence
> > > > > > > > >     980be4c3b0d5 media: vidtv: mux: Add check and kfree f=
or kstrdup
> > > > > > > > >     d17269fb9161 media: vidtv: psi: Add check for kstrdup
> > > > > > > > >     db89f551b706 media: s3c-camif: Avoid inappropriate kf=
ree()
> > > > > > > > >     51c94256a83f media: bttv: fix use after free error du=
e to btv->timeout timer
> > > > > > > > >     d3937f9e25d9 media: i2c: max9286: Fix some redundant =
of_node_put() calls
> > > > > > > > >     9d060f2fc40c pcmcia: ds: fix possible name leak in er=
ror path in pcmcia_device_add()
> > > > > > > > >     24e9df588e2e pcmcia: ds: fix refcount leak in pcmcia_=
device_add()
> > > > > > > > >     24e73ab542c7 pcmcia: cs: fix possible hung task and m=
emory leak pccardd()
> > > > > > > > >     b3eaa0d43c74 rtc: pcf85363: fix wrong mask/val parame=
ters in regmap_update_bits call
> > > > > > > > >     20bd0198bebd cxl/mem: Fix shutdown order
> > > > > > > > >     d48fe8d98171 i3c: Fix potential refcount leak in i3c_=
master_register_new_i3c_devs
> > > > > > > > >     855d6fb2cc7b 9p/net: fix possible memory leak in p9_c=
heck_errors()
> > > > > > > > >     0d456ebaad30 perf hist: Add missing puts to hist__acc=
ount_cycles
> > > > > > > > >     924e8d0b7645 perf machine: Avoid out of bounds LBR me=
mory read
> > > > > > > > >     76b0eab987c4 usb: host: xhci-plat: fix possible kerne=
l oops while resuming
> > > > > > > > >     c9c4dab06a5a xhci: Loosen RPM as default policy to co=
ver for AMD xHC 1.1
> > > > > > > > >     92c9ef156431 powerpc/pseries: fix potential memory le=
ak in init_cpu_associativity()
> > > > > > > > >     516235e7b35f powerpc/imc-pmu: Use the correct spinloc=
k initializer.
> > > > > > > > >     945dc61d7840 powerpc/xive: Fix endian conversion size
> > > > > > > > >     bce31a2bcb1e powerpc/40x: Remove stale PTE_ATOMIC_UPD=
ATES macro
> > > > > > > > >     1308e55eb09c modpost: fix tee MODULE_DEVICE_TABLE bui=
lt on big-endian host
> > > > > > > > >     863a9c3fdec2 powerpc: Only define __parse_fpscr() whe=
n required
> > > > > > > > >     01f62c6bd2db f2fs: fix to initialize map.m_pblk in f2=
fs_precache_extents()
> > > > > > > > >     dfebea7114e0 dmaengine: pxa_dma: Remove an erroneous =
BUG_ON() in pxad_free_desc()
> > > > > > > > >     72f8fa6c4b78 USB: usbip: fix stub_dev hub disconnect
> > > > > > > > >     168697f15a53 tools: iio: iio_generic_buffer ensure al=
ignment
> > > > > > > > >     a61c3c647ffd misc: st_core: Do not call kfree_skb() u=
nder spin_lock_irqsave()
> > > > > > > > >     732aa0cb2601 dmaengine: ti: edma: handle irq_of_parse=
_and_map() errors
> > > > > > > > >     2941a29fe9d6 usb: chipidea: Simplify Tegra DMA alignm=
ent code
> > > > > > > > >     58e8316b200b usb: chipidea: Fix DMA overwrite for Teg=
ra
> > > > > > > > >     fcaafb574fc8 usb: dwc2: fix possible NULL pointer der=
eference caused by driver concurrency
> > > > > > > > >     c956be5641cc dmaengine: idxd: Register dsa_bus_type b=
efore registering idxd sub-drivers
> > > > > > > > >     ca46d7ce1fbe livepatch: Fix missing newline character=
 in klp_resolve_symbols()
> > > > > > > > >     b77f7c025e85 tty: tty_jobctrl: fix pid memleak in dis=
associate_ctty()
> > > > > > > > >     e9f598a5cc9a f2fs: compress: fix to avoid redundant c=
ompress extension
> > > > > > > > >     8c4504cc0c64 f2fs: compress: fix to avoid use-after-f=
ree on dic
> > > > > > > > >     ca0aae3837a6 leds: trigger: ledtrig-cpu:: Fix 'output=
 may be truncated' issue for 'cpu'
> > > > > > > > >     206a972511a8 leds: pwm: Don't disable the PWM when th=
e LED should be off
> > > > > > > > >     893eedf596dd leds: turris-omnia: Do not use SMBUS cal=
ls
> > > > > > > > >     aec3706971b3 leds: turris-omnia: Drop unnecessary mut=
ex locking
> > > > > > > > >     c9a4f13c58f1 mfd: arizona-spi: Set pdata.hpdet_channe=
l for ACPI enumerated devs
> > > > > > > > >     63a99d7b57b4 mfd: dln2: Fix double put in dln2_probe
> > > > > > > > >     2742c860e0b7 mfd: core: Ensure disabled devices are s=
kipped without aborting
> > > > > > > > >     94eb5423d75e mfd: core: Un-constify mfd_cell.of_reg
> > > > > > > > >     8890d4d5f25e ASoC: ams-delta.c: use component after c=
heck
> > > > > > > > >     a2ae48bd82ee crypto: qat - fix deadlock in backlog pr=
ocessing
> > > > > > > > >     0dd34a7ad395 padata: Fix refcnt handling in padata_fr=
ee_shell()
> > > > > > > > >     93e4aa8545ab ASoC: Intel: Skylake: Fix mem leak when =
parsing UUIDs fails
> > > > > > > > >     cd1c2df64d6b HID: logitech-hidpp: Move get_wireless_f=
eature_index() check to hidpp_connect_event()
> > > > > > > > >     99893b7c4592 HID: logitech-hidpp: Revert "Don't resta=
rt communication if not necessary"
> > > > > > > > >     5f2f38602583 HID: logitech-hidpp: Don't restart IO, i=
nstead defer hid_connect() only
> > > > > > > > >     1f80041c5867 HID: logitech-hidpp: Remove HIDPP_QUIRK_=
NO_HIDINPUT quirk
> > > > > > > > >     d3b196a1da3e Revert "HID: logitech-hidpp: add a modul=
e parameter to keep firmware gestures"
> > > > > > > > >     6885e5ffa09d sh: bios: Revive earlyprintk support
> > > > > > > > >     b0c25e957f9b hid: cp2112: Fix IRQ shutdown stopping p=
olling for all IRQs on chip
> > > > > > > > >     d06dc0f99f72 RDMA/hfi1: Workaround truncation compila=
tion error
> > > > > > > > >     086cd44204bb scsi: ufs: core: Leave space for '\0' in=
 utf8 desc string
> > > > > > > > >     a0f1999090b3 ASoC: fsl: Fix PM disable depth imbalanc=
e in fsl_easrc_probe
> > > > > > > > >     904fc0103776 RDMA/hns: The UD mode can only be config=
ured with DCQCN
> > > > > > > > >     9f8db02d30ad RDMA/hns: Fix signed-unsigned mixed comp=
arisons
> > > > > > > > >     2de683e27e1d RDMA/hns: Fix uninitialized ucmd in hns_=
roce_create_qp_common()
> > > > > > > > >     611260e36f16 IB/mlx5: Fix rdma counter binding for RA=
W QP
> > > > > > > > >     922b2693b9af ASoC: fsl: mpc5200_dma.c: Fix warning of=
 Function parameter or member not described
> > > > > > > > >     001f90cd9d2f ext4: move 'ix' sanity check to corrent =
position
> > > > > > > > >     c24a3c9e373e ARM: 9321/1: memset: cast the constant b=
yte to unsigned char
> > > > > > > > >     012d0c66f939 hid: cp2112: Fix duplicate workqueue ini=
tialization
> > > > > > > > >     1ce09238e8e8 crypto: qat - increase size of buffers
> > > > > > > > >     62df66b726f9 crypto: caam/jr - fix Chacha20 + Poly130=
5 self test failure
> > > > > > > > >     61f25d4686bf crypto: caam/qi2 - fix Chacha20 + Poly13=
05 self test failure
> > > > > > > > >     66eb7b7f23dd nd_btt: Make BTT lanes preemptible
> > > > > > > > >     6563e0f79d63 libnvdimm/of_pmem: Use devm_kstrdup inst=
ead of kstrdup and check its return value
> > > > > > > > >     d4ad0c1a83ce scsi: ibmvfc: Fix erroneous use of rtas_=
busy_delay with hcall return code
> > > > > > > > >     b79c7d684c3f RDMA/core: Use size_{add,sub,mul}() in c=
alls to struct_size()
> > > > > > > > >     a5c83c8043d7 hwrng: geode - fix accessing registers
> > > > > > > > >     a8607725b20a crypto: hisilicon/hpre - Fix a erroneous=
 check after snprintf()
> > > > > > > > >     b01b9dc5487a selftests/resctrl: Ensure the benchmark =
commands fits to its array
> > > > > > > > >     2d2300fcf8f6 selftests/pidfd: Fix ksft print formats
> > > > > > > > >     8bc9c9447489 arm64: dts: imx8mn: Add sound-dai-cells =
to micfil node
> > > > > > > > >     1abd658492b5 arm64: dts: imx8mm: Add sound-dai-cells =
to micfil node
> > > > > > > > >     cf7abb54f8b1 arm64: dts: imx8qm-ss-img: Fix jpegenc c=
ompatible entry
> > > > > > > > >     8704bf18a888 clk: scmi: Free scmi_clk allocated when =
the clocks with invalid info are skipped
> > > > > > > > >     bdb0428aa294 firmware: arm_ffa: Assign the missing ID=
R allocation ID to the FFA device
> > > > > > > > >     b0ffdc164365 firmware: ti_sci: Mark driver as non rem=
ovable
> > > > > > > > >     995ee1e84e8d soc: qcom: llcc: Handle a second device =
without data corruption
> > > > > > > > >     19b8098f73c6 ARM: dts: qcom: mdm9615: populate vsdcc =
fixed regulator
> > > > > > > > >     a8ab88f84b89 arm64: dts: qcom: apq8016-sbc: Add missi=
ng ADV7533 regulators
> > > > > > > > >     ddc0df81eeac ARM64: dts: marvell: cn9310: Use appropr=
iate label for spi1 pins
> > > > > > > > >     12d9de01c09c arm64: dts: qcom: sdm845-mtp: fix WiFi c=
onfiguration
> > > > > > > > >     690b89255971 arm64: dts: qcom: sc7280: Add missing LM=
H interrupts
> > > > > > > > >     2a4cce4168f7 arm64: dts: qcom: msm8992-libra: drop du=
plicated reserved memory
> > > > > > > > >     eb9daf47806b arm64: dts: qcom: msm8916: Fix iommu loc=
al address range
> > > > > > > > >     541640dcbf48 ARM: dts: renesas: blanche: Fix typo in =
GP_11_2 pin name
> > > > > > > > >     0e1e88bba286 perf: hisi: Fix use-after-free when regi=
ster pmu fails
> > > > > > > > >     4067d39f3c57 drm: mediatek: mtk_dsi: Fix NO_EOT_PACKE=
T settings/handling
> > > > > > > > >     a6a6f70aedca drm/msm/dsi: use msm_gem_kernel_put to f=
ree TX buffer
> > > > > > > > >     aea6f32a4318 xen-pciback: Consider INTx disabled when=
 MSI/MSI-X is enabled
> > > > > > > > >     e588ca45bf55 drm/rockchip: Fix type promotion bug in =
rockchip_gem_iommu_map()
> > > > > > > > >     a00a293d57a5 arm64/arm: xen: enlighten: Fix KPTI chec=
ks
> > > > > > > > >     d0d01bb4a560 drm/bridge: lt9611uxc: fix the race in t=
he error path
> > > > > > > > >     29aba28ea195 drm/bridge: lt9611uxc: Register and atta=
ch our DSI device at probe
> > > > > > > > >     f53a04579328 drm/bridge: lt9611uxc: Switch to devm MI=
PI-DSI helpers
> > > > > > > > >     517a5137a57b drm/rockchip: cdn-dp: Fix some error han=
dling paths in cdn_dp_probe()
> > > > > > > > >     865ccd4ca674 drm/mediatek: Fix iommu fault during crt=
c enabling
> > > > > > > > >     8e3c8253b34f drm/mediatek: Fix iommu fault by swappin=
g FBs after updating plane state
> > > > > > > > >     e11e339faa11 drm/amdkfd: fix some race conditions in =
vram buffer alloc/free of svm code
> > > > > > > > >     30cb99e09648 drm/bridge: tc358768: Fix bit updates
> > > > > > > > >     1cd4ae681a6a drm/bridge: tc358768: Disable non-contin=
uous clock mode
> > > > > > > > >     c13591b859be drm/bridge: tc358768: Fix use of uniniti=
alized variable
> > > > > > > > >     d78bddd94b80 drm/bridge: lt8912b: Add missing drm_bri=
dge_attach call
> > > > > > > > >     5cc2bc519afd drm/bridge: lt8912b: Manually disable HP=
D only if it was enabled
> > > > > > > > >     42071feab712 drm/bridge: lt8912b: Fix crash on bridge=
 detach
> > > > > > > > >     d9217286d0ab drm/bridge: lt8912b: Fix bridge_detach
> > > > > > > > >     cc3057958c5c drm/bridge: lt8912b: Add hot plug detect=
ion
> > > > > > > > >     ef4a40953c80 drm/bridge: lt8912b: Register and attach=
 our DSI device at probe
> > > > > > > > >     3580b8a01305 drm/bridge: lt8912b: Switch to devm MIPI=
-DSI helpers
> > > > > > > > >     52541851a8d1 drm/mipi-dsi: Create devm device attachm=
ent
> > > > > > > > >     a20d6ecd261a drm/mipi-dsi: Create devm device registr=
ation
> > > > > > > > >     347f025a02b3 drm/radeon: possible buffer overflow
> > > > > > > > >     b163b371d741 drm/rockchip: vop: Fix call to crtc rese=
t helper
> > > > > > > > >     9a96bed1df7b drm/rockchip: vop: Fix reset of state in=
 duplicate state crtc funcs
> > > > > > > > >     1b0bc99cf316 hwmon: (coretemp) Fix potentially trunca=
ted sysfs attribute name
> > > > > > > > >     b3e7eb23a6e9 hwmon: (axi-fan-control) Fix possible NU=
LL pointer dereference
> > > > > > > > >     e0bf076b734a platform/x86: wmi: Fix opening of char d=
evice
> > > > > > > > >     c57e81d5e538 platform/x86: wmi: remove unnecessary in=
itializations
> > > > > > > > >     2ca4e461a298 platform/x86: wmi: Fix probe failure whe=
n failing to register WMI devices
> > > > > > > > >     f75e11f54d98 clk: qcom: config IPQ_APSS_6018 should d=
epend on QCOM_SMEM
> > > > > > > > >     d1175cf4bd2b clk: mediatek: clk-mt2701: Add check for=
 mtk_alloc_clk_data
> > > > > > > > >     e964d21dc034 clk: mediatek: clk-mt7629: Add check for=
 mtk_alloc_clk_data
> > > > > > > > >     c4070ada5d51 clk: mediatek: clk-mt7629-eth: Add check=
 for mtk_alloc_clk_data
> > > > > > > > >     3aefc6fcfbad clk: mediatek: clk-mt6797: Add check for=
 mtk_alloc_clk_data
> > > > > > > > >     ca6d565a2319 clk: mediatek: clk-mt6779: Add check for=
 mtk_alloc_clk_data
> > > > > > > > >     533ca5153ad6 clk: mediatek: clk-mt6765: Add check for=
 mtk_alloc_clk_data
> > > > > > > > >     e531e4e73734 clk: npcm7xx: Fix incorrect kfree
> > > > > > > > >     761c2a690d8f clk: ti: fix double free in of_ti_divide=
r_clk_setup()
> > > > > > > > >     1c37faca0908 clk: ti: change ti_clk_register[_omap_hw=
]() API
> > > > > > > > >     28b72fba1e19 clk: ti: Update component clocks to use =
ti_dt_clk_name()
> > > > > > > > >     c4bffed2e52b clk: ti: Update pll and clockdomain cloc=
ks to use ti_dt_clk_name()
> > > > > > > > >     9b5e9d8bf9a6 clk: ti: Add ti_dt_clk_name() helper to =
use clock-output-names
> > > > > > > > >     f45fff806ebb clk: keystone: pll: fix a couple NULL vs=
 IS_ERR() checks
> > > > > > > > >     7ff8ca9beefb spi: nxp-fspi: use the correct ioremap f=
unction
> > > > > > > > >     26206c858dae clk: renesas: rzg2l: Fix computation for=
mula
> > > > > > > > >     1966bf2a79e6 clk: renesas: rzg2l: Use FIELD_GET() for=
 PLL register fields
> > > > > > > > >     7ece2efa87af clk: renesas: rzg2l: Simplify multiplica=
tion/shift logic
> > > > > > > > >     e2239f716529 clk: imx: imx8qxp: Fix elcdif_pll clock
> > > > > > > > >     7d416973cd12 clk: imx: imx8mq: correct error handling=
 path
> > > > > > > > >     608ebb098b79 clk: imx: Select MXC_CLK for CLK_IMX8QXP
> > > > > > > > >     8861b2925a84 clk: qcom: gcc-sm8150: Fix gcc_sdcc2_app=
s_clk_src
> > > > > > > > >     76e8f00f54a8 clk: qcom: mmcc-msm8998: Fix the SMMU GD=
SC
> > > > > > > > >     56c4bb46a5a0 clk: qcom: mmcc-msm8998: Don't check hal=
t bit on some branch clks
> > > > > > > > >     0881d24cf5ca clk: qcom: clk-rcg2: Fix clock rate over=
flow for high parent frequencies
> > > > > > > > >     b64683f5d728 spi: tegra: Fix missing IRQ check in teg=
ra_slink_probe()
> > > > > > > > >     b13e8b38be51 regmap: debugfs: Fix a erroneous check a=
fter snprintf()
> > > > > > > > >     8fafac407346 ipvlan: properly track tx_errors
> > > > > > > > >     3eedc19a9d0f net: add DEV_STATS_READ() helper
> > > > > > > > >     359bce81b841 ipv6: avoid atomic fragment on GSO packe=
ts
> > > > > > > > >     6b413d52f6ab ACPI: sysfs: Fix create_pnp_modalias() a=
nd create_of_modalias()
> > > > > > > > >     32aaa3b98789 wifi: iwlwifi: empty overflow queue duri=
ng flush
> > > > > > > > >     0e3ad00be4e8 wifi: iwlwifi: pcie: synchronize IRQs be=
fore NAPI
> > > > > > > > >     a8ebe549e0ce wifi: iwlwifi: call napi_synchronize() b=
efore freeing rx/tx queues
> > > > > > > > >     627a3b3f5c80 iwlwifi: pcie: adjust to Bz completion d=
escriptor
> > > > > > > > >     0d91506a40ec tcp: fix cookie_init_timestamp() overflo=
ws
> > > > > > > > >     4f6e904ed4e3 chtls: fix tp->rcv_tstamp initialization
> > > > > > > > >     5d7bec7ae4db r8169: fix rare issue with broken rx aft=
er link-down on RTL8125
> > > > > > > > >     e143a3c82d33 r8169: use tp_to_dev instead of open cod=
e
> > > > > > > > >     3a8f4e58e1ee thermal: core: prevent potential string =
overflow
> > > > > > > > >     bfd4ed4988aa netfilter: nf_tables: Drop pointless mem=
set when dumping rules
> > > > > > > > >     80986257d2cd PM / devfreq: rockchip-dfi: Make pmu reg=
map mandatory
> > > > > > > > >     826120c9ba68 can: dev: can_put_echo_skb(): don't cras=
h kernel if can_priv::echo_skb is accessed out of bounds
> > > > > > > > >     28e9e015916e can: dev: can_restart(): fix race condit=
ion between controller restart and netif_carrier_on()
> > > > > > > > >     ada4dc4788f1 can: dev: can_restart(): don't crash ker=
nel if carrier is OK
> > > > > > > > >     d4eb4182a823 wifi: rtlwifi: fix EDCA limit set by BT =
coexistence
> > > > > > > > >     2027e74150ee tcp_metrics: do not create an entry from=
 tcp_init_metrics()
> > > > > > > > >     3f7cb7c47ce0 tcp_metrics: properly set tp->snd_ssthre=
sh in tcp_init_metrics()
> > > > > > > > >     ca7b6fa9e61a tcp_metrics: add missing barriers on del=
ete
> > > > > > > > >     227709a0e47c wifi: mt76: mt7603: improve stuck beacon=
 handling
> > > > > > > > >     eab5b0aa5065 mt76: pass original queue id from __mt76=
_tx_queue_skb to the driver
> > > > > > > > >     75336a762539 mt76: add support for overriding the dev=
ice used for DMA mapping
> > > > > > > > >     77b2ab5cd1a4 mt76: dma: use kzalloc instead of devm_k=
zalloc for txwi
> > > > > > > > >     064b32f18db1 wifi: mt76: mt7603: rework/fix rx pse ha=
ng check
> > > > > > > > >     1afbb9ececd3 wifi: rtw88: debug: Fix the NULL vs IS_E=
RR() bug for debugfs_create_file()
> > > > > > > > >     ebcbf5f5e047 net: spider_net: Use size_add() in call =
to struct_size()
> > > > > > > > >     56e7424c6efc tipc: Use size_add() in calls to struct_=
size()
> > > > > > > > >     3e51efcb2909 mlxsw: Use size_mul() in call to struct_=
size()
> > > > > > > > >     dc3fef310732 gve: Use size_add() in call to struct_si=
ze()
> > > > > > > > >     70f032db8516 tcp: call tcp_try_undo_recovery when an =
RTOd TFO SYNACK is ACKed
> > > > > > > > >     a2d540c74549 udp: add missing WRITE_ONCE() around up-=
>encap_rcv
> > > > > > > > >     8f7eef3a13df selftests/bpf: Correct map_fd to data_fd=
 in tailcalls
> > > > > > > > >     3eefb2fbf4ec selftests/bpf: Test tail call counting w=
ith bpf2bpf and data on stack
> > > > > > > > >     ab91992ec4d4 i40e: fix potential memory leaks in i40e=
_remove()
> > > > > > > > >     702742373650 genirq/matrix: Exclude managed interrupt=
s in irq_matrix_allocated()
> > > > > > > > >     379b120e4f27 pstore/platform: Add check for kstrdup
> > > > > > > > >     81b8638e4ef4 x86/boot: Fix incorrect startup_gdt_desc=
r.size
> > > > > > > > >     c7e8c7452e5a x86/sev-es: Allow copy_from_kernel_nofau=
lt() in earlier boot
> > > > > > > > >     0b5da8ce0f18 x86: Share definition of __is_canonical_=
address()
> > > > > > > > >     90b263db856d futex: Don't include process MM in futex=
 key on no-MMU
> > > > > > > > >     f0d6e5841172 x86/srso: Fix SBPB enablement for (possi=
ble) future fixed HW
> > > > > > > > >     565f9337b68e writeback, cgroup: switch inodes with di=
rty timestamps to release dying cgwbs
> > > > > > > > >     2bb46b20825d vfs: fix readahead(2) on block devices
> > > > > > > > >     20195f87db19 sched: Fix stop_one_cpu_nowait() vs hotp=
lug
> > > > > > > > >     13cde955e52e sched/uclamp: Ignore (util =3D=3D 0) opt=
imization in feec() when p_util_max =3D 0
> > > > > > > > >     cc6198ff20c0 iov_iter, x86: Be consistent about the _=
_user tag on copy_mc_to_user()
> > > > > > > > >     80529b4968a8 Linux 5.15.138
> > > > > > > > >     3d8344a7c4a3 ALSA: hda: intel-dsp-config: Fix JSL Chr=
omebook quirk detection
> > > > > > > > >     f049c0c0037d misc: pci_endpoint_test: Add deviceID fo=
r J721S2 PCIe EP device support
> > > > > > > > >     28b8ad8ccecd tty: 8250: Add Brainboxes Oxford Semicon=
ductor-based quirks
> > > > > > > > >     44c4dfac3f02 tty: 8250: Add support for Intashield IX=
 cards
> > > > > > > > >     d541ccb34de2 tty: 8250: Add support for additional Br=
ainboxes PX cards
> > > > > > > > >     60debc01fcbb tty: 8250: Fix up PX-803/PX-857
> > > > > > > > >     1f5649aed527 tty: 8250: Fix port count of PX-257
> > > > > > > > >     3fe3cc63c730 tty: 8250: Add support for Intashield IS=
-100
> > > > > > > > >     a5b6390fd609 tty: 8250: Add support for Brainboxes UP=
 cards
> > > > > > > > >     738fe41b6443 tty: 8250: Add support for additional Br=
ainboxes UC cards
> > > > > > > > >     ff6059c3d234 tty: 8250: Remove UC-257 and UC-431
> > > > > > > > >     81a4dd5e6c78 tty: n_gsm: fix race condition in status=
 line change on dead connections
> > > > > > > > >     e25197747f0e usb: raw-gadget: properly handle interru=
pted requests
> > > > > > > > >     e5f53a68a596 usb: typec: tcpm: Fix NULL pointer deref=
erence in tcpm_pd_svdm()
> > > > > > > > >     7c4855b22a3f usb: storage: set 1.50 as the lower bcdD=
evice for older "Super Top" compatibility
> > > > > > > > >     c48aae53850c PCI: Prevent xHCI driver from claiming A=
MD VanGogh USB3 DRD device
> > > > > > > > >     6628c3627c02 drm/amd: Disable ASPM for VI w/ all Inte=
l systems
> > > > > > > > >     b6c3c7786e24 drm/amd: Move helper for dynamic speed s=
witch check out of smu13
> > > > > > > > >     9015169f00ee can: isotp: isotp_sendmsg(): fix TX stat=
e detection and wait behavior
> > > > > > > > >     d72ff6478323 can: isotp: isotp_bind(): do not validat=
e unused address information
> > > > > > > > >     e163ad6a8639 can: isotp: add local echo tx processing=
 and tx without FC
> > > > > > > > >     b4e78ea26638 can: isotp: handle wait_event_interrupti=
ble() return values
> > > > > > > > >     2fc6f337257f can: isotp: check CAN address family in =
isotp_bind()
> > > > > > > > >     f8c3bd211cf3 can: isotp: isotp_bind(): return -EINVAL=
 on incorrect CAN ID formatting
> > > > > > > > >     615c4dd64050 can: isotp: set max PDU size to 64 kByte
> > > > > > > > >     6627b96851f1 powerpc/mm: Fix boot crash with FLATMEM
> > > > > > > > >     f0f998648887 r8152: Check for unplug in r8153b_ups_en=
() / r8153c_ups_en()
> > > > > > > > >     78c939a88729 r8152: Check for unplug in rtl_phy_patch=
_request()
> > > > > > > > >     51cc28ce742e net: chelsio: cxgb4: add an error code c=
heck in t4_load_phy_fw
> > > > > > > > >     bbc926199321 platform/mellanox: mlxbf-tmfifo: Fix a w=
arning message
> > > > > > > > >     db4416ea3a5d scsi: mpt3sas: Fix in error path
> > > > > > > > >     d48b2e8189d5 fbdev: uvesafb: Call cn_del_callback() a=
t the end of uvesafb_exit()
> > > > > > > > >     e39440c3268b drm/ttm: Reorder sys manager cleanup ste=
p
> > > > > > > > >     aade33d3d9bb ASoC: rt5650: fix the wrong result of ke=
y button
> > > > > > > > >     fa32e21c0568 netfilter: nfnetlink_log: silence bogus =
compiler warning
> > > > > > > > >     dfcbb983eb6e spi: npcm-fiu: Fix UMA reads when dummy.=
nbytes =3D=3D 0
> > > > > > > > >     64ae128b095d fs/ntfs3: Avoid possible memory leak
> > > > > > > > >     27a0bed1285e fs/ntfs3: Fix directory element type det=
ection
> > > > > > > > >     94524980ee75 fs/ntfs3: Fix NULL pointer dereference o=
n error in attr_allocate_frame()
> > > > > > > > >     2de328398b50 fs/ntfs3: Fix possible NULL-ptr-deref in=
 ni_readpage_cmpr()
> > > > > > > > >     962a3d3d731c fs/ntfs3: Use kvmalloc instead of kmallo=
c(... __GFP_NOWARN)
> > > > > > > > >     393966e79ba1 fs/ntfs3: Write immediately updated ntfs=
 state
> > > > > > > > >     59e629fc7157 fs/ntfs3: Add ckeck in ni_update_parent(=
)
> > > > > > > > >     738a3adc7c8b fbdev: atyfb: only use ioremap_uc() on i=
386 and ia64
> > > > > > > > >     afef8af919d2 Input: synaptics-rmi4 - handle reset del=
ay when using SMBus trsnsport
> > > > > > > > >     abc62fc06d4a powerpc/85xx: Fix math emulation excepti=
on
> > > > > > > > >     4bdde4dca00e dmaengine: ste_dma40: Fix PM disable dep=
th imbalance in d40_probe
> > > > > > > > >     39d2c10367a8 irqchip/stm32-exti: add missing DT IRQ f=
lag translation
> > > > > > > > >     c57aef9075e0 irqchip/riscv-intc: Mark all INTC nodes =
as initialized
> > > > > > > > >     eb99b6e204cd net: sched: cls_u32: Fix allocation size=
 in u32_init()
> > > > > > > > >     5e78ebe7c1db ASoC: simple-card: fixup asoc_simple_pro=
be() error handling
> > > > > > > > >     65fd21aa3805 x86: Fix .brk attribute in linker script
> > > > > > > > >     d4c8bf5635c4 rpmsg: Fix possible refcount leak in rpm=
sg_register_device_override()
> > > > > > > > >     a82e0fda8a2f rpmsg: glink: Release driver_override
> > > > > > > > >     bfd4a664ddfb rpmsg: Fix calling device_lock() on non-=
initialized device
> > > > > > > > >     2e76b4f6218c rpmsg: Fix kfree() of static memory on s=
etting driver_override
> > > > > > > > >     5c0da71871d3 rpmsg: Constify local variable in field =
store macro
> > > > > > > > >     389190b25472 driver: platform: Add helper for safer s=
etting of driver_override
> > > > > > > > >     37ffa428d58c objtool/x86: add missing embedded_insn c=
heck
> > > > > > > > >     f031e15d0bb8 ext4: avoid overlapping preallocations d=
ue to overflow
> > > > > > > > >     f2c3a3aa6f11 ext4: fix BUG in ext4_mb_new_inode_pa() =
due to overflow
> > > > > > > > >     7a992726f727 ext4: add two helper functions extent_lo=
gical_end() and pa_logical_end()
> > > > > > > > >     9e78e7709f7d x86/mm: Fix RESERVE_BRK() for older binu=
tils
> > > > > > > > >     d3201c718058 x86/mm: Simplify RESERVE_BRK()
> > > > > > > > >     897b56acf126 x86/i8259: Skip probing when ACPI/MADT a=
dvertises PCAT compatibility
> > > > > > > > >     77db87c4a4ed gve: Fix GFP flags when allocing pages
> > > > > > > > >     8b424bdf6c9c iio: afe: rescale: Accept only offset ch=
annels
> > > > > > > > >     c1eeb494f684 iio: afe: rescale: add offset support
> > > > > > > > >     7c76b7db5521 iio: afe: rescale: expose scale processi=
ng function
> > > > > > > > >     c60671502dc2 iio: afe: rescale: reorder includes
> > > > > > > > >     27dd09f5ec7f clk: Sanitize possible_parent_show to Ha=
ndle Return Value of of_clk_get_parent_name
> > > > > > > > >     c27ca4aebbee sparc32: fix a braino in fault handling =
in csum_and_copy_..._user()
> > > > > > > > >     21b07a2e6095 perf/core: Fix potential NULL deref
> > > > > > > > >     6efd498009b9 nvmem: imx: correct nregs for i.MX6UL
> > > > > > > > >     0c2948118c34 nvmem: imx: correct nregs for i.MX6SLL
> > > > > > > > >     6e22bf6f00d5 nvmem: imx: correct nregs for i.MX6ULL
> > > > > > > > >     e0f95b831b4a misc: fastrpc: Clean buffers on remote i=
nvocation failures
> > > > > > > > >     c4957f00f9e2 tracing/kprobes: Fix the description of =
variable length arguments
> > > > > > > > >     cdc57093b470 i2c: aspeed: Fix i2c bus hang in slave r=
ead
> > > > > > > > >     e97d374a2506 i2c: stm32f7: Fix PEC handling in case o=
f SMBUS transfers
> > > > > > > > >     2766a872103b i2c: muxes: i2c-demux-pinctrl: Use of_ge=
t_i2c_adapter_by_node()
> > > > > > > > >     48b58f7469e5 i2c: muxes: i2c-mux-gpmux: Use of_get_i2=
c_adapter_by_node()
> > > > > > > > >     cb65e692765b i2c: muxes: i2c-mux-pinctrl: Use of_get_=
i2c_adapter_by_node()
> > > > > > > > >     eace761f35a1 iio: adc: xilinx-xadc: Correct temperatu=
re offset/scale for UltraScale
> > > > > > > > >     70322a446ef2 iio: adc: xilinx-xadc: Don't clobber pre=
set voltage/temperature thresholds
> > > > > > > > >     3c1312b5d49a iio: exynos-adc: request second interupt=
 only when touchscreen mode is used
> > > > > > > > >     4e14f2d5885f kasan: print the original fault addr whe=
n access invalid shadow
> > > > > > > > >     bdfa4fa7588d i40e: Fix wrong check for I40E_TXR_FLAGS=
_WB_ON_ITR
> > > > > > > > >     d5c175f4cea6 gtp: fix fragmentation needed check with=
 gso
> > > > > > > > >     c0dad0c0924c gtp: uapi: fix GTPA_MAX
> > > > > > > > >     852fb4ce426d tcp: fix wrong RTO timeout when received=
 SACK reneging
> > > > > > > > >     83cfa3b51a78 r8152: Release firmware if we have an er=
ror in probe
> > > > > > > > >     e0f9231ccd6c r8152: Cancel hw_phy_work if we have an =
error in probe
> > > > > > > > >     ff42b0a55659 r8152: Run the unload routine if we have=
 errors during probe
> > > > > > > > >     6fa3b9f9478e r8152: Increase USB control msg timeout =
to 5000ms as per spec
> > > > > > > > >     76873f2eadc0 net: usb: smsc95xx: Fix uninit-value acc=
ess in smsc95xx_read_reg
> > > > > > > > >     6afd112c3f95 net: ieee802154: adf7242: Fix some poten=
tial buffer overflow in adf7242_stats_show()
> > > > > > > > >     46cd35e4e774 igc: Fix ambiguity in the ethtool advert=
ising
> > > > > > > > >     49529413eaed neighbour: fix various data-races
> > > > > > > > >     667554946360 igb: Fix potential memory leak in igb_ad=
d_ethtool_nfc_entry
> > > > > > > > >     263421905346 treewide: Spelling fix in comment
> > > > > > > > >     bc0c4bc119d2 i40e: Fix I40E_FLAG_VF_VLAN_PRUNING valu=
e
> > > > > > > > >     c532c5df01ad r8169: fix the KCSAN reported data race =
in rtl_rx while reading desc->opts1
> > > > > > > > >     6afb294c88c6 r8169: fix the KCSAN reported data-race =
in rtl_tx while reading TxDescArray[entry].opts1
> > > > > > > > >     9d7b3838428c r8169: fix the KCSAN reported data-race =
in rtl_tx() while reading tp->cur_tx
> > > > > > > > >     04dbfa4122e0 firmware/imx-dsp: Fix use_after_free in =
imx_dsp_setup_channels()
> > > > > > > > >     0d587b86cd0d drm/dp_mst: Fix NULL deref in get_mst_br=
anch_device_by_guid_helper()
> > > > > > > > >     8860f0175e51 vsock/virtio: initialize the_virtio_vsoc=
k before using VQs
> > > > > > > > >     762c251c7f5c vsock/virtio: add support for device sus=
pend/resume
> > > > > > > > >     1e02df6f6907 vsock/virtio: factor our the code to ini=
tialize and delete VQs
> > > > > > > > >     15a8cac3c250 drm/i915/pmu: Check if pmu is closed bef=
ore stopping event
> > > > > > > > >     43bd431a5dd9 nfsd: lock_rename() needs both directori=
es to live on the same fs
> > > > > > > > >     556b68d9b95f mm/migrate: fix do_pages_move for compat=
 pointers
> > > > > > > > >     c4071c6114de mm/page_alloc: correct start page when g=
uard page debug is enabled
> > > > > > > > >     3a6cee2bfb53 vhost: Allow null msg.size on VHOST_IOTL=
B_INVALIDATE
> > > > > > > > >     fbc9a8718f31 virtio-mmio: fix memory leak of vm_dev
> > > > > > > > >     862a356bc986 virtio_balloon: Fix endless deflation an=
d inflation on arm64
> > > > > > > > >     41bb770e42bc mcb-lpc: Reallocate memory region to avo=
id memory overlapping
> > > > > > > > >     f2ac8b2643dd mcb: Return actual parsed size when read=
ing chameleon table
> > > > > > > > >     90918ef995b5 mptcp: more conservative check for zero =
probes
> > > > > > > > >     fd2b2dab6f5b tcp: cleanup tcp_remove_empty_skb() use
> > > > > > > > >     68342755b9b2 tcp: remove dead code from tcp_sendmsg_l=
ocked()
> > > > > > > > >     0f482ad7b1a5 pinctrl: qcom: lpass-lpi: fix concurrent=
 register updates
> > > > > > > > >     51b054f6fe01 ASoC: codecs: wcd938x: fix runtime PM im=
balance on remove
> > > > > > > > >     cb34f4e79e54 ASoC: codecs: wcd938x: fix resource leak=
s on bind errors
> > > > > > > > >     12952a23a5da Linux 5.15.137
> > > > > > > > >     dff33880d40a xfrm6: fix inet6_dev refcount underflow =
problem
> > > > > > > > >     5a9d05a4f1c3 Bluetooth: hci_sock: Correctly bounds ch=
eck and pad HCI_MON_NEW_INDEX name
> > > > > > > > >     a6df96ee0b45 Bluetooth: hci_sock: fix slab oob read i=
n create_monitor_event
> > > > > > > > >     c08d609fb2b6 phy: mapphone-mdm6600: Fix pinctrl_pm ha=
ndling for sleep pins
> > > > > > > > >     e1b030b101f6 phy: mapphone-mdm6600: Fix runtime PM fo=
r remove
> > > > > > > > >     59f1095ab58e phy: mapphone-mdm6600: Fix runtime disab=
le on probe
> > > > > > > > >     b618062c0b13 serial: 8250: omap: Move uart_write() in=
side PM section
> > > > > > > > >     67f29cd2f851 ASoC: pxa: fix a memory leak in probe()
> > > > > > > > >     76d04c339508 gpio: vf610: set value before the direct=
ion to avoid a glitch
> > > > > > > > >     4b129e3964b3 platform/x86: asus-wmi: Map 0x2a code, I=
gnore 0x2b and 0x2c events
> > > > > > > > >     e1a058cc2467 platform/x86: asus-wmi: Change ASUS_WMI_=
BRN_DOWN code from 0x20 to 0x2e
> > > > > > > > >     c6bbe51dcdf3 platform/surface: platform_profile: Prop=
agate error if profile registration fails
> > > > > > > > >     a73c8d716938 s390/cio: fix a memleak in css_alloc_sub=
channel
> > > > > > > > >     c8b6c2df1e7d selftests/ftrace: Add new test case whic=
h checks non unique symbol
> > > > > > > > >     3ad81e6affcb s390/pci: fix iommu bitmap allocation
> > > > > > > > >     71d224acc4d1 perf: Disallow mis-matched inherited gro=
up reads
> > > > > > > > >     5aa89a11a2a6 USB: serial: option: add Fibocom to DELL=
 custom modem FM101R-GL
> > > > > > > > >     8c376d863618 USB: serial: option: add entry for Sierr=
a EM9191 with new firmware
> > > > > > > > >     483221216176 USB: serial: option: add Telit LE910C4-W=
WX 0x1035 composition
> > > > > > > > >     e750fb71dc6a nvme-rdma: do not try to stop unallocate=
d queues
> > > > > > > > >     a9fd6d44abbc nvme-pci: add BOGUS_NID for Intel 0a54 d=
evice
> > > > > > > > >     071382bda1da ACPI: irq: Fix incorrect return value in=
 acpi_register_gsi()
> > > > > > > > >     431a5010bce2 NFSv4.1: fixup use EXCHGID4_FLAG_USE_PNF=
S_DS for DS server
> > > > > > > > >     5762e72ef1b0 pNFS: Fix a hang in nfs4_evict_inode()
> > > > > > > > >     5a3abee2eee9 Revert "pinctrl: avoid unsafe code patte=
rn in find_pinctrl()"
> > > > > > > > >     24959825377f mmc: core: Capture correct oemid-bits fo=
r eMMC cards
> > > > > > > > >     8041e7b7e7e9 mmc: core: sdio: hold retuning if sdio i=
n 1-bit mode
> > > > > > > > >     262029c0c58c mmc: mtk-sd: Use readl_poll_timeout_atom=
ic in msdc_reset_hw
> > > > > > > > >     3e363db1c13a mtd: physmap-core: Restore map_rom fallb=
ack
> > > > > > > > >     71823463b1b2 mtd: spinand: micron: correct bitmask fo=
r ecc status
> > > > > > > > >     a50d2f17d562 mtd: rawnand: arasan: Ensure program pag=
e operations are successful
> > > > > > > > >     ae53c92e928c mtd: rawnand: marvell: Ensure program pa=
ge operations are successful
> > > > > > > > >     c0ca2ab23098 mtd: rawnand: pl353: Ensure program page=
 operations are successful
> > > > > > > > >     a7070628043e mtd: rawnand: qcom: Unmap the right reso=
urce upon probe failure
> > > > > > > > >     3f928d1362f7 net: fix ifname in netlink ntf during ne=
tns move
> > > > > > > > >     ac43ec299a6f net: move from strlcpy with unused retva=
l to strscpy
> > > > > > > > >     30e2db403032 net: introduce a function to check if a =
netdev name is in use
> > > > > > > > >     38ba5479355b Bluetooth: hci_event: Fix using memcmp w=
hen comparing keys
> > > > > > > > >     3b2da6d62b42 net/mlx5: Handle fw tracer change owners=
hip event based on MTRC
> > > > > > > > >     f6e263824539 platform/x86: touchscreen_dmi: Add info =
for the Positivo C4128B
> > > > > > > > >     ca56d8afe648 HID: multitouch: Add required quirk for =
Synaptics 0xcd7e device
> > > > > > > > >     ca5bec7ecf26 btrfs: error out when reallocating block=
 for defrag using a stale transaction
> > > > > > > > >     2692fd37aaf4 btrfs: error when COWing block from a ro=
ot that is being deleted
> > > > > > > > >     ef491d9560d9 btrfs: error out when COWing block using=
 a stale transaction
> > > > > > > > >     f89ed0a09673 btrfs: fix some -Wmaybe-uninitialized wa=
rnings in ioctl.c
> > > > > > > > >     df486b75feca drm: panel-orientation-quirks: Add quirk=
 for One Mix 2S
> > > > > > > > >     d5ba30ee4f6d ipv4/fib: send notify when delete source=
 address routes
> > > > > > > > >     9d07b7abd277 sky2: Make sure there is at least one fr=
ag_addr available
> > > > > > > > >     f652eb4adf27 regulator/core: Revert "fix kobject rele=
ase warning and memory leak in regulator_register()"
> > > > > > > > >     aa77b187b1f0 wifi: cfg80211: avoid leaking stack data=
 into trace
> > > > > > > > >     30a2285a2e18 wifi: mac80211: allow transmitting EAPOL=
 frames with tainted key
> > > > > > > > >     b64eb31a1b53 wifi: cfg80211: Fix 6GHz scan configurat=
ion
> > > > > > > > >     bbec1724519e Bluetooth: hci_core: Fix build warnings
> > > > > > > > >     02b0e6991838 Bluetooth: Avoid redundant authenticatio=
n
> > > > > > > > >     38681af225b6 Bluetooth: btusb: add shutdown function =
for QCA6174
> > > > > > > > >     e6e9a32c3e60 HID: holtek: fix slab-out-of-bounds Writ=
e in holtek_kbd_input_event
> > > > > > > > >     06aabf7715da wifi: iwlwifi: Ensure ack flag is proper=
ly cleared.
> > > > > > > > >     6063f6f64fa4 wifi: mwifiex: Sanity check tlv_len and =
tlv_bitmap_len
> > > > > > > > >     59ebfeb7b319 tracing: relax trace_event_eval_update()=
 execution with cond_resched()
> > > > > > > > >     3d85fb391fa7 ata: libata-eh: Fix compilation warning =
in ata_eh_link_report()
> > > > > > > > >     89e3cc1b0703 ata: libata-core: Fix compilation warnin=
g in ata_dev_config_ncq()
> > > > > > > > >     137c658ea3ce gpio: timberdale: Fix potential deadlock=
 on &tgpio->lock
> > > > > > > > >     68f106c2b2ab overlayfs: set ctime when setting mtime =
and atime
> > > > > > > > >     ef3c62e2f0f1 i2c: mux: Avoid potential false error me=
ssage in i2c_mux_add_adapter
> > > > > > > > >     e2f64f3eebaa btrfs: initialize start_slot in btrfs_lo=
g_prealloc_extents
> > > > > > > > >     266dab0ce42d btrfs: return -EUCLEAN for delayed tree =
ref with a ref count not equals to 1
> > > > > > > > >     bc424f18fbdc fs-writeback: do not requeue a clean ino=
de having skipped pages
> > > > > > > > >     92609823592c ARM: dts: ti: omap: Fix noisy serial wit=
h overrun-throttle-ms for mapphone
> > > > > > > > >     3898d8d685ab ksmbd: not allow to open file if delelet=
e on close bit is set
> > > > > > > > >     d3dc26c4fdc2 nfp: flower: avoid rmmod nfp crash issue=
s
> > > > > > > > >     6c52b1215904 mctp: perform route lookups under a RCU =
read-side lock
> > > > > > > > >     db3f17e571e8 mctp: Allow local delivery to the null E=
ID
> > > > > > > > >     29017ab1a539 powerpc/47x: Fix 47x syscall return cras=
h
> > > > > > > > >     558ee0fafd40 powerpc/32s: Do kuep_lock() and kuep_unl=
ock() in assembly
> > > > > > > > >     d00f4ae3accf powerpc/32s: Remove capability to disabl=
e KUEP at boottime
> > > > > > > > >     fcb3f09e8173 drm/atomic-helper: relax unregistered co=
nnector check
> > > > > > > > >     403d201d1fd1 perf/x86/lbr: Filter vsyscall addresses
> > > > > > > > >     419ac18d8808 perf/x86: Move branch classifier
> > > > > > > > >     030099bc9115 perf: Add irq and exception return branc=
h types
> > > > > > > > >     ae80d5290c14 iio: adc: ad7192: Correct reference volt=
age
> > > > > > > > >     569a126f244b iio: cros_ec: fix an use-after-free in c=
ros_ec_sensors_push_data()
> > > > > > > > >     a9c471892d75 iio: core: introduce iio_device_{claim|r=
elease}_buffer_mode() APIs
> > > > > > > > >     eafbb1966152 iio: core: Hide read accesses to iio_dev=
->currentmode
> > > > > > > > >     919721348c04 iio: Un-inline iio_buffer_enabled()
> > > > > > > > >     7f74bc91eb00 serial: 8250_omap: Fix errors with no_co=
nsole_suspend
> > > > > > > > >     d67d831e1dbc serial: 8250: omap: Fix imprecise extern=
al abort for omap_8250_pm()
> > > > > > > > >     aff3019b553e selftests/mm: fix awk usage in charge_re=
served_hugetlb.sh and hugetlb_reparenting_test.sh that may cause error
> > > > > > > > >     4f1d3d1ca500 net: pktgen: Fix interface flags printin=
g
> > > > > > > > >     8bdf95e29f86 netfilter: nf_tables: revert do not remo=
ve elements if set backend implements .abort
> > > > > > > > >     cc19daa037f5 netfilter: nf_tables: do not remove elem=
ents if set backend implements .abort
> > > > > > > > >     db33720697c8 netfilter: nft_set_rbtree: .deactivate f=
ails if element has expired
> > > > > > > > >     44768cad012c neighbor: tracing: Move pin6 inside CONF=
IG_IPV6=3Dy section
> > > > > > > > >     b33179dbf3f2 net/sched: sch_hfsc: upgrade 'rt' to 'sc=
' when it becomes a inner curve
> > > > > > > > >     0426d7bc17b8 bonding: Return pointer to data after pu=
ll on skb
> > > > > > > > >     66982023d741 net: dsa: bcm_sf2: Fix possible memory l=
eak in bcm_sf2_mdio_register()
> > > > > > > > >     0ea476863ef7 i40e: prevent crash on probe if hw regis=
ters have invalid values
> > > > > > > > >     f9202217a6ea net: usb: smsc95xx: Fix an error code in=
 smsc95xx_reset()
> > > > > > > > >     a2ceb30cc1fc ipv4: fib: annotate races around nh->nh_=
saddr_genid and nh->nh_saddr
> > > > > > > > >     a270aa7a47db tun: prevent negative ifindex
> > > > > > > > >     9d55719f983d tcp: tsq: relax tcp_small_queue_check() =
when rtx queue contains a single skb
> > > > > > > > >     8ae344291e38 tcp: fix excessive TLP and RACK timeouts=
 from HZ rounding
> > > > > > > > >     8b6b4ca42a94 net: rfkill: gpio: prevent value glitch =
during probe
> > > > > > > > >     4df9ba0d7a82 net: ipv6: fix return value check in esp=
_remove_trailer
> > > > > > > > >     a9651e66d0bd net: ipv4: fix return value check in esp=
_remove_trailer
> > > > > > > > >     26a3c734cb8a xfrm: interface: use DEV_STATS_INC()
> > > > > > > > >     f8bc4b708b11 xfrm: fix a data-race in xfrm_gen_index(=
)
> > > > > > > > >     b660e58ef72d qed: fix LL2 RX buffer allocation
> > > > > > > > >     d35f398b88a1 ASoC: codecs: wcd938x: fix unbind tear d=
own order
> > > > > > > > >     d182d8ed7b7e ASoC: codecs: wcd938x: drop bogus bind e=
rror handling
> > > > > > > > >     8d32a6b67e77 ASoC: codecs: wcd938x-sdw: fix runtime P=
M imbalance on probe errors
> > > > > > > > >     6df571a6c153 ASoC: codecs: wcd938x-sdw: fix use after=
 free on driver unbind
> > > > > > > > >     36eabe87031f drm/i915: Retry gtt fault when out of fe=
nce registers
> > > > > > > > >     34f62612be2a nvmet-tcp: Fix a possible UAF in queue i=
ntialization setup
> > > > > > > > >     04e0eef74b8f netfilter: nft_payload: fix wrong mac he=
ader matching
> > > > > > > > >     efe43d1bcbcb fs/ntfs3: fix deadlock in mark_as_free_e=
x
> > > > > > > > >     ab40c7ab7a93 fs/ntfs3: fix panic about slab-out-of-bo=
unds caused by ntfs_list_ea()
> > > > > > > > >     24badb9dd8b8 fs/ntfs3: Fix possible null-pointer dere=
ference in hdr_find_e()
> > > > > > > > >     ff38d2a705e1 tcp: check mptcp-level constraints for b=
acklog coalescing
> > > > > > > > >     582f7993353c x86/sev: Check for user-space IOIO point=
ing to kernel space
> > > > > > > > >     5c2c01be809d x86/sev: Check IOBM for IOIO exceptions =
from user-space
> > > > > > > > >     6797c6d09e50 x86/sev: Disable MMIO emulation from use=
r mode
> > > > > > > > >     0b4e772a6a89 KVM: x86: Mask LVTPC when handling a PMI
> > > > > > > > >     f61c43be1eb9 regmap: fix NULL deref on lookup
> > > > > > > > >     ffdc881f6807 nfc: nci: fix possible NULL pointer dere=
ference in send_acknowledge()
> > > > > > > > >     d42aeae14fc4 ice: reset first in crash dump kernels
> > > > > > > > >     e42cecb513af ice: fix over-shifted variable
> > > > > > > > >     f6c093b97761 Bluetooth: avoid memcmp() out of bounds =
warning
> > > > > > > > >     e5f8b43c9c90 Bluetooth: hci_event: Fix coding style
> > > > > > > > >     1597c1ed0e7d Bluetooth: vhci: Fix race when opening v=
hci device
> > > > > > > > >     1ef071526848 Bluetooth: Fix a refcnt underflow proble=
m for hci_conn
> > > > > > > > >     dd6b62fdd245 Bluetooth: Reject connection with the de=
vice which has same BD_ADDR
> > > > > > > > >     848a05c4423f Bluetooth: hci_event: Ignore NULL link k=
ey
> > > > > > > > >     e7a2aa7770d3 xfs: don't expose internal symlink metad=
ata buffers to the vfs
> > > > > > > > >     fe5c6fbc5e4a Documentation: sysctl: align cells in se=
cond content column
> > > > > > > > >     1815844652cc lib/Kconfig.debug: do not enable DEBUG_P=
REEMPT by default
> > > > > > > > >     00c03985402e Linux 5.15.136
> > > > > > > > >     5266b5b6e975 eth: remove remaining copies of the NAPI=
_POLL_WEIGHT define
> > > > > > > > >     528f0ba9f7a4 usb: hub: Guard against accesses to unin=
itialized BOS descriptors
> > > > > > > > >     542a3f1a3cc1 Revert "kernel/sched: Modify initial boo=
t task idle setup"
> > > > > > > > >     737ce5518a9c arm64: armv8_deprecated: fix unused-func=
tion error
> > > > > > > > >     2e10931e2d77 arm64: armv8_deprecated: rework deprecte=
d instruction handling
> > > > > > > > >     abd4aa081905 arm64: armv8_deprecated: move aarch32 he=
lper earlier
> > > > > > > > >     f10abdb04c3d arm64: armv8_deprecated move emulation f=
unctions
> > > > > > > > >     0b4eec015fa5 arm64: armv8_deprecated: fold ops into i=
nsn_emulation
> > > > > > > > >     a8d2910be6f8 arm64: rework EL0 MRS emulation
> > > > > > > > >     057f9123b1a8 arm64: factor insn read out of call_unde=
f_hook()
> > > > > > > > >     3f82927cabaf arm64: factor out EL1 SSBS emulation hoo=
k
> > > > > > > > >     474385adcd84 arm64: split EL0/EL1 UNDEF handlers
> > > > > > > > >     de0358635401 arm64: allow kprobes on EL0 handlers
> > > > > > > > >     7154e2db8890 arm64: rework BTI exception handling
> > > > > > > > >     cd5ceadc2b37 arm64: rework FPAC exception handling
> > > > > > > > >     b6358002fd0c arm64: consistently pass ESR_ELx to die(=
)
> > > > > > > > >     7ddb1ef2bb42 arm64: die(): pass 'err' as long
> > > > > > > > >     9a3e177ef570 arm64: report EL1 UNDEFs better
> > > > > > > > >     d6808be3ff94 powerpc/64e: Fix wrong test in __ptep_te=
st_and_clear_young()
> > > > > > > > >     9c0dc3e2c996 powerpc/8xx: Fix pte_access_permitted() =
for PAGE_NONE
> > > > > > > > >     4da05eba66e6 dmaengine: mediatek: Fix deadlock caused=
 by synchronize_irq()
> > > > > > > > >     82f61b2d5187 dmaengine: idxd: use spin_lock_irqsave b=
efore wait_event_lock_irq
> > > > > > > > >     ecba5afe86f3 x86/alternatives: Disable KASAN in apply=
_alternatives()
> > > > > > > > >     cbd2aac00498 usb: cdnsp: Fixes issue with dequeuing n=
ot queued requests
> > > > > > > > >     7014807fb7ef usb: gadget: ncm: Handle decoding of mul=
tiple NTB's in unwrap call
> > > > > > > > >     50259cf71a1b usb: gadget: udc-xilinx: replace memcpy =
with memcpy_toio
> > > > > > > > >     308f19249641 counter: microchip-tcb-capture: Fix the =
use of internal GCLK logic
> > > > > > > > >     5a6ce81d7c16 pinctrl: avoid unsafe code pattern in fi=
nd_pinctrl()
> > > > > > > > >     1c790191cab4 cgroup: Remove duplicates in cgroup v1 t=
asks file
> > > > > > > > >     1680c82929bc tee: amdtee: fix use-after-free vulnerab=
ility in amdtee_close_session
> > > > > > > > >     b8ec40a90acd Input: goodix - ensure int GPIO is in in=
put for gpio_count =3D=3D 1 && gpio_int_idx =3D=3D 0 case
> > > > > > > > >     d092630e8a20 Input: i8042 - add Fujitsu Lifebook E541=
1 to i8042 quirk table
> > > > > > > > >     7cea6fa2d73f Input: xpad - add PXN V900 support
> > > > > > > > >     6ff4e50e2d2a Input: psmouse - fix fast_reconnect func=
tion for PS/2 mode
> > > > > > > > >     6a4a39638640 Input: powermate - fix use-after-free in=
 powermate_config_complete
> > > > > > > > >     6ad7f52d8c58 ceph: fix type promotion bug on 32bit sy=
stems
> > > > > > > > >     c0c4acd53a98 ceph: fix incorrect revoked caps assert =
in ceph_fill_file_size()
> > > > > > > > >     58f0e6324ec7 libceph: use kernel_connect()
> > > > > > > > >     d727b97f8f2e thunderbolt: Check that lane 1 is in CL0=
 before enabling lane bonding
> > > > > > > > >     04c38bedd07c thunderbolt: Workaround an IOMMU fault o=
n certain systems with Intel Maple Ridge
> > > > > > > > >     a586742a3780 mcb: remove is_added flag from mcb_devic=
e struct
> > > > > > > > >     4382d1a996e5 x86/cpu: Fix AMD erratum #1485 on Zen4-b=
ased CPUs
> > > > > > > > >     763167003a80 ACPI: resource: Skip IRQ override on ASU=
S ExpertBook B1402CBA
> > > > > > > > >     510d4a01d84c drm/amd/display: Don't set dpms_off for =
seamless boot
> > > > > > > > >     9cb61ab9f4ca drm/amdgpu: add missing NULL check
> > > > > > > > >     f9a1af37b801 iio: pressure: ms5611: ms5611_prom_is_va=
lid false negative bug
> > > > > > > > >     09b8ed9547f1 iio: pressure: dps310: Adjust Timeout Se=
ttings
> > > > > > > > >     4c80ecef859d iio: pressure: bmp280: Fix NULL pointer =
exception
> > > > > > > > >     a625de7e5464 usb: musb: Modify the "HWVers" register =
address
> > > > > > > > >     eb28694f6da8 usb: musb: Get the musb_qh poniter after=
 musb_giveback
> > > > > > > > >     ee88141873a8 usb: cdns3: Modify the return value of c=
dns_set_active () to void when CONFIG_PM_SLEEP is disabled
> > > > > > > > >     3b2dbc4f3302 usb: dwc3: Soft reset phy on probe for h=
ost
> > > > > > > > >     42c56e015653 net: usb: dm9601: fix uninitialized vari=
able use in dm9601_mdio_read
> > > > > > > > >     524f45361789 usb: xhci: xhci-ring: Use sysdev for map=
ping bounce buffer
> > > > > > > > >     1d8e7fe85528 xhci: Keep interrupt disabled in initial=
ization until host is running.
> > > > > > > > >     cb34e3b25c37 dmaengine: stm32-mdma: abort resume if n=
o ongoing transfer
> > > > > > > > >     d56dbfe750a8 media: mtk-jpeg: Fix use after free bug =
due to uncanceled work
> > > > > > > > >     5e13e69ddf0d net: release reference to inet6_dev poin=
ter
> > > > > > > > >     aade10d51ddc net: change accept_ra_min_rtr_lft to aff=
ect all RA lifetimes
> > > > > > > > >     8f12d2d66cba net: add sysctl accept_ra_min_rtr_lft
> > > > > > > > >     bc9f6cbeb999 workqueue: Override implicit ordered att=
ribute in workqueue_apply_unbound_cpumask()
> > > > > > > > >     25dd54b95abf nfc: nci: assert requested protocol is v=
alid
> > > > > > > > >     b2bb3b43b94a pinctrl: renesas: rzn1: Enable missing P=
INMUX
> > > > > > > > >     c4140dd77c3b net/smc: Fix pos miscalculation in stati=
stics
> > > > > > > > >     d888d3f70b0d net: nfc: fix races in nfc_llcp_sock_get=
() and nfc_llcp_sock_get_sn()
> > > > > > > > >     249a1fdb95d5 net/mlx5e: Again mutually exclude RX-FCS=
 and RX-port-timestamp
> > > > > > > > >     2112cacb38aa ixgbe: fix crash with empty VF macvlan l=
ist
> > > > > > > > >     935a15334d77 net: phy: mscc: macsec: reject PN update=
 requests
> > > > > > > > >     667fe9101a3a net: macsec: indicate next pn update whe=
n offloading
> > > > > > > > >     2dcb31e65d26 bpf: Fix verifier log for async callback=
 return values
> > > > > > > > >     6a217af2c67f drm/vmwgfx: fix typo of sizeof argument
> > > > > > > > >     72ef70886556 riscv, bpf: Sign-extend return values
> > > > > > > > >     7795592e0818 riscv, bpf: Factor out emit_call for ker=
nel and bpf context
> > > > > > > > >     58941cc742ca xen-netback: use default TX queue size f=
or vifs
> > > > > > > > >     cffdced18af8 eth: remove copies of the NAPI_POLL_WEIG=
HT define
> > > > > > > > >     5c360eec5332 mlxsw: fix mlxsw_sp2_nve_vxlan_learning_=
set() return type
> > > > > > > > >     84c6aa0ae5c4 ieee802154: ca8210: Fix a potential UAF =
in ca8210_probe
> > > > > > > > >     616761cf9df9 ravb: Fix use-after-free issue in ravb_t=
x_timeout_work()
> > > > > > > > >     30ebd4177593 ravb: Fix up dma_free_coherent() call in=
 ravb_remove()
> > > > > > > > >     3f39de2bd1d2 drm/msm/dpu: change _dpu_plane_calc_bw()=
 to use u64 to avoid overflow
> > > > > > > > >     85ae07d4dcc6 drm/msm/dsi: fix irq_of_parse_and_map() =
error checking
> > > > > > > > >     9a890c7d4d0f drm/msm/dsi: skip the wait for video mod=
e done if not applicable
> > > > > > > > >     b9de60b6830c drm/msm/dp: do not reinitialize phy unle=
ss retry during link training
> > > > > > > > >     afe5f596b588 KEYS: trusted: Remove redundant static c=
alls usage
> > > > > > > > >     20e73ece06b3 KEYS: trusted: allow use of kernel RNG f=
or key material
> > > > > > > > >     a01d68b6c666 ALSA: usb-audio: Fix microphone sound on=
 Opencomm2 Headset
> > > > > > > > >     5b5e58299eac net: prevent address rewrite in kernel_b=
ind()
> > > > > > > > >     56e96b38d2f7 quota: Fix slow quotaoff
> > > > > > > > >     28ddc1e0b898 HID: logitech-hidpp: Fix kernel crash on=
 receiver USB disconnect
> > > > > > > > >     b930f0f7bbc2 lib/test_meminit: fix off-by-one error i=
n test_pages()
> > > > > > > > >     982bd86fd659 platform/x86: hp-wmi:: Mark driver struc=
t with __refdata to prevent section mismatch warning
> > > > > > > > >     124cf0ea4b82 platform/x86: think-lmi: Fix reference l=
eak
> > > > > > > > >     3d2a16f878f0 of: overlay: Reorder struct fragment fie=
lds kerneldoc
> > > > > > > > >     10f4a0b6657e perf/arm-cmn: Fix the unhandled overflow=
 status of counter 4 to 7
> > > > > > > > >     b7966e2191d0 RDMA/cxgb4: Check skb value for failure =
to allocate
> > > > > > > > >     b9bdffb3f9aa RDMA/srp: Do not call scsi_done() from s=
rp_abort()
> > > > > > > > >     7d4999589ebc scsi: ib_srp: Call scsi_done() directly
> > > > > > > > >     d2746cdfd5e5 scsi: core: Rename scsi_mq_done() into s=
csi_done() and export it
> > > > > > > > >     8f2350e204da scsi: core: Use a structure member to tr=
ack the SCSI command submitter
> > > > > > > > >     29298c85a81a iommu/vt-d: Avoid memory allocation in i=
ommu_suspend()
> > > > > > > > >     02e21884dcf2 Linux 5.15.135
> > > > > > > > >     c8af81a9d36e xen/events: replace evtchn_rwlock with R=
CU
> > > > > > > > >     c346494ec7f1 parisc: Restore __ldcw_align for PA-RISC=
 2.0 processors
> > > > > > > > >     694e13732e83 ksmbd: fix uaf in smb20_oplock_break_ack
> > > > > > > > >     e914c3a47e45 RDMA/mlx5: Fix NULL string error
> > > > > > > > >     81b7bf367eea RDMA/siw: Fix connection failure handlin=
g
> > > > > > > > >     5d8bd138204f RDMA/uverbs: Fix typo of sizeof argument
> > > > > > > > >     60c9ed88526d RDMA/cma: Fix truncation compilation war=
ning in make_cma_ports
> > > > > > > > >     7f6136ced1b8 RDMA/cma: Initialize ib_sa_multicast str=
ucture to 0 when join
> > > > > > > > >     1dd6095fc727 gpio: pxa: disable pinctrl calls for MMP=
_GPIO
> > > > > > > > >     844fcf4c697c gpio: aspeed: fix the GPIO number passed=
 to pinctrl_gpio_set_config()
> > > > > > > > >     1878d6666c32 IB/mlx4: Fix the size of a buffer in add=
_port_entries()
> > > > > > > > >     718d9b44afca of: dynamic: Fix potential memory leak i=
n of_changeset_action()
> > > > > > > > >     e0878f38b661 RDMA/core: Require admin capabilities to=
 set system parameters
> > > > > > > > >     18a839064fc6 dm zoned: free dmz->ddev array in dmz_pu=
t_zoned_devices
> > > > > > > > >     8781fe259dd5 HID: intel-ish-hid: ipc: Disable and ree=
nable ACPI GPE bit
> > > > > > > > >     949ccc91c35b HID: sony: remove duplicate NULL check b=
efore calling usb_free_urb()
> > > > > > > > >     a02c02adc2bd sctp: update hb timer immediately after =
users change hb_interval
> > > > > > > > >     7783b471bfce sctp: update transport state when proces=
sing a dupcook packet
> > > > > > > > >     1abac613c0d5 tcp: fix delayed ACKs for MSS boundary c=
ondition
> > > > > > > > >     821b3b00bc0f tcp: fix quick-ack counting to count act=
ual ACKs of new data
> > > > > > > > >     24fb22bddb71 tipc: fix a potential deadlock on &tx->l=
ock
> > > > > > > > >     2e53585e233c net: stmmac: dwmac-stm32: fix resume on =
STM32 MCU
> > > > > > > > >     74e569324050 ipv4: Set offload_failed flag in fibmatc=
h results
> > > > > > > > >     a4b9bbd1d12f netfilter: nf_tables: nft_set_rbtree: fi=
x spurious insertion failure
> > > > > > > > >     88497f74d684 netfilter: handle the connecting collisi=
on properly in nf_conntrack_proto_sctp
> > > > > > > > >     0c9cf5e8807f ibmveth: Remove condition to recompute T=
CP header checksum.
> > > > > > > > >     5a899e2ce848 net: ethernet: ti: am65-cpsw: Fix error =
code in am65_cpsw_nuss_init_tx_chns()
> > > > > > > > >     4837a192f6d0 net: nfc: llcp: Add lock when modifying =
device list
> > > > > > > > >     cda10784a176 net: usb: smsc75xx: Fix uninit-value acc=
ess in __smsc75xx_read_reg
> > > > > > > > >     2801a1ddb26d net: dsa: mv88e6xxx: Avoid EEPROM timeou=
t when EEPROM is absent
> > > > > > > > >     cb145e6c2070 ptp: ocp: Fix error handling in ptp_ocp_=
device_init
> > > > > > > > >     cd1189956393 ipv4, ipv6: Fix handling of transhdrlen =
in __ip{,6}_append_data()
> > > > > > > > >     147d89ee4143 net: fix possible store tearing in neigh=
_periodic_work()
> > > > > > > > >     bdb4fcf18e16 modpost: add missing else to the "of" ch=
eck
> > > > > > > > >     bc8b89b69638 bpf, sockmap: Reject sk_msg egress redir=
ects to non-TCP sockets
> > > > > > > > >     9fb4dfb8e212 NFSv4: Fix a nfs4_state_manager() race
> > > > > > > > >     fcdd79fda38a ima: rework CONFIG_IMA dependency block
> > > > > > > > >     b67adca1e1be scsi: target: core: Fix deadlock due to =
recursive locking
> > > > > > > > >     9a103e0b100c ima: Finish deprecation of IMA_TRUSTED_K=
EYRING Kconfig
> > > > > > > > >     bb6aee0696c6 regmap: rbtree: Fix wrong register marke=
d as in-cache when creating new node
> > > > > > > > >     0cee8c1b3af3 wifi: mt76: mt76x02: fix MT76x0 external=
 LNA gain handling
> > > > > > > > >     3f6fbbccba2d drivers/net: process the result of hdlc_=
open() and add call of hdlc_close() in uhdlc_close()
> > > > > > > > >     ebad2e4c4847 bpf: Fix tr dereferencing
> > > > > > > > >     5afb996349cb wifi: mwifiex: Fix oob check condition i=
n mwifiex_process_rx_packet
> > > > > > > > >     7c8faa310803 wifi: iwlwifi: mvm: Fix a memory corrupt=
ion issue
> > > > > > > > >     5db7af530ebd iwlwifi: avoid void pointer arithmetic
> > > > > > > > >     6ff75f524dae wifi: iwlwifi: dbg_ini: fix structure pa=
cking
> > > > > > > > >     0ea2a6349733 ubi: Refuse attaching if mtd's erasesize=
 is 0
> > > > > > > > >     bb0707fde749 HID: sony: Fix a potential memory leak i=
n sony_probe()
> > > > > > > > >     8afbacf61919 arm64: Add Cortex-A520 CPU part definiti=
on
> > > > > > > > >     0da6d21ba235 drm/amd: Fix detection of _PR3 on the PC=
Ie root port
> > > > > > > > >     1ad7ccd45a65 net: prevent rewrite of msg_name in sock=
_sendmsg()
> > > > > > > > >     0fb3df94274b net: replace calls to sock->ops->connect=
() with kernel_connect()
> > > > > > > > >     37b54e8acea5 wifi: mwifiex: Fix tlv_buf_left calculat=
ion
> > > > > > > > >     e80f55d6d2a9 qed/red_ll2: Fix undefined behavior bug =
in struct qed_ll2_info
> > > > > > > > >     1e69422efcc6 vringh: don't use vringh_kiov_advance() =
in vringh_iov_xfer()
> > > > > > > > >     4e2f83952b1d scsi: zfcp: Fix a double put in zfcp_por=
t_enqueue()
> > > > > > > > >     310bca649b30 Revert "clk: imx: pll14xx: dynamically c=
onfigure PLL for 393216000/361267200Hz"
> > > > > > > > >     3f59e63568ad block: fix use-after-free of q->q_usage_=
counter
> > > > > > > > >     b75b017b3f37 rbd: take header_rwsem in rbd_dev_refres=
h() only when updating
> > > > > > > > >     33229d783466 rbd: decouple parent info read-in from u=
pdating rbd_dev
> > > > > > > > >     ab73e7ed79d3 rbd: decouple header read-in from updati=
ng rbd_dev->header
> > > > > > > > >     b4ddad3fb0ea rbd: move rbd_dev_refresh() definition
> > > > > > > > >     bb1fae816c90 iommu/arm-smmu-v3: Avoid constructing in=
valid range commands
> > > > > > > > >     c4edc7b5c836 iommu/arm-smmu-v3: Set TTL invalidation =
hint better
> > > > > > > > >     a98ad3adf60d arm64: Avoid repeated AA64MMFR1_EL1 regi=
ster read on pagefault path
> > > > > > > > >     aad6ba1715ec ring-buffer: Fix bytes info in per_cpu b=
uffer stats
> > > > > > > > >     8012d0b05158 ring-buffer: remove obsolete comment for=
 free_buffer_page()
> > > > > > > > >     65a218ca516e NFSv4: Fix a state manager thread deadlo=
ck regression
> > > > > > > > >     8454a2f5e930 NFS: rename nfs_client_kset to nfs_kset
> > > > > > > > >     f8b0b6a8e196 NFS: Cleanup unused rpc_clnt variable
> > > > > > > > >     686746be7bfb ASoC: tegra: Fix redundant PLLA and PLLA=
_OUT0 updates
> > > > > > > > >     0a210e63844b ASoC: soc-utils: Export snd_soc_dai_is_d=
ummy() symbol
> > > > > > > > >     b4f7f1556813 spi: zynqmp-gqspi: fix clock imbalance o=
n probe failure
> > > > > > > > >     e514f897ad66 spi: zynqmp-gqspi: Convert to platform r=
emove callback returning void
> > > > > > > > >     1edcec18cfb7 Linux 5.15.134
> > > > > > > > >     09a683023785 netfilter: nf_tables: fix kdoc warnings =
after gc rework
> > > > > > > > >     66cb6d74f5a1 drm/meson: fix memory leak on ->hpd_noti=
fy callback
> > > > > > > > >     91f1f025b6d9 fs: binfmt_elf_efpic: fix personality fo=
r ELF-FDPIC
> > > > > > > > >     1cae7473a6dd ata: libata-sata: increase PMP SRST time=
out to 10s
> > > > > > > > >     e74adc589922 ata: libata-core: Do not register PM ope=
rations for SAS ports
> > > > > > > > >     4cbd55a81965 ata: libata-core: Fix port and device re=
moval
> > > > > > > > >     ddc525fffb44 ata: libata-core: Fix ata_port_request_p=
m() locking
> > > > > > > > >     2990a195edb5 net: thunderbolt: Fix TCPv6 GSO checksum=
 calculation
> > > > > > > > >     132a5ae4136b bpf: Fix BTF_ID symbol generation collis=
ion in tools/
> > > > > > > > >     58d560e98da5 bpf: Fix BTF_ID symbol generation collis=
ion
> > > > > > > > >     f8673f651bc1 btrfs: properly report 0 avail for very =
full file systems
> > > > > > > > >     b5d00cd7db66 ring-buffer: Update "shortest_full" in p=
olling
> > > > > > > > >     00d2cb8066cb proc: nommu: /proc/<pid>/maps: release m=
map read lock
> > > > > > > > >     40527ebb3e45 Revert "SUNRPC dont update timeout value=
 on connection reset"
> > > > > > > > >     a2b1d486fb70 io_uring/fs: remove sqe->rw_flags checki=
ng from LINKAT
> > > > > > > > >     111fe77cb13f sched/rt: Fix live lock between select_f=
allback_rq() and RT push
> > > > > > > > >     3569ad59664f kernel/sched: Modify initial boot task i=
dle setup
> > > > > > > > >     07f78e97676c i2c: i801: unregister tco_pdev in i801_p=
robe() error path
> > > > > > > > >     70df8b9c59bc ata: libata-scsi: ignore reserved bits f=
or REPORT SUPPORTED OPERATION CODES
> > > > > > > > >     a7e0c10a8c33 ALSA: hda: Disable power save for solvin=
g pop issue on Lenovo ThinkCentre M70q
> > > > > > > > >     0c5fd85fb01f netfilter: nf_tables: disallow rule remo=
val from chain binding
> > > > > > > > >     3936e8714907 nilfs2: fix potential use after free in =
nilfs_gccache_submit_read_data()
> > > > > > > > >     2b837f13a818 serial: 8250_port: Check IRQ data before=
 use
> > > > > > > > >     a48d2bcd23f2 Revert "tty: n_gsm: fix UAF in gsm_clean=
up_mux"
> > > > > > > > >     78e70c6238d2 misc: rtsx: Fix some platforms can not b=
oot and move the l1ss judgment to probe
> > > > > > > > >     f090a8b4d2e3 x86/srso: Add SRSO mitigation for Hygon =
processors
> > > > > > > > >     f5a604757aa8 iommu/arm-smmu-v3: Fix soft lockup trigg=
ered by arm_smmu_mm_invalidate_range
> > > > > > > > >     efce75bd2dbc Smack:- Use overlay inode label in smack=
_inode_copy_up()
> > > > > > > > >     0e3450487f99 smack: Retrieve transmuting information =
in smack_inode_getsecurity()
> > > > > > > > >     3586b3feed1b smack: Record transmuting in smk_transmu=
ted
> > > > > > > > >     9690ad557d94 nvme-pci: always return an ERR_PTR from =
nvme_pci_alloc_dev
> > > > > > > > >     3c29c6e8cd7c scsi: qla2xxx: Fix NULL pointer derefere=
nce in target mode
> > > > > > > > >     6e5e4223c897 i40e: fix potential NULL pointer derefer=
encing of pf->vf i40e_sync_vsi_filters()
> > > > > > > > >     aff3994d4bdd watchdog: iTCO_wdt: Set NO_REBOOT if the=
 watchdog is not already running
> > > > > > > > >     83a30e945571 watchdog: iTCO_wdt: No need to stop the =
timer in probe
> > > > > > > > >     1e8c573f50a7 nvme-pci: do not set the NUMA node of de=
vice if it has none
> > > > > > > > >     182d13dadb03 nvme-pci: factor out a nvme_pci_alloc_de=
v helper
> > > > > > > > >     af58072e867c nvme-pci: factor the iod mempool creatio=
n into a helper
> > > > > > > > >     c8bc44936f2c cgroup: Fix suspicious rcu_dereference_c=
heck() usage warning
> > > > > > > > >     ce6b88a5853d sched/cpuacct: Optimize away RCU read lo=
ck
> > > > > > > > >     b1deb155524e perf build: Define YYNOMEM as YYNOABORT =
for bison < 3.81
> > > > > > > > >     86e65ffc4d0f fbdev/sh7760fb: Depend on FB=3Dy
> > > > > > > > >     4bf0044fe43f ncsi: Propagate carrier gain/loss events=
 to the NCSI controller
> > > > > > > > >     288990ec3580 powerpc/watchpoints: Annotate atomic con=
text in more places
> > > > > > > > >     47a94e87f00c powerpc/watchpoint: Disable pagefaults w=
hen getting user instruction
> > > > > > > > >     7eb09f70d9c2 powerpc/watchpoints: Disable preemption =
in thread_change_pc()
> > > > > > > > >     134b01a39077 media: vb2: frame_vector.c: replace WARN=
_ONCE with a comment
> > > > > > > > >     baf7cf0fdb83 ASoC: imx-rpmsg: Set ignore_pmdown_time =
for dai_link
> > > > > > > > >     9da93c74490c bpf: Clarify error expectations from bpf=
_clone_redirect
> > > > > > > > >     e1a8b79ad768 ASoC: fsl: imx-pcm-rpmsg: Add SNDRV_PCM_=
INFO_BATCH flag
> > > > > > > > >     45e028accbdf spi: stm32: add a delay before SPI disab=
le
> > > > > > > > >     25850bf83dcd spi: nxp-fspi: reset the FLSHxCR1 regist=
ers
> > > > > > > > >     50662d21e414 ata: libata-eh: do not clear ATA_PFLAG_E=
H_PENDING in ata_eh_reset()
> > > > > > > > >     8e3cdab909db smb3: correct places where ENOTSUPP is u=
sed instead of preferred EOPNOTSUPP
> > > > > > > > >     d540a4370aba scsi: pm80xx: Avoid leaking tags when pr=
ocessing OPC_INB_SET_CONTROLLER_CONFIG command
> > > > > > > > >     fde57d7ba9b3 scsi: pm80xx: Use phy-specific SAS addre=
ss when sending PHY_START command
> > > > > > > > >     a1589abd7c4a drm/amdgpu: Handle null atom context in =
VBIOS info ioctl
> > > > > > > > >     fd334cfd8412 drm/amd/display: Don't check registers, =
if using AUX BL control
> > > > > > > > >     a8bc0f6357af platform/mellanox: mlxbf-bootctl: add NE=
T dependency into Kconfig
> > > > > > > > >     344f2f3e61a9 ring-buffer: Do not attempt to read past=
 "commit"
> > > > > > > > >     3db9b420709b selftests: fix dependency checker script
> > > > > > > > >     4aa90e624c30 btrfs: improve error message after failu=
re to add delayed dir index item
> > > > > > > > >     53e7c559b7bf ring-buffer: Avoid softlockup in ring_bu=
ffer_resize()
> > > > > > > > >     b4874f72cf57 selftests/ftrace: Correctly enable event=
 in instance-event.tc
> > > > > > > > >     8c5c9ecbfa8d scsi: ufs: core: Move __ufshcd_send_uic_=
cmd() outside host_lock
> > > > > > > > >     e08e61d50a30 scsi: qedf: Add synchronization between =
I/O completions and abort
> > > > > > > > >     ada7fcba2d6a parisc: irq: Make irq_stack_union static=
 to avoid sparse warning
> > > > > > > > >     b7e376a26b0c parisc: drivers: Fix sparse warning
> > > > > > > > >     d8c6fad00282 parisc: iosapic.c: Fix sparse warnings
> > > > > > > > >     1ecdcfec4e4a parisc: sba: Fix compile warning wrt lis=
t of SBA devices
> > > > > > > > >     bd1ec7f9983b spi: sun6i: fix race between DMA RX tran=
sfer completion and RX FIFO drain
> > > > > > > > >     ff05ed4ae214 spi: sun6i: reduce DMA RX transfer width=
 to single byte
> > > > > > > > >     ac0d06809934 dma-debug: don't call __dma_entry_alloc_=
check_leak() under free_entries_lock
> > > > > > > > >     d938c3d278d5 i2c: npcm7xx: Fix callback completion or=
dering
> > > > > > > > >     0c615323a745 gpio: pmic-eic-sprd: Add can_sleep flag =
for PMIC EIC chip
> > > > > > > > >     2a47ee15a6ab soc: imx8m: Enable OCOTP clock for imx8m=
m before reading registers
> > > > > > > > >     7c59b882b9b3 xtensa: boot/lib: fix function prototype=
s
> > > > > > > > >     70460e81e2d1 xtensa: boot: don't add include-dirs
> > > > > > > > >     bc51434b6612 xtensa: iss/network: make functions stat=
ic
> > > > > > > > >     8e0f78a84f64 xtensa: add default definition for XCHAL=
_HAVE_DIV32
> > > > > > > > >     be57fc50dc3c firmware: imx-dsp: Fix an error handling=
 path in imx_dsp_setup_channels()
> > > > > > > > >     1df81ea9e4db power: supply: ucs1002: fix error code i=
n ucs1002_get_property()
> > > > > > > > >     6937e44ffb91 bus: ti-sysc: Fix SYSC_QUIRK_SWSUP_SIDLE=
_ACT handling for uart wake-up
> > > > > > > > >     0e75aa86a7d0 ARM: dts: ti: omap: motorola-mapphone: F=
ix abe_clkctrl warning on boot
> > > > > > > > >     1b39eae11752 ARM: dts: ti: omap: Fix bandgap thermal =
cells addressing for omap3/4
> > > > > > > > >     fcbf770c66ef ARM: dts: omap: correct indentation
> > > > > > > > >     f5e12de36ab3 treewide: Replace GPLv2 boilerplate/refe=
rence with SPDX - gpl-2.0_56.RULE (part 1)
> > > > > > > > >     6829bc7978e0 clk: tegra: fix error return case for re=
calc_rate
> > > > > > > > >     78277b096d4c bus: ti-sysc: Fix missing AM35xx SoC mat=
ching
> > > > > > > > >     5435a49b3b66 bus: ti-sysc: Use fsleep() instead of us=
leep_range() in sysc_reset()
> > > > > > > > >     c39df101d8ca drm/bridge: ti-sn65dsi83: Do not generat=
e HFP/HBP/HSA and EOT packet
> > > > > > > > >     4bf10fd51ca5 MIPS: Alchemy: only build mmc support he=
lpers if au1xmmc is enabled
> > > > > > > > >     d2640d86876e btrfs: reset destination buffer when rea=
d_extent_buffer() gets invalid range
> > > > > > > > >     1a541999f31f scsi: qla2xxx: Use raw_smp_processor_id(=
) instead of smp_processor_id()
> > > > > > > > >     532a23960566 scsi: qla2xxx: Select qpair depending on=
 which CPU post_cmd() gets called
> > > > > > > > >     6642b4eb083b ata: ahci: Add Elkhart Lake AHCI control=
ler
> > > > > > > > >     072611960741 ata: ahci: Rename board_ahci_mobile
> > > > > > > > >     8274154712a0 ata: ahci: Add support for AMD A85 FCH (=
Hudson D4)
> > > > > > > > >     bd69c74dca70 ata: libata: Rename link flag ATA_LFLAG_=
NO_DB_DELAY
> > > > > > > > >     f5ba6d9d6bec netfilter: nft_exthdr: Fix non-linear he=
ader modification
> > > > > > > > >     7ca3a1b0f474 netfilter: exthdr: add support for tcp o=
ption removal
> > > > > > > > >     fb6f65780c9c Input: i8042 - add quirk for TUXEDO Gemi=
ni 17 Gen1/Clevo PD70PN
> > > > > > > > >     191fc23cfa9a Input: i8042 - rename i8042-x86ia64io.h =
to i8042-acpipnpio.h
> > > > > > > > >     5d2b57c0bc40 xfs: fix xfs_inodegc_stop racing with mo=
d_delayed_work
> > > > > > > > >     657f842859c4 xfs: disable reaping in fscounters scrub
> > > > > > > > >     8444467eadb2 xfs: check that per-cpu inodegc workers =
actually run on that cpu
> > > > > > > > >     67db9ecb84d5 xfs: explicitly specify cpu when forcing=
 inodegc delayed work to run immediately
> > > > > > > > >     99e65f075e6c xfs: introduce xfs_inodegc_push()
> > > > > > > > >     2df381963240 xfs: bound maximum wait time for inodegc=
 work
> > > > > > > > >     08dc21596751 i2c: mux: gpio: Add missing fwnode_handl=
e_put()
> > > > > > > > >     f912d9d87421 i2c: mux: gpio: Replace custom acpi_get_=
local_address()
> > > > > > > > >     1aa39eee57f6 i2c: mux: demux-pinctrl: check the retur=
n value of devm_kstrdup()
> > > > > > > > >     9910b1411e7e gpio: tb10x: Fix an error handling path =
in tb10x_gpio_probe()
> > > > > > > > >     d7acb7031758 Fix up backport of 136191703038 ("interc=
onnect: Teach lockdep about icc_bw_lock order")
> > > > > > > > >     d645206e9be2 igc: Expose tx-usecs coalesce setting to=
 user
> > > > > > > > >     d7a2bf6faa82 bnxt_en: Flush XDP for bnxt_poll_nitroa0=
()'s NAPI
> > > > > > > > >     56d2418a079a net: ena: Flush XDP packets on error.
> > > > > > > > >     07b569051f6e locking/seqlock: Do the lockdep annotati=
on before locking in do_write_seqcount_begin_nested()
> > > > > > > > >     a70dbdede0c7 netfilter: ipset: Fix race between IPSET=
_CMD_CREATE and IPSET_CMD_SWAP
> > > > > > > > >     0dcc9b4097d8 netfilter: nf_tables: disable toggling d=
ormant table state more than once
> > > > > > > > >     ea82139e6e35 net: rds: Fix possible NULL-pointer dere=
ference
> > > > > > > > >     cd05eec2ee0c team: fix null-ptr-deref when team devic=
e type is changed
> > > > > > > > >     8bc97117b51d net: bridge: use DEV_STATS_INC()
> > > > > > > > >     0d3939cccb20 net: hns3: add 5ms delay before clear fi=
rmware reset irq source
> > > > > > > > >     d6d182d856d0 net: hns3: fix fail to delete tc flower =
rules during reset issue
> > > > > > > > >     7c47b238f4ec net: hns3: only enable unicast promisc w=
hen mac table full
> > > > > > > > >     96af9a55b782 net: hns3: fix GRE checksum offload issu=
e
> > > > > > > > >     13ea4b92e875 x86/srso: Fix SBPB enablement for spec_r=
stack_overflow=3Doff
> > > > > > > > >     e2c34afe8362 x86/srso: Fix srso_show_state() side eff=
ect
> > > > > > > > >     21efa88e777f platform/x86: intel_scu_ipc: Fail IPC se=
nd if still busy
> > > > > > > > >     0a5d236b52cf platform/x86: intel_scu_ipc: Don't overr=
ide scu in intel_scu_ipc_dev_simple_command()
> > > > > > > > >     ab78000c38b4 platform/x86: intel_scu_ipc: Check statu=
s upon timeout in ipc_wait_for_interrupt()
> > > > > > > > >     47329633b3f0 platform/x86: intel_scu_ipc: Check statu=
s after timeout in busy_loop()
> > > > > > > > >     26df9ab5de30 dccp: fix dccp_v4_err()/dccp_v6_err() ag=
ain
> > > > > > > > >     3b14e8431855 powerpc/perf/hv-24x7: Update domain valu=
e check
> > > > > > > > >     8860d354f653 ipv4: fix null-deref in ipv4_link_failur=
e
> > > > > > > > >     c196ecd3f893 igc: Fix infinite initialization loop wi=
th early XDP redirect
> > > > > > > > >     a2d69dcb6ccb ionic: fix 16bit math issue when PAGE_SI=
ZE >=3D 64KB
> > > > > > > > >     3796e449a03e i40e: Fix VF VLAN offloading when port V=
LAN is configured
> > > > > > > > >     a628f3b5cd8d i40e: Add VF VLAN pruning
> > > > > > > > >     7a9eee3b5d4d iavf: do not process adminq tasks when _=
_IAVF_IN_REMOVE_TASK is set
> > > > > > > > >     f3c6a17900e8 ASoC: imx-audmix: Fix return error with =
devm_clk_get()
> > > > > > > > >     f90a7b9586d7 net/core: Fix ETH_P_1588 flow dissector
> > > > > > > > >     55629e616452 selftests: tls: swap the TX and RX socke=
ts in some tests
> > > > > > > > >     acabf5df49aa bpf: Avoid deadlock when using queue and=
 stack maps from NMI
> > > > > > > > >     c6e44f4c31c5 netfilter: nf_tables: disallow element r=
emoval on anonymous sets
> > > > > > > > >     6a8de7775329 ASoC: meson: spdifin: start hw on dai pr=
obe
> > > > > > > > >     ef99506eaf1d netfilter: nf_tables: fix memleak when m=
ore than 255 elements expired
> > > > > > > > >     8d7a00b904da netfilter: nft_set_hash: try later when =
GC hits EAGAIN on iteration
> > > > > > > > >     83d3a4607c58 netfilter: nft_set_pipapo: stop GC itera=
tion if GC transaction allocation fails
> > > > > > > > >     949369f9f0d9 netfilter: nft_set_pipapo: call nft_tran=
s_gc_queue_sync() in catchall GC
> > > > > > > > >     2e6846b613fa netfilter: nft_set_rbtree: use read spin=
lock to avoid datapath contention
> > > > > > > > >     9af7dfb3c9d7 netfilter: nft_set_rbtree: skip sync GC =
for new elements in this transaction
> > > > > > > > >     9366966caf1a netfilter: nf_tables: defer gc run if pr=
evious batch is still pending
> > > > > > > > >     082791b42123 netfilter: nf_tables: use correct lock t=
o protect gc_list
> > > > > > > > >     b44a459c6561 netfilter: nf_tables: GC transaction rac=
e with abort path
> > > > > > > > >     24707fa1e1f9 netfilter: nf_tables: GC transaction rac=
e with netns dismantle
> > > > > > > > >     6796800f0d8e netfilter: nf_tables: fix GC transaction=
 races with netns and netlink event exit path
> > > > > > > > >     af78b0489e88 netfilter: nf_tables: don't fail inserts=
 if duplicate has expired
> > > > > > > > >     8f24fe69e3ca netfilter: nf_tables: remove busy mark a=
nd gc batch API
> > > > > > > > >     b290795bd26f netfilter: nft_set_hash: mark set elemen=
t as dead when deleting from packet path
> > > > > > > > >     479a2cf52593 netfilter: nf_tables: adapt set backend =
to use GC transaction API
> > > > > > > > >     d19e8bf3ea41 netfilter: nf_tables: GC transaction API=
 to avoid race with control plane
> > > > > > > > >     7c7e658a36f8 netfilter: nf_tables: don't skip expired=
 elements during walk
> > > > > > > > >     a2d1125ee04e tracing: Have event inject files inc the=
 trace array ref count
> > > > > > > > >     6b6c088c38f7 ext4: do not let fstrim block system sus=
pend
> > > > > > > > >     a9d3bb58da95 ext4: move setting of trimmed bit into e=
xt4_try_to_trim_range()
> > > > > > > > >     d91abea15c61 ext4: replace the traditional ternary co=
nditional operator with with max()/min()
> > > > > > > > >     656f0495e4ac ext4: change s_last_trim_minblks type to=
 unsigned long
> > > > > > > > >     be57857fb3c3 ext4: scope ret locally in ext4_try_to_t=
rim_range()
> > > > > > > > >     e832b55881a1 ata: libahci: clear pending interrupt st=
atus
> > > > > > > > >     f6189f373151 ata: ahci: Drop pointless VPRINTK() call=
s and convert the remaining ones
> > > > > > > > >     fa6d449e4d02 tracing: Increase trace array ref count =
on enable and filter files
> > > > > > > > >     7a688f191a17 tracing: Make trace_marker{,_raw} stream=
-like
> > > > > > > > >     68fc0e75c793 NFSv4.1: fix pnfs MDS=3DDS session trunk=
ing
> > > > > > > > >     0ff78c455494 NFSv4.1: use EXCHGID4_FLAG_USE_PNFS_DS f=
or DS server
> > > > > > > > >     d381bfe13895 SUNRPC: Mark the cred for revalidation i=
f the server rejects it
> > > > > > > > >     f1c434ddafe6 NFS/pNFS: Report EINVAL errors from conn=
ect() to the server
> > > > > > > > >     0c0a7e1f2a6a NFS: More fixes for nfs_direct_write_res=
chedule_io()
> > > > > > > > >     a354b4a367f5 NFS: Use the correct commit info in nfs_=
join_page_group()
> > > > > > > > >     b911329317b4 Linux 5.15.133
> > > > > > > > >     e3a29b80e9e6 interconnect: Teach lockdep about icc_bw=
_lock order
> > > > > > > > >     c6244cd00c97 drm/amd/display: enable cursor degamma f=
or DCN3+ DRM legacy gamma
> > > > > > > > >     08569c92f7f3 net/sched: Retire rsvp classifier
> > > > > > > > >     6b080fa8aae1 drm/amdgpu: fix amdgpu_cs_p1_user_fence
> > > > > > > > >     6386a2d4dc01 drm/amd/display: fix the white screen is=
sue when >=3D 64GB DRAM
> > > > > > > > >     e04b7073bdce ext4: fix rec_len verify error
> > > > > > > > >     93763d58705a scsi: pm8001: Setup IRQs on resume
> > > > > > > > >     72a22696cf19 scsi: megaraid_sas: Fix deadlock on firm=
ware crashdump
> > > > > > > > >     54603e8a88bc ata: libata: disallow dev-initiated LPM =
transitions to unsupported states
> > > > > > > > >     01c7c38a90bc i2c: aspeed: Reset the i2c controller wh=
en timeout occurs
> > > > > > > > >     763d39f4e8fb tracefs: Add missing lockdown check to t=
racefs_create_dir()
> > > > > > > > >     bf195968e362 nfsd: fix change_info in NFSv4 RENAME re=
plies
> > > > > > > > >     bf38c1d29f8b tracing: Have option files inc the trace=
 array ref count
> > > > > > > > >     85ad4688b7a7 tracing: Have current_trace inc the trac=
e array ref count
> > > > > > > > >     962e6723239b tracing: Have tracing_max_latency inc th=
e trace array ref count
> > > > > > > > >     380bbd46d61c btrfs: release path before inode lookup =
during the ino lookup ioctl
> > > > > > > > >     779c3cf2749c btrfs: fix lockdep splat and potential d=
eadlock after failure running delayed items
> > > > > > > > >     f9c78afcee46 ovl: fix incorrect fdput() on aio comple=
tion
> > > > > > > > >     05a7289a5d4b ovl: fix failed copyup of fileattr on a =
symlink
> > > > > > > > >     8bcb80293be7 attr: block mode changes of symlinks
> > > > > > > > >     d30af15e460f md/raid1: fix error: ISO C90 forbids mix=
ed declarations
> > > > > > > > >     abdfde037712 samples/hw_breakpoint: fix building with=
out module unloading
> > > > > > > > >     58787ff3d023 x86/purgatory: Remove LTO flags
> > > > > > > > >     8abf1ec895d5 x86/boot/compressed: Reserve more memory=
 for page tables
> > > > > > > > >     e1a27664fcf5 scsi: lpfc: Fix the NULL vs IS_ERR() bug=
 for debugfs_create_file()
> > > > > > > > >     f0fd24f1fae0 selftests: tracing: Fix to unmount trace=
fs for recovering environment
> > > > > > > > >     dded6b81ad68 scsi: qla2xxx: Fix NULL vs IS_ERR() bug =
for debugfs_create_dir()
> > > > > > > > >     1d5caeac9655 drm: gm12u320: Fix the timeout usage for=
 usb_bulk_msg()
> > > > > > > > >     b9f0572b38c1 btrfs: compare the correct fsid/metadata=
_uuid in btrfs_validate_super
> > > > > > > > >     cba491ee38e2 btrfs: add a helper to read the superblo=
ck metadata_uuid
> > > > > > > > >     cb3671a2eeac btrfs: move btrfs_pinned_by_swapfile pro=
totype into volumes.h
> > > > > > > > >     f16fe29368fd perf test shell stat_bpf_counters: Fix t=
est on Intel
> > > > > > > > >     ad73216e006f perf test: Remove bash construct from st=
at_bpf_counters.sh test
> > > > > > > > >     d8f81baeb9eb MIPS: Use "grep -E" instead of "egrep"
> > > > > > > > >     dfe961b1e476 mtd: rawnand: brcmnand: Fix ECC level fi=
eld setting for v7.2 controller
> > > > > > > > >     56cf9f446b33 mtd: rawnand: brcmnand: Allow SoC to pro=
vide I/O operations
> > > > > > > > >     34fcb59437a7 jbd2: correct the end of the journal rec=
overy scan range
> > > > > > > > >     a4605449cc9f jbd2: rename jbd_debug() to jbd2_debug()
> > > > > > > > >     db6c90f2671c jbd2: kill t_handle_lock transaction spi=
nlock
> > > > > > > > >     e9270898222a jbd2: fix use-after-free of transaction_=
t race
> > > > > > > > >     b0412dd1c24b jbd2: refactor wait logic for transactio=
n updates into a common function
> > > > > > > > >     f980bf1586ef printk: Consolidate console deferred pri=
nting
> > > > > > > > >     9be2957f014d interconnect: Fix locking for runpm vs r=
eclaim
> > > > > > > > >     f3f6bf22a4f5 kobject: Add sanity check for kset->kobj=
.ktype in kset_register()
> > > > > > > > >     81bbe6667024 media: pci: ipu3-cio2: Initialise timing=
 struct to avoid a compiler warning
> > > > > > > > >     d4ef3c9c7947 usb: ehci: add workaround for chipidea P=
ORTSC.PEC bug
> > > > > > > > >     c829d25e26fb serial: cpm_uart: Avoid suspicious locki=
ng
> > > > > > > > >     5353df78c226 scsi: target: iscsi: Fix buffer overflow=
 in lio_target_nacl_info_show()
> > > > > > > > >     b97aaf9faf89 tools: iio: iio_generic_buffer: Fix some=
 integer type and calculation
> > > > > > > > >     60a71fd1910e usb: gadget: fsl_qe_udc: validate endpoi=
nt index for ch9 udc
> > > > > > > > >     c861a61be6d3 usb: cdns3: Put the cdns set active part=
 outside the spin lock
> > > > > > > > >     930c60e13947 media: pci: cx23885: replace BUG with er=
ror return
> > > > > > > > >     48bb6a9fa5cb media: tuners: qt1010: replace BUG_ON wi=
th a regular error
> > > > > > > > >     2a33fc57133d media: dvb-usb-v2: gl861: Fix null-ptr-d=
eref in gl861_i2c_master_xfer
> > > > > > > > >     5b1ea100ad36 media: az6007: Fix null-ptr-deref in az6=
007_i2c_xfer()
> > > > > > > > >     3dd5846a8739 media: anysee: fix null-ptr-deref in any=
see_master_xfer
> > > > > > > > >     033b0c0780ad media: af9005: Fix null-ptr-deref in af9=
005_i2c_xfer
> > > > > > > > >     903566208ae6 media: dw2102: Fix null-ptr-deref in dw2=
102_i2c_transfer()
> > > > > > > > >     d9ef84a7c222 media: dvb-usb-v2: af9035: Fix null-ptr-=
deref in af9035_i2c_master_xfer
> > > > > > > > >     ca49cef3acaa PCI: fu740: Set the number of MSI vector=
s
> > > > > > > > >     d35e7ae10eb8 powerpc/pseries: fix possible memory lea=
k in ibmebus_bus_init()
> > > > > > > > >     46870eea5496 ARM: 9317/1: kexec: Make smp stop calls =
asynchronous
> > > > > > > > >     ef7311101ca4 jfs: fix invalid free of JFS_IP(ipimap)-=
>i_imap in diUnmount
> > > > > > > > >     aa5b019a3e0f fs/jfs: prevent double-free in dbUnmount=
() after failed jfs_remount()
> > > > > > > > >     7ac65c29b6c2 ext2: fix datatype of block number in ex=
t2_xattr_set2()
> > > > > > > > >     4f96c0665f9f md: raid1: fix potential OOB in raid1_re=
move_disk()
> > > > > > > > >     f3e9fc7b02b9 bus: ti-sysc: Configure uart quirks for =
k3 SoC
> > > > > > > > >     3157aa794c75 drm/exynos: fix a possible null-pointer =
dereference due to data race in exynos_drm_crtc_atomic_disable()
> > > > > > > > >     78bc9d25997a drm/amd/display: Blocking invalid 420 mo=
des on HDMI TMDS for DCN31
> > > > > > > > >     5eca70c14b31 ALSA: hda: intel-dsp-cfg: add LunarLake =
support
> > > > > > > > >     e8ba418d4926 samples/hw_breakpoint: Fix kernel BUG 'i=
nvalid opcode: 0000'
> > > > > > > > >     961df5a3f5cc arm64: dts: qcom: sm8250-edo: correct ra=
moops pmsg-size
> > > > > > > > >     49cd54900078 arm64: dts: qcom: sm8150-kumano: correct=
 ramoops pmsg-size
> > > > > > > > >     1e0a38bb840a arm64: dts: qcom: sm6125-pdx201: correct=
 ramoops pmsg-size
> > > > > > > > >     201071956ec6 drm/bridge: tc358762: Instruct DSI host =
to generate HSE packets
> > > > > > > > >     c64ee9dd3358 wifi: mac80211_hwsim: drop short frames
> > > > > > > > >     66594a1e6ddd netfilter: ebtables: fix fortify warning=
s in size_entry_mwt()
> > > > > > > > >     fedd9377dd9c wifi: mac80211: check S1G action frame s=
ize
> > > > > > > > >     e08333e2abae alx: fix OOB-read compiler warning
> > > > > > > > >     2b0a093cdf59 mmc: sdhci-esdhc-imx: improve ESDHC_FLAG=
_ERR010450
> > > > > > > > >     0a1f87f0ca76 tpm_tis: Resend command to recover from =
data transfer errors
> > > > > > > > >     67589d247909 crypto: lib/mpi - avoid null pointer der=
ef in mpi_cmp_ui()
> > > > > > > > >     389106425dee wifi: wil6210: fix fortify warnings
> > > > > > > > >     ddb8f358b5e0 wifi: mwifiex: fix fortify warning
> > > > > > > > >     a7ebe459c72e wifi: ath9k: fix printk specifier
> > > > > > > > >     3de6b6ab69e2 wifi: ath9k: fix fortify warnings
> > > > > > > > >     6b0adfafb073 crypto: lrw,xts - Replace strlcpy with s=
trscpy
> > > > > > > > >     dc100292e503 devlink: remove reload failed checks in =
params get/set callbacks
> > > > > > > > >     7b7964cd9db3 ACPI: x86: s2idle: Catch multiple ACPI_T=
YPE_PACKAGE objects
> > > > > > > > >     eda268b5b7ad hw_breakpoint: fix single-stepping when =
using bpf_overflow_handler
> > > > > > > > >     6e743b7261ef perf/imx_ddr: speed up overflow frequenc=
y of cycle
> > > > > > > > >     f9a2c79c2970 perf/smmuv3: Enable HiSilicon Erratum 16=
2001900 quirk for HIP08/09
> > > > > > > > >     ed1afb597280 ACPI: video: Add backlight=3Dnative DMI =
quirk for Lenovo Ideapad Z470
> > > > > > > > >     f685311dbe05 scftorture: Forgive memory-allocation fa=
ilure if KASAN
> > > > > > > > >     4f03fba096bf rcuscale: Move rcu_scale_writer() schedu=
le_timeout_uninterruptible() to _idle()
> > > > > > > > >     f1ceff37ac6b kernel/fork: beware of __put_task_struct=
() calling context
> > > > > > > > >     430787056dd3 ACPICA: Add AML_NO_OPERAND_RESOLVE flag =
to Timer
> > > > > > > > >     766e56faddbe locks: fix KASAN: use-after-free in trac=
e_event_raw_event_filelock_lock
> > > > > > > > >     6994f806c6d1 btrfs: output extra debug info if we fai=
led to find an inline backref
> > > > > > > > >     71eeddcad734 autofs: fix memory leak of waitqueues in=
 autofs_catatonic_mode
> > > > > > > > >     35ecaa3632bf Linux 5.15.132
> > > > > > > > >     0c0d79f3366a pcd: fix error codes in pcd_init_unit()
> > > > > > > > >     893978f1b4d1 drm/amd/display: Fix a bug when searchin=
g for insert_above_mpcc
> > > > > > > > >     0b8e09b39ef3 MIPS: Only fiddle with CHECKFLAGS if `ne=
ed-compiler'
> > > > > > > > >     55d2e7c1ab8e kcm: Fix error handling for SOCK_DGRAM i=
n kcm_sendmsg().
> > > > > > > > >     e80228b27487 ixgbe: fix timestamp configuration code
> > > > > > > > >     5b55dac919ec ipv6: fix ip6_sock_set_addr_preferences(=
) typo
> > > > > > > > >     481bd6dcc5fe net/tls: do not free tls_rec on async op=
eration in bpf_exec_tx_verdict()
> > > > > > > > >     3600c0dc0deb platform/mellanox: mlxbf-pmc: Fix readin=
g of unprogrammed events
> > > > > > > > >     07c0abc80604 platform/mellanox: mlxbf-pmc: Fix potent=
ial buffer overflows
> > > > > > > > >     7c34ea34516d platform/mellanox: mlxbf-tmfifo: Drop ju=
mbo frames
> > > > > > > > >     694035201aac platform/mellanox: mlxbf-tmfifo: Drop th=
e Rx packet if no more descriptors
> > > > > > > > >     97275339c34c kcm: Fix memory leak in error path of kc=
m_sendmsg()
> > > > > > > > >     864da4a5d5eb r8152: check budget for r8152_poll()
> > > > > > > > >     fbdc4e9908b2 net: dsa: sja1105: hide all multicast ad=
dresses from "bridge fdb show"
> > > > > > > > >     6a4480c5e6eb hsr: Fix uninit-value access in fill_fra=
me_info()
> > > > > > > > >     072324cfab9b net: ethernet: mtk_eth_soc: fix possible=
 NULL pointer dereference in mtk_hwlro_get_fdir_all()
> > > > > > > > >     5bb09dddc724 net: ethernet: mvpp2_main: fix possible =
OOB write in mvpp2_ethtool_get_rxnfc()
> > > > > > > > >     06b4934ab2b5 net/smc: use smc_lgr_list.lock to protec=
t smc_lgr_list.list iterate in smcr_port_add
> > > > > > > > >     aea3801c234d kselftest/runner.sh: Propagate SIGTERM t=
o runner child
> > > > > > > > >     2f1e86014d0c net: ipv4: fix one memleak in __inet_del=
_ifa()
> > > > > > > > >     f086e859ddc2 ARM: dts: BCM5301X: Extend RAM to full 2=
56MB for Linksys EA6500 V2
> > > > > > > > >     8173d9027031 ARM: dts: samsung: exynos4210-i9100: Fix=
 LCD screen's physical size
> > > > > > > > >     072cd213c64f block: don't add or resize partition on =
the disk with GENHD_FL_NO_PART
> > > > > > > > >     c6ce1c5dd327 block: rename GENHD_FL_NO_PART_SCAN to G=
ENHD_FL_NO_PART
> > > > > > > > >     6c06a7f6b41c block: move GENHD_FL_BLOCK_EVENTS_ON_EXC=
L_WRITE to disk->event_flags
> > > > > > > > >     8247ff0d5036 block: move GENHD_FL_NATIVE_CAPACITY to =
disk->state
> > > > > > > > >     5ad42b999a42 pcd: cleanup initialization
> > > > > > > > >     7607bc7fe6cc pcd: move the identify buffer into pcd_i=
dentify
> > > > > > > > >     242bbe218814 perf hists browser: Fix the number of en=
tries for 'e' key
> > > > > > > > >     4d7a8a44e030 perf tools: Handle old data in PERF_RECO=
RD_ATTR
> > > > > > > > >     a8f91f480c62 perf hists browser: Fix hierarchy mode h=
eader
> > > > > > > > >     4ee1cf2a5bcc MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS `=
modules_install' regression
> > > > > > > > >     df4d8d5ab647 drm/amd/display: prevent potential divis=
ion by zero errors
> > > > > > > > >     3b51d016bbbf mtd: rawnand: brcmnand: Fix potential fa=
lse time out warning
> > > > > > > > >     2353b7bb61e4 mtd: rawnand: brcmnand: Fix potential ou=
t-of-bounds access in oob write
> > > > > > > > >     b59ff750bf80 mtd: rawnand: brcmnand: Fix crash during=
 the panic_write
> > > > > > > > >     ca5218aef9e5 btrfs: use the correct superblock to com=
pare fsid in btrfs_validate_super
> > > > > > > > >     f3260733894a btrfs: don't start transaction when join=
ing with TRANS_JOIN_NOSTART
> > > > > > > > >     7ef0e8b812e0 btrfs: free qgroup rsv on io failure
> > > > > > > > >     5fd6f40d17e8 fuse: nlookup missing decrement in fuse_=
direntplus_link
> > > > > > > > >     65b6890c3d01 ata: pata_ftide010: Add missing MODULE_D=
ESCRIPTION
> > > > > > > > >     0b62825dc6c3 ata: sata_gemini: Add missing MODULE_DES=
CRIPTION
> > > > > > > > >     81dd61cb1caa ata: pata_falcon: fix IO base selection =
for Q40
> > > > > > > > >     20bc2c470369 lib: test_scanf: Add explicit type cast =
to result initialization in test_number_prefix()
> > > > > > > > >     4315b4a95ecf ext4: add correct group descriptors and =
reserved GDT blocks to system zone
> > > > > > > > >     ef5fea70e591 jbd2: check 'jh->b_transaction' before r=
emoving it from checkpoint
> > > > > > > > >     6778a3857266 jbd2: fix checkpoint cleanup performance=
 regression
> > > > > > > > >     6b195e07a2cf dmaengine: sh: rz-dmac: Fix destination =
and source data size setting
> > > > > > > > >     0476f2016ddc ARC: atomics: Add compiler barrier to at=
omic operations...
> > > > > > > > >     3375186d5e3f net/mlx5: Free IRQ rmap and notifier on =
kernel shutdown
> > > > > > > > >     2348a375ee16 sh: boards: Fix CEU buffer size passed t=
o dma_declare_coherent_memory()
> > > > > > > > >     f5160dc17e81 net: hns3: remove GSO partial feature bi=
t
> > > > > > > > >     6d548b7cb216 net: hns3: fix the port information disp=
lay when sfp is absent
> > > > > > > > >     cc3c67e08169 net: hns3: fix invalid mutex between tc =
qdisc and dcb ets command issue
> > > > > > > > >     2c9643fa6360 net: hns3: fix debugfs concurrency issue=
 between kfree buffer and read
> > > > > > > > >     8bfa87cf4a86 net: hns3: fix byte order conversion iss=
ue in hclge_dbg_fd_tcam_read()
> > > > > > > > >     19280e8dfb52 netfilter: nfnetlink_osf: avoid OOB read
> > > > > > > > >     1ad7b189cc14 netfilter: nftables: exthdr: fix 4-byte =
stack OOB write
> > > > > > > > >     347f765176db net: dsa: sja1105: complete tc-cbs offlo=
ad support on SJA1110
> > > > > > > > >     cb4494cfe4b7 net: dsa: sja1105: fix -ENOSPC when repl=
acing the same tc-cbs too many times
> > > > > > > > >     77b850b84d21 net: dsa: sja1105: fix bandwidth discrep=
ancy between tc-cbs software and offload
> > > > > > > > >     d11109c03d6e ip_tunnels: use DEV_STATS_INC()
> > > > > > > > >     fcfb5842ef9c idr: fix param name in idr_alloc_cyclic(=
) doc
> > > > > > > > >     131cd74a8e38 s390/zcrypt: don't leak memory if dev_se=
t_name() fails
> > > > > > > > >     12de76fdddb5 igb: Change IGB_MIN to allow set rx/tx v=
alue between 64 and 80
> > > > > > > > >     7c2f90b1c213 igbvf: Change IGBVF_MIN to allow set rx/=
tx value between 64 and 80
> > > > > > > > >     f4c5640d6d38 igc: Change IGC_MIN to allow set rx/tx v=
alue between 64 and 80
> > > > > > > > >     9210b3dd74ac octeontx2-af: Fix truncation of smq in C=
N10K NIX AQ enqueue mbox handler
> > > > > > > > >     1840f08c2a1b kcm: Destroy mutex in kcm_exit_net()
> > > > > > > > >     6ea277b2c626 net: sched: sch_qfq: Fix UAF in qfq_dequ=
eue()
> > > > > > > > >     3868de7c5361 af_unix: Fix data race around sk->sk_err=
.
> > > > > > > > >     d95456660fae af_unix: Fix data-races around sk->sk_sh=
utdown.
> > > > > > > > >     e5edc6e44a88 af_unix: Fix data-race around unix_tot_i=
nflight.
> > > > > > > > >     9151ed4b0061 af_unix: Fix data-races around user->uni=
x_inflight.
> > > > > > > > >     907fbed65cec net: phy: micrel: Correct bit assignment=
s for phy_device flags
> > > > > > > > >     5d2d3f2300c3 net: ipv6/addrconf: avoid integer underf=
low in ipv6_create_tempaddr
> > > > > > > > >     77dd55f5ec6a veth: Fixing transmit return status for =
dropped packets
> > > > > > > > >     56603b2c82e3 igb: disable virtualization features on =
82580
> > > > > > > > >     149bc7834d6f ipv4: ignore dst hint for multipath rout=
es
> > > > > > > > >     e18b49495a52 drm/i915/gvt: Drop unused helper intel_v=
gpu_reset_gtt()
> > > > > > > > >     5979985f2d6b xsk: Fix xsk_diag use-after-free error d=
uring socket cleanup
> > > > > > > > >     49acc5c5b280 net: fib: avoid warn splat in flow disse=
ctor
> > > > > > > > >     ed4e0adfa407 net: read sk->sk_family once in sk_mc_lo=
op()
> > > > > > > > >     e0b483a0584f ipv4: annotate data-races around fi->fib=
_dead
> > > > > > > > >     74df0319e4e2 sctp: annotate data-races around sk->sk_=
wmem_queued
> > > > > > > > >     973a4c302d7f net/sched: fq_pie: avoid stalls in fq_pi=
e_timer()
> > > > > > > > >     5e22217c1142 pwm: lpc32xx: Remove handling of PWM cha=
nnels
> > > > > > > > >     676152264dec watchdog: intel-mid_wdt: add MODULE_ALIA=
S() to allow auto-load
> > > > > > > > >     d6aa2be1379d perf top: Don't pass an ERR_PTR() direct=
ly to perf_session__delete()
> > > > > > > > >     79bd17c99ec9 perf vendor events: Drop some of the JSO=
N/events for power10 platform
> > > > > > > > >     1356eaceef34 perf vendor events: Update the JSON/even=
ts descriptions for power10 platform
> > > > > > > > >     24481d5c7413 x86/virt: Drop unnecessary check on exte=
nded CPUID level in cpu_has_svm()
> > > > > > > > >     6e9863165674 perf annotate bpf: Don't enclose non-deb=
ug code with an assert()
> > > > > > > > >     184be0d59242 Input: tca6416-keypad - fix interrupt en=
able disbalance
> > > > > > > > >     0b79f5a19cfb Input: tca6416-keypad - always expect pr=
oper IRQ number in i2c client
> > > > > > > > >     1e3167aa4ba2 backlight: gpio_backlight: Drop output G=
PIO direction check for initial power state
> > > > > > > > >     6fc8bdc3cf4c pwm: atmel-tcb: Fix resource freeing in =
error path and remove
> > > > > > > > >     6b2bb1a1a63c pwm: atmel-tcb: Harmonize resource alloc=
ation order
> > > > > > > > >     d4734ef765eb pwm: atmel-tcb: Convert to platform remo=
ve callback returning void
> > > > > > > > >     c3bc668581e7 perf trace: Really free the evsel->priv =
area
> > > > > > > > >     8e96f741b328 perf trace: Use zfree() to reduce chance=
s of use after free
> > > > > > > > >     414cf7a2cc87 kconfig: fix possible buffer overflow
> > > > > > > > >     be9ce0dbde4f gfs2: low-memory forced flush fixes
> > > > > > > > >     751facd3634c gfs2: Switch to wait_event in gfs2_logd
> > > > > > > > >     d0245b066971 kbuild: do not run depmod for 'make modu=
les_sign'
> > > > > > > > >     05333a6a21e3 bus: mhi: host: Skip MHI reset if device=
 is in RDDM
> > > > > > > > >     e2964c98ec31 NFSv4/pnfs: minor fix for cleanup path i=
n nfs4_get_device_info
> > > > > > > > >     da302f1d476a NFS: Fix a potential data corruption
> > > > > > > > >     0db19df21be5 clk: qcom: mss-sc7180: fix missing resum=
e during probe
> > > > > > > > >     f64f682be7c8 clk: qcom: q6sstop-qcs404: fix missing r=
esume during probe
> > > > > > > > >     b2f39b813d1e soc: qcom: qmi_encdec: Restrict string l=
ength in decode
> > > > > > > > >     e61db8922631 clk: qcom: gcc-mdm9615: use proper paren=
t for pll0_vote clock
> > > > > > > > >     a8474506c912 clk: imx: pll14xx: dynamically configure=
 PLL for 393216000/361267200Hz
> > > > > > > > >     a69b951c8398 dt-bindings: clock: xlnx,versal-clk: dro=
p select:false
> > > > > > > > >     ead2436cf05e pinctrl: cherryview: fix address_space_h=
andler() argument
> > > > > > > > >     8859f58c1790 parisc: led: Reduce CPU overhead for dis=
k & lan LED computation
> > > > > > > > >     2655e1d970cf parisc: led: Fix LAN receive and transmi=
t LEDs
> > > > > > > > >     7ad44409cd3b lib/test_meminit: allocate pages up to o=
rder MAX_ORDER
> > > > > > > > >     2d8138cea71d clk: qcom: turingcc-qcs404: fix missing =
resume during probe
> > > > > > > > >     9f5db4ab19f8 drm/ast: Fix DRAM init on AST2200
> > > > > > > > >     cfc47807a482 clk: qcom: camcc-sc7180: fix async resum=
e during probe
> > > > > > > > >     309c27162afe fbdev/ep93xx-fb: Do not assign to struct=
 fb_info.dev
> > > > > > > > >     4316e951f164 scsi: qla2xxx: Fix firmware resource tra=
cking
> > > > > > > > >     7b89c3727bff scsi: qla2xxx: Error code did not return=
 to upper layer
> > > > > > > > >     15a71bb25beb scsi: qla2xxx: Fix smatch warn for qla_i=
nit_iocb_limit()
> > > > > > > > >     106392156273 scsi: qla2xxx: Flush mailbox commands on=
 chip reset
> > > > > > > > >     def49a05aef4 scsi: qla2xxx: Remove unsupported ql2xen=
abledif option
> > > > > > > > >     be12c9f4c60c scsi: qla2xxx: Fix TMF leak through
> > > > > > > > >     4322f3de9f21 scsi: qla2xxx: Fix session hang in gnl
> > > > > > > > >     a4708402c458 scsi: qla2xxx: Turn off noisy message lo=
g
> > > > > > > > >     b0453b0cf506 scsi: qla2xxx: Fix erroneous link up fai=
lure
> > > > > > > > >     5934b2125f5b scsi: qla2xxx: Fix command flush during =
TMF
> > > > > > > > >     4a16a46c8481 scsi: qla2xxx: fix inconsistent TMF time=
out
> > > > > > > > >     f1ea164be545 scsi: qla2xxx: Fix deletion race conditi=
on
> > > > > > > > >     683945b17724 scsi: qla2xxx: Limit TMF to 8 per functi=
on
> > > > > > > > >     fde268c234d1 scsi: qla2xxx: Adjust IOCB resource on q=
pair create
> > > > > > > > >     c29848249f78 io_uring: break iopolling on signal
> > > > > > > > >     0def123f1254 io_uring: break out of iowq iopoll on te=
ardown
> > > > > > > > >     1a0aba2bf293 io_uring: always lock in io_apoll_task_f=
unc
> > > > > > > > >     2920cc4c64a1 net/ipv6: SKB symmetric hash should inco=
rporate transport ports
> > > > > > > > >     529bcc70c49c udf: initialize newblock to 0
> > > > > > > > >     fae2d591f3cb Revert "drm/amdgpu: install stub fence i=
nto potential unused fence pointers"
> > > > > > > > >     f01e21d6c7ed md/md-bitmap: remove unnecessary local v=
ariable in backlog_store()
> > > > > > > > >     99a8d14d7965 tracing: Zero the pipe cpumask on alloc =
to avoid spurious -EBUSY
> > > > > > > > >     05c581ad3e7b perf/x86/uncore: Correct the number of C=
HAs on EMR
> > > > > > > > >     861cfdc51f22 x86/sgx: Break up long non-preemptible d=
elays in sgx_vepc_release()
> > > > > > > > >     7e3ddbea87a9 USB: core: Fix oversight in SuperSpeed i=
nitialization
> > > > > > > > >     7fe9d8799606 USB: core: Fix race by not overwriting u=
dev->descriptor in hub_port_init()
> > > > > > > > >     eda9a2966582 USB: core: Change usb_get_device_descrip=
tor() API
> > > > > > > > >     56c49a3328e9 USB: core: Unite old scheme and new sche=
me descriptor reads
> > > > > > > > >     0ad6bad31da6 usb: typec: bus: verify partner exists i=
n typec_altmode_attention
> > > > > > > > >     31220bd89c22 usb: typec: tcpm: set initial svdm versi=
on based on pd revision
> > > > > > > > >     3acc6b9f266f cpufreq: brcmstb-avs-cpufreq: Fix -Warra=
y-bounds bug
> > > > > > > > >     cb65ad51f1bd crypto: stm32 - fix loop iterating throu=
gh scatterlist for DMA
> > > > > > > > >     9ab2c149c2e7 s390/ipl: add missing secure/has_secure =
file to ipl type 'unknown'
> > > > > > > > >     6aff2732577c arm64: sdei: abort running SDEI handlers=
 during crash
> > > > > > > > >     fedecaeef888 pstore/ram: Check start of empty przs du=
ring init
> > > > > > > > >     8d68582b93e6 mmc: renesas_sdhi: register irqs before =
registering controller
> > > > > > > > >     5294144b6ad2 fsverity: skip PKCS#7 parser when keyrin=
g is empty
> > > > > > > > >     86608e1b0c6f net: handle ARPHRD_PPP in dev_is_mac_hea=
der_xmit()
> > > > > > > > >     51ffed9ca1a4 X.509: if signature is unsupported skip =
validation
> > > > > > > > >     6ecf09699eb1 dccp: Fix out of bounds access in DCCP e=
rror handler
> > > > > > > > >     7a2978e8d3c0 dlm: fix plock lookup when using multipl=
e lockspaces
> > > > > > > > >     703cf47d47ba parisc: Fix /proc/cpuinfo output for lsc=
pu
> > > > > > > > >     49a49d442075 procfs: block chmod on /proc/thread-self=
/comm
> > > > > > > > >     44f6ec589353 Revert "PCI: Mark NVIDIA T4 GPUs to avoi=
d bus reset"
> > > > > > > > >     d73d3787c9d1 ntb: Fix calculation ntb_transport_tx_fr=
ee_entry()
> > > > > > > > >     da0c7293f4db ntb: Clean up tx tail index on link down
> > > > > > > > >     bfa051f650a7 ntb: Drop packets when qp link is down
> > > > > > > > >     8f4edcd65534 scsi: mpt3sas: Perform additional retrie=
s if doorbell read returns 0
> > > > > > > > >     58388f2958f6 Revert "scsi: qla2xxx: Fix buffer overru=
n"
> > > > > > > > >     bd188d1e3855 media: venus: hfi_venus: Write to VIDC_C=
TRL_INIT after unmasking interrupts
> > > > > > > > >     6e9632a01e6d media: dvb: symbol fixup for dvb_attach(=
)
> > > > > > > > >     9a43563cfd6b arm64: csum: Fix OoB access in IP checks=
um code for negative lengths
> > > > > > > > >     a0a49da2a79a i3c: master: svc: fix probe failure when=
 no i3c device exist
> > > > > > > > >     a905ac21b2ab xtensa: PMU: fix base address for the ne=
wer hardware
> > > > > > > > >     8742dbf9c25d backlight/lv5207lp: Compare against stru=
ct fb_info.device
> > > > > > > > >     568132f74cb1 backlight/bd6107: Compare against struct=
 fb_info.device
> > > > > > > > >     4e7b4ddc900c backlight/gpio_backlight: Compare agains=
t struct fb_info.device
> > > > > > > > >     3b018c3d1016 ARM: OMAP2+: Fix -Warray-bounds warning =
in _pwrdm_state_switch()
> > > > > > > > >     cbb7d8a4b4be ipmi_si: fix a memleak in try_smi_init()
> > > > > > > > >     6043dd31f771 PCI: rockchip: Use 64-bit mask on MSI 64=
-bit PCI address
> > > > > > > > >     aba1bf197467 media: i2c: ccs: Check rules is non-NULL
> > > > > > > > >     df64819dd6a0 mm/vmalloc: add a safer version of find_=
vm_area() for debug
> > > > > > > > >     20b7d0a62ad1 scsi: core: Fix the scsi_set_resid() doc=
umentation
> > > > > > > > >     20990d6a8543 printk: ringbuffer: Fix truncating buffe=
r size min_t cast
> > > > > > > > >     0a22f9c17b1a rcu: dump vmalloc memory info safely
> > > > > > > > >     d479c841b18d ALSA: pcm: Fix missing fixup call in com=
pat hw_refine ioctl
> > > > > > > > >     111bafa210ae PM / devfreq: Fix leak in devfreq_dev_re=
lease()
> > > > > > > > >     be7353af5b35 igb: set max size RX buffer when store b=
ad packet is enabled
> > > > > > > > >     d5790386595d skbuff: skb_segment, Call zero copy func=
tions before using skbuff frags
> > > > > > > > >     267a29f8bfdb netfilter: xt_sctp: validate the flag_in=
fo count
> > > > > > > > >     b3d07714ad24 netfilter: xt_u32: validate user space i=
nput
> > > > > > > > >     a9e6142e5f8f netfilter: ipset: add the missing IP_SET=
_HASH_WITH_NET0 macro for ip_set_hash_netportnet.c
> > > > > > > > >     3e48f741e98a igmp: limit igmpv3_newpack() packet size=
 to IP_MAX_MTU
> > > > > > > > >     de16cb7986f2 virtio_ring: fix avail_wrap_counter in v=
irtqueue_add_packed
> > > > > > > > >     d6f80ddb9eda cpufreq: Fix the race condition while up=
dating the transition_task of policy
> > > > > > > > >     42d8c7fa0bf6 dmaengine: ste_dma40: Add missing IRQ ch=
eck in d40_probe
> > > > > > > > >     329d0f168c8f um: Fix hostaudio build errors
> > > > > > > > >     58d17e766093 mtd: rawnand: fsmc: handle clk prepare e=
rror in fsmc_nand_resume()
> > > > > > > > >     679a71b31179 mtd: spi-nor: Check bus width while sett=
ing QE bit
> > > > > > > > >     8869fd166f23 leds: trigger: tty: Do not use LED_ON/OF=
F constants, use led_blink_set_oneshot instead
> > > > > > > > >     0f715ea7d36e leds: multicolor: Use rounded division w=
hen calculating color components
> > > > > > > > >     1a68bef23726 leds: pwm: Fix error code in led_pwm_cre=
ate_fwnode()
> > > > > > > > >     abd740db896b rpmsg: glink: Add check for kstrdup
> > > > > > > > >     b45cf29f97a2 phy/rockchip: inno-hdmi: do not power on=
 rk3328 post pll on reg write
> > > > > > > > >     40d637359f3f phy/rockchip: inno-hdmi: round fractal p=
ixclock in rk3328 recalc_rate
> > > > > > > > >     52942a47d034 phy/rockchip: inno-hdmi: use correct vco=
_div_5 macro on rk3328
> > > > > > > > >     31d7e6c7689b mtd: rawnand: brcmnand: Fix mtd oobsize
> > > > > > > > >     6182318ac046 tracing: Fix race issue between cpu buff=
er write and swap
> > > > > > > > >     548f48ec1915 tracing: Remove extra space at the end o=
f hwlat_detector/mode
> > > > > > > > >     2ba8bb00720a x86/speculation: Mark all Skylake CPUs a=
s vulnerable to GDS
> > > > > > > > >     dde88ab4e45b HID: multitouch: Correct devm device ref=
erence for hidinput input_dev name
> > > > > > > > >     4fb28379b3c7 HID: logitech-dj: Fix error handling in =
logi_dj_recv_switch_to_dj_mode()
> > > > > > > > >     1bb42aca7a96 Revert "IB/isert: Fix incorrect release =
of isert connection"
> > > > > > > > >     4f1807fddd9b amba: bus: fix refcount leak
> > > > > > > > >     1c3701373463 serial: tegra: handle clk prepare error =
in tegra_uart_hw_init()
> > > > > > > > >     076fb40cf27a scsi: fcoe: Fix potential deadlock on &f=
ip->ctlr_lock
> > > > > > > > >     c4772759abe1 scsi: core: Use 32-bit hostnum in scsi_h=
ost_lookup()
> > > > > > > > >     6248f4305378 cgroup:namespace: Remove unused cgroup_n=
amespaces_init()
> > > > > > > > >     04824d50e6b5 media: i2c: rdacm21: Fix uninitialized v=
alue
> > > > > > > > >     f3572eef8551 media: ov2680: Fix regulators being left=
 enabled on ov2680_power_on() errors
> > > > > > > > >     205f71744176 media: ov2680: Fix ov2680_set_fmt() whic=
h =3D=3D V4L2_SUBDEV_FORMAT_TRY not working
> > > > > > > > >     89ecb4b40094 media: ov2680: Add ov2680_fill_format() =
helper function
> > > > > > > > >     784d1b83ae2c media: ov2680: Don't take the lock for t=
ry_fmt calls
> > > > > > > > >     dbb717b4ee68 media: ov2680: Remove VIDEO_V4L2_SUBDEV_=
API ifdef-s
> > > > > > > > >     4c1a5c2885d4 media: ov2680: Fix vflip / hflip set fun=
ctions
> > > > > > > > >     958905ed42b8 media: ov2680: Fix ov2680_bayer_order()
> > > > > > > > >     cdd5fca7200d media: ov2680: Remove auto-gain and auto=
-exposure controls
> > > > > > > > >     322a805ffdff media: i2c: ov2680: Set V4L2_CTRL_FLAG_M=
ODIFY_LAYOUT on flips
> > > > > > > > >     abba34017e16 media: ov5640: Enable MIPI interface in =
ov5640_set_power_mipi()
> > > > > > > > >     1717f67be875 USB: gadget: f_mass_storage: Fix unused =
variable warning
> > > > > > > > >     121b8d30f42c media: venus: hfi_venus: Only consider s=
ys_idle_indicator on V1
> > > > > > > > >     f6b483ead6dc media: go7007: Remove redundant if state=
ment
> > > > > > > > >     d079a3e1ccdd platform/x86: dell-sysman: Fix reference=
 leak
> > > > > > > > >     426bd7418701 iommu/vt-d: Fix to flush cache of PASID =
directory table
> > > > > > > > >     9dc6f660815a iommu/qcom: Disable and reset context ba=
nk before programming
> > > > > > > > >     3274e32fc969 fsi: aspeed: Reset master errors after C=
FAM reset
> > > > > > > > >     7a17deca33e1 IB/uverbs: Fix an potential error pointe=
r dereference
> > > > > > > > >     42d111304dd7 RDMA/hns: Fix CQ and QP cache affinity
> > > > > > > > >     b051c3bf3bdf RDMA/hns: Fix incorrect post-send with d=
irect wqe of wr-list
> > > > > > > > >     154822356e4d RDMA/hns: Fix port active speed
> > > > > > > > >     de4aca5b284e iommu/sprd: Add missing force_aperture
> > > > > > > > >     46b76f13f1ad driver core: test_async: fix an error co=
de
> > > > > > > > >     a6992ecefe5d dma-buf/sync_file: Fix docs syntax
> > > > > > > > >     d3256d80406c coresight: tmc: Explicit type conversion=
s to prevent integer overflow
> > > > > > > > >     93a5b461a4e1 RDMA/irdma: Replace one-element array wi=
th flexible-array member
> > > > > > > > >     97097ea2f37e scsi: qedf: Do not touch __user pointer =
in qedf_dbg_fp_int_cmd_read() directly
> > > > > > > > >     1c996be7f233 scsi: qedf: Do not touch __user pointer =
in qedf_dbg_debug_cmd_read() directly
> > > > > > > > >     cb6d20a8b5d7 scsi: qedf: Do not touch __user pointer =
in qedf_dbg_stop_io_on_error_cmd_read() directly
> > > > > > > > >     2f0d202d82b9 x86/APM: drop the duplicate APM_MINOR_DE=
V macro
> > > > > > > > >     f34508d934c4 serial: sprd: Fix DMA buffer leak issue
> > > > > > > > >     c54c66d904fa serial: sprd: Assign sprd_port after ini=
tialized to avoid wrong access
> > > > > > > > >     f61fc650c478 scsi: qla4xxx: Add length check when par=
sing nlattrs
> > > > > > > > >     46ad449efde1 scsi: be2iscsi: Add length check when pa=
rsing nlattrs
> > > > > > > > >     4bd57d889099 scsi: iscsi: Add strlen() check in iscsi=
_if_set{_host}_param()
> > > > > > > > >     e9bac3cc744f scsi: iscsi: Add length check for nlattr=
 payload
> > > > > > > > >     9285efd95996 scsi: iscsi: Rename iscsi_set_param() to=
 iscsi_if_set_param()
> > > > > > > > >     7231d60d41c4 scsi: RDMA/srp: Fix residual handling
> > > > > > > > >     484ddaa90b7e usb: phy: mxs: fix getting wrong state w=
ith mxs_phy_is_otg_host()
> > > > > > > > >     cbb8f7097e11 media: mediatek: vcodec: Return NULL if =
no vdec_fb is found
> > > > > > > > >     18dc93de9019 media: rkvdec: increase max supported he=
ight for H.264
> > > > > > > > >     f1e7d999f37e scsi: hisi_sas: Fix normally completed I=
/O analysed as failed
> > > > > > > > >     46d1b2a3d5a6 scsi: hisi_sas: Fix warnings detected by=
 sparse
> > > > > > > > >     e454e985950b scsi: hisi_sas: Modify v3 HW SATA comple=
tion error processing
> > > > > > > > >     7caac45b52f4 scsi: hisi_sas: Modify v3 HW SSP underfl=
ow error processing
> > > > > > > > >     f64d02822b82 media: cx24120: Add retval check for cx2=
4120_message_send()
> > > > > > > > >     7ca7cd02114a media: dvb-usb: m920x: Fix a potential m=
emory leak in m920x_i2c_xfer()
> > > > > > > > >     fb24b65aaccd media: dib7000p: Fix potential division =
by zero
> > > > > > > > >     56a3d8ae4576 drivers: usb: smsusb: fix error handling=
 code in smsusb_init_device
> > > > > > > > >     d1b51b130d32 iommu: rockchip: Fix directory table add=
ress encoding
> > > > > > > > >     a50d60b8f2af iommu/amd/iommu_v2: Fix pasid_state refc=
ount dec hit 0 warning on pasid unbind
> > > > > > > > >     caf058833b6f media: v4l2-core: Fix a potential resour=
ce leak in v4l2_fwnode_parse_link()
> > > > > > > > >     711e9e44f6c4 media: i2c: tvp5150: check return value =
of devm_kasprintf()
> > > > > > > > >     30d4380eb030 media: ad5820: Drop unsupported ad5823 f=
rom i2c_ and of_device_id tables
> > > > > > > > >     663114dfc178 RDMA/qedr: Remove a duplicate assignment=
 in irdma_query_ah()
> > > > > > > > >     1473e40b3912 pNFS: Fix assignment of xprtdata.cred
> > > > > > > > >     fb7ddc1138b0 NFSv4.2: fix handling of COPY ERR_OFFLOA=
D_NO_REQ
> > > > > > > > >     53a1e5ab1b11 NFS: Guard against READDIR loop when ent=
ry names exceed MAXNAMELEN
> > > > > > > > >     19a648a07572 NFSD: da_addr_body field missing in some=
 GETDEVICEINFO replies
> > > > > > > > >     b0f127a7c635 fs: lockd: avoid possible wrong NULL par=
ameter
> > > > > > > > >     8f994b830dd0 jfs: validate max amount of blocks befor=
e allocation.
> > > > > > > > >     f6a84ef1d080 ext4: fix unttached inode after power cu=
t with orphan file feature enabled
> > > > > > > > >     a9ddbfed5346 powerpc/iommu: Fix notifiers being share=
d by PCI and VIO buses
> > > > > > > > >     a70c8de30514 nfs/blocklayout: Use the passed in gfp f=
lags
> > > > > > > > >     2935443dc9c2 powerpc/pseries: Rework lppaca_shared_pr=
oc() to avoid DEBUG_PREEMPT
> > > > > > > > >     75dcb650a7ef powerpc: Don't include lppaca.h in paca.=
h
> > > > > > > > >     cefcb002c5c9 PCI: layerscape: Add workaround for lost=
 link capabilities during reset
> > > > > > > > >     4be323c73797 PCI: layerscape: Add the endpoint linkup=
 notifier support
> > > > > > > > >     69c712389e1f PCI: dwc: Add start_link/stop_link inlin=
es
> > > > > > > > >     aac0a9a1577b wifi: ath10k: Use RMW accessors for chan=
ging LNKCTL
> > > > > > > > >     3539bab5f9de wifi: ath11k: Use RMW accessors for chan=
ging LNKCTL
> > > > > > > > >     ea670d0146a3 net/mlx5: Use RMW accessors for changing=
 LNKCTL
> > > > > > > > >     348ef09df984 drm/radeon: Use RMW accessors for changi=
ng LNKCTL
> > > > > > > > >     5468237382ed drm/amdgpu: Use RMW accessors for changi=
ng LNKCTL
> > > > > > > > >     00f79e78bf4b powerpc/perf: Convert fsl_emb notifier t=
o state machine callbacks
> > > > > > > > >     a26a5e4be2c4 powerpc/fadump: reset dump area size if =
fadump memory reserve fails
> > > > > > > > >     13fd667db999 vfio/type1: fix cap_migration informatio=
n leak
> > > > > > > > >     6b708243d3d9 powerpc/radix: Move some functions into =
#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> > > > > > > > >     dbde1d9c54e2 clk: imx: composite-8m: fix clock pauses=
 when set_rate would be a no-op
> > > > > > > > >     824e97302fd8 clk: imx8mp: fix sai4 clock
> > > > > > > > >     66ef144dbdf9 PCI/ASPM: Use RMW accessors for changing=
 LNKCTL
> > > > > > > > >     f46fa8ab8d82 PCI: pciehp: Use RMW accessors for chang=
ing LNKCTL
> > > > > > > > >     759d978e831b pinctrl: mcp23s08: check return value of=
 devm_kasprintf()
> > > > > > > > >     02faf0bd6fdc PCI: Mark NVIDIA T4 GPUs to avoid bus re=
set
> > > > > > > > >     4c20a4143276 PCI: microchip: Correct the DED and SEC =
interrupt bit offsets
> > > > > > > > >     377f7aeddda0 clk: qcom: gcc-sm6350: Fix gcc_sdcc2_app=
s_clk_src
> > > > > > > > >     1c4a98c55fa3 clk: qcom: reset: Use the correct type o=
f sleep/delay based on length
> > > > > > > > >     bd4eff9c835a clk: qcom: gcc-sm8250: Fix gcc_sdcc2_app=
s_clk_src
> > > > > > > > >     b1cb8bf42b36 ext4: avoid potential data overflow in n=
ext_linear_group
> > > > > > > > >     3e24082f1682 ext4: correct grp validation in ext4_mb_=
good_group
> > > > > > > > >     febacbefe451 EDAC/igen6: Fix the issue of no error ev=
ents
> > > > > > > > >     964f62caac08 clk: qcom: gcc-sc7180: Fix up gcc_sdcc2_=
apps_clk_src
> > > > > > > > >     f1399e1543e7 clk: sunxi-ng: Modify mismatched functio=
n name
> > > > > > > > >     92913d32e719 drivers: clk: keystone: Fix parameter ju=
dgment in _of_pll_clk_init()
> > > > > > > > >     3ad53071fe85 ipmi:ssif: Fix a memory leak when scanni=
ng for an adapter
> > > > > > > > >     7792869495b6 ipmi:ssif: Add check for kstrdup
> > > > > > > > >     53abafedfeb7 ALSA: ac97: Fix possible error value of =
*rac97
> > > > > > > > >     48fc5717b249 of: unittest: Fix overlay type in apply/=
revert check
> > > > > > > > >     01bb96ad3808 of: overlay: Call of_changeset_init() ea=
rly
> > > > > > > > >     30f04a41e7d7 md: raid0: account for split bio in iost=
at accounting
> > > > > > > > >     9643cc0b1771 md/raid0: Fix performance regression for=
 large sequential writes
> > > > > > > > >     17fbf7da491f md/raid0: Factor out helper for mapping =
and submitting a bio
> > > > > > > > >     d04f1e322f52 md: add error_handlers for raid0 and lin=
ear
> > > > > > > > >     d8b6adb84041 md: Set MD_BROKEN for RAID1 and RAID10
> > > > > > > > >     a68fabdad970 bus: ti-sysc: Fix cast to enum warning
> > > > > > > > >     7636dfc42b66 arm64: dts: qcom: apq8016-sbc: Fix ov564=
0 regulator supply names
> > > > > > > > >     fff4d36247e8 drm/mediatek: Fix potential memory leak =
if vmap() fail
> > > > > > > > >     e5758ad9a34f drm/mediatek: Remove freeing not dynamic=
 allocated memory
> > > > > > > > >     97274bea0136 bus: ti-sysc: Fix build warning for 64-b=
it build
> > > > > > > > >     cc6b09671d0c io_uring: fix drain stalls by invalid SQ=
E
> > > > > > > > >     0152e7758cc4 audit: fix possible soft lockup in __aud=
it_inode_child()
> > > > > > > > >     48e4c4819039 drm/msm/a2xx: Call adreno_gpu_init() ear=
lier
> > > > > > > > >     76c3ad12441f drm/amd/pm: fix variable dereferenced is=
sue in amdgpu_device_attr_create()
> > > > > > > > >     32e060927351 smackfs: Prevent underflow in smk_set_ci=
pso()
> > > > > > > > >     502dfc5875ba firmware: meson_sm: fix to avoid potenti=
al NULL pointer dereference
> > > > > > > > >     c0b1eee64870 drm/msm/mdp5: Don't leak some plane stat=
e
> > > > > > > > >     d0b82c217feb drm: xlnx: zynqmp_dpsub: Add missing che=
ck for dma_set_mask
> > > > > > > > >     b7b0c48851c4 ima: Remove deprecated IMA_TRUSTED_KEYRI=
NG Kconfig
> > > > > > > > >     8025396b76e9 drm/panel: simple: Add missing connector=
 type and pixel format for AUO T215HVN01
> > > > > > > > >     27eee65b2e31 drm/armada: Fix off-by-one error in arma=
da_overlay_get_property()
> > > > > > > > >     cc9254b24a4b arm64: dts: qcom: sm8150: Fix the I2C7 i=
nterrupt
> > > > > > > > >     ea5bc6f5aa09 of: unittest: fix null pointer dereferen=
cing in of_unittest_find_node_by_name()
> > > > > > > > >     4197eeb55f4b drm/tegra: dpaux: Fix incorrect return v=
alue of platform_get_irq
> > > > > > > > >     9712279e9743 drm/msm: Update dev core dump to not pri=
nt backwards
> > > > > > > > >     8ef5d1f16d92 md/md-bitmap: hold 'reconfig_mutex' in b=
acklog_store()
> > > > > > > > >     382638364711 md/bitmap: don't set max_write_behind if=
 there is no write mostly device
> > > > > > > > >     a3d36107ee48 md/raid10: use dereference_rdev_and_rrde=
v() to get devices
> > > > > > > > >     94ca5eed9530 md/raid10: factor out dereference_rdev_a=
nd_rrdev()
> > > > > > > > >     246bac7d3c3e drm/amdgpu: Update min() to min_t() in '=
amdgpu_info_ioctl'
> > > > > > > > >     de93b4711ac2 arm64: dts: qcom: sdm845: Fix the min fr=
equency of "ice_core_clk"
> > > > > > > > >     a9e56fa8a0ca arm64: dts: qcom: sdm845: Add missing RP=
Mh power domain to GCC
> > > > > > > > >     db0ba312542d ARM: dts: BCM53573: Fix Ethernet info fo=
r Luxul devices
> > > > > > > > >     c4413633ef78 drm: adv7511: Fix low refresh rate regis=
ter for ADV7533/5
> > > > > > > > >     57b6d92c79e9 ARM: dts: samsung: s5pv210-smdkv210: cor=
rect ethernet reg addresses (split)
> > > > > > > > >     b7f47031e319 ARM: dts: s5pv210: add dummy 5V regulato=
r for backlight on SMDKv210
> > > > > > > > >     2f0246b3c7ff ARM: dts: samsung: s3c6410-mini6410: cor=
rect ethernet reg addresses (split)
> > > > > > > > >     d12beb1b1ee5 ARM: dts: s3c64xx: align pinctrl with dt=
schema
> > > > > > > > >     188f2d41fa5d x86/mm: Fix PAT bit missing from page pr=
otection modify mask
> > > > > > > > >     1dd43e1e54d5 drm/etnaviv: fix dumping of active MMU c=
ontext
> > > > > > > > >     1634fe406c34 arm64: dts: qcom: pmi8994: Add missing O=
VP interrupt
> > > > > > > > >     4b7eb5e2c1c4 arm64: dts: qcom: Move WLED num-strings =
from pmi8994 to sony-xperia-tone
> > > > > > > > >     92919d98e673 arm64: dts: qcom: pmi8994: Remove hardco=
ded linear WLED enabled-strings
> > > > > > > > >     365909857242 arm64: dts: qcom: pm660l: Add missing sh=
ort interrupt
> > > > > > > > >     ea48fd91df12 arm64: dts: qcom: correct SPMI WLED regi=
ster range encoding
> > > > > > > > >     eee01e0d6abe arm64: dts: qcom: pmi8998: Add node for =
WLED
> > > > > > > > >     b788afdbfd5a arm64: dts: qcom: sm8250-sony-xperia: co=
rrect GPIO keys wakeup again
> > > > > > > > >     2840d9b9c875 ARM: dts: BCM53573: Use updated "spi-gpi=
o" binding properties
> > > > > > > > >     b35f3ca1877e ARM: dts: BCM53573: Add cells sizes to P=
CIe node
> > > > > > > > >     bed08bb83292 drm/amdgpu: avoid integer overflow warni=
ng in amdgpu_device_resize_fb_bar()
> > > > > > > > >     261e69456617 arm64: dts: qcom: sm8250: Mark PCIe host=
s as DMA coherent
> > > > > > > > >     12a93e53eaf0 arm64: dts: qcom: pmk8350: fix ADC-TM co=
mpatible string
> > > > > > > > >     4c9a637258bb arm64: dts: qcom: sm8350: Use proper CPU=
 compatibles
> > > > > > > > >     4c918fb77dea arm64: dts: qcom: sm8350: Add missing LM=
H interrupts to cpufreq
> > > > > > > > >     9c022ab2db40 arm64: dts: qcom: msm8996: Add missing i=
nterrupt to the USB2 controller
> > > > > > > > >     bda65ecaec97 arm64: dts: qcom: sm8250-edo: Rectify gp=
io-keys
> > > > > > > > >     6119aaced94f arm64: dts: qcom: sm8250-edo: Add GPIO l=
ine names for PMIC GPIOs
> > > > > > > > >     c0dc9d7d3f2b arm64: dts: qcom: sm8250-edo: Add gpio l=
ine names for TLMM
> > > > > > > > >     d2d698daa1fa arm64: dts: qcom: sm8250: correct dynami=
c power coefficients
> > > > > > > > >     510bae3d37f7 soc: qcom: ocmem: Fix NUM_PORTS & NUM_MA=
CROS macros
> > > > > > > > >     b08c7a31baeb soc: qcom: ocmem: Add OCMEM hardware ver=
sion print
> > > > > > > > >     dc04034502e6 ASoC: stac9766: fix build errors with RE=
GMAP_AC97
> > > > > > > > >     89602de9a2d7 quota: fix dqput() to follow the guarant=
ees dquot_srcu should provide
> > > > > > > > >     1df46e717ee9 quota: add new helper dquot_active()
> > > > > > > > >     bd0a6452f070 quota: rename dquot_active() to inode_qu=
ota_active()
> > > > > > > > >     5b8240223407 quota: factor out dquot_write_dquot()
> > > > > > > > >     6c6efd3a1d06 drm/bridge: tc358764: Fix debug print pa=
rameter order
> > > > > > > > >     a48e7def0006 netrom: Deny concurrent connect().
> > > > > > > > >     4cf994d3f4ff net/sched: sch_hfsc: Ensure inner classe=
s have fsc curve
> > > > > > > > >     edb5b1b3b9f8 hwmon: (tmp513) Fix the channel number i=
n tmp51x_is_visible()
> > > > > > > > >     a85fd8116555 mlxsw: i2c: Limit single transaction buf=
fer size
> > > > > > > > >     7790b6a2f5f0 mlxsw: i2c: Fix chunk size setting in ou=
tput mailbox buffer
> > > > > > > > >     510e0cbd6408 net: arcnet: Do not call kfree_skb() und=
er local_irq_disable()
> > > > > > > > >     93a572b9d42f wifi: ath9k: use IS_ERR() with debugfs_c=
reate_dir()
> > > > > > > > >     5138beea8e7f Bluetooth: btusb: Do not call kfree_skb(=
) under spin_lock_irqsave()
> > > > > > > > >     d7fd24b8d1bb wifi: mwifiex: avoid possible NULL skb p=
ointer dereference
> > > > > > > > >     71ce8be48bf0 wifi: nl80211/cfg80211: add forgotten nl=
a_policy for BSS color attribute
> > > > > > > > >     11f93fff6e8a wifi: ath9k: protect WMI command respons=
e buffer replacement with a lock
> > > > > > > > >     6904c7afd512 wifi: ath9k: fix races between ath9k_wmi=
_cmd and ath9k_wmi_ctrl_rx
> > > > > > > > >     cec7db9ea031 samples/bpf: fix broken map lookup probe
> > > > > > > > >     89f19a9a055d wifi: mwifiex: Fix missed return in oob =
checks failed path
> > > > > > > > >     308eb3a609ac wifi: mwifiex: fix memory leak in mwifie=
x_histogram_read()
> > > > > > > > >     9c00731bf05d fs: ocfs2: namei: check return value of =
ocfs2_add_entry()
> > > > > > > > >     f683992d30ee lwt: Check LWTUNNEL_XMIT_CONTINUE strict=
ly
> > > > > > > > >     e3f647e4b642 lwt: Fix return values of BPF xmit ops
> > > > > > > > >     4ff998134025 hwrng: iproc-rng200 - Implement suspend =
and resume calls
> > > > > > > > >     5a70ab6b59b2 crypto: caam - fix unchecked return valu=
e error
> > > > > > > > >     660b6b1c5cf8 ice: ice_aq_check_events: fix off-by-one=
 check when filling buffer
> > > > > > > > >     55fab9389d65 net-memcg: Fix scope of sockmem pressure=
 indicators
> > > > > > > > >     41c40d84838d selftests/bpf: Clean up fmod_ret in benc=
h_rename test script
> > > > > > > > >     50c78e71446d net: tcp: fix unexcepted socket die when=
 snd_wnd is 0
> > > > > > > > >     942d8cefb022 Bluetooth: Fix potential use-after-free =
when clear keys
> > > > > > > > >     7b0243d26a71 Bluetooth: nokia: fix value check in nok=
ia_bluetooth_serdev_probe()
> > > > > > > > >     048545d9fc64 crypto: api - Use work queue in crypto_d=
estroy_instance
> > > > > > > > >     56cb7bbefcaf crypto: stm32 - Properly handle pm_runti=
me_get failing
> > > > > > > > >     e3c4a6b073e4 selftests/bpf: fix static assert compila=
tion issue for test_cls_*.c
> > > > > > > > >     43423b3e0467 wifi: mwifiex: fix error recovery in PCI=
E buffer descriptor management
> > > > > > > > >     7c54b6fc39eb wifi: mwifiex: Fix OOB and integer under=
flow when rx packets
> > > > > > > > >     a20b96cf6925 wifi: mt76: mt7915: fix power-limits whi=
le chan_switch
> > > > > > > > >     5c75a4379589 can: gs_usb: gs_usb_receive_bulk_callbac=
k(): count RX overflow errors also in case of OOM
> > > > > > > > >     890843254f38 spi: tegra20-sflash: fix to check return=
 value of platform_get_irq() in tegra_sflash_probe()
> > > > > > > > >     2ff9ac0cf25f wifi: mt76: testmode: add nla_policy for=
 MT76_TM_ATTR_TX_LENGTH
> > > > > > > > >     802008e8c73a ipv6: Add reasons for skb drops to __udp=
6_lib_rcv
> > > > > > > > >     7dcbc0bb0e5c bpf: reject unhashed sockets in bpf_sk_a=
ssign
> > > > > > > > >     caa2883b1885 udp: re-score reuseport groups when conn=
ected sockets are present
> > > > > > > > >     b60dfa4559d8 regmap: rbtree: Use alloc_flags for memo=
ry allocations
> > > > > > > > >     34f1180658d9 hwrng: pic32 - use devm_clk_get_enabled
> > > > > > > > >     5af3c8676b36 hwrng: nomadik - keep clock enabled whil=
e hwrng is registered
> > > > > > > > >     14c6d1e80847 tcp: tcp_enter_quickack_mode() should be=
 static
> > > > > > > > >     7b75b4c90a9e bpf: Clear the probe_addr for uprobe
> > > > > > > > >     75d3960be702 bpftool: Use a local bpf_perf_event_valu=
e to fix accessing its fields
> > > > > > > > >     8ea6871116d5 cpufreq: powernow-k8: Use related_cpus i=
nstead of cpus in driver.exit()
> > > > > > > > >     be2092d2a703 x86/efistub: Fix PCI ROM preservation in=
 mixed mode
> > > > > > > > >     9eb25ea7b65d ACPI: x86: s2idle: Fix a logic error par=
sing AMD constraints table
> > > > > > > > >     26097a7f28b3 ACPI: x86: s2idle: Post-increment variab=
les when getting constraints
> > > > > > > > >     8a962f11a95b s390/paes: fix PKEY_TYPE_EP11_AES handli=
ng for secure keyblobs
> > > > > > > > >     7833a74f8d00 s390/pkey: fix/harmonize internal keyblo=
b headers
> > > > > > > > >     208383d68510 selftests/futex: Order calls to futex_lo=
ck_pi
> > > > > > > > >     c7802ff51adc perf/imx_ddr: don't enable counter0 if n=
one of 4 counters are used
> > > > > > > > >     0a872a0521c8 x86/decompressor: Don't rely on upper 32=
 bits of GPRs being preserved
> > > > > > > > >     3af6f77e8090 selftests/resctrl: Close perf value read=
 fd on errors
> > > > > > > > >     4505ad996b66 selftests/resctrl: Unmount resctrl FS if=
 child fails to run benchmark
> > > > > > > > >     c68a196e7ff6 selftests/resctrl: Don't leak buffer in =
fill_cache()
> > > > > > > > >     fdcb63afd3f6 selftests/resctrl: Add resctrl.h into bu=
ild deps
> > > > > > > > >     b2ba11ed4d10 selftests/resctrl: Make resctrl_tests ru=
n using kselftest framework
> > > > > > > > >     e0478944f4a5 OPP: Fix passing 0 to PTR_ERR in _opp_at=
tach_genpd()
> > > > > > > > >     ec9d118ad99d refscale: Fix uninitalized use of wait_q=
ueue_head_t
> > > > > > > > >     e280033ef135 ARM: ptrace: Restore syscall skipping fo=
r tracers
> > > > > > > > >     4c3f33904dea ARM: ptrace: Restore syscall restart tra=
cing
> > > > > > > > >     0481251b7cd6 selftests/harness: Actually report SKIP =
for signal tests
> > > > > > > > >     060ca3f7899a tmpfs: verify {g,u}id mount options corr=
ectly
> > > > > > > > >     d412e9b34b90 fs: Fix error checking for d_hash_and_lo=
okup()
> > > > > > > > >     a4229f93bc54 eventfd: prevent underflow for eventfd s=
emaphores
> > > > > > > > >     cedb8719333d reiserfs: Check the return value from __=
getblk()
> > > > > > > > >     c1a4117f1544 Revert "net: macsec: preserve ingress fr=
ame ordering"
> > > > > > > > >     40671f90d5b5 udf: Handle error when adding extent to =
a file
> > > > > > > > >     099bf90d7fc4 udf: Check consistency of Space Bitmap D=
escriptor
> > > > > > > > >     7039aa1be9cc of: kexec: Mark ima_{free,stable}_kexec_=
buffer() as __init
> > > > > > > > >     759d51eda2d0 net: Avoid address overwrite in kernel_c=
onnect
> > > > > > > > >     7c4cce5700b9 arm64: lib: Import latest version of Arm=
 Optimized Routines' strncmp
> > > > > > > > >     104df1c695c1 crypto: rsa-pkcs1pad - Use helper to set=
 reqsize
> > > > > > > > >     273f4615314f platform/mellanox: Fix mlxbf-tmfifo not =
handling all virtio CONSOLE notifications
> > > > > > > > >     9ef5c25bcf1b tracing: Introduce pipe_cpumask to avoid=
 race on trace_pipes
> > > > > > > > >     8c1b60dad0f5 ALSA: seq: oss: Fix racy open/close of M=
IDI devices
> > > > > > > > >     fa05aea28195 scsi: lpfc: Fix incorrect big endian typ=
e assignment in bsg loopback path
> > > > > > > > >     f0bf8a071134 scsi: storvsc: Always set no_report_opco=
des
> > > > > > > > >     e9e62419e797 sctp: handle invalid error codes without=
 calling BUG()
> > > > > > > > >     3714bb4a1df8 bnx2x: fix page fault following EEH reco=
very
> > > > > > > > >     53b8cc2f9685 netlabel: fix shift wrapping bug in netl=
bl_catmap_setlong()
> > > > > > > > >     867cdd7f9544 drm/amdgpu: Match against exact bootload=
er status
> > > > > > > > >     0863204deb3c net: hns3: restore user pause configure =
when disable autoneg
> > > > > > > > >     ac93def0dbb4 scsi: qedi: Fix potential deadlock on &q=
edi_percpu->p_work_lock
> > > > > > > > >     bef6c89a92d0 scsi: lpfc: Remove reftag check in DIF p=
aths
> > > > > > > > >     b439e33a8c93 idmaengine: make FSL_EDMA and INTEL_IDMA=
64 depends on HAS_IOMEM
> > > > > > > > >     156b803194ae wifi: brcmfmac: Fix field-spanning write=
 in brcmf_scan_params_v2_to_v1()
> > > > > > > > >     87ea5e89407e net: usb: qmi_wwan: add Quectel EM05GV2
> > > > > > > > >     e1313fa9d2e3 vmbus_testing: fix wrong python syntax f=
or integer value comparison
> > > > > > > > >     5faad57ba6c7 clk: fixed-mmio: make COMMON_CLK_FIXED_M=
MIO depend on HAS_IOMEM
> > > > > > > > >     e13f0dd5fbe2 kprobes: Prohibit probing on CFI preambl=
e symbol
> > > > > > > > >     ee49b97cb5ae security: keys: perform capable check on=
ly on privileged operations
> > > > > > > > >     f44f50305de2 ata: pata_arasan_cf: Use dev_err_probe()=
 instead dev_err() in data_xfer()
> > > > > > > > >     a85c523aeccd ovl: Always reevaluate the file signatur=
e for IMA
> > > > > > > > >     3faa126258a9 drm/amd/display: Exit idle optimizations=
 before attempt to access PHY
> > > > > > > > >     c152ca4f219b platform/x86: huawei-wmi: Silence ambien=
t light sensor
> > > > > > > > >     a9988b9c7a31 platform/x86/intel/hid: Add HP Dragonfly=
 G2 to VGBS DMI quirks
> > > > > > > > >     7f3901b04c8f platform/x86: intel: hid: Always call BT=
NL ACPI method
> > > > > > > > >     23151421ed01 ASoC: atmel: Fix the 8K sample parameter=
 in I2SC master
> > > > > > > > >     c934d2a6970c ASoC: rt711-sdca: fix for JD event handl=
ing in ClockStop Mode0
> > > > > > > > >     20587011d271 ASoC: rt711: fix for JD event handling i=
n ClockStop Mode0
> > > > > > > > >     b41f79896456 ASoc: codecs: ES8316: Fix DMIC config
> > > > > > > > >     cc2b0a2055dc ASoC: rt5682-sdw: fix for JD event handl=
ing in ClockStop Mode0
> > > > > > > > >     5b64fc2471f9 fs/nls: make load_nls() take a const par=
ameter
> > > > > > > > >     f85908f6bfd2 s390/dasd: fix hanging device after requ=
est requeue
> > > > > > > > >     a4845e694893 s390/dasd: use correct number of retries=
 for ERP requests
> > > > > > > > >     e062aa1acf9b m68k: Fix invalid .section syntax
> > > > > > > > >     bbfa7d712b24 vxlan: generalize vxlan_parse_gpe_hdr an=
d remove unused args
> > > > > > > > >     b10215ffdb01 ethernet: atheros: fix return value chec=
k in atl1c_tso_csum()
> > > > > > > > >     6bb94f46d31a ASoC: da7219: Check for failure reading =
AAD IRQ events
> > > > > > > > >     279a6dad0cd9 ASoC: da7219: Flush pending AAD IRQ when=
 suspending
> > > > > > > > >     d424c636b750 ksmbd: no response from compound read
> > > > > > > > >     82373d1b763e ksmbd: fix out of bounds in smb3_decrypt=
_req()
> > > > > > > > >     20d449a08749 9p: virtio: make sure 'offs' is initiali=
zed in zc_request
> > > > > > > > >     c4269c7258d9 media: pci: cx23885: fix error handling =
for cx23885 ATSC boards
> > > > > > > > >     17d75773b66e media: pulse8-cec: handle possible ping =
error
> > > > > > > > >     f281a3739399 phy: qcom-snps-femto-v2: use qcom_snps_h=
sphy_suspend/resume error code
> > > > > > > > >     dfff9c91cbb0 ARM: dts: imx: Set default tuning step f=
or imx7d usdhc
> > > > > > > > >     4e364cab1331 ARM: dts: imx: Adjust dma-apbh node name
> > > > > > > > >     99319298fd9a ARM: dts: imx7s: Drop dma-apb interrupt-=
names
> > > > > > > > >     1dc2c12854b6 ARM: dts: imx: update sdma node name for=
mat
> > > > > > > > >     aff03380bda4 Linux 5.15.131
> > > > > > > > >     cd8ab566cf17 usb: typec: tcpci: clear the fault statu=
s bit
> > > > > > > > >     403b2e940910 usb: typec: tcpci: move tcpci.h to inclu=
de/linux/usb/
> > > > > > > > >     f29483873e24 pinctrl: amd: Don't show `Invalid config=
 param` errors
> > > > > > > > >     b911bef132a0 nilfs2: fix WARNING in mark_buffer_dirty=
 due to discarded buffer reuse
> > > > > > > > >     1c6ddf739f15 nilfs2: fix general protection fault in =
nilfs_lookup_dirty_data_buffers()
> > > > > > > > >     f6e61aef5c5d tcpm: Avoid soft reset when partner does=
 not support get_status
> > > > > > > > >     da0e7d435e31 fsi: master-ast-cf: Add MODULE_FIRMWARE =
macro
> > > > > > > > >     72eca651d732 firmware: stratix10-svc: Fix an NULL vs =
IS_ERR() bug in probe
> > > > > > > > >     907216337bea serial: sc16is7xx: fix bug when first se=
tting GPIO direction
> > > > > > > > >     45d9611ebff2 serial: sc16is7xx: fix broken port 0 uar=
t init
> > > > > > > > >     f90e267dd27e serial: qcom-geni: fix opp vote on shutd=
own
> > > > > > > > >     46d13013b574 wifi: mt76: mt7921: do not support one s=
tream on secondary antenna only
> > > > > > > > >     a5c2a467e9e7 Bluetooth: btsdio: fix use after free bu=
g in btsdio_remove due to race condition
> > > > > > > > >     f49294ad6898 staging: rtl8712: fix race condition
> > > > > > > > >     d17cec60e87c HID: wacom: remove the battery when the =
EKR is off
> > > > > > > > >     842c7da3eee2 usb: chipidea: imx: improve logic if sam=
sung,picophy-* parameter is 0
> > > > > > > > >     276a906f81a7 usb: dwc3: meson-g12a: do post init to f=
ix broken usb after resumption
> > > > > > > > >     60f938e84fbb ALSA: usb-audio: Fix init call orders fo=
r UAC1
> > > > > > > > >     e949dd2a9b6b USB: serial: option: add FOXCONN T99W368=
/T99W373 product
> > > > > > > > >     c41411d8b333 USB: serial: option: add Quectel EM05G v=
ariant (0x030e)
> > > > > > > > >     09baa839d415 modules: only allow symbol_get of EXPORT=
_SYMBOL_GPL modules
> > > > > > > > >     997a194914c4 rtc: ds1685: use EXPORT_SYMBOL_GPL for d=
s1685_rtc_poweroff
> > > > > > > > >     3d0f6408601b net: enetc: use EXPORT_SYMBOL_GPL for en=
etc_phc_index
> > > > > > > > >     da95090821c4 mmc: au1xmmc: force non-modular build an=
d remove symbol_get usage
> > > > > > > > >     e3e68100c036 ARM: pxa: remove use of symbol_get()
> > > > > > > > >     bb5bf157b5be ksmbd: replace one-element array with fl=
ex-array member in struct smb2_ea_info
> > > > > > > > >     2e3f57f74c0a ksmbd: fix wrong DataOffset validation o=
f create context
> > > > > > > > >     b3ad7f39fd85 erofs: ensure that the post-EOF tails ar=
e all zeroed
> > > > > > > > >     8f790700c974 Linux 5.15.130
> > > > > > > > >     69347c334071 rcu-tasks: Add trc_inspect_reader() chec=
ks for exiting critical section
> > > > > > > > >     8046fb611f70 rcu-tasks: Wait for trc_read_check_handl=
er() IPIs
> > > > > > > > >     da22db901cc1 rcu-tasks: Fix IPI failure handling in t=
rc_wait_for_one_reader
> > > > > > > > >     a0249d365ac8 rcu: Prevent expedited GP from enabling =
tick on offline CPU
> > > > > > > > >     7aec063d6029 ARM: module: Use module_init_layout_sect=
ion() to spot init sections
> > > > > > > > >     4a8976052acd arm64: module: Use module_init_layout_se=
ction() to spot init sections
> > > > > > > > >     f8a74159d116 arm64: module-plts: inline linux/modulel=
oader.h
> > > > > > > > >     363bbb5008e5 module: Expose module_init_layout_sectio=
n()
> > > > > > > > >     758e3d0cb753 ACPI: thermal: Drop nocrt parameter
> > > > > > > > >     9e43368a3393 Linux 5.15.129
> > > > > > > > >     d48016d74836 mm,ima,kexec,of: use memblock_free_late =
from ima_free_kexec_buffer
> > > > > > > > >     1c41cd30d5cd mm: memory-failure: fix unexpected retur=
n value in soft_offline_page()
> > > > > > > > >     0712721e4f4f mm: memory-failure: kill soft_offline_fr=
ee_page()
> > > > > > > > >     efd02b5cadd5 dma-buf/sw_sync: Avoid recursive lock du=
ring fence signal
> > > > > > > > >     8dbf913520c4 pinctrl: renesas: rza2: Add lock around =
pinctrl_generic{{add,remove}_group,{add,remove}_function}
> > > > > > > > >     f1c0402b8e22 clk: Fix undefined reference to `clk_rat=
e_exclusive_{get,put}'
> > > > > > > > >     10bc3eddc605 scsi: core: raid_class: Remove raid_comp=
onent_add()
> > > > > > > > >     d3d57cdbfda4 scsi: snic: Fix double free in snic_tgt_=
create()
> > > > > > > > >     ef56cc8889be can: raw: add missing refcount for memor=
y leak fix
> > > > > > > > >     930f3f164964 drm/i915: Fix premature release of reque=
st's reusable memory
> > > > > > > > >     3cb86cc565df cgroup/cpuset: Free DL BW in case can_at=
tach() fails
> > > > > > > > >     ffff4fc4bad7 sched/deadline: Create DL BW alloc, free=
 & check overflow interface
> > > > > > > > >     86aa90795979 cgroup/cpuset: Iterate only if DEADLINE =
tasks are present
> > > > > > > > >     43d8cbfefa7c sched/cpuset: Keep track of SCHED_DEADLI=
NE task in cpusets
> > > > > > > > >     d0eb4917f4d3 sched/cpuset: Bring back cpuset_mutex
> > > > > > > > >     918879de0e23 cgroup/cpuset: Rename functions dealing =
with DEADLINE accounting
> > > > > > > > >     78efab71a649 torture: Fix hang during kthread shutdow=
n phase
> > > > > > > > >     c8fb97dd7fe6 nfsd: use vfs setgid helper
> > > > > > > > >     01966511868e nfs: use vfs setgid helper
> > > > > > > > >     a7a1849899aa x86/fpu: Set X86_FEATURE_OSXSAVE feature=
 after enabling OSXSAVE in CR4
> > > > > > > > >     ad79f943c869 x86/fpu: Invalidate FPU state correctly =
on exec()
> > > > > > > > >     b190cf1f277a drm/display/dp: Fix the DP DSC Receiver =
cap size
> > > > > > > > >     c8aab333d41a drm/vmwgfx: Fix shader stage validation
> > > > > > > > >     b53ed415163e PCI: acpiphp: Use pci_assign_unassigned_=
bridge_resources() only for non-root bus
> > > > > > > > >     60ba1bfa036a media: vcodec: Fix potential array out-o=
f-bounds in encoder queue_setup
> > > > > > > > >     544cd10defa1 of: dynamic: Refactor action prints to n=
ot use "%pOF" inside devtree_lock
> > > > > > > > >     f1d4a5881856 of: unittest: Fix EXPECT for parse_phand=
le_with_args_map() test
> > > > > > > > >     ce66cd478636 radix tree: remove unused variable
> > > > > > > > >     898c8c5b1114 lib/clz_ctz.c: Fix __clzdi2() and __ctzd=
i2() for 32-bit kernels
> > > > > > > > >     ff90a4c6edf8 batman-adv: Hold rtnl lock during MTU up=
date via netlink
> > > > > > > > >     ea38c0d9aaa2 batman-adv: Fix batadv_v_ogm_aggr_send m=
emory leak
> > > > > > > > >     7f3f72eb8f5b batman-adv: Fix TT global entry leak whe=
n client roamed back
> > > > > > > > >     f7667b49880a batman-adv: Do not get eth header before=
 batadv_check_management_packet
> > > > > > > > >     3f9312dd7581 batman-adv: Don't increase MTU when set =
by user
> > > > > > > > >     cde5a240d72d batman-adv: Trigger events for auto adju=
sted MTU
> > > > > > > > >     22426e1ce679 selinux: set next pointer before attachi=
ng to list
> > > > > > > > >     711595bfdccf nfsd: Fix race to FREE_STATEID and cl_re=
voked
> > > > > > > > >     bd1697e12230 NFS: Fix a use after free in nfs_direct_=
join_group()
> > > > > > > > >     5f642613746e mm: add a call to flush_cache_vmap() in =
vmap_pfn()
> > > > > > > > >     440c10034b4d ALSA: ymfpci: Fix the missing snd_card_f=
ree() call at probe error
> > > > > > > > >     5cc7d81cf576 clk: Fix slab-out-of-bounds error in dev=
m_clk_release()
> > > > > > > > >     0f72859acfa2 NFSv4: Fix dropped lock for racing OPEN =
and delegation return
> > > > > > > > >     9c025420fef2 ibmveth: Use dcbf rather than dcbfl
> > > > > > > > >     7e546bd08943 Revert "KVM: x86: enable TDP MMU by defa=
ult"
> > > > > > > > >     67af12f5582b net/ncsi: change from ndo_set_mac_addres=
s to dev_set_mac_address
> > > > > > > > >     4451457d61e0 net/ncsi: make one oem_gma function for =
all mfr id
> > > > > > > > >     f683f4be802b bonding: fix macvlan over alb bond suppo=
rt
> > > > > > > > >     0fa8046e923a net: remove bond_slave_has_mac_rcu()
> > > > > > > > >     f0ec97fca629 rtnetlink: Reject negative ifindexes in =
RTM_NEWLINK
> > > > > > > > >     00247cfd2b69 rtnetlink: return ENODEV when ifname doe=
s not exist and group is given
> > > > > > > > >     75cfb7de44e5 netfilter: nf_tables: fix out of memory =
error handling
> > > > > > > > >     f22954f8c58f netfilter: nf_tables: flush pending dest=
roy work before netlink notifier
> > > > > > > > >     ff34403fef98 net/sched: fix a qdisc modification with=
 ambiguous command request
> > > > > > > > >     30624ea3f8b6 igc: Fix the typo in the PTM Control mac=
ro
> > > > > > > > >     f697c3ead109 igb: Avoid starting unnecessary workqueu=
es
> > > > > > > > >     d7823d752ce1 ice: fix receive buffer size miscalculat=
ion
> > > > > > > > >     ace1b0ae3097 net: validate veth and vxcan peer ifinde=
xes
> > > > > > > > >     335be585416d net: bcmgenet: Fix return value check fo=
r fixed_phy_register()
> > > > > > > > >     60a5034584ea net: bgmac: Fix return value check for f=
ixed_phy_register()
> > > > > > > > >     5b52c9ba42c0 ipvlan: Fix a reference count leak warni=
ng in ipvlan_ns_exit()
> > > > > > > > >     2bad37b6f675 dccp: annotate data-races in dccp_poll()
> > > > > > > > >     9b015360e86f sock: annotate data-races around prot->m=
emory_pressure
> > > > > > > > >     c52c6c0223e1 octeontx2-af: SDP: fix receive link conf=
ig
> > > > > > > > >     ce6e2b14bc09 tracing: Fix memleak due to race between=
 current_tracer and trace
> > > > > > > > >     ef748360ba91 tracing: Fix cpu buffers unavailable due=
 to 'record_disabled' missed
> > > > > > > > >     fdf5804d7475 can: raw: fix lockdep issue in raw_relea=
se()
> > > > > > > > >     278fccf587dd drm/amd/display: check TG is non-null be=
fore checking if enabled
> > > > > > > > >     a955e6a0e39d drm/amd/display: do not wait for mpc idl=
e if tg is disabled
> > > > > > > > >     e0bd4f0c60b4 can: raw: fix receiver memory leak
> > > > > > > > >     b832174b7f89 jbd2: fix a race when checking checkpoin=
t buffer busy
> > > > > > > > >     9c31bb2684f8 jbd2: remove journal_clean_one_cp_list()
> > > > > > > > >     d91783e6864a jbd2: remove t_checkpoint_io_list
> > > > > > > > >     a0ab49e7a758 ALSA: pcm: Fix potential data race at PC=
M memory allocation helpers
> > > > > > > > >     2e56d380daa9 fbdev: fix potential OOB read in fast_im=
ageblit()
> > > > > > > > >     14163f4a4fa6 fbdev: Fix sys_imageblit() for arbitrary=
 image widths
> > > > > > > > >     5b60bd9081a9 fbdev: Improve performance of sys_imageb=
lit()
> > > > > > > > >     166f0bf4560b MIPS: cpu-features: Use boot_cpu_type fo=
r CPU type based features
> > > > > > > > >     8f106e97409d MIPS: cpu-features: Enable octeon_cache =
by cpu_type
> > > > > > > > >     d1d0b239f974 fs: dlm: fix mismatch of plock results f=
rom userspace
> > > > > > > > >     77d334c44681 fs: dlm: use dlm_plock_info for do_unloc=
k_close
> > > > > > > > >     f9a33cc7d946 fs: dlm: change plock interrupted messag=
e to debug again
> > > > > > > > >     7ac088841ffb fs: dlm: add pid to debug log
> > > > > > > > >     df9c842ab0a4 dlm: replace usage of found with dedicat=
ed list iterator variable
> > > > > > > > >     33e9c610e337 dlm: improve plock logging if interrupte=
d
> > > > > > > > >     d9ce077f8b1f PCI: acpiphp: Reassign resources on brid=
ge if necessary
> > > > > > > > >     8cc8645dd3e1 xprtrdma: Remap Receive buffers after a =
reconnect
> > > > > > > > >     91a707507e83 NFSv4: fix out path in __nfs4_get_acl_un=
cached
> > > > > > > > >     323b830eebd1 NFSv4.2: fix error handling in nfs42_pro=
c_getxattr
> > > > > > > > >     5de0a325c45e objtool/x86: Fix SRSO mess
> > > > > > > > >     5ddfe5cc8716 Linux 5.15.128
> > > > > > > > >     9080f4fcc202 x86/srso: Correct the mitigation status =
when SMT is disabled
> > > > > > > > >     484eefc6ff9c objtool/x86: Fixup frame-pointer vs reth=
unk
> > > > > > > > >     55f1cbeaa159 x86/retpoline,kprobes: Fix position of t=
hunk sections with CONFIG_LTO_CLANG
> > > > > > > > >     fa24cd0fbcb7 x86/srso: Disable the mitigation on unaf=
fected configurations
> > > > > > > > >     aa0777ce0d3d x86/CPU/AMD: Fix the DIV(0) initial fix =
attempt
> > > > > > > > >     bbe585239d4f x86/retpoline: Don't clobber RFLAGS duri=
ng srso_safe_ret()
> > > > > > > > >     19f23d16b0e0 x86/static_call: Fix __static_call_fixup=
()
> > > > > > > > >     df6495f203a7 x86/srso: Explain the untraining sequenc=
es a bit more
> > > > > > > > >     43548590ad7e x86/cpu: Cleanup the untrain mess
> > > > > > > > >     035e906bfc93 x86/cpu: Rename srso_(.*)_alias to srso_=
alias_\1
> > > > > > > > >     19c1c0499650 x86/cpu: Rename original retbleed method=
s
> > > > > > > > >     f77dbb90962b x86/cpu: Clean up SRSO return thunk mess
> > > > > > > > >     f624ce6c7fc2 x86/ibt: Add ANNOTATE_NOENDBR
> > > > > > > > >     f1171d455d94 objtool: Add frame-pointer-specific func=
tion ignore
> > > > > > > > >     08f7cfd44f77 x86/alternative: Make custom return thun=
k unconditional
> > > > > > > > >     0d810eff090c x86/cpu: Fix up srso_safe_ret() and __x8=
6_return_thunk()
> > > > > > > > >     8089aae6020e x86/cpu: Fix __x86_return_thunk symbol t=
ype
> > > > > > > > >     5b28fda5fdee mmc: f-sdh30: fix order of function call=
s in sdhci_f_sdh30_remove
> > > > > > > > >     e8c5081da2cc net: fix the RTO timer retransmitting sk=
b every 1ms if linear option is enabled
> > > > > > > > >     431db3f48c28 virtio-net: set queues after driver_ok
> > > > > > > > >     d39fc9b94dc0 af_unix: Fix null-ptr-deref in unix_stre=
am_sendpage().
> > > > > > > > >     9a4d8dc706c2 arm64: dts: rockchip: Disable HS400 for =
eMMC on ROCK Pi 4
> > > > > > > > >     6b64974e02ea exfat: check if filename entries exceeds=
 max filename length
> > > > > > > > >     6065b3017107 netfilter: set default timeout to 3 secs=
 for sctp shutdown send and recv state
> > > > > > > > >     a00c5d2c208b drm/amd: flush any delayed gfxoff on sus=
pend entry
> > > > > > > > >     d578c919deb7 drm/qxl: fix UAF on handle creation
> > > > > > > > >     ff09f9e671ff mmc: block: Fix in_flight[issue_type] va=
lue error
> > > > > > > > >     b803fedb6e50 mmc: wbsd: fix double mmc_free_host() in=
 wbsd_init()
> > > > > > > > >     961f7ce16223 cifs: Release folio lock on fscache read=
 hit.
> > > > > > > > >     cc3f194f46e7 ALSA: usb-audio: Add support for Mythwar=
e XA001AU capture and playback interfaces.
> > > > > > > > >     18e27df4f2b4 serial: 8250: Fix oops for port->pm on u=
art_change_pm()
> > > > > > > > >     e9b8ee715dbc riscv: uaccess: Return the number of byt=
es effectively not copied
> > > > > > > > >     b2a331abcb03 ALSA: hda/realtek - Remodified 3k pull l=
ow procedure
> > > > > > > > >     dfb9676ed25b soc: aspeed: socinfo: Add kfree for kstr=
dup
> > > > > > > > >     c5ac7522a8db ASoC: meson: axg-tdm-formatter: fix chan=
nel slot allocation
> > > > > > > > >     fd346ef1cd2d ASoC: rt5665: add missed regulator_bulk_=
disable
> > > > > > > > >     e878458d820c ARM: dts: imx: Set default tuning step f=
or imx6sx usdhc
> > > > > > > > >     430c29a54e4a arm64: dts: qcom: qrb5165-rb5: fix therm=
al zone conflict
> > > > > > > > >     03522d73a498 bus: ti-sysc: Flush posted write on enab=
le before reset
> > > > > > > > >     578371ce0d7f net: do not allow gso_size to be set to =
GSO_BY_FRAGS
> > > > > > > > >     5fc4fd3f3eb8 sock: Fix misuse of sk_under_memory_pres=
sure()
> > > > > > > > >     fc3d82d295d1 net: dsa: mv88e6xxx: Wait for EEPROM don=
e before HW reset
> > > > > > > > >     f11c2802e143 i40e: fix misleading debug logs
> > > > > > > > >     5ba2b936f3e1 iavf: fix FDIR rule fields masks validat=
ion
> > > > > > > > >     ae6834689fd6 team: Fix incorrect deletion of ETH_P_80=
21AD protocol vid from slaves
> > > > > > > > >     0ffbc341cfae net: phy: broadcom: stub c45 read/write =
for 54810
> > > > > > > > >     bf221e5e4b19 netfilter: nft_dynset: disallow object m=
aps
> > > > > > > > >     9177869b85dd ipvs: fix racy memcpy in proc_do_sync_th=
reshold
> > > > > > > > >     1adaec4758d1 netfilter: nf_tables: deactivate catchal=
l elements in next generation
> > > > > > > > >     82109740d610 netfilter: nf_tables: fix false-positive=
 lockdep splat
> > > > > > > > >     b2f6d73395cb drm/panel: simple: Fix AUO G121EAN01 pan=
el timings according to the docs
> > > > > > > > >     7207ee323afa selftests: mirror_gre_changes: Tighten u=
p the TTL test match
> > > > > > > > >     c2a6ffe3f1a3 net: phy: fix IRQ-based wake-on-lan over=
 hibernate / power off
> > > > > > > > >     8e5e967348ca xfrm: add forgotten nla_policy for XFRMA=
_MTIMER_THRESH
> > > > > > > > >     075448a2eb75 xfrm: add NULL check in xfrm_update_ae_p=
arams
> > > > > > > > >     e1e04cc2ef2c ip_vti: fix potential slab-use-after-fre=
e in decode_session6
> > > > > > > > >     a1639a82ce14 ip6_vti: fix slab-use-after-free in deco=
de_session6
> > > > > > > > >     44b3d4096700 xfrm: fix slab-use-after-free in decode_=
session6
> > > > > > > > >     a465ace883ac net: xfrm: Amend XFRMA_SEC_CTX nla_polic=
y structure
> > > > > > > > >     fed1cd2cd3aa net: af_key: fix sadb_x_filter validatio=
n
> > > > > > > > >     1960f468078b net: xfrm: Fix xfrm_address_filter OOB r=
ead
> > > > > > > > >     080dedb1cad8 i2c: designware: Handle invalid SMBus bl=
ock data response length value
> > > > > > > > >     416c538684bd i2c: designware: Correct length byte val=
idation logic
> > > > > > > > >     b966e9e1e250 btrfs: fix BUG_ON condition in btrfs_can=
cel_balance
> > > > > > > > >     77698e6ff6f0 tty: serial: fsl_lpuart: Clear the error=
 flags by writing 1 for lpuart32 platforms
> > > > > > > > >     2a5234464383 tty: n_gsm: fix the UAF caused by race c=
ondition in gsm_cleanup_mux
> > > > > > > > >     8ef25fb13494 powerpc/rtas_flash: allow user copy to f=
lash block cache objects
> > > > > > > > >     bb70e2b70f8d fbdev: mmp: fix value check in mmphw_pro=
be()
> > > > > > > > >     184f1b68bb99 i2c: hisi: Only handle the interrupt of =
the driver's transfer
> > > > > > > > >     c4e671dae50e i2c: bcm-iproc: Fix bcm_iproc_i2c_isr de=
adlock issue
> > > > > > > > >     b99f490ea87e cifs: fix potential oops in cifs_oplock_=
break
> > > > > > > > >     a5ae5a81bc19 vduse: Use proper spinlock for IRQ injec=
tion
> > > > > > > > >     5b7d5c2dd664 virtio-mmio: don't break lifecycle of vm=
_dev
> > > > > > > > >     edf3b5aadb25 btrfs: move out now unused BG from the r=
eclaim list
> > > > > > > > >     170773563ef6 ARM: dts: nxp/imx6sll: fix wrong propert=
y name in usbphy node
> > > > > > > > >     4ffbfe1c980f ARM: dts: imx6sll: fixup of operating po=
ints
> > > > > > > > >     e2ff5cf681a8 mmc: sunxi: fix deferred probing
> > > > > > > > >     f93e8c5a7bd9 mmc: bcm2835: fix deferred probing
> > > > > > > > >     4eeba5d476fe USB: dwc3: fix use-after-free on core dr=
iver unbind
> > > > > > > > >     a78fe5c9d8d5 USB: dwc3: qcom: fix NULL-deref on suspe=
nd
> > > > > > > > >     8a6b7534020d tty: serial: fsl_lpuart: reduce RX water=
mark to 0 on LS1028A
> > > > > > > > >     701bb5fee7c3 tty: serial: fsl_lpuart: make rx_waterma=
rk configurable for different platforms
> > > > > > > > >     fa254ab7d02d tty: serial: fsl_lpuart: Add i.MXRT1050 =
support
> > > > > > > > >     20351ddb1f41 usb: dwc3: gadget: Improve dwc3_gadget_s=
uspend() and dwc3_gadget_resume()
> > > > > > > > >     31a0e60fe16b USB: dwc3: gadget: drop dead hibernation=
 code
> > > > > > > > >     d9e004104e45 usb: dwc3: Fix typos in gadget.c
> > > > > > > > >     2fa487a94667 usb: dwc3: Remove DWC3 locking during ga=
dget suspend/resume
> > > > > > > > >     7dfb384e76ee usb: dwc3: gadget: Synchronize IRQ betwe=
en soft connect/disconnect
> > > > > > > > >     d3c82f24ee69 drm/amd/display: fix access hdcp_workque=
ue assert
> > > > > > > > >     0ba6c7ba081e drm/amd/display: phase3 mst hdcp for mul=
tiple displays
> > > > > > > > >     99c444d3c3c4 drm/amd/display: save restore hdcp state=
 when display is unplugged from mst hub
> > > > > > > > >     4f1beb75f652 ARM: dts: aspeed: asrock: Correct firmwa=
re flash SPI clocks
> > > > > > > > >     f84c2ca3490c igc: read before write to SRRCTL registe=
r
> > > > > > > > >     9fa82f031af8 iio: addac: stx104: Fix race condition w=
hen converting analog-to-digital
> > > > > > > > >     d31d04ec404c iio: addac: stx104: Fix race condition f=
or stx104_write_raw()
> > > > > > > > >     89a007f3a383 iio: stx104: Move to addac subdirectory
> > > > > > > > >     cadf8f2d7c9d iio: adc: stx104: Implement and utilize =
register structures
> > > > > > > > >     6089d354346f iio: adc: stx104: Utilize iomap interfac=
e
> > > > > > > > >     565b96d9a7ab iio: add addac subdirectory
> > > > > > > > >     49b830d75f03 ring-buffer: Do not swap cpu_buffer duri=
ng resize process
> > > > > > > > >     6657ecbcc39c powerpc/kasan: Disable KCOV in KASAN cod=
e
> > > > > > > > >     8703b26387e1 ALSA: hda: fix a possible null-pointer d=
ereference due to data race in snd_hdac_regmap_sync()
> > > > > > > > >     5ed4dbc13726 ALSA: hda/realtek: Add quirks for Unis H=
3C Desktop B760 & Q760
> > > > > > > > >     c7d8b5f46f06 fs/ntfs3: Mark ntfs dirty when on-disk s=
truct is corrupted
> > > > > > > > >     3a00ec562f8c fs: ntfs3: Fix possible null-pointer der=
eferences in mi_read()
> > > > > > > > >     e7799bb4dbe2 fs/ntfs3: Enhance sanity check while gen=
erating attr_list
> > > > > > > > >     ef568da1fd84 drm/amdgpu: Fix potential fence use-afte=
r-free v2
> > > > > > > > >     5720c7e185d4 Bluetooth: btusb: Add MT7922 bluetooth I=
D for the Asus Ally
> > > > > > > > >     548a6b64b3c0 Bluetooth: L2CAP: Fix use-after-free
> > > > > > > > >     302d04596364 watchdog: sp5100_tco: support Hygon FCH/=
SCH (Server Controller Hub)
> > > > > > > > >     2ea70379e4f4 firewire: net: fix use after free in fwn=
et_finish_incoming_packet()
> > > > > > > > >     97fd1c8e9c5a pcmcia: rsrc_nonstatic: Fix memory leak =
in nonstatic_release_resource_db()
> > > > > > > > >     85e888150075 gfs2: Fix possible data races in gfs2_sh=
ow_options()
> > > > > > > > >     eafb79d2448a usb: chipidea: imx: add missing USB PHY =
DPDM wakeup setting
> > > > > > > > >     7bdb4c963049 usb: chipidea: imx: don't request QoS fo=
r imx8ulp
> > > > > > > > >     25decbbb66e4 thunderbolt: Read retimer NVM authentica=
tion status prior tb_retimer_set_inbound_sbtx()
> > > > > > > > >     776b34615a29 media: platform: mediatek: vpu: fix NULL=
 ptr dereference
> > > > > > > > >     cb174344bf85 usb: gadget: u_serial: Avoid spinlock re=
cursion in __gs_console_push
> > > > > > > > >     1676748aa290 media: v4l2-mem2mem: add lock to protect=
 parameter num_rdy
> > > > > > > > >     985086704267 smb: client: fix warning in cifs_smb3_do=
_mount()
> > > > > > > > >     a3f252436e57 ovl: check type and offset of struct vfs=
mount in ovl_entry
> > > > > > > > >     1a650d3ccd79 RDMA/mlx5: Return the firmware result up=
on destroying QP/RQ
> > > > > > > > >     9631d88503ab HID: add quirk for 03f0:464a HP Elite Pr=
esenter Mouse
> > > > > > > > >     4921792e04f2 drm/amdgpu: install stub fence into pote=
ntial unused fence pointers
> > > > > > > > >     fd41646d4350 HID: logitech-hidpp: Add USB and Bluetoo=
th IDs for the Logitech G915 TKL Keyboard
> > > > > > > > >     ff10cd3e9b3a dma-remap: use kvmalloc_array/kvfree for=
 larger dma memory remap
> > > > > > > > >     e9ce774052ee ASoC: SOF: Intel: fix SoundWire/HDaudio =
mutual exclusion
> > > > > > > > >     7d53d1e4765c iopoll: Call cpu_relax() in busy loops
> > > > > > > > >     ca66e9dd98ef ARM: dts: imx6dl: prtrvt, prtvt7, prti6q=
, prtwd2: fix USB related warnings
> > > > > > > > >     cc1590830859 PCI: tegra194: Fix possible array out of=
 bounds access
> > > > > > > > >     e2d10f1de1fa net: tls: avoid discarding data on recor=
d close
> > > > > > > > >     9a15ca893909 net/tls: Multi-threaded calls to TX tls_=
dev_del
> > > > > > > > >     2d93157b7e2d net/tls: Perform immediate device ctx cl=
eanup when possible
> > > > > > > > >     51222e1c77a1 macsec: use DEV_STATS_INC()
> > > > > > > > >     3d64a232e4d9 macsec: Fix traffic counters/statistics
> > > > > > > > >     396a1921406a selftests: forwarding: tc_actions: Use n=
cat instead of nc
> > > > > > > > >     d61a0886d336 selftests: forwarding: tc_actions: clean=
up temporary files when test is aborted
> > > > > > > > >     a798977df6d0 mmc: sdhci-f-sdh30: Replace with sdhci_p=
ltfm
> > > > > > > > >     f6f7927ac664 Linux 5.15.127
> > > > > > > > >     c597d8cb0d33 timers/nohz: Last resort update jiffies =
on nohz_full IRQ entry
> > > > > > > > >     b4d36e6c5dc4 timers/nohz: Switch to ONESHOT_STOPPED i=
n the low-res handler when the tick is stopped
> > > > > > > > >     c3b954a51b64 tick: Detect and fix jiffies update stal=
l
> > > > > > > > >     af99918f0e39 sch_netem: fix issues in netem_change() =
vs get_dist_table()
> > > > > > > > >     5d094d4e7b99 alpha: remove __init annotation from exp=
orted page_is_ram()
> > > > > > > > >     f8d6d25756ea scsi: qedf: Fix firmware halt over suspe=
nd and resume
> > > > > > > > >     85db1cd1744e scsi: qedi: Fix firmware halt over suspe=
nd and resume
> > > > > > > > >     e70469c28953 scsi: fnic: Replace return codes in fnic=
_clean_pending_aborts()
> > > > > > > > >     6bc7f4c8c27d scsi: core: Fix possible memory leak if =
device_add() fails
> > > > > > > > >     461f8ac666fa scsi: snic: Fix possible memory leak if =
device_add() fails
> > > > > > > > >     171e117cdc0a scsi: 53c700: Check that command slot is=
 not NULL
> > > > > > > > >     7a792b3d888a scsi: storvsc: Fix handling of virtual F=
ibre Channel timeouts
> > > > > > > > >     0f52d7b78251 scsi: core: Fix legacy /proc parsing buf=
fer overflow
> > > > > > > > >     b757ef99df39 netfilter: nf_tables: report use refcoun=
t overflow
> > > > > > > > >     9bdbbcf9d148 nvme-rdma: fix potential unbalanced free=
ze & unfreeze
> > > > > > > > >     d68f8ef6ef70 nvme-tcp: fix potential unbalanced freez=
e & unfreeze
> > > > > > > > >     ae6e21f8bb2a btrfs: set cache_block_group_error if we=
 find an error
> > > > > > > > >     314135b7bae9 btrfs: reject invalid reloc tree root ke=
ys with stack dump
> > > > > > > > >     69dd147de419 btrfs: exit gracefully if reloc roots do=
n't match
> > > > > > > > >     c40d4b60c58d btrfs: don't stop integrity writeback to=
o early
> > > > > > > > >     555e126dd30b ibmvnic: Handle DMA unmapping of login b=
uffs in release functions
> > > > > > > > >     34fcc823823a ibmvnic: Unmap DMA login rsp buffer on s=
end login fail
> > > > > > > > >     cee62753cf2e ibmvnic: Enforce stronger sanity checks =
on login response
> > > > > > > > >     27e8db8380eb net/mlx5: Skip clock update work when de=
vice is in error state
> > > > > > > > >     f638fc2f7377 net/mlx5: Allow 0 for total host VFs
> > > > > > > > >     086a80eb6213 dmaengine: mcf-edma: Fix a potential un-=
allocated memory access
> > > > > > > > >     7e1dc94b2d50 nexthop: Fix infinite nexthop bucket dum=
p when using maximum nexthop ID
> > > > > > > > >     608a4327c257 nexthop: Make nexthop bucket dump more e=
fficient
> > > > > > > > >     4457300cfd84 nexthop: Fix infinite nexthop dump when =
using maximum nexthop ID
> > > > > > > > >     91307347d632 net: hns3: add wait until mac link down
> > > > > > > > >     094310eb2b93 net: hns3: refactor hclge_mac_link_statu=
s_wait for interface reuse
> > > > > > > > >     1ae9703c2e32 net: phy: at803x: remove set/get wol cal=
lbacks for AR8032
> > > > > > > > >     7d496cd83a9d RDMA/umem: Set iova in ODP flow
> > > > > > > > >     f78a4238a873 wifi: cfg80211: fix sband iftype data lo=
okup for AP_VLAN
> > > > > > > > >     26a27dd76054 drm/rockchip: Don't spam logs in atomic =
check
> > > > > > > > >     918c1e6843b7 IB/hfi1: Fix possible panic during hotpl=
ug remove
> > > > > > > > >     df21468bfdc8 iavf: fix potential races for FDIR filte=
rs
> > > > > > > > >     b1f985cf1c52 drivers: net: prevent tun_build_skb() to=
 exceed the packet size limit
> > > > > > > > >     f239c9e1d98b dccp: fix data-race around dp->dccps_mss=
_cache
> > > > > > > > >     49a1fee22fae bonding: Fix incorrect deletion of ETH_P=
_8021AD protocol vid from slaves
> > > > > > > > >     789fcd94c9ca xsk: fix refcount underflow in error pat=
h
> > > > > > > > >     e95808121953 tunnels: fix kasan splat when generating=
 ipv4 pmtu error
> > > > > > > > >     7903311b2cec net/packet: annotate data-races around t=
p->status
> > > > > > > > >     f4614e379bf9 mISDN: Update parameter type of dsp_cmx_=
send()
> > > > > > > > >     3961761af392 bpf, sockmap: Fix bug that strp_done can=
not be called
> > > > > > > > >     20d53895d5c0 bpf, sockmap: Fix map type error in sock=
_map_del_link
> > > > > > > > >     a09c258cfa77 net: core: remove unnecessary frame_sz c=
heck in bpf_xdp_adjust_tail()
> > > > > > > > >     85af0b226c0b selftests: forwarding: tc_flower: Relax =
success criterion
> > > > > > > > >     7b3fa99526f9 selftests: forwarding: Switch off timeou=
t
> > > > > > > > >     e410f85ebca9 selftests: forwarding: Skip test when no=
 interfaces are specified
> > > > > > > > >     4a4499452620 selftests: forwarding: ethtool_extended_=
state: Skip when using veth pairs
> > > > > > > > >     b8d216e9c607 selftests: forwarding: ethtool: Skip whe=
n using veth pairs
> > > > > > > > >     b9dfb80d9fb2 selftests: forwarding: Add a helper to s=
kip test when using veth pairs
> > > > > > > > >     b973eb76dff3 selftests/rseq: Fix build with undefined=
 __weak
> > > > > > > > >     b8b8db5857d4 drm/nouveau/disp: Revert a NULL check in=
side nouveau_connector_get_modes
> > > > > > > > >     4c6767c8bf5e x86: Move gds_ucode_mitigated() declarat=
ion to header
> > > > > > > > >     f919cbc90441 x86/speculation: Add cpu_show_gds() prot=
otype
> > > > > > > > >     9290ef14c96b x86/mm: Fix VDSO and VVAR placement on 5=
-level paging machines
> > > > > > > > >     829409510d00 x86/cpu/amd: Enable Zenbleed fix for AMD=
 Custom APU 0405
> > > > > > > > >     c41a22b93d7c x86/srso: Fix build breakage with the LL=
VM linker
> > > > > > > > >     c2372b1559d4 usb: typec: tcpm: Fix response to vsafe0=
V event
> > > > > > > > >     f776b94ccdf0 usb: common: usb-conn-gpio: Prevent bail=
ing out if initial role is none
> > > > > > > > >     00cc14b52d6f usb: dwc3: Properly handle processing of=
 pending events
> > > > > > > > >     7a11d1e2625b usb-storage: alauda: Fix uninit-value in=
 alauda_check_media()
> > > > > > > > >     945e1b3c361b misc: rtsx: judge ASPM Mode to set PETXC=
FG Reg
> > > > > > > > >     03eebad96233 binder: fix memory leak in binder_init()
> > > > > > > > >     a8e2ae6296d5 iio: adc: ina2xx: avoid NULL pointer der=
eference on OF device match
> > > > > > > > >     2df8ae1e42b8 iio: cros_ec: Fix the allocation size fo=
r cros_ec_command
> > > > > > > > >     a7cedc2b7612 io_uring: correct check for O_TMPFILE
> > > > > > > > >     697bc234632c selftests/bpf: Fix sk_assign on s390x
> > > > > > > > >     127277262110 selftests/bpf: Workaround verification f=
ailure for fexit_bpf2bpf/func_replace_return_code
> > > > > > > > >     ee701208f4cc selftests/bpf: make test_align selftest =
more robust
> > > > > > > > >     683d2969a082 bpf: aggressively forget precise marking=
s during state checkpointing
> > > > > > > > >     2516deeb872a bpf: stop setting precise in current sta=
te
> > > > > > > > >     c47d0178ad86 bpf: allow precision tracking for progra=
ms with subprogs
> > > > > > > > >     3645510cf926 nilfs2: fix use-after-free of nilfs_root=
 in dirtying inodes via iput
> > > > > > > > >     36a3b560c78d radix tree test suite: fix incorrect all=
ocation size for pthreads
> > > > > > > > >     8d10284243b7 hwmon: (pmbus/bel-pfe) Enable PMBUS_SKIP=
_STATUS_CHECK for pfe1100
> > > > > > > > >     3ad4ba2b6112 drm/amd/display: check attr flag before =
set cursor degamma on DCN3+
> > > > > > > > >     621204fca047 drm/shmem-helper: Reset vma->vm_ops befo=
re calling dma_buf_mmap()
> > > > > > > > >     64e6253f6489 drm/nouveau/gr: enable memory loads on h=
elper invocation on all channels
> > > > > > > > >     bcd9eeb3a309 riscv,mmio: Fix readX()-to-delay() order=
ing
> > > > > > > > >     57772ae9b339 dmaengine: pl330: Return DMA_PAUSED when=
 transaction is paused
> > > > > > > > >     3ca8f5c733c4 ipv6: adjust ndisc_is_useropt() to also =
return true for PIO
> > > > > > > > >     6cde60777675 mmc: moxart: read scr register without c=
hanging byte order
> > > > > > > > >     3f00757ab416 wireguard: allowedips: expand maximum no=
de depth
> > > > > > > > >     aeb974907642 ksmbd: fix wrong next length validation =
of ea buffer in smb2_set_ea()
> > > > > > > > >     595679098bdc ksmbd: validate command request size
> > > > > > > > >     24c4de4069cb Linux 5.15.126
> > > > > > > > >     aeb4db8ab7f1 PM: sleep: wakeirq: fix wake irq arming
> > > > > > > > >     b5d3a4251bd2 PM / wakeirq: support enabling wake-up i=
rq after runtime_suspend called
> > > > > > > > >     a36b522767f3 soundwire: fix enumeration completion
> > > > > > > > >     7996facaf0ee soundwire: bus: pm_runtime_request_resum=
e on peripheral attachment
> > > > > > > > >     c91c07ae0849 selftests/rseq: Play nice with binaries =
statically linked against glibc 2.35+
> > > > > > > > >     1cdb50faf7f7 selftests/rseq: check if libc rseq suppo=
rt is registered
> > > > > > > > >     0f1f471b91f4 drm/imx/ipuv3: Fix front porch adjustmen=
t upon hactive aligning
> > > > > > > > >     5058c1444040 powerpc/mm/altmap: Fix altmap boundary c=
heck
> > > > > > > > >     eb7a5e4d14c8 mtd: rawnand: fsl_upm: Fix an off-by one=
 test in fun_exec_op()
> > > > > > > > >     70643e98cbc3 mtd: rawnand: rockchip: Align hwecc vs. =
raw page helper layouts
> > > > > > > > >     1796b492f8cc mtd: rawnand: rockchip: fix oobfree offs=
et and description
> > > > > > > > >     f6807b62fb0e mtd: rawnand: omap_elm: Fix incorrect ty=
pe in assignment
> > > > > > > > >     596be6716bc5 ext2: Drop fragment support
> > > > > > > > >     0ccfe21949bc fs: Protect reconfiguration of sb read-w=
rite from racing writes
> > > > > > > > >     27d0f755d649 net: usbnet: Fix WARNING in usbnet_start=
_xmit/usb_submit_urb
> > > > > > > > >     fbe5a2fed815 Bluetooth: L2CAP: Fix use-after-free in =
l2cap_sock_ready_cb
> > > > > > > > >     afd9a31b5aa4 fs/sysv: Null check to prevent null-ptr-=
deref bug
> > > > > > > > >     80ec112c1996 fs/ntfs3: Use __GFP_NOWARN allocation at=
 ntfs_load_attr_list()
> > > > > > > > >     0d6f639f1dcd file: reinstate f_pos locking optimizati=
on for regular files
> > > > > > > > >     b44d28b98f18 bpf, cpumap: Make sure kthread is runnin=
g before map update returns
> > > > > > > > >     8089eb93d678 drm/ttm: check null pointer before acces=
sing when swapping
> > > > > > > > >     ef0d07c66843 open: make RESOLVE_CACHED correctly test=
 for O_TMPFILE
> > > > > > > > >     c81bdf8f9f2b bpf: Disable preemption in bpf_event_out=
put
> > > > > > > > >     ae07cfe2b099 rbd: prevent busy loop when requesting e=
xclusive lock
> > > > > > > > >     7978bcca4c1f wifi: mt76: mt7615: do not advertise 5 G=
Hz on first phy of MT7615D (DBDC)
> > > > > > > > >     32ca6a55e10e net: tap_open(): set sk_uid from current=
_fsuid()
> > > > > > > > >     4ed3eed99ee6 net: tun_chr_open(): set sk_uid from cur=
rent_fsuid()
> > > > > > > > >     adacc3a954fa arm64: dts: stratix10: fix incorrect I2C=
 property for SCL signal
> > > > > > > > >     b92c88009da1 mtd: rawnand: meson: fix OOB available b=
ytes for ECC
> > > > > > > > >     b0875c583e41 mtd: spinand: toshiba: Fix ecc_get_statu=
s
> > > > > > > > >     1c33ca1e1974 exfat: release s_lock before calling dir=
_emit()
> > > > > > > > >     8a34a242cf03 exfat: use kvmalloc_array/kvfree instead=
 of kmalloc_array/kfree
> > > > > > > > >     a74878207b02 x86/CPU/AMD: Do not leak quotient data a=
fter a division by 0
> > > > > > > > >     b8f029fc4075 firmware: arm_scmi: Drop OF node referen=
ce in the transport channel setup
> > > > > > > > >     287c2c8677ed ceph: defer stopping mdsc delayed_work
> > > > > > > > >     98b521d10e73 USB: zaurus: Add ID for A-300/B-500/C-70=
0
> > > > > > > > >     cd6872f2cf56 libceph: fix potential hang in ceph_osdc=
_notify()
> > > > > > > > >     e5f5b4a89809 scsi: storvsc: Limit max_sectors for vir=
tual Fibre Channel devices
> > > > > > > > >     212a9a3c67be scsi: zfcp: Defer fc_rport blocking unti=
l after ADISC response
> > > > > > > > >     dac382725394 tcp_metrics: fix data-race in tcpm_suck_=
dst() vs fastopen
> > > > > > > > >     4517782e1bc3 tcp_metrics: annotate data-races around =
tm->tcpm_net
> > > > > > > > >     e842a68667d4 tcp_metrics: annotate data-races around =
tm->tcpm_vals[]
> > > > > > > > >     d3184bea4ace tcp_metrics: annotate data-races around =
tm->tcpm_lock
> > > > > > > > >     9a7367cbe33d tcp_metrics: annotate data-races around =
tm->tcpm_stamp
> > > > > > > > >     6f6bd67f4894 tcp_metrics: fix addr_same() helper
> > > > > > > > >     b0acbcf1e7a1 prestera: fix fallback to previous versi=
on on same major version
> > > > > > > > >     d6d9d0f5a5e0 net/mlx5: fs_core: Skip the FTs in the s=
ame FS_TYPE_PRIO_CHAINS fs_prio
> > > > > > > > >     c999fb1039dd net/mlx5: fs_core: Make find_closest_ft =
more generic
> > > > > > > > >     32ef2c0c6cf1 vxlan: Fix nexthop hash size
> > > > > > > > >     1bb54a21f4d9 ip6mr: Fix skb_under_panic in ip6mr_cach=
e_report()
> > > > > > > > >     64e3affee288 s390/qeth: Don't call dev_close/dev_open=
 (DOWN/UP)
> > > > > > > > >     a0da2684db18 net: dcb: choose correct policy to parse=
 DCB_ATTR_BCN
> > > > > > > > >     193333229aac net: netsec: Ignore 'phy-mode' on SynQua=
cer in DT mode
> > > > > > > > >     766c9dd00c5f net: korina: handle clk prepare error in=
 korina_probe()
> > > > > > > > >     6cecfdf65053 net: ll_temac: fix error checking of irq=
_of_parse_and_map()
> > > > > > > > >     3761ff4f8670 net: ll_temac: Switch to use dev_err_pro=
be() helper
> > > > > > > > >     5c534640a7da bpf: sockmap: Remove preempt_disable in =
sock_map_sk_acquire
> > > > > > > > >     79c3d81c9ad1 net/sched: cls_route: No longer copy tcf=
_result on update to avoid use-after-free
> > > > > > > > >     9edf7955025a net/sched: cls_fw: No longer copy tcf_re=
sult on update to avoid use-after-free
> > > > > > > > >     262430dfc618 net/sched: cls_u32: No longer copy tcf_r=
esult on update to avoid use-after-free
> > > > > > > > >     b58d34068fd9 bpf, cpumap: Handle skb as well when cle=
an up ptr_ring
> > > > > > > > >     f04f6d9b3b06 net/sched: taprio: Limit TCA_TAPRIO_ATTR=
_SCHED_CYCLE_TIME to INT_MAX.
> > > > > > > > >     2c55d4941518 net: add missing data-race annotation fo=
r sk_ll_usec
> > > > > > > > >     e934c50c48e2 net: add missing data-race annotations a=
round sk->sk_peek_off
> > > > > > > > >     fdd8d8d54d6a net: add missing READ_ONCE(sk->sk_rcvbuf=
) annotation
> > > > > > > > >     98f0d1db3a27 net: add missing READ_ONCE(sk->sk_sndbuf=
) annotation
> > > > > > > > >     0d1047b77b23 net: add missing READ_ONCE(sk->sk_rcvlow=
at) annotation
> > > > > > > > >     6c058a1f67f0 net: annotate data-races around sk->sk_m=
ax_pacing_rate
> > > > > > > > >     2950c5ac65b3 qed: Fix scheduling in a tasklet while g=
etting stats
> > > > > > > > >     a19952dbb5b6 qed: Fix kernel-doc warnings
> > > > > > > > >     6d8c259f4827 mISDN: hfcpci: Fix potential deadlock on=
 &hc->lock
> > > > > > > > >     8dedcc6af341 net: sched: cls_u32: Fix match key mis-a=
ddressing
> > > > > > > > >     675d29de69c7 perf test uprobe_from_different_cu: Skip=
 if there is no gcc
> > > > > > > > >     0f6e3d8d7f91 net: dsa: fix value check in bcm_sf2_sw_=
probe()
> > > > > > > > >     047508edd602 rtnetlink: let rtnl_bridge_setlink check=
s IFLA_BRIDGE_MODE length
> > > > > > > > >     cc9ebceaa6d0 bpf: Add length check for SK_DIAG_BPF_ST=
ORAGE_REQ_MAP_FD parsing
> > > > > > > > >     8f9a04c742e1 net/mlx5e: fix return value check in mlx=
5e_ipsec_remove_trailer()
> > > > > > > > >     00cecb0a8f9e net/mlx5: DR, fix memory leak in mlx5dr_=
cmd_create_reformat_ctx
> > > > > > > > >     4c224ea31bed wifi: cfg80211: Fix return value in scan=
 logic
> > > > > > > > >     8e72db3ffa5d KVM: s390: fix sthyi error handling
> > > > > > > > >     809edb4262f0 word-at-a-time: use the same return type=
 for has_zero regardless of endianness
> > > > > > > > >     b7880809d75d arm64: dts: imx8mn-var-som: add missing =
pull-up for onboard PHY reset pinmux
> > > > > > > > >     804e72062be4 iommu/arm-smmu-v3: Document nesting-rela=
ted errata
> > > > > > > > >     744e6b80b830 iommu/arm-smmu-v3: Add explicit feature =
for nesting
> > > > > > > > >     fd86b5944215 iommu/arm-smmu-v3: Document MMU-700 erra=
tum 2812531
> > > > > > > > >     2de9f3dcfe63 iommu/arm-smmu-v3: Work around MMU-600 e=
rratum 1076982
> > > > > > > > >     a850fa85d477 arm64: errata: Add detection for TRBE wr=
ite to out-of-range
> > > > > > > > >     073699df4a09 arm64: errata: Add workaround for TSB fl=
ush failures
> > > > > > > > >     44b45e8161a5 net/mlx5: Free irqs only on shutdown cal=
lback
> > > > > > > > >     40601542c43c perf: Fix function pointer case
> > > > > > > > >     c12fa4ac8997 io_uring: gate iowait schedule on having=
 pending requests
> > > > > > > > >     c275eaaaa342 Linux 5.15.125
> > > > > > > > >     754e0c7c4a30 x86: fix backwards merge of GDS/SRSO bit
> > > > > > > > >     b14a3924c267 xen/netback: Fix buffer overrun triggere=
d by unusual packet
> > > > > > > > >     153f9a7b02d4 x86/srso: Tie SBPB bit setting to microc=
ode patch detection
> > > > > > > > >     df4c3823cba5 x86/srso: Fix return thunks in generated=
 code
> > > > > > > > >     0071b17eb66b x86/srso: Add IBPB on VMEXIT
> > > > > > > > >     5398faac76a6 x86/srso: Add IBPB
> > > > > > > > >     c24aaa7dde5f x86/srso: Add SRSO_NO support
> > > > > > > > >     4e9115e194a8 x86/srso: Add IBPB_BRTYPE support
> > > > > > > > >     b35087763a44 x86/srso: Add a Speculative RAS Overflow=
 mitigation
> > > > > > > > >     c3b4c644525e x86/cpu, kvm: Add support for CPUID_8000=
0021_EAX
> > > > > > > > >     236dd7133394 x86/bugs: Increase the x86 bugs vector s=
ize to two u32s
> > > > > > > > >     0242a8bdef56 Documentation/x86: Fix backwards on/off =
logic about YMM support
> > > > > > > > >     27a72e350869 x86/mm: Initialize text poking earlier
> > > > > > > > >     d0317b9502ea mm: Move mm_cachep initialization to mm_=
init()
> > > > > > > > >     8e4c2530879d x86/mm: Use mm_alloc() in poking_init()
> > > > > > > > >     13ec5cb4c113 x86/mm: fix poking_init() for Xen PV gue=
sts
> > > > > > > > >     3e90080d5665 x86/xen: Fix secondary processors' FPU i=
nitialization
> > > > > > > > >     348741a9e4d3 KVM: Add GDS_NO support to KVM
> > > > > > > > >     59d78655f808 x86/speculation: Add Kconfig option for =
GDS
> > > > > > > > >     0cc5643b63ae x86/speculation: Add force option to GDS=
 mitigation
> > > > > > > > >     348a89e20184 x86/speculation: Add Gather Data Samplin=
g mitigation
> > > > > > > > >     a094d3b30967 x86/fpu: Move FPU initialization into ar=
ch_cpu_finalize_init()
> > > > > > > > >     59f2739111ca x86/fpu: Mark init functions __init
> > > > > > > > >     bb9c20d903f6 x86/fpu: Remove cpuinfo argument from in=
it functions
> > > > > > > > >     de8b7ce4c533 x86/init: Initialize signal frame size l=
ate
> > > > > > > > >     041d929233bb init, x86: Move mem_encrypt_init() into =
arch_cpu_finalize_init()
> > > > > > > > >     8ae795ed6115 init: Invoke arch_cpu_finalize_init() ea=
rlier
> > > > > > > > >     7e270cebaffd init: Remove check_bugs() leftovers
> > > > > > > > >     285384ac24c3 um/cpu: Switch to arch_cpu_finalize_init=
()
> > > > > > > > >     6ea421786426 sparc/cpu: Switch to arch_cpu_finalize_i=
nit()
> > > > > > > > >     21a1fc8d13d8 sh/cpu: Switch to arch_cpu_finalize_init=
()
> > > > > > > > >     dfeb371a2707 mips/cpu: Switch to arch_cpu_finalize_in=
it()
> > > > > > > > >     4baf46a3ba00 m68k/cpu: Switch to arch_cpu_finalize_in=
it()
> > > > > > > > >     8c8165cd25cf ia64/cpu: Switch to arch_cpu_finalize_in=
it()
> > > > > > > > >     de8c592cc5a1 ARM: cpu: Switch to arch_cpu_finalize_in=
it()
> > > > > > > > >     75da6209d3ba x86/cpu: Switch to arch_cpu_finalize_ini=
t()
> > > > > > > > >     0774fc2177c3 init: Provide arch_cpu_finalize_init()
> > > > > > > > >
> > > > > > > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > > > > ---
> > > > > > > > >  .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
> > > > > > > > >  .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
> > > > > > > > >  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++=
++++----------
> > > > > > > > >  3 files changed, 19 insertions(+), 19 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.1=
5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > > > > > > > > index 6ac3118f81..f7286759a9 100644
> > > > > > > > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > > > > > > > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > > > > > > > > @@ -11,13 +11,13 @@ python () {
> > > > > > > > >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDE=
R_virtual/kernel to linux-yocto-rt to enable it")
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > -SRCREV_machine ?=3D "0ac91942af8fec31671ffe62e9518aaf15f=
110b3"
> > > > > > > > > -SRCREV_meta ?=3D "f484a7f175b4f3c4f7d2b553cde232bd41f757=
d8"
> > > > > > > > > +SRCREV_machine ?=3D "423b5d5cb3f45a272285fa4157d1964086f=
abc2e"
> > > > > > > > > +SRCREV_meta ?=3D "92bd0a656f0f9db955fb53c52be71cce9296bd=
b2"
> > > > > > > > >
> > > > > > > > >  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;=
branch=3D${KBRANCH};name=3Dmachine \
> > > > > > > > >             git://git.yoctoproject.org/yocto-kernel-cache=
;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA}"
> > > > > > > > >
> > > > > > > > > -LINUX_VERSION ?=3D "5.15.124"
> > > > > > > > > +LINUX_VERSION ?=3D "5.15.141"
> > > > > > > > >
> > > > > > > > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a=
7fc9398086aedcd7e46"
> > > > > > > > >
> > > > > > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5=
.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > > > > > > > > index 9c06ddf200..7461087299 100644
> > > > > > > > > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > > > > > > > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > > > > > > > > @@ -5,7 +5,7 @@ KCONFIG_MODE =3D "--allnoconfig"
> > > > > > > > >
> > > > > > > > >  require recipes-kernel/linux/linux-yocto.inc
> > > > > > > > >
> > > > > > > > > -LINUX_VERSION ?=3D "5.15.124"
> > > > > > > > > +LINUX_VERSION ?=3D "5.15.141"
> > > > > > > > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a=
7fc9398086aedcd7e46"
> > > > > > > > >
> > > > > > > > >  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfut=
ils-native', '', d)}"
> > > > > > > > > @@ -14,8 +14,8 @@ DEPENDS +=3D "openssl-native util-linux=
-native"
> > > > > > > > >  KMETA =3D "kernel-meta"
> > > > > > > > >  KCONF_BSP_AUDIT_LEVEL =3D "2"
> > > > > > > > >
> > > > > > > > > -SRCREV_machine ?=3D "cdb289c798fe1fc9f259a08c32e2dd9516c=
cb7a4"
> > > > > > > > > -SRCREV_meta ?=3D "f484a7f175b4f3c4f7d2b553cde232bd41f757=
d8"
> > > > > > > > > +SRCREV_machine ?=3D "ddf2eeeb31d1edaa5a80e9aabc8b2674ae9=
5f865"
> > > > > > > > > +SRCREV_meta ?=3D "92bd0a656f0f9db955fb53c52be71cce9296bd=
b2"
> > > > > > > > >
> > > > > > > > >  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> > > > > > > > >
> > > > > > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.b=
b b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > > > > > > > > index 439479022b..c7b07dee62 100644
> > > > > > > > > --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > > > > > > > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > > > > > > > > @@ -14,24 +14,24 @@ KBRANCH:qemux86  ?=3D "v5.15/standard=
/base"
> > > > > > > > >  KBRANCH:qemux86-64 ?=3D "v5.15/standard/base"
> > > > > > > > >  KBRANCH:qemumips64 ?=3D "v5.15/standard/mti-malta64"
> > > > > > > > >
> > > > > > > > > -SRCREV_machine:qemuarm ?=3D "676a22c65ec0f8bb5dc7e13d130=
f6e3764959d75"
> > > > > > > > > -SRCREV_machine:qemuarm64 ?=3D "f0e7afd5948f71be062cd9194=
b56cd03de94b7cb"
> > > > > > > > > -SRCREV_machine:qemumips ?=3D "0f1ceb9008f182cd7f21420bbe=
c6f21a67da8397"
> > > > > > > > > -SRCREV_machine:qemuppc ?=3D "4ec9fc13283ce01627ef8c32617=
a1eb71e127c62"
> > > > > > > > > -SRCREV_machine:qemuriscv64 ?=3D "1c09be01f4b87f60ea64136=
459167d73502a118f"
> > > > > > > > > -SRCREV_machine:qemuriscv32 ?=3D "1c09be01f4b87f60ea64136=
459167d73502a118f"
> > > > > > > > > -SRCREV_machine:qemux86 ?=3D "1c09be01f4b87f60ea641364591=
67d73502a118f"
> > > > > > > > > -SRCREV_machine:qemux86-64 ?=3D "1c09be01f4b87f60ea641364=
59167d73502a118f"
> > > > > > > > > -SRCREV_machine:qemumips64 ?=3D "fad09cc6acf2175aa6b5979e=
f48cd5f05afc3da0"
> > > > > > > > > -SRCREV_machine ?=3D "1c09be01f4b87f60ea64136459167d73502=
a118f"
> > > > > > > > > -SRCREV_meta ?=3D "f484a7f175b4f3c4f7d2b553cde232bd41f757=
d8"
> > > > > > > > > +SRCREV_machine:qemuarm ?=3D "0bd882ff2a47566033965928ab4=
68491f7e1ffd6"
> > > > > > > > > +SRCREV_machine:qemuarm64 ?=3D "d353330a9ba30300be32f1d73=
2723ae3678da684"
> > > > > > > > > +SRCREV_machine:qemumips ?=3D "7f8fbffda634dc22a70f69ff2b=
762a1f3ff9c842"
> > > > > > > > > +SRCREV_machine:qemuppc ?=3D "fb2191ca96824c7451fbca4eef1=
29660d25711af"
> > > > > > > > > +SRCREV_machine:qemuriscv64 ?=3D "54a3472506956ed41289ae4=
23ca9b7ad4cbb3ab5"
> > > > > > > > > +SRCREV_machine:qemuriscv32 ?=3D "54a3472506956ed41289ae4=
23ca9b7ad4cbb3ab5"
> > > > > > > > > +SRCREV_machine:qemux86 ?=3D "54a3472506956ed41289ae423ca=
9b7ad4cbb3ab5"
> > > > > > > > > +SRCREV_machine:qemux86-64 ?=3D "54a3472506956ed41289ae42=
3ca9b7ad4cbb3ab5"
> > > > > > > > > +SRCREV_machine:qemumips64 ?=3D "35895af6b529915f9c09a720=
592554feaca9a2c7"
> > > > > > > > > +SRCREV_machine ?=3D "54a3472506956ed41289ae423ca9b7ad4cb=
b3ab5"
> > > > > > > > > +SRCREV_meta ?=3D "92bd0a656f0f9db955fb53c52be71cce9296bd=
b2"
> > > > > > > > >
> > > > > > > > >  # set your preferred provider of linux-yocto to 'linux-y=
octo-upstream', and you'll
> > > > > > > > >  # get the <version>/base branch, which is pure upstream =
-stable, and the same
> > > > > > > > >  # meta SRCREV as the linux-yocto-standard builds. Select=
 your version using the
> > > > > > > > >  # normal PREFERRED_VERSION settings.
> > > > > > > > >  BBCLASSEXTEND =3D "devupstream:target"
> > > > > > > > > -SRCREV_machine:class-devupstream ?=3D "38d4ca22a5288c4ba=
e7e6d62a1728b0718d51866"
> > > > > > > > > +SRCREV_machine:class-devupstream ?=3D "9b91d36ba301db86b=
bf9e783169f7f6abf2585d8"
> > > > > > > > >  PN:class-devupstream =3D "linux-yocto-upstream"
> > > > > > > > >  KBRANCH:class-devupstream =3D "v5.15/base"
> > > > > > > > >
> > > > > > > > > @@ -39,7 +39,7 @@ SRC_URI =3D "git://git.yoctoproject.org=
/linux-yocto.git;name=3Dmachine;branch=3D${KBRA
> > > > > > > > >             git://git.yoctoproject.org/yocto-kernel-cache=
;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA}"
> > > > > > > > >
> > > > > > > > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a=
7fc9398086aedcd7e46"
> > > > > > > > > -LINUX_VERSION ?=3D "5.15.124"
> > > > > > > > > +LINUX_VERSION ?=3D "5.15.141"
> > > > > > > > >
> > > > > > > > >  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfut=
ils-native', '', d)}"
> > > > > > > > >  DEPENDS +=3D "openssl-native util-linux-native"
> > > > > > > > > --
> > > > > > > > > 2.39.2
> > > > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > >
> > > > > >
> > > > > > --
> > > > > > - Thou shalt not follow the NULL pointer, for chaos and madness=
 await
> > > > > > thee at its end
> > > > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > > >
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196793): https://lists.openembedded.org/g/openembedde=
d-core/message/196793
> Mute This Topic: https://lists.openembedded.org/mt/102986495/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

