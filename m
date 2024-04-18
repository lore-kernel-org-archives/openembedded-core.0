Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95836C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 16:45:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.3812.1713458746778798543
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 09:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EphylG4o;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-343d7ff2350so752622f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713458745; x=1714063545; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SD8mDLGYTZawMVyswmiKTjGGBV9LRevAcwsAmlWrZ4=;
        b=EphylG4osSLC1Yvad+rLr1sQxM7LtRqftJKuxQv980O0AbKFJOwcWScrdXgCgCo9km
         mAoD9ZR3yUR3ZUrZd9g6UNqJxVi2gLAj7q9o97c7sXaWjXdBpmcGiOl0jhLRm4y4J39D
         CX7rvHFeXIgDPncBPRipijazrM+YIZjX5PgqkxxcIIiXfT8MpAcG3yhp65at5Ca0koN4
         n8xHFfDzh+K6ecqnHgvHOpXUfZEmz/NdcXSGj+2xCQ3tEsXky9KPhme/CmY34MtbbDgN
         D7GZmMc2VfkOGD2fdM7bFMqI6qO8Bz50YkZvDRMONKwQEZZzxoc41ZFmgZ2Zp2/Ps9xa
         WdQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713458745; x=1714063545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SD8mDLGYTZawMVyswmiKTjGGBV9LRevAcwsAmlWrZ4=;
        b=w0tyE4da7tY/BiUo8klo6tRzY/8aToT0o3DY835cPNpdBQr+vqN+W1rITwcbBXsg+x
         EjSVTgcCQVo4BiqpMqtwWq7IYQQormgl4BrXPBKWszjMNPBJCg/6BLJh+/uHBJMHjV7x
         sQ6GAgGzkfQLcMJFGA0ep4c8fm27EXh2wN0ZuXViNUZsdUa9nzetzibN4IPVLW7wJTd1
         AMsy7BnzcEtdqR4l1cS7dhQBhgGH90padHUOGDUm7JFn5boPe7oxTF505NWtdQaFMDZn
         PGpt3YGqoyVZF64g2CVMEoXnutfEFe/a/2QoOvA0+zbou4ZP5ux3xdEF2t2i3JKZ0RUL
         XvGg==
X-Gm-Message-State: AOJu0YypSjEjkBphfrkXbxfndQgaPhXVI/qZ4rVTjLQl1KSNMadsHGuT
	bkAiQCw2jLOTWUIAa8sj8JUF3pUjrE7kGMCyypyQTTkMyHPMVLrG+0RNa/PUHuGH+xtB9QedgUK
	82baz5YO5l1+dUrlIc9fvoodFMyQ=
X-Google-Smtp-Source: AGHT+IHxPCvMw68UmXw1aqhSCAB5piHWFZYJKgt0MCWMYyXQ6D0aJ5w9epVu+e2Tp6u/lZ2FUTGkujc6AR/vXEhW2h8=
X-Received: by 2002:a5d:4b8d:0:b0:34a:3fea:f92a with SMTP id
 b13-20020a5d4b8d000000b0034a3feaf92amr305529wrt.46.1713458744903; Thu, 18 Apr
 2024 09:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240417222826.3549176-1-jdmason@kudzu.us> <CA+chaQdwCJSSZ9vXw0VgbsWAMuRxt2F8St9Qz8d6GkNuKHy2+w@mail.gmail.com>
 <CAPoiz9zPh2eX4-QDA2FznB2R5iGQO1tb24UAB-NbvkLH28og7g@mail.gmail.com>
In-Reply-To: <CAPoiz9zPh2eX4-QDA2FznB2R5iGQO1tb24UAB-NbvkLH28og7g@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Apr 2024 18:45:31 +0200
Message-ID: <CA+chaQcwNOLEdit5+Pr0LdbBGJNV-0Zotk0Jm2emSn6BRUcXSw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] liba52: update SRC_URI
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 16:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198521

Have you tried:
https://sources.yoctoproject.org/mirror/sources/a52dec-0.7.4.tar.gz
that has the old caa9f5bc44232dc8aeea773fea56be80
?

https://sourceforge.net/projects/liba52/files/a52dec-0.7.4.tar.gz
returns just HTML to me with md5sum c9fe0eb75b290358b3948b58e9f10baa:

$ head a52dec-0.7.4.tar.gz
<!doctype html>

<html class=3D"no-js" lang=3D"en">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" />
<meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D1.=
0,
user-scalable=3Dno" />
<script src=3D"//a.fsdn.com/con/js/min/sf.sandiego-cmp-top.js?1713452475"><=
/script>
<link rel=3D"stylesheet"
href=3D"//a.fsdn.com/con/css/sftheme/sandiego/cmp.css?1713452475">
<script>
        window.bizx.cmp.init({


Which might pass do_fetch task, but won't work well in do_unpack :).

On Thu, Apr 18, 2024 at 3:35=E2=80=AFPM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Thu, Apr 18, 2024 at 1:57=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > What is the difference between the tarballs that it requires checksum u=
pdate?
>
> No idea, since I could not get the original tarballs because the
> previous link doesn't work.  But given the comment on the other patch,
> this recipe is being dropped anyway.  So..<shrug>
>
> Thanks,
> Jon
>
> >
> > On Thu, Apr 18, 2024 at 12:28=E2=80=AFAM Jon Mason via lists.openembedd=
ed.org
> > <jdmason=3Dkudzu.us@lists.openembedded.org> wrote:
> > >
> > > The former SRC_URI was no longer working.  Update to one that is.  Th=
is
> > > required updating the md5sum and sha256sum.  NOTE: SOURCEFORGE_MIRROR
> > > (https://downloads.sourceforge.net) does not appear to be working for
> > > liba52.
> > >
> > > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > > ---
> > >  meta/recipes-multimedia/liba52/liba52_0.7.4.bb | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/re=
cipes-multimedia/liba52/liba52_0.7.4.bb
> > > index 7a3b4a43c8d4..684dd590ca15 100644
> > > --- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
> > > +++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
> > > @@ -10,11 +10,11 @@ SECTION =3D "libs"
> > >
> > >  inherit autotools
> > >
> > > -SRC_URI =3D "http://liba52.sourceforge.net/files/a52dec-${PV}.tar.gz=
 \
> > > +SRC_URI =3D "https://sourceforge.net/projects/liba52/files/a52dec-${=
PV}.tar.gz \
> > >             file://buildcleanup.patch"
> > >
> > > -SRC_URI[md5sum] =3D "caa9f5bc44232dc8aeea773fea56be80"
> > > -SRC_URI[sha256sum] =3D "a21d724ab3b3933330194353687df82c475b5dfb9975=
13eef4c25de6c865ec33"
> > > +SRC_URI[md5sum] =3D "1a2e77b4f7aacd858961a6b727710551"
> > > +SRC_URI[sha256sum] =3D "c1931bc511dc48987fdba6888be577f3035e3f0b6b81=
d3ea3e766fca8d18e128"
> > >
> > >  UPSTREAM_CHECK_URI =3D "http://liba52.sourceforge.net/downloads.html=
"
> > >
> > > --
> > > 2.30.2
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#198488): https://lists.openembedded.org/g/openemb=
edded-core/message/198488
> > > Mute This Topic: https://lists.openembedded.org/mt/105587757/3617156
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [martin.jansa@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

