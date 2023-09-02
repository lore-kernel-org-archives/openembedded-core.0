Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD49CCA0FF6
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 05:09:21 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.3433.1693631360596828155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 22:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pHntzuXT;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5007c8308c3so4717724e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 22:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693631359; x=1694236159; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m2hf099yGapfAdu8zDnXJFbGvvnUvGtY4GyiMLuXB4A=;
        b=pHntzuXTCnJQOd7xMldIvUeLZGjDuIh6azmg3kDjyNrKSVi4JmHgjeEINRw7UNfFXJ
         fDVzQ1Az0a8RCHo2S+GkOvFBJE/u3YB+OWLl/WvLBX+TjssfZ0VoiHL/YjdFLOo5BLel
         Hvr2TJkxzY8HUit1vtWM/p6Pf+zJkl39JInWJsgubwdPgbWz30pRMZAKT8aV+q+DaZAc
         McT1FCYqtQA6vXnukQoUJ9Z9LAyrsFHNSgD8RGAtv3ro9Ckoe9izo+J6dd8rTywtkI9S
         rTH07QCQ8w/4jcMjzfHz3Lh0TlVzQPOqsapLoUkEirTJTBx4bglJbnVzbOOqqHAICrUK
         C/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693631359; x=1694236159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2hf099yGapfAdu8zDnXJFbGvvnUvGtY4GyiMLuXB4A=;
        b=JlMiIjac9U201ftSz0Tn2qxbYPNSel/gafNoYD1AsldJmk1XRvFIej74e8aGTQzUok
         HqNdpoVpO03cOokwO+eDKv8oPsFMR8w5HMyCzHHa9QqGnHjA41rIKB+ttINmHQ6Srwgr
         KIu0CKx0MxO+GZdYG3/PYBI69XzNmHERbJHinJjk8uKi5f8BGiahMkg4LhmqFyaDZgJc
         uvGt6dCwVpmVT0Q2KLySewxj7/KInupDHLpB9YduXD+ZOpaoB9j1VO5CwWFJd0NosBgA
         mfHeKUXPZJ1U5fUs46b2vogr3RNXreLEq/CdGmJMB21yM6hxgg9MP1QFfMaKgJBoNkBI
         hcgg==
X-Gm-Message-State: AOJu0YyWHYT3TO2TreIJalQAb5zrjoxUww7vKCIGk9CRBvNiVOSP0KiL
	wwYlOdStVra2o0uZSnX5AOKQ9+yDRFSmhm0u+FM=
X-Google-Smtp-Source: AGHT+IFEvLi0LiY6TE3G0vxkULe3bTd3IAAYPlrbiNyjmr8jhqfRuOef+MfsV1bQYhdnVQ8a7JYFuLtAFJhyxdyhRSA=
X-Received: by 2002:a05:6512:398d:b0:500:7efe:313c with SMTP id
 j13-20020a056512398d00b005007efe313cmr3206561lfu.24.1693631358430; Fri, 01
 Sep 2023 22:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <lyjzt9g8e8.fsf@ensc-pc.intern.sigma-chemnitz.de> <5c1df1490ce569e7644d33b33b2a44cd42dfc270.camel@linuxfoundation.org>
In-Reply-To: <5c1df1490ce569e7644d33b33b2a44cd42dfc270.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 2 Sep 2023 07:09:06 +0200
Message-ID: <CANNYZj8jxOoj0sta7rp5EZdBqR=HX6hs45e6Co5znRzBLkyrRQ@mail.gmail.com>
Subject: Re: [OE-core] rust: why is it built in do_install()
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: enrico.scholz@sigma-chemnitz.de, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 05:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187020

On Fri, 1 Sept 2023 at 23:22, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > > do_compile () {
> > >     rust_runx install
> > >     rust_runx install clippy
> > >     rust_runx install rustfmt
> > > }
> > >
> > > rust_do_install() {
> > >     cp -a ${B}/_install ${D}
> >
> > ?
> >
> >
> > [adding 'rustfmt' to 'class-native' would be nice because e.g. 'bindgen'
> >  users might expect it]
>
> One potential downside is that "install" would then run outside pseudo
> context which may cause problems with permissions. I don't really know
> whether that would be an issue or not though in reality.
>
> I'd be happy to see more people working on the rust recipes. The
> challenge is the long testing cycles needed. Fancy working on some
> patches?

The original recipes in meta-rust and oe-core recipes had for a while
separate compile/install steps. At some point this regressed on a
version update - install on top of compile became broken and errored
out, but pristine install (with compile inside of it) continued to
work. This is what upstream tests and documents, so that's how rust
recipe does it as well nowadays. It's not any slower than separate
steps, actually it's somewhat faster, as install was rebuilding
supplementary things unnecessarily after compile has already done
that. The only problem I see is that it's indeed visually confusing.

If somene wants to separate the steps again, they can simply find the
commit in oe-core history and undo that. Any changes would have to
fulfil this:
1. Rust's installation procedure should run under pseudo, e.g. in
do_install. Even if it's not a problem now, it might become a problem
later.
2. The changes can't lengthen build times. Rust is already one of the
slowest items in core.
3. This probably requires fixing things in rust upstream, w.r.t.
supporting separation of build/install, and install using artefacts
from the build step properly.

Alex

