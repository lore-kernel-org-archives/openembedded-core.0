Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.79.1624402777109659515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 15:59:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mybv92Dm;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id m14so892769edp.9
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 15:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UNOGtHASxwCn/ybicl3CwnmD5zZ0cJh45oMwI4zeOi8=;
        b=mybv92Dmxbua58/YCjd+1wQlyw6oCrJGMHM7v8ph8o359pij2lKooaeNp07pQPVn/Q
         8rVbXR774xV0M6cAI+UJKzV6HgD7wDE6wphqZjw5YYhb3Ks+sL0xc/2NkibFf2A6QxAn
         6loal2MhSXgmxd5eG5wGRTMep0ja5Rnibq4mm6bPzpfbHzgFY3rCASLAz6hFWrHY+iH6
         KR6JwYzV0ytkZdZyjs+F3CdTzey02n8mLGdr6WlcU6Q1Qw5jp7W0usheO7Aot6N+AuxM
         psEH8HV+cHo9ztZ13s2nVcMIpPXseo/z1mB7VCbzzdtQvuXKq3VwSXQT7glDfFY5O52s
         tq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UNOGtHASxwCn/ybicl3CwnmD5zZ0cJh45oMwI4zeOi8=;
        b=BbugjvrlJFETi8i7AjX30KCJiTd7H28J3JCGh2yB5HwkarBvhyWPMosQeY6EBKyPrn
         dhFjWTs+Q3UVRdsXSTZXSsOgVkUxeFAH47AUa5wCgPt8hLRjMUlOnRz0sCPYZMl3sw67
         H7//BHsb5FSsxdHeAbDkAtqroOuVTWUrng4ZWEc5qZslY26FuSOYAkKRfAZQgW5zaSb0
         Mhx2xR6f7sIWEcm4ciVmfpy9cNh9TXPcGbO4aK0xUhOfaX4fNap0EncoZ82/l3Hx0Wef
         ZcYwIpqVRq0r7BgTHDGpnbNTaIxfePZQMyW/jWBmU4N101bBnwH9CZqJhFIg94/LDTfb
         zOYw==
X-Gm-Message-State: AOAM532n7CC5D95NuRhEKxkNjsdi0XnsSelVYf9MMIgFC8jpTWMbZp02
	Ol/sSzENvmgCCZKeG2kyFeR4Wb2U34fhsrlSOOLo2sfaxiv5+O2G
X-Google-Smtp-Source: ABdhPJy1jKsRCqZYcfy24C7d3kme46pwcKdBWmiFNM+B+mRNLwlIWgKHBbugwnO1m+FQI2o+PVEuRzWCRHWNA7mY2qs=
X-Received: by 2002:aa7:c790:: with SMTP id n16mr7713440eds.370.1624402775703;
 Tue, 22 Jun 2021 15:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210622221818.4613-1-andrea.adami@gmail.com> <e55f8738df38061214d7cd823eaab9646bc36f5b.camel@linuxfoundation.org>
In-Reply-To: <e55f8738df38061214d7cd823eaab9646bc36f5b.camel@linuxfoundation.org>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Wed, 23 Jun 2021 00:59:24 +0200
Message-ID: <CAAQYJAv+k0r0za-=2L9Dk4xVbyrpR4aaQB=NDcpm3MhLsy=ORQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] kernel.bbclass: run read_package_metadata only if packaging is enabled
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 23, 2021 at 12:52 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2021-06-23 at 00:18 +0200, Andrea Adami wrote:
> > As exposed in the ML
> > https://lists.openembedded.org/g/openembedded-core/message/153000
> >
> > up to commit 86142da in Gatesgarth it was possible to build a second mini-kernel w/out
> > modules to be just deployed and collected by other recipes.
> >
> > These kernels use special care to avoid packaging:
> >
> > inherit nopackages
> >
> > PACKAGES = ""
> > PROVIDES = ""
> >
> > Now the change in kernel.bblass calls a packaging routine:
> > do_deploy[prefuncs] += "read_subpackage_metadata"
> >
> > As a result the kernel build fails.
> >
> > Fix this using bb.data.inherits_class() to verify the
> > possible previous inherit of nopackages.bbclass.
> >
> > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > ---
> >  meta/classes/kernel.bbclass | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 379bed44f2..06e6446a08 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -771,8 +771,8 @@ kernel_do_deploy() {
> >  }
> >
> >
> >  # We deploy to filenames that include PKGV and PKGR, read the saved data to
> > -# ensure we get the right values for both
> > -do_deploy[prefuncs] += "read_subpackage_metadata"
> > +# ensure we get the right values for both. Do this only if packaging is enabled.
> > +do_deploy[prefuncs] += "${@ '' if bb.data.inherits_class('nopackages', d) else 'read_subpackage_metadata' }"
> >
> >
> >  addtask deploy after do_populate_sysroot do_packagedata
> >
>
> I'm not convinced this is the right fix. Which values is that function
> finding and reading which cause problems? It sounds like there is a deeper
> issue here that should be fixed instead...
>
> Is there a simple reproducer for this on master?
>

Well, yes.
It is linux-kexecboot from meta-handheld.
Pls see comments in message 153000.

The razor is
https://git.openembedded.org/openembedded-core/tree/meta/classes/packagedata.bbclass#n22

Cheers
A.A.
