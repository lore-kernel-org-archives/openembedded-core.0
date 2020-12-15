Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.1444.1608062278798377642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:57:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PiNej3DB;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id r5so22348839eda.12
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 11:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EBgrOZ9NKfO0UuCd6+9tEcEV0BpkO8UBOPxE6l5Cq2U=;
        b=PiNej3DBN3xt+TRLURcsl/hoorqTyvZhvXv6gWJxILhhlU2+QznszlDEEK6aTZf4gu
         gDRQBWIJDYaroCeHZT6z2+pMAPUyO7UcOK+xqZtH33Kmcz97A99Vo0U6usMZr/rqCDnj
         Trf7KRXZdK0u0OSCfqFNcRgf8GR8BVHsKRIpGHKoaF1ceukx2pw8t8jZjGWwhjgaiwNv
         k4CyX9Sj0kYLRu+9rGIvX4qvb/5/uefMBEz9V6Ry2pCf4tZXMKinALTK5ORWaYQ/qAfA
         GxwLt11tK0nQ8TK2DXBTyqJb8pmoEnCdzEXM0vrDNiX6fs9dSDko4NNxFtmxJ2EZRz7S
         OvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EBgrOZ9NKfO0UuCd6+9tEcEV0BpkO8UBOPxE6l5Cq2U=;
        b=lbsLubiLLtOwbZOPrQ/bzqR69kkZjnshVyzv851V4fPoK6dJ11REcl0oXhH9KgEhB7
         qlJZ+GViy8Uh6cofeGmcptBc/eocgyllS+kwNvVOQkLTVP6JCP66TG8bSvXCx2JPkb94
         e5+lAFyXTDDb3QY4mgPMS3yVqoFRf8466QYxUanz24Hf4Pm1SiNXSpXz50U9z3PYM2jY
         osbUHlcLfEZexixSqTKPwLNguly0UpU2JutJyEV2v6fBsSyW/t7jMnFLIf1slu5jMyi/
         8IP6ZVMu4iu3q0ntiXHXrw66Vev1nDeUvFs1nN5eEZioda5BsYehlhBrqxkqn7miHBkP
         0IxQ==
X-Gm-Message-State: AOAM5318f3QhuIpW+FZ5NOYLnT8ID8M7Ag3CxgusniD/zS6EOZ1JzX0R
	RV/baZ6ynVRZPbBLJPoSxKfpm0BW6xIdZIMdpWY=
X-Google-Smtp-Source: ABdhPJzdUdRBj+c1UI+yCSG1rLf5Tzcv009NUUeAkJVy/rWP0fAXL66X/cuLhLl9Vx0NN+rh9ci1jvk75fRG+0NI200=
X-Received: by 2002:aa7:d407:: with SMTP id z7mr32741428edq.234.1608062277311;
 Tue, 15 Dec 2020 11:57:57 -0800 (PST)
MIME-Version: 1.0
References: <20201215193506.13053-1-okaya@kernel.org> <CADkTA4OWM5PJXSgp7SMu+n0071YE-3wkaoV2JUPCuf5u=XdAnQ@mail.gmail.com>
 <8861f46e-fc85-2af4-fb2a-0aed9cb89791@kernel.org>
In-Reply-To: <8861f46e-fc85-2af4-fb2a-0aed9cb89791@kernel.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 15 Dec 2020 14:57:46 -0500
Message-ID: <CADkTA4M6bbosSG3nhoe5uNm3ZF-qUZisOiCbnevnRVGCr_tLpQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v3] sudo: split into smaller tools package
To: Sinan Kaya <okaya@kernel.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 15, 2020 at 2:54 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> On 12/15/2020 2:44 PM, Bruce Ashfield wrote:
> >> -FILES_${PN} += "${nonarch_libdir}/tmpfiles.d"
> > I don't see this maintained in the split of changes below, why was it dropped ?
> >
>
> I'll fix that. I thought ${libdir} would cover it but apparently it does
> not.
>
> >>  FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/*.la \
> >>                      ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la"
> >> +
> >> +PACKAGES += "${PN}-cvtsudoers"
> >> +PACKAGES += "${PN}-sudoreplay"
> >> +PACKAGES += "${PN}-visudo"
> >> +PACKAGES += "${PN}-sudo"
> >> +PACKAGES += "${PN}-lib"
> >> +
> >> +RDEPENDS_${PN}-cvtsudoers = "${PN}-lib"
> >> +RDEPENDS_${PN}-sudo = "${PN}-lib"
> >> +RDEPENDS_${PN}-sudoreplay = "${PN}-lib"
> >> +RDEPENDS_${PN}-visudo = "${PN}-lib"
> >> +
> >> +PROVIDES += "${PACKAGES}"
> >> +RRECOMMENDS_${PN} += "${PACKAGES}"
>
> > This isn't a direct replacement of the existing packaging. If we are
> > going to get a series of patches that keep splitting on binaries, they
> > shouldn't be like this.
> >> For an image or configuration that turns off rrecommends (which is the
> > policy for a distro that I have), this is not backwards compatible and
> > we are going to get all sorts of runtime issues .. and then be forced
> > to update packages lists with this explosion of new splits.
>
> Interesting, I didn't know that RRECOMMENDS can be turned off.
> I was hoping to do a non-invasive change for existing users.

A good goal!

It's this variable:
https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#var-NO_RECOMMENDATIONS

(but you probably already searched and found it).

>
> >
> > If we do splits like this, something stronger than rrcommends is
> > needed, or they simply belong in a layer besides core.
>
> Would RDEPENDS work?

It would pull all the subpackages in yes, and can't be turned off like
the recommends.

I can't think of where it would break, but maybe others can :D

Bruce

>
> Sinan



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
