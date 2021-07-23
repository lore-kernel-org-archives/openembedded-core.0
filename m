Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.3884.1627010975117915539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 20:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X/JRWS8V;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id gt31so1471282ejc.12
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 20:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ruFyR+0kapesZp8LAg1nziwiFimylXIYeTNJuqi8T+M=;
        b=X/JRWS8V8YnoH3hMsQ3+2ROaw5rTrvYEEVqHRk9/d03Z78/9/CnzsaFHov9chXOjYs
         s1eSoeiidEwyXxisu0RYCeT72lnYtottpYD9ntL6BKQZbuWApAOl6zy3KbKlRO+NSPIq
         YDNiZWwXRWOS+hz3gn+UNZiJkPNui4aF6bDo8LweqU2Nmwtb/pNiRRKuLyjZvByXjkpF
         g52BoAi8YdWQlLc8Zy/M35YyNl7E9v5WDLu4XVtLv/1Ib7+2wxrm3Mj2FUFIPNZCu4nq
         F2dUtp7Wc2F2r7AanE/5gGhXga5KFhmKG1MVXZHd/fX+1/n9yoFSVFmwg3DcF+8DEIrW
         K6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ruFyR+0kapesZp8LAg1nziwiFimylXIYeTNJuqi8T+M=;
        b=TtBHU7OE6GApnGuXRdUhkOr8I6T1o1RThCYUHA0bEPqICBUGje8BIXtW71QG/5QRFv
         umI83UsVXEIebevBd8f4nJihVfUtaEBrqFebbyoITn/6IkSzRmPeYFJD7eEESVtT1RTg
         VDRD4zNmxhCbSvCJOy8jpUaR/LG3JbHT1xQ3jInNqdqcQlgyxwv5krNrPBTqNjANZE0F
         2cONcQ6m1CbdNNM4mQ+ZUNIclghbAXlQ4pVDlajF96tDtz6nn8jsgBZQ6rn5fYpkkAEb
         TQHADpI3Svfxprf/HlbbnhaM3N53HNj1EEREn2Lh/QT4hisTEb5pM7hX2lgHI75zJsnD
         rsJQ==
X-Gm-Message-State: AOAM532dwDT+X+NKLnnVlC/QFKEJKihgZ5fSXlm+PU0vLqBsIAmyrQds
	hNFbC33ZV6/qiDo+rgTE58vabOEUuWDUZHQ35EQ=
X-Google-Smtp-Source: ABdhPJwPIOWN5ml+y4dEQNtGoaQRK9TA8NCk4gsd0p6xhji8vQAPtX+mfeEk3EJHFVP5Js6tndRBcFbs4NoOJCphT3s=
X-Received: by 2002:a17:907:1b29:: with SMTP id mp41mr2805424ejc.459.1627010973482;
 Thu, 22 Jul 2021 20:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
 <20210722124644.19962-5-nicolas.dechesne@linaro.org> <CADkTA4MfOnbxF5c9MyfD79r_pmN0Yw4KH6Gx5mjSR1nYkA9Wgg@mail.gmail.com>
 <7c8a96980bdc7d6d3d6a81e07b8ba8e1328afcff.camel@linuxfoundation.org>
In-Reply-To: <7c8a96980bdc7d6d3d6a81e07b8ba8e1328afcff.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 22 Jul 2021 23:29:22 -0400
Message-ID: <CADkTA4MA1BkRg85VfTLQLkE9rj+7C0Mjvw2CPw2rnGOqS-NhZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] yocto-check-layer: ensure that all layer dependencies are tested too
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 22, 2021 at 4:46 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2021-07-22 at 09:16 -0400, Bruce Ashfield wrote:
> >
> >
> > On Thu, Jul 22, 2021 at 8:47 AM Nicolas Dechesne <nicolas.dechesne@linaro.org> wrote:
> > > In order to be compliant with the YP compatible status, a layer also
> > > needs to ensure that all its dependencies are compatible
> > > too. Currently yocto-check-layer only checks the requested layer,
> > > without testing any dependencies.
> > >
> >
> >
> > Is that actually written into our compliance statements ? (that dependency
> > layers must also be compliant)
> >
> > I had never heard that before, and in my opinion, that will actively encourage
> > people to copy recipes if they want to be compliant but a dependent layer is
> > problematic.
>
> It has been the case as it logically doesn't make sense otherwise but the
> YP Compat pieces need better documentation. The TSC did work on fixing this
> up but we're blocked on a lack of advocacy people to help with the other
> side of the programme.
>
> Thinking the above though, the reasoning is that if we don't require that,
> it lets anyone just push their non-compliant bits into meta-non-compatible
> and then have meta-compatible depend on meta-non-compatible. It also meant
> nobody had much interest in having meta-oe or meta-virt being YP Compat.

Indeed. I can see that happening as well.

I'll cross the bridge if meta-virt goes incompatible due to a
dependency when it happens!

>
> The hope is that it causes "bad" layers to get fixed. We've put pieces in place
> to try and at least ensure the core layers pass and stay passing.
>
> >  With this change, all dependencies are also checked by default, so the
> > > summary printed at the end will give a clear picture whether all
> > > dependencies pass the script or not.
> > >
> > > Using --no-auto-dependency can be used to skip that.
> > >
> >
> >
> > I'd actually prefer the opposite, to make the compliance runs faster by
> > default, versus someone having to find out about this option later. We
> > already get complaints about check layer speed, and doing more by default
> > won't help on that front.
>
> I can see the arguments both ways on this. "The script says it is compatible
> so I can use the badge" :/

Agreed. It is obviously up to you on this. I just wanted to make sure.

Bruce

>
> Cheers,
>
> Richard
>
>
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
