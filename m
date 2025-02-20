Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406F2C021B3
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 21:38:19 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web11.8792.1740087491946717039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 13:38:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cb7zn8IN;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86715793b1fso386864241.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 13:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740087491; x=1740692291; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j+j/vsm/BTHmu4+UDV3HzHXg1Y1j+qiwX9Zk07oa3zU=;
        b=cb7zn8IN1x106nlCtgBJzxa9TPielMMxQLMe9W92QynFk4KBjbO9e8i3gexat3hBiU
         xCZKD+HjVJjvWIrWXDvLQZfd7jVx/wAbIhkBSEaar5bXt/nr0QvumHuxvpV4tlZxuTBy
         eH7zjBNJaKruC4ELI0MqVkhou6It07Vypt9sB32G+iZijsAj7rM0PB9m9rkNuz2xx7om
         Oh+WTm+i/8fOl3DAUGZZ9lzzcqiwYh2xhcYUXJx672DE3FKLmguvjSvW6bOMa5z3es0b
         2IwQV5Nzy6lz71HQVce9d/OQxOVJvehCcOz+chMTdIoSOS15qyZUPlLyHRIKp71QTF7o
         j1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740087491; x=1740692291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+j/vsm/BTHmu4+UDV3HzHXg1Y1j+qiwX9Zk07oa3zU=;
        b=DHFwHbjcG7vxKuk5+ws3GxPqxbFAQOZ+tzSdVOXomLEGkOsYblQ4EUkDwITCgfeVP6
         Io1FvJA65YfFhNSQAoCRn35QuB0Aag2ag9mArSf8CMdVBN0fb4OzmlDFKdr0t7tUXIKq
         qrY0UQ3oN8HMHl9gfo5Kww1PKs89Or669SUtwjBxb0GT2Tskhw/ImYmEyC9gFQz5PEP0
         9LAQSZXG5K4r47IGCnsoWwdwXyZ0H/bAwf4mGiOKtpgD1O53y3Cfrc8g305dOlgsC7eg
         r+xd1cpiYNC7i1gVFuuSfLExubk6AkYJeo8lgJbnIcKcHnT8oN9NAl1fk5GOp6oAvQow
         ta6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxpjEyW5NuFiM3PIP4ckahQfjZei1fSWE9fX3MUZYpJlaQzaWtVEcFhN019LVdtG2+qyYnHmATggkYR6DkgD8pag==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzrQmwaNx5u9XEpg4nWJDwiyW/it2ES4zyWoUeT2zpmG00hdJpA
	dZeKyjOWbPGdits2FRSsCHxGv2IyQo3AQsMJZMn5WqdZEXL9si3ZSrh6d6if1tobC+xKae4IHPN
	XRB+UFnXPvWfdVEjtanIILewKNzU=
X-Gm-Gg: ASbGncvDpo0bx/Xgi6aSloZhrjkPXT+mZA3uiCs9TYxqQApUAaJBqdW4lTF5qLTTNoS
	tMdp/f00eKmRinqtGIuSlhDaGEJzkAbBWsKyg6FfI4rpjcCSZmIrNi/8w+Two4xk7qhhEQangoP
	4=
X-Google-Smtp-Source: AGHT+IFXYt7Z+qC4BWITI7mKcNFsWpJDJwOhrd0rD+em0+Qqb+RYli8/0fsR48BgYs7QwQPVneTAdCfawRktNCFg2nQ=
X-Received: by 2002:a05:6102:41a5:b0:4bd:3c41:7f6c with SMTP id
 ada2fe7eead31-4bfc009c888mr794109137.10.1740087490860; Thu, 20 Feb 2025
 13:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20250123184440.2431629-1-peter.marko@siemens.com> <4c6f452d-4dc1-41ca-bb21-2da530dcd755@windriver.com>
In-Reply-To: <4c6f452d-4dc1-41ca-bb21-2da530dcd755@windriver.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 20 Feb 2025 21:37:59 +0000
X-Gm-Features: AWEUYZmyP00qAX-3hFtMfo8XmjPnIVCwEqPeIF-lMlf47I_OC4tcEP-5lnyf-oo
Message-ID: <CANPvuRnjuZXZ+YY-hZf4yBao-BQQ24_Y3MDxPrXiV+M1gX8L4g@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/3] go: Is anyone working on 1.24 now?
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c55ec4062e99b087"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 21:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211778

--000000000000c55ec4062e99b087
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy

The last thing I have is the [RFC 1.23.0] I sent to the list on
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D29005.
It was incomplete and I haven't done anything since. We are already very
late on the golang front.

However, I think I'll be able to get back to it next week and I can
spend some days on it,
but I don't know if I'll have time to finish it for the M3.

Jose

Randy MacLeod <randy.macleod@windriver.com> escreveu (quinta, 20/02/2025
=C3=A0(s) 21:11):

> Peter, Jose, anyone,
>
> Does anyone already have a go-1.24 in the works for before the end of M3
> on March 3rd?
>
>    https://tip.golang.org/doc/go1.24
>
> ../Randy
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c55ec4062e99b087
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Randy<br><br>The last thing I have is the [RFC 1.23.0] =
I sent to the list on <a href=3D"https://patchwork.yoctoproject.org/project=
/oe-core/list/?series=3D29005">https://patchwork.yoctoproject.org/project/o=
e-core/list/?series=3D29005</a>.<br>It was incomplete and I haven&#39;t don=
e anything since. We are already very late on the golang front.<br><br>Howe=
ver, I think I&#39;ll be able to get back to it next week and I can spend=
=C2=A0some days on=C2=A0it,<div>but I don&#39;t know if I&#39;ll have time =
to finish it for the M3.<br><br>Jose</div></div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Randy MacLe=
od &lt;<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriv=
er.com</a>&gt; escreveu (quinta, 20/02/2025 =C3=A0(s) 21:11):<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
  <div>
    <p>Peter, Jose, anyone,</p>
    <p>Does anyone already have a go-1.24 in the works for before the
      end of M3 on March 3rd?</p>
    <p>=C2=A0=C2=A0 <a href=3D"https://tip.golang.org/doc/go1.24" target=3D=
"_blank">https://tip.golang.org/doc/go1.24</a><br>
      <br>
    </p>
    <p>../Randy<br>
    </p>
  </div>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div>

--000000000000c55ec4062e99b087--

