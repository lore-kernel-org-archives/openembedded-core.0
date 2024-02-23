Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30834C54798
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 20:31:08 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.5342.1708720262083760696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 12:31:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ytX01ihv;
 spf=pass (domain: baylibre.com, ip: 209.85.166.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-36519980c04so3335005ab.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 12:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708720261; x=1709325061; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EdCNIboGyvgQPjvSPDCKvtTW6qbeFL6lxOt1IeTdf+g=;
        b=ytX01ihvhNRY+a8uz56rmLp4ufgEQE+TgJ+aQhSMLaw57QpSbAHOwYXceCWOkI2Dx2
         NeqwZFecxJx11ZrcnTcfPyeXMbcYi0XuOBR+VZHVM5tuJzyy2yKprUa+us63wNVJTJ3c
         wJ3C7pzbcPcUrCTDujS1+pOdLY1mwbZIiZghXsSQYQHeDYv3OMWtsVob19CpFTPNcbUc
         tDt7bSEhch43fshKJy9wNoQnUtzV46Fhd3m/Gib54W/a0n0uvzzY/llEhiuz4nSqimIq
         6D7VLC+vUFYfIgPVasSKWIJON7o+PWg2cKBDq5eWjCoeprxjGMR8N7/z+NWI2llRZfML
         uUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708720261; x=1709325061;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EdCNIboGyvgQPjvSPDCKvtTW6qbeFL6lxOt1IeTdf+g=;
        b=LAXSNEr2CPjs533dXe0Mw/dHYSInKSQjB4zPmA07B0sL/MG9wUV+zN8Ct43xBifLd4
         q7EP7CATrjmbaFcjmSUmfqYrzXiodKpuS+B5M34Thvz9ZFKJ0OLDyQ/YdKu9nTa747Gw
         zbxNDyelvU2HOwMbE75JlA51n+psOwhKmPkYROXkuFuKsli92IU8j51TpRAnoZeHy7uC
         xe2BsZQD3Oy/VQZKmfOJB86wiNT8OocUy4xmB4tuXqmP5ZPb61oni7q02Ct5pDfK5brU
         v8rljvt+Tvt5GAg7ZQFrdpcEwf7e9xw98RHG8X3PQ98Md1ZQlazNusfYI/q16zxuvHye
         +/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVnPOIifvfGUyGVT+QCKzYYaeMgy+MzKFoxCEjL1NfnQ7y+W++4m+KxvAfMycOjsHSR6oPC85ObX8eWhwlpV05SA8kfejQDnGUJpa8WDWHM5tlcpqn9V2VL
X-Gm-Message-State: AOJu0YyenU3jkrXLAbW2On/eiBKKLr0PCcqLuij6x+Gp450duEVWJYqw
	jSIq70pR5x4me3nSASJvbKhtNL+Tgayva7VOZNihS1H/TFVaFuJJjL/tKgtWyEc=
X-Google-Smtp-Source: AGHT+IHDHnvbBpKiqbKnch4G9NezPDGEFeiwP2CXhqnSS0IGXguQBZr5hexCek6+sgbVdKdNG/F+4g==
X-Received: by 2002:a05:6e02:dcf:b0:363:b615:9d92 with SMTP id l15-20020a056e020dcf00b00363b6159d92mr841634ilj.26.1708720261187;
        Fri, 23 Feb 2024 12:31:01 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id lx16-20020a0562145f1000b0068f9fec11fasm4083370qvb.36.2024.02.23.12.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Feb 2024 12:31:00 -0800 (PST)
Message-ID: <feacd036-7b89-4bec-99f8-dc2f5a229d13@baylibre.com>
Date: Fri, 23 Feb 2024 15:30:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] patchtest: provide further guidance for
 failed testcases
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>,
 openembedded-core@lists.openembedded.org
References: <20240223201745.16234-1-simone.p.weiss@posteo.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20240223201745.16234-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 20:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196108


On 2024-02-23 15:17, Simone Weiß wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> Cross-reference the wiki page on patchtest now that it is updated and contains
> more information how to address failed testcases. Adding it in patchtest only
> is enough as patchtest-send-result already points to the wikipage for failures.
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
> v2: Instead of prodvidng the infos in the log point to the now updated wiki to
> avoid issues with autobuilder when adding more lines.
>   scripts/patchtest | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/patchtest b/scripts/patchtest
> index 3163420220..42e70fd4b7 100755
> --- a/scripts/patchtest
> +++ b/scripts/patchtest
> @@ -164,9 +164,9 @@ def run(patch, logfile=None):
>       if premerge_result == 2 and postmerge_result == 2:
>           logger.error('patchtest: No test cases found - did you specify the correct suite directory?')
>       if premerge_result == 1 or postmerge_result == 1:
> -        logger.error('WARNING: patchtest: At least one patchtest caused a failure or an error - please check')
> +		logger.error('WARNING: patchtest: At least one patchtest caused a failure or an error - please check https://wiki.yoctoproject.org/wiki/Patchtest for further guidance for further guidance')

Hi,

The idea here is good, but it looks like there's a typo here...

>       else:
> -        logger.error('OK: patchtest: All patchtests passed')
> +        logger.info('OK: patchtest: All patchtests passed')
>       print('----------------------------------------------------------------------\n')
>       return premerge_result or postmerge_result
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196107): https://lists.openembedded.org/g/openembedded-core/message/196107
> Mute This Topic: https://lists.openembedded.org/mt/104535997/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

