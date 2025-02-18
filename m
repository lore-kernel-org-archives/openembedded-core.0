Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDDFC02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 15:46:52 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.22551.1739893609262566152
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 07:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=fdIsHMhW;
 spf=pass (domain: snapchat.com, ip: 209.85.218.47, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab78e6edb99so855232966b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1739893608; x=1740498408; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3stHDRKGzdiLTFuiEPSWmLX/KGsrPPIZRscf2AD8myo=;
        b=fdIsHMhWJlEC5+VYuuLK2BpCOtLqF2ka0leZF3Qzke/2Fv+qxD6g8DQRZj9UvPcnpP
         4Zw/gCZJHeLIRgXamc+epYVkmtYiUi3DZ7oVlVZhKHkW/1Zw3uQcS5wHC2saQecdoRa1
         06AEl6RiTlAIYrHlKnRlEeMvIFLcWl8Z5+ung=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739893608; x=1740498408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3stHDRKGzdiLTFuiEPSWmLX/KGsrPPIZRscf2AD8myo=;
        b=oEs9xgqwZf8UXmu3zwNT7/oUfPNOh8/QggG0iraTz6mCVMxbRsp3Z6OZZs6kCi02FA
         OnbCV1nJH+auGireMz45m98IvTtwzoD/E+IBtWnyRMfZbSAq1jxFwjciwqFu2ywYqKeU
         ywXUptBc46cWVK6Mq99Fx7uIZZzcIYH7gKFxKPtzn9JyHAvW3auRO9rRQGRmz9kF/pmw
         Fx1vzhfpiIL4+PkhjmxLzDeErXXE0qun5B4x/NV5aA8+UdQkHnYwyrbNLWISxpe6j84W
         Hcuh/ZL928i6xVq48DwqV8EMTCaufzSgLlvRevs6XWPglqq5Gc3JepQpW1kACEkSIeJ0
         KcSQ==
X-Gm-Message-State: AOJu0YxTJDdlMaOnhIOuEzrM1YoviQijEm0yDeaslQKy9bk9UbVkmtWO
	RU4Cvw+PtvU7wAaOOfff58zDm1+CNPg/fguWeC80ZQY2oRSY9/JXuaQvom6KWiApWfkHawx4bWy
	lo7V79YWsDmTUHCXaDv0FEwtRtUsHfGq/CytV/g==
X-Gm-Gg: ASbGncuhY5vn0+O2P2Fo5f4m/2g36JoXj+l45N78Nbu7WJZ71DG6rQ3m62Egy0pvM9p
	MgDwXKFVfqXnI2rwaf2Ds+HKNzVQuqUeWZFRNtlIhVfJXml46NQuErgHsSls/g25FojJby7SD
X-Google-Smtp-Source: AGHT+IHd2Yaa+mvFehc+txFnzaNhK3iUNmbBoGtLxtARvVYI47zZkIUQa85lPwAgI+weULZ3QflHhMF60BQInrSUXiw=
X-Received: by 2002:a17:907:9803:b0:abb:bcef:837c with SMTP id
 a640c23a62f3a-abbcd1135ddmr6781366b.56.1739893607563; Tue, 18 Feb 2025
 07:46:47 -0800 (PST)
MIME-Version: 1.0
References: <20250218152226.1410852-1-richard.purdie@linuxfoundation.org> <20250218152226.1410852-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250218152226.1410852-2-richard.purdie@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Tue, 18 Feb 2025 16:46:35 +0100
X-Gm-Features: AWEUYZn5IxkzxJNUzqXfQI24FvfEYL82RJ3JCYcj0gZ2OVAwyHbqaUGjqYv7qFs
Message-ID: <CAHUKmYa4Vy5wHGLpu5d4OcBwZ_h0JqutC3JLLZgaVo6foOEjZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gdb: Include xz support by default and
 clean up PACKAGECONFIG
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006d2e25062e6c8c20"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 15:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211632

--0000000000006d2e25062e6c8c20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,
I've seen that the patch is reverted in master-next. Was an issue
discovered?

=C3=89tienne


On Tue, Feb 18, 2025 at 4:22=E2=80=AFPM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

> Firstly, just include xz support in all gdb configurations to simplify
> config.
> Most systems would already have the shared library so this isn't a big
> problem
> for a larger debugging tool.
>
> The PACKAGECONFIG duplication is also confusing. The only PACKAGECONFIG
> which
> needs special handking is the python one due to the differing modules
> needed
> in the nativesdk case. Remove all the other duplicate entries which shoul=
d
> work
> through our usual class extension code.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc         | 4 +---
>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 6 +-----
>  meta/recipes-devtools/gdb/gdb-cross.inc          | 4 ----
>  3 files changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc
> b/meta/recipes-devtools/gdb/gdb-common.inc
> index ea1fc27a61b..c0312f0f05c 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -30,9 +30,7 @@ EXTRA_OECONF =3D "--disable-gdbtk --disable-x
> --disable-werror \
>                  --with-libgmp-prefix=3D${STAGING_EXECPREFIXDIR} \
>  "
>
> -PACKAGECONFIG ??=3D "readline ${@bb.utils.filter('DISTRO_FEATURES',
> 'debuginfod', d)} python \
> -                   ${@bb.utils.contains('DISTRO_FEATURES',
> 'minidebuginfo', 'xz', '', d)} \
> -                  "
> +PACKAGECONFIG ??=3D "readline ${@bb.utils.filter('DISTRO_FEATURES',
> 'debuginfod', d)} python xz"
>  # Use --without-system-readline to compile with readline 5.
>  PACKAGECONFIG[readline] =3D
> "--with-system-readline,--without-system-readline,readline"
>  PACKAGECONFIG[python] =3D
> "--with-python=3D${WORKDIR}/python,--without-python,python3,python3-codec=
s"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> index 9150c196a85..7b4a7719e44 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> @@ -12,13 +12,9 @@ DEPENDS =3D "nativesdk-ncurses nativesdk-expat
> nativesdk-gettext nativesdk-gmp nat
>  GDBPROPREFIX =3D "--program-prefix=3D'${TARGET_PREFIX}'"
>
>  # Overrides PACKAGECONFIG variables in gdb-common.inc
> -PACKAGECONFIG ??=3D "python readline ${@bb.utils.filter('DISTRO_FEATURES=
',
> 'debuginfod', d)}"
>  PACKAGECONFIG[python] =3D
> "--with-python=3D${WORKDIR}/python,--without-python,nativesdk-python3, \
>                           nativesdk-python3-core \
> -                         nativesdk-python3-codecs
> nativesdk-python3-netclient \
> -                         "
> -PACKAGECONFIG[readline] =3D
> "--with-system-readline,--without-system-readline,nativesdk-readline"
> -PACKAGECONFIG[debuginfod] =3D "--with-debuginfod, --without-debuginfod,
> nativesdk-elfutils"
> +                         nativesdk-python3-codecs
> nativesdk-python3-netclient"
>
>  SSTATE_ALLOW_OVERLAP_FILES +=3D "${STAGING_DATADIR}/gdb"
>
> diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc
> b/meta/recipes-devtools/gdb/gdb-cross.inc
> index 399f4bba97a..110a536db72 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross.inc
> @@ -4,11 +4,7 @@ DEPENDS =3D "expat-native gmp-native mpfr-native
> ncurses-native flex-native bison-
>
>  inherit python3native pkgconfig
>
> -# Overrides PACKAGECONFIG variables in gdb-common.inc
> -PACKAGECONFIG ??=3D "python readline ${@bb.utils.filter('DISTRO_FEATURES=
',
> 'debuginfod', d)}"
>  PACKAGECONFIG[python] =3D
> "--with-python=3D${PYTHON},--without-python,python3-native"
> -PACKAGECONFIG[readline] =3D
> "--with-system-readline,--without-system-readline,readline-native"
> -PACKAGECONFIG[debuginfod] =3D "--with-debuginfod, --without-debuginfod,
> elfutils-native"
>
>  do_compile:prepend() {
>      export STAGING_LIBDIR=3D"${STAGING_LIBDIR_NATIVE}"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211629):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_message_211629&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0h=
pF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=
=3D-grp2Hw5YGFRTHvkycAWrFmUjldRg_rcEJFxKxXFVceWKtghvEjBS2qH8LuVsWpf&s=3DejI=
0vbxFm_uIs7vDFnxMONoR1dQqerFBxsgqvirIg5w&e=3D
> Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_111252056_7048771&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D-grp2Hw5YGFRT=
HvkycAWrFmUjldRg_rcEJFxKxXFVceWKtghvEjBS2qH8LuVsWpf&s=3DyUKWvZDz8t12LWkKREr=
nsTMx2ggprRrXtXcSPchfGMQ&e=3D
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Dcore_unsub&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHva=
bgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3D-grp2H=
w5YGFRTHvkycAWrFmUjldRg_rcEJFxKxXFVceWKtghvEjBS2qH8LuVsWpf&s=3D5zixhZvdEIdb=
PjYGLRifFWUkGmc5NFns0shvwHFHvT4&e=3D
> [ecordonnier@snap.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006d2e25062e6c8c20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<br>I&#39;ve seen that the patch is reverted in=
 master-next. Was an issue discovered?<br><br>=C3=89tienne<br><br></div><br=
><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Feb 18, 2025 at 4:22=E2=80=AFPM Richard Purdie via <a =
href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;richa=
rd.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedded.org">l=
inuxfoundation.org@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Firstly, just include xz support i=
n all gdb configurations to simplify config.<br>
Most systems would already have the shared library so this isn&#39;t a big =
problem<br>
for a larger debugging tool.<br>
<br>
The PACKAGECONFIG duplication is also confusing. The only PACKAGECONFIG whi=
ch<br>
needs special handking is the python one due to the differing modules neede=
d<br>
in the nativesdk case. Remove all the other duplicate entries which should =
work<br>
through our usual class extension code.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-devtools/gdb/gdb-common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 4 +---<br>
=C2=A0meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 6 +-----<br>
=C2=A0meta/recipes-devtools/gdb/gdb-cross.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 4 ----<br>
=C2=A03 files changed, 2 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtoo=
ls/gdb/gdb-common.inc<br>
index ea1fc27a61b..c0312f0f05c 100644<br>
--- a/meta/recipes-devtools/gdb/gdb-common.inc<br>
+++ b/meta/recipes-devtools/gdb/gdb-common.inc<br>
@@ -30,9 +30,7 @@ EXTRA_OECONF =3D &quot;--disable-gdbtk --disable-x --disa=
ble-werror \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-libgmp=
-prefix=3D${STAGING_EXECPREFIXDIR} \<br>
=C2=A0&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;readline ${@bb.utils.filter(&#39;DISTRO_FEATURES=
&#39;, &#39;debuginfod&#39;, d)} python \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;minidebuginfo&#39;, &#39;xz=
&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+PACKAGECONFIG ??=3D &quot;readline ${@bb.utils.filter(&#39;DISTRO_FEATURES=
&#39;, &#39;debuginfod&#39;, d)} python xz&quot;<br>
=C2=A0# Use --without-system-readline to compile with readline 5.<br>
=C2=A0PACKAGECONFIG[readline] =3D &quot;--with-system-readline,--without-sy=
stem-readline,readline&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;--with-python=3D${WORKDIR}/python,--w=
ithout-python,python3,python3-codecs&quot;<br>
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipe=
s-devtools/gdb/gdb-cross-canadian.inc<br>
index 9150c196a85..7b4a7719e44 100644<br>
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc<br>
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc<br>
@@ -12,13 +12,9 @@ DEPENDS =3D &quot;nativesdk-ncurses nativesdk-expat nati=
vesdk-gettext nativesdk-gmp nat<br>
=C2=A0GDBPROPREFIX =3D &quot;--program-prefix=3D&#39;${TARGET_PREFIX}&#39;&=
quot;<br>
<br>
=C2=A0# Overrides PACKAGECONFIG variables in gdb-common.inc<br>
-PACKAGECONFIG ??=3D &quot;python readline ${@bb.utils.filter(&#39;DISTRO_F=
EATURES&#39;, &#39;debuginfod&#39;, d)}&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;--with-python=3D${WORKDIR}/python,--w=
ithout-python,nativesdk-python3, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 nativesdk-python3-core \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0nativesdk-python3-codecs nativesdk-python3-netclient \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&quot;<br>
-PACKAGECONFIG[readline] =3D &quot;--with-system-readline,--without-system-=
readline,nativesdk-readline&quot;<br>
-PACKAGECONFIG[debuginfod] =3D &quot;--with-debuginfod, --without-debuginfo=
d, nativesdk-elfutils&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0nativesdk-python3-codecs nativesdk-python3-netclient&quot;=
<br>
<br>
=C2=A0SSTATE_ALLOW_OVERLAP_FILES +=3D &quot;${STAGING_DATADIR}/gdb&quot;<br=
>
<br>
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtool=
s/gdb/gdb-cross.inc<br>
index 399f4bba97a..110a536db72 100644<br>
--- a/meta/recipes-devtools/gdb/gdb-cross.inc<br>
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc<br>
@@ -4,11 +4,7 @@ DEPENDS =3D &quot;expat-native gmp-native mpfr-native ncur=
ses-native flex-native bison-<br>
<br>
=C2=A0inherit python3native pkgconfig<br>
<br>
-# Overrides PACKAGECONFIG variables in gdb-common.inc<br>
-PACKAGECONFIG ??=3D &quot;python readline ${@bb.utils.filter(&#39;DISTRO_F=
EATURES&#39;, &#39;debuginfod&#39;, d)}&quot;<br>
=C2=A0PACKAGECONFIG[python] =3D &quot;--with-python=3D${PYTHON},--without-p=
ython,python3-native&quot;<br>
-PACKAGECONFIG[readline] =3D &quot;--with-system-readline,--without-system-=
readline,readline-native&quot;<br>
-PACKAGECONFIG[debuginfod] =3D &quot;--with-debuginfod, --without-debuginfo=
d, elfutils-native&quot;<br>
<br>
=C2=A0do_compile:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0export STAGING_LIBDIR=3D&quot;${STAGING_LIBDIR_NATIVE}&=
quot;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211629): <a href=3D"https://urldefense.proofpoint.com/v=
2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_message_21=
1629&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp=
;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D-grp2Hw5YGFRTHvkyc=
AWrFmUjldRg_rcEJFxKxXFVceWKtghvEjBS2qH8LuVsWpf&amp;s=3DejI0vbxFm_uIs7vDFnxM=
ONoR1dQqerFBxsgqvirIg5w&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">http=
s://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g=
_openembedded-2Dcore_message_211629&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh=
0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66=
m67E&amp;m=3D-grp2Hw5YGFRTHvkycAWrFmUjldRg_rcEJFxKxXFVceWKtghvEjBS2qH8LuVsW=
pf&amp;s=3DejI0vbxFm_uIs7vDFnxMONoR1dQqerFBxsgqvirIg5w&amp;e=3D</a> <br>
Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dht=
tps-3A__lists.openembedded.org_mt_111252056_7048771&amp;d=3DDwIFaQ&amp;c=3D=
ncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsR=
ih1DULJTKUkSGa66m67E&amp;m=3D-grp2Hw5YGFRTHvkycAWrFmUjldRg_rcEJFxKxXFVceWKt=
ghvEjBS2qH8LuVsWpf&amp;s=3DyUKWvZDz8t12LWkKRErnsTMx2ggprRrXtXcSPchfGMQ&amp;=
e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint.co=
m/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_111252056_7048771&amp;d=3D=
DwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonV=
uMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D-grp2Hw5YGFRTHvkycAWrFmUjldRg_r=
cEJFxKxXFVceWKtghvEjBS2qH8LuVsWpf&amp;s=3DyUKWvZDz8t12LWkKRErnsTMx2ggprRrXt=
XcSPchfGMQ&amp;e=3D</a> <br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-=
3A__lists.openembedded.org_g_openembedded-2Dcore_unsub&amp;d=3DDwIFaQ&amp;c=
=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9=
TsRih1DULJTKUkSGa66m67E&amp;m=3D-grp2Hw5YGFRTHvkycAWrFmUjldRg_rcEJFxKxXFVce=
WKtghvEjBS2qH8LuVsWpf&amp;s=3D5zixhZvdEIdbPjYGLRifFWUkGmc5NFns0shvwHFHvT4&a=
mp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoint=
.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Dcore_unsu=
b&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=
=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3D-grp2Hw5YGFRTHvkycAW=
rFmUjldRg_rcEJFxKxXFVceWKtghvEjBS2qH8LuVsWpf&amp;s=3D5zixhZvdEIdbPjYGLRifFW=
UkGmc5NFns0shvwHFHvT4&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:ecordonnier@sna=
p.com" target=3D"_blank">ecordonnier@snap.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000006d2e25062e6c8c20--

