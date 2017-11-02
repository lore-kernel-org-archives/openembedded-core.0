Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 399E260762
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 00:51:42 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id e89so10103852ioi.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Nov 2017 17:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Yo4oiysiRIDG2SNW53phk1OE4gF93l91fL7nz6WeJ64=;
	b=U3P3KmQyHbel44My0usqLcrGJSZ6UGK6zwngE2kbe6hEHjSPAaI/Wih+vwRTH0SHtO
	gosbYcxN2y4hTSxWwzcgKqCOImOawnrR9cbRQNzMB6mc1cIa1L4mp4etos3wUFn3T/Cg
	500U7nk5oAk41EIiJwVZ4PHTT4c5PyH87iczNlWFKpnIHjCIflLjDMvh1wIfnzpY4QIx
	SsZCdymUrhm/DftO9mbbq0nrMUGzmFNQmcTtk8Fpa/Cq588kQ4pYa3+f9EEmaAMdnOHC
	arnkx/5N3huRNj9T3VxYxey9JB9BqWXXBy3AQfhOQv7ivLhUNorSP7TqFk5NHUfo+hLY
	3Dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Yo4oiysiRIDG2SNW53phk1OE4gF93l91fL7nz6WeJ64=;
	b=kZy+LWvPezuQvpHn9hiTleSigBK4UREYJxrl8h2Ptzs7iMItdsIGhcQtR1Gensjhyx
	GIA5wUMeS3azFIR9S62Ixmozx0rTmf0F+1LB3gYyDZIdL23gltxJOeAmnpazdnN2ul2/
	5hR+/nyx2VHJDnYCM/KBKf6+9J+x49lHtD7Gojy2qA8knbE+2kyKT5AWojJDq+v+8JbQ
	T0L1YUF73uzY9fGW9YodIc+4MhJzWvRQ536kNutAINxkqlHffxTHyHoKlph5B7PVoo6M
	MF4ccQvj93FxDsmiqv5BBGBfVUVTZ8Bqsevzy15gspPakZCOp07UPiLY5X5b+Til6Ive
	HaRA==
X-Gm-Message-State: AJaThX7gDaw0CtO8RUrziLHjzF/k6JUG5vLDQuKk9ZajSTP9qrYMqmyH
	agtZmOoiwAU5dfZ9V1dZcSdfpwD58WdE1bC3Lki5UA==
X-Google-Smtp-Source: ABhQp+QS+x1GqBLZH0e5TFrx+nF3+o60TlmB7u/ThPRNcqCU1mni65GMfmJMzPu+yzECQynwg82sWhFlVLy42S7WyOY=
X-Received: by 10.107.36.80 with SMTP id k77mr2249300iok.176.1509583904305;
	Wed, 01 Nov 2017 17:51:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Wed, 1 Nov 2017 17:51:23 -0700 (PDT)
In-Reply-To: <1509573880.28159.39.camel@linuxfoundation.org>
References: <1508587571-4733-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJTo0LYFFZ-DOhZAepuJnXUgOTZDLcqxnWgj9F8-BLne_+wFvw@mail.gmail.com>
	<CAP9ODKoTc09+i4XOTwYfj9g+_=df13Gtk5TzyC2jSuxZqtZKsg@mail.gmail.com>
	<1509573880.28159.39.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Nov 2017 00:51:23 +0000
Message-ID: <CAJTo0LZer8ptGnSavgbUcLhnt=YTBUzX-FJw47gthKnFtTKqHw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-buildenv-internal: Fix finding build directory
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
X-List-Received-Date: Thu, 02 Nov 2017 00:51:43 -0000
Content-Type: multipart/alternative; boundary="001a1141909e602bf7055cf564e7"

--001a1141909e602bf7055cf564e7
Content-Type: text/plain; charset="UTF-8"

On 1 November 2017 at 22:04, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2017-10-31 at 21:25 -0200, Otavio Salvador wrote:
> > On Tue, Oct 31, 2017 at 9:16 PM, Burton, Ross <ross.burton@intel.com>
> > wrote:
> > >
> > > On 21 October 2017 at 13:06, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-
> > > > internal
> > > > index e6cd141..abc5aff 100755
> > > > --- a/scripts/oe-buildenv-internal
> > > > +++ b/scripts/oe-buildenv-internal
> > > > @@ -105,6 +105,11 @@ fi
> > > >
> > > >  BITBAKEDIR=$(readlink -f "$BITBAKEDIR")
> > > >  BUILDDIR=$(readlink -f "$BUILDDIR")
> > > > +if [ -z "$BBPATH" ]; then
> > > > +    BBPATH=$BUILDDIR
> > > > +fi
> > > > +
> > > > +export BBPATH
> > >
> > > This breaks the use-case of the user switching between build
> > > directories as
> > > re-executing oe-init-build-env doesn't change BBPATH.
> > I know and that's why I asked for a warning! ;-)
>
> My patch as it stands clearly can't go in.
>
> Our options are:
>
> a) make that codepath unconditional (which may be no bad thing) and
>    use BBPATH
> b) use a specific variable for bitbake, the script sets BUILDDIR
> c) start allowing the external code to set TOPDIR directly
>
> I think I'm leaning towards a) or possibly c). I don't really like b).
> I tried c) locally and its behaving oddly. a) is known to work.
>

(a) seems like the right fix here.  At least, that's what I expected to
happen...

Ross

--001a1141909e602bf7055cf564e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 November 2017 at 22:04, Richard Purdie <span dir=3D"l=
tr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_bl=
ank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">On Tue, 2017-10-31 at 21:25 -0200, Otavio Salvador wrote:<=
br>
&gt; On Tue, Oct 31, 2017 at 9:16 PM, Burton, Ross &lt;<a href=3D"mailto:ro=
ss.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On 21 October 2017 at 13:06, Richard Purdie<br>
&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@<wbr>linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; &gt;=C2=A0<br>
</span>&gt; &gt; &gt; diff --git a/scripts/oe-buildenv-internal b/scripts/o=
e-buildenv-<br>
<span class=3D"">&gt; &gt; &gt; internal<br>
&gt; &gt; &gt; index e6cd141..abc5aff 100755<br>
&gt; &gt; &gt; --- a/scripts/oe-buildenv-internal<br>
&gt; &gt; &gt; +++ b/scripts/oe-buildenv-internal<br>
&gt; &gt; &gt; @@ -105,6 +105,11 @@ fi<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =C2=A0BITBAKEDIR=3D$(readlink -f &quot;$BITBAKEDIR&quot;)<br=
>
&gt; &gt; &gt; =C2=A0BUILDDIR=3D$(readlink -f &quot;$BUILDDIR&quot;)<br>
&gt; &gt; &gt; +if [ -z &quot;$BBPATH&quot; ]; then<br>
&gt; &gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0BBPATH=3D$BUILDDIR<br>
&gt; &gt; &gt; +fi<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +export BBPATH<br>
&gt; &gt;<br>
&gt; &gt; This breaks the use-case of the user switching between build<br>
&gt; &gt; directories as<br>
&gt; &gt; re-executing oe-init-build-env doesn&#39;t change BBPATH.<br>
&gt; I know and that&#39;s why I asked for a warning! ;-)<br>
<br>
</span>My patch as it stands clearly can&#39;t go in.<br>
<br>
Our options are:<br>
<br>
a) make that codepath unconditional (which may be no bad thing) and=C2=A0<b=
r>
=C2=A0 =C2=A0use BBPATH<br>
b) use a specific variable for bitbake, the script sets BUILDDIR<br>
c) start allowing the external code to set TOPDIR directly<br>
<br>
I think I&#39;m leaning towards a) or possibly c). I don&#39;t really like =
b).<br>
I tried c) locally and its behaving oddly. a) is known to work.<br></blockq=
uote><div><br></div><div>(a) seems like the right fix here.=C2=A0 At least,=
 that&#39;s what I expected to happen...</div><div><br></div><div>Ross=C2=
=A0</div></div></div></div>

--001a1141909e602bf7055cf564e7--
