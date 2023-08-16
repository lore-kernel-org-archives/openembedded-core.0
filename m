Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46767C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 09:56:58 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.157454.1692179816276176503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 02:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BkQnr4Oa;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-76d74dcdf67so3002385a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 02:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692179815; x=1692784615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rpgx9n1vIDu1V1AhkS5lgqp6PN9tIB9LoThUUHeKlkk=;
        b=BkQnr4Oa3a4SlsHJqdUBlPgepp6jFOL3LRFqc6zCB2nyKlC9RXl1wg26Rzv/gD2Rx0
         swtzKe09vgjkFkV2jHf+vxhMBR+frMFEbzBRQhFOVuQNikLwijywj6sPDOMbYo3ShcDd
         rpvunlFKIgdzGzHKv8zwXHxWRDHPgXPI6YBUPPZ8TCNAHp71XHT04pm28s4FY/tTwkON
         M8TeDJ8PPH+XPdTD2ET7rkuqfTZvaF7O/2vYhNEhqGazs/db4ivPfPe5kxpQJ1DEzAEz
         OszcEbiSAcA8nnUjOM21PN7jz/LXYWwT3Z/qfL2p6G2dYbZx+39lpS2nvnKKpIf7rm8a
         dd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692179815; x=1692784615;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpgx9n1vIDu1V1AhkS5lgqp6PN9tIB9LoThUUHeKlkk=;
        b=CkbT/c0puLnlRfataTH6FVZ4kvQ+N1XzgGwyABZCimnj8p0b4U54OPwoyPE4MYZ9nE
         piXOJeFJ0q7c6OkYELnkg9nPks8o8Cl+CgNupmlRSAH98k/RjXrpNGSIsxhMjWP+/YSB
         FduNTFGcQhRBEd39CF7NRYJywcyzYpwqZOD/vOMJJsefazS1kXzDkArjBS/vqAfbx6UQ
         VkL+OOj3z11fckWVM/cIF2HgpuJFboimNljXhIgRRBGbgRF4FfCoQmaGW6T1CVaffq+K
         4iEf9yU7MQ/DaJHDNrF0V6057VXJvauynqpRpgG+7N2CmwQJ9gqg4TtOD65T2PC5ozj+
         fAPw==
X-Gm-Message-State: AOJu0YyyBoO8oX81X7x1ABa1/3L9NhpBhySS2+ccmwo/cCiEGon/Yf78
	KbQQ11qUCwfIWuUYegfaagKJVIrvMwfgYzZSIbQ=
X-Google-Smtp-Source: AGHT+IGpnW1rOwqI2pgRenum0ZKjS05TgPTyAPH7eAVtZq9Y4A4RZ5zoeuUmhXAnrKqIZtm6kd37X50sI98iJzJtS1c=
X-Received: by 2002:a05:620a:25cb:b0:76c:f50b:effe with SMTP id
 y11-20020a05620a25cb00b0076cf50beffemr1696476qko.34.1692179815215; Wed, 16
 Aug 2023 02:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692164369.git.frederic.martinsons@gmail.com>
 <88f884f675d3362b5c5fe3daae0965273f41fe63.1692164369.git.frederic.martinsons@gmail.com>
 <55f80b2075971da2f3c33f5de24ffde2f6813d1f.camel@linuxfoundation.org>
In-Reply-To: <55f80b2075971da2f3c33f5de24ffde2f6813d1f.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 16 Aug 2023 11:56:44 +0200
Message-ID: <CA+cAkeq57Q-YPYN-M=9NMj4+rLV6Zzsvx-G5jnA3MqKo_M62KA@mail.gmail.com>
Subject: Re: [OE-core] [PATHCH V4 1/4] rust: add cargo-c native recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c838b506030750d1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 09:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186121

--000000000000c838b506030750d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 16 ao=C3=BBt 2023, 11:23, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Wed, 2023-08-16 at 07:41 +0200, Frederic Martinsons wrote:
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > This package make it easier to generate C/C++ ABI compatible
> > header, library and also generate package config file.
> >
> > It is built around cbindgen (https://github.com/mozilla/cbindgen)
> > for the header generation, it compiles the library (static or dynamic)
> > through cargo and finally handle the generation of a custom
> > package config file.
> >
> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc      |    1 +
> >  meta/recipes-devtools/rust/cargo-c-crates.inc |  453 ++++
> >  .../rust/cargo-c-native_0.9.18.bb             |   23 +
> >  .../rust/files/0001-Add-Cargo.lock-file.patch | 2180 +++++++++++++++++
> >  4 files changed, 2657 insertions(+)
> >  create mode 100644 meta/recipes-devtools/rust/cargo-c-crates.inc
> >  create mode 100644 meta/recipes-devtools/rust/cargo-c-native_0.9.18.bb
> >  create mode 100644
> meta/recipes-devtools/rust/files/0001-Add-Cargo.lock-file.patch
>
> Should 0001-Add-Cargo.lock-file.patch be here?
>

Hello Richard,

What do you mean? The file 0001-Add-Cargo.lock-file.patch is  present.
By re reading it though, there is a wrong signed off , will correct that in
a v5

Maybe I missed your point though, sorry if I misunderstood your question,
can you tell me more?


> Cheers,
>
> Richard
>

--000000000000c838b506030750d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le mer. 16 ao=C3=BBt 2023, 11:23, Ric=
hard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" targe=
t=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On Wed, 2023-08-16 at 07:41 +0200,=
 Frederic Martinsons wrote:<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" rel=3D"noreferrer" target=3D"_blank">frederic.martinsons@gmail.com=
</a>&gt;<br>
&gt; <br>
&gt; This package make it easier to generate C/C++ ABI compatible<br>
&gt; header, library and also generate package config file.<br>
&gt; <br>
&gt; It is built around cbindgen (<a href=3D"https://github.com/mozilla/cbi=
ndgen" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/m=
ozilla/cbindgen</a>)<br>
&gt; for the header generation, it compiles the library (static or dynamic)=
<br>
&gt; through cargo and finally handle the generation of a custom<br>
&gt; package config file.<br>
&gt; <br>
&gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" rel=3D"noreferrer" target=3D"_blank">frederic.martinsons@=
gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 1 +<br>
&gt;=C2=A0 meta/recipes-devtools/rust/cargo-c-crates.inc |=C2=A0 453 ++++<b=
r>
&gt;=C2=A0 .../rust/<a href=3D"http://cargo-c-native_0.9.18.bb" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">cargo-c-native_0.9.18.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A023 +<br>
&gt;=C2=A0 .../rust/files/0001-Add-Cargo.lock-file.patch | 2180 +++++++++++=
++++++<br>
&gt;=C2=A0 4 files changed, 2657 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/rust/cargo-c-crates.inc=
<br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/rust/<a href=3D"http://=
cargo-c-native_0.9.18.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">c=
argo-c-native_0.9.18.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/rust/files/0001-Add-Car=
go.lock-file.patch<br>
<br>
Should 0001-Add-Cargo.lock-file.patch be here?<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Hello Richard,=C2=A0</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">What do you mean? The file 0001-=
Add-Cargo.lock-file.patch is=C2=A0 present.=C2=A0</div><div>By re reading i=
t though, there is a wrong signed off , will correct that in a v5</div><div=
><br></div><div dir=3D"auto">Maybe I missed your point though, sorry if I m=
isunderstood your question, can you tell me more?=C2=A0</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div></div>
</div>

--000000000000c838b506030750d1--

