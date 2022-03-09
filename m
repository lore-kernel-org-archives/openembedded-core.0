Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FEA0C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:56:45 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web08.277.1646845004365680223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DDtZf2MM;
 spf=pass (domain: gmail.com, ip: 209.85.217.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id u124so3009989vsb.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fM0QP3i3K2rJjdNY7SlS4m40iuk759rIBZ2YRJF2o7M=;
        b=DDtZf2MMUpKs9Kxr4RTPuNnRYtN2Rv66II+p/njKlpyLQNth1OvhIpi78tmbRjU5pl
         ASEJd3OHdbH4DgzZBHSOMbAZB3Ca1RXVVMmyw9bPvY6pR55/tx6L2u35kuAqFBdcv41n
         Hybw+51Cd0Dew5wOONgor69zBqYNEb+Czu1bgka9UNPKg5bz/jRQdZ05Voc6FPLad5SU
         TUVrrdNZPtxOhh6W1jUKridOgB0nEsCoS4jGyVN5CRZ/NGHLsz6LoOsSK8QpAEx3LiKf
         TPeyHN7UCsk2gssc3y2F/cSUXUQ7dvBxuZvkSWxTGJ+F6zF7tCX4NPe7V/iCd0mByg0f
         snbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fM0QP3i3K2rJjdNY7SlS4m40iuk759rIBZ2YRJF2o7M=;
        b=cgsHb7Fea1bl/y8091pF3IPtWKJ4RdyVI9yPHZ/uPg6rkWJEyG4JElyWepQKCaOrV+
         7eguxLpmhyz1SOGmg1jfQ2QXMWFd9OXkde225PJUhvBhrRPdzcYgWj2qCIoueK1MAgyi
         Q/GrRKLKL8OJOJYAPBny1PsZxfph0DFjDwH0CJsFoRjlY2Lva+MlEnraqRTqoPpcbmTU
         KIUqjZ2fICB3F2u0wjeMWDBVogn4ivJFhT9whGmvCnojvIw/7m0rL1JEIWsFUM+sEIQu
         fMSWs2qp2JhLk2wJU/qe3loK1sNh/1Kq53ni/gOUJMr8/NiRW/yaNiw0dOjTQtYQeCF9
         YWJA==
X-Gm-Message-State: AOAM5307IIxkEfjlV2T+KH476tpdjLR+u/h4yADcqLD3GmuO9yVGoGAz
	zSlnKq+OuOyW1bmZlmJb2WfP/tWOFvlra89NG74=
X-Google-Smtp-Source: 
 ABdhPJzv12skffW2Nc8Rjz3gryCwiCWtZWXBopS/Sda7hBPUGoqmkPUkBVHe6bqrNXhTebBGLjWy+kQrpLWjmNo6Qsg=
X-Received: by 2002:a05:6102:4405:b0:320:a07a:1c4c with SMTP id
 df5-20020a056102440500b00320a07a1c4cmr176216vsb.42.1646845003428; Wed, 09 Mar
 2022 08:56:43 -0800 (PST)
MIME-Version: 1.0
References: <20220309011830.3130440-1-raj.khem@gmail.com>
 <16DAA19DB5E87A22.14238@lists.openembedded.org>
 <CANNYZj-=3wf4HUAP6yTUQBg+qo07XwjxkbN9k=Dqgu9MiCuZTg@mail.gmail.com>
 <CAMKF1spQTOqd2pH3pdgvXVBaQ1jvQKLBDey3EE1HCumwOLym5Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spQTOqd2pH3pdgvXVBaQ1jvQKLBDey3EE1HCumwOLym5Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Mar 2022 17:56:32 +0100
Message-ID: 
 <CANNYZj8dH8yBfAbtRT0rc2NRsatQ3igVJxN_yuaVWBQ20w_Mfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Fix build when x11 is not in distro
 features
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 16:56:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162978

Can you add this to the commit message please?

Alex

On Wed, 9 Mar 2022 at 17:47, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Mar 8, 2022 at 10:38 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Also, what error specifically are you seeing? How is your build set up?
> >
>
> There is use of MESA_EGL_NO_X11_HEADERS which is now renamed in newer hea=
ders to
> EGL_NO_X11 from mesa/khronos headers, however this define is
> relatively new and 3D stacks do not have this adopted but apps
> like qemu and bunch of others depend on it, I guess they assume mesa.
> One can argue that its better to fix the 3D stacks to behave
> like mesa but this means every BSP using these stacks will need to
> carry such a fix.
>
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/include/EGL/eglplatf=
orm.h
>
> > Alex
> >
> > On Wed 9. Mar 2022 at 7.11, Alexander Kanavin via lists.openembedded.or=
g <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> Why is this issue not seen on autobuilder=E2=80=99s no-x11 job?
> >>
> >> Alex
> >>
> >> On Wed 9. Mar 2022 at 2.18, Khem Raj <raj.khem@gmail.com> wrote:
> >>>
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ---
> >>>  meta/recipes-devtools/qemu/qemu_6.2.0.bb | 2 ++
> >>>  1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-=
devtools/qemu/qemu_6.2.0.bb
> >>> index 062ed32b015..c7eef0a9d5e 100644
> >>> --- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> >>> +++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> >>> @@ -6,6 +6,8 @@ DEPENDS =3D "glib-2.0 zlib pixman bison-native ninja-=
native meson-native"
> >>>
> >>>  DEPENDS:append:libc-musl =3D " libucontext"
> >>>
> >>> +CFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DE=
GL_NO_X11=3D1', d)}"
> >>> +
> >>>  RDEPENDS:${PN}:class-target +=3D "bash"
> >>>
> >>>  EXTRA_OECONF:append:class-target =3D " --target-list=3D${@get_qemu_t=
arget_list(d)}"
> >>> --
> >>> 2.35.1
> >>>
> >>>
> >>>
> >>>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#162947): https://lists.openembedded.org/g/openembe=
dded-core/message/162947
> >> Mute This Topic: https://lists.openembedded.org/mt/89652908/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

