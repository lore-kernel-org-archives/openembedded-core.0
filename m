Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3255A65CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 21:27:20 +0000 (UTC)
Received: by lbbyj8 with SMTP id yj8so103315288lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 14:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SaRLu7ueAY6sTqBTirD+OVwRF9vbdt0h/DELx9iAFVE=;
	b=IZl+qASkXXu9YM80MqcubRYk15cfRG8M68V9Ofo8RiIrcx1Wt1cbgAClEY5K2oocLQ
	2vX8qqX5dlFKiLNz9N+T6nWUgj++I7phguOVe7yD+8/viNotdQjWPbtaY0Ayw9/5arK/
	WKmxn086J3Z40An/X5HaD6PJgVJjOL2BE++tFADuaBNABsrW7JAql6xqbzf14OMZVccf
	3cbfNwYgphTk1FwkhXTxRHja/Vna3woXSsd1OcacQsB5iFvRBvOSKTEbcaNJqUyA+6lJ
	feWe/23oWcBuVHjBH8k7ktje2oJEZKHDHb4ix8YRSl/2FtK2K7lAfG4NOZOC42klMl62
	jdXA==
X-Gm-Message-State: ALoCoQkM9N+k2As4cj7iMfNL/r6WJAb+7QzBEvA2GrXUW8GtrfprpQY0E70t2m4qqMtUjoq06XBd
X-Received: by 10.152.19.67 with SMTP id c3mr29623717lae.4.1437427639704; Mon,
	20 Jul 2015 14:27:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.167.198 with HTTP; Mon, 20 Jul 2015 14:27:00 -0700 (PDT)
In-Reply-To: <1435842191-5106-1-git-send-email-Martin.Jansa@gmail.com>
References: <20150620103730.GD2398@jama>
	<1435842191-5106-1-git-send-email-Martin.Jansa@gmail.com>
From: Tobias Olausson <tobias.olausson@pelagicore.com>
Date: Mon, 20 Jul 2015 14:27:00 -0700
Message-ID: <CAMg8ce-Wa5s4xt-19rdYJ4fOa5q7109XZL40AZSBLbitNBKzGw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: respect MESA_EGL_NO_X11_HEADERS even with x11 in PACKAGECONFIG
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
X-List-Received-Date: Mon, 20 Jul 2015 21:27:23 -0000
Content-Type: multipart/alternative; boundary=089e0149420adaf9b8051b553394

--089e0149420adaf9b8051b553394
Content-Type: text/plain; charset=UTF-8

Hi,

I like this patch. I would like a similar patch to be made available in the
fido branch, but changing "#if defined()" to "#ifdef" The defines seems to
have been changed between mesa 10.4 and 10.5, so the current patch only
works for 10.5 - in 10.4 ifdef is used instead so the sed does nothing.
Should I submit another patch for that?

//Tobias

On 2 July 2015 at 06:03, Martin Jansa <martin.jansa@gmail.com> wrote:

> * commit a5ebdb6ad8e4f94ac819275d55575230e057e4ae
>   Author: Valentin Popa <valentin.popa@intel.com>
>   Date:   Tue Feb 18 13:32:16 2014 +0200
>   Subject: mesa: upgrade to 9.2.5
>
>   introduced this do_install_append, but doesn't explain why it doesn't
>   respect MESA_EGL_NO_X11_HEADERS flag anymore.
>
>   Not respecting MESA_EGL_NO_X11_HEADERS breaks any build which is using
>   qtdeclarative+egl in distribution which has x11 in mesa PACKAGECONFIG
>   (e.g. my bitbake world builds).
>
>   The problem is that qtdeclarative is using "None" symbol in
>   QSGTexture::Filtering enum, it's possible to rename it in qtdeclarative,
>   but it's quite invasive and changes qtdeclarative public APIs, see:
>
> https://github.com/webOS-ports/meta-webos-ports/commit/31aa85787a7513e279165a25f6f06ea72c576314
>   so it was rejected by upstream and I don't want to maintain it in
>   meta-qt5 - changing public API in OE build is even worse than if upstream
>   does it.
>
> * This change returns MESA_EGL_NO_X11_HEADERS flag so it's relatively
>   easy to resolve this conflict in such setups by preventing Xlib.h
>   inclusion.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa_10.5.8.bb | 2 +-
>  meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa_10.5.8.bb
> b/meta/recipes-graphics/mesa/mesa_10.5.8.bb
> index 7cfef0c..072cde9 100644
> --- a/meta/recipes-graphics/mesa/mesa_10.5.8.bb
> +++ b/meta/recipes-graphics/mesa/mesa_10.5.8.bb
> @@ -9,6 +9,6 @@ SRC_URI[sha256sum] =
> "2866b855c5299a4aed066338c77ff6467c389b2c30ada7647be8758663
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)};
> then
> -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if
> ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/'
> ${D}${includedir}/EGL/eglplatform.h
> +        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if
> defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG',
> 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
>      fi
>  }
> diff --git a/meta/recipes-graphics/mesa/mesa_git.bb
> b/meta/recipes-graphics/mesa/mesa_git.bb
> index 8f70f67..c034517 100644
> --- a/meta/recipes-graphics/mesa/mesa_git.bb
> +++ b/meta/recipes-graphics/mesa/mesa_git.bb
> @@ -17,6 +17,6 @@ inherit pythonnative
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>  do_install_append() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)};
> then
> -        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if
> ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/'
> ${D}${includedir}/EGL/eglplatform.h
> +        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)$/#if
> defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG',
> 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
>      fi
>  }
> --
> 2.4.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
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

--089e0149420adaf9b8051b553394
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br></div>I like this patch. I would like=
 a similar patch to be made available in the fido branch, but changing &quo=
t;#if defined()&quot; to &quot;#ifdef&quot; The defines seems to have been =
changed between mesa 10.4 and 10.5, so the current patch only works for 10.=
5 - in 10.4 ifdef is used instead so the sed does nothing. Should I submit =
another patch for that?<br><br></div>//Tobias<br></div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On 2 July 2015 at 06:03, Martin Jansa=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"=
_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">* commit a5ebdb6ad8e4f94ac819275d55575230e057e4ae<br>
=C2=A0 Author: Valentin Popa &lt;<a href=3D"mailto:valentin.popa@intel.com"=
>valentin.popa@intel.com</a>&gt;<br>
=C2=A0 Date:=C2=A0 =C2=A0Tue Feb 18 13:32:16 2014 +0200<br>
=C2=A0 Subject: mesa: upgrade to 9.2.5<br>
<br>
=C2=A0 introduced this do_install_append, but doesn&#39;t explain why it do=
esn&#39;t<br>
=C2=A0 respect MESA_EGL_NO_X11_HEADERS flag anymore.<br>
<br>
=C2=A0 Not respecting MESA_EGL_NO_X11_HEADERS breaks any build which is usi=
ng<br>
=C2=A0 qtdeclarative+egl in distribution which has x11 in mesa PACKAGECONFI=
G<br>
=C2=A0 (e.g. my bitbake world builds).<br>
<br>
=C2=A0 The problem is that qtdeclarative is using &quot;None&quot; symbol i=
n<br>
=C2=A0 QSGTexture::Filtering enum, it&#39;s possible to rename it in qtdecl=
arative,<br>
=C2=A0 but it&#39;s quite invasive and changes qtdeclarative public APIs, s=
ee:<br>
=C2=A0 <a href=3D"https://github.com/webOS-ports/meta-webos-ports/commit/31=
aa85787a7513e279165a25f6f06ea72c576314" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/webOS-ports/meta-webos-ports/commit/31aa85787a7513e279=
165a25f6f06ea72c576314</a><br>
=C2=A0 so it was rejected by upstream and I don&#39;t want to maintain it i=
n<br>
=C2=A0 meta-qt5 - changing public API in OE build is even worse than if ups=
tream<br>
=C2=A0 does it.<br>
<br>
* This change returns MESA_EGL_NO_X11_HEADERS flag so it&#39;s relatively<b=
r>
=C2=A0 easy to resolve this conflict in such setups by preventing Xlib.h<br=
>
=C2=A0 inclusion.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com">M=
artin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.5.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_10.5.8.bb</a> | 2 +-<br>
=C2=A0meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">mesa_git.bb</a>=C2=A0 =C2=A0 | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.5.8.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa_10.5.8.bb</a> b/meta/recipes-graph=
ics/mesa/<a href=3D"http://mesa_10.5.8.bb" rel=3D"noreferrer" target=3D"_bl=
ank">mesa_10.5.8.bb</a><br>
index 7cfef0c..072cde9 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.5.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_10.5.8.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_10.5.8.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_10.5.8.bb</a><br>
@@ -9,6 +9,6 @@ SRC_URI[sha256sum] =3D &quot;2866b855c5299a4aed066338c77ff6=
467c389b2c30ada7647be8758663<br>
=C2=A0#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;e=
gl&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#if defined(MESA_EGL_NO_X11_=
HEADERS)/#if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;x11&#39;, &=
#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D}${includedir}/EGL/eglplatform.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#if defined(MESA_EGL_NO_X11_=
HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains(&#39=
;PACKAGECONFIG&#39;, &#39;x11&#39;, &#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D=
}${includedir}/EGL/eglplatform.h<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa_git.bb</a> b/meta/recipes-graphics/m=
esa/<a href=3D"http://mesa_git.bb" rel=3D"noreferrer" target=3D"_blank">mes=
a_git.bb</a><br>
index 8f70f67..c034517 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">mesa_git.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">mesa_git.bb</a><br>
@@ -17,6 +17,6 @@ inherit pythonnative<br>
=C2=A0#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;e=
gl&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#if defined(MESA_EGL_NO_X11_=
HEADERS)/#if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;x11&#39;, &=
#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D}${includedir}/EGL/eglplatform.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/^#if defined(MESA_EGL_NO_X11_=
HEADERS)$/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains(&#39=
;PACKAGECONFIG&#39;, &#39;x11&#39;, &#39;0&#39;, &#39;1&#39;, d)}/&#39; ${D=
}${includedir}/EGL/eglplatform.h<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.4.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"lt=
r"><div>Tobias Olausson<br></div><div>M.Sc</div><div>Software Engineer</div=
><div><div><br></div><div>PELAGICORE | Experience Change</div><div>Ekelunds=
gatan 4, 6tr, SE-411 18 Gothenburg, Sweden<br></div><div>Mobile: +46(0)735-=
873444<br>E-Mail: <a href=3D"mailto:tobias.olausson@pelagicore.com" target=
=3D"_blank">tobias.olausson@pelagicore.com</a> <br></div></div><div>IRC: wt=
o @ FreeNode</div></div></div></div></div></div>
</div>

--089e0149420adaf9b8051b553394--
