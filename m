Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8AFC4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:54:07 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.18714.1714391645458619058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NUfDv+f+;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2dd6c160eaaso53398291fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714391643; x=1714996443; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bbiAAfCMDqTqgwV4fDIRpV5u2f40vU5JyA5rMJOYXE=;
        b=NUfDv+f+ZEr3U+xzwLfJtEwALsZIrZTgYiFW8o4a0lJI5HrFR7KG3G40lRYDEKsxd3
         Glr+9V3iBRsMaCaAQ0EkRta/DH0n1SLk+kX4KCJDyNR27+U98P6ruSAgBz4t2LLtnuO1
         qOLIx2jQ6P40fVmyq70aaWwZ4iJ31aC2peqvWM1Cm3XxzYo2TAA2Bn88lmfP9r7UsT4s
         zuzfekczmDLD3Y1iL5Uqi+S549X2xIPfWdsPTTGbM9PpUQgKkY0g6bgQzsDj41wTUjEs
         q2NuGDHvimCoaJwilBwzTuKboNX3YQDwx77l5AR0wnnP/3wgLNAM6w0bD28bSmd6dHMD
         D/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391643; x=1714996443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bbiAAfCMDqTqgwV4fDIRpV5u2f40vU5JyA5rMJOYXE=;
        b=r34jjIvHI5dzMONWAYcBuhFA7HMwpz5B5CkLvsX57D0fI20LO3rvb3ziX1KljfoQ3b
         +9qCGY01V3g4OsAZZ/NJSRJYyVowVAYnONcmqVAq3Us1UeU0UG+pE2GE+Z2cKbOSh6yX
         3CKHV79tpV0TGJZ0sK2H2UilnDr1Jrgv70l2lHelbij3hGtECQQqSB7LSrdnrfP7W9a+
         R1kFjSg6dYQ5VvonbsjFpCdyQ+KuwjpfiBAXkJbh0QBqO/WnJcIAisHFIkNsoMSqYrDU
         zDz9FN50WwVCgd4DwguGcje2PrWbRuQNu/uxF43qTrzuJlnm0W4SF9sMlQrnzP/a0YSB
         1g+Q==
X-Gm-Message-State: AOJu0YwYKf2Lygidjv/Zb7U9E9048Jn9wYgN+Pv55PfXC1MexyVPFsKp
	A6Zk1v0i++Q4MGHJINHFHajjENHWwbaUppqxSsbKNi1rLoTKNXIGVl1VR+8+0PPMDdSXDjDprzQ
	0fdFZzQcZCI/Ec1DlUc94+ZH33br6eA==
X-Google-Smtp-Source: AGHT+IExqzPwqibtG4xOgY0z6TYGSdCSPUqmaFqOg6hHOLbwe2GQOB+SsYyfdkhdCY7KiQkWXdjVylFhk3uL9dW4vzU=
X-Received: by 2002:a2e:9207:0:b0:2e0:4216:6fa8 with SMTP id
 k7-20020a2e9207000000b002e042166fa8mr2905259ljg.39.1714391643109; Mon, 29 Apr
 2024 04:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240423114115.932621-1-alex.kanavin@gmail.com>
 <20240423114115.932621-2-alex.kanavin@gmail.com> <CAMKF1soky9Oa0DNUz4v+Rt1zOgnbzp4E5PKjZNjA3Ps23zH1Gw@mail.gmail.com>
In-Reply-To: <CAMKF1soky9Oa0DNUz4v+Rt1zOgnbzp4E5PKjZNjA3Ps23zH1Gw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Apr 2024 13:53:51 +0200
Message-ID: <CANNYZj_Dg5Vax96yyd0305Eefd1+g04N42BOT4Uiu7Zawts1Dg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glib/gobject-introspection: update 2.78.4
 -> 2.80.0, 1.78.1 -> 1.80.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 11:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198736

I sent a fix for it.

Alex

On Sat, 27 Apr 2024 at 19:32, Khem Raj <raj.khem@gmail.com> wrote:
>
> this could be the reason for breaking build for gweather4
> https://errors.yoctoproject.org/Errors/Details/763702/
>
> On Tue, Apr 23, 2024 at 4:41=E2=80=AFAM Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > From: Alexander Kanavin <alex@linutronix.de>
> >
> > With these versions, which need to be updated in lockstep, upstream has
> > relocated glib introspection data from g-i tree to glib tree and made
> > its generation a part of the overall glib build. This creates a circula=
r
> > dependency, where g-i tools are linked with glib, but glib needs the to=
ols
> > to build its g-i data. (I don't know why the two source trees
> > couldn't be simply merged into one, or g-i data for glib couldn't be ge=
nerated
> > inside g-i build against sysroot glib).
> >
> > Upstream is suggesting building glib twice, first without building g-i =
data,
> > then building g-i and linking it with that version, then building
> > the final glib, and that's what is being done here (via the new
> > glib-initial recipe, which is sysroot-only, and is not pulled in
> > via indirect dependencies either).
> >
> > Other glib changes:
> > 0001-Do-not-write-bindir-into-pkg-config-files.patch restores
> > writing bindir variable into glib.pc file (meson only writes
> > it out if other variables depend on it, and this custom patch
> > removes that dependency).
> >
> > 0001-girepository-introspection-correctly-install-.gir-fi.patch
> > ensures correct installation of .gir into something else
> > than $datadir (useful in multilib).
> >
> > Merge previous glib .bb into .inc, so that glib and glib-initial
> > recipes could be cleanly separated with no duplication.
> >
> > Convert from gtk-doc to gi-docgen, and manpages from xmlto to
> > docutils.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |   1 +
> >  ...t-write-bindir-into-pkg-config-files.patch |  31 +-
> >  ...0001-Fix-DATADIRNAME-on-uclibc-Linux.patch |   2 +-
> >  ...-gio-querymodules-as-libexec_PROGRAM.patch |   6 +-
> >  ...ng-about-deprecated-paths-in-schemas.patch |   2 +-
> >  ...-correctly-when-building-with-mingw3.patch |  20 +-
> >  ...ces.c-comment-out-a-build-host-only-.patch |   4 +-
> >  ...rospection-correctly-install-.gir-fi.patch |  88 +++++
> >  ...on-Run-atomics-test-on-clang-as-well.patch |   6 +-
> >  ...ot-enable-pidfd-features-on-native-g.patch |   6 +-
> >  ...dcode-python-path-into-various-tools.patch |   4 +-
> >  .../{glib-2.0 =3D> files}/meson.cross.d/common  |   0
> >  .../meson.cross.d/common-glibc                |   0
> >  .../meson.cross.d/common-linux                |   0
> >  .../meson.cross.d/common-mingw                |   0
> >  .../meson.cross.d/common-musl                 |   0
> >  .../relocate-modules.patch                    |   8 +-
> >  .../glib-2.0/{glib-2.0 =3D> files}/run-ptest    |   0
> >  .../{glib-2.0 =3D> files}/skip-timeout.patch    |   7 +-
> >  .../glib-2.0/glib-2.0-initial_2.80.0.bb       |   5 +
> >  ...deprecated-distutils-module-to-the-p.patch |  34 --
> >  .../glib-2.0/glib-2.0/fix-regex.patch         |  54 ---
> >  .../glib-2.0/glib-2.0/memory-monitor.patch    | 361 ------------------
> >  meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb |  57 ---
> >  meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb |   1 +
> >  meta/recipes-core/glib-2.0/glib.inc           |  74 +++-
> >  ...pository-directory-for-native-builds.patch |  11 +-
> >  ...8.1.bb =3D> gobject-introspection_1.80.1.bb} |   8 +-
> >  28 files changed, 221 insertions(+), 569 deletions(-)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/0001-Do-not-wr=
ite-bindir-into-pkg-config-files.patch (68%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/0001-Fix-DATAD=
IRNAME-on-uclibc-Linux.patch (92%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/0001-Install-g=
io-querymodules-as-libexec_PROGRAM.patch (84%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/0001-Remove-th=
e-warning-about-deprecated-paths-in-schemas.patch (95%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/0001-Set-host_=
machine-correctly-when-building-with-mingw3.patch (80%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/0001-gio-tests=
-resources.c-comment-out-a-build-host-only-.patch (92%)
> >  create mode 100644 meta/recipes-core/glib-2.0/files/0001-girepository-=
introspection-correctly-install-.gir-fi.patch
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/0001-meson-Run=
-atomics-test-on-clang-as-well.patch (88%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/0001-meson.bui=
ld-do-not-enable-pidfd-features-on-native-g.patch (84%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/0010-Do-not-ha=
rdcode-python-path-into-various-tools.patch (93%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/meson.cross.d/=
common (100%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/meson.cross.d/=
common-glibc (100%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/meson.cross.d/=
common-linux (100%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/meson.cross.d/=
common-mingw (100%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/meson.cross.d/=
common-musl (100%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/relocate-modul=
es.patch (86%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/run-ptest (100=
%)
> >  rename meta/recipes-core/glib-2.0/{glib-2.0 =3D> files}/skip-timeout.p=
atch (90%)
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.=
bb
> >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-fro=
m-the-deprecated-distutils-module-to-the-p.patch
> >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
> >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.=
patch
> >  delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb
> >  rename meta/recipes-gnome/gobject-introspection/{gobject-introspection=
_1.78.1.bb =3D> gobject-introspection_1.80.1.bb} (96%)
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distr=
o/include/maintainers.inc
> > index 20eb3a04468..fbf2d4cc816 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -205,6 +205,7 @@ RECIPE_MAINTAINER:pn-gi-docgen =3D "Alexander Kanav=
in <alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER:pn-git =3D "Robert Yang <liezhi.yang@windriver.com>"
> >  RECIPE_MAINTAINER:pn-glew =3D "Anuj Mittal <anuj.mittal@intel.com>"
> >  RECIPE_MAINTAINER:pn-glib-2.0 =3D "Anuj Mittal <anuj.mittal@intel.com>=
"
> > +RECIPE_MAINTAINER:pn-glib-2.0-initial =3D "Anuj Mittal <anuj.mittal@in=
tel.com>"
> >  RECIPE_MAINTAINER:pn-glib-networking =3D "Anuj Mittal <anuj.mittal@int=
el.com>"
> >  RECIPE_MAINTAINER:pn-glibc =3D "Khem Raj <raj.khem@gmail.com>"
> >  RECIPE_MAINTAINER:pn-glibc-locale =3D "Khem Raj <raj.khem@gmail.com>"
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bind=
ir-into-pkg-config-files.patch b/meta/recipes-core/glib-2.0/files/0001-Do-n=
ot-write-bindir-into-pkg-config-files.patch
> > similarity index 68%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindi=
r-into-pkg-config-files.patch
> > rename to meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-int=
o-pkg-config-files.patch
> > index 8e6598fbef8..f6eba04fd4c 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Do-not-write-bindir-into=
-pkg-config-files.patch
> > +++ b/meta/recipes-core/glib-2.0/files/0001-Do-not-write-bindir-into-pk=
g-config-files.patch
> > @@ -1,26 +1,30 @@
> > -From e7077aa23bfcd31a8e72e39dc93ce4f854678376 Mon Sep 17 00:00:00 2001
> > +From 0561dcbf0918631d8106c3f6c2d8e92a5ec4b887 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Fri, 15 Feb 2019 11:17:27 +0100
> > -Subject: [PATCH] Do not write $bindir into pkg-config files
> > +Subject: [PATCH] Do not prefix executables with $bindir in pkg-config =
files
> >
> > -This would otherwise break when using the files to build other target
> > +This would otherwise break when using the executables to build other t=
arget
> >  components (we need to rely on PATH containing the paths to utilities,
> >  rather than use target paths).
> >
> >  Upstream-Status: Inappropriate [upstream wants the paths in .pc files]
> >  Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >  ---
> > - gio/meson.build  | 16 ++++++++--------
> > - glib/meson.build |  6 +++---
> > - 2 files changed, 11 insertions(+), 11 deletions(-)
> > + gio/meson.build  | 17 +++++++++--------
> > + glib/meson.build |  7 ++++---
> > + 2 files changed, 13 insertions(+), 11 deletions(-)
> >
> >  diff --git a/gio/meson.build b/gio/meson.build
> > -index 5f91586..1a95f4f 100644
> > +index 77cba7b..25d709e 100644
> >  --- a/gio/meson.build
> >  +++ b/gio/meson.build
> > -@@ -884,14 +884,14 @@ pkg.generate(libgio,
> > +@@ -883,17 +883,18 @@ libgio_dep =3D declare_dependency(link_with : li=
bgio,
> > + pkg.generate(libgio,
> > +   requires : ['glib-2.0', 'gobject-2.0'],
> > +   variables : [
> > ++    'bindir=3D' + '${prefix}' / get_option('bindir'),
> > +     'schemasdir=3D' + '${datadir}' / schemas_subdir,
> >       'dtdsdir=3D' + '${datadir}' / dtds_subdir,
> > -     'bindir=3D' + '${prefix}' / get_option('bindir'),
> >       'giomoduledir=3D' + pkgconfig_giomodulesdir,
> >  -    'gio=3D' + '${bindir}' / 'gio',
> >  -    'gio_querymodules=3D' + pkgconfig_multiarch_bindir / 'gio-querymo=
dules',
> > @@ -42,16 +46,17 @@ index 5f91586..1a95f4f 100644
> >     version : glib_version,
> >     install_dir : glib_pkgconfigreldir,
> >  diff --git a/glib/meson.build b/glib/meson.build
> > -index c26a35e..1d8ca6b 100644
> > +index d2efeba..5f5841d 100644
> >  --- a/glib/meson.build
> >  +++ b/glib/meson.build
> > -@@ -447,9 +447,9 @@ pkg.generate(libglib,
> > +@@ -447,9 +447,10 @@ pkg.generate(libglib,
> > +   subdirs : ['glib-2.0'],
> > +   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
> >     variables : [
> > -     'bindir=3D' + '${prefix}' / get_option('bindir'),
> > -     'datadir=3D' + '${prefix}' / get_option('datadir'),
> >  -    'glib_genmarshal=3D' + '${bindir}' / 'glib-genmarshal',
> >  -    'gobject_query=3D' + '${bindir}' / 'gobject-query',
> >  -    'glib_mkenums=3D' + '${bindir}' / 'glib-mkenums',
> > ++    'bindir=3D' + '${prefix}' / get_option('bindir'),
> >  +    'glib_genmarshal=3Dglib-genmarshal',
> >  +    'gobject_query=3Dgobject-query',
> >  +    'glib_mkenums=3Dglib-mkenums',
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-o=
n-uclibc-Linux.patch b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAM=
E-on-uclibc-Linux.patch
> > similarity index 92%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on=
-uclibc-Linux.patch
> > rename to meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-ucli=
bc-Linux.patch
> > index eb9dfdbcf99..129bc7f8aee 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Fix-DATADIRNAME-on-uclib=
c-Linux.patch
> > +++ b/meta/recipes-core/glib-2.0/files/0001-Fix-DATADIRNAME-on-uclibc-L=
inux.patch
> > @@ -1,4 +1,4 @@
> > -From 9a5d4bf65b658d744d610ee27ecd2ae65b14b158 Mon Sep 17 00:00:00 2001
> > +From ccb25e8c0bab54eac8ba0e9d7083ce81461ab72a Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sat, 15 Mar 2014 22:42:29 -0700
> >  Subject: [PATCH] Fix DATADIRNAME on uclibc/Linux
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-query=
modules-as-libexec_PROGRAM.patch b/meta/recipes-core/glib-2.0/files/0001-In=
stall-gio-querymodules-as-libexec_PROGRAM.patch
> > similarity index 84%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querym=
odules-as-libexec_PROGRAM.patch
> > rename to meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodule=
s-as-libexec_PROGRAM.patch
> > index ad69f7ec655..3e12f8abbeb 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Install-gio-querymodules=
-as-libexec_PROGRAM.patch
> > +++ b/meta/recipes-core/glib-2.0/files/0001-Install-gio-querymodules-as=
-libexec_PROGRAM.patch
> > @@ -1,4 +1,4 @@
> > -From 4933aef791857a5aac650b60af800778658b875b Mon Sep 17 00:00:00 2001
> > +From caab40411d8520dae77a4b7933ebaffbb00559fe Mon Sep 17 00:00:00 2001
> >  From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> >  Date: Tue, 22 Mar 2016 15:14:58 +0200
> >  Subject: [PATCH] Install gio-querymodules as libexec_PROGRAM
> > @@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific]
> >   1 file changed, 1 insertion(+)
> >
> >  diff --git a/gio/meson.build b/gio/meson.build
> > -index f9fdf6e..5f91586 100644
> > +index 59c2b0f..77cba7b 100644
> >  --- a/gio/meson.build
> >  +++ b/gio/meson.build
> > -@@ -1005,6 +1005,7 @@ gio_querymodules =3D executable('gio-querymodule=
s', 'gio-querymodules.c', 'giomodu
> > +@@ -1007,6 +1007,7 @@ gio_querymodules =3D executable('gio-querymodule=
s', 'gio-querymodules.c', 'giomodu
> >     c_args : gio_c_args,
> >     # intl.lib is not compatible with SAFESEH
> >     link_args : noseh_link_args,
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warnin=
g-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/file=
s/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
> > similarity index 95%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning=
-about-deprecated-paths-in-schemas.patch
> > rename to meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-abou=
t-deprecated-paths-in-schemas.patch
> > index 0e3a62af6a6..9b0b83afa44 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about=
-deprecated-paths-in-schemas.patch
> > +++ b/meta/recipes-core/glib-2.0/files/0001-Remove-the-warning-about-de=
precated-paths-in-schemas.patch
> > @@ -1,4 +1,4 @@
> > -From 8ae2e9c2a04e089306693a021149dc6b7d1bd679 Mon Sep 17 00:00:00 2001
> > +From 65c036b1ede453e89893076f4ece21c946505096 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Fri, 12 Jun 2015 17:08:46 +0300
> >  Subject: [PATCH] Remove the warning about deprecated paths in schemas
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-=
correctly-when-building-with-mingw3.patch b/meta/recipes-core/glib-2.0/file=
s/0001-Set-host_machine-correctly-when-building-with-mingw3.patch
> > similarity index 80%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-c=
orrectly-when-building-with-mingw3.patch
> > rename to meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correc=
tly-when-building-with-mingw3.patch
> > index 32b4cea409c..a2f9dd9672f 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Set-host_machine-correct=
ly-when-building-with-mingw3.patch
> > +++ b/meta/recipes-core/glib-2.0/files/0001-Set-host_machine-correctly-=
when-building-with-mingw3.patch
> > @@ -1,4 +1,4 @@
> > -From c0733f7a91dfe13152abc60c5a3064456b3e9d63 Mon Sep 17 00:00:00 2001
> > +From 01810df82fae752428d3756c85edb2eb7bbf3c15 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Wed, 13 Feb 2019 15:32:05 +0100
> >  Subject: [PATCH] Set host_machine correctly when building with mingw32
> > @@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
> >   3 files changed, 8 insertions(+), 5 deletions(-)
> >
> >  diff --git a/gio/tests/meson.build b/gio/tests/meson.build
> > -index 4ef3343..e498e7e 100644
> > +index 232ecca..563298b 100644
> >  --- a/gio/tests/meson.build
> >  +++ b/gio/tests/meson.build
> >  @@ -29,7 +29,7 @@ endif
> > @@ -24,16 +24,16 @@ index 4ef3343..e498e7e 100644
> >     common_gio_tests_deps +=3D [iphlpapi_dep, winsock2, cc.find_library=
 ('secur32')]
> >   endif
> >
> > -@@ -230,7 +230,7 @@ if have_dbus_daemon
> > +@@ -244,7 +244,7 @@ if have_dbus_daemon
> >   endif
> >
> >   #  Test programs buildable on UNIX only
> >  -if host_machine.system() !=3D 'windows'
> >  +if host_system !=3D 'windows'
> >     gio_tests +=3D {
> > -     'file' : {},
> > -     'gdbus-peer-object-manager' : {},
> > -@@ -562,7 +562,7 @@ if host_machine.system() !=3D 'windows'
> > +     'file' : {
> > +       # FIXME: https://gitlab.gnome.org/GNOME/glib/-/issues/3148
> > +@@ -593,7 +593,7 @@ if host_machine.system() !=3D 'windows'
> >   endif # unix
> >
> >   #  Test programs buildable on Windows only
> > @@ -42,7 +42,7 @@ index 4ef3343..e498e7e 100644
> >     gio_tests +=3D {'win32-streams' : {}}
> >   endif
> >
> > -@@ -632,7 +632,7 @@ if cc.get_id() !=3D 'msvc' and cc.get_id() !=3D 'c=
lang-cl'
> > +@@ -663,7 +663,7 @@ if cc.get_id() !=3D 'msvc' and cc.get_id() !=3D 'c=
lang-cl'
> >     }
> >   endif
> >
> > @@ -52,10 +52,10 @@ index 4ef3343..e498e7e 100644
> >       'gdbus-example-unix-fd-client' : {
> >         'install' : false,
> >  diff --git a/glib/tests/meson.build b/glib/tests/meson.build
> > -index d80c86e..5329cda 100644
> > +index f6efc59..83eb5a5 100644
> >  --- a/glib/tests/meson.build
> >  +++ b/glib/tests/meson.build
> > -@@ -216,7 +216,7 @@ if glib_conf.has('HAVE_EVENTFD')
> > +@@ -226,7 +226,7 @@ if glib_conf.has('HAVE_EVENTFD')
> >     }
> >   endif
> >
> > @@ -65,7 +65,7 @@ index d80c86e..5329cda 100644
> >       glib_tests +=3D {
> >         'gpoll' : {
> >  diff --git a/meson.build b/meson.build
> > -index 813c9b7..6ee775e 100644
> > +index 7534542..2560686 100644
> >  --- a/meson.build
> >  +++ b/meson.build
> >  @@ -54,6 +54,9 @@ else
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resourc=
es.c-comment-out-a-build-host-only-.patch b/meta/recipes-core/glib-2.0/file=
s/0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch
> > similarity index 92%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resource=
s.c-comment-out-a-build-host-only-.patch
> > rename to meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-c=
omment-out-a-build-host-only-.patch
> > index aee29860332..bb84f3969e4 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-resources.c-co=
mment-out-a-build-host-only-.patch
> > +++ b/meta/recipes-core/glib-2.0/files/0001-gio-tests-resources.c-comme=
nt-out-a-build-host-only-.patch
> > @@ -1,4 +1,4 @@
> > -From 878e51f82100c698236fda0e069e14ea9249350c Mon Sep 17 00:00:00 2001
> > +From e8b4f53b567339aad90b585673d55a5c6176535a Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Wed, 8 Jan 2020 18:22:46 +0100
> >  Subject: [PATCH] gio/tests/resources.c: comment out a build host-only =
test
> > @@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.=
com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/gio/tests/resources.c b/gio/tests/resources.c
> > -index f567914..b21b616 100644
> > +index f7dc039..f708876 100644
> >  --- a/gio/tests/resources.c
> >  +++ b/gio/tests/resources.c
> >  @@ -1068,7 +1068,7 @@ main (int   argc,
> > diff --git a/meta/recipes-core/glib-2.0/files/0001-girepository-introsp=
ection-correctly-install-.gir-fi.patch b/meta/recipes-core/glib-2.0/files/0=
001-girepository-introspection-correctly-install-.gir-fi.patch
> > new file mode 100644
> > index 00000000000..76e5f587480
> > --- /dev/null
> > +++ b/meta/recipes-core/glib-2.0/files/0001-girepository-introspection-=
correctly-install-.gir-fi.patch
> > @@ -0,0 +1,88 @@
> > +From 4e6be5d15e5d2f8e494d22a3d49b623064f9c1a5 Mon Sep 17 00:00:00 2001
> > +From: Alexander Kanavin <alex@linutronix.de>
> > +Date: Tue, 23 Apr 2024 11:24:34 +0200
> > +Subject: [PATCH] girepository/introspection: correctly install .gir fi=
les into
> > + custom locations provided via meson option
> > +
> > +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/glib/-/merg=
e_requests/4020]
> > +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > +---
> > + girepository/introspection/meson.build | 9 +++++++++
> > + 1 file changed, 9 insertions(+)
> > +
> > +diff --git a/girepository/introspection/meson.build b/girepository/int=
rospection/meson.build
> > +index 9405686..862ca61 100644
> > +--- a/girepository/introspection/meson.build
> > ++++ b/girepository/introspection/meson.build
> > +@@ -49,6 +49,7 @@ glib_gir =3D gnome.generate_gir(libglib,
> > +   export_packages: 'glib-2.0',
> > +   header: 'glib.h',
> > +   install: true,
> > ++  install_dir_gir: glib_girdir,
> > +   dependencies: [
> > +     libgobject_dep,
> > +   ],
> > +@@ -76,6 +77,7 @@ if host_system =3D=3D 'windows'
> > +     header: 'glib.h',
> > +     includes: [ glib_gir[0] ],
> > +     install: true,
> > ++    install_dir_gir: glib_girdir,
> > +     dependencies: [
> > +       libgobject_dep,
> > +     ],
> > +@@ -104,6 +106,7 @@ else
> > +     header: 'glib.h',
> > +     includes: [ glib_gir[0] ],
> > +     install: true,
> > ++    install_dir_gir: glib_girdir,
> > +     dependencies: [
> > +       libgobject_dep,
> > +     ],
> > +@@ -137,6 +140,7 @@ gobject_gir =3D gnome.generate_gir(libgobject,
> > +   header: 'glib-object.h',
> > +   includes: [ glib_gir[0] ],
> > +   install: true,
> > ++  install_dir_gir: glib_girdir,
> > +   env: gi_gen_env_variables,
> > +   extra_args: gir_args + [
> > +       '-DGOBJECT_COMPILATION',
> > +@@ -162,6 +166,7 @@ gmodule_gir =3D gnome.generate_gir(libgmodule,
> > +   header: 'gmodule.h',
> > +   includes: [ glib_gir[0] ],
> > +   install: true,
> > ++  install_dir_gir: glib_girdir,
> > +   dependencies: [
> > +     libglib_dep,
> > +   ],
> > +@@ -224,6 +229,7 @@ gio_gir =3D gnome.generate_gir(libgio,
> > +   header: 'gio/gio.h',
> > +   includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0] ],
> > +   install: true,
> > ++  install_dir_gir: glib_girdir,
> > +   dependencies: [
> > +     libglib_dep,
> > +     libgobject_dep,
> > +@@ -249,6 +255,7 @@ if host_system =3D=3D 'windows'
> > +     header: 'gio/gio.h',
> > +     includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[=
0] ],
> > +     install: true,
> > ++    install_dir_gir: glib_girdir,
> > +     dependencies: [
> > +       libglib_dep,
> > +       libgobject_dep,
> > +@@ -277,6 +284,7 @@ else
> > +     header: 'gio/gio.h',
> > +     includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[=
0] ],
> > +     install: true,
> > ++    install_dir_gir: glib_girdir,
> > +     dependencies: [
> > +       libglib_dep,
> > +       libgobject_dep,
> > +@@ -314,6 +322,7 @@ girepository_gir =3D gnome.generate_gir(libgirepos=
itory,
> > +   header: 'girepository/girepository.h',
> > +   includes: [ glib_gir[0], gmodule_gir[0], gobject_gir[0], gio_gir[0]=
 ],
> > +   install: true,
> > ++  install_dir_gir: glib_girdir,
> > +   dependencies: [ libglib_dep, libgobject_dep, libgmodule_dep, libgio=
_dep ],
> > +   extra_args: gir_args + libgirepository_gir_args,
> > + )
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics=
-test-on-clang-as-well.patch b/meta/recipes-core/glib-2.0/files/0001-meson-=
Run-atomics-test-on-clang-as-well.patch
> > similarity index 88%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-=
test-on-clang-as-well.patch
> > rename to meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-=
on-clang-as-well.patch
> > index 0b102691141..2f805299874 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Run-atomics-test-o=
n-clang-as-well.patch
> > +++ b/meta/recipes-core/glib-2.0/files/0001-meson-Run-atomics-test-on-c=
lang-as-well.patch
> > @@ -1,4 +1,4 @@
> > -From b4b523160ef550a53705fcc45ac6e10d086ce491 Mon Sep 17 00:00:00 2001
> > +From 3dc2e741e18ccb740e98eb4e808ff83153b70e83 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Sat, 12 Oct 2019 17:46:26 -0700
> >  Subject: [PATCH] meson: Run atomics test on clang as well
> > @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/meson.build b/meson.build
> > -index 6ee775e..8bc5fa7 100644
> > +index 2560686..5c46d0b 100644
> >  --- a/meson.build
> >  +++ b/meson.build
> > -@@ -1938,7 +1938,7 @@ atomicdefine =3D '''
> > +@@ -2024,7 +2024,7 @@ atomicdefine =3D '''
> >   # We know that we can always use real ("lock free") atomic operations=
 with MSVC
> >   if cc.get_id() =3D=3D 'msvc' or cc.get_id() =3D=3D 'clang-cl' or cc.l=
inks(atomictest, name : 'atomic ops')
> >     have_atomic_lock_free =3D true
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-no=
t-enable-pidfd-features-on-native-g.patch b/meta/recipes-core/glib-2.0/file=
s/0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch
> > similarity index 84%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not=
-enable-pidfd-features-on-native-g.patch
> > rename to meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enab=
le-pidfd-features-on-native-g.patch
> > index 14dcb278e05..82955de6715 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson.build-do-not-enabl=
e-pidfd-features-on-native-g.patch
> > +++ b/meta/recipes-core/glib-2.0/files/0001-meson.build-do-not-enable-p=
idfd-features-on-native-g.patch
> > @@ -1,4 +1,4 @@
> > -From 294f3e6e9a0a9f4733e85ed6810d1b743055370b Mon Sep 17 00:00:00 2001
> > +From 59525eedfbbfe4a16fdd0b340bc3f2479431c7d5 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex@linutronix.de>
> >  Date: Sat, 16 Sep 2023 22:28:27 +0200
> >  Subject: [PATCH] meson.build: do not enable pidfd features on native g=
lib
> > @@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.d=
e>
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> >  diff --git a/meson.build b/meson.build
> > -index 8bc5fa7..df1fa60 100644
> > +index 5c46d0b..222c1a1 100644
> >  --- a/meson.build
> >  +++ b/meson.build
> > -@@ -981,7 +981,8 @@ if cc.links('''#include <sys/syscall.h>
> > +@@ -1022,7 +1022,8 @@ if cc.links('''#include <sys/syscall.h>
> >                    waitid (P_PIDFD, 0, &child_info, WEXITED | WNOHANG);
> >                    return 0;
> >                  }''', name : 'pidfd_open(2) system call')
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-p=
ython-path-into-various-tools.patch b/meta/recipes-core/glib-2.0/files/0010=
-Do-not-hardcode-python-path-into-various-tools.patch
> > similarity index 93%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-py=
thon-path-into-various-tools.patch
> > rename to meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-=
path-into-various-tools.patch
> > index 6dff5179c71..a51c186b004 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/0010-Do-not-hardcode-python-p=
ath-into-various-tools.patch
> > +++ b/meta/recipes-core/glib-2.0/files/0010-Do-not-hardcode-python-path=
-into-various-tools.patch
> > @@ -1,4 +1,4 @@
> > -From 50636758c73e5e61212a8f801c6c602b8aab5ba7 Mon Sep 17 00:00:00 2001
> > +From e6784ba43af83e22556921786c8f15e4cd246298 Mon Sep 17 00:00:00 2001
> >  From: Alexander Kanavin <alex.kanavin@gmail.com>
> >  Date: Tue, 3 Oct 2017 10:45:55 +0300
> >  Subject: [PATCH] Do not hardcode python path into various tools
> > @@ -32,7 +32,7 @@ index aa5af43..56e8e2e 100755
> >   # pylint: disable=3Dtoo-many-lines, missing-docstring, invalid-name
> >
> >  diff --git a/gobject/glib-mkenums.in b/gobject/glib-mkenums.in
> > -index 353e53a..8ed6c39 100755
> > +index e10b910..4b619f8 100755
> >  --- a/gobject/glib-mkenums.in
> >  +++ b/gobject/glib-mkenums.in
> >  @@ -1,4 +1,4 @@
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common b=
/meta/recipes-core/glib-2.0/files/meson.cross.d/common
> > similarity index 100%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common
> > rename to meta/recipes-core/glib-2.0/files/meson.cross.d/common
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-g=
libc b/meta/recipes-core/glib-2.0/files/meson.cross.d/common-glibc
> > similarity index 100%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-gl=
ibc
> > rename to meta/recipes-core/glib-2.0/files/meson.cross.d/common-glibc
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-l=
inux b/meta/recipes-core/glib-2.0/files/meson.cross.d/common-linux
> > similarity index 100%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-li=
nux
> > rename to meta/recipes-core/glib-2.0/files/meson.cross.d/common-linux
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-m=
ingw b/meta/recipes-core/glib-2.0/files/meson.cross.d/common-mingw
> > similarity index 100%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-mi=
ngw
> > rename to meta/recipes-core/glib-2.0/files/meson.cross.d/common-mingw
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-m=
usl b/meta/recipes-core/glib-2.0/files/meson.cross.d/common-musl
> > similarity index 100%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-mu=
sl
> > rename to meta/recipes-core/glib-2.0/files/meson.cross.d/common-musl
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch=
 b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
> > similarity index 86%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> > rename to meta/recipes-core/glib-2.0/files/relocate-modules.patch
> > index 3e79bbf6796..d6e9019f396 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
> > +++ b/meta/recipes-core/glib-2.0/files/relocate-modules.patch
> > @@ -1,4 +1,4 @@
> > -From f40e89b3852df37959606ee13b1a14ade81fa886 Mon Sep 17 00:00:00 2001
> > +From 47ea2576a13d5bc86692b4ba8cb4a8f2fd38c6ca Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@intel.com>
> >  Date: Fri, 11 Mar 2016 15:35:55 +0000
> >  Subject: [PATCH] glib-2.0: relocate the GIO module directory for nativ=
e builds
> > @@ -18,10 +18,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel=
.com>
> >   1 file changed, 7 deletions(-)
> >
> >  diff --git a/gio/giomodule.c b/gio/giomodule.c
> > -index 17fabe6..8021208 100644
> > +index 1e14955..3c09bb5 100644
> >  --- a/gio/giomodule.c
> >  +++ b/gio/giomodule.c
> > -@@ -1271,11 +1271,6 @@ get_gio_module_dir (void)
> > +@@ -1259,11 +1259,6 @@ get_gio_module_dir (void)
> >         g_free (install_dir);
> >   #else
> >         module_dir =3D g_strdup (GIO_MODULE_DIR);
> > @@ -33,7 +33,7 @@ index 17fabe6..8021208 100644
> >   #include <dlfcn.h>
> >         {
> >           g_autofree gchar *path =3D NULL;
> > -@@ -1294,8 +1289,6 @@ get_gio_module_dir (void)
> > +@@ -1282,8 +1277,6 @@ get_gio_module_dir (void)
> >                 }
> >             }
> >         }
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recip=
es-core/glib-2.0/files/run-ptest
> > similarity index 100%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/run-ptest
> > rename to meta/recipes-core/glib-2.0/files/run-ptest
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/skip-timeout.patch b/m=
eta/recipes-core/glib-2.0/files/skip-timeout.patch
> > similarity index 90%
> > rename from meta/recipes-core/glib-2.0/glib-2.0/skip-timeout.patch
> > rename to meta/recipes-core/glib-2.0/files/skip-timeout.patch
> > index cd5ac287c3f..b1c62cc39c8 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/skip-timeout.patch
> > +++ b/meta/recipes-core/glib-2.0/files/skip-timeout.patch
> > @@ -1,4 +1,4 @@
> > -From bb11d1a4ae77d93ec0743e54077cf0f990243fa6 Mon Sep 17 00:00:00 2001
> > +From 682d8a616ca111c0e45c8a9cb02e992e63c69586 Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@arm.com>
> >  Date: Thu, 28 Mar 2024 16:27:09 +0000
> >  Subject: [PATCH] Skip /timeout/rounding test
> > @@ -16,7 +16,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
> >   1 file changed, 1 deletion(-)
> >
> >  diff --git a/glib/tests/timeout.c b/glib/tests/timeout.c
> > -index 1ae3f3a34..85a715b0f 100644
> > +index 1ae3f3a..85a715b 100644
> >  --- a/glib/tests/timeout.c
> >  +++ b/glib/tests/timeout.c
> >  @@ -214,7 +214,6 @@ main (int argc, char *argv[])
> > @@ -27,6 +27,3 @@ index 1ae3f3a34..85a715b0f 100644
> >
> >     return g_test_run ();
> >   }
> > ---
> > -2.34.1
> > -
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb b/me=
ta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb
> > new file mode 100644
> > index 00000000000..7da28382650
> > --- /dev/null
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.0.bb
> > @@ -0,0 +1,5 @@
> > +require glib.inc
> > +PACKAGES =3D ""
> > +PACKAGECONFIG =3D ""
> > +
> > +
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-d=
eprecated-distutils-module-to-the-p.patch b/meta/recipes-core/glib-2.0/glib=
-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
> > deleted file mode 100644
> > index b11c283e6d7..00000000000
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecat=
ed-distutils-module-to-the-p.patch
> > +++ /dev/null
> > @@ -1,34 +0,0 @@
> > -From a8eb944a10353403241608a084787f6efcbb2eb7 Mon Sep 17 00:00:00 2001
> > -From: Jordan Williams <jordan@jwillikers.com>
> > -Date: Fri, 1 Dec 2023 09:53:50 -0600
> > -Subject: [PATCH] Switch from the deprecated distutils module to the pa=
ckaging
> > - module
> > -
> > -The distutils module was removed in Python 3.12.
> > -
> > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commi=
t/6ef967a0f930ce37a8c9b5aff969693b34714291]
> > -
> > -Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ----
> > - gio/gdbus-2.0/codegen/utils.py | 4 ++--
> > - 1 file changed, 2 insertions(+), 2 deletions(-)
> > -
> > -diff --git a/gio/gdbus-2.0/codegen/utils.py b/gio/gdbus-2.0/codegen/ut=
ils.py
> > -index 0204610..08f1ba9 100644
> > ---- a/gio/gdbus-2.0/codegen/utils.py
> > -+++ b/gio/gdbus-2.0/codegen/utils.py
> > -@@ -19,7 +19,7 @@
> > - #
> > - # Author: David Zeuthen <davidz@redhat.com>
> > -
> > --import distutils.version
> > -+import packaging.version
> > - import os
> > - import sys
> > -
> > -@@ -166,4 +166,4 @@ def version_cmp_key(key):
> > -         v =3D str(key[0])
> > -     else:
> > -         v =3D "0"
> > --    return (distutils.version.LooseVersion(v), key[1])
> > -+    return (packaging.version.Version(v), key[1])
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch b/meta=
/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
> > deleted file mode 100644
> > index bdfbd558999..00000000000
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
> > +++ /dev/null
> > @@ -1,54 +0,0 @@
> > -From cce3ae98a2c1966719daabff5a4ec6cf94a846f6 Mon Sep 17 00:00:00 2001
> > -From: Philip Withnall <pwithnall@gnome.org>
> > -Date: Mon, 26 Feb 2024 16:55:44 +0000
> > -Subject: [PATCH] tests: Remove variable-length lookbehind tests for GR=
egex
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -PCRE2 10.43 has now introduced support for variable-length lookbehind,
> > -so these tests now fail if GLib is built against PCRE2 10.43 or higher=
.
> > -
> > -See
> > -https://github.com/PCRE2Project/pcre2/blob/e8db6fa7137f4c6f66cb87e0a3c=
9467252ec1ef7/ChangeLog#L94.
> > -
> > -Rather than making the tests conditional on the version of PCRE2 in us=
e,
> > -just remove them. They are mostly testing the PCRE2 code rather than
> > -any code in GLib, so don=C3=A2=E2=82=AC=E2=84=A2t have much value.
> > -
> > -This should fix CI runs on msys2-mingw32, which updated to PCRE2 10.43=
 2
> > -days ago.
> > -
> > -Signed-off-by: Philip Withnall <pwithnall@gnome.org>
> > -
> > -Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commi=
t/cce3ae98a2c1966719daabff5a4ec6cf94a846f6]
> > -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ----
> > - glib/tests/regex.c | 10 ----------
> > - 1 file changed, 10 deletions(-)
> > -
> > -diff --git a/glib/tests/regex.c b/glib/tests/regex.c
> > -index 1082526292..d7a698ec67 100644
> > ---- a/glib/tests/regex.c
> > -+++ b/glib/tests/regex.c
> > -@@ -1885,16 +1885,6 @@ test_lookbehind (void)
> > -   g_match_info_free (match);
> > -   g_regex_unref (regex);
> > -
> > --  regex =3D g_regex_new ("(?<!dogs?|cats?) x", G_REGEX_OPTIMIZE, G_RE=
GEX_MATCH_DEFAULT, &error);
> > --  g_assert (regex =3D=3D NULL);
> > --  g_assert_error (error, G_REGEX_ERROR, G_REGEX_ERROR_VARIABLE_LENGTH=
_LOOKBEHIND);
> > --  g_clear_error (&error);
> > --
> > --  regex =3D g_regex_new ("(?<=3Dab(c|de)) foo", G_REGEX_OPTIMIZE, G_R=
EGEX_MATCH_DEFAULT, &error);
> > --  g_assert (regex =3D=3D NULL);
> > --  g_assert_error (error, G_REGEX_ERROR, G_REGEX_ERROR_VARIABLE_LENGTH=
_LOOKBEHIND);
> > --  g_clear_error (&error);
> > --
> > -   regex =3D g_regex_new ("(?<=3Dabc|abde)foo", G_REGEX_OPTIMIZE, G_RE=
GEX_MATCH_DEFAULT, &error);
> > -   g_assert (regex);
> > -   g_assert_no_error (error);
> > ---
> > -GitLab
> > -
> > -
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch b=
/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
> > deleted file mode 100644
> > index 4f38509da6f..00000000000
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/memory-monitor.patch
> > +++ /dev/null
> > @@ -1,361 +0,0 @@
> > -From ce840b6b111e1e109e511f6833d6aa419e2b723a Mon Sep 17 00:00:00 2001
> > -From: Philip Withnall <philip@tecnocode.co.uk>
> > -Date: Tue, 23 Jan 2024 11:16:52 +0000
> > -Subject: [PATCH] Merge branch '2887-memory-monitor-tests' into 'main'
> > -
> > -tests: Fix race condition in memory-monitor-dbus.test
> > -
> > -Closes #2887
> > -
> > -See merge request GNOME/glib!3844
> > -
> > -Hopefully these commits fix the occasional failures we've been seeing:
> > -https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15362
> > -
> > -Upstream-Status: Backport
> > -Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ----
> > - gio/tests/memory-monitor-dbus.py.in          | 64 +++++++++++++------=
-
> > - gio/tests/memory-monitor-portal.py.in        | 54 ++++++++++-------
> > - gio/tests/power-profile-monitor-dbus.py.in   | 35 ++++++-----
> > - gio/tests/power-profile-monitor-portal.py.in | 34 ++++++-----
> > - 4 files changed, 113 insertions(+), 74 deletions(-)
> > -
> > -diff --git a/gio/tests/memory-monitor-dbus.py.in b/gio/tests/memory-mo=
nitor-dbus.py.in
> > -index bf32918..7aae01e 100755
> > ---- a/gio/tests/memory-monitor-dbus.py.in
> > -+++ b/gio/tests/memory-monitor-dbus.py.in
> > -@@ -16,7 +16,6 @@ import sys
> > - import subprocess
> > - import fcntl
> > - import os
> > --import time
> > -
> > - import taptestrunner
> > -
> > -@@ -57,53 +56,74 @@ try:
> > -             fcntl.fcntl(self.p_mock.stdout, fcntl.F_SETFL, flags | os=
.O_NONBLOCK)
> > -             self.last_warning =3D -1
> > -             self.dbusmock =3D dbus.Interface(self.obj_lmm, dbusmock.M=
OCK_IFACE)
> > -+
> > -+            try:
> > -+                self.wait_for_bus_object('org.freedesktop.LowMemoryMo=
nitor',
> > -+                                        '/org/freedesktop/LowMemoryMo=
nitor',
> > -+                                        system_bus=3DTrue)
> > -+            except:
> > -+                raise
> > -+
> > -             self.memory_monitor =3D Gio.MemoryMonitor.dup_default()
> > -+            assert("GMemoryMonitorDBus" in str(self.memory_monitor))
> > -             self.memory_monitor.connect("low-memory-warning", self.me=
mory_warning_cb)
> > -             self.mainloop =3D GLib.MainLoop()
> > -             self.main_context =3D self.mainloop.get_context()
> > -
> > -+            # The LowMemoryMonitor API is stateless: it doesn=E2=80=
=99t expose any
> > -+            # properties, just a warning signal. Emit the signal in a=
 loop until
> > -+            # the GMemoryMonitor instance has initialised and synchro=
nised to
> > -+            # the right state.
> > -+            def emit_warning(level):
> > -+                self.dbusmock.EmitWarning(level)
> > -+                return GLib.SOURCE_CONTINUE
> > -+
> > -+            idle_id =3D GLib.idle_add(emit_warning, 0)
> > -+            while self.last_warning !=3D 0:
> > -+                self.main_context.iteration(True)
> > -+            GLib.source_remove(idle_id)
> > -+
> > -         def tearDown(self):
> > -             self.p_mock.terminate()
> > -             self.p_mock.wait()
> > -
> > --        def assertEventually(self, condition, message=3DNone, timeout=
=3D50):
> > -+        def assertEventually(self, condition, message=3DNone, timeout=
=3D5):
> > -             '''Assert that condition function eventually returns True=
.
> > -
> > --            Timeout is in deciseconds, defaulting to 50 (5 seconds). =
message is
> > -+            Timeout is in seconds, defaulting to 5 seconds. message i=
s
> > -             printed on failure.
> > -             '''
> > --            while timeout >=3D 0:
> > --                context =3D GLib.MainContext.default()
> > --                while context.iteration(False):
> > --                    pass
> > --                if condition():
> > --                    break
> > --                timeout -=3D 1
> > --                time.sleep(0.1)
> > --            else:
> > --                self.fail(message or 'timed out waiting for ' + str(c=
ondition))
> > -+            if not message:
> > -+                message =3D 'timed out waiting for ' + str(condition)
> > -+
> > -+            def timed_out_cb(message):
> > -+                self.fail(message)
> > -+                return GLib.SOURCE_REMOVE
> > -+
> > -+            timeout_source =3D GLib.timeout_source_new_seconds(timeou=
t)
> > -+            timeout_source.set_callback(timed_out_cb, message)
> > -+            timeout_source.attach(self.main_context)
> > -+
> > -+            while not condition():
> > -+                self.main_context.iteration(True)
> > -+
> > -+            timeout_source.destroy()
> > -
> > -         def memory_warning_cb(self, monitor, level):
> > -+            print("Received memory warning signal, level", level)
> > -             self.last_warning =3D level
> > -             self.main_context.wakeup()
> > -
> > -         def test_low_memory_warning_signal(self):
> > -             '''LowMemoryWarning signal'''
> > -
> > --            # Wait 2 seconds
> > --            timeout =3D 2
> > --            while timeout > 0:
> > --                time.sleep(0.5)
> > --                timeout -=3D 0.5
> > --                self.main_context.iteration(False)
> > --
> > -             self.dbusmock.EmitWarning(100)
> > -             # Wait 2 seconds or until warning
> > --            self.assertEventually(lambda: self.last_warning =3D=3D 10=
0, "'100' low-memory warning not received", 20)
> > -+            self.assertEventually(lambda: self.last_warning =3D=3D 10=
0, "'100' low-memory warning not received", 2)
> > -
> > -             self.dbusmock.EmitWarning(255)
> > -             # Wait 2 seconds or until warning
> > --            self.assertEventually(lambda: self.last_warning =3D=3D 25=
5, "'255' low-memory warning not received", 20)
> > -+            self.assertEventually(lambda: self.last_warning =3D=3D 25=
5, "'255' low-memory warning not received", 2)
> > -
> > - except ImportError as e:
> > -     @unittest.skip("Cannot import %s" % e.name)
> > -diff --git a/gio/tests/memory-monitor-portal.py.in b/gio/tests/memory-=
monitor-portal.py.in
> > -index 748cee8..f570508 100755
> > ---- a/gio/tests/memory-monitor-portal.py.in
> > -+++ b/gio/tests/memory-monitor-portal.py.in
> > -@@ -16,7 +16,6 @@ import sys
> > - import subprocess
> > - import fcntl
> > - import os
> > --import time
> > -
> > - import taptestrunner
> > -
> > -@@ -80,26 +79,44 @@ try:
> > -             self.mainloop =3D GLib.MainLoop()
> > -             self.main_context =3D self.mainloop.get_context()
> > -
> > -+            # The LowMemoryMonitor API is stateless: it doesn=E2=80=
=99t expose any
> > -+            # properties, just a warning signal. Emit the signal in a=
 loop until
> > -+            # the GMemoryMonitor instance has initialised and synchro=
nised to
> > -+            # the right state.
> > -+            def emit_warning(level):
> > -+                self.dbusmock.EmitWarning(level)
> > -+                return GLib.SOURCE_CONTINUE
> > -+
> > -+            idle_id =3D GLib.idle_add(self.emit_warning, 0)
> > -+            while self.last_warning !=3D 0:
> > -+                self.main_context.iteration(True)
> > -+            GLib.source_remove(idle_id)
> > -+
> > -         def tearDown(self):
> > -             self.p_mock.terminate()
> > -             self.p_mock.wait()
> > -
> > --        def assertEventually(self, condition, message=3DNone, timeout=
=3D50):
> > -+        def assertEventually(self, condition, message=3DNone, timeout=
=3D5):
> > -             '''Assert that condition function eventually returns True=
.
> > -
> > --            Timeout is in deciseconds, defaulting to 50 (5 seconds). =
message is
> > -+            Timeout is in seconds, defaulting to 5 seconds. message i=
s
> > -             printed on failure.
> > -             '''
> > --            while timeout >=3D 0:
> > --                context =3D GLib.MainContext.default()
> > --                while context.iteration(False):
> > --                    pass
> > --                if condition():
> > --                    break
> > --                timeout -=3D 1
> > --                time.sleep(0.1)
> > --            else:
> > --                self.fail(message or 'timed out waiting for ' + str(c=
ondition))
> > -+            if not message:
> > -+                message =3D 'timed out waiting for ' + str(condition)
> > -+
> > -+            def timed_out_cb(message):
> > -+                self.fail(message)
> > -+                return GLib.SOURCE_REMOVE
> > -+
> > -+            timeout_source =3D GLib.timeout_source_new_seconds(timeou=
t)
> > -+            timeout_source.set_callback(timed_out_cb, message)
> > -+            timeout_source.attach(self.main_context)
> > -+
> > -+            while not condition():
> > -+                self.main_context.iteration(True)
> > -+
> > -+            timeout_source.destroy()
> > -
> > -         def portal_memory_warning_cb(self, monitor, level):
> > -             self.last_warning =3D level
> > -@@ -108,20 +125,13 @@ try:
> > -         def test_low_memory_warning_portal_signal(self):
> > -             '''LowMemoryWarning signal'''
> > -
> > --            # Wait 2 seconds
> > --            timeout =3D 2
> > --            while timeout > 0:
> > --                time.sleep(0.5)
> > --                timeout -=3D 0.5
> > --                self.main_context.iteration(False)
> > --
> > -             self.dbusmock.EmitWarning(100)
> > -             # Wait 2 seconds or until warning
> > --            self.assertEventually(lambda: self.last_warning =3D=3D 10=
0, "'100' low-memory warning not received", 20)
> > -+            self.assertEventually(lambda: self.last_warning =3D=3D 10=
0, "'100' low-memory warning not received", 2)
> > -
> > -             self.dbusmock.EmitWarning(255)
> > -             # Wait 2 seconds or until warning
> > --            self.assertEventually(lambda: self.last_warning =3D=3D 25=
5, "'255' low-memory warning not received", 20)
> > -+            self.assertEventually(lambda: self.last_warning =3D=3D 25=
5, "'255' low-memory warning not received", 2)
> > -
> > - except ImportError as e:
> > -     @unittest.skip("Cannot import %s" % e.name)
> > -diff --git a/gio/tests/power-profile-monitor-dbus.py.in b/gio/tests/po=
wer-profile-monitor-dbus.py.in
> > -index 06e594f..f955afc 100755
> > ---- a/gio/tests/power-profile-monitor-dbus.py.in
> > -+++ b/gio/tests/power-profile-monitor-dbus.py.in
> > -@@ -16,7 +16,6 @@ import sys
> > - import subprocess
> > - import fcntl
> > - import os
> > --import time
> > -
> > - import taptestrunner
> > -
> > -@@ -58,6 +57,7 @@ try:
> > -             self.power_saver_enabled =3D False
> > -             self.dbus_props =3D dbus.Interface(self.obj_ppd, dbus.PRO=
PERTIES_IFACE)
> > -             self.power_profile_monitor =3D Gio.PowerProfileMonitor.du=
p_default()
> > -+            assert("GPowerProfileMonitorDBus" in str(self.power_profi=
le_monitor))
> > -             self.power_profile_monitor.connect("notify::power-saver-e=
nabled", self.power_saver_enabled_cb)
> > -             self.mainloop =3D GLib.MainLoop()
> > -             self.main_context =3D self.mainloop.get_context()
> > -@@ -66,22 +66,27 @@ try:
> > -             self.p_mock.terminate()
> > -             self.p_mock.wait()
> > -
> > --        def assertEventually(self, condition, message=3DNone, timeout=
=3D50):
> > -+        def assertEventually(self, condition, message=3DNone, timeout=
=3D5):
> > -             '''Assert that condition function eventually returns True=
.
> > -
> > --            Timeout is in deciseconds, defaulting to 50 (5 seconds). =
message is
> > -+            Timeout is in seconds, defaulting to 5 seconds. message i=
s
> > -             printed on failure.
> > -             '''
> > --            while timeout >=3D 0:
> > --                context =3D GLib.MainContext.default()
> > --                while context.iteration(False):
> > --                    pass
> > --                if condition():
> > --                    break
> > --                timeout -=3D 1
> > --                time.sleep(0.1)
> > --            else:
> > --                self.fail(message or 'timed out waiting for ' + str(c=
ondition))
> > -+            if not message:
> > -+                message =3D 'timed out waiting for ' + str(condition)
> > -+
> > -+            def timed_out_cb(message):
> > -+                self.fail(message)
> > -+                return GLib.SOURCE_REMOVE
> > -+
> > -+            timeout_source =3D GLib.timeout_source_new_seconds(timeou=
t)
> > -+            timeout_source.set_callback(timed_out_cb, message)
> > -+            timeout_source.attach(self.main_context)
> > -+
> > -+            while not condition():
> > -+                self.main_context.iteration(True)
> > -+
> > -+            timeout_source.destroy()
> > -
> > -         def power_saver_enabled_cb(self, spec, data):
> > -             self.power_saver_enabled =3D self.power_profile_monitor.g=
et_power_saver_enabled()
> > -@@ -92,10 +97,10 @@ try:
> > -
> > -             self.assertEqual(self.power_profile_monitor.get_power_sav=
er_enabled(), False)
> > -             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActivePr=
ofile', dbus.String('power-saver', variant_level=3D1))
> > --            self.assertEventually(lambda: self.power_saver_enabled =
=3D=3D True, "power-saver didn't become enabled", 10)
> > -+            self.assertEventually(lambda: self.power_saver_enabled =
=3D=3D True, "power-saver didn't become enabled", 1)
> > -
> > -             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActivePr=
ofile', dbus.String('balanced', variant_level=3D1))
> > --            self.assertEventually(lambda: self.power_saver_enabled =
=3D=3D False, "power-saver didn't become disabled", 10)
> > -+            self.assertEventually(lambda: self.power_saver_enabled =
=3D=3D False, "power-saver didn't become disabled", 1)
> > -
> > - except ImportError as e:
> > -     @unittest.skip("Cannot import %s" % e.name)
> > -diff --git a/gio/tests/power-profile-monitor-portal.py.in b/gio/tests/=
power-profile-monitor-portal.py.in
> > -index 09e9a45..ad2abf6 100755
> > ---- a/gio/tests/power-profile-monitor-portal.py.in
> > -+++ b/gio/tests/power-profile-monitor-portal.py.in
> > -@@ -16,7 +16,6 @@ import sys
> > - import subprocess
> > - import fcntl
> > - import os
> > --import time
> > -
> > - import taptestrunner
> > -
> > -@@ -90,22 +89,27 @@ try:
> > -             self.p_mock.terminate()
> > -             self.p_mock.wait()
> > -
> > --        def assertEventually(self, condition, message=3DNone, timeout=
=3D50):
> > -+        def assertEventually(self, condition, message=3DNone, timeout=
=3D5):
> > -             '''Assert that condition function eventually returns True=
.
> > -
> > --            Timeout is in deciseconds, defaulting to 50 (5 seconds). =
message is
> > -+            Timeout is in seconds, defaulting to 5 seconds. message i=
s
> > -             printed on failure.
> > -             '''
> > --            while timeout >=3D 0:
> > --                context =3D GLib.MainContext.default()
> > --                while context.iteration(False):
> > --                    pass
> > --                if condition():
> > --                    break
> > --                timeout -=3D 1
> > --                time.sleep(0.1)
> > --            else:
> > --                self.fail(message or 'timed out waiting for ' + str(c=
ondition))
> > -+            if not message:
> > -+                message =3D 'timed out waiting for ' + str(condition)
> > -+
> > -+            def timed_out_cb(message):
> > -+                self.fail(message)
> > -+                return GLib.SOURCE_REMOVE
> > -+
> > -+            timeout_source =3D GLib.timeout_source_new_seconds(timeou=
t)
> > -+            timeout_source.set_callback(timed_out_cb, message)
> > -+            timeout_source.attach(self.main_context)
> > -+
> > -+            while not condition():
> > -+                self.main_context.iteration(True)
> > -+
> > -+            timeout_source.destroy()
> > -
> > -         def power_saver_enabled_cb(self, spec, data):
> > -             self.power_saver_enabled =3D self.power_profile_monitor.g=
et_power_saver_enabled()
> > -@@ -116,10 +120,10 @@ try:
> > -
> > -             self.assertEqual(self.power_profile_monitor.get_power_sav=
er_enabled(), False)
> > -             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActivePr=
ofile', dbus.String('power-saver', variant_level=3D1))
> > --            self.assertEventually(lambda: self.power_saver_enabled =
=3D=3D True, "power-saver didn't become enabled", 10)
> > -+            self.assertEventually(lambda: self.power_saver_enabled =
=3D=3D True, "power-saver didn't become enabled", 1)
> > -
> > -             self.dbus_props.Set('net.hadess.PowerProfiles', 'ActivePr=
ofile', dbus.String('balanced', variant_level=3D1))
> > --            self.assertEventually(lambda: self.power_saver_enabled =
=3D=3D False, "power-saver didn't become disabled", 10)
> > -+            self.assertEventually(lambda: self.power_saver_enabled =
=3D=3D False, "power-saver didn't become disabled", 1)
> > -
> > -         def test_power_profile_power_saver_enabled_portal_default(sel=
f):
> > -             '''power-saver-enabled property default value'''
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb b/meta/recip=
es-core/glib-2.0/glib-2.0_2.78.4.bb
> > deleted file mode 100644
> > index b1669ead75e..00000000000
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb
> > +++ /dev/null
> > @@ -1,57 +0,0 @@
> > -require glib.inc
> > -
> > -PE =3D "1"
> > -
> > -SHRT_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
> > -
> > -SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
> > -           file://run-ptest \
> > -           file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch \
> > -           file://0001-Remove-the-warning-about-deprecated-paths-in-sc=
hemas.patch \
> > -           file://0001-Install-gio-querymodules-as-libexec_PROGRAM.pat=
ch \
> > -           file://0010-Do-not-hardcode-python-path-into-various-tools.=
patch \
> > -           file://0001-Set-host_machine-correctly-when-building-with-m=
ingw3.patch \
> > -           file://0001-Do-not-write-bindir-into-pkg-config-files.patch=
 \
> > -           file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
> > -           file://0001-gio-tests-resources.c-comment-out-a-build-host-=
only-.patch \
> > -           file://0001-Switch-from-the-deprecated-distutils-module-to-=
the-p.patch \
> > -           file://memory-monitor.patch \
> > -           file://fix-regex.patch \
> > -           file://skip-timeout.patch \
> > -           "
> > -SRC_URI:append:class-native =3D " file://relocate-modules.patch \
> > -                                file://0001-meson.build-do-not-enable-=
pidfd-features-on-native-g.patch \
> > -                              "
> > -
> > -SRC_URI[sha256sum] =3D "24b8e0672dca120cc32d394bccb85844e732e04fe75d18=
bb0573b2dbc7548f63"
> > -
> > -# Find any meson cross files in FILESPATH that are relevant for the cu=
rrent
> > -# build (using siteinfo) and add them to EXTRA_OEMESON.
> > -inherit siteinfo
> > -def find_meson_cross_files(d):
> > -    if bb.data.inherits_class('native', d):
> > -        return ""
> > -
> > -    thisdir =3D os.path.normpath(d.getVar("THISDIR"))
> > -    import collections
> > -    sitedata =3D siteinfo_data(d)
> > -    # filename -> found
> > -    files =3D collections.OrderedDict()
> > -    for path in d.getVar("FILESPATH").split(":"):
> > -        for element in sitedata:
> > -            filename =3D os.path.normpath(os.path.join(path, "meson.cr=
oss.d", element))
> > -            sanitized_path =3D filename.replace(thisdir, "${THISDIR}")
> > -            if sanitized_path =3D=3D filename:
> > -                if os.path.exists(filename):
> > -                    bb.error("Cannot add '%s' to --cross-file, because=
 it's not relative to THISDIR '%s' and sstate signature would contain this =
full path" % (filename, thisdir))
> > -                continue
> > -            files[filename.replace(thisdir, "${THISDIR}")] =3D os.path=
.exists(filename)
> > -
> > -    items =3D ["--cross-file=3D" + k for k,v in files.items() if v]
> > -    d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
> > -    items =3D ["%s:%s" % (k, "True" if v else "False") for k,v in file=
s.items()]
> > -    d.appendVarFlag("do_configure", "file-checksums", " " + " ".join(i=
tems))
> > -
> > -python () {
> > -    find_meson_cross_files(d)
> > -}
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb b/meta/recip=
es-core/glib-2.0/glib-2.0_2.80.0.bb
> > new file mode 100644
> > index 00000000000..e22810a55bc
> > --- /dev/null
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.80.0.bb
> > @@ -0,0 +1 @@
> > +require glib.inc
> > diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/gl=
ib-2.0/glib.inc
> > index fac8875d844..692857892ff 100644
> > --- a/meta/recipes-core/glib-2.0/glib.inc
> > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > @@ -28,21 +28,25 @@ PACKAGES +=3D "${PN}-codegen ${PN}-utils"
> >
> >  LEAD_SONAME =3D "libglib-2.0.*"
> >
> > -inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-i=
s-even bash-completion gio-module-cache manpages gobject-introspection-data
> > -
> > -GTKDOC_MESON_OPTION =3D "gtk_doc"
> > +inherit meson gettext gi-docgen pkgconfig ptest-gnome upstream-version=
-is-even bash-completion gio-module-cache manpages gobject-introspection-da=
ta
> >
> >  S =3D "${WORKDIR}/glib-${PV}"
> >
> >  PACKAGECONFIG ??=3D "libmount \
> > +                   ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'in=
trospection', '', d)} \
> >                     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',=
 '', d)}"
> > +PACKAGECONFIG:class-native =3D ""
> > +
> >  PACKAGECONFIG[libmount] =3D "-Dlibmount=3Denabled,-Dlibmount=3Ddisable=
d,util-linux"
> > -PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue, -Dman=3Dfalse, libxslt-nati=
ve xmlto-native"
> > +PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue, -Dman=3Dfalse, python3-docu=
tils-native"
> >  PACKAGECONFIG[libelf] =3D "-Dlibelf=3Denabled,-Dlibelf=3Ddisabled,elfu=
tils"
> >  PACKAGECONFIG[tests] =3D "-Dinstalled_tests=3Dtrue,-Dinstalled_tests=
=3Dfalse,"
> >  PACKAGECONFIG[selinux] =3D "-Dselinux=3Denabled,-Dselinux=3Ddisabled,l=
ibselinux"
> > +PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,-Dintrospe=
ction=3Ddisabled,gobject-introspection-native gobject-introspection glib-2.=
0-initial"
> >
> > -EXTRA_OEMESON =3D "-Ddtrace=3Dfalse -Dsystemtap=3Dfalse"
> > +EXTRA_OEMESON =3D "-Ddtrace=3Dfalse -Dsystemtap=3Dfalse \
> > +    ${@'-Dgir_dir_prefix=3D${libdir}' if d.getVar('MULTILIBS') else ''=
} \
> > +"
> >
> >  do_configure:prepend() {
> >         sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus=
-2.0/codegen/gdbus-codegen.in
> > @@ -53,14 +57,16 @@ FILES:${PN} =3D "${libdir}/lib*${SOLIBS} \
> >                 ${libexecdir}/*gio-querymodules \
> >                 ${libexecdir}/*gio-launch-desktop \
> >                 ${datadir}/glib-2.0/dtds \
> > -               ${datadir}/glib-2.0/schemas"
> > -
> > +               ${datadir}/glib-2.0/schemas \
> > +               ${libdir}/girepository-*/*.typelib \
> > +"
> >  FILES:${PN}-dev +=3D "${libdir}/glib-2.0/include \
> >                      ${libdir}/gio/modules/lib*${SOLIBSDEV} \
> >                      ${libdir}/gio/modules/*.la \
> >                      ${datadir}/glib-2.0/gettext/po/Makefile.in.in \
> >                      ${datadir}/glib-2.0/schemas/gschema.dtd \
> >                      ${datadir}/glib-2.0/valgrind/glib.supp \
> > +                    ${datadir}/gir-*/*.gir ${libdir}/gir-*/*.gir \
> >                      ${datadir}/gettext/its"
> >  FILES:${PN}-dbg +=3D "${datadir}/glib-2.0/gdb ${datadir}/gdb"
> >  FILES:${PN}-codegen =3D "${datadir}/glib-2.0/codegen/*.py \
> > @@ -204,3 +210,57 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D "\
> >              locale-base-pl-pl.iso-8859-2 \
> >              locale-base-tr-tr \
> >             "
> > +
> > +PE =3D "1"
> > +
> > +SHRT_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
> > +
> > +SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
> > +           file://run-ptest \
> > +           file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch \
> > +           file://0001-Remove-the-warning-about-deprecated-paths-in-sc=
hemas.patch \
> > +           file://0001-Install-gio-querymodules-as-libexec_PROGRAM.pat=
ch \
> > +           file://0010-Do-not-hardcode-python-path-into-various-tools.=
patch \
> > +           file://0001-Set-host_machine-correctly-when-building-with-m=
ingw3.patch \
> > +           file://0001-Do-not-write-bindir-into-pkg-config-files.patch=
 \
> > +           file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
> > +           file://0001-gio-tests-resources.c-comment-out-a-build-host-=
only-.patch \
> > +           file://skip-timeout.patch \
> > +           file://0001-girepository-introspection-correctly-install-.g=
ir-fi.patch \
> > +           "
> > +SRC_URI:append:class-native =3D " file://relocate-modules.patch \
> > +                                file://0001-meson.build-do-not-enable-=
pidfd-features-on-native-g.patch \
> > +                              "
> > +
> > +SRC_URI[sha256sum] =3D "8228a92f92a412160b139ae68b6345bd28f24434a7b5af=
150ebe21ff587a561d"
> > +
> > +# Find any meson cross files in FILESPATH that are relevant for the cu=
rrent
> > +# build (using siteinfo) and add them to EXTRA_OEMESON.
> > +inherit siteinfo
> > +def find_meson_cross_files(d):
> > +    if bb.data.inherits_class('native', d):
> > +        return ""
> > +
> > +    thisdir =3D os.path.normpath(d.getVar("THISDIR"))
> > +    import collections
> > +    sitedata =3D siteinfo_data(d)
> > +    # filename -> found
> > +    files =3D collections.OrderedDict()
> > +    for path in d.getVar("FILESPATH").split(":"):
> > +        for element in sitedata:
> > +            filename =3D os.path.normpath(os.path.join(path, "meson.cr=
oss.d", element))
> > +            sanitized_path =3D filename.replace(thisdir, "${THISDIR}")
> > +            if sanitized_path =3D=3D filename:
> > +                if os.path.exists(filename):
> > +                    bb.error("Cannot add '%s' to --cross-file, because=
 it's not relative to THISDIR '%s' and sstate signature would contain this =
full path" % (filename, thisdir))
> > +                continue
> > +            files[filename.replace(thisdir, "${THISDIR}")] =3D os.path=
.exists(filename)
> > +
> > +    items =3D ["--cross-file=3D" + k for k,v in files.items() if v]
> > +    d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
> > +    items =3D ["%s:%s" % (k, "True" if v else "False") for k,v in file=
s.items()]
> > +    d.appendVarFlag("do_configure", "file-checksums", " " + " ".join(i=
tems))
> > +
> > +python () {
> > +    find_meson_cross_files(d)
> > +}
> > diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspec=
tion/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/=
recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the=
-repository-directory-for-native-builds.patch
> > index c9e1afffd0f..510bc426d1b 100644
> > --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/00=
01-Relocate-the-repository-directory-for-native-builds.patch
> > +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/00=
01-Relocate-the-repository-directory-for-native-builds.patch
> > @@ -1,4 +1,4 @@
> > -From aeb5532f8be42d42f4e8725ca42e239b36983a4d Mon Sep 17 00:00:00 2001
> > +From 4e1aa0ddbc43403ff24f644b4c4912b737290c41 Mon Sep 17 00:00:00 2001
> >  From: Sascha Silbe <x-yo17@se-silbe.de>
> >  Date: Fri, 8 Jun 2018 13:55:10 +0200
> >  Subject: [PATCH] Relocate the repository directory for native builds
> > @@ -14,14 +14,13 @@ cache or sstate mirror).
> >
> >  Upstream-Status: Inappropriate
> >  Signed-off-by: Sascha Silbe <x-yo17@se-silbe.de>
> > -
> >  ---
> >   girepository/girepository.c | 15 +++++++++++++--
> >   girepository/meson.build    |  2 +-
> >   2 files changed, 14 insertions(+), 3 deletions(-)
> >
> >  diff --git a/girepository/girepository.c b/girepository/girepository.c
> > -index a0754f4..2d456f9 100644
> > +index 12eaf36..876382c 100644
> >  --- a/girepository/girepository.c
> >  +++ b/girepository/girepository.c
> >  @@ -21,6 +21,8 @@
> > @@ -42,7 +41,7 @@ index a0754f4..2d456f9 100644
> >   /**
> >    * SECTION:girepository
> >    * @short_description: GObject Introspection repository manager
> > -@@ -215,9 +219,16 @@ init_globals (void)
> > +@@ -222,9 +226,16 @@ init_globals (void)
> >             g_free (custom_dirs);
> >           }
> >
> > @@ -62,10 +61,10 @@ index a0754f4..2d456f9 100644
> >         typelib_search_path =3D g_slist_prepend (typelib_search_path, t=
ypelib_dir);
> >
> >  diff --git a/girepository/meson.build b/girepository/meson.build
> > -index 786749a..15cf2a9 100644
> > +index 5ced59e..a580d9b 100644
> >  --- a/girepository/meson.build
> >  +++ b/girepository/meson.build
> > -@@ -45,7 +45,7 @@ girepo_internals_lib =3D static_library('girepositor=
y-internals',
> > +@@ -47,7 +47,7 @@ girepo_internals_lib =3D static_library('girepositor=
y-internals',
> >     ],
> >     c_args: gi_hidden_visibility_cflags + custom_c_args,
> >     include_directories : configinc,
> > diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspec=
tion_1.78.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspec=
tion_1.80.1.bb
> > similarity index 96%
> > rename from meta/recipes-gnome/gobject-introspection/gobject-introspect=
ion_1.78.1.bb
> > rename to meta/recipes-gnome/gobject-introspection/gobject-introspectio=
n_1.80.1.bb
> > index 05a08a50e08..582ac248fda 100644
> > --- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.=
78.1.bb
> > +++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.=
80.1.bb
> > @@ -16,7 +16,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc434e8128a=
68bedd59b80b2ac1eb1c4a \
> >  SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", =
2)}/${BPN}-${PV}.tar.xz \
> >             "
> >
> > -SRC_URI[sha256sum] =3D "bd7babd99af7258e76819e45ba4a6bc399608fe762d83f=
de3cac033c50841bb4"
> > +SRC_URI[sha256sum] =3D "a1df7c424e15bda1ab639c00e9051b9adf5cea1a9e512f=
8a603b53cd199bc6d8"
> >
> >  SRC_URI:append:class-native =3D " file://0001-Relocate-the-repository-=
directory-for-native-builds.patch"
> >
> > @@ -26,7 +26,9 @@ GTKDOC_MESON_OPTION =3D "gtk_doc"
> >
> >  MULTILIB_SCRIPTS =3D "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bin=
dir}/g-ir-scanner"
> >
> > -DEPENDS +=3D " libffi zlib glib-2.0 python3 flex-native bison-native"
> > +DEPENDS +=3D " libffi zlib python3 flex-native bison-native"
> > +DEPENDS:append:class-native =3D " glib-2.0"
> > +DEPENDS:append:class-target =3D " glib-2.0-initial"
> >
> >  # target build needs qemu to run temporary introspection binaries crea=
ted
> >  # on the fly by g-ir-scanner and a native version of itself to run
> > @@ -189,6 +191,6 @@ FILES:${PN}-dbg +=3D "${libdir}/gobject-introspecti=
on/giscanner/.debug/"
> >  FILES:${PN}-staticdev +=3D "${libdir}/gobject-introspection/giscanner/=
*.a"
> >
> >  # setuptools can be removed when upstream removes all uses of distutil=
s
> > -RDEPENDS:${PN} =3D "python3-pickle python3-xml python3-setuptools"
> > +RDEPENDS:${PN} =3D "python3-pickle python3-xml python3-setuptools glib=
-2.0"
> >
> >  BBCLASSEXTEND =3D "native"
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#198616): https://lists.openembedded.org/g/openembed=
ded-core/message/198616
> > Mute This Topic: https://lists.openembedded.org/mt/105687645/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

