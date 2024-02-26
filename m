Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A544AC48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 14:56:40 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.22158.1708959394766755688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 06:56:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WQUWu4LX;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d21a68dd3bso42559261fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 06:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708959393; x=1709564193; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H1hjOi/0TaS5bkL4J3hjuSw5JqEa2K1EN8pmZHmP/uY=;
        b=WQUWu4LXDdvXtNasoVx2+fyESVJScTiLoho+njND6ri1eMacqMpJIjmJdDMP3/22v+
         0gOcqqFFjaE/Yl8gNA8LuT+XT5K0QqfU9DUx0p/BujBkCZdKUxsf+K+rk7zXDn6eJatL
         TgOJ/keLPmGDemu3eppQwQus04gXw3Ykce8jAlWc+oxbKEIUFDB21IsM7+I4qVKQBKoH
         4cuZa4PJr4E5goqaLIMVooYsBu9nTPzsiCKpIQrx6jAQxJOeROL1XgDED/uYlDd3Vuoa
         I1zhpUePiiN6uCExLchSj1sESAS6tlJzbXQ8qsInGQInA2I24quSfDWQuPlTiCyHabaJ
         317Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708959393; x=1709564193;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1hjOi/0TaS5bkL4J3hjuSw5JqEa2K1EN8pmZHmP/uY=;
        b=gsjbS1npnRria84gzIPpQnYIh1LNMbS1r/oPxFWv5mAEESw4NlZD6BynEbI+4CP7yD
         gdMiheqK7CQVbszxXl0QUcALqCzs9aCbMqGq2ZtTEfl+A2y9b26pzduEm5292ys8xBZS
         AFAUdBy4scV0h2ChPXVha/1v18Hpm+wcGjY65ce31Y5acCUJATtEM70Fy19eb52CBd7a
         rX1H0Jr4q9ymJKwWERmIhQPiEpnwt0+tJpNNBkCA5maAvrWICMrKTnGtV355hpcHt/Ey
         GU7fRRwVRHCem7zXnkkbGpzWF9iRpfAgDAXnsDltttuPbR+ntT8iKZPlGMRFn2yJpK/7
         FHYA==
X-Gm-Message-State: AOJu0Yyl7AJ+QoNUigHq/Cenpnwr5SOwQFHJ3VYHO5Dtqww7w50AX6J4
	9aDv7LOeGdetqO2MKGXNlDo17/XYbzUoHs3xwrXwUJqRx1573LO+X2jzki1sqX90wxiV70b03z7
	iis/+PPZ/U2zpPFoo6wDmDMR3faQ=
X-Google-Smtp-Source: AGHT+IHNufLRePKuzuQumd9XOOv5PsNjpXJj5cvRtrlihTH7zMeA5jsuKH5mPqTAgE4mLLUxx4q96gyBivPlmY/O47M=
X-Received: by 2002:a2e:86cf:0:b0:2d2:50bc:99d6 with SMTP id
 n15-20020a2e86cf000000b002d250bc99d6mr4712326ljj.35.1708959392873; Mon, 26
 Feb 2024 06:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20240226142855.2687016-1-martin.jansa@gmail.com>
 <CANNYZj9M9TGYGvEN0sZOpYYQ1-PVk3gnehR_zh_c9Ue4mEv8hQ@mail.gmail.com> <CA+chaQfK6Pji904PR-Zfn39E9cnEV-Zfa4i5UxoPv98ic2v5-A@mail.gmail.com>
In-Reply-To: <CA+chaQfK6Pji904PR-Zfn39E9cnEV-Zfa4i5UxoPv98ic2v5-A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Feb 2024 15:56:21 +0100
Message-ID: <CANNYZj8Rgj+mOHhYKGT3=iFBZWb9dYXkQtM2EAH9hmQZLtxbpQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] rpm: add PACKAGECONFIG for openmp and
 disable it by default for native builds
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008c41fb06124a1dc6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 14:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196214

--0000000000008c41fb06124a1dc6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just the option, preserving existing behavior please.

Alex

On Mon 26. Feb 2024 at 15.47, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Feb 26, 2024 at 3:39=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This needs to be handled with care. We rely heavily on openmp support i=
n
> rpm to speed up rpm operations; adding an option to turn it off is okay,
> but actually turning it off is not.
>
> That's why it was sent only as RFC, do you want me to re-send v2 RFC
> with keeping it enabled for native builds or should I wait for more
> (unlikely) feedback from others? When explicitly enabled for native it
> might start failing on hosts without openmp (where it was autodetected
> as disabled until now).
>
> I use package_ipk, so from rpm-native I'm using only the rpmdeps.
>
> This can surely wait for styhead release (as I'm probably the only one
> seeing this issue and only with experimental profile).
>

--0000000000008c41fb06124a1dc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Just the option, preserving existing behavior please.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon 26. Feb 202=
4 at 15.47, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">mart=
in.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">On Mon, Feb 26,=
 2024 at 3:39=E2=80=AFPM Alexander Kanavin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This needs to be handled with care. We rely heavily on openmp support =
in rpm to speed up rpm operations; adding an option to turn it off is okay,=
 but actually turning it off is not.<br>
<br>
That&#39;s why it was sent only as RFC, do you want me to re-send v2 RFC<br=
>
with keeping it enabled for native builds or should I wait for more<br>
(unlikely) feedback from others? When explicitly enabled for native it<br>
might start failing on hosts without openmp (where it was autodetected<br>
as disabled until now).<br>
<br>
I use package_ipk, so from rpm-native I&#39;m using only the rpmdeps.<br>
<br>
This can surely wait for styhead release (as I&#39;m probably the only one<=
br>
seeing this issue and only with experimental profile).<br>
</blockquote></div></div>

--0000000000008c41fb06124a1dc6--

