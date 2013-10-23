Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 13DE56D2CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 12:14:23 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hm4so751959wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 05:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Je+jyUlrKp+e8FrRaVt+Txzo6T+XSJx+d3vkmllf6O8=;
	b=bVYBMOFEW9B1XHaYKF2Q7y5btGjHBDxwvDBBmiNuuoEKl2FQcHltXwbzxa2UnQB3sl
	8gp7VKpL56NxYYDVSBN24dZUEfWGH/ROvqBOu1yu3XUn3AqIqIXvDjgIWZIejPtHDH71
	vcYtTgO0b4Clv0R4ovwbKt9z9hEqXt3568DkB48gZYLCBvHf1lkoJCrsYl3aBNSnKBsl
	IFiYQ/kLLj5ibCX4Mq3Ip39LbyI3iNWWnUDZU57oqU9wA36uYfMnmcvGAttggOxwDCoi
	VPGdir7wU7sNygTpe2b5pQhgf2o4Mw0txkbrDFI4rsrtc3hhKNO6rRc/p/ir2VE+yojp
	k48g==
MIME-Version: 1.0
X-Received: by 10.194.78.78 with SMTP id z14mr1402033wjw.32.1382530465139;
	Wed, 23 Oct 2013 05:14:25 -0700 (PDT)
Received: by 10.194.179.198 with HTTP; Wed, 23 Oct 2013 05:14:25 -0700 (PDT)
In-Reply-To: <CAP71Wjz1RWNPNfx58g+FsvDuk7U=zSH57LSpjPbMJ+O2ZPUL6w@mail.gmail.com>
References: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
	<20130909120824.GQ11500@jama>
	<CAJTo0LaLKDACnUd6BZdUjLR6p87unCaF4pH_g+c3b-5c4w2NLw@mail.gmail.com>
	<CAP71WjxEp-LEe7UW+F9vUig4SAAd8vN4hkm3DUgjYvZQ6TSZ=A@mail.gmail.com>
	<CAP71Wjx-yoVSyqONwZsTWe5WNNac2nauCuxTNy81n3Ln5qJTzQ@mail.gmail.com>
	<CAJTo0LarVcibeP+x93G1fVVh0xvSs7E3qBY-OHhRnsYL3VzGrA@mail.gmail.com>
	<CAP71Wjz1RWNPNfx58g+FsvDuk7U=zSH57LSpjPbMJ+O2ZPUL6w@mail.gmail.com>
Date: Wed, 23 Oct 2013 14:14:25 +0200
Message-ID: <CA+chaQejs+Ac7YkLnDW5Eu9U15FotmH_XGq1y9z_m4j+ZLOwPQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Haifeng Yan <haifeng.yan@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] mesa: use distro_features_check to abort build without opengl feature
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
X-List-Received-Date: Wed, 23 Oct 2013 12:14:24 -0000
Content-Type: multipart/alternative; boundary=047d7bf0d5244415ea04e967759f

--047d7bf0d5244415ea04e967759f
Content-Type: text/plain; charset=UTF-8

Even if there is separate DISTRO_FEATURE for gles, we still have problem
that the same distribution can support MACHINEs with different support for
*gl*.

You still cannot build the same TUNE_PKGARCH qtbase package where once it's
used for MACHINE where you have only mesa as *gl* provider and for
different MACHINE which has binary blob for gles2. DISTRO_FEATUREs can
contain only common denominator for features available in all supported
MACHINEs. Splitting it to 2 separate features doesn't help with this.

And if we cannot build TUNE_PKGARCH qtbase we would need to make also
qtwebkit MACHINE_ARCH and I really don't like it, because of webkit build
time :/.


On Wed, Oct 23, 2013 at 11:25 AM, Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

> On Wed, Oct 23, 2013 at 11:00 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 23 October 2013 09:53, Nicolas Dechesne <nicolas.dechesne@linaro.org>
> wrote:
> >> i am still not convinced that we should treat GL and GLES with a
> >> single 'DISTRO_FEATURE' since they aren't 'equivalent' features. I
> >> understand we need a mechanism to say if the platforms has 'graphics'
> >> support, and for some recipes 'graphics' is enough, but especially for
> >> libsdl this isn't enough since on GLES platforms we don't want
> >> --enable-video-opengl to be enabled since that is a GL feature, not
> >> GLES.
> >
> > I don't think anyone thinks that the current opengl feature is
> > sufficient but there hasn't been a good enough alternative just yet.
> > Are you proposing that the "opengl" distro feature is re-purposed as
> > "OpenGL", and we add "opengles" for "OpenGLES".  Does this need to be
> > GLES-version-specific, what about EGL, and what about machines which
> > can support multiple drivers/GPU hardware?
>
> well, that's more or less what I had said in that thread earlier. e.g.
> make opengl vs opengles 2 distinct "DISTRO_FEATURE". at least what's
> sure now, is that currently it is broken, libsdl is the only instance
> we have noticed the problem, there could be more, not sure.
>
> i agree that we could easily extend the number of combos... but we
> could start 'small' and add new 'feature' whenever needed. the problem
> is probably even more subtle... right now opengl is a DISTRO_FEATURE
> to say globally if the 'distro/stack' we build has some sort of
> graphics.. if we start getting into EGL, GLX, and GL/GLES versions
> then we start going into machine features.
>
> a quick grep (in the layers i use) reveals that the situation isn't
> really too good ;-)
>
> -- meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:
> PACKAGECONFIG
> ??= "${@base_contains('DISTRO_FEATURES', 'opengl', 'opengl',
> 'openglesv2', d)}"
> -- meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:
>    ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-gl',
> '--enable-gles', d)} \
>
> here, we use opengl distro feature to switch between GL and GLES
>
> -- meta-qt5/recipes-qt/qt5/qtbase.inc:PACKAGECONFIG_GL ?=
> "${@base_contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)}"
>
> here, opengl is used to enable GL , nothing about GLES. in our layer,
> we have added a .bbapend with this to get Qt to work:
>
> # By default, qtbase.inc PACKAGECONFIG_GL is either "gl" (if
> DISTRO_FEATURES
> # includes "opengl") or empty (if it doesn't). Over-ride and force to
> "gles2".
> PACKAGECONFIG_GL = "gles2"
>
> -- openembedded-core/meta/conf/machine/include/ia32-base.inc:
>  ${@base_contains('DISTRO_FEATURES', 'opengl',
> 'xserver-xorg-extension-glx', '', d)} \
>
> here, used to enable GLX
>
> -- openembedded-core/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb:
>        ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl',
> '', d)} \
> -- openembedded-core/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb:
>             ${@base_contains('DISTRO_FEATURES', 'opengl',
> '--enable-video-opengl', '--disable-video-opengl', d)} \
>
> here to enable GL features, incompatible with GLES.
>
> -- openembedded-core/meta/recipes-graphics/wayland/weston_1.1.0.bb:
>                ${@base_contains('DISTRO_FEATURES', 'opengles2',
> 'gles', '', d)} \
>
> here, we have an instance of opengles2, which we discussed already.
> that's the only place where we have that, and you agreed it was a bug.
>
> --
> openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.13.bb:
> PACKAGECONFIG
> ??= "sna udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri', '',
> d)}"
> --
> openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc:PACKAGECONFIG
> ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'dri dri2
> glx', '', d)}"
>
> to enable GLX/DRI
>
> -- openembedded-core/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb:DEPENDS
> += " ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl',
> '', d)}"
>
> another instance, like libsdl which would break on GLES only platform.
>
> -- openembedded-core/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb:
>            ${@base_contains('DISTRO_FEATURES', 'opengl',
> '--enable-webgl', '--disable-webgl', d)} \
>
> here to enable WebGL
>
> So i think given these examples, it's difficult to 'define' what
> opengl DISTRO_FEATURE means. it is used for many different things, so
> maybe this isn't the 'right level of abstraction'. what do you think?
>
>
> ps: sorry, i have the feeling that gmail is going to mess up very
> badly with the formatting of this email...
>

--047d7bf0d5244415ea04e967759f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Even if there is separate DISTRO_FEATURE for gle=
s, we still have problem that the same distribution can support MACHINEs wi=
th different support for *gl*.<br><br></div>You still cannot build the same=
 TUNE_PKGARCH qtbase package where once it&#39;s used for MACHINE where you=
 have only mesa as *gl* provider and for different MACHINE which has binary=
 blob for gles2. DISTRO_FEATUREs can contain only common denominator for fe=
atures available in all supported MACHINEs. Splitting it to 2 separate feat=
ures doesn&#39;t help with this.<br>
<br></div>And if we cannot build TUNE_PKGARCH qtbase we would need to make =
also qtwebkit MACHINE_ARCH and I really don&#39;t like it, because of webki=
t build time :/.<br></div><div class=3D"gmail_extra"><br><br><div class=3D"=
gmail_quote">
On Wed, Oct 23, 2013 at 11:25 AM, Nicolas Dechesne <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dech=
esne@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"HOEnZb"><div class=3D"h5">On Wed, Oct 23, 2013 at 11:00 AM, B=
urton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.=
com</a>&gt; wrote:<br>
&gt; On 23 October 2013 09:53, Nicolas Dechesne &lt;<a href=3D"mailto:nicol=
as.dechesne@linaro.org">nicolas.dechesne@linaro.org</a>&gt; wrote:<br>
&gt;&gt; i am still not convinced that we should treat GL and GLES with a<b=
r>
&gt;&gt; single &#39;DISTRO_FEATURE&#39; since they aren&#39;t &#39;equival=
ent&#39; features. I<br>
&gt;&gt; understand we need a mechanism to say if the platforms has &#39;gr=
aphics&#39;<br>
&gt;&gt; support, and for some recipes &#39;graphics&#39; is enough, but es=
pecially for<br>
&gt;&gt; libsdl this isn&#39;t enough since on GLES platforms we don&#39;t =
want<br>
&gt;&gt; --enable-video-opengl to be enabled since that is a GL feature, no=
t<br>
&gt;&gt; GLES.<br>
&gt;<br>
&gt; I don&#39;t think anyone thinks that the current opengl feature is<br>
&gt; sufficient but there hasn&#39;t been a good enough alternative just ye=
t.<br>
&gt; Are you proposing that the &quot;opengl&quot; distro feature is re-pur=
posed as<br>
&gt; &quot;OpenGL&quot;, and we add &quot;opengles&quot; for &quot;OpenGLES=
&quot;. =C2=A0Does this need to be<br>
&gt; GLES-version-specific, what about EGL, and what about machines which<b=
r>
&gt; can support multiple drivers/GPU hardware?<br>
<br>
</div></div>well, that&#39;s more or less what I had said in that thread ea=
rlier. e.g.<br>
make opengl vs opengles 2 distinct &quot;DISTRO_FEATURE&quot;. at least wha=
t&#39;s<br>
sure now, is that currently it is broken, libsdl is the only instance<br>
we have noticed the problem, there could be more, not sure.<br>
<br>
i agree that we could easily extend the number of combos... but we<br>
could start &#39;small&#39; and add new &#39;feature&#39; whenever needed. =
the problem<br>
is probably even more subtle... right now opengl is a DISTRO_FEATURE<br>
to say globally if the &#39;distro/stack&#39; we build has some sort of<br>
graphics.. if we start getting into EGL, GLX, and GL/GLES versions<br>
then we start going into machine features.<br>
<br>
a quick grep (in the layers i use) reveals that the situation isn&#39;t<br>
really too good ;-)<br>
<br>
-- meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb:P=
ACKAGECONFIG<br>
??=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &=
#39;opengl&#39;,<br>
&#39;openglesv2&#39;, d)}&quot;<br>
-- meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/<a href=3D"ht=
tp://xbmc_git.bb" target=3D"_blank">xbmc_git.bb</a>:<br>
=C2=A0 =C2=A0${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, =
&#39;--enable-gl&#39;,<br>
&#39;--enable-gles&#39;, d)} \<br>
<br>
here, we use opengl distro feature to switch between GL and GLES<br>
<br>
-- meta-qt5/recipes-qt/qt5/qtbase.inc:PACKAGECONFIG_GL ?=3D<br>
&quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &#39;gl=
&#39;, &#39;&#39;, d)}&quot;<br>
<br>
here, opengl is used to enable GL , nothing about GLES. in our layer,<br>
we have added a .bbapend with this to get Qt to work:<br>
<br>
# By default, qtbase.inc PACKAGECONFIG_GL is either &quot;gl&quot; (if DIST=
RO_FEATURES<br>
# includes &quot;opengl&quot;) or empty (if it doesn&#39;t). Over-ride and =
force to &quot;gles2&quot;.<br>
PACKAGECONFIG_GL =3D &quot;gles2&quot;<br>
<br>
-- openembedded-core/meta/conf/machine/include/ia32-base.inc:<br>
<div class=3D"im">=C2=A0${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;op=
engl&#39;,<br>
</div>&#39;xserver-xorg-extension-glx&#39;, &#39;&#39;, d)} \<br>
<br>
here, used to enable GLX<br>
<br>
-- openembedded-core/meta/recipes-graphics/libsdl/<a href=3D"http://libsdl_=
1.2.15.bb" target=3D"_blank">libsdl_1.2.15.bb</a>:<br>
<div class=3D"im">=C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_contains(&#39;DISTRO_F=
EATURES&#39;, &#39;opengl&#39;, &#39;virtual/libgl&#39;,<br>
&#39;&#39;, d)} \<br>
</div>-- openembedded-core/meta/recipes-graphics/libsdl/<a href=3D"http://l=
ibsdl_1.2.15.bb" target=3D"_blank">libsdl_1.2.15.bb</a>:<br>
<div class=3D"im">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@base_contain=
s(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;,<br>
&#39;--enable-video-opengl&#39;, &#39;--disable-video-opengl&#39;, d)} \<br=
>
<br>
</div>here to enable GL features, incompatible with GLES.<br>
<br>
-- openembedded-core/meta/recipes-graphics/wayland/<a href=3D"http://weston=
_1.1.0.bb" target=3D"_blank">weston_1.1.0.bb</a>:<br>
<div class=3D"im">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${=
@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;opengles2&#39;,<br>
</div>&#39;gles&#39;, &#39;&#39;, d)} \<br>
<br>
here, we have an instance of opengles2, which we discussed already.<br>
that&#39;s the only place where we have that, and you agreed it was a bug.<=
br>
<br>
-- openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.2=
1.13.bb:PACKAGECONFIG<br>
??=3D &quot;sna udev ${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;openg=
l&#39;, &#39;dri&#39;, &#39;&#39;,<br>
d)}&quot;<br>
-- openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc:PA=
CKAGECONFIG<br>
??=3D &quot;udev ${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#3=
9;, &#39;dri dri2<br>
glx&#39;, &#39;&#39;, d)}&quot;<br>
<br>
to enable GLX/DRI<br>
<br>
-- openembedded-core/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb:DEPENDS<b=
r>
+=3D &quot; ${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &=
#39;virtual/libgl&#39;,<br>
&#39;&#39;, d)}&quot;<br>
<br>
another instance, like libsdl which would break on GLES only platform.<br>
<br>
-- openembedded-core/meta/recipes-sato/webkit/<a href=3D"http://webkit-gtk_=
1.8.3.bb" target=3D"_blank">webkit-gtk_1.8.3.bb</a>:<br>
<div class=3D"im">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_contains=
(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;,<br>
</div>&#39;--enable-webgl&#39;, &#39;--disable-webgl&#39;, d)} \<br>
<br>
here to enable WebGL<br>
<br>
So i think given these examples, it&#39;s difficult to &#39;define&#39; wha=
t<br>
opengl DISTRO_FEATURE means. it is used for many different things, so<br>
maybe this isn&#39;t the &#39;right level of abstraction&#39;. what do you =
think?<br>
<br>
<br>
ps: sorry, i have the feeling that gmail is going to mess up very<br>
badly with the formatting of this email...<br>
</blockquote></div><br></div>

--047d7bf0d5244415ea04e967759f--
