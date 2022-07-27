Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6A1C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 16:41:21 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.22149.1658940076672589448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=EQAgao1T;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.171,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f171.google.com with SMTP id y9so13030905qtv.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=c1NQI6T+576SufDEI6TIeIAYOEa6Q9h//PpY7Xk2QCc=;
        b=EQAgao1Ti4KFs88XDzs0WRURsb5jgUKxtZbjrGkC7ZbCqpEZVXs9GTBJ9rQnfZ3WCh
         7RRCX+QUvbIhClUNwhp4Yzhrv6PxL1iHmJmz/11pX8wa4uv1wx/MMkJ2/ZKqL8jJ22Cg
         opMwHe0PP5neEKYp3NPeAKdOYQZE0nMPG/kPY8o/ks6X9dkMr01UI4w8V9AEbTJ8ErDW
         J0gItq9gK7yo5/5H1LPK3jTN0vVo9AlbaOmYqj+pyFC6nBi09kFM7Af4jAw7Mi/l3TiZ
         84Dtbn+9LPQiCgb5q28X6iLb2SyiQXLg8tm0/4yvYIVSSesU1MfMScTGHDacBA+qljhm
         8ORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=c1NQI6T+576SufDEI6TIeIAYOEa6Q9h//PpY7Xk2QCc=;
        b=0iTb/BxYUMMkeVjEUBrf+qQUZrue93yrD8FPE6Fnofbmyx6XMmiGwFs+TF7kITT7zG
         o75Vt0V9WuSg+Thn/u9BVh9INekw3JJMQAg6r3tyXXgrEeC65z9mAQWnGpAR5ek/ysno
         M4JSRaS4IuytuT/BC8XiJ6PVLqRqVMH5TdFpKbCPaZ/bqv7hqXfxpm/NmTyelE6GrOpe
         GOCt/F51+QbXuXbUscFhf5YUz3TCyfDz7x7QviYZfdP61TeDzMhdsbYXTebljmYm+3MF
         HlWwgyIfeDyFyWCcti/A8yMC/QcmsltOOrYkqcDEUjNY/p5mB8KcPMgNMLnQ6tGWp573
         dWNw==
X-Gm-Message-State: AJIora8x3DG5OhcMNar3aL06keBmJFBfgVFS28ZwdTVZD6raBb41P00N
	TmHrAEavlUT9kkf2r4xN7STyE4chen19FsPv
X-Google-Smtp-Source: 
 AGRyM1v0BKnCxS0m9PMnQ8NpDGsmmMR/hjxLgAieMUCylk4ppBU1OTbxnHI/VrPlzr93anQtc+8Opg==
X-Received: by 2002:ac8:7dd2:0:b0:31e:f857:a8ab with SMTP id
 c18-20020ac87dd2000000b0031ef857a8abmr19564855qte.346.1658940075466;
        Wed, 27 Jul 2022 09:41:15 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id
 bn31-20020a05620a2adf00b006b5ef0aff29sm12917132qkb.87.2022.07.27.09.41.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 09:41:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f180.google.com with SMTP id h22so13046496qta.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:41:14 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:31e:e643:953f with SMTP id
 t12-20020a05622a148c00b0031ee643953fmr19763079qtx.678.1658940074522; Wed, 27
 Jul 2022 09:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220727120036.633822-1-otavio@ossystems.com.br>
 <EC73E18E-0AA2-4655-8A53-EA278A198969@arm.com>
 <CAP9ODKpT6y0qvhryKm_NqTX82dmOytSU34yR_-8fG=WGZ06QNg@mail.gmail.com>
 <PA4PR08MB7411B7CCCEF2AF6FFB1EA063E8979@PA4PR08MB7411.eurprd08.prod.outlook.com>
In-Reply-To: 
 <PA4PR08MB7411B7CCCEF2AF6FFB1EA063E8979@PA4PR08MB7411.eurprd08.prod.outlook.com>
Date: Wed, 27 Jul 2022 13:41:03 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKpo9=JeKvdEK+kX5_2gVWv4haSyU1jYgFLGcwPci8qMsQ@mail.gmail.com>
Message-ID: 
 <CAP9ODKpo9=JeKvdEK+kX5_2gVWv4haSyU1jYgFLGcwPci8qMsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libusb1: Link with -latomic only if no atomic
 builtins
To: Ross Burton <ross.burton@arm.com>
Cc: "Purdie, Richard" <richard.purdie@linuxfoundation.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d87d1105e4cc151b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 16:41:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168576

--000000000000d87d1105e4cc151b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 27 de jul. de 2022 =C3=A0s 13:35, Ross Burton <ross.burton@arm.com=
>
escreveu:

> Whoever adds the patch needs to add their S-o-b.
>

The patch sanity check should warn about it as it does for the status
header. I said, RP can add it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000d87d1105e4cc151b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qua., 27 de jul. de 2022 =C3=A0s 1=
3:35, Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@ar=
m.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">





<div lang=3D"EN-GB" style=3D"overflow-wrap: break-word;">
<div class=3D"gmail-m_-964568925530506581WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11pt">Whoever adds the patc=
h needs to add their S-o-b.</span></p></div></div></blockquote><div><br></d=
iv><div>The patch sanity check should warn about it as it does for the stat=
us header. I said, RP can add it.</div><div>=C2=A0</div></div>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blan=
k">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"ht=
tp://code.ossystems.com.br" target=3D"_blank">http://code.ossystems.com.br<=
/a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobil=
e: +1 (347) 903-9750</div></div>

--000000000000d87d1105e4cc151b--

