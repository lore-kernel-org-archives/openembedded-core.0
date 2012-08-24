Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T512V-0006NT-4n
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 23:03:35 +0200
Received: by iaky10 with SMTP id y10so4149130iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 13:51:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=1G42j6dLJp0lGSm98oZvdHW9qYoFnFDxD5aTv73gzYw=;
	b=OucHGDQ7dhjitNFtVeM33f/XJWC2vZ4M7bvnyaVkljcYWbXoGmwJ2JUtnnU+8+7WaB
	QQPUi3UPH4GUUFu8FUqQFlkljEjyqRe5yzCRmhLLN0VYJzV1u2VChLQPq+7AJWr8nHCP
	j+vimRdv7IK4SSpPKEMBpeEYyFcuE9lqukRlJz/a3AXq1wEYpetG57ejj8OLoMridTDT
	nz+28yC4019IoDLLfOIwoxJDAAqRyYGfA/jQMXWpzyCVE0ItVG/krLPnWDR5Bil+2cMy
	l0tTOe5hPHLaihyo9xDh/ADg+NSAl5s21W7iXISfS9tAYVc/660/cMyj9RBXZAjQkat1
	9BuQ==
Received: by 10.50.189.227 with SMTP id gl3mr3542122igc.34.1345841486565; Fri,
	24 Aug 2012 13:51:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.63.50 with HTTP; Fri, 24 Aug 2012 13:51:06 -0700 (PDT)
X-Originating-IP: [79.118.181.96]
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A617135@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1345824924.14369.82.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A617135@039-SN1MPN1-001.039d.mgd.msft.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 24 Aug 2012 23:51:06 +0300
Message-ID: <CAK18fxFatWwJMUVSeQbfx18V8xsi=R0imd7zR15DWwfinEc8Ug@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
X-Gm-Message-State: ALoCoQkGVgTsXg0+hLov+XzNFHM6D4HgipGCrKmEZJy3e1XoKWzU/7HkHOLhs1zZl/msYPOtw2mH
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distutils/steuptools: Fix files layout and unbreak builds
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
X-List-Received-Date: Fri, 24 Aug 2012 21:03:35 -0000
Content-Type: multipart/alternative; boundary=14dae9340f73bb0f9804c8092359

--14dae9340f73bb0f9804c8092359
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 24, 2012 at 11:48 PM, McClintock Matthew-B29882 <
B29882@freescale.com> wrote:

> On Fri, Aug 24, 2012 at 11:15 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The last two distutils changes progressively broke the builds. Firstly
> they
> > moved things from the site_packages directory to being higher up the tree
> > which introduced package QA warnings as a side effect. Secondly, it
> interacts
> > badly with setuptools which passes in --root=${D} itself.
> >
> > This patch restores the original directory layout, hence fixing the QA
> > warnings and also passes extra options to setuptools to deal with the
> > --root option it passes.
>
>
Exactly what i was working on...


> Hmm, I think you don't need certain bits anymore
>
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/classes/distutils.bbclass
> b/meta/classes/distutils.bbclass
> > index 52a1aa8..c73b24f 100644
> > --- a/meta/classes/distutils.bbclass
> > +++ b/meta/classes/distutils.bbclass
> > @@ -38,7 +38,7 @@ distutils_do_install() {
> >          STAGING_LIBDIR=${STAGING_LIBDIR} \
> >          PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
> >          BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
> > -        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install
> --install-lib=${D}${libdir}/${PYTHON_DIR} ${DISTUTILS_INSTALL_ARGS} || \
> > +        ${STAGING_BINDIR_NATIVE}/python-native/python setup.py install
> --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
>
> This change should be handled by the bit below? So you could
>
> s/--install-lib=${D}/${PYTHON_SITEPACKAGES_DIR}//
>
> ?
>
> >          bbfatal "python setup.py install execution failed."
> >
> >          for i in `find ${D} -name "*.py"` ; do \
> > diff --git a/meta/classes/setuptools.bbclass
> b/meta/classes/setuptools.bbclass
> > index ced9509..ba9cf13 100644
> > --- a/meta/classes/setuptools.bbclass
> > +++ b/meta/classes/setuptools.bbclass
> > @@ -5,4 +5,5 @@ DEPENDS += "python-setuptools-native"
> >  DISTUTILS_INSTALL_ARGS = "--root=${D} \
> >      --single-version-externally-managed \
> >      --prefix=${prefix} \
> > +    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
> >      --install-data=${datadir}"
>

Exactly my fix. Please merge.

Andrei

--14dae9340f73bb0f9804c8092359
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote">On Fri, Aug 24, 2012 at 11:48 PM, McClintock=
 Matthew-B29882 <span dir=3D"ltr">&lt;<a href=3D"mailto:B29882@freescale.co=
m" target=3D"_blank">B29882@freescale.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">

<div class=3D"im">On Fri, Aug 24, 2012 at 11:15 AM, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@li=
nuxfoundation.org</a>&gt; wrote:<br>
</div><div class=3D"im">&gt; The last two distutils changes progressively b=
roke the builds. Firstly they<br>
&gt; moved things from the site_packages directory to being higher up the t=
ree<br>
&gt; which introduced package QA warnings as a side effect. Secondly, it in=
teracts<br>
&gt; badly with setuptools which passes in --root=3D${D} itself.<br>
&gt;<br>
&gt; This patch restores the original directory layout, hence fixing the QA=
<br>
&gt; warnings and also passes extra options to setuptools to deal with the<=
br>
&gt; --root option it passes.<br>
<br></div></blockquote><div>=A0</div><div>Exactly what i was working on...=
=A0</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"im">
</div>Hmm, I think you don&#39;t need certain bits anymore<br>
<div class=3D"im"><br>
&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; ---<br>
&gt; diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.b=
bclass<br>
&gt; index 52a1aa8..c73b24f 100644<br>
&gt; --- a/meta/classes/distutils.bbclass<br>
&gt; +++ b/meta/classes/distutils.bbclass<br>
&gt; @@ -38,7 +38,7 @@ distutils_do_install() {<br>
&gt; =A0 =A0 =A0 =A0 =A0STAGING_LIBDIR=3D${STAGING_LIBDIR} \<br>
&gt; =A0 =A0 =A0 =A0 =A0PYTHONPATH=3D${D}/${PYTHON_SITEPACKAGES_DIR} \<br>
&gt; =A0 =A0 =A0 =A0 =A0BUILD_SYS=3D${BUILD_SYS} HOST_SYS=3D${HOST_SYS} \<b=
r>
&gt; - =A0 =A0 =A0 =A0${STAGING_BINDIR_NATIVE}/python-native/python setup.p=
y install --install-lib=3D${D}${libdir}/${PYTHON_DIR} ${DISTUTILS_INSTALL_A=
RGS} || \<br>
&gt; + =A0 =A0 =A0 =A0${STAGING_BINDIR_NATIVE}/python-native/python setup.p=
y install --install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTA=
LL_ARGS} || \<br>
<br>
</div>This change should be handled by the bit below? So you could<br>
<br>
s/--install-lib=3D${D}/${PYTHON_SITEPACKAGES_DIR}//<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
?<br>
<br>
&gt; =A0 =A0 =A0 =A0 =A0bbfatal &quot;python setup.py install execution fai=
led.&quot;<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 =A0for i in `find ${D} -name &quot;*.py&quot;` ; do \<=
br>
&gt; diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools=
.bbclass<br>
&gt; index ced9509..ba9cf13 100644<br>
&gt; --- a/meta/classes/setuptools.bbclass<br>
&gt; +++ b/meta/classes/setuptools.bbclass<br>
&gt; @@ -5,4 +5,5 @@ DEPENDS +=3D &quot;python-setuptools-native&quot;<br>
&gt; =A0DISTUTILS_INSTALL_ARGS =3D &quot;--root=3D${D} \<br>
&gt; =A0 =A0 =A0--single-version-externally-managed \<br>
&gt; =A0 =A0 =A0--prefix=3D${prefix} \<br>
&gt; + =A0 =A0--install-lib=3D${PYTHON_SITEPACKAGES_DIR} \<br>
&gt; =A0 =A0 =A0--install-data=3D${datadir}&quot;<br></div></div></blockquo=
te><div><br></div><div>Exactly my fix. Please merge.</div><div><br></div><d=
iv>Andrei=A0</div></div>

--14dae9340f73bb0f9804c8092359--
