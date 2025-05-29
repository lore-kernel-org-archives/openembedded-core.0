Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A27EC54FB3
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 16:58:38 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.26221.1748537914486108786
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 09:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DioG5d47;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3081f72c271so876222a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748537914; x=1749142714; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QIfsDXxCHYFUVduwTsh5dPcYixlYy4stlDjpL20vEXo=;
        b=DioG5d47mv3aBlV7WAPNYUl6PMCyfG3qD+KmgxdX4zLnf7uCt42y/+evVN6vO8EX+O
         UPrWmSB2jFBVe87SxPUi73Z0eXZWQ/2pLbdGDDyDMvhtsM+J9Ad8Q0Y+Iy1SssbDF83k
         AF/jGG9V0nQAveR5gO5GJtjphhWGbIkqQY4Ks6/psRA3C3gxJHFVmHSU0tMxCZOY/iDf
         +2wDDo2o1NOdVuMwpEn4+pepDhquueRmrxNUMudfmT+KXgSIrq8WE0fOKEIh+gunFSTw
         onrIGiMrgnRCg+xeBV5ruwpkQacpCLNyCxnn9wS2CxrQ0iN0ZWWWB0RZNWXTsdQ+t7gS
         6+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748537914; x=1749142714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIfsDXxCHYFUVduwTsh5dPcYixlYy4stlDjpL20vEXo=;
        b=EbI38XKjjP180TG/UHW5Qeu74O4CeJDqkNPOqLPCdbva6gm1QAyYkSSJRnX05XwJ9t
         hqk/V2y9kP1IzlH1V7kynRegusQp6PN7mQWIZ4UPhkRdv5Nfd1Lo6WvFvF2Bg05+shCk
         ulqwoD83AOScitXQoZtSSBtMBX9isHxWIR/XeHN/mnKA+ZNv42rLBtN67YRUxs5q96UW
         87F1RebjaId49g4RQDdon2X+6bsLGHe2fuXL8TuKg3sMPzR42IrAhG+owud+5PfMudnW
         Dg0hmMPxS4hbPgIRFs6rkaAN/uPIwfHwbvdF7p+CL60dbZZ4T7ww5xml+FoNHhnJZ5+1
         Qf4w==
X-Gm-Message-State: AOJu0YyfvqFfp9ZLzCcBG2+V9gJ4xjdfrMA3D5PJ24ZRWzl6gLFT5xGE
	DoyFTIKc6PC/Sb9uaBXw2Lrr5FfAyGmMxnCRqynnR8pzaV28mdnM9sVZ/UNFJ4iERh2ZTO14Q83
	UH+MXvraGamjoRanULp8PzMTUNgBcwizRwd0v
X-Gm-Gg: ASbGncvepOMAiR5YRzcih8oDpbI8rauU2JUgxItsc4eMv9lEKOJg56CN1IsK5NOjmK3
	fA1v8M15EunE/ULFdIBXU2Qb77a4inVGYlvL6VuAcjelGCaASPm6TiEb3tVnBf4NyVgr0WvNxS8
	F7EVO1Os6riniKwQlGsJk96mRtt/AI6YZ02g==
X-Google-Smtp-Source: AGHT+IGqddkDN3fd9ywsowOwtRgEF5BFkO97bhrcixKqnr3iblNDdQvnhHTdVNwMpjsD4J/CrTWuWQCrReO9lpWZqno=
X-Received: by 2002:a17:90b:54cf:b0:312:1dc9:9f67 with SMTP id
 98e67ed59e1d1-312413f5ff3mr400886a91.2.1748537913621; Thu, 29 May 2025
 09:58:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250528194118.1534655-1-bruce.ashfield@gmail.com> <CAOSpxdYxdj6jDo7O5OPFc_G5BX_36F2nJnnpOiiHVMiRqvP-GA@mail.gmail.com>
In-Reply-To: <CAOSpxdYxdj6jDo7O5OPFc_G5BX_36F2nJnnpOiiHVMiRqvP-GA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 May 2025 12:58:21 -0400
X-Gm-Features: AX0GCFsWIqeBImpIkZcY0NnFkFwFmnDC2mZh8r6rDWsViwbgy5sStx-u5o2DFF4
Message-ID: <CADkTA4NFnYGkMVKuHh77g2RTOzW2mA3CWG3BqRLfg1DRoQdJZg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/6] linux-yocto/6.6: update to v6.6.86
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000037c2f80636493527"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 16:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217428

--00000000000037c2f80636493527
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 11:32=E2=80=AFAM Steve Sakoman <steve@sakoman.com> =
wrote:

> Hi Bruce,
>
> The current version in Scarthgap is 6.6.84, so this series seems to be
> missing the 6.6.84 -> 6.6.85 version bump!
>

There's actually two patches missing. I thought there were 6 .. but there
were 8 new commits.

I just sent a v2 with 8 patches.

Bruce



>
> Thanks,
>
> Steve
>
> On Wed, May 28, 2025 at 12:41=E2=80=AFPM <bruce.ashfield@gmail.com> wrote=
:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Updating linux-yocto/6.6 to the latest korg -stable release that
> comprises
> > the following commits:
> >
> >     3fa1ea3ede18 Linux 6.6.86
> >     72a68d2bede3 usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.=
c
> >     367a281315ec serial: 8250_dma: terminate correct DMA in
> tx_dma_flush()
> >     6186fb2cd363 memstick: rtsx_usb_ms: Fix slab-use-after-free in
> rtsx_usb_ms_drv_remove
> >     2beb999f73b4 net: usb: usbnet: restore usb%d name exception for
> local mac addresses
> >     3007115c2e40 net: usb: qmi_wwan: add Telit Cinterion FE990B
> composition
> >     ad43b150e109 net: usb: qmi_wwan: add Telit Cinterion FN990B
> composition
> >     5ec93d77200e tty: serial: fsl_lpuart: disable transmitter before
> changing RS485 related registers
> >     fe14cfba6c16 tty: serial: 8250: Add Brainboxes XC devices
> >     be28a3dabdca tty: serial: 8250: Add some more device IDs
> >     52eed361c250 counter: microchip-tcb-capture: Fix undefined counter
> channel state on probe
> >     fa15592e9d92 counter: stm32-lptimer-cnt: fix error handling when
> enabling
> >     835807f54fad ALSA: hda/realtek: Support mute LED on HP Laptop
> 15s-du3xxx
> >     525104157385 netfilter: socket: Lookup orig tuple for IPv6 SNAT
> >     f16a097047e3 scsi: ufs: qcom: Only free platform MSIs when ESI is
> enabled
> >     3918b2016d28 reset: starfive: jh71x0: Fix accessing the empty membe=
r
> on JH7110 SoC
> >     790d30578faa mm/page_alloc: fix memory accept before watermarks get=
s
> initialized
> >     404d85a71d5a drm/amd/display: Don't write DP_MSTM_CTRL after LT
> >     5f57a96e92c6 drm/dp_mst: Add a helper to queue a topology probe
> >     93ccb0fb3606 drm/dp_mst: Factor out function to queue a topology
> probe work
> >     b9264aa24f62 drm/amd/display: Check denominator crb_pipes before us=
ed
> >     ad0410346cc4 ARM: Remove address checking for MMUless devices
> >     1809cabfe0e9 ARM: 9351/1: fault: Add "cut here" line for prefetch
> aborts
> >     fe17c8aaa90f ARM: 9350/1: fault: Implement
> copy_from_kernel_nofault_allowed()
> >     9da6b6340dbc atm: Fix NULL pointer dereference
> >     f99afc594a2b HID: hid-plantronics: Add mic mute mapping and
> generalize quirks
> >     8ecdc85b5cab ALSA: usb-audio: Add quirk for Plantronics headsets to
> fix control names
> >     6a5b2ed82152 ARM: dts: am335x-bone-common: Increase MDIO reset
> deassert time
> >     ceb5fadbf450 Revert "v6.6 -stable -rt merge fixup"
> >     1c2962a164ff v6.6 -stable -rt merge fixup
> >     18abb2787b53 x86/syscall: Mark exit[_group] syscall handlers
> __noreturn
> >     2879d995e569 pnmtologo: sync with 6.6
> >     43ea1c5e6eb3 lib/build_OID_registry: take -stable reproducibility
> changes
> >     35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
> >     9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct
> pointer types warning in resolve_btfids
> >     42b2eec2e503 bpftool: Query only cgroup-related attach types
> >     f71bb11887ba cpu/amd: inhibit SMP check for qemux86
> >     c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
> >     64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget
> suspend/resume to avoid deadlock
> >     7c76aad68f6d kselftest: Add a ksft_perror() helper
> >     06644f0d7193 drm/tilcdc: Set preferred depth
> >     ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSR=
s
> >     50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
> >     58e5c91d6701 x86/alternatives: Disable interrupts and sync when
> optimizing NOPs in place
> >     c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
> >     c2d64b9f52b6 qemux86: add configuration symbol to select values
> >     630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
> >     0e5e0f68e2e6 clear_warn_once: add a clear_warn_once=3D boot paramet=
er
> >     46934791b902 clear_warn_once: bind a timer to written reset value
> >     cdee9e38ff32 clear_warn_once: expand debugfs to include read suppor=
t
> >     82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
> >     36dc380b776b libbpf: Fix build warning on ref_ctr_off
> >     9e3e1fe20982 perf: perf can not parser the backtrace of app in the
> 32bit system and 64bit kernel.
> >     e497a4a5da65 perf: x86-32: explicitly include <errno.h>
> >     7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
> >     1cfc19423dc7 perf: fix bench numa compilation
> >     98bc2815fade perf: add SLANG_INC for slang.h
> >     17209a70b9b3 perf: add sgidefs.h to for mips builds
> >     9cd4258d910a perf: change --root to --prefix for python install
> >     8110a4f26628 perf: add 'libperl not found' warning
> >     bc89d5e08f77 perf: force include of <stdbool.h>
> >     4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
> >     bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
> >     30b2236ab378 FAT: Added FAT_NO_83NAME
> >     cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
> >     0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
> >     5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
> >     c4342d979bf2 aufs6: fix magic.mk include path
> >     35266bc2dc81 aufs6: adapt to v6.6
> >     8edede4e98be aufs6: core
> >     712248233ebe aufs6: standalone
> >     3b71a8a848d8 aufs6: mmap
> >     3e2924871f37 aufs6: base
> >     7f4907a93101 aufs6: kbuild
> >     d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
> >     bcd6cfcd1aa0 yaffs2: v6.5 fixups
> >     cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
> >     8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
> >     c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
> >     395b01cdc39d yaffs2: convert read_page -> readfolio
> >     d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check bot=
h
> ERR and NULL
> >     613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in
> yaffs_fix_null_name
> >     622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
> >     7562133d4090 yaffs: include blkdev.h
> >     dbd44252cd59 yaffs: fix misplaced variable declaration
> >     c223a10b1ac0 yaffs2: v5.6 build fixups
> >     90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
> >     37ee169c5ea1 yaffs: add strict check when call
> yaffs_internal_read_super
> >     b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
> >     fb98f65a466a yaffs: Fix build failure by handling inode i_version
> with proper atomic API
> >     51e0aac75ea2 yaffs2: fix memory leak in mount/umount
> >     2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
> >     ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
> >     ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate
> apis
> >     8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
> >     1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
> >     4dce67c1e8c8 initramfs: allow an optional wrapper script around
> initramfs generation
> >     2f603d83fcc4 pnmtologo: use relocatable file name
> >     664a6a0a484b tools: use basename to identify file in gen-mach-types
> >     9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
> >     ae9b80797295 vt/conmakehash: improve reproducibility
> >     a972323151bd iwlwifi: select MAC80211_LEDS conditionally
> >     15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN
> (CVE-2020-16119)
> >     5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong
> truncation
> >     5552dc768ffc defconfigs: drop obselete options
> >     00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
> >     3888d0652edf linux-yocto: Handle /bin/awk issues
> >     3d55d299f23a uvesafb: provide option to specify timeout for task
> completion
> >     23c068c080be uvesafb: print error message when task timeout occurs
> >     edbfc939266e compiler.h: Undef before redefining __attribute_const_=
_
> >     c99ae7e2a19a vmware: include jiffies.h
> >     572d84d928c8 Resolve jiffies wrapping about arp
> >     fdcd47cac843 nfs: Allow default io size to be configured.
> >     927d48801098 check console device file on fs when booting
> >     57cc27f821dd mount_root: clarify error messages for when no rootfs
> found
> >     1b53d82a8152 mconf: fix output of cflags and libraries
> >     1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses
> location
> >     83c2e0c6eb1f modpost: mask trivial warnings
> >     6de673039484 kbuild: exclude meta directory from distclean processi=
ng
> >     6decd32815f5 powerpc: serialize image targets
> >     f6b683b38318 arm: serialize build targets
> >     e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to
> blktrans_{open, release} to avoid race condition
> >     dc8a1e5a88f8 x86_64_defconfig: Fix warnings
> >     68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
> >     d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
> >     62f50884b8b1 powerpc: kexec fix for powerpc64
> >     da6871c62c37 powerpc: Add unwind information for SPE registers of
> E500 core
> >     f161c880c11d mips: make current_cpu_data preempt safe
> >     5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
> >     19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
> >     e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
> >     aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
> >     881948cd1517 drm/fb-helper: move zeroing code to
> drm_fb_helper_fill_var
> >     98ec1963fcb7 arm64: defconfig: cleanup config options
> >     f1727c537ba8 vexpress: Pass LOADADDR to Makefile
> >     4474c32dc24a arm: ARM EABI socketcall
> >     75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses
> during translation fault
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
> > index e0006035fe..83ab521399 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
> > @@ -14,13 +14,13 @@ python () {
> >          raise bb.parse.SkipRecipe("Set
> PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> >  }
> >
> > -SRCREV_machine ?=3D "4c94a7140a0416421cd82fe18703e99d7c4eec8e"
> > -SRCREV_meta ?=3D "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
> > +SRCREV_machine ?=3D "baede5a5c17bce04338fe12d6d0f8277edd43dd4"
> > +SRCREV_meta ?=3D "a56c84ea9e406a96490a0d70668e31b10675f1bd"
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
> > -LINUX_VERSION ?=3D "6.6.85"
> > +LINUX_VERSION ?=3D "6.6.86"
> >
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedc=
d7e46"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > index 8c0617be10..49a2bb9aa4 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
> > @@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
> >  # CVE exclusions
> >  include recipes-kernel/linux/cve-exclusion_6.6.inc
> >
> > -LINUX_VERSION ?=3D "6.6.85"
> > +LINUX_VERSION ?=3D "6.6.86"
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
> > -SRCREV_machine ?=3D "50111c8145a573a5eb34859736492d3914d74f26"
> > -SRCREV_meta ?=3D "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
> > +SRCREV_machine ?=3D "754b91c970cb5001c4f1b205be0b29b0efbbe82d"
> > +SRCREV_meta ?=3D "a56c84ea9e406a96490a0d70668e31b10675f1bd"
> >
> >  PV =3D "${LINUX_VERSION}+git"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > index 061837ec88..abbfdbbd43 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> > @@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?=3D "v6.6/standard/base"
> >  KBRANCH:qemuloongarch64  ?=3D "v6.6/standard/base"
> >  KBRANCH:qemumips64 ?=3D "v6.6/standard/mti-malta64"
> >
> > -SRCREV_machine:qemuarm ?=3D "c7fc26b463b6d492177ab4f3133ac709f72959e6"
> > -SRCREV_machine:qemuarm64 ?=3D "a2123abde1b536e17d6f8b41c07006b1b78fc14=
e"
> > -SRCREV_machine:qemuloongarch64 ?=3D
> "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
> > -SRCREV_machine:qemumips ?=3D "441ff4147581f8866ccb145ee1fcecb418543a46=
"
> > -SRCREV_machine:qemuppc ?=3D "c186535e4a16fe6524c963f40744f56d56cc37ae"
> > -SRCREV_machine:qemuriscv64 ?=3D "6a5b2ed821525dac9e4f3f5283376f02965d3=
a7b"
> > -SRCREV_machine:qemuriscv32 ?=3D "6a5b2ed821525dac9e4f3f5283376f02965d3=
a7b"
> > -SRCREV_machine:qemux86 ?=3D "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
> > -SRCREV_machine:qemux86-64 ?=3D "6a5b2ed821525dac9e4f3f5283376f02965d3a=
7b"
> > -SRCREV_machine:qemumips64 ?=3D "ef983636bee26dd17055fbff877a6ca4cd10e4=
ed"
> > -SRCREV_machine ?=3D "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
> > -SRCREV_meta ?=3D "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
> > +SRCREV_machine:qemuarm ?=3D "d5fad62ae36747211fcfda82fc984c7085c7d343"
> > +SRCREV_machine:qemuarm64 ?=3D "4469abd262a2de4c66cd5d37f9dfbfb2060d4e6=
7"
> > +SRCREV_machine:qemuloongarch64 ?=3D
> "257833f963feceebad0ef58d5e5426f910349a85"
> > +SRCREV_machine:qemumips ?=3D "8dabd4628c1c131637bda6915bea0b21493b9338=
"
> > +SRCREV_machine:qemuppc ?=3D "1862875baa7888ec55244d0ccfe30c94f94be1a7"
> > +SRCREV_machine:qemuriscv64 ?=3D "257833f963feceebad0ef58d5e5426f910349=
a85"
> > +SRCREV_machine:qemuriscv32 ?=3D "257833f963feceebad0ef58d5e5426f910349=
a85"
> > +SRCREV_machine:qemux86 ?=3D "257833f963feceebad0ef58d5e5426f910349a85"
> > +SRCREV_machine:qemux86-64 ?=3D "257833f963feceebad0ef58d5e5426f910349a=
85"
> > +SRCREV_machine:qemumips64 ?=3D "1d698ed1a159dde9479181de457e51343c01cd=
70"
> > +SRCREV_machine ?=3D "257833f963feceebad0ef58d5e5426f910349a85"
> > +SRCREV_meta ?=3D "a56c84ea9e406a96490a0d70668e31b10675f1bd"
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
> "d57a7c6169607dd09157ccf257e556fb75444f28"
> > +SRCREV_machine:class-devupstream ?=3D
> "3fa1ea3ede181bf11c329df056840b04ec2e3dca"
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
> > -LINUX_VERSION ?=3D "6.6.85"
> > +LINUX_VERSION ?=3D "6.6.86"
> >
> >  PV =3D "${LINUX_VERSION}+git"
> >
> > --
> > 2.39.2
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000037c2f80636493527
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 29, 2025 at 11:32=
=E2=80=AFAM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sa=
koman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi Bruce,<br>
<br>
The current version in Scarthgap is 6.6.84, so this series seems to be<br>
missing the 6.6.84 -&gt; 6.6.85 version bump!<br></blockquote><div><br></di=
v><div><div class=3D"gmail_default" style=3D"font-size:small">There&#39;s a=
ctually two patches missing. I thought there were 6 .. but there were 8 new=
 commits.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">I just sent a v=
2 with 8 patches.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Thanks,<br>
<br>
Steve<br>
<br>
On Wed, May 28, 2025 at 12:41=E2=80=AFPM &lt;<a href=3D"mailto:bruce.ashfie=
ld@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Updating linux-yocto/6.6 to the latest korg -stable release that compr=
ises<br>
&gt; the following commits:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A03fa1ea3ede18 Linux 6.6.86<br>
&gt;=C2=A0 =C2=A0 =C2=A072a68d2bede3 usb: gadget: uvc: Fix ERR_PTR derefere=
nce in uvc_v4l2.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0367a281315ec serial: 8250_dma: terminate correct DM=
A in tx_dma_flush()<br>
&gt;=C2=A0 =C2=A0 =C2=A06186fb2cd363 memstick: rtsx_usb_ms: Fix slab-use-af=
ter-free in rtsx_usb_ms_drv_remove<br>
&gt;=C2=A0 =C2=A0 =C2=A02beb999f73b4 net: usb: usbnet: restore usb%d name e=
xception for local mac addresses<br>
&gt;=C2=A0 =C2=A0 =C2=A03007115c2e40 net: usb: qmi_wwan: add Telit Cinterio=
n FE990B composition<br>
&gt;=C2=A0 =C2=A0 =C2=A0ad43b150e109 net: usb: qmi_wwan: add Telit Cinterio=
n FN990B composition<br>
&gt;=C2=A0 =C2=A0 =C2=A05ec93d77200e tty: serial: fsl_lpuart: disable trans=
mitter before changing RS485 related registers<br>
&gt;=C2=A0 =C2=A0 =C2=A0fe14cfba6c16 tty: serial: 8250: Add Brainboxes XC d=
evices<br>
&gt;=C2=A0 =C2=A0 =C2=A0be28a3dabdca tty: serial: 8250: Add some more devic=
e IDs<br>
&gt;=C2=A0 =C2=A0 =C2=A052eed361c250 counter: microchip-tcb-capture: Fix un=
defined counter channel state on probe<br>
&gt;=C2=A0 =C2=A0 =C2=A0fa15592e9d92 counter: stm32-lptimer-cnt: fix error =
handling when enabling<br>
&gt;=C2=A0 =C2=A0 =C2=A0835807f54fad ALSA: hda/realtek: Support mute LED on=
 HP Laptop 15s-du3xxx<br>
&gt;=C2=A0 =C2=A0 =C2=A0525104157385 netfilter: socket: Lookup orig tuple f=
or IPv6 SNAT<br>
&gt;=C2=A0 =C2=A0 =C2=A0f16a097047e3 scsi: ufs: qcom: Only free platform MS=
Is when ESI is enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A03918b2016d28 reset: starfive: jh71x0: Fix accessing=
 the empty member on JH7110 SoC<br>
&gt;=C2=A0 =C2=A0 =C2=A0790d30578faa mm/page_alloc: fix memory accept befor=
e watermarks gets initialized<br>
&gt;=C2=A0 =C2=A0 =C2=A0404d85a71d5a drm/amd/display: Don&#39;t write DP_MS=
TM_CTRL after LT<br>
&gt;=C2=A0 =C2=A0 =C2=A05f57a96e92c6 drm/dp_mst: Add a helper to queue a to=
pology probe<br>
&gt;=C2=A0 =C2=A0 =C2=A093ccb0fb3606 drm/dp_mst: Factor out function to que=
ue a topology probe work<br>
&gt;=C2=A0 =C2=A0 =C2=A0b9264aa24f62 drm/amd/display: Check denominator crb=
_pipes before used<br>
&gt;=C2=A0 =C2=A0 =C2=A0ad0410346cc4 ARM: Remove address checking for MMUle=
ss devices<br>
&gt;=C2=A0 =C2=A0 =C2=A01809cabfe0e9 ARM: 9351/1: fault: Add &quot;cut here=
&quot; line for prefetch aborts<br>
&gt;=C2=A0 =C2=A0 =C2=A0fe17c8aaa90f ARM: 9350/1: fault: Implement copy_fro=
m_kernel_nofault_allowed()<br>
&gt;=C2=A0 =C2=A0 =C2=A09da6b6340dbc atm: Fix NULL pointer dereference<br>
&gt;=C2=A0 =C2=A0 =C2=A0f99afc594a2b HID: hid-plantronics: Add mic mute map=
ping and generalize quirks<br>
&gt;=C2=A0 =C2=A0 =C2=A08ecdc85b5cab ALSA: usb-audio: Add quirk for Plantro=
nics headsets to fix control names<br>
&gt;=C2=A0 =C2=A0 =C2=A06a5b2ed82152 ARM: dts: am335x-bone-common: Increase=
 MDIO reset deassert time<br>
&gt;=C2=A0 =C2=A0 =C2=A0ceb5fadbf450 Revert &quot;v6.6 -stable -rt merge fi=
xup&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A01c2962a164ff v6.6 -stable -rt merge fixup<br>
&gt;=C2=A0 =C2=A0 =C2=A018abb2787b53 x86/syscall: Mark exit[_group] syscall=
 handlers __noreturn<br>
&gt;=C2=A0 =C2=A0 =C2=A02879d995e569 pnmtologo: sync with 6.6<br>
&gt;=C2=A0 =C2=A0 =C2=A043ea1c5e6eb3 lib/build_OID_registry: take -stable r=
eproducibility changes<br>
&gt;=C2=A0 =C2=A0 =C2=A035046aea43c8 bpftool: Fix undefined bpf macro for u=
nix socket<br>
&gt;=C2=A0 =C2=A0 =C2=A09a558d4b8621 tools/resolve_btfids: Fix comparison o=
f distinct pointer types warning in resolve_btfids<br>
&gt;=C2=A0 =C2=A0 =C2=A042b2eec2e503 bpftool: Query only cgroup-related att=
ach types<br>
&gt;=C2=A0 =C2=A0 =C2=A0f71bb11887ba cpu/amd: inhibit SMP check for qemux86=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0c31365597a17 powerpc/uaccess: Fix build errors seen=
 with GCC 13/14<br>
&gt;=C2=A0 =C2=A0 =C2=A064ebf485c56b usb: dwc3: core: remove lock of otg mo=
de during gadget suspend/resume to avoid deadlock<br>
&gt;=C2=A0 =C2=A0 =C2=A07c76aad68f6d kselftest: Add a ksft_perror() helper<=
br>
&gt;=C2=A0 =C2=A0 =C2=A006644f0d7193 drm/tilcdc: Set preferred depth<br>
&gt;=C2=A0 =C2=A0 =C2=A0ff7ae7b32324 crypto: jitter - add RCT/APT support f=
or different OSRs<br>
&gt;=C2=A0 =C2=A0 =C2=A050cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_AP=
SS_5018<br>
&gt;=C2=A0 =C2=A0 =C2=A058e5c91d6701 x86/alternatives: Disable interrupts a=
nd sync when optimizing NOPs in place<br>
&gt;=C2=A0 =C2=A0 =C2=A0c878fd2d4c79 x86/alternatives: Sync core before ena=
bling interrupts<br>
&gt;=C2=A0 =C2=A0 =C2=A0c2d64b9f52b6 qemux86: add configuration symbol to s=
elect values<br>
&gt;=C2=A0 =C2=A0 =C2=A0630c33229e6d sched/isolation: really align nohz_ful=
l with rcu_nocbs<br>
&gt;=C2=A0 =C2=A0 =C2=A00e5e0f68e2e6 clear_warn_once: add a clear_warn_once=
=3D boot parameter<br>
&gt;=C2=A0 =C2=A0 =C2=A046934791b902 clear_warn_once: bind a timer to writt=
en reset value<br>
&gt;=C2=A0 =C2=A0 =C2=A0cdee9e38ff32 clear_warn_once: expand debugfs to inc=
lude read support<br>
&gt;=C2=A0 =C2=A0 =C2=A082b562b81841 tools: Remove some options from CLANG_=
CROSS_FLAGS<br>
&gt;=C2=A0 =C2=A0 =C2=A036dc380b776b libbpf: Fix build warning on ref_ctr_o=
ff<br>
&gt;=C2=A0 =C2=A0 =C2=A09e3e1fe20982 perf: perf can not parser the backtrac=
e of app in the 32bit system and 64bit kernel.<br>
&gt;=C2=A0 =C2=A0 =C2=A0e497a4a5da65 perf: x86-32: explicitly include &lt;e=
rrno.h&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A07b57ddd89565 perf: mips64: Convert __u64 to unsigne=
d long long<br>
&gt;=C2=A0 =C2=A0 =C2=A01cfc19423dc7 perf: fix bench numa compilation<br>
&gt;=C2=A0 =C2=A0 =C2=A098bc2815fade perf: add SLANG_INC for slang.h<br>
&gt;=C2=A0 =C2=A0 =C2=A017209a70b9b3 perf: add sgidefs.h to for mips builds=
<br>
&gt;=C2=A0 =C2=A0 =C2=A09cd4258d910a perf: change --root to --prefix for py=
thon install<br>
&gt;=C2=A0 =C2=A0 =C2=A08110a4f26628 perf: add &#39;libperl not found&#39; =
warning<br>
&gt;=C2=A0 =C2=A0 =C2=A0bc89d5e08f77 perf: force include of &lt;stdbool.h&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A04f6c760cc876 fat: Replace prandom_u32() with get_ra=
ndom_u32()<br>
&gt;=C2=A0 =C2=A0 =C2=A0bc53117b12b2 fat: don&#39;t use obsolete random32 c=
all in namei_vfat<br>
&gt;=C2=A0 =C2=A0 =C2=A030b2236ab378 FAT: Added FAT_NO_83NAME<br>
&gt;=C2=A0 =C2=A0 =C2=A0cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LO=
NGNAMES option<br>
&gt;=C2=A0 =C2=A0 =C2=A00bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES o=
ption<br>
&gt;=C2=A0 =C2=A0 =C2=A05883fc340084 aufs6: adapt to v6.6 i_op-&gt;ctime ch=
anges<br>
&gt;=C2=A0 =C2=A0 =C2=A0c4342d979bf2 aufs6: fix <a href=3D"http://magic.mk"=
 rel=3D"noreferrer" target=3D"_blank">magic.mk</a> include path<br>
&gt;=C2=A0 =C2=A0 =C2=A035266bc2dc81 aufs6: adapt to v6.6<br>
&gt;=C2=A0 =C2=A0 =C2=A08edede4e98be aufs6: core<br>
&gt;=C2=A0 =C2=A0 =C2=A0712248233ebe aufs6: standalone<br>
&gt;=C2=A0 =C2=A0 =C2=A03b71a8a848d8 aufs6: mmap<br>
&gt;=C2=A0 =C2=A0 =C2=A03e2924871f37 aufs6: base<br>
&gt;=C2=A0 =C2=A0 =C2=A07f4907a93101 aufs6: kbuild<br>
&gt;=C2=A0 =C2=A0 =C2=A0d2f7b03e4aa7 yaffs2: update VFS ctime operations to=
 6.6+<br>
&gt;=C2=A0 =C2=A0 =C2=A0bcd6cfcd1aa0 yaffs2: v6.5 fixups<br>
&gt;=C2=A0 =C2=A0 =C2=A0cc615704b5f5 yaffs2: Fix miscalculation of devname =
buffer length<br>
&gt;=C2=A0 =C2=A0 =C2=A08ef2e22dcf91 yaffs2: convert user_namespace to mnt_=
idmap<br>
&gt;=C2=A0 =C2=A0 =C2=A0c9c749f9f7d3 yaffs2: replace bdevname call with spr=
intf<br>
&gt;=C2=A0 =C2=A0 =C2=A0395b01cdc39d yaffs2: convert read_page -&gt; readfo=
lio<br>
&gt;=C2=A0 =C2=A0 =C2=A0d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_N=
ULL to check both ERR and NULL<br>
&gt;=C2=A0 =C2=A0 =C2=A0613c6d50fdbe yaffs: fix -Wstringop-overread compile=
 warning in yaffs_fix_null_name<br>
&gt;=C2=A0 =C2=A0 =C2=A0622c4648936f yaffs2: v5.12+ build fixups (not runti=
me tested)<br>
&gt;=C2=A0 =C2=A0 =C2=A07562133d4090 yaffs: include blkdev.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0dbd44252cd59 yaffs: fix misplaced variable declarat=
ion<br>
&gt;=C2=A0 =C2=A0 =C2=A0c223a10b1ac0 yaffs2: v5.6 build fixups<br>
&gt;=C2=A0 =C2=A0 =C2=A090f6007cfbf4 yaffs2: fix memory leak when /proc/yaf=
fs is read<br>
&gt;=C2=A0 =C2=A0 =C2=A037ee169c5ea1 yaffs: add strict check when call yaff=
s_internal_read_super<br>
&gt;=C2=A0 =C2=A0 =C2=A0b6e007b8abb6 yaffs: repair yaffs_get_mtd_device<br>
&gt;=C2=A0 =C2=A0 =C2=A0fb98f65a466a yaffs: Fix build failure by handling i=
node i_version with proper atomic API<br>
&gt;=C2=A0 =C2=A0 =C2=A051e0aac75ea2 yaffs2: fix memory leak in mount/umoun=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A02b74a0cae7b0 yaffs: Avoid setting any ACL releated =
xattr<br>
&gt;=C2=A0 =C2=A0 =C2=A0ff4130a9c376 Yaffs:check oob size before auto selec=
ting Yaffs1<br>
&gt;=C2=A0 =C2=A0 =C2=A0ba95b409c67c fs: yaffs2: replace CURRENT_TIME by ot=
her appropriate apis<br>
&gt;=C2=A0 =C2=A0 =C2=A08fa35eba9056 yaffs2: adjust to proper location of M=
S_RDONLY<br>
&gt;=C2=A0 =C2=A0 =C2=A01eb5deaad8c4 yaffs2: import git revision b4ce1bb (j=
an, 2020)<br>
&gt;=C2=A0 =C2=A0 =C2=A04dce67c1e8c8 initramfs: allow an optional wrapper s=
cript around initramfs generation<br>
&gt;=C2=A0 =C2=A0 =C2=A02f603d83fcc4 pnmtologo: use relocatable file name<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0664a6a0a484b tools: use basename to identify file i=
n gen-mach-types<br>
&gt;=C2=A0 =C2=A0 =C2=A09de64bc0c185 lib/build_OID_registry: fix reproducib=
ility issues<br>
&gt;=C2=A0 =C2=A0 =C2=A0ae9b80797295 vt/conmakehash: improve reproducibilit=
y<br>
&gt;=C2=A0 =C2=A0 =C2=A0a972323151bd iwlwifi: select MAC80211_LEDS conditio=
nally<br>
&gt;=C2=A0 =C2=A0 =C2=A015d2adcc0198 net/dccp: make it depend on CONFIG_BRO=
KEN (CVE-2020-16119)<br>
&gt;=C2=A0 =C2=A0 =C2=A05556a6c04b19 arm64/perf: Fix wrong cast that may ca=
use wrong truncation<br>
&gt;=C2=A0 =C2=A0 =C2=A05552dc768ffc defconfigs: drop obselete options<br>
&gt;=C2=A0 =C2=A0 =C2=A000fe4152df31 arm64/perf: fix backtrace for AAPCS wi=
th FP enabled<br>
&gt;=C2=A0 =C2=A0 =C2=A03888d0652edf linux-yocto: Handle /bin/awk issues<br=
>
&gt;=C2=A0 =C2=A0 =C2=A03d55d299f23a uvesafb: provide option to specify tim=
eout for task completion<br>
&gt;=C2=A0 =C2=A0 =C2=A023c068c080be uvesafb: print error message when task=
 timeout occurs<br>
&gt;=C2=A0 =C2=A0 =C2=A0edbfc939266e compiler.h: Undef before redefining __=
attribute_const__<br>
&gt;=C2=A0 =C2=A0 =C2=A0c99ae7e2a19a vmware: include jiffies.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0572d84d928c8 Resolve jiffies wrapping about arp<br>
&gt;=C2=A0 =C2=A0 =C2=A0fdcd47cac843 nfs: Allow default io size to be confi=
gured.<br>
&gt;=C2=A0 =C2=A0 =C2=A0927d48801098 check console device file on fs when b=
ooting<br>
&gt;=C2=A0 =C2=A0 =C2=A057cc27f821dd mount_root: clarify error messages for=
 when no rootfs found<br>
&gt;=C2=A0 =C2=A0 =C2=A01b53d82a8152 mconf: fix output of cflags and librar=
ies<br>
&gt;=C2=A0 =C2=A0 =C2=A01811da09f42c menuconfig,mconf-cfg: Allow specificat=
ion of ncurses location<br>
&gt;=C2=A0 =C2=A0 =C2=A083c2e0c6eb1f modpost: mask trivial warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A06de673039484 kbuild: exclude meta directory from di=
stclean processing<br>
&gt;=C2=A0 =C2=A0 =C2=A06decd32815f5 powerpc: serialize image targets<br>
&gt;=C2=A0 =C2=A0 =C2=A0f6b683b38318 arm: serialize build targets<br>
&gt;=C2=A0 =C2=A0 =C2=A0e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock =
back to blktrans_{open, release} to avoid race condition<br>
&gt;=C2=A0 =C2=A0 =C2=A0dc8a1e5a88f8 x86_64_defconfig: Fix warnings<br>
&gt;=C2=A0 =C2=A0 =C2=A068491e5f72b6 powerpc/ptrace: Disable array-bounds w=
arning with gcc8<br>
&gt;=C2=A0 =C2=A0 =C2=A0d71ebfce3004 powerpc: Disable attribute-alias warni=
ngs from gcc8<br>
&gt;=C2=A0 =C2=A0 =C2=A062f50884b8b1 powerpc: kexec fix for powerpc64<br>
&gt;=C2=A0 =C2=A0 =C2=A0da6871c62c37 powerpc: Add unwind information for SP=
E registers of E500 core<br>
&gt;=C2=A0 =C2=A0 =C2=A0f161c880c11d mips: make current_cpu_data preempt sa=
fe<br>
&gt;=C2=A0 =C2=A0 =C2=A05e94a8247ce7 mips: vdso: fix &#39;jalr $t9&#39; cra=
sh in vdso code<br>
&gt;=C2=A0 =C2=A0 =C2=A019e36714b1c7 mips: Kconfig: add QEMUMIPS64 option<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0e2e537db3cbd 4kc cache tlb hazard: tlbp cache coher=
ency<br>
&gt;=C2=A0 =C2=A0 =C2=A0aee9870611e5 malta uhci quirks: make allowance for =
slow 4k(e)c<br>
&gt;=C2=A0 =C2=A0 =C2=A0881948cd1517 drm/fb-helper: move zeroing code to dr=
m_fb_helper_fill_var<br>
&gt;=C2=A0 =C2=A0 =C2=A098ec1963fcb7 arm64: defconfig: cleanup config optio=
ns<br>
&gt;=C2=A0 =C2=A0 =C2=A0f1727c537ba8 vexpress: Pass LOADADDR to Makefile<br=
>
&gt;=C2=A0 =C2=A0 =C2=A04474c32dc24a arm: ARM EABI socketcall<br>
&gt;=C2=A0 =C2=A0 =C2=A075e31a2b70fd ARM: LPAE: Invalidate the TLB for modu=
le addresses during translation fault<br>
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
&gt; index e0006035fe..83ab521399 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.6.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.6.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.6.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.6.bb</a><br>
&gt; @@ -14,13 +14,13 @@ python () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise bb.parse.SkipRecipe(&quot;Set =
PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it&quot;)<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -SRCREV_machine ?=3D &quot;4c94a7140a0416421cd82fe18703e99d7c4eec8e&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;39d19bc9f333a0bfb88cd55befe70d5da87adcf8&quot;=
<br>
&gt; +SRCREV_machine ?=3D &quot;baede5a5c17bce04338fe12d6d0f8277edd43dd4&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;a56c84ea9e406a96490a0d70668e31b10675f1bd&quot;=
<br>
&gt;<br>
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
&gt;<br>
&gt; -LINUX_VERSION ?=3D &quot;6.6.85&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;6.6.86&quot;<br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc=
9398086aedcd7e46&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-t=
iny_6.6.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb</a=
> b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.6.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb</a><br>
&gt; index 8c0617be10..49a2bb9aa4 100644<br>
&gt; --- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.6=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb</a><br>
&gt; +++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.6=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.6.bb</a><br>
&gt; @@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc<br>
&gt;=C2=A0 # CVE exclusions<br>
&gt;=C2=A0 include recipes-kernel/linux/cve-exclusion_6.6.inc<br>
&gt;<br>
&gt; -LINUX_VERSION ?=3D &quot;6.6.85&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;6.6.86&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc=
9398086aedcd7e46&quot;<br>
&gt;<br>
&gt;=C2=A0 DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86=
&#39;, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
&gt; @@ -17,8 +17,8 @@ DEPENDS +=3D &quot;openssl-native util-linux-native&=
quot;<br>
&gt;=C2=A0 KMETA =3D &quot;kernel-meta&quot;<br>
&gt;=C2=A0 KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
&gt;<br>
&gt; -SRCREV_machine ?=3D &quot;50111c8145a573a5eb34859736492d3914d74f26&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;39d19bc9f333a0bfb88cd55befe70d5da87adcf8&quot;=
<br>
&gt; +SRCREV_machine ?=3D &quot;754b91c970cb5001c4f1b205be0b29b0efbbe82d&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;a56c84ea9e406a96490a0d70668e31b10675f1bd&quot;=
<br>
&gt;<br>
&gt;=C2=A0 PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6=
.6.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.6.bb</a> b/meta/r=
ecipes-kernel/linux/<a href=3D"http://linux-yocto_6.6.bb" rel=3D"noreferrer=
" target=3D"_blank">linux-yocto_6.6.bb</a><br>
&gt; index 061837ec88..abbfdbbd43 100644<br>
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
&gt;<br>
&gt; -SRCREV_machine:qemuarm ?=3D &quot;c7fc26b463b6d492177ab4f3133ac709f72=
959e6&quot;<br>
&gt; -SRCREV_machine:qemuarm64 ?=3D &quot;a2123abde1b536e17d6f8b41c07006b1b=
78fc14e&quot;<br>
&gt; -SRCREV_machine:qemuloongarch64 ?=3D &quot;6a5b2ed821525dac9e4f3f52833=
76f02965d3a7b&quot;<br>
&gt; -SRCREV_machine:qemumips ?=3D &quot;441ff4147581f8866ccb145ee1fcecb418=
543a46&quot;<br>
&gt; -SRCREV_machine:qemuppc ?=3D &quot;c186535e4a16fe6524c963f40744f56d56c=
c37ae&quot;<br>
&gt; -SRCREV_machine:qemuriscv64 ?=3D &quot;6a5b2ed821525dac9e4f3f5283376f0=
2965d3a7b&quot;<br>
&gt; -SRCREV_machine:qemuriscv32 ?=3D &quot;6a5b2ed821525dac9e4f3f5283376f0=
2965d3a7b&quot;<br>
&gt; -SRCREV_machine:qemux86 ?=3D &quot;6a5b2ed821525dac9e4f3f5283376f02965=
d3a7b&quot;<br>
&gt; -SRCREV_machine:qemux86-64 ?=3D &quot;6a5b2ed821525dac9e4f3f5283376f02=
965d3a7b&quot;<br>
&gt; -SRCREV_machine:qemumips64 ?=3D &quot;ef983636bee26dd17055fbff877a6ca4=
cd10e4ed&quot;<br>
&gt; -SRCREV_machine ?=3D &quot;6a5b2ed821525dac9e4f3f5283376f02965d3a7b&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;39d19bc9f333a0bfb88cd55befe70d5da87adcf8&quot;=
<br>
&gt; +SRCREV_machine:qemuarm ?=3D &quot;d5fad62ae36747211fcfda82fc984c7085c=
7d343&quot;<br>
&gt; +SRCREV_machine:qemuarm64 ?=3D &quot;4469abd262a2de4c66cd5d37f9dfbfb20=
60d4e67&quot;<br>
&gt; +SRCREV_machine:qemuloongarch64 ?=3D &quot;257833f963feceebad0ef58d5e5=
426f910349a85&quot;<br>
&gt; +SRCREV_machine:qemumips ?=3D &quot;8dabd4628c1c131637bda6915bea0b2149=
3b9338&quot;<br>
&gt; +SRCREV_machine:qemuppc ?=3D &quot;1862875baa7888ec55244d0ccfe30c94f94=
be1a7&quot;<br>
&gt; +SRCREV_machine:qemuriscv64 ?=3D &quot;257833f963feceebad0ef58d5e5426f=
910349a85&quot;<br>
&gt; +SRCREV_machine:qemuriscv32 ?=3D &quot;257833f963feceebad0ef58d5e5426f=
910349a85&quot;<br>
&gt; +SRCREV_machine:qemux86 ?=3D &quot;257833f963feceebad0ef58d5e5426f9103=
49a85&quot;<br>
&gt; +SRCREV_machine:qemux86-64 ?=3D &quot;257833f963feceebad0ef58d5e5426f9=
10349a85&quot;<br>
&gt; +SRCREV_machine:qemumips64 ?=3D &quot;1d698ed1a159dde9479181de457e5134=
3c01cd70&quot;<br>
&gt; +SRCREV_machine ?=3D &quot;257833f963feceebad0ef58d5e5426f910349a85&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;a56c84ea9e406a96490a0d70668e31b10675f1bd&quot;=
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
&gt; -SRCREV_machine:class-devupstream ?=3D &quot;d57a7c6169607dd09157ccf25=
7e556fb75444f28&quot;<br>
&gt; +SRCREV_machine:class-devupstream ?=3D &quot;3fa1ea3ede181bf11c329df05=
6840b04ec2e3dca&quot;<br>
&gt;=C2=A0 PN:class-devupstream =3D &quot;linux-yocto-upstream&quot;<br>
&gt;=C2=A0 KBRANCH:class-devupstream =3D &quot;v6.6/base&quot;<br>
&gt;<br>
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
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc=
9398086aedcd7e46&quot;<br>
&gt; -LINUX_VERSION ?=3D &quot;6.6.85&quot;<br>
&gt; +LINUX_VERSION ?=3D &quot;6.6.86&quot;<br>
&gt;<br>
&gt;=C2=A0 PV =3D &quot;${LINUX_VERSION}+git&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.39.2<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000037c2f80636493527--

