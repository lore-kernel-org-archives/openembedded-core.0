Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7727FD2FFF5
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 11:24:48 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.20083.1729250684114842680
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 04:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SQx1ub1d;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539e7e73740so1865837e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 04:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729250682; x=1729855482; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7rslwJXdwndj4nD3V8PjCvvrNnPHmviPn9OCh64jXc=;
        b=SQx1ub1d8Z370/LHESNHKosW5a1CrqLongt7ebbhvFuxdvlfXMpLREUzw6ABhvhMve
         yFRBcSI9WYfSef1/c4YQOiqMa7RnKgjs7fmVUnvh1fUI+bO+Irp1rv8TjdR7YR70zHKX
         yUmG+3Ei9pjodX8MBVR3aFzQd5OPQQTZHiWdazEYZV9Vmvo4zsKaGFV1x533+OqkuJox
         4rlWynChhycybS/ALj0PBVMG6MoYSge9oBBO6Jn6p+dngXJkwBLtrU0UwRgOj8A70YWO
         b19CeMVNkyMpfNPt7mDu/y4+1TrSF+aq/KpLlkrGXv2KiWpaWYJG7y8+Du3I4mZPTqOR
         0ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729250682; x=1729855482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7rslwJXdwndj4nD3V8PjCvvrNnPHmviPn9OCh64jXc=;
        b=EXKq69Mra8kFA1BJ9O2U09unINXD0dZxlvNkw9GB2+KmY0N62++Mn1HTUDMyKlgXXV
         +d4EsWwHHjr0YsSaE1jSUayXHvoFh9mhzlIkx/Pr9Gy8ldiXRAss/XRxXUWzgpr4zUcf
         UVgg4wH9uxGJ3lpxXNINixRSU9xkBw7IXt89PFe0AqWQ0Mc/cI4n2bpzfYYRHvl7UhQd
         SW9s7GuI37VyLJ9tT5jyM+YxAXmz8mmtscq9dSvequYqUGA4n4dGi4Kgqr97Rz+R4F+t
         kAmEOu7ylF7ShxkKY6cZ3CweA0kCT62JOpqQoi242VZjFlbxFGkYskifMjHMZrTwdJ0Y
         iNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsLOM/TZHOZMJjLdfXp9YzInY+weXfn/O05jDeu1BFEFDojonsTvV3do8GE/ERjV3SlunxfHxvCISpJSbHSHL1nA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy1IXzjd7YY++ukgHxrfZSqP/HIM5b1c3Ir+3jvlRs1ezLrTVSx
	xh9+xXnwaiRitSds7vaiBWoCJchRtM1foL9bP57BIffSFtiX4G/uaelWpLEEdJozf4Uv6fRIPgc
	4K6IrDT1Oe07dqwVY/7VAPJV/BNFIGQ==
X-Google-Smtp-Source: AGHT+IF3mt2/ycpoIp6m5NjTdmtb1a3HEezHrBKf2/joGTmkA+rEwcUOvxgytuzwIN5xB7bLvsfwQ9eApwPrSpvVjEI=
X-Received: by 2002:a05:6512:1596:b0:539:eb82:d453 with SMTP id
 2adb3069b0e04-53a154436d0mr1238043e87.39.1729250681861; Fri, 18 Oct 2024
 04:24:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241017095410.3475084-1-purushottam27.kumar@lge.com>
 <OF7E422025.EE8D56D7-ON48258BBA.003E5C60-48258BBA.003E5C60@lge.com>
 <CAMKF1sq5T1n2_Uwph5KAru9U_hRHzZAee=0HgYhBstRBOKfvfg@mail.gmail.com> <OF7E422025.EE8D56D7-ON48258BBA.003E5C60-48258BBA.003E5C64@lge.com>
In-Reply-To: <OF7E422025.EE8D56D7-ON48258BBA.003E5C60-48258BBA.003E5C64@lge.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 18 Oct 2024 13:24:30 +0200
Message-ID: <CANNYZj_V_HoEG=7uFcL_LUdNcacXadrXTz+TCZfF=uzjSdDqDg@mail.gmail.com>
Subject: Re: [OE-core] [styhead][PATCH v2] kmscube: Upgrade to latest revision
To: purushottam27.kumar@lge.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 11:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206057

Note that for stable branch backports you either need to provide a
changelog or a list of commits, or otherwise explain to the stable
branch maintainers why a version update is needed. Stable branches
accept only bug and security fixes.

Alex

On Fri, 18 Oct 2024 at 13:21, Purushottam Choudhary via
lists.openembedded.org
<purushottam27.kumar=3Dlge.com@lists.openembedded.org> wrote:
>
> Hi Khem,
>
> it needs to go into master first IMO and then backported, kmscube is a
> leaf package so perhaps less of a problem for backport but it will be
> good to mention what changes are coming in due to this srcrev bump,
> would make it easy for backport
>
> --> SRCREV bump for KMSCUBE was merged for master branch
> https://git.yoctoproject.org/poky/commit/?id=3D87be7fbf7a5a9730ea917c3831=
13411f7348c255.
>
> Doing backporting for styhead branch and I Will be sharing a new patchset=
 v3 with srcrev bump details.
>
> Thanks,
> Purushottam
>
> On Thu, Oct 17, 2024 at 2:54=E2=80=AFAM Purushottam Choudhary via
> lists.openembedded.org
> <purushottam27.kumar=3Dlge.com@lists.openembedded.org> wrote:
> >
> > Upgrade to the latest kmscube revision.
> >
> > Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>
> > ---
> >  meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipe=
s-graphics/kmscube/kmscube_git.bb
> > index 34d5a7d71d..01ea80a142 100644
> > --- a/meta/recipes-graphics/kmscube/kmscube_git.bb
> > +++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
> > @@ -10,7 +10,7 @@ DEPENDS =3D "virtual/libgles3 virtual/libgles2 virtua=
l/egl libdrm virtual/libgbm"
> >
> >  LIC_FILES_CHKSUM =3D "file://kmscube.c;beginline=3D1;endline=3D23;md5=
=3D8b309d4ee67b7315ff7381270dd631fb"
> >
> > -SRCREV =3D "467e86c5cbeb2a2051b31ce2c240d6ddf5bc3112"
> > +SRCREV =3D "b2f97f53e01e07a920761e5d3e3ba22898b794a4"
> >  SRC_URI =3D "git://gitlab.freedesktop.org/mesa/kmscube;branch=3Dmaster=
;protocol=3Dhttps \
> >             file://0001-cube-gears-Change-header-file-to-GLES3-gl3.h.pa=
tch \
> >             "
> >
> >
> >
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206056): https://lists.openembedded.org/g/openembedde=
d-core/message/206056
> Mute This Topic: https://lists.openembedded.org/mt/109060935/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

