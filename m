Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3782FC5478C
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 23:16:47 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.8197.1708989397041656273
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 15:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jdWvxgKk;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-21f2f813e3bso1397086fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 15:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708989396; x=1709594196; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cjmvnet8AZxdhuK0kcMG4Dvf7lthmnYmBPQ/w4oaphQ=;
        b=jdWvxgKk9JS6ZjyLFtXxC4xyUhNClirrFOH3pHgDXbAQbcLK2pfQFmiVzAJ6Vjnblm
         rSDveRcK1/Hst4+tC2CpeBzT7/sNVghPmPuCgVyVfnLxx0okiPyhqpn+JwlmOFonm6+I
         d/Taa1Kzc2Np0DJBM4FwNl3RGR1uPtR23Cp9hCkibFNY8Nwp5tintv7Dm4AP1eUbs/G4
         GmN6mEUM4FIIQPv6Bf0wMHAIsmVtOE0ErDvRCBo7A837rKrMkfP9jIDs2yqag3zIfjm1
         p9s8y1gEWzH7qdUjXKlTI6YPyg9Y3jANAGs6qrCwWLHhTnh+07LewWtbJzwqJMHy7iV+
         Aq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708989396; x=1709594196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cjmvnet8AZxdhuK0kcMG4Dvf7lthmnYmBPQ/w4oaphQ=;
        b=uu6lU+T/s5umG/V0PeIKE6qe6PgSyWLwMxDQ1n2RgycYl5gF4wpgK24CLmYx3miM79
         tXrAYlKFVo4kCUdJS20sZfIRpTKnD7THv9m0VuSMKuH9JU/+Rix3mgh2VduaK6OazuI0
         5uHaxVpsL8XbB6Mrp1X02ZWWvytx5BziFFn/ypM/6DGszrO2cCQE7VjgLk5L2jNGsoGp
         3BWWQGfFpKbBNupAypWKFu4Sbol3VL42dAIsF7eAbhTIEwYpqZAH5e+gQZHe+5DDxC0g
         RDJo5oGGwgPTEealNr+qrxEmdykWSVZuTfjnCM4/VSMSbvbFbeySDY9sloVuXbwwquKR
         cb7g==
X-Gm-Message-State: AOJu0Yw+soY85zM63IKS8/JNhpUe90NcTLZmDVlXveRvcNk2U4Ox9zlK
	QjntzDNZectjWLrptwOFBnPsPp8SXYmgrWou9e05ukwRcRjhTTGrO2cLK6H3B2pW9vWJQqJhhFe
	6vBGIlBEQytJXGqaNabd/l5hEAjxv2oB0ciO9mg==
X-Google-Smtp-Source: AGHT+IEyxA+Mo5LqQJeR9cYQn1ocYNeL3D8D2Zh8+WJKJsdkffMlQ2WP5lSH2K1ybF8pXpV5MLG6nVJgNWjzdTrdx6U=
X-Received: by 2002:a05:6870:2049:b0:220:1da0:898a with SMTP id
 l9-20020a056870204900b002201da0898amr1313052oad.29.1708989396184; Mon, 26 Feb
 2024 15:16:36 -0800 (PST)
MIME-Version: 1.0
References: <20240225093726.1113403-1-martin.jansa@gmail.com>
In-Reply-To: <20240225093726.1113403-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Feb 2024 15:16:09 -0800
Message-ID: <CAMKF1sr1SVSnAZ2_ZCTHfMyM8i01msDQ+81M5h+Bb9zmKGPLCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: backport a switch from distutils to
 packaging in codegen
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 23:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196232

I am seeing some build failures which seems to be related to this patch

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3657/step=
s/15/logs/stdio

 |   File "/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-=
64-poky-linux/gattlib/0.2+git/recipe-sysroot-native/usr/share/glib-2.0/code=
gen/utils.py",
line 22, in <module>
    |     import packaging.version
    | ModuleNotFoundError: No module named 'packaging'



  |   File "/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2=
-64-poky-linux/networkmanager-fortisslvpn/1.4.0/recipe-sysroot-native/usr/s=
hare/glib-2.0/codegen/utils.py",
line 22, in <module>
    |     import packaging.version
    | ModuleNotFoundError: No module named 'packaging'
    | make: *** [Makefile:2081: src/nm-fortisslvpn-pppd-service-dbus.h] Err=
or 1


On Sun, Feb 25, 2024 at 1:37=E2=80=AFAM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> * to fix build on hosts with python-3.12, now it fails with:
>
> Traceback (most recent call last):
>   File "recipe-sysroot-native/usr/bin/gdbus-codegen", line 53, in <module=
>
>     from codegen import codegen_main
>   File "recipe-sysroot-native/usr/share/glib-2.0/codegen/codegen_main.py"=
, line 29, in <module>
>     from . import dbustypes
>   File "recipe-sysroot-native/usr/share/glib-2.0/codegen/dbustypes.py", l=
ine 22, in <module>
>     from . import utils
>   File "recipe-sysroot-native/usr/share/glib-2.0/codegen/utils.py", line =
22, in <module>
>     import distutils.version
> ModuleNotFoundError: No module named 'distutils'
> CMake Error at CMakeLists.txt:90 (message):
>   Error in generating code for connman interface using gdbus-codegen
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  ...deprecated-distutils-module-to-the-p.patch | 34 +++++++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb |  1 +
>  meta/recipes-core/glib-2.0/glib.inc           |  4 +--
>  3 files changed, 36 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-=
the-deprecated-distutils-module-to-the-p.patch
>
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-dep=
recated-distutils-module-to-the-p.patch b/meta/recipes-core/glib-2.0/glib-2=
.0/0001-Switch-from-the-deprecated-distutils-module-to-the-p.patch
> new file mode 100644
> index 0000000000..50368ed22c
> --- /dev/null
> +++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Switch-from-the-deprecated=
-distutils-module-to-the-p.patch
> @@ -0,0 +1,34 @@
> +From 05f0674c93d94fe6b29c1b707980aac469ddcd72 Mon Sep 17 00:00:00 2001
> +From: Jordan Williams <jordan@jwillikers.com>
> +Date: Fri, 1 Dec 2023 09:53:50 -0600
> +Subject: [PATCH] Switch from the deprecated distutils module to the pack=
aging
> + module
> +
> +The distutils module was removed in Python 3.12.
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
6ef967a0f930ce37a8c9b5aff969693b34714291]
> +
> +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> +---
> + gio/gdbus-2.0/codegen/utils.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gio/gdbus-2.0/codegen/utils.py b/gio/gdbus-2.0/codegen/util=
s.py
> +index 0204610..08f1ba9 100644
> +--- a/gio/gdbus-2.0/codegen/utils.py
> ++++ b/gio/gdbus-2.0/codegen/utils.py
> +@@ -19,7 +19,7 @@
> + #
> + # Author: David Zeuthen <davidz@redhat.com>
> +
> +-import distutils.version
> ++import packaging.version
> + import os
> + import sys
> +
> +@@ -166,4 +166,4 @@ def version_cmp_key(key):
> +         v =3D str(key[0])
> +     else:
> +         v =3D "0"
> +-    return (distutils.version.LooseVersion(v), key[1])
> ++    return (packaging.version.Version(v), key[1])
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.78.3.bb
> index 42814ba544..6c3e99c641 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.3.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV=
}.tar.xz \
>             file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
>             file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
>             file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
> +           file://0001-Switch-from-the-deprecated-distutils-module-to-th=
e-p.patch \
>             file://memory-monitor.patch \
>             file://native-gtkdoc.patch \
>             "
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index 5a57549d85..fac8875d84 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -144,9 +144,7 @@ do_install:append:mingw32() {
>          rm -f ${D}${bindir}/gtester-report
>  }
>
> -# remove setuptools dependency when usage of distutils is dropped in
> -# https://gitlab.gnome.org/GNOME/glib/-/blob/main/gio/gdbus-2.0/codegen/=
utils.py
> -CODEGEN_PYTHON_RDEPENDS =3D "python3 python3-setuptools python3-xml"
> +CODEGEN_PYTHON_RDEPENDS =3D "python3 python3-packaging python3-xml"
>  CODEGEN_PYTHON_RDEPENDS:mingw32 =3D ""
>
>  RDEPENDS:${PN}-codegen +=3D "${CODEGEN_PYTHON_RDEPENDS}"
> --
> 2.43.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196136): https://lists.openembedded.org/g/openembedde=
d-core/message/196136
> Mute This Topic: https://lists.openembedded.org/mt/104560766/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

