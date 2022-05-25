Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05B8C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 17:44:37 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.9937.1653500666964398653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 10:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gJZTXdED;
 spf=pass (domain: linaro.org, ip: 209.85.208.174,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id a23so25272329ljd.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 10:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=RJOS4x2MRqulrLbEWgCLnGQo35KehYZA1Vis+Txc9rk=;
        b=gJZTXdEDe42eiIrRulxnkmVtIDc92f3pjCNDQUyOjuOT3xBwJWKKpq7yXf9rdt+43P
         doZkfyEnuCFdXlUYNJ7CZiyUSu0DvNU3EMNj6cUG3gec0vifUyGKZYEqT8lO/D1gP1zP
         LFOjD597VdJG50CHKsxyPbCm1tDBTqvZoWOKFTKzvM82fSdWqktkw7vqIzoHt5LzJYIA
         L91mTTB86XaAD8jvO37ZIvUWcjb8+P3Cbfe8qPi40ttkxqfwQo3xGpviXGEMlRpzfYds
         n+N/U1wjBq8g125QWShYQTQuMXCPq4dU0moIrEH3KQ0JVH9h49JjGR5Aad9EwmZjaJUC
         SdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RJOS4x2MRqulrLbEWgCLnGQo35KehYZA1Vis+Txc9rk=;
        b=7hYtf+8XAW3UUKrNKnpjFOb0K+FNOg37iLR8baghVEEWR2c+jdS0q8ZYkm3w7Y0I/b
         DgHa7hl5GQ82TMngynx8TSeclZL+ikAQbNUkLeCIsTZoNhd/2V3/RknaYYAm8pXnLFo0
         LmSY0UW3KZ76YhYOa79FVl9Ld6CSuf2YxdZsNApzG7hEvoBpCNA3/PPiUnCV10dT7AsR
         TH3v6f0mLDH+lMYh0Ddyok2p/HnKIYn6hPLdF3ubJAF5XJbQl+DxdDaB9Onu7NkWvqNQ
         DqFftmJEjVJQcVW8zo9nfCeYNcOaAZBQXSruQBOuzvPl6xRBr/RCc3a2a+cpqYy2lqUq
         PiyQ==
X-Gm-Message-State: AOAM533/o8m2GB478QhAA9jTWs5tt3v9/WhGEYmgKWRNJcjEDhErfWvI
	CvwhwcnrFYoMcedZGjCQDNHohA==
X-Google-Smtp-Source: 
 ABdhPJyouZfv4RgUtwzPz8f234frqM0wAkc+M2UAo7JXlbFd4oEdy7313JkPpD9RdcGYRAI306lRFg==
X-Received: by 2002:a2e:91d9:0:b0:253:d761:130 with SMTP id
 u25-20020a2e91d9000000b00253d7610130mr18327515ljg.7.1653500664831;
        Wed, 25 May 2022 10:44:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 w10-20020ac254aa000000b0047255d21117sm3212001lfk.70.2022.05.25.10.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 10:44:24 -0700 (PDT)
Message-ID: <63992558-2770-94fc-1db6-d1ab970d8876@linaro.org>
Date: Wed, 25 May 2022 20:44:23 +0300
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
 <413d68f9-34e0-708f-5f81-a1673d918279@linaro.org>
 <635be3636274a9d981eb585c140c2dd9c5c30284.camel@linuxfoundation.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: 
 <635be3636274a9d981eb585c140c2dd9c5c30284.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 17:44:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166159

On 25/05/2022 20:40, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2022-05-25 at 20:28 +0300, Dmitry Baryshkov wrote:
>> On 25/05/2022 20:15, richard.purdie@linuxfoundation.org wrote:
>>> On Wed, 2022-05-25 at 19:20 +0300, Dmitry Baryshkov wrote:
>>>> Building native Go tools results in the tool pointing to the wrong
>>>> location of dynamic linker (see below). The linker is looked up in the
>>>> temporary dir, which can be removed if rm_work is inherited. This
>>>> results in being unable to execute the program with the 'No such file or
>>>> directory' error. Override linker specificiation for native recipes (and
>>>> let Go build environment to pick up a correct one on it's own).
>>>>
>>>> Without this patch:
>>>>
>>>> $ ldd tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man
>>>> 	linux-vdso.so.1 (0x00007ffe945ec000)
>>>> 	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f3a7490e000)
>>>> 	/home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/work/x86_64-linux/go-md2man-native/1.0.10+gitAUTOINC+f79a8a8ca6-r0/recipe-sysroot-native/usr/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f3a74d13000)
>>>> $ tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man  --help
>>>> -bash: tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man: No such file or directory
>>>>
>>>> With the patch
>>>>
>>>> $ ldd tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man
>>>> 	linux-vdso.so.1 (0x00007ffd19dbf000)
>>>> 	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f2d44181000)
>>>> 	/lib64/ld-linux-x86-64.so.2 (0x00007f2d44586000)
>>>> $ tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man  --help
>>>> Usage of tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man:
>>>>     -in string
>>>> 	Path to file to be processed (default: stdin)
>>>>     -out string
>>>> 	Path to output processed file (default: stdout)
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    meta/classes/go.bbclass | 4 +++-
>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> This is definitely not the correct fix. It should be pointing at the
>>> uninative binaries, not the host system one.
>>
>> If uninative is enabled, installed binaries will be patched automatically:
>>
>> $ ldd
>> tmp-rpb-glibc/sysroots-components/x86_64/go-md2man-native/usr/bin/go-md2man
>> 	linux-vdso.so.1 (0x00007fff4a3ef000)
>> 	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f86998a9000)
>> 	/home/lumag/Projects/RPB/build-rpb/tmp-rpb-glibc/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 => /lib64/ld-linux-x86-64.so.2 (0x00007f8699caf000)
>>
>> However I can make this more explicit by using UNINATIVE_LOADER in
>> go.bbclass. Is that what you'd like to?
> 
> Were you using this without uninative when you sent the patch which is
> why it was breaking?

Yes, RPB distro doesn't enable uninative.

> I'd like to understand which scenarios you're testing.
> 
> Patching to the uninative loader would in some ways would be better but
> would break the non-uninative use case so this does get tricky.

Yes. So I'd propose to merge this, to unbreak non-uninative cases. As I 
said, I can try expanding it to support uninative natively.

-- 
With best wishes
Dmitry

