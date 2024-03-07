Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B8AC48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 14:34:30 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.24509.1709822059969840125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 06:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=YOt6sM1M;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.171, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso696936276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 06:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709822059; x=1710426859; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0zVhdQWzT7FKVOXqQvO4SG3XXW2odSOlg1sbIs7G/DU=;
        b=YOt6sM1MPu+a8aEJrrgxPC5JpVhez5tqr2zg1OUZfgAAnky77Hsgmmi8w/ogTOanjw
         44w3B4LKskRKOLf1rwOWvC5FJEUSsDTOfJzoKQmspvV9ig1NayeOXLJDOlQlNQ2SLj0I
         wPfUYa61ZKdvHYEN/e3PaEIJCTgac1GiLD9NuiYwr2lt+NjQeqzcfx3oWVSj+z66LbPP
         hUbiA2B/LjUx9HXgdSQCUw7FNV+ayjVr8MOYJdfzBApYwVC69jkALPPBouj77Xj8UfDL
         BkWlAxuu4MOZMyF9MUSN0jLxTtgqKcv0IaXUa6zneyAjrVinK6BIgBumLHjowg5RZhhx
         ZJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709822059; x=1710426859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zVhdQWzT7FKVOXqQvO4SG3XXW2odSOlg1sbIs7G/DU=;
        b=ENce9VdW31lF6n3weu9BLrC/MD/5wSsPtPCRpSvfY4Oe5nQpO7Dk8++Z1HSx/SrrHQ
         esl9dH37p9ay/RDuXHhHdZa27d5Q1jhWlrDXcw+axnJ5pbRfwGFxDeSwbo6/+H5B2HAy
         Lks4atlv+/oux5KV9jQRP4+m4HNEvJKuXfE+Jd0uytP0RhGpPAvW3WJYenM5d3snLYwl
         WFyIs8Qlk90n3BNAlPQWrUNSt5Ti/CL4X+Fu6VF9oBq47dbbE/069eYrnCLPLLdM1Zim
         eBDfgFwaSROklr11UYgiij+BYh8+rJgMd6gyzPYPgPo6CaRmgHe47bh05P2NCPwqDNzy
         cjJg==
X-Gm-Message-State: AOJu0YyB8HXsna+JkU7CbsHgx9cwQQszgKJt4dv3nii6htMgVi1gPnAT
	1f+1BtAKU64EGGQJkr2Tqd/IQ7xj7gTQ4nd2/DTMeDNXc1ulCmk6sp6wLrOZh+vykXsyabDNiCg
	FZwucMZpF/y1OMQTn2QfWuqU4Ip7BY3K56IKBRrTlEAd5EPphSKU=
X-Google-Smtp-Source: AGHT+IEnlfUhsu0wNOUj2Ifpa6eJO+qEdC0RMvZq7VDTpKEZJqYQFkRNkNX7N5umuPaDCnHlvjqe8NpTFZQ+gpZ0XbI=
X-Received: by 2002:a25:d34d:0:b0:dc7:45d3:ffd0 with SMTP id
 e74-20020a25d34d000000b00dc745d3ffd0mr15960412ybf.1.1709822058595; Thu, 07
 Mar 2024 06:34:18 -0800 (PST)
MIME-Version: 1.0
References: <20231205044036.4163615-1-bruce.ashfield@gmail.com>
 <20231205044036.4163615-5-bruce.ashfield@gmail.com> <CAOSpxdZU+CoRTo=Xz+C3dk44ubHLSa7pis7sa4CyVMGJnY1_EA@mail.gmail.com>
 <CAOSpxdYcFTMY-m9TDB-wAVXu70v5DkmGfH8UjH2dLKDY-x0AbA@mail.gmail.com>
 <CADkTA4NhG1AciK=QkaYiajfXfuqc1YQ9=qJBssoKSQh4GOMcvQ@mail.gmail.com>
 <17BA3874E3FB1D6A.21429@lists.openembedded.org> <CAOSpxdYFR72uWeix5mKTJY5R-bewDQO0jMh5obByiz0h7WgDyw@mail.gmail.com>
 <CADkTA4O-F7qr2GU1cK_zd7zD9LpCKm-RrMRgkRjY6F2ZOemn5g@mail.gmail.com>
 <17BA7F82CF20F029.10210@lists.openembedded.org> <CAOSpxdYLfPpsop4C7c6DYE5bbbTh6LovcKZ5YuSb7ph6jwyA+g@mail.gmail.com>
 <CADkTA4PYyJL3Yt-NkHejT9049NVA0BnMBTS1CDe+PjyeB6znbw@mail.gmail.com>
In-Reply-To: <CADkTA4PYyJL3Yt-NkHejT9049NVA0BnMBTS1CDe+PjyeB6znbw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 7 Mar 2024 04:34:07 -1000
Message-ID: <CAOSpxdaNKNYWwDfi7NnC+ky9=ycbevQtNRzA2QFQt9ph-L5L-A@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 4/4] linux-yocto/5.15: update to v5.15.141
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006eac74061312f837"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 14:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196796

--0000000000006eac74061312f837
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 7, 2024, 4:29=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmail.c=
om>
wrote:

> On Thu, Mar 7, 2024 at 9:00=E2=80=AFAM Steve Sakoman <steve@sakoman.com> =
wrote:
> >
> > On Thu, Mar 7, 2024 at 3:46=E2=80=AFAM Steve Sakoman via
> > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> > wrote:
> > >
> > > On Wed, Mar 6, 2024 at 7:42=E2=80=AFAM Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> > > >
> > > > On Wed, Mar 6, 2024 at 12:38=E2=80=AFPM Steve Sakoman <steve@sakoma=
n.com>
> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On Wed, Mar 6, 2024 at 6:04=E2=80=AFAM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org> wrote=
:
> > > > > >
> > > > > > On Wed, Mar 6, 2024 at 5:59=E2=80=AFAM Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> > > > > > >
> > > > > > > On Wed, Mar 6, 2024 at 10:43=E2=80=AFAM Steve Sakoman <
> steve@sakoman.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM Steve Sakoman <
> steve@sakoman.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Bruce,
> > > > > > > > >
> > > > > > > > > The 5.10 version bumps look fine in testing, but sadly
> this 5.15
> > > > > > > > > version bump breaks qemux86-64-ptest:
> > > > > > > > >
> > > > > > > > > AssertionError: Failed ptests:
> > > > > > > > > {'parted': ['t1104-remove-and-add-partition.sh',
> > > > > > > > >             't8000-loop.sh',
> > > > > > > > >             't8001-loop-blkpg.sh']}
> > > > > > > > >
> > > > > > > > > Failure is reproducible 100% of the time, so there is tha=
t
> ...
> > > > > > > >
> > > > > > > > After  wading through the hundreds of changes in this
> version bump
> > > > > > > > from 5.15.124 to 5.15.141 I found this in the 5.13.132
> portion that
> > > > > > > > looks suspicious:
> > > > > > > >
> > > > > > > > 072cd213c64f block: don't add or resize partition on the
> disk with
> > > > > > > > GENHD_FL_NO_PART
> > > > > > > > c6ce1c5dd327 block: rename GENHD_FL_NO_PART_SCAN to
> GENHD_FL_NO_PART
> > > > > > > >
> > > > > > >
> > > > > > > It could very well be that, I haven't been able to get to any
> local
> > > > > > > testing on this
> > > > > > > yet.
> > > > > > >
> > > > > > > I will go look at parted for commits that indicate they are
> fixing a
> > > > > > > kernel interface
> > > > > > > that sounds similar .. since we don't want to revert an
> offending commit, the
> > > > > > > way to fix this is via selective update of parted.
> > > > > >
> > > > > > I'm doing a test kirkstone build that bumps parted to the same
> version
> > > > > > as in master.
> > > > > >
> > > > > > This will at least let us know whether it has been fixed in
> upstream parted.
> > > > >
> > > > > The test completed and I get the same failure with the most recen=
t
> parted version.
> > > > >
> > > > > So apparently not fixed in parted.
> > > >
> > > > Which means that the newer kernels have some sort of additional fix
> or a revert.
> > > >
> > > > I'll have a look for that as well.
> > >
> > > From looking at how Ubuntu deals with this
> > > (https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2056143):
> > >
> > > -- Impact --
> > > In 22.04/Jammy with the GA 5.15 kernel there was an upstream change
> > > preventing partition table operations when GENHD_FL_NO_PART is set.
> > >  1a721de8489f "block: don't add or resize partition on the disk with
> > > GENHD_FL_NO_PART"
> > > Beside of changing return codes and breaking some user-space that way
> > > this also causes loop block devices to no longer be able to have
> > > partitions manually created. This is because the loop block driver
> > > uses GENHD_FL_NO_PART to prevent active partition scans.
> > >
> > > -- Fix --
> > > This was changed in 5.19 (and thus Mantic is not affected) by
> > > introducing a separate flag to prevent those scans:
> > >  b9684a71fca7 "block, loop: support partitions without scanning"
> > > The fix depends on a larger rewrite so it cannot be simply picked. Th=
e
> > > biggest change from the original is moving the check for the new flag
> > > into a helper function in genhd.h which checks whether a disk should
> > > be scanned for partitions. That function was dropped with the upstrea=
m
> > > rewrite and checking moved into the loop driver directly. But it felt
> > > like adjusting the helper was the better approach.
> > >
> > > Note: The upstream patch has a follow-up change submitted:
> > >   748008e1da92 "block: don't add partitions if GD_SUPPRESS_PART_SCAN
> is set"
> > > We do _NOT_ need that in Jammy/5.15 because block/partitions/core.c:
> > > blk_add_partitions() checks disk_part_scan_enabled() which was where
> > > we added the check for the backport instead of modifying
> > > disk_scan_partitions() directly.
> >
> > Forgot to add this:
> >
> >
> https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/jammy/=
commit/?h=3Dmaster-next--2024.03.04-1&id=3Dc3032b60ff7b3948325b8f2bd688b9a7=
4be3cfb9
> >
>
> Assuming that I'm reading the summary correctly, I'm inclined to
> cherry pick 748008e1da92 [ block: don't add partitions if
> GD_SUPPRESS_PART_SCAN is set]
> into the linux-yocto 5.15 kernel branches.
>
> The commit referenced in the link above doesn't cherry-pick cleanly
> (it seems tangled
> up in other Ubuntu kernel changes), but 748008e1da92 is simple and
> does cherry-pick
> without any fuss.
>
> I never did get set up to run the tests myself, but I can send you SRCREV
> bumps
> with 748008e1da92 merged into the tree. That's the fastest route to
> get it tested.
> Alternatively, we wait for me to get a test environment setup or it
> could even be a
> SRC_URI patch (versus me merging it).
>
> Worst thing that can happen if I merge it, is that it doesn't fix the
> problem and I do
> a revert, or just stack more changes on top to fix the problem.
>
> Let me know your preference, and I'll pull something together.
>


I can try a SRC_URI patch first to see if it solves the issue.

Steve


> Bruce
>
>
> > Steve
> >
> > > > > > > > > On Mon, Dec 4, 2023 at 6:40=E2=80=AFPM <bruce.ashfield@gm=
ail.com>
> wrote:
> > > > > > > > > >
> > > > > > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > > > > >
> > > > > > > > > > Updating  to the latest korg -stable release that
> comprises
> > > > > > > > > > the following commits:
> > > > > > > > > >
> > > > > > > > > >     9b91d36ba301 Linux 5.15.141
> > > > > > > > > >     313a34d1c0ee io_uring: fix off-by one bvec index
> > > > > > > > > >     49ae2e4e8ed3 USB: dwc3: qcom: fix wakeup after prob=
e
> deferral
> > > > > > > > > >     eb17fb4b160a USB: dwc3: qcom: fix software node lea=
k
> on probe errors
> > > > > > > > > >     98f0e9b6276f usb: dwc3: set the dma max_seg_size
> > > > > > > > > >     1a3dcb1d811d usb: dwc3: Fix default mode
> initialization
> > > > > > > > > >     a22702a81844 USB: dwc2: write HCINT with INTMASK
> applied
> > > > > > > > > >     1134fde92088 usb: typec: tcpm: Skip hard reset when
> in error recovery
> > > > > > > > > >     64830d041515 USB: serial: option: don't claim
> interface 4 for ZTE MF290
> > > > > > > > > >     9611cbc6a132 USB: serial: option: fix FM101R-GL
> defines
> > > > > > > > > >     a8d80b1fbacf USB: serial: option: add Fibocom L7xx
> modules
> > > > > > > > > >     de8c6fce8d09 usb: cdnsp: Fix deadlock issue during
> using NCM gadget
> > > > > > > > > >     dd0cc4b69f7d bcache: fixup lock c->root error
> > > > > > > > > >     a912742d8411 bcache: fixup init dirty data errors
> > > > > > > > > >     137660f84462 bcache: prevent potential division by
> zero error
> > > > > > > > > >     f7077ce8d97b bcache: check return value from
> btree_node_alloc_replacement()
> > > > > > > > > >     1eed01092101 dm-delay: fix a race between
> delay_presuspend and delay_bio
> > > > > > > > > >     d181a7a1d55d hv_netvsc: Mark VF as slave before
> exposing it to user-mode
> > > > > > > > > >     97683466e24c hv_netvsc: Fix race of
> register_netdevice_notifier and VF register
> > > > > > > > > >     3841921018a2 USB: serial: option: add Luat Air72*U
> series products
> > > > > > > > > >     6062c527d040 s390/dasd: protect device queue agains=
t
> concurrent access
> > > > > > > > > >     35b5d86e43ec io_uring/fs: consider link->flags when
> getting path for LINKAT
> > > > > > > > > >     2bb75a2c3490 bcache: fixup multi-threaded
> bch_sectors_dirty_init() wake-up race
> > > > > > > > > >     6f09318fd90a md: fix bi_status reporting in
> md_end_clone_io
> > > > > > > > > >     72ecb9753cbe bcache: replace a mistaken IS_ERR() by
> IS_ERR_OR_NULL() in btree_gc_coalesce()
> > > > > > > > > >     e09ba90f1ad0 swiotlb-xen: provide the
> "max_mapping_size" method
> > > > > > > > > >     0f05021e937c ACPI: resource: Skip IRQ override on
> ASUS ExpertBook B1402CVA
> > > > > > > > > >     f95e9f7afe86 proc: sysctl: prevent aliased sysctls
> from getting passed to init
> > > > > > > > > >     3f3880fc011c ext4: make sure allocate pending entry
> not fail
> > > > > > > > > >     e33eb4997585 ext4: fix slab-use-after-free in
> ext4_es_insert_extent()
> > > > > > > > > >     859893f61906 ext4: using nofail preallocation in
> ext4_es_insert_extent()
> > > > > > > > > >     048e7f38b31c ext4: using nofail preallocation in
> ext4_es_insert_delayed_block()
> > > > > > > > > >     580b9dd6ab0b ext4: using nofail preallocation in
> ext4_es_remove_extent()
> > > > > > > > > >     66bc78a295b3 ext4: use pre-allocated es in
> __es_remove_extent()
> > > > > > > > > >     b1995ba6269c ext4: use pre-allocated es in
> __es_insert_extent()
> > > > > > > > > >     edec12712ae1 ext4: factor out __es_alloc_extent()
> and __es_free_extent()
> > > > > > > > > >     e82d05cf5ccb ext4: add a new helper to check if es
> must be kept
> > > > > > > > > >     612edd488872 media: qcom: camss: Fix csid-gen2 for
> test pattern generator
> > > > > > > > > >     ceb5276d8c99 media: qcom: camss: Fix set
> CSI2_RX_CFG1_VC_MODE when VC is greater than 3
> > > > > > > > > >     f001e6f62693 media: camss: sm8250: Virtual channels
> for CSID
> > > > > > > > > >     9fb81ca7aa05 media: camss: Replace hard coded value
> with parameter
> > > > > > > > > >     8ef9b32f20ab MIPS: KVM: Fix a build warning about
> variable set but not used
> > > > > > > > > >     6ddaca6b20f7 lockdep: Fix block chain corruption
> > > > > > > > > >     61747778a88b USB: dwc3: qcom: fix ACPI platform
> device leak
> > > > > > > > > >     027472889970 USB: dwc3: qcom: fix resource leaks on
> probe deferral
> > > > > > > > > >     e26c6febac43 nvmet: nul-terminate the NQNs passed i=
n
> the connect command
> > > > > > > > > >     b5d50c6a609d afs: Fix file locking on R/O volumes t=
o
> operate in local mode
> > > > > > > > > >     84ebfbed3ae0 afs: Return ENOENT if no cell DNS
> record can be found
> > > > > > > > > >     6aeac88a45de net: axienet: Fix check for partial TX
> checksum
> > > > > > > > > >     293acba84108 amd-xgbe: propagate the correct speed
> and duplex status
> > > > > > > > > >     b3874cc25a70 amd-xgbe: handle the corner-case durin=
g
> tx completion
> > > > > > > > > >     e949dbc28cd5 amd-xgbe: handle corner-case during sf=
p
> hotplug
> > > > > > > > > >     01a8b94726b1 octeontx2-pf: Fix ntuple rule creation
> to direct packet to VF with higher Rx queue than its PF
> > > > > > > > > >     fcc4a03ad3b1 arm/xen: fix xen_vcpu_info allocation
> alignment
> > > > > > > > > >     90072af9efe8 net/smc: avoid data corruption caused
> by decline
> > > > > > > > > >     66c023469b3e net: usb: ax88179_178a: fix failed
> operations during ax88179_reset
> > > > > > > > > >     ba81c5228ef8 ipv4: Correct/silence an endian warnin=
g
> in __ip_do_redirect
> > > > > > > > > >     364406d4c114 HID: fix HID device resource race
> between HID core and debugging support
> > > > > > > > > >     52badc06b119 HID: core: store the unique system
> identifier in hid_device
> > > > > > > > > >     221be624a55d drm/rockchip: vop: Fix color for
> RGB888/BGR888 format on VOP full
> > > > > > > > > >     b0c835fd7d89 ata: pata_isapnp: Add missing error
> check for devm_ioport_map()
> > > > > > > > > >     9754a498aa5b octeontx2-pf: Fix memory leak during
> interface down
> > > > > > > > > >     be41c0c4a632 wireguard: use DEV_STATS_INC()
> > > > > > > > > >     f163a6d17a95 drm/panel: simple: Fix Innolux
> G101ICE-L01 timings
> > > > > > > > > >     608de3a587eb drm/panel: simple: Fix Innolux
> G101ICE-L01 bus flags
> > > > > > > > > >     18bd108a13cb drm/panel: auo,b101uan08.3: Fine tune
> the panel power sequence
> > > > > > > > > >     9fe5718d3f09 drm/panel: boe-tv101wum-nl6: Fine tune
> the panel power sequence
> > > > > > > > > >     c8a49336e1de afs: Make error on cell lookup failure
> consistent with OpenAFS
> > > > > > > > > >     ac239fccf5a5 afs: Fix afs_server_list to be cleaned
> up with RCU
> > > > > > > > > >     a78d278e01b1 Linux 5.15.140
> > > > > > > > > >     947c9e12ddd6 driver core: Release all resources
> during unbind before updating device links
> > > > > > > > > >     5a434d5c3823 Input: xpad - add VID for Turtle Beach
> controllers
> > > > > > > > > >     cbc7c29dff0f tracing: Have trace_event_file have re=
f
> counters
> > > > > > > > > >     1dcf90c9fa01 powerpc/powernv: Fix fortify source
> warnings in opal-prd.c
> > > > > > > > > >     3d7912710e5e io_uring/fdinfo: lock SQ thread while
> retrieving thread cpu/pid
> > > > > > > > > >     595b051c83a1 drm/amd/display: Change the DMCUB
> mailbox memory location from FB to inbox
> > > > > > > > > >     a2a6e97c4b33 drm/amdgpu: fix error handling in
> amdgpu_bo_list_get()
> > > > > > > > > >     e380992c479b drm/amdgpu: don't use ATRM for externa=
l
> devices
> > > > > > > > > >     4ff985b8810c drm/i915: Fix potential spectre
> vulnerability
> > > > > > > > > >     ea0c4d5ec57f drm/amd/pm: Handle non-terminated
> overdrive commands.
> > > > > > > > > >     9ce842d7762a ext4: add missed brelse in
> update_backups
> > > > > > > > > >     ce19c20064b6 ext4: remove gdb backup copy for meta
> bg in setup_new_flex_group_blocks
> > > > > > > > > >     ac45d8e34bed ext4: correct the start block of
> counting reserved clusters
> > > > > > > > > >     8f9842c4b925 ext4: correct return value of
> ext4_convert_meta_bg
> > > > > > > > > >     8798d3b2722d ext4: correct offset of gdb backup in
> non meta_bg group to update_backups
> > > > > > > > > >     8a3bb38bfdaf ext4: apply umask if ACL support is
> disabled
> > > > > > > > > >     d5c380149b96 Revert "net: r8169: Disable multicast
> filter for RTL8168H and RTL8107E"
> > > > > > > > > >     6ad3d8594d5e media: qcom: camss: Fix missing
> vfe_lite clocks check
> > > > > > > > > >     e0376cf06950 media: qcom: camss: Fix VFE-17x
> vfe_disable_output()
> > > > > > > > > >     8f733387d17f media: qcom: camss: Fix vfe_get() erro=
r
> jump
> > > > > > > > > >     841fc648fbb5 media: qcom: camss: Fix pm_domain_on
> sequence in probe
> > > > > > > > > >     4c9c43f79a12 mmc: sdhci-pci-gli: GL9750: Mask the
> replay timer timeout of AER
> > > > > > > > > >     72bf271c5a77 r8169: fix network lost after resume o=
n
> DASH systems
> > > > > > > > > >     468e3ebf4786 mm: kmem: drop __GFP_NOFAIL when
> allocating objcg vectors
> > > > > > > > > >     0387978fda07 mmc: sdhci-pci-gli: A workaround to
> allow GL9750 to enter ASPM L1.2
> > > > > > > > > >     070b3ccb9b8b riscv: kprobes: allow writing to x0
> > > > > > > > > >     cd0e9f475a46 nfsd: fix file memleak on
> client_opens_release
> > > > > > > > > >     114c9d732cf9 media: ccs: Correctly initialise try
> compose rectangle
> > > > > > > > > >     6c8aeeb2c549 media: venus: hfi: add checks to handl=
e
> capabilities from firmware
> > > > > > > > > >     cdeb0a4cf327 media: venus: hfi: fix the check to
> handle session buffer requirement
> > > > > > > > > >     7d62570f75fe media: venus: hfi_parser: Add check to
> keep the number of codecs within range
> > > > > > > > > >     d0d831e7d68d media: sharp: fix sharp encoding
> > > > > > > > > >     6003733c8f95 media: lirc: drop trailing space from
> scancode transmit
> > > > > > > > > >     e4088d7d8f11 f2fs: avoid format-overflow warning
> > > > > > > > > >     12055238d046 i2c: i801: fix potential race in
> i801_block_transaction_byte_by_byte
> > > > > > > > > >     336e6db5c120 net: phylink: initialize carrier state
> at creation
> > > > > > > > > >     d8cb287d31cb net: dsa: lan9303: consequently
> nested-lock physical MDIO
> > > > > > > > > >     656262cb0f95 net: ethtool: Fix documentation of
> ethtool_sprintf()
> > > > > > > > > >     acca20cc16f3 s390/ap: fix AP bus crash on early
> config change callback invocation
> > > > > > > > > >     019b7d42a416 i2c: designware: Disable TX_EMPTY irq
> while waiting for block length byte
> > > > > > > > > >     c6e89348fd58 sbsa_gwdt: Calculate timeout with
> 64-bit math
> > > > > > > > > >     132670ae9ffb lsm: fix default return value for
> inode_getsecctx
> > > > > > > > > >     223196b50605 lsm: fix default return value for
> vm_enough_memory
> > > > > > > > > >     06d320ca170b Revert "i2c: pxa: move to generic GPIO
> recovery"
> > > > > > > > > >     ddec3d04f874 Revert ncsi: Propagate carrier
> gain/loss events to the NCSI controller
> > > > > > > > > >     ad0b74d0f331 powerpc/pseries/ddw: simplify
> enable_ddw()
> > > > > > > > > >     b3e993de400e arm64: dts: qcom: ipq6018: Fix
> tcsr_mutex register size
> > > > > > > > > >     b99ac20612ca arm64: dts: qcom: ipq6018: switch TCSR
> mutex to MMIO
> > > > > > > > > >     aaf0a07d6088 ksmbd: fix slab out of bounds write in
> smb_inherit_dacl()
> > > > > > > > > >     1c701423bb03 Bluetooth: btusb: Add 0bda:b85b for
> Fn-Link RTL8852BE
> > > > > > > > > >     36a573b32550 Bluetooth: btusb: Add RTW8852BE device
> 13d3:3570 to device tables
> > > > > > > > > >     c4976160a0a4 bluetooth: Add device 13d3:3571 to
> device tables
> > > > > > > > > >     603e77e9e8c0 bluetooth: Add device 0bda:887b to
> device tables
> > > > > > > > > >     e9bb966c50a7 Bluetooth: btusb: Add Realtek RTL8852B=
E
> support ID 0x0cb8:0xc559
> > > > > > > > > >     cf642ee641ce cpufreq: stats: Fix buffer overflow
> detection in trans_stats()
> > > > > > > > > >     63e09cdfe948 regmap: Ensure range selector register=
s
> are updated after cache sync
> > > > > > > > > >     0c49e74e95bf tty: serial: meson: fix hard LOCKUP on
> crtscts mode
> > > > > > > > > >     6f26b6a61b08 serial: meson: Use platform_get_irq()
> to get the interrupt
> > > > > > > > > >     450fa8bf803f ALSA: hda/realtek - Enable internal
> speaker of ASUS K6500ZC
> > > > > > > > > >     cc549ba50bb8 ALSA: hda/realtek - Add Dell ALC295 to
> pin fall back table
> > > > > > > > > >     767c988771cb ALSA: info: Fix potential deadlock at
> disconnection
> > > > > > > > > >     09022ae66261 xhci: Enable RPM on controllers that
> support low-power states
> > > > > > > > > >     68574fe2e488 parisc/pgtable: Do not drop upper 5
> address bits of physical address
> > > > > > > > > >     ea7593c18ff7 parisc: Prevent booting 64-bit kernels
> on PA1.x machines
> > > > > > > > > >     2c9092e8b29a i3c: master: svc: fix SDA keep low whe=
n
> polling IBIWON timeout happen
> > > > > > > > > >     da754f92fc02 i3c: master: svc: fix check wrong
> status register in irq handler
> > > > > > > > > >     5ba77b6b45d6 i3c: master: svc: fix ibi may not
> return mandatory data byte
> > > > > > > > > >     e0a70ed4a580 i3c: master: svc: fix wrong data retur=
n
> when IBI happen during start frame
> > > > > > > > > >     7383675aba2f i3c: master: svc: fix race condition i=
n
> ibi work thread
> > > > > > > > > >     cc7efd1054f4 i3c: master: cdns: Fix reading status
> register
> > > > > > > > > >     d3c6a08c2b77 mtd: cfi_cmdset_0001: Byte swap OTP in=
fo
> > > > > > > > > >     a4668088128d mm/memory_hotplug: use pfn math in
> place of direct struct page manipulation
> > > > > > > > > >     792a796085cf mm/cma: use nth_page() in place of
> direct struct page manipulation
> > > > > > > > > >     9b59fc31226e s390/cmma: fix detection of DAT pages
> > > > > > > > > >     45bb94aab891 dmaengine: stm32-mdma: correct desc
> prep when channel running
> > > > > > > > > >     91659b77e937 mcb: fix error handling for different
> scenarios when parsing
> > > > > > > > > >     534790fde890 tracing: Have the user copy of
> synthetic event address use correct context
> > > > > > > > > >     f6237afabc34 i2c: core: Run atomic i2c xfer when
> !preemptible
> > > > > > > > > >     931aa7154bc4 kernel/reboot: emergency_restart: Set
> correct system_state
> > > > > > > > > >     7a3424c3b76a quota: explicitly forbid quota files
> from being encrypted
> > > > > > > > > >     47f509832168 jbd2: fix potential data lost in
> recovering journal raced with synchronizing fs bdev
> > > > > > > > > >     f13e1ea45699 ASoC: codecs: wsa-macro: fix
> uninitialized stack variables with name prefix
> > > > > > > > > >     28436d8092ad selftests/resctrl: Reduce failures due
> to outliers in MBA/MBM tests
> > > > > > > > > >     6ce63598a1fb selftests/resctrl: Remove duplicate
> feature check from CMT test
> > > > > > > > > >     e90efe17fc07 netfilter: nf_tables: split async and
> sync catchall in two functions
> > > > > > > > > >     0d9506c766c9 netfilter: nf_tables: remove catchall
> element in GC sync path
> > > > > > > > > >     96fc7a50a278 PCI: keystone: Don't discard .probe()
> callback
> > > > > > > > > >     e0d394df9812 PCI: keystone: Don't discard .remove()
> callback
> > > > > > > > > >     f4f12667167c KEYS: trusted: Rollback init_trusted()
> consistently
> > > > > > > > > >     c407ff72fb3a genirq/generic_chip: Make
> irq_remove_generic_chip() irqdomain aware
> > > > > > > > > >     bc8a14e3c630 mmc: meson-gx: Remove setting of
> CMD_CFG_ERROR
> > > > > > > > > >     3a51e6b4da71 wifi: ath11k: fix htt pktlog locking
> > > > > > > > > >     426e718ce9ba wifi: ath11k: fix dfs radar event
> locking
> > > > > > > > > >     e9d84413b1b7 wifi: ath11k: fix temperature event
> locking
> > > > > > > > > >     5ff849948c11 ima: detect changes to the backing
> overlay file
> > > > > > > > > >     4584a421a6d9 ima: annotate iint mutex to avoid
> lockdep false positive warnings
> > > > > > > > > >     4049576c639f ACPI: FPDT: properly handle invalid
> FPDT subtables
> > > > > > > > > >     628e76e684c8 firmware: qcom_scm: use 64-bit calling
> convention only when client is 64-bit
> > > > > > > > > >     6eb8c191e360 btrfs: don't arbitrarily slow down
> delalloc if we're committing
> > > > > > > > > >     0b99626b28ca rcu: kmemleak: Ignore kmemleak false
> positives when RCU-freeing objects
> > > > > > > > > >     71f5344f477c PM: hibernate: Clean up sync_read
> handling in snapshot_write_next()
> > > > > > > > > >     57dbc0eb8abe PM: hibernate: Use __get_safe_page()
> rather than touching the list
> > > > > > > > > >     87a30633b5d3 arm64: dts: qcom: ipq6018: Fix hwlock
> index for SMEM
> > > > > > > > > >     ebaee06a7292 rcu/tree: Defer setting of jiffies
> during stall reset
> > > > > > > > > >     057d1034d012 svcrdma: Drop connection after an RDMA
> Read error
> > > > > > > > > >     541b3757fd44 wifi: wilc1000: use vmm_table as array
> in wilc struct
> > > > > > > > > >     b156f62f19da PCI: exynos: Don't discard .remove()
> callback
> > > > > > > > > >     f88796721002 PCI/ASPM: Fix L1 substate handling in
> aspm_attr_store_common()
> > > > > > > > > >     467864d55b52 mmc: sdhci_am654: fix start loop index
> for TAP value parsing
> > > > > > > > > >     ef34a97bb9cb mmc: vub300: fix an error code
> > > > > > > > > >     36adb6204cff clk: qcom: ipq6018: drop the
> CLK_SET_RATE_PARENT flag from PLL clocks
> > > > > > > > > >     090b167b2c41 clk: qcom: ipq8074: drop the
> CLK_SET_RATE_PARENT flag from PLL clocks
> > > > > > > > > >     18640a1818f1 clk: socfpga: Fix undefined behavior
> bug in struct stratix10_clock_data
> > > > > > > > > >     4d17b54c9be3 parisc/pdc: Add width field to struct
> pdc_model
> > > > > > > > > >     936c9c10efae arm64: Restrict CPU_BIG_ENDIAN to GNU
> as or LLVM IAS 15.x or newer
> > > > > > > > > >     8b24bb54bf3a ACPI: resource: Do IRQ override on
> TongFang GMxXGxx
> > > > > > > > > >     5619c34d3c4c watchdog: move softlockup_panic back t=
o
> early_param
> > > > > > > > > >     a6c3a1fe09a2 PCI/sysfs: Protect driver's D3cold
> preference from user space
> > > > > > > > > >     01975bee0a14 hvc/xen: fix event channel handling fo=
r
> secondary consoles
> > > > > > > > > >     cfd543c10871 hvc/xen: fix error path in
> xen_hvc_init() to always register frontend driver
> > > > > > > > > >     730e08cb9101 hvc/xen: fix console unplug
> > > > > > > > > >     fa0b93a3de40 tty/sysrq: replace smp_processor_id()
> with get_cpu()
> > > > > > > > > >     92e6c0f00d38 audit: don't WARN_ON_ONCE(!current->mm=
)
> in audit_exe_compare()
> > > > > > > > > >     e29c095f1ad4 audit: don't take task_lock() in
> audit_exe_compare() code path
> > > > > > > > > >     5eb6519f483e KVM: x86: Ignore MSR_AMD64_TW_CFG acce=
ss
> > > > > > > > > >     1c49ef7041f2 KVM: x86: hyper-v: Don't auto-enable
> stimer on write from user-space
> > > > > > > > > >     fe6b461c37cb x86/cpu/hygon: Fix the CPU topology
> evaluation for real
> > > > > > > > > >     3a2adf48d8b1 crypto: x86/sha - load modules based o=
n
> CPU features
> > > > > > > > > >     be079aa71a12 scsi: qla2xxx: Fix system crash due to
> bad pointer access
> > > > > > > > > >     6ba3569f78d3 scsi: megaraid_sas: Increase register
> read retry rount from 3 to 30 for selected registers
> > > > > > > > > >     6a33b5810031 scsi: mpt3sas: Fix loop logic
> > > > > > > > > >     3c5aede46cdc bpf: Fix precision tracking for BPF_AL=
U
> | BPF_TO_BE | BPF_END
> > > > > > > > > >     403470431b15 bpf: Fix check_stack_write_fixed_off()
> to correctly spill imm
> > > > > > > > > >     ba115f6c3a8c randstruct: Fix gcc-plugin performance
> mode to stay in group
> > > > > > > > > >     2771fac4382b powerpc/perf: Fix disabling BHRB and
> instruction sampling
> > > > > > > > > >     7e450cc9ad54 media: venus: hfi: add checks to
> perform sanity on queue pointers
> > > > > > > > > >     1566e8be73fd i915/perf: Fix NULL deref bugs with
> drm_dbg() calls
> > > > > > > > > >     35c17257ef09 xfs: Fix unreferenced object reported
> by kmemleak in xfs_sysfs_init()
> > > > > > > > > >     5db146322b17 xfs: fix memory leak in
> xfs_errortag_init
> > > > > > > > > >     c540284d8488 xfs: fix exception caused by unexpecte=
d
> illegal bestcount in leaf dir
> > > > > > > > > >     5212d586e76f xfs: avoid a UAF when log intent item
> recovery fails
> > > > > > > > > >     ba179cc12109 xfs: fix inode reservation space for
> removing transaction
> > > > > > > > > >     b7847653a2d6 xfs: Fix false ENOSPC when performing
> direct write on a delalloc extent in cow fork
> > > > > > > > > >     92d38b87e886 xfs: add missing cmap->br_state =3D
> XFS_EXT_NORM update
> > > > > > > > > >     8d0baec78e8a xfs: fix intermittent hang during
> quotacheck
> > > > > > > > > >     76545c0e881b xfs: don't leak memory when attr fork
> loading fails
> > > > > > > > > >     eb888caf27d9 xfs: fix use-after-free in xattr node
> block inactivation
> > > > > > > > > >     4cb3842967e6 xfs: flush inode gc workqueue before
> clearing agi bucket
> > > > > > > > > >     188594c64a1e xfs: prevent a UAF when log IO errors
> race with unmount
> > > > > > > > > >     921c96215850 xfs: use invalidate_lock to check the
> state of mmap_lock
> > > > > > > > > >     efd194800b69 xfs: convert buf_cancel_table
> allocation to kmalloc_array
> > > > > > > > > >     074fee186931 xfs: don't leak xfs_buf_cancel
> structures when recovery fails
> > > > > > > > > >     b8effd31a862 xfs: refactor buffer cancellation tabl=
e
> allocation
> > > > > > > > > >     4968c2aa6a1f cifs: fix check of rc in function
> generate_smb3signingkey
> > > > > > > > > >     8d725bf0d16d cifs: spnego: add ';' in HOST_KEY_LEN
> > > > > > > > > >     21accf149161 tools/power/turbostat: Enable the
> C-state Pre-wake printing
> > > > > > > > > >     0045c1ff7ac0 tools/power/turbostat: Fix a knl bug
> > > > > > > > > >     5bcce23f387b macvlan: Don't propagate promisc chang=
e
> to lower dev in passthru
> > > > > > > > > >     7574b5e65e92 net/mlx5e: Check return value of
> snprintf writing to fw_version buffer for representors
> > > > > > > > > >     55553c5b53ae net/mlx5e: Reduce the size of icosq_st=
r
> > > > > > > > > >     51655fd35703 net/mlx5e: Fix pedit endianness
> > > > > > > > > >     a990dd7410ec net/mlx5e: Refactor mod header
> management API
> > > > > > > > > >     39f95b1d0d8f net/mlx5e: Move mod hdr allocation to =
a
> single place
> > > > > > > > > >     c0f37a3715cb net/mlx5e: Remove incorrect addition o=
f
> action fwd flag
> > > > > > > > > >     6974fd92d5f1 net/mlx5e: fix double free of
> encap_header in update funcs
> > > > > > > > > >     f3c4a7044201 net/mlx5e: fix double free of
> encap_header
> > > > > > > > > >     931e9e8e30bf net: stmmac: fix rx budget limit check
> > > > > > > > > >     b8b514b2a6cd netfilter: nf_tables: fix pointer math
> issue in nft_byteorder_eval()
> > > > > > > > > >     25da0f582119 netfilter: nf_tables: add and use BE
> register load-store helpers
> > > > > > > > > >     a48f6be5bdb7 netfilter: nf_tables: use the correct
> get/put helpers
> > > > > > > > > >     7d3901bf3baa netfilter: nf_conntrack_bridge:
> initialize err to 0
> > > > > > > > > >     75bcfc188abf af_unix: fix use-after-free in
> unix_stream_read_actor()
> > > > > > > > > >     0b480c654ef2 net: ethernet: cortina: Fix MTU max
> setting
> > > > > > > > > >     097588e20c6b net: ethernet: cortina: Handle large
> frames
> > > > > > > > > >     f9269b274cdf net: ethernet: cortina: Fix max RX
> frame define
> > > > > > > > > >     53064e8239dd bonding: stop the device in
> bond_setup_by_slave()
> > > > > > > > > >     cda210a4bdf7 ptp: annotate data-race around q->head
> and q->tail
> > > > > > > > > >     b67d16b2373b xen/events: fix delayed eoi list
> handling
> > > > > > > > > >     8531a4194e59 ppp: limit MRU to 64K
> > > > > > > > > >     9ae82308d184 tipc: Fix kernel-infoleak due to
> uninitialized TLV value
> > > > > > > > > >     359c65daf6b5 net: hns3: fix VF wrong speed and
> duplex issue
> > > > > > > > > >     406be003d698 net: hns3: fix VF reset fail issue
> > > > > > > > > >     cfc131b078a3 net: hns3: fix variable may not
> initialized problem in hns3_init_mac_addr()
> > > > > > > > > >     070581829c1a net: hns3: fix incorrect capability bi=
t
> display for copper port
> > > > > > > > > >     a3c65cf7854d net: hns3: add barrier in vf mailbox
> reply process
> > > > > > > > > >     e671d8203758 net: hns3: add byte order conversion
> for PF to VF mailbox message
> > > > > > > > > >     bb0f14257c04 net: hns3: refine the definition for
> struct hclge_pf_to_vf_msg
> > > > > > > > > >     1d8f66d4060a net: hns3: fix add VLAN fail issue
> > > > > > > > > >     4b3b2541d40e tty: Fix uninit-value access in
> ppp_sync_receive()
> > > > > > > > > >     1f64cad3ac38 ipvlan: add ipvlan_route_v6_outbound()
> helper
> > > > > > > > > >     6c71b9b177c6 net: set SOCK_RCU_FREE before insertin=
g
> socket into hashtable
> > > > > > > > > >     427165421c25 net: inet: Retire port only
> listening_hash
> > > > > > > > > >     be1ceb8b7c58 net: inet: Open code inet_hash2 and
> inet_unhash2
> > > > > > > > > >     bb9bcf47fba7 net: inet: Remove count from
> inet_listen_hashbucket
> > > > > > > > > >     de634368e079 mptcp: listen diag dump support
> > > > > > > > > >     870f438aca56 mptcp: diag: switch to context structu=
re
> > > > > > > > > >     be020f658c63 gfs2: Silence "suspicious RCU usage in
> gfs2_permission" warning
> > > > > > > > > >     194454afa6aa SUNRPC: Fix RPC client cleaned up the
> freed pipefs dentries
> > > > > > > > > >     319ed0cba164 NFSv4.1: fix SP4_MACH_CRED protection
> for pnfs IO
> > > > > > > > > >     809684f5b388 SUNRPC: Add an IS_ERR() check back to
> where it was
> > > > > > > > > >     46d6b768072b SUNRPC: ECONNRESET might require a
> rebind
> > > > > > > > > >     a7032d4d6499 media: cec: meson: always include meso=
n
> sub-directory in Makefile
> > > > > > > > > >     16e78f28517d media: cadence: csi2rx: Unregister v4l=
2
> async notifier
> > > > > > > > > >     20c2ca9abb78 sched/core: Optimize in_task() and
> in_interrupt() a bit
> > > > > > > > > >     9894c58c1777 tracing/perf: Add
> interrupt_context_level() helper
> > > > > > > > > >     48fef664d7e9 tracing: Reuse logic from perf's
> get_recursion_context()
> > > > > > > > > >     670b3e902f62 wifi: iwlwifi: Use FW rate for non-dat=
a
> frames
> > > > > > > > > >     a7ee519e8095 pwm: Fix double shift bug
> > > > > > > > > >     7054366cd076 drm/amdgpu: fix software pci_unplug on
> some chips
> > > > > > > > > >     e48a5e78d077 drm/qxl: prevent memory leak
> > > > > > > > > >     0835e7f296ca ASoC: ti: omap-mcbsp: Fix runtime PM
> underflow warnings
> > > > > > > > > >     38ada2f304f6 i2c: dev: copy userspace array safely
> > > > > > > > > >     610244988f32 kgdb: Flush console before entering
> kgdb on panic
> > > > > > > > > >     4e497f1acd99 drm/amd/display: Avoid NULL dereferenc=
e
> of timing generator
> > > > > > > > > >     5e0b788fb96b media: imon: fix access to invalid
> resource for the second interface
> > > > > > > > > >     ae6bcafe1f6b media: ccs: Fix driver quirk struct
> documentation
> > > > > > > > > >     d01b0ad79ecd media: cobalt: Use FIELD_GET() to
> extract Link Width
> > > > > > > > > >     03ce0655bf8e gfs2: fix an oops in gfs2_permission
> > > > > > > > > >     5bfda356e903 gfs2: ignore negated quota changes
> > > > > > > > > >     16631907d013 media: vivid: avoid integer overflow
> > > > > > > > > >     09cd8b561aa9 media: gspca: cpia1:
> shift-out-of-bounds in set_flicker
> > > > > > > > > >     39c71357e68e i3c: master: mipi-i3c-hci: Fix a kerne=
l
> panic for accessing DAT_data.
> > > > > > > > > >     72775cad7f57 virtio-blk: fix implicit overflow on
> virtio_max_dma_size
> > > > > > > > > >     f7f3bdb225e3 i2c: sun6i-p2wi: Prevent potential
> division by zero
> > > > > > > > > >     d23ad76f240c i3c: mipi-i3c-hci: Fix out of bounds
> access in hci_dma_irq_handler
> > > > > > > > > >     e6fbad3cc880 9p: v9fs_listxattr: fix %s null
> argument warning
> > > > > > > > > >     a18be976be41 9p/trans_fd: Annotate data-racy writes
> to file::f_flags
> > > > > > > > > >     2cc5e191d671 usb: gadget: f_ncm: Always set current
> gadget in ncm_bind()
> > > > > > > > > >     6c80f48912b5 tty: vcc: Add check for kstrdup() in
> vcc_probe()
> > > > > > > > > >     2ff61106d6b4 exfat: support handle zero-size
> directory
> > > > > > > > > >     c86a3007a685 HID: Add quirk for Dell Pro Wireless
> Keyboard and Mouse KM5221W
> > > > > > > > > >     3453f945af89 PCI: Use FIELD_GET() in Sapphire RX
> 5600 XT Pulse quirk
> > > > > > > > > >     0a93a0f99a09 misc: pci_endpoint_test: Add Device ID
> for R-Car S4-8 PCIe controller
> > > > > > > > > >     03dbd6a9ea4e PCI: Disable ATS for specific Intel IP=
U
> E2000 devices
> > > > > > > > > >     a9a0b3444845 PCI: Extract ATS disabling to a helper
> function
> > > > > > > > > >     fe511d24418a PCI: Use FIELD_GET() to extract Link
> Width
> > > > > > > > > >     56d78b5495eb scsi: libfc: Fix potential NULL pointe=
r
> dereference in fc_lport_ptp_setup()
> > > > > > > > > >     37a51e7f36b7 atm: iphase: Do PCI error checks on ow=
n
> line
> > > > > > > > > >     f05ae00106aa PCI: tegra194: Use
> FIELD_GET()/FIELD_PREP() with Link Width fields
> > > > > > > > > >     631a96e9eb42 ALSA: hda: Fix possible null-ptr-deref
> when assigning a stream
> > > > > > > > > >     1c805b9cd2e3 ARM: 9320/1: fix stack depot IRQ stack
> filter
> > > > > > > > > >     8d25ec69f8f1 HID: lenovo: Detect quirk-free fw on
> cptkbd and stop applying workaround
> > > > > > > > > >     64f062baf202 jfs: fix array-index-out-of-bounds in
> diAlloc
> > > > > > > > > >     da3da5e1e6f7 jfs: fix array-index-out-of-bounds in
> dbFindLeaf
> > > > > > > > > >     1f74d336990f fs/jfs: Add validity check for db_maxa=
g
> and db_agpref
> > > > > > > > > >     5f148b16972e fs/jfs: Add check for negative
> db_l2nbperpage
> > > > > > > > > >     e1d1f79b1929 scsi: ibmvfc: Remove BUG_ON in the cas=
e
> of an empty event pool
> > > > > > > > > >     f0bfc8a5561f scsi: hisi_sas: Set debugfs_dir pointe=
r
> to NULL after removing debugfs
> > > > > > > > > >     5904dee70771 RDMA/hfi1: Use FIELD_GET() to extract
> Link Width
> > > > > > > > > >     546c1796ad1e crypto: pcrypt - Fix hungtask for
> PADATA_RESET
> > > > > > > > > >     bc443a199f8c ASoC: soc-card: Add storage for PCI SS=
ID
> > > > > > > > > >     9f2082067c5f selftests/efivarfs: create-read: fix a
> resource leak
> > > > > > > > > >     428cad17f53b arm64: dts: ls208xa: use a pseudo-bus
> to constrain usb dma size
> > > > > > > > > >     174f62a0aa15 drm/amdgpu: Fix a null pointer access
> when the smc_rreg pointer is NULL
> > > > > > > > > >     3f7a400d5e80 drm/amdkfd: Fix shift out-of-bounds
> issue
> > > > > > > > > >     300589d551d4 drm/panel: st7703: Pick different rese=
t
> sequence
> > > > > > > > > >     eaa03ea366c8 drm/amdgpu/vkms: fix a possible null
> pointer dereference
> > > > > > > > > >     84c923d89890 drm/panel/panel-tpo-tpg110: fix a
> possible null pointer dereference
> > > > > > > > > >     2381f6b628b3 drm/panel: fix a possible null pointer
> dereference
> > > > > > > > > >     c11cf5e117f5 drm/amdgpu: Fix potential null pointer
> derefernce
> > > > > > > > > >     a237675aa1e6 drm/amd: Fix UBSAN
> array-index-out-of-bounds for Polaris and Tonga
> > > > > > > > > >     acdb6830de02 drm/amd: Fix UBSAN
> array-index-out-of-bounds for SMU7
> > > > > > > > > >     829ce8e995a8 drm/msm/dp: skip validity check for DP
> CTS EDID checksum
> > > > > > > > > >     689b33b94f09 drm: vmwgfx_surface.c: copy user-array
> safely
> > > > > > > > > >     22260dabcfe3 kernel: watch_queue: copy user-array
> safely
> > > > > > > > > >     d4f2c09d4672 kernel: kexec: copy user-array safely
> > > > > > > > > >     24b17d530c42 string.h: add array-wrappers for
> (v)memdup_user()
> > > > > > > > > >     3a3a6dc9a330 drm/amd/display: use full update for
> clip size increase of large plane source
> > > > > > > > > >     7d43cdd22cd8 drm/amdkfd: Fix a race condition of
> vram buffer unref in svm code
> > > > > > > > > >     eea81424c5b8 drm/komeda: drop all currently held
> locks if deadlock happens
> > > > > > > > > >     812886866be6 platform/x86: thinkpad_acpi: Add
> battery quirk for Thinkpad X120e
> > > > > > > > > >     ba7088769800 Bluetooth: Fix double free in
> hci_conn_cleanup
> > > > > > > > > >     f9de14bde56d Bluetooth: btusb: Add date->evt_skb is
> NULL check
> > > > > > > > > >     a43cf6acf017 wifi: ath10k: Don't touch the CE
> interrupt registers after power up
> > > > > > > > > >     6f42bd243327 net: annotate data-races around
> sk->sk_dst_pending_confirm
> > > > > > > > > >     19ab5fd26441 net: annotate data-races around
> sk->sk_tx_queue_mapping
> > > > > > > > > >     f3be63f7a8ee wifi: ath10k: fix clang-specific
> fortify warning
> > > > > > > > > >     02a0547b8da0 wifi: ath9k: fix clang-specific fortif=
y
> warnings
> > > > > > > > > >     cf353904a828 bpf: Detect IP =3D=3D ksym.end as part=
 of
> BPF program
> > > > > > > > > >     c29a89b23f67 atl1c: Work around the DMA RX overflow
> issue
> > > > > > > > > >     21a0f310a9f3 wifi: mac80211: don't return unset
> power in ieee80211_get_tx_power()
> > > > > > > > > >     3073e38086d0 wifi: mac80211_hwsim: fix
> clang-specific fortify warning
> > > > > > > > > >     e8e55fa44435 x86/mm: Drop the 4 MB restriction on
> minimal NUMA node memory size
> > > > > > > > > >     f9d3ba62e87b workqueue: Provide one lock class key
> per work_on_cpu() callsite
> > > > > > > > > >     0a5b512d526c clocksource/drivers/timer-atmel-tcb:
> Fix initialization on SAM9 hardware
> > > > > > > > > >     465b88c0873b clocksource/drivers/timer-imx-gpt: Fix
> potential memory leak
> > > > > > > > > >     fd0df3f87192 perf/core: Bail out early if the
> request AUX area is out of bound
> > > > > > > > > >     e89d0ed45a41 locking/ww_mutex/test: Fix potential
> workqueue corruption
> > > > > > > > > >     2a910f4af54d Linux 5.15.139
> > > > > > > > > >     3443337acd37 btrfs: use u64 for buffer sizes in the
> tree search ioctls
> > > > > > > > > >     f9f5e8cecba9 Revert "mmc: core: Capture correct
> oemid-bits for eMMC cards"
> > > > > > > > > >     824829c2c6b4 tracing/kprobes: Fix the order of
> argument descriptions
> > > > > > > > > >     560680f745fc fbdev: fsl-diu-fb: mark wr_reg_wa()
> static
> > > > > > > > > >     8e4b510fe917 fbdev: imsttfb: fix a resource leak in
> probe
> > > > > > > > > >     3648582181b6 fbdev: imsttfb: Fix error path of
> imsttfb_probe()
> > > > > > > > > >     30959f9f4540 spi: spi-zynq-qspi: add spi-mem to
> driver kconfig dependencies
> > > > > > > > > >     9cf044cc36c1 ASoC: hdmi-codec: register hpd callbac=
k
> on component probe
> > > > > > > > > >     705e5a28ec1d drm/syncobj: fix
> DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
> > > > > > > > > >     0ca05fae2790 netfilter: nat: fix ipv6 nat redirect
> with mapped and scoped addresses
> > > > > > > > > >     1652f57f02eb netfilter: nft_redir: use `struct
> nf_nat_range2` throughout and deduplicate eval call-backs
> > > > > > > > > >     d28c17abe098 netfilter: xt_recent: fix (increase)
> ipv6 literal buffer length
> > > > > > > > > >     f30567fcbc4d i2c: iproc: handle invalid slave state
> > > > > > > > > >     38f5ac54b917 r8169: respect userspace disabling
> IFF_MULTICAST
> > > > > > > > > >     fd01115b033c blk-core: use pr_warn_ratelimited() in
> bio_check_ro()
> > > > > > > > > >     b80148710983 block: remove unneeded return value of
> bio_check_ro()
> > > > > > > > > >     d8d94d6b3bd3 tg3: power down device only on
> SYSTEM_POWER_OFF
> > > > > > > > > >     5ea06a23f8f4 net/smc: put sk reference if close wor=
k
> was canceled
> > > > > > > > > >     884606f8283c net/smc: allow cdc msg send rather tha=
n
> drop it with NULL sndbuf_desc
> > > > > > > > > >     a62af7146daa net/smc: fix dangling sock under state
> SMC_APPFINCLOSEWAIT
> > > > > > > > > >     866606826f16 selftests: pmtu.sh: fix result checkin=
g
> > > > > > > > > >     2d117ac1b8f8 net: stmmac: xgmac: Enable support for
> multiple Flexible PPS outputs
> > > > > > > > > >     95a99ac112c5 Fix termination state for
> idr_for_each_entry_ul()
> > > > > > > > > >     70ef755f126b net: r8169: Disable multicast filter
> for RTL8168H and RTL8107E
> > > > > > > > > >     0dad0e75d62b dccp/tcp: Call
> security_inet_conn_request() after setting IPv6 addresses.
> > > > > > > > > >     c340713bdf32 dccp: Call security_inet_conn_request(=
)
> after setting IPv4 addresses.
> > > > > > > > > >     d1b7e6562a4c octeontx2-pf: Fix holes in error code
> > > > > > > > > >     f60297ef59d4 octeontx2-pf: Fix error codes
> > > > > > > > > >     794d360b1d65 inet: shrink struct flowi_common
> > > > > > > > > >     8943083bbb64 bpf: Check map->usercnt after
> timer->timer is assigned
> > > > > > > > > >     3907b89cd17f tipc: Change nla_policy for
> bearer-related names to NLA_NUL_STRING
> > > > > > > > > >     a1a485e45d24 hsr: Prevent use after free in
> prp_create_tagged_frame()
> > > > > > > > > >     352887b3edd0 llc: verify mac len before reading mac
> header
> > > > > > > > > >     303766bb92c5 Input: synaptics-rmi4 - fix use after
> free in rmi_unregister_function()
> > > > > > > > > >     741e4c15d7c0 pwm: brcmstb: Utilize appropriate cloc=
k
> APIs in suspend/resume
> > > > > > > > > >     895ac9a21f69 pwm: sti: Reduce number of allocations
> and drop usage of chip_data
> > > > > > > > > >     db64ddddeeec regmap: prevent noinc writes from
> clobbering cache
> > > > > > > > > >     004d4002534e media: dvb-usb-v2: af9035: fix missing
> unlock
> > > > > > > > > >     a0beda184756 media: cedrus: Fix clock/reset sequenc=
e
> > > > > > > > > >     980be4c3b0d5 media: vidtv: mux: Add check and kfree
> for kstrdup
> > > > > > > > > >     d17269fb9161 media: vidtv: psi: Add check for kstrd=
up
> > > > > > > > > >     db89f551b706 media: s3c-camif: Avoid inappropriate
> kfree()
> > > > > > > > > >     51c94256a83f media: bttv: fix use after free error
> due to btv->timeout timer
> > > > > > > > > >     d3937f9e25d9 media: i2c: max9286: Fix some redundan=
t
> of_node_put() calls
> > > > > > > > > >     9d060f2fc40c pcmcia: ds: fix possible name leak in
> error path in pcmcia_device_add()
> > > > > > > > > >     24e9df588e2e pcmcia: ds: fix refcount leak in
> pcmcia_device_add()
> > > > > > > > > >     24e73ab542c7 pcmcia: cs: fix possible hung task and
> memory leak pccardd()
> > > > > > > > > >     b3eaa0d43c74 rtc: pcf85363: fix wrong mask/val
> parameters in regmap_update_bits call
> > > > > > > > > >     20bd0198bebd cxl/mem: Fix shutdown order
> > > > > > > > > >     d48fe8d98171 i3c: Fix potential refcount leak in
> i3c_master_register_new_i3c_devs
> > > > > > > > > >     855d6fb2cc7b 9p/net: fix possible memory leak in
> p9_check_errors()
> > > > > > > > > >     0d456ebaad30 perf hist: Add missing puts to
> hist__account_cycles
> > > > > > > > > >     924e8d0b7645 perf machine: Avoid out of bounds LBR
> memory read
> > > > > > > > > >     76b0eab987c4 usb: host: xhci-plat: fix possible
> kernel oops while resuming
> > > > > > > > > >     c9c4dab06a5a xhci: Loosen RPM as default policy to
> cover for AMD xHC 1.1
> > > > > > > > > >     92c9ef156431 powerpc/pseries: fix potential memory
> leak in init_cpu_associativity()
> > > > > > > > > >     516235e7b35f powerpc/imc-pmu: Use the correct
> spinlock initializer.
> > > > > > > > > >     945dc61d7840 powerpc/xive: Fix endian conversion si=
ze
> > > > > > > > > >     bce31a2bcb1e powerpc/40x: Remove stale
> PTE_ATOMIC_UPDATES macro
> > > > > > > > > >     1308e55eb09c modpost: fix tee MODULE_DEVICE_TABLE
> built on big-endian host
> > > > > > > > > >     863a9c3fdec2 powerpc: Only define __parse_fpscr()
> when required
> > > > > > > > > >     01f62c6bd2db f2fs: fix to initialize map.m_pblk in
> f2fs_precache_extents()
> > > > > > > > > >     dfebea7114e0 dmaengine: pxa_dma: Remove an erroneou=
s
> BUG_ON() in pxad_free_desc()
> > > > > > > > > >     72f8fa6c4b78 USB: usbip: fix stub_dev hub disconnec=
t
> > > > > > > > > >     168697f15a53 tools: iio: iio_generic_buffer ensure
> alignment
> > > > > > > > > >     a61c3c647ffd misc: st_core: Do not call kfree_skb()
> under spin_lock_irqsave()
> > > > > > > > > >     732aa0cb2601 dmaengine: ti: edma: handle
> irq_of_parse_and_map() errors
> > > > > > > > > >     2941a29fe9d6 usb: chipidea: Simplify Tegra DMA
> alignment code
> > > > > > > > > >     58e8316b200b usb: chipidea: Fix DMA overwrite for
> Tegra
> > > > > > > > > >     fcaafb574fc8 usb: dwc2: fix possible NULL pointer
> dereference caused by driver concurrency
> > > > > > > > > >     c956be5641cc dmaengine: idxd: Register dsa_bus_type
> before registering idxd sub-drivers
> > > > > > > > > >     ca46d7ce1fbe livepatch: Fix missing newline
> character in klp_resolve_symbols()
> > > > > > > > > >     b77f7c025e85 tty: tty_jobctrl: fix pid memleak in
> disassociate_ctty()
> > > > > > > > > >     e9f598a5cc9a f2fs: compress: fix to avoid redundant
> compress extension
> > > > > > > > > >     8c4504cc0c64 f2fs: compress: fix to avoid
> use-after-free on dic
> > > > > > > > > >     ca0aae3837a6 leds: trigger: ledtrig-cpu:: Fix
> 'output may be truncated' issue for 'cpu'
> > > > > > > > > >     206a972511a8 leds: pwm: Don't disable the PWM when
> the LED should be off
> > > > > > > > > >     893eedf596dd leds: turris-omnia: Do not use SMBUS
> calls
> > > > > > > > > >     aec3706971b3 leds: turris-omnia: Drop unnecessary
> mutex locking
> > > > > > > > > >     c9a4f13c58f1 mfd: arizona-spi: Set
> pdata.hpdet_channel for ACPI enumerated devs
> > > > > > > > > >     63a99d7b57b4 mfd: dln2: Fix double put in dln2_prob=
e
> > > > > > > > > >     2742c860e0b7 mfd: core: Ensure disabled devices are
> skipped without aborting
> > > > > > > > > >     94eb5423d75e mfd: core: Un-constify mfd_cell.of_reg
> > > > > > > > > >     8890d4d5f25e ASoC: ams-delta.c: use component after
> check
> > > > > > > > > >     a2ae48bd82ee crypto: qat - fix deadlock in backlog
> processing
> > > > > > > > > >     0dd34a7ad395 padata: Fix refcnt handling in
> padata_free_shell()
> > > > > > > > > >     93e4aa8545ab ASoC: Intel: Skylake: Fix mem leak whe=
n
> parsing UUIDs fails
> > > > > > > > > >     cd1c2df64d6b HID: logitech-hidpp: Move
> get_wireless_feature_index() check to hidpp_connect_event()
> > > > > > > > > >     99893b7c4592 HID: logitech-hidpp: Revert "Don't
> restart communication if not necessary"
> > > > > > > > > >     5f2f38602583 HID: logitech-hidpp: Don't restart IO,
> instead defer hid_connect() only
> > > > > > > > > >     1f80041c5867 HID: logitech-hidpp: Remove
> HIDPP_QUIRK_NO_HIDINPUT quirk
> > > > > > > > > >     d3b196a1da3e Revert "HID: logitech-hidpp: add a
> module parameter to keep firmware gestures"
> > > > > > > > > >     6885e5ffa09d sh: bios: Revive earlyprintk support
> > > > > > > > > >     b0c25e957f9b hid: cp2112: Fix IRQ shutdown stopping
> polling for all IRQs on chip
> > > > > > > > > >     d06dc0f99f72 RDMA/hfi1: Workaround truncation
> compilation error
> > > > > > > > > >     086cd44204bb scsi: ufs: core: Leave space for '\0'
> in utf8 desc string
> > > > > > > > > >     a0f1999090b3 ASoC: fsl: Fix PM disable depth
> imbalance in fsl_easrc_probe
> > > > > > > > > >     904fc0103776 RDMA/hns: The UD mode can only be
> configured with DCQCN
> > > > > > > > > >     9f8db02d30ad RDMA/hns: Fix signed-unsigned mixed
> comparisons
> > > > > > > > > >     2de683e27e1d RDMA/hns: Fix uninitialized ucmd in
> hns_roce_create_qp_common()
> > > > > > > > > >     611260e36f16 IB/mlx5: Fix rdma counter binding for
> RAW QP
> > > > > > > > > >     922b2693b9af ASoC: fsl: mpc5200_dma.c: Fix warning
> of Function parameter or member not described
> > > > > > > > > >     001f90cd9d2f ext4: move 'ix' sanity check to corren=
t
> position
> > > > > > > > > >     c24a3c9e373e ARM: 9321/1: memset: cast the constant
> byte to unsigned char
> > > > > > > > > >     012d0c66f939 hid: cp2112: Fix duplicate workqueue
> initialization
> > > > > > > > > >     1ce09238e8e8 crypto: qat - increase size of buffers
> > > > > > > > > >     62df66b726f9 crypto: caam/jr - fix Chacha20 +
> Poly1305 self test failure
> > > > > > > > > >     61f25d4686bf crypto: caam/qi2 - fix Chacha20 +
> Poly1305 self test failure
> > > > > > > > > >     66eb7b7f23dd nd_btt: Make BTT lanes preemptible
> > > > > > > > > >     6563e0f79d63 libnvdimm/of_pmem: Use devm_kstrdup
> instead of kstrdup and check its return value
> > > > > > > > > >     d4ad0c1a83ce scsi: ibmvfc: Fix erroneous use of
> rtas_busy_delay with hcall return code
> > > > > > > > > >     b79c7d684c3f RDMA/core: Use size_{add,sub,mul}() in
> calls to struct_size()
> > > > > > > > > >     a5c83c8043d7 hwrng: geode - fix accessing registers
> > > > > > > > > >     a8607725b20a crypto: hisilicon/hpre - Fix a
> erroneous check after snprintf()
> > > > > > > > > >     b01b9dc5487a selftests/resctrl: Ensure the benchmar=
k
> commands fits to its array
> > > > > > > > > >     2d2300fcf8f6 selftests/pidfd: Fix ksft print format=
s
> > > > > > > > > >     8bc9c9447489 arm64: dts: imx8mn: Add sound-dai-cell=
s
> to micfil node
> > > > > > > > > >     1abd658492b5 arm64: dts: imx8mm: Add sound-dai-cell=
s
> to micfil node
> > > > > > > > > >     cf7abb54f8b1 arm64: dts: imx8qm-ss-img: Fix jpegenc
> compatible entry
> > > > > > > > > >     8704bf18a888 clk: scmi: Free scmi_clk allocated whe=
n
> the clocks with invalid info are skipped
> > > > > > > > > >     bdb0428aa294 firmware: arm_ffa: Assign the missing
> IDR allocation ID to the FFA device
> > > > > > > > > >     b0ffdc164365 firmware: ti_sci: Mark driver as non
> removable
> > > > > > > > > >     995ee1e84e8d soc: qcom: llcc: Handle a second devic=
e
> without data corruption
> > > > > > > > > >     19b8098f73c6 ARM: dts: qcom: mdm9615: populate vsdc=
c
> fixed regulator
> > > > > > > > > >     a8ab88f84b89 arm64: dts: qcom: apq8016-sbc: Add
> missing ADV7533 regulators
> > > > > > > > > >     ddc0df81eeac ARM64: dts: marvell: cn9310: Use
> appropriate label for spi1 pins
> > > > > > > > > >     12d9de01c09c arm64: dts: qcom: sdm845-mtp: fix WiFi
> configuration
> > > > > > > > > >     690b89255971 arm64: dts: qcom: sc7280: Add missing
> LMH interrupts
> > > > > > > > > >     2a4cce4168f7 arm64: dts: qcom: msm8992-libra: drop
> duplicated reserved memory
> > > > > > > > > >     eb9daf47806b arm64: dts: qcom: msm8916: Fix iommu
> local address range
> > > > > > > > > >     541640dcbf48 ARM: dts: renesas: blanche: Fix typo i=
n
> GP_11_2 pin name
> > > > > > > > > >     0e1e88bba286 perf: hisi: Fix use-after-free when
> register pmu fails
> > > > > > > > > >     4067d39f3c57 drm: mediatek: mtk_dsi: Fix
> NO_EOT_PACKET settings/handling
> > > > > > > > > >     a6a6f70aedca drm/msm/dsi: use msm_gem_kernel_put to
> free TX buffer
> > > > > > > > > >     aea6f32a4318 xen-pciback: Consider INTx disabled
> when MSI/MSI-X is enabled
> > > > > > > > > >     e588ca45bf55 drm/rockchip: Fix type promotion bug i=
n
> rockchip_gem_iommu_map()
> > > > > > > > > >     a00a293d57a5 arm64/arm: xen: enlighten: Fix KPTI
> checks
> > > > > > > > > >     d0d01bb4a560 drm/bridge: lt9611uxc: fix the race in
> the error path
> > > > > > > > > >     29aba28ea195 drm/bridge: lt9611uxc: Register and
> attach our DSI device at probe
> > > > > > > > > >     f53a04579328 drm/bridge: lt9611uxc: Switch to devm
> MIPI-DSI helpers
> > > > > > > > > >     517a5137a57b drm/rockchip: cdn-dp: Fix some error
> handling paths in cdn_dp_probe()
> > > > > > > > > >     865ccd4ca674 drm/mediatek: Fix iommu fault during
> crtc enabling
> > > > > > > > > >     8e3c8253b34f drm/mediatek: Fix iommu fault by
> swapping FBs after updating plane state
> > > > > > > > > >     e11e339faa11 drm/amdkfd: fix some race conditions i=
n
> vram buffer alloc/free of svm code
> > > > > > > > > >     30cb99e09648 drm/bridge: tc358768: Fix bit updates
> > > > > > > > > >     1cd4ae681a6a drm/bridge: tc358768: Disable
> non-continuous clock mode
> > > > > > > > > >     c13591b859be drm/bridge: tc358768: Fix use of
> uninitialized variable
> > > > > > > > > >     d78bddd94b80 drm/bridge: lt8912b: Add missing
> drm_bridge_attach call
> > > > > > > > > >     5cc2bc519afd drm/bridge: lt8912b: Manually disable
> HPD only if it was enabled
> > > > > > > > > >     42071feab712 drm/bridge: lt8912b: Fix crash on
> bridge detach
> > > > > > > > > >     d9217286d0ab drm/bridge: lt8912b: Fix bridge_detach
> > > > > > > > > >     cc3057958c5c drm/bridge: lt8912b: Add hot plug
> detection
> > > > > > > > > >     ef4a40953c80 drm/bridge: lt8912b: Register and
> attach our DSI device at probe
> > > > > > > > > >     3580b8a01305 drm/bridge: lt8912b: Switch to devm
> MIPI-DSI helpers
> > > > > > > > > >     52541851a8d1 drm/mipi-dsi: Create devm device
> attachment
> > > > > > > > > >     a20d6ecd261a drm/mipi-dsi: Create devm device
> registration
> > > > > > > > > >     347f025a02b3 drm/radeon: possible buffer overflow
> > > > > > > > > >     b163b371d741 drm/rockchip: vop: Fix call to crtc
> reset helper
> > > > > > > > > >     9a96bed1df7b drm/rockchip: vop: Fix reset of state
> in duplicate state crtc funcs
> > > > > > > > > >     1b0bc99cf316 hwmon: (coretemp) Fix potentially
> truncated sysfs attribute name
> > > > > > > > > >     b3e7eb23a6e9 hwmon: (axi-fan-control) Fix possible
> NULL pointer dereference
> > > > > > > > > >     e0bf076b734a platform/x86: wmi: Fix opening of char
> device
> > > > > > > > > >     c57e81d5e538 platform/x86: wmi: remove unnecessary
> initializations
> > > > > > > > > >     2ca4e461a298 platform/x86: wmi: Fix probe failure
> when failing to register WMI devices
> > > > > > > > > >     f75e11f54d98 clk: qcom: config IPQ_APSS_6018 should
> depend on QCOM_SMEM
> > > > > > > > > >     d1175cf4bd2b clk: mediatek: clk-mt2701: Add check
> for mtk_alloc_clk_data
> > > > > > > > > >     e964d21dc034 clk: mediatek: clk-mt7629: Add check
> for mtk_alloc_clk_data
> > > > > > > > > >     c4070ada5d51 clk: mediatek: clk-mt7629-eth: Add
> check for mtk_alloc_clk_data
> > > > > > > > > >     3aefc6fcfbad clk: mediatek: clk-mt6797: Add check
> for mtk_alloc_clk_data
> > > > > > > > > >     ca6d565a2319 clk: mediatek: clk-mt6779: Add check
> for mtk_alloc_clk_data
> > > > > > > > > >     533ca5153ad6 clk: mediatek: clk-mt6765: Add check
> for mtk_alloc_clk_data
> > > > > > > > > >     e531e4e73734 clk: npcm7xx: Fix incorrect kfree
> > > > > > > > > >     761c2a690d8f clk: ti: fix double free in
> of_ti_divider_clk_setup()
> > > > > > > > > >     1c37faca0908 clk: ti: change
> ti_clk_register[_omap_hw]() API
> > > > > > > > > >     28b72fba1e19 clk: ti: Update component clocks to us=
e
> ti_dt_clk_name()
> > > > > > > > > >     c4bffed2e52b clk: ti: Update pll and clockdomain
> clocks to use ti_dt_clk_name()
> > > > > > > > > >     9b5e9d8bf9a6 clk: ti: Add ti_dt_clk_name() helper t=
o
> use clock-output-names
> > > > > > > > > >     f45fff806ebb clk: keystone: pll: fix a couple NULL
> vs IS_ERR() checks
> > > > > > > > > >     7ff8ca9beefb spi: nxp-fspi: use the correct ioremap
> function
> > > > > > > > > >     26206c858dae clk: renesas: rzg2l: Fix computation
> formula
> > > > > > > > > >     1966bf2a79e6 clk: renesas: rzg2l: Use FIELD_GET()
> for PLL register fields
> > > > > > > > > >     7ece2efa87af clk: renesas: rzg2l: Simplify
> multiplication/shift logic
> > > > > > > > > >     e2239f716529 clk: imx: imx8qxp: Fix elcdif_pll cloc=
k
> > > > > > > > > >     7d416973cd12 clk: imx: imx8mq: correct error
> handling path
> > > > > > > > > >     608ebb098b79 clk: imx: Select MXC_CLK for CLK_IMX8Q=
XP
> > > > > > > > > >     8861b2925a84 clk: qcom: gcc-sm8150: Fix
> gcc_sdcc2_apps_clk_src
> > > > > > > > > >     76e8f00f54a8 clk: qcom: mmcc-msm8998: Fix the SMMU
> GDSC
> > > > > > > > > >     56c4bb46a5a0 clk: qcom: mmcc-msm8998: Don't check
> halt bit on some branch clks
> > > > > > > > > >     0881d24cf5ca clk: qcom: clk-rcg2: Fix clock rate
> overflow for high parent frequencies
> > > > > > > > > >     b64683f5d728 spi: tegra: Fix missing IRQ check in
> tegra_slink_probe()
> > > > > > > > > >     b13e8b38be51 regmap: debugfs: Fix a erroneous check
> after snprintf()
> > > > > > > > > >     8fafac407346 ipvlan: properly track tx_errors
> > > > > > > > > >     3eedc19a9d0f net: add DEV_STATS_READ() helper
> > > > > > > > > >     359bce81b841 ipv6: avoid atomic fragment on GSO
> packets
> > > > > > > > > >     6b413d52f6ab ACPI: sysfs: Fix create_pnp_modalias()
> and create_of_modalias()
> > > > > > > > > >     32aaa3b98789 wifi: iwlwifi: empty overflow queue
> during flush
> > > > > > > > > >     0e3ad00be4e8 wifi: iwlwifi: pcie: synchronize IRQs
> before NAPI
> > > > > > > > > >     a8ebe549e0ce wifi: iwlwifi: call napi_synchronize()
> before freeing rx/tx queues
> > > > > > > > > >     627a3b3f5c80 iwlwifi: pcie: adjust to Bz completion
> descriptor
> > > > > > > > > >     0d91506a40ec tcp: fix cookie_init_timestamp()
> overflows
> > > > > > > > > >     4f6e904ed4e3 chtls: fix tp->rcv_tstamp initializati=
on
> > > > > > > > > >     5d7bec7ae4db r8169: fix rare issue with broken rx
> after link-down on RTL8125
> > > > > > > > > >     e143a3c82d33 r8169: use tp_to_dev instead of open
> code
> > > > > > > > > >     3a8f4e58e1ee thermal: core: prevent potential strin=
g
> overflow
> > > > > > > > > >     bfd4ed4988aa netfilter: nf_tables: Drop pointless
> memset when dumping rules
> > > > > > > > > >     80986257d2cd PM / devfreq: rockchip-dfi: Make pmu
> regmap mandatory
> > > > > > > > > >     826120c9ba68 can: dev: can_put_echo_skb(): don't
> crash kernel if can_priv::echo_skb is accessed out of bounds
> > > > > > > > > >     28e9e015916e can: dev: can_restart(): fix race
> condition between controller restart and netif_carrier_on()
> > > > > > > > > >     ada4dc4788f1 can: dev: can_restart(): don't crash
> kernel if carrier is OK
> > > > > > > > > >     d4eb4182a823 wifi: rtlwifi: fix EDCA limit set by B=
T
> coexistence
> > > > > > > > > >     2027e74150ee tcp_metrics: do not create an entry
> from tcp_init_metrics()
> > > > > > > > > >     3f7cb7c47ce0 tcp_metrics: properly set
> tp->snd_ssthresh in tcp_init_metrics()
> > > > > > > > > >     ca7b6fa9e61a tcp_metrics: add missing barriers on
> delete
> > > > > > > > > >     227709a0e47c wifi: mt76: mt7603: improve stuck
> beacon handling
> > > > > > > > > >     eab5b0aa5065 mt76: pass original queue id from
> __mt76_tx_queue_skb to the driver
> > > > > > > > > >     75336a762539 mt76: add support for overriding the
> device used for DMA mapping
> > > > > > > > > >     77b2ab5cd1a4 mt76: dma: use kzalloc instead of
> devm_kzalloc for txwi
> > > > > > > > > >     064b32f18db1 wifi: mt76: mt7603: rework/fix rx pse
> hang check
> > > > > > > > > >     1afbb9ececd3 wifi: rtw88: debug: Fix the NULL vs
> IS_ERR() bug for debugfs_create_file()
> > > > > > > > > >     ebcbf5f5e047 net: spider_net: Use size_add() in cal=
l
> to struct_size()
> > > > > > > > > >     56e7424c6efc tipc: Use size_add() in calls to
> struct_size()
> > > > > > > > > >     3e51efcb2909 mlxsw: Use size_mul() in call to
> struct_size()
> > > > > > > > > >     dc3fef310732 gve: Use size_add() in call to
> struct_size()
> > > > > > > > > >     70f032db8516 tcp: call tcp_try_undo_recovery when a=
n
> RTOd TFO SYNACK is ACKed
> > > > > > > > > >     a2d540c74549 udp: add missing WRITE_ONCE() around
> up->encap_rcv
> > > > > > > > > >     8f7eef3a13df selftests/bpf: Correct map_fd to
> data_fd in tailcalls
> > > > > > > > > >     3eefb2fbf4ec selftests/bpf: Test tail call counting
> with bpf2bpf and data on stack
> > > > > > > > > >     ab91992ec4d4 i40e: fix potential memory leaks in
> i40e_remove()
> > > > > > > > > >     702742373650 genirq/matrix: Exclude managed
> interrupts in irq_matrix_allocated()
> > > > > > > > > >     379b120e4f27 pstore/platform: Add check for kstrdup
> > > > > > > > > >     81b8638e4ef4 x86/boot: Fix incorrect
> startup_gdt_descr.size
> > > > > > > > > >     c7e8c7452e5a x86/sev-es: Allow
> copy_from_kernel_nofault() in earlier boot
> > > > > > > > > >     0b5da8ce0f18 x86: Share definition of
> __is_canonical_address()
> > > > > > > > > >     90b263db856d futex: Don't include process MM in
> futex key on no-MMU
> > > > > > > > > >     f0d6e5841172 x86/srso: Fix SBPB enablement for
> (possible) future fixed HW
> > > > > > > > > >     565f9337b68e writeback, cgroup: switch inodes with
> dirty timestamps to release dying cgwbs
> > > > > > > > > >     2bb46b20825d vfs: fix readahead(2) on block devices
> > > > > > > > > >     20195f87db19 sched: Fix stop_one_cpu_nowait() vs
> hotplug
> > > > > > > > > >     13cde955e52e sched/uclamp: Ignore (util =3D=3D 0)
> optimization in feec() when p_util_max =3D 0
> > > > > > > > > >     cc6198ff20c0 iov_iter, x86: Be consistent about the
> __user tag on copy_mc_to_user()
> > > > > > > > > >     80529b4968a8 Linux 5.15.138
> > > > > > > > > >     3d8344a7c4a3 ALSA: hda: intel-dsp-config: Fix JSL
> Chromebook quirk detection
> > > > > > > > > >     f049c0c0037d misc: pci_endpoint_test: Add deviceID
> for J721S2 PCIe EP device support
> > > > > > > > > >     28b8ad8ccecd tty: 8250: Add Brainboxes Oxford
> Semiconductor-based quirks
> > > > > > > > > >     44c4dfac3f02 tty: 8250: Add support for Intashield
> IX cards
> > > > > > > > > >     d541ccb34de2 tty: 8250: Add support for additional
> Brainboxes PX cards
> > > > > > > > > >     60debc01fcbb tty: 8250: Fix up PX-803/PX-857
> > > > > > > > > >     1f5649aed527 tty: 8250: Fix port count of PX-257
> > > > > > > > > >     3fe3cc63c730 tty: 8250: Add support for Intashield
> IS-100
> > > > > > > > > >     a5b6390fd609 tty: 8250: Add support for Brainboxes
> UP cards
> > > > > > > > > >     738fe41b6443 tty: 8250: Add support for additional
> Brainboxes UC cards
> > > > > > > > > >     ff6059c3d234 tty: 8250: Remove UC-257 and UC-431
> > > > > > > > > >     81a4dd5e6c78 tty: n_gsm: fix race condition in
> status line change on dead connections
> > > > > > > > > >     e25197747f0e usb: raw-gadget: properly handle
> interrupted requests
> > > > > > > > > >     e5f53a68a596 usb: typec: tcpm: Fix NULL pointer
> dereference in tcpm_pd_svdm()
> > > > > > > > > >     7c4855b22a3f usb: storage: set 1.50 as the lower
> bcdDevice for older "Super Top" compatibility
> > > > > > > > > >     c48aae53850c PCI: Prevent xHCI driver from claiming
> AMD VanGogh USB3 DRD device
> > > > > > > > > >     6628c3627c02 drm/amd: Disable ASPM for VI w/ all
> Intel systems
> > > > > > > > > >     b6c3c7786e24 drm/amd: Move helper for dynamic speed
> switch check out of smu13
> > > > > > > > > >     9015169f00ee can: isotp: isotp_sendmsg(): fix TX
> state detection and wait behavior
> > > > > > > > > >     d72ff6478323 can: isotp: isotp_bind(): do not
> validate unused address information
> > > > > > > > > >     e163ad6a8639 can: isotp: add local echo tx
> processing and tx without FC
> > > > > > > > > >     b4e78ea26638 can: isotp: handle
> wait_event_interruptible() return values
> > > > > > > > > >     2fc6f337257f can: isotp: check CAN address family i=
n
> isotp_bind()
> > > > > > > > > >     f8c3bd211cf3 can: isotp: isotp_bind(): return
> -EINVAL on incorrect CAN ID formatting
> > > > > > > > > >     615c4dd64050 can: isotp: set max PDU size to 64 kBy=
te
> > > > > > > > > >     6627b96851f1 powerpc/mm: Fix boot crash with FLATME=
M
> > > > > > > > > >     f0f998648887 r8152: Check for unplug in
> r8153b_ups_en() / r8153c_ups_en()
> > > > > > > > > >     78c939a88729 r8152: Check for unplug in
> rtl_phy_patch_request()
> > > > > > > > > >     51cc28ce742e net: chelsio: cxgb4: add an error code
> check in t4_load_phy_fw
> > > > > > > > > >     bbc926199321 platform/mellanox: mlxbf-tmfifo: Fix a
> warning message
> > > > > > > > > >     db4416ea3a5d scsi: mpt3sas: Fix in error path
> > > > > > > > > >     d48b2e8189d5 fbdev: uvesafb: Call cn_del_callback()
> at the end of uvesafb_exit()
> > > > > > > > > >     e39440c3268b drm/ttm: Reorder sys manager cleanup
> step
> > > > > > > > > >     aade33d3d9bb ASoC: rt5650: fix the wrong result of
> key button
> > > > > > > > > >     fa32e21c0568 netfilter: nfnetlink_log: silence bogu=
s
> compiler warning
> > > > > > > > > >     dfcbb983eb6e spi: npcm-fiu: Fix UMA reads when
> dummy.nbytes =3D=3D 0
> > > > > > > > > >     64ae128b095d fs/ntfs3: Avoid possible memory leak
> > > > > > > > > >     27a0bed1285e fs/ntfs3: Fix directory element type
> detection
> > > > > > > > > >     94524980ee75 fs/ntfs3: Fix NULL pointer dereference
> on error in attr_allocate_frame()
> > > > > > > > > >     2de328398b50 fs/ntfs3: Fix possible NULL-ptr-deref
> in ni_readpage_cmpr()
> > > > > > > > > >     962a3d3d731c fs/ntfs3: Use kvmalloc instead of
> kmalloc(... __GFP_NOWARN)
> > > > > > > > > >     393966e79ba1 fs/ntfs3: Write immediately updated
> ntfs state
> > > > > > > > > >     59e629fc7157 fs/ntfs3: Add ckeck in
> ni_update_parent()
> > > > > > > > > >     738a3adc7c8b fbdev: atyfb: only use ioremap_uc() on
> i386 and ia64
> > > > > > > > > >     afef8af919d2 Input: synaptics-rmi4 - handle reset
> delay when using SMBus trsnsport
> > > > > > > > > >     abc62fc06d4a powerpc/85xx: Fix math emulation
> exception
> > > > > > > > > >     4bdde4dca00e dmaengine: ste_dma40: Fix PM disable
> depth imbalance in d40_probe
> > > > > > > > > >     39d2c10367a8 irqchip/stm32-exti: add missing DT IRQ
> flag translation
> > > > > > > > > >     c57aef9075e0 irqchip/riscv-intc: Mark all INTC node=
s
> as initialized
> > > > > > > > > >     eb99b6e204cd net: sched: cls_u32: Fix allocation
> size in u32_init()
> > > > > > > > > >     5e78ebe7c1db ASoC: simple-card: fixup
> asoc_simple_probe() error handling
> > > > > > > > > >     65fd21aa3805 x86: Fix .brk attribute in linker scri=
pt
> > > > > > > > > >     d4c8bf5635c4 rpmsg: Fix possible refcount leak in
> rpmsg_register_device_override()
> > > > > > > > > >     a82e0fda8a2f rpmsg: glink: Release driver_override
> > > > > > > > > >     bfd4a664ddfb rpmsg: Fix calling device_lock() on
> non-initialized device
> > > > > > > > > >     2e76b4f6218c rpmsg: Fix kfree() of static memory on
> setting driver_override
> > > > > > > > > >     5c0da71871d3 rpmsg: Constify local variable in fiel=
d
> store macro
> > > > > > > > > >     389190b25472 driver: platform: Add helper for safer
> setting of driver_override
> > > > > > > > > >     37ffa428d58c objtool/x86: add missing embedded_insn
> check
> > > > > > > > > >     f031e15d0bb8 ext4: avoid overlapping preallocations
> due to overflow
> > > > > > > > > >     f2c3a3aa6f11 ext4: fix BUG in ext4_mb_new_inode_pa(=
)
> due to overflow
> > > > > > > > > >     7a992726f727 ext4: add two helper functions
> extent_logical_end() and pa_logical_end()
> > > > > > > > > >     9e78e7709f7d x86/mm: Fix RESERVE_BRK() for older
> binutils
> > > > > > > > > >     d3201c718058 x86/mm: Simplify RESERVE_BRK()
> > > > > > > > > >     897b56acf126 x86/i8259: Skip probing when ACPI/MADT
> advertises PCAT compatibility
> > > > > > > > > >     77db87c4a4ed gve: Fix GFP flags when allocing pages
> > > > > > > > > >     8b424bdf6c9c iio: afe: rescale: Accept only offset
> channels
> > > > > > > > > >     c1eeb494f684 iio: afe: rescale: add offset support
> > > > > > > > > >     7c76b7db5521 iio: afe: rescale: expose scale
> processing function
> > > > > > > > > >     c60671502dc2 iio: afe: rescale: reorder includes
> > > > > > > > > >     27dd09f5ec7f clk: Sanitize possible_parent_show to
> Handle Return Value of of_clk_get_parent_name
> > > > > > > > > >     c27ca4aebbee sparc32: fix a braino in fault handlin=
g
> in csum_and_copy_..._user()
> > > > > > > > > >     21b07a2e6095 perf/core: Fix potential NULL deref
> > > > > > > > > >     6efd498009b9 nvmem: imx: correct nregs for i.MX6UL
> > > > > > > > > >     0c2948118c34 nvmem: imx: correct nregs for i.MX6SLL
> > > > > > > > > >     6e22bf6f00d5 nvmem: imx: correct nregs for i.MX6ULL
> > > > > > > > > >     e0f95b831b4a misc: fastrpc: Clean buffers on remote
> invocation failures
> > > > > > > > > >     c4957f00f9e2 tracing/kprobes: Fix the description o=
f
> variable length arguments
> > > > > > > > > >     cdc57093b470 i2c: aspeed: Fix i2c bus hang in slave
> read
> > > > > > > > > >     e97d374a2506 i2c: stm32f7: Fix PEC handling in case
> of SMBUS transfers
> > > > > > > > > >     2766a872103b i2c: muxes: i2c-demux-pinctrl: Use
> of_get_i2c_adapter_by_node()
> > > > > > > > > >     48b58f7469e5 i2c: muxes: i2c-mux-gpmux: Use
> of_get_i2c_adapter_by_node()
> > > > > > > > > >     cb65e692765b i2c: muxes: i2c-mux-pinctrl: Use
> of_get_i2c_adapter_by_node()
> > > > > > > > > >     eace761f35a1 iio: adc: xilinx-xadc: Correct
> temperature offset/scale for UltraScale
> > > > > > > > > >     70322a446ef2 iio: adc: xilinx-xadc: Don't clobber
> preset voltage/temperature thresholds
> > > > > > > > > >     3c1312b5d49a iio: exynos-adc: request second
> interupt only when touchscreen mode is used
> > > > > > > > > >     4e14f2d5885f kasan: print the original fault addr
> when access invalid shadow
> > > > > > > > > >     bdfa4fa7588d i40e: Fix wrong check for
> I40E_TXR_FLAGS_WB_ON_ITR
> > > > > > > > > >     d5c175f4cea6 gtp: fix fragmentation needed check
> with gso
> > > > > > > > > >     c0dad0c0924c gtp: uapi: fix GTPA_MAX
> > > > > > > > > >     852fb4ce426d tcp: fix wrong RTO timeout when
> received SACK reneging
> > > > > > > > > >     83cfa3b51a78 r8152: Release firmware if we have an
> error in probe
> > > > > > > > > >     e0f9231ccd6c r8152: Cancel hw_phy_work if we have a=
n
> error in probe
> > > > > > > > > >     ff42b0a55659 r8152: Run the unload routine if we
> have errors during probe
> > > > > > > > > >     6fa3b9f9478e r8152: Increase USB control msg timeou=
t
> to 5000ms as per spec
> > > > > > > > > >     76873f2eadc0 net: usb: smsc95xx: Fix uninit-value
> access in smsc95xx_read_reg
> > > > > > > > > >     6afd112c3f95 net: ieee802154: adf7242: Fix some
> potential buffer overflow in adf7242_stats_show()
> > > > > > > > > >     46cd35e4e774 igc: Fix ambiguity in the ethtool
> advertising
> > > > > > > > > >     49529413eaed neighbour: fix various data-races
> > > > > > > > > >     667554946360 igb: Fix potential memory leak in
> igb_add_ethtool_nfc_entry
> > > > > > > > > >     263421905346 treewide: Spelling fix in comment
> > > > > > > > > >     bc0c4bc119d2 i40e: Fix I40E_FLAG_VF_VLAN_PRUNING
> value
> > > > > > > > > >     c532c5df01ad r8169: fix the KCSAN reported data rac=
e
> in rtl_rx while reading desc->opts1
> > > > > > > > > >     6afb294c88c6 r8169: fix the KCSAN reported data-rac=
e
> in rtl_tx while reading TxDescArray[entry].opts1
> > > > > > > > > >     9d7b3838428c r8169: fix the KCSAN reported data-rac=
e
> in rtl_tx() while reading tp->cur_tx
> > > > > > > > > >     04dbfa4122e0 firmware/imx-dsp: Fix use_after_free i=
n
> imx_dsp_setup_channels()
> > > > > > > > > >     0d587b86cd0d drm/dp_mst: Fix NULL deref in
> get_mst_branch_device_by_guid_helper()
> > > > > > > > > >     8860f0175e51 vsock/virtio: initialize
> the_virtio_vsock before using VQs
> > > > > > > > > >     762c251c7f5c vsock/virtio: add support for device
> suspend/resume
> > > > > > > > > >     1e02df6f6907 vsock/virtio: factor our the code to
> initialize and delete VQs
> > > > > > > > > >     15a8cac3c250 drm/i915/pmu: Check if pmu is closed
> before stopping event
> > > > > > > > > >     43bd431a5dd9 nfsd: lock_rename() needs both
> directories to live on the same fs
> > > > > > > > > >     556b68d9b95f mm/migrate: fix do_pages_move for
> compat pointers
> > > > > > > > > >     c4071c6114de mm/page_alloc: correct start page when
> guard page debug is enabled
> > > > > > > > > >     3a6cee2bfb53 vhost: Allow null msg.size on
> VHOST_IOTLB_INVALIDATE
> > > > > > > > > >     fbc9a8718f31 virtio-mmio: fix memory leak of vm_dev
> > > > > > > > > >     862a356bc986 virtio_balloon: Fix endless deflation
> and inflation on arm64
> > > > > > > > > >     41bb770e42bc mcb-lpc: Reallocate memory region to
> avoid memory overlapping
> > > > > > > > > >     f2ac8b2643dd mcb: Return actual parsed size when
> reading chameleon table
> > > > > > > > > >     90918ef995b5 mptcp: more conservative check for zer=
o
> probes
> > > > > > > > > >     fd2b2dab6f5b tcp: cleanup tcp_remove_empty_skb() us=
e
> > > > > > > > > >     68342755b9b2 tcp: remove dead code from
> tcp_sendmsg_locked()
> > > > > > > > > >     0f482ad7b1a5 pinctrl: qcom: lpass-lpi: fix
> concurrent register updates
> > > > > > > > > >     51b054f6fe01 ASoC: codecs: wcd938x: fix runtime PM
> imbalance on remove
> > > > > > > > > >     cb34f4e79e54 ASoC: codecs: wcd938x: fix resource
> leaks on bind errors
> > > > > > > > > >     12952a23a5da Linux 5.15.137
> > > > > > > > > >     dff33880d40a xfrm6: fix inet6_dev refcount underflo=
w
> problem
> > > > > > > > > >     5a9d05a4f1c3 Bluetooth: hci_sock: Correctly bounds
> check and pad HCI_MON_NEW_INDEX name
> > > > > > > > > >     a6df96ee0b45 Bluetooth: hci_sock: fix slab oob read
> in create_monitor_event
> > > > > > > > > >     c08d609fb2b6 phy: mapphone-mdm6600: Fix pinctrl_pm
> handling for sleep pins
> > > > > > > > > >     e1b030b101f6 phy: mapphone-mdm6600: Fix runtime PM
> for remove
> > > > > > > > > >     59f1095ab58e phy: mapphone-mdm6600: Fix runtime
> disable on probe
> > > > > > > > > >     b618062c0b13 serial: 8250: omap: Move uart_write()
> inside PM section
> > > > > > > > > >     67f29cd2f851 ASoC: pxa: fix a memory leak in probe(=
)
> > > > > > > > > >     76d04c339508 gpio: vf610: set value before the
> direction to avoid a glitch
> > > > > > > > > >     4b129e3964b3 platform/x86: asus-wmi: Map 0x2a code,
> Ignore 0x2b and 0x2c events
> > > > > > > > > >     e1a058cc2467 platform/x86: asus-wmi: Change
> ASUS_WMI_BRN_DOWN code from 0x20 to 0x2e
> > > > > > > > > >     c6bbe51dcdf3 platform/surface: platform_profile:
> Propagate error if profile registration fails
> > > > > > > > > >     a73c8d716938 s390/cio: fix a memleak in
> css_alloc_subchannel
> > > > > > > > > >     c8b6c2df1e7d selftests/ftrace: Add new test case
> which checks non unique symbol
> > > > > > > > > >     3ad81e6affcb s390/pci: fix iommu bitmap allocation
> > > > > > > > > >     71d224acc4d1 perf: Disallow mis-matched inherited
> group reads
> > > > > > > > > >     5aa89a11a2a6 USB: serial: option: add Fibocom to
> DELL custom modem FM101R-GL
> > > > > > > > > >     8c376d863618 USB: serial: option: add entry for
> Sierra EM9191 with new firmware
> > > > > > > > > >     483221216176 USB: serial: option: add Telit
> LE910C4-WWX 0x1035 composition
> > > > > > > > > >     e750fb71dc6a nvme-rdma: do not try to stop
> unallocated queues
> > > > > > > > > >     a9fd6d44abbc nvme-pci: add BOGUS_NID for Intel 0a54
> device
> > > > > > > > > >     071382bda1da ACPI: irq: Fix incorrect return value
> in acpi_register_gsi()
> > > > > > > > > >     431a5010bce2 NFSv4.1: fixup use
> EXCHGID4_FLAG_USE_PNFS_DS for DS server
> > > > > > > > > >     5762e72ef1b0 pNFS: Fix a hang in nfs4_evict_inode()
> > > > > > > > > >     5a3abee2eee9 Revert "pinctrl: avoid unsafe code
> pattern in find_pinctrl()"
> > > > > > > > > >     24959825377f mmc: core: Capture correct oemid-bits
> for eMMC cards
> > > > > > > > > >     8041e7b7e7e9 mmc: core: sdio: hold retuning if sdio
> in 1-bit mode
> > > > > > > > > >     262029c0c58c mmc: mtk-sd: Use
> readl_poll_timeout_atomic in msdc_reset_hw
> > > > > > > > > >     3e363db1c13a mtd: physmap-core: Restore map_rom
> fallback
> > > > > > > > > >     71823463b1b2 mtd: spinand: mic

--0000000000006eac74061312f837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 7, 2024, 4:29=E2=80=AFAM Bruce Ashfield &l=
t;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Mar 7, 2024 at 9=
:00=E2=80=AFAM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Mar 7, 2024 at 3:46=E2=80=AFAM Steve Sakoman via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer=
" target=3D"_blank">lists.openembedded.org</a> &lt;steve=3D<a href=3D"mailt=
o:sakoman.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">=
sakoman.com@lists.openembedded.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Mar 6, 2024 at 7:42=E2=80=AFAM Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank" rel=3D"noreferrer">b=
ruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, Mar 6, 2024 at 12:38=E2=80=AFPM Steve Sakoman &lt;<a=
 href=3D"mailto:steve@sakoman.com" target=3D"_blank" rel=3D"noreferrer">ste=
ve@sakoman.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, Mar 6, 2024 at 6:04=E2=80=AFAM Steve Sakoman vi=
a <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">lists.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:s=
akoman.com@lists.openembedded.org" target=3D"_blank" rel=3D"noreferrer">sak=
oman.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Wed, Mar 6, 2024 at 5:59=E2=80=AFAM Bruce Ashfi=
eld &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; On Wed, Mar 6, 2024 at 10:43=E2=80=AFAM Steve=
 Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank" rel=3D"=
noreferrer">steve@sakoman.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM S=
teve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" target=3D"_blank" rel=
=3D"noreferrer">steve@sakoman.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Hi Bruce,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; The 5.10 version bumps look fine in=
 testing, but sadly this 5.15<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; version bump breaks qemux86-64-ptes=
t:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; AssertionError: Failed ptests:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; {&#39;parted&#39;: [&#39;t1104-remo=
ve-and-add-partition.sh&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;t8000-loop.sh&#39;,<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&#39;t8001-loop-blkpg.sh&#39;]}<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Failure is reproducible 100% of the=
 time, so there is that ...<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; After=C2=A0 wading through the hundreds =
of changes in this version bump<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; from 5.15.124 to 5.15.141 I found this i=
n the 5.13.132 portion that<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; looks suspicious:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; 072cd213c64f block: don&#39;t add or res=
ize partition on the disk with<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; GENHD_FL_NO_PART<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; c6ce1c5dd327 block: rename GENHD_FL_NO_P=
ART_SCAN to GENHD_FL_NO_PART<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; It could very well be that, I haven&#39;t bee=
n able to get to any local<br>
&gt; &gt; &gt; &gt; &gt; &gt; testing on this<br>
&gt; &gt; &gt; &gt; &gt; &gt; yet.<br>
&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; I will go look at parted for commits that ind=
icate they are fixing a<br>
&gt; &gt; &gt; &gt; &gt; &gt; kernel interface<br>
&gt; &gt; &gt; &gt; &gt; &gt; that sounds similar .. since we don&#39;t wan=
t to revert an offending commit, the<br>
&gt; &gt; &gt; &gt; &gt; &gt; way to fix this is via selective update of pa=
rted.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I&#39;m doing a test kirkstone build that bumps pa=
rted to the same version<br>
&gt; &gt; &gt; &gt; &gt; as in master.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; This will at least let us know whether it has been=
 fixed in upstream parted.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The test completed and I get the same failure with the =
most recent parted version.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; So apparently not fixed in parted.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Which means that the newer kernels have some sort of additio=
nal fix or a revert.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ll have a look for that as well.<br>
&gt; &gt;<br>
&gt; &gt; From looking at how Ubuntu deals with this<br>
&gt; &gt; (<a href=3D"https://bugs.launchpad.net/ubuntu/+source/linux/+bug/=
2056143" rel=3D"noreferrer noreferrer" target=3D"_blank">https://bugs.launc=
hpad.net/ubuntu/+source/linux/+bug/2056143</a>):<br>
&gt; &gt;<br>
&gt; &gt; -- Impact --<br>
&gt; &gt; In 22.04/Jammy with the GA 5.15 kernel there was an upstream chan=
ge<br>
&gt; &gt; preventing partition table operations when GENHD_FL_NO_PART is se=
t.<br>
&gt; &gt;=C2=A0 1a721de8489f &quot;block: don&#39;t add or resize partition=
 on the disk with<br>
&gt; &gt; GENHD_FL_NO_PART&quot;<br>
&gt; &gt; Beside of changing return codes and breaking some user-space that=
 way<br>
&gt; &gt; this also causes loop block devices to no longer be able to have<=
br>
&gt; &gt; partitions manually created. This is because the loop block drive=
r<br>
&gt; &gt; uses GENHD_FL_NO_PART to prevent active partition scans.<br>
&gt; &gt;<br>
&gt; &gt; -- Fix --<br>
&gt; &gt; This was changed in 5.19 (and thus Mantic is not affected) by<br>
&gt; &gt; introducing a separate flag to prevent those scans:<br>
&gt; &gt;=C2=A0 b9684a71fca7 &quot;block, loop: support partitions without =
scanning&quot;<br>
&gt; &gt; The fix depends on a larger rewrite so it cannot be simply picked=
. The<br>
&gt; &gt; biggest change from the original is moving the check for the new =
flag<br>
&gt; &gt; into a helper function in genhd.h which checks whether a disk sho=
uld<br>
&gt; &gt; be scanned for partitions. That function was dropped with the ups=
tream<br>
&gt; &gt; rewrite and checking moved into the loop driver directly. But it =
felt<br>
&gt; &gt; like adjusting the helper was the better approach.<br>
&gt; &gt;<br>
&gt; &gt; Note: The upstream patch has a follow-up change submitted:<br>
&gt; &gt;=C2=A0 =C2=A0748008e1da92 &quot;block: don&#39;t add partitions if=
 GD_SUPPRESS_PART_SCAN is set&quot;<br>
&gt; &gt; We do _NOT_ need that in Jammy/5.15 because block/partitions/core=
.c:<br>
&gt; &gt; blk_add_partitions() checks disk_part_scan_enabled() which was wh=
ere<br>
&gt; &gt; we added the check for the backport instead of modifying<br>
&gt; &gt; disk_scan_partitions() directly.<br>
&gt;<br>
&gt; Forgot to add this:<br>
&gt;<br>
&gt; <a href=3D"https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/lin=
ux/+git/jammy/commit/?h=3Dmaster-next--2024.03.04-1&amp;id=3Dc3032b60ff7b39=
48325b8f2bd688b9a74be3cfb9" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/jammy/c=
ommit/?h=3Dmaster-next--2024.03.04-1&amp;id=3Dc3032b60ff7b3948325b8f2bd688b=
9a74be3cfb9</a><br>
&gt;<br>
<br>
Assuming that I&#39;m reading the summary correctly, I&#39;m inclined to<br=
>
cherry pick 748008e1da92 [ block: don&#39;t add partitions if<br>
GD_SUPPRESS_PART_SCAN is set]<br>
into the linux-yocto 5.15 kernel branches.<br>
<br>
The commit referenced in the link above doesn&#39;t cherry-pick cleanly<br>
(it seems tangled<br>
up in other Ubuntu kernel changes), but 748008e1da92 is simple and<br>
does cherry-pick<br>
without any fuss.<br>
<br>
I never did get set up to run the tests myself, but I can send you SRCREV b=
umps<br>
with 748008e1da92 merged into the tree. That&#39;s the fastest route to<br>
get it tested.<br>
Alternatively, we wait for me to get a test environment setup or it<br>
could even be a<br>
SRC_URI patch (versus me merging it).<br>
<br>
Worst thing that can happen if I merge it, is that it doesn&#39;t fix the<b=
r>
problem and I do<br>
a revert, or just stack more changes on top to fix the problem.<br>
<br>
Let me know your preference, and I&#39;ll pull something together.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div=
><div dir=3D"auto">I can try a SRC_URI patch first to see if it solves the =
issue.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Steve</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">
<br>
Bruce<br>
<br>
<br>
&gt; Steve<br>
&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; On Mon, Dec 4, 2023 at 6:40=E2=80=
=AFPM &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; From: Bruce Ashfield &lt;<a hr=
ef=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank" rel=3D"noreferrer"=
>bruce.ashfield@gmail.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; Updating=C2=A0 to the latest k=
org -stable release that comprises<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; the following commits:<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09b91d36ba30=
1 Linux 5.15.141<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0313a34d1c0e=
e io_uring: fix off-by one bvec index<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A049ae2e4e8ed=
3 USB: dwc3: qcom: fix wakeup after probe deferral<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb17fb4b160=
a USB: dwc3: qcom: fix software node leak on probe errors<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A098f0e9b6276=
f usb: dwc3: set the dma max_seg_size<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01a3dcb1d811=
d usb: dwc3: Fix default mode initialization<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a22702a8184=
4 USB: dwc2: write HCINT with INTMASK applied<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01134fde9208=
8 usb: typec: tcpm: Skip hard reset when in error recovery<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A064830d04151=
5 USB: serial: option: don&#39;t claim interface 4 for ZTE MF290<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09611cbc6a13=
2 USB: serial: option: fix FM101R-GL defines<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8d80b1fbac=
f USB: serial: option: add Fibocom L7xx modules<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de8c6fce8d0=
9 usb: cdnsp: Fix deadlock issue during using NCM gadget<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dd0cc4b69f7=
d bcache: fixup lock c-&gt;root error<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a912742d841=
1 bcache: fixup init dirty data errors<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0137660f8446=
2 bcache: prevent potential division by zero error<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f7077ce8d97=
b bcache: check return value from btree_node_alloc_replacement()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01eed0109210=
1 dm-delay: fix a race between delay_presuspend and delay_bio<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d181a7a1d55=
d hv_netvsc: Mark VF as slave before exposing it to user-mode<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A097683466e24=
c hv_netvsc: Fix race of register_netdevice_notifier and VF register<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03841921018a=
2 USB: serial: option: add Luat Air72*U series products<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06062c527d04=
0 s390/dasd: protect device queue against concurrent access<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A035b5d86e43e=
c io_uring/fs: consider link-&gt;flags when getting path for LINKAT<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02bb75a2c349=
0 bcache: fixup multi-threaded bch_sectors_dirty_init() wake-up race<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06f09318fd90=
a md: fix bi_status reporting in md_end_clone_io<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072ecb9753cb=
e bcache: replace a mistaken IS_ERR() by IS_ERR_OR_NULL() in btree_gc_coale=
sce()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e09ba90f1ad=
0 swiotlb-xen: provide the &quot;max_mapping_size&quot; method<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00f05021e937=
c ACPI: resource: Skip IRQ override on ASUS ExpertBook B1402CVA<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f95e9f7afe8=
6 proc: sysctl: prevent aliased sysctls from getting passed to init<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f3880fc011=
c ext4: make sure allocate pending entry not fail<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e33eb499758=
5 ext4: fix slab-use-after-free in ext4_es_insert_extent()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0859893f6190=
6 ext4: using nofail preallocation in ext4_es_insert_extent()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0048e7f38b31=
c ext4: using nofail preallocation in ext4_es_insert_delayed_block()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0580b9dd6ab0=
b ext4: using nofail preallocation in ext4_es_remove_extent()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066bc78a295b=
3 ext4: use pre-allocated es in __es_remove_extent()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b1995ba6269=
c ext4: use pre-allocated es in __es_insert_extent()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0edec12712ae=
1 ext4: factor out __es_alloc_extent() and __es_free_extent()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e82d05cf5cc=
b ext4: add a new helper to check if es must be kept<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0612edd48887=
2 media: qcom: camss: Fix csid-gen2 for test pattern generator<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ceb5276d8c9=
9 media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE when VC is greater than =
3<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f001e6f6269=
3 media: camss: sm8250: Virtual channels for CSID<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09fb81ca7aa0=
5 media: camss: Replace hard coded value with parameter<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08ef9b32f20a=
b MIPS: KVM: Fix a build warning about variable set but not used<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ddaca6b20f=
7 lockdep: Fix block chain corruption<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A061747778a88=
b USB: dwc3: qcom: fix ACPI platform device leak<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A002747288997=
0 USB: dwc3: qcom: fix resource leaks on probe deferral<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e26c6febac4=
3 nvmet: nul-terminate the NQNs passed in the connect command<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b5d50c6a609=
d afs: Fix file locking on R/O volumes to operate in local mode<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A084ebfbed3ae=
0 afs: Return ENOENT if no cell DNS record can be found<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06aeac88a45d=
e net: axienet: Fix check for partial TX checksum<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0293acba8410=
8 amd-xgbe: propagate the correct speed and duplex status<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3874cc25a7=
0 amd-xgbe: handle the corner-case during tx completion<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e949dbc28cd=
5 amd-xgbe: handle corner-case during sfp hotplug<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A001a8b94726b=
1 octeontx2-pf: Fix ntuple rule creation to direct packet to VF with higher=
 Rx queue than its PF<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fcc4a03ad3b=
1 arm/xen: fix xen_vcpu_info allocation alignment<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A090072af9efe=
8 net/smc: avoid data corruption caused by decline<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066c023469b3=
e net: usb: ax88179_178a: fix failed operations during ax88179_reset<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ba81c5228ef=
8 ipv4: Correct/silence an endian warning in __ip_do_redirect<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0364406d4c11=
4 HID: fix HID device resource race between HID core and debugging support<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A052badc06b11=
9 HID: core: store the unique system identifier in hid_device<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0221be624a55=
d drm/rockchip: vop: Fix color for RGB888/BGR888 format on VOP full<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0c835fd7d8=
9 ata: pata_isapnp: Add missing error check for devm_ioport_map()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09754a498aa5=
b octeontx2-pf: Fix memory leak during interface down<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be41c0c4a63=
2 wireguard: use DEV_STATS_INC()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f163a6d17a9=
5 drm/panel: simple: Fix Innolux G101ICE-L01 timings<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0608de3a587e=
b drm/panel: simple: Fix Innolux G101ICE-L01 bus flags<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A018bd108a13c=
b drm/panel: auo,b101uan08.3: Fine tune the panel power sequence<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09fe5718d3f0=
9 drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8a49336e1d=
e afs: Make error on cell lookup failure consistent with OpenAFS<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ac239fccf5a=
5 afs: Fix afs_server_list to be cleaned up with RCU<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a78d278e01b=
1 Linux 5.15.140<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0947c9e12ddd=
6 driver core: Release all resources during unbind before updating device l=
inks<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a434d5c382=
3 Input: xpad - add VID for Turtle Beach controllers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cbc7c29dff0=
f tracing: Have trace_event_file have ref counters<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01dcf90c9fa0=
1 powerpc/powernv: Fix fortify source warnings in opal-prd.c<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03d7912710e5=
e io_uring/fdinfo: lock SQ thread while retrieving thread cpu/pid<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0595b051c83a=
1 drm/amd/display: Change the DMCUB mailbox memory location from FB to inbo=
x<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2a6e97c4b3=
3 drm/amdgpu: fix error handling in amdgpu_bo_list_get()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e380992c479=
b drm/amdgpu: don&#39;t use ATRM for external devices<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04ff985b8810=
c drm/i915: Fix potential spectre vulnerability<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea0c4d5ec57=
f drm/amd/pm: Handle non-terminated overdrive commands.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09ce842d7762=
a ext4: add missed brelse in update_backups<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ce19c20064b=
6 ext4: remove gdb backup copy for meta bg in setup_new_flex_group_blocks<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ac45d8e34be=
d ext4: correct the start block of counting reserved clusters<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f9842c4b92=
5 ext4: correct return value of ext4_convert_meta_bg<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08798d3b2722=
d ext4: correct offset of gdb backup in non meta_bg group to update_backups=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08a3bb38bfda=
f ext4: apply umask if ACL support is disabled<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d5c380149b9=
6 Revert &quot;net: r8169: Disable multicast filter for RTL8168H and RTL810=
7E&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ad3d8594d5=
e media: qcom: camss: Fix missing vfe_lite clocks check<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0376cf0695=
0 media: qcom: camss: Fix VFE-17x vfe_disable_output()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f733387d17=
f media: qcom: camss: Fix vfe_get() error jump<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0841fc648fbb=
5 media: qcom: camss: Fix pm_domain_on sequence in probe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04c9c43f79a1=
2 mmc: sdhci-pci-gli: GL9750: Mask the replay timer timeout of AER<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072bf271c5a7=
7 r8169: fix network lost after resume on DASH systems<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0468e3ebf478=
6 mm: kmem: drop __GFP_NOFAIL when allocating objcg vectors<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00387978fda0=
7 mmc: sdhci-pci-gli: A workaround to allow GL9750 to enter ASPM L1.2<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0070b3ccb9b8=
b riscv: kprobes: allow writing to x0<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd0e9f475a4=
6 nfsd: fix file memleak on client_opens_release<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0114c9d732cf=
9 media: ccs: Correctly initialise try compose rectangle<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c8aeeb2c54=
9 media: venus: hfi: add checks to handle capabilities from firmware<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cdeb0a4cf32=
7 media: venus: hfi: fix the check to handle session buffer requirement<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d62570f75f=
e media: venus: hfi_parser: Add check to keep the number of codecs within r=
ange<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d0d831e7d68=
d media: sharp: fix sharp encoding<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06003733c8f9=
5 media: lirc: drop trailing space from scancode transmit<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e4088d7d8f1=
1 f2fs: avoid format-overflow warning<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A012055238d04=
6 i2c: i801: fix potential race in i801_block_transaction_byte_by_byte<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0336e6db5c12=
0 net: phylink: initialize carrier state at creation<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d8cb287d31c=
b net: dsa: lan9303: consequently nested-lock physical MDIO<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0656262cb0f9=
5 net: ethtool: Fix documentation of ethtool_sprintf()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0acca20cc16f=
3 s390/ap: fix AP bus crash on early config change callback invocation<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0019b7d42a41=
6 i2c: designware: Disable TX_EMPTY irq while waiting for block length byte=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c6e89348fd5=
8 sbsa_gwdt: Calculate timeout with 64-bit math<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0132670ae9ff=
b lsm: fix default return value for inode_getsecctx<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0223196b5060=
5 lsm: fix default return value for vm_enough_memory<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A006d320ca170=
b Revert &quot;i2c: pxa: move to generic GPIO recovery&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ddec3d04f87=
4 Revert ncsi: Propagate carrier gain/loss events to the NCSI controller<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ad0b74d0f33=
1 powerpc/pseries/ddw: simplify enable_ddw()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3e993de400=
e arm64: dts: qcom: ipq6018: Fix tcsr_mutex register size<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b99ac20612c=
a arm64: dts: qcom: ipq6018: switch TCSR mutex to MMIO<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aaf0a07d608=
8 ksmbd: fix slab out of bounds write in smb_inherit_dacl()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c701423bb0=
3 Bluetooth: btusb: Add 0bda:b85b for Fn-Link RTL8852BE<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A036a573b3255=
0 Bluetooth: btusb: Add RTW8852BE device 13d3:3570 to device tables<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4976160a0a=
4 bluetooth: Add device 13d3:3571 to device tables<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0603e77e9e8c=
0 bluetooth: Add device 0bda:887b to device tables<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9bb966c50a=
7 Bluetooth: btusb: Add Realtek RTL8852BE support ID 0x0cb8:0xc559<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cf642ee641c=
e cpufreq: stats: Fix buffer overflow detection in trans_stats()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A063e09cdfe94=
8 regmap: Ensure range selector registers are updated after cache sync<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c49e74e95b=
f tty: serial: meson: fix hard LOCKUP on crtscts mode<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06f26b6a61b0=
8 serial: meson: Use platform_get_irq() to get the interrupt<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0450fa8bf803=
f ALSA: hda/realtek - Enable internal speaker of ASUS K6500ZC<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc549ba50bb=
8 ALSA: hda/realtek - Add Dell ALC295 to pin fall back table<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0767c988771c=
b ALSA: info: Fix potential deadlock at disconnection<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A009022ae6626=
1 xhci: Enable RPM on controllers that support low-power states<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A068574fe2e48=
8 parisc/pgtable: Do not drop upper 5 address bits of physical address<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ea7593c18ff=
7 parisc: Prevent booting 64-bit kernels on PA1.x machines<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02c9092e8b29=
a i3c: master: svc: fix SDA keep low when polling IBIWON timeout happen<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0da754f92fc0=
2 i3c: master: svc: fix check wrong status register in irq handler<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ba77b6b45d=
6 i3c: master: svc: fix ibi may not return mandatory data byte<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0a70ed4a58=
0 i3c: master: svc: fix wrong data return when IBI happen during start fram=
e<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07383675aba2=
f i3c: master: svc: fix race condition in ibi work thread<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc7efd1054f=
4 i3c: master: cdns: Fix reading status register<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3c6a08c2b7=
7 mtd: cfi_cmdset_0001: Byte swap OTP info<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a4668088128=
d mm/memory_hotplug: use pfn math in place of direct struct page manipulati=
on<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0792a796085c=
f mm/cma: use nth_page() in place of direct struct page manipulation<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09b59fc31226=
e s390/cmma: fix detection of DAT pages<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A045bb94aab89=
1 dmaengine: stm32-mdma: correct desc prep when channel running<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A091659b77e93=
7 mcb: fix error handling for different scenarios when parsing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0534790fde89=
0 tracing: Have the user copy of synthetic event address use correct contex=
t<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f6237afabc3=
4 i2c: core: Run atomic i2c xfer when !preemptible<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0931aa7154bc=
4 kernel/reboot: emergency_restart: Set correct system_state<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07a3424c3b76=
a quota: explicitly forbid quota files from being encrypted<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A047f50983216=
8 jbd2: fix potential data lost in recovering journal raced with synchroniz=
ing fs bdev<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f13e1ea4569=
9 ASoC: codecs: wsa-macro: fix uninitialized stack variables with name pref=
ix<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028436d8092a=
d selftests/resctrl: Reduce failures due to outliers in MBA/MBM tests<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ce63598a1f=
b selftests/resctrl: Remove duplicate feature check from CMT test<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e90efe17fc0=
7 netfilter: nf_tables: split async and sync catchall in two functions<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d9506c766c=
9 netfilter: nf_tables: remove catchall element in GC sync path<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A096fc7a50a27=
8 PCI: keystone: Don&#39;t discard .probe() callback<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0d394df981=
2 PCI: keystone: Don&#39;t discard .remove() callback<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f4f12667167=
c KEYS: trusted: Rollback init_trusted() consistently<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c407ff72fb3=
a genirq/generic_chip: Make irq_remove_generic_chip() irqdomain aware<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc8a14e3c63=
0 mmc: meson-gx: Remove setting of CMD_CFG_ERROR<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a51e6b4da7=
1 wifi: ath11k: fix htt pktlog locking<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0426e718ce9b=
a wifi: ath11k: fix dfs radar event locking<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9d84413b1b=
7 wifi: ath11k: fix temperature event locking<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ff849948c1=
1 ima: detect changes to the backing overlay file<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04584a421a6d=
9 ima: annotate iint mutex to avoid lockdep false positive warnings<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04049576c639=
f ACPI: FPDT: properly handle invalid FPDT subtables<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0628e76e684c=
8 firmware: qcom_scm: use 64-bit calling convention only when client is 64-=
bit<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06eb8c191e36=
0 btrfs: don&#39;t arbitrarily slow down delalloc if we&#39;re committing<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b99626b28c=
a rcu: kmemleak: Ignore kmemleak false positives when RCU-freeing objects<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A071f5344f477=
c PM: hibernate: Clean up sync_read handling in snapshot_write_next()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A057dbc0eb8ab=
e PM: hibernate: Use __get_safe_page() rather than touching the list<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A087a30633b5d=
3 arm64: dts: qcom: ipq6018: Fix hwlock index for SMEM<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ebaee06a729=
2 rcu/tree: Defer setting of jiffies during stall reset<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0057d1034d01=
2 svcrdma: Drop connection after an RDMA Read error<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0541b3757fd4=
4 wifi: wilc1000: use vmm_table as array in wilc struct<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b156f62f19d=
a PCI: exynos: Don&#39;t discard .remove() callback<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f8879672100=
2 PCI/ASPM: Fix L1 substate handling in aspm_attr_store_common()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0467864d55b5=
2 mmc: sdhci_am654: fix start loop index for TAP value parsing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef34a97bb9c=
b mmc: vub300: fix an error code<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A036adb6204cf=
f clk: qcom: ipq6018: drop the CLK_SET_RATE_PARENT flag from PLL clocks<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0090b167b2c4=
1 clk: qcom: ipq8074: drop the CLK_SET_RATE_PARENT flag from PLL clocks<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A018640a1818f=
1 clk: socfpga: Fix undefined behavior bug in struct stratix10_clock_data<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04d17b54c9be=
3 parisc/pdc: Add width field to struct pdc_model<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0936c9c10efa=
e arm64: Restrict CPU_BIG_ENDIAN to GNU as or LLVM IAS 15.x or newer<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08b24bb54bf3=
a ACPI: resource: Do IRQ override on TongFang GMxXGxx<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05619c34d3c4=
c watchdog: move softlockup_panic back to early_param<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a6c3a1fe09a=
2 PCI/sysfs: Protect driver&#39;s D3cold preference from user space<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A001975bee0a1=
4 hvc/xen: fix event channel handling for secondary consoles<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cfd543c1087=
1 hvc/xen: fix error path in xen_hvc_init() to always register frontend dri=
ver<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0730e08cb910=
1 hvc/xen: fix console unplug<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fa0b93a3de4=
0 tty/sysrq: replace smp_processor_id() with get_cpu()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092e6c0f00d3=
8 audit: don&#39;t WARN_ON_ONCE(!current-&gt;mm) in audit_exe_compare()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e29c095f1ad=
4 audit: don&#39;t take task_lock() in audit_exe_compare() code path<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05eb6519f483=
e KVM: x86: Ignore MSR_AMD64_TW_CFG access<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c49ef7041f=
2 KVM: x86: hyper-v: Don&#39;t auto-enable stimer on write from user-space<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fe6b461c37c=
b x86/cpu/hygon: Fix the CPU topology evaluation for real<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a2adf48d8b=
1 crypto: x86/sha - load modules based on CPU features<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be079aa71a1=
2 scsi: qla2xxx: Fix system crash due to bad pointer access<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06ba3569f78d=
3 scsi: megaraid_sas: Increase register read retry rount from 3 to 30 for s=
elected registers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06a33b581003=
1 scsi: mpt3sas: Fix loop logic<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03c5aede46cd=
c bpf: Fix precision tracking for BPF_ALU | BPF_TO_BE | BPF_END<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0403470431b1=
5 bpf: Fix check_stack_write_fixed_off() to correctly spill imm<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ba115f6c3a8=
c randstruct: Fix gcc-plugin performance mode to stay in group<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02771fac4382=
b powerpc/perf: Fix disabling BHRB and instruction sampling<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07e450cc9ad5=
4 media: venus: hfi: add checks to perform sanity on queue pointers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01566e8be73f=
d i915/perf: Fix NULL deref bugs with drm_dbg() calls<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A035c17257ef0=
9 xfs: Fix unreferenced object reported by kmemleak in xfs_sysfs_init()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05db146322b1=
7 xfs: fix memory leak in xfs_errortag_init<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c540284d848=
8 xfs: fix exception caused by unexpected illegal bestcount in leaf dir<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05212d586e76=
f xfs: avoid a UAF when log intent item recovery fails<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ba179cc1210=
9 xfs: fix inode reservation space for removing transaction<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b7847653a2d=
6 xfs: Fix false ENOSPC when performing direct write on a delalloc extent i=
n cow fork<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092d38b87e88=
6 xfs: add missing cmap-&gt;br_state =3D XFS_EXT_NORM update<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d0baec78e8=
a xfs: fix intermittent hang during quotacheck<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076545c0e881=
b xfs: don&#39;t leak memory when attr fork loading fails<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb888caf27d=
9 xfs: fix use-after-free in xattr node block inactivation<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04cb3842967e=
6 xfs: flush inode gc workqueue before clearing agi bucket<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0188594c64a1=
e xfs: prevent a UAF when log IO errors race with unmount<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0921c9621585=
0 xfs: use invalidate_lock to check the state of mmap_lock<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0efd194800b6=
9 xfs: convert buf_cancel_table allocation to kmalloc_array<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0074fee18693=
1 xfs: don&#39;t leak xfs_buf_cancel structures when recovery fails<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b8effd31a86=
2 xfs: refactor buffer cancellation table allocation<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04968c2aa6a1=
f cifs: fix check of rc in function generate_smb3signingkey<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d725bf0d16=
d cifs: spnego: add &#39;;&#39; in HOST_KEY_LEN<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A021accf14916=
1 tools/power/turbostat: Enable the C-state Pre-wake printing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00045c1ff7ac=
0 tools/power/turbostat: Fix a knl bug<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05bcce23f387=
b macvlan: Don&#39;t propagate promisc change to lower dev in passthru<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07574b5e65e9=
2 net/mlx5e: Check return value of snprintf writing to fw_version buffer fo=
r representors<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A055553c5b53a=
e net/mlx5e: Reduce the size of icosq_str<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051655fd3570=
3 net/mlx5e: Fix pedit endianness<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a990dd7410e=
c net/mlx5e: Refactor mod header management API<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A039f95b1d0d8=
f net/mlx5e: Move mod hdr allocation to a single place<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0f37a3715c=
b net/mlx5e: Remove incorrect addition of action fwd flag<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06974fd92d5f=
1 net/mlx5e: fix double free of encap_header in update funcs<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f3c4a704420=
1 net/mlx5e: fix double free of encap_header<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0931e9e8e30b=
f net: stmmac: fix rx budget limit check<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b8b514b2a6c=
d netfilter: nf_tables: fix pointer math issue in nft_byteorder_eval()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A025da0f58211=
9 netfilter: nf_tables: add and use BE register load-store helpers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a48f6be5bdb=
7 netfilter: nf_tables: use the correct get/put helpers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d3901bf3ba=
a netfilter: nf_conntrack_bridge: initialize err to 0<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A075bcfc188ab=
f af_unix: fix use-after-free in unix_stream_read_actor()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b480c654ef=
2 net: ethernet: cortina: Fix MTU max setting<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0097588e20c6=
b net: ethernet: cortina: Handle large frames<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9269b274cd=
f net: ethernet: cortina: Fix max RX frame define<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A053064e8239d=
d bonding: stop the device in bond_setup_by_slave()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cda210a4bdf=
7 ptp: annotate data-race around q-&gt;head and q-&gt;tail<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b67d16b2373=
b xen/events: fix delayed eoi list handling<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08531a4194e5=
9 ppp: limit MRU to 64K<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09ae82308d18=
4 tipc: Fix kernel-infoleak due to uninitialized TLV value<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0359c65daf6b=
5 net: hns3: fix VF wrong speed and duplex issue<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0406be003d69=
8 net: hns3: fix VF reset fail issue<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cfc131b078a=
3 net: hns3: fix variable may not initialized problem in hns3_init_mac_addr=
()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0070581829c1=
a net: hns3: fix incorrect capability bit display for copper port<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a3c65cf7854=
d net: hns3: add barrier in vf mailbox reply process<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e671d820375=
8 net: hns3: add byte order conversion for PF to VF mailbox message<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb0f14257c0=
4 net: hns3: refine the definition for struct hclge_pf_to_vf_msg<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01d8f66d4060=
a net: hns3: fix add VLAN fail issue<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04b3b2541d40=
e tty: Fix uninit-value access in ppp_sync_receive()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f64cad3ac3=
8 ipvlan: add ipvlan_route_v6_outbound() helper<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c71b9b177c=
6 net: set SOCK_RCU_FREE before inserting socket into hashtable<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0427165421c2=
5 net: inet: Retire port only listening_hash<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be1ceb8b7c5=
8 net: inet: Open code inet_hash2 and inet_unhash2<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bb9bcf47fba=
7 net: inet: Remove count from inet_listen_hashbucket<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0de634368e07=
9 mptcp: listen diag dump support<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0870f438aca5=
6 mptcp: diag: switch to context structure<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0be020f658c6=
3 gfs2: Silence &quot;suspicious RCU usage in gfs2_permission&quot; warning=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0194454afa6a=
a SUNRPC: Fix RPC client cleaned up the freed pipefs dentries<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0319ed0cba16=
4 NFSv4.1: fix SP4_MACH_CRED protection for pnfs IO<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0809684f5b38=
8 SUNRPC: Add an IS_ERR() check back to where it was<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A046d6b768072=
b SUNRPC: ECONNRESET might require a rebind<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7032d4d649=
9 media: cec: meson: always include meson sub-directory in Makefile<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A016e78f28517=
d media: cadence: csi2rx: Unregister v4l2 async notifier<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020c2ca9abb7=
8 sched/core: Optimize in_task() and in_interrupt() a bit<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09894c58c177=
7 tracing/perf: Add interrupt_context_level() helper<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A048fef664d7e=
9 tracing: Reuse logic from perf&#39;s get_recursion_context()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0670b3e902f6=
2 wifi: iwlwifi: Use FW rate for non-data frames<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a7ee519e809=
5 pwm: Fix double shift bug<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07054366cd07=
6 drm/amdgpu: fix software pci_unplug on some chips<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e48a5e78d07=
7 drm/qxl: prevent memory leak<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00835e7f296c=
a ASoC: ti: omap-mcbsp: Fix runtime PM underflow warnings<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A038ada2f304f=
6 i2c: dev: copy userspace array safely<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0610244988f3=
2 kgdb: Flush console before entering kgdb on panic<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04e497f1acd9=
9 drm/amd/display: Avoid NULL dereference of timing generator<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05e0b788fb96=
b media: imon: fix access to invalid resource for the second interface<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ae6bcafe1f6=
b media: ccs: Fix driver quirk struct documentation<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d01b0ad79ec=
d media: cobalt: Use FIELD_GET() to extract Link Width<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A003ce0655bf8=
e gfs2: fix an oops in gfs2_permission<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05bfda356e90=
3 gfs2: ignore negated quota changes<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A016631907d01=
3 media: vivid: avoid integer overflow<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A009cd8b561aa=
9 media: gspca: cpia1: shift-out-of-bounds in set_flicker<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A039c71357e68=
e i3c: master: mipi-i3c-hci: Fix a kernel panic for accessing DAT_data.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072775cad7f5=
7 virtio-blk: fix implicit overflow on virtio_max_dma_size<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f7f3bdb225e=
3 i2c: sun6i-p2wi: Prevent potential division by zero<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d23ad76f240=
c i3c: mipi-i3c-hci: Fix out of bounds access in hci_dma_irq_handler<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e6fbad3cc88=
0 9p: v9fs_listxattr: fix %s null argument warning<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a18be976be4=
1 9p/trans_fd: Annotate data-racy writes to file::f_flags<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02cc5e191d67=
1 usb: gadget: f_ncm: Always set current gadget in ncm_bind()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06c80f48912b=
5 tty: vcc: Add check for kstrdup() in vcc_probe()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02ff61106d6b=
4 exfat: support handle zero-size directory<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c86a3007a68=
5 HID: Add quirk for Dell Pro Wireless Keyboard and Mouse KM5221W<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03453f945af8=
9 PCI: Use FIELD_GET() in Sapphire RX 5600 XT Pulse quirk<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a93a0f99a0=
9 misc: pci_endpoint_test: Add Device ID for R-Car S4-8 PCIe controller<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A003dbd6a9ea4=
e PCI: Disable ATS for specific Intel IPU E2000 devices<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9a0b344484=
5 PCI: Extract ATS disabling to a helper function<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fe511d24418=
a PCI: Use FIELD_GET() to extract Link Width<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056d78b5495e=
b scsi: libfc: Fix potential NULL pointer dereference in fc_lport_ptp_setup=
()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A037a51e7f36b=
7 atm: iphase: Do PCI error checks on own line<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f05ae00106a=
a PCI: tegra194: Use FIELD_GET()/FIELD_PREP() with Link Width fields<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0631a96e9eb4=
2 ALSA: hda: Fix possible null-ptr-deref when assigning a stream<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c805b9cd2e=
3 ARM: 9320/1: fix stack depot IRQ stack filter<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08d25ec69f8f=
1 HID: lenovo: Detect quirk-free fw on cptkbd and stop applying workaround<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A064f062baf20=
2 jfs: fix array-index-out-of-bounds in diAlloc<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0da3da5e1e6f=
7 jfs: fix array-index-out-of-bounds in dbFindLeaf<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f74d336990=
f fs/jfs: Add validity check for db_maxag and db_agpref<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05f148b16972=
e fs/jfs: Add check for negative db_l2nbperpage<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1d1f79b192=
9 scsi: ibmvfc: Remove BUG_ON in the case of an empty event pool<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0bfc8a5561=
f scsi: hisi_sas: Set debugfs_dir pointer to NULL after removing debugfs<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05904dee7077=
1 RDMA/hfi1: Use FIELD_GET() to extract Link Width<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0546c1796ad1=
e crypto: pcrypt - Fix hungtask for PADATA_RESET<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc443a199f8=
c ASoC: soc-card: Add storage for PCI SSID<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09f2082067c5=
f selftests/efivarfs: create-read: fix a resource leak<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0428cad17f53=
b arm64: dts: ls208xa: use a pseudo-bus to constrain usb dma size<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0174f62a0aa1=
5 drm/amdgpu: Fix a null pointer access when the smc_rreg pointer is NULL<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f7a400d5e8=
0 drm/amdkfd: Fix shift out-of-bounds issue<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0300589d551d=
4 drm/panel: st7703: Pick different reset sequence<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eaa03ea366c=
8 drm/amdgpu/vkms: fix a possible null pointer dereference<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A084c923d8989=
0 drm/panel/panel-tpo-tpg110: fix a possible null pointer dereference<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02381f6b628b=
3 drm/panel: fix a possible null pointer dereference<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c11cf5e117f=
5 drm/amdgpu: Fix potential null pointer derefernce<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a237675aa1e=
6 drm/amd: Fix UBSAN array-index-out-of-bounds for Polaris and Tonga<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0acdb6830de0=
2 drm/amd: Fix UBSAN array-index-out-of-bounds for SMU7<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0829ce8e995a=
8 drm/msm/dp: skip validity check for DP CTS EDID checksum<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0689b33b94f0=
9 drm: vmwgfx_surface.c: copy user-array safely<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A022260dabcfe=
3 kernel: watch_queue: copy user-array safely<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4f2c09d467=
2 kernel: kexec: copy user-array safely<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024b17d530c4=
2 string.h: add array-wrappers for (v)memdup_user()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a3a6dc9a33=
0 drm/amd/display: use full update for clip size increase of large plane so=
urce<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d43cdd22cd=
8 drm/amdkfd: Fix a race condition of vram buffer unref in svm code<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eea81424c5b=
8 drm/komeda: drop all currently held locks if deadlock happens<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0812886866be=
6 platform/x86: thinkpad_acpi: Add battery quirk for Thinkpad X120e<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ba708876980=
0 Bluetooth: Fix double free in hci_conn_cleanup<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9de14bde56=
d Bluetooth: btusb: Add date-&gt;evt_skb is NULL check<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a43cf6acf01=
7 wifi: ath10k: Don&#39;t touch the CE interrupt registers after power up<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06f42bd24332=
7 net: annotate data-races around sk-&gt;sk_dst_pending_confirm<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A019ab5fd2644=
1 net: annotate data-races around sk-&gt;sk_tx_queue_mapping<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f3be63f7a8e=
e wifi: ath10k: fix clang-specific fortify warning<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A002a0547b8da=
0 wifi: ath9k: fix clang-specific fortify warnings<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cf353904a82=
8 bpf: Detect IP =3D=3D ksym.end as part of BPF program<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c29a89b23f6=
7 atl1c: Work around the DMA RX overflow issue<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A021a0f310a9f=
3 wifi: mac80211: don&#39;t return unset power in ieee80211_get_tx_power()<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03073e38086d=
0 wifi: mac80211_hwsim: fix clang-specific fortify warning<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e8e55fa4443=
5 x86/mm: Drop the 4 MB restriction on minimal NUMA node memory size<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9d3ba62e87=
b workqueue: Provide one lock class key per work_on_cpu() callsite<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00a5b512d526=
c clocksource/drivers/timer-atmel-tcb: Fix initialization on SAM9 hardware<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0465b88c0873=
b clocksource/drivers/timer-imx-gpt: Fix potential memory leak<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd0df3f8719=
2 perf/core: Bail out early if the request AUX area is out of bound<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e89d0ed45a4=
1 locking/ww_mutex/test: Fix potential workqueue corruption<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02a910f4af54=
d Linux 5.15.139<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03443337acd3=
7 btrfs: use u64 for buffer sizes in the tree search ioctls<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f9f5e8cecba=
9 Revert &quot;mmc: core: Capture correct oemid-bits for eMMC cards&quot;<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0824829c2c6b=
4 tracing/kprobes: Fix the order of argument descriptions<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0560680f745f=
c fbdev: fsl-diu-fb: mark wr_reg_wa() static<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08e4b510fe91=
7 fbdev: imsttfb: fix a resource leak in probe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03648582181b=
6 fbdev: imsttfb: Fix error path of imsttfb_probe()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030959f9f454=
0 spi: spi-zynq-qspi: add spi-mem to driver kconfig dependencies<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09cf044cc36c=
1 ASoC: hdmi-codec: register hpd callback on component probe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0705e5a28ec1=
d drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00ca05fae279=
0 netfilter: nat: fix ipv6 nat redirect with mapped and scoped addresses<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01652f57f02e=
b netfilter: nft_redir: use `struct nf_nat_range2` throughout and deduplica=
te eval call-backs<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d28c17abe09=
8 netfilter: xt_recent: fix (increase) ipv6 literal buffer length<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f30567fcbc4=
d i2c: iproc: handle invalid slave state<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A038f5ac54b91=
7 r8169: respect userspace disabling IFF_MULTICAST<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd01115b033=
c blk-core: use pr_warn_ratelimited() in bio_check_ro()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b8014871098=
3 block: remove unneeded return value of bio_check_ro()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d8d94d6b3bd=
3 tg3: power down device only on SYSTEM_POWER_OFF<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05ea06a23f8f=
4 net/smc: put sk reference if close work was canceled<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0884606f8283=
c net/smc: allow cdc msg send rather than drop it with NULL sndbuf_desc<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a62af7146da=
a net/smc: fix dangling sock under state SMC_APPFINCLOSEWAIT<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0866606826f1=
6 selftests: pmtu.sh: fix result checking<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02d117ac1b8f=
8 net: stmmac: xgmac: Enable support for multiple Flexible PPS outputs<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A095a99ac112c=
5 Fix termination state for idr_for_each_entry_ul()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070ef755f126=
b net: r8169: Disable multicast filter for RTL8168H and RTL8107E<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00dad0e75d62=
b dccp/tcp: Call security_inet_conn_request() after setting IPv6 addresses.=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c340713bdf3=
2 dccp: Call security_inet_conn_request() after setting IPv4 addresses.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d1b7e6562a4=
c octeontx2-pf: Fix holes in error code<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f60297ef59d=
4 octeontx2-pf: Fix error codes<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0794d360b1d6=
5 inet: shrink struct flowi_common<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08943083bbb6=
4 bpf: Check map-&gt;usercnt after timer-&gt;timer is assigned<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03907b89cd17=
f tipc: Change nla_policy for bearer-related names to NLA_NUL_STRING<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a1a485e45d2=
4 hsr: Prevent use after free in prp_create_tagged_frame()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0352887b3edd=
0 llc: verify mac len before reading mac header<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0303766bb92c=
5 Input: synaptics-rmi4 - fix use after free in rmi_unregister_function()<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0741e4c15d7c=
0 pwm: brcmstb: Utilize appropriate clock APIs in suspend/resume<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0895ac9a21f6=
9 pwm: sti: Reduce number of allocations and drop usage of chip_data<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db64ddddeee=
c regmap: prevent noinc writes from clobbering cache<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0004d4002534=
e media: dvb-usb-v2: af9035: fix missing unlock<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a0beda18475=
6 media: cedrus: Fix clock/reset sequence<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0980be4c3b0d=
5 media: vidtv: mux: Add check and kfree for kstrdup<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d17269fb916=
1 media: vidtv: psi: Add check for kstrdup<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db89f551b70=
6 media: s3c-camif: Avoid inappropriate kfree()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051c94256a83=
f media: bttv: fix use after free error due to btv-&gt;timeout timer<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3937f9e25d=
9 media: i2c: max9286: Fix some redundant of_node_put() calls<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09d060f2fc40=
c pcmcia: ds: fix possible name leak in error path in pcmcia_device_add()<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024e9df588e2=
e pcmcia: ds: fix refcount leak in pcmcia_device_add()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024e73ab542c=
7 pcmcia: cs: fix possible hung task and memory leak pccardd()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3eaa0d43c7=
4 rtc: pcf85363: fix wrong mask/val parameters in regmap_update_bits call<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020bd0198beb=
d cxl/mem: Fix shutdown order<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d48fe8d9817=
1 i3c: Fix potential refcount leak in i3c_master_register_new_i3c_devs<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0855d6fb2cc7=
b 9p/net: fix possible memory leak in p9_check_errors()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d456ebaad3=
0 perf hist: Add missing puts to hist__account_cycles<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0924e8d0b764=
5 perf machine: Avoid out of bounds LBR memory read<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076b0eab987c=
4 usb: host: xhci-plat: fix possible kernel oops while resuming<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c9c4dab06a5=
a xhci: Loosen RPM as default policy to cover for AMD xHC 1.1<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A092c9ef15643=
1 powerpc/pseries: fix potential memory leak in init_cpu_associativity()<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0516235e7b35=
f powerpc/imc-pmu: Use the correct spinlock initializer.<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0945dc61d784=
0 powerpc/xive: Fix endian conversion size<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bce31a2bcb1=
e powerpc/40x: Remove stale PTE_ATOMIC_UPDATES macro<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01308e55eb09=
c modpost: fix tee MODULE_DEVICE_TABLE built on big-endian host<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0863a9c3fdec=
2 powerpc: Only define __parse_fpscr() when required<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A001f62c6bd2d=
b f2fs: fix to initialize map.m_pblk in f2fs_precache_extents()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dfebea7114e=
0 dmaengine: pxa_dma: Remove an erroneous BUG_ON() in pxad_free_desc()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A072f8fa6c4b7=
8 USB: usbip: fix stub_dev hub disconnect<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0168697f15a5=
3 tools: iio: iio_generic_buffer ensure alignment<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a61c3c647ff=
d misc: st_core: Do not call kfree_skb() under spin_lock_irqsave()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0732aa0cb260=
1 dmaengine: ti: edma: handle irq_of_parse_and_map() errors<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02941a29fe9d=
6 usb: chipidea: Simplify Tegra DMA alignment code<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A058e8316b200=
b usb: chipidea: Fix DMA overwrite for Tegra<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fcaafb574fc=
8 usb: dwc2: fix possible NULL pointer dereference caused by driver concurr=
ency<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c956be5641c=
c dmaengine: idxd: Register dsa_bus_type before registering idxd sub-driver=
s<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca46d7ce1fb=
e livepatch: Fix missing newline character in klp_resolve_symbols()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b77f7c025e8=
5 tty: tty_jobctrl: fix pid memleak in disassociate_ctty()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e9f598a5cc9=
a f2fs: compress: fix to avoid redundant compress extension<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08c4504cc0c6=
4 f2fs: compress: fix to avoid use-after-free on dic<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca0aae3837a=
6 leds: trigger: ledtrig-cpu:: Fix &#39;output may be truncated&#39; issue =
for &#39;cpu&#39;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0206a972511a=
8 leds: pwm: Don&#39;t disable the PWM when the LED should be off<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0893eedf596d=
d leds: turris-omnia: Do not use SMBUS calls<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aec3706971b=
3 leds: turris-omnia: Drop unnecessary mutex locking<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c9a4f13c58f=
1 mfd: arizona-spi: Set pdata.hpdet_channel for ACPI enumerated devs<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A063a99d7b57b=
4 mfd: dln2: Fix double put in dln2_probe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02742c860e0b=
7 mfd: core: Ensure disabled devices are skipped without aborting<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A094eb5423d75=
e mfd: core: Un-constify mfd_cell.of_reg<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08890d4d5f25=
e ASoC: ams-delta.c: use component after check<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2ae48bd82e=
e crypto: qat - fix deadlock in backlog processing<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00dd34a7ad39=
5 padata: Fix refcnt handling in padata_free_shell()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A093e4aa8545a=
b ASoC: Intel: Skylake: Fix mem leak when parsing UUIDs fails<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cd1c2df64d6=
b HID: logitech-hidpp: Move get_wireless_feature_index() check to hidpp_con=
nect_event()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A099893b7c459=
2 HID: logitech-hidpp: Revert &quot;Don&#39;t restart communication if not =
necessary&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05f2f3860258=
3 HID: logitech-hidpp: Don&#39;t restart IO, instead defer hid_connect() on=
ly<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f80041c586=
7 HID: logitech-hidpp: Remove HIDPP_QUIRK_NO_HIDINPUT quirk<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3b196a1da3=
e Revert &quot;HID: logitech-hidpp: add a module parameter to keep firmware=
 gestures&quot;<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06885e5ffa09=
d sh: bios: Revive earlyprintk support<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0c25e957f9=
b hid: cp2112: Fix IRQ shutdown stopping polling for all IRQs on chip<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d06dc0f99f7=
2 RDMA/hfi1: Workaround truncation compilation error<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0086cd44204b=
b scsi: ufs: core: Leave space for &#39;\0&#39; in utf8 desc string<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a0f1999090b=
3 ASoC: fsl: Fix PM disable depth imbalance in fsl_easrc_probe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0904fc010377=
6 RDMA/hns: The UD mode can only be configured with DCQCN<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09f8db02d30a=
d RDMA/hns: Fix signed-unsigned mixed comparisons<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02de683e27e1=
d RDMA/hns: Fix uninitialized ucmd in hns_roce_create_qp_common()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0611260e36f1=
6 IB/mlx5: Fix rdma counter binding for RAW QP<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0922b2693b9a=
f ASoC: fsl: mpc5200_dma.c: Fix warning of Function parameter or member not=
 described<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0001f90cd9d2=
f ext4: move &#39;ix&#39; sanity check to corrent position<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c24a3c9e373=
e ARM: 9321/1: memset: cast the constant byte to unsigned char<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0012d0c66f93=
9 hid: cp2112: Fix duplicate workqueue initialization<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01ce09238e8e=
8 crypto: qat - increase size of buffers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A062df66b726f=
9 crypto: caam/jr - fix Chacha20 + Poly1305 self test failure<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A061f25d4686b=
f crypto: caam/qi2 - fix Chacha20 + Poly1305 self test failure<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066eb7b7f23d=
d nd_btt: Make BTT lanes preemptible<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06563e0f79d6=
3 libnvdimm/of_pmem: Use devm_kstrdup instead of kstrdup and check its retu=
rn value<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4ad0c1a83c=
e scsi: ibmvfc: Fix erroneous use of rtas_busy_delay with hcall return code=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b79c7d684c3=
f RDMA/core: Use size_{add,sub,mul}() in calls to struct_size()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a5c83c8043d=
7 hwrng: geode - fix accessing registers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8607725b20=
a crypto: hisilicon/hpre - Fix a erroneous check after snprintf()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b01b9dc5487=
a selftests/resctrl: Ensure the benchmark commands fits to its array<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02d2300fcf8f=
6 selftests/pidfd: Fix ksft print formats<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08bc9c944748=
9 arm64: dts: imx8mn: Add sound-dai-cells to micfil node<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01abd658492b=
5 arm64: dts: imx8mm: Add sound-dai-cells to micfil node<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cf7abb54f8b=
1 arm64: dts: imx8qm-ss-img: Fix jpegenc compatible entry<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08704bf18a88=
8 clk: scmi: Free scmi_clk allocated when the clocks with invalid info are =
skipped<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bdb0428aa29=
4 firmware: arm_ffa: Assign the missing IDR allocation ID to the FFA device=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b0ffdc16436=
5 firmware: ti_sci: Mark driver as non removable<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0995ee1e84e8=
d soc: qcom: llcc: Handle a second device without data corruption<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A019b8098f73c=
6 ARM: dts: qcom: mdm9615: populate vsdcc fixed regulator<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8ab88f84b8=
9 arm64: dts: qcom: apq8016-sbc: Add missing ADV7533 regulators<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ddc0df81eea=
c ARM64: dts: marvell: cn9310: Use appropriate label for spi1 pins<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A012d9de01c09=
c arm64: dts: qcom: sdm845-mtp: fix WiFi configuration<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0690b8925597=
1 arm64: dts: qcom: sc7280: Add missing LMH interrupts<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02a4cce4168f=
7 arm64: dts: qcom: msm8992-libra: drop duplicated reserved memory<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb9daf47806=
b arm64: dts: qcom: msm8916: Fix iommu local address range<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0541640dcbf4=
8 ARM: dts: renesas: blanche: Fix typo in GP_11_2 pin name<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00e1e88bba28=
6 perf: hisi: Fix use-after-free when register pmu fails<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04067d39f3c5=
7 drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/handling<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a6a6f70aedc=
a drm/msm/dsi: use msm_gem_kernel_put to free TX buffer<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aea6f32a431=
8 xen-pciback: Consider INTx disabled when MSI/MSI-X is enabled<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e588ca45bf5=
5 drm/rockchip: Fix type promotion bug in rockchip_gem_iommu_map()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a00a293d57a=
5 arm64/arm: xen: enlighten: Fix KPTI checks<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d0d01bb4a56=
0 drm/bridge: lt9611uxc: fix the race in the error path<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A029aba28ea19=
5 drm/bridge: lt9611uxc: Register and attach our DSI device at probe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f53a0457932=
8 drm/bridge: lt9611uxc: Switch to devm MIPI-DSI helpers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0517a5137a57=
b drm/rockchip: cdn-dp: Fix some error handling paths in cdn_dp_probe()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0865ccd4ca67=
4 drm/mediatek: Fix iommu fault during crtc enabling<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08e3c8253b34=
f drm/mediatek: Fix iommu fault by swapping FBs after updating plane state<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e11e339faa1=
1 drm/amdkfd: fix some race conditions in vram buffer alloc/free of svm cod=
e<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A030cb99e0964=
8 drm/bridge: tc358768: Fix bit updates<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01cd4ae681a6=
a drm/bridge: tc358768: Disable non-continuous clock mode<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c13591b859b=
e drm/bridge: tc358768: Fix use of uninitialized variable<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d78bddd94b8=
0 drm/bridge: lt8912b: Add missing drm_bridge_attach call<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05cc2bc519af=
d drm/bridge: lt8912b: Manually disable HPD only if it was enabled<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A042071feab71=
2 drm/bridge: lt8912b: Fix crash on bridge detach<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d9217286d0a=
b drm/bridge: lt8912b: Fix bridge_detach<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc3057958c5=
c drm/bridge: lt8912b: Add hot plug detection<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ef4a40953c8=
0 drm/bridge: lt8912b: Register and attach our DSI device at probe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03580b8a0130=
5 drm/bridge: lt8912b: Switch to devm MIPI-DSI helpers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A052541851a8d=
1 drm/mipi-dsi: Create devm device attachment<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a20d6ecd261=
a drm/mipi-dsi: Create devm device registration<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0347f025a02b=
3 drm/radeon: possible buffer overflow<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b163b371d74=
1 drm/rockchip: vop: Fix call to crtc reset helper<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09a96bed1df7=
b drm/rockchip: vop: Fix reset of state in duplicate state crtc funcs<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01b0bc99cf31=
6 hwmon: (coretemp) Fix potentially truncated sysfs attribute name<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b3e7eb23a6e=
9 hwmon: (axi-fan-control) Fix possible NULL pointer dereference<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0bf076b734=
a platform/x86: wmi: Fix opening of char device<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c57e81d5e53=
8 platform/x86: wmi: remove unnecessary initializations<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02ca4e461a29=
8 platform/x86: wmi: Fix probe failure when failing to register WMI devices=
<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f75e11f54d9=
8 clk: qcom: config IPQ_APSS_6018 should depend on QCOM_SMEM<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d1175cf4bd2=
b clk: mediatek: clk-mt2701: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e964d21dc03=
4 clk: mediatek: clk-mt7629: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4070ada5d5=
1 clk: mediatek: clk-mt7629-eth: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03aefc6fcfba=
d clk: mediatek: clk-mt6797: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca6d565a231=
9 clk: mediatek: clk-mt6779: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0533ca5153ad=
6 clk: mediatek: clk-mt6765: Add check for mtk_alloc_clk_data<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e531e4e7373=
4 clk: npcm7xx: Fix incorrect kfree<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0761c2a690d8=
f clk: ti: fix double free in of_ti_divider_clk_setup()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01c37faca090=
8 clk: ti: change ti_clk_register[_omap_hw]() API<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028b72fba1e1=
9 clk: ti: Update component clocks to use ti_dt_clk_name()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4bffed2e52=
b clk: ti: Update pll and clockdomain clocks to use ti_dt_clk_name()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09b5e9d8bf9a=
6 clk: ti: Add ti_dt_clk_name() helper to use clock-output-names<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f45fff806eb=
b clk: keystone: pll: fix a couple NULL vs IS_ERR() checks<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ff8ca9beef=
b spi: nxp-fspi: use the correct ioremap function<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A026206c858da=
e clk: renesas: rzg2l: Fix computation formula<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01966bf2a79e=
6 clk: renesas: rzg2l: Use FIELD_GET() for PLL register fields<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07ece2efa87a=
f clk: renesas: rzg2l: Simplify multiplication/shift logic<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e2239f71652=
9 clk: imx: imx8qxp: Fix elcdif_pll clock<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07d416973cd1=
2 clk: imx: imx8mq: correct error handling path<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0608ebb098b7=
9 clk: imx: Select MXC_CLK for CLK_IMX8QXP<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08861b2925a8=
4 clk: qcom: gcc-sm8150: Fix gcc_sdcc2_apps_clk_src<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076e8f00f54a=
8 clk: qcom: mmcc-msm8998: Fix the SMMU GDSC<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056c4bb46a5a=
0 clk: qcom: mmcc-msm8998: Don&#39;t check halt bit on some branch clks<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00881d24cf5c=
a clk: qcom: clk-rcg2: Fix clock rate overflow for high parent frequencies<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b64683f5d72=
8 spi: tegra: Fix missing IRQ check in tegra_slink_probe()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b13e8b38be5=
1 regmap: debugfs: Fix a erroneous check after snprintf()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08fafac40734=
6 ipvlan: properly track tx_errors<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03eedc19a9d0=
f net: add DEV_STATS_READ() helper<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0359bce81b84=
1 ipv6: avoid atomic fragment on GSO packets<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06b413d52f6a=
b ACPI: sysfs: Fix create_pnp_modalias() and create_of_modalias()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A032aaa3b9878=
9 wifi: iwlwifi: empty overflow queue during flush<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00e3ad00be4e=
8 wifi: iwlwifi: pcie: synchronize IRQs before NAPI<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a8ebe549e0c=
e wifi: iwlwifi: call napi_synchronize() before freeing rx/tx queues<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0627a3b3f5c8=
0 iwlwifi: pcie: adjust to Bz completion descriptor<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d91506a40e=
c tcp: fix cookie_init_timestamp() overflows<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04f6e904ed4e=
3 chtls: fix tp-&gt;rcv_tstamp initialization<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05d7bec7ae4d=
b r8169: fix rare issue with broken rx after link-down on RTL8125<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e143a3c82d3=
3 r8169: use tp_to_dev instead of open code<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a8f4e58e1e=
e thermal: core: prevent potential string overflow<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bfd4ed4988a=
a netfilter: nf_tables: Drop pointless memset when dumping rules<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A080986257d2c=
d PM / devfreq: rockchip-dfi: Make pmu regmap mandatory<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0826120c9ba6=
8 can: dev: can_put_echo_skb(): don&#39;t crash kernel if can_priv::echo_sk=
b is accessed out of bounds<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028e9e015916=
e can: dev: can_restart(): fix race condition between controller restart an=
d netif_carrier_on()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ada4dc4788f=
1 can: dev: can_restart(): don&#39;t crash kernel if carrier is OK<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4eb4182a82=
3 wifi: rtlwifi: fix EDCA limit set by BT coexistence<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02027e74150e=
e tcp_metrics: do not create an entry from tcp_init_metrics()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03f7cb7c47ce=
0 tcp_metrics: properly set tp-&gt;snd_ssthresh in tcp_init_metrics()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ca7b6fa9e61=
a tcp_metrics: add missing barriers on delete<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0227709a0e47=
c wifi: mt76: mt7603: improve stuck beacon handling<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eab5b0aa506=
5 mt76: pass original queue id from __mt76_tx_queue_skb to the driver<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A075336a76253=
9 mt76: add support for overriding the device used for DMA mapping<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A077b2ab5cd1a=
4 mt76: dma: use kzalloc instead of devm_kzalloc for txwi<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0064b32f18db=
1 wifi: mt76: mt7603: rework/fix rx pse hang check<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01afbb9ececd=
3 wifi: rtw88: debug: Fix the NULL vs IS_ERR() bug for debugfs_create_file(=
)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ebcbf5f5e04=
7 net: spider_net: Use size_add() in call to struct_size()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A056e7424c6ef=
c tipc: Use size_add() in calls to struct_size()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03e51efcb290=
9 mlxsw: Use size_mul() in call to struct_size()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dc3fef31073=
2 gve: Use size_add() in call to struct_size()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070f032db851=
6 tcp: call tcp_try_undo_recovery when an RTOd TFO SYNACK is ACKed<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a2d540c7454=
9 udp: add missing WRITE_ONCE() around up-&gt;encap_rcv<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08f7eef3a13d=
f selftests/bpf: Correct map_fd to data_fd in tailcalls<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03eefb2fbf4e=
c selftests/bpf: Test tail call counting with bpf2bpf and data on stack<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ab91992ec4d=
4 i40e: fix potential memory leaks in i40e_remove()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070274237365=
0 genirq/matrix: Exclude managed interrupts in irq_matrix_allocated()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0379b120e4f2=
7 pstore/platform: Add check for kstrdup<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A081b8638e4ef=
4 x86/boot: Fix incorrect startup_gdt_descr.size<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c7e8c7452e5=
a x86/sev-es: Allow copy_from_kernel_nofault() in earlier boot<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00b5da8ce0f1=
8 x86: Share definition of __is_canonical_address()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A090b263db856=
d futex: Don&#39;t include process MM in futex key on no-MMU<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0d6e584117=
2 x86/srso: Fix SBPB enablement for (possible) future fixed HW<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0565f9337b68=
e writeback, cgroup: switch inodes with dirty timestamps to release dying c=
gwbs<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02bb46b20825=
d vfs: fix readahead(2) on block devices<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A020195f87db1=
9 sched: Fix stop_one_cpu_nowait() vs hotplug<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A013cde955e52=
e sched/uclamp: Ignore (util =3D=3D 0) optimization in feec() when p_util_m=
ax =3D 0<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cc6198ff20c=
0 iov_iter, x86: Be consistent about the __user tag on copy_mc_to_user()<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A080529b4968a=
8 Linux 5.15.138<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03d8344a7c4a=
3 ALSA: hda: intel-dsp-config: Fix JSL Chromebook quirk detection<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f049c0c0037=
d misc: pci_endpoint_test: Add deviceID for J721S2 PCIe EP device support<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A028b8ad8ccec=
d tty: 8250: Add Brainboxes Oxford Semiconductor-based quirks<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A044c4dfac3f0=
2 tty: 8250: Add support for Intashield IX cards<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d541ccb34de=
2 tty: 8250: Add support for additional Brainboxes PX cards<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A060debc01fcb=
b tty: 8250: Fix up PX-803/PX-857<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01f5649aed52=
7 tty: 8250: Fix port count of PX-257<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03fe3cc63c73=
0 tty: 8250: Add support for Intashield IS-100<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a5b6390fd60=
9 tty: 8250: Add support for Brainboxes UP cards<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0738fe41b644=
3 tty: 8250: Add support for additional Brainboxes UC cards<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff6059c3d23=
4 tty: 8250: Remove UC-257 and UC-431<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A081a4dd5e6c7=
8 tty: n_gsm: fix race condition in status line change on dead connections<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e25197747f0=
e usb: raw-gadget: properly handle interrupted requests<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e5f53a68a59=
6 usb: typec: tcpm: Fix NULL pointer dereference in tcpm_pd_svdm()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c4855b22a3=
f usb: storage: set 1.50 as the lower bcdDevice for older &quot;Super Top&q=
uot; compatibility<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c48aae53850=
c PCI: Prevent xHCI driver from claiming AMD VanGogh USB3 DRD device<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06628c3627c0=
2 drm/amd: Disable ASPM for VI w/ all Intel systems<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b6c3c7786e2=
4 drm/amd: Move helper for dynamic speed switch check out of smu13<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09015169f00e=
e can: isotp: isotp_sendmsg(): fix TX state detection and wait behavior<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d72ff647832=
3 can: isotp: isotp_bind(): do not validate unused address information<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e163ad6a863=
9 can: isotp: add local echo tx processing and tx without FC<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b4e78ea2663=
8 can: isotp: handle wait_event_interruptible() return values<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02fc6f337257=
f can: isotp: check CAN address family in isotp_bind()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f8c3bd211cf=
3 can: isotp: isotp_bind(): return -EINVAL on incorrect CAN ID formatting<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0615c4dd6405=
0 can: isotp: set max PDU size to 64 kByte<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06627b96851f=
1 powerpc/mm: Fix boot crash with FLATMEM<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f0f99864888=
7 r8152: Check for unplug in r8153b_ups_en() / r8153c_ups_en()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A078c939a8872=
9 r8152: Check for unplug in rtl_phy_patch_request()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051cc28ce742=
e net: chelsio: cxgb4: add an error code check in t4_load_phy_fw<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bbc92619932=
1 platform/mellanox: mlxbf-tmfifo: Fix a warning message<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0db4416ea3a5=
d scsi: mpt3sas: Fix in error path<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d48b2e8189d=
5 fbdev: uvesafb: Call cn_del_callback() at the end of uvesafb_exit()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e39440c3268=
b drm/ttm: Reorder sys manager cleanup step<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0aade33d3d9b=
b ASoC: rt5650: fix the wrong result of key button<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fa32e21c056=
8 netfilter: nfnetlink_log: silence bogus compiler warning<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dfcbb983eb6=
e spi: npcm-fiu: Fix UMA reads when dummy.nbytes =3D=3D 0<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A064ae128b095=
d fs/ntfs3: Avoid possible memory leak<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A027a0bed1285=
e fs/ntfs3: Fix directory element type detection<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A094524980ee7=
5 fs/ntfs3: Fix NULL pointer dereference on error in attr_allocate_frame()<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02de328398b5=
0 fs/ntfs3: Fix possible NULL-ptr-deref in ni_readpage_cmpr()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0962a3d3d731=
c fs/ntfs3: Use kvmalloc instead of kmalloc(... __GFP_NOWARN)<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0393966e79ba=
1 fs/ntfs3: Write immediately updated ntfs state<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A059e629fc715=
7 fs/ntfs3: Add ckeck in ni_update_parent()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0738a3adc7c8=
b fbdev: atyfb: only use ioremap_uc() on i386 and ia64<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0afef8af919d=
2 Input: synaptics-rmi4 - handle reset delay when using SMBus trsnsport<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0abc62fc06d4=
a powerpc/85xx: Fix math emulation exception<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04bdde4dca00=
e dmaengine: ste_dma40: Fix PM disable depth imbalance in d40_probe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A039d2c10367a=
8 irqchip/stm32-exti: add missing DT IRQ flag translation<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c57aef9075e=
0 irqchip/riscv-intc: Mark all INTC nodes as initialized<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eb99b6e204c=
d net: sched: cls_u32: Fix allocation size in u32_init()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05e78ebe7c1d=
b ASoC: simple-card: fixup asoc_simple_probe() error handling<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A065fd21aa380=
5 x86: Fix .brk attribute in linker script<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d4c8bf5635c=
4 rpmsg: Fix possible refcount leak in rpmsg_register_device_override()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a82e0fda8a2=
f rpmsg: glink: Release driver_override<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bfd4a664ddf=
b rpmsg: Fix calling device_lock() on non-initialized device<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02e76b4f6218=
c rpmsg: Fix kfree() of static memory on setting driver_override<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05c0da71871d=
3 rpmsg: Constify local variable in field store macro<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0389190b2547=
2 driver: platform: Add helper for safer setting of driver_override<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A037ffa428d58=
c objtool/x86: add missing embedded_insn check<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f031e15d0bb=
8 ext4: avoid overlapping preallocations due to overflow<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f2c3a3aa6f1=
1 ext4: fix BUG in ext4_mb_new_inode_pa() due to overflow<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07a992726f72=
7 ext4: add two helper functions extent_logical_end() and pa_logical_end()<=
br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09e78e7709f7=
d x86/mm: Fix RESERVE_BRK() for older binutils<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d3201c71805=
8 x86/mm: Simplify RESERVE_BRK()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0897b56acf12=
6 x86/i8259: Skip probing when ACPI/MADT advertises PCAT compatibility<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A077db87c4a4e=
d gve: Fix GFP flags when allocing pages<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08b424bdf6c9=
c iio: afe: rescale: Accept only offset channels<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c1eeb494f68=
4 iio: afe: rescale: add offset support<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A07c76b7db552=
1 iio: afe: rescale: expose scale processing function<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c60671502dc=
2 iio: afe: rescale: reorder includes<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A027dd09f5ec7=
f clk: Sanitize possible_parent_show to Handle Return Value of of_clk_get_p=
arent_name<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c27ca4aebbe=
e sparc32: fix a braino in fault handling in csum_and_copy_..._user()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A021b07a2e609=
5 perf/core: Fix potential NULL deref<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06efd498009b=
9 nvmem: imx: correct nregs for i.MX6UL<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00c2948118c3=
4 nvmem: imx: correct nregs for i.MX6SLL<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06e22bf6f00d=
5 nvmem: imx: correct nregs for i.MX6ULL<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0f95b831b4=
a misc: fastrpc: Clean buffers on remote invocation failures<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4957f00f9e=
2 tracing/kprobes: Fix the description of variable length arguments<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cdc57093b47=
0 i2c: aspeed: Fix i2c bus hang in slave read<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e97d374a250=
6 i2c: stm32f7: Fix PEC handling in case of SMBUS transfers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A02766a872103=
b i2c: muxes: i2c-demux-pinctrl: Use of_get_i2c_adapter_by_node()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A048b58f7469e=
5 i2c: muxes: i2c-mux-gpmux: Use of_get_i2c_adapter_by_node()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb65e692765=
b i2c: muxes: i2c-mux-pinctrl: Use of_get_i2c_adapter_by_node()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0eace761f35a=
1 iio: adc: xilinx-xadc: Correct temperature offset/scale for UltraScale<br=
>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A070322a446ef=
2 iio: adc: xilinx-xadc: Don&#39;t clobber preset voltage/temperature thres=
holds<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03c1312b5d49=
a iio: exynos-adc: request second interupt only when touchscreen mode is us=
ed<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04e14f2d5885=
f kasan: print the original fault addr when access invalid shadow<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bdfa4fa7588=
d i40e: Fix wrong check for I40E_TXR_FLAGS_WB_ON_ITR<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0d5c175f4cea=
6 gtp: fix fragmentation needed check with gso<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c0dad0c0924=
c gtp: uapi: fix GTPA_MAX<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0852fb4ce426=
d tcp: fix wrong RTO timeout when received SACK reneging<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A083cfa3b51a7=
8 r8152: Release firmware if we have an error in probe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e0f9231ccd6=
c r8152: Cancel hw_phy_work if we have an error in probe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0ff42b0a5565=
9 r8152: Run the unload routine if we have errors during probe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06fa3b9f9478=
e r8152: Increase USB control msg timeout to 5000ms as per spec<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076873f2eadc=
0 net: usb: smsc95xx: Fix uninit-value access in smsc95xx_read_reg<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06afd112c3f9=
5 net: ieee802154: adf7242: Fix some potential buffer overflow in adf7242_s=
tats_show()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A046cd35e4e77=
4 igc: Fix ambiguity in the ethtool advertising<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A049529413eae=
d neighbour: fix various data-races<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A066755494636=
0 igb: Fix potential memory leak in igb_add_ethtool_nfc_entry<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A026342190534=
6 treewide: Spelling fix in comment<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0bc0c4bc119d=
2 i40e: Fix I40E_FLAG_VF_VLAN_PRUNING value<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c532c5df01a=
d r8169: fix the KCSAN reported data race in rtl_rx while reading desc-&gt;=
opts1<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A06afb294c88c=
6 r8169: fix the KCSAN reported data-race in rtl_tx while reading TxDescArr=
ay[entry].opts1<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A09d7b3838428=
c r8169: fix the KCSAN reported data-race in rtl_tx() while reading tp-&gt;=
cur_tx<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A004dbfa4122e=
0 firmware/imx-dsp: Fix use_after_free in imx_dsp_setup_channels()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00d587b86cd0=
d drm/dp_mst: Fix NULL deref in get_mst_branch_device_by_guid_helper()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08860f0175e5=
1 vsock/virtio: initialize the_virtio_vsock before using VQs<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0762c251c7f5=
c vsock/virtio: add support for device suspend/resume<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A01e02df6f690=
7 vsock/virtio: factor our the code to initialize and delete VQs<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A015a8cac3c25=
0 drm/i915/pmu: Check if pmu is closed before stopping event<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A043bd431a5dd=
9 nfsd: lock_rename() needs both directories to live on the same fs<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0556b68d9b95=
f mm/migrate: fix do_pages_move for compat pointers<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c4071c6114d=
e mm/page_alloc: correct start page when guard page debug is enabled<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03a6cee2bfb5=
3 vhost: Allow null msg.size on VHOST_IOTLB_INVALIDATE<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fbc9a8718f3=
1 virtio-mmio: fix memory leak of vm_dev<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0862a356bc98=
6 virtio_balloon: Fix endless deflation and inflation on arm64<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A041bb770e42b=
c mcb-lpc: Reallocate memory region to avoid memory overlapping<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0f2ac8b2643d=
d mcb: Return actual parsed size when reading chameleon table<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A090918ef995b=
5 mptcp: more conservative check for zero probes<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0fd2b2dab6f5=
b tcp: cleanup tcp_remove_empty_skb() use<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A068342755b9b=
2 tcp: remove dead code from tcp_sendmsg_locked()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A00f482ad7b1a=
5 pinctrl: qcom: lpass-lpi: fix concurrent register updates<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A051b054f6fe0=
1 ASoC: codecs: wcd938x: fix runtime PM imbalance on remove<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0cb34f4e79e5=
4 ASoC: codecs: wcd938x: fix resource leaks on bind errors<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A012952a23a5d=
a Linux 5.15.137<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0dff33880d40=
a xfrm6: fix inet6_dev refcount underflow problem<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a9d05a4f1c=
3 Bluetooth: hci_sock: Correctly bounds check and pad HCI_MON_NEW_INDEX nam=
e<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a6df96ee0b4=
5 Bluetooth: hci_sock: fix slab oob read in create_monitor_event<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c08d609fb2b=
6 phy: mapphone-mdm6600: Fix pinctrl_pm handling for sleep pins<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1b030b101f=
6 phy: mapphone-mdm6600: Fix runtime PM for remove<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A059f1095ab58=
e phy: mapphone-mdm6600: Fix runtime disable on probe<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0b618062c0b1=
3 serial: 8250: omap: Move uart_write() inside PM section<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A067f29cd2f85=
1 ASoC: pxa: fix a memory leak in probe()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A076d04c33950=
8 gpio: vf610: set value before the direction to avoid a glitch<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A04b129e3964b=
3 platform/x86: asus-wmi: Map 0x2a code, Ignore 0x2b and 0x2c events<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e1a058cc246=
7 platform/x86: asus-wmi: Change ASUS_WMI_BRN_DOWN code from 0x20 to 0x2e<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c6bbe51dcdf=
3 platform/surface: platform_profile: Propagate error if profile registrati=
on fails<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a73c8d71693=
8 s390/cio: fix a memleak in css_alloc_subchannel<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0c8b6c2df1e7=
d selftests/ftrace: Add new test case which checks non unique symbol<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03ad81e6affc=
b s390/pci: fix iommu bitmap allocation<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A071d224acc4d=
1 perf: Disallow mis-matched inherited group reads<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05aa89a11a2a=
6 USB: serial: option: add Fibocom to DELL custom modem FM101R-GL<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08c376d86361=
8 USB: serial: option: add entry for Sierra EM9191 with new firmware<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A048322121617=
6 USB: serial: option: add Telit LE910C4-WWX 0x1035 composition<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0e750fb71dc6=
a nvme-rdma: do not try to stop unallocated queues<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0a9fd6d44abb=
c nvme-pci: add BOGUS_NID for Intel 0a54 device<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0071382bda1d=
a ACPI: irq: Fix incorrect return value in acpi_register_gsi()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0431a5010bce=
2 NFSv4.1: fixup use EXCHGID4_FLAG_USE_PNFS_DS for DS server<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05762e72ef1b=
0 pNFS: Fix a hang in nfs4_evict_inode()<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A05a3abee2eee=
9 Revert &quot;pinctrl: avoid unsafe code pattern in find_pinctrl()&quot;<b=
r>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A024959825377=
f mmc: core: Capture correct oemid-bits for eMMC cards<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A08041e7b7e7e=
9 mmc: core: sdio: hold retuning if sdio in 1-bit mode<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0262029c0c58=
c mmc: mtk-sd: Use readl_poll_timeout_atomic in msdc_reset_hw<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A03e363db1c13=
a mtd: physmap-core: Restore map_rom fallback<br>
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A071823463b1b=
2 mtd: spinand: mic</blockquote></div></div></div>

--0000000000006eac74061312f837--

