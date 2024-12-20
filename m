Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D34E8E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 17:40:01 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.765.1734716400313833747
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 09:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lH3tajEL;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53f22fd6887so1981302e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 09:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734716398; x=1735321198; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eClNwLT+PHwXqex2k2mzsJ/jxfkrNIxNEJYY86cISdI=;
        b=lH3tajELystnFPnUVRlPK5uAl6HMLfk/bfy3D6fYHvHg8X18Eo50KinA7+pxtB7IZz
         smATNwZwVQaX++9dqwqYtkJCTdXXcPIloWHov+x3Pvl3n8UBtEJZ6+TVje3A90h4yL1F
         eYSQ0T/q6A7cIA/JHTT0G3YPSo63K8f3uJTDvHiH1585ZMPZQGA3IbDwWwsAE+W7ADhv
         o7vXSp303IUwmBshBp8iLYQqJ1QoVo6f00TRwezABLt181DXDRFhUtHL8YlhaD73BYTx
         v84k34YgLVsHz5RnX0zXaJptjPHgCJ7pD6TBUwKxw56mPOe0Xl8ChhAHTbHUeNoPzUVv
         MgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734716398; x=1735321198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eClNwLT+PHwXqex2k2mzsJ/jxfkrNIxNEJYY86cISdI=;
        b=Jht2b2gMvRpzxYkihytR4gO3s0NWsBtHRDz+lbzIPFbA1wo+4ndHDOsl7Dw44O2bsX
         Jl8NUleBcw8zqc6F1vYyk0AjPhaLR5OkEL8eSQRUVIsawj/QF8/RQuXU0QqVaMSEljMw
         DSODm6UgLNfv//Ye6vEXROkO1+29MVmGm/StQF1LdGsCIlEbn4DYW8WiPiuSRkIZDNjs
         wZRS4lm6ZVkH5iazeiMoi80nN0/oiT/+pJ5CGPl+yDw00QQfwNI/uashKxdi+5cubpaq
         dfEOk2CrakIgw/Niv99i1XzWRwGdxzzYydcKIJrqHBE2FdQ7ZIdXGSDbfrTuZl42PqfT
         sELg==
X-Forwarded-Encrypted: i=1; AJvYcCVfCHLQw+MBx6MzhbrD7nlMKMipai6NEWNKAfHtg2VkoWTYEK7Q3zqll0ClajaHkIptQL5ENFL+1kVJoG5PIuWZEg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwufaUUSUDWJsbOtGU9a/nNuMFUSCA+uj+iQ4Kg24mS9kRUGVAI
	bnWZf8wNiJ3F5f9LXjek32rN5rWIHttCXnfld2iXKLE76ZJLGHFvTrdFcUmZ3mT0BFcJxUjZhGj
	l+6kG0hcfv2BjVJW4UXSsyDLu+Jk=
X-Gm-Gg: ASbGncvXXYx2fxFS7dVhsbJvlxMs/PzOn2XRzjU/xCdE+j1MqfR3QRl8vbiIzU1BY+V
	SlaDVDh7DTfxQ1uEZPrsMGvu8C7rNCe/U9lVTcXxuPYiRbiznAH8/
X-Google-Smtp-Source: AGHT+IEzV7ndXmqK8B+TuxjevU94cJhkAmdMbypuGmNQZQlK+YLkZHOLRd9XT3hT4i6pafmtGV1+UVprNLMeQ0ULM5c=
X-Received: by 2002:a05:6512:10c4:b0:540:2fe6:936f with SMTP id
 2adb3069b0e04-5422952527bmr1549211e87.3.1734716398120; Fri, 20 Dec 2024
 09:39:58 -0800 (PST)
MIME-Version: 1.0
References: <20241118162643.1423409-1-alex.kanavin@gmail.com>
 <20241118162643.1423409-3-alex.kanavin@gmail.com> <c799588bada27abdf2b412115868c5b84c24a0e2.camel@linuxfoundation.org>
 <CANNYZj_ONOGam=9um4qqqAc_D0gQHrQML3a9eXBEgHLCiRtM1A@mail.gmail.com>
 <4254d23ae9ad100e70f199fa4949ce00bfe7063c.camel@linuxfoundation.org>
 <CANNYZj-Ox6t8yV7Bh2NePmseYCW843Z5ozq50y2Tyoa=GeDPyg@mail.gmail.com> <1647f808543a0851f5a1a17e293f1a68970f7c0e.camel@linuxfoundation.org>
In-Reply-To: <1647f808543a0851f5a1a17e293f1a68970f7c0e.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 20 Dec 2024 10:39:46 -0700
Message-ID: <CAJdd5GYwyLGFs_nreXDNV6F8_GAiTBMhWOe6V_TiO9aw+MCOng@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] bitbake-config-build: add a plugin for
 config fragments
To: richard.purdie@linuxfoundation.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 17:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208987

OK, I gave this a try and here is some feedback:

1) bitbake-config-build is way too aggressive in the files it looks
for as fragments. My editor (vim) creates hidden temporary files that
I kept having to manually delete or the tool would attempt to parse
them and fail. I would recommend that it only consider non-hidden
files that end in .conf as valid fragments.
2) It would be convenient if `bitbake-config-build enable-fragment`
and `bitbake-config-build disable-fragment` could take more than one
fragment, as this would make scripting in CI more straight forward.
3) The biggest problem I had with this is that I can't set variables
like MACHINE/DISTRO etc. in fragments, I think this is due to how
deferred the evaluation of this is. Without being able to do this, I'm
not sure how useful this system will be for me (or at least, it won't
be able to replace any of the current mechanisms I use). I think what
users are generally after here is that they can really easily share a
configuration in source control (which this does well), but if it
can't control everything it's of limited use.

As a practical example of what I would like to see for this to be
useful, consider https://github.com/JPEWdev/oe-doom-demo. In this
repo, we are building a demo program for multiple different hardware
platforms; In an ideal world, the instructions I could give someone
would look like (NOTE: this is fictitious because the repo doesn't
work this way today):
```
git clone https://github.com/JPEWdev/oe-doom-demo
cd oe-doom-demo
./scripts/setup-layers
. core/oe-init-build-env
bitbake-config-build enable-fragment doom-demo/le-potato
bitbake core-image-doom
```

This specifies all the things required to build the demo for le-potato
hardware (including MACHINE/DISTRO/etc.), so they should get the exact
same demo image I made when building.

On Mon, Dec 16, 2024 at 9:58=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Wed, 2024-12-11 at 12:24 +0100, Alexander Kanavin wrote:
> > On Tue, 10 Dec 2024 at 16:27, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >
> > > > If we start going down this path, we might as well write an
> > > > interactive curses UI, and keep the command line output 'flat'
> > > > like it
> > > > is now. I'm also not sure what is the best approach, we'd need to
> > > > take
> > > > fragments into practical use and accumulate a sizable amount of
> > > > them
> > > > perhaps. Such things can be easily tweaked from experience.
> > >
> > > Having experimented with curses UIs, they're a pain and don't
> > > really do
> > > what you hope/think they would.
> >
> > We might be thinking of different things: my suggestion is that
> > interactive 'kernel menuconfig' type UI is worth exploring for
> > fragments (or bitbake-setup, for that matter).
>
> We were talking about different things. I agree, I think something
> kconfig like for some of this would be much appreciated by some users.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208780): https://lists.openembedded.org/g/openembedde=
d-core/message/208780
> Mute This Topic: https://lists.openembedded.org/mt/109647318/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

