Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362CECDD0DD
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 19:49:12 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.3274.1729626548678547458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 12:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WCtp6o4m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.45, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539f1292a9bso7419674e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 12:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729626547; x=1730231347; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FRnga1+5LqIkeP66IX9TiBkm5bYdOqClwYpkwnlPHYE=;
        b=WCtp6o4mQxWHKhC4ShRZnLUdOmtXmhXyHJ6SwVn5sqnoLf1osQQt4RNAdHgzxKLnP+
         +Pm24p3RyaHNhMJr5RNoC4+EG/aPgGI1Sg7z8a1dPwLymiHYsz+1wRoFOhsF5cX++j2D
         F0HcAOWi7t0H8gnxdCuszngWvj5DxykgUNXQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729626547; x=1730231347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRnga1+5LqIkeP66IX9TiBkm5bYdOqClwYpkwnlPHYE=;
        b=Fb9IS2u7mjUjxvU92L084PCKTOagw2q5qjfHy8hPRpmCdEpvMOdO0lodXyt8Pt02fy
         h359xnvln3SqS6XNxMGRpLgrEsSeLmFGfgVxTsiCkje7B7Q7pAflD+GRTmq9n2imIn54
         k7QKhpqQTkI1ruzxii/tCFLORNumtBq3WEJHUKHdrOfTGV4pZ2iOt9IcLGaIgjjLam4V
         emLJm1bpPp/GAvT4aATL5+pqvdelaimOiDQ4rqQblT8AeZlMs9p92R9bgqZcg6SrJ8X3
         1G2oj7rzqW/HXj+GAIvRrIr9wMAomY3mqQsAo4kxR5pmndUlNaa594W24dj0YtKRl8dy
         q9jQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGMbhlnqdboXpMCKhGzNFVATTIAmPCGizX9SWXcKjV56QcJUAEzaU4P+44wemD7Lfae39bvuvL3ZendV8v2CK/Jg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YygRfLEIPI3x4IB5QLrVS5JBDg4pzD+YBfmdeJWpTWbzRSseLJD
	qEEdchjexr7MG47+g1EN6abie4rhAM1hnal4PDqwwZ5gODopPBs85sqDN5/aksXj0uCD1lJCkM8
	3EWE3Df3UQtRzFn2gYYGc7K9Vrwky+5sdfTtGGw==
X-Google-Smtp-Source: AGHT+IGEIfdFhpstUfFcDByeyzeim/mh/COmHPHgbvFa5VL7S+UejTVs70sIRRh3a7tDuGYyuzYb9ohJRG0PovERxW8=
X-Received: by 2002:a05:6512:281f:b0:52c:e17c:3741 with SMTP id
 2adb3069b0e04-53b1a2f4387mr37513e87.5.1729626546619; Tue, 22 Oct 2024
 12:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
 <17FFD5DF016C394D.24795@lists.openembedded.org> <5afe4b6b2816613ac715bba3ee2f1e94c2a3cb0f.camel@linuxfoundation.org>
 <CANNYZj8ZrpWyObbQJReS-dLfjxY3QpyggqB53r_jcqFhTUvXdw@mail.gmail.com> <f1b97191136f649bac813f2159e3a40345f387c8.camel@linuxfoundation.org>
In-Reply-To: <f1b97191136f649bac813f2159e3a40345f387c8.camel@linuxfoundation.org>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 22 Oct 2024 12:48:54 -0700
Message-ID: <CADfgfobRVYZxgFGe9SPF0boQmkuF54gtWUNLq7hUgS0ZEoyN0w@mail.gmail.com>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: multipart/alternative; boundary="000000000000e7e19c0625160fc3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 19:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206174

--000000000000e7e19c0625160fc3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 2:58=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2024-10-21 at 12:55 +0200, Alexander Kanavin wrote:
> > On Sat, 19 Oct 2024 at 23:48, Richard Purdie via
> > lists.openembedded.org
> > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >
> > > Creative ideas on further debugging welcome, I'm not sure where
> > > from
> > > here. I think it narrows down the issue to the host kernel or qemu
> > > and
> > > these qemu binaries are working on the other builders. The host is
> > > a
> > > 5.10.223 kernel:
> > >
> > > $ cat /proc/version
> > > Linux version 5.10.0-32-amd64 (debian-kernel@lists.debian.org)
> > > (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for
> > > Debian) 2.35.2) #1 SMP Debian 5.10.223-1 (2024-08-10)
> >
> > There's an option to use 6.1 kernel on bullseye:
> > https://packages.debian.org/bullseye-backports/linux-image-amd64
> >
> > so I'd give that a shot, if only to confirm (or refute) it's
> > definitely 5.10 on the host.
>
> Michael was able to switch debian11-vk-1 to the 6.1 kernel (thanks!)
> and I've run  5 builds successfully on it, the single build I tried on
> debian11-vk3 at the same time failed.
>
> I'm therefore willing to say this is some bug in the 5.10 kernel,
> switch our other two workers to 6.1 and call things "resolved".
>
>
All three Debian 11 Bullseye workers are set up with 6.1.0 kernels now.


> Yes, ideally we'd track it down and get it fixed properly but we're not
> really setup to debug Debian bugs in old releases and we have other
> more pressing problems.
>
> Cheers,
>
> Richard
>


--=20
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

--000000000000e7e19c0625160fc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 22, 2024 at 2:58=E2=80=AF=
AM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Mon, 2024-10-21 at 12:55 +0200, Alexa=
nder Kanavin wrote:<br>
&gt; On Sat, 19 Oct 2024 at 23:48, Richard Purdie via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;richard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.opene=
mbedded.org" target=3D"_blank">linuxfoundation.org@lists.openembedded.org</=
a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Creative ideas on further debugging welcome, I&#39;m not sure whe=
re<br>
&gt; &gt; from<br>
&gt; &gt; here. I think it narrows down the issue to the host kernel or qem=
u<br>
&gt; &gt; and<br>
&gt; &gt; these qemu binaries are working on the other builders. The host i=
s<br>
&gt; &gt; a<br>
&gt; &gt; 5.10.223 kernel:<br>
&gt; &gt; <br>
&gt; &gt; $ cat /proc/version<br>
&gt; &gt; Linux version 5.10.0-32-amd64 (<a href=3D"mailto:debian-kernel@li=
sts.debian.org" target=3D"_blank">debian-kernel@lists.debian.org</a>)<br>
&gt; &gt; (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils f=
or<br>
&gt; &gt; Debian) 2.35.2) #1 SMP Debian 5.10.223-1 (2024-08-10)<br>
&gt; <br>
&gt; There&#39;s an option to use 6.1 kernel on bullseye:<br>
&gt; <a href=3D"https://packages.debian.org/bullseye-backports/linux-image-=
amd64" rel=3D"noreferrer" target=3D"_blank">https://packages.debian.org/bul=
lseye-backports/linux-image-amd64</a><br>
&gt; <br>
&gt; so I&#39;d give that a shot, if only to confirm (or refute) it&#39;s<b=
r>
&gt; definitely 5.10 on the host.<br>
<br>
Michael was able to switch debian11-vk-1 to the 6.1 kernel (thanks!)<br>
and I&#39;ve run=C2=A0 5 builds successfully on it, the single build I trie=
d on<br>
debian11-vk3 at the same time failed.<br>
<br>
I&#39;m therefore willing to say this is some bug in the 5.10 kernel,<br>
switch our other two workers to 6.1 and call things &quot;resolved&quot;.<b=
r>
<br></blockquote><div><br></div><div>All three Debian 11 Bullseye workers a=
re set up with 6.1.0 kernels now.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
Yes, ideally we&#39;d track it down and get it fixed properly but we&#39;re=
 not<br>
really setup to debug Debian bugs in old releases and we have other<br>
more pressing problems.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Michael Halstead<div>Linux Foundation / Yocto Project</div><=
div>Systems Operations Engineer</div></div></div></div>

--000000000000e7e19c0625160fc3--

