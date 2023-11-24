Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C31C61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 08:18:35 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.131355.1700813914313011581
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 00:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gLYlPa8t;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40b399314aaso4297345e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 00:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700813913; x=1701418713; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=roC9TgcgWdh+YoYPK5Nm9EY1D7bwmNJGIgKta2ZtEig=;
        b=gLYlPa8t1n3JkMjyajDfRZDTZKym2Iy9TRcIYai4TpsjEtnzc2NYMJFyLsHoapep2e
         QBox+vaS7m8zLDzUXbCoW1NOpxriX5oTLh3VWDd55Rj2Jo/EqP/3rX9CV456mIY9pOky
         wqeGATZV8qOweG9y6WSjbdG7BRn6fDZeGMetkHsV+YpxDez/DUyn+G27ZCH0sJekMQF9
         iWxSUUBKr/OkQvDOEARG3D+P1iy29gsN5ugip1Klxi/E287zIEPezNYq5NPK769cvvhL
         x41Z5eFha8x+9ksM0FFW9ylUx4AO42M5BVhXGGFqbB+LmCR6JWAiGL+SzfIeUWsnAori
         WQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700813913; x=1701418713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roC9TgcgWdh+YoYPK5Nm9EY1D7bwmNJGIgKta2ZtEig=;
        b=M9ub0LlL+7CQLg5JhD+ES43fIx/N66wzPrSHCoTAgi0S2i6ezIegdCgYG3wXy8BSbg
         JnLcmYnZD6JIp2YPVMCW6Cw+8Mt2QlWDa+HPZK7u+nhuBheb74LNemLHqHkEFl7tY0Fb
         O230WoTKW63mG5AYmkybblTp4mtjeGy+MXrzPgT9a2dasRamsd3XvCN4lstz5Yut1yEh
         2opVfdq4NCyRjJSpbp08I7UI0OyAHbHCpD3T3sZerOmQBGcRC172xXyD0LdmiYKX/nQd
         JegiSasLalHvg8fI1EpXGQool9Ay2SoAUWYY9/VeJg1hd/S5VWoEcbalSu87D/wEs2Lo
         l2OA==
X-Gm-Message-State: AOJu0Yx8z4DHQCw5nBMHh8pRfYEFpKtpfFRDU1ImdQ6F6uzDik7NezKQ
	iNja99zsUufRmvZ3YOlvb7Wo2K6JkIwMgVblRSU=
X-Google-Smtp-Source: AGHT+IGA4ZfkQUWbkTsJOSlwrew/dzuvvStXg+5z0KjnAA6KjeWvHwmOYzG8Mt43xj6FehT04VCYnk1dbuyf2JyfVBo=
X-Received: by 2002:a05:600c:4695:b0:409:3f53:c9c7 with SMTP id
 p21-20020a05600c469500b004093f53c9c7mr1374477wmo.35.1700813912424; Fri, 24
 Nov 2023 00:18:32 -0800 (PST)
MIME-Version: 1.0
References: <20231123004605.82598-1-marex@denx.de> <CANNYZj8s99epW6DxAmNzW=70P_0ksoAntN3bVbUu6ehR=tkcpg@mail.gmail.com>
 <f5a8fb84-42cc-432b-8704-9b058be25835@denx.de> <CANNYZj_XG4nxLOqOq=aeYOZBNuDMoOdYF8G2LWVUDbe+gYNEQQ@mail.gmail.com>
In-Reply-To: <CANNYZj_XG4nxLOqOq=aeYOZBNuDMoOdYF8G2LWVUDbe+gYNEQQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 Nov 2023 09:18:16 +0100
Message-ID: <CA+chaQdz8Aby6uL+RxvZMOsRfQVSztL6eDNNRcWQR7mQgCZLXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "lzop: remove recipe from oe-core"
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000144434060ae199ad"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 08:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191178

--000000000000144434060ae199ad
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 8:52=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Thu, 23 Nov 2023 at 22:07, Marek Vasut <marex@denx.de> wrote:
>
> > The lzop is called in oe-core and I was under the impression that
> > oe-core shouldn't depend on anything except bitbake . So either this
> > stuff should be moved to meta-oe too (which would be unfortunate growth
> > of dependencies) or the lzop should be reinstated . I would obviously b=
e
> > in favor of the later.
>
> There are plenty of recipes in oe-core that have optional features
> (enabled via PACKAGECONFIG) that depend on recipes that are not in
> core. If you enable them, bitbake will say that the needed recipe is
> missing and then you need to figure out which layer to add (typically
> something in meta-openembedded tree). This is not that different:
> optional feature, disabled by default, and the error will be the same:
> missing lzop recipe.
>

I think this case is slightly different as this optional dependency might
be "enabled" by MACHINE config in some BSP layer and BSP layer depending on
meta-oe just to build the kernel (with BSP preferred compression) isn't
great - compared with some DISTRO config enabling some additional
PACKAGECONFIG in some other recipe the DISTRO uses.

At least if Marek agrees to maintain it instead of restoring Denys as
maintainer :).

Cheers,

--000000000000144434060ae199ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Nov 24, 2023 at 8:52=E2=80=AFAM A=
lexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin=
@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Thu, 23 Nov 2023 at 22:07, Marek Va=
sut &lt;<a href=3D"mailto:marex@denx.de" target=3D"_blank">marex@denx.de</a=
>&gt; wrote:<br>
<br>
&gt; The lzop is called in oe-core and I was under the impression that<br>
&gt; oe-core shouldn&#39;t depend on anything except bitbake . So either th=
is<br>
&gt; stuff should be moved to meta-oe too (which would be unfortunate growt=
h<br>
&gt; of dependencies) or the lzop should be reinstated . I would obviously =
be<br>
&gt; in favor of the later.<br>
<br>
There are plenty of recipes in oe-core that have optional features<br>
(enabled via PACKAGECONFIG) that depend on recipes that are not in<br>
core. If you enable them, bitbake will say that the needed recipe is<br>
missing and then you need to figure out which layer to add (typically<br>
something in meta-openembedded tree). This is not that different:<br>
optional feature, disabled by default, and the error will be the same:<br>
missing lzop recipe.<br></blockquote><div><br></div><div>I think this case =
is slightly different as this optional dependency might be &quot;enabled&qu=
ot; by MACHINE config in some BSP layer and BSP layer depending on meta-oe =
just to build the kernel (with BSP preferred compression) isn&#39;t great -=
 compared with some DISTRO config enabling some additional PACKAGECONFIG in=
 some other recipe the DISTRO uses.</div><div><br></div><div>At least if Ma=
rek agrees to maintain it instead of restoring Denys as maintainer :).</div=
><div><br></div><div>Cheers,</div></div></div>

--000000000000144434060ae199ad--

