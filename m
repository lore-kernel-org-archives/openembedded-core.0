Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.6231.1621582420184081698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 May 2021 00:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LOZv2oMJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id n8so5279562plf.7
        for <openembedded-core@lists.openembedded.org>; Fri, 21 May 2021 00:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lGWOXADAU7kL/WaXTKp+o9Cw5F1+JYiOBsM4dAfnToM=;
        b=LOZv2oMJr20dr1ddRE33qg3FEdn+my/cVzqwKhJ9JzdM9H/Cd0pnrJPjLOFvsilUOA
         e4V7a9ftE6XKqvzx8k7/Zuz+Loj49BUrbCnppCHlwrQtiL4ueC2+qjEmrCY2IBqZPSWz
         NOcjMlmRRn2dMzbUJICiWSnnFoXQC7TA67hjr/hfaDcROQf2SD4iCdC4C4RqUoCZ/KC0
         dMqpZ9bDENLtsTSk/y7pYZIPDsMbwXqJaf/n4L81GlC0XDKQDflx4BayAACqUNC4i5cZ
         WIUdCvjF6qsVaTKk0qWE6pANN0yYOgxur6UMhnQng7tB3SkPXBMpm75cc4P3cZ/H7d+g
         fPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lGWOXADAU7kL/WaXTKp+o9Cw5F1+JYiOBsM4dAfnToM=;
        b=kpGNjemyblffoHQWwfcky8IbD0j+3sUuqbWdGbx03X8zi/FqE5pRTyw00jV5QGCKPt
         kcmTvwbq0yIafhLrX1IiK5K1ITz821FuayMqGySSLMv287pZQ7Quk41V66HStIvIM1uZ
         mTjT97j54KrHJVmSvZsmbMfbXX9iBtOflcmDvG9tBraJbABZqAVP75C05WTuwxagM3sp
         oX6uvRRh8Haf8clEoTWJSSIhawOQTq4T85ckUY11caSl9hLTF176Xw9QeffRo2WUXshu
         bKwPGBFV9QubrL8hiAorwHSqE4L7MZ2KWkPGlo+kGwrviIfzSzp9dJB3I9vmcen5NFf5
         fNeA==
X-Gm-Message-State: AOAM530k+pqyg6xgjFbhZ+dGMWQSM9l8yOlu3vMrYI6iDjuNz1H3vFiH
	oZS04qm4XrUXAsvnMeSpvoX6ucUkO1AroA==
X-Google-Smtp-Source: ABdhPJz99ZWIPqoijlwyznn4+CNktAKcCFv4IHbICB/QkwCSIgvi9KHD9T+hNARIYNCPgfDC5c+cjQ==
X-Received: by 2002:a17:902:e851:b029:f5:372b:a70e with SMTP id t17-20020a170902e851b02900f5372ba70emr10541390plg.70.1621582419500;
        Fri, 21 May 2021 00:33:39 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::d20b? ([2601:646:9200:a0f0::d20b])
        by smtp.gmail.com with ESMTPSA id 25sm3639914pfh.39.2021.05.21.00.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 00:33:39 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] gcc: enable branch protection by standard
To: Mikko Rapeli <mikko.rapeli@bmw.de>, ross@burtonini.com
Cc: openembedded-core@lists.openembedded.org
References: <20210520171511.3177430-1-ross.burton@arm.com>
 <YKdPSn9E1MOUmJsz@korppu>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <cd4596a6-8d6b-4198-bd8e-4d99dbeae290@gmail.com>
Date: Fri, 21 May 2021 00:33:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YKdPSn9E1MOUmJsz@korppu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/20/21 11:12 PM, Mikko Rapeli wrote:
> Hi,
> 
> On Thu, May 20, 2021 at 06:15:11PM +0100, Ross Burton wrote:
>> Pass --enable-standard-branch-protection.  This is an aarch64-specific
>> option (currently) which does nothing on other targets.  On aarch64 this
>> generates code uses BTI/PAC instructions to mitigate Return Orientated
>> Programming attacks.  This approach is backwards compatible and the code
>> size/performance impact is typically negliable.
>>
>> More details can be found at
>> https://events.static.linuxfound.org/sites/events/files/slides/slides_23.pdf
> 
> Do you recommend this for dunfell and other stable releases? Any requirements
> to gcc version? What about clang?

it can be backported to dunfell, but I would not recommend it unless we 
run whole set of testing.

clang does not have convenient configure switch like gcc, so you bring 
up a good point, if we added this via cmdline options instead via 
SECURITY_CFLAGS
then it will work homogeneously across clang and gcc, perhaps that might 
be a better approach as it will also extend to other prebuilt toolchains 
which may support this option but arent configured to default to them.

Ross, some thought might be needed.


> 
> Cheers,
> 
> -Mikko
> 
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> index a64c4caf00..dc7f458b25 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
>> @@ -40,6 +40,7 @@ EXTRA_OECONF = "\
>>       ${@get_gcc_mips_plt_setting(bb, d)} \
>>       ${@get_gcc_ppc_plt_settings(bb, d)} \
>>       ${@get_gcc_multiarch_setting(bb, d)} \
>> +	--enable-standard-branch-protection \
>>   "
>>   
>>   # glibc version is a minimum controlling whether features are enabled.
>> -- 
>> 2.25.1
>>
> 
>>
>>
>>
>>
>>
>> 
>>
