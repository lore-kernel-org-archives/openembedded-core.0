Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web12.14574.1608410211509891758
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 12:36:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SbdrBFKE;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id az16so2670869qvb.5
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 12:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nHbXiYKBOQu/yNgfQS5xD9dsXLf2i/Jlb3a9qOmgnDg=;
        b=SbdrBFKEjPfeQ2zhQWyUuiqEQt2OKdrVjjG746mgPWxc5rTsNAgxiAjTnnDFw3BInL
         ysgm3V+EajK6bwiP8FDBP+BmnQ/psdbgyTRage7fAaI09AHUQoPR6NXHarhJKSiTvLBF
         5kgR0kI41pmWSDH6T3GJG5WyrI7kCQjyPCgifAM7VdUoLhajMg9JyutyZD60ALjHbA7X
         i32nO15L2VkAr+BDJdzqNC8EZdfH1sTYzwzM9ztzFVgTVNFTGELIHtYuSNzQN5G07cAL
         JyTln+MzOe2FW/OFvykg/X3K3AJQt642T9Ub4CoZ2KeLB6iGDrNeKvT9zFemlN/YNDBZ
         6SYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nHbXiYKBOQu/yNgfQS5xD9dsXLf2i/Jlb3a9qOmgnDg=;
        b=LcRlDOgE9uk7fJiCULqvfNiKkAoWmDCz+hCuJZiO4Sms+MTZltCe7vCrVaHT8ip2XR
         p34teCFPI7A1by5ajOUZc1ppeXaH+Hr7dgkqo7eSv1X7NtZhFnR+5fOCrs1DbU0NqcrM
         FtlB0E/e/Q0c0/t40RvuNxArwmhdbvouApg/MSjtw2QekV0CmSJSImK3Gc7yzga7wXPK
         1Gy6kfCTz6DnwoktPdudVf3pYF6b3lwkaREeHPlNz4FneJ+xRuNq3VN1w6uWQIck5yq8
         n4VG+t+CR89Uo4f1HC7mrm4WVbL2nx9CRIisNwNQj49swapSsFLfC+/7KeaCC8mTvnye
         JO6Q==
X-Gm-Message-State: AOAM533A1QkHRLoWdQVflhPUn3T3Odp5eBV7PaXAxKIKKMgdP6L8hzgR
	cR3wZIQeMYW0dlF2KH43i6y4l0LV1ye4yc6WQeM=
X-Google-Smtp-Source: ABdhPJwhLUh7usMU+Ivtl66K0dktCgJlPH0Gj1hZXau9Om47/clix/8efoxzKbz7bADQxY6nbHlH+O7BLKAS5JgsImc=
X-Received: by 2002:ad4:4431:: with SMTP id e17mr10941333qvt.21.1608410210495;
 Sat, 19 Dec 2020 12:36:50 -0800 (PST)
MIME-Version: 1.0
References: <20201217192738.14311-1-tanuk@iki.fi> <CAMKF1soQmWKFmpaEkcE7E_as0iKDS01e8mwTiGLKYSSQ3_x5bQ@mail.gmail.com>
In-Reply-To: <CAMKF1soQmWKFmpaEkcE7E_as0iKDS01e8mwTiGLKYSSQ3_x5bQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 19 Dec 2020 12:36:24 -0800
Message-ID: <CAMKF1spAAi=rDLYNHQWk3XpsyCv9=qDxJgG0d7nwrpaxSYM6gQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] pulseaudio: Autotools to Meson
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 19, 2020 at 9:24 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Dec 17, 2020 at 11:28 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> >
> > The PulseAudio project plans to drop Autotools support in 15.0, so let's
> > switch to Meson. The first patch removes OE_LT_RPATH_ALLOW, which is
> > some old cruft that sounds like it has something to do Libtool, so it's
> > perhaps relevant for the goal of dropping Autotools. The next two
> > patches disable features that aren't available with Meson. The last
> > patch does the build system switch.
> >
> > Tanu Kaskinen (4):
> >   pulseaudio: Remove OE_LT_RPATH_ALLOW
> >   pulseaudio: disable EsounD support
> >   pulseaudio: disable GConf support
> >   pulseaudio: switch build system from Autotools to Meson
>
> I am seeing build failures with this patch series while using clang
> for compiler see.
>
> https://errors.yoctoproject.org/Errors/Details/539474/
>

It turns out that new meson checks are a bit different and if
-Qunused-arguments is used with clang then the test for neon passes
because its a simple compile time check in meson, So a workaround that
I have done is to remove using -Qunused-arguments on clang
cmdline and then it works ok.

>
>
> >
> >  .../pulseaudio/pulseaudio.inc                 | 69 ++++++++-----------
> >  ...-option-for-enabling-disabling-Valgr.patch | 67 ++++++++++++++++++
> >  .../pulseaudio/pulseaudio_14.0.bb             |  1 +
> >  3 files changed, 97 insertions(+), 40 deletions(-)
> >  create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Add-an-option-for-enabling-disabling-Valgr.patch
> >
> > --
> > 2.20.1
> >
> >
> > 
> >
