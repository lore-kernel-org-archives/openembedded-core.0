Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DBB8C5478C
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 23:58:07 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.953.1708991886202810722
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 15:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hcBINs+R;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d754746c3so2495232f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 15:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708991885; x=1709596685; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zns4mgGlUwexpCvDshMX1le23eK96JAv6vRbi0J/sWI=;
        b=hcBINs+RuQ6khe2kPdC0AA5EynSM2Zc5R73for7oQxgy/uve/m2QimHK3Ggx0z+4kB
         TubqKNcYikMpLiSwv0eSkYlfJhx2JxJxoyfdeaTP9F1ZtP32vTtyRlb6RGW5mVqyh7b3
         MKZTafqFnKD7Qi4pqm2vtAusp1/uUJlw7FF5fSdEHEbICyjsaL9FkixU4Vd2sGKftJs3
         UWL9DY+QdAAY3ncZNOQ7PEAL2Pjt7jHToIQLGvUHZZYoa1LVZKW03JMmJ+MuE01aLqkr
         BVS9dTzndjc+ikbh3drWGV+ZZZfwEZH8wHeRaHEcslKrIrcqy9XGMVctyybBa9Zxs+yM
         +h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708991885; x=1709596685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zns4mgGlUwexpCvDshMX1le23eK96JAv6vRbi0J/sWI=;
        b=Cogt2wacdqGAjRApf4UHxn3jYgFTedaswwIAf1sICI68om9GHen6mWXBvyHMaTcU12
         GEmafviymk0SA2ftwYz5n0ER1T5bdvH+QJDOF0ETWDQ0ZfX3Dn+rTu5It5kOaXiEMxKi
         ZU6i4NmBGM1b2NI4e6tAEcytYlzieMjsSXtW76cqKG5ShbsAoecQDpmqXZLG2L/IHcFW
         lygX0pjw07nsteVsa7frFCKxf8Qfqs4Ieg4yo3PXasavOjSFLcsgip12wi8m6FWQFgAh
         TM6D9NCBUOgOMW7VxHOfaw5o09RyQS896IPz2q/eewFxWl9bjsSdxnBMTe1+y7VWsdGt
         bPtw==
X-Gm-Message-State: AOJu0Yz1dcxz6kahDrWDRPjy4aABOxsBmcrmo8XUK5bbeiTLXEzG1Z3a
	9fT63p7mT8ig776BubMUquCkS3r67LovzWHGkHR9E4xKzGbh16WO4gR9X7Uohl8pDBGfMBKvjXr
	Kki26vvmIzS2GUFm2M/vnlR+ZGYc=
X-Google-Smtp-Source: AGHT+IGujpIbWY1GqZhQHvF8vpp+9fjl8940dY2q0y7qcMCDDuWyPVaJHKbI3eE5T7JCsbyj3pa7/qZMHIfdip2oe2M=
X-Received: by 2002:a5d:4b4f:0:b0:33d:81ca:532e with SMTP id
 w15-20020a5d4b4f000000b0033d81ca532emr6474477wrs.47.1708991884460; Mon, 26
 Feb 2024 15:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20240225093726.1113403-1-martin.jansa@gmail.com> <CAMKF1sr1SVSnAZ2_ZCTHfMyM8i01msDQ+81M5h+Bb9zmKGPLCw@mail.gmail.com>
In-Reply-To: <CAMKF1sr1SVSnAZ2_ZCTHfMyM8i01msDQ+81M5h+Bb9zmKGPLCw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Feb 2024 00:57:52 +0100
Message-ID: <CA+chaQfJVOJa5M15=wViR0hPwOY=d9Ex+0JVLcWapm0E_Xsz9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: backport a switch from distutils to
 packaging in codegen
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 23:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196235

Thanks Khem, will try to reproduce tomorrow. Maybe these don't use
CODEGEN_PYTHON_RDEPENDS.

With this patch backported to kirkstone I've seen glib-2.0-native
failing with the same issue as python3native there doesn't include
python3-packaging.

Maybe these recipes aren't using python3native and were depending on
packaging from host, will debug tomorrow.

On Tue, Feb 27, 2024 at 12:16=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> I am seeing some build failures which seems to be related to this patch
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3657/st=
eps/15/logs/stdio
>
>  |   File "/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core=
2-64-poky-linux/gattlib/0.2+git/recipe-sysroot-native/usr/share/glib-2.0/co=
degen/utils.py",
> line 22, in <module>
>     |     import packaging.version
>     | ModuleNotFoundError: No module named 'packaging'
>
>
>
>   |   File "/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/cor=
e2-64-poky-linux/networkmanager-fortisslvpn/1.4.0/recipe-sysroot-native/usr=
/share/glib-2.0/codegen/utils.py",
> line 22, in <module>
>     |     import packaging.version
>     | ModuleNotFoundError: No module named 'packaging'
>     | make: *** [Makefile:2081: src/nm-fortisslvpn-pppd-service-dbus.h] E=
rror 1
>
>
> On Sun, Feb 25, 2024 at 1:37=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com> wrote:
> >
> > * to fix build on hosts with python-3.12, now it fails with:
> >
> > Traceback (most recent call last):
> >   File "recipe-sysroot-native/usr/bin/gdbus-codegen", line 53, in <modu=
le>
> >     from codegen import codegen_main
> >   File "recipe-sysroot-native/usr/share/glib-2.0/codegen/codegen_main.p=
y", line 29, in <module>
> >     from . import dbustypes
> >   File "recipe-sysroot-native/usr/share/glib-2.0/codegen/dbustypes.py",=
 line 22, in <module>
> >     from . import utils
> >   File "recipe-sysroot-native/usr/share/glib-2.0/codegen/utils.py", lin=
e 22, in <module>
> >     import distutils.version
> > ModuleNotFoundError: No module named 'distutils'
> > CMake Error at CMakeLists.txt:90 (message):
> >   Error in generating code for connman interface using gdbus-codegen
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  ...deprecated-distutils-module-to-the-p.patch | 34 +++++++++++++++++++
> >  meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb |  1 +
> >  meta/recipes-core/glib-2.0/glib.inc           |  4 +--
> >  3 files changed, 36 insertions(+), 3 deletions(-)
> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-fro=
m-the-deprecated-distutils-module-to-the-p.patch
> >
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-d=
eprecated-distutils-module-to-the-p.patch b/meta/recipes-core/glib-2.0/glib=
-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
> > new file mode 100644
> > index 0000000000..50368ed22c
> > --- /dev/null
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecat=
ed-distutils-module-to-the-p.patch
> > @@ -0,0 +1,34 @@
> > +From 05f0674c93d94fe6b29c1b707980aac469ddcd72 Mon Sep 17 00:00:00 2001
> > +From: Jordan Williams <jordan@jwillikers.com>
> > +Date: Fri, 1 Dec 2023 09:53:50 -0600
> > +Subject: [PATCH] Switch from the deprecated distutils module to the pa=
ckaging
> > + module
> > +
> > +The distutils module was removed in Python 3.12.
> > +
> > +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commi=
t/6ef967a0f930ce37a8c9b5aff969693b34714291]
> > +
> > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > +---
> > + gio/gdbus-2.0/codegen/utils.py | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gio/gdbus-2.0/codegen/utils.py b/gio/gdbus-2.0/codegen/ut=
ils.py
> > +index 0204610..08f1ba9 100644
> > +--- a/gio/gdbus-2.0/codegen/utils.py
> > ++++ b/gio/gdbus-2.0/codegen/utils.py
> > +@@ -19,7 +19,7 @@
> > + #
> > + # Author: David Zeuthen <davidz@redhat.com>
> > +
> > +-import distutils.version
> > ++import packaging.version
> > + import os
> > + import sys
> > +
> > +@@ -166,4 +166,4 @@ def version_cmp_key(key):
> > +         v =3D str(key[0])
> > +     else:
> > +         v =3D "0"
> > +-    return (distutils.version.LooseVersion(v), key[1])
> > ++    return (packaging.version.Version(v), key[1])
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb b/meta/recip=
es-core/glib-2.0/glib-2.0_2.78.3.bb
> > index 42814ba544..6c3e99c641 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
> > @@ -14,6 +14,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${=
PV}.tar.xz \
> >             file://0001-Do-not-write-bindir-into-pkg-config-files.patch=
 \
> >             file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
> >             file://0001-gio-tests-resources.c-comment-out-a-build-host-=
only-.patch \
> > +           file://0001-Switch-from-the-deprecated-distutils-module-to-=
the-p.patch \
> >             file://memory-monitor.patch \
> >             file://native-gtkdoc.patch \
> >             "
> > diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/gl=
ib-2.0/glib.inc
> > index 5a57549d85..fac8875d84 100644
> > --- a/meta/recipes-core/glib-2.0/glib.inc
> > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > @@ -144,9 +144,7 @@ do_install:append:mingw32() {
> >          rm -f ${D}${bindir}/gtester-report
> >  }
> >
> > -# remove setuptools dependency when usage of distutils is dropped in
> > -# https://gitlab.gnome.org/GNOME/glib/-/blob/main/gio/gdbus-2.0/codege=
n/utils.py
> > -CODEGEN_PYTHON_RDEPENDS =3D "python3 python3-setuptools python3-xml"
> > +CODEGEN_PYTHON_RDEPENDS =3D "python3 python3-packaging python3-xml"
> >  CODEGEN_PYTHON_RDEPENDS:mingw32 =3D ""
> >
> >  RDEPENDS:${PN}-codegen +=3D "${CODEGEN_PYTHON_RDEPENDS}"
> > --
> > 2.43.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#196136): https://lists.openembedded.org/g/openembed=
ded-core/message/196136
> > Mute This Topic: https://lists.openembedded.org/mt/104560766/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

