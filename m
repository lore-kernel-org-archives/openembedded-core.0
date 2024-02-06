Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 363FDC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 19:05:05 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.1465.1707246297723340578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 11:04:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LaVZUK97;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d0abdde3easo31422741fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 11:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707246296; x=1707851096; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b/GAGoknJICAOXRgrXM2ZoYo8JVpcBFwHqGh+uQZJjE=;
        b=LaVZUK97woiA0/hobr3B2eFnSav2Y/XZM2C7dJ1hDjXHRwvPvWUZSvj9gbSPEzw51d
         B39gw/46l226YNHdecTOK9fxZ6tfjyu+9sPJ2fSQhGtdUJLrHunqpl4PrON5imz/2/PD
         ywqGndRXgViJpISoFQaenNeFm5ncT9OGB5qKBCZB64XLXQOW3Sb0RvHOOwzEHRyOXTSC
         R/WYVgMcQg7ZJHBSDqUAjs3edLibcGkBtoO0OV4dvghcPGLuGtFzoGEN0si9dN7BQ5gK
         rrQeHoRVSVTxNoV1Hi2ghg8f7pEyBxXiMk9iD8dzw6hjzf8TEaTV1nAfclcbexHWdVcX
         AMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707246296; x=1707851096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/GAGoknJICAOXRgrXM2ZoYo8JVpcBFwHqGh+uQZJjE=;
        b=q+GyR3Xu+Y6MEy/ztbVVU6oFfHSPRkpyH80KjVX4Cf8aqHuwxP9RdK8p+NgnJeYy6D
         sI1OLgk/aHzx6iErC4gfjYNXD0Rq7Q2/uiU4eHf56t5y8WBasBPXOsupzxPBUeocdo6z
         GS5jPyn5ZN3UO0xosp6asu0BgrN6H9T0L2ZBG0YwS+jSzExCeEgpRiR3MnpER64xGJcL
         tKu57Yl16Xs4QjTp4KczF/cG0GMDFOob07hf5IEVAfAA3qBtxjLY/bcfBXID7tEI0S6A
         53lkxFIr8uxxXpEXPj+wHjX5D609InOS+RjlCxFXPdzpg310aNzPruT2xlv8viR0YJZp
         99rw==
X-Gm-Message-State: AOJu0YyUu86uKtQXuJB51xHkqYOt2WBIsj741Vg68woTaIu1QfNlDe4y
	EmbkJRa8hKoe0gl2uOGmzjMjifm3VtsAmUfkFUlilfSJbanViTSS2oDiCX+5aew/djw8gTfx/7g
	8uq2JoZNnS3c1bZqByRNe6vDzos8=
X-Google-Smtp-Source: AGHT+IEDy7Oypd/BpE5zNfcxFPnc2zkDjjLIxpNowLneqtJ1CA0iyvZ1JK25u4OoCM8rmhJjUJfsc+JYQS2YplYKeQA=
X-Received: by 2002:a2e:8ed8:0:b0:2d0:b663:5093 with SMTP id
 e24-20020a2e8ed8000000b002d0b6635093mr2725080ljl.23.1707246295681; Tue, 06
 Feb 2024 11:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20231206092536.2874022-1-andrey.z@gmail.com> <CANNYZj8x2t2H9rj0jjjYW-GZqnqn_x6mNOJtydqUakO1sLU=ag@mail.gmail.com>
 <CAHtQpK69mRhcq6xMYLSgFQT7aKiXnh323AJP08noyMNX5fJMgQ@mail.gmail.com>
 <CANNYZj8-9PHqeiRuExw+kdPhCNspCERzH1zKA9O7L06F=bx27w@mail.gmail.com>
 <VI1PR10MB31822295979B4CE4CDB89E8EF784A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
 <17AF75010791E9CF.16460@lists.openembedded.org> <CANNYZj-zu9+a_zX21YWjN_SF0kL+rm=Fu5000s=an17r3SUaiQ@mail.gmail.com>
 <20240206190246a3a66e24@mail.local>
In-Reply-To: <20240206190246a3a66e24@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Feb 2024 20:04:44 +0100
Message-ID: <CANNYZj9nB+-L2V1rpyfnTrz5=Y-6GDd9bggtL50C35DbMFvoEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-layers: add option to skip
 revs in json
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jermain Horsman <jermain.horsman@nedap.com>, Andrey Zhizhikin <andrey.z@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 19:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195020

On Tue, 6 Feb 2024 at 20:02, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> RP didn't take them for a while and they conflict with your other series
> that I wanted to test. I moved those to my staging branch so I remember
> to come back to them.

Thanks, that's fine.

Alex

