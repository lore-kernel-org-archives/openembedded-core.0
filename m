Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48A6C77B7A
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 08:57:15 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.8761.1686646627147416239
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 01:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=Xw0iMOOw;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2b1a6a8e851so64446831fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686646625; x=1689238625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NnmyeJ2rVbk54aO7q9vpE6LKHCMOolI0fZRVQBanUXE=;
        b=Xw0iMOOwKrgu7SGZr3PN09eME3G767Ftd6AA6O7ZdtXnan4hiMKLTViMqk678ayhGJ
         G0b6duLzD3BtKw7ZNtm8BAK7W7L/SDZU++V6imF1ZrsYzHPZJcoPeQQ0D6ehwEVIUX0i
         B+4AuCkRDVm1F8Et0lCDg4TI6/kWjIQLaF334Hb43+50zRNzycUndCsXA00CdrkS+LaB
         T+frgnddFMjvM8Ff+tHpVabwdEcb6kNffynwFBF0Es0EPuQOEcnuXgr27xV4AXWcTd1U
         j/wNBWEM2Oz+7UU75NPbudKwHdn2Vjj+BgfY/cHFuWEZgHSOCy9zlOouScMTeeMkiGlp
         alLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686646625; x=1689238625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnmyeJ2rVbk54aO7q9vpE6LKHCMOolI0fZRVQBanUXE=;
        b=HfaJOM2Bp7cSW3VAQ2fETFtBOSm8JTAumcoqNDqeH6hRdJLe+ERaikedCOIkCrw0Sj
         P9gi+SzF5TtyYgdtJ+pYANjY0u8i/vHbq9qJcERJVWM3ZoTtEL1PCzdV+33n69eVthdP
         DV34y9WXeRhgbs+Jvsm4Bk9DAPQh+OHGgvitjnz/20c/tg7Cti8H7lgDroqHkIl2TzHV
         X1+hxanP/Jt5BlP2BjUwYtW9gmZSiAnw+zOW8wH7qagn0GO5AYOReWfAFgqGZM5iSRvX
         mFPCQT6Dsjiu5lXoCF4KNbZHH3uNtzUjXcjzFIdcux88Hy4fdrb7fT/GJ0ZKBz4sTbFm
         0xQA==
X-Gm-Message-State: AC+VfDwjSUX6rQmZnhs0DC40SMFB/+vrRUMCfXXB/phC97jEhsZUY2Yi
	lGyMKstisquJEEY6j+pMXdgD9w==
X-Google-Smtp-Source: ACHHUZ4uEl+DBTohwpKAa0pPlzm0Mfzdshxt4nd7t0X/xak9mIKDnGa+BaT17KlZgw5O54FxVH7cSg==
X-Received: by 2002:a2e:8645:0:b0:2a8:adc4:a928 with SMTP id i5-20020a2e8645000000b002a8adc4a928mr4259600ljj.18.1686646625304;
        Tue, 13 Jun 2023 01:57:05 -0700 (PDT)
Received: from nuoska (85-76-166-242-nat.elisa-mobile.fi. [85.76.166.242])
        by smtp.gmail.com with ESMTPSA id g6-20020a05651c044600b002aa42d728d9sm2071346ljg.36.2023.06.13.01.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 01:57:04 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:57:02 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] selftest reproducible.py: support different
 build targets
Message-ID: <ZIgvXgIq1ZhMpRwp@nuoska>
References: <20230613081451.1736892-1-mikko.rapeli@linaro.org>
 <CANNYZj8GcHbm-5G6J2BUy6yu6d31XTPrzGXx-iRrV8aebdj=Qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8GcHbm-5G6J2BUy6yu6d31XTPrzGXx-iRrV8aebdj=Qg@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182699

Hi Alex,

On Tue, Jun 13, 2023 at 10:50:20AM +0200, Alexander Kanavin wrote:
> There should be a default, set to what it is now.
>
> On Tue 13. Jun 2023 at 10.15, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> 
> > From: Mikko Rapeli <mikko.rapeli@linaro.org>
> >
> > Allow users to set different build reproducibility targets than
> > the defaults using OEQA_REPRODUCIBLE_TEST_TARGET and
> > OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS variables in local.conf.

If OEQA_REPRODUCIBLE_TEST_TARGET or OEQA_REPRODUCIBLE_TEST_SSTATE_TARGETS
are not set, the current defaults are still there hard coded into
the test.

Cheers,

-Mikko

