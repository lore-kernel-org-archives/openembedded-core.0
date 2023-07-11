Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615BCEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 19:01:38 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.4507.1689102095735926103
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 12:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=O1TREDj+;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3457a3ada84so30683855ab.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 12:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689102095; x=1691694095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=St9PnKWt3aMDzZS/tKXlVqdBbGBHIWfzEFVwgrtxwCU=;
        b=O1TREDj+j2LII7xS16jmbqPXwjnpsX29mbpJhraQmNNMM0hmT8v7Y8tETybkvMwtOQ
         ceMLAmguv1DZpGL4pdXmU6VC5fppyw40WD341WMC0l8bPbJhXgPPnfxpoDSrCvWhMRhv
         1iCApR1nTyR2d6C3IvAeYKmrRpD4cwgBjr9zF3/qYloyyW0cv32tgLrANRzWUpk8KcXt
         vYszsMcQdiv1TqKBXnAZHTyRCfSkWmYTIl80DkNbmUvyV7llW3i8s4/jzoulgJoCjb6k
         cTMQ+54b5CPAxL8hUUuTu86ZerNYxaaBtwf3CUQzmDESaVf4Z9qA/bKjrl5IYCTReEHc
         DdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689102095; x=1691694095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=St9PnKWt3aMDzZS/tKXlVqdBbGBHIWfzEFVwgrtxwCU=;
        b=TMmoirKviMqXp4oFNTH7CPGLaqyjH8QbpSYUcgBVncwTAmtk2awRFnyEqsOfL5h5n0
         zqN7/4P0X6QBd/0+/u8KcK92jAbKs2GTA8hKRpjL9Rg4y3J2T8e+a81Rl1llwCRYI+B8
         S4RjBxN+2uPuiLe8GjOEVL6akrT7NsZKf4KIv6b5aFbxoxELPdJ4IaZzTwe9KwZvQsmw
         TDZT+ZbEmZUPrsG9crbD3XJD2WCeEPvSCpNrtr1+qEhCWj++sshX4ZoMUk67Hv2jNAZ6
         hAMqdHAtXCxslERloRSaOU45WInnnH0o94E30Tqx52FpRA6p7dXXbzMbFQlsI+v9ujHu
         D+sg==
X-Gm-Message-State: ABy/qLb+M06+6ZKdZEMO/4+49xgPvnqqUbZkC4nFRjmReEVyW4AcOOe7
	KrCieKAEb+Maa9DSQhPD5BeT4/mDdFoxpVxfDio=
X-Google-Smtp-Source: APBJJlFcZobMiQvcQMNiSc44bGwYWoWSC9mNI5Gm+P1hO7xuWR/JMduXsY+AUyHAxP3XE4S0eF8u7VDcxKfLEPxwsiw=
X-Received: by 2002:a92:d988:0:b0:346:6487:57e6 with SMTP id
 r8-20020a92d988000000b00346648757e6mr5135822iln.6.1689102094832; Tue, 11 Jul
 2023 12:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230711011104.2807078-1-tgamblin@baylibre.com>
 <CADkTA4O0K8jxWJb-_7-ijdCzPVc7KcCw75xUYtUxa+4HGjZkMw@mail.gmail.com> <9b60f438-79e7-2b70-3c45-7b78530d284e@baylibre.com>
In-Reply-To: <9b60f438-79e7-2b70-3c45-7b78530d284e@baylibre.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Jul 2023 15:01:24 -0400
Message-ID: <CADkTA4OoJqjcSknLg1+mpoJr-ferg1wb8neCYfnF_ZcthrjzGg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/3] python3-pylibfdt: add recipe
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 19:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184152

On Tue, Jul 11, 2023 at 2:24=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:
>
>
> On 2023-07-10 21:26, Bruce Ashfield wrote:
> > On Mon, Jul 10, 2023 at 9:11=E2=80=AFPM Trevor Gamblin <tgamblin@baylib=
re.com> wrote:
> >> This is required by python3-dtschema (already in oe-core) and
> >> likely some other modules, so add the recipe.
> > We are now on the 3rd (or 4th) iteration of attempts to add this.
> >
> > Rather than re-hashing the discussion, I suggest searching the mailing
> > list for libfdt.
> >
> > The summary is:  the pypi version is not up to date, and this python
> > library should be built out of the dtc repository and provided that
> > way.
>
> Thanks for the heads-up, I hadn't seen the others. I noticed that you
> have python3-dtc in meta-virtualization and that seems to cover
> python3-dtschema's needs. Will it be an issue for meta-virt if I move
> that to oe-core?

That shouldn't be a problem. It is there to support lopper, which we use in=
 Xen
and some other SDK configurations.

I can't recall if there were arch issues, or other gaps in the
support, but that is
something that should pop up quickly.

As for the patch against libfdt in meta-virt, in theory it may not be
required, but
even if it is, I can bbappend it back in the layer.

Bruce

>
> Trevor
>
> >
> > Bruce
> >
> >> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> >> ---
> >>   .../python/python3-pylibfdt_1.6.1.bb             | 16 ++++++++++++++=
++
> >>   1 file changed, 16 insertions(+)
> >>   create mode 100644 meta/recipes-devtools/python/python3-pylibfdt_1.6=
.1.bb
> >>
> >> diff --git a/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb b/=
meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
> >> new file mode 100644
> >> index 0000000000..9dd01a1449
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
> >> @@ -0,0 +1,16 @@
> >> +SUMMARY =3D "Python binding for libfdt"
> >> +HOMEPAGE =3D "https://pypi.org/project/pylibfdt/"
> >> +LICENSE =3D "BSD-2-Clause & GPL-2.0-or-later"
> >> +LIC_FILES_CHKSUM =3D "file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a42=
63 \
> >> +                    file://BSD-2-Clause;md5=3D5d6306d1b08f8df623178df=
d81880927"
> >> +
> >> +inherit pypi python_setuptools_build_meta
> >> +
> >> +PYPI_PACKAGE =3D "pylibfdt"
> >> +
> >> +SRC_URI[sha256sum] =3D "90c667c5adf44c6ab2f13bdc566598897784c7b781bed=
91064e7373bd270b778"
> >> +
> >> +BBCLASSEXTEND =3D "native nativesdk"
> >> +
> >> +DEPENDS +=3D "python3-setuptools-scm-native swig-native"
> >> +
> >> --
> >> 2.41.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#184109): https://lists.openembedded.org/g/openembe=
dded-core/message/184109
> >> Mute This Topic: https://lists.openembedded.org/mt/100070604/1050810
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

