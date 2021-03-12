Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.1368.1615507524376388362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 16:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I4+F1rbc;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id z190so22614035qka.9
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 16:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XOGXu3kcWXOVfQB0z5O+dY8XxWQTB04LEwGYQLSQ+Dc=;
        b=I4+F1rbcBMrZbT4XHfj6QSJfIKKtsMG//E8atnFYHUkLt2I4ZSkKGhldmJTVI8ciWi
         Dpq/2/qD2coldx//MqN91aHQe56lcqM5zvg7I8NrjgFaT4gYj4KaD+TLo72MCvFtBs76
         rsXNUWMqf6kKyR6xPz0x+NtFUw4if2ghxq1yLjlEs7orVl1/mVF7O+GUS15WwmElBJCs
         UsMxWmtFMm70OqzPafPXx2atnDaLioPpelLxfv5UVPVbLGp1VsaN7gOoXQsSsYMuxeFW
         8Zfd18VDVGzKKzhXGNMEwdLLXJ+/pBVqumXJCVRqQaT8lYr0c5f1O8n5Rfwo6sIlc8Oj
         iVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XOGXu3kcWXOVfQB0z5O+dY8XxWQTB04LEwGYQLSQ+Dc=;
        b=NDFGbPc7aXj+zElbdMJiHVu6plYj3rNCAwc9ny8ltQfPibyya6scBtRBbf7eyUXP0O
         OwoHZzH1YT7Ousmw3HZjEm2ysBBmFFLCQZPOwpn+3NGhOHq8mX8SCEoe+P7lDoEa2YDd
         f2+ht4MIm3Kz8VKCtt6sQfopn0vhDUQ3NWPDZGWH+shf7zmdascB9aTIDbYtFBselBOa
         isFHJZjI8mXAAAgJ2n+8aOHgwyigatH7cOm4wlTyeXTcp9UbcTbYWTQVPm/qyjAo/NHz
         pniCge9M1SkoKRIBw/wepZGKOeYbjgerU/C8xXwR3WTHhl1AyvPfSsezKmmfRwPd8ICk
         ze7A==
X-Gm-Message-State: AOAM531ehVZs1uCW6b/D5AqMFwmGl8gHiCcV7MsO8gLP9IFGLe5i2Yw3
	jZrWk8SjdCfN3NyDGoC1CWX5yg7Su5EjJAs0Sh4=
X-Google-Smtp-Source: ABdhPJyzwOK7uhKfpiKZkApYf7d8WVCN9JeZmrExOFELjGxGN4jmnyNgOd/1J/o5WALFRgLDlu4YCBfnVH6i3Qer3KA=
X-Received: by 2002:a05:620a:a12:: with SMTP id i18mr10316357qka.119.1615507523477;
 Thu, 11 Mar 2021 16:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20210311143714.3294960-1-alistair.francis@wdc.com> <c143615e770fa5b75147cb3dc82033b31ce9a034.camel@linuxfoundation.org>
In-Reply-To: <c143615e770fa5b75147cb3dc82033b31ce9a034.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Mar 2021 16:04:57 -0800
Message-ID: <CAMKF1srSbPfVkg-0=+z5BPXs3dQXTY4mp7eMcRjFtKXPBYfv4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] u-boot: Add support for building for qemuriscv32
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 3:04 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-03-11 at 06:37 -0800, Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta/conf/machine/qemuriscv32.conf            |  7 ++--
> >  ...iscv32-Use-double-float-ABI-for-rv32.patch | 42 +++++++++++++++++++
> >  meta/recipes-bsp/u-boot/u-boot_2021.01.bb     |  2 +
> >  3 files changed, 47 insertions(+), 4 deletions(-)
> >  create mode 100644 meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
> >
> > diff --git a/meta/conf/machine/qemuriscv32.conf b/meta/conf/machine/qemuriscv32.conf
> > index 1413775ad6..d3858dc051 100644
> > --- a/meta/conf/machine/qemuriscv32.conf
> > +++ b/meta/conf/machine/qemuriscv32.conf
> > @@ -11,7 +11,6 @@ PREFERRED_VERSION_openocd = "riscv"
> >
> >
> >
> >
> >  XVISOR_PLAT = "riscv/virt32"
> >
> >
> >
> >
> > -# u-boot doesn't compile, error: "can't link hard-float modules with soft-float modules"
> > -# EXTRA_IMAGEDEPENDS += "u-boot"
> > -# UBOOT_MACHINE = "qemu-riscv32_smode_defconfig"
> > -# UBOOT_ELF = "u-boot"
> > +EXTRA_IMAGEDEPENDS += "u-boot"
> > +UBOOT_MACHINE = "qemu-riscv32_smode_defconfig"
> > +UBOOT_ELF = "u-boot"
> > diff --git a/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch b/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
> > new file mode 100644
> > index 0000000000..55b649db50
> > --- /dev/null
> > +++ b/meta/recipes-bsp/u-boot/files/0001-riscv32-Use-double-float-ABI-for-rv32.patch
> > @@ -0,0 +1,42 @@
> > +From 66dfe0fa886f6289add06d1af8642ce2b5302852 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Tue, 9 Feb 2021 16:40:12 -0800
> > +Subject: [PATCH] riscv32: Use double-float ABI for rv32
> > +
> > +So it can use libgcc built with OE toolchain
> > +Fixes
> > +error: "can't link hard-float modules with soft-float modules"
> > +
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +Upstream-Status: Inappropriate [configuration]
>
> Is that status really correct? The patch doesn't look very configuration like to me...

I think OE-Specific status is better suited here. Since other
toolchains generate mutlilib toolchains unlike OE
secondly, there is no need to apply it conditionally. Its touching
rv32 only bits anyway.

>
> Cheers,
>
> Richard
>
>
>
> 
>
