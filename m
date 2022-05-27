Return-Path: <kristian.amlie@northern.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1B0C433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 12:08:08 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.2828.1653653282819448405
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 05:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@northern.tech header.s=google header.b=ZEr66B91;
 spf=pass (domain: northern.tech, ip: 209.85.167.47,
 mailfrom: kristian.amlie@northern.tech)
Received: by mail-lf1-f47.google.com with SMTP id v8so6586322lfd.8
        for <Openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 05:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northern.tech; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:from
         :subject:content-transfer-encoding;
        bh=7EcxvgcW+oGc4pH5VdWiEvtjBQAHqdJ7zcEiN2PC0VY=;
        b=ZEr66B91TNL6ZJKVQqsaGYhftgUv+kXUQIOArrFYDW29dg9C2VBaBvweg7a5TYVMli
         i2AZn7kjB2FLgzML7pu5AypZiOjClmdySOCBLV+abDeY/GnwkLDpd5whXwOp6d+ANAC3
         WMbZhzLap5rnpoNsyC3IYlsVZaZafl3Tg/nFj1jrxcSq8xtJfmxOclByLdBbm99aM734
         tjumdVF4ePckWfp7+QompuVaMDE/w6ynfCqS5wXsSbkvj8bzxb8/JkYVz81FWfKQWVQg
         twjsEDaBm9BYSpfyFEcqMGjhW/UcMTE1C7LTBQl0a6B34rid78eJJqSwgqrezMkCgVKo
         0V4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=7EcxvgcW+oGc4pH5VdWiEvtjBQAHqdJ7zcEiN2PC0VY=;
        b=bKJExXYL3Wpp0n4tDN0I50fQuaohhaH8KC/MvoWzH4HQHNbTjlKDQbnklKo/A0g9Ic
         u0kzyY1G9XHBDu6zVzx8CjtpwNVp6gI3OKmATCCebE4WKp+Zg4fyspzQo1X2ohg1pgUH
         aZVrzFPRw0CCEsfYw8VJkBLiaLeuY1Pl6FzD+nmv8s3cyVzKyCbfH66lKMg19SAEntZW
         RO/4y1SBXlR9VmFDkchHYWrRElZs1ccQQ6N4sscDWIC4Q32MmqnQoM2g0kYL1QwlCI2/
         bUI95vFi0OlSmcwVzv968w8yw1hSZjNOZ/Jt60EvtmqwSaFN7pF864ckkWFnQieHZuKF
         7XrQ==
X-Gm-Message-State: AOAM533nU2fBvSYKoWzPhKCYiUEoI2C/tzc9ZC6ZuD9S9ppljP0Y9JKB
	7GhzweWaRkpKr60tSZIucks6Jc0N9nqGbXEl
X-Google-Smtp-Source: 
 ABdhPJyT8T8A55o/q9fDWUtgWt37WwUi5ynoYdQM1R58XXv7XJDSR5JhDZIo5qQjg80PewRnDajB3g==
X-Received: by 2002:a05:6512:1509:b0:443:e7fa:1c68 with SMTP id
 bq9-20020a056512150900b00443e7fa1c68mr29340353lfb.58.1653653280651;
        Fri, 27 May 2022 05:08:00 -0700 (PDT)
Received: from [10.180.37.36] ([45.153.104.1])
        by smtp.googlemail.com with ESMTPSA id
 p10-20020a2eb7ca000000b00253da47cfbesm995630ljo.80.2022.05.27.05.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 05:08:00 -0700 (PDT)
Message-ID: <f3eb760d-07f2-b5ca-a425-fc1166be8064@northern.tech>
Date: Fri, 27 May 2022 14:07:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: OE-core <Openembedded-core@lists.openembedded.org>
From: Kristian Amlie <kristian.amlie@northern.tech>
Subject: externalsrc wiping out external source directory
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 12:08:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166208

Hey all,

I have a problem on kirkstone where using the "externalsrc" class wipes 
out the directory mentioned in EXTERNALSRC, in other words my personal 
development repository.

I have traced it down to the "do_unpack[cleandirs]" variable flag. This 
flag is supposed to be removed here [1] when using "externalsrc", and 
indeed I have verified that this is the case. But when the function is 
about to be executed, the "cleandirs" variable flag has somehow been 
restored [2]. This causes the directory to be removed after all, despite 
the attempt at avoiding it.

At this point I'm a bit lost, I don't really know what happens between 
those two steps. Does anyone have any idea what might be happening? It 
sounds like a pretty serious bug to me, wiping out things in the home 
directory of the user.

[1] 
https://git.yoctoproject.org/poky/tree/meta/classes/externalsrc.bbclass?h=kirkstone#n93
[2] 
https://git.yoctoproject.org/poky/tree/bitbake/lib/bb/build.py?h=kirkstone#n191

-- 
Kristian

