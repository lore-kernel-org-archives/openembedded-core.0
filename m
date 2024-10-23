Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CF6D2C542
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 15:29:15 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.273.1729697349290226429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 08:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eReSmUIw;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5e98bfea0ceso3329133eaf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729697348; x=1730302148; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IHHngNamIhN8zKRKn9s2lUOqjpOzBsUWlhfTzfInbjA=;
        b=eReSmUIwS4wCgeaeQlYBLKqG7Y8GhSI6QmVxcxR+yMAsKrQJ4bTA9OlnT8gvW3EbC0
         agyHRt9hzu/5Pr/w9ZTIvDPcGKIupGtOyFyZnc9o2pQ5ioX4Nhh9Qv2Ptdt5EabBdmiZ
         ZE/kMVyOEx6K+hBns8o3b4QXBj8epHshfvrqDlfkgYkltbf6Hgp4zKzHzpKVS2kjgCON
         yfD/q9fWNIp9j8kTKVE3qqqf1skIdh5gt7kU1392QvYcU+PIG/q6KF9+5DwwRltHrd1p
         hm6ebGxJnkZXIzl3HIJHc+l8nqV1OTzrzuXEdNKXBf/Wte6WmWtBAxGj/tFZfX9/OoV9
         zgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729697348; x=1730302148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHHngNamIhN8zKRKn9s2lUOqjpOzBsUWlhfTzfInbjA=;
        b=BXM93iqfV8iVR1Isf/pE/c7NkcEW59OGYbjpmFT5Z+amSe4QZPSRG2duk+Hw+xUW0U
         xLdSvVZCz1QaC9euyVkperEGMghPemNVsAu6Zv5SpsOA/uiOL69/l6mvj9NepqiWtbQZ
         iYqVPzy4MnfsRWBikD/3ox0i45CsawSqjBrSydFSo2kKlPDiPFnV9I2xrpd63qzCisZH
         kpBVmXaDG3auUwtc+i5OJMl69ho8VwQG/cnkrnehPS4lPcSPQ6otBMnMeD2iZsuLKHwL
         uNJdau80pNbEUehdk3+nHMkFgg5Kl0nPsDqu6HnVb3TsorG9HKzMN+KS7O87+FNF/2Dv
         dnlg==
X-Forwarded-Encrypted: i=1; AJvYcCWTTUSBBQ08y9FVamDwryulc4TsXRQEo+MJcUxcAYeyaGC9p2YoMv86FmUQb+N7HitHB2vtiGmmVJwdLwhKoh7Puw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzgquukijCHYoAeAhK0ho5cuKxB35OGh1dGcJQF6zBeeNjfWvhN
	vd3HsralnZuRnG94ZnNwJbPMyXocrckyAGN3jz2+ZGKTDoUQHzoQDpvsYNEEQVhG7w5HtVt/KBC
	Uml4Q08CxANTQV/pZWENMlQDEues=
X-Google-Smtp-Source: AGHT+IFgk7QWSgapT865BSFKlovJ/xBkgA13a8GIj5MEwL2+M4rO5eTlbLidVdhicPpTNUWrAi7NZMrlHLNN8ObkHxE=
X-Received: by 2002:a05:6820:2290:b0:5eb:c5dc:a636 with SMTP id
 006d021491bc7-5ebee4d67f9mr2146225eaf.2.1729697348467; Wed, 23 Oct 2024
 08:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <17FE0CA1425F2338.24631@lists.openembedded.org>
 <17FFD5DF016C394D.24795@lists.openembedded.org> <5afe4b6b2816613ac715bba3ee2f1e94c2a3cb0f.camel@linuxfoundation.org>
 <CANNYZj8ZrpWyObbQJReS-dLfjxY3QpyggqB53r_jcqFhTUvXdw@mail.gmail.com> <f1b97191136f649bac813f2159e3a40345f387c8.camel@linuxfoundation.org>
In-Reply-To: <f1b97191136f649bac813f2159e3a40345f387c8.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Oct 2024 08:28:57 -0700
Message-ID: <CAMKF1spng0TOm9_qy3-Koeeo0LK4FJorfa21J_9Po=pT89akzw@mail.gmail.com>
Subject: Re: [OE-core] Latest AB-INT unexplained mystery failure
To: richard.purdie@linuxfoundation.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000000645580625268cb2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 15:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206250

--0000000000000645580625268cb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 2:58=E2=80=AFAM Richard Purdie via lists.openembedd=
ed.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:

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
> Yes, ideally we'd track it down and get it fixed properly but we're not
> really setup to debug Debian bugs in old releases and we have other
> more pressing problems.


I agree with this. I was wondering if there is some aspects that Debian
community can be made aware of the problem ?

>
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206146):
> https://lists.openembedded.org/g/openembedded-core/message/206146
> Mute This Topic: https://lists.openembedded.org/mt/108984574/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000000645580625268cb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 22, 2024 at 2:58=E2=80=AFAM Richard Purdie via =
<a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;ri=
chard.purdie=3D<a href=3D"mailto:linuxfoundation.org@lists.openembedded.org=
">linuxfoundation.org@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On Mon, 2024-10-21 at 12:55 +0200, Alexander Kanav=
in wrote:<br>
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
<br>
Yes, ideally we&#39;d track it down and get it fixed properly but we&#39;re=
 not<br>
really setup to debug Debian bugs in old releases and we have other<br>
more pressing problems.</blockquote><div dir=3D"auto"><br></div><div dir=3D=
"auto">I agree with this. I was wondering if there is some aspects that Deb=
ian community can be made aware of the problem ?=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#206146): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/206146" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/206146</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108984574/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108984574/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000000645580625268cb2--

