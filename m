Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.4400.1619651918180138830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 16:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n5PGNwTS;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id v23so13415942qkj.13
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 16:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nAkESnyEltMUU7DyTKRfbhUmeKAc9ZzDtZ5KEBuzgi4=;
        b=n5PGNwTSURlTUsdcALQRKNVJs1knDnUQCKnjM12Ze7mlfpaarMZXWse2EOhuhWhmN3
         kxR2L3DTkaPnS3uam2mqLMgWaQT0Uk5W9SaZgBu53WMZG/UjO+Kw1VRCFOQZIdnmcQW7
         jzQqcBoHb0m23IX3YL0nD0GJ3PvFJNxH5f2Q5iBp7lUhBjmt15lbt2Naa8kdh0YjhQBS
         zTg1issKTq6iBg4ttS40W6GwauZRXfSEc7rX0jctP9c5ySeEft8lZsAes1xBuBUjsqHS
         dmIOzllQ/lHOP4FcCjPFxOwJOefTPOaVem1j42dyQcFv5bCGnS/hxPi7zYFoP/vgMNr6
         ra8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nAkESnyEltMUU7DyTKRfbhUmeKAc9ZzDtZ5KEBuzgi4=;
        b=FSM4u5wR5OTK90qJ8CE4pwCFdBeTUzQkXqFUi3iuKA+yorzsgujzI8PeWB+haCYQFx
         4CEMUMbQ/JTNuJCpz90bIEJBOYg01wGLNy7UpBA7h6yRYh1vMwUPluHIaIpH2WQnrDeL
         6P767fJBoqAJRrsyBoTh4PCCLa87umPsWoKxNzka6JT4wKeI5bOefMrErALT8crwtCj6
         8GKhKHXkZx4RKwTO6Glhvb7AOH6L5twk9egLqS206USYqU5/LqKXgKTmE3OwVkBV1Zvt
         7Gmb+zfOdQ/XJvlPDAnJQq5aGcIWmWCK9ynZucC1Dt4zF7hEd4WXig2dWk9Pyo6a9Ukc
         hSGQ==
X-Gm-Message-State: AOAM533gz4ZelXZCcE+KDaWlmdlsgvnp0Mp+UTR8UoZaA8zpRtpjqVYA
	Mik6Y6pXqZgBD5Oj7TU29IQ9Rc2jd6Dq42Xn940=
X-Google-Smtp-Source: ABdhPJwkgoL0ppTnnh18RCnSKLRX7n0HAtTtmBaZkzuoFX65QLw8T1nYL88v5UuzzAh8YNAIgPDsYWaxhJGftlYpuzg=
X-Received: by 2002:a37:624c:: with SMTP id w73mr31214425qkb.125.1619651917311;
 Wed, 28 Apr 2021 16:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210428050546.1708751-1-raj.khem@gmail.com> <CAJ86T=VMvrV=b9WX32UKJCcJRKYPpUAoZyaT++ms4ECt=BzTNg@mail.gmail.com>
In-Reply-To: <CAJ86T=VMvrV=b9WX32UKJCcJRKYPpUAoZyaT++ms4ECt=BzTNg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 28 Apr 2021 16:18:11 -0700
Message-ID: <CAMKF1sqmmozGZ2k9=rhYV61mnuFzRTO+7PVMwjus7kSdmy3puQ@mail.gmail.com>
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

Right, these options are only enabling the options which are already
enabled in defconfig.
we can move those options out into individual fragments and put the
long option config together
as well. or we can just merge them into defconfig
