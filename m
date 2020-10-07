Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web11.879.1602103592725084574
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 13:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Tk7NaN11;
 spf=pass (domain: konsulko.com, ip: 209.85.167.195, mailfrom: paul.barker@konsulko.com)
Received: by mail-oi1-f195.google.com with SMTP id u126so3890504oif.13
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 13:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JYk5c2wH5SSa1+JtOKcsePohc7pQPFv83rvNZsiCBfY=;
        b=Tk7NaN114PXNaa4aBZYboAI6vd1H5MGxMwlgRd6kpuwjILj0JYmTJDQ3ux3q5n6+LR
         lNfJjM2SAmHY0WmpOfu8wZT58fHsy4RIuiDRpkonkSDCqq45tHoiRqzXDyhUsEHpU5U6
         lP1iCR7iTSx5iRCJFyScqMq3G7IRiJDfP9eiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JYk5c2wH5SSa1+JtOKcsePohc7pQPFv83rvNZsiCBfY=;
        b=pE9EdxttpSX7knnaUs8b5zQPZHR5u+MxcFzCXuZaIh9IWmpRTaUN2uzzDQWavU08hK
         zEdS5VAoPlDjEJKyhW58rS+sf9Ckoca59w/p24/4urPFwGoGWznT6a4Cbyp6RkrPcla/
         +70+z+6SmvFthvQHSdHwU7Jj3HIsHv9XF5wKhhrpeDLHgE5bu2QbJRHGrMqVDbXhmn04
         R/W0vyW85CWjPgVeDMR5E/KfQJ+LgcoVxgioR9LJAQ6LzdeNVizX6cJbvzglRANcOh02
         wDRum5i7FkGA7vxIyZHn+KrCiAxeuo1yo6U1FJnFx9zN2QVYuHAa/lzUxIkSKtRx1eqB
         6R3Q==
X-Gm-Message-State: AOAM531Cq9nuRr017aJPJJBWk1qrv0c/Hu7MdjME26qlVs6WZXA//VkZ
	hCDo/u3YiSeDp08Tnd+atlRJr9NSX4Vl35Jfth5JPQ==
X-Google-Smtp-Source: ABdhPJwC02l8nnAUzBtOS2kZWu7i35a9PwfEN5+PzohuFdmKTYpsJ6T2y61V6aHG1gs8mTCa1BHa/DhJGYxc9nrhjGQ=
X-Received: by 2002:aca:3e08:: with SMTP id l8mr2869599oia.152.1602103592023;
 Wed, 07 Oct 2020 13:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201007203838.19096-1-kamensky@cisco.com> <20201007203838.19096-2-kamensky@cisco.com>
In-Reply-To: <20201007203838.19096-2-kamensky@cisco.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Wed, 7 Oct 2020 21:46:21 +0100
Message-ID: <CAM9ZRVst-JLA3aOa+U2Sd1Cqj8ARsAyVhCu0Yhhk5we+FKsmdQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] qemu: add 34Kf-64tlb fictitious cpu type
To: kamensky@cisco.com
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Oct 2020 at 21:39, Victor Kamensky via
lists.openembedded.org <kamensky=cisco.com@lists.openembedded.org>
wrote:
>
> In Yocto Project PR 13992 it was reported that qemumips
> in autobuilder runs almost twice slower then qemumips64 and
> some times hit time out.
>
> Upon investigations of qemu-system with perf, gdb, and
> SystemTap and comparing qemumips and qemumips64 machines
> behavior it was noticed that qemu soft mmu code behaves
> quite different and in case if qemumips tlbwr instruction
> called 16 times more oftern. It happens that in qemumips64
> case qemu runs with cpu type that contains 64 TLB, but in case
> of qemumips qemu runs with cpu type that contains only
> 16 TLBs.
>
> The idea of proposed qemu patch is to introduce fictitious
> 34Kf-64tlb cpu type that defined exactly as 34Kf but has
> 64 TLBs, instead of original 16 TLBs.
>
> Testing of core-image-full-cmdline:do_testimage with
> 34Kf-64tlb shows 40% or so test execution real time
> improvement.
>
> Note for future porters of the patch: easiest way to update
> the patch and be in sync with 34Kf definition is to copy
> 34Kf machine definition and apply the following changes to
> it (just change 15 to 63 of CP0C1_MMU bits value)
>
> [kamensky@coreos-lnx2 qemu]$ diff ~/34Kf.c ~/34Kf-64tlb.c
> 2c2
> <         .name = "34Kf",
> >         .name = "34Kf-64tlb",
> 6c6
> <         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (15 << CP0C1_MMU) |
> >         .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
>
> Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992

Forgive my ignorance as to the range of MIPS processors available but
does any real MIPS CPU have 64 TLBs? If such a CPU model exists
shouldn't we be using this instead of inventing a new model?

I'm a bit worried that targeting a unique, fictitious CPU model will
lead to us wasting time debugging obscure failures that other projects
have never seen and that would never occur on real hardware.

-- 
Paul Barker
Konsulko Group
