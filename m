Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BBAC5472F
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 13:30:23 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.78495.1724765421705933956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 06:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0miAK+59;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.179, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-691bb56eb65so47175687b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724765421; x=1725370221; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AECkcNqymb2TRSkym5nHYpFT5TyMSYd9CRytxnLnHcQ=;
        b=0miAK+59SSmL9hzilx+4UAyRuFrU2TM8TGWtiGPpPNIX9wARxRbeS9EwzHavwN6IL0
         /bboM5JopqaQvzk+dk0NiBLUegNmwrhl2pz14v3drzG9TT+MyaUjuZToV0zuxUAqUr/X
         1FximkhMGKC9p8jhkE/l8mpFc4+revFz6a4tJ62WMBlSvMrEfYoerW085GpxuoyIpob7
         IgOdDULVeUKxbtWyggVePNhAgsocxGm3JRct29pLoKsuSA/zsYjMdm45f4LkR5CiYTV8
         pyLzNPw1Dlt/L+Wx7a20pXzGER0XhMGKHZ8VOyT3stN2/qanpvhuf3tiuzDA25GKfAqz
         PjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724765421; x=1725370221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AECkcNqymb2TRSkym5nHYpFT5TyMSYd9CRytxnLnHcQ=;
        b=CR87im9k2SsE/MpvdzT5gbsjcdIYY5gAbvQ/eRMpbpplGelJq80O2WGKiiBJJXNQUJ
         1/uI2Mqqx+U+uOIaUqRuamYH5M74iHF/rMicl4sh9UFuKx7dLhJTP4Wyv6OpoQIUX5OK
         2jtegUMlZ+A5BHMma4jYNXXB3ZtvgZTISOZjO58/XTqe1UPmksBp7XBiXOvzM/EnBq+6
         Vq4MDbfcLaGDjk/alejNI3u6eah6TD/y3/Bx8bjrhtN3tZfyNWsvxLNnsj8/D/pL7oXC
         MRflMt8cmJBfVl+Ns2BaMqDukW9HBSd/ZASBTYtk49DIk9kvH/Sog5ckfQGox804aSFp
         G1dg==
X-Forwarded-Encrypted: i=1; AJvYcCVe74+Il2bgdVKuUqC/bttmWJQZrvBniPc7pVtzgt5SzdwrwGOH5ZyPfxydWKi4rjOiISCOkIWpq63eeq5kju76Qw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxUE7giyEMl//5B9eX0Onx0jpvEsf08tcu88n7rWC2f0uZrN07U
	SlRvJxprtZlZcI82mEaQljHlVWOKN/hc5gF2BUMCUhEqONtxm5gEDx26uCxwCaqghg3tC7QN4Tx
	9ACcfmYyL5OOB9Ddi+wPuCGSidk9hDy5aFvN3aQ==
X-Google-Smtp-Source: AGHT+IFQSjSNhby9QlHH4LYv9ueo2u51/XJT5e/VH+3i/gj4gB9PPVb7FcZwKt6EIUO2jplS6NiztRnIi9Jkb0+jjOQ=
X-Received: by 2002:a05:690c:3510:b0:6b1:8834:1588 with SMTP id
 00721157ae682-6cfbbbd3dbfmr34975727b3.35.1724765420654; Tue, 27 Aug 2024
 06:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240826135702.3956243-1-archana.polampalli@windriver.com> <39eb6b48-c5a6-4fe2-9719-aa9d100ea022@windriver.com>
In-Reply-To: <39eb6b48-c5a6-4fe2-9719-aa9d100ea022@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 27 Aug 2024 06:30:08 -0700
Message-ID: <CAOSpxdYdRcYhqCSkX=HfpeE_3GOne6yd5bzb6ofH8anPBx_wQQ@mail.gmail.com>
Subject: Re: [oe-core][scarthgap][PATCH 1/1] qemu: fix CVE-2024-7409
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: archana.polampalli@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 13:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203843

On Mon, Aug 26, 2024 at 1:19=E2=80=AFPM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2024-08-26 9:57 a.m., Polampalli, Archana via lists.openembedded.org w=
rote:
>
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> A flaw was found in the QEMU NBD Server. This vulnerability allows a deni=
al of service (DoS) attack
> via improper synchronization during socket closure when a client keeps a =
socket open as the server
> is taken offline.
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |   4 +
>  .../qemu/qemu/CVE-2024-7409-0001.patch        | 167 +++++++++++++++++
>  .../qemu/qemu/CVE-2024-7409-0002.patch        | 175 ++++++++++++++++++
>  .../qemu/qemu/CVE-2024-7409-0003.patch        | 126 +++++++++++++
>  .../qemu/qemu/CVE-2024-7409-0004.patch        | 164 ++++++++++++++++
>  5 files changed, 636 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.pa=
tch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0002.pa=
tch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0003.pa=
tch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0004.pa=
tch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 50d92b04bd..a1d8a309a0 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -45,6 +45,10 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
>             file://CVE-2024-4467-0003.patch \
>             file://CVE-2024-4467-0004.patch \
>             file://CVE-2024-4467-0005.patch \
> +           file://CVE-2024-7409-0001.patch \
> +           file://CVE-2024-7409-0002.patch \
> +           file://CVE-2024-7409-0003.patch \
> +           file://CVE-2024-7409-0004.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
> new file mode 100644
> index 0000000000..631e93a6d2
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-7409-0001.patch
> @@ -0,0 +1,167 @@
> +From fb1c2aaa981e0a2fa6362c9985f1296b74f055ac Mon Sep 17 00:00:00 2001
> +From: Eric Blake <eblake@redhat.com>
> +Date: Wed, 7 Aug 2024 08:50:01 -0500
> +Subject: [PATCH] nbd/server: Plumb in new args to nbd_client_add()
> +
> +Upcoming patches to fix a CVE need to track an opaque pointer passed
> +in by the owner of a client object, as well as request for a time
> +limit on how fast negotiation must complete.  Prepare for that by
> +changing the signature of nbd_client_new() and adding an accessor to
> +get at the opaque pointer, although for now the two servers
> +(qemu-nbd.c and blockdev-nbd.c) do not change behavior even though
> +they pass in a new default timeout value.
> +
> +Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> +Signed-off-by: Eric Blake <eblake@redhat.com>
> +Message-ID: <20240807174943.771624-11-eblake@redhat.com>
> +Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> +[eblake: s/LIMIT/MAX_SECS/ as suggested by Dan]
> +Signed-off-by: Eric Blake <eblake@redhat.com>
> +
> +CVE: CVE-2024-7409
> +
> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/fb1c2aaa9=
81e0a2fa6362c9985f1296b74f055ac]
>
>
> I don't see this commit being backported to the stable-8.2 branch
> so this manual backport makes sense.
>
> Nevertheless, it does seem like we're behind by a couple of point release=
s:
>
> https://github.com/qemu/qemu/commits/stable-8.2/
>
> 8.2.5 is latest and 8.2.6 is being prepped. See below for the 63 (87) bug=
 fix shortlogs.
>
>
> Steve, Archana,
>
> How about we merge this and then do an update once 8.2.6 is out?

That works for me.

Steve

>
> ../Randy
>
>
> poky.git on scarthgap
> =E2=9D=AF fd qemu_
> meta/recipes-devtools/qemu/qemu_8.2.3.bb
>
> qemu.git on stable-8.2
> =E2=9D=AF git log --oneline v8.2.3..HEAD | wc -l
> 87
>
> =E2=9D=AF git log --oneline v8.2.3..v8.2.5 | wc -l
> 63
>
> =E2=9D=AF git log --oneline v8.2.3..v8.2.5
> 909772f0a5 (tag: v8.2.5) Update version for 8.2.5 release
> 6feae1d0dd target/loongarch: fix a wrong print in cpu dump
> af008b379c ui/sdl2: Allow host to power down screen
> 276ec925a7 target/i386: fix SSE and SSE2 feature check
> d84afebcee target/i386: fix xsave.flat from kvm-unit-tests
> 2891807479 disas/riscv: Decode all of the pmpcfg and pmpaddr CSRs
> ae5edeb084 target/riscv/kvm.c: Fix the hart bit setting of AIA
> 935be461eb target/riscv: rvzicbo: Fixup CBO extension register calculatio=
n
> 37d6c6e495 target/riscv: do not set mtval2 for non guest-page faults
> 6da92af4f9 target/riscv: prioritize pmp errors in raise_mmu_exception()
> 0f9578497c target/riscv: rvv: Remove redudant SEW checking for vector fp =
narrow/widen instructions
> 909772f0a5 (tag: v8.2.5) Update version for 8.2.5 release
> 6feae1d0dd target/loongarch: fix a wrong print in cpu dump
> af008b379c ui/sdl2: Allow host to power down screen
> 276ec925a7 target/i386: fix SSE and SSE2 feature check
> d84afebcee target/i386: fix xsave.flat from kvm-unit-tests
> 2891807479 disas/riscv: Decode all of the pmpcfg and pmpaddr CSRs
> ae5edeb084 target/riscv/kvm.c: Fix the hart bit setting of AIA
> 935be461eb target/riscv: rvzicbo: Fixup CBO extension register calculatio=
n
> 37d6c6e495 target/riscv: do not set mtval2 for non guest-page faults
> 6da92af4f9 target/riscv: prioritize pmp errors in raise_mmu_exception()
> 0f9578497c target/riscv: rvv: Remove redudant SEW checking for vector fp =
narrow/widen instructions
> c4173e4caf target/riscv: rvv: Check single width operator for vfncvt.rod.=
f.f.w
> d813f356ad target/riscv: rvv: Check single width operator for vector fp w=
iden instructions
> 749907f857 target/riscv: rvv: Fix Zvfhmin checking for vfwcvt.f.f.v and v=
fncvt.f.f.w instructions
> 4cba687b86 target/riscv/cpu.c: fix Zvkb extension config
> ec182b1045 target/riscv: Fix the element agnostic function problem
> cf7143fdb7 target/riscv/kvm: tolerate KVM disable ext errors
> cd1228a80e hw/intc/riscv_aplic: APLICs should add child earlier than real=
ize
> b9b2f3bbab iotests: test NBD+TLS+iothread
> 9a6143a73e qio: Inherit follow_coroutine_ctx across TLS
> 71c7036b18 target/arm: Disable SVE extensions when SVE is disabled
> 3f470980b4 hw/intc/arm_gic: Fix handling of NS view of GICC_APR<n>
> 0970313b05 hvf: arm: Fix encodings for ID_AA64PFR1_EL1 and debug System r=
egisters
> 8965709b86 gitlab: use 'setarch -R' to workaround tsan bug
> 3b36dd0005 gitlab: use $MAKE instead of 'make'
> fc88204b82 dockerfiles: add 'MAKE' env variable to remaining containers
> ca0799624e gitlab: Update msys2-64bit runner tags
> 52031d6be5 target/i386: no single-step exception after MOV or POP SS
> c6171d524d target/i386: disable jmp_opt if EFLAGS.RF is 1
> 93fa768d40 hw/loongarch/virt: Fix FDT memory node address width
> d679c82488 hw/loongarch: Fix fdt memory node wrong 'reg'
> e3a2aa9542 hw/core/machine: move compatibility flags for VirtIO-net USO t=
o machine 8.1
> 9b98ab7d3d target-i386: hyper-v: Correct kvm_hv_handle_exit return value
> 90e023f2bc tcg/loongarch64: Fill out tcg_out_{ld,st} for vector regs
> 355527b646 ui/gtk: Check if fence_fd is equal to or greater than 0
> f44d2398d8 ui/gtk: Fix mouse/motion event scaling issue with GTK display =
backend
> 05bfa963df configure: Fix error message when C compiler is not working
> 19a931f207 configure: quote -D options that are passed through to meson
> 2b95625643 target/i386: fix feature dependency for WAITPKG
> 1cc3cb96b8 target/i386: rdpkru/wrpkru are no-prefix instructions
> eb761b4ee5 target/i386: fix operand size for DATA16 REX.W POPCNT
> 7d7b770bde hw/remote/vfio-user: Fix config space access byte order
> 7dbebba4a5 hw/loongarch/virt: Fix memory leak
> 819f92ec3e target/sparc: Fix FMUL8x16
> d3da3d02a0 target/sparc: Fix FEXPAND
> 50ed4f856a target/i386: Give IRQs a chance when resetting HF_INHIBIT_IRQ_=
MASK
> 1332b8dd43 (tag: v8.2.4) Update version for 8.2.4 release
> 07d46408cb target/sh4: Fix SUBV opcode
> dc5390a0ca target/sh4: Fix ADDV opcode
> 7b4804c965 hw/arm/npcm7xx: Store derivative OTP fuse key in little endian
> dfcbb9ef24 hw/dmax/xlnx_dpdma: fix handling of address_extension descript=
or fields
> d5cf8bed29 hw/ufs: Fix buffer overflow bug
>
>
>
> ><snip><
>
>
> --
> # Randy MacLeod
> # Wind River Linux

