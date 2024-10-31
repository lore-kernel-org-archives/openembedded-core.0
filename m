Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E75B4D6B6A7
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 12:12:36 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.10824.1730376748121471625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 05:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L0Dj529F;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5ebc349204cso436535eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 05:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730376747; x=1730981547; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FMisH5UCfAT9XtZzhL3beiOYnsdnTQbDmfXosFKnuc8=;
        b=L0Dj529Fg8fr4itRkTIz/Ps99gT9VeMWGI4Y4a3z8y2hpJnjnuEULltGTo2mj1zTEa
         VYsuoToEgDrJB0K2gTgEcmHbP2ENRcwYsktFh1E6xWKjQl77f9UEZYD+HD4Zi1lUn28v
         iejinrqVzFt835Rdoth2Zy5kqf9rxnwlIzGIKG+MtM59RZYFgB4ipKGUrmjMoMyPmr6Q
         FWAmgAarbnbIkLx+BcmISG0O/6xINnFA/aympnTamHE3BMnE0iUH8KTW4dahoqKjnmqX
         kvWiwxsHUz8BZdR6/8bFeU5+mdG5tOdZtcdmb529j2je4e887RI2MmKWNnieiWe1P7QQ
         Zj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730376747; x=1730981547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMisH5UCfAT9XtZzhL3beiOYnsdnTQbDmfXosFKnuc8=;
        b=TdbYU+ZAwQLIzLpGQ/8abVdf6X7SXW0l8W6Kvuyhyi2oH/2Q6BUKG81urTmOFD5ZCa
         d9oac9EbIx/ZcQqIZvpcXkO19noW0g0JVAwXrXs2DhZMu95RWkne5PZVFEBYa97/cFJf
         zCxYRSGrGQwMbPbBB2VeaG3KcYrcWU3aP557cbxi1RQRM7RUQAeBgBlKMYgIW8Jm5huZ
         mFURhqIzQ66/iF8u0dmzGpwpni/yLhPBCOU2HEhAiwjKS7lK7ScGqmNQWPaXCFk/sviZ
         vo0IGvbU3BLxvo+rDvgSiw9RlPJrOSHMzY4xX1Q7GGoU7E6g3UNSB+8bWfxK7SLl7EV1
         JhOQ==
X-Gm-Message-State: AOJu0YyznzPtHHFCIBzjgbWYz+/zeEMy6B/i8cXmEdhQqmoOJLhBH3NH
	m5Qrb8AvvXc5o7NHUmy1GkSjhhvmeqxnvnq8sCAnSTu4EGJVkk5Fn4JAvzWarpiSY/Bnh9pQknN
	B+cj5usW899tg+yadXLqn7DLpxvMzys98ncA=
X-Google-Smtp-Source: AGHT+IGh9K5E1mJM3zG5DKcHFvJB0fvSw5ggT08iFnIL4iFXQzFQnCI1Ue2by8PblKHzh2d5HfHUY+7JlyU8bTg2e2A=
X-Received: by 2002:a05:6359:4123:b0:1bc:583b:a173 with SMTP id
 e5c5f4694b2df-1c3f9ea73bcmr913553855d.10.1730376747324; Thu, 31 Oct 2024
 05:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241030181725.214754-1-jose.quaresma@foundries.io>
 <18034DD8CF292769.12341@lists.openembedded.org> <CANPvuRkm06vDmUuFieQLGUo+brfZh+BUo3AzKOQH-JHCCVXxVQ@mail.gmail.com>
 <5058dcd07acb650e0add0d5d828d77c996fc509a.camel@linuxfoundation.org>
In-Reply-To: <5058dcd07acb650e0add0d5d828d77c996fc509a.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 31 Oct 2024 12:12:16 +0000
Message-ID: <CANPvuR=yRLzEK6G1RGQjMBOipkNiVWxWNyCMfpvtwOE-aDJhPA@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH 2/2] go-runtime: fixme: buildpaths
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="0000000000005a1dee0625c4bb29"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 12:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206581

--0000000000005a1dee0625c4bb29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quarta,
30/10/2024 =C3=A0(s) 19:40):

> On Wed, 2024-10-30 at 18:19 +0000, Jose Quaresma via
> lists.openembedded.org wrote:
> >
> >
> > Jose Quaresma via lists.openembedded.org
> > <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu (quarta,
> > 30/10/2024 =C3=A0(s) 18:18):
> > > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > > ---
> > >  meta/recipes-devtools/go/go-runtime_1.23.0.bb | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > > b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > > index 63464a1501..a9a4e2a044 100644
> > > --- a/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > > +++ b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > > @@ -1,3 +1,4 @@
> > >  require go-${PV}.inc
> > >  require go-runtime.inc
> > >
> > > +INSANE_SKIP:${PN} +=3D "buildpaths"
> > >
> >
> >
> > Send this as RFC mostly because of this.
>
> That suggests it will fail the reproducibility tests too :(
>
> We're going to have to address those issues really. I guess the patch
> gives us something to start with and collaborate around...
>
> Cheers,
>
> Richard
>

I would like to finish this update but I have been very busy at the moment
and I don't know when I will be able to get back to it.

Jose

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000005a1dee0625c4bb29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu (quarta, 30/10/2024 =C3=A0(s) 19:40):<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Wed, 2024-10-30 at 18:19 +0000, Jose =
Quaresma via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; <br>
&gt; <br>
&gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org=
" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; escreveu (quar=
ta,<br>
&gt; 30/10/2024 =C3=A0(s) 18:18):<br>
&gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@=
foundries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.23.=
0.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</a> | 1 +<b=
r>
&gt; &gt; =C2=A01 file changed, 1 insertion(+)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/recipes-devtools/go/<a href=3D"http://go-runtim=
e_1.23.0.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</a><=
br>
&gt; &gt; b/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.23.0.bb=
" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</a><br>
&gt; &gt; index 63464a1501..a9a4e2a044 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.23.=
0.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</a><br>
&gt; &gt; +++ b/meta/recipes-devtools/go/<a href=3D"http://go-runtime_1.23.=
0.bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.23.0.bb</a><br>
&gt; &gt; @@ -1,3 +1,4 @@<br>
&gt; &gt; =C2=A0require go-${PV}.inc<br>
&gt; &gt; =C2=A0require go-runtime.inc<br>
&gt; &gt; <br>
&gt; &gt; +INSANE_SKIP:${PN} +=3D &quot;buildpaths&quot;<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Send this as RFC mostly because of this.<br>
<br>
That suggests it will fail the reproducibility tests too :(<br>
<br>
We&#39;re going to have to address those issues really. I guess the patch<b=
r>
gives us something to start with and collaborate around...<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div>I would like to finish this updat=
e but I have been very busy at the moment</div><div>and I don&#39;t know wh=
en I will be able to get back to it.<br><br>Jose<br><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000005a1dee0625c4bb29--

