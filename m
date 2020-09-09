Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web12.9410.1599693675131724252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 16:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=BNuQ/uAo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.50, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f50.google.com with SMTP id z13so5063180iom.8
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 16:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xVxPLBsVsEg1UU5dbM+pxWJRjBu5foSaCTqaW7DByH4=;
        b=BNuQ/uAoJXYd0YpCm7QwLoNTmg+RyHE/GNfWH3lACRiI9Jp1+6wJAU3eCPt3efjO88
         lfwb76jCs/q93soQB7aviIIZR8kVdkFVLUMoD51bfYCj0WjdInUr2SXmWTxjTT/z5aeS
         nIIQ4ek5tPebgBkNsZVdOmp1NI6RZ/vrpSD7T09MXFLaWAXjYYGGknK00yLs14wl2k5o
         Vt/OzUPAilKn9l8BRLilIHv/khcEQh+D44cfNRgwpHu6f8gyOqdL+iUSS3ioM5tBqlEE
         ceHf8R/A4BJpw2mPZXyEt+cqYl7FE2y0zkSpYFbR9iOAr00Pkq5f7FO9Y1n4Idbhw4pg
         tlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xVxPLBsVsEg1UU5dbM+pxWJRjBu5foSaCTqaW7DByH4=;
        b=E5jsyuVdamZiyHxNLkaMCI73yypFrBj7tFDaFy25xU9THa3M2V8Ta0jb54NpJe9EKC
         WMZjGrpsFeo0piSSCCUHYT0jlQ6zbwyEMj3W9/ylJC9+njhWfZJAaSiFw6wPhcjgGsOR
         wvtN1rFCX3hApNbclASFWdYCx2E2/EREzkEA3e+qHttH4gagCpogeOYKA0ovRMI0nVeb
         t3Z2RcNyREEbs6VCUCW6rngSdOr+U4EjVTG1bGbGYEkno6XzHdI3smzgmL80MQGGms9v
         cs3en7UdfnQBTo1GdUcyFw7iLzaocd+1mttgACLJZxc+AQE4iDMbDZVxOwuGBNjLFoJc
         /QNw==
X-Gm-Message-State: AOAM532vCw2h9lGqFsQWFTZY1kESYx2y0oTiSEwc72kWKdCRPYcD06Vz
	0DLXX4O1iUT0X26uzceiR8FTLuxv0QuOCnA9uAm+zA==
X-Google-Smtp-Source: ABdhPJztJCyvxFjOnWA87FgDpn8Z4QY5fOC3I2t9LMw9Njoa6LmW220pEIyYnLeXqV9VqXEFgSq7VlLI4NWihEDmyP0=
X-Received: by 2002:a6b:8f10:: with SMTP id r16mr5393861iod.165.1599693674281;
 Wed, 09 Sep 2020 16:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200909224535.27164-1-jon.mason@arm.com> <20200909224535.27164-3-jon.mason@arm.com>
 <46623150-db60-1948-c669-0abe72fdc122@kernel.crashing.org>
In-Reply-To: <46623150-db60-1948-c669-0abe72fdc122@kernel.crashing.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Wed, 9 Sep 2020 19:21:01 -0400
Message-ID: <CAPoiz9y_Afu5ieVg49HgX5rzhrsdDRN1BWDMgykhrOfxfVgRWQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][RFC 2/6] arch-armv8-2a.inc: Add Cortex-A55 tunings
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 9, 2020 at 6:59 PM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
> I like the direction of this work, but one comment.. (down below)
>
> On 9/9/20 5:45 PM, Jon Mason wrote:
> > Migrate the settings in tune-cortexa55.inc to arch-armv8-2a.inc.  This
> > will allow for a single file to include all of the tunings of a family
> > of processors.  This will reduce the proliferation of unique files per
> > processor currently occuring in conf/machine/include/
> >
> > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > ---
> >  .../machine/include/arm/arch-armv8-2a.inc     | 31 ++++++++++++++-----
> >  meta/conf/machine/include/tune-cortexa55.inc  | 12 -------
> >  2 files changed, 23 insertions(+), 20 deletions(-)
> >  delete mode 100644 meta/conf/machine/include/tune-cortexa55.inc
> >
> > diff --git a/meta/conf/machine/include/arm/arch-armv8-2a.inc b/meta/conf/machine/include/arm/arch-armv8-2a.inc
> > index b40ebf176e43..38564a17d98b 100644
> > --- a/meta/conf/machine/include/arm/arch-armv8-2a.inc
> > +++ b/meta/conf/machine/include/arm/arch-armv8-2a.inc
> > @@ -1,4 +1,19 @@
> > -DEFAULTTUNE ?= "armv8-2a"
> > +#
> > +# Tune Settings for Cortex-A55
> > +#
> > +TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor optimizations"
> > +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
> > +
> > +# Little Endian base configs
> > +AVAILTUNES                                         += "cortexa55"
> > +ARMPKGARCH_tune-cortexa55                           = "cortexa55"
> > +TUNE_FEATURES_tune-cortexa55                        = "aarch64 cortexa55 crypto"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa55                  = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
> > +
> > +#
> > +# Defaults for ARMv8-a
> > +#
> > +DEFAULTTUNE                                        ?= "armv8-2a"
> >
> >  TUNEVALID[armv8-2a] = "Enable instructions for ARMv8-a"
> >  TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', ' -march=armv8.2-a', '', d)}"
> > @@ -8,10 +23,10 @@ MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv8-2a', 'armv8-2a
> >  require conf/machine/include/arm/arch-armv8a.inc
> >
> >  # Little Endian base configs
> > -AVAILTUNES += "armv8-2a armv8-2a-crypto"
> > -ARMPKGARCH_tune-armv8-2a                    ?= "armv8-2a"
> > -ARMPKGARCH_tune-armv8-2a-crypto             ?= "armv8-2a"
> > -TUNE_FEATURES_tune-armv8-2a                  = "aarch64 armv8-2a"
> > -TUNE_FEATURES_tune-armv8-2a-crypto           = "${TUNE_FEATURES_tune-armv8-2a} crypto"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8-2a            = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
> > -PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto     = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
> > +AVAILTUNES                                         += "armv8-2a armv8-2a-crypto"
> > +ARMPKGARCH_tune-armv8-2a                           ?= "armv8-2a"
> > +ARMPKGARCH_tune-armv8-2a-crypto                    ?= "armv8-2a"
> > +TUNE_FEATURES_tune-armv8-2a                         = "aarch64 armv8-2a"
> > +TUNE_FEATURES_tune-armv8-2a-crypto                  = "${TUNE_FEATURES_tune-armv8-2a} crypto"
> > +PACKAGE_EXTRA_ARCHS_tune-armv8-2a                   = "${PACKAGE_EXTRA_ARCHS_tune-armv8a} armv8-2a"
> > +PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto            = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a} armv8-2a-crypto"
>
> It may make sense, instead of deleting it, to have just the 'require
> conf/machine/include/arm/arch-armv8-2a.inc' file for transition.  (If a
> transition period is NOT required or desired, then this isn't necessary!)
>
> Tricky part is how to notify someone they're in the midst of the transition
> period, and using the deprecated behavior.
>
> (In past work, I've had a class that looked for a variable to exist, if it did
> it printed the contents as warning messages to the console after parsing.  I'd
> love to see something like this as standard behavior for future cases like this.)

Fantastic idea.  I hate the idea of breaking backward compat.  Any
newly added tunes would not need this, so no extra files for my new
13.

Question 1.  How can we do this warning?  Is there something I can
steal from as a basis?
Question 2.  How long do we keep this compat around?

Thanks,
Jon

>
> > diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
> > deleted file mode 100644
> > index 099b6d72851a..000000000000
> > --- a/meta/conf/machine/include/tune-cortexa55.inc
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -DEFAULTTUNE ?= "cortexa55"
> > -
> > -TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor optimizations"
> > -TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
> > -
> > -require conf/machine/include/arm/arch-armv8-2a.inc
> > -
> > -# Little Endian base configs
> > -AVAILTUNES += "cortexa55"
> > -ARMPKGARCH_tune-cortexa55             = "cortexa55"
> > -TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crypto"
> > -PACKAGE_EXTRA_ARCHS_tune-cortexa55    = "${PACKAGE_EXTRA_ARCHS_tune-armv8-2a-crypto} cortexa55"
> >
> >
> > 
> >
