Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D80C001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 10:24:13 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.17150.1690280644904595761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 03:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=MejuZzwe;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-991ef0b464cso1364282866b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 03:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690280643; x=1690885443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SiHLGYHYlW0tZ/+JaEm8X9zMGgWblIYE0yz0o55HFm4=;
        b=MejuZzwerF+fY6uw3VsX5o0nNM8gtrZhE9hR+FJhqa2BaNHjslm6Igp46bqd9Ni0EU
         KUnvrt7AZyKeR8j0n7V7M91oHS6mXsm5JKsJqZi2iHHvimei2itsGjAO8NO6QmrrvoGE
         C7xpRuf2XQ1t/pu1umPTTAwEGbd0niXwCfmkoxxTx/KZ4CGhpKttViwwOPNbqJhnPLqi
         2SCyR06XxWfp8fXvexqyxZ1kY97XVCUYfcDKkfqn2ai566Qwu0KbDJVXie/EQDFslAla
         pC2Xs3384YRXo3US7F7lxddARk/ylWxGCVzijDAXJi+rrM/dKp02RSxk3LTWftnih45X
         DArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280643; x=1690885443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SiHLGYHYlW0tZ/+JaEm8X9zMGgWblIYE0yz0o55HFm4=;
        b=SE43IlYPDr5wxXA14/ygg11x4NEQEnB8GVU59X+mQ3mhZcitqxt3WvLWPjj87/hmlm
         mSBrjvLR2hYvyicHu1I9FLIyA94RzzTYviaGK9mogBaqbocIi7EJT/0ftCWyReNb5uNL
         NlXSEc/NNvLeRtJ8WiKdkVpyyDBssPtflJrQrkQHCQX3xEs7byFVkuRN7ejztM8YfqIS
         MZ/A8Dxt6v1C7qDad9C0+wctjTi4pKdF7fEICTuR0yHuGfy3TduZeEluJ+g/AxVQu7u+
         1hR+iB6uUNBsO1ou4PHOhgDR36c6auN3cQlAhrU7xUL4ElBvNKSS7iHsaBQaVdSOUmbK
         batg==
X-Gm-Message-State: ABy/qLZarfw3NdQ1PmTwNKatr50nQJYYbGNoIw3jrgTsxXdII1GUx8ap
	fGmjmiZHlb2teyvWNSJPZ7M=
X-Google-Smtp-Source: APBJJlH/7SZzpjADWa9tk3AUIbcAtMdJLeTwnK7HBKKkejj2IO6qaQRZeJ2LO9c7Qdbq5OLyh3Cd8g==
X-Received: by 2002:a17:907:2d89:b0:988:d841:7f90 with SMTP id gt9-20020a1709072d8900b00988d8417f90mr2163145ejc.27.1690280642996;
        Tue, 25 Jul 2023 03:24:02 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id j22-20020a170906831600b0098951bb4dc3sm7906327ejx.184.2023.07.25.03.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 03:24:02 -0700 (PDT)
Message-ID: <ec544384-9953-5448-1cd0-35d5385409f5@gmail.com>
Date: Tue, 25 Jul 2023 12:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>
References: <20230724123529.288581-1-zboszor@gmail.com>
 <0a32f2ba6a3d55a160423da13ffc3e3f30a1e02a.camel@linuxfoundation.org>
 <b000bd79-9788-5345-eaee-b50f27d2fe45@gmail.com>
 <fdd49f8d5f6bbf5814b9b27a400f16d367ced3ae.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <fdd49f8d5f6bbf5814b9b27a400f16d367ced3ae.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 10:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184830

2023. 07. 24. 22:16 keltezéssel, Richard Purdie írta:
> On Mon, 2023-07-24 at 20:13 +0200, Böszörményi Zoltán wrote:
>> 2023. 07. 24. 17:59 keltezéssel, Richard Purdie írta:
>>> On Mon, 2023-07-24 at 14:35 +0200, Zoltan Boszormenyi wrote:
>>>> Some BSP architecture builds (e.g. genericx86-64 or anything from
>>>> meta-intel) don't have their /usr/lib/rpm/platform/<arch>-linux
>>>> directories. This causes rpmbuild fail on the target machine.
>>>>
>>>> Use ${SDK_ARCH}-linux as the base arch which likely exists in
>>>> /usr/lib/rpm/platform and clone it as ${MACHINE_ARCH}-linux.
>>>>
>>>> Also, fix %_lib and %_libdir in the new cloned platform directory
>>>> to use ${baselib} and ${libdir} so the RPM package contents will
>>>> be correct for library packages.
>>>>
>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>> ---
>>>>    meta/recipes-devtools/rpm/rpm_4.18.1.bb | 13 +++++++++++++
>>>>    1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>> index 95a9e92f96..21f0127561 100644
>>>> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>> @@ -131,7 +131,20 @@ do_install:append:class-nativesdk() {
>>>>    # Rpm's make install creates var/tmp which clashes with base-files packaging
>>>>    do_install:append:class-target() {
>>>>        rm -rf ${D}/var
>>>> +
>>>> +    if [ -d "${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux" ]; then
>>>> +        if [ ! -d ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux ]; then
>>>> +            cp -r ${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux
>>>> +        fi
>>>> +    fi
>>> SDK_ARCH should not be referenced outside of nativesdk recipes. This
>>> reference is almost certainly incorrect as it would make the target
>>> recipe dependent on the value of SDKMACHINE.
>> Please advise what setting should be used instead.
>>
>> MACHINE_ARCH is what ends up in /etc/rpm/platform.
>> TARGET_ARCH is not available in Honister but SDK_ARCH is.
>>
>> Suggest a common setting that can be used in both older and
>> newer Yocto versions that has the base arch name and is
>> usable for target builds.
> I'm afraid I don't understand the problem you're running into from your
> description so I don't know how to answer that. TARGET_ARCH has been
> around in OE for many years so I'd be surprised it is unavailable in
> honister though.

I usually verify variable settings via "bitbake -e packagename"
and what I can see is that this:

bitbake -e rpm >rpm-vars.txt 2>&1
grep TARGET_ARCH rpm-vars.txt

shows TRANSLATED_TARGET_ARCH on Honister with TARGET_ARCH missing.
Can I still use TARGET_ARCH in the rpm recipe on this old Yocto version?

> I do know that SDK_ARCH is incorrect here though.

This is why I asked to suggest the correct setting name.

>   To prove what I'm
> saying, try setting SDKMACHINE = "i686" and then check the value of
> SDK_ARCH compared to when SDKMACHINE = "x86_64" (or "aarch64").
>
> Cheers,
>
> Richard


