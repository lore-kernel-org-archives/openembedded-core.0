Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42FEC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 17:49:22 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web12.10590.1637171362085541590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:49:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HtdFfcE7;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id i6so7704451uae.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 09:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tgVNjDvS5sUI8kUh1F+coPA+gG4osvVqoayHz4X3eQw=;
        b=HtdFfcE7y0XF/d9LGx0xRIK9p4zg164p2FvUPDBOIVKKzWdnrNvrqsrW9dkv+HzhrE
         i8uLm57osr6orowGRc/VzZdsrOgiokUN5Y51UJnYYgkWnwOillY8oSSZT/7A0SHA5wap
         +CPWtjQmLv6wOTCstR4hGIYg+PhBFFawqtS6o8AsEhUx3sTy7iu2sfUuAlNqXNXxfoVZ
         P7L1ZavAXK5/aTT6AIeh7jyyervB9ioPJf4HlJE+eQI4DnQwTADto1u9j4w5sGnHLJAH
         PrwSi73MBXflIxR5ebyAkm2uSCF9/cEs8aIb6oPGTNOdkPrp9a+itdz3gqOuPp07OmlR
         OHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tgVNjDvS5sUI8kUh1F+coPA+gG4osvVqoayHz4X3eQw=;
        b=KVdoXqy3rIYZa+z24/IcwbHTJtFsT90rMjlR82nMGn1fJX1owvbb7yH3ZYGYpUUZ9Q
         UNTgsXxNx5HlIIPx8/fOssEA83RHbY9/bYh/NlG748adY0iT7Hx+cW+fmeokHKcTdnqP
         yo7CUARkrvTL+L1liRMrmcAvizj6UVr7b6c/arajao5eiaJmrb8fcxVpqVB0Qyw3PFHV
         4F+gHBt8X3EPkWs8eRh60aEV3vudVWJM3O5kfuXUMwr64zRyfZ71v744kb5giffLNGTj
         10rkUcnqjSr8KsWYNsj3Y5p0tGQGUYXIV+bLlEZJWYNTWMJVmGPpAxKmVOJ0dHDc3gqR
         b1bQ==
X-Gm-Message-State: AOAM532MmwdkgmARRrn+a+Meh6N4aK5kuRmajcI0P/yyXVat9QP7AwpE
	BncGHLHpiIYBszaRt+L4J3ewTeKATdhDAPL+sZE=
X-Google-Smtp-Source: 
 ABdhPJzMwOBeXK61AxJURiayiAVd2E5h+9m+Bd3amEdpHO1g7G6CHaWCg0co28Ieh7zJNG1/pA6A/lKi2DGyB1g0t5U=
X-Received: by 2002:a05:6102:2c6:: with SMTP id
 h6mr72295153vsh.13.1637171360966;
 Wed, 17 Nov 2021 09:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <CANNYZj-tjH20-ocHq_7DWC6qaPA0XhKfk4cGXMPNbs-_YXp8jg@mail.gmail.com>
 <510650712bc36f761fc9c43d47a1761bc4d60366.camel@gmail.com>
 <CANNYZj_1r4Gj_CwBE7Rrr3NedxH9saVQeEuu1mpBFx9A=stDGQ@mail.gmail.com>
 <fe49ca32907173d954160ead0c714eaa654a3ae5.camel@gmail.com>
 <CANNYZj9BTbgsZznvdiP3Fhcc9Wwmb_5F3AnZ1gGyS0TKnv6gqQ@mail.gmail.com>
 <58f4aeaccff5aa6cc9b92144e20cc1831d503f99.camel@gmail.com>
In-Reply-To: <58f4aeaccff5aa6cc9b92144e20cc1831d503f99.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Nov 2021 18:49:09 +0100
Message-ID: 
 <CANNYZj_KSZ2GkKdiZZfpzDbq3z8mFPNNU=_SZdjZYtWpZarxFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/8] systemd: allow building for nativesdk
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 paul.eggleton@microsoft.com
Content-Type: multipart/alternative; boundary="000000000000682bfb05d0ffa9b5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 17:49:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158446

--000000000000682bfb05d0ffa9b5
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Nov 2021 at 18:41, Luca Boccassi <luca.boccassi@gmail.com> wrote:

> > This is packaging the tool for the target images; what I propose is
> > that it's built and used natively.
>
> Which is what this patchset does? Again you can't build these recipes
> to run locally without these changes, that's the entire point
>

This patchset allows systemd binaries to be used in SDKs; what I would like
to see is that those binaries are built and used directly in yocto builds.
E.g. systemd recipe gains BBCLASSEXTEND = "native", systemd.bbclass gets
DEPENDS = "systemd-native" and then uses the native systemd binaries in the
same way you want to use them in your private SDK-based pipelines.

Alex

--000000000000682bfb05d0ffa9b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 17 Nov 2021 at 18:41, Luca Boccassi &lt;<a href=3D"mailto:lu=
ca.boccassi@gmail.com">luca.boccassi@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">&gt; This is packaging the to=
ol for the target images; what I propose is<br>
&gt; that it&#39;s built and used natively.<br>
<br>
Which is what this patchset does? Again you can&#39;t build these recipes<b=
r>
to run locally without these changes, that&#39;s the entire point<br></bloc=
kquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote=
">This patchset allows systemd binaries to be used in SDKs; what I would li=
ke to see is that those binaries are built and used directly in yocto build=
s. E.g. systemd recipe gains BBCLASSEXTEND =3D &quot;native&quot;, systemd.=
bbclass gets DEPENDS =3D &quot;systemd-native&quot; and then uses the nativ=
e systemd binaries in the same way you want to use them in your private SDK=
-based pipelines. <br></div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">Alex<br></div></div>

--000000000000682bfb05d0ffa9b5--

