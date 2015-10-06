Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4584576ABE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 15:12:41 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so164057532wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Oct 2015 08:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RM4twV6SiOrJGJqNPB4EHmw17J3hLNB6RV+sS/QaAbs=;
	b=bKzrxxY4vVtkjDD8sFqsOfIoby72dXZc2N0G43Ac5t+ZmGk4tEOKgfDx542Tck/ZXT
	kodfNecV90gC7MePlj26dkrz2LNEyQjiAo8H5NVCAedYIuuxI2MFapECv1J5KkdMa5VW
	WX2zBT5i6KirgViP9L/9kVtRkwHEKCSU9pznx0dYsUJ7QCM3bqbshRJ5rnWPKWDfAmkD
	Qd8d227O8g4b6+U8WJwIumnU6C8r0r/G2vOtOT97UOUUT7u93LeHhRZg7JIgp7TCVpUu
	v4RGiNeYDcGta1orkCZPNtLg/pIHHlARBV1KCoHo90ssgh7cBREODLWcjE4WIBQQQ7vq
	dvyQ==
X-Gm-Message-State: ALoCoQkXWBippShzQ7fgNaHj1MGuONnBS83poRIWM3CrySgNDGqZoPofQVO1086YrEc677yzS9xs
X-Received: by 10.180.88.164 with SMTP id bh4mr17154178wib.18.1444144361822;
	Tue, 06 Oct 2015 08:12:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.77.212 with HTTP; Tue, 6 Oct 2015 08:12:12 -0700 (PDT)
In-Reply-To: <560EA62E.5020901@opendreambox.org>
References: <1443789718-6846-1-git-send-email-jussi.kukkonen@intel.com>
	<560EA62E.5020901@opendreambox.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 6 Oct 2015 18:12:12 +0300
Message-ID: <CAHiDW_FqJrLeBmqOCe_hK50WnV9qgWYLGMk+=+owp4Hrmkffnw@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: RDEPEND on libgl
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
X-List-Received-Date: Tue, 06 Oct 2015 15:12:42 -0000
Content-Type: multipart/alternative; boundary=f46d044303fcb0f78a0521710f82

--f46d044303fcb0f78a0521710f82
Content-Type: text/plain; charset=UTF-8

On 2 October 2015 at 18:43, Andreas Oberritter <obi@opendreambox.org> wrote:

> Hello Jussi,



Hi, and thanks for the help.


> On 02.10.2015 14:41, Jussi Kukkonen wrote:
> > Automatic dependency tracking does not notice this (understandable
> > with the dlopen trickery epoxy does).
> >
> > [YOCTO #8371]
> >
> > Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > ---
> >
> >
> > I'm not super familiar with the opengl handling so please let me know if
> there's some
> > better way to do this: The problem being fixed is e.g. gtk3-demo failing
> to start
> > because it fails to dlopen libGL.so.1.
> >
> >
> >  meta/recipes-graphics/libepoxy/libepoxy_git.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
> b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
> > index ad17293..fe05d4e 100644
> > --- a/meta/recipes-graphics/libepoxy/libepoxy_git.bb
> > +++ b/meta/recipes-graphics/libepoxy/libepoxy_git.bb
> > @@ -20,6 +20,7 @@ S = "${WORKDIR}/git"
> >  inherit autotools pkgconfig
> >
> >  DEPENDS = "util-macros virtual/egl"
> > +RDEPENDS_${PN} = "libgl"
> >
> >  PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11"
>
> If epoxy behaves like other projects, then I'd try removing virtual/egl
> from
> DEPENDS and replacing the line above with this one


Hi, and thanks for the help.

For reference, epoxy is slightly different from most projects in that it
provides GL API(s) itself. It's a helper library to avoid doing the
dlopen/*GetProcAddress dance: epoxy handles that and the application can
just call the functions without dealing with function pointers.


>
>
PACKAGECONFIG[x11] = "--enable-glx, --disable-glx, virtual/libx11
> virtual/gl, libgl"
>
> An additional packageconfig for gles2 should be added. For a rather complex
> example covering many environments see
> meta/recipes-graphics/cogl/cogl-1.0.inc


The cogl example looks good to me -- although currently epoxy does depend
on egl at build time unconditionally: at least some dispatch headers are
built based on egl headers.

>  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11',
> '', d)}"
>
> An empty default probably doesn't make sense for this library, unless
> --disable-glx
> implies --enable-egl (or something similar). But then you'd need to keep
> the build
> dependency on virtual/egl, even though it's most probably unused if x11 is
> available.


The EGL support is there in epoxy regardless of --enable-glx, as far as I
can see so I think I'll have to keep it there. But I'll modify the runtime
dependencies based on the cogl example.

Thanks, Jussi

--f46d044303fcb0f78a0521710f82
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
 October 2015 at 18:43, Andreas Oberritter <span dir=3D"ltr">&lt;<a href=3D=
"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.org</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex">Hello Jussi,</blockquote><div><br></div=
><div><br></div><div>Hi, and thanks for the help.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padd=
ing-left:1ex"><span class=3D"">On 02.10.2015 14:41, Jussi Kukkonen wrote:<b=
r>
&gt; Automatic dependency tracking does not notice this (understandable<br>
&gt; with the dlopen trickery epoxy does).<br>
&gt;<br>
&gt; [YOCTO #8371]<br>
&gt;<br>
&gt; Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@int=
el.com">jussi.kukkonen@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;<br>
&gt;<br>
&gt; I&#39;m not super familiar with the opengl handling so please let me k=
now if there&#39;s some<br>
&gt; better way to do this: The problem being fixed is e.g. gtk3-demo faili=
ng to start<br>
&gt; because it fails to dlopen libGL.so.1.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_git.bb=
" rel=3D"noreferrer" target=3D"_blank">libepoxy_git.bb</a> | 1 +<br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy=
_git.bb" rel=3D"noreferrer" target=3D"_blank">libepoxy_git.bb</a> b/meta/re=
cipes-graphics/libepoxy/<a href=3D"http://libepoxy_git.bb" rel=3D"noreferre=
r" target=3D"_blank">libepoxy_git.bb</a><br>
&gt; index ad17293..fe05d4e 100644<br>
&gt; --- a/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_git.bb=
" rel=3D"noreferrer" target=3D"_blank">libepoxy_git.bb</a><br>
&gt; +++ b/meta/recipes-graphics/libepoxy/<a href=3D"http://libepoxy_git.bb=
" rel=3D"noreferrer" target=3D"_blank">libepoxy_git.bb</a><br>
&gt; @@ -20,6 +20,7 @@ S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 inherit autotools pkgconfig<br>
&gt;<br>
&gt;=C2=A0 DEPENDS =3D &quot;util-macros virtual/egl&quot;<br>
&gt; +RDEPENDS_${PN} =3D &quot;libgl&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG[x11] =3D &quot;--enable-glx, --disable-glx, virtua=
l/libx11&quot;<br>
<br>
</span>If epoxy behaves like other projects, then I&#39;d try removing virt=
ual/egl from<br>
DEPENDS and replacing the line above with this one</blockquote><div><br></d=
iv><div><div>Hi, and thanks for the help.</div><div><br></div></div><div>Fo=
r reference, epoxy is slightly different from most projects in that it prov=
ides GL API(s) itself. It&#39;s a helper library to avoid doing the dlopen/=
*GetProcAddress dance: epoxy handles that and the application can just call=
 the functions without dealing with function pointers.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid=
;padding-left:1ex">=C2=A0<br></blockquote><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:=
rgb(204,204,204);border-left-style:solid;padding-left:1ex">
PACKAGECONFIG[x11] =3D &quot;--enable-glx, --disable-glx, virtual/libx11 vi=
rtual/gl, libgl&quot;<br>
<br>
An additional packageconfig for gles2 should be added. For a rather complex=
<br>
example covering many environments see meta/recipes-graphics/cogl/cogl-1.0.=
inc</blockquote><div><br></div><div><div>The cogl example looks good to me =
-- although currently epoxy does depend on egl at build time unconditionall=
y: at least some dispatch headers are built based on egl headers.<br></div>=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bord=
er-left-style:solid;padding-left:1ex"><span class=3D"">
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATU=
RES&#39;, &#39;x11&#39;, &#39;x11&#39;, &#39;&#39;, d)}&quot;<br>
<br>
</span>An empty default probably doesn&#39;t make sense for this library, u=
nless --disable-glx<br>
implies --enable-egl (or something similar). But then you&#39;d need to kee=
p the build<br>
dependency on virtual/egl, even though it&#39;s most probably unused if x11=
 is available.</blockquote><div><br></div><div>The EGL support is there in =
epoxy regardless of --enable-glx, as far as I can see so I think I&#39;ll h=
ave to keep it there. But I&#39;ll modify the runtime dependencies based on=
 the cogl example.</div><div>=C2=A0<br></div><div>Thanks, Jussi</div></div>=
</div></div>

--f46d044303fcb0f78a0521710f82--
