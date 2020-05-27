Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.114.1590616012066499891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 14:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NpvKfG1y;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id x13so11958155qvr.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 14:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OAzICw5UHmgjXGYT486FncGz8u2h94bz/VO9TXFwa2M=;
        b=NpvKfG1yypDwXF7LbBuCZ/XYc4BXYC7481vcvnb9vjCkGdTbCQbeXujyEgxkJl/77N
         dMOGwc4pvqUeG5F7N0y7ThLtCgb7gp6GmrAHyTSQQ4bMbgca3/pHs5Vn6O6FIco3sAfY
         3Jpz+DUGLU5Uu6EA9UyHWto9VZN5FxujJzfv0ekHv2cXIi7XIyupvVeA0aMK6gvONwln
         D5E4akLaRybM/JDqXX08nfgRTD40PAEmEO0lnQ90OZAP7fue52TeJ7sJmpibiw3yBRaE
         wRoqMXlGlGH5Wy//SIS77YCOJYTSIr2/gCvKrMgIBO6+sPvBqn44cH0RGo6/kzE36oaE
         hGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OAzICw5UHmgjXGYT486FncGz8u2h94bz/VO9TXFwa2M=;
        b=CHAmLKoD2VXtCHmMuB8zBjPVbQH7L99ZPwUq1kQ4FpYEu8E/svW4VK5z+jtApbg/rN
         bABwpBjoEOMlzV2p7Bap6dxm+yK8HcBtMxPMMa8yH7KK4MB1UWjzH8ZbQ5gmRXYETCJC
         q1j5dalxK5gtetFW9ugNAVQSevYlnp8QzAHfM/JtvMGIfwLYy1Ucos4IH8ocz/5tVfoB
         0sfj5zJH0EriFZllepNKfOrKma0MXuyePGI6XW866RhBmSVTzea71uYeiFtQLfH4cg7T
         qPry7CnUSgAvc0z2L5WN66gSskPfbIIAw5VhPTritrvEuKn3paDKSevh1RKha93H06CT
         SeJQ==
X-Gm-Message-State: AOAM532SWA6OVkbseE1LP2ilCVYET0ADx3OGdm2L9MFJAvtYlGjfZWKH
	z7Yvf+MdtMTEjTQ6wgJv357eklHAsvGoC0wbMz4=
X-Google-Smtp-Source: ABdhPJx0jfGhoZFl2oARDr7AIhdYVqoSCFUCMr/T7vKuaxMyM93a9x1W7eRmClEZmKNmOBYXjnzHPma0lODJn7ssSoQ=
X-Received: by 2002:ad4:4b26:: with SMTP id s6mr79840qvw.146.1590616011087;
 Wed, 27 May 2020 14:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200527155011.3165976-1-raj.khem@gmail.com> <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
In-Reply-To: <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 27 May 2020 14:46:24 -0700
Message-ID: <CAMKF1spMw=6ZfkBWy3=+rSiHknxLvVC6uPH3Q8z_UiGdOECVdw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Denys Dmytriyenko <denis@denix.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 27, 2020 at 2:25 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2020-05-27 at 11:59 -0400, Denys Dmytriyenko wrote:
> > On Wed, May 27, 2020 at 08:50:11AM -0700, Khem Raj wrote:
> > > asm/bpf_perf_event.h does not exist in older kernels e.g. ( 4.1 )
> > > this helps in using common header across multiple versions of
> > > kernel
> > > going back
> >
> > This check should have been there from the beginning and for every
> > header
> > file. It's big PITA to sync this list up, especially when dealing
> > with
> > different glibc or kernel than OE-Core, e.g. external toolchains,
> > etc.
> >
> > Any objections to making this check more generic for every entry in
> > the list?
>
> Yes, a strong objection. We don't want to support or encourage every
> kernel version out there.
>
> I also don't understand why people need to change the libc-headers
> anyway :(

building products doesn't mean you are on the latest kernels sadly,
that's just the reality of world
and building userspace against way newer kernel-headers with older
kernel underneath has unintended
consequences. So its always better to use matching UAPIs to the kernel
version to avoid these mismatches

>
> Cheers,
>
> Richard
>
