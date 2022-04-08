Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF80C352A1
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by mx.groups.io with SMTP id smtpd.web10.432.1649378254540949436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 17:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZjyqlP9S;
 spf=pass (domain: gmail.com, ip: 209.85.222.52,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ua1-f52.google.com with SMTP id y2so328457uaq.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 17:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oJyCmtYPBtinyDWn9i5VOqkfnrIaCv+IuMBoMlIAEPs=;
        b=ZjyqlP9SmKxqBCtfNrGRBIuQUh/EIbVp7w8HzeE7iLDfR1pESAp2skNrwSMTXy9vd8
         oCZ/+wTU7PBYmW6myTGDwAkGD/6Ur1vTFPcbXf8b/CghnEyO4HrEeck8sFLr9vEJF/8Y
         OpU9HMOwsYDkoPuKQSaMOqRTErZInk3TMscxVwleWik2+ZvDc+4yWtsVQ+WKuuFVDFmD
         dJ9lSOp99nFJ8CnkZB3egdVpHbSSTeJWOpd9ejKsnvGPd5nwnfdLcDHarntYC/qDr8MO
         lyhyXKsx5QZucuruN9rI4jpeqgibuRbWth/dzR20VKwfwpuAGfrqROA5Sd9PK/9kLuhO
         uB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oJyCmtYPBtinyDWn9i5VOqkfnrIaCv+IuMBoMlIAEPs=;
        b=AxOhCLfvS8zw4nwbtNjNzwcusg0oy4cWhLF48GBpH5GGSGH4DZe3/lxVi0yI4NSi9T
         9/t9LzMFcTHHbEK3ipUOi5HlMJOjy7exPB6/5CopD2F06Pl61iEQCThpQ4ObrnIjEOQM
         aa9Is9pIQvtPC5cUKfEGEalgktLhowI3CiFrlonZMOmXlf76UfwqRWnTWxaf9s+VLsqn
         xjy0TuOFD6H40Qy21+Q4N1/Tb3HAXk2sOd0nBWXQhmd9dfBlCwyYFopsdnQ4BW7/zpWa
         ylEEdcTg5AYPUo8rT3vlTfs9z4k/Gh+uC2XFLeODw02xBkYPjrQ8o/LQrVua7SEWq16S
         IL4Q==
X-Gm-Message-State: AOAM532p0N4FudZ/rKsvC8SPVVJa9rZY+ncPvAuaTXDOBYsQ6gw7oXe4
	J7wcYbYISgfgYOCK3Qs+FzmIejAWxrA6QaI/a9E=
X-Google-Smtp-Source: 
 ABdhPJwfQkX1ZKXiEUjPHT687Sl338VWUSZ1/ZQjCi47ZGlTBSYBwXu+rNPMtk8VM62f/+xnrTfLn+J639tlXfdfuVw=
X-Received: by 2002:ab0:4ac1:0:b0:351:ed7d:e65c with SMTP id
 t1-20020ab04ac1000000b00351ed7de65cmr4890268uae.36.1649378253616; Thu, 07 Apr
 2022 17:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220317164434.387779-1-ross.burton@arm.com>
 <20220317164434.387779-2-ross.burton@arm.com>
 <16E1E04DCAF22D86.750@lists.openembedded.org>
 <CA+chaQduTDhBx33DP0ChwQ0y+Foqt6Kx5cSZABqvRi3kriMtfA@mail.gmail.com>
 <94115621dac10ec60dbb9e16ffc18688f7e0b32e.camel@linuxfoundation.org>
In-Reply-To: 
 <94115621dac10ec60dbb9e16ffc18688f7e0b32e.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 8 Apr 2022 02:37:20 +0200
Message-ID: 
 <CA+chaQdtP0GigmX+v=UjR+vgWvM8jvBCBDo99gmhbGKnXMBpxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-cryptography: enforce identical
 version for -cryptography-vectors
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alejandro del Castillo <alejandro.delcastillo@ni.com>,
 Alex Stewart <alex.stewart@ni.com>,
	Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e838c705dc19cc1d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164149

--000000000000e838c705dc19cc1d
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 7, 2022 at 11:10 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2022-04-07 at 16:48 +0200, Martin Jansa wrote:
> > I've tried with rpm and surprisingly it works and dnf was able to
> > install python3-cryptography-ptest in the image (even after bumping PR
> to r1 -
> > n python3-cryptography-vectors recipe).
> >
> > But still not clear why it works and if it's expected behavior.
> >
> > In fresh fedora:37 docker image with rpmdevtools installed I see:
> >
> > [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r1
> > 36.0.2-r0 < 36.0.2-r1
> > [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r0
> > 36.0.2-r0 == 36.0.2-r0
> > [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0.0 36.0.2-r0.1
> > 36.0.2-r0.0 < 36.0.2-r0.1
> >
> > But I'm not familiar with dnf/rpm to see how the versioned runtime
> dependency
> > is handled during installation (isn't it resolved by the same libsolv as
> what
> > opkg is using now by default as well?
> >
> > + Alejandro in case it should be fixed in opkg somehow.
>
> I did a bit of digging on this and it is basically a difference in
> behaviour
> between the debian and rpm worlds.
>
> In Debian, "1.2.3" != "1.2.3-r0" but in the rpm world, a recipe saying "(=
> 1.2.3)" with PR=r0 is ok and matches.
>
> We can't obtain the PR of another recipe when writing package manager
> fields so
> this is rather tricky to solve. Debian doesn't support any kind of
> wildcard in
> the versioning either. I've proposed a patch which uses >= and << to force
> a
> very specific range which is horrible but the best I could come up with.
> I'm
> open to other ideas...
>

For this specific case the cure is almost more horrible than the issue this
commit was trying to prevent, but I agree that being able to depend on
version might be useful elsewhere as well and your package*bbclass fix
helps with that.

Thanks for looking into this.

Regards,

--000000000000e838c705dc19cc1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Apr 7, 2022 at 11:10 PM Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 2022-04-07 at 16:=
48 +0200, Martin Jansa wrote:<br>
&gt; I&#39;ve tried with rpm and surprisingly it works and dnf was able to<=
br>
&gt; install=C2=A0python3-cryptography-ptest in the image (even after bumpi=
ng PR to r1 -<br>
&gt; n python3-cryptography-vectors recipe).<br>
&gt; <br>
&gt; But still not clear why it works and if it&#39;s expected behavior.<br=
>
&gt; <br>
&gt; In fresh=C2=A0fedora:37 docker image with=C2=A0rpmdevtools installed I=
 see:<br>
&gt; <br>
&gt; [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r1<br>
&gt; 36.0.2-r0 &lt; 36.0.2-r1<br>
&gt; [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0 36.0.2-r0<br>
&gt; 36.0.2-r0 =3D=3D 36.0.2-r0<br>
&gt; [root@aaa509e35d1f /]# rpmdev-vercmp 36.0.2-r0.0 36.0.2-r0.1<br>
&gt; 36.0.2-r0.0 &lt; 36.0.2-r0.1<br>
&gt; <br>
&gt; But I&#39;m not familiar with dnf/rpm to see how the versioned runtime=
 dependency<br>
&gt; is handled during installation (isn&#39;t it resolved by the same libs=
olv as what<br>
&gt; opkg is using now by default as well?<br>
&gt; <br>
&gt; +=C2=A0Alejandro in case it should be fixed in opkg somehow.<br>
<br>
I did a bit of digging on this and it is basically a difference in behaviou=
r<br>
between the debian and rpm worlds.<br>
<br>
In Debian, &quot;1.2.3&quot; !=3D &quot;1.2.3-r0&quot; but in the rpm world=
, a recipe saying &quot;(=3D<br>
1.2.3)&quot; with PR=3Dr0 is ok and matches.<br>
<br>
We can&#39;t obtain the PR of another recipe when writing package manager f=
ields so<br>
this is rather tricky to solve. Debian doesn&#39;t support any kind of wild=
card in<br>
the versioning either. I&#39;ve proposed a patch which uses &gt;=3D and &lt=
;&lt; to force a<br>
very specific range which is horrible but the best I could come up with. I&=
#39;m<br>
open to other ideas...<br></blockquote><div><br></div><div>For this specifi=
c case the cure is almost more horrible than the issue this commit was tryi=
ng to prevent, but I agree that being able to depend on version might be us=
eful elsewhere as well and your package*bbclass fix helps with that.</div><=
div><br></div><div>Thanks for looking into this.</div><div><br></div><div>R=
egards,=C2=A0=C2=A0</div></div></div>

--000000000000e838c705dc19cc1d--

