Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.2138.1617243848148265940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 19:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eQlKyeB8;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id 7so857581qka.7
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 19:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9lJV3kTlxrwNVMlpsbFmxbZNDmqIP9ItfkCMvj0Ql1A=;
        b=eQlKyeB8f3mjK1lumuX8d2+9OWeDkUy6fu8nWkVNne+EyuqpDkQc9rIeKMNgQWDEwO
         hY5D2UNhjpSRrphTTJhhZs+UJLbZE6A44w1AALnPX2eMfBiD7gwgV8Y50gUdi9oOe9PP
         X4kW4K3UjUI1nEWVOt6m4b69AUN/rb7XsQeas6RTtBDwXd2+xNIffc6w1oh7KYl198YB
         lbHFK/Kg/PYdVY2zwDyYVJ9NP359j3jvC3B/EeuyoBMEwqOFv9+bpCC6xGo7nbTfxKOQ
         Y517qfrgih6QDU3fR0EFGevAiMX4N7AnN5lkNWl93joBc+ezIORXpDjsL4tYFe4x3tw7
         2W4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9lJV3kTlxrwNVMlpsbFmxbZNDmqIP9ItfkCMvj0Ql1A=;
        b=P475WfP4I7K6MHrkQAVTQL+6Yh0PCMhjs7DoY5E6/B2r54gCRf30DsFEHyXkv4eSbJ
         vwhm9Iob/AH/QNUvOMPKDOiJxLLdbvsY4M/oZdc3ma+3Xeeuoa4O6M1E9C07P9dmXWQD
         nvEjbJ9ocrkYmxaaVAb5beg1urWBqyrxrOpWOmyNJPNgn19XSkBorf2R+IezrCFdtS4O
         /cTpQOA0PcfXeMYJj5Z4yh/8UcZsJ8hppHMRnce+01T0ADxGf8PlGsWtuxxArivNw6RK
         r4Mb7UHBudWVMVYe5LCeaJOnzsmirqzKGRo8ruESSs16fHtlM1R1iR+wsZloMSNknn76
         De/w==
X-Gm-Message-State: AOAM531xz22wVMM6ZbsyDYA6UHQ0DNAW5yBtT3R8ibZQkExc2+wynj9M
	hWkApZX2MdBxUy6X1kKEIDM7PgdhW4oWiAfxLhI=
X-Google-Smtp-Source: ABdhPJxcI8S9rK4QN3rsnWay/4oSH2FJWYrpI/oK8Dfo21vdz8ShIV+2FqBubX/eutVVla+ax9xCPv6KjyE1BMWNXNE=
X-Received: by 2002:a37:a350:: with SMTP id m77mr6086061qke.146.1617243847258;
 Wed, 31 Mar 2021 19:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210331225051.3823769-1-raj.khem@gmail.com> <20210401014556.GQ23013@denix.org>
In-Reply-To: <20210401014556.GQ23013@denix.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 31 Mar 2021 19:23:40 -0700
Message-ID: <CAMKF1soPOYvLByjWLqkfWXrBiOojTwp=JP_+zOdkmFFhc=uvHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa-gl: Use swrast gallium driver
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Martin Jansa <Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 31, 2021 at 6:45 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> Khem,
>
> Doesn't seem to help for i.MX platforms (I'm aware of[1][2]).
> Which machines have you tried with this fix?

rpi4, you need to fix mesa bbappend for meda in fsl layer perhaps.

>
> [1] https://github.com/Freescale/meta-freescale/issues/699
> [2] https://github.com/Freescale/meta-freescale/pull/702
>
>
> On Wed, Mar 31, 2021 at 03:50:51PM -0700, Khem Raj wrote:
> > Fixes
> > ../mesa-21.0.0/meson.build:21:0: ERROR: Options "swrast" are not in allowed choices: "auto, i915, i965, r100, r200, nouveau"
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> > index e50782be1c..fc8b4f7504 100644
> > --- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> > +++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> > @@ -12,4 +12,4 @@ PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x1
> >  PACKAGECONFIG_class-target = "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
> >
> >  # When NOT using X11, we need to make sure we have swrast available.
> > -DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', ',swrast', d)}"
> > +GALLIUMDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', ',swrast', d)}"
> > --
> > 2.31.1
> >
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
