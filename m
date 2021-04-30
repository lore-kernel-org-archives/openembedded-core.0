Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.5303.1619743489410211953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 17:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YYsrE1/o;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id l22so71334737ljc.9
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 17:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ip3331KzoI7lfoE1kwCF3ppeWeb1j2uCBeSLrZes/Qg=;
        b=YYsrE1/oUfp9k9RrExgNfO1zRGUMI5hMcDpn3Cjuh6Umd7fU2imX8BemQXeFLPmPTo
         D3TuYYYGq/Gzua11ezmZLcb51h2vBIWxybcTwYroQIOxpv0InVinrNTI/8nZoEWEpywm
         iMVd2+/8ftPBo+efQ2Z01Rrnu4FSiaQk3tCQj9Wdd50MV/v4StvUJ47/lCLkGKP/gmKv
         Ap4E0OnQ6ryL3DkOiDWyk6pUhXsMjjrNGJS+KvSz6la1VrXyAtVazsVkkP1pdQrHM75R
         /t0OV29JDmeUbWM/4lELP6Bk5kpGQvvF2D93BcK94aIFA66Hsn+HtxJ7nWYw46I/O2le
         SPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ip3331KzoI7lfoE1kwCF3ppeWeb1j2uCBeSLrZes/Qg=;
        b=e1OlDZS9SareEe5ouWNEcnvMWf02RcJM960/+um3HCfMqINsxYZ4mEIuJ09rgdiSzd
         w6A8PY47Sn4XgZfZA1+aelOWMvq7q5c7Zck6mXttJVf+zUDAGJ6+GNcNQInr+iUjrWZy
         Jcwsv5BOU4O1alzZdBZTLretJ92KoJFDZw6VIxl7fWC+aDAXpVgmPZrdyJKZOG2EDVF8
         8YOU6PsFMcTjwy+nGD3v6LGscqrY2vPJOEIx8Fuk7FnQ5gWI3A+2NhHSjDb2niqQGPao
         eUx2zhHsy/++vJS7Y0G5PXy9j0Cr+hXC8lHBKmO4kCAFVTUo6cUuDMdUwPaMQLXjQnAd
         0bug==
X-Gm-Message-State: AOAM531PTXxTgnYGi9SD9CVG1aoocxt68M5aQL8d8bwnGuHzuVdaE4pa
	662Q49LMG3tMJWJ5fF/xBqgAuXem8vRudXHwQro=
X-Google-Smtp-Source: ABdhPJw0S5CMvtfuyAqCpId1Sp/ER3AIhMZge9ze00bZ2OIe57lPaVFTXfKiJflz8l4ZY9E+S8upy6G87rUb6rBbAgw=
X-Received: by 2002:a2e:97c6:: with SMTP id m6mr1729658ljj.403.1619743487393;
 Thu, 29 Apr 2021 17:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210428050546.1708751-1-raj.khem@gmail.com> <CAJ86T=VMvrV=b9WX32UKJCcJRKYPpUAoZyaT++ms4ECt=BzTNg@mail.gmail.com>
 <CAMKF1so_PdahL392rY79febr54=dB4v5f9KV5Eg6OmxoyH_XvQ@mail.gmail.com>
In-Reply-To: <CAMKF1so_PdahL392rY79febr54=dB4v5f9KV5Eg6OmxoyH_XvQ@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Thu, 29 Apr 2021 17:44:36 -0700
Message-ID: <CAJ86T=Ut25T9FGKmYHBM+U-yQ+z+GMFib5HexyYh6R5Ohyv2hQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] busybox: Enable long options for enabled applets
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 29, 2021 at 3:29 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Apr 28, 2021 at 10:40 AM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Tue, Apr 27, 2021 at 10:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > certain applets are enabled but the long options are not enabled for
> > > them, it results in subtle failures in ptests where its expecting these
> > > options e.g. gzip --best is commonly used in many package tests e.g.
> > >
> > > root@qemux86-64:/usr/lib# grep -r "\-\-best" *
> > > acl/ptest/Makefile:GZIP_ENV = --best
> > > attr/ptest/Makefile:GZIP_ENV = --best
> > > coreutils/ptest/Makefile:GZIP_ENV = --best
> > > ethtool/ptest/Makefile:GZIP_ENV = --best
> > > libxml2/ptest/Makefile:GZIP_ENV = --best
> > > lttng-tools/ptest/Makefile:GZIP_ENV = --best
> > > opkg/ptest/Makefile:GZIP_ENV = --best
> > > perl/ptest/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm:    COMPRESS     ('gzip --best')
> > > python3.9/test/test_gzip.py:        for compress_level in ('--fast', '--best'):
> > > ...
> > >
> > > this ensures that these options are enabled by default, which makes them more
> > > compatible than now with coreutils provided utilities
> > >
> > > busybox size grows by 4K which perhaps is acceptable
> > >
> > > --rwxr-xr-x root       root           817704 ./bin/busybox.nosuid
> > > +-rwxr-xr-x root       root           821800 ./bin/busybox.nosuid
> > >
> > > This makes autopoint-3/gettext pass
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-core/busybox/busybox/getopts.cfg | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/meta/recipes-core/busybox/busybox/getopts.cfg b/meta/recipes-core/busybox/busybox/getopts.cfg
> > > index 8db0a4a8f2..aeb5ac691f 100644
> > > --- a/meta/recipes-core/busybox/busybox/getopts.cfg
> > > +++ b/meta/recipes-core/busybox/busybox/getopts.cfg
> > > @@ -1,3 +1,10 @@
> > >  CONFIG_GETOPT=y
> > >  CONFIG_LONG_OPTS=y
> > >  CONFIG_FEATURE_GETOPT_LONG=y
> > > +CONFIG_FEATURE_GZIP_LONG_OPTIONS=y
> > > +CONFIG_FEATURE_TAR_LONG_OPTIONS=y
> > > +CONFIG_FEATURE_CHOWN_LONG_OPTIONS=y
> > > +CONFIG_FEATURE_CP_LONG_OPTIONS=y
> > > +CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
> > > +CONFIG_FEATURE_DIFF_LONG_OPTIONS=y
> > > +CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS=y
> >
> > What's the connection between enabling the getopt applet (a utility to
> > help with parsing options in shell scripts etc) and enabling support
> > for long options in a bunch of other unconnected apps?
> >
> > I think enabling support for long options in a particular app would be
> > better done where that app is enabled (e.g.
> > CONFIG_FEATURE_GZIP_LONG_OPTIONS should be enabled where CONFIG_GZIP
> > is enabled - in the defconfig file).
>
> I experimented a bit more and it seems that these options are tied to
> the corresponding feature being enabled
> so they can be enabled in a fragment, unless the feature itself is
> enabled it will be ignored and disabled. So for
> disabled features/applets these options are moot. So as such, I think
> enabling them is a good thing as it will
> widen the ecompatibility for busibox systems.

OK, so all that's left to do is to move them into their own config
fragment (since they have nothing to do with the existing getops
config fragment).
