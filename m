Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC8761165
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 13:50:40 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ez12so3410477wid.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 06:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IHfnx59ClnVqHGUjm76tMiZ9eoQAQotJ52AZbGx9npI=;
	b=BY1GSSVNRWCL8nuyp5go6KWfZhpby1TfCF3ezyOshLxP6Rw8JFa/bw+7+ymfVacgOI
	3tnAaMTKhUKhOQ7hWuqks1aKG/i6CHR14n8z9uptMjqPdDshKohVVlebqpWiGFvUeNOZ
	UnZ437ZGOy/SmdkId4ib43MT9EwrEWeJtxkNu7FnarjMr99yFF6chiTUZrQo7kY42W44
	cdipwlPaaW6KgZ1GuD1hWDOkfT7G5+oGU74BT5Xrx3sBxe5LNCxr2yLxTEUHZ/q7R8Ks
	tIxS83984JrQJDbhe5pPJjPlaZdlJQZ97dRZ3j+Gk3fK7tqJjt+VPjwLJ2GFm0JVhoK4
	y1ww==
X-Gm-Message-State: ALoCoQlwVfNJ2L5iKpzOdBME6yK++Jo5iSL+ZuiH+vFQPlVayvYE25xfmheeZlCedVuh/KFh9/G5
X-Received: by 10.180.160.229 with SMTP id xn5mr8612115wib.62.1378734641851;
	Mon, 09 Sep 2013 06:50:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.180.218.200 with HTTP; Mon, 9 Sep 2013 06:50:21 -0700 (PDT)
In-Reply-To: <CAJTo0La3MjAB65jaHwzk8aqgPP8AHhEz_3ky8AWGu07ACFcHnQ@mail.gmail.com>
References: <1378721952-10827-1-git-send-email-ross.burton@intel.com>
	<20130909120824.GQ11500@jama>
	<CAJTo0LaLKDACnUd6BZdUjLR6p87unCaF4pH_g+c3b-5c4w2NLw@mail.gmail.com>
	<CAP71WjxEp-LEe7UW+F9vUig4SAAd8vN4hkm3DUgjYvZQ6TSZ=A@mail.gmail.com>
	<CAJTo0La3MjAB65jaHwzk8aqgPP8AHhEz_3ky8AWGu07ACFcHnQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 9 Sep 2013 15:50:21 +0200
Message-ID: <CAP71Wjz-xD2BoCMPrZV7sA3LJMxt1JYvuMC+k4GqBVRM7kd5PA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 09 Sep 2013 13:50:42 -0000
Content-Type: multipart/alternative; boundary=047d7b60408a93261104e5f3acd0

--047d7b60408a93261104e5f3acd0
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 9, 2013 at 3:17 PM, Burton, Ross <ross.burton@intel.com> wrote:

> > how about gl vs gles?
>
> The problem of any patch that touches the opengl distro feature is
> that it causes this discussion, because the semantics of it are rather
> vague to say the least!
>
> > i have been trying to understand over the last couple of days whether or
> not
> > 'opengl' in DISTRO_FEATURES means OpenGL and OpenGLES. I don't think it's
> > clearly indicated anywhere.
>
> My personal opinion is it means "enable support for the OpenGL
> collection of APIs, include OpenGL, GLES and/or EGL".  Last year there
> was a patch series from the early Wayland enabling that added machine
> features for each form of GL, but that wasn't finished or merged (not
> entirely required).
>
> > in libsdl recipe, we have this:
> >
> > DEPENDS = "${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb',
> '',
> > d)} \
> >            ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl',
> > '', d)} \
> >
> > and in EXTRA_OECONF we add this:
> > ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl',
> > '--disable-video-opengl', d)} \
> >
> > which tends to make me think that 'opengl' means 'OpenGL', not OpenGLES.
> I
> > am building for ARM platforms with GLes support, but no GL support. I
> > initially had 'opengl' in DISTRO_FEATURES, but we ended with mesa being
> > pulled in because of libsdl, which was wrong. So we now removed 'opengl'
> > from our DISTRO_FEATURES list. (note we have our own EGL/GLes library for
> > GPU, so we don't want mesa at all).
>
> OpenGL-wrangling aside, that's a pretty good example of where
> PACKAGECONFIG should be used so your configuration can easily tweak
> SDL without changing distro features.
>

well, if opengl means gl or gles, then doing something like this should be
considered wrong (bug):

> ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-video-opengl',
> '--disable-video-opengl', d)} \

since here it's clear that opengl means gl, not gles. it clearly breaks on
machine where opengl means gles and no gl support is available (here i am
considering pulling mesa as a bug, since we probably don't want it on
embedded devices).


>
> > In weston recipe, we have this:
> > ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)}
> >
> > so, that seems to imply that opengles2 is now a 'new' DISTRO_FEATURES,
> but
> > it's only used once (looking at oe-core and meta-oe).
>
> Not sure what I was thinking there, potentially a bad search and
> replace.  As you say its the only instance of that feature.  Patch
> incoming to fix that.
>
> I'm happy for DISTRO_FEATURES to be vague and just mean the GL
> collection instead of specific implementations, because OpenGL/GLX vs
> GLESv2/EGL etc is a machine-specific feature and encoding that into
> DISTRO_FEATURES would mean changing the distro features when the
> machine changes, which is obviously wrong.


well, i am not quite convinced that GL/GLX vs GLes/EGL really is machine
specific. It might have been the case before, but more and more i think
this is becoming a 'distro' (or stack, or product?) preference. things like
Qt5 or wayland now enforce the need for gles, so to me this is no longer
machine dependent. Without GLES on your machine you can't run them anymore.



>  We may need some
> machine-level hints as to the GL feature set available for recipes
> that don't probe at runtime.


yes, i agree. we need to know what machines can do GL, GLX, EGL, GLES, and
what distro 'need/expect' and combine the 2 sets (and use mesa as fallback
when needed, or even we should be able to prohibit mesa too). we could get
such thing using opengl and opengles flags in DISTRO_ and
MACHINES_FEATURES.. but it's not quite nice.

--047d7b60408a93261104e5f3acd0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Sep 9, 2013 at 3:17 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">&gt; how about gl vs gles?<br>
<br>
</div>The problem of any patch that touches the opengl distro feature is<br=
>
that it causes this discussion, because the semantics of it are rather<br>
vague to say the least!<br>
<div class=3D"im"><br>
&gt; i have been trying to understand over the last couple of days whether =
or not<br>
&gt; &#39;opengl&#39; in DISTRO_FEATURES means OpenGL and OpenGLES. I don&#=
39;t think it&#39;s<br>
&gt; clearly indicated anywhere.<br>
<br>
</div>My personal opinion is it means &quot;enable support for the OpenGL<b=
r>
collection of APIs, include OpenGL, GLES and/or EGL&quot;. =A0Last year the=
re<br>
was a patch series from the early Wayland enabling that added machine<br>
features for each form of GL, but that wasn&#39;t finished or merged (not<b=
r>
entirely required).<br>
<div class=3D"im"><br>
&gt; in libsdl recipe, we have this:<br>
&gt;<br>
&gt; DEPENDS =3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;dir=
ectfb&#39;, &#39;directfb&#39;, &#39;&#39;,<br>
&gt; d)} \<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0${@base_contains(&#39;DISTRO_FEATURES&#39;, &#3=
9;opengl&#39;, &#39;virtual/libgl&#39;,<br>
&gt; &#39;&#39;, d)} \<br>
&gt;<br>
&gt; and in EXTRA_OECONF we add this:<br>
&gt; ${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &#39;--e=
nable-video-opengl&#39;,<br>
&gt; &#39;--disable-video-opengl&#39;, d)} \<br>
&gt;<br>
&gt; which tends to make me think that &#39;opengl&#39; means &#39;OpenGL&#=
39;, not OpenGLES. I<br>
&gt; am building for ARM platforms with GLes support, but no GL support. I<=
br>
&gt; initially had &#39;opengl&#39; in DISTRO_FEATURES, but we ended with m=
esa being<br>
&gt; pulled in because of libsdl, which was wrong. So we now removed &#39;o=
pengl&#39;<br>
&gt; from our DISTRO_FEATURES list. (note we have our own EGL/GLes library =
for<br>
&gt; GPU, so we don&#39;t want mesa at all).<br>
<br>
</div>OpenGL-wrangling aside, that&#39;s a pretty good example of where<br>
PACKAGECONFIG should be used so your configuration can easily tweak<br>
SDL without changing distro features.<br></blockquote><div><br></div><div>w=
ell, if opengl means gl or gles, then doing something like this should be c=
onsidered wrong (bug):</div><div><br></div><div><span style=3D"color:rgb(80=
,0,80)">&gt; ${@base_contains(&#39;DISTRO_</span><span style=3D"color:rgb(8=
0,0,80)">FEATURES&#39;, &#39;opengl&#39;, &#39;--enable-video-opengl&#39;,<=
/span><br style=3D"color:rgb(80,0,80)">

<span style=3D"color:rgb(80,0,80)">&gt; &#39;--disable-video-opengl&#39;, d=
)} \</span><br style=3D"color:rgb(80,0,80)"></div><div><br></div><div>since=
 here it&#39;s clear that opengl means gl, not gles. it clearly breaks on m=
achine where opengl means gles and no gl support is available (here i am co=
nsidering pulling mesa as a bug, since we probably don&#39;t want it on emb=
edded devices).</div>

<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; In weston recipe, we have this:<br>
&gt; ${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;opengles2&#39;, &#39;=
gles&#39;, &#39;&#39;, d)}<br>
&gt;<br>
&gt; so, that seems to imply that opengles2 is now a &#39;new&#39; DISTRO_F=
EATURES, but<br>
&gt; it&#39;s only used once (looking at oe-core and meta-oe).<br>
<br>
</div>Not sure what I was thinking there, potentially a bad search and<br>
replace. =A0As you say its the only instance of that feature. =A0Patch<br>
incoming to fix that.<br>
<br>
I&#39;m happy for DISTRO_FEATURES to be vague and just mean the GL<br>
collection instead of specific implementations, because OpenGL/GLX vs<br>
GLESv2/EGL etc is a machine-specific feature and encoding that into<br>
DISTRO_FEATURES would mean changing the distro features when the<br>
machine changes, which is obviously wrong. </blockquote><div><br></div><div=
>well, i am not quite convinced that GL/GLX vs GLes/EGL really is machine s=
pecific. It might have been the case before, but more and more i think this=
 is becoming a &#39;distro&#39; (or stack, or product?) preference. things =
like Qt5 or wayland now enforce the need for gles, so to me this is no long=
er machine dependent. Without GLES on your machine you can&#39;t run them a=
nymore. =A0 =A0</div>

<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">=A0We may need some<br>
machine-level hints as to the GL feature set available for recipes<br>
that don&#39;t probe at runtime.</blockquote></div><br>yes, i agree. we nee=
d to know what machines can do GL, GLX, EGL, GLES, and what distro &#39;nee=
d/expect&#39; and combine the 2 sets (and use mesa as fallback when needed,=
 or even we should be able to prohibit mesa too). we could get such thing u=
sing opengl and opengles flags in DISTRO_ and MACHINES_FEATURES.. but it&#3=
9;s not quite nice.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br></div><=
/div>

--047d7b60408a93261104e5f3acd0--
