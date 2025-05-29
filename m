Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDC3C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 19:42:19 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.1907.1748547731889115451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 12:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ELgMPKmv;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.175, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e7dc83224d5so2162759276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 12:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748547731; x=1749152531; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iMhWtZTIZm0/YAtt7xP+Lrfm1chi1EuYZtc+rGwdsw=;
        b=ELgMPKmvlNE0r3JpygXy8rPwMRGUELy+jdqcLmbhRJTVbiIn9Z8ETqlox+vKCc0N1a
         oHnEoNQreM4LmFk5ydhoDxTf+ameoMx1wYbSm1ilq5krPR9XcCp7sIjlPx2zaxuMdGyK
         ZRqBi9GDMSgdTASAgd9/NzOvsjYObSbkTwmpLpfvzDWU9w9Qs98V0pFsF76Sqzq6yEXN
         mMOK3dihMdOBqhCFc/6b8ZyBV/yCZUc5vnM2SHtHuXTK72YDLnWT3BUejbovrSa/SIjd
         MLOm5QZglrkk905rAUc3joA0tBFt4xoNd5qlQwfXIYcdbw1euM2DQx0zEs0LltbVDRPk
         5t8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748547731; x=1749152531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2iMhWtZTIZm0/YAtt7xP+Lrfm1chi1EuYZtc+rGwdsw=;
        b=GSgPCwkD1++s0GMHelZn+3w9pEVr6q10aJ3DHfvQG9eSt4bEGpSL+USj822N9Eku1j
         WvgsQQJQCKDfJcD3kkCj33FPsrPD6AMKs7jbB6mxuw1EAf20TlNrWv4vyILWSXxYvXUb
         C1MAmJKee1XBHsay5qdtEXiISE5xzj57FkGEztQC5I6NCHM9K/rTu8RXLiHCxR6g9cIj
         +rtWTr5t9+bVO1eKDhHZjkzAKQtye4gkBLLE6h+J8kHuWcaFEQg9Iu2OWDT8UjUuwbao
         z7qenyfWURWVZv+v6TW4B+pfuXQDqifBA/4yV+grNpHDIjTkomB+rZ0IOu7qW5V9POCr
         +oWw==
X-Gm-Message-State: AOJu0YzG3u9p+5dwzjp8AkKDb8QGhJZDoVn7F6Man+47UUeY/JwAtVSg
	eAIP/FaGxleDvrDEloHcY8Mdm6A2Zip0KB/dT+zak9xuyWZz6gWIjVzzQb1HNm5JZ3O9vljC7x5
	l92tC3vMzEJFRYBvddGm5MTbhimERWWftnw27abwlHQ==
X-Gm-Gg: ASbGncvxnzDFSU6FQqFuGISQITHHz9ZkY39DfoDyQXSb1tpt83vJNAQhXRDKlPRQ+QY
	Dj4iG1F+Fjg40Sw4kdHMx6tMrlo7dsqhzcJyQBSTWR7HLcKlCAp5a4G5w8TU1dbB6yVXbcaONpf
	TzV1O5Apv0OaFELvyBqaTvUAQgWAIJp2kC5XGaTdAftq/eT+veiLxMB4BEIfxCbWY+GXQOvcyNa
	9s=
X-Google-Smtp-Source: AGHT+IFkHPp5TzvQLFO5ds/4dL/YOzWd8dcFVjHtNqcQEI7Mk8mXraD4rwm01zTFSVonA1iOIpDQrhoSr611KYJoCds=
X-Received: by 2002:a05:690c:6e03:b0:70e:404f:6714 with SMTP id
 00721157ae682-70f8787aefamr79573007b3.19.1748547730649; Thu, 29 May 2025
 12:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250528194118.1534655-1-bruce.ashfield@gmail.com>
 <CAOSpxdYxdj6jDo7O5OPFc_G5BX_36F2nJnnpOiiHVMiRqvP-GA@mail.gmail.com> <CADkTA4NFnYGkMVKuHh77g2RTOzW2mA3CWG3BqRLfg1DRoQdJZg@mail.gmail.com>
In-Reply-To: <CADkTA4NFnYGkMVKuHh77g2RTOzW2mA3CWG3BqRLfg1DRoQdJZg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 29 May 2025 12:41:59 -0700
X-Gm-Features: AX0GCFuvo8mVmpFFja1kTmDwWi0wnMTKuPp7dpofmRuMsTZpa0RjPbIj0ALqYnU
Message-ID: <CAOSpxdZ7z6H1u3=ZD3KufJ=7FDihzhPMgNu_kOA_HGhUDi0XqA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/6] linux-yocto/6.6: update to v6.6.86
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 19:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217432

On Thu, May 29, 2025 at 9:58=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
>
>
> On Thu, May 29, 2025 at 11:32=E2=80=AFAM Steve Sakoman <steve@sakoman.com=
> wrote:
>>
>> Hi Bruce,
>>
>> The current version in Scarthgap is 6.6.84, so this series seems to be
>> missing the 6.6.84 -> 6.6.85 version bump!
>
>
> There's actually two patches missing. I thought there were 6 .. but there=
 were 8 new commits.
>
> I just sent a v2 with 8 patches.

Thanks Bruce!

Steve

>>
>> On Wed, May 28, 2025 at 12:41=E2=80=AFPM <bruce.ashfield@gmail.com> wrot=
e:
>> >
>> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
>> >
>> > Updating linux-yocto/6.6 to the latest korg -stable release that compr=
ises
>> > the following commits:
>> >
>> >     3fa1ea3ede18 Linux 6.6.86
>> >     72a68d2bede3 usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2=
.c
>> >     367a281315ec serial: 8250_dma: terminate correct DMA in tx_dma_flu=
sh()
>> >     6186fb2cd363 memstick: rtsx_usb_ms: Fix slab-use-after-free in rts=
x_usb_ms_drv_remove
>> >     2beb999f73b4 net: usb: usbnet: restore usb%d name exception for lo=
cal mac addresses
>> >     3007115c2e40 net: usb: qmi_wwan: add Telit Cinterion FE990B compos=
ition
>> >     ad43b150e109 net: usb: qmi_wwan: add Telit Cinterion FN990B compos=
ition
>> >     5ec93d77200e tty: serial: fsl_lpuart: disable transmitter before c=
hanging RS485 related registers
>> >     fe14cfba6c16 tty: serial: 8250: Add Brainboxes XC devices
>> >     be28a3dabdca tty: serial: 8250: Add some more device IDs
>> >     52eed361c250 counter: microchip-tcb-capture: Fix undefined counter=
 channel state on probe
>> >     fa15592e9d92 counter: stm32-lptimer-cnt: fix error handling when e=
nabling
>> >     835807f54fad ALSA: hda/realtek: Support mute LED on HP Laptop 15s-=
du3xxx
>> >     525104157385 netfilter: socket: Lookup orig tuple for IPv6 SNAT
>> >     f16a097047e3 scsi: ufs: qcom: Only free platform MSIs when ESI is =
enabled
>> >     3918b2016d28 reset: starfive: jh71x0: Fix accessing the empty memb=
er on JH7110 SoC
>> >     790d30578faa mm/page_alloc: fix memory accept before watermarks ge=
ts initialized
>> >     404d85a71d5a drm/amd/display: Don't write DP_MSTM_CTRL after LT
>> >     5f57a96e92c6 drm/dp_mst: Add a helper to queue a topology probe
>> >     93ccb0fb3606 drm/dp_mst: Factor out function to queue a topology p=
robe work
>> >     b9264aa24f62 drm/amd/display: Check denominator crb_pipes before u=
sed
>> >     ad0410346cc4 ARM: Remove address checking for MMUless devices
>> >     1809cabfe0e9 ARM: 9351/1: fault: Add "cut here" line for prefetch =
aborts
>> >     fe17c8aaa90f ARM: 9350/1: fault: Implement copy_from_kernel_nofaul=
t_allowed()
>> >     9da6b6340dbc atm: Fix NULL pointer dereference
>> >     f99afc594a2b HID: hid-plantronics: Add mic mute mapping and genera=
lize quirks
>> >     8ecdc85b5cab ALSA: usb-audio: Add quirk for Plantronics headsets t=
o fix control names
>> >     6a5b2ed82152 ARM: dts: am335x-bone-common: Increase MDIO reset dea=
ssert time
>> >     ceb5fadbf450 Revert "v6.6 -stable -rt merge fixup"
>> >     1c2962a164ff v6.6 -stable -rt merge fixup
>> >     18abb2787b53 x86/syscall: Mark exit[_group] syscall handlers __nor=
eturn
>> >     2879d995e569 pnmtologo: sync with 6.6
>> >     43ea1c5e6eb3 lib/build_OID_registry: take -stable reproducibility =
changes
>> >     35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
>> >     9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct poin=
ter types warning in resolve_btfids
>> >     42b2eec2e503 bpftool: Query only cgroup-related attach types
>> >     f71bb11887ba cpu/amd: inhibit SMP check for qemux86
>> >     c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
>> >     64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadge=
t suspend/resume to avoid deadlock
>> >     7c76aad68f6d kselftest: Add a ksft_perror() helper
>> >     06644f0d7193 drm/tilcdc: Set preferred depth
>> >     ff7ae7b32324 crypto: jitter - add RCT/APT support for different OS=
Rs
>> >     50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
>> >     58e5c91d6701 x86/alternatives: Disable interrupts and sync when op=
timizing NOPs in place
>> >     c878fd2d4c79 x86/alternatives: Sync core before enabling interrupt=
s
>> >     c2d64b9f52b6 qemux86: add configuration symbol to select values
>> >     630c33229e6d sched/isolation: really align nohz_full with rcu_nocb=
s
>> >     0e5e0f68e2e6 clear_warn_once: add a clear_warn_once=3D boot parame=
ter
>> >     46934791b902 clear_warn_once: bind a timer to written reset value
>> >     cdee9e38ff32 clear_warn_once: expand debugfs to include read suppo=
rt
>> >     82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
>> >     36dc380b776b libbpf: Fix build warning on ref_ctr_off
>> >     9e3e1fe20982 perf: perf can not parser the backtrace of app in the=
 32bit system and 64bit kernel.
>> >     e497a4a5da65 perf: x86-32: explicitly include <errno.h>
>> >     7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
>> >     1cfc19423dc7 perf: fix bench numa compilation
>> >     98bc2815fade perf: add SLANG_INC for slang.h
>> >     17209a70b9b3 perf: add sgidefs.h to for mips builds
>> >     9cd4258d910a perf: change --root to --prefix for python install
>> >     8110a4f26628 perf: add 'libperl not found' warning
>> >     bc89d5e08f77 perf: force include of <stdbool.h>
>> >     4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
>> >     bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
>> >     30b2236ab378 FAT: Added FAT_NO_83NAME
>> >     cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
>> >     0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
>> >     5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
>> >     c4342d979bf2 aufs6: fix magic.mk include path
>> >     35266bc2dc81 aufs6: adapt to v6.6
>> >     8edede4e98be aufs6: core
>> >     712248233ebe aufs6: standalone
>> >     3b71a8a848d8 aufs6: mmap
>> >     3e2924871f37 aufs6: base
>> >     7f4907a93101 aufs6: kbuild
>> >     d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
>> >     bcd6cfcd1aa0 yaffs2: v6.5 fixups
>> >     cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
>> >     8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
>> >     c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
>> >     395b01cdc39d yaffs2: convert read_page -> readfolio
>> >     d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check bo=
th ERR and NULL
>> >     613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaf=
fs_fix_null_name
>> >     622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
>> >     7562133d4090 yaffs: include blkdev.h
>> >     dbd44252cd59 yaffs: fix misplaced variable declaration
>> >     c223a10b1ac0 yaffs2: v5.6 build fixups
>> >     90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
>> >     37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read=
_super
>> >     b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
>> >     fb98f65a466a yaffs: Fix build failure by handling inode i_version =
with proper atomic API
>> >     51e0aac75ea2 yaffs2: fix memory leak in mount/umount
>> >     2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
>> >     ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
>> >     ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate=
 apis
>> >     8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
>> >     1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
>> >     4dce67c1e8c8 initramfs: allow an optional wrapper script around in=
itramfs generation
>> >     2f603d83fcc4 pnmtologo: use relocatable file name
>> >     664a6a0a484b tools: use basename to identify file in gen-mach-type=
s
>> >     9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
>> >     ae9b80797295 vt/conmakehash: improve reproducibility
>> >     a972323151bd iwlwifi: select MAC80211_LEDS conditionally
>> >     15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-1=
6119)
>> >     5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong trunc=
ation
>> >     5552dc768ffc defconfigs: drop obselete options
>> >     00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
>> >     3888d0652edf linux-yocto: Handle /bin/awk issues
>> >     3d55d299f23a uvesafb: provide option to specify timeout for task c=
ompletion
>> >     23c068c080be uvesafb: print error message when task timeout occurs
>> >     edbfc939266e compiler.h: Undef before redefining __attribute_const=
__
>> >     c99ae7e2a19a vmware: include jiffies.h
>> >     572d84d928c8 Resolve jiffies wrapping about arp
>> >     fdcd47cac843 nfs: Allow default io size to be configured.
>> >     927d48801098 check console device file on fs when booting
>> >     57cc27f821dd mount_root: clarify error messages for when no rootfs=
 found
>> >     1b53d82a8152 mconf: fix output of cflags and libraries
>> >     1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses =
location
>> >     83c2e0c6eb1f modpost: mask trivial warnings
>> >     6de673039484 kbuild: exclude meta directory from distclean process=
ing
>> >     6decd32815f5 powerpc: serialize image targets
>> >     f6b683b38318 arm: serialize build targets
>> >     e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktran=
s_{open, release} to avoid race condition
>> >     dc8a1e5a88f8 x86_64_defconfig: Fix warnings
>> >     68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc=
8
>> >     d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
>> >     62f50884b8b1 powerpc: kexec fix for powerpc64
>> >     da6871c62c37 powerpc: Add unwind information for SPE registers of =
E500 core
>> >     f161c880c11d mips: make current_cpu_data preempt safe
>> >     5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
>> >     19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
>> >     e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
>> >     aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
>> >     881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fil=
l_var
>> >     98ec1963fcb7 arm64: defconfig: cleanup config options
>> >     f1727c537ba8 vexpress: Pass LOADADDR to Makefile
>> >     4474c32dc24a arm: ARM EABI socketcall
>> >     75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses du=
ring translation fault
>> >
>> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> > ---
>> >  .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
>> >  .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
>> >  meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++---------=
-
>> >  3 files changed, 20 insertions(+), 20 deletions(-)
>> >
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/re=
cipes-kernel/linux/linux-yocto-rt_6.6.bb
>> > index e0006035fe..83ab521399 100644
>> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
>> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
>> > @@ -14,13 +14,13 @@ python () {
>> >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/ker=
nel to linux-yocto-rt to enable it")
>> >  }
>> >
>> > -SRCREV_machine ?=3D "4c94a7140a0416421cd82fe18703e99d7c4eec8e"
>> > -SRCREV_meta ?=3D "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
>> > +SRCREV_machine ?=3D "baede5a5c17bce04338fe12d6d0f8277edd43dd4"
>> > +SRCREV_meta ?=3D "a56c84ea9e406a96490a0d70668e31b10675f1bd"
>> >
>> >  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KB=
RANCH};name=3Dmachine;protocol=3Dhttps \
>> >             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta=
;name=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps"
>> >
>> > -LINUX_VERSION ?=3D "6.6.85"
>> > +LINUX_VERSION ?=3D "6.6.86"
>> >
>> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aed=
cd7e46"
>> >
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/=
recipes-kernel/linux/linux-yocto-tiny_6.6.bb
>> > index 8c0617be10..49a2bb9aa4 100644
>> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
>> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
>> > @@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
>> >  # CVE exclusions
>> >  include recipes-kernel/linux/cve-exclusion_6.6.inc
>> >
>> > -LINUX_VERSION ?=3D "6.6.85"
>> > +LINUX_VERSION ?=3D "6.6.86"
>> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aed=
cd7e46"
>> >
>> >  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', =
'', d)}"
>> > @@ -17,8 +17,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
>> >  KMETA =3D "kernel-meta"
>> >  KCONF_BSP_AUDIT_LEVEL =3D "2"
>> >
>> > -SRCREV_machine ?=3D "50111c8145a573a5eb34859736492d3914d74f26"
>> > -SRCREV_meta ?=3D "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
>> > +SRCREV_machine ?=3D "754b91c970cb5001c4f1b205be0b29b0efbbe82d"
>> > +SRCREV_meta ?=3D "a56c84ea9e406a96490a0d70668e31b10675f1bd"
>> >
>> >  PV =3D "${LINUX_VERSION}+git"
>> >
>> > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recip=
es-kernel/linux/linux-yocto_6.6.bb
>> > index 061837ec88..abbfdbbd43 100644
>> > --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
>> > +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
>> > @@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?=3D "v6.6/standard/base"
>> >  KBRANCH:qemuloongarch64  ?=3D "v6.6/standard/base"
>> >  KBRANCH:qemumips64 ?=3D "v6.6/standard/mti-malta64"
>> >
>> > -SRCREV_machine:qemuarm ?=3D "c7fc26b463b6d492177ab4f3133ac709f72959e6=
"
>> > -SRCREV_machine:qemuarm64 ?=3D "a2123abde1b536e17d6f8b41c07006b1b78fc1=
4e"
>> > -SRCREV_machine:qemuloongarch64 ?=3D "6a5b2ed821525dac9e4f3f5283376f02=
965d3a7b"
>> > -SRCREV_machine:qemumips ?=3D "441ff4147581f8866ccb145ee1fcecb418543a4=
6"
>> > -SRCREV_machine:qemuppc ?=3D "c186535e4a16fe6524c963f40744f56d56cc37ae=
"
>> > -SRCREV_machine:qemuriscv64 ?=3D "6a5b2ed821525dac9e4f3f5283376f02965d=
3a7b"
>> > -SRCREV_machine:qemuriscv32 ?=3D "6a5b2ed821525dac9e4f3f5283376f02965d=
3a7b"
>> > -SRCREV_machine:qemux86 ?=3D "6a5b2ed821525dac9e4f3f5283376f02965d3a7b=
"
>> > -SRCREV_machine:qemux86-64 ?=3D "6a5b2ed821525dac9e4f3f5283376f02965d3=
a7b"
>> > -SRCREV_machine:qemumips64 ?=3D "ef983636bee26dd17055fbff877a6ca4cd10e=
4ed"
>> > -SRCREV_machine ?=3D "6a5b2ed821525dac9e4f3f5283376f02965d3a7b"
>> > -SRCREV_meta ?=3D "39d19bc9f333a0bfb88cd55befe70d5da87adcf8"
>> > +SRCREV_machine:qemuarm ?=3D "d5fad62ae36747211fcfda82fc984c7085c7d343=
"
>> > +SRCREV_machine:qemuarm64 ?=3D "4469abd262a2de4c66cd5d37f9dfbfb2060d4e=
67"
>> > +SRCREV_machine:qemuloongarch64 ?=3D "257833f963feceebad0ef58d5e5426f9=
10349a85"
>> > +SRCREV_machine:qemumips ?=3D "8dabd4628c1c131637bda6915bea0b21493b933=
8"
>> > +SRCREV_machine:qemuppc ?=3D "1862875baa7888ec55244d0ccfe30c94f94be1a7=
"
>> > +SRCREV_machine:qemuriscv64 ?=3D "257833f963feceebad0ef58d5e5426f91034=
9a85"
>> > +SRCREV_machine:qemuriscv32 ?=3D "257833f963feceebad0ef58d5e5426f91034=
9a85"
>> > +SRCREV_machine:qemux86 ?=3D "257833f963feceebad0ef58d5e5426f910349a85=
"
>> > +SRCREV_machine:qemux86-64 ?=3D "257833f963feceebad0ef58d5e5426f910349=
a85"
>> > +SRCREV_machine:qemumips64 ?=3D "1d698ed1a159dde9479181de457e51343c01c=
d70"
>> > +SRCREV_machine ?=3D "257833f963feceebad0ef58d5e5426f910349a85"
>> > +SRCREV_meta ?=3D "a56c84ea9e406a96490a0d70668e31b10675f1bd"
>> >
>> >  # set your preferred provider of linux-yocto to 'linux-yocto-upstream=
', and you'll
>> >  # get the <version>/base branch, which is pure upstream -stable, and =
the same
>> >  # meta SRCREV as the linux-yocto-standard builds. Select your version=
 using the
>> >  # normal PREFERRED_VERSION settings.
>> >  BBCLASSEXTEND =3D "devupstream:target"
>> > -SRCREV_machine:class-devupstream ?=3D "d57a7c6169607dd09157ccf257e556=
fb75444f28"
>> > +SRCREV_machine:class-devupstream ?=3D "3fa1ea3ede181bf11c329df056840b=
04ec2e3dca"
>> >  PN:class-devupstream =3D "linux-yocto-upstream"
>> >  KBRANCH:class-devupstream =3D "v6.6/base"
>> >
>> > @@ -44,7 +44,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.=
git;name=3Dmachine;branch=3D${KBRA
>> >             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta=
;name=3Dmeta;branch=3Dyocto-6.6;destsuffix=3D${KMETA};protocol=3Dhttps"
>> >
>> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aed=
cd7e46"
>> > -LINUX_VERSION ?=3D "6.6.85"
>> > +LINUX_VERSION ?=3D "6.6.86"
>> >
>> >  PV =3D "${LINUX_VERSION}+git"
>> >
>> > --
>> > 2.39.2
>> >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

