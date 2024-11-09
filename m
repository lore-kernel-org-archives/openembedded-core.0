Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A463D5E376
	for <webhook@archiver.kernel.org>; Sat,  9 Nov 2024 15:40:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.18914.1731166797656547553
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Nov 2024 07:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yW99DgOJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso38153775e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Nov 2024 07:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1731166795; x=1731771595; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Koyg38kZumMt6xHfsuCxKp5TU/rO4SP9TJwBDeRcyCA=;
        b=yW99DgOJ/Z8423N9OF6rYpiq2bTA/BV6B/eBD8TcIf+egIJYaVy3B3vRw2cVApg2Xv
         aniw2MSOYRHCTmE7mGQ+DEpYeb0DwGe8UfDl7oSM3c39D0iV6Z6zlYmbfaUKPsVDhJjz
         nP/jYZF3alc2xDddoYhBHH1N5jprUtvK/VnmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731166795; x=1731771595;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Koyg38kZumMt6xHfsuCxKp5TU/rO4SP9TJwBDeRcyCA=;
        b=gp8Ncqnh1HI2py7TqvQBLw+PK4PUrU47JAyF6fEbZ9UrBPx/w4+x7Fj0XiXfcEvcEB
         gQ7ug803KVOSC0tVLI5k99XgTlc6K//pqslmtQOZtEzbe8H4miRC4M7WRcGZ9b6cXO/l
         t+1tjrDPfGrdjew2Shav0ZzT6U8VVGm5dqhLLeJ+YBTJqK4J8jV51R0XFAM9qUk9CCos
         KpiKxclxEIyaK9Y1BJzMKpfyLFn6SQeKFNOKG0WmU/JjaE8DImd3sqtuTb0oHyqD+UMj
         E/L4dKAewqckiWHFAPyYQoDJhJyf77g/0x9Ppe7+kS61IMR0V9GF1QkMf5ha0BSz1N1G
         9imw==
X-Gm-Message-State: AOJu0Ywtu309kf8AHZ/SsDUMPWBt3Q6Zb4YH+FZLf3dOUeEyxrc4t4ma
	svvGXaPzPbMNfMEqPOwF7YwJTLgmBayDoLUMy6ATj0TKn7WzZsTyPy3ETqfq5J8IhEbUr9aJg52
	C
X-Google-Smtp-Source: AGHT+IHDyyvQ9qWyNm6/e9sgXVDwoLy0HhzJCS2BFxIQc9mMMjsjfiHjsz/SrFfjDrgZiUGS1vNqVw==
X-Received: by 2002:a05:600c:1c9b:b0:431:5c7b:e939 with SMTP id 5b1f17b1804b1-432b750b52amr77102075e9.18.1731166795042;
        Sat, 09 Nov 2024 07:39:55 -0800 (PST)
Received: from [192.168.0.27] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9ea5d9sm8008569f8f.75.2024.11.09.07.39.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 07:39:54 -0800 (PST)
Message-ID: <6a186b8d-74a6-4961-880e-fd49b8eba04d@smile.fr>
Date: Sat, 9 Nov 2024 16:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3] reproducibility: continue testing in case of
 build failure
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
References: <20241029100912.138924-1-yoann.congal@smile.fr>
 <66ff6a8c-ee3d-47d9-8361-f3de38163e22@smile.fr>
Content-Language: en-US
Organization: Smile ECS
In-Reply-To: <66ff6a8c-ee3d-47d9-8361-f3de38163e22@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Nov 2024 15:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206907

Le 04/11/2024 à 12:25, Yoann Congal a écrit :
> Hi,
> 
> 
> Le 29/10/2024 à 11:09, Yoann Congal a écrit :
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> The current reproducibility test stops all build tasks when a single
>> task fails (default BitBake behavior). This means that a single build
>> failure prevents the reproducibility of other packages from being
>> tested, which is not ideal.
>>
>> To address this, we now use the --continue option of BitBake during test
>> builds, allowing the build process to proceed even when some tasks fail.
>> The failure cases are handled as gracefully as possible.
>>
>> In the event of a build failure:
>> - The entire reproducibility test will be considered a failure.
>> - The complete BitBake log will be saved in the "saved output" directory
>>   to facilitate debugging. On the autobuilder, this log should be
>>   available at https://autobuilder.yocto.io/pub/repro-fail/.
>> - The last 20 lines of the log, which should show the failing recipes,
>>   will be displayed in the oe-selftest console.
>> - If BitBake fails to create the deployment directory, it will be
>>   manually created to allow the comparison process to proceed.
>>
>> Here is what the output looks like when testing reproducibility of bash,
>> a failing recipe (hello-fail) and a non-reproducible recipe
>> (hello-norepro):
>>
>>   <snip>
>>
>> => "reproducible.ReproducibleTests.test_reproducible_builds".status is
>> correctly "FAILED" but the reproducibility of bash and hello-norepro is
>> tested.
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>> v2->v3:
>> * Added a missing end of line in config concatenation
>>
>> v1->v2:
>> * Upgrade some log from INFO to ERROR in the failing case to make it
>>   more visible in the logs.
>> Richard Purdie review:
>> * Simplify log handling
>> ---
>>  meta/lib/oeqa/selftest/cases/reproducible.py | 56 ++++++++++++++++----
>>  1 file changed, 47 insertions(+), 9 deletions(-)
> 
> That did not work in the https://valkyrie.yoctoproject.org/#/builders/87
> builder :
> https://valkyrie.yoctoproject.org/#/builders/87/builds/17/steps/40/logs/stdio
> Sorry about that :(
> 
> I'll look into this as soon as possible but I would totally understand
> if this patch is reverted in the meantime.

For what it's worth, with the fix [0], this worked as intended : in [1]
(reproducibility test for meta-gnome), geary fails to build but
reproducibility was still computed for other recipes.

But, this is not over since geary is displayed in the
"unused_exclusions" list (which is not wrong but not useful), a better
list would be "excluded package that were identical between build A and
build B". This list should serve as an argument to remove a package from
the known non-reproducible lists.

[0]:
https://git.openembedded.org/openembedded-core/commit/?id=e89bbc00ba16574d719b199c01ffbf37646f4f54
[1]:
https://valkyrie.yoctoproject.org/#/builders/87/builds/18/steps/16/logs/stdio
-- 
Yoann Congal
Smile ECS - Tech Expert

