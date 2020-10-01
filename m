Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web12.1045.1601564754677624772
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 08:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jPfN8Ybb;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id lo4so8564650ejb.8
        for <Openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AJLKwINWehBmvj87E7m8WSwDZEjp9b7eORmuJ2czhbU=;
        b=jPfN8YbbGJSkBU9nWM3vvY/Y6G3iCQY9fmBjK8Zzw3f3BEvdCLSpsnysOZi3fW9Q5/
         DGHfm8HrcciF6NZYTgeHJuGJj3tXFP4gu5HZtuN1+U7GfG8y5dKouK9lYRCOGEJdtKZ1
         LJG0n9dOckucNCw5QT0EsS2jsjRg1yLiZL5k7ay0qGxD3omt+mPbumgGZdQl8YYb11cb
         qCvcRr07m+aahOC8guYmwmjsQLugXU74mkK8oQSP4CQlcf0aJJDFzDHUxp+6euTr14WA
         0kGk+GGwXrh98vF/PK2BSXr0PNR+4lbi4MTfN1zI7EHRCscTmq7fgkHDK8OITghQaZHb
         dLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AJLKwINWehBmvj87E7m8WSwDZEjp9b7eORmuJ2czhbU=;
        b=RANsjZnB8T0XeuWlurNBWKxQzdd7OdTqfFP2T+pgmJGMVung9xra3NKDJ5eWUZ6J/5
         l+UqSgMydYSqqAErIkvMes61SDnhGvzuaEQ2Cs0zTBaq8oGZIgD0nr1Dmf4zi9Z4salr
         Qmjq+rilM3KdLW9K287BjAAOvM28JUTl0YPj0ZbhunE3B7N02go+YjBE4Gf6G5L2lQZW
         ttqWUPJoXxDwwd1W6KlDYTorvfzCIEeoiGDi3n8rZUjpA5HWPkiy933dHFNnKMroEFwS
         cwwiv5P8TU4SGNISQc1Yb58fiz7xsMnCFIM42Oi18RkToKCW0VGuvw2XqG3F8GGpjvrx
         d80Q==
X-Gm-Message-State: AOAM532XbXOsamGAjD/tLi7MK61EOfrzdNleMhBQuJ83BGVN1MLvF0gr
	rMy4hBmt/A2+3XeWDRNdJmAOCeKXBnr4f7GauhI=
X-Google-Smtp-Source: ABdhPJz9aUcFamMJTFgk6y1lD/5vGA4VySH3sCNRcU6d0UZvM89n/5Buqy8NxlVRNKK1wygQHTubs7sOZFWycg7BpJ8=
X-Received: by 2002:a17:906:7e53:: with SMTP id z19mr1312493ejr.334.1601564753027;
 Thu, 01 Oct 2020 08:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201001135927.721794-1-uvv.mail@gmail.com> <CADkTA4OZNhbMaykKi_pU_Af49D-wAjeqQ=3L-y241Lcj7TUd2A@mail.gmail.com>
 <c71e99aa-5669-a75c-1e72-81c176ee71fa@gmail.com> <1639E5FC19B7A570.14692@lists.openembedded.org>
In-Reply-To: <1639E5FC19B7A570.14692@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 1 Oct 2020 11:05:41 -0400
Message-ID: <CADkTA4PL-Bs+NG9rYOgZ6_oETHG4q3+33x6TEoCmdxVp-AeVHw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] module.bbclass: add HOSTCC for out-of-tree modules
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, 
	Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 1, 2020 at 10:53 AM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Thu, Oct 1, 2020 at 10:47 AM Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
> >
> > On 01.10.2020 16:36, Bruce Ashfield wrote:
> > > We already ran into this with the main kernel flags, and we don't want
> > > to duplicate them here.
> > >
> > > Why aren't what we have in kernel.bbclass working in your scenario ?
> > >
> > > Bruce
> > >
> > Because kernel.bbclass is not pulled in into the environment of
> > out-of-tree module recipe. Should it be?
> > This can easily be checked when you do 'bitbake hello-mod -c devshell'
> > and examine $EXTRA_OEMAKE variable.
>
> Yes, it should be.
>
> We build out of tree modules in each autobuilder test run, so it is
> functional for the most part. I'd be interested to see the reproducing
> kernel module and build steps, so they can be built into the tests to
> catch this.

And by that, I mean more than the warnings about ORC, etc. Since those
have been popping up for some time.

I'm not saying we shouldn't be fixing those, I'm just wondering if
this is an actual build failure, versus the ones we know about.

(and either way, it doesn't change the way we fix it, just that we can
test it better).

Bruce

>
> But we absolutely do not want to duplicate those flags into this class.
>
> So with a reproducer, we can perhaps shuffle things around and make
> sure that both this new case and the old ones continue to work.
>
> Bruce
>
> >
> > Vyacheslav
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
