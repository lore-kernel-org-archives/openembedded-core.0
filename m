Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70433C78850
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:46:10 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web10.18589.1726839962013700112
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=u8xFWrV8;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.180, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6dffe3fe4fcso3464777b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839961; x=1727444761; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8C5+R2V+Ws5Zxvabnwz7as8ElSWPrUeFuN2gzy/eCQ=;
        b=u8xFWrV8yEHzp6aIbR2oMcBxy6OzYlIIWIHUQG+CzSG98fzB2kVZ2e7z4Tr3WEX67b
         Df4unc+L1BFNOAvBIsmvMHNR4AoyMgYvmik7bMPT8Mdq3Il0cNOgM4S8bYMgFxTzMcnW
         gbKe7ANzNXao+WgxTbKl4m9zGvxRjMdoKsg/iV7MshS6PJ4TH2M/TfNLQg18zpXmXioo
         3kAw1XJri7XXgJ6/qRYdPa/ZVXvMTIXCM2mnBpxaJx63e4JUE6QfvQXOFaRYMLczLozr
         qN2QmNjpNXo0U4ZK/ZjcEbgq3HVI/8m7caDaAtguWhkaoEVcUGAaRU8kBkJDI5hgT7aZ
         0XpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839961; x=1727444761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8C5+R2V+Ws5Zxvabnwz7as8ElSWPrUeFuN2gzy/eCQ=;
        b=wCwV5+7X4l9sgWUcabprWTABmuepT6rtFR1WLnCbHnXC9Wu5De/obi7U+ioh2IT/2t
         umV2Gda0rhbcvghz1tUluS571EGKQle8UUCcTFC0F3t7GU1OiCaz35s4EbjkETYKqBs+
         nMq07S3XkSmXdDfWItaW+7Z5n08ivd3tXO3GNrK9HZbdGd19vraLsFHYi6/dkIWd9oj8
         KbP+HZLzmaGD4bsRkBPW5A4Q6nGmALWv0PEHYWSXqRnPGbpoIsK+Xet+nayjEf/DaXTe
         ee31+3tNqkjXosfncTEUATewKP2AJ96h8QRdLYDfyacsNR6AcKYSXOWEUygyuYBfJjFP
         7JFw==
X-Gm-Message-State: AOJu0YzQzbJaiK5gDAqflUzimUkia8NrrbBJzE9BR/iGFixNn19jVeuH
	YSa2rfH597K4/4jZwXoLpNzbVIUd0Xp6SPovRONzU9itg6K9kjV5edUp5Z/t0CfvGtPOuOZo84T
	Xc8RWkBdXUeE+vPD2vd+p+I71YIWiPhKp7V6g8WFda3bpu+Ic
X-Google-Smtp-Source: AGHT+IGijTuoKndgbCJsHyYpb3oRW63MoSY9yalaQCp5I1TYUL2RjwoMjerA7lxf4wylZnzoBfGykBBVXVk8BJ45KKs=
X-Received: by 2002:a05:690c:67c5:b0:6d5:90f:d497 with SMTP id
 00721157ae682-6dfeed8a6a2mr27722017b3.19.1726839961173; Fri, 20 Sep 2024
 06:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <GV1PR07MB9120F0572204FCA4B6CC310FA86C2@GV1PR07MB9120.eurprd07.prod.outlook.com>
In-Reply-To: <GV1PR07MB9120F0572204FCA4B6CC310FA86C2@GV1PR07MB9120.eurprd07.prod.outlook.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 20 Sep 2024 06:45:50 -0700
Message-ID: <CAOSpxdaTsLy8NSEMMqjn189B=v8=pCZCGjwfFwaKiyV8bqP_-w@mail.gmail.com>
Subject: Re: [scarthgap, kirkstone] backport request
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:46:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204756

Hi Konrad,

Backport requests like this should be sent to the mailing list so that
the community can review them. In general I don't take requests sent
to me privately.

Thanks!

Steve

On Fri, Sep 20, 2024 at 4:07=E2=80=AFAM Konrad Weihmann <kweihmann@outlook.=
com> wrote:
>
> Hi Steve,
>
> could you please backport the following commits to scarthgap and kirkston=
e
>
> runqemu: keep generating tap devices --
> https://git.yoctoproject.org/poky/commit/?id=3Dc9a999940069623b95e8300fea=
d4838de9edccb8
> testimage: fallback for empty IMAGE_LINK_NAME --
> https://git.yoctoproject.org/poky/commit/?id=3D309d1bd9357e91934dce1e8fe4=
15cf945a264be8
> testexport: fallback for empty IMAGE_LINK_NAME --
> https://git.yoctoproject.org/poky/commit/?id=3D2de2968b8c142589a6fad47b9a=
82771ab7e5c0ab
>
>
> Thanks and in advance
> Regards
> Konrad

