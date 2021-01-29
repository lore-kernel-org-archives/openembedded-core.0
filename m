Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.1032.1611958486283449053
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 14:14:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X1LB5bWk;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id z22so12341402edb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 14:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hwdwDzQ0qBiYigUKOsOe5+Qq56yyuGOoov6x/MLYUHk=;
        b=X1LB5bWkihJonbGg7LlER8SNUChSWjUKPe9RTuhlPLva/SA1553OTG1PFGzhjFR16p
         RaWnvuDEnPgZ4s67gIVlHz6VlnUXvFX+QCBQxLHugdsY9GtwkyzSUmHUyf04Hq+GyuNY
         dRTHS/hKkyW7LEoxdgE7N+dczN6IdSZ+ArjmdSVDc5v7lBFJ341PZiuEjFb/IGT/rejs
         5DYwT2NKNCob47oXCs9m+BEvWuu3lNk/k2uhlzyAWTHuD8hSE9Kpr+Q38KOuJ8IBXfK0
         DaIZW3fKZECT7dzmvt/0WN8iWNzq65zlWuBOkpkb9qsPU4ClEntilLMhE8D3AooWf3pg
         CTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hwdwDzQ0qBiYigUKOsOe5+Qq56yyuGOoov6x/MLYUHk=;
        b=f1TWtIucz3L4nJg5KW836JgkEGWpFnnr1BcQy7G1KwZ+l9N881WRzWa1aiaehup8Fo
         l2O0bLLwlVPt6+t7HcscXYc0zbLYRkXqLq3IXrxAqduGetBFWtlHQw9ektwqJCQ0+8eb
         SebAO6z7ECFaZ9UipHrWdIFBwCh3YyZyu5Lj33B2R4FxfZmbksgHCo9OJDJ+gmOTiqNz
         i9ZD6ZgKOX+GkZiRnXEkzWHK+3+3imBbfVLbumAm9m3anKLjAcdKOno5P5q3l4OUTW5E
         qHKl+TWhernbQIeyP9gB2prED8yPwtUx1fFJbcQnNZH+bL46aJJlLuXed1egW5TVPaue
         d3SA==
X-Gm-Message-State: AOAM533dDuO6CvnNxpwi7NMArlm2HFuhyTetDQ2iHqnfVP9aYKk1kh4i
	2SrnHbbKziCWdcFvlF7nIoX4D0STBBa8W8zMCO8=
X-Google-Smtp-Source: ABdhPJzUTtEGKyFy8gJQMBZIWrB4h15rk2BdjIObDE9l7MZ4U/1VJQ6WrDWAmjngqWC4sqy0csT45aiN4MkrMNEgjwg=
X-Received: by 2002:a05:6402:2d1:: with SMTP id b17mr7571476edx.95.1611958484779;
 Fri, 29 Jan 2021 14:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20210124180758.1610301-1-quaresma.jose@gmail.com>
 <20210124180758.1610301-4-quaresma.jose@gmail.com> <20210128223834.GA2544418@piout.net>
 <165E86C2AF927994.17182@lists.openembedded.org> <165EB138E76788A6.12832@lists.openembedded.org>
 <245dfd64ed2342f41062898834c7929bde4a6989.camel@linuxfoundation.org>
In-Reply-To: <245dfd64ed2342f41062898834c7929bde4a6989.camel@linuxfoundation.org>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Fri, 29 Jan 2021 22:14:33 +0000
Message-ID: <CANPvuRm1d0_4M-c9pvYR9Zvb0oDd49prD+kasUcBmq6oYnePzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 4/4] shaderc: fix the build with glslang 11.1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e0c61305ba1154f5"

--000000000000e0c61305ba1154f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for the help in catch and try to solve this issue.

The recipe shaderc-native is the only recipe that is build in OE-Core
as it is needed by gstreamer plugins bad vulkan element.
The target shaderc is not used by anyone in OE-core at the moment
and because of that it don't have any build issues.

In my setup I don't see any erros and can build without any issues
the target shaderc on qemu as well as the shaderc-native.

I think that this problems can came from the spirv-tools that only generate
static libraries
and some this libraries have reproducible issues related with the glibc
librt.so.
The static libraries that come from spirv-tools are linked with the
librt.so from the host.

https://lists.openembedded.org/g/openembedded-core/message/147221

I will look at this when I have some time.
My next few weeks I=E2=80=99ll be very busy so I don=E2=80=99t promise anyt=
hing.

Many thanks,

Jose


Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia sexta,
29/01/2021 =C3=A0(s) 14:24:

> On Fri, 2021-01-29 at 11:42 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Thu, 2021-01-28 at 22:44 +0000, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Thu, 2021-01-28 at 23:38 +0100, Alexandre Belloni wrote:
> > > > Hello Jose,
> > > >
> > > > On 24/01/2021 18:07:58+0000, Jose Quaresma wrote:
> > > > > Drop patches:
> > > > >     * 0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch
> > > > >       is rejected upstream and is not need when glslang as shared
> libs.
> > > > >
> > > > > Update pacthes:
> > > > >     * 0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
> > > > >       renamed and refreshed from
> 0003-cmake-de-vendor-libs-and-disable-git-versioning.patch.
> > > > >
> > > >
> > > > It seems there is still a linking issue when building shaderc-nativ=
e.
> > > > The full log is available here:
> > > >
> > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2978/st=
eps/11/logs/stdio
> > >
> > > I have a suspicion this happens on Ubuntu 18.04 systems since I've se=
en
> > > issues like this locally with 18.04's binutils version and OE generat=
ed
> > > vulkan-samples binaries, I think Joshua Watt reported the same issue
> > > too with 18.04.
> > >
> > > Not sure what we can do about it, can we disable the debug symbol typ=
es
> > > causing problems in that -native recipe?
> >
> > I tried to reproduce this and couldn't so far. I suspect what happens
> > is that one of the dependencies builds on a newer system, shaderc-
> > native then builds on 1804 and it can't read the binary generated by
> > the newer binutils.
> >
> > This is obviously a pain to setup and reproduce. The "easiest" way may
> > be to build buildtools-tarball to build everything up to shaderc-
> > native, then remove buildtools-tarball and build shaderc-native. I'll
> > see if I can find some time to try that.
> >
> > I've been holding the patches in master-next but I think we probably
> > should merge them as this could well be a generic ubuntu1804 issue that
> > already probably exists.
>
> I tried this and I couldn't reproduce with master's buildtools tarball
> so I guess we wait and see if it comes up again.
>
> Cheers,
>
> Richard
>
>

--=20
best regards,
Jos=C3=A9 Quaresma

--000000000000e0c61305ba1154f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<div><br></div><div>Thanks for the help in catc=
h and try to solve this issue.</div><div><br></div><div>The recipe shaderc-=
native is the only recipe that is build in OE-Core</div><div>as it is neede=
d by gstreamer plugins bad vulkan element.<br></div><div>The target shaderc=
 is not used by anyone in OE-core at the moment</div><div>and because of th=
at it don&#39;t have any build issues.<br></div><div><br></div><div>In my s=
etup I don&#39;t see any erros and can build without any issues</div><div>t=
he target=C2=A0shaderc on qemu as well as the=C2=A0shaderc-native.</div><di=
v><br></div><div>I think that this problems can came from the=C2=A0spirv-to=
ols that only generate static libraries</div><div>and some this libraries h=
ave reproducible issues related with the glibc librt.so.</div><div>The stat=
ic libraries that come from spirv-tools are linked with the librt.so from t=
he host.=C2=A0</div><div><br></div><div><a href=3D"https://lists.openembedd=
ed.org/g/openembedded-core/message/147221">https://lists.openembedded.org/g=
/openembedded-core/message/147221</a><br></div><div><br></div><div>I will l=
ook at this when I have some time.</div><div>My next few weeks I=E2=80=99ll=
 be very busy so I don=E2=80=99t promise anything.</div><div><br></div><div=
>Many thanks,<br></div><div><br></div><div>Jose</div><div><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Richard=
 Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.p=
urdie@linuxfoundation.org</a>&gt; escreveu no dia sexta, 29/01/2021 =C3=A0(=
s) 14:24:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri=
, 2021-01-29 at 11:42 +0000, Richard Purdie via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Thu, 2021-01-28 at 22:44 +0000, Richard Purdie via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; On Thu, 2021-01-28 at 23:38 +0100, Alexandre Belloni wrote:<br>
&gt; &gt; &gt; Hello Jose,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On 24/01/2021 18:07:58+0000, Jose Quaresma wrote:<br>
&gt; &gt; &gt; &gt; Drop patches:<br>
&gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0* 0001-Fix-the-link-order-of-li=
bglslang-and-libHLSL.patch<br>
&gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0is rejected upstrea=
m and is not need when glslang as shared libs.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; Update pacthes:<br>
&gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0* 0001-cmake-de-vendor-libs-and=
-disable-git-versioning.patch<br>
&gt; &gt; &gt; &gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0renamed and refresh=
ed from 0003-cmake-de-vendor-libs-and-disable-git-versioning.patch.<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; It seems there is still a linking issue when building shader=
c-native.<br>
&gt; &gt; &gt; The full log is available here:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/bu=
ilders/40/builds/2978/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_bl=
ank">https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2978=
/steps/11/logs/stdio</a><br>
&gt; &gt; <br>
&gt; &gt; I have a suspicion this happens on Ubuntu 18.04 systems since I&#=
39;ve seen<br>
&gt; &gt; issues like this locally with 18.04&#39;s binutils version and OE=
 generated<br>
&gt; &gt; vulkan-samples binaries, I think Joshua Watt reported the same is=
sue<br>
&gt; &gt; too with 18.04.<br>
&gt; &gt; <br>
&gt; &gt; Not sure what we can do about it, can we disable the debug symbol=
 types<br>
&gt; &gt; causing problems in that -native recipe?<br>
&gt; <br>
&gt; I tried to reproduce this and couldn&#39;t so far. I suspect what happ=
ens<br>
&gt; is that one of the dependencies builds on a newer system, shaderc-<br>
&gt; native then builds on 1804 and it can&#39;t read the binary generated =
by<br>
&gt; the newer binutils.<br>
&gt; <br>
&gt; This is obviously a pain to setup and reproduce. The &quot;easiest&quo=
t; way may<br>
&gt; be to build buildtools-tarball to build everything up to shaderc-<br>
&gt; native, then remove buildtools-tarball and build shaderc-native. I&#39=
;ll<br>
&gt; see if I can find some time to try that.<br>
&gt; <br>
&gt; I&#39;ve been holding the patches in master-next but I think we probab=
ly<br>
&gt; should merge them as this could well be a generic ubuntu1804 issue tha=
t<br>
&gt; already probably exists.<br>
<br>
I tried this and I couldn&#39;t reproduce with master&#39;s buildtools tarb=
all<br>
so I guess we wait and see if it comes up again.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">best regards,<br>Jos=C3=A9 Quar=
esma</div></div>

--000000000000e0c61305ba1154f5--
