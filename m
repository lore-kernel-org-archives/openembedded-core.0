Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web12.1669.1590613021357741252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 13:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Hx826Coq;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id b13so5132031vsm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 13:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qtWbvRRroZAjyVsjxT4+XA02anJ4yRgIW3YJW9/cqzA=;
        b=Hx826CoqdbFNCa/EoB57yXC1koBsupI9ocGplGsms/GO6B+bnGVoA4XY+QXBMND4VE
         duZTT8tbY8SV6aG4Dn1oWT87usALgv8suyfdbhyotTUmL9NIeI534bWecJY+9TeUeDvY
         ciBeNTSdPoV7lMOO0gqIJEb+B/0G5lOABduL1puqR8kLpAcpl9tEke20KRd7Wze7RgH2
         W6uYQ7UZsQ/Z/y+zvPpKlXi+CW5++Nv2YYemYKIj6aiC6jl3G0UgCOcqhRL/f877qYSq
         r87/0iY4SzyGpYHBRVz0w7OrXl26tCinq+1Qk3D49V52au8M9Pfm45WB8pwNem+P8DXB
         MqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qtWbvRRroZAjyVsjxT4+XA02anJ4yRgIW3YJW9/cqzA=;
        b=VbEjBHidfiBecUAhsVCejsTZcTmzv+a0mhiSuWp4ayh4A9ShobLf+1EjmLx/rD1d40
         eEigXzWTUhMGOCkKPtPDNour4F1hq9eThzXl18NrM012RCoC3Ep6b8SIOv6A9Kij1SoG
         eq49A5NMmALTDGCH9a/dtTJX6EHAdPE0QKeRTANG9xr4WhNrHw2idmynuBqEs5IeDQJ/
         iFVBPWWAMNeJNkdutmIsH76Djr/iGTmC41rAJDgk7ZWVyQPaoFPolM7DKFzIjBRRi9nx
         9v0pBjrbj6yy48juwdHPNinwKxOuJp/aZqY6NtVpzCRLnumlrlRq4JJmvJDnLUX144xL
         kqiQ==
X-Gm-Message-State: AOAM533fvlnvKfBCWNr+a3ESQNMjnsi/dVVzMMn2Cl0KkUxpyr0C2hEe
	HFvART9zUGF5yQX633gGNoBepy2/DyFvyouuEag=
X-Google-Smtp-Source: ABdhPJzKQ/55O7ZNazkEvPN4Z/2uD9lWjCSzaqWSPlNoPfrm0jr+2JlNLfJXXwz2ibaXTlH0THO+1x6albn/sya8dEk=
X-Received: by 2002:a67:de89:: with SMTP id r9mr6003671vsk.11.1590613020353;
 Wed, 27 May 2020 13:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200527155011.3165976-1-raj.khem@gmail.com> <20200527155957.GK17660@denix.org>
 <CAMKF1sruooLRBHj3zrZ6-MgSz01t0Cs2LXOk2ryt0iAWcw7aLA@mail.gmail.com>
In-Reply-To: <CAMKF1sruooLRBHj3zrZ6-MgSz01t0Cs2LXOk2ryt0iAWcw7aLA@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 27 May 2020 13:56:49 -0700
Message-ID: <CAJ86T=Wqd3dU0UhmvVnKFG=vUMN+FQpNphxL5DkQ8ihac2AAKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
To: Khem Raj <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 1:45 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, May 27, 2020 at 9:00 AM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Wed, May 27, 2020 at 08:50:11AM -0700, Khem Raj wrote:
> > > asm/bpf_perf_event.h does not exist in older kernels e.g. ( 4.1 )
> > > this helps in using common header across multiple versions of kernel
> > > going back
> >
> > This check should have been there from the beginning and for every header
> > file. It's big PITA to sync this list up, especially when dealing with
> > different glibc or kernel than OE-Core, e.g. external toolchains, etc.
> >
> > Any objections to making this check more generic for every entry in the list?
> >
>
> I thought about that, but then realized, there is a check for missing
> headers in the oe_multilib_header function which catches errors nicely
> so if  we do this check before calling that function perhaps is going
> to subvert the error message which could be useful, since the
> aftereffect of
> the missing header can be a cryptic build error in applications,
> therefore went for limited edition.

Just as another point of reference, I'm using kernel 3.12.x and both
asm/perf_regs.h and asm/bpf_perf_event.h are missing.

My solution was to downgrade bberror -> bbwarn in multilib_header.bbclass

> > Denys
> >
> >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  .../recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > > index 4481aa430c..933a01ba81 100644
> > > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> > > @@ -81,8 +81,11 @@ do_install_append_armeb () {
> > >  }
> > >
> > >  do_install_armmultilib () {
> > > -     oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h asm/bpf_perf_event.h
> > > +     oe_multilib_header asm/auxvec.h asm/bitsperlong.h asm/byteorder.h asm/fcntl.h asm/hwcap.h asm/ioctls.h asm/kvm.h asm/kvm_para.h asm/mman.h asm/param.h asm/perf_regs.h
> > >       oe_multilib_header asm/posix_types.h asm/ptrace.h  asm/setup.h  asm/sigcontext.h asm/siginfo.h asm/signal.h asm/stat.h  asm/statfs.h asm/swab.h  asm/types.h asm/unistd.h
> > > +     if [ -f "${D}/${includedir}/asm/bpf_perf_event.h" ]; then
> > > +             oe_multilib_header asm/bpf_perf_event.h
> > > +     fi
> > >  }
> > >
> > >  BBCLASSEXTEND = "nativesdk"
> > > --
> > > 2.26.2
> > >
> >
> > >
> >
> 
