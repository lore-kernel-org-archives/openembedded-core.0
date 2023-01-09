Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F89C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 09:20:47 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.67343.1673256041599457920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 01:20:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=foimGN0y;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id y18so4680557ljk.11
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 01:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c3ON79ZejYi2R9awV9KEBFRFrumuBvEcdh9n3+NZGY=;
        b=foimGN0yzxa0toWMcJlkmZum0U7PXDYg+Nk596wh3o6FNG8Gezd/dhyJMWEeQHtVPF
         3sTcZQxt2prl0T/GAU0WQH0RqrlnKfRXyjFlnX7iqTqBcUcBlwEPxd5AsjWi7+ORa70M
         4JNWT1DRm3lpu8j1IKWhREjsNaE+t8Zrq+JDh+lWQT5ryOhZk/ShdKin1RtHIEr6tywv
         EnqJaH2s9HkD5pMbK1L7JbTGatg0RXyWywjy5HlyYGaSfYj0EoBWLHetyPpImO719YHb
         2uoJEx2cNNaxsRcM7D+F5OSsJtoB1zdYCnTWOiO/yJdap3yDTiy8EV/U0/Veq5oDgHKn
         CCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0c3ON79ZejYi2R9awV9KEBFRFrumuBvEcdh9n3+NZGY=;
        b=OeDTKFQT55FyIEwMf/Y6wnzc0HPVu+WVQiiMVx2Jv3w0I4HW6HnRtIe3WZO79apAHn
         VaZtePEPIns9y2PQkKFucanN14xKheOCVBJEeWLnuFufn0dncQ1X8dFhG8EnRn6iPsBN
         zMlxA3uSpIxEc4X072imn1E4U4GdT597zLy3knUHFeXKJLiIPtpyFATcuR488suKFT9U
         0K+L7RETMYFAhWmSxCLWpwoz4j3C3qiRk7sBCARYhjq/vT/oAKDnusStwjDTTxd4h5Dx
         sf2kUoxn6BKDapGvMN0DwR583DCSPxjKlbVEOkfj/Q7cwTX5vdjzwR7sprmIr/V5JQTJ
         WYFQ==
X-Gm-Message-State: AFqh2koQUVVJuc8NB5W34BdpPIwCeWSfQ2UD//pqJ+GiBZx0T1eR1qxF
	VzIIf8YufXgxiGLudHW98nqDYT6i7xATLaOSYNA=
X-Google-Smtp-Source: AMrXdXu2OJ3whB5/7962naJXSVlHsqzhVIKzBg19Ekm5JtKF4n1MuJ67m6dGOYFZvDpWy3WKV8Aav3olwzSduy+BOmU=
X-Received: by 2002:a05:651c:1426:b0:27f:dea6:3d2a with SMTP id
 u38-20020a05651c142600b0027fdea63d2amr2923695lje.45.1673256039511; Mon, 09
 Jan 2023 01:20:39 -0800 (PST)
MIME-Version: 1.0
References: <20230104114555.575278-1-kubiznak@2n.com> <17371904FDF90491.29426@lists.openembedded.org>
 <CANNYZj8Qfcs+X8yGRiHZJygZ0RH4n=KDsKXkXO-+duY=ycRS5A@mail.gmail.com>
 <35848697143b4b3a8612c027d8852575@2n.com> <CANNYZj9eVWdxkuSVgur0WvTd3xNLECWS5mZ1nZg+q=WPO8PBGQ@mail.gmail.com>
 <6351b082f6b748b7bf01d4313c648861@2n.com> <CANNYZj9sEYON_ymHC8-8hyu8kq4jspCHDEF2TyxU1qCcOu3+kQ@mail.gmail.com>
 <e46977d84bbc4fd6ba7966b02937e8e9@2n.com>
In-Reply-To: <e46977d84bbc4fd6ba7966b02937e8e9@2n.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Jan 2023 10:20:28 +0100
Message-ID: <CANNYZj8LTq_oXKzZUGYjjU0AU=Q8rXvaM0ne0xvz_CaNAV0NjQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] gobject-introspection: check for GI_DATA_ENABLED
To: =?UTF-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 09:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175673

On Fri, 6 Jan 2023 at 19:52, Petr Kubiz=C5=88=C3=A1k <kubiznak@2n.com> wrot=
e:
> When the patch is _applied_ and g-i is _disabled_, graphene does build, b=
ut some other packages don't:

...

> This shows that these packages depend on gobject-introspection and/or its=
 dependencies no matter whether introspection is enabled or disabled. I don=
't know these packages so I don't think I'm able to patch them properly. On=
 the other hand, I still believe it is incorrect to pull in the unnecessary=
 dependencies when g-i is disabled. What do you think?
>

This is what I was worried about. It uncovers a whole list of
failures, and creates a new maintenance burden going forward, as
fixing them will be an ongoing activity in the absence of an
unconditional g-i dependecy..

If you have a bit of time, I'd suggest that you check the failures one
by one. Some of it, like missing glib-* executables seems like a
trivial missing dependency which was previously pulled in indirectly.
Others, like python3-pygobject probably have a hard dependency on g-i.

It does require navigating your way around unfamiliar source code,
which is a useful skill in yocto regardless.

Alex

