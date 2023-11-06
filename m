Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F25C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 15:33:11 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.56973.1699284788101097457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 07:33:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QIrlFRFj;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7a94a3b0a49so167544439f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 07:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699284787; x=1699889587; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnC2dPCqv9wFBpbbGwPFbdiWmJbjK4EUPuaQSU4CytI=;
        b=QIrlFRFjqTnWaueJXoUwQ65YGKdYErCKOMJr+ZSW8UmTUkPAA8FSpYrz4a/JlqgpQ4
         Wbw5VbIU+col8fizRXyg9zGqdsTmZFLRE9pS/v1ytglDXtX7yY3Dy8yudl6KH9KtjPP4
         sLL/Rd6zGuJrMOnwBaioaaS3g8wtuWJFCgUJgx9VgL0BOodAeXw05WMhJNW1GT3dWnr8
         a9fqaZ0xw28umVPNMo1lI3Znop6UkqV8/LeI7Q0qNa5jZBiUjdHgwyDgkh/W/tqG2hz8
         I+6xUSo/SD4hRFHtMgUtYc5HoeTkk2k490N1ZTEa0p09wzMedqqsMt1q9ADeGLiOfhRG
         PBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699284787; x=1699889587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OnC2dPCqv9wFBpbbGwPFbdiWmJbjK4EUPuaQSU4CytI=;
        b=Wv20HRpakSB+kD7JelqBHkdrieOf8SUgtoirCUYQO1IWAzKxqw6a0Bo8xa6MoYUo1t
         Fc7o315oWKjkYk3R6QBqCUhcjuBR5rAKK6v1YP3GxaZpgXf96P+gM3vTNzc127ltctni
         evI280ZXmb16FdQC2DIgYcClbgmz4Q0oDvqAalwCOx1VLqS6Gq2kmpNMSPvZRc7dH/Nt
         ugLFiw9W9oZqCumo7JFt7TyoY8RvO2Wcfgrumo2RrhkMG1ID/RhBzFhDWnqPrJ2+LDBm
         Z2sZ3nVjO3GwlPgFEXJ2F8BnCtGy0N+JmEQPnzf+2E8GgoMHkgfOnnrdZmltV0WSwb7U
         3R7A==
X-Gm-Message-State: AOJu0Yw/ve48GPCZ71zB5aRqo4S7ZVIOQq4htaSmHYwh4L1SPWbzTf//
	s/71x0Hzcqun1sWNxv9JBgTJ7oY03HA+jKE+u+A=
X-Google-Smtp-Source: AGHT+IGfWnK4DGVFcppHZmVTYgMlFuWkzLXED4JuVniA0aNb/EgtYyGFf8wUEF1+HI1mJgNx02K7RM3q8/uF0Y6+cKU=
X-Received: by 2002:a05:6602:3f88:b0:78b:b892:e334 with SMTP id
 fb8-20020a0566023f8800b0078bb892e334mr40119027iob.11.1699284787206; Mon, 06
 Nov 2023 07:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20231106142217.3837516-1-rasmus.villemoes@prevas.dk>
 <CADkTA4OsEXpRsULAkvx0cbFvdH2xVPW3JGuG2FcJ43OZyakBzQ@mail.gmail.com> <9a9a2845-68f0-45b2-b934-5e8438361670@prevas.dk>
In-Reply-To: <9a9a2845-68f0-45b2-b934-5e8438361670@prevas.dk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 6 Nov 2023 10:32:55 -0500
Message-ID: <CADkTA4MhXMqu+G6q+_Dk-ySfAsp-un0A+Y57dQmz9LRpR=bm8A@mail.gmail.com>
Subject: Re: [PATCH] perf: add jevents PACKAGECONFIG item
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: openembedded-core@lists.openembedded.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 15:33:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190230

On Mon, Nov 6, 2023 at 10:15=E2=80=AFAM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> On 06/11/2023 15.49, Bruce Ashfield wrote:
> > On Mon, Nov 6, 2023 at 9:22=E2=80=AFAM Rasmus Villemoes
> > <rasmus.villemoes@prevas.dk> wrote:
> >>
> >> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> >>
> >> Building for an arm64 target, e.g. qemuarm64 or a raspberrypi3,
> >> without "python" in PACKAGECONFIG, results in
> >>
> >> | Makefile.config:892: *** ERROR: No python interpreter needed for jev=
ents generation. Install python or build with NO_JEVENTS=3D1..  Stop.
> >>
> >> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> >> ---
> >>  meta/recipes-kernel/perf/perf.bb | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/pe=
rf/perf.bb
> >> index a392166e73..37b53ee7df 100644
> >> --- a/meta/recipes-kernel/perf/perf.bb
> >> +++ b/meta/recipes-kernel/perf/perf.bb
> >> @@ -28,6 +28,7 @@ PACKAGECONFIG[audit] =3D ",NO_LIBAUDIT=3D1,audit"
> >>  PACKAGECONFIG[manpages] =3D ",,xmlto-native asciidoc-native"
> >>  PACKAGECONFIG[cap] =3D ",,libcap"
> >>  PACKAGECONFIG[libtraceevent] =3D ",NO_LIBTRACEEVENT=3D1,libtraceevent=
"
> >> +PACKAGECONFIG[jevents] =3D ",NO_JEVENTS=3D1,python3-native"
> >
> > Since we already have a python packageconfig and it takes care of
> > the dependencies that we need, we shouldn't be repeating the python3-na=
tive
> > in this one. We'll end up having to maintain that dependency in
> > two locations.
> >
> > i.e. we don't have python3-native as a dependency of our main python
> > packageconfig .. is that an error (the python packageconfig) or should
> > this be depending on python3 python3-setuptools-native, just like the
> > python one ?
>
> The two are as I understand it entirely unrelated. The existing python
> knob controls whether some stuff that requires python at runtime is
> built/installed (and that build may of course itself require some native
> python, in this case in the guise of setuptools-native).
>
> The jevents stuff is purely about generating some tables [as a .c file]
> at build time, and that requires native python, but does not impose a
> dependency on python on target.

Fair enough. So it is definitely a host-side feature.

A comment above the packageconfig explaining that would
be ideal. In a perfect world, all of our packageconfig options
would have a docstring along with them .. since it is easy
to lose track of things.

>
> > Since there's no way to make packageconfig 'a' depend on
> > packageconfig 'b' that I know of (RP will correct me if I'm missing
> > or forgetting something here), we could always add a test on the
> > final PACKAGECONFIG and error/warn if jevents was enabled and
> > python wasn't.
>
> I don't think it's correct to force jevents pc to include python pc, as
> the latter will make the perf binary pull in the whole python
> interpreter etc.
>
> If feature A depends on foo-native and foo and bar, and feature B
> requires foo-native, I don't see why one should be forced to enable
> feature A in order to get B. [Conversely, even if the dependencies of
> feature A today happen to be a superset of those of feature B, I don't
> think selecting feature A should automatically imply feature B.]

I don't disagree with that logic, but you went too far with it  .. since
it was based solely on my first comment about it being target
python.  If there actually are dependent features, I'd always argue
for having a dependency versus duplicating the details, but that
isn't the case here.

Bruce

>
> > It is always a bit annoying that perf turns these on, and we have
> > to explicitly opt-out .. but that is out of our control :)
>
> Indeed.
>
> Rasmus
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

