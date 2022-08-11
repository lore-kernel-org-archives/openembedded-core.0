Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5548EC19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 17:26:50 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.605.1660238808292113468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 10:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=o4LwAMp+;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.182,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f182.google.com with SMTP id cb8so1218586qtb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 10:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc;
        bh=fZm5vZdb2vjFaST63wYmKw+KpGt7R8xfe2gX9eXFM+s=;
        b=o4LwAMp+oxL3Y+0otnQYsvtG6+pYNyHviL8/BB5EESJPufy84uhadQnw0a8AR6jTkq
         b+BInWECSIdO9KuiCl3wibHRJhnL68ENIx2QvUGVNTzVWer1OF+3Sl8wllYQSYp8Jq/Q
         mNMMfphd7l4lODxm8q3sgvjV2IuOhuqiC9ZSAL7cXmHU92TEfqAdCIeQ8i5yUINR1Iqo
         T12ad9Dp4rIW2DXKnCL4Qrs/gwG2V0b/IDFlLE+T1TAj2nFqygi+dudmlywZRv7Gz/0t
         AK8TNxIAPGnWJom0iebx4IXnL7JSMk0r1lljTgtcCC6JtdKrieBcApCx5PEd6lTvULNO
         EKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc;
        bh=fZm5vZdb2vjFaST63wYmKw+KpGt7R8xfe2gX9eXFM+s=;
        b=1NSd3h9QmRuQqnsR9S3euJ8Gzs+A+kUOIWhdV5S/mikIDsNWoXJTg1u0ZHoIC1pkDk
         3vu1UXsOYNYXD/zKIHtNQ07oieokX6NxuzbLEYARIzmmPaLjJbcSiQw++dFstn+wpIUx
         SeTBRzh5EAoxty3uz3boccnamMvs6YuKG713erkutmEyXqLALm/11nlpm1yTxLgBtrKl
         JY1/WMSkt7EnA6M8YdKhPAadpxC/OTx3i4zHHLEt1B24+DpraStP0FSRpir54+lumF9U
         MhizgZaUtACUMZ9O0VRCjNzbct67tVtaBwBDUcMEv0CRTeXny6/KaCSVHeS6yUYcvZ8D
         Xv9A==
X-Gm-Message-State: ACgBeo3BpUvlrOT+VOPiSmdBci6zGo+uhq5GJ4KmZFX+W2aCxHnsteyz
	cHm8h8+HePY70iM96FcnKfYWPhL+yB16eTi1
X-Google-Smtp-Source: 
 AA6agR7vVdvXJNcFHd8KJzEZhiGK+nYNjobfdz6tiC87M9fkBmzrRkqHJGSqrCneAuCH9VQgkJ+OcA==
X-Received: by 2002:ac8:5fc2:0:b0:343:202:7f46 with SMTP id
 k2-20020ac85fc2000000b0034302027f46mr161167qta.418.1660238807025;
        Thu, 11 Aug 2022 10:26:47 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com.
 [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id
 f4-20020a05620a280400b006aedb35d8a1sm2409179qkp.74.2022.08.11.10.26.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 10:26:46 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f52.google.com with SMTP id mk9so13789768qvb.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 10:26:46 -0700 (PDT)
X-Received: by 2002:ad4:5dc7:0:b0:476:a281:5335 with SMTP id
 m7-20020ad45dc7000000b00476a2815335mr185048qvh.1.1660238806299; Thu, 11 Aug
 2022 10:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220811161757.278819-1-jose.quaresma@foundries.io>
 <CADkTA4PaFdRpyxko=bpRQ5CVoAVgD8g8Nt4SMW_0USAYme3RkQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PaFdRpyxko=bpRQ5CVoAVgD8g8Nt4SMW_0USAYme3RkQ@mail.gmail.com>
Date: Thu, 11 Aug 2022 14:26:35 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKq_4LrFG79_v36ez+9wUrqaALcL_q1rfAg0fD1micghLg@mail.gmail.com>
Message-ID: 
 <CAP9ODKq_4LrFG79_v36ez+9wUrqaALcL_q1rfAg0fD1micghLg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] module.bbclass: rebuild the modules when kernel
 change
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, ricardo@foundries.io,
	daiane.angolini@foundries.io, Otavio Salvador <otavio@ossystems.com.br>,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000004abc6405e5fa78e7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 17:26:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169261

--0000000000004abc6405e5fa78e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 11 de ago. de 2022 =C3=A0s 14:06, Bruce Ashfield <
bruce.ashfield@gmail.com> escreveu:

> On Thu, Aug 11, 2022 at 12:18 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > When the kernel is rebuild or some of they tasks change the
> > kernel modules is not rebuild as well and will comes from
> > the sstate-cache.
> >
> > [YOCTO #14885] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1488=
5
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/classes/module.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> > index a09ec3ed1e..d377a08bc6 100644
> > --- a/meta/classes/module.bbclass
> > +++ b/meta/classes/module.bbclass
> > @@ -1,5 +1,7 @@
> >  inherit module-base kernel-module-split pkgconfig
> >
> > +DEPENDS +=3D "virtual/kernel"
>
> There's already a dependency on virtual/kernel:do_shared_workdir() throug=
h
> module-base.bbclass and the make-mod-scripts dependency.
>
> And that dependency was a change to this:
>
> -# This is instead of DEPENDS =3D "virtual/kernel"
> -do_configure[depends] +=3D "virtual/kernel:do_compile_kernelmodules"
>
> i.e. we've always had a finer grained dependency than what is being
> proposed here.
>
> We need to understand why that shared_workdir() dependency isn't
> doing the job any more, and if there's no way to fix it .. then going bac=
k
> to the older compile dependency is still lighter weight than depending
> on virtual/kernel (and the default of do_prepare_recipe_sysroot).
>
> It must (could?) be something with the shared workdir changing the
> interactions.
>

Good catch; this really seems strange.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000004abc6405e5fa78e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qui., 11 de ago. de 2022 =C3=A0s 1=
4:06, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.=
ashfield@gmail.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Thu, Aug 11, 2022 at 12:18 PM Jose Quaresma &lt;<a =
href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gma=
il.com</a>&gt; wrote:<br>
&gt;<br>
&gt; When the kernel is rebuild or some of they tasks change the<br>
&gt; kernel modules is not rebuild as well and will comes from<br>
&gt; the sstate-cache.<br>
&gt;<br>
&gt; [YOCTO #14885] <a href=3D"https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D14885" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctop=
roject.org/show_bug.cgi?id=3D14885</a><br>
&gt;<br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/module.bbclass | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass=
<br>
&gt; index a09ec3ed1e..d377a08bc6 100644<br>
&gt; --- a/meta/classes/module.bbclass<br>
&gt; +++ b/meta/classes/module.bbclass<br>
&gt; @@ -1,5 +1,7 @@<br>
&gt;=C2=A0 inherit module-base kernel-module-split pkgconfig<br>
&gt;<br>
&gt; +DEPENDS +=3D &quot;virtual/kernel&quot;<br>
<br>
There&#39;s already a dependency on virtual/kernel:do_shared_workdir() thro=
ugh<br>
module-base.bbclass and the make-mod-scripts dependency.<br>
<br>
And that dependency was a change to this:<br>
<br>
-# This is instead of DEPENDS =3D &quot;virtual/kernel&quot;<br>
-do_configure[depends] +=3D &quot;virtual/kernel:do_compile_kernelmodules&q=
uot;<br>
<br>
i.e. we&#39;ve always had a finer grained dependency than what is being<br>
proposed here.<br>
<br>
We need to understand why that shared_workdir() dependency isn&#39;t<br>
doing the job any more, and if there&#39;s no way to fix it .. then going b=
ack<br>
to the older compile dependency is still lighter weight than depending<br>
on virtual/kernel (and the default of do_prepare_recipe_sysroot).<br>
<br>
It must (could?) be something with the shared workdir changing the interact=
ions.<br></blockquote><div><br></div><div>Good catch; this really seems str=
ange.=C2=A0=C2=A0</div></div><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br=
><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossys=
tems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems=
.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 =
(53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-975=
0</div></div>

--0000000000004abc6405e5fa78e7--

