Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9B0C7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 17:41:54 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.1224.1679334113294718567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 10:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kMELojSu;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id f16so12965857ljq.10
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 10:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679334111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ay14/ClDQuYtL8NNl5g2AUlksge13stxC6ynbmwkeGc=;
        b=kMELojSufjFStwVaU1+kHPoSfgnGoIpTaoGL31R9giuDUahtuvcz9zJtX4r5p7IdM5
         YKV5OrPC565aUxeyvnwr5DI3dB3pjuyuPOV+ExhCRXrCVI4X3HyPpZnz6gihqPvsrjuh
         imZh9qihBn+kty99/FD/KBMoWkoR/Y20qgdBycEXeJOsDowIX9BPVBp573OP8iL5EX5R
         DYdlTfd448dngM+arBQE3tnA8ot0HB769XkWLrFxSgW9fariNhqphr5QmPjMdXavGxdT
         Wb5cqMU99fkPHl++hHsAfedG24gOedGRA31CFP8dn3y7/y5LOA2fZlZQYOW9tI3+em4F
         CAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679334111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ay14/ClDQuYtL8NNl5g2AUlksge13stxC6ynbmwkeGc=;
        b=Bu6tQV8AJ0QXASposyQfGS1SMESoVie4m3TWL3hGi0GMttk7kb4bZYQvw44sQXNdCy
         qf5WSNYLJ7fnpQsn9sxnTuViD3LxmbSs6EKe8rf0/b5exAe7ErqsbzEVuEx4qIKpuNZb
         Iar9lBWBt/ij1m7Fj/irI+XxftoFkt1s2exCGBNqxFYKHftNRwNnIltEKEXXpHIMQovP
         n4qb1MXAIlSxgVdxc37FSPNBnx0k8wL0hzMU3t7f1VK2BGueEJiNuOpGrGnptg/bhCDW
         13lLxdfNxIIc1kSXY3yTfQNhN/l653eYqRwmtGjdYUFeMKW4jlInx3jSwAx85tFhVhbB
         lEjg==
X-Gm-Message-State: AO0yUKX5X1vQ/BSrJvXYV/gFmdCWZ4uSL+CV2ZwMQHI94IxzIkuJ2nEZ
	FtmncGpQfYZtq33uhwhbaQv8+WpOH9dP5XlR7K0=
X-Google-Smtp-Source: AK7set+1kRRwn+X9DrNbCiJVP5BcQAsdDnTQah2idpGUhbL2kONdRRciYCWyZNmvBYJX7/WFumeg138H+P3SG3FU0oE=
X-Received: by 2002:a05:651c:b14:b0:293:4ba5:f626 with SMTP id
 b20-20020a05651c0b1400b002934ba5f626mr498555ljr.2.1679334111350; Mon, 20 Mar
 2023 10:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230316094102.2628727-1-alex@linutronix.de> <20230316094102.2628727-3-alex@linutronix.de>
 <E06BEA96-189F-4FCD-B524-0E00033303C3@arm.com>
In-Reply-To: <E06BEA96-189F-4FCD-B524-0E00033303C3@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 20 Mar 2023 18:41:39 +0100
Message-ID: <CANNYZj9H_SnFWCY-71yh=4c64LcmBNw+Yqt+uoUsnnQ_ACZH8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] mesa: enable a rich set of drivers for
 native builds
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 17:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178839

On Mon, 20 Mar 2023 at 18:10, Ross Burton <Ross.Burton@arm.com> wrote:
> > The one major dependency pulled in by this change is llvm-native
> > which takes just under three minutes on my machine. If this is
> > undesitable, opengl can be removed from DISTRO_FEATURES_NATIVE.
>
> Grumble build time grumble.
>
> Can we make this a packageconfig that is documented heavily in the local.=
conf sample?  My builder is headless so I disable the sdl backend in qemu-s=
ystem-native already, and I=E2=80=99d be disabling this too as 99% of the t=
ime I just use runqemu nographic, but I don=E2=80=99t want to disable openg=
l entirely.

You can disable native opengl on the native distro feature level, but
keep target opengl enabled, would that work? I'm not sure if there is
a use case for native mesa without the drivers.

Even on headless hosts you can use egl-headless, and then a vnc client
will show you the qemu display.

Alex

