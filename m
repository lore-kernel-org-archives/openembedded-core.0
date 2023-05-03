Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F4AC77B75
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:32:30 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.17764.1683117145588699756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 05:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@ossystems-com-br.20221208.gappssmtp.com header.s=20221208 header.b=hCeDTrWP;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.182, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-b9e2b26b132so2777293276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20221208.gappssmtp.com; s=20221208; t=1683117144; x=1685709144;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0qZrTsoTI1z9nP7VB+85b8n+Rp/Rq+ktOMCkfWZZpg=;
        b=hCeDTrWPOah9BJxTY8zlAJgfPBaP4L8O1OAksFbinKo5iuu9Yu2iuwK05M5i/82DTu
         kqT1/YbsWUvPuUkaaYkCCnRRDsjSsMSrzbN8HPAXAIiHg76OtL1QW0WKWhtLj9Y5ds+E
         kl1D98OykD+JmQA4/l1y9pVgfFDmUrdXUBZwv8Fh/v+jX7p1nof9uylh30RdhMi7lNlv
         wEYRxfAruVA7DrQLL/qSvsY0KFDWlyMUe9RQBqY2ggMuwIdBi4CquJnQzTUhFHkVLrCx
         +4Rm3iRyohcfn2lu5Tt7FQy2nf5d+E2nB4rh0rsRnRh4EZ9AtomJinOvlq7o6/sdC2WC
         TVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683117144; x=1685709144;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H0qZrTsoTI1z9nP7VB+85b8n+Rp/Rq+ktOMCkfWZZpg=;
        b=auHyekMeCr6ESYygdtXwSauK/Pe4twv2Har1YBUunQj/GcmfMK6EO4P6mwPJr8keme
         di9otRpPc6LGWZ3lWHyPxwqNXsfX4dW2XiHyGo0FnStRLHeuGAlpdWkV6W7VHo813AB0
         hjNVW2ePI1O2JAt7T+ivZBJL/72+s8YtfmDwWTbTaZFkaGotCnkSqaZkjRbazXgggzOe
         WFh3ZYYTYLdFAVHrefjtSe8wz3+vip41zAZVkRZTxz6GO5J3HEwYzLYmzmiuZ+YaQbZC
         EZxl1F1gV0NxxvjbB/TIHwa+F2WlEGdZw2SoGTT9dmk5XT+gG/Sdqgvp4NVRviDN2Y6P
         sBDw==
X-Gm-Message-State: AC+VfDwo3JTzLggBigmX2/ZToqMyCUjSexPwEABNi2q+zXqxU7AQNTgx
	huNYxVsfKQWxDY1GbJXm/+UrlLd8a+FSKhUVLSV4rBLw
X-Google-Smtp-Source: ACHHUZ6WqlZO2AN8mUxHMpzTXgGoW3DaqCdDkl9EciMVwjbe/WQOdfR4K8BcQBBJGogVJLBlCkO9DQ==
X-Received: by 2002:a0d:ed06:0:b0:556:ea38:eb07 with SMTP id w6-20020a0ded06000000b00556ea38eb07mr19160474ywe.50.1683117144161;
        Wed, 03 May 2023 05:32:24 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id p71-20020a0de64a000000b00552e1d1ac1esm8682546ywe.13.2023.05.03.05.32.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 05:32:23 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-b9a6d9dcbebso4189636276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 05:32:23 -0700 (PDT)
X-Received: by 2002:a25:aa8e:0:b0:b9f:1a9:1247 with SMTP id
 t14-20020a25aa8e000000b00b9f01a91247mr3052587ybi.39.1683117143281; Wed, 03
 May 2023 05:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230502201240.2372610-1-otavio@ossystems.com.br>
 <175B940FAEEE7C8B.14539@lists.openembedded.org> <d61ff6dcece01da702cf8fc6e98b65d613c129f1.camel@linuxfoundation.org>
In-Reply-To: <d61ff6dcece01da702cf8fc6e98b65d613c129f1.camel@linuxfoundation.org>
Date: Wed, 3 May 2023 09:32:11 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoV7m0eZNPzFjxAy1CxWrVyG+36WhQRdNAWvEhhKktDDQ@mail.gmail.com>
Message-ID: <CAP9ODKoV7m0eZNPzFjxAy1CxWrVyG+36WhQRdNAWvEhhKktDDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: 23.0.2 -> 23.0.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000070d85e05fac93fa8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180812

--00000000000070d85e05fac93fa8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

Em qua., 3 de mai. de 2023 =C3=A0s 05:17, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> On Wed, 2023-05-03 at 09:14 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Tue, 2023-05-02 at 17:12 -0300, Otavio Salvador wrote:
> > > Update to 23.0.3 stable release. Release notes in:
> > >
> > >  - https://docs.mesa3d.org/relnotes/23.0.3.html
> > >
> > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > ---
> >
> > Unfortunately I isolated this change to be causing qemuppc xorg sanity
> > check failures:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/7010
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/4517
> >
> > I've not looked into why, just isolated it to this change.
>
> Sorry, I was about to remove the patch and I'm not sure I have isolated
> it to that :(.
>
> I'll do some further checks as whilst I meant to isolate it to this,
> I'm not sure I did.
>

An error occurred due to an invalid instruction. Have you removed the QEMU
upgrade that was previously installed? The upgrade version was 8.0.0,
replacing the older version, 7.2.0.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--00000000000070d85e05fac93fa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Richard,</div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Em qua., 3 de mai. de 2023 =C3=A0s 05:1=
7, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, 2023-05-03 at 09:14 +0100, Ri=
chard Purdie via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; On Tue, 2023-05-02 at 17:12 -0300, Otavio Salvador wrote:<br>
&gt; &gt; Update to 23.0.3 stable release. Release notes in:<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 - <a href=3D"https://docs.mesa3d.org/relnotes/23.0.3.html" =
rel=3D"noreferrer" target=3D"_blank">https://docs.mesa3d.org/relnotes/23.0.=
3.html</a><br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossys=
tems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
&gt; &gt; ---<br>
&gt; <br>
&gt; Unfortunately I isolated this change to be causing qemuppc xorg sanity=
<br>
&gt; check failures:<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/63/=
builds/7010" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/63/builds/7010</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/107=
/builds/4517" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoct=
oproject.org/typhoon/#/builders/107/builds/4517</a><br>
&gt; <br>
&gt; I&#39;ve not looked into why, just isolated it to this change.<br>
<br>
Sorry, I was about to remove the patch and I&#39;m not sure I have isolated=
<br>
it to that :(.<br>
<br>
I&#39;ll do some further checks as whilst I meant to isolate it to this,<br=
>
I&#39;m not sure I did.<br></blockquote><div><br></div><div>An error occurr=
ed due to an invalid instruction. Have you removed the QEMU upgrade that wa=
s previously installed? The upgrade version was 8.0.0, replacing the older =
version, 7.2.0.</div></div><div><br></div><span class=3D"gmail_signature_pr=
efix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salva=
dor =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =
=C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br" target=3D"_blank">htt=
p://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div></div>

--00000000000070d85e05fac93fa8--

