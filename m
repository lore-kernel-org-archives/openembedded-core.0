Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD549C48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 20:10:49 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.6932.1707941445419212338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 12:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=qK+y2WpF;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7872614af89so88017885a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 12:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707941444; x=1708546244; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ngMizz9syFYeYUr4+uAkKPB4IgrTfXPWoEIvkaT9scQ=;
        b=qK+y2WpFoST3RvuQvcN/uIvAKE6ktpHO0oYWVn6Qhq8U1/g3YQJK33qKlGX4NTiP4t
         wUl7mMqU8aFYEkd+gbYuQSz6MhlLSykFceBAhVME3afhuB2j4XNa4q3FVsCSuWLdFROM
         mcCC7YTcsvJrCWwf/okw/BMtqiFti+e6hgPcsGwe07P8EEqB46X6j1sHjLYd5KoGIluF
         vnfdSl6KvvkuQvEuCEfPK3cJRvT64I9YzkxD48S+qhPUqLt4RIiOlz0KZxlxmkcf4+P2
         QGoovlC8SA6yqOJKlkWbujVzv7/kia+sF3yhvE+9hkIqGxf1fb6AF5YQJJWa07lt0omw
         b5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707941444; x=1708546244;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ngMizz9syFYeYUr4+uAkKPB4IgrTfXPWoEIvkaT9scQ=;
        b=syRtR8jzKyY76oeU5CNC5EcPOGbuTP/YnKI2x/7xi3XvyjupdgjjoRETR0vVLIXKBe
         d8w32cLnFkcRyqIOA/pXf0BCT7mX7uM2Clm+oq/VIVmcGCSYs2YeIaxXA1ENRxdO91aP
         90CO6ybxubqfwewDtU4gQVUJvjg2S4aoFOLCSPLIxdYoEc0ZRClmVezB1kFPtscKAd8e
         CThFuQgaM7YQ0nACO5fehkdmQLoMkW/te1/PkZ1bgRiDYtjZU9mBpieTp/r8y7Y9rbZ0
         7pJ3TTnrSgFJGTiLY45SvwZvmXPumHGVFbNHBC37lMuaSspBUPV4ZuZxh12GVMkkNiHJ
         14qw==
X-Forwarded-Encrypted: i=1; AJvYcCXBzMh+9Ics1khYhoU/pwPTuYjIzCIQn19pwRsslmkbwRxSq1eHbw0hyQ1fas+3F61ZD7eWbAnMZtM46KVHu81APYq6SqnABLyTZwANmYGxI4Kfh3AS9Cke
X-Gm-Message-State: AOJu0YxrfGX3k4ZA3XVmRjCHdGxjYPis80xjEae5h//pIcDybd1Ermqk
	OlnYGRwyH2o9T9LbyxC+h2vItzJLN2u9T/mCPYtxSKtIx2gfypM/9G00XiiQZg8=
X-Google-Smtp-Source: AGHT+IG1t8XXbpSVKDDRibklSl8u/diVyT4v6x95UVa6vBSvuLUIGp8ZHnnWR4cC6Ma0uDw2fr018A==
X-Received: by 2002:ad4:5c4b:0:b0:68c:b9a8:a41b with SMTP id a11-20020ad45c4b000000b0068cb9a8a41bmr5921526qva.6.1707941444362;
        Wed, 14 Feb 2024 12:10:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWBTf1hUJgaPs/2rrGDV/RdG6Ton3WkyVbPNt+b2Wtd7Vc9Tvi0qtKMOq0eWONHvg8y2XG1GyaVWs+kfkdlS1Gldw7XIZ1aN+mQs/FJLRtJJVd2rnR4ZQ4kEqNAiCeQl04o+ThO9k0oEU9IqEzLjtvP
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id oq17-20020a056214461100b0068ed5efd0absm2225897qvb.70.2024.02.14.12.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 12:10:43 -0800 (PST)
Message-ID: <fd6070c8-53bc-4d46-815f-a4986120858a@baylibre.com>
Date: Wed, 14 Feb 2024 15:10:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] patchtest: log errors and failures at end
Content-Language: en-US
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>,
 tgammblin@baylibre.org, openembedded-core@lists.openembedded.org
References: <20240214190302.8994-1-simone.p.weiss@posteo.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20240214190302.8994-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 20:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195495


On 2024-02-14 14:03, Simone Weiß wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> At the moment, running patchtest locally will only print failures and errors
> to the log when the not passing test case is executed. This might lead to
> people overlooking issues with their patches, so print a log line at the
> end if testcases showed issues. This should make it more easy to spot then
> before.
>
> Fixes [YOCTO #15389]
Thanks! LGTM.
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>
> Changes in v2:
> - Adapt error message to not contail FAIL/PASS as this string is used to
>    check for individual failed testcases.
>
>   scripts/patchtest | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/patchtest b/scripts/patchtest
> index a1c824f7b7..8c9a73e1db 100755
> --- a/scripts/patchtest
> +++ b/scripts/patchtest
> @@ -142,6 +142,8 @@ def _runner(resultklass, prefix=None):
>           logger.error(traceback.print_exc())
>           logger.error('patchtest: something went wrong')
>           return 1
> +    if result.test_failure or result.test_error:
> +        return 1
>   
>       return 0
>   
> @@ -158,9 +160,14 @@ def run(patch, logfile=None):
>       postmerge_resultklass = getResult(patch, True, logfile)
>       postmerge_result = _runner(postmerge_resultklass, 'test')
>   
> +    print('----------------------------------------------------------------------\n')
>       if premerge_result == 2 and postmerge_result == 2:
> -        logger.error('patchtest: any test cases found - did you specify the correct suite directory?')
> -
> +        logger.error('patchtest: Not any test cases found - did you specify the correct suite directory?')
> +    if premerge_result == 1 or postmerge_result == 1:
> +        logger.error('patchtest: At least one patchtest caused a failure or an error - please check')
> +    else:
> +        logger.error('patchtest: All patchtests passed')
> +    print('----------------------------------------------------------------------\n')
>       return premerge_result or postmerge_result
>   
>   def main():
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195494): https://lists.openembedded.org/g/openembedded-core/message/195494
> Mute This Topic: https://lists.openembedded.org/mt/104359353/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

