Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43789C07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 19:58:46 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.15762.1664308719772257537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C5eQEXUg;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id s6so17278247lfo.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 12:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6t08gnriqR2DNyZPxDrW5XmGuqIOp9BE7PjYqOaERrE=;
        b=C5eQEXUg6f3vyTnaJoAmzgfVJ1xHegS6PoZJktL8Gt18oEx4CmucwId0DDDOvLGVzw
         fGtto/kCSneQzL3LitRiVytCA5bU0kgeyxWBLX8tPVxUSvTLrnOl68xAozc2K6dnJPTq
         eSqNoftGzRMkCR6ClsInxMbI3grNWP5qq4GWQm9f86nhipvKQ+IOW9+ZhANrjeIwX7v4
         PUzje1kc+0GsivKYOA34UjUAQxeE5Nw0HvQglWvXeJA2Co87jJLtFEgsWcryDPJ8o1f1
         hSZvOKGzcgx7PeRQulK3JPKerhOQwz5rVnwihlyOxhwvrAg0UAMWCOFzo1kNed8OyjFp
         Ffaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6t08gnriqR2DNyZPxDrW5XmGuqIOp9BE7PjYqOaERrE=;
        b=mRlZE8Hz9iIm1zyfpUsmOI4FycI7jUOh9mmChmfAqqN7/BdVftAGkW06P+Xub8UTyu
         rsXTpshuRbkK2oWQPe7o2TRqPO0xqcQBNQWXgAXd+AIx7vlBqEr2rFVwyCq5duOIDZVg
         FExbyCLSpGUGb0i96TaUGwZ/VvdZNH+8ywn4yPho8r3tOIJxUJeHSWfIDs/7pHhXuE9s
         /rUVWwYExM0gyNYwNb7ay2lhrH1A2VMqKv75r4lz9ZT5lbhv1e11fs86fPU35rbS0pQT
         hCaNRtztFujbW1endBwPAV20JK44iek/+bnuRWcRcOzl/KEMOBpYneKDkJQ/RwFvS8Jm
         NScA==
X-Gm-Message-State: ACrzQf2iFYuW6a6EQatJZoyQZbeRCfQx0yrnDGqaIizcOJGcu5mEC8vg
	6M23m4LJ/voWfMr6nButQnBR+e9oNfVsQryd0vk=
X-Google-Smtp-Source: 
 AMsMyM4pX+RLOoG9XsIWCO3hdDWfMdY2muYE0gsR26g8T0pmmyYOLn3cuuWBxg3odbc0s2L9+ItNao+Xh9xcjSL3NFM=
X-Received: by 2002:a05:6512:10c4:b0:499:4c:64d7 with SMTP id
 k4-20020a05651210c400b00499004c64d7mr11887437lfg.521.1664308717792; Tue, 27
 Sep 2022 12:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124708.2218995-1-pkj@axis.com>
 <20220922124708.2218995-2-pkj@axis.com>
 <28947223c26b05f58c4b6cd13919b025617318a2.camel@linuxfoundation.org>
 <ee0aa31d5fa34a5ba889e3518d8b2a95@axis.com>
 <CANNYZj__Gud2xeWrtK=tZaY_BGQ2d4tVVJLfZt4R0aqzUadK-A@mail.gmail.com>
 <c78bac9a0a53243336d237bc5f6d51758f5a5dfe.camel@linuxfoundation.org>
 <6dbf0e264c68433a8aee1a772015c852@axis.com>
 <1718C14CEB633922.9698@lists.openembedded.org>
 <CANNYZj_rRJFsnOcSrkONYfmkZdUe1eCZKYcvnkpPj7jm7eVu+g@mail.gmail.com>
 <faab0d74b95849bdb1d39ac0146dd523@axis.com>
 <CANNYZj_2+-GiZ4Qa67GJ3KFJMqFxLFXW6XKMtL+a9=NrPmi66A@mail.gmail.com>
 <77825785242f4d99b336af0da596e286@axis.com>
In-Reply-To: <77825785242f4d99b336af0da596e286@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 27 Sep 2022 21:58:25 +0200
Message-ID: 
 <CANNYZj81uAD1wMJyizCHTiwCnCnw_XMOLqPOzKGu0Og1sejauw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid
 paths for templates
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 19:58:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171130

On Tue, 27 Sept 2022 at 20:53, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> Since we obviously use our own distribution, I am limited in
> experience with other distributions. The one example I do know about,
> which I have mentioned before, is WindRiver. See line 831-835 in
> https://github.com/WindRiver-Labs/wrlinux-x/blob/WRLINUX_10_21_BASE/bin/setup.py
> for an example of where they do basically the same as what we do.

Yes, they have to fix this too. And not by replacing .templateconf
with TEMPLATECONF, but by writing a config directly, particularly
using available tooling to compose bblayers.conf. Templates are
intended for layers and version control, not as an extra intermediate
step when setting up builds - the goal is to standardize build
configuration management, and static templates is a starting point.

> I do not understand what the problem with .templateconf is? There is
> a use case for being able to specify a default TEMPLATECONF, and that
> is what .templateconf satisfies.

I'd say it does not satisfy the use case, as it relies on being next
to oe-init-build-env, which in turn requires custom scripting. Show
how to do this using standard tools in core/poky, write a patch for
the official documentation, and then you have a point.

> There are currently three ways to specify where the templates files
> are (in order of preference):
>
> 1) TEMPLATECONF=
> 2) templateconf.cfg
> 3) .templateconf
>
> In our case, the templates are always in the same location, thus we
> want to specify this as a default to give the developers a better
> user experience.

I get this, it is useful to make a pointer to a 'default' template
when you have a set of layers, but the tooling for managing a modified
.templateconf is absent. As things are, it is useful only as a
fallback to the default core/poky template.

And if you propose such tooling, it somehow has to avoid modifying any
of the layers after they have been fetched. 'repo' allows you to do
this, this doesn't mean it would be an acceptable thing to do in
general. I did think about it, and I don't have good or even workable
ideas.

> With the above three methods available, this is easy as we just set
> the default in the .templateconf file.
>
> Now, if we remove support for .templateconf, how are we going to do it
> instead? I can of course change our wrapper around oe-build-init-env
> to do TEMPLATECONF=${TEMPLATECONF:-path/to/our/templates} and this
> might seem fine at first. However, this means that the wrapper will
> always set TEMPLATECONF and thus templateconf.cfg looses its meaning,
> which to the user means that he must now always specify TEMPLATECONF=
> if he wants to set it to something other than the default where before
> he only had to specify it the first time he initializes a new build
> environment.

I'm not sure I understand this. If the build environment has been
initialized before from templates, values of TEMPLATECONF or
templateconf.cfg become irrelevant, as the files in build/conf/ are
already in place, and scripts will skip copying them over from
templates. So you can continue to *not* have to specify TEMPLATECONF
when you want to reuse an existing build directory without changing
anything in it.

First time:
TEMPLATECONF=path/to/template . oe-init-build-env (will copy from template)

Second+ time:
. oe-init-build-env (will detect that no copying is needed, regardless
of where the template is set to)

Can you describe the sequence of commands where the problem arises? If
there is a problem here I absolutely want to see it.

> What _I_ would prefer to see, is a way to specify that the build
> shall use the available layers. I.e., rather than a huge number of
> static templates configurations, I would like to see the
> initialization script take the layers as arguments, with the default
> being anything that matches meta* (or maybe more correctly, anything
> that has a conf/layers.conf file). As for the local.conf file, in
> my world, this would be made up from fragment files in the layers.
> So for any layer that ends up in the bblayers.conf file, the layer
> would be searched for any local.conf.XX files that would be
> concatenated together in the order of XX. This is (obviously) very
> similar to what we do today, so I am of course biased, but I think
> this model is a lot more appealing than static templates files.
> YMMV.

Yes, config fragments are the next step. Whether they be automatic
like you prefer, or manual ('oe-setup-build add systemd') or both is
to be determined.

Alex

