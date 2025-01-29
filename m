Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83E39C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 12:52:26 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.11851.1738155139605595213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 04:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AGj/TQRJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso71626425e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 04:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738155138; x=1738759938; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kpYUciHTaYA14bjqQn1FfIg0XJkzCh5NDgpOL/pafU=;
        b=AGj/TQRJavbYSQRSFaBxyjGrFRRP6ySr++WcoOYuMrESqq/xBBOpXv9keUnQIHBIal
         Kk9AecobZDPTGkUrecKZFQYVj+OcQp8JqyNeQEajDsbtkN7jusqTUTyW8wJ2/Lfv8Z6u
         ID06EInOX11TYzaoJNs//3Xs1o1GhG69A/e1aWAb6DeDu5upBlZePADj6VU+vyFcpa43
         UrpnapiHCnlKAdBqqeNNUEcsQYRAJJvO3rSc00zPE4pGgU5jIMPZSLnhQ49lMLBWIWU8
         Re1917xONrim7kTsgupz1UszGZ779QqlndMGx0oT1BQpM0k5KiAEfOHCBSOPb82b98Hb
         mB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738155138; x=1738759938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kpYUciHTaYA14bjqQn1FfIg0XJkzCh5NDgpOL/pafU=;
        b=Wi3DrqYO2wnXN8o+0yAM5+GOFF7FoUYq4sd44+4vRqaAzN9SCvpo5QlSIYmjpzj/ia
         hQ9KeLir0leYyXxIXHGMBBdXEbOxZ4YQnSrFlADsHp1IPbtPlrpVVNupxCfohUie5tzD
         gJno1y+9GnOXTJylpIGr6IYmR7QkcLt2qANHSWxl1SePpkokz0xeG3Pxka0ZFUXhKnGL
         fZZn+xqF4eqip3PBFbgiGS5pxoQbLqk3sCsd2NiXAOXJPK/dq9axim4NU59fJFamOVZb
         yTo4VEXMdRaMEoQCVGMmQspTf6Rj0bDUbp/rcQnSq9Xdgw8g+q8GNnV9QU7TroBfD1HF
         FhNA==
X-Gm-Message-State: AOJu0YwLGe/Nr1NquIqrmUNZCRjoKZcjdsb6ZIuoYF9THV6xdtGgccGF
	eIhQGgmivD0LZF3+kr+bTxSoMTpy7YtDlwQz2Q8+//I8jzzTx2MYX20pbg==
X-Gm-Gg: ASbGnculdvn92sNlZC8f8DgEqRPA96bGCV0IQTVhiL4lMUPSTbsJok0XtMoDCyChtNC
	U+yKV0Ldr7PSdhYaXamhGswK3E2L3qkwNQZOptXiXltUdCWCuzciCRQUT4bFceX/YcBjeEC26ZH
	VZ6SUF6HyXYXGy94VC4gE9g8ENYOI6HzH/vmzI4aqrfa+XcggBsv7piz1iZRkJIJkLfcQOaWgsM
	XURjbDFaFHcoVlRPFiR4JjJnJxS8NWju689t0ZajKJMg5bohGMMdduBwXod8OACls2PnPsQXdE0
	uda73IQWqQ3QlbPScxavr1wLrYPA7PmlMkXwJ75Kgvp9WZD9
X-Google-Smtp-Source: AGHT+IH11c8l1bG+91IN7AR7lmtduM6HGRvEaH2ztQRdEdPtuwOUnBZPd39C0FcX/ONg9Mc4+PxbMg==
X-Received: by 2002:a05:600c:1d1e:b0:434:a90b:94fe with SMTP id 5b1f17b1804b1-438dc3c2608mr27372165e9.10.1738155137743;
        Wed, 29 Jan 2025 04:52:17 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc24cefsm21907315e9.15.2025.01.29.04.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 04:52:17 -0800 (PST)
Message-ID: <481ae88d-e8b0-4f97-a56c-1ffe7a0993e7@gmail.com>
Date: Wed, 29 Jan 2025 13:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2 2/2] rpm: Re-enable signing
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250129104150.2391653-1-zboszor@gmail.com>
 <20250129104150.2391653-2-zboszor@gmail.com>
 <CANNYZj8V4Zq96iFLPOjBzVJsDpb3f-m99UGNnUjS9dd0qRsvTg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj8V4Zq96iFLPOjBzVJsDpb3f-m99UGNnUjS9dd0qRsvTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 12:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210381

2025. 01. 29. 12:06 keltezéssel, Alexander Kanavin írta:
> On Wed, 29 Jan 2025 at 11:41, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>
>> -PACKAGECONFIG ??= "archive"
>> +PACKAGECONFIG ??= "archive sequoia"
> We can't do this. This will add 14 minutes of rust-native to
> everyone's builds. Rather you should adjust PACKAGECONFIG for rpm in
> the selftest (and your local configuration).

I sent the v3 series with this change, and rpm-sequoia 1.7.0.

I can't run the selftest using my custom distro. It was originally
based on meta-angstrom but over time it deviated too much
from how things are supposed to be with more recent Yocto
versions. Hopefully the test case can be run with the pure Poky.


