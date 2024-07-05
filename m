Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9426C38150
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 15:25:38 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.19367.1720193134549345550
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 08:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YF1rXa//;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so22374281fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 08:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720193133; x=1720797933; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GxdElLUN9eQVNxZ1szS+zgXNOD3zQDH2xjPSdZNTZaQ=;
        b=YF1rXa//JnA3gaSTWmizf+tW2ZRNUzo7VhyRg95W8U127IpG4OPbWh3/2/Fq/lrXme
         CTZ/zo7RlQ+Lqi/gOoW1DH7SHAUL3LWxL0PIgSu8no3Gam0rz9yGysR6U2iod0xROvae
         h+lh7VZpQgEL4yby2yNkC9XnShWF9U8zkSOnbAMamNvHN4s2ITk3wVE+dEnOBivsC93t
         Pn1CauwVagoljJRXkq96Egn+D8qp4LDxZ4qdmson6X4jtoZddq8T4VAGPpucE3QJ+qnK
         JozgW4/HHrG/dmPSGa623itnJOYFMxlHPwVzfBeKiB9G+tcEWlhn9HTBluGbt3VS2l4u
         CWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720193133; x=1720797933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxdElLUN9eQVNxZ1szS+zgXNOD3zQDH2xjPSdZNTZaQ=;
        b=gRqOVd+pF+cpCJrI9BhU2CTTLTsR5MupNh1G1+czZNzIpceg1SUQO+ozMvHG2qA7oO
         M9B740gP5SbmKUn9bO7AmgqKoz6RUUOQYDXkpipCPaNMb6J+RSR+A76tDNbIX7kNVp8S
         taLBDMDYeRSlcVud8k01PHnWTK1zqLllh9zYlWRP3XlLoYiStOe1BC/Btxfa5AoPg9oL
         f2qB0sf8/+1KBy8wcN1poxn75QdLT1JoHFP38tp8imlPNbkHhz6tOpOF6mtjeRAq3ZNB
         XKqQ3Cep8Q8yT9LVyizAOse03Ze+4uMmn6JBjBs3bqRaRp25sC8hbLc6Ja3mbjURwzZz
         lBQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWej0vjToBEJOyN1tFpua2pp3vmmY4DOay3yejtFi56aaCe1SjZ15jyfjnMCLEY+jDf3tesrnosbUwQ9SyVGVh2SCV7qKVQLMESuzimMjBQSJxFw8+RQMeQ
X-Gm-Message-State: AOJu0YyIF9l94e+oPAFS2xLx+q49lY4yU+8cg0nS9X2AAD+GpSt6OLYU
	XZTAIS89+leJ+UkFEqarnWkbm3ZFZClJBfi2IqLwB2NFH3YXUePVosoO07ALP7FWCikHWqjbNpt
	QCkilJqc2b1pDuls4NlA52r+RMTE=
X-Google-Smtp-Source: AGHT+IETlir/NSE76kqF7ZFcRldBky69QdBT7FKt5S7YQc6CtqHRhGvwt8WCtbNDNQUywH3mTz16wIsB7e4i8XCIsUg=
X-Received: by 2002:a2e:884f:0:b0:2ee:8d81:5a8d with SMTP id
 38308e7fff4ca-2ee8edf128fmr33637031fa.48.1720193132316; Fri, 05 Jul 2024
 08:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <2e75c6169cac05273b3edde52ea820506ce9d3fe.camel@linuxfoundation.org>
 <CANNYZj_LwCwmX+aKDDEYijMLuEehiUDJbMKcFvwtpM_rQAcxhA@mail.gmail.com>
 <4f2d2a18-77cd-45aa-a419-6f4f3f82da89@windriver.com> <dc35d986-755e-482a-b957-969b08e14534@windriver.com>
In-Reply-To: <dc35d986-755e-482a-b957-969b08e14534@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Jul 2024 17:25:20 +0200
Message-ID: <CANNYZj_fJbN94ty+Y6n78Tmgh8-35Wk8TuuqruVVtszrx1Mk-A@mail.gmail.com>
Subject: Re: [OE-core] Rust reproducibility issue summary
To: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"Shinde, Yash" <Yash.Shinde@windriver.com>, Randy MacLeod <Randy.MacLeod@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000098d21f061c81acad"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 15:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201613

--00000000000098d21f061c81acad
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Jun 2024 at 09:08, Sundeep KOKKONDA <
Sundeep.Kokkonda@windriver.com> wrote:

> Further analysis on autobuilder binaries shows that the deviations are
> similar to that of earlier *rustdoc *issue. The deviations are in
> .llvm.<hash> suffixes.
>
> As discussed in issue
> <https://internals.rust-lang.org/t/rustdoc-binary-is-not-reproducible/20027>,
> may be we should check by disabling PGO (by default it is enabled and as in comment
> the PGO profile generation is not deterministic...).
>

After reading the issue and poking at the rustdoc binaries on my local
disk, I think the key is in finding where those llvm.<hash> suffixes are
generated and *how*. Something (presumably rust-llvm) puts them there, so
narrowing down to the point where that non-reproducible value is decided
would help a lot in finding out why it sometimes changes. It does require
navigating and reading a mountain of unfamiliar llvm code, this is what
makes the issue difficult.

Alex

--00000000000098d21f061c81acad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Mon, 3 Jun 2024 at 09:08, Sundeep KOKKONDA &lt;<a href=3D"mailto:=
Sundeep.Kokkonda@windriver.com">Sundeep.Kokkonda@windriver.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>Further analysis on autobuilder binaries shows that the
      deviations are similar to that of earlier <i>rustdoc </i>issue.
      The deviations are in <code>.llvm.&lt;hash&gt;</code> suffixes. <br>
   =20
    <p>As discussed in <a href=3D"https://internals.rust-lang.org/t/rustdoc=
-binary-is-not-reproducible/20027" target=3D"_blank">issue</a>,
      may be we should check by disabling PGO (by default it is enabled
      and as in <a>comment
      </a>the PGO profile generation is not deterministic...). <br></p></di=
v></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">After reading the issue and poking at the rustdoc binaries on my =
local disk, I think the key is in finding where those llvm.&lt;hash&gt; suf=
fixes are generated and *how*. Something (presumably rust-llvm) puts them t=
here, so narrowing down to the point where that non-reproducible value is d=
ecided would help a lot in finding out why it sometimes changes. It does re=
quire navigating and reading a mountain of unfamiliar llvm code, this is wh=
at makes the issue difficult.<br></div><div class=3D"gmail_quote"><br></div=
><div class=3D"gmail_quote">Alex<br></div></div>

--00000000000098d21f061c81acad--

