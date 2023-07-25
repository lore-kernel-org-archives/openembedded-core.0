Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939E1C0015E
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 10:44:43 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.17377.1690281875968400967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jul 2023 03:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=j7Oad3QK;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9936b3d0286so936087366b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 03:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690281874; x=1690886674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SsH8oHEi69vLL/1wFN4mmprtZUWPBzBWj1wMYfcdWZA=;
        b=j7Oad3QKk98jGUfFrBftQg6OEAD/t/BUcH1Hx+uyv4AOCxA3U+meLlpH9TAH/4FeQH
         ppSdvdSsh9QS41SV0ioIscKBjZrDQyw4k2jlydPFTX6rgNAU4t9jlhg8x69+Jt698OTx
         t+iC2Uzs50WjiukLDwuN/UYceI2/jfF6GnwO4UqMVKImtPDhKQMv2wvGyb2lTF6oUHGV
         SUV8o0OaeOPNb8lgVpuxfep2ScB9n3cLINU60IoDzHRbArLPZA6aXn23yewc3Jpx4Ozh
         1MYxz8NuLJSEvD3j+Cf1aGxSJbwiK+Ud424pDuyUXkV560nSlEYIMn2OpolxSa2nsCaR
         QO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690281874; x=1690886674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsH8oHEi69vLL/1wFN4mmprtZUWPBzBWj1wMYfcdWZA=;
        b=VoCmILVdFyK7qL3ppo4gA7LfioNBv9IQwUNjVlg2+CmnhT0u6wUncBmZwUVIQ73X9J
         PaeXBEAgXiKjahER8c3/9TmVr2jUDUhjrUFt1xnlgCJQBUwX1tFH51aUnSuGYyTjYBHe
         Ewxx4eiAEyOGDasPu8xV1p9pKLhnsnGH5uFvJmbJIC4zDpy/vFO2S9kVoW7nFb+wfhQ/
         INt04tv9hw4xkhoTWo0gcJP2l8gvloPN41mPRgY1UCMWbFVyOGbuc3UEzRjRqZmLLHM1
         mm9zN51KplrVNVjvfH5PmRKgtRlDfZidKcotqdU9RMcBo841jWXJWN+ndtl0gs+g82H3
         ntNA==
X-Gm-Message-State: ABy/qLbPbOvwFI6R5Bv3u7cIvK2Ecwl+ExXNagWz7knr2tG82A0qQaXU
	ju4lYBusNEn5GXq4xh3sn2c=
X-Google-Smtp-Source: APBJJlGgBm5X88CmEvioJc8dwghpsA4F4VzIPJgo3nuJZ6z5QEbosZ+N9std3iq/gP4z4n7Vb1nTQQ==
X-Received: by 2002:a17:906:9bcc:b0:991:f7cb:cc3d with SMTP id de12-20020a1709069bcc00b00991f7cbcc3dmr12346709ejc.65.1690281874026;
        Tue, 25 Jul 2023 03:44:34 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id c11-20020a170906924b00b0098e34446464sm7984214ejx.25.2023.07.25.03.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 03:44:33 -0700 (PDT)
Message-ID: <7c327500-2f9b-796f-cf58-b2ee09dda8d2@gmail.com>
Date: Tue, 25 Jul 2023 12:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] rpm: Install and/or tweak rpm macros file to
 make rpmbuild work
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>
References: <20230724123529.288581-1-zboszor@gmail.com>
 <0a32f2ba6a3d55a160423da13ffc3e3f30a1e02a.camel@linuxfoundation.org>
 <b000bd79-9788-5345-eaee-b50f27d2fe45@gmail.com>
 <fdd49f8d5f6bbf5814b9b27a400f16d367ced3ae.camel@linuxfoundation.org>
 <ec544384-9953-5448-1cd0-35d5385409f5@gmail.com>
 <594e2d0f34266070c7b257ac150d9d48d54c23d1.camel@linuxfoundation.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <594e2d0f34266070c7b257ac150d9d48d54c23d1.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jul 2023 10:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184836

2023. 07. 25. 12:29 keltezéssel, Richard Purdie írta:
> On Tue, 2023-07-25 at 12:24 +0200, Böszörményi Zoltán wrote:
>> 2023. 07. 24. 22:16 keltezéssel, Richard Purdie írta:
>>> On Mon, 2023-07-24 at 20:13 +0200, Böszörményi Zoltán wrote:
>>>> 2023. 07. 24. 17:59 keltezéssel, Richard Purdie írta:
>>>>> On Mon, 2023-07-24 at 14:35 +0200, Zoltan Boszormenyi wrote:
>>>>>> Some BSP architecture builds (e.g. genericx86-64 or anything from
>>>>>> meta-intel) don't have their /usr/lib/rpm/platform/<arch>-linux
>>>>>> directories. This causes rpmbuild fail on the target machine.
>>>>>>
>>>>>> Use ${SDK_ARCH}-linux as the base arch which likely exists in
>>>>>> /usr/lib/rpm/platform and clone it as ${MACHINE_ARCH}-linux.
>>>>>>
>>>>>> Also, fix %_lib and %_libdir in the new cloned platform directory
>>>>>> to use ${baselib} and ${libdir} so the RPM package contents will
>>>>>> be correct for library packages.
>>>>>>
>>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>> ---
>>>>>>     meta/recipes-devtools/rpm/rpm_4.18.1.bb | 13 +++++++++++++
>>>>>>     1 file changed, 13 insertions(+)
>>>>>>
>>>>>> diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>>>> index 95a9e92f96..21f0127561 100644
>>>>>> --- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>>>> +++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
>>>>>> @@ -131,7 +131,20 @@ do_install:append:class-nativesdk() {
>>>>>>     # Rpm's make install creates var/tmp which clashes with base-files packaging
>>>>>>     do_install:append:class-target() {
>>>>>>         rm -rf ${D}/var
>>>>>> +
>>>>>> +    if [ -d "${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux" ]; then
>>>>>> +        if [ ! -d ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux ]; then
>>>>>> +            cp -r ${D}${prefix}/lib/rpm/platform/${SDK_ARCH}-linux ${D}${prefix}/lib/rpm/platform/${MACHINE_ARCH}-linux
>>>>>> +        fi
>>>>>> +    fi
>>>>> SDK_ARCH should not be referenced outside of nativesdk recipes. This
>>>>> reference is almost certainly incorrect as it would make the target
>>>>> recipe dependent on the value of SDKMACHINE.
>>>> Please advise what setting should be used instead.
>>>>
>>>> MACHINE_ARCH is what ends up in /etc/rpm/platform.
>>>> TARGET_ARCH is not available in Honister but SDK_ARCH is.
>>>>
>>>> Suggest a common setting that can be used in both older and
>>>> newer Yocto versions that has the base arch name and is
>>>> usable for target builds.
>>> I'm afraid I don't understand the problem you're running into from your
>>> description so I don't know how to answer that. TARGET_ARCH has been
>>> around in OE for many years so I'd be surprised it is unavailable in
>>> honister though.
>> I usually verify variable settings via "bitbake -e packagename"
>> and what I can see is that this:
>>
>> bitbake -e rpm >rpm-vars.txt 2>&1
>> grep TARGET_ARCH rpm-vars.txt
>>
>> shows TRANSLATED_TARGET_ARCH on Honister with TARGET_ARCH missing.
>> Can I still use TARGET_ARCH in the rpm recipe on this old Yocto version?
> In honister there is this:
>
> $ grep TARGET_ARCH.*export * -R
> meta/conf/bitbake.conf:# Make sure TARGET_ARCH isn't exported
> meta/conf/bitbake.conf:TARGET_ARCH[unexport] = "1"
>
> which is why it doesn't show up in bitbake -e, the variable does exist
> though.

Thanks!

>
> Cheers,
>
> Richard


