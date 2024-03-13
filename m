Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61124C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 14:45:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.18709.1710341114777138625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 07:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=dCI8i2CR;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.128.42, mailfrom: troth@openavr.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-413ebe077d6so3497415e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1710341113; x=1710945913; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/+f1n64k6/GDfIM43ty4vQNX0+xf5aJOBwfzb0rbPRY=;
        b=dCI8i2CRUVVlWKouHZdEAwlSC6zckdB4SsBEcyxVGVFDFwgrk+75wed4Rq1dyg0meF
         cyjQ7Gv8BQjdZAI+zmrxuV76P0WVZdDc3HW1vOfjfiHmsduc5H4maZG5WNenVXs0XYcZ
         s38HUEjPki5xYv033rdR9RWfAu0fFjCfcgvCLoiLsGW0Nm9SK3xBXDTPkTdpzTlq0BqM
         jygiXLDXVIRJypA97fNVUClz41Fjmq2DU6a+vmdNO7DkTuUCpc3EhCmzyD6qgLjKCMQt
         wosFiMql7KYuPMg8Xc2Tp9nsnzW224NvFekXFiKvWmko/bV6JqrzDq/q75dMXerTIvmI
         hjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710341113; x=1710945913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+f1n64k6/GDfIM43ty4vQNX0+xf5aJOBwfzb0rbPRY=;
        b=iE6E0tTRXaMqno9gOqe7PuJF47AEF3BmVOGwCXwHgnoHIOXwh8BpqCry1LgD+FqnDz
         60DkANckzXgqHAMErH4aXC38E1H9hKzyWYdGk9KWLmefHi6fxnnS5/I8dGocN25099SW
         VWrAhsfjvbpthYoIwn2TwHjSqxXpz5LsVzz3fZtMvx6h7ubefXt1UMh1WnFRcpWzAdkp
         lEXRp43EhqYUs/tIVk6Uqf7M3v7icbR0QR6Q0FEhQO2+B7rN4VomtfjW/2RT/X+RvWIK
         /1n9vjZ60ch0DePzPZWXzm/JErY/iR7i3iZUUKc8BEe9LeDd62hkY+0sfWV6RrYOAG+w
         fWNQ==
X-Gm-Message-State: AOJu0YyumgsY5eyGjrKJuxGfQ1YHUzfgNa/B2KtoP6k7U5i46qQ3JBTj
	sb5xZVP6TW+0KESgoFUdf97uuojfdRaWEZluQ+fPpogKCM57J2zFpygQQEt7YM4Ir8vL2FD1A9K
	b6f34v4Orj/X8IUDDjopbNdtx1IX4AQDBj3tnpA==
X-Google-Smtp-Source: AGHT+IEZr5GbM+/nhkccd8eyJmevsDIlUON/qcKFq0+c8v4S3mnMKLqcjmcNx+CYvqu0U2tPfBbWxt5d2M/ugvvXBcU=
X-Received: by 2002:adf:f70f:0:b0:33e:71b6:bccf with SMTP id
 r15-20020adff70f000000b0033e71b6bccfmr1797124wrp.36.1710341112823; Wed, 13
 Mar 2024 07:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240306154151.3741709-1-alex@linutronix.de> <20240306154151.3741709-35-alex@linutronix.de>
 <CAFMvBt0onfsJ3BtzcEn87P4G3g+LQbrg2=f9eEexE80VO2TFPg@mail.gmail.com> <CANNYZj-jM1Uj4XW=58F9sbX3r5bST9iqT7L5hmvRs6XxOmELRw@mail.gmail.com>
In-Reply-To: <CANNYZj-jM1Uj4XW=58F9sbX3r5bST9iqT7L5hmvRs6XxOmELRw@mail.gmail.com>
From: "Theodore A. Roth" <troth@openavr.org>
Date: Wed, 13 Mar 2024 08:45:01 -0600
Message-ID: <CAFMvBt0xxWt6=q-8EDq=oMiQv95eCXy_PTARx_JQznOV8hKsUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 35/47] python3-jsonschema: upgrade 4.17.3 ->
 4.21.1 and add new dependencies
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>, Tim Orling <tim.orling@konsulko.com>
Content-Type: multipart/alternative; boundary="00000000000079a24006138bd2d0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 14:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197044

--00000000000079a24006138bd2d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 12:53=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> On Tue, 12 Mar 2024 at 19:55, Theodore A. Roth <troth@openavr.org> wrote:
>
> > Any help or things to try would be appreciated. More than happy to
> provide more information if needed.
>
> Maturin support is fairly new, and rpds is the first real consumer in
> oe-core, so issues like this can happen. You need to find out how it
> forms the installation file name, and then find out how python forms
> the filename it expects, and see where the mismatch is coming from.
> Yes it's not simple and requires advanced, intuitive ability to read
> large, unfamiliar code trees, something that everyone working with
> yocto should possess. We already map architectures in various rust
> pieces, e.g. rust-target-config class, so probably something like that
> should be done in maturin builds too.
>
> Alex
>

Making the following change (via a patch in a .bbappend) to the rpds
Cargo.toml file fixed the import problem for me.

Do not know if this problem is specific to our environment or not at this
point.

Ted Roth

diff --git a/Cargo.toml b/Cargo.toml
index 78ac37f..c1f2ccd 100644
--- a/Cargo.toml
+++ b/Cargo.toml
@@ -13,4 +13,4 @@ archery =3D "1.1.0"

 [dependencies.pyo3]
 version =3D "0.20.2"
-features =3D ["extension-module"]
+features =3D ["extension-module", "abi3-py37"]

--00000000000079a24006138bd2d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Mar 13, 2024 at 12:53=E2=80=AFAM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 12 Mar 2=
024 at 19:55, Theodore A. Roth &lt;<a href=3D"mailto:troth@openavr.org" tar=
get=3D"_blank">troth@openavr.org</a>&gt; wrote:<br>
<br>
&gt; Any help or things to try would be appreciated. More than happy to pro=
vide more information if needed.<br>
<br>
Maturin support is fairly new, and rpds is the first real consumer in<br>
oe-core, so issues like this can happen. You need to find out how it<br>
forms the installation file name, and then find out how python forms<br>
the filename it expects, and see where the mismatch is coming from.<br>
Yes it&#39;s not simple and requires advanced, intuitive ability to read<br=
>
large, unfamiliar code trees, something that everyone working with<br>
yocto should possess. We already map architectures in various rust<br>
pieces, e.g. rust-target-config class, so probably something like that<br>
should be done in maturin builds too.<br>
<br>
Alex<br></blockquote><div><br></div><div>Making the following change (via a=
 patch in a .bbappend) to the rpds Cargo.toml file fixed the import problem=
 for me.</div><div><br></div><div>Do not know if this problem is specific t=
o our environment or not at this point.<br></div><div><br></div><div>Ted Ro=
th<br></div><div><br> diff --git a/Cargo.toml b/Cargo.toml<br>index 78ac37f=
..c1f2ccd 100644<br>--- a/Cargo.toml<br>+++ b/Cargo.toml<br>@@ -13,4 +13,4 =
@@ archery =3D &quot;1.1.0&quot;<br>=C2=A0<br>=C2=A0[dependencies.pyo3]<br>=
=C2=A0version =3D &quot;0.20.2&quot;<br>-features =3D [&quot;extension-modu=
le&quot;]<br>+features =3D [&quot;extension-module&quot;, &quot;abi3-py37&q=
uot;]</div></div></div>

--00000000000079a24006138bd2d0--

