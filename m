Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com [209.85.222.66])
 by mx.groups.io with SMTP id smtpd.web12.5167.1596627294892614927
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 04:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UVsb3TLJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.66, mailfrom: andrey.z@gmail.com)
Received: by mail-ua1-f66.google.com with SMTP id d20so3298802ual.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 04:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+jFE1ComPDMedI2ndzzWFlaMeoNP39YmewYORWnQZi8=;
        b=UVsb3TLJ2wkYflILM0Sw0f+eBGJRz2sIWUVPZad4GSrkTYPt1QgaHaQfbD6+mDRBdj
         J3pXdxxWt2kVRDJnEARi1Ou92nnvy64vgkbeXuLHYxQD22nr9QAeZMIbkQYjv2vzttz/
         dD2eNM0gYCMJgOd8Jn38tHHHKvem7M/1uB6YzFStwucRYEtTom1nsafuHTdxCvYZtfb+
         zN6Zmdwa/n/05G2PAFABXZWOriFkKVxvIEdGG+B58p1Aed7g/hQ79XpGAuSfVXmdIK2/
         RYIu5cJPzcepWdPexBi/bAAeiTwfQJfVTag1KxczsF+SMSJX7v2xL9Fwm2m64/+LhFaz
         qRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+jFE1ComPDMedI2ndzzWFlaMeoNP39YmewYORWnQZi8=;
        b=IESkZIfDRHNeDPR8StUSp7GcZi4PujKH5Cf8aUPnTfsPIwkpzZme8BiLEAGU44U0LZ
         llwIXYonR7SaLM807yxxnsdWOIBa/YP1ABJsYMWrLiAjGK//mPul++FdrS8hsu1iooDg
         8p2ltx+yK81PzdN3plnQ7ZrrCVnvJj+0ObjbtI1uzsuyjcNJNPhfhsCpd0zPmqorJ/hl
         nrdBFiqQnGXrVW7AOSwWHQCevhKORX/oayqtCgHquxsX9geSFsd4s8BBXIsLlf7u3RRK
         FNucyOnvqx2dvmXYZj2epvT8epn/qeBSIlAUvHkx2WoxPRwDQruPdV6fvrMq6kUcSs3C
         6FtQ==
X-Gm-Message-State: AOAM532iC7mcdEwAj1nhHzcheUqRR7MG6afAOt1siTrzNlqY/mGSQQBN
	L6/cljczAS0DwONBG+twXHvc/4RjJfZBywZdpmo=
X-Google-Smtp-Source: ABdhPJyzAhp3j6jm5EtGec8YPwwIKZeDUnBWDxVC/F1DFzjmZkEBTt1iS1YkOXcbodotSA1aGCC/l/4wMWaxP1RJuAU=
X-Received: by 2002:ab0:6eca:: with SMTP id c10mr1716617uav.5.1596627294071;
 Wed, 05 Aug 2020 04:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594989620.git.bruce.ashfield@gmail.com> <3d609c832b9475706c45ace895aed899a6670542.camel@linuxfoundation.org>
In-Reply-To: <3d609c832b9475706c45ace895aed899a6670542.camel@linuxfoundation.org>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Wed, 5 Aug 2020 13:34:42 +0200
Message-ID: <CAHtQpK7CE4V__gweCEuCPttXoUa4PCpqToivbkvD8uUD1bcAZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] kernel/yocto: conslidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, "Mittal, Anuj" <anuj.mittal@intel.com>, 
	Ross Burton <ross@burtonini.com>, Jon Mason <Jon.Mason@arm.com>, 
	Kevin Hao <kexin.hao@windriver.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 5, 2020 at 1:06 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2020-07-17 at 08:56 -0400, bruce.ashfield@gmail.com wrote:
> > Here's my latest set of patches.
> >
> > For 5.4: a -stable update, and -rt bug fix
> >
> > For the build: a tweak to the config generation (as reported
> > and discussed on the mailing list)
> >
> > For 5.8 (aka the next reference kernel): a fix for devsrc and
> > on target kernel building. With this tweak, I have all of the
> > refrences booting and passing most tests on 5.8, so we are in
> > good shape on that front. I'll be doing libc-headers testing
> > next.
> >
> > I ran these through the AB and local testing, no issues popped
> > up, except a warning on qemuarm-alt in my last run. It was
> > about a console login and didn't look related to the change,
> > but I'm keeping my eye on it.
>
> Thanks, I ran this combined with Khem's binutils change through the
> autobuilder and your changes are likely fine but we need more work to
> get binutils in. Basically:
>
> * meta-arm needs to add the kernel patch for perf
> * meta-intel needs to add the kernel patch for perf
> * the hardware BSPs need to add the kernel patch for perf

meta-freescale has this patch already included for 5.4.y kernel:
https://github.com/Freescale/linux-fslc/commit/415afad5ca95f303000b58b7c77871e99c8244b5

>
> I've added a few maintainers/people to the address list to try and sort
> that out. Who is going to handle the hardware platforms?
>
> Cheers,
>
> Richard
>
>
>
>
> 



-- 
Regards,
Andrey.
