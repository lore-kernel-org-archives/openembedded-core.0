Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F885C5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 15:20:52 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.14732.1709047243906074372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 07:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T62aiaMv;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c1a7d51fb5so1037181b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 07:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709047243; x=1709652043; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7QD6QTypfovtnZ1HR9XGqvq3vUMNazIz8UKmKsqPvd8=;
        b=T62aiaMvfCD8UFu7yz8x9s1aSvT/fUDNMAXsznPuF+XIzNdgry1h8YFD0X5UK1RkUQ
         I9s1h/35fyOHuDzbzlYVcxUh1Fypw6HEW6yv4k3C3Ls9EPckcWAABXb4E+c1o25UIrLr
         H98n2qCTItcLM5AXYBm0r+aCMH2M1N+td7qiLwXPHGJXwfY+8kGm9++hF/YBoo4RUXlJ
         jj7J2DKD1BEP2yTdb1VavCy5Al+B72lUfuI8Z6V4eH3wj8b+M1nFsKJVZz/Ew8kA8ggq
         6uSb6EcUsX4OuxlIuEMczmgvdmb32ui24CIUzPCFhFtWBwQw145LckYblxV9rB1XXfhP
         yI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709047243; x=1709652043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QD6QTypfovtnZ1HR9XGqvq3vUMNazIz8UKmKsqPvd8=;
        b=dQ5RPAK4tWgQ/+XvEli/mKejK5Jm5VJ5NVpIhLtOy01V8VkdhQ/OMLoZfFKfgmIgvG
         imEreQIzxpbKL1/64BXRsV59p+8wVRbQoYlpef8pdc3K0DUY5echbDy0fc4ZTjDzia0d
         cTC0BPqwf+7gkccBvFqPiOvCaONkLssU+a4hqYxFXnA5NNiUVPcBqK9Q7EmNnP0KULHj
         gyPffvSpvxq2xHkbChAyP1PMIwq2M5JDnPcn+2/QIBNSKC05m2EayU5GZBlEozXdS9yx
         JAyCTE9W/iWxdxAs7cjSUmBZu1/e4eHofNMG3xaZ4iFXHxpZCsCqUr6F68mHbVOwrhMl
         td/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPXukaL9kdpUOzZ+2D24LC20IEZfg1owjvnxqfifw65wMbHlZOrXJC6WYBMhxHimV3plldMvnNU0bRELBI1iJRrlVmjKQ3wfE1fCtjetLRpG/+A21ygT/t
X-Gm-Message-State: AOJu0YxaptxxmZtTF9R1gpL51neLa8Oc2FtLnVZ0qRGsk7ggBW4rNq15
	6rH/obO0b+lRG5SGraxiZlrmZkDLDwgt60eWAAhrRymuoZr31gnST9wElZOfUg9KttAw3o86i0Q
	aEv1ktCVFPM9/lOYvBhv9Ip30hYo=
X-Google-Smtp-Source: AGHT+IGKZMeCh1b5BdMdihkzPilaZgKPyN+WBdrsYj3lS/ZzEgLoC40bLaL90D9P7xcWEuAmlJVf7PirNL9zVskH0Lk=
X-Received: by 2002:a05:6808:1303:b0:3c1:b374:4941 with SMTP id
 y3-20020a056808130300b003c1b3744941mr908603oiv.28.1709047243021; Tue, 27 Feb
 2024 07:20:43 -0800 (PST)
MIME-Version: 1.0
References: <20240227100709.1154-1-jose.quaresma@foundries.io>
 <17B7B05748A57C25.14830@lists.openembedded.org> <CANPvuRkPCgyBY43BH7S=azRCKum51NVk2ikQ4jwU9V6ezUQWGg@mail.gmail.com>
 <b6a799de1f0e8df4c117ce5dec0bd08243878e68.camel@linuxfoundation.org> <CADkTA4M_C-83rQueM7L5FOemO6_D-dj066E28FHZp8Q8GQYUyw@mail.gmail.com>
In-Reply-To: <CADkTA4M_C-83rQueM7L5FOemO6_D-dj066E28FHZp8Q8GQYUyw@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 27 Feb 2024 15:20:32 +0000
Message-ID: <CANPvuRksRcdbWYOdYRLMKD=0SWGXMb4AuGLUVdyXEwExfUdFLw@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH 3/3] goarch: disable dynamic
 linking globally
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d3233106125e91ef"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 15:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196275

--000000000000d3233106125e91ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu (ter=C3=A7a, 27/02/2024 =
=C3=A0(s)
14:01):

> On Tue, Feb 27, 2024 at 8:57=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2024-02-27 at 10:13 +0000, Jose Quaresma wrote:
> > > Hi,
> > >
> > > I would like to ask if this patchset could be exercised in the
> > > autobuilder?
> > > I only got it working yesterday and today I'm going to do a more
> > > exhaustive test.
> > > This is still missing the update to 1.22, which I'll do later, but
> > > testing this would be a good help.
> >
> > I did put this in for testing. The build is still running but so far
> > there were two issues:
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6466/st=
eps/14/logs/stdio
> >
> > from oe-selftest -r gotoolchain.oeGoToolchainSelfTest.test_go_dep_build
>

I have see of this also in my local builds in my distro and there are some
reports upstream
https://github.com/golang/go/issues/61928
I believe this one is expected with the update but I am still doing my
local tests.


> >
> > and meta-clang:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/142/builds/39
> >
> > meta-virt did pass our testing but I've copied Bruce so he's aware of
> > this and can comment. Copying Khem for meta-clang too.
>

For meta-clang maybe we can switch to gcc to build the go-helloworld


>
> I'm running into some golang issues linking with my latest updates to
> meta-virt .
>
> I'll apply these locally and see if they help, make things worse or have
> no impact on my upcoming recipe bumps for m-virt.
>

I am testing mostly docker and everything seems fine so far.

Jose


>
> Bruce
>
>
> >
> > Cheers,
> >
> > Richard
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000d3233106125e91ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu (ter=C3=
=A7a, 27/02/2024 =C3=A0(s) 14:01):<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Tue, Feb 27, 2024 at 8:57=E2=80=AFAM Richard Purdie<b=
r>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, 2024-02-27 at 10:13 +0000, Jose Quaresma wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I would like to ask if this patchset could be exercised in the<br=
>
&gt; &gt; autobuilder?<br>
&gt; &gt; I only got it working yesterday and today I&#39;m going to do a m=
ore<br>
&gt; &gt; exhaustive test.<br>
&gt; &gt; This is still missing the update to 1.22, which I&#39;ll do later=
, but<br>
&gt; &gt; testing this would be a good help.<br>
&gt;<br>
&gt; I did put this in for testing. The build is still running but so far<b=
r>
&gt; there were two issues:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/87/=
builds/6466/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6466/steps/14/=
logs/stdio</a><br>
&gt;<br>
&gt; from oe-selftest -r gotoolchain.oeGoToolchainSelfTest.test_go_dep_buil=
d<br></blockquote><div><br></div><div>I have see of this also in my local b=
uilds in my distro and there are some reports upstream</div><div><a href=3D=
"https://github.com/golang/go/issues/61928">https://github.com/golang/go/is=
sues/61928</a></div><div>I believe=C2=A0this one is expected=C2=A0with the =
update but I am still doing my local tests.</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; and meta-clang:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/142=
/builds/39" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctop=
roject.org/typhoon/#/builders/142/builds/39</a><br>
&gt;<br>
&gt; meta-virt did pass our testing but I&#39;ve copied Bruce so he&#39;s a=
ware of<br>
&gt; this and can comment. Copying Khem for meta-clang too.<br></blockquote=
><div><br></div><div>For meta-clang maybe we can switch=C2=A0to gcc to buil=
d the go-helloworld<br></div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
I&#39;m running into some golang issues linking with my latest updates to<b=
r>
meta-virt .<br>
<br>
I&#39;ll apply these locally and see if they help, make things worse or hav=
e<br>
no impact on my upcoming recipe bumps for m-virt.<br></blockquote><div><br>=
</div><div>I am testing mostly docker=C2=A0and everything seems fine so far=
.<br><br>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Bruce<br>
<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--000000000000d3233106125e91ef--

