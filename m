Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75AAC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 15:37:40 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.26282.1709825852534257061
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 07:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P24L93gk;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e5eb3dd2f8so768249b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 07:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709825852; x=1710430652; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYW30AI2i9npMUxdVKsK5XmVH1IclS63lQ0ha9dBvuY=;
        b=P24L93gkztr/N+ZAwVNmTD/lFaKCicZiMzEOBh/u9pvG4yr5NLdGzJ6JWe2epnKxju
         NZPGKdyZiWemTYLGvfGnQxK2AFDeea6+bd17Pmqbvwyy83+A3LXK8VK9+WOlEcta2sRO
         AOxFnneEmHYlxm475LV83N/ZdSy8ZkwsojKuQFNY11fiGuIlwxt0e5zoBJHGPrdqzz+3
         oK0irHbFIrAsr3sGRHIFZ70RY4XuM27p4i00Uc5mks6/peBb2qO+/fDgQ6b6YLN67yOL
         qAasRvKiCIlC7j0uZjTK9Yfw8kg+jnlZoA8HHk25UnEyQXjM/FbPqURqgz0jvEJ+1o/h
         whHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709825852; x=1710430652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYW30AI2i9npMUxdVKsK5XmVH1IclS63lQ0ha9dBvuY=;
        b=odie4ab93ooc3eiq4l0sx7AoYwKjyqqeG9T9Q9LJi/80cXnW047lDwG7C79MVtdN2m
         NhFSqIPTc5eMUf9/K4pnOZqeCQPF1vcc4Yj+xVT3fbDLn2YN5xrI/O46DY58Pyaikhju
         LtvAvvMCciDC3uiI837y447iO8T9+Fuu9HzVzI+ofE56l0MPbOh1J+bXtBpLfOLx8EzS
         VCuQP7VGRz5OzmSgdDhAnwaFNtllryQDenQ9p+8J7ZxvvZ/1scIN/Do/Y3u3LtO2ds16
         HL+K7srinMHxhDkKU1hJ+lcLFBLDhWip/UEC4+xpS8CGbpM/C184xa4649Wy8nhapUe9
         4AnA==
X-Gm-Message-State: AOJu0YyyIA28OXcOX2Y9W4IkdaWChXXPZPd+6QhMQCZydMz5a5N3BYfD
	fmSTLPxBgv3kRyEm/ZCV0SpNqz1WS44CBrI7FaExPIobv/GKVY0PqNmhxEHY1DqorCp3YAAkNn8
	hzHg32uLSkDwcpNLlfa3T/kVIWTctMn67
X-Google-Smtp-Source: AGHT+IFSJ54aZaLuFwf1uHG/djD8WiEMJyq/D9fi0ykzImW8mOtrOCYapAni5EhOv7gKisKHl9bHWOIIGkc25tC876g=
X-Received: by 2002:a05:6a00:22c4:b0:6e4:e7dc:25a4 with SMTP id
 f4-20020a056a0022c400b006e4e7dc25a4mr24152236pfj.23.1709825851359; Thu, 07
 Mar 2024 07:37:31 -0800 (PST)
MIME-Version: 1.0
References: <20231205044036.4163615-1-bruce.ashfield@gmail.com>
 <20231205044036.4163615-5-bruce.ashfield@gmail.com> <CAOSpxdZU+CoRTo=Xz+C3dk44ubHLSa7pis7sa4CyVMGJnY1_EA@mail.gmail.com>
 <CAOSpxdYcFTMY-m9TDB-wAVXu70v5DkmGfH8UjH2dLKDY-x0AbA@mail.gmail.com>
 <CADkTA4NhG1AciK=QkaYiajfXfuqc1YQ9=qJBssoKSQh4GOMcvQ@mail.gmail.com>
 <17BA3874E3FB1D6A.21429@lists.openembedded.org> <CAOSpxdYFR72uWeix5mKTJY5R-bewDQO0jMh5obByiz0h7WgDyw@mail.gmail.com>
 <CADkTA4O-F7qr2GU1cK_zd7zD9LpCKm-RrMRgkRjY6F2ZOemn5g@mail.gmail.com>
 <17BA7F82CF20F029.10210@lists.openembedded.org> <CAOSpxdYLfPpsop4C7c6DYE5bbbTh6LovcKZ5YuSb7ph6jwyA+g@mail.gmail.com>
 <CADkTA4PYyJL3Yt-NkHejT9049NVA0BnMBTS1CDe+PjyeB6znbw@mail.gmail.com>
 <17BA821ADCF2B959.10210@lists.openembedded.org> <CAOSpxdZUiGRYtsuVmTHyz1BPOdtyamW+sqCDG5PDFv+0xxRKMA@mail.gmail.com>
In-Reply-To: <CAOSpxdZUiGRYtsuVmTHyz1BPOdtyamW+sqCDG5PDFv+0xxRKMA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 7 Mar 2024 10:37:19 -0500
Message-ID: <CADkTA4OkrjLmpLPHBk8FOXjQfeF5VNr9Whh3BYCK65ZMJ+QgPA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 4/4] linux-yocto/5.15: update to v5.15.141
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196800

On Thu, Mar 7, 2024 at 9:51=E2=80=AFAM Steve Sakoman <steve@sakoman.com> wr=
ote:
>
> On Thu, Mar 7, 2024 at 4:34=E2=80=AFAM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
> >
> >
> >
> > On Thu, Mar 7, 2024, 4:29=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gma=
il.com> wrote:
> >>
> >> On Thu, Mar 7, 2024 at 9:00=E2=80=AFAM Steve Sakoman <steve@sakoman.co=
m> wrote:
> >> >
> >> > On Thu, Mar 7, 2024 at 3:46=E2=80=AFAM Steve Sakoman via
> >> > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> >> > wrote:
> >> > >
> >> > > On Wed, Mar 6, 2024 at 7:42=E2=80=AFAM Bruce Ashfield <bruce.ashfi=
eld@gmail.com> wrote:
> >> > > >
> >> > > > On Wed, Mar 6, 2024 at 12:38=E2=80=AFPM Steve Sakoman <steve@sak=
oman.com> wrote:
> >> > > > >
> >> > > > >
> >> > > > >
> >> > > > > On Wed, Mar 6, 2024 at 6:04=E2=80=AFAM Steve Sakoman via lists=
.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org> wrote:
> >> > > > > >
> >> > > > > > On Wed, Mar 6, 2024 at 5:59=E2=80=AFAM Bruce Ashfield <bruce=
.ashfield@gmail.com> wrote:
> >> > > > > > >
> >> > > > > > > On Wed, Mar 6, 2024 at 10:43=E2=80=AFAM Steve Sakoman <ste=
ve@sakoman.com> wrote:
> >> > > > > > > >
> >> > > > > > > > On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM Steve Sakoman <st=
eve@sakoman.com> wrote:
> >> > > > > > > > >
> >> > > > > > > > > Hi Bruce,
> >> > > > > > > > >
> >> > > > > > > > > The 5.10 version bumps look fine in testing, but sadly=
 this 5.15
> >> > > > > > > > > version bump breaks qemux86-64-ptest:
> >> > > > > > > > >
> >> > > > > > > > > AssertionError: Failed ptests:
> >> > > > > > > > > {'parted': ['t1104-remove-and-add-partition.sh',
> >> > > > > > > > >             't8000-loop.sh',
> >> > > > > > > > >             't8001-loop-blkpg.sh']}
> >> > > > > > > > >
> >> > > > > > > > > Failure is reproducible 100% of the time, so there is =
that ...
> >> > > > > > > >
> >> > > > > > > > After  wading through the hundreds of changes in this ve=
rsion bump
> >> > > > > > > > from 5.15.124 to 5.15.141 I found this in the 5.13.132 p=
ortion that
> >> > > > > > > > looks suspicious:
> >> > > > > > > >
> >> > > > > > > > 072cd213c64f block: don't add or resize partition on the=
 disk with
> >> > > > > > > > GENHD_FL_NO_PART
> >> > > > > > > > c6ce1c5dd327 block: rename GENHD_FL_NO_PART_SCAN to GENH=
D_FL_NO_PART
> >> > > > > > > >
> >> > > > > > >
> >> > > > > > > It could very well be that, I haven't been able to get to =
any local
> >> > > > > > > testing on this
> >> > > > > > > yet.
> >> > > > > > >
> >> > > > > > > I will go look at parted for commits that indicate they ar=
e fixing a
> >> > > > > > > kernel interface
> >> > > > > > > that sounds similar .. since we don't want to revert an of=
fending commit, the
> >> > > > > > > way to fix this is via selective update of parted.
> >> > > > > >
> >> > > > > > I'm doing a test kirkstone build that bumps parted to the sa=
me version
> >> > > > > > as in master.
> >> > > > > >
> >> > > > > > This will at least let us know whether it has been fixed in =
upstream parted.
> >> > > > >
> >> > > > > The test completed and I get the same failure with the most re=
cent parted version.
> >> > > > >
> >> > > > > So apparently not fixed in parted.
> >> > > >
> >> > > > Which means that the newer kernels have some sort of additional =
fix or a revert.
> >> > > >
> >> > > > I'll have a look for that as well.
> >> > >
> >> > > From looking at how Ubuntu deals with this
> >> > > (https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2056143):
> >> > >
> >> > > -- Impact --
> >> > > In 22.04/Jammy with the GA 5.15 kernel there was an upstream chang=
e
> >> > > preventing partition table operations when GENHD_FL_NO_PART is set=
.
> >> > >  1a721de8489f "block: don't add or resize partition on the disk wi=
th
> >> > > GENHD_FL_NO_PART"
> >> > > Beside of changing return codes and breaking some user-space that =
way
> >> > > this also causes loop block devices to no longer be able to have
> >> > > partitions manually created. This is because the loop block driver
> >> > > uses GENHD_FL_NO_PART to prevent active partition scans.
> >> > >
> >> > > -- Fix --
> >> > > This was changed in 5.19 (and thus Mantic is not affected) by
> >> > > introducing a separate flag to prevent those scans:
> >> > >  b9684a71fca7 "block, loop: support partitions without scanning"
> >> > > The fix depends on a larger rewrite so it cannot be simply picked.=
 The
> >> > > biggest change from the original is moving the check for the new f=
lag
> >> > > into a helper function in genhd.h which checks whether a disk shou=
ld
> >> > > be scanned for partitions. That function was dropped with the upst=
ream
> >> > > rewrite and checking moved into the loop driver directly. But it f=
elt
> >> > > like adjusting the helper was the better approach.
> >> > >
> >> > > Note: The upstream patch has a follow-up change submitted:
> >> > >   748008e1da92 "block: don't add partitions if GD_SUPPRESS_PART_SC=
AN is set"
> >> > > We do _NOT_ need that in Jammy/5.15 because block/partitions/core.=
c:
> >> > > blk_add_partitions() checks disk_part_scan_enabled() which was whe=
re
> >> > > we added the check for the backport instead of modifying
> >> > > disk_scan_partitions() directly.
> >> >
> >> > Forgot to add this:
> >> >
> >> > https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/j=
ammy/commit/?h=3Dmaster-next--2024.03.04-1&id=3Dc3032b60ff7b3948325b8f2bd68=
8b9a74be3cfb9
> >> >
> >>
> >> Assuming that I'm reading the summary correctly, I'm inclined to
> >> cherry pick 748008e1da92 [ block: don't add partitions if
> >> GD_SUPPRESS_PART_SCAN is set]
> >> into the linux-yocto 5.15 kernel branches.
> >>
> >> The commit referenced in the link above doesn't cherry-pick cleanly
> >> (it seems tangled
> >> up in other Ubuntu kernel changes), but 748008e1da92 is simple and
> >> does cherry-pick
> >> without any fuss.
> >>
> >> I never did get set up to run the tests myself, but I can send you SRC=
REV bumps
> >> with 748008e1da92 merged into the tree. That's the fastest route to
> >> get it tested.
> >> Alternatively, we wait for me to get a test environment setup or it
> >> could even be a
> >> SRC_URI patch (versus me merging it).
> >>
> >> Worst thing that can happen if I merge it, is that it doesn't fix the
> >> problem and I do
> >> a revert, or just stack more changes on top to fix the problem.
> >>
> >> Let me know your preference, and I'll pull something together.
> >
> >
> >
> > I can try a SRC_URI patch first to see if it solves the issue.
>
> I'm assuming you'll send the SRC_URI patch, let me know if my
> assumption is wrong and you want me to craft it!

I'm pulling that together now, stay tuned!

Bruce

>
> Steve
>
> >> > > > > > > > > On Mon, Dec 4, 2023 at 6:40=E2=80=AFPM <bruce.ashfield=
@gmail.com> wrote:
> >> > > > > > > > > >
> >> > > > > > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >> > > > > > > > > >
> >> > > > > > > > > > Updating  to the latest korg -stable release that co=
mprises
> >> > > > > > > > > > the following commits:
> >> > > > > > > > > >
> >> > > > > > > > > >     9b91d36ba301 Linux 5.15.141
> >> > > > > > > > > >     313a34d1c0ee io_uring: fix off-by one bvec index
> >> > > > > > > > > >     49ae2e4e8ed3 USB: dwc3: qcom: fix wakeup after p=
robe deferral
> >> > > > > > > > > >     eb17fb4b160a USB: dwc3: qcom: fix software node =
leak on probe errors
> >> > > > > > > > > >     98f0e9b6276f usb: dwc3: set the dma max_seg_size
> >> > > > > > > > > >     1a3dcb1d811d usb: dwc3: Fix default mode initial=
ization
> >> > > > > > > > > >     a22702a81844 USB: dwc2: write HCINT with INTMASK=
 applied
> >> > > > > > > > > >     1134fde92088 usb: typec: tcpm: Skip hard reset w=
hen in error recovery
> >> > > > > > > > > >     64830d041515 USB: serial: option: don't claim in=
terface 4 for ZTE MF290
> >> > > > > > > > > >     9611cbc6a132 USB: serial: option: fix FM101R-GL =
defines
> >> > > > > > > > > >     a8d80b1fbacf USB: serial: option: add Fibocom L7=
xx modules
> >> > > > > > > > > >     de8c6fce8d09 usb: cdnsp: Fix deadlock issue duri=
ng using NCM gadget
> >> > > > > > > > > >     dd0cc4b69f7d bcache: fixup lock c->root error
> >> > > > > > > > > >     a912742d8411 bcache: fixup init dirty data error=
s
> >> > > > > > > > > >     137660f84462 bcache: prevent potential division =
by zero error
> >> > > > > > > > > >     f7077ce8d97b bcache: check return value from btr=
ee_node_alloc_replacement()
> >> > > > > > > > > >     1eed01092101 dm-delay: fix a race between delay_=
presuspend and delay_bio
> >> > > > > > > > > >     d181a7a1d55d hv_netvsc: Mark VF as slave before =
exposing it to user-mode
> >> > > > > > > > > >     97683466e24c hv_netvsc: Fix race of register_net=
device_notifier and VF register
> >> > > > > > > > > >     3841921018a2 USB: serial: option: add Luat Air72=
*U series products
> >> > > > > > > > > >     6062c527d040 s390/dasd: protect device queue aga=
inst concurrent access
> >> > > > > > > > > >     35b5d86e43ec io_uring/fs: consider link->flags w=
hen getting path for LINKAT
> >> > > > > > > > > >     2bb75a2c3490 bcache: fixup multi-threaded bch_se=
ctors_dirty_init() wake-up race
> >> > > > > > > > > >     6f09318fd90a md: fix bi_status reporting in md_e=
nd_clone_io
> >> > > > > > > > > >     72ecb9753cbe bcache: replace a mistaken IS_ERR()=
 by IS_ERR_OR_NULL() in btree_gc_coalesce()
> >> > > > > > > > > >     e09ba90f1ad0 swiotlb-xen: provide the "max_mappi=
ng_size" method
> >> > > > > > > > > >     0f05021e937c ACPI: resource: Skip IRQ override o=
n ASUS ExpertBook B1402CVA
> >> > > > > > > > > >     f95e9f7afe86 proc: sysctl: prevent aliased sysct=
ls from getting passed to init
> >> > > > > > > > > >     3f3880fc011c ext4: make sure allocate pending en=
try not fail
> >> > > > > > > > > >     e33eb4997585 ext4: fix slab-use-after-free in ex=
t4_es_insert_extent()
> >> > > > > > > > > >     859893f61906 ext4: using nofail preallocation in=
 ext4_es_insert_extent()
> >> > > > > > > > > >     048e7f38b31c ext4: using nofail preallocation in=
 ext4_es_insert_delayed_block()
> >> > > > > > > > > >     580b9dd6ab0b ext4: using nofail preallocation in=
 ext4_es_remove_extent()
> >> > > > > > > > > >     66bc78a295b3 ext4: use pre-allocated es in __es_=
remove_extent()
> >> > > > > > > > > >     b1995ba6269c ext4: use pre-allocated es in __es_=
insert_extent()
> >> > > > > > > > > >     edec12712ae1 ext4: factor out __es_alloc_extent(=
) and __es_free_extent()
> >> > > > > > > > > >     e82d05cf5ccb ext4: add a new helper to check if =
es must be kept
> >> > > > > > > > > >     612edd488872 media: qcom: camss: Fix csid-gen2 f=
or test pattern generator
> >> > > > > > > > > >     ceb5276d8c99 media: qcom: camss: Fix set CSI2_RX=
_CFG1_VC_MODE when VC is greater than 3
> >> > > > > > > > > >     f001e6f62693 media: camss: sm8250: Virtual chann=
els for CSID
> >> > > > > > > > > >     9fb81ca7aa05 media: camss: Replace hard coded va=
lue with parameter
> >> > > > > > > > > >     8ef9b32f20ab MIPS: KVM: Fix a build warning abou=
t variable set but not used
> >> > > > > > > > > >     6ddaca6b20f7 lockdep: Fix block chain corruption
> >> > > > > > > > > >     61747778a88b USB: dwc3: qcom: fix ACPI platform =
device leak
> >> > > > > > > > > >     027472889970 USB: dwc3: qcom: fix resource leaks=
 on probe deferral
> >> > > > > > > > > >     e26c6febac43 nvmet: nul-terminate the NQNs passe=
d in the connect command
> >> > > > > > > > > >     b5d50c6a609d afs: Fix file locking on R/O volume=
s to operate in local mode
> >> > > > > > > > > >     84ebfbed3ae0 afs: Return ENOENT if no cell DNS r=
ecord can be found
> >> > > > > > > > > >     6aeac88a45de net: axienet: Fix check for partial=
 TX checksum
> >> > > > > > > > > >     293acba84108 amd-xgbe: propagate the correct spe=
ed and duplex status
> >> > > > > > > > > >     b3874cc25a70 amd-xgbe: handle the corner-case du=
ring tx completion
> >> > > > > > > > > >     e949dbc28cd5 amd-xgbe: handle corner-case during=
 sfp hotplug
> >> > > > > > > > > >     01a8b94726b1 octeontx2-pf: Fix ntuple rule creat=
ion to direct packet to VF with higher Rx queue than its PF
> >> > > > > > > > > >     fcc4a03ad3b1 arm/xen: fix xen_vcpu_info allocati=
on alignment
> >> > > > > > > > > >     90072af9efe8 net/smc: avoid data corruption caus=
ed by decline
> >> > > > > > > > > >     66c023469b3e net: usb: ax88179_178a: fix failed =
operations during ax88179_reset
> >> > > > > > > > > >     ba81c5228ef8 ipv4: Correct/silence an endian war=
ning in __ip_do_redirect
> >> > > > > > > > > >     364406d4c114 HID: fix HID device resource race b=
etween HID core and debugging support
> >> > > > > > > > > >     52badc06b119 HID: core: store the unique system =
identifier in hid_device
> >> > > > > > > > > >     221be624a55d drm/rockchip: vop: Fix color for RG=
B888/BGR888 format on VOP full
> >> > > > > > > > > >     b0c835fd7d89 ata: pata_isapnp: Add missing error=
 check for devm_ioport_map()
> >> > > > > > > > > >     9754a498aa5b octeontx2-pf: Fix memory leak durin=
g interface down
> >> > > > > > > > > >     be41c0c4a632 wireguard: use DEV_STATS_INC()
> >> > > > > > > > > >     f163a6d17a95 drm/panel: simple: Fix Innolux G101=
ICE-L01 timings
> >> > > > > > > > > >     608de3a587eb drm/panel: simple: Fix Innolux G101=
ICE-L01 bus flags
> >> > > > > > > > > >     18bd108a13cb drm/panel: auo,b101uan08.3: Fine tu=
ne the panel power sequence
> >> > > > > > > > > >     9fe5718d3f09 drm/panel: boe-tv101wum-nl6: Fine t=
une the panel power sequence
> >> > > > > > > > > >     c8a49336e1de afs: Make error on cell lookup fail=
ure consistent with OpenAFS
> >> > > > > > > > > >     ac239fccf5a5 afs: Fix afs_server_list to be clea=
ned up with RCU
> >> > > > > > > > > >     a78d278e01b1 Linux 5.15.140
> >> > > > > > > > > >     947c9e12ddd6 driver core: Release all resources =
during unbind before updating device links
> >> > > > > > > > > >     5a434d5c3823 Input: xpad - add VID for Turtle Be=
ach controllers
> >> > > > > > > > > >     cbc7c29dff0f tracing: Have trace_event_file have=
 ref counters
> >> > > > > > > > > >     1dcf90c9fa01 powerpc/powernv: Fix fortify source=
 warnings in opal-prd.c
> >> > > > > > > > > >     3d7912710e5e io_uring/fdinfo: lock SQ thread whi=
le retrieving thread cpu/pid
> >> > > > > > > > > >     595b051c83a1 drm/amd/display: Change the DMCUB m=
ailbox memory location from FB to inbox
> >> > > > > > > > > >     a2a6e97c4b33 drm/amdgpu: fix error handling in a=
mdgpu_bo_list_get()
> >> > > > > > > > > >     e380992c479b drm/amdgpu: don't use ATRM for exte=
rnal devices
> >> > > > > > > > > >     4ff985b8810c drm/i915: Fix potential spectre vul=
nerability
> >> > > > > > > > > >     ea0c4d5ec57f drm/amd/pm: Handle non-terminated o=
verdrive commands.
> >> > > > > > > > > >     9ce842d7762a ext4: add missed brelse in update_b=
ackups
> >> > > > > > > > > >     ce19c20064b6 ext4: remove gdb backup copy for me=
ta bg in setup_new_flex_group_blocks
> >> > > > > > > > > >     ac45d8e34bed ext4: correct the start block of co=
unting reserved clusters
> >> > > > > > > > > >     8f9842c4b925 ext4: correct return value of ext4_=
convert_meta_bg
> >> > > > > > > > > >     8798d3b2722d ext4: correct offset of gdb backup =
in non meta_bg group to update_backups
> >> > > > > > > > > >     8a3bb38bfdaf ext4: apply umask if ACL support is=
 disabled
> >> > > > > > > > > >     d5c380149b96 Revert "net: r8169: Disable multica=
st filter for RTL8168H and RTL8107E"
> >> > > > > > > > > >     6ad3d8594d5e media: qcom: camss: Fix missing vfe=
_lite clocks check
> >> > > > > > > > > >     e0376cf06950 media: qcom: camss: Fix VFE-17x vfe=
_disable_output()
> >> > > > > > > > > >     8f733387d17f media: qcom: camss: Fix vfe_get() e=
rror jump
> >> > > > > > > > > >     841fc648fbb5 media: qcom: camss: Fix pm_domain_o=
n sequence in probe
> >> > > > > > > > > >     4c9c43f79a12 mmc: sdhci-pci-gli: GL9750: Mask th=
e replay timer timeout of AER
> >> > > > > > > > > >     72bf271c5a77 r8169: fix network lost after resum=
e on DASH systems
> >> > > > > > > > > >     468e3ebf4786 mm: kmem: drop __GFP_NOFAIL when al=
locating objcg vectors
> >> > > > > > > > > >     0387978fda07 mmc: sdhci-pci-gli: A workaround to=
 allow GL9750 to enter ASPM L1.2
> >> > > > > > > > > >     070b3ccb9b8b riscv: kprobes: allow writing to x0
> >> > > > > > > > > >     cd0e9f475a46 nfsd: fix file memleak on client_op=
ens_release
> >> > > > > > > > > >     114c9d732cf9 media: ccs: Correctly initialise tr=
y compose rectangle
> >> > > > > > > > > >     6c8aeeb2c549 media: venus: hfi: add checks to ha=
ndle capabilities from firmware
> >> > > > > > > > > >     cdeb0a4cf327 media: venus: hfi: fix the check to=
 handle session buffer requirement
> >> > > > > > > > > >     7d62570f75fe media: venus: hfi_parser: Add check=
 to keep the number of codecs within range
> >> > > > > > > > > >     d0d831e7d68d media: sharp: fix sharp encoding
> >> > > > > > > > > >     6003733c8f95 media: lirc: drop trailing space fr=
om scancode transmit
> >> > > > > > > > > >     e4088d7d8f11 f2fs: avoid format-overflow warning
> >> > > > > > > > > >     12055238d046 i2c: i801: fix potential race in i8=
01_block_transaction_byte_by_byte
> >> > > > > > > > > >     336e6db5c120 net: phylink: initialize carrier st=
ate at creation
> >> > > > > > > > > >     d8cb287d31cb net: dsa: lan9303: consequently nes=
ted-lock physical MDIO
> >> > > > > > > > > >     656262cb0f95 net: ethtool: Fix documentation of =
ethtool_sprintf()
> >> > > > > > > > > >     acca20cc16f3 s390/ap: fix AP bus crash on early =
config change callback invocation
> >> > > > > > > > > >     019b7d42a416 i2c: designware: Disable TX_EMPTY i=
rq while waiting for block length byte
> >> > > > > > > > > >     c6e89348fd58 sbsa_gwdt: Calculate timeout with 6=
4-bit math
> >> > > > > > > > > >     132670ae9ffb lsm: fix default return value for i=
node_getsecctx
> >> > > > > > > > > >     223196b50605 lsm: fix default return value for v=
m_enough_memory
> >> > > > > > > > > >     06d320ca170b Revert "i2c: pxa: move to generic G=
PIO recovery"
> >> > > > > > > > > >     ddec3d04f874 Revert ncsi: Propagate carrier gain=
/loss events to the NCSI controller
> >> > > > > > > > > >     ad0b74d0f331 powerpc/pseries/ddw: simplify enabl=
e_ddw()
> >> > > > > > > > > >     b3e993de400e arm64: dts: qcom: ipq6018: Fix tcsr=
_mutex register size
> >> > > > > > > > > >     b99ac20612ca arm64: dts: qcom: ipq6018: switch T=
CSR mutex to MMIO
> >> > > > > > > > > >     aaf0a07d6088 ksmbd: fix slab out of bounds write=
 in smb_inherit_dacl()
> >> > > > > > > > > >     1c701423bb03 Bluetooth: btusb: Add 0bda:b85b for=
 Fn-Link RTL8852BE
> >> > > > > > > > > >     36a573b32550 Bluetooth: btusb: Add RTW8852BE dev=
ice 13d3:3570 to device tables
> >> > > > > > > > > >     c4976160a0a4 bluetooth: Add device 13d3:3571 to =
device tables
> >> > > > > > > > > >     603e77e9e8c0 bluetooth: Add device 0bda:887b to =
device tables
> >> > > > > > > > > >     e9bb966c50a7 Bluetooth: btusb: Add Realtek RTL88=
52BE support ID 0x0cb8:0xc559
> >> > > > > > > > > >     cf642ee641ce cpufreq: stats: Fix buffer overflow=
 detection in trans_stats()
> >> > > > > > > > > >     63e09cdfe948 regmap: Ensure range selector regis=
ters are updated after cache sync
> >> > > > > > > > > >     0c49e74e95bf tty: serial: meson: fix hard LOCKUP=
 on crtscts mode
> >> > > > > > > > > >     6f26b6a61b08 serial: meson: Use platform_get_irq=
() to get the interrupt
> >> > > > > > > > > >     450fa8bf803f ALSA: hda/realtek - Enable internal=
 speaker of ASUS K6500ZC
> >> > > > > > > > > >     cc549ba50bb8 ALSA: hda/realtek - Add Dell ALC295=
 to pin fall back table
> >> > > > > > > > > >     767c988771cb ALSA: info: Fix potential deadlock =
at disconnection
> >> > > > > > > > > >     09022ae66261 xhci: Enable RPM on controllers tha=
t support low-power states
> >> > > > > > > > > >     68574fe2e488 parisc/pgtable: Do not drop upper 5=
 address bits of physical address
> >> > > > > > > > > >     ea7593c18ff7 parisc: Prevent booting 64-bit kern=
els on PA1.x machines
> >> > > > > > > > > >     2c9092e8b29a i3c: master: svc: fix SDA keep low =
when polling IBIWON timeout happen
> >> > > > > > > > > >     da754f92fc02 i3c: master: svc: fix check wrong s=
tatus register in irq handler
> >> > > > > > > > > >     5ba77b6b45d6 i3c: master: svc: fix ibi may not r=
eturn mandatory data byte
> >> > > > > > > > > >     e0a70ed4a580 i3c: master: svc: fix wrong data re=
turn when IBI happen during start frame
> >> > > > > > > > > >     7383675aba2f i3c: master: svc: fix race conditio=
n in ibi work thread
> >> > > > > > > > > >     cc7efd1054f4 i3c: master: cdns: Fix reading stat=
us register
> >> > > > > > > > > >     d3c6a08c2b77 mtd: cfi_cmdset_0001: Byte swap OTP=
 info
> >> > > > > > > > > >     a4668088128d mm/memory_hotplug: use pfn math in =
place of direct struct page manipulation
> >> > > > > > > > > >     792a796085cf mm/cma: use nth_page() in place of =
direct struct page manipulation
> >> > > > > > > > > >     9b59fc31226e s390/cmma: fix detection of DAT pag=
es
> >> > > > > > > > > >     45bb94aab891 dmaengine: stm32-mdma: correct desc=
 prep when channel running
> >> > > > > > > > > >     91659b77e937 mcb: fix error handling for differe=
nt scenarios when parsing
> >> > > > > > > > > >     534790fde890 tracing: Have the user copy of synt=
hetic event address use correct context
> >> > > > > > > > > >     f6237afabc34 i2c: core: Run atomic i2c xfer when=
 !preemptible
> >> > > > > > > > > >     931aa7154bc4 kernel/reboot: emergency_restart: S=
et correct system_state
> >> > > > > > > > > >     7a3424c3b76a quota: explicitly forbid quota file=
s from being encrypted
> >> > > > > > > > > >     47f509832168 jbd2: fix potential data lost in re=
covering journal raced with synchronizing fs bdev
> >> > > > > > > > > >     f13e1ea45699 ASoC: codecs: wsa-macro: fix uninit=
ialized stack variables with name prefix
> >> > > > > > > > > >     28436d8092ad selftests/resctrl: Reduce failures =
due to outliers in MBA/MBM tests
> >> > > > > > > > > >     6ce63598a1fb selftests/resctrl: Remove duplicate=
 feature check from CMT test
> >> > > > > > > > > >     e90efe17fc07 netfilter: nf_tables: split async a=
nd sync catchall in two functions
> >> > > > > > > > > >     0d9506c766c9 netfilter: nf_tables: remove catcha=
ll element in GC sync path
> >> > > > > > > > > >     96fc7a50a278 PCI: keystone: Don't discard .probe=
() callback
> >> > > > > > > > > >     e0d394df9812 PCI: keystone: Don't discard .remov=
e() callback
> >> > > > > > > > > >     f4f12667167c KEYS: trusted: Rollback init_truste=
d() consistently
> >> > > > > > > > > >     c407ff72fb3a genirq/generic_chip: Make irq_remov=
e_generic_chip() irqdomain aware
> >> > > > > > > > > >     bc8a14e3c630 mmc: meson-gx: Remove setting of CM=
D_CFG_ERROR
> >> > > > > > > > > >     3a51e6b4da71 wifi: ath11k: fix htt pktlog lockin=
g
> >> > > > > > > > > >     426e718ce9ba wifi: ath11k: fix dfs radar event l=
ocking
> >> > > > > > > > > >     e9d84413b1b7 wifi: ath11k: fix temperature event=
 locking
> >> > > > > > > > > >     5ff849948c11 ima: detect changes to the backing =
overlay file
> >> > > > > > > > > >     4584a421a6d9 ima: annotate iint mutex to avoid l=
ockdep false positive warnings
> >> > > > > > > > > >     4049576c639f ACPI: FPDT: properly handle invalid=
 FPDT subtables
> >> > > > > > > > > >     628e76e684c8 firmware: qcom_scm: use 64-bit call=
ing convention only when client is 64-bit
> >> > > > > > > > > >     6eb8c191e360 btrfs: don't arbitrarily slow down =
delalloc if we're committing
> >> > > > > > > > > >     0b99626b28ca rcu: kmemleak: Ignore kmemleak fals=
e positives when RCU-freeing objects
> >> > > > > > > > > >     71f5344f477c PM: hibernate: Clean up sync_read h=
andling in snapshot_write_next()
> >> > > > > > > > > >     57dbc0eb8abe PM: hibernate: Use __get_safe_page(=
) rather than touching the list
> >> > > > > > > > > >     87a30633b5d3 arm64: dts: qcom: ipq6018: Fix hwlo=
ck index for SMEM
> >> > > > > > > > > >     ebaee06a7292 rcu/tree: Defer setting of jiffies =
during stall reset
> >> > > > > > > > > >     057d1034d012 svcrdma: Drop connection after an R=
DMA Read error
> >> > > > > > > > > >     541b3757fd44 wifi: wilc1000: use vmm_table as ar=
ray in wilc struct
> >> > > > > > > > > >     b156f62f19da PCI: exynos: Don't discard .remove(=
) callback
> >> > > > > > > > > >     f88796721002 PCI/ASPM: Fix L1 substate handling =
in aspm_attr_store_common()
> >> > > > > > > > > >     467864d55b52 mmc: sdhci_am654: fix start loop in=
dex for TAP value parsing
> >> > > > > > > > > >     ef34a97bb9cb mmc: vub300: fix an error code
> >> > > > > > > > > >     36adb6204cff clk: qcom: ipq6018: drop the CLK_SE=
T_RATE_PARENT flag from PLL clocks
> >> > > > > > > > > >     090b167b2c41 clk: qcom: ipq8074: drop the CLK_SE=
T_RATE_PARENT flag from PLL clocks
> >> > > > > > > > > >     18640a1818f1 clk: socfpga: Fix undefined behavio=
r bug in struct stratix10_clock_data
> >> > > > > > > > > >     4d17b54c9be3 parisc/pdc: Add width field to stru=
ct pdc_model
> >> > > > > > > > > >     936c9c10efae arm64: Restrict CPU_BIG_ENDIAN to G=
NU as or LLVM IAS 15.x or newer
> >> > > > > > > > > >     8b24bb54bf3a ACPI: resource: Do IRQ override on =
TongFang GMxXGxx
> >> > > > > > > > > >     5619c34d3c4c watchdog: move softlockup_panic bac=
k to early_param
> >> > > > > > > > > >     a6c3a1fe09a2 PCI/sysfs: Protect driver's D3cold =
preference from user space
> >> > > > > > > > > >     01975bee0a14 hvc/xen: fix event channel handling=
 for secondary consoles
> >> > > > > > > > > >     cfd543c10871 hvc/xen: fix error path in xen_hvc_=
init() to always register frontend driver
> >> > > > > > > > > >     730e08cb9101 hvc/xen: fix console unplug
> >> > > > > > > > > >     fa0b93a3de40 tty/sysrq: replace smp_processor_id=
() with get_cpu()
> >> > > > > > > > > >     92e6c0f00d38 audit: don't WARN_ON_ONCE(!current-=
>mm) in audit_exe_compare()
> >> > > > > > > > > >     e29c095f1ad4 audit: don't take task_lock() in au=
dit_exe_compare() code path
> >> > > > > > > > > >     5eb6519f483e KVM: x86: Ignore MSR_AMD64_TW_CFG a=
ccess
> >> > > > > > > > > >     1c49ef7041f2 KVM: x86: hyper-v: Don't auto-enabl=
e stimer on write from user-space
> >> > > > > > > > > >     fe6b461c37cb x86/cpu/hygon: Fix the CPU topology=
 evaluation for real
> >> > > > > > > > > >     3a2adf48d8b1 crypto: x86/sha - load modules base=
d on CPU features
> >> > > > > > > > > >     be079aa71a12 scsi: qla2xxx: Fix system crash due=
 to bad pointer access
> >> > > > > > > > > >     6ba3569f78d3 scsi: megaraid_sas: Increase regist=
er read retry rount from 3 to 30 for selected registers
> >> > > > > > > > > >     6a33b5810031 scsi: mpt3sas: Fix loop logic
> >> > > > > > > > > >     3c5aede46cdc bpf: Fix precision tracking for BPF=
_ALU | BPF_TO_BE | BPF_END
> >> > > > > > > > > >     403470431b15 bpf: Fix check_stack_write_fixed_of=
f() to correctly spill imm
> >> > > > > > > > > >     ba115f6c3a8c randstruct: Fix gcc-plugin performa=
nce mode to stay in group
> >> > > > > > > > > >     2771fac4382b powerpc/perf: Fix disabling BHRB an=
d instruction sampling
> >> > > > > > > > > >     7e450cc9ad54 media: venus: hfi: add checks to pe=
rform sanity on queue pointers
> >> > > > > > > > > >     1566e8be73fd i915/perf: Fix NULL deref bugs with=
 drm_dbg() calls
> >> > > > > > > > > >     35c17257ef09 xfs: Fix unreferenced object report=
ed by kmemleak in xfs_sysfs_init()
> >> > > > > > > > > >     5db146322b17 xfs: fix memory leak in xfs_errorta=
g_init
> >> > > > > > > > > >     c540284d8488 xfs: fix exception caused by unexpe=
cted illegal bestcount in leaf dir
> >> > > > > > > > > >     5212d586e76f xfs: avoid a UAF when log intent it=
em recovery fails
> >> > > > > > > > > >     ba179cc12109 xfs: fix inode reservation space fo=
r removing transaction
> >> > > > > > > > > >     b7847653a2d6 xfs: Fix false ENOSPC when performi=
ng direct write on a delalloc extent in cow fork
> >> > > > > > > > > >     92d38b87e886 xfs: add missing cmap->br_state =3D=
 XFS_EXT_NORM update
> >> > > > > > > > > >     8d0baec78e8a xfs: fix intermittent hang during q=
uotacheck
> >> > > > > > > > > >     76545c0e881b xfs: don't leak memory when attr fo=
rk loading fails
> >> > > > > > > > > >     eb888caf27d9 xfs: fix use-after-free in xattr no=
de block inactivation
> >> > > > > > > > > >     4cb3842967e6 xfs: flush inode gc workqueue befor=
e clearing agi bucket
> >> > > > > > > > > >     188594c64a1e xfs: prevent a UAF when log IO erro=
rs race with unmount
> >> > > > > > > > > >     921c96215850 xfs: use invalidate_lock to check t=
he state of mmap_lock
> >> > > > > > > > > >     efd194800b69 xfs: convert buf_cancel_table alloc=
ation to kmalloc_array
> >> > > > > > > > > >     074fee186931 xfs: don't leak xfs_buf_cancel stru=
ctures when recovery fails
> >> > > > > > > > > >     b8effd31a862 xfs: refactor buffer cancellation t=
able allocation
> >> > > > > > > > > >     4968c2aa6a1f cifs: fix check of rc in function g=
enerate_smb3signingkey
> >> > > > > > > > > >     8d725bf0d16d cifs: spnego: add ';' in HOST_KEY_L=
EN
> >> > > > > > > > > >     21accf149161 tools/power/turbostat: Enable the C=
-state Pre-wake printing
> >> > > > > > > > > >     0045c1ff7ac0 tools/power/turbostat: Fix a knl bu=
g
> >> > > > > > > > > >     5bcce23f387b macvlan: Don't propagate promisc ch=
ange to lower dev in passthru
> >> > > > > > > > > >     7574b5e65e92 net/mlx5e: Check return value of sn=
printf writing to fw_version buffer for representors
> >> > > > > > > > > >     55553c5b53ae net/mlx5e: Reduce the size of icosq=
_str
> >> > > > > > > > > >     51655fd35703 net/mlx5e: Fix pedit endianness
> >> > > > > > > > > >     a990dd7410ec net/mlx5e: Refactor mod header mana=
gement API
> >> > > > > > > > > >     39f95b1d0d8f net/mlx5e: Move mod hdr allocation =
to a single place
> >> > > > > > > > > >     c0f37a3715cb net/mlx5e: Remove incorrect additio=
n of action fwd flag
> >> > > > > > > > > >     6974fd92d5f1 net/mlx5e: fix double free of encap=
_header in update funcs
> >> > > > > > > > > >     f3c4a7044201 net/mlx5e: fix double free of encap=
_header
> >> > > > > > > > > >     931e9e8e30bf net: stmmac: fix rx budget limit ch=
eck
> >> > > > > > > > > >     b8b514b2a6cd netfilter: nf_tables: fix pointer m=
ath issue in nft_byteorder_eval()
> >> > > > > > > > > >     25da0f582119 netfilter: nf_tables: add and use B=
E register load-store helpers
> >> > > > > > > > > >     a48f6be5bdb7 netfilter: nf_tables: use the corre=
ct get/put helpers
> >> > > > > > > > > >     7d3901bf3baa netfilter: nf_conntrack_bridge: ini=
tialize err to 0
> >> > > > > > > > > >     75bcfc188abf af_unix: fix use-after-free in unix=
_stream_read_actor()
> >> > > > > > > > > >     0b480c654ef2 net: ethernet: cortina: Fix MTU max=
 setting
> >> > > > > > > > > >     097588e20c6b net: ethernet: cortina: Handle larg=
e frames
> >> > > > > > > > > >     f9269b274cdf net: ethernet: cortina: Fix max RX =
frame define
> >> > > > > > > > > >     53064e8239dd bonding: stop the device in bond_se=
tup_by_slave()
> >> > > > > > > > > >     cda210a4bdf7 ptp: annotate data-race around q->h=
ead and q->tail
> >> > > > > > > > > >     b67d16b2373b xen/events: fix delayed eoi list ha=
ndling
> >> > > > > > > > > >     8531a4194e59 ppp: limit MRU to 64K
> >> > > > > > > > > >     9ae82308d184 tipc: Fix kernel-infoleak due to un=
initialized TLV value
> >> > > > > > > > > >     359c65daf6b5 net: hns3: fix VF wrong speed and d=
uplex issue
> >> > > > > > > > > >     406be003d698 net: hns3: fix VF reset fail issue
> >> > > > > > > > > >     cfc131b078a3 net: hns3: fix variable may not ini=
tialized problem in hns3_init_mac_addr()
> >> > > > > > > > > >     070581829c1a net: hns3: fix incorrect capability=
 bit display for copper port
> >> > > > > > > > > >     a3c65cf7854d net: hns3: add barrier in vf mailbo=
x reply process
> >> > > > > > > > > >     e671d8203758 net: hns3: add byte order conversio=
n for PF to VF mailbox message
> >> > > > > > > > > >     bb0f14257c04 net: hns3: refine the definition fo=
r struct hclge_pf_to_vf_msg
> >> > > > > > > > > >     1d8f66d4060a net: hns3: fix add VLAN fail issue
> >> > > > > > > > > >     4b3b2541d40e tty: Fix uninit-value access in ppp=
_sync_receive()
> >> > > > > > > > > >     1f64cad3ac38 ipvlan: add ipvlan_route_v6_outboun=
d() helper
> >> > > > > > > > > >     6c71b9b177c6 net: set SOCK_RCU_FREE before inser=
ting socket into hashtable
> >> > > > > > > > > >     427165421c25 net: inet: Retire port only listeni=
ng_hash
> >> > > > > > > > > >     be1ceb8b7c58 net: inet: Open code inet_hash2 and=
 inet_unhash2
> >> > > > > > > > > >     bb9bcf47fba7 net: inet: Remove count from inet_l=
isten_hashbucket
> >> > > > > > > > > >     de634368e079 mptcp: listen diag dump support
> >> > > > > > > > > >     870f438aca56 mptcp: diag: switch to context stru=
cture
> >> > > > > > > > > >     be020f658c63 gfs2: Silence "suspicious RCU usage=
 in gfs2_permission" warning
> >> > > > > > > > > >     194454afa6aa SUNRPC: Fix RPC client cleaned up t=
he freed pipefs dentries
> >> > > > > > > > > >     319ed0cba164 NFSv4.1: fix SP4_MACH_CRED protecti=
on for pnfs IO
> >> > > > > > > > > >     809684f5b388 SUNRPC: Add an IS_ERR() check back =
to where it was
> >> > > > > > > > > >     46d6b768072b SUNRPC: ECONNRESET might require a =
rebind
> >> > > > > > > > > >     a7032d4d6499 media: cec: meson: always include m=
eson sub-directory in Makefile
> >> > > > > > > > > >     16e78f28517d media: cadence: csi2rx: Unregister =
v4l2 async notifier
> >> > > > > > > > > >     20c2ca9abb78 sched/core: Optimize in_task() and =
in_interrupt() a bit
> >> > > > > > > > > >     9894c58c1777 tracing/perf: Add interrupt_context=
_level() helper
> >> > > > > > > > > >     48fef664d7e9 tracing: Reuse logic from perf's ge=
t_recursion_context()
> >> > > > > > > > > >     670b3e902f62 wifi: iwlwifi: Use FW rate for non-=
data frames
> >> > > > > > > > > >     a7ee519e8095 pwm: Fix double shift bug
> >> > > > > > > > > >     7054366cd076 drm/amdgpu: fix software pci_unplug=
 on some chips
> >> > > > > > > > > >     e48a5e78d077 drm/qxl: prevent memory leak
> >> > > > > > > > > >     0835e7f296ca ASoC: ti: omap-mcbsp: Fix runtime P=
M underflow warnings
> >> > > > > > > > > >     38ada2f304f6 i2c: dev: copy userspace array safe=
ly
> >> > > > > > > > > >     610244988f32 kgdb: Flush console before entering=
 kgdb on panic
> >> > > > > > > > > >     4e497f1acd99 drm/amd/display: Avoid NULL derefer=
ence of timing generator
> >> > > > > > > > > >     5e0b788fb96b media: imon: fix access to invalid =
resource for the second interface
> >> > > > > > > > > >     ae6bcafe1f6b media: ccs: Fix driver quirk struct=
 documentation
> >> > > > > > > > > >     d01b0ad79ecd media: cobalt: Use FIELD_GET() to e=
xtract Link Width
> >> > > > > > > > > >     03ce0655bf8e gfs2: fix an oops in gfs2_permissio=
n
> >> > > > > > > > > >     5bfda356e903 gfs2: ignore negated quota changes
> >> > > > > > > > > >     16631907d013 media: vivid: avoid integer overflo=
w
> >> > > > > > > > > >     09cd8b561aa9 media: gspca: cpia1: shift-out-of-b=
ounds in set_flicker
> >> > > > > > > > > >     39c71357e68e i3c: master: mipi-i3c-hci: Fix a ke=
rnel panic for accessing DAT_data.
> >> > > > > > > > > >     72775cad7f57 virtio-blk: fix implicit overflow o=
n virtio_max_dma_size
> >> > > > > > > > > >     f7f3bdb225e3 i2c: sun6i-p2wi: Prevent potential =
division by zero
> >> > > > > > > > > >     d23ad76f240c i3c: mipi-i3c-hci: Fix out of bound=
s access in hci_dma_irq_handler
> >> > > > > > > > > >     e6fbad3cc880 9p: v9fs_listxattr: fix %s null arg=
ument warning
> >> > > > > > > > > >     a18be976be41 9p/trans_fd: Annotate data-racy wri=
tes to file::f_flags
> >> > > > > > > > > >     2cc5e191d671 usb: gadget: f_ncm: Always set curr=
ent gadget in ncm_bind()
> >> > > > > > > > > >     6c80f48912b5 tty: vcc: Add check for kstrdup() i=
n vcc_probe()
> >> > > > > > > > > >     2ff61106d6b4 exfat: support handle zero-size dir=
ectory
> >> > > > > > > > > >     c86a3007a685 HID: Add quirk for Dell Pro Wireles=
s Keyboard and Mouse KM5221W
> >> > > > > > > > > >     3453f945af89 PCI: Use FIELD_GET() in Sapphire RX=
 5600 XT Pulse quirk
> >> > > > > > > > > >     0a93a0f99a09 misc: pci_endpoint_test: Add Device=
 ID for R-Car S4-8 PCIe controller
> >> > > > > > > > > >     03dbd6a9ea4e PCI: Disable ATS for specific Intel=
 IPU E2000 devices
> >> > > > > > > > > >     a9a0b3444845 PCI: Extract ATS disabling to a hel=
per function
> >> > > > > > > > > >     fe511d24418a PCI: Use FIELD_GET() to extract Lin=
k Width
> >> > > > > > > > > >     56d78b5495eb scsi: libfc: Fix potential NULL poi=
nter dereference in fc_lport_ptp_setup()
> >> > > > > > > > > >     37a51e7f36b7 atm: iphase: Do PCI error checks on=
 own line
> >> > > > > > > > > >     f05ae00106aa PCI: tegra194: Use FIELD_GET()/FIEL=
D_PREP() with Link Width fields
> >> > > > > > > > > >     631a96e9eb42 ALSA: hda: Fix possible null-ptr-de=
ref when assigning a stream
> >> > > > > > > > > >     1c805b9cd2e3 ARM: 9320/1: fix stack depot IRQ st=
ack filter
> >> > > > > > > > > >     8d25ec69f8f1 HID: lenovo: Detect quirk-free fw o=
n cptkbd and stop applying workaround
> >> > > > > > > > > >     64f062baf202 jfs: fix array-index-out-of-bounds =
in diAlloc
> >> > > > > > > > > >     da3da5e1e6f7 jfs: fix array-index-out-of-bounds =
in dbFindLeaf
> >> > > > > > > > > >     1f74d336990f fs/jfs: Add validity check for db_m=
axag and db_agpref
> >> > > > > > > > > >     5f148b16972e fs/jfs: Add check for negative db_l=
2nbperpage
> >> > > > > > > > > >     e1d1f79b1929 scsi: ibmvfc: Remove BUG_ON in the =
case of an empty event pool
> >> > > > > > > > > >     f0bfc8a5561f scsi: hisi_sas: Set debugfs_dir poi=
nter to NULL after removing debugfs
> >> > > > > > > > > >     5904dee70771 RDMA/hfi1: Use FIELD_GET() to extra=
ct Link Width
> >> > > > > > > > > >     546c1796ad1e crypto: pcrypt - Fix hungtask for P=
ADATA_RESET
> >> > > > > > > > > >     bc443a199f8c ASoC: soc-card: Add storage for PCI=
 SSID
> >> > > > > > > > > >     9f2082067c5f selftests/efivarfs: create-read: fi=
x a resource leak
> >> > > > > > > > > >     428cad17f53b arm64: dts: ls208xa: use a pseudo-b=
us to constrain usb dma size
> >> > > > > > > > > >     174f62a0aa15 drm/amdgpu: Fix a null pointer acce=
ss when the smc_rreg pointer is NULL
> >> > > > > > > > > >     3f7a400d5e80 drm/amdkfd: Fix shift out-of-bounds=
 issue
> >> > > > > > > > > >     300589d551d4 drm/panel: st7703: Pick different r=
eset sequence
> >> > > > > > > > > >     eaa03ea366c8 drm/amdgpu/vkms: fix a possible nul=
l pointer dereference
> >> > > > > > > > > >     84c923d89890 drm/panel/panel-tpo-tpg110: fix a p=
ossible null pointer dereference
> >> > > > > > > > > >     2381f6b628b3 drm/panel: fix a possible null poin=
ter dereference
> >> > > > > > > > > >     c11cf5e117f5 drm/amdgpu: Fix potential null poin=
ter derefernce
> >> > > > > > > > > >     a237675aa1e6 drm/amd: Fix UBSAN array-index-out-=
of-bounds for Polaris and Tonga
> >> > > > > > > > > >     acdb6830de02 drm/amd: Fix UBSAN array-index-out-=
of-bounds for SMU7
> >> > > > > > > > > >     829ce8e995a8 drm/msm/dp: skip validity check for=
 DP CTS EDID checksum
> >> > > > > > > > > >     689b33b94f09 drm: vmwgfx_surface.c: copy user-ar=
ray safely
> >> > > > > > > > > >     22260dabcfe3 kernel: watch_queue: copy user-arra=
y safely
> >> > > > > > > > > >     d4f2c09d4672 kernel: kexec: copy user-array safe=
ly
> >> > > > > > > > > >     24b17d530c42 string.h: add array-wrappers for (v=
)memdup_user()
> >> > > > > > > > > >     3a3a6dc9a330 drm/amd/display: use full update fo=
r clip size increase of large plane source
> >> > > > > > > > > >     7d43cdd22cd8 drm/amdkfd: Fix a race condition of=
 vram buffer unref in svm code
> >> > > > > > > > > >     eea81424c5b8 drm/komeda: drop all currently held=
 locks if deadlock happens
> >> > > > > > > > > >     812886866be6 platform/x86: thinkpad_acpi: Add ba=
ttery quirk for Thinkpad X120e
> >> > > > > > > > > >     ba7088769800 Bluetooth: Fix double free in hci_c=
onn_cleanup
> >> > > > > > > > > >     f9de14bde56d Bluetooth: btusb: Add date->evt_skb=
 is NULL check
> >> > > > > > > > > >     a43cf6acf017 wifi: ath10k: Don't touch the CE in=
terrupt registers after power up
> >> > > > > > > > > >     6f42bd243327 net: annotate data-races around sk-=
>sk_dst_pending_confirm
> >> > > > > > > > > >     19ab5fd26441 net: annotate data-races around sk-=
>sk_tx_queue_mapping
> >> > > > > > > > > >     f3be63f7a8ee wifi: ath10k: fix clang-specific fo=
rtify warning
> >> > > > > > > > > >     02a0547b8da0 wifi: ath9k: fix clang-specific for=
tify warnings
> >> > > > > > > > > >     cf353904a828 bpf: Detect IP =3D=3D ksym.end as p=
art of BPF program
> >> > > > > > > > > >     c29a89b23f67 atl1c: Work around the DMA RX overf=
low issue
> >> > > > > > > > > >     21a0f310a9f3 wifi: mac80211: don't return unset =
power in ieee80211_get_tx_power()
> >> > > > > > > > > >     3073e38086d0 wifi: mac80211_hwsim: fix clang-spe=
cific fortify warning
> >> > > > > > > > > >     e8e55fa44435 x86/mm: Drop the 4 MB restriction o=
n minimal NUMA node memory size
> >> > > > > > > > > >     f9d3ba62e87b workqueue: Provide one lock class k=
ey per work_on_cpu() callsite
> >> > > > > > > > > >     0a5b512d526c clocksource/drivers/timer-atmel-tcb=
: Fix initialization on SAM9 hardware
> >> > > > > > > > > >     465b88c0873b clocksource/drivers/timer-imx-gpt: =
Fix potential memory leak
> >> > > > > > > > > >     fd0df3f87192 perf/core: Bail out early if the re=
quest AUX area is out of bound
> >> > > > > > > > > >     e89d0ed45a41 locking/ww_mutex/test: Fix potentia=
l workqueue corruption
> >> > > > > > > > > >     2a910f4af54d Linux 5.15.139
> >> > > > > > > > > >     3443337acd37 btrfs: use u64 for buffer sizes in =
the tree search ioctls
> >> > > > > > > > > >     f9f5e8cecba9 Revert "mmc: core: Capture correct =
oemid-bits for eMMC cards"
> >> > > > > > > > > >     824829c2c6b4 tracing/kprobes: Fix the order of a=
rgument descriptions
> >> > > > > > > > > >     560680f745fc fbdev: fsl-diu-fb: mark wr_reg_wa()=
 static
> >> > > > > > > > > >     8e4b510fe917 fbdev: imsttfb: fix a resource leak=
 in probe
> >> > > > > > > > > >     3648582181b6 fbdev: imsttfb: Fix error path of i=
msttfb_probe()
> >> > > > > > > > > >     30959f9f4540 spi: spi-zynq-qspi: add spi-mem to =
driver kconfig dependencies
> >> > > > > > > > > >     9cf044cc36c1 ASoC: hdmi-codec: register hpd call=
back on component probe
> >> > > > > > > > > >     705e5a28ec1d drm/syncobj: fix DRM_SYNCOBJ_WAIT_F=
LAGS_WAIT_AVAILABLE
> >> > > > > > > > > >     0ca05fae2790 netfilter: nat: fix ipv6 nat redire=
ct with mapped and scoped addresses
> >> > > > > > > > > >     1652f57f02eb netfilter: nft_redir: use `struct n=
f_nat_range2` throughout and deduplicate eval call-backs
> >> > > > > > > > > >     d28c17abe098 netfilter: xt_recent: fix (increase=
) ipv6 literal buffer length
> >> > > > > > > > > >     f30567fcbc4d i2c: iproc: handle invalid slave st=
ate
> >> > > > > > > > > >     38f5ac54b917 r8169: respect userspace disabling =
IFF_MULTICAST
> >> > > > > > > > > >     fd01115b033c blk-core: use pr_warn_ratelimited()=
 in bio_check_ro()
> >> > > > > > > > > >     b80148710983 block: remove unneeded return value=
 of bio_check_ro()
> >> > > > > > > > > >     d8d94d6b3bd3 tg3: power down device only on SYST=
EM_POWER_OFF
> >> > > > > > > > > >     5ea06a23f8f4 net/smc: put sk reference if close =
work was canceled
> >> > > > > > > > > >     884606f8283c net/smc: allow cdc msg send rather =
than drop it with NULL sndbuf_desc
> >> > > > > > > > > >     a62af7146daa net/smc: fix dangling sock under st=
ate SMC_APPFINCLOSEWAIT
> >> > > > > > > > > >     866606826f16 selftests: pmtu.sh: fix result chec=
king
> >> > > > > > > > > >     2d117ac1b8f8 net: stmmac: xgmac: Enable support =
for multiple Flexible PPS outputs
> >> > > > > > > > > >     95a99ac112c5 Fix termination state for idr_for_e=
ach_entry_ul()
> >> > > > > > > > > >     70ef755f126b net: r8169: Disable multicast filte=
r for RTL8168H and RTL8107E
> >> > > > > > > > > >     0dad0e75d62b dccp/tcp: Call security_inet_conn_r=
equest() after setting IPv6 addresses.
> >> > > > > > > > > >     c340713bdf32 dccp: Call security_inet_conn_reque=
st() after setting IPv4 addresses.
> >> > > > > > > > > >     d1b7e6562a4c octeontx2-pf: Fix holes in error co=
de
> >> > > > > > > > > >     f60297ef59d4 octeontx2-pf: Fix error codes
> >> > > > > > > > > >     794d360b1d65 inet: shrink struct flowi_common
> >> > > > > > > > > >     8943083bbb64 bpf: Check map->usercnt after timer=
->timer is assigned
> >> > > > > > > > > >     3907b89cd17f tipc: Change nla_policy for bearer-=
related names to NLA_NUL_STRING
> >> > > > > > > > > >     a1a485e45d24 hsr: Prevent use after free in prp_=
create_tagged_frame()
> >> > > > > > > > > >     352887b3edd0 llc: verify mac len before reading =
mac header
> >> > > > > > > > > >     303766bb92c5 Input: synaptics-rmi4 - fix use aft=
er free in rmi_unregister_function()
> >> > > > > > > > > >     741e4c15d7c0 pwm: brcmstb: Utilize appropriate c=
lock APIs in suspend/resume
> >> > > > > > > > > >     895ac9a21f69 pwm: sti: Reduce number of allocati=
ons and drop usage of chip_data
> >> > > > > > > > > >     db64ddddeeec regmap: prevent noinc writes from c=
lobbering cache
> >> > > > > > > > > >     004d4002534e media: dvb-usb-v2: af9035: fix miss=
ing unlock
> >> > > > > > > > > >     a0beda184756 media: cedrus: Fix clock/reset sequ=
ence
> >> > > > > > > > > >     980be4c3b0d5 media: vidtv: mux: Add check and kf=
ree for kstrdup
> >> > > > > > > > > >     d17269fb9161 media: vidtv: psi: Add check for ks=
trdup
> >> > > > > > > > > >     db89f551b706 media: s3c-camif: Avoid inappropria=
te kfree()
> >> > > > > > > > > >     51c94256a83f media: bttv: fix use after free err=
or due to btv->timeout timer
> >> > > > > > > > > >     d3937f9e25d9 media: i2c: max9286: Fix some redun=
dant of_node_put() calls
> >> > > > > > > > > >     9d060f2fc40c pcmcia: ds: fix possible name leak =
in error path in pcmcia_device_add()
> >> > > > > > > > > >     24e9df588e2e pcmcia: ds: fix refcount leak in pc=
mcia_device_add()
> >> > > > > > > > > >     24e73ab542c7 pcmcia: cs: fix possible hung task =
and memory leak pccardd()
> >> > > > > > > > > >     b3eaa0d43c74 rtc: pcf85363: fix wrong mask/val p=
arameters in regmap_update_bits call
> >> > > > > > > > > >     20bd0198bebd cxl/mem: Fix shutdown order
> >> > > > > > > > > >     d48fe8d98171 i3c: Fix potential refcount leak in=
 i3c_master_register_new_i3c_devs
> >> > > > > > > > > >     855d6fb2cc7b 9p/net: fix possible memory leak in=
 p9_check_errors()
> >> > > > > > > > > >     0d456ebaad30 perf hist: Add missing puts to hist=
__account_cycles
> >> > > > > > > > > >     924e8d0b7645 perf machine: Avoid out of bounds L=
BR memory read
> >> > > > > > > > > >     76b0eab987c4 usb: host: xhci-plat: fix possible =
kernel oops while resuming
> >> > > > > > > > > >     c9c4dab06a5a xhci: Loosen RPM as default policy =
to cover for AMD xHC 1.1
> >> > > > > > > > > >     92c9ef156431 powerpc/pseries: fix potential memo=
ry leak in init_cpu_associativity()
> >> > > > > > > > > >     516235e7b35f powerpc/imc-pmu: Use the correct sp=
inlock initializer.
> >> > > > > > > > > >     945dc61d7840 powerpc/xive: Fix endian conversion=
 size
> >> > > > > > > > > >     bce31a2bcb1e powerpc/40x: Remove stale PTE_ATOMI=
C_UPDATES macro
> >> > > > > > > > > >     1308e55eb09c modpost: fix tee MODULE_DEVICE_TABL=
E built on big-endian host
> >> > > > > > > > > >     863a9c3fdec2 powerpc: Only define __parse_fpscr(=
) when required
> >> > > > > > > > > >     01f62c6bd2db f2fs: fix to initialize map.m_pblk =
in f2fs_precache_extents()
> >> > > > > > > > > >     dfebea7114e0 dmaengine: pxa_dma: Remove an erron=
eous BUG_ON() in pxad_free_desc()
> >> > > > > > > > > >     72f8fa6c4b78 USB: usbip: fix stub_dev hub discon=
nect
> >> > > > > > > > > >     168697f15a53 tools: iio: iio_generic_buffer ensu=
re alignment
> >> > > > > > > > > >     a61c3c647ffd misc: st_core: Do not call kfree_sk=
b() under spin_lock_irqsave()
> >> > > > > > > > > >     732aa0cb2601 dmaengine: ti: edma: handle irq_of_=
parse_and_map() errors
> >> > > > > > > > > >     2941a29fe9d6 usb: chipidea: Simplify Tegra DMA a=
lignment code
> >> > > > > > > > > >     58e8316b200b usb: chipidea: Fix DMA overwrite fo=
r Tegra
> >> > > > > > > > > >     fcaafb574fc8 usb: dwc2: fix possible NULL pointe=
r dereference caused by driver concurrency
> >> > > > > > > > > >     c956be5641cc dmaengine: idxd: Register dsa_bus_t=
ype before registering idxd sub-drivers
> >> > > > > > > > > >     ca46d7ce1fbe livepatch: Fix missing newline char=
acter in klp_resolve_symbols()
> >> > > > > > > > > >     b77f7c025e85 tty: tty_jobctrl: fix pid memleak i=
n disassociate_ctty()
> >> > > > > > > > > >     e9f598a5cc9a f2fs: compress: fix to avoid redund=
ant compress extension
> >> > > > > > > > > >     8c4504cc0c64 f2fs: compress: fix to avoid use-af=
ter-free on dic
> >> > > > > > > > > >     ca0aae3837a6 leds: trigger: ledtrig-cpu:: Fix 'o=
utput may be truncated' issue for 'cpu'
> >> > > > > > > > > >     206a972511a8 leds: pwm: Don't disable the PWM wh=
en the LED should be off
> >> > > > > > > > > >     893eedf596dd leds: turris-omnia: Do not use SMBU=
S calls
> >> > > > > > > > > >     aec3706971b3 leds: turris-omnia: Drop unnecessar=
y mutex locking
> >> > > > > > > > > >     c9a4f13c58f1 mfd: arizona-spi: Set pdata.hpdet_c=
hannel for ACPI enumerated devs
> >> > > > > > > > > >     63a99d7b57b4 mfd: dln2: Fix double put in dln2_p=
robe
> >> > > > > > > > > >     2742c860e0b7 mfd: core: Ensure disabled devices =
are skipped without aborting
> >> > > > > > > > > >     94eb5423d75e mfd: core: Un-constify mfd_cell.of_=
reg
> >> > > > > > > > > >     8890d4d5f25e ASoC: ams-delta.c: use component af=
ter check
> >> > > > > > > > > >     a2ae48bd82ee crypto: qat - fix deadlock in backl=
og processing
> >> > > > > > > > > >     0dd34a7ad395 padata: Fix refcnt handling in pada=
ta_free_shell()
> >> > > > > > > > > >     93e4aa8545ab ASoC: Intel: Skylake: Fix mem leak =
when parsing UUIDs fails
> >> > > > > > > > > >     cd1c2df64d6b HID: logitech-hidpp: Move get_wirel=
ess_feature_index() check to hidpp_connect_event()
> >> > > > > > > > > >     99893b7c4592 HID: logitech-hidpp: Revert "Don't =
restart communication if not necessary"
> >> > > > > > > > > >     5f2f38602583 HID: logitech-hidpp: Don't restart =
IO, instead defer hid_connect() only
> >> > > > > > > > > >     1f80041c5867 HID: logitech-hidpp: Remove HIDPP_Q=
UIRK_NO_HIDINPUT quirk
> >> > > > > > > > > >     d3b196a1da3e Revert "HID: logitech-hidpp: add a =
module parameter to keep firmware gestures"
> >> > > > > > > > > >     6885e5ffa09d sh: bios: Revive earlyprintk suppor=
t
> >> > > > > > > > > >     b0c25e957f9b hid: cp2112: Fix IRQ shutdown stopp=
ing polling for all IRQs on chip
> >> > > > > > > > > >     d06dc0f99f72 RDMA/hfi1: Workaround truncation co=
mpilation error
> >> > > > > > > > > >     086cd44204bb scsi: ufs: core: Leave space for '\=
0' in utf8 desc string
> >> > > > > > > > > >     a0f1999090b3 ASoC: fsl: Fix PM disable depth imb=
alance in fsl_easrc_probe
> >> > > > > > > > > >     904fc0103776 RDMA/hns: The UD mode can only be c=
onfigured with DCQCN
> >> > > > > > > > > >     9f8db02d30ad RDMA/hns: Fix signed-unsigned mixed=
 comparisons
> >> > > > > > > > > >     2de683e27e1d RDMA/hns: Fix uninitialized ucmd in=
 hns_roce_create_qp_common()
> >> > > > > > > > > >     611260e36f16 IB/mlx5: Fix rdma counter binding f=
or RAW QP
> >> > > > > > > > > >     922b2693b9af ASoC: fsl: mpc5200_dma.c: Fix warni=
ng of Function parameter or member not described
> >> > > > > > > > > >     001f90cd9d2f ext4: move 'ix' sanity check to cor=
rent position
> >> > > > > > > > > >     c24a3c9e373e ARM: 9321/1: memset: cast the const=
ant byte to unsigned char
> >> > > > > > > > > >     012d0c66f939 hid: cp2112: Fix duplicate workqueu=
e initialization
> >> > > > > > > > > >     1ce09238e8e8 crypto: qat - increase size of buff=
ers
> >> > > > > > > > > >     62df66b726f9 crypto: caam/jr - fix Chacha20 + Po=
ly1305 self test failure
> >> > > > > > > > > >     61f25d4686bf crypto: caam/qi2 - fix Chacha20 + P=
oly1305 self test failure
> >> > > > > > > > > >     66eb7b7f23dd nd_btt: Make BTT lanes preemptible
> >> > > > > > > > > >     6563e0f79d63 libnvdimm/of_pmem: Use devm_kstrdup=
 instead of kstrdup and check its return value
> >> > > > > > > > > >     d4ad0c1a83ce scsi: ibmvfc: Fix erroneous use of =
rtas_busy_delay with hcall return code
> >> > > > > > > > > >     b79c7d684c3f RDMA/core: Use size_{add,sub,mul}()=
 in calls to struct_size()
> >> > > > > > > > > >     a5c83c8043d7 hwrng: geode - fix accessing regist=
ers
> >> > > > > > > > > >     a8607725b20a crypto: hisilicon/hpre - Fix a erro=
neous check after snprintf()
> >> > > > > > > > > >     b01b9dc5487a selftests/resctrl: Ensure the bench=
mark commands fits to its array
> >> > > > > > > > > >     2d2300fcf8f6 selftests/pidfd: Fix ksft print for=
mats
> >> > > > > > > > > >     8bc9c9447489 arm64: dts: imx8mn: Add sound-dai-c=
ells to micfil node
> >> > > > > > > > > >     1abd658492b5 arm64: dts: imx8mm: Add sound-dai-c=
ells to micfil node
> >> > > > > > > > > >     cf7abb54f8b1 arm64: dts: imx8qm-ss-img: Fix jpeg=
enc compatible entry
> >> > > > > > > > > >     8704bf18a888 clk: scmi: Free scmi_clk allocated =
when the clocks with invalid info are skipped
> >> > > > > > > > > >     bdb0428aa294 firmware: arm_ffa: Assign the missi=
ng IDR allocation ID to the FFA device
> >> > > > > > > > > >     b0ffdc164365 firmware: ti_sci: Mark driver as no=
n removable
> >> > > > > > > > > >     995ee1e84e8d soc: qcom: llcc: Handle a second de=
vice without data corruption
> >> > > > > > > > > >     19b8098f73c6 ARM: dts: qcom: mdm9615: populate v=
sdcc fixed regulator
> >> > > > > > > > > >     a8ab88f84b89 arm64: dts: qcom: apq8016-sbc: Add =
missing ADV7533 regulators
> >> > > > > > > > > >     ddc0df81eeac ARM64: dts: marvell: cn9310: Use ap=
propriate label for spi1 pins
> >> > > > > > > > > >     12d9de01c09c arm64: dts: qcom: sdm845-mtp: fix W=
iFi configuration
> >> > > > > > > > > >     690b89255971 arm64: dts: qcom: sc7280: Add missi=
ng LMH interrupts
> >> > > > > > > > > >     2a4cce4168f7 arm64: dts: qcom: msm8992-libra: dr=
op duplicated reserved memory
> >> > > > > > > > > >     eb9daf47806b arm64: dts: qcom: msm8916: Fix iomm=
u local address range
> >> > > > > > > > > >     541640dcbf48 ARM: dts: renesas: blanche: Fix typ=
o in GP_11_2 pin name
> >> > > > > > > > > >     0e1e88bba286 perf: hisi: Fix use-after-free when=
 register pmu fails
> >> > > > > > > > > >     4067d39f3c57 drm: mediatek: mtk_dsi: Fix NO_EOT_=
PACKET settings/handling
> >> > > > > > > > > >     a6a6f70aedca drm/msm/dsi: use msm_gem_kernel_put=
 to free TX buffer
> >> > > > > > > > > >     aea6f32a4318 xen-pciback: Consider INTx disabled=
 when MSI/MSI-X is enabled
> >> > > > > > > > > >     e588ca45bf55 drm/rockchip: Fix type promotion bu=
g in rockchip_gem_iommu_map()
> >> > > > > > > > > >     a00a293d57a5 arm64/arm: xen: enlighten: Fix KPTI=
 checks
> >> > > > > > > > > >     d0d01bb4a560 drm/bridge: lt9611uxc: fix the race=
 in the error path
> >> > > > > > > > > >     29aba28ea195 drm/bridge: lt9611uxc: Register and=
 attach our DSI device at probe
> >> > > > > > > > > >     f53a04579328 drm/bridge: lt9611uxc: Switch to de=
vm MIPI-DSI helpers
> >> > > > > > > > > >     517a5137a57b drm/rockchip: cdn-dp: Fix some erro=
r handling paths in cdn_dp_probe()
> >> > > > > > > > > >     865ccd4ca674 drm/mediatek: Fix iommu fault durin=
g crtc enabling
> >> > > > > > > > > >     8e3c8253b34f drm/mediatek: Fix iommu fault by sw=
apping FBs after updating plane state
> >> > > > > > > > > >     e11e339faa11 drm/amdkfd: fix some race condition=
s in vram buffer alloc/free of svm code
> >> > > > > > > > > >     30cb99e09648 drm/bridge: tc358768: Fix bit updat=
es
> >> > > > > > > > > >     1cd4ae681a6a drm/bridge: tc358768: Disable non-c=
ontinuous clock mode
> >> > > > > > > > > >     c13591b859be drm/bridge: tc358768: Fix use of un=
initialized variable
> >> > > > > > > > > >     d78bddd94b80 drm/bridge: lt8912b: Add missing dr=
m_bridge_attach call
> >> > > > > > > > > >     5cc2bc519afd drm/bridge: lt8912b: Manually disab=
le HPD only if it was enabled
> >> > > > > > > > > >     42071feab712 drm/bridge: lt8912b: Fix crash on b=
ridge detach
> >> > > > > > > > > >     d9217286d0ab drm/bridge: lt8912b: Fix bridge_det=
ach
> >> > > > > > > > > >     cc3057958c5c drm/bridge: lt8912b: Add hot plug d=
etection
> >> > > > > > > > > >     ef4a40953c80 drm/bridge: lt8912b: Register and a=
ttach our DSI device at probe
> >> > > > > > > > > >     3580b8a01305 drm/bridge: lt8912b: Switch to devm=
 MIPI-DSI helpers
> >> > > > > > > > > >     52541851a8d1 drm/mipi-dsi: Create devm device at=
tachment
> >> > > > > > > > > >     a20d6ecd261a drm/mipi-dsi: Create devm device re=
gistration
> >> > > > > > > > > >     347f025a02b3 drm/radeon: possible buffer overflo=
w
> >> > > > > > > > > >     b163b371d741 drm/rockchip: vop: Fix call to crtc=
 reset helper
> >> > > > > > > > > >     9a96bed1df7b drm/rockchip: vop: Fix reset of sta=
te in duplicate state crtc funcs
> >> > > > > > > > > >     1b0bc99cf316 hwmon: (coretemp) Fix potentially t=
runcated sysfs attribute name
> >> > > > > > > > > >     b3e7eb23a6e9 hwmon: (axi-fan-control) Fix possib=
le NULL pointer dereference
> >> > > > > > > > > >     e0bf076b734a platform/x86: wmi: Fix opening of c=
har device
> >> > > > > > > > > >     c57e81d5e538 platform/x86: wmi: remove unnecessa=
ry initializations
> >> > > > > > > > > >     2ca4e461a298 platform/x86: wmi: Fix probe failur=
e when failing to register WMI devices
> >> > > > > > > > > >     f75e11f54d98 clk: qcom: config IPQ_APSS_6018 sho=
uld depend on QCOM_SMEM
> >> > > > > > > > > >     d1175cf4bd2b clk: mediatek: clk-mt2701: Add chec=
k for mtk_alloc_clk_data
> >> > > > > > > > > >     e964d21dc034 clk: mediatek: clk-mt7629: Add chec=
k for mtk_alloc_clk_data
> >> > > > > > > > > >     c4070ada5d51 clk: mediatek: clk-mt7629-eth: Add =
check for mtk_alloc_clk_data
> >> > > > > > > > > >     3aefc6fcfbad clk: mediatek: clk-mt6797: Add chec=
k for mtk_alloc_clk_data
> >> > > > > > > > > >     ca6d565a2319 clk: mediatek: clk-mt6779: Add chec=
k for mtk_alloc_clk_data
> >> > > > > > > > > >     533ca5153ad6 clk: mediatek: clk-mt6765: Add chec=
k for mtk_alloc_clk_data
> >> > > > > > > > > >     e531e4e73734 clk: npcm7xx: Fix incorrect kfree
> >> > > > > > > > > >     761c2a690d8f clk: ti: fix double free in of_ti_d=
ivider_clk_setup()
> >> > > > > > > > > >     1c37faca0908 clk: ti: change ti_clk_register[_om=
ap_hw]() API
> >> > > > > > > > > >     28b72fba1e19 clk: ti: Update component clocks to=
 use ti_dt_clk_name()
> >> > > > > > > > > >     c4bffed2e52b clk: ti: Update pll and clockdomain=
 clocks to use ti_dt_clk_name()
> >> > > > > > > > > >     9b5e9d8bf9a6 clk: ti: Add ti_dt_clk_name() helpe=
r to use clock-output-names
> >> > > > > > > > > >     f45fff806ebb clk: keystone: pll: fix a couple NU=
LL vs IS_ERR() checks
> >> > > > > > > > > >     7ff8ca9beefb spi: nxp-fspi: use the correct iore=
map function
> >> > > > > > > > > >     26206c858dae clk: renesas: rzg2l: Fix computatio=
n formula
> >> > > > > > > > > >     1966bf2a79e6 clk: renesas: rzg2l: Use FIELD_GET(=
) for PLL register fields
> >> > > > > > > > > >     7ece2efa87af clk: renesas: rzg2l: Simplify multi=
plication/shift logic
> >> > > > > > > > > >     e2239f716529 clk: imx: imx8qxp: Fix elcdif_pll c=
lock
> >> > > > > > > > > >     7d416973cd12 clk: imx: imx8mq: correct error han=
dling path
> >> > > > > > > > > >     608ebb098b79 clk: imx: Select MXC_CLK for CLK_IM=
X8QXP
> >> > > > > > > > > >     8861b2925a84 clk: qcom: gcc-sm8150: Fix gcc_sdcc=
2_apps_clk_src
> >> > > > > > > > > >     76e8f00f54a8 clk: qcom: mmcc-msm8998: Fix the SM=
MU GDSC
> >> > > > > > > > > >     56c4bb46a5a0 clk: qcom: mmcc-msm8998: Don't chec=
k halt bit on some branch clks
> >> > > > > > > > > >     0881d24cf5ca clk: qcom: clk-rcg2: Fix clock rate=
 overflow for high parent frequencies
> >> > > > > > > > > >     b64683f5d728 spi: tegra: Fix missing IRQ check i=
n tegra_slink_probe()
> >> > > > > > > > > >     b13e8b38be51 regmap: debugfs: Fix a erroneous ch=
eck after snprintf()
> >> > > > > > > > > >     8fafac407346 ipvlan: properly track tx_errors
> >> > > > > > > > > >     3eedc19a9d0f net: add DEV_STATS_READ() helper
> >> > > > > > > > > >     359bce81b841 ipv6: avoid atomic fragment on GSO =
packets
> >> > > > > > > > > >     6b413d52f6ab ACPI: sysfs: Fix create_pnp_modalia=
s() and create_of_modalias()
> >> > > > > > > > > >     32aaa3b98789 wifi: iwlwifi: empty overflow queue=
 during flush
> >> > > > > > > > > >     0e3ad00be4e8 wifi: iwlwifi: pcie: synchronize IR=
Qs before NAPI
> >> > > > > > > > > >     a8ebe549e0ce wifi: iwlwifi: call napi_synchroniz=
e() before freeing rx/tx queues
> >> > > > > > > > > >     627a3b3f5c80 iwlwifi: pcie: adjust to Bz complet=
ion descriptor
> >> > > > > > > > > >     0d91506a40ec tcp: fix cookie_init_timestamp() ov=
erflows
> >> > > > > > > > > >     4f6e904ed4e3 chtls: fix tp->rcv_tstamp initializ=
ation
> >> > > > > > > > > >     5d7bec7ae4db r8169: fix rare issue with broken r=
x after link-down on RTL8125
> >> > > > > > > > > >     e143a3c82d33 r8169: use tp_to_dev instead of ope=
n code
> >> > > > > > > > > >     3a8f4e58e1ee thermal: core: prevent potential st=
ring overflow
> >> > > > > > > > > >     bfd4ed4988aa netfilter: nf_tables: Drop pointles=
s memset when dumping rules
> >> > > > > > > > > >     80986257d2cd PM / devfreq: rockchip-dfi: Make pm=
u regmap mandatory
> >> > > > > > > > > >     826120c9ba68 can: dev: can_put_echo_skb(): don't=
 crash kernel if can_priv::echo_skb is accessed out of bounds
> >> > > > > > > > > >     28e9e015916e can: dev: can_restart(): fix race c=
ondition between controller restart and netif_carrier_on()
> >> > > > > > > > > >     ada4dc4788f1 can: dev: can_restart(): don't cras=
h kernel if carrier is OK
> >> > > > > > > > > >     d4eb4182a823 wifi: rtlwifi: fix EDCA limit set b=
y BT coexistence
> >> > > > > > > > > >     2027e74150ee tcp_metrics: do not create an entry=
 from tcp_init_metrics()
> >> > > > > > > > > >     3f7cb7c47ce0 tcp_metrics: properly set tp->snd_s=
sthresh in tcp_init_metrics()
> >> > > > > > > > > >     ca7b6fa9e61a tcp_metrics: add missing barriers o=
n delete
> >> > > > > > > > > >     227709a0e47c wifi: mt76: mt7603: improve stuck b=
eacon handling
> >> > > > > > > > > >     eab5b0aa5065 mt76: pass original queue id from _=
_mt76_tx_queue_skb to the driver
> >> > > > > > > > > >     75336a762539 mt76: add support for overriding th=
e device used for DMA mapping
> >> > > > > > > > > >     77b2ab5cd1a4 mt76: dma: use kzalloc instead of d=
evm_kzalloc for txwi
> >> > > > > > > > > >     064b32f18db1 wifi: mt76: mt7603: rework/fix rx p=
se hang check
> >> > > > > > > > > >     1afbb9ececd3 wifi: rtw88: debug: Fix the NULL vs=
 IS_ERR() bug for debugfs_create_file()
> >> > > > > > > > > >     ebcbf5f5e047 net: spider_net: Use size_add() in =
call to struct_size()
> >> > > > > > > > > >     56e7424c6efc tipc: Use size_add() in calls to st=
ruct_size()
> >> > > > > > > > > >     3e51efcb2909 mlxsw: Use size_mul() in call to st=
ruct_size()
> >> > > > > > > > > >     dc3fef310732 gve: Use size_add() in call to stru=
ct_size()
> >> > > > > > > > > >     70f032db8516 tcp: call tcp_try_undo_recovery whe=
n an RTOd TFO SYNACK is ACKed
> >> > > > > > > > > >     a2d540c74549 udp: add missing WRITE_ONCE() aroun=
d up->encap_rcv
> >> > > > > > > > > >     8f7eef3a13df selftests/bpf: Correct map_fd to da=
ta_fd in tailcalls
> >> > > > > > > > > >     3eefb2fbf4ec selftests/bpf: Test tail call count=
ing with bpf2bpf and data on stack
> >> > > > > > > > > >     ab91992ec4d4 i40e: fix potential memory leaks in=
 i40e_remove()
> >> > > > > > > > > >     702742373650 genirq/matrix: Exclude managed inte=
rrupts in irq_matrix_allocated()
> >> > > > > > > > > >     379b120e4f27 pstore/platform: Add check for kstr=
dup
> >> > > > > > > > > >     81b8638e4ef4 x86/boot: Fix incorrect startup_gdt=
_descr.size
> >> > > > > > > > > >     c7e8c7452e5a x86/sev-es: Allow copy_from_kernel_=
nofault() in earlier boot
> >> > > > > > > > > >     0b5da8ce0f18 x86: Share definition of __is_canon=
ical_address()
> >> > > > > > > > > >     90b263db856d futex: Don't include process MM in =
futex key on no-MMU
> >> > > > > > > > > >     f0d6e5841172 x86/srso: Fix SBPB enablement for (=
possible) future fixed HW
> >> > > > > > > > > >     565f9337b68e writeback, cgroup: switch inodes wi=
th dirty timestamps to release dying cgwbs
> >> > > > > > > > > >     2bb46b20825d vfs: fix readahead(2) on block devi=
ces
> >> > > > > > > > > >     20195f87db19 sched: Fix stop_one_cpu_nowait() vs=
 hotplug
> >> > > > > > > > > >     13cde955e52e sched/uclamp: Ignore (util =3D=3D 0=
) optimization in feec() when p_util_max =3D 0
> >> > > > > > > > > >     cc6198ff20c0 iov_iter, x86: Be consistent about =
the __user tag on copy_mc_to_user()
> >> > > > > > > > > >     80529b4968a8 Linux 5.15.138
> >> > > > > > > > > >     3d8344a7c4a3 ALSA: hda: intel-dsp-config: Fix JS=
L Chromebook quirk detection
> >> > > > > > > > > >     f049c0c0037d misc: pci_endpoint_test: Add device=
ID for J721S2 PCIe EP device support
> >> > > > > > > > > >     28b8ad8ccecd tty: 8250: Add Brainboxes Oxford Se=
miconductor-based quirks
> >> > > > > > > > > >     44c4dfac3f02 tty: 8250: Add support for Intashie=
ld IX cards
> >> > > > > > > > > >     d541ccb34de2 tty: 8250: Add support for addition=
al Brainboxes PX cards
> >> > > > > > > > > >     60debc01fcbb tty: 8250: Fix up PX-803/PX-857
> >> > > > > > > > > >     1f5649aed527 tty: 8250: Fix port count of PX-257
> >> > > > > > > > > >     3fe3cc63c730 tty: 8250: Add support for Intashie=
ld IS-100
> >> > > > > > > > > >     a5b6390fd609 tty: 8250: Add support for Brainbox=
es UP cards
> >> > > > > > > > > >     738fe41b6443 tty: 8250: Add support for addition=
al Brainboxes UC cards
> >> > > > > > > > > >     ff6059c3d234 tty: 8250: Remove UC-257 and UC-431
> >> > > > > > > > > >     81a4dd5e6c78 tty: n_gsm: fix race condition in s=
tatus line change on dead connections
> >> > > > > > > > > >     e25197747f0e usb: raw-gadget: properly handle in=
terrupted requests
> >> > > > > > > > > >     e5f53a68a596 usb: typec: tcpm: Fix NULL pointer =
dereference in tcpm_pd_svdm()
> >> > > > > > > > > >     7c4855b22a3f usb: storage: set 1.50 as the lower=
 bcdDevice for older "Super Top" compatibility
> >> > > > > > > > > >     c48aae53850c PCI: Prevent xHCI driver from claim=
ing AMD VanGogh USB3 DRD device
> >> > > > > > > > > >     6628c3627c02 drm/amd: Disable ASPM for VI w/ all=
 Intel systems
> >> > > > > > > > > >     b6c3c7786e24 drm/amd: Move helper for dynamic sp=
eed switch check out of smu13
> >> > > > > > > > > >     9015169f00ee can: isotp: isotp_sendmsg(): fix TX=
 state detection and wait behavior
> >> > > > > > > > > >     d72ff6478323 can: isotp: isotp_bind(): do not va=
lidate unused address information
> >> > > > > > > > > >     e163ad6a8639 can: isotp: add local echo tx proce=
ssing and tx without FC
> >> > > > > > > > > >     b4e78ea26638 can: isotp: handle wait_event_inter=
ruptible() return values
> >> > > > > > > > > >     2fc6f337257f can: isotp: check CAN address famil=
y in isotp_bind()
> >> > > > > > > > > >     f8c3bd211cf3 can: isotp: isotp_bind(): return -E=
INVAL on incorrect CAN ID formatting
> >> > > > > > > > > >     615c4dd64050 can: isotp: set max PDU size to 64 =
kByte
> >> > > > > > > > > >     6627b96851f1 powerpc/mm: Fix boot crash with FLA=
TMEM
> >> > > > > > > > > >     f0f998648887 r8152: Check for unplug in r8153b_u=
ps_en() / r8153c_ups_en()
> >> > > > > > > > > >     78c939a88729 r8152: Check for unplug in rtl_phy_=
patch_request()
> >> > > > > > > > > >     51cc28ce742e net: chelsio: cxgb4: add an error c=
ode check in t4_load_phy_fw
> >> > > > > > > > > >     bbc926199321 platform/mellanox: mlxbf-tmfifo: Fi=
x a warning message
> >> > > > > > > > > >     db4416ea3a5d scsi: mpt3sas: Fix in error path
> >> > > > > > > > > >     d48b2e8189d5 fbdev: uvesafb: Call cn_del_callbac=
k() at the end of uvesafb_exit()
> >> > > > > > > > > >     e39440c3268b drm/ttm: Reorder sys manager cleanu=
p step
> >> > > > > > > > > >     aade33d3d9bb ASoC: rt5650: fix the wrong result =
of key button
> >> > > > > > > > > >     fa32e21c0568 netfilter: nfnetlink_log: silence b=
ogus compiler warning
> >> > > > > > > > > >     dfcbb983eb6e spi: npcm-fiu: Fix UMA reads when d=
ummy.nbytes =3D=3D 0
> >> > > > > > > > > >     64ae128b095d fs/ntfs3: Avoid possible memory lea=
k
> >> > > > > > > > > >     27a0bed1285e fs/ntfs3: Fix directory element typ=
e detection
> >> > > > > > > > > >     94524980ee75 fs/ntfs3: Fix NULL pointer derefere=
nce on error in attr_allocate_frame()
> >> > > > > > > > > >     2de328398b50 fs/ntfs3: Fix possible NULL-ptr-der=
ef in ni_readpage_cmpr()
> >> > > > > > > > > >     962a3d3d731c fs/ntfs3: Use kvmalloc instead of k=
malloc(... __GFP_NOWARN)
> >> > > > > > > > > >     393966e79ba1 fs/ntfs3: Write immediately updated=
 ntfs state
> >> > > > > > > > > >     59e629fc7157 fs/ntfs3: Add ckeck in ni_update_pa=
rent()
> >> > > > > > > > > >     738a3adc7c8b fbdev: atyfb: only use ioremap_uc()=
 on i386 and ia64
> >> > > > > > > > > >     afef8af919d2 Input: synaptics-rmi4 - handle rese=
t delay when using SMBus trsnsport
> >> > > > > > > > > >     abc62fc06d4a powerpc/85xx: Fix math emulation ex=
ception
> >> > > > > > > > > >     4bdde4dca00e dmaengine: ste_dma40: Fix PM disabl=
e depth imbalance in d40_probe
> >> > > > > > > > > >     39d2c10367a8 irqchip/stm32-exti: add missing DT =
IRQ flag translation
> >> > > > > > > > > >     c57aef9075e0 irqchip/riscv-intc: Mark all INTC n=
odes as initialized
> >> > > > > > > > > >     eb99b6e204cd net: sched: cls_u32: Fix allocation=
 size in u32_init()
> >> > > > > > > > > >     5e78ebe7c1db ASoC: simple-card: fixup asoc_simpl=
e_probe() error handling
> >> > > > > > > > > >     65fd21aa3805 x86: Fix .brk attribute in linker s=
cript
> >> > > > > > > > > >     d4c8bf5635c4 rpmsg: Fix possible refcount leak i=
n rpmsg_register_device_override()
> >> > > > > > > > > >     a82e0fda8a2f rpmsg: glink: Release driver_overri=
de
> >> > > > > > > > > >     bfd4a664ddfb rpmsg: Fix calling device_lock() on=
 non-initialized device
> >> > > > > > > > > >     2e76b4f6218c rpmsg: Fix kfree() of static memory=
 on setting driver_override
> >> > > > > > > > > >     5c0da71871d3 rpmsg: Constify local variable in f=
ield store macro
> >> > > > > > > > > >     389190b25472 driver: platform: Add helper for sa=
fer setting of driver_override
> >> > > > > > > > > >     37ffa428d58c objtool/x86: add missing embedded_i=
nsn check
> >> > > > > > > > > >     f031e15d0bb8 ext4: avoid overlapping preallocati=
ons due to overflow
> >> > > > > > > > > >     f2c3a3aa6f11 ext4: fix BUG in ext4_mb_new_inode_=
pa() due to overflow
> >> > > > > > > > > >     7a992726f727 ext4: add two helper functions exte=
nt_logical_end() and pa_logical_end()
> >> > > > > > > > > >     9e78e7709f7d x86/mm: Fix RESERVE_BRK() for older=
 binutils
> >> > > > > > > > > >     d3201c718058 x86/mm: Simplify RESERVE_BRK()
> >> > > > > > > > > >     897b56acf126 x86/i8259: Skip probing when ACPI/M=
ADT advertises PCAT compatibility
> >> > > > > > > > > >     77db87c4a4ed gve: Fix GFP flags when allocing pa=
ges
> >> > > > > > > > > >     8b424bdf6c9c iio: afe: rescale: Accept only offs=
et channels
> >> > > > > > > > > >     c1eeb494f684 iio: afe: rescale: add offset suppo=
rt
> >> > > > > > > > > >     7c76b7db5521 iio: afe: rescale: expose scale pro=
cessing function
> >> > > > > > > > > >     c60671502dc2 iio: afe: rescale: reorder includes
> >> > > > > > > > > >     27dd09f5ec7f clk: Sanitize possible_parent_show =
to Handle Return Value of of_clk_get_parent_name
> >> > > > > > > > > >     c27ca4aebbee sparc32: fix a braino in fault hand=
ling in csum_and_copy_..._user()
> >> > > > > > > > > >     21b07a2e6095 perf/core: Fix potential NULL deref
> >> > > > > > > > > >     6efd498009b9 nvmem: imx: correct nregs for i.MX6=
UL
> >> > > > > > > > > >     0c2948118c34 nvmem: imx: correct nregs for i.MX6=
SLL
> >> > > > > > > > > >     6e22bf6f00d5 nvmem: imx: correct nregs for i.MX6=
ULL
> >> > > > > > > > > >     e0f95b831b4a misc: fastrpc: Clean buffers on rem=
ote invocation failures
> >> > > > > > > > > >     c4957f00f9e2 tracing/kprobes: Fix the descriptio=
n of variable length arguments
> >> > > > > > > > > >     cdc57093b470 i2c: aspeed: Fix i2c bus hang in sl=
ave read
> >> > > > > > > > > >     e97d374a2506 i2c: stm32f7: Fix PEC handling in c=
ase of SMBUS transfers
> >> > > > > > > > > >     2766a872103b i2c: muxes: i2c-demux-pinctrl: Use =
of_get_i2c_adapter_by_node()
> >> > > > > > > > > >     48b58f7469e5 i2c: muxes: i2c-mux-gpmux: Use of_g=
et_i2c_adapter_by_node()
> >> > > > > > > > > >     cb65e692765b i2c: muxes: i2c-mux-pinctrl: Use of=
_get_i2c_adapter_by_node()
> >> > > > > > > > > >     eace761f35a1 iio: adc: xilinx-xadc: Correct temp=
erature offset/scale for UltraScale
> >> > > > > > > > > >     70322a446ef2 iio: adc: xilinx-xadc: Don't clobbe=
r preset voltage/temperature thresholds
> >> > > > > > > > > >     3c1312b5d49a iio: exynos-adc: request second int=
erupt only when touchscreen mode is used
> >> > > > > > > > > >     4e14f2d5885f kasan: print the original fault add=
r when access invalid shadow
> >> > > > > > > > > >     bdfa4fa7588d i40e: Fix wrong check for I40E_TXR_=
FLAGS_WB_ON_ITR
> >> > > > > > > > > >     d5c175f4cea6 gtp: fix fragmentation needed check=
 with gso
> >> > > > > > > > > >     c0dad0c0924c gtp: uapi: fix GTPA_MAX
> >> > > > > > > > > >     852fb4ce426d tcp: fix wrong RTO timeout when rec=
eived SACK reneging
> >> > > > > > > > > >     83cfa3b51a78 r8152: Release firmware if we have =
an error in probe
> >> > > > > > > > > >     e0f9231ccd6c r8152: Cancel hw_phy_work if we hav=
e an error in probe
> >> > > > > > > > > >     ff42b0a55659 r8152: Run the unload routine if we=
 have errors during probe
> >> > > > > > > > > >     6fa3b9f9478e r8152: Increase USB control msg tim=
eout to 5000ms as per spec
> >> > > > > > > > > >     76873f2eadc0 net: usb: smsc95xx: Fix uninit-valu=
e access in smsc95xx_read_reg
> >> > > > > > > > > >     6afd112c3f95 net: ieee802154: adf7242: Fix some =
potential buffer overflow in adf7242_stats_show()
> >> > > > > > > > > >     46cd35e4e774 igc: Fix ambiguity in the ethtool a=
dvertising
> >> > > > > > > > > >     49529413eaed neighbour: fix various data-races
> >> > > > > > > > > >     667554946360 igb: Fix potential memory leak in i=
gb_add_ethtool_nfc_entry
> >> > > > > > > > > >     263421905346 treewide: Spelling fix in comment
> >> > > > > > > > > >     bc0c4bc119d2 i40e: Fix I40E_FLAG_VF_VLAN_PRUNING=
 value
> >> > > > > > > > > >     c532c5df01ad r8169: fix the KCSAN reported data =
race in rtl_rx while reading desc->opts1
> >> > > > > > > > > >     6afb294c88c6 r8169: fix the KCSAN reported data-=
race in rtl_tx while reading TxDescArray[entry].opts1
> >> > > > > > > > > >     9d7b3838428c r8169: fix the KCSAN reported data-=
race in rtl_tx() while reading tp->cur_tx
> >> > > > > > > > > >     04dbfa4122e0 firmware/imx-dsp: Fix use_after_fre=
e in imx_dsp_setup_channels()
> >> > > > > > > > > >     0d587b86cd0d drm/dp_mst: Fix NULL deref in get_m=
st_branch_device_by_guid_helper()
> >> > > > > > > > > >     8860f0175e51 vsock/virtio: initialize the_virtio=
_vsock before using VQs
> >> > > > > > > > > >     762c251c7f5c vsock/virtio: add support for devic=
e suspend/resume
> >> > > > > > > > > >     1e02df6f6907 vsock/virtio: factor our the code t=
o initialize and delete VQs
> >> > > > > > > > > >     15a8cac3c250 drm/i915/pmu: Check if pmu is close=
d before stopping event
> >> > > > > > > > > >     43bd431a5dd9 nfsd: lock_rename() needs both dire=
ctories to live on the same fs
> >> > > > > > > > > >     556b68d9b95f mm/migrate: fix do_pages_move for c=
ompat pointers
> >> > > > > > > > > >     c4071c6114de mm/page_alloc: correct start page w=
hen guard page debug is enabled
> >> > > > > > > > > >     3a6cee2bfb53 vhost: Allow null msg.size on VHOST=
_IOTLB_INVALIDATE
> >> > > > > > > > > >     fbc9a8718f31 virtio-mmio: fix memory leak of vm_=
dev
> >> > > > > > > > > >     862a356bc986 virtio_balloon: Fix endless deflati=
on and inflation on arm64
> >> > > > > > > > > >     41bb770e42bc mcb-lpc: Reallocate memory region t=
o avoid memory overlapping
> >> > > > > > > > > >     f2ac8b2643dd mcb: Return actual parsed size when=
 reading chameleon table
> >> > > > > > > > > >     90918ef995b5 mptcp: more conservative check for =
zero probes
> >> > > > > > > > > >     fd2b2dab6f5b tcp: cleanup tcp_remove_empty_skb()=
 use
> >> > > > > > > > > >     68342755b9b2 tcp: remove dead code from tcp_send=
msg_locked()
> >> > > > > > > > > >     0f482ad7b1a5 pinctrl: qcom: lpass-lpi: fix concu=
rrent register updates
> >> > > > > > > > > >     51b054f6fe01 ASoC: codecs: wcd938x: fix runtime =
PM imbalance on remove
> >> > > > > > > > > >     cb34f4e79e54 ASoC: codecs: wcd938x: fix resource=
 leaks on bind errors
> >> > > > > > > > > >     12952a23a5da Linux 5.15.137
> >> > > > > > > > > >     dff33880d40a xfrm6: fix inet6_dev refcount under=
flow problem
> >> > > > > > > > > >     5a9d05a4f1c3 Bluetooth: hci_sock: Correctly boun=
ds check and pad HCI_MON_NEW_INDEX name
> >> > > > > > > > > >     a6df96ee0b45 Bluetooth: hci_sock: fix slab oob r=
ead in create_monitor_event
> >> > > > > > > > > >     c08d609fb2b6 phy: mapphone-mdm6600: Fix pinctrl_=
pm handling for sleep pins
> >> > > > > > > > > >     e1b030b101f6 phy: mapphone-mdm6600: Fix runtime =
PM for remove
> >> > > > > > > > > >     59f1095ab58e phy: mapphone-mdm6600: Fix runtime =
disable on probe
> >> > > > > > > > > >     b618062c0b13 serial: 8250: omap: Move uart_write=
() inside PM section
> >> > > > > > > > > >     67f29cd2f851 ASoC: pxa: fix a memory leak in pro=
be()
> >> > > > > > > > > >     76d04c339508 gpio: vf610: set value before the d=
irection to avoid a glitch
> >> > > > > > > > > >     4b129e3964b3 platform/x86: asus-wmi: Map 0x2a co=
de, Ignore 0x2b and 0x2c events
> >> > > > > > > > > >     e1a058cc2467 platform/x86: asus-wmi: Change ASUS=
_WMI_BRN_DOWN code from 0x20 to 0x2e
> >> > > > > > > > > >     c6bbe51dcdf3 platform/surface: platform_profile:=
 Propagate error if profile registration fails
> >> > > > > > > > > >     a73c8d716938 s390/cio: fix a memleak in css_allo=
c_subchannel
> >> > > > > > > > > >     c8b6c2df1e7d selftests/ftrace: Add new test case=
 which checks non unique symbol
> >> > > > > > > > > >     3ad81e6affcb s390/pci: fix iommu bitmap allocati=
on
> >> > > > > > > > > >     71d224acc4d1 perf: Disallow mis-matched inherite=
d group reads
> >> > > > > > > > > >     5aa89a11a2a6 USB: serial: option: add Fibocom to=
 DELL custom modem FM101R-GL
> >> > > > > > > > > >     8c376d863618 USB: serial: option: add entry for =
Sierra EM9191 with new firmware
> >> > > > > > > > > >     483221216176 USB: serial: option: add Telit LE91=
0C4-WWX 0x1035 composition
> >> > > > > > > > > >     e750fb71dc6a nvme-rdma: do not try to stop unall=
ocated queues
> >> > > > > > > > > >     a9fd6d44abbc nvme-pci: add BOGUS_NID for Intel 0=
a54 device
> >> > > > > > > > > >     071382bda1da ACPI: irq: Fix incorrect return val=
ue in acpi_register_gsi()
> >> > > > > > > > > >     431a5010bce2 NFSv4.1: fixup use EXCHGID4_FLAG_US=
E_PNFS_DS for DS server
> >> > > > > > > > > >     5762e72ef1b0 pNFS: Fix a hang in nfs4_evict_inod=
e()
> >> > > > > > > > > >     5a3abee2eee9 Revert "pinctrl: avoid unsafe code =
pattern in find_pinctrl()"
> >> > > > > > > > > >     24959825377f mmc: core: Capture correct oemid-bi=
ts for eMMC cards
> >> > > > > > > > > >     8041e7b7e7e9 mmc: core: sdio: hold retuning if s=
dio in 1-bit mode
> >> > > > > > > > > >     262029c0c58c mmc: mtk-sd: Use readl_poll_timeout=
_atomic in msdc_reset_hw
> >> > > > > > > > > >     3e363db1c13a mtd: physmap-core: Restore map_rom =
fallback
> >> > > > > > > > > >     71823463b1b2 mtd: spinand: mic
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196797): https://lists.openembedded.org/g/openembedde=
d-core/message/196797
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

