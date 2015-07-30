Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6F8B475F23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 20:49:35 +0000 (UTC)
Received: by lafd3 with SMTP id d3so32309062laf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v7RRPf4DKiaehg2naUH9XOVFwOsoxN11Y4/joYM0g+w=;
	b=BDGVrT/7scMJ3FfuEjIMOsYOq0u35z+0dpB+NJ5lzu59sN5laZ9Cw03glD2hPDC6Rw
	oN19FD22TsJY2t78o6Z6QzE7t9Kyryy4U6nMl3fy8M2WkmwyKl9jXb+8f0WoOMgyAt1s
	vUFudwxWzMIUnY9ONGhNOz1rN/mozD+3IMFjWv6NAgzu+aQBVWhsOmsboZ0o2nB79nk2
	UU7GkfTwKdgUCx2utW78Pp/pPrHaFgQHizy9GABeCrUCsp1RATn4nvVCoKPistrs8Wtu
	z+nNFV6S11Ndd6Ff8lsAcMDkvukRmfvH8qp4NTfLoHPXlW4FSFywDOez2RE3jCGtWwes
	C6EA==
X-Gm-Message-State: ALoCoQly8l16DM3MXMgrm+BSiQZCYj1lT6cgy7r1/jv0pn+OI8Zaiucq7ogB0lZU+c/DV91RVu1o
X-Received: by 10.152.28.73 with SMTP id z9mr46190477lag.93.1438289374579;
	Thu, 30 Jul 2015 13:49:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.167.198 with HTTP; Thu, 30 Jul 2015 13:49:14 -0700 (PDT)
In-Reply-To: <1438289269-14804-1-git-send-email-tobias.olausson@pelagicore.com>
References: <1438289269-14804-1-git-send-email-tobias.olausson@pelagicore.com>
From: Tobias Olausson <tobias.olausson@pelagicore.com>
Date: Thu, 30 Jul 2015 13:49:14 -0700
Message-ID: <CAMg8ce_iOWbQ4jvsLqd-sfAtJNKFdkMJ3MdRCi=VwD79UT+rfA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] Revert "mesa: fix do_install_append"
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
X-List-Received-Date: Thu, 30 Jul 2015 20:49:38 -0000
Content-Type: multipart/alternative; boundary=089e0158c02641a27b051c1dd7cb

--089e0158c02641a27b051c1dd7cb
Content-Type: text/plain; charset=UTF-8

Ok I totally screwed this up. Sorry about flooding. Will add fido line of
course.

On 30 July 2015 at 13:47, Tobias Olausson <tobias.olausson@pelagicore.com>
wrote:

> The commit changed an #ifdef to #if defined(), but the source
> code for 10.4 branch of mesa still uses #ifdef.
>
> This reverts commit 12e467f436fbc22f274558c753f0ac9756ce1071.
>
> Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
> ---
>  meta/recipes-graphics/mesa/mesa_10.4.4.bb | 2 +-
>  meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> index 90cccbe..8140411 100644
> --- a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> +++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
> @@ -11,6 +11,6 @@ S = "${WORKDIR}/Mesa-${PV}"
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)};
> then
> -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if
> ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/'
> ${D}${includedir}/EGL/eglplatform.h
> +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/'
> ${D}${includedir}/EGL/eglplatform.h
>      fi
>  }
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb
> b/meta/recipes-graphics/mesa/mesa_git.bb
> index 1598019..cbe8911 100644
> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> @@ -13,6 +13,6 @@ S = "${WORKDIR}/git"
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)};
> then
> -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if
> ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/'
> ${D}${includedir}/EGL/eglplatform.h
> +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/'
> ${D}${includedir}/EGL/eglplatform.h
>      fi
>  }
> --
> 2.1.4
>
>


-- 
Tobias Olausson
M.Sc
Software Engineer

PELAGICORE | Experience Change
Ekelundsgatan 4, 6tr, SE-411 18 Gothenburg, Sweden
Mobile: +46(0)735-873444
E-Mail: tobias.olausson@pelagicore.com
IRC: wto @ FreeNode

--089e0158c02641a27b051c1dd7cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok I totally screwed this up. Sorry about flooding. Will a=
dd fido line of course.<br></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 30 July 2015 at 13:47, Tobias Olausson <span dir=3D"ltr=
">&lt;<a href=3D"mailto:tobias.olausson@pelagicore.com" target=3D"_blank">t=
obias.olausson@pelagicore.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">The commit changed an #ifdef to #if defined(), but the source<br=
>
code for 10.4 branch of mesa still uses #ifdef.<br>
<br>
This reverts commit 12e467f436fbc22f274558c753f0ac9756ce1071.<br>
<br>
Signed-off-by: Tobias Olausson &lt;<a href=3D"mailto:tobias.olausson@pelagi=
core.com">tobias.olausson@pelagicore.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.4.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_10.4.4.bb</a> | 2 +-<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">mesa_git.bb</a>=C2=A0 =C2=A0 | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.4.4.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa_10.4.4.bb</a> b/meta/recipes-graph=
ics/mesa/<a href=3D"http://mesa_10.4.4.bb" rel=3D"noreferrer" target=3D"_bl=
ank">mesa_10.4.4.bb</a><br>
index 90cccbe..8140411 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.4.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_10.4.4.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.4.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_10.4.4.bb</a><br>
@@ -11,6 +11,6 @@ S =3D &quot;${WORKDIR}/Mesa-${PV}&quot;<br>
=C2=A0#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;e=
gl&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#if defined(MESA_EGL_NO_X11_=
HEADERS)/#if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;x11&#39;, &=
#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D}${includedir}/EGL/eglplatform.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#ifdef MESA_EGL_NO_X11_HEADE=
RS/#if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;=
0&#39;, &#39;1&#39;, d)}/&#39; ${D}${includedir}/EGL/eglplatform.h<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa_git.bb</a> b/meta/recipes-graphics/m=
esa/<a href=3D"http://mesa_git.bb" rel=3D"noreferrer" target=3D"_blank">mes=
a_git.bb</a><br>
index 1598019..cbe8911 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">mesa_git.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">mesa_git.bb</a><br>
@@ -13,6 +13,6 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;e=
gl&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#if defined(MESA_EGL_NO_X11_=
HEADERS)/#if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;x11&#39;, &=
#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D}${includedir}/EGL/eglplatform.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#ifdef MESA_EGL_NO_X11_HEADE=
RS/#if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;=
0&#39;, &#39;1&#39;, d)}/&#39; ${D}${includedir}/EGL/eglplatform.h<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"lt=
r"><div>Tobias Olausson<br></div><div>M.Sc</div><div>Software Engineer</div=
><div><div><br></div><div>PELAGICORE | Experience Change</div><div>Ekelunds=
gatan 4, 6tr, SE-411 18 Gothenburg, Sweden<br></div><div>Mobile: +46(0)735-=
873444<br>E-Mail: <a href=3D"mailto:tobias.olausson@pelagicore.com" target=
=3D"_blank">tobias.olausson@pelagicore.com</a> <br></div></div><div>IRC: wt=
o @ FreeNode</div></div></div></div></div></div>
</div>

--089e0158c02641a27b051c1dd7cb--
