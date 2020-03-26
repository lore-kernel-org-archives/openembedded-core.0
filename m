Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web10.1100.1585257790036735060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 14:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=md9DSlVZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id f9so2737704uaq.8
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 14:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=whUNHvchbReDrR+JpQ+yVeyro5yYZPDg17zad3DRWgE=;
        b=md9DSlVZuJ/BA2vG5fuOUr7GVVPgCrUHptAa6r/AG8gA0SMQM2X5/sJfw8uX7qRYHS
         CG0LBu0SKATmILSQBJoETYDbFdeVvx0tDaM18ndkDu0GtujLxjEjvJU6iClCCNmXd9lK
         h+Nx9wp9NHtHYtXMX0tT+OvtXzWMQMA5P6KftjEZ5v4Tm71X2hOBnF0lqZO95PjlzT0+
         ZfYyiqIxbH2DxT9tCVU6tAvHNWpZfhRRVLfJo8kPdBHXf+y+yj5AbGQ7kncJQQ3IS9y7
         nF7Y/NabeiMmjuakXmpEilk/Q6qVrrjrdTrzwT/Eet2KMn7A0MBqsJOvE7j1B1hxqguL
         zl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=whUNHvchbReDrR+JpQ+yVeyro5yYZPDg17zad3DRWgE=;
        b=a6pK4ocUlVYBZ1RcuK2vA3olWhuxYkmpl/s1FLNE96tY1xUYeSUlv0pMNUPlT6ulSb
         E6Quxj9Ud/w6DXdYWAJJWYB7Fk730ECAXKa7zA4HqEl4pTZquMKI6EXQBG0lf9iYkHWg
         iz6lZvfnKmdHm6yUPWJYlYaos7El0ufZv6s4+4tamgoNCfQc56IJrIAm7KPLOxY35KNJ
         gFgLgcRsdjTrIN6nKtMD/VqMpYByHWgyikTWRi6OIF64ME0q0DsvMULeBy46iWRWhHwH
         KcL+73IW57UBu0Xm8C66aK76bSE4ISkmmxbGvmOURu+h3JfAgwHzU3J/4fe8yC6reB2U
         SyQA==
X-Gm-Message-State: ANhLgQ0Qw4l36YVWLhp3+j1+d0CXAlcOrVew6fhWqOgUUpd37itbUJr0
	wl+UlugMb4llxBuy4iyu+FpNqCAgpUuhMRPBTJTMBgMZ
X-Google-Smtp-Source: ADFU+vu96LDsHykqwfWXz3Q17HeCJR/FxgbX/pldR21U6AUF4RfhMZCjdj1rtBrJMC+es4j/xba3zT8HRehAgfj4f1s=
X-Received: by 2002:ab0:1869:: with SMTP id j41mr8594631uag.99.1585257789085;
 Thu, 26 Mar 2020 14:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200326152629.29272-1-stefan.ghinea@windriver.com>
 <20200326191628.GC5401@localhost> <CAJ86T=WJ4+8Ly59gxj6maeLQC5NAcZiM-G+uKqhTTi3u9C_FtQ@mail.gmail.com>
 <20200326202650.GA14127@localhost>
In-Reply-To: <20200326202650.GA14127@localhost>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 26 Mar 2020 14:23:03 -0700
Message-ID: <CAJ86T=ULPheVBCFMQd8-rF5v6YyCpO6phPZqeYW88NtL=f=t+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pulseaudio: fix for ARM thumb + frame pointers compilation error
To: Adrian Bunk <bunk@stusta.de>
Cc: Stefan Ghinea <stefan.ghinea@windriver.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 26, 2020 at 1:26 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Mar 26, 2020 at 12:53:08PM -0700, Andre McCurdy wrote:
> > On Thu, Mar 26, 2020 at 12:16 PM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Thu, Mar 26, 2020 at 05:26:29PM +0200, Stefan Ghinea wrote:
> > > >...
> > > > When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
> > > > since the Thumb frame pointer in r7
> > > >...
> > >
> > > How are you reproducing the problem in pulseaudio?
> > >
> > > This sounds like a workaround for a bug in musl that was fixed 2 years ago.
> >
> > The problem can show up anywhere that inline asm is trying to use r7.
> > In this case it looks like:
> >
> >   https://github.com/pulseaudio/pulseaudio/blob/master/src/pulsecore/remap_neon.c#L50
> >...
>
> After looking at the pulseaudio code I suspected the patch description
> claiming pulseaudio syscall code would be the problem was rubbish, and
> that this NEON code was the problem.

Yes, the comment looks like it was copied and pasted and doesn't
really apply in this case (since pulseaudio isn't making syscalls).
That should be updated.

> But when I tried to reproduce the problem it built for me with both
> glibc and musl in master (the patch didn't mention that this was a
> musl-only problem).
>
> Then I saw that this was fixed in musl upstream 2 years ago:
> https://git.musl-libc.org/cgit/musl/commit/?id=e3c682ab5257aaa6739ef242a9676d897370e78e

Right, it's not related to musl or glibc. I suspect it can be
reproduced by building for an ARM target which supports NEON, ensuring
that DEFAULTTUNE doesn't forcefully disable Thumb (e.g. it should be
armv7vethf-neon, not armv7vehf-neon), setting ARM_INSTRUCTION_SET to
thumb and then compiling with frame pointers enabled (e.g. by adding
-fno-omit-frame-pointer to CFLAGS).

In terms of a fix, then changing the code to use r12 instead of r7 is
probably the best solution (assuming it works), but would need careful
testing. Appending -fomit-frame-pointer to CFLAGS for ARM machines
building for Thumb is safe and should fix the issue too. Presumably
limiting the -fomit-frame-pointer workaround to ARM machines which
support NEON building for Thumb would be an even more targeted
solution.
