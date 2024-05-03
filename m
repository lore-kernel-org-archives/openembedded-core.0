Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F59C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 17:41:13 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.658.1714758070960627092
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 10:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m5ByIzLu;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5d8b887bb0cso7624737a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 10:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714758070; x=1715362870; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YQ1APACHi9NKTumIjzhaplfGSY8a+mUOvA0ck+wdnN4=;
        b=m5ByIzLu3IEJwasvZ8Q8NxeTT1UpfgUpAKsFo8D1zK4HlAR7K0mxsvbwVDHxZ3PLAK
         feSXUVBYD7DB0cFWH9tddDMGTv/93VJH3Vmg5ztlKj1J2chc8nYgXNu5/TFqa3OSZDgY
         +skTQYACoLvRfNK44SUi1Be+hUKfUudynHb6JsmAnynz/exfWh2nj+3hnD6Kleq0pXFx
         EVEiM6qFVkVd/L8nFk0LhHYUzhsds3Ziux9XYfIwOA0I3LSROY+cXqyBQYICxmGUQQpK
         i/cy4VoZUG8kd+kJJ9aTG75aWty4Vbi5EfKNg7HbjZuHa3ErEeUzr99X7qnTIws5jfXx
         4gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714758070; x=1715362870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YQ1APACHi9NKTumIjzhaplfGSY8a+mUOvA0ck+wdnN4=;
        b=Kw9ajHwNMjGIF6/7fIC6aZNaYT1C5cS6U81Gh/hD5d2juHGiOKiHWaLi8nLjGRJryO
         +y9uA7bMoEgSCPHv4/IVn8Zop501RbzxzcPBqp5ihBog9T4M71K1fDeFe2yxHz+4A36h
         e9R69FUamELkWUDJc8SxBZ73PaTWJTmop5NtiEtsDufW6+uR8gNmznLdDiETnSxobrAm
         o2E6KyWcVjKVBWqy+eZWSpdz7MnLot8LeryB8+4BVK0FZXj2EKyyZKHioGjHsnb2ipZX
         zrNkQQu+0fWGE6JNUgGVmUqXWmKVeKqSX57Vqmq8/buxarAT4JWQfT38VVx4hRE3Y2bw
         RmlA==
X-Gm-Message-State: AOJu0YwUFwCqeCNBhluraIFiMTxLZ6rqWxWG39RZzeCGvziSycIQobj8
	hDCoL6FURveDRosKLPPs98idhG7auV8MWdG9EgArm6zmwF3x2SOPCrYh7Ssy8vLWLkX9Us7nzaO
	iRqm8WyOLE+fRaZXep8Ezh08IOow=
X-Google-Smtp-Source: AGHT+IHOotxTfEwG35E6vJnhPoNHRALlXSo2u/uqfNktArIPJhvp1ANZGYyUjN2SY+vqJPnsvvDhQf3Y/3Dmu4tyfws=
X-Received: by 2002:a17:90a:1783:b0:2b3:d16c:4f09 with SMTP id
 q3-20020a17090a178300b002b3d16c4f09mr3680059pja.7.1714758070127; Fri, 03 May
 2024 10:41:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240503025240.373184-1-bruce.ashfield@gmail.com>
 <20240503025240.373184-11-bruce.ashfield@gmail.com> <CAOSpxdY_GVOBvWPLr4PhdLRUCLziBvMABbm3i3YX+dMX9q4s4w@mail.gmail.com>
In-Reply-To: <CAOSpxdY_GVOBvWPLr4PhdLRUCLziBvMABbm3i3YX+dMX9q4s4w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 3 May 2024 13:40:58 -0400
Message-ID: <CADkTA4OPGkYF4CtwmtTZeCXiE7DSfv0M5eVO3xrjPSdYgkqKUA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 11/12] linux-yocto/5.15: update to v5.15.157
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a5560b0617903903"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 17:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199010

--000000000000a5560b0617903903
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll revisit this in a week or so, and send the queue again at that point.

The fix is trivial, I've just moved on from it for the time being

Bruce

On Fri, May 3, 2024 at 1:39=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:

> Hi Bruce,
>
> Unfortunately I'm getting warnings on many of the builds:
>
> WARNING: linux-yocto-5.15.157+gitAUTOINC+21fd5becb1_f0d16a142e-r0
> do_kernel_configcheck: [kernel config]: This BSP contains fragments
> with warnings:
> [INFO]: the following symbols were not found in the active configuration:
> - CONFIG_NFSD_V3
>
> Steve
>
> On Thu, May 2, 2024 at 7:52=E2=80=AFPM <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Updating linux-yocto/5.15 to the latest korg -stable release that
> comprises
> > the following commits:
> >
> >     b925f60c6ee7 Linux 5.15.157
> >     d564809f27ea net: dsa: mt7530: fix enabling EEE on MT7531 switch on
> all boards
> >     eb6535c6f7c2 net: dsa: mt7530: fix improper frames on all 25MHz and
> 40MHz XTAL MT7530
> >     63ba7a80d6e2 net: dsa: introduce preferred_default_local_cpu_port
> and use on MT7530
> >     84b7f50e631a net: dsa: mt7530: set all CPU ports in MT7531_CPU_PMAP
> >     bdbe483da21f nilfs2: fix OOB in nilfs_set_de_type
> >     3ab056814cd8 nouveau: fix instmem race condition around ptr stores
> >     49c9958cf0a2 drm/vmwgfx: Sort primary plane formats by order of
> preference
> >     8b12fc7b0326 drm/amdgpu: validate the parameters of bo mapping
> operations more clearly
> >     a2fd6dbc98be binder: check offset alignment in binder_get_object()
> >     0dc727a4e054 init/main.c: Fix potential static_command_line memory
> overflow
> >     813f5213f2c6 arm64: hibernate: Fix level3 translation fault in
> swsusp_save()
> >     f5a55db79bf7 KVM: x86/pmu: Do not mask LVTPC when handling a PMI on
> AMD platforms
> >     7169354120d8 KVM: x86: Snapshot if a vCPU's vendor model is AMD vs.
> Intel compatible
> >     43f00210cb25 fs: sysfs: Fix reference leak in
> sysfs_break_active_protection()
> >     0d130158db29 speakup: Avoid crash on very long word
> >     d8a2225f7dfa mei: me: disable RPL-S on SPS and IGN firmwares
> >     7f67c2020cb0 usb: gadget: f_ncm: Fix UAF ncm object at re-bind afte=
r
> usb ep transport error
> >     75ceeadfab1c usb: Disable USB3 LPM at shutdown
> >     8aa5c28ac65c usb: dwc2: host: Fix dereference issue in DDMA
> completion flow.
> >     7182175f565f Revert "usb: cdc-wdm: close race between read and
> workqueue"
> >     def039849617 USB: serial: option: add Telit FN920C04 rmnet
> compositions
> >     cd27cf1ec66d USB: serial: option: add Rolling RW101-GL and RW135-GL
> support
> >     c48d624bbbad USB: serial: option: support Quectel EM060K sub-models
> >     3338a967ca08 USB: serial: option: add Lonsung U8300/U9300 product
> >     e94566d88701 USB: serial: option: add support for Fibocom FM650/FG6=
50
> >     6b5043463619 USB: serial: option: add Fibocom FM135-GL variants
> >     7a3bbe41efa5 serial/pmac_zilog: Remove flawed mitigation for rx irq
> flood
> >     b0b268eeb087 comedi: vmk80xx: fix incomplete endpoint checking
> >     e39fae579d17 thunderbolt: Fix wake configurations after device unpl=
ug
> >     62e0a5d4d4de thunderbolt: Avoid notify PM core about runtime PM
> resume
> >     4291a6233ba8 x86/cpufeatures: Fix dependencies for GFNI, VAES, and
> VPCLMULQDQ
> >     0be237b6b753 x86/bugs: Fix BHI retpoline check
> >     a29ec0465dce clk: Get runtime PM before walking tree during
> disable_unused
> >     db7c0ef4afea clk: Initialize struct clk_core kref earlier
> >     bc6d766991e1 clk: Print an info line before disabling unused clocks
> >     f3d89bc7dd65 clk: remove extra empty line
> >     bdd70c8b02e7 clk: Mark 'all_lists' as const
> >     3254a1f27952 clk: Remove prepare_lock hold assertion in
> __clk_release()
> >     ce77f3beed02 drm/panel: visionox-rm69299: don't unregister DSI devi=
ce
> >     df0991da7db8 drm: nv04: Fix out of bounds access
> >     3076b3c38a70 s390/cio: fix race condition during online processing
> >     498f7b8037da s390/qdio: handle deferred cc1
> >     45d70025006c RDMA/mlx5: Fix port number for counter query in
> multi-port configuration
> >     8261489de3af RDMA/cm: Print the old state when cm_destroy_id gets
> timeout
> >     2973b4a5eae7 RDMA/rxe: Fix the problem "mutex_destroy missing"
> >     831157756e3c net: ethernet: ti: am65-cpsw-nuss: cleanup DMA Channel=
s
> before using them
> >     9495b7a412e3 net: dsa: mt7530: fix mirroring frames received on
> local port
> >     a50dbeca28ac tun: limit printing rate when illegal packet received
> by tun dev
> >     ae3f9e1221b3 af_unix: Don't peek OOB data without MSG_OOB.
> >     1738dfe72c52 af_unix: Call manage_oob() for every skb in
> unix_stream_read_generic().
> >     e719b52d0c56 netfilter: flowtable: incorrect pppoe tuple
> >     d06977b9a410 netfilter: flowtable: validate pppoe header
> >     5345d78ae64d netfilter: nf_flow_table: count pending offload
> workqueue tasks
> >     7a1679e2d9bf netfilter: nft_set_pipapo: do not free live element
> >     dceb683ab87c netfilter: br_netfilter: skip conntrack input hook for
> promisc packets
> >     379bf7257bc5 netfilter: nf_tables: Fix potential data-race in
> __nft_obj_type_get()
> >     0b6de00206ad netfilter: nf_tables: Fix potential data-race in
> __nft_expr_type_get()
> >     fc1021337e59 Revert "lockd: introduce safe async lock op"
> >     2a3073d58382 Revert "tracing/trigger: Fix to return error if failed
> to alloc snapshot"
> >     2df2dd27066c kprobes: Fix possible use-after-free issue on kprobe
> registration
> >     1253e34a548f bpf: Fix ringbuf memory type confusion when passing to
> helpers
> >     cc9ac419351b bpf: Fix out of bounds access for ringbuf helpers
> >     adc2d11b86ea bpf: Generally fix helper register offset check
> >     0c261cbc29a6 bpf: Generalize check_ctx_reg for reuse with other typ=
es
> >     1b661661642d bpf: Extend kfunc with PTR_TO_CTX, PTR_TO_MEM argument
> support
> >     621bbe924c68 selftests/ftrace: Limit length in subsystem-enable tes=
ts
> >     edfaf679b7c3 SUNRPC: Fix rpcgss_context trace event acceptor field
> >     2364d0278fe1 btrfs: record delayed inode root in transaction
> >     747228929b32 ksmbd: do not set SMB2_GLOBAL_CAP_ENCRYPTION for SMB
> 3.1.1
> >     88b7f1143b15 ksmbd: validate payload size in ipc response
> >     044b3d6c94c6 ksmbd: don't send oplock break if rename fails
> >     b8086c3c1548 reiserfs: Avoid touching renamed directory if parent
> does not change
> >     ea091017ef62 ipv6: Fix data races around sk->sk_prot.
> >     ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
> >     e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
> >     8d1bab770956 locking/rwsem: Disable preemption while trying for
> rwsem lock
> >     7c82dac02886 block, loop: support partitions without scanning
> >     45f504f301d4 bpftool: Fix pretty print dump for maps without BTF
> loaded
> >     1f24338cb789 jbd2: Drop the merge conflicted hunk
> >     e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MA=
X
> (32) bytes
> >     1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX
> (32) bytes
> >     6224acfc1d56 tpm: Add flag to use default cancellation policy
> >     1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
> >     a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
> >     a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops
> protocol layer
> >     ef495c5f45f2 tpm: Remove read16/read32/write32 calls from
> tpm_tis_phy_ops
> >     1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
> >     24615a3b932a ata: ahci: fix enum constants for gcc-13
> >     5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
> >     fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
> >     130f9da78406 tools/resolve_btfids: Build with host flags
> >     00f2f1a782f9 tools/resolve_btfids: Support cross-building the kerne=
l
> with clang
> >     17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when
> building
> >     7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
> >     37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for
> scheduling API deprecations
> >     a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
> >     f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
> >     da5513f30187 libbpf: Fix build warning on ref_ctr_off
> >     4c5a089621a8 perf python: Account for multiple words in CC
> >     1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
> >     838f5d0701d8 fs: add mode_strip_sgid() helper
> >     d97172683641 squashfs: provide backing_dev_info in order to disable
> read-ahead
> >     ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record
> callstack
> >     1363bd7dbde3 ixgbevf: add disable link state
> >     e5601ae2bd24 ixgbe: add improvement for MDD response functionality
> >     caa57cd80575 ixgbe: add the ability for the PF to disable VF link
> state
> >     16a77bfcc7df Check /dev/console using init_stat()
> >     04574fd5579a tracing/arm: Have max stack tracer handle the case of
> return address after data
> >     0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ
> register successfully
> >     1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in
> CPUMAP_FILE_MAX_BYTES
> >     493160901320 mtd_blkdevs: add mtd_table_mutex lock back to
> blktrans_{open, release} to avoid race condition
> >     04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is
> registered
> >     6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing
> and memreserve
> >     1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its
> own flags field
> >     6013d1ae5feb cert host tools: Stop complaining about deprecated
> OpenSSL functions
> >     efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test wit=
h
> dash
> >     a40d2daf2795 pnmtologo: use relocatable file name
> >     3b40d5b41155 of: configfs: remove unused variable overlay_lock
> >     6c085baf1838 tools: use basename to identify file in gen-mach-types
> >     2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
> >     0f586f4ee8ad vt/conmakehash: improve reproducibility
> >     a75774679f28 OF: DT-Overlay configfs interface (v8)
> >     d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
> >     856ec356cf91 ACPI: thermal: drop an always true check
> >     7614af249993 xfs: Fix -Werror=3Ddangling-pointer work-around for ol=
der
> GCC
> >     41470215f97e xfs: Work around GCC 12 -Werror=3Ddangling-pointer for
> xfs_attr_remote.o
> >     44a445c1922d virtio-pci: Remove wrong address verification in
> vp_del_vqs()
> >     77aa9e489eaf bpf: Disallow unprivileged bpf by default
> >     ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
> >     4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices
> on forced removal""
> >     5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
> >     2d83e8196487 jbd2: refactor wait logic for transaction updates into
> a common function
> >     07a63f760793 netfilter: conntrack: avoid useless indirection during
> conntrack destruction
> >     4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on force=
d
> removal"
> >     7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
> >     f78574dee71e kasan: test: silence intentional read overflow warning=
s
> >     d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with
> KASAN_VMALLOC
> >     5e279d5647cc arm64: support page mapping percpu first chunk allocat=
or
> >     e5bf16752dca vmalloc: choose a better start address in
> vm_area_register_early()
> >     660b3d21b46f kasan: test: bypass __alloc_size checks
> >     00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds
> write
> >     67becf0b1bd4 kasan: fix tag for large allocations when using
> CONFIG_SLAB
> >     bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording
> stack
> >     7195b67ce69b kasan: generic: introduce
> kasan_record_aux_stack_noalloc()
> >     bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
> >     51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
> >     85373e66d847 lib/stackdepot: remove unused function argument
> >     5b6cc9b251f3 lib/stackdepot: include gfp.h
> >     c9f3902d8069 aufs: reduce overhead for "code present but disabled"
> use case.
> >     b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic=
()
> >     13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
> >     21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
> >     6199fd896645 aufs: tiny, headers after fs_context
> >     8ddb40e31c29 aufs: fs_context 7/7, finally remount
> >     69035f71c6fd aufs: fs_context 6/7, now mount
> >     bc841b970697 aufs: fs_context 5/7, parse all other mount options
> >     435188053da2 aufs: fs_context 4/7, parse xino options
> >     9af1f1825cbd aufs: fs_context 3/7, parse the branch-management
> options
> >     1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
> >     a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
> >     8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
> >     f90cb4144aec aufs: pre fs_context, support the incomplete sb and
> sbinfo case
> >     948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo=
()
> >     77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
> >     2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
> >     7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
> >     66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
> >     69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
> >     ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
> >     b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
> >     81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console
> saturation
> >     97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
> >     871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for
> Exynos boards"
> >     ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
> >     5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
> >     badaf96564fe ARM: config: multi v7: Clean up enabled by default
> options
> >     34996040fc9b ARM: config: multi v7: Drop unavailable options
> >     7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
> >     20301aeb1a64 riscv: fix build with binutils 2.38
> >     9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
> >     720b61fc400b x86_64_defconfig: Fix warnings
> >     02bf23d26bc4 arm64: defconfig: cleanup config options
> >     05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
> >     ffb532fa19b9 aufs5: fix build against v5.15.3+
> >     a4b3abf4d96d qemux86: add configuration symbol to select values
> >     fee94ee09154 clear_warn_once: add a clear_warn_once=3D boot paramet=
er
> >     3d8762d900d9 clear_warn_once: bind a timer to written reset value
> >     95faacac47e8 clear_warn_once: expand debugfs to include read suppor=
t
> >     de20c4240018 perf: perf can not parser the backtrace of app in the
> 32bit system and 64bit kernel.
> >     0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
> >     9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
> >     09e7efe3e68a perf: fix bench numa compilation
> >     e79becc44fa6 perf: add SLANG_INC for slang.h
> >     b1033b588681 perf: add sgidefs.h to for mips builds
> >     cf9db484ac0b perf: change --root to --prefix for python install
> >     7fd052c2c562 perf: add 'libperl not found' warning
> >     27a437cdd469 perf: force include of <stdbool.h>
> >     3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
> >     a7e9293b506b FAT: Added FAT_NO_83NAME
> >     6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
> >     c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
> >     538be0fdb124 aufs: adjust to v5.15 fs changes
> >     f45da75c8759 aufs5: core
> >     047f57e07e01 aufs5: standalone
> >     029fc15574c8 aufs5: mmap
> >     610d0192ee94 aufs5: base
> >     d4e428d0ec5f aufs5: kbuild
> >     eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check bot=
h
> ERR and NULL
> >     286af18d0875 yaffs: fix -Wstringop-overread compile warning in
> yaffs_fix_null_name
> >     24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
> >     22c73536d5d7 yaffs: include blkdev.h
> >     506b7251bfb8 yaffs: fix misplaced variable declaration
> >     a0e26ff364dc yaffs2: v5.6 build fixups
> >     b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
> >     ad9adccbb214 yaffs: add strict check when call
> yaffs_internal_read_super
> >     2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
> >     d662538516a7 yaffs: Fix build failure by handling inode i_version
> with proper atomic API
> >     70a6113ee2c7 yaffs2: fix memory leak in mount/umount
> >     3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
> >     ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
> >     c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate
> apis
> >     e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
> >     608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
> >     89e660ece42c initramfs: allow an optional wrapper script around
> initramfs generation
> >     b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
> >     3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN
> (CVE-2020-16119)
> >     d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong
> truncation
> >     d202fb2caf33 defconfigs: drop obselete options
> >     9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
> >     e20d8cf019b4 linux-yocto: Handle /bin/awk issues
> >     b6d2a3dbbd3a uvesafb: provide option to specify timeout for task
> completion
> >     adb40f1e6a1a uvesafb: print error message when task timeout occurs
> >     f280a1ed0962 compiler.h: Undef before redefining __attribute_const_=
_
> >     4352732f268c vmware: include jiffies.h
> >     7954a677968d Resolve jiffies wrapping about arp
> >     5f28a1035d95 nfs: Allow default io size to be configured.
> >     0d7260ad7106 check console device file on fs when booting
> >     900a12e37e0a mount_root: clarify error messages for when no rootfs
> found
> >     7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses
> location
> >     6604fc1763b3 modpost: mask trivial warnings
> >     0d294adb09cb kbuild: exclude meta directory from distclean processi=
ng
> >     a097cdd95a9e powerpc: serialize image targets
> >     5db6ec39a0a3 arm: serialize build targets
> >     cbabca27905e crtsavres: fixups for 5.4+
> >     7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
> >     a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
> >     186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
> >     d1ea862964ca powerpc: kexec fix for powerpc64
> >     2ac35b89a0f9 powerpc: Add unwind information for SPE registers of
> E500 core
> >     2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
> >     ec57870b303a mips: Kconfig: add QEMUMIPS64 option
> >     6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
> >     74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
> >     22e65b63d3b4 arm/Makefile: Fix systemtap
> >     b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
> >     ce2800c73bf7 arm: ARM EABI socketcall
> >     019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses
> during translation fault
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
> >  .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
> >  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
> >  3 files changed, 19 insertions(+), 19 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > index 426266e9a5..91bf0350d5 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
> > @@ -11,13 +11,13 @@ python () {
> >          raise bb.parse.SkipRecipe("Set
> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> >  }
> >
> > -SRCREV_machine ?=3D "82bab3e1d1637710832e9fe0a222d876b5f9e9e2"
> > -SRCREV_meta ?=3D "1427f4d13f99b5b3811ef5f4207b6ff43cf1771a"
> > +SRCREV_machine ?=3D "f8d4297d452f7c832d90bfb992d90db2e30ffc23"
> > +SRCREV_meta ?=3D "21fd5becb1ed083a28e57af46709578f83dd2910"
> >
> >  SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=3Dmachine
> <http://git.yoctoproject.org/linux-yocto.git;branch=3D$%7BKBRANCH%7D;name=
=3Dmachine>
> \
> >             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-5.15;destsuffix=3D${KMETA}
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-5.15;destsuffix=3D$%7BKMETA%7D>
> "
> >
> > -LINUX_VERSION ?=3D "5.15.156"
> > +LINUX_VERSION ?=3D "5.15.157"
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedc=
d7e46"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > index 1ea634f2e1..722523ced9 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
> > @@ -5,7 +5,7 @@ KCONFIG_MODE =3D "--allnoconfig"
> >
> >  require recipes-kernel/linux/linux-yocto.inc
> >
> > -LINUX_VERSION ?=3D "5.15.156"
> > +LINUX_VERSION ?=3D "5.15.157"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedc=
d7e46"
> >
> >  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '=
',
> d)}"
> > @@ -14,8 +14,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
> >  KMETA =3D "kernel-meta"
> >  KCONF_BSP_AUDIT_LEVEL =3D "2"
> >
> > -SRCREV_machine ?=3D "a94a5a767e0b0014c4d1f4ac6587bd30af2b18d5"
> > -SRCREV_meta ?=3D "1427f4d13f99b5b3811ef5f4207b6ff43cf1771a"
> > +SRCREV_machine ?=3D "7a8fce8cbd9a8a7d68a0c2537141c85d63f6eda3"
> > +SRCREV_meta ?=3D "21fd5becb1ed083a28e57af46709578f83dd2910"
> >
> >  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > index 0601353e1c..6784703ce2 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
> > @@ -14,24 +14,24 @@ KBRANCH:qemux86  ?=3D "v5.15/standard/base"
> >  KBRANCH:qemux86-64 ?=3D "v5.15/standard/base"
> >  KBRANCH:qemumips64 ?=3D "v5.15/standard/mti-malta64"
> >
> > -SRCREV_machine:qemuarm ?=3D "7125a4b2f341b906fa6ad96d7b5caab2fe031b40"
> > -SRCREV_machine:qemuarm64 ?=3D "a71076982c5b7d5f38a7c00ab4fd6f4f907e267=
d"
> > -SRCREV_machine:qemumips ?=3D "0d5ad939681fe4971f4895b909554d755ba72d66=
"
> > -SRCREV_machine:qemuppc ?=3D "46ff907d522c13b8f6fab5a0da95f7a9807e2595"
> > -SRCREV_machine:qemuriscv64 ?=3D "70388803a5a55f986721232d0160381bb8097=
ba3"
> > -SRCREV_machine:qemuriscv32 ?=3D "70388803a5a55f986721232d0160381bb8097=
ba3"
> > -SRCREV_machine:qemux86 ?=3D "70388803a5a55f986721232d0160381bb8097ba3"
> > -SRCREV_machine:qemux86-64 ?=3D "70388803a5a55f986721232d0160381bb8097b=
a3"
> > -SRCREV_machine:qemumips64 ?=3D "a1357daf3592cb612b67058e401d5b05aebde4=
5e"
> > -SRCREV_machine ?=3D "70388803a5a55f986721232d0160381bb8097ba3"
> > -SRCREV_meta ?=3D "1427f4d13f99b5b3811ef5f4207b6ff43cf1771a"
> > +SRCREV_machine:qemuarm ?=3D "b844615e2b799c40eac746cd24e009b620114230"
> > +SRCREV_machine:qemuarm64 ?=3D "aeb63de10514b28d35049f285ae9a371d6d5ccd=
2"
> > +SRCREV_machine:qemumips ?=3D "3740052e902e15416c22ce7f2544de7afe83a845=
"
> > +SRCREV_machine:qemuppc ?=3D "167c9e8d0e760cfb299408647efe46214fd06ac0"
> > +SRCREV_machine:qemuriscv64 ?=3D "f0d16a142e32a7934da39a12bd983a00e629b=
b48"
> > +SRCREV_machine:qemuriscv32 ?=3D "f0d16a142e32a7934da39a12bd983a00e629b=
b48"
> > +SRCREV_machine:qemux86 ?=3D "f0d16a142e32a7934da39a12bd983a00e629bb48"
> > +SRCREV_machine:qemux86-64 ?=3D "f0d16a142e32a7934da39a12bd983a00e629bb=
48"
> > +SRCREV_machine:qemumips64 ?=3D "d34e0789d8d5e0d7ab521889e80967edcac38d=
c6"
> > +SRCREV_machine ?=3D "f0d16a142e32a7934da39a12bd983a00e629bb48"
> > +SRCREV_meta ?=3D "21fd5becb1ed083a28e57af46709578f83dd2910"
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
> "c52b9710c83d3b8ab63bb217cc7c8b61e13f12cd"
> > +SRCREV_machine:class-devupstream ?=3D
> "b925f60c6ee7ec871d2d48575d0fde3872129c20"
> >  PN:class-devupstream =3D "linux-yocto-upstream"
> >  KBRANCH:class-devupstream =3D "v5.15/base"
> >
> > @@ -39,7 +39,7 @@ SRC_URI =3D "git://
> git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D${KBRA
> <http://git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7B=
KBRA>
> >             git://
> git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=
=3Dyocto-5.15;destsuffix=3D${KMETA}
> <http://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;=
branch=3Dyocto-5.15;destsuffix=3D$%7BKMETA%7D>
> "
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedc=
d7e46"
> > -LINUX_VERSION ?=3D "5.15.156"
> > +LINUX_VERSION ?=3D "5.15.157"
> >
> >  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '=
',
> d)}"
> >  DEPENDS +=3D "openssl-native util-linux-native"
> > --
> > 2.39.2
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a5560b0617903903
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I&#=
39;ll revisit this in a week or so, and send the queue again at that point.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">The fix is trivial, I&#3=
9;ve just moved on from it for the time being</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Fri, May 3, 2024 at 1:39=E2=80=AFPM Stev=
e Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bruc=
e,<br>
<br>
Unfortunately I&#39;m getting warnings on many of the builds:<br>
<br>
WARNING: linux-yocto-5.15.157+gitAUTOINC+21fd5becb1_f0d16a142e-r0<br>
do_kernel_configcheck: [kernel config]: This BSP contains fragments<br>
with warnings:<br>
[INFO]: the following symbols were not found in the active configuration:<b=
r>
- CONFIG_NFSD_V3<br>
<br>
Steve<br>
<br>
On Thu, May 2, 2024 at 7:52=E2=80=AFPM &lt;<a href=3D"mailto:bruce.ashfield=
@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Updating linux-yocto/5.15 to the latest korg -stable release that comp=
rises<br>
&gt; the following commits:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b925f60c6ee7 Linux 5.15.157<br>
&gt;=C2=A0 =C2=A0 =C2=A0d564809f27ea net: dsa: mt7530: fix enabling EEE on =
MT7531 switch on all boards<br>
&gt;=C2=A0 =C2=A0 =C2=A0eb6535c6f7c2 net: dsa: mt7530: fix improper frames =
on all 25MHz and 40MHz XTAL MT7530<br>
&gt;=C2=A0 =C2=A0 =C2=A063ba7a80d6e2 net: dsa: introduce preferred_default_=
local_cpu_port and use on MT7530<br>
&gt;=C2=A0 =C2=A0 =C2=A084b7f50e631a net: dsa: mt7530: set all CPU ports in=
 MT7531_CPU_PMAP<br>
&gt;=C2=A0 =C2=A0 =C2=A0bdbe483da21f nilfs2: fix OOB in nilfs_set_de_type<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A03ab056814cd8 nouveau: fix instmem race condition ar=
ound ptr stores<br>
&gt;=C2=A0 =C2=A0 =C2=A049c9958cf0a2 drm/vmwgfx: Sort primary plane formats=
 by order of preference<br>
&gt;=C2=A0 =C2=A0 =C2=A08b12fc7b0326 drm/amdgpu: validate the parameters of=
 bo mapping operations more clearly<br>
&gt;=C2=A0 =C2=A0 =C2=A0a2fd6dbc98be binder: check offset alignment in bind=
er_get_object()<br>
&gt;=C2=A0 =C2=A0 =C2=A00dc727a4e054 init/main.c: Fix potential static_comm=
and_line memory overflow<br>
&gt;=C2=A0 =C2=A0 =C2=A0813f5213f2c6 arm64: hibernate: Fix level3 translati=
on fault in swsusp_save()<br>
&gt;=C2=A0 =C2=A0 =C2=A0f5a55db79bf7 KVM: x86/pmu: Do not mask LVTPC when h=
andling a PMI on AMD platforms<br>
&gt;=C2=A0 =C2=A0 =C2=A07169354120d8 KVM: x86: Snapshot if a vCPU&#39;s ven=
dor model is AMD vs. Intel compatible<br>
&gt;=C2=A0 =C2=A0 =C2=A043f00210cb25 fs: sysfs: Fix reference leak in sysfs=
_break_active_protection()<br>
&gt;=C2=A0 =C2=A0 =C2=A00d130158db29 speakup: Avoid crash on very long word=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0d8a2225f7dfa mei: me: disable RPL-S on SPS and IGN =
firmwares<br>
&gt;=C2=A0 =C2=A0 =C2=A07f67c2020cb0 usb: gadget: f_ncm: Fix UAF ncm object=
 at re-bind after usb ep transport error<br>
&gt;=C2=A0 =C2=A0 =C2=A075ceeadfab1c usb: Disable USB3 LPM at shutdown<br>
&gt;=C2=A0 =C2=A0 =C2=A08aa5c28ac65c usb: dwc2: host: Fix dereference issue=
 in DDMA completion flow.<br>
&gt;=C2=A0 =C2=A0 =C2=A07182175f565f Revert &quot;usb: cdc-wdm: close race =
between read and workqueue&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0def039849617 USB: serial: option: add Telit FN920C0=
4 rmnet compositions<br>
&gt;=C2=A0 =C2=A0 =C2=A0cd27cf1ec66d USB: serial: option: add Rolling RW101=
-GL and RW135-GL support<br>
&gt;=C2=A0 =C2=A0 =C2=A0c48d624bbbad USB: serial: option: support Quectel E=
M060K sub-models<br>
&gt;=C2=A0 =C2=A0 =C2=A03338a967ca08 USB: serial: option: add Lonsung U8300=
/U9300 product<br>
&gt;=C2=A0 =C2=A0 =C2=A0e94566d88701 USB: serial: option: add support for F=
ibocom FM650/FG650<br>
&gt;=C2=A0 =C2=A0 =C2=A06b5043463619 USB: serial: option: add Fibocom FM135=
-GL variants<br>
&gt;=C2=A0 =C2=A0 =C2=A07a3bbe41efa5 serial/pmac_zilog: Remove flawed mitig=
ation for rx irq flood<br>
&gt;=C2=A0 =C2=A0 =C2=A0b0b268eeb087 comedi: vmk80xx: fix incomplete endpoi=
nt checking<br>
&gt;=C2=A0 =C2=A0 =C2=A0e39fae579d17 thunderbolt: Fix wake configurations a=
fter device unplug<br>
&gt;=C2=A0 =C2=A0 =C2=A062e0a5d4d4de thunderbolt: Avoid notify PM core abou=
t runtime PM resume<br>
&gt;=C2=A0 =C2=A0 =C2=A04291a6233ba8 x86/cpufeatures: Fix dependencies for =
GFNI, VAES, and VPCLMULQDQ<br>
&gt;=C2=A0 =C2=A0 =C2=A00be237b6b753 x86/bugs: Fix BHI retpoline check<br>
&gt;=C2=A0 =C2=A0 =C2=A0a29ec0465dce clk: Get runtime PM before walking tre=
e during disable_unused<br>
&gt;=C2=A0 =C2=A0 =C2=A0db7c0ef4afea clk: Initialize struct clk_core kref e=
arlier<br>
&gt;=C2=A0 =C2=A0 =C2=A0bc6d766991e1 clk: Print an info line before disabli=
ng unused clocks<br>
&gt;=C2=A0 =C2=A0 =C2=A0f3d89bc7dd65 clk: remove extra empty line<br>
&gt;=C2=A0 =C2=A0 =C2=A0bdd70c8b02e7 clk: Mark &#39;all_lists&#39; as const=
<br>
&gt;=C2=A0 =C2=A0 =C2=A03254a1f27952 clk: Remove prepare_lock hold assertio=
n in __clk_release()<br>
&gt;=C2=A0 =C2=A0 =C2=A0ce77f3beed02 drm/panel: visionox-rm69299: don&#39;t=
 unregister DSI device<br>
&gt;=C2=A0 =C2=A0 =C2=A0df0991da7db8 drm: nv04: Fix out of bounds access<br=
>
&gt;=C2=A0 =C2=A0 =C2=A03076b3c38a70 s390/cio: fix race condition during on=
line processing<br>
&gt;=C2=A0 =C2=A0 =C2=A0498f7b8037da s390/qdio: handle deferred cc1<br>
&gt;=C2=A0 =C2=A0 =C2=A045d70025006c RDMA/mlx5: Fix port number for counter=
 query in multi-port configuration<br>
&gt;=C2=A0 =C2=A0 =C2=A08261489de3af RDMA/cm: Print the old state when cm_d=
estroy_id gets timeout<br>
&gt;=C2=A0 =C2=A0 =C2=A02973b4a5eae7 RDMA/rxe: Fix the problem &quot;mutex_=
destroy missing&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0831157756e3c net: ethernet: ti: am65-cpsw-nuss: cle=
anup DMA Channels before using them<br>
&gt;=C2=A0 =C2=A0 =C2=A09495b7a412e3 net: dsa: mt7530: fix mirroring frames=
 received on local port<br>
&gt;=C2=A0 =C2=A0 =C2=A0a50dbeca28ac tun: limit printing rate when illegal =
packet received by tun dev<br>
&gt;=C2=A0 =C2=A0 =C2=A0ae3f9e1221b3 af_unix: Don&#39;t peek OOB data witho=
ut MSG_OOB.<br>
&gt;=C2=A0 =C2=A0 =C2=A01738dfe72c52 af_unix: Call manage_oob() for every s=
kb in unix_stream_read_generic().<br>
&gt;=C2=A0 =C2=A0 =C2=A0e719b52d0c56 netfilter: flowtable: incorrect pppoe =
tuple<br>
&gt;=C2=A0 =C2=A0 =C2=A0d06977b9a410 netfilter: flowtable: validate pppoe h=
eader<br>
&gt;=C2=A0 =C2=A0 =C2=A05345d78ae64d netfilter: nf_flow_table: count pendin=
g offload workqueue tasks<br>
&gt;=C2=A0 =C2=A0 =C2=A07a1679e2d9bf netfilter: nft_set_pipapo: do not free=
 live element<br>
&gt;=C2=A0 =C2=A0 =C2=A0dceb683ab87c netfilter: br_netfilter: skip conntrac=
k input hook for promisc packets<br>
&gt;=C2=A0 =C2=A0 =C2=A0379bf7257bc5 netfilter: nf_tables: Fix potential da=
ta-race in __nft_obj_type_get()<br>
&gt;=C2=A0 =C2=A0 =C2=A00b6de00206ad netfilter: nf_tables: Fix potential da=
ta-race in __nft_expr_type_get()<br>
&gt;=C2=A0 =C2=A0 =C2=A0fc1021337e59 Revert &quot;lockd: introduce safe asy=
nc lock op&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A02a3073d58382 Revert &quot;tracing/trigger: Fix to r=
eturn error if failed to alloc snapshot&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A02df2dd27066c kprobes: Fix possible use-after-free i=
ssue on kprobe registration<br>
&gt;=C2=A0 =C2=A0 =C2=A01253e34a548f bpf: Fix ringbuf memory type confusion=
 when passing to helpers<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc9ac419351b bpf: Fix out of bounds access for ring=
buf helpers<br>
&gt;=C2=A0 =C2=A0 =C2=A0adc2d11b86ea bpf: Generally fix helper register off=
set check<br>
&gt;=C2=A0 =C2=A0 =C2=A00c261cbc29a6 bpf: Generalize check_ctx_reg for reus=
e with other types<br>
&gt;=C2=A0 =C2=A0 =C2=A01b661661642d bpf: Extend kfunc with PTR_TO_CTX, PTR=
_TO_MEM argument support<br>
&gt;=C2=A0 =C2=A0 =C2=A0621bbe924c68 selftests/ftrace: Limit length in subs=
ystem-enable tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0edfaf679b7c3 SUNRPC: Fix rpcgss_context trace event=
 acceptor field<br>
&gt;=C2=A0 =C2=A0 =C2=A02364d0278fe1 btrfs: record delayed inode root in tr=
ansaction<br>
&gt;=C2=A0 =C2=A0 =C2=A0747228929b32 ksmbd: do not set SMB2_GLOBAL_CAP_ENCR=
YPTION for SMB 3.1.1<br>
&gt;=C2=A0 =C2=A0 =C2=A088b7f1143b15 ksmbd: validate payload size in ipc re=
sponse<br>
&gt;=C2=A0 =C2=A0 =C2=A0044b3d6c94c6 ksmbd: don&#39;t send oplock break if =
rename fails<br>
&gt;=C2=A0 =C2=A0 =C2=A0b8086c3c1548 reiserfs: Avoid touching renamed direc=
tory if parent does not change<br>
&gt;=C2=A0 =C2=A0 =C2=A0ea091017ef62 ipv6: Fix data races around sk-&gt;sk_=
prot.<br>
&gt;=C2=A0 =C2=A0 =C2=A0ff8710da80ee ipv6: annotate some data-races around =
sk-&gt;sk_prot<br>
&gt;=C2=A0 =C2=A0 =C2=A0e8c2eafaaa6a tcp: Fix data races around icsk-&gt;ic=
sk_af_ops.<br>
&gt;=C2=A0 =C2=A0 =C2=A08d1bab770956 locking/rwsem: Disable preemption whil=
e trying for rwsem lock<br>
&gt;=C2=A0 =C2=A0 =C2=A07c82dac02886 block, loop: support partitions withou=
t scanning<br>
&gt;=C2=A0 =C2=A0 =C2=A045f504f301d4 bpftool: Fix pretty print dump for map=
s without BTF loaded<br>
&gt;=C2=A0 =C2=A0 =C2=A01f24338cb789 jbd2: Drop the merge conflicted hunk<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2=
C_SMBUS_BLOCK_MAX (32) bytes<br>
&gt;=C2=A0 =C2=A0 =C2=A01abe841fe331 tpm: tis_i2c: Limit read bursts to I2C=
_SMBUS_BLOCK_MAX (32) bytes<br>
&gt;=C2=A0 =C2=A0 =C2=A06224acfc1d56 tpm: Add flag to use default cancellat=
ion policy<br>
&gt;=C2=A0 =C2=A0 =C2=A01cd19d48fb90 tpm: tis_i2c: Fix sanity check interru=
pt enable mask<br>
&gt;=C2=A0 =C2=A0 =C2=A0a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_t=
is_core<br>
&gt;=C2=A0 =C2=A0 =C2=A0a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm=
_tis_phy_ops protocol layer<br>
&gt;=C2=A0 =C2=A0 =C2=A0ef495c5f45f2 tpm: Remove read16/read32/write32 call=
s from tpm_tis_phy_ops<br>
&gt;=C2=A0 =C2=A0 =C2=A01f3be2e23aa6 gcc-plugins: Reorganize gimple include=
s for GCC 13<br>
&gt;=C2=A0 =C2=A0 =C2=A024615a3b932a ata: ahci: fix enum constants for gcc-=
13<br>
&gt;=C2=A0 =C2=A0 =C2=A05d6cb145541a net: stmmac: Enable mac_managed_pm phy=
link config<br>
&gt;=C2=A0 =C2=A0 =C2=A0fd93aabb4287 tools/resolve_btfids: Use pkg-config t=
o locate libelf<br>
&gt;=C2=A0 =C2=A0 =C2=A0130f9da78406 tools/resolve_btfids: Build with host =
flags<br>
&gt;=C2=A0 =C2=A0 =C2=A000f2f1a782f9 tools/resolve_btfids: Support cross-bu=
ilding the kernel with clang<br>
&gt;=C2=A0 =C2=A0 =C2=A017776a4ba9c2 tools/resolve_btfids: Install libbpf h=
eaders when building<br>
&gt;=C2=A0 =C2=A0 =C2=A07c9808380d70 libbpf: Make libbpf_version.h non-auto=
-generated<br>
&gt;=C2=A0 =C2=A0 =C2=A037ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE ma=
cro for scheduling API deprecations<br>
&gt;=C2=A0 =C2=A0 =C2=A0a2667e6d7314 drm/radeon: free iio for atombios when=
 driver shutdown<br>
&gt;=C2=A0 =C2=A0 =C2=A0f100c753aa1f powerpc: Fix reschedule bug in KUAP-un=
locked user copy<br>
&gt;=C2=A0 =C2=A0 =C2=A0da5513f30187 libbpf: Fix build warning on ref_ctr_o=
ff<br>
&gt;=C2=A0 =C2=A0 =C2=A04c5a089621a8 perf python: Account for multiple word=
s in CC<br>
&gt;=C2=A0 =C2=A0 =C2=A01c5699ee85d4 fs: move S_ISGID stripping into the vf=
s_*() helpers<br>
&gt;=C2=A0 =C2=A0 =C2=A0838f5d0701d8 fs: add mode_strip_sgid() helper<br>
&gt;=C2=A0 =C2=A0 =C2=A0d97172683641 squashfs: provide backing_dev_info in =
order to disable read-ahead<br>
&gt;=C2=A0 =C2=A0 =C2=A0ed037d7be40c irq_work: use kasan_record_aux_stack_n=
oalloc() record callstack<br>
&gt;=C2=A0 =C2=A0 =C2=A01363bd7dbde3 ixgbevf: add disable link state<br>
&gt;=C2=A0 =C2=A0 =C2=A0e5601ae2bd24 ixgbe: add improvement for MDD respons=
e functionality<br>
&gt;=C2=A0 =C2=A0 =C2=A0caa57cd80575 ixgbe: add the ability for the PF to d=
isable VF link state<br>
&gt;=C2=A0 =C2=A0 =C2=A016a77bfcc7df Check /dev/console using init_stat()<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A004574fd5579a tracing/arm: Have max stack tracer han=
dle the case of return address after data<br>
&gt;=C2=A0 =C2=A0 =C2=A00e51e5717018 gpiolib: cdev: Set lineevent_state::ir=
q after IRQ register successfully<br>
&gt;=C2=A0 =C2=A0 =C2=A01e6b7da6ddba drivers/base: Fix unsigned comparison =
to -1 in CPUMAP_FILE_MAX_BYTES<br>
&gt;=C2=A0 =C2=A0 =C2=A0493160901320 mtd_blkdevs: add mtd_table_mutex lock =
back to blktrans_{open, release} to avoid race condition<br>
&gt;=C2=A0 =C2=A0 =C2=A004224f725aa3 irqchip/gic-v3-its: Skip HP notifier w=
hen no ITS is registered<br>
&gt;=C2=A0 =C2=A0 =C2=A06f6c2996a81c irqchip/gic-v3-its: Postpone LPI pendi=
ng table freeing and memreserve<br>
&gt;=C2=A0 =C2=A0 =C2=A01fa94473423f irqchip/gic-v3-its: Give the percpu rd=
ist struct its own flags field<br>
&gt;=C2=A0 =C2=A0 =C2=A06013d1ae5feb cert host tools: Stop complaining abou=
t deprecated OpenSSL functions<br>
&gt;=C2=A0 =C2=A0 =C2=A0efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED=
_OUTPUT test with dash<br>
&gt;=C2=A0 =C2=A0 =C2=A0a40d2daf2795 pnmtologo: use relocatable file name<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A03b40d5b41155 of: configfs: remove unused variable o=
verlay_lock<br>
&gt;=C2=A0 =C2=A0 =C2=A06c085baf1838 tools: use basename to identify file i=
n gen-mach-types<br>
&gt;=C2=A0 =C2=A0 =C2=A02fca0fd71981 lib/build_OID_registry: fix reproducib=
ility issues<br>
&gt;=C2=A0 =C2=A0 =C2=A00f586f4ee8ad vt/conmakehash: improve reproducibilit=
y<br>
&gt;=C2=A0 =C2=A0 =C2=A0a75774679f28 OF: DT-Overlay configfs interface (v8)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0d179c639b30b x86/boot: Wrap literal addresses in ab=
solute_pointer()<br>
&gt;=C2=A0 =C2=A0 =C2=A0856ec356cf91 ACPI: thermal: drop an always true che=
ck<br>
&gt;=C2=A0 =C2=A0 =C2=A07614af249993 xfs: Fix -Werror=3Ddangling-pointer wo=
rk-around for older GCC<br>
&gt;=C2=A0 =C2=A0 =C2=A041470215f97e xfs: Work around GCC 12 -Werror=3Ddang=
ling-pointer for xfs_attr_remote.o<br>
&gt;=C2=A0 =C2=A0 =C2=A044a445c1922d virtio-pci: Remove wrong address verif=
ication in vp_del_vqs()<br>
&gt;=C2=A0 =C2=A0 =C2=A077aa9e489eaf bpf: Disallow unprivileged bpf by defa=
ult<br>
&gt;=C2=A0 =C2=A0 =C2=A0ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups<br>
&gt;=C2=A0 =C2=A0 =C2=A04eba9348d3e2 Revert &quot;Revert &quot;fbdev: Hot-u=
nplug firmware fb devices on forced removal&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A05df6d1b00f95 jbd2: fix use-after-free of transactio=
n_t race<br>
&gt;=C2=A0 =C2=A0 =C2=A02d83e8196487 jbd2: refactor wait logic for transact=
ion updates into a common function<br>
&gt;=C2=A0 =C2=A0 =C2=A007a63f760793 netfilter: conntrack: avoid useless in=
direction during conntrack destruction<br>
&gt;=C2=A0 =C2=A0 =C2=A04e7122625996 Revert &quot;fbdev: Hot-unplug firmwar=
e fb devices on forced removal&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A07ba4cb36fd4f rcu: Avoid alloc_pages() when recordin=
g stack<br>
&gt;=C2=A0 =C2=A0 =C2=A0f78574dee71e kasan: test: silence intentional read =
overflow warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A0d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chun=
k crash with KASAN_VMALLOC<br>
&gt;=C2=A0 =C2=A0 =C2=A05e279d5647cc arm64: support page mapping percpu fir=
st chunk allocator<br>
&gt;=C2=A0 =C2=A0 =C2=A0e5bf16752dca vmalloc: choose a better start address=
 in vm_area_register_early()<br>
&gt;=C2=A0 =C2=A0 =C2=A0660b3d21b46f kasan: test: bypass __alloc_size check=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A000aa7573e53a kasan: test: add memcpy test that avoi=
ds out-of-bounds write<br>
&gt;=C2=A0 =C2=A0 =C2=A067becf0b1bd4 kasan: fix tag for large allocations w=
hen using CONFIG_SLAB<br>
&gt;=C2=A0 =C2=A0 =C2=A0bedf1e033213 workqueue, kasan: avoid alloc_pages() =
when recording stack<br>
&gt;=C2=A0 =C2=A0 =C2=A07195b67ce69b kasan: generic: introduce kasan_record=
_aux_stack_noalloc()<br>
&gt;=C2=A0 =C2=A0 =C2=A0bdff763f0e29 kasan: common: provide can_alloc in ka=
san_save_stack()<br>
&gt;=C2=A0 =C2=A0 =C2=A051423ebb36ad lib/stackdepot: introduce __stack_depo=
t_save()<br>
&gt;=C2=A0 =C2=A0 =C2=A085373e66d847 lib/stackdepot: remove unused function=
 argument<br>
&gt;=C2=A0 =C2=A0 =C2=A05b6cc9b251f3 lib/stackdepot: include gfp.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0c9f3902d8069 aufs: reduce overhead for &quot;code p=
resent but disabled&quot; use case.<br>
&gt;=C2=A0 =C2=A0 =C2=A0b98d189df02c aufs: bugfix, umount passes NULL to -&=
gt;parse_monolithic()<br>
&gt;=C2=A0 =C2=A0 =C2=A013b883cbbbd9 aufs standalone: cosmetic, missing cop=
yright sentence<br>
&gt;=C2=A0 =C2=A0 =C2=A021f8b0d81898 aufs: 5.15.5-20220117 ---&gt; 5.15.5-2=
0220221<br>
&gt;=C2=A0 =C2=A0 =C2=A06199fd896645 aufs: tiny, headers after fs_context<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A08ddb40e31c29 aufs: fs_context 7/7, finally remount<=
br>
&gt;=C2=A0 =C2=A0 =C2=A069035f71c6fd aufs: fs_context 6/7, now mount<br>
&gt;=C2=A0 =C2=A0 =C2=A0bc841b970697 aufs: fs_context 5/7, parse all other =
mount options<br>
&gt;=C2=A0 =C2=A0 =C2=A0435188053da2 aufs: fs_context 4/7, parse xino optio=
ns<br>
&gt;=C2=A0 =C2=A0 =C2=A09af1f1825cbd aufs: fs_context 3/7, parse the branch=
-management options<br>
&gt;=C2=A0 =C2=A0 =C2=A01c05eb767f8c aufs: fs_context 2/7, parse &quot;br&q=
uot; mount option<br>
&gt;=C2=A0 =C2=A0 =C2=A0a8488f603134 aufs: fs_context 1/7, skelton of the n=
ew shceme<br>
&gt;=C2=A0 =C2=A0 =C2=A08e32e0015564 aufs: pre fs_context, convert a static=
 flag to a macro<br>
&gt;=C2=A0 =C2=A0 =C2=A0f90cb4144aec aufs: pre fs_context, support the inco=
mplete sb and sbinfo case<br>
&gt;=C2=A0 =C2=A0 =C2=A0948762ef859c aufs: pre fs_context, convert the type=
 of alloc_sbinfo()<br>
&gt;=C2=A0 =C2=A0 =C2=A077151a08776b aufs: 5.15.5-20211129 ---&gt; 5.15.5-2=
0220117<br>
&gt;=C2=A0 =C2=A0 =C2=A02539adbbbe1e aufs: 5.14-20211018 ---&gt; 5.15.5-202=
11129<br>
&gt;=C2=A0 =C2=A0 =C2=A07d32b25193c4 aufs: for v5.15-rc1, sync_inode() is g=
one<br>
&gt;=C2=A0 =C2=A0 =C2=A066ec0c509225 aufs: for v5.15-rc1, new param &#39;rc=
u&#39; for -&gt;get_acl()<br>
&gt;=C2=A0 =C2=A0 =C2=A069709dc518cd aufs: for v5.15-rc1, no mand-lock anym=
ore<br>
&gt;=C2=A0 =C2=A0 =C2=A0ada8fe9543e5 aufs: 5.14-20210906=C2=A0 ---&gt; 5.14=
-20211018<br>
&gt;=C2=A0 =C2=A0 =C2=A0b77f7f3f394a Revert &quot;aufs: adjust to v5.15 fs =
changes&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A081bdce5b5876 tick/nohz: WARN_ON --&gt; WARN_ON_ONCE=
 to prevent console saturation<br>
&gt;=C2=A0 =C2=A0 =C2=A097c963889222 sched/isolation: really align nohz_ful=
l with rcu_nocbs<br>
&gt;=C2=A0 =C2=A0 =C2=A0871f23ad3627 Revert &quot;ARM: defconfig: Enable ax=
88796c driver for Exynos boards&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0ffad0783dd5b ARM: config: multi v7: Regenerate defc=
onifg<br>
&gt;=C2=A0 =C2=A0 =C2=A05c1e1a1ff2d3 ARM: config: multi v7: Add renamed sym=
bols<br>
&gt;=C2=A0 =C2=A0 =C2=A0badaf96564fe ARM: config: multi v7: Clean up enable=
d by default options<br>
&gt;=C2=A0 =C2=A0 =C2=A034996040fc9b ARM: config: multi v7: Drop unavailabl=
e options<br>
&gt;=C2=A0 =C2=A0 =C2=A07f685244afb3 powerpc/mm: Switch obsolete dssall to =
.long<br>
&gt;=C2=A0 =C2=A0 =C2=A020301aeb1a64 riscv: fix build with binutils 2.38<br=
>
&gt;=C2=A0 =C2=A0 =C2=A09df58d070506 powerpc/lib/sstep: fix &#39;ptesync&#3=
9; build error<br>
&gt;=C2=A0 =C2=A0 =C2=A0720b61fc400b x86_64_defconfig: Fix warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A002bf23d26bc4 arm64: defconfig: cleanup config optio=
ns<br>
&gt;=C2=A0 =C2=A0 =C2=A005914e2c87e5 arm: defconfig: drop unused POWER_AVS =
option<br>
&gt;=C2=A0 =C2=A0 =C2=A0ffb532fa19b9 aufs5: fix build against v5.15.3+<br>
&gt;=C2=A0 =C2=A0 =C2=A0a4b3abf4d96d qemux86: add configuration symbol to s=
elect values<br>
&gt;=C2=A0 =C2=A0 =C2=A0fee94ee09154 clear_warn_once: add a clear_warn_once=
=3D boot parameter<br>
&gt;=C2=A0 =C2=A0 =C2=A03d8762d900d9 clear_warn_once: bind a timer to writt=
en reset value<br>
&gt;=C2=A0 =C2=A0 =C2=A095faacac47e8 clear_warn_once: expand debugfs to inc=
lude read support<br>
&gt;=C2=A0 =C2=A0 =C2=A0de20c4240018 perf: perf can not parser the backtrac=
e of app in the 32bit system and 64bit kernel.<br>
&gt;=C2=A0 =C2=A0 =C2=A00e4aacead9c1 perf: x86-32: explicitly include &lt;e=
rrno.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A09ad92c11468e perf: mips64: Convert __u64 to unsigne=
d long long<br>
&gt;=C2=A0 =C2=A0 =C2=A009e7efe3e68a perf: fix bench numa compilation<br>
&gt;=C2=A0 =C2=A0 =C2=A0e79becc44fa6 perf: add SLANG_INC for slang.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0b1033b588681 perf: add sgidefs.h to for mips builds=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0cf9db484ac0b perf: change --root to --prefix for py=
thon install<br>
&gt;=C2=A0 =C2=A0 =C2=A07fd052c2c562 perf: add &#39;libperl not found&#39; =
warning<br>
&gt;=C2=A0 =C2=A0 =C2=A027a437cdd469 perf: force include of &lt;stdbool.h&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A03b99d21bec2f fat: don&#39;t use obsolete random32 c=
all in namei_vfat<br>
&gt;=C2=A0 =C2=A0 =C2=A0a7e9293b506b FAT: Added FAT_NO_83NAME<br>
&gt;=C2=A0 =C2=A0 =C2=A06fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LO=
NGNAMES option<br>
&gt;=C2=A0 =C2=A0 =C2=A0c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES o=
ption<br>
&gt;=C2=A0 =C2=A0 =C2=A0538be0fdb124 aufs: adjust to v5.15 fs changes<br>
&gt;=C2=A0 =C2=A0 =C2=A0f45da75c8759 aufs5: core<br>
&gt;=C2=A0 =C2=A0 =C2=A0047f57e07e01 aufs5: standalone<br>
&gt;=C2=A0 =C2=A0 =C2=A0029fc15574c8 aufs5: mmap<br>
&gt;=C2=A0 =C2=A0 =C2=A0610d0192ee94 aufs5: base<br>
&gt;=C2=A0 =C2=A0 =C2=A0d4e428d0ec5f aufs5: kbuild<br>
&gt;=C2=A0 =C2=A0 =C2=A0eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_N=
ULL to check both ERR and NULL<br>
&gt;=C2=A0 =C2=A0 =C2=A0286af18d0875 yaffs: fix -Wstringop-overread compile=
 warning in yaffs_fix_null_name<br>
&gt;=C2=A0 =C2=A0 =C2=A024d59a4e26a6 yaffs2: v5.12+ build fixups (not runti=
me tested)<br>
&gt;=C2=A0 =C2=A0 =C2=A022c73536d5d7 yaffs: include blkdev.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0506b7251bfb8 yaffs: fix misplaced variable declarat=
ion<br>
&gt;=C2=A0 =C2=A0 =C2=A0a0e26ff364dc yaffs2: v5.6 build fixups<br>
&gt;=C2=A0 =C2=A0 =C2=A0b10b1b2d169e yaffs2: fix memory leak when /proc/yaf=
fs is read<br>
&gt;=C2=A0 =C2=A0 =C2=A0ad9adccbb214 yaffs: add strict check when call yaff=
s_internal_read_super<br>
&gt;=C2=A0 =C2=A0 =C2=A02e3c3aec8279 yaffs: repair yaffs_get_mtd_device<br>
&gt;=C2=A0 =C2=A0 =C2=A0d662538516a7 yaffs: Fix build failure by handling i=
node i_version with proper atomic API<br>
&gt;=C2=A0 =C2=A0 =C2=A070a6113ee2c7 yaffs2: fix memory leak in mount/umoun=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A03378e4a9e404 yaffs: Avoid setting any ACL releated =
xattr<br>
&gt;=C2=A0 =C2=A0 =C2=A0ec2284edddef Yaffs:check oob size before auto selec=
ting Yaffs1<br>
&gt;=C2=A0 =C2=A0 =C2=A0c2a49874051c fs: yaffs2: replace CURRENT_TIME by ot=
her appropriate apis<br>
&gt;=C2=A0 =C2=A0 =C2=A0e9a5105a3e73 yaffs2: adjust to proper location of M=
S_RDONLY<br>
&gt;=C2=A0 =C2=A0 =C2=A0608807406f13 yaffs2: import git revision b4ce1bb (j=
an, 2020)<br>
&gt;=C2=A0 =C2=A0 =C2=A089e660ece42c initramfs: allow an optional wrapper s=
cript around initramfs generation<br>
&gt;=C2=A0 =C2=A0 =C2=A0b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditio=
nally<br>
&gt;=C2=A0 =C2=A0 =C2=A03fd5ca3673d0 net/dccp: make it depend on CONFIG_BRO=
KEN (CVE-2020-16119)<br>
&gt;=C2=A0 =C2=A0 =C2=A0d1f6edbf0188 arm64/perf: Fix wrong cast that may ca=
use wrong truncation<br>
&gt;=C2=A0 =C2=A0 =C2=A0d202fb2caf33 defconfigs: drop obselete options<br>
&gt;=C2=A0 =C2=A0 =C2=A09a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS wi=
th FP enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A0e20d8cf019b4 linux-yocto: Handle /bin/awk issues<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0b6d2a3dbbd3a uvesafb: provide option to specify tim=
eout for task completion<br>
&gt;=C2=A0 =C2=A0 =C2=A0adb40f1e6a1a uvesafb: print error message when task=
 timeout occurs<br>
&gt;=C2=A0 =C2=A0 =C2=A0f280a1ed0962 compiler.h: Undef before redefining __=
attribute_const__<br>
&gt;=C2=A0 =C2=A0 =C2=A04352732f268c vmware: include jiffies.h<br>
&gt;=C2=A0 =C2=A0 =C2=A07954a677968d Resolve jiffies wrapping about arp<br>
&gt;=C2=A0 =C2=A0 =C2=A05f28a1035d95 nfs: Allow default io size to be confi=
gured.<br>
&gt;=C2=A0 =C2=A0 =C2=A00d7260ad7106 check console device file on fs when b=
ooting<br>
&gt;=C2=A0 =C2=A0 =C2=A0900a12e37e0a mount_root: clarify error messages for=
 when no rootfs found<br>
&gt;=C2=A0 =C2=A0 =C2=A07b878cbea726 menuconfig,mconf-cfg: Allow specificat=
ion of ncurses location<br>
&gt;=C2=A0 =C2=A0 =C2=A06604fc1763b3 modpost: mask trivial warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A00d294adb09cb kbuild: exclude meta directory from di=
stclean processing<br>
&gt;=C2=A0 =C2=A0 =C2=A0a097cdd95a9e powerpc: serialize image targets<br>
&gt;=C2=A0 =C2=A0 =C2=A05db6ec39a0a3 arm: serialize build targets<br>
&gt;=C2=A0 =C2=A0 =C2=A0cbabca27905e crtsavres: fixups for 5.4+<br>
&gt;=C2=A0 =C2=A0 =C2=A07fc7656ed403 powerpc/ptrace: Disable array-bounds w=
arning with gcc8<br>
&gt;=C2=A0 =C2=A0 =C2=A0a5faac5a19a2 powerpc: Disable attribute-alias warni=
ngs from gcc8<br>
&gt;=C2=A0 =C2=A0 =C2=A0186c54665b67 powerpc: add crtsavres.o to archprepar=
e for kbuild<br>
&gt;=C2=A0 =C2=A0 =C2=A0d1ea862964ca powerpc: kexec fix for powerpc64<br>
&gt;=C2=A0 =C2=A0 =C2=A02ac35b89a0f9 powerpc: Add unwind information for SP=
E registers of E500 core<br>
&gt;=C2=A0 =C2=A0 =C2=A02e1c348a28bb mips: vdso: fix &#39;jalr $t9&#39; cra=
sh in vdso code<br>
&gt;=C2=A0 =C2=A0 =C2=A0ec57870b303a mips: Kconfig: add QEMUMIPS64 option<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A06a81b3c08107 4kc cache tlb hazard: tlbp cache coher=
ency<br>
&gt;=C2=A0 =C2=A0 =C2=A074e3b2a21e54 malta uhci quirks: make allowance for =
slow 4k(e)c<br>
&gt;=C2=A0 =C2=A0 =C2=A022e65b63d3b4 arm/Makefile: Fix systemtap<br>
&gt;=C2=A0 =C2=A0 =C2=A0b7f1ab59f19e vexpress: Pass LOADADDR to Makefile<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0ce2800c73bf7 arm: ARM EABI socketcall<br>
&gt;=C2=A0 =C2=A0 =C2=A0019d142fd956 ARM: LPAE: Invalidate the TLB for modu=
le addresses during translation fault<br>
&gt;<br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_5.15.bb" rel=3D"noref=
errer" target=3D"_blank">linux-yocto-rt_5.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++---<br>
&gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-tiny_5.15.bb" rel=3D"nor=
eferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 ++---<br>
&gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a> | 26 ++++++++=
+----------<br>
&gt;=C2=A0 3 files changed, 19 insertions(+), 19 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-r=
t_5.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a> =
b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a><br>
&gt; index 426266e9a5..91bf0350d5 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.15.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.15.=
bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a><br>
&gt; @@ -11,13 +11,13 @@ python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;Set =
PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it&quot;)<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -SRCREV_machine ?=3D &quot;82bab3e1d1637710832e9fe0a222d876b5f9e9e2&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;1427f4d13f99b5b3811ef5f4207b6ff43cf1771a&quot;=
<br>
&gt; +SRCREV_machine ?=3D &quot;f8d4297d452f7c832d90bfb992d90db2e30ffc23&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;21fd5becb1ed083a28e57af46709578f83dd2910&quot;=
<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/l=
inux-yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" t=
arget=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};n=
ame=3Dmachine</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http:/=
/git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3D=
yocto-5.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_blank">=
git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dy=
octo-5.15;destsuffix=3D${KMETA}</a>&quot;<br>
&gt;<br>
&gt; -LINUX_VERSION ?=3D &quot;5.15.156&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;5.15.157&quot;<br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc=
9398086aedcd7e46&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-t=
iny_5.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb<=
/a> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a><br>
&gt; index 1ea634f2e1..722523ced9 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.1=
5.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.1=
5.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a><br>
&gt; @@ -5,7 +5,7 @@ KCONFIG_MODE =3D &quot;--allnoconfig&quot;<br>
&gt;<br>
&gt;=C2=A0 require recipes-kernel/linux/linux-yocto.inc<br>
&gt;<br>
&gt; -LINUX_VERSION ?=3D &quot;5.15.156&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;5.15.157&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc=
9398086aedcd7e46&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86=
&#39;, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt; @@ -14,8 +14,8 @@ DEPENDS +=3D &quot;openssl-native util-linux-native&=
quot;<br>
&gt;=C2=A0 KMETA =3D &quot;kernel-meta&quot;<br>
&gt;=C2=A0 KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt;<br>
&gt; -SRCREV_machine ?=3D &quot;a94a5a767e0b0014c4d1f4ac6587bd30af2b18d5&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;1427f4d13f99b5b3811ef5f4207b6ff43cf1771a&quot;=
<br>
&gt; +SRCREV_machine ?=3D &quot;7a8fce8cbd9a8a7d68a0c2537141c85d63f6eda3&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;21fd5becb1ed083a28e57af46709578f83dd2910&quot;=
<br>
&gt;<br>
&gt;=C2=A0 PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5=
.15.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a> b/meta=
/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=3D"norefer=
rer" target=3D"_blank">linux-yocto_5.15.bb</a><br>
&gt; index 0601353e1c..6784703ce2 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a><br>
&gt; @@ -14,24 +14,24 @@ KBRANCH:qemux86=C2=A0 ?=3D &quot;v5.15/standard/ba=
se&quot;<br>
&gt;=C2=A0 KBRANCH:qemux86-64 ?=3D &quot;v5.15/standard/base&quot;<br>
&gt;=C2=A0 KBRANCH:qemumips64 ?=3D &quot;v5.15/standard/mti-malta64&quot;<b=
r>
&gt;<br>
&gt; -SRCREV_machine:qemuarm ?=3D &quot;7125a4b2f341b906fa6ad96d7b5caab2fe0=
31b40&quot;<br>
&gt; -SRCREV_machine:qemuarm64 ?=3D &quot;a71076982c5b7d5f38a7c00ab4fd6f4f9=
07e267d&quot;<br>
&gt; -SRCREV_machine:qemumips ?=3D &quot;0d5ad939681fe4971f4895b909554d755b=
a72d66&quot;<br>
&gt; -SRCREV_machine:qemuppc ?=3D &quot;46ff907d522c13b8f6fab5a0da95f7a9807=
e2595&quot;<br>
&gt; -SRCREV_machine:qemuriscv64 ?=3D &quot;70388803a5a55f986721232d0160381=
bb8097ba3&quot;<br>
&gt; -SRCREV_machine:qemuriscv32 ?=3D &quot;70388803a5a55f986721232d0160381=
bb8097ba3&quot;<br>
&gt; -SRCREV_machine:qemux86 ?=3D &quot;70388803a5a55f986721232d0160381bb80=
97ba3&quot;<br>
&gt; -SRCREV_machine:qemux86-64 ?=3D &quot;70388803a5a55f986721232d0160381b=
b8097ba3&quot;<br>
&gt; -SRCREV_machine:qemumips64 ?=3D &quot;a1357daf3592cb612b67058e401d5b05=
aebde45e&quot;<br>
&gt; -SRCREV_machine ?=3D &quot;70388803a5a55f986721232d0160381bb8097ba3&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;1427f4d13f99b5b3811ef5f4207b6ff43cf1771a&quot;=
<br>
&gt; +SRCREV_machine:qemuarm ?=3D &quot;b844615e2b799c40eac746cd24e009b6201=
14230&quot;<br>
&gt; +SRCREV_machine:qemuarm64 ?=3D &quot;aeb63de10514b28d35049f285ae9a371d=
6d5ccd2&quot;<br>
&gt; +SRCREV_machine:qemumips ?=3D &quot;3740052e902e15416c22ce7f2544de7afe=
83a845&quot;<br>
&gt; +SRCREV_machine:qemuppc ?=3D &quot;167c9e8d0e760cfb299408647efe46214fd=
06ac0&quot;<br>
&gt; +SRCREV_machine:qemuriscv64 ?=3D &quot;f0d16a142e32a7934da39a12bd983a0=
0e629bb48&quot;<br>
&gt; +SRCREV_machine:qemuriscv32 ?=3D &quot;f0d16a142e32a7934da39a12bd983a0=
0e629bb48&quot;<br>
&gt; +SRCREV_machine:qemux86 ?=3D &quot;f0d16a142e32a7934da39a12bd983a00e62=
9bb48&quot;<br>
&gt; +SRCREV_machine:qemux86-64 ?=3D &quot;f0d16a142e32a7934da39a12bd983a00=
e629bb48&quot;<br>
&gt; +SRCREV_machine:qemumips64 ?=3D &quot;d34e0789d8d5e0d7ab521889e80967ed=
cac38dc6&quot;<br>
&gt; +SRCREV_machine ?=3D &quot;f0d16a142e32a7934da39a12bd983a00e629bb48&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;21fd5becb1ed083a28e57af46709578f83dd2910&quot;=
<br>
&gt;<br>
&gt;=C2=A0 # set your preferred provider of linux-yocto to &#39;linux-yocto=
-upstream&#39;, and you&#39;ll<br>
&gt;=C2=A0 # get the &lt;version&gt;/base branch, which is pure upstream -s=
table, and the same<br>
&gt;=C2=A0 # meta SRCREV as the linux-yocto-standard builds. Select your ve=
rsion using the<br>
&gt;=C2=A0 # normal PREFERRED_VERSION settings.<br>
&gt;=C2=A0 BBCLASSEXTEND =3D &quot;devupstream:target&quot;<br>
&gt; -SRCREV_machine:class-devupstream ?=3D &quot;c52b9710c83d3b8ab63bb217c=
c7c8b61e13f12cd&quot;<br>
&gt; +SRCREV_machine:class-devupstream ?=3D &quot;b925f60c6ee7ec871d2d48575=
d0fde3872129c20&quot;<br>
&gt;=C2=A0 PN:class-devupstream =3D &quot;linux-yocto-upstream&quot;<br>
&gt;=C2=A0 KBRANCH:class-devupstream =3D &quot;v5.15/base&quot;<br>
&gt;<br>
&gt; @@ -39,7 +39,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.yoctop=
roject.org/linux-yocto.git;name=3Dmachine;branch=3D$%7BKBRA" rel=3D"norefer=
rer" target=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dmachine;=
branch=3D${KBRA</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http:/=
/git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3D=
yocto-5.15;destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_blank">=
git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dy=
octo-5.15;destsuffix=3D${KMETA}</a>&quot;<br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc=
9398086aedcd7e46&quot;<br>
&gt; -LINUX_VERSION ?=3D &quot;5.15.156&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;5.15.157&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86=
&#39;, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
&gt; --<br>
&gt; 2.39.2<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div>

--000000000000a5560b0617903903--

