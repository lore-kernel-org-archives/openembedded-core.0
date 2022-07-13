Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157F6C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 19:03:04 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.1083.1657738974761717774
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 12:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cnS4rfnB;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id eq6so15323727edb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 12:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4PyzigS/bVirvEP2pKxksbh54UfamkOySqJdYUSfYas=;
        b=cnS4rfnBtuLSVVdaqiGIYLWOXBOzQ2DAyODA4QcEvOpi4kdyHiatiVGqqH4yQvURF0
         jtavrX02c+dY6iKFoCiXzDFtXc5dl0ECizh9h988p9/B1Xi6vChEyg4b/gpG8pWJiq9J
         KjaFaBoWKbHs7OONWHOXWYOw1nj2GuXAFjM2qpPtxdvcuPOTobyKEdlBw7DBmPvkyL3A
         5MDe9ZOIDtEwP8tCKQckoF2uIGlQai+9B48I2bTMMTor/ggyxtEDjvmr1a3DPD+mpGcM
         xpKNFuyAi30+fUKMgIFRoEEmgzCqzwvq+H2p0NOvO9rYUm61mhVvj4QuGrAtohsTenk8
         A1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4PyzigS/bVirvEP2pKxksbh54UfamkOySqJdYUSfYas=;
        b=b4xcirGncgmfNDqnjigQLtBu9nRg5ypeB+XzhRAz7aSm5NepxDGuQwhoDX6TnWvZ4C
         mY1LX5FvfoQzcx88AUJp18NajSMev/m3E/n363gIDAELOBUuGFNb75sN41foex+7xGEJ
         QsA+2/kB03vQaKj8kYPgFI3TawL/VTv7FpQxIG7kFpX6eUb8M+AswluX9BiE30e4eFa4
         pUn2HhEhwVYblXhxuUyq7XHrZMhI3Xf355LKUk9Y2Evv7JIUPKtbAM0gK9wOchZBEkTo
         M9ivdL7hp57s9i3fM5HkIWJxFgN0+OASoXmbf7mcRoJyMi8hLBRMH7yIfHbwBperN0Pa
         bNag==
X-Gm-Message-State: AJIora8J9KKBN66Q8+32dLkmwGd8GbTrq9NGIEPNLhLKDg9DxWTfHs5W
	XrqeSdwDKoT09eQ+nvbrOpmBRodxp1niCdO2YL4=
X-Google-Smtp-Source: 
 AGRyM1u18kiT52VRv6z6op1Oi6+foK6ypmL2ksjKAxSSZT0BbassAkGTvN0jUoj5BEAxYWgPEKCdbjtNR5XMOzrQYtY=
X-Received: by 2002:a05:6402:695:b0:435:65f3:38c2 with SMTP id
 f21-20020a056402069500b0043565f338c2mr7044269edy.347.1657738973093; Wed, 13
 Jul 2022 12:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <20220713165533.125600-1-luca.boccassi@gmail.com>
 <8189a37bf619f781f8e9437fd5a4b2c7c06c7457.camel@linuxfoundation.org>
 <CAMw=ZnQCPQ4zm0+YDjLq4+k17kYyjBTtAz2VsDFZDsUYp1jCXg@mail.gmail.com>
 <3f2f03085301d22854e5429019fb010f27d98bc7.camel@linuxfoundation.org>
In-Reply-To: 
 <3f2f03085301d22854e5429019fb010f27d98bc7.camel@linuxfoundation.org>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Wed, 13 Jul 2022 20:02:41 +0100
Message-ID: 
 <CAMw=ZnQGseWOkhmpVdMMLSeq2+-9AND=FbO5k2FHgCkgo5Lnaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] poky-altcfg: enable usrmerge
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 19:03:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167984

On Wed, 13 Jul 2022 at 19:36, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-07-13 at 19:09 +0100, Luca Boccassi wrote:
> > On Wed, 13 Jul 2022 at 18:53, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Wed, 2022-07-13 at 17:55 +0100, Luca Bocassi wrote:
> > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > >
> > > > Ensure it gets tested by the CI
> > > >
> > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > ---
> > > >  meta-poky/conf/distro/poky-altcfg.conf | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/meta-poky/conf/distro/poky-altcfg.conf b/meta-poky/conf/distro/poky-altcfg.conf
> > > > index f03306e798..57a76e8bb9 100644
> > > > --- a/meta-poky/conf/distro/poky-altcfg.conf
> > > > +++ b/meta-poky/conf/distro/poky-altcfg.conf
> > > > @@ -9,6 +9,8 @@ DISTROOVERRIDES = "poky:poky-altcfg"
> > > >  #DISTROOVERRIDES = "poky:linuxstdbase"
> > > >
> > > >  INIT_MANAGER:poky-altcfg = "systemd"
> > > > +# systemd will soon require usrmerge
> > > > +DISTRO_FEATURES:poky-altcfg += "usrmerge"
> > > >  # systemd isn't suitable with musl
> > > >  INIT_MANAGER:poky-altcfg:libc-musl = "sysvinit"
> > > >
> > >
> > > This blew up builds since it clears everything else out of
> > > DISTRO_FEATURES which isn't what was intended. I've tweaked the patch
> > > and re-queued.
> >
> > Sorry, did I get something wrong? The diff between my local branch and
> > the master-next branch is empty, can't quite see it:
> >
> > $ git diff upstream/master-next meta-poky/conf/distro/poky-altcfg.conf
> > $
>
> My fault, I'm trying to restart the build from a different environment
> to usual and I messed up the change. It should be there now (and build
> restarted).

No worries - I see, in this case the append was the right thing. One
day I'll get these right on the first try. One day! Thanks for the
fix.

Kind regards,
Luca Boccassi

