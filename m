Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D230D44D4F
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 11:09:36 +0000 (UTC)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
 by mx.groups.io with SMTP id smtpd.web11.43393.1730891370140122355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 03:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lchBa5RS;
 spf=pass (domain: gmail.com, ip: 209.85.221.173, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-50d32d82bd8so2164117e0c.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 03:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730891369; x=1731496169; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g1kB7iIZ9MNuxdlKvy4awjgk7gGNyhh2OkRaBVnl9RY=;
        b=lchBa5RSSSbGvY2dc6YtMJy5ul6vA6iPmFXoWaye21z1TvMMvUVOHiU1gcFlxhWQ+l
         4T8sxJyaGXXva6mM3zZdlT4vh+NADYPsMHR/0CgJ3X32LY2jdm6OaNNgcTY01Zp8pbXv
         iC/vQTzwuSQswf/8fzbKg+tWKq31fASd/JvDjrUFzW+NeKJYNJu8g/bNgUsu+qHvTRIa
         gWU3YJTCURLqzgaA3BTkbIdTs/wGre1YIsLOo/+eMD8N+meWYDVVXGbz/gL8o+pE7M9E
         KbK94pNdZ+RqYzDiIio+/sTrNfhrZulSlgv6i61ZpZJXV+KVrbXkQBuRgwNaw5fkuRJj
         9qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730891369; x=1731496169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1kB7iIZ9MNuxdlKvy4awjgk7gGNyhh2OkRaBVnl9RY=;
        b=pGR5aI4eoeGjUSl/3GoX8txd167NL11L2ANQVymZdJSLOTQ78r5HSu0mgT+HnSordt
         wdjrC4TB6+vIIGhuspY6y9JR8erC+wNFVBAnyn1yRXJ3Wkor3+cz4uaD0IoZu8KDF6Lq
         vdE7nYfQxQ0P0OQTapHcCW3VFuvwzMB+8yhebyzfLeucCFd+AOFWq+BuQSmDIsU5/Lgx
         frtUW1SG8tuMGur4DOdYqyJCtMWZBCwLe2kIqcXUpClOU/5OsqF3R8DIErImvSbfIkU5
         BREfKctTbSfqHJDOuPbyCBDye233wJR+mwuegJ1btvvZQyuMzFL+zWtr/LPswK+5i7SQ
         VnJQ==
X-Gm-Message-State: AOJu0YwgandEzTI0qD0AO8pdUsH6VRehv2K2jTPSSNV4urQEKaeoxID1
	ludXxvCIwAdHzHM2Y1ekYig/iq0VeFDx8qqi6xOcS39uteGbQTJWaBd60xrY8ES9RKVhNFschfi
	Ubf4OGmHjWMNWVAdX44/WQ32CGH8=
X-Google-Smtp-Source: AGHT+IFdmS5QxbCfBPozC89bMYnFiIuLZtmCTAcsolT0Ea4Kz3wjnU73XX8RnYtwF1j/8PawfteuAvvYudSuWGwxGe4=
X-Received: by 2002:a05:6102:1627:b0:4a4:8d64:74bd with SMTP id
 ada2fe7eead31-4a954259b7bmr22208342137.4.1730891369114; Wed, 06 Nov 2024
 03:09:29 -0800 (PST)
MIME-Version: 1.0
References: <20241030181725.214754-1-jose.quaresma@foundries.io>
 <18034DD8CF292769.12341@lists.openembedded.org> <CANPvuRkm06vDmUuFieQLGUo+brfZh+BUo3AzKOQH-JHCCVXxVQ@mail.gmail.com>
 <5058dcd07acb650e0add0d5d828d77c996fc509a.camel@linuxfoundation.org>
 <CANPvuR=yRLzEK6G1RGQjMBOipkNiVWxWNyCMfpvtwOE-aDJhPA@mail.gmail.com> <7814ec4f59c97b31d8bc974de9b117b8fce5c843.camel@linuxfoundation.org>
In-Reply-To: <7814ec4f59c97b31d8bc974de9b117b8fce5c843.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 6 Nov 2024 11:09:18 +0000
Message-ID: <CANPvuRkJdpP1aCNMjWqNKFUxL_rhJCTqu055DqxxvMzBN5dmTw@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH 2/2] go-runtime: fixme: buildpaths
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000033750606263c8d37"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 11:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206764

--00000000000033750606263c8d37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (sexta,
1/11/2024 =C3=A0(s) 22:45):

> On Thu, 2024-10-31 at 12:12 +0000, Jose Quaresma wrote:
> >
> >
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quarta,
> > 30/10/2024 =C3=A0(s) 19:40):
> > > On Wed, 2024-10-30 at 18:19 +0000, Jose Quaresma via
> > > lists.openembedded.org wrote:
> > > >
> > > >
> > > > Jose Quaresma via lists.openembedded.org
> > > > <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu
> > > > (quarta,
> > > > 30/10/2024 =C3=A0(s) 18:18):
> > > > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > > > > ---
> > > > >  meta/recipes-devtools/go/go-runtime_1.23.0.bb | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > > > > b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > > > > index 63464a1501..a9a4e2a044 100644
> > > > > --- a/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > > > > +++ b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > > > > @@ -1,3 +1,4 @@
> > > > >  require go-${PV}.inc
> > > > >  require go-runtime.inc
> > > > >
> > > > > +INSANE_SKIP:${PN} +=3D "buildpaths"
> > > > >
> > > >
> > > >
> > > > Send this as RFC mostly because of this.
> > >
> > > That suggests it will fail the reproducibility tests too :(
> > >
> > > We're going to have to address those issues really. I guess the
> > > patch
> > > gives us something to start with and collaborate around...
> > >
> > > Cheers,
> > >
> > > Richard
> >
> > I would like to finish this update but I have been very busy at the
> > moment
> > and I don't know when I will be able to get back to it.
>
> FWIW, adding a -trimpath to the go_bootstrap line in do_compile in go-
> runtime does remove a lot of the paths. It leaves one single path
> reference in libstd.so in the .rodata section, I think corresponding to
> GOROOT. I couldn't work that one out though.
>
> Cheers,
>
> Richard
>
>
Thanks for the hint
I will test this as soon as I can.

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000033750606263c8d37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu (sexta, 1/11/2024 =C3=A0(s) 22:45):<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, 2024-10-31 at 12:12 +0000, Jose Qu=
aresma wrote:<br>
&gt; <br>
&gt; <br>
&gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu (q=
uarta,<br>
&gt; 30/10/2024 =C3=A0(s) 19:40):<br>
&gt; &gt; On Wed, 2024-10-30 at 18:19 +0000, Jose Quaresma via<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targ=
et=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt; &gt; &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openem=
bedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; escr=
eveu<br>
&gt; &gt; &gt; (quarta,<br>
&gt; &gt; &gt; 30/10/2024 =C3=A0(s) 18:18):<br>
&gt; &gt; &gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose=
.quaresma@foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt=
;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt; =C2=A0meta/recipes-devtools/go/<a href=3D"http://go-run=
time_1.23.0.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</=
a> | 1 +<br>
&gt; &gt; &gt; &gt; =C2=A01 file changed, 1 insertion(+)<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http:/=
/go-runtime_1.23.0.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.23=
.0.bb</a><br>
&gt; &gt; &gt; &gt; b/meta/recipes-devtools/go/<a href=3D"http://go-runtime=
_1.23.0.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</a><b=
r>
&gt; &gt; &gt; &gt; index 63464a1501..a9a4e2a044 100644<br>
&gt; &gt; &gt; &gt; --- a/meta/recipes-devtools/go/<a href=3D"http://go-run=
time_1.23.0.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</=
a><br>
&gt; &gt; &gt; &gt; +++ b/meta/recipes-devtools/go/<a href=3D"http://go-run=
time_1.23.0.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</=
a><br>
&gt; &gt; &gt; &gt; @@ -1,3 +1,4 @@<br>
&gt; &gt; &gt; &gt; =C2=A0require go-${PV}.inc<br>
&gt; &gt; &gt; &gt; =C2=A0require go-runtime.inc<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; &gt; +INSANE_SKIP:${PN} +=3D &quot;buildpaths&quot;<br>
&gt; &gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Send this as RFC mostly because of this.<br>
&gt; &gt; <br>
&gt; &gt; That suggests it will fail the reproducibility tests too :(<br>
&gt; &gt; <br>
&gt; &gt; We&#39;re going to have to address those issues really. I guess t=
he<br>
&gt; &gt; patch<br>
&gt; &gt; gives us something to start with and collaborate around...<br>
&gt; &gt; <br>
&gt; &gt; Cheers,<br>
&gt; &gt; <br>
&gt; &gt; Richard<br>
&gt; <br>
&gt; I would like to finish this update but I have been very busy at the<br=
>
&gt; moment<br>
&gt; and I don&#39;t know when I will be able to get back to it.<br>
<br>
FWIW, adding a -trimpath to the go_bootstrap line in do_compile in go-<br>
runtime does remove a lot of the paths. It leaves one single path<br>
reference in libstd.so in the .rodata section, I think corresponding to<br>
GOROOT. I couldn&#39;t work that one out though.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br></blockquote><div><br></div><div>Thanks for the hint=C2=A0</div></div>I=
 will test this as soon as I can.<br clear=3D"all"><div><br></div><span cla=
ss=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div>=
</div></div></div>

--00000000000033750606263c8d37--

