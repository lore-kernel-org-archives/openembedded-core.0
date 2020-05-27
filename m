Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.1407.1590612335597583026
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 13:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pGb81snK;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id n141so1015749qke.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 13:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FVudJOBHVEZrzvwMqd4iYqPyNj4P0WK2/lolB2Vk8N0=;
        b=pGb81snK4jRIm/BULALuv6SAmqEguLS92JJWs+RGeA6tTiBZ7xczg5S64tXxk4ZJ+a
         d1939fePdJUMlEJiRCepCofEvDP5MaiqaWmG+WxFcwSqP9+GW3F0xx5HNWM5QbYPtR1s
         9K0qaqhXcdlV+TxM83FeoUArL8qPEVjIb9fKjQoHz2aBfnCWtIHw0ODijDOHs0EcUXP1
         zERB6Ih1Vj7kHlHNtpvGq86cb3WQdlF4U2zEhz040BbW57ofjyTInOhP0O15WC4Nae93
         0D4m1LEA6uBvN2ofMKMCxMfjdUFCtqJ5zv28dBKGnurIHUXwTvZKkw2H3D61RuNaLaYi
         HmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FVudJOBHVEZrzvwMqd4iYqPyNj4P0WK2/lolB2Vk8N0=;
        b=k5q/bCajQ8Yw0ixipQQu35yabfxe3aTafXR8XftF60fzcodPCa7CswIvppR3o3HtMS
         kCbesOlNbTkNalyTcJS1mWx8iSIVDDSpTf3GyUr2AH2pSlvgUPVVPo1Rzh8icFGUZgtQ
         1pSdjLrcRC3bhk1FI1BrSQI1NEhJTlRiZHtePIQGQe4SmImd4WLB8OSgM6c+NxAFjET9
         M2dJeKf1PqbBienQswkckgFTjeFfCV0p1FN2c33K8A1zM8wtYQ5fmrczL9OnBGxC/cON
         SMA89g7cGWmB6Od6N7CXYg5Mr1OFMF/Cmcd9uL/1XK5ca4+HvgPE7lfFo7RJzdFveKXx
         eRKA==
X-Gm-Message-State: AOAM530CzUdxKlrftexrnFBQUR/Qty8VLw7+2/2D8XFMvW5NtIQSHmHQ
	4LzZCj6UzST43fv5HO55dFDLuLZ2eybDhuWCDGedeRtL5ZA=
X-Google-Smtp-Source: ABdhPJwU4xdRF0LojqFFDmrIHNBhUgN/0snptytJ3upl8MDq3F70AKudnDCyQZHr2RuM/9a8JYHNM34t3hbyx5iin/s=
X-Received: by 2002:a37:b847:: with SMTP id i68mr5816046qkf.431.1590612334527;
 Wed, 27 May 2020 13:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200527155011.3165976-1-raj.khem@gmail.com> <20200527155957.GK17660@denix.org>
In-Reply-To: <20200527155957.GK17660@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 27 May 2020 13:45:08 -0700
Message-ID: <CAMKF1sruooLRBHj3zrZ6-MgSz01t0Cs2LXOk2ryt0iAWcw7aLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 9:00 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Wed, May 27, 2020 at 08:50:11AM -0700, Khem Raj wrote:
> > asm/bpf_perf_event.h does not exist in older kernels e.g. ( 4.1 )
> > this helps in using common header across multiple versions of kernel
> > going back
>
> This check should have been there from the beginning and for every header
> file. It's big PITA to sync this list up, especially when dealing with
> different glibc or kernel than OE-Core, e.g. external toolchains, etc.
>
> Any objections to making this check more generic for every entry in the list?
>

I thought about that, but then realized, there is a check for missing
headers in the oe_multilib_header function which catches errors nicely
so if  we do this check before calling that function perhaps is going
to subvert the error message which could be useful, since the
aftereffect of
the missing header can be a cryptic build error in applications,
therefore went for limited edition.

> --
> Denys
>
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > index 4481aa430c..933a01ba81 100644
> > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > @@ -81,8 +81,11 @@ do_install_append_armeb () {
> >  }
> >
> >  do_install_armmultilib () {
> > -     oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h asm/bpf_perf_event.h
> > +     oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h
> >       oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
> > +     if [ -f "${D}/${includedir}/asm/bpf_perf_event.h" ]; then
> > +             oe_multilib_header asm/bpf_perf_event.h
> > +     fi
> >  }
> >
> >  BBCLASSEXTEND = "nativesdk"
> > --
> > 2.26.2
> >
>
> > 
>
