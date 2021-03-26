Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.8286.1616733626401731396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 21:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZxVbGBZf;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id h7so3471186qtx.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 21:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sr8/VNk4HuK1eKXHrprtxrJnuDx/VPjzKihahMqQq8U=;
        b=ZxVbGBZfTP6pvJgkVI7y5M15DKOeLPYi1FWX3BVO/awXzpzEmKf2HcxXOFF0pI7Kfg
         uUz4M8RbSw5vjAMMlo08H/YeZqN+TO6rX7kWn8js7GfBZeImrIgLpfdnnosk6JO6P2QP
         EAe4FW1dSlv+qjuG6YfmCqUq4cVPig3zTTZ5QTiowzDIJUm0KozweZurdCVnCoJjn34i
         hZ+EDIirSJApzJ+A+SyQHWdNTfjpcNM/f8lpnYwndPI9fdzEl62mKtHHaFf21nPQL3I7
         w8JFzRsygH7LK7WVjV7le+e46N7TP9I782JtktsimL2R7TqKu3E+vOX5G2NFZuq5fzxN
         W9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sr8/VNk4HuK1eKXHrprtxrJnuDx/VPjzKihahMqQq8U=;
        b=n/ddH6apIuPeQMUanGrBOY4hxmL6jXUoDqf5ofnb8lp/QeVIIHPriZu5+7tvcOrkPk
         tev/5BXxp2j44j6qRjjyRpBGN2AKhSltgg3GDTjOJ2PaJb6ghwtz2BWUq7pm4Up92cEK
         lYX4D75P5TPXy75Oo4qPeshwdLXbMy76b/htfSphOB0NMVUmD4Hk6ozfVMEbSoDnvanu
         tU3I+a9XITvRuCgoPJ33Hj5BSnNDInUWGq6lOsStNob362pwuhJWZYO4sM2EaR7BlLy5
         TMe0FEejxq18T1K5lvLUzBkXudj/qwDs7cCLavgMAASgxSQsSwW8FoPCA9qu4vcs0ZnH
         /f0A==
X-Gm-Message-State: AOAM531Rh6ZpLFroKCavQRBRZec8LICVAAswevlhOY66283St8NjxLQ9
	NrdYIc5E0b270FGxqshqc3ozpBbM7HxPc0DfQyg=
X-Google-Smtp-Source: ABdhPJxyExGvvIH41P5AKEccSHGF/wN7YtOflum1/+H3MfWzbAMIfDhwyeLMM2wMwq/P8SoV/P0fMCeLrwLM+rPtwTE=
X-Received: by 2002:ac8:5a46:: with SMTP id o6mr10725956qta.289.1616733625534;
 Thu, 25 Mar 2021 21:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210325041506.3558560-1-raj.khem@gmail.com> <CAKmqyKP2u+86DvWL8mJ1M=63R7brSqinsgmfa4SO+q3Fowuz2Q@mail.gmail.com>
In-Reply-To: <CAKmqyKP2u+86DvWL8mJ1M=63R7brSqinsgmfa4SO+q3Fowuz2Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 25 Mar 2021 21:39:59 -0700
Message-ID: <CAMKF1sr3zTkJVToPdT3WqFAnrBpuC7mS0M-uqj2dWKjvoZrGNA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] grub-efi: Fix build failure on RISCV32
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 25, 2021 at 12:48 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Mar 25, 2021 at 12:15 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Alistair Francis <alistair.francis@wdc.com>
>
> I'm not sure if this is the right thing to do here.
>
> Have you tested this does GRUB boot with this check removed?
>

I have not run it no, but inspected the generate PE file and they look
ok. however, I think we should drop
this patch and instead just disable grub on rv32 until such time when
port is available. I have send a follow up
patch for that.


> From memory I don't think the original GRUB port would have been tested on RV32.
>
> Alistair
>
> > ---
> >  ...sable-offset-overflow-check-for-rv32.patch | 45 +++++++++++++++++++
> >  meta/recipes-bsp/grub/grub2.inc               |  1 +
> >  2 files changed, 46 insertions(+)
> >  create mode 100644 meta/recipes-bsp/grub/files/0001-Disable-offset-overflow-check-for-rv32.patch
> >
> > diff --git a/meta/recipes-bsp/grub/files/0001-Disable-offset-overflow-check-for-rv32.patch b/meta/recipes-bsp/grub/files/0001-Disable-offset-overflow-check-for-rv32.patch
> > new file mode 100644
> > index 0000000000..6547bf2261
> > --- /dev/null
> > +++ b/meta/recipes-bsp/grub/files/0001-Disable-offset-overflow-check-for-rv32.patch
> > @@ -0,0 +1,45 @@
> > +From ce1cea0563011698e4a70c9a60e7da66b57ab1d6 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 24 Mar 2021 20:55:56 -0700
> > +Subject: [PATCH] Disable offset overflow check for rv32
> > +
> > +Fixes
> > +/tmp/grub/grub-mkimage: error: target 17c6 not reachable from pc=936.
> > +
> > +Upstream-Status: Reported [https://savannah.gnu.org/bugs/index.php?60283]
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + util/grub-mkimagexx.c | 6 ++++--
> > + 1 file changed, 4 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
> > +index 00f49ccaa..6deb66226 100644
> > +--- a/util/grub-mkimagexx.c
> > ++++ b/util/grub-mkimagexx.c
> > +@@ -1297,9 +1297,10 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, struct section_metadata *smd,
> > +                    {
> > +                      grub_uint32_t hi20, lo12;
> > +
> > ++#ifdef MKIMAGE_ELF64
> > +                      if (off != (grub_int32_t)off)
> > +                        grub_util_error ("target %lx not reachable from pc=%lx", (long)sym_addr, (long)((char *)target - (char *)e));
> > +-
> > ++#endif
> > +                      hi20 = (off + 0x800) & 0xfffff000;
> > +                      lo12 = (off - hi20) & 0xfff;
> > +                      t32[0] = grub_host_to_target32 ((grub_target_to_host32 (t32[0]) & 0xfff) | hi20);
> > +@@ -1336,9 +1337,10 @@ SUFFIX (relocate_addrs) (Elf_Ehdr *e, struct section_metadata *smd,
> > +                    {
> > +                      grub_int32_t hi20;
> > +
> > ++#ifdef MKIMAGE_ELF64
> > +                      if (off != (grub_int32_t)off)
> > +                        grub_util_error ("target %lx not reachable from pc=%lx", (long)sym_addr, (long)((char *)target - (char *)e));
> > +-
> > ++#endif
> > +                      hi20 = (off + 0x800) & 0xfffff000;
> > +                      *t32 = grub_host_to_target32 ((grub_target_to_host32 (*t32) & 0xfff) | hi20);
> > +                    }
> > +--
> > +2.31.0
> > +
> > diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> > index bcff676c26..d8a556e06c 100644
> > --- a/meta/recipes-bsp/grub/grub2.inc
> > +++ b/meta/recipes-bsp/grub/grub2.inc
> > @@ -19,6 +19,7 @@ SRC_URI = "https://alpha.gnu.org/gnu/grub/grub-${REALPV}.tar.xz \
> >             file://grub-module-explicitly-keeps-symbole-.module_license.patch \
> >             file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
> >             file://determinism.patch \
> > +           file://0001-Disable-offset-overflow-check-for-rv32.patch \
> >  "
> >
> >  SRC_URI[sha256sum] = "2c87f1f21e2ab50043e6cd9163c08f1b6c3a6171556bf23ff9ed65b074145484"
> > --
> > 2.31.0
> >
> >
> > 
> >
