Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A96C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 14:03:21 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.32144.1661263400736083189
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=bLuQFVD4;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.181,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f181.google.com with SMTP id f4so10305289qkl.7
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:from:to:cc;
        bh=jvIgnw5Ww2PcRbZAVSynvIF7P3QOm4x0/cG/EXL2Dqg=;
        b=bLuQFVD4X7rS0Eh4HLffThwcI1TYGjqoFf6rJegDTKg/kWU0yAZLDc5E3P/n5qp1ou
         3DhSyH3Ncl10AascYhOkBGWuk+NhBPX5lHwVqOBDb7h2NGzn0N4agjsbs8yBgi3JCIG9
         yCZJIbLx8bWgl0MHyAWoBiX9dXTAQ1xAO988QjBYQqKN4COmndOvk+ZcrM8iEHN0Ukz5
         Il4nUHSEgqZ51G4FCgd2dGWPmgKjBnZ1uuV0TZLc5KqH1lIR1SotqXkOootSNcgZdNLv
         /CkpRlytrAYOfTECdq/JwIgsXMBOpA9lrkLlliywdX+MeYxI2FuO0nHTYCg0zdkCMbgw
         D/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:in-reply-to:references:mime-version
         :from:x-gm-message-state:from:to:cc;
        bh=jvIgnw5Ww2PcRbZAVSynvIF7P3QOm4x0/cG/EXL2Dqg=;
        b=W+HXTKxWI/buWhI+54BLSFzVf+2xeRCHyEGK3pSZAZZNheTL7VFtuzPYDH87Yqfm7+
         f5OJdOSZO4D5xFcWnn1Hh0feM1/BAFydHK1YZY5cDjuzF4zoHjKxPLiTnBQYKMulsFZ8
         64VBEzFeij/rsC0AR+jHi7Sg1leJ7TuU6VWcfFP90Xx474GWEk1wgK1kfsOLKn9kX/88
         PxzdjA9sGSH4axUdVl1qAWTlRHLbUzf9VQoZHkhjo86O0AkWSiYi2elmfg6UiRgTeqEK
         OmNmOn6NJnhsMRtLz/wdYMJ0a5dhpWksW3y0tgMddoXuL2djSMEzoyghaEzAE/qq/Avx
         xP7A==
X-Gm-Message-State: ACgBeo0PnctBfqZwmjfYFiQVt449+K4NcQf5BVtkC4aSfmNPtS0/Mn0l
	zS2T9nrtoIV+j8RBo5EvvauZCJsyBgw0neHj
X-Google-Smtp-Source: 
 AA6agR6+AQ6CcbCTNWJnCaj/3j+GdQuBbgviuOvNASw9fwpUaWPNP53ZoLjmX1aSzIFx5gNqNH/SOg==
X-Received: by 2002:ae9:e404:0:b0:6bb:d8c0:381c with SMTP id
 q4-20020ae9e404000000b006bbd8c0381cmr12375774qkc.459.1661263399364;
        Tue, 23 Aug 2022 07:03:19 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id
 j10-20020ac8664a000000b0033fc75c3469sm10306994qtp.27.2022.08.23.07.03.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 07:03:19 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f170.google.com with SMTP id j17so10383863qtp.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 07:03:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1787:b0:344:94c1:fb0e with SMTP id
 s7-20020a05622a178700b0034494c1fb0emr18771418qtk.82.1661263398748; Tue, 23
 Aug 2022 07:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220823110227.68348-1-peter@berginkonsult.se>
In-Reply-To: <20220823110227.68348-1-peter@berginkonsult.se>
Date: Tue, 23 Aug 2022 11:03:07 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKoRj+aqcdH6uFN0xZEeMJ2y=8e931vGTFFxgQsXh=pO6Q@mail.gmail.com>
Message-ID: 
 <CAP9ODKoRj+aqcdH6uFN0xZEeMJ2y=8e931vGTFFxgQsXh=pO6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-cross-canadian: rename shell variables for
 easier appends
To: Peter Bergin <peter@berginkonsult.se>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c2cbaf05e6e90628"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 14:03:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169705

--000000000000c2cbaf05e6e90628
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 23 de ago. de 2022 =C3=A0s 08:02, Peter Bergin <peter@berginkonsul=
t.se>
escreveu:

> Make unique shell variable names for cargo and rust
> setup scripts. This change will make it easier to append to the
> scripts in a bbappend file by using the variable for the script.
> Before this change it was only possible for the last script as
> they shared the same variable name.
>
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
>

Why do you want to append them?

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--000000000000c2cbaf05e6e90628
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Em ter., 23 de ago. de 2022 =C3=A0s 0=
8:02, Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se">peter@berg=
inkonsult.se</a>&gt; escreveu:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Make unique shell variable names for cargo and rust<br>
setup scripts. This change will make it easier to append to the<br>
scripts in a bbappend file by using the variable for the script.<br>
Before this change it was only possible for the last script as<br>
they shared the same variable name.<br>
<br>
Signed-off-by: Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se" t=
arget=3D"_blank">peter@berginkonsult.se</a>&gt;<br></blockquote><div><br></=
div><div>Why do you want to append them?</div><div>=C2=A0</div></div>-- <br=
><div dir=3D"ltr" class=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=
=3D"_blank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>Mobile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0Mobile: +1 (347) 903-9750</div></div>

--000000000000c2cbaf05e6e90628--

