Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146CEC433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 13:52:31 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.16670.1658670745026186064
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 06:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qp28/BBl;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id u12so6570992qtk.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 06:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KLtUvj2tzYHYUPWCehvAes7QXfVEpOXPjLFpz+j6Fqs=;
        b=qp28/BBldklQrvxmFnBd8gZOqIfCHtn/kqCYzPWvZSyRNDSbgZzysFuNUBimnGctZw
         rOVLtEHgRgG/nK7PXx6Q1ErJWcVJ1g8tGhVOaNJu8g9N8RGqttGv7SyS9KBfy/DrwiQY
         aNvXj11O/HYzjdX5we8NT5zP2Z9APn148vDTpoir+eA9tzEgwNJjN2v8hQAgKaXSH67s
         aNrXocPHMs2fzbbUhQgAzI4Duj9fQcaT+HvbtHoKQNacROk8onCMwWkpvTcd/7tIHdr9
         zYHmYSEfyIdVlGpdhej8atKXnqPG9pvL3XXnYGRW9ugGoog3uOA9u7RebRYtb7Wzycuo
         JEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KLtUvj2tzYHYUPWCehvAes7QXfVEpOXPjLFpz+j6Fqs=;
        b=F1b5gfiGlyiJ3LCcriJH62QSFEm0F1q471RWvrsYudHCdM3HNqO43gzsr7IYLJmsyX
         VC0w3+GhETie0iITtawbhj83fxzUqJIwA0cDroGdrYwiPz0e2lIf+fYt5yN9yN7n+GR7
         19nD9oosB+C8hjuwDA/jxTMqKZpH329wQJKZa8IrGs+84QMLhIpu7VB3XtxhGc6V6qJ5
         KIl2fF20p/GjbBb8oSNDDjqndPYdnxbW4CDZBuf+TfcQg+z2B4QtjHzHb2da8Ha2Zap4
         bJ1nbwcLPNLXcjSfHGDv6x2xUyJzAAdWlgtpuNwIqdx+HkqKFZcz3qfBy4RgVV0MqvxD
         c7Dw==
X-Gm-Message-State: AJIora+YgiKQPx+ZPKMitFph3tPsi6cU/rAG7rrnmwDHBZHL7ifVnvk3
	jamIOwdYqwMkBC/JuwQPiFxwDOBPgDFiruQzi4fdbPVwrgW44w==
X-Google-Smtp-Source: 
 AGRyM1sE5XtKfbkAYZpO47NgQ7iWlsjWMK1XCMH4ZXJ4pxY4armSGk07Qn74/kl85jbSa1oSxnEWycFpgMKHWydhkBA=
X-Received: by 2002:ac8:5a12:0:b0:31e:f233:50f1 with SMTP id
 n18-20020ac85a12000000b0031ef23350f1mr7081167qta.229.1658670743697; Sun, 24
 Jul 2022 06:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220723145416.1374755-1-raj.khem@gmail.com>
 <f4ea3fac3a7e405ea15f39e33744f39a@axis.com>
In-Reply-To: <f4ea3fac3a7e405ea15f39e33744f39a@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Jul 2022 09:51:57 -0400
Message-ID: 
 <CAMKF1sp8a99JeMh8E0AcbvnAKepd3QmuxX=XD357Zg4eghrFtw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] libgcc: Fix standalone target builds with
 usrmerge distro feature
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 13:52:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168456

Hi Peter

Thanks for the review.

On Sun, Jul 24, 2022 at 7:47 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 23 juli 2022 16:54
> > To: openembedded-core@lists.openembedded.org
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Subject: [OE-core] [PATCH 1/3] libgcc: Fix standalone target builds with usrmerge distro feature
> >
> > Ignore the rmdir cmd if using usrmerge distro feature since the
> > intention is to delete /lib or /lib64 but not libdir under /usr and
> > base_libdir = libdir when usrmerge is enabled in distro
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/gcc/libgcc-common.inc | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/libgcc-common.inc b/meta/recipes-devtools/gcc/libgcc-common.inc
> > index 148c9f85a7c..9d4fd41f975 100644
> > --- a/meta/recipes-devtools/gcc/libgcc-common.inc
> > +++ b/meta/recipes-devtools/gcc/libgcc-common.inc
> > @@ -44,10 +44,14 @@ do_install () {
> >  }
> >
> >  do_install:append:libc-baremetal () {
> > -     rmdir ${D}${base_libdir}
> > +     if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}; then
>
> Since the goal is to avoid deleting ${libdir} in case it happens to match
> ${base_libdir}, I recommend to change the tests to instead be:
>
>         if [ "${base_libdir}" != "${libdir}" ]; then
>

I don't see much benefit of doing this since our usecase is guarded by
distro feature and I found it more readable
having said that I am fine to change it as well, other option would be
to use rmdir --ignore-fail-on-non-empty and avoid
the check but that will make it generic and we might not see some
unwanted files sneaking into base_libdir so erroring out
is a good check.

> > +             rmdir ${D}${base_libdir}
> > +     fi
> >  }
> >  do_install:append:libc-newlib () {
> > -     rmdir ${D}${base_libdir}
> > +     if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','true',d)}; then
> > +             rmdir ${D}${base_libdir}
> > +     fi
> >  }
> >
> >  # No rpm package is actually created but -dev depends on it, avoid dnf error
> > --
> > 2.37.1
>
> //Peter

