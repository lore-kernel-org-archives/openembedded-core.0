Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75408C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 14:26:07 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.201688.1698330362784173391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 07:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IRuqwRbr;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7a67ebc2cb3so24825039f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698330362; x=1698935162; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R7WplkDzMBEom/1E6g+zeyGgLvzHz+SzoS0h9cnNgM=;
        b=IRuqwRbrrnQmIemER1f6tUNQ5YWX430x6PpdEWrwhGFHfLar0sM+lnlu4j4rheHtht
         OI9B34uRAcFFxej0HmSpUPPqGC5l9zh3ruq3nVheODTksMYT5lOCqN6b8CFV1Ssh0206
         YvzCZA7hOCZbm8ZwBfPxOrXWo8K+rvurqFc/9J/bsqTUSI4Fj5WiURa1fWl/pkuRz6h+
         zZ3vZ6KVVn2ossNVZJ26ytO8bBjz0jevgoFQyZ7beMjAnIPDCRXqobU5yaAWos6GkuWu
         u3gVFHSzVwd2hXsEev7HV3CHMNowRVaYycQJAW0qHzd9R0fQHWq0ElRURtiGBNurrXSC
         PD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698330362; x=1698935162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R7WplkDzMBEom/1E6g+zeyGgLvzHz+SzoS0h9cnNgM=;
        b=UfWaX9/nSjj1jEP2nf1ZWzGV8+QFoB+v5aQLRnAmKKoXfKTD+6pn8cU3wSjxy4tfsi
         E20hl8J99UxdmetCmtK02kiQeM+DXNePNc5yhGGzjHu0SB7GI1k3OYl3wFrpDVu8cZsY
         gRokSIIsTkUio/JMjGhdr88MBbfMBWsSW1lM7HVc/cjJQhxBRiNbkogHcgG60dxghjVT
         5s/IKPPN7LBqsikRe1FBE4f/pVma7hhBwvaU+M5nck8yqoUVXFaKgg70DH3Pj9LzlOFO
         iMc/CcWdWPp3ARiDjIDMXf5TFEL8kmq/ek67drsWSgzEs7H+IVSNgkiqBzQRBp/8G2xQ
         gn0A==
X-Gm-Message-State: AOJu0YzYofRafP40FCzwxWwtL+F5J0JbxTJEOs7zVwKJK7jr1a8JbUYx
	dNd47exgP7Y/EYTo+z0TZhgiER9l8tJ78lrX2+I=
X-Google-Smtp-Source: AGHT+IHmiKdwi5IclaOdUrLEgkNB5rPrapPJa2GLV9Qv2VIHKl7XOZur2DF0DOvgBYLoAteNrVQXEXvD5DJPGDeo3v8=
X-Received: by 2002:a05:6602:14d1:b0:787:1555:efca with SMTP id
 b17-20020a05660214d100b007871555efcamr22956377iow.5.1698330361960; Thu, 26
 Oct 2023 07:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231025223710.93502-1-wak@google.com> <CADkTA4OucgUogtX6tQ21oD6i1qQ+6qq1uJQG3S8NsChATTr3Ww@mail.gmail.com>
 <CAPnigK=VcgCH_gWUy2j3nXSngNXdc32y8FRKRiPSRU-bh57M5w@mail.gmail.com>
In-Reply-To: <CAPnigK=VcgCH_gWUy2j3nXSngNXdc32y8FRKRiPSRU-bh57M5w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 26 Oct 2023 10:25:51 -0400
Message-ID: <CADkTA4M90k1pt1Jc6SDLFYQyNgYqDoj_poC33t9byssx=HRP3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: Commit without running hooks
To: William Kennington <wak@google.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 14:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189729

On Thu, Oct 26, 2023 at 6:38=E2=80=AFAM William Kennington <wak@google.com>=
 wrote:
>
> On Wed, Oct 25, 2023 at 7:08=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
> >
> > On Wed, Oct 25, 2023 at 6:37=E2=80=AFPM William A. Kennington III via
> > lists.openembedded.org <wak=3Dgoogle.com@lists.openembedded.org> wrote:
> > >
> > > The hooks are pulled from the impure environment and are often broken=
 in
> > > our environments. There is no reason to add extra metadata or verify =
the
> > > commit message as its arbitrary to turn the tarball into a git repo.
> >
> > But what about the other uses of git ? If the hooks are broken during
> > the creation step, other uses of git should also be broken.
>
> The only time hooks are run is for `git commit`. AFAIK our build
> process has no other invocations of `git commit`. All other git
> operations work fine.

Right. There are a few others that you just aren't hitting. There's
the git option for patching (for any recipe), and also some use in the
kern-tools that you wouldn't see unless you are also patching or
doing merges as part of the kernel patch phase.

It would be nice to fix them all at the same time.

>
> >
> > We've had the ability to check the git config for quite some time, we
> > could take it further an inhibit the use of the host config if we are
> > worried about breakage like this.
>
> Maybe this would be the best idea overall for our git support inside
> the build system, avoiding the build user global git config. That
> probably solves the issue we generally have. I'm okay either way.
>

Agreed.

There's some complexity with git versions and the variables that
are available to inhibit local/host/system configuration, but really,
if we want to have isolated and reproducible builds, we should
provide our own configuration.

Richard: Does that sound reasonable to you ? If you want to fix
this immediate problem, i don't see any harm in the patch, but it
may just mask things and ensure we don't ever fix it fully.

William: could you raise a bugzilla (and assign it to me) about
git configuration from the user/system influencing our build ? That
would ensure we don't forget it completely :)

Bruce

> >
> > Bruce
> >
> > >
> > > Signed-off-by: William A. Kennington III <wak@google.com>
> > > ---
> > >  meta/classes-recipe/kernel-yocto.bbclass | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-=
recipe/kernel-yocto.bbclass
> > > index 4ac977b122..cb9cd26b09 100644
> > > --- a/meta/classes-recipe/kernel-yocto.bbclass
> > > +++ b/meta/classes-recipe/kernel-yocto.bbclass
> > > @@ -408,7 +408,7 @@ do_kernel_checkout() {
> > >                 git init
> > >                 check_git_config
> > >                 git add .
> > > -               git commit -q -m "baseline commit: creating repo for =
${PN}-${PV}"
> > > +               git commit -q -n -m "baseline commit: creating repo f=
or ${PN}-${PV}"
> > >                 git clean -d -f
> > >         fi
> > >
> > > --
> > > 2.42.0.820.g83a721a137-goog
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#189694): https://lists.openembedded.org/g/openemb=
edded-core/message/189694
> > > Mute This Topic: https://lists.openembedded.org/mt/102189231/1050810
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [bruce.ashfield@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

