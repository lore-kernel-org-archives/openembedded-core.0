Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701EEC76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 14:25:35 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.71734.1680531929632105928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 07:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iXFuZPRj;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 20so30567506lju.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 07:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680531927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QaExDnWJ09Foi0owCTpiBUxhruNz2G7HV4FZ1rd79pI=;
        b=iXFuZPRjPWWkqE/PP8iJL3DZkHMSaeuJG9kEQj/0sSDe7HJOy4z3ALa4S1u2f9T7wK
         /Iew63XsfJSQh/AKH2d3Aa3K5x6qX+/7V9VQ9ERpTVAFnSbn+eQz8aA3ITBSN7zmzLEw
         9CRzxRIP6x4QGZZMMoGCLA4Q52Zh8L1Fqc0m9EEVWeqPmvxaxF1RC8DJsQRiot8DJZPG
         wiFj8b+92F/WDU5UJKBiIe2VwgP7W1AjHDkGERI6WRVWH8BInj6f1OOJB+5y9FxRCNTl
         Q0isDWT09GxheZU2JLfFBVBVQvfdbqQZhuv8NgoBGKXwmH/FTEzxN0y4CxIa+O+Z2gFC
         IRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680531927;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaExDnWJ09Foi0owCTpiBUxhruNz2G7HV4FZ1rd79pI=;
        b=57liPktCJMDw8XpMOlO+NAiQ0U6AHmEeDcM9Z5w3FrQLcdRM4kFZXHyCvajADJQPi/
         L10pKLHrnnfaktbtOrKn3CtAnHETKGpV2/B3Crz849txVvLR2cjxm9uM7ALezWg+umwm
         atgQGIOi7ZylHDs4n2me6HyEXbdZ2YwNCtqZk8uM9bCkmNzQf3w4FK6dYVlSfuPQzfCn
         UJ5/H0lVMGYG2mOnXqlBfD4cM8gJRnILBmXcXNXgesTaSSH2YjJfS4I9Vuf4hQI86qA7
         cGKQ8YZRoI2tkiSwgpyTOlAcv21JOFWzT4BvUortxVDOd4k/1PDppqQYCCWt5w5RA2pu
         OXMg==
X-Gm-Message-State: AAQBX9cYMQdFCjDlRjYrpFT3VjpRiWj8TI+0oec30YOvRMj/P/hlG/X3
	vB3scMCVHs/Hcstmht/9nJjwozUgJFrQZHfjsb0=
X-Google-Smtp-Source: AKy350ZOIVmu6wPYtagI3QegoplAe7s1e4D3tzioP30vdIULNtjAi8avjR7006lQHlfxbnhaeElSlttBZk0p7nGO6+4=
X-Received: by 2002:a2e:a0c6:0:b0:293:39fe:b712 with SMTP id
 f6-20020a2ea0c6000000b0029339feb712mr11099503ljm.3.1680531927209; Mon, 03 Apr
 2023 07:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680190966.git.frederic.martinsons@gmail.com>
 <6279ccad3163dca527872a9144d63fb8f07c6f0e.1680190966.git.frederic.martinsons@gmail.com>
 <CAO5Uq5Sgt7EwB2DN_r2bB9nt7XQ_qi3SNrhbrVvB6Bru-XsjXw@mail.gmail.com>
 <CA+chaQc24hyg7mTKA+BkeTSPBT3bnuc8K0NcUHVZFS8obXrYew@mail.gmail.com>
 <CA+cAkerB9D=iztBn_VQDPQyDZUp5rMtfj=CwuU4aeFL=RDERbQ@mail.gmail.com>
 <CA+cAkeobeK=g_oGJvOsLEMDtcuBVwrFKuyU6gR-z1GmB+Sv2Qg@mail.gmail.com>
 <17514C0A502D4FD8.27612@lists.openembedded.org> <CA+chaQc5OdQ3esOkDA=JkvuRGp9fZNjfscZFcvoqbimdak1BfQ@mail.gmail.com>
 <17516A1097F71BFB.12651@lists.openembedded.org> <CA+cAkeonKef=fqSLAMh_0+KhbAH96CYUHPh1=AJY6c3J6UhZ0Q@mail.gmail.com>
 <d5e1d50d126eadd0530c0513bc0b0f4c062c819b.camel@linuxfoundation.org>
In-Reply-To: <d5e1d50d126eadd0530c0513bc0b0f4c062c819b.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 3 Apr 2023 16:25:15 +0200
Message-ID: <CA+cAkeoJu6ErHm0Cqhr-v9oKNhyoh3v_nnc8A0wzsZJVQqz_Fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5 6/6] cargo-update-recipe-crates: don't walk
 on the whole dir
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <martin.jansa@gmail.com>, Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008e18a505f86f54c9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 14:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179634

--0000000000008e18a505f86f54c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nice, glad to hear that.

Le lun. 3 avr. 2023, 15:35, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Sat, 2023-04-01 at 17:21 +0200, Frederic Martinsons wrote:
> > Hello, I just submitted a patch inside the bitbake fetcher to display
> > all the missing checksum at once instead of only one.
> >
> > For the moment, I have no better solution, let's see what bitbake
> > folks tell us about that.
>
> I'm fine with that FWIW...
>
> Cheers,
>
> Richard
>

--0000000000008e18a505f86f54c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Nice, glad to hear that.=C2=A0<br><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le lun. 3 avr. 2023, 15:=
35, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
">richard.purdie@linuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On Sat, 2023-04-01 at 17:21 +0200, Frederic M=
artinsons wrote:<br>
&gt; Hello, I just submitted a patch inside the bitbake fetcher to display<=
br>
&gt; all the missing checksum at once instead of only one.<br>
&gt; <br>
&gt; For the moment, I have no better solution, let&#39;s see what bitbake<=
br>
&gt; folks tell us about that.<br>
<br>
I&#39;m fine with that FWIW...<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div></div>

--0000000000008e18a505f86f54c9--

