Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.211.1610742946950550224
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 12:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NM38eI60;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id c14so7018586qtn.0
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MA/fXvVaIGwZFGbul6Xvoel8B0tSFrRDnDb3AWLtntc=;
        b=NM38eI60dX9+oXUGOwk3SLfe4NEXi4qtq8edZoS6zpkMy2PcRgbRZg89pHi17a+jan
         rjfV0yiov5X6gGvAfrpWxMkeO43NS6NrsCHMPJJTHdd17xbtvOI3TUTz/U3whTfRR+cG
         WySnonx/Jnt18HzWBvAH0WXnVUznTIIdzY8zWB4PPsyy8oDmHLP93G+JT/gIsNy95DKh
         tT1XoKgWGYOHKdTQ/iVOL7fQ7IZ80b0Wmxo+lHwQqW2ykPZMc9ALSMCtm2JGk01IuTcM
         GKSLCOMKPMzq2w7w/3BUOHZAbQYr+ZmIsiJgSBa1eLSag9j87V2DqiBuFMiawNBWTVBf
         Y9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MA/fXvVaIGwZFGbul6Xvoel8B0tSFrRDnDb3AWLtntc=;
        b=bI4HYpNvKHd432MPXpBIxX3p8NQAvVLsNWTEWxZW0IO9nyKgAtJhV5hlbxA/X88HFe
         Ka7ITRVpYHFdeEOVdFLg9GVvFZzZntep+UvhtXQfyxityDY9WE6NyNmYZ/y0OJF9fpjs
         l87P2uXfObPFrlTmgqPRWFQ5GgAdldJ1FYog85CAhH3wbSiH7PMjByIoHIprIUVYyWHS
         y1frACYy+TCCGccYU1SyOG4VEbXtaI+PLbcH8mZ42fwM0gavDcgXqyf1EVkOoHVFGk4o
         bcq7PdVPuOE1clT/+mwECqGpOHHYiAuONpswLDSjK4BA24/DZTikqFEHy184Ro+Z3xt6
         Vdow==
X-Gm-Message-State: AOAM530tS3yD/ZHZ2Rrf36y5ONYjB00INJ366ofvoKwRor50d8tGEQ0Z
	jspKKTGWugjVZfZ76x6+SYCpKWU6exOxdpUm+3E=
X-Google-Smtp-Source: ABdhPJxLKK9StUgBI3hDuR9P4c0nq3iebvvr0dnUgJdUJgTtJa3s2vhmcKG4OImgnHm1C6ZnEFKXcz4PAOSUzc01Bss=
X-Received: by 2002:aed:2ec6:: with SMTP id k64mr13720925qtd.194.1610742945989;
 Fri, 15 Jan 2021 12:35:45 -0800 (PST)
MIME-Version: 1.0
References: <CBE0B95A-C2E7-4FAF-AD1D-E0EEBCB177C2@bmw.de> <ee564b97e176be05739442e9c271bbce565da4d5.camel@linuxfoundation.org>
In-Reply-To: <ee564b97e176be05739442e9c271bbce565da4d5.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 15 Jan 2021 12:35:19 -0800
Message-ID: <CAMKF1sp-tFGr12OBL+J0d4-Ykf7es5JJoY-eeicLJkGP0UHEfA@mail.gmail.com>
Subject: Re: [OE-core] Question about security_flags.inc and CC_ARCH
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Ho <Michael.Ho@bmw.de>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 15, 2021 at 8:05 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-01-15 at 13:46 +0000, Michael Ho wrote:
> > I wanted to get a bit more understanding of why security_flags.inc
> > tweaks CC_ARCH instead of CFLAGS.
> >
> > Some developers who consume an SDK we produce using Yocto noticed
> > that CC and
> > CXX has FORTIFY_SOURCE embedded in the variables. These developers
> > sometimes
> > want to compile software in the SDK with compiler optimisations
> > turned off in order
> > to run code coverage tools like gcov. Typically they drop
> > CFLAGS/CXXFLAGS in order
> > to do this but they noted that with the SDK they also have to
> > manually tweak CC/CXX
> > to remove the FORTIFY_SOURCE references (because compilation fails
> > without
> > optimisation flags when using FORTIFY_SOURCE).
> >
> > This comes from:
> > https://patchwork.openembedded.org/patch/167198/ and
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D6733a7873ca12129=
5a2e309a6915b9816e1ae36b
> >
> > I would=E2=80=99ve expected actually that FORTIFY_SOURCE bundles itself=
 with
> > CFLAGS/CXXFLAGS as it is dependent on being with the compiler
> > optimisations. This is also how the Debian hardening wiki seems to
> > describe it used [1].
> >
> > I am guessing that this is moved to CC_ARCH to ensure FORTIFY_SOURCE
> > is being enforced around the build system in case components are
> > skipping out on CFLAGS and CXXFLAGS. Is that right?
>
> In theory we should be giving an error if CFLAGS or LDFLAGS aren't
> being used to compile our output. You're right that we probably don't
> detect every case though and that was probably why we did that. I don't
> really remember though. Khem might remember more, I suspect he'd have
> done that for a reason.

many packages don't use these flags ( -fPIE etc. ) directly but the
toolchain is automatically
configured to use them, which means their configure tests etc. get
them without considering
cflags, whereas for us where we want to accommodate external
toolchains which may not have
these options compiled-in etc we add them externally via cmdline and
best place for us to do
so is the CC itself since thats whats used by these configure checks.

Ideally, we should perhaps just change the toolchain to have these
defaults perhaps controlled via buildtime knobs
controlled via distro feature.

>
> > Would there be some objection to moving the security flags to
> > CFLAGS/CXXFLAGS for the cross-canadian target (sdk)?
>
> Yes, I'm fairly against people getting a different view of the flags in
> the SDK compared to the main build environment, that just creates a
> different set of problems unfortunately.
>
> Cheers,
>
> Richard
>
>
>
