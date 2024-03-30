Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66788CD1288
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 12:52:27 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.13094.1711803145197476775
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Mar 2024 05:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BqRU5Yr6;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d4886a1cb4so33783531fa.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 05:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711803143; x=1712407943; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KzFz/KO/JmdNu9bau4eLWwoDiTfzrrjVUxQh7eDQMrY=;
        b=BqRU5Yr6a6L37VsAKqsgfqQUptjyybo8XMG0F0BgfooXLQEHFElEILgTQij67PeAp3
         OeZCBj+HQetOBCRGGyGcRCGeACYUcH8q+4Ng9QtVD9nn4Rn8i2McEZ6HDbvVgGBVskap
         ZTeI3HY43dyYqEHglmt0MBNGLIEFLsGQFRhXoQj7pzlzIDQhUxey7/2pw3GDV+qUT5dw
         Ko1wOI3d3vN8VA5RyDwovNEjIqy3FHkeHu81JwH1yCyFxSCcqVWGo0Lvv4oKG1lGo4II
         JvPABlmopRHa5TyjsLcyqgf+oFqMjypxHCz45rAh4Yf7ISO7fVBIoGV92OprnfGBY3Hh
         SVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711803143; x=1712407943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzFz/KO/JmdNu9bau4eLWwoDiTfzrrjVUxQh7eDQMrY=;
        b=mHaK/vHvU5KuDNfapP+bH9pB+O9IH6CLHhOs6Ggz73/DfJD+q7a32JJT6Fhs4qWVhw
         v+qsJSJTS83FjBp0JuAW+JVB7bnkV9k7T6UVyORwIo1NatwCpWU4q28K/jP1h8AZwO9X
         Om4U6YWkXP+2kEEf50pO1LX2AuSZ1kJroCKeKbmuEopRKz1V4PeGuIt0I1MOj6CB2C/x
         yvdsgWjbD76NwUmysZ1JBxJ/WWcRKejhtEgCHIMekFmp5UzBVvROILitTpZzhnIn7mYt
         M8kE0XGteSz9oSCGM+WGJG5eHneA6apvm6o1tmRdaS8Xzb7ob7hGd3kXPxiK4TaQ8JqF
         ScBg==
X-Forwarded-Encrypted: i=1; AJvYcCWErd9W8fq1sXCwwBPOVgnfWAuevb0L9tWqikNycN7a4G+FDZMAuPljm5J5CbIDQKgcmH4vh3UUPbgX8qOnluY5Tj8hWtiNUO4LbeRZmC5b9BBikr570AFg
X-Gm-Message-State: AOJu0YxVA90VaSc0oAS7AqB5vJc3s2fcwIKP8FezUxNWFIJk9yuemoF9
	5bBqhUiTK0JQCpDpy45/Vwxydct5/lIjrjzWnsJJCFATQIRz6huQxb/TyVo8HD8KJnUkVutiSnq
	i6nb9Zs+3GvbzTwFtB7nNOCf7faM=
X-Google-Smtp-Source: AGHT+IHky/7tYLKZl4ExWysg206MigmoicyTqJEGQJqFKPMHx5Kh1auFKliDXwLlVsCf8xcbbEvlClEKs1Xk0D0KzW4=
X-Received: by 2002:a2e:a455:0:b0:2d4:71b9:4e3 with SMTP id
 v21-20020a2ea455000000b002d471b904e3mr2789961ljn.51.1711803142847; Sat, 30
 Mar 2024 05:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
 <1710313714-12541-36-git-send-email-wangmy@fujitsu.com> <2d88c7fc227e44acf14470103dadd92e026b62f9.camel@linuxfoundation.org>
 <36b1d7d1-c1ea-4d1a-b7a7-27ff550cdcc7@kernel.crashing.org>
 <CAApg2=Tq7i4u3+U9iNXQufH8kKwnfty2OG=OUeL23j9PT9gFJA@mail.gmail.com> <d21d06c112a43b8d29ab98a05a3088a16c5d4dac.camel@linuxfoundation.org>
In-Reply-To: <d21d06c112a43b8d29ab98a05a3088a16c5d4dac.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 30 Mar 2024 13:52:11 +0100
Message-ID: <CANNYZj8DCqKE9_ftZTKfj8UY5tnDUnPhETN++3SjeNDT_S4_iA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 36/36] xz: upgrade 5.4.6 -> 5.6.1 _WARNING_
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>, Marta Rybczynska <rybczynska@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, wangmy@fujitsu.com
Content-Type: multipart/alternative; boundary="000000000000416e850614e03a15"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 12:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197650

--000000000000416e850614e03a15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99m slightly worried. Does this compromise build systems (given tha=
t back
door was injected into autoconf scripts) or only systems where xz binaries
are installed?

Ale

On Sat 30. Mar 2024 at 13.26, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2024-03-30 at 13:08 +0100, Marta Rybczynska wrote:
> > Absolutely confirm. DO NOT UPDATE
> >
> > Marta
> >
> > On Sat, 30 Mar 2024, 02:04 Mark Hatle,
> > <mark.hatle@kernel.crashing.org> wrote:
> > > I know this request is a week or so old..
> > >
> > > But do NOT upgrade to 'xz' 5.6.0 or 5.6.1.  It has been
> > > compromised:
> > >
> > > https://www.openwall.com/lists/oss-security/2024/03/29/4
> > >
> > > --Mark
>
> We're not going to. The upgrade was already dropped after it failed
> build testing. I do wonder why it failed.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/8737
>
> I've ensured the sources were removed from our mirrors too.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197649):
> https://lists.openembedded.org/g/openembedded-core/message/197649
> Mute This Topic: https://lists.openembedded.org/mt/105226831/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000416e850614e03a15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I=E2=80=99m slightly worried. Does this compromise build =
systems (given that back door was injected into autoconf scripts) or only s=
ystems where xz binaries are installed?</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Ale=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat 30. Mar 2024 at 13.26, Richard Purdie =
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@li=
nuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Sat, 2024-03-=
30 at 13:08 +0100, Marta Rybczynska wrote:<br>
&gt; Absolutely confirm. DO NOT UPDATE<br>
&gt; <br>
&gt; Marta<br>
&gt; <br>
&gt; On Sat, 30 Mar 2024, 02:04 Mark Hatle,<br>
&gt; &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org" target=3D"_blank=
">mark.hatle@kernel.crashing.org</a>&gt; wrote:<br>
&gt; &gt; I know this request is a week or so old..<br>
&gt; &gt; <br>
&gt; &gt; But do NOT upgrade to &#39;xz&#39; 5.6.0 or 5.6.1.=C2=A0 It has b=
een<br>
&gt; &gt; compromised:<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://www.openwall.com/lists/oss-security/2024/03/29=
/4" rel=3D"noreferrer" target=3D"_blank">https://www.openwall.com/lists/oss=
-security/2024/03/29/4</a><br>
&gt; &gt; <br>
&gt; &gt; --Mark<br>
<br>
We&#39;re not going to. The upgrade was already dropped after it failed<br>
build testing. I do wonder why it failed.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/48/build=
s/8737" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/48/builds/8737</a><br>
<br>
I&#39;ve ensured the sources were removed from our mirrors too.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#197649): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/197649" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/197649</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105226831/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/105226831/1686489</a><br>
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

--000000000000416e850614e03a15--

