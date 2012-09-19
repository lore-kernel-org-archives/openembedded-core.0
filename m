Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TEIQr-00041i-3j
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 13:27:05 +0200
Received: by iebc11 with SMTP id c11so1302265ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 04:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=cKa2IYY/F0d9+td5Ydpf7Y01rNMw+hXKtQ1aOLR2H9k=;
	b=YR3SG7LSzYyoEzvQTL8NM6/AM1gfbnokUVgv2G83VWoJmT4xcYd9HexU6/PBG0vRD2
	ErCucmnDZh7GTbgghWwy3PtLVkEdS0A3Jse0pM2JbJSXWvm+e5+LLHQ7dAMGKlemCQI0
	9XSEZljZIckTOZYW4+6Fn+rRJ8v2an8F10izb+1Do7dPkLb6v+ku5mZEVlQya/hTvGZw
	pt03tqW9bn7FsH3uM8nBP7w63Dt0+glS0UZ51T/SthimIz7Pkg26HyicPRIfIV1V+g4E
	JtR+jmg5tewttcP2a+/BQkTCioRV0JMS/RgeO5XS3Sk4i33YnF2HAG2U0LJ2TJ58WFHl
	3bFg==
Received: by 10.50.41.129 with SMTP id f1mr2596652igl.57.1348053263339; Wed,
	19 Sep 2012 04:14:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.52.8 with HTTP; Wed, 19 Sep 2012 04:14:03 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <644855E8-7D63-45DC-B072-B9A9893058F3@dominion.thruhere.net>
References: <CAK18fxEb3gjEEwhvN-du3eJvgUVCbjXU2Ag4kicFFDt6xra6og@mail.gmail.com>
	<CAJTo0LYmPf0g_qv6X+8MefjzfWr4gsr33SaszHsG82PiGg+oEg@mail.gmail.com>
	<644855E8-7D63-45DC-B072-B9A9893058F3@dominion.thruhere.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 19 Sep 2012 14:14:03 +0300
Message-ID: <CAK18fxEMMh6UYCc43MHb-wi4ymyi9cb3tEO_=Zw=2-Yj=i8mrg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl82rXjg+nBeUQR9A/WwinHBsCDlIDeKjDn+HQhKTBz8M+uLSjC8yQfm1EePsqfVf9GXTfJ
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] opengl / libgl / libgles
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 11:27:05 -0000
Content-Type: multipart/alternative; boundary=14dae9340683e652cd04ca0c1bd6

--14dae9340683e652cd04ca0c1bd6
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 6, 2012 at 4:25 PM, Koen Kooi <koen@dominion.thruhere.net>wrote:

>
> Op 6 sep. 2012, om 15:04 heeft "Burton, Ross" <ross.burton@intel.com> het
> volgende geschreven:
>
> > (CCing oe-core, discussion should happen there really)
> >
> > On 6 September 2012 11:00, Andrei Gherzan <andrei@gherzan.ro> wrote:
> >> In DISTRO_FEATURES we have opengl. That is pretty vague and generally we
> >> don't want to have mesa on machines where there is no libgl but only
> gles +
> >> egl. For example if we want to compile something that adds a DEPENDS
> based
> >> on DISTRO_FEATURE opengl, this dependency will be added even if there
> is no
> >> libgl implemented for that specific machine.
> >>
> >> First idea would be that opengl (gl / gles) are machine related. On the
> >> other hand opengl can be a DISTRO_FEATURE as we have a software
> >> implementation - mesa.
> >>
> >> How would you guys see a solution for this? The idea that came into my
> mind
> >> was to map opengl to libgl or libgles. Or to both if there is the case.
> >
> > (First I must apologise for the uneven flow of this mail - my mornings
> > been pretty choppy but hopefully people can see what I'm thinking)
> >
> > I've been thinking about this quite a lot recently, as the current
> > setup is broken in some way on most hardware.  There is a bigger
> > problem than just distro or machine features - the packaging isn't
> > obvious or correct either.
> >
> > First, we need a concrete definition of the "opengl" distro feature.
> > I propose just "some form of OpenGL functionality" without any
> > implications about what specification is present.
> >
> > Then, machine features for the portions of OpenGL that the hardware
> > supports - gl, gles1, gles2.  I'd love to say "gles" means GLESv2 but
> > I suspect we're not quite safe from the horrors of hardware that only
> > supports GLESv1 yet.
> >
> > We then need more virtual providers for the GL libraries.  Mesa is an
> > obvious provider - it provides libgl, libglesv1, libglesv2 and libegl.
> > On Raspberry Pi the binary drivers provide libglesv1, glesv2, and
> > egl.  As the performance of the software renderer will be terrible,
> > unsetting the libgl provider makes a lot of sense.
> >
> > Because there are multiple providers of the GL libraries, and they are
> > not all specific to a single machine, every package that provides GL
> > packages need to be namespaced.  The Debian-renaming makes this
> > trickier but luckily it can be overridden in the recipe, so Mesa
> > should be building libgl-mesa, libegl-mesa, and so on.  Every other
> > provider of the GL libraries should do this too.
> >
> > Library dependencies are also broken, of course.  A package that links
> > to libGL.so.1 shouldn't get a dependency on mesa-dri or whatever was
> > installed to provide that library, but a dependency on a virtual
> > "libgl" package.  As far as I'm aware this isn't something that the
> > automatic shlibs dependency generation handles, but there is plenty of
> > prior art for this.
>
> It's not automatic, but you can do something like this:
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=23b02134
>
> That recipe ships multiple copies of the libraries to account for
> different silicon revisions (the shader compiler will offload different
> things to the CPU), but we don't want the shlibs code to pickup the copies.
> So for mesa you can do:
>
>         PRIVATE_LIBS_${PN}-dri = "libGL.so"
>         RPROVIDES_${PN}-dri = $magic_python_function(PACKAGE_CONFIG,
> sometthing, something, libgl)
>
> And in the recipes that link to a GL lib you do:
>
>         RDEPENDS_${PN} = "libGL"
>
> Which only leaves the DISTRO to sort out the runtime preferred provider,
> which is likely a conf file with a bunch of PACKAGE_CONFIG entries for all
> the machines the DISTRO wants to support.
>
> I'm not sure how this would work as there are recipes like libsdl with:
${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}

ag

--14dae9340683e652cd04ca0c1bd6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Sep 6, 2012 at 4:25 PM, Koen Kooi <span =
dir=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net" target=3D"_bl=
ank">koen@dominion.thruhere.net</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<br>
Op 6 sep. 2012, om 15:04 heeft &quot;Burton, Ross&quot; &lt;<a href=3D"mail=
to:ross.burton@intel.com">ross.burton@intel.com</a>&gt; het volgende geschr=
even:<br>
<div><div class=3D"h5"><br>
&gt; (CCing oe-core, discussion should happen there really)<br>
&gt;<br>
&gt; On 6 September 2012 11:00, Andrei Gherzan &lt;<a href=3D"mailto:andrei=
@gherzan.ro">andrei@gherzan.ro</a>&gt; wrote:<br>
&gt;&gt; In DISTRO_FEATURES we have opengl. That is pretty vague and genera=
lly we<br>
&gt;&gt; don&#39;t want to have mesa on machines where there is no libgl bu=
t only gles +<br>
&gt;&gt; egl. For example if we want to compile something that adds a DEPEN=
DS based<br>
&gt;&gt; on DISTRO_FEATURE opengl, this dependency will be added even if th=
ere is no<br>
&gt;&gt; libgl implemented for that specific machine.<br>
&gt;&gt;<br>
&gt;&gt; First idea would be that opengl (gl / gles) are machine related. O=
n the<br>
&gt;&gt; other hand opengl can be a DISTRO_FEATURE as we have a software<br=
>
&gt;&gt; implementation - mesa.<br>
&gt;&gt;<br>
&gt;&gt; How would you guys see a solution for this? The idea that came int=
o my mind<br>
&gt;&gt; was to map opengl to libgl or libgles. Or to both if there is the =
case.<br>
&gt;<br>
&gt; (First I must apologise for the uneven flow of this mail - my mornings=
<br>
&gt; been pretty choppy but hopefully people can see what I&#39;m thinking)=
<br>
&gt;<br>
&gt; I&#39;ve been thinking about this quite a lot recently, as the current=
<br>
&gt; setup is broken in some way on most hardware. =A0There is a bigger<br>
&gt; problem than just distro or machine features - the packaging isn&#39;t=
<br>
&gt; obvious or correct either.<br>
&gt;<br>
&gt; First, we need a concrete definition of the &quot;opengl&quot; distro =
feature.<br>
&gt; I propose just &quot;some form of OpenGL functionality&quot; without a=
ny<br>
&gt; implications about what specification is present.<br>
&gt;<br>
&gt; Then, machine features for the portions of OpenGL that the hardware<br=
>
&gt; supports - gl, gles1, gles2. =A0I&#39;d love to say &quot;gles&quot; m=
eans GLESv2 but<br>
&gt; I suspect we&#39;re not quite safe from the horrors of hardware that o=
nly<br>
&gt; supports GLESv1 yet.<br>
&gt;<br>
&gt; We then need more virtual providers for the GL libraries. =A0Mesa is a=
n<br>
&gt; obvious provider - it provides libgl, libglesv1, libglesv2 and libegl.=
<br>
&gt; On Raspberry Pi the binary drivers provide libglesv1, glesv2, and<br>
&gt; egl. =A0As the performance of the software renderer will be terrible,<=
br>
&gt; unsetting the libgl provider makes a lot of sense.<br>
&gt;<br>
&gt; Because there are multiple providers of the GL libraries, and they are=
<br>
&gt; not all specific to a single machine, every package that provides GL<b=
r>
&gt; packages need to be namespaced. =A0The Debian-renaming makes this<br>
&gt; trickier but luckily it can be overridden in the recipe, so Mesa<br>
&gt; should be building libgl-mesa, libegl-mesa, and so on. =A0Every other<=
br>
&gt; provider of the GL libraries should do this too.<br>
&gt;<br>
&gt; Library dependencies are also broken, of course. =A0A package that lin=
ks<br>
&gt; to libGL.so.1 shouldn&#39;t get a dependency on mesa-dri or whatever w=
as<br>
&gt; installed to provide that library, but a dependency on a virtual<br>
&gt; &quot;libgl&quot; package. =A0As far as I&#39;m aware this isn&#39;t s=
omething that the<br>
&gt; automatic shlibs dependency generation handles, but there is plenty of=
<br>
&gt; prior art for this.<br>
<br>
</div></div>It&#39;s not automatic, but you can do something like this:<br>
<br>
=A0 =A0 =A0 =A0 <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-t=
i/commit/?id=3D23b02134" target=3D"_blank">http://git.yoctoproject.org/cgit=
/cgit.cgi/meta-ti/commit/?id=3D23b02134</a><br>
<br>
That recipe ships multiple copies of the libraries to account for different=
 silicon revisions (the shader compiler will offload different things to th=
e CPU), but we don&#39;t want the shlibs code to pickup the copies. So for =
mesa you can do:<br>


<br>
=A0 =A0 =A0 =A0 PRIVATE_LIBS_${PN}-dri =3D &quot;libGL.so&quot;<br>
=A0 =A0 =A0 =A0 RPROVIDES_${PN}-dri =3D $magic_python_function(PACKAGE_CONF=
IG, sometthing, something, libgl)<br>
<br>
And in the recipes that link to a GL lib you do:<br>
<br>
=A0 =A0 =A0 =A0 RDEPENDS_${PN} =3D &quot;libGL&quot;<br>
<br>
Which only leaves the DISTRO to sort out the runtime preferred provider, wh=
ich is likely a conf file with a bunch of PACKAGE_CONFIG entries for all th=
e machines the DISTRO wants to support.<br><br></blockquote><div>I&#39;m no=
t sure how this would work as there are recipes like libsdl with:</div>

<div>${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;, &#39;vir=
tual/libgl&#39;, &#39;&#39;, d)}=A0</div><div><br></div><div>ag=A0</div></d=
iv>

--14dae9340683e652cd04ca0c1bd6--
