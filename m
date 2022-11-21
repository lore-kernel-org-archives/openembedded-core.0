Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8327BC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 17:48:27 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.504.1669052901424882224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 09:48:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G3coV4Lm;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id l12so19919691lfp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 09:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4ec7aZIrUufGB/umKBCLwMYRvHaD2f/nLwFZrRWVBQ=;
        b=G3coV4Lm48Vx8NU8skYea0HJR9E5xyaB/r02X+o31tulhXqeCwGO21sMZqigimtI/W
         hg5Fb7YwbyCGBb0KNLSHQpblEXdk0l1Yq7jQFa/si2GjaLz+WXgEJ4btTqtTLpQ4tcdB
         4zOj8HB9Vza8eTRvTSbh/Z6LQ3HbfuavGw3M+Ho1vpCrK5+crqsIwSdhgTs+fE73GUND
         5eqkbmI5qIdy4xnYsaRzsqFsGwXzN/kXCgh1mvd5iMYR03Ai1REdvaxtM2oKxN0oBh0e
         4gHCcoGmHTObJTg3/wb9/cmF8idHAlhdXzhhrkRLQ7gie7NbLg4g96SIXtH9N47rwd0R
         pyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4ec7aZIrUufGB/umKBCLwMYRvHaD2f/nLwFZrRWVBQ=;
        b=hIU/w4x7GvPfZfJUgKBK+py76OzNSneGJ62zMVaJxq72KGD83EEknhyK13wSyTm67a
         6SU/j8wNbW77fu04TcTHQgsg3GINYZqeY0I6rS6mH3yNk1VqBVX4W+vpsKxVnzkgeOb9
         tIUH7TwlzfbR3UjaChY2iG/iAahpH/ANqF6rqbIY0Qf+4AgFmAjpzhtTWxz5b8BUMqfo
         uE7dxn9zyLcD+KAdcmcgYv2yAste7/WaumXja//UeBUrV1l46NLYS02JQSebfpc5gQh8
         5kptjS6oUKSEDhMnr/kkW60j6ynmKb+x1MJJt0W/I5x55xjplD3r2J/l3ThS4c6/lCr5
         ezQQ==
X-Gm-Message-State: ANoB5pmhyNaAWIO4y1z4r/zPsO4XrDbH3kaDTN6iznnhg1kz/jvOG2g0
	DQGbh71zuKRg1jJalTZwO4LRYF1pzFlG0Un5jVA=
X-Google-Smtp-Source: AA0mqf4ZvVwelVWfcwGgkNkFpLXp/9we9lGGvL/zd1/RHfmxMHlieb08+UVzw4mgyrDvr8wuTQ9OPR6aIZpobjKCvDs=
X-Received: by 2002:a05:6512:25ab:b0:4b4:d443:6550 with SMTP id
 bf43-20020a05651225ab00b004b4d4436550mr1326320lfb.393.1669052899589; Mon, 21
 Nov 2022 09:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20221120175237.194899-1-f_l_k@t-online.de> <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
 <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com> <1729A925BA1D06C8.25787@lists.openembedded.org>
In-Reply-To: <1729A925BA1D06C8.25787@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Nov 2022 18:48:07 +0100
Message-ID: <CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
To: alex.kanavin@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, Markus Volk <f_l_k@t-online.de>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 17:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173659

And here's debian:
https://wiki.debian.org/Python/FAQ#Python_2_support

On my Debian systems, indeed, /usr/bin/python is absent.

Alex

On Mon, 21 Nov 2022 at 18:18, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Mon, 21 Nov 2022 at 16:17, Khem Raj <raj.khem@gmail.com> wrote:
> >> Python community has no plans for python4 whatsoever. Anything but gen=
tle and steady evolution won=E2=80=99t be well received.
> >>
> >> https://www.techrepublic.com/article/programming-languages-why-python-=
4-0-will-probably-never-arrive-according-to-its-creator/
> >
> >
> > Good news article although it does not say that python3 and python are =
analogous and python package does not explicitly install python binary or s=
ymlink either so it=E2=80=99s left up to how distros want to presume it. If=
 we want to do that then it would be prudent to see what other distribution=
s are doing in this regard. So we are not alone in case trouble arises
>
> Fedora has done it 3 years ago:
> https://pagure.io/fedora-docs/release-notes/pull-request/410#request_diff
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173658): https://lists.openembedded.org/g/openembedde=
d-core/message/173658
> Mute This Topic: https://lists.openembedded.org/mt/95156228/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

