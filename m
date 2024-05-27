Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FC9C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 16:22:55 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.1352.1716826967758457947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 09:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DVSUFagz;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e95b03e0d6so29639011fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716826966; x=1717431766; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TSW9o91wzjRF/Am6GIRKYELHnqr7Y+A54kyjqxxnCj4=;
        b=DVSUFagzF+r6cEavMxfjyh3V4LwzM5+70Ay93pNx6SLyTDAautwiMMAo+NJzinTB77
         uucI1inKeSHfWhZDC/jssYEJzcIpz0KVKGftBH7GOx84wMIhkvLHrRpjkEYhHq9J/Rm4
         dAPc1A6DP2lt0Fb0bYPEEPeHMdGdtW7zE+/Eo9GGHPQHtCHt0F449dxXRSv8G0hjKuWr
         jfJO8CYyNVNrfh9seDY7UogdfrZyHmpCcaYWQMZ+oawLKnAPDuDz2PJJUxRynBgslVll
         R8//sbkNSga/7NFs8422ZppQj/wmrS0RIVmUNcHGaY2aCfXyb458iZUD8+y66gw0U7rG
         0j7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716826966; x=1717431766;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TSW9o91wzjRF/Am6GIRKYELHnqr7Y+A54kyjqxxnCj4=;
        b=QloG8lMSuFgJZVS1gDKu034a4Lhy2ZNTnBpqcHOwO78evqQOEf1SiUk6tF+WWL9+tH
         XPaBGnHpCKJetivLIfQW5cpxKtNOwEn5DA9eJonoiG+kOuFNGDSf1yTXpky7tpqm6WYQ
         qtCXiob3HWKBYv22cwwmmuigOAJb8tjNjbE8Pz3OZZhq5V9r83aPXAQw8e+U0G76Z3AY
         VBFtG6irs3nfEyY1LfUGCQkvcJTYprGKI1Dk61SJ3wA+Hkb3M/ATcU003oIlgKF1xndJ
         jT5MQxQc9p/HovFunNREnbLBvdM7FvoNmOaf0p/F9iYQGjSmOAF3UIpoOBTeiwi7ahuS
         +qKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ4NKTG5KggvHUy3l+O+haTzVnDinOjQLKN/6nEW5ErnOi7YqVB2RO+285VHmdhqZpkJ3/PWKFuHfQTs5qC/iyOTcHagw2PNnUgR3FyRQT6M5CKecwYRv6
X-Gm-Message-State: AOJu0Yz9SWLCYVr8ceW6oQBXLFhEjrkuVoBbAUeP00aWnabB3Bj/RcbF
	rAVbVsHq/IcTHe1VXjvkeO96S1csx05KmxUL8hkYPf/y1ZtyLIsXnECgGsZsFArYC5PtcKBWrBy
	1kOv2SziNq46X0r7nSvTvY5bm030=
X-Google-Smtp-Source: AGHT+IHDENeE1qntcchW64m4noTxaDE5rF0pQ9LEzmw84Q8DIzDYJcMMXZwsHJmDB4u2KaiDexJRZLmr84VIY2OsyW8=
X-Received: by 2002:a05:6512:2036:b0:51f:3f6c:f7d5 with SMTP id
 2adb3069b0e04-527ef21098amr3341276e87.8.1716826965733; Mon, 27 May 2024
 09:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240527161104.2954913-1-f_l_k@t-online.de> <17D364C190E1284E.7888@lists.openembedded.org>
In-Reply-To: <17D364C190E1284E.7888@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 May 2024 18:22:34 +0200
Message-ID: <CANNYZj8q1zqypRzFMdkt8hJ9bGGWjROW51EHO1P1fG-bFvCP2w@mail.gmail.com>
Subject: Re: [oe-core][PATCH] ghostscript: update 10.03.0 -> 10.03.1
To: alex.kanavin@gmail.com
Cc: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 16:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199909

On Mon, 27 May 2024 at 18:17, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Mon, 27 May 2024 at 18:10, Markus Volk via lists.openembedded.org
> <f_l_k=t-online.de@lists.openembedded.org> wrote:
> >   Patchstatus still pending. Is this the right thing to do?
>
> No. The expectation is that patches are submitted upstream first.
> Because otherwise they won't be submitted at all, most of the time,
> from experience.

Also someone already send this update, but without the patch, and the
patch looks odd:

  | ./pdf/pdf_sec.c:187:20: error: assignment to 'int *' from 'int'
makes pointer from integer without a cast [-Wint-conversion]

With this error, forcing a cast may be masking the real issue? int
should not be forced into a pointer to int, ever.

Alex

