Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1869AC71145
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 06:41:34 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.5212.1692859292246354490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 23:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jKQVxjMm;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4fe2d152f62so10109918e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692859290; x=1693464090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pDJA0mpUedecd8Pk8ClgVQE2WWGWBnhWFM3ik+VzFJQ=;
        b=jKQVxjMmydfIs4EhhTLaftktIdETlPaLy0mzrRT47n1bRov7SWi/vqJRy7BV+ClFlh
         0zdMxvBzFztq41PpwIkTBXQuBk9OoHbABXo7LwUlSZuXW4/6rykNKSTdftANCABKNYQT
         HWjIcVzX2XVVTvvkbvKgJhP7KaHR1UAfRGN/r2+Se8KpJ3O3M+ZDR1429ldu9jv20xq+
         cvw2xwFMDtEGqCngtXg1FUr7v1tXE5sRLyGHog3hkMZmtEMI+T7VivO6i9CAYDjKCfJq
         YHwwrdXmkngqcskRdvp9P+AZw+260Lnl3g6v1BKXVUs8CG3fSe2E9YnQB3cNDsZINVhs
         6V6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692859290; x=1693464090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDJA0mpUedecd8Pk8ClgVQE2WWGWBnhWFM3ik+VzFJQ=;
        b=f930olCUUxh070B0t2AecRvP9aRqVkU3h+n+UuWAlIHkAE9R1QMhIc1lrbhBoeOiAq
         2tBvO9ZiCSUfHUOVTnSHVH+ABaRt/3rxnr83YuVZVQGLn3crrRpLZq9MHcyuD24FHvWL
         7EaWzuEUFdQvxtcyMYMa0kRFtEhpoZ28Z+PO9o72P0oNoOQL1t32HkZGCXR7Br3DPbXJ
         eNdiSt8mmMBUbLB2GuRCDMAv2Ib/yunQidHKruy4JY+BACYx6WzsLkEkzdbOD4WFt//Q
         VP7mWc1yF9iQrHdp41n3wx7bHkApb2/O9UAfvoIXnfwEy2ZfxBXFHHZxWdprQnXGWPKV
         /tYQ==
X-Gm-Message-State: AOJu0YxVWMVVaCgoKvZWTpzw5cg1eaNT0ZuFS2mmmFdiz06x/55eGvlu
	TneQsTlmt/zQnvTpsQhEk4S/9g==
X-Google-Smtp-Source: AGHT+IGjcOM77YNKO6KP9P2S6/JMjFJ0GcVRt1ggWaXxLaDZXPPMAbMYibfHYE+9nrF8T0KY0gTQTw==
X-Received: by 2002:a19:6451:0:b0:4fe:a2c:24b0 with SMTP id b17-20020a196451000000b004fe0a2c24b0mr9430194lfj.26.1692859290284;
        Wed, 23 Aug 2023 23:41:30 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id m17-20020ac24ad1000000b005008c11ca78sm1149303lfp.142.2023.08.23.23.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 23:41:29 -0700 (PDT)
Date: Thu, 24 Aug 2023 09:41:28 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 3/9] selftest runtime_test.py: add
 testimage.bbclass slirp test
Message-ID: <ZOb7mNBQIfhR0akv@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-3-mikko.rapeli@linaro.org>
 <CANNYZj9+Gs9mkJFKS3qpnjD0XudiqB3Z+2rVsPEgn4ioFyQ6DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj9+Gs9mkJFKS3qpnjD0XudiqB3Z+2rVsPEgn4ioFyQ6DQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Aug 2023 06:41:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186637

Hi,

On Wed, Aug 23, 2023 at 08:45:49PM +0200, Alexander Kanavin wrote:
> I guess the extra space stuff should be going here instead?

Or some other image which is supposed to be compatible with oeqa runtime tests
and testimage.bbclass. I think it's better to just ignore this patch.

Cheers,

-Mikko

