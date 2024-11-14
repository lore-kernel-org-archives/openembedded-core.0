Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1011D68B2D
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 14:59:39 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.38486.1731595756904219066
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 06:49:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IruSx4Gk;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-83abc039b25so25759139f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 06:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731595756; x=1732200556; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DGzWUo0+5auH8CVrSs5alvKAHqn4aJFzrI9RPmKMTo8=;
        b=IruSx4GkRZdjqZAaQ0iFbRVPDu1qCQViDMjtyUMEAd8HexrYeWVVad2kexXDQd0Xer
         vHAesTsXCvJk2SrtvkFDd0bmCZkD1bIq1jJi/7m8luvu1BrHUPed3FWOwVFwkLhSCdnt
         Sg83jHe3CenC1lEjPy/EvlBUnTWaj8EkBccirQBOWLjmldwhLGxyWfHb8QgnrSx8Nx2N
         e9uTkf6eMDdjH6+y0uJdflFNNjVT/vJW1byhh23Nj1klUvklIodvgvYTDLFO27Cu6WJs
         ALgZBpZYwJ3NYKe6mf/3brmDXgOWVWik+vJ6LFaITEbrjYT8Z/g5SKp3fOtiHfNXWX45
         pUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731595756; x=1732200556;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DGzWUo0+5auH8CVrSs5alvKAHqn4aJFzrI9RPmKMTo8=;
        b=sW3B+ZpWFuT7PxfOvnU4/1qeE0cz4uSDDisSD2ZhFi6Qr4lOatoVP734H1tENnx+fS
         nrPC58OG5FQMskfH34NDRQi7osNLYWIQzTtS+4NdimaoE1g2ghNAyP36VMOMfNeMPfBJ
         Efvidhus1pdxkMhqURyiYRVV9xr/HE/6zBE29bGe/dUX5MGAgMJWVi1ZZR/zid5eei49
         6PNIH5BtQLmJgHDM6e+tVNCxHInmroccgY/NnbxKs3OIN5H+Wwee+zD8xdRiiKaVgvRG
         8SmJcHAl2NjLMx/eJZGZV1qJ4oJGmJ/lHY4dwmUv5TjXU84no92XO0okdrQX2nzNTGD0
         xA2w==
X-Gm-Message-State: AOJu0YzEEbQPGkOFPOkHBThNF5wxtqC4/G+kLU+VG+zfD5XwGfLHx2b7
	7O59L1T1FFClm9THvq4jciFvswmVwxQvCvv/oKJNM/TO3R6Pn9na4NjNMg==
X-Google-Smtp-Source: AGHT+IGXGokj/I2ZWGsK6hr6WXs3JHYiLnqRo3fQwVtGyH7IfnGXrYVAmWrsHpeJSXBKFNljVInXOQ==
X-Received: by 2002:a05:6602:6c15:b0:82d:13ce:2956 with SMTP id ca18e2360f4ac-83e601b5162mr200250439f.10.1731595755773;
        Thu, 14 Nov 2024 06:49:15 -0800 (PST)
Received: from [172.26.252.3] (174-29-213-205.hlrn.qwest.net. [174.29.213.205])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e02fd16258sm298642173.105.2024.11.14.06.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 06:49:15 -0800 (PST)
Message-ID: <d3f0135b-df0a-4cba-b3d5-01ba93143a16@gmail.com>
Date: Thu, 14 Nov 2024 07:49:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] uboot-sign: fix concat_dtb arguments
To: openembedded-core@lists.openembedded.org,
 mathieu.dubois-briand@bootlin.com
References: <b676cb1d-53f0-403d-969f-e0bfdaedc4cc@gmail.com>
 <72af1bc8-f20a-4fc8-926a-1418580f303d@gmail.com>
 <ZzYKpSIigYU9Nj30@bootlin-mathieu>
Cc: randy.macleod@windriver.com, yoann.congal@smile.fr
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
In-Reply-To: <ZzYKpSIigYU9Nj30@bootlin-mathieu>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 14:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207170

> On Thu, Nov 14, 2024 at 06:35:29AM -0700, Clayton Casciato via lists.openembedded.org wrote:
>> Hello!
>>
>> I am looking for feedback and/or the status for this patch.
>>
>> Thanks!
>>
> 
> Hi Clayton,
> 
> This patch has now been merged in master:
> https://git.openembedded.org/openembedded-core/commit/?id=b3c473785e5ceef677ff2b77c5fc17f5704c622f
> 

Hi, Mathieu!

That's good to see.

Thank you for the quick response and link!

