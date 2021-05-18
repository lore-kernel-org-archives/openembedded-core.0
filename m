Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web12.6119.1621329570096634274
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 02:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mG3mU5EY;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id di13so10248801edb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 02:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Zzb9PkSmvoQbqBgDQdYIZUdQ3nyi5M1r5cQbEKFAZMA=;
        b=mG3mU5EYfvYueyWA+fLFxhEd8xFj0+zgn/93dUglFJjV05/p+tDbZJPlfFYjFUr6vy
         mD6oUIoep0B7j8u0UfAEWuxpRIbygjCTDKYLYq74Umd5ACPLzYQvH3cL/ZCbXLkpYnP3
         zIHvoUdU3kJ5w4DVY1c3O5NSPGAeW2a691j9gdoRDgUQJPYDAQXfeRjGEDiGZgybb+aP
         kBHyW07l7ZlQhZyJUcpvOrtuSdoyzobDYSdKughXeQ4pvXAzHMhSydJkN1m771E/nQec
         6y3hraCV8uw6Q+LfHtQXFI2RLWrlI2/qL+YiofujZv8FtwUqwM5pKUN6rP/hs07x8k1x
         JwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Zzb9PkSmvoQbqBgDQdYIZUdQ3nyi5M1r5cQbEKFAZMA=;
        b=WkRmk7ioNIuBNR31uYP9clp+DCMEFukQm0+MnFBSzN60XIiDXXzwZ+HpPwHXp+AlvO
         ruC4BE3UE9j0Ch58KaaWBiJxbvEmKnsB+9rfXUs6+Jfd4knqOJr8Nv5S/HhIuIB7uBu5
         Sl08BQd6BBrAetB67CMtRB2REFLyG44KYF1/7ARH2VYqbq5pKO5bqsoP0WiJRwqiEzDk
         SyN8Dd8/F+p0m53C6Cw0KVh4e/tsp4n+ivGfLhusPm9mDAQMAa8beClaCFof99cHSi7U
         Qt17B0idiqwwkNWOTFEi3XR6zpUOdbBd+18zw4LPWVsYAwmU4KNul7YvkRHBNZEf5owd
         YBOQ==
X-Gm-Message-State: AOAM533C8IHpqbDMw6WRxLsIjXbAf4GdI/jVJM45hQF4U6YDZt0EEC2u
	exRec7JG2OaZoX1bkoflOuEOfIxEu5ZHrEB1
X-Google-Smtp-Source: ABdhPJyd9m5jxD4RlImXIlyqp8/yfBY2pfow1yQhqyiG55wJuhqDINEDNhfvzu/UIRKGHWalS/U4XQ==
X-Received: by 2002:a05:6402:13c3:: with SMTP id a3mr5973789edx.18.1621329568521;
        Tue, 18 May 2021 02:19:28 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from [192.168.10.102] (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id q16sm9908289ejm.12.2021.05.18.02.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 02:19:28 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] mklibs-native: Fix build with gcc 11
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210517170104.2605486-1-jacob.kroon@gmail.com>
 <51470f7e-9267-950e-5c1c-47cc863360a1@gmail.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <197aa141-4879-ca63-7e6e-1506df47b5c0@gmail.com>
Date: Tue, 18 May 2021 11:19:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <51470f7e-9267-950e-5c1c-47cc863360a1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 5/18/21 12:20 AM, Khem Raj wrote:
> 
> 
> On 5/17/21 10:01 AM, Jacob Kroon wrote:
>> In gcc 11 the default mode for C++ is now -std=gnu++17 instead of 
>> -std=gnu++14,
>> in which support for dynamic exception specifications has been removed.
>>
>> See http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html
>>
>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>> ---
>>   .../no-dynamic-exception-specifications.patch | 420 ++++++++++++++++++
>>   .../mklibs/mklibs-native_0.1.44.bb            |   1 +
>>   2 files changed, 421 insertions(+)
>>   create mode 100644 
>> meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch 
>>
>>
>> diff --git 
>> a/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch 
>> b/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch 
>>
>> new file mode 100644
>> index 0000000000..5989a67c4f
>> --- /dev/null
>> +++ 
>> b/meta/recipes-devtools/mklibs/files/no-dynamic-exception-specifications.patch 
>>
>> @@ -0,0 +1,420 @@
>> +In gcc 11 the default mode for C++ is now -std=gnu++17 instead of 
>> -std=gnu++14,
>> +in which support for dynamic exception specifications has been removed.
>> +
>> +See http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html
>> +
>> +Upstream-Status: Pending
>> +
> 
> the patch could be submitted upstream. Please try to do so
> 

I tried to find a mailing list or maintainer I could post the patch to, 
but I'm not able to. Does anyone know who I should contact ?

Given that it sounds more likely that we'll remove mklibs, I'll try to 
forward the patch to the project, but not promising anything.

/Jacob
