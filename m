Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC264C43334
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 11:25:11 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web08.6335.1657797902443597817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 04:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=DFGACEy4;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.48,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f48.google.com with SMTP id r12so1197852qvm.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 04:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=Jxdqbzg62TxkMMAEUXNGFJE5eXSopYdJQs6XpxLCDG4=;
        b=DFGACEy4/hidcU01XQLfxLIqzYuEjr2mjbJ4DR1ZUbV1bnFfBmw/ApcJ7lzeZQnZer
         0HiZbB7UlM5XOXRal6lAUsx/cJ82GDCcCGbAjejE+2VJYN5CVkb6xol2NvG9TJv3Yu+Y
         /gM+pKbN6KvPQyWEQWDAK6vIZDNWGHGo1LEPZmmyLfhXeQV5resWn0jOGCzPP2ZupFWS
         01+M++pW8eDuXqs2M79IFaxKa+/X1zTTlYWND+FnfKSnIwd0l+UJNdfUrjChBFgpHLN4
         332l+XVyKI7rI6FVVUZVOQeirtMuvZczCIUSGJ6hTZ3lL/oNlsH1Gk4A+BetjxuwFovH
         0RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=Jxdqbzg62TxkMMAEUXNGFJE5eXSopYdJQs6XpxLCDG4=;
        b=LqoL+f/y5nEQO/OYcfMFImXALCZwE8RW/YYmCNI2L6U/ZjzVOo1D0xkjtkX7shK5rH
         b/vN8Vpcs1UElQrSwm71l16k0cWENb6yhTivbdvzxd+0O1tQshNby7wdvuCcnjC8nwE0
         U3ZeQQUg0Je6ZQ1KBEghoUA4yDBCuK4hnrPMPM1Omry4JC1oV5v+ZRNhFDcpbuGp4koj
         PlSO3CIiBDiBrpQV4BA1umv2C9XubgevH1iy/mnRHW0+dUpEhHL5oJfi3rWyWGja7yUv
         3F52TE6DT0N0/eTrbMVNH3R4Bic7/uzN9BDIkCj0rUQ59Ov1DTogagqfScbOfi2nFEnN
         R80g==
X-Gm-Message-State: AJIora9e1ZoM8l2cNRPAlgUDysZNGoqQykQ7Iib+96izeUHlHAJOiQbT
	BfNXc+A+soipzPI0TuV2bpxBycjhs+QUmrWO
X-Google-Smtp-Source: 
 AGRyM1sIYdmJBognKtRgqvpBmXhELqQRR7bjVLgpZ3CJP1X+qSjqKqz9UXpJvJ743O17Uv9XHnr67w==
X-Received: by 2002:a05:6214:628:b0:473:be4:65d2 with SMTP id
 a8-20020a056214062800b004730be465d2mr7281986qvx.97.1657797901202;
        Thu, 14 Jul 2022 04:25:01 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com.
 [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id
 m12-20020a05620a290c00b006b59ddb4bc5sm1091354qkp.84.2022.07.14.04.25.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 04:25:00 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f172.google.com with SMTP id 20so949182qky.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 04:25:00 -0700 (PDT)
X-Received: by 2002:a05:620a:1d0d:b0:6b5:774e:9a27 with SMTP id
 dl13-20020a05620a1d0d00b006b5774e9a27mr5478127qkb.280.1657797900461; Thu, 14
 Jul 2022 04:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220710164300.953098-1-otavio@ossystems.com.br>
 <017e9264-cb7e-9904-7746-56cc461196da@linux.microsoft.com>
In-Reply-To: <017e9264-cb7e-9904-7746-56cc461196da@linux.microsoft.com>
Date: Thu, 14 Jul 2022 08:24:49 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKrirVni8tcSFZupuYKPoXSqenS_0gTEpkz4RnDJcustuA@mail.gmail.com>
Message-ID: 
 <CAP9ODKrirVni8tcSFZupuYKPoXSqenS_0gTEpkz4RnDJcustuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] rust-common: Fix use of target
 definitions for SDK generation
To: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f76b8f05e3c22639"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 11:25:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168031

--000000000000f76b8f05e3c22639
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Alejandro,

Em qua., 13 de jul. de 2022 =C3=A0s 21:08, Alejandro Hernandez Samaniego <
alhe@linux.microsoft.com> escreveu:

> These look okay to me, could we backport these to Kirkstone?
>
This is my goal as well; kirkstone is broken for me at this moment.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000f76b8f05e3c22639
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello=C2=A0Alejandro,</div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Em qua., 13 de jul. de 2022 =C3=
=A0s 21:08, Alejandro Hernandez Samaniego &lt;<a href=3D"mailto:alhe@linux.=
microsoft.com">alhe@linux.microsoft.com</a>&gt; escreveu:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>These look okay to me, could we backport these to Kirkstone?</p></di=
v></blockquote><div>This is my goal as well; kirkstone is broken for me at =
this moment.</div><div>=C2=A0</div></div>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a =
href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems=
.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com=
.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53)=
 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</d=
iv></div>

--000000000000f76b8f05e3c22639--

