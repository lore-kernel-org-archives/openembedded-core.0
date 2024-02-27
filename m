Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D12C54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:39:40 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.10348.1709033979236378373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 03:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NtD6ejSI;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5129e5b8cecso5076479e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 03:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709033977; x=1709638777; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MMd8xThRowdTVrch0U0A29uL2HSUzEhz+xTeV0Oi5k=;
        b=NtD6ejSI9NKJ7bMzHhP5EO7HlSiRdth9QNp9HOSQ1BB+C5GEqJWXYYpWAcOgerZUAn
         HAhoELe2Uw6fnZkniVR3hKJ8MUhUeez/7nQFFLfMKRgfFiRnRQmo9517p7ikoysap248
         ycEygSXcN4IQgGSvVyr2KZHK2mxQlUo7JB/fX2ipn0iKCQeUuU+7PIS/LlfSHF1UM2Mh
         OZ0qBEOZuXJ00PILa7W4VuBX7EqmMnO8xlsisVj6/Y5/cxcO0mSNckRQ7U+bMqZPRzgb
         jA3DCLeO73vIm3zVowyS1T1fFl/02H38oUQKqMqvdf8WsVGWWOSGC0dpgor/oxzQxXeb
         LKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033977; x=1709638777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MMd8xThRowdTVrch0U0A29uL2HSUzEhz+xTeV0Oi5k=;
        b=jEEFzZfavkwqC+SXgBj7LWI5saiScoxrX7GIfO5d3W5zsbVwOZkjiq0QNeOz0Qy1ka
         P/ZrEvnvp9qhIZpfvcaQBRGnKKGfbDM7L7jVwXm+o5rqGG2jd5FscIeaG905VHr2JqNe
         byWqXMIH7FSashT2lT3owhb6Drv1OPK+UKtt3gpKn1FIuxJHQZcI1cJWVFn2VRjf676t
         HWIEZXv07oc3iQTt02L8TAzEDRGCZJLuwG4klL0ypFnPH7imTGtS8U8JYJD+UVdjKGCW
         p1aLzNFqlqGgpu9p5678Q4RXTbkuUlLWysCEF5F1JYcKYxvbe8yk383NdjEzKe8pGOh+
         23kg==
X-Forwarded-Encrypted: i=1; AJvYcCXP8FzF68enje45qRbS+9ICRalpC6j0TjtPMdpF6VNgMhota7XL9pIjgYqoDzTGIRsxT1Y7iupkAo3zMJcphfHxOKu6LkDFEJqbsUjwvtVk0XpnQXMJXipP
X-Gm-Message-State: AOJu0YwV+/AWlk5UhxtiiP7ATx5FFwu9Fr8Zw9N2hGss1BtW7OMhgE6Q
	WA/G8zQZASb38ZnvJEofqzuO8sB0bJLNkmpezL2/5S29+ExpXo5aNPWcVh1+fuAjk6JtqV90sKD
	skTxiuZISxqsmlfPpESvLUMXpfEQ=
X-Google-Smtp-Source: AGHT+IGmepjDPB/eyBkYs9E1TNoCM4+gWvE4U132OMpmdy5YjE/bwLH4VFmr5n8HWEQuU+B8XEIa+SaI4IsLpwffLvQ=
X-Received: by 2002:a05:6512:1187:b0:512:bce5:1e0f with SMTP id
 g7-20020a056512118700b00512bce51e0fmr5334732lfr.64.1709033977135; Tue, 27 Feb
 2024 03:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20240225093726.1113403-1-martin.jansa@gmail.com>
 <CAMKF1sr1SVSnAZ2_ZCTHfMyM8i01msDQ+81M5h+Bb9zmKGPLCw@mail.gmail.com> <17B78F10F29044A4.14830@lists.openembedded.org>
In-Reply-To: <17B78F10F29044A4.14830@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Feb 2024 12:39:21 +0100
Message-ID: <CA+chaQfh47nRBVAjhxpo1xeXWkmw-vHf8Jk-MWX6Npn4GfyGXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: backport a switch from distutils to
 packaging in codegen
To: martin.jansa@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 11:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196264

Yes, it was reproducible on my host gentoo after removing distutils
with dev-python/setuptools (and for updated glib-2.0-native after
removing dev-python/packaging)

Fixes sent:
https://patchwork.yoctoproject.org/project/oe/patch/20240227113711.834767-1=
-martin.jansa@gmail.com/
https://patchwork.yoctoproject.org/project/oe/patch/20240227113711.834767-2=
-martin.jansa@gmail.com/

Cheers,

On Tue, Feb 27, 2024 at 12:58=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Thanks Khem, will try to reproduce tomorrow. Maybe these don't use
> CODEGEN_PYTHON_RDEPENDS.
>
> With this patch backported to kirkstone I've seen glib-2.0-native
> failing with the same issue as python3native there doesn't include
> python3-packaging.
>
> Maybe these recipes aren't using python3native and were depending on
> packaging from host, will debug tomorrow.
>
> On Tue, Feb 27, 2024 at 12:16=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wr=
ote:
> >
> > I am seeing some build failures which seems to be related to this patch
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3657/=
steps/15/logs/stdio
> >
> >  |   File "/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/co=
re2-64-poky-linux/gattlib/0.2+git/recipe-sysroot-native/usr/share/glib-2.0/=
codegen/utils.py",
> > line 22, in <module>
> >     |     import packaging.version
> >     | ModuleNotFoundError: No module named 'packaging'
> >
> >
> >
> >   |   File "/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/c=
ore2-64-poky-linux/networkmanager-fortisslvpn/1.4.0/recipe-sysroot-native/u=
sr/share/glib-2.0/codegen/utils.py",
> > line 22, in <module>
> >     |     import packaging.version
> >     | ModuleNotFoundError: No module named 'packaging'
> >     | make: *** [Makefile:2081: src/nm-fortisslvpn-pppd-service-dbus.h]=
 Error 1
> >
> >
> > On Sun, Feb 25, 2024 at 1:37=E2=80=AFAM Martin Jansa <martin.jansa@gmai=
l.com> wrote:
> > >
> > > * to fix build on hosts with python-3.12, now it fails with:
> > >
> > > Traceback (most recent call last):
> > >   File "recipe-sysroot-native/usr/bin/gdbus-codegen", line 53, in <mo=
dule>
> > >     from codegen import codegen_main
> > >   File "recipe-sysroot-native/usr/share/glib-2.0/codegen/codegen_main=
.py", line 29, in <module>
> > >     from . import dbustypes
> > >   File "recipe-sysroot-native/usr/share/glib-2.0/codegen/dbustypes.py=
", line 22, in <module>
> > >     from . import utils
> > >   File "recipe-sysroot-native/usr/share/glib-2.0/codegen/utils.py", l=
ine 22, in <module>
> > >     import distutils.version
> > > ModuleNotFoundError: No module named 'distutils'
> > > CMake Error at CMakeLists.txt:90 (message):
> > >   Error in generating code for connman interface using gdbus-codegen
> > >
> > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > ---
> > >  ...deprecated-distutils-module-to-the-p.patch | 34 +++++++++++++++++=
++
> > >  meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb |  1 +
> > >  meta/recipes-core/glib-2.0/glib.inc           |  4 +--
> > >  3 files changed, 36 insertions(+), 3 deletions(-)
> > >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-f=
rom-the-deprecated-distutils-module-to-the-p.patch
> > >
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the=
-deprecated-distutils-module-to-the-p.patch b/meta/recipes-core/glib-2.0/gl=
ib-2.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
> > > new file mode 100644
> > > index 0000000000..50368ed22c
> > > --- /dev/null
> > > +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprec=
ated-distutils-module-to-the-p.patch
> > > @@ -0,0 +1,34 @@
> > > +From 05f0674c93d94fe6b29c1b707980aac469ddcd72 Mon Sep 17 00:00:00 20=
01
> > > +From: Jordan Williams <jordan@jwillikers.com>
> > > +Date: Fri, 1 Dec 2023 09:53:50 -0600
> > > +Subject: [PATCH] Switch from the deprecated distutils module to the =
packaging
> > > + module
> > > +
> > > +The distutils module was removed in Python 3.12.
> > > +
> > > +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/com=
mit/6ef967a0f930ce37a8c9b5aff969693b34714291]
> > > +
> > > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > +---
> > > + gio/gdbus-2.0/codegen/utils.py | 4 ++--
> > > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > > +
> > > +diff --git a/gio/gdbus-2.0/codegen/utils.py b/gio/gdbus-2.0/codegen/=
utils.py
> > > +index 0204610..08f1ba9 100644
> > > +--- a/gio/gdbus-2.0/codegen/utils.py
> > > ++++ b/gio/gdbus-2.0/codegen/utils.py
> > > +@@ -19,7 +19,7 @@
> > > + #
> > > + # Author: David Zeuthen <davidz@redhat.com>
> > > +
> > > +-import distutils.version
> > > ++import packaging.version
> > > + import os
> > > + import sys
> > > +
> > > +@@ -166,4 +166,4 @@ def version_cmp_key(key):
> > > +         v =3D str(key[0])
> > > +     else:
> > > +         v =3D "0"
> > > +-    return (distutils.version.LooseVersion(v), key[1])
> > > ++    return (packaging.version.Version(v), key[1])
> > > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb b/meta/rec=
ipes-core/glib-2.0/glib-2.0_2.78.3.bb
> > > index 42814ba544..6c3e99c641 100644
> > > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
> > > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
> > > @@ -14,6 +14,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-=
${PV}.tar.xz \
> > >             file://0001-Do-not-write-bindir-into-pkg-config-files.pat=
ch \
> > >             file://0001-meson-Run-atomics-test-on-clang-as-well.patch=
 \
> > >             file://0001-gio-tests-resources.c-comment-out-a-build-hos=
t-only-.patch \
> > > +           file://0001-Switch-from-the-deprecated-distutils-module-t=
o-the-p.patch \
> > >             file://memory-monitor.patch \
> > >             file://native-gtkdoc.patch \
> > >             "
> > > diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/=
glib-2.0/glib.inc
> > > index 5a57549d85..fac8875d84 100644
> > > --- a/meta/recipes-core/glib-2.0/glib.inc
> > > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > > @@ -144,9 +144,7 @@ do_install:append:mingw32() {
> > >          rm -f ${D}${bindir}/gtester-report
> > >  }
> > >
> > > -# remove setuptools dependency when usage of distutils is dropped in
> > > -# https://gitlab.gnome.org/GNOME/glib/-/blob/main/gio/gdbus-2.0/code=
gen/utils.py
> > > -CODEGEN_PYTHON_RDEPENDS =3D "python3 python3-setuptools python3-xml"
> > > +CODEGEN_PYTHON_RDEPENDS =3D "python3 python3-packaging python3-xml"
> > >  CODEGEN_PYTHON_RDEPENDS:mingw32 =3D ""
> > >
> > >  RDEPENDS:${PN}-codegen +=3D "${CODEGEN_PYTHON_RDEPENDS}"
> > > --
> > > 2.43.2
> > >
> > >
> > >
> > >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196235): https://lists.openembedded.org/g/openembedde=
d-core/message/196235
> Mute This Topic: https://lists.openembedded.org/mt/104560766/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

