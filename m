Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7162060EFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 22:56:18 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id ep20so828801lab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 14:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2sA/uRuqvPmnX5PwskPDfkFTS32dej+jaldNOkAldJE=;
	b=jr7fKOVZbY/DYDERzeaAywaSFw+smtjnX6rpx5FZ2/aEIpdmGTun60++zC1qEJbHEh
	jfJxBdLxoM85ar6FrlG31Xi8qyPZyxZsoFweQPYw8d8ll8MKI3ycGbqRrFHFWQgENVkn
	U/sP0bYiFhZehVPOnWTaya59MyJc+vJLE7p3CLep9/y1W7aS8k+xXfUp8bnDcbKOwWub
	M13xKXs656NtEei8XhFwKU38FBNX26AZ0CpJhvNq7ny2KuZ4bwhRU+6xlCMCKn6YXYn3
	eHkt+1ixSjvcmj/bIJP2uXhsz3HCNyIzbhz+x1op2NMb5NH9Fj03n2d0qvJOAIDqwuV0
	LzJg==
X-Received: by 10.152.1.234 with SMTP id 10mr5040592lap.19.1386888977088; Thu,
	12 Dec 2013 14:56:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.22.169 with HTTP; Thu, 12 Dec 2013 14:55:56 -0800 (PST)
In-Reply-To: <20131211212254.GA3717@jama>
References: <cover.1385575572.git.kergoth@gmail.com>
	<c39555e418cf1bbb70e06dbe905411a864727e42.1385575572.git.kergoth@gmail.com>
	<20131211212254.GA3717@jama>
From: Chris Larson <kergoth@gmail.com>
Date: Thu, 12 Dec 2013 15:55:56 -0700
Message-ID: <CABcZANmOMLnYQqcM5jVRk-mtijiShOVP8j1xypVZeUY+6u98cA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] pulseaudio: fix RDEPENDS traversal for consolekit
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
X-List-Received-Date: Thu, 12 Dec 2013 22:56:20 -0000
Content-Type: multipart/alternative; boundary=089e0118393ed2861404ed5e4076

--089e0118393ed2861404ed5e4076
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 11, 2013 at 2:22 PM, Martin Jansa <martin.jansa@gmail.com>wrote=
:

> On Wed, Nov 27, 2013 at 11:07:07AM -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Include the console-kit module in PACKSGES explicitly so bitbake can ma=
p
> to
> > the RDEPENDS we define for it in this recipe, and thereby ensure that
> when
> > adding the console-kit module to an image, we also get the necessary
> > consolekit package produced.
> >
> > Signed-off-by: Christopher Larson <kergoth@gmail.com>
> > ---
> >  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > index 7e87ef8..2bee9eb 100644
> > --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> > @@ -69,8 +69,12 @@ USERADD_PARAM_pulseaudio-server =3D "--system --home
> /var/run/pulse \
> >                                --no-create-home --shell /bin/false \
> >                                --groups audio,pulse --gid pulse pulse"
> >
> > +# The console-kit module is included here explicitly so bitbake can ma=
p
> to the
> > +# RDEPENDS we define for it in this recipe, and thereby ensure that wh=
en
> > +# adding the console-kit module to an image, we also get the necessary
> > +# consolekit package produced.
> >  PACKAGES =3D+ "libpulsecore libpulsecommon libpulse libpulse-simple
> libpulse-mainloop-glib \
> > -             pulseaudio-server pulseaudio-misc"
> > +             pulseaudio-server pulseaudio-misc
> pulseaudio-module-console-kit"
>
> Can we add PACKAGECONFIG for this and add it to PACKAGES only
> conditionally?
>
> It causes hard dependency on consolekit -> libx11 so pulseaudio now
> cannot be built for distros without x11 DISTRO_FEATURE.


Sorry about this, I=E2=80=99ll send a patch shortly.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e0118393ed2861404ed5e4076
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Dec 11, 2013 at 2:22 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"h5">=
On Wed, Nov 27, 2013 at 11:07:07AM -0700, Christopher Larson wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; Include the console-kit module in PACKSGES explicitly so bitbake can m=
ap to<br>
&gt; the RDEPENDS we define for it in this recipe, and thereby ensure that =
when<br>
&gt; adding the console-kit module to an image, we also get the necessary<b=
r>
&gt; consolekit package produced.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.=
com">kergoth@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 6 +++++-<br>
&gt; =C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/=
recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; index 7e87ef8..2bee9eb 100644<br>
&gt; --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc<br>
&gt; @@ -69,8 +69,12 @@ USERADD_PARAM_pulseaudio-server =3D &quot;--system =
--home /var/run/pulse \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--no-create-home --shell /bin/fals=
e \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--groups audio,pulse --gid pulse p=
ulse&quot;<br>
&gt;<br>
&gt; +# The console-kit module is included here explicitly so bitbake can m=
ap to the<br>
&gt; +# RDEPENDS we define for it in this recipe, and thereby ensure that w=
hen<br>
&gt; +# adding the console-kit module to an image, we also get the necessar=
y<br>
&gt; +# consolekit package produced.<br>
&gt; =C2=A0PACKAGES =3D+ &quot;libpulsecore libpulsecommon libpulse libpuls=
e-simple libpulse-mainloop-glib \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pulseaudio-server pulseaud=
io-misc&quot;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pulseaudio-server pulseaud=
io-misc pulseaudio-module-console-kit&quot;<br>
<br>
</div></div>Can we add PACKAGECONFIG for this and add it to PACKAGES only<b=
r>
conditionally?<br>
<br>
It causes hard dependency on consolekit -&gt; libx11 so pulseaudio now<br>
cannot be built for distros without x11 DISTRO_FEATURE.</blockquote></div><=
br>Sorry about this, I=E2=80=99ll send a patch shortly.<br>-- <br>Christoph=
er Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded,=
 OpenZaurus<br>

Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e0118393ed2861404ed5e4076--
