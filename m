Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web09.1735.1615435524553297219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 20:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DeCCjRF3;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id r20so368831ljk.4
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Mar 2021 20:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HtIkkLVi9908hHUsEBsLPwGNsjNkwiWe3gLUQ7U7dqQ=;
        b=DeCCjRF3eQWcyMetNkqOqMR7dZYGdZwxdW7ELchmc+vK9yjKZDssfduC+Piw1a5slf
         SW0W4MK9j6FrjtJcMK3hJpBaMbpU8C0tuASesBOyTjJxhKF7uXJM1ONL/KBcM8ygi68M
         YOpgkcEgJDJybj4slFfZBUrL32zLrfllR9Rw4Q3kpldYSGpRGRPm15oNxpyfZX32MmLY
         Onmst78hcCyOAayfyOC7XL2YCGLYnc9TuTu21UTYkBLNbYz623TGfouCnwKJwgYdsQ15
         2Ki1qO6lUsHEEtVbrHUfFZQTsLG6veDF2U7MWXgs+CiA3JKhlnkMUrgL5Zr3+9tzDOw2
         oIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HtIkkLVi9908hHUsEBsLPwGNsjNkwiWe3gLUQ7U7dqQ=;
        b=XvM5mu7delpH402ch2/H/X6g6maX4RhG2Ult4xDBLmyUc3mvxsmcMwoxCkOkHk/n/B
         F1Grb4p63I9wed5wleVatdi7YktAyqPB2F5k+cxuIxRJWW6BKUFWWhUM14eqd/S3YPmF
         F9TzKyfDFrCyyhAUtmTkWxrME8poofmmG9bvSEXXTy9gwhB9D5wyg88PrgxQoRrjVzmD
         Tz8M2uCV4quIo7nR8g15P8F+C11bGxOWro4z6GSrW+NvpAQDjJMe1tOrVpO8fhsEmkyt
         OBNR7epN+XDeB9ritS5YYM0TyUAf3BeQ2g+4ootkV5bW1mDIgKaCXTG9OkFcVadtomRr
         EBBQ==
X-Gm-Message-State: AOAM530gnt3qcKV8wJ8sgj/2I+h++bAgQrzdci2Omx5GLMEYunywxMmq
	vtyyylJeEngkb7xUXzeYBBZA9HT0yvAhJkBnAIo=
X-Google-Smtp-Source: ABdhPJw7CD+snAXG7QvbyyKIj/uBr9U0IIHNps38b6t02Kl9KsQsIIgV/64FDsm1/CzrfzHyOpqdWiuCuKO4SzKwtB0=
X-Received: by 2002:a2e:7a11:: with SMTP id v17mr3742619ljc.403.1615435522333;
 Wed, 10 Mar 2021 20:05:22 -0800 (PST)
MIME-Version: 1.0
References: <20210310230433.29983-1-jdmason@kudzu.us> <CAJ86T=XDpdxFY_dLtpOf7b=gZ8N_jHe0Yp1Frhw+h4uqzWpRhw@mail.gmail.com>
 <CAPoiz9zB51u-E5Jf8ASoMkt-m2PcwTpwGku3cps8poHM4sVzKQ@mail.gmail.com>
In-Reply-To: <CAPoiz9zB51u-E5Jf8ASoMkt-m2PcwTpwGku3cps8poHM4sVzKQ@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 10 Mar 2021 20:05:11 -0800
Message-ID: <CAJ86T=XxPkoXTej6mtFM+WE29ecj7ZaNzx4WbryiybG8i41P4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] qemuarmv5: add softfp
To: Jon Mason <jdmason@kudzu.us>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, Jon Mason <jon.mason@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 10, 2021 at 7:09 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Wed, Mar 10, 2021 at 6:25 PM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Wed, Mar 10, 2021 at 3:04 PM Jon Mason <jdmason@kudzu.us> wrote:
> > >
> > > pulseaudio-14.2 is throwing the following error when compiling for
> > > machine qemuarmv5
> > > "NEON intrinsics not available with the soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
> > >
> > > Using softfp to resolve this issue.
> >
> > Wouldn't "sidestep" be a more accurate description then "resolve" ?
> >
> > Either way I'm not sure that changing qemuarmv5 just to workaround one
> > broken package is the right approach. Doesn't it mean OE will no
> > longer have any test coverage for ARM soft float?
>
> With these obvious issues, no one is even compiling these, let alone
> testing qemuarmv5.  And these issues have probably been around for
> months.  Even after getting all of these issues addressed, qemuarmv5
> is still failing testimage.  Honestly, it should be dropped since it's
> not really being used.  If you are only worried about compiling, there
> are other machines in other layers that can be used for this.

The issue with pulseaudio has been discussed on the list and bugs have
been raised upstream. It's due to pulseaudio's switch to meson (ie the
autotools build still correctly detects ARM soft float, although
switching back to the autotools build obviously isn't a good long term
solution).

If you want to drop soft float support in qemuarmv5 or drop the
machine config entirely then there may be valid arguments for doing
that, but a bug in the pulseaudio meson build doesn't seem to be one
of them (since it's completely independent of qemuarmv5).

> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > Change-Id: I513ed523f03ed091507a099e3f80fa95a6fc7ca9
> >
> > Not sure if there's an official policy for this, but personally I'd
> > say your own private gerrit IDs should be stripped before pushing
> > changes upstream.
>
> These can be dropped if they are problematic.  I haven't heard they
> are forbidden.

I haven't heard they are forbidden either, I was just giving my opinion.

> > > ---
> > >  meta/conf/machine/qemuarmv5.conf | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
> > > index dfe2a89573b2..29bcc1199ea1 100644
> > > --- a/meta/conf/machine/qemuarmv5.conf
> > > +++ b/meta/conf/machine/qemuarmv5.conf
> > > @@ -18,3 +18,4 @@ PREFERRED_VERSION_linux-yocto ??= "5.10%"
> > >  QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
> > >
> > >  KMACHINE_qemuarmv5 = "qemuarm"
> > > +TUNE_CCARGS_MFLOAT = "softfp"
> > > --
> > > 2.20.1
> > >
> > >
> > > 
> > >
