Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.3335.1630357976850505831
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 14:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jPhwwcxr;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id u14so33925206ejf.13
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 14:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VEceSR5K7HYjZv+dIfkvrcLHMuZ/YJR04v28EZVx3lI=;
        b=jPhwwcxrfDR2ntulr1M7gbQg+icINT2AGZvovjcUjk1PAUZAoyCvpYjBRJhzTwybmN
         ywht/56METWQs/AgsPxF/2LGEoAtYHo580P2Rr0J3tTwhbPrQuJq9d3DPno+47rWskFX
         b7RMZ85z7W+LS+Ho7lY7DuQurNJwjjmS7bTRh405kW5wokUrF5yLuLV6UYNnrMFE6glg
         Z3OpDGV2LC2xeNoYauZa85zTChoRS6ymUGS9SXYWwdvog6WdrZ5KzEPnD7ydq8gk+JTs
         STz8eoFNafEluj1dCJkyC+6WFfWTVAjFI44vyue4pu1RJdNCkgMlLnzf1jjhLFfW4cpl
         Lh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VEceSR5K7HYjZv+dIfkvrcLHMuZ/YJR04v28EZVx3lI=;
        b=nbVjTQZz6ygZlpJVjiya/U9eBfoprUeNIrF4mT3GuOz9yAH+jk9YZw346yQG8dwuWw
         CjwduzE4BENLEDclIApVQYNJFyO9B+TEsKc4OVr9oEVjLvo6O61UFKypBKQMFN9qvBAP
         5UHLWaU8PTIYRiwDC6ZJ8Tek2VoGTgu/17bNl8GmuukOyoYh0j34BwJqW0Mg8GRpDyTK
         H92pbTd317kw22J4lTN/TD5fy6wU6opzpuzi+bOIGS7aBFzgDmOztEsE0lkBTOiakLqM
         fJom70+u6EabPRVxyqvQmutd/ffVozQTGWhqjwLy+LQzeMK+DxEFL7titfQcNSOjBzhn
         14cw==
X-Gm-Message-State: AOAM532XlmCtBVYaTZl1UO7M16ZnSC42g6Qd2R1eYrQd7FsQUa/J5JIt
	PauyQJL8wIcAagPCm3S9GVN7VFBlXz94bSeSUZ4=
X-Google-Smtp-Source: ABdhPJw/yglZr1leuPTKPmC1WsBqktuvImBqN1jgc/DU/VkuYVwULBRiEIfrQ4eOsnroOrNRp91pY/uVjAIrZ9aLPGo=
X-Received: by 2002:a17:906:680a:: with SMTP id k10mr26174901ejr.298.1630357975221;
 Mon, 30 Aug 2021 14:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210830200540.9888-1-andrey.z@gmail.com> <27aadf4835874e5117ea57ddcb26c07f73d2a7f4.camel@linuxfoundation.org>
 <CAHtQpK4i=Kp-GC0u=C_b1YQh9xBEW7yiURnRkO9TV5+veAxRjA@mail.gmail.com>
In-Reply-To: <CAHtQpK4i=Kp-GC0u=C_b1YQh9xBEW7yiURnRkO9TV5+veAxRjA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 30 Aug 2021 17:12:44 -0400
Message-ID: <CADkTA4MgO7e3Q2FNzmRPuPnHSchjPFkJnT1mBLCvKx6gSgmn5A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] perl: add integer module required for kernel >= 5.14
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 30, 2021 at 4:55 PM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
>
> Hello Richard,
>
> On Mon, Aug 30, 2021 at 10:30 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2021-08-30 at 20:05 +0000, Andrey Zhizhikin wrote:
> > > Kernel commit 12dd461ebd19 ("crypto: arm64 - generate *.S by Perl at
> > > build time instead of shipping them") uses perl to generate assembler
> > > files for crypto functionality, which relies on the integer.pm module to
> > > be provided.
> > >
> > > Add this module to FILES and export it for build system.
> > >
> > > Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
> > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> > > ---
> > >  meta/recipes-devtools/perl/perl_5.34.0.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > index ab19a8d0be0..7a07b3f4911 100644
> > > --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> > > @@ -248,6 +248,7 @@ FILES:${PN} = "${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} ${libdir}/
> > >                 ${libdir}/perl5/${PV}/strict.pm \
> > >                 ${libdir}/perl5/${PV}/warnings.pm \
> > >                 ${libdir}/perl5/${PV}/warnings \
> > > +               ${libdir}/perl5/${PV}/integer.pm \
> > >                 ${libdir}/perl5/${PV}/vars.pm \
> > >                 ${libdir}/perl5/site_perl \
> > >                 ${libdir}/perl5/${PV}/ExtUtils/MANIFEST.SKIP \
> >
> > Doesn't that mean something is missing an RDEPENDS on perl-module-integer rather
> > than adding to the main perl package?
>
> Good point! Now that I look at it - this does look a bit too intrusive
> (even though it did serve the purpose).
>
> I'm just not sure if I can craft it to RDEPENDS in kernel class instead...
>
> This is definitely required by newer kernel builds (>= 5.14), but I'm
> no expert in how those dependencies are set in kernel class. Would
> need to look a bit deeper there.

Doing it consistently is the challenge, so we tend to not set them in
the classes themselves.

You have to check both the architecture and the version for many of
the depends/rdepends.

Which is why I tend to carry dependencies like this in the individual
recipes, since the version is known and the arch is an easy check.

I had some roughed out patches to start moving some of the
dependencies into the classes, just to make creating custom recipes a
bit easier, but I didn't complete them to my satisfaction and can't
see to track them down at the moment.

Bruce

>
> >
> > Cheers,
> >
> > Richard
> >
>
> --
> Regards,
> Andrey.



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
