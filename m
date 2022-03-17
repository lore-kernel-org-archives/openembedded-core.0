Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A265C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 00:58:52 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.4876.1647478730838522718
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 17:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=Y8RLQf4P;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.173,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f173.google.com with SMTP id d15so2164649qty.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 17:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=XU2oFjXJCngkluf9zcCagHK/CvXOswjSMB9O2mDVQL0=;
        b=Y8RLQf4PZlX1w/h11ItQQoumArFi/dB/QurmF5SFPhYSMnPzEBYsMLV+sF+/+0dyPj
         Bc3d/YzJtcpjZpYl1h0Yw8Hy53hcnsTPw41EJv4wnaKoRWvc0uI65r5pDB0IZvqm5amS
         gncYG5a+dc9LKBE3+G4uhMYL3zgiFiIgnhbfS0CRem3E8C0GoZ4ra9DDNvCbmP4FdbXh
         CX2gx4xrOI+eFpoMWD7uM28Vki+BEQWc0NZDLsvWfek5u6fIiKmEahqeal7bMBgcWjYF
         R5uOA9vL182PRLcntPzyZG8+TlsfZdpXuylmEy+r6cehMz78x0PYNB3VpchBZZQFpNGB
         +0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=XU2oFjXJCngkluf9zcCagHK/CvXOswjSMB9O2mDVQL0=;
        b=1xyRWELXzsFngjHooZPN0zisrvSm9zMRf7N82Z3xB/4El9iqP52JHPJm004gjBpgz+
         IvOijcIiaUpMgDztrtBlUZZDM43vd5li0qO9yjM2lWN8ctizp+2Jn29yfyrsZSIXQtpU
         hrTqWUx9WOL185Xo3b4jGPnqvAg0BCuUEY5nFHXLm/FZvfzNj1T7pzSrbuMsEW9mZKLG
         PE8iJ/a4THUxs+/wStq2Yr3DDpw/FXgusF5U1MCXLnZ6jjDifSX1pUtRD1x5od5ZssT8
         RDB/I0U4Iq77iFMX1yn7O57/zbbWNkyiA/5a6QgzbL9vkLjgQmFSrzgGQhyx7dTJFukb
         FRmg==
X-Gm-Message-State: AOAM531bliV+S7ATc+qX2awENEuTASV/UDzs9y+fLiy20USTTraz6LhJ
	SLqY9nwsECTzfvUik2FNvS+2bBYRaBP9DzR9
X-Google-Smtp-Source: 
 ABdhPJwmlYntJZhfoA7WCfRSBa4UhjMzUlmoKyUQtvYOwWlekDhLFgpz+qE3EwIrt3EWafh8c7PBhQ==
X-Received: by 2002:a05:622a:1a24:b0:2e0:722c:b13a with SMTP id
 f36-20020a05622a1a2400b002e0722cb13amr1930836qtb.519.1647478729697;
        Wed, 16 Mar 2022 17:58:49 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com.
 [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id
 x20-20020ac85f14000000b002e1ee1c56c3sm1132339qta.76.2022.03.16.17.58.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 17:58:49 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f173.google.com with SMTP id r127so3271851qke.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 17:58:49 -0700 (PDT)
X-Received: by 2002:a37:c20b:0:b0:67b:3585:4687 with SMTP id
 i11-20020a37c20b000000b0067b35854687mr1494158qkm.280.1647478728830; Wed, 16
 Mar 2022 17:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220316134702.2604952-1-zboszor@pr.hu>
In-Reply-To: <20220316134702.2604952-1-zboszor@pr.hu>
Date: Wed, 16 Mar 2022 21:58:37 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKra71Be4LZoiAKR62=NzzYNofcK5_HF_DBqQx6-RthHgg@mail.gmail.com>
Message-ID: 
 <CAP9ODKra71Be4LZoiAKR62=NzzYNofcK5_HF_DBqQx6-RthHgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: Allow building Mesa's OpenCL through
 PACKAGECONFIG
To: Boszormenyi Zoltan <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000068334305da5f88fd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 00:58:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163366

--00000000000068334305da5f88fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Awesome!

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Em qua., 16 de mar. de 2022 =C3=A0s 10:47, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> escreveu:

> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index 2a89b8e8f0..4ce69a78f8 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -74,7 +74,6 @@ MESON_BUILDTYPE =3D "${@check_buildtype(d)}"
>
>  EXTRA_OEMESON =3D " \
>      -Dshared-glapi=3Denabled \
> -    -Dgallium-opencl=3Ddisabled \
>      -Dglx-read-only-text=3Dtrue \
>      -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
>  "
> @@ -122,6 +121,9 @@ PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled
> -Dgles2=3Denabled, -Dgles1=3Ddisabled -Dgles2
>  # "egl" requires "opengl"
>  PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
>
> +# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
> +PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd
> -Dopencl-spirv=3Dtrue,-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,=
libclc
> spirv-tools"
> +
>  PACKAGECONFIG[broadcom] =3D ""
>  PACKAGECONFIG[etnaviv] =3D ""
>  PACKAGECONFIG[freedreno] =3D ""
> @@ -190,6 +192,8 @@ RDEPENDS:${PN}-dev =3D ""
>  # development package of libgles3.
>  RDEPENDS:libgles3-mesa-dev +=3D "libgles2-mesa-dev"
>
> +RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG',
> 'opencl', 'libclc spirv-tools', '', d)}"
> +
>  PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libosmesa libosmesa-dev \
>               libgl-mesa libgl-mesa-dev \
> @@ -198,6 +202,7 @@ PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>               libgles1-mesa libgles1-mesa-dev \
>               libgles2-mesa libgles2-mesa-dev \
>               libgles3-mesa libgles3-mesa-dev \
> +             libopencl-mesa libopencl-mesa-dev \
>               libxatracker libxatracker-dev \
>               mesa-megadriver mesa-vulkan-drivers \
>               mesa-vdpau-drivers \
> @@ -230,7 +235,8 @@ python __anonymous() {
>                ("opengl", "libgl", "libgl1"),
>                ("gles", "libgles1", "libglesv1-cm1"),
>                ("gles", "libgles2", "libglesv2-2"),
> -              ("gles", "libgles3",)):
> +              ("gles", "libgles3",),
> +              ("opencl", "libopencl",)):
>          if not p[0] in pkgconfig:
>              continue
>          mlprefix =3D d.getVar("MLPREFIX")
> @@ -290,6 +296,7 @@ FILES:libgbm =3D "${libdir}/libgbm.so.*"
>  FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
>  FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
>  FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
> +FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.*
> ${sysconfdir}/OpenCL/vendors/mesa.icd"
>  FILES:libglapi =3D "${libdir}/libglapi.so.*"
>  FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
>  FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163331):
> https://lists.openembedded.org/g/openembedded-core/message/163331
> Mute This Topic: https://lists.openembedded.org/mt/89821896/3617537
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> otavio.salvador@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000068334305da5f88fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Awesome!</div><div><br></div><div>Acked-by: Otavio Sa=
lvador &lt;<a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.=
br</a>&gt;</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">Em qua., 16 de mar. de 2022 =C3=A0s 10:47, Zoltan Boszormenyi via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;z=
boszor=3D<a href=3D"mailto:pr.hu@lists.openembedded.org">pr.hu@lists.openem=
bedded.org</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"ma=
ilto:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
<br>
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc | 11 +++++++++--<br>
=C2=A01 file changed, 9 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index 2a89b8e8f0..4ce69a78f8 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -74,7 +74,6 @@ MESON_BUILDTYPE =3D &quot;${@check_buildtype(d)}&quot;<br=
>
<br>
=C2=A0EXTRA_OEMESON =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0-Dshared-glapi=3Denabled \<br>
-=C2=A0 =C2=A0 -Dgallium-opencl=3Ddisabled \<br>
=C2=A0 =C2=A0 =C2=A0-Dglx-read-only-text=3Dtrue \<br>
=C2=A0 =C2=A0 =C2=A0-Dplatforms=3D&#39;${@&quot;,&quot;.join(&quot;${PLATFO=
RMS}&quot;.split())}&#39; \<br>
=C2=A0&quot;<br>
@@ -122,6 +121,9 @@ PACKAGECONFIG[gles] =3D &quot;-Dgles1=3Denabled -Dgles2=
=3Denabled, -Dgles1=3Ddisabled -Dgles2<br>
=C2=A0# &quot;egl&quot; requires &quot;opengl&quot;<br>
=C2=A0PACKAGECONFIG[egl] =3D &quot;-Degl=3Denabled, -Degl=3Ddisabled&quot;<=
br>
<br>
+# &quot;opencl&quot; requires libclc from meta-clang and spirv-tools from =
OE-Core<br>
+PACKAGECONFIG[opencl] =3D &quot;-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtr=
ue,-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc spirv-tools&qu=
ot;<br>
+<br>
=C2=A0PACKAGECONFIG[broadcom] =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[etnaviv] =3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[freedreno] =3D &quot;&quot;<br>
@@ -190,6 +192,8 @@ RDEPENDS:${PN}-dev =3D &quot;&quot;<br>
=C2=A0# development package of libgles3.<br>
=C2=A0RDEPENDS:libgles3-mesa-dev +=3D &quot;libgles2-mesa-dev&quot;<br>
<br>
+RDEPENDS:libopencl-mesa +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG=
&#39;, &#39;opencl&#39;, &#39;libclc spirv-tools&#39;, &#39;&#39;, d)}&quot=
;<br>
+<br>
=C2=A0PACKAGES =3D+ &quot;libegl-mesa libegl-mesa-dev \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libosmesa libosmesa-dev \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libgl-mesa libgl-mesa-dev =
\<br>
@@ -198,6 +202,7 @@ PACKAGES =3D+ &quot;libegl-mesa libegl-mesa-dev \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libgles1-mesa libgles1-mes=
a-dev \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libgles2-mesa libgles2-mes=
a-dev \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libgles3-mesa libgles3-mes=
a-dev \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libopencl-mesa libopencl-m=
esa-dev \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libxatracker libxatracker-=
dev \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mesa-megadriver mesa-vulka=
n-drivers \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mesa-vdpau-drivers \<br>
@@ -230,7 +235,8 @@ python __anonymous() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;opengl&quot;,=
 &quot;libgl&quot;, &quot;libgl1&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;gles&quot;, &=
quot;libgles1&quot;, &quot;libglesv1-cm1&quot;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(&quot;gles&quot;, &=
quot;libgles2&quot;, &quot;libglesv2-2&quot;),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;gles&quot;, &quot;=
libgles3&quot;,)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;gles&quot;, &quot;=
libgles3&quot;,),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (&quot;opencl&quot;, &quo=
t;libopencl&quot;,)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not p[0] in pkgconfig:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mlprefix =3D d.getVar(&quot;MLPREFIX&quot=
;)<br>
@@ -290,6 +296,7 @@ FILES:libgbm =3D &quot;${libdir}/libgbm.so.*&quot;<br>
=C2=A0FILES:libgles1-mesa =3D &quot;${libdir}/libGLESv1*.so.*&quot;<br>
=C2=A0FILES:libgles2-mesa =3D &quot;${libdir}/libGLESv2.so.*&quot;<br>
=C2=A0FILES:libgl-mesa =3D &quot;${libdir}/libGL.so.*&quot;<br>
+FILES:libopencl-mesa =3D &quot;${libdir}/libMesaOpenCL.so.* ${sysconfdir}/=
OpenCL/vendors/mesa.icd&quot;<br>
=C2=A0FILES:libglapi =3D &quot;${libdir}/libglapi.so.*&quot;<br>
=C2=A0FILES:libosmesa =3D &quot;${libdir}/libOSMesa.so.*&quot;<br>
=C2=A0FILES:libxatracker =3D &quot;${libdir}/libxatracker.so.*&quot;<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#163331): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/163331" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/163331</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89821896/3617=
537" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89821896/3617537</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:otavio.salvador@gmail.com"=
 target=3D"_blank">otavio.salvador@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Sys=
tems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://ww=
w.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.os=
systems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobil=
e: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) =
903-9750</div></div>

--00000000000068334305da5f88fd--

