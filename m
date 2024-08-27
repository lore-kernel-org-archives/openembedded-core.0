Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 647A4C54734
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 11:37:52 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.75508.1724758662693968330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 04:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cm1UuZyd;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f40a1a2c1aso47348341fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 04:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724758661; x=1725363461; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x3uzqRFwaNxYgaOSXHcPBKdh2GOWuADqLu32jM5zVyk=;
        b=Cm1UuZydVWcYMWeONJ324F2U4NEWl2juVCfvYIuIpROPhFSgcpRhtd308bHnEBjh2h
         rPkwXqK64/M1g+o/Iqdcvl1nLLC6rTuxe3tUna2qZK2/PfeClN0q4hG0YrqcTcXy06pP
         Ylw/CeVBKFt3tXh0BYhp/zrYE6eXSP19g757i5noV9l6jxliTc19Tke27ZMEGFF5Q+TF
         GhgkhrypwoxaCvBbwRY5P0/eOhhG+436sd92oETomHhVsPirSsm7r6VE5dEpoH2yxa3U
         z2R7vYK2GLQ34vwIK21N1X1SuDq5zTHvVK3IZiiiL5gbIKYXQFkSH2VPsjqRyP7gyvTr
         TGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724758661; x=1725363461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3uzqRFwaNxYgaOSXHcPBKdh2GOWuADqLu32jM5zVyk=;
        b=Xup+bySOdN8y9G4JqRL7ldUBvxVCsBAzOOHyefH+HzOLBA23mxqbYleGEnvU8gdcFQ
         xQA2QcmJucqnsBJbvQDBw+r6B2j9myxbCRncbEo5IJZbHdXdeaTxDy9/+dUiTQikGnm8
         /sYEUCGhHzfHeoBCm6m9TQpPwVO34xI7Z6YNLZ4AGzBgplZVPfBlwTyoMnwrmxv7vevT
         GUoHBjbEuLDrThzO2B4KcNgunr4RR+uW2CM199ZbkUdTsNcePM1ht0j191crMJTYALaK
         froDabWLFOWfJb/2efLA1HHj9edrv5ZD7mvhw6C9v2StjDlvYmKC1GYBeRQY80ZVk4E3
         qk0Q==
X-Gm-Message-State: AOJu0YyIGV68VsTFBrNVgWOLO4G5B57YzFvIqmocEkmZaW7uMX69z0wk
	0HXvo2R8Kdca0iIMMdYwVSVTS+on99YIDGWgSPhX/I1rRC4NEKCRMDxzu9hUhBOhQ1wys1wigN6
	MmHq/NwliDo0/q8Vil8FdCiovrAY=
X-Google-Smtp-Source: AGHT+IE7+FwDbx/pRE925xEGfwGAh/y+n93O0CubxRpAMZ2Ki9G4JWmHNR3Ook8HmFSaUwYCvI4pvCDijTHtHboY1dA=
X-Received: by 2002:a05:651c:14c:b0:2ef:2cbc:9074 with SMTP id
 38308e7fff4ca-2f4f5769da2mr75411541fa.21.1724758660059; Tue, 27 Aug 2024
 04:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240827100343.127172-1-dmitry.baryshkov@linaro.org> <e30c7d94-0e6d-4e82-8ff0-511cd3526387@cherry.de>
In-Reply-To: <e30c7d94-0e6d-4e82-8ff0-511cd3526387@cherry.de>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Tue, 27 Aug 2024 14:37:29 +0300
Message-ID: <CALT56yNt9cFULbzMpSz7sBXzS9+b-=K7JnvBLUKWvJ6ieUniTA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH v2] linux-firmware: add a package for
 ath12k firmware
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 11:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203833

On Tue, 27 Aug 2024 at 14:32, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Dmitry,
>
> On 8/27/24 12:03 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add the firmware package for the ATH12K module.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > [DB: added rdepends from PN to PN-ath12k]
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > Changes since v1:
> >   - Added PN-ath12k to RDEPENDS:PN as not to break users expecting ath12k
> >     from linux-firmware (Quentin Schulz)
> >
>
> Was it really part of the linux-firmware package? I hadn't checked
> myself, it was an assumption.

Yes, it wasn't split to any of the packages, so it was in ${PN}.

-- 
With best wishes
Dmitry

