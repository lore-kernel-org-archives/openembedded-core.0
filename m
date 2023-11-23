Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D9BC5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 14:21:38 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.92007.1700749296543399430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 06:21:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f3sGzkt5;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a00cbb83c82so132590966b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 06:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700749295; x=1701354095; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4aFmHKFUoA0L6ft/bZX2+oVAPl2B4RGg8Uhmpkjzw0=;
        b=f3sGzkt5CqapW1nqkXLb4U7enbRMmbCopRgc/dmfL8PSf/UK/mLmc98FzTsIA8dD+L
         i8R22CHdlhbgAyxr0nyLakukdaUk7QKTIDJXwEwNxa90dU1mqDgKLuL7upXbW56DzbHF
         2+uvsnK6g+IKsPGjEUy40ydL8Md6SqsBxvztfjVPyE9QCVWp/eA+WV6N9kPWuUDPcVjr
         rVeSPoD0NQ3znOojVv/j8/GCW89CB2Rrb+MUEUE1Dl1GQUfz/aXOzlfCG5Gj+4Jte9FA
         WiiH2rF/4l30VfSszrmJbt5PaEACSh6KiHLUzgUfOUBrUZnjXPpP9RhjEzabVT1s+oxr
         PZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700749295; x=1701354095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4aFmHKFUoA0L6ft/bZX2+oVAPl2B4RGg8Uhmpkjzw0=;
        b=cJ9Kfnpmlwpp3xJfN3fRP1Q7JGFoXMQyd75ZJIiZwGkXc6WUNe7JGU9LniDt+B4KYr
         M7zBAuWveDy4kRxoNXvDVekR1QjrYAXdK6pcdjDnMe3PHBzOGSWFiTNt+eX64WOCN8cM
         bdw+uyjx7qQA3Wex8bvY9dBRI7w/0BPLNpIM1lS49enPFOF0zdI72360tDgVvFXXdZYd
         cR5GwA6+Xv2hmJg8ZKFRr+yIa6fXuh8o2u4fqjSS3WOoXQf4Vr9lQKhlP6AqoTxXoYjH
         xgBzGBqrfdjjcogKBMqJl7K940ew/zFI9X77bxhG7IlXWttDiGURNST9FLRcnK6ptjl3
         Ks7Q==
X-Gm-Message-State: AOJu0YxZ1j0uD37R5KYTNyXZoMpAXFIjlz3Tz6zRaMRFdBt00zmmFQF7
	c/aiB+dMeysLTbhItiJfOCxnDC2U/V+u0Lyp9EgZCg==
X-Google-Smtp-Source: AGHT+IGF0MecWeLOLN9Gjy9LDhmJvF6GUCxD5Ne7JMdIGXVc78j3WpmJo5BIzf/JJO5n5InH4yrIDqU6m9p+GcyBNvU=
X-Received: by 2002:a17:907:cbc9:b0:a00:1c9a:a472 with SMTP id
 vk9-20020a170907cbc900b00a001c9aa472mr5238924ejc.7.1700749294666; Thu, 23 Nov
 2023 06:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20230608095227.34548-1-badganchipv@gmail.com> <31510.1700718321138957405@lists.openembedded.org>
In-Reply-To: <31510.1700718321138957405@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 23 Nov 2023 04:21:23 -1000
Message-ID: <CAOSpxdZLHZaO=E3TxmDM0MQUyQKZRM+xRrVccN2HQsF5n2m=pw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 1/2] systemd: implement
 --initialized-match/nomatch arguments
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 14:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191159

On Wed, Nov 22, 2023 at 7:45=E2=80=AFPM Pawan Badganchi <badganchipv@gmail.=
com> wrote:
>
> Hi,
>
> Could you please take this patch

Sorry, this seried is a feature change and not a candidate for a stable rel=
ease.

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191135): https://lists.openembedded.org/g/openembedde=
d-core/message/191135
> Mute This Topic: https://lists.openembedded.org/mt/99403398/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

