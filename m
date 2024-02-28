Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E9DC54E58
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 18:30:47 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.4492.1709145043043377434
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 10:30:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l3raxNHk;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-22008177fbeso2524381fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 10:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709145042; x=1709749842; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTHP2CT+1RBXsxJE4iUODfhJc1ElNOqGkLPGG/qRA7c=;
        b=l3raxNHklUkSxQBBivc9w0gNkyK4AXDTQQLfknu6VDjsNHdsvpNCBOBqMuSBg22uwv
         cXwwQixHmU0Sx1lIlTz7qYhglcR9PCld7p+DzDLbL7BUSkW5Unc0v90vmVhZ3tLKXi+y
         9OTcQq61tVQtv4HSoEBsLosCfdyzDlKgqS4NFSGNuFbhukJIhtpLqohXLVH0EiCQ47Ta
         89NdUEHgDBiLpktxpto4hArlPEKvohQo8QRxUs5x6Of09PEpIhkk3fpuF7YEw7Mmm4ke
         Vs5mL4O6ShqmZFMMVzv9VAqBG5falSdqQ8hVvqMMj/LKYHQamw1BKTGAj733tpWXWg8s
         sRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709145042; x=1709749842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eTHP2CT+1RBXsxJE4iUODfhJc1ElNOqGkLPGG/qRA7c=;
        b=Pjsb1nV0FxO4Lw+1EMWP6iXZQ6s6KjZ0/v6XeT4bRVlSWhYKUZSutx+A33eAax1vlz
         r7QDMtI1mtN/kLTzp3mco/AHH8HikSC3+AAHMYR3Tk1m7adSJZ6gaRI7yra32YIJY+mo
         a41vX25ZwwixfOk/FRxhF3BcJ8rzOC+ZEP7/cbq9Ms0FFGKbHqwMYjtVD9V2a4ec5zrn
         RENSWP8ccYN1vHvl8ozncruiSLgA+jNdj2cMIVeVeY+tcXnlfXvPWo9WTXWX3S4VIS2m
         hstGn3gZ/k33uFVruc0yoeq6CjtoPToPXwRNKlZId3xuwyhc6svXq9O9AK6CzwSXXjpU
         tCbQ==
X-Gm-Message-State: AOJu0YziZkIcy+BWqRAFY7s0o+fZzoqsJpkuwse6wbX9iv3llGZyrtm7
	ezoxsw59fSk4BT8ZUGChKBnbWLi7SQOd/TfuzpUE2FfVltWzwYd0e06Q2BME8Vl0fvGkvd3ZKUV
	08waN29vDQd+nujX+wIFP2c/RRMw=
X-Google-Smtp-Source: AGHT+IE85gfI21fta30jZwRo3tWco7cULtEThaIj42nfeie0emKWegPjpIAyG3sPe7JOza5gYZ49Q5M7kVpVf00QXqE=
X-Received: by 2002:a05:6870:718e:b0:220:866f:dab7 with SMTP id
 d14-20020a056870718e00b00220866fdab7mr545377oah.48.1709145042127; Wed, 28 Feb
 2024 10:30:42 -0800 (PST)
MIME-Version: 1.0
References: <20240225093726.1113403-1-martin.jansa@gmail.com>
 <CAMKF1sr1SVSnAZ2_ZCTHfMyM8i01msDQ+81M5h+Bb9zmKGPLCw@mail.gmail.com>
 <17B78F10F29044A4.14830@lists.openembedded.org> <CA+chaQfh47nRBVAjhxpo1xeXWkmw-vHf8Jk-MWX6Npn4GfyGXw@mail.gmail.com>
In-Reply-To: <CA+chaQfh47nRBVAjhxpo1xeXWkmw-vHf8Jk-MWX6Npn4GfyGXw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Feb 2024 10:30:16 -0800
Message-ID: <CAMKF1sroBXyZwPqLyehFLD36orrh7fC3Z5A_b98863-5hbRFxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: backport a switch from distutils to
 packaging in codegen
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 18:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196404

some more failures in meta-openembedded layers ( meta-xfce)

https://errors.yoctoproject.org/Errors/Details/754995/
https://errors.yoctoproject.org/Errors/Details/754996/

On Tue, Feb 27, 2024 at 3:39=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> Yes, it was reproducible on my host gentoo after removing distutils
> with dev-python/setuptools (and for updated glib-2.0-native after
> removing dev-python/packaging)
>
> Fixes sent:
> https://patchwork.yoctoproject.org/project/oe/patch/20240227113711.834767=
-1-martin.jansa@gmail.com/
> https://patchwork.yoctoproject.org/project/oe/patch/20240227113711.834767=
-2-martin.jansa@gmail.com/
>
> Cheers,
>
> On Tue, Feb 27, 2024 at 12:58=E2=80=AFAM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Thanks Khem, will try to reproduce tomorrow. Maybe these don't use
> > CODEGEN_PYTHON_RDEPENDS.
> >
> > With this patch backported to kirkstone I've seen glib-2.0-native
> > failing with the same issue as python3native there doesn't include
> > python3-packaging.
> >
> > Maybe these recipes aren't using python3native and were depending on
> > packaging from host, will debug tomorrow.
> >
> > On Tue, Feb 27, 2024 at 12:16=E2=80=AFAM Khem Raj <raj.khem@gmail.com> =
wrote:
> > >
> > > I am seeing some build failures which seems to be related to this pat=
ch
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/365=
7/steps/15/logs/stdio
> > >
> > >  |   File "/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/=
core2-64-poky-linux/gattlib/0.2+git/recipe-sysroot-native/usr/share/glib-2.=
0/codegen/utils.py",
> > > line 22, in <module>
> > >     |     import packaging.version
> > >     | ModuleNotFoundError: No module named 'packaging'
> > >
> > >
> > >
> > >   |   File "/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work=
/core2-64-poky-linux/networkmanager-fortisslvpn/1.4.0/recipe-sysroot-native=
/usr/share/glib-2.0/codegen/utils.py",
> > > line 22, in <module>
> > >     |     import packaging.version
> > >     | ModuleNotFoundError: No module named 'packaging'
> > >     | make: *** [Makefile:2081: src/nm-fortisslvpn-pppd-service-dbus.=
h] Error 1
> > >
> > >
> > > On Sun, Feb 25, 2024 at 1:37=E2=80=AFAM Martin Jansa <martin.jansa@gm=
ail.com> wrote:
> > > >
> > > > * to fix build on hosts with python-3.12, now it fails with:
> > > >
> > > > Traceback (most recent call last):
> > > >   File "recipe-sysroot-native/usr/bin/gdbus-codegen", line 53, in <=
module>
> > > >     from codegen import codegen_main
> > > >   File "recipe-sysroot-native/usr/share/glib-2.0/codegen/codegen_ma=
in.py", line 29, in <module>
> > > >     from . import dbustypes
> > > >   File "recipe-sysroot-native/usr/share/glib-2.0/codegen/dbustypes.=
py", line 22, in <module>
> > > >     from . import utils
> > > >   File "recipe-sysroot-native/usr/share/glib-2.0/codegen/utils.py",=
 line 22, in <module>
> > > >     import distutils.version
> > > > ModuleNotFoundError: No module named 'distutils'
> > > > CMake Error at CMakeLists.txt:90 (message):
> > > >   Error in generating code for connman interface using gdbus-codege=
n
> > > >
> > > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > > ---
> > > >  ...deprecated-distutils-module-to-the-p.patch | 34 +++++++++++++++=
++++
> > > >  meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb |  1 +
> > > >  meta/recipes-core/glib-2.0/glib.inc           |  4 +--
> > > >  3 files changed, 36 insertions(+), 3 deletions(-)
> > > >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Switch=
-from-the-deprecated-distutils-module-to-the-p.patch
> > > >
> > > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-t=
he-deprecated-distutils-module-to-the-p.patch b/meta/recipes-core/glib-2.0/=
glib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
> > > > new file mode 100644
> > > > index 0000000000..50368ed22c
> > > > --- /dev/null
> > > > +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-depr=
ecated-distutils-module-to-the-p.patch
> > > > @@ -0,0 +1,34 @@
> > > > +From 05f0674c93d94fe6b29c1b707980aac469ddcd72 Mon Sep 17 00:00:00 =
2001
> > > > +From: Jordan Williams <jordan@jwillikers.com>
> > > > +Date: Fri, 1 Dec 2023 09:53:50 -0600
> > > > +Subject: [PATCH] Switch from the deprecated distutils module to th=
e packaging
> > > > + module
> > > > +
> > > > +The distutils module was removed in Python 3.12.
> > > > +
> > > > +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/c=
ommit/6ef967a0f930ce37a8c9b5aff969693b34714291]
> > > > +
> > > > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > > +---
> > > > + gio/gdbus-2.0/codegen/utils.py | 4 ++--
> > > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > > +
> > > > +diff --git a/gio/gdbus-2.0/codegen/utils.py b/gio/gdbus-2.0/codege=
n/utils.py
> > > > +index 0204610..08f1ba9 100644
> > > > +--- a/gio/gdbus-2.0/codegen/utils.py
> > > > ++++ b/gio/gdbus-2.0/codegen/utils.py
> > > > +@@ -19,7 +19,7 @@
> > > > + #
> > > > + # Author: David Zeuthen <davidz@redhat.com>
> > > > +
> > > > +-import distutils.version
> > > > ++import packaging.version
> > > > + import os
> > > > + import sys
> > > > +
> > > > +@@ -166,4 +166,4 @@ def version_cmp_key(key):
> > > > +         v =3D str(key[0])
> > > > +     else:
> > > > +         v =3D "0"
> > > > +-    return (distutils.version.LooseVersion(v), key[1])
> > > > ++    return (packaging.version.Version(v), key[1])
> > > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb b/meta/r=
ecipes-core/glib-2.0/glib-2.0_2.78.3.bb
> > > > index 42814ba544..6c3e99c641 100644
> > > > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
> > > > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
> > > > @@ -14,6 +14,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/gli=
b-${PV}.tar.xz \
> > > >             file://0001-Do-not-write-bindir-into-pkg-config-files.p=
atch \
> > > >             file://0001-meson-Run-atomics-test-on-clang-as-well.pat=
ch \
> > > >             file://0001-gio-tests-resources.c-comment-out-a-build-h=
ost-only-.patch \
> > > > +           file://0001-Switch-from-the-deprecated-distutils-module=
-to-the-p.patch \
> > > >             file://memory-monitor.patch \
> > > >             file://native-gtkdoc.patch \
> > > >             "
> > > > diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-cor=
e/glib-2.0/glib.inc
> > > > index 5a57549d85..fac8875d84 100644
> > > > --- a/meta/recipes-core/glib-2.0/glib.inc
> > > > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > > > @@ -144,9 +144,7 @@ do_install:append:mingw32() {
> > > >          rm -f ${D}${bindir}/gtester-report
> > > >  }
> > > >
> > > > -# remove setuptools dependency when usage of distutils is dropped =
in
> > > > -# https://gitlab.gnome.org/GNOME/glib/-/blob/main/gio/gdbus-2.0/co=
degen/utils.py
> > > > -CODEGEN_PYTHON_RDEPENDS =3D "python3 python3-setuptools python3-xm=
l"
> > > > +CODEGEN_PYTHON_RDEPENDS =3D "python3 python3-packaging python3-xml=
"
> > > >  CODEGEN_PYTHON_RDEPENDS:mingw32 =3D ""
> > > >
> > > >  RDEPENDS:${PN}-codegen +=3D "${CODEGEN_PYTHON_RDEPENDS}"
> > > > --
> > > > 2.43.2
> > > >
> > > >
> > > >
> > > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#196235): https://lists.openembedded.org/g/openembed=
ded-core/message/196235
> > Mute This Topic: https://lists.openembedded.org/mt/104560766/3617156
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

