Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id D0B0B73CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 10:26:18 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so63640396wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 03:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=p+GTDnVowe+rshYSyXWIS04Q3SxEIvwk+BtpCsjeSKA=;
	b=K8jbf5d2rz3OemXdfBXtJUFKzZe3dHi1NYdOkwKJH8qCCFf3RTlFaZG6KKfbX0K0uQ
	Dbdxx+tS11mW1O3sBoWOcVSeWw9L6zacfSVkhvtM2Rw1rzDN3CQfS4Mvqyql06A7M3+R
	lSg1KBm0ITHw40ScrfZOwLy2YKyyd9MTRezOa7hUOC+PpAh7B08dti10faWURM78e0e7
	Cp6xB3fthIL9DbmODeDsuqmvpNAk67s1SziW3dvhzNU+hbAzxMsVyeNZLy9tijFRckIf
	z+TGbMYkVWHi1bok8ulP/H8nFWejWPs+Pv/TvDIRFXH61SMCx3Jys/4QBzAPIOemAddf
	jaZg==
X-Gm-Message-State: ALoCoQlolB+Ooq3a/elOTKxTotc0cZptAD2pwlKO5LN5qygVuLDJ4rH0rZS/ATI863/tPiirSEnN
X-Received: by 10.180.88.164 with SMTP id bh4mr16958197wib.18.1442399178300;
	Wed, 16 Sep 2015 03:26:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Wed, 16 Sep 2015 03:25:48 -0700 (PDT)
In-Reply-To: <90e4a1064ea7dfa9be458d306bba765136b50306.1442370259.git.liezhi.yang@windriver.com>
References: <cover.1442370259.git.liezhi.yang@windriver.com>
	<90e4a1064ea7dfa9be458d306bba765136b50306.1442370259.git.liezhi.yang@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 16 Sep 2015 13:25:48 +0300
Message-ID: <CAHiDW_Gij3wQ0daYSBetKgBmz-E=DncKUvtP_WJ+O_g-T4vn_w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gtk+/cairo: enable x11 or directfb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Sep 2015 10:26:21 -0000
Content-Type: multipart/alternative; boundary=f46d044303fca5b3d9051fdabae3

--f46d044303fca5b3d9051fdabae3
Content-Type: text/plain; charset=UTF-8

On 16 September 2015 at 05:28, Robert Yang <liezhi.yang@windriver.com>
wrote:
>
> The gtk+2 requires whether x11 or directfb to build, so we need enable
> either of them. The cairo can be built without x11 or directfb, but gtk+
> requires cairo, so enable x11 or directfb for cairo, too.

What is the issue being fixed here? I can see how current config can go
wrong in some situations but I'm not sure if the approach "if x11 is not a
DISTRO_FEATURE, then automatically use direcfb" is much better. Especially
for cairo: I would have thought building multiple surface backends is a
valid choice there?

Jussi

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-gnome/gtk+/gtk+.inc      |    5 ++---
>  meta/recipes-graphics/cairo/cairo.inc |    8 ++++++--
>  2 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+.inc
b/meta/recipes-gnome/gtk+/gtk+.inc
> index be5273d..9d697cdb 100644
> --- a/meta/recipes-gnome/gtk+/gtk+.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+.inc
> @@ -17,9 +17,8 @@ X11DEPENDS = "virtual/libx11 libxext libxcursor
libxrandr libxdamage libxrender
>  DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native
docbook-utils-native \
>   cairo gdk-pixbuf"
>
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',
'', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'directfb',
'directfb', '', d)} \
> -"
> +# Requires x11 or directfb
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',
'directfb', d)}"
>
>  PACKAGECONFIG[x11] = "--with-x=yes
--with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
>  # without --with-gdktarget=directfb it will check for cairo-xlib which
isn't available without X11 DISTRO_FEATURE
> diff --git a/meta/recipes-graphics/cairo/cairo.inc
b/meta/recipes-graphics/cairo/cairo.inc
> index 1e45318..f6474bc 100644
> --- a/meta/recipes-graphics/cairo/cairo.inc
> +++ b/meta/recipes-graphics/cairo/cairo.inc
> @@ -17,8 +17,12 @@ LICENSE_${PN}-perf-utils = "GPLv3+"
>  X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
>  DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
>
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
xcb', '', d)} \
> -           ${@bb.utils.contains('DISTRO_FEATURES', 'directfb',
'directfb', '', d)}"
> +# Build cairo-xlib or cairo-directfb for gtk+
> +PACKAGECONFIG ??= " ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11
xcb', 'directfb', d)} \
> +                    "
> +
> +# No directfb-native, so set PACKAGECONFIG to null when no x11
> +PACKAGECONFIG_class-native ??= "${@bb.utils.contains('DISTRO_FEATURES',
'x11', 'x11', '', d)}"
>
>  PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no
--disable-xlib,${X11DEPENDS}"
>  PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--f46d044303fca5b3d9051fdabae3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 16 September 2015 at 05:28, Robert Yang &lt;<a href=3D"=
mailto:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt; wrote:<=
br>&gt;<br>&gt; The gtk+2 requires whether x11 or directfb to build, so we =
need enable<br>&gt; either of them. The cairo can be built without x11 or d=
irectfb, but gtk+<br>&gt; requires cairo, so enable x11 or directfb for cai=
ro, too.<br><br>What is the issue being fixed here? I can see how current c=
onfig can go wrong in some situations but I&#39;m not sure if the approach =
&quot;if x11 is not a DISTRO_FEATURE, then automatically use direcfb&quot; =
is much better. Especially for cairo: I would have thought building multipl=
e surface backends is a valid choice there?<br><div><br></div><div>Jussi</d=
iv><div><br></div><div>&gt; Signed-off-by: Robert Yang &lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com">liezhi.yang@windriver.com</a>&gt;<br>&gt; ---<=
br>&gt; =C2=A0meta/recipes-gnome/gtk+/gtk+.inc =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 =C2=A05 ++---<br>&gt; =C2=A0meta/recipes-graphics/cairo/cairo.inc | =C2=A0=
 =C2=A08 ++++++--<br>&gt; =C2=A02 files changed, 8 insertions(+), 5 deletio=
ns(-)<br>&gt;<br>&gt; diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/=
recipes-gnome/gtk+/gtk+.inc<br>&gt; index be5273d..9d697cdb 100644<br>&gt; =
--- a/meta/recipes-gnome/gtk+/gtk+.inc<br>&gt; +++ b/meta/recipes-gnome/gtk=
+/gtk+.inc<br>&gt; @@ -17,9 +17,8 @@ X11DEPENDS =3D &quot;virtual/libx11 li=
bxext libxcursor libxrandr libxdamage libxrender<br>&gt; =C2=A0DEPENDS =3D =
&quot;glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native=
 \<br>&gt; =C2=A0 cairo gdk-pixbuf&quot;<br>&gt;<br>&gt; -PACKAGECONFIG ??=
=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#=
39;x11&#39;, &#39;&#39;, d)} \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;directfb&#39;, &#39;d=
irectfb&#39;, &#39;&#39;, d)} \<br>&gt; -&quot;<br>&gt; +# Requires x11 or =
directfb<br>&gt; +PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTR=
O_FEATURES&#39;, &#39;x11&#39;, &#39;x11&#39;, &#39;directfb&#39;, d)}&quot=
;<br>&gt;<br>&gt; =C2=A0PACKAGECONFIG[x11] =3D &quot;--with-x=3Dyes --with-=
gdktarget=3Dx11,--with-x=3Dno,${X11DEPENDS}&quot;<br>&gt; =C2=A0# without -=
-with-gdktarget=3Ddirectfb it will check for cairo-xlib which isn&#39;t ava=
ilable without X11 DISTRO_FEATURE<br>&gt; diff --git a/meta/recipes-graphic=
s/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc<br>&gt; index 1e4=
5318..f6474bc 100644<br>&gt; --- a/meta/recipes-graphics/cairo/cairo.inc<br=
>&gt; +++ b/meta/recipes-graphics/cairo/cairo.inc<br>&gt; @@ -17,8 +17,12 @=
@ LICENSE_${PN}-perf-utils =3D &quot;GPLv3+&quot;<br>&gt; =C2=A0X11DEPENDS =
=3D &quot;virtual/libx11 libsm libxrender libxext&quot;<br>&gt; =C2=A0DEPEN=
DS =3D &quot;libpng fontconfig pixman glib-2.0 zlib&quot;<br>&gt;<br>&gt; -=
PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &=
#39;x11&#39;, &#39;x11 xcb&#39;, &#39;&#39;, d)} \<br>&gt; - =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;d=
irectfb&#39;, &#39;directfb&#39;, &#39;&#39;, d)}&quot;<br>&gt; +# Build ca=
iro-xlib or cairo-directfb for gtk+<br>&gt; +PACKAGECONFIG ??=3D &quot; ${@=
bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11 xcb&#3=
9;, &#39;directfb&#39;, d)} \<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>&gt; +<br>&gt; +# No directfb-n=
ative, so set PACKAGECONFIG to null when no x11<br>&gt; +PACKAGECONFIG_clas=
s-native ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x=
11&#39;, &#39;x11&#39;, &#39;&#39;, d)}&quot;<br>&gt;<br>&gt; =C2=A0PACKAGE=
CONFIG[x11] =3D &quot;--with-x=3Dyes -enable-xlib,--with-x=3Dno --disable-x=
lib,${X11DEPENDS}&quot;<br>&gt; =C2=A0PACKAGECONFIG[xcb] =3D &quot;--enable=
-xcb,--disable-xcb,libxcb&quot;<br>&gt; --<br>&gt; 1.7.9.5<br>&gt;<br>&gt; =
--<br>&gt; _______________________________________________<br>&gt; Openembe=
dded-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.op=
enembedded.org">Openembedded-core@lists.openembedded.org</a><br>&gt; <a hre=
f=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core">http=
://lists.openembedded.org/mailman/listinfo/openembedded-core</a></div></div=
>

--f46d044303fca5b3d9051fdabae3--
