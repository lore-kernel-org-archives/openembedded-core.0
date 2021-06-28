Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.7124.1624855584698179072
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 21:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ewBX9cou;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id w127so20589440oig.12
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 21:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EPEyDMB3KoEC7BWlthlArijzkgI0Evlz4KP6xnVxrmw=;
        b=ewBX9coucIGlRVhjTou754ryc50sgx+7Hy/ZeoI7rPBWpGqQ0pml+yyaxY4lOy5UWe
         IiEp21zHbFXSgdmFEz4NDLNJpOEGaUOTtYWf4X0s3c2mvPPvFr7vx1+w3PCG2jzUp5eI
         01jmwLx+L++Zsk9QQWqmxByKMRoF8QWD8juU38TeHKNxt8jMxfvYlk7V+jLtYyONLrzU
         VwJmTyP2WjdI6D7tD2ZnsoE2wM47ilekbsIBMUwp5vERXpOkwLn/GRMDatmwkj//QHrc
         loVqXHUKUIohGnb8Z6Fg26rreEADZ0mFnnzRxIWwbcNS0kPAFu8nRDcRXjozmxD/MN1e
         VuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EPEyDMB3KoEC7BWlthlArijzkgI0Evlz4KP6xnVxrmw=;
        b=D0IXsZ0VIipXoryu8+dkC3jKC2//6ot2esuzGl4akXe/WHHIqLm93Fg4rDfyudH+Qf
         glmkaeTbYd3kOXsk3TUQMhbSmQJrmG973zt1s4PANVSOXTV7iZiJZ1H63NoRfW7c0yyq
         o2d4QhuXlVai657m+8uvVfXXVhjG2XTQV9oLxVFVXBEb35mbCEw8dfSUDl3uvSTNXJtW
         npzHvr+ATWfWBG6Imp51cA0csPg0koBatFvI2QvnemJapaAIzgv1n/2fvQNPb3ZpXK5D
         zWF2bP2UUroGaHiO/AnVqY6MXLB0773xCsAiWJX81aSSoHcZLXxRAYbz6M47NBMOW3NZ
         6SPQ==
X-Gm-Message-State: AOAM5335DglMXjkBV0ehvc//KdOwNCH7zUY4gCz++w1AaSxJAyfXRaXf
	Ub5lofjOWIRDeOF0MPhGyYnyySh+qPChbW4gl1Y=
X-Google-Smtp-Source: ABdhPJwkkW+IOy52YaTibbgnzGiD6P9Ej0p+yxEwPqhYUwAgO0xxtkw8xa7cm+PtWqnLG9TN9svkst9P/TeXn168Q+w=
X-Received: by 2002:a05:6808:346:: with SMTP id j6mr2934279oie.142.1624855584041;
 Sun, 27 Jun 2021 21:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210623130637.3314755-1-frederic.martinsons@gmail.com>
 <20210623130637.3314755-2-frederic.martinsons@gmail.com> <CA+cAkeoV-ncBLKpcGm4MKeuqYjSXyKsCU4NWdNTmO51iUAaqZg@mail.gmail.com>
 <76618960f73199585debc705dfd09775472d38f8.camel@linuxfoundation.org>
In-Reply-To: <76618960f73199585debc705dfd09775472d38f8.camel@linuxfoundation.org>
From: "Frederic Martinsons" <frederic.martinsons@gmail.com>
Date: Mon, 28 Jun 2021 06:46:13 +0200
Message-ID: <CA+cAkeqMzE4uSwPxtzeMdRb7j4YWrn6qGcJSX_SgPa+f3FAuXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] package.bbclass: manage external sources for debug source file packaging
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e5eeb705c5cc2b3d"

--000000000000e5eeb705c5cc2b3d
Content-Type: text/plain; charset="UTF-8"

Hello Richard,

First, sorry for the commit message (I gave details in the first patch on
externalsrc.bbclass but not on this one). I agree with you that it seems an
hack but I don't know to make package;bbclass find the sources correctly.
The "culprit" is the following command (
https://github.com/openembedded/openembedded-core/blob/master/meta/classes/package.bbclass#L591)
and especially the last part of it:

processdebugsrc += "(cd '%s' ; cpio -pd0mlL --no-preserve-owner '%s%s'
> 2>/dev/null)"


this command explicitely goes into *workparentdir *and wait for the sources
to be in it thanks to the input list that was calculated as the output of
dwarfsrcfiles earlier call (with *localsrc_prefix *remove from them).

Have you an idea (or even a lead that I can explore) on how make things
correct here ?

On Mon, 28 Jun 2021 at 00:00, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2021-06-23 at 15:09 +0200, Frederic Martinsons wrote:
> > Hello, I would like to add a link to a yocto mail where I expose my
> problematic that led
> > to this patch series:
> >
> https://lists.yoctoproject.org/g/yocto/topic/83622035?p=,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,83622035
> >
> > After further research, I think these patch can be simplified by
> modified only
> > WORKDIR variable to be os.path.dirname(EXTERNALSRC) but I fear of
> consequence
> > to have WORKDIR outside of TMPDIR so I didn't take this path.
>
> Changing WORKDIR would no doubt solve your immediate problem but would
> create
> a ton of others :(.
>
> The issue is that the class wants to re-declare S but some of our code
> makes
> assumptions about the location of WORKDIR with regard to S (and B). There
> is more inside WORKDIR than just S and EXTERNALSRC does really correspond
> to S,
> not WORKDIR...
>
> Cheers,
>
> Richard
>
>
>
>

--000000000000e5eeb705c5cc2b3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Richard,<div><br></div><div>First, sorry for the com=
mit message (I gave details in the first patch on externalsrc.bbclass but n=
ot on this one). I agree with you that it seems an hack but I don&#39;t kno=
w to make package;bbclass find the sources correctly.</div><div>The &quot;c=
ulprit&quot; is the following command (<a href=3D"https://github.com/openem=
bedded/openembedded-core/blob/master/meta/classes/package.bbclass#L591">htt=
ps://github.com/openembedded/openembedded-core/blob/master/meta/classes/pac=
kage.bbclass#L591</a>) and especially the last part of it:</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"color:=
rgb(36,41,46);font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,C=
onsolas,&quot;Liberation Mono&quot;,Menlo,monospace;font-size:12px;white-sp=
ace:pre"> </span>processdebugsrc<span style=3D"color:rgb(36,41,46);font-fam=
ily:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Consolas,&quot;Liberati=
on Mono&quot;,Menlo,monospace;font-size:12px;white-space:pre"> +=3D &quot;(=
cd &#39;%s&#39; ; cpio -pd0mlL --no-preserve-owner &#39;%s%s&#39; 2&gt;/dev=
/null)&quot;</span></blockquote><div><br></div><div>this command explicitel=
y=C2=A0goes into <b>workparentdir=C2=A0</b>and wait for the sources to be i=
n it thanks to the input list that was calculated as the output of dwarfsrc=
files=C2=A0earlier call (with <b>localsrc_prefix </b>remove from them).</di=
v><div><br></div><div>Have you an idea (or even a lead that I can explore) =
on how make things correct here ?</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 28 Jun 2021 at 00:00, Richar=
d Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.=
purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Wed, 2021-06-23 at 15:09 +0200, Frederic Marti=
nsons wrote:<br>
&gt; Hello, I would like to add a link to a yocto mail where I expose my pr=
oblematic that led=C2=A0<br>
&gt; to this patch series:=C2=A0 <br>
&gt; <a href=3D"https://lists.yoctoproject.org/g/yocto/topic/83622035?p=3D,=
,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,83622035" rel=3D"noreferrer" t=
arget=3D"_blank">https://lists.yoctoproject.org/g/yocto/topic/83622035?p=3D=
,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,0,83622035</a><br>
&gt; <br>
&gt; After further research, I think these patch can be simplified by modif=
ied only=C2=A0<br>
&gt; WORKDIR variable to be os.path.dirname(EXTERNALSRC) but I fear of cons=
equence=C2=A0<br>
&gt; to have WORKDIR outside of TMPDIR so I didn&#39;t take this path.<br>
<br>
Changing WORKDIR would no doubt solve your immediate problem but would crea=
te<br>
a ton of others :(.<br>
<br>
The issue is that the class wants to re-declare S but some of our code make=
s<br>
assumptions about the location of WORKDIR with regard to S (and B). There<b=
r>
is more inside WORKDIR than just S and EXTERNALSRC does really correspond t=
o S,<br>
not WORKDIR...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000e5eeb705c5cc2b3d--
