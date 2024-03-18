Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F778C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 11:29:24 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.41055.1710761359151438787
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 04:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ac3nP8Iq;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d2505352e6so47449721fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 04:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710761357; x=1711366157; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GNO2t9cEJObXQIx3jEH0e98/Cmfm/gbNdQHRpIrpzbM=;
        b=ac3nP8IqtjRDcG398zwVpNutGPhaKVsJZ//8PkoLSGRO4tgUIxF28PKlJinS/ZD1Ta
         9cSzHRKhzOo5b+t58OdjHHjdg0jWZ0TE6Inl153gh+Yp0GVCrdPCsZVGXFZu+TgXrCEg
         CDjO8Wq/KQIy422Wcd7DPZQBDKUpOYBIrXPo8h3bzWXlZJwQz5u5dWJICXRosDPuEoCa
         pd7wnER+8wSPXL5KEjOEPoKZTDVCu3eCbp3shaASWgoZJke49wvm2aU+sX0UFnZXf0K6
         x4jEauAjiwQr7k276AtCGYWws3a2ymPmQOQC7ZL/r1zn8S/XKxmKSdof0L7KHwsW0SY5
         rgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710761357; x=1711366157;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNO2t9cEJObXQIx3jEH0e98/Cmfm/gbNdQHRpIrpzbM=;
        b=sr1kzFpjcGic1PnIN8ru/B23IgXaosoB2TDCaSx03ycTsYCq89BWluiHHldy/JhuXC
         3Dqnz7Xi8I5T3HbSzWdKlR0EAO8IJ9JiibZMTPHfuZF5xpGlalg+2J/tuXzLZ3EzEErE
         2/ONXmN7kKt4LJkqSpyqy0hM/0RUrLGUPk4dZyNB6R2iYMrcQLj/2iuhcpelDJMTfJg7
         WHWcxRO8N3/nZ4PN6Ert5OrlgoW+7K/ua5sbgpRABK1prTr5vdxCo9jiK6Q4t6y9owaA
         UJZHHk+PdFykW7icTgx+xG6m2XZTkRiJKZscEM4SYt/ffKBPEmvDLrkLRjLstYJRGhhI
         95Iw==
X-Gm-Message-State: AOJu0YwpwKA5OxOKuG90hjauowxCj7optNGGFkazzsMnrCqJVXkpe5TS
	MHH8siWAYcB0AMv3dYMbzIVsC2gsDTX5ZOq2AE29hFJ4XRRZPlqzNtfmHfw5Pbx/Sv9X3iQIJxG
	HGeCX9UyXl4FTij8Kjkz3nfXQ55Y=
X-Google-Smtp-Source: AGHT+IGhy0ypYeSHu83fSEePp5JoiRkROsGI6Nq+FnDbXjBrVfSIqzQufyJA9YdlyVm7+DkqqAvT+IwPMobwPd1Pq3Y=
X-Received: by 2002:a2e:be09:0:b0:2d4:2508:7fe6 with SMTP id
 z9-20020a2ebe09000000b002d425087fe6mr8296684ljq.40.1710761356971; Mon, 18 Mar
 2024 04:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240318090819.39645-1-marcel@ziswiler.com>
In-Reply-To: <20240318090819.39645-1-marcel@ziswiler.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Mar 2024 12:29:15 +0100
Message-ID: <CANNYZj-CbtvzfrEmKydGtc+i6osGo8Fr8B5+maCint=okO-Tcg@mail.gmail.com>
Subject: Re: [oe-core][PATCH v2] mesa: enable imagination powervr support
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: openembedded-core@lists.openembedded.org, Randolph Sapp <rs@ti.com>, 
	Max Krummenacher <max.krummenacher@toradex.com>, Ryan Eatmon <reatmon@ti.com>, 
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 11:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197304

On Mon, 18 Mar 2024 at 10:08, Marcel Ziswiler <marcel@ziswiler.com> wrote:

> +PACKAGECONFIG[imagination] = "-Dimagination-srv=true,"

This needs a negative condition as well, otherwise upstream defaults
may result in an incorrect configuration (option being quietly enabled
without it being present in PACKAGECONFIG).

Alex

