Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55480C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:19:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.7188.1739438366613313692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:19:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DhJ2eUOg;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso3576945e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 01:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739438365; x=1740043165; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=for+kPmKtXo7WcGOFvFar5sBeVgubSiuydmxpaL27tk=;
        b=DhJ2eUOg6A39wmYMwip+ahd5b3k/7Np7AU8cOZgAQ3L/FF3Ru/1MzTK7f+OdMgqbn2
         +Kq9DZopEfu0KlZwTDDNMd50cf/dQ2a0Cr1+KOzUhAEvrsxfqqYU+IODG3urJ/smndrv
         1z5fyjaKckyOD136/lXttutd1YBrWI1Z0SgKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739438365; x=1740043165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=for+kPmKtXo7WcGOFvFar5sBeVgubSiuydmxpaL27tk=;
        b=xGUZ8vH3EmmQRMgGQkI0sFbFvYOaH8hAHNx6jbNNPl8l4Ze3+R12/O0rxaz93eR2rz
         /XeLrPcDVSmwHj/VTrKUWLmZbr5ko0Z/mJ2OC8GeHzP+IITCI0pDnTypi0yl++h25RGw
         k0e39PT+yiEuVo+j3vWRogBJ4gwk3ODktDWAgh+DqB/xwxvc+ipFJ9lkR98z8FLEpuy6
         aDxsv2Q4oiRqN0NBugAGvnirOHbtMYU9EN2M/KEPKDCKvSgrLVu3ck5d4JatY+kG2vUB
         1lNK6Y3rhhHnhoxpGr5Fg8MC5yxQSqab5kSFiCshN/Sv1W7N9ei3qxQeq5xts7GZxrcz
         xQ8g==
X-Forwarded-Encrypted: i=1; AJvYcCU1BQ1cY8o7Fh2lQfBFFKezmtsuz4AzVQacunuxmewAGpKOjf6TQ5N+6rCeGqB4G1tI5CKesoVFtFjtwRui9RDXpw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxG9tYsxAmYXRl4kr4EwXl0+baB6Aw6kMiyZTqUd4/CyxgnpeX0
	csoLUID9Sl7eH/BXMe3oQGvmDKe2FqeXupba5wdNRakYPoCqKza2B2QZvlp7rrHrQzJSt7ljllg
	FTU/dkEoPoQ2d3IlHJ8/L2CeoNJXgTouh5cj7Kw==
X-Gm-Gg: ASbGncsy5kuFqHD9nYgyjxzaxEh7FTctNUEB3Igag1A228IcB2RqO+0//a/Qn8gEItB
	fsgr81DzP6sUQaQPKKThkp5UdVCWrdq3uX/V4/ujyU7oILm8YViY52LVYKhFlgfDu6bCTXwxe8o
	ghZRlBWI+C38x/biCQ6rws/UJoKfY=
X-Google-Smtp-Source: AGHT+IEwPikyM6M6S5Erqa+f3vw5lL4ybl+6uo0qIeCjoSIeNzBctUVjt4K/1VHOiTRdkdR8rS57MXV7BmmsykYbkBI=
X-Received: by 2002:a05:600c:4f49:b0:434:f9ad:7222 with SMTP id
 5b1f17b1804b1-43960e8d3f8mr19544815e9.7.1739438364765; Thu, 13 Feb 2025
 01:19:24 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
 <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
 <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org>
 <CAMSfU+44qwScnoDP4As37TNHYvwx5mBmTdGEQgq_VVz7woh6sQ@mail.gmail.com>
 <CAMSfU+4MY-JVmWPUixJYiUrtKd2CXHrJuQ0sMJJrrkLzrvAuvA@mail.gmail.com> <CANNYZj_8o=SHOn-kRBxzwc8vp3omCL290SA-jKkL_En1m2SWEA@mail.gmail.com>
In-Reply-To: <CANNYZj_8o=SHOn-kRBxzwc8vp3omCL290SA-jKkL_En1m2SWEA@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 13 Feb 2025 10:18:58 +0100
X-Gm-Features: AWEUYZm1iKZthBa7dL9qLwBUK45tRD0tAyD5IgU2Izn5w8HMNJE-J-guEuRYt6c
Message-ID: <CAMSfU+6erOUr6-8yOGLhBEugNhkrHn775+3X4rmTGp6Q20o5Bg@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Yocto Mailing list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d7499e062e028dc1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 09:19:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211308

--000000000000d7499e062e028dc1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le jeu. 13 f=C3=A9vr. 2025 =C3=A0 09:49, Alexander Kanavin <alex.kanavin@gm=
ail.com> a
=C3=A9crit :

> On Thu, 13 Feb 2025 at 00:04, Yoann Congal <yoann.congal@smile.fr> wrote:
>
> > I did not find a magic silver bullet that would solve everything (I
> discovered that Gitlab is way more flexible on this subject).
> > I guess we need to find a compromise between what a github user sees an=
d
> the effort we are willing to put into it.
>
> So as I understand, there are no 'settings' in github openembedded
> organization we can tweak and everything is through repos?
>
> Then here's the plan:
> - someone with rights to manage overall
> https://github.com/openembedded org creates an empty .github repo and
> gives Yoann rights to manage it.
>

To me, the https://github.com/openembedded subject is different from
https://github.com/yoctoproject/

On OE, issues are acted upon, PR merged (example
<https://github.com/openembedded/meta-openembedded/pull/931>). Even if not
recommended, from a contributor perspective, it does work. I don't know if
the situation is clear enough to set up something.

On YP, the situation is clearer, there are repos
<https://github.com/yoctoproject/vscode-bitbake> that use the github
workflow (issues/PR) and others that don't. Here, I feel that we can setup
the .github repo.

- Yoann opens pull requests to that repo, and notifies of them here
> - any needed github specific tweaks to individual repos are proposed
> and merged through the standard mailing list process.
>
> Alex
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000d7499e062e028dc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,</div><div><br></div><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0jeu. 13 f=C3=A9vr. 2025 =C3=A0=C2=A009:49, Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Thu, 13 Feb 2025 at 00:04, Yoann Congal &lt;<a href=3D"mailto:yoann.conga=
l@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt; wrote:<br>
<br>
&gt; I did not find a magic silver bullet that would solve everything (I di=
scovered that Gitlab is way more flexible on this subject).<br>
&gt; I guess we need to find a compromise between what a github user sees a=
nd the effort we are willing to put into it.<br>
<br>
So as I understand, there are no &#39;settings&#39; in github openembedded<=
br>
organization we can tweak and everything is through repos?<br>
<br>
Then here&#39;s the plan:<br>
- someone with rights to manage overall<br>
<a href=3D"https://github.com/openembedded" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/openembedded</a> org creates an empty .github repo=
 and<br>
gives Yoann rights to manage it.<br>
</blockquote><div><br></div><div>To me, the <a href=3D"https://github.com/o=
penembedded" rel=3D"noreferrer" target=3D"_blank">https://github.com/openem=
bedded</a> subject is different from <a href=3D"https://github.com/yoctopro=
ject/">https://github.com/yoctoproject/<br></a></div><div><br></div><div>On=
 OE, issues are acted upon, PR merged (<a href=3D"https://github.com/openem=
bedded/meta-openembedded/pull/931">example</a>). Even if not recommended, f=
rom a contributor perspective, it does work. I don&#39;t know if the situat=
ion is clear enough to set up something.</div><div><br></div><div>On YP, th=
e situation is clearer, there are <a href=3D"https://github.com/yoctoprojec=
t/vscode-bitbake">repos</a> that use the github workflow (issues/PR) and ot=
hers that don&#39;t. Here, I feel that we can setup the .github repo.</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">- Yoann op=
ens pull requests to that repo, and notifies of them here<br>
- any needed github specific tweaks to individual repos are proposed<br>
and merged through the standard mailing list process.<br>
<br>
Alex<br></blockquote><div>=C2=A0</div></div><span class=3D"gmail_signature_=
prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=
=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=
=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div></div><=
/div>

--000000000000d7499e062e028dc1--

