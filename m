Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CBAC79FA1
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 16:10:51 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38755.1788797441682720488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 09:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l0SYUs4m;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-85aa9c1308dso28533477b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 09:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788797441; cv=none;
        d=google.com; s=arc-20260327;
        b=jyOrPkacG+W8X+8jFYi4LGxuONyaHX1w4skRjEGEUxO+KDBu5TU8A26GZJ/tkr0E8h
         /DDwhXYF0ZhYLbyBKuPKa71r5Y9ltfYkuoHXU8uJ4VfOKta1FfPtkxv9WpwwLlaBgCLZ
         gWuARbyHbffOmGdCmqrxh9mR8dJPT/fuqPECbEi/xNLAwjFkjDOeQ8bhBgL8YbDRGsPL
         BlKTsS1U7QkLxTqKu63z29ncTp3WsBuRCzCv8TciBspmZKjcWm/RpHaKaCqqT1Lu0/Ul
         MOGO0b3n0mcll0oPtWUupdGaJV1XJ2ywtR59llAPTYRGzAwBPNBDUOsWgwHzS2RPinv6
         lKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U6dueFTADIx/gk9qBUHILWcq3WHUeki6DVAg90dkQiw=;
        fh=ZNQrCAwYkE/hjzZaE1C7oWPVZ/HsTLZmLeGbRsNIuR0=;
        b=lwNZi4g5YrLU38RP5iVn4Ts3bv/s6Jbs3akOYfk/yGVJppzctajRkfzlIgFEw5hjwP
         VhC6kl9PzYDROSIsclfr4x5Sb3zSMbOcGZzz41znU2x8SuSNjdjoqptWJiamCBcvDJhy
         P1+BDer9AK8lt5AeYdztbztfR8XJaknaOJWwCzmGeHYBUsoX6SYW+bNR7WNSpUvJ6t/v
         UvZPEZfXYI7mNam5tW/sz7BCiWp9syQ9QOMAM+Z0OTa90pOzESX+vbOLUldrgKbLCXxR
         fxOwvx5QV62LlSBbFcqQ+mhdbM/tnbDluugX3HFVxPI9VSlHEw8YLcVQ9M9kZftKaq9n
         r4LA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788797441; x=1789402241; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6dueFTADIx/gk9qBUHILWcq3WHUeki6DVAg90dkQiw=;
        b=l0SYUs4mbOB+TqGMt7b/Ky9/FJW7Fl5/Fc/4uF4MrB7qDg2oW8DfUvQr/znKxauOKZ
         kH3yTMQNpsQbod14vzXQ03BLtunsj11MW6Xf7IlPODzbMgGMc/oNYXNCWBa+B2ohZsx3
         rRjjk5fim85bZyerzon9tfGUsRZXvVvruQY0kXTFU6qKjSsVajP9PT3+aY1dtLtaa4xU
         XCBnOyAE792JgXZ0p/nWhH98bmxxjXryqrMKer/18Ywf5mYkh4LpWWTu37n9whgD1QxR
         OkBVxY3OwpuEQ/b6U6e789y5opeg7LgIQlo/GapNHaYqkhWcqxF/LERtI4NYm5yR4RC9
         dMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797441; x=1789402241;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U6dueFTADIx/gk9qBUHILWcq3WHUeki6DVAg90dkQiw=;
        b=FTaIm6G97cTyYuTyvKVCcJ8EksXxmNlbALzo5u+WMtuYSbqxdJ4OPV7DDsX4mTLXBe
         jxyeew/IpRaUaxCWOEXcsOFqUQXBvuyx5Uinn8lY2hp4BMPucrACDCf4Ml1+KYulK/2G
         ++T42i+5LJTGx/8qrRjy4t94XIEh9WqXvidXtiNtBdG1anwLLcHWw9nx73f9/i0ctJwh
         bE5pAiA1L101OlTPdHm33q7b+epz1YnAlHistdBzeN/2ta0246dCFHxF/iTwGvZ21jgj
         khbSF1K1UBW6yQd9z3PXDDEd5WZDdlZhoS3lBsyZQQQgCfN4hjdWVIF9xBgdRdPk1kyN
         ZDug==
X-Gm-Message-State: AFuF++mchDZ8dAF/l5XZ6i3UeEaOo9IwoHXfWPd0Y5WUNeQRpo6pXpYG
	5HYWiiad0A0z5GRlPoxIBZx6jjB98fcjRu5bgPvR55eX7649Pd8zTx3z+5gA1WCrRMCLasQ22SY
	Jyf7g+zlnkinMZYF2wM86hvlJvU+RUYkQEw==
X-Gm-Gg: AYBFou3QcijoxQBzmPBVffJa/ejam3a0C3FpWy0+6B9nzixD5JpCsktoxVrO2/S/Bs7
	iTpXYhFd+UM/0A4iz9xYqr054J+96XbH8vNQue7zUAopmsnDvVJMk+WbiKEzp/F+igPLbGft2Am
	EBbFGd5V03DUEVM/frgD44OFNGWkuvW4QUh5B0U151OFpMjkv1qwN+yRlEGKePKdwhhR0zXP+ul
	gWlkhNzu4HXgbJ/ITog0NbGjtK2eEp43FLjLGm7rVxppHKDRJ9SoDoikIj4tqqty72mZIeGkZz7
	E8GDX7mkm2frjVmVvzlgkT+H0M/XkMnMx7MmHkLb021TxoPq7o1wXNfGT9bSCXui8kYrKJ0my77
	b0ab27N8MJK3rwfZvgkJKO37yooxddv8IdXcEQ4dOlurSPEhOaKdxBMVqechmsZqPNua/BsxScv
	C91MH4X+yMCE2tXhGQlyu99lpAGY4AYrBijkVjja+5OG6JDw0ccpAWpX/7JHke502+W7bDMBqS9
	PqIpatgEPBXfg==
X-Received: by 2002:a05:690c:4b84:b0:857:12ab:3e19 with SMTP id
 00721157ae682-8712b98b472mr101178607b3.32.1788797440472; Mon, 07 Sep 2026
 09:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260907135607.4132821-1-adam.duskett@amarulasolutions.com> <20260907135607.4132821-2-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260907135607.4132821-2-adam.duskett@amarulasolutions.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Sep 2026 09:10:13 -0700
X-Gm-Features: AcwNN1V4lQ9KgYyKL9PTsl22NrB6HjFFw2iDQJCF5iT9CiYNSbTv4ML4MSaf6g4
Message-ID: <CAMKF1srpDm0o+o7LFqMzF+tZwU-KxwCOmK9a4EoL+AqfwhEr+A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v9 2/5] libtoml11: new recipe
To: adam.duskett@amarulasolutions.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000003bd26065ae6dcd5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 16:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245301

--00000000000003bd26065ae6dcd5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please do not forget to send a patch to delete it to oe-devel, once it is
merged in core.

On Mon, Sep 7, 2026 at 6:56=E2=80=AFAM Adam Duskett via lists.openembedded.=
org
<adam.duskett=3Damarulasolutions.com@lists.openembedded.org> wrote:

> DNF5 requires libtoml. As such, copy libtoml verbatim from
> meta-openembedded to openembedded-core.
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  ...move-more-whitespaces-after-operator.patch | 34 ++++++++++++++
>  .../0001-Remove-whitespace-in-operator.patch  | 46 +++++++++++++++++++
>  .../libtoml11/files/run-ptest                 | 13 ++++++
>  .../libtoml11/libtoml11_4.4.0.bb              | 39 ++++++++++++++++
>  6 files changed, 134 insertions(+)
>  create mode 100644
> meta/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-after-=
operator.patch
>  create mode 100644
> meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.=
patch
>  create mode 100755 meta/recipes-devtools/libtoml11/files/run-ptest
>  create mode 100644 meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 3c1a4ffa43..8f47ea6001 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -403,6 +403,7 @@ RECIPE_MAINTAINER:pn-libssh2 =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libssp-nonshared =3D "Khem Raj <raj.khem@gmail.com>=
"
>  RECIPE_MAINTAINER:pn-libstd-rs =3D "Randy MacLeod <
> Randy.MacLeod@windriver.com>"
>  RECIPE_MAINTAINER:pn-libtasn1 =3D "Unassigned <unassigned@yoctoproject.o=
rg
> >"
> +RECIPE_MAINTAINER:pn-libtoml11 =3D "Unassigned <unassigned@yoctoproject.=
org
> >"
>  RECIPE_MAINTAINER:pn-libtest-fatal-perl =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-libtest-needs-perl =3D "Tim Orling <
> tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-libtest-warnings-perl =3D "Tim Orling <
> tim.orling@konsulko.com>"
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index ce6c0a2d76..351d47d6ee 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -48,6 +48,7 @@ PTESTS_FAST =3D "\
>      libtest-needs-perl \
>      libtest-warnings-perl \
>      libtimedate-perl \
> +    libtoml11 \
>      libtry-tiny-perl \
>      libusb1 \
>      libxml-namespacesupport-perl \
> diff --git
> a/meta/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-afte=
r-operator.patch
> b/meta/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-afte=
r-operator.patch
> new file mode 100644
> index 0000000000..5bff81eaf6
> --- /dev/null
> +++
> b/meta/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-afte=
r-operator.patch
> @@ -0,0 +1,34 @@
> +From 6af7de3d5eaae59c53c42aab8eca1e1e9a365da5 Mon Sep 17 00:00:00 2001
> +From: Steffen Winter <steffen.winter@proton.me>
> +Date: Thu, 25 Dec 2025 20:48:02 +0100
> +Subject: [PATCH] Remove more whitespaces after operator""
> +
> +Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/306=
]
> +Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> +---
> + include/toml11/fwd/literal_fwd.hpp   | 4 ++--
> + include/toml11/impl/literal_impl.hpp | 4 ++--
> + 2 files changed, 4 insertions(+), 4 deletions(-)
> +
> +--- a/include/toml11/fwd/literal_fwd.hpp
> ++++ b/include/toml11/fwd/literal_fwd.hpp
> +@@ -24,7 +24,7 @@ inline namespace toml_literals
> + #if defined(TOML11_HAS_CHAR8_T)
> + // value of u8"" literal has been changed from char to char8_t and
> char8_t is
> + // NOT compatible to char
> +-::toml::value operator"" _toml(const char8_t* str, std::size_t len);
> ++::toml::value operator""_toml(const char8_t* str, std::size_t len);
> + #endif
> +
> + } // toml_literals
> +--- a/include/toml11/impl/literal_impl.hpp
> ++++ b/include/toml11/impl/literal_impl.hpp
> +@@ -146,7 +146,7 @@ operator""_toml(const char* str, std::si
> + // value of u8"" literal has been changed from char to char8_t and
> char8_t is
> + // NOT compatible to char
> + TOML11_INLINE ::toml::value
> +-operator"" _toml(const char8_t* str, std::size_t len)
> ++operator""_toml(const char8_t* str, std::size_t len)
> + {
> +     if(len =3D=3D 0)
> +     {
> diff --git
> a/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operato=
r.patch
> b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operato=
r.patch
> new file mode 100644
> index 0000000000..9516ee5cb1
> --- /dev/null
> +++
> b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operato=
r.patch
> @@ -0,0 +1,46 @@
> +From dee78f822d8a5b985e565e5c1ef42a59557aa8fc Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 7 Mar 2025 11:35:46 -0800
> +Subject: [PATCH] Remove whitespace in operator""
> +
> +Clang 20+ errors about this whitespace.
> +
> +Fixes
> +include/toml11/impl/../fwd/literal_fwd.hpp:22:26: error: identifier
> '_toml' preceded by whitespace in a literal operator declaration is
> deprecated [-Werror,-Wdeprecated-literal-operator]
> +|    22 | ::toml::value operator"" _toml(const char* str, std::size_t
> len);
> +|       |               ~~~~~~~~~~~^~~~~
> +|       |               operator""_toml
> +
> +Upstream-Status: Backport [
> https://github.com/ToruNiina/toml11/commit/dee78f822d8a5b985e565e5c1ef42a=
59557aa8fc
> ]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + include/toml11/fwd/literal_fwd.hpp   | 2 +-
> + include/toml11/impl/literal_impl.hpp | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/include/toml11/fwd/literal_fwd.hpp
> b/include/toml11/fwd/literal_fwd.hpp
> +index e46612c..82f62b7 100644
> +--- a/include/toml11/fwd/literal_fwd.hpp
> ++++ b/include/toml11/fwd/literal_fwd.hpp
> +@@ -19,7 +19,7 @@ inline namespace literals
> + inline namespace toml_literals
> + {
> +
> +-::toml::value operator"" _toml(const char* str, std::size_t len);
> ++::toml::value operator""_toml(const char* str, std::size_t len);
> +
> + #if defined(TOML11_HAS_CHAR8_T)
> + // value of u8"" literal has been changed from char to char8_t and
> char8_t is
> +diff --git a/include/toml11/impl/literal_impl.hpp
> b/include/toml11/impl/literal_impl.hpp
> +index e8298c2..067d4ed 100644
> +--- a/include/toml11/impl/literal_impl.hpp
> ++++ b/include/toml11/impl/literal_impl.hpp
> +@@ -115,7 +115,7 @@ inline namespace toml_literals
> + {
> +
> + TOML11_INLINE ::toml::value
> +-operator"" _toml(const char* str, std::size_t len)
> ++operator""_toml(const char* str, std::size_t len)
> + {
> +     if(len =3D=3D 0)
> +     {
> diff --git a/meta/recipes-devtools/libtoml11/files/run-ptest
> b/meta/recipes-devtools/libtoml11/files/run-ptest
> new file mode 100755
> index 0000000000..4da9e68cc5
> --- /dev/null
> +++ b/meta/recipes-devtools/libtoml11/files/run-ptest
> @@ -0,0 +1,13 @@
> +#!/usr/bin/env sh
> +
> +cd tests || exit 1
> +
> +rm -rf tests.log
> +
> +for atest in test_* ; do
> +    if ./"${atest}" >> tests.log 2>&1; then
> +        echo "PASS: ${atest}"
> +    else
> +        echo "FAIL: ${atest}"
> +    fi
> +done
> diff --git a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> new file mode 100644
> index 0000000000..49f9840f06
> --- /dev/null
> +++ b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "TOML for Modern C++"
> +DESCRIPTION =3D "toml11 is a feature-rich TOML language library for \
> +               C++11/14/17/20."
> +
> +HOMEPAGE =3D "https://github.com/ToruNiina/toml11"
> +BUGTRACKER =3D "https://github.com/ToruNiina/toml11/issues"
> +CVE_PRODUCT =3D "libtoml11"
> +
> +SECTION =3D "libs"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D44d1fcf70c7aa6991533c38daf7be=
fa3"
> +
> +PE =3D "1"
> +
> +SRC_URI =3D "\
> +    gitsm://
> github.com/ToruNiina/toml11.git;protocol=3Dhttps;branch=3Dmain;tag=3Dv${P=
V}
> <http://github.com/ToruNiina/toml11.git;protocol=3Dhttps;branch=3Dmain;ta=
g=3Dv$%7BPV%7D>
> \
> +    file://0001-Remove-whitespace-in-operator.patch \
> +    file://0001-Remove-more-whitespaces-after-operator.patch \
> +    file://run-ptest \
> +"
> +SRCREV =3D "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
> +
> +inherit cmake ptest
> +
> +CXXFLAGS:append:toolchain-clang =3D " -Wno-error=3Dc2y-extensions"
> +
> +EXTRA_OECMAKE +=3D "-DTOML11_PRECOMPILE=3DON \
> +
> -DTOML11_BUILD_TESTS=3D${@bb.utils.contains("PTEST_ENABLED", "1", "ON",
> "OFF", d)} \
> +"
> +
> +ALLOW_EMPTY:${PN} =3D "1"
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245295):
> https://lists.openembedded.org/g/openembedded-core/message/245295
> Mute This Topic: https://lists.openembedded.org/mt/121128671/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000003bd26065ae6dcd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please do not forget to send a patch to delete it to oe-de=
vel, once it is merged in core.</div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 7, 2026 at=
 6:56=E2=80=AFAM Adam Duskett via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;adam.duskett=3D<a href=3D"mailto:amarulasol=
utions.com@lists.openembedded.org">amarulasolutions.com@lists.openembedded.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">DNF5 requires libtoml. As such, copy libtoml verbatim from<br>
meta-openembedded to openembedded-core.<br>
<br>
Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolut=
ions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0...move-more-whitespaces-after-operator.patch | 34 ++++++++++++++<br>
=C2=A0.../0001-Remove-whitespace-in-operator.patch=C2=A0 | 46 +++++++++++++=
++++++<br>
=C2=A0.../libtoml11/files/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 13 ++++++<br>
=C2=A0.../libtoml11/<a href=3D"http://libtoml11_4.4.0.bb" rel=3D"noreferrer=
" target=3D"_blank">libtoml11_4.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 39 ++++++++++++++++<br>
=C2=A06 files changed, 134 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/libtoml11/files/0001-Remove-=
more-whitespaces-after-operator.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/libtoml11/files/0001-Remove-=
whitespace-in-operator.patch<br>
=C2=A0create mode 100755 meta/recipes-devtools/libtoml11/files/run-ptest<br=
>
=C2=A0create mode 100644 meta/recipes-devtools/libtoml11/<a href=3D"http://=
libtoml11_4.4.0.bb" rel=3D"noreferrer" target=3D"_blank">libtoml11_4.4.0.bb=
</a><br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc<br>
index 3c1a4ffa43..8f47ea6001 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -403,6 +403,7 @@ RECIPE_MAINTAINER:pn-libssh2 =3D &quot;Unassigned &lt;<=
a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@=
yoctoproject.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libssp-nonshared =3D &quot;Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libstd-rs =3D &quot;Randy MacLeod &lt;<a href=3D=
"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.MacLeod@windri=
ver.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libtasn1 =3D &quot;Unassigned &lt;<a href=3D"mai=
lto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.=
org</a>&gt;&quot;<br>
+RECIPE_MAINTAINER:pn-libtoml11 =3D &quot;Unassigned &lt;<a href=3D"mailto:=
unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.org<=
/a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libtest-fatal-perl =3D &quot;Tim Orling &lt;<a h=
ref=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulk=
o.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libtest-needs-perl =3D &quot;Tim Orling &lt;<a h=
ref=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@konsulk=
o.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libtest-warnings-perl =3D &quot;Tim Orling &lt;<=
a href=3D"mailto:tim.orling@konsulko.com" target=3D"_blank">tim.orling@kons=
ulko.com</a>&gt;&quot;<br>
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc<br>
index ce6c0a2d76..351d47d6ee 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -48,6 +48,7 @@ PTESTS_FAST =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0libtest-needs-perl \<br>
=C2=A0 =C2=A0 =C2=A0libtest-warnings-perl \<br>
=C2=A0 =C2=A0 =C2=A0libtimedate-perl \<br>
+=C2=A0 =C2=A0 libtoml11 \<br>
=C2=A0 =C2=A0 =C2=A0libtry-tiny-perl \<br>
=C2=A0 =C2=A0 =C2=A0libusb1 \<br>
=C2=A0 =C2=A0 =C2=A0libxml-namespacesupport-perl \<br>
diff --git a/meta/recipes-devtools/libtoml11/files/0001-Remove-more-whitesp=
aces-after-operator.patch b/meta/recipes-devtools/libtoml11/files/0001-Remo=
ve-more-whitespaces-after-operator.patch<br>
new file mode 100644<br>
index 0000000000..5bff81eaf6<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/libtoml11/files/0001-Remove-more-whitespaces-af=
ter-operator.patch<br>
@@ -0,0 +1,34 @@<br>
+From 6af7de3d5eaae59c53c42aab8eca1e1e9a365da5 Mon Sep 17 00:00:00 2001<br>
+From: Steffen Winter &lt;<a href=3D"mailto:steffen.winter@proton.me" targe=
t=3D"_blank">steffen.winter@proton.me</a>&gt;<br>
+Date: Thu, 25 Dec 2025 20:48:02 +0100<br>
+Subject: [PATCH] Remove more whitespaces after operator&quot;&quot;<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/ToruNiina/toml11=
/pull/306" rel=3D"noreferrer" target=3D"_blank">https://github.com/ToruNiin=
a/toml11/pull/306</a>]<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:khem.raj@oss.qualcomm.com" t=
arget=3D"_blank">khem.raj@oss.qualcomm.com</a>&gt;<br>
+---<br>
+ include/toml11/fwd/literal_fwd.hpp=C2=A0 =C2=A0| 4 ++--<br>
+ include/toml11/impl/literal_impl.hpp | 4 ++--<br>
+ 2 files changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+--- a/include/toml11/fwd/literal_fwd.hpp<br>
++++ b/include/toml11/fwd/literal_fwd.hpp<br>
+@@ -24,7 +24,7 @@ inline namespace toml_literals<br>
+ #if defined(TOML11_HAS_CHAR8_T)<br>
+ // value of u8&quot;&quot; literal has been changed from char to char8_t =
and char8_t is<br>
+ // NOT compatible to char<br>
+-::toml::value operator&quot;&quot; _toml(const char8_t* str, std::size_t =
len);<br>
++::toml::value operator&quot;&quot;_toml(const char8_t* str, std::size_t l=
en);<br>
+ #endif<br>
+ <br>
+ } // toml_literals<br>
+--- a/include/toml11/impl/literal_impl.hpp<br>
++++ b/include/toml11/impl/literal_impl.hpp<br>
+@@ -146,7 +146,7 @@ operator&quot;&quot;_toml(const char* str, std::si<br>
+ // value of u8&quot;&quot; literal has been changed from char to char8_t =
and char8_t is<br>
+ // NOT compatible to char<br>
+ TOML11_INLINE ::toml::value<br>
+-operator&quot;&quot; _toml(const char8_t* str, std::size_t len)<br>
++operator&quot;&quot;_toml(const char8_t* str, std::size_t len)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0if(len =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
diff --git a/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-i=
n-operator.patch b/meta/recipes-devtools/libtoml11/files/0001-Remove-whites=
pace-in-operator.patch<br>
new file mode 100644<br>
index 0000000000..9516ee5cb1<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-opera=
tor.patch<br>
@@ -0,0 +1,46 @@<br>
+From dee78f822d8a5b985e565e5c1ef42a59557aa8fc Mon Sep 17 00:00:00 2001<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
+Date: Fri, 7 Mar 2025 11:35:46 -0800<br>
+Subject: [PATCH] Remove whitespace in operator&quot;&quot;<br>
+<br>
+Clang 20+ errors about this whitespace.<br>
+<br>
+Fixes<br>
+include/toml11/impl/../fwd/literal_fwd.hpp:22:26: error: identifier &#39;_=
toml&#39; preceded by whitespace in a literal operator declaration is depre=
cated [-Werror,-Wdeprecated-literal-operator]<br>
+|=C2=A0 =C2=A0 22 | ::toml::value operator&quot;&quot; _toml(const char* s=
tr, std::size_t len);<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0~~~~~~~~~~~^~~~~<br>
+|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0operator&quot;&quot;_toml<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ToruNiina/toml11/=
commit/dee78f822d8a5b985e565e5c1ef42a59557aa8fc" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/ToruNiina/toml11/commit/dee78f822d8a5b985e56=
5e5c1ef42a59557aa8fc</a>]<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+---<br>
+ include/toml11/fwd/literal_fwd.hpp=C2=A0 =C2=A0| 2 +-<br>
+ include/toml11/impl/literal_impl.hpp | 2 +-<br>
+ 2 files changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/include/toml11/fwd/literal_fwd.hpp b/include/toml11/fwd/liter=
al_fwd.hpp<br>
+index e46612c..82f62b7 100644<br>
+--- a/include/toml11/fwd/literal_fwd.hpp<br>
++++ b/include/toml11/fwd/literal_fwd.hpp<br>
+@@ -19,7 +19,7 @@ inline namespace literals<br>
+ inline namespace toml_literals<br>
+ {<br>
+ <br>
+-::toml::value operator&quot;&quot; _toml(const char* str, std::size_t len=
);<br>
++::toml::value operator&quot;&quot;_toml(const char* str, std::size_t len)=
;<br>
+ <br>
+ #if defined(TOML11_HAS_CHAR8_T)<br>
+ // value of u8&quot;&quot; literal has been changed from char to char8_t =
and char8_t is<br>
+diff --git a/include/toml11/impl/literal_impl.hpp b/include/toml11/impl/li=
teral_impl.hpp<br>
+index e8298c2..067d4ed 100644<br>
+--- a/include/toml11/impl/literal_impl.hpp<br>
++++ b/include/toml11/impl/literal_impl.hpp<br>
+@@ -115,7 +115,7 @@ inline namespace toml_literals<br>
+ {<br>
+ <br>
+ TOML11_INLINE ::toml::value<br>
+-operator&quot;&quot; _toml(const char* str, std::size_t len)<br>
++operator&quot;&quot;_toml(const char* str, std::size_t len)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0if(len =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
diff --git a/meta/recipes-devtools/libtoml11/files/run-ptest b/meta/recipes=
-devtools/libtoml11/files/run-ptest<br>
new file mode 100755<br>
index 0000000000..4da9e68cc5<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/libtoml11/files/run-ptest<br>
@@ -0,0 +1,13 @@<br>
+#!/usr/bin/env sh<br>
+<br>
+cd tests || exit 1<br>
+<br>
+rm -rf tests.log<br>
+<br>
+for atest in test_* ; do<br>
+=C2=A0 =C2=A0 if ./&quot;${atest}&quot; &gt;&gt; tests.log 2&gt;&amp;1; th=
en<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: ${atest}&quot;<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: ${atest}&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+done<br>
diff --git a/meta/recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.=
4.0.bb" rel=3D"noreferrer" target=3D"_blank">libtoml11_4.4.0.bb</a> b/meta/=
recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.4.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">libtoml11_4.4.0.bb</a><br>
new file mode 100644<br>
index 0000000000..49f9840f06<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.4.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">libtoml11_4.4.0.bb</a><br>
@@ -0,0 +1,39 @@<br>
+SUMMARY =3D &quot;TOML for Modern C++&quot;<br>
+DESCRIPTION =3D &quot;toml11 is a feature-rich TOML language library for \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0C++11/14/17/20.&quo=
t;<br>
+<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/ToruNiina/toml11" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/ToruNiina/toml11</a>&quot;=
<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/ToruNiina/toml11/issues=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/ToruNiina/toml11/=
issues</a>&quot;<br>
+CVE_PRODUCT =3D &quot;libtoml11&quot;<br>
+<br>
+SECTION =3D &quot;libs&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D44d1fcf70c7aa6991533c38daf=
7befa3&quot;<br>
+<br>
+PE =3D &quot;1&quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 gitsm://<a href=3D"http://github.com/ToruNiina/toml11.git;pr=
otocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D=
"_blank">github.com/ToruNiina/toml11.git;protocol=3Dhttps;branch=3Dmain;tag=
=3Dv${PV}</a> \<br>
+=C2=A0 =C2=A0 file://0001-Remove-whitespace-in-operator.patch \<br>
+=C2=A0 =C2=A0 file://0001-Remove-more-whitespaces-after-operator.patch \<b=
r>
+=C2=A0 =C2=A0 file://run-ptest \<br>
+&quot;<br>
+SRCREV =3D &quot;be08ba2be2a964edcdb3d3e3ea8d100abc26f286&quot;<br>
+<br>
+inherit cmake ptest<br>
+<br>
+CXXFLAGS:append:toolchain-clang =3D &quot; -Wno-error=3Dc2y-extensions&quo=
t;<br>
+<br>
+EXTRA_OECMAKE +=3D &quot;-DTOML11_PRECOMPILE=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DTOML11_BU=
ILD_TESTS=3D${@bb.utils.contains(&quot;PTEST_ENABLED&quot;, &quot;1&quot;, =
&quot;ON&quot;, &quot;OFF&quot;, d)} \<br>
+&quot;<br>
+<br>
+ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
+<br>
+do_install_ptest () {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#245295): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/245295" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/245295</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121128671/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121128671/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000003bd26065ae6dcd5--

