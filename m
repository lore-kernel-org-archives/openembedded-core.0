Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44296C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 05:23:35 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.5831.1678944208481076838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 22:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d4X2V5qs;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id eh3so2921167edb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 22:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678944206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+qJn0iC2n4M1ohL12TvykCjlDmB6xyzVK957Wv/hzv8=;
        b=d4X2V5qs8Sw+nT85DHOsCmwwkQ4CoqSpojsNpF1oIeakjR3cjtuvUNJrNXdaBIfULM
         cFaCLcgpAJzXur9ygiKs9FofFBglXD0CvIYNq6q8sDMANuLIVRj65P7KxhY4htwQEf/+
         TkJcz5jecIJntpy+uovVwfg7I35K9ZZC4H2gHw6Ioey3ETXMNOQxhmTiwEF9J421LPJS
         XcFIj1pAsnkKI3AipdVcDERy+bf9VWN77nLlxqSkn/rbYsEbNtMNcrXLOlYznmGS8T2T
         HNn5KT6hFC/S6Aui41Yf1MmZfLMm5paAHd4nt0/3S2F4wwHT4y79qhmOf+DladkuxmqZ
         oplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678944206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qJn0iC2n4M1ohL12TvykCjlDmB6xyzVK957Wv/hzv8=;
        b=gfAH3yNCGpVy/Tqv7kjYboqbGk+IkA6c48yscl4wW8/CYTotGX3iMOX12sNRLpmrPz
         uKTlCy6saAMcnEokqHxRZ9ocfVUIoNUNi0p1sICN3Bv/b4jBJWFzpcAzuxCjHf/EY6+1
         YGDegiELx02Gf75l9YqENBzoXIStvKBVwuXmOo2WpMnOmQSrt/TEbSg44W1A2uWT2Ns/
         622XlHMyJTsw+UdoM8/CVU82pLGQ30Emzub4GHKDAS4fMqk0mrBXSiUg42TPhTVb1HOK
         +fLp0x0xDSlfyZVTVHJvacgnRvbTGq0zxR3yphbPmXwaN10XILdwT3ZxD+pXCMgqvxHs
         SVqQ==
X-Gm-Message-State: AO0yUKWDmk5hWWSR/BDUehjQtcc0R9KkRCH1xKxfrvPg24gPdTsQnxWN
	pfqzZ2K7OUqv0evgUMxQP/E=
X-Google-Smtp-Source: AK7set8fuTi5rb0jtwBipu2iQ6zSX9Je6jP2HJNsr5YsxKBNtySdELQC2ZPjisgWRNCEj4lLvW21ag==
X-Received: by 2002:a17:907:a649:b0:8f2:62a9:6159 with SMTP id vu9-20020a170907a64900b008f262a96159mr10065762ejc.2.1678944206281;
        Wed, 15 Mar 2023 22:23:26 -0700 (PDT)
Received: from [192.168.1.143] (BC2440CC.dsl.pool.telekom.hu. [188.36.64.204])
        by smtp.gmail.com with ESMTPSA id pj24-20020a170906d79800b00925867d821fsm3321515ejb.120.2023.03.15.22.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 22:23:25 -0700 (PDT)
Message-ID: <b52f0012-baf9-62a6-8050-4d6e2706adae@gmail.com>
Date: Thu, 16 Mar 2023 06:23:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH] meson.bbclass: Split into meson-common and
 meson classes
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230315080020.2648416-1-zboszor@gmail.com>
 <0FA14024-12BF-4952-8E22-3D8A64B472FB@arm.com>
 <efae316a-c655-ab08-13cb-214be93b59f2@gmail.com>
 <4ffadaa158a865afd1bc4c76c79244d904fefb54.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <4ffadaa158a865afd1bc4c76c79244d904fefb54.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 05:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178672

2023. 03. 16. 0:08 keltezéssel, Richard Purdie írta:
> On Wed, 2023-03-15 at 18:20 +0100, Zoltan Boszormenyi wrote:
>> 2023. 03. 15. 17:52 keltezéssel, Ross Burton írta:
>>> On 15 Mar 2023, at 08:00, Zoltan Boszormenyi via lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org> wrote:
>>>
>>>    apart from the CONFIGURE_FILES line which would still be needed in the python-meson case anyway.
>>>
>>> I can’t see what is gained here, just inherit meson.
>> The problem is that "inherit meson python_pep517" ends up with
>>
>> do_configure () {
>>       meson_do_configure
>> }
>>
>> do_compile () {
>>       meson_do_compile
>> }
>>
>> when the python_pep517_ prefixed ones are needed.
>> It has something to do with the fact that both has the line
>>
>> EXPORT_FUNCTIONS do_configure do_compile do_install
>>
>> Which one wins may depend on inheritance order but
>> who's to say for sure and why can't this be order agnostic?
> Which one wins being due to inheritance order is by design.
>
> The export functions code adds wrappers meaning by default,
> XXXX_do_configure is called by do_configure but if needed you can write
> a custom function which does something like:
>
> do_configure () {
>      pep517_do_configure
>      meson_do_configure
>      autotools_do_configure
> }
>      
> i.e. call class specific definitions in an order of your choosing. I
> appreciate the above wouldn't make much sense but you see the idea
> behind it.

I saw a similar pattern and I did something like
that for a PyTorch recipe but it's the thing I didn't like
and felt unclean.

But in this case with meson and pep517 with build-backend = mesonpy,
meson setup/build/install would actually be run twice.

While meson setup with the same options and build may not
take much time the second time, installing can.
I am sure someone wouldn't like that.

There is a saying here that goes like "which of my fingers
should I bite to not hurt?"

>> I need most of meson.bbclass for the settings in the new
>> meta_mesonpy class to pass to meson but using the pep517
>> machinery.
> I really dislike these "common" class abstractions and I think we need
> to find a better way to handle things. Order does matter to class
> inheritance already so we can rely and document that if needed.
>
> Cheers,
>
> Richard
>


