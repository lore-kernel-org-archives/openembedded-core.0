Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.7070.1624854945443809587
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 21:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i7FSUj87;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id h9so20588334oih.4
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 21:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vnhd3YF/GWaunPJxf/AvysnD2DTdtIVlpmpHTWLO1pQ=;
        b=i7FSUj87R7D1Gq+q4qMkdTfSCWtSu7SjD8SvXfE1Xfs5ylyapuQ3sh+fxvo8wOGJUv
         ofcLGdytRd+6h2slF8KGeHJ7axqkkMVx53qoHhr8+/O3lBwYz7yWh7Oo0OEMQLskA2xl
         hrX/azA7NLOfajikWwi6v/JNt92GiXXOFs1TuptSqT/ngit8gIwb2Ntmnx5SYH9GPsYG
         qwCdxobgbFqXDPZ5GHXqF/RV3zLXFBLQpEtY+ChpeklqAdZ3qLucO//86x3ixqMy4nll
         DP8eXnqyBilfYowF2CbYLRflaAw1xntv8KiH2uPfhiYBGXirChK2rus87FFlGLits0LL
         ZbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vnhd3YF/GWaunPJxf/AvysnD2DTdtIVlpmpHTWLO1pQ=;
        b=KssQf50p6oYaDCttAcoIoRlDgzLzWKyLmCvKUtlIIqGF4Wb+h1anIXrhnkmicVU2lE
         jm1mvFYlDrTHeOKHaowsancnPxAi6De4bgXrH0s1FeZIpoYTy0eTjBnZX6WforEdp+oR
         NdoqMRm+TUORUeRAxbzcYGxw2FrYTBfTc2m2X92yIq7QQWtv1AlLyrsNzUmjB6UvdCvM
         4R8uh0qLNo9buf2kPgSea2oKJv3Km67hCDvLWrbH3a31Czs6tgCGLwpdxuW4Eo61EI43
         4/CqWKOVszooRfnC5S1UfZ/Nm4ruOaCMt8ibBHGA3gRzevpszFD6ltH28Gv+qBBYQ5Lu
         kxJA==
X-Gm-Message-State: AOAM533lMH1uxoG6fzRSzFjbsaZ1e5dHpO4d/KH8Re/1D/xUbsC6tUmY
	ajJmmBb9NpJoRQqywIXX4+j2V7wYxxQMGDUy3yAuPhQo
X-Google-Smtp-Source: ABdhPJzFBoEZ6Lic92GKzsBCWI9JQMbGdUU1Up+T0VA7XqTG+vAV5ZRuq09fr5nRIAWSiveRwIWeWMCa89Ov4Kg8dAE=
X-Received: by 2002:a05:6808:346:: with SMTP id j6mr2916872oie.142.1624854944731;
 Sun, 27 Jun 2021 21:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210623130637.3314755-1-frederic.martinsons@gmail.com> <4510a378b3264d7ba29be80af9078510cef1a633.camel@linuxfoundation.org>
In-Reply-To: <4510a378b3264d7ba29be80af9078510cef1a633.camel@linuxfoundation.org>
From: "Frederic Martinsons" <frederic.martinsons@gmail.com>
Date: Mon, 28 Jun 2021 06:35:33 +0200
Message-ID: <CA+cAkeoz=W1Mt-TeDFgB2XpMb56gddPCDnfnJMj4Fu_3Am+-pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] externalsrc.bbclass: dynamical change of DEBUG_PREFIX_MAP
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cad68405c5cc0566"

--000000000000cad68405c5cc0566
Content-Type: text/plain; charset="UTF-8"

Hello Richard,

Thanks for your answer, I didn't think about poking parent directory issue
but you're right. What about setting B to ${EXTERNALSRC}/${PN}-build
instead ?
The important thing here (from what I understood) is to avoid having too
much relative path (that is to say a number of '../' greater than the
number of directory required to reach BDIR starting from EXTERNALSRC.

On Mon, 28 Jun 2021 at 00:04, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-06-23 at 15:06 +0200, Frederic Martinsons wrote:
> > When using external source manager (devtool), the debug symbol generated
> > by the compilation doesn't point to the right directory.
> > This is normally handled by gcc options that are defined
> > in DEBUG_PREFIX_MAP in conf/bitbake.conf.
> >
> > But the path in it are hardcoded and point to WORKDIR which is
> > not overloaded by devtool.
> >
> > This patch takes the parent directory of external source directory
> > and prepend correct path to DEBUG_PREFIX_MAP.
> >
> > Moreover, to avoid wrong path resolution during dwarfsrcfiles step
> > in splitdebuginfo, it make B variable point to the same
> > structure as EXTERNALSRC (if EXTERNALSRC_BUILD is not defined).
> >
> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > ---
> >  meta/classes/externalsrc.bbclass | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> > index 3d6b80bee2..de5ef714b4 100644
> > --- a/meta/classes/externalsrc.bbclass
> > +++ b/meta/classes/externalsrc.bbclass
> > @@ -53,14 +53,26 @@ python () {
> >              d.setVar('BB_DONT_CACHE', '1')
> >
> >
> >      if externalsrc:
> > +        import os
> >          import oe.recipeutils
> >          import oe.path
> >
> >
> > +        pn = d.getVar('PN')
> > +        # taken from bitbake.conf
> > +        debugsrcdir = "/usr/src/debug/%s/%s%s-%s" % (pn,
> d.getVar('EXTENDPE'), d.getVar('PV'), d.getVar('PR'))
> > +        externalsrc_parentdir = os.path.dirname(externalsrc)
> > +
> > +        debug_prefix_map_ext = "-fmacro-prefix-map=%s=%s " %
> (externalsrc_parentdir, debugsrcdir)
> > +        macro_prefix_map_ext = "-fdebug-prefix-map=%s=%s " %
> (externalsrc_parentdir, debugsrcdir)
> > +        d.prependVar('DEBUG_PREFIX_MAP', debug_prefix_map_ext)
> > +        d.prependVar('DEBUG_PREFIX_MAP', macro_prefix_map_ext)
> > +
> >          d.setVar('S', externalsrc)
> >          if externalsrcbuild:
> >              d.setVar('B', externalsrcbuild)
> >          else:
> > -            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
> > +            builddir = os.path.join(externalsrc_parentdir, "%s-build" %
> pn)
> > +            d.setVar('B', builddir)
> >
>
> I'm ok with adding some prefix mappings however the commit message doesn't
> really
> make it clear that you're actually inventing a new build directory here
> too. We
> can't just poke around the parent directory of the externalsrc like this
> since we
> have no idea what that directory is and we've not been asked to "touch" it.
>
> Cheers,
>
> Richard
>
>
>
>

--000000000000cad68405c5cc0566
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Richard,<div><br></div><div>Thanks for your answer, =
I didn&#39;t think about poking parent directory issue but you&#39;re right=
. What about setting B to ${EXTERNALSRC}/${PN}-build instead ?</div><div>Th=
e important thing here (from what I understood) is to avoid having too much=
 relative path (that is to say a number of &#39;../&#39; greater than the n=
umber of directory required to reach BDIR starting from EXTERNALSRC.</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, 28 Jun 2021 at 00:04, Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2021-0=
6-23 at 15:06 +0200, Frederic Martinsons wrote:<br>
&gt; When using external source manager (devtool), the debug symbol generat=
ed<br>
&gt; by the compilation doesn&#39;t point to the right directory.<br>
&gt; This is normally handled by gcc options that are defined<br>
&gt; in DEBUG_PREFIX_MAP in conf/bitbake.conf.<br>
&gt; <br>
&gt; But the path in it are hardcoded and point to WORKDIR which is<br>
&gt; not overloaded by devtool.<br>
&gt; <br>
&gt; This patch takes the parent directory of external source directory<br>
&gt; and prepend correct path to DEBUG_PREFIX_MAP.<br>
&gt; <br>
&gt; Moreover, to avoid wrong path resolution during dwarfsrcfiles step<br>
&gt; in splitdebuginfo, it make B variable point to the same<br>
&gt; structure as EXTERNALSRC (if EXTERNALSRC_BUILD is not defined).<br>
&gt; <br>
&gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<b=
r>
&gt; ---<br>
&gt; =C2=A0meta/classes/externalsrc.bbclass | 14 +++++++++++++-<br>
&gt; =C2=A01 file changed, 13 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externals=
rc.bbclass<br>
&gt; index 3d6b80bee2..de5ef714b4 100644<br>
&gt; --- a/meta/classes/externalsrc.bbclass<br>
&gt; +++ b/meta/classes/externalsrc.bbclass<br>
&gt; @@ -53,14 +53,26 @@ python () {<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0d.setVar(&#39;BB_DONT_CACHE&#39;, &#39;1&#39;)<br>
&gt; =C2=A0<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if externalsrc:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 import os<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0import oe.recipe=
utils<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0import oe.path<b=
r>
&gt; =C2=A0<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # taken from bitbake.conf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 debugsrcdir =3D &quot;/usr/src/debug/%s/%=
s%s-%s&quot; % (pn, d.getVar(&#39;EXTENDPE&#39;), d.getVar(&#39;PV&#39;), d=
.getVar(&#39;PR&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 externalsrc_parentdir =3D os.path.dirname=
(externalsrc)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 debug_prefix_map_ext =3D &quot;-fmacro-pr=
efix-map=3D%s=3D%s &quot; % (externalsrc_parentdir, debugsrcdir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 macro_prefix_map_ext =3D &quot;-fdebug-pr=
efix-map=3D%s=3D%s &quot; % (externalsrc_parentdir, debugsrcdir)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.prependVar(&#39;DEBUG_PREFIX_MAP&#39;, =
debug_prefix_map_ext)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.prependVar(&#39;DEBUG_PREFIX_MAP&#39;, =
macro_prefix_map_ext)<br>
&gt; +<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d.setVar(&#39;S&=
#39;, externalsrc)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if externalsrcbu=
ild:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0d.setVar(&#39;B&#39;, externalsrcbuild)<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;B&#39;, &#39;=
${WORKDIR}/${BPN}-${PV}/&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 builddir =3D os.path.join(e=
xternalsrc_parentdir, &quot;%s-build&quot; % pn)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&#39;B&#39;, build=
dir)<br>
&gt; =C2=A0<br>
<br>
I&#39;m ok with adding some prefix mappings however the commit message does=
n&#39;t really=C2=A0<br>
make it clear that you&#39;re actually inventing a new build directory here=
 too. We=C2=A0<br>
can&#39;t just poke around the parent directory of the externalsrc like thi=
s since we<br>
have no idea what that directory is and we&#39;ve not been asked to &quot;t=
ouch&quot; it.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000cad68405c5cc0566--
