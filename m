Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FCDC02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 08:30:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.7473.1738744229056437485
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 00:30:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KMbIawC1;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38634c35129so5064671f8f.3
        for <Openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 00:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738744227; x=1739349027; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fNSWD3NXuvRg3jtn58a5Bl+8+qqPVvruB1RMHrRZRow=;
        b=KMbIawC1ibzb9N2FJex81YAQlxrtmBOaAAGN0SGby6PFW2a5ebiTWxBQyR2YP0b/az
         HzH92o5/RP+o5UT7+o9INP/JUgMIeN0b7CHnD5fpHYKc1yzWM88kbqH5UFv00y1OKgeY
         K2e+3F3s/v6JGl/Ax0jtoa2VJTXte3KVAxD9TqBzPvDkcspfCAob3F9ko/yjpC1hfEu1
         kcxcDZfEJVaKSyatyKYd0UpaGlNiajfQXZbpjgXZd+9wD5Et40zpJRqmFhPG0UTvY0Pu
         5ZV/3aAeXJ5DCjHw8VOBQYp2HT4hdDx9IYyMT1uABeQo2DpjhKHpPpbEY8mrRMUiHzZ4
         bwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738744227; x=1739349027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNSWD3NXuvRg3jtn58a5Bl+8+qqPVvruB1RMHrRZRow=;
        b=JPMgEVSVt8jdFo7k62qwpvGBzXDmVjawbqcA0rMfuwvuODwiO+lo5Di/IUJ8rIuhAp
         kVFL8VHQIL+DfTb8eTK+z0skrpyW+kEvSDACznjvgy3Li/4O8eDwoYctgaO550h5M30I
         /zAmlltbxweka8ukQJnyt8R2jNPCbs56lGvmgZX+bCavWEd4w4OYpWNx5qF3hbEbZ00N
         EiSMIAyFLm21lS+A61MSNf86quN5XQcA4QrgjSQUeGl7t1O+4dzuWVAY3ZgJaeFZGymn
         HatMYVjBP7h35mZRxp2Arfx209XRqb5jI09VNwZ0lYABGuseCWGlv1Sc0z00y3I757EI
         cndA==
X-Forwarded-Encrypted: i=1; AJvYcCUVs5LFyJ6R7U17Ypdy1HiBVteAgtvyvO000G8muURhOyTMOgFVLpnFzIPAh3VSzqg1nT25BalX/La1Q8QVqaRnsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzbrDqFcy6dX/41VvHqpxOC2uHF8ZH9gERZ0y0h3Gt1OlLoN0Yc
	Mbep0tDpMj3X67WJ4MLHhBvZLibUIb+hNh9OIW0pZDvcyhQTesjp
X-Gm-Gg: ASbGnctrrfVD7IliAOVZTHeTEAeRLJyzS4LBBwuFA0ysCuNlivIAIikRPaQ17Ng/U6e
	I0IGvxjO1VeFv0eWgXjdnaFqyoea60Iws6N7L3StCCzpNrNBurD8LV0BI3Trp2mEuE9zwt5SJOS
	CbD6XO5Rm92PsTxB80ZcDRqxEjIwjc9EJyRfdqBlwmuh1JfYlLjo3OruPs6IhDLQxkhmMU4Jj97
	idaNh87NBuiBphhV0KZL9y4QZNxh8vk6fTxe/WZgyMzLVAKO5XTlS3NTQX7zRSUgwGo9zmf+CU9
	5wn1s5aLQpYs9Zb9kf/t/0e8jfvVqM4FS/aB478Nv3YszjGS
X-Google-Smtp-Source: AGHT+IES89k2O8C7Ptl6E+uN8Bu/Y8bdcKHUQN1i9y8J8zAx4qXdd8DMltGWN8rjoepNteiwrqjWjg==
X-Received: by 2002:a05:6000:1acf:b0:38a:2658:bbc7 with SMTP id ffacd0b85a97d-38db48cb5e7mr969419f8f.29.1738744227125;
        Wed, 05 Feb 2025 00:30:27 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38da8f6691bsm4073764f8f.42.2025.02.05.00.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 00:30:26 -0800 (PST)
Message-ID: <762cc1fe-822d-484c-8c11-b537ca5ded87@gmail.com>
Date: Wed, 5 Feb 2025 09:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: Build the systemctl executable
To: uvv.mail@gmail.com, Openembedded-core@lists.openembedded.org
References: <20250204105315.84079-1-uvv.mail@gmail.com>
 <20250204105315.84079-3-uvv.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20250204105315.84079-3-uvv.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 08:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210833

2025. 02. 04. 11:53 keltezéssel, Vyacheslav Yurkov via lists.openembedded.org írta:
> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>
> Instead of the python re-implementation build the actual systemctl from
> the systemd source tree. The python script was used when systemd didn't
> provide an option to build individual executables. It is possible in the
> meantime, so instead of always adapting the script when there's a new
> functionality, we simply use upstream implementation.

Finally, "systemctl --set-default mytarget" can be used in images.
Thank you!


