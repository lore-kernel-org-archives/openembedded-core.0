Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.503.1589485503404725312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 12:45:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rBRnY3da;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id yc10so3809794ejb.12
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 12:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CN6l0n/NYgadTxq7dFl2FAGncgmODKs++2UpgJVBmWA=;
        b=rBRnY3davcaa5HnH0xSO9vubNOgUdoaVv2sLd+GyR7BSieJ7pSiVgSwUbmISF6PwwB
         ktpYnyEYMOnhxKRIWp1/vy1T0PpJ50k/lq58y+8rwEfJNZJptanIzVZlHq0vz1GEcOyN
         XCOMYAs83exb3uP40FXCGppkcOh6nrpogtm+dsr5yD/QIzMQZ9C53RtyteCP+5otA+ZK
         lOh6U8TjRdYEYGKPByP0Rm65dv6UC5+Lheo0OR1AhdCXh5s6eUghuR8YxAFRGBLYbfop
         rvB3O53m78udhQ8FCTwLAGPS0HKKl6iEq34/w6gPD9gV25VVwgFW3lH1stOxhr8ZfZ44
         /5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CN6l0n/NYgadTxq7dFl2FAGncgmODKs++2UpgJVBmWA=;
        b=KS9phLH3TbwawAs0gbCexZk+cla08U0Cthvp5rWq23mqd7yrPDTP9TN4nyO4brU7Ti
         knNkD9oCisXPKu25J+f8Nm4ZR+A3FLlma0+aSLItn2A2VTGwlEt97KTrXpNyBi9dLyM4
         UyXXOsSXFOqxd6/wW7x5viAFHEtThJqxfSoo6HDMJHMLCZpaOwB3mueEyTm/dIgz59G9
         4I5rlOpovzkYY5FWbHTDe09gmJDYBlGEd7gYDAEXgSw1Ohqv6CDoUnSvmSpxIDfyke03
         5ckT5GKIoGzQrVAFtA/WgZhF0o1cUapPa3m/F1tBJu7wsp5wX9y+r2mkSi5UzkS/rzd9
         /+Cg==
X-Gm-Message-State: AOAM533rkM8jy3p8d9gQARebjQUlnfXqiEhvoftZ9BY2CTJg075JqNLU
	Puny1JQ2XGGboRi3DdTM9Yb5YHzZCdOJdRHmbGo=
X-Google-Smtp-Source: ABdhPJxsVcMbkAWJUJqiGkuyB3cl/B314r8rAwVg3Y9mdXjEAXs7Ikzq9AsPfS0ZqcDF8mpkZGy003lfmLL5Meen1+4=
X-Received: by 2002:a17:906:ca14:: with SMTP id jt20mr5124750ejb.233.1589485501807;
 Thu, 14 May 2020 12:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589378829.git.bruce.ashfield@gmail.com>
 <4586b07ae3f2c70500b6627645de2f71760b45e4.camel@linuxfoundation.org> <160EEB0DDF36CFC2.25549@lists.openembedded.org>
In-Reply-To: <160EEB0DDF36CFC2.25549@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 14 May 2020 15:44:48 -0400
Message-ID: <CADkTA4N9OVMWenYf1p5Tq6xvoa12JOaNNKfccT4of-t33NH6WA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] kernel/kernel-yocto: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"

On Thu, May 14, 2020 at 10:22 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Thu, May 14, 2020 at 10:09 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2020-05-13 at 10:24 -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Hi all,
> > >
> > > This is a resend of the v5.4 stable bump to v5.4.38, plus a new
> > > -stable
> > > bump to v5.4.40.
> > >
> > > The extra changes to make these pass the AB tests are the kernel
> > > reproducibility commits.
> > >
> > > The issue we had on the last submission was that IKHEADERS was
> > > switched
> > > to a module, and hence was failing reproducibility tests as we didn't
> > > have the timestamp variables exported for the module build. It has
> > > always been a problem, just one we hadn't hit.
> > >
> > > I've left the fix as two commits on purpose, since the copy of the
> > > reproducibility export fixes the problem, and is definitely safe for
> > > dunfell,
> > > and the second commit is my effort to remove the duplication of logic
> > > and
> > > create a common python routine they can call. I've used the
> > > techniques for
> > > subprocess running that I've done in other kernel build elements, but
> > > if they
> > > aren't the right ones to use, point me in the right direction.
> > >
> > > All said, these are green on the AB and should be ok for master and
> > > dunfell.
> >
> > I think this triggers something here:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1914
> >
>
> In that case, just drop my effort at factoring out the source date
> epoch into a python function.
>
> It looks like the git check went nuts, and since we don't need it, and
> I won't have time to work on it again for a while, if you toss it in
> the bin, all should be well.

I did tweak the python code to handle the git return code more
gracefully. I did test all the conditional paths before, and they
worked, so I'm not sure how to trigger the failure here.

I can try an AB run against the fixed up routine, but what target
should I be running ? Obviously quick doesn't hit it, or I would have
seen it.

Bruce

>
> Bruce
>
>
> > which is nodistro rather than poky.
> >
> > Cheers,
> >
> > Richard
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
