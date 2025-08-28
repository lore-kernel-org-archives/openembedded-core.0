Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA2F3CA0EED
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 06:56:42 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.15048.1756364198805469233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 23:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ILBf/9fr;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b618b7d33so4898385e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 23:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1756364197; x=1756968997; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y00wzi/pLBgQTclGocoxm9mhH7C0C5AYQCuB9WMSzcU=;
        b=ILBf/9frXAeBgWcy0Zt37oK4dnucyFK5v2zCJAr927Cw5Udsavpjc0O/pXpSy1Gg0R
         PRG5kE9NOZHQMZDe1WzZw3mwSIuzK4OpVCIeXfVjCZwYGWBbWEHFAxr0pzsRAAwLoOB0
         ew8vFtSBddSuRK/KM7sXk0QbKoWGYu6dGEHV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756364197; x=1756968997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y00wzi/pLBgQTclGocoxm9mhH7C0C5AYQCuB9WMSzcU=;
        b=ogcy2mwXeeclJEQfc9OoigMrymppCNxahlMYXyL8kE0aUTR9BDrsDsRmdnEIchXMyE
         Kl68qLg2TQAF44T/QuoJxozpP3uw2UILTl8WOxtDyGm/5HcAAiuycAkXFSK5sKy5fs3F
         Dh2jU7z0kOTUWGmsizjac6sMlbN2TIGwglqnv/Yc63PLTa7KMJ5mnA3N3t6sObag+MDa
         0Cn6MDXoK0D29LUeGiwMqU/fKwwqoesPW8/h6G+bZmuM2WzERErxQbVB9Q9Z9VMIRQ2w
         33GxTHM/WbkbIMm/kcItmCIFXX3GCygRh/jjXm+bd58lnSxfM437QByHsi9Th1C+4TVf
         U/ng==
X-Gm-Message-State: AOJu0YyPtPuvKJCSP45NUxCUN28Cemq3BTJYQrkQjd5RuzKBTcCnBDLy
	HljwoVLXQQ/qs8uTokzbeXbbYXIoL5a28qHk2bkBj0Vit85cji2KBAj1XD+I3en2AscerUWC4vO
	+iTHfekzLq4OE3deMmN6tBer1DfEDSvFLr59u9Ogk/Q==
X-Gm-Gg: ASbGncuAo86kKK6BRDpkldZP1ZWpV3eFN3cXH3bmPTX37+fPhA7zZjN9GUXO+krDW9W
	oytNR5Y2X5Dactm80PLwy/mcp2yRC50HZnvJn74DzkV5wuCkPbj6Fuu7VAVwqYEAGmpxr0lC0Wp
	ym/kRLtX0HNrQk50G5/6yJL7KHazPwMg3OqBEM/uKXDHLvr0CjRxvnuqWqpmvxe6tNZJfQPTBrZ
	9fCoW0deI3vdIwDU9EjxdAumPIeoHTIELm34FrsOtDMA4yuO3Jy
X-Google-Smtp-Source: AGHT+IE3yUdPVxY2EHGr2j0i7CF2Jsa/yn6+GN8Fj9xPI+l/CprYr0z6Zg3iA4foOi7HUx1dtx3O9qB0jiwS/p5ZUJ0=
X-Received: by 2002:a05:600c:198b:b0:45b:6705:4fb9 with SMTP id
 5b1f17b1804b1-45b67a9a201mr73087175e9.29.1756364196971; Wed, 27 Aug 2025
 23:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250827222051.367093-1-a-christidis@ti.com>
In-Reply-To: <20250827222051.367093-1-a-christidis@ti.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 28 Aug 2025 08:56:08 +0200
X-Gm-Features: Ac12FXwKsIf29ZtfWiabxmX_pimCOm4x1qcjcRw5NbLcui5RaIxqv6-IGvnCevY
Message-ID: <CAMSfU+498tFH0DSdi+NyFqAaDHQ-qxQgT149fjOBNxHr-2O8gQ@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libsdl2: Add tests package and ptest support
To: a-christidis@ti.com
Cc: openembedded-core@lists.openembedded.org, 
	mathieu.dubois-briand@bootlin.com, alex@linutronix.de
Content-Type: multipart/alternative; boundary="0000000000000e9d49063d676838"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 06:56:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222546

--0000000000000e9d49063d676838
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le jeu. 28 ao=C3=BBt 2025 =C3=A0 00:21, Antonios Christidis via lists.opene=
mbedded.org
<a-christidis=3Dti.com@lists.openembedded.org> a =C3=A9crit :

> From: Antonios Christidis <a-christidis@ti.com>
>
> The SDL2 software comes with its own set of tests. Following that
> introduce support for ptest.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../libsdl2/libsdl2/run-ptest                 | 15 ++++++++++++++
>  .../libsdl2/libsdl2_2.32.8.bb                 | 20 +++++++++++++++++--
>  3 files changed, 34 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index 9a7b25a916..a5476927b5 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -32,6 +32,7 @@ PTESTS_FAST =3D "\
>      libgpg-error\
>      libnl \
>      libpcre \
> +    libsdl2 \
>      libssh2 \
>      libtest-fatal-perl \
>      libtest-needs-perl \
> diff --git a/meta/recipes-graphics/libsdl2/libsdl2/run-ptest
> b/meta/recipes-graphics/libsdl2/libsdl2/run-ptest
> new file mode 100644
> index 0000000000..1cd1f9ceaf
> --- /dev/null
> +++ b/meta/recipes-graphics/libsdl2/libsdl2/run-ptest
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +
> +test_array=3D("testdraw2" "testgeometry" "testsprite2" "testgles2"
> "testoffscreen")
> +
> +test_path=3D"/usr/bin/sdl2_tests/"
> +
> +for test in "${test_array[@]}"
> +do
> +    timeout --preserve-status 10 "$test_path""$test"
> +    if [ $? -eq 0 ]; then
> +        echo "PASS: $test"
> +    else
> +        echo "FAIL: $test"
> +    fi
> +done
>

You should explicitly return 0 (if all tests succeeded) or 1 (if any test
failed).
If I read correctly, your script will always return 0 (success) because the
last command is an 'echo'.

See https://docs.yoctoproject.org/dev/test-manual/ptest.html#running-ptest
(that was added recently)


> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
> b/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
> index 98291e0f80..5aeb333bc7 100644
> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.8.bb
> @@ -21,13 +21,15 @@ LIC_FILES_CHKSUM:append =3D "
> ${@bb.utils.contains('PACKAGECONFIG', 'arm-neon', 'f
>
>  PROVIDES =3D "virtual/libsdl2"
>
> -SRC_URI =3D "https://www.libsdl.org/release/SDL2-${PV}.tar.gz"
> +SRC_URI =3D "https://www.libsdl.org/release/SDL2-${PV}.tar.gz \
> +          file://run-ptest \
> +          "
>
>  S =3D "${UNPACKDIR}/SDL2-${PV}"
>
>  SRC_URI[sha256sum] =3D
> "0ca83e9c9b31e18288c7ec811108e58bac1f1bb5ec6577ad386830eac51c787e"
>
> -inherit cmake lib_package binconfig-disabled pkgconfig
> upstream-version-is-even
> +inherit cmake lib_package binconfig-disabled pkgconfig
> upstream-version-is-even ptest
>  UPSTREAM_CHECK_REGEX =3D "SDL2-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar=
"
>
>  BINCONFIG =3D "${bindir}/sdl2-config"
> @@ -48,6 +50,7 @@ EXTRA_OECMAKE =3D "-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF
> -DSDL_ARTS=3DOFF \
>                   -DSDL_X11_XRANDR=3DOFF \
>                   -DSDL_X11_XSCRNSAVER=3DOFF \
>                   -DSDL_X11_XSHAPE=3DOFF \
> +                -DSDL_TESTS=3DON \
>  "
>
>  # opengl packageconfig factored out to make it easy for distros
> @@ -80,8 +83,21 @@ PACKAGECONFIG[vulkan]    =3D
> "-DSDL_VULKAN=3DON,-DSDL_VULKAN=3DOFF"
>  PACKAGECONFIG[wayland]    =3D
> "-DSDL_WAYLAND=3DON,-DSDL_WAYLAND=3DOFF,wayland-native wayland
> wayland-protocols libxkbcommon"
>  PACKAGECONFIG[x11]        =3D "-DSDL_X11=3DON,-DSDL_X11=3DOFF,virtual/li=
bx11
> libxext libxrandr libxrender"
>
> +do_install:append() {
> +       install -d ${D}${bindir}/sdl2_tests
> +       cp -r ${B}/test/* ${D}${bindir}/sdl2_tests
> +
> +       # Delete any leftover cmake files within the sdl2_tests dir
> +       find ${D}${bindir}/sdl2_tests -type f -name "*.cmake" -delete
> +}
> +
>  CFLAGS:append:class-native =3D " -DNO_SHARED_MEMORY"
>
> +PACKAGE_BEFORE_PN =3D "${PN}-tests"
> +
>  FILES:${PN} +=3D "${datadir}/licenses/SDL2/LICENSE.txt"
> +FILES:${PN}-tests +=3D "${bindir}/sdl2_tests"
> +
> +RDEPENDS:${PN}-ptest =3D "${PN}-tests"
>

Why not put the tests directly in the -ptest package?
(This is mostly out of curiosity. I like the simplicity of a single -ptest
package but I may have missed a reason for the split)

Thanks!


>
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222542):
> https://lists.openembedded.org/g/openembedded-core/message/222542
> Mute This Topic: https://lists.openembedded.org/mt/114926113/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000000e9d49063d676838
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 28 ao=C3=BBt=
 2025 =C3=A0=C2=A000:21, Antonios Christidis via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;a-christidis=3D<a href=3D"ma=
ilto:ti.com@lists.openembedded.org">ti.com@lists.openembedded.org</a>&gt; a=
 =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">From: Antonios Christidis &lt;<a href=3D"mailto:a-christidis@ti.com" tar=
get=3D"_blank">a-christidis@ti.com</a>&gt;<br>
<br>
The SDL2 software comes with its own set of tests. Following that<br>
introduce support for ptest.<br>
<br>
Signed-off-by: Antonios Christidis &lt;<a href=3D"mailto:a-christidis@ti.co=
m" target=3D"_blank">a-christidis@ti.com</a>&gt;<br>
---<br>
=C2=A0.../distro/include/ptest-packagelists.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
1 +<br>
=C2=A0.../libsdl2/libsdl2/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 15 ++++++++++++++<br>
=C2=A0.../libsdl2/<a href=3D"http://libsdl2_2.32.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libsdl2_2.32.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 20 +++++++++++++++++--<br>
=C2=A03 files changed, 34 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/run-ptest<br=
>
<br>
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc<br>
index 9a7b25a916..a5476927b5 100644<br>
--- a/meta/conf/distro/include/ptest-packagelists.inc<br>
+++ b/meta/conf/distro/include/ptest-packagelists.inc<br>
@@ -32,6 +32,7 @@ PTESTS_FAST =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0libgpg-error\<br>
=C2=A0 =C2=A0 =C2=A0libnl \<br>
=C2=A0 =C2=A0 =C2=A0libpcre \<br>
+=C2=A0 =C2=A0 libsdl2 \<br>
=C2=A0 =C2=A0 =C2=A0libssh2 \<br>
=C2=A0 =C2=A0 =C2=A0libtest-fatal-perl \<br>
=C2=A0 =C2=A0 =C2=A0libtest-needs-perl \<br>
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/run-ptest b/meta/recipes=
-graphics/libsdl2/libsdl2/run-ptest<br>
new file mode 100644<br>
index 0000000000..1cd1f9ceaf<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/libsdl2/libsdl2/run-ptest<br>
@@ -0,0 +1,15 @@<br>
+#!/bin/sh<br>
+<br>
+test_array=3D(&quot;testdraw2&quot; &quot;testgeometry&quot; &quot;testspr=
ite2&quot; &quot;testgles2&quot; &quot;testoffscreen&quot;)<br>
+<br>
+test_path=3D&quot;/usr/bin/sdl2_tests/&quot;<br>
+<br>
+for test in &quot;${test_array[@]}&quot;<br>
+do<br>
+=C2=A0 =C2=A0 timeout --preserve-status 10 &quot;$test_path&quot;&quot;$te=
st&quot;<br>
+=C2=A0 =C2=A0 if [ $? -eq 0 ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;PASS: $test&quot;<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;FAIL: $test&quot;<br>
+=C2=A0 =C2=A0 fi<br>
+done<br></blockquote><div><br></div><div>You should explicitly return 0 (i=
f all tests succeeded) or 1 (if any test failed).</div><div>If I read corre=
ctly, your script will always return 0 (success) because the last command i=
s an &#39;echo&#39;.</div><div><br></div><div>See=C2=A0<a href=3D"https://d=
ocs.yoctoproject.org/dev/test-manual/ptest.html#running-ptest">https://docs=
.yoctoproject.org/dev/test-manual/ptest.html#running-ptest</a> (that was ad=
ded recently)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
diff --git a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.32.8=
.bb" rel=3D"noreferrer" target=3D"_blank">libsdl2_2.32.8.bb</a> b/meta/reci=
pes-graphics/libsdl2/<a href=3D"http://libsdl2_2.32.8.bb" rel=3D"noreferrer=
" target=3D"_blank">libsdl2_2.32.8.bb</a><br>
index 98291e0f80..5aeb333bc7 100644<br>
--- a/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.32.8.bb" re=
l=3D"noreferrer" target=3D"_blank">libsdl2_2.32.8.bb</a><br>
+++ b/meta/recipes-graphics/libsdl2/<a href=3D"http://libsdl2_2.32.8.bb" re=
l=3D"noreferrer" target=3D"_blank">libsdl2_2.32.8.bb</a><br>
@@ -21,13 +21,15 @@ LIC_FILES_CHKSUM:append =3D &quot; ${@bb.utils.contains=
(&#39;PACKAGECONFIG&#39;, &#39;arm-neon&#39;, &#39;f<br>
<br>
=C2=A0PROVIDES =3D &quot;virtual/libsdl2&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://www.libsdl.org/release/SDL2-$%7BPV%7D=
.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://www.libsdl.org/releas=
e/SDL2-${PV}.tar.gz</a>&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://www.libsdl.org/release/SDL2-$%7BPV%7D=
.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://www.libsdl.org/releas=
e/SDL2-${PV}.tar.gz</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/SDL2-${PV}&quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;0ca83e9c9b31e18288c7ec811108e58bac1f1bb5=
ec6577ad386830eac51c787e&quot;<br>
<br>
-inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is=
-even<br>
+inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is=
-even ptest<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;SDL2-(?P&lt;pver&gt;\d+\.(\d*[02468])+=
(\.\d+)+)\.tar&quot;<br>
<br>
=C2=A0BINCONFIG =3D &quot;${bindir}/sdl2-config&quot;<br>
@@ -48,6 +50,7 @@ EXTRA_OECMAKE =3D &quot;-DSDL_OSS=3DOFF -DSDL_ESD=3DOFF -=
DSDL_ARTS=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DSDL_X11_XR=
ANDR=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DSDL_X11_XS=
CRNSAVER=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DSDL_X11_XS=
HAPE=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DSDL_TESTS=3DON \=
<br>
=C2=A0&quot;<br>
<br>
=C2=A0# opengl packageconfig factored out to make it easy for distros<br>
@@ -80,8 +83,21 @@ PACKAGECONFIG[vulkan]=C2=A0 =C2=A0 =3D &quot;-DSDL_VULKA=
N=3DON,-DSDL_VULKAN=3DOFF&quot;<br>
=C2=A0PACKAGECONFIG[wayland]=C2=A0 =C2=A0 =3D &quot;-DSDL_WAYLAND=3DON,-DSD=
L_WAYLAND=3DOFF,wayland-native wayland wayland-protocols libxkbcommon&quot;=
<br>
=C2=A0PACKAGECONFIG[x11]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;-DSDL_X11=3DO=
N,-DSDL_X11=3DOFF,virtual/libx11 libxext libxrandr libxrender&quot;<br>
<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}/sdl2_tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${B}/test/* ${D}${bindir}/sdl2_tests<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Delete any leftover cmake files within the sd=
l2_tests dir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${bindir}/sdl2_tests -type f -name &qu=
ot;*.cmake&quot; -delete<br>
+}<br>
+<br>
=C2=A0CFLAGS:append:class-native =3D &quot; -DNO_SHARED_MEMORY&quot;<br>
<br>
+PACKAGE_BEFORE_PN =3D &quot;${PN}-tests&quot;<br>
+<br>
=C2=A0FILES:${PN} +=3D &quot;${datadir}/licenses/SDL2/LICENSE.txt&quot;<br>
+FILES:${PN}-tests +=3D &quot;${bindir}/sdl2_tests&quot;<br>
+<br>
+RDEPENDS:${PN}-ptest =3D &quot;${PN}-tests&quot;<br></blockquote><div><br>=
</div><div>Why not put the tests directly in the -ptest package?</div><div>=
(This is mostly out of curiosity. I like the simplicity of a single -ptest =
package but I may have missed a reason for the split)</div><div><br></div><=
div>Thanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#222542): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/222542" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/222542</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114926113/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114926113/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000000e9d49063d676838--

