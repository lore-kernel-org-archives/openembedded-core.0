Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.79849.1629437181462973422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 22:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lP+7+Bmf;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: o.kranz.88@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id q11so12339888wrr.9
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 22:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h2X+nUT4eB+FmfGWcK85z90OvOextGQ8LjI5WkJaD6E=;
        b=lP+7+BmfIJJbUd925Jhi3Sin42e7nzqUYSrHf0ATlyC4C3Xzlnj6tza5B1AIQL+CDv
         Zf28yU9JLSTZZHZZFVdzVDyvTZpeCka7CWiHLXLy5v33AbQbYT+Iy8bv1uRNQiDBP0SS
         4mUIB0DuQUBCRUzHo3y+56IxxswsoX3UUyYvOPe5VTv0975UznKem0r4fFk5peCfahru
         T4Nl4KyoG4dlFzB/s0lOmSrSiQYWBsqtnp+XEn75/R4+57sJLh0QA3TBCe0iVcbVowlC
         IVqqGn84DweDFQhkzlE4d9BXJHOkETBm+vJWbyz+yaeBxHIJACBVHBVTjKjqGoSKWp1V
         Z0Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h2X+nUT4eB+FmfGWcK85z90OvOextGQ8LjI5WkJaD6E=;
        b=sSyNyUgQl4DuKRexUgSkTC+m7obPImpIJ0t3ezH0pixDqXO7Va004bTmyNFnXJIfmg
         GZK+C10yqSHo3e7DDiA4HyQAWihQn0iI52uXvehJXUIzn4fQNQJrb3OIocozxnP7oSMn
         6QOfOIzcKltFaZzYsOemoSh43NQKcZ1oHWoJFYQpcyYgCGz53+OZSiunKdXo2vHsHXD3
         9E2NJkOzoNIXPyPgUxAAuCknRfe8TDIpXEJIn8+DRXkN1mhPJQeC4FSUD7ViMNH2CmIZ
         E2tb9RA5KzyR8/6e1CHqbXSy6RS54ResP/67iLwh8ItxNwy1hMHC0C/+gqNw/LrfuyrS
         G6iA==
X-Gm-Message-State: AOAM532NgwlZ4Qcq0LqLfAcbJ4Ll9GWXTVBFZ036BEvHybaRbs0TPfOT
	VLUYkVaYbDqvednGyWAtBaoN3paHl1s=
X-Google-Smtp-Source: ABdhPJw0/xyOHsQVL48/55i/QX1KeIGACDz4IW0zksS9y7VoOFMsggv1iekuNuI+GtPWZOR2kVWKNQ==
X-Received: by 2002:adf:9d92:: with SMTP id p18mr7736262wre.20.1629437179608;
        Thu, 19 Aug 2021 22:26:19 -0700 (PDT)
Return-Path: <o.kranz.88@gmail.com>
Received: from [172.16.1.139] (p54ab5a06.dip0.t-ipconnect.de. [84.171.90.6])
        by smtp.gmail.com with ESMTPSA id r8sm4943335wrj.11.2021.08.19.22.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 22:26:19 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] Allow global override of golang GO_DYNLINK
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20210819092200.486069-1-o.kranz.88@gmail.com>
 <CAMKF1sp3LRuBd==eBJB0dY4_a9Zq3taU40P1Xtqxg0k7mCfKqg@mail.gmail.com>
From: "Oliver Kranz" <o.kranz.88@gmail.com>
Message-ID: <0dd12edd-18eb-81b1-5fc5-39dd0719f8ef@gmail.com>
Date: Fri, 20 Aug 2021 07:26:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp3LRuBd==eBJB0dY4_a9Zq3taU40P1Xtqxg0k7mCfKqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.08.21 02:01, Khem Raj wrote:
> On Thu, Aug 19, 2021 at 2:22 AM Oliver Kranz <o.kranz.88@gmail.com> wrote:
> 
>> Small golang applications create massive memory overhead if go-runtime
>> is deployed. So it is helpfull to be able to disable the GO_DYNLINK
>> option on a per distro/local.conf basis by making it a ?= instead of =.
>>
> 
> I wonder if we should make static as default and let users go for dynamic
> link if they wish to
> 

I like the idea, but i was not sure if changing the default behavior on 
my very fist patch is a good idea.

In my tests with a hello-word and a private project on 
core-image-minimal, i could observe:

GO_DYNLINK:x86-64 = "1" -> ""
Packagesize +950%
Imagesize -63%

It may be different if a lot of golang applications are deployed but it 
would take some time to benefit from +30MB shared  go-runtime. And i 
still try to check how CGO is affected by DYNLINK. But all that could be 
handled by the recipe which generates a "too big" binary and we could 
behave like golang on the host with the option of DYNLINK.

As i am new here, should i send another patch? or how is this handled?

>>
>> Signed-off-by: Oliver Kranz <o.kranz.88@gmail.com>
>> ---
>>   meta/classes/goarch.bbclass | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>> index 48dc48dabf..92fec16b82 100644
>> --- a/meta/classes/goarch.bbclass
>> +++ b/meta/classes/goarch.bbclass
>> @@ -32,13 +32,13 @@ BASE_GOARM:armv5 = '5'
>>   # Go supports dynamic linking on a limited set of architectures.
>>   # See the supportsDynlink function in
>> go/src/cmd/compile/internal/gc/main.go
>>   GO_DYNLINK = ""
>> -GO_DYNLINK:arm = "1"
>> -GO_DYNLINK:aarch64 = "1"
>> -GO_DYNLINK:x86 = "1"
>> -GO_DYNLINK:x86-64 = "1"
>> -GO_DYNLINK:powerpc64 = "1"
>> -GO_DYNLINK:powerpc64le = "1"
>> -GO_DYNLINK:class-native = ""
>> +GO_DYNLINK:arm ?= "1"
>> +GO_DYNLINK:aarch64 ?= "1"
>> +GO_DYNLINK:x86 ?= "1"
>> +GO_DYNLINK:x86-64 ?= "1"
>> +GO_DYNLINK:powerpc64 ?= "1"
>> +GO_DYNLINK:powerpc64le ?= "1"
>> +GO_DYNLINK:class-native ?= ""
>>   GO_DYNLINK:class-nativesdk = ""
>>
>>   # define here because everybody inherits this class
>> --
>> 2.32.0
>>
>>
>> 
>>
>>
> 

