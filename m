Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1131FE7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 15:13:54 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.13603.1733411631236293052
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 07:13:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T9IVwse2;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6952e2257so71442285a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 07:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733411630; x=1734016430; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8XnpzHRTTRSugFVdbKplVaVXv92LRxYvRvoRvUvs1kc=;
        b=T9IVwse234HT3L7WLKhhpIlUh6ftcI6xmsqFLhmdOL69P3a6/E/uwg04YkRthHDIJi
         jDjbKEEXABeirpVbbIf/jaQ8y88GmT2OrG+kxDiCr/F67aQEvnmoP3skPUqtuIjjeyXb
         dqUai2SXJCxYHoqZ27dldraYnDCVgAgvw2M4LBUyAQqpkM3z9nHKjYjzBs2DSSdR1lAZ
         hM3UkYlcO3bMHs2y5T+LXC1HNODiRvDAbPy8uHddTl7iM+Tn/cwub8613IndU92GRBkD
         EERVlPyhRA0q/hDxpMMS7AUMgPz0gkEkUz2RJbcOzDu+OkXm4sSo1/+mL1/xU4+eRKf5
         Vryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733411630; x=1734016430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XnpzHRTTRSugFVdbKplVaVXv92LRxYvRvoRvUvs1kc=;
        b=QBw6AxO2ob33TOoBaTj26U9kbff1naF3uL/6DlAjl1eYC55OxoySx5kCW/RXWuYCK1
         9PoG23hO3OSo4y+5zcGjV1lVwMI+kcDokUc1Ow8vMx3DK2eOmxZggJbBBBOVeZ3JCwu3
         aEeznW9GKU/rPA1JFciRfkibNrC00456O7iiG6phbEepF+3/XN/29GMkmYFuz5F3+Oaz
         BDe/8RPNoITOYXZ7QYe4rz4L9Gde1i/wmHsrFP62GUAfIWbCR0rghS4JA6xVDSIyHKFl
         Lgh33dutkrZNDqcCMqMpwirKt1s/b2abPKWtryi3PXDlW6RoHzT/l+4ki149OBEy0R1v
         84Kg==
X-Gm-Message-State: AOJu0YzsejwMLYo26NHPJzv/cAtQkwvIZxmaiuxwi1Jc9EShOu8g1lny
	tS0GwVbm2YTj0MqRwRRNQZg73oa+fs9xA1uuZjpavxuczZyqhhCf1flxgol8AuMjb6bHQrWZ0gD
	Unv6semugIbka8tQYeXGexHPJQn8=
X-Gm-Gg: ASbGnctJtn4gMt83FyiL33uktQBre+XtvQejUdR2Zg3XXfY+aIagg+xwwsJ+AleMoaq
	YIDhP5LJPZDpTKEgB4v/fb0hQCCxks9C+z2/kaQCdQR2/NnCynYySTxTYo2LCGLfJKg==
X-Google-Smtp-Source: AGHT+IHpVjf+eAmHDZc5dnKbEzszC9owXsbrdaghQlqb5SjMr7GX3N00J3NO3mM9rNXZAFzSAU1ooBvZrkyS6qKCJq4=
X-Received: by 2002:a05:620a:d89:b0:7a9:b268:3655 with SMTP id
 af79cd13be357-7b6a61c84a0mr1359117385a.43.1733411630299; Thu, 05 Dec 2024
 07:13:50 -0800 (PST)
MIME-Version: 1.0
References: <20241205093237.333818-1-mikko.rapeli@linaro.org> <Z1HBy3LORw20GLOv@nuoska>
In-Reply-To: <Z1HBy3LORw20GLOv@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Dec 2024 16:13:39 +0100
Message-ID: <CANNYZj_qrKCoYdtw-Khg7p9JL4GuNOJhcb+WPXhsSSfkhEms_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] swig: update from 4.2.1 to 4.3.0
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 15:13:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208383

It would still help to rebase your patches on top of mine. Sometimes
those duplicate commits contain additional useful tweaks that would
otherwise be lost.

Alex

On Thu, 5 Dec 2024 at 16:08, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
>
> Hi,
>
> These changes are already in master-next from Alexander Kanavin <alex@linutronix.de>.
> Sorry about the noise. I should check email archives and master-next before working
> with updates or bug fixes. Maybe even check bugzilla too :)
>
> Cheers,
>
> -Mikko
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208382): https://lists.openembedded.org/g/openembedded-core/message/208382
> Mute This Topic: https://lists.openembedded.org/mt/109936275/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

