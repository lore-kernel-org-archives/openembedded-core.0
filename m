Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CC1C7EE30
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:01:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.17747.1677661257272826994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 01:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=wo0C4J2z;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so11279033wmb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 01:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1677661255;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7/Dj618xu6Xjw2E84FRfbPM7G8K4oUig2I3DDTbemfU=;
        b=wo0C4J2zwCZax/VVjNGVYi3nD/XijFDVJJ3R7YdBhFZfSCghf92+hCLQw39c2UwSgl
         AfH5a+37jQGD2gvG9wNv56rvzMutZxzHP3bOykl+l1gNu86SMqW1d2x7yZA1FiBzjtw1
         bX4Tq6I07CGFzi18wVK//F4eOiYt2r3+Rvba9JOds9dpDsakQ6aKQRoBFtK9ZnW5hr02
         P3s/7ecyZuIcSrmZlTCZZqRRBf4zC9KHa2RuVc2KyN16uXBgiXNPMajZhsZz6GAUcrE+
         jNvizGQqv0AqKs0EqKjddn+38FMJZyZ6BxMXOXZ7QlJNzJzbCHYiMvdl99DPLm081wAl
         SddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677661255;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/Dj618xu6Xjw2E84FRfbPM7G8K4oUig2I3DDTbemfU=;
        b=5Z+ZCXKNCr2zTjOo5YKxdtdvL3tWq5Wg1Qnc9Xh/EKRAzDiNVZRc7dKgl3t3o2HBuZ
         tSgZOx+3bClkvXen8SxFCYOC0ap52l65oJPzqDdK1osqgugwMBsbP8FREcOgOfGhydII
         wg3QNSRHxdBr5I7t9Nrpez9EBmtB9mYVAEHeDRdI7j9PY8nA8UfmHBi3rnbFBz4uFGL3
         fHh9Ei0ta86NiVTdKnUT76ux4xO1p4J+Q+edmQlcTQx9CxUJSqAfpHFnP9z5CG4li6B1
         NJiUnd/im6VfC7y/MtD/17hTqW8H+X0bELi4Nv6i45XjMZdRn07NY3OVIqEkCNo+Ttuh
         ONyA==
X-Gm-Message-State: AO0yUKUec9d7JUI/x+UDby5Vndd/It3feekCt0Va9iPcMQ9fDOQwYPjv
	o2nr7mttLHwG8vMUqxn6fMS3mg==
X-Google-Smtp-Source: AK7set98azcnhT4YV7OvoR6MdTpRN2JJO8Rp7vu6Vz82QgEa9Ei7w3895kIqWca9EL5+pAnqH/b0YA==
X-Received: by 2002:a05:600c:1c0a:b0:3eb:2e32:72c3 with SMTP id j10-20020a05600c1c0a00b003eb2e3272c3mr4401481wms.22.1677661255327;
        Wed, 01 Mar 2023 01:00:55 -0800 (PST)
Received: from ?IPV6:2a04:cec0:1041:e243:5666:4e9c:8394:7d10? ([2a04:cec0:1041:e243:5666:4e9c:8394:7d10])
        by smtp.gmail.com with ESMTPSA id l1-20020a1c7901000000b003e2058a7109sm18351239wme.14.2023.03.01.01.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 01:00:55 -0800 (PST)
Message-ID: <f6d3523d-bfda-e849-3693-54d4337e71a7@smile.fr>
Date: Wed, 1 Mar 2023 10:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [pseudo][PATCH 1/1] pseudo_util.c: Open file with
 O_CLOEXEC to avoid fd leak
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Mingli Yu <mingli.yu@windriver.com>
References: <20230301000302.93660-1-yoann.congal@smile.fr>
 <20230301000302.93660-2-yoann.congal@smile.fr> <Y/8SQZ9wDOAtztSX@mail.local>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <Y/8SQZ9wDOAtztSX@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 09:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177877

Hi,

On 3/1/23 09:52, Alexandre Belloni wrote:
> On 01/03/2023 01:03:04+0100, Yoann Congal wrote:
>> From: Pavel Modilaynen <pavelmn@axis.com>
>>
>> Use close-on-exec (O_CLOEXEC) flag when open log file to
>> make sure its file descriptor is not leaked to parent
>> process on fork/exec.
>>
>> Fixes [YOCTO #13311]
>>
> 
> This is missing the author's SoB

That is right. But, as you would have noticed by now, his mail address is not valid anymore...

What is the proper way to handle this?
* Should I track him to ask him a proper "Signed-off" patch ? (He seems to have changed company)
* Should I change the author of the patch? (I do not like this but on the other hand, the change is quite trivial)
* Something I have not thought of?

> 
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>>  pseudo_util.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/pseudo_util.c b/pseudo_util.c
>> index 64636b7..b58036f 100644
>> --- a/pseudo_util.c
>> +++ b/pseudo_util.c
>> @@ -1611,7 +1611,7 @@ pseudo_logfile(char *filename, char *defname, int prefer_fd) {
>>  		}
>>  		free(filename);
>>  	}	
>> -	fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT, 0644);
>> +	fd = open(pseudo_path, O_WRONLY | O_APPEND | O_CREAT | O_CLOEXEC, 0644);
>>  	if (fd == -1) {
>>  		pseudo_diag("help: can't open log file %s: %s\n", pseudo_path, strerror(errno));
>>  	} else {
>> -- 
>> 2.30.2
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#177861): https://lists.openembedded.org/g/openembedded-core/message/177861
>> Mute This Topic: https://lists.openembedded.org/mt/97303652/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

