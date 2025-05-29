Return-Path: <anibal@limonsoftware.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A750C5B543
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 23:22:47 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.706.1748560963043088591
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 16:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@limonsoftware-com.20230601.gappssmtp.com header.s=20230601 header.b=vSiphmP2;
 spf=pass (domain: limonsoftware.com, ip: 209.85.128.173, mailfrom: anibal@limonsoftware.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70df67e1b17so14821217b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 16:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=limonsoftware-com.20230601.gappssmtp.com; s=20230601; t=1748560962; x=1749165762; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3nLWj071NEm63uIVHcoUbgixrgXsbqlkvj4monCvTz4=;
        b=vSiphmP2abBnpDbBCl2NCRGKzwh0S8e/l02R9BrydRaYu8RtG6f+jqeOVjX+UA519H
         KavLD/BzXuTm+wjutoNUIanmEXRyeeaA7+Lzq6YBolLOB9QJ2WAM3x6T0UVk5srHe5nI
         KMU6wKZM4z0mAYgi0Am2h+P3BN+fKq+MtUQbRVrwsTi5EcTuGREOIEQAeo1on8YZqT01
         +iSCkkrvqBW0UkzlpUcVGwtcvk6ukJ//LKG69EjRAWKnRJj9DWdUdvfKhmW5Pv+MhiiM
         u9PntW0F9hYWEMYjm/3tJxYvxmMqOFT5d4bxk8uDQrO9kATowEEQ53AFrKWshaCfC7JJ
         wKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748560962; x=1749165762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nLWj071NEm63uIVHcoUbgixrgXsbqlkvj4monCvTz4=;
        b=A8wf3hXKAkgpqk9y+iwhgsnA7r323h9V4FGHBhr9U7FxCBD5XzepyNOM2EgrN3FqBj
         94DLE5Jv/qmnWc6voqubSEHenTekGlNFbrgF7BcF+zvyrfEiyTfAgQRb4k9v3BNmLM0p
         7VnesDthYgbGKl6d7j6GujXm40wmSbtjq6+kbPjlIc0V2FvRAV26YXFh7jXhe4byak0p
         7+nNSXEZJU07DjjGKqMgnZf3wL0Ww/DqE4l4ZFdUiQyZXnYm0yJdqio7po2z4bNCg/RK
         p8g/z8gqE2jFc4ZGkP3eDAO4tngXuBG2jIMr9Dw63gtjPLhL4dZ4dG2MFRsinJ44/NTO
         J8hg==
X-Forwarded-Encrypted: i=1; AJvYcCWvST6LhRVoxs5/RUm1J/LaX1RGpQ9PpKsrk71LIcH10aPXbtp4mbs7nOJvmLhcbi6hsKO/9lG21L7QQ0xBzBsfLA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwuXbAOzijisXQVrwpnfJms011K9fzj1nwEuRIYRoXe5m8EeCuK
	e00ZkipUNCeh7BkKu/Gb7Oo+7knNNuUMljLCQecpwfxU+00/NBPmsWOl854tJGj+5YwcfEZdFAX
	aqNgxsueuTB7HZ8gjtsSJmKhTymBmsuLkF08qzd+Muw==
X-Gm-Gg: ASbGnctHTLKL66t8xMYaulpjcfr/p9KlODe5OEgwjajbq0kUygHoHNaPzrHH0KueHtU
	cLQb1nSmNXBNNCCoyWYJsG1r6ze8VoQMllC6Rd9/if7yAoeqGGaGALuBhjlkt6vj02G86eQQeiX
	+wq6iBtLfESwr7QV412uEKgKNbiQTK/Qd7By3f5N6BinjrJKlzz+E=
X-Google-Smtp-Source: AGHT+IE5wIeki1d+LBIAONCLzQPlV7rzUemU73CEVqHOv42EeXk9Y410gwc+xcZjUDRIZAd0KC6uCWVe/vTLOMYGa8w=
X-Received: by 2002:a05:690c:4d82:b0:70e:22ed:e74f with SMTP id
 00721157ae682-70f97e9a98dmr22486507b3.2.1748560962207; Thu, 29 May 2025
 16:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
 <20240323195304.2909926-2-anibal@limonsoftware.com> <20240325101809ec807440@mail.local>
 <CAOU5ZMvcO4_HWWgNc44P11w=rXh_cXyFhi7P2=D1iDhZjB+xTQ@mail.gmail.com> <FB405ACE-51BB-44F0-B449-EAC18194F176@arm.com>
In-Reply-To: <FB405ACE-51BB-44F0-B449-EAC18194F176@arm.com>
From: Anibal Limon <anibal@limonsoftware.com>
Date: Thu, 29 May 2025 17:22:31 -0600
X-Gm-Features: AX0GCFu8V2BQU9eEE5gNwri_VwL54A20pgXkmnHsaTg4jUjxD-NFKsKfdHF0uwQ
Message-ID: <CAOU5ZMsctXq9Gf0UHdrrt-9ZKV69qMs21AjBJ7Uu=vUxmWp6Pg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
To: Ross Burton <Ross.Burton@arm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000005578306364e939c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 23:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217456

--00000000000005578306364e939c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 2:06=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 25 Mar 2024, at 14:39, Anibal Limon via lists.openembedded.org <anibal=
=3D
> limonsoftware.com@lists.openembedded.org> wrote:
> > Thanks for reporting, I will adapt the tests.
>
> Without having to rewrite all of the documentation and existing files, wh=
y
> doesn=E2=80=99t wic just normalise the plugin name that it reads to repla=
ce all -
> with _?
>
> This means you can still import the module names, but doesn=E2=80=99t cha=
nge
> existing behaviour at all.
>

Hi Ross,

So to normalize you mean change python module name from _ to - at runtime?.
The plugins already had a name attr with '-', the issue is when trying to
import from an external module.

Regards!,
Anibal


>
> Ross

--00000000000005578306364e939c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 29,=
 2025 at 2:06=E2=80=AFPM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.=
com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On 25 Mar 2024, at 14:39, Anibal Limon via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> &lt;anibal=3D<a href=3D"mailto:limonsoftware.com@li=
sts.openembedded.org" target=3D"_blank">limonsoftware.com@lists.openembedde=
d.org</a>&gt; wrote:<br>
&gt; Thanks for reporting, I will adapt the tests.<br>
<br>
Without having to rewrite all of the documentation and existing files, why =
doesn=E2=80=99t wic just normalise the plugin name that it reads to replace=
 all - with _?<br>
<br>
This means you can still import the module names, but doesn=E2=80=99t chang=
e existing behaviour at all.<br></blockquote><div><br></div><div>Hi Ross,</=
div><div><br></div><div>So to normalize you mean change python module name =
from _ to - at runtime?.</div><div>The plugins already had a name attr with=
 &#39;-&#39;, the issue is when trying to import from an external module.</=
div><div><br></div><div>Regards!,</div><div>Anibal</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Ross</blockquote></div></div>

--00000000000005578306364e939c--

