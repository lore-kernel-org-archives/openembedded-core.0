Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA7AC54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 09:35:21 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.20501.1709199319355131440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 01:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cedWg8Fn;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-47277f4db4bso204901137.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 01:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709199318; x=1709804118; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8/HTH2vR2XNxpY9yUyUj/RSBA2WLgR/1J9h/TmzZxCg=;
        b=cedWg8FnIst6Ls2x9tV2xTNuFGqNSYTeoDWQphoSj4Pz6bGWhxG8+URrueuuElUPW9
         kDODR6D2yvVREqvSF+elFqQzmZ93ANQGlEKNu1shRd5r4PS+ayUJC1EYpyNDERGjNBkX
         m8YIXbIqB9EFWTNMegdkGQcC1dDM2SY0LVrmfuHJKHArP8pPJ3q4KnQ/Jk6CPcEGr4Ow
         M2rDBdjZc9IAA9BurfyBqK9fTy1NwoysWf8s+UyhpkLa6U7ZPoyd5NdQtE67hbjlZrYN
         +2GyZKjQx9A03CDPsrkQos/1uDJotIJsLEl0yad3/s219oOwWSjKxXjhR+b+C64C1wuo
         whkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199318; x=1709804118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/HTH2vR2XNxpY9yUyUj/RSBA2WLgR/1J9h/TmzZxCg=;
        b=iaXNSS6dHJLeHyaVgZKozp+BBZdxwcMG6FhWujD4EytJI3SJWY16e0n+uRmUnB4GfP
         GxS+bHkon692ITbw07P/RGFmacNHj5SeJPTXDPLPJieO0D4Vvu5YVoyIP5KxOOsM4Jmp
         Nn/qCVXltFxUNQPyHSVjRVtOQYJpUlhXzFezyTjPfhbGRk5RvA3Dbq1TkVMNjWxouyU0
         a9RDnMQpvuHY1qv1BoLjR98ZapiN/8wzeocJdjVEIRd6doywwM7ccA94mRM6iMunQ8on
         QmBPzbn8f7vQEbWhi7WFOyHeNJD0h6f0xENnbNM3TC1BEtUA951xaog9gHOsGPa+6Ywc
         cB+A==
X-Forwarded-Encrypted: i=1; AJvYcCUx9p05JtXibUVHNXbzLFN/efEmaEE+Ii9x7zXy5GtNLtjxJfLaGTz7tmtft1Pqq2+aNhar999ykTEYqdnozPKHgI/em8OFPzSVxj09LqD29TxT7q7ZmFxu
X-Gm-Message-State: AOJu0YxPKG0En7f9DXklq/6cYY6QN/fLRQd9/OvQMKVVqtBz9rVnE6/U
	INVSaaC1RAyhGbMe6vkLLw/H8CeIYa1iFcI/QIY6i+PA4993TWgH98FJ11I9JyMbiJA3QPfWxuO
	o7Ov/M7sdBUW3ebctOShpDi96z+8=
X-Google-Smtp-Source: AGHT+IGow7F0ojKhH371GaWa5ZbK/BoS5P+LDlsH+Ng+9TwYYejoFs1k+VnSsXAxf8eE4tvt9l7015LHxIcuGtVxfD0=
X-Received: by 2002:a67:f70e:0:b0:46d:34fe:65af with SMTP id
 m14-20020a67f70e000000b0046d34fe65afmr1188503vso.21.1709199318293; Thu, 29
 Feb 2024 01:35:18 -0800 (PST)
MIME-Version: 1.0
References: <20240228183011.1495807-1-jose.quaresma@foundries.io>
 <CAMKF1sqZc2HR=iWKjDHQAVHHxTfXKv0DqcbHZr+-akTSvU24eA@mail.gmail.com> <e9a42854ce1e115e6f82088ae873f984a182596a.camel@linuxfoundation.org>
In-Reply-To: <e9a42854ce1e115e6f82088ae873f984a182596a.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 29 Feb 2024 09:35:07 +0000
Message-ID: <CANPvuRksrxwRx8kLH3ZP0AWpTT+zuaye3hm0K=ZZXtPoPy0Q-A@mail.gmail.com>
Subject: Re: [OE-core] [RFC OE-core][PATCH v2 1/7] go: rework patch to avoid identation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000037a3c4061281fab5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 09:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196423

--00000000000037a3c4061281fab5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (quinta,
29/02/2024 =C3=A0(s) 08:18):

> On Wed, 2024-02-28 at 21:16 -0800, Khem Raj wrote:
> > Fails to compile bunch of  recipes using go e.g. influxdb, crucible,
> > syzkaller in meta-oe see
> >
> >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3667/st=
eps/15/logs/stdio
>
> Also fails for oe-selftest:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6415/st=
eps/14/logs/stdio
>
> and on arm hosts:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7999/st=
eps/13/logs/stdio



Thanks for testing, I will take a look on all of this today.

Jose


>
>
> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000037a3c4061281fab5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu (quinta, 29/02/2024 =C3=A0(s) 08:18):<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Wed, 2024-02-28 at 21:16 -0800, Khem =
Raj wrote:<br>
&gt; Fails to compile bunch of=C2=A0 recipes using go e.g. influxdb, crucib=
le,<br>
&gt; syzkaller in meta-oe see<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/=
builds/3667/steps/15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3667/steps/15/=
logs/stdio</a><br>
<br>
Also fails for oe-selftest:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/80/build=
s/6415/steps/14/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6415/steps/14/logs/=
stdio</a><br>
<br>
and on arm hosts:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/97/build=
s/7999/steps/13/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/97/builds/7999/steps/13/logs/=
stdio</a></blockquote><div><br></div><div><br></div><div>Thanks for testing=
, I will take a look on all of this today.</div><div><br></div><div>Jose</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000037a3c4061281fab5--

