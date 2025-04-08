Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C56BC3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:21:59 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.71838.1744107709429603398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P72Inn0j;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so8875577a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 03:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744107708; x=1744712508; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B0y8aizC519suEy6TCzAXxw0VS8q/UNkYGuNe6En9j4=;
        b=P72Inn0jiwH3RQHqfwdJJZanx+chJ0ZwlWeTY9Tsz7txR7S8SRw8IcEa6cIqsbI7+T
         Q2/LNKzbHz/pK8fRB9E0uArbyEx5oxs9Oda7vO9CZ3QuyHH4WHBHBi6r2GjNjnQ19l20
         bWPOgPvb28yX0xRjhfkqpTPosD87IHbyJgsoRVaIJJNSIJ0eLeOjYvzj5fTwjM74B9DI
         0ynRR3qeBT5OFWx86yHd9M83qDZZA/G4fOd6idXN16naXrE1GRE6R2XZFPuokEswQ38E
         K4PosKI/iNv8TVvXiMg1uS/ltBBi94W/NqBX4mzaqjBjOLz9ydjcPtCrPSd/ywK+mCrx
         g6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107708; x=1744712508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0y8aizC519suEy6TCzAXxw0VS8q/UNkYGuNe6En9j4=;
        b=FgV9EpoLWIWDpPAAAWajRRegi4N/hSiuGmoti+mA1XfBn0JPbsfL3cNRZytpT9u++B
         CPnYw11okeYRBEzUAm7kPYuQGnRknLlsoeU5zRK3rc0wSFxKnvWj93on76F75k3tU6Hb
         8gHhgUMC4rbitxQ7U3H6aWI8P8R27JDYKvI2ANbkG8Kot7mo9PAkCfQ9+XfS4zFxL8JB
         W0In3UpaXP6bVi6KUSCy3F3PUFQI6wnI2vvWta6AHrV+iiOnLEQnU8trTIk5CNQp4jSg
         UiNFl93hCa5Fi/Zo8f4hRunGnS0Zon8B5xvg7z+6vQQmsqpVJOlkBLQnXTy3rSmWplT+
         +rlg==
X-Forwarded-Encrypted: i=1; AJvYcCVEmiTtmcjuukcH6n5rWoXy3N0nN1+Hd5SRk9iReDTTN7AmDW9wPwkRjHT7zHq/UgyVGaaybj4js4bjKsC7qnE+aA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwdHS6nA5Vp2EKzALi2NbDv3U9KJqrrXh6F3aIj5etNKzaHikap
	S9M11K2K9Y6gtr4M1qN2lHaDDSzdNLjXYlNeHexRXtSy4aPpUnTf
X-Gm-Gg: ASbGncvzyLR7tZwRtyR3fy+CrCLo11MNqizCVwR12tagwpz561JS72P3sicQrLAvsZG
	MjcAHXscQ+ZQA30RYGgCZjkJc+jE6MkTBMxmL7fVh0J/QuJmLUgUcWqAYdPmCSfTLJUVfeggvUO
	3hB4egf3T5yXefLN5ed7lTQXW3rkeREOLM/ZvQ6oFhHL5GyvTtgpFC4xKRu3idHwU2w4TqW6kAK
	Ivv1ghEoVwKSiOyszY/rUztMg3xTOtxkBjjhwlAoe+k8svDqLRznw9j2LmmEfvDjGnzbQZV40PV
	SOLmexmnM+W+jv8SSCDT8xXU9xbJ2MinhFjf+hsI5LecEmN9HGqT
X-Google-Smtp-Source: AGHT+IGhjLjuMjCvnvNsKi+O+WxfdpgQrMPZRxwnM89c7DRnFBZF4agzw4FRNle1miSAkd9/9ljUJA==
X-Received: by 2002:a05:6402:35c8:b0:5e0:49e4:2180 with SMTP id 4fb4d7f45d1cf-5f0b4311c91mr10263153a12.25.1744107707206;
        Tue, 08 Apr 2025 03:21:47 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f088084e85sm7715604a12.60.2025.04.08.03.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 03:21:46 -0700 (PDT)
Message-ID: <584140ae-3ff8-408a-b97c-edf4f445028a@gmail.com>
Date: Tue, 8 Apr 2025 12:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 14/15] sbc: upgrade 2.0 -> 2.1
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
 <1744073502-27695-14-git-send-email-wangmy@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1744073502-27695-14-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 10:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214524

On 4/8/25 02:51, wangmy via lists.openembedded.org wrote:
> -                    file://src/sbcenc.c;beginline=1;endline=24;md5=08e7a70b127f4100ff2cd7d629147d8d \
> -                    file://sbc/sbc.h;beginline=1;endline=26;md5=0f57d0df22b0d40746bdd29805a4361b"
> +                    file://src/sbcenc.c;beginline=1;endline=24;md5=1db4f3850f47b59e79aeedb2668f4b3e \
> +                    file://sbc/sbc.h;beginline=1;endline=26;md5=c5a50a7fc33c148ee362e2b46574a87f \
Along with the text change, the "endline" parameter has changed also to
8 and 10 respectively.

