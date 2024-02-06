Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E8AC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 09:14:44 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.17772.1707210878845100079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 01:14:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TY/PdEJX;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d09faadba5so31716251fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 01:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707210877; x=1707815677; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MZMNwbN1nmi2mPpmPaIQggr4xypupjm+XhWs8zt0nBo=;
        b=TY/PdEJXUszKHFulRB85Uw56G/lyLttujAQv6WhTswZ8RUcYaPqqcsnBOPHT//FzOg
         UICvQrR9IN0VIJR9xCHV31/hKoHLZ7JI8o9YPbDbThs42fXCTxOX60iaoyTYCqfifq4m
         nW9W/RVRtDBQi1p0pHCOH0aP6/N2qz+UYDxmsRaOmHhGcCh9FFhl7d7G/1NkeYGR4q/S
         EA+iYnBGfCh0BgRR736xQLL7Amx4Ww6nu5Rjyrv6KoTmM9MTFLULYUN8EzN4nrijWm8d
         amzTlUiuAGWp6O6TenmyNNNsUW4CK3V8s02Ka80/clLI4wGYUW/Ok/qPot/T3Uii7RRr
         DSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707210877; x=1707815677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZMNwbN1nmi2mPpmPaIQggr4xypupjm+XhWs8zt0nBo=;
        b=TvcxCZXNmV33ygOncwvGmjnFVTfhR8Bq0PQQTsIV7lZlSgH8CBdZyuWrC+7xWZrlK8
         HK1tdLaqTssC1IQ1IiT99j7tW9M/TLpLSP92vC7UlAkqxoTGZNS6gxZLcpaQpfnDl+zC
         AkhTbrICmolaGGoz3/3MdzX0yoFfnRby8jEz0P8wqTEukd7EvSj60CxluMXu2wFuhX0b
         wSKrF7/XJFtK7Y4H3sZwklQB9Gk5kLts8lbx/6QIlI2xCKEc7sVfZ8l33U/cci9hlvBo
         GSvjtt3UbuFJ0++QAylXGWbs5lz4Aol2nnKDS+pn9LGMTd8Y7rFbSbFPjctWkXO/T955
         yvYw==
X-Gm-Message-State: AOJu0Yw8qzY/wyN51Dw1bpmZChNzLuGLHNBB/1aEt9FNALvcahxstT5M
	8saiLdOexsdFQKtUtOZnD2jEkr361zB1BB8T/e0tVYFgDHI5zsx6lvRtuz2puckDGkPTJWthxlb
	LVE30NVnG1iAU1XaqfzVLBfW1wCA=
X-Google-Smtp-Source: AGHT+IFO39hk9VMqDhosBdZL4cRYFrgLeAzf5F3MYPRLnq8nKBhu1eqX6VfcTUjiTXBElO7vR0thlQAXfZBuNXbfCmU=
X-Received: by 2002:a2e:be05:0:b0:2d0:9a6e:80 with SMTP id z5-20020a2ebe05000000b002d09a6e0080mr1933457ljq.43.1707210876666;
 Tue, 06 Feb 2024 01:14:36 -0800 (PST)
MIME-Version: 1.0
References: <20240205151102.512785-1-alex@linutronix.de> <d7e39b1da1b558882c14daa7ff05b8af448bf747.camel@linuxfoundation.org>
In-Reply-To: <d7e39b1da1b558882c14daa7ff05b8af448bf747.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Feb 2024 10:14:25 +0100
Message-ID: <CANNYZj-Fg6JOV9TH2eTOTW74XmFP9qmeYkhDxLsZu8Sdgo=TWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] lzlib: add a recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 09:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194977

On Tue, 6 Feb 2024 at 09:29, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> There looks to be a multilib issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8577/steps/17/logs/stdio
>
> and a reproducibility issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4338/steps/12/logs/stdio

I sent corrected patches.

Alex

