Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E31C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 12:56:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.165673.1673873791961195184
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 04:56:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hMk6YHpk;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so23555197wmb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 04:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FEcyvYqdIGjUxv1cRwwoTcUCh7eeY2x1c6CVap+YjRE=;
        b=hMk6YHpk/JFUxc8DM4CnTZn1/PR/NwJIkYvHYbnX45j6tZT5mREWkBwZV3YV5qWXIb
         bX8JFPj9VvHDPT7qnCSC+WM+t7P5qUlVQOSSwQVKStaYsoHoTh7yfhGTAdSTxwNP84o2
         K7io3d6Ls9S11n73i3GqXEXeEcewS5EQJDuEA4BBhzUcWNkDkdK/9SWDutP063b3g2yX
         rsu8UoJK7xcbUmssAgBe6ALcZrHrKsru3FjZT7fffk0PPianf2TG1OtvK+ZWinsGF0r+
         o1WxMvkXTxIigwk2+X1boygGWBPu9mnd4g4Vh0LuuQXLFXt+FmSl8nvLqXJxvH+S8l56
         SXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEcyvYqdIGjUxv1cRwwoTcUCh7eeY2x1c6CVap+YjRE=;
        b=0rdo1m9WBdCIzAFG3cygqM3ZUtIp6Oq+o4a+FtbI+htsMEgszjWNaPH4o/ymZxSkiN
         q7fcUP1KuVdnyn+6ltJz+99iLTf4r1uOPvuUN2yhZdphMLplTkq+2k+IyZ+paWwCPB3q
         NFdQSyKrhujlAqMLWoqQn0TxpERZY4C2uD2beqSiSuNzGoIv2JqYnTYnM92un6R4Rid5
         4vMjhVWiZlqamDpu09BaaILs/jzbbGnyET/Ll6MrUt5QZ+FHLg1Cyx/Q61QLoP92CqtI
         38QujdORQA5fRtLQxqfedUICCyW5Kir5wMoVaSNaoRs01R9PqR2dryny5heGfHvoJrC0
         KCzA==
X-Gm-Message-State: AFqh2krD7ydxfF1hxiTh0iLWfnKSz3cYeCC5775+foQQ/7iY7k4RVFSs
	rO3kT+5pinfaSVOyOy0U39SF5iEa/eEsTSn5nLc=
X-Google-Smtp-Source: AMrXdXvHGUT18+yk+udbfYJg3tTqKSrH5nbaTkLE17J2DuqphEFEAm5lesqLqLJE33kTQYGfE5SxvHu3tafSHhcGKaY=
X-Received: by 2002:a7b:c8d9:0:b0:3da:26ab:a38 with SMTP id
 f25-20020a7bc8d9000000b003da26ab0a38mr530386wml.102.1673873790162; Mon, 16
 Jan 2023 04:56:30 -0800 (PST)
MIME-Version: 1.0
References: <20230116084809.16470-1-Qi.Chen@windriver.com> <173AC3E18715B47D.23170@lists.openembedded.org>
 <729210c666036a1fe57866f8b10326a9768873a9.camel@linuxfoundation.org> <CO6PR11MB560236EA3C3AD9FAAB0B70CCEDC19@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB560236EA3C3AD9FAAB0B70CCEDC19@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Jan 2023 13:56:18 +0100
Message-ID: <CA+chaQe8yUH0YzF1cDFXORmBUofpuXezwjK6rs9hfKSenK0KhA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on nativesdk-file
To: "Chen, Qi" <Qi.Chen@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a95aaf05f2611ca4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 12:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175982

--000000000000a95aaf05f2611ca4
Content-Type: text/plain; charset="UTF-8"

The use case I was fixing in:
https://git.openembedded.org/openembedded-core/commit/?id=f40a2658f5be6739c5dddab7f9f11e1f85a17102
was just about rpmdeps not being able to find rpmrc due to wrong path in
the wrapper.

MAGIC was moved to environment-setup.d/rpm.sh just to set all variables
(which used to be set in the wrappers) in the same place and to be able to
remove the wrappers completely in the next commit.

It might be cleaner to set MAGIC variable in separate
environment-setup.d/file.sh installed by nativesdk-file to make sure that
it's set only together when corresponding magic.mgc is installed in SDK
(but we'll still need to depend on file where needed). MAGIC variable was
added in
https://git.openembedded.org/openembedded-core/commit/?id=760103cdaed3e820888d8984ec0b76cfc831d534
but commit doesn't say why.

Regards,

On Mon, Jan 16, 2023 at 1:47 PM Chen, Qi <Qi.Chen@windriver.com> wrote:

> Richard, I'm going to check how rpm uses 'file' and will come up with a
> better solution.
> Martin, could you please tell me your use case, if convenient? I will
> ensure I don't break it.
>
> Regards,
> Qi
>
> -----Original Message-----
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> Sent: Monday, January 16, 2023 7:14 PM
> To: Chen, Qi <Qi.Chen@windriver.com>;
> openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on
> nativesdk-file
>
> On Mon, 2023-01-16 at 10:39 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Mon, 2023-01-16 at 16:48 +0800, Chen Qi wrote:
> > > For now, running `file' inside SDK errors out.
> > >   file: could not find any valid magic files!
> > >
> > > This is because nativesdk-rpm exports MAGIC. So let's make
> > > nativesdk-rpm depend on file for better user experiences.
> > >
> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > > ---
> > >  meta/recipes-devtools/rpm/rpm_4.18.0.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> > > b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> > > index 8eb0ab207e..3b7d4d640a 100644
> > > --- a/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> > > +++ b/meta/recipes-devtools/rpm/rpm_4.18.0.bb
> > > @@ -188,6 +188,7 @@ PROVIDES += "python3-rpm"
> > >  FILES:python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
> > >
> > >  RDEPENDS:${PN}-build = "bash perl python3-core"
> > > +RDEPENDS:nativesdk-rpm += "nativesdk-file"
> >
> > Should we be adding file to ${PN}-build instead?  Which rpm command
> > was this with? Does anywhere else in rpm have/need this dependency?
>
> To answer my question, the problem is that as well as the rpm wrappers,
> the code also sets MAGIC= from an environment setup file.
>
> At the very least, the RDEPENDS needs a class-nativesdk override in there
> as otherwise it is floating around unconditionally.
>
> I don't really like adding workarounds like this since we won't understand
> them at some future date.
>
> Other solutions might include:
>
> a) patching RPM to use RPM_FILEMAGIC instead of MAGIC so we can set it in
> a more granular way
> b) moving the environment setup piece for MAGIC to nativesdk-file so it is
> only used if file is installed in the SDK
> c) fixing rpm (or file?) to dynamically relocate the paths it is using
>
> Can we see if there is a better solution we can switch to please?
>
> Cheers,
>
> Richard
>
>
>
>
>
>

--000000000000a95aaf05f2611ca4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The use case I was fixing in:<div><a href=3D"https://git.o=
penembedded.org/openembedded-core/commit/?id=3Df40a2658f5be6739c5dddab7f9f1=
1e1f85a17102">https://git.openembedded.org/openembedded-core/commit/?id=3Df=
40a2658f5be6739c5dddab7f9f11e1f85a17102</a><br></div><div>was just about rp=
mdeps not being able to find rpmrc due to wrong path in the wrapper.</div><=
div><br></div><div>MAGIC was moved to=C2=A0environment-setup.d/rpm.sh just =
to set all variables (which used to be set in the wrappers) in the same pla=
ce and to be able to remove the wrappers completely in the next commit.</di=
v><div><br></div><div>It might be cleaner to set MAGIC variable in separate=
 environment-setup.d/file.sh installed by nativesdk-file to make sure that =
it&#39;s set only together when corresponding=C2=A0magic.mgc is installed i=
n SDK (but we&#39;ll still need to depend on file where needed). MAGIC vari=
able was added in=C2=A0<a href=3D"https://git.openembedded.org/openembedded=
-core/commit/?id=3D760103cdaed3e820888d8984ec0b76cfc831d534">https://git.op=
enembedded.org/openembedded-core/commit/?id=3D760103cdaed3e820888d8984ec0b7=
6cfc831d534</a> but commit doesn&#39;t say why.</div><div><br></div><div>Re=
gards,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Mon, Jan 16, 2023 at 1:47 PM Chen, Qi &lt;<a href=3D"mailto:=
Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Richard, I&#39;m going to check=
 how rpm uses &#39;file&#39; and will come up with a better solution.<br>
Martin, could you please tell me your use case, if convenient? I will ensur=
e I don&#39;t break it.<br>
<br>
Regards,<br>
Qi<br>
<br>
-----Original Message-----<br>
From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; <br>
Sent: Monday, January 16, 2023 7:14 PM<br>
To: Chen, Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank"=
>Qi.Chen@windriver.com</a>&gt;; <a href=3D"mailto:openembedded-core@lists.o=
penembedded.org" target=3D"_blank">openembedded-core@lists.openembedded.org=
</a><br>
Subject: Re: [OE-core][PATCH] rpm: make nativesdk-rpm rdepend on nativesdk-=
file<br>
<br>
On Mon, 2023-01-16 at 10:39 +0000, Richard Purdie via <a href=3D"http://lis=
ts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedde=
d.org</a> wrote:<br>
&gt; On Mon, 2023-01-16 at 16:48 +0800, Chen Qi wrote:<br>
&gt; &gt; For now, running `file&#39; inside SDK errors out.<br>
&gt; &gt;=C2=A0 =C2=A0file: could not find any valid magic files!<br>
&gt; &gt; <br>
&gt; &gt; This is because nativesdk-rpm exports MAGIC. So let&#39;s make <b=
r>
&gt; &gt; nativesdk-rpm depend on file for better user experiences.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.co=
m" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18.0.bb" =
rel=3D"noreferrer" target=3D"_blank">rpm_4.18.0.bb</a> | 1 +<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18=
.0.bb" rel=3D"noreferrer" target=3D"_blank">rpm_4.18.0.bb</a> <br>
&gt; &gt; b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_4.18.0.bb</a><br>
&gt; &gt; index 8eb0ab207e..3b7d4d640a 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18.0.bb" =
rel=3D"noreferrer" target=3D"_blank">rpm_4.18.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_4.18.0.bb" =
rel=3D"noreferrer" target=3D"_blank">rpm_4.18.0.bb</a><br>
&gt; &gt; @@ -188,6 +188,7 @@ PROVIDES +=3D &quot;python3-rpm&quot;<br>
&gt; &gt;=C2=A0 FILES:python3-rpm =3D &quot;${PYTHON_SITEPACKAGES_DIR}/rpm/=
*&quot;<br>
&gt; &gt;=C2=A0 <br>
&gt; &gt;=C2=A0 RDEPENDS:${PN}-build =3D &quot;bash perl python3-core&quot;=
<br>
&gt; &gt; +RDEPENDS:nativesdk-rpm +=3D &quot;nativesdk-file&quot;<br>
&gt; <br>
&gt; Should we be adding file to ${PN}-build instead?=C2=A0 Which rpm comma=
nd <br>
&gt; was this with? Does anywhere else in rpm have/need this dependency?<br=
>
<br>
To answer my question, the problem is that as well as the rpm wrappers, the=
 code also sets MAGIC=3D from an environment setup file.<br>
<br>
At the very least, the RDEPENDS needs a class-nativesdk override in there a=
s otherwise it is floating around unconditionally.<br>
<br>
I don&#39;t really like adding workarounds like this since we won&#39;t und=
erstand them at some future date.<br>
<br>
Other solutions might include:<br>
<br>
a) patching RPM to use RPM_FILEMAGIC instead of MAGIC so we can set it in a=
 more granular way<br>
b) moving the environment setup piece for MAGIC to nativesdk-file so it is =
only used if file is installed in the SDK<br>
c) fixing rpm (or file?) to dynamically relocate the paths it is using<br>
<br>
Can we see if there is a better solution we can switch to please?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000a95aaf05f2611ca4--

