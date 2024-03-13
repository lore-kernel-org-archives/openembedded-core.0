Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCC3C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 14:23:42 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.18317.1710339820450777381
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 07:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lKFLMs14;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d3fb16f1a9so10344651fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710339818; x=1710944618; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Yl94iQgP4MVZZcHU0PkWy02lnGoQdRgwuNwjyxj6v/E=;
        b=lKFLMs14LyDI67aL7xy4iYs+Yvu4fm0CMvAUP946iez4Jp0iiK52Lx0ZmzeUJtFs+y
         Pn/1B8uS2OXmjotCu+h8ilSbVuMMpTTWTruRSbn2I9eGrG4FTK8ZmknE9E2ZmuPZKgGV
         L1WFCO1OAN+5NElp98RQaWnWoD84jnFH/f5sca9/7w+I4Lu5BpVohf+fnt1iErqltcXH
         0IDKsyviNCxhboEZQRPrIt5GI0YynUHnfIrcqJcUKVWWzKdhJ2TDuL2pv4NueKfOBgcN
         A2WDn6F6iZ5DRMAHetj6ehZcpJQ08aKCDyl+EWSPNzYQZ/pd/XkwoMKlO2GN+oseMkdH
         Eq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710339818; x=1710944618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yl94iQgP4MVZZcHU0PkWy02lnGoQdRgwuNwjyxj6v/E=;
        b=VrKzYcbBevz60PGrdMMFjoNrFYIdFezElhe6eGVcTopdzA+xlmJ6nHOAQ/meX65RTZ
         Wyq06PafLwln7gTOZHPMHwZdMQ0n+19cUxlyvl8CuSMjGbJTR5ciOOLk2fdauYeRMRqX
         OQeSqWOEd783vASVqEJO+a2GJ03NSSOpJyw0KTfANtN8ZRv5Xen2UkrVUcvusPqUhyP/
         QoSDSidRtnkJ3gyV+Buhwj5s39tpefr6xezlce8HJIep31XYdcjGfUzKy2PJTqXAA5i+
         y2tNuBMSWu5Jy21btCktqOIAe28nSQFf2wpGHh2uLGbJidzmqWWSd4jGX7zfd8wGX1bR
         CWYw==
X-Gm-Message-State: AOJu0Ywbdq4MY2lNbM+V2R+YcJkedxS4Fw8ZOngxwARco9CGYCbq85zP
	Pl1eJZ1xLv+zSt5OuIxh7ktThHuMdl/Ft1kX6CA6lFM7enuz5MW/CM//EBW8mdK4rewmxi3a0D0
	zMfhKVjcMpo8g82++0X0Lra1yhO4=
X-Google-Smtp-Source: AGHT+IHF29v0GqIBaZ3NElltncxRTcbDmwlz/L4mSRSuxU+a+iHrKTBdGNUrNenzLG1TOp55weAUJgP+JWIDMh/UFEU=
X-Received: by 2002:a2e:3506:0:b0:2d4:6821:8b0f with SMTP id
 z6-20020a2e3506000000b002d468218b0fmr1045258ljz.0.1710339818320; Wed, 13 Mar
 2024 07:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240313141940.146208-1-marcel@ziswiler.com>
In-Reply-To: <20240313141940.146208-1-marcel@ziswiler.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Mar 2024 15:23:26 +0100
Message-ID: <CANNYZj8vXvxmqtOGbUfEkGOB814sGmTmCbqiORwUCSgeD0bgbA@mail.gmail.com>
Subject: Re: [oe-core][PATCH v1] mesa: enable imagination powervr support
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: openembedded-core@lists.openembedded.org, 
	Max Krummenacher <max.krummenacher@toradex.com>, Ryan Eatmon <reatmon@ti.com>, Randolph Sapp <rs@ti.com>, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 14:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197042

On Wed, 13 Mar 2024 at 15:19, Marcel Ziswiler <marcel@ziswiler.com> wrote:
> +EXTRA_OEMESON:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'imagination', '-Dimagination-srv=true', '', d)}"

This should be defined as a standard PACKAGECONFIG setting, no?

Alex

