Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B78C19F32
	for <webhook@archiver.kernel.org>; Sun,  2 Mar 2025 13:13:08 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.29801.1740921177494106344
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Mar 2025 05:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WvaipMZa;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5452e6f2999so3779340e87.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Mar 2025 05:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740921175; x=1741525975; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZsuvuFsT6AAUxHwTG9xmke+VTF8JF/CMnsBnaU7EzA=;
        b=WvaipMZaXKJH5BSedGfj8ppwv1gy2VPy66KaFTivhrZ/CJA+3/g5zPHbV9PekfvBvK
         UrQqSm+YiTGJXwvT3DF2/URwUGLlITW+Sw94tNRYsQnu341yx2smuMfUFz2RVu+mwink
         HcRN3SJkynvhzcKJokA7MSG0Ziy4MiGcNr5Hw2UdLSMRWNevynvUF54xK8UYOgdI0WX3
         5i333yIyZHJSdLVWKb8BKu/i6wTuiQ9qz8/TUk+Pz+vUwA8YxyVY6PLtju6IgdzTOOhC
         rO+Ov8MIXR6S4cHURDYGHq/kEEE3sV7kamch7W/5tMLpwr2oCNL95noQbn5Zm3h2LNzI
         n7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740921175; x=1741525975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZsuvuFsT6AAUxHwTG9xmke+VTF8JF/CMnsBnaU7EzA=;
        b=Gjv3liZ6PlFvJhqI4jOkcmoAZxKO6UCLhbXD3a8KhnCX6byZu4yvspkrXFmr59m19f
         1PnRVKjU/5JB0r6DgB3Vx6gJvT6n4VI/bRuRMtqCWV9mlTWNzE9U+OPxujxczVamm4WN
         ZzCKylNV5zpnyIJNNXTgNjQbe7mX6SRB+AJNMcdN6t0ieFnhodC0Oj19Uo211qXxkJbT
         JRnTyBEBvhDkw7b/14MeIcPtR1OFc2Z7Gp4CkmP9A1TVdvMFHhDPjd4TW5WVpzEwULb+
         k5eoz/Wsf7CjJtPfoHIIlzg+NPFAXj7ySoRwTIPx0wFaz/OUWIOeTUfmWwpBLN2a4b0x
         HEBQ==
X-Gm-Message-State: AOJu0YwwPDyCSGuomf9ukaM1xyZo1DuoCOngidoM1pxldhY7zfO2Ndof
	E2yc4ep66h/8Lwg4DD/HkyH9Lxs4ndyEyAYZvRPBhFMa5Ej4uEJNem0zJSI3WsgJ9dbf7RP2zol
	4eDTtP16wxJs62pIUu3ER4vT26Fo=
X-Gm-Gg: ASbGnctrDZOG/foDtGQtmIv7CmkLpj5vmRLHEoNib/Ly4UpHSntSLUGEjqfRgta34A0
	DpB4Vo4hU8/+9fTkiwUi/qNB337+4XH8OAPSC4TjErmuekUlbQh5LexM3y8w8JZuIVVYzZNB7rK
	kFEGtojkqKVSC8FM0Q86pGlUvGKFdBfevJSl9Y5M8Ux6V1+x+Awbox0RE=
X-Google-Smtp-Source: AGHT+IGc1l9GLKx0RYFr/npinU5zv0Zmd1K+GnZ8Wgp7oK6VHBS1O4co3tEkm9WQHCNjpoz94hX5/XmyRZDLWFRs+6w=
X-Received: by 2002:a05:6512:3b8d:b0:545:1082:918d with SMTP id
 2adb3069b0e04-5494c380777mr3784316e87.41.1740921175110; Sun, 02 Mar 2025
 05:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20250302074334.1775-1-alex.kiernan@gmail.com> <169badfc1a6ee7e24975610a4166c58353a81667.camel@linuxfoundation.org>
In-Reply-To: <169badfc1a6ee7e24975610a4166c58353a81667.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 2 Mar 2025 13:12:43 +0000
X-Gm-Features: AQ5f1JopCo0jlv3h4KXbP6YpWMX2vBQYoEW_PgnmTHN6JPvasaDxjBXrRwhpKGA
Message-ID: <CAO5Uq5RQhqMUG37ZT1up8rsz0dz5h+kAFw5myb8X7xqu=9Tqhg@mail.gmail.com>
Subject: Re: [OE-Core] boost: Use PN/BPN for naming of packages
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Mar 2025 13:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212193

On Sun, Mar 2, 2025 at 12:34=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2025-03-02 at 07:43 +0000, Alex Kiernan via lists.openembedded.or=
g wrote:
> > boost-test and boost-serialization were hardcoded, switch to the ${PN} =
form.
> > Also lookup ${BPN} when generating split package names. With these chan=
ges,
> > generating an explicitly versioned boost package (e.g. "boost-1.82") al=
ongside
> > the main boost package ("boost") can be done by copying/renaming the ol=
der
> > recipe. This is useful when upstream code hasn't yet been ported to new=
er
> > boost and an older version is required.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >  meta/recipes-support/boost/boost.inc | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-suppor=
t/boost/boost.inc
> > index 77105aa1fa13..458dfa9ac2fb 100644
> > --- a/meta/recipes-support/boost/boost.inc
> > +++ b/meta/recipes-support/boost/boost.inc
> > @@ -69,7 +69,7 @@ python __anonymous () {
> >      mlprefix =3D d.getVar("MLPREFIX")
> >      for lib in d.getVar('BOOST_LIBS').split():
> >          extras.append("--with-%s" % lib)
> > -        pkg =3D "boost-%s" % (lib.replace("_", "-"))
> > +        pkg =3D "%s-%s" % (d.getVar("BPN"), lib.replace("_", "-"))
> >          if "-native" in pn:
> >              pkg =3D pkg + "-native"
> >          packages.append(mlprefix + pkg)
> > @@ -86,9 +86,9 @@ python __anonymous () {
> >  FILES:${PN}-graph_parallel =3D "${libdir}/libboost_graph_parallel.so.*=
"
> >  FILES:${PN}-locale =3D "${libdir}/libboost_locale.so.*"
> >  FILES:${PN}-mpi =3D "${libdir}/mpi.so ${libdir}/libboost_mpi*.so.*"
> > -FILES:boost-serialization =3D "${libdir}/libboost_serialization*.so.* =
\
> > +FILES:${PN}-serialization =3D "${libdir}/libboost_serialization*.so.* =
\
> >       ${libdir}/libboost_wserialization*.so.*"
> > -FILES:boost-test =3D "${libdir}/libboost_prg_exec_monitor*.so.* \
> > +FILES:${PN}-test =3D "${libdir}/libboost_prg_exec_monitor*.so.* \
> >       ${libdir}/libboost_unit_test_framework*.so.*"
> >
> >  # -dev last to pick up the remaining stuff
> >
>
> Sounds like a reasonable idea but:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/1097
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/1025
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/1097
>

Looks like multilib, which I'm not building locally :| Will have a look.

--=20
Alex Kiernan

