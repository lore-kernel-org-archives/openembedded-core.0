Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EC0C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:49:00 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.8255.1749131332325821049
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 06:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=S6JbwVeF;
 spf=pass (domain: baylibre.com, ip: 209.85.219.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f0ad74483fso9577576d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 06:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749131331; x=1749736131; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kYGceDpp5ld/j/YoamyUPX70x9Ke1y7+kNVgu2wRB6I=;
        b=S6JbwVeFjSGioIR+ZT0MijKo2vzfHuZNWhJidhCiaKguyDVMfPxyuuXkRK96ZdgyuU
         9N+NzrguIpbSLXfkaKXzmOx9IoX2dt2DQgyFuK3/kFe9r2S9Zl8JS9OhBC/W2hv5lNOP
         MV8W4q4ckHbQ3ztbVYFODHx/LgYuCYRyRlwBouXPEUV2FxlbBbebHv6rvngz6HsFAhy3
         lcaCnl9eFYEYIi720s+n4tF5hadV+/w3DvnWp3Pg4MS6ZPZ0Vll+rxnAmNc7HnJmzyT0
         Jj00pHCqwdDkcc2TsdTFgnKdt8EZwuri3ZqXYILth2tQtnu8JoX0vLAkaHHD4Sd2zqXR
         YV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749131331; x=1749736131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYGceDpp5ld/j/YoamyUPX70x9Ke1y7+kNVgu2wRB6I=;
        b=pkyMm2mV0muGSDP1yYwQseHZwfEpcy3Nw3R9awBZj9Xc3gkzYc9WHhIncApbk35cCr
         GnfZvK6oCPe8TSEcgOYzClQdDLROvtvmxJqueprstMaRN/S/YKRdbgqpgmcWO+bBWesk
         PeWsjdtM/xzdEWUY2hOVhTc6nwbMA9NIdDz79247kCuzYdwMYNQZxwYba+/ueNRhF0az
         3NoZWXUW8h6xSlYZNKLQXdTROHKkDjRN18ftKzK2ft4x5IUEakhdY+c4mGbf6bOueA+/
         7HZ3kQaGTrYkzX9En+giXLfqcoQwYyT7rg6V1DqOOThYfU/o/2USlil+UVDktYF3w7ll
         YwTA==
X-Forwarded-Encrypted: i=1; AJvYcCXEjLw8EyrqCuz8spmpRU9PPrjR0JyR0k9ZakmDClzc8mG47WFi5ZZjYqdRVmbLmTqcQ17E4zzB286SF63yS1A20w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywo+RV35pvU1zU5Yso3m9EXkpm2Vt2EEVKqXhxV9vk4NOj+BXZh
	Ng5RnCCgFY3r1wr2DfVbSFzNxneTZqkcsljQQQfGNuy2RfyHYxs/MBelekI3sRANuv4=
X-Gm-Gg: ASbGncsa9rCq6rh3vHHjJnCc0kzFkuTif/qx5zse2RGR52v6ae7IP9qCnxQUHc+owiz
	K9rJKZpyjc5PXKhNPRRNm/P1SX5NEX3LMARVtB76MzDvnGCzYhhnaz3xI7iVl5O9Om3jL2iDQbA
	rg+cB8gSXLJAsTsDM5QORDGDsyF9per+5J1UKLlAOPQbPO3NLiE3BGv3hEREJjZ5+jQSl9SUsFG
	czQSotFWqnh/BfJIwNcl6jBSZ4qQ1gTHj2+3UYnET+wp9l4e1AcBWF7qrCQKallKYhpSpcTIZiP
	U0Mh0MS7FMYkOOfehnK7JBuZFCBXyxBqVZ1EJ1qY6wptPjUzX5FLYdmUDaYM4XyuMGBsGIv5FOv
	BjEMwS0Cq83wE1+/Tf/c=
X-Google-Smtp-Source: AGHT+IHG4+cE9x6WpvubohmN3YRakXYDt1QS2LSuMizETXRLqhRhXOgxVTjhJSJ7MTYX4V4Fd4jTMw==
X-Received: by 2002:a05:6214:29ee:b0:6ed:15ce:e33e with SMTP id 6a1803df08f44-6faf6fe57cbmr108232766d6.27.1749131331386;
        Thu, 05 Jun 2025 06:48:51 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00baasm121870326d6.84.2025.06.05.06.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:48:50 -0700 (PDT)
Message-ID: <717c479e-1a6e-4f1c-8755-e0baaf2b87f9@baylibre.com>
Date: Thu, 5 Jun 2025 09:48:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] ref-manual: document KERNEL_SPLIT_MODULES
 variable
To: dixitparmar19@gmail.com, openembedded-core@lists.openembedded.org
References: <20250605133429.367629-1-dixitparmar19@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20250605133429.367629-1-dixitparmar19@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218022


On 2025-06-05 09:34, Dixit Parmar via lists.openembedded.org wrote:
> This variable controls the kernel module spliting.
>
> Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>

Hi,

This should actually go to the following list:

|

docs@lists.yoctoproject.org|

> ---
>   documentation/ref-manual/variables.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
> index 9768d8f5b..592401eb6 100644
> --- a/documentation/ref-manual/variables.rst
> +++ b/documentation/ref-manual/variables.rst
> @@ -5359,6 +5359,15 @@ system and gives an overview of their function and contents.
>         the :term:`KERNEL_PATH` variable. Both variables are common variables
>         used by external Makefiles to point to the kernel source directory.
>   
> +   :term:`KERNEL_SPLIT_MODULES`
> +      Allow opt-out of split kernel modules. For some use cases, a monolithic
> +      kernel-modules package containing all modules built from the kernel
> +      sources may be preferred. For one, download time is shorter and
> +      installation time is faster.
> +      Default set to 1, one subpackage per module. Setting it 0 will generate
> +      a monolithic kernel-modules package containing all modules built from
> +      the source.
> +
>      :term:`KERNEL_SRC`
>         The location of the kernel sources. This variable is set to the value
>         of the :term:`STAGING_KERNEL_DIR` within the :ref:`ref-classes-module`
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218019): https://lists.openembedded.org/g/openembedded-core/message/218019
> Mute This Topic: https://lists.openembedded.org/mt/113485120/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

