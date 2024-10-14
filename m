Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E610D16275
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 14:14:37 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.56155.1728915268791688348
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 07:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TXngs6La;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb470a8b27so13062061fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 07:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728915267; x=1729520067; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FnWShxeAmZZG+5wab171GFoqjn1dy+TWIyHOghnZQAw=;
        b=TXngs6La/qqnr2VNT32UZz3E6GpfifNtSKl+mgK3gxO5UjzhgLq1cK0M1XhuHRxtPW
         PDJTRsZrud5VUh066AsJWnGio+wKG2pIPV8IaLDvKiqhrXCUb78QInXRfJ8sKbdgZ6+0
         LS07SoXJwOWJV2wlcrRVp0yWizYQHUo0mOy3f74LTb3OQG3v83yB/Q0l1S4zEy/brzTq
         l+/c1Rj/T5LI3CZ4yqKlsObljdxcUua67nhuDsY0sNDk/FUGr+1hF9Fe0mmWZ6mHYyry
         ZY7V8V0qwHuX7c2Af8DPRJ+vtktnp7EKJFdqUj8zTkUl05FfUBV4L+ybd1QOsg6F/4zG
         w+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728915267; x=1729520067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FnWShxeAmZZG+5wab171GFoqjn1dy+TWIyHOghnZQAw=;
        b=u2eaa3ErtmzEfYk07pnrml/nmSlt46D4+Qewg+kr6SQug6xvgz8pBWK9TQrROq0D4u
         dQqdlnI8dzKnps7x1sjaubfTxZ2uXx+3CWY419qbX4jCtwR38noVu6L3iz4RivbDbIi/
         VzXLMeRShX4Idp32OkP3PKC75PGdspwiuA7/axTmP4/b3Fovn7FJe1IPrqMkXccSu7OH
         V4k+yfm41UukPqZkOd3t5QOjmQLbh9SIsD0qC+lu8yUlOSj2702+sPnnBy1TrLze+wVi
         x3K8w/PnbnGxWv8LwjHtpeVUgSQBt8Hrjc26GS4M6mTHwAC25gVUdTh+zWDgazcZ/3+k
         gHJA==
X-Forwarded-Encrypted: i=1; AJvYcCW/LZ+4oGa/K/wn5cUjDEQ2F58AdVU5WfGM/DKmI2TShurkEpwPfk3a2JUa/N3Yi3bu/7Tkw5k2eUsA+ld9xo3oHA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyAX/C0wx+F/hnqJmjwfEJ53npGf/O+MEUmLHmVOfuVLyCOh8SI
	tbrlVeJZVglcAucf74GX+gIW5ZBqQ44qKCV9K4e/ucc/zMMPCnl5BhmI/SMrJKB7gn6e1CyLJSh
	qt3dO0y8scbzyGHDhMg/NqLEeLws=
X-Google-Smtp-Source: AGHT+IFNpbdgq8pnZoAAIzqEJoSpWMIowCtDbj4HUoSAAeMBYIGkY5nDfnmRT+lwfOBTH9AoRgI4Xr10A3UocPO5ko0=
X-Received: by 2002:a2e:bd85:0:b0:2fb:4da8:1e6a with SMTP id
 38308e7fff4ca-2fb4da8310amr15514841fa.7.1728915266377; Mon, 14 Oct 2024
 07:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241010205033.159589-2-t.f.g.geelen@gmail.com>
 <CANNYZj-NujKn-r+j_KgGs4PRCAxUY5Z1v=gU_hx8fg1hBa+KSw@mail.gmail.com>
 <CAJo0Az5a=-diCyNyAC14Ef6JTS4auzcSO2NQnaiYG1k3WpCw0g@mail.gmail.com>
 <CANNYZj_w+Ba7mhS4Jd=LaiVPZse0+pqGL3KSFN1uyHXTmuEkRg@mail.gmail.com>
 <CANx9H-CksfTYqbSbiirRT0cWeDy9sOPJgrA_s66Oj52d6Q44Yw@mail.gmail.com>
 <3d120a63-7fbf-43fc-8f44-5ad50ab1a061@smile.fr> <CANx9H-Bi0CKSMdH9fsQ8hAzabuyk2bX3hm3ZqUoPdmuupLeK_A@mail.gmail.com>
 <CAJo0Az6nDT-av_8HuudUt5Ob5ga7+=Qofaaa2Z2RTjKpsC1T+w@mail.gmail.com>
 <3831edba-2e59-48a8-9186-52c5a4081fd1@smile.fr> <CANx9H-C3W5A=gQWR=x7GS4OuS1m9qB6tv7H3s+GMD1Lj25g89Q@mail.gmail.com>
 <CANNYZj_tzSQ5a-CrBCka9ARa7ou2mudPfW4j3wOjbX0Pypmn4A@mail.gmail.com>
 <b0778cf2-cb73-4f29-bd6c-474f23639844@smile.fr> <CANNYZj8F7rS1aFF0Zzsf3W-CqH4COk5cVMamcxy=04uTLwYsOg@mail.gmail.com>
In-Reply-To: <CANNYZj8F7rS1aFF0Zzsf3W-CqH4COk5cVMamcxy=04uTLwYsOg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 14 Oct 2024 07:14:15 -0700
Message-ID: <CANx9H-D6i6jX1hOw5F6Y-8t0jYDu_M4yfYWxDgGD74z2WKyoyQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCH v2] python3-cryptography: upgrade 42.0.8
 -> 43.0.1 -> reproducibility doc improvement
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, Tom Geelen <t.f.g.geelen@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004ca0bb062470744a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 14:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205780

--0000000000004ca0bb062470744a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 4:33=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Mon, 14 Oct 2024 at 13:22, Yoann Congal <yoann.congal@smile.fr> wrote:
> > > 1) Maturin creates a .whl (zip archive) where files are listed in a
> > > non-deterministic order in the archive index. I'm not 100% sure if
> > > your patch addresses this problem - does it? Are the files supplied t=
o
> > > the zip writer in sorted order?
> >
> > We did not address this point with the patch, if that is fixed, its a
> > welcomed unintended side-effect.
>
> If you do submit upstream, then confirm that first please. I think
> it's still a worthy fix, as there can be use cases for installing .whl
> into target images.


We actually did address the zip file (.whl) ordering as well, in the later
part of that patch. The git commit log needs to be reworded to highlight
that. We should also sanity check that it is doing what we expect with the
.whl

>
>
> > Awesome, then the python3-cryptography 43.0.1 upgrade should be merged
> > after your patch?


It still has ptest issues in the most recent version from Tom. See my
branch for outstanding issues (including RDEPENDS issue in
python3-pytest-subtests).

>
>
> Something like that, yes. I've developed that in a broader effort to
> update python to 3.13 (contained in the same branch as the above
> installer fix), as existing cryptography version fails to build with
> 3.13.
>
> If you have a bit of time to help, these are the meta-oe fails:
>
> https://valkyrie.yoctoproject.org//#/builders/81/builds/42/steps/14/logs/=
stdio
>
> (package_qa stuff is unrelated, so 12 hard recipe fails)
>
> Alex
>

--0000000000004ca0bb062470744a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 14, 2024 at 4:33=E2=80=AFAM Alexander Kanavin &=
lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)">On Mon, 14 Oct 2024 at 13:22, Yoann Conga=
l &lt;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.cong=
al@smile.fr</a>&gt; wrote:<br>
&gt; &gt; 1) Maturin creates a .whl (zip archive) where files are listed in=
 a<br>
&gt; &gt; non-deterministic order in the archive index. I&#39;m not 100% su=
re if<br>
&gt; &gt; your patch addresses this problem - does it? Are the files suppli=
ed to<br>
&gt; &gt; the zip writer in sorted order?<br>
&gt;<br>
&gt; We did not address this point with the patch, if that is fixed, its a<=
br>
&gt; welcomed unintended side-effect.<br>
<br>
If you do submit upstream, then confirm that first please. I think<br>
it&#39;s still a worthy fix, as there can be use cases for installing .whl<=
br>
into target images.</blockquote><div dir=3D"auto"><br></div><div dir=3D"aut=
o">We actually did address the zip file (.whl) ordering as well, in the lat=
er part of that patch. The git commit log needs to be reworded to highlight=
 that. We should also sanity check that it is doing what we expect with the=
 .whl</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-l=
eft-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
&gt; Awesome, then the python3-cryptography 43.0.1 upgrade should be merged=
<br>
&gt; after your patch?</blockquote><div dir=3D"auto"><br></div><div dir=3D"=
auto">It still has ptest issues in the most recent version from Tom. See my=
 branch for outstanding issues (including RDEPENDS issue in python3-pytest-=
subtests).</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bor=
der-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
Something like that, yes. I&#39;ve developed that in a broader effort to<br=
>
update python to 3.13 (contained in the same branch as the above<br>
installer fix), as existing cryptography version fails to build with<br>
3.13.<br>
<br>
If you have a bit of time to help, these are the meta-oe fails:<br>
<a href=3D"https://valkyrie.yoctoproject.org//#/builders/81/builds/42/steps=
/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.yocto=
project.org//#/builders/81/builds/42/steps/14/logs/stdio</a><br>
<br>
(package_qa stuff is unrelated, so 12 hard recipe fails)<br>
<br>
Alex<br>
</blockquote></div></div>

--0000000000004ca0bb062470744a--

