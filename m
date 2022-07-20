Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0097AC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 18:11:44 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web12.618.1658340702318524100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 11:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=K9+FfQ6A;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.177,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f177.google.com with SMTP id x11so8270375qts.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 11:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=uNQHQToIfZn3BFHD9sNmgz8GYZ4EJZnKPxNCRuwSpEg=;
        b=K9+FfQ6AX2UqRb4IxCq+YZE/ts1ZLHVczj5WXD/E2pxOEYRRuiPXFTAtqQZIiCNyd/
         dOqbeyG2ulUc2vBMv2dHHVuhfRoEjvht3eWbmfa0tNtlNZMZ5ZmVDPvFs2a15e5eYPM7
         u3gH04hGfmsl6E7KF2MPg11Txk3oxPfcWCMm7JYCyh1MsO2dJmucWYZmFTxpiWTnVdmi
         dD90hNvNtHz3tA4+h0V+Mo099gAER3ly8TVtc4++2NM/9sk2iLf4Ri2iBYlcPxfQNQDo
         NWCjGQ5n9fo4wFbzEkOsUEn7/yYeNXiAPVG+dhde4UL2a5StkxUzGXBn/dBU60Nk1juZ
         bPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=uNQHQToIfZn3BFHD9sNmgz8GYZ4EJZnKPxNCRuwSpEg=;
        b=tXzqzifzi+/3eukmx9n1Tfzje1xx5iczFW5iQueQfBvSAhrNN4fb9qHZD25EEtrGem
         dLPew44ZklP2Q063OOpMND/d7iypYUEa8w0F2YLVvNzj2qrO9LKwW6GAOicscmgLc9v3
         6xZU1dZ+Z/7K0DRGjJWEJ0YniACQRqlTib4f/6Gz2yzBvfANdh8WtuVZVX5Qym7jw801
         APj52KVcwYJqUL7XrKuKIpdBW+G2Xrd1RKLjdSRHqvsIjAQenwRHdiA8Y+bE8WfD2WWJ
         PY4J0LwfcFG2hIl50mnFyq7SdtplmaN0PDFn3qhRm+DptATHpUOieuUSvTalqa+3Kre5
         GbhA==
X-Gm-Message-State: AJIora9+yDQ4S7pRbXBa4RAXCpR9bDjIVzcSEfMX4QIfPN+oGXZ4Dhbk
	p1RXI41ibzkgYmWATuuh+k4gHL3SeT0Pk/EY
X-Google-Smtp-Source: 
 AGRyM1td+28ugBsiZPezJMAHQY67vUtAIrh4sQ2IwhJUPDUhWgVcxBNL65sQUYJvtI+gR+Tiv2zEbQ==
X-Received: by 2002:a05:622a:409:b0:31e:e679:bb0a with SMTP id
 n9-20020a05622a040900b0031ee679bb0amr15360908qtx.45.1658340700437;
        Wed, 20 Jul 2022 11:11:40 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com.
 [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id
 cm17-20020a05622a251100b00304f3e320f2sm13495742qtb.4.2022.07.20.11.11.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 11:11:40 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f171.google.com with SMTP id m16so10039238qka.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 11:11:39 -0700 (PDT)
X-Received: by 2002:a05:620a:29d6:b0:6b5:be51:fcf0 with SMTP id
 s22-20020a05620a29d600b006b5be51fcf0mr24113918qkp.705.1658340699726; Wed, 20
 Jul 2022 11:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220710164300.953098-1-otavio@ossystems.com.br>
 <20220710164300.953098-2-otavio@ossystems.com.br>
 <e642480e892b0b411acb509c0de11aa7e52d4412.camel@linuxfoundation.org>
 <CAP9ODKooHNY8GyNuY8hDHyscEAJJfCfTXdThVMQW5TOGnjOZxw@mail.gmail.com>
 <8e065ede6abdb6065c862bd8b25cdccf2b6828a8.camel@linuxfoundation.org>
 <CAP9ODKp1_CV4N-RB+NR4nTdvVgSR=pu6V7q2T2sQ8Pu8w=Ew2g@mail.gmail.com>
 <bba9495ce38c56f914c391f054ce2bd77f2bef55.camel@linuxfoundation.org>
 <CAP9ODKrTbdjMOK5scpWEeh2Fdk0gt4XTdsVR0MLTb7GKEfpKJw@mail.gmail.com>
 <06a78e1a344f8ee4dbf696b56756781a65463f1f.camel@linuxfoundation.org>
 <CAP9ODKp+WkU-+41q39_R6S8UsraOPn-0KbTuQjaHToqumwn-0g@mail.gmail.com>
 <5937fc9b1b2507727cc838a6ba3ad13a9bd47fe2.camel@linuxfoundation.org>
In-Reply-To: 
 <5937fc9b1b2507727cc838a6ba3ad13a9bd47fe2.camel@linuxfoundation.org>
Date: Wed, 20 Jul 2022 15:11:28 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKpcXKzG_kw4OgdPnZx51eBDKqq45XuCQFXKfD839qpruw@mail.gmail.com>
Message-ID: 
 <CAP9ODKpcXKzG_kw4OgdPnZx51eBDKqq45XuCQFXKfD839qpruw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags
 during target linking
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005302c105e4408832"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 18:11:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168371

--0000000000005302c105e4408832
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 20 de jul. de 2022 =C3=A0s 14:21, Richard Purdie <
richard.purdie@linuxfoundation.org> escreveu:

> I've done a bit more work on this and the more I dig, the more I think
> we have some issues we need to sort with taking a step back and
> checking some assumptions.
>
> What I'm lacking is a good way to test the resulting rust toolchain.
> Would someone with some rust knowledge be able to add something to
> meta/lib/oeqa/sdk/cases/ which tested rust in the SDK?
>
> If someone can add some rust tests in the SDK, I think I might have an
> idea of what the patches look like to properly fix the rust toolchain
> there.
>

Ok, I will send you a test case shortly.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000005302c105e4408832
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em qua., 20 de jul. de 2022 =C3=A0s 1=
4:21, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; escreveu:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">I&#39;ve done a bit more work on t=
his and the more I dig, the more I think<br>
we have some issues we need to sort with taking a step back and<br>
checking some assumptions.<br>
<br>
What I&#39;m lacking is a good way to test the resulting rust toolchain.<br=
>
Would someone with some rust knowledge be able to add something to<br>
meta/lib/oeqa/sdk/cases/ which tested rust in the SDK?<br>
<br>
If someone can add some rust tests in the SDK, I think I might have an<br>
idea of what the patches look like to properly fix the rust toolchain<br>
there.<br></blockquote><div><br></div><div>Ok, I will send you a test case =
shortly.=C2=A0</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br><a =
href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems=
.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.com=
.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53)=
 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (347) 903-9750</d=
iv></div>

--0000000000005302c105e4408832--

