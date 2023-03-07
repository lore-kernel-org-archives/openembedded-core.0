Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8948C6FD1A
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 16:50:25 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.20456.1678207816150535435
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 08:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YnVVuKQA;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id f18so17937770lfa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 08:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678207814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=au7bC8BVEy3nv/TSWOvtubZz+E+ZPvEj+EOXl6+HGoI=;
        b=YnVVuKQA3H6ZLsoz+Dx+pqZpagFkfV89QqETkUF6AalouDs4DSC/0VuVti1EXTNm+7
         l+UMWXNSxjhvPRwIW+2XOqV17lKIoKyTVFVVcTtEL7OoDTrkznCBdNoBieydJO21pssi
         HQa7Yhx1Y7T/KVqg+MG2746E4VsjuBQJ0bJNCjMXrYo14CBP1VqTnCfbX7JRXtf6Lulj
         BA9hf0uMRtDQWEEZfEW/ZynXzaC3YGgIYRPllMfHL0BnOPNpeQrCLUzZhS9tOpfDSvQE
         NEpSO9mXmm2i1GcFX3/4P7DsqvvTgODsHurL8fE6URMB9eiCZw3Hv7s6dvtFUE6KI63n
         kwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678207814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=au7bC8BVEy3nv/TSWOvtubZz+E+ZPvEj+EOXl6+HGoI=;
        b=ALzTZ1WGx9DdP0aCt5awmeoFLxL4PLRFMMDCL5yjVUf5e5ug4Jzb6qLsxvMzpvg024
         qj0I5MQFgp+moxNewxd8v4uyGITvasM3jte0XGAEnNzEi5T1uY+YJDExRthYNfGEBY4w
         8XRG9kgwtENdyzwCJPc2CJBcXdnu6dNZQfYbi8NwqXR3ac857vooDkKP3NpYrW2zt0Np
         ZaUPdeRUfX1M3b3rxmNeU0rhST1C+/WRaFVq5cD6TWhebh7orHW2I7sLhFtiYiDKyOcy
         sFWey6se+IK+qrluftP+EsyGkXMxjOihpuCjs/ruYghyXW6ywnsH6Kr8Dhh+Zo+p34Lc
         Jq3w==
X-Gm-Message-State: AO0yUKVm6dG1Tcq36TwiXTXoHcyT2x6VTiL0s0pPkOfZ+NuVHjVCOh5l
	1wakppwDtqlFD6vDu2CWMcm8huNcDT2pOqxYkOE=
X-Google-Smtp-Source: AK7set8k3FkApIZotUf7T8Yd8YO5uRPE4ZvKTBUKVsBsH73ZSVGm1pOO71AyiQpngTOivxnfURiBNe+dzU1C3iOD4ZY=
X-Received: by 2002:ac2:44d1:0:b0:4db:1999:67a3 with SMTP id
 d17-20020ac244d1000000b004db199967a3mr4554382lfm.13.1678207814258; Tue, 07
 Mar 2023 08:50:14 -0800 (PST)
MIME-Version: 1.0
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com> <20230306091108.3347363-2-zboszor@gmail.com>
 <CAP9ODKqgw7+wv9VWTHF6KrNmcVZzgdujKNTthWiM2zCxJZXKgw@mail.gmail.com>
 <CANNYZj9qaL310h66gXiP2ZR2f7ywhWHDzrgvFnyMQH7cFwArqA@mail.gmail.com>
 <6524a686-7e21-7c69-4fee-e17d4d757108@gmail.com> <CANNYZj_B1kxRB4bPWwCyU-90fR=ez0y=WGzdTjo16W05k5=Gww@mail.gmail.com>
 <c986ecfa-458d-b7a2-a69b-9f5cc4a3af0a@gmail.com>
In-Reply-To: <c986ecfa-458d-b7a2-a69b-9f5cc4a3af0a@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Mar 2023 17:50:02 +0100
Message-ID: <CANNYZj9p+zBOA=Ng_zWafM8aaw=dEMNMcD450XmbVcQJq9R++A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/3] mesa, mesa-gl: 23.0.0
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org, Ross Burton <Ross.Burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 16:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178117

On Tue, 7 Mar 2023 at 17:43, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:

> This looks like it's coming from a mesa-native build
> which should match the target build version.
> The problem may be that despite of this, it tries to open
> the host drivers from /usr instead of .../recipe-sysroot-native/usr.

Yes, that's exactly what runqemu does, on purpose, by redirecting
native mesa to use the host drivers via LIBGL_DRIVERS_PATH environment
variable. We could easily make it use its own drivers from
recipe-sysroot-native, but that means we have to actually build them,
which is very heavy (e.g. llvm is required for llvmpipe, and some amd
drivers). Unfortunately mesa 23.0.0 more or less forces that with its
version matching.

Alex

