Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.125.1620920942580799657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 08:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RZVz2lE8;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id x5so27343992wrv.13
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 08:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P4OJJ9gmATl+f9E/WaApmeGQTI2x/7vTKerOf3zFutI=;
        b=RZVz2lE83UxeDWZU3EdvcI4HpwXo7uAHFaAIWQTMujFnrbh9qLnSAFsskpxgPj/9we
         bgwUhjwjSOfapwvbpsjR96mvL+xfY11rWNrFoTc/c0eUOHoENHNd0VdaN6JDZFlYdX2x
         5/Gbw7xXwcnwyWuaQoagn6USlvzUEKRPKpF0jo+JXPj+WY2zIH0rnGqdQj9ePaMlY3cs
         eFGihwgamhIwVgd/jORrlMMjYSa7Ux87VzkiLreEi3Ak88l/Npn2x84DMW5WNoiqJpQF
         UcErzhMX137yvwNWFQnV8c3kCgScLa1JaiXu9I00GhVmoz47DTvhm+D25cg192moXC/z
         ljRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P4OJJ9gmATl+f9E/WaApmeGQTI2x/7vTKerOf3zFutI=;
        b=DlBCoanRuB3ss/MAKlGUOkS3mrROde3yEX7IuuXDClarIztYZHwrbDqnjMsWnX1/18
         ch1N5gKR5wGvn6F66JqUKHqo/RciZVaBEINeo63mhQI5tnS06+mYcuF2BLoztSPMNeBx
         GnATjCc4qyfxt7JQTSwQcmmxPfKC54RQUy4hmX3BBpZ+kLQMsP3c8+kPUVAtLV8XPxdb
         8y/YjtrE+jPtELZpkhJLDk0NPUS9+/jawYmkKd4KieQkGCKNvSgq6dGl4UBcM05T8yPx
         VdQTfO48gxIlg4PH/tGv95Nf5SBfWDya1i7iNWLGIObIxnoo/fLmEuLOKfQETVn0Db2u
         kgNQ==
X-Gm-Message-State: AOAM53163LlX2Vat5rOxOS+OadLBpI3R0U7ift8nNAWsX29EPMFr0Zoa
	x/OHtSxh1JkCzVCYbc2i8pj7i6TLzESf9CUeuyQ=
X-Google-Smtp-Source: ABdhPJzv95UhcIzmYY0nN4tmKxEAD0DjmxYC0b/Wgx+F+vkt6e+r3CBYF4i501fWHL9nYuXmJcQ01I8vo2ufCu095ek=
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr54560814wrw.361.1620920941051;
 Thu, 13 May 2021 08:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210510023310.5516-1-mingli.yu@windriver.com>
 <5aa52a186119be3add2555d6dbc89f348699aae8.camel@linuxfoundation.org> <fac5bcb3-fa84-5b3d-20be-779b6b55781a@embed.me.uk>
In-Reply-To: <fac5bcb3-fa84-5b3d-20be-779b6b55781a@embed.me.uk>
From: "Joshua Watt" <JPEWhacker@gmail.com>
Date: Thu, 13 May 2021 10:48:50 -0500
Message-ID: <CAJdd5GYBfq6Xho7G9yW3PE=b1ePe_iU0nuUCoH1+2WZtXtknKg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: disable the CPU affinity mask
To: Jack Mitchell <ml@embed.me.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 10, 2021 at 8:23 AM Jack Mitchell <ml@embed.me.uk> wrote:
>
> On 10/05/2021 10:48, Richard Purdie wrote:
> > On Mon, 2021-05-10 at 10:33 +0800, Yu, Mingli wrote:
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> For the jitter entropy source, each task thread will create an internal
> >> counter timer thread when the system clock resolution is under 5MHz.
> >>
> >> But it will introduce high cpu usage for a long time and also make random
> >> data generate too slow if sets the CPU affinity mask of the internal counter
> >> timer thread.
> >>
> >> There is no solution until now and the Upstream recommends to disable
> >> the internal timer and think Jitter RNG will not work due to the coarse
> >> timer. Check [1] and [2] for more details.
> >>
> >> So disable the CPU affinity mask as a workaround to avoid lots of context
> >> switch and too high cpu load for a long time.
> >>
> >> [1] https://github.com/smuellerDD/jitterentropy-library/issues/37
> >> [2] https://github.com/nhorman/rng-tools/pull/123
> >>
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>  ...tter.c-disable-the-CPU-affinity-mask.patch | 48 +++++++++++++++++++
> >>  .../rng-tools/rng-tools_6.11.bb               |  1 +
> >>  2 files changed, 49 insertions(+)
> >>  create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter.c-disable-the-CPU-affinity-mask.patch
> >
> > Thanks for investigating this upstream. From an OE-Core perspective, I've very
> > reluctant to take what looks like a very board specific change which the upstream
> > is advising against. The issue is that this will affect all hardware, not just
> > the hardware which has the issue. I think we need to find a better solution.
> >
> > Cheers,
> >
> > Richard
> >
>
> FWIW I forcefully have to ensure nothing pulls in rng-tools in my builds
> which are for two different Rockchip chipsets (armv7 and armv8) as the
> rng-tools binary pegs the CPU at 100% for minutes after boot, every
> boot. It's particularly annoying as openssh brings it in by default
> which I've unsuccessfully argued is wrong before. I believe the problem
> is probably fairly widespread but just unnoticed.

Is the reason for the CPU being pegged because of the jitter entropy
source? If so, perhaps you can disable libjitterentropy in rng-tools
packageconfig. We might also be able to make that packageconfig option
more "automatic" by basing it on some high precision timer
MACHINE_FEATURE instead of always being included.

>
> Regards,
>
> --
> Jack Mitchell, Consultant
> https://www.tuxable.co.uk
>
> 
>
