Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73555C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 10:04:58 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.157214.1692180291813630546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 03:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eMNYN0R5;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6418c819c3cso28458766d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692180291; x=1692785091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9jweLLPhGiHgyYKX/fcpbJXxY1NwQEkBYDJh9VIHZkg=;
        b=eMNYN0R5+LIHjPjRAiZffSYdS4t1bRUs7tX2LQI/RptbV8kWdG0U94B5sPxmV2V6X4
         8sybaQRazebi4JMihwHYZP4gOyXmZpy5ZtcBo0WeoBTi43RC6f2RjCpHgk7/yvYEfL77
         wJpdEHZolNChmkUQqH6rUkIUXpan7D8jr5FRfut25c2S6kysWPBvrWcfspwmLAekQYcC
         4HP+/oPVxGUsruyvgbjVZUBmZ8HcRw+qYWSzh3iY1Q877yPZv+XWAQhfQIK27BJTnp6+
         1lkalxID+0CcRH5VyRf6cU2wB75Ss4kcYV+jNvM/F9rwt5c5SXWNyZDp2zNBfIKo8rXr
         jrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692180291; x=1692785091;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jweLLPhGiHgyYKX/fcpbJXxY1NwQEkBYDJh9VIHZkg=;
        b=HsyyhNrqwEX/JLyIwbVYpfMcf48msuTHoLc7fKXcPp/WoTUBzaDBOQQK9FQfbib0gv
         NZuvnICbdeQdwmW3h4O2FzbM9XuCQDYTvmb9IiRU49QLCbmqBt4vVZ53wi3Iatyqp1ef
         ua8LCrHNBePxAmWPWsQcrHt8HLZLPsFE/BJ5R15sjHqyhh0FB8L6SvKrubD48o+PiMgq
         ePotGZbaajpjAJUljxwUdwg1omMsWZQ7z0xTKxD5O60m1H15s+V1+YgXL2bc1reHoZUJ
         JWBqgEflyUrb8ZWXQHx9cS/+Z9H8WPbi16WmsXhx2GLkE8Qnd+NzWv8tasFd13Ukdg1y
         U2iw==
X-Gm-Message-State: AOJu0YxSrK3POWi8pRV6/Byf+shrLxGKbFMv29bT2xY8Y9PjhfRyTtF5
	j5XaH2x5wfqVB4aAdAaRNtfYYIw2RGjHpFFPQlspumRj
X-Google-Smtp-Source: AGHT+IHtQtz0rgChBMCmiSmk6DROOqCBbZsq246g0crOas0/dZ0R5Np0VVV0N+xZbQMGyui4Tqf3u4wpfIWgJpjR49k=
X-Received: by 2002:a0c:de13:0:b0:63c:f1d3:f662 with SMTP id
 t19-20020a0cde13000000b0063cf1d3f662mr1413235qvk.0.1692180290683; Wed, 16 Aug
 2023 03:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692164369.git.frederic.martinsons@gmail.com>
 <88f884f675d3362b5c5fe3daae0965273f41fe63.1692164369.git.frederic.martinsons@gmail.com>
 <55f80b2075971da2f3c33f5de24ffde2f6813d1f.camel@linuxfoundation.org>
 <CA+cAkeq57Q-YPYN-M=9NMj4+rLV6Zzsvx-G5jnA3MqKo_M62KA@mail.gmail.com> <420ea1732e9039e0f13840c070417765cd01449d.camel@linuxfoundation.org>
In-Reply-To: <420ea1732e9039e0f13840c070417765cd01449d.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 16 Aug 2023 12:04:39 +0200
Message-ID: <CA+cAkerJ8FM8YgixwEGoN0zA=5f+VZSGZje750wsn7gX0x3TPA@mail.gmail.com>
Subject: Re: [OE-core] [PATHCH V4 1/4] rust: add cargo-c native recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001f494e0603076db1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 10:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186123

--0000000000001f494e0603076db1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 16 ao=C3=BBt 2023, 12:03, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Wed, 2023-08-16 at 11:56 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> >
> >
> > Le mer. 16 ao=C3=BBt 2023, 11:23, Richard Purdie
> > <richard.purdie@linuxfoundation.org> a =C3=A9crit :
> > > On Wed, 2023-08-16 at 07:41 +0200, Frederic Martinsons wrote:
> > > > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > > >
> > > > This package make it easier to generate C/C++ ABI compatible
> > > > header, library and also generate package config file.
> > > >
> > > > It is built around cbindgen (https://github.com/mozilla/cbindgen)
> > > > for the header generation, it compiles the library (static or
> > > > dynamic)
> > > > through cargo and finally handle the generation of a custom
> > > > package config file.
> > > >
> > > > Signed-off-by: Frederic Martinsons
> > > > <frederic.martinsons@gmail.com>
> > > > ---
> > > >   meta/conf/distro/include/maintainers.inc      |    1 +
> > > >   meta/recipes-devtools/rust/cargo-c-crates.inc |  453 ++++
> > > >   .../rust/cargo-c-native_0.9.18.bb             |   23 +
> > > >   .../rust/files/0001-Add-Cargo.lock-file.patch | 2180
> > > > +++++++++++++++++
> > > >   4 files changed, 2657 insertions(+)
> > > >   create mode 100644 meta/recipes-devtools/rust/cargo-c-
> > > > crates.inc
> > > >   create mode 100644 meta/recipes-devtools/rust/cargo-c-
> > > > native_0.9.18.bb
> > > >   create mode 100644 meta/recipes-devtools/rust/files/0001-Add-
> > > > Cargo.lock-file.patch
> > >
> > > Should 0001-Add-Cargo.lock-file.patch be here?
> >
> > Hello Richard,
> >
> > What do you mean? The file 0001-Add-Cargo.lock-file.patch is
> > present.
> > By re reading it though, there is a wrong signed off , will correct
> > that in a v5
> >
> > Maybe I missed your point though, sorry if I misunderstood your
> > question, can you tell me more?
>
> Sorry, I'm getting a little confused as these are all in the rust
> directory and in general you'd assume these patches were for rust
> itself. I appreciate now that in this case it isn't.
>
> What you've done will work but is confusing, can you move it to a
> cargo-c or cargo-c-native directory please?
>

Yes of course, will do right away.

Thanks,
>
> Richard
>
>
>

--0000000000001f494e0603076db1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le mer. 16 ao=C3=BBt 2023, 12:03, Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfo=
undation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">On Wed, 2023-08-16 at 11:56 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrot=
e:<br>
&gt; <br>
&gt; <br>
&gt; Le mer. 16 ao=C3=BBt 2023, 11:23, Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank" rel=3D"noreferrer">richard.purdie@linuxfoundation.org</a>&gt; a =C3=
=A9crit=C2=A0:<br>
&gt; &gt; On Wed, 2023-08-16 at 07:41 +0200, Frederic Martinsons wrote:<br>
&gt; &gt; &gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mar=
tinsons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons=
@gmail.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This package make it easier to generate C/C++ ABI compatible=
<br>
&gt; &gt; &gt; header, library and also generate package config file.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; It is built around cbindgen (<a href=3D"https://github.com/m=
ozilla/cbindgen" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gi=
thub.com/mozilla/cbindgen</a>)<br>
&gt; &gt; &gt; for the header generation, it compiles the library (static o=
r<br>
&gt; &gt; &gt; dynamic)<br>
&gt; &gt; &gt; through cargo and finally handle the generation of a custom<=
br>
&gt; &gt; &gt; package config file.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Frederic Martinsons<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; =C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
&gt; &gt; &gt; =C2=A0 meta/recipes-devtools/rust/cargo-c-crates.inc |=C2=A0=
 453 ++++<br>
&gt; &gt; &gt; =C2=A0 .../rust/<a href=3D"http://cargo-c-native_0.9.18.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">cargo-c-native_0.9.18.bb</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A023 +<br>
&gt; &gt; &gt; =C2=A0 .../rust/files/0001-Add-Cargo.lock-file.patch | 2180<=
br>
&gt; &gt; &gt; +++++++++++++++++<br>
&gt; &gt; &gt; =C2=A0 4 files changed, 2657 insertions(+)<br>
&gt; &gt; &gt; =C2=A0 create mode 100644 meta/recipes-devtools/rust/cargo-c=
-<br>
&gt; &gt; &gt; crates.inc<br>
&gt; &gt; &gt; =C2=A0 create mode 100644 meta/recipes-devtools/rust/cargo-c=
-<br>
&gt; &gt; &gt; <a href=3D"http://native_0.9.18.bb" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">native_0.9.18.bb</a><br>
&gt; &gt; &gt; =C2=A0 create mode 100644 meta/recipes-devtools/rust/files/0=
001-Add-<br>
&gt; &gt; &gt; Cargo.lock-file.patch<br>
&gt; &gt; <br>
&gt; &gt; Should 0001-Add-Cargo.lock-file.patch be here?<br>
&gt; <br>
&gt; Hello Richard,=C2=A0<br>
&gt; <br>
&gt; What do you mean? The file 0001-Add-Cargo.lock-file.patch is=C2=A0<br>
&gt; present.=C2=A0<br>
&gt; By re reading it though, there is a wrong signed off , will correct<br=
>
&gt; that in a v5<br>
&gt; <br>
&gt; Maybe I missed your point though, sorry if I misunderstood your<br>
&gt; question, can you tell me more?=C2=A0<br>
<br>
Sorry, I&#39;m getting a little confused as these are all in the rust<br>
directory and in general you&#39;d assume these patches were for rust<br>
itself.=C2=A0I appreciate now that in this case it isn&#39;t.<br>
<br>
What you&#39;ve done will work but is confusing, can you move it to a<br>
cargo-c or cargo-c-native directory please?<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Yes of course, will do right awa=
y.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
Thanks,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000001f494e0603076db1--

