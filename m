Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAE4C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 14:51:20 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.25077.1709823073487457997
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 06:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SaUZdnYc;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-609eb3e5a56so10795627b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709823072; x=1710427872; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pijzSyc+Z15GTzje1CHbg4mmJeQogdf0EB7NTLjAbk=;
        b=SaUZdnYcPPFon73rOsxbW706+rfEzxNrrSHX0A6yBPkbojJK6dssgnUEJI9apEiKZ4
         3emix9uXpEOTSPmtUZTxhj1dKvQZrF6yScOB7GbPM61Ch/grUm4QZne4jgACA+BFNMev
         VcrpH085Q62J/cpZnWyqYzj+cFspXVOa7csWO1AVsZkmMcKFGH8viB5d6vIhEFehND49
         uFb8wVFTA6Xo/7DgrtoUU/RlBK67UYWMSiWg0+4QhDLFH0uId1FIdRspP/8un2acOBrm
         AKtIn901/5z9w2cz7jH2Y8XgWYLoLTvVKfymdyjSbuQF90MJGzltR1cUwVBXIgo29Cho
         /ApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709823072; x=1710427872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pijzSyc+Z15GTzje1CHbg4mmJeQogdf0EB7NTLjAbk=;
        b=kwa9WAZJao9IpMzCidIwudXwcj9DZyRAkwzqscE+5vuUa8QkDE+VtK47z0qzNzNfT9
         ycACAC7f7trfb/Yo2TxuFz2XqZmQIe0UPKem/90dF3LYOe7pUY+By2fL5upgYebTJKRQ
         DVBfsQLqziPQA5H+cSsZU2zwWGWUWLJsmJqJ81J1eGZuL2xpeSa+6Lu18CkuDH7fK1X2
         TAgnz1fQ/mQEYnXwZyKW7hF36xAcInYMEiWNitHc/dChnJOSvWdXQQc4eI0FrMDFUqFC
         jSlZl8uHMa5IOIQwJ7qeMmKvEI3lceLBaXbQ3L/Njq1XzQmL4u8BASC9ysqQysvFx71l
         QKHw==
X-Forwarded-Encrypted: i=1; AJvYcCUgzR8IyId0GmvR4cSf1Y4hgvFxnK6icpoasSEaMPdQHtIeahj1oLAEp5IQ8bASlo2JGc0Nu0iBa7bgvZBc01BvioYjRc6nHvm8veT0ZZT0r1tz0v6RXMb1
X-Gm-Message-State: AOJu0YwF4Vh17CsAeao3zxihJMo7mTmR1lwG3/GQDgeMSZJXwbXL5hqt
	LsBhn0M7HPefsYSxcuaE9A317L/LRQYQUgjccSLPA1gfXuzULmqZapZcr6X53bgY7EuR5DWcOS8
	WTxWciHizXiBo6WDnwc2QVGxxanFOgDhCCILR7A==
X-Google-Smtp-Source: AGHT+IF/6JYcK8LDFaEsg5mfJ9RMpuSh5l7CNmnqIPWfR6GlyXhpupdFOQ+bPNAibtQ/2LQr8UsIbgYy/ixyd82eh9E=
X-Received: by 2002:a25:86cb:0:b0:dcc:273e:1613 with SMTP id
 y11-20020a2586cb000000b00dcc273e1613mr14819394ybm.40.1709823072214; Thu, 07
 Mar 2024 06:51:12 -0800 (PST)
MIME-Version: 1.0
References: <20231205044036.4163615-1-bruce.ashfield@gmail.com>
 <20231205044036.4163615-5-bruce.ashfield@gmail.com> <CAOSpxdZU+CoRTo=Xz+C3dk44ubHLSa7pis7sa4CyVMGJnY1_EA@mail.gmail.com>
 <CAOSpxdYcFTMY-m9TDB-wAVXu70v5DkmGfH8UjH2dLKDY-x0AbA@mail.gmail.com>
 <CADkTA4NhG1AciK=QkaYiajfXfuqc1YQ9=qJBssoKSQh4GOMcvQ@mail.gmail.com>
 <17BA3874E3FB1D6A.21429@lists.openembedded.org> <CAOSpxdYFR72uWeix5mKTJY5R-bewDQO0jMh5obByiz0h7WgDyw@mail.gmail.com>
 <CADkTA4O-F7qr2GU1cK_zd7zD9LpCKm-RrMRgkRjY6F2ZOemn5g@mail.gmail.com>
 <17BA7F82CF20F029.10210@lists.openembedded.org> <CAOSpxdYLfPpsop4C7c6DYE5bbbTh6LovcKZ5YuSb7ph6jwyA+g@mail.gmail.com>
 <CADkTA4PYyJL3Yt-NkHejT9049NVA0BnMBTS1CDe+PjyeB6znbw@mail.gmail.com> <17BA821ADCF2B959.10210@lists.openembedded.org>
In-Reply-To: <17BA821ADCF2B959.10210@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 7 Mar 2024 04:51:00 -1000
Message-ID: <CAOSpxdZUiGRYtsuVmTHyz1BPOdtyamW+sqCDG5PDFv+0xxRKMA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 4/4] linux-yocto/5.15: update to v5.15.141
To: steve@sakoman.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 14:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196797

On Thu, Mar 7, 2024 at 4:34=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
>
>
> On Thu, Mar 7, 2024, 4:29=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
>>
>> On Thu, Mar 7, 2024 at 9:00=E2=80=AFAM Steve Sakoman <steve@sakoman.com>=
 wrote:
>> >
>> > On Thu, Mar 7, 2024 at 3:46=E2=80=AFAM Steve Sakoman via
>> > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
>> > wrote:
>> > >
>> > > On Wed, Mar 6, 2024 at 7:42=E2=80=AFAM Bruce Ashfield <bruce.ashfiel=
d@gmail.com> wrote:
>> > > >
>> > > > On Wed, Mar 6, 2024 at 12:38=E2=80=AFPM Steve Sakoman <steve@sakom=
an.com> wrote:
>> > > > >
>> > > > >
>> > > > >
>> > > > > On Wed, Mar 6, 2024 at 6:04=E2=80=AFAM Steve Sakoman via lists.o=
penembedded.org <steve=3Dsakoman.com@lists.openembedded.org> wrote:
>> > > > > >
>> > > > > > On Wed, Mar 6, 2024 at 5:59=E2=80=AFAM Bruce Ashfield <bruce.a=
shfield@gmail.com> wrote:
>> > > > > > >
>> > > > > > > On Wed, Mar 6, 2024 at 10:43=E2=80=AFAM Steve Sakoman <steve=
@sakoman.com> wrote:
>> > > > > > > >
>> > > > > > > > On Thu, Dec 7, 2023 at 8:08=E2=80=AFAM Steve Sakoman <stev=
e@sakoman.com> wrote:
>> > > > > > > > >
>> > > > > > > > > Hi Bruce,
>> > > > > > > > >
>> > > > > > > > > The 5.10 version bumps look fine in testing, but sadly t=
his 5.15
>> > > > > > > > > version bump breaks qemux86-64-ptest:
>> > > > > > > > >
>> > > > > > > > > AssertionError: Failed ptests:
>> > > > > > > > > {'parted': ['t1104-remove-and-add-partition.sh',
>> > > > > > > > >             't8000-loop.sh',
>> > > > > > > > >             't8001-loop-blkpg.sh']}
>> > > > > > > > >
>> > > > > > > > > Failure is reproducible 100% of the time, so there is th=
at ...
>> > > > > > > >
>> > > > > > > > After  wading through the hundreds of changes in this vers=
ion bump
>> > > > > > > > from 5.15.124 to 5.15.141 I found this in the 5.13.132 por=
tion that
>> > > > > > > > looks suspicious:
>> > > > > > > >
>> > > > > > > > 072cd213c64f block: don't add or resize partition on the d=
isk with
>> > > > > > > > GENHD_FL_NO_PART
>> > > > > > > > c6ce1c5dd327 block: rename GENHD_FL_NO_PART_SCAN to GENHD_=
FL_NO_PART
>> > > > > > > >
>> > > > > > >
>> > > > > > > It could very well be that, I haven't been able to get to an=
y local
>> > > > > > > testing on this
>> > > > > > > yet.
>> > > > > > >
>> > > > > > > I will go look at parted for commits that indicate they are =
fixing a
>> > > > > > > kernel interface
>> > > > > > > that sounds similar .. since we don't want to revert an offe=
nding commit, the
>> > > > > > > way to fix this is via selective update of parted.
>> > > > > >
>> > > > > > I'm doing a test kirkstone build that bumps parted to the same=
 version
>> > > > > > as in master.
>> > > > > >
>> > > > > > This will at least let us know whether it has been fixed in up=
stream parted.
>> > > > >
>> > > > > The test completed and I get the same failure with the most rece=
nt parted version.
>> > > > >
>> > > > > So apparently not fixed in parted.
>> > > >
>> > > > Which means that the newer kernels have some sort of additional fi=
x or a revert.
>> > > >
>> > > > I'll have a look for that as well.
>> > >
>> > > From looking at how Ubuntu deals with this
>> > > (https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2056143):
>> > >
>> > > -- Impact --
>> > > In 22.04/Jammy with the GA 5.15 kernel there was an upstream change
>> > > preventing partition table operations when GENHD_FL_NO_PART is set.
>> > >  1a721de8489f "block: don't add or resize partition on the disk with
>> > > GENHD_FL_NO_PART"
>> > > Beside of changing return codes and breaking some user-space that wa=
y
>> > > this also causes loop block devices to no longer be able to have
>> > > partitions manually created. This is because the loop block driver
>> > > uses GENHD_FL_NO_PART to prevent active partition scans.
>> > >
>> > > -- Fix --
>> > > This was changed in 5.19 (and thus Mantic is not affected) by
>> > > introducing a separate flag to prevent those scans:
>> > >  b9684a71fca7 "block, loop: support partitions without scanning"
>> > > The fix depends on a larger rewrite so it cannot be simply picked. T=
he
>> > > biggest change from the original is moving the check for the new fla=
g
>> > > into a helper function in genhd.h which checks whether a disk should
>> > > be scanned for partitions. That function was dropped with the upstre=
am
>> > > rewrite and checking moved into the loop driver directly. But it fel=
t
>> > > like adjusting the helper was the better approach.
>> > >
>> > > Note: The upstream patch has a follow-up change submitted:
>> > >   748008e1da92 "block: don't add partitions if GD_SUPPRESS_PART_SCAN=
 is set"
>> > > We do _NOT_ need that in Jammy/5.15 because block/partitions/core.c:
>> > > blk_add_partitions() checks disk_part_scan_enabled() which was where
>> > > we added the check for the backport instead of modifying
>> > > disk_scan_partitions() directly.
>> >
>> > Forgot to add this:
>> >
>> > https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/jam=
my/commit/?h=3Dmaster-next--2024.03.04-1&id=3Dc3032b60ff7b3948325b8f2bd688b=
9a74be3cfb9
>> >
>>
>> Assuming that I'm reading the summary correctly, I'm inclined to
>> cherry pick 748008e1da92 [ block: don't add partitions if
>> GD_SUPPRESS_PART_SCAN is set]
>> into the linux-yocto 5.15 kernel branches.
>>
>> The commit referenced in the link above doesn't cherry-pick cleanly
>> (it seems tangled
>> up in other Ubuntu kernel changes), but 748008e1da92 is simple and
>> does cherry-pick
>> without any fuss.
>>
>> I never did get set up to run the tests myself, but I can send you SRCRE=
V bumps
>> with 748008e1da92 merged into the tree. That's the fastest route to
>> get it tested.
>> Alternatively, we wait for me to get a test environment setup or it
>> could even be a
>> SRC_URI patch (versus me merging it).
>>
>> Worst thing that can happen if I merge it, is that it doesn't fix the
>> problem and I do
>> a revert, or just stack more changes on top to fix the problem.
>>
>> Let me know your preference, and I'll pull something together.
>
>
>
> I can try a SRC_URI patch first to see if it solves the issue.

I'm assuming you'll send the SRC_URI patch, let me know if my
assumption is wrong and you want me to craft it!

Steve

>> > > > > > > > > On Mon, Dec 4, 2023 at 6:40=E2=80=AFPM <bruce.ashfield@g=
mail.com> wrote:
>> > > > > > > > > >
>> > > > > > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > > > > > > > > >
>> > > > > > > > > > Updating  to the latest korg -stable release that comp=
rises
>> > > > > > > > > > the following commits:
>> > > > > > > > > >
>> > > > > > > > > >     9b91d36ba301 Linux 5.15.141
>> > > > > > > > > >     313a34d1c0ee io_uring: fix off-by one bvec index
>> > > > > > > > > >     49ae2e4e8ed3 USB: dwc3: qcom: fix wakeup after pro=
be deferral
>> > > > > > > > > >     eb17fb4b160a USB: dwc3: qcom: fix software node le=
ak on probe errors
>> > > > > > > > > >     98f0e9b6276f usb: dwc3: set the dma max_seg_size
>> > > > > > > > > >     1a3dcb1d811d usb: dwc3: Fix default mode initializ=
ation
>> > > > > > > > > >     a22702a81844 USB: dwc2: write HCINT with INTMASK a=
pplied
>> > > > > > > > > >     1134fde92088 usb: typec: tcpm: Skip hard reset whe=
n in error recovery
>> > > > > > > > > >     64830d041515 USB: serial: option: don't claim inte=
rface 4 for ZTE MF290
>> > > > > > > > > >     9611cbc6a132 USB: serial: option: fix FM101R-GL de=
fines
>> > > > > > > > > >     a8d80b1fbacf USB: serial: option: add Fibocom L7xx=
 modules
>> > > > > > > > > >     de8c6fce8d09 usb: cdnsp: Fix deadlock issue during=
 using NCM gadget
>> > > > > > > > > >     dd0cc4b69f7d bcache: fixup lock c->root error
>> > > > > > > > > >     a912742d8411 bcache: fixup init dirty data errors
>> > > > > > > > > >     137660f84462 bcache: prevent potential division by=
 zero error
>> > > > > > > > > >     f7077ce8d97b bcache: check return value from btree=
_node_alloc_replacement()
>> > > > > > > > > >     1eed01092101 dm-delay: fix a race between delay_pr=
esuspend and delay_bio
>> > > > > > > > > >     d181a7a1d55d hv_netvsc: Mark VF as slave before ex=
posing it to user-mode
>> > > > > > > > > >     97683466e24c hv_netvsc: Fix race of register_netde=
vice_notifier and VF register
>> > > > > > > > > >     3841921018a2 USB: serial: option: add Luat Air72*U=
 series products
>> > > > > > > > > >     6062c527d040 s390/dasd: protect device queue again=
st concurrent access
>> > > > > > > > > >     35b5d86e43ec io_uring/fs: consider link->flags whe=
n getting path for LINKAT
>> > > > > > > > > >     2bb75a2c3490 bcache: fixup multi-threaded bch_sect=
ors_dirty_init() wake-up race
>> > > > > > > > > >     6f09318fd90a md: fix bi_status reporting in md_end=
_clone_io
>> > > > > > > > > >     72ecb9753cbe bcache: replace a mistaken IS_ERR() b=
y IS_ERR_OR_NULL() in btree_gc_coalesce()
>> > > > > > > > > >     e09ba90f1ad0 swiotlb-xen: provide the "max_mapping=
_size" method
>> > > > > > > > > >     0f05021e937c ACPI: resource: Skip IRQ override on =
ASUS ExpertBook B1402CVA
>> > > > > > > > > >     f95e9f7afe86 proc: sysctl: prevent aliased sysctls=
 from getting passed to init
>> > > > > > > > > >     3f3880fc011c ext4: make sure allocate pending entr=
y not fail
>> > > > > > > > > >     e33eb4997585 ext4: fix slab-use-after-free in ext4=
_es_insert_extent()
>> > > > > > > > > >     859893f61906 ext4: using nofail preallocation in e=
xt4_es_insert_extent()
>> > > > > > > > > >     048e7f38b31c ext4: using nofail preallocation in e=
xt4_es_insert_delayed_block()
>> > > > > > > > > >     580b9dd6ab0b ext4: using nofail preallocation in e=
xt4_es_remove_extent()
>> > > > > > > > > >     66bc78a295b3 ext4: use pre-allocated es in __es_re=
move_extent()
>> > > > > > > > > >     b1995ba6269c ext4: use pre-allocated es in __es_in=
sert_extent()
>> > > > > > > > > >     edec12712ae1 ext4: factor out __es_alloc_extent() =
and __es_free_extent()
>> > > > > > > > > >     e82d05cf5ccb ext4: add a new helper to check if es=
 must be kept
>> > > > > > > > > >     612edd488872 media: qcom: camss: Fix csid-gen2 for=
 test pattern generator
>> > > > > > > > > >     ceb5276d8c99 media: qcom: camss: Fix set CSI2_RX_C=
FG1_VC_MODE when VC is greater than 3
>> > > > > > > > > >     f001e6f62693 media: camss: sm8250: Virtual channel=
s for CSID
>> > > > > > > > > >     9fb81ca7aa05 media: camss: Replace hard coded valu=
e with parameter
>> > > > > > > > > >     8ef9b32f20ab MIPS: KVM: Fix a build warning about =
variable set but not used
>> > > > > > > > > >     6ddaca6b20f7 lockdep: Fix block chain corruption
>> > > > > > > > > >     61747778a88b USB: dwc3: qcom: fix ACPI platform de=
vice leak
>> > > > > > > > > >     027472889970 USB: dwc3: qcom: fix resource leaks o=
n probe deferral
>> > > > > > > > > >     e26c6febac43 nvmet: nul-terminate the NQNs passed =
in the connect command
>> > > > > > > > > >     b5d50c6a609d afs: Fix file locking on R/O volumes =
to operate in local mode
>> > > > > > > > > >     84ebfbed3ae0 afs: Return ENOENT if no cell DNS rec=
ord can be found
>> > > > > > > > > >     6aeac88a45de net: axienet: Fix check for partial T=
X checksum
>> > > > > > > > > >     293acba84108 amd-xgbe: propagate the correct speed=
 and duplex status
>> > > > > > > > > >     b3874cc25a70 amd-xgbe: handle the corner-case duri=
ng tx completion
>> > > > > > > > > >     e949dbc28cd5 amd-xgbe: handle corner-case during s=
fp hotplug
>> > > > > > > > > >     01a8b94726b1 octeontx2-pf: Fix ntuple rule creatio=
n to direct packet to VF with higher Rx queue than its PF
>> > > > > > > > > >     fcc4a03ad3b1 arm/xen: fix xen_vcpu_info allocation=
 alignment
>> > > > > > > > > >     90072af9efe8 net/smc: avoid data corruption caused=
 by decline
>> > > > > > > > > >     66c023469b3e net: usb: ax88179_178a: fix failed op=
erations during ax88179_reset
>> > > > > > > > > >     ba81c5228ef8 ipv4: Correct/silence an endian warni=
ng in __ip_do_redirect
>> > > > > > > > > >     364406d4c114 HID: fix HID device resource race bet=
ween HID core and debugging support
>> > > > > > > > > >     52badc06b119 HID: core: store the unique system id=
entifier in hid_device
>> > > > > > > > > >     221be624a55d drm/rockchip: vop: Fix color for RGB8=
88/BGR888 format on VOP full
>> > > > > > > > > >     b0c835fd7d89 ata: pata_isapnp: Add missing error c=
heck for devm_ioport_map()
>> > > > > > > > > >     9754a498aa5b octeontx2-pf: Fix memory leak during =
interface down
>> > > > > > > > > >     be41c0c4a632 wireguard: use DEV_STATS_INC()
>> > > > > > > > > >     f163a6d17a95 drm/panel: simple: Fix Innolux G101IC=
E-L01 timings
>> > > > > > > > > >     608de3a587eb drm/panel: simple: Fix Innolux G101IC=
E-L01 bus flags
>> > > > > > > > > >     18bd108a13cb drm/panel: auo,b101uan08.3: Fine tune=
 the panel power sequence
>> > > > > > > > > >     9fe5718d3f09 drm/panel: boe-tv101wum-nl6: Fine tun=
e the panel power sequence
>> > > > > > > > > >     c8a49336e1de afs: Make error on cell lookup failur=
e consistent with OpenAFS
>> > > > > > > > > >     ac239fccf5a5 afs: Fix afs_server_list to be cleane=
d up with RCU
>> > > > > > > > > >     a78d278e01b1 Linux 5.15.140
>> > > > > > > > > >     947c9e12ddd6 driver core: Release all resources du=
ring unbind before updating device links
>> > > > > > > > > >     5a434d5c3823 Input: xpad - add VID for Turtle Beac=
h controllers
>> > > > > > > > > >     cbc7c29dff0f tracing: Have trace_event_file have r=
ef counters
>> > > > > > > > > >     1dcf90c9fa01 powerpc/powernv: Fix fortify source w=
arnings in opal-prd.c
>> > > > > > > > > >     3d7912710e5e io_uring/fdinfo: lock SQ thread while=
 retrieving thread cpu/pid
>> > > > > > > > > >     595b051c83a1 drm/amd/display: Change the DMCUB mai=
lbox memory location from FB to inbox
>> > > > > > > > > >     a2a6e97c4b33 drm/amdgpu: fix error handling in amd=
gpu_bo_list_get()
>> > > > > > > > > >     e380992c479b drm/amdgpu: don't use ATRM for extern=
al devices
>> > > > > > > > > >     4ff985b8810c drm/i915: Fix potential spectre vulne=
rability
>> > > > > > > > > >     ea0c4d5ec57f drm/amd/pm: Handle non-terminated ove=
rdrive commands.
>> > > > > > > > > >     9ce842d7762a ext4: add missed brelse in update_bac=
kups
>> > > > > > > > > >     ce19c20064b6 ext4: remove gdb backup copy for meta=
 bg in setup_new_flex_group_blocks
>> > > > > > > > > >     ac45d8e34bed ext4: correct the start block of coun=
ting reserved clusters
>> > > > > > > > > >     8f9842c4b925 ext4: correct return value of ext4_co=
nvert_meta_bg
>> > > > > > > > > >     8798d3b2722d ext4: correct offset of gdb backup in=
 non meta_bg group to update_backups
>> > > > > > > > > >     8a3bb38bfdaf ext4: apply umask if ACL support is d=
isabled
>> > > > > > > > > >     d5c380149b96 Revert "net: r8169: Disable multicast=
 filter for RTL8168H and RTL8107E"
>> > > > > > > > > >     6ad3d8594d5e media: qcom: camss: Fix missing vfe_l=
ite clocks check
>> > > > > > > > > >     e0376cf06950 media: qcom: camss: Fix VFE-17x vfe_d=
isable_output()
>> > > > > > > > > >     8f733387d17f media: qcom: camss: Fix vfe_get() err=
or jump
>> > > > > > > > > >     841fc648fbb5 media: qcom: camss: Fix pm_domain_on =
sequence in probe
>> > > > > > > > > >     4c9c43f79a12 mmc: sdhci-pci-gli: GL9750: Mask the =
replay timer timeout of AER
>> > > > > > > > > >     72bf271c5a77 r8169: fix network lost after resume =
on DASH systems
>> > > > > > > > > >     468e3ebf4786 mm: kmem: drop __GFP_NOFAIL when allo=
cating objcg vectors
>> > > > > > > > > >     0387978fda07 mmc: sdhci-pci-gli: A workaround to a=
llow GL9750 to enter ASPM L1.2
>> > > > > > > > > >     070b3ccb9b8b riscv: kprobes: allow writing to x0
>> > > > > > > > > >     cd0e9f475a46 nfsd: fix file memleak on client_open=
s_release
>> > > > > > > > > >     114c9d732cf9 media: ccs: Correctly initialise try =
compose rectangle
>> > > > > > > > > >     6c8aeeb2c549 media: venus: hfi: add checks to hand=
le capabilities from firmware
>> > > > > > > > > >     cdeb0a4cf327 media: venus: hfi: fix the check to h=
andle session buffer requirement
>> > > > > > > > > >     7d62570f75fe media: venus: hfi_parser: Add check t=
o keep the number of codecs within range
>> > > > > > > > > >     d0d831e7d68d media: sharp: fix sharp encoding
>> > > > > > > > > >     6003733c8f95 media: lirc: drop trailing space from=
 scancode transmit
>> > > > > > > > > >     e4088d7d8f11 f2fs: avoid format-overflow warning
>> > > > > > > > > >     12055238d046 i2c: i801: fix potential race in i801=
_block_transaction_byte_by_byte
>> > > > > > > > > >     336e6db5c120 net: phylink: initialize carrier stat=
e at creation
>> > > > > > > > > >     d8cb287d31cb net: dsa: lan9303: consequently neste=
d-lock physical MDIO
>> > > > > > > > > >     656262cb0f95 net: ethtool: Fix documentation of et=
htool_sprintf()
>> > > > > > > > > >     acca20cc16f3 s390/ap: fix AP bus crash on early co=
nfig change callback invocation
>> > > > > > > > > >     019b7d42a416 i2c: designware: Disable TX_EMPTY irq=
 while waiting for block length byte
>> > > > > > > > > >     c6e89348fd58 sbsa_gwdt: Calculate timeout with 64-=
bit math
>> > > > > > > > > >     132670ae9ffb lsm: fix default return value for ino=
de_getsecctx
>> > > > > > > > > >     223196b50605 lsm: fix default return value for vm_=
enough_memory
>> > > > > > > > > >     06d320ca170b Revert "i2c: pxa: move to generic GPI=
O recovery"
>> > > > > > > > > >     ddec3d04f874 Revert ncsi: Propagate carrier gain/l=
oss events to the NCSI controller
>> > > > > > > > > >     ad0b74d0f331 powerpc/pseries/ddw: simplify enable_=
ddw()
>> > > > > > > > > >     b3e993de400e arm64: dts: qcom: ipq6018: Fix tcsr_m=
utex register size
>> > > > > > > > > >     b99ac20612ca arm64: dts: qcom: ipq6018: switch TCS=
R mutex to MMIO
>> > > > > > > > > >     aaf0a07d6088 ksmbd: fix slab out of bounds write i=
n smb_inherit_dacl()
>> > > > > > > > > >     1c701423bb03 Bluetooth: btusb: Add 0bda:b85b for F=
n-Link RTL8852BE
>> > > > > > > > > >     36a573b32550 Bluetooth: btusb: Add RTW8852BE devic=
e 13d3:3570 to device tables
>> > > > > > > > > >     c4976160a0a4 bluetooth: Add device 13d3:3571 to de=
vice tables
>> > > > > > > > > >     603e77e9e8c0 bluetooth: Add device 0bda:887b to de=
vice tables
>> > > > > > > > > >     e9bb966c50a7 Bluetooth: btusb: Add Realtek RTL8852=
BE support ID 0x0cb8:0xc559
>> > > > > > > > > >     cf642ee641ce cpufreq: stats: Fix buffer overflow d=
etection in trans_stats()
>> > > > > > > > > >     63e09cdfe948 regmap: Ensure range selector registe=
rs are updated after cache sync
>> > > > > > > > > >     0c49e74e95bf tty: serial: meson: fix hard LOCKUP o=
n crtscts mode
>> > > > > > > > > >     6f26b6a61b08 serial: meson: Use platform_get_irq()=
 to get the interrupt
>> > > > > > > > > >     450fa8bf803f ALSA: hda/realtek - Enable internal s=
peaker of ASUS K6500ZC
>> > > > > > > > > >     cc549ba50bb8 ALSA: hda/realtek - Add Dell ALC295 t=
o pin fall back table
>> > > > > > > > > >     767c988771cb ALSA: info: Fix potential deadlock at=
 disconnection
>> > > > > > > > > >     09022ae66261 xhci: Enable RPM on controllers that =
support low-power states
>> > > > > > > > > >     68574fe2e488 parisc/pgtable: Do not drop upper 5 a=
ddress bits of physical address
>> > > > > > > > > >     ea7593c18ff7 parisc: Prevent booting 64-bit kernel=
s on PA1.x machines
>> > > > > > > > > >     2c9092e8b29a i3c: master: svc: fix SDA keep low wh=
en polling IBIWON timeout happen
>> > > > > > > > > >     da754f92fc02 i3c: master: svc: fix check wrong sta=
tus register in irq handler
>> > > > > > > > > >     5ba77b6b45d6 i3c: master: svc: fix ibi may not ret=
urn mandatory data byte
>> > > > > > > > > >     e0a70ed4a580 i3c: master: svc: fix wrong data retu=
rn when IBI happen during start frame
>> > > > > > > > > >     7383675aba2f i3c: master: svc: fix race condition =
in ibi work thread
>> > > > > > > > > >     cc7efd1054f4 i3c: master: cdns: Fix reading status=
 register
>> > > > > > > > > >     d3c6a08c2b77 mtd: cfi_cmdset_0001: Byte swap OTP i=
nfo
>> > > > > > > > > >     a4668088128d mm/memory_hotplug: use pfn math in pl=
ace of direct struct page manipulation
>> > > > > > > > > >     792a796085cf mm/cma: use nth_page() in place of di=
rect struct page manipulation
>> > > > > > > > > >     9b59fc31226e s390/cmma: fix detection of DAT pages
>> > > > > > > > > >     45bb94aab891 dmaengine: stm32-mdma: correct desc p=
rep when channel running
>> > > > > > > > > >     91659b77e937 mcb: fix error handling for different=
 scenarios when parsing
>> > > > > > > > > >     534790fde890 tracing: Have the user copy of synthe=
tic event address use correct context
>> > > > > > > > > >     f6237afabc34 i2c: core: Run atomic i2c xfer when !=
preemptible
>> > > > > > > > > >     931aa7154bc4 kernel/reboot: emergency_restart: Set=
 correct system_state
>> > > > > > > > > >     7a3424c3b76a quota: explicitly forbid quota files =
from being encrypted
>> > > > > > > > > >     47f509832168 jbd2: fix potential data lost in reco=
vering journal raced with synchronizing fs bdev
>> > > > > > > > > >     f13e1ea45699 ASoC: codecs: wsa-macro: fix uninitia=
lized stack variables with name prefix
>> > > > > > > > > >     28436d8092ad selftests/resctrl: Reduce failures du=
e to outliers in MBA/MBM tests
>> > > > > > > > > >     6ce63598a1fb selftests/resctrl: Remove duplicate f=
eature check from CMT test
>> > > > > > > > > >     e90efe17fc07 netfilter: nf_tables: split async and=
 sync catchall in two functions
>> > > > > > > > > >     0d9506c766c9 netfilter: nf_tables: remove catchall=
 element in GC sync path
>> > > > > > > > > >     96fc7a50a278 PCI: keystone: Don't discard .probe()=
 callback
>> > > > > > > > > >     e0d394df9812 PCI: keystone: Don't discard .remove(=
) callback
>> > > > > > > > > >     f4f12667167c KEYS: trusted: Rollback init_trusted(=
) consistently
>> > > > > > > > > >     c407ff72fb3a genirq/generic_chip: Make irq_remove_=
generic_chip() irqdomain aware
>> > > > > > > > > >     bc8a14e3c630 mmc: meson-gx: Remove setting of CMD_=
CFG_ERROR
>> > > > > > > > > >     3a51e6b4da71 wifi: ath11k: fix htt pktlog locking
>> > > > > > > > > >     426e718ce9ba wifi: ath11k: fix dfs radar event loc=
king
>> > > > > > > > > >     e9d84413b1b7 wifi: ath11k: fix temperature event l=
ocking
>> > > > > > > > > >     5ff849948c11 ima: detect changes to the backing ov=
erlay file
>> > > > > > > > > >     4584a421a6d9 ima: annotate iint mutex to avoid loc=
kdep false positive warnings
>> > > > > > > > > >     4049576c639f ACPI: FPDT: properly handle invalid F=
PDT subtables
>> > > > > > > > > >     628e76e684c8 firmware: qcom_scm: use 64-bit callin=
g convention only when client is 64-bit
>> > > > > > > > > >     6eb8c191e360 btrfs: don't arbitrarily slow down de=
lalloc if we're committing
>> > > > > > > > > >     0b99626b28ca rcu: kmemleak: Ignore kmemleak false =
positives when RCU-freeing objects
>> > > > > > > > > >     71f5344f477c PM: hibernate: Clean up sync_read han=
dling in snapshot_write_next()
>> > > > > > > > > >     57dbc0eb8abe PM: hibernate: Use __get_safe_page() =
rather than touching the list
>> > > > > > > > > >     87a30633b5d3 arm64: dts: qcom: ipq6018: Fix hwlock=
 index for SMEM
>> > > > > > > > > >     ebaee06a7292 rcu/tree: Defer setting of jiffies du=
ring stall reset
>> > > > > > > > > >     057d1034d012 svcrdma: Drop connection after an RDM=
A Read error
>> > > > > > > > > >     541b3757fd44 wifi: wilc1000: use vmm_table as arra=
y in wilc struct
>> > > > > > > > > >     b156f62f19da PCI: exynos: Don't discard .remove() =
callback
>> > > > > > > > > >     f88796721002 PCI/ASPM: Fix L1 substate handling in=
 aspm_attr_store_common()
>> > > > > > > > > >     467864d55b52 mmc: sdhci_am654: fix start loop inde=
x for TAP value parsing
>> > > > > > > > > >     ef34a97bb9cb mmc: vub300: fix an error code
>> > > > > > > > > >     36adb6204cff clk: qcom: ipq6018: drop the CLK_SET_=
RATE_PARENT flag from PLL clocks
>> > > > > > > > > >     090b167b2c41 clk: qcom: ipq8074: drop the CLK_SET_=
RATE_PARENT flag from PLL clocks
>> > > > > > > > > >     18640a1818f1 clk: socfpga: Fix undefined behavior =
bug in struct stratix10_clock_data
>> > > > > > > > > >     4d17b54c9be3 parisc/pdc: Add width field to struct=
 pdc_model
>> > > > > > > > > >     936c9c10efae arm64: Restrict CPU_BIG_ENDIAN to GNU=
 as or LLVM IAS 15.x or newer
>> > > > > > > > > >     8b24bb54bf3a ACPI: resource: Do IRQ override on To=
ngFang GMxXGxx
>> > > > > > > > > >     5619c34d3c4c watchdog: move softlockup_panic back =
to early_param
>> > > > > > > > > >     a6c3a1fe09a2 PCI/sysfs: Protect driver's D3cold pr=
eference from user space
>> > > > > > > > > >     01975bee0a14 hvc/xen: fix event channel handling f=
or secondary consoles
>> > > > > > > > > >     cfd543c10871 hvc/xen: fix error path in xen_hvc_in=
it() to always register frontend driver
>> > > > > > > > > >     730e08cb9101 hvc/xen: fix console unplug
>> > > > > > > > > >     fa0b93a3de40 tty/sysrq: replace smp_processor_id()=
 with get_cpu()
>> > > > > > > > > >     92e6c0f00d38 audit: don't WARN_ON_ONCE(!current->m=
m) in audit_exe_compare()
>> > > > > > > > > >     e29c095f1ad4 audit: don't take task_lock() in audi=
t_exe_compare() code path
>> > > > > > > > > >     5eb6519f483e KVM: x86: Ignore MSR_AMD64_TW_CFG acc=
ess
>> > > > > > > > > >     1c49ef7041f2 KVM: x86: hyper-v: Don't auto-enable =
stimer on write from user-space
>> > > > > > > > > >     fe6b461c37cb x86/cpu/hygon: Fix the CPU topology e=
valuation for real
>> > > > > > > > > >     3a2adf48d8b1 crypto: x86/sha - load modules based =
on CPU features
>> > > > > > > > > >     be079aa71a12 scsi: qla2xxx: Fix system crash due t=
o bad pointer access
>> > > > > > > > > >     6ba3569f78d3 scsi: megaraid_sas: Increase register=
 read retry rount from 3 to 30 for selected registers
>> > > > > > > > > >     6a33b5810031 scsi: mpt3sas: Fix loop logic
>> > > > > > > > > >     3c5aede46cdc bpf: Fix precision tracking for BPF_A=
LU | BPF_TO_BE | BPF_END
>> > > > > > > > > >     403470431b15 bpf: Fix check_stack_write_fixed_off(=
) to correctly spill imm
>> > > > > > > > > >     ba115f6c3a8c randstruct: Fix gcc-plugin performanc=
e mode to stay in group
>> > > > > > > > > >     2771fac4382b powerpc/perf: Fix disabling BHRB and =
instruction sampling
>> > > > > > > > > >     7e450cc9ad54 media: venus: hfi: add checks to perf=
orm sanity on queue pointers
>> > > > > > > > > >     1566e8be73fd i915/perf: Fix NULL deref bugs with d=
rm_dbg() calls
>> > > > > > > > > >     35c17257ef09 xfs: Fix unreferenced object reported=
 by kmemleak in xfs_sysfs_init()
>> > > > > > > > > >     5db146322b17 xfs: fix memory leak in xfs_errortag_=
init
>> > > > > > > > > >     c540284d8488 xfs: fix exception caused by unexpect=
ed illegal bestcount in leaf dir
>> > > > > > > > > >     5212d586e76f xfs: avoid a UAF when log intent item=
 recovery fails
>> > > > > > > > > >     ba179cc12109 xfs: fix inode reservation space for =
removing transaction
>> > > > > > > > > >     b7847653a2d6 xfs: Fix false ENOSPC when performing=
 direct write on a delalloc extent in cow fork
>> > > > > > > > > >     92d38b87e886 xfs: add missing cmap->br_state =3D X=
FS_EXT_NORM update
>> > > > > > > > > >     8d0baec78e8a xfs: fix intermittent hang during quo=
tacheck
>> > > > > > > > > >     76545c0e881b xfs: don't leak memory when attr fork=
 loading fails
>> > > > > > > > > >     eb888caf27d9 xfs: fix use-after-free in xattr node=
 block inactivation
>> > > > > > > > > >     4cb3842967e6 xfs: flush inode gc workqueue before =
clearing agi bucket
>> > > > > > > > > >     188594c64a1e xfs: prevent a UAF when log IO errors=
 race with unmount
>> > > > > > > > > >     921c96215850 xfs: use invalidate_lock to check the=
 state of mmap_lock
>> > > > > > > > > >     efd194800b69 xfs: convert buf_cancel_table allocat=
ion to kmalloc_array
>> > > > > > > > > >     074fee186931 xfs: don't leak xfs_buf_cancel struct=
ures when recovery fails
>> > > > > > > > > >     b8effd31a862 xfs: refactor buffer cancellation tab=
le allocation
>> > > > > > > > > >     4968c2aa6a1f cifs: fix check of rc in function gen=
erate_smb3signingkey
>> > > > > > > > > >     8d725bf0d16d cifs: spnego: add ';' in HOST_KEY_LEN
>> > > > > > > > > >     21accf149161 tools/power/turbostat: Enable the C-s=
tate Pre-wake printing
>> > > > > > > > > >     0045c1ff7ac0 tools/power/turbostat: Fix a knl bug
>> > > > > > > > > >     5bcce23f387b macvlan: Don't propagate promisc chan=
ge to lower dev in passthru
>> > > > > > > > > >     7574b5e65e92 net/mlx5e: Check return value of snpr=
intf writing to fw_version buffer for representors
>> > > > > > > > > >     55553c5b53ae net/mlx5e: Reduce the size of icosq_s=
tr
>> > > > > > > > > >     51655fd35703 net/mlx5e: Fix pedit endianness
>> > > > > > > > > >     a990dd7410ec net/mlx5e: Refactor mod header manage=
ment API
>> > > > > > > > > >     39f95b1d0d8f net/mlx5e: Move mod hdr allocation to=
 a single place
>> > > > > > > > > >     c0f37a3715cb net/mlx5e: Remove incorrect addition =
of action fwd flag
>> > > > > > > > > >     6974fd92d5f1 net/mlx5e: fix double free of encap_h=
eader in update funcs
>> > > > > > > > > >     f3c4a7044201 net/mlx5e: fix double free of encap_h=
eader
>> > > > > > > > > >     931e9e8e30bf net: stmmac: fix rx budget limit chec=
k
>> > > > > > > > > >     b8b514b2a6cd netfilter: nf_tables: fix pointer mat=
h issue in nft_byteorder_eval()
>> > > > > > > > > >     25da0f582119 netfilter: nf_tables: add and use BE =
register load-store helpers
>> > > > > > > > > >     a48f6be5bdb7 netfilter: nf_tables: use the correct=
 get/put helpers
>> > > > > > > > > >     7d3901bf3baa netfilter: nf_conntrack_bridge: initi=
alize err to 0
>> > > > > > > > > >     75bcfc188abf af_unix: fix use-after-free in unix_s=
tream_read_actor()
>> > > > > > > > > >     0b480c654ef2 net: ethernet: cortina: Fix MTU max s=
etting
>> > > > > > > > > >     097588e20c6b net: ethernet: cortina: Handle large =
frames
>> > > > > > > > > >     f9269b274cdf net: ethernet: cortina: Fix max RX fr=
ame define
>> > > > > > > > > >     53064e8239dd bonding: stop the device in bond_setu=
p_by_slave()
>> > > > > > > > > >     cda210a4bdf7 ptp: annotate data-race around q->hea=
d and q->tail
>> > > > > > > > > >     b67d16b2373b xen/events: fix delayed eoi list hand=
ling
>> > > > > > > > > >     8531a4194e59 ppp: limit MRU to 64K
>> > > > > > > > > >     9ae82308d184 tipc: Fix kernel-infoleak due to unin=
itialized TLV value
>> > > > > > > > > >     359c65daf6b5 net: hns3: fix VF wrong speed and dup=
lex issue
>> > > > > > > > > >     406be003d698 net: hns3: fix VF reset fail issue
>> > > > > > > > > >     cfc131b078a3 net: hns3: fix variable may not initi=
alized problem in hns3_init_mac_addr()
>> > > > > > > > > >     070581829c1a net: hns3: fix incorrect capability b=
it display for copper port
>> > > > > > > > > >     a3c65cf7854d net: hns3: add barrier in vf mailbox =
reply process
>> > > > > > > > > >     e671d8203758 net: hns3: add byte order conversion =
for PF to VF mailbox message
>> > > > > > > > > >     bb0f14257c04 net: hns3: refine the definition for =
struct hclge_pf_to_vf_msg
>> > > > > > > > > >     1d8f66d4060a net: hns3: fix add VLAN fail issue
>> > > > > > > > > >     4b3b2541d40e tty: Fix uninit-value access in ppp_s=
ync_receive()
>> > > > > > > > > >     1f64cad3ac38 ipvlan: add ipvlan_route_v6_outbound(=
) helper
>> > > > > > > > > >     6c71b9b177c6 net: set SOCK_RCU_FREE before inserti=
ng socket into hashtable
>> > > > > > > > > >     427165421c25 net: inet: Retire port only listening=
_hash
>> > > > > > > > > >     be1ceb8b7c58 net: inet: Open code inet_hash2 and i=
net_unhash2
>> > > > > > > > > >     bb9bcf47fba7 net: inet: Remove count from inet_lis=
ten_hashbucket
>> > > > > > > > > >     de634368e079 mptcp: listen diag dump support
>> > > > > > > > > >     870f438aca56 mptcp: diag: switch to context struct=
ure
>> > > > > > > > > >     be020f658c63 gfs2: Silence "suspicious RCU usage i=
n gfs2_permission" warning
>> > > > > > > > > >     194454afa6aa SUNRPC: Fix RPC client cleaned up the=
 freed pipefs dentries
>> > > > > > > > > >     319ed0cba164 NFSv4.1: fix SP4_MACH_CRED protection=
 for pnfs IO
>> > > > > > > > > >     809684f5b388 SUNRPC: Add an IS_ERR() check back to=
 where it was
>> > > > > > > > > >     46d6b768072b SUNRPC: ECONNRESET might require a re=
bind
>> > > > > > > > > >     a7032d4d6499 media: cec: meson: always include mes=
on sub-directory in Makefile
>> > > > > > > > > >     16e78f28517d media: cadence: csi2rx: Unregister v4=
l2 async notifier
>> > > > > > > > > >     20c2ca9abb78 sched/core: Optimize in_task() and in=
_interrupt() a bit
>> > > > > > > > > >     9894c58c1777 tracing/perf: Add interrupt_context_l=
evel() helper
>> > > > > > > > > >     48fef664d7e9 tracing: Reuse logic from perf's get_=
recursion_context()
>> > > > > > > > > >     670b3e902f62 wifi: iwlwifi: Use FW rate for non-da=
ta frames
>> > > > > > > > > >     a7ee519e8095 pwm: Fix double shift bug
>> > > > > > > > > >     7054366cd076 drm/amdgpu: fix software pci_unplug o=
n some chips
>> > > > > > > > > >     e48a5e78d077 drm/qxl: prevent memory leak
>> > > > > > > > > >     0835e7f296ca ASoC: ti: omap-mcbsp: Fix runtime PM =
underflow warnings
>> > > > > > > > > >     38ada2f304f6 i2c: dev: copy userspace array safely
>> > > > > > > > > >     610244988f32 kgdb: Flush console before entering k=
gdb on panic
>> > > > > > > > > >     4e497f1acd99 drm/amd/display: Avoid NULL dereferen=
ce of timing generator
>> > > > > > > > > >     5e0b788fb96b media: imon: fix access to invalid re=
source for the second interface
>> > > > > > > > > >     ae6bcafe1f6b media: ccs: Fix driver quirk struct d=
ocumentation
>> > > > > > > > > >     d01b0ad79ecd media: cobalt: Use FIELD_GET() to ext=
ract Link Width
>> > > > > > > > > >     03ce0655bf8e gfs2: fix an oops in gfs2_permission
>> > > > > > > > > >     5bfda356e903 gfs2: ignore negated quota changes
>> > > > > > > > > >     16631907d013 media: vivid: avoid integer overflow
>> > > > > > > > > >     09cd8b561aa9 media: gspca: cpia1: shift-out-of-bou=
nds in set_flicker
>> > > > > > > > > >     39c71357e68e i3c: master: mipi-i3c-hci: Fix a kern=
el panic for accessing DAT_data.
>> > > > > > > > > >     72775cad7f57 virtio-blk: fix implicit overflow on =
virtio_max_dma_size
>> > > > > > > > > >     f7f3bdb225e3 i2c: sun6i-p2wi: Prevent potential di=
vision by zero
>> > > > > > > > > >     d23ad76f240c i3c: mipi-i3c-hci: Fix out of bounds =
access in hci_dma_irq_handler
>> > > > > > > > > >     e6fbad3cc880 9p: v9fs_listxattr: fix %s null argum=
ent warning
>> > > > > > > > > >     a18be976be41 9p/trans_fd: Annotate data-racy write=
s to file::f_flags
>> > > > > > > > > >     2cc5e191d671 usb: gadget: f_ncm: Always set curren=
t gadget in ncm_bind()
>> > > > > > > > > >     6c80f48912b5 tty: vcc: Add check for kstrdup() in =
vcc_probe()
>> > > > > > > > > >     2ff61106d6b4 exfat: support handle zero-size direc=
tory
>> > > > > > > > > >     c86a3007a685 HID: Add quirk for Dell Pro Wireless =
Keyboard and Mouse KM5221W
>> > > > > > > > > >     3453f945af89 PCI: Use FIELD_GET() in Sapphire RX 5=
600 XT Pulse quirk
>> > > > > > > > > >     0a93a0f99a09 misc: pci_endpoint_test: Add Device I=
D for R-Car S4-8 PCIe controller
>> > > > > > > > > >     03dbd6a9ea4e PCI: Disable ATS for specific Intel I=
PU E2000 devices
>> > > > > > > > > >     a9a0b3444845 PCI: Extract ATS disabling to a helpe=
r function
>> > > > > > > > > >     fe511d24418a PCI: Use FIELD_GET() to extract Link =
Width
>> > > > > > > > > >     56d78b5495eb scsi: libfc: Fix potential NULL point=
er dereference in fc_lport_ptp_setup()
>> > > > > > > > > >     37a51e7f36b7 atm: iphase: Do PCI error checks on o=
wn line
>> > > > > > > > > >     f05ae00106aa PCI: tegra194: Use FIELD_GET()/FIELD_=
PREP() with Link Width fields
>> > > > > > > > > >     631a96e9eb42 ALSA: hda: Fix possible null-ptr-dere=
f when assigning a stream
>> > > > > > > > > >     1c805b9cd2e3 ARM: 9320/1: fix stack depot IRQ stac=
k filter
>> > > > > > > > > >     8d25ec69f8f1 HID: lenovo: Detect quirk-free fw on =
cptkbd and stop applying workaround
>> > > > > > > > > >     64f062baf202 jfs: fix array-index-out-of-bounds in=
 diAlloc
>> > > > > > > > > >     da3da5e1e6f7 jfs: fix array-index-out-of-bounds in=
 dbFindLeaf
>> > > > > > > > > >     1f74d336990f fs/jfs: Add validity check for db_max=
ag and db_agpref
>> > > > > > > > > >     5f148b16972e fs/jfs: Add check for negative db_l2n=
bperpage
>> > > > > > > > > >     e1d1f79b1929 scsi: ibmvfc: Remove BUG_ON in the ca=
se of an empty event pool
>> > > > > > > > > >     f0bfc8a5561f scsi: hisi_sas: Set debugfs_dir point=
er to NULL after removing debugfs
>> > > > > > > > > >     5904dee70771 RDMA/hfi1: Use FIELD_GET() to extract=
 Link Width
>> > > > > > > > > >     546c1796ad1e crypto: pcrypt - Fix hungtask for PAD=
ATA_RESET
>> > > > > > > > > >     bc443a199f8c ASoC: soc-card: Add storage for PCI S=
SID
>> > > > > > > > > >     9f2082067c5f selftests/efivarfs: create-read: fix =
a resource leak
>> > > > > > > > > >     428cad17f53b arm64: dts: ls208xa: use a pseudo-bus=
 to constrain usb dma size
>> > > > > > > > > >     174f62a0aa15 drm/amdgpu: Fix a null pointer access=
 when the smc_rreg pointer is NULL
>> > > > > > > > > >     3f7a400d5e80 drm/amdkfd: Fix shift out-of-bounds i=
ssue
>> > > > > > > > > >     300589d551d4 drm/panel: st7703: Pick different res=
et sequence
>> > > > > > > > > >     eaa03ea366c8 drm/amdgpu/vkms: fix a possible null =
pointer dereference
>> > > > > > > > > >     84c923d89890 drm/panel/panel-tpo-tpg110: fix a pos=
sible null pointer dereference
>> > > > > > > > > >     2381f6b628b3 drm/panel: fix a possible null pointe=
r dereference
>> > > > > > > > > >     c11cf5e117f5 drm/amdgpu: Fix potential null pointe=
r derefernce
>> > > > > > > > > >     a237675aa1e6 drm/amd: Fix UBSAN array-index-out-of=
-bounds for Polaris and Tonga
>> > > > > > > > > >     acdb6830de02 drm/amd: Fix UBSAN array-index-out-of=
-bounds for SMU7
>> > > > > > > > > >     829ce8e995a8 drm/msm/dp: skip validity check for D=
P CTS EDID checksum
>> > > > > > > > > >     689b33b94f09 drm: vmwgfx_surface.c: copy user-arra=
y safely
>> > > > > > > > > >     22260dabcfe3 kernel: watch_queue: copy user-array =
safely
>> > > > > > > > > >     d4f2c09d4672 kernel: kexec: copy user-array safely
>> > > > > > > > > >     24b17d530c42 string.h: add array-wrappers for (v)m=
emdup_user()
>> > > > > > > > > >     3a3a6dc9a330 drm/amd/display: use full update for =
clip size increase of large plane source
>> > > > > > > > > >     7d43cdd22cd8 drm/amdkfd: Fix a race condition of v=
ram buffer unref in svm code
>> > > > > > > > > >     eea81424c5b8 drm/komeda: drop all currently held l=
ocks if deadlock happens
>> > > > > > > > > >     812886866be6 platform/x86: thinkpad_acpi: Add batt=
ery quirk for Thinkpad X120e
>> > > > > > > > > >     ba7088769800 Bluetooth: Fix double free in hci_con=
n_cleanup
>> > > > > > > > > >     f9de14bde56d Bluetooth: btusb: Add date->evt_skb i=
s NULL check
>> > > > > > > > > >     a43cf6acf017 wifi: ath10k: Don't touch the CE inte=
rrupt registers after power up
>> > > > > > > > > >     6f42bd243327 net: annotate data-races around sk->s=
k_dst_pending_confirm
>> > > > > > > > > >     19ab5fd26441 net: annotate data-races around sk->s=
k_tx_queue_mapping
>> > > > > > > > > >     f3be63f7a8ee wifi: ath10k: fix clang-specific fort=
ify warning
>> > > > > > > > > >     02a0547b8da0 wifi: ath9k: fix clang-specific forti=
fy warnings
>> > > > > > > > > >     cf353904a828 bpf: Detect IP =3D=3D ksym.end as par=
t of BPF program
>> > > > > > > > > >     c29a89b23f67 atl1c: Work around the DMA RX overflo=
w issue
>> > > > > > > > > >     21a0f310a9f3 wifi: mac80211: don't return unset po=
wer in ieee80211_get_tx_power()
>> > > > > > > > > >     3073e38086d0 wifi: mac80211_hwsim: fix clang-speci=
fic fortify warning
>> > > > > > > > > >     e8e55fa44435 x86/mm: Drop the 4 MB restriction on =
minimal NUMA node memory size
>> > > > > > > > > >     f9d3ba62e87b workqueue: Provide one lock class key=
 per work_on_cpu() callsite
>> > > > > > > > > >     0a5b512d526c clocksource/drivers/timer-atmel-tcb: =
Fix initialization on SAM9 hardware
>> > > > > > > > > >     465b88c0873b clocksource/drivers/timer-imx-gpt: Fi=
x potential memory leak
>> > > > > > > > > >     fd0df3f87192 perf/core: Bail out early if the requ=
est AUX area is out of bound
>> > > > > > > > > >     e89d0ed45a41 locking/ww_mutex/test: Fix potential =
workqueue corruption
>> > > > > > > > > >     2a910f4af54d Linux 5.15.139
>> > > > > > > > > >     3443337acd37 btrfs: use u64 for buffer sizes in th=
e tree search ioctls
>> > > > > > > > > >     f9f5e8cecba9 Revert "mmc: core: Capture correct oe=
mid-bits for eMMC cards"
>> > > > > > > > > >     824829c2c6b4 tracing/kprobes: Fix the order of arg=
ument descriptions
>> > > > > > > > > >     560680f745fc fbdev: fsl-diu-fb: mark wr_reg_wa() s=
tatic
>> > > > > > > > > >     8e4b510fe917 fbdev: imsttfb: fix a resource leak i=
n probe
>> > > > > > > > > >     3648582181b6 fbdev: imsttfb: Fix error path of ims=
ttfb_probe()
>> > > > > > > > > >     30959f9f4540 spi: spi-zynq-qspi: add spi-mem to dr=
iver kconfig dependencies
>> > > > > > > > > >     9cf044cc36c1 ASoC: hdmi-codec: register hpd callba=
ck on component probe
>> > > > > > > > > >     705e5a28ec1d drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLA=
GS_WAIT_AVAILABLE
>> > > > > > > > > >     0ca05fae2790 netfilter: nat: fix ipv6 nat redirect=
 with mapped and scoped addresses
>> > > > > > > > > >     1652f57f02eb netfilter: nft_redir: use `struct nf_=
nat_range2` throughout and deduplicate eval call-backs
>> > > > > > > > > >     d28c17abe098 netfilter: xt_recent: fix (increase) =
ipv6 literal buffer length
>> > > > > > > > > >     f30567fcbc4d i2c: iproc: handle invalid slave stat=
e
>> > > > > > > > > >     38f5ac54b917 r8169: respect userspace disabling IF=
F_MULTICAST
>> > > > > > > > > >     fd01115b033c blk-core: use pr_warn_ratelimited() i=
n bio_check_ro()
>> > > > > > > > > >     b80148710983 block: remove unneeded return value o=
f bio_check_ro()
>> > > > > > > > > >     d8d94d6b3bd3 tg3: power down device only on SYSTEM=
_POWER_OFF
>> > > > > > > > > >     5ea06a23f8f4 net/smc: put sk reference if close wo=
rk was canceled
>> > > > > > > > > >     884606f8283c net/smc: allow cdc msg send rather th=
an drop it with NULL sndbuf_desc
>> > > > > > > > > >     a62af7146daa net/smc: fix dangling sock under stat=
e SMC_APPFINCLOSEWAIT
>> > > > > > > > > >     866606826f16 selftests: pmtu.sh: fix result checki=
ng
>> > > > > > > > > >     2d117ac1b8f8 net: stmmac: xgmac: Enable support fo=
r multiple Flexible PPS outputs
>> > > > > > > > > >     95a99ac112c5 Fix termination state for idr_for_eac=
h_entry_ul()
>> > > > > > > > > >     70ef755f126b net: r8169: Disable multicast filter =
for RTL8168H and RTL8107E
>> > > > > > > > > >     0dad0e75d62b dccp/tcp: Call security_inet_conn_req=
uest() after setting IPv6 addresses.
>> > > > > > > > > >     c340713bdf32 dccp: Call security_inet_conn_request=
() after setting IPv4 addresses.
>> > > > > > > > > >     d1b7e6562a4c octeontx2-pf: Fix holes in error code
>> > > > > > > > > >     f60297ef59d4 octeontx2-pf: Fix error codes
>> > > > > > > > > >     794d360b1d65 inet: shrink struct flowi_common
>> > > > > > > > > >     8943083bbb64 bpf: Check map->usercnt after timer->=
timer is assigned
>> > > > > > > > > >     3907b89cd17f tipc: Change nla_policy for bearer-re=
lated names to NLA_NUL_STRING
>> > > > > > > > > >     a1a485e45d24 hsr: Prevent use after free in prp_cr=
eate_tagged_frame()
>> > > > > > > > > >     352887b3edd0 llc: verify mac len before reading ma=
c header
>> > > > > > > > > >     303766bb92c5 Input: synaptics-rmi4 - fix use after=
 free in rmi_unregister_function()
>> > > > > > > > > >     741e4c15d7c0 pwm: brcmstb: Utilize appropriate clo=
ck APIs in suspend/resume
>> > > > > > > > > >     895ac9a21f69 pwm: sti: Reduce number of allocation=
s and drop usage of chip_data
>> > > > > > > > > >     db64ddddeeec regmap: prevent noinc writes from clo=
bbering cache
>> > > > > > > > > >     004d4002534e media: dvb-usb-v2: af9035: fix missin=
g unlock
>> > > > > > > > > >     a0beda184756 media: cedrus: Fix clock/reset sequen=
ce
>> > > > > > > > > >     980be4c3b0d5 media: vidtv: mux: Add check and kfre=
e for kstrdup
>> > > > > > > > > >     d17269fb9161 media: vidtv: psi: Add check for kstr=
dup
>> > > > > > > > > >     db89f551b706 media: s3c-camif: Avoid inappropriate=
 kfree()
>> > > > > > > > > >     51c94256a83f media: bttv: fix use after free error=
 due to btv->timeout timer
>> > > > > > > > > >     d3937f9e25d9 media: i2c: max9286: Fix some redunda=
nt of_node_put() calls
>> > > > > > > > > >     9d060f2fc40c pcmcia: ds: fix possible name leak in=
 error path in pcmcia_device_add()
>> > > > > > > > > >     24e9df588e2e pcmcia: ds: fix refcount leak in pcmc=
ia_device_add()
>> > > > > > > > > >     24e73ab542c7 pcmcia: cs: fix possible hung task an=
d memory leak pccardd()
>> > > > > > > > > >     b3eaa0d43c74 rtc: pcf85363: fix wrong mask/val par=
ameters in regmap_update_bits call
>> > > > > > > > > >     20bd0198bebd cxl/mem: Fix shutdown order
>> > > > > > > > > >     d48fe8d98171 i3c: Fix potential refcount leak in i=
3c_master_register_new_i3c_devs
>> > > > > > > > > >     855d6fb2cc7b 9p/net: fix possible memory leak in p=
9_check_errors()
>> > > > > > > > > >     0d456ebaad30 perf hist: Add missing puts to hist__=
account_cycles
>> > > > > > > > > >     924e8d0b7645 perf machine: Avoid out of bounds LBR=
 memory read
>> > > > > > > > > >     76b0eab987c4 usb: host: xhci-plat: fix possible ke=
rnel oops while resuming
>> > > > > > > > > >     c9c4dab06a5a xhci: Loosen RPM as default policy to=
 cover for AMD xHC 1.1
>> > > > > > > > > >     92c9ef156431 powerpc/pseries: fix potential memory=
 leak in init_cpu_associativity()
>> > > > > > > > > >     516235e7b35f powerpc/imc-pmu: Use the correct spin=
lock initializer.
>> > > > > > > > > >     945dc61d7840 powerpc/xive: Fix endian conversion s=
ize
>> > > > > > > > > >     bce31a2bcb1e powerpc/40x: Remove stale PTE_ATOMIC_=
UPDATES macro
>> > > > > > > > > >     1308e55eb09c modpost: fix tee MODULE_DEVICE_TABLE =
built on big-endian host
>> > > > > > > > > >     863a9c3fdec2 powerpc: Only define __parse_fpscr() =
when required
>> > > > > > > > > >     01f62c6bd2db f2fs: fix to initialize map.m_pblk in=
 f2fs_precache_extents()
>> > > > > > > > > >     dfebea7114e0 dmaengine: pxa_dma: Remove an erroneo=
us BUG_ON() in pxad_free_desc()
>> > > > > > > > > >     72f8fa6c4b78 USB: usbip: fix stub_dev hub disconne=
ct
>> > > > > > > > > >     168697f15a53 tools: iio: iio_generic_buffer ensure=
 alignment
>> > > > > > > > > >     a61c3c647ffd misc: st_core: Do not call kfree_skb(=
) under spin_lock_irqsave()
>> > > > > > > > > >     732aa0cb2601 dmaengine: ti: edma: handle irq_of_pa=
rse_and_map() errors
>> > > > > > > > > >     2941a29fe9d6 usb: chipidea: Simplify Tegra DMA ali=
gnment code
>> > > > > > > > > >     58e8316b200b usb: chipidea: Fix DMA overwrite for =
Tegra
>> > > > > > > > > >     fcaafb574fc8 usb: dwc2: fix possible NULL pointer =
dereference caused by driver concurrency
>> > > > > > > > > >     c956be5641cc dmaengine: idxd: Register dsa_bus_typ=
e before registering idxd sub-drivers
>> > > > > > > > > >     ca46d7ce1fbe livepatch: Fix missing newline charac=
ter in klp_resolve_symbols()
>> > > > > > > > > >     b77f7c025e85 tty: tty_jobctrl: fix pid memleak in =
disassociate_ctty()
>> > > > > > > > > >     e9f598a5cc9a f2fs: compress: fix to avoid redundan=
t compress extension
>> > > > > > > > > >     8c4504cc0c64 f2fs: compress: fix to avoid use-afte=
r-free on dic
>> > > > > > > > > >     ca0aae3837a6 leds: trigger: ledtrig-cpu:: Fix 'out=
put may be truncated' issue for 'cpu'
>> > > > > > > > > >     206a972511a8 leds: pwm: Don't disable the PWM when=
 the LED should be off
>> > > > > > > > > >     893eedf596dd leds: turris-omnia: Do not use SMBUS =
calls
>> > > > > > > > > >     aec3706971b3 leds: turris-omnia: Drop unnecessary =
mutex locking
>> > > > > > > > > >     c9a4f13c58f1 mfd: arizona-spi: Set pdata.hpdet_cha=
nnel for ACPI enumerated devs
>> > > > > > > > > >     63a99d7b57b4 mfd: dln2: Fix double put in dln2_pro=
be
>> > > > > > > > > >     2742c860e0b7 mfd: core: Ensure disabled devices ar=
e skipped without aborting
>> > > > > > > > > >     94eb5423d75e mfd: core: Un-constify mfd_cell.of_re=
g
>> > > > > > > > > >     8890d4d5f25e ASoC: ams-delta.c: use component afte=
r check
>> > > > > > > > > >     a2ae48bd82ee crypto: qat - fix deadlock in backlog=
 processing
>> > > > > > > > > >     0dd34a7ad395 padata: Fix refcnt handling in padata=
_free_shell()
>> > > > > > > > > >     93e4aa8545ab ASoC: Intel: Skylake: Fix mem leak wh=
en parsing UUIDs fails
>> > > > > > > > > >     cd1c2df64d6b HID: logitech-hidpp: Move get_wireles=
s_feature_index() check to hidpp_connect_event()
>> > > > > > > > > >     99893b7c4592 HID: logitech-hidpp: Revert "Don't re=
start communication if not necessary"
>> > > > > > > > > >     5f2f38602583 HID: logitech-hidpp: Don't restart IO=
, instead defer hid_connect() only
>> > > > > > > > > >     1f80041c5867 HID: logitech-hidpp: Remove HIDPP_QUI=
RK_NO_HIDINPUT quirk
>> > > > > > > > > >     d3b196a1da3e Revert "HID: logitech-hidpp: add a mo=
dule parameter to keep firmware gestures"
>> > > > > > > > > >     6885e5ffa09d sh: bios: Revive earlyprintk support
>> > > > > > > > > >     b0c25e957f9b hid: cp2112: Fix IRQ shutdown stoppin=
g polling for all IRQs on chip
>> > > > > > > > > >     d06dc0f99f72 RDMA/hfi1: Workaround truncation comp=
ilation error
>> > > > > > > > > >     086cd44204bb scsi: ufs: core: Leave space for '\0'=
 in utf8 desc string
>> > > > > > > > > >     a0f1999090b3 ASoC: fsl: Fix PM disable depth imbal=
ance in fsl_easrc_probe
>> > > > > > > > > >     904fc0103776 RDMA/hns: The UD mode can only be con=
figured with DCQCN
>> > > > > > > > > >     9f8db02d30ad RDMA/hns: Fix signed-unsigned mixed c=
omparisons
>> > > > > > > > > >     2de683e27e1d RDMA/hns: Fix uninitialized ucmd in h=
ns_roce_create_qp_common()
>> > > > > > > > > >     611260e36f16 IB/mlx5: Fix rdma counter binding for=
 RAW QP
>> > > > > > > > > >     922b2693b9af ASoC: fsl: mpc5200_dma.c: Fix warning=
 of Function parameter or member not described
>> > > > > > > > > >     001f90cd9d2f ext4: move 'ix' sanity check to corre=
nt position
>> > > > > > > > > >     c24a3c9e373e ARM: 9321/1: memset: cast the constan=
t byte to unsigned char
>> > > > > > > > > >     012d0c66f939 hid: cp2112: Fix duplicate workqueue =
initialization
>> > > > > > > > > >     1ce09238e8e8 crypto: qat - increase size of buffer=
s
>> > > > > > > > > >     62df66b726f9 crypto: caam/jr - fix Chacha20 + Poly=
1305 self test failure
>> > > > > > > > > >     61f25d4686bf crypto: caam/qi2 - fix Chacha20 + Pol=
y1305 self test failure
>> > > > > > > > > >     66eb7b7f23dd nd_btt: Make BTT lanes preemptible
>> > > > > > > > > >     6563e0f79d63 libnvdimm/of_pmem: Use devm_kstrdup i=
nstead of kstrdup and check its return value
>> > > > > > > > > >     d4ad0c1a83ce scsi: ibmvfc: Fix erroneous use of rt=
as_busy_delay with hcall return code
>> > > > > > > > > >     b79c7d684c3f RDMA/core: Use size_{add,sub,mul}() i=
n calls to struct_size()
>> > > > > > > > > >     a5c83c8043d7 hwrng: geode - fix accessing register=
s
>> > > > > > > > > >     a8607725b20a crypto: hisilicon/hpre - Fix a errone=
ous check after snprintf()
>> > > > > > > > > >     b01b9dc5487a selftests/resctrl: Ensure the benchma=
rk commands fits to its array
>> > > > > > > > > >     2d2300fcf8f6 selftests/pidfd: Fix ksft print forma=
ts
>> > > > > > > > > >     8bc9c9447489 arm64: dts: imx8mn: Add sound-dai-cel=
ls to micfil node
>> > > > > > > > > >     1abd658492b5 arm64: dts: imx8mm: Add sound-dai-cel=
ls to micfil node
>> > > > > > > > > >     cf7abb54f8b1 arm64: dts: imx8qm-ss-img: Fix jpegen=
c compatible entry
>> > > > > > > > > >     8704bf18a888 clk: scmi: Free scmi_clk allocated wh=
en the clocks with invalid info are skipped
>> > > > > > > > > >     bdb0428aa294 firmware: arm_ffa: Assign the missing=
 IDR allocation ID to the FFA device
>> > > > > > > > > >     b0ffdc164365 firmware: ti_sci: Mark driver as non =
removable
>> > > > > > > > > >     995ee1e84e8d soc: qcom: llcc: Handle a second devi=
ce without data corruption
>> > > > > > > > > >     19b8098f73c6 ARM: dts: qcom: mdm9615: populate vsd=
cc fixed regulator
>> > > > > > > > > >     a8ab88f84b89 arm64: dts: qcom: apq8016-sbc: Add mi=
ssing ADV7533 regulators
>> > > > > > > > > >     ddc0df81eeac ARM64: dts: marvell: cn9310: Use appr=
opriate label for spi1 pins
>> > > > > > > > > >     12d9de01c09c arm64: dts: qcom: sdm845-mtp: fix WiF=
i configuration
>> > > > > > > > > >     690b89255971 arm64: dts: qcom: sc7280: Add missing=
 LMH interrupts
>> > > > > > > > > >     2a4cce4168f7 arm64: dts: qcom: msm8992-libra: drop=
 duplicated reserved memory
>> > > > > > > > > >     eb9daf47806b arm64: dts: qcom: msm8916: Fix iommu =
local address range
>> > > > > > > > > >     541640dcbf48 ARM: dts: renesas: blanche: Fix typo =
in GP_11_2 pin name
>> > > > > > > > > >     0e1e88bba286 perf: hisi: Fix use-after-free when r=
egister pmu fails
>> > > > > > > > > >     4067d39f3c57 drm: mediatek: mtk_dsi: Fix NO_EOT_PA=
CKET settings/handling
>> > > > > > > > > >     a6a6f70aedca drm/msm/dsi: use msm_gem_kernel_put t=
o free TX buffer
>> > > > > > > > > >     aea6f32a4318 xen-pciback: Consider INTx disabled w=
hen MSI/MSI-X is enabled
>> > > > > > > > > >     e588ca45bf55 drm/rockchip: Fix type promotion bug =
in rockchip_gem_iommu_map()
>> > > > > > > > > >     a00a293d57a5 arm64/arm: xen: enlighten: Fix KPTI c=
hecks
>> > > > > > > > > >     d0d01bb4a560 drm/bridge: lt9611uxc: fix the race i=
n the error path
>> > > > > > > > > >     29aba28ea195 drm/bridge: lt9611uxc: Register and a=
ttach our DSI device at probe
>> > > > > > > > > >     f53a04579328 drm/bridge: lt9611uxc: Switch to devm=
 MIPI-DSI helpers
>> > > > > > > > > >     517a5137a57b drm/rockchip: cdn-dp: Fix some error =
handling paths in cdn_dp_probe()
>> > > > > > > > > >     865ccd4ca674 drm/mediatek: Fix iommu fault during =
crtc enabling
>> > > > > > > > > >     8e3c8253b34f drm/mediatek: Fix iommu fault by swap=
ping FBs after updating plane state
>> > > > > > > > > >     e11e339faa11 drm/amdkfd: fix some race conditions =
in vram buffer alloc/free of svm code
>> > > > > > > > > >     30cb99e09648 drm/bridge: tc358768: Fix bit updates
>> > > > > > > > > >     1cd4ae681a6a drm/bridge: tc358768: Disable non-con=
tinuous clock mode
>> > > > > > > > > >     c13591b859be drm/bridge: tc358768: Fix use of unin=
itialized variable
>> > > > > > > > > >     d78bddd94b80 drm/bridge: lt8912b: Add missing drm_=
bridge_attach call
>> > > > > > > > > >     5cc2bc519afd drm/bridge: lt8912b: Manually disable=
 HPD only if it was enabled
>> > > > > > > > > >     42071feab712 drm/bridge: lt8912b: Fix crash on bri=
dge detach
>> > > > > > > > > >     d9217286d0ab drm/bridge: lt8912b: Fix bridge_detac=
h
>> > > > > > > > > >     cc3057958c5c drm/bridge: lt8912b: Add hot plug det=
ection
>> > > > > > > > > >     ef4a40953c80 drm/bridge: lt8912b: Register and att=
ach our DSI device at probe
>> > > > > > > > > >     3580b8a01305 drm/bridge: lt8912b: Switch to devm M=
IPI-DSI helpers
>> > > > > > > > > >     52541851a8d1 drm/mipi-dsi: Create devm device atta=
chment
>> > > > > > > > > >     a20d6ecd261a drm/mipi-dsi: Create devm device regi=
stration
>> > > > > > > > > >     347f025a02b3 drm/radeon: possible buffer overflow
>> > > > > > > > > >     b163b371d741 drm/rockchip: vop: Fix call to crtc r=
eset helper
>> > > > > > > > > >     9a96bed1df7b drm/rockchip: vop: Fix reset of state=
 in duplicate state crtc funcs
>> > > > > > > > > >     1b0bc99cf316 hwmon: (coretemp) Fix potentially tru=
ncated sysfs attribute name
>> > > > > > > > > >     b3e7eb23a6e9 hwmon: (axi-fan-control) Fix possible=
 NULL pointer dereference
>> > > > > > > > > >     e0bf076b734a platform/x86: wmi: Fix opening of cha=
r device
>> > > > > > > > > >     c57e81d5e538 platform/x86: wmi: remove unnecessary=
 initializations
>> > > > > > > > > >     2ca4e461a298 platform/x86: wmi: Fix probe failure =
when failing to register WMI devices
>> > > > > > > > > >     f75e11f54d98 clk: qcom: config IPQ_APSS_6018 shoul=
d depend on QCOM_SMEM
>> > > > > > > > > >     d1175cf4bd2b clk: mediatek: clk-mt2701: Add check =
for mtk_alloc_clk_data
>> > > > > > > > > >     e964d21dc034 clk: mediatek: clk-mt7629: Add check =
for mtk_alloc_clk_data
>> > > > > > > > > >     c4070ada5d51 clk: mediatek: clk-mt7629-eth: Add ch=
eck for mtk_alloc_clk_data
>> > > > > > > > > >     3aefc6fcfbad clk: mediatek: clk-mt6797: Add check =
for mtk_alloc_clk_data
>> > > > > > > > > >     ca6d565a2319 clk: mediatek: clk-mt6779: Add check =
for mtk_alloc_clk_data
>> > > > > > > > > >     533ca5153ad6 clk: mediatek: clk-mt6765: Add check =
for mtk_alloc_clk_data
>> > > > > > > > > >     e531e4e73734 clk: npcm7xx: Fix incorrect kfree
>> > > > > > > > > >     761c2a690d8f clk: ti: fix double free in of_ti_div=
ider_clk_setup()
>> > > > > > > > > >     1c37faca0908 clk: ti: change ti_clk_register[_omap=
_hw]() API
>> > > > > > > > > >     28b72fba1e19 clk: ti: Update component clocks to u=
se ti_dt_clk_name()
>> > > > > > > > > >     c4bffed2e52b clk: ti: Update pll and clockdomain c=
locks to use ti_dt_clk_name()
>> > > > > > > > > >     9b5e9d8bf9a6 clk: ti: Add ti_dt_clk_name() helper =
to use clock-output-names
>> > > > > > > > > >     f45fff806ebb clk: keystone: pll: fix a couple NULL=
 vs IS_ERR() checks
>> > > > > > > > > >     7ff8ca9beefb spi: nxp-fspi: use the correct iorema=
p function
>> > > > > > > > > >     26206c858dae clk: renesas: rzg2l: Fix computation =
formula
>> > > > > > > > > >     1966bf2a79e6 clk: renesas: rzg2l: Use FIELD_GET() =
for PLL register fields
>> > > > > > > > > >     7ece2efa87af clk: renesas: rzg2l: Simplify multipl=
ication/shift logic
>> > > > > > > > > >     e2239f716529 clk: imx: imx8qxp: Fix elcdif_pll clo=
ck
>> > > > > > > > > >     7d416973cd12 clk: imx: imx8mq: correct error handl=
ing path
>> > > > > > > > > >     608ebb098b79 clk: imx: Select MXC_CLK for CLK_IMX8=
QXP
>> > > > > > > > > >     8861b2925a84 clk: qcom: gcc-sm8150: Fix gcc_sdcc2_=
apps_clk_src
>> > > > > > > > > >     76e8f00f54a8 clk: qcom: mmcc-msm8998: Fix the SMMU=
 GDSC
>> > > > > > > > > >     56c4bb46a5a0 clk: qcom: mmcc-msm8998: Don't check =
halt bit on some branch clks
>> > > > > > > > > >     0881d24cf5ca clk: qcom: clk-rcg2: Fix clock rate o=
verflow for high parent frequencies
>> > > > > > > > > >     b64683f5d728 spi: tegra: Fix missing IRQ check in =
tegra_slink_probe()
>> > > > > > > > > >     b13e8b38be51 regmap: debugfs: Fix a erroneous chec=
k after snprintf()
>> > > > > > > > > >     8fafac407346 ipvlan: properly track tx_errors
>> > > > > > > > > >     3eedc19a9d0f net: add DEV_STATS_READ() helper
>> > > > > > > > > >     359bce81b841 ipv6: avoid atomic fragment on GSO pa=
ckets
>> > > > > > > > > >     6b413d52f6ab ACPI: sysfs: Fix create_pnp_modalias(=
) and create_of_modalias()
>> > > > > > > > > >     32aaa3b98789 wifi: iwlwifi: empty overflow queue d=
uring flush
>> > > > > > > > > >     0e3ad00be4e8 wifi: iwlwifi: pcie: synchronize IRQs=
 before NAPI
>> > > > > > > > > >     a8ebe549e0ce wifi: iwlwifi: call napi_synchronize(=
) before freeing rx/tx queues
>> > > > > > > > > >     627a3b3f5c80 iwlwifi: pcie: adjust to Bz completio=
n descriptor
>> > > > > > > > > >     0d91506a40ec tcp: fix cookie_init_timestamp() over=
flows
>> > > > > > > > > >     4f6e904ed4e3 chtls: fix tp->rcv_tstamp initializat=
ion
>> > > > > > > > > >     5d7bec7ae4db r8169: fix rare issue with broken rx =
after link-down on RTL8125
>> > > > > > > > > >     e143a3c82d33 r8169: use tp_to_dev instead of open =
code
>> > > > > > > > > >     3a8f4e58e1ee thermal: core: prevent potential stri=
ng overflow
>> > > > > > > > > >     bfd4ed4988aa netfilter: nf_tables: Drop pointless =
memset when dumping rules
>> > > > > > > > > >     80986257d2cd PM / devfreq: rockchip-dfi: Make pmu =
regmap mandatory
>> > > > > > > > > >     826120c9ba68 can: dev: can_put_echo_skb(): don't c=
rash kernel if can_priv::echo_skb is accessed out of bounds
>> > > > > > > > > >     28e9e015916e can: dev: can_restart(): fix race con=
dition between controller restart and netif_carrier_on()
>> > > > > > > > > >     ada4dc4788f1 can: dev: can_restart(): don't crash =
kernel if carrier is OK
>> > > > > > > > > >     d4eb4182a823 wifi: rtlwifi: fix EDCA limit set by =
BT coexistence
>> > > > > > > > > >     2027e74150ee tcp_metrics: do not create an entry f=
rom tcp_init_metrics()
>> > > > > > > > > >     3f7cb7c47ce0 tcp_metrics: properly set tp->snd_sst=
hresh in tcp_init_metrics()
>> > > > > > > > > >     ca7b6fa9e61a tcp_metrics: add missing barriers on =
delete
>> > > > > > > > > >     227709a0e47c wifi: mt76: mt7603: improve stuck bea=
con handling
>> > > > > > > > > >     eab5b0aa5065 mt76: pass original queue id from __m=
t76_tx_queue_skb to the driver
>> > > > > > > > > >     75336a762539 mt76: add support for overriding the =
device used for DMA mapping
>> > > > > > > > > >     77b2ab5cd1a4 mt76: dma: use kzalloc instead of dev=
m_kzalloc for txwi
>> > > > > > > > > >     064b32f18db1 wifi: mt76: mt7603: rework/fix rx pse=
 hang check
>> > > > > > > > > >     1afbb9ececd3 wifi: rtw88: debug: Fix the NULL vs I=
S_ERR() bug for debugfs_create_file()
>> > > > > > > > > >     ebcbf5f5e047 net: spider_net: Use size_add() in ca=
ll to struct_size()
>> > > > > > > > > >     56e7424c6efc tipc: Use size_add() in calls to stru=
ct_size()
>> > > > > > > > > >     3e51efcb2909 mlxsw: Use size_mul() in call to stru=
ct_size()
>> > > > > > > > > >     dc3fef310732 gve: Use size_add() in call to struct=
_size()
>> > > > > > > > > >     70f032db8516 tcp: call tcp_try_undo_recovery when =
an RTOd TFO SYNACK is ACKed
>> > > > > > > > > >     a2d540c74549 udp: add missing WRITE_ONCE() around =
up->encap_rcv
>> > > > > > > > > >     8f7eef3a13df selftests/bpf: Correct map_fd to data=
_fd in tailcalls
>> > > > > > > > > >     3eefb2fbf4ec selftests/bpf: Test tail call countin=
g with bpf2bpf and data on stack
>> > > > > > > > > >     ab91992ec4d4 i40e: fix potential memory leaks in i=
40e_remove()
>> > > > > > > > > >     702742373650 genirq/matrix: Exclude managed interr=
upts in irq_matrix_allocated()
>> > > > > > > > > >     379b120e4f27 pstore/platform: Add check for kstrdu=
p
>> > > > > > > > > >     81b8638e4ef4 x86/boot: Fix incorrect startup_gdt_d=
escr.size
>> > > > > > > > > >     c7e8c7452e5a x86/sev-es: Allow copy_from_kernel_no=
fault() in earlier boot
>> > > > > > > > > >     0b5da8ce0f18 x86: Share definition of __is_canonic=
al_address()
>> > > > > > > > > >     90b263db856d futex: Don't include process MM in fu=
tex key on no-MMU
>> > > > > > > > > >     f0d6e5841172 x86/srso: Fix SBPB enablement for (po=
ssible) future fixed HW
>> > > > > > > > > >     565f9337b68e writeback, cgroup: switch inodes with=
 dirty timestamps to release dying cgwbs
>> > > > > > > > > >     2bb46b20825d vfs: fix readahead(2) on block device=
s
>> > > > > > > > > >     20195f87db19 sched: Fix stop_one_cpu_nowait() vs h=
otplug
>> > > > > > > > > >     13cde955e52e sched/uclamp: Ignore (util =3D=3D 0) =
optimization in feec() when p_util_max =3D 0
>> > > > > > > > > >     cc6198ff20c0 iov_iter, x86: Be consistent about th=
e __user tag on copy_mc_to_user()
>> > > > > > > > > >     80529b4968a8 Linux 5.15.138
>> > > > > > > > > >     3d8344a7c4a3 ALSA: hda: intel-dsp-config: Fix JSL =
Chromebook quirk detection
>> > > > > > > > > >     f049c0c0037d misc: pci_endpoint_test: Add deviceID=
 for J721S2 PCIe EP device support
>> > > > > > > > > >     28b8ad8ccecd tty: 8250: Add Brainboxes Oxford Semi=
conductor-based quirks
>> > > > > > > > > >     44c4dfac3f02 tty: 8250: Add support for Intashield=
 IX cards
>> > > > > > > > > >     d541ccb34de2 tty: 8250: Add support for additional=
 Brainboxes PX cards
>> > > > > > > > > >     60debc01fcbb tty: 8250: Fix up PX-803/PX-857
>> > > > > > > > > >     1f5649aed527 tty: 8250: Fix port count of PX-257
>> > > > > > > > > >     3fe3cc63c730 tty: 8250: Add support for Intashield=
 IS-100
>> > > > > > > > > >     a5b6390fd609 tty: 8250: Add support for Brainboxes=
 UP cards
>> > > > > > > > > >     738fe41b6443 tty: 8250: Add support for additional=
 Brainboxes UC cards
>> > > > > > > > > >     ff6059c3d234 tty: 8250: Remove UC-257 and UC-431
>> > > > > > > > > >     81a4dd5e6c78 tty: n_gsm: fix race condition in sta=
tus line change on dead connections
>> > > > > > > > > >     e25197747f0e usb: raw-gadget: properly handle inte=
rrupted requests
>> > > > > > > > > >     e5f53a68a596 usb: typec: tcpm: Fix NULL pointer de=
reference in tcpm_pd_svdm()
>> > > > > > > > > >     7c4855b22a3f usb: storage: set 1.50 as the lower b=
cdDevice for older "Super Top" compatibility
>> > > > > > > > > >     c48aae53850c PCI: Prevent xHCI driver from claimin=
g AMD VanGogh USB3 DRD device
>> > > > > > > > > >     6628c3627c02 drm/amd: Disable ASPM for VI w/ all I=
ntel systems
>> > > > > > > > > >     b6c3c7786e24 drm/amd: Move helper for dynamic spee=
d switch check out of smu13
>> > > > > > > > > >     9015169f00ee can: isotp: isotp_sendmsg(): fix TX s=
tate detection and wait behavior
>> > > > > > > > > >     d72ff6478323 can: isotp: isotp_bind(): do not vali=
date unused address information
>> > > > > > > > > >     e163ad6a8639 can: isotp: add local echo tx process=
ing and tx without FC
>> > > > > > > > > >     b4e78ea26638 can: isotp: handle wait_event_interru=
ptible() return values
>> > > > > > > > > >     2fc6f337257f can: isotp: check CAN address family =
in isotp_bind()
>> > > > > > > > > >     f8c3bd211cf3 can: isotp: isotp_bind(): return -EIN=
VAL on incorrect CAN ID formatting
>> > > > > > > > > >     615c4dd64050 can: isotp: set max PDU size to 64 kB=
yte
>> > > > > > > > > >     6627b96851f1 powerpc/mm: Fix boot crash with FLATM=
EM
>> > > > > > > > > >     f0f998648887 r8152: Check for unplug in r8153b_ups=
_en() / r8153c_ups_en()
>> > > > > > > > > >     78c939a88729 r8152: Check for unplug in rtl_phy_pa=
tch_request()
>> > > > > > > > > >     51cc28ce742e net: chelsio: cxgb4: add an error cod=
e check in t4_load_phy_fw
>> > > > > > > > > >     bbc926199321 platform/mellanox: mlxbf-tmfifo: Fix =
a warning message
>> > > > > > > > > >     db4416ea3a5d scsi: mpt3sas: Fix in error path
>> > > > > > > > > >     d48b2e8189d5 fbdev: uvesafb: Call cn_del_callback(=
) at the end of uvesafb_exit()
>> > > > > > > > > >     e39440c3268b drm/ttm: Reorder sys manager cleanup =
step
>> > > > > > > > > >     aade33d3d9bb ASoC: rt5650: fix the wrong result of=
 key button
>> > > > > > > > > >     fa32e21c0568 netfilter: nfnetlink_log: silence bog=
us compiler warning
>> > > > > > > > > >     dfcbb983eb6e spi: npcm-fiu: Fix UMA reads when dum=
my.nbytes =3D=3D 0
>> > > > > > > > > >     64ae128b095d fs/ntfs3: Avoid possible memory leak
>> > > > > > > > > >     27a0bed1285e fs/ntfs3: Fix directory element type =
detection
>> > > > > > > > > >     94524980ee75 fs/ntfs3: Fix NULL pointer dereferenc=
e on error in attr_allocate_frame()
>> > > > > > > > > >     2de328398b50 fs/ntfs3: Fix possible NULL-ptr-deref=
 in ni_readpage_cmpr()
>> > > > > > > > > >     962a3d3d731c fs/ntfs3: Use kvmalloc instead of kma=
lloc(... __GFP_NOWARN)
>> > > > > > > > > >     393966e79ba1 fs/ntfs3: Write immediately updated n=
tfs state
>> > > > > > > > > >     59e629fc7157 fs/ntfs3: Add ckeck in ni_update_pare=
nt()
>> > > > > > > > > >     738a3adc7c8b fbdev: atyfb: only use ioremap_uc() o=
n i386 and ia64
>> > > > > > > > > >     afef8af919d2 Input: synaptics-rmi4 - handle reset =
delay when using SMBus trsnsport
>> > > > > > > > > >     abc62fc06d4a powerpc/85xx: Fix math emulation exce=
ption
>> > > > > > > > > >     4bdde4dca00e dmaengine: ste_dma40: Fix PM disable =
depth imbalance in d40_probe
>> > > > > > > > > >     39d2c10367a8 irqchip/stm32-exti: add missing DT IR=
Q flag translation
>> > > > > > > > > >     c57aef9075e0 irqchip/riscv-intc: Mark all INTC nod=
es as initialized
>> > > > > > > > > >     eb99b6e204cd net: sched: cls_u32: Fix allocation s=
ize in u32_init()
>> > > > > > > > > >     5e78ebe7c1db ASoC: simple-card: fixup asoc_simple_=
probe() error handling
>> > > > > > > > > >     65fd21aa3805 x86: Fix .brk attribute in linker scr=
ipt
>> > > > > > > > > >     d4c8bf5635c4 rpmsg: Fix possible refcount leak in =
rpmsg_register_device_override()
>> > > > > > > > > >     a82e0fda8a2f rpmsg: glink: Release driver_override
>> > > > > > > > > >     bfd4a664ddfb rpmsg: Fix calling device_lock() on n=
on-initialized device
>> > > > > > > > > >     2e76b4f6218c rpmsg: Fix kfree() of static memory o=
n setting driver_override
>> > > > > > > > > >     5c0da71871d3 rpmsg: Constify local variable in fie=
ld store macro
>> > > > > > > > > >     389190b25472 driver: platform: Add helper for safe=
r setting of driver_override
>> > > > > > > > > >     37ffa428d58c objtool/x86: add missing embedded_ins=
n check
>> > > > > > > > > >     f031e15d0bb8 ext4: avoid overlapping preallocation=
s due to overflow
>> > > > > > > > > >     f2c3a3aa6f11 ext4: fix BUG in ext4_mb_new_inode_pa=
() due to overflow
>> > > > > > > > > >     7a992726f727 ext4: add two helper functions extent=
_logical_end() and pa_logical_end()
>> > > > > > > > > >     9e78e7709f7d x86/mm: Fix RESERVE_BRK() for older b=
inutils
>> > > > > > > > > >     d3201c718058 x86/mm: Simplify RESERVE_BRK()
>> > > > > > > > > >     897b56acf126 x86/i8259: Skip probing when ACPI/MAD=
T advertises PCAT compatibility
>> > > > > > > > > >     77db87c4a4ed gve: Fix GFP flags when allocing page=
s
>> > > > > > > > > >     8b424bdf6c9c iio: afe: rescale: Accept only offset=
 channels
>> > > > > > > > > >     c1eeb494f684 iio: afe: rescale: add offset support
>> > > > > > > > > >     7c76b7db5521 iio: afe: rescale: expose scale proce=
ssing function
>> > > > > > > > > >     c60671502dc2 iio: afe: rescale: reorder includes
>> > > > > > > > > >     27dd09f5ec7f clk: Sanitize possible_parent_show to=
 Handle Return Value of of_clk_get_parent_name
>> > > > > > > > > >     c27ca4aebbee sparc32: fix a braino in fault handli=
ng in csum_and_copy_..._user()
>> > > > > > > > > >     21b07a2e6095 perf/core: Fix potential NULL deref
>> > > > > > > > > >     6efd498009b9 nvmem: imx: correct nregs for i.MX6UL
>> > > > > > > > > >     0c2948118c34 nvmem: imx: correct nregs for i.MX6SL=
L
>> > > > > > > > > >     6e22bf6f00d5 nvmem: imx: correct nregs for i.MX6UL=
L
>> > > > > > > > > >     e0f95b831b4a misc: fastrpc: Clean buffers on remot=
e invocation failures
>> > > > > > > > > >     c4957f00f9e2 tracing/kprobes: Fix the description =
of variable length arguments
>> > > > > > > > > >     cdc57093b470 i2c: aspeed: Fix i2c bus hang in slav=
e read
>> > > > > > > > > >     e97d374a2506 i2c: stm32f7: Fix PEC handling in cas=
e of SMBUS transfers
>> > > > > > > > > >     2766a872103b i2c: muxes: i2c-demux-pinctrl: Use of=
_get_i2c_adapter_by_node()
>> > > > > > > > > >     48b58f7469e5 i2c: muxes: i2c-mux-gpmux: Use of_get=
_i2c_adapter_by_node()
>> > > > > > > > > >     cb65e692765b i2c: muxes: i2c-mux-pinctrl: Use of_g=
et_i2c_adapter_by_node()
>> > > > > > > > > >     eace761f35a1 iio: adc: xilinx-xadc: Correct temper=
ature offset/scale for UltraScale
>> > > > > > > > > >     70322a446ef2 iio: adc: xilinx-xadc: Don't clobber =
preset voltage/temperature thresholds
>> > > > > > > > > >     3c1312b5d49a iio: exynos-adc: request second inter=
upt only when touchscreen mode is used
>> > > > > > > > > >     4e14f2d5885f kasan: print the original fault addr =
when access invalid shadow
>> > > > > > > > > >     bdfa4fa7588d i40e: Fix wrong check for I40E_TXR_FL=
AGS_WB_ON_ITR
>> > > > > > > > > >     d5c175f4cea6 gtp: fix fragmentation needed check w=
ith gso
>> > > > > > > > > >     c0dad0c0924c gtp: uapi: fix GTPA_MAX
>> > > > > > > > > >     852fb4ce426d tcp: fix wrong RTO timeout when recei=
ved SACK reneging
>> > > > > > > > > >     83cfa3b51a78 r8152: Release firmware if we have an=
 error in probe
>> > > > > > > > > >     e0f9231ccd6c r8152: Cancel hw_phy_work if we have =
an error in probe
>> > > > > > > > > >     ff42b0a55659 r8152: Run the unload routine if we h=
ave errors during probe
>> > > > > > > > > >     6fa3b9f9478e r8152: Increase USB control msg timeo=
ut to 5000ms as per spec
>> > > > > > > > > >     76873f2eadc0 net: usb: smsc95xx: Fix uninit-value =
access in smsc95xx_read_reg
>> > > > > > > > > >     6afd112c3f95 net: ieee802154: adf7242: Fix some po=
tential buffer overflow in adf7242_stats_show()
>> > > > > > > > > >     46cd35e4e774 igc: Fix ambiguity in the ethtool adv=
ertising
>> > > > > > > > > >     49529413eaed neighbour: fix various data-races
>> > > > > > > > > >     667554946360 igb: Fix potential memory leak in igb=
_add_ethtool_nfc_entry
>> > > > > > > > > >     263421905346 treewide: Spelling fix in comment
>> > > > > > > > > >     bc0c4bc119d2 i40e: Fix I40E_FLAG_VF_VLAN_PRUNING v=
alue
>> > > > > > > > > >     c532c5df01ad r8169: fix the KCSAN reported data ra=
ce in rtl_rx while reading desc->opts1
>> > > > > > > > > >     6afb294c88c6 r8169: fix the KCSAN reported data-ra=
ce in rtl_tx while reading TxDescArray[entry].opts1
>> > > > > > > > > >     9d7b3838428c r8169: fix the KCSAN reported data-ra=
ce in rtl_tx() while reading tp->cur_tx
>> > > > > > > > > >     04dbfa4122e0 firmware/imx-dsp: Fix use_after_free =
in imx_dsp_setup_channels()
>> > > > > > > > > >     0d587b86cd0d drm/dp_mst: Fix NULL deref in get_mst=
_branch_device_by_guid_helper()
>> > > > > > > > > >     8860f0175e51 vsock/virtio: initialize the_virtio_v=
sock before using VQs
>> > > > > > > > > >     762c251c7f5c vsock/virtio: add support for device =
suspend/resume
>> > > > > > > > > >     1e02df6f6907 vsock/virtio: factor our the code to =
initialize and delete VQs
>> > > > > > > > > >     15a8cac3c250 drm/i915/pmu: Check if pmu is closed =
before stopping event
>> > > > > > > > > >     43bd431a5dd9 nfsd: lock_rename() needs both direct=
ories to live on the same fs
>> > > > > > > > > >     556b68d9b95f mm/migrate: fix do_pages_move for com=
pat pointers
>> > > > > > > > > >     c4071c6114de mm/page_alloc: correct start page whe=
n guard page debug is enabled
>> > > > > > > > > >     3a6cee2bfb53 vhost: Allow null msg.size on VHOST_I=
OTLB_INVALIDATE
>> > > > > > > > > >     fbc9a8718f31 virtio-mmio: fix memory leak of vm_de=
v
>> > > > > > > > > >     862a356bc986 virtio_balloon: Fix endless deflation=
 and inflation on arm64
>> > > > > > > > > >     41bb770e42bc mcb-lpc: Reallocate memory region to =
avoid memory overlapping
>> > > > > > > > > >     f2ac8b2643dd mcb: Return actual parsed size when r=
eading chameleon table
>> > > > > > > > > >     90918ef995b5 mptcp: more conservative check for ze=
ro probes
>> > > > > > > > > >     fd2b2dab6f5b tcp: cleanup tcp_remove_empty_skb() u=
se
>> > > > > > > > > >     68342755b9b2 tcp: remove dead code from tcp_sendms=
g_locked()
>> > > > > > > > > >     0f482ad7b1a5 pinctrl: qcom: lpass-lpi: fix concurr=
ent register updates
>> > > > > > > > > >     51b054f6fe01 ASoC: codecs: wcd938x: fix runtime PM=
 imbalance on remove
>> > > > > > > > > >     cb34f4e79e54 ASoC: codecs: wcd938x: fix resource l=
eaks on bind errors
>> > > > > > > > > >     12952a23a5da Linux 5.15.137
>> > > > > > > > > >     dff33880d40a xfrm6: fix inet6_dev refcount underfl=
ow problem
>> > > > > > > > > >     5a9d05a4f1c3 Bluetooth: hci_sock: Correctly bounds=
 check and pad HCI_MON_NEW_INDEX name
>> > > > > > > > > >     a6df96ee0b45 Bluetooth: hci_sock: fix slab oob rea=
d in create_monitor_event
>> > > > > > > > > >     c08d609fb2b6 phy: mapphone-mdm6600: Fix pinctrl_pm=
 handling for sleep pins
>> > > > > > > > > >     e1b030b101f6 phy: mapphone-mdm6600: Fix runtime PM=
 for remove
>> > > > > > > > > >     59f1095ab58e phy: mapphone-mdm6600: Fix runtime di=
sable on probe
>> > > > > > > > > >     b618062c0b13 serial: 8250: omap: Move uart_write()=
 inside PM section
>> > > > > > > > > >     67f29cd2f851 ASoC: pxa: fix a memory leak in probe=
()
>> > > > > > > > > >     76d04c339508 gpio: vf610: set value before the dir=
ection to avoid a glitch
>> > > > > > > > > >     4b129e3964b3 platform/x86: asus-wmi: Map 0x2a code=
, Ignore 0x2b and 0x2c events
>> > > > > > > > > >     e1a058cc2467 platform/x86: asus-wmi: Change ASUS_W=
MI_BRN_DOWN code from 0x20 to 0x2e
>> > > > > > > > > >     c6bbe51dcdf3 platform/surface: platform_profile: P=
ropagate error if profile registration fails
>> > > > > > > > > >     a73c8d716938 s390/cio: fix a memleak in css_alloc_=
subchannel
>> > > > > > > > > >     c8b6c2df1e7d selftests/ftrace: Add new test case w=
hich checks non unique symbol
>> > > > > > > > > >     3ad81e6affcb s390/pci: fix iommu bitmap allocation
>> > > > > > > > > >     71d224acc4d1 perf: Disallow mis-matched inherited =
group reads
>> > > > > > > > > >     5aa89a11a2a6 USB: serial: option: add Fibocom to D=
ELL custom modem FM101R-GL
>> > > > > > > > > >     8c376d863618 USB: serial: option: add entry for Si=
erra EM9191 with new firmware
>> > > > > > > > > >     483221216176 USB: serial: option: add Telit LE910C=
4-WWX 0x1035 composition
>> > > > > > > > > >     e750fb71dc6a nvme-rdma: do not try to stop unalloc=
ated queues
>> > > > > > > > > >     a9fd6d44abbc nvme-pci: add BOGUS_NID for Intel 0a5=
4 device
>> > > > > > > > > >     071382bda1da ACPI: irq: Fix incorrect return value=
 in acpi_register_gsi()
>> > > > > > > > > >     431a5010bce2 NFSv4.1: fixup use EXCHGID4_FLAG_USE_=
PNFS_DS for DS server
>> > > > > > > > > >     5762e72ef1b0 pNFS: Fix a hang in nfs4_evict_inode(=
)
>> > > > > > > > > >     5a3abee2eee9 Revert "pinctrl: avoid unsafe code pa=
ttern in find_pinctrl()"
>> > > > > > > > > >     24959825377f mmc: core: Capture correct oemid-bits=
 for eMMC cards
>> > > > > > > > > >     8041e7b7e7e9 mmc: core: sdio: hold retuning if sdi=
o in 1-bit mode
>> > > > > > > > > >     262029c0c58c mmc: mtk-sd: Use readl_poll_timeout_a=
tomic in msdc_reset_hw
>> > > > > > > > > >     3e363db1c13a mtd: physmap-core: Restore map_rom fa=
llback
>> > > > > > > > > >     71823463b1b2 mtd: spinand: mic

