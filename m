Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F87DCFC28F
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 11:32:40 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.11061.1728991958156163122
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 04:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nY4zL2IH;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so1578078e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 04:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728991956; x=1729596756; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bgeXvsPXu6xV+gKRkRh1Cw5r5buMq/tCQhuDxOVRbNk=;
        b=nY4zL2IH8CSUh1dYlhOxw7w1FozUFRi5A5j3W+q7IzJn7nM8YgA9McbkTatlMn6s9D
         R2OC4q4irdZB2Dwo/E3t2n13yiyDWuMM2Ag/NTzwQeBSfZmIPM6ZRH4eNHshTW/xitam
         esT/VYMrZcw6eMhtl/CTgJhIem3+E6ALQ0qfXdOsMK3Vh625cJQUaN23oyw9PvHOmzF8
         3Zmtv4D5SUgZ/E2qxSGRdKVCyVRE3nDGF02m0317HyWuK4oiAh8ZqxTRtyAHB9CVQdpX
         XcsUldH3cJEJPyLYthltCHMC/QQulPk7QVSaZ21s6FQto1UEY4Fi461MZMyZRO6F6+zt
         2khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728991956; x=1729596756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgeXvsPXu6xV+gKRkRh1Cw5r5buMq/tCQhuDxOVRbNk=;
        b=F5PkEgv3uHjWa975tY8N0twaD9s9p20y2NpNsdmgsZlqFEwlASO+Z4ugThRsJ7PjLh
         Q0wQENUR09OMX37PGDtraqwDLjBA1oiTATo3+NQ8Y9vXGEIjRfhrgzRdyZpc98d6WHi9
         u/9t0s5tbEvpSv+ocRWYKHiEm0gJ+//1NrUQNrRmiUsHGnPjP/ebtYz68MToPf0+P0NE
         AxF2GGyFJacZuRVxjMwBuV4btUirAt9IEBfybPk+10LD9Dihew1olZlyusHt2IoTEadc
         QV3PPwSXXQE+F6yzK+n87afd2Tcz/AFQVSf5eu9faNpfxk2EhAuySL+D/Z7vIAAXLBNA
         jTQg==
X-Forwarded-Encrypted: i=1; AJvYcCWGZerq48iFJHmdvZguXfQVpL2COPEQmbKiMFxJV7H4pOQ+khSpBgTxwpGg41+RhS1MsZQowPqbXquWUjqij/9+VQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw0YqK+swN1JeHbsWiUSOMy/9riHGh/Y/6OQHTj1IoyUVntS1Zt
	J0pHefMo9FGbXjl3ZSVRU/CJ7TtGfvaevMWHRMhXl4QNmJQJg+v4hXQQ2jfGqog/+063mNjwwy9
	q3q2cB0Ui+KXUZau64G9MaLZsQCA=
X-Google-Smtp-Source: AGHT+IG3NvYis3so1UMdYXhi96pZMsArewA8hKEJUk6qK6Ui0GKZZEoZO3KgsNDEx6Z/zdYxY62KEvrGyGpYekwAn7M=
X-Received: by 2002:a05:6512:3c90:b0:539:f93d:eb3d with SMTP id
 2adb3069b0e04-53a03f819damr1209e87.46.1728991955851; Tue, 15 Oct 2024
 04:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241011122044.12222-1-mikko.rapeli@linaro.org>
 <ebd022b240f4bb6b8e2e2fb8d93a4c9f2ba9492f.camel@linuxfoundation.org>
 <17FE4B15CF045259.4702@lists.openembedded.org> <Zw4PXRX28-qB8FjT@nuoska>
 <874585dde5c3fe6685e9c8b250cd02dc2404f26c.camel@linuxfoundation.org> <Zw5Qm1ZEScA196fh@nuoska>
In-Reply-To: <Zw5Qm1ZEScA196fh@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 15 Oct 2024 13:32:24 +0200
Message-ID: <CANNYZj8kF0oSASbWmMMRR1a9SL-C+tiiJPNn-7jr6mgiGx-fsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8 0/8] systemd uki support
To: mikko.rapeli@linaro.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005922720624824f43"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:32:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205807

--0000000000005922720624824f43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Don=E2=80=99t remove the tests please. Without them things tend to regress.=
 I
understand it=E2=80=99s frustrating, but we do have arm people here that ha=
d pushed
hard for testing in arm hosts, (without really thinking through how
contributors are supposed to deal with such failures) and I think it=E2=80=
=99s now
on them to help you out.

Alex

On Tue 15. Oct 2024 at 13.23, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> wrote:

> Hi,
>
> On Tue, Oct 15, 2024 at 11:43:33AM +0100, Richard Purdie wrote:
> > The arm test still fails:
> >
> >
> https://valkyrie.yoctoproject.org/#/builders/23/builds/267/steps/14/logs/=
stdio
> >
> > The traceback is at least cleaner now I fixed the lock error. I did
> > test with KVM disabled.
>
> Bugger. I had tested this on qemuarm64 and genericarm64 on an x86_64
> build host with Ubuntu 22.04. Is this an arm64 build host with Ubuntu
> 20.04?
>
> I will remove the tests as it is clearly too hard to get these running.
>
> It is a bit hard to figure out in which environments selftests are runnin=
g.
>
> Cheers,
>
> -Mikko
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205806):
> https://lists.openembedded.org/g/openembedded-core/message/205806
> Mute This Topic: https://lists.openembedded.org/mt/108947467/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005922720624824f43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Don=E2=80=99t remove the tests please. Without them thing=
s tend to regress. I understand it=E2=80=99s frustrating, but we do have ar=
m people here that had pushed hard for testing in arm hosts, (without reall=
y thinking through how contributors are supposed to deal with such failures=
) and I think it=E2=80=99s now on them to help you out.</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Alex=C2=A0</div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue 15. Oct 2024 at 13.23=
, Mikko Rapeli via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;mikko.rapeli=3D<a href=3D"mailto:linaro.org@lists.openembe=
dded.org">linaro.org@lists.openembedded.org</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)">Hi,<br>
<br>
On Tue, Oct 15, 2024 at 11:43:33AM +0100, Richard Purdie wrote:<br>
&gt; The arm test still fails:<br>
&gt; <br>
&gt; <a href=3D"https://valkyrie.yoctoproject.org/#/builders/23/builds/267/=
steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://valkyrie.=
yoctoproject.org/#/builders/23/builds/267/steps/14/logs/stdio</a><br>
&gt; <br>
&gt; The traceback is at least cleaner now I fixed the lock error. I did<br=
>
&gt; test with KVM disabled.<br>
<br>
Bugger. I had tested this on qemuarm64 and genericarm64 on an x86_64<br>
build host with Ubuntu 22.04. Is this an arm64 build host with Ubuntu 20.04=
?<br>
<br>
I will remove the tests as it is clearly too hard to get these running.<br>
<br>
It is a bit hard to figure out in which environments selftests are running.=
<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#205806): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/205806" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/205806</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108947467/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108947467/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000005922720624824f43--

