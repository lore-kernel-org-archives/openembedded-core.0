Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDEDC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:25:56 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.41269.1745331951297565768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gFXtdbC8;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f2b05f87fdso48590186d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745331950; x=1745936750; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fAdV8DCUaTnH5U9xczL8rry+p3AqLtPSm/p9SC4xZp4=;
        b=gFXtdbC8UUN2764HSv2oH0D936jaOxBH3N6lnfEjuCsIsWsSu0ZjvsXAwaonzCRGEp
         XbVU/enkdkFI6Sg6Layg4GEzi//v7FN1onhfIkNC1gKHtdm4llb70CmZJuaKpeeCeVD4
         AO4h37ISe5107Ul45l2d24vFsdJx020c8PN0uqT412MmX7dJXn7XNmnVL0aBlOsjtpEo
         EYZrhe5QLUkcEv8yiXzWGBHP7lwraMJNp6vAFRKihxPd0itykb8M0LxvQd3MhE57QP/o
         Gj48WpaveTNGb3rMNq/7LdHwoXmbsdhkKSAckpva3j+k5cyF82rJWVwIAhpRlOk2Nsk+
         69uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331950; x=1745936750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAdV8DCUaTnH5U9xczL8rry+p3AqLtPSm/p9SC4xZp4=;
        b=j2TRm4GpoM71DdlO1/HvW12qY492jkcOid53kqWwAjZzmRsbwGGlXGAQnzfEmD72+7
         Z+247lhhJevlcohFw53W3Tc38vXiKAs0VKkyIxzPzkRZ4y5zXgFC9p4Ti7aP44gSPoyy
         0nS+pkmm3S0wWbo+RhjweI1f5BOwXiHKH4X0/Mhp1uc1yl/ghTLrqEzYZlCOWyZKhJgy
         nypf6LQ1hqphtqEnl8gJB8o9p5xgm3Fuv0QBxSSqJXlzfvXeBdqOiO4z5taztJLftifd
         6MR7fKJZd3SbEYRK7G/apiU+vP+ct5zNebahOYXS74AQFHGIKiaGosTcaoK/BNB9xtsa
         utbA==
X-Forwarded-Encrypted: i=1; AJvYcCVQL1tN8agjSECxfXrJxp7gcItL5yRjSAkNtg/1Q2zIjx6yH1bn43Qn0WLnUEtrDOeSKWCRG/AQi90WbUNoWNQ8rg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywd4zQKXitf4UtFylIze3U6sDqpSrIqSk1YCkjYV+lqy7vMzQ9i
	QBJsm7xVm4YOwlryGnErYeCTBc5/PCATYird8QQIRUFFcgw6k2dNNaG97H/liVpdJRwYHY+czTK
	l0XR/oqa1DDpBt7+5U/kTj8ZzShM=
X-Gm-Gg: ASbGncu3br7kObt8NN9dopOdPR6z6vAZO/q2Mfzo2/Q8N7pny7uRO0sjdlfhxTHnyKp
	togC5eEbquAdcbck78C6FelZVXWxSxFKhyzAF7KYCMCkzL6dgl83BdHHqmq0tpy1yyz0wHf2ovS
	4wppOvvPByYYuRG5+iI/49A/qxlN2+bFVRua7GEhA0GKDDk37XLIWJubEz
X-Google-Smtp-Source: AGHT+IErBigLUvj4fuyMc9Eyv3oUJhQyPKlVq2nXVODp/mcCdks9Vyj9fel1+yToaw1pdWgnilCtN7jMPm4JRywLLfE=
X-Received: by 2002:ad4:5f8f:0:b0:6f2:bde5:9ddb with SMTP id
 6a1803df08f44-6f2c455671bmr243731686d6.17.1745331950300; Tue, 22 Apr 2025
 07:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-10-mikko.rapeli@linaro.org> <20250414204357.GA9290@localhost>
 <Z_3sf3l8VmiXjfi_@nuoska>
In-Reply-To: <Z_3sf3l8VmiXjfi_@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Apr 2025 16:25:38 +0200
X-Gm-Features: ATxdqUEeIvNF04gbHUWJz9sTiLfC08UQVw6hj2EdXjJ4JaaVMCTVI0mDqiiSIbw
Message-ID: <CANNYZj8PH7Gggyn6V5xpbpQXom4-cng05jduz=i7yJygJQ58cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 09/11] image_types_wic.bbclass: capture
 verbose wic output by default
To: mikko.rapeli@linaro.org
Cc: Trevor Woerner <twoerner@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215210

On Tue, 15 Apr 2025 at 07:20, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:

> Some people want all logs to be empty by default, I want them to be usable
> when things go wrong in builds which I did not start or even fully control.

Then maybe some of the debug messages should have their level raised to info?

Alex

