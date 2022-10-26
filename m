Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3316AC433FE
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 18:01:45 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.10944.1666807297833187350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 11:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gqg0PtWb;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id o12so30336463lfq.9
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 11:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FJup/wYWPb23wc1bjVh5LP9OxGRNzMppCFGlA4ra5b4=;
        b=gqg0PtWbSIr4oHGWTnom4e6HhWNzPboTAoRSDj9hJoKPyV6oOPGI5bRzbSpBDdQjbg
         wMXeCk1MdExKOtTpoo7NoKtrbwy6FgIzF//yki2qgOC+1ydP2EG2pRFC9R9XrOckwg72
         Km1xnBTsqRzzsw5V1GH8kJTmBiNVDhZ35oNVPRZWxkNzdJXrSvY1hYrzAWgiYaX7pj15
         p//K19zPHbtNXYvkkLHOWB55Jb4ZmSo1dqmhL37NN0l9i4Ppj2csBTN7jR/Qusw59gcf
         26H2h4UM1qR6etKfEKpnqVDhZje+smjTvoNFVdzNjuNyB25S8tqoPjn1RATgGw7oGxFt
         DJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJup/wYWPb23wc1bjVh5LP9OxGRNzMppCFGlA4ra5b4=;
        b=7+nzJbXSfpV+Xud3d9hNDdFqaUiUYoWC5DC7WyI0M9Jo7Eknz9O+Z7lP+H6ojEkgK9
         5RlWepzElji8xKMffmyHV6mowMSmuheuP7iTyfMkMce5nT6tnsE/6HMcp0dOvDtn8/5e
         QWgcqmaedc4te9c15TPm2K8GsWOhLHzZAR8ecuyZ7xR1QJCjO4pajAg3AJvRXbo/3RRt
         mKtiNnp59iZWd1qOqCdAsHUlXUUYpz1X5YPhHN5yB9wRLAEwsLXLHH0ofukCr5mHG+wh
         oV4SAiemuuiwG7aIRPzHom08gYbMeP6ZalM/NuBOsbx+vaVvo2XuAmMVkh2hntFkafmt
         UApQ==
X-Gm-Message-State: ACrzQf3pRLMDZ8+HThhxAMh7rBZE6y94q6sWfZ1KzoRrbjSzJS1k+4wi
	4cYIf8DCSSnJoXj/8AykrT9Rf7ALmK6aeZ0ZI78=
X-Google-Smtp-Source: AMsMyM75eAhIDwdsNv6NhsUYF3+4W0fVGbHfeFM0vLlyAJge0+RWGqLp13Hni5FMi90Y6hOIGHrNM87l5q/3sNmWjdQ=
X-Received: by 2002:ac2:51bc:0:b0:4a4:712d:1b83 with SMTP id
 f28-20020ac251bc000000b004a4712d1b83mr15866085lfk.345.1666807295941; Wed, 26
 Oct 2022 11:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221018230820.2385167-1-raj.khem@gmail.com> <CANNYZj-r7G4y3ma8NkrgmKm-vgoXjvMEWYAUh=bOE0z80DrxkA@mail.gmail.com>
 <CAMKF1srnBDVj5ig2ZF_fX+-UZ5jtp0U89uG8qE5cuW1SjX0AfQ@mail.gmail.com>
 <171F65F5948858B5.6129@lists.openembedded.org> <CANNYZj89RTk6=-tqK550uDvUb3nZ1bfR=H1=Ns2pw5WaiPZ_Tw@mail.gmail.com>
 <78322791-72e6-75fd-f870-1f2eb7d8e4f6@kernel.crashing.org>
 <CANNYZj_KT77PhQtPd3gTT4J9RWZNnY0UgvH_PmOZXNs+yewM6Q@mail.gmail.com>
 <4070adb4-bfb0-9d96-2193-c8f8386383e9@kernel.crashing.org> <CAJdd5GbBEdmT4sk=UKdn+FUv5yVRT+tCppCBUpZip8rH06_niw@mail.gmail.com>
In-Reply-To: <CAJdd5GbBEdmT4sk=UKdn+FUv5yVRT+tCppCBUpZip8rH06_niw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 26 Oct 2022 20:01:24 +0200
Message-ID: <CANNYZj9ag_2nUdZZjxbZpR4zOPCi8v7EK8kQ9jiddTJEYTYR9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: Add native patch via a variable
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>, Ross Burton <ross.burton@arm.com>, 
	Khem Raj <raj.khem@gmail.com>, Kai Kang <kai.kang@windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 18:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172168

Is there a combination of libmali recipe and mesa-gl somewhere public
so we could try to pick it apart and see what links to where?

My (perhaps confused) understanding is similar to Joshua's: 'gl' is
basically 'opengl in x11' or 'opengl rendered to memory', and if a
system uses neither, then it is not needed.

Alex

On Wed, 26 Oct 2022 at 19:48, Joshua Watt <jpewhacker@gmail.com> wrote:
>
> On Wed, Oct 26, 2022 at 12:21 PM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
> >
> >
> >
> > On 10/26/22 11:03 AM, Alexander Kanavin wrote:
> > > On Wed, 26 Oct 2022 at 16:35, Mark Hatle <mark.hatle@kernel.crashing.org> wrote:
> > >> (I just saw this, so a little late on the reply, but..)
> > >>
> > >> mesa-gl is ABSOLUTELY still being used.  It's needed for libmali usage.  Not
> > >> everyone wants to use lima support for graphics.
> > >>
> > >> It was broken into two separate packages so that is was VERY clear if you were
> > >> using mesa for 'everything' (mesa), or mesa JUST for 'gl' (not gles).
> > >
> > > Okay, I'm not going to propose this, but can you clarify, what is the
> > > current use for 'gl'? Is it just opengl 3d in standalone x server
> > > based systems (which is slowly dying), or is there something else to
> > > it?
>
> Are you specifically talking about libmali with the following statements?
>
> I would say that in general libmali is probably not doing things in
> the "normal" way if so, although I'm not trying to say that it isn't a
> legitimate way to do it.
>
> >
> > Anything that needs "OpenGL", i.e. Wayland/Weston, X11, Chromium, etc etc etc.
> > These all end up linking to a combination of libmali and mesa-gl.
>
> In general (maybe not for libmali) Wayland and Weston themselves don't
> use OpenGL, or mesa-gl. Individual clients may be able to use it,
> although it's rare in my (incomplete) experience. Most of the OpenGL
> users in Wayland/Weston are going through XWayland/X11 and using GLX.
>
> >
> > Pretty much anything that depends on 'virtual/gl' (vs virtual/libgles1,2,3).
> > libmali provides virtual/libgles1 and virtual/libgles2 and a few other things
> > that meta-gl doesn't.
> >
> > libmali also doesn't include the DRM/DRI parts.  This comes from mesa-gl.
>
> In general, DRM/DRI doesn't come from mesa-gl. libdrm is its own
> recipe, and libgbm comes from mesa proper, or from some other
> dedicated vendor specific libgbm recipe.
>
>
> If this is sidetracking the discussion please ignore; I'm just a
> little confused by the above statements because either A) libmali is
> really weird B) my understanding of things is _way_ off, or C) the
> statements aren't quite correct.
>
> >
> > --Mark
> >
> > > Alex
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#172165): https://lists.openembedded.org/g/openembedded-core/message/172165
> > Mute This Topic: https://lists.openembedded.org/mt/94420106/3616693
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

