Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BB0C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 16:31:30 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web09.42757.1658248285236575298
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 09:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GA4h0bXm;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: sakoman@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id q14so12211421iod.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jul 2022 09:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7NV+IJcu1n2dV+VTKgbHD6msLx3U4KC6B+GLNLkTwY4=;
        b=GA4h0bXmAp6xyIYUJqDYjiCTK26DKWqEs634gLneaA3DM9Y9Gngmb5QMqNa4eVfH5c
         m8qpfUqKWF6hwrvsDiXDbDUTZkjacg2LarierXDx4wyqHruHB3q3ejtehzSsfzO3qaiY
         uMsGzl2MdQS1yGo8cmBRO35C/up1MNOAY613fA0fjGWMvovhKynksCUJUOSlmcPul2ML
         WRi1BhHV6qSv4LeWuQ9ndpix9ssGIk4djewhhGyRGC80UHeKeKtlqFW1Pa8Rhq4uOrir
         mwQF3WoXxi7dLpcRzsAzjdPSGLr3JA2X2DwCCRNBm67DlJNV02EdzJKl2dlXmoA2OSJc
         Ed8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7NV+IJcu1n2dV+VTKgbHD6msLx3U4KC6B+GLNLkTwY4=;
        b=zxYsKQBRI6RZ+EDY2OeWaWje6vBc/Mddgp2CkphoeEFNxpSSHCAewDwsMqju1vcr1i
         B8b52fJeJ5BzrJBdxQj0uRl8mOTyVVZICjck2fqPSKGB5UJQjUBp0okISePVwEIYo1SX
         BXqCYHIrk2vA7zNwdOG1Ir7AnNHQTQ5Fs0FRJRNE/H2Prr5tOof0BAzH8cDy/YG/rYpN
         xTFdo6Qo/TIRlZ8mzhZzYcZT5zZhupGNuZUFFq7CN0HMfjTHQ0Tg7z3Z0mT1kVCqrMfp
         Ps3NhYo5GzbUqZMlOyLMHG7xyr3P0+Jb0B32H0eor6eVGgX8btaBfHuAJdYoT/Z/Q6/B
         NMvw==
X-Gm-Message-State: AJIora8xLM82bGJm9EXKY6/5/D9K8mvh0JLPdhaX5KdzRJMnsY3wyrOb
	iUBkgnmNdrc0DKefFbZhImsVqYThr2iKh7lYhn4=
X-Google-Smtp-Source: 
 AGRyM1u6QMquTUgTMehdZdZn5R6rMJoKg4h3f6lxF89wMbVMLyphHacqGgu3dh8xkDUQwrOLp4WCw4Cg9W5PrwZsw5I=
X-Received: by 2002:a6b:5f0d:0:b0:67b:da10:933e with SMTP id
 t13-20020a6b5f0d000000b0067bda10933emr11281417iob.56.1658248284521; Tue, 19
 Jul 2022 09:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220719034456.2312-1-bruce.ashfield@gmail.com>
 <20220719040101.GA18692@denix.org>
 <CADkTA4MY9XWkEz7g-r88tx2u8cu67Gkq=7Lo4BgLAHyktcKJOA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4MY9XWkEz7g-r88tx2u8cu67Gkq=7Lo4BgLAHyktcKJOA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 19 Jul 2022 06:31:13 -1000
Message-ID: 
 <CAGDS+nm5MO82gwwx0a1D6J7wp8DMUAwsJhFRt6LHAWVYY++-rQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] linux-yocto-rt/5.4: fixup -rt build
 breakage
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 16:31:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168285

On Mon, Jul 18, 2022 at 6:04 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Tue, Jul 19, 2022 at 12:01 AM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > On Mon, Jul 18, 2022 at 11:44:56PM -0400, Bruce Ashfield wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Integrating the following commit(s) to linux-yocto/5.4:
> > >
> > >     cc478e363cc3 rt: fixup random and irq/manage merge issues
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > index 5bc1993cf2..fe75aee4da 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > @@ -11,7 +11,7 @@ python () {
> > >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> > >  }
> > >
> > > -SRCREV_machine ?= "086bb7f7d2b47d654922e5cc526cc6274b28e319"
> >
> > This does not match to what is currently in dunfell, so it won't apply:
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb?h=dunfell#n14
> >
>
> right. I have another -stable update pending for dunfell, that need to
> be applied first. In my rush to get this change out, I forgot that!
>
> I'll resend everything later this week, I'm off to other things for a few days.

Perfect, the 3.1.18 build is scheduled for next Monday and I'd really
like to get this fix in.

Steve

> > > +SRCREV_machine ?= "cc478e363cc35064b58a871a4cc535aa973c5891"
> > >  SRCREV_meta ?= "aaaf9f090dfb3160154b24fbc2f9a6e669babc87"
> > >
> > >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> > > --
> > > 2.19.1
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168271): https://lists.openembedded.org/g/openembedded-core/message/168271
> Mute This Topic: https://lists.openembedded.org/mt/92476074/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

