Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E15C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 19:32:40 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17094.1787081555138384464
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 12:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aQHKv+/l;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84874b52eabso455568b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 12:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787081554; cv=none;
        d=google.com; s=arc-20260327;
        b=m641tLdNZIicvBPLw2kkYVw+yr0+bViuE7HDdUu47pGFZEP0TsxZrLc9TmAc+bmD5N
         cpyAuparW0DYiUOsIJzz6OeUKQmJqtey3ULk37QU2tdNoPfFu2egGVwXeZJVGzO2rdGc
         x7TFz2QIDzhIgnS9AYij5aZNYHrHcOc2bCoVzivnwVvxFZrkIxC64y3LvU9GWmbCRNRP
         fm1+WUTclBqnMG0qRaGjm68kBlElmNSYo+RQSNUvAMx4laLrFAqrFUfmtUb13CbAys6W
         QwiE/P9iQPDtWNcW9c3b/x/cnzEc0FAJUTvFgc3n5W3fLrVW5LFQgHT2PB6pF9fmpL+x
         9NpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cKNSwZOfX/VsJBApyYSUiS/QhXje5pWQxN2Q++vRPds=;
        fh=t/rLOpGHKnAUeT/ShxjWxzVwKU4oDmaUWrr2mFZo7O4=;
        b=LMIdZMZ0SnZBK0oIVb/kSHlxsujqVyGPoRB+oHaV+lEDSytBvRLaFhr5mjEsu/atix
         bPsfIqgx+2gbeZ0DeIK0DQszD0hdtNhQNGghvEoR+9HjDZeBoBp/Os5oJmZETHV5i2DT
         ec9Anrz0zBUtuVb4yxyJSHdkMPy7UI81SCdmCfe8kH1tlIzltI0HWTKYXtXV2C3fgPeA
         umh9FMSG0UuKWZyw6Au19f6uJa8y6tyAj078wzWaizHJV3QWEaHvicA8Ygo2nuJ7oKH5
         lF8KCGYis0SzwMA21fj307oa0ffj4pQLMTjrxnynjIBRduEkQN/f17fpgiR1XiANhG1D
         j2fw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787081554; x=1787686354; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cKNSwZOfX/VsJBApyYSUiS/QhXje5pWQxN2Q++vRPds=;
        b=aQHKv+/lmtrQ9CBkifGLEDCEuZAcS+oefr7G8BWD2GRL+cwhoNBVeq85Mbj/wyBnMX
         KYwwzxlzbRTf4Uht7Fs6FffxWNwfkBPP/5Co/u39lhUA5pr1AlKrzgmiVESvA0DImqHB
         YNIZtCQ8OUhA6ZBXvzDTRnahjcmcoXFakYKdJr9KPU5AvosNW0AiukL8pPrtl3aaQmAl
         9CiLxGl6tHyG8/Z67ctQEd6XJ/L64EVTZxPh13z+157oXCKOFUf50kTb6DFtIJQ9lyyw
         D2XzZbKkgDDDaCiVYvx1F/72W/xKFYZAodmg5d9fRpjXvzKEozVZeir6NfFtVm/HpZ7+
         gYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787081554; x=1787686354;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cKNSwZOfX/VsJBApyYSUiS/QhXje5pWQxN2Q++vRPds=;
        b=sVStvGQJWcz+YZ5qxF+cjZSJL1pS8wulCeJ5Ye8Sck5x4FCy0lsTxCJFoBjt0uP7L5
         vo3hTj8NC26e5zSQox8PdGB6Y1E5dYAdYAvfx2Oy6WxGXwnLZwmbzigy/yc6FQvUncuu
         g/mWW+ngxWwWpZOKGxlhTgJDaG25bPID7zGbkHuqIJvmVLPl1KPx62tRJ0fB3BF1nI2M
         WkXozSkIS2vuXELYSsH3uzvtnDcddkmMcItDBtficUQYDMxC0LL96lkXNy3Bk7zaYDaz
         FHCVdFhdqOjBFHwdKFGWVUfvX4e5cW/TJoj4RcrXY/ao9Z9dsvqggjw8fcRLwaE1VXqg
         osHA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9SmLwEAjX99gpdg6e9ZWY52u2TZQDlTQKd2+bgIy6ZpS62D+1UR1k2mDT0SwyxfcjwFt8J2v59vOV9lrFGmcwqA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyv4kS2SEllnFg625lDDXoGpkvEhkF509OjVPON55b2lem7Ew6P
	UvHANlCvz/fNGM0+X2g2XRXZB2Pqwq879k7C1lpMG82efeyMZedB2Wg7ooVPVNTkYjkF0RJ82LC
	Q8aDU9bt6zuV3MWU6b/+5roIHTh8I2Dk=
X-Gm-Gg: AR+sD10xHH1OO4ywj48bY2oMg6S0+QnrEikykUDWKy336O+sNKAuUoiefbfBU2maIuh
	LIsF/ThWek5Kc6adnirlx52Ej1FSPYpRGDiUcwQuuNHVZ2Oieex0eN3QV8/N5J0MrEfizNte8Re
	eFEywFtsflo40EzskfcclCLH4U/bCt1hGRg7Jo4tKldv1iy7UX1go6W56j91Pd1Eurfy6ugw6lg
	tQO5L87e+OudlDL0UQGpI1sSEz98mqaGdIwnivtP6bAs/F1PQjnlTWDLtEKcgAszcwbp9GGzGBF
	wdSbk7Ala6t7LhtkFL6J4AhsY/A3TblhA9NKfJvmGntZNSbcvJZVZx0fbzG7K38IOEc4dpdynEG
	1CeULZLPF7UmoSGVUs6X3NSDIWW/PyBDhQkK/VL9xsG5Z+TaMPYn0MXSJwWTXMAV525fucfkeVg
	==
X-Received: by 2002:a05:6a00:a24c:b0:848:4faa:480b with SMTP id
 d2e1a72fcca58-851cd7e3521mr1274910b3a.12.1787081553895; Tue, 18 Aug 2026
 12:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260807164038.2624029-1-bruce.ashfield@gmail.com>
 <20260807164038.2624029-2-bruce.ashfield@gmail.com> <DKS8ELFVLFPR.2H4P52YMC7HS6@smile.fr>
In-Reply-To: <DKS8ELFVLFPR.2H4P52YMC7HS6@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Aug 2026 15:32:20 -0400
X-Gm-Features: AcwNN1VGHLaka06aefCl4axi7r-kgEs0Ceme8sqXdNkHL0R9pnZ46k_pCJsp0e4
Message-ID: <CADkTA4M9WDSa3OQeRk8pZ81HCmc=YyrFRibf5zmJQ1ZMmy_c0w@mail.gmail.com>
Subject: Re: [OE-core] [meta][scarthgaph][PATCH 02/02] linux-yocto/6.6: update
 to v6.6.150
To: Fabien Thomas <fabien.thomas@smile.fr>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 19:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243691

I just sent my proposed fix.

Bruce

On Tue, Aug 18, 2026 at 1:05=E2=80=AFPM Fabien Thomas <fabien.thomas@smile.=
fr> wrote:
>
> On Fri Aug 7, 2026 at 6:40 PM CEST, Bruce Ashfield via lists.openembedded=
.org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Updating linux-yocto/6.6 to the latest korg -stable release that compri=
ses
> > the following commits:
> >
> >     6436c12a2ced8 Linux 6.6.150
> >     6703dba1d14cb x86/bugs: Make Safe-RET robust against interrupt inje=
ction
> >     4c34a21ff85ce Revert "x86/bugs: Make Safe-RET robust against interr=
upt injection"
> >     80dfb0405055d Linux 6.6.149
> >     608c8f5dccaaf x86/bugs: Make Safe-RET robust against interrupt inje=
ction
> >     aa0e49877a2e6 Linux 6.6.148
> >     60283726f2845 KVM: SVM: Bump asid_generation on CPU online to avoid=
 ASID collision after hotplug
> >     299e2a6eb501c rxrpc: Disable IRQ, not BH, to take the lock for ->at=
tend_link
> >     410f8e562e37d udmabuf: Ensure to perform cache synchronisation in b=
egin_cpu_udmabuf()
> >     45bd023c7a4ec ASoC: mediatek: mt8195: Set ETDM1/2 IN/OUT to COMP_DU=
MMY()
> >     62f61129621ce ASoC: mediatek: mt8195: Add platform entry for ETDM1_=
OUT_BE dai link
> >     4b4a3e7ef7bb6 mm/damon/core: disallow overlapping input ranges for =
damon_set_regions()
> >     b585facbafbb5 mm/damon/core: validate ranges in damon_set_regions()
> >     1d5ad6c5a2109 coredump: fix pidfs file refcount leak in umh_coredum=
p_setup
> >     ce409086174b0 KVM: x86: Only reset TSC Deadline Timer in apic_timer=
_expired on KVM_RUN
> >     40d790e0e7d01 KVM: Introduce vcpu->wants_to_run
> >     9168176894332 fs/resctrl: Fix double-add of pseudo-locked region's =
RMID to free list
> >     96ac6c08f2c19 net: ipa: fix SMEM state handle leaks in SMP2P init
> >     6124bd7850736 net: macb: drop in-flight Tx SKBs on close
> >     4cb4b4dd8853c ata: libata-core: Reject an invalid concurrent positi=
oning ranges count
> >     148d7ec0a3a98 octeontx2-pf: fix SQB pointer leak on init failure
> >     9409e18ffe737 ipmi: fix refcount leak in i_ipmi_request()
> >     07e82e2825e3b bootconfig: fix NULL-pointer arithmetic in xbc_snprin=
t_cmdline()
> >     3fb2d026fb0de bootconfig: move xbc_snprint_cmdline() to lib/bootcon=
fig.c
> >     3a4627d4cd977 bootconfig: do not put quotes on cmdline items unless=
 necessary
> >     e9c5b03208507 octeontx2-af: cn10k: restrict VF LMTLINE sharing to i=
ts own PF
> >     207d3ebf36f65 gpio: mt7621: avoid corruption of shared interrupt tr=
igger state
> >     2636d061bc237 net: ip6_tunnel: require CAP_NET_ADMIN in the device =
netns for changelink
> >     e57a4845b0da6 gpio: tegra: do not call pinctrl for GPIO direction
> >     f53dd26462b8e pinctrl: remove pinctrl_gpio_direction_output()
> >     2e276b14b6d37 net: mana: Validate the packet length reported by the=
 NIC
> >     3cfaac77b3c32 locking/rt: Fix the incorrect RCU protection in rt_sp=
in_unlock()
> >     4714e95f5d61c wifi: libertas_tf: fix use-after-free in lbtf_free_ad=
apter()
> >     25acb6711da6f tracing/user_events: Fix use-after-free in user_event=
_mm_dup()
> >     017ea3f38a2d6 workqueue: Add system_percpu_wq and system_dfl_wq
> >     e0d8c1d9232f0 workqueue: Factor out init_cpu_worker_pool()
> >     a5dd47ea3904d Input: ims-pcu - fix firmware leak in async update
> >     5e7cd480fb691 firmware_loader: introduce __free() cleanup hanler
> >     ac99781115d37 dm-verity: make error counter atomic
> >     949f14390fe48 dm-verity: avoid double increment of &use_bh_wq_enabl=
ed
> >     45ead2e598cc8 ovl: use linked upper dentry in copy-up tmpfile
> >     a442c258320b6 NFS: Charge unstable writes by request size, not foli=
o size
> >     98e9a7bfd3a45 nfs: remove dead code for the old swap over NFS imple=
mentation
> >     016ef0f6ca4bc i2c: imx: fix locked bus on SMBus block-read of 0 (at=
omic)
> >     9d9c1f10f5642 i2c: imx: separate atomic, dma and non-dma use case
> >     e4908b3bed755 platform/x86: dell-laptop: fix missing cleanups in in=
it error path
> >     14b586152bb49 platform/x86: dell-smbios: Move request functions for=
 reuse
> >     2733b5dcb5a4b dmaengine: dw-edma-pcie: Reject devices without drive=
r data
> >     ac710b2f4f2fe dmaengine: dw-edma: Fix confusing cleanup.h syntax
> >     5cfa46154e0c9 dma: dw-edma: Fix build warning in dw_edma_pcie_probe=
()
> >     f12885fe1bdb0 taskstats: retain dead thread stats in TGID queries
> >     ee14a2d7f07e0 taskstats: fill_stats_for_tgid: use for_each_thread()
> >     d26f0b293b437 mtd: rawnand: Pause continuous reads at block boundar=
ies
> >     f83ba55179c27 mtd: rawnand: Ensure all continuous terms are always =
in sync
> >     9db680306555c mtd: rawnand: Add a helper for calculating a page ind=
ex
> >     8d94813696095 mm/mm_init: fix pageblock migratetype for ZONE_DEVICE=
 compound pages
> >     fc2214723b45d SUNRPC: Return an error from xdr_buf_to_bvec() on ove=
rflow
> >     18387968cff28 SUNRPC: Add helpers to convert xdr_buf byte ranges to=
 scatterlists
> >     844520b33c805 sunrpc: allocate a separate bvec array for socket sen=
ds
> >     43ffd230b9cc1 NFSD: pass nfsd_file to nfsd_iter_read()
> >     4fee43759b489 netfilter: nft_fib: reject fib expression on the netd=
ev egress hook
> >     7cd3fee7b361e netfilter: nf_tables: remove register tracking infras=
tructure
> >     363e37bebbbd5 netfilter: nf_tables: Remove unused nft_reduce_is_rea=
donly()
> >     e64a48c50a1ff netfilter: nf_conntrack_sip: validate skb_dst() befor=
e accessing it
> >     0d713c11de5da netfilter: nf_conntrack_sip: remove net variable shad=
owing
> >     5d4d93f9bfbc9 selinux: avoid sk_socket dereference in selinux_sctp_=
bind_connect()
> >     d787e4c3acdf7 lsm: infrastructure management of the sock security
> >     047e813324eac netfilter: nft_set_pipapo: don't leak bad clone into =
future transaction
> >     744dc9a47a845 netfilter: nft_set_pipapo: move cloning of match info=
 to insert/removal path
> >     fad1685df350f netfilter: nft_set_pipapo: prepare pipapo_get helper =
for on-demand clone
> >     840daa6bc4d12 netfilter: nft_set_pipapo: merge deactivate helper in=
to caller
> >     8e264996d95f9 netfilter: nft_set_pipapo: prepare walk function for =
on-demand clone
> >     7583b0d84ca27 netfilter: nft_set_pipapo: make pipapo_clone helper r=
eturn NULL
> >     dde6b54848a51 netfilter: nft_set_pipapo: move prove_locking helper =
around
> >     385e2a9360cc6 netfilter: nft_set_pipapo: use GFP_KERNEL for inserti=
ons
> >     233f357bf424a ASoC: mediatek: mt8183: Check runtime resume during p=
robe
> >     6e2ee6eacc3ec ASoC: mediatek: mt8192: Check runtime resume during p=
robe
> >     5f2ae0405ff50 ASoC: mediatek: mt8192-afe-pcm: Simplify probe() with=
 local dev variable
> >     074371b2d5b0e ASoC: mediatek: Use common mtk_afe_pcm_platform with =
common probe cb
> >     21fc21eb477d8 ASoC: mediatek: mt8192-afe-pcm: Simplify with dev_err=
_probe()
> >     e63067d8f4bdb ASoC: mediatek: mt8192-afe-pcm: Convert to devm_pm_ru=
ntime_enable()
> >     81051a495a9a2 ASoC: mediatek: mt8195: Remove afe-dai component and =
rework codec link
> >     fafb2e08741b2 fbdev: efifb: fix memory leak in efifb_probe()
> >     d2ac7ab193810 fbdev/efifb: Replace references to global screen_info=
 by local pointer
> >     e2007df69e606 octeontx2-vf: clear stale mailbox IRQ state before re=
quest_irq()
> >     e60543f29ffb7 octeontx2-pf: clear stale mailbox IRQ state before re=
quest_irq()
> >     d205563ee9e1e octeontx2: Annotate mmio regions as __iomem
> >     fde25641cbddd VDUSE: avoid leaking information to userspace
> >     680a38322b404 vduse: take out allocations from vduse_dev_alloc_cohe=
rent
> >     0a0f90adebc0b vduse: remove unused vaddr parameter of vduse_domain_=
free_coherent
> >     6b8d37b1998f0 vduse: Use fixed 4KB bounce pages for non-4KB page si=
ze
> >     c656e6a312322 rxrpc: Fix socket notification race
> >     dc31e0a74e34a rxrpc: Fix notification vs call-release vs recvmsg
> >     77433b730970c rxrpc: Use irq-disabling spinlocks between app and I/=
O thread
> >     95051b9f962a7 rxrpc: Don't need barrier for ->tx_bottom and ->acks_=
hard_ack
> >     12876864f9de5 tipc: restrict socket queue dumps in enqueue tracepoi=
nts
> >     03a0e49a2e38e fbcon: Use correct type for vc_resize() return value
> >     43fbdd21723f8 fbcon: Rename struct fbcon_ops to struct fbcon_par
> >     0337cdba0c477 rxrpc: serialize kernel accept preallocation with soc=
ket teardown
> >     4a7e71d5bf93c rxrpc: Pull out certain app callback funcs into an op=
s table
> >     b9f12329ef221 afs: Turn the afs_addr_list address array into an arr=
ay of structs
> >     815a1eb356f2a afs: Annotate struct afs_addr_list with __counted_by
> >     c071d94d3fb9f serial: max310x: implement gpio_chip::get_direction()
> >     10a9d4fde5478 serial: max310x: replace bare use of 'unsigned' with =
'unsigned int' (checkpatch)
> >     a8367b6f84234 ALSA: hda: Fix cached processing coefficient verbs
> >     2874c1ae0640c ALSA: hda: conexant: Remove mic bias threshold overri=
de
> >     2ef69871b313a i2c: i801: fix hardware state machine corruption in e=
rror path
> >     36eb77f14b4e6 audit: fix recursive locking deadlock in audit_dupe_e=
xe()
> >     df550e88009a6 audit: use 'unsigned int' instead of 'unsigned'
> >     26f32cae6496c audit: widen ino fields to u64
> >     3ff7d33398419 VFS/audit: introduce kern_path_parent() for audit
> >     6709fc381d53f i2c: davinci: Unregister cpufreq notifier on probe fa=
ilure
> >     16381bda90b26 fpga: dfl-afu: validate DMA mapping length in afu_dma=
_map_region()
> >     0db56e7eae932 dma-buf/udmabuf: skip redundant cpu sync to fix cache=
line EEXIST warning
> >     583fa6925df3e udmabuf: Do not create malformed scatterlists
> >     9ceebbd6f9eb5 iommu/amd: Don't split flush for amd_iommu_domain_flu=
sh_all()
> >     5337eebdf8c5d bpf: Reject BPF_MAP_TYPE_INODE_STORAGE creation if BP=
F LSM is uninitialized
> >     d65e397a1fd6e bpf: drop bpf_lsm_getselfattr from hook list
> >     2efa9f57d089a net: pcs: xpcs: fix SGMII state reading
> >     80f7dac8c9f93 io_uring/rw: fix missing ERESTARTSYS conversion in re=
ad paths
> >     cafa53d3272c6 drm/amd/display: Fix dcn32 DTB DTO update breaking li=
ve pixel rate sources
> >     67ce8034dc027 exfat: validate cluster allocation bits of the alloca=
tion bitmap
> >     4462ac3d90e89 fscrypt: Avoid dynamic allocation in fscrypt_get_devi=
ces()
> >     a16eaaf7c0b0c openvswitch: fix GSO userspace truncation underflow
> >     b7cb5bf085547 ksmbd: validate ACE size against SID sub-authorities
> >     6d9d7aa4a2c99 ksmbd: bound DACL dedup walk to copied ACEs
> >     f4fcd0c1a243d ksmbd: restore DACL size on check_add_overflow() to a=
void malformed ACL
> >     e31fada514378 ksmbd: validate num_subauth when copying ACE in set_n=
tacl_dacl
> >     8b386b6a24f61 net: qrtr: ns: Raise node count limit to 512
> >     160d3f0d7a556 ipv6: ndisc: fix NULL deref in accept_untracked_na()
> >     ef40d94114693 i40e: remove read access to debugfs files
> >     67bc3647e418e drm/amdgpu: fix aperture mapping leak
> >     bdfc7f1e0900e drm/amdgpu: invoke pm_genpd_remove() before freeing g=
enpd
> >     52f9a58829643 drm/amdgpu: fix division by zero with invalid uvd dim=
ensions
> >     b1d05cc61dfa6 drm/dp_mst: Handle torn-down topology gracefully in d=
rm_dp_mst_topology_queue_probe()
> >     bbbe6a2a8d8dc drm/amdgpu/vcn4: avoid rereading IB param length
> >     a07430abd556d drm/amdgpu/vce: fix integer overflow in image size
> >     256d6f4803a93 drm/amdgpu/sdma4.4.2: replace BUG_ON() with WARN_ON()
> >     6c8b9c1f03c71 drm/amdgpu/gfx9: replace BUG_ON() with WARN_ON()
> >     c59b57c2e0c8c drm/amdgpu/gfx9.4.3: replace BUG_ON() with WARN_ON()
> >     ab05af6c345bc drm/amdgpu/gfx8: drop unecessary BUG_ON()
> >     96b6d68f2b5a2 drm/amdgpu/gfx11: replace BUG_ON() with WARN_ON()
> >     793cdf17ddf9d drm/amdgpu/gfx10: replace BUG_ON() with WARN_ON()
> >     ff4fc24da7531 drm/amd/pm: make pp_features read-only when scpm is e=
nabled
> >     5bc8fc1d2ff80 vxlan: mdb: Fix source list corruption on a failed re=
place
> >     b07d87b31631e tipc: clear sock->sk on the failed-insert path in tip=
c_sk_create()
> >     e6493a4d1ee17 pppoe: reload header pointer after dev_hard_header()
> >     36dc6d6964a3b mctp: serial: handle zero-length frames to prevent rx=
 buffer overflow
> >     5bbf0cd9b6a70 mac802154: llsec: reject frames shorter than the auth=
entication tag
> >     bd7110f0caa32 mac802154: hold an interface reference across the sca=
n worker
> >     896a9512d0d83 ila: reload IPv6 header after pskb_may_pull in checks=
um adjust
> >     0f33178ec690a ice: use READ_ONCE() to access cached PHC time
> >     5c833074b549e ksmbd: defer destroy_previous_session() until after N=
TLM authentication
> >     14995c4250f04 rbd: Reset positive result codes to zero in object ma=
p update path
> >     c674751ea5918 proc: Fix broken error paths for namespace links
> >     e054dcd990d81 net: hip04: fix RX buffer leak on build_skb failure
> >     3f4fe26c20c30 net/x25: fix use-after-free in x25_kill_by_neigh()
> >     23658b350b410 net/iucv: fix use-after-free of a severed iucv_path
> >     8bb111f87ded6 net/af_iucv: fix NULL deref in afiucv_hs_callback_syn=
()
> >     2abdacc927c92 geneve: require CAP_NET_ADMIN in the device netns for=
 changelink
> >     eb3836eab4748 net: slip: serialize receive against buffer reallocat=
ion
> >     b3793d7dccb19 vxlan: require CAP_NET_ADMIN in the device netns for =
changelink
> >     8d931a75a38b9 phonet: pep: fix use-after-free in pep_get_sb()
> >     ae045ad927c24 iommu/vt-d: Disallow SVA if page walk is not coherent
> >     3d0dd138a06c7 ftrace: Add global mutex to serialize trace_parser ac=
cess
> >     330249609b707 fscrypt: Add missing superblock check in find_or_inse=
rt_direct_key()
> >     b98fad81f1202 fs: preserve ACL_DONT_CACHE state in forget_cached_ac=
l()
> >     e4563e07ef5c9 binfmt_elf_fdpic: only honour the first PT_INTERP
> >     fc1010e7e0204 libceph: remove debugfs files before client teardown
> >     b8a9fb6bf806f libceph: reject zero bucket types in crush_decode
> >     0591a15815b49 libceph: Reject monmaps advertising zero monitors
> >     9d37aec9ffe4e libceph: refresh auth->authorizer_buf{,_len} after au=
thorizer update
> >     c46d82c47afc9 libceph: guard missing CRUSH type name lookup
> >     05c90e059269f libceph: Fix multiplication overflow in decode_new_up=
_state_weight()
> >     340e0386aa39d libceph: bound get_version reply decode to front len
> >     9081c71796724 ceph: fix pre-auth out-of-bounds read on snaptrace in=
 ceph_handle_caps()
> >     fedeb4468987b sctp: don't free the ASCONF's own transport in DEL-IP=
 processing
> >     3422658308d16 mptcp: only set DATA_FIN when a mapping is present
> >     3cb65da64af9a mptcp: decrement subflows counter on failed passive j=
oin
> >     8e558bcaf1076 Revert "arm64: syscall: Ensure saved x0 is kept in-sy=
nc with tracer updates"
> >     8000a5f4d1d19 arm64: syscall: Ensure saved x0 is kept in-sync with =
tracer updates
> >     bdf9de52c09e9 tracing/probes: Prevent out-of-bounds write in __trac=
e_probe_log_err()
> >     da0a33d41409d tracing/probes: Fix potential underflow in LEN_OR_ZER=
O macro
> >     707720ab00c81 tracing/probes: Avoid temporary buffer truncation in =
trace_probe_match_command_args()
> >     08259252e0d36 tracing/eprobe: Fix exact system name matching in epr=
obe_dyn_event_match()
> >     f9e6dfe341fb3 tracing: Fix resource leak on mmiotrace trace_pipe cl=
ose
> >     faaf951351842 tracing: Fix mmiotrace possible NULL dereferencing of=
 hiter->dev
> >     ddcf2064d7ec5 intel_th: fix MSC output device reference leak
> >     441559d4c595f mei: bus: access mei_device under device_lock on clea=
nup
> >     1096397c31f6b serial: 8250_mid: Fix NULL function pointer dereferen=
ce on DNV/ICX-D/SNR platforms
> >     42710bb9946a0 serial: sc16is7xx: implement gpio get_direction() cal=
lback
> >     b061bb4dca49f comedi: comedi_parport: deal with premature interrupt
> >     fac60fefe8766 x86/boot/compressed: Disable jump tables
> >     7344c84e32413 cdrom: fix stack out-of-bounds read in CDROMVOLCTRL
> >     1d6e915400157 LoongArch: Fix oops during single-step debugging
> >     f8b7d5ba99ab0 platform/loongarch: laptop: Explicitly reset bl_power=
ed state when suspend
> >     0f19d54e2524f binfmt_misc: set have_execfd only once the interprete=
r is opened
> >     c62bb00caba66 exec: fix unsigned loop counter wrap in transfer_args=
_to_stack()
> >     2894bd8c68e97 Bluetooth: RFCOMM: Fix session UAF in set_termios
> >     e4fa2c5c261d7 Bluetooth: hci_sync: Protect UUID list traversal
> >     e126aaf82380c staging: rtl8723bs: fix inverted HT40 secondary chann=
el offset
> >     b9d9a4cd2e59d staging: rtl8723bs: fix OOB reads in rtw_get_wps_ie()
> >     b7d1d8cb1bdca wifi: brcmfmac: make release_scratchbuffers idempoten=
t
> >     ef2ee5f820c3e wifi: mt76: mt7921: drop TXRX_NOTIFY on non-mmio buse=
s
> >     f2a72f47c5fb4 wifi: mt76: mt7615: drop TXRX_NOTIFY on non-mmio buse=
s
> >     584c8954ad55f wifi: wilc1000: validate assoc response length before=
 subtracting header
> >     eb42c3c8fd479 wifi: mwifiex: fix NULL dereference when the AP has H=
T-cap but no HT-oper
> >     d4558c1407821 wifi: ath6kl: fix OOB access from firmware ADDBA wind=
ow size
> >     fb40d03ed792a ALSA: seq: close a re-opened queue timer in the destr=
uctor
> >     450dbb3024199 media: vpif_capture: fix OF node reference imbalance
> >     a9cd0e8fb0b21 media: vivid: check for vb2_is_busy() when toggling c=
aps
> >     783f26368b7f5 media: vivid: add vivid_update_reduced_fps()
> >     d912d5b14356c media: vimc: fix reference leak on failed device regi=
stration
> >     32623707968be media: vidtv: fix reference leak on failed device reg=
istration
> >     697b81e9c4b5b media: vb2: use ssize_t for vb2_read/vb2_write
> >     9a998cc1c3487 media: v4l2-ctrls: validate HEVC active reference cou=
nts
> >     ef78c8c02a46a media: v4l2-ctrls-request: add NULL check in v4l2_ctr=
l_request_complete()
> >     4ecf0cc0cf590 media: ti: vpe: unwind v4l2 device registration on pr=
obe error
> >     cb0502d299784 media: tegra-video: vi: fix invalid u32 return value =
in format lookup
> >     4872161e6fbe4 media: sun4i-csi: Return queued buffers on start_stre=
aming() failure
> >     37ff63c5d7119 media: stm32: dcmi: unregister notifier on probe fail=
ure
> >     134c979dd721e media: saa7134: Fix a possible memory leak in saa7134=
_video_init1
> >     465dc8e71d2db media: rtl2832_sdr: Return queued buffers on start_st=
reaming() failure
> >     9acd5bbbe1df8 media: rtl2832: fix use-after-free in rtl2832_remove(=
)
> >     4ca9c9f12b1bc media: radio-si476x: Unregister v4l2_device on probe =
failure
> >     f2f9fcacd8195 media: pwc: Return queued buffers on start_streaming(=
) failure
> >     a56e7641e09bd media: pwc: Drain fill_buf on start_streaming() failu=
re
> >     46715fecc38a2 media: pci: dm1105: Free allocated workqueue
> >     9ed0184435a16 media: nxp: imx8-isi: Fix scale factor calculation fo=
r hardware rounding
> >     690cdda752f3d media: nxp: imx8-isi: Fix potential out-of-bounds iss=
ues
> >     ff5f7c2686dc4 media: nxp: imx8-isi: Fix missing v4l2_subdev_cleanup=
() in pipe init error path
> >     1eee561d764d5 media: nxp: imx8-isi: Clean up already-initialized pi=
pes on probe failure
> >     549dd1afce2cf media: nxp: imx8-isi: Add missing v4l2_subdev_cleanup=
() in crossbar and pipe
> >     1d58229b330b7 media: msi2500: Return queued buffers on start_stream=
ing() failure
> >     c6cd08a71a630 media: meson: vdec: Fix memory leak in error path of =
vdec_open
> >     d59af4652d999 media: marvell-cam: fix missing pci_disable_device() =
on remove
> >     8fbdca4c99f68 media: cx23885: add ioremap return check and cleanup
> >     a373f1a5137e9 media: cx231xx: fix devres lifetime
> >     2ee8327c85b3a media: cedrus: skip invalid H.264 reference list entr=
ies
> >     e6db514875abc media: cedrus: Fix missing cleanup in error path
> >     d7bb9e62c0f28 media: cedrus: clean up media device on probe failure
> >     8e1c938f08e79 media: cec: seco: unregister adapter on IR probe fail=
ure
> >     f522a7f05f21a media: aspeed: fix missing of_reserved_mem_device_rel=
ease() on probe failure
> >     877686a74ecdc media: airspy: Return queued buffers on start_streami=
ng() failure
> >     9f0ee411fc2d7 drm/vc4: Prevent shader BO mappings from becoming wri=
table
> >     5ff94e1279176 drm/vmwgfx: Validate vmw_surface_metadata::array_size
> >     51eeef1949c11 drm/amdgpu: fix bo->pin leaking in amdgpu_bo_create_r=
eserved
> >     ba8bf1dcbb447 drm/amd/display: set new_stream to NULL after release
> >     f02c9e1588d49 drm/amd/pm/ci: Don't disable MCLK DPM on Bonaire 0x66=
58 (R7 260X)
> >     1615811cd365e drm/amdgpu: Fix VFCT bus number matching with soft fi=
lter
> >     edd2edaca52ad drm/i915/gem: Fix NULL deref in I915_CONTEXT_PARAM_SS=
EU
> >     f014702fbd48d drm/i915/gem: Do not leak siblings[] on proto context=
 error
> >     32c1a2afa90dd drm/i915: Return NULL on error in active_instance
> >     f6212bc1bbd93 drm/amdgpu/sdma5.0: replace BUG_ON() with WARN_ON()
> >     01dfea84df919 drm/amdgpu/sdma5.2: replace BUG_ON() with WARN_ON()
> >     2eb06c88426b6 drm/amdgpu/sdma6.0: replace BUG_ON() with WARN_ON()
> >     9fc2a017c5d59 drm/virtio: bound EDID block reads to the response bu=
ffer
> >     f9922828a4ebd drm/amd/display: detect_link_and_local_sink: DP alt m=
ode timeout path leaks prev_sink reference
> >     790aeed9df5c1 drm/amd/display: Handle struct drm_plane_state.ignore=
_damage_clips
> >     85eedff5f0c4a drm/amdkfd: Check bounds in allocate_event_notificati=
on_slot
> >     ec26f6cdcc0ee drm/radeon: fix r100_copy_blit for large BOs
> >     3ed109a721761 drm/nouveau/acr: fix missing nvkm_done() in error pat=
h of nvkm_acr_oneinit()
> >     4a27275d27597 drm/i915/gem: Add missing nospec on parallel submit s=
lot
> >     2473ac314387a drm/nouveau: fix reversed error cleanup order in ucop=
y functions
> >     3f190956404da drm/amdgpu: validate CP_GFX_SHADOW chunk size in CS p=
ass1
> >     f0d81d85e7fff drm/amdgpu: Fix amdgpu_bo_move() when old_mem and new=
_mem are both GTT
> >     4b606f32b38a6 drm/amdgpu/uvd: Place VCPU BO only in VRAM for UVD 4.=
x and older
> >     c3fae34d6cb0c drm/amdgpu/uvd: Fix forcing MSG, FB BOs into VCPU seg=
ment when it isn't at 0 (v2)
> >     bdf0508b1e678 drm/dp/mst: fix OOB reads on 2-byte fields in sideban=
d reply parsers
> >     53937a2787d29 drm/dp/mst: fix buffer overflows in sideband chunk ac=
cumulation
> >     22d9f7fc1aaab drm/dp/mst: fix OOB reads in remote DPCD/I2C sideband=
 reply parsers
> >     c18d46d9830c2 drm/bridge: cdns-dsi: Replace deprecated UNIVERSAL_DE=
V_PM_OPS()
> >     f14d66e4b5022 drm/rockchip: cdn-dp: add missing check in cdn_dp_con=
fig_video()
> >     ee762f684eefa bpf, sockmap: Fix cork use-after-free in tcp_bpf_send=
msg()
> >     2cec93b60e36b ice: fix LAG recipe to profile association
> >     b05b6bd1abf49 net: ipv6: fix dif and sdif mismatch in raw6_icmp_err=
or
> >     f110b4526f576 net/mlx5e: Reject unsupported CB Shaper TSA in ETS va=
lidation
> >     0317492024148 net/mlx5e: Report zero bandwidth for non-ETS traffic =
classes
> >     43c287ce77eaf net/mlx5: E-Switch, fix zero num_dest in prio_tag egr=
ess vlan rule
> >     4b95e1f0d6e63 net: qrtr: restrict socket creation to the initial ne=
twork namespace
> >     9f55eab598de4 hinic: remove unused ethtool RSS user configuration b=
uffers
> >     5d3427016234e ppp: annotate data races in ppp_generic
> >     97562e355e3da ppp: enable TX scatter-gather
> >     1d03e26ef1d7f ppp: convert to percpu netstats
> >     c71962f300912 ppp: use IFF_NO_QUEUE in virtual interfaces
> >     72e2ccfe39633 ipv4: icmp: fill flow parameters in icmp_route_lookup=
 decoy lookup
> >     c34fbb0e85f0f octeontx2-vf: set TC flower flag on MCAM entry alloca=
tion
> >     e99309df721e3 net: stmmac: enable the MAC on link up for all suppor=
ted speeds
> >     b664b326e1674 net: stmmac: reset residual action in L3L4 filters on=
 delete
> >     ba351ae1028df net: stmmac: fix l3l4 filter rejecting unsupported of=
fload requests
> >     f02334a9e378f tipc: fix u16 MTU truncation in media and bearer MTU =
validation
> >     92492743e9573 iomap: correct the range of a partial dirty clear
> >     667b6e52048ea vmxnet3: fix BUG_ON in vmxnet3_get_hdr_len() for Gene=
ve packets
> >     ec2e157fc9678 sctp: auth: verify auth requirement when auth_chunk i=
s NULL
> >     4528678f70e07 net: dpaa: fix mode setting
> >     f72c312af6c78 net: hsr: fix memory leak on slave unregistration by =
removing synced VLANs
> >     490011a38f437 net: bridge: vlan: fix vlan range dumps starting with=
 pvid
> >     ec2f2f62e4386 amt: make the head writable before rewriting the L2 h=
eader
> >     9005b221cb1f9 amt: re-read skb header pointers after every pull
> >     137e4710da626 wifi: brcmfmac: fix 802.1X-SHA256 call trace warning
> >     2b1882cf313ae wifi: mt76: mt7996: fix possible NULL-pointer deref i=
n mt7996_mcu_sta_bfer_eht()
> >     4fd85fd237350 wifi: mt76: mt7996: check pointer returned by mt76_co=
nnac_get_he_phy_cap()
> >     b09508dd7bc4a wifi: mt76: connac: fix possible NULL-pointer deref i=
n mt76_connac_mcu_uni_bss_he_tlv()
> >     23a2b98e754da wifi: mt76: mt7915: guard HE capability lookups
> >     f9c669d9f4cac tipc: fix infinite loop in __tipc_nl_compat_dumpit
> >     c0936c131a716 nexthop: initialize extack in nh_res_bucket_migrate()
> >     b3c733eaae7f3 gtp: check skb_pull_data() return in gtp1u_send_echo_=
resp()
> >     54dfe30a562fd selftests: openvswitch: add config file
> >     963b4ee31b1b0 selftests: af_unix: add USER_NS config
> >     eca8949e40612 selftest: af_unix: Add Kconfig file.
> >     def321ca6b32d tls: device: push pending open record on splice EOF
> >     b255d8cd6cc68 sctp: validate stream count in sctp_process_strreset_=
inreq()
> >     649c6d37a38fb pds_core: check for workqueue allocation failure
> >     646b58b543f3b pds_core: fix auxiliary device add/del races
> >     37924f5c0e955 pds_core: order completion reads after the ownership =
check
> >     f79c7afdad473 pds_core: yield the CPU while waiting for the adminq =
to drain
> >     5a365f1e42344 sctp: fix auth_chunk_list capacity check in sctp_auth=
_ep_add_chunkid
> >     a02c0ac672d95 amd-xgbe: fix MAC_AUTO_SW handling in CL37 AN
> >     3794cfb80b550 pds_core: reject component parameter in legacy firmwa=
re update
> >     70f70a4c419db wifi: mac80211: recalculate TIM when a station enters=
 power save
> >     3078d82e7fe90 iommu/intel: Fix out-of-bounds memset in dmar_latency=
_disable()
> >     1e31d2394e0db iommu/amd: Bound the early ACPI HID map
> >     a3f47d7c75dda wifi: mwifiex: bound uAP association event IEs to the=
 event buffer
> >     f4834132773f1 wan: wanxl: Only reset hardware after BAR mapping
> >     6dbd428119cb1 nfp: Check resource mutex allocation
> >     329589417214d wifi: mac80211: tear down new links on vif update err=
or path
> >     ab7faf5a172eb iommu/amd: Wait for completion instead of returning e=
arly in iommu_completion_wait()
> >     915012e923316 dpaa2-eth: put MAC endpoint device on disconnect
> >     1f4ca61b7a93d dpaa2-switch: put MAC endpoint device on disconnect
> >     1e2e2d9806944 rds: drop incoming messages that cross network namesp=
ace boundaries
> >     2a4bad24ac529 bonding: fix devconf_all NULL dereference when IPv6 i=
s disabled
> >     80ec024d53a05 net/packet: avoid fanout hook re-registration after u=
nregister
> >     8de58bfa26e02 Bluetooth: btusb: validate Realtek vendor event lengt=
h
> >     112525534ab5c hwmon: occ: validate poll response sensor blocks
> >     5b439f39f33ec smb: client: validate DFS referral PathConsumed
> >     7e3abf8ace7f0 hwmon: (asus-ec-sensors) add missed handle for ENOMEM
> >     12111669ba089 hwmon: (asus-ec-sensors) fix EC read intervals
> >     e73827d99021d hwmon: (asus-ec-sensors) fix looping over banks while=
 reading from EC
> >     c035b1198906d usb: atm: ueagle-atm: reject descriptors that confuse=
 probe and disconnect
> >     0a070d5ad7986 wifi: iwlwifi: mvm: fix read in wake packet notificat=
ion handler
> >     dafd46a720939 wifi: iwlwifi: mvm: validate SAR GEO response payload=
 size
> >     42a82b509a6d5 ASoC: cs35l56: Use complete_all() to signal init_comp=
letion
> >     34c26cc9ab74c ASoC: cs35l56: Fix potential probe() deadlock
> >     cbd3a027f2488 ASoC: cs35l56: Don't use devres to unregister compone=
nt
> >     3958f6dab9f60 ASoC: bt-sco: fix duplicate DAPM widget names for wid=
eband DAI
> >     3ddb0d3e36507 ASoC: tas2781: bound firmware description string pars=
ing
> >     92bedc0455552 btrfs: free mapping node on duplicate reloc root inse=
rt
> >     646c14273df83 btrfs: declare btrfs_ioctl_search_args_v2::buf as __u=
8
> >     5acfa18de66b6 wifi: carl9170: fix buffer overflow in rx_stream fail=
over path
> >     7ed0dce8613c9 wifi: carl9170: fix OOB read from off-by-two in TX st=
atus handler
> >     f74e34e66379e wifi: carl9170: bound memcpy length in cmd callback t=
o prevent OOB read
> >     1c690f7c4c5b3 wifi: ath6kl: fix OOB read from firmware IE lengths i=
n connect event
> >     69ac7ba3a3df6 wifi: ath6kl: fix OOB read from firmware num_msg in T=
X complete handler
> >     b7d633c7c9232 firewire: net: Fix fragmented datagram reassembly
> >     d0833f2d44de6 wifi: ath12k: Flush the posted write after writing to=
 PCIE_SOC_GLOBAL_RESET
> >     c78424ca50868 wifi: ath11k: Flush the posted write after writing to=
 PCIE_SOC_GLOBAL_RESET
> >     69a6a4f60b2da wifi: ath11k: fix potential buffer underflow in ath11=
k_hal_rx_msdu_list_get()
> >     2e47b91b9b402 watchdog: pretimeout: Fix UAF in watchdog_unregister_=
governor()
> >     185c0880397ae hwmon: (nzxt-smart2) Stop device IO before calling hi=
d_hw_stop
> >     0975c42ed2a3b hwmon: (corsair-cpro) Stop device IO before calling h=
id_hw_stop
> >     e6e1e0f3050d1 hwmon: (corsair-psu) Stop device IO before calling hi=
d_hw_stop
> >     e517e207300ed wifi: ath11k: fix NULL pointer dereference in ath11k_=
hal_srng_access_begin
> >     7f184ca38a908 wifi: ath9k: hif_usb: don't dereference hif_dev after=
 re-arming firmware request
> >     6192a3f77c97d usb: xhci-pci: Limit VIA VL805 DMA addressing to 36 b=
its
> >     f2ac9e32369b4 RISC-V: KVM: Serialize virtual interrupt pending stat=
e updates
> >     9aa3b4223df5a Revert "drm/amd/display: Add missing kdoc for ALLM pa=
rameters"
> >     7dc44840ca3cf crypto: rsa-pkcs1pad: Don't WARN on an empty digest
> >     d8d18d251049a USB: serial: option: add TDTECH MT5710-CN
> >     1420c23c6d59d USB: serial: keyspan_pda: fix data loss on receive th=
rottling
> >     ee57992c053a6 USB: serial: io_edgeport: cap received transmit credi=
ts
> >     f92bdb3df3b2e USB: serial: ftdi_sio: add support for E+H FXA291
> >     4e116372b7a4f usb: gadget: uvc: clamp SEND_RESPONSE length to the r=
esponse buffer
> >     1a1d7158420df usb: gadget: udc: bdc: free IRQ and drain func_wake_n=
otify before teardown
> >     e07751d0527cc usb: gadget: f_ncm: validate datagram bounds in ncm_u=
nwrap_ntb()
> >     ec52db6cac5df USB: gadget: fsl-udc: fix device name leak on probe f=
ailure
> >     29f3cd27ec350 USB: gadget: snps-udc: fix device name leak on probe =
failure
> >     994afccfdcceb usb: gadget: printer: fix infinite loop in printer_re=
ad()
> >     380b4bef46c2e usb: gadget: f_midi: cancel pending IN work before fr=
eeing the midi object
> >     e2b2740f1242b usb: gadget: dummy_hcd: prevent fifo_req reuse during=
 giveback
> >     fc5cc9e194b96 usb: chipidea: fix usage_count leak when autosuspend_=
delay is negative
> >     37691a2fe7646 USB: storage: add NO_ATA_1X quirk for Longmai USB Key
> >     e165a1d295e7e wifi: at76c50x-usb: avoid length underflow in at76_gu=
ess_freq()
> >     d6eee7cd078aa mpls: fix NULL deref in mpls_valid_fib_dump_req() on =
CONFIG_INET=3Dn
> >     0b4414e43e086 sctp: fix auth_hmacs array size in struct sctp_cookie
> >     531dbb5bb98e5 net/sched: act_tunnel_key: Defer dst_release to RCU c=
allback
> >     f6141a52180e6 drm/i915/selftests: Fix GT PM sort comparators
> >     2c307126ed8e7 ksmbd: validate compound request size before reading =
StructureSize2
> >     0f72fc9659d7f ksmbd: pin conn during async oplock break notificatio=
n
> >     b8f591ee8b9f7 can: j1939: fix lockless local-destination check
> >     7ffe529e71274 bpf, sockmap: Reject unhashed UDP sockets on sockmap =
update
> >     315b7d610b93f powerpc/vtime: Initialize starttime at boot for nativ=
e accounting
> >     986cb66d37e57 powerpc/time: Prepare to stop elapsing in dynticks-id=
le
> >     b8c31ebdd22f1 sched/vtime: Get rid of generic vtime_task_switch() i=
mplementation
> >     8506eaaa6481b drm/i915/gt: use correct selftest config symbol
> >     437637f5ff3f5 smb/client: handle overlapping allocated ranges in fa=
llocate
> >     5a3945e8dea6c Bluetooth: hci_qca: Clear memdump state on invalid du=
mp size
> >     b56f2ecafc08f Bluetooth: mgmt: hold reference for hci_conn in mgmt_=
pending_cmds
> >     8bc83f9ef6789 Bluetooth: mgmt: fix locking in unpair_device/disconn=
ect_sync
> >     70354dbb5f72d Bluetooth: qca: fix NVM tag length underflow in TLV p=
arser
> >     fd2049eec99e8 ALSA: usb-audio: Skip DSD quirk for Musical Fidelity =
M6s DAC
> >     4c6e64cae2b2d ata: sata_dwc_460ex: fix infinite loop in NCQ tag com=
pletion bit-scanning
> >     29f289ef8b5a0 ata: sata_dwc_460ex: fix clear_interrupt_bit() cleari=
ng all pending interrupts
> >     b99eafbc644b4 ata: sata_dwc_460ex: use platform_get_irq()
> >     fbe7df5d3a3ae ata: sata_dwc_460ex: enable SATA interrupts only afte=
r IRQ handler is registered
> >     4dc0e63abf8bc net/iucv: take a reference on the socket found in afi=
ucv_hs_rcv()
> >     8150b5365f026 ipv4: fib: free fib_alias with kfree_rcu() on insert =
error path
> >     4bb84e964ff0f ppp: defer channel free to an RCU grace period to fix=
 pppol2tp RX UAF
> >     91fdc18783459 firmware: arm_scmi: Rate-limit queue-full warnings in=
 IRQ context
> >     5143f863f864a ASoC: tas2562: fix deprecated 'shut-down' GPIO always=
 cleared after lookup
> >     0404b5b0f33b5 ASoC: cs42l43: Correct report for forced microphone j=
ack
> >     4cb0783d612ca ASoC: amd: ps: fix wrong ACP version string in pci_re=
quest_regions()
> >     4b1add0fd9600 ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF d=
atapath on start/stop
> >     20c308d9a5772 wifi: cfg80211: bound element ID read when checking n=
on-inheritance
> >     f50a2b9e57a75 wifi: brcmfmac: initialize SDIO data work before clea=
nup
> >     be9dfcb0654c1 wifi: mac80211: free AP_VLAN bc_buf SKBs outside IRQ =
lock
> >     a17f5d27cca22 wifi: cfg80211: reject unsupported PMSR FTM location =
requests
> >     44ea65d779e2d wifi: cfg80211: validate PMSR FTM preamble range
> >     642d8373c4c58 wifi: cfg80211: validate PMSR measurement type data
> >     2d372cb06387b wifi: nl80211: validate nested MBSSID IE blobs
> >     fa9592ef7de11 wifi: nl80211: free RNR data on MBSSID mismatch
> >     25c3b85af3fc4 wifi: p54: validate RX frame length in p54_rx_eeprom_=
readback()
> >     d497b7566e749 wifi: libertas: fix memory leak in helper_firmware_cb=
()
> >     82c5a30a66e2a wifi: mac80211_hwsim: clamp virtio RX length before s=
kb_put
> >     f75b9a2a9d833 wifi: ipw2100: fix potential memory leak in ipw2100_p=
ci_init_one()
> >     3368457b4871a wifi: cfg80211: cancel sched scan results work on unr=
egister
> >     d9d9cc21cc900 xfrm: policy: preallocate inexact bins before xfrm_ha=
sh_rebuild reinsert
> >     df6856c2dda91 xfrm6: clear dst.dev on error to avoid double netdev_=
put in xfrm6_fill_dst()
> >     2bc90b4535fd7 RDMA/irdma: Prevent overflows in memory contiguity ch=
ecks
> >     367958515c99f selftests/alsa: Fix memory leak in find_controls erro=
r path
> >     ffe21a3545b43 mtd: fix double free and WARN_ON in add_mtd_device() =
error paths
> >     36e91a58397ca RDMA/siw: publish QP after initialization
> >     8bf715284f08a RDMA/siw: Only check attrs->cap.max_send_wr in siw_cr=
eate_qp
> >     2fcf86887f9a5 RDMA/hns: Fix potential integer overflow in mhop hem =
cleanup
> >     0e861c8a69671 RDMA/erdma: initialize ret for empty receive WR lists
> >     fb46d134e1b86 RDMA/irdma: Prevent rereg_mr for non-mem regions
> >     0ccb86d5631ca RDMA/umem: Add helpers for umem dmabuf revoke lock
> >     5f38a3ec57a7c RDMA/umem: Add pinned revocable dmabuf import interfa=
ce
> >     559b236086abc RDMA/umem: Move umem dmabuf revoke logic into helper =
function
> >     76a3fb857bd2d RDMA/umem: Add ib_umem_dmabuf_get_pinned_and_lock hel=
per
> >     dfb905d933d86 RDMA/umem: Introduce an option to revoke DMABUF umem
> >     7cf6776ce4418 RDMA/umem: Add support for creating pinned DMABUF ume=
m with a given dma device
> >     e33760e076105 RDMA/cma: Fix hardware address comparison length in n=
etevent callback
> >     86f5ea90f73bb firmware: arm_ffa: Fix NULL dereference in ffa_partit=
ion_info_get()
> >     b3d39b0379960 btrfs: fix root leak if its reloc root is unexpected =
in merge_reloc_roots()
> >     33878ba25e263 btrfs: reject free space cache with more entries than=
 pages
> >     5e23b8ec04e26 mtd: nand: mtk-ecc: stop on ECC idle timeouts
> >     9a797e0dc7667 mtd: mtdswap: remove debugfs stats file on teardown
> >     dfa535c94406c IB/mad: Drop unmatched RMPP responses before reassemb=
ly
> >     e9ea1f148a94a arm64: tegra: Fix CPU compatible string to cortex-a78=
ae on Tegra234
> >     f97776607d0d3 Input: ims-pcu - fix logic error in packet reset
> >     40bbbf2e91fd6 Input: ims-pcu - fix heap-buffer-overflow in ims_pcu_=
process_data()
> >     6e3cb82fcd2f4 xprtrdma: Clear receive-side ownership pointers on re=
lease
> >     abeff53233b98 gpu: host1x: Fix use-after-free in host1x_bo_clear_ca=
ched_mappings
> >     5592a207e158b accel/ivpu: Reject firmware log with size smaller tha=
n header
> >     5b12de6229d66 dmaengine: sh: rz-dmac: Move interrupt request after =
everything is set up
> >     0b05eca9589f6 can: isotp: serialize TX state transitions under so->=
rx_lock
> >     0b811c4bbe3ec can: isotp: fix use-after-free race with concurrent N=
ETDEV_UNREGISTER
> >     18b45251e74e3 can: bcm: track a single source interface for ANYDEV =
timeout/throttle ops
> >     5f246b96ab475 can: bcm: fix data race on rx_stamp/rx_ifindex in bcm=
_rx_handler()
> >     60d8a7942f4ed can: bcm: fix stale rx/tx ops after device removal
> >     84aa4807816e4 can: bcm: add missing device refcount for CAN filter =
removal
> >     7d966cdee0069 can: bcm: validate frame length in bcm_rx_setup() for=
 RTR replies
> >     52f06e7603780 can: bcm: extend bcm_tx_lock usage for data and timer=
 updates
> >     8b2783172d92e can: bcm: fix CAN frame rx/tx statistics
> >     a7eb6db1cd3f7 can: bcm: add locking when updating filter and timer =
values
> >     6f4be73880302 KVM: x86/mmu: Fix use-after-free on vendor module rel=
oad
> >     af56298e9d86e KVM: nVMX: Hide shadow VMCS right after VMCLEAR
> >     35e77467610c4 KVM: x86: Check for invalid/obsolete root *after* mak=
ing MMU pages available
> >     1f140d2953901 seqlock: Allow UBSAN_ALIGNMENT to fail optimizing
> >     69ae8730e657a seqlock: Allow KASAN to fail optimizing
> >     4f292febac9bc seqlock: Cure some more scoped_seqlock() optimization=
 fails
> >     c90b043ff068c platform/x86/amd/pmc: Avoid logging "(null)" for DMI =
values
> >     55ec4d9ee783b platform/x86/amd/pmc: Don't log during intermediate w=
akeups
> >     30e439a141d2c drm/virtio: fix deadlock in display_info_cb by removi=
ng hotplug from dequeue worker
> >     a715cf4de28eb selftests/bpf: Add tests for ld_{abs,ind} failure pat=
h in subprogs
> >     37ad2bb11e9de bpf: Fix ld_{abs,ind} failure path analysis in subpro=
gs
> >     b10a696411722 platform/x86/intel-uncore-freq: Fix current_freq_khz =
after CPU hotplug
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
> >  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
> >  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
> >  3 files changed, 20 insertions(+), 20 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-rt_6.6.bb
> > index d252eb8c4a..b8297fb836 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > @@ -14,13 +14,13 @@ python () {
> >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kern=
el to linux-yocto-rt to enable it")
> >  }
> >
> > -SRCREV_machine ?=3D "27ed791688e060988fb39429477ee529093c9a01"
> > -SRCREV_meta ?=3D "127bac58b21e8c3769d0cf2432f706f5605c4afb"
> > +SRCREV_machine ?=3D "f673898aa832dc82d3f7b41e2b80576195be0c01"
> > +SRCREV_meta ?=3D "9f45b4cc5cdbaac7468b31ef04b8d9d74a329a04"
> >
> >  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBR=
ANCH};name=3Dmachine;protocol=3Dhttps \
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;=
name=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps"
> >
> > -LINUX_VERSION ?=3D "6.6.147"
> > +LINUX_VERSION ?=3D "6.6.150"
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedc=
d7e46"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/r=
ecipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > index f50f5cd51e..85adcac767 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > @@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
> >  # CVE exclusions
> >  include recipes-kernel/linux/cve-exclusion_6.6.inc
> >
> > -LINUX_VERSION ?=3D "6.6.147"
> > +LINUX_VERSION ?=3D "6.6.150"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedc=
d7e46"
> >
> >  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '=
', d)}"
> > @@ -17,8 +17,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
> >  KMETA =3D "kernel-meta"
> >  KCONF_BSP_AUDIT_LEVEL =3D "2"
> >
> > -SRCREV_machine ?=3D "18f147623b634b40b3bc5823ae03f049bb14fc84"
> > -SRCREV_meta ?=3D "127bac58b21e8c3769d0cf2432f706f5605c4afb"
> > +SRCREV_machine ?=3D "3595fedd1c011c6a9d7333fba206faccd23000d9"
> > +SRCREV_meta ?=3D "9f45b4cc5cdbaac7468b31ef04b8d9d74a329a04"
> >
> >  PV =3D "${LINUX_VERSION}+git"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipe=
s-kernel/linux/linux-yocto_6.6.bb
> > index 77274850c2..56001ec3e7 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > @@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?=3D "v6.6/standard/base"
> >  KBRANCH:qemuloongarch64  ?=3D "v6.6/standard/base"
> >  KBRANCH:qemumips64 ?=3D "v6.6/standard/mti-malta64"
> >
> > -SRCREV_machine:qemuarm ?=3D "1790b505a65896a34abc5abe3109f9811f6f2960"
> > -SRCREV_machine:qemuarm64 ?=3D "4da6f6f6201c34d32cf5ae6524f8de44d003f0e=
d"
> > -SRCREV_machine:qemuloongarch64 ?=3D "402296b5e824b46fd4301eddc7c389b9f=
7fe1d82"
> > -SRCREV_machine:qemumips ?=3D "254643819dbbde9f388d8d02b6d2550606b8e442=
"
> > -SRCREV_machine:qemuppc ?=3D "c0e9acf672bff2c9001b96423b8ae5723d7f7190"
> > -SRCREV_machine:qemuriscv64 ?=3D "402296b5e824b46fd4301eddc7c389b9f7fe1=
d82"
> > -SRCREV_machine:qemuriscv32 ?=3D "402296b5e824b46fd4301eddc7c389b9f7fe1=
d82"
> > -SRCREV_machine:qemux86 ?=3D "402296b5e824b46fd4301eddc7c389b9f7fe1d82"
> > -SRCREV_machine:qemux86-64 ?=3D "402296b5e824b46fd4301eddc7c389b9f7fe1d=
82"
> > -SRCREV_machine:qemumips64 ?=3D "830cb34f387303f99b95f1f3e3938794195ff1=
a6"
> > -SRCREV_machine ?=3D "402296b5e824b46fd4301eddc7c389b9f7fe1d82"
> > -SRCREV_meta ?=3D "127bac58b21e8c3769d0cf2432f706f5605c4afb"
> > +SRCREV_machine:qemuarm ?=3D "eb3d4176015fb241f1d9ced0aedeb895b5c5b6a2"
> > +SRCREV_machine:qemuarm64 ?=3D "7fb3f3439f9a37d1eb5c9b8852fcfd16e106d39=
c"
> > +SRCREV_machine:qemuloongarch64 ?=3D "214397400c9747a170eabf91612d5ac3c=
cd25407"
> > +SRCREV_machine:qemumips ?=3D "1b7be08de47be5e78d90ed8c3843a415293a72ed=
"
> > +SRCREV_machine:qemuppc ?=3D "743a17db9981ac54b45c7e21aff83b9ec8d172ad"
> > +SRCREV_machine:qemuriscv64 ?=3D "214397400c9747a170eabf91612d5ac3ccd25=
407"
> > +SRCREV_machine:qemuriscv32 ?=3D "214397400c9747a170eabf91612d5ac3ccd25=
407"
> > +SRCREV_machine:qemux86 ?=3D "214397400c9747a170eabf91612d5ac3ccd25407"
> > +SRCREV_machine:qemux86-64 ?=3D "214397400c9747a170eabf91612d5ac3ccd254=
07"
> > +SRCREV_machine:qemumips64 ?=3D "bd7dc237220c9d2525e8ec4783540b8762019d=
9d"
> > +SRCREV_machine ?=3D "214397400c9747a170eabf91612d5ac3ccd25407"
> > +SRCREV_meta ?=3D "9f45b4cc5cdbaac7468b31ef04b8d9d74a329a04"
> >
> >  # set your preferred provider of linux-yocto to 'linux-yocto-upstream'=
, and you'll
> >  # get the <version>/base branch, which is pure upstream -stable, and t=
he same
> >  # meta SRCREV as the linux-yocto-standard builds. Select your version =
using the
> >  # normal PREFERRED_VERSION settings.
> >  BBCLASSEXTEND =3D "devupstream:target"
> > -SRCREV_machine:class-devupstream ?=3D "a1153c0deb44f75190f07677c0c6d61=
efd887246"
> > +SRCREV_machine:class-devupstream ?=3D "6436c12a2ced865a3382b867e3882d0=
8c2d2bf8d"
> >  PN:class-devupstream =3D "linux-yocto-upstream"
> >  KBRANCH:class-devupstream =3D "v6.6/base"
> >
> > @@ -44,7 +44,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.g=
it;name=3Dmachine;branch=3D${KBRA
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;=
name=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps"
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedc=
d7e46"
> > -LINUX_VERSION ?=3D "6.6.147"
> > +LINUX_VERSION ?=3D "6.6.150"
> >
> >  PV =3D "${LINUX_VERSION}+git"
> >
> Hi Bruce,
>
> Seems there is a regression with this upgrade in the case of poky-tiny an=
d
> linux-yocto-tiny with the x86/x86_64 architecture.
>
>         error: invalid use of undefined type 'struct gpio_chip'
>
> Here's the failed build with the 6.6.150 patch
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/4446
>
> Here's a successfull build the 6.6.147 patch only
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/4456
>
> I suspect the commit "pinctrl: remove pinctrl_gpio_direction_output()" is
> causing the build failure by using `struct gpio_chip` which is defined in
> `linux/gpio/driver.h`, itself included by `../gpio/gpiolib.h` but under
> #ifdef CONFIG_GPIOLIB condition.
>
> Somehow, --allnoconfig must disable CONFIG_GPIOLIB with x86 architectures=
 but
> not with arm architectures, which cause the
>
>
> (Note: I'm stepping in for Yoann Congal during his holidays)
>
> Best regards,
> --
> Fabien Thomas
> Smile ECS



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

