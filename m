Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web08.1573.1619207544387795278
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 12:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LDdBG844;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id s15so58709004edd.4
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=79KZo4a6t+YAJhaRiGuW5RmqyHrithw6/gM67/FoM4w=;
        b=LDdBG844H5f5vm0BLkrrwu4p4HX9mmLneqQfcTBG2MKlmHY2hWSxlQUWGAX3YyHEWT
         QrbW4qtDrjwRaOiVQhRKOYnihKgcj4DTesX3sSLVmGZAvtSRdZf+hftnexT1GiglK0xt
         DrtexLL85I21/3c7NPOatvTt7pScVlUMJ4HJWB8dEtF+qlzuwkqFvzUSTo7r56dcVdLK
         kJ3hdVNdoimSsJ0FAkCunY0sOSOUkkh7d7quGmWVc9AMO+wrhnMbnkfhDqmJ5bI4AynD
         ZWUb70LLQRFPrXMdUtxZ5/vpz0ajHgrJOk2R+GmoHidi3BFtfun2mhumi91WNAq9Qha8
         GD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=79KZo4a6t+YAJhaRiGuW5RmqyHrithw6/gM67/FoM4w=;
        b=ATQ2IZXZYK6HKeXRXC/KjWObeyn6CfuJP+rGC+Zw0SMYC6LQSHcgUEcR8hVYJmiKCZ
         uRRZXP/YQBg3QHtKOnQorqPBOOdEfsqjVDE0aRefuP+rxj4dYVWUGKI1Hc+1nGFaGbF5
         fPvqXOafgktoCT89ybFtrH9kkPWJzbUkt7LaM3TX1MVDTIe88FdO7TgDYR9bFAKFiC95
         OM5RL/BrMKhebUuPfMP3RpPy7oqkLzJyZVngrAO9ExFd5M5mlNh3XMa6p8D3hf+mOIRx
         S22BYOo4/m2JTOP1GlgjJoluAKywREQY21yG0qKjPHyqx4nhziXfnhZ5Nk/OnlP84g5p
         8thA==
X-Gm-Message-State: AOAM530viYDn9Prhb0JKj1a5asAuUhgUPpk7YLit2Dt5hidcHLEdcAWr
	xfezzZ/S6ClA+UG2FXxXrwan1CpStMeApdpd3i8=
X-Google-Smtp-Source: ABdhPJygY0uih+rRllBghvTmLNUEZe5P8dzeE9dVUGHBmw2Lqfv0d1DvpD5voMxWkGL1qOFUPWxmBVftvaNh+I53pks=
X-Received: by 2002:a05:6402:105a:: with SMTP id e26mr6475527edu.164.1619207542778;
 Fri, 23 Apr 2021 12:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <Gvtb.1619190188941654950.yc90@lists.openembedded.org>
 <57e178c2-1711-9e6a-ce71-227d4dd7e7cd@gmail.com> <fd9e8073844931cab52e4c9b84a1918a@codeaurora.org>
In-Reply-To: <fd9e8073844931cab52e4c9b84a1918a@codeaurora.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 23 Apr 2021 15:52:11 -0400
Message-ID: <CADkTA4NwE5DKomrz+n1Ds8rYDcAVwLgxREepRUVsLA5BSP-5kw@mail.gmail.com>
Subject: Re: [OE-core] Need suggestions: in case where linux-lib-headers and the kernel versions differ
To: Sourabh Banerjee <sbanerje@codeaurora.org>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 3:31 PM Sourabh Banerjee
<sbanerje@codeaurora.org> wrote:
>
>
> Thank you for sharing your thoughts!
>
> Let me focus a bit on the case where the BSP kernel is lower than libc.
> I.e., BSP layer comes with kernel 4.19 support for the machine in
> question.
>
>  From your replies I see following options:
>
> Option #1)
> Use linux-libc-headers_5.4 as it is from poky. BSP layer provides the
> lower version of kernel.
> There may be selective bugs for application (Such as the libnl case
> discussed on thread).
>
> Deal with such applications case-by-case. By case-by-case, I mean, with
> a linux-vendor-headers.
> And make the application depend on linux-vendor-headers and look for the
> header under custom path?

To be clear, you don't have to do this for everything. Everything in oe-ore
(as an example) has already been tested against the libc-headers in the
release, at both a lower and matching kernel version level.

It is good to be concerned, but this is not a common occurrence, and really
isn't the case to optimize for (i.e. that there is an issue, most applications
simply don't care, and it isn't impossible to identify ones that do).

>
> Option #2)
> Implement a linux-libc-headers_4.19 (or the lower version you are at).
> This way seemingly, the headers and kernel coming from BSP layer are
> reconciled.
>
> But, doing so violates the "Poky" distro, as "Poky" originally came with
> linux-libc-headers_5.4 on Dunfell.
> And, that is bad idea, hence create your own higher distro layer that
> chooses linux-libc-headers_4.19.
>
>
> All done, this approach still does not make things right!
>
> As all testing/validation of 3rd-Party applications/3rd-Party layers
> that Yocto Project
> and different contributors have done using Poky and with the original
> linux-libc-headers_5.4, are lost.
>
> The lower version of headers are exposing those 3rd-Party
> applications/3rd-Party to unknown issues.
>
> It's sort of a dilemma!
> The customer I am working with is worried about "Option #1"
> (linux-libc-headers_5.4 + lower BSP kernel).
> As discovery of 5.4 vs 4.19 bugs may not be easy to uncover. And then
> for for a case-by-case fix they will
> have to deviate away from linux-libc-headers, and make application
> recipes, header path specific fixes.
>
> "Option #2" (linux-libc-headers_4.19 from a higher distro layer), seems
> like a way out, but at the cost of upending all
> the testing and validation done with linux-libc-headers_5.4 for upstream
> recipes/3rd-party layer.
>
> Upgrading the machine from 4.19 to 5.4 is also off the table at this
> time.
>
>
> Option #3)
> Selective Backport.
>
> I am trying to get a feel if this is even the right path?
> Let linux-libc-headers_5.4 be as it is from poky. BSP layer provides the
> lower version of kernel.
> Identify and freeze on list of the UAPI headers that customer plans to
> use from linux-libc-headers_5.4.

This really isn't any different than option #1. If you can identify the
UAPI headers you are interested in, and can identify the applications
that use them .. then simply provide those headers to those applications
as you would in #1.

I wouldn't recommend it.

If you are really concerned about the mismatch, then you can/should
define your own distro and provide the matching libc-headers. That's
the less error prone way to do it,  if it is something you want to do.

Bruce

>
> Determine what is the gap between 4.19 and 5.4, backport those from 5.4
> to 4.19.
> Do a similar exercise with 3rd-party OSS applications/frameworks/layers
> to be used on project and
> weed out cases like libnl by way of backporting from 5.4 to 4.19.
>
>
> Does this seem to keep things aligned with linux-libc-headers from
> "Poky" and still addresses the holes that lower
> BSP kernel creates when working with linux-libc-headers_5.4?
>
> Thanks for your time!
> --
> Regards,
> Sourabh
>
>
> On 2021-04-23 23:31, Khem Raj wrote:
> > On 4/23/21 8:03 AM, Sourabh Banerjee wrote:
> >> Hi All,
> >> I need your suggestion on how to reconcile if the linux-libc-headers
> >> and kernel versions are different?
> >> For this discussion let's consider we are using the LTS branch YP-3.1
> >> (Dunfell).
> >> With Dunfell let's consider following 3 cases:
> >>
> >> 1) Machine is supported on 5.4 kernel
> >> *Kernel Recipe:* linux-yocto_5.4.bb
> >> *libc-headers:* meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
> >>      There is no conflict in this case as libc-headers and linux-yocto
> >> are on same version.
> >>
> >> 2) Machine is supported on a higher kernel (let's say 5.10)
> >> *Kernel Recipe:* Let's assume provided by a BSP layer, linux_5.10.bb
> >> *libc-headers:* meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
> >>      The kernel version is higher in this case. But, should be okay as
> >> 5.10 UAPI is backward compatible and supports
> >> linux-libc-headers_5.4 completely.
> >>
> >> 3) Machine is supported on a lower kernel (let's say 4.19)
> >> Kernel Recipe: Let's assume provided by a BSP layer, linux_4.19.bb
> >> libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
> >>      The kernel version is lower in this case. I suppose, this may
> >> lead to some runtime issues? As the kernel built from 4.19 will not be
> >> able to support 5.4 UAPI fully.
> >>      What's the recommendation here? Should the BSP provider port
> >> linux-libc-header_4.19.bb in BSP layer and
> >> set PREFERRED_VERSION_linux-libc-headers = "4.19%"
> >>
> >>      I suspect this as UAPI headers such as following differ, and what
> >> if this leads to runtime issues in case #3
> >>        -  videodev2.h: This header is enhanced in 5.4
> >>        -  fsverity.h : this header is not present in 4.19
> >>
> >
> > right. all this combos should work fine in general case, however they
> > all are not tested with equal coverage. So best is always to try have
> > UAPIs older or equal to the kernel you intend to use. Generally
> > releases support supported LTS kernels and that should be good enough,
> > however if you have very old kernel and want to use latest yocto
> > release, be aware that we are not testing it with those old UAPIs so
> > all testing falls on your in this regard.
> >
> >> -- Regards,
> >> Sourabh
> >>
> >>
> >>
> >>
>
>
> --
> Regards,
> Sourabh
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
