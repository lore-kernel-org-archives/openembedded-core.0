Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C852C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 09:55:29 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.96103.1701770125664385716
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 01:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L0BkLyNw;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50bdec453c8so4326428e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 01:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701770123; x=1702374923; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2gpiP9h831YD9st/vH3iyS5GlBIeEf0J+O0pUCthWew=;
        b=L0BkLyNw998Iw4nBtqmxhe6adNQ91FZbTP/6Y/cPsCJixfc3PjGAKPy753mb0w2OpS
         yhUl51YcuTh8rvf7EpVUwNxsi7tDgNt2Fw/ToEkDM6e8mqnPYOD1qWYG9WEgmkY9zaKV
         HvtCphdM76AbIEfEk63AeRfnJvyu9s+AXTFJs/Saa9Yg8n3PFfGkppMYs7hJ1iO741n4
         QHqI1cyn2PnFBe1d0kISB3httDH943eo1s/tfTZahYcphIczWh2rhitUV+x89kNU6jTe
         hLme9a5HA3g93fcEYIQCP227yIvpdGJRDE1qHhUmUWbx+7FRKR1fOIXz6kdwKXUovlbd
         AD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701770123; x=1702374923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gpiP9h831YD9st/vH3iyS5GlBIeEf0J+O0pUCthWew=;
        b=IhXgtLNIeL1B37xHo1J9UG+ZC9tHRwKMbImsNhCHfJW09A7CV6Y5EDowFbRsACftYQ
         SAAIMZmB+H0S2YF2i2UDSmHycbzUnO/Gz81XQb8ULhUyS43O19MV6zBRX0gNsGC7lRTB
         BFkfX2UxUVXM+a8nlmcMt7iILdq9pulWKGTACEq1jwwgSdnIvSdl7UJ0/wjkYH2CoadW
         7+8uwS4mkGBXuq0iSqxfMlc5hk3d7tTGMjXib5yL9H8jVOKzo7ZrtIp5qAEFE76s8CjX
         Tueew7YYeaVXOuexxoHpPFxCBsm36cZbAomrZCnUJa9kdV24Sucb1D2SAUTTdmQ5LkCb
         Y6lQ==
X-Gm-Message-State: AOJu0YzP1chRuSwM3WUko4pmddzsld/xb4MOcWew2qedkRPwudC9oNav
	awdHZC7Qy4QSbHDkmVTg+FEAzKoFmEdIo852/yI=
X-Google-Smtp-Source: AGHT+IH2pJ7isyDZ6f8Cuey51fME4uDfNeNYgTwzKS6zvtyFSWIg0R3Bsj1LbjuexVLeGzLaV3gnLeVhnLB/PQ2Zszw=
X-Received: by 2002:a05:6512:328f:b0:50b:f412:8651 with SMTP id
 p15-20020a056512328f00b0050bf4128651mr1530056lfe.29.1701770123315; Tue, 05
 Dec 2023 01:55:23 -0800 (PST)
MIME-Version: 1.0
References: <20230630091451.3331563-1-changqing.li@windriver.com>
 <20230630091451.3331563-2-changqing.li@windriver.com> <CANNYZj-6GkQ-udC+Nd0zyQbwKtkfrr0hNKZ-AaMEUzgnTCNT1A@mail.gmail.com>
 <328B87A9-2B41-4B96-ACBE-C84E3575E1FC@arm.com> <9ef53c61-7238-f500-ba98-dab28b7fff12@windriver.com>
 <CANNYZj-jeX1Km0BYSS0HYDAeC+Fckmw0QA2u41iqA2PTmjuy6w@mail.gmail.com> <07dd26ce-3ffc-4799-9d6e-0d910477622e@windriver.com>
In-Reply-To: <07dd26ce-3ffc-4799-9d6e-0d910477622e@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Dec 2023 10:55:12 +0100
Message-ID: <CANNYZj-L-fycO7KaV_zM9QXnkOwKpC_7-UEsioqbSuroA=CQ4Q@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH 2/2] rootfs-postcommands.bbclass: add
 post func remove_unused_dnf_log_lock
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 09:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191812

On Tue, 5 Dec 2023 at 06:46, Changqing Li
<changqing.li@eng.windriver.com> wrote:

> So  I add this patch
> https://git.openembedded.org/openembedded-core/commit/?id=406a72a9a47c2735b7e18cefc682b1df00d5a9aa
> to remove the lock file in rootfs.
>
> Since for dnf-native,  it will not have reboot process,  so it is better
> to remove it at post process of rootfs, to  make an clean rootfs.

The review comments that led to the revert are still valid, and this
message does not address them. The concern was that the removal via
rootfs postprocess is too late. If dnf leaves lock files around, they
should be removed just after the dnf execution.

Alex

