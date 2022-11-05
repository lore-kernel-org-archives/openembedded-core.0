Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9E1C433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 19:41:06 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web09.9786.1667677258454755507
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 12:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=y8JSI95G;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.48, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f48.google.com with SMTP id a5so12043439edb.11
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 12:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ojEeem2p7zMtpmNrk+E3YmE7/n4WZ30xgF+aPRfsyLg=;
        b=y8JSI95GnwoFAiu4CaEVr43OHWkkEqbrx3XldM86ftT75Ip2zRfMGXiJSZBgY3mK+7
         ABCzKfwH0NQRKAMwutL4BEGj4AhlXYTF/ZxxpSHb8sH9Bz0v6cA1vOwZ3pj7SIdcXVF6
         9nBh9yLxi/v8XLFMISSzC6zeT4MF34apP/IRD01vO9wXCwv/u5wg4+h/stPRMq08Mgsh
         V9YrlOOdy7MesFBRs2rlCbBjrl7/snCPUxju9iV7FnoXppYIuFZI6dVsVZ2OjIuoMc7z
         IJ5uqcZjWtRUMhSV4CWkZmHYFDa2ydYs5VwVyI8veEqkjBOKLsuncWUGM2d7ROCgdMWT
         //yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojEeem2p7zMtpmNrk+E3YmE7/n4WZ30xgF+aPRfsyLg=;
        b=BFq7fV3eRDk942xhWEHxCsInmV3+YU97aPmN0erboBHbQQ57vmjWcm2ZRxsF0K78fZ
         5WtkJz71IAuoV8cOFeqXIeWpghH6ObcuQKYQqz4Bw/G+SS5jgGhDmeIbvT4uczRm/k4L
         E1FwsDR574J0+dLVkFdKSeMT46iIlcrvEUfxDlB1nBPpwnE4lZuBr2DHDegctpZPQaQz
         EHCCqG713PS0a7vhKrEWUNPdIaQDUIuBsUVSsGhLi/GWbzNNQ0f84iMelgMv7vHuR4M4
         PR3NLahtYSaMMDjs/kdw2ipP4UxJrsFv3y7J7c/u1tylwVusVpvvlNjAYrViqqHOj4p8
         Nu4Q==
X-Gm-Message-State: ACrzQf2xx5F3qN1t5KvI8ea9yr7uUcxxrdm0GHO2M+k4wkb9U66+0n5u
	2GoGeM/3E6UVw5wIg4DdUWkUmL8kkLbIAs+iWm8oJA==
X-Google-Smtp-Source: AMsMyM7BGNNsjJv2JpCYqXEOmFQ7abpYc0q3lEJmrCpzMXyyBdonWTls3MaCW4SqWG13Q0N244IY/dx7bWdgRDSWSkc=
X-Received: by 2002:a50:eb05:0:b0:457:c6f5:5f65 with SMTP id
 y5-20020a50eb05000000b00457c6f55f65mr41119015edp.311.1667677256782; Sat, 05
 Nov 2022 12:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221105154203.273684-1-pkj@axis.com> <20221105154203.273684-2-pkj@axis.com>
 <CAOSpxdZzGOPfcesAm0ykhcatZCMUwLUBjLudauD1J1Kod1UFFw@mail.gmail.com>
 <CA+chaQcY4iku9jwfsTQqe95E_Gge6X5GC=ZHLBDVwr7_poa86A@mail.gmail.com> <1e435dd091324e19aa0231e86ef5da8d@axis.com>
In-Reply-To: <1e435dd091324e19aa0231e86ef5da8d@axis.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 5 Nov 2022 09:40:45 -1000
Message-ID: <CAOSpxdbOxC-Vgzbw-dtj_TpiEGXo1kL6jeN-8L9TjCgrJy_4xQ@mail.gmail.com>
Subject: Re: [OE-core] [langdale][PATCH 2/2] externalsrc.bbclass: Remove a
 trailing slash from ${B}
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 19:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172757

On Sat, Nov 5, 2022 at 9:36 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Argh, the second series (with three patches) is intended for Kirkstone, not Langdale.

No worries!  I think we are good in kirkstone too:

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Patch series for both will go out for review in the next day or so
once autobuilder testing is done.

Steve

> From: Martin Jansa <martin.jansa@gmail.com>
> Sent: den 5 november 2022 19:28
> To: Steve Sakoman <steve@sakoman.com>
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [langdale][PATCH 2/2] externalsrc.bbclass: Remove a trailing slash from ${B}
>
>
>
> In my inbox it looks differently, 2/3 and 3/3 aren't identical and both are indeed in langdale-nut.
>
>
>
> Then there is 1/2 identical to 2/3 (probably from sending last 3 externalsrc.bbclass changes and then re-sending after realizing that only last 2 are needed).
>
>
>
> 1/3 is  already in langdale:
>
> https://git.openembedded.org/openembedded-core/commit/?h=langdale&id=6d9364e5f3535954f65cbbc694ee7933ac1d664f
>
>
>
> I think all is fine in langdale-nut.
>
>
>
> Cheers,
>
>
>
> On Sat, Nov 5, 2022 at 6:59 PM Steve Sakoman <steve@sakoman.com> wrote:
>
> I've already got these first two patches in stable/langdale-nut:
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut
>
> And your 3/3 seems to be identical to 2/3.  Am I missing something?
>
> Steve
>
> On Sat, Nov 5, 2022 at 5:42 AM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> >
> > The trailing slash in ${B} caused -fdebug-prefix-map=${B}=... to not
> > match as intended, resulting in ${TMPDIR} ending up in files in
> > ${PN}-dbg when externalsrc was in use, which in turn triggered buildpath
> > QA warnings.
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/classes/externalsrc.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> > index 5905342589..75fb91bcb0 100644
> > --- a/meta/classes/externalsrc.bbclass
> > +++ b/meta/classes/externalsrc.bbclass
> > @@ -61,7 +61,7 @@ python () {
> >          if externalsrcbuild:
> >              d.setVar('B', externalsrcbuild)
> >          else:
> > -            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
> > +            d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
> >
> >          local_srcuri = []
> >          fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172754): https://lists.openembedded.org/g/openembedded-core/message/172754
> Mute This Topic: https://lists.openembedded.org/mt/94828874/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-

