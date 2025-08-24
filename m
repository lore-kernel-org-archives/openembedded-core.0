Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0BDCA0EFC
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 13:14:11 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.16488.1756041245490829865
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 06:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aTpmq4mE;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-61c51f57224so603034a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 06:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756041244; x=1756646044; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LVsThIdYGapgusRzpKWypQfLWols3YLifmA5o6EUYSk=;
        b=aTpmq4mEh2W469NB2SFl7YbPDMTVBlp8IK/pfq4MtWjNZCXIzCpRtfcVVbeuyQOM9X
         B+QXZZEmdekLehRivz8VuCV4Ljrlck0dpfoMobQAN22Yp3sMy+EdC8lhFdSk3BsoFLlt
         boro5qSeNBv2wfRDiTeFE1cniJitIbv1H956+SQAoT+jaIE8HkuyWyE4QKpAvqJwPXJX
         oak1uJGvXukeskhsU3kyg1hp9G19fehwRpRZ8P0QGVISkZDmpgj2hVtrerjPm4sQwHgy
         lX0QVfFxJGjiSLVZKxlRr+6OuXkBhhgF7dvmlMFiLj30TwnQUIF6iYfo+wTAIFthvNu7
         6+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756041244; x=1756646044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVsThIdYGapgusRzpKWypQfLWols3YLifmA5o6EUYSk=;
        b=w2lmN+5PjDQ4cCZu7Vf4qAwsKn3bAjHlEguFEIc7K/0N53CSo/XavsZ5zGKp7boKj4
         64qywFycK3neLJE1NoHj7evm1Wxe76IILgCuZALmZdrYlPzHX+16bE82VlD9wu9cT4w5
         gPwnUcSku0HhxbhnvPs2vP+44/4SthfUTib/5vp9U1ihODxbGuOq1fMfe9ZNG5RhrZCk
         /eLwnG9aP8J6wmmkINrtr3qnoM433pFTTIMr4JY70rCXE0FzPh1wp/oPTGWBGMUdHtxz
         D7bvpzSRzcI9B6KhjxGsqH/n8739RbWrawLHcqPRaqHPv5+yFFW0YvukvnlnuDkddX7h
         ANKw==
X-Forwarded-Encrypted: i=1; AJvYcCWuf3EEsv8j2yLwGdJveodFkhqffZvQ8pinpkg96dkkLbw9Tw02ndv0pKyYsuZUrdPJhwOdJ1ADQbBpUzyw1FAvRg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzzDAp99IQgeJ0A+3TrFshbxXovtbDkCvaNFpHFKx1vYD0mY8wX
	wJHSn+/kpFww1TFVBbq8Wg6mfZ2m41ee8q8A5xGqgiIL06oRoVR/L9Te
X-Gm-Gg: ASbGncvOIYTQ0CxLKAIGXczACYv7v7G8/p/A0xcPDzWP4JzgMBYjM9Ruu0VY7wQaQcC
	M60Su9/MklzJ0gRJOpBpg7JTVomp+a4lLTu+yQA9p45EMsNoqNPV70HxueyInb1byuRJhui7PJV
	K5m6SWxt+ZXCm5dhNOe85jP8jnESI/8QjPCiIzZRKP2nssrYa3QUZV/QQYOUoYNzehtzK1CkoKD
	lmUexDxmsLTuWWKzrYDy9To5JzpWXjnPz9xvJjp778gP5unDHVKucv5cUsjE/Cp0s3cCIfwzkc9
	DqDFyrWNpIxKBBperP69VXDpzUEM1kAJ+RcBmv9Sgk3z+Yl3jwjE0ROeHyw1oXSOKkBLQbjP3fF
	Xf34fagGtOKu/sHwt+4sFLrPuRp2O7hw=
X-Google-Smtp-Source: AGHT+IHU0HZBMJ1hi9OMviX0L1FZyUYl2ecDoh7oq3fS346mDRJg3X4Xo01RFMCP3G8V2efwcCsVXQ==
X-Received: by 2002:a05:6402:5189:b0:61c:3b88:4d15 with SMTP id 4fb4d7f45d1cf-61c3b885a05mr3778808a12.23.1756041243521;
        Sun, 24 Aug 2025 06:14:03 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c3172ef02sm3360674a12.39.2025.08.24.06.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 06:14:03 -0700 (PDT)
Message-ID: <324039d0-090a-4bd0-b765-f3afe37317c2@gmail.com>
Date: Sun, 24 Aug 2025 15:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone][PATCH] qemu: set ststus of CVE-2024-7730 to
 fixed
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
References: <20250824130514.1094962-1-peter.marko@siemens.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250824130514.1094962-1-peter.marko@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 13:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222374

On 8/24/25 15:05, Peter Marko via lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> This was backported to v8.2.7 and also it is mentioned in commit
> upgrading qemu in oe-core.

Scarthgap has 8.2.7, but Kirkstone is on 6.2.0. Is it a typo in the
commit message, or in the target branch? (Or is the user error on my end?)

>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 38ed637b93..220f0a161c 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -84,6 +84,8 @@ CVE_STATUS[CVE-2024-6505] = "fixed-version: this CVE is fixed since 9.1.0"
>  
>  CVE_STATUS[CVE-2023-1386] = "disputed: not an issue as per https://bugzilla.redhat.com/show_bug.cgi?id=2223985"
>  
> +CVE_STATUS[CVE-2024-7730] = "fixed-version: this is fixed in v8.2.7"
> +
>  COMPATIBLE_HOST:mipsarchn32 = "null"
>  COMPATIBLE_HOST:mipsarchn64 = "null"
>  COMPATIBLE_HOST:riscv32 = "null"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222372): https://lists.openembedded.org/g/openembedded-core/message/222372
> Mute This Topic: https://lists.openembedded.org/mt/114864701/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


