Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0B7C7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 20:20:30 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.141394.1680726025204992958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 13:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UFeMxLOB;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id d20so5637047ioe.4
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 13:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680726024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQkAdc9yEXNG97R4QdS2PfWs2hYWaxt3gGBBvbrHMos=;
        b=UFeMxLOBrFN5Ns428UdDwuy5ckupC4VogRJW2GhOP/d9BkIblc5HyM/sDbfXkeT5fU
         2/YwhR/m3iRwn2Z2JdWKOKK6ueUByYE2VEAz1hD9vZPlAIFc1hIeX5lWCWPlVMX0w0Es
         hEKhfqpjJCFB7xm8IGoIuCR64f6t7qo6EYEd5tXOLkpwL4EBibrb/KcLS+mbb0FBbWCh
         QLJ8ng7kc9k5BREc5GUYNoAQf0qmZVQnKcy5BWJsFxectghoq9Mb4m1R+xEAz5kePvTP
         h4nifqmo2MI+5WeyG4mrw9jzycdArVbH8zwHnwpxQYogNm51PmVgxCFz8xR7mciDlQQs
         Ufsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680726024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQkAdc9yEXNG97R4QdS2PfWs2hYWaxt3gGBBvbrHMos=;
        b=sk7vIUTnpmY1kbHtUK3uJEUi9maVncuHf0iQOQTrpKkUzzamce8fioMaBvSnQRF1pB
         AL3Cr9u9Ih/vQwbziP3haxOsJ2d4jStMsYjGCvexcx+jR8UZihdYx/wNhM5/QvM1yN/X
         EPlh3LQHej9jjIrhoEmvFfJQ//NSL5emTue+lJim/77XOqu/GDW8PVoiKn3LvsVUyb+K
         CoDUYiQaAxqVhg40sSiB95soHaarNXkaOCr3IrWp6Z+wl3UH8ynG+kROOFiVl4QCIyDX
         /LrlCjfrErRSH8nLD01Fk5YCYcXCWPY1ZlLxSWcDf+k48o1vEHBlEgQCBXLG/OHbwSCX
         hvhw==
X-Gm-Message-State: AAQBX9fJaWzZj03MhtlotoLAhOIFKB9wHD5gmMILrEqb+uxl9UujbYlZ
	9hWQGzVZSXXhgum7VCwFu3Dktj+/RXf59prjfiU=
X-Google-Smtp-Source: AKy350Z0rrEEag6eaymYsjQsGB/M8KvN6H9IqZQ0cfFFYtIMZQfLpKdbkylSfwMcbE0AxCbt5Er4PHCW3vTm5ynu+jE=
X-Received: by 2002:a05:6638:3708:b0:3ec:46d4:e15 with SMTP id
 k8-20020a056638370800b003ec46d40e15mr2544561jav.3.1680726024172; Wed, 05 Apr
 2023 13:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230405192413.170919-1-brgl@bgdev.pl>
In-Reply-To: <20230405192413.170919-1-brgl@bgdev.pl>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Apr 2023 16:20:15 -0400
Message-ID: <CADkTA4P1ytg42=uY0wJGa8yVKp=bUPZg6eaisvZ9LUwwMymyFQ@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH] base: implement support for the
 PACKAGECONFIGEXTENDS variable
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, =?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?= <pidge@pidge.org>, 
	openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 20:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179750

On Wed, Apr 5, 2023 at 3:24=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Some PACKAGECONFIG switches enable building of additional artifacts that
> end up in sub-packages for a recipe. For example in foo.bb we have:
>
>   PACKAGES =3D+ "foo-bar"
>   PACKAGECONFIG[bar] =3D "--enable-bar,--disable-bar,libdep"
>   FILES:foo-bar =3D "${bindir}/bar"
>
> Where ${bindir}/bar is only installed if PACKAGECONFIG contains "bar".
>
> In order to add foo-bar to the image we need to do:
>
>   IMAGE_INSTALL:append =3D " foo-bar"
>   PACKAGECONFIG:append:pn-foo =3D " bar"
>
> This is redundant so with this change we need to add:
>
>   PACKAGECONFIGEXTENDS:foo-bar =3D "bar"

FWIW, I prefer the explicit IMAGE_INSTALL and PACKAGECONFIG, as it
keeps the manipulations visible.

The level of coordination that this is doing is more like a distro
feature, or somewhere around an image feature .. and image features
are manipulated in image recipes, as the contents aren't global.

So regardless of whether or not the behind the scenes work is desired,
from what I'm seeing, this breaks the namespace and separation between
a recipe variable and an image recipe variable. Depending on what the
target of a build is (the recipe versus an image) both won't even be
valid in a given run, so the variable tweaks won't work or will create
races/other issues.

Then again, I may be misreading the patch and not understanding the
reasoning behind the change.

Bruce

>
> to foo.bb and now adding "foo-bar" to IMAGE_INSTALL will automatically
> append "bar" to foo.bb's PACKAGECONFIG.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  documentation/ref-manual/variables.rst        | 15 +++++++++++
>  .../packageconfigextends.bb                   | 27 +++++++++++++++++++
>  .../packageconfigextends/pkgext-bar.sh        |  3 +++
>  .../packageconfigextends/pkgext.sh            |  3 +++
>  meta/classes-global/base.bbclass              | 13 +++++++++
>  .../oeqa/selftest/cases/packageconfigdeps.py  | 11 ++++++++
>  6 files changed, 72 insertions(+)
>  create mode 100644 meta-selftest/recipes-test/packageconfigextends/packa=
geconfigextends.bb
>  create mode 100644 meta-selftest/recipes-test/packageconfigextends/packa=
geconfigextends/pkgext-bar.sh
>  create mode 100644 meta-selftest/recipes-test/packageconfigextends/packa=
geconfigextends/pkgext.sh
>  create mode 100644 meta/lib/oeqa/selftest/cases/packageconfigdeps.py
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
> index c787a17937..dcb5cdccd9 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -6016,6 +6016,21 @@ system and gives an overview of their function and=
 contents.
>
>              PACKAGECONFIG:append:pn-recipename =3D " f4"
>
> +   :term:`PACKAGECONFIGEXTENDS`
> +      List of :term:`PACKAGECONFIG` flags automatically enabled for a pa=
ckage
> +      present in :term:`IMAGE_INSTALL`. The :term:`PACKAGES` variable li=
sts
> +      the packages generated by a recipe.
> +
> +      Some :term:`PACKAGECONFIG` switches enable building additional art=
ifacts
> +      that are part of sub-packages for a recipe. In order to avoid havi=
ng to
> +      explictly add :term:`PACKAGECONFIG` flags AND include the addition=
al
> +      packages in :term:`IMAGE_INSTALL`, the user can just do::
> +
> +         PACKAGECONFIGEXTENDS:packagename =3D " foo"
> +
> +      in which case pulling in `packagename` from the recipe will automa=
tically
> +      add `foo` to this recipe's :term:`PACKAGECONFIG`.
> +
>     :term:`PACKAGECONFIG_CONFARGS`
>        A space-separated list of configuration options generated from the
>        :term:`PACKAGECONFIG` setting.
> diff --git a/meta-selftest/recipes-test/packageconfigextends/packageconfi=
gextends.bb b/meta-selftest/recipes-test/packageconfigextends/packageconfig=
extends.bb
> new file mode 100644
> index 0000000000..189b9779b3
> --- /dev/null
> +++ b/meta-selftest/recipes-test/packageconfigextends/packageconfigextend=
s.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "Test case making sure that sub-packages pull in correct PAC=
KAGECONFIG switches."
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +
> +SRC_URI =3D " \
> +    file://pkgext.sh \
> +    file://pkgext-bar.sh \
> +"
> +
> +PACKAGES =3D+ "${PN}-bar"
> +FILES:${PN}-bar +=3D "${bindir}/pkgext-bar"
> +
> +PACKAGECONFIG =3D ""
> +PACKAGECONFIG[bar] =3D ""
> +
> +PACKAGECONFIGEXTENDS:${PN}-bar =3D "bar"
> +
> +do_compile[noexec] =3D "1"
> +
> +S =3D "${WORKDIR}"
> +
> +do_install() {
> +    install -D -m 0755 ${S}/pkgext.sh ${D}${bindir}/pkgext
> +    if [ "${@bb.utils.contains("PACKAGECONFIG", "bar", "1", "", d)}" =3D=
 "1" ]; then
> +        install -D -m 0755 ${S}/pkgext-bar.sh ${D}${bindir}/pkgext-bar
> +    fi
> +}
> diff --git a/meta-selftest/recipes-test/packageconfigextends/packageconfi=
gextends/pkgext-bar.sh b/meta-selftest/recipes-test/packageconfigextends/pa=
ckageconfigextends/pkgext-bar.sh
> new file mode 100644
> index 0000000000..1b208b154f
> --- /dev/null
> +++ b/meta-selftest/recipes-test/packageconfigextends/packageconfigextend=
s/pkgext-bar.sh
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +echo "BAR"
> diff --git a/meta-selftest/recipes-test/packageconfigextends/packageconfi=
gextends/pkgext.sh b/meta-selftest/recipes-test/packageconfigextends/packag=
econfigextends/pkgext.sh
> new file mode 100644
> index 0000000000..c5beb15283
> --- /dev/null
> +++ b/meta-selftest/recipes-test/packageconfigextends/packageconfigextend=
s/pkgext.sh
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +echo "FOO"
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index b6e339ed9c..7ee43d85e0 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -429,6 +429,19 @@ python () {
>      # PACKAGECONFIG[foo] =3D "--enable-foo,--disable-foo,foo_depends,foo=
_runtime_depends,foo_runtime_recommends,foo_conflict_packageconfig"
>      pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
>      if pkgconfigflags:
> +        # Preprocess PACKAGECONFIG for recipe sub-packages that are in
> +        # IMAGE_INSTALL but for which the required PACKAGECONFIG options
> +        # were not selected.
> +        img_inst =3D (d.getVar("IMAGE_INSTALL") or "").split()
> +        recipe_pkgs =3D d.getVar("PACKAGES").split()
> +        pkgconfig =3D (d.getVar("PACKAGECONFIG") or "").split()
> +        for pkg in recipe_pkgs:
> +            if pkg in img_inst:
> +                deps =3D (d.getVar("PACKAGECONFIGEXTENDS:{}".format(pkg)=
) or "").split()
> +                for dep in deps:
> +                    if dep not in pkgconfig:
> +                        d.appendVar("PACKAGECONFIG", " " + dep)
> +
>          pkgconfig =3D (d.getVar('PACKAGECONFIG') or "").split()
>          pn =3D d.getVar("PN")
>
> diff --git a/meta/lib/oeqa/selftest/cases/packageconfigdeps.py b/meta/lib=
/oeqa/selftest/cases/packageconfigdeps.py
> new file mode 100644
> index 0000000000..69e23c1083
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/packageconfigdeps.py
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright (C) 2023: Bartosz Golaszewski <bartosz.golaszewski@linaro.or=
g>
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import bitbake
> +
> +class PackageconfigDepsTest(OESelftestTestCase):
> +    def test_pkgcfgdeps(self):
> +        self.write_config('IMAGE_INSTALL:append =3D " packageconfigexten=
ds-bar"')
> +        bitbake('core-image-minimal')
> --
> 2.37.2



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

