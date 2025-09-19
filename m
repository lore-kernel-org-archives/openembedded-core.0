Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C91DCAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 12:42:17 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.15381.1758285732270579985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 05:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YCd88Zis;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7761578340dso2766463b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 05:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758285732; x=1758890532; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UlAcNeMiRQWxDIFugRgQSUzCrfIKPU9wMWkyundjn8s=;
        b=YCd88Zisv6ikQaPSGa6TeXCK+Xo/LKr8puWx1aGqfurmoNSbs9lKLYZ4SuXHJk+fRU
         W4n4bBQM/cCJxRyQ6MQul4l2Q35jJC7dwB4PWtqeusPSNUqAeH0VCvqHQ9oRBczWP7IW
         dvooK7s/JPMll9NgLOOt4+vaZ8flNHCj6cy6ay3IBdraUO5IjX0luHn3AKRMXlB4Q7XG
         +8ol4jKC4ghtKt7biujjdAJMe8579UqXhAme8Qh77KMsuuEcApmDVuvJ5WZIxq2sLk7O
         IVUofobeiHVwyKewxldG/5ifUITgOZw916uxYG0NmVDu8Oq2P9dilGhG24hHacXIoK35
         Rmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758285732; x=1758890532;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlAcNeMiRQWxDIFugRgQSUzCrfIKPU9wMWkyundjn8s=;
        b=CK71MHBdU0h2mT4mfEZ9c0zNg1ZsVWvzGVFLazyKGbNu5WmUoedBykpYqvkc2rw+iM
         LGbS0Yc8SSzrDNRtTzXq56PhVLLHjyWgn9Yt/K+4V3BuxVwoUHz+Ic6Dyhw1uWkEzOzA
         jGrO19f7hBpwBbN60yFRr8+Q21be+gNpB4r4FtWlAoC1vHQDF1ltu+Ygg0tA6jVUw4Ty
         8lxe6kyNjAkZM7vSJxsrrlXc7EM00genpVuYKswgpRW8YtFPNlpXlkfjdnSdE8HqQYxj
         3sPqwltk4HGYOOwXGPD3b8VL8iyO9lIddsc4bagwJK25TRClduKgP0sTNktbQ7qtEGCm
         MKpQ==
X-Gm-Message-State: AOJu0Yy+edszhITDeji6ZzDZDfN9PYfnjmB5URGYSJ0A0Nww0qkzpztC
	nM4e4dXzdOUivaKtfI2GSn8rFTmmceIutujPtr9fM7ZXrGQJUqb6klYWQSK2Qe27QPKAIffd/Jj
	qG1qx5c3eMKEaLM9tmNaw+UkeQvfv/g8=
X-Gm-Gg: ASbGncsXx3650EITr3D8hbwC57HY7i31aa3fJE9d3rAcJ6XjH7jFEsjXaBIE1Hs8Ufj
	YgF/v/PE7CpEJD1kP9sejAET5m6DgNPryUxH6ffKYWOqKL4vSpvBqLycYgfxjDETDZFiAbk/exA
	qr17+82lnGp9nRrRk2X8bMCuIe4GTWmylb/UTXdL3Z9r+BRDvocPpgxMvOKxqHRiL8JXO3R92lp
	+XsubJ7SHJ19IOpVK3OFOBxvvLnRA8h1GxjxTxw
X-Google-Smtp-Source: AGHT+IHMT7hLzazavZNj00K9NRuZPUBKWZox/TICGJCSv4oznjby5qwK/FasBSy+XGCcdlB84dLx2L21y6FJHmcg7yU=
X-Received: by 2002:a05:6a21:32a3:b0:250:1407:509e with SMTP id
 adf61e73a8af0-29277cb8cb1mr4954278637.53.1758285731512; Fri, 19 Sep 2025
 05:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
 <0074b1cd80c242493c1e50d9ff58cc4427272a50.1757088383.git.bruce.ashfield@gmail.com>
 <AS1PR10MB5697E637960455A217026DBBFD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697E637960455A217026DBBFD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 19 Sep 2025 08:41:59 -0400
X-Gm-Features: AS18NWBATmDg4MpcL8us2Jt6XF6xYAfnLTUz7rfw8KELyjgikMcFQMuhQe_Ri9c
Message-ID: <CADkTA4Ps=71__P=x+fVto=8=Ojzp=pgMvFPdgkt7HQiBgujXcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] poky: bump default kernel reference to 6.16
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000070c836063f26cc5b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 12:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223742

--00000000000070c836063f26cc5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 8:35=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> Hello Bruce,
>
> This upgrade broke build of external kernel modules for powerpc.
> Yocto test devtool.DevtoolTest.test_devtool_kernelmodule is failing.
>
> We have prepared a patch for upstream kernel.
>
> https://lore.kernel.org/all/20250919121417.1601020-1-alexander.sverdlin@s=
iemens.com/
> But I guess it will take lot of time to get picked there, then backported
> to 6.16, tagged and finally this tag picked by yocto.
> Is there a process to pick this patch already now to keep the pipeline
> green?
>

Yes, if you submit it to the linux-yocto mailing list (you need to
subscribe), I can
merge it directly to linux-yocto and send a SRCREV bump to the list.

I'll carry the patch to any newer kernel that I do, until it merges
upstream and
I'll automatically drop it at that point.

Bruce



> Peter
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Bruce Ashfield via
> > lists.openembedded.org
> > Sent: Friday, September 5, 2025 18:09
> > To: richard.purdie@linuxfoundation.org
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 1/5] poky: bump default kernel reference to
> 6.16
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Bumping the reference kernel to 6.16. We keep the alt distro
> > on 6.12 for better coverage.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta-poky/conf/distro/poky-tiny.conf | 2 +-
> >  meta-poky/conf/distro/poky.conf      | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-poky/conf/distro/poky-tiny.conf
> b/meta-poky/conf/distro/poky-
> > tiny.conf
> > index 81153b3b36..84baef347c 100644
> > --- a/meta-poky/conf/distro/poky-tiny.conf
> > +++ b/meta-poky/conf/distro/poky-tiny.conf
> > @@ -41,7 +41,7 @@ FULL_OPTIMIZATION =3D "-Os"
> >  # Distro config is evaluated after the machine config, so we have to
> explicitly
> >  # set the kernel provider to override a machine config.
> >  PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto-tiny"
> > -PREFERRED_VERSION_linux-yocto-tiny ?=3D "6.12%"
> > +PREFERRED_VERSION_linux-yocto-tiny ?=3D "6.16%"
> >
> >  # We can use packagegroup-core-boot, but in the future we may need a n=
ew
> > packagegroup-core-tiny
> >  #POKY_DEFAULT_EXTRA_RDEPENDS +=3D "packagegroup-core-boot"
> > diff --git a/meta-poky/conf/distro/poky.conf
> b/meta-poky/conf/distro/poky.conf
> > index b12df2be70..d86630b153 100644
> > --- a/meta-poky/conf/distro/poky.conf
> > +++ b/meta-poky/conf/distro/poky.conf
> > @@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS =3D "kernel-
> > module-af-packet"
> >
> >  DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT}
> > ${POKY_DEFAULT_DISTRO_FEATURES}"
> >
> > -PREFERRED_VERSION_linux-yocto ?=3D "6.12%"
> > -PREFERRED_VERSION_linux-yocto-rt ?=3D "6.12%"
> > +PREFERRED_VERSION_linux-yocto ?=3D "6.16%"
> > +PREFERRED_VERSION_linux-yocto-rt ?=3D "6.16%"
> >
> >  SDK_NAME =3D "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-
> > ${TUNE_PKGARCH}-${MACHINE}"
> >  SDKPATHINSTALL =3D "/opt/${DISTRO}/${SDK_VERSION}"
> > --
> > 2.39.2
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000070c836063f26cc5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 19, 2025 at 8:35=
=E2=80=AFAM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.com">Pet=
er.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hello Bruce,<br>
<br>
This upgrade broke build of external kernel modules for powerpc.<br>
Yocto test devtool.DevtoolTest.test_devtool_kernelmodule is failing.<br>
<br>
We have prepared a patch for upstream kernel.<br>
<a href=3D"https://lore.kernel.org/all/20250919121417.1601020-1-alexander.s=
verdlin@siemens.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.ker=
nel.org/all/20250919121417.1601020-1-alexander.sverdlin@siemens.com/</a><br=
>
But I guess it will take lot of time to get picked there, then backported t=
o 6.16, tagged and finally this tag picked by yocto.<br>
Is there a process to pick this patch already now to keep the pipeline gree=
n?<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=
=3D"font-size:small">Yes, if you submit=C2=A0it to the linux-yocto mailing =
list (you need to subscribe), I can</div><div class=3D"gmail_default" style=
=3D"font-size:small">merge it directly to linux-yocto and send a SRCREV bum=
p to the list.</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll c=
arry the patch to any newer kernel that I do, until it merges upstream and<=
/div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll automa=
tically drop it at that point.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Bruce</div><br></div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Bruce Ashfield via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; Sent: Friday, September 5, 2025 18:09<br>
&gt; To: <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a><br>
&gt; Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: [OE-core] [PATCH 1/5] poky: bump default kernel reference to =
6.16<br>
&gt; <br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Bumping the reference kernel to 6.16. We keep the alt distro<br>
&gt; on 6.12 for better coverage.<br>
&gt; <br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-poky/conf/distro/poky-tiny.conf | 2 +-<br>
&gt;=C2=A0 meta-poky/conf/distro/poky.conf=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/dis=
tro/poky-<br>
&gt; tiny.conf<br>
&gt; index 81153b3b36..84baef347c 100644<br>
&gt; --- a/meta-poky/conf/distro/poky-tiny.conf<br>
&gt; +++ b/meta-poky/conf/distro/poky-tiny.conf<br>
&gt; @@ -41,7 +41,7 @@ FULL_OPTIMIZATION =3D &quot;-Os&quot;<br>
&gt;=C2=A0 # Distro config is evaluated after the machine config, so we hav=
e to explicitly<br>
&gt;=C2=A0 # set the kernel provider to override a machine config.<br>
&gt;=C2=A0 PREFERRED_PROVIDER_virtual/kernel =3D &quot;linux-yocto-tiny&quo=
t;<br>
&gt; -PREFERRED_VERSION_linux-yocto-tiny ?=3D &quot;6.12%&quot;<br>
&gt; +PREFERRED_VERSION_linux-yocto-tiny ?=3D &quot;6.16%&quot;<br>
&gt; <br>
&gt;=C2=A0 # We can use packagegroup-core-boot, but in the future we may ne=
ed a new<br>
&gt; packagegroup-core-tiny<br>
&gt;=C2=A0 #POKY_DEFAULT_EXTRA_RDEPENDS +=3D &quot;packagegroup-core-boot&q=
uot;<br>
&gt; diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/p=
oky.conf<br>
&gt; index b12df2be70..d86630b153 100644<br>
&gt; --- a/meta-poky/conf/distro/poky.conf<br>
&gt; +++ b/meta-poky/conf/distro/poky.conf<br>
&gt; @@ -19,8 +19,8 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS =3D &quot;kernel-<br>
&gt; module-af-packet&quot;<br>
&gt; <br>
&gt;=C2=A0 DISTRO_FEATURES ?=3D &quot;${DISTRO_FEATURES_DEFAULT}<br>
&gt; ${POKY_DEFAULT_DISTRO_FEATURES}&quot;<br>
&gt; <br>
&gt; -PREFERRED_VERSION_linux-yocto ?=3D &quot;6.12%&quot;<br>
&gt; -PREFERRED_VERSION_linux-yocto-rt ?=3D &quot;6.12%&quot;<br>
&gt; +PREFERRED_VERSION_linux-yocto ?=3D &quot;6.16%&quot;<br>
&gt; +PREFERRED_VERSION_linux-yocto-rt ?=3D &quot;6.16%&quot;<br>
&gt; <br>
&gt;=C2=A0 SDK_NAME =3D &quot;${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BAS=
ENAME}-<br>
&gt; ${TUNE_PKGARCH}-${MACHINE}&quot;<br>
&gt;=C2=A0 SDKPATHINSTALL =3D &quot;/opt/${DISTRO}/${SDK_VERSION}&quot;<br>
&gt; --<br>
&gt; 2.39.2<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000070c836063f26cc5b--

