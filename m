Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.12513.1628098171630721223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 10:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dQpW6J2c;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.51, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f51.google.com with SMTP id d131-20020a1c1d890000b02902516717f562so1922561wmd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lz9eP4Q065EAnlAUwGDxKsG2M9OtzoubJg31Aqqa0G0=;
        b=dQpW6J2cK44iJHBHpQMrBjLXJA3a9+5O9jbv2hUaQ9UEl3fy5BWTkw5DTArvB8CdHn
         HKBfwBhFpF47WHgqwkiFMVP2FBcxO6w4rspUp3TWtUCZ+ShLbQ5/gwAzkiincOorcc9m
         MWuFkhMgmrhGnZ7Fmz36KGVB2rkUdUkyZl7mEDI9HQf5vvyD5deHecq3ghPPVtIlIF/1
         ipEEd2E8tyQeEJNdacu+4kWkpMWebM6ytXxvo/Ks54Q1uzVO5IETxF4tkZp8hToKD7EU
         7L/40nPdK4eoKqIOQ4aJ283L6EMlDDuWHhXBfS/EZe+Tj/mOa9B64AdXxWwi+t6Ov7QS
         Xnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lz9eP4Q065EAnlAUwGDxKsG2M9OtzoubJg31Aqqa0G0=;
        b=QPi1gAaKV2MgMtmuFRMee+8S0awuGWFwD0HtAzbF6tM60NpNmiqWVNDYJQMmFh8Nxy
         8L4eg3agmNTGzh9sVTiCcR3p+uBQu2QxNtYwqSjdeLeinLorhViNhv95e/OH23r2uQL0
         zZgPJNxHfKgNuDPjNhMyTcft2mWyT7XvFkNHw/Xf37L+UCl54VgNZ2cTLfdWg7nPRNJH
         VZjp+Q59/4d0UKW5Cb4GDdvQe0QmOKRyR4U9sN8O2z2hN+LeW3MbfuEhI211G1C+KqLb
         /AXH9fAsrpn14hZFbViJlXQFBKzcAR02QL480AU27K4SIsxqFB5eo0u9/vUVZP8zAV6d
         GdrQ==
X-Gm-Message-State: AOAM533EU4uVsQE7/uHonQkA0+P0d2APrJMcJJUqjAkWM0RNjT8cUWBV
	Zft9zrNJVQusO4bPsZsK9q7poiQxU7n9HgpdaXteVg==
X-Google-Smtp-Source: ABdhPJyUT0RU5NwGtBCp6QOAc5Pg/zePZbBNosdosSs+wEeNB206+ad3gPpjn1REUbEBZCU+YZGxxEFpjmWjf2gKjrQ=
X-Received: by 2002:a7b:cc98:: with SMTP id p24mr10922890wma.118.1628098170063;
 Wed, 04 Aug 2021 10:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210804081051.795458-1-mac@mcrowe.com> <CAOSpxdbF=wwtijC+q8M8Bn=-=03gQ9DABr3Gk56M51jaRK4qbA@mail.gmail.com>
 <20210804170619.GA23238@mcrowe.com>
In-Reply-To: <20210804170619.GA23238@mcrowe.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 4 Aug 2021 07:29:18 -1000
Message-ID: <CAOSpxdaatsBUV65JoM3nxVvZqVD3hPFjQV0V4QZvO5OtyoRL5w@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] curl: Fix CVE-2021-22924 and CVE-2021-22925
To: Mike Crowe <yocto@mac.mcrowe.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 4, 2021 at 7:06 AM Mike Crowe <yocto@mac.mcrowe.com> wrote:
>
> On Wednesday 04 August 2021 at 06:44:51 -1000, Steve Sakoman wrote:
> > On Tue, Aug 3, 2021 at 10:11 PM Mike Crowe via lists.openembedded.org
> > <yocto=mac.mcrowe.com@lists.openembedded.org> wrote:
> > >
> > > curl v7.78 contained fixes for five CVEs:
> > >
> > > CVE-2021-22922 and CVE-2021-22923 are only present when support for
> > > metalink is enabled. EXTRA_OECONF contains "--without-libmetalink" so
> > > these fixes are unnecessary.
> > >
> > > CVE-2021-22926 only affects builds for MacOS.
> > >
> > > CVE-2021-22924 and CVE-2021-22925 are both applicable. Take the patches
> > > from Ubuntu 20.04 curl_7.68.0-1ubuntu2.6 package which is close enough
> > > that the patch for CVE-2021-22924 applies without conflicts. The
> > > CVE-2021-22925 patch required only a small tweak to apply.
> >
> > Being curious why none of these are showing up in the reports I
> > checked the CPE database and it seems none of them are present!  So
> > that explains why.
> >
> > Do you know why they are missing?  Perhaps a status of RESERVED?  See:
> >
> > https://nvd.nist.gov/vuln/detail/CVE-2021-22923
>
> I'm afraid that I have no idea. :( I just watch curl release announcements
> to assess the security impact on our products and spotted these.
>
> > Since they seem to be real issues though I can take the patch once you
> > send a V2 with the issue below fixed.
>
> > [ Need to have a CVE tag and your signed-off-by in both patch files. ]
>
> v2 should have arrived. I must have sneaked my previous CVE fixes through
> without them somehow. :)

My bad then :-)  I'm trying to be better about making sure that we
have the tag, status, and sign-off-by in the CVE patches!

Steve

>
> > It might make sense to whitelist the CVE's that don't apply to us so
> > that once the entries hit the database we will already have dealt with
> > them.
>
> Hopefully done.
>
> Thanks.
>
> Mike.
