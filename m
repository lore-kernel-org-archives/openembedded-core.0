Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.3902.1619735392795462821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 15:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hRZ0CR0F;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id j19so10087913qtx.13
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 15:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o436cToWv2k+7qK8Sg37WqwnP24Y8nLKRUBG3U2jTqU=;
        b=hRZ0CR0FnRXUHDcwB/WK56vCyhAIZf9WjsLMrI+IC9/qxw9E/YqIYQcoSU0zQnfxIX
         5j+drfiLY/IAZEemKh+s9P39+0uy3UlHNW4a1LPqYwYH2b86fqKFYe8WtkofzNgPao4N
         lf9zz24YwRmip/1HnByXSVHGTVeYayEpNcQSiCBRuO9qShG4fhAdfL8v78bCi82WPkwN
         fDEG6TmEgKigKUdUdk9jvg/PWQ5BGwbMU2LqCEPh0piydQWF9k/ldu9l4JAhOaYzlvCs
         79BR5KAFLJBtfw8l82b2ATa67jm2lEc533+eYbN7J8P8LS7nJ7OtFq7Ko0ezYHCCiHh5
         ziqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o436cToWv2k+7qK8Sg37WqwnP24Y8nLKRUBG3U2jTqU=;
        b=OjjoQt3aCYZ3HIynasXuwlwGnG6g3OXkZhwg23UURmQrl4R2CAMgdvjgQeV5ekU1AS
         vW3xXia2nwyCL1yHBACNkj3q+8Pz44ENtwo8Rdhr+ISU85awrDOSYVk3Ro4gaMUdmRUJ
         zC82mOp65JPOlJebZWcg8dYkQOVZEdiBdHJr7LW5OYOUoM5gDhMuSQly201fd6DdcI8e
         8b873LvKZ8QVdHhjclr60ej+kxacrw+8d5NiK1wQ0A6Xypg/XFIPTIftgcobsPbcEtNV
         ErRB8SHyazhVREjjXll2pxJ5ChcusU+XzrCG02qwoBOkkaX0vjIZreiPvhecrhDpfB1o
         tXUg==
X-Gm-Message-State: AOAM531tOM7lcWumHdLweWwZhdX15+1xmD6YFYwVO5PwRFci2cg6CsC8
	sZrPsCKahlBC5EK7Nl/5jqZnp0XyUrwJN6PpDTY=
X-Google-Smtp-Source: ABdhPJwD6tyHFmFBGV2Teo8+LtRui84BtyMZUGa0Y1404MKzhWSwqnuC1DziDnMoqYS/BVtNEGWTZWYlGUdn0NOvaWY=
X-Received: by 2002:a05:622a:2c9:: with SMTP id a9mr1741357qtx.82.1619735391839;
 Thu, 29 Apr 2021 15:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210428050546.1708751-1-raj.khem@gmail.com> <CAJ86T=VMvrV=b9WX32UKJCcJRKYPpUAoZyaT++ms4ECt=BzTNg@mail.gmail.com>
In-Reply-To: <CAJ86T=VMvrV=b9WX32UKJCcJRKYPpUAoZyaT++ms4ECt=BzTNg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 29 Apr 2021 15:29:26 -0700
Message-ID: <CAMKF1so_PdahL392rY79febr54=dB4v5f9KV5Eg6OmxoyH_XvQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] busybox: Enable long options for enabled applets
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 28, 2021 at 10:40 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Apr 27, 2021 at 10:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > certain applets are enabled but the long options are not enabled for
> > them, it results in subtle failures in ptests where its expecting these
> > options e.g. gzip --best is commonly used in many package tests e.g.
> >
> > root@qemux86-64:/usr/lib# grep -r "\-\-best" *
> > acl/ptest/Makefile:GZIP_ENV = --best
> > attr/ptest/Makefile:GZIP_ENV = --best
> > coreutils/ptest/Makefile:GZIP_ENV = --best
> > ethtool/ptest/Makefile:GZIP_ENV = --best
> > libxml2/ptest/Makefile:GZIP_ENV = --best
> > lttng-tools/ptest/Makefile:GZIP_ENV = --best
> > opkg/ptest/Makefile:GZIP_ENV = --best
> > perl/ptest/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm:    COMPRESS     ('gzip --best')
> > python3.9/test/test_gzip.py:        for compress_level in ('--fast', '--best'):
> > ...
> >
> > this ensures that these options are enabled by default, which makes them more
> > compatible than now with coreutils provided utilities
> >
> > busybox size grows by 4K which perhaps is acceptable
> >
> > --rwxr-xr-x root       root           817704 ./bin/busybox.nosuid
> > +-rwxr-xr-x root       root           821800 ./bin/busybox.nosuid
> >
> > This makes autopoint-3/gettext pass
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/busybox/busybox/getopts.cfg | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/meta/recipes-core/busybox/busybox/getopts.cfg b/meta/recipes-core/busybox/busybox/getopts.cfg
> > index 8db0a4a8f2..aeb5ac691f 100644
> > --- a/meta/recipes-core/busybox/busybox/getopts.cfg
> > +++ b/meta/recipes-core/busybox/busybox/getopts.cfg
> > @@ -1,3 +1,10 @@
> >  CONFIG_GETOPT=y
> >  CONFIG_LONG_OPTS=y
> >  CONFIG_FEATURE_GETOPT_LONG=y
> > +CONFIG_FEATURE_GZIP_LONG_OPTIONS=y
> > +CONFIG_FEATURE_TAR_LONG_OPTIONS=y
> > +CONFIG_FEATURE_CHOWN_LONG_OPTIONS=y
> > +CONFIG_FEATURE_CP_LONG_OPTIONS=y
> > +CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
> > +CONFIG_FEATURE_DIFF_LONG_OPTIONS=y
> > +CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS=y
>
> What's the connection between enabling the getopt applet (a utility to
> help with parsing options in shell scripts etc) and enabling support
> for long options in a bunch of other unconnected apps?
>
> I think enabling support for long options in a particular app would be
> better done where that app is enabled (e.g.
> CONFIG_FEATURE_GZIP_LONG_OPTIONS should be enabled where CONFIG_GZIP
> is enabled - in the defconfig file).

I experimented a bit more and it seems that these options are tied to
the corresponding feature being enabled
so they can be enabled in a fragment, unless the feature itself is
enabled it will be ignored and disabled. So for
disabled features/applets these options are moot. So as such, I think
enabling them is a good thing as it will
widen the ecompatibility for busibox systems.
