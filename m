Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD5DC48BC4
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 03:01:59 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.11958.1708225314898313370
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Feb 2024 19:01:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oq8F8g4d;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-214410e969cso1864969fac.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Feb 2024 19:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708225314; x=1708830114; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTWch8PdPvAxFKMAkMwUzlXuPXY8gEKajNHhtw6gdpI=;
        b=Oq8F8g4d7k3c47iNAhNoDjN4sEa3JhWWyhzFxfWpIqj8sfhzyxjRbiqOIRqjYVit5W
         qsre0TaEMxAIUJallkZ35JuyHR9RjA/gJZklLpmYzJEES/vH8QLBsLdPz1pLPVI6ggKq
         VH4sCJBMT7uDpU76Ltt/jAwmGQ2ewDlLZtcEdCuHLOcHkEGGFtjn7BjSdNxbTiKVfXbs
         4wMohxrDE6/bZ5PZYhiK8I+MzlZWjpS7Rl+2Ro6yCJrK6/I6+UEBiFX3H6W7XdzckZ0K
         LXfXgKzi8s4iYJp3Cwu3j1nmhb+REpt/zlSPe7rQkMSzbVw4XDIXFkVPQzqIiOYqK7at
         NTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708225314; x=1708830114;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTWch8PdPvAxFKMAkMwUzlXuPXY8gEKajNHhtw6gdpI=;
        b=YMm5no222K9gav0UEc/pFxKf8yxOS7J/9zBWjffW6k5d4TKu3kso8fBnbjEUL9vvuq
         i+6G9cM7fL25SEviWpcahy8Sy9BJXAUNqor1Owmm7LDKdsLJCPe3cCQC1pppRhLCTpTq
         54O87QWx740D8VddlC/7Yh9X8Ja38J8bSJNOXIcHPxzBtgCnQwyLiaH1XsTIW0aWXI8U
         fS4BDrHPROW60YlongV9lKgLoXrkx90vfsnqFgWgxTruI3AKr2GA2afewh2A6+iMyhvL
         HEGtLW71vHhdi/lyBJazx/rsFPNnAdN55seCECIAS2UuXwMpN54Ym8mQlNwP8VjP4TYz
         Bl3w==
X-Forwarded-Encrypted: i=1; AJvYcCVYBQ0XovuAKKLOauJ/EN/xIsRQaMM17byZvd3vFkHEhw3ydHAm/OVrvzOnLY0BKvM8/DfiCAQKm635eGlGTS0iQBL3ReXsXVqyGJL1Bz9KrIZOxdUd/MYS
X-Gm-Message-State: AOJu0Yyz4+jYm1s9qLyxzl/56URnxV2KWydIKcLA+H3jNep7aap2xA/G
	xVKESaanXrjoAevgLG8531SJYHNvAJRDpPd2UAGuQIUAWqazlCI1VAlPavcbDzGrFGuJ64puzDT
	FS5t5jLNHm5faLkEw1wtk/iZ+9cU=
X-Google-Smtp-Source: AGHT+IGxVzvyUAUfHd6XERWWMYqi4uP7T0ZXblaeZx7VRunN6SOw3m8OtzXvVz5fDt8hGkCRDkVYen/hhqaOsiDX1PM=
X-Received: by 2002:a05:6870:2c87:b0:21e:bc6d:fcb3 with SMTP id
 oh7-20020a0568702c8700b0021ebc6dfcb3mr227137oab.5.1708225314059; Sat, 17 Feb
 2024 19:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20240216114034.109257-1-anuj.mittal@intel.com>
 <20240216114034.109257-7-anuj.mittal@intel.com> <33de869a-1a09-41c9-be4b-6de1d0c29417@gmail.com>
In-Reply-To: <33de869a-1a09-41c9-be4b-6de1d0c29417@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 17 Feb 2024 19:01:27 -0800
Message-ID: <CAMKF1sqQAXDDbrQA8QOvYvgrkxEjOp=MiJBeWdz8=wo6BpyFeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/9] swig: upgrade 4.1.1 -> 4.2.0
To: Anuj Mittal <anuj.mittal@intel.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 03:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195820

here is one failure due to this upgrade -
https://errors.yoctoproject.org/Errors/Details/753587/

On Fri, Feb 16, 2024 at 6:59=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> this can be tricky for many apps depend on it subtly might fail. Perhaps
> doing an extended world build with this might be good.
>
> On 2/16/24 3:40 AM, Anuj Mittal wrote:
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > ---
> >   ...self-exe-for-swig-swiglib-on-non-Win32-plat.patch | 10 ++++++----
> >   ...configure-use-pkg-config-for-pcre-detection.patch |  6 +++---
> >   meta/recipes-devtools/swig/swig/determinism.patch    | 12 +++++++++++=
-
> >   .../swig/{swig_4.1.1.bb =3D> swig_4.2.0.bb}            |  2 +-
> >   4 files changed, 21 insertions(+), 9 deletions(-)
> >   rename meta/recipes-devtools/swig/{swig_4.1.1.bb =3D> swig_4.2.0.bb} =
(72%)
> >
> > diff --git a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for=
-swig-swiglib-on-non-Win32-plat.patch b/meta/recipes-devtools/swig/swig/000=
1-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch
> > index f27f80ea184..9c6ae389be2 100644
> > --- a/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-s=
wiglib-on-non-Win32-plat.patch
> > +++ b/meta/recipes-devtools/swig/swig/0001-Use-proc-self-exe-for-swig-s=
wiglib-on-non-Win32-plat.patch
> > @@ -1,4 +1,4 @@
> > -From a4a0440a644c6c5e5da096efe3cf05ba309a284f Mon Sep 17 00:00:00 2001
> > +From ab0ab5e685bd9077c44fdca5c1a27b0f477444d7 Mon Sep 17 00:00:00 2001
> >   From: "NODA, Kai" <nodakai@gmail.com>
> >   Date: Sun, 22 Apr 2012 17:01:02 +0900
> >   Subject: [PATCH] Use /proc/self/exe for "swig -swiglib" on non-Win32
> > @@ -10,9 +10,11 @@ Upstream-Status: Submitted
> >   http://sourceforge.net/mailarchive/message.php?msg_id=3D29179733
> >
> >   ---
> > - Source/Modules/main.cxx |   24 ++++++++++++++++++++++--
> > + Source/Modules/main.cxx | 24 ++++++++++++++++++++++--
> >    1 file changed, 22 insertions(+), 2 deletions(-)
> >
> > +diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
> > +index 8a44921..8250dee 100644
> >   --- a/Source/Modules/main.cxx
> >   +++ b/Source/Modules/main.cxx
> >   @@ -25,6 +25,11 @@
> > @@ -27,7 +29,7 @@ http://sourceforge.net/mailarchive/message.php?msg_id=
=3D29179733
> >
> >    // Global variables
> >
> > -@@ -934,9 +939,9 @@ int SWIG_main(int argc, char *argv[], co
> > +@@ -886,9 +891,9 @@ int SWIG_main(int argc, char *argv[], const Target=
LanguageModule *tlm) {
> >
> >      // Check for SWIG_LIB environment variable
> >      if ((c =3D getenv("SWIG_LIB")) =3D=3D (char *) 0) {
> > @@ -38,7 +40,7 @@ http://sourceforge.net/mailarchive/message.php?msg_id=
=3D29179733
> >        if (!(GetModuleFileName(0, buf, MAX_PATH) =3D=3D 0 || (p =3D str=
rchr(buf, '\\')) =3D=3D 0)) {
> >          *(p + 1) =3D '\0';
> >          SwigLib =3D NewStringf("%sLib", buf); // Native windows instal=
lation path
> > -@@ -946,7 +951,22 @@ int SWIG_main(int argc, char *argv[], co
> > +@@ -898,7 +903,22 @@ int SWIG_main(int argc, char *argv[], const Targe=
tLanguageModule *tlm) {
> >        if (Len(SWIG_LIB_WIN_UNIX) > 0)
> >          SwigLibWinUnix =3D NewString(SWIG_LIB_WIN_UNIX); // Unix insta=
llation path using a drive letter (for msys/mingw)
> >    #else
> > diff --git a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-con=
fig-for-pcre-detection.patch b/meta/recipes-devtools/swig/swig/0001-configu=
re-use-pkg-config-for-pcre-detection.patch
> > index cfcbd8c73ae..9e16caecca1 100644
> > --- a/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for=
-pcre-detection.patch
> > +++ b/meta/recipes-devtools/swig/swig/0001-configure-use-pkg-config-for=
-pcre-detection.patch
> > @@ -1,4 +1,4 @@
> > -From ffb785ed8d3cac3c28e014b1238d93e2bc1f0c01 Mon Sep 17 00:00:00 2001
> > +From 57a15651b46a0f1f84a4dd15d67d104fbfbe3f6e Mon Sep 17 00:00:00 2001
> >   From: Koen Kooi <koen.kooi@linaro.org>
> >   Date: Tue, 17 Jun 2014 08:18:17 +0200
> >   Subject: [PATCH] configure: use pkg-config for pcre detection
> > @@ -11,10 +11,10 @@ Upstream-Status: Pending
> >    1 file changed, 7 insertions(+), 32 deletions(-)
> >
> >   diff --git a/configure.ac b/configure.ac
> > -index f88004a..3a2b47c 100644
> > +index c060028..a330266 100644
> >   --- a/configure.ac
> >   +++ b/configure.ac
> > -@@ -57,39 +57,14 @@ AC_MSG_RESULT([$with_pcre])
> > +@@ -49,39 +49,14 @@ AC_MSG_RESULT([$with_pcre])
> >
> >    dnl To make configuring easier, check for a locally built PCRE using=
 the Tools/pcre-build.sh script
> >    if test x"${with_pcre}" =3D xyes ; then
> > diff --git a/meta/recipes-devtools/swig/swig/determinism.patch b/meta/r=
ecipes-devtools/swig/swig/determinism.patch
> > index 84c399182a4..417f0c43178 100644
> > --- a/meta/recipes-devtools/swig/swig/determinism.patch
> > +++ b/meta/recipes-devtools/swig/swig/determinism.patch
> > @@ -1,13 +1,23 @@
> > +From 25bf9893ec1f557781eb241508ea1bec959061fe Mon Sep 17 00:00:00 2001
> > +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > +Date: Mon, 1 Mar 2021 00:11:10 +0000
> > +Subject: [PATCH] swig: Fix reproducibility issue
> > +
> >   Remove the compiler commandline/platform from the compiled binary as =
this
> >   breaks reproducibilty.
> >
> >   Upstream-Status: Inappropriate [OE reproducibiity fix upstream unlike=
ly to take]
> >   RP 2021/3/1
> >
> > +---
> > + Source/Modules/main.cxx | 1 -
> > + 1 file changed, 1 deletion(-)
> >
> > +diff --git a/Source/Modules/main.cxx b/Source/Modules/main.cxx
> > +index 8250dee..415761d 100644
> >   --- a/Source/Modules/main.cxx
> >   +++ b/Source/Modules/main.cxx
> > -@@ -642,7 +642,6 @@ static void getoptions(int argc, char *a
> > +@@ -629,7 +629,6 @@ static void getoptions(int argc, char *argv[]) {
> >       }
> >          } else if (strcmp(argv[i], "-version") =3D=3D 0) {
> >       fprintf(stdout, "\nSWIG Version %s\n", Swig_package_version());
> > diff --git a/meta/recipes-devtools/swig/swig_4.1.1.bb b/meta/recipes-de=
vtools/swig/swig_4.2.0.bb
> > similarity index 72%
> > rename from meta/recipes-devtools/swig/swig_4.1.1.bb
> > rename to meta/recipes-devtools/swig/swig_4.2.0.bb
> > index b9e01752993..2ab4ed006c6 100644
> > --- a/meta/recipes-devtools/swig/swig_4.1.1.bb
> > +++ b/meta/recipes-devtools/swig/swig_4.2.0.bb
> > @@ -4,4 +4,4 @@ SRC_URI +=3D "file://0001-Use-proc-self-exe-for-swig-sw=
iglib-on-non-Win32-plat.pat
> >               file://0001-configure-use-pkg-config-for-pcre-detection.p=
atch \
> >               file://determinism.patch \
> >              "
> > -SRC_URI[sha256sum] =3D "2af08aced8fcd65cdb5cc62426768914bedc735b1c2503=
25203716f78e39ac9b"
> > +SRC_URI[sha256sum] =3D "261ca2d7589e260762817b912c075831572b72ff271794=
2f75b3e51244829c97"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#195754): https://lists.openembedded.org/g/openembed=
ded-core/message/195754
> > Mute This Topic: https://lists.openembedded.org/mt/104390933/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

