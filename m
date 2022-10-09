Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CD8C433FE
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 19:57:46 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web12.6159.1665345459372126152
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 12:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=p7lXRdjG;
 spf=pass (domain: ossystems.com.br, ip: 209.85.167.182,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oi1-f182.google.com with SMTP id m81so10989825oia.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 12:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+7d1kqNkj4po8ZPoGjSAOdQqNuk/+Rb7aZYux5YJSnM=;
        b=p7lXRdjGwdVsXPnAxMx0pRJhjBqAcYdYTWz3Nfz0F3/52PP/SSoD1cAVXGwhLqiWTb
         eIdvWUO9TBjcEIn3eDOT8/Vn/uX68mm5rf38akjiprZyJsE85w8+1gXIRH64/Dqfubig
         P5FSiYpxAuQ0bY//HeFGvzcVWahdjnKveZtYqInS0pI09tEn+sjICO56ND82iyd7Gl8a
         6i2GghoC4cq4a17PZGGxW6qfX5C7eWnmO8S7Tdbr3Nb44SRhDYQhdBgq1uEnBIx52Pvj
         7S+C0FAhh38WLqE8FxaVJ/tMYquISrTcT8DD54Qqy2p/w5kaQcmOsr+1MKZgztL3MKtk
         Y9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+7d1kqNkj4po8ZPoGjSAOdQqNuk/+Rb7aZYux5YJSnM=;
        b=0/SdXZr4Is66JzARZVvBV3Ea4JuEZQf7v0AVsEuIcOgWGJ6tpz8uJVbGq7BvUm5JUe
         2HDfwrjo0sUXijracpCFGXFex3W+EAKQZo3c3KeYwRuby4MXtFPM/CiRptjhuiGUcRGf
         Q3HL+xe1jgtqX13uZCbBASxZV/ferLD09FhhYrwbvO5l7epW6YWhfO+M07s19OlQgCnf
         8A6E+WqS5V0ocMujN/yL2kkpi3YqvxV7KokwantsWlvq8VAJ6DvjsT+NGHHOdN9SPw+I
         /GFcqBi0qLLOXK1ShO8ADZtnqgAoj7SdtFV/walqRPOIA6iKht4dSEoFIG+UOoGfHYaj
         cNBQ==
X-Gm-Message-State: ACrzQf1uMLNbrC+1J90cECCpy9iwFLsyLLNb30/xzHBi9PotkvQGYox+
	MMhkopU0b5v07W4uwGGLNULXzw6bXWY4FsoT
X-Google-Smtp-Source: 
 AMsMyM7podbJEilyZaOUMn+K2Tzj6CBOFRAqwy4h9GoO8NlSCSiUQkkk0yzvnlJEZLwbRzMXbyaCaA==
X-Received: by 2002:a05:6808:120c:b0:351:6d17:1845 with SMTP id
 a12-20020a056808120c00b003516d171845mr7867182oil.254.1665345458618;
        Sun, 09 Oct 2022 12:57:38 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com.
 [209.85.160.49])
        by smtp.gmail.com with ESMTPSA id
 x32-20020a05683040a000b0065689e13f52sm4014539ott.71.2022.10.09.12.57.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Oct 2022 12:57:38 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-1321a1e94b3so10660741fac.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Oct 2022 12:57:38 -0700 (PDT)
X-Received: by 2002:a05:6870:c094:b0:132:dedc:bdb with SMTP id
 c20-20020a056870c09400b00132dedc0bdbmr11778939oad.252.1665345457757; Sun, 09
 Oct 2022 12:57:37 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 9 Oct 2022 16:57:26 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKqkPRSzkGFCb1Yyt9U1Ut+nOzyhPtb19HgrN4p5AXun1g@mail.gmail.com>
Message-ID: 
 <CAP9ODKqkPRSzkGFCb1Yyt9U1Ut+nOzyhPtb19HgrN4p5AXun1g@mail.gmail.com>
Subject: How is 'devtool sdk-install' supposed to work?
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Cc: Daiane Angolini <angolini@gmail.com>,
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000007023a605ea9f74b9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Oct 2022 19:57:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171555

--0000000000007023a605ea9f74b9
Content-Type: text/plain; charset="UTF-8"

Hello all,

Daiane and I are working on the 3rd edition of our Yocto Project book and
now working on the chapter where we'd like to cover the eSDK use better. We
are likely missing something obvious, but it is better to ask if we can't
figure it out.

How is 'devtool sdk-install' supposed to work?

We used the 'devtool sdk-install -s libpng' command, and the build
succeeded, but the package didn't install. The error is:

ERROR: Failed to install libpng - unavailable

Thanks in advance,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

--0000000000007023a605ea9f74b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<div><br></div><div>Daiane and I are working on =
the 3rd edition of our Yocto Project book and now working on the chapter wh=
ere we&#39;d like to cover the eSDK use better. We are likely missing somet=
hing obvious, but it is better to ask if we can&#39;t figure it out.<br cle=
ar=3D"all"><div><br></div><div>How=C2=A0is &#39;devtool sdk-install&#39;=C2=
=A0supposed to work?<br></div><div><br></div><div>We used the &#39;devtool =
sdk-install -s libpng&#39; command, and the build succeeded, but the packag=
e didn&#39;t install. The error is:</div><div><br></div><div>ERROR: Failed =
to install libpng - unavailable</div><div><br></div><div>Thanks in advance,=
</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature">Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. =
Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_blank">http:/=
/www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code=
.ossystems.com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>Mo=
bile: +55 (53) 9 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: +1 (34=
7) 903-9750</div></div></div>

--0000000000007023a605ea9f74b9--

