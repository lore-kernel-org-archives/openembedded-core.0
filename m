Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF897C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 04:04:46 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web12.36868.1658203476484104171
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 21:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ouzniyro;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id y141so12429382pfb.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 21:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kYEg3X4cJvi1O4+/9oboCxLqM6BnOaxWVZSwES77NtM=;
        b=ouzniyroAFPAYwFNdYUnfUa70V5Gqd7mehdDv0IiTlJ3TDdkUuNI8fuJYAawBPnI+X
         ia/D5+hCnoMIkftrHn5PV+a5vMnOdJgUsnLGxMOAc0dvb20+sOr41p2hunDJNdYKNHPm
         GUovj6QVYQya6EtipdE1ILUJrRpmYdHk+NxWuJ1po9CIrTAxoPOIEto8u2C+kmKhqs+U
         TuedKzmfXIniAUIi8EyHQeDFywFfCgzo7cmv4vcd0DmoZNlQ7IhNy8fsKTXeSf5YO9Yv
         QbInv1+fbNxAOUvlBZKU1wYcl/mK3IUrt4rrWRpVH2/9eyzXWnF2MSFNNaKKWozAIay5
         QaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kYEg3X4cJvi1O4+/9oboCxLqM6BnOaxWVZSwES77NtM=;
        b=uETNW8yvQC2qUeMT721ZSzt/VMMR9I4gCj7LkyGJ89NmFRwXgG3/FT4V7pJVlve46O
         7ib78ofT7C382g5rbewSn2vxK412Fr796Lj5SRegsRcbDL+JQwVaxS/OmwJxa0YC/Qun
         zoCuM1gmtSXucD6W5tyyXcSB2en0d6I+WXfGZeZqFS/BvjIiAU+8xqBIHAywlrtHaU4/
         BgsechMnXrlRmKuUYOm6Xea83exx1Nn21DkFZcSYCVDi4E6YgrNWFj3orcjO2JEJwN8R
         CYjL5kQs7o5tMj2T+Y0E/BRn1RUj2HP9G5hJupSRTAP0wIJcyP3dPl1oza4Pci3YosTV
         BGVQ==
X-Gm-Message-State: AJIora9QS/eH9LJX2ahoSKxj2F9zoDhYxtrMjPnl6gNXSJ1C3j0cGqcs
	lybo6l2ORkD7eIifUx972RmfRcX++bWsXKMIcUw=
X-Google-Smtp-Source: 
 AGRyM1t8mu7HH3FRmQyZ8NdgVvtykiVNw/fDOuJ2ACBfttCZcz0RY0Ka3FV+fYUfP/da3IM8KztCi0gUMAuKi8bzuZM=
X-Received: by 2002:a63:dd43:0:b0:416:8be5:94d6 with SMTP id
 g3-20020a63dd43000000b004168be594d6mr28040340pgj.450.1658203475814; Mon, 18
 Jul 2022 21:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220719034456.2312-1-bruce.ashfield@gmail.com>
 <20220719040101.GA18692@denix.org>
In-Reply-To: <20220719040101.GA18692@denix.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Jul 2022 00:04:24 -0400
Message-ID: 
 <CADkTA4MY9XWkEz7g-r88tx2u8cu67Gkq=7Lo4BgLAHyktcKJOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH][dunfell] linux-yocto-rt/5.4: fixup -rt build
 breakage
To: Denys Dmytriyenko <denis@denix.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Steve Sakoman <steve@sakoman.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Jul 2022 04:04:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168271

On Tue, Jul 19, 2022 at 12:01 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Mon, Jul 18, 2022 at 11:44:56PM -0400, Bruce Ashfield wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Integrating the following commit(s) to linux-yocto/5.4:
> >
> >     cc478e363cc3 rt: fixup random and irq/manage merge issues
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > index 5bc1993cf2..fe75aee4da 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > @@ -11,7 +11,7 @@ python () {
> >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> >  }
> >
> > -SRCREV_machine ?= "086bb7f7d2b47d654922e5cc526cc6274b28e319"
>
> This does not match to what is currently in dunfell, so it won't apply:
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb?h=dunfell#n14
>

right. I have another -stable update pending for dunfell, that need to
be applied first. In my rush to get this change out, I forgot that!

I'll resend everything later this week, I'm off to other things for a few days.

Bruce

>
> > +SRCREV_machine ?= "cc478e363cc35064b58a871a4cc535aa973c5891"
> >  SRCREV_meta ?= "aaaf9f090dfb3160154b24fbc2f9a6e669babc87"
> >
> >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> > --
> > 2.19.1



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

