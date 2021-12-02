Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D00C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 20:31:37 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.2552.1638477092949369037
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 12:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=7BthzRWT;
 spf=pass (domain: burtonini.com, ip: 209.85.221.51,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f51.google.com with SMTP id d24so1379668wra.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 12:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VZDNRcA1AyYPdN+6hCvEyrtHcfZ3Cg8h3bzUVKNWFjk=;
        b=7BthzRWT9OdIdhtIUJtesir6rxppSRGO0CYaB2KfKku9PTXARNA35+lqjX2D/QOtlF
         QLmugo35XnowTPTT4OJCgeRiGjKL1huDsLt/TUINJDV1vNJzQ3ouoUGwkeALCVg6DLiL
         YEhK74Zik08jg8Fe7e2dU2CrxRaw+HMnCLP448FpC1LmdJp7BQu6m6gDZcyaeneBT+HM
         xlhndOWP91vRaJZVngjapzqOdK2YZd2EzFeK4iZDdRXC489O/9gUOIBJELrYMug7lOga
         /+sTRBW7OV4OUDwj9d1ghTfjFg61p4Xe4FPiCA3iwvB0VkwLUY1cxMsuVGHDNPqZ5tgD
         0WYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VZDNRcA1AyYPdN+6hCvEyrtHcfZ3Cg8h3bzUVKNWFjk=;
        b=tlZ5gPFlb0Nlu5ZiJlJYHLTHJaYuynBSMt7H0m6/4k2JJAk2TVRdsrnA2C1iGIB9rK
         yW7Oor1zIcT70arDSMLU2b5j8Nic5dK6kcRgPbhn4k83ywE7B38MhtGssCwkslE1p66z
         9fm1S33Lu4CXSQs89FCLJTnot/ZGJqawnvSwOdwJywqdzgyeDCdmiwlkjSkQwFS7Pddk
         uCGUdT1sbixEJzC/iaM4VE/2WW4kZCirgUhCjK3OwU+FaRtLkKjg9Ij7Wf6DLxSW8+gd
         AqSpwm3to5W7BWQnOhZv2GdyTvvaORFCGSgZ4WcCmFa2ISLPnJu1SHj+MbmDS11hk6Uo
         CNkw==
X-Gm-Message-State: AOAM533w7V3za413C9Xuk6ZRrxi446jOsRVFLzijXtfM9jUU0clNnkDh
	KY9Ciajo+DlWWwXVE4KJu6PbNhVhMJQ7ftV9b0gUoA==
X-Google-Smtp-Source: 
 ABdhPJxhLzblmbFdBcwXhCC6LShs6VB36wYNKMkUUoQyk40q6HHTGTEm3CWnCgIym26WvNTaVL70d/yFTu9+UVrA9Cs=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr17103140wri.376.1638477091276;
 Thu, 02 Dec 2021 12:31:31 -0800 (PST)
MIME-Version: 1.0
References: <20211202171706.2259724-1-ross.burton@arm.com>
 <AM9PR09MB4642C0F1D2DF8CEB9F067F00A8699@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642C0F1D2DF8CEB9F067F00A8699@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 2 Dec 2021 20:31:20 +0000
Message-ID: 
 <CAAnfSTsKK6ct=GR3Bnmg7-wjMDZ5USJwSkBGRt3yBGAUvsOWEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] distutils3: fix bindir mangling to stop
 breaking symlinks
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 20:31:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159103

I've not looked at that series yet (the Summit is eating time) but if
it does the same logic then yes.

Ross

On Thu, 2 Dec 2021 at 17:31, Konrad Weihmann <kweihmann@outlook.com> wrote:
>
>
>
> On 02.12.21 18:17, Ross Burton wrote:
> > distutils3_do_install wants to sed out build directory references from
> > all binaries in ${bindir} and ${sbindir}. It tries to avoid touching
> > symlinks by doing 'test -f' on the files as it iterates, but test always
> > dereferences symlinks so this will touch both real files and symlinks to
> > real files.
> >
> > The end result of this is that recipes which ship a script /usr/bin/foo
> > and a symlink /usr/bin/bar -> foo, bar will be replaced with a real file
> > which is a duplicate of foo, wasting disk space.
> >
> > Replace the loop with a find loop which can look at the real file type,
> > not the target type.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >   meta/classes/distutils3.bbclass | 8 +++-----
> >   1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
> > index be645d37bd..0973d304f4 100644
> > --- a/meta/classes/distutils3.bbclass
> > +++ b/meta/classes/distutils3.bbclass
> > @@ -43,11 +43,9 @@ distutils3_do_install() {
> >           find ${D} -name "*.py" -exec grep -q ${D} {} \; \
> >                                  -exec sed -i -e s:${D}::g {} \;
> >
> > -        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
> > -            if [ -f "$i" ]; then
> > -                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
> > -                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
> > -            fi
> > +        for bin in $(find ${D}${bindir} ${D}${sbindir} -type f -maxdepth 1); do
> > +            sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $bin
> > +            sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $bin
>
> Does the same also apply to setuptools as in Tim's distutils deprecation
> series?
> If so it should definitely we be merged there
>
> >           done
> >
> >           rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159096): https://lists.openembedded.org/g/openembedded-core/message/159096
> > Mute This Topic: https://lists.openembedded.org/mt/87457521/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

