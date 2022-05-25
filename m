Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B12C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 17:29:07 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.9798.1653499737969989752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 10:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hk+pf27O;
 spf=pass (domain: linaro.org, ip: 209.85.208.171,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id m6so25266465ljb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 10:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=a0uRE6X+KHoQCsT0xFbgW+jYfQZC9IGex+ZHXsE5uqY=;
        b=hk+pf27O4CXURVzOk4uUBIWBTgaNtkQmBX6kRPfpqquqXZBUUiAsXpVzDDBdckkYKQ
         SvM4uXqLVcd1BDRDv4Q+6TDCjVKfsDGxr2QRLzayZxC5gmUsHO7rjDQQ4PYutQKT/caK
         qAWw9xJNA9+QlWGmQPz1o7RhDL0Zww8WeZSm1aPKm2RMqtdo4yN+rBQR/zHwGODskFQd
         PkmSHK3oBQHoE1LAfdE80dwSAnIsylxQFNp1cMnZ7AVmhg9JVMCkoNu9TAOYGNOF9xsd
         Mn7m3fBoAuBBKYUqYG89dkXd3jnPUHtGkax/AwsThu/eDWZYSXqpL2i+0S56fUj4bLz/
         yCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a0uRE6X+KHoQCsT0xFbgW+jYfQZC9IGex+ZHXsE5uqY=;
        b=XbKSvFDjSh/eyAxnThsbxewDSG46kgyH/HZscAv4Jja9AY9CnVEBb3j7LY+AMz6OCK
         ikZ1TIKuH4hhwAJ/LPvxJfRYmzZitALj42R3AWIaDRccQ20XCDPqwSuVgZQhNbpKjFwy
         QRHYVcpYfYImvU7AVcrK1EwCc2Q0IUAQ0ZE24kC6pt3r1smePeVNgjmKkxbVWE9O1z3k
         +EvQiRVuHvuC/NdZiXxOz8SDXAjD6M3snVst4Gsz0jV9PPmF0Q5ldrsMk3nXBhBJIK5O
         HEwk2l4SwSlfooLTKieyJNJW5AgyQ7jRIeMw3JQq6dANlTtL5dAUp/TkqFK/h/So79DC
         EAAA==
X-Gm-Message-State: AOAM532viql2Uvu2gnkMCxjezhELiAS86tA/igFhg+h+fq8mNxj98rNA
	knUEy0hP2L9Fbaqd1vX0Z/+7jw==
X-Google-Smtp-Source: 
 ABdhPJwjemt1LwHnRxe+VZVKljZNTl9VniYazXlJP7/RtILjTGYSr5ROyOHC7KMEpH9Deo2kYW1WjQ==
X-Received: by 2002:a2e:949:0:b0:253:ad20:7638 with SMTP id
 70-20020a2e0949000000b00253ad207638mr20308198ljj.73.1653499735931;
        Wed, 25 May 2022 10:28:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 o11-20020ac24e8b000000b0047255d2111esm3209086lfr.77.2022.05.25.10.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 10:28:55 -0700 (PDT)
Message-ID: <413d68f9-34e0-708f-5f81-a1673d918279@linaro.org>
Date: Wed, 25 May 2022 20:28:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [PATCH] go.bbclass: fix path to linker in native Go
 builds
Content-Language: en-GB
To: richard.purdie@linuxfoundation.org,
 Dmitry Baryshkov <dbaryshkov@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20220525162035.808477-1-dmitry.baryshkov@linaro.org>
 <2178df0a12a6f5cb7723a26bda7fc42cbc6e9c71.camel@linuxfoundation.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: 
 <2178df0a12a6f5cb7723a26bda7fc42cbc6e9c71.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 17:29:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166157

On 25/05/2022 20:15, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2022-05-25 at 19:20 +0300, Dmitry Baryshkov wrote:
>> Building native Go tools results in the tool pointing to the wrong
>> location of dynamic linker (see below). The linker is looked up in the
>> temporary dir, which can be removed if rm_work is inherited. This
>> results in being unable to execute the program with the 'No such file or
>> directory' error. Override linker specificiation for native recipes (and
>> let Go build environment to pick up a correct one on it's own).
>>
>> Without this patch:
>>
>> $ ldd tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man
>> 	linux-vdso.so.1 (0x00007ffe945ec000)
>> 	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f3a7490e000)
>> 	/home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/x86_64-linux/go-md2man-native/1.0.10+gitAUTOINC+f79a8a8ca6-r0/recipe-sysroot-native/usr/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f3a74d13000)
>> $ tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man  --help
>> -bash: tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man: No such file or directory
>>
>> With the patch
>>
>> $ ldd tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man
>> 	linux-vdso.so.1 (0x00007ffd19dbf000)
>> 	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f2d44181000)
>> 	/lib64/ld-linux-x86-64.so.2 (0x00007f2d44586000)
>> $ tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man  --help
>> Usage of tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man:
>>    -in string
>> 	Path to file to be processed (default: stdin)
>>    -out string
>> 	Path to output processed file (default: stdout)
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   meta/classes/go.bbclass | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> This is definitely not the correct fix. It should be pointing at the
> uninative binaries, not the host system one.

If uninative is enabled, installed binaries will be patched automatically:

$ ldd 
tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man
	linux-vdso.so.1 (0x00007fff4a3ef000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f86998a9000)
	/home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f8699caf000)

However I can make this more explicit by using UNINATIVE_LOADER in 
go.bbclass. Is that what you'd like to?

-- 
With best wishes
Dmitry

