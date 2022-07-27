Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF3CC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 17:56:52 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.22987.1658944604182491183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 10:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J+/8F1vS;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id m12so27105511lfj.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 10:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oXzs25r4+62TKZHfvFIq0gkn2qgkSlTH3CSMPNfAZag=;
        b=J+/8F1vSrbVx5UO4oc9gcc02UDYtZ7vcCR2H0S++0Vxsnza03tvppitFXS0um4kcIQ
         2S6vcN54rcB6w86PocYgfI6KVX4S+bx+xAX4MOXGdNSBy5Xy0Iq+H0ZQy207N2kPjyR3
         /RJ9wkYgAWWzC+/2vi1flF2oA5xaNNVG5ccWaPqctvl1m4TIIgTRb4OHiIVUpw9PN29U
         u6A1v1b7yWZv81Yovqfp3LIyPTFWlRxSS/hfHpaa4QJclI2ND00t81tduolRdXl1t36l
         9NyjqHDYuKkbvBB7yTk58arBmqP/HeQIcoP72zLfQ57ywlc5ugNQ9SerBbii52Y3FpJ5
         XZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oXzs25r4+62TKZHfvFIq0gkn2qgkSlTH3CSMPNfAZag=;
        b=VNlabzX0poEtuHpCXi+vAQv6P6CAR7h9oWrhKrFGJ0b9Kn4FEvzdN1KZIWoJZBz7yN
         DoU5mrSwGAEZSrTkRoZpJJ77rW5apqHSdtVEsl2iJIiRmHjahXkckM4yrXuw4ke39T9F
         +mh5j0onQfJTn1aYQMYUhQA5hq4htYqGdUVcpoVv0i5nlwkhfXFOSFafvT2aa5oLkbZR
         1tnKhl4cxyori2S72sBnF44AAnUDT/676uPbXErx7LwcPUsi0MtncKSDMtkzMoG8Pf57
         O/ZLi5x5n2vZJePtG0wzARoreJTi7oYvNQPjH6pMdmstWL539yPBQKotuX8+G1w9cluW
         3yEw==
X-Gm-Message-State: AJIora/E1KkOScCxea0ZFW2CjbZeNJ3KMaCmHUAss7wVlYakmWDERX3Y
	ifIaEJl80cNvibW6lP8vA6MJfXtQS6X1pMy+yFw=
X-Google-Smtp-Source: 
 AGRyM1v2nKugYTyfvZT39ggQ7+/6toFbhevII7MyYV4UockUki3k0G05/PtRKyiUorhRxecOHDo3im783KxQPpeSAFQ=
X-Received: by 2002:a05:6512:3403:b0:481:60ae:7ebc with SMTP id
 i3-20020a056512340300b0048160ae7ebcmr9107173lfr.358.1658944601945; Wed, 27
 Jul 2022 10:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220727120036.633822-1-otavio@ossystems.com.br>
 <EC73E18E-0AA2-4655-8A53-EA278A198969@arm.com>
 <CAP9ODKpT6y0qvhryKm_NqTX82dmOytSU34yR_-8fG=WGZ06QNg@mail.gmail.com>
 <PA4PR08MB7411B7CCCEF2AF6FFB1EA063E8979@PA4PR08MB7411.eurprd08.prod.outlook.com>
 <CAP9ODKpo9=JeKvdEK+kX5_2gVWv4haSyU1jYgFLGcwPci8qMsQ@mail.gmail.com>
 <fb3e160b-4c49-f08a-716d-1ed69ecb3c00@gmail.com>
 <CAP9ODKq_i_BvaOQ4RXHe=ebU=7vgFV8-XxKtLgFYQRLOsEoWWw@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKq_i_BvaOQ4RXHe=ebU=7vgFV8-XxKtLgFYQRLOsEoWWw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Jul 2022 19:56:29 +0200
Message-ID: 
 <CANNYZj__efQqVNqFbGbCqx1nKpouzj+q_cQaG8BmJSZyFB_uww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libusb1: Link with -latomic only if no atomic
 builtins
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>,
	"Purdie, Richard" <richard.purdie@linuxfoundation.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 17:56:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168585

Adding s-o-b in behalf of others is not allowed, it's akin to a
signature - it literally says 'signed off by me'. The only s-o-b you
can add is your own.

Besides, RP should not be fixing up things for you, and when he does
it's a favour and not an entitlement.

Alex

On Wed, 27 Jul 2022 at 18:56, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
>
> Sent :-)
>
> Em qua., 27 de jul. de 2022 =C3=A0s 13:45, Khem Raj <raj.khem@gmail.com> =
escreveu:
>>
>>
>>
>> On 7/27/22 12:41 PM, Otavio Salvador wrote:
>> >
>> >
>> > Em qua., 27 de jul. de 2022 =C3=A0s 13:35, Ross Burton <ross.burton@ar=
m.com
>> > <mailto:ross.burton@arm.com>> escreveu:
>> >
>> >     Whoever adds the patch needs to add their S-o-b.
>> >
>> >
>> > The patch sanity check should warn about it as it does for the status
>> > header. I said, RP can add it.
>>
>> RP can do, but he can only do so much :) lets try to help him.
>> Its not something that can be added during applying patch which could be
>> done, this needs to change the libusb1 patch and then final patch
>> regenerated, its better if it can be done by you and resend a v2.
>>
>> > --
>> > Otavio Salvador                             O.S. Systems
>> > http://www.ossystems.com.br <http://www.ossystems.com.br>
>> > http://code.ossystems.com.br <http://code.ossystems.com.br>
>> > Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>> >
>> >
>> >
>> >
>>
>>
>>
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168580): https://lists.openembedded.org/g/openembedde=
d-core/message/168580
> Mute This Topic: https://lists.openembedded.org/mt/92647443/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

