Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2696C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 10:32:43 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.9643.1749724362470424835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 03:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X6vVLO1P;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so1414263a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 03:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749724361; x=1750329161; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5PVBne8Ufj+oKpAIcnGFPv/au33R18cx6ELRvcJqO3Q=;
        b=X6vVLO1P2OQ1GBzmqz6l64vNJ2t/ZQFQB+06cqF6IvhH/o11VZWk5AR01Ot29c6VMa
         c9uF2Or/dOOAhLM3yI1O6K3RcNJrYGzNl5FqQcXg1Y91GeM32kwdwtkioespJ0VXLzpA
         IyrSEG3uvoQy9y96T41LnhPYZWkQdnNWti/KkIFsjyKzvOlfi1MELizcxbCTNyFlZ4Cp
         bbX4Y0WNZmfT7kfj+XrGPH/HKInse0OHmxRdcHKlnpZUYVH30K8Lbr9gjh4Srx8rc/yT
         +BGLMoFiOdHyulxjtpSQs+PbWHFAIFh1SJ5KBDkxVE2rnzYnjvPcrwJamtOWb00RJkSj
         JPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749724361; x=1750329161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PVBne8Ufj+oKpAIcnGFPv/au33R18cx6ELRvcJqO3Q=;
        b=rSCjtVPyQD3NmbG2811wwd7Uq3ETCKlmNJHg9G7FfutBZVhkaB/XY9iSQolLfyoQ04
         hvCrNdiG+bH3xqVfL7WBIDLzr+bKV7siByFy8xwnUCcNJcqeYWKe9WWfii1dG56nEJGw
         lGAgNs/kAGh0AgQXzRI4gU6LvORYxrfBTGV44Ci6YbLIGN9k8nUBMrfCb13f7YAgNs7O
         SsH4IKlcHbAgDeMpXCfwnUXUkHE4/8eXGayl8vPm855qXNEALt7kAepIm8D6R6jKP6EA
         SBGNTIk0lKqbvaH6/Ks5TwIFfg243IZuG/nVjb3ldiwd090wpGBp/UeVDSnxNmMpJ2Ns
         MolQ==
X-Gm-Message-State: AOJu0YxkmoCgRVGmTXKhhSI8c0D3Ql5yD6TH6rdrdUOHbtHu8A50of+l
	Q/K0jkrAbm22ecSeLjKxaaACf6S5gpz5kaJU2Rn5+Zcc6ZWkegccdqCR
X-Gm-Gg: ASbGncttxvb0xfQAAVwFtsrxamDRInJiF4DIPxV5FQnygIirgBJpKHWZd1dTYJlyklV
	ZDkgOR9+LyALv24ARlrI3dIrVww2k5piD/zQwjoTTIqAgGg6EsdOsshEA95bYptgcTl7uVD5Am8
	NNbHMO+Ps1Ew6oImzDwiovUYJZaX2nhaEIVj+iAXgM79xOPnoMI4xjFoROwFJixZc/KW+HO1FxH
	NImhHSk/JcdP0JXqbAS6aTrqgfH8Kp1asN9ICki/4FEUwUFNrK3QoFD0f47PrZTO+6KRxTluRgY
	lmMxSJXoiO3cm0VHjq39Wa1qC0DUjuDKJEWsOgyJjydN+WY22qUl/N9BElrZrZ3uzmFeiQ==
X-Google-Smtp-Source: AGHT+IFhCh8z9bxJkzS9sfWurim+HMhabXkcmTgQIZl/FAINBbBMubx4HnCC3ueqPrT6t4Oembl5QQ==
X-Received: by 2002:a05:6402:1d4b:b0:5ff:f72e:f494 with SMTP id 4fb4d7f45d1cf-60863b093d4mr2706072a12.31.1749724360433;
        Thu, 12 Jun 2025 03:32:40 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6086b282444sm968339a12.79.2025.06.12.03.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 03:32:40 -0700 (PDT)
Message-ID: <8f3c3945-c413-4d86-987a-d0337b815edf@gmail.com>
Date: Thu, 12 Jun 2025 12:32:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] weston: upgrade 14.0.1 -> 14.0.2
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250606185625.4087714-1-skandigraun@gmail.com>
 <5FC76FC6-42A3-4AE2-92EA-6A0CB2A8BDC5@arm.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <5FC76FC6-42A3-4AE2-92EA-6A0CB2A8BDC5@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 10:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218504

On 6/12/25 12:29, Ross Burton wrote:
> On 6 Jun 2025, at 19:56, Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org> wrote:
>> +PACKAGECONFIG[vnc] = "-Dbackend-vnc=true,-Dbackend-vnc=false,neatvnc libpam,libpam”
> Why does this need explicit RDEPENDS?

I believed the error message which claimed that it is "Run-time
dependency", but I got to admit that I haven't checked this behavior at
run-time. Should it stay build-time dep only?

>
> Ross


