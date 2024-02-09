Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233A9C48260
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 00:59:23 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.1066.1707440355312343358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 16:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lMmh9zcb;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6e2babefbc8so201208a34.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 16:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707440354; x=1708045154; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sH7/I1P9gwC/UJxQLSTNvtU8r9aXP7csUnX/yImgBeQ=;
        b=lMmh9zcbav8yEi9xYZjLcQ1BNL+EeCNFEEbNB/QNys8DLwy8rgIxMsOpS9UpQPcFZG
         HtAYxAWPif74W2dw0OxI+hUsKIBAzKgjxcbs7Pnfr+R9s8oKr/64XWQLsV6/n+aUx9E9
         gyLP5WApeP8UAEeUlGWX+CtDYIfrG4bnd/w/J02Dj4qbyaAVR2TLnAJGOgOfKZtBZU9j
         Rhr5ayBIZa/te4uoH44viJiDqAY0PzS1iuJaTbninNldbpWvVICe45qzIWGpcNPd8b91
         ybrT5aeqph+ZX181EccQTGNYSpp0k/MsaJMmlXtwclJ9LxLn8NA08EC4QHQIAqBnit1s
         O2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707440354; x=1708045154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sH7/I1P9gwC/UJxQLSTNvtU8r9aXP7csUnX/yImgBeQ=;
        b=bxEzqcPlbLOEW3hLbhIU5HFuaCkK+8fAVVUfhcEXokwn7ZDVXPSpXGTQlAKf1EILLF
         twnLqUizR05co3k1pslc2bwsgRWgN1yK4B4osjpmO4Pn32iifMP5oNJXBOsKJKrH8uV5
         KXb99vbhaZCjSkIFurtmXL4bNR6SqCJbTGzfd1k5Pr7rKqxtj4zXmIUOt0hNI2VWrK48
         NZGFhIFDPZ2rITIahuRoc/T6xJ9c/4uqYt101DymU1/l4tksxf6IayQZC7EcCBs1mqBl
         8156/eLXdDGrWPXlIpLbwvDIYfLENqbQBkoRO8UJZKjyuDaDJioP2oy0sM8ptpyhj4Pv
         QIkg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Y2scFsB5UHHEpT5oY66P0YoQWP9QOZyXzMSwHTpHNmcjsOFD11ZTj8gXY+tk5M88n8ztooBNFz7r1aewBjO7MtdkF8Owj94TSpUoOtXuuZSjmanZ8KXq
X-Gm-Message-State: AOJu0YyOtNGoXzzKjhym7Rbbvs3FB3z5IYtm7Pssz9/mdf0bLTwdeALE
	wnU89BsYlVvx2IKGj5L3C+rcjZW1QhRW7qWlHyK1fw8Lmx4Qt9ctuL0YsA6ZEYqfFFrM9BMAsHk
	woQyaH1DbmsXu+deiPGU2V2d/C08=
X-Google-Smtp-Source: AGHT+IHfGKn6maSoer2QQTTvH8kvip4rERK1NqRKn445ZfJG2XrFsCFJzJzgat1MjIswfWM5EwspMRRyTKpEPE2liEk=
X-Received: by 2002:a05:6870:330b:b0:219:f071:416c with SMTP id
 x11-20020a056870330b00b00219f071416cmr104780oae.16.1707440354364; Thu, 08 Feb
 2024 16:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20240208101156.735389-1-aleksey.smirnov@yadro.com>
 <f33b3247e9eddcbadf09b85af0efd642926945cf.camel@linuxfoundation.org> <CANNYZj9AZ5OiUXy-GTM5qUcE-TefdB3Fq=HKWQ3nrOc4HkBkWg@mail.gmail.com>
In-Reply-To: <CANNYZj9AZ5OiUXy-GTM5qUcE-TefdB3Fq=HKWQ3nrOc4HkBkWg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Feb 2024 16:59:03 -0800
Message-ID: <CAMKF1spG_9DskG=92hdoB3ww00pqSubHhJ0FBFq0Y5-OkRR9mw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] configuration: add Power8 tune to PowerPC architecture
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Aleksey Smirnov <aleksey.smirnov@yadro.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cc125b0610e86fde"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 00:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195182

--000000000000cc125b0610e86fde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 3:30=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> On Thu, 8 Feb 2024 at 12:20, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > The patch is probably fine but I do have to ask, are you actively using
> > Power8 based devices? Are these current/new designs or old ones for
> > compatibility?
> >
> > I ask since I get a lot of questions about dropping mips and power
> > support so it would be useful for me to be able to point to users.
> >
> > Mips and power are also not represented at the membership level in the
> > Yocto Project, unlike the other architectures which does make
> > maintaining all the testing a bit tricky to justify.
>
> I think we're testing only 32 bit ppc, and this is for the purpose of
> building for 64 bit ppc designs? Then dropping the former won't affect
> the latter.


Testing matrix is one of them but there are other concerns like multilib
support. So knowing this is quite helpful on decision making


>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195137):
> https://lists.openembedded.org/g/openembedded-core/message/195137
> Mute This Topic: https://lists.openembedded.org/mt/104236370/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000cc125b0610e86fde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Feb 8, 2024 at 3:30=E2=80=AFAM Alexander Kanavin &l=
t;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On Thu, 8 Feb 2024 at 12:20,=
 Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; The patch is probably fine but I do have to ask, are you actively usin=
g<br>
&gt; Power8 based devices? Are these current/new designs or old ones for<br=
>
&gt; compatibility?<br>
&gt;<br>
&gt; I ask since I get a lot of questions about dropping mips and power<br>
&gt; support so it would be useful for me to be able to point to users.<br>
&gt;<br>
&gt; Mips and power are also not represented at the membership level in the=
<br>
&gt; Yocto Project, unlike the other architectures which does make<br>
&gt; maintaining all the testing a bit tricky to justify.<br>
<br>
I think we&#39;re testing only 32 bit ppc, and this is for the purpose of<b=
r>
building for 64 bit ppc designs? Then dropping the former won&#39;t affect<=
br>
the latter.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Testi=
ng matrix is one=C2=A0of them but there are other concerns like multilib su=
pport. So knowing this is quite helpful on decision making=C2=A0</div><div =
dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Alex<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#195137): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/195137" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/195137</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104236370/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104236370/1997914</a><br>
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

--000000000000cc125b0610e86fde--

