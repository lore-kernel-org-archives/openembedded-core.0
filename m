Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF22CD59D99
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 12:38:04 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47323.1765802275818985327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 04:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cOqZwX+c;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78e602d09b6so26662657b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 04:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765802275; x=1766407075; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3lqkzJLflW6R+3gnmxuRxWXT8p92wX10zFbYEspdbS8=;
        b=cOqZwX+cZmO3NI7o/nY/qIQEzMrFZNVl9Dz7ldXCfsrbiOXTP4fIBWNCVEw3cQK9no
         sehZxbovjBWlVEmIrbZp3V66YBfimDi8vhm25dWntSmlyCcHgijveYHASefIOPIpwX8U
         aOSpiLaavKrEbcWfQMIkPnJF9p16DeeVeGq1KQllRA6DKZkBaez1MTiBIfK3huG9+hjx
         0NE64Ish7iF0Vqjuq0gL+hzS1uewWj7z1mqn6xrdnNNrEint47jC8fQO73ReJXW0Baig
         ucaHcMaytLHORSMF/V6DO785+ULWrQIqHv2hI9Boh0DOYkxNavzsF1gVajo/d7hyftY5
         wtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765802275; x=1766407075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lqkzJLflW6R+3gnmxuRxWXT8p92wX10zFbYEspdbS8=;
        b=o0lyeANFF4MPFcn4aKpOZUbvTHcEQJvTZI6pwUAB0NRP7tJU4gr0eYbHTqsBPDzQqs
         5QYmsEhmoakhXIFhMD/Fa93bHh0mD7l/AqQ9H3tnyd17yGR2X4mrHf8FbhmXwWcU1c+K
         1Ijo7nYuYmvSLJcMCI4MS8Ky8Z3aFmthL7zm6i/bg+WVVnxM+5QDZSPi73FDqQIBg/Ki
         4XwieOXHLQxGaiAT6GqPEsdhN1szbRIACrG904Y75z0+YFCjvJB8ShJif+thb/3s+I9c
         vDt+5j8820x0hZ6mdlZo7lfHoBJwC7x8sTobMVN2a1xoCHibvT/IYAbDwtNwNDueOsaq
         bMNA==
X-Gm-Message-State: AOJu0Yycfqf2clfcpQ1KCysKzFUumK5KBMh/nioiXCgSdcQeDhvurx6W
	WPg+PPmdPKYHebSEJLhQLhguvlOCNMzmDl4vCtyeoJicx5q7FF75xMMAM/0+fAOPDO/LfO+bmRk
	NW/Jv02T5Ve9IEIY/AnPPujtNQ3FQK1XvErao
X-Gm-Gg: AY/fxX6tQ8cqemGMLyQG08Y8TFBILc+jM2HZ2HKDQj9T/Coq6Zv/awEbvbVfVMNyqOD
	Ip4v6qT/en8bVRx8Ahwt4xOdzgHqZ5Ia0D1oOBh6SqrLC6ahQGXELHzOrmWSo7Naay0LlaBHI6R
	CysyPUg034O3Sc8eXf5/V+6I+CxVMVD3tJOgSP+Dj2teqilHdBhCA9ME3RPLzrtHHFxdVVPz92L
	qgFMTujjcfojg8ZkgNdaY/Xdhrheed0UVGDzuyWjosMRt0BqIQ42FiJ71V7mQ0eDTfMmO9wDhms
	00SLHYXJF0C9VHrQWSXZqI3eVdWCaPVTZ6RKBfX0Z/bwEVGbBWY45FIDgqgrBee+wxS1xp7swz1
	F38v7cpBem9qeWQ==
X-Google-Smtp-Source: AGHT+IF7se2xKamrVxtQxRtvJsRiHoj3fukQ2ybnLcy83GXt6k8Wnzn3fzvB39mWZHWRekXWydFMBDIDLZ3zbBbYoSw=
X-Received: by 2002:a05:690c:6d01:b0:787:c7e5:347f with SMTP id
 00721157ae682-78e66c69623mr84512127b3.56.1765802274693; Mon, 15 Dec 2025
 04:37:54 -0800 (PST)
MIME-Version: 1.0
References: <20251215100500.1626964-1-adam.duskett@amarulasolutions.com> <20251215100500.1626964-2-adam.duskett@amarulasolutions.com>
In-Reply-To: <20251215100500.1626964-2-adam.duskett@amarulasolutions.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Dec 2025 04:37:43 -0800
X-Gm-Features: AQt7F2rIdUoYJH7--BdtGQj4NGdBASQUakr6W1vXluCozC-E6PcjL395rUjrMyY
Message-ID: <CAMKF1spYmzA650kQQenBm3PrqH2EentrZOWm84VqthyctGWZGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/6] libtoml: new recipe
To: adam.duskett@amarulasolutions.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000053a5010645fce119"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 12:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227737

--00000000000053a5010645fce119
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Once merged we need to drop it from meta-oe. As you are on top of it you
would know when it lands in core would you mind sending a patch for removal
as well ?

On Mon, Dec 15, 2025 at 5:05=E2=80=AFAM Adam Duskett via lists.openembedded=
.org
<adam.duskett=3Damarulasolutions.com@lists.openembedded.org> wrote:

> DNF5 requires libtoml. As such, copy libtoml verbatim from
> meta-openembedded to openembedded-core.
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../0001-Remove-whitespace-in-operator.patch  | 46 +++++++++++++++++++
>  .../libtoml11/files/run-ptest                 | 12 +++++
>  .../libtoml11/libtoml11_4.4.0.bb              | 38 +++++++++++++++
>  5 files changed, 98 insertions(+)
>  create mode 100644
> meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operator.=
patch
>  create mode 100755 meta/recipes-devtools/libtoml11/files/run-ptest
>  create mode 100644 meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 8971b9b552..da642ac3c5 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -405,6 +405,7 @@ RECIPE_MAINTAINER:pn-libsoup =3D "Unassigned <
> unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libssh2 =3D "Unassigned <unassigned@yoctoproject.or=
g>"
>  RECIPE_MAINTAINER:pn-libssp-nonshared =3D "Khem Raj <raj.khem@gmail.com>=
"
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
> index 09613294d6..ec0e2d1637 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -40,6 +40,7 @@ PTESTS_FAST =3D "\
>      libtest-needs-perl \
>      libtest-warnings-perl \
>      libtimedate-perl \
> +    libtoml11 \
>      libtry-tiny-perl \
>      libusb1 \
>      libxml-namespacesupport-perl \
> diff --git
> a/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operato=
r.patch
> b/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-in-operato=
r.patch
> new file mode 100644
> index 0000000000..c8c9922d55
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
> +Upstream-Status: Submitted [https://github.com/ToruNiina/toml11/pull/285=
]
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
> index 0000000000..9bc480aa7f
> --- /dev/null
> +++ b/meta/recipes-devtools/libtoml11/files/run-ptest
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +cd tests
> +for atest in test_* ; do
> +    rm -rf tests.log
> +    ./${atest} > tests.log 2>&1
> +    if [ $? =3D 0 ] ; then
> +        echo "PASS: ${atest}"
> +    else
> +        echo "FAIL: ${atest}"
> +    fi
> +done
> diff --git a/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> new file mode 100644
> index 0000000000..38786b79ed
> --- /dev/null
> +++ b/meta/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
> @@ -0,0 +1,38 @@
> +SUMMARY =3D "TOML for Modern C++"
> +DESCRIPTION =3D "toml11 is a feature-rich TOML language library for \
> +               C++11/14/17/20."
> +
> +HOMEPAGE =3D "https://github.com/ToruNiina/toml11"
> +
> +SECTION =3D "libs"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D44d1fcf70c7aa6991533c38daf7be=
fa3"
> +
> +PE =3D "1"
> +
> +SRCREV =3D "be08ba2be2a964edcdb3d3e3ea8d100abc26f286"
> +SRCREV_json =3D "8c391e04fe4195d8be862c97f38cfe10e2a3472e"
> +SRCREV_doctest =3D "ae7a13539fb71f270b87eb2e874fbac80bc8dda2"
> +
> +SRC_URI =3D "git://github.com/ToruNiina/toml11;branch=3Dmain;protocol=3D=
https \
> +           git://
> github.com/nlohmann/json;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/tests/=
extlib/json;name=3Djson;branch=3Ddevelop;protocol=3Dhttps
> <http://github.com/nlohmann/json;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFF=
IX%7D/tests/extlib/json;name=3Djson;branch=3Ddevelop;protocol=3Dhttps>
> \
> +           git://
> github.com/doctest/doctest;destsuffix=3D${BB_GIT_DEFAULT_DESTSUFFIX}/test=
s/extlib/doctest;name=3Ddoctest;branch=3Dmaster;protocol=3Dhttps
> <http://github.com/doctest/doctest;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSU=
FFIX%7D/tests/extlib/doctest;name=3Ddoctest;branch=3Dmaster;protocol=3Dhttp=
s>
> \
> +           file://0001-Remove-whitespace-in-operator.patch \
> +           file://run-ptest \
> +"
> +SRCREV_FORMAT =3D "json_doctest"
> +
> +
> +inherit cmake ptest
> +
> +EXTRA_OECMAKE +=3D "-DTOML11_PRECOMPILE=3DON \
> +
> -DTOML11_BUILD_TESTS=3D${@bb.utils.contains("DISTRO_FEATURES", "ptest", "=
ON",
> "OFF", d)} \
> +"
> +
> +ALLOW_EMPTY:${PN} =3D "1"
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests
> +}
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227707):
> https://lists.openembedded.org/g/openembedded-core/message/227707
> Mute This Topic: https://lists.openembedded.org/mt/116789899/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000053a5010645fce119
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Once merged we need to drop it from meta-oe. As you are o=
n top of it you would know when it lands in core would you mind sending a p=
atch for removal as well ?</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote gmail_quote_container" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Dec 15, 2025 at 5:05=E2=80=AFAM Adam =
Duskett via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;adam.duskett=3D<a href=3D"mailto:amarulasolutions.com@lists.opene=
mbedded.org">amarulasolutions.com@lists.openembedded.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">DNF5 requires libtoml. As such, copy l=
ibtoml verbatim from<br>
meta-openembedded to openembedded-core.<br>
<br>
Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarulasolut=
ions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
1 +<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0.../0001-Remove-whitespace-in-operator.patch=C2=A0 | 46 +++++++++++++=
++++++<br>
=C2=A0.../libtoml11/files/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++++<br>
=C2=A0.../libtoml11/<a href=3D"http://libtoml11_4.4.0.bb" rel=3D"noreferrer=
" target=3D"_blank">libtoml11_4.4.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 38 +++++++++++++++<br>
=C2=A05 files changed, 98 insertions(+)<br>
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
index 8971b9b552..da642ac3c5 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -405,6 +405,7 @@ RECIPE_MAINTAINER:pn-libsoup =3D &quot;Unassigned &lt;<=
a href=3D"mailto:unassigned@yoctoproject.org" target=3D"_blank">unassigned@=
yoctoproject.org</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libssh2 =3D &quot;Unassigned &lt;<a href=3D"mail=
to:unassigned@yoctoproject.org" target=3D"_blank">unassigned@yoctoproject.o=
rg</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER:pn-libssp-nonshared =3D &quot;Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
&quot;<br>
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
index 09613294d6..ec0e2d1637 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -40,6 +40,7 @@ PTESTS_FAST =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0libtest-needs-perl \<br>
=C2=A0 =C2=A0 =C2=A0libtest-warnings-perl \<br>
=C2=A0 =C2=A0 =C2=A0libtimedate-perl \<br>
+=C2=A0 =C2=A0 libtoml11 \<br>
=C2=A0 =C2=A0 =C2=A0libtry-tiny-perl \<br>
=C2=A0 =C2=A0 =C2=A0libusb1 \<br>
=C2=A0 =C2=A0 =C2=A0libxml-namespacesupport-perl \<br>
diff --git a/meta/recipes-devtools/libtoml11/files/0001-Remove-whitespace-i=
n-operator.patch b/meta/recipes-devtools/libtoml11/files/0001-Remove-whites=
pace-in-operator.patch<br>
new file mode 100644<br>
index 0000000000..c8c9922d55<br>
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
+Upstream-Status: Submitted [<a href=3D"https://github.com/ToruNiina/toml11=
/pull/285" rel=3D"noreferrer" target=3D"_blank">https://github.com/ToruNiin=
a/toml11/pull/285</a>]<br>
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
index 0000000000..9bc480aa7f<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/libtoml11/files/run-ptest<br>
@@ -0,0 +1,12 @@<br>
+#!/bin/sh<br>
+<br>
+cd tests<br>
+for atest in test_* ; do<br>
+=C2=A0 =C2=A0 rm -rf tests.log<br>
+=C2=A0 =C2=A0 ./${atest} &gt; tests.log 2&gt;&amp;1<br>
+=C2=A0 =C2=A0 if [ $? =3D 0 ] ; then<br>
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
index 0000000000..38786b79ed<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/libtoml11/<a href=3D"http://libtoml11_4.4.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">libtoml11_4.4.0.bb</a><br>
@@ -0,0 +1,38 @@<br>
+SUMMARY =3D &quot;TOML for Modern C++&quot;<br>
+DESCRIPTION =3D &quot;toml11 is a feature-rich TOML language library for \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0C++11/14/17/20.&quo=
t;<br>
+<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/ToruNiina/toml11" rel=3D"=
noreferrer" target=3D"_blank">https://github.com/ToruNiina/toml11</a>&quot;=
<br>
+<br>
+SECTION =3D &quot;libs&quot;<br>
+<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D44d1fcf70c7aa6991533c38daf=
7befa3&quot;<br>
+<br>
+PE =3D &quot;1&quot;<br>
+<br>
+SRCREV =3D &quot;be08ba2be2a964edcdb3d3e3ea8d100abc26f286&quot;<br>
+SRCREV_json =3D &quot;8c391e04fe4195d8be862c97f38cfe10e2a3472e&quot;<br>
+SRCREV_doctest =3D &quot;ae7a13539fb71f270b87eb2e874fbac80bc8dda2&quot;<br=
>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/ToruNiina/toml11;bran=
ch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com=
/ToruNiina/toml11;branch=3Dmain;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/nlohmann/json;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/tests/extlib/=
json;name=3Djson;branch=3Ddevelop;protocol=3Dhttps" rel=3D"noreferrer" targ=
et=3D"_blank">github.com/nlohmann/json;destsuffix=3D${BB_GIT_DEFAULT_DESTSU=
FFIX}/tests/extlib/json;name=3Djson;branch=3Ddevelop;protocol=3Dhttps</a> \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/doctest/doctest;destsuffix=3D$%7BBB_GIT_DEFAULT_DESTSUFFIX%7D/tests/extli=
b/doctest;name=3Ddoctest;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferre=
r" target=3D"_blank">github.com/doctest/doctest;destsuffix=3D${BB_GIT_DEFAU=
LT_DESTSUFFIX}/tests/extlib/doctest;name=3Ddoctest;branch=3Dmaster;protocol=
=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Remove-whitespace-in-=
operator.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
+&quot;<br>
+SRCREV_FORMAT =3D &quot;json_doctest&quot;<br>
+<br>
+<br>
+inherit cmake ptest<br>
+<br>
+EXTRA_OECMAKE +=3D &quot;-DTOML11_PRECOMPILE=3DON \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DTOML11_BU=
ILD_TESTS=3D${@bb.utils.contains(&quot;DISTRO_FEATURES&quot;, &quot;ptest&q=
uot;, &quot;ON&quot;, &quot;OFF&quot;, d)} \<br>
+&quot;<br>
+<br>
+ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
+<br>
+do_install_ptest () {<br>
+=C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 cp -r ${B}/tests/test_* ${D}${PTEST_PATH}/tests<br>
+}<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#227707): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/227707" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/227707</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116789899/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116789899/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000053a5010645fce119--

