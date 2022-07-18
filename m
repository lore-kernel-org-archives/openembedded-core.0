Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D4E6C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 15:50:23 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.28855.1658159413332016301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 08:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=1cuJPcn7;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.180,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f180.google.com with SMTP id g24so6311515qtu.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 08:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=KbeayrQiGgDlR1DtELliynRondD5uW1QKP4N5vAveaw=;
        b=1cuJPcn7FO3zBgtkNBXy7jADYLlhyeVJo1GnEwBUfv9fW+IjNpdd6eISGcgI0AdWf4
         RJRrsbvx5ulWw3BLIm8CKG93G70w8WLbWh5GZCSbjwqP4gsg2Vfo9zJvT2nrcYkkRGJS
         LOb2Lo5TVhi+zoYySXny6F4hnyYjX3emvx6wsQqT6X3WCALdwMhqJzEu9tlMpL9RpBGC
         fyax8Sxc8Hw3tDDFxW3Un5xMWao/uoCCAyYUKDdEGyvJPaAMh/fmeFUI8Vik39H8jm1k
         /vOIfj832nzEp6Jwr4M8Q9BIaICHUWOZ9JeET5y/ce+2gdnltGiNaYsovTfC4IJNulU0
         jyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=KbeayrQiGgDlR1DtELliynRondD5uW1QKP4N5vAveaw=;
        b=KULQGCRl/nmIjfDWw1fWJ2X+XUZ2KNuD+fisK4BynwEQiDjPG9LaptjUBIBSRvQlXi
         vC4mCtjWY8qG4NhpK27hT45bCDncZU/QyGubjBMhQ2vAtdAdyv4QMfsNU9qolXoQeF+o
         NMy/oB5i79pX4PvkWNX00TXsJ8aOlcnLoE6X86+I9HHTKjaU91eeMCvYyE5h5+9KUOpB
         M6uUBl18lFdhwbT7g4wvd4QGigQ3/IRbvOUzKbHAP2PW6gAu5dopqWJ7b01qB7UDP4Xe
         TDAeyJyXKkBsRLGgF7svjk33N37HeUwY/2DmBimTEt6RcnIw5kH9AcnkcehGzzWEmqw3
         dQXw==
X-Gm-Message-State: AJIora88t/vSqA3YBmn0HBvAUmk8U+PpF3ETpfEPjMZVz/ab3rrduwMN
	8E8rrWdkOPsfjbVdnhGk/+V4cHzf+DasUOaC
X-Google-Smtp-Source: 
 AGRyM1vlPEdd+rS5NVTCp87TeKoZwWCgZQW+U8KmKT/4I+guGsqudHEP1a633dA9Oyr9ds6u8zAuKQ==
X-Received: by 2002:a05:622a:11ca:b0:31e:ebef:e99b with SMTP id
 n10-20020a05622a11ca00b0031eebefe99bmr5251967qtk.260.1658159411959;
        Mon, 18 Jul 2022 08:50:11 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com.
 [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id
 d66-20020ae9ef45000000b006b5683ee311sm11041430qkg.100.2022.07.18.08.50.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 08:50:11 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f52.google.com with SMTP id l11so9041905qvu.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 08:50:11 -0700 (PDT)
X-Received: by 2002:a0c:8b09:0:b0:473:3c8a:4f00 with SMTP id
 q9-20020a0c8b09000000b004733c8a4f00mr21273426qva.49.1658159411203; Mon, 18
 Jul 2022 08:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220710164300.953098-1-otavio@ossystems.com.br>
 <20220710164300.953098-2-otavio@ossystems.com.br>
 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
In-Reply-To: 
 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
Date: Mon, 18 Jul 2022 12:49:59 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
Message-ID: 
 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags
 during target linking
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000af968c05e41652f9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 15:50:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168238

--000000000000af968c05e41652f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 18 de jul. de 2022 =C3=A0s 09:45, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> On Sun, 2022-07-10 at 13:43 -0300, Otavio Salvador wrote:
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >
> > (no changes since v1)
> >
> >  .../cargo/cargo-cross-canadian.inc            | 20 ++++++++++++++++++-
> >  1 file changed, 19 insertions(+), 1 deletion(-)
>
> I did look into this with some local testing. With:
>
> SDKAMCHINE =3D "aarch64"
> MACHINE =3D "qemuarm64"
>
> bitbake rust-cross-canadian-aarch64
>
> still fails so there is still something wrong with the SDK builds :/
>

I'll check this. I didn't check this combination.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000af968c05e41652f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em seg., 18 de jul. de 2022 =C3=A0s 0=
9:45, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Sun, 2022-07-10 at 13:43 -0300,=
 Otavio Salvador wrote:<br>
&gt; Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.=
com.br" target=3D"_blank">otavio@ossystems.com.br</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; (no changes since v1)<br>
&gt; <br>
&gt;=C2=A0 .../cargo/cargo-cross-canadian.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 20 ++++++++++++++++++-<br>
&gt;=C2=A0 1 file changed, 19 insertions(+), 1 deletion(-)<br>
<br>
I did look into this with some local testing. With:<br>
<br>
SDKAMCHINE =3D &quot;aarch64&quot;<br>
MACHINE =3D &quot;qemuarm64&quot;<br>
<br>
bitbake rust-cross-canadian-aarch64<br>
<br>
still fails so there is still something wrong with the SDK builds :/<br></b=
lockquote><div><br></div><div>I&#39;ll check this. I didn&#39;t check this =
combination.</div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a hre=
f=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.co=
m.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com.br=
" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9 =
9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</div>=
</div>

--000000000000af968c05e41652f9--

