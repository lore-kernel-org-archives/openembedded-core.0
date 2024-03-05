Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78133C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 19:24:30 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.1914.1709666661925005370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 11:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c5PVF/zM;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.180, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6094a87c4a7so57948277b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 11:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709666661; x=1710271461; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3BtlrVMJGMQxgdSmrteJmoFmMXzuI8609DrdiXyGkUU=;
        b=c5PVF/zMEaGLpwJBXqg/i/3yj4Y0od6pJGt/G62pyJqUPqxA19m3LHPDGba7ZMPJGr
         +YpJYwFU1AQnkVCn9OG4OkUGUu91ny21Cp9a0KjeC/iuzVvw3cHI7ETINPXkm1u3Cb+t
         il6poTFP0HaQsH+eH3RPVI0dMckjYcUyi0tLjUmzzxAnkvdTCOW6MPj+hsM/WX5dvemk
         rX+V/Zzj/rD8SUyyCSdJs8MZ214fcfoDGn2685RpOPcxt/7DwndgzVUROyCchA1zsuvc
         pwU3Oq331+S2oTrXbrHOQ10XSybRnVXJ0oh/YOwq+G+Pd+fAVo9NPoLTnSXCTT1oNRlO
         ti+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709666661; x=1710271461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BtlrVMJGMQxgdSmrteJmoFmMXzuI8609DrdiXyGkUU=;
        b=myh0OeGBUL7bm2/9PtpytgAN7vM5r2TMHWOEb2dOXGEh3EtPuUrMedrEZwjmgVHiq9
         lTLn7h4RupDI1+WYK758ifXbZ+KgYIx6Fq4h/7cTXerj+2HCmtCHGbqTY/1XyiKrznw4
         iy00GED3ndO7ndaqsAiI4sPAehq9h46167ecedjsId5nLy3V4tk2T3dap+61En16/2a5
         lM1EcZ7VbC6ua9Rf5rNR7z328k0q13CtZLxduTalM4cFJwUZxPRmXEed+9clH0xLS9Rw
         j0p77o17KWfmfmiEN7TzrnWvtbLER93OC5OeUfJdpk1FE+yXRQA0hfoZcQYuL0jh4zcv
         0jew==
X-Gm-Message-State: AOJu0Yyfm7SJufi56+Nr6Drr0eeOy78CzFDepgJuT8JWJUCeXfkWB/t7
	7qRLcCoUNa4s5NpVSpin6WZZ6ulpkev3qApdTG67QytPrVRL9D9gzOSvcwNk6UImafwqzCkb7YB
	jq/X5Ud20SC9exkiJIObVzi109iLsLtQX4f866zusfuirLgr3c08=
X-Google-Smtp-Source: AGHT+IFQNE3zvzo7bCfn18Da27h7caozm5oqY4VtBoYPU+mvHS2K80r6RxdQA47HzSOofSRgLk/O/JuRMLfSiC2xo7Y=
X-Received: by 2002:a0d:cb10:0:b0:608:922:4001 with SMTP id
 n16-20020a0dcb10000000b0060809224001mr11670288ywd.5.1709666659237; Tue, 05
 Mar 2024 11:24:19 -0800 (PST)
MIME-Version: 1.0
References: <20231205044036.4163615-1-bruce.ashfield@gmail.com>
 <20231205044036.4163615-5-bruce.ashfield@gmail.com> <CAOSpxdZU+CoRTo=Xz+C3dk44ubHLSa7pis7sa4CyVMGJnY1_EA@mail.gmail.com>
 <CADkTA4PT_9LLUBeBwqVqrZCzanApQCtM4fx2shQhNsGpq7C7Nw@mail.gmail.com>
In-Reply-To: <CADkTA4PT_9LLUBeBwqVqrZCzanApQCtM4fx2shQhNsGpq7C7Nw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 5 Mar 2024 09:24:07 -1000
Message-ID: <CAOSpxdaXbvBq8cz2twqKLtB_zK8d8bKNGaOffTQx6gQFdPxupg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 4/4] linux-yocto/5.15: update to v5.15.141
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/mixed; boundary="000000000000e902210612eec929"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 19:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196645

--000000000000e902210612eec929
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

In looking at the parted ptest failure a little more closely I see
that I first discovered the issue back in December when you first sent
the 5.15.141 version bump.  You recommended back then that I drop the
update for the time being and see if one of the subsequent bumps fixed
it.

I completely forgot about that!  But I guess we see now that
subsequent version bumps haven't fixed it :-(

I've attached the log for the parted ptest in the hopes that it might
trigger a theory from you on what causes the problem.

I've also attached the source code for the 3 failing tests.

Thanks!

Steve

On Thu, Dec 7, 2023 at 9:11=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmail=
.com> wrote:
>
> I unfortunately have no idea how to run that test manually, so I'll
> continue to stack -stable updates onto that kernel and if we are
> lucky, it'll get resolved that way.
>
> Interesting that it only shows up in 5.15 though, since it really
> should hit all versions equally since anything "new" in 5.15 is a
> backport.
>
> Bruce
>
> On Thu, Dec 7, 2023 at 1:08=E2=80=AFPM Steve Sakoman <steve@sakoman.com> =
wrote:
> >
> > Hi Bruce,
> >
> > The 5.10 version bumps look fine in testing, but sadly this 5.15
> > version bump breaks qemux86-64-ptest:
> >
> > AssertionError: Failed ptests:
> > {'parted': ['t1104-remove-and-add-partition.sh',
> >             't8000-loop.sh',
> >             't8001-loop-blkpg.sh']}
> >
> > Failure is reproducible 100% of the time, so there is that ...
> >
> > I'll drop this patch for now.
> >
> > Steve
> >
> > On Mon, Dec 4, 2023 at 6:40=E2=80=AFPM <bruce.ashfield@gmail.com> wrote=
:
> > >
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Updating  to the latest korg -stable release that comprises
> > > the following commits:
> > >
> > >     9b91d36ba301 Linux 5.15.141
> > >     313a34d1c0ee io_uring: fix off-by one bvec index
> > >     49ae2e4e8ed3 USB: dwc3: qcom: fix wakeup after probe deferral
> > >     eb17fb4b160a USB: dwc3: qcom: fix software node leak on probe err=
ors
> > >     98f0e9b6276f usb: dwc3: set the dma max_seg_size
> > >     1a3dcb1d811d usb: dwc3: Fix default mode initialization
> > >     a22702a81844 USB: dwc2: write HCINT with INTMASK applied
> > >     1134fde92088 usb: typec: tcpm: Skip hard reset when in error reco=
very
> > >     64830d041515 USB: serial: option: don't claim interface 4 for ZTE=
 MF290
> > >     9611cbc6a132 USB: serial: option: fix FM101R-GL defines
> > >     a8d80b1fbacf USB: serial: option: add Fibocom L7xx modules
> > >     de8c6fce8d09 usb: cdnsp: Fix deadlock issue during using NCM gadg=
et
> > >     dd0cc4b69f7d bcache: fixup lock c->root error
> > >     a912742d8411 bcache: fixup init dirty data errors
> > >     137660f84462 bcache: prevent potential division by zero error
> > >     f7077ce8d97b bcache: check return value from btree_node_alloc_rep=
lacement()
> > >     1eed01092101 dm-delay: fix a race between delay_presuspend and de=
lay_bio
> > >     d181a7a1d55d hv_netvsc: Mark VF as slave before exposing it to us=
er-mode
> > >     97683466e24c hv_netvsc: Fix race of register_netdevice_notifier a=
nd VF register
> > >     3841921018a2 USB: serial: option: add Luat Air72*U series product=
s
> > >     6062c527d040 s390/dasd: protect device queue against concurrent a=
ccess
> > >     35b5d86e43ec io_uring/fs: consider link->flags when getting path =
for LINKAT
> > >     2bb75a2c3490 bcache: fixup multi-threaded bch_sectors_dirty_init(=
) wake-up race
> > >     6f09318fd90a md: fix bi_status reporting in md_end_clone_io
> > >     72ecb9753cbe bcache: replace a mistaken IS_ERR() by IS_ERR_OR_NUL=
L() in btree_gc_coalesce()
> > >     e09ba90f1ad0 swiotlb-xen: provide the "max_mapping_size" method
> > >     0f05021e937c ACPI: resource: Skip IRQ override on ASUS ExpertBook=
 B1402CVA
> > >     f95e9f7afe86 proc: sysctl: prevent aliased sysctls from getting p=
assed to init
> > >     3f3880fc011c ext4: make sure allocate pending entry not fail
> > >     e33eb4997585 ext4: fix slab-use-after-free in ext4_es_insert_exte=
nt()
> > >     859893f61906 ext4: using nofail preallocation in ext4_es_insert_e=
xtent()
> > >     048e7f38b31c ext4: using nofail preallocation in ext4_es_insert_d=
elayed_block()
> > >     580b9dd6ab0b ext4: using nofail preallocation in ext4_es_remove_e=
xtent()
> > >     66bc78a295b3 ext4: use pre-allocated es in __es_remove_extent()
> > >     b1995ba6269c ext4: use pre-allocated es in __es_insert_extent()
> > >     edec12712ae1 ext4: factor out __es_alloc_extent() and __es_free_e=
xtent()
> > >     e82d05cf5ccb ext4: add a new helper to check if es must be kept
> > >     612edd488872 media: qcom: camss: Fix csid-gen2 for test pattern g=
enerator
> > >     ceb5276d8c99 media: qcom: camss: Fix set CSI2_RX_CFG1_VC_MODE whe=
n VC is greater than 3
> > >     f001e6f62693 media: camss: sm8250: Virtual channels for CSID
> > >     9fb81ca7aa05 media: camss: Replace hard coded value with paramete=
r
> > >     8ef9b32f20ab MIPS: KVM: Fix a build warning about variable set bu=
t not used
> > >     6ddaca6b20f7 lockdep: Fix block chain corruption
> > >     61747778a88b USB: dwc3: qcom: fix ACPI platform device leak
> > >     027472889970 USB: dwc3: qcom: fix resource leaks on probe deferra=
l
> > >     e26c6febac43 nvmet: nul-terminate the NQNs passed in the connect =
command
> > >     b5d50c6a609d afs: Fix file locking on R/O volumes to operate in l=
ocal mode
> > >     84ebfbed3ae0 afs: Return ENOENT if no cell DNS record can be foun=
d
> > >     6aeac88a45de net: axienet: Fix check for partial TX checksum
> > >     293acba84108 amd-xgbe: propagate the correct speed and duplex sta=
tus
> > >     b3874cc25a70 amd-xgbe: handle the corner-case during tx completio=
n
> > >     e949dbc28cd5 amd-xgbe: handle corner-case during sfp hotplug
> > >     01a8b94726b1 octeontx2-pf: Fix ntuple rule creation to direct pac=
ket to VF with higher Rx queue than its PF
> > >     fcc4a03ad3b1 arm/xen: fix xen_vcpu_info allocation alignment
> > >     90072af9efe8 net/smc: avoid data corruption caused by decline
> > >     66c023469b3e net: usb: ax88179_178a: fix failed operations during=
 ax88179_reset
> > >     ba81c5228ef8 ipv4: Correct/silence an endian warning in __ip_do_r=
edirect
> > >     364406d4c114 HID: fix HID device resource race between HID core a=
nd debugging support
> > >     52badc06b119 HID: core: store the unique system identifier in hid=
_device
> > >     221be624a55d drm/rockchip: vop: Fix color for RGB888/BGR888 forma=
t on VOP full
> > >     b0c835fd7d89 ata: pata_isapnp: Add missing error check for devm_i=
oport_map()
> > >     9754a498aa5b octeontx2-pf: Fix memory leak during interface down
> > >     be41c0c4a632 wireguard: use DEV_STATS_INC()
> > >     f163a6d17a95 drm/panel: simple: Fix Innolux G101ICE-L01 timings
> > >     608de3a587eb drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
> > >     18bd108a13cb drm/panel: auo,b101uan08.3: Fine tune the panel powe=
r sequence
> > >     9fe5718d3f09 drm/panel: boe-tv101wum-nl6: Fine tune the panel pow=
er sequence
> > >     c8a49336e1de afs: Make error on cell lookup failure consistent wi=
th OpenAFS
> > >     ac239fccf5a5 afs: Fix afs_server_list to be cleaned up with RCU
> > >     a78d278e01b1 Linux 5.15.140
> > >     947c9e12ddd6 driver core: Release all resources during unbind bef=
ore updating device links
> > >     5a434d5c3823 Input: xpad - add VID for Turtle Beach controllers
> > >     cbc7c29dff0f tracing: Have trace_event_file have ref counters
> > >     1dcf90c9fa01 powerpc/powernv: Fix fortify source warnings in opal=
-prd.c
> > >     3d7912710e5e io_uring/fdinfo: lock SQ thread while retrieving thr=
ead cpu/pid
> > >     595b051c83a1 drm/amd/display: Change the DMCUB mailbox memory loc=
ation from FB to inbox
> > >     a2a6e97c4b33 drm/amdgpu: fix error handling in amdgpu_bo_list_get=
()
> > >     e380992c479b drm/amdgpu: don't use ATRM for external devices
> > >     4ff985b8810c drm/i915: Fix potential spectre vulnerability
> > >     ea0c4d5ec57f drm/amd/pm: Handle non-terminated overdrive commands=
.
> > >     9ce842d7762a ext4: add missed brelse in update_backups
> > >     ce19c20064b6 ext4: remove gdb backup copy for meta bg in setup_ne=
w_flex_group_blocks
> > >     ac45d8e34bed ext4: correct the start block of counting reserved c=
lusters
> > >     8f9842c4b925 ext4: correct return value of ext4_convert_meta_bg
> > >     8798d3b2722d ext4: correct offset of gdb backup in non meta_bg gr=
oup to update_backups
> > >     8a3bb38bfdaf ext4: apply umask if ACL support is disabled
> > >     d5c380149b96 Revert "net: r8169: Disable multicast filter for RTL=
8168H and RTL8107E"
> > >     6ad3d8594d5e media: qcom: camss: Fix missing vfe_lite clocks chec=
k
> > >     e0376cf06950 media: qcom: camss: Fix VFE-17x vfe_disable_output()
> > >     8f733387d17f media: qcom: camss: Fix vfe_get() error jump
> > >     841fc648fbb5 media: qcom: camss: Fix pm_domain_on sequence in pro=
be
> > >     4c9c43f79a12 mmc: sdhci-pci-gli: GL9750: Mask the replay timer ti=
meout of AER
> > >     72bf271c5a77 r8169: fix network lost after resume on DASH systems
> > >     468e3ebf4786 mm: kmem: drop __GFP_NOFAIL when allocating objcg ve=
ctors
> > >     0387978fda07 mmc: sdhci-pci-gli: A workaround to allow GL9750 to =
enter ASPM L1.2
> > >     070b3ccb9b8b riscv: kprobes: allow writing to x0
> > >     cd0e9f475a46 nfsd: fix file memleak on client_opens_release
> > >     114c9d732cf9 media: ccs: Correctly initialise try compose rectang=
le
> > >     6c8aeeb2c549 media: venus: hfi: add checks to handle capabilities=
 from firmware
> > >     cdeb0a4cf327 media: venus: hfi: fix the check to handle session b=
uffer requirement
> > >     7d62570f75fe media: venus: hfi_parser: Add check to keep the numb=
er of codecs within range
> > >     d0d831e7d68d media: sharp: fix sharp encoding
> > >     6003733c8f95 media: lirc: drop trailing space from scancode trans=
mit
> > >     e4088d7d8f11 f2fs: avoid format-overflow warning
> > >     12055238d046 i2c: i801: fix potential race in i801_block_transact=
ion_byte_by_byte
> > >     336e6db5c120 net: phylink: initialize carrier state at creation
> > >     d8cb287d31cb net: dsa: lan9303: consequently nested-lock physical=
 MDIO
> > >     656262cb0f95 net: ethtool: Fix documentation of ethtool_sprintf()
> > >     acca20cc16f3 s390/ap: fix AP bus crash on early config change cal=
lback invocation
> > >     019b7d42a416 i2c: designware: Disable TX_EMPTY irq while waiting =
for block length byte
> > >     c6e89348fd58 sbsa_gwdt: Calculate timeout with 64-bit math
> > >     132670ae9ffb lsm: fix default return value for inode_getsecctx
> > >     223196b50605 lsm: fix default return value for vm_enough_memory
> > >     06d320ca170b Revert "i2c: pxa: move to generic GPIO recovery"
> > >     ddec3d04f874 Revert ncsi: Propagate carrier gain/loss events to t=
he NCSI controller
> > >     ad0b74d0f331 powerpc/pseries/ddw: simplify enable_ddw()
> > >     b3e993de400e arm64: dts: qcom: ipq6018: Fix tcsr_mutex register s=
ize
> > >     b99ac20612ca arm64: dts: qcom: ipq6018: switch TCSR mutex to MMIO
> > >     aaf0a07d6088 ksmbd: fix slab out of bounds write in smb_inherit_d=
acl()
> > >     1c701423bb03 Bluetooth: btusb: Add 0bda:b85b for Fn-Link RTL8852B=
E
> > >     36a573b32550 Bluetooth: btusb: Add RTW8852BE device 13d3:3570 to =
device tables
> > >     c4976160a0a4 bluetooth: Add device 13d3:3571 to device tables
> > >     603e77e9e8c0 bluetooth: Add device 0bda:887b to device tables
> > >     e9bb966c50a7 Bluetooth: btusb: Add Realtek RTL8852BE support ID 0=
x0cb8:0xc559
> > >     cf642ee641ce cpufreq: stats: Fix buffer overflow detection in tra=
ns_stats()
> > >     63e09cdfe948 regmap: Ensure range selector registers are updated =
after cache sync
> > >     0c49e74e95bf tty: serial: meson: fix hard LOCKUP on crtscts mode
> > >     6f26b6a61b08 serial: meson: Use platform_get_irq() to get the int=
errupt
> > >     450fa8bf803f ALSA: hda/realtek - Enable internal speaker of ASUS =
K6500ZC
> > >     cc549ba50bb8 ALSA: hda/realtek - Add Dell ALC295 to pin fall back=
 table
> > >     767c988771cb ALSA: info: Fix potential deadlock at disconnection
> > >     09022ae66261 xhci: Enable RPM on controllers that support low-pow=
er states
> > >     68574fe2e488 parisc/pgtable: Do not drop upper 5 address bits of =
physical address
> > >     ea7593c18ff7 parisc: Prevent booting 64-bit kernels on PA1.x mach=
ines
> > >     2c9092e8b29a i3c: master: svc: fix SDA keep low when polling IBIW=
ON timeout happen
> > >     da754f92fc02 i3c: master: svc: fix check wrong status register in=
 irq handler
> > >     5ba77b6b45d6 i3c: master: svc: fix ibi may not return mandatory d=
ata byte
> > >     e0a70ed4a580 i3c: master: svc: fix wrong data return when IBI hap=
pen during start frame
> > >     7383675aba2f i3c: master: svc: fix race condition in ibi work thr=
ead
> > >     cc7efd1054f4 i3c: master: cdns: Fix reading status register
> > >     d3c6a08c2b77 mtd: cfi_cmdset_0001: Byte swap OTP info
> > >     a4668088128d mm/memory_hotplug: use pfn math in place of direct s=
truct page manipulation
> > >     792a796085cf mm/cma: use nth_page() in place of direct struct pag=
e manipulation
> > >     9b59fc31226e s390/cmma: fix detection of DAT pages
> > >     45bb94aab891 dmaengine: stm32-mdma: correct desc prep when channe=
l running
> > >     91659b77e937 mcb: fix error handling for different scenarios when=
 parsing
> > >     534790fde890 tracing: Have the user copy of synthetic event addre=
ss use correct context
> > >     f6237afabc34 i2c: core: Run atomic i2c xfer when !preemptible
> > >     931aa7154bc4 kernel/reboot: emergency_restart: Set correct system=
_state
> > >     7a3424c3b76a quota: explicitly forbid quota files from being encr=
ypted
> > >     47f509832168 jbd2: fix potential data lost in recovering journal =
raced with synchronizing fs bdev
> > >     f13e1ea45699 ASoC: codecs: wsa-macro: fix uninitialized stack var=
iables with name prefix
> > >     28436d8092ad selftests/resctrl: Reduce failures due to outliers i=
n MBA/MBM tests
> > >     6ce63598a1fb selftests/resctrl: Remove duplicate feature check fr=
om CMT test
> > >     e90efe17fc07 netfilter: nf_tables: split async and sync catchall =
in two functions
> > >     0d9506c766c9 netfilter: nf_tables: remove catchall element in GC =
sync path
> > >     96fc7a50a278 PCI: keystone: Don't discard .probe() callback
> > >     e0d394df9812 PCI: keystone: Don't discard .remove() callback
> > >     f4f12667167c KEYS: trusted: Rollback init_trusted() consistently
> > >     c407ff72fb3a genirq/generic_chip: Make irq_remove_generic_chip() =
irqdomain aware
> > >     bc8a14e3c630 mmc: meson-gx: Remove setting of CMD_CFG_ERROR
> > >     3a51e6b4da71 wifi: ath11k: fix htt pktlog locking
> > >     426e718ce9ba wifi: ath11k: fix dfs radar event locking
> > >     e9d84413b1b7 wifi: ath11k: fix temperature event locking
> > >     5ff849948c11 ima: detect changes to the backing overlay file
> > >     4584a421a6d9 ima: annotate iint mutex to avoid lockdep false posi=
tive warnings
> > >     4049576c639f ACPI: FPDT: properly handle invalid FPDT subtables
> > >     628e76e684c8 firmware: qcom_scm: use 64-bit calling convention on=
ly when client is 64-bit
> > >     6eb8c191e360 btrfs: don't arbitrarily slow down delalloc if we're=
 committing
> > >     0b99626b28ca rcu: kmemleak: Ignore kmemleak false positives when =
RCU-freeing objects
> > >     71f5344f477c PM: hibernate: Clean up sync_read handling in snapsh=
ot_write_next()
> > >     57dbc0eb8abe PM: hibernate: Use __get_safe_page() rather than tou=
ching the list
> > >     87a30633b5d3 arm64: dts: qcom: ipq6018: Fix hwlock index for SMEM
> > >     ebaee06a7292 rcu/tree: Defer setting of jiffies during stall rese=
t
> > >     057d1034d012 svcrdma: Drop connection after an RDMA Read error
> > >     541b3757fd44 wifi: wilc1000: use vmm_table as array in wilc struc=
t
> > >     b156f62f19da PCI: exynos: Don't discard .remove() callback
> > >     f88796721002 PCI/ASPM: Fix L1 substate handling in aspm_attr_stor=
e_common()
> > >     467864d55b52 mmc: sdhci_am654: fix start loop index for TAP value=
 parsing
> > >     ef34a97bb9cb mmc: vub300: fix an error code
> > >     36adb6204cff clk: qcom: ipq6018: drop the CLK_SET_RATE_PARENT fla=
g from PLL clocks
> > >     090b167b2c41 clk: qcom: ipq8074: drop the CLK_SET_RATE_PARENT fla=
g from PLL clocks
> > >     18640a1818f1 clk: socfpga: Fix undefined behavior bug in struct s=
tratix10_clock_data
> > >     4d17b54c9be3 parisc/pdc: Add width field to struct pdc_model
> > >     936c9c10efae arm64: Restrict CPU_BIG_ENDIAN to GNU as or LLVM IAS=
 15.x or newer
> > >     8b24bb54bf3a ACPI: resource: Do IRQ override on TongFang GMxXGxx
> > >     5619c34d3c4c watchdog: move softlockup_panic back to early_param
> > >     a6c3a1fe09a2 PCI/sysfs: Protect driver's D3cold preference from u=
ser space
> > >     01975bee0a14 hvc/xen: fix event channel handling for secondary co=
nsoles
> > >     cfd543c10871 hvc/xen: fix error path in xen_hvc_init() to always =
register frontend driver
> > >     730e08cb9101 hvc/xen: fix console unplug
> > >     fa0b93a3de40 tty/sysrq: replace smp_processor_id() with get_cpu()
> > >     92e6c0f00d38 audit: don't WARN_ON_ONCE(!current->mm) in audit_exe=
_compare()
> > >     e29c095f1ad4 audit: don't take task_lock() in audit_exe_compare()=
 code path
> > >     5eb6519f483e KVM: x86: Ignore MSR_AMD64_TW_CFG access
> > >     1c49ef7041f2 KVM: x86: hyper-v: Don't auto-enable stimer on write=
 from user-space
> > >     fe6b461c37cb x86/cpu/hygon: Fix the CPU topology evaluation for r=
eal
> > >     3a2adf48d8b1 crypto: x86/sha - load modules based on CPU features
> > >     be079aa71a12 scsi: qla2xxx: Fix system crash due to bad pointer a=
ccess
> > >     6ba3569f78d3 scsi: megaraid_sas: Increase register read retry rou=
nt from 3 to 30 for selected registers
> > >     6a33b5810031 scsi: mpt3sas: Fix loop logic
> > >     3c5aede46cdc bpf: Fix precision tracking for BPF_ALU | BPF_TO_BE =
| BPF_END
> > >     403470431b15 bpf: Fix check_stack_write_fixed_off() to correctly =
spill imm
> > >     ba115f6c3a8c randstruct: Fix gcc-plugin performance mode to stay =
in group
> > >     2771fac4382b powerpc/perf: Fix disabling BHRB and instruction sam=
pling
> > >     7e450cc9ad54 media: venus: hfi: add checks to perform sanity on q=
ueue pointers
> > >     1566e8be73fd i915/perf: Fix NULL deref bugs with drm_dbg() calls
> > >     35c17257ef09 xfs: Fix unreferenced object reported by kmemleak in=
 xfs_sysfs_init()
> > >     5db146322b17 xfs: fix memory leak in xfs_errortag_init
> > >     c540284d8488 xfs: fix exception caused by unexpected illegal best=
count in leaf dir
> > >     5212d586e76f xfs: avoid a UAF when log intent item recovery fails
> > >     ba179cc12109 xfs: fix inode reservation space for removing transa=
ction
> > >     b7847653a2d6 xfs: Fix false ENOSPC when performing direct write o=
n a delalloc extent in cow fork
> > >     92d38b87e886 xfs: add missing cmap->br_state =3D XFS_EXT_NORM upd=
ate
> > >     8d0baec78e8a xfs: fix intermittent hang during quotacheck
> > >     76545c0e881b xfs: don't leak memory when attr fork loading fails
> > >     eb888caf27d9 xfs: fix use-after-free in xattr node block inactiva=
tion
> > >     4cb3842967e6 xfs: flush inode gc workqueue before clearing agi bu=
cket
> > >     188594c64a1e xfs: prevent a UAF when log IO errors race with unmo=
unt
> > >     921c96215850 xfs: use invalidate_lock to check the state of mmap_=
lock
> > >     efd194800b69 xfs: convert buf_cancel_table allocation to kmalloc_=
array
> > >     074fee186931 xfs: don't leak xfs_buf_cancel structures when recov=
ery fails
> > >     b8effd31a862 xfs: refactor buffer cancellation table allocation
> > >     4968c2aa6a1f cifs: fix check of rc in function generate_smb3signi=
ngkey
> > >     8d725bf0d16d cifs: spnego: add ';' in HOST_KEY_LEN
> > >     21accf149161 tools/power/turbostat: Enable the C-state Pre-wake p=
rinting
> > >     0045c1ff7ac0 tools/power/turbostat: Fix a knl bug
> > >     5bcce23f387b macvlan: Don't propagate promisc change to lower dev=
 in passthru
> > >     7574b5e65e92 net/mlx5e: Check return value of snprintf writing to=
 fw_version buffer for representors
> > >     55553c5b53ae net/mlx5e: Reduce the size of icosq_str
> > >     51655fd35703 net/mlx5e: Fix pedit endianness
> > >     a990dd7410ec net/mlx5e: Refactor mod header management API
> > >     39f95b1d0d8f net/mlx5e: Move mod hdr allocation to a single place
> > >     c0f37a3715cb net/mlx5e: Remove incorrect addition of action fwd f=
lag
> > >     6974fd92d5f1 net/mlx5e: fix double free of encap_header in update=
 funcs
> > >     f3c4a7044201 net/mlx5e: fix double free of encap_header
> > >     931e9e8e30bf net: stmmac: fix rx budget limit check
> > >     b8b514b2a6cd netfilter: nf_tables: fix pointer math issue in nft_=
byteorder_eval()
> > >     25da0f582119 netfilter: nf_tables: add and use BE register load-s=
tore helpers
> > >     a48f6be5bdb7 netfilter: nf_tables: use the correct get/put helper=
s
> > >     7d3901bf3baa netfilter: nf_conntrack_bridge: initialize err to 0
> > >     75bcfc188abf af_unix: fix use-after-free in unix_stream_read_acto=
r()
> > >     0b480c654ef2 net: ethernet: cortina: Fix MTU max setting
> > >     097588e20c6b net: ethernet: cortina: Handle large frames
> > >     f9269b274cdf net: ethernet: cortina: Fix max RX frame define
> > >     53064e8239dd bonding: stop the device in bond_setup_by_slave()
> > >     cda210a4bdf7 ptp: annotate data-race around q->head and q->tail
> > >     b67d16b2373b xen/events: fix delayed eoi list handling
> > >     8531a4194e59 ppp: limit MRU to 64K
> > >     9ae82308d184 tipc: Fix kernel-infoleak due to uninitialized TLV v=
alue
> > >     359c65daf6b5 net: hns3: fix VF wrong speed and duplex issue
> > >     406be003d698 net: hns3: fix VF reset fail issue
> > >     cfc131b078a3 net: hns3: fix variable may not initialized problem =
in hns3_init_mac_addr()
> > >     070581829c1a net: hns3: fix incorrect capability bit display for =
copper port
> > >     a3c65cf7854d net: hns3: add barrier in vf mailbox reply process
> > >     e671d8203758 net: hns3: add byte order conversion for PF to VF ma=
ilbox message
> > >     bb0f14257c04 net: hns3: refine the definition for struct hclge_pf=
_to_vf_msg
> > >     1d8f66d4060a net: hns3: fix add VLAN fail issue
> > >     4b3b2541d40e tty: Fix uninit-value access in ppp_sync_receive()
> > >     1f64cad3ac38 ipvlan: add ipvlan_route_v6_outbound() helper
> > >     6c71b9b177c6 net: set SOCK_RCU_FREE before inserting socket into =
hashtable
> > >     427165421c25 net: inet: Retire port only listening_hash
> > >     be1ceb8b7c58 net: inet: Open code inet_hash2 and inet_unhash2
> > >     bb9bcf47fba7 net: inet: Remove count from inet_listen_hashbucket
> > >     de634368e079 mptcp: listen diag dump support
> > >     870f438aca56 mptcp: diag: switch to context structure
> > >     be020f658c63 gfs2: Silence "suspicious RCU usage in gfs2_permissi=
on" warning
> > >     194454afa6aa SUNRPC: Fix RPC client cleaned up the freed pipefs d=
entries
> > >     319ed0cba164 NFSv4.1: fix SP4_MACH_CRED protection for pnfs IO
> > >     809684f5b388 SUNRPC: Add an IS_ERR() check back to where it was
> > >     46d6b768072b SUNRPC: ECONNRESET might require a rebind
> > >     a7032d4d6499 media: cec: meson: always include meson sub-director=
y in Makefile
> > >     16e78f28517d media: cadence: csi2rx: Unregister v4l2 async notifi=
er
> > >     20c2ca9abb78 sched/core: Optimize in_task() and in_interrupt() a =
bit
> > >     9894c58c1777 tracing/perf: Add interrupt_context_level() helper
> > >     48fef664d7e9 tracing: Reuse logic from perf's get_recursion_conte=
xt()
> > >     670b3e902f62 wifi: iwlwifi: Use FW rate for non-data frames
> > >     a7ee519e8095 pwm: Fix double shift bug
> > >     7054366cd076 drm/amdgpu: fix software pci_unplug on some chips
> > >     e48a5e78d077 drm/qxl: prevent memory leak
> > >     0835e7f296ca ASoC: ti: omap-mcbsp: Fix runtime PM underflow warni=
ngs
> > >     38ada2f304f6 i2c: dev: copy userspace array safely
> > >     610244988f32 kgdb: Flush console before entering kgdb on panic
> > >     4e497f1acd99 drm/amd/display: Avoid NULL dereference of timing ge=
nerator
> > >     5e0b788fb96b media: imon: fix access to invalid resource for the =
second interface
> > >     ae6bcafe1f6b media: ccs: Fix driver quirk struct documentation
> > >     d01b0ad79ecd media: cobalt: Use FIELD_GET() to extract Link Width
> > >     03ce0655bf8e gfs2: fix an oops in gfs2_permission
> > >     5bfda356e903 gfs2: ignore negated quota changes
> > >     16631907d013 media: vivid: avoid integer overflow
> > >     09cd8b561aa9 media: gspca: cpia1: shift-out-of-bounds in set_flic=
ker
> > >     39c71357e68e i3c: master: mipi-i3c-hci: Fix a kernel panic for ac=
cessing DAT_data.
> > >     72775cad7f57 virtio-blk: fix implicit overflow on virtio_max_dma_=
size
> > >     f7f3bdb225e3 i2c: sun6i-p2wi: Prevent potential division by zero
> > >     d23ad76f240c i3c: mipi-i3c-hci: Fix out of bounds access in hci_d=
ma_irq_handler
> > >     e6fbad3cc880 9p: v9fs_listxattr: fix %s null argument warning
> > >     a18be976be41 9p/trans_fd: Annotate data-racy writes to file::f_fl=
ags
> > >     2cc5e191d671 usb: gadget: f_ncm: Always set current gadget in ncm=
_bind()
> > >     6c80f48912b5 tty: vcc: Add check for kstrdup() in vcc_probe()
> > >     2ff61106d6b4 exfat: support handle zero-size directory
> > >     c86a3007a685 HID: Add quirk for Dell Pro Wireless Keyboard and Mo=
use KM5221W
> > >     3453f945af89 PCI: Use FIELD_GET() in Sapphire RX 5600 XT Pulse qu=
irk
> > >     0a93a0f99a09 misc: pci_endpoint_test: Add Device ID for R-Car S4-=
8 PCIe controller
> > >     03dbd6a9ea4e PCI: Disable ATS for specific Intel IPU E2000 device=
s
> > >     a9a0b3444845 PCI: Extract ATS disabling to a helper function
> > >     fe511d24418a PCI: Use FIELD_GET() to extract Link Width
> > >     56d78b5495eb scsi: libfc: Fix potential NULL pointer dereference =
in fc_lport_ptp_setup()
> > >     37a51e7f36b7 atm: iphase: Do PCI error checks on own line
> > >     f05ae00106aa PCI: tegra194: Use FIELD_GET()/FIELD_PREP() with Lin=
k Width fields
> > >     631a96e9eb42 ALSA: hda: Fix possible null-ptr-deref when assignin=
g a stream
> > >     1c805b9cd2e3 ARM: 9320/1: fix stack depot IRQ stack filter
> > >     8d25ec69f8f1 HID: lenovo: Detect quirk-free fw on cptkbd and stop=
 applying workaround
> > >     64f062baf202 jfs: fix array-index-out-of-bounds in diAlloc
> > >     da3da5e1e6f7 jfs: fix array-index-out-of-bounds in dbFindLeaf
> > >     1f74d336990f fs/jfs: Add validity check for db_maxag and db_agpre=
f
> > >     5f148b16972e fs/jfs: Add check for negative db_l2nbperpage
> > >     e1d1f79b1929 scsi: ibmvfc: Remove BUG_ON in the case of an empty =
event pool
> > >     f0bfc8a5561f scsi: hisi_sas: Set debugfs_dir pointer to NULL afte=
r removing debugfs
> > >     5904dee70771 RDMA/hfi1: Use FIELD_GET() to extract Link Width
> > >     546c1796ad1e crypto: pcrypt - Fix hungtask for PADATA_RESET
> > >     bc443a199f8c ASoC: soc-card: Add storage for PCI SSID
> > >     9f2082067c5f selftests/efivarfs: create-read: fix a resource leak
> > >     428cad17f53b arm64: dts: ls208xa: use a pseudo-bus to constrain u=
sb dma size
> > >     174f62a0aa15 drm/amdgpu: Fix a null pointer access when the smc_r=
reg pointer is NULL
> > >     3f7a400d5e80 drm/amdkfd: Fix shift out-of-bounds issue
> > >     300589d551d4 drm/panel: st7703: Pick different reset sequence
> > >     eaa03ea366c8 drm/amdgpu/vkms: fix a possible null pointer derefer=
ence
> > >     84c923d89890 drm/panel/panel-tpo-tpg110: fix a possible null poin=
ter dereference
> > >     2381f6b628b3 drm/panel: fix a possible null pointer dereference
> > >     c11cf5e117f5 drm/amdgpu: Fix potential null pointer derefernce
> > >     a237675aa1e6 drm/amd: Fix UBSAN array-index-out-of-bounds for Pol=
aris and Tonga
> > >     acdb6830de02 drm/amd: Fix UBSAN array-index-out-of-bounds for SMU=
7
> > >     829ce8e995a8 drm/msm/dp: skip validity check for DP CTS EDID chec=
ksum
> > >     689b33b94f09 drm: vmwgfx_surface.c: copy user-array safely
> > >     22260dabcfe3 kernel: watch_queue: copy user-array safely
> > >     d4f2c09d4672 kernel: kexec: copy user-array safely
> > >     24b17d530c42 string.h: add array-wrappers for (v)memdup_user()
> > >     3a3a6dc9a330 drm/amd/display: use full update for clip size incre=
ase of large plane source
> > >     7d43cdd22cd8 drm/amdkfd: Fix a race condition of vram buffer unre=
f in svm code
> > >     eea81424c5b8 drm/komeda: drop all currently held locks if deadloc=
k happens
> > >     812886866be6 platform/x86: thinkpad_acpi: Add battery quirk for T=
hinkpad X120e
> > >     ba7088769800 Bluetooth: Fix double free in hci_conn_cleanup
> > >     f9de14bde56d Bluetooth: btusb: Add date->evt_skb is NULL check
> > >     a43cf6acf017 wifi: ath10k: Don't touch the CE interrupt registers=
 after power up
> > >     6f42bd243327 net: annotate data-races around sk->sk_dst_pending_c=
onfirm
> > >     19ab5fd26441 net: annotate data-races around sk->sk_tx_queue_mapp=
ing
> > >     f3be63f7a8ee wifi: ath10k: fix clang-specific fortify warning
> > >     02a0547b8da0 wifi: ath9k: fix clang-specific fortify warnings
> > >     cf353904a828 bpf: Detect IP =3D=3D ksym.end as part of BPF progra=
m
> > >     c29a89b23f67 atl1c: Work around the DMA RX overflow issue
> > >     21a0f310a9f3 wifi: mac80211: don't return unset power in ieee8021=
1_get_tx_power()
> > >     3073e38086d0 wifi: mac80211_hwsim: fix clang-specific fortify war=
ning
> > >     e8e55fa44435 x86/mm: Drop the 4 MB restriction on minimal NUMA no=
de memory size
> > >     f9d3ba62e87b workqueue: Provide one lock class key per work_on_cp=
u() callsite
> > >     0a5b512d526c clocksource/drivers/timer-atmel-tcb: Fix initializat=
ion on SAM9 hardware
> > >     465b88c0873b clocksource/drivers/timer-imx-gpt: Fix potential mem=
ory leak
> > >     fd0df3f87192 perf/core: Bail out early if the request AUX area is=
 out of bound
> > >     e89d0ed45a41 locking/ww_mutex/test: Fix potential workqueue corru=
ption
> > >     2a910f4af54d Linux 5.15.139
> > >     3443337acd37 btrfs: use u64 for buffer sizes in the tree search i=
octls
> > >     f9f5e8cecba9 Revert "mmc: core: Capture correct oemid-bits for eM=
MC cards"
> > >     824829c2c6b4 tracing/kprobes: Fix the order of argument descripti=
ons
> > >     560680f745fc fbdev: fsl-diu-fb: mark wr_reg_wa() static
> > >     8e4b510fe917 fbdev: imsttfb: fix a resource leak in probe
> > >     3648582181b6 fbdev: imsttfb: Fix error path of imsttfb_probe()
> > >     30959f9f4540 spi: spi-zynq-qspi: add spi-mem to driver kconfig de=
pendencies
> > >     9cf044cc36c1 ASoC: hdmi-codec: register hpd callback on component=
 probe
> > >     705e5a28ec1d drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILAB=
LE
> > >     0ca05fae2790 netfilter: nat: fix ipv6 nat redirect with mapped an=
d scoped addresses
> > >     1652f57f02eb netfilter: nft_redir: use `struct nf_nat_range2` thr=
oughout and deduplicate eval call-backs
> > >     d28c17abe098 netfilter: xt_recent: fix (increase) ipv6 literal bu=
ffer length
> > >     f30567fcbc4d i2c: iproc: handle invalid slave state
> > >     38f5ac54b917 r8169: respect userspace disabling IFF_MULTICAST
> > >     fd01115b033c blk-core: use pr_warn_ratelimited() in bio_check_ro(=
)
> > >     b80148710983 block: remove unneeded return value of bio_check_ro(=
)
> > >     d8d94d6b3bd3 tg3: power down device only on SYSTEM_POWER_OFF
> > >     5ea06a23f8f4 net/smc: put sk reference if close work was canceled
> > >     884606f8283c net/smc: allow cdc msg send rather than drop it with=
 NULL sndbuf_desc
> > >     a62af7146daa net/smc: fix dangling sock under state SMC_APPFINCLO=
SEWAIT
> > >     866606826f16 selftests: pmtu.sh: fix result checking
> > >     2d117ac1b8f8 net: stmmac: xgmac: Enable support for multiple Flex=
ible PPS outputs
> > >     95a99ac112c5 Fix termination state for idr_for_each_entry_ul()
> > >     70ef755f126b net: r8169: Disable multicast filter for RTL8168H an=
d RTL8107E
> > >     0dad0e75d62b dccp/tcp: Call security_inet_conn_request() after se=
tting IPv6 addresses.
> > >     c340713bdf32 dccp: Call security_inet_conn_request() after settin=
g IPv4 addresses.
> > >     d1b7e6562a4c octeontx2-pf: Fix holes in error code
> > >     f60297ef59d4 octeontx2-pf: Fix error codes
> > >     794d360b1d65 inet: shrink struct flowi_common
> > >     8943083bbb64 bpf: Check map->usercnt after timer->timer is assign=
ed
> > >     3907b89cd17f tipc: Change nla_policy for bearer-related names to =
NLA_NUL_STRING
> > >     a1a485e45d24 hsr: Prevent use after free in prp_create_tagged_fra=
me()
> > >     352887b3edd0 llc: verify mac len before reading mac header
> > >     303766bb92c5 Input: synaptics-rmi4 - fix use after free in rmi_un=
register_function()
> > >     741e4c15d7c0 pwm: brcmstb: Utilize appropriate clock APIs in susp=
end/resume
> > >     895ac9a21f69 pwm: sti: Reduce number of allocations and drop usag=
e of chip_data
> > >     db64ddddeeec regmap: prevent noinc writes from clobbering cache
> > >     004d4002534e media: dvb-usb-v2: af9035: fix missing unlock
> > >     a0beda184756 media: cedrus: Fix clock/reset sequence
> > >     980be4c3b0d5 media: vidtv: mux: Add check and kfree for kstrdup
> > >     d17269fb9161 media: vidtv: psi: Add check for kstrdup
> > >     db89f551b706 media: s3c-camif: Avoid inappropriate kfree()
> > >     51c94256a83f media: bttv: fix use after free error due to btv->ti=
meout timer
> > >     d3937f9e25d9 media: i2c: max9286: Fix some redundant of_node_put(=
) calls
> > >     9d060f2fc40c pcmcia: ds: fix possible name leak in error path in =
pcmcia_device_add()
> > >     24e9df588e2e pcmcia: ds: fix refcount leak in pcmcia_device_add()
> > >     24e73ab542c7 pcmcia: cs: fix possible hung task and memory leak p=
ccardd()
> > >     b3eaa0d43c74 rtc: pcf85363: fix wrong mask/val parameters in regm=
ap_update_bits call
> > >     20bd0198bebd cxl/mem: Fix shutdown order
> > >     d48fe8d98171 i3c: Fix potential refcount leak in i3c_master_regis=
ter_new_i3c_devs
> > >     855d6fb2cc7b 9p/net: fix possible memory leak in p9_check_errors(=
)
> > >     0d456ebaad30 perf hist: Add missing puts to hist__account_cycles
> > >     924e8d0b7645 perf machine: Avoid out of bounds LBR memory read
> > >     76b0eab987c4 usb: host: xhci-plat: fix possible kernel oops while=
 resuming
> > >     c9c4dab06a5a xhci: Loosen RPM as default policy to cover for AMD =
xHC 1.1
> > >     92c9ef156431 powerpc/pseries: fix potential memory leak in init_c=
pu_associativity()
> > >     516235e7b35f powerpc/imc-pmu: Use the correct spinlock initialize=
r.
> > >     945dc61d7840 powerpc/xive: Fix endian conversion size
> > >     bce31a2bcb1e powerpc/40x: Remove stale PTE_ATOMIC_UPDATES macro
> > >     1308e55eb09c modpost: fix tee MODULE_DEVICE_TABLE built on big-en=
dian host
> > >     863a9c3fdec2 powerpc: Only define __parse_fpscr() when required
> > >     01f62c6bd2db f2fs: fix to initialize map.m_pblk in f2fs_precache_=
extents()
> > >     dfebea7114e0 dmaengine: pxa_dma: Remove an erroneous BUG_ON() in =
pxad_free_desc()
> > >     72f8fa6c4b78 USB: usbip: fix stub_dev hub disconnect
> > >     168697f15a53 tools: iio: iio_generic_buffer ensure alignment
> > >     a61c3c647ffd misc: st_core: Do not call kfree_skb() under spin_lo=
ck_irqsave()
> > >     732aa0cb2601 dmaengine: ti: edma: handle irq_of_parse_and_map() e=
rrors
> > >     2941a29fe9d6 usb: chipidea: Simplify Tegra DMA alignment code
> > >     58e8316b200b usb: chipidea: Fix DMA overwrite for Tegra
> > >     fcaafb574fc8 usb: dwc2: fix possible NULL pointer dereference cau=
sed by driver concurrency
> > >     c956be5641cc dmaengine: idxd: Register dsa_bus_type before regist=
ering idxd sub-drivers
> > >     ca46d7ce1fbe livepatch: Fix missing newline character in klp_reso=
lve_symbols()
> > >     b77f7c025e85 tty: tty_jobctrl: fix pid memleak in disassociate_ct=
ty()
> > >     e9f598a5cc9a f2fs: compress: fix to avoid redundant compress exte=
nsion
> > >     8c4504cc0c64 f2fs: compress: fix to avoid use-after-free on dic
> > >     ca0aae3837a6 leds: trigger: ledtrig-cpu:: Fix 'output may be trun=
cated' issue for 'cpu'
> > >     206a972511a8 leds: pwm: Don't disable the PWM when the LED should=
 be off
> > >     893eedf596dd leds: turris-omnia: Do not use SMBUS calls
> > >     aec3706971b3 leds: turris-omnia: Drop unnecessary mutex locking
> > >     c9a4f13c58f1 mfd: arizona-spi: Set pdata.hpdet_channel for ACPI e=
numerated devs
> > >     63a99d7b57b4 mfd: dln2: Fix double put in dln2_probe
> > >     2742c860e0b7 mfd: core: Ensure disabled devices are skipped witho=
ut aborting
> > >     94eb5423d75e mfd: core: Un-constify mfd_cell.of_reg
> > >     8890d4d5f25e ASoC: ams-delta.c: use component after check
> > >     a2ae48bd82ee crypto: qat - fix deadlock in backlog processing
> > >     0dd34a7ad395 padata: Fix refcnt handling in padata_free_shell()
> > >     93e4aa8545ab ASoC: Intel: Skylake: Fix mem leak when parsing UUID=
s fails
> > >     cd1c2df64d6b HID: logitech-hidpp: Move get_wireless_feature_index=
() check to hidpp_connect_event()
> > >     99893b7c4592 HID: logitech-hidpp: Revert "Don't restart communica=
tion if not necessary"
> > >     5f2f38602583 HID: logitech-hidpp: Don't restart IO, instead defer=
 hid_connect() only
> > >     1f80041c5867 HID: logitech-hidpp: Remove HIDPP_QUIRK_NO_HIDINPUT =
quirk
> > >     d3b196a1da3e Revert "HID: logitech-hidpp: add a module parameter =
to keep firmware gestures"
> > >     6885e5ffa09d sh: bios: Revive earlyprintk support
> > >     b0c25e957f9b hid: cp2112: Fix IRQ shutdown stopping polling for a=
ll IRQs on chip
> > >     d06dc0f99f72 RDMA/hfi1: Workaround truncation compilation error
> > >     086cd44204bb scsi: ufs: core: Leave space for '\0' in utf8 desc s=
tring
> > >     a0f1999090b3 ASoC: fsl: Fix PM disable depth imbalance in fsl_eas=
rc_probe
> > >     904fc0103776 RDMA/hns: The UD mode can only be configured with DC=
QCN
> > >     9f8db02d30ad RDMA/hns: Fix signed-unsigned mixed comparisons
> > >     2de683e27e1d RDMA/hns: Fix uninitialized ucmd in hns_roce_create_=
qp_common()
> > >     611260e36f16 IB/mlx5: Fix rdma counter binding for RAW QP
> > >     922b2693b9af ASoC: fsl: mpc5200_dma.c: Fix warning of Function pa=
rameter or member not described
> > >     001f90cd9d2f ext4: move 'ix' sanity check to corrent position
> > >     c24a3c9e373e ARM: 9321/1: memset: cast the constant byte to unsig=
ned char
> > >     012d0c66f939 hid: cp2112: Fix duplicate workqueue initialization
> > >     1ce09238e8e8 crypto: qat - increase size of buffers
> > >     62df66b726f9 crypto: caam/jr - fix Chacha20 + Poly1305 self test =
failure
> > >     61f25d4686bf crypto: caam/qi2 - fix Chacha20 + Poly1305 self test=
 failure
> > >     66eb7b7f23dd nd_btt: Make BTT lanes preemptible
> > >     6563e0f79d63 libnvdimm/of_pmem: Use devm_kstrdup instead of kstrd=
up and check its return value
> > >     d4ad0c1a83ce scsi: ibmvfc: Fix erroneous use of rtas_busy_delay w=
ith hcall return code
> > >     b79c7d684c3f RDMA/core: Use size_{add,sub,mul}() in calls to stru=
ct_size()
> > >     a5c83c8043d7 hwrng: geode - fix accessing registers
> > >     a8607725b20a crypto: hisilicon/hpre - Fix a erroneous check after=
 snprintf()
> > >     b01b9dc5487a selftests/resctrl: Ensure the benchmark commands fit=
s to its array
> > >     2d2300fcf8f6 selftests/pidfd: Fix ksft print formats
> > >     8bc9c9447489 arm64: dts: imx8mn: Add sound-dai-cells to micfil no=
de
> > >     1abd658492b5 arm64: dts: imx8mm: Add sound-dai-cells to micfil no=
de
> > >     cf7abb54f8b1 arm64: dts: imx8qm-ss-img: Fix jpegenc compatible en=
try
> > >     8704bf18a888 clk: scmi: Free scmi_clk allocated when the clocks w=
ith invalid info are skipped
> > >     bdb0428aa294 firmware: arm_ffa: Assign the missing IDR allocation=
 ID to the FFA device
> > >     b0ffdc164365 firmware: ti_sci: Mark driver as non removable
> > >     995ee1e84e8d soc: qcom: llcc: Handle a second device without data=
 corruption
> > >     19b8098f73c6 ARM: dts: qcom: mdm9615: populate vsdcc fixed regula=
tor
> > >     a8ab88f84b89 arm64: dts: qcom: apq8016-sbc: Add missing ADV7533 r=
egulators
> > >     ddc0df81eeac ARM64: dts: marvell: cn9310: Use appropriate label f=
or spi1 pins
> > >     12d9de01c09c arm64: dts: qcom: sdm845-mtp: fix WiFi configuration
> > >     690b89255971 arm64: dts: qcom: sc7280: Add missing LMH interrupts
> > >     2a4cce4168f7 arm64: dts: qcom: msm8992-libra: drop duplicated res=
erved memory
> > >     eb9daf47806b arm64: dts: qcom: msm8916: Fix iommu local address r=
ange
> > >     541640dcbf48 ARM: dts: renesas: blanche: Fix typo in GP_11_2 pin =
name
> > >     0e1e88bba286 perf: hisi: Fix use-after-free when register pmu fai=
ls
> > >     4067d39f3c57 drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/h=
andling
> > >     a6a6f70aedca drm/msm/dsi: use msm_gem_kernel_put to free TX buffe=
r
> > >     aea6f32a4318 xen-pciback: Consider INTx disabled when MSI/MSI-X i=
s enabled
> > >     e588ca45bf55 drm/rockchip: Fix type promotion bug in rockchip_gem=
_iommu_map()
> > >     a00a293d57a5 arm64/arm: xen: enlighten: Fix KPTI checks
> > >     d0d01bb4a560 drm/bridge: lt9611uxc: fix the race in the error pat=
h
> > >     29aba28ea195 drm/bridge: lt9611uxc: Register and attach our DSI d=
evice at probe
> > >     f53a04579328 drm/bridge: lt9611uxc: Switch to devm MIPI-DSI helpe=
rs
> > >     517a5137a57b drm/rockchip: cdn-dp: Fix some error handling paths =
in cdn_dp_probe()
> > >     865ccd4ca674 drm/mediatek: Fix iommu fault during crtc enabling
> > >     8e3c8253b34f drm/mediatek: Fix iommu fault by swapping FBs after =
updating plane state
> > >     e11e339faa11 drm/amdkfd: fix some race conditions in vram buffer =
alloc/free of svm code
> > >     30cb99e09648 drm/bridge: tc358768: Fix bit updates
> > >     1cd4ae681a6a drm/bridge: tc358768: Disable non-continuous clock m=
ode
> > >     c13591b859be drm/bridge: tc358768: Fix use of uninitialized varia=
ble
> > >     d78bddd94b80 drm/bridge: lt8912b: Add missing drm_bridge_attach c=
all
> > >     5cc2bc519afd drm/bridge: lt8912b: Manually disable HPD only if it=
 was enabled
> > >     42071feab712 drm/bridge: lt8912b: Fix crash on bridge detach
> > >     d9217286d0ab drm/bridge: lt8912b: Fix bridge_detach
> > >     cc3057958c5c drm/bridge: lt8912b: Add hot plug detection
> > >     ef4a40953c80 drm/bridge: lt8912b: Register and attach our DSI dev=
ice at probe
> > >     3580b8a01305 drm/bridge: lt8912b: Switch to devm MIPI-DSI helpers
> > >     52541851a8d1 drm/mipi-dsi: Create devm device attachment
> > >     a20d6ecd261a drm/mipi-dsi: Create devm device registration
> > >     347f025a02b3 drm/radeon: possible buffer overflow
> > >     b163b371d741 drm/rockchip: vop: Fix call to crtc reset helper
> > >     9a96bed1df7b drm/rockchip: vop: Fix reset of state in duplicate s=
tate crtc funcs
> > >     1b0bc99cf316 hwmon: (coretemp) Fix potentially truncated sysfs at=
tribute name
> > >     b3e7eb23a6e9 hwmon: (axi-fan-control) Fix possible NULL pointer d=
ereference
> > >     e0bf076b734a platform/x86: wmi: Fix opening of char device
> > >     c57e81d5e538 platform/x86: wmi: remove unnecessary initialization=
s
> > >     2ca4e461a298 platform/x86: wmi: Fix probe failure when failing to=
 register WMI devices
> > >     f75e11f54d98 clk: qcom: config IPQ_APSS_6018 should depend on QCO=
M_SMEM
> > >     d1175cf4bd2b clk: mediatek: clk-mt2701: Add check for mtk_alloc_c=
lk_data
> > >     e964d21dc034 clk: mediatek: clk-mt7629: Add check for mtk_alloc_c=
lk_data
> > >     c4070ada5d51 clk: mediatek: clk-mt7629-eth: Add check for mtk_all=
oc_clk_data
> > >     3aefc6fcfbad clk: mediatek: clk-mt6797: Add check for mtk_alloc_c=
lk_data
> > >     ca6d565a2319 clk: mediatek: clk-mt6779: Add check for mtk_alloc_c=
lk_data
> > >     533ca5153ad6 clk: mediatek: clk-mt6765: Add check for mtk_alloc_c=
lk_data
> > >     e531e4e73734 clk: npcm7xx: Fix incorrect kfree
> > >     761c2a690d8f clk: ti: fix double free in of_ti_divider_clk_setup(=
)
> > >     1c37faca0908 clk: ti: change ti_clk_register[_omap_hw]() API
> > >     28b72fba1e19 clk: ti: Update component clocks to use ti_dt_clk_na=
me()
> > >     c4bffed2e52b clk: ti: Update pll and clockdomain clocks to use ti=
_dt_clk_name()
> > >     9b5e9d8bf9a6 clk: ti: Add ti_dt_clk_name() helper to use clock-ou=
tput-names
> > >     f45fff806ebb clk: keystone: pll: fix a couple NULL vs IS_ERR() ch=
ecks
> > >     7ff8ca9beefb spi: nxp-fspi: use the correct ioremap function
> > >     26206c858dae clk: renesas: rzg2l: Fix computation formula
> > >     1966bf2a79e6 clk: renesas: rzg2l: Use FIELD_GET() for PLL registe=
r fields
> > >     7ece2efa87af clk: renesas: rzg2l: Simplify multiplication/shift l=
ogic
> > >     e2239f716529 clk: imx: imx8qxp: Fix elcdif_pll clock
> > >     7d416973cd12 clk: imx: imx8mq: correct error handling path
> > >     608ebb098b79 clk: imx: Select MXC_CLK for CLK_IMX8QXP
> > >     8861b2925a84 clk: qcom: gcc-sm8150: Fix gcc_sdcc2_apps_clk_src
> > >     76e8f00f54a8 clk: qcom: mmcc-msm8998: Fix the SMMU GDSC
> > >     56c4bb46a5a0 clk: qcom: mmcc-msm8998: Don't check halt bit on som=
e branch clks
> > >     0881d24cf5ca clk: qcom: clk-rcg2: Fix clock rate overflow for hig=
h parent frequencies
> > >     b64683f5d728 spi: tegra: Fix missing IRQ check in tegra_slink_pro=
be()
> > >     b13e8b38be51 regmap: debugfs: Fix a erroneous check after snprint=
f()
> > >     8fafac407346 ipvlan: properly track tx_errors
> > >     3eedc19a9d0f net: add DEV_STATS_READ() helper
> > >     359bce81b841 ipv6: avoid atomic fragment on GSO packets
> > >     6b413d52f6ab ACPI: sysfs: Fix create_pnp_modalias() and create_of=
_modalias()
> > >     32aaa3b98789 wifi: iwlwifi: empty overflow queue during flush
> > >     0e3ad00be4e8 wifi: iwlwifi: pcie: synchronize IRQs before NAPI
> > >     a8ebe549e0ce wifi: iwlwifi: call napi_synchronize() before freein=
g rx/tx queues
> > >     627a3b3f5c80 iwlwifi: pcie: adjust to Bz completion descriptor
> > >     0d91506a40ec tcp: fix cookie_init_timestamp() overflows
> > >     4f6e904ed4e3 chtls: fix tp->rcv_tstamp initialization
> > >     5d7bec7ae4db r8169: fix rare issue with broken rx after link-down=
 on RTL8125
> > >     e143a3c82d33 r8169: use tp_to_dev instead of open code
> > >     3a8f4e58e1ee thermal: core: prevent potential string overflow
> > >     bfd4ed4988aa netfilter: nf_tables: Drop pointless memset when dum=
ping rules
> > >     80986257d2cd PM / devfreq: rockchip-dfi: Make pmu regmap mandator=
y
> > >     826120c9ba68 can: dev: can_put_echo_skb(): don't crash kernel if =
can_priv::echo_skb is accessed out of bounds
> > >     28e9e015916e can: dev: can_restart(): fix race condition between =
controller restart and netif_carrier_on()
> > >     ada4dc4788f1 can: dev: can_restart(): don't crash kernel if carri=
er is OK
> > >     d4eb4182a823 wifi: rtlwifi: fix EDCA limit set by BT coexistence
> > >     2027e74150ee tcp_metrics: do not create an entry from tcp_init_me=
trics()
> > >     3f7cb7c47ce0 tcp_metrics: properly set tp->snd_ssthresh in tcp_in=
it_metrics()
> > >     ca7b6fa9e61a tcp_metrics: add missing barriers on delete
> > >     227709a0e47c wifi: mt76: mt7603: improve stuck beacon handling
> > >     eab5b0aa5065 mt76: pass original queue id from __mt76_tx_queue_sk=
b to the driver
> > >     75336a762539 mt76: add support for overriding the device used for=
 DMA mapping
> > >     77b2ab5cd1a4 mt76: dma: use kzalloc instead of devm_kzalloc for t=
xwi
> > >     064b32f18db1 wifi: mt76: mt7603: rework/fix rx pse hang check
> > >     1afbb9ececd3 wifi: rtw88: debug: Fix the NULL vs IS_ERR() bug for=
 debugfs_create_file()
> > >     ebcbf5f5e047 net: spider_net: Use size_add() in call to struct_si=
ze()
> > >     56e7424c6efc tipc: Use size_add() in calls to struct_size()
> > >     3e51efcb2909 mlxsw: Use size_mul() in call to struct_size()
> > >     dc3fef310732 gve: Use size_add() in call to struct_size()
> > >     70f032db8516 tcp: call tcp_try_undo_recovery when an RTOd TFO SYN=
ACK is ACKed
> > >     a2d540c74549 udp: add missing WRITE_ONCE() around up->encap_rcv
> > >     8f7eef3a13df selftests/bpf: Correct map_fd to data_fd in tailcall=
s
> > >     3eefb2fbf4ec selftests/bpf: Test tail call counting with bpf2bpf =
and data on stack
> > >     ab91992ec4d4 i40e: fix potential memory leaks in i40e_remove()
> > >     702742373650 genirq/matrix: Exclude managed interrupts in irq_mat=
rix_allocated()
> > >     379b120e4f27 pstore/platform: Add check for kstrdup
> > >     81b8638e4ef4 x86/boot: Fix incorrect startup_gdt_descr.size
> > >     c7e8c7452e5a x86/sev-es: Allow copy_from_kernel_nofault() in earl=
ier boot
> > >     0b5da8ce0f18 x86: Share definition of __is_canonical_address()
> > >     90b263db856d futex: Don't include process MM in futex key on no-M=
MU
> > >     f0d6e5841172 x86/srso: Fix SBPB enablement for (possible) future =
fixed HW
> > >     565f9337b68e writeback, cgroup: switch inodes with dirty timestam=
ps to release dying cgwbs
> > >     2bb46b20825d vfs: fix readahead(2) on block devices
> > >     20195f87db19 sched: Fix stop_one_cpu_nowait() vs hotplug
> > >     13cde955e52e sched/uclamp: Ignore (util =3D=3D 0) optimization in=
 feec() when p_util_max =3D 0
> > >     cc6198ff20c0 iov_iter, x86: Be consistent about the __user tag on=
 copy_mc_to_user()
> > >     80529b4968a8 Linux 5.15.138
> > >     3d8344a7c4a3 ALSA: hda: intel-dsp-config: Fix JSL Chromebook quir=
k detection
> > >     f049c0c0037d misc: pci_endpoint_test: Add deviceID for J721S2 PCI=
e EP device support
> > >     28b8ad8ccecd tty: 8250: Add Brainboxes Oxford Semiconductor-based=
 quirks
> > >     44c4dfac3f02 tty: 8250: Add support for Intashield IX cards
> > >     d541ccb34de2 tty: 8250: Add support for additional Brainboxes PX =
cards
> > >     60debc01fcbb tty: 8250: Fix up PX-803/PX-857
> > >     1f5649aed527 tty: 8250: Fix port count of PX-257
> > >     3fe3cc63c730 tty: 8250: Add support for Intashield IS-100
> > >     a5b6390fd609 tty: 8250: Add support for Brainboxes UP cards
> > >     738fe41b6443 tty: 8250: Add support for additional Brainboxes UC =
cards
> > >     ff6059c3d234 tty: 8250: Remove UC-257 and UC-431
> > >     81a4dd5e6c78 tty: n_gsm: fix race condition in status line change=
 on dead connections
> > >     e25197747f0e usb: raw-gadget: properly handle interrupted request=
s
> > >     e5f53a68a596 usb: typec: tcpm: Fix NULL pointer dereference in tc=
pm_pd_svdm()
> > >     7c4855b22a3f usb: storage: set 1.50 as the lower bcdDevice for ol=
der "Super Top" compatibility
> > >     c48aae53850c PCI: Prevent xHCI driver from claiming AMD VanGogh U=
SB3 DRD device
> > >     6628c3627c02 drm/amd: Disable ASPM for VI w/ all Intel systems
> > >     b6c3c7786e24 drm/amd: Move helper for dynamic speed switch check =
out of smu13
> > >     9015169f00ee can: isotp: isotp_sendmsg(): fix TX state detection =
and wait behavior
> > >     d72ff6478323 can: isotp: isotp_bind(): do not validate unused add=
ress information
> > >     e163ad6a8639 can: isotp: add local echo tx processing and tx with=
out FC
> > >     b4e78ea26638 can: isotp: handle wait_event_interruptible() return=
 values
> > >     2fc6f337257f can: isotp: check CAN address family in isotp_bind()
> > >     f8c3bd211cf3 can: isotp: isotp_bind(): return -EINVAL on incorrec=
t CAN ID formatting
> > >     615c4dd64050 can: isotp: set max PDU size to 64 kByte
> > >     6627b96851f1 powerpc/mm: Fix boot crash with FLATMEM
> > >     f0f998648887 r8152: Check for unplug in r8153b_ups_en() / r8153c_=
ups_en()
> > >     78c939a88729 r8152: Check for unplug in rtl_phy_patch_request()
> > >     51cc28ce742e net: chelsio: cxgb4: add an error code check in t4_l=
oad_phy_fw
> > >     bbc926199321 platform/mellanox: mlxbf-tmfifo: Fix a warning messa=
ge
> > >     db4416ea3a5d scsi: mpt3sas: Fix in error path
> > >     d48b2e8189d5 fbdev: uvesafb: Call cn_del_callback() at the end of=
 uvesafb_exit()
> > >     e39440c3268b drm/ttm: Reorder sys manager cleanup step
> > >     aade33d3d9bb ASoC: rt5650: fix the wrong result of key button
> > >     fa32e21c0568 netfilter: nfnetlink_log: silence bogus compiler war=
ning
> > >     dfcbb983eb6e spi: npcm-fiu: Fix UMA reads when dummy.nbytes =3D=
=3D 0
> > >     64ae128b095d fs/ntfs3: Avoid possible memory leak
> > >     27a0bed1285e fs/ntfs3: Fix directory element type detection
> > >     94524980ee75 fs/ntfs3: Fix NULL pointer dereference on error in a=
ttr_allocate_frame()
> > >     2de328398b50 fs/ntfs3: Fix possible NULL-ptr-deref in ni_readpage=
_cmpr()
> > >     962a3d3d731c fs/ntfs3: Use kvmalloc instead of kmalloc(... __GFP_=
NOWARN)
> > >     393966e79ba1 fs/ntfs3: Write immediately updated ntfs state
> > >     59e629fc7157 fs/ntfs3: Add ckeck in ni_update_parent()
> > >     738a3adc7c8b fbdev: atyfb: only use ioremap_uc() on i386 and ia64
> > >     afef8af919d2 Input: synaptics-rmi4 - handle reset delay when usin=
g SMBus trsnsport
> > >     abc62fc06d4a powerpc/85xx: Fix math emulation exception
> > >     4bdde4dca00e dmaengine: ste_dma40: Fix PM disable depth imbalance=
 in d40_probe
> > >     39d2c10367a8 irqchip/stm32-exti: add missing DT IRQ flag translat=
ion
> > >     c57aef9075e0 irqchip/riscv-intc: Mark all INTC nodes as initializ=
ed
> > >     eb99b6e204cd net: sched: cls_u32: Fix allocation size in u32_init=
()
> > >     5e78ebe7c1db ASoC: simple-card: fixup asoc_simple_probe() error h=
andling
> > >     65fd21aa3805 x86: Fix .brk attribute in linker script
> > >     d4c8bf5635c4 rpmsg: Fix possible refcount leak in rpmsg_register_=
device_override()
> > >     a82e0fda8a2f rpmsg: glink: Release driver_override
> > >     bfd4a664ddfb rpmsg: Fix calling device_lock() on non-initialized =
device
> > >     2e76b4f6218c rpmsg: Fix kfree() of static memory on setting drive=
r_override
> > >     5c0da71871d3 rpmsg: Constify local variable in field store macro
> > >     389190b25472 driver: platform: Add helper for safer setting of dr=
iver_override
> > >     37ffa428d58c objtool/x86: add missing embedded_insn check
> > >     f031e15d0bb8 ext4: avoid overlapping preallocations due to overfl=
ow
> > >     f2c3a3aa6f11 ext4: fix BUG in ext4_mb_new_inode_pa() due to overf=
low
> > >     7a992726f727 ext4: add two helper functions extent_logical_end() =
and pa_logical_end()
> > >     9e78e7709f7d x86/mm: Fix RESERVE_BRK() for older binutils
> > >     d3201c718058 x86/mm: Simplify RESERVE_BRK()
> > >     897b56acf126 x86/i8259: Skip probing when ACPI/MADT advertises PC=
AT compatibility
> > >     77db87c4a4ed gve: Fix GFP flags when allocing pages
> > >     8b424bdf6c9c iio: afe: rescale: Accept only offset channels
> > >     c1eeb494f684 iio: afe: rescale: add offset support
> > >     7c76b7db5521 iio: afe: rescale: expose scale processing function
> > >     c60671502dc2 iio: afe: rescale: reorder includes
> > >     27dd09f5ec7f clk: Sanitize possible_parent_show to Handle Return =
Value of of_clk_get_parent_name
> > >     c27ca4aebbee sparc32: fix a braino in fault handling in csum_and_=
copy_..._user()
> > >     21b07a2e6095 perf/core: Fix potential NULL deref
> > >     6efd498009b9 nvmem: imx: correct nregs for i.MX6UL
> > >     0c2948118c34 nvmem: imx: correct nregs for i.MX6SLL
> > >     6e22bf6f00d5 nvmem: imx: correct nregs for i.MX6ULL
> > >     e0f95b831b4a misc: fastrpc: Clean buffers on remote invocation fa=
ilures
> > >     c4957f00f9e2 tracing/kprobes: Fix the description of variable len=
gth arguments
> > >     cdc57093b470 i2c: aspeed: Fix i2c bus hang in slave read
> > >     e97d374a2506 i2c: stm32f7: Fix PEC handling in case of SMBUS tran=
sfers
> > >     2766a872103b i2c: muxes: i2c-demux-pinctrl: Use of_get_i2c_adapte=
r_by_node()
> > >     48b58f7469e5 i2c: muxes: i2c-mux-gpmux: Use of_get_i2c_adapter_by=
_node()
> > >     cb65e692765b i2c: muxes: i2c-mux-pinctrl: Use of_get_i2c_adapter_=
by_node()
> > >     eace761f35a1 iio: adc: xilinx-xadc: Correct temperature offset/sc=
ale for UltraScale
> > >     70322a446ef2 iio: adc: xilinx-xadc: Don't clobber preset voltage/=
temperature thresholds
> > >     3c1312b5d49a iio: exynos-adc: request second interupt only when t=
ouchscreen mode is used
> > >     4e14f2d5885f kasan: print the original fault addr when access inv=
alid shadow
> > >     bdfa4fa7588d i40e: Fix wrong check for I40E_TXR_FLAGS_WB_ON_ITR
> > >     d5c175f4cea6 gtp: fix fragmentation needed check with gso
> > >     c0dad0c0924c gtp: uapi: fix GTPA_MAX
> > >     852fb4ce426d tcp: fix wrong RTO timeout when received SACK renegi=
ng
> > >     83cfa3b51a78 r8152: Release firmware if we have an error in probe
> > >     e0f9231ccd6c r8152: Cancel hw_phy_work if we have an error in pro=
be
> > >     ff42b0a55659 r8152: Run the unload routine if we have errors duri=
ng probe
> > >     6fa3b9f9478e r8152: Increase USB control msg timeout to 5000ms as=
 per spec
> > >     76873f2eadc0 net: usb: smsc95xx: Fix uninit-value access in smsc9=
5xx_read_reg
> > >     6afd112c3f95 net: ieee802154: adf7242: Fix some potential buffer =
overflow in adf7242_stats_show()
> > >     46cd35e4e774 igc: Fix ambiguity in the ethtool advertising
> > >     49529413eaed neighbour: fix various data-races
> > >     667554946360 igb: Fix potential memory leak in igb_add_ethtool_nf=
c_entry
> > >     263421905346 treewide: Spelling fix in comment
> > >     bc0c4bc119d2 i40e: Fix I40E_FLAG_VF_VLAN_PRUNING value
> > >     c532c5df01ad r8169: fix the KCSAN reported data race in rtl_rx wh=
ile reading desc->opts1
> > >     6afb294c88c6 r8169: fix the KCSAN reported data-race in rtl_tx wh=
ile reading TxDescArray[entry].opts1
> > >     9d7b3838428c r8169: fix the KCSAN reported data-race in rtl_tx() =
while reading tp->cur_tx
> > >     04dbfa4122e0 firmware/imx-dsp: Fix use_after_free in imx_dsp_setu=
p_channels()
> > >     0d587b86cd0d drm/dp_mst: Fix NULL deref in get_mst_branch_device_=
by_guid_helper()
> > >     8860f0175e51 vsock/virtio: initialize the_virtio_vsock before usi=
ng VQs
> > >     762c251c7f5c vsock/virtio: add support for device suspend/resume
> > >     1e02df6f6907 vsock/virtio: factor our the code to initialize and =
delete VQs
> > >     15a8cac3c250 drm/i915/pmu: Check if pmu is closed before stopping=
 event
> > >     43bd431a5dd9 nfsd: lock_rename() needs both directories to live o=
n the same fs
> > >     556b68d9b95f mm/migrate: fix do_pages_move for compat pointers
> > >     c4071c6114de mm/page_alloc: correct start page when guard page de=
bug is enabled
> > >     3a6cee2bfb53 vhost: Allow null msg.size on VHOST_IOTLB_INVALIDATE
> > >     fbc9a8718f31 virtio-mmio: fix memory leak of vm_dev
> > >     862a356bc986 virtio_balloon: Fix endless deflation and inflation =
on arm64
> > >     41bb770e42bc mcb-lpc: Reallocate memory region to avoid memory ov=
erlapping
> > >     f2ac8b2643dd mcb: Return actual parsed size when reading chameleo=
n table
> > >     90918ef995b5 mptcp: more conservative check for zero probes
> > >     fd2b2dab6f5b tcp: cleanup tcp_remove_empty_skb() use
> > >     68342755b9b2 tcp: remove dead code from tcp_sendmsg_locked()
> > >     0f482ad7b1a5 pinctrl: qcom: lpass-lpi: fix concurrent register up=
dates
> > >     51b054f6fe01 ASoC: codecs: wcd938x: fix runtime PM imbalance on r=
emove
> > >     cb34f4e79e54 ASoC: codecs: wcd938x: fix resource leaks on bind er=
rors
> > >     12952a23a5da Linux 5.15.137
> > >     dff33880d40a xfrm6: fix inet6_dev refcount underflow problem
> > >     5a9d05a4f1c3 Bluetooth: hci_sock: Correctly bounds check and pad =
HCI_MON_NEW_INDEX name
> > >     a6df96ee0b45 Bluetooth: hci_sock: fix slab oob read in create_mon=
itor_event
> > >     c08d609fb2b6 phy: mapphone-mdm6600: Fix pinctrl_pm handling for s=
leep pins
> > >     e1b030b101f6 phy: mapphone-mdm6600: Fix runtime PM for remove
> > >     59f1095ab58e phy: mapphone-mdm6600: Fix runtime disable on probe
> > >     b618062c0b13 serial: 8250: omap: Move uart_write() inside PM sect=
ion
> > >     67f29cd2f851 ASoC: pxa: fix a memory leak in probe()
> > >     76d04c339508 gpio: vf610: set value before the direction to avoid=
 a glitch
> > >     4b129e3964b3 platform/x86: asus-wmi: Map 0x2a code, Ignore 0x2b a=
nd 0x2c events
> > >     e1a058cc2467 platform/x86: asus-wmi: Change ASUS_WMI_BRN_DOWN cod=
e from 0x20 to 0x2e
> > >     c6bbe51dcdf3 platform/surface: platform_profile: Propagate error =
if profile registration fails
> > >     a73c8d716938 s390/cio: fix a memleak in css_alloc_subchannel
> > >     c8b6c2df1e7d selftests/ftrace: Add new test case which checks non=
 unique symbol
> > >     3ad81e6affcb s390/pci: fix iommu bitmap allocation
> > >     71d224acc4d1 perf: Disallow mis-matched inherited group reads
> > >     5aa89a11a2a6 USB: serial: option: add Fibocom to DELL custom mode=
m FM101R-GL
> > >     8c376d863618 USB: serial: option: add entry for Sierra EM9191 wit=
h new firmware
> > >     483221216176 USB: serial: option: add Telit LE910C4-WWX 0x1035 co=
mposition
> > >     e750fb71dc6a nvme-rdma: do not try to stop unallocated queues
> > >     a9fd6d44abbc nvme-pci: add BOGUS_NID for Intel 0a54 device
> > >     071382bda1da ACPI: irq: Fix incorrect return value in acpi_regist=
er_gsi()
> > >     431a5010bce2 NFSv4.1: fixup use EXCHGID4_FLAG_USE_PNFS_DS for DS =
server
> > >     5762e72ef1b0 pNFS: Fix a hang in nfs4_evict_inode()
> > >     5a3abee2eee9 Revert "pinctrl: avoid unsafe code pattern in find_p=
inctrl()"
> > >     24959825377f mmc: core: Capture correct oemid-bits for eMMC cards
> > >     8041e7b7e7e9 mmc: core: sdio: hold retuning if sdio in 1-bit mode
> > >     262029c0c58c mmc: mtk-sd: Use readl_poll_timeout_atomic in msdc_r=
eset_hw
> > >     3e363db1c13a mtd: physmap-core: Restore map_rom fallback
> > >     71823463b1b2 mtd: spinand: micron: correct bitmask for ecc status
> > >     a50d2f17d562 mtd: rawnand: arasan: Ensure program page operations=
 are successful
> > >     ae53c92e928c mtd: rawnand: marvell: Ensure program page operation=
s are successful
> > >     c0ca2ab23098 mtd: rawnand: pl353: Ensure program page operations =
are successful
> > >     a7070628043e mtd: rawnand: qcom: Unmap the right resource upon pr=
obe failure
> > >     3f928d1362f7 net: fix ifname in netlink ntf during netns move
> > >     ac43ec299a6f net: move from strlcpy with unused retval to strscpy
> > >     30e2db403032 net: introduce a function to check if a netdev name =
is in use
> > >     38ba5479355b Bluetooth: hci_event: Fix using memcmp when comparin=
g keys
> > >     3b2da6d62b42 net/mlx5: Handle fw tracer change ownership event ba=
sed on MTRC
> > >     f6e263824539 platform/x86: touchscreen_dmi: Add info for the Posi=
tivo C4128B
> > >     ca56d8afe648 HID: multitouch: Add required quirk for Synaptics 0x=
cd7e device
> > >     ca5bec7ecf26 btrfs: error out when reallocating block for defrag =
using a stale transaction
> > >     2692fd37aaf4 btrfs: error when COWing block from a root that is b=
eing deleted
> > >     ef491d9560d9 btrfs: error out when COWing block using a stale tra=
nsaction
> > >     f89ed0a09673 btrfs: fix some -Wmaybe-uninitialized warnings in io=
ctl.c
> > >     df486b75feca drm: panel-orientation-quirks: Add quirk for One Mix=
 2S
> > >     d5ba30ee4f6d ipv4/fib: send notify when delete source address rou=
tes
> > >     9d07b7abd277 sky2: Make sure there is at least one frag_addr avai=
lable
> > >     f652eb4adf27 regulator/core: Revert "fix kobject release warning =
and memory leak in regulator_register()"
> > >     aa77b187b1f0 wifi: cfg80211: avoid leaking stack data into trace
> > >     30a2285a2e18 wifi: mac80211: allow transmitting EAPOL frames with=
 tainted key
> > >     b64eb31a1b53 wifi: cfg80211: Fix 6GHz scan configuration
> > >     bbec1724519e Bluetooth: hci_core: Fix build warnings
> > >     02b0e6991838 Bluetooth: Avoid redundant authentication
> > >     38681af225b6 Bluetooth: btusb: add shutdown function for QCA6174
> > >     e6e9a32c3e60 HID: holtek: fix slab-out-of-bounds Write in holtek_=
kbd_input_event
> > >     06aabf7715da wifi: iwlwifi: Ensure ack flag is properly cleared.
> > >     6063f6f64fa4 wifi: mwifiex: Sanity check tlv_len and tlv_bitmap_l=
en
> > >     59ebfeb7b319 tracing: relax trace_event_eval_update() execution w=
ith cond_resched()
> > >     3d85fb391fa7 ata: libata-eh: Fix compilation warning in ata_eh_li=
nk_report()
> > >     89e3cc1b0703 ata: libata-core: Fix compilation warning in ata_dev=
_config_ncq()
> > >     137c658ea3ce gpio: timberdale: Fix potential deadlock on &tgpio->=
lock
> > >     68f106c2b2ab overlayfs: set ctime when setting mtime and atime
> > >     ef3c62e2f0f1 i2c: mux: Avoid potential false error message in i2c=
_mux_add_adapter
> > >     e2f64f3eebaa btrfs: initialize start_slot in btrfs_log_prealloc_e=
xtents
> > >     266dab0ce42d btrfs: return -EUCLEAN for delayed tree ref with a r=
ef count not equals to 1
> > >     bc424f18fbdc fs-writeback: do not requeue a clean inode having sk=
ipped pages
> > >     92609823592c ARM: dts: ti: omap: Fix noisy serial with overrun-th=
rottle-ms for mapphone
> > >     3898d8d685ab ksmbd: not allow to open file if delelete on close b=
it is set
> > >     d3dc26c4fdc2 nfp: flower: avoid rmmod nfp crash issues
> > >     6c52b1215904 mctp: perform route lookups under a RCU read-side lo=
ck
> > >     db3f17e571e8 mctp: Allow local delivery to the null EID
> > >     29017ab1a539 powerpc/47x: Fix 47x syscall return crash
> > >     558ee0fafd40 powerpc/32s: Do kuep_lock() and kuep_unlock() in ass=
embly
> > >     d00f4ae3accf powerpc/32s: Remove capability to disable KUEP at bo=
ottime
> > >     fcb3f09e8173 drm/atomic-helper: relax unregistered connector chec=
k
> > >     403d201d1fd1 perf/x86/lbr: Filter vsyscall addresses
> > >     419ac18d8808 perf/x86: Move branch classifier
> > >     030099bc9115 perf: Add irq and exception return branch types
> > >     ae80d5290c14 iio: adc: ad7192: Correct reference voltage
> > >     569a126f244b iio: cros_ec: fix an use-after-free in cros_ec_senso=
rs_push_data()
> > >     a9c471892d75 iio: core: introduce iio_device_{claim|release}_buff=
er_mode() APIs
> > >     eafbb1966152 iio: core: Hide read accesses to iio_dev->currentmod=
e
> > >     919721348c04 iio: Un-inline iio_buffer_enabled()
> > >     7f74bc91eb00 serial: 8250_omap: Fix errors with no_console_suspen=
d
> > >     d67d831e1dbc serial: 8250: omap: Fix imprecise external abort for=
 omap_8250_pm()
> > >     aff3019b553e selftests/mm: fix awk usage in charge_reserved_huget=
lb.sh and hugetlb_reparenting_test.sh that may cause error
> > >     4f1d3d1ca500 net: pktgen: Fix interface flags printing
> > >     8bdf95e29f86 netfilter: nf_tables: revert do not remove elements =
if set backend implements .abort
> > >     cc19daa037f5 netfilter: nf_tables: do not remove elements if set =
backend implements .abort
> > >     db33720697c8 netfilter: nft_set_rbtree: .deactivate fails if elem=
ent has expired
> > >     44768cad012c neighbor: tracing: Move pin6 inside CONFIG_IPV6=3Dy =
section
> > >     b33179dbf3f2 net/sched: sch_hfsc: upgrade 'rt' to 'sc' when it be=
comes a inner curve
> > >     0426d7bc17b8 bonding: Return pointer to data after pull on skb
> > >     66982023d741 net: dsa: bcm_sf2: Fix possible memory leak in bcm_s=
f2_mdio_register()
> > >     0ea476863ef7 i40e: prevent crash on probe if hw registers have in=
valid values
> > >     f9202217a6ea net: usb: smsc95xx: Fix an error code in smsc95xx_re=
set()
> > >     a2ceb30cc1fc ipv4: fib: annotate races around nh->nh_saddr_genid =
and nh->nh_saddr
> > >     a270aa7a47db tun: prevent negative ifindex
> > >     9d55719f983d tcp: tsq: relax tcp_small_queue_check() when rtx que=
ue contains a single skb
> > >     8ae344291e38 tcp: fix excessive TLP and RACK timeouts from HZ rou=
nding
> > >     8b6b4ca42a94 net: rfkill: gpio: prevent value glitch during probe
> > >     4df9ba0d7a82 net: ipv6: fix return value check in esp_remove_trai=
ler
> > >     a9651e66d0bd net: ipv4: fix return value check in esp_remove_trai=
ler
> > >     26a3c734cb8a xfrm: interface: use DEV_STATS_INC()
> > >     f8bc4b708b11 xfrm: fix a data-race in xfrm_gen_index()
> > >     b660e58ef72d qed: fix LL2 RX buffer allocation
> > >     d35f398b88a1 ASoC: codecs: wcd938x: fix unbind tear down order
> > >     d182d8ed7b7e ASoC: codecs: wcd938x: drop bogus bind error handlin=
g
> > >     8d32a6b67e77 ASoC: codecs: wcd938x-sdw: fix runtime PM imbalance =
on probe errors
> > >     6df571a6c153 ASoC: codecs: wcd938x-sdw: fix use after free on dri=
ver unbind
> > >     36eabe87031f drm/i915: Retry gtt fault when out of fence register=
s
> > >     34f62612be2a nvmet-tcp: Fix a possible UAF in queue intialization=
 setup
> > >     04e0eef74b8f netfilter: nft_payload: fix wrong mac header matchin=
g
> > >     efe43d1bcbcb fs/ntfs3: fix deadlock in mark_as_free_ex
> > >     ab40c7ab7a93 fs/ntfs3: fix panic about slab-out-of-bounds caused =
by ntfs_list_ea()
> > >     24badb9dd8b8 fs/ntfs3: Fix possible null-pointer dereference in h=
dr_find_e()
> > >     ff38d2a705e1 tcp: check mptcp-level constraints for backlog coale=
scing
> > >     582f7993353c x86/sev: Check for user-space IOIO pointing to kerne=
l space
> > >     5c2c01be809d x86/sev: Check IOBM for IOIO exceptions from user-sp=
ace
> > >     6797c6d09e50 x86/sev: Disable MMIO emulation from user mode
> > >     0b4e772a6a89 KVM: x86: Mask LVTPC when handling a PMI
> > >     f61c43be1eb9 regmap: fix NULL deref on lookup
> > >     ffdc881f6807 nfc: nci: fix possible NULL pointer dereference in s=
end_acknowledge()
> > >     d42aeae14fc4 ice: reset first in crash dump kernels
> > >     e42cecb513af ice: fix over-shifted variable
> > >     f6c093b97761 Bluetooth: avoid memcmp() out of bounds warning
> > >     e5f8b43c9c90 Bluetooth: hci_event: Fix coding style
> > >     1597c1ed0e7d Bluetooth: vhci: Fix race when opening vhci device
> > >     1ef071526848 Bluetooth: Fix a refcnt underflow problem for hci_co=
nn
> > >     dd6b62fdd245 Bluetooth: Reject connection with the device which h=
as same BD_ADDR
> > >     848a05c4423f Bluetooth: hci_event: Ignore NULL link key
> > >     e7a2aa7770d3 xfs: don't expose internal symlink metadata buffers =
to the vfs
> > >     fe5c6fbc5e4a Documentation: sysctl: align cells in second content=
 column
> > >     1815844652cc lib/Kconfig.debug: do not enable DEBUG_PREEMPT by de=
fault
> > >     00c03985402e Linux 5.15.136
> > >     5266b5b6e975 eth: remove remaining copies of the NAPI_POLL_WEIGHT=
 define
> > >     528f0ba9f7a4 usb: hub: Guard against accesses to uninitialized BO=
S descriptors
> > >     542a3f1a3cc1 Revert "kernel/sched: Modify initial boot task idle =
setup"
> > >     737ce5518a9c arm64: armv8_deprecated: fix unused-function error
> > >     2e10931e2d77 arm64: armv8_deprecated: rework deprected instructio=
n handling
> > >     abd4aa081905 arm64: armv8_deprecated: move aarch32 helper earlier
> > >     f10abdb04c3d arm64: armv8_deprecated move emulation functions
> > >     0b4eec015fa5 arm64: armv8_deprecated: fold ops into insn_emulatio=
n
> > >     a8d2910be6f8 arm64: rework EL0 MRS emulation
> > >     057f9123b1a8 arm64: factor insn read out of call_undef_hook()
> > >     3f82927cabaf arm64: factor out EL1 SSBS emulation hook
> > >     474385adcd84 arm64: split EL0/EL1 UNDEF handlers
> > >     de0358635401 arm64: allow kprobes on EL0 handlers
> > >     7154e2db8890 arm64: rework BTI exception handling
> > >     cd5ceadc2b37 arm64: rework FPAC exception handling
> > >     b6358002fd0c arm64: consistently pass ESR_ELx to die()
> > >     7ddb1ef2bb42 arm64: die(): pass 'err' as long
> > >     9a3e177ef570 arm64: report EL1 UNDEFs better
> > >     d6808be3ff94 powerpc/64e: Fix wrong test in __ptep_test_and_clear=
_young()
> > >     9c0dc3e2c996 powerpc/8xx: Fix pte_access_permitted() for PAGE_NON=
E
> > >     4da05eba66e6 dmaengine: mediatek: Fix deadlock caused by synchron=
ize_irq()
> > >     82f61b2d5187 dmaengine: idxd: use spin_lock_irqsave before wait_e=
vent_lock_irq
> > >     ecba5afe86f3 x86/alternatives: Disable KASAN in apply_alternative=
s()
> > >     cbd2aac00498 usb: cdnsp: Fixes issue with dequeuing not queued re=
quests
> > >     7014807fb7ef usb: gadget: ncm: Handle decoding of multiple NTB's =
in unwrap call
> > >     50259cf71a1b usb: gadget: udc-xilinx: replace memcpy with memcpy_=
toio
> > >     308f19249641 counter: microchip-tcb-capture: Fix the use of inter=
nal GCLK logic
> > >     5a6ce81d7c16 pinctrl: avoid unsafe code pattern in find_pinctrl()
> > >     1c790191cab4 cgroup: Remove duplicates in cgroup v1 tasks file
> > >     1680c82929bc tee: amdtee: fix use-after-free vulnerability in amd=
tee_close_session
> > >     b8ec40a90acd Input: goodix - ensure int GPIO is in input for gpio=
_count =3D=3D 1 && gpio_int_idx =3D=3D 0 case
> > >     d092630e8a20 Input: i8042 - add Fujitsu Lifebook E5411 to i8042 q=
uirk table
> > >     7cea6fa2d73f Input: xpad - add PXN V900 support
> > >     6ff4e50e2d2a Input: psmouse - fix fast_reconnect function for PS/=
2 mode
> > >     6a4a39638640 Input: powermate - fix use-after-free in powermate_c=
onfig_complete
> > >     6ad7f52d8c58 ceph: fix type promotion bug on 32bit systems
> > >     c0c4acd53a98 ceph: fix incorrect revoked caps assert in ceph_fill=
_file_size()
> > >     58f0e6324ec7 libceph: use kernel_connect()
> > >     d727b97f8f2e thunderbolt: Check that lane 1 is in CL0 before enab=
ling lane bonding
> > >     04c38bedd07c thunderbolt: Workaround an IOMMU fault on certain sy=
stems with Intel Maple Ridge
> > >     a586742a3780 mcb: remove is_added flag from mcb_device struct
> > >     4382d1a996e5 x86/cpu: Fix AMD erratum #1485 on Zen4-based CPUs
> > >     763167003a80 ACPI: resource: Skip IRQ override on ASUS ExpertBook=
 B1402CBA
> > >     510d4a01d84c drm/amd/display: Don't set dpms_off for seamless boo=
t
> > >     9cb61ab9f4ca drm/amdgpu: add missing NULL check
> > >     f9a1af37b801 iio: pressure: ms5611: ms5611_prom_is_valid false ne=
gative bug
> > >     09b8ed9547f1 iio: pressure: dps310: Adjust Timeout Settings
> > >     4c80ecef859d iio: pressure: bmp280: Fix NULL pointer exception
> > >     a625de7e5464 usb: musb: Modify the "HWVers" register address
> > >     eb28694f6da8 usb: musb: Get the musb_qh poniter after musb_giveba=
ck
> > >     ee88141873a8 usb: cdns3: Modify the return value of cdns_set_acti=
ve () to void when CONFIG_PM_SLEEP is disabled
> > >     3b2dbc4f3302 usb: dwc3: Soft reset phy on probe for host
> > >     42c56e015653 net: usb: dm9601: fix uninitialized variable use in =
dm9601_mdio_read
> > >     524f45361789 usb: xhci: xhci-ring: Use sysdev for mapping bounce =
buffer
> > >     1d8e7fe85528 xhci: Keep interrupt disabled in initialization unti=
l host is running.
> > >     cb34e3b25c37 dmaengine: stm32-mdma: abort resume if no ongoing tr=
ansfer
> > >     d56dbfe750a8 media: mtk-jpeg: Fix use after free bug due to uncan=
celed work
> > >     5e13e69ddf0d net: release reference to inet6_dev pointer
> > >     aade10d51ddc net: change accept_ra_min_rtr_lft to affect all RA l=
ifetimes
> > >     8f12d2d66cba net: add sysctl accept_ra_min_rtr_lft
> > >     bc9f6cbeb999 workqueue: Override implicit ordered attribute in wo=
rkqueue_apply_unbound_cpumask()
> > >     25dd54b95abf nfc: nci: assert requested protocol is valid
> > >     b2bb3b43b94a pinctrl: renesas: rzn1: Enable missing PINMUX
> > >     c4140dd77c3b net/smc: Fix pos miscalculation in statistics
> > >     d888d3f70b0d net: nfc: fix races in nfc_llcp_sock_get() and nfc_l=
lcp_sock_get_sn()
> > >     249a1fdb95d5 net/mlx5e: Again mutually exclude RX-FCS and RX-port=
-timestamp
> > >     2112cacb38aa ixgbe: fix crash with empty VF macvlan list
> > >     935a15334d77 net: phy: mscc: macsec: reject PN update requests
> > >     667fe9101a3a net: macsec: indicate next pn update when offloading
> > >     2dcb31e65d26 bpf: Fix verifier log for async callback return valu=
es
> > >     6a217af2c67f drm/vmwgfx: fix typo of sizeof argument
> > >     72ef70886556 riscv, bpf: Sign-extend return values
> > >     7795592e0818 riscv, bpf: Factor out emit_call for kernel and bpf =
context
> > >     58941cc742ca xen-netback: use default TX queue size for vifs
> > >     cffdced18af8 eth: remove copies of the NAPI_POLL_WEIGHT define
> > >     5c360eec5332 mlxsw: fix mlxsw_sp2_nve_vxlan_learning_set() return=
 type
> > >     84c6aa0ae5c4 ieee802154: ca8210: Fix a potential UAF in ca8210_pr=
obe
> > >     616761cf9df9 ravb: Fix use-after-free issue in ravb_tx_timeout_wo=
rk()
> > >     30ebd4177593 ravb: Fix up dma_free_coherent() call in ravb_remove=
()
> > >     3f39de2bd1d2 drm/msm/dpu: change _dpu_plane_calc_bw() to use u64 =
to avoid overflow
> > >     85ae07d4dcc6 drm/msm/dsi: fix irq_of_parse_and_map() error checki=
ng
> > >     9a890c7d4d0f drm/msm/dsi: skip the wait for video mode done if no=
t applicable
> > >     b9de60b6830c drm/msm/dp: do not reinitialize phy unless retry dur=
ing link training
> > >     afe5f596b588 KEYS: trusted: Remove redundant static calls usage
> > >     20e73ece06b3 KEYS: trusted: allow use of kernel RNG for key mater=
ial
> > >     a01d68b6c666 ALSA: usb-audio: Fix microphone sound on Opencomm2 H=
eadset
> > >     5b5e58299eac net: prevent address rewrite in kernel_bind()
> > >     56e96b38d2f7 quota: Fix slow quotaoff
> > >     28ddc1e0b898 HID: logitech-hidpp: Fix kernel crash on receiver US=
B disconnect
> > >     b930f0f7bbc2 lib/test_meminit: fix off-by-one error in test_pages=
()
> > >     982bd86fd659 platform/x86: hp-wmi:: Mark driver struct with __ref=
data to prevent section mismatch warning
> > >     124cf0ea4b82 platform/x86: think-lmi: Fix reference leak
> > >     3d2a16f878f0 of: overlay: Reorder struct fragment fields kerneldo=
c
> > >     10f4a0b6657e perf/arm-cmn: Fix the unhandled overflow status of c=
ounter 4 to 7
> > >     b7966e2191d0 RDMA/cxgb4: Check skb value for failure to allocate
> > >     b9bdffb3f9aa RDMA/srp: Do not call scsi_done() from srp_abort()
> > >     7d4999589ebc scsi: ib_srp: Call scsi_done() directly
> > >     d2746cdfd5e5 scsi: core: Rename scsi_mq_done() into scsi_done() a=
nd export it
> > >     8f2350e204da scsi: core: Use a structure member to track the SCSI=
 command submitter
> > >     29298c85a81a iommu/vt-d: Avoid memory allocation in iommu_suspend=
()
> > >     02e21884dcf2 Linux 5.15.135
> > >     c8af81a9d36e xen/events: replace evtchn_rwlock with RCU
> > >     c346494ec7f1 parisc: Restore __ldcw_align for PA-RISC 2.0 process=
ors
> > >     694e13732e83 ksmbd: fix uaf in smb20_oplock_break_ack
> > >     e914c3a47e45 RDMA/mlx5: Fix NULL string error
> > >     81b7bf367eea RDMA/siw: Fix connection failure handling
> > >     5d8bd138204f RDMA/uverbs: Fix typo of sizeof argument
> > >     60c9ed88526d RDMA/cma: Fix truncation compilation warning in make=
_cma_ports
> > >     7f6136ced1b8 RDMA/cma: Initialize ib_sa_multicast structure to 0 =
when join
> > >     1dd6095fc727 gpio: pxa: disable pinctrl calls for MMP_GPIO
> > >     844fcf4c697c gpio: aspeed: fix the GPIO number passed to pinctrl_=
gpio_set_config()
> > >     1878d6666c32 IB/mlx4: Fix the size of a buffer in add_port_entrie=
s()
> > >     718d9b44afca of: dynamic: Fix potential memory leak in of_changes=
et_action()
> > >     e0878f38b661 RDMA/core: Require admin capabilities to set system =
parameters
> > >     18a839064fc6 dm zoned: free dmz->ddev array in dmz_put_zoned_devi=
ces
> > >     8781fe259dd5 HID: intel-ish-hid: ipc: Disable and reenable ACPI G=
PE bit
> > >     949ccc91c35b HID: sony: remove duplicate NULL check before callin=
g usb_free_urb()
> > >     a02c02adc2bd sctp: update hb timer immediately after users change=
 hb_interval
> > >     7783b471bfce sctp: update transport state when processing a dupco=
ok packet
> > >     1abac613c0d5 tcp: fix delayed ACKs for MSS boundary condition
> > >     821b3b00bc0f tcp: fix quick-ack counting to count actual ACKs of =
new data
> > >     24fb22bddb71 tipc: fix a potential deadlock on &tx->lock
> > >     2e53585e233c net: stmmac: dwmac-stm32: fix resume on STM32 MCU
> > >     74e569324050 ipv4: Set offload_failed flag in fibmatch results
> > >     a4b9bbd1d12f netfilter: nf_tables: nft_set_rbtree: fix spurious i=
nsertion failure
> > >     88497f74d684 netfilter: handle the connecting collision properly =
in nf_conntrack_proto_sctp
> > >     0c9cf5e8807f ibmveth: Remove condition to recompute TCP header ch=
ecksum.
> > >     5a899e2ce848 net: ethernet: ti: am65-cpsw: Fix error code in am65=
_cpsw_nuss_init_tx_chns()
> > >     4837a192f6d0 net: nfc: llcp: Add lock when modifying device list
> > >     cda10784a176 net: usb: smsc75xx: Fix uninit-value access in __sms=
c75xx_read_reg
> > >     2801a1ddb26d net: dsa: mv88e6xxx: Avoid EEPROM timeout when EEPRO=
M is absent
> > >     cb145e6c2070 ptp: ocp: Fix error handling in ptp_ocp_device_init
> > >     cd1189956393 ipv4, ipv6: Fix handling of transhdrlen in __ip{,6}_=
append_data()
> > >     147d89ee4143 net: fix possible store tearing in neigh_periodic_wo=
rk()
> > >     bdb4fcf18e16 modpost: add missing else to the "of" check
> > >     bc8b89b69638 bpf, sockmap: Reject sk_msg egress redirects to non-=
TCP sockets
> > >     9fb4dfb8e212 NFSv4: Fix a nfs4_state_manager() race
> > >     fcdd79fda38a ima: rework CONFIG_IMA dependency block
> > >     b67adca1e1be scsi: target: core: Fix deadlock due to recursive lo=
cking
> > >     9a103e0b100c ima: Finish deprecation of IMA_TRUSTED_KEYRING Kconf=
ig
> > >     bb6aee0696c6 regmap: rbtree: Fix wrong register marked as in-cach=
e when creating new node
> > >     0cee8c1b3af3 wifi: mt76: mt76x02: fix MT76x0 external LNA gain ha=
ndling
> > >     3f6fbbccba2d drivers/net: process the result of hdlc_open() and a=
dd call of hdlc_close() in uhdlc_close()
> > >     ebad2e4c4847 bpf: Fix tr dereferencing
> > >     5afb996349cb wifi: mwifiex: Fix oob check condition in mwifiex_pr=
ocess_rx_packet
> > >     7c8faa310803 wifi: iwlwifi: mvm: Fix a memory corruption issue
> > >     5db7af530ebd iwlwifi: avoid void pointer arithmetic
> > >     6ff75f524dae wifi: iwlwifi: dbg_ini: fix structure packing
> > >     0ea2a6349733 ubi: Refuse attaching if mtd's erasesize is 0
> > >     bb0707fde749 HID: sony: Fix a potential memory leak in sony_probe=
()
> > >     8afbacf61919 arm64: Add Cortex-A520 CPU part definition
> > >     0da6d21ba235 drm/amd: Fix detection of _PR3 on the PCIe root port
> > >     1ad7ccd45a65 net: prevent rewrite of msg_name in sock_sendmsg()
> > >     0fb3df94274b net: replace calls to sock->ops->connect() with kern=
el_connect()
> > >     37b54e8acea5 wifi: mwifiex: Fix tlv_buf_left calculation
> > >     e80f55d6d2a9 qed/red_ll2: Fix undefined behavior bug in struct qe=
d_ll2_info
> > >     1e69422efcc6 vringh: don't use vringh_kiov_advance() in vringh_io=
v_xfer()
> > >     4e2f83952b1d scsi: zfcp: Fix a double put in zfcp_port_enqueue()
> > >     310bca649b30 Revert "clk: imx: pll14xx: dynamically configure PLL=
 for 393216000/361267200Hz"
> > >     3f59e63568ad block: fix use-after-free of q->q_usage_counter
> > >     b75b017b3f37 rbd: take header_rwsem in rbd_dev_refresh() only whe=
n updating
> > >     33229d783466 rbd: decouple parent info read-in from updating rbd_=
dev
> > >     ab73e7ed79d3 rbd: decouple header read-in from updating rbd_dev->=
header
> > >     b4ddad3fb0ea rbd: move rbd_dev_refresh() definition
> > >     bb1fae816c90 iommu/arm-smmu-v3: Avoid constructing invalid range =
commands
> > >     c4edc7b5c836 iommu/arm-smmu-v3: Set TTL invalidation hint better
> > >     a98ad3adf60d arm64: Avoid repeated AA64MMFR1_EL1 register read on=
 pagefault path
> > >     aad6ba1715ec ring-buffer: Fix bytes info in per_cpu buffer stats
> > >     8012d0b05158 ring-buffer: remove obsolete comment for free_buffer=
_page()
> > >     65a218ca516e NFSv4: Fix a state manager thread deadlock regressio=
n
> > >     8454a2f5e930 NFS: rename nfs_client_kset to nfs_kset
> > >     f8b0b6a8e196 NFS: Cleanup unused rpc_clnt variable
> > >     686746be7bfb ASoC: tegra: Fix redundant PLLA and PLLA_OUT0 update=
s
> > >     0a210e63844b ASoC: soc-utils: Export snd_soc_dai_is_dummy() symbo=
l
> > >     b4f7f1556813 spi: zynqmp-gqspi: fix clock imbalance on probe fail=
ure
> > >     e514f897ad66 spi: zynqmp-gqspi: Convert to platform remove callba=
ck returning void
> > >     1edcec18cfb7 Linux 5.15.134
> > >     09a683023785 netfilter: nf_tables: fix kdoc warnings after gc rew=
ork
> > >     66cb6d74f5a1 drm/meson: fix memory leak on ->hpd_notify callback
> > >     91f1f025b6d9 fs: binfmt_elf_efpic: fix personality for ELF-FDPIC
> > >     1cae7473a6dd ata: libata-sata: increase PMP SRST timeout to 10s
> > >     e74adc589922 ata: libata-core: Do not register PM operations for =
SAS ports
> > >     4cbd55a81965 ata: libata-core: Fix port and device removal
> > >     ddc525fffb44 ata: libata-core: Fix ata_port_request_pm() locking
> > >     2990a195edb5 net: thunderbolt: Fix TCPv6 GSO checksum calculation
> > >     132a5ae4136b bpf: Fix BTF_ID symbol generation collision in tools=
/
> > >     58d560e98da5 bpf: Fix BTF_ID symbol generation collision
> > >     f8673f651bc1 btrfs: properly report 0 avail for very full file sy=
stems
> > >     b5d00cd7db66 ring-buffer: Update "shortest_full" in polling
> > >     00d2cb8066cb proc: nommu: /proc/<pid>/maps: release mmap read loc=
k
> > >     40527ebb3e45 Revert "SUNRPC dont update timeout value on connecti=
on reset"
> > >     a2b1d486fb70 io_uring/fs: remove sqe->rw_flags checking from LINK=
AT
> > >     111fe77cb13f sched/rt: Fix live lock between select_fallback_rq()=
 and RT push
> > >     3569ad59664f kernel/sched: Modify initial boot task idle setup
> > >     07f78e97676c i2c: i801: unregister tco_pdev in i801_probe() error=
 path
> > >     70df8b9c59bc ata: libata-scsi: ignore reserved bits for REPORT SU=
PPORTED OPERATION CODES
> > >     a7e0c10a8c33 ALSA: hda: Disable power save for solving pop issue =
on Lenovo ThinkCentre M70q
> > >     0c5fd85fb01f netfilter: nf_tables: disallow rule removal from cha=
in binding
> > >     3936e8714907 nilfs2: fix potential use after free in nilfs_gccach=
e_submit_read_data()
> > >     2b837f13a818 serial: 8250_port: Check IRQ data before use
> > >     a48d2bcd23f2 Revert "tty: n_gsm: fix UAF in gsm_cleanup_mux"
> > >     78e70c6238d2 misc: rtsx: Fix some platforms can not boot and move=
 the l1ss judgment to probe
> > >     f090a8b4d2e3 x86/srso: Add SRSO mitigation for Hygon processors
> > >     f5a604757aa8 iommu/arm-smmu-v3: Fix soft lockup triggered by arm_=
smmu_mm_invalidate_range
> > >     efce75bd2dbc Smack:- Use overlay inode label in smack_inode_copy_=
up()
> > >     0e3450487f99 smack: Retrieve transmuting information in smack_ino=
de_getsecurity()
> > >     3586b3feed1b smack: Record transmuting in smk_transmuted
> > >     9690ad557d94 nvme-pci: always return an ERR_PTR from nvme_pci_all=
oc_dev
> > >     3c29c6e8cd7c scsi: qla2xxx: Fix NULL pointer dereference in targe=
t mode
> > >     6e5e4223c897 i40e: fix potential NULL pointer dereferencing of pf=
->vf i40e_sync_vsi_filters()
> > >     aff3994d4bdd watchdog: iTCO_wdt: Set NO_REBOOT if the watchdog is=
 not already running
> > >     83a30e945571 watchdog: iTCO_wdt: No need to stop the timer in pro=
be
> > >     1e8c573f50a7 nvme-pci: do not set the NUMA node of device if it h=
as none
> > >     182d13dadb03 nvme-pci: factor out a nvme_pci_alloc_dev helper
> > >     af58072e867c nvme-pci: factor the iod mempool creation into a hel=
per
> > >     c8bc44936f2c cgroup: Fix suspicious rcu_dereference_check() usage=
 warning
> > >     ce6b88a5853d sched/cpuacct: Optimize away RCU read lock
> > >     b1deb155524e perf build: Define YYNOMEM as YYNOABORT for bison < =
3.81
> > >     86e65ffc4d0f fbdev/sh7760fb: Depend on FB=3Dy
> > >     4bf0044fe43f ncsi: Propagate carrier gain/loss events to the NCSI=
 controller
> > >     288990ec3580 powerpc/watchpoints: Annotate atomic context in more=
 places
> > >     47a94e87f00c powerpc/watchpoint: Disable pagefaults when getting =
user instruction
> > >     7eb09f70d9c2 powerpc/watchpoints: Disable preemption in thread_ch=
ange_pc()
> > >     134b01a39077 media: vb2: frame_vector.c: replace WARN_ONCE with a=
 comment
> > >     baf7cf0fdb83 ASoC: imx-rpmsg: Set ignore_pmdown_time for dai_link
> > >     9da93c74490c bpf: Clarify error expectations from bpf_clone_redir=
ect
> > >     e1a8b79ad768 ASoC: fsl: imx-pcm-rpmsg: Add SNDRV_PCM_INFO_BATCH f=
lag
> > >     45e028accbdf spi: stm32: add a delay before SPI disable
> > >     25850bf83dcd spi: nxp-fspi: reset the FLSHxCR1 registers
> > >     50662d21e414 ata: libata-eh: do not clear ATA_PFLAG_EH_PENDING in=
 ata_eh_reset()
> > >     8e3cdab909db smb3: correct places where ENOTSUPP is used instead =
of preferred EOPNOTSUPP
> > >     d540a4370aba scsi: pm80xx: Avoid leaking tags when processing OPC=
_INB_SET_CONTROLLER_CONFIG command
> > >     fde57d7ba9b3 scsi: pm80xx: Use phy-specific SAS address when send=
ing PHY_START command
> > >     a1589abd7c4a drm/amdgpu: Handle null atom context in VBIOS info i=
octl
> > >     fd334cfd8412 drm/amd/display: Don't check registers, if using AUX=
 BL control
> > >     a8bc0f6357af platform/mellanox: mlxbf-bootctl: add NET dependency=
 into Kconfig
> > >     344f2f3e61a9 ring-buffer: Do not attempt to read past "commit"
> > >     3db9b420709b selftests: fix dependency checker script
> > >     4aa90e624c30 btrfs: improve error message after failure to add de=
layed dir index item
> > >     53e7c559b7bf ring-buffer: Avoid softlockup in ring_buffer_resize(=
)
> > >     b4874f72cf57 selftests/ftrace: Correctly enable event in instance=
-event.tc
> > >     8c5c9ecbfa8d scsi: ufs: core: Move __ufshcd_send_uic_cmd() outsid=
e host_lock
> > >     e08e61d50a30 scsi: qedf: Add synchronization between I/O completi=
ons and abort
> > >     ada7fcba2d6a parisc: irq: Make irq_stack_union static to avoid sp=
arse warning
> > >     b7e376a26b0c parisc: drivers: Fix sparse warning
> > >     d8c6fad00282 parisc: iosapic.c: Fix sparse warnings
> > >     1ecdcfec4e4a parisc: sba: Fix compile warning wrt list of SBA dev=
ices
> > >     bd1ec7f9983b spi: sun6i: fix race between DMA RX transfer complet=
ion and RX FIFO drain
> > >     ff05ed4ae214 spi: sun6i: reduce DMA RX transfer width to single b=
yte
> > >     ac0d06809934 dma-debug: don't call __dma_entry_alloc_check_leak()=
 under free_entries_lock
> > >     d938c3d278d5 i2c: npcm7xx: Fix callback completion ordering
> > >     0c615323a745 gpio: pmic-eic-sprd: Add can_sleep flag for PMIC EIC=
 chip
> > >     2a47ee15a6ab soc: imx8m: Enable OCOTP clock for imx8mm before rea=
ding registers
> > >     7c59b882b9b3 xtensa: boot/lib: fix function prototypes
> > >     70460e81e2d1 xtensa: boot: don't add include-dirs
> > >     bc51434b6612 xtensa: iss/network: make functions static
> > >     8e0f78a84f64 xtensa: add default definition for XCHAL_HAVE_DIV32
> > >     be57fc50dc3c firmware: imx-dsp: Fix an error handling path in imx=
_dsp_setup_channels()
> > >     1df81ea9e4db power: supply: ucs1002: fix error code in ucs1002_ge=
t_property()
> > >     6937e44ffb91 bus: ti-sysc: Fix SYSC_QUIRK_SWSUP_SIDLE_ACT handlin=
g for uart wake-up
> > >     0e75aa86a7d0 ARM: dts: ti: omap: motorola-mapphone: Fix abe_clkct=
rl warning on boot
> > >     1b39eae11752 ARM: dts: ti: omap: Fix bandgap thermal cells addres=
sing for omap3/4
> > >     fcbf770c66ef ARM: dts: omap: correct indentation
> > >     f5e12de36ab3 treewide: Replace GPLv2 boilerplate/reference with S=
PDX - gpl-2.0_56.RULE (part 1)
> > >     6829bc7978e0 clk: tegra: fix error return case for recalc_rate
> > >     78277b096d4c bus: ti-sysc: Fix missing AM35xx SoC matching
> > >     5435a49b3b66 bus: ti-sysc: Use fsleep() instead of usleep_range()=
 in sysc_reset()
> > >     c39df101d8ca drm/bridge: ti-sn65dsi83: Do not generate HFP/HBP/HS=
A and EOT packet
> > >     4bf10fd51ca5 MIPS: Alchemy: only build mmc support helpers if au1=
xmmc is enabled
> > >     d2640d86876e btrfs: reset destination buffer when read_extent_buf=
fer() gets invalid range
> > >     1a541999f31f scsi: qla2xxx: Use raw_smp_processor_id() instead of=
 smp_processor_id()
> > >     532a23960566 scsi: qla2xxx: Select qpair depending on which CPU p=
ost_cmd() gets called
> > >     6642b4eb083b ata: ahci: Add Elkhart Lake AHCI controller
> > >     072611960741 ata: ahci: Rename board_ahci_mobile
> > >     8274154712a0 ata: ahci: Add support for AMD A85 FCH (Hudson D4)
> > >     bd69c74dca70 ata: libata: Rename link flag ATA_LFLAG_NO_DB_DELAY
> > >     f5ba6d9d6bec netfilter: nft_exthdr: Fix non-linear header modific=
ation
> > >     7ca3a1b0f474 netfilter: exthdr: add support for tcp option remova=
l
> > >     fb6f65780c9c Input: i8042 - add quirk for TUXEDO Gemini 17 Gen1/C=
levo PD70PN
> > >     191fc23cfa9a Input: i8042 - rename i8042-x86ia64io.h to i8042-acp=
ipnpio.h
> > >     5d2b57c0bc40 xfs: fix xfs_inodegc_stop racing with mod_delayed_wo=
rk
> > >     657f842859c4 xfs: disable reaping in fscounters scrub
> > >     8444467eadb2 xfs: check that per-cpu inodegc workers actually run=
 on that cpu
> > >     67db9ecb84d5 xfs: explicitly specify cpu when forcing inodegc del=
ayed work to run immediately
> > >     99e65f075e6c xfs: introduce xfs_inodegc_push()
> > >     2df381963240 xfs: bound maximum wait time for inodegc work
> > >     08dc21596751 i2c: mux: gpio: Add missing fwnode_handle_put()
> > >     f912d9d87421 i2c: mux: gpio: Replace custom acpi_get_local_addres=
s()
> > >     1aa39eee57f6 i2c: mux: demux-pinctrl: check the return value of d=
evm_kstrdup()
> > >     9910b1411e7e gpio: tb10x: Fix an error handling path in tb10x_gpi=
o_probe()
> > >     d7acb7031758 Fix up backport of 136191703038 ("interconnect: Teac=
h lockdep about icc_bw_lock order")
> > >     d645206e9be2 igc: Expose tx-usecs coalesce setting to user
> > >     d7a2bf6faa82 bnxt_en: Flush XDP for bnxt_poll_nitroa0()'s NAPI
> > >     56d2418a079a net: ena: Flush XDP packets on error.
> > >     07b569051f6e locking/seqlock: Do the lockdep annotation before lo=
cking in do_write_seqcount_begin_nested()
> > >     a70dbdede0c7 netfilter: ipset: Fix race between IPSET_CMD_CREATE =
and IPSET_CMD_SWAP
> > >     0dcc9b4097d8 netfilter: nf_tables: disable toggling dormant table=
 state more than once
> > >     ea82139e6e35 net: rds: Fix possible NULL-pointer dereference
> > >     cd05eec2ee0c team: fix null-ptr-deref when team device type is ch=
anged
> > >     8bc97117b51d net: bridge: use DEV_STATS_INC()
> > >     0d3939cccb20 net: hns3: add 5ms delay before clear firmware reset=
 irq source
> > >     d6d182d856d0 net: hns3: fix fail to delete tc flower rules during=
 reset issue
> > >     7c47b238f4ec net: hns3: only enable unicast promisc when mac tabl=
e full
> > >     96af9a55b782 net: hns3: fix GRE checksum offload issue
> > >     13ea4b92e875 x86/srso: Fix SBPB enablement for spec_rstack_overfl=
ow=3Doff
> > >     e2c34afe8362 x86/srso: Fix srso_show_state() side effect
> > >     21efa88e777f platform/x86: intel_scu_ipc: Fail IPC send if still =
busy
> > >     0a5d236b52cf platform/x86: intel_scu_ipc: Don't override scu in i=
ntel_scu_ipc_dev_simple_command()
> > >     ab78000c38b4 platform/x86: intel_scu_ipc: Check status upon timeo=
ut in ipc_wait_for_interrupt()
> > >     47329633b3f0 platform/x86: intel_scu_ipc: Check status after time=
out in busy_loop()
> > >     26df9ab5de30 dccp: fix dccp_v4_err()/dccp_v6_err() again
> > >     3b14e8431855 powerpc/perf/hv-24x7: Update domain value check
> > >     8860d354f653 ipv4: fix null-deref in ipv4_link_failure
> > >     c196ecd3f893 igc: Fix infinite initialization loop with early XDP=
 redirect
> > >     a2d69dcb6ccb ionic: fix 16bit math issue when PAGE_SIZE >=3D 64KB
> > >     3796e449a03e i40e: Fix VF VLAN offloading when port VLAN is confi=
gured
> > >     a628f3b5cd8d i40e: Add VF VLAN pruning
> > >     7a9eee3b5d4d iavf: do not process adminq tasks when __IAVF_IN_REM=
OVE_TASK is set
> > >     f3c6a17900e8 ASoC: imx-audmix: Fix return error with devm_clk_get=
()
> > >     f90a7b9586d7 net/core: Fix ETH_P_1588 flow dissector
> > >     55629e616452 selftests: tls: swap the TX and RX sockets in some t=
ests
> > >     acabf5df49aa bpf: Avoid deadlock when using queue and stack maps =
from NMI
> > >     c6e44f4c31c5 netfilter: nf_tables: disallow element removal on an=
onymous sets
> > >     6a8de7775329 ASoC: meson: spdifin: start hw on dai probe
> > >     ef99506eaf1d netfilter: nf_tables: fix memleak when more than 255=
 elements expired
> > >     8d7a00b904da netfilter: nft_set_hash: try later when GC hits EAGA=
IN on iteration
> > >     83d3a4607c58 netfilter: nft_set_pipapo: stop GC iteration if GC t=
ransaction allocation fails
> > >     949369f9f0d9 netfilter: nft_set_pipapo: call nft_trans_gc_queue_s=
ync() in catchall GC
> > >     2e6846b613fa netfilter: nft_set_rbtree: use read spinlock to avoi=
d datapath contention
> > >     9af7dfb3c9d7 netfilter: nft_set_rbtree: skip sync GC for new elem=
ents in this transaction
> > >     9366966caf1a netfilter: nf_tables: defer gc run if previous batch=
 is still pending
> > >     082791b42123 netfilter: nf_tables: use correct lock to protect gc=
_list
> > >     b44a459c6561 netfilter: nf_tables: GC transaction race with abort=
 path
> > >     24707fa1e1f9 netfilter: nf_tables: GC transaction race with netns=
 dismantle
> > >     6796800f0d8e netfilter: nf_tables: fix GC transaction races with =
netns and netlink event exit path
> > >     af78b0489e88 netfilter: nf_tables: don't fail inserts if duplicat=
e has expired
> > >     8f24fe69e3ca netfilter: nf_tables: remove busy mark and gc batch =
API
> > >     b290795bd26f netfilter: nft_set_hash: mark set element as dead wh=
en deleting from packet path
> > >     479a2cf52593 netfilter: nf_tables: adapt set backend to use GC tr=
ansaction API
> > >     d19e8bf3ea41 netfilter: nf_tables: GC transaction API to avoid ra=
ce with control plane
> > >     7c7e658a36f8 netfilter: nf_tables: don't skip expired elements du=
ring walk
> > >     a2d1125ee04e tracing: Have event inject files inc the trace array=
 ref count
> > >     6b6c088c38f7 ext4: do not let fstrim block system suspend
> > >     a9d3bb58da95 ext4: move setting of trimmed bit into ext4_try_to_t=
rim_range()
> > >     d91abea15c61 ext4: replace the traditional ternary conditional op=
erator with with max()/min()
> > >     656f0495e4ac ext4: change s_last_trim_minblks type to unsigned lo=
ng
> > >     be57857fb3c3 ext4: scope ret locally in ext4_try_to_trim_range()
> > >     e832b55881a1 ata: libahci: clear pending interrupt status
> > >     f6189f373151 ata: ahci: Drop pointless VPRINTK() calls and conver=
t the remaining ones
> > >     fa6d449e4d02 tracing: Increase trace array ref count on enable an=
d filter files
> > >     7a688f191a17 tracing: Make trace_marker{,_raw} stream-like
> > >     68fc0e75c793 NFSv4.1: fix pnfs MDS=3DDS session trunking
> > >     0ff78c455494 NFSv4.1: use EXCHGID4_FLAG_USE_PNFS_DS for DS server
> > >     d381bfe13895 SUNRPC: Mark the cred for revalidation if the server=
 rejects it
> > >     f1c434ddafe6 NFS/pNFS: Report EINVAL errors from connect() to the=
 server
> > >     0c0a7e1f2a6a NFS: More fixes for nfs_direct_write_reschedule_io()
> > >     a354b4a367f5 NFS: Use the correct commit info in nfs_join_page_gr=
oup()
> > >     b911329317b4 Linux 5.15.133
> > >     e3a29b80e9e6 interconnect: Teach lockdep about icc_bw_lock order
> > >     c6244cd00c97 drm/amd/display: enable cursor degamma for DCN3+ DRM=
 legacy gamma
> > >     08569c92f7f3 net/sched: Retire rsvp classifier
> > >     6b080fa8aae1 drm/amdgpu: fix amdgpu_cs_p1_user_fence
> > >     6386a2d4dc01 drm/amd/display: fix the white screen issue when >=
=3D 64GB DRAM
> > >     e04b7073bdce ext4: fix rec_len verify error
> > >     93763d58705a scsi: pm8001: Setup IRQs on resume
> > >     72a22696cf19 scsi: megaraid_sas: Fix deadlock on firmware crashdu=
mp
> > >     54603e8a88bc ata: libata: disallow dev-initiated LPM transitions =
to unsupported states
> > >     01c7c38a90bc i2c: aspeed: Reset the i2c controller when timeout o=
ccurs
> > >     763d39f4e8fb tracefs: Add missing lockdown check to tracefs_creat=
e_dir()
> > >     bf195968e362 nfsd: fix change_info in NFSv4 RENAME replies
> > >     bf38c1d29f8b tracing: Have option files inc the trace array ref c=
ount
> > >     85ad4688b7a7 tracing: Have current_trace inc the trace array ref =
count
> > >     962e6723239b tracing: Have tracing_max_latency inc the trace arra=
y ref count
> > >     380bbd46d61c btrfs: release path before inode lookup during the i=
no lookup ioctl
> > >     779c3cf2749c btrfs: fix lockdep splat and potential deadlock afte=
r failure running delayed items
> > >     f9c78afcee46 ovl: fix incorrect fdput() on aio completion
> > >     05a7289a5d4b ovl: fix failed copyup of fileattr on a symlink
> > >     8bcb80293be7 attr: block mode changes of symlinks
> > >     d30af15e460f md/raid1: fix error: ISO C90 forbids mixed declarati=
ons
> > >     abdfde037712 samples/hw_breakpoint: fix building without module u=
nloading
> > >     58787ff3d023 x86/purgatory: Remove LTO flags
> > >     8abf1ec895d5 x86/boot/compressed: Reserve more memory for page ta=
bles
> > >     e1a27664fcf5 scsi: lpfc: Fix the NULL vs IS_ERR() bug for debugfs=
_create_file()
> > >     f0fd24f1fae0 selftests: tracing: Fix to unmount tracefs for recov=
ering environment
> > >     dded6b81ad68 scsi: qla2xxx: Fix NULL vs IS_ERR() bug for debugfs_=
create_dir()
> > >     1d5caeac9655 drm: gm12u320: Fix the timeout usage for usb_bulk_ms=
g()
> > >     b9f0572b38c1 btrfs: compare the correct fsid/metadata_uuid in btr=
fs_validate_super
> > >     cba491ee38e2 btrfs: add a helper to read the superblock metadata_=
uuid
> > >     cb3671a2eeac btrfs: move btrfs_pinned_by_swapfile prototype into =
volumes.h
> > >     f16fe29368fd perf test shell stat_bpf_counters: Fix test on Intel
> > >     ad73216e006f perf test: Remove bash construct from stat_bpf_count=
ers.sh test
> > >     d8f81baeb9eb MIPS: Use "grep -E" instead of "egrep"
> > >     dfe961b1e476 mtd: rawnand: brcmnand: Fix ECC level field setting =
for v7.2 controller
> > >     56cf9f446b33 mtd: rawnand: brcmnand: Allow SoC to provide I/O ope=
rations
> > >     34fcb59437a7 jbd2: correct the end of the journal recovery scan r=
ange
> > >     a4605449cc9f jbd2: rename jbd_debug() to jbd2_debug()
> > >     db6c90f2671c jbd2: kill t_handle_lock transaction spinlock
> > >     e9270898222a jbd2: fix use-after-free of transaction_t race
> > >     b0412dd1c24b jbd2: refactor wait logic for transaction updates in=
to a common function
> > >     f980bf1586ef printk: Consolidate console deferred printing
> > >     9be2957f014d interconnect: Fix locking for runpm vs reclaim
> > >     f3f6bf22a4f5 kobject: Add sanity check for kset->kobj.ktype in ks=
et_register()
> > >     81bbe6667024 media: pci: ipu3-cio2: Initialise timing struct to a=
void a compiler warning
> > >     d4ef3c9c7947 usb: ehci: add workaround for chipidea PORTSC.PEC bu=
g
> > >     c829d25e26fb serial: cpm_uart: Avoid suspicious locking
> > >     5353df78c226 scsi: target: iscsi: Fix buffer overflow in lio_targ=
et_nacl_info_show()
> > >     b97aaf9faf89 tools: iio: iio_generic_buffer: Fix some integer typ=
e and calculation
> > >     60a71fd1910e usb: gadget: fsl_qe_udc: validate endpoint index for=
 ch9 udc
> > >     c861a61be6d3 usb: cdns3: Put the cdns set active part outside the=
 spin lock
> > >     930c60e13947 media: pci: cx23885: replace BUG with error return
> > >     48bb6a9fa5cb media: tuners: qt1010: replace BUG_ON with a regular=
 error
> > >     2a33fc57133d media: dvb-usb-v2: gl861: Fix null-ptr-deref in gl86=
1_i2c_master_xfer
> > >     5b1ea100ad36 media: az6007: Fix null-ptr-deref in az6007_i2c_xfer=
()
> > >     3dd5846a8739 media: anysee: fix null-ptr-deref in anysee_master_x=
fer
> > >     033b0c0780ad media: af9005: Fix null-ptr-deref in af9005_i2c_xfer
> > >     903566208ae6 media: dw2102: Fix null-ptr-deref in dw2102_i2c_tran=
sfer()
> > >     d9ef84a7c222 media: dvb-usb-v2: af9035: Fix null-ptr-deref in af9=
035_i2c_master_xfer
> > >     ca49cef3acaa PCI: fu740: Set the number of MSI vectors
> > >     d35e7ae10eb8 powerpc/pseries: fix possible memory leak in ibmebus=
_bus_init()
> > >     46870eea5496 ARM: 9317/1: kexec: Make smp stop calls asynchronous
> > >     ef7311101ca4 jfs: fix invalid free of JFS_IP(ipimap)->i_imap in d=
iUnmount
> > >     aa5b019a3e0f fs/jfs: prevent double-free in dbUnmount() after fai=
led jfs_remount()
> > >     7ac65c29b6c2 ext2: fix datatype of block number in ext2_xattr_set=
2()
> > >     4f96c0665f9f md: raid1: fix potential OOB in raid1_remove_disk()
> > >     f3e9fc7b02b9 bus: ti-sysc: Configure uart quirks for k3 SoC
> > >     3157aa794c75 drm/exynos: fix a possible null-pointer dereference =
due to data race in exynos_drm_crtc_atomic_disable()
> > >     78bc9d25997a drm/amd/display: Blocking invalid 420 modes on HDMI =
TMDS for DCN31
> > >     5eca70c14b31 ALSA: hda: intel-dsp-cfg: add LunarLake support
> > >     e8ba418d4926 samples/hw_breakpoint: Fix kernel BUG 'invalid opcod=
e: 0000'
> > >     961df5a3f5cc arm64: dts: qcom: sm8250-edo: correct ramoops pmsg-s=
ize
> > >     49cd54900078 arm64: dts: qcom: sm8150-kumano: correct ramoops pms=
g-size
> > >     1e0a38bb840a arm64: dts: qcom: sm6125-pdx201: correct ramoops pms=
g-size
> > >     201071956ec6 drm/bridge: tc358762: Instruct DSI host to generate =
HSE packets
> > >     c64ee9dd3358 wifi: mac80211_hwsim: drop short frames
> > >     66594a1e6ddd netfilter: ebtables: fix fortify warnings in size_en=
try_mwt()
> > >     fedd9377dd9c wifi: mac80211: check S1G action frame size
> > >     e08333e2abae alx: fix OOB-read compiler warning
> > >     2b0a093cdf59 mmc: sdhci-esdhc-imx: improve ESDHC_FLAG_ERR010450
> > >     0a1f87f0ca76 tpm_tis: Resend command to recover from data transfe=
r errors
> > >     67589d247909 crypto: lib/mpi - avoid null pointer deref in mpi_cm=
p_ui()
> > >     389106425dee wifi: wil6210: fix fortify warnings
> > >     ddb8f358b5e0 wifi: mwifiex: fix fortify warning
> > >     a7ebe459c72e wifi: ath9k: fix printk specifier
> > >     3de6b6ab69e2 wifi: ath9k: fix fortify warnings
> > >     6b0adfafb073 crypto: lrw,xts - Replace strlcpy with strscpy
> > >     dc100292e503 devlink: remove reload failed checks in params get/s=
et callbacks
> > >     7b7964cd9db3 ACPI: x86: s2idle: Catch multiple ACPI_TYPE_PACKAGE =
objects
> > >     eda268b5b7ad hw_breakpoint: fix single-stepping when using bpf_ov=
erflow_handler
> > >     6e743b7261ef perf/imx_ddr: speed up overflow frequency of cycle
> > >     f9a2c79c2970 perf/smmuv3: Enable HiSilicon Erratum 162001900 quir=
k for HIP08/09
> > >     ed1afb597280 ACPI: video: Add backlight=3Dnative DMI quirk for Le=
novo Ideapad Z470
> > >     f685311dbe05 scftorture: Forgive memory-allocation failure if KAS=
AN
> > >     4f03fba096bf rcuscale: Move rcu_scale_writer() schedule_timeout_u=
ninterruptible() to _idle()
> > >     f1ceff37ac6b kernel/fork: beware of __put_task_struct() calling c=
ontext
> > >     430787056dd3 ACPICA: Add AML_NO_OPERAND_RESOLVE flag to Timer
> > >     766e56faddbe locks: fix KASAN: use-after-free in trace_event_raw_=
event_filelock_lock
> > >     6994f806c6d1 btrfs: output extra debug info if we failed to find =
an inline backref
> > >     71eeddcad734 autofs: fix memory leak of waitqueues in autofs_cata=
tonic_mode
> > >     35ecaa3632bf Linux 5.15.132
> > >     0c0d79f3366a pcd: fix error codes in pcd_init_unit()
> > >     893978f1b4d1 drm/amd/display: Fix a bug when searching for insert=
_above_mpcc
> > >     0b8e09b39ef3 MIPS: Only fiddle with CHECKFLAGS if `need-compiler'
> > >     55d2e7c1ab8e kcm: Fix error handling for SOCK_DGRAM in kcm_sendms=
g().
> > >     e80228b27487 ixgbe: fix timestamp configuration code
> > >     5b55dac919ec ipv6: fix ip6_sock_set_addr_preferences() typo
> > >     481bd6dcc5fe net/tls: do not free tls_rec on async operation in b=
pf_exec_tx_verdict()
> > >     3600c0dc0deb platform/mellanox: mlxbf-pmc: Fix reading of unprogr=
ammed events
> > >     07c0abc80604 platform/mellanox: mlxbf-pmc: Fix potential buffer o=
verflows
> > >     7c34ea34516d platform/mellanox: mlxbf-tmfifo: Drop jumbo frames
> > >     694035201aac platform/mellanox: mlxbf-tmfifo: Drop the Rx packet =
if no more descriptors
> > >     97275339c34c kcm: Fix memory leak in error path of kcm_sendmsg()
> > >     864da4a5d5eb r8152: check budget for r8152_poll()
> > >     fbdc4e9908b2 net: dsa: sja1105: hide all multicast addresses from=
 "bridge fdb show"
> > >     6a4480c5e6eb hsr: Fix uninit-value access in fill_frame_info()
> > >     072324cfab9b net: ethernet: mtk_eth_soc: fix possible NULL pointe=
r dereference in mtk_hwlro_get_fdir_all()
> > >     5bb09dddc724 net: ethernet: mvpp2_main: fix possible OOB write in=
 mvpp2_ethtool_get_rxnfc()
> > >     06b4934ab2b5 net/smc: use smc_lgr_list.lock to protect smc_lgr_li=
st.list iterate in smcr_port_add
> > >     aea3801c234d kselftest/runner.sh: Propagate SIGTERM to runner chi=
ld
> > >     2f1e86014d0c net: ipv4: fix one memleak in __inet_del_ifa()
> > >     f086e859ddc2 ARM: dts: BCM5301X: Extend RAM to full 256MB for Lin=
ksys EA6500 V2
> > >     8173d9027031 ARM: dts: samsung: exynos4210-i9100: Fix LCD screen'=
s physical size
> > >     072cd213c64f block: don't add or resize partition on the disk wit=
h GENHD_FL_NO_PART
> > >     c6ce1c5dd327 block: rename GENHD_FL_NO_PART_SCAN to GENHD_FL_NO_P=
ART
> > >     6c06a7f6b41c block: move GENHD_FL_BLOCK_EVENTS_ON_EXCL_WRITE to d=
isk->event_flags
> > >     8247ff0d5036 block: move GENHD_FL_NATIVE_CAPACITY to disk->state
> > >     5ad42b999a42 pcd: cleanup initialization
> > >     7607bc7fe6cc pcd: move the identify buffer into pcd_identify
> > >     242bbe218814 perf hists browser: Fix the number of entries for 'e=
' key
> > >     4d7a8a44e030 perf tools: Handle old data in PERF_RECORD_ATTR
> > >     a8f91f480c62 perf hists browser: Fix hierarchy mode header
> > >     4ee1cf2a5bcc MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS `modules_inst=
all' regression
> > >     df4d8d5ab647 drm/amd/display: prevent potential division by zero =
errors
> > >     3b51d016bbbf mtd: rawnand: brcmnand: Fix potential false time out=
 warning
> > >     2353b7bb61e4 mtd: rawnand: brcmnand: Fix potential out-of-bounds =
access in oob write
> > >     b59ff750bf80 mtd: rawnand: brcmnand: Fix crash during the panic_w=
rite
> > >     ca5218aef9e5 btrfs: use the correct superblock to compare fsid in=
 btrfs_validate_super
> > >     f3260733894a btrfs: don't start transaction when joining with TRA=
NS_JOIN_NOSTART
> > >     7ef0e8b812e0 btrfs: free qgroup rsv on io failure
> > >     5fd6f40d17e8 fuse: nlookup missing decrement in fuse_direntplus_l=
ink
> > >     65b6890c3d01 ata: pata_ftide010: Add missing MODULE_DESCRIPTION
> > >     0b62825dc6c3 ata: sata_gemini: Add missing MODULE_DESCRIPTION
> > >     81dd61cb1caa ata: pata_falcon: fix IO base selection for Q40
> > >     20bc2c470369 lib: test_scanf: Add explicit type cast to result in=
itialization in test_number_prefix()
> > >     4315b4a95ecf ext4: add correct group descriptors and reserved GDT=
 blocks to system zone
> > >     ef5fea70e591 jbd2: check 'jh->b_transaction' before removing it f=
rom checkpoint
> > >     6778a3857266 jbd2: fix checkpoint cleanup performance regression
> > >     6b195e07a2cf dmaengine: sh: rz-dmac: Fix destination and source d=
ata size setting
> > >     0476f2016ddc ARC: atomics: Add compiler barrier to atomic operati=
ons...
> > >     3375186d5e3f net/mlx5: Free IRQ rmap and notifier on kernel shutd=
own
> > >     2348a375ee16 sh: boards: Fix CEU buffer size passed to dma_declar=
e_coherent_memory()
> > >     f5160dc17e81 net: hns3: remove GSO partial feature bit
> > >     6d548b7cb216 net: hns3: fix the port information display when sfp=
 is absent
> > >     cc3c67e08169 net: hns3: fix invalid mutex between tc qdisc and dc=
b ets command issue
> > >     2c9643fa6360 net: hns3: fix debugfs concurrency issue between kfr=
ee buffer and read
> > >     8bfa87cf4a86 net: hns3: fix byte order conversion issue in hclge_=
dbg_fd_tcam_read()
> > >     19280e8dfb52 netfilter: nfnetlink_osf: avoid OOB read
> > >     1ad7b189cc14 netfilter: nftables: exthdr: fix 4-byte stack OOB wr=
ite
> > >     347f765176db net: dsa: sja1105: complete tc-cbs offload support o=
n SJA1110
> > >     cb4494cfe4b7 net: dsa: sja1105: fix -ENOSPC when replacing the sa=
me tc-cbs too many times
> > >     77b850b84d21 net: dsa: sja1105: fix bandwidth discrepancy between=
 tc-cbs software and offload
> > >     d11109c03d6e ip_tunnels: use DEV_STATS_INC()
> > >     fcfb5842ef9c idr: fix param name in idr_alloc_cyclic() doc
> > >     131cd74a8e38 s390/zcrypt: don't leak memory if dev_set_name() fai=
ls
> > >     12de76fdddb5 igb: Change IGB_MIN to allow set rx/tx value between=
 64 and 80
> > >     7c2f90b1c213 igbvf: Change IGBVF_MIN to allow set rx/tx value bet=
ween 64 and 80
> > >     f4c5640d6d38 igc: Change IGC_MIN to allow set rx/tx value between=
 64 and 80
> > >     9210b3dd74ac octeontx2-af: Fix truncation of smq in CN10K NIX AQ =
enqueue mbox handler
> > >     1840f08c2a1b kcm: Destroy mutex in kcm_exit_net()
> > >     6ea277b2c626 net: sched: sch_qfq: Fix UAF in qfq_dequeue()
> > >     3868de7c5361 af_unix: Fix data race around sk->sk_err.
> > >     d95456660fae af_unix: Fix data-races around sk->sk_shutdown.
> > >     e5edc6e44a88 af_unix: Fix data-race around unix_tot_inflight.
> > >     9151ed4b0061 af_unix: Fix data-races around user->unix_inflight.
> > >     907fbed65cec net: phy: micrel: Correct bit assignments for phy_de=
vice flags
> > >     5d2d3f2300c3 net: ipv6/addrconf: avoid integer underflow in ipv6_=
create_tempaddr
> > >     77dd55f5ec6a veth: Fixing transmit return status for dropped pack=
ets
> > >     56603b2c82e3 igb: disable virtualization features on 82580
> > >     149bc7834d6f ipv4: ignore dst hint for multipath routes
> > >     e18b49495a52 drm/i915/gvt: Drop unused helper intel_vgpu_reset_gt=
t()
> > >     5979985f2d6b xsk: Fix xsk_diag use-after-free error during socket=
 cleanup
> > >     49acc5c5b280 net: fib: avoid warn splat in flow dissector
> > >     ed4e0adfa407 net: read sk->sk_family once in sk_mc_loop()
> > >     e0b483a0584f ipv4: annotate data-races around fi->fib_dead
> > >     74df0319e4e2 sctp: annotate data-races around sk->sk_wmem_queued
> > >     973a4c302d7f net/sched: fq_pie: avoid stalls in fq_pie_timer()
> > >     5e22217c1142 pwm: lpc32xx: Remove handling of PWM channels
> > >     676152264dec watchdog: intel-mid_wdt: add MODULE_ALIAS() to allow=
 auto-load
> > >     d6aa2be1379d perf top: Don't pass an ERR_PTR() directly to perf_s=
ession__delete()
> > >     79bd17c99ec9 perf vendor events: Drop some of the JSON/events for=
 power10 platform
> > >     1356eaceef34 perf vendor events: Update the JSON/events descripti=
ons for power10 platform
> > >     24481d5c7413 x86/virt: Drop unnecessary check on extended CPUID l=
evel in cpu_has_svm()
> > >     6e9863165674 perf annotate bpf: Don't enclose non-debug code with=
 an assert()
> > >     184be0d59242 Input: tca6416-keypad - fix interrupt enable disbala=
nce
> > >     0b79f5a19cfb Input: tca6416-keypad - always expect proper IRQ num=
ber in i2c client
> > >     1e3167aa4ba2 backlight: gpio_backlight: Drop output GPIO directio=
n check for initial power state
> > >     6fc8bdc3cf4c pwm: atmel-tcb: Fix resource freeing in error path a=
nd remove
> > >     6b2bb1a1a63c pwm: atmel-tcb: Harmonize resource allocation order
> > >     d4734ef765eb pwm: atmel-tcb: Convert to platform remove callback =
returning void
> > >     c3bc668581e7 perf trace: Really free the evsel->priv area
> > >     8e96f741b328 perf trace: Use zfree() to reduce chances of use aft=
er free
> > >     414cf7a2cc87 kconfig: fix possible buffer overflow
> > >     be9ce0dbde4f gfs2: low-memory forced flush fixes
> > >     751facd3634c gfs2: Switch to wait_event in gfs2_logd
> > >     d0245b066971 kbuild: do not run depmod for 'make modules_sign'
> > >     05333a6a21e3 bus: mhi: host: Skip MHI reset if device is in RDDM
> > >     e2964c98ec31 NFSv4/pnfs: minor fix for cleanup path in nfs4_get_d=
evice_info
> > >     da302f1d476a NFS: Fix a potential data corruption
> > >     0db19df21be5 clk: qcom: mss-sc7180: fix missing resume during pro=
be
> > >     f64f682be7c8 clk: qcom: q6sstop-qcs404: fix missing resume during=
 probe
> > >     b2f39b813d1e soc: qcom: qmi_encdec: Restrict string length in dec=
ode
> > >     e61db8922631 clk: qcom: gcc-mdm9615: use proper parent for pll0_v=
ote clock
> > >     a8474506c912 clk: imx: pll14xx: dynamically configure PLL for 393=
216000/361267200Hz
> > >     a69b951c8398 dt-bindings: clock: xlnx,versal-clk: drop select:fal=
se
> > >     ead2436cf05e pinctrl: cherryview: fix address_space_handler() arg=
ument
> > >     8859f58c1790 parisc: led: Reduce CPU overhead for disk & lan LED =
computation
> > >     2655e1d970cf parisc: led: Fix LAN receive and transmit LEDs
> > >     7ad44409cd3b lib/test_meminit: allocate pages up to order MAX_ORD=
ER
> > >     2d8138cea71d clk: qcom: turingcc-qcs404: fix missing resume durin=
g probe
> > >     9f5db4ab19f8 drm/ast: Fix DRAM init on AST2200
> > >     cfc47807a482 clk: qcom: camcc-sc7180: fix async resume during pro=
be
> > >     309c27162afe fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
> > >     4316e951f164 scsi: qla2xxx: Fix firmware resource tracking
> > >     7b89c3727bff scsi: qla2xxx: Error code did not return to upper la=
yer
> > >     15a71bb25beb scsi: qla2xxx: Fix smatch warn for qla_init_iocb_lim=
it()
> > >     106392156273 scsi: qla2xxx: Flush mailbox commands on chip reset
> > >     def49a05aef4 scsi: qla2xxx: Remove unsupported ql2xenabledif opti=
on
> > >     be12c9f4c60c scsi: qla2xxx: Fix TMF leak through
> > >     4322f3de9f21 scsi: qla2xxx: Fix session hang in gnl
> > >     a4708402c458 scsi: qla2xxx: Turn off noisy message log
> > >     b0453b0cf506 scsi: qla2xxx: Fix erroneous link up failure
> > >     5934b2125f5b scsi: qla2xxx: Fix command flush during TMF
> > >     4a16a46c8481 scsi: qla2xxx: fix inconsistent TMF timeout
> > >     f1ea164be545 scsi: qla2xxx: Fix deletion race condition
> > >     683945b17724 scsi: qla2xxx: Limit TMF to 8 per function
> > >     fde268c234d1 scsi: qla2xxx: Adjust IOCB resource on qpair create
> > >     c29848249f78 io_uring: break iopolling on signal
> > >     0def123f1254 io_uring: break out of iowq iopoll on teardown
> > >     1a0aba2bf293 io_uring: always lock in io_apoll_task_func
> > >     2920cc4c64a1 net/ipv6: SKB symmetric hash should incorporate tran=
sport ports
> > >     529bcc70c49c udf: initialize newblock to 0
> > >     fae2d591f3cb Revert "drm/amdgpu: install stub fence into potentia=
l unused fence pointers"
> > >     f01e21d6c7ed md/md-bitmap: remove unnecessary local variable in b=
acklog_store()
> > >     99a8d14d7965 tracing: Zero the pipe cpumask on alloc to avoid spu=
rious -EBUSY
> > >     05c581ad3e7b perf/x86/uncore: Correct the number of CHAs on EMR
> > >     861cfdc51f22 x86/sgx: Break up long non-preemptible delays in sgx=
_vepc_release()
> > >     7e3ddbea87a9 USB: core: Fix oversight in SuperSpeed initializatio=
n
> > >     7fe9d8799606 USB: core: Fix race by not overwriting udev->descrip=
tor in hub_port_init()
> > >     eda9a2966582 USB: core: Change usb_get_device_descriptor() API
> > >     56c49a3328e9 USB: core: Unite old scheme and new scheme descripto=
r reads
> > >     0ad6bad31da6 usb: typec: bus: verify partner exists in typec_altm=
ode_attention
> > >     31220bd89c22 usb: typec: tcpm: set initial svdm version based on =
pd revision
> > >     3acc6b9f266f cpufreq: brcmstb-avs-cpufreq: Fix -Warray-bounds bug
> > >     cb65ad51f1bd crypto: stm32 - fix loop iterating through scatterli=
st for DMA
> > >     9ab2c149c2e7 s390/ipl: add missing secure/has_secure file to ipl =
type 'unknown'
> > >     6aff2732577c arm64: sdei: abort running SDEI handlers during cras=
h
> > >     fedecaeef888 pstore/ram: Check start of empty przs during init
> > >     8d68582b93e6 mmc: renesas_sdhi: register irqs before registering =
controller
> > >     5294144b6ad2 fsverity: skip PKCS#7 parser when keyring is empty
> > >     86608e1b0c6f net: handle ARPHRD_PPP in dev_is_mac_header_xmit()
> > >     51ffed9ca1a4 X.509: if signature is unsupported skip validation
> > >     6ecf09699eb1 dccp: Fix out of bounds access in DCCP error handler
> > >     7a2978e8d3c0 dlm: fix plock lookup when using multiple lockspaces
> > >     703cf47d47ba parisc: Fix /proc/cpuinfo output for lscpu
> > >     49a49d442075 procfs: block chmod on /proc/thread-self/comm
> > >     44f6ec589353 Revert "PCI: Mark NVIDIA T4 GPUs to avoid bus reset"
> > >     d73d3787c9d1 ntb: Fix calculation ntb_transport_tx_free_entry()
> > >     da0c7293f4db ntb: Clean up tx tail index on link down
> > >     bfa051f650a7 ntb: Drop packets when qp link is down
> > >     8f4edcd65534 scsi: mpt3sas: Perform additional retries if doorbel=
l read returns 0
> > >     58388f2958f6 Revert "scsi: qla2xxx: Fix buffer overrun"
> > >     bd188d1e3855 media: venus: hfi_venus: Write to VIDC_CTRL_INIT aft=
er unmasking interrupts
> > >     6e9632a01e6d media: dvb: symbol fixup for dvb_attach()
> > >     9a43563cfd6b arm64: csum: Fix OoB access in IP checksum code for =
negative lengths
> > >     a0a49da2a79a i3c: master: svc: fix probe failure when no i3c devi=
ce exist
> > >     a905ac21b2ab xtensa: PMU: fix base address for the newer hardware
> > >     8742dbf9c25d backlight/lv5207lp: Compare against struct fb_info.d=
evice
> > >     568132f74cb1 backlight/bd6107: Compare against struct fb_info.dev=
ice
> > >     4e7b4ddc900c backlight/gpio_backlight: Compare against struct fb_=
info.device
> > >     3b018c3d1016 ARM: OMAP2+: Fix -Warray-bounds warning in _pwrdm_st=
ate_switch()
> > >     cbb7d8a4b4be ipmi_si: fix a memleak in try_smi_init()
> > >     6043dd31f771 PCI: rockchip: Use 64-bit mask on MSI 64-bit PCI add=
ress
> > >     aba1bf197467 media: i2c: ccs: Check rules is non-NULL
> > >     df64819dd6a0 mm/vmalloc: add a safer version of find_vm_area() fo=
r debug
> > >     20b7d0a62ad1 scsi: core: Fix the scsi_set_resid() documentation
> > >     20990d6a8543 printk: ringbuffer: Fix truncating buffer size min_t=
 cast
> > >     0a22f9c17b1a rcu: dump vmalloc memory info safely
> > >     d479c841b18d ALSA: pcm: Fix missing fixup call in compat hw_refin=
e ioctl
> > >     111bafa210ae PM / devfreq: Fix leak in devfreq_dev_release()
> > >     be7353af5b35 igb: set max size RX buffer when store bad packet is=
 enabled
> > >     d5790386595d skbuff: skb_segment, Call zero copy functions before=
 using skbuff frags
> > >     267a29f8bfdb netfilter: xt_sctp: validate the flag_info count
> > >     b3d07714ad24 netfilter: xt_u32: validate user space input
> > >     a9e6142e5f8f netfilter: ipset: add the missing IP_SET_HASH_WITH_N=
ET0 macro for ip_set_hash_netportnet.c
> > >     3e48f741e98a igmp: limit igmpv3_newpack() packet size to IP_MAX_M=
TU
> > >     de16cb7986f2 virtio_ring: fix avail_wrap_counter in virtqueue_add=
_packed
> > >     d6f80ddb9eda cpufreq: Fix the race condition while updating the t=
ransition_task of policy
> > >     42d8c7fa0bf6 dmaengine: ste_dma40: Add missing IRQ check in d40_p=
robe
> > >     329d0f168c8f um: Fix hostaudio build errors
> > >     58d17e766093 mtd: rawnand: fsmc: handle clk prepare error in fsmc=
_nand_resume()
> > >     679a71b31179 mtd: spi-nor: Check bus width while setting QE bit
> > >     8869fd166f23 leds: trigger: tty: Do not use LED_ON/OFF constants,=
 use led_blink_set_oneshot instead
> > >     0f715ea7d36e leds: multicolor: Use rounded division when calculat=
ing color components
> > >     1a68bef23726 leds: pwm: Fix error code in led_pwm_create_fwnode()
> > >     abd740db896b rpmsg: glink: Add check for kstrdup
> > >     b45cf29f97a2 phy/rockchip: inno-hdmi: do not power on rk3328 post=
 pll on reg write
> > >     40d637359f3f phy/rockchip: inno-hdmi: round fractal pixclock in r=
k3328 recalc_rate
> > >     52942a47d034 phy/rockchip: inno-hdmi: use correct vco_div_5 macro=
 on rk3328
> > >     31d7e6c7689b mtd: rawnand: brcmnand: Fix mtd oobsize
> > >     6182318ac046 tracing: Fix race issue between cpu buffer write and=
 swap
> > >     548f48ec1915 tracing: Remove extra space at the end of hwlat_dete=
ctor/mode
> > >     2ba8bb00720a x86/speculation: Mark all Skylake CPUs as vulnerable=
 to GDS
> > >     dde88ab4e45b HID: multitouch: Correct devm device reference for h=
idinput input_dev name
> > >     4fb28379b3c7 HID: logitech-dj: Fix error handling in logi_dj_recv=
_switch_to_dj_mode()
> > >     1bb42aca7a96 Revert "IB/isert: Fix incorrect release of isert con=
nection"
> > >     4f1807fddd9b amba: bus: fix refcount leak
> > >     1c3701373463 serial: tegra: handle clk prepare error in tegra_uar=
t_hw_init()
> > >     076fb40cf27a scsi: fcoe: Fix potential deadlock on &fip->ctlr_loc=
k
> > >     c4772759abe1 scsi: core: Use 32-bit hostnum in scsi_host_lookup()
> > >     6248f4305378 cgroup:namespace: Remove unused cgroup_namespaces_in=
it()
> > >     04824d50e6b5 media: i2c: rdacm21: Fix uninitialized value
> > >     f3572eef8551 media: ov2680: Fix regulators being left enabled on =
ov2680_power_on() errors
> > >     205f71744176 media: ov2680: Fix ov2680_set_fmt() which =3D=3D V4L=
2_SUBDEV_FORMAT_TRY not working
> > >     89ecb4b40094 media: ov2680: Add ov2680_fill_format() helper funct=
ion
> > >     784d1b83ae2c media: ov2680: Don't take the lock for try_fmt calls
> > >     dbb717b4ee68 media: ov2680: Remove VIDEO_V4L2_SUBDEV_API ifdef-s
> > >     4c1a5c2885d4 media: ov2680: Fix vflip / hflip set functions
> > >     958905ed42b8 media: ov2680: Fix ov2680_bayer_order()
> > >     cdd5fca7200d media: ov2680: Remove auto-gain and auto-exposure co=
ntrols
> > >     322a805ffdff media: i2c: ov2680: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT=
 on flips
> > >     abba34017e16 media: ov5640: Enable MIPI interface in ov5640_set_p=
ower_mipi()
> > >     1717f67be875 USB: gadget: f_mass_storage: Fix unused variable war=
ning
> > >     121b8d30f42c media: venus: hfi_venus: Only consider sys_idle_indi=
cator on V1
> > >     f6b483ead6dc media: go7007: Remove redundant if statement
> > >     d079a3e1ccdd platform/x86: dell-sysman: Fix reference leak
> > >     426bd7418701 iommu/vt-d: Fix to flush cache of PASID directory ta=
ble
> > >     9dc6f660815a iommu/qcom: Disable and reset context bank before pr=
ogramming
> > >     3274e32fc969 fsi: aspeed: Reset master errors after CFAM reset
> > >     7a17deca33e1 IB/uverbs: Fix an potential error pointer dereferenc=
e
> > >     42d111304dd7 RDMA/hns: Fix CQ and QP cache affinity
> > >     b051c3bf3bdf RDMA/hns: Fix incorrect post-send with direct wqe of=
 wr-list
> > >     154822356e4d RDMA/hns: Fix port active speed
> > >     de4aca5b284e iommu/sprd: Add missing force_aperture
> > >     46b76f13f1ad driver core: test_async: fix an error code
> > >     a6992ecefe5d dma-buf/sync_file: Fix docs syntax
> > >     d3256d80406c coresight: tmc: Explicit type conversions to prevent=
 integer overflow
> > >     93a5b461a4e1 RDMA/irdma: Replace one-element array with flexible-=
array member
> > >     97097ea2f37e scsi: qedf: Do not touch __user pointer in qedf_dbg_=
fp_int_cmd_read() directly
> > >     1c996be7f233 scsi: qedf: Do not touch __user pointer in qedf_dbg_=
debug_cmd_read() directly
> > >     cb6d20a8b5d7 scsi: qedf: Do not touch __user pointer in qedf_dbg_=
stop_io_on_error_cmd_read() directly
> > >     2f0d202d82b9 x86/APM: drop the duplicate APM_MINOR_DEV macro
> > >     f34508d934c4 serial: sprd: Fix DMA buffer leak issue
> > >     c54c66d904fa serial: sprd: Assign sprd_port after initialized to =
avoid wrong access
> > >     f61fc650c478 scsi: qla4xxx: Add length check when parsing nlattrs
> > >     46ad449efde1 scsi: be2iscsi: Add length check when parsing nlattr=
s
> > >     4bd57d889099 scsi: iscsi: Add strlen() check in iscsi_if_set{_hos=
t}_param()
> > >     e9bac3cc744f scsi: iscsi: Add length check for nlattr payload
> > >     9285efd95996 scsi: iscsi: Rename iscsi_set_param() to iscsi_if_se=
t_param()
> > >     7231d60d41c4 scsi: RDMA/srp: Fix residual handling
> > >     484ddaa90b7e usb: phy: mxs: fix getting wrong state with mxs_phy_=
is_otg_host()
> > >     cbb8f7097e11 media: mediatek: vcodec: Return NULL if no vdec_fb i=
s found
> > >     18dc93de9019 media: rkvdec: increase max supported height for H.2=
64
> > >     f1e7d999f37e scsi: hisi_sas: Fix normally completed I/O analysed =
as failed
> > >     46d1b2a3d5a6 scsi: hisi_sas: Fix warnings detected by sparse
> > >     e454e985950b scsi: hisi_sas: Modify v3 HW SATA completion error p=
rocessing
> > >     7caac45b52f4 scsi: hisi_sas: Modify v3 HW SSP underflow error pro=
cessing
> > >     f64d02822b82 media: cx24120: Add retval check for cx24120_message=
_send()
> > >     7ca7cd02114a media: dvb-usb: m920x: Fix a potential memory leak i=
n m920x_i2c_xfer()
> > >     fb24b65aaccd media: dib7000p: Fix potential division by zero
> > >     56a3d8ae4576 drivers: usb: smsusb: fix error handling code in sms=
usb_init_device
> > >     d1b51b130d32 iommu: rockchip: Fix directory table address encodin=
g
> > >     a50d60b8f2af iommu/amd/iommu_v2: Fix pasid_state refcount dec hit=
 0 warning on pasid unbind
> > >     caf058833b6f media: v4l2-core: Fix a potential resource leak in v=
4l2_fwnode_parse_link()
> > >     711e9e44f6c4 media: i2c: tvp5150: check return value of devm_kasp=
rintf()
> > >     30d4380eb030 media: ad5820: Drop unsupported ad5823 from i2c_ and=
 of_device_id tables
> > >     663114dfc178 RDMA/qedr: Remove a duplicate assignment in irdma_qu=
ery_ah()
> > >     1473e40b3912 pNFS: Fix assignment of xprtdata.cred
> > >     fb7ddc1138b0 NFSv4.2: fix handling of COPY ERR_OFFLOAD_NO_REQ
> > >     53a1e5ab1b11 NFS: Guard against READDIR loop when entry names exc=
eed MAXNAMELEN
> > >     19a648a07572 NFSD: da_addr_body field missing in some GETDEVICEIN=
FO replies
> > >     b0f127a7c635 fs: lockd: avoid possible wrong NULL parameter
> > >     8f994b830dd0 jfs: validate max amount of blocks before allocation=
.
> > >     f6a84ef1d080 ext4: fix unttached inode after power cut with orpha=
n file feature enabled
> > >     a9ddbfed5346 powerpc/iommu: Fix notifiers being shared by PCI and=
 VIO buses
> > >     a70c8de30514 nfs/blocklayout: Use the passed in gfp flags
> > >     2935443dc9c2 powerpc/pseries: Rework lppaca_shared_proc() to avoi=
d DEBUG_PREEMPT
> > >     75dcb650a7ef powerpc: Don't include lppaca.h in paca.h
> > >     cefcb002c5c9 PCI: layerscape: Add workaround for lost link capabi=
lities during reset
> > >     4be323c73797 PCI: layerscape: Add the endpoint linkup notifier su=
pport
> > >     69c712389e1f PCI: dwc: Add start_link/stop_link inlines
> > >     aac0a9a1577b wifi: ath10k: Use RMW accessors for changing LNKCTL
> > >     3539bab5f9de wifi: ath11k: Use RMW accessors for changing LNKCTL
> > >     ea670d0146a3 net/mlx5: Use RMW accessors for changing LNKCTL
> > >     348ef09df984 drm/radeon: Use RMW accessors for changing LNKCTL
> > >     5468237382ed drm/amdgpu: Use RMW accessors for changing LNKCTL
> > >     00f79e78bf4b powerpc/perf: Convert fsl_emb notifier to state mach=
ine callbacks
> > >     a26a5e4be2c4 powerpc/fadump: reset dump area size if fadump memor=
y reserve fails
> > >     13fd667db999 vfio/type1: fix cap_migration information leak
> > >     6b708243d3d9 powerpc/radix: Move some functions into #ifdef CONFI=
G_KVM_BOOK3S_HV_POSSIBLE
> > >     dbde1d9c54e2 clk: imx: composite-8m: fix clock pauses when set_ra=
te would be a no-op
> > >     824e97302fd8 clk: imx8mp: fix sai4 clock
> > >     66ef144dbdf9 PCI/ASPM: Use RMW accessors for changing LNKCTL
> > >     f46fa8ab8d82 PCI: pciehp: Use RMW accessors for changing LNKCTL
> > >     759d978e831b pinctrl: mcp23s08: check return value of devm_kaspri=
ntf()
> > >     02faf0bd6fdc PCI: Mark NVIDIA T4 GPUs to avoid bus reset
> > >     4c20a4143276 PCI: microchip: Correct the DED and SEC interrupt bi=
t offsets
> > >     377f7aeddda0 clk: qcom: gcc-sm6350: Fix gcc_sdcc2_apps_clk_src
> > >     1c4a98c55fa3 clk: qcom: reset: Use the correct type of sleep/dela=
y based on length
> > >     bd4eff9c835a clk: qcom: gcc-sm8250: Fix gcc_sdcc2_apps_clk_src
> > >     b1cb8bf42b36 ext4: avoid potential data overflow in next_linear_g=
roup
> > >     3e24082f1682 ext4: correct grp validation in ext4_mb_good_group
> > >     febacbefe451 EDAC/igen6: Fix the issue of no error events
> > >     964f62caac08 clk: qcom: gcc-sc7180: Fix up gcc_sdcc2_apps_clk_src
> > >     f1399e1543e7 clk: sunxi-ng: Modify mismatched function name
> > >     92913d32e719 drivers: clk: keystone: Fix parameter judgment in _o=
f_pll_clk_init()
> > >     3ad53071fe85 ipmi:ssif: Fix a memory leak when scanning for an ad=
apter
> > >     7792869495b6 ipmi:ssif: Add check for kstrdup
> > >     53abafedfeb7 ALSA: ac97: Fix possible error value of *rac97
> > >     48fc5717b249 of: unittest: Fix overlay type in apply/revert check
> > >     01bb96ad3808 of: overlay: Call of_changeset_init() early
> > >     30f04a41e7d7 md: raid0: account for split bio in iostat accountin=
g
> > >     9643cc0b1771 md/raid0: Fix performance regression for large seque=
ntial writes
> > >     17fbf7da491f md/raid0: Factor out helper for mapping and submitti=
ng a bio
> > >     d04f1e322f52 md: add error_handlers for raid0 and linear
> > >     d8b6adb84041 md: Set MD_BROKEN for RAID1 and RAID10
> > >     a68fabdad970 bus: ti-sysc: Fix cast to enum warning
> > >     7636dfc42b66 arm64: dts: qcom: apq8016-sbc: Fix ov5640 regulator =
supply names
> > >     fff4d36247e8 drm/mediatek: Fix potential memory leak if vmap() fa=
il
> > >     e5758ad9a34f drm/mediatek: Remove freeing not dynamic allocated m=
emory
> > >     97274bea0136 bus: ti-sysc: Fix build warning for 64-bit build
> > >     cc6b09671d0c io_uring: fix drain stalls by invalid SQE
> > >     0152e7758cc4 audit: fix possible soft lockup in __audit_inode_chi=
ld()
> > >     48e4c4819039 drm/msm/a2xx: Call adreno_gpu_init() earlier
> > >     76c3ad12441f drm/amd/pm: fix variable dereferenced issue in amdgp=
u_device_attr_create()
> > >     32e060927351 smackfs: Prevent underflow in smk_set_cipso()
> > >     502dfc5875ba firmware: meson_sm: fix to avoid potential NULL poin=
ter dereference
> > >     c0b1eee64870 drm/msm/mdp5: Don't leak some plane state
> > >     d0b82c217feb drm: xlnx: zynqmp_dpsub: Add missing check for dma_s=
et_mask
> > >     b7b0c48851c4 ima: Remove deprecated IMA_TRUSTED_KEYRING Kconfig
> > >     8025396b76e9 drm/panel: simple: Add missing connector type and pi=
xel format for AUO T215HVN01
> > >     27eee65b2e31 drm/armada: Fix off-by-one error in armada_overlay_g=
et_property()
> > >     cc9254b24a4b arm64: dts: qcom: sm8150: Fix the I2C7 interrupt
> > >     ea5bc6f5aa09 of: unittest: fix null pointer dereferencing in of_u=
nittest_find_node_by_name()
> > >     4197eeb55f4b drm/tegra: dpaux: Fix incorrect return value of plat=
form_get_irq
> > >     9712279e9743 drm/msm: Update dev core dump to not print backwards
> > >     8ef5d1f16d92 md/md-bitmap: hold 'reconfig_mutex' in backlog_store=
()
> > >     382638364711 md/bitmap: don't set max_write_behind if there is no=
 write mostly device
> > >     a3d36107ee48 md/raid10: use dereference_rdev_and_rrdev() to get d=
evices
> > >     94ca5eed9530 md/raid10: factor out dereference_rdev_and_rrdev()
> > >     246bac7d3c3e drm/amdgpu: Update min() to min_t() in 'amdgpu_info_=
ioctl'
> > >     de93b4711ac2 arm64: dts: qcom: sdm845: Fix the min frequency of "=
ice_core_clk"
> > >     a9e56fa8a0ca arm64: dts: qcom: sdm845: Add missing RPMh power dom=
ain to GCC
> > >     db0ba312542d ARM: dts: BCM53573: Fix Ethernet info for Luxul devi=
ces
> > >     c4413633ef78 drm: adv7511: Fix low refresh rate register for ADV7=
533/5
> > >     57b6d92c79e9 ARM: dts: samsung: s5pv210-smdkv210: correct etherne=
t reg addresses (split)
> > >     b7f47031e319 ARM: dts: s5pv210: add dummy 5V regulator for backli=
ght on SMDKv210
> > >     2f0246b3c7ff ARM: dts: samsung: s3c6410-mini6410: correct etherne=
t reg addresses (split)
> > >     d12beb1b1ee5 ARM: dts: s3c64xx: align pinctrl with dtschema
> > >     188f2d41fa5d x86/mm: Fix PAT bit missing from page protection mod=
ify mask
> > >     1dd43e1e54d5 drm/etnaviv: fix dumping of active MMU context
> > >     1634fe406c34 arm64: dts: qcom: pmi8994: Add missing OVP interrupt
> > >     4b7eb5e2c1c4 arm64: dts: qcom: Move WLED num-strings from pmi8994=
 to sony-xperia-tone
> > >     92919d98e673 arm64: dts: qcom: pmi8994: Remove hardcoded linear W=
LED enabled-strings
> > >     365909857242 arm64: dts: qcom: pm660l: Add missing short interrup=
t
> > >     ea48fd91df12 arm64: dts: qcom: correct SPMI WLED register range e=
ncoding
> > >     eee01e0d6abe arm64: dts: qcom: pmi8998: Add node for WLED
> > >     b788afdbfd5a arm64: dts: qcom: sm8250-sony-xperia: correct GPIO k=
eys wakeup again
> > >     2840d9b9c875 ARM: dts: BCM53573: Use updated "spi-gpio" binding p=
roperties
> > >     b35f3ca1877e ARM: dts: BCM53573: Add cells sizes to PCIe node
> > >     bed08bb83292 drm/amdgpu: avoid integer overflow warning in amdgpu=
_device_resize_fb_bar()
> > >     261e69456617 arm64: dts: qcom: sm8250: Mark PCIe hosts as DMA coh=
erent
> > >     12a93e53eaf0 arm64: dts: qcom: pmk8350: fix ADC-TM compatible str=
ing
> > >     4c9a637258bb arm64: dts: qcom: sm8350: Use proper CPU compatibles
> > >     4c918fb77dea arm64: dts: qcom: sm8350: Add missing LMH interrupts=
 to cpufreq
> > >     9c022ab2db40 arm64: dts: qcom: msm8996: Add missing interrupt to =
the USB2 controller
> > >     bda65ecaec97 arm64: dts: qcom: sm8250-edo: Rectify gpio-keys
> > >     6119aaced94f arm64: dts: qcom: sm8250-edo: Add GPIO line names fo=
r PMIC GPIOs
> > >     c0dc9d7d3f2b arm64: dts: qcom: sm8250-edo: Add gpio line names fo=
r TLMM
> > >     d2d698daa1fa arm64: dts: qcom: sm8250: correct dynamic power coef=
ficients
> > >     510bae3d37f7 soc: qcom: ocmem: Fix NUM_PORTS & NUM_MACROS macros
> > >     b08c7a31baeb soc: qcom: ocmem: Add OCMEM hardware version print
> > >     dc04034502e6 ASoC: stac9766: fix build errors with REGMAP_AC97
> > >     89602de9a2d7 quota: fix dqput() to follow the guarantees dquot_sr=
cu should provide
> > >     1df46e717ee9 quota: add new helper dquot_active()
> > >     bd0a6452f070 quota: rename dquot_active() to inode_quota_active()
> > >     5b8240223407 quota: factor out dquot_write_dquot()
> > >     6c6efd3a1d06 drm/bridge: tc358764: Fix debug print parameter orde=
r
> > >     a48e7def0006 netrom: Deny concurrent connect().
> > >     4cf994d3f4ff net/sched: sch_hfsc: Ensure inner classes have fsc c=
urve
> > >     edb5b1b3b9f8 hwmon: (tmp513) Fix the channel number in tmp51x_is_=
visible()
> > >     a85fd8116555 mlxsw: i2c: Limit single transaction buffer size
> > >     7790b6a2f5f0 mlxsw: i2c: Fix chunk size setting in output mailbox=
 buffer
> > >     510e0cbd6408 net: arcnet: Do not call kfree_skb() under local_irq=
_disable()
> > >     93a572b9d42f wifi: ath9k: use IS_ERR() with debugfs_create_dir()
> > >     5138beea8e7f Bluetooth: btusb: Do not call kfree_skb() under spin=
_lock_irqsave()
> > >     d7fd24b8d1bb wifi: mwifiex: avoid possible NULL skb pointer deref=
erence
> > >     71ce8be48bf0 wifi: nl80211/cfg80211: add forgotten nla_policy for=
 BSS color attribute
> > >     11f93fff6e8a wifi: ath9k: protect WMI command response buffer rep=
lacement with a lock
> > >     6904c7afd512 wifi: ath9k: fix races between ath9k_wmi_cmd and ath=
9k_wmi_ctrl_rx
> > >     cec7db9ea031 samples/bpf: fix broken map lookup probe
> > >     89f19a9a055d wifi: mwifiex: Fix missed return in oob checks faile=
d path
> > >     308eb3a609ac wifi: mwifiex: fix memory leak in mwifiex_histogram_=
read()
> > >     9c00731bf05d fs: ocfs2: namei: check return value of ocfs2_add_en=
try()
> > >     f683992d30ee lwt: Check LWTUNNEL_XMIT_CONTINUE strictly
> > >     e3f647e4b642 lwt: Fix return values of BPF xmit ops
> > >     4ff998134025 hwrng: iproc-rng200 - Implement suspend and resume c=
alls
> > >     5a70ab6b59b2 crypto: caam - fix unchecked return value error
> > >     660b6b1c5cf8 ice: ice_aq_check_events: fix off-by-one check when =
filling buffer
> > >     55fab9389d65 net-memcg: Fix scope of sockmem pressure indicators
> > >     41c40d84838d selftests/bpf: Clean up fmod_ret in bench_rename tes=
t script
> > >     50c78e71446d net: tcp: fix unexcepted socket die when snd_wnd is =
0
> > >     942d8cefb022 Bluetooth: Fix potential use-after-free when clear k=
eys
> > >     7b0243d26a71 Bluetooth: nokia: fix value check in nokia_bluetooth=
_serdev_probe()
> > >     048545d9fc64 crypto: api - Use work queue in crypto_destroy_insta=
nce
> > >     56cb7bbefcaf crypto: stm32 - Properly handle pm_runtime_get faili=
ng
> > >     e3c4a6b073e4 selftests/bpf: fix static assert compilation issue f=
or test_cls_*.c
> > >     43423b3e0467 wifi: mwifiex: fix error recovery in PCIE buffer des=
criptor management
> > >     7c54b6fc39eb wifi: mwifiex: Fix OOB and integer underflow when rx=
 packets
> > >     a20b96cf6925 wifi: mt76: mt7915: fix power-limits while chan_swit=
ch
> > >     5c75a4379589 can: gs_usb: gs_usb_receive_bulk_callback(): count R=
X overflow errors also in case of OOM
> > >     890843254f38 spi: tegra20-sflash: fix to check return value of pl=
atform_get_irq() in tegra_sflash_probe()
> > >     2ff9ac0cf25f wifi: mt76: testmode: add nla_policy for MT76_TM_ATT=
R_TX_LENGTH
> > >     802008e8c73a ipv6: Add reasons for skb drops to __udp6_lib_rcv
> > >     7dcbc0bb0e5c bpf: reject unhashed sockets in bpf_sk_assign
> > >     caa2883b1885 udp: re-score reuseport groups when connected socket=
s are present
> > >     b60dfa4559d8 regmap: rbtree: Use alloc_flags for memory allocatio=
ns
> > >     34f1180658d9 hwrng: pic32 - use devm_clk_get_enabled
> > >     5af3c8676b36 hwrng: nomadik - keep clock enabled while hwrng is r=
egistered
> > >     14c6d1e80847 tcp: tcp_enter_quickack_mode() should be static
> > >     7b75b4c90a9e bpf: Clear the probe_addr for uprobe
> > >     75d3960be702 bpftool: Use a local bpf_perf_event_value to fix acc=
essing its fields
> > >     8ea6871116d5 cpufreq: powernow-k8: Use related_cpus instead of cp=
us in driver.exit()
> > >     be2092d2a703 x86/efistub: Fix PCI ROM preservation in mixed mode
> > >     9eb25ea7b65d ACPI: x86: s2idle: Fix a logic error parsing AMD con=
straints table
> > >     26097a7f28b3 ACPI: x86: s2idle: Post-increment variables when get=
ting constraints
> > >     8a962f11a95b s390/paes: fix PKEY_TYPE_EP11_AES handling for secur=
e keyblobs
> > >     7833a74f8d00 s390/pkey: fix/harmonize internal keyblob headers
> > >     208383d68510 selftests/futex: Order calls to futex_lock_pi
> > >     c7802ff51adc perf/imx_ddr: don't enable counter0 if none of 4 cou=
nters are used
> > >     0a872a0521c8 x86/decompressor: Don't rely on upper 32 bits of GPR=
s being preserved
> > >     3af6f77e8090 selftests/resctrl: Close perf value read fd on error=
s
> > >     4505ad996b66 selftests/resctrl: Unmount resctrl FS if child fails=
 to run benchmark
> > >     c68a196e7ff6 selftests/resctrl: Don't leak buffer in fill_cache()
> > >     fdcb63afd3f6 selftests/resctrl: Add resctrl.h into build deps
> > >     b2ba11ed4d10 selftests/resctrl: Make resctrl_tests run using ksel=
ftest framework
> > >     e0478944f4a5 OPP: Fix passing 0 to PTR_ERR in _opp_attach_genpd()
> > >     ec9d118ad99d refscale: Fix uninitalized use of wait_queue_head_t
> > >     e280033ef135 ARM: ptrace: Restore syscall skipping for tracers
> > >     4c3f33904dea ARM: ptrace: Restore syscall restart tracing
> > >     0481251b7cd6 selftests/harness: Actually report SKIP for signal t=
ests
> > >     060ca3f7899a tmpfs: verify {g,u}id mount options correctly
> > >     d412e9b34b90 fs: Fix error checking for d_hash_and_lookup()
> > >     a4229f93bc54 eventfd: prevent underflow for eventfd semaphores
> > >     cedb8719333d reiserfs: Check the return value from __getblk()
> > >     c1a4117f1544 Revert "net: macsec: preserve ingress frame ordering=
"
> > >     40671f90d5b5 udf: Handle error when adding extent to a file
> > >     099bf90d7fc4 udf: Check consistency of Space Bitmap Descriptor
> > >     7039aa1be9cc of: kexec: Mark ima_{free,stable}_kexec_buffer() as =
__init
> > >     759d51eda2d0 net: Avoid address overwrite in kernel_connect
> > >     7c4cce5700b9 arm64: lib: Import latest version of Arm Optimized R=
outines' strncmp
> > >     104df1c695c1 crypto: rsa-pkcs1pad - Use helper to set reqsize
> > >     273f4615314f platform/mellanox: Fix mlxbf-tmfifo not handling all=
 virtio CONSOLE notifications
> > >     9ef5c25bcf1b tracing: Introduce pipe_cpumask to avoid race on tra=
ce_pipes
> > >     8c1b60dad0f5 ALSA: seq: oss: Fix racy open/close of MIDI devices
> > >     fa05aea28195 scsi: lpfc: Fix incorrect big endian type assignment=
 in bsg loopback path
> > >     f0bf8a071134 scsi: storvsc: Always set no_report_opcodes
> > >     e9e62419e797 sctp: handle invalid error codes without calling BUG=
()
> > >     3714bb4a1df8 bnx2x: fix page fault following EEH recovery
> > >     53b8cc2f9685 netlabel: fix shift wrapping bug in netlbl_catmap_se=
tlong()
> > >     867cdd7f9544 drm/amdgpu: Match against exact bootloader status
> > >     0863204deb3c net: hns3: restore user pause configure when disable=
 autoneg
> > >     ac93def0dbb4 scsi: qedi: Fix potential deadlock on &qedi_percpu->=
p_work_lock
> > >     bef6c89a92d0 scsi: lpfc: Remove reftag check in DIF paths
> > >     b439e33a8c93 idmaengine: make FSL_EDMA and INTEL_IDMA64 depends o=
n HAS_IOMEM
> > >     156b803194ae wifi: brcmfmac: Fix field-spanning write in brcmf_sc=
an_params_v2_to_v1()
> > >     87ea5e89407e net: usb: qmi_wwan: add Quectel EM05GV2
> > >     e1313fa9d2e3 vmbus_testing: fix wrong python syntax for integer v=
alue comparison
> > >     5faad57ba6c7 clk: fixed-mmio: make COMMON_CLK_FIXED_MMIO depend o=
n HAS_IOMEM
> > >     e13f0dd5fbe2 kprobes: Prohibit probing on CFI preamble symbol
> > >     ee49b97cb5ae security: keys: perform capable check only on privil=
eged operations
> > >     f44f50305de2 ata: pata_arasan_cf: Use dev_err_probe() instead dev=
_err() in data_xfer()
> > >     a85c523aeccd ovl: Always reevaluate the file signature for IMA
> > >     3faa126258a9 drm/amd/display: Exit idle optimizations before atte=
mpt to access PHY
> > >     c152ca4f219b platform/x86: huawei-wmi: Silence ambient light sens=
or
> > >     a9988b9c7a31 platform/x86/intel/hid: Add HP Dragonfly G2 to VGBS =
DMI quirks
> > >     7f3901b04c8f platform/x86: intel: hid: Always call BTNL ACPI meth=
od
> > >     23151421ed01 ASoC: atmel: Fix the 8K sample parameter in I2SC mas=
ter
> > >     c934d2a6970c ASoC: rt711-sdca: fix for JD event handling in Clock=
Stop Mode0
> > >     20587011d271 ASoC: rt711: fix for JD event handling in ClockStop =
Mode0
> > >     b41f79896456 ASoc: codecs: ES8316: Fix DMIC config
> > >     cc2b0a2055dc ASoC: rt5682-sdw: fix for JD event handling in Clock=
Stop Mode0
> > >     5b64fc2471f9 fs/nls: make load_nls() take a const parameter
> > >     f85908f6bfd2 s390/dasd: fix hanging device after request requeue
> > >     a4845e694893 s390/dasd: use correct number of retries for ERP req=
uests
> > >     e062aa1acf9b m68k: Fix invalid .section syntax
> > >     bbfa7d712b24 vxlan: generalize vxlan_parse_gpe_hdr and remove unu=
sed args
> > >     b10215ffdb01 ethernet: atheros: fix return value check in atl1c_t=
so_csum()
> > >     6bb94f46d31a ASoC: da7219: Check for failure reading AAD IRQ even=
ts
> > >     279a6dad0cd9 ASoC: da7219: Flush pending AAD IRQ when suspending
> > >     d424c636b750 ksmbd: no response from compound read
> > >     82373d1b763e ksmbd: fix out of bounds in smb3_decrypt_req()
> > >     20d449a08749 9p: virtio: make sure 'offs' is initialized in zc_re=
quest
> > >     c4269c7258d9 media: pci: cx23885: fix error handling for cx23885 =
ATSC boards
> > >     17d75773b66e media: pulse8-cec: handle possible ping error
> > >     f281a3739399 phy: qcom-snps-femto-v2: use qcom_snps_hsphy_suspend=
/resume error code
> > >     dfff9c91cbb0 ARM: dts: imx: Set default tuning step for imx7d usd=
hc
> > >     4e364cab1331 ARM: dts: imx: Adjust dma-apbh node name
> > >     99319298fd9a ARM: dts: imx7s: Drop dma-apb interrupt-names
> > >     1dc2c12854b6 ARM: dts: imx: update sdma node name format
> > >     aff03380bda4 Linux 5.15.131
> > >     cd8ab566cf17 usb: typec: tcpci: clear the fault status bit
> > >     403b2e940910 usb: typec: tcpci: move tcpci.h to include/linux/usb=
/
> > >     f29483873e24 pinctrl: amd: Don't show `Invalid config param` erro=
rs
> > >     b911bef132a0 nilfs2: fix WARNING in mark_buffer_dirty due to disc=
arded buffer reuse
> > >     1c6ddf739f15 nilfs2: fix general protection fault in nilfs_lookup=
_dirty_data_buffers()
> > >     f6e61aef5c5d tcpm: Avoid soft reset when partner does not support=
 get_status
> > >     da0e7d435e31 fsi: master-ast-cf: Add MODULE_FIRMWARE macro
> > >     72eca651d732 firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug=
 in probe
> > >     907216337bea serial: sc16is7xx: fix bug when first setting GPIO d=
irection
> > >     45d9611ebff2 serial: sc16is7xx: fix broken port 0 uart init
> > >     f90e267dd27e serial: qcom-geni: fix opp vote on shutdown
> > >     46d13013b574 wifi: mt76: mt7921: do not support one stream on sec=
ondary antenna only
> > >     a5c2a467e9e7 Bluetooth: btsdio: fix use after free bug in btsdio_=
remove due to race condition
> > >     f49294ad6898 staging: rtl8712: fix race condition
> > >     d17cec60e87c HID: wacom: remove the battery when the EKR is off
> > >     842c7da3eee2 usb: chipidea: imx: improve logic if samsung,picophy=
-* parameter is 0
> > >     276a906f81a7 usb: dwc3: meson-g12a: do post init to fix broken us=
b after resumption
> > >     60f938e84fbb ALSA: usb-audio: Fix init call orders for UAC1
> > >     e949dd2a9b6b USB: serial: option: add FOXCONN T99W368/T99W373 pro=
duct
> > >     c41411d8b333 USB: serial: option: add Quectel EM05G variant (0x03=
0e)
> > >     09baa839d415 modules: only allow symbol_get of EXPORT_SYMBOL_GPL =
modules
> > >     997a194914c4 rtc: ds1685: use EXPORT_SYMBOL_GPL for ds1685_rtc_po=
weroff
> > >     3d0f6408601b net: enetc: use EXPORT_SYMBOL_GPL for enetc_phc_inde=
x
> > >     da95090821c4 mmc: au1xmmc: force non-modular build and remove sym=
bol_get usage
> > >     e3e68100c036 ARM: pxa: remove use of symbol_get()
> > >     bb5bf157b5be ksmbd: replace one-element array with flex-array mem=
ber in struct smb2_ea_info
> > >     2e3f57f74c0a ksmbd: fix wrong DataOffset validation of create con=
text
> > >     b3ad7f39fd85 erofs: ensure that the post-EOF tails are all zeroed
> > >     8f790700c974 Linux 5.15.130
> > >     69347c334071 rcu-tasks: Add trc_inspect_reader() checks for exiti=
ng critical section
> > >     8046fb611f70 rcu-tasks: Wait for trc_read_check_handler() IPIs
> > >     da22db901cc1 rcu-tasks: Fix IPI failure handling in trc_wait_for_=
one_reader
> > >     a0249d365ac8 rcu: Prevent expedited GP from enabling tick on offl=
ine CPU
> > >     7aec063d6029 ARM: module: Use module_init_layout_section() to spo=
t init sections
> > >     4a8976052acd arm64: module: Use module_init_layout_section() to s=
pot init sections
> > >     f8a74159d116 arm64: module-plts: inline linux/moduleloader.h
> > >     363bbb5008e5 module: Expose module_init_layout_section()
> > >     758e3d0cb753 ACPI: thermal: Drop nocrt parameter
> > >     9e43368a3393 Linux 5.15.129
> > >     d48016d74836 mm,ima,kexec,of: use memblock_free_late from ima_fre=
e_kexec_buffer
> > >     1c41cd30d5cd mm: memory-failure: fix unexpected return value in s=
oft_offline_page()
> > >     0712721e4f4f mm: memory-failure: kill soft_offline_free_page()
> > >     efd02b5cadd5 dma-buf/sw_sync: Avoid recursive lock during fence s=
ignal
> > >     8dbf913520c4 pinctrl: renesas: rza2: Add lock around pinctrl_gene=
ric{{add,remove}_group,{add,remove}_function}
> > >     f1c0402b8e22 clk: Fix undefined reference to `clk_rate_exclusive_=
{get,put}'
> > >     10bc3eddc605 scsi: core: raid_class: Remove raid_component_add()
> > >     d3d57cdbfda4 scsi: snic: Fix double free in snic_tgt_create()
> > >     ef56cc8889be can: raw: add missing refcount for memory leak fix
> > >     930f3f164964 drm/i915: Fix premature release of request's reusabl=
e memory
> > >     3cb86cc565df cgroup/cpuset: Free DL BW in case can_attach() fails
> > >     ffff4fc4bad7 sched/deadline: Create DL BW alloc, free & check ove=
rflow interface
> > >     86aa90795979 cgroup/cpuset: Iterate only if DEADLINE tasks are pr=
esent
> > >     43d8cbfefa7c sched/cpuset: Keep track of SCHED_DEADLINE task in c=
pusets
> > >     d0eb4917f4d3 sched/cpuset: Bring back cpuset_mutex
> > >     918879de0e23 cgroup/cpuset: Rename functions dealing with DEADLIN=
E accounting
> > >     78efab71a649 torture: Fix hang during kthread shutdown phase
> > >     c8fb97dd7fe6 nfsd: use vfs setgid helper
> > >     01966511868e nfs: use vfs setgid helper
> > >     a7a1849899aa x86/fpu: Set X86_FEATURE_OSXSAVE feature after enabl=
ing OSXSAVE in CR4
> > >     ad79f943c869 x86/fpu: Invalidate FPU state correctly on exec()
> > >     b190cf1f277a drm/display/dp: Fix the DP DSC Receiver cap size
> > >     c8aab333d41a drm/vmwgfx: Fix shader stage validation
> > >     b53ed415163e PCI: acpiphp: Use pci_assign_unassigned_bridge_resou=
rces() only for non-root bus
> > >     60ba1bfa036a media: vcodec: Fix potential array out-of-bounds in =
encoder queue_setup
> > >     544cd10defa1 of: dynamic: Refactor action prints to not use "%pOF=
" inside devtree_lock
> > >     f1d4a5881856 of: unittest: Fix EXPECT for parse_phandle_with_args=
_map() test
> > >     ce66cd478636 radix tree: remove unused variable
> > >     898c8c5b1114 lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-=
bit kernels
> > >     ff90a4c6edf8 batman-adv: Hold rtnl lock during MTU update via net=
link
> > >     ea38c0d9aaa2 batman-adv: Fix batadv_v_ogm_aggr_send memory leak
> > >     7f3f72eb8f5b batman-adv: Fix TT global entry leak when client roa=
med back
> > >     f7667b49880a batman-adv: Do not get eth header before batadv_chec=
k_management_packet
> > >     3f9312dd7581 batman-adv: Don't increase MTU when set by user
> > >     cde5a240d72d batman-adv: Trigger events for auto adjusted MTU
> > >     22426e1ce679 selinux: set next pointer before attaching to list
> > >     711595bfdccf nfsd: Fix race to FREE_STATEID and cl_revoked
> > >     bd1697e12230 NFS: Fix a use after free in nfs_direct_join_group()
> > >     5f642613746e mm: add a call to flush_cache_vmap() in vmap_pfn()
> > >     440c10034b4d ALSA: ymfpci: Fix the missing snd_card_free() call a=
t probe error
> > >     5cc7d81cf576 clk: Fix slab-out-of-bounds error in devm_clk_releas=
e()
> > >     0f72859acfa2 NFSv4: Fix dropped lock for racing OPEN and delegati=
on return
> > >     9c025420fef2 ibmveth: Use dcbf rather than dcbfl
> > >     7e546bd08943 Revert "KVM: x86: enable TDP MMU by default"
> > >     67af12f5582b net/ncsi: change from ndo_set_mac_address to dev_set=
_mac_address
> > >     4451457d61e0 net/ncsi: make one oem_gma function for all mfr id
> > >     f683f4be802b bonding: fix macvlan over alb bond support
> > >     0fa8046e923a net: remove bond_slave_has_mac_rcu()
> > >     f0ec97fca629 rtnetlink: Reject negative ifindexes in RTM_NEWLINK
> > >     00247cfd2b69 rtnetlink: return ENODEV when ifname does not exist =
and group is given
> > >     75cfb7de44e5 netfilter: nf_tables: fix out of memory error handli=
ng
> > >     f22954f8c58f netfilter: nf_tables: flush pending destroy work bef=
ore netlink notifier
> > >     ff34403fef98 net/sched: fix a qdisc modification with ambiguous c=
ommand request
> > >     30624ea3f8b6 igc: Fix the typo in the PTM Control macro
> > >     f697c3ead109 igb: Avoid starting unnecessary workqueues
> > >     d7823d752ce1 ice: fix receive buffer size miscalculation
> > >     ace1b0ae3097 net: validate veth and vxcan peer ifindexes
> > >     335be585416d net: bcmgenet: Fix return value check for fixed_phy_=
register()
> > >     60a5034584ea net: bgmac: Fix return value check for fixed_phy_reg=
ister()
> > >     5b52c9ba42c0 ipvlan: Fix a reference count leak warning in ipvlan=
_ns_exit()
> > >     2bad37b6f675 dccp: annotate data-races in dccp_poll()
> > >     9b015360e86f sock: annotate data-races around prot->memory_pressu=
re
> > >     c52c6c0223e1 octeontx2-af: SDP: fix receive link config
> > >     ce6e2b14bc09 tracing: Fix memleak due to race between current_tra=
cer and trace
> > >     ef748360ba91 tracing: Fix cpu buffers unavailable due to 'record_=
disabled' missed
> > >     fdf5804d7475 can: raw: fix lockdep issue in raw_release()
> > >     278fccf587dd drm/amd/display: check TG is non-null before checkin=
g if enabled
> > >     a955e6a0e39d drm/amd/display: do not wait for mpc idle if tg is d=
isabled
> > >     e0bd4f0c60b4 can: raw: fix receiver memory leak
> > >     b832174b7f89 jbd2: fix a race when checking checkpoint buffer bus=
y
> > >     9c31bb2684f8 jbd2: remove journal_clean_one_cp_list()
> > >     d91783e6864a jbd2: remove t_checkpoint_io_list
> > >     a0ab49e7a758 ALSA: pcm: Fix potential data race at PCM memory all=
ocation helpers
> > >     2e56d380daa9 fbdev: fix potential OOB read in fast_imageblit()
> > >     14163f4a4fa6 fbdev: Fix sys_imageblit() for arbitrary image width=
s
> > >     5b60bd9081a9 fbdev: Improve performance of sys_imageblit()
> > >     166f0bf4560b MIPS: cpu-features: Use boot_cpu_type for CPU type b=
ased features
> > >     8f106e97409d MIPS: cpu-features: Enable octeon_cache by cpu_type
> > >     d1d0b239f974 fs: dlm: fix mismatch of plock results from userspac=
e
> > >     77d334c44681 fs: dlm: use dlm_plock_info for do_unlock_close
> > >     f9a33cc7d946 fs: dlm: change plock interrupted message to debug a=
gain
> > >     7ac088841ffb fs: dlm: add pid to debug log
> > >     df9c842ab0a4 dlm: replace usage of found with dedicated list iter=
ator variable
> > >     33e9c610e337 dlm: improve plock logging if interrupted
> > >     d9ce077f8b1f PCI: acpiphp: Reassign resources on bridge if necess=
ary
> > >     8cc8645dd3e1 xprtrdma: Remap Receive buffers after a reconnect
> > >     91a707507e83 NFSv4: fix out path in __nfs4_get_acl_uncached
> > >     323b830eebd1 NFSv4.2: fix error handling in nfs42_proc_getxattr
> > >     5de0a325c45e objtool/x86: Fix SRSO mess
> > >     5ddfe5cc8716 Linux 5.15.128
> > >     9080f4fcc202 x86/srso: Correct the mitigation status when SMT is =
disabled
> > >     484eefc6ff9c objtool/x86: Fixup frame-pointer vs rethunk
> > >     55f1cbeaa159 x86/retpoline,kprobes: Fix position of thunk section=
s with CONFIG_LTO_CLANG
> > >     fa24cd0fbcb7 x86/srso: Disable the mitigation on unaffected confi=
gurations
> > >     aa0777ce0d3d x86/CPU/AMD: Fix the DIV(0) initial fix attempt
> > >     bbe585239d4f x86/retpoline: Don't clobber RFLAGS during srso_safe=
_ret()
> > >     19f23d16b0e0 x86/static_call: Fix __static_call_fixup()
> > >     df6495f203a7 x86/srso: Explain the untraining sequences a bit mor=
e
> > >     43548590ad7e x86/cpu: Cleanup the untrain mess
> > >     035e906bfc93 x86/cpu: Rename srso_(.*)_alias to srso_alias_\1
> > >     19c1c0499650 x86/cpu: Rename original retbleed methods
> > >     f77dbb90962b x86/cpu: Clean up SRSO return thunk mess
> > >     f624ce6c7fc2 x86/ibt: Add ANNOTATE_NOENDBR
> > >     f1171d455d94 objtool: Add frame-pointer-specific function ignore
> > >     08f7cfd44f77 x86/alternative: Make custom return thunk unconditio=
nal
> > >     0d810eff090c x86/cpu: Fix up srso_safe_ret() and __x86_return_thu=
nk()
> > >     8089aae6020e x86/cpu: Fix __x86_return_thunk symbol type
> > >     5b28fda5fdee mmc: f-sdh30: fix order of function calls in sdhci_f=
_sdh30_remove
> > >     e8c5081da2cc net: fix the RTO timer retransmitting skb every 1ms =
if linear option is enabled
> > >     431db3f48c28 virtio-net: set queues after driver_ok
> > >     d39fc9b94dc0 af_unix: Fix null-ptr-deref in unix_stream_sendpage(=
).
> > >     9a4d8dc706c2 arm64: dts: rockchip: Disable HS400 for eMMC on ROCK=
 Pi 4
> > >     6b64974e02ea exfat: check if filename entries exceeds max filenam=
e length
> > >     6065b3017107 netfilter: set default timeout to 3 secs for sctp sh=
utdown send and recv state
> > >     a00c5d2c208b drm/amd: flush any delayed gfxoff on suspend entry
> > >     d578c919deb7 drm/qxl: fix UAF on handle creation
> > >     ff09f9e671ff mmc: block: Fix in_flight[issue_type] value error
> > >     b803fedb6e50 mmc: wbsd: fix double mmc_free_host() in wbsd_init()
> > >     961f7ce16223 cifs: Release folio lock on fscache read hit.
> > >     cc3f194f46e7 ALSA: usb-audio: Add support for Mythware XA001AU ca=
pture and playback interfaces.
> > >     18e27df4f2b4 serial: 8250: Fix oops for port->pm on uart_change_p=
m()
> > >     e9b8ee715dbc riscv: uaccess: Return the number of bytes effective=
ly not copied
> > >     b2a331abcb03 ALSA: hda/realtek - Remodified 3k pull low procedure
> > >     dfb9676ed25b soc: aspeed: socinfo: Add kfree for kstrdup
> > >     c5ac7522a8db ASoC: meson: axg-tdm-formatter: fix channel slot all=
ocation
> > >     fd346ef1cd2d ASoC: rt5665: add missed regulator_bulk_disable
> > >     e878458d820c ARM: dts: imx: Set default tuning step for imx6sx us=
dhc
> > >     430c29a54e4a arm64: dts: qcom: qrb5165-rb5: fix thermal zone conf=
lict
> > >     03522d73a498 bus: ti-sysc: Flush posted write on enable before re=
set
> > >     578371ce0d7f net: do not allow gso_size to be set to GSO_BY_FRAGS
> > >     5fc4fd3f3eb8 sock: Fix misuse of sk_under_memory_pressure()
> > >     fc3d82d295d1 net: dsa: mv88e6xxx: Wait for EEPROM done before HW =
reset
> > >     f11c2802e143 i40e: fix misleading debug logs
> > >     5ba2b936f3e1 iavf: fix FDIR rule fields masks validation
> > >     ae6834689fd6 team: Fix incorrect deletion of ETH_P_8021AD protoco=
l vid from slaves
> > >     0ffbc341cfae net: phy: broadcom: stub c45 read/write for 54810
> > >     bf221e5e4b19 netfilter: nft_dynset: disallow object maps
> > >     9177869b85dd ipvs: fix racy memcpy in proc_do_sync_threshold
> > >     1adaec4758d1 netfilter: nf_tables: deactivate catchall elements i=
n next generation
> > >     82109740d610 netfilter: nf_tables: fix false-positive lockdep spl=
at
> > >     b2f6d73395cb drm/panel: simple: Fix AUO G121EAN01 panel timings a=
ccording to the docs
> > >     7207ee323afa selftests: mirror_gre_changes: Tighten up the TTL te=
st match
> > >     c2a6ffe3f1a3 net: phy: fix IRQ-based wake-on-lan over hibernate /=
 power off
> > >     8e5e967348ca xfrm: add forgotten nla_policy for XFRMA_MTIMER_THRE=
SH
> > >     075448a2eb75 xfrm: add NULL check in xfrm_update_ae_params
> > >     e1e04cc2ef2c ip_vti: fix potential slab-use-after-free in decode_=
session6
> > >     a1639a82ce14 ip6_vti: fix slab-use-after-free in decode_session6
> > >     44b3d4096700 xfrm: fix slab-use-after-free in decode_session6
> > >     a465ace883ac net: xfrm: Amend XFRMA_SEC_CTX nla_policy structure
> > >     fed1cd2cd3aa net: af_key: fix sadb_x_filter validation
> > >     1960f468078b net: xfrm: Fix xfrm_address_filter OOB read
> > >     080dedb1cad8 i2c: designware: Handle invalid SMBus block data res=
ponse length value
> > >     416c538684bd i2c: designware: Correct length byte validation logi=
c
> > >     b966e9e1e250 btrfs: fix BUG_ON condition in btrfs_cancel_balance
> > >     77698e6ff6f0 tty: serial: fsl_lpuart: Clear the error flags by wr=
iting 1 for lpuart32 platforms
> > >     2a5234464383 tty: n_gsm: fix the UAF caused by race condition in =
gsm_cleanup_mux
> > >     8ef25fb13494 powerpc/rtas_flash: allow user copy to flash block c=
ache objects
> > >     bb70e2b70f8d fbdev: mmp: fix value check in mmphw_probe()
> > >     184f1b68bb99 i2c: hisi: Only handle the interrupt of the driver's=
 transfer
> > >     c4e671dae50e i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
> > >     b99f490ea87e cifs: fix potential oops in cifs_oplock_break
> > >     a5ae5a81bc19 vduse: Use proper spinlock for IRQ injection
> > >     5b7d5c2dd664 virtio-mmio: don't break lifecycle of vm_dev
> > >     edf3b5aadb25 btrfs: move out now unused BG from the reclaim list
> > >     170773563ef6 ARM: dts: nxp/imx6sll: fix wrong property name in us=
bphy node
> > >     4ffbfe1c980f ARM: dts: imx6sll: fixup of operating points
> > >     e2ff5cf681a8 mmc: sunxi: fix deferred probing
> > >     f93e8c5a7bd9 mmc: bcm2835: fix deferred probing
> > >     4eeba5d476fe USB: dwc3: fix use-after-free on core driver unbind
> > >     a78fe5c9d8d5 USB: dwc3: qcom: fix NULL-deref on suspend
> > >     8a6b7534020d tty: serial: fsl_lpuart: reduce RX watermark to 0 on=
 LS1028A
> > >     701bb5fee7c3 tty: serial: fsl_lpuart: make rx_watermark configura=
ble for different platforms
> > >     fa254ab7d02d tty: serial: fsl_lpuart: Add i.MXRT1050 support
> > >     20351ddb1f41 usb: dwc3: gadget: Improve dwc3_gadget_suspend() and=
 dwc3_gadget_resume()
> > >     31a0e60fe16b USB: dwc3: gadget: drop dead hibernation code
> > >     d9e004104e45 usb: dwc3: Fix typos in gadget.c
> > >     2fa487a94667 usb: dwc3: Remove DWC3 locking during gadget suspend=
/resume
> > >     7dfb384e76ee usb: dwc3: gadget: Synchronize IRQ between soft conn=
ect/disconnect
> > >     d3c82f24ee69 drm/amd/display: fix access hdcp_workqueue assert
> > >     0ba6c7ba081e drm/amd/display: phase3 mst hdcp for multiple displa=
ys
> > >     99c444d3c3c4 drm/amd/display: save restore hdcp state when displa=
y is unplugged from mst hub
> > >     4f1beb75f652 ARM: dts: aspeed: asrock: Correct firmware flash SPI=
 clocks
> > >     f84c2ca3490c igc: read before write to SRRCTL register
> > >     9fa82f031af8 iio: addac: stx104: Fix race condition when converti=
ng analog-to-digital
> > >     d31d04ec404c iio: addac: stx104: Fix race condition for stx104_wr=
ite_raw()
> > >     89a007f3a383 iio: stx104: Move to addac subdirectory
> > >     cadf8f2d7c9d iio: adc: stx104: Implement and utilize register str=
uctures
> > >     6089d354346f iio: adc: stx104: Utilize iomap interface
> > >     565b96d9a7ab iio: add addac subdirectory
> > >     49b830d75f03 ring-buffer: Do not swap cpu_buffer during resize pr=
ocess
> > >     6657ecbcc39c powerpc/kasan: Disable KCOV in KASAN code
> > >     8703b26387e1 ALSA: hda: fix a possible null-pointer dereference d=
ue to data race in snd_hdac_regmap_sync()
> > >     5ed4dbc13726 ALSA: hda/realtek: Add quirks for Unis H3C Desktop B=
760 & Q760
> > >     c7d8b5f46f06 fs/ntfs3: Mark ntfs dirty when on-disk struct is cor=
rupted
> > >     3a00ec562f8c fs: ntfs3: Fix possible null-pointer dereferences in=
 mi_read()
> > >     e7799bb4dbe2 fs/ntfs3: Enhance sanity check while generating attr=
_list
> > >     ef568da1fd84 drm/amdgpu: Fix potential fence use-after-free v2
> > >     5720c7e185d4 Bluetooth: btusb: Add MT7922 bluetooth ID for the As=
us Ally
> > >     548a6b64b3c0 Bluetooth: L2CAP: Fix use-after-free
> > >     302d04596364 watchdog: sp5100_tco: support Hygon FCH/SCH (Server =
Controller Hub)
> > >     2ea70379e4f4 firewire: net: fix use after free in fwnet_finish_in=
coming_packet()
> > >     97fd1c8e9c5a pcmcia: rsrc_nonstatic: Fix memory leak in nonstatic=
_release_resource_db()
> > >     85e888150075 gfs2: Fix possible data races in gfs2_show_options()
> > >     eafb79d2448a usb: chipidea: imx: add missing USB PHY DPDM wakeup =
setting
> > >     7bdb4c963049 usb: chipidea: imx: don't request QoS for imx8ulp
> > >     25decbbb66e4 thunderbolt: Read retimer NVM authentication status =
prior tb_retimer_set_inbound_sbtx()
> > >     776b34615a29 media: platform: mediatek: vpu: fix NULL ptr derefer=
ence
> > >     cb174344bf85 usb: gadget: u_serial: Avoid spinlock recursion in _=
_gs_console_push
> > >     1676748aa290 media: v4l2-mem2mem: add lock to protect parameter n=
um_rdy
> > >     985086704267 smb: client: fix warning in cifs_smb3_do_mount()
> > >     a3f252436e57 ovl: check type and offset of struct vfsmount in ovl=
_entry
> > >     1a650d3ccd79 RDMA/mlx5: Return the firmware result upon destroyin=
g QP/RQ
> > >     9631d88503ab HID: add quirk for 03f0:464a HP Elite Presenter Mous=
e
> > >     4921792e04f2 drm/amdgpu: install stub fence into potential unused=
 fence pointers
> > >     fd41646d4350 HID: logitech-hidpp: Add USB and Bluetooth IDs for t=
he Logitech G915 TKL Keyboard
> > >     ff10cd3e9b3a dma-remap: use kvmalloc_array/kvfree for larger dma =
memory remap
> > >     e9ce774052ee ASoC: SOF: Intel: fix SoundWire/HDaudio mutual exclu=
sion
> > >     7d53d1e4765c iopoll: Call cpu_relax() in busy loops
> > >     ca66e9dd98ef ARM: dts: imx6dl: prtrvt, prtvt7, prti6q, prtwd2: fi=
x USB related warnings
> > >     cc1590830859 PCI: tegra194: Fix possible array out of bounds acce=
ss
> > >     e2d10f1de1fa net: tls: avoid discarding data on record close
> > >     9a15ca893909 net/tls: Multi-threaded calls to TX tls_dev_del
> > >     2d93157b7e2d net/tls: Perform immediate device ctx cleanup when p=
ossible
> > >     51222e1c77a1 macsec: use DEV_STATS_INC()
> > >     3d64a232e4d9 macsec: Fix traffic counters/statistics
> > >     396a1921406a selftests: forwarding: tc_actions: Use ncat instead =
of nc
> > >     d61a0886d336 selftests: forwarding: tc_actions: cleanup temporary=
 files when test is aborted
> > >     a798977df6d0 mmc: sdhci-f-sdh30: Replace with sdhci_pltfm
> > >     f6f7927ac664 Linux 5.15.127
> > >     c597d8cb0d33 timers/nohz: Last resort update jiffies on nohz_full=
 IRQ entry
> > >     b4d36e6c5dc4 timers/nohz: Switch to ONESHOT_STOPPED in the low-re=
s handler when the tick is stopped
> > >     c3b954a51b64 tick: Detect and fix jiffies update stall
> > >     af99918f0e39 sch_netem: fix issues in netem_change() vs get_dist_=
table()
> > >     5d094d4e7b99 alpha: remove __init annotation from exported page_i=
s_ram()
> > >     f8d6d25756ea scsi: qedf: Fix firmware halt over suspend and resum=
e
> > >     85db1cd1744e scsi: qedi: Fix firmware halt over suspend and resum=
e
> > >     e70469c28953 scsi: fnic: Replace return codes in fnic_clean_pendi=
ng_aborts()
> > >     6bc7f4c8c27d scsi: core: Fix possible memory leak if device_add()=
 fails
> > >     461f8ac666fa scsi: snic: Fix possible memory leak if device_add()=
 fails
> > >     171e117cdc0a scsi: 53c700: Check that command slot is not NULL
> > >     7a792b3d888a scsi: storvsc: Fix handling of virtual Fibre Channel=
 timeouts
> > >     0f52d7b78251 scsi: core: Fix legacy /proc parsing buffer overflow
> > >     b757ef99df39 netfilter: nf_tables: report use refcount overflow
> > >     9bdbbcf9d148 nvme-rdma: fix potential unbalanced freeze & unfreez=
e
> > >     d68f8ef6ef70 nvme-tcp: fix potential unbalanced freeze & unfreeze
> > >     ae6e21f8bb2a btrfs: set cache_block_group_error if we find an err=
or
> > >     314135b7bae9 btrfs: reject invalid reloc tree root keys with stac=
k dump
> > >     69dd147de419 btrfs: exit gracefully if reloc roots don't match
> > >     c40d4b60c58d btrfs: don't stop integrity writeback too early
> > >     555e126dd30b ibmvnic: Handle DMA unmapping of login buffs in rele=
ase functions
> > >     34fcc823823a ibmvnic: Unmap DMA login rsp buffer on send login fa=
il
> > >     cee62753cf2e ibmvnic: Enforce stronger sanity checks on login res=
ponse
> > >     27e8db8380eb net/mlx5: Skip clock update work when device is in e=
rror state
> > >     f638fc2f7377 net/mlx5: Allow 0 for total host VFs
> > >     086a80eb6213 dmaengine: mcf-edma: Fix a potential un-allocated me=
mory access
> > >     7e1dc94b2d50 nexthop: Fix infinite nexthop bucket dump when using=
 maximum nexthop ID
> > >     608a4327c257 nexthop: Make nexthop bucket dump more efficient
> > >     4457300cfd84 nexthop: Fix infinite nexthop dump when using maximu=
m nexthop ID
> > >     91307347d632 net: hns3: add wait until mac link down
> > >     094310eb2b93 net: hns3: refactor hclge_mac_link_status_wait for i=
nterface reuse
> > >     1ae9703c2e32 net: phy: at803x: remove set/get wol callbacks for A=
R8032
> > >     7d496cd83a9d RDMA/umem: Set iova in ODP flow
> > >     f78a4238a873 wifi: cfg80211: fix sband iftype data lookup for AP_=
VLAN
> > >     26a27dd76054 drm/rockchip: Don't spam logs in atomic check
> > >     918c1e6843b7 IB/hfi1: Fix possible panic during hotplug remove
> > >     df21468bfdc8 iavf: fix potential races for FDIR filters
> > >     b1f985cf1c52 drivers: net: prevent tun_build_skb() to exceed the =
packet size limit
> > >     f239c9e1d98b dccp: fix data-race around dp->dccps_mss_cache
> > >     49a1fee22fae bonding: Fix incorrect deletion of ETH_P_8021AD prot=
ocol vid from slaves
> > >     789fcd94c9ca xsk: fix refcount underflow in error path
> > >     e95808121953 tunnels: fix kasan splat when generating ipv4 pmtu e=
rror
> > >     7903311b2cec net/packet: annotate data-races around tp->status
> > >     f4614e379bf9 mISDN: Update parameter type of dsp_cmx_send()
> > >     3961761af392 bpf, sockmap: Fix bug that strp_done cannot be calle=
d
> > >     20d53895d5c0 bpf, sockmap: Fix map type error in sock_map_del_lin=
k
> > >     a09c258cfa77 net: core: remove unnecessary frame_sz check in bpf_=
xdp_adjust_tail()
> > >     85af0b226c0b selftests: forwarding: tc_flower: Relax success crit=
erion
> > >     7b3fa99526f9 selftests: forwarding: Switch off timeout
> > >     e410f85ebca9 selftests: forwarding: Skip test when no interfaces =
are specified
> > >     4a4499452620 selftests: forwarding: ethtool_extended_state: Skip =
when using veth pairs
> > >     b8d216e9c607 selftests: forwarding: ethtool: Skip when using veth=
 pairs
> > >     b9dfb80d9fb2 selftests: forwarding: Add a helper to skip test whe=
n using veth pairs
> > >     b973eb76dff3 selftests/rseq: Fix build with undefined __weak
> > >     b8b8db5857d4 drm/nouveau/disp: Revert a NULL check inside nouveau=
_connector_get_modes
> > >     4c6767c8bf5e x86: Move gds_ucode_mitigated() declaration to heade=
r
> > >     f919cbc90441 x86/speculation: Add cpu_show_gds() prototype
> > >     9290ef14c96b x86/mm: Fix VDSO and VVAR placement on 5-level pagin=
g machines
> > >     829409510d00 x86/cpu/amd: Enable Zenbleed fix for AMD Custom APU =
0405
> > >     c41a22b93d7c x86/srso: Fix build breakage with the LLVM linker
> > >     c2372b1559d4 usb: typec: tcpm: Fix response to vsafe0V event
> > >     f776b94ccdf0 usb: common: usb-conn-gpio: Prevent bailing out if i=
nitial role is none
> > >     00cc14b52d6f usb: dwc3: Properly handle processing of pending eve=
nts
> > >     7a11d1e2625b usb-storage: alauda: Fix uninit-value in alauda_chec=
k_media()
> > >     945e1b3c361b misc: rtsx: judge ASPM Mode to set PETXCFG Reg
> > >     03eebad96233 binder: fix memory leak in binder_init()
> > >     a8e2ae6296d5 iio: adc: ina2xx: avoid NULL pointer dereference on =
OF device match
> > >     2df8ae1e42b8 iio: cros_ec: Fix the allocation size for cros_ec_co=
mmand
> > >     a7cedc2b7612 io_uring: correct check for O_TMPFILE
> > >     697bc234632c selftests/bpf: Fix sk_assign on s390x
> > >     127277262110 selftests/bpf: Workaround verification failure for f=
exit_bpf2bpf/func_replace_return_code
> > >     ee701208f4cc selftests/bpf: make test_align selftest more robust
> > >     683d2969a082 bpf: aggressively forget precise markings during sta=
te checkpointing
> > >     2516deeb872a bpf: stop setting precise in current state
> > >     c47d0178ad86 bpf: allow precision tracking for programs with subp=
rogs
> > >     3645510cf926 nilfs2: fix use-after-free of nilfs_root in dirtying=
 inodes via iput
> > >     36a3b560c78d radix tree test suite: fix incorrect allocation size=
 for pthreads
> > >     8d10284243b7 hwmon: (pmbus/bel-pfe) Enable PMBUS_SKIP_STATUS_CHEC=
K for pfe1100
> > >     3ad4ba2b6112 drm/amd/display: check attr flag before set cursor d=
egamma on DCN3+
> > >     621204fca047 drm/shmem-helper: Reset vma->vm_ops before calling d=
ma_buf_mmap()
> > >     64e6253f6489 drm/nouveau/gr: enable memory loads on helper invoca=
tion on all channels
> > >     bcd9eeb3a309 riscv,mmio: Fix readX()-to-delay() ordering
> > >     57772ae9b339 dmaengine: pl330: Return DMA_PAUSED when transaction=
 is paused
> > >     3ca8f5c733c4 ipv6: adjust ndisc_is_useropt() to also return true =
for PIO
> > >     6cde60777675 mmc: moxart: read scr register without changing byte=
 order
> > >     3f00757ab416 wireguard: allowedips: expand maximum node depth
> > >     aeb974907642 ksmbd: fix wrong next length validation of ea buffer=
 in smb2_set_ea()
> > >     595679098bdc ksmbd: validate command request size
> > >     24c4de4069cb Linux 5.15.126
> > >     aeb4db8ab7f1 PM: sleep: wakeirq: fix wake irq arming
> > >     b5d3a4251bd2 PM / wakeirq: support enabling wake-up irq after run=
time_suspend called
> > >     a36b522767f3 soundwire: fix enumeration completion
> > >     7996facaf0ee soundwire: bus: pm_runtime_request_resume on periphe=
ral attachment
> > >     c91c07ae0849 selftests/rseq: Play nice with binaries statically l=
inked against glibc 2.35+
> > >     1cdb50faf7f7 selftests/rseq: check if libc rseq support is regist=
ered
> > >     0f1f471b91f4 drm/imx/ipuv3: Fix front porch adjustment upon hacti=
ve aligning
> > >     5058c1444040 powerpc/mm/altmap: Fix altmap boundary check
> > >     eb7a5e4d14c8 mtd: rawnand: fsl_upm: Fix an off-by one test in fun=
_exec_op()
> > >     70643e98cbc3 mtd: rawnand: rockchip: Align hwecc vs. raw page hel=
per layouts
> > >     1796b492f8cc mtd: rawnand: rockchip: fix oobfree offset and descr=
iption
> > >     f6807b62fb0e mtd: rawnand: omap_elm: Fix incorrect type in assign=
ment
> > >     596be6716bc5 ext2: Drop fragment support
> > >     0ccfe21949bc fs: Protect reconfiguration of sb read-write from ra=
cing writes
> > >     27d0f755d649 net: usbnet: Fix WARNING in usbnet_start_xmit/usb_su=
bmit_urb
> > >     fbe5a2fed815 Bluetooth: L2CAP: Fix use-after-free in l2cap_sock_r=
eady_cb
> > >     afd9a31b5aa4 fs/sysv: Null check to prevent null-ptr-deref bug
> > >     80ec112c1996 fs/ntfs3: Use __GFP_NOWARN allocation at ntfs_load_a=
ttr_list()
> > >     0d6f639f1dcd file: reinstate f_pos locking optimization for regul=
ar files
> > >     b44d28b98f18 bpf, cpumap: Make sure kthread is running before map=
 update returns
> > >     8089eb93d678 drm/ttm: check null pointer before accessing when sw=
apping
> > >     ef0d07c66843 open: make RESOLVE_CACHED correctly test for O_TMPFI=
LE
> > >     c81bdf8f9f2b bpf: Disable preemption in bpf_event_output
> > >     ae07cfe2b099 rbd: prevent busy loop when requesting exclusive loc=
k
> > >     7978bcca4c1f wifi: mt76: mt7615: do not advertise 5 GHz on first =
phy of MT7615D (DBDC)
> > >     32ca6a55e10e net: tap_open(): set sk_uid from current_fsuid()
> > >     4ed3eed99ee6 net: tun_chr_open(): set sk_uid from current_fsuid()
> > >     adacc3a954fa arm64: dts: stratix10: fix incorrect I2C property fo=
r SCL signal
> > >     b92c88009da1 mtd: rawnand: meson: fix OOB available bytes for ECC
> > >     b0875c583e41 mtd: spinand: toshiba: Fix ecc_get_status
> > >     1c33ca1e1974 exfat: release s_lock before calling dir_emit()
> > >     8a34a242cf03 exfat: use kvmalloc_array/kvfree instead of kmalloc_=
array/kfree
> > >     a74878207b02 x86/CPU/AMD: Do not leak quotient data after a divis=
ion by 0
> > >     b8f029fc4075 firmware: arm_scmi: Drop OF node reference in the tr=
ansport channel setup
> > >     287c2c8677ed ceph: defer stopping mdsc delayed_work
> > >     98b521d10e73 USB: zaurus: Add ID for A-300/B-500/C-700
> > >     cd6872f2cf56 libceph: fix potential hang in ceph_osdc_notify()
> > >     e5f5b4a89809 scsi: storvsc: Limit max_sectors for virtual Fibre C=
hannel devices
> > >     212a9a3c67be scsi: zfcp: Defer fc_rport blocking until after ADIS=
C response
> > >     dac382725394 tcp_metrics: fix data-race in tcpm_suck_dst() vs fas=
topen
> > >     4517782e1bc3 tcp_metrics: annotate data-races around tm->tcpm_net
> > >     e842a68667d4 tcp_metrics: annotate data-races around tm->tcpm_val=
s[]
> > >     d3184bea4ace tcp_metrics: annotate data-races around tm->tcpm_loc=
k
> > >     9a7367cbe33d tcp_metrics: annotate data-races around tm->tcpm_sta=
mp
> > >     6f6bd67f4894 tcp_metrics: fix addr_same() helper
> > >     b0acbcf1e7a1 prestera: fix fallback to previous version on same m=
ajor version
> > >     d6d9d0f5a5e0 net/mlx5: fs_core: Skip the FTs in the same FS_TYPE_=
PRIO_CHAINS fs_prio
> > >     c999fb1039dd net/mlx5: fs_core: Make find_closest_ft more generic
> > >     32ef2c0c6cf1 vxlan: Fix nexthop hash size
> > >     1bb54a21f4d9 ip6mr: Fix skb_under_panic in ip6mr_cache_report()
> > >     64e3affee288 s390/qeth: Don't call dev_close/dev_open (DOWN/UP)
> > >     a0da2684db18 net: dcb: choose correct policy to parse DCB_ATTR_BC=
N
> > >     193333229aac net: netsec: Ignore 'phy-mode' on SynQuacer in DT mo=
de
> > >     766c9dd00c5f net: korina: handle clk prepare error in korina_prob=
e()
> > >     6cecfdf65053 net: ll_temac: fix error checking of irq_of_parse_an=
d_map()
> > >     3761ff4f8670 net: ll_temac: Switch to use dev_err_probe() helper
> > >     5c534640a7da bpf: sockmap: Remove preempt_disable in sock_map_sk_=
acquire
> > >     79c3d81c9ad1 net/sched: cls_route: No longer copy tcf_result on u=
pdate to avoid use-after-free
> > >     9edf7955025a net/sched: cls_fw: No longer copy tcf_result on upda=
te to avoid use-after-free
> > >     262430dfc618 net/sched: cls_u32: No longer copy tcf_result on upd=
ate to avoid use-after-free
> > >     b58d34068fd9 bpf, cpumap: Handle skb as well when clean up ptr_ri=
ng
> > >     f04f6d9b3b06 net/sched: taprio: Limit TCA_TAPRIO_ATTR_SCHED_CYCLE=
_TIME to INT_MAX.
> > >     2c55d4941518 net: add missing data-race annotation for sk_ll_usec
> > >     e934c50c48e2 net: add missing data-race annotations around sk->sk=
_peek_off
> > >     fdd8d8d54d6a net: add missing READ_ONCE(sk->sk_rcvbuf) annotation
> > >     98f0d1db3a27 net: add missing READ_ONCE(sk->sk_sndbuf) annotation
> > >     0d1047b77b23 net: add missing READ_ONCE(sk->sk_rcvlowat) annotati=
on
> > >     6c058a1f67f0 net: annotate data-races around sk->sk_max_pacing_ra=
te
> > >     2950c5ac65b3 qed: Fix scheduling in a tasklet while getting stats
> > >     a19952dbb5b6 qed: Fix kernel-doc warnings
> > >     6d8c259f4827 mISDN: hfcpci: Fix potential deadlock on &hc->lock
> > >     8dedcc6af341 net: sched: cls_u32: Fix match key mis-addressing
> > >     675d29de69c7 perf test uprobe_from_different_cu: Skip if there is=
 no gcc
> > >     0f6e3d8d7f91 net: dsa: fix value check in bcm_sf2_sw_probe()
> > >     047508edd602 rtnetlink: let rtnl_bridge_setlink checks IFLA_BRIDG=
E_MODE length
> > >     cc9ebceaa6d0 bpf: Add length check for SK_DIAG_BPF_STORAGE_REQ_MA=
P_FD parsing
> > >     8f9a04c742e1 net/mlx5e: fix return value check in mlx5e_ipsec_rem=
ove_trailer()
> > >     00cecb0a8f9e net/mlx5: DR, fix memory leak in mlx5dr_cmd_create_r=
eformat_ctx
> > >     4c224ea31bed wifi: cfg80211: Fix return value in scan logic
> > >     8e72db3ffa5d KVM: s390: fix sthyi error handling
> > >     809edb4262f0 word-at-a-time: use the same return type for has_zer=
o regardless of endianness
> > >     b7880809d75d arm64: dts: imx8mn-var-som: add missing pull-up for =
onboard PHY reset pinmux
> > >     804e72062be4 iommu/arm-smmu-v3: Document nesting-related errata
> > >     744e6b80b830 iommu/arm-smmu-v3: Add explicit feature for nesting
> > >     fd86b5944215 iommu/arm-smmu-v3: Document MMU-700 erratum 2812531
> > >     2de9f3dcfe63 iommu/arm-smmu-v3: Work around MMU-600 erratum 10769=
82
> > >     a850fa85d477 arm64: errata: Add detection for TRBE write to out-o=
f-range
> > >     073699df4a09 arm64: errata: Add workaround for TSB flush failures
> > >     44b45e8161a5 net/mlx5: Free irqs only on shutdown callback
> > >     40601542c43c perf: Fix function pointer case
> > >     c12fa4ac8997 io_uring: gate iowait schedule on having pending req=
uests
> > >     c275eaaaa342 Linux 5.15.125
> > >     754e0c7c4a30 x86: fix backwards merge of GDS/SRSO bit
> > >     b14a3924c267 xen/netback: Fix buffer overrun triggered by unusual=
 packet
> > >     153f9a7b02d4 x86/srso: Tie SBPB bit setting to microcode patch de=
tection
> > >     df4c3823cba5 x86/srso: Fix return thunks in generated code
> > >     0071b17eb66b x86/srso: Add IBPB on VMEXIT
> > >     5398faac76a6 x86/srso: Add IBPB
> > >     c24aaa7dde5f x86/srso: Add SRSO_NO support
> > >     4e9115e194a8 x86/srso: Add IBPB_BRTYPE support
> > >     b35087763a44 x86/srso: Add a Speculative RAS Overflow mitigation
> > >     c3b4c644525e x86/cpu, kvm: Add support for CPUID_80000021_EAX
> > >     236dd7133394 x86/bugs: Increase the x86 bugs vector size to two u=
32s
> > >     0242a8bdef56 Documentation/x86: Fix backwards on/off logic about =
YMM support
> > >     27a72e350869 x86/mm: Initialize text poking earlier
> > >     d0317b9502ea mm: Move mm_cachep initialization to mm_init()
> > >     8e4c2530879d x86/mm: Use mm_alloc() in poking_init()
> > >     13ec5cb4c113 x86/mm: fix poking_init() for Xen PV guests
> > >     3e90080d5665 x86/xen: Fix secondary processors' FPU initializatio=
n
> > >     348741a9e4d3 KVM: Add GDS_NO support to KVM
> > >     59d78655f808 x86/speculation: Add Kconfig option for GDS
> > >     0cc5643b63ae x86/speculation: Add force option to GDS mitigation
> > >     348a89e20184 x86/speculation: Add Gather Data Sampling mitigation
> > >     a094d3b30967 x86/fpu: Move FPU initialization into arch_cpu_final=
ize_init()
> > >     59f2739111ca x86/fpu: Mark init functions __init
> > >     bb9c20d903f6 x86/fpu: Remove cpuinfo argument from init functions
> > >     de8b7ce4c533 x86/init: Initialize signal frame size late
> > >     041d929233bb init, x86: Move mem_encrypt_init() into arch_cpu_fin=
alize_init()
> > >     8ae795ed6115 init: Invoke arch_cpu_finalize_init() earlier
> > >     7e270cebaffd init: Remove check_bugs() leftovers
> > >     285384ac24c3 um/cpu: Switch to arch_cpu_finalize_init()
> > >     6ea421786426 sparc/cpu: Switch to arch_cpu_finalize_init()
> > >     21a1fc8d13d8 sh/cpu: Switch to arch_cpu_finalize_init()
> > >     dfeb371a2707 mips/cpu: Switch to arch_cpu_finalize_init()
> > >     4baf46a3ba00 m68k/cpu: Switch to arch_cpu_finalize_init()
> > >     8c8165cd25cf ia64/cpu: Switch to arch_cpu_finalize_init()
> > >     de8c592cc5a1 ARM: cpu: Switch to arch_cpu_finalize_init()
> > >     75da6209d3ba x86/cpu: Switch to arch_cpu_finalize_init()
> > >     0774fc2177c3 init: Provide arch_cpu_finalize_init()
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
> > >  .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
> > >  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++--------=
--
> > >  3 files changed, 19 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/=
recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > > index 6ac3118f81..f7286759a9 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > > @@ -11,13 +11,13 @@ python () {
> > >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/ke=
rnel to linux-yocto-rt to enable it")
> > >  }
> > >
> > > -SRCREV_machine ?=3D "0ac91942af8fec31671ffe62e9518aaf15f110b3"
> > > -SRCREV_meta ?=3D "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
> > > +SRCREV_machine ?=3D "423b5d5cb3f45a272285fa4157d1964086fabc2e"
> > > +SRCREV_meta ?=3D "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
> > >
> > >  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${K=
BRANCH};name=3Dmachine \
> > >             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmet=
a;name=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA}"
> > >
> > > -LINUX_VERSION ?=3D "5.15.124"
> > > +LINUX_VERSION ?=3D "5.15.141"
> > >
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086ae=
dcd7e46"
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/met=
a/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > > index 9c06ddf200..7461087299 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > > @@ -5,7 +5,7 @@ KCONFIG_MODE =3D "--allnoconfig"
> > >
> > >  require recipes-kernel/linux/linux-yocto.inc
> > >
> > > -LINUX_VERSION ?=3D "5.15.124"
> > > +LINUX_VERSION ?=3D "5.15.141"
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086ae=
dcd7e46"
> > >
> > >  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native',=
 '', d)}"
> > > @@ -14,8 +14,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
> > >  KMETA =3D "kernel-meta"
> > >  KCONF_BSP_AUDIT_LEVEL =3D "2"
> > >
> > > -SRCREV_machine ?=3D "cdb289c798fe1fc9f259a08c32e2dd9516ccb7a4"
> > > -SRCREV_meta ?=3D "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
> > > +SRCREV_machine ?=3D "ddf2eeeb31d1edaa5a80e9aabc8b2674ae95f865"
> > > +SRCREV_meta ?=3D "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
> > >
> > >  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/rec=
ipes-kernel/linux/linux-yocto_5.15.bb
> > > index 439479022b..c7b07dee62 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > > @@ -14,24 +14,24 @@ KBRANCH:qemux86  ?=3D "v5.15/standard/base"
> > >  KBRANCH:qemux86-64 ?=3D "v5.15/standard/base"
> > >  KBRANCH:qemumips64 ?=3D "v5.15/standard/mti-malta64"
> > >
> > > -SRCREV_machine:qemuarm ?=3D "676a22c65ec0f8bb5dc7e13d130f6e3764959d7=
5"
> > > -SRCREV_machine:qemuarm64 ?=3D "f0e7afd5948f71be062cd9194b56cd03de94b=
7cb"
> > > -SRCREV_machine:qemumips ?=3D "0f1ceb9008f182cd7f21420bbec6f21a67da83=
97"
> > > -SRCREV_machine:qemuppc ?=3D "4ec9fc13283ce01627ef8c32617a1eb71e127c6=
2"
> > > -SRCREV_machine:qemuriscv64 ?=3D "1c09be01f4b87f60ea64136459167d73502=
a118f"
> > > -SRCREV_machine:qemuriscv32 ?=3D "1c09be01f4b87f60ea64136459167d73502=
a118f"
> > > -SRCREV_machine:qemux86 ?=3D "1c09be01f4b87f60ea64136459167d73502a118=
f"
> > > -SRCREV_machine:qemux86-64 ?=3D "1c09be01f4b87f60ea64136459167d73502a=
118f"
> > > -SRCREV_machine:qemumips64 ?=3D "fad09cc6acf2175aa6b5979ef48cd5f05afc=
3da0"
> > > -SRCREV_machine ?=3D "1c09be01f4b87f60ea64136459167d73502a118f"
> > > -SRCREV_meta ?=3D "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
> > > +SRCREV_machine:qemuarm ?=3D "0bd882ff2a47566033965928ab468491f7e1ffd=
6"
> > > +SRCREV_machine:qemuarm64 ?=3D "d353330a9ba30300be32f1d732723ae3678da=
684"
> > > +SRCREV_machine:qemumips ?=3D "7f8fbffda634dc22a70f69ff2b762a1f3ff9c8=
42"
> > > +SRCREV_machine:qemuppc ?=3D "fb2191ca96824c7451fbca4eef129660d25711a=
f"
> > > +SRCREV_machine:qemuriscv64 ?=3D "54a3472506956ed41289ae423ca9b7ad4cb=
b3ab5"
> > > +SRCREV_machine:qemuriscv32 ?=3D "54a3472506956ed41289ae423ca9b7ad4cb=
b3ab5"
> > > +SRCREV_machine:qemux86 ?=3D "54a3472506956ed41289ae423ca9b7ad4cbb3ab=
5"
> > > +SRCREV_machine:qemux86-64 ?=3D "54a3472506956ed41289ae423ca9b7ad4cbb=
3ab5"
> > > +SRCREV_machine:qemumips64 ?=3D "35895af6b529915f9c09a720592554feaca9=
a2c7"
> > > +SRCREV_machine ?=3D "54a3472506956ed41289ae423ca9b7ad4cbb3ab5"
> > > +SRCREV_meta ?=3D "92bd0a656f0f9db955fb53c52be71cce9296bdb2"
> > >
> > >  # set your preferred provider of linux-yocto to 'linux-yocto-upstrea=
m', and you'll
> > >  # get the <version>/base branch, which is pure upstream -stable, and=
 the same
> > >  # meta SRCREV as the linux-yocto-standard builds. Select your versio=
n using the
> > >  # normal PREFERRED_VERSION settings.
> > >  BBCLASSEXTEND =3D "devupstream:target"
> > > -SRCREV_machine:class-devupstream ?=3D "38d4ca22a5288c4bae7e6d62a1728=
b0718d51866"
> > > +SRCREV_machine:class-devupstream ?=3D "9b91d36ba301db86bbf9e783169f7=
f6abf2585d8"
> > >  PN:class-devupstream =3D "linux-yocto-upstream"
> > >  KBRANCH:class-devupstream =3D "v5.15/base"
> > >
> > > @@ -39,7 +39,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto=
.git;name=3Dmachine;branch=3D${KBRA
> > >             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmet=
a;name=3Dmeta;branch=3Dyocto-5.15;destsuffix=3D${KMETA}"
> > >
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086ae=
dcd7e46"
> > > -LINUX_VERSION ?=3D "5.15.124"
> > > +LINUX_VERSION ?=3D "5.15.141"
> > >
> > >  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native',=
 '', d)}"
> > >  DEPENDS +=3D "openssl-native util-linux-native"
> > > --
> > > 2.39.2
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

--000000000000e902210612eec929
Content-Type: text/x-log; charset="US-ASCII"; name="parted.log"
Content-Disposition: attachment; filename="parted.log"
Content-Transfer-Encoding: base64
Content-ID: <f_lter4mqc0>
X-Attachment-Id: f_lter4mqc0

MjAyNC0wMi0yMlQyMTo0NwoyMDI0LTAyLTIyVDIxOjQ3Cm1ha2U6IEVudGVyaW5nIGRpcmVjdG9y
eSAnL3Vzci9saWIvcGFydGVkL3B0ZXN0L3Rlc3RzJwpQQVNTOiBoZWxwLXZlcnNpb24uc2gKUEFT
UzogdDAwMDAtYmFzaWMuc2gKUEFTUzogdDAwMDEtdGlueS5zaApQQVNTOiB0MDAxMC1zY3JpcHQt
bm8tY3RybC1jaGFycy5zaApQQVNTOiB0MDEwMC1wcmludC5zaApQQVNTOiB0MDEwMS1wcmludC1l
bXB0eS5zaApQQVNTOiB0MDIwMC1ncHQuc2gKUEFTUzogdDAyMDEtZ3B0LnNoClBBU1M6IHQwMjAy
LWdwdC1wbWJyLnNoClBBU1M6IHQwMjAzLWdwdC10aW55LWRldmljZS1hYm9ydC5zaApQQVNTOiB0
MDIwMy1ncHQtc2hvcnRlbmVkLWRldmljZS1wcmltYXJ5LXZhbGlkLnNoClBBU1M6IHQwMjAzLWdw
dC1jcmVhdGUtb24tbWluLXNpemVkLWRldmljZS5zaApQQVNTOiB0MDIwNS1ncHQtbGlzdC1jbG9i
YmVycy1wbWJyLnNoClBBU1M6IHQwMjA2LWdwdC1wcmludC13aXRoLWNvcnJ1cHQtcHJpbWFyeS1j
bG9iYmVycy1wbWJyLnNoClBBU1M6IHQwMjA3LUlFQy1iaW5hcnktbm90YXRpb24uc2gKUEFTUzog
dDAyMDgtbWtwYXJ0LWVuZC1pbi1JRUMuc2gKUEFTUzogdDAyMDktZ3B0LXBtYnJfYm9vdC5zaAp0
MDIxMC1ncHQtcmVzaXplZC1wYXJ0aXRpb24tZW50cnktYXJyYXkuc2g6IHNraXBwZWQgdGVzdDog
dGhpcyB0ZXN0IHJlcXVpcmVzIFBlcmwncyBEaWdlc3Q6OkNSQyBtb2R1bGUKU0tJUDogdDAyMTAt
Z3B0LXJlc2l6ZWQtcGFydGl0aW9uLWVudHJ5LWFycmF5LnNoCnQwMjExLWdwdC1yZXdyaXRlLWhl
YWRlci5zaDogc2tpcHBlZCB0ZXN0OiB0aGlzIHRlc3QgcmVxdWlyZXMgUGVybCdzIERpZ2VzdDo6
Q1JDIG1vZHVsZQpTS0lQOiB0MDIxMS1ncHQtcmV3cml0ZS1oZWFkZXIuc2gKUEFTUzogdDAyMTIt
Z3B0LW1hbnktcGFydGl0aW9ucy5zaApQQVNTOiB0MDIxMy1ta3BhcnQtc3RhcnQtbmVnYXRpdmUu
c2gKUEFTUzogdDAyMjAtZ3B0LW1zZnRyZXMuc2gKUEFTUzogdDAyNTAtZ3B0LnNoClBBU1M6IHQw
MjUxLWdwdC11bmljb2RlLnNoClBBU1M6IHQwMjgwLWdwdC1jb3JydXB0LnNoClBBU1M6IHQwMjgx
LWdwdC1ncm93LnNoClBBU1M6IHQwMjgyLWdwdC1tb3ZlLWJhY2t1cC5zaApQQVNTOiB0MDI4My1v
dmVybGFwLXBhcnRpdGlvbnMuc2gKUEFTUzogdDAzMDAtZG9zLW9uLWdwdC5zaApQQVNTOiB0MDMw
MS1vdmVyd3JpdGUtZ3B0LXBtYnIuc2gKUEFTUzogdDAzNTAtbWFjLVBULWluY3JlYXNlcy1zZWN0
b3Itc2l6ZS5zaApQQVNTOiB0MDQwMC1sb29wLWNsb2JiZXItaW5mbG9vcC5zaApQQVNTOiB0MDUw
MC1kdXAtY2xvYmJlci5zaApQQVNTOiB0MDUwMS1kdXBsaWNhdGUuc2gKUEFTUzogdDExMDAtYnVz
eS1sYWJlbC5zaApQQVNTOiB0MTEwMS1idXN5LXBhcnRpdGlvbi5zaApQQVNTOiB0MTEwMi1sb29w
LWxhYmVsLnNoCkZBSUw6IHQxMTA0LXJlbW92ZS1hbmQtYWRkLXBhcnRpdGlvbi5zaAo6IG5vIHhm
cyBzdXBwb3J0Cjogbm8gbmlsZnMyIHN1cHBvcnQKOiBubyBudGZzIHN1cHBvcnQKOiBubyBoZnNw
bHVzIHN1cHBvcnQKOiBubyB1ZGYgc3VwcG9ydAo6IG5vIGYyZnMgc3VwcG9ydApQQVNTOiB0MTcw
MC1wcm9iZS1mcy5zaApQQVNTOiB0MTcwMS1yZXNjdWUtZnMuc2gKUEFTUzogdDIyMDAtZG9zLWxh
YmVsLXJlY29nLnNoClBBU1M6IHQyMjAxLXBjOTgtbGFiZWwtcmVjb2cuc2gKUEFTUzogdDIzMDAt
ZG9zLWxhYmVsLWV4dGVuZGVkLWJvb3Rjb2RlLnNoClBBU1M6IHQyMzEwLWRvcy1leHRlbmRlZC0y
LXNlY3Rvci1taW4tb2Zmc2V0LnNoClBBU1M6IHQyMzIwLWRvcy1leHRlbmRlZC1ub2Nsb2JiZXIu
c2gKUEFTUzogdDI0MDAtZG9zLWhmcy1wYXJ0aXRpb24tdHlwZS5zaApQQVNTOiB0MjQxMC1kb3Mt
dWRmLXBhcnRpdGlvbi10eXBlLnNoClBBU1M6IHQyNTAwLXByb2JlLWNvcnJ1cHQtaGZzLnNoCnQz
MDAwLXJlc2l6ZS1mcy5zaDogc2tpcHBlZCB0ZXN0OiBta2ZzLmhmczogY29tbWFuZCBub3QgZm91
bmQKU0tJUDogdDMwMDAtcmVzaXplLWZzLnNoClBBU1M6IHQzMjAwLXJlc2l6ZS1wYXJ0aXRpb24u
c2gKdDMyMDAtdHlwZS1jaGFuZ2Uuc2g6IGZhaWxlZCB0ZXN0OiBwYXJ0ZWQgY2hhbmdlZCB0aGUg
dHlwZSBvZiBwYXJ0aXRpb24gMSBmcm9tIDBjIHRvIDgzClhGQUlMOiB0MzIwMC10eXBlLWNoYW5n
ZS5zaApQQVNTOiB0MzMwMC1wYWxvLXByZXAuc2gKUEFTUzogdDMzMTAtZmxhZ3Muc2gKUEFTUzog
dDM0MDAtd2hvbGUtZGlzay1GQVQtcGFydGl0aW9uLnNoClBBU1M6IHQ0MDAwLXN1bi1yYWlkLXR5
cGUuc2gKUEFTUzogdDQwMDEtc3VuLXZ0b2Muc2gKdDQxMDAtbXNkb3MtcGFydGl0aW9uLWxpbWl0
cy5zaDogc2tpcHBlZCB0ZXN0OiB0aGlzIHRlc3QgcmVxdWlyZXMgWEZTIHN1cHBvcnQKU0tJUDog
dDQxMDAtbXNkb3MtcGFydGl0aW9uLWxpbWl0cy5zaAp0NDEwMC1kdmgtcGFydGl0aW9uLWxpbWl0
cy5zaDogc2tpcHBlZCB0ZXN0OiB0aGlzIHRlc3QgcmVxdWlyZXMgWEZTIHN1cHBvcnQKU0tJUDog
dDQxMDAtZHZoLXBhcnRpdGlvbi1saW1pdHMuc2gKUEFTUzogdDQxMDAtbXNkb3Mtc3RhcnRpbmct
c2VjdG9yLnNoCnQ0MjAwLXBhcnRwcm9iZS5zaDogc2tpcHBlZCB0ZXN0OiBUaGlzIHRlc3QgcmVx
dWlyZXMgYW4gZXJhc2FibGUgZGV2aWNlIGFuZCB5b3UgaGF2ZSBub3QgcHJvcGVybHkgc2V0IHRo
ZSAkREVWSUNFX1RPX0VSQVNFIGFuZCAkREVWSUNFX1RPX0VSQVNFX1NJWkUgZW52dmFycy4KU0tJ
UDogdDQyMDAtcGFydHByb2JlLnNoClBBU1M6IHQ0MzAwLW5pbGZzMi10aW55LnNoClBBU1M6IHQ0
MzAxLW5pbGZzMi1iYWRzYjIuc2gKUEFTUzogdDQzMDItbmlsZnMyLWxlc3NiYWRzYjIuc2gKUEFT
UzogdDUwMDAtdGFncy5zaAp0NjAwMC1kbS5zaDogc2tpcHBlZCB0ZXN0OiBubyBkZXZpY2UtbWFw
cGVyIHN1cHBvcnQKU0tJUDogdDYwMDAtZG0uc2gKdDYwMDEtcHNlcC5zaDogc2tpcHBlZCB0ZXN0
OiBubyBkZXZpY2UtbWFwcGVyIHN1cHBvcnQKU0tJUDogdDYwMDEtcHNlcC5zaAp0NjAwMi1kbS1i
dXN5LnNoOiBza2lwcGVkIHRlc3Q6IG5vIGRldmljZS1tYXBwZXIgc3VwcG9ydApTS0lQOiB0NjAw
Mi1kbS1idXN5LnNoCnQ2MDAzLWRtLWhpZGUuc2g6IHNraXBwZWQgdGVzdDogbm8gZGV2aWNlLW1h
cHBlciBzdXBwb3J0ClNLSVA6IHQ2MDAzLWRtLWhpZGUuc2gKdDYwMDQtZG0tbWFueS1wYXJ0aXRp
b25zLnNoOiBza2lwcGVkIHRlc3Q6IG5vIGRldmljZS1tYXBwZXIgc3VwcG9ydApTS0lQOiB0NjAw
NC1kbS1tYW55LXBhcnRpdGlvbnMuc2gKdDYwMDUtZG0tdXVpZC5zaDogc2tpcHBlZCB0ZXN0OiBu
byBkZXZpY2UtbWFwcGVyIHN1cHBvcnQKU0tJUDogdDYwMDUtZG0tdXVpZC5zaAp0NjAwNi1kbS01
MTJiLXNlY3RvcnMuc2g6IHNraXBwZWQgdGVzdDogbm8gZGV2aWNlLW1hcHBlciBzdXBwb3J0ClNL
SVA6IHQ2MDA2LWRtLTUxMmItc2VjdG9ycy5zaApQQVNTOiB0NjEwMC1tZHJhaWQtcGFydGl0aW9u
cy5zaApQQVNTOiB0NzAwMC1zY3JpcHRpbmcuc2gKRkFJTDogdDgwMDAtbG9vcC5zaApGQUlMOiB0
ODAwMS1sb29wLWJsa3BnLnNoClBBU1M6IHQ5MDEwLWJpZy1zZWN0b3Iuc2gKUEFTUzogdDkwMjAt
YWxpZ25tZW50LnNoClBBU1M6IHQ5MDIxLW1heGltYS5zaApQQVNTOiB0OTAyMi1vbmUtdW5pdC1z
bmFwLnNoClBBU1M6IHQ5MDIzLXZhbHVlLWx0LW9uZS5zaApQQVNTOiB0OTAzMC1hbGlnbi1jaGVj
ay5zaApQQVNTOiB0OTA0MC1tYW55LXBhcnRpdGlvbnMuc2gKUEFTUzogdDkwNDEtdW5kZXRlY3Rl
ZC1pbi11c2UtMTZ0aC1wYXJ0aXRpb24uc2gKUEFTUzogdDkwNDItZG9zLXBhcnRpdGlvbi1saW1p
dC5zaApQQVNTOiB0OTA1MC1wYXJ0aXRpb24tdGFibGUtdHlwZXMuc2gKPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQpUZXN0c3VpdGUgc3VtbWFyeSBmb3IgR05VIHBhcnRlZCAzLjQKPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PQojIFRPVEFMOiA4NQojIFBBU1M6ICA2OAojIFNLSVA6ICAxMwojIFhGQUlMOiAxCiMgRkFJ
TDogIDMKIyBYUEFTUzogMAojIEVSUk9SOiAwCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KU2VlIHRlc3Rz
L3Rlc3Qtc3VpdGUubG9nClBsZWFzZSByZXBvcnQgdG8gYnVnLXBhcnRlZEBnbnUub3JnCj09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0KbWFrZTogKioqIFtNYWtlZmlsZToxODk0OiB0ZXN0LXN1aXRlLmxvZ10g
RXJyb3IgMQptYWtlOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9saWIvcGFydGVkL3B0ZXN0L3Rl
c3RzJwpEVVJBVElPTjogNzIK
--000000000000e902210612eec929
Content-Type: application/x-shellscript; 
	name="t1104-remove-and-add-partition.sh"
Content-Disposition: attachment; 
	filename="t1104-remove-and-add-partition.sh"
Content-Transfer-Encoding: base64
Content-ID: <f_lter9lgn1>
X-Attachment-Id: f_lter9lgn1

IyEvYmluL3NoCiMgbWFrZSBzdXJlIHRoYXQgcmVtb3ZpbmcgYSBoaWdoZXIgbnVtYmVyZWQgcGFy
dGl0aW9uIGFuZCBhZGRpbmcgYSBsb3dlcgojIG9uZSB1c2luZyB0aGF0IHNwYWNlIGF0IHRoZSBz
YW1lIHRpbWUgd29ya3MKCiMgQ29weXJpZ2h0IChDKSAyMDE0LCAyMDE5LTIwMjEgRnJlZSBTb2Z0
d2FyZSBGb3VuZGF0aW9uLCBJbmMuCgojIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5
b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiMgaXQgdW5kZXIgdGhlIHRlcm1z
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKIyB0aGUg
RnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAzIG9mIHRoZSBMaWNlbnNl
LCBvcgojIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCgojIFRoaXMgcHJvZ3Jh
bSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAojIGJ1
dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5
IG9mCiMgTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NF
LiAgU2VlIHRoZQojIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMu
CgojIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlCiMgYWxvbmcgd2l0aCB0aGlzIHByb2dyYW0uICBJZiBub3QsIHNlZSA8aHR0
cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCgouICIke3NyY2Rpcj0ufS9pbml0LnNoIjsgcGF0
aF9wcmVwZW5kXyAuLi9wYXJ0ZWQKcGF0aF9wcmVwZW5kXyAuLi9wYXJ0cHJvYmUKcmVxdWlyZV9y
b290Xwpzcz0kc2VjdG9yX3NpemVfCgpkMT0gZjE9CmNsZWFudXBfZm5fKCkKewogIHRlc3QgLW4g
IiRkMSIgJiYgbG9zZXR1cCAtZCAiJGQxIgogIHJtIC1mICIkZjEiCn0KCmYxPSQocHdkKS8xOyBk
MT0kKGxvb3Bfc2V0dXBfICIkZjEiKSBcCiAgfHwgc2tpcF8gImlzIHRoaXMgcGFydGl0aW9uIG1v
dW50ZWQgd2l0aCAnbm9kZXYnPyIKCnJlcXVpcmVfcGFydGl0aW9uYWJsZV9sb29wX2RldmljZV8g
JGQxCgojIGNyZWF0ZSBvbmUgYmlnIHBhcnRpdGlvbgpwYXJ0ZWQgLXMgJGQxIG1rbGFiZWwgbXNk
b3MgbWtwYXJ0IHByaW1hcnkgZXh0MiAxbSAxMG0gfHwgZmFpbD0xCgojIHNhdmUgdGhpcyB0YWJs
ZQpkZCBpZj0kZDEgb2Y9c2F2ZWQgY291bnQ9MSB8fCBmYWlsPTEKCiMgY3JlYXRlIHR3byBzbWFs
bCBwYXJ0aXRpb25zCnBhcnRlZCAtcyAkZDEgbWtsYWJlbCBtc2RvcyBta3BhcnQgcHJpbWFyeSBl
eHQyIDFtIDVtIG1rcGFydCBwcmltYXJ5IGV4dDIgNW0gMTBtIHx8IGZhaWw9MQoKIyByZXN0b3Jl
IGZpcnN0IHRhYmxlIGFuZCBtYWtlIHN1cmUgcGFydHByb2JlIHdvcmtzCmRkIGlmPXNhdmVkIG9m
PSRkMSB8fCBmYWlsPTEKcGFydHByb2JlICRkMSB8fCBmYWlsPTEKCkV4aXQgJGZhaWwK
--000000000000e902210612eec929
Content-Type: application/x-shellscript; name="t8000-loop.sh"
Content-Disposition: attachment; filename="t8000-loop.sh"
Content-Transfer-Encoding: base64
Content-ID: <f_lterati12>
X-Attachment-Id: f_lterati12

IyEvYmluL3NoCiMgVGVzdCB1c2FnZSBvZiBsb29wIGRldmljZXMKCiMgQ29weXJpZ2h0IChDKSAy
MDA4LTIwMTQsIDIwMTktMjAyMSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KCiMgVGhp
cyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9v
ciBtb2RpZnkKIyBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGFzIHB1Ymxpc2hlZCBieQojIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVp
dGhlciB2ZXJzaW9uIDMgb2YgdGhlIExpY2Vuc2UsIG9yCiMgKGF0IHlvdXIgb3B0aW9uKSBhbnkg
bGF0ZXIgdmVyc2lvbi4KCiMgVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3Bl
IHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCiMgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRo
b3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKIyBNRVJDSEFOVEFCSUxJVFkgb3IgRklU
TkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCiMgR05VIEdlbmVyYWwgUHVi
bGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KCiMgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVk
IGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKIyBhbG9uZyB3aXRoIHRo
aXMgcHJvZ3JhbS4gIElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4K
Ci4gIiR7c3JjZGlyPS59L2luaXQuc2giOyBwYXRoX3ByZXBlbmRfIC4uL3BhcnRlZAoKcmVxdWly
ZV9yb290Xwpsdm1faW5pdF9yb290X2Rpcl8KCmQxPSBmMT0KY2xlYW51cF9mbl8oKQp7CiAgdGVz
dCAtbiAiJGQxIiAmJiBsb3NldHVwIC1kICIkZDEiCiAgcm0gLWYgIiRmMSIKfQoKZjE9JChwd2Qp
LzE7IGQxPSQobG9vcF9zZXR1cF8gIiRmMSIpIFwKICB8fCBza2lwXyAiaXMgdGhpcyBwYXJ0aXRp
b24gbW91bnRlZCB3aXRoICdub2Rldic/IgoKcmVxdWlyZV9wYXJ0aXRpb25hYmxlX2xvb3BfZGV2
aWNlXyAkZDEKCiMgRXhwZWN0IHRoaXMgdG8gc3VjY2VlZC4KcGFydGVkIC1zICRkMSBta2xhYmVs
IG1zZG9zID4gZXJyIDI+JjEgfHwgZmFpbD0xCmNvbXBhcmUgL2Rldi9udWxsIGVyciB8fCBmYWls
PTEgICAgICMgZXhwZWN0IG5vIG91dHB1dAoKIyBDcmVhdGUgYSBwYXJ0aXRpb24KcGFydGVkIC1z
ICRkMSBta3BhcnQgcHJpbWFyeSAxIDEwID4gZXJyIDI+JjEgfHwgZmFpbD0xCmNvbXBhcmUgL2Rl
di9udWxsIGVyciB8fCBmYWlsPTEgICAgICMgZXhwZWN0IG5vIG91dHB1dAoKRXhpdCAkZmFpbAo=
--000000000000e902210612eec929
Content-Type: application/x-shellscript; name="t8001-loop-blkpg.sh"
Content-Disposition: attachment; filename="t8001-loop-blkpg.sh"
Content-Transfer-Encoding: base64
Content-ID: <f_lterayqw3>
X-Attachment-Id: f_lterayqw3

IyEvYmluL3NoCiMgVGVzdCBzdXBwb3J0IGZvciBwYXJ0aXRpb25zIG9uIGxvb3AgZGV2aWNlcwoK
IyBDb3B5cmlnaHQgKEMpIDIwMDgtMjAxNCwgMjAxOS0yMDIxIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbiwgSW5jLgoKIyBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRp
c3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQojIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5CiMgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMyBvZiB0aGUgTGljZW5zZSwgb3IKIyAoYXQg
eW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgoKIyBUaGlzIHByb2dyYW0gaXMgZGlzdHJp
YnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKIyBidXQgV0lUSE9VVCBB
TlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZgojIE1FUkNI
QU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUK
IyBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgoKIyBZb3Ugc2hv
dWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZQojIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251
Lm9yZy9saWNlbnNlcy8+LgoKLiAiJHtzcmNkaXI9Ln0vaW5pdC5zaCI7IHBhdGhfcHJlcGVuZF8g
Li4vcGFydGVkCgpyZXF1aXJlX3Jvb3RfCnJlcXVpcmVfdWRldmFkbV9zZXR0bGVfCmx2bV9pbml0
X3Jvb3RfZGlyXwoKY2xlYW51cF9mbl8oKQp7CiAgdGVzdCAtbiAiJGxvb3BkZXYiIFwKICAgICYm
IHsgdWRldmFkbSBzZXR0bGUgLS10aW1lb3V0PTM7IGxvc2V0dXAgLWQgIiRsb29wZGV2IjsgfQp9
CgojIENyZWF0ZSBiYWNraW5nIGZpbGUKZGQgaWY9L2Rldi96ZXJvIG9mPWJhY2tpbmdfZmlsZSBi
cz0xTSBjb3VudD00ID4vZGV2L251bGwgMj4mMSB8fCBmYWlsPTEKCiMgU2V0IHVwIGxvb3AgZGV2
aWNlIG9uIHRvcCBvZiBiYWNraW5nIGZpbGUKbG9vcGRldj0kKGxvb3Bfc2V0dXBfIGJhY2tpbmdf
ZmlsZSkKdGVzdCAteiAiJGxvb3BkZXYiICYmIGZhaWw9MQoKIyBTa2lwIHRoaXMgdGVzdCBpZiBs
b29wIGRldmljZXMgYXJlIG5vdCBwYXJ0aXRpb25hYmxlLgpyZXF1aXJlX3BhcnRpdGlvbmFibGVf
bG9vcF9kZXZpY2VfICRsb29wZGV2CgojIEV4cGVjdCB0aGlzIHRvIHN1Y2NlZWQKcGFydGVkIC1z
ICIkbG9vcGRldiIgbWtsYWJlbCBtc2RvcyA+IGVyciAyPiYxIHx8IGZhaWw9MQpjb21wYXJlIC9k
ZXYvbnVsbCBlcnIgfHwgZmFpbD0xICAgICAjIGV4cGVjdCBubyBvdXRwdXQKCiMgQ3JlYXRlIGEg
cGFydGl0aW9uCnBhcnRlZCAtcyAiJGxvb3BkZXYiIG1rcGFydCBwcmltYXJ5IDFNIDJNID4gZXJy
IDI+JjEgfHwgZmFpbD0xCmNvbXBhcmUgL2Rldi9udWxsIGVyciB8fCBmYWlsPTEgICAgICMgZXhw
ZWN0IG5vIG91dHB1dAp1ZGV2YWRtIHNldHRsZSAtLXRpbWVvdXQ9NSB8fCBmYWlsPTEKCiMgVmVy
aWZ5IHRoYXQgdGhlIHBhcnRpdGlvbiBhcHBlYXJlZCBpbiAvcHJvYy9wYXJ0aXRpb25zCmVudHJ5
PSQoYmFzZW5hbWUgIiRsb29wZGV2InAxKQpncmVwICIkZW50cnkiIC9wcm9jL3BhcnRpdGlvbnMg
fHwgeyBjYXQgL3Byb2MvcGFydGl0aW9uczsgZmFpbD0xOyB9CgojIFJlbW92ZSB0aGUgcGFydGl0
aW9uCnBhcnRlZCAtcyAiJGxvb3BkZXYiIHJtIDEgPiBlcnIgMj4mMSB8fCBmYWlsPTEKY29tcGFy
ZSAvZGV2L251bGwgZXJyIHx8IGZhaWw9MSAgICAgIyBleHBlY3Qgbm8gb3V0cHV0CnVkZXZhZG0g
c2V0dGxlIC0tdGltZW91dD01IHx8IGZhaWw9MQoKIyBWZXJpZnkgdGhhdCB0aGUgcGFydGl0aW9u
IGdvdCByZW1vdmVkIGZyb20gL3Byb2MvcGFydGl0aW9ucwpncmVwICIkZW50cnkiIC9wcm9jL3Bh
cnRpdGlvbnMgJiYgZmFpbD0xCgpFeGl0ICRmYWlsCg==
--000000000000e902210612eec929--

