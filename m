Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A350C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 17:39:50 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.60904.1697823584274533932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 10:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qVK5cqrn;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99c1c66876aso169412666b.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 10:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697823582; x=1698428382; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDdNe332u8Dh36wMkqPDq1Dy1yv1hg2gautsIEDn658=;
        b=qVK5cqrnCJqQgiYm6r21fTTN2Z8J6AsruwvljBgfvOps26GBgn0pz+2a4NOok+O5Bt
         elbvX6J47dlacbrb7gODAq1STfFxlRaWNPqyQJ8zWhrnMHw+549jrzu20PqbDdFNRLO/
         FNACIejP3QllwuLse2TZeALgI3zJFEaq8U5bELVJaD89M+pxXCOEd605SJoJqvVwaYXD
         tc8pfe/4WDG0tZlDbU7IHj7tkn2ovwtOCvTRtIBCfbXQJgmf6G1AS2WvK+JrB1wNpkAb
         sPWab4FCvk8VU+wZhEqYYDM57V/6aIiFlP+gNtVbLo44kOJdnaDvPLo0yjF3hNzMERDQ
         boYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697823582; x=1698428382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDdNe332u8Dh36wMkqPDq1Dy1yv1hg2gautsIEDn658=;
        b=ve/an43JN+Q1pRtbBp1kPi4tm0xYnh24oSgbkvE/0ClofkOvq6tWgqLPYQs2V4SZLc
         N/ZMXQXYJAKMl0TvjTc2SbB3N/IuCD+E5G00usSN+Yfk2Ifu1ADMpwKY8RpaHPpS0iut
         SAsxikPBO/l/D3H1MrNieAlXNqoDOvpztWeFMszAD8V7enQSjHeQa5TWRoPVz1jWc+Iy
         6W6TVPLXul/p12GzOLFa0GrvwkBbuSNH1MBYheTI1iHo+tBycX6sHsxIK256TUBkKSTS
         fjoxI8Ul6pNZLwkonKOlbxhXhIQrXu8/E5KWzN9JokvPQLCSuevEQdY3YCB91mDbYLak
         xChQ==
X-Gm-Message-State: AOJu0YzFHbfJ4TOdrwO9F1lqaX/Ze5k89tKM1RyWNvnodCaevdfjbDps
	w4L0J5P6CNC7K+Gw0DvXSuj1MU33/EkoXUp+MbkgCw==
X-Google-Smtp-Source: AGHT+IH/hkyoJAKjiHilDCowTcGycN+EA4xfqcQpaaAsIVtJVuz2mqO5S7/7/aO2NCxLbTKeEZFQVV0lZTBjuPY1icc=
X-Received: by 2002:a17:907:72d5:b0:9ae:695a:fed0 with SMTP id
 du21-20020a17090772d500b009ae695afed0mr2151986ejc.11.1697823582398; Fri, 20
 Oct 2023 10:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231019132843.2623456-1-sean@geanix.com> <CAOSpxdbvouz+syXkw7aOwCiui4qz6YUZiNPC0bJaZn2bn4xq_A@mail.gmail.com>
 <20231020192621.Horde.yuIspbaq8hJ9Q1lkSH9Rlbi@webmail.your-server.de>
In-Reply-To: <20231020192621.Horde.yuIspbaq8hJ9Q1lkSH9Rlbi@webmail.your-server.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 20 Oct 2023 07:39:31 -1000
Message-ID: <CAOSpxdZ3NxRLM-BvPRwMFoOOPxAx5sUBF2WF18NmNKSqPMDjTg@mail.gmail.com>
Subject: Re: [OE-core][mickledore][PATCH] weston: default to launcher-seatd
To: sean@geanix.com
Cc: alex@linutronix.de, kasper@krinvent.dk, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 17:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189578

On Fri, Oct 20, 2023 at 7:26=E2=80=AFAM <sean@geanix.com> wrote:
>
> Quoting Steve Sakoman <steve@sakoman.com>:
>
> > On Thu, Oct 19, 2023 at 3:28=E2=80=AFAM Sean Nyekjaer <sean@geanix.com>=
 wrote:
> >>
> >> Lets use the launcher-seatd as default, launcher-logind is "sometimes"
> >> failing to provide input events. Further more is the launcher-logind
> >> depricated in newer versions of weston.
> >
> > Changing behaviour is typically not allowed in stable branches.
> >
> > In any event, this change would need to go into the master branch
> > before it could be backported to stable branches. So please submit
> > this for the master branch!
> >
> > Steve
>
> Hi Steve,
>
> It is part of the master branch be7da75 =E2=80=9Cweston: update 11.0.1 - =
12.0.1=E2=80=9D

OK, then no need to submit for master :-)

I'm still not able to take this for mickledore though, since it would
cause a behaviour change for people already shipping product with
mickledore.

Steve

> >> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> >> ---
> >>  meta/recipes-graphics/wayland/weston_11.0.1.bb | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-graphics/wayland/weston_11.0.1.bb
> >> b/meta/recipes-graphics/wayland/weston_11.0.1.bb
> >> index 0838791a6b..09753e7c51 100644
> >> --- a/meta/recipes-graphics/wayland/weston_11.0.1.bb
> >> +++ b/meta/recipes-graphics/wayland/weston_11.0.1.bb
> >> @@ -37,7 +37,7 @@ PACKAGECONFIG ??=3D
> >> "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms wayla
> >>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11
> >> wayland', 'xwayland', '', d)} \
> >>                     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd
> >> x11', d)} \
> >>                     ${@bb.utils.contains_any('DISTRO_FEATURES',
> >> 'wayland x11', '', 'headless', d)} \
> >> -
> >> ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'sysvinit',
> >> 'launcher-libseat', '', d)} \
> >> +                   launcher-libseat \
> >>                     image-jpeg \
> >>                     screenshare \
> >>                     shell-desktop \
> >> @@ -71,7 +71,7 @@ PACKAGECONFIG[lcms] =3D
> >> "-Dcolor-management-lcms=3Dtrue,-Dcolor-management-lcms=3Dfals
> >>  # Weston with webp support
> >>  PACKAGECONFIG[webp] =3D "-Dimage-webp=3Dtrue,-Dimage-webp=3Dfalse,lib=
webp"
> >>  # Weston with systemd-login support
> >> -PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue
> >> -Dlauncher-logind=3Dtrue,-Dsystemd=3Dfalse
> >> -Dlauncher-logind=3Dfalse,systemd dbus"
> >> +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,system=
d dbus"
> >>  # Weston with Xwayland support (requires X11 and Wayland)
> >>  PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,lib=
xcb
> >> libxcursor xwayland"
> >>  # colord CMS support
> >> --
> >> 2.42.0
> >>
>
>
>

