Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05932C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 22:57:08 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web09.1183.1657753024684648779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 15:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QDfUv2YS;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: armccurdy@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id r18so219409edb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 15:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BgVIl3+rH8tcOJqnifVUXz3mTZ5PdU/MYGOQ5/eX3Xg=;
        b=QDfUv2YStGSyViwwVbN4MLcTAjiQ3EBTp+pLmKzrIKEGHnmmadMJK71eGvEim81Cq5
         kSEEjRNQBo/W++hJrd0vE0hCMbe/R/M2s0TJiElj0j94u5RyFMI2flukxAsl1hwiQlEV
         eYuQWqfs7X5PZuOhySZwJ6sN4A7IpO03rlT3X5qtR9WCkIgqDz0nqbhgVdS4BA5MEn7t
         itarnLF9qs9b5J03pN/8wQV3QwCSY3iHgsZBaFmy+1xV9D7yV6F8aWXm/myVLGwhr2X5
         wKRgYzuGp5s05yzPBckZsWg5JJjht9zMnY/mD+f3ym9QHB6fAvPwFL9fYgK5MzpOCU8i
         mMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BgVIl3+rH8tcOJqnifVUXz3mTZ5PdU/MYGOQ5/eX3Xg=;
        b=yYzklGicwKOVDJbgfNRb9ZaDRzzCk1y6eYB5rC23/5t8LujCdmr+XgJgKVzlyvKPUL
         CA2i3Hp3hPQ/PDlynoFPWtHylDrLUoGsC4Xn0pcXFHeDec+/7zd3PytHKQ8hjy7hqXbU
         Tg9W/GSLE+wX05hQKru3XnDZYLC7hfLZHc+wmep19fbhu2Yq95l95/3ViYfpj8EXxdz3
         n1dXjFA8vwX+BnCKjLfykP8HU/XqoCIn/+s+C+0f9+B83CU6XvyVtFLcH2DsL8FoquOl
         rWGAKEmZ+O48SEbrh70lX+Myd7AWHrI/yTJqaMS5sFuKOFhot+4CV/tjz2Y2p8HlD3Vl
         YsKw==
X-Gm-Message-State: AJIora9MsuEpjG0psdP91byqVMKcP+scvmZi/Wq2nDl8Or/bK/vMFX60
	6RqZb4FtVkKGcPOHdGQDvZeOrv+CiuFzXjVBVNc=
X-Google-Smtp-Source: 
 AGRyM1vC6/FtqKokR5Ou9vlDQcBoeYHSVecYaRItr2wMaaOFn60hh5i9tFhM9RWVjHtzF2WgaHm6YtLAsCtWAQ8MGD8=
X-Received: by 2002:a05:6402:15a:b0:431:71b9:86f3 with SMTP id
 s26-20020a056402015a00b0043171b986f3mr7919761edu.249.1657753023078; Wed, 13
 Jul 2022 15:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220711202929.3839971-1-luca.boccassi@gmail.com>
 <20220713165533.125600-1-luca.boccassi@gmail.com>
 <8189a37bf619f781f8e9437fd5a4b2c7c06c7457.camel@linuxfoundation.org>
 <CAMw=ZnQCPQ4zm0+YDjLq4+k17kYyjBTtAz2VsDFZDsUYp1jCXg@mail.gmail.com>
 <3f2f03085301d22854e5429019fb010f27d98bc7.camel@linuxfoundation.org>
 <CAMw=ZnQGseWOkhmpVdMMLSeq2+-9AND=FbO5k2FHgCkgo5Lnaw@mail.gmail.com>
In-Reply-To: 
 <CAMw=ZnQGseWOkhmpVdMMLSeq2+-9AND=FbO5k2FHgCkgo5Lnaw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 13 Jul 2022 15:56:46 -0700
Message-ID: 
 <CAJ86T=Whwb5cx2Ac0V0Ym8Z7r7zSDT58fZN_BtfpLcQmBUvrFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] poky-altcfg: enable usrmerge
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 22:57:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167995

On Wed, Jul 13, 2022 at 12:02 PM Luca Bocassi <luca.boccassi@gmail.com> wrote:
>
> On Wed, 13 Jul 2022 at 19:36, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2022-07-13 at 19:09 +0100, Luca Boccassi wrote:
> > > On Wed, 13 Jul 2022 at 18:53, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, 2022-07-13 at 17:55 +0100, Luca Bocassi wrote:
> > > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > >
> > > > > Ensure it gets tested by the CI
> > > > >
> > > > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > > > ---
> > > > >  meta-poky/conf/distro/poky-altcfg.conf | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/meta-poky/conf/distro/poky-altcfg.conf b/meta-poky/conf/distro/poky-altcfg.conf
> > > > > index f03306e798..57a76e8bb9 100644
> > > > > --- a/meta-poky/conf/distro/poky-altcfg.conf
> > > > > +++ b/meta-poky/conf/distro/poky-altcfg.conf
> > > > > @@ -9,6 +9,8 @@ DISTROOVERRIDES = "poky:poky-altcfg"
> > > > >  #DISTROOVERRIDES = "poky:linuxstdbase"
> > > > >
> > > > >  INIT_MANAGER:poky-altcfg = "systemd"
> > > > > +# systemd will soon require usrmerge
> > > > > +DISTRO_FEATURES:poky-altcfg += "usrmerge"
> > > > >  # systemd isn't suitable with musl
> > > > >  INIT_MANAGER:poky-altcfg:libc-musl = "sysvinit"
> > > > >
> > > >
> > > > This blew up builds since it clears everything else out of
> > > > DISTRO_FEATURES which isn't what was intended. I've tweaked the patch
> > > > and re-queued.
> > >
> > > Sorry, did I get something wrong? The diff between my local branch and
> > > the master-next branch is empty, can't quite see it:
> > >
> > > $ git diff upstream/master-next meta-poky/conf/distro/poky-altcfg.conf
> > > $
> >
> > My fault, I'm trying to restart the build from a different environment
> > to usual and I messed up the change. It should be there now (and build
> > restarted).
>
> No worries - I see, in this case the append was the right thing. One
> day I'll get these right on the first try. One day! Thanks for the
> fix.

Yeah... += with an over-ride is intuitive but 99.9% of the time is
completely wrong.

There was a discussion some time ago about having the parser reject it
with an error because it repeatedly trips up new (and some not so
new...) developers, but it never came to anything.

> Kind regards,
> Luca Boccassi
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167984): https://lists.openembedded.org/g/openembedded-core/message/167984
> Mute This Topic: https://lists.openembedded.org/mt/92361983/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

