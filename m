Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AF6C5AE59
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 16:28:27 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.25407.1748536104501520295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 09:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TqSVYnBD;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2d0920ce388so578081fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748536103; x=1749140903; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hI2NSLlBlt7wy56FWRcBSu4jgjEptyEHgqGTEWIerFM=;
        b=TqSVYnBDNb6OMJ4TmiKU6UNY+N7w660OVqMdSX41pds1iJo8LaB9RTX2Z3x9wr4aqX
         U2i1zJTxN1xqHGyxc3e9xNxb7aE0xszqIU7r2mZn6gTzwSZldiJUY9Q4fn67FNuua+l5
         +nWafp+w9UECQoifCEbFezGUnfjicQNkqbz6Mw/gCe7UDPrrk4BoH8bLuLiTtzEFu1Hb
         FY4bDFVeHrClXoqtn/6C29rVHHuwl311HGqBijS1heojFkF1ArjXczuMy6xb4J/cIAn5
         5WCzZDacMPH5iqB1GenXjfd8r6X7fibrbOLUsNDj03SaJdvmkZZAzet3i6tAecPzRMWS
         zE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748536103; x=1749140903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hI2NSLlBlt7wy56FWRcBSu4jgjEptyEHgqGTEWIerFM=;
        b=c003oaGlD37GMt30eOBFebbsHx/Tr2qaG+4L/OI/0n8noY4ECfNRlnsQai+RItmK9v
         9FRlkhxkT+rz2br3sqKxfHQ8sjpLrC7f3Zw4lekzygD4PNXu3MS36zbWqGTsJVR6Ea8N
         LyE+dPdpor0uEwsPlg4fjLnIsL9YxthgZZk5zumkUFgopdB6pqrX8Plz969TZ/as+RZk
         eS1H1ihGl5zRMvy/A/rsYgp3pKvQCWhRdjo7btqObCaXaxd6DJCTsF+u/ViRqUM7VWKm
         f35hClTBA6yVR/gF7ttFIYraGpxsrpnPxF3JJDAC/xM1lqD6Q5QwP12GAhjYCdCOXY6h
         LPpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGpbJj1RG9qL5bVrco4O82JI27DQ3J2ifD/hV+S91m4gQM8TocEILUzLgOHOIrKtYEK9dggkUtN3kq4qaAd2/4PQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz0u4yVTRmXpCwlKrrres+hzVERrtEg5sqHPAW9y3gUiUHMDppY
	QgptgZ8SkNXOBfLXybIFVa8a8xfNhgbh4N6lBoUHD/2+GpHW3TJjXYXU
X-Gm-Gg: ASbGncsumlsqrP3YnZtKNqBIRv/56gbIPEouhKPTPuUcZfS85zOOCYUFYlzTTWayYzw
	sOxz8KFL4fyFKrgv9gn4aCHrfeYDcIwG8ix3QSSW8Npxf8agXaMJ9QiadJADqYtai+7flUBdvZ6
	qpf8+F1oyKh5aUOVtdqS51DKoX3EECC3YyF1seGdxjmVSlTf0eySfCcFPXiIsQRIWS37shWsfuh
	iJE5DzLzuPtDt1x13vfUHY5xdQ4LUfiw8W5/fVE5pJbd9x/2votwRdiSh5623oWtIgCrZT8Nr96
	kzdK5dDfm4robAJoPZwd+WxLgAX91UvYUq40fZqA2icpnJRxFmB+dSu1vvHXFwxsQNc9lJ2Q8PK
	zwLq0vuCexKcHSNZTDMH0QlHaitGiTeiJOjw/YK5uvoj9QEs9CVPY/As=
X-Google-Smtp-Source: AGHT+IG6O2hvz3D/bFhxFU7hHObm7XoqvUOO6kPMNALsEpNCFcUsxW99tzLfHl4QYujld3KjmC5oyg==
X-Received: by 2002:a05:6870:8092:b0:2d9:3868:b310 with SMTP id 586e51a60fabf-2e907ca45ffmr1383493fac.11.1748536103541;
        Thu, 29 May 2025 09:28:23 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:2986:9b50:188d:1984? ([2601:646:8201:fd20:2986:9b50:188d:1984])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e906457afesm326568fac.1.2025.05.29.09.28.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 09:28:23 -0700 (PDT)
Message-ID: <e019bc45-77c9-4c04-905f-d4e0cdaa01b4@gmail.com>
Date: Thu, 29 May 2025 09:28:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 06/13] libjpeg-turbo: Fix build on mips/clang
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
 <20250522-clang-toolchain-v3-6-16cfc6d9891b@gmail.com>
 <8779472af099d97425a52fe97f63f5c5e13e9655.camel@linuxfoundation.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <8779472af099d97425a52fe97f63f5c5e13e9655.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 16:28:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217419



On 5/29/25 2:22 AM, Richard Purdie wrote:
> On Thu, 2025-05-22 at 20:52 -0700, Khem Raj via lists.openembedded.org
> wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
>> b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
>> index
>> 8533bd8525311e783572cbafb6fccf240db9e0e8..90aa2ef43956f0a1e64f8e08e47
>> d953bf5773e19 100644
>> --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
>> +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
>> @@ -47,6 +47,12 @@ EXTRA_OECMAKE:append:class-target:powerpc64le = "
>> ${@bb.utils.contains("TUNE_FEA
>>   DEBUG_OPTIMIZATION:append:armv4 = "
>> ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-
>> pointer', '', d)}"
>>   DEBUG_OPTIMIZATION:append:armv5 = "
>> ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-
>> pointer', '', d)}"
>>   
>> +# libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
>> +# <instantiation>:13:5: error: invalid token in expression
>> +# .if $17 != 0
>> +# ^
>> +CFLAGS:append:toolchain-clang:mipsarch = " -no-integrated-as"
>> +
>>   PACKAGES =+ "jpeg-tools libturbojpeg"
> 
> I noticed you use "-no-integrated-as" but in the next patch in pixman,
> you use "-fno-integrated-as". Should we be consistent or are these
> different?

they are effectively same. -no-integrated-as is legacy clang option 
format while -fno-integrated-as is more in line with gcc options
it's generally better to use -fno-integrated-as since it follows the 
conventional flag naming pattern that other compilers might also recognize.

I will change it in a follow up for consistency.

> 
> Cheers,
> 
> Richard


