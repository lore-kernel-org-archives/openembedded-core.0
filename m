Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE72C83F17
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 10:29:49 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.58743.1753957781051807845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 03:29:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rprrf3c+;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-7077a1563b5so5492586d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 03:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753957780; x=1754562580; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AS0Ak7qW9vCmoJlTW4vw8+dGNVnD4ihGckDA8cDLWZY=;
        b=Rprrf3c+LhUQzKeil6HVu66pDJJUyATN04Xt9HkpU42PL0rvo1/n+fZYi6uDXV+0+C
         7NWGId25fhb8OQgHr/ufZnGpQ+DYzF/5oWSUISGL+lb5B5+ADNFesUt5/TAJESSmtiOz
         aWtTyQ/LWkPHSKsQ2uPbf5+8M2HfRQ/z59dn5IPnarFsOW9KDXf7G9gURy6Hy6zy+pYA
         0Ig+jw12GLIqRxv+h/6fz+qEFVpWYs6TfLRAWtdGNVvpF9VUymMovXb+yjSnFZ9FOBIN
         Uhbon/2n4Xo+BhtqJ+Eehpyuo67ZtzMbCEDsilXvHz4fQSr2wm7kU7vRMnt5UOhSzp4P
         LvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753957780; x=1754562580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS0Ak7qW9vCmoJlTW4vw8+dGNVnD4ihGckDA8cDLWZY=;
        b=uq6ZxffG8BmmSwLuUx2xj5xO3jm7wEpSPqGXT8aFGy04O3nsqGUq6oxOtq4M545Ynf
         P2iWBcOhxKDb47bj3ej9ZsswPjqpOtyH5FpYSCr4DM6IAFTJE1a0n0SRCyUyl61bRD9w
         iLubzXUZQONa+gmDxmRx+8Yk+52DKHp5T3j7q8nbswRK/2sAuxIBD6Si904PsTDR35Ih
         ffTaOWS89YQBUnaa/fKb/Tx4Gn0WZFaNFvY184JmU8tXXGlTHK2vK5iv8sGcuNMCxgfG
         4xfEH7TsU0gGzLHfOTB8lDdCkiPQXxK3tjtgkENT7eMhBo+MYorH50UIdthF7LDvW3ND
         Lt1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtnpM9sN5nVWh8Cud8qmGV2ClHlnFLX+56Ffa/MwqI/xTYeUJIYH42ky+TYrGpzfSorGrRRGNxMcvOt1wUDy+YKg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyFVV6tozu+NgleQ2zUlq6ZCSDV7ICwzY7GzY1QBkUqJGwSDWOt
	fdLDtlMD6y3SKLCeh9iq77g1+K+aORI00o1ZHdt3byEkooJcSF/F6fXQatx5AA10HJM5Hcj33Lb
	V7orbkXTmPYeCR4QWs0S4riee7SuDaHKggw==
X-Gm-Gg: ASbGncs2R+5YCUF+cc6mq8zjnMh501zEZofBYniY/YIKJcqKo/DlzPgjPsCst47C74m
	Nn5CXmjGRAyHMbHGD6GaqamPNbN8IZA9f9WyAKsvrlPtUq9xAeUbbigy4dLkPM0VOkgU1B4qGzO
	mOesM/W0AoesUBdSGepNT8D5ndqPwsLVQXwyQSdPiYcp4EQ21cYFboxMYxw+1fEbE+QM8G4mEO8
	MF8DeO7u93/m/5lXEH2TjSzToiuGQJ9lZRV7jz/fWAZF6n7XzAxJL/xAwvVRvU=
X-Google-Smtp-Source: AGHT+IE+HXASB2HYhzZdhatpuIk5plW3YLJ5Eoosppq3YoV3VYD1UZzC9EDXtv/7tX46DKh/Pp4v4lwFFT4GjplwUbk=
X-Received: by 2002:ad4:5de7:0:b0:704:f7d8:edfe with SMTP id
 6a1803df08f44-707674ba71cmr85313016d6.51.1753957779860; Thu, 31 Jul 2025
 03:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250730162112.67549-1-nikhilr5@kpit.com> <CAMKF1spu==k3jvfuxjqL2t0hD825BdieWqi1oZcN0_oNtxkfXA@mail.gmail.com>
 <MAZPR01MB89502A455B06BE7AACFF5D1BEE27A@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAZPR01MB89502A455B06BE7AACFF5D1BEE27A@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 31 Jul 2025 12:29:27 +0200
X-Gm-Features: Ac12FXyhoGyDaCr2X3VFX6zchzOkV-HSRn7VEPGxYGIQe4z-Fy8lAUbn2L9Xv4Y
Message-ID: <CANNYZj9sO+WtOZFxz-u2ZcQdzamtpzc58s=ZsYGav0Fa2kvjAA@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] cmake: Enable debugger support in CMake
To: nikhil.r@kpit.com
Cc: Khem Raj <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 10:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221191

The question was about whether this slows down build times of
cmake-driven components, not build time of cmake itself (which does
seem notably slower neverthless).

This probably should be a cmake PACKAGECONFIG, and off by default.

Alex

On Thu, 31 Jul 2025 at 12:25, Nikhil via lists.openembedded.org
<nikhil.r=3Dkpit.com@lists.openembedded.org> wrote:
>
> Hi Khem,
>
> Build time of cmake without Debugger support
> time : 8m9.082s
>
> Build time of cmake with Debugger support
> time: 8m35.592s
>
>
>  Regards,
>
>  Nikhil R
>
>  KPIT Technologies Limited
>
>
> ________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Wednesday, July 30, 2025 9:57 PM
> To: Nikhil R <Nikhil.R@kpit.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: Re: [OE-core][master][PATCH] cmake: Enable debugger support in C=
Make
>
> Caution: This email originated from outside of the KPIT. Do not click lin=
ks or open attachments unless you recognize the sender and know the content=
 is safe.
>
> On Wed, Jul 30, 2025 at 9:21=E2=80=AFAM Nikhil via lists.openembedded.org
> <nikhil.r=3Dkpit.com@lists.openembedded.org> wrote:
> >
> > Starting from CMake version 3.27 support for interactive debugging of C=
Make
> > scripts and configurations was added. However, by default the `nativesd=
k-cmake`
> > is compiled with debugger support turned off. This change enables it.
> >
> > Signed-off-by: Nikhil R <nikhilr5@kpit.com>
> > ---
> >  meta/recipes-devtools/cmake/cmake_4.0.3.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/cmake/cmake_4.0.3.bb b/meta/recipes-=
devtools/cmake/cmake_4.0.3.bb
> > index 7d8b8cac65..604e306667 100644
> > --- a/meta/recipes-devtools/cmake/cmake_4.0.3.bb
> > +++ b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
> > @@ -43,7 +43,7 @@ EXTRA_OECMAKE =3D " \
> >      -DKWSYS_CHAR_IS_SIGNED=3D1 \
> >      -DBUILD_CursesDialog=3D0 \
> >      -DKWSYS_LFS_WORKS=3D1 \
> > -    -DCMake_ENABLE_DEBUGGER=3D0 \
> > +    -DCMake_ENABLE_DEBUGGER=3D1 \
>
> Does it impact cmake execution time in some negative way ?
>
> >  "
> >
> >  do_install:append:class-nativesdk() {
> > --
> > 2.34.1
> >
> > This message contains information that may be privileged or confidentia=
l and is the property of the KPIT Technologies Ltd. It is intended only for=
 the person to whom it is addressed. If you are not the intended recipient,=
 you are not authorized to read, print, retain copy, disseminate, distribut=
e, or use this message or any part thereof. If you receive this message in =
error, please notify the sender immediately and delete all copies of this m=
essage. KPIT Technologies Ltd. does not accept any liability for virus infe=
cted mails.
> >
> >
> >
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221189): https://lists.openembedded.org/g/openembedde=
d-core/message/221189
> Mute This Topic: https://lists.openembedded.org/mt/114451722/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

