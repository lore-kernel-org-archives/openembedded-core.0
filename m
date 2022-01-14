Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED29C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 07:10:56 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.4269.1642144254522659755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 23:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T3vfR5CP;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id x22so27277909lfd.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 23:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=2YtjhA2vNTSO0yCszR1L3dhWEMixq8uqezj1ybQZJS8=;
        b=T3vfR5CPYbmmbcOeZ3Ut4AnjE3yBvQ9GgcpArzEoLLxBN2mlKHxRgelbqs5UJPxLSm
         sesjVKyLfV1JxvOWt6IJVGEa3ahJm2Q9G7q7JBzd3PQIj+72br+EkdzVU0giaD/57s+E
         rPy10rzU6zSyby8qhmA01u6GwvldUq20wfC+6yJWc+fsp4RlLdVhGrWq06LGAYESydtJ
         2xXg8vzYF6UQmSshYj7Juv9VipmW9us6VZJoPnU0jr10vcedNISgu+c4+5cqzSpO56wf
         RrPIqJbkmQ1/kttCNfsdJbJuCA+uPMKeZ2NwQdliEONktU3WN/TC/c5qeRgL855ltx93
         eO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2YtjhA2vNTSO0yCszR1L3dhWEMixq8uqezj1ybQZJS8=;
        b=kguYOFXPb3TI2/BGjAhFHw3NXkXDVQ9HPfA7NLsXsUlmxLSrMcFILkpuxld9uZTRaf
         nVUoqQ8ogskZ4YPbNjlDhx6O/8ppc5Bl0g4EBmwt0z7YoTsgzXmT7SXx/Drl4XagEKjw
         +xvOtiLl2nKAvjrDk761ngtgbmjOsM5O6JYyJqfmGUs2qp3dfyVvHPRNU/wHG/DZ/EMH
         SknK/4kRJbtDN6LV0q50xGBdSZeE8+br9zGg0sMXpl254pH6NolADWmHrtUhRZxnvfYj
         MbSRrBt6AKVvgqFuv2xpmgvU1Ba5gwtvJqYnozStYI2mmqosl19lhs1WOckrdV3Vnq1h
         sFZA==
X-Gm-Message-State: AOAM5335k+OvtN3XjKBEuY/ui9M16/qId+Y2/edXXI2Y9I82fJcF76CO
	cnQPTaK3X+IHbV6mLTXh5+4=
X-Google-Smtp-Source: 
 ABdhPJwwYv8P/wk+vmWiGOb9TpnvK7so837P3Rthm9Tgdqfjfh5omOkBhIbeYEPWK5jIAVmWYyMMkw==
X-Received: by 2002:a05:6512:3406:: with SMTP id
 i6mr6081522lfr.509.1642144252443;
        Thu, 13 Jan 2022 23:10:52 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id z23sm475203ljn.4.2022.01.13.23.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 23:10:51 -0800 (PST)
Message-ID: <a0f8bc2e-872c-4110-efb8-39cffb88be8e@gmail.com>
Date: Fri, 14 Jan 2022 08:10:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [OE-core] Zero umask when unpacking sstate packages
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <f914d2c4-b3eb-f52b-6010-0447ac874fb5@gmail.com>
 <dc7564efda700a003c380edf6e769530cce15075.camel@linuxfoundation.org>
 <60996169-d939-2a35-f6ac-8bd0edf37f1b@gmail.com>
 <1dabcf6c5f611aaaaea9eb9ac39151c296961eb3.camel@linuxfoundation.org>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <1dabcf6c5f611aaaaea9eb9ac39151c296961eb3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 07:10:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160558

On 1/13/22 23:20, Richard Purdie wrote:
> On Thu, 2022-01-13 at 23:11 +0100, Jacob Kroon wrote:
>> On 1/13/22 23:07, Richard Purdie wrote:
>>> On Thu, 2022-01-13 at 16:44 +0100, Jacob Kroon wrote:
>>>> Hi,
>>>>
>>>> I often see this diff churn in my buildistory for shadow-native (and
>>>> similar issues with icedtea7-native from meta-java):
>>>>
>>>> -drwxr-xr-x -          -                  40 ./var/spool/mail
>>>> +drwxrwxr-x -          -                  40 ./var/spool/mail
>>>>
>>>> One can reproduce it with:
>>>>
>>>> # bitbake -c cleansstate shadow-native && \
>>>>   bitbake shadow-native && \
>>>>   bitbake -c clean shadow-native && \
>>>>   bitbake shadow-native
>>>>
>>>> I see that the sstate package contains the correct permissions for
>>>> 'mail', 775. So it would seem to me that it is the unpacking from sstate
>>>> that strips the group write permission.
>>>>
>>>> Testing with the attached patch and the problem goes away.
>>>>
>>>> Is something like this the correct solution ?
>>>
>>> Is this with master?
>>>
>>> I'm wondering if your code has:
>>>
>>> https://git.yoctoproject.org/poky/commit/?id=c4ecf7c1122380cdbc74fe692aa91756dc5bdf6b
>>>
>>> applied?
>>>
>>
>> Yes, this is with master branches of bitbake/openembedded-core as of
>> right now.
>>
>> So yes, I do have that patch applied.
> 
> I guess that whilst the default task umask is 022, some chmod operations may be
> run to change permissions that don't match the umask. These are correctly
> captured by the sstate archive but not preserved by tar at extraction.
> 
> I wonder if the correct fix is to all -p to the tar unpack command in
> sstate.bbclass?
> 
> In many cases it would execute under pseudo so there wouldn't be this issue but
> a native populate_sysroot wouldn't be under pseudo do we'd only see that here...
> 

Thanks Richard, passing -p in sstate_unpack_package() also fixes the
issue. If it is run as root under pseudo for target packages, then the
-p is implicit according to the tar docs, which would explain why the
issue isn't seen there.

I'll send a new patch.

Jacob

