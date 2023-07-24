Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1F49C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 14:03:11 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.47586.1690207381780521103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 07:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sIGkuBeR;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fbf1f6c771so6643958e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690207380; x=1690812180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lHKg+1Y7gXUutk/B5K0wh4FnRosvNKU8Hu9SU6OvcD8=;
        b=sIGkuBeRBaEmYmCXsdA+9Rr6jQjLsZwKRZOlyoc6hu7aJI5CHZ10cuhzNmikJZOqu6
         CH2Y9IVZPNk8BafeBg4weCZJqh5kK+ph46tJcsImSQn/PWtpiRvLNsNJg5QeuPj+VISD
         eolVrHlH1LYIpmzbusws4h0cvtuyI4Cz/ahwvOVFybDhrQxaWGMdBDmfq9Ez+I2GM+Es
         SBqdVPdSg53MXdVUye6p4xEVTgtiu5M02Ho8tJEijGCwZ94oCajqfiMTZeJHxhoV96+t
         CfH0ZsNkGPyKxG5pnT5nGCN3CfLsvjNZOxWg6kcobI6yWs46kwKL8jzXVn+Ny2hnAvhC
         hBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690207380; x=1690812180;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHKg+1Y7gXUutk/B5K0wh4FnRosvNKU8Hu9SU6OvcD8=;
        b=GZX+4KSiVpj1ZUcabEIjjWqnkLSQu4OH3zMe3VFPV4imhnReG66XwQX4+el0fvsJRd
         zZ7BLVEIwCZm6m/s6Hso/3l0ITvMPeJcLW0+8Td02LQDp6bl8E3LJhv7F1D1XD8e0Pz0
         8ckUiZjGrrfzehfOADuWQFD88vpMqf+ST9vWsrplFvMfoWMVZxu8NYfCHTAU12Q1liLq
         9Ubn8qqH9DAL32VDg4yOoPw75LGNwOWEQbyGoysgD+rdjm9y0eiT8jG/s+UipnHYT8Ob
         g1r86V3dZgwNtGgo5Cz1MD0gSArutTsCwcQA9s1hzOsOqYu5Pljq/Imrgd7K0DWBQXVk
         V6uw==
X-Gm-Message-State: ABy/qLbhQWESmkzQnLZNdYVbQoT3xi1fFS7foNT3qbXvrQDCF9lBsqL7
	neyVgDA6aI9lazOcl3Mfqqu+tFlHCbdlVoesy3s=
X-Google-Smtp-Source: APBJJlGPeLB+2WAxEJ0OStWde5rymqIc84mt1rGjhN6ZjSM18t8kmFvXbRZTdBUK2NhmNL/bBbCA9Lp6v0h4nOs/EGA=
X-Received: by 2002:a05:6512:3d28:b0:4fd:fad6:8104 with SMTP id
 d40-20020a0565123d2800b004fdfad68104mr1293031lfv.61.1690207379685; Mon, 24
 Jul 2023 07:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230724123529.288581-1-zboszor@gmail.com>
In-Reply-To: <20230724123529.288581-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Jul 2023 16:02:47 +0200
Message-ID: <CANNYZj9FLbQxnbhd-Lzcr5GB3Ycf+35O1eADZ51EuVNg-eN33A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <Ross.Burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 14:03:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184791

On Mon, 24 Jul 2023 at 15:51, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
> +        sed -i \
> +            -e "s:^%_lib\t.*$:%_lib\t${baselib}:" \
> +            -e "s:^%_libdir\t.*$:%_libdir\t${libdir}:" \
> +            ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux/macros

Can this be refactored to avoid sed please? This is both difficult or
impossible to understand, and is prone to silent regressions.

Alex

