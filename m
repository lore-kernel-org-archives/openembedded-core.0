Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.1038.1619192159917301490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 08:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sH6r0y4j;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id g17so57242951edm.6
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 08:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4jCQO2W6IHPRdhO3QGnLPCReoFNlWKUt3219ox2l2ng=;
        b=sH6r0y4jHYdHGpdCNkxMnNphc24MKWZ08IDgdzzMptWV7m6AMyAnHjSn9dAWtezXJh
         dDDGe0uOe849tJVSQaM6y7U08w7JruwzXrx+za/pXL05F1OsdqIK2sG2cCLbgTofauah
         NnUrEApwaXq3pSwC7lBW1LNX2z+npQoi59Hpl0GE+9yF7UOyb7Nei658mrQB2Xqk/tNJ
         wIZtBHY2lev5zP+6stAWpc57nDrhWsekGwS9pr2YCM6Jjb6Y3c8GTiBax/07UKxdl00p
         scD87+QZ6ZRNBaAbmColeYOZRDPoXytx+/3y9vXQCZRqWBafRZy9PcsxLoy/EwoffEq3
         GvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4jCQO2W6IHPRdhO3QGnLPCReoFNlWKUt3219ox2l2ng=;
        b=i0DGfslbCBO1lUkz5Z126fvZBDjI7f3aFi27KnTvP5sSFq1qOm1JXKcGNbadnH6bNy
         sLBIIvwGxiqtbSObCYhzfAXGf/sc1PQg2C3R7lyGaSo3OvbjQ3BpCsWabBW8RYJRySct
         JprM+dKz2Z+C1jun+OtlUo9rmXg2kK+8utA5rZqs0BIf+kOMtRFGEGsGlnWfFllMbt0m
         MmVh/x5qdqq8KP1pHFXxu7an12iHOeOU54EV5je1ewtO0mFgsKEm6bvwkenNpY9Nf2v2
         TmBZDKVfK2+8I7rc4LaxGAqk1FelMN/bcOtG866vI99zjRjFHPjQlUByQsN/XzLA25E4
         sp8w==
X-Gm-Message-State: AOAM5331Cd3aeoyicG1RSEzmoxPaWoTOTz/G3L7exFJjoMg1Kbro+GjD
	eCO2UXp4JhLi5IlB8q9y8WlCGRLXTRIaFvV+dWc=
X-Google-Smtp-Source: ABdhPJwkq2AudHWmo2/sZw0qnohFMfB4hsJEJMBepSbymuXWGvsCI1mChovHadE4EAX4DEwILWYYMbWoT4Vp4Yf9xws=
X-Received: by 2002:a05:6402:27d3:: with SMTP id c19mr5275507ede.129.1619192158415;
 Fri, 23 Apr 2021 08:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <Gvtb.1619190188941654950.yc90@lists.openembedded.org>
In-Reply-To: <Gvtb.1619190188941654950.yc90@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 23 Apr 2021 11:35:47 -0400
Message-ID: <CADkTA4PbOd459xYigZh9q4Eh5hxyK50t=poH6B4HOqhNeMYnCA@mail.gmail.com>
Subject: Re: [OE-core] Need suggestions: in case where linux-lib-headers and the kernel versions differ
To: Sourabh Banerjee <sbanerje@codeaurora.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 23, 2021 at 11:03 AM Sourabh Banerjee
<sbanerje@codeaurora.org> wrote:
>
> Hi All,
> I need your suggestion on how to reconcile if the linux-libc-headers and kernel versions are different?
> For this discussion let's consider we are using the LTS branch YP-3.1 (Dunfell).
> With Dunfell let's consider following 3 cases:
>
> 1) Machine is supported on 5.4 kernel
>     Kernel Recipe: linux-yocto_5.4.bb
>     libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
>     There is no conflict in this case as libc-headers and linux-yocto are on same version.
>
> 2) Machine is supported on a higher kernel (let's say 5.10)
>     Kernel Recipe: Let's assume provided by a BSP layer, linux_5.10.bb
>     libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
>     The kernel version is higher in this case. But, should be okay as 5.10 UAPI is backward compatible and supports  linux-libc-headers_5.4 completely.
>
> 3) Machine is supported on a lower kernel (let's say 4.19)
>     Kernel Recipe: Let's assume provided by a BSP layer, linux_4.19.bb
>     libc-headers: meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.4.bb
>     The kernel version is lower in this case. I suppose, this may lead to some runtime issues? As the kernel built from 4.19 will not be able to support 5.4 UAPI fully.
>     What's the recommendation here? Should the BSP provider port linux-libc-header_4.19.bb in BSP layer and set PREFERRED_VERSION_linux-libc-headers = "4.19%"
>

This is not something that we've really seen happen.  When the
libc-headers are property used, they'll check/probe for functionality
and use what is available.

If you have drivers/applications going directly at the libc-headers,
versus the toolchain use. That is a different question. In this case,
you'd be better of dealing with these on a per-application basis, and
pointing them at alternate headers.

You can dream up all sorts of issues, and most of them don't happen in
practice. I've run hundreds of kernels that are older than the
libc-headers, and have never run into an issue with standard,
non-machine specific applications.

Just look at master of oe-core. We continue to support 5.4, after I've
bumped the headers to 5.10.

Cheers,

Bruce

>     I suspect this as UAPI headers such as following differ, and what if this leads to runtime issues in case #3
>       -  videodev2.h: This header is enhanced in 5.4
>       -  fsverity.h : this header is not present in 4.19
>
> --
> Regards,
> Sourabh
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
