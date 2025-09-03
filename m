Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC15CA100C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:11:01 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.8156.1756890654873579014
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ewkvPIyn;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso10526135e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756890653; x=1757495453; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2SyFibcfcFQSz+xXaCEP98gFoje/Xvn1Vq9TRNaPV+o=;
        b=ewkvPIynjRu6k6YOlc5cb3HgrNcMIAZmG9116Z/yZuPJ++XDNEH+jYnWlKUtiDl64D
         bFzvcLSmcN1eMab4tgj8Zlo/P/PkmHL/rfakVF1JU0A0Xyt7iHNP+aSFQXAZGWK3YZvK
         XgMnOPYszNaguEefAcYctbl3VNbsuvJ6zvPWZzuZmdlodyFwWL7exdKuUm5tYVUuhoFG
         WaAuspv+NAKpuV7HbUIsYGj0/jAkamWvKLJMiaTuvx/U2tz4KwJTfbW3CIyubjKNjdiR
         D9XWsCgdkZKMUE4yI2xfEmOZE2DKYzq5BMIuA4oEo33fUDo808cxZnSZJSntOG0FCQqY
         gsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756890653; x=1757495453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2SyFibcfcFQSz+xXaCEP98gFoje/Xvn1Vq9TRNaPV+o=;
        b=XLt2S0gNi0Oc3Qp0o4WS/JpepW3VuWowkbqr9g6Gc3Y1eR+BJ7CqBE6OoNJ3WqWTCr
         ZLcupuu/9qvEZpDknRs+PmAvDZS+zDmXdxN3p0X8oL2vLQNtos4zZaSrhNpHIJLb0bKZ
         jzFBeXUjGhAmTiQlpV1qIQhlFjR4Cdlvv8Akpv2EDCJNw0jLKz5bYqxlTXIZG3nfNaIs
         RoyP/d3e3L3B81QrGBTB96GfmuoJ6AnxKXKeVLwBzFdeBRxEYv92gErlAT2Nif45Hll4
         +s3tJkCvCYfQa+s3ibijHUiYrsjFvEIH2XNm0nJr+f90XvoStP6u6LcIZkvzI1HF4VGp
         LC0w==
X-Gm-Message-State: AOJu0YwE1pdyKE8WcpDrVmr3SxEDc9aVpQ5WNDvMtMuLufOzBo1X7OEH
	mSYBoEK9DZ2OUGIexa5k+lW5vz7hfA9VJg7xZmmgaVZjz2+FSfwsyx7M
X-Gm-Gg: ASbGncuugJnM+xPOXKulQ5ErHSh8ug934wP5udCuE1W7mABAjsSvLy9xQAf8HYgybwn
	nlcif2pVgxA7uFYwG0NpjyRuO4ZNISaX/EyhXJjaz//a0WOo3ScEyXjEMF594Vyuycj6iBY6/2J
	H1FsoqAPibqXC+o11piQbXRJ8nibvYa5kopPNBKzzdzML94njEu910SdR3vnXVgDWrbEb2AGnHU
	Rki9dR0yDcIti/5zP/nxMNK728JLrZZFFhmOO2pAOnLoYoEIDtihRdHC6n9PX2QKh3XElAieJcb
	AdDrPlzBl4quE6qCQbL9kOoTstVq5xPVbZo2jXyCm+Ke7VWEWo6Kd74A/s4449LulA5Y+IwtIHv
	FM5HWx2zJvqCV1uALSjJsFULhIP3spRZjsw2gEn8cNg==
X-Google-Smtp-Source: AGHT+IHoVr1d0br8uADJiZLGasO+68O1c9fG2Q97xdszLh8yh2IXgDDNAUNOF7213qMqS3XyJkPoOw==
X-Received: by 2002:a05:600c:314d:b0:45b:8a92:6b14 with SMTP id 5b1f17b1804b1-45b8a926f9amr109330205e9.37.1756890652976;
        Wed, 03 Sep 2025 02:10:52 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm7644345f8f.21.2025.09.03.02.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 02:10:52 -0700 (PDT)
Message-ID: <44c215fe-9f9d-4378-90d8-64d4b0337077@gmail.com>
Date: Wed, 3 Sep 2025 11:10:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] gettext, gettext-native-minimal: upgrade 0.23.1
 -> 0.26
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
References: <1860A6DF185EFE18.24627@lists.openembedded.org>
 <2f5a2e0f-0b16-4990-a574-a3fad36fdc96@gmail.com>
 <CANNYZj-kaB_L-iQs4CrtY+ACjiFh3fGfDjW=-WoAdnPzHfUeAw@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj-kaB_L-iQs4CrtY+ACjiFh3fGfDjW=-WoAdnPzHfUeAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 09:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222853



On 9/1/25 12:09, Alexander Kanavin wrote:
> On Sat, 30 Aug 2025 at 22:58, Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> In principle I think that it's about as I can make it on my own (sans AB
>> failures[1]), but there would be a few question marks on my end:
>>
>> 1. If you have a better idea for relevant Makefile.in.in heurestics in
>> autotools.bbclass, I'm listening
>> 2. I *think* that the Makevars concatenation makes actual sense, and the
>> build success is not only an accident - but I'm not 100% sure if that's
>> the best way to handle this. If you know gettext, I'd like to hear your
>> opinion. (This was inspired by gettextize's behavior. Upon running it,
>> it copies the Makevars.template with default values in the po folder,
>> and asks you to set up all the variables from it in your Makevars file)
> First, thanks for working on this. Gettext recipe easily wins the
> 'least sexy' award in oe-core.
>
> Second, the same discussion has stalled in previous update proposal
> (to 0.24), after Ross suggested we should just try to use gettextize.
> Ross, can you please comment? We do need to get this update in, and
> maybe attempts to 'do things right' would be too counter productive.

Yes, briefly I was also looking also into gettextize, and I got to the
same conclusion as Robert, it doesn't look that it would have more
benefits than drawbacks. The current update logic in autotools.bbclass
would be reduced by a line or two, but gettext-minimal-native recipe
would be unusable, and all gettext using recipes would have a dependency
on the full gettext package.

Nevertheless, if there is interest, I could try to prepare a proposal
using gettextize once the current of the patch gets in a state that
doesn't blow up on AB.

