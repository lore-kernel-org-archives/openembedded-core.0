Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADDEC3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 06:57:14 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.5369.1692860229305285326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 23:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GQCoJgVz;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-500760b296aso689845e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 23:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692860227; x=1693465027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7itnKuVrqWT3eVWi9xJUUt781tlVhUd17WfT3k6+FpM=;
        b=GQCoJgVzuGa99W+cRZHb5jWXvy+BJI5kjq040Lqi2sINT2JDYlFhv6NY/Dgau1ljJC
         hQ75no9YUFDFBiZhVlHxJoXlhW+Q5+C3Vl6gS2rpwXEUCt03lPxz1hI2Fn0aT70Sfj0t
         4MzTauOZvF/JVFf35uq59vTijua5RmJC4H5nSGq6q8av7kY/vMY18CeqS5ETK87Uber4
         ZLeEvoYNoOXp1n2vbjkZm8dkqSeGV8+px2GMa7ldqTTo6cveIBbKfbZBQt65eyM7QURD
         Cqa11iN13xjYriQ1Zu1RsZIjChCeUGLjvJf9mP11hpslKNq4V9G2710ebD6FLNTWB9RI
         Mk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692860227; x=1693465027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7itnKuVrqWT3eVWi9xJUUt781tlVhUd17WfT3k6+FpM=;
        b=iMgQSrpgZJEHdNbLLpQOO1Pz9IkAcweyoy/CPCG5eBp5dV+NNrqCOCMWd0TW3ClXEc
         giDK5Vrb7P1fxHg8yGqoKoN4M+MT+ztpigYte9+Oks1YxKiGE4sFvnWT8cvKc8WjJScG
         2qFdItvrtN/cTKttuPCj8vTwNCe19mykInFWTFNgVU1Une/v58CoFafq2mBVcI0WRRzB
         y5V0LE9zfd47NABy4fg6VL2VLnG7sG6CJsoyeoRE+t3jqkTdOw9nIii6VdL9GonStMZU
         PNlVqU+WW0TXcQe8g1v+NuDCGTjvx3tR7bBK6fHu0unSpZaNk+bcIHPZdf4/klyfFWe9
         +N8A==
X-Gm-Message-State: AOJu0YwaIW+i/iSYfgzy+IXVLOjbVj4n7g6ZbYny11gWf/DicAmuxa6X
	XfWVL5jlhACvvBwiDUumBJ4E5pXYmrJlAOEuFcY=
X-Google-Smtp-Source: AGHT+IFma0q8GTldRdcMAYE+dspphYlqqrTVONVs5DlSkqh1aUAECgEENmT+nFemakWnBrTuAKAnBjn+KYKRo3Sw44U=
X-Received: by 2002:a05:6512:282c:b0:4fe:28cd:b3f with SMTP id
 cf44-20020a056512282c00b004fe28cd0b3fmr5128292lfb.5.1692860227111; Wed, 23
 Aug 2023 23:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-9-mikko.rapeli@linaro.org> <CANNYZj-FK42Y4+cZNg2uekOPipQDPAq8HmXn4r4zLSiUTq8DeQ@mail.gmail.com>
 <ZOb8dy1yGpNJpJSI@nuoska>
In-Reply-To: <ZOb8dy1yGpNJpJSI@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Aug 2023 08:56:55 +0200
Message-ID: <CANNYZj-S7+N4S6xZ+FWJ5tC5RgDnH=_3Feuae0UdYht3DgNLLQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 9/9] oeqa selftest runtime_test.py: skip
 virgl_headless test if /dev/dri/renderD128 access fails
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 06:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186639

On Thu, 24 Aug 2023 at 08:45, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> Then this change is not needed at all. Test already fails if render device
> is not available or if access fails. In my experience very few environments have vgem
> driver loaded and "render" group permissions for the user running the builds and tests.

check_render_nodes() in runqemu could however be improved to check for
permissions as well (it currently checks only presence).

Alex

