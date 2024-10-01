Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA611CE7D06
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 09:46:28 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.77519.1727775984348167036
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 02:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZtNyVFJe;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53997328633so2628736e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 02:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727775982; x=1728380782; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oMFzae4xr2FwosPCgnqrzB9+giEcCGfoYz9IZnUotns=;
        b=ZtNyVFJeHM79gEXrQGoBuElejveZdjHF35ObZs4ue6MJWAjqFwjLmIMcyjAS7zw7es
         F+4fKGB8fw0IK+0ziju0GXTgDEd2LDtfXs1bqK4NrDIxLrXZfYAfDx0XM4unSeJebXcR
         wMoMm9Hf/7mSTR9c454LWSHalE0gbwj5O+G9f0EPnJd/U0bPmjdmtOzIfHoI/LtPhRVd
         OIxJ/JF5GuN0gYYZbJFL1J4Fk+eGP2yMOA8A6GgxY+zMgZ2Ck8N4Ou1TuaFD/ufJ0pRV
         ipQ3+z2ZM+1ZpkvqgPWDSpH7iLtfKVgC8o8VqBpKLPsWjKfXTEgawN6CgAYu8NJZj+1V
         jeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727775982; x=1728380782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMFzae4xr2FwosPCgnqrzB9+giEcCGfoYz9IZnUotns=;
        b=vYuckoPTbnoF1vBezIwMqaaoRmObgoiLQjlL8oRSGQPBP4/ZFNasm0zowDSzrZ4w3n
         lHsVx+XAmZ4mgASUvsDdeBsS5v0niHBldYtamXFNXXVhJpxGYMe/8+IcjcBD3+lM9GZi
         PPtu97h0faqHP8kFB+HAmAjfJcLY6c5m/wO+c4DSpcdd1st01xfwdN6qR6J/wxbCVioN
         HM9NpKOj51PVeVz5UyWVAKya92n6ID4diCjBNRX5FFCXZUNT07MqPQL/URy/aouvlosx
         OkEajhGLlLK/tGc+hXXBjtylt85NCYqRQCPTm97KhJDyJjwJ3fHz4TroAmoZUD4cNydK
         yEww==
X-Forwarded-Encrypted: i=1; AJvYcCVUVEDoxxtPTvobAAG2+g4PCRPidXthdP9F7j0DxjC0pvJL3785oYkhvwKRX8rYm72mm0nnWXGcsD37OBXStLhueg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxWg8QgL2J+2k+cXsCQtfsbqm1YShq1UfyTCop+nMykybkkDzXY
	zjkN9gpRJ7ghNjMd892mYdCs2KW1ykDyT+GbdUP8JdxtLm7EnVeHJe7p83U+SH4pjweUV1ADDf/
	XC+4bnnzQkkEW9Pmsn8Bg631kLZw=
X-Google-Smtp-Source: AGHT+IHJa8NdXIxTmBSj5q+Fc6qjG6ryKDwG6EIAUDb5SDZig8pAO/wRVTcVmmFuA5CeLkDfsxUHxnl37ZM7QuwOwPU=
X-Received: by 2002:a05:6512:3996:b0:539:8f68:e036 with SMTP id
 2adb3069b0e04-5398f68e084mr5547581e87.34.1727775982238; Tue, 01 Oct 2024
 02:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240930091015.21148-1-yoann.congal@smile.fr> <CANNYZj8uwvjD3kLRP_YmsriveP_1kjWQpFzwTRfnoQoU8w5rrA@mail.gmail.com>
 <f6f743c9-89ea-4831-a03c-7b88fa403489@smile.fr> <CANNYZj8gk8W-dB2SEq+pJN0vxXkOR2KsH0AiLROK5FKxAi43YA@mail.gmail.com>
 <0e31030d839492e72dbbd06506e8d279fa8f0284.camel@linuxfoundation.org>
In-Reply-To: <0e31030d839492e72dbbd06506e8d279fa8f0284.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Oct 2024 11:46:10 +0200
Message-ID: <CANNYZj-JaL92BA-6wmZibVMFBTC691OXvw-AsavYddyMERqg+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] reproducibility: continue testing in case of
 build failure
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 09:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205154

On Tue, 1 Oct 2024 at 11:38, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > > The problem I'm trying to solve here is the reproducibility of
> > > meta-openembedded. While oe-core world is always buildable, this
> > > is, sadly, not the case for meta-openembedded layers. In order to
> > > move forward with its reproducibility, we need to know the
> > > reproducibility state of as much packages as possible.
> > >
> > > Do you think that goal is worth making the code more complex? Do
> > > you have a suggestion on how to approach this? Making (and keeping)
> > > meta-oe build every time is the goal, but history shows that it is
> > > hard [0].
> > > [0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155
> >
> > The real problem is that meta-oe isn't built in lockstep with oe-core
> > changes, and regressions slip in all the time, and are fixed after
> > the
> > fact through heroic efforts of Khem and others.
> >
> > Maybe the new AB setup will allow including meta-oe builds into a-
> > full?
>
> That pushes the problem to me and the core maintainers as we then have
> to block until meta-oe is fixed as well with all the tracking and push
> back on patches that involves. Is that really what we want to do?

I'm ok with handling a failing build, if v2 is possible and looks more
maintainable than v1.

Alex

