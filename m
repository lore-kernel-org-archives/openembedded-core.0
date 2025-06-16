Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755ECC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 10:11:24 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.27020.1750068677980193667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 03:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Blxbrv3Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so3488840f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 03:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750068676; x=1750673476; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fq7R5kWmuwxbenxWD4HxJmVx7v95C94xDK441oIryuo=;
        b=Blxbrv3ZIoTjRvkidJxN/koJZuCv896YfkMqhTnR3WAaVe+mr+WpZryE1XiFwH1DvL
         4tyVO1K5fWJtvncRpfVbbX2iAIYeaXTPVFbVAucPueJ/e4K9RgV3IovS71jkxjxjt9zj
         hvcZ/9SRVqfz++XlZN3QWLGgJU+kdfsauWj8HRwr4J7TKE8LaliFA/UjlFNY9C4BQv3r
         iSU4Vy9CwQbQQ4PKnt5muLiJRAj3TRf8hJW5hmCmtQZsPPV5nHk2Jl9i4IKoPWQDBir3
         nGoUIn4fXNHfpjDKRiCeugL/V9ftX5w7qoBLPVk8swnRGXVY4r/c11DEiHIkPDdXjAMW
         RYIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750068676; x=1750673476;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fq7R5kWmuwxbenxWD4HxJmVx7v95C94xDK441oIryuo=;
        b=kNg8olcVDwnZAXOhPNlKpNcPN20WjITRkNd4OB2L6Ox0P7TSz+reEpjJjD2p7oBYby
         1demAt2yv+VoDcfNhz+IvMEv3jXf/5+SjMtb+P2eOgj8hPmeeOxpZPp8WsZyQe3gbQHK
         fmzoIu073ZWPfZgVGlBNCDbiOrH7b3av6vo27gNdT6+GxA3FAzSYmtw+7Ol4hrjkbT4F
         feY6SRiDo9FTrUz0FqdPE45mEFORhznV8vT6Wxksy1DhD8qoXuoSsEvcYbkSDq6kHQ/1
         4R9czmbJnDmybGoeq1EmYPGWbOjua7+jQo7bjUw1LtriKTWKAqjfeQjdoovGMC27OoWE
         BuUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUymgxuEei+vHJVJlRqboWDn1VSse+Yhns8xrK5aDfhyvZoVD4zH0KNH4X/289iSg71EXQ3Vi3EE42sru4zMfG1SQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx52G01zVyWnKn0tocY7Dw5xTNc1fypzciAiBpGYcG036Mc4rv8
	InAG6FTwwRjP/NMLy5oc1jrqOxR00qiIKRuqXRnA1T7FYQHWUxbO2XDsvSLn0A==
X-Gm-Gg: ASbGncuXTqE1CvzFoPJWp5V+3FchCZskS3NCY23ANNS26PBxR1m4XlfY6WGkYuiyM/y
	kM//ng6isfDfXaxMTQIADwip5jTbR6KM8V+sQOOKjuSwdjqRKb3ytRi+ASmI9NBL/2GaGNZH6Ts
	vc/mSDc996CltK0/h1H4p6veaYxU72Y0ogJkC3ISDf8Vbq+7mb5lHFzNHjdBvK746nfCQ5+mqhp
	KGUdAeTtDkaun7ZbJ1A+TLw56igAVXVoWpC3DAZ4s7imAKjmp8agYu9pytcvK+RoKCIuj17kVF7
	IWdzA2Rtyc6v67cQfUY4M4owWAWr6Lp1OC3xexOHXdo0He0bHnjDt5rgvuqjMBorqC+TWNNaSMZ
	L/+q1
X-Google-Smtp-Source: AGHT+IEoaZU685oyY1RxMhWH9bhmu7Mp6SyTxKHfukljAV+mwGtKh3HvAP/7oiX0n3Pi2Ui9aLwa5Q==
X-Received: by 2002:a05:6000:4205:b0:3a4:eb43:6003 with SMTP id ffacd0b85a97d-3a572e89634mr6807588f8f.29.1750068675990;
        Mon, 16 Jun 2025 03:11:15 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b0898fsm10862697f8f.54.2025.06.16.03.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 03:11:15 -0700 (PDT)
Message-ID: <56a9d083-72f6-44f2-be3a-29691745bcff@gmail.com>
Date: Mon, 16 Jun 2025 12:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/6] ISA based RISC-V tune implementation
To: mark.hatle@kernel.crashing.org, openembedded-core@lists.openembedded.org
References: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 10:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218809

On 6/16/25 04:29, Mark Hatle via lists.openembedded.org wrote:
> From: Mark Hatle <mark.hatle@amd.com>
>
> The following implements the risc-v processor tune based on the ISA approach
> as documented in the oe-architecture post:
>
> https://lists.openembedded.org/g/openembedded-architecture/message/2155
>
> This set also attempts to make u-boot and kernel configurations dynamic
> based on the TUNE_FEATURES.
>
> For the linux-yocto, I suspect that the config fragments should be
> sent to the kmeta (kernel-cache), but I'd like a review from Bruce and
> others before I do this.
>
> Additionally, this enables a new (optional) features_check for TUNE_FEATURES.
>
> I've found numerous items in the system have certain RISC-V ISA expectations
> that may need to be addressed over time, however the obvious one is the
> Linux kernel requires ima_zicsr_zifencei.  Since it has it's own -march=
> setting this will ensure the processor defintion will be compatible.
>
> Also dynamically configure the QEMU cpu based on the tune_features.  This
> is nice to ensure that what we're actually building should be able to run
> on real hardware.  However, it does highlight some of the (extension)
> limitations in the current design.  (limitations as in extension not yet
> enabled.)
>
> Note: OpenSBI _requires_ the 'c' extension or it will not execute.  I
> suspect this can be fixed, but it's beyond my capabilities at this time.
>

I'm not a particularly advanced risc-v user, but I use qemuriscv64 to
run smoketests on Firefox, with a barely-extended core-image-sato.

After applying your this patch series, librsvg fails to compile with lot
of "undefined reference" errors[1]. I haven't looked into this at all
yet, hoping that someone would know the solution from the top of the
head. Does this need some magic Rust flag maybe?

Beside applying this series, I didn't do any other modifications, and
without these changes librsvg builds (did I miss some new config, or
another patch?) .


[1]: full log:
https://gist.githubusercontent.com/OldManYellsAtCloud/e9968f3c63df943e8fd54dc217ab15e6/raw


