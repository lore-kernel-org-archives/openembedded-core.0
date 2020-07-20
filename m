Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.7069.1595284031020361684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 15:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bvwdnxmm;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id x62so14697616qtd.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2020 15:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eyrSCqWXgXHFWe/x/RRqOY7NhV7dk43oh1TequojhOQ=;
        b=BvwdnxmmrmmqP1raTkmFFdcE2VGDRsMuB0cDH4Kdd0X/pNOHfcxJvNFOYFOeK74T0v
         jj2zn8Wk2JtlkSdqCYX+90aARLLisg+kR9SsGYM7hboDQYvG4aputfm+6y2lf7Le+vgm
         AGqQmOOvSI8I99k5h3/5yk0EbEX1plL/ABIFiw+9zaeqtdBHLCegsn3qBoW7JcDC6rz7
         GtBrizvwEH4lUG4syYBHR0lyc+V97bu4qbTEhOJED15n/ZWbjSArXhcgYpTovOKPLEDk
         qip+eb3AcAJWM/OSLaIFyAfsJ/L2RNLxGw4JLmjqGUsPlWJrV8H+z1OtMiHXzYjZt9a1
         VJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eyrSCqWXgXHFWe/x/RRqOY7NhV7dk43oh1TequojhOQ=;
        b=N/eJTNXMES41Rjfux/x3TznXZRY8/G9MNztLZYle00z3XKMD3/Frr81QWFY4KQEFKG
         5gOEXU1FvfQaVEZ1/xV85zFYH3Hsk/ash95kgUt9U4F4Bm6WvW0is46gNbimuWqeuW0l
         mTRnr++QLCj6K/BO8QX7se6QAcewgSBkRF5wTIFhX6Hj3nV/bvXbp1O6lCvUZ2aRaQDf
         irhZlAUoYOdXHSxZZYJCY/DXavbVwN71y0cFUk/AfEHUgpEeWqr+Xb3wRXzoDKVulZS2
         VFeuzRtvd5dCzsD1faKUj/FB6o/syUJbDHkKY6Dd8qrkgrChg9kW35rlQC/kgUDKB5xx
         wg1g==
X-Gm-Message-State: AOAM533xPxIJ9TwX40g9HGlVn0eh75JGvwyLKhiZby53meMVMSnGedkK
	xKgRK94Izirv40q6hCdwOkxKqgtLmSG8wbrBBs4=
X-Google-Smtp-Source: ABdhPJxvdr9R8D4ZaY1D2KlCBtatfyW2bzNxsZei8VvdSJuT5ImfROv+DmSJaPaZWqBDcQlMx4Rik4F4JlWy9Al1j/E=
X-Received: by 2002:ac8:47ce:: with SMTP id d14mr26037979qtr.285.1595284030078;
 Mon, 20 Jul 2020 15:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
In-Reply-To: <64ecaddb6eaae1bd569e299ffb03b13081efe50b.camel@iki.fi>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Jul 2020 15:26:44 -0700
Message-ID: <CAMKF1sqvmPNPs6Vsh111hmWt3Fd-7E_4XbyQqrrvfqGH=RKYsg@mail.gmail.com>
Subject: Re: [OE-core] Why disable NEON support in recipes if runtime detection works?
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 19, 2020 at 2:06 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
>
> Hi!
>
> If a recipe provides NEON optimizations, should those be explicitly
> disabled when "neon" is not in TUNE_FEATUERS, even if the software is
> able to detect NEON availability at runtime?
>
> I'm currently converting the pulseaudio recipe from Autotools to Meson,
> and the old Autotools build system supports disabling NEON
> optimizations but the Meson build system doesn't. So I'm wondering if I
> should add the missing feature to the Meson build system, or just let
> the runtime detection do its work.
>
> Is there ever need for disabling NEON optimizations if the CPU
> indicates NEON support? I guess it could be useful for testing the "no
> NEON" case (I today found out that dropping "neon" from TUNE_FEATURES
> doesn't remove NEON support from the qemuarm machine), but otherwise it
> seems unnecessary, unless there are CPUs that advertise NEON support
> but don't actually support it.
>

I think the issue will result in a compiler error perhaps when neon is
disabled via
compiler command line which would be the case when neon is not in TUNE_FEATURES
the compiler might warn or error out when it finds neon instructions
being compiled via inline
assembly.  you just can try passing something like -mfpu=vfpv3d16 or
some such and see if
compiler/assembler complains during build, if not then perhaps its fine.

> PulseAudio doesn't have a similar configure switch for the x86
> optimizations, so in the name of consistency I would like to rely only
> on the runtime CPU detection also for the NEON optimizations.
>
> --
> Tanu
>
> https://www.patreon.com/tanuk
> https://liberapay.com/tanuk
>
> 
