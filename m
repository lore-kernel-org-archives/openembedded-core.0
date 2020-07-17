Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web10.276.1595013562696589088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 12:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UbOq5Kg4;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: armccurdy@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id e15so5401251vsc.7
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 12:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YZxan2a4N4EvfMXI1aJUfiosd4/vCiGIdsPe9g6uXE8=;
        b=UbOq5Kg4H8ZkLXyCBXfK2N+7UlT+n2PA0UJdB1pul3cTSoUsC0KQdse0smafNxRR2u
         fTcmmn3ZvY8mQtRR+rqdbyvu7HFfFUE9t/wVq/LTW93dtkVd5chPb7q4+DuyDUa+AkzW
         DLxIyCUZaWM7sFT61krLEuN7tHm0VDxYvfwqfE7RKnclVXf6cFv2LZMQk+uEu63NkXPB
         G45k9gk7dXJc4iuHbkxV1xpOn8dC5+BGIl+hBBLSGYyKBRE1kx90NL7C19nSPjA62kLg
         LpHuOV2eLFDgxoYat5zt0Pg+mXtE4M5TZiuiS59Y2GmJ7sFxuwICXd5MpI5v4DLzudm3
         exlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YZxan2a4N4EvfMXI1aJUfiosd4/vCiGIdsPe9g6uXE8=;
        b=aikqm4lhYcgwsOLxj++oKgcXY/N4KvwbS45X51l0cpgOCk5nK+Gaa1YHy8HyOIR1xO
         nd6488SPSIG8/90iYMIrkCMtXlyiP5hFt7uu8HIGYEe7s69SXO7izdQQMTPqOdq+ash0
         V8H4UfArACopXfz7+6GObxb7Hkz/FvVaMiK/J8D1A6q58WReHEYGbHk7uDWEnofs/gpt
         2d3eP5qro/8pKWORUQao3US8r2UK2maGi0whQhs3z8fZKEUx9sKlScesCARuTfocfE1c
         5QPXEnnhxm6yf2AAA+J6G0lvGGeawwjw3/SE/mAIqiV2hEwyYqfYfSn4mGo9DcfZg4vF
         3EZg==
X-Gm-Message-State: AOAM531zelHiQUYDaVI/MiuWn0PeRB0Xg8rFEJQWeiP5/8zJF3GEAukx
	a4u5Qvy+kCR75KTIGeIXatchaytw4MeK9sIUUwY=
X-Google-Smtp-Source: ABdhPJzE4f5iKriwSuReBtTX6FWNCUadLl+J7KjTC/wd9vZcBPHTZkMysdezi6vmNvbX2veSDtUdoOVtbjTkE8078IQ=
X-Received: by 2002:a67:2ed8:: with SMTP id u207mr8394029vsu.11.1595013561745;
 Fri, 17 Jul 2020 12:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200326152629.29272-1-stefan.ghinea@windriver.com>
 <20200326191628.GC5401@localhost> <CAJ86T=WJ4+8Ly59gxj6maeLQC5NAcZiM-G+uKqhTTi3u9C_FtQ@mail.gmail.com>
 <20200326202650.GA14127@localhost> <CAJ86T=ULPheVBCFMQd8-rF5v6YyCpO6phPZqeYW88NtL=f=t+g@mail.gmail.com>
 <eb355d2835cfd5f5525216b8544a5384dcb9ad6c.camel@iki.fi>
In-Reply-To: <eb355d2835cfd5f5525216b8544a5384dcb9ad6c.camel@iki.fi>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 17 Jul 2020 12:19:12 -0700
Message-ID: <CAJ86T=Vw_DtkogqtQ8tW_y9A4ULgpkOJHULV-FkU5MGWgdmebA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pulseaudio: fix for ARM thumb + frame pointers compilation error
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Adrian Bunk <bunk@stusta.de>, Stefan Ghinea <stefan.ghinea@windriver.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 17, 2020 at 3:09 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> On Thu, 2020-03-26 at 14:23 -0700, Andre McCurdy wrote:
> > On Thu, Mar 26, 2020 at 1:26 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > On Thu, Mar 26, 2020 at 12:53:08PM -0700, Andre McCurdy wrote:
> > > > On Thu, Mar 26, 2020 at 12:16 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > > > On Thu, Mar 26, 2020 at 05:26:29PM +0200, Stefan Ghinea wrote:
> > > > > > ...
> > > > > > When compiling for Thumb or Thumb2, frame pointers _must_ be disabled
> > > > > > since the Thumb frame pointer in r7
> > > > > > ...
> > > > >
> > > > > How are you reproducing the problem in pulseaudio?
> > > > >
> > > > > This sounds like a workaround for a bug in musl that was fixed 2 years ago.
> > > >
> > > > The problem can show up anywhere that inline asm is trying to use r7.
> > > > In this case it looks like:
> > > >
> > > >   https://github.com/pulseaudio/pulseaudio/blob/master/src/pulsecore/remap_neon.c#L50
> > > > ...
> > >
> > > After looking at the pulseaudio code I suspected the patch description
> > > claiming pulseaudio syscall code would be the problem was rubbish, and
> > > that this NEON code was the problem.
> >
> > Yes, the comment looks like it was copied and pasted and doesn't
> > really apply in this case (since pulseaudio isn't making syscalls).
> > That should be updated.
> >
> > > But when I tried to reproduce the problem it built for me with both
> > > glibc and musl in master (the patch didn't mention that this was a
> > > musl-only problem).
> > >
> > > Then I saw that this was fixed in musl upstream 2 years ago:
> > > https://git.musl-libc.org/cgit/musl/commit/?id=e3c682ab5257aaa6739ef242a9676d897370e78e
> >
> > Right, it's not related to musl or glibc. I suspect it can be
> > reproduced by building for an ARM target which supports NEON, ensuring
> > that DEFAULTTUNE doesn't forcefully disable Thumb (e.g. it should be
> > armv7vethf-neon, not armv7vehf-neon), setting ARM_INSTRUCTION_SET to
> > thumb and then compiling with frame pointers enabled (e.g. by adding
> > -fno-omit-frame-pointer to CFLAGS).
> >
> > In terms of a fix, then changing the code to use r12 instead of r7 is
> > probably the best solution (assuming it works), but would need careful
> > testing. Appending -fomit-frame-pointer to CFLAGS for ARM machines
> > building for Thumb is safe and should fix the issue too. Presumably
> > limiting the -fomit-frame-pointer workaround to ARM machines which
> > support NEON building for Thumb would be an even more targeted
> > solution.
>
> I finally found time to test fixing the assembly code to use r12
> instead of r7. Seems to work fine (I was first baffled by incorrect
> behaviour, because I changed "{r4-r7}" to "{r4-r12}" without realizing
> that "r4-r12" meant a range of all registers from r4 to r12).
>
> Can you enlighten me: why did you choose r12 instead of r8? Why did the
> original author use registers r4-r7 instead of r0-r3? Is it somehow
> advisable to avoid registers r0-r3 and r8-r11? The code seems to work
> fine with any set of registers, except r7.

The compiler will work around whichever set of registers you want to
use (apart from r7 in some cases) so it's expected that other
combinations will work fine. Some combinations will be more efficient
than others (ie the compiler will need to do less shuffling values
between registers or saving register values to the stack in order to
make registers you specify available to you). Using r12 instead of r8
is just an educated guess about the combination will allow the
compiler to generate the most efficient code.

Registers r0-r3 and r12 can be used within a function without needing
to preserve their previous contents, so if a function needs registers
it's more efficient to use these registers first. Other registers need
to be preserved (ie saved to the stack) before use.

Registers r0-r3 are also used to pass non-floating point arguments to
a function, so if a function takes 4 or more non-floating point
arguments, then r0-r3 will already contain values which the function
will need to use.

Note that in this particular function, the first argument (ie the
pointer m) is never actually used, so it may be that using r0, r4, r5
and r12 will give the best result. The function is pretty trivial
though so I guess with a recent compiler just writing the whole thing
in C will give close to the optimal result too without all the
maintenance issues.
