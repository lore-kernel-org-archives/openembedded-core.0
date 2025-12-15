Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9136FD59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:53:44 +0000 (UTC)
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45858.1765796015585718770
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UeSr4v+T;
 spf=pass (domain: gmail.com, ip: 74.125.224.52, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-644795bf5feso2880689d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765796015; x=1766400815; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vhqLQQIaTLSISDWmKjIx3AVWrJ05GpqduQ336ao+Ad4=;
        b=UeSr4v+TegZVBP9zWhEEZVqJUXqetZ3KOlAC+yKCw1ijaXpgHotzqhapIPYKns8wG0
         M0M9A+5b0GLEY5E6TThOmmIQBZNxt0gla0MQVeGmDUl++dDaePGyQTt9TIX843gSr+FW
         sDm8gJu5B3iO+UogxRZLcUdMZwL4L2zF3aIlwutvE74J+5jeyFJj0ZneDRJd+uBjlyOK
         +A+7Hvt7bglbEzuNCEuqHNKq8zUjaayxVLFKKGdi58xYRxaOBXlXSj5HBXyDXOEEZfBM
         zkTB/SPAOfTo7ylQYrU34H8k51tNxfrEHzfuosz5UMItEZuUdWq6fyddHr6cC3HBUHZP
         eiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765796015; x=1766400815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhqLQQIaTLSISDWmKjIx3AVWrJ05GpqduQ336ao+Ad4=;
        b=WlvF74zqOcW3xLLv3FEZ8UNgf1B7f6jqGiGnG68m4AIAWgJme6tR/F1qaCdIotK7NL
         33PPmrs+BEOFjVYFSnP/Ss0PGxg1+rtLFU0QjX2YKFdUVO0vDvtwzIKpnGFhUtBxRAVH
         ou4llySorQD3DioqVQVG0HWCCtavKBS4XS3sfhBLlz+su0oucPkflqICAJYSyg1k3YD/
         w1GRMn8QVdqj1e+wxZP2gBFdf7EjHN0oUhd1rsljbDC98ydPTQVAyBjeU1eHikzEgFxW
         pBGm6Fd4Kugd638iyrRhpAdYKfS9S8ope73O9UWcMCijQSk2Q88wZ64TgZ0tonNkczZ7
         Z/HQ==
X-Gm-Message-State: AOJu0YwG7pYzEs5IBws5JDicsPFmD1ayPysJIgKjvsp/JH3l++EGw1T3
	5J2gXX8YTQ0Do4C/PyebMbaq6VPf/wWGRXPwA1YOYdRre4YIYQJ+NCUdpTkDa73Up3s2qWznyjZ
	QB0QmTnkgsggmsad6gfHafl33AZjH8BuKoGbI
X-Gm-Gg: AY/fxX4LtjAqAPacK/1jTaCe1ANghB/2foCpPbBFhWCvGGKKi2/dt8coHPusFQy7259
	/n2rDtwbSn06NaJ7rJRqtBpPPPxa4ivkvr4mVZ6RwWoO/ykICnTvWHXpTCtelVANthVaZR29fdS
	MS3WQ+xhsoCgjqouNi77NQQRUYMJK25qrjwrul+xJETxfLDtAdjoWZHB6+HCo9BfkA6FXhJqiQn
	Sptk2xw19+OAVhPvMnxgx36nup88caZc3ZlqUr774d8WpxG2YWwxQexJwemdt1xwjWifUZ9/Ek8
	ixGVaD0pUGUVU3+AaXaYQrGtPQpac5l2E5CZJ5MnPhfTTuXOno+cZmUD9vDLGo6bYGEokmEYwUw
	L3y0dHTQ3ha17GL8CU+FiJjNY3vlFGQk8VOYN933I6vl+MVI=
X-Google-Smtp-Source: AGHT+IE6+jyu6AyuEhAgXAD06XnMD/Y5Zo3h9WsU+8zMHzuZgLaAPnc4dQNzXoSvrcNXo5p7SNK2S58tDO3wxF76aUI=
X-Received: by 2002:a05:690e:13c4:b0:644:45a9:c0d0 with SMTP id
 956f58d0204a3-645555cdcb9mr8692125d50.2.1765796014360; Mon, 15 Dec 2025
 02:53:34 -0800 (PST)
MIME-Version: 1.0
References: <20251213095528.1027888-1-raj.khem@gmail.com> <CANNYZj_5VVcCmE3eG79w7Fydrsj_0x7F8OuGgXhk6g1Gtx9dAQ@mail.gmail.com>
In-Reply-To: <CANNYZj_5VVcCmE3eG79w7Fydrsj_0x7F8OuGgXhk6g1Gtx9dAQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Dec 2025 02:53:23 -0800
X-Gm-Features: AQt7F2q2B_7E9vg4_weQFsIR7EdDRyVdDgZY9lSZQ9xrPDw6NCgTcJBky0IuuAs
Message-ID: <CAMKF1sq2ec92d3sA53_MLz9=npAaDV8wweO=CtBLVAt7oUzWFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kexec-tools: Add riscv64 support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002e8f310645fb6c2e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:53:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227727

--0000000000002e8f310645fb6c2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 5:00=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> Do not add huge "Pending [no reason]" patches please. By now you
> should know I will immediately strongly object.
>
> And please do just a little bit more research: this patch is a part of
> 2.0.32 release, so the recipe should be updated to that instead.


Maybe you should read mailing list throughly first?
Such emails do not help the community sadly and they are not funny either



>
> Alex
>
> On Sat, 13 Dec 2025 at 10:55, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > These patches are used in several distros and are part of kexec-tools
> > riscv-collab fork. Unfortunately upstreaming for this fork is slow
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../kexec-tools/riscv64-hotplug-support.patch |   25 +
> >  .../kexec/kexec-tools/riscv64-support.patch   | 1469 +++++++++++++++++
> >  .../kexec/kexec-tools_2.0.31.bb               |    4 +-
> >  3 files changed, 1497 insertions(+), 1 deletion(-)
> >  create mode 100644
> meta/recipes-kernel/kexec/kexec-tools/riscv64-hotplug-support.patch
> >  create mode 100644
> meta/recipes-kernel/kexec/kexec-tools/riscv64-support.patch
> >
> > diff --git
> a/meta/recipes-kernel/kexec/kexec-tools/riscv64-hotplug-support.patch
> b/meta/recipes-kernel/kexec/kexec-tools/riscv64-hotplug-support.patch
> > new file mode 100644
> > index 0000000000..90e08a9050
> > --- /dev/null
> > +++ b/meta/recipes-kernel/kexec/kexec-tools/riscv64-hotplug-support.pat=
ch
> > @@ -0,0 +1,25 @@
> > +From: Petr Tesarik <ptesarik@suse.com>
> > +Subject: riscv: fix build with hotplug support
> > +Upstream: not yet, blocked by base RISC-V patches
> > +
> > +Commit 3c47f384f1c4 ("kexec_load: Use new kexec flag for hotplug
> support")
> > +adds a new architecture-specific function named arch_do_exclude_segmen=
t.
> > +Since RISC-V does not yet implement hotplug updates in the kernel, add=
 a
> > +trivial definition of this function to kexec-tools.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Petr Tesarik <ptesarik@suse.com>
> > +Index: kexec-tools-2.0.29/kexec/arch/riscv/kexec-riscv.c
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- kexec-tools-2.0.29.orig/kexec/arch/riscv/kexec-riscv.c
> > ++++ kexec-tools-2.0.29/kexec/arch/riscv/kexec-riscv.c
> > +@@ -362,3 +362,8 @@ int arch_compat_trampoline(struct kexec_
> > + void arch_update_purgatory(struct kexec_info *UNUSED(info))
> > + {
> > + }
> > ++
> > ++int arch_do_exclude_segment(struct kexec_info *UNUSED(info), struct
> kexec_segment *UNUSED(segment))
> > ++{
> > ++      return 0;
> > ++}
> > +
> > diff --git a/meta/recipes-kernel/kexec/kexec-tools/riscv64-support.patc=
h
> b/meta/recipes-kernel/kexec/kexec-tools/riscv64-support.patch
> > new file mode 100644
> > index 0000000000..74f06d3be0
> > --- /dev/null
> > +++ b/meta/recipes-kernel/kexec/kexec-tools/riscv64-support.patch
> > @@ -0,0 +1,1469 @@
> > +From 379d8f3ef3219bd400c7893d0a262b079c1de408 Mon Sep 17 00:00:00 2001
> > +From: Nick Kossifidis <mick@ics.forth.gr>
> > +Date: Tue, 5 Oct 2021 15:01:19 +0300
> > +Subject: [PATCH] RISC-V: Add support for riscv kexec/kdump on
> kexec-tools
> > +
> > +This patch adds support for loading the ELF kernel image. It parses
> > +the current/provided device tree to determine the system's memory
> > +layout, and /proc/iomem for the various kernel segments.
> > +
> > +See
> https://github.com/riscv-collab/kexec-tools/commit/379d8f3ef3219bd400c789=
3d0a262b079c1de408
> > +
> > +Tested on Qemu's rv64 virt machine.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + configure.ac                            |   3 +
> > + include/elf.h                           |   3 +-
> > + kexec/Makefile                          |   1 +
> > + kexec/arch/riscv/Makefile               |  35 ++
> > + kexec/arch/riscv/crashdump-riscv.c      | 140 ++++++++
> > + kexec/arch/riscv/include/arch/options.h |  43 +++
> > + kexec/arch/riscv/kexec-elf-riscv.c      | 255 ++++++++++++++
> > + kexec/arch/riscv/kexec-riscv.c          | 364 +++++++++++++++++++
> > + kexec/arch/riscv/kexec-riscv.h          |  32 ++
> > + kexec/dt-ops.c                          | 442 +++++++++++++++++++++++=
-
> > + kexec/dt-ops.h                          |   7 +
> > + kexec/kexec-syscall.h                   |   4 +
> > + purgatory/Makefile                      |   1 +
> > + purgatory/arch/riscv/Makefile           |   7 +
> > + 14 files changed, 1335 insertions(+), 2 deletions(-)
> > + create mode 100644 kexec/arch/riscv/Makefile
> > + create mode 100644 kexec/arch/riscv/crashdump-riscv.c
> > + create mode 100644 kexec/arch/riscv/include/arch/options.h
> > + create mode 100644 kexec/arch/riscv/kexec-elf-riscv.c
> > + create mode 100644 kexec/arch/riscv/kexec-riscv.c
> > + create mode 100644 kexec/arch/riscv/kexec-riscv.h
> > + create mode 100644 purgatory/arch/riscv/Makefile
> > +
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -61,6 +61,9 @@ case $target_cpu in
> > +       loongarch*)
> > +               ARCH=3D"loongarch"
> > +               ;;
> > ++      riscv32|riscv64 )
> > ++              ARCH=3D"riscv"
> > ++              ;;
> > +       * )
> > +               AC_MSG_ERROR([unsupported architecture $target_cpu])
> > +               ;;
> > +--- a/include/elf.h
> > ++++ b/include/elf.h
> > +@@ -259,6 +259,7 @@ typedef struct
> > + #define EM_ARC_A5     93              /* ARC Cores Tangent-A5 */
> > + #define EM_XTENSA     94              /* Tensilica Xtensa Architectur=
e
> */
> > + #define EM_AARCH64    183             /* ARM AARCH64 */
> > ++#define EM_RISCV      243             /* RISC-V */
> > + #define EM_LOONGARCH  258             /* Loongson Loongarch*/
> > + #define EM_NUM                184
> > +
> > +--- a/kexec/Makefile
> > ++++ b/kexec/Makefile
> > +@@ -92,6 +92,7 @@ include $(srcdir)/kexec/arch/mips/Makefi
> > + include $(srcdir)/kexec/arch/cris/Makefile
> > + include $(srcdir)/kexec/arch/ppc/Makefile
> > + include $(srcdir)/kexec/arch/ppc64/Makefile
> > ++include $(srcdir)/kexec/arch/riscv/Makefile
> > + include $(srcdir)/kexec/arch/s390/Makefile
> > + include $(srcdir)/kexec/arch/sh/Makefile
> > + include $(srcdir)/kexec/arch/x86_64/Makefile
> > +--- /dev/null
> > ++++ b/kexec/arch/riscv/Makefile
> > +@@ -0,0 +1,35 @@
> > ++#
> > ++# kexec riscv
> > ++#
> > ++riscv_KEXEC_SRCS =3D  kexec/arch/riscv/kexec-riscv.c
> > ++riscv_KEXEC_SRCS +=3D kexec/arch/riscv/kexec-elf-riscv.c
> > ++riscv_KEXEC_SRCS +=3D kexec/arch/riscv/crashdump-riscv.c
> > ++
> > ++riscv_MEM_REGIONS =3D kexec/mem_regions.c
> > ++
> > ++riscv_DT_OPS +=3D kexec/dt-ops.c
> > ++
> > ++riscv_ARCH_REUSE_INITRD =3D
> > ++
> > ++riscv_CPPFLAGS +=3D -I $(srcdir)/kexec/
> > ++
> > ++dist +=3D kexec/arch/riscv/Makefile $(riscv_KEXEC_SRCS)              =
   \
> > ++      kexec/arch/riscv/kexec-riscv.h                                 =
 \
> > ++      kexec/arch/riscv/include/arch/options.h
> > ++
> > ++ifdef HAVE_LIBFDT
> > ++
> > ++LIBS +=3D -lfdt
> > ++
> > ++else
> > ++
> > ++include $(srcdir)/kexec/libfdt/Makefile.libfdt
> > ++
> > ++libfdt_SRCS +=3D $(LIBFDT_SRCS:%=3Dkexec/libfdt/%)
> > ++
> > ++riscv_CPPFLAGS +=3D -I$(srcdir)/kexec/libfdt
> > ++
> > ++riscv_KEXEC_SRCS +=3D $(libfdt_SRCS)
> > ++
> > ++endif
> > ++
> > +--- /dev/null
> > ++++ b/kexec/arch/riscv/crashdump-riscv.c
> > +@@ -0,0 +1,140 @@
> > ++#include <errno.h>
> > ++#include <linux/elf.h>
> > ++#include <unistd.h>
> > ++
> > ++#include "kexec.h"
> > ++#include "crashdump.h"
> > ++#include "kexec-elf.h"
> > ++#include "mem_regions.h"
> > ++
> > ++static struct crash_elf_info elf_info =3D {
> > ++#if __riscv_xlen =3D=3D 64
> > ++      .class          =3D ELFCLASS64,
> > ++#else
> > ++      .class          =3D ELFCLASS32,
> > ++#endif
> > ++      .data           =3D ELFDATA2LSB,
> > ++      .machine        =3D EM_RISCV,
> > ++};
> > ++
> > ++static struct memory_ranges crash_mem_ranges =3D {0};
> > ++struct memory_range elfcorehdr_mem =3D {0};
> > ++
> > ++static unsigned long long get_page_offset(struct kexec_info *info)
> > ++{
> > ++      unsigned long long vaddr_off =3D 0;
> > ++      unsigned long long page_size =3D sysconf(_SC_PAGESIZE);
> > ++      unsigned long long init_start =3D get_kernel_sym("_sinittext");
> > ++
> > ++      /*
> > ++       * Begining of init section is aligned to page size
> > ++       */
> > ++      vaddr_off =3D init_start - page_size;
> > ++
> > ++      return vaddr_off;
> > ++}
> > ++
> > ++int load_elfcorehdr(struct kexec_info *info)
> > ++{
> > ++      struct memory_range crashkern_range =3D {0};
> > ++      struct memory_range *ranges =3D NULL;
> > ++      unsigned long start =3D 0;
> > ++      unsigned long end =3D 0;
> > ++      unsigned long buf_size =3D 0;
> > ++      unsigned long elfcorehdr_addr =3D 0;
> > ++      void* buf =3D NULL;
> > ++      int i =3D 0;
> > ++      int ret =3D 0;
> > ++
> > ++      ret =3D parse_iomem_single("Kernel code\n", &start, NULL);
> > ++      if (ret) {
> > ++              fprintf(stderr, "Cannot determine kernel physical base
> addr\n");
> > ++              return -EINVAL;
> > ++      }
> > ++      elf_info.kern_paddr_start =3D start;
> > ++
> > ++      ret =3D parse_iomem_single("Kernel bss\n", NULL, &end);
> > ++      if (ret) {
> > ++              fprintf(stderr, "Cannot determine kernel physical bss
> addr\n");
> > ++              return -EINVAL;
> > ++      }
> > ++      elf_info.kern_paddr_start =3D start;
> > ++      elf_info.kern_size =3D end - start;
> > ++
> > ++      elf_info.kern_vaddr_start =3D get_kernel_sym("_text");
> > ++      if (!elf_info.kern_vaddr_start) {
> > ++              elf_info.kern_vaddr_start =3D UINT64_MAX;
> > ++      }
> > ++
> > ++      elf_info.page_offset =3D get_page_offset(info);
> > ++      dbgprintf("page_offset:   %016llx\n", elf_info.page_offset);
> > ++
> > ++      ret =3D parse_iomem_single("Crash kernel\n", &start, &end);
> > ++      if (ret) {
> > ++              fprintf(stderr, "Cannot determine kernel physical bss
> addr\n");
> > ++              return -EINVAL;
> > ++      }
> > ++      crashkern_range.start =3D start;
> > ++      crashkern_range.end =3D end;
> > ++      crashkern_range.type =3D RANGE_RESERVED;
> > ++
> > ++      ranges =3D info->memory_range;
> > ++      for (i =3D 0; i < info->memory_ranges; i++) {
> > ++              ret =3D mem_regions_alloc_and_add(&crash_mem_ranges,
> > ++                                              ranges[i].start,
> > ++                                              ranges[i].end -
> ranges[i].start,
> > ++                                              ranges[i].type);
> > ++              if (ret ) {
> > ++                      fprintf(stderr, "Could not create
> crash_mem_ranges\n");
> > ++                      return ret;
> > ++              }
> > ++      }
> > ++
> > ++      ret =3D mem_regions_alloc_and_exclude(&crash_mem_ranges,
> > ++                                          &crashkern_range);
> > ++      if (ret) {
> > ++              fprintf(stderr, "Could not exclude crashkern_range\n");
> > ++              return ret;
> > ++      }
> > ++
> > ++#if __riscv_xlen =3D=3D 64
> > ++      crash_create_elf64_headers(info, &elf_info,
> crash_mem_ranges.ranges,
> > ++                                 crash_mem_ranges.size, &buf,
> &buf_size,
> > ++                                 ELF_CORE_HEADER_ALIGN);
> > ++
> > ++#else
> > ++      crash_create_elf32_headers(info, &elf_info,
> crash_mem_ranges.ranges,
> > ++                                 crash_mem_ranges.size, &buf,
> &buf_size,
> > ++                                 ELF_CORE_HEADER_ALIGN);
> > ++#endif
> > ++
> > ++
> > ++      elfcorehdr_addr =3D add_buffer_phys_virt(info, buf, buf_size,
> > ++                                             buf_size, 0,
> > ++                                             crashkern_range.start,
> > ++                                             crashkern_range.end,
> > ++                                             -1, 0);
> > ++
> > ++      elfcorehdr_mem.start =3D elfcorehdr_addr;
> > ++      elfcorehdr_mem.end =3D elfcorehdr_addr + buf_size - 1;
> > ++
> > ++      dbgprintf("%s: elfcorehdr 0x%llx-0x%llx\n", __func__,
> > ++                elfcorehdr_mem.start, elfcorehdr_mem.end);
> > ++
> > ++      return 0;
> > ++}
> > ++
> > ++int is_crashkernel_mem_reserved(void)
> > ++{
> > ++      uint64_t start =3D 0;
> > ++      uint64_t end =3D 0;
> > ++
> > ++      return parse_iomem_single("Crash kernel\n", &start, &end) =3D=
=3D 0 ?
> > ++             (start !=3D end) : 0;
> > ++}
> > ++
> > ++int get_crash_kernel_load_range(uint64_t *start, uint64_t *end)
> > ++{
> > ++      return parse_iomem_single("Crash kernel\n", start, end);
> > ++}
> > ++
> > +--- /dev/null
> > ++++ b/kexec/arch/riscv/include/arch/options.h
> > +@@ -0,0 +1,43 @@
> > ++#ifndef KEXEC_ARCH_RISCV_OPTIONS_H
> > ++#define KEXEC_ARCH_RISCV_OPTIONS_H
> > ++
> > ++#define OPT_APPEND            ((OPT_MAX)+0)
> > ++#define OPT_DTB                       ((OPT_MAX)+1)
> > ++#define OPT_INITRD            ((OPT_MAX)+2)
> > ++#define OPT_CMDLINE           ((OPT_MAX)+3)
> > ++#define OPT_REUSE_CMDLINE     ((OPT_MAX)+4)
> > ++#define OPT_ARCH_MAX          ((OPT_MAX)+5)
> > ++
> > ++/* Options relevant to the architecture (excluding loader-specific
> ones),
> > ++ * in this case none:
> > ++ */
> > ++#define KEXEC_ARCH_OPTIONS \
> > ++      KEXEC_OPTIONS \
> > ++      { "append",             1, 0, OPT_APPEND}, \
> > ++      { "dtb",                1, 0, OPT_DTB }, \
> > ++      { "initrd",             1, 0, OPT_INITRD }, \
> > ++      { "command-line",       1, 0, OPT_CMDLINE}, \
> > ++      { "reuse-cmdline",      0, NULL, OPT_REUSE_CMDLINE }, \
> > ++
> > ++
> > ++#define KEXEC_ARCH_OPT_STR KEXEC_OPT_STR ""
> > ++
> > ++/* The following two #defines list ALL of the options added by all of
> the
> > ++ * architecture's loaders.
> > ++ * o  main() uses this complete list to scan for its options, ignorin=
g
> > ++ *    arch-specific/loader-specific ones.
> > ++ * o  Then, arch_process_options() uses this complete list to scan fo=
r
> its
> > ++ *    options, ignoring general/loader-specific ones.
> > ++ * o  Then, the file_type[n].load re-scans for options, using
> > ++ *    KEXEC_ARCH_OPTIONS plus its loader-specific options subset.
> > ++ *    Any unrecognised options cause an error here.
> > ++ *
> > ++ * This is done so that main()'s/arch_process_options()'s
> getopt_long() calls
> > ++ * don't choose a kernel filename from random arguments to options
> they don't
> > ++ * recognise -- as they now recognise (if not act upon) all possible
> options.
> > ++ */
> > ++#define KEXEC_ALL_OPTIONS KEXEC_ARCH_OPTIONS
> > ++
> > ++#define KEXEC_ALL_OPT_STR KEXEC_ARCH_OPT_STR
> > ++
> > ++#endif /* KEXEC_ARCH_RISCV_OPTIONS_H */
> > +--- /dev/null
> > ++++ b/kexec/arch/riscv/kexec-elf-riscv.c
> > +@@ -0,0 +1,255 @@
> > ++/* SPDX-License-Identifier: GPL-2.0 */
> > ++/*
> > ++ * Copyright (C) 2019 FORTH-ICS/CARV
> > ++ *              Nick Kossifidis <mick@ics.forth.gr>
> > ++ */
> > ++
> > ++#include "kexec.h"
> > ++#include "dt-ops.h"           /* For dtb_set/clear_initrd() */
> > ++#include <elf.h>              /* For ELF header handling */
> > ++#include <errno.h>            /* For EFBIG/EINVAL */
> > ++#include <unistd.h>           /* For getpagesize() */
> > ++#include "kexec-syscall.h"    /* For KEXEC_ON_CRASH */
> > ++#include "kexec-riscv.h"
> > ++
> > ++
> > ++/*********\
> > ++* HELPERS *
> > ++\*********/
> > ++
> > ++/*
> > ++ * Go through the available physical memory regions and
> > ++ * find one that can hold an image of the specified size.
> > ++ * Note: This is called after get_memory_ranges so
> > ++ * info->memory_range[] should be populated. Also note that
> > ++ * memory ranges are sorted, so we'll return the first region
> > ++ * that's big enough for holding the image.
> > ++ */
> > ++static int elf_riscv_find_pbase(struct kexec_info *info, off_t *addr,
> > ++                              off_t size)
> > ++{
> > ++      int i =3D 0;
> > ++      off_t start =3D 0;
> > ++      off_t end =3D 0;
> > ++      int ret =3D 0;
> > ++
> > ++      /*
> > ++       * If this image is for a crash kernel, use the region
> > ++       * the primary kernel has already reserved for us.
> > ++       */
> > ++      if (info->kexec_flags & KEXEC_ON_CRASH) {
> > ++              ret =3D get_crash_kernel_load_range((uint64_t *) &start=
,
> > ++                                                (uint64_t *) &end);
> > ++              if (!ret) {
> > ++                      /*
> > ++                       * Kernel should be aligned to the nearest
> > ++                       * hugepage (2MB for RV64, 4MB for RV32).
> > ++                       */
> > ++#if __riscv_xlen =3D=3D 64
> > ++                      start =3D _ALIGN_UP(start, 0x200000);
> > ++#else
> > ++                      start =3D _ALIGN_UP(start, 0x400000);
> > ++#endif
> > ++                      if (end > start && ((end - start) >=3D size)) {
> > ++                              *addr =3D start;
> > ++                              return 0;
> > ++                      }
> > ++
> > ++                      return -EFBIG;
> > ++              } else
> > ++                      return ENOCRASHKERNEL;
> > ++      }
> > ++
> > ++      for (i =3D 0; i < info->memory_ranges; i++) {
> > ++              if (info->memory_range[i].type !=3D RANGE_RAM)
> > ++                      continue;
> > ++
> > ++              start =3D info->memory_range[i].start;
> > ++              end =3D info->memory_range[i].end;
> > ++
> > ++#if __riscv_xlen =3D=3D 64
> > ++              start =3D _ALIGN_UP(start, 0x200000);
> > ++#else
> > ++              start =3D _ALIGN_UP(start, 0x400000);
> > ++#endif
> > ++
> > ++              if (end > start && ((end - start) >=3D size)) {
> > ++                      *addr =3D start;
> > ++                      return 0;
> > ++              }
> > ++      }
> > ++
> > ++      return -EFBIG;
> > ++}
> > ++
> > ++/**************\
> > ++* ENTRY POINTS *
> > ++\**************/
> > ++
> > ++int elf_riscv_probe(const char *buf, off_t len)
> > ++{
> > ++      struct mem_ehdr ehdr =3D {0};
> > ++      int ret =3D 0;
> > ++
> > ++      ret =3D build_elf_exec_info(buf, len, &ehdr, 0);
> > ++      if (ret < 0)
> > ++              goto cleanup;
> > ++
> > ++      if (ehdr.e_machine !=3D EM_RISCV) {
> > ++              fprintf(stderr, "Not for this architecture.\n");
> > ++              ret =3D -EINVAL;
> > ++              goto cleanup;
> > ++      }
> > ++
> > ++      ret =3D 0;
> > ++
> > ++ cleanup:
> > ++      free_elf_info(&ehdr);
> > ++      return ret;
> > ++}
> > ++
> > ++void elf_riscv_usage(void)
> > ++{
> > ++}
> > ++
> > ++int elf_riscv_load(int argc, char **argv, const char *buf, off_t len,
> > ++                 struct kexec_info *info)
> > ++{
> > ++      struct mem_ehdr ehdr =3D {0};
> > ++      struct mem_phdr *phdr =3D NULL;
> > ++      off_t new_base_addr =3D 0;
> > ++      off_t kernel_size =3D 0;
> > ++      off_t page_size =3D getpagesize();
> > ++      off_t max_addr =3D 0;
> > ++      off_t old_base_addr =3D 0;
> > ++      off_t old_start_addr =3D 0;
> > ++      int i =3D 0;
> > ++      int ret =3D 0;
> > ++
> > ++      if (info->file_mode) {
> > ++              fprintf(stderr, "kexec_file not supported on this "
> > ++                              "architecture\n");
> > ++              return -EINVAL;
> > ++      }
> > ++
> > ++      /* Parse the ELF file */
> > ++      ret =3D build_elf_exec_info(buf, len, &ehdr, 0);
> > ++      if (ret < 0) {
> > ++              fprintf(stderr, "ELF exec parse failed\n");
> > ++              return -EINVAL;
> > ++      }
> > ++
> > ++      max_addr =3D elf_max_addr(&ehdr);
> > ++      old_base_addr =3D max_addr;
> > ++      old_start_addr =3D max_addr;
> > ++
> > ++      /*
> > ++       * Get the memory footprint, base physical
> > ++       * and start address of the ELF image
> > ++       */
> > ++      for (i =3D 0; i < ehdr.e_phnum; i++) {
> > ++              phdr =3D &ehdr.e_phdr[i];
> > ++              if (phdr->p_type !=3D PT_LOAD)
> > ++                      continue;
> > ++
> > ++              /*
> > ++               * Note: According to ELF spec the loadable regions
> > ++               * are sorted on p_vaddr, not p_paddr.
> > ++               */
> > ++              if (old_base_addr > phdr->p_paddr)
> > ++                      old_base_addr =3D phdr->p_paddr;
> > ++
> > ++              if (phdr->p_vaddr =3D=3D ehdr.e_entry ||
> > ++                  phdr->p_paddr =3D=3D ehdr.e_entry)
> > ++                      old_start_addr =3D phdr->p_paddr;
> > ++
> > ++              kernel_size +=3D _ALIGN_UP(phdr->p_memsz, page_size);
> > ++      }
> > ++
> > ++      if (old_base_addr =3D=3D max_addr || kernel_size =3D=3D 0) {
> > ++              fprintf(stderr, "No loadable segments present on the "
> > ++                              "provided ELF image\n");
> > ++              return -EINVAL;
> > ++      }
> > ++
> > ++      if (old_start_addr =3D=3D max_addr) {
> > ++              fprintf(stderr, "Could not find the entry point address
> of "
> > ++                              "provided ELF image\n");
> > ++              return -EINVAL;
> > ++      }
> > ++
> > ++      dbgprintf("Got ELF with total memsz %luKB\n"
> > ++                "Base paddr: 0x%lX, start_addr: 0x%lX\n",
> > ++                kernel_size / 1024, old_base_addr, old_start_addr);
> > ++
> > ++      /* Get a continuous physical region that can hold the kernel */
> > ++      ret =3D elf_riscv_find_pbase(info, &new_base_addr, kernel_size)=
;
> > ++      if (ret < 0) {
> > ++              fprintf(stderr, "Could not find a memory region for the=
 "
> > ++                              "provided ELF image\n");
> > ++              return ret;
> > ++      }
> > ++
> > ++      dbgprintf("New base paddr for the ELF: 0x%lX\n", new_base_addr)=
;
> > ++
> > ++      /* Re-set the base physical address of the ELF */
> > ++      for (i =3D 0; i < ehdr.e_phnum; i++) {
> > ++              phdr =3D &ehdr.e_phdr[i];
> > ++              if (phdr->p_type !=3D PT_LOAD)
> > ++                      continue;
> > ++
> > ++              phdr->p_paddr -=3D old_base_addr;
> > ++              phdr->p_paddr +=3D new_base_addr;
> > ++      }
> > ++
> > ++      /* Re-set the entry point address */
> > ++      ehdr.e_entry =3D (old_start_addr - old_base_addr) + new_base_ad=
dr;
> > ++      info->entry =3D (void *) ehdr.e_entry;
> > ++      dbgprintf("New entry point for the ELF: 0x%llX\n", ehdr.e_entry=
);
> > ++
> > ++
> > ++      /* Load the ELF executable */
> > ++      ret =3D elf_exec_load(&ehdr, info);
> > ++      if (ret < 0) {
> > ++              fprintf(stderr, "ELF exec load failed\n");
> > ++              return ret;
> > ++      }
> > ++
> > ++      ret =3D load_extra_segments(info, new_base_addr,
> > ++                                kernel_size, max_addr);
> > ++      return ret;
> > ++}
> > ++
> > ++
> > ++/*******\
> > ++* STUBS *
> > ++\*******/
> > ++
> > ++int machine_verify_elf_rel(struct mem_ehdr *ehdr)
> > ++{
> > ++      if (ehdr->ei_data !=3D ELFDATA2LSB)
> > ++              return 0;
> > ++#if __riscv_xlen =3D=3D 64
> > ++      if (ehdr->ei_class !=3D ELFCLASS64)
> > ++#else
> > ++      if (ehdr->ei_class !=3D ELFCLASS32)
> > ++#endif
> > ++              return 0;
> > ++      if (ehdr->e_machine !=3D EM_RISCV)
> > ++              return 0;
> > ++      return 1;
> > ++}
> > ++
> > ++void machine_apply_elf_rel(struct mem_ehdr *UNUSED(ehdr),
> > ++                         struct mem_sym *UNUSED(sym),
> > ++                         unsigned long r_type,
> > ++                         void *UNUSED(location),
> > ++                         unsigned long UNUSED(address),
> > ++                         unsigned long UNUSED(value))
> > ++{
> > ++      switch (r_type) {
> > ++      default:
> > ++              die("Unknown rela relocation: %lu\n", r_type);
> > ++              break;
> > ++      }
> > ++}
> > +--- /dev/null
> > ++++ b/kexec/arch/riscv/kexec-riscv.c
> > +@@ -0,0 +1,364 @@
> > ++/* SPDX-License-Identifier: GPL-2.0 */
> > ++/*
> > ++ * Copyright (C) 2019 FORTH-ICS/CARV
> > ++ *              Nick Kossifidis <mick@ics.forth.gr>
> > ++ */
> > ++
> > ++#include "kexec-syscall.h"    /* For KEXEC_ARCH_RISCV */
> > ++#include "kexec.h"            /* For OPT_MAX and concat_cmdline() */
> > ++#include "mem_regions.h"      /* For mem_regions_sort() */
> > ++#include "dt-ops.h"           /* For dtb_set_bootargs() */
> > ++#include <arch/options.h>     /* For KEXEC_ARCH_OPTIONS */
> > ++#include <getopt.h>           /* For struct option */
> > ++#include <sys/stat.h>         /* For stat() and struct stat */
> > ++#include <stdlib.h>           /* For free() */
> > ++#include <errno.h>            /* For EINVAL */
> > ++#include <libfdt.h>           /* For DeviceTree handling */
> > ++#include "kexec-riscv.h"
> > ++
> > ++const struct arch_map_entry arches[] =3D {
> > ++      { "riscv32", KEXEC_ARCH_RISCV },
> > ++      { "riscv64", KEXEC_ARCH_RISCV },
> > ++      { NULL, 0 },
> > ++};
> > ++
> > ++
> > ++struct file_type file_type[] =3D {
> > ++      {"elf-riscv", elf_riscv_probe, elf_riscv_load, elf_riscv_usage}=
,
> > ++};
> > ++int file_types =3D sizeof(file_type) / sizeof(file_type[0]);
> > ++
> > ++static const char riscv_opts_usage[] =3D
> > ++"     --append=3DSTRING         Append STRING to the kernel command
> line.\n"
> > ++"     --dtb=3DFILE              Use FILE as the device tree blob.\n"
> > ++"     --initrd=3DFILE           Use FILE as the kernel initial
> ramdisk.\n"
> > ++"     --cmdline=3DSTRING        Use STRING as the kernel's command
> line.\n"
> > ++"     --reuse-cmdline         Use kernel command line from running
> system.\n";
> > ++
> > ++static struct riscv_opts arch_options =3D {0};
> > ++static struct fdt_image provided_fdt =3D {0};
> > ++static struct memory_ranges sysmem_ranges =3D {0};
> > ++
> > ++/****************\
> > ++* COMMON HELPERS *
> > ++\****************/
> > ++
> > ++int load_extra_segments(struct kexec_info *info, uint64_t kernel_base=
,
> > ++                      uint64_t kernel_size, uint64_t max_addr)
> > ++{
> > ++      struct fdt_image *fdt =3D arch_options.fdt;
> > ++      char *initrd_buf =3D NULL;
> > ++      off_t initrd_size =3D 0;
> > ++      uint64_t initrd_base =3D 0;
> > ++      uint64_t start =3D 0;
> > ++      uint64_t end =3D 0;
> > ++      uint64_t min_usable =3D kernel_base + kernel_size;
> > ++      uint64_t max_usable =3D max_addr;
> > ++      int ret =3D 0;
> > ++
> > ++      /* Prepare the device tree */
> > ++      if (info->kexec_flags & KEXEC_ON_CRASH) {
> > ++              ret =3D load_elfcorehdr(info);
> > ++              if (ret) {
> > ++                      fprintf(stderr, "Couldn't create elfcorehdr\n")=
;
> > ++                      return ret;
> > ++              }
> > ++
> > ++              ret =3D dtb_add_range_property(&fdt->buf, &fdt->size,
> > ++                                           elfcorehdr_mem.start,
> elfcorehdr_mem.end,
> > ++                                           "chosen",
> "linux,elfcorehdr");
> > ++              if (ret) {
> > ++                      fprintf(stderr, "Couldn't add elfcorehdr to
> fdt\n");
> > ++                      return ret;
> > ++              }
> > ++
> > ++              ret =3D get_crash_kernel_load_range(&start, &end);
> > ++              if (ret) {
> > ++                      fprintf(stderr, "Couldn't get crashkenel
> region\n");
> > ++                      return ret;
> > ++              }
> > ++
> > ++              ret =3D dtb_add_range_property(&fdt->buf, &fdt->size,
> start, end,
> > ++                                           "memory",
> "linux,usable-memory");
> > ++              if (ret) {
> > ++                      fprintf(stderr, "Couldn't add usable-memory to
> fdt\n");
> > ++                      return ret;
> > ++              }
> > ++
> > ++              max_usable =3D end;
> > ++      } else {
> > ++              /*
> > ++               * Make sure we remove elfcorehdr and usable-memory
> > ++               * when switching from crash kernel to a normal one.
> > ++               */
> > ++              dtb_delete_property(fdt->buf, "chosen",
> "linux,elfcorehdr");
> > ++              dtb_delete_property(fdt->buf, "memory",
> "linux,usable-memory");
> > ++      }
> > ++
> > ++      /* Do we need to include an initrd image ? */
> > ++      if (!arch_options.initrd_path && !arch_options.initrd_end)
> > ++              dtb_clear_initrd(&fdt->buf, &fdt->size);
> > ++      else if (arch_options.initrd_path) {
> > ++              if (arch_options.initrd_end)
> > ++                      fprintf(stderr, "Warning: An initrd image was
> provided"
> > ++                                      ", will ignore reuseinitrd\n");
> > ++
> > ++              initrd_buf =3D slurp_file(arch_options.initrd_path,
> > ++                                      &initrd_size);
> > ++              if (!initrd_buf) {
> > ++                      fprintf(stderr, "Couldn't read provided
> initrd\n");
> > ++                      return -EINVAL;
> > ++              }
> > ++
> > ++              initrd_base =3D add_buffer_phys_virt(info, initrd_buf,
> > ++                                                 initrd_size,
> > ++                                                 initrd_size, 0,
> > ++                                                 min_usable,
> > ++                                                 max_usable, -1, 0);
> > ++
> > ++              dtb_set_initrd(&fdt->buf, &fdt->size, initrd_base,
> > ++                             initrd_base + initrd_size);
> > ++
> > ++              dbgprintf("Base addr for initrd image: 0x%lX\n",
> initrd_base);
> > ++              min_usable =3D initrd_base;
> > ++      }
> > ++
> > ++      /* Add device tree */
> > ++      add_buffer_phys_virt(info, fdt->buf, fdt->size, fdt->size, 0,
> > ++                           min_usable, max_usable, -1, 0);
> > ++
> > ++      return 0;
> > ++}
> > ++
> > ++
> > ++/**************\
> > ++* ENTRY POINTS *
> > ++\**************/
> > ++
> > ++void arch_usage(void)
> > ++{
> > ++      printf(riscv_opts_usage);
> > ++}
> > ++
> > ++int arch_process_options(int argc, char **argv)
> > ++{
> > ++      static const struct option options[] =3D {
> > ++              KEXEC_ARCH_OPTIONS
> > ++              { 0 },
> > ++      };
> > ++      static const char short_options[] =3D KEXEC_ARCH_OPT_STR;
> > ++      struct stat st =3D {0};
> > ++      char *append =3D NULL;
> > ++      char *cmdline =3D NULL;
> > ++      void *tmp =3D NULL;
> > ++      off_t tmp_size =3D 0;
> > ++      int opt =3D 0;
> > ++      int ret =3D 0;
> > ++
> > ++      while ((opt =3D getopt_long(argc, argv, short_options,
> > ++                                options, 0)) !=3D -1) {
> > ++              switch (opt) {
> > ++              case OPT_APPEND:
> > ++                      append =3D optarg;
> > ++                      break;
> > ++              case OPT_CMDLINE:
> > ++                      if (cmdline)
> > ++                              fprintf(stderr,
> > ++                                      "Warning: Kernel's cmdline "
> > ++                                      "set twice !\n");
> > ++                      cmdline =3D optarg;
> > ++                      break;
> > ++              case OPT_REUSE_CMDLINE:
> > ++                      if (cmdline)
> > ++                              fprintf(stderr,
> > ++                                      "Warning: Kernel's cmdline "
> > ++                                      "set twice !\n");
> > ++                      cmdline =3D get_command_line();
> > ++                      break;
> > ++              case OPT_DTB:
> > ++                      ret =3D stat(optarg, &st);
> > ++                      if (ret) {
> > ++                              fprintf(stderr,
> > ++                                      "Could not find the provided dt=
b
> !\n");
> > ++                              return -EINVAL;
> > ++                      }
> > ++                      arch_options.fdt_path =3D optarg;
> > ++                      break;
> > ++              case OPT_INITRD:
> > ++                      ret =3D stat(optarg, &st);
> > ++                      if (ret) {
> > ++                              fprintf(stderr,
> > ++                                      "Could not find the provided "
> > ++                                      "initrd image !\n");
> > ++                              return -EINVAL;
> > ++                      }
> > ++                      arch_options.initrd_path =3D optarg;
> > ++                      break;
> > ++              default:
> > ++                      break;
> > ++              }
> > ++      }
> > ++
> > ++      /* Handle Kernel's command line */
> > ++      if (append && !cmdline)
> > ++              fprintf(stderr, "Warning: No cmdline provided, "
> > ++                              "using append string as cmdline\n");
> > ++      if (!append && !cmdline)
> > ++              fprintf(stderr, "Warning: No cmdline or append string "
> > ++                              "provided\n");
> > ++
> > ++      if (append || cmdline)
> > ++              /*
> > ++               * Note that this also handles the case where "cmdline"
> > ++               * or "append" is NULL.
> > ++               */
> > ++              arch_options.cmdline =3D concat_cmdline(cmdline, append=
);
> > ++
> > ++      /* Handle FDT image */
> > ++      if (!arch_options.fdt_path) {
> > ++              ret =3D stat("/sys/firmware/fdt", &st);
> > ++              if (ret) {
> > ++                      fprintf(stderr, "No dtb provided and "
> > ++                                      "/sys/firmware/fdt is not
> present\n");
> > ++                      return -EINVAL;
> > ++              }
> > ++              fprintf(stderr, "Warning: No dtb provided, "
> > ++                              "using /sys/firmware/fdt\n");
> > ++              arch_options.fdt_path =3D "/sys/firmware/fdt";
> > ++      }
> > ++
> > ++      tmp =3D slurp_file(arch_options.fdt_path, &tmp_size);
> > ++      if (!tmp) {
> > ++              fprintf(stderr, "Couldn't read provided fdt\n");
> > ++              return -EINVAL;
> > ++      }
> > ++
> > ++      ret =3D fdt_check_header(tmp);
> > ++      if (ret) {
> > ++              fprintf(stderr, "Got an ivalid fdt image !\n");
> > ++              free(tmp);
> > ++              return -EINVAL;
> > ++      }
> > ++      provided_fdt.buf =3D tmp;
> > ++      provided_fdt.size =3D tmp_size;
> > ++
> > ++      if (arch_options.cmdline) {
> > ++              ret =3D dtb_set_bootargs(&provided_fdt.buf,
> &provided_fdt.size,
> > ++                                     arch_options.cmdline);
> > ++              if (ret < 0) {
> > ++                      fprintf(stderr, "Could not set bootargs on "
> > ++                                      "the fdt image\n");
> > ++                      return ret;
> > ++              }
> > ++      }
> > ++
> > ++      arch_options.fdt =3D &provided_fdt;
> > ++
> > ++      return 0;
> > ++}
> > ++
> > ++/*
> > ++ * This one is called after arch_process_options so we already
> > ++ * have an fdt image in place.
> > ++ */
> > ++void arch_reuse_initrd(void)
> > ++{
> > ++      const uint32_t *prop32 =3D NULL;
> > ++      uint32_t addr_cells =3D 0;
> > ++      const void *prop =3D 0;
> > ++      int prop_size =3D 0;
> > ++      uint64_t initrd_start =3D 0;
> > ++      uint64_t initrd_end =3D 0;
> > ++      int chosen_offset =3D 0;
> > ++      struct fdt_image *fdt =3D &provided_fdt;
> > ++
> > ++      chosen_offset =3D fdt_subnode_offset(fdt->buf, 0, "chosen");
> > ++      if (chosen_offset < 0) {
> > ++              fprintf(stderr, "No /chosen node found on fdt image "
> > ++                              "unable to reuse initrd\n");
> > ++              return;
> > ++      }
> > ++
> > ++      prop32 =3D fdt_getprop(fdt->buf, 0, "#address-cells", NULL);
> > ++      if (!prop32) {
> > ++              fprintf(stderr, "No #address-cells property on root
> node\n");
> > ++              return;
> > ++      }
> > ++      addr_cells =3D be32_to_cpu(*prop32);
> > ++
> > ++      prop =3D fdt_getprop(fdt->buf, chosen_offset,
> > ++                         "linux,initrd-start", &prop_size);
> > ++      if (!prop) {
> > ++              fprintf(stderr, "Could not get linux,initrd-start\n");
> > ++              return;
> > ++      }
> > ++      dtb_extract_int_property(&initrd_start, prop, addr_cells);
> > ++
> > ++      prop =3D fdt_getprop(fdt->buf, chosen_offset,
> > ++                         "linux,initrd-end", &prop_size);
> > ++      if (!prop) {
> > ++              fprintf(stderr, "Could not get linux,initrd-end\n");
> > ++              return;
> > ++      }
> > ++      dtb_extract_int_property(&initrd_end, prop, addr_cells);
> > ++
> > ++      arch_options.initrd_start =3D initrd_start;
> > ++      arch_options.initrd_end =3D initrd_end;
> > ++      dbgprintf("initrd_start: 0x%lX, initrd_end: 0x%lX\n",
> > ++                initrd_start, initrd_end);
> > ++
> > ++}
> > ++
> > ++int get_memory_ranges(struct memory_range **range, int *num_ranges,
> > ++                    unsigned long kexec_flags)
> > ++{
> > ++      const struct fdt_image *fdt =3D &provided_fdt;
> > ++      struct memory_ranges *extra_ranges =3D NULL;
> > ++      int i =3D 0;
> > ++      int ret =3D 0;
> > ++
> > ++      if (arch_options.initrd_start && arch_options.initrd_end) {
> > ++              int initrd_size =3D arch_options.initrd_end -
> arch_options.initrd_start;
> > ++              dbgprintf("Marking current intird image as reserved\n")=
;
> > ++              ret =3D mem_regions_alloc_and_add(extra_ranges,
> > ++
> arch_options.initrd_start,
> > ++                                              initrd_size,
> > ++                                              RANGE_RESERVED);
> > ++              if (ret)
> > ++                      return ret;
> > ++      }
> > ++
> > ++      ret =3D dtb_get_memory_ranges(fdt->buf, &sysmem_ranges,
> extra_ranges);
> > ++      if (ret) {
> > ++              fprintf(stderr, "Could not get memory ranges from devic=
e
> tree (%i) !\n", ret);
> > ++              return ret;
> > ++      }
> > ++
> > ++      *range =3D sysmem_ranges.ranges;
> > ++      *num_ranges =3D sysmem_ranges.size;
> > ++
> > ++      dbgprintf("Memory regions:\n");
> > ++      for (i =3D 0; i < sysmem_ranges.size; i++) {
> > ++              dbgprintf("\t0x%llx - 0x%llx : %s (%i)\n",
> > ++                        sysmem_ranges.ranges[i].start,
> > ++                        sysmem_ranges.ranges[i].end,
> > ++                        sysmem_ranges.ranges[i].type =3D=3D RANGE_RES=
ERVED
> ?
> > ++                        "RANGE_RESERVED" : "RANGE_RAM",
> > ++                        sysmem_ranges.ranges[i].type);
> > ++      }
> > ++
> > ++      return 0;
> > ++}
> > ++
> > ++/*******\
> > ++* STUBS *
> > ++\*******/
> > ++
> > ++int arch_compat_trampoline(struct kexec_info *UNUSED(info))
> > ++{
> > ++      return 0;
> > ++}
> > ++
> > ++void arch_update_purgatory(struct kexec_info *UNUSED(info))
> > ++{
> > ++}
> > +--- /dev/null
> > ++++ b/kexec/arch/riscv/kexec-riscv.h
> > +@@ -0,0 +1,32 @@
> > ++/* SPDX-License-Identifier: GPL-2.0 */
> > ++/*
> > ++ * Copyright (C) 2019 FORTH-ICS/CARV
> > ++ *              Nick Kossifidis <mick@ics.forth.gr>
> > ++ */
> > ++
> > ++struct fdt_image {
> > ++      char    *buf;
> > ++      off_t   size;
> > ++};
> > ++
> > ++struct riscv_opts {
> > ++      char *cmdline;
> > ++      char *fdt_path;
> > ++      char *initrd_path;
> > ++      uint64_t initrd_start;
> > ++      uint64_t initrd_end;
> > ++      struct fdt_image *fdt;
> > ++};
> > ++
> > ++/* crashdump-riscv.c */
> > ++extern struct memory_range elfcorehdr_mem;
> > ++int load_elfcorehdr(struct kexec_info *info);
> > ++
> > ++/* kexec-riscv.c */
> > ++int load_extra_segments(struct kexec_info *info, uint64_t kernel_base=
,
> > ++                      uint64_t kernel_size, uint64_t max_addr);
> > ++
> > ++int elf_riscv_probe(const char *buf, off_t len);
> > ++void elf_riscv_usage(void);
> > ++int elf_riscv_load(int argc, char **argv, const char *buf, off_t len,
> > ++                 struct kexec_info *info);
> > +--- a/kexec/dt-ops.c
> > ++++ b/kexec/dt-ops.c
> > +@@ -4,9 +4,11 @@
> > + #include <libfdt.h>
> > + #include <stdio.h>
> > + #include <stdlib.h>
> > ++#include <stdbool.h>
> > +
> > + #include "kexec.h"
> > + #include "dt-ops.h"
> > ++#include "mem_regions.h"
> > +
> > + static const char n_chosen[] =3D "chosen";
> > +
> > +@@ -174,3 +176,441 @@ int dtb_delete_property(char *dtb, const
> > +       free(new_node);
> > +       return result;
> > + }
> > ++
> > ++static int dtb_get_num_cells(char *dtb, int nodeoffset, uint32_t
> *addr_cells,
> > ++                           uint32_t *size_cells, bool recursive)
> > ++{
> > ++      const uint32_t *prop32 =3D NULL;
> > ++      int curr_offset =3D nodeoffset;
> > ++      int prop_len =3D 0;
> > ++      *addr_cells =3D 0;
> > ++      *size_cells =3D 0;
> > ++
> > ++      do {
> > ++              prop32 =3D fdt_getprop(dtb, curr_offset, "#address-cell=
s",
> &prop_len);
> > ++              curr_offset =3D fdt_parent_offset(dtb, curr_offset);
> > ++      } while (!prop32 && prop_len =3D=3D -FDT_ERR_NOTFOUND && recurs=
ive);
> > ++
> > ++      if (!prop32) {
> > ++              dbgprintf("Could not get #address-cells property for %s
> (%s)\n",
> > ++                        fdt_get_name(dtb, nodeoffset, NULL),
> fdt_strerror(nodeoffset));
> > ++              return -EINVAL;
> > ++      }
> > ++      *addr_cells =3D fdt32_to_cpu(*prop32);
> > ++
> > ++      curr_offset =3D nodeoffset;
> > ++      do {
> > ++              prop32 =3D fdt_getprop(dtb, curr_offset, "#size-cells",
> &prop_len);
> > ++              curr_offset =3D fdt_parent_offset(dtb, curr_offset);
> > ++      } while (!prop32 && prop_len =3D=3D -FDT_ERR_NOTFOUND && recurs=
ive);
> > ++
> > ++      if (!prop32) {
> > ++              dbgprintf("Could not get #size-cells property for %s
> (%s)\n",
> > ++                        fdt_get_name(dtb, nodeoffset, NULL),
> fdt_strerror(nodeoffset));
> > ++              return -EINVAL;
> > ++      }
> > ++      *size_cells =3D fdt32_to_cpu(*prop32);
> > ++
> > ++      dbgprintf("%s: #address-cells:%d #size-cells:%d\n",
> > ++               fdt_get_name(dtb, nodeoffset, NULL), *addr_cells,
> *size_cells);
> > ++
> > ++      return 0;
> > ++}
> > ++
> > ++void dtb_extract_int_property(uint64_t *val, const void *buf, uint32_=
t
> cells)
> > ++{
> > ++      const uint32_t *prop32 =3D NULL;
> > ++      const uint64_t *prop64 =3D NULL;
> > ++
> > ++      if (cells =3D=3D 1) {
> > ++              prop32 =3D (const uint32_t *) buf;
> > ++              *val =3D (uint64_t) be32_to_cpu(*prop32);
> > ++      } else {
> > ++              /* Skip any leading cells */
> > ++              prop64 =3D (const uint64_t *) (uint32_t *)buf + cells -=
 2;
> > ++              *val =3D (uint64_t) be64_to_cpu(*prop64);
> > ++      }
> > ++}
> > ++
> > ++void dtb_fill_int_property(void *buf, uint64_t val, uint32_t cells)
> > ++{
> > ++      uint32_t prop32 =3D 0;
> > ++      uint64_t prop64 =3D 0;
> > ++
> > ++      if (cells =3D=3D 1) {
> > ++              prop32 =3D cpu_to_fdt32((uint32_t) val);
> > ++              memcpy(buf, &prop32, sizeof(uint32_t));
> > ++      } else {
> > ++              prop64 =3D cpu_to_fdt64(val);
> > ++              /* Skip any leading cells */
> > ++              memcpy((uint64_t *)(uint32_t *)buf + cells - 2,
> > ++                     &prop64, sizeof(uint64_t));
> > ++      }
> > ++}
> > ++
> > ++int dtb_add_range_property(char **dtb, off_t *dtb_size, uint64_t
> start, uint64_t end,
> > ++                         const char *parent, const char *name)
> > ++{
> > ++      uint32_t addr_cells =3D 0;
> > ++      uint32_t size_cells =3D 0;
> > ++      char *nodepath =3D NULL;
> > ++      void *prop =3D NULL;
> > ++      int nodeoffset =3D 0;
> > ++      int prop_size =3D 0;
> > ++      int ret =3D 0;
> > ++
> > ++      nodepath =3D malloc(strlen("/") + strlen(parent) + 1);
> > ++      if (!nodepath) {
> > ++              dbgprintf("%s: malloc failed\n", __func__);
> > ++              return -ENOMEM;
> > ++      }
> > ++
> > ++      strcpy(nodepath, "/");
> > ++      strcat(nodepath, parent);
> > ++
> > ++      nodeoffset =3D fdt_path_offset(*dtb, nodepath);
> > ++      if (nodeoffset < 0) {
> > ++              dbgprintf("%s: fdt_path_offset(%s) failed: %s\n",
> __func__,
> > ++                        nodepath, fdt_strerror(nodeoffset));
> > ++              free(nodepath);
> > ++              return nodeoffset;
> > ++      }
> > ++      free(nodepath);
> > ++
> > ++      ret =3D dtb_get_num_cells(*dtb, nodeoffset, &addr_cells,
> &size_cells, true);
> > ++      if (ret < 0)
> > ++              return ret;
> > ++
> > ++      /* Can the range fit with the given address/size cells ? */
> > ++      if ((addr_cells =3D=3D 1) && (start >=3D (1ULL << 32)))
> > ++              return -EINVAL;
> > ++
> > ++      if ((size_cells =3D=3D 1) && ((end - start + 1) >=3D (1ULL << 3=
2)))
> > ++              return -EINVAL;
> > ++
> > ++      prop_size =3D sizeof(uint32_t) * (addr_cells + size_cells);
> > ++      prop =3D malloc(prop_size);
> > ++
> > ++      dtb_fill_int_property(prop, start, addr_cells);
> > ++      dtb_fill_int_property((void *)((uint32_t *)prop + addr_cells),
> > ++                            end - start + 1, size_cells);
> > ++
> > ++      /* Add by node path name */
> > ++      return dtb_set_property(dtb, dtb_size, parent, name, prop,
> prop_size);
> > ++}
> > ++
> > ++/************************\
> > ++* MEMORY RANGES HANDLING *
> > ++\************************/
> > ++
> > ++static int dtb_add_memory_range(struct memory_ranges *mem_ranges,
> uint64_t start,
> > ++                              uint64_t end, unsigned type)
> > ++{
> > ++      struct memory_range this_region =3D {0};
> > ++      struct memory_range *ranges =3D mem_ranges->ranges;
> > ++      int i =3D 0;
> > ++      int ret =3D 0;
> > ++
> > ++      if (start =3D=3D end) {
> > ++              dbgprintf("Ignoring empty region\n");
> > ++              return -EINVAL;
> > ++      }
> > ++
> > ++      /* Check if we are adding an existing region */
> > ++      for (i =3D 0; i < mem_ranges->size; i++) {
> > ++              if (start =3D=3D ranges[i].start && end =3D=3D ranges[i=
].end) {
> > ++                      dbgprintf("Duplicate: 0x%lx - 0x%lx\n", start,
> end);
> > ++
> > ++                      if (type =3D=3D ranges[i].type)
> > ++                              return 0;
> > ++                      else if (type =3D=3D RANGE_RESERVED) {
> > ++                              ranges[i].type =3D RANGE_RESERVED;
> > ++                              return 0;
> > ++                      }
> > ++
> > ++                      dbgprintf("Conflicting types for region: 0x%lx =
-
> 0x%lx\n",
> > ++                                start, end);
> > ++                      return -EINVAL;
> > ++              }
> > ++      }
> > ++
> > ++      /*
> > ++       * Reserved regions may be part of an existing /memory
> > ++       * region and shouldn't overlap according to spec, so
> > ++       * since we add /memory regions first, we can exclude
> > ++       * reserved regions here from the existing /memory regions
> > ++       * included in ranges[], so that we don't have the same
> > ++       * region twice.
> > ++       */
> > ++      if (type =3D=3D RANGE_RESERVED) {
> > ++              this_region.start =3D start;
> > ++              this_region.end =3D end - 1;
> > ++              this_region.type =3D type;
> > ++              ret =3D mem_regions_exclude(mem_ranges, &this_region);
> > ++              if (ret)
> > ++                      return ret;
> > ++      }
> > ++
> > ++      ret =3D mem_regions_alloc_and_add(mem_ranges, start,
> > ++                                      end - start, type);
> > ++
> > ++      return ret;
> > ++}
> > ++
> > ++static int dtb_add_memory_region(char *dtb, int nodeoffset,
> > ++                               struct memory_ranges *mem_ranges, int
> type)
> > ++{
> > ++      uint32_t root_addr_cells =3D 0;
> > ++      uint32_t root_size_cells =3D 0;
> > ++      uint64_t addr =3D 0;
> > ++      uint64_t size =3D 0;
> > ++      const char *reg =3D NULL;
> > ++      int prop_size =3D 0;
> > ++      int offset =3D 0;
> > ++      int entry_size =3D 0;
> > ++      int num_entries =3D 0;
> > ++      int ret =3D 0;
> > ++
> > ++      /*
> > ++       * Get address-cells and size-cells properties (according to
> > ++       * binding spec these are the same as in the root node)
> > ++       */
> > ++      ret =3D dtb_get_num_cells(dtb, 0, &root_addr_cells,
> &root_size_cells, false);
> > ++      if (ret < 0) {
> > ++              dbgprintf("No address/size cells on root node !\n");
> > ++              return ret;
> > ++      }
> > ++
> > ++      /*
> > ++       * Parse the reg array, acording to device tree spec it include=
s
> > ++       * an arbitary number of <address><size> pairs
> > ++       */
> > ++      entry_size =3D (root_addr_cells + root_size_cells) *
> sizeof(uint32_t);
> > ++      reg =3D fdt_getprop(dtb, nodeoffset, "reg", &prop_size);
> > ++      if (!reg) {
> > ++              dbgprintf("Warning: Malformed memory region with no reg
> property (%s) !\n",
> > ++                        fdt_get_name(dtb, nodeoffset, NULL));
> > ++              return -EINVAL;
> > ++      }
> > ++
> > ++      num_entries =3D prop_size / entry_size;
> > ++      dbgprintf("Got region with %i entries: %s\n", num_entries,
> > ++                fdt_get_name(dtb, nodeoffset, NULL));
> > ++
> > ++      for (num_entries--; num_entries >=3D 0; num_entries--) {
> > ++              offset =3D num_entries * entry_size;
> > ++
> > ++              dtb_extract_int_property(&addr, reg + offset,
> > ++                                       root_addr_cells);
> > ++              offset +=3D root_addr_cells * sizeof(uint32_t);
> > ++
> > ++              dtb_extract_int_property(&size, reg + offset,
> > ++                                       root_size_cells);
> > ++
> > ++              ret =3D dtb_add_memory_range(mem_ranges, addr,
> > ++                                         addr + size, type);
> > ++              if (ret)
> > ++                      return ret;
> > ++      }
> > ++
> > ++      return 0;
> > ++}
> > ++
> > ++static int dtb_parse_memory_reservations_table(char *dtb, struct
> memory_ranges *mem_ranges)
> > ++{
> > ++      int total_memrsrv =3D 0;
> > ++      uint64_t addr =3D 0;
> > ++      uint64_t size =3D 0;
> > ++      int ret =3D 0;
> > ++      int i =3D 0;
> > ++
> > ++      total_memrsrv =3D fdt_num_mem_rsv(dtb);
> > ++      for (i =3D 0; i < total_memrsrv; i++) {
> > ++              ret =3D fdt_get_mem_rsv(dtb, i, &addr, &size);
> > ++              if (ret)
> > ++                      continue;
> > ++              ret =3D dtb_add_memory_range(mem_ranges, addr, addr + s=
ize
> - 1,
> > ++                                         RANGE_RESERVED);
> > ++              if (ret)
> > ++                      return ret;
> > ++      }
> > ++
> > ++      return 0;
> > ++}
> > ++
> > ++static int dtb_get_reserved_memory_node(char *dtb)
> > ++{
> > ++      uint32_t root_addr_cells =3D 0;
> > ++      uint32_t root_size_cells =3D 0;
> > ++      uint32_t addr_cells =3D 0;
> > ++      uint32_t size_cells =3D 0;
> > ++      int prop_size =3D 0;
> > ++      int nodeoffset =3D 0;
> > ++      int ret =3D 0;
> > ++
> > ++      /* Get address / size cells from root node */
> > ++      ret =3D dtb_get_num_cells(dtb, 0, &root_addr_cells,
> &root_size_cells, false);
> > ++      if (ret < 0) {
> > ++              dbgprintf("No address/size cells on root node !\n");
> > ++              return ret;
> > ++      }
> > ++
> > ++      /* This calls fdt_next_node internaly */
> > ++      nodeoffset =3D fdt_subnode_offset(dtb, 0, "reserved-memory");
> > ++      if (nodeoffset =3D=3D -FDT_ERR_NOTFOUND) {
> > ++              return nodeoffset;
> > ++      } else if (nodeoffset < 0) {
> > ++              dbgprintf("Error while looking for reserved-memory:
> %s\n",
> > ++                      fdt_strerror(nodeoffset));
> > ++              return nodeoffset;
> > ++      }
> > ++
> > ++      /* Look for the ranges property */
> > ++      fdt_getprop(dtb, nodeoffset, "ranges", &prop_size);
> > ++      if (prop_size < 0) {
> > ++              fprintf(stderr, "Malformed reserved-memory node (no
> ranges property) !\n");
> > ++              return -EINVAL;
> > ++      }
> > ++
> > ++      /* Verify address-cells / size-cells */
> > ++      ret =3D dtb_get_num_cells(dtb, nodeoffset, &addr_cells,
> &size_cells, false);
> > ++      if (ret < 0) {
> > ++              dbgprintf("No address/size cells property on
> reserved-memory node\n");
> > ++              return ret;
> > ++      }
> > ++
> > ++      if (addr_cells !=3D root_addr_cells) {
> > ++              fprintf(stderr, "Invalid #address-cells property on
> reserved-memory node\n");
> > ++              return -EINVAL;
> > ++      }
> > ++
> > ++      if (size_cells !=3D root_size_cells) {
> > ++              fprintf(stderr, "Invalid #size-cells property on
> reserved-memory node\n");
> > ++              return -EINVAL;
> > ++
> > ++      }
> > ++
> > ++      return nodeoffset;
> > ++}
> > ++
> > ++static int dtb_parse_reserved_memory_node(char *dtb, struct
> memory_ranges *mem_ranges)
> > ++{
> > ++      int nodeoffset =3D 0;
> > ++      int node_depth =3D 0;
> > ++      int parent_depth =3D 0;
> > ++      int ret =3D 0;
> > ++
> > ++      nodeoffset =3D dtb_get_reserved_memory_node(dtb);
> > ++      if (nodeoffset =3D=3D -FDT_ERR_NOTFOUND)
> > ++              return 0;
> > ++      else if (nodeoffset < 0)
> > ++              return nodeoffset;
> > ++
> > ++      /* Got the parent node, check for sub-nodes */
> > ++
> > ++      /* fdt_next_node() increases or decreases depth */
> > ++      node_depth =3D parent_depth;
> > ++      nodeoffset =3D fdt_next_node(dtb, nodeoffset, &node_depth);
> > ++      if (ret < 0) {
> > ++              dbgprintf("Unable to get next node: %s\n",
> > ++                        fdt_strerror(ret));
> > ++              return -EINVAL;
> > ++      }
> > ++
> > ++      while (node_depth !=3D parent_depth) {
> > ++
> > ++              ret =3D dtb_add_memory_region(dtb, nodeoffset,
> > ++                                          mem_ranges, RANGE_RESERVED)=
;
> > ++              if (ret)
> > ++                      return ret;
> > ++
> > ++              nodeoffset =3D fdt_next_node(dtb, nodeoffset, &node_dep=
th);
> > ++              if (ret < 0) {
> > ++                      dbgprintf("Unable to get next node: %s\n",
> > ++                                fdt_strerror(ret));
> > ++                      return -EINVAL;
> > ++              }
> > ++      }
> > ++
> > ++      return 0;
> > ++}
> > ++
> > ++static int dtb_parse_memory_nodes(char *dtb, struct memory_ranges
> *mem_ranges)
> > ++{
> > ++      int nodeoffset =3D 0;
> > ++      int num_regions =3D 0;
> > ++      const char* dev_type =3D 0;
> > ++      int prop_size =3D 0;
> > ++      int ret =3D 0;
> > ++
> > ++      for (; ; num_regions++) {
> > ++              nodeoffset =3D fdt_subnode_offset(dtb, nodeoffset,
> > ++                                               "memory");
> > ++              if (nodeoffset < 0)
> > ++                      break;
> > ++
> > ++              dbgprintf("Got memory node at depth: %i\n",
> fdt_node_depth(dtb, nodeoffset));
> > ++
> > ++              /* Look for the device_type  property */
> > ++              dev_type =3D fdt_getprop(dtb, nodeoffset, "device_type"=
,
> &prop_size);
> > ++              if (prop_size < 0) {
> > ++                      fprintf(stderr, "Malformed /memory node (no
> device-type property) !\n");
> > ++                      return -EINVAL;
> > ++              }
> > ++
> > ++              if (strncmp(dev_type, "memory", prop_size)) {
> > ++                      dbgprintf("Got unknown dev_type property: %s\n"=
,
> dev_type);
> > ++                      continue;
> > ++              }
> > ++
> > ++              ret =3D dtb_add_memory_region(dtb, nodeoffset, mem_rang=
es,
> RANGE_RAM);
> > ++              if (ret)
> > ++                      return ret;
> > ++      }
> > ++
> > ++      if (!num_regions) {
> > ++              dbgprintf("Malformed dtb, no /memory nodes present !\n"=
);
> > ++              return -EINVAL;
> > ++      }
> > ++
> > ++      dbgprintf("Got %i /memory nodes\n", num_regions);
> > ++
> > ++      return 0;
> > ++}
> > ++
> > ++int dtb_get_memory_ranges(char *dtb, struct memory_ranges *mem_ranges=
,
> struct memory_ranges *extra_ranges)
> > ++{
> > ++      int i =3D 0;
> > ++      int ret =3D 0;
> > ++
> > ++      /* Fill mem_ranges[] by parsing the device tree */
> > ++      ret =3D dtb_parse_memory_nodes(dtb, mem_ranges);
> > ++      if (ret)
> > ++              return ret;
> > ++
> > ++      ret =3D dtb_parse_memory_reservations_table(dtb, mem_ranges);
> > ++      if (ret)
> > ++              return ret;
> > ++
> > ++      ret =3D dtb_parse_reserved_memory_node(dtb, mem_ranges);
> > ++      if (ret)
> > ++              return ret;
> > ++
> > ++      /* Append any extra ranges provided by the caller (e.g. initrd)
> */
> > ++      for (i =3D 0; extra_ranges !=3D NULL && i < extra_ranges->size;=
 i++)
> {
> > ++              dbgprintf("Adding extra range: 0x%llx - 0x%llx (%s)\n",
> > ++                        extra_ranges->ranges[i].start,
> > ++                        extra_ranges->ranges[i].end,
> > ++                        extra_ranges->ranges[i].type =3D=3D RANGE_RES=
ERVED
> ?
> > ++                          "RANGE_RESERVED" : "RANGE_RAM");
> > ++
> > ++              ret =3D dtb_add_memory_range(mem_ranges,
> extra_ranges->ranges[i].start,
> > ++                                extra_ranges->ranges[i].end,
> extra_ranges->ranges[i].type);
> > ++              if (ret)
> > ++                      return ret;
> > ++      }
> > ++
> > ++      mem_regions_sort(mem_ranges);
> > ++
> > ++      return 0;
> > ++}
> > +--- a/kexec/dt-ops.h
> > ++++ b/kexec/dt-ops.h
> > +@@ -11,4 +11,11 @@ int dtb_set_property(char **dtb, off_t *
> > +
> > + int dtb_delete_property(char *dtb, const char *node, const char *prop=
);
> > +
> > ++void dtb_extract_int_property(uint64_t *val, const void *buf, uint32_=
t
> cells);
> > ++void dtb_fill_int_property(void *buf, uint64_t val, uint32_t cells);
> > ++int dtb_add_range_property(char **dtb, off_t *dtb_size, uint64_t
> start, uint64_t end,
> > ++                           const char *node, const char* parent);
> > ++int dtb_get_memory_ranges(char *dtb, struct memory_ranges *mem_ranges=
,
> > ++                        struct memory_ranges *extra_ranges);
> > ++
> > + #endif
> > +--- a/kexec/kexec-syscall.h
> > ++++ b/kexec/kexec-syscall.h
> > +@@ -140,6 +140,7 @@ static inline long kexec_file_load(int k
> > + #define KEXEC_ARCH_MIPS_LE (10 << 16)
> > + #define KEXEC_ARCH_MIPS    ( 8 << 16)
> > + #define KEXEC_ARCH_CRIS    (76 << 16)
> > ++#define KEXEC_ARCH_RISCV   (243 << 16)
> > + #define KEXEC_ARCH_LOONGARCH  (258 << 16)
> > +
> > + #define KEXEC_MAX_SEGMENTS 16
> > +@@ -184,6 +185,9 @@ static inline long kexec_file_load(int k
> > + #if defined(__arm64__)
> > + #define KEXEC_ARCH_NATIVE     KEXEC_ARCH_ARM64
> > + #endif
> > ++#if defined(__riscv__) || defined(__riscv)
> > ++#define KEXEC_ARCH_NATIVE     KEXEC_ARCH_RISCV
> > ++#endif
> > + #if defined(__loongarch__)
> > + #define KEXEC_ARCH_NATIVE     KEXEC_ARCH_LOONGARCH
> > + #endif
> > +--- a/purgatory/Makefile
> > ++++ b/purgatory/Makefile
> > +@@ -25,6 +25,7 @@ include $(srcdir)/purgatory/arch/ia64/Ma
> > + include $(srcdir)/purgatory/arch/mips/Makefile
> > + include $(srcdir)/purgatory/arch/ppc/Makefile
> > + include $(srcdir)/purgatory/arch/ppc64/Makefile
> > ++include $(srcdir)/purgatory/arch/riscv/Makefile
> > + include $(srcdir)/purgatory/arch/s390/Makefile
> > + include $(srcdir)/purgatory/arch/sh/Makefile
> > + include $(srcdir)/purgatory/arch/x86_64/Makefile
> > +--- /dev/null
> > ++++ b/purgatory/arch/riscv/Makefile
> > +@@ -0,0 +1,7 @@
> > ++#
> > ++# Purgatory riscv
> > ++#
> > ++
> > ++riscv_PURGATORY_SRCS =3D
> > ++
> > ++dist +=3D purgatory/arch/sh/Makefile $(riscv_PURGATORY_SRCS)
> > diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
> b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
> > index b12f76a0bf..f61c8a6c49 100644
> > --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
> > +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
> > @@ -20,6 +20,8 @@ SRC_URI =3D
> "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
> >
>  file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
> >             file://0001-ppc-fs2dt-Match-function-signatures.patch \
> >
>  file://0001-Make-the-segment-base-match-pinned-section-address.patch \
> > +           file://riscv64-support.patch \
> > +           file://riscv64-hotplug-support.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =3D
> "ddaaa65b02b4f8aa9222586b1f26565b93a4baeffd35bcbd523f15fae7aa4897"
> > @@ -86,7 +88,7 @@ SYSTEMD_SERVICE:kdump =3D "kdump.service"
> >
> >  SECURITY_PIE_CFLAGS:remove =3D "-fPIE -pie"
> >
> > -COMPATIBLE_HOST =3D
> '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
> > +COMPATIBLE_HOST =3D
> '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*|riscv64.*)-(linux|free=
bsd.*)'
> >  # makedumpfile would not compile on mips/rv32
> >  COMPATIBLE_HOST:mipsarcho32 =3D "null"
> >  COMPATIBLE_HOST:riscv32 =3D "null"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#227617):
> https://lists.openembedded.org/g/openembedded-core/message/227617
> > Mute This Topic: https://lists.openembedded.org/mt/116760357/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000002e8f310645fb6c2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 15, 2025 at 5:00=E2=80=AFAM=
 Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanav=
in@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)">Do not add huge &quot=
;Pending [no reason]&quot; patches please. By now you<br>
should know I will immediately strongly object.<br>
<br>
And please do just a little bit more research: this patch is a part of<br>
2.0.32 release, so the recipe should be updated to that instead.</blockquot=
e><div dir=3D"auto"><br></div><div dir=3D"auto">Maybe you should read maili=
ng list throughly first?</div><div dir=3D"auto">Such emails do not help the=
 community sadly and they are not funny either</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;pad=
ding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Alex<br>
<br>
On Sat, 13 Dec 2025 at 10:55, Khem Raj via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><b=
r>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; These patches are used in several distros and are part of kexec-tools<=
br>
&gt; riscv-collab fork. Unfortunately upstreaming for this fork is slow<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../kexec-tools/riscv64-hotplug-support.patch |=C2=A0 =C2=A025 +=
<br>
&gt;=C2=A0 .../kexec/kexec-tools/riscv64-support.patch=C2=A0 =C2=A0| 1469 +=
++++++++++++++++<br>
&gt;=C2=A0 .../kexec/<a href=3D"http://kexec-tools_2.0.31.bb" rel=3D"norefe=
rrer" target=3D"_blank">kexec-tools_2.0.31.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +-<br>
&gt;=C2=A0 3 files changed, 1497 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/riscv64=
-hotplug-support.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/riscv64=
-support.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/kexec/kexec-tools/riscv64-hotplug-sup=
port.patch b/meta/recipes-kernel/kexec/kexec-tools/riscv64-hotplug-support.=
patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..90e08a9050<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-kernel/kexec/kexec-tools/riscv64-hotplug-support.pa=
tch<br>
&gt; @@ -0,0 +1,25 @@<br>
&gt; +From: Petr Tesarik &lt;<a href=3D"mailto:ptesarik@suse.com" target=3D=
"_blank">ptesarik@suse.com</a>&gt;<br>
&gt; +Subject: riscv: fix build with hotplug support<br>
&gt; +Upstream: not yet, blocked by base RISC-V patches<br>
&gt; +<br>
&gt; +Commit 3c47f384f1c4 (&quot;kexec_load: Use new kexec flag for hotplug=
 support&quot;)<br>
&gt; +adds a new architecture-specific function named arch_do_exclude_segme=
nt.<br>
&gt; +Since RISC-V does not yet implement hotplug updates in the kernel, ad=
d a<br>
&gt; +trivial definition of this function to kexec-tools.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Petr Tesarik &lt;<a href=3D"mailto:ptesarik@suse.com" =
target=3D"_blank">ptesarik@suse.com</a>&gt;<br>
&gt; +Index: kexec-tools-2.0.29/kexec/arch/riscv/kexec-riscv.c<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +--- kexec-tools-2.0.29.orig/kexec/arch/riscv/kexec-riscv.c<br>
&gt; ++++ kexec-tools-2.0.29/kexec/arch/riscv/kexec-riscv.c<br>
&gt; +@@ -362,3 +362,8 @@ int arch_compat_trampoline(struct kexec_<br>
&gt; + void arch_update_purgatory(struct kexec_info *UNUSED(info))<br>
&gt; + {<br>
&gt; + }<br>
&gt; ++<br>
&gt; ++int arch_do_exclude_segment(struct kexec_info *UNUSED(info), struct =
kexec_segment *UNUSED(segment))<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-kernel/kexec/kexec-tools/riscv64-support.pat=
ch b/meta/recipes-kernel/kexec/kexec-tools/riscv64-support.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..74f06d3be0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-kernel/kexec/kexec-tools/riscv64-support.patch<br>
&gt; @@ -0,0 +1,1469 @@<br>
&gt; +From 379d8f3ef3219bd400c7893d0a262b079c1de408 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Nick Kossifidis &lt;<a href=3D"mailto:mick@ics.forth.gr" target=
=3D"_blank">mick@ics.forth.gr</a>&gt;<br>
&gt; +Date: Tue, 5 Oct 2021 15:01:19 +0300<br>
&gt; +Subject: [PATCH] RISC-V: Add support for riscv kexec/kdump on kexec-t=
ools<br>
&gt; +<br>
&gt; +This patch adds support for loading the ELF kernel image. It parses<b=
r>
&gt; +the current/provided device tree to determine the system&#39;s memory=
<br>
&gt; +layout, and /proc/iomem for the various kernel segments.<br>
&gt; +<br>
&gt; +See <a href=3D"https://github.com/riscv-collab/kexec-tools/commit/379=
d8f3ef3219bd400c7893d0a262b079c1de408" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/riscv-collab/kexec-tools/commit/379d8f3ef3219bd400c7893=
d0a262b079c1de408</a><br>
&gt; +<br>
&gt; +Tested on Qemu&#39;s rv64 virt machine.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Nick Kossifidis &lt;<a href=3D"mailto:mick@ics.forth.g=
r" target=3D"_blank">mick@ics.forth.gr</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt; + include/elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt; + kexec/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; + kexec/arch/riscv/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 35 ++<br>
&gt; + kexec/arch/riscv/crashdump-riscv.c=C2=A0 =C2=A0 =C2=A0 | 140 +++++++=
+<br>
&gt; + kexec/arch/riscv/include/arch/options.h |=C2=A0 43 +++<br>
&gt; + kexec/arch/riscv/kexec-elf-riscv.c=C2=A0 =C2=A0 =C2=A0 | 255 +++++++=
+++++++<br>
&gt; + kexec/arch/riscv/kexec-riscv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3=
64 +++++++++++++++++++<br>
&gt; + kexec/arch/riscv/kexec-riscv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 32 ++<br>
&gt; + kexec/dt-ops.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 442 +++++++++++++++++++++++-<br>
&gt; + kexec/dt-ops.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
&gt; + kexec/kexec-syscall.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
&gt; + purgatory/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt; + purgatory/arch/riscv/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A07 +<br>
&gt; + 14 files changed, 1335 insertions(+), 2 deletions(-)<br>
&gt; + create mode 100644 kexec/arch/riscv/Makefile<br>
&gt; + create mode 100644 kexec/arch/riscv/crashdump-riscv.c<br>
&gt; + create mode 100644 kexec/arch/riscv/include/arch/options.h<br>
&gt; + create mode 100644 kexec/arch/riscv/kexec-elf-riscv.c<br>
&gt; + create mode 100644 kexec/arch/riscv/kexec-riscv.c<br>
&gt; + create mode 100644 kexec/arch/riscv/kexec-riscv.h<br>
&gt; + create mode 100644 purgatory/arch/riscv/Makefile<br>
&gt; +<br>
&gt; +--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; ++++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
&gt; +@@ -61,6 +61,9 @@ case $target_cpu in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0loongarch*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH=3D&quot;l=
oongarch&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 riscv32|riscv64 )<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARCH=3D&quot;riscv&=
quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0* )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_ERROR([=
unsupported architecture $target_cpu])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
&gt; +--- a/include/elf.h<br>
&gt; ++++ b/include/elf.h<br>
&gt; +@@ -259,6 +259,7 @@ typedef struct<br>
&gt; + #define EM_ARC_A5=C2=A0 =C2=A0 =C2=A093=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* ARC Cores Tangent-A5 */<br>
&gt; + #define EM_XTENSA=C2=A0 =C2=A0 =C2=A094=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* Tensilica Xtensa Architecture */<br>
&gt; + #define EM_AARCH64=C2=A0 =C2=A0 183=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* ARM AARCH64 */<br>
&gt; ++#define EM_RISCV=C2=A0 =C2=A0 =C2=A0 243=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* RISC-V */<br>
&gt; + #define EM_LOONGARCH=C2=A0 258=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Loongson Loongarch*/<br>
&gt; + #define EM_NUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 184<br>
&gt; +<br>
&gt; +--- a/kexec/Makefile<br>
&gt; ++++ b/kexec/Makefile<br>
&gt; +@@ -92,6 +92,7 @@ include $(srcdir)/kexec/arch/mips/Makefi<br>
&gt; + include $(srcdir)/kexec/arch/cris/Makefile<br>
&gt; + include $(srcdir)/kexec/arch/ppc/Makefile<br>
&gt; + include $(srcdir)/kexec/arch/ppc64/Makefile<br>
&gt; ++include $(srcdir)/kexec/arch/riscv/Makefile<br>
&gt; + include $(srcdir)/kexec/arch/s390/Makefile<br>
&gt; + include $(srcdir)/kexec/arch/sh/Makefile<br>
&gt; + include $(srcdir)/kexec/arch/x86_64/Makefile<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/kexec/arch/riscv/Makefile<br>
&gt; +@@ -0,0 +1,35 @@<br>
&gt; ++#<br>
&gt; ++# kexec riscv<br>
&gt; ++#<br>
&gt; ++riscv_KEXEC_SRCS =3D=C2=A0 kexec/arch/riscv/kexec-riscv.c<br>
&gt; ++riscv_KEXEC_SRCS +=3D kexec/arch/riscv/kexec-elf-riscv.c<br>
&gt; ++riscv_KEXEC_SRCS +=3D kexec/arch/riscv/crashdump-riscv.c<br>
&gt; ++<br>
&gt; ++riscv_MEM_REGIONS =3D kexec/mem_regions.c<br>
&gt; ++<br>
&gt; ++riscv_DT_OPS +=3D kexec/dt-ops.c<br>
&gt; ++<br>
&gt; ++riscv_ARCH_REUSE_INITRD =3D<br>
&gt; ++<br>
&gt; ++riscv_CPPFLAGS +=3D -I $(srcdir)/kexec/<br>
&gt; ++<br>
&gt; ++dist +=3D kexec/arch/riscv/Makefile $(riscv_KEXEC_SRCS)=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 kexec/arch/riscv/kexec-riscv.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 kexec/arch/riscv/include/arch/options.h<br>
&gt; ++<br>
&gt; ++ifdef HAVE_LIBFDT<br>
&gt; ++<br>
&gt; ++LIBS +=3D -lfdt<br>
&gt; ++<br>
&gt; ++else<br>
&gt; ++<br>
&gt; ++include $(srcdir)/kexec/libfdt/Makefile.libfdt<br>
&gt; ++<br>
&gt; ++libfdt_SRCS +=3D $(LIBFDT_SRCS:%=3Dkexec/libfdt/%)<br>
&gt; ++<br>
&gt; ++riscv_CPPFLAGS +=3D -I$(srcdir)/kexec/libfdt<br>
&gt; ++<br>
&gt; ++riscv_KEXEC_SRCS +=3D $(libfdt_SRCS)<br>
&gt; ++<br>
&gt; ++endif<br>
&gt; ++<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/kexec/arch/riscv/crashdump-riscv.c<br>
&gt; +@@ -0,0 +1,140 @@<br>
&gt; ++#include &lt;errno.h&gt;<br>
&gt; ++#include &lt;linux/elf.h&gt;<br>
&gt; ++#include &lt;unistd.h&gt;<br>
&gt; ++<br>
&gt; ++#include &quot;kexec.h&quot;<br>
&gt; ++#include &quot;crashdump.h&quot;<br>
&gt; ++#include &quot;kexec-elf.h&quot;<br>
&gt; ++#include &quot;mem_regions.h&quot;<br>
&gt; ++<br>
&gt; ++static struct crash_elf_info elf_info =3D {<br>
&gt; ++#if __riscv_xlen =3D=3D 64<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 .class=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D EL=
FCLASS64,<br>
&gt; ++#else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 .class=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D EL=
FCLASS32,<br>
&gt; ++#endif<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 .data=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D ELFDATA2LSB,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 .machine=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D EM_RISC=
V,<br>
&gt; ++};<br>
&gt; ++<br>
&gt; ++static struct memory_ranges crash_mem_ranges =3D {0};<br>
&gt; ++struct memory_range elfcorehdr_mem =3D {0};<br>
&gt; ++<br>
&gt; ++static unsigned long long get_page_offset(struct kexec_info *info)<b=
r>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 unsigned long long vaddr_off =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 unsigned long long page_size =3D sysconf(_SC_PA=
GESIZE);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 unsigned long long init_start =3D get_kernel_sy=
m(&quot;_sinittext&quot;);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Begining of init section is aligned to =
page size<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 vaddr_off =3D init_start - page_size;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return vaddr_off;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++int load_elfcorehdr(struct kexec_info *info)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct memory_range crashkern_range =3D {0};<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct memory_range *ranges =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 unsigned long start =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 unsigned long end =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 unsigned long buf_size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 unsigned long elfcorehdr_addr =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 void* buf =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int i =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D parse_iomem_single(&quot;Kernel code\n&=
quot;, &amp;start, NULL);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Cannot determine kernel physical base addr\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 elf_info.kern_paddr_start =3D start;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D parse_iomem_single(&quot;Kernel bss\n&q=
uot;, NULL, &amp;end);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Cannot determine kernel physical bss addr\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 elf_info.kern_paddr_start =3D start;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 elf_info.kern_size =3D end - start;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 elf_info.kern_vaddr_start =3D get_kernel_sym(&q=
uot;_text&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!elf_info.kern_vaddr_start) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_info.kern_vaddr=
_start =3D UINT64_MAX;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 elf_info.page_offset =3D get_page_offset(info);=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;page_offset:=C2=A0 =C2=A0%016ll=
x\n&quot;, elf_info.page_offset);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D parse_iomem_single(&quot;Crash kernel\n=
&quot;, &amp;start, &amp;end);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Cannot determine kernel physical bss addr\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 crashkern_range.start =3D start;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 crashkern_range.end =3D end;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 crashkern_range.type =3D RANGE_RESERVED;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ranges =3D info-&gt;memory_range;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; info-&gt;memory_ranges; i+=
+) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mem_regions=
_alloc_and_add(&amp;crash_mem_ranges,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ranges[i].start,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ranges[i].end - ranges[i].start,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ranges[i].type);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret ) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr, &quot;Could not create crash_mem_ranges\n&quot;)=
;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D mem_regions_alloc_and_exclude(&amp;cras=
h_mem_ranges,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &amp;crashkern_range);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Could not exclude crashkern_range\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++#if __riscv_xlen =3D=3D 64<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 crash_create_elf64_headers(info, &amp;elf_info,=
 crash_mem_ranges.ranges,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crash_mem_ranges.size, =
&amp;buf, &amp;buf_size,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ELF_CORE_HEADER_ALIGN);=
<br>
&gt; ++<br>
&gt; ++#else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 crash_create_elf32_headers(info, &amp;elf_info,=
 crash_mem_ranges.ranges,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crash_mem_ranges.size, =
&amp;buf, &amp;buf_size,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ELF_CORE_HEADER_ALIGN);=
<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 elfcorehdr_addr =3D add_buffer_phys_virt(info, =
buf, buf_size,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0buf_size, 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0crashkern_range.start,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0crashkern_range.end,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-1, 0);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 elfcorehdr_mem.start =3D elfcorehdr_addr;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 elfcorehdr_mem.end =3D elfcorehdr_addr + buf_si=
ze - 1;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;%s: elfcorehdr 0x%llx-0x%llx\n&=
quot;, __func__,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elfcorehdr_m=
em.start, elfcorehdr_mem.end);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++int is_crashkernel_mem_reserved(void)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t start =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t end =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return parse_iomem_single(&quot;Crash kernel\n&=
quot;, &amp;start, &amp;end) =3D=3D 0 ?<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(start !=3D end) : 0=
;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++int get_crash_kernel_load_range(uint64_t *start, uint64_t *end)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return parse_iomem_single(&quot;Crash kernel\n&=
quot;, start, end);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/kexec/arch/riscv/include/arch/options.h<br>
&gt; +@@ -0,0 +1,43 @@<br>
&gt; ++#ifndef KEXEC_ARCH_RISCV_OPTIONS_H<br>
&gt; ++#define KEXEC_ARCH_RISCV_OPTIONS_H<br>
&gt; ++<br>
&gt; ++#define OPT_APPEND=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((OPT_MA=
X)+0)<br>
&gt; ++#define OPT_DTB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((OPT_MAX)+1)<br>
&gt; ++#define OPT_INITRD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((OPT_MA=
X)+2)<br>
&gt; ++#define OPT_CMDLINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((OPT_MA=
X)+3)<br>
&gt; ++#define OPT_REUSE_CMDLINE=C2=A0 =C2=A0 =C2=A0((OPT_MAX)+4)<br>
&gt; ++#define OPT_ARCH_MAX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((OPT_MAX)+5)=
<br>
&gt; ++<br>
&gt; ++/* Options relevant to the architecture (excluding loader-specific o=
nes),<br>
&gt; ++ * in this case none:<br>
&gt; ++ */<br>
&gt; ++#define KEXEC_ARCH_OPTIONS \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 KEXEC_OPTIONS \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 { &quot;append&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A01, 0, OPT_APPEND}, \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 { &quot;dtb&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1, 0, OPT_DTB }, \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 { &quot;initrd&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A01, 0, OPT_INITRD }, \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 { &quot;command-line&quot;,=C2=A0 =C2=A0 =C2=A0=
 =C2=A01, 0, OPT_CMDLINE}, \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 { &quot;reuse-cmdline&quot;,=C2=A0 =C2=A0 =C2=
=A0 0, NULL, OPT_REUSE_CMDLINE }, \<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++#define KEXEC_ARCH_OPT_STR KEXEC_OPT_STR &quot;&quot;<br>
&gt; ++<br>
&gt; ++/* The following two #defines list ALL of the options added by all o=
f the<br>
&gt; ++ * architecture&#39;s loaders.<br>
&gt; ++ * o=C2=A0 main() uses this complete list to scan for its options, i=
gnoring<br>
&gt; ++ *=C2=A0 =C2=A0 arch-specific/loader-specific ones.<br>
&gt; ++ * o=C2=A0 Then, arch_process_options() uses this complete list to s=
can for its<br>
&gt; ++ *=C2=A0 =C2=A0 options, ignoring general/loader-specific ones.<br>
&gt; ++ * o=C2=A0 Then, the file_type[n].load re-scans for options, using<b=
r>
&gt; ++ *=C2=A0 =C2=A0 KEXEC_ARCH_OPTIONS plus its loader-specific options =
subset.<br>
&gt; ++ *=C2=A0 =C2=A0 Any unrecognised options cause an error here.<br>
&gt; ++ *<br>
&gt; ++ * This is done so that main()&#39;s/arch_process_options()&#39;s ge=
topt_long() calls<br>
&gt; ++ * don&#39;t choose a kernel filename from random arguments to optio=
ns they don&#39;t<br>
&gt; ++ * recognise -- as they now recognise (if not act upon) all possible=
 options.<br>
&gt; ++ */<br>
&gt; ++#define KEXEC_ALL_OPTIONS KEXEC_ARCH_OPTIONS<br>
&gt; ++<br>
&gt; ++#define KEXEC_ALL_OPT_STR KEXEC_ARCH_OPT_STR<br>
&gt; ++<br>
&gt; ++#endif /* KEXEC_ARCH_RISCV_OPTIONS_H */<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/kexec/arch/riscv/kexec-elf-riscv.c<br>
&gt; +@@ -0,0 +1,255 @@<br>
&gt; ++/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; ++/*<br>
&gt; ++ * Copyright (C) 2019 FORTH-ICS/CARV<br>
&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Nick Kossifidis &=
lt;<a href=3D"mailto:mick@ics.forth.gr" target=3D"_blank">mick@ics.forth.gr=
</a>&gt;<br>
&gt; ++ */<br>
&gt; ++<br>
&gt; ++#include &quot;kexec.h&quot;<br>
&gt; ++#include &quot;dt-ops.h&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* For dtb_set/clear_initrd() */<br>
&gt; ++#include &lt;elf.h&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* For ELF header handling */<br>
&gt; ++#include &lt;errno.h&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
 For EFBIG/EINVAL */<br>
&gt; ++#include &lt;unistd.h&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 For getpagesize() */<br>
&gt; ++#include &quot;kexec-syscall.h&quot;=C2=A0 =C2=A0 /* For KEXEC_ON_CR=
ASH */<br>
&gt; ++#include &quot;kexec-riscv.h&quot;<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++/*********\<br>
&gt; ++* HELPERS *<br>
&gt; ++\*********/<br>
&gt; ++<br>
&gt; ++/*<br>
&gt; ++ * Go through the available physical memory regions and<br>
&gt; ++ * find one that can hold an image of the specified size.<br>
&gt; ++ * Note: This is called after get_memory_ranges so<br>
&gt; ++ * info-&gt;memory_range[] should be populated. Also note that<br>
&gt; ++ * memory ranges are sorted, so we&#39;ll return the first region<br=
>
&gt; ++ * that&#39;s big enough for holding the image.<br>
&gt; ++ */<br>
&gt; ++static int elf_riscv_find_pbase(struct kexec_info *info, off_t *addr=
,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 off_t size)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int i =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 off_t start =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 off_t end =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* If this image is for a crash kernel, us=
e the region<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* the primary kernel has already reserved=
 for us.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (info-&gt;kexec_flags &amp; KEXEC_ON_CRASH) =
{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D get_crash_k=
ernel_load_range((uint64_t *) &amp;start,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (uint64_t *) &amp;end);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* Kernel should be aligned to the nearest<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0* hugepage (2MB for RV64, 4MB for RV32).<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0*/<br>
&gt; ++#if __riscv_xlen =3D=3D 64<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 start =3D _ALIGN_UP(start, 0x200000);<br>
&gt; ++#else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 start =3D _ALIGN_UP(start, 0x400000);<br>
&gt; ++#endif<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (end &gt; start &amp;&amp; ((end - start) &gt;=3D size)) {<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *addr =3D start;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EFBIG;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ENOCRASHKERNEL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; info-&gt;memory_ranges; i+=
+) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&gt;memory=
_range[i].type !=3D RANGE_RAM)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D info-&gt;=
memory_range[i].start;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end =3D info-&gt;me=
mory_range[i].end;<br>
&gt; ++<br>
&gt; ++#if __riscv_xlen =3D=3D 64<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D _ALIGN_UP=
(start, 0x200000);<br>
&gt; ++#else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D _ALIGN_UP=
(start, 0x400000);<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (end &gt; start =
&amp;&amp; ((end - start) &gt;=3D size)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *addr =3D start;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return -EFBIG;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/**************\<br>
&gt; ++* ENTRY POINTS *<br>
&gt; ++\**************/<br>
&gt; ++<br>
&gt; ++int elf_riscv_probe(const char *buf, off_t len)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct mem_ehdr ehdr =3D {0};<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D build_elf_exec_info(buf, len, &amp;ehdr=
, 0);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ehdr.e_machine !=3D EM_RISCV) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Not for this architecture.\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D 0;<br>
&gt; ++<br>
&gt; ++ cleanup:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 free_elf_info(&amp;ehdr);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++void elf_riscv_usage(void)<br>
&gt; ++{<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++int elf_riscv_load(int argc, char **argv, const char *buf, off_t len=
,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 kexec_info *info)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct mem_ehdr ehdr =3D {0};<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct mem_phdr *phdr =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 off_t new_base_addr =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 off_t kernel_size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 off_t page_size =3D getpagesize();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 off_t max_addr =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 off_t old_base_addr =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 off_t old_start_addr =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int i =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (info-&gt;file_mode) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;kexec_file not supported on this &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;architecture\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Parse the ELF file */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D build_elf_exec_info(buf, len, &amp;ehdr=
, 0);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;ELF exec parse failed\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 max_addr =3D elf_max_addr(&amp;ehdr);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 old_base_addr =3D max_addr;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 old_start_addr =3D max_addr;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Get the memory footprint, base physical=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* and start address of the ELF image<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ehdr.e_phnum; i++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phdr =3D &amp;ehdr.=
e_phdr[i];<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (phdr-&gt;p_type=
 !=3D PT_LOAD)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Note: Accor=
ding to ELF spec the loadable regions<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* are sorted =
on p_vaddr, not p_paddr.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (old_base_addr &=
gt; phdr-&gt;p_paddr)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 old_base_addr =3D phdr-&gt;p_paddr;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (phdr-&gt;p_vadd=
r =3D=3D ehdr.e_entry ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phdr-=
&gt;p_paddr =3D=3D ehdr.e_entry)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 old_start_addr =3D phdr-&gt;p_paddr;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_size +=3D _A=
LIGN_UP(phdr-&gt;p_memsz, page_size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (old_base_addr =3D=3D max_addr || kernel_siz=
e =3D=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;No loadable segments present on the &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;provided ELF image\n&quot;);<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (old_start_addr =3D=3D max_addr) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Could not find the entry point address of &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;provided ELF image\n&quot;);<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Got ELF with total memsz %luKB\=
n&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Base p=
addr: 0x%lX, start_addr: 0x%lX\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_size =
/ 1024, old_base_addr, old_start_addr);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Get a continuous physical region that can ho=
ld the kernel */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D elf_riscv_find_pbase(info, &amp;new_bas=
e_addr, kernel_size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Could not find a memory region for the &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;provided ELF image\n&quot;);<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;New base paddr for the ELF: 0x%=
lX\n&quot;, new_base_addr);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Re-set the base physical address of the ELF =
*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ehdr.e_phnum; i++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phdr =3D &amp;ehdr.=
e_phdr[i];<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (phdr-&gt;p_type=
 !=3D PT_LOAD)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phdr-&gt;p_paddr -=
=3D old_base_addr;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phdr-&gt;p_paddr +=
=3D new_base_addr;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Re-set the entry point address */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ehdr.e_entry =3D (old_start_addr - old_base_add=
r) + new_base_addr;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 info-&gt;entry =3D (void *) ehdr.e_entry;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;New entry point for the ELF: 0x=
%llX\n&quot;, ehdr.e_entry);<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Load the ELF executable */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D elf_exec_load(&amp;ehdr, info);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;ELF exec load failed\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D load_extra_segments(info, new_base_addr=
,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_size, max_addr);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++/*******\<br>
&gt; ++* STUBS *<br>
&gt; ++\*******/<br>
&gt; ++<br>
&gt; ++int machine_verify_elf_rel(struct mem_ehdr *ehdr)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ehdr-&gt;ei_data !=3D ELFDATA2LSB)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++#if __riscv_xlen =3D=3D 64<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ehdr-&gt;ei_class !=3D ELFCLASS64)<br>
&gt; ++#else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ehdr-&gt;ei_class !=3D ELFCLASS32)<br>
&gt; ++#endif<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ehdr-&gt;e_machine !=3D EM_RISCV)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++void machine_apply_elf_rel(struct mem_ehdr *UNUSED(ehdr),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct mem_sym *UNUSED(sym),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned long r_type,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0void *UNUSED(location),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned long UNUSED(address),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0unsigned long UNUSED(value))<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 switch (r_type) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die(&quot;Unknown r=
ela relocation: %lu\n&quot;, r_type);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/kexec/arch/riscv/kexec-riscv.c<br>
&gt; +@@ -0,0 +1,364 @@<br>
&gt; ++/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; ++/*<br>
&gt; ++ * Copyright (C) 2019 FORTH-ICS/CARV<br>
&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Nick Kossifidis &=
lt;<a href=3D"mailto:mick@ics.forth.gr" target=3D"_blank">mick@ics.forth.gr=
</a>&gt;<br>
&gt; ++ */<br>
&gt; ++<br>
&gt; ++#include &quot;kexec-syscall.h&quot;=C2=A0 =C2=A0 /* For KEXEC_ARCH_=
RISCV */<br>
&gt; ++#include &quot;kexec.h&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* For OPT_MAX and concat_cmdline() */<br>
&gt; ++#include &quot;mem_regions.h&quot;=C2=A0 =C2=A0 =C2=A0 /* For mem_re=
gions_sort() */<br>
&gt; ++#include &quot;dt-ops.h&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* For dtb_set_bootargs() */<br>
&gt; ++#include &lt;arch/options.h&gt;=C2=A0 =C2=A0 =C2=A0/* For KEXEC_ARCH=
_OPTIONS */<br>
&gt; ++#include &lt;getopt.h&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 For struct option */<br>
&gt; ++#include &lt;sys/stat.h&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* For =
stat() and struct stat */<br>
&gt; ++#include &lt;stdlib.h&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 For free() */<br>
&gt; ++#include &lt;errno.h&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
 For EINVAL */<br>
&gt; ++#include &lt;libfdt.h&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*=
 For DeviceTree handling */<br>
&gt; ++#include &quot;kexec-riscv.h&quot;<br>
&gt; ++<br>
&gt; ++const struct arch_map_entry arches[] =3D {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 { &quot;riscv32&quot;, KEXEC_ARCH_RISCV },<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 { &quot;riscv64&quot;, KEXEC_ARCH_RISCV },<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 { NULL, 0 },<br>
&gt; ++};<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++struct file_type file_type[] =3D {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;elf-riscv&quot;, elf_riscv_probe, elf_ri=
scv_load, elf_riscv_usage},<br>
&gt; ++};<br>
&gt; ++int file_types =3D sizeof(file_type) / sizeof(file_type[0]);<br>
&gt; ++<br>
&gt; ++static const char riscv_opts_usage[] =3D<br>
&gt; ++&quot;=C2=A0 =C2=A0 =C2=A0--append=3DSTRING=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Append STRING to the kernel command line.\n&quot;<br>
&gt; ++&quot;=C2=A0 =C2=A0 =C2=A0--dtb=3DFILE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Use FILE as the device tree blob.\n&quot;<br>
&gt; ++&quot;=C2=A0 =C2=A0 =C2=A0--initrd=3DFILE=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0Use FILE as the kernel initial ramdisk.\n&quot;<br>
&gt; ++&quot;=C2=A0 =C2=A0 =C2=A0--cmdline=3DSTRING=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Use STRING as the kernel&#39;s command line.\n&quot;<br>
&gt; ++&quot;=C2=A0 =C2=A0 =C2=A0--reuse-cmdline=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0Use kernel command line from running system.\n&quot;;<br>
&gt; ++<br>
&gt; ++static struct riscv_opts arch_options =3D {0};<br>
&gt; ++static struct fdt_image provided_fdt =3D {0};<br>
&gt; ++static struct memory_ranges sysmem_ranges =3D {0};<br>
&gt; ++<br>
&gt; ++/****************\<br>
&gt; ++* COMMON HELPERS *<br>
&gt; ++\****************/<br>
&gt; ++<br>
&gt; ++int load_extra_segments(struct kexec_info *info, uint64_t kernel_bas=
e,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint64_t kernel_size, uint64_t max_addr)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct fdt_image *fdt =3D arch_options.fdt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char *initrd_buf =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 off_t initrd_size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t initrd_base =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t start =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t end =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t min_usable =3D kernel_base + kernel_si=
ze;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t max_usable =3D max_addr;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Prepare the device tree */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (info-&gt;kexec_flags &amp; KEXEC_ON_CRASH) =
{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D load_elfcor=
ehdr(info);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr, &quot;Couldn&#39;t create elfcorehdr\n&quot;);<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dtb_add_ran=
ge_property(&amp;fdt-&gt;buf, &amp;fdt-&gt;size,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0elfcorehdr_mem.start, elfcorehdr_mem.end,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;chosen&quot;, &quot;linux,elfcorehdr&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr, &quot;Couldn&#39;t add elfcorehdr to fdt\n&quot;=
);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D get_crash_k=
ernel_load_range(&amp;start, &amp;end);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr, &quot;Couldn&#39;t get crashkenel region\n&quot;=
);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dtb_add_ran=
ge_property(&amp;fdt-&gt;buf, &amp;fdt-&gt;size, start, end,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;memory&quot;, &quot;linux,usable-memory&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr, &quot;Couldn&#39;t add usable-memory to fdt\n&qu=
ot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_usable =3D end;=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Make sure w=
e remove elfcorehdr and usable-memory<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* when switch=
ing from crash kernel to a normal one.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_delete_property=
(fdt-&gt;buf, &quot;chosen&quot;, &quot;linux,elfcorehdr&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_delete_property=
(fdt-&gt;buf, &quot;memory&quot;, &quot;linux,usable-memory&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Do we need to include an initrd image ? */<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!arch_options.initrd_path &amp;&amp; !arch_=
options.initrd_end)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_clear_initrd(&a=
mp;fdt-&gt;buf, &amp;fdt-&gt;size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 else if (arch_options.initrd_path) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (arch_options.in=
itrd_end)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr, &quot;Warning: An initrd image was provided&quot=
;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;, =
will ignore reuseinitrd\n&quot;);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_buf =3D slur=
p_file(arch_options.initrd_path,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;ini=
trd_size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!initrd_buf) {<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr, &quot;Couldn&#39;t read provided initrd\n&quot;)=
;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_base =3D add=
_buffer_phys_virt(info, initrd_buf,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_size,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_size, 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min_usable,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_usable, -1, 0);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_set_initrd(&amp=
;fdt-&gt;buf, &amp;fdt-&gt;size, initrd_base,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_base + initrd_size);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Bas=
e addr for initrd image: 0x%lX\n&quot;, initrd_base);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_usable =3D init=
rd_base;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Add device tree */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 add_buffer_phys_virt(info, fdt-&gt;buf, fdt-&gt=
;size, fdt-&gt;size, 0,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min_usable, max_usable, -1, 0);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++<br>
&gt; ++/**************\<br>
&gt; ++* ENTRY POINTS *<br>
&gt; ++\**************/<br>
&gt; ++<br>
&gt; ++void arch_usage(void)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 printf(riscv_opts_usage);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++int arch_process_options(int argc, char **argv)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 static const struct option options[] =3D {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KEXEC_ARCH_OPTIONS<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { 0 },<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 };<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 static const char short_options[] =3D KEXEC_ARC=
H_OPT_STR;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct stat st =3D {0};<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char *append =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char *cmdline =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 void *tmp =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 off_t tmp_size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int opt =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 while ((opt =3D getopt_long(argc, argv, short_o=
ptions,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 options, 0)) !=3D -1) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (opt) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case OPT_APPEND:<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 append =3D optarg;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case OPT_CMDLINE:<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (cmdline)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Wa=
rning: Kernel&#39;s cmdline &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;se=
t twice !\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cmdline =3D optarg;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case OPT_REUSE_CMDL=
INE:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (cmdline)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Wa=
rning: Kernel&#39;s cmdline &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;se=
t twice !\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cmdline =3D get_command_line();<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case OPT_DTB:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D stat(optarg, &amp;st);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Co=
uld not find the provided dtb !\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 arch_options.fdt_path =3D optarg;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case OPT_INITRD:<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D stat(optarg, &amp;st);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Co=
uld not find the provided &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;in=
itrd image !\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 arch_options.initrd_path =3D optarg;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Handle Kernel&#39;s command line */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (append &amp;&amp; !cmdline)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Warning: No cmdline provided, &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;using append string as cmdline=
\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!append &amp;&amp; !cmdline)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Warning: No cmdline or append string &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;provided\n&quot;);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (append || cmdline)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Note that t=
his also handles the case where &quot;cmdline&quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* or &quot;ap=
pend&quot; is NULL.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch_options.cmdlin=
e =3D concat_cmdline(cmdline, append);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Handle FDT image */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!arch_options.fdt_path) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D stat(&quot;=
/sys/firmware/fdt&quot;, &amp;st);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr, &quot;No dtb provided and &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;/s=
ys/firmware/fdt is not present\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Warning: No dtb provided, &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;using /sys/firmware/fdt\n&quot=
;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch_options.fdt_pa=
th =3D &quot;/sys/firmware/fdt&quot;;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 tmp =3D slurp_file(arch_options.fdt_path, &amp;=
tmp_size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!tmp) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Couldn&#39;t read provided fdt\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D fdt_check_header(tmp);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Got an ivalid fdt image !\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(tmp);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 provided_fdt.buf =3D tmp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 provided_fdt.size =3D tmp_size;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (arch_options.cmdline) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dtb_set_boo=
targs(&amp;provided_fdt.buf, &amp;provided_fdt.size,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch_opti=
ons.cmdline);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr, &quot;Could not set bootargs on &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;th=
e fdt image\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 arch_options.fdt =3D &amp;provided_fdt;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/*<br>
&gt; ++ * This one is called after arch_process_options so we already<br>
&gt; ++ * have an fdt image in place.<br>
&gt; ++ */<br>
&gt; ++void arch_reuse_initrd(void)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 const uint32_t *prop32 =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint32_t addr_cells =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 const void *prop =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int prop_size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t initrd_start =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t initrd_end =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int chosen_offset =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct fdt_image *fdt =3D &amp;provided_fdt;<br=
>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 chosen_offset =3D fdt_subnode_offset(fdt-&gt;bu=
f, 0, &quot;chosen&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (chosen_offset &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;No /chosen node found on fdt image &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;unable to reuse initrd\n&quot;=
);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 prop32 =3D fdt_getprop(fdt-&gt;buf, 0, &quot;#a=
ddress-cells&quot;, NULL);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!prop32) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;No #address-cells property on root node\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 addr_cells =3D be32_to_cpu(*prop32);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 prop =3D fdt_getprop(fdt-&gt;buf, chosen_offset=
,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;linux,initrd-start&quot;, &amp;prop_size);<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!prop) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Could not get linux,initrd-start\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dtb_extract_int_property(&amp;initrd_start, pro=
p, addr_cells);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 prop =3D fdt_getprop(fdt-&gt;buf, chosen_offset=
,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;linux,initrd-end&quot;, &amp;prop_size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!prop) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Could not get linux,initrd-end\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dtb_extract_int_property(&amp;initrd_end, prop,=
 addr_cells);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 arch_options.initrd_start =3D initrd_start;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 arch_options.initrd_end =3D initrd_end;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;initrd_start: 0x%lX, initrd_end=
: 0x%lX\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 initrd_start=
, initrd_end);<br>
&gt; ++<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++int get_memory_ranges(struct memory_range **range, int *num_ranges,<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 unsigned long kexec_flags)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 const struct fdt_image *fdt =3D &amp;provided_f=
dt;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct memory_ranges *extra_ranges =3D NULL;<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int i =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (arch_options.initrd_start &amp;&amp; arch_o=
ptions.initrd_end) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int initrd_size =3D=
 arch_options.initrd_end - arch_options.initrd_start;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Mar=
king current intird image as reserved\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mem_regions=
_alloc_and_add(extra_ranges,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 arch_options.initrd_start,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 initrd_size,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 RANGE_RESERVED);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D dtb_get_memory_ranges(fdt-&gt;buf, &amp=
;sysmem_ranges, extra_ranges);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Could not get memory ranges from device tree (%i) !\n&quot;, ret);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 *range =3D sysmem_ranges.ranges;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 *num_ranges =3D sysmem_ranges.size;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Memory regions:\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; sysmem_ranges.size; i++) {=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;\t0=
x%llx - 0x%llx : %s (%i)\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sysmem_ranges.ranges[i].start,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sysmem_ranges.ranges[i].end,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sysmem_ranges.ranges[i].type =3D=3D RANGE_RESERVED ?<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;RANGE_RESERVED&quot; : &quot;RANGE_RAM&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sysmem_ranges.ranges[i].type);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/*******\<br>
&gt; ++* STUBS *<br>
&gt; ++\*******/<br>
&gt; ++<br>
&gt; ++int arch_compat_trampoline(struct kexec_info *UNUSED(info))<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++void arch_update_purgatory(struct kexec_info *UNUSED(info))<br>
&gt; ++{<br>
&gt; ++}<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/kexec/arch/riscv/kexec-riscv.h<br>
&gt; +@@ -0,0 +1,32 @@<br>
&gt; ++/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; ++/*<br>
&gt; ++ * Copyright (C) 2019 FORTH-ICS/CARV<br>
&gt; ++ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Nick Kossifidis &=
lt;<a href=3D"mailto:mick@ics.forth.gr" target=3D"_blank">mick@ics.forth.gr=
</a>&gt;<br>
&gt; ++ */<br>
&gt; ++<br>
&gt; ++struct fdt_image {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char=C2=A0 =C2=A0 *buf;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 off_t=C2=A0 =C2=A0size;<br>
&gt; ++};<br>
&gt; ++<br>
&gt; ++struct riscv_opts {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char *cmdline;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char *fdt_path;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char *initrd_path;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t initrd_start;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t initrd_end;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct fdt_image *fdt;<br>
&gt; ++};<br>
&gt; ++<br>
&gt; ++/* crashdump-riscv.c */<br>
&gt; ++extern struct memory_range elfcorehdr_mem;<br>
&gt; ++int load_elfcorehdr(struct kexec_info *info);<br>
&gt; ++<br>
&gt; ++/* kexec-riscv.c */<br>
&gt; ++int load_extra_segments(struct kexec_info *info, uint64_t kernel_bas=
e,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 uint64_t kernel_size, uint64_t max_addr);<br>
&gt; ++<br>
&gt; ++int elf_riscv_probe(const char *buf, off_t len);<br>
&gt; ++void elf_riscv_usage(void);<br>
&gt; ++int elf_riscv_load(int argc, char **argv, const char *buf, off_t len=
,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct=
 kexec_info *info);<br>
&gt; +--- a/kexec/dt-ops.c<br>
&gt; ++++ b/kexec/dt-ops.c<br>
&gt; +@@ -4,9 +4,11 @@<br>
&gt; + #include &lt;libfdt.h&gt;<br>
&gt; + #include &lt;stdio.h&gt;<br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; ++#include &lt;stdbool.h&gt;<br>
&gt; +<br>
&gt; + #include &quot;kexec.h&quot;<br>
&gt; + #include &quot;dt-ops.h&quot;<br>
&gt; ++#include &quot;mem_regions.h&quot;<br>
&gt; +<br>
&gt; + static const char n_chosen[] =3D &quot;chosen&quot;;<br>
&gt; +<br>
&gt; +@@ -174,3 +176,441 @@ int dtb_delete_property(char *dtb, const<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0free(new_node);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return result;<br>
&gt; + }<br>
&gt; ++<br>
&gt; ++static int dtb_get_num_cells(char *dtb, int nodeoffset, uint32_t *ad=
dr_cells,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t *size_cells, bool recursive)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 const uint32_t *prop32 =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int curr_offset =3D nodeoffset;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int prop_len =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 *addr_cells =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 *size_cells =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 do {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prop32 =3D fdt_getp=
rop(dtb, curr_offset, &quot;#address-cells&quot;, &amp;prop_len);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curr_offset =3D fdt=
_parent_offset(dtb, curr_offset);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 } while (!prop32 &amp;&amp; prop_len =3D=3D -FD=
T_ERR_NOTFOUND &amp;&amp; recursive);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!prop32) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Cou=
ld not get #address-cells property for %s (%s)\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fdt_get_name(dtb, nodeoffset, NULL), fdt_strerror(nodeoff=
set));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 *addr_cells =3D fdt32_to_cpu(*prop32);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 curr_offset =3D nodeoffset;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 do {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prop32 =3D fdt_getp=
rop(dtb, curr_offset, &quot;#size-cells&quot;, &amp;prop_len);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 curr_offset =3D fdt=
_parent_offset(dtb, curr_offset);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 } while (!prop32 &amp;&amp; prop_len =3D=3D -FD=
T_ERR_NOTFOUND &amp;&amp; recursive);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!prop32) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Cou=
ld not get #size-cells property for %s (%s)\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fdt_get_name(dtb, nodeoffset, NULL), fdt_strerror(nodeoff=
set));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 *size_cells =3D fdt32_to_cpu(*prop32);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;%s: #address-cells:%d #size-cel=
ls:%d\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fdt_get_name(=
dtb, nodeoffset, NULL), *addr_cells, *size_cells);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++void dtb_extract_int_property(uint64_t *val, const void *buf, uint32=
_t cells)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 const uint32_t *prop32 =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 const uint64_t *prop64 =3D NULL;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (cells =3D=3D 1) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prop32 =3D (const u=
int32_t *) buf;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D (uint64_t)=
 be32_to_cpu(*prop32);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip any leading=
 cells */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prop64 =3D (const u=
int64_t *) (uint32_t *)buf + cells - 2;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D (uint64_t)=
 be64_to_cpu(*prop64);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++void dtb_fill_int_property(void *buf, uint64_t val, uint32_t cells)<=
br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint32_t prop32 =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t prop64 =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (cells =3D=3D 1) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prop32 =3D cpu_to_f=
dt32((uint32_t) val);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(buf, &amp;pr=
op32, sizeof(uint32_t));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prop64 =3D cpu_to_f=
dt64(val);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Skip any leading=
 cells */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy((uint64_t *)=
(uint32_t *)buf + cells - 2,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;prop64, sizeof(uint64_t));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++int dtb_add_range_property(char **dtb, off_t *dtb_size, uint64_t sta=
rt, uint64_t end,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const char *parent, const char *name)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint32_t addr_cells =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint32_t size_cells =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 char *nodepath =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 void *prop =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int nodeoffset =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int prop_size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 nodepath =3D malloc(strlen(&quot;/&quot;) + str=
len(parent) + 1);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!nodepath) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;%s:=
 malloc failed\n&quot;, __func__);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 strcpy(nodepath, &quot;/&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 strcat(nodepath, parent);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 nodeoffset =3D fdt_path_offset(*dtb, nodepath);=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (nodeoffset &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;%s:=
 fdt_path_offset(%s) failed: %s\n&quot;, __func__,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 nodepath, fdt_strerror(nodeoffset));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(nodepath);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nodeoffset;<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 free(nodepath);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D dtb_get_num_cells(*dtb, nodeoffset, &am=
p;addr_cells, &amp;size_cells, true);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Can the range fit with the given address/siz=
e cells ? */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if ((addr_cells =3D=3D 1) &amp;&amp; (start &gt=
;=3D (1ULL &lt;&lt; 32)))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if ((size_cells =3D=3D 1) &amp;&amp; ((end - st=
art + 1) &gt;=3D (1ULL &lt;&lt; 32)))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 prop_size =3D sizeof(uint32_t) * (addr_cells + =
size_cells);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 prop =3D malloc(prop_size);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dtb_fill_int_property(prop, start, addr_cells);=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dtb_fill_int_property((void *)((uint32_t *)prop=
 + addr_cells),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end - start + 1, size_cells);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Add by node path name */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return dtb_set_property(dtb, dtb_size, parent, =
name, prop, prop_size);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/************************\<br>
&gt; ++* MEMORY RANGES HANDLING *<br>
&gt; ++\************************/<br>
&gt; ++<br>
&gt; ++static int dtb_add_memory_range(struct memory_ranges *mem_ranges, ui=
nt64_t start,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t end, unsigned type)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct memory_range this_region =3D {0};<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 struct memory_range *ranges =3D mem_ranges-&gt;=
ranges;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int i =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (start =3D=3D end) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Ign=
oring empty region\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Check if we are adding an existing region */=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; mem_ranges-&gt;size; i++) =
{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (start =3D=3D ra=
nges[i].start &amp;&amp; end =3D=3D ranges[i].end) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dbgprintf(&quot;Duplicate: 0x%lx - 0x%lx\n&quot;, start, end);<b=
r>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (type =3D=3D ranges[i].type)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 else if (type =3D=3D RANGE_RESERVED) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ranges[i].type =3D RANGE_RESERVED;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dbgprintf(&quot;Conflicting types for region: 0x%lx - 0x%lx\n&qu=
ot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start, end);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Reserved regions may be part of an exis=
ting /memory<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* region and shouldn&#39;t overlap accord=
ing to spec, so<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* since we add /memory regions first, we =
can exclude<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* reserved regions here from the existing=
 /memory regions<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* included in ranges[], so that we don&#3=
9;t have the same<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* region twice.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (type =3D=3D RANGE_RESERVED) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this_region.start =
=3D start;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this_region.end =3D=
 end - 1;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this_region.type =
=3D type;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D mem_regions=
_exclude(mem_ranges, &amp;this_region);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D mem_regions_alloc_and_add(mem_ranges, s=
tart,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end - st=
art, type);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static int dtb_add_memory_region(char *dtb, int nodeoffset,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct memory_ranges *mem_rang=
es, int type)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint32_t root_addr_cells =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint32_t root_size_cells =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t addr =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 const char *reg =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int prop_size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int offset =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int entry_size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int num_entries =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Get address-cells and size-cells proper=
ties (according to<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* binding spec these are the same as in t=
he root node)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D dtb_get_num_cells(dtb, 0, &amp;root_add=
r_cells, &amp;root_size_cells, false);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;No =
address/size cells on root node !\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* Parse the reg array, acording to device=
 tree spec it includes<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0* an arbitary number of &lt;address&gt;&l=
t;size&gt; pairs<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 entry_size =3D (root_addr_cells + root_size_cel=
ls) * sizeof(uint32_t);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 reg =3D fdt_getprop(dtb, nodeoffset, &quot;reg&=
quot;, &amp;prop_size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!reg) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;War=
ning: Malformed memory region with no reg property (%s) !\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fdt_get_name(dtb, nodeoffset, NULL));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 num_entries =3D prop_size / entry_size;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Got region with %i entries: %s\=
n&quot;, num_entries,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_get_name=
(dtb, nodeoffset, NULL));<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for (num_entries--; num_entries &gt;=3D 0; num_=
entries--) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D num_entr=
ies * entry_size;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_extract_int_pro=
perty(&amp;addr, reg + offset,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ro=
ot_addr_cells);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset +=3D root_ad=
dr_cells * sizeof(uint32_t);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_extract_int_pro=
perty(&amp;size, reg + offset,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ro=
ot_size_cells);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dtb_add_mem=
ory_range(mem_ranges, addr,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0addr + size, type);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static int dtb_parse_memory_reservations_table(char *dtb, struct mem=
ory_ranges *mem_ranges)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int total_memrsrv =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t addr =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint64_t size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int i =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 total_memrsrv =3D fdt_num_mem_rsv(dtb);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; total_memrsrv; i++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fdt_get_mem=
_rsv(dtb, i, &amp;addr, &amp;size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dtb_add_mem=
ory_range(mem_ranges, addr, addr + size - 1,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0RANGE_RESERVED);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static int dtb_get_reserved_memory_node(char *dtb)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint32_t root_addr_cells =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint32_t root_size_cells =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint32_t addr_cells =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 uint32_t size_cells =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int prop_size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int nodeoffset =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Get address / size cells from root node */<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D dtb_get_num_cells(dtb, 0, &amp;root_add=
r_cells, &amp;root_size_cells, false);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;No =
address/size cells on root node !\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* This calls fdt_next_node internaly */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 nodeoffset =3D fdt_subnode_offset(dtb, 0, &quot=
;reserved-memory&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (nodeoffset =3D=3D -FDT_ERR_NOTFOUND) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nodeoffset;<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 } else if (nodeoffset &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Err=
or while looking for reserved-memory: %s\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fdt_strerror(nodeoffset));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nodeoffset;<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Look for the ranges property */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 fdt_getprop(dtb, nodeoffset, &quot;ranges&quot;=
, &amp;prop_size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (prop_size &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Malformed reserved-memory node (no ranges property) !\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Verify address-cells / size-cells */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D dtb_get_num_cells(dtb, nodeoffset, &amp=
;addr_cells, &amp;size_cells, false);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;No =
address/size cells property on reserved-memory node\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (addr_cells !=3D root_addr_cells) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Invalid #address-cells property on reserved-memory node\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (size_cells !=3D root_size_cells) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &qu=
ot;Invalid #size-cells property on reserved-memory node\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return nodeoffset;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static int dtb_parse_reserved_memory_node(char *dtb, struct memory_r=
anges *mem_ranges)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int nodeoffset =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int node_depth =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int parent_depth =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 nodeoffset =3D dtb_get_reserved_memory_node(dtb=
);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (nodeoffset =3D=3D -FDT_ERR_NOTFOUND)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 else if (nodeoffset &lt; 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return nodeoffset;<=
br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Got the parent node, check for sub-nodes */<=
br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* fdt_next_node() increases or decreases depth=
 */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 node_depth =3D parent_depth;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 nodeoffset =3D fdt_next_node(dtb, nodeoffset, &=
amp;node_depth);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Una=
ble to get next node: %s\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fdt_strerror(ret));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 while (node_depth !=3D parent_depth) {<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dtb_add_mem=
ory_region(dtb, nodeoffset,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 mem_ranges, RANGE_RESERVED);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodeoffset =3D fdt_=
next_node(dtb, nodeoffset, &amp;node_depth);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dbgprintf(&quot;Unable to get next node: %s\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_strerror(ret));<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static int dtb_parse_memory_nodes(char *dtb, struct memory_ranges *m=
em_ranges)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int nodeoffset =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int num_regions =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 const char* dev_type =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int prop_size =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for (; ; num_regions++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodeoffset =3D fdt_=
subnode_offset(dtb, nodeoffset,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;memory&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nodeoffset &lt;=
 0)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 break;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Got=
 memory node at depth: %i\n&quot;, fdt_node_depth(dtb, nodeoffset));<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Look for the dev=
ice_type=C2=A0 property */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_type =3D fdt_ge=
tprop(dtb, nodeoffset, &quot;device_type&quot;, &amp;prop_size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (prop_size &lt; =
0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 fprintf(stderr, &quot;Malformed /memory node (no device-type pro=
perty) !\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strncmp(dev_typ=
e, &quot;memory&quot;, prop_size)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dbgprintf(&quot;Got unknown dev_type property: %s\n&quot;, dev_t=
ype);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dtb_add_mem=
ory_region(dtb, nodeoffset, mem_ranges, RANGE_RAM);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!num_regions) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Mal=
formed dtb, no /memory nodes present !\n&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Got %i /memory nodes\n&quot;, n=
um_regions);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++int dtb_get_memory_ranges(char *dtb, struct memory_ranges *mem_range=
s, struct memory_ranges *extra_ranges)<br>
&gt; ++{<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int i =3D 0;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Fill mem_ranges[] by parsing the device tree=
 */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D dtb_parse_memory_nodes(dtb, mem_ranges)=
;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D dtb_parse_memory_reservations_table(dtb=
, mem_ranges);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ret =3D dtb_parse_reserved_memory_node(dtb, mem=
_ranges);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 /* Append any extra ranges provided by the call=
er (e.g. initrd) */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; extra_ranges !=3D NULL &amp;&amp;=
 i &lt; extra_ranges-&gt;size; i++) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;Add=
ing extra range: 0x%llx - 0x%llx (%s)\n&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 extra_ranges-&gt;ranges[i].start,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 extra_ranges-&gt;ranges[i].end,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 extra_ranges-&gt;ranges[i].type =3D=3D RANGE_RESERVED ?<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;RANGE_RESERVED&quot; : &quot;RANGE_RAM&quot;=
);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dtb_add_mem=
ory_range(mem_ranges, extra_ranges-&gt;ranges[i].start,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra_ranges-&gt;ranges[i].en=
d, extra_ranges-&gt;ranges[i].type);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return ret;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 mem_regions_sort(mem_ranges);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; ++}<br>
&gt; +--- a/kexec/dt-ops.h<br>
&gt; ++++ b/kexec/dt-ops.h<br>
&gt; +@@ -11,4 +11,11 @@ int dtb_set_property(char **dtb, off_t *<br>
&gt; +<br>
&gt; + int dtb_delete_property(char *dtb, const char *node, const char *pro=
p);<br>
&gt; +<br>
&gt; ++void dtb_extract_int_property(uint64_t *val, const void *buf, uint32=
_t cells);<br>
&gt; ++void dtb_fill_int_property(void *buf, uint64_t val, uint32_t cells);=
<br>
&gt; ++int dtb_add_range_property(char **dtb, off_t *dtb_size, uint64_t sta=
rt, uint64_t end,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *node, const char* parent);<br>
&gt; ++int dtb_get_memory_ranges(char *dtb, struct memory_ranges *mem_range=
s,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct memory_ranges *extra_ranges);<br>
&gt; ++<br>
&gt; + #endif<br>
&gt; +--- a/kexec/kexec-syscall.h<br>
&gt; ++++ b/kexec/kexec-syscall.h<br>
&gt; +@@ -140,6 +140,7 @@ static inline long kexec_file_load(int k<br>
&gt; + #define KEXEC_ARCH_MIPS_LE (10 &lt;&lt; 16)<br>
&gt; + #define KEXEC_ARCH_MIPS=C2=A0 =C2=A0 ( 8 &lt;&lt; 16)<br>
&gt; + #define KEXEC_ARCH_CRIS=C2=A0 =C2=A0 (76 &lt;&lt; 16)<br>
&gt; ++#define KEXEC_ARCH_RISCV=C2=A0 =C2=A0(243 &lt;&lt; 16)<br>
&gt; + #define KEXEC_ARCH_LOONGARCH=C2=A0 (258 &lt;&lt; 16)<br>
&gt; +<br>
&gt; + #define KEXEC_MAX_SEGMENTS 16<br>
&gt; +@@ -184,6 +185,9 @@ static inline long kexec_file_load(int k<br>
&gt; + #if defined(__arm64__)<br>
&gt; + #define KEXEC_ARCH_NATIVE=C2=A0 =C2=A0 =C2=A0KEXEC_ARCH_ARM64<br>
&gt; + #endif<br>
&gt; ++#if defined(__riscv__) || defined(__riscv)<br>
&gt; ++#define KEXEC_ARCH_NATIVE=C2=A0 =C2=A0 =C2=A0KEXEC_ARCH_RISCV<br>
&gt; ++#endif<br>
&gt; + #if defined(__loongarch__)<br>
&gt; + #define KEXEC_ARCH_NATIVE=C2=A0 =C2=A0 =C2=A0KEXEC_ARCH_LOONGARCH<br=
>
&gt; + #endif<br>
&gt; +--- a/purgatory/Makefile<br>
&gt; ++++ b/purgatory/Makefile<br>
&gt; +@@ -25,6 +25,7 @@ include $(srcdir)/purgatory/arch/ia64/Ma<br>
&gt; + include $(srcdir)/purgatory/arch/mips/Makefile<br>
&gt; + include $(srcdir)/purgatory/arch/ppc/Makefile<br>
&gt; + include $(srcdir)/purgatory/arch/ppc64/Makefile<br>
&gt; ++include $(srcdir)/purgatory/arch/riscv/Makefile<br>
&gt; + include $(srcdir)/purgatory/arch/s390/Makefile<br>
&gt; + include $(srcdir)/purgatory/arch/sh/Makefile<br>
&gt; + include $(srcdir)/purgatory/arch/x86_64/Makefile<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/purgatory/arch/riscv/Makefile<br>
&gt; +@@ -0,0 +1,7 @@<br>
&gt; ++#<br>
&gt; ++# Purgatory riscv<br>
&gt; ++#<br>
&gt; ++<br>
&gt; ++riscv_PURGATORY_SRCS =3D<br>
&gt; ++<br>
&gt; ++dist +=3D purgatory/arch/sh/Makefile $(riscv_PURGATORY_SRCS)<br>
&gt; diff --git a/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2=
.0.31.bb" rel=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.31.bb</a> b/=
meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.31.bb" rel=3D"n=
oreferrer" target=3D"_blank">kexec-tools_2.0.31.bb</a><br>
&gt; index b12f76a0bf..f61c8a6c49 100644<br>
&gt; --- a/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.31.b=
b" rel=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.31.bb</a><br>
&gt; +++ b/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.31.b=
b" rel=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.31.bb</a><br>
&gt; @@ -20,6 +20,8 @@ SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/utils/ke=
rnel/kexec/kexec-tools-${PV}.tar.gz<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-kexec.c-add=
-MFD_NOEXEC_SEAL-flag-explicitly.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-ppc-fs2dt-M=
atch-function-signatures.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Make-the-se=
gment-base-match-pinned-section-address.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://riscv64-support.patch=
 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://riscv64-hotplug-suppo=
rt.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;ddaaa65b02b4f8aa9222586b1f26565b93a=
4baeffd35bcbd523f15fae7aa4897&quot;<br>
&gt; @@ -86,7 +88,7 @@ SYSTEMD_SERVICE:kdump =3D &quot;kdump.service&quot;<=
br>
&gt;<br>
&gt;=C2=A0 SECURITY_PIE_CFLAGS:remove =3D &quot;-fPIE -pie&quot;<br>
&gt;<br>
&gt; -COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|m=
ips.*)-(linux|freebsd.*)&#39;<br>
&gt; +COMPATIBLE_HOST =3D &#39;(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|m=
ips.*|riscv64.*)-(linux|freebsd.*)&#39;<br>
&gt;=C2=A0 # makedumpfile would not compile on mips/rv32<br>
&gt;=C2=A0 COMPATIBLE_HOST:mipsarcho32 =3D &quot;null&quot;<br>
&gt;=C2=A0 COMPATIBLE_HOST:riscv32 =3D &quot;null&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#227617): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/227617" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/227617</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11676035=
7/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/116760357/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000002e8f310645fb6c2e--

