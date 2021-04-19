Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.32.1618846162868448149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 08:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l55pJOi7;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id b17so24500838pgh.7
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WvPpOe3qZ8msTrjZUVyWO+wWZXEfCQHBp7lPd7xQKb4=;
        b=l55pJOi7/hrL28RQc772E68zlXWouEDbYakwlAGP06e7iyCZxRrIegx+ouv6ARVG9p
         4h825t2ts4hOsp6saJGiGw9p9B/cvQpM7tL6p09IDXMVMJs/Vum+tCMPuUAHVFPegEIy
         S86ricv3TY0+XGAw4MN/3Urjjl2bdCWpXPfKkPWRL+2IL8aPD1mCEtaFg/zROTtsSvAQ
         WqftccG5NJCe4pICAksnA6R5t700y+xU2uDIPSbe3jtTFqOu/LQKPvgMdxedpZtXr04H
         pYhYdiFXrMh+KcFEqJlK1p325sfqx32M8Sdy6pErThS7qiRyQ4X+uvbmOiqKX+k5y7a+
         WVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WvPpOe3qZ8msTrjZUVyWO+wWZXEfCQHBp7lPd7xQKb4=;
        b=pPOu46+OfPR0byIoxo3fc4oAwY5ZY4K/T9k/AdRr/raU5OUimjk+z/Q+GBLZmu4UJb
         u/oOj3dfImPCnDLrkz4SPrmA+UznJEXCbyW9JTs5tMJWyJKbcpaNbFJ7ZOgcAI3oi9gg
         2WPlk4W36uleVqM86ckEtw2ewGQPmt6T7vYZII5hnXhsumXl/1FVgfQKCN081/gacLlQ
         2DWEwrqZuGdMUC50NH7t5idw4wo3Pg0O69sINHssDq0SS6jWdljOCT1K14WHOX7p6apz
         RhTKOtY4/MrFQpFzVEN+umXYhjQkX2qVD0AbZ0wWikXo47qDYVzzErfQwCe+bytP2D+a
         W5jA==
X-Gm-Message-State: AOAM533WkErvuebQ3s5Tqex0R/A8nrN6sXPQ+29XBSzuyjLTANbL8Z1Q
	B2JyErwLLTAqdQZteIHxbqA=
X-Google-Smtp-Source: ABdhPJxO/1t1vymhblvsUcjZHzBT7Z8k3Eg/y/7kYYLv1/8POZx3nqeC6Ga3YZpsmnpv3POP1UPPqQ==
X-Received: by 2002:a65:4986:: with SMTP id r6mr12575994pgs.392.1618846162325;
        Mon, 19 Apr 2021 08:29:22 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:692a:2f5c:cdd4:70fe? ([2601:646:9200:a0f0:692a:2f5c:cdd4:70fe])
        by smtp.gmail.com with ESMTPSA id bj15sm14998059pjb.6.2021.04.19.08.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 08:29:21 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] ca-certificates: Fix openssl runtime cert dependencies
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org, andrei@gherzan.ro
References: <20210418225310.1624909-1-raj.khem@gmail.com>
 <YH0lv7n57pN7rsN7@korppu>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e66ba3e7-5db1-5dd2-e08b-9e625e92a460@gmail.com>
Date: Mon, 19 Apr 2021 08:29:20 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YH0lv7n57pN7rsN7@korppu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 4/18/21 11:40 PM, Mikko.Rapeli@bmw.de wrote:
> Hi,
> 
> On Sun, Apr 18, 2021 at 03:53:10PM -0700, Khem Raj wrote:
>> With commit dc778c70449ee5401b5a24ad18b22b88338c47c5, dependency was
>> moved to openssl-bin which in itself was a fine change, but dropping
>> dependency on openssl too should have been kept along, dropping this
>> meant that openssl binary wont be able to validate secure connections as
>> the CApath files wont be installed, which infact are required for
>> openssl bins to work, following call e.g. fails
>>
>> $ openssl s_client -connect google.com:443
> 
> This sounds a lot like a ptest or selftest? Maybe using
> some yocto server instead of google though.

Yeah certainly a good idea,

> 
> Cheers,
> 
> -Mikko
> 
>> ....
>> New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
>> Server public key is 256 bit
>> Secure Renegotiation IS NOT supported
>> Compression: NONE
>> Expansion: NONE
>> No ALPN negotiated
>> Early data was not sent
>> Verify return code: 20 (unable to get local issuer certificate)
>> ....
>>
>> The local issuer certs are not found in default location
>> /usr/lib/ssh-1.1/certs, this dir and its content is installed by openssl package
>> therefore re-add the dependency on openssl
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Andrei Gherzan <andrei@gherzan.ro>
>> ---
>>   .../ca-certificates/ca-certificates_20210119.bb             | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
>> index 888a235c1a..7dcc86fdc1 100644
>> --- a/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
>> +++ b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
>> @@ -83,8 +83,8 @@ do_install_append_class-native () {
>>       SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
>>   }
>>   
>> -RDEPENDS_${PN}_class-target = "openssl-bin"
>> -RDEPENDS_${PN}_class-native = "openssl-native"
>> -RDEPENDS_${PN}_class-nativesdk = "nativesdk-openssl-bin"
>> +RDEPENDS_${PN}_append_class-target = " openssl-bin openssl"
>> +RDEPENDS_${PN}_append_class-native = " openssl-native"
>> +RDEPENDS_${PN}_append_class-nativesdk = " nativesdk-openssl-bin nativesdk-openssl"
>>   
>>   BBCLASSEXTEND = "native nativesdk"
>> -- 
>> 2.31.1
>>
> 
>>
>> 
>>
