Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 910BAC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 14:47:16 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.23639.1671461232299559713
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 06:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YfgvaIHv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso6630700wmb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 06:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t+xByeEYcHl1mEcRvsEQNo0e+LTFrfkAwB3VTpntQc8=;
        b=YfgvaIHvlalKtJKJGI9NtltDVWUhcVW9rwNwjkqq7N6cgFU/M+kzskSZPIvspmKgyx
         XR9SECXtWq86aa07A0aUw0qH/HnISuT3bdYpoHBdZ1QbgWTH6UDEpMIPbT7poLIJdBm3
         XF5d7w6Bzb4Glp84aFOSRl3C866kKwUwZdy2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t+xByeEYcHl1mEcRvsEQNo0e+LTFrfkAwB3VTpntQc8=;
        b=6MJJDnQFYFGM8Ys4bLtbalV5k0GLPZA+r1WwFTo/8GKFHFk+AbCyvtee3YqPBiAI6l
         F0PxOt1U3oIi29+/EwPAlRlSsLbzdQwnbTvsVO08Z5uh28wnfl+x/ubVyORhI+wquLgg
         uKGXU6+nwin5dbYQq3oh27nyFOt/bQkgtVvghxY6trt3BBAD8HbGZG9Y3EeUFr415uTj
         W8y5yrzwedV4tk/rYWtCT+Y9mjub9x/nUlgaGiEk0S7bLo+ThPpAxMO3oj1tfEn1Rqum
         ccbGnXb3gdUkAQvG1+MFam43WeeC2RHO3By0pmqr7EvpaOw+I7b4g5l/AxmJDtEQFzcy
         gI/Q==
X-Gm-Message-State: ANoB5pkF9RrzC9SnZK6EOogVRSn5Ff60OfrepH8RYQY398qT/YoU4xeW
	6FJGIkH/t604IStk1ZlNb+V08A==
X-Google-Smtp-Source: AA0mqf6SLp2Gyo5A/9uGNBXXRiv7llemHq66y3L4mJZEHJA+HvhTelqymSOuiseNA5fE6M32tAKf1Q==
X-Received: by 2002:a05:600c:2d07:b0:3d1:ee3a:62ae with SMTP id x7-20020a05600c2d0700b003d1ee3a62aemr31870575wmf.8.1671461230827;
        Mon, 19 Dec 2022 06:47:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac4f:7328:1210:6c79? ([2001:8b0:aba:5f3c:ac4f:7328:1210:6c79])
        by smtp.gmail.com with ESMTPSA id i26-20020a1c541a000000b003c6c182bef9sm23338965wmb.36.2022.12.19.06.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 06:47:10 -0800 (PST)
Message-ID: <204c95a442302fa04a534081b4d8144ed0625d81.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] oeqa/runtime/rust: Add basic compile/run test
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2022 14:47:09 +0000
In-Reply-To: <CANNYZj8vkH2iunZd8mkj+7C5uSQckXtiNe+pdHbKjbFQsG-MKg@mail.gmail.com>
References: <20221219141840.26358-1-alex.kiernan@gmail.com>
	 <CAO5Uq5T20q0wVhM0wQrOMu-GcoAaKFTOGCMxDxCOLXoUS+sLxQ@mail.gmail.com>
	 <edd6881dda3b935165f95093da2cbafcd42fc2e8.camel@linuxfoundation.org>
	 <CANNYZj8vkH2iunZd8mkj+7C5uSQckXtiNe+pdHbKjbFQsG-MKg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 14:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174818

On Mon, 2022-12-19 at 15:38 +0100, Alexander Kanavin wrote:
> But we need to add rust to core-image-sato-sdk then, if it's not there ye=
t.

Ah, I misunderstood you question. The sdk tooling comes from:

classes-recipe/core-image.bbclass:FEATURE_PACKAGES_tools-sdk =3D "packagegr=
oup-core-sdk packagegroup-core-standalone-sdk-target"

so maybe making recipes-core/packagegroups/packagegroup-core-sdk.bb
have something a bit like SDK_TOOLCHAIN_LANGS in classes-
recipe/populate_sdk_base.bbclass?

Cheers,

Richard




