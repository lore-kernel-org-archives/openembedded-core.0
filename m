Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD0DC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 16:20:21 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web08.21941.1658938814861015528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=7xwCL8Z0;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.48,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f48.google.com with SMTP id i7so13252749qvr.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=sCBitQkLUzJ7vdAo3OUpMfbPS0t4vbspK1AiaiLD/Zc=;
        b=7xwCL8Z0x05UXSMntPDpLdB32kVSiEFc1X9Sav0MJXR9IYnjGPWVP7WPB6/X28EYUv
         aj/+WiZ0TD2djDfX7ihOdIB85u7hiw01xO2IH2a0l7gvfKLdRMVmkhvSoYIZBIwO9ldQ
         Jg/BCxH2SwtqsUhJjooWGT2WglTDpVz3ZmmutPdjG8c/nw8eHsxPikHHONod+s3To2B1
         of3sSbRrpvVo468VftHkALVpn37F2lTlAQmUP/a4BLEWGqQFxKTpR1dERG6DmfZHJLEe
         907koTkq79HftOcW5nt87V0d5J5KMGgZP6L70FGirfYpZ0BSsgTt82cU9zbVyOKlseNI
         bBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=sCBitQkLUzJ7vdAo3OUpMfbPS0t4vbspK1AiaiLD/Zc=;
        b=3SwVevxkQURKluYcpyoOWnJotGiRxf+d5EUy+6VDH3nP0k3w7Xez5fQu3pYux1fxq2
         xocipIF9qE4qbNqZ0MhH5K7UtUWq0kwx7HreSFRUnkqv7OnROMdM85LxcVsJL0IivWtV
         B22295WP1AQyod5bnwLllXXEX9/zS3Qtzz/g1OlCCjcqlm58vYgXu+yv0FN8t8kA8jg+
         Y/kDs3Sgx4q+/32iha9Fb0evzIQTD6e2VO0xKVEKqOnWmA3QIi8uzAOK3JGb0mUagHqh
         JS/2qsuMBlOAIWvTeIZ4MenGBcndNj+xjrrDij1YA1ZwA7U1KmRbRb0wjZIf376Eo/Xh
         Lr/g==
X-Gm-Message-State: AJIora8tkkXDWqxmeQCD82eLRh0JBj+kJ6j3imw2y+mCgMQOFL+6g/hV
	gIOCjlFeFSJCdnYXL3wSf7P/p+wJlT1BXVay
X-Google-Smtp-Source: 
 AGRyM1sk9BXpRhPcO2al1nAGpsgPVFtCJoSwXDWBmAgr0xzOvUodJW54Ig03h8GyTHXQm92zTJ6z0A==
X-Received: by 2002:a05:6214:20a8:b0:474:4f5b:5bfb with SMTP id
 8-20020a05621420a800b004744f5b5bfbmr12356181qvd.60.1658938813495;
        Wed, 27 Jul 2022 09:20:13 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com.
 [209.85.219.42])
        by smtp.gmail.com with ESMTPSA id
 h15-20020a05620a244f00b006af3bc9c6bbsm14353856qkn.52.2022.07.27.09.20.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 09:20:12 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f42.google.com with SMTP id j11so13235434qvt.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 09:20:12 -0700 (PDT)
X-Received: by 2002:ad4:5bc7:0:b0:474:2b24:b303 with SMTP id
 t7-20020ad45bc7000000b004742b24b303mr18612340qvt.1.1658938812377; Wed, 27 Jul
 2022 09:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220727120036.633822-1-otavio@ossystems.com.br>
 <EC73E18E-0AA2-4655-8A53-EA278A198969@arm.com>
In-Reply-To: <EC73E18E-0AA2-4655-8A53-EA278A198969@arm.com>
Date: Wed, 27 Jul 2022 13:20:01 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKpT6y0qvhryKm_NqTX82dmOytSU34yR_-8fG=WGZ06QNg@mail.gmail.com>
Message-ID: 
 <CAP9ODKpT6y0qvhryKm_NqTX82dmOytSU34yR_-8fG=WGZ06QNg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libusb1: Link with -latomic only if no atomic
 builtins
To: Ross Burton <ross.burton@arm.com>,
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009db5e905e4cbcaf4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 16:20:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168573

--0000000000009db5e905e4cbcaf4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 27 de jul. de 2022 =C3=A0s 12:28, Ross Burton <ross.burton@arm.com=
>
escreveu:

> The patch is missing your S-o-b.
>

The patch isn't mine but a backport. Richard can add it when adding it to
MUT, though.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000009db5e905e4cbcaf4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qua., 27 de jul. de 2022 =C3=A0s 1=
2:28, Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@ar=
m.com</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">The patch is missing your S-o-b.<br></blockquote><div><br></div><di=
v>The patch isn&#39;t mine but a backport. Richard can add it when adding i=
t to MUT, though.=C2=A0</div></div><div><br></div>-- <br><div dir=3D"ltr" c=
lass=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. System=
s<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.o=
ssystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossys=
tems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: =
+55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903=
-9750</div></div>

--0000000000009db5e905e4cbcaf4--

