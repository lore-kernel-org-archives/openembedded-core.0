Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2265DC433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 22:11:36 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.4140.1642111894551792109
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 14:11:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FIPWr7Ee;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id bu18so1404413lfb.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 14:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=vVhc1dItA/9UqSiK+6jkktZcH0QbUMS28IEVzSU2xI4=;
        b=FIPWr7Ee/OcBPTAY+jXKPlHKu4EI8RPGkm1aCeXR5/iCtc7mE4QdOldorQdE58vScE
         4e/6XsGXwD1Y71d1OXOxooWDobPcOdksF3FY/ZMtaB3t8LrzS8k/0RPtriXEmqSM6+7N
         z7NlUJZ2LBOxPw+kCmo+pnPAtoKcWvu9qUxL5v+uUEOwFoVactdeDakvSxPsHqij4nWC
         Hp7L39uDjHEnvoSouoFEIA7jqRdij1Wp/e2Oxw2LZ51tuy0M/ahJeexW79Wy+bIVQuCO
         +vFqdPoarfX0wV0HLjj4IO7heWCwfXagjdLsYQh0II+x8kL/GUYe7HOJgJXFl+/fZ8lS
         U+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vVhc1dItA/9UqSiK+6jkktZcH0QbUMS28IEVzSU2xI4=;
        b=4MJ3cbuXGl8q0aHkcgt3ZwL85o4Q3jjDPnQNpLfyAN0rcqe6GEEkt4QKS4tmiUPy/Z
         0RwKHUaOPUOTdMsCysyYmJGP69kD0veCg6wcWVeww3JhEGk8ndoQj2XN5wRIiT1Ha1Lv
         XF8X543/D9AFePbA+TrCz1x8yeQVqe5mogdMPVkxQBt4ob0ddTsaiYg7cBAuEJin1NKZ
         2JEKjnYoWn8aZsshfbhvu6hadRyl/loUVX3/uTKVUY7FDONJK7wjBtoGuMEo+K3jG7fm
         VoAo+vvB3ZNf5uBBTQ+9d6F6LZr6UyXx0cenCnxazKd31//429fQpvvb+qJ/lPW0yRJi
         3Mew==
X-Gm-Message-State: AOAM531ACkKi8nRh8LYeNdWt0AuE8TdxNoukxPrxAY3DUjO2tulII8sI
	0YodOpw19cB/mOHWYiKci/4=
X-Google-Smtp-Source: 
 ABdhPJyuGlQDB3AMJEsxSS87P5N45Yi0LF3u+OSUsxHNX3IT64OhhAPoN9rp1novVe9XbdAqatI8Og==
X-Received: by 2002:a2e:7211:: with SMTP id n17mr4534465ljc.324.1642111892509;
        Thu, 13 Jan 2022 14:11:32 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id u7sm393790ljd.30.2022.01.13.14.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 14:11:32 -0800 (PST)
Message-ID: <60996169-d939-2a35-f6ac-8bd0edf37f1b@gmail.com>
Date: Thu, 13 Jan 2022 23:11:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] Zero umask when unpacking sstate packages
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <f914d2c4-b3eb-f52b-6010-0447ac874fb5@gmail.com>
 <dc7564efda700a003c380edf6e769530cce15075.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <dc7564efda700a003c380edf6e769530cce15075.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 22:11:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160536

On 1/13/22 23:07, Richard Purdie wrote:
> On Thu, 2022-01-13 at 16:44 +0100, Jacob Kroon wrote:
>> Hi,
>>
>> I often see this diff churn in my buildistory for shadow-native (and
>> similar issues with icedtea7-native from meta-java):
>>
>> -drwxr-xr-x -          -                  40 ./var/spool/mail
>> +drwxrwxr-x -          -                  40 ./var/spool/mail
>>
>> One can reproduce it with:
>>
>> # bitbake -c cleansstate shadow-native && \
>>   bitbake shadow-native && \
>>   bitbake -c clean shadow-native && \
>>   bitbake shadow-native
>>
>> I see that the sstate package contains the correct permissions for
>> 'mail', 775. So it would seem to me that it is the unpacking from sstate
>> that strips the group write permission.
>>
>> Testing with the attached patch and the problem goes away.
>>
>> Is something like this the correct solution ?
> 
> Is this with master?
> 
> I'm wondering if your code has:
> 
> https://git.yoctoproject.org/poky/commit/?id=c4ecf7c1122380cdbc74fe692aa91756dc5bdf6b
> 
> applied?
> 

Yes, this is with master branches of bitbake/openembedded-core as of
right now.

So yes, I do have that patch applied.

Jacob

