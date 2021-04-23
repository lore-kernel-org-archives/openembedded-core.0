Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.70.1619196572693436238
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 09:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RuTnFyhA;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id r20so25082249ejo.11
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 09:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ndOaZwnq2jixZefwX+I95sJduuQmptHzWUxjJoGeBII=;
        b=RuTnFyhADe720P5htK6O/adn/UI5soEvidXQR5P7kubhUOWT0JdMOWqLcgqXCrDXzj
         Y20uFpiuD7ijogMe9OW/8OdUSOgagq7vdw0T3qNh06ZRp3j463qqqxuJr4ac341zkSzo
         ydwdULFzTHZZEj/JvlHv9wHfwrp28pK/G1+KUc0X7HsxxAY9NYsVlWGgq3iaJ8Kw5GDc
         NsNtT/g0Iua+j9yqJt3kKciCAyKM9xY9NccCiGUS/TxaeC4VEc6xTrgMvsAflxqjysFt
         fdBA2vzPZGLBfHDwsj2Ofh2BinZ584fFgJRVVnzYJtLvkIyohSXDyd3HR8n5yC5MRcNE
         /ppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ndOaZwnq2jixZefwX+I95sJduuQmptHzWUxjJoGeBII=;
        b=Kwg51l+hjYVng0AXP+BI4axl/BbIaIOsIA+wXqvOwwXmPD5/t7pzdXKUArvy+Mhxjb
         88aXVfIyt+tuFaA/bjXtqh9pyuCP/fca567mk7aT3yUJ6kQE120D1qqe2FnFm8kHvstE
         KPdLMWDElLSb+8XEZB1Zp8NiIr5lx4K0W0CUPx+j1JjfSBvo93U8+4zhmHbwB7cWe5Qu
         44JPPjvfKT5mbTnYjBmyLKO7mOXM+TBdJMyQX2qFLa5cro0hKJsrXzCCBaNr9BU8HRIg
         H4CaP6+AW3uhiiK/ehkBFKs0uZR4kvB6ReQa+8lh9GaohchQmFr7PrC5J82+paghdASS
         Fr0Q==
X-Gm-Message-State: AOAM5327RtJQQlNN+2Ri6llmzcBsGHohT6ZPalMqeXSmFOBxSowypjb8
	Zd2gHuX/l14H7JyR3w6JICH7wBT2KLAKQ0uHO6Y=
X-Google-Smtp-Source: ABdhPJyaggCKvGtaZz7he0ocJD6D8tjp7rxadlRPNREaW6XJW3d6KYkt4lUyMChMhTtNeIlSWmLtNKIU3jGRg0xAnpM=
X-Received: by 2002:a17:906:3749:: with SMTP id e9mr5255814ejc.247.1619196570939;
 Fri, 23 Apr 2021 09:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <Gvtb.1619190188941654950.yc90@lists.openembedded.org>
 <CADkTA4PbOd459xYigZh9q4Eh5hxyK50t=poH6B4HOqhNeMYnCA@mail.gmail.com> <da4aace2-faba-d14b-1565-4c3ae192e63d@windriver.com>
In-Reply-To: <da4aace2-faba-d14b-1565-4c3ae192e63d@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 23 Apr 2021 12:49:19 -0400
Message-ID: <CADkTA4MEZpTO4GuFGccu-5zfZGm7rrE19L03SO--jrV-_n_fzw@mail.gmail.com>
Subject: Re: [OE-core] Need suggestions: in case where linux-lib-headers and the kernel versions differ
To: Yi Fan Yu <yifan.yu@windriver.com>
Cc: Sourabh Banerjee <sbanerje@codeaurora.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 12:06 PM Yi Fan Yu <yifan.yu@windriver.com> wrote:
>
> On 4/23/21 11:35 AM, Bruce Ashfield wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Fri, Apr 23, 2021 at 11:03 AM Sourabh Banerjee
> > <sbanerje@codeaurora.org> wrote:
> >>
> >> Hi All,
> >> I need your suggestion on how to reconcile if the linux-libc-headers and kernel versions are different?
> >> For this discussion let's consider we are using the LTS branch YP-3.1 (Dunfell).
> >> With Dunfell let's consider following 3 cases:
> >>
> >> 1) Machine is supported on 5.4 kernel
> >>      Kernel Recipe: linux-yocto_5.4.bb
> >>      libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
> >>      There is no conflict in this case as libc-headers and linux-yocto are on same version.
> >>
> >> 2) Machine is supported on a higher kernel (let's say 5.10)
> >>      Kernel Recipe: Let's assume provided by a BSP layer, linux_5.10.bb
> >>      libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
> >>      The kernel version is higher in this case. But, should be okay as 5.10 UAPI is backward compatible and supports  linux-libc-headers_5.4 completely.
> >>
> >> 3) Machine is supported on a lower kernel (let's say 4.19)
> >>      Kernel Recipe: Let's assume provided by a BSP layer, linux_4.19.bb
> >>      libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
> >>      The kernel version is lower in this case. I suppose, this may lead to some runtime issues? As the kernel built from 4.19 will not be able to support 5.4 UAPI fully.
> >>      What's the recommendation here? Should the BSP provider port linux-libc-header_4.19.bb in BSP layer and set PREFERRED_VERSION_linux-libc-headers = "4.19%"
> >>
> >
> > This is not something that we've really seen happen.  When the
> > libc-headers are property used, they'll check/probe for functionality
> > and use what is available.
> >
> > If you have drivers/applications going directly at the libc-headers,
> > versus the toolchain use. That is a different question. In this case,
> > you'd be better of dealing with these on a per-application basis, and
> > pointing them at alternate headers.
> >
> > You can dream up all sorts of issues, and most of them don't happen in
> > practice. I've run hundreds of kernels that are older than the
> > libc-headers, and have never run into an issue with standard,
> > non-machine specific applications.
> >
> > Just look at master of oe-core. We continue to support 5.4, after I've
> > bumped the headers to 5.10.
> >
> maybe unrelated and anecdotal:
>
> I looked at a windriver bug related to a test in libnl called `test-genl`
>
> The failure only occurred in 5.4.X kernel.
> and I was able to narrow it down to the 5.10 header update oe-core
> causing the failure.
>

libnl is known for this. It's basically the ioctl of the networking world.

So that's consistent with what I said, it is rare, and is usually in
tightly coupled applications. When that happens, we almost always just
carry a header or two along with the application itself.

Bruce

> (if you are interested in details, talk to randy...)
>
> > Cheers,
> >
> > Bruce
> >
> >>      I suspect this as UAPI headers such as following differ, and what if this leads to runtime issues in case #3
> >>        -  videodev2.h: This header is enhanced in 5.4
> >>        -  fsverity.h : this header is not present in 4.19
> >>
> >> --
> >> Regards,
> >> Sourabh
> >>
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > 
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
