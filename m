Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27324C3DA59
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 06:17:23 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.13144.1721369837444172475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 23:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bo1qFMLJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ee920b0781so19002951fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 23:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721369835; x=1721974635; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ehxChVKM9Qn9CBmEIr4/0OYKi7zmEijjKHoGdJVkS0E=;
        b=Bo1qFMLJdY8Pdu1iCqKTswHBer2o2if9/cHoADUnDhmKzF/1aKjeVooihM3z8HH62q
         CGtaDfW92MOCVJHdxieLXewjR2KvPKQL7qg5ZmWzIy+/oIxi+MvlO5RaAuSxfIQwsnjP
         J2TgQlX8nUuUrlIARSoG5hsqXngkBJX+a5hVTo1uKg7pYXu227ff//0u00OeaP/X99/q
         cGZ+rNMCL6BRafdWofoYcUblw3yE+BU7GT6U7hvU4Y8pLiO7as7E9SAv77r0BlKsYz+k
         Y00l/t1RGfwsYvBxdQdlE9DYb/jH8cbP0ywrrAxk4+sr6p2hHWBSWT9L9qtqVwnQ2bPS
         82eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721369835; x=1721974635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehxChVKM9Qn9CBmEIr4/0OYKi7zmEijjKHoGdJVkS0E=;
        b=Gn0MlneV5+eVlAdIZUtsa57K12T2ISxXAevE9bQIpWlTmFARWYyf2x7F71R3prxuN1
         b6DQ2xcT6Zj3pGJVaX38WTqxBynowPlpuIAcwvEs73OIgIJ+HE+LLhFljoIrZUBaXHm1
         Yeznq9B8FcZh4BY5md9NaqY1n9KSm3gDkF9LcDvCrxg2rAXQhvFFDRZpEuhnryV6EVJX
         XG7hPgMit6ZWVxmNexXIxbFpdbU+NiXlD3+gQoYvK5+Uxszyjax019k5JWQxMZVyL3ym
         OsJhnzJwxJ195QP9mPvHddFYIbNFWUgbI9lpmbB+vQbPYXyaXIXrxkCXgWUembt6f6vD
         RoGA==
X-Forwarded-Encrypted: i=1; AJvYcCWWrQMV9B96INBrw7xOho6wbEiWIvZyevQDdGfLsU2IloTQy9tMo3CEuALUqM563I4nRDRR8ng4iFAcICod7csn7fcD4rV6gj2/YoVRR5i9Yf2RMuofXnCE
X-Gm-Message-State: AOJu0YwwLvdk3FVSwTnQmHPJ3DrOn0cXaQTxUD/CYKDlDqVnfaAJALYF
	40kcIFFkRnDKGH9fzLze91QJPxc6BEcdCs6e3mGxPAm+Q/QYPok+peN+f3+NY75Av0bOhufGcHy
	wL1TrGSgpt3HfNCP70VTdvulW5dw=
X-Google-Smtp-Source: AGHT+IEFb/aD/klXXj2wzgcps9rkk2SCrnYERTfRtTKx/iKI8BSWsSUHjVt+MaQZoeNuqZ1aVjHd8WAyKXEphiQVb6s=
X-Received: by 2002:a2e:730b:0:b0:2ec:58e8:d7a6 with SMTP id
 38308e7fff4ca-2ef05c53be4mr29801221fa.5.1721369834961; Thu, 18 Jul 2024
 23:17:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240717023201.861394-1-jiaying.song.cn@windriver.com> <20240718224715.GM17572@denix.org>
In-Reply-To: <20240718224715.GM17572@denix.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 19 Jul 2024 08:17:03 +0200
Message-ID: <CANNYZj_PDL3P6WKEkN1BdioyPEMbYVJZP=WmuVkbKeW7=O_vVA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jiaying.Song.CN@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008a4674061d93a569"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jul 2024 06:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202248

--0000000000008a4674061d93a569
Content-Type: text/plain; charset="UTF-8"

But there is no alternative. Python is python3 and has been for years.

Alex

On Fri 19. Jul 2024 at 0.47, Denys Dmytriyenko <denis@denix.org> wrote:

> Should this be done via update-alternatives, like many other Linux distros
> do?
>
>
> On Wed, Jul 17, 2024 at 10:32:01AM +0800, Song, Jiaying (CN) via
> lists.openembedded.org wrote:
> > From: Jiaying Song <jiaying.song.cn@windriver.com>
> >
> > The /usr/bin/python cannot find the correct Python interpreter, so a
> symbolic
> > link is added to point it to the Python3 interpreter.
> >
> > Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> > ---
> >  meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
> >  meta/recipes-devtools/python/python3_3.12.4.bb             | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json
> b/meta/recipes-devtools/python/python3/python3-manifest.json
> > index 46092d4004..f9259e1450 100644
> > --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> > +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> > @@ -220,6 +220,7 @@
> >          "files": [
> >              "${bindir}/python${PYTHON_MAJMIN}",
> >              "${bindir}/python${PYTHON_MAJMIN}.real",
> > +            "${bindir}/python",
> >              "${bindir}/python3",
> >              "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
> >              "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
> > diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb
> b/meta/recipes-devtools/python/python3_3.12.4.bb
> > index 743ba0b1f1..94535e7678 100644
> > --- a/meta/recipes-devtools/python/python3_3.12.4.bb
> > +++ b/meta/recipes-devtools/python/python3_3.12.4.bb
> > @@ -165,6 +165,7 @@ do_install:prepend() {
> >
> >  do_install:append:class-target() {
> >          oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
> > +        ln -sf ${bindir}/python3 ${D}${bindir}/python
> >  }
> >
> >  do_install:append:class-native() {
> > --
> > 2.44.0
>

--0000000000008a4674061d93a569
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">But there is no alternative. Python is python3 and has be=
en for years.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div>=
<div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri 19. Jul 2024 at 0.47, Denys Dmytriyenko &lt;<a href=3D"mailto:denis@d=
enix.org">denis@denix.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">Should t=
his be done via update-alternatives, like many other Linux distros do?<br>
<br>
<br>
On Wed, Jul 17, 2024 at 10:32:01AM +0800, Song, Jiaying (CN) via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> wrote:<br>
&gt; From: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@windriver.com=
" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
&gt; <br>
&gt; The /usr/bin/python cannot find the correct Python interpreter, so a s=
ymbolic<br>
&gt; link is added to point it to the Python3 interpreter.<br>
&gt; <br>
&gt; Signed-off-by: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@wind=
river.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/python/python3/python3-manifest.json | 1 +=
<br>
&gt;=C2=A0 meta/recipes-devtools/python/<a href=3D"http://python3_3.12.4.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.12.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt;=C2=A0 2 files changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/python/python3/python3-manifest.jso=
n b/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt; index 46092d4004..f9259e1450 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt; +++ b/meta/recipes-devtools/python/python3/python3-manifest.json<br>
&gt; @@ -220,6 +220,7 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;files&quot;: [<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python=
${PYTHON_MAJMIN}&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python=
${PYTHON_MAJMIN}.real&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python&quot=
;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${bindir}/python=
3&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${includedir}/py=
thon${PYTHON_MAJMIN}/pyconfig*.h&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;${libdir}/python=
${PYTHON_MAJMIN}/UserDict.py&quot;,<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.=
12.4.bb" rel=3D"noreferrer" target=3D"_blank">python3_3.12.4.bb</a> b/meta/=
recipes-devtools/python/<a href=3D"http://python3_3.12.4.bb" rel=3D"norefer=
rer" target=3D"_blank">python3_3.12.4.bb</a><br>
&gt; index 743ba0b1f1..94535e7678 100644<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.4.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.12.4.bb</a><br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.12.4.bb=
" rel=3D"noreferrer" target=3D"_blank">python3_3.12.4.bb</a><br>
&gt; @@ -165,6 +165,7 @@ do_install:prepend() {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install:append:class-target() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_multilib_header python${PYTHON_MA=
JMIN}/pyconfig.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ${bindir}/python3 ${D}${bindir}/py=
thon<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 do_install:append:class-native() {<br>
&gt; -- <br>
&gt; 2.44.0<br>
</blockquote></div></div>

--0000000000008a4674061d93a569--

